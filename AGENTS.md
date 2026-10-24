# Ennola project instructions

This file adds Ennola-specific rules to the inherited global `AGENTS.md`. [README.md](README.md) maps the documentation; consult [PROJECT_KNOWLEDGE.md](PROJECT_KNOWLEDGE.md) when mathematical status is relevant and follow [Environment.md](Environment.md) for tool paths, builds, exports and computation settings. Keep each rule or procedure in its owning file and link to it elsewhere.

## Manuscript

- Use `Draft/ennola.bib` as the single authoring bibliography for both manuscript formats; exported copies are snapshots.
- Keep Markdown and LaTeX prose paragraphs on one source line.
- Keep written proofs independent of software output and optional verification scripts outside the paper. Do not restore the removed software-dependent exact-rank examples without a new request.
- Preserve the author's abstract unless its revision is explicitly requested. Retain `\documentclass[draft]{publmathdeb}` in the submission source.
- Keep `Draft/publmathdeb.cls` unchanged; its identity and hash are in `sources.json`. Put compatibility settings in the manuscript preamble.
- Before substantial manuscript revision, preserve a hash-verified original, prepare a separate candidate, compile and inspect it, then synchronize the authorized edits to the main manuscript.
- Use only supplied or confirmed author declarations; do not invent funding, competing-interest, originality or submission attestations.

## Sources, computations and artifacts

- Before library changes, read [../Shared/AGENTS.md](../Shared/AGENTS.md) and [../Shared/README.md](../Shared/README.md) and follow their intake and provenance conventions. Record this project's source use and exact reading scope in `sources.json`; leave other projects' notes and source-errata verdicts unchanged unless requested.
- The owner authorizes selected public-calculator jobs and local Magma fallback for timeouts. Create verification scripts for this project rather than importing another project's scripts or verdicts.
- Keep inventories, backups and run records under `build/`, and computation explanations beside their sources. Keep article PDFs, publisher samples, source extracts, local environments and generated outputs out of Git; exclusions are in `.gitignore`.

## Delivery

- The owner authorizes a focused commit and push after each validated major modification, following the global Git checks and any task-specific review-only boundary. Read-only work needs no commit.
- Preparing files does not authorize emailing or submitting the manuscript.
