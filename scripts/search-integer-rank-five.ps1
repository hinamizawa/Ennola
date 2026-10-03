param(
    [string]$RunDirectory,
    [int]$Workers = 4,
    [int]$MaxAbsS = 5000,
    [int]$DenominatorBound = 120,
    [int]$ResiduePrimeBound = 1009,
    [int]$WallSeconds = 7200,
    [int]$JobSeconds = 60,
    [string]$SearchSource = 'Computations/search-integer-rank-five.m',
    [switch]$Worker,
    [int]$Lane = 0,
    [string]$DeadlineUtc
)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$magmaPath = 'C:/Program Files (x86)/Magma/magma.exe'
$sourcePath = if ([IO.Path]::IsPathRooted($SearchSource)) { [IO.Path]::GetFullPath($SearchSource) } else { Join-Path $projectRoot $SearchSource }
if (-not $RunDirectory) { $RunDirectory = Join-Path $projectRoot ('build/integer-rank-five-' + [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')) }
$RunDirectory = [IO.Path]::GetFullPath($RunDirectory)
if (-not $RunDirectory.StartsWith(([IO.Path]::GetFullPath((Join-Path $projectRoot 'build')) + [IO.Path]::DirectorySeparatorChar), [StringComparison]::OrdinalIgnoreCase)) { throw 'Run directory must be under this project build directory.' }
if ($Workers -lt 1 -or $Workers -gt 8 -or $WallSeconds -lt 1 -or $WallSeconds -gt 7200 -or $MaxAbsS -lt 2) { throw 'Invalid search limits.' }
function WriteJson($Path,$Value) { $Value | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $Path -Encoding utf8 }
function Hash($Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash }
if ($Worker) {
    $deadline = [DateTimeOffset]::Parse($DeadlineUtc)
    $template = [IO.File]::ReadAllText($sourcePath)
    $laneDir = Join-Path $RunDirectory "lane-$Lane"
    New-Item -ItemType Directory -Path $laneDir -Force | Out-Null
    # Partition both signs, with no overlap between workers.
    $ordinal = 0
    for ($magnitude = 2; $magnitude -le $MaxAbsS; $magnitude++) {
        foreach ($s in @($magnitude,-$magnitude)) {
            $myJob = ($ordinal % $Workers) -eq $Lane
            $ordinal++
            if (-not $myJob) { continue }
            if ([DateTimeOffset]::UtcNow -ge $deadline) { break }
            $a = 3L*$s*$s+$s-6
            if ($a -lt 3) { continue }
            $jobDir = Join-Path $laneDir "s-$s"
            New-Item -ItemType Directory -Path $jobDir -Force | Out-Null
            $inputPath = Join-Path $jobDir 'input.m'
            $logPath = Join-Path $jobDir 'output.log'
            $errPath = Join-Path $jobDir 'stderr.log'
            $inputText = "SearchS := $s; DenominatorBound := $DenominatorBound; ResiduePrimeBound := $ResiduePrimeBound;`n" + $template
            [IO.File]::WriteAllText($inputPath,$inputText,[Text.UTF8Encoding]::new($false))
            $record = [ordered]@{ s=$s; a=$a; route='local'; status='running'; started_utc=[DateTimeOffset]::UtcNow.ToString('o'); lane=$Lane; seed=1; denominator_bound=$DenominatorBound; residue_prime_bound=$ResiduePrimeBound; input_sha256=(Hash $inputPath); source_sha256=(Hash $sourcePath); command=@($magmaPath,'-n','-S','1','-b',$inputPath); deadline_utc=$DeadlineUtc; job_seconds=$JobSeconds }
            WriteJson (Join-Path $jobDir 'record.json') $record
            $process = Start-Process -FilePath $magmaPath -ArgumentList @('-n','-S','1','-b',('"'+$inputPath+'"')) -WorkingDirectory $projectRoot -WindowStyle Hidden -RedirectStandardOutput $logPath -RedirectStandardError $errPath -PassThru
            $record['pid'] = $process.Id
            WriteJson (Join-Path $laneDir 'active.json') $record
            $clock = [Diagnostics.Stopwatch]::StartNew()
            $stopReason = $null
            while (-not $process.HasExited) {
                if ([DateTimeOffset]::UtcNow -ge $deadline) { $stopReason='wall_limit'; break }
                if ($clock.Elapsed.TotalSeconds -ge $JobSeconds) { $stopReason='job_timeout'; break }
                $process.Refresh()
                if ($process.WorkingSet64 -gt 700MB) { $stopReason='memory_limit'; break }
                Start-Sleep -Milliseconds 200
            }
            if ($stopReason -and -not $process.HasExited) { $process.Kill(); $process.WaitForExit() }
            $process.WaitForExit()
            $output = [IO.File]::ReadAllText($logPath)
            $errors = [IO.File]::ReadAllText($errPath)
            $hasError = ($output + $errors) -match '(?im)\b(runtime|user|syntax|internal|fatal|system)\s+error\b|assertion\s+(failed|failure)|not declared or assigned|out of memory'
            $pass = $output -match '(?m)^ENNOLA_INTEGER_RANK_FIVE_CERTIFICATE_PASS\s*$'
            $complete = $output -match '(?m)^ENNOLA_INTEGER_RANK_FIVE_SEARCH_COMPLETE\s*$'
            $record['exit_code'] = $process.ExitCode
            $record['wall_seconds'] = [Math]::Round($clock.Elapsed.TotalSeconds,3)
            $record['finished_utc'] = [DateTimeOffset]::UtcNow.ToString('o')
            $record['output_sha256'] = Hash $logPath
            $record['stderr_sha256'] = Hash $errPath
            $record['pass_marker'] = $pass
            $record['error_detected'] = $hasError
            $version = [regex]::Match($output,'(?m)^MAGMA_VERSION=(.+)$')
            $record['magma_version'] = $version.Groups[1].Value.Trim()
            $record['status'] = if ($stopReason) { $stopReason } elseif ($hasError -or $process.ExitCode -ne 0) { 'magma_error' } elseif ($pass) { 'certified_rank_at_least_five' } elseif ($complete) { 'bounded_search_no_certificate' } else { 'incomplete_output' }
            $record['log'] = $logPath
            WriteJson (Join-Path $jobDir 'record.json') $record
            ($record | ConvertTo-Json -Compress -Depth 10) | Add-Content -LiteralPath (Join-Path $laneDir 'results.jsonl') -Encoding utf8
            WriteJson (Join-Path $laneDir 'active.json') @{status='idle';last_s=$s}
            if ($stopReason -eq 'wall_limit') { break }
        }
        if ([DateTimeOffset]::UtcNow -ge $deadline) { break }
    }
    WriteJson (Join-Path $laneDir 'done.json') @{finished_utc=[DateTimeOffset]::UtcNow.ToString('o');lane=$Lane}
    exit
}
if (Test-Path -LiteralPath $RunDirectory) { throw 'Choose a fresh run directory; old evidence is never overwritten.' }
New-Item -ItemType Directory -Path $RunDirectory | Out-Null
$start = [DateTimeOffset]::UtcNow
$deadline = $start.AddSeconds($WallSeconds)
$manifest = [ordered]@{status='running';started_utc=$start.ToString('o');deadline_utc=$deadline.ToString('o');wall_limit_seconds=$WallSeconds;workers=$Workers;max_abs_s=$MaxAbsS;denominator_bound=$DenominatorBound;residue_prime_bound=$ResiduePrimeBound;per_job_seconds=$JobSeconds;memory_limit_mb=700;search_source_sha256=(Hash $sourcePath);runner_sha256=(Hash $PSCommandPath);manuscript_sha256=(Hash (Join-Path $projectRoot 'Draft/ennola-squareclasses.tex'));submission_sha256=(Hash (Join-Path $projectRoot 'Draft/ennola-squareclasses-submission.tex'));known_previously_listed_s=@(-54,-46,-42,-40,-39,-38,17,23,42,45,55);method='exact rational points and invertible 5 by 5 residue squareclass matrix; no full-rank claim'}
WriteJson (Join-Path $RunDirectory 'manifest.json') $manifest
$processes = @()
for ($i=0;$i -lt $Workers;$i++) {
    $workerArgs = @('-NoProfile','-File',('"'+$PSCommandPath+'"'),'-Worker','-Lane',$i,'-Workers',$Workers,'-RunDirectory',('"'+$RunDirectory+'"'),'-MaxAbsS',$MaxAbsS,'-DenominatorBound',$DenominatorBound,'-ResiduePrimeBound',$ResiduePrimeBound,'-WallSeconds',$WallSeconds,'-JobSeconds',$JobSeconds,'-SearchSource',('"'+$sourcePath+'"'),'-DeadlineUtc',$deadline.ToString('o'))
    $p = Start-Process -FilePath (Get-Process -Id $PID).Path -ArgumentList $workerArgs -WindowStyle Hidden -RedirectStandardOutput (Join-Path $RunDirectory "worker-$i.stdout") -RedirectStandardError (Join-Path $RunDirectory "worker-$i.stderr") -PassThru
    $processes += $p
}
$manifest['worker_pids'] = @($processes | ForEach-Object { $_.Id })
$manifest['search_source_path'] = $sourcePath
WriteJson (Join-Path $RunDirectory 'manifest.json') $manifest
while (@($processes | Where-Object { -not $_.HasExited }).Count -gt 0) {
    Start-Sleep -Seconds 5
    $results = @(Get-ChildItem -LiteralPath $RunDirectory -Filter results.jsonl -Recurse | ForEach-Object { Get-Content -LiteralPath $_.FullName | ForEach-Object { $_ | ConvertFrom-Json } })
    $hits = @($results | Where-Object status -eq 'certified_rank_at_least_five')
    WriteJson (Join-Path $RunDirectory 'progress.json') @{updated_utc=[DateTimeOffset]::UtcNow.ToString('o');elapsed_seconds=[Math]::Round(([DateTimeOffset]::UtcNow-$start).TotalSeconds,1);completed=$results.Count;certified=$hits.Count;new_certified=@($hits | Where-Object s -NotIn $manifest.known_previously_listed_s | ForEach-Object s);active_workers=@($processes | Where-Object { -not $_.HasExited } | ForEach-Object Id)}
}
$results | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $RunDirectory 'results.json') -Encoding utf8
$hits | Select-Object s,a,status,magma_version,wall_seconds,log | Export-Csv -LiteralPath (Join-Path $RunDirectory 'certified.csv') -NoTypeInformation -Encoding utf8
$manifest['status']='finished'
$manifest['finished_utc']=[DateTimeOffset]::UtcNow.ToString('o')
$manifest['completed']=$results.Count
$manifest['certified']=$hits.Count
$manifest['worker_exit_codes']=@($processes | ForEach-Object ExitCode)
$manifest['manuscript_preserved']=(Hash (Join-Path $projectRoot 'Draft/ennola-squareclasses.tex')) -eq $manifest.manuscript_sha256
$manifest['submission_preserved']=(Hash (Join-Path $projectRoot 'Draft/ennola-squareclasses-submission.tex')) -eq $manifest.submission_sha256
WriteJson (Join-Path $RunDirectory 'manifest.json') $manifest
Write-Output ($manifest | ConvertTo-Json -Depth 10)
