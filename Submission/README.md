# Submission files

**Prescribed Ideal Classes in Ennola Cubic Fields and Rational Points on Associated Elliptic Curves**, Junyu Lu. Prepared for Publicationes Mathematicae Debrecen; checked on 13 October 2026.

This README describes the exported package. Its 19-page manuscript uses the unmodified journal class and the `draft` option shown in the journal's example. The author's abstract is unchanged. Hyperlinks are disabled by draft mode; references and citations resolve normally. The separate 13-page `amsart` version remains in the working project.

The package contains:

- `Draft/ennola-squareclasses.pdf` and `Draft/ennola-squareclasses.tex`: the matching journal PDF and source. The exported TeX is a snapshot of the working project's `ennola-squareclasses-submission.tex`.
- `Draft/ennola.bib`, `Draft/ennola-squareclasses.bbl`, and `Draft/publmathdeb.cls`: the bibliography, generated references and journal class.
- `Submission/cover-letter-pmd.md` and `Submission/cover-letter-pmd.pdf`: the current title, author details, publication-status declaration, and AI and software disclosures.
- `Computations/verify-finite.m` and `Computations/finite-verification.md`: optional exact arithmetic checks and a separate explanation.
- `scripts/magma-online.py` and the successful historical record under `build/online-magma/`: reproducible inputs, response and execution settings for the 2 October 2026 run. This run was not repeated during the submission check.
- `manifest.json`: sizes and SHA-256 hashes of all supplied files except the manifest itself.

The manuscript presents mathematical proofs with explicit finite calculations. It contains no software-dependent exact-rank examples. The optional code checks arithmetic in those proofs; the mathematical arguments and cited theorems do not depend on running it. Unfinished development experiments are excluded from this package.

The [journal's author instructions](https://publi.math.unideb.hu/for-authors) were checked on 13 October 2026. Initial submission uses the PDF; the source files are also prepared here. The cover letter carries the AI disclosure and the author's confirmation of licensed local software use. The manuscript's proofs are independent of software output. The cover letter retains the author's confirmed statement that the manuscript is unpublished and not under consideration elsewhere. Other submission attestations have not been inferred, and no email or journal submission has been made.

## Build

From `Draft/`, use an installed LaTeX distribution with these commands:

```text
pdflatex -interaction=nonstopmode -halt-on-error ennola-squareclasses.tex
bibtex ennola-squareclasses
pdflatex -interaction=nonstopmode -halt-on-error ennola-squareclasses.tex
pdflatex -interaction=nonstopmode -halt-on-error ennola-squareclasses.tex
```

Repeat the last command if a reference-rerun warning remains. No shell escape or `TEXINPUTS` change is needed. The supplied PDF was built with MiKTeX pdfTeX 4.27 / MiKTeX 26.5 and BibTeX 4.2. The official [publmathdeb.cls](https://publi.math.unideb.hu/publmathdeb.cls) is unchanged; the manuscript preamble supplies the MSC 2020 heading for this older class.

The additional packages come from CTAN: [LaTeX base](https://ctan.org/pkg/latex-base) (`fontenc`, `inputenc`), [Latin Modern](https://ctan.org/pkg/lm), [Euler VM](https://ctan.org/pkg/eulervm), [AMS mathematics](https://ctan.org/pkg/amsmath), [AMS fonts](https://ctan.org/pkg/amsfonts), [AMS theorem support](https://ctan.org/pkg/amsthm), [booktabs](https://ctan.org/pkg/booktabs), [array](https://ctan.org/pkg/array), [enumitem](https://ctan.org/pkg/enumitem), [xurl](https://ctan.org/pkg/xurl), [hyperref](https://ctan.org/pkg/hyperref), [cleveref](https://ctan.org/pkg/cleveref), and [orcidlink](https://ctan.org/pkg/orcidlink).
