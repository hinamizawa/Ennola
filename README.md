# Ideal Classes of Prescribed 2-Power Order in Cubic Fields and Rational Points on Associated Elliptic Curves

This project prepares Junyu Lu's manuscript for submission to **Publicationes Mathematicae Debrecen**. It studies ideal classes and elliptic points through squareclasses in the family of totally real cubic fields studied by Ennola. Earlier Canadian Mathematical Bulletin materials remain as dated alternatives.

## Documentation map

| File | Owns |
| --- | --- |
| Global `AGENTS.md` | Shared research, review-only, source-editing, verification, software-selection, Windows and Git safeguards. |
| [AGENTS.md](AGENTS.md) | Ennola-specific policy, manuscript constraints and standing commit/push authorization. |
| [Environment.md](Environment.md) | Tool paths and defaults; build, rendering, export and computation procedures. |
| [PROJECT_KNOWLEDGE.md](PROJECT_KNOWLEDGE.md) | Mathematical objects, claims, limitations and evidence pointers. |
| [sources.json](sources.json) | Article and journal-resource identities, hashes and actual reading scope. |
| [.editorconfig](.editorconfig), [.gitattributes](.gitattributes), [.gitignore](.gitignore) | Editor defaults, byte-preservation settings and local-file exclusions. |
| [SUBMISSION_PREPARATION.md](SUBMISSION_PREPARATION.md) and dated reports | Historical preparation, checks and deliverables for the versions they identify. |
| [Submission/README.md](Submission/README.md) | Self-contained instructions copied into exported packages; checkout procedures are in `Environment.md`. |

Global and project `AGENTS.md` files are layered by Codex's [instruction discovery](https://learn.chatgpt.com/docs/agent-configuration/agents-md). This README is a navigation guide; the files above hold the rules, procedures and evidence.

## Project layout

| Location | Purpose |
| --- | --- |
| [Draft/ennola-squareclasses.tex](Draft/ennola-squareclasses.tex) | Main manuscript in the author's `amsart` layout. |
| [Draft/ennola-squareclasses-submission.tex](Draft/ennola-squareclasses-submission.tex) | Journal source with a separate `publmathdeb` preamble. |
| [Draft/ennola.bib](Draft/ennola.bib) | Authoring bibliography shared by both formats. |
| `Draft/publmathdeb.cls` | Locally downloaded journal class. |
| `Submission/` | Editable cover letters, package documentation and dated journal checks. |
| [Computations/README.md](Computations/README.md) | Optional finite checks, development experiments and their scope. |
| `scripts/` | Build, export, cover-letter rendering and computation entry points documented in `Environment.md`. |
| `Review/` | Local review reports for their recorded source versions. |
| `build/` | Local snapshots, inventories, build logs, renders, computation records and exports. |

## Recorded submission checks

The [submission check of 13 October 2026](Submission/submission-check-2026-10-13.md) records source preservation, journal requirements, native builds, page inspection and export consistency. Its outputs had 19 journal pages and 13 `amsart` pages. These are dated results, not validation of later edits.

The [preparation record](SUBMISSION_PREPARATION.md) links the original inventory and checked exports. Mathematical status and computation limitations are recorded in [PROJECT_KNOWLEDGE.md](PROJECT_KNOWLEDGE.md); build and export commands are maintained in [Environment.md](Environment.md).
