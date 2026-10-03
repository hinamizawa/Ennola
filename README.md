# Prescribed ideal classes and elliptic points in Ennola cubic fields

This project prepares Junyu Lu's manuscript for **Publicationes Mathematicae Debrecen**. The main source is [Draft/ennola-squareclasses.tex](Draft/ennola-squareclasses.tex), with the single authoring bibliography [Draft/ennola.bib](Draft/ennola.bib).

The paper studies $f_a(X)=X^3+(a-1)X^2-aX-1$ and $E_a:y^2=x(x+1)(x-a)+1$ through squareclasses in cubic fields. Its principal results concern prime ideal classes of prescribed power-of-two order, four independent elliptic points, Pell parameters, and a rational rank-five subfamily. See [PROJECT_KNOWLEDGE.md](PROJECT_KNOWLEDGE.md) for the statement boundaries.

## Project layout

| Location | Purpose |
| --- | --- |
| `Draft/ennola-squareclasses.tex` | Main manuscript in `amsart`, polished on 2 October 2026; its body matches the submission source. |
| `Draft/ennola-squareclasses-submission.tex` | Synchronized manuscript in the official journal class; only the document-class line differs. |
| `Draft/ennola.bib` | Shared bibliography for both manuscript filenames. |
| `Draft/publmathdeb.cls` | Unmodified official journal class, downloaded locally; provenance in `sources.json`. |
| `Computations/` | Optional exact checks, a separate explanation for the journal, and clearly marked development experiments. |
| `scripts/build.ps1` | Native MiKTeX and BibTeX build with input hashes and logs. |
| `scripts/package-submission.ps1` | Explicit, hash-verified export of the submission file set. |
| `scripts/magma-online.py` | Sequential public-calculator client, retaining transmitted code and responses. |
| `build/submission-preparation-2026-10-02/` | Initial inventory, original snapshots, candidate builds, comparisons, and visual checks. |
| `build/polish-2026-10-02/` | Editorial revision, backups, both verified builds, page renders, and synchronization record. |
| `build/followup-edits-2026-10-02/` | Focused verification of the author's subsequent edits, latest builds, and synchronization record. |
| `build/online-magma/`, `build/specializations/` | Public responses and development runs; local fallback logs are under each specialization's `local/` directory. |
| `build/manuscript/` | Default build output directory; the latest checked PDFs are beside their sources in `Draft/`. |
| `sources.json` | Source provenance and actual reading scope for this preparation. |
| `SUBMISSION_PREPARATION.md` | Project inventory, changes, validation, and final deliverables. |
| `build/ennola-pmd-submission-2026-10-02.zip` | Earlier submission-preparation snapshot; predates the latest editorial revision. |

## Build and verification

Run `./scripts/build.ps1` in PowerShell from the project root. It uses the installed MiKTeX tools listed in [Environment.md](Environment.md), disables automatic package installation and shell escape, and writes outside `Draft/`. The journal class must remain beside the manuscript. Do not alter `TEXINPUTS`.

The manuscript contains written proofs and explicit finite calculations. At the author's request, software-dependent exact-rank examples were removed. The new script [Computations/verify-finite.m](Computations/verify-finite.m) provides optional checks of the remaining finite calculations; its [explanation](Computations/finite-verification.md) records the exact scope. Specialization experiments concern omitted examples and are retained only as development records. The user authorized the public calculator mainly and local runs for timeouts; remote requests must run sequentially, and a timeout or missing pass marker is not success.

The later requested [parallel local search for integer rank-five parameters](Computations/integer-rank-five-search.md) finished within its two-hour budget: four instances certified 42 distinct values of $s$, including 34 beyond the prior list, with exact replay checks. The [full results and certificate records](build/integer-rank-five-2026-10-02/RESULTS.md) give lower bounds rather than exact ranks. Both manuscript sources were preserved, and the infinitude conjecture remains open.

## Submission and preservation

The [journal's author instructions](https://publi.math.unideb.hu/for-authors) were checked on 2 October 2026. Initial submission is by PDF; the submission source uses the preferred journal class, while the main source retains the author's `amsart` format. The computation code, separate explanation, and transparent AI-use disclosure accompany the preparation. Author declarations are not inferred. Preparing files does not submit or email them.

The [revision record](build/polish-2026-10-02/REVISION.md) documents the applied review suggestions. A subsequent [focused check](build/followup-edits-2026-10-02/CHECK.md) found the author's further edits mathematically sound and preserved the main source unchanged. Both source files have the same body, with current 15-page main and 18-page submission PDFs in `Draft/`. The earlier ZIP and packaging script were not updated in these passes; that script still assumes byte-identical source files and needs adjustment before a new export.

The original 18 project files were copied byte for byte before editing, with SHA-256 checks in `build/submission-preparation-2026-10-02/initial-inventory.json`. The copied configuration had referred to absent directories and verification records. Current documentation describes only this project.

## Git workflow

The owner initialized this project as a Git repository. On 3 October 2026, the current branch is `main`, tracking `origin/main`, and `origin` is `https://github.com/hinamizawa/Ennola.git`. After each major modification, run the relevant checks, review the final diff and outgoing files and history, stage only task-owned changes, create a focused commit, push without force to the configured remote, and verify the remote commit. This is a standing owner-authorized workflow; preserve unrelated changes. Keep source corpora, publisher sample documents, local environments and generated outputs out of Git. See [AGENTS.md](AGENTS.md) for the governing instructions and [Environment.md](Environment.md) for commands.
