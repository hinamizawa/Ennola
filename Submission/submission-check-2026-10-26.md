# Final submission check — 26 October 2026

The current manuscript is **Ideal Classes of Order $2^n$ in a Family of Totally Real Cubic Fields and Rational Points on Associated Elliptic Curves**, by Junyu Lu, prepared for Publicationes Mathematicae Debrecen. The author authorized the final-audit follow-up, file updates, commit and push. The abstract's suggested 4–6-line length is not treated as a strict requirement, and bibliography-only comments are outside this revision.

## Scope and mathematical validation

The preceding [whole-manuscript audit](../Review/2026-10-26-final-submission-audit.md) read all substantive passages, including 15 formal statements and their proofs, two remarks, both tables, and claims outside theorem environments. All 13 active citation applications were checked at the relevant primary-source passages. The report records prior conversational exposure, exact source versions and locators, verification depth, and checks not performed. Its SHA-256 is `6CC548C59D3D03FE985852F1D283479940C2B02022585EF5852A338B04C4ABAC`; its detailed reading scopes are also retained in [sources.json](../sources.json).

No substantive mathematical defect or unresolved material source application was identified. Lemma 3.1 was checked in arbitrary degree for monic irreducible polynomials under its stated norm, coprimality and derivative hypotheses; it does not assert the result for arbitrary polynomials without those hypotheses. The audit does not certify novelty, exact generic ranks, full Mordell–Weil bases, or infinitude of integral rank-five parameters.

The inspected, unchanged [finite verifier](../Computations/verify-finite.m) passed locally with Magma V2.20-9 and seed one, with all three section markers and `ENNOLA_FINITE_PASS` and no reported errors. Separate exact algebra, Pell-period and geometric checks also passed. See the [local run record](../build/final-submission-audit-2026-10-26-135235UTC/magma/record.json) and the audit's detailed reports. These checks were not repeated after the subsequent prose-only clarification. The exported supplement retains the successful public-calculator evidence from 2 October 2026; that public run and computations reported by external authors were not rerun.

## Applied changes and preservation

The finalization resolves findings F1–F4 of the audit: the delivered journal PDF now has the final title; the cover letter has the same title and author address and the preparation date 26 October; the cover-letter renderer handles the exponent and checks the existing license declaration in the separate computation explanation; and package descriptions have the correct title, 18-page journal count and disclosure locations. The renderer validates a staged PDF before replacing the delivered file. The export checks the cover letter's manuscript and explanation dependencies as well as its source and PDF hashes.

Both manuscript sources retain the author's title, shortened relation-to-earlier-work subsection, address and synchronized content. The only additional TeX change after the audited snapshots is “be the group of norm-one units of $K_a$” in place of “be its group of norm-one units.” The two document bodies are byte-identical. The abstract, `Draft/ennola.bib`, `Draft/publmathdeb.cls`, finite verifier and configuration files are unchanged; `\documentclass[draft]{publmathdeb}` is retained. No author declaration was added or strengthened.

Hash-verified originals, including the previously delivered PDFs, are preserved in [the finalization snapshot](../build/submission-finalize-2026-10-26-141203UTC/snapshot/); the [initial manifest](../build/submission-finalize-2026-10-26-141203UTC/initial-manifest.json) records the starting Git state and all 23 protected or edited files. Earlier audit records and source PDFs were preserved.

## Compilation, rendering and export

Both sources passed the configured native MiKTeX pdfLaTeX/BibTeX workflow, with resolved citations and internal references: [main build](../build/submission-finalize-2026-10-26-141203UTC/main-build/build-record.json), [journal build](../build/submission-finalize-2026-10-26-141203UTC/submission-build/build-record.json). Their generated bibliography files agree. Every font in both manuscript PDFs is embedded.

All 31 manuscript pages were rendered at 100 dpi and compared pixel by pixel with the audited builds. Only main p. 7 and journal p. 9 changed, exactly where the norm-one-unit sentence occurs. Those pages, both title pages, journal p. 17, and the one-page cover letter were visually inspected. No clipping, overlap or overflow was found. The unchanged journal p. 17 retains an underfull vertical-box warning and extra vertical spacing before the concluding remark. Draft-mode and disabled-shell-escape warnings are expected. See [PDF verification](../build/submission-finalize-2026-10-26-141203UTC/pdf-verification.json).

Three isolated renderer failure cases—wrong title, missing license confirmation and a multipage letter—each rejected the candidate while preserving the existing PDF and record. An isolated export test rejected an explanation changed after rendering before creating any package. See [renderer checks](../build/submission-finalize-2026-10-26-141203UTC/renderer-validation.json) and [export guard check](../build/submission-finalize-2026-10-26-141203UTC/export-guard-validation.json).

The [final export](../build/ennola-pmd-submission-2026-10-26-final.zip) contains 16 supplied files plus `manifest.json`. The export script verified every copy and every ZIP entry against its SHA-256 hash. It includes the matching journal source, PDF, BBL, authoring bibliography, unchanged official class, cover letter, optional finite verifier and explanation, and historical public-calculator evidence. Development experiments, research-library PDFs, review reports and local environments are excluded.

| Final file | Pages | SHA-256 |
| --- | --- | --- |
| `Draft/ennola-squareclasses.tex` | — | `43CC1F3B7ABBEC4334401B1F9CF207BD912E28595804F31CC935875A17388785` |
| `Draft/ennola-squareclasses-submission.tex` | — | `ACC300D8035128B96CB22DC5D4349FC369A3AA7A261967425C7BAF7189A53E1E` |
| `Draft/ennola-squareclasses.pdf` | 13 | `72F1FB2B05F87D32C52573A3771FEA209000272FCEA990EAC9F93942251B3EA3` |
| `Draft/ennola-squareclasses-submission.pdf` | 18 | `5E7E9C9597FC6E1B9AA960FDEA187288A1C4D1BBE751EA91428CD8C6BEC77DA1` |
| `Submission/cover-letter-pmd.pdf` | 1 | `54A3B1A86FE64B7CC0D498C6C17F02C0E9308A188FFA66920FDD05BC689A1A55` |
| `build/ennola-pmd-submission-2026-10-26-final.zip` | — | `84BD4D0585A16A0270B1B76D1F0794436ABEA781E8CED9BF9F955EE24CF1904E` |

Generated PDFs, ZIPs and verification artifacts remain local under the repository's existing exclusions. No email, journal submission or arXiv update was performed. The public preprint retains its earlier title; the existing identifier in the cover letter still identifies the manuscript.
