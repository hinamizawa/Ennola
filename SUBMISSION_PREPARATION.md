# Inventory and submission preparation

Completed on 2 October 2026 for **Publicationes Mathematicae Debrecen**. The prepared [candidate](Draft/ennola-squareclasses-submission.tex) has been synchronized byte for byte to [ennola-squareclasses.tex](Draft/ennola-squareclasses.tex). The [current PDF](Draft/ennola-squareclasses.pdf) has 18 A4 pages. The [submission package](build/ennola-pmd-submission-2026-10-02.zip) contains the PDF, source, bibliography, journal class, optional finite-check code, separate explanation and successful run evidence.

## Initial inventory

The project initially contained 18 files and no Git repository, project virtual environment, `Research/` folder or `Review/` folder. Every original file was preserved before editing in [the original snapshot](build/submission-preparation-2026-10-02/original/), with paths, sizes and SHA-256 hashes in [initial-inventory.json](build/submission-preparation-2026-10-02/initial-inventory.json).

| Initial group | Files | Treatment |
| --- | --- | --- |
| Project descriptions | `AGENTS.md`, `README.md`, `PROJECT_KNOWLEDGE.md`, `Environment.md` | Replaced inherited project names, target journal, absent paths and unverified historical claims with this project's current scope and verified tools. |
| File conventions | `.editorconfig`, `.gitattributes`, `.gitignore` | Retained the suitable editor settings; updated preservation wording and ignored local journal/output artifacts. These are prospective conventions because the directory has no Git repository. |
| Authoring source | `Draft/ennola-squareclasses.tex`, `Draft/ennola.bib` | Preserved originals; prepared a separate candidate; synchronized the checked source at the end. Bibliography entries remain unchanged; its style comment was corrected. |
| Public-calculator client | `scripts/magma-online.py` | Inspected and retained byte for byte. |
| Generated manuscript files | Eight PDF, auxiliary, bibliography, log and SyncTeX files | Preserved in the snapshot. The current PDF was replaced only after the new source passed checks; auxiliary files were not manually edited. |

The original manuscript SHA-256 is `2c6e8941e1e5237e0b82683fddf97e3300966a9f964eeae9a25a5dc62da6da11`. All 18 backup hashes were rechecked after synchronization.

## Manuscript changes

- Added introductory context on exceptional units, the Ennola polynomial, its discriminant and non-Galois cubic field, and the distinction between the fundamental-unit conjecture and the squareclass result used here.
- Shortened “Relation to earlier work” from 473 to 242 whitespace-delimited tokens, retaining all mathematical citation keys and the relevant qualifications.
- Applied the unchanged official journal class and supplied its missing MSC 2020 heading. The abstract occupies six lines in the journal layout. Author name, address, email, ORCID, classifications and keywords are preserved.
- Wrote each element norm with its field extension, using $N_{K_a/\mathbb Q}$ or $N_{K/\mathbb Q}$, and separately defined the positive absolute ideal norm. The manuscript has no trace operators.
- Removed the software-dependent exact-rank specializations, the eleven computed integer rank-five examples and the exact-rank assertion at $a=8$. The integer infinitude remains expressly conjectural. No Magma mention or software citation remains in the rendered manuscript; the unused bibliography entry is retained in the authoring database.
- Preserved the explicit finite calculations inside the mathematical proofs. New verification code is optional and kept outside the manuscript. The original AI-assistance statement remains, with “Magma scripts” shortened to “scripts”.

## Checks and their limits

| Check | Result and scope |
| --- | --- |
| Source preservation | All 16 formal statement environments, including the conjecture, and all 15 proof environments agree with the original after accounting for the requested field-norm notation. All 29 labels and 14 mathematical citation keys remain. See [source-preservation.json](build/submission-preparation-2026-10-02/source-preservation.json) and [the source diff](build/submission-preparation-2026-10-02/manuscript.diff). |
| Removal dependencies | Checked all 47 internal references against the 29 labels. The rank-four proof uses the earlier theorem at $a=134$; the rank-five proof supplies its own points, residue matrix, point counts and torsion argument. Neither depends on a removed exact-rank computation. This was a scoped dependency check, not a new whole-paper proof audit. |
| Optional exact computation | The final finite verifier passed on public V2.29-10 with seed one and all expected markers. It checks arithmetic within the bounds and scope in [the separate explanation](Computations/finite-verification.md). It does not certify all proof deductions or imported theorems. |
| Development computations | Four rational full checks passed. Two integer requests timed out online; local attempts were interrupted or exhausted memory without a certificate. All records are retained in [development results](Computations/specialization-development-results.md), excluded from the submission package and unused by the revised paper. |
| Compilation | Candidate and synchronized main source compiled with the requested native MiKTeX pdfLaTeX and BibTeX. No unresolved references, citations, missing destinations or overfull boxes remain. Warnings are an unused EPS-conversion notice about disabled shell escape and one underfull vertical box. See [the main build record](build/manuscript/build-record.json). |
| Rendered output | Inspected all 18 candidate pages at 110 dpi, including the tables, matrix, norms and bibliography. No clipping, overlap or unreadable notation was found. The synchronized main PDF has identical decoded page content, resources and page sizes. See [visual-review.json](build/submission-preparation-2026-10-02/visual-review.json). |
| Journal preparation | Checked the official formatting, CAS and AI instructions. Used the journal class, included optional code and its separate explanation, retained AI disclosure and recorded the author's confirmation of the local license. Package dependencies and build commands are listed in [Submission/README.md](Submission/README.md). |
| Source reading | The added historical context was checked against the opening pages of Louboutin's published article. [sources.json](sources.json) records URLs, hashes and actual reading scope. Existing citation details were retained; no exhaustive bibliography or priority audit was performed. |

The final source SHA-256 is `220f7a186e75d993b9f9d34ba8e100049944d47a9d4c4a12118e8254f67432e6`; the current PDF SHA-256 is `a1cd5018638ace4794e9a97864e902c8ce02d9ac481e65ce50f0dbedbffd0dfa`. The package manifest checks every exported file. Preparation does not establish journal acceptance. No manuscript was submitted or emailed, and no commit or push was made.

## New project support files

[scripts/build.ps1](scripts/build.ps1) builds in an isolated project directory to prevent old editor auxiliary files from shadowing current output. [scripts/check-preparation.py](scripts/check-preparation.py) checks preservation and editorial scope. [scripts/package-submission.ps1](scripts/package-submission.ps1) exports an explicit, hash-verified file set into a new directory and ZIP. It excludes the original snapshots, reference-library PDFs, incomplete specialization experiments and unrelated logs. `TEXINPUTS` was never changed and no dependencies were installed.
