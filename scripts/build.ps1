param(
    [string]$Source = 'Draft/ennola-squareclasses.tex',
    [string]$OutputDirectory = 'build/manuscript'
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$sourcePath = (Resolve-Path -LiteralPath (Join-Path $projectRoot $Source)).Path
$outputPath = [IO.Path]::GetFullPath((Join-Path $projectRoot $OutputDirectory))
if (-not $outputPath.StartsWith($projectRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'The build output must remain inside this project.'
}
$engine = 'C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe'
$bibtex = 'C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/bibtex.exe'
foreach ($tool in @($engine, $bibtex)) {
    if (-not (Test-Path -LiteralPath $tool)) { throw "Missing tool: $tool" }
}
New-Item -ItemType Directory -Path $outputPath -Force | Out-Null
$sourceDirectory = Split-Path -Parent $sourcePath
$jobName = 'ennola-squareclasses'
$inputs = @($sourcePath, (Join-Path $sourceDirectory 'ennola.bib'), (Join-Path $sourceDirectory 'publmathdeb.cls'))
$inputHashes = @($inputs | ForEach-Object { Get-FileHash -LiteralPath $_ -Algorithm SHA256 | Select-Object Path,Hash })
$stagedSource = Join-Path $outputPath "$jobName.tex"
Copy-Item -LiteralPath $sourcePath -Destination $stagedSource -Force
Copy-Item -LiteralPath (Join-Path $sourceDirectory 'ennola.bib') -Destination (Join-Path $outputPath 'ennola.bib') -Force
Copy-Item -LiteralPath (Join-Path $sourceDirectory 'publmathdeb.cls') -Destination (Join-Path $outputPath 'publmathdeb.cls') -Force
$commands = [Collections.Generic.List[object]]::new()
Push-Location $outputPath
try {
    for ($pass = 1; $pass -le 5; $pass++) {
        $arguments = @('-disable-installer', '-no-shell-escape', '-interaction=nonstopmode', '-halt-on-error', '-file-line-error', "-jobname=$jobName", "-output-directory=$outputPath", $stagedSource)
        $logPath = Join-Path $outputPath "pdflatex-pass-$pass.txt"
        & $engine @arguments *> $logPath
        $code = $LASTEXITCODE
        $commands.Add([ordered]@{tool=$engine; arguments=$arguments; exit_code=$code; log=$logPath})
        if ($code -ne 0) { Get-Content -LiteralPath $logPath -Tail 50; throw "LaTeX pass $pass failed." }
        if ($pass -eq 1) {
            $arguments = @((Join-Path $outputPath $jobName))
            $logPath = Join-Path $outputPath 'bibtex-output.txt'
            & $bibtex @arguments *> $logPath
            $code = $LASTEXITCODE
            $commands.Add([ordered]@{tool=$bibtex; arguments=$arguments; exit_code=$code; log=$logPath})
            if ($code -ne 0) { Get-Content -LiteralPath $logPath; throw 'BibTeX failed.' }
        }
        if ($pass -ge 3) {
            $passLog = Get-Content -LiteralPath (Join-Path $outputPath "$jobName.log") -Raw
            if ($passLog -notmatch 'Rerun to get cross-references right|There were undefined references|Citation .+ undefined|Reference .+ undefined') { break }
        }
    }
} finally {
    Pop-Location
    [ordered]@{date='2026-10-02'; source=$sourcePath; inputs=$inputHashes; commands=$commands.ToArray()} | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $outputPath 'build-record.json') -Encoding utf8
}
$log = Get-Content -LiteralPath (Join-Path $outputPath "$jobName.log") -Raw
if ($log -match 'There were undefined references|Citation .+ undefined|Reference .+ undefined|Rerun to get cross-references right|has been referenced but does not exi') {
    throw 'Unresolved references remain; inspect the final log.'
}
Select-String -LiteralPath (Join-Path $outputPath "$jobName.log") -Pattern 'Warning|Overfull|Underfull|Output written'
Get-FileHash -LiteralPath (Join-Path $outputPath "$jobName.pdf") -Algorithm SHA256
