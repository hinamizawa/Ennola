param([Parameter(Mandatory)][string]$RunDirectory,[string]$Name='replay')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$RunDirectory=[IO.Path]::GetFullPath($RunDirectory)
$replayDir=Join-Path $RunDirectory $Name
if(Test-Path -LiteralPath $replayDir){throw 'Replay directory already exists; use a fresh name.'}
New-Item -ItemType Directory -Path $replayDir | Out-Null
$records=@(Get-ChildItem -LiteralPath $RunDirectory -Filter results.jsonl -Recurse | ForEach-Object {Get-Content -LiteralPath $_.FullName | ForEach-Object {$_ | ConvertFrom-Json -DateKind String}} | Where-Object status -eq 'certified_rank_at_least_five' | Sort-Object s)
$lines=[Collections.Generic.List[string]]::new()
$lines.Add('ReplayCertificates := [*')
$certificates=@()
foreach($record in $records){
    $output=[IO.File]::ReadAllText($record.log)
    $points=[regex]::Matches($output,'(?m)^POINT index=(\d+) x=([^\s]+) y=([^\s]+)')
    $witnesses=[regex]::Matches($output,'(?m)^WITNESS p=(\d+) r=(\d+) bits=\[([01, ]+)\]')
    if($points.Count -ne 5 -or $witnesses.Count -ne 5){throw "Incomplete certificate at s=$($record.s)"}
    $coordinates=@($points | ForEach-Object { ,@($_.Groups[2].Value,$_.Groups[3].Value) })
    $coordsText=@($points | ForEach-Object { '[Rationals() | '+$_.Groups[2].Value+','+$_.Groups[3].Value+']' }) -join ','
    $wsText=@($witnesses | ForEach-Object { '<'+$_.Groups[1].Value+','+$_.Groups[2].Value+'>' }) -join ','
    $rowsText=@($witnesses | ForEach-Object { '['+$_.Groups[3].Value.Trim()+']' }) -join ','
    $lines.Add('<'+$record.s+',['+$coordsText+'],['+$wsText+'],['+$rowsText+']>,')
    $certificates+=@{s=$record.s;a=$record.a;coordinates=$coordinates;log=$record.log;output_sha256=$record.output_sha256}
}
if($records.Count -eq 0){throw 'No certificates available.'}
$lines[$lines.Count-1]=$lines[$lines.Count-1].TrimEnd(',')
$lines.Add('*];')
$lines.Add([IO.File]::ReadAllText((Join-Path $projectRoot 'Computations/replay-integer-rank-five.m')))
$inputPath=Join-Path $replayDir 'input.m'
[IO.File]::WriteAllLines($inputPath,$lines,[Text.UTF8Encoding]::new($false))
$certificates | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $replayDir 'certificates.json') -Encoding utf8
$start=[DateTimeOffset]::UtcNow
$logPath=Join-Path $replayDir 'output.log'
& 'C:/Program Files (x86)/Magma/magma.exe' -n -S 1 -b $inputPath *> $logPath
$exitCode=$LASTEXITCODE
$output=[IO.File]::ReadAllText($logPath)
$passed=$exitCode -eq 0 -and $output -match '(?m)^ENNOLA_INTEGER_RANK_FIVE_REPLAY_PASS\s*$' -and $output -notmatch '(?im)\b(runtime|user|syntax|internal|fatal|system)\s+error\b|assertion\s+(failed|failure)|not declared or assigned|out of memory'
$record=@{status=($(if($passed){'pass'}else{'failed'}));count=$records.Count;started_utc=$start.ToString('o');finished_utc=[DateTimeOffset]::UtcNow.ToString('o');exit_code=$exitCode;input_sha256=(Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash;output_sha256=(Get-FileHash -LiteralPath $logPath -Algorithm SHA256).Hash;command=@('C:/Program Files (x86)/Magma/magma.exe','-n','-S','1','-b',$inputPath)}
$record | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $replayDir 'record.json') -Encoding utf8
$record | ConvertTo-Json -Depth 10
if(-not $passed){Get-Content -LiteralPath $logPath;exit 1}
