# Environment and commands

Verified on 2 October 2026 for `C:/Users/jylu/Documents/Ennola`. Use native Windows PowerShell, never WSL, and do not alter `TEXINPUTS`.

## Available tools

| Tool | Observation | Explicit path |
| --- | --- | --- |
| PowerShell | 7.6.6 | Current PowerShell 7 session |
| MiKTeX pdfLaTeX | MiKTeX-pdfTeX 4.27 / MiKTeX 26.5 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe` |
| MiKTeX BibTeX | 4.2 / MiKTeX 26.5 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/bibtex.exe` |
| PDF renderer | Poppler 24.04.0 | `C:/Users/jylu/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdftoppm.exe` |
| Python | 3.12.14; pypdf 6.16.2; Pillow 12.3.0 | `C:/Users/jylu/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe` |
| Local Magma | Executable present; each actual run records the version | `C:/Program Files (x86)/Magma/magma.exe` |

There is no project `.venv`. The inherited Shared PDF-intake interpreter path is also absent. Use the existing bundled Python explicitly; no environment or dependency installation is required. LaTeX is edited directly with file-editing tools. Python handles document inspection, provenance and the public calculator client, not mathematical verification.

## Builds

```powershell
./scripts/build.ps1
./scripts/build.ps1 -Source 'Draft/ennola-squareclasses-submission.tex' -OutputDirectory 'build/submission-preparation-2026-10-02/candidate'
```

The script copies the source, bibliography and class into the selected build directory, then runs pdfLaTeX, BibTeX and further pdfLaTeX passes until references settle (at least three and at most five TeX passes). This prevents old editor-generated auxiliary files in `Draft/` from shadowing the new build. It records input SHA-256 hashes, commands, exit codes and logs, and rejects unresolved references. Automatic package installation and shell escape are disabled. The installed tools required normal-user execution after the restricted shell returned `Access is denied`; that permission does not change the engine or environment variables.

The unmodified `Draft/publmathdeb.cls` was downloaded from the [official journal](https://publi.math.unideb.hu/publmathdeb.cls). Its SHA-256 is `2DBDC5DA9E088DCB85BBFC3D95EB6142DF8C8BDE0D46093AFADF53766E8A456F`. The class identifies itself as version 2.0, 9 March 2006. The source preamble supplies the MSC 2020 label. It leaves issue, volume and submission-date fields unset.

Generated output goes under `build/`. Original editor-generated files beside the draft are preserved until final PDF synchronization; they are not the evidence for the new build. Render the current PDF for visual inspection with the explicit `pdftoppm.exe` above. Compilation and visual inspection do not verify mathematical correctness.

## Computations

The user identified the [public Magma calculator](https://magma.maths.usyd.edu.au/calc/) as the main service and requested new scripts. The inspected `scripts/magma-online.py` uses Python's standard library, sends one selected standalone job at a time, adds seed one and version output, and preserves the source, transmitted input, SHA-256 hashes, raw XML, extracted output and status. It limits input to 50000 bytes and the request to 60 seconds. Recheck the service page before future runs; these limits and remote versions may change.

```powershell
& 'C:/Users/jylu/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' 'scripts/magma-online.py' 'Computations/verify-finite.m' --name finite --expect-pass ENNOLA_FINITE_PASS
```

For jobs that time out, the user authorized local Magma. Run it with `-n -S 1 -b`; preserve a standalone input ending in `quit;`, its hash, version, exit code and full output. A local rerun is a separate record, and version-specific rank options must be recorded explicitly. Do not treat different options as equivalent or infer results from a timeout. No GRH or BSD assumption may be silently introduced.

The user described the historical computations as mainly public-calculator use and confirmed on 2 October 2026 that the local installation is covered by a valid license. The computation explanation identifies the actual execution routes used for the supplied checks. No license identifier or institutional license details were supplied.

## Git and preservation

Git was verified on 3 October 2026: Git for Windows 2.55.0.windows.5, current branch `main`, upstream `origin/main`, and remote `origin` at `https://github.com/hinamizawa/Ennola.git`. Recheck the current branch, upstream, remote and working-tree state before changing or publishing files. `.gitignore`, `.gitattributes` and `.editorconfig` now apply to the repository. The 18 initial files, including all original configuration and the original manuscript/PDF, are hash-verified under `build/submission-preparation-2026-10-02/original/`.

After every major modification, perform the relevant validation, inspect the final diff and outgoing files and history for unintended material, stage only task-owned changes, create a focused commit, push without force to the configured remote, and verify the remote branch against `HEAD`. This routine is authorized by the owner in [AGENTS.md](AGENTS.md). Preserve unrelated work and keep copyrighted source corpora, secrets and generated outputs out of outgoing changes. Report a blocked commit or push explicitly.

For the verified `main` / `origin` setup, use the following commands, replacing the path list and commit message with the actual task-owned files and change description. Inspect the staged diff and outgoing history before pushing.

```powershell
git status --short
git branch -vv
git remote -v
git diff --check
git diff
git add -- AGENTS.md README.md Environment.md PROJECT_KNOWLEDGE.md
git diff --cached --check
git diff --cached
git commit -m "Document standing commit and push workflow"
git log --oneline origin/main..HEAD
git diff --stat origin/main..HEAD
git push origin main
git rev-parse HEAD
git ls-remote --heads origin refs/heads/main
git status --short
```
