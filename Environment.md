# Environment and commands

Operational settings for the working checkout; project policy is in [AGENTS.md](AGENTS.md). Tool paths and the versions below were checked on 24 October 2026. Magma's executable was found but was not run; each computation records its own version. Detailed checks are local under `build/config-consolidation-2026-10-24/`.

## Available tools

| Tool | Observation | Explicit path |
| --- | --- | --- |
| PowerShell | 7.6.8 | `C:/Program Files/PowerShell/7/pwsh.exe` |
| Git for Windows | 2.55.0.windows.5 | `C:/Program Files/Git/cmd/git.exe` |
| MiKTeX pdfLaTeX | MiKTeX-pdfTeX 4.27 / MiKTeX 26.5 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe` |
| MiKTeX BibTeX | 4.2 / MiKTeX 26.5 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/bibtex.exe` |
| PDF renderer | Poppler 24.04.0 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdftoppm.exe` |
| Python | 3.12.14; pypdf 6.16.2; Pillow 12.3.0; ReportLab 4.4.9 | `$projectPython`, initialized below |
| Local Magma | Executable present; each actual run records the version | `C:/Program Files (x86)/Magma/magma.exe` |
| MSYS2 UCRT64 | GCC/G++ 16.2.0; CMake 4.4.4; Ninja 1.13.2; pkg-config 3.0.10 | `C:/msys64/ucrt64/bin` |
| Strawberry Perl | 5.42.2 | `C:/Strawberry/perl/bin/perl.exe` |

The Python commands below share this PowerShell binding:

```powershell
$projectPython = 'C:/Users/jylu/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
```

There is no project `.venv`; the listed Python already supplies the document libraries used by the support scripts.

## C/C++ and Perl defaults

Use MSYS2 UCRT64 for C/C++, with FLINT, GMP and MPFR from the same prefix. Its `pkg-config` reports FLINT 3.6.0, GMP 6.3.0 and MPFR 4.2.2; these are installed-library observations, not a check of any language binding. Keep `C:/msys64/usr/bin` out of the global PATH. Retain Strawberry Perl and its runtime paths when selecting UCRT64 for C/C++.

## Builds

Use [scripts/build.ps1](scripts/build.ps1) with the listed native MiKTeX tools, rather than the bundled compiler:

```powershell
./scripts/build.ps1
./scripts/build.ps1 -Source 'Draft/ennola-squareclasses-submission.tex' -OutputDirectory 'build/submission'
```

The script copies the source, bibliography and class into the selected build directory, then runs pdfLaTeX, BibTeX and further pdfLaTeX passes until references settle (at least three and at most five TeX passes). This prevents old editor-generated auxiliary files in `Draft/` from shadowing the new build. It records input SHA-256 hashes, commands, exit codes and logs, rejects unresolved references, and records successful PDF and BBL hashes for the export check. Automatic package installation and shell escape are disabled.

Class provenance is in [sources.json](sources.json). The journal's `draft` option produces an expected hyperref warning and disables PDF links. The manuscript preamble supplies the MSC 2020 label for the older class.

Build outputs remain in the selected directory until the candidate workflow in `AGENTS.md` reaches synchronization. Use the listed `pdftoppm.exe` to render the newly built PDF for visual inspection. The dated [submission check](Submission/submission-check-2026-10-13.md) identifies earlier checked builds and exports.

## Cover letter and export

The PMD cover letter is edited in `Submission/cover-letter-pmd.md`. Its renderer uses the existing Windows Georgia font, checks the title against the submission source, and writes `build/cover-letter-pmd-record.json`. Preserve the current PDF in a `build/` snapshot before replacing it.

```powershell
& $projectPython scripts/render-cover-letter.py
./scripts/package-submission.ps1 -BuildDirectory 'build/submission' -OutputDirectory 'build/ennola-pmd-submission-new'
```

Choose a new export directory each time. The package contains the Debrecen source under the portable name `Draft/ennola-squareclasses.tex`, its matching PDF and BBL, the bibliography and journal class, the PMD cover letter, and the optional finite-check supplement. The script checks manuscript body agreement while permitting the intentional preamble and whitespace differences. It checks build output hashes, the rendered cover letter, the unchanged finite verifier and its historical evidence, then verifies every ZIP entry. The supplied optional execution record remains dated 2 October 2026; packaging does not rerun it.

## Computations

For an authorized [public Magma calculator](https://magma.maths.usyd.edu.au/calc/) job, send only the selected standalone computation through [scripts/magma-online.py](scripts/magma-online.py), with requests run sequentially. The client uses Python's standard library, adds seed one and version output, and preserves source and transmitted-input hashes, raw XML, extracted output and status. Its configured limits are 50000 input bytes and 60 service seconds; recheck the service page before remote runs.

```powershell
& $projectPython scripts/magma-online.py Computations/verify-finite.m --name finite --expect-pass ENNOLA_FINITE_PASS
```

For local fallback, use a standalone input ending in `quit;` with these defaults, unless reproducing an explicitly recorded different seed or settings:

```powershell
& 'C:/Program Files (x86)/Magma/magma.exe' -n -S 1 -b 'build/selected-job/input.m'
```

Keep a local rerun's input and result record separate from the public response. Version-specific API and proof settings belong in that run's record; the script-specific notes under [Computations/](Computations/README.md) give each routine's scope, required pass marker and known limitations. General reproducibility and result-validation requirements are inherited from the global instructions.
