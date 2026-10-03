# Submission files

**Prescribed ideal classes and elliptic points in Ennola cubic fields**, Junyu Lu. Updated 3 October 2026, with Publicationes Mathematicae Debrecen and the Canadian Mathematical Bulletin under consideration.

See [journal options and current files](journal-options-2026-10-03.md) for the two cover letters, confirmed publication-status declaration, current journal guidance, and remaining author-supplied declaration details. The current main and Debrecen PDFs have 16 and 18 pages, respectively; their source bodies agree except for the document-class line. The material below describes the existing Debrecen export workflow. The earlier ZIP is an older snapshot, and the packaging script must be adjusted before a new export.

The manuscript PDF and its LaTeX source are in `Draft/`, together with the bibliography, generated bibliography and unmodified journal class. Optional arithmetic-check code is in `Computations/verify-finite.m`; the separate explanation is `Computations/finite-verification.md`. The explanation identifies the exact scope, software use and successful check. Its linked run records are included under `build/online-magma/`. Exported packages contain their own `manifest.json`; no current package manifest is implied by this working directory.

The manuscript presents mathematical proofs with explicit finite calculations. It contains no software-dependent exact-rank examples. The optional code checks arithmetic in those proofs; the mathematical arguments and cited theorems do not depend on running it. Unfinished development experiments are excluded from this package.

The [journal's author instructions](https://publi.math.unideb.hu/for-authors) request a PDF for initial submission and require disclosure of CAS and AI use. The code and its separate explanation are available for that purpose. The author confirmed that the local software used for development attempts is licensed. The manuscript retains the author's AI-assistance statement, now including editorial polishing. The cover letters include only the author's confirmed statement that the manuscript is unpublished and not under consideration elsewhere; other submission attestations have not been inferred.

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
