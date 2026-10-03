param([string]$OutputDirectory = 'build/ennola-pmd-submission-2026-10-02')

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$destination = [IO.Path]::GetFullPath((Join-Path $projectRoot $OutputDirectory))
if (-not $destination.StartsWith($projectRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'The package must remain inside this project.'
}
if (Test-Path -LiteralPath $destination) { throw 'Use a new package directory; existing exports are preserved.' }
$main = Join-Path $projectRoot 'Draft/ennola-squareclasses.tex'
$candidate = Join-Path $projectRoot 'Draft/ennola-squareclasses-submission.tex'
$staged = Join-Path $projectRoot 'build/manuscript/ennola-squareclasses.tex'
$expected = (Get-FileHash -LiteralPath $main -Algorithm SHA256).Hash
foreach ($path in @($candidate, $staged)) {
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $expected) { throw 'Manuscript copies differ.' }
}
$run = 'build/online-magma/20261002T104407585389Z-finite-submission-final'
$record = Get-Content -LiteralPath (Join-Path $projectRoot "$run/record.json") -Raw | ConvertFrom-Json
if ($record.status -ne 'pass' -or -not $record.pass_marker_seen) { throw 'The optional finite check has no successful record.' }
$codeHash = (Get-FileHash -LiteralPath (Join-Path $projectRoot 'Computations/verify-finite.m') -Algorithm SHA256).Hash
if ($codeHash -ne $record.source_sha256) { throw 'The optional verifier changed after its recorded run.' }

$exports = [ordered]@{
    'Draft/ennola-squareclasses.tex' = 'Draft/ennola-squareclasses.tex'
    'Draft/ennola.bib' = 'Draft/ennola.bib'
    'Draft/publmathdeb.cls' = 'Draft/publmathdeb.cls'
    'build/manuscript/ennola-squareclasses.pdf' = 'Draft/ennola-squareclasses.pdf'
    'build/manuscript/ennola-squareclasses.bbl' = 'Draft/ennola-squareclasses.bbl'
    'Computations/verify-finite.m' = 'Computations/verify-finite.m'
    'Computations/finite-verification.md' = 'Computations/finite-verification.md'
    'scripts/magma-online.py' = 'scripts/magma-online.py'
    'Submission/README.md' = 'README.md'
}
foreach ($name in @('source.m', 'input.m', 'record.json', 'response.xml', 'output.txt')) {
    $exports["$run/$name"] = "$run/$name"
}
$manifest = [Collections.Generic.List[object]]::new()
foreach ($entry in $exports.GetEnumerator()) {
    $inputPath = Join-Path $projectRoot $entry.Key
    $outputPath = Join-Path $destination $entry.Value
    New-Item -ItemType Directory -Path (Split-Path -Parent $outputPath) -Force | Out-Null
    Copy-Item -LiteralPath $inputPath -Destination $outputPath
    $before = (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash
    $after = (Get-FileHash -LiteralPath $outputPath -Algorithm SHA256).Hash
    if ($before -ne $after) { throw "Export hash mismatch: $inputPath" }
    $manifest.Add([ordered]@{path=$entry.Value; bytes=(Get-Item -LiteralPath $outputPath).Length; sha256=$after})
}
$manifest.ToArray() | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $destination 'manifest.json') -Encoding utf8
$zipPath = $destination + '.zip'
if (Test-Path -LiteralPath $zipPath) { throw 'An archive with this name already exists.' }
Compress-Archive -Path (Join-Path $destination '*') -DestinationPath $zipPath
Get-FileHash -LiteralPath $zipPath -Algorithm SHA256
