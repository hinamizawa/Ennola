# Editorial revision and subsequent whole-manuscript proofreading

Date: 2026-10-13. Manuscript: [ennola-squareclasses.tex](../Draft/ennola-squareclasses.tex).

## Scope and method

The revision implements the terminology and wording review requested by the author, while preserving the author's newer layout. It uses the `avoid-ai-writing` skill in technical editing mode. After the first revision, the complete candidate was reread from its title through its final question and bibliography, including unchanged passages. Corrections from that reread were applied in a second editing pass. All 13 compiled pages were then inspected.

The earlier report was used to make the requested revision. The subsequent proofreading did not consult earlier mathematical-review verdicts, but prior exposure cannot be erased; this procedure is not a claim of informational independence. This was a full proofreading pass, not a new comprehensive proof audit or a rerun of all exact computations.

The starting manuscript SHA-256 was `3F2BC00B7D6F4281FD60BAD82E9479EB7A342168EA0DBFCB0F4BED06319B5B8E`. The revised manuscript SHA-256 is `ED12A612B398E01A449F8ED55751359F577B03853356E28BFEB778705428C120`. A hash-verified original, the candidate, checks, logs, and rendered pages are retained under `build/polish-2026-10-13/`.

## Changes made

- Clarified the title so that the cubic fields and the associated elliptic curves have their intended roles. Retained the author's short title.
- Replaced the remaining use of “elliptic points” with “rational points on elliptic curves.” Retained “squareclass,” which the preceding Shared-library review established as standard usage.
- Distinguished prime ideals from their classes, and exact ideal-class orders from ranks or rank lower bounds. Replaced “rational fibres” with elliptic curves over the stated field or fibres over rational points of the base.
- Identified the order $\mathbb Z[\theta]$, the map whose kernel is being discussed, and the two generators used to compare orders. Replaced distant references to equations and square conditions with numbered references.
- Replaced “unramified radical” with a quadratic extension and stated linear disjointness over the correct base field. Explained the signature and congruence conditions in ordinary mathematical language.
- Made the Pell discussion explicit about initial solutions, the finite reduction interval, nonnegative powers of the fundamental unit, periods, and the indices at which coordinates vanish. The table data and recurrence were preserved.
- Expanded “half-combination” into the actual operation in the saturation arguments. Clarified the role of the local ring, properness, and the specialization homomorphism in the function-field arguments.
- Clarified the pencil of quadrics, its projective zeros, the canonical sheaf, and residue congruences at prime ideals. No new mathematical terminology was introduced.
- Corrected grammar, sign-choice wording, and the punctuation following the norm identity. Kept the final question as an open question.

The fresh reread additionally corrected an ambiguous description of the relation between field and polynomial discriminants, the wording of the basis argument modulo four, the placement of the prime-divisor condition in the composite-parameter proof, and the qualification “nontrivial integral relation” in both specialization arguments. A long line in the Pell paragraph was reworded without changing its numerical content.

## Bibliography and source use

The author's live `Draft/ennola.bib` was preserved without rewriting its entries or adding an arXiv-version note. During the work, the author also removed a stray closing brace; the final build uses that live correction. The author's existing deletion of the printed arXiv note from the Kala--Sgallova--Tinkova entry is retained.

The local source confirms the cited norm bound in its section 3.5, Proposition 3.7. The published article's proposition numbering was not accessible for verification, so the two manuscript citations now cite the article without an unverified locator. The publication details were checked against the author's publication list. Exact access and reading scopes are recorded in `build/polish-2026-10-13/source-manifest.json`; no library PDF was modified.

## Checks and outcomes

| Gate | Outcome |
| --- | --- |
| Whole-manuscript proofreading | Title, abstract, all six sections, proofs, remarks, final question, and generated bibliography reread; all 13 pages visually inspected. No outstanding editorial defect was identified. |
| Author's layout | The preamble before the title is unchanged from the author's current-layout source, including `amsart`, 11 pt type, left equation numbers, letter paper, and 1.15-inch margins. |
| Source preservation | All 58 mathematical displays retain their mathematical content; only the norm identity's sentence punctuation changed. Both tables retain their data. All 28 labels, 14 citation keys, environment order, author metadata, and commented material are preserved. |
| Statements and notation | All theorem and corollary statements are unchanged. Three lemma/proposition/remark passages have wording clarifications; their hypotheses and conclusions are unchanged. Added inline notation only makes the existing map, coefficients, bases, or residues explicit. |
| Requested writing skill | Two editing passes. The marks normalizer made no change to the 29 eligible changed prose paragraphs. The detector's remaining “Moreover” is an ordinary connective in a theorem and was retained. The generic preservation validator reported no errors; numeric warnings were reviewed against the actual LaTeX diff. |
| Compilation | Candidate and final manuscript compiled with `scripts/build.ps1` and the configured MiKTeX `pdflatex`/BibTeX tools. Final output: 13 pages; no TeX errors, undefined references or citations, BibTeX warnings, or overfull/underfull boxes. |
| Rendered output | Every candidate page was inspected at 115 dpi. All 13 final page images are byte-identical to the inspected candidate images. |
| Mathematical validation | Checked the meaning and scope of the editorial changes, including hypotheses and the added explanatory notation. No theorem, bound, table datum, or computation was intentionally changed. A new comprehensive proof audit was not performed. |
| Exact computation | Pell tables, finite-field point counts, residue matrices, and other numerical identities were not recomputed in this editorial task. Their source content was preserved. |
| Other working files | The cover-letter edits, submission-source snapshot, verification scripts, and downloaded journal class were preserved. No submission package was regenerated and no manuscript was submitted. |

The generic validator's numeric warnings arose from removing the unverified citation number `3.7`, writing the small numerical ranks in words, making the Pell range and orbit formulas explicit, moving a bound from a table heading into its caption, and writing out coefficients and residue notation. They do not indicate changed table data or displayed mathematical identities.

The only LaTeX warning is that shell escape is disabled for `epstopdf`; this document needs no EPS conversion. Poppler also reported that it could not write its per-user MiKTeX log, but successfully generated all requested page images. The dated record here identifies the actual run date; the existing build script's legacy date stamp was not edited.

## Reproduction and artifacts

From the repository root in PowerShell:

```powershell
./scripts/build.ps1 -Source 'Draft/ennola-squareclasses.tex' -OutputDirectory 'build/polish-2026-10-13/compiled-final'
```

The final PDF is `build/polish-2026-10-13/compiled-final/ennola-squareclasses.pdf`, SHA-256 `325BAB2AC860EA4264AF1F415185E9AB3E729BBB5709FF7D3BCC86E212B2D40B`. Machine-readable evidence is in `preservation-checks.json`, `writing-checks.json`, `render-comparison.json`, and `final-verification.json` in the same run directory. These build artifacts remain outside Git.
