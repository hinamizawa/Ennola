# Prescribed Ideal Classes in Ennola Cubic Fields and Rational Points on Associated Elliptic Curves

This project prepares Junyu Lu's manuscript for submission to **Publicationes Mathematicae Debrecen**. The main source is [Draft/ennola-squareclasses.tex](Draft/ennola-squareclasses.tex), with the single authoring bibliography [Draft/ennola.bib](Draft/ennola.bib). Earlier Canadian Mathematical Bulletin materials remain as dated alternatives.

The [submission check of 13 October 2026](Submission/submission-check-2026-10-13.md) verifies the current journal source, rebuilds both formats and updates the cover letter and export. The author's abstract and `draft` option are preserved. Both TeX sources are byte-identical to their state at the start of this check; their document bodies agree apart from whitespace. The current PDFs have 19 pages in the journal format and 13 pages in `amsart`.

The paper studies $f_a(X)=X^3+(a-1)X^2-aX-1$ and $E_a:y^2=x(x+1)(x-a)+1$ through squareclasses in cubic fields. Its principal results concern prime ideal classes of prescribed power-of-two order, four independent elliptic points, Pell parameters, and a rational rank-five subfamily. See [PROJECT_KNOWLEDGE.md](PROJECT_KNOWLEDGE.md) for the statement boundaries.

## Project layout

| Location | Purpose |
| --- | --- |
| `Draft/ennola-squareclasses.tex` | Main manuscript in the author's `amsart` layout. |
| `Draft/ennola-squareclasses-submission.tex` | Matching document content in `publmathdeb`, using the journal's example `draft` option; the preambles and source whitespace differ. |
| `Draft/ennola.bib` | Shared bibliography for both manuscript filenames. |
| `Draft/publmathdeb.cls` | Unmodified official journal class, downloaded locally; provenance in `sources.json`. |
| `Submission/` | Cover letters for both journals in editable Markdown and local PDF, plus current submission notes. |
| `Review/2026-10-03-ennola-squareclasses-fresh-examination-01.md` | Fresh examination of the source before this editorial revision. |
| `Computations/` | Optional exact checks, a separate explanation for the journal, and clearly marked development experiments. |
| `scripts/build.ps1` | Native MiKTeX and BibTeX build with input hashes and logs. |
| `scripts/package-submission.ps1` | Explicit, hash-verified export of the submission file set. |
| `scripts/render-cover-letter.py` | Rebuilds the PMD cover-letter PDF and records its source and PDF hashes. |
| `scripts/magma-online.py` | Sequential public-calculator client, retaining transmitted code and responses. |
| `build/submission-preparation-2026-10-02/` | Initial inventory, original snapshots, candidate builds, comparisons, and visual checks. |
| `build/polish-2026-10-02/` | Editorial revision, backups, both verified builds, page renders, and synchronization record. |
| `build/followup-edits-2026-10-02/` | Focused verification of the author's subsequent edits, latest builds, and synchronization record. |
| `build/polish-2026-10-03/` | Hash-verified backups, review-based revision, final builds, rendered pages, and cover-letter checks. |
| `build/submission-check-2026-10-13/` | Current snapshots, source checks, native builds and rendered pages. |
| `build/online-magma/`, `build/specializations/` | Public responses and development runs; local fallback logs are under each specialization's `local/` directory. |
| `build/manuscript/` | Default build output directory; the latest checked PDFs are beside their sources in `Draft/`. |
| `sources.json` | Source provenance and actual reading scope for this preparation. |
| `SUBMISSION_PREPARATION.md` | Project inventory, changes, validation, and final deliverables. |
| `build/ennola-pmd-submission-2026-10-13.zip` | Current checked Debrecen export, including its cover letter and optional verification supplement. |
| `build/ennola-pmd-submission-2026-10-02.zip` | Preserved historical export. |

## Build and verification

Run `./scripts/build.ps1` in PowerShell from the project root for the main source. For the journal version, pass `-Source 'Draft/ennola-squareclasses-submission.tex' -OutputDirectory 'build/submission'`. The script uses the installed MiKTeX tools listed in [Environment.md](Environment.md), disables automatic package installation and shell escape, and records input and output hashes outside `Draft/`. The journal class must remain beside the manuscript. Do not alter `TEXINPUTS`. The export script takes the journal build directory explicitly and checks its PDF, source and bibliography against the build record.

The manuscript contains written proofs and explicit finite calculations. At the author's request, software-dependent exact-rank examples were removed. The new script [Computations/verify-finite.m](Computations/verify-finite.m) provides optional checks of the remaining finite calculations; its [explanation](Computations/finite-verification.md) records the exact scope. Specialization experiments concern omitted examples and are retained only as development records. The user authorized the public calculator mainly and local runs for timeouts; remote requests must run sequentially, and a timeout or missing pass marker is not success.

The later requested [parallel local search for integer rank-five parameters](Computations/integer-rank-five-search.md) finished within its two-hour budget: four instances certified 42 distinct values of $s$, including 34 beyond the prior list, with exact replay checks. The [full results and certificate records](build/integer-rank-five-2026-10-02/RESULTS.md) give lower bounds rather than exact ranks. Both manuscript sources were preserved during that search. The author subsequently removed the formal conjecture and retained a brief incidental question about infinitude.

## Submission and preservation

The [journal's author instructions](https://publi.math.unideb.hu/for-authors) were rechecked on 13 October 2026. The submission source follows the journal's `draft` example. Its disabled hyperlinks are expected. The author asked to retain the seven-line abstract, treating the suggested four to six lines as guidance. AI assistance is disclosed in the [cover letter](Submission/cover-letter-pmd.md); the manuscript's commented disclosure remains untouched. The optional code and its [separate explanation](Computations/finite-verification.md) accompany the manuscript. Preparing files does not submit or email them.

The [3 October revision record](build/polish-2026-10-03/REVISION.md) and [journal comparison](Submission/journal-options-2026-10-03.md) are historical records. The current export script now selects the Debrecen source and its matching build, permits the intentional preamble differences from `amsart`, and includes the updated PMD cover letter. It verifies all copied files and every ZIP entry. Gary Walsh remains in both bibliography entries at the author's request.

The original 18 project files were copied byte for byte before editing, with SHA-256 checks in `build/submission-preparation-2026-10-02/initial-inventory.json`. The copied configuration had referred to absent directories and verification records. Current documentation describes only this project.

## Git workflow

The owner initialized this project as a Git repository. On 3 October 2026, the current branch is `main`, tracking `origin/main`, and `origin` is `https://github.com/hinamizawa/Ennola.git`. After each major modification, run the relevant checks, review the final diff and outgoing files and history, stage only task-owned changes, create a focused commit, push without force to the configured remote, and verify the remote commit. This is a standing owner-authorized workflow; preserve unrelated changes. Keep source corpora, publisher sample documents, local environments and generated outputs out of Git. See [AGENTS.md](AGENTS.md) for the governing instructions and [Environment.md](Environment.md) for commands.
