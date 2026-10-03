# Journal options and cover letters

Prepared 3 October 2026 for Junyu Lu's “Prescribed ideal classes and elliptic points in Ennola cubic fields.” The author is considering Publicationes Mathematicae Debrecen and the Canadian Mathematical Bulletin. No submission has been made.

## Files

| Use | File |
| --- | --- |
| Main manuscript, 16 pages | [PDF](../Draft/ennola-squareclasses.pdf), [LaTeX](../Draft/ennola-squareclasses.tex) |
| Debrecen manuscript, 18 pages | [PDF](../Draft/ennola-squareclasses-submission.pdf), [LaTeX](../Draft/ennola-squareclasses-submission.tex) |
| Debrecen cover letter | [Editable Markdown](cover-letter-pmd.md), [one-page PDF](cover-letter-pmd.pdf) |
| Bulletin cover letter | [Editable Markdown](cover-letter-cmb.md), [one-page PDF](cover-letter-cmb.pdf) |
| Optional arithmetic checks | [Magma code](../Computations/verify-finite.m), [scope and execution record](../Computations/finite-verification.md) |

The two manuscript sources have identical content apart from their document-class lines. The main file uses `amsart`; the submission file uses the unchanged official `publmathdeb` class. A separate Bulletin-class version has not been prepared. PDFs are local generated files and are excluded from Git by project policy.

## Publicationes Mathematicae Debrecen

The current [author instructions](https://publi.math.unideb.hu/for-authors) specify initial PDF submission by email to `publ.math@science.unideb.hu`, prefer the journal's LaTeX class, and request disclosure of AI use. They also request CAS code and a separate explanation. The existing Debrecen source and optional verification files support this route. The cover letter includes the AI disclosure and identifies the accompanying code.

## Canadian Mathematical Bulletin

The [author-instructions overview](https://www.cambridge.org/core/journals/canadian-mathematical-bulletin/information/author-instructions) states a maximum of 24 pages, while the [manuscript-preparation page](https://www.cambridge.org/core/journals/canadian-mathematical-bulletin/information/author-instructions/preparing-your-materials) states 22 pages and an abstract of at most 200 words. The current main PDF has 16 pages and its abstract has 79 whitespace-delimited tokens, so these conflicting page limits do not presently affect it. The preparation page also provides a journal class and specifies an alphabetical bibliography, MSC information, and author contact details at the end.

The official submission link leads to [MSP EditFlow](https://ef.msp.org/submit_new.php?j=cms_cmb). The [publishing-ethics policy](https://www.cambridge.org/core/journals/canadian-mathematical-bulletin/information/journal-policies/publishing-ethics) requires a competing-interest declaration. That information remains to be supplied by the author. Funding information also remains unspecified. Neither absence has been converted into a declaration of “none.”

## Choosing and using a letter

Both letters describe the explicit constructions and their dependence on established methods, without claiming a new general method or a priority result. The Debrecen letter gives more space to the ideal-class construction; the Bulletin letter emphasizes the connection with elliptic curves. These are editorial choices, not predictions of acceptance.

The author confirmed on 3 October 2026 that the manuscript is unpublished and is not under consideration elsewhere; both letters include that statement. Choose the corresponding letter and update its date when submitting. Its affiliation, email, and ORCID are copied from the current manuscript. No funding, competing-interest, or institutional-approval attestation has been invented.

## Revision and validation

The [fresh examination](../Review/2026-10-03-ennola-squareclasses-fresh-examination-01.md) supplied the revision basis. C01, M01–M02, and E01–E07 were addressed. The optional B01 change to initials was declined at the author's direction: both bibliography entries retain `Walsh, Gary`, consistent with his [personal website](https://sites.google.com/view/gary-walsh). The largest-root convention remains, with an explanatory sentence; the deleted conjecture stays deleted, and the incidental question remains brief.

Both manuscripts were built with the configured native MiKTeX script and visually inspected. All 15 numbered theorem, proposition, lemma, and corollary statements are unchanged from the reviewed main source, as are all 28 labels. All 14 citation keys and all internal references resolve. The final logs contain no overfull or underfull boxes; the sole warning concerns deliberately disabled shell escape. Detailed hashes, backups, source checks, and build records are in [the revision directory](../build/polish-2026-10-03/REVISION.md). This editorial revision does not constitute another independent whole-paper mathematical audit.
