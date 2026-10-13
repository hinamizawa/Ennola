# Debrecen submission check — 13 October 2026

## Assessment

The current manuscript meets the checked submission requirements. It uses the journal class and its example `draft` option, contains the required author and subject information, and compiles without unresolved references or citations. The author's original abstract is retained exactly. The journal's suggested four to six lines is treated as guidance at the author's request; the abstract renders in seven lines. This is a submission-format and file-consistency check, not a new certification of the mathematical proofs or a prediction of acceptance.

Source: [Publicationes Mathematicae Debrecen, Instructions for Authors](https://publi.math.unideb.hu/for-authors), checked on 13 October 2026, including “Formal requirements,” “Use of CAS tools,” “Use of AI,” and the class and abstract examples.

## Requirements and current files

| Item | Checked state |
| --- | --- |
| Journal PDF | 19 A4 pages, with the journal's manuscript header and page numbering. |
| Author information | Junyu Lu; Yang-En University postal address; `jy.lu@outlook.com`; ORCID present in source. |
| Classification and keywords | Primary 11R29; secondary 11G05, 11R16, 11D09; MSC 2020 heading and keywords present. |
| Class and dependencies | Unmodified `publmathdeb.cls`; `\documentclass[draft]{publmathdeb}` follows the journal example. Package download links and build commands are in the exported README. |
| Abstract | Original text preserved. The seven-line rendering is recorded as advisory, with no editorial change. |
| References | All 15 citation keys resolve; all cited entries have publication data in the bibliography. No entry is marked unpublished or forthcoming. Publication metadata and cited theorem applications were not independently re-audited. |
| Software | No Magma mention or software-dependent exact-rank result appears in the paper. Optional verification code, a separate explanation, and the author's confirmed license statement accompany it. |
| AI transparency | The cover letter discloses the assistance already described by the author. The manuscript's commented disclosure remains untouched. |
| Submission declarations | The cover letter preserves the author's confirmed unpublished/not-under-consideration statement. Other institutional or copyright attestations have not been invented. |

Draft mode intentionally disables PDF hyperlinks. The class also warns about graphics placeholders; this manuscript has no external figure files. Neither message is treated as a submission failure.

## Updates

- Rebuilt the journal and main PDFs from the current sources. The journal source and abstract remain unchanged; the main source also remains byte-identical to its initial snapshot.
- Updated the PMD cover letter to the current title and date, corrected its disclosure wording, and rendered its one-page PDF. The Canadian Mathematical Bulletin letter is outside this check and remains unchanged.
- Corrected current titles, page counts, disclosure locations and export instructions in project documentation and the separate computation explanation. Older preparation records are explicitly historical.
- Updated `scripts/build.ps1` to record successful PDF and BBL hashes. Updated `scripts/package-submission.ps1` to export the journal source and matching build, permit intentional preamble differences from `amsart`, include the cover letter, and verify copied files and ZIP entries.
- Added `scripts/render-cover-letter.py` for a reproducible cover-letter PDF and source/PDF hash record. The shared bibliography and downloaded journal class are unchanged.
- Recorded the author's abstract-preservation instruction and the journal's `draft` example in `AGENTS.md`.

## Validation and limits

| Gate | Result |
| --- | --- |
| Source preservation | Both TeX files match the byte snapshots made before this check. Their document bodies agree after whitespace normalization. All 15 formal statements, 15 proofs, 28 labels, 51 internal reference uses and 15 cited keys are preserved. The 14 initial backup hashes were rechecked. |
| Mathematical review | The complete current source was read for submission structure and software dependencies. No new whole-paper proof audit or verification of every imported theorem was performed. |
| Exact computation | No new execution. The optional script was read and its unchanged source, transmitted input and raw response checked against the successful 2 October record. That historical run is not represented as new evidence. |
| Compilation | Native MiKTeX pdfLaTeX and BibTeX, through `scripts/build.ps1`, pass for both formats. Journal: 19 pages; main: 13 pages. No unresolved references, citations, missing characters, overfull boxes or underfull boxes. |
| Diagnostics | Journal draft-mode notices are expected. Both builds also report disabled shell escape for unused EPS conversion. Poppler reports that its machine-local log cannot be written, but returns success and renders every requested page. |
| Rendered output | All 19 journal pages, all 13 main pages and the one-page PMD cover letter were inspected. Tables, the squareclass matrix, equations, title, bibliography and address are legible; no clipping or overlap was found. |
| Package | Explicit export of 16 files plus the manifest: journal PDF/source, bibliography, unchanged class, cover letter and optional finite-check supplement. Every manifest entry and archived file is hash-checked; all 31 journal PDF fonts are embedded. Reference-library PDFs, prior reviews and unrelated development experiments are excluded. |
| Journal submission | No email or submission has been made. |

## Files and evidence

- Journal source: [ennola-squareclasses-submission.tex](../Draft/ennola-squareclasses-submission.tex).
- Journal PDF: [ennola-squareclasses-submission.pdf](../Draft/ennola-squareclasses-submission.pdf).
- Main PDF: [ennola-squareclasses.pdf](../Draft/ennola-squareclasses.pdf).
- Cover letter: [editable source](cover-letter-pmd.md) and [PDF](cover-letter-pmd.pdf).
- Package: [ennola-pmd-submission-2026-10-13.zip](../build/ennola-pmd-submission-2026-10-13.zip), with [manifest](../build/ennola-pmd-submission-2026-10-13/manifest.json).
- Baseline and preservation: [baseline.json](../build/submission-check-2026-10-13/baseline.json), [preexisting user diff](../build/submission-check-2026-10-13/preexisting-user-edits.patch), and [source/build checks](../build/submission-check-2026-10-13/source-and-build-checks.json).
- Build evidence: [journal build record](../build/submission-check-2026-10-13/submission/build-record.json) and [main build record](../build/submission-check-2026-10-13/main/build-record.json).
- Package and visual evidence: [package-and-visual-checks.json](../build/submission-check-2026-10-13/package-and-visual-checks.json).
- Export guard: [rejection of the main-format build](../build/submission-check-2026-10-13/package-guard-check.json), with no output created.
- Optional historical computation: [scope and execution record](../Computations/finite-verification.md).

The main-source SHA-256 remains `D073779CC960913FC16163F810EBFFC84AF355C5F0CCBAE7FB0AFAB43DA0B43B`; the submission-source SHA-256 remains `264B1F810E0A4111557DF0E4152A10542FABCB639C921C62C839F4044E14575E`. The class SHA-256 remains `2DBDC5DA9E088DCB85BBFC3D95EB6142DF8C8BDE0D46093AFADF53766E8A456F`. PDF and exported-file hashes are recorded separately in the build records and package manifest.

The package SHA-256 is `3F431C0A0EC321CD4D7E5D7CD7D1ED535E5A659245BE193DFB40F3E6391873E4`.
