# Fresh examination of `ennola-squareclasses.tex`

Date: 3 October 2026 (Asia/Shanghai). Reviewed source: [Draft/ennola-squareclasses.tex](../Draft/ennola-squareclasses.tex), all 583 lines, at Git commit `d4936e851a0a88e3dc39ca24526d53c1f828eee2`. The fresh build has 15 pages. Line numbers below refer to this unchanged source; theorem and page numbers refer to that build.

## 1. Overall assessment

I found no false substantive mathematical statement or material proof gap in the current manuscript after reconstructing every argument, checking the cited passages, and reproducing the material finite calculations. In particular, the proof works in the maximal order without assuming that the defining order is maximal; the independence and saturation arguments use only the properties of the descent map actually proved; and the rank-five infinitude is correctly confined to rational parameters. This is a bounded review result, not a certificate of correctness or a claim about novelty, acceptance, exact ranks, or full Mordell–Weil bases.

There is one necessary consistency correction: **C01**, the introduction's reference to an undefined conjecture, which appears as “Conjecture ??” and causes the configured build check to fail. The author clarified during this examination that the numbered conjecture was intentionally removed because the remaining question is an incidental aside. The proposed correction removes the stale introductory reference and preserves that choice. **B01** is a minor optional normalization of Walsh's published author initials. **M01–M02** and **E01–E07** are optional improvements to proof detail and exposition, with concrete wording or calculations below. E07 preserves the author's confirmed choice of the largest root and supplies an explanatory sentence. No proposed change requires weakening a proved theorem.

### Freshness and procedure

The parent chat already contained project-routing context. Reading operational parts of `README.md`, `Environment.md`, the headings of `PROJECT_KNOWLEDGE.md`, and `sources.json` also exposed brief historical status or provenance strings. Those strings were not used as evidence. No previous review report, revision diff, manuscript-specific memory file, saved correctness verdict, old mathematical verification output, Shared article note, or project errata register was consulted. Mathematical-status sections of the project knowledge file were excluded. The claim inventory below was built from the current source, including unchanged passages, before integrating the new source checks.

The review used the academic research suite's source-checking and bounded-delegation guidance, adapted to the requested mathematical audit and single-report format, and the PDF skill for source and rendered-page inspection. Three separate native agents checked number-theory sources, elliptic-curve sources, and the complete proof structure. They began from the current manuscript and assigned primary sources, without earlier verdicts or peer findings. Their evidence was integrated with the parent's full-source reading, exact computation, structural checks, and PDF inspection. This is a shared model environment; separate agents do not establish statistically independent errors or a calibrated review panel.

The manuscript, bibliography, reference PDFs, project instructions, and configuration files were preserved. Only this report and supporting run files were created. No mathematical repair was applied, and no commit, push, email, or submission was made. This was review-only work under the project's explicit exemption from routine publication.

## 2. New claim inventory and dependency map

### Main dependencies

```text
Field identities, root intervals, odd discriminant
  + Louboutin/Ennola squareclass argument + Dirichlet
      -> Lemma 2.1: norm-one unit squareclasses
      -> Lemma 2.2: unit-times-square obstruction modulo 4
          + simple-root Hensel factorization (Lemma 3.1)
              -> Theorem 1.1: prescribed prime, exact order 2^n
              -> Corollary 3.2: composite norm
              -> Proposition 3.4: nonmaximal-order subsequence
          + residue tests modulo 13
              -> Lemma 2.3: four independent element squareclasses
                  + chord-and-tangent descent
                      -> Theorem 1.2: four points, saturation at 2
                  + Lemma 3.1 + virtual-unit sequence (Lemma 4.1)
                      -> Theorem 1.2: two independent ideal classes
                          + signatures and dyadic quadratic algebra
                              -> Corollary 4.2: unramified biquadratic extension

Pell reduction to 0 <= u_0 < 107 + complete finite congruence checks
  -> Theorem 5.1: all admissible Pell parameters, infinitely many j-values
  -> Proposition 5.2: ideal-class subsequence
       + finiteness of the unit equation (Silverman IX.4.1)
           -> infinitely many cubic fields
Theorem 1.2 at a = 134 + proper good specialization
  -> Corollary 5.3: four independent sections, saturation at 2 over Q(t)

Intersection of two quadrics + finite-field counts + reduction of torsion
  -> C smooth of genus 1, C(Q) infinite
Five local residue characters at a_0 = -5556/961
  -> five independent specialized points
       + proper good specialization + no generic 2-torsion
           -> five independent sections, saturation at 2 over Q(C)
Nonconstant j + Silverman C.20.3 + C(Q) infinite
  -> Proposition 6.1: infinitely many geometrically distinct rank >= 5 fibres
Real inequalities + finite integer square check
  -> Remark 6.2: the genus-one construction has only the integral value a = 8
```

The introduction's statements of Theorems 1.1 and 1.2 are proved later, with no circular dependency. The norm bounds cited in the introduction are alternative arguments under a maximality assumption, not dependencies of the local proof. Walsh, Duquesne, Laoudi, Buell–Ennola, and Pincus–Washington provide context rather than imported steps in the new proofs. The fundamental-unit conjecture is not used. The final infinitude question is not a premise of any result.

### Coverage record

Status **checked** means the indicated claim was reconstructed and its relevant computations or source application were examined, with no mathematical issue identified. **Finding** identifies a defect or an explicitly optional suggestion. It does not mean that every foundational theorem was reproved.

| ID | Current location | Claim and verification | Status |
|---|---|---|---|
| A01 | Lines 1–49; title, preamble, author block | Definitions of theorem environments, macros, mathematical title, and author fields read. No mathematical notation collision or compilation defect found. Author identity/address/ORCID remain supplied information. | Checked; personal metadata not independently authenticated. |
| A02 | Lines 52–54, abstract | Prescribed prime order, rank four, complete Pell parametrization, generic rank five and saturation, and infinitely many geometric rational fibres agree with the body. | Checked; E01 optional precision. |
| A03 | Lines 60–74, 140–144; (1.1), (1.2), (2.1) | Rational-root test, three root intervals, signatures, norms, discriminant, non-Galois conclusion, odd index, dyadic maximality, elliptic nonsingularity, and norm conventions. For $A=a^2+3a-1\ge17$, $d_a-(A-1)^2=2A-33>0$. Also $N(x+\theta)=-f_a(-x)$. | Checked by algebra and exact identities. |
| A04 | Lines 66, 132–136; literature overview | Fundamental-unit conjecture kept separate from known squareclasses; earlier class-group and elliptic constructions attributed with suitable restrictions. | Checked against sources S01–S14; M01 and B01 optional. |
| A05 | Lines 76–128; main-result summaries | Theorem statements match their later proofs. The example $a=134$, $(u,v)=(41,191)$ is admissible and minimal. The rational/integer distinction is generally explicit. | Checked with finding C01 at line 128. |
| A06 | Lemma 2.1, lines 146–164 | The transform $\epsilon=\theta/(\theta-1)$ generates the field. Squaring conjugates gives $(s-w)(s+w+2)=1$, hence only $a=-2,2$ in the hypothetical square case. Dirichlet and the norm of $-1$ give exactly four positive-norm unit squareclasses. | Checked; adapted source proof inspected. |
| A07 | Lemma 2.2, lines 166–184 | Odd index justifies reduction in the free basis modulo four. The unique square roots modulo two have the printed incorrect-square residues modulo four. Signatures and the norm-one unit representatives exclude every unit-times-square possibility. A square root of an integral element is integral. | Checked; exact quotient-ring replay. |
| A08 | (2.2), Lemma 2.3, lines 186–213 | Norms of $\alpha,\beta$ and all 15 nontrivial squareclass products: 3 unit products, 8 involving exactly one of $\alpha,\beta$, 2 ruled out by signs, and 2 by residues. The displayed primes at 13 really belong to the maximal order because the relevant factors are simple. | Checked; factorizations and residues replayed. |
| A09 | Lemma 3.1, lines 219–236 | Hensel splits off a $\mathbb Z_p$ factor. Normalization preserves the product and the complementary unit. Only one degree-one, unramified prime above each $p\mid m$ divides the element; its valuation is $Nv_p(m)$. The ideal sum takes the minimum with $v_p(m)$. | Checked, including composite $m$ and the vacuous case $m=1$; no monogenicity assumption used. |
| A10 | (3.1), Theorem 1.1 proof, lines 238–262 | General norm identity, both congruence constructions and derivative tests, parameter minima, and the principal-half-power contradiction proving exact order $2^n$. Unbounded class orders imply infinitely many field isomorphism classes. | Checked by proof and exact identities. |
| A11 | Corollary 3.2, lines 264–270 | The primewise derivative condition follows from $\gcd(m,6\cdot137)=1$; the same ideal and exact-order argument applies. | Checked. |
| A12 | Remark 3.3, lines 272–278 | The minimal polynomial and three normalized reductions at 137 are integral for $N\ge4$. Their simple nonzero roots give valuations $N-1,1,0$, complete splitting, and norm $137^2$ for the rejected ideal. At $x=-23/24$, the proposed ordinate would satisfy $y^2=137^N/24^3$, which is not a rational square. | Checked by algebra and valuation arguments; E03 optional organization. |
| A13 | Proposition 3.4, lines 280–301 | Modular progression gives $a\equiv231\pmod{529}$; the printed monic polynomial for $(\theta^2-13\theta+30)/23$ is exact. Its class in $\mathcal O_K/\mathbb Z[\theta]$ has additive order 23. Field infinitude follows from unbounded class orders. | Checked by direct traces/norms and exact replay. |
| A14 | Lemma 4.1, lines 305–324 | Even valuations give a unique square-root fractional ideal; the kernel is precisely norm-one units modulo unit squares. Multiplication by $-1$ corrects the norm sign in odd degree, proving surjectivity onto the ordinary class-group two-torsion. | Checked; ordinary and narrow classes are not conflated. |
| A15 | Theorem 1.2, lines 326–340 | The line-intersection identity proves the descent homomorphism, including tangency and the vertical-line case. Irreducibility excludes rational two-torsion. A primitive relation modulo torsion contradicts independent descent values. The halving argument proves exactly the stated saturation property. | Checked; no assertion that the descent kernel equals doubles is required. |
| A16 | Theorem 1.2, lines 342–350 | The square conditions give the stated gcd restrictions. Both derivatives and exceptional prime exclusions permit Lemma 3.1. The virtual-unit exact sequence and four independent squareclasses then give $(\mathbb Z/2\mathbb Z)^2$ in the class group. | Checked by algebra, exact replay and exactness. |
| A17 | Corollary 4.2, lines 353–370 | Both radicals are totally positive with even finite valuations. The two congruences modulo four are correct. The displayed integral quadratic algebra has unit discriminant and is unramified or split at dyadic primes. The radicals are independent. | Checked; source strategy is not imported with an invalid Galois hypothesis. E05 optional page-break repair. |
| A18 | Corollary 4.3, lines 373–384 | Norm identity gives the third point; the same three independent squareclasses prove independence and saturation at two. | Checked. |
| A19 | Theorem 5.1, lines 388–408 | Every positive Pell solution reduces by a unique nonnegative power of $\eta$ to integral coordinates with $0\le u_0<107$. The modular filters and final square test leave exactly the two displayed seeds. No claim that $\eta$ generates all units of the maximal quadratic order is needed. | Checked; exhaustive finite reduction and enumeration reproduced. |
| A20 | Theorem 5.1, lines 410–439; Table 1 | Translation to $u^2\bmod624$, first-return period 56 for both seeds, all four rows of successful exponents, repetition modulo 28, minimal parameter 134, and strictly growing positive coordinates. The formula $j(E_a)=256(a^2+a+1)^3/d_a$ is exact and unbounded along these parameters. | Checked; both complete periods replayed. |
| A21 | Proposition 5.2, lines 442–469; Table 2 | Periods 46, 8, 2504; zero lists; short longest-period certificate; and equivalence $28r\equiv512\pmod{1252}\iff r\equiv63\pmod{313}$. The determinant-one recurrence has no preperiod. | Checked; full periods and certificate replayed. |
| A22 | Proposition 5.2, lines 471–475 | The unit equation has finitely many solutions in a fixed field. Distinct parameters give distinct exceptional units under any selected field isomorphisms because $a$ is recovered from $x$. Hence a finite collection of fields cannot contain the infinite parameter sequence. | Checked against Silverman IX.4.1. |
| A23 | Corollary 5.3, lines 478–502 | Conic parametrization from the printed line, specialization at $t=0$, good elliptic scheme, proper extension of every section, specialization of torsion relations, exclusion of generic two-torsion by monicity and integral closure, and halving. | Checked; rational identities replayed. |
| A24 | Proposition 6.1, lines 504–525 | The extra point satisfies the equation. The pencil determinant has four distinct roots, giving smoothness. The complete intersection is geometrically connected; adjunction gives genus one. The displayed bad-prime product excludes 17, 19 and 31. | Checked by diagonal-pencil/Jacobian argument and exact arithmetic. |
| A25 | Proposition 6.1, lines 527–537 | Every affine point and infinity point is included in the count formula. Counts are 16, 24, 28. All eight rational sign points lie on $C$. Reductions at 17 and 31 bound torsion by order four, so $C(\mathbb Q)$ is infinite. | Checked; complete finite counts reproduced; Silverman VII.3.1(b) checked. |
| A26 | Proposition 6.1, lines 539–559; (6.2) | The specialization $a_0$, all five point coordinates, irreducibility modulo two, five simple local roots, nonzero element residues, and the full-rank character matrix are correct. Irreducibility and nonsingularity suffice for the earlier descent argument at this rational parameter. | Checked by hand row reduction and exact replay; M02 optional explicit certificate. |
| A27 | Proposition 6.1, lines 559–561 | Proper good specialization transfers independence; monicity over the local DVR excludes generic two-torsion; the same even-coefficient argument gives saturation over $\mathbb Q(C)$. | Checked. |
| A28 | Proposition 6.1, lines 563–564 | $a$ and $j$ are nonconstant. Silverman's theorem applies to this genus-one base over $\mathbb Q$ and excludes only finitely many rational points. A nonconstant map from the smooth projective curve has finite fibres, giving infinitely many geometric elliptic isomorphism classes. | Checked against the precise source statement. |
| A29 | Remark 6.2, lines 566–568 | Integral $a$ lies in $[-6,8]$; a rational square root of an integer is integral. The five first-square values and their second-square tests leave only $a=8$, with $w=1$. | Checked; exhaustive exact integer calculation. |
| A30 | Line 570, final question | Changing the sign of $u$ permits $u=6s+1$, yielding $a=3s^2+s-6$. The question is explicitly open and only imposes the first square condition. | Checked as an algebraic reformulation; infinitude unresolved, as the manuscript states. C01 concerns its introduction reference. |
| A31 | Lines 573–583 and rendered bibliography | AI disclosure, bibliography commands and all 14 printed references read; all citation keys resolve. The disclosure's historical claim that the results predate AI use cannot be established from this source. | Checked as text; historical attestation unverified. |

There are **no unexamined substantive manuscript claims** in this inventory. There are no appendices or separately titled conclusion in this version; the concluding integrality remark, question, and disclosure were included. No exact-rank assertion is made in the manuscript. The unresolved mathematical items are the fundamental-unit conjecture and the final integer rank-five infinitude question, both presented as open background or questions. Their resolution is not required by the proved results.

## 3. Mathematical suggestions, separated from defects

### M01 — Make the alternative norm-bound deduction explicit

**Location:** introduction, line 134, PDF p.3. **Type:** optional explanation of a valid source application. **Severity:** low; no gap in the main proof. **Evidence:** S04–S05 prove the relevant norm lower bounds in the defining order; the manuscript supplies the maximality hypothesis but omits the short deduction linking these bounds to the prescribed ideal order.

**Suggested addition:** if $\mathfrak p^{N/2}=(\gamma)$, then $\gamma$ is integral and $|N(\gamma)|=\ell^{N/2}=\sqrt{12a+73}<2a-3$ because $a\ge46$ and $(2a-3)^2-(12a+73)=4(a-8)(a+2)>0$. The norm bound forces $\gamma$ to be associated to a rational integer, whose absolute norm is a cube. This is impossible since $\ell^{N/2}$ is not a cube: $N/2=2^{n-1}$ is not divisible by three. For Louboutin's formulation, set $m=a+1$; his restriction $m\ge60$ becomes $a\ge59$, and his bound $2m-5$ becomes $2a-3$.

For the change of defining order, one can add $\rho=\theta(\theta+a)$ and $\theta=\rho^2-(a+1)\rho-(a+1)$, so $\mathbb Z[\rho]=\mathbb Z[\theta]$. Both identities follow from the two defining cubics. This explains exactly why the maximality assumption transfers between the sources' coordinates. **Effect:** no changed hypothesis or conclusion; the optional alternative argument becomes independently checkable. The local proof and Proposition 3.4 remain independent of this assumption.

### M02 — Give a one-line certificate for the residue matrix

**Location:** Proposition 6.1, lines 549–559, equation (6.2), PDF p.13. **Type:** optional proof detail. **Severity:** low. **Evidence:** the displayed determinant is correct, but explicit row combinations are easier to verify than a bare five-by-five determinant assertion.

Let $R_i$ be the printed rows and $e_i$ the standard row vectors. Then $R_4=e_3$, $R_5+R_4=e_1$, $R_1+R_5=e_4$, $R_3+R_5=e_5$, and $R_2+e_3+e_5=e_2$. These equalities show directly that the rows span $\mathbb F_2^5$. **Repair available:** insert these combinations after the matrix, or retain the current determinant statement; either is a complete elementary certificate. **Effect:** none on hypotheses, conclusions, or the distinction between exact verification and the written proof.

### Mathematical objections tested and rejected

- **Nonmaximal defining orders:** the simple linear factor in Lemma 3.1 is already integrally closed. The argument does not assume the entire defining order is $p$-maximal.
- **Descent kernel:** neither the primitive-relation argument nor saturation requires proving $\ker\delta=2E(\mathbb Q)$. The homomorphism, independent images, and absence of two-torsion suffice.
- **Ordinary versus narrow class group:** the virtual-unit sequence uses positive field norm, while Corollary 4.2 separately checks total positivity to avoid ramification at real places. These are correctly different conditions.
- **Pell completeness:** the bound on reduced seeds is proved before enumeration, and the recurrence periods are complete first-return periods. This is not an unsupported extrapolation from a search.
- **Positive-rank base versus infinitely many rank-five fibres:** the proof also checks nonconstant $j$ and invokes the specialization theorem over an arbitrary curve, so the needed step is present.
- **Rational versus integral infinitude:** Proposition 6.1 asserts rational infinitude; Remark 6.2 correctly limits its integral values. No integer infinitude is deduced from this curve.

## 4. Necessary consistency correction and bibliographic suggestion

### C01 — Remove the stale reference to the intentionally deleted conjecture

**Location:** line 128, PDF p.3, referring to the question at line 570, PDF p.14. **Type:** confirmed cross-reference defect and imprecise summary of an open question. **Severity:** minor for the mathematical content, necessary for a clean manuscript/build. **Evidence:** the source contains `\ref{conj:integer-rank-five}` but no matching label and no conjecture environment. The fresh PDF prints “Conjecture ??”; all five LaTeX passes retain the undefined reference, and `scripts/build.ps1` rejects the build. The question at line 570 only assumes $a=3s^2+s-6\ge3$, equivalently the first square condition. It does not also assume that $240a+4321$ is a square.

The author clarified during this run that the conjecture was intentionally deleted and that the remaining question should have only incidental status. Restoring a numbered conjecture is therefore not proposed.

**Recommended replacement for the paragraph:**

> Proposition 6.1 gives infinitely many rational parameters with rank at least five by a further genus-one base change. This construction has only one integral value of $a$, as shown in Remark 6.2.

Use the existing `\ref{prop:rank-five-rational}` and `\ref{rem:rank-five-integrality}` for the numbers in the actual source. The brief question at line 570 can remain as written. **Effect:** no proved result changes. The repair removes the broken reference and the ambiguous comparison with the incidental question, without increasing that question's prominence. Rebuild afterward to verify resolution; this report has not applied the repair.

### B01 — Use Walsh's published initials consistently

**Location:** `Draft/ennola.bib`, lines 159 and 170; printed references [Wal23], [Wal24], PDF p.15. **Type:** optional bibliographic normalization. **Severity:** low. **Evidence:** both original papers have the byline “P. G. Walsh”; the [2023 journal record](https://hrcak.srce.hr/en/clanak/443907) uses the same initials. “Gary Walsh” is the same author's public name, so this is not a wrong-person attribution.

**Suggested change:** use `author = {Walsh, P. G.}` in both entries to match the publications. Keep titles, years, page ranges, and DOIs unchanged. **Effect:** attribution formatting only; no citation key, theorem attribution, or mathematical conclusion changes.

All 14 cited bibliography keys resolve. There are 28 source labels, no duplicate labels, and no other missing internal reference. The unused `BosmaCannonPlayoust1997` entry is not printed by this build; it causes no defect and need not be removed. No correction is proposed to other verified bibliographic fields. The KST proposition number is explicitly tied to arXiv version 2, appropriately avoiding an unverified transfer of numbering to the published edition.

## 5. Optional exposition and layout suggestions

Every item in this section is optional and low severity. The existing statements are mathematically adequate. None changes a hypothesis, conclusion, proof dependency, or attribution.

| ID and precise location | Issue and evidence | Concrete proposal and justification |
|---|---|---|
| E01 — Abstract, line 53, final sentence | “five independent sections, saturated at two” grammatically makes saturation a property of the sections themselves. The theorem correctly defines it for their generated subgroup. | “A genus-one base change yields five independent sections whose generated subgroup is saturated at two, and infinitely many geometrically nonisomorphic rational fibres of rank at least five.” This uses the same mathematical subject as Proposition 6.1. |
| E02 — Norm conventions, line 74, PDF pp.1–2 | The sentence explaining field norms repeats the already displayed $N_{K_a/\mathbb Q}$ and interrupts the transition from the common norm identity to the results. | Begin the convention paragraph: “For a number field $L$, $N_{L/\mathbb Q}$ denotes the field norm. For a nonzero integral ideal $\mathfrak c\subset\mathcal O_L$, set $N\mathfrak c=\#(\mathcal O_L/\mathfrak c)$, and extend this norm multiplicatively to fractional ideals.” Retain the existing squareclass, valuation, and identity-point conventions. This removes repetition without removing a convention. |
| E03 — Remark 3.3, line 277, PDF p.7 | One long paragraph contains three normalized polynomials, three Hensel lifts, a splitting/factorization conclusion, and a separate denominator observation. These are distinct steps, all of which checked correctly. | Split after the sentence identifying the three simple roots, and again after the norm of $(137,\alpha)$. Put the three reductions in an aligned display if desired. End separately with the exact identity $y^2=137^N/24^3$ at $x=-23/24$, which explains the nonsquare denominator. |
| E04 — Proposition 6.1 proof, lines 520–563, PDF pp.12–14 | The proof establishes four different conclusions across several dense paragraphs. Its logic is valid, but the reader must infer the transitions. | Add short lead-ins at the existing paragraph breaks: “First we show that $C(\mathbb Q)$ is infinite”; “We next prove independence by one specialization”; “We now prove saturation at two”; “Finally, we specialize to infinitely many fibres.” Retain the detailed arguments and all local hypotheses. |
| E05 — Corollary 4.2 statement, lines 353–359, PDF pp.8–9 | The current page break separates the displayed extension on p.8 from the conclusion “is biquadratic and unramified...” on p.9. This was observed in the fresh page images. | Keep the short corollary statement together, for example using the existing `samepage` pattern already used for Corollary 4.3. Do not force the whole proof onto one page. Recheck the resulting page break in a later authorized edit. |
| E06 — Earlier work, line 132, PDF p.3 | The broad phrase about Ennola's two-rank families is accurate, but the source's Theorem 6.1(iii) includes a sufficiently-large-parameter qualification; see S01. | “His Theorem 6.1 also gives families whose class groups have two-rank at least two for all sufficiently large admissible parameters.” This makes the scope of the historical result explicit without suggesting a defect in the present proof. |
| E07 — Choice of root, lines 60–64, and signature convention, line 140 | The author confirmed that $\theta$ should remain the largest real root and requested a possible explanation. This is a valid convention: the root in $(1,2)$ is the unique one for which both $\theta$ and $\theta-1$ are positive in the distinguished real embedding. | Keep “largest real root.” After the field definition, add: “This choice fixes the real embedding in which both $\theta$ and $\theta-1$ are positive.” If desired, clarify Section 2 with: “Order the three real embeddings so that the images of $\theta$ lie in $(-a,1-a)$, $(-1,0)$, and $(1,2)$, respectively.” The printed signature $(-,-,+)$ keeps its present meaning. |

The mathematical check behind E07 is that irreducibility identifies every field $\mathbb Q(\theta_i)$ with $\mathbb Q[X]/(f_a)$. The isomorphism $\theta_i\mapsto\theta_j$ carries the maximal order, units, principal ideals, named ideals, norm identities and squareclasses to the corresponding objects. The three conjugates have the same ordered signs, and the elliptic curve depends only on $a$. Thus choosing the largest root fixes the distinguished embedding consistently throughout the paper. The author's confirmed convention is retained; no change of root is proposed.

The remaining prose was read sentence by sentence after the mathematical check. I found no additional grammar or terminology problem requiring correction. The distinction between element squareclasses and ideal classes is explicitly stated; the switches from integer parameters to rational function fields are announced; and the references to rank lower bounds and saturation do not claim full bases or exact ranks. A separate conclusion or additional literature survey is not needed to repair any identified issue.

## 6. Source verification

The following source record identifies what was actually read, rather than treating extraction of a whole PDF as reading it. Local source paths and complete SHA-256 values are in the manifest table below. Statements of standard imported theorems were checked for applicability; their foundational proofs were not automatically re-audited. No source required for the manuscript's mathematical claims was unavailable or unreadable. Scanned passages in Ennola, Buell–Ennola and Gras–Gras were checked from rendered pages where extraction was inadequate.

### Statements, translations and reading depth

| ID / citation | Freshly inspected locator | Verification and limits |
|---|---|---|
| S01 / Ennola1991 | Chapter pp.103–104 for conventions; Proposition 3.3(i), p.109 (book PDF p.123); Conjecture 4.1, p.112 (PDF p.126); Proposition 6.1, p.117 (PDF p.131); Theorem 6.1 and proof, pp.117–119 (PDF pp.131–133). | Proposition 3.3 gives all eight unit squareclasses; the positive-norm subgroup has the manuscript's four representatives. Proposition 6.1 supplies the first unramified radical for $a\equiv2\pmod4$. Theorem 6.1 supplies two-rank families for sufficiently large parameters with stated exclusions. Those statements and their local proofs were read, but the source's large elimination computations and effective finiteness foundations were not replayed. The manuscript's broad historical description is faithful; retaining the qualification “for sufficiently large parameters” when giving any more detailed account would be appropriate. |
| S02 / Louboutin2017 | pp.153–154, family and conjecture; Lemma 6 and proof, p.157 (PDF p.5). | The source proves that the maximal-order unit index is odd for every parameter at least three. Its entire short proof was inspected and the manuscript's adaptation reconstructed. The exceptional square cases are exactly $a=-2,2$. No fundamental-unit conjecture is assumed. |
| S03 / Lee2010 | Theorem 1.1, p.38 (PDF p.1); proof, pp.39–40, especially its last paragraph. | The result gives actual ideal classes of any prescribed order, not merely class-number divisibility. Its family is $X^3-mX^2-(m+1)X-1$, with $m=a+1$ and $\rho=1/(\theta-1)$. The coordinate and defining-order identifications were checked algebraically. All three pages were read; Nakano's imported lemma was not separately re-proved. The source's negative-parameter presentation is compatible via $P_{-m-1}(X)=-X^3P_m(1/X)$. |
| S04 / Louboutin2001 | Family, pp.411–412; Theorem 10, p.422 (PDF p.12), proof through p.424. | For $m\ge60$, an element of $\mathbb Z[\rho_m]$ has absolute norm at least $2m-5$ or is associated to an integer. This theorem is unconditional; GRH restrictions elsewhere in the article do not apply to it. Statement and proof read; underlying unit-reduction results and every endpoint estimate were not re-proved. The exact translation and application are given in M01. |
| S05 / KalaSgallovaTinkova2025 | Local arXiv:2303.00485v2, dated 7 December 2024: §2.3, pp.6–7, and §3.5, Proposition 3.7 and proof, p.11. | The source's $\rho$ is the manuscript's $\theta$, with the same $a\ge3$. The norm bound is for the defining order, as the manuscript correctly acknowledges. Full proof on p.11 inspected; its indecomposable classification and Lemma 3.5 were treated as imported results, not fully re-audited. Published metadata was checked against the [publisher record](https://www.sciencedirect.com/science/article/pii/S0022314X25000228). Published full text/numbering was not available in that web retrieval; the manuscript explicitly cites the inspected v2 locator. |
| S06 / ChoiKim2025 | Published PDF pp.1–2: conjecture and Theorem 1. | The full maximal-order assertion remains conjectural in this source. The proved weak form says each fixed odd prime divides the unit index for only finitely many parameters. The manuscript does not conflate these statements or invoke the weak theorem in a proof. Later Laurent-polynomial proofs were not audited. This is verification of the source's scope, not a claim that a search has ruled out all subsequent developments. |
| S07 / Silverman2009 | Second edition, local corrected 2016 printing: VII.3.1(b), p.192 (PDF p.211); IX.4.1, p.282 (PDF p.299); C.20.3, p.457 (PDF p.471). | Good reduction and prime-to-residue-characteristic torsion hypotheses are used correctly. The unit equation applies with both coefficients one and the archimedean places. C.20.3 allows an arbitrary base curve over a number field with nonconstant $j$, hence applies to this genus-one base. All three statement pages were rendered and inspected; the reduction proof and opening S-unit proof sketch were read. The specialization theorem's original research proof and the Diophantine-approximation foundations were not re-audited. |
| S08 / GrasGras1975 | Chapter I, §6(a–c), Proposition I.5, printed p.5 (PDF p.6); continuation p.6 (PDF p.7). | The source discusses signatures, ordinary unramified extensions and dyadic square congruences. Its surrounding setup is real Galois, with two unramified and the radical prime to two. The manuscript cites a strategy and proves its own valid local criterion for the non-Galois cubic fields; it does not import the Galois/module hypotheses improperly. Source text and the manuscript's direct adaptation were checked. |
| S09 / Duquesne2001 | Introduction pp.91–92 (PDF pp.1–2), including Theorem 1.1 attributed there to Washington. | The reference genuinely discusses links between elliptic ranks and cubic class-group two-ranks. The manuscript claims only that such connections appear there. The cited setting is a simplest cyclic cubic family, not this Ennola family. No theorem from it is applied here; the later integral-point calculations were not rerun. The [publisher record](https://www.tandfonline.com/doi/abs/10.1080/10586458.2001.10504431) also confirms the DOI, year, volume/issue and pp.91–102. |
| S10 / Laoudi2006 | Introduction pp.31–33 (PDF pp.1–3), especially the exact sequences on p.32. | The described relation between elliptic points, Selmer groups and cubic class-group two-torsion is present. The source's cyclic-family and unit assumptions were inspected and are not silently transferred to the manuscript. Later proofs were not audited because the citation is contextual. Author, title, volume, pages and DOI also match the [journal record](https://web.math.pmf.unizg.hr/glasnik/vol_41/no1_03.html). |
| S11 / BuellEnnola1995 | Scanned pp.134–136 (PDF pp.1–3), equation (1.1), Theorems A–C. | Setting the source parameter $u=a-2$ gives the present cubic and quadratic resolvent. The source does study three-primary class information in that quadratic field. Statements and notation were visually inspected; theorem proofs were not audited because none is a dependency of the present arguments. The [publisher record](https://www.sciencedirect.com/science/article/pii/S0022314X85711067) confirms the DOI and publication metadata. |
| S12 / PincusWashington2023 | §4, pp.835–841 (PDF pp.17–23): Theorem 4.1, Lemmas 4.3–4.6, Propositions 4.10–4.12. | The source uses ideal powers and power-residue obstructions in a different cubic family, with prescribed orders prime to three. The manuscript only calls these constructions related. Relevant proof passages were read; the entire unit-index development in Lemmas 4.7–4.9 was not independently audited. The source's restrictions are not imported as a stronger theorem here. |
| S13 / Walsh2023 | Theorem 1.1, pp.81–82 (PDF pp.1–2); §2 proof discussion, pp.83–84. | The Pell solvability and auxiliary irreducibility conditions, and sufficiently-large-parameter restriction, are genuine hypotheses. The manuscript's summary retains the relevant qualifications. Source proof discussion read; its auxiliary-polynomial computations were not independently repeated. B01 addresses author byline style only. |
| S14 / Walsh2024 | §2, Type III, pp.3–4 (PDF pp.3–4), especially p.4. | The four-point construction is present and the independence assertion is explicitly computational in the source. The manuscript faithfully labels it computational evidence. Other sections were read for context; source numerical ranks were not certified. B01 addresses author byline style only. |

The two original-author Silverman errata files, dated 4 August 2011 and 13 October 2022, were searched afresh for the three used statements, pages and relevant terms. No applicable correction was located within those dated files. They are primary author errata, not previous project review verdicts. An exhaustive search of later online errata was not undertaken.

Bibliographic checking confirmed the identities and publication details of the 14 cited works against the inspected sources and the specified primary publisher records. Expanded given/middle names beyond initials-only source bylines were not all independently authenticated. No missing source or unreadable passage blocked a mathematical source application. A failed DOI or publisher web opening was not treated as a defective citation when the complete local primary source or a successful primary metadata record supplied the evidence.

### Exact local source identities

Paths are relative to this report. Hashes identify the actual PDF bytes inspected; the same files remained unchanged at final verification. The source manifests separately record extraction scope and actual reading scope.

| ID | Local source | SHA-256 |
|---|---|---|
| S01 | [Ennola chapter in the 1991 proceedings](<../../Shared/Books/Petho, Pohst, Williams and Zimmer (eds) - Computational Number Theory (1991).pdf>) | `0c67ff1a80fbb3c0c92408d6ec26684cbd4e37bd2a5236bfcfb630e37f05658c` |
| S02 | [Louboutin 2017](<../../Shared/Articles/Louboutin - Non-Galois cubic number fields with exceptional units (2017).pdf>) | `577510a79b592d5d2eb804f587639cbc5d3a714a78ddfc5bc0fee6edfd47e1e0` |
| S03 | [Lee 2010](<../../Shared/Articles/Lee - Divisibility of class numbers of non-normal totally real cubic number fields (2010).pdf>) | `b8676272b6b2d1f9ccc47f359aabfb47405dc3d2e91c40fb41952c5776fe76eb` |
| S04 | [Louboutin 2001](<../../Shared/Articles/Louboutin - Class number and class group problems for some non-normal totally real cubic number fields (2001).pdf>) | `e702fcfe31f71d6ae13eb8aeed48d4d5cd86384b9f7c3acacdad0b0fdcd07097` |
| S05 | [Kala–Sgallová–Tinková v2](<../../Shared/Articles/Kala, Sgallova and Tinkova - Arithmetic of cubic number fields - Jacobi-Perron, Pythagoras, and indecomposables (2024, arXiv v2).pdf>) | `bb325144c314fefa034a26250fe2703df71ba488af9575a6a11ff09eccfabafd` |
| S06 | [Choi–Kim 2025](<../../Shared/Articles/Choi and Kim - On a weak form of Ennolas conjecture about certain cubic number fields (2025).pdf>) | `d16e2559f9f8619deef01cf30682ee5d3f2d17023302d8abe4a348330697160c` |
| S07 | [Silverman, second edition](<../../Shared/Books/Silverman - The Arithmetic of Elliptic Curves.pdf>) | `3ec014da01d13b4a88acf409f2ea688bfbd1581b9d5157b015847e8d41793a5c` |
| S08 | [Gras–Gras 1975](<../../Shared/Articles/Gras and Gras - Signature des unites cyclotomiques et parite du nombre de classes des extensions cycliques de Q de degre premier impair (1975).pdf>) | `746ce6d84e327b91c12678d5092469539227f8380c01fc773de4e2c59f3e0138` |
| S09 | [Duquesne 2001](<../../Shared/Articles/Duquesne - Integral points on elliptic curves defined by simplest cubic fields (2001).pdf>) | `ca7936bc423e7154c5fd0521585c3fa0cf21a02f811ab55d212064acb0349485` |
| S10 | [Laoudi 2006](<../../Shared/Articles/Laoudi - 2-rang du groupe des classes et courbes elliptiques (2006).pdf>) | `3bce92801ad059c9efd02b5e30bbbc792ef7d079e66e038284c6983310bddbe4` |
| S11 | [Buell–Ennola 1995](<../../Shared/Articles/Buell and Ennola - On a Parameterized Family of Quadratic and Cubic Fields (1995).pdf>) | `9f779fce286187dc9abcba353f7adf2b0b4b4ebd7347fc5a96cdab30bddafe04` |
| S12 | [Pincus–Washington 2023](<../../Shared/Articles/Pincus and Washington - Relative ideal classes of arbitrary order (2023).pdf>) | `7ed48a85b35fd7a8cac2c8c3be5a61cdcc7bc079a62429db3f802c0e96d8e59e` |
| S13 | [Walsh 2023](<../../Shared/Articles/Walsh, P G - A note on lower bounds for ranks using Pell equations (2023).pdf>) | `abc5be6222d8f30ef1e16f35b90b6c0fb75e14386facb9e0219ec419e2edd016` |
| S14 | [Walsh 2024](<../../Shared/Articles/Walsh, P G - Specializations of a generic rank-2 curve of Shioda (2024).pdf>) | `f4f780ef3a2b7d633da4720c8ad872afe7ccdf07aaf884e6720231f249a9c538` |
| SE01 | [Silverman author errata, 2011](<../../Shared/Books/Silverman - The Arithmetic of Elliptic Curves - Errata (2011 author version, retrieved 2026-09-08).pdf>) | `cc89fd821b15df1fa2e139d32dbee447793ffc004fcf4f7cd962191873a2c37a` |
| SE02 | [Silverman author errata, 2022](<../../Shared/Books/Silverman - The Arithmetic of Elliptic Curves - Errata (retrieved 2026-09-06).pdf>) | `6c2274403a32af5d4b075c1504a1aaa04c9b304c0f94b8dd337f9c72d51f6f34` |

## 7. Mathematical and computational evidence

### Independent algebraic checks

The main reasoning was reconstructed from the written proofs, including sign conditions, norm signs, integrality of square roots, normalized finite valuations, ordinary versus narrow classes, primitive relations, proper specialization, and absence of generic two-torsion. Two useful calculations provide short checks beyond the printed formulas.

For Proposition 3.4, put $q=(\theta-3)(\theta-10)=\theta^2-13\theta+30$. Direct power sums give

$$
\operatorname{Tr}(q)=a^2+13a+78,\qquad e_2(q)=48a^2+626a+2017,\qquad N(q)=(6a+17)(90a+899).
$$

Substitute $a=231+529k$ and divide these coefficients by $23$, $23^2$, and $23^3$. This gives exactly the three coefficients in the manuscript's polynomial for $q/23$. Thus its integrality certificate is also verified by elementary trace and norm calculations.

For Proposition 6.1, the residues of $a_0$ at the five stated primes are $0,4,1,8,5$; the corresponding derivatives are $2,3,4,8,10$, all nonzero. Every tested element has nonzero residue. The row combinations in M02 verify the character matrix's invertibility without software.

### Newly reproduced exact calculations

The new script is [verify-current.m](../work/2026-10-03-fresh-audit-01/verify-current.m), SHA-256 `2ECDAFD6D4D908FE5164B2DE3FA65D61F4AF8B04A99BE1DE887B7232A2AA3BB9`. It was written from the current manuscript; no earlier verification script or output was used. Its coefficient systems are exact rational function fields, matrices over those fields, integer arithmetic, the quotient ring over $\mathbb Z/4\mathbb Z$, and finite fields. It uses no floating-point rank estimates, class-group algorithms, GRH assumption, BSD assumption, or random search.

The inspected existing utility `scripts/magma-online.py` sent the selected computation sequentially to the public Magma calculator. The [official calculator page](https://magma.maths.usyd.edu.au/calc/) was checked during this run: the advertised limits were 60 seconds and 50,000 input bytes. The successful response records **Magma 2.29-10**, seed **1**, 6,388 transmitted bytes, and 0.040 CPU seconds. The clean run contains all intermediate pass lines and `ENNOLA_FRESH_20261003_PASS`, with no detected Magma or assertion error.

Reproduction command, from the project root:

```powershell
& 'C:/Users/jylu/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -X utf8 'scripts/magma-online.py' 'work/2026-10-03-fresh-audit-01/verify-current.m' --name fresh-audit-20261003-replay --expect-pass ENNOLA_FRESH_20261003_PASS
```

| Gate | Exact checks and result |
|---|---|
| General algebra | Cubic discriminant, unit transform and polynomial, norms of all three linear forms, three derivative identities, elliptic discriminant and $j$, exceptional-137 constants, and nonmaximal-order characteristic polynomial: passed. |
| Local squareclasses | Both obstruction identities modulo four, exhaustive nonexistence of square roots in the 64-element quotient ring, Hilbert radical congruence, both cubic factorizations modulo 13, and nonsquare residues: passed. |
| Pell seeds | All $u_0\in\{0,\ldots,106\}$ checked; the successive filters are exactly those printed; only $13,41$ give squares: passed. |
| Pell congruences | Full period 56 for each seed modulo 624; all four table rows and hence the displayed residue lists modulo 28: passed. |
| Ideal-class subsequence | Full periods 46, 8, 2504; zero lists; short certificate residues; primality of 313 and 2503; congruence for the excluded $r$: passed. |
| Rational families | Conic identity and line parametrization, specialization at zero, rational sign points on $C$, nonsingularity at $a_0$, and all five specialized point coordinates: passed. |
| Genus-one base | Affine/infinity point counts $(16,0),(24,0),(24,4)$ at 17, 19, 31: passed. The geometric smoothness/genus argument was checked separately. |
| Five-point certificate | Irreducibility modulo two, every simple local root and nonzero value, all 25 character entries and determinant one: passed. |
| Integral parameters | Full interval $-6\le a\le8$; first-square list and all three simultaneous square conditions: passed, with only $a=8$. |

The first new run used the nonexistent Magma name `PowerMod` in three modular assertions. It was correctly recorded as `magma_error`, despite later pass strings, and is not counted as successful verification. Replacing those three calls by exact integer exponentiation followed by reduction gave the clean full replay. Both records were preserved:

- Failed initial run: `build/online-magma/20261003T023206560620Z-fresh-audit-20261003/`.
- Successful corrected run: `build/online-magma/20261003T023249614116Z-fresh-audit-20261003-corrected/`, with source, transmitted input, raw XML, extracted output and status. Transmitted SHA-256: `e201ac1953f077e3432cac0ca3908166086e0e5192cbf091a76bb567eda7b1b5`.

No local Magma fallback was needed. Earlier finite-check scripts, exact-rank examples, integer rank-five searches, class-group computations and specialization searches were neither used nor rerun. The finite enumerations above support infinite claims only through the reductions and arguments checked in the manuscript; a passed script alone does not establish those reductions.

## 8. Compilation, rendering, preservation and files

### Compilation and visual checks

The configured script was inspected and run against the unchanged main source:

```powershell
& './scripts/build.ps1' -Source 'Draft/ennola-squareclasses.tex' -OutputDirectory 'work/2026-10-03-fresh-audit-01/build'
```

The restricted launch failed before compilation. The approved native execution used the project's MiKTeX pdfLaTeX, not a bundled LaTeX compiler. The log identifies pdfTeX `3.141592653-2.6-1.40.29 (MiKTeX 26.5)` and BibTeX `0.99e (MiKTeX 26.5)`. BibTeX and all five TeX passes exited zero and produced a 15-page PDF; the build script correctly returned failure because C01 remained unresolved. There are no other undefined citations/references or reported overfull/underfull boxes in the final log. The `epstopdf` warning reflects deliberately disabled shell escape and did not prevent output. The existing script's JSON record has a hard-coded date of `2026-10-02`; the actual log headers and this report date establish that this run occurred on 3 October 2026. The script was not modified.

All 15 pages were rendered with the project's installed `pdftoppm.exe` at 90 dpi and inspected in five three-page sheets. The visible “Conjecture ??” and the split Corollary 4.2 statement are recorded above. No clipping, overlapping mathematical displays, missing glyphs or unreadable tables was identified at the inspected resolution. Python 3.12.14, pypdf 6.16.2 and Pillow 12.3.0 were used for extraction, file checks and arranging the inspection sheets; PyMuPDF was unavailable and was not installed. This layout inspection is distinct from reading the TeX and from mathematical validation. Fine prepress typography, journal-class output, print testing, and interactive clicking of every PDF link were not performed. The separate submission source was hash-preserved but was not substituted for the requested main manuscript or independently compiled.

The source-structure check found 3 theorem environments, 5 lemmas, 4 corollaries, 3 propositions and 2 remarks. The bibliography has 14 used keys and one unused entry. Its machine-readable result is [structural-check.json](../work/2026-10-03-fresh-audit-01/structural-check.json).

### Preservation hashes

| Protected source | SHA-256 before and after |
|---|---|
| `Draft/ennola-squareclasses.tex` | `F0BCFF950B96AFB5FADF6D543BE73AC9375BFC6BC96908A1C862727BFFCCD77F` |
| `Draft/ennola.bib` | `E9494659155EA2E5E086A58DBE32C42B26FA64F1C1037E66C9E652AB5C93BFFB` |
| `Draft/ennola-squareclasses-submission.tex` | `80339E9475DA5092517D383F249BE99B08EF1E64671F5A7F4A70422CD32F92D5` |
| `Draft/publmathdeb.cls` | `2DBDC5DA9E088DCB85BBFC3D95EB6142DF8C8BDE0D46093AFADF53766E8A456F` |

The before/after check also covers `AGENTS.md`, `README.md`, `PROJECT_KNOWLEDGE.md`, `Environment.md`, `sources.json`, `.editorconfig`, `.gitignore`, `.gitattributes`, `scripts/build.ps1` and `scripts/magma-online.py`: all 14 protected project files are unchanged. All 16 source-PDF hashes were rechecked against the fresh source manifests and are unchanged. The [final preservation and file record](../work/2026-10-03-fresh-audit-01/final-record.json) contains the individual results. No existing source or configuration change was authorized or made.

### New files

- This single final Markdown report, under the new top-level `Review/` directory. No general review directory existed at the top level; older run-specific records under `build/` were not reused.
- `work/2026-10-03-fresh-audit-01/baseline.json`, the new exact Magma script, structural-check record, final preservation/file inventory, and review-support files.
- `work/2026-10-03-fresh-audit-01/build/`: isolated copies of the inputs, fresh TeX/BibTeX outputs and logs, PDF text, all 15 page renders and five inspection sheets.
- `work/2026-10-03-fresh-audit-01/number-sources/` and `elliptic-sources/`: fresh extraction/render scripts, source hashes, selected page images, extracted source text and scoped source notes. Extraction is not a claim of full-source reading.
- `work/2026-10-03-fresh-audit-01/proof-challenge/scoped-notes.md`: same-run proof reconstruction supporting this consolidated report.
- The two new public-calculator run directories listed in Section 7. The unchanged project client places its evidence under `build/online-magma/`.

No new reference PDF was needed or downloaded. No Shared file or provenance record was edited; current use is recorded here and in the new audit manifests because existing `sources.json` was protected by the task. Generated outputs, source extracts and reference material remain outside Git publication. The final inventory records the exact created files and preservation results.

## 9. Remaining limitations and completion status

The complete current manuscript, all of its substantive calculations, the 14 cited works at the relevant passages, notation, cross-references, abstract, examples, remarks, final question and rendered bibliography were examined. No material requested manuscript scope remains unexamined. The source record below distinguishes statement/applicability verification from proof inspection; it does not claim that all cited books and papers were audited in full.

The review does not resolve the open unit conjecture or the final integer rank-five question, determine exact ranks or full bases, prove a priority claim, certify the source literature's foundations, authenticate author-history declarations, or assess journal acceptance. Source verification was focused on the actual uses; it was not an exhaustive search for every possible correction or uncited related paper. The initial inherited project context and shared model environment limit any claim of informational or statistical independence.

**Completion:** examination and report complete; sources preserved; mathematical reconstruction and new exact checks completed; configured compilation check remains failed for the identified C01 defect; rendered inspection completed at the stated resolution; publication not performed. A later authorized editing pass can remove the obsolete introductory conjecture reference, apply any selected optional suggestions, rebuild, and recheck affected passages. The author's decision to leave the final question as an incidental aside is settled. This report does not apply those edits.
