# Mathematical scope and manuscript status

Mathematical status checked on 26 October 2026 against the [manuscript](Draft/ennola-squareclasses.tex), titled **Ideal Classes of Order $2^n$ in a Family of Totally Real Cubic Fields and Rational Points on Associated Elliptic Curves**. The dated [final submission check](Submission/submission-check-2026-10-26.md) distinguishes the whole-manuscript audit from the subsequent preparation of files. The audit found no substantive mathematical defect; it does not certify priority or guarantee the absence of errors.

## Objects and conventions

For integers $a\geq3$, the defining polynomial is $f_a(X)=X^3+(a-1)X^2-aX-1$. The largest root is $\theta$, and $K_a=\mathbb Q(\theta)$ is a totally real, non-Galois cubic field. The polynomial discriminant is $(a^2+3a-1)^2-32$; it must not be confused with the field discriminant. Ideal classes are ordinary classes of the maximal order, including when $\mathbb Z[\theta]$ is nonmaximal. The associated curve is $E_a:y^2=x(x+1)(x-a)+1$, with $N_{K_a/\mathbb Q}(x+\theta)=x(x+1)(x-a)+1$. The manuscript distinguishes this field norm from the positive absolute norm of an ideal.

## Claims in the draft

| Result | Hypotheses and claim |
| --- | --- |
| Unit squareclasses | The four positive-norm unit squareclasses are represented by $1,\theta,\theta-1,\theta(\theta-1)$. The paper attributes this to Ennola and recalls Louboutin's proof. It does not assume the fundamental-unit conjecture. |
| Prescribed prime class | For every prime $\ell\geq5$ and $n\geq2$, an explicit prime above $\ell$ has exact order $2^n$. The formula for $\ell=137$ differs from the general formula. |
| Nonmaximal defining orders | For $a_n=(5^{2^n}-73)/12$ and $n\equiv13\pmod{110}$, the index is divisible by $23$. |
| Four points | If $a\equiv30$ or $34\pmod{52}$ and $u^2=12a+73$, $v^2=240a+4321$ with $u,v>0$, the four specified points are independent modulo torsion and generate a subgroup saturated at two. |
| Two ideal classes | The four-point hypotheses together with $137\nmid u$ and $\gcd(v,23\cdot2503)=1$ yield two independent ordinary ideal classes of order two and an explicit unramified biquadratic extension. |
| Pell classification | The proved finite reduction and complete residue periods give the two allowed Pell orbits and exponent classes printed in Section 5. |
| Rational family | Four independent sections over $\mathbb Q(t)$ generate a subgroup saturated at two. Exact generic rank is undetermined. |
| Genus-one base change | Five independent sections over $\mathbb Q(C)$ generate a subgroup saturated at two, and specialization yields infinitely many geometric isomorphism classes of rational fibres of rank at least five. |
| Integer rank-five parameters | The author poses only an incidental question about infinitely many integer parameters $a=3s^2+s-6\geq3$ of rank at least five; the formal conjecture has been deleted. The genus-one construction has only one integral $a$, namely $8$. |

Saturation at two is not a full Mordell--Weil basis assertion. The submission candidate omits the software-dependent exact-rank examples and the computed list of integer rank-five parameters, at the author's request. The remaining finite calculations are given as explicit identities, residue tables, point counts and a squareclass matrix within the written proofs. Optional scripts check these calculations; no theorem invokes a software rank bound or point-discovery routine.

## Submission preparation

The current preparation targets **Publicationes Mathematicae Debrecen**; earlier Canadian Mathematical Bulletin materials remain as dated alternatives. The manuscript includes context about exceptional units, a comparison with earlier work, and explicit number fields in norm notation. Software-dependent examples and the software citation are omitted; the unused bibliography entry remains in the authoring database. The main manuscript uses the author's `amsart` format. The submission source uses Debrecen's official class with `draft`, a preamble declaration for MSC 2020, a short author header, and no fabricated publication metadata.

On 26 October, all substantive passages, 15 formal statements and their proofs, two remarks, two tables, and all 13 active citation applications were examined from the current source. Lemma 3.1 was checked for arbitrary monic irreducible degree under its stated hypotheses. The unchanged optional finite verifier passed with local Magma V2.20-9; separate exact algebra, Pell-period and geometric checks also passed. The subsequent file preparation synchronized the final title and address, clarified the norm-one-unit sentence, and repaired the cover-letter rendering and export checks. The two manuscript bodies agree, the 13-page main and 18-page journal PDFs were rebuilt, and the author's abstract, bibliography and official class were preserved. Detailed source versions, locators, coverage limits and build/export records are linked from the [final submission check](Submission/submission-check-2026-10-26.md).

The [submission check of 13 October](Submission/submission-check-2026-10-13.md) preserves both TeX files byte for byte relative to its initial snapshots, including the original abstract. Their document bodies agree after whitespace normalization; their preambles intentionally differ. The 15 formal statements, 15 proofs, 28 labels, 51 internal reference uses and 15 cited bibliography keys are unchanged. Both native builds pass, with 13 pages in `amsart` and 19 in the journal format. The updated cover letter uses the current title and carries the AI disclosure. The historical optional finite check was inspected and its provenance verified, without a new execution or a new whole-paper proof audit. The export script now creates a matching, hash-verified package from the journal source and includes the cover letter.

The [fresh examination of 3 October](Review/2026-10-03-ennola-squareclasses-fresh-examination-01.md) and subsequent [editorial revision](build/polish-2026-10-03/REVISION.md) are historical records for an earlier source state. That revision fixed a stale conjecture reference, explained the largest-root convention, expanded two verification details, and improved transitions and page breaks. Its 16-page and 18-page outputs have been superseded. Gary Walsh is retained in both bibliography entries at the author's explicit request. The author confirmed that the manuscript is unpublished and not under consideration elsewhere; funding and competing-interest declarations remain unspecified.

The [editorial revision of 2 October 2026](build/polish-2026-10-02/REVISION.md) applies the review's grammar fixes, uses $d_a=\operatorname{disc}(f_a)$ and $\operatorname{disc}(K_a)$ to distinguish the polynomial and field discriminants, qualifies the Louboutin and Walsh comparisons, and clarifies selected proof steps. The two source bodies agree exactly, and both PDFs were rebuilt and visually inspected. This revision preserves theorem hypotheses and conclusions; it does not claim a new independent proof audit or new exact computation.

The author's subsequent edits received a [focused mathematical check](build/followup-edits-2026-10-02/CHECK.md). Describing the Hensel lift as a root in $\mathbb Q_p$ is valid because it lies in $\mathbb Z_p$ with the prescribed residue. Removing introductory numerical examples and the repeated exact-rank disclaimer leaves the proofs and stated bounds intact. No mathematical correction was needed; the main source was preserved, the submission source synchronized, and both PDFs rebuilt.

The [parallel integer rank-five search of 2 October 2026](Computations/integer-rank-five-search.md) completed 9998 broad jobs with $2\leq|s|\leq5000$, denominator bound 120 and residue primes up to 1009, followed by 998 deeper jobs with $2\leq|s|\leq500$, denominator bound 400 and residue primes up to 5003. Four local Magma V2.20-9 processes finished within 90 minutes 23 seconds. Fresh exact replays certified rank at least five for 42 distinct parameters, including 34 beyond the previous eleven-element list. Both manuscript hashes are unchanged. The [final records](build/integer-rank-five-2026-10-02/RESULTS.md) preserve exact points, residue witnesses and limitations; the search proves neither exact ranks nor infinitude. A separate structure check identifies a smooth genus-one simultaneous Pell curve for the two extra abscissae at $s=-69$.

## Evidence and limits

- Current sources and reading scope: [sources.json](sources.json).
- Original bytes and inventory: `build/submission-preparation-2026-10-02/original/` and `initial-inventory.json`.
- Proof preservation, compilation, finite computations and visual inspection are separate checks. Editorial preparation is not an independent whole-paper proof audit, an exhaustive priority search, or a prediction of acceptance.
- No manuscript submission or email has been made. AI assistance is disclosed in the PMD cover letter; the commented manuscript paragraph remains unchanged.
