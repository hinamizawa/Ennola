param(
    [string]$BuildDirectory = 'build/submission',
    [string]$OutputDirectory = 'build/ennola-pmd-submission',
    [string]$FiniteRunDirectory = 'build/online-magma/20261002T104407585389Z-finite-submission-final'
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
function Get-ProjectPath([string]$RelativePath) {
    $path = [IO.Path]::GetFullPath((Join-Path $projectRoot $RelativePath))
    if (-not $path.StartsWith($projectRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Package inputs and outputs must remain inside this project.'
    }
    return $path
}
function Assert-SameHash([string]$Left, [string]$Right) {
    if ((Get-FileHash -LiteralPath $Left -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $Right -Algorithm SHA256).Hash) {
        throw "File changed since its build or run: $Left"
    }
}
function Get-DocumentBody([string]$Path) {
    $source = Get-Content -LiteralPath $Path -Raw
    $body = [regex]::Match($source, '(?s)\\begin\{document\}.*\\end\{document\}')
    if (-not $body.Success) { throw "Missing document body: $Path" }
    return [regex]::Replace($body.Value, '\s+', ' ').Trim()
}

$destination = Get-ProjectPath $OutputDirectory
$zipPath = $destination + '.zip'
if ((Test-Path -LiteralPath $destination) -or (Test-Path -LiteralPath $zipPath)) {
    throw 'Use a new package directory and archive name; existing exports are preserved.'
}
$buildPath = Get-ProjectPath $BuildDirectory
$main = Get-ProjectPath 'Draft/ennola-squareclasses.tex'
$candidate = Get-ProjectPath 'Draft/ennola-squareclasses-submission.tex'
if ((Get-Content -LiteralPath $candidate -TotalCount 1) -notmatch '^\\documentclass(?:\[[^\]]*\])?\{publmathdeb\}') {
    throw 'The export requires the Debrecen source.'
}
if ((Get-DocumentBody $main) -ne (Get-DocumentBody $candidate)) {
    throw 'Main and submission document bodies differ beyond whitespace.'
}
Assert-SameHash $candidate (Join-Path $buildPath 'ennola-squareclasses.tex')
foreach ($name in @('ennola.bib', 'publmathdeb.cls')) {
    Assert-SameHash (Get-ProjectPath "Draft/$name") (Join-Path $buildPath $name)
}
$buildRecord = Get-Content -LiteralPath (Join-Path $buildPath 'build-record.json') -Raw | ConvertFrom-Json
if ($buildRecord.status -ne 'pass' -or @($buildRecord.outputs).Count -ne 2) {
    throw 'Rebuild with scripts/build.ps1 to record the current PDF and bibliography hashes.'
}
if ([IO.Path]::GetFullPath($buildRecord.source) -ne $candidate) { throw 'The recorded build is not the submission source.' }
foreach ($buildInput in $buildRecord.inputs) {
    if ((Get-FileHash -LiteralPath $buildInput.Path -Algorithm SHA256).Hash -ne $buildInput.Hash) {
        throw "Build input changed: $($buildInput.Path)"
    }
}
foreach ($output in $buildRecord.outputs) {
    $path = Join-Path $buildPath (Split-Path -Leaf $output.Path)
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $output.Hash) {
        throw "Build output changed: $path"
    }
}
$coverRecord = Get-Content -LiteralPath (Get-ProjectPath 'build/cover-letter-pmd-record.json') -Raw | ConvertFrom-Json
if ($coverRecord.status -ne 'pass' -or $coverRecord.pages -ne 1 -or
    -not $coverRecord.title_matches_manuscript -or -not $coverRecord.address_matches_manuscript -or
    -not $coverRecord.license_confirmation_in_explanation) {
    throw 'Render and validate the current cover letter with scripts/render-cover-letter.py.'
}
$coverDependencies = [ordered]@{
    source = 'Submission/cover-letter-pmd.md'
    pdf = 'Submission/cover-letter-pmd.pdf'
    manuscript = 'Draft/ennola-squareclasses-submission.tex'
    software_explanation = 'Computations/finite-verification.md'
}
foreach ($dependency in $coverDependencies.GetEnumerator()) {
    $entry = $coverRecord.($dependency.Key)
    if ($null -eq $entry -or $entry.path -ne $dependency.Value) {
        throw 'The cover-letter record is missing a required dependency; render the letter again.'
    }
    if ((Get-FileHash -LiteralPath (Get-ProjectPath $entry.path) -Algorithm SHA256).Hash -ne $entry.sha256) {
        throw 'The cover letter or a dependency changed after rendering; run scripts/render-cover-letter.py again.'
    }
}

$runPath = Get-ProjectPath $FiniteRunDirectory
$runRelative = [IO.Path]::GetRelativePath($projectRoot, $runPath).Replace('\', '/')
$record = Get-Content -LiteralPath (Join-Path $runPath 'record.json') -Raw | ConvertFrom-Json
if ($record.status -ne 'pass' -or -not $record.pass_marker_seen) { throw 'The optional finite check has no successful record.' }
$codeHash = (Get-FileHash -LiteralPath (Get-ProjectPath 'Computations/verify-finite.m') -Algorithm SHA256).Hash
if ($codeHash -ne $record.source_sha256) { throw 'The optional verifier changed after its recorded run.' }
Assert-SameHash (Get-ProjectPath 'Computations/verify-finite.m') (Join-Path $runPath 'source.m')
if ((Get-FileHash -LiteralPath (Join-Path $runPath 'input.m') -Algorithm SHA256).Hash -ne $record.transmitted_sha256 -or
    (Get-FileHash -LiteralPath (Join-Path $runPath 'response.xml') -Algorithm SHA256).Hash -ne $record.response_sha256) {
    throw 'The historical computation evidence does not match its run record.'
}

$exports = [ordered]@{
    'Draft/ennola-squareclasses-submission.tex' = 'Draft/ennola-squareclasses.tex'
    'Draft/ennola.bib' = 'Draft/ennola.bib'
    'Draft/publmathdeb.cls' = 'Draft/publmathdeb.cls'
    "$BuildDirectory/ennola-squareclasses.pdf" = 'Draft/ennola-squareclasses.pdf'
    "$BuildDirectory/ennola-squareclasses.bbl" = 'Draft/ennola-squareclasses.bbl'
    'Submission/cover-letter-pmd.md' = 'Submission/cover-letter-pmd.md'
    'Submission/cover-letter-pmd.pdf' = 'Submission/cover-letter-pmd.pdf'
    'Computations/verify-finite.m' = 'Computations/verify-finite.m'
    'Computations/finite-verification.md' = 'Computations/finite-verification.md'
    'scripts/magma-online.py' = 'scripts/magma-online.py'
    'Submission/README.md' = 'README.md'
}
foreach ($name in @('source.m', 'input.m', 'record.json', 'response.xml', 'output.txt')) {
    $exports["$runRelative/$name"] = "$runRelative/$name"
}
$manifest = [Collections.Generic.List[object]]::new()
foreach ($entry in $exports.GetEnumerator()) {
    $inputPath = Get-ProjectPath $entry.Key
    $outputPath = Join-Path $destination $entry.Value
    New-Item -ItemType Directory -Path (Split-Path -Parent $outputPath) -Force | Out-Null
    Copy-Item -LiteralPath $inputPath -Destination $outputPath
    Assert-SameHash $inputPath $outputPath
    $after = (Get-FileHash -LiteralPath $outputPath -Algorithm SHA256).Hash
    $manifest.Add([ordered]@{path=$entry.Value; bytes=(Get-Item -LiteralPath $outputPath).Length; sha256=$after})
}
$manifest.ToArray() | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $destination 'manifest.json') -Encoding utf8
Compress-Archive -Path (Join-Path $destination '*') -DestinationPath $zipPath
$archive = [IO.Compression.ZipFile]::OpenRead($zipPath)
try {
    $files = @($archive.Entries | Where-Object { $_.Name })
    if ($files.Count -ne $manifest.Count + 1) { throw 'Unexpected archive contents.' }
    foreach ($file in $files) {
        $relativePath = $file.FullName.Replace('\', '/')
        $stream = $file.Open()
        try { $hash = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($stream)) }
        finally { $stream.Dispose() }
        if ($hash -ne (Get-FileHash -LiteralPath (Join-Path $destination $relativePath) -Algorithm SHA256).Hash) {
            throw "Archive hash mismatch: $relativePath"
        }
    }
} finally { $archive.Dispose() }
Get-FileHash -LiteralPath $zipPath -Algorithm SHA256
