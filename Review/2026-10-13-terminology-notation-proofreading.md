# Terminology, notation, and prose review of the Ennola manuscript

Date: 13 October 2026. Scope: the current, locally modified `Draft/ennola-squareclasses.tex`, including its title, abstract, six sections, displayed notation, tables, and bibliography output. This is a report of proposed corrections; no manuscript or bibliography edits have been applied.

## 1. Main conclusions

**“Square class” is standard mathematical terminology. “Squareclass” is also an established spelling.** The quotient $K^\times/K^{\times2}$ and the use of its elements in descent and quadratic extensions agree with the literature. Bruin–Stoll uses “square class” in ordinary prose in the local Shared copy (S1, p. 10). For a separate check of the closed spelling, Hanke's author abstract uses “determinant squareclasses” (X1). Thus the manuscript has no invented concept or terminology to repair here. Using “square class” throughout would be a reasonable house-style choice, but it is not a mathematical correction.

The main problems are places where a familiar word refers to the wrong object, has more than one mathematical meaning, or leaves a hypothesis implicit. The highest-priority examples are:

1. “Elliptic points” remains in the introduction, although the title has been corrected. In the sources, an elliptic point has a different established meaning in the theory of modular functions.
2. “Prime ideals of prescribed order” should say that the **ideal classes** have prescribed order.
3. “Rational fibres” and “An infinite rational rank-five subfamily” can suggest a rational curve or rational parametrization, and the latter also suggests exact rank five. The result establishes a lower bound over a genus-one parameter curve.
4. “A square unit” in the rank-five proof should identify the relevant local unit. The five elements need not be global units.
5. The sentence about a fibre's “smooth proper model” should instead identify the model of the family over the local ring of the base.
6. The references to the Kala–Sgallová–Tinková proposition need an edition check: the statement and number were found in the local arXiv v2 copy, whereas the bibliography now identifies the published paper without explaining this locator.

The prose does not warrant a wholesale rewrite. The requested `avoid-ai-writing` review found a small number of vague references and process-oriented phrases worth sharpening, but no persuasive basis for systematically removing ordinary mathematical transitions or established technical vocabulary.

## 2. Scope, preservation, and method

I read the current project instructions and configuration: `AGENTS.md`, `README.md`, `PROJECT_KNOWLEDGE.md`, `Environment.md`, `.editorconfig`, `.gitignore`, `sources.json`, and `scripts/build.ps1`. The current source was read in full, including unchanged passages. The bibliography and the initial working-tree diff were also inspected. Existing historical review reports were not opened or used to support the findings. Project descriptions and the memory routing index exposed prior project context, so this should not be represented as informationally independent of all earlier work.

At the start, three tracked files already had user changes: `Draft/ennola-squareclasses.tex`, `Draft/ennola.bib`, and `Submission/cover-letter-pmd.md`. Their contents are protected by the baseline. The review does not propose restoring the old title, shortened author name, or intentionally commented material.

| Input | SHA-256 at the start of this review |
|---|---|
| `Draft/ennola-squareclasses.tex` | `581F70ADA03D14123EC80EDC0520FAEF1070364991F3A04BD82BA0F90EDDBB20` |
| `Draft/ennola.bib` | `8AA39311E0CF26FD46C31A13083986E63974AB02B07E518FC05D017EFBE8C203` |
| `Submission/cover-letter-pmd.md` | `BF6A174920B2303CE57A198431E9E144FE9C2CF2A545670E25F5253F8C1A002F` |

All source-line references below refer to this 607-line manuscript snapshot. They identify the start of a passage when it occupies several lines. Source identifiers S1–S16 refer to the local Shared files and exact reading scopes in §8. X1–X2 are explicitly identified external supplements.

The comparison covers the manuscript's substantive terminology and symbol families, including items that should be retained. It is not a word-frequency survey of the entire Shared library, nor a claim that all 33 selected PDFs were read from beginning to end. A negative search result is not treated as proof that a term is nonstandard. Different letters, root orderings, or spellings in different authors are not themselves defects.

The mathematical assessment is limited to what is needed to evaluate wording, conventions, and the meaning of proposed replacements. This is not a new certification of all proofs, numerical identities, finite enumerations, or imported theorem applications.

## 3. Corrections and clarifications to prioritize

### F01. The title still leaves the base field of the elliptic curves ambiguous

Location: [line 43](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:43).

Current title: “Prescribed Ideal Classes and Rational Points on Elliptic Curves in Ennola Cubic Fields.”

The replacement of “elliptic points” is an improvement. However, the ending “on Elliptic Curves in Ennola Cubic Fields” can still suggest that the points under study are $K_a$-rational points. The manuscript studies $E_a(\mathbb Q)$ and relates these points to ideal classes in $K_a$. The conventional wording in S3, S12, and S13 distinguishes the curve's field of definition, the field of its rational points, and the associated cubic field.

Suggested title: **“Prescribed Ideal Classes in Ennola Cubic Fields and Rational Points on Associated Elliptic Curves.”** This preserves the revised terminology while attaching “in Ennola Cubic Fields” to the ideal classes. If the title should state the first result more precisely, “Prime Ideal Classes of Prescribed Order” is possible, although it makes the title longer. This is a clarity recommendation, not a claim that the current title is formally false.

### F02. One occurrence of “elliptic points” remains

Location: [line 138](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:138).

Current: “Connections between elliptic points and cubic ideal classes appear in Duquesne … and Laoudi …”.

Suggested: **“Connections between rational points on elliptic curves and ideal classes of cubic fields appear in Duquesne … and Laoudi …”.**

S12 and S13 discuss points on elliptic curves and cubic class groups. S8, p. 31, explicitly defines an elliptic point in terms of the fixed point of an elliptic element of a discrete subgroup of $\mathrm{SL}_2(\mathbb R)$. Therefore “elliptic point” is not an invented expression in mathematics generally; it is an inappropriate replacement for “point on an elliptic curve” here.

### F03. Finite order belongs to the ideal class

Locations: [section heading, line 218](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:218); related compressed wording in the abstract, line 53, and introduction, line 136.

Current heading: “Prime ideals of prescribed order.”

Suggested heading: **“Prime ideal classes of prescribed order.”** In the abstract, use **“a specified prime ideal above $\ell$ whose ideal class has exact order $2^n$.”** At line 136, use **“a prime ideal above it whose class has the prescribed power-of-two order.”**

The group of nonzero fractional ideals is free abelian on prime ideals; it is the quotient class $[\mathfrak p]$ that has the stated finite order. The theorem's displayed notation $\operatorname{ord}_{\mathrm{Cl}(K_a)}[\mathfrak p]=N$ already makes this completely precise. S7, p. 69, distinguishes the torsion-free ideal group, and S14 states its result in the ideal class group. The prose should match the display.

### F04. “Rational fibres” does not clearly identify what is rational

Locations: [abstract, line 53](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:53); [line 587](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:587).

Current: “geometrically nonisomorphic rational fibres” and “rank at least five on infinitely many rational fibres.”

Suggested in the abstract: **“It also yields infinitely many elliptic curves over $\mathbb Q$, pairwise nonisomorphic over $\overline{\mathbb Q}$, with rank at least five.”** Suggested in the proof: **“The five independent sections give rank at least five in infinitely many fibres over points of $C(\mathbb Q)$.”**

“Rational” can qualify a point of the base, a field of definition, or the birational type of a variety. Here it qualifies the base points and the resulting field of definition; the smooth fibres have genus one. S4, §§3.4–3.5 and 5.1, supplies the relevant distinction between sections, points over a function field, and fibres. The existing proposition statement at line 542 already expresses the conclusion clearly and can guide the abstract.

### F05. The rank-five heading and the scope of “rational function fields” need attention

Locations: [line 503](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:503) and [line 529](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:529).

Current heading: “An infinite rational rank-five subfamily.”

Suggested heading: **“Infinitely many rational parameters with rank at least five.”** An alternative emphasizing the construction is **“A genus-one base change giving rank at least five.”**

There are two potential misunderstandings. First, the parameter curve in this section has genus one, so the construction is not a rational parametrization of that curve. Second, the proposition proves rank at least five, not exact rank five. The phrase “rank-five subfamily” obscures the latter distinction even though the proposition itself states it correctly.

At line 503, “over rational function fields … not imposed below” is correct for the immediately following $\mathbb Q(t)$ construction, but its broad scope can appear to include the subsequent $\mathbb Q(C)$ construction. A genus-one function field is not a rational function field. Suggested: **“We now consider the equation defining $E_a$ over function fields over $\mathbb Q$; the preceding restrictions that $a$ be an integer and $a\geq3$ are not imposed in the remaining constructions.”** Alternatively restrict the existing sentence explicitly to the next corollary. S3, Chapter II's notation and Theorem C.20.3, and S4 distinguish general curve function fields from $\mathbb Q(t)$.

### F06. “A second independent unramified radical” conflates an element with an extension

Location: [line 134](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:134).

Current: “obtain a second independent unramified radical.”

Suggested: **“construct a second unramified quadratic extension, linearly disjoint from $K_a(\sqrt{\theta(\theta-1)})$ over $K_a$.”** A version closer to the descent language is **“find a second independent square class defining an unramified quadratic extension.”**

“Kummer radical” is standard: S9, §I.6(a), defines a radical as a subgroup of the relevant power-class group. Thus “radical” should not be deleted merely because it sounds unfamiliar. The difficulty is that the sentence uses one “radical” for an individual square class or chosen square root and calls that object unramified. The proposed versions state exactly which object is independent and which extension is unramified. S6, Proposition 6.1, and S2, Proposition 4.8, give the pertinent extension language.

### F07. The local proof works in maximal orders even when the defining order is nonmaximal

Locations: [line 101](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:101) and [line 136](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:136).

Current: “The defining order need not be maximal” and “Our local proof also covers the nonmaximal orders in Proposition …”.

Suggested: **“The order $\mathbb Z[\theta]$ need not be maximal”** and **“Our local proof also applies when $\mathbb Z[\theta]$ is nonmaximal, as in Proposition …”.**

The theorem constructs ideals of $\mathcal O_{K_a}$, not a class-group theorem for ideals of a nonmaximal order. The current wording can momentarily suggest the latter. The distinction is material in S5 and S11, where results about units of $\mathbb Z[\theta]$ and of $\mathcal O_K$ are carefully separated. No mathematical hypothesis should be weakened or strengthened while making this wording change.

### F08. “A square unit” should be local in the rank-five residue argument

Locations: [lines 573 and 583](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:573).

Current: “defines a degree-one prime with residue $\theta=r$” and “A square unit has square residue at each of these primes.”

Suggested first phrase: **“defines a prime of residue degree one at which $\theta\equiv r\pmod{\mathfrak p}$.”** Suggested second sentence: **“If a product of these elements were a square in $\mathbb Q(\theta)$, its nonzero residue at each chosen prime would be a square.”**

The five displayed elements are units in the corresponding local rings because their residues are nonzero. They are not asserted to be global units; moreover, $a_0$ is rational and $\theta$ is not being assumed globally integral in this paragraph. “Residue $\theta=r$” is also less precise than the reduction congruence. S7's local terminology and S1's descent computations distinguish elements, local units, and their residue classes. These replacements preserve the existing squareclass test.

### F09. The object to which properness applies should be specified

Location: [line 583](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:583).

Current: “The fibre at $c_0$ is nonsingular, and its smooth proper model extends specialization to every rational section.”

A smooth proper model of the single fibre is not the object that extends a generic point over the base. The intended argument concerns a smooth proper model of the family over $\mathcal O_{C,c_0}$. The preceding $\mathbb Q(t)$ proof states this more clearly at line 520.

Suggested replacement: **“Since $a$ is regular at $c_0$ and the discriminant is a unit in $\mathcal O_{C,c_0}$, the projective Weierstrass equation defines an elliptic scheme over this local ring. Properness extends every $\mathbb Q(C)$-point over the local ring, and specialization is a group homomorphism.”**

The next sentence about a relation modulo torsion specializing can then remain. This makes explicit the model and base already used in the following paragraph. It is a clarification of a compressed justification, not a claim that the independence result is false. S4, §§3.4–3.5, provides the family/section framework; S3, Chapter II, fixes the local-ring terminology. The exact local properness argument is supplied by the manuscript itself rather than being attributed to an unverified theorem number in those sources.

### F10. The determinant is a homogeneous polynomial in a pencil parameter

Location: [lines 546–550](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:546).

Current: “The diagonal pencil of the two quadrics … Its four roots are distinct …”.

Suggested: **“The pencil of quadrics generated by the two equations has determinant proportional to … . This homogeneous polynomial has four distinct zeros in $\mathbb P^1_{[\lambda:\mu]}$ …”.**

“Pencil of quadrics” is conventional; it is not terminology to replace with an invented label. The two equations are diagonal in the stated coordinates, so “diagonal” is also legitimate, but it is not necessary to identify the construction. Because the determinant is homogeneous in two variables, locating its zeros in the parameter projective line avoids the impression of four ordinary roots of a specified univariate polynomial. S16, p. 175, uses the same determinant-of-a-pencil framework in a different-dimensional intersection of quadrics. That passage corroborates the terminology and notation, not the full genus-one argument in this manuscript.

### F11. The Kala–Sgallová–Tinková proposition locator is version-sensitive

Locations: [line 136](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:136), [line 271](C:/Users/jylu/Documents/Ennola/Draft/ennola-squareclasses.tex:271), and [bibliography entry, line 73](C:/Users/jylu/Documents/Ennola/Draft/ennola.bib:73).

The norm bound appears as Proposition 3.7 in §3.5, p. 11, of the arXiv v2 file in Shared (S11). The current entry cites the published article in *Journal of Number Theory* 273 (2025), 37–95, and its DOI; that publication metadata was checked against the publisher (X2). The source now omits the earlier qualification identifying the version for the proposition number.

**Unresolved verification, not a demonstrated wrong citation:** the final published text and its proposition numbering were not available in the inspected local copy. Before applying a final polish, either check the published proposition number or explicitly identify the arXiv v2 locator. There is no basis for changing the bound or inventing a published locator. Retaining an `eprint` field alone does not explain the locator to a reader if the bibliography style does not print that field.

### F12. An extra closing brace is present in the authoring bibliography

Location: [Draft/ennola.bib, line 85](C:/Users/jylu/Documents/Ennola/Draft/ennola.bib:85).

The Kala–Sgallová–Tinková entry ends at line 84, followed by an additional `}` at line 85. This is a definite source-cleanliness defect; the proposed repair is to remove only that extra brace.

**It is not a build-blocking error in the current toolchain.** The actual BibTeX run succeeded and did not report an error for this text between entries. The report distinguishes the inspected source defect from the successful compilation result.

## 4. Further line-by-line wording and proofreading suggestions

“Clarify” identifies an avoidable ambiguity or compressed referent. “Optional” identifies a stylistic preference; it does not establish nonstandard terminology. Suggested phrases are proposals only.

| ID / location | Current wording | Assessment and proposed wording |
|---|---|---|
| W01 — 66 | “the known description of their unit squareclasses” | **Clarify the antecedent.** Use “the known description of the units of $K_a$ modulo squares.” The relevant quotient is the unit group of the field, not an undefined group belonging to the two named units. S2, S5, S6. |
| W02 — 70–74 | “The connection is the identity …, when $x\in\mathbb Q$.” | **Optional syntax.** “For $x\in\mathbb Q$, the connection is the identity … .” This moves the domain before the display and removes the loose trailing “when.” Preserve the norm identity and its sign. |
| W03 — 76 | “We use the following convention of notations.” | **Proofreading.** “We use the following notation and conventions.” This is the clearest straightforward grammatical repair. |
| W04 — 134 | “the unit-squareclass result” | **Optional specificity.** “the description of units modulo squares recalled in Lemma …”. The current compound is understandable; it need not be presented as a named theorem in the literature. |
| W05 — 134, 138 | “two-rank”; “three-primary classes” | **Optional consistency.** “$2$-rank” and “the $3$-primary part of the class group” are easier to scan. Define $2$-rank once as $\dim_{\mathbb F_2}\mathrm{Cl}(K)[2]$ if retained in the introduction. Do not confuse it with the Mordell–Weil rank. S2, S13, S15. |
| W06 — 138, 472 | “rank-four … results”; “rank-four hypotheses” | **Clarify where needed.** Use “results giving rank at least four” and “the hypotheses for the four-point conclusion.” The precise theorem has the correct lower bound; these shortened phrases should not imply exact rank. |
| W07 — 147 | “has the same nonsquare squareclass” | **Optional simplification.** “The field discriminant is also nonsquare, since it differs from $d_a$ by a rational square.” If the squareclass wording is retained, specify the quotient $\mathbb Q^\times/\mathbb Q^{\times2}$, since most other squareclasses in the paper lie in $K_a^\times/K_a^{\times2}$. |
| W08 — 161 | “Changing its sign gives norm one” | **Clarify.** “Replacing $\eta$ by $-\eta$ if necessary, we may assume that its norm is one.” An unconditional sign change would reverse an already positive norm. The intended choice is valid in odd degree. |
| W09 — 184 | “nonzero in the free basis” | **Clarify.** “nonzero in the $(\mathbb Z/4\mathbb Z)$-basis $1,\theta,\theta^2$ of this quotient.” A basis belongs to a module; an element is expressed in it. This also identifies the coefficient ring. |
| W10 — 232 | “so its prime $\mathfrak p_p$ has …” | **Optional precision.** “so the corresponding prime $\mathfrak p_p$ of $K$ has …”. The correspondence through the product decomposition is the intended meaning. |
| W11 — 234 | “a rational prime outside $m$” | **Clarify.** “a rational prime not dividing $m$.” “Outside” normally refers to a set of primes or a support, not directly to an integer. |
| W12 — 273 | “in the two sets of coordinates” | **Optional precision.** “for the two generators $\rho$ and $\theta$.” The displayed polynomial identities compare orders generated by field elements; “coordinates” is needlessly indirect. |
| W13 — 288 | “The three normalized polynomials” | **Optional precision.** “The following three rescaled polynomials.” The displayed divisions normalize valuations but do not impose a common monic normalization. No defined notion of “normalized” is needed. |
| W14 — 340 | “The unit kernel” | **Optional precision.** “The kernel of $V_K\to\mathrm{Cl}(K)[2]$.” The current expression is useful shorthand after the exact sequence, but not a new invariant requiring a name. |
| W15 — 361, 524 | “their half-combination” | **Clarify.** At line 361, write “Subtracting $(b/2)P+(c/2)Q+(e/2)S+(f/2)T$ from $R$ …”. At line 524, “Subtracting the combination with these halved coefficients …” suffices. “Half-combination” is an informal compression, not a standard operation that needs to be named. |
| W16 — 384 | “implements the signature and Kummer-congruence strategy” | **Optional, recommended.** “uses signatures and congruences modulo four …”. Signatures and Kummer theory are standard, but this combined label sounds like a named method without explaining the actual local conditions. Preserve the source attribution and its scope. |
| W17 — 392 | “Total positivity handles the real places.” | **Optional expansion.** “At every real place, total positivity makes both quadratic extensions split.” This states the local conclusion explicitly. S2 and S6. |
| W18 — 406 | “The relation and halving arguments … apply.” | **Optional precision.** “The arguments proving independence modulo torsion and saturation at two in the proof of Theorem … apply.” Those are the two exact conclusions being reused. |
| W19 — 433 | “in this proved finite interval”; “Both valid seeds” | **Optional simplification.** “for $0\leq u_0\leq106$”; “Both remaining initial solutions.” Preserve the proved reduction to this interval. The word “proved” need not advertise the argument already given. S10 uses initial solutions and multiplication by a unit. |
| W20 — 433 | “the unrestricted nonnegative orbits” | **Clarify the modifier.** “the sequences obtained from these two initial solutions by multiplication by $\eta^k$, $k\geq0$, before imposing the congruence conditions on $a$.” The integers or coordinates themselves are not the object being called an orbit. “Orbit” can also be retained after specifying the forward action. |
| W21 — 441, 449 | “56 updates”; “successful exponents” | **Optional mathematical phrasing.** “56 applications of $M$”; “exponents satisfying the congruence.” These are transparent descriptions of the same exact calculation. The word “exponent” itself is correct because $\eta^k$ and $M^k$ occur. |
| W22 — 480 | “Zero exponents” | **Clarify the table heading.** “Indices $k$ for which the coordinate vanishes,” with “within one period” in the caption or surrounding text. The listed numbers are not exponents equal to zero. The table entries are unchanged. |
| W23 — 489, 494 | “For completeness, the longest row has a short certificate”; “states”; “zero list” | **Optional, recommended.** “For modulus $2503$, the period and the vanishing indices follow from the identities …”; “residue pairs”; “the listed vanishing indices.” The exact identities are useful and should remain. Only the process-oriented introduction and informal labels need polishing. |
| W24 — 496 | “The unit equation has finitely many solutions …” | **Clarify the equation.** “The equation $x+y=1$ has only finitely many solutions in units of a fixed number field …”. S3, Theorem IX.4.1, states the more general $S$-unit result; this is the specialization actually used. |
| W25 — 531 | “the two earlier square conditions” | **Clarify the reference.** “the two square conditions in $\eqref{eq:two-squares}$.” This is the same type of distant-reference problem as the previously corrected “displayed Weierstrass equation.” |
| W26 — 550 | “adjunction gives $\omega_C\simeq\mathcal O_C$” | **Optional reader aid.** “the adjunction formula gives $\omega_C\simeq\mathcal O_C$, where $\omega_C$ is the canonical sheaf.” The notation is conventional, not invented; naming the sheaf helps readers whose main background is number theory. S4, §6.6. |
| W27 — 583 | “whose determinant is $1$ … and so the matrix is invertible. … The invertible matrix therefore …” | **Optional economy.** State invertibility once and then use “This excludes …”. Preserve the field $\mathbb F_2$ and the number 31. |
| W28 — 594 | `\(...\)` used once amid `$...$` inline mathematics | **Optional source consistency only.** Convert that one pair of delimiters if source style is being standardized. It renders correctly now; it is not a notation error. |

These proposals are not instructions for a global find-and-replace. In particular, “displayed,” “same,” and “this” are often perfectly clear when the relevant display or object is adjacent.

## 5. Terminology comparison: what should be retained, defined, or qualified

The following ledger covers the substantive vocabulary across all six sections. “Standard” means the concept and usage agree with the inspected literature or the explicitly identified mathematical convention; it does not require every author to use the same spelling. A source cited for a convention is not being claimed to prove every assertion in the manuscript that uses that convention.

### Number fields, units, ideals, and local arithmetic

| Term or phrase | Comparison and recommendation |
|---|---|
| Ennola cubic field / Ennola's family | **Standard.** S11, §2.3, uses “Ennola's cubic fields” for the same polynomial family. Keep. Do not rename them “simplest cubic fields,” which denotes the different cyclic family in S11, §2.2, and S12. |
| Totally real, cubic, non-Galois | **Standard.** S5 and S14 use the corresponding field classifications. “Non-normal” in some titles is equivalent here; there is no need to force one spelling throughout cited titles. |
| Exceptional unit | **Standard and correctly defined.** S5, p. 153, uses that a unit and its difference from 1 are units. “$1-\varepsilon$ is a unit” is equivalent, so the manuscript's “$\varepsilon-1$” is not a convention error. |
| Fundamental system of units | **Standard.** S5, S6, and S11. Keep the distinction between units of an order and of the maximal order, and preserve the conjectural status of the latter assertion. |
| Unit squareclass / square class / class modulo squares | **Standard concept.** S1, p. 10; S2's quotient descriptions; S6, Proposition 3.3. Closed spelling is separately corroborated by X1. Choose a spelling consistently if desired. |
| Positive-norm unit / norm-one unit | **Correctly equivalent for units here.** A unit's norm to $\mathbb Q$ is $\pm1$. The two expressions must not be replaced by “totally positive unit.” S2 and S5 distinguish signs from their product. |
| Totally positive element | **Standard.** Positive under every real embedding, not merely positive norm. The manuscript uses this distinction correctly in the Hilbert-class-field corollary. S2, §§2–4; S11. |
| Signature / real embedding / dyadic prime | **Standard.** S2, Definitions 2.1–2.3 and §4, and S6. “Dyadic” means above 2. Writing “primes above two” at the first occurrence would be an optional gloss. |
| Maximal order / nonmaximal order / defining order | The first two are **standard**; “defining order” is understandable but should be explicitly identified as $\mathbb Z[\theta]$. See F07. S5 and S11. |
| Field discriminant / polynomial discriminant / index | **Standard and distinguished in the display.** S7 and S11. Retain the index-square factor; avoid collapsing the two discriminants when the defining order is nonmaximal. |
| Ordinary ideal class group / narrow class group | **Standard and materially different.** S2, pp. 7–8, and S6. The manuscript's use of the ordinary group is consistent with the real-place conditions in its unramified-extension argument. |
| Prime ideal class / exact order / class-group exponent | **Standard.** S14 and S7. State order for the class, as in F03. A large order of one element is different from a claim about the full structure or exact class number. |
| Principal ideal power / a unit times a square | **Ordinary descriptive language, mathematically precise.** Retain. The condition “a unit times a square” is weaker than being a square and is used intentionally. |
| Integral ideal / fractional ideal / ideal sum | **Standard.** S7, Chapters 3–4. The notation $(m,\gamma)$ denotes the generated ideal, not an ordered pair. |
| Norm / absolute norm | **Standard with the manuscript's explicit conventions.** Field norms can have either sign; numerical ideal norms are positive. S7, p. 69. Keep absolute-value signs in the comparison bound at line 269. |
| $2$-rank / $2$-torsion / $3$-primary | **Standard but distinct.** S2, S13, S15. For a finite abelian class group, $2$-rank may be expressed using the dimension of either its quotient by squares or its 2-torsion. Spell out the convention once if needed. |
| Finite prime / infinite prime / real place | **Standard.** S2 and S7. “Unramified everywhere” should continue to include the real places where it is used for the ordinary Hilbert class field. |
| Valuation / uniformizer / residue degree / ramification index | **Standard.** S7, Chapters 3–4. The normalization at line 76 is useful and should remain. |
| Degree-one prime | **Established shorthand for residue degree one.** It does not alone imply ramification index one. Line 232 correctly states both separately; F08 proposes fuller wording where a residue test is introduced. |
| Simple root / Hensel's lemma / integral closure / complementary factor | **Standard or transparent algebraic descriptions.** S7; S1's local calculations. No new terminology is needed. Replace only unclear referents such as “its prime.” |
| Unramified or split quadratic algebra | **Standard local distinction.** S2, Proposition 4.8, and S6, Proposition 6.1. Retain the possibility that a local quadratic algebra splits. |
| Biquadratic extension / linearly independent squareclasses | **Standard.** S9's Kummer framework and S2. Independence is over $\mathbb F_2$; the extension degree is four when the two defining classes are independent. |
| Ordinary Hilbert class field | **Standard and useful qualification.** S2 and S6 distinguish it from the narrow/ray-class variant. Do not remove “ordinary” merely as redundant prose. |
| Kummer radical / unramified radical | The first is **standard** in S9; the second is imprecise as used for one object in the introduction. See F06. |
| Power residue / quadratic residue / nonsquare residue | **Standard.** The rank-five paragraph uses multiplicative square classes in odd-characteristic residue fields. Keep zero out of the square/nonsquare encoding there. |

### Elliptic curves, descent, families, and geometry

| Term or phrase | Comparison and recommendation |
|---|---|
| Rational point / integral point / elliptic point | The first two are **standard** in S3, S12, and S13. A rational point need not be integral in the chosen equation. “Elliptic point” has a different standard use in S8: replace it here as in F02. |
| Weierstrass equation / affine equation / projective Weierstrass equation | **Standard.** S3, §III.1. The equation has an $x^2$ term, so do not introduce “short Weierstrass equation” for it. |
| Discriminant of a Weierstrass equation | **Standard and appropriately attached to the equation.** S3, §III.1. Its value changes under changes of Weierstrass coordinates; it should not silently be called the minimal discriminant. |
| Point at infinity / identity / origin | **Standard.** S3, §III.1. The point $O$ is the identity. A genus-one curve is given an elliptic-curve group law after choosing a rational origin. |
| Chord-and-tangent law / vertical line / abscissa / multiplicity | **Standard geometric language.** “Abscissa” means the $x$-coordinate. Nothing requires replacing these with novel expressions. |
| Descent map / squareclass obstruction | **Standard concept and transparent description.** S1, §2, and S13. The manuscript proves the homomorphism it needs; do not strengthen the statement to an unproved identification with a complete Selmer group. |
| Independent modulo torsion / integral relation / primitive relation | **Standard.** “Primitive” in line 359 means that the integer coefficients have gcd 1, which the preceding sentences explain. It does not assert that the generated subgroup is fully saturated. |
| Rank / Mordell–Weil rank / Mordell–Weil basis | **Standard.** S3 and S4. A lower bound and saturation at 2 do not give an exact rank or a full basis. The caution at line 128 is accurate and should remain. |
| Saturated at two | The manuscript gives the **precise needed definition** at line 113. The saturation/primitive-closure vocabulary occurs in S4, p. 68, but in a lattice setting; that is not a direct attestation of this exact phrase for subgroups of $E(\mathbb Q)$. No directly matching local passage was established in this review. Retain the explicit definition; there is no need to invent a substitute or claim full saturation. “2-saturated” is an optional conventional shorthand, not a required correction. |
| Section / rational section / generic point of the family | **Standard.** S4, §3.4, identifies sections with points over the function field. The base must be clear: $\mathbb P^1$ for the rational family and $C$ for the genus-one construction. |
| Base change / genus-one base change | **Standard.** S4, §5.1. Here the adjective describes the base curve. It does not mean that the curve $C$ has a rational parametrization. |
| Fibre / specialization / good reduction | **Standard.** S3, Theorem C.20.3, and S4. Specify a fibre over a rational point when that is the intended meaning. |
| Smooth / nonsingular / geometrically nonisomorphic | **Standard.** S3, Chapters I–III. In the present characteristic-zero setting the smooth/nonsingular usage is appropriate. State “over $\overline{\mathbb Q}$” when introducing geometric nonisomorphism. |
| $j$-invariant / geometric isomorphism class | **Standard.** S3, Proposition III.1.4, identifies isomorphism over an algebraic closure through $j$. A nonconstant or unbounded $j$ is not an assertion of distinctness at every pair of parameters. |
| Rational family / rational function field | **Standard where the base is rational.** The heading of §5 is appropriate for the explicit $\mathbb Q(t)$ family. The use near §6 needs the qualification in F05. |
| Genus-one curve / Jacobian / choose an origin | **Standard.** S3's curve framework and S4. Do not replace “genus-one curve” by “elliptic curve” before the choice of origin without explaining that choice. |
| Quadrics / pencil / homogeneous coordinates / determinant of a pencil | **Standard.** S16 provides the determinant construction; F10 improves its description here. |
| Complete intersection / Jacobian criterion / adjunction / canonical sheaf | **Standard.** S1, p. 8, uses complete intersections of quadrics; S3, p. 4, states the Jacobian criterion; S4, §6.6, uses adjunction and canonical bundles. These passages attest vocabulary, not a separately audited proof of every implication at line 550. |
| Geometrically connected | A precise established geometric property, **not interchangeable with having rational points or with connectedness only over $\mathbb Q$**. No directly matching connectedness theorem for this intersection was located in the selected passages. The compressed connectedness/adjunction deduction is outside the proof-certification scope of this wording review; no terminology replacement is proposed. |
| Elliptic scheme / smooth proper model / properness | **Conventional geometric language**, but the model and its base must be identified. The manuscript's line 520 does this; line 583 needs F09. No new technical name is needed. |
| Local ring / discrete valuation ring / integrally closed / regular at a point | **Standard.** S3, Chapter II, Proposition 1.1 and surrounding notation. “Regular at $c_0$” is a condition on the function $a$ there, not a statement that every rational function is regular. |

### Pell equations and finite calculations

| Term or phrase | Comparison and recommendation |
|---|---|
| Pell equation | **Established broad usage.** More specifically, $v^2-20u^2=2861$ is a generalized Pell equation or Pell-type equation; S10, §3, treats $x^2-dy^2=n$. “Pell equation” is acceptable after the equation has been displayed. |
| Fundamental unit / norm-one unit in a Pell recurrence | These are different claims. The manuscript only needs multiplication by the specified norm-one unit $\eta$. Do not introduce the stronger label “fundamental unit of the maximal order” without checking which order is intended. S10. |
| Seed / orbit / recurrence / period | “Recurrence” and “period” are standard; “seed” is ordinary computational shorthand. “Initial solution” is more traditional in this number-theory exposition. Specify the forward powers $k\geq0$ if retaining “orbit.” S10. |
| Reduction interval / finite interval / exhaustive congruence check | Transparent descriptions of the proved reduction and the finite modular calculation. Preserve the reduction argument; a stylistic edit must not turn it into an unexplained empirical search. |
| Nonperiodic initial segment | Standard terminology for an eventually periodic sequence. Invertibility of the transition matrix rules it out here; no replacement is needed. |
| Successful exponents / zero exponents / states / certificate | These are local computational descriptions rather than indispensable terminology. “Indices satisfying the congruence,” “indices where the coordinate vanishes,” “residue pairs,” and the explicit identities are clearer; see W21–W23. |
| Unit equation | **Standard**, but name $x+y=1$ in its occurrence. S3, Theorem IX.4.1, gives the relevant $S$-unit theorem. |

## 6. Notation audit

The notation is mostly conventional and more careful than several of the compressed phrases. No wholesale renaming is justified by differences from individual sources.

| Symbols / locations | Comparison and recommendation |
|---|---|
| $a$, $f_a$, $K_a=\mathbb Q(\theta)$, 60–68 | These are valid author-chosen labels. S11 uses $\rho$ for the same largest root; S5 uses a different distinguished conjugate. Neither choice forces a change to $\theta$. The manuscript states its choice explicitly. |
| Ordered signatures $(-,-,+)$, 142 | The order of embeddings is stated immediately before the signatures. Sources may list the positive embedding first. This is a convention difference, not a sign error. Preserve the stated ordering throughout the argument. |
| $\rho=1/(\theta-1)$ and shifted parameter $a+1$, 136, 273 | The change of generator and parameter reconciles the different defining polynomial used by Lee and Louboutin. It is essential context, not redundant notation. Keep both identities in line 273. |
| $\varepsilon$, $\epsilon$, $\eta$ | The exceptional-unit definition, a particular transformed unit, a hypothetical square root, and the later Pell multiplier occur in separate scopes. Reuse is manageable. There is no mathematical rule requiring those symbols to match the literature. Avoid a global replacement. |
| $\mathcal O_K$, $\mathbb Z[\theta]$, index brackets | Standard order notation, as in S5, S7, S11. The index is not assumed to be one. Retain the ambient maximal order in ideals such as $(u,4\theta-3)\mathcal O_K$. |
| $d_a=\operatorname{disc}(f_a)$, $\operatorname{disc}(K_a)$, $16d_a$ | Correctly assigned to three different objects: polynomial discriminant, field discriminant, and discriminant of the chosen elliptic equation. S3 and S7 support these distinctions. Do not replace all three by a single “discriminant of the field/curve.” |
| `\Nm`, rendered as upright $\mathrm N$; italic $N=2^n$ | The macro name is not the printed notation: `\DeclareMathOperator{\Nm}{N}` prints upright $\mathrm N$. Upright norm notation and italic exponent $N$ are distinguishable. The domain/subscript and line 76 define the usage. No mandatory renaming. |
| $\mathrm N_{L/\mathbb Q}(\gamma)$ versus $\mathrm N\mathfrak c$ | The manuscript explicitly separates the signed field norm from the positive numerical ideal norm. S7, p. 69, makes the corresponding distinction. In particular $\mathrm N((\gamma))=\lvert\mathrm N_{L/\mathbb Q}(\gamma)\rvert$. |
| $K^\times/K^{\times2}$, $(\mathcal O_K^\times)^2$, $[\gamma]$ | Standard multiplicative quotient notation. S1 and S2 often use $K^*$ rather than $K^\times$; these are equivalent conventions. $K^{\times2}$ means the subgroup of squares, not a Cartesian square. |
| $[\mathfrak c]$ versus $[\gamma]$ | Both uses of brackets are conventional and explicitly distinguished at line 76. The typeface and argument identify the quotient. No need for a second unfamiliar bracket notation. In mixed sentences, “ideal class” and “square class” should identify the object, as in line 371. |
| $\mathrm{Cl}(K)[2]$, $(\mathbb Z/2\mathbb Z)^2$, $\mathbb F_2$ | Standard. The first denotes elements annihilated by 2, not the whole Sylow 2-subgroup. S2 and S13 support this distinction. Preserve multiplicative notation for ideal and square classes. |
| $\operatorname{ord}_{\mathrm{Cl}(K_a)}[\mathfrak p]$ | Clear and more precise than the section title. Its subscript identifies the group in which the order is taken. Keep. |
| $\mathfrak p,\mathfrak q,\mathfrak a,\mathfrak b$, and $I$ | Conventional ideal notation. Roman/italic $I$ in a general lemma and fraktur ideals in the application are not inconsistent. S7 uses comparable distinctions. |
| $(m,\gamma)$ and $(\gamma)$ | Respectively the ideal generated by two elements and the principal ideal. These are conventional; the ambient order is specified where needed. They must not be confused with point coordinates. |
| $v_p(m)$, $v_{\mathfrak p}(\gamma)$, $\mathbb Z_p$, $\mathbb Q_p$ | Conventional local notation. The normalization to value 1 on a uniformizer is already explicit. At ramified primes it is not the same as imposing $v_{\mathfrak p}(p)=1$; the manuscript does not impose that false convention. S7. |
| Congruences modulo 4 and modulo a prime ideal | Standard shorthand when the ring is clear. The quotient in line 176 fixes the modulo-4 ring. F08 makes the prime-ideal congruence clearer at rational $a_0$. |
| $\alpha=4\theta-3$, $\beta=16\theta-15$ | Author-defined abbreviations, clearly introduced. Their squareclasses are the same as the corresponding descent values after multiplying by $4$ and $16$, respectively, which are rational squares. Do not change these scale factors for stylistic reasons. |
| $E_K^{(1)}$, $V_K$, 329–340 | Both are explicitly defined author notation. S2 defines the number-field 2-Selmer group using all elements with even valuations; this $V_K$ has the additional **positive-norm** restriction. It is neither automatically that full group nor its totally positive subgroup. Keep the definition instead of renaming it $\operatorname{Sel}_2(K)$ or using a superscript “+” that could suggest total positivity. |
| $E_K^{(1)}$ and $E_a$ | Reuse of $E$ for units and elliptic curves is tolerable because the superscript, subscript, and definitions distinguish them. A global symbol change would add work without resolving an actual ambiguity in a formula. |
| $1\to\cdots\to1$ in the exact sequence | Correct multiplicative-group notation. Using $0$ would also be possible after adopting additive notation, but mixing the conventions solely to imitate one source is unnecessary. |
| $P,Q,S,T$, $O$, $H$, $R$ | Standard point and subgroup notation. The overloaded letter $Q$ is distinguished from $\mathbb Q$ typographically. The ambient group is specified. |
| $\delta((x,y))=[x+\theta]$, 350–355 | **Keep the plus sign.** S1's conventional map has $x-\theta$ when $\theta$ is a root of the curve's right-hand polynomial. Here that polynomial is $-f_a(-x)$, whose corresponding root is $-\theta$; hence $x-(-\theta)=x+\theta$. Matching the source's sign literally would introduce an error. |
| $\delta(O)=1$ | Correct identity in the multiplicative squareclass group. Do not replace it by $0$ without changing the target convention. |
| $h_1,h_2$, square roots generating a biquadratic extension | Standard Kummer notation. Their radicands are required to be independent squareclasses; the chosen square roots themselves are not a canonically defined basis of an additive vector space. S9. |
| $(u,v)$ versus $(v,u)$; $M$ | The theorem states pairs in one order and explicitly announces the reversed order before the recurrence at line 435. This is not an error. Keep coordinate order consistent in tables, vectors, and seeds; the current declarations make the switch visible. |
| $\eta=9+2\sqrt{20}$ | Valid norm-one multiplier for the displayed integral equation. Although $\mathbb Q(\sqrt{20})=\mathbb Q(\sqrt5)$, replacing $\sqrt{20}$ by $\sqrt5$ without transforming the coefficient would change the integral-coordinate problem. S10. |
| $k$, $r$, $z$, $z_0$, $u_0$, $v_0$, $w=(191,41)^{\mathsf T}$ | All are locally defined recurrence or reduction variables. The vector $w$ in §5 and the scalar $w$ in §6 have separate scopes. A rename is optional and not required for mathematical consistency. |
| $\sim256a^2$ | Standard asymptotic notation in the stated limit $a\to\infty$; it asserts a ratio tending to 1. It is not an equality for finite $a$. |
| $u(t),v(t),a(t)$ and $\mathbb Q(t)$ | Standard rational functions and rational function field. The denominator restrictions are encoded in the functions and the use of the local ring at 0. S3 and S4. |
| $\mathbb Q[t]_{(t)}$ | Standard localization at the prime ideal $(t)$, not the polynomial quotient by $t$. Its residue field is $\mathbb Q$. Keep. |
| $C\subset\mathbb P^3_{\mathbb Q}$, $[U:V:W:Z]$, $u=U/Z$ etc. | Standard projective/affine notation; the affine chart is explicitly named. S3 and S16. Do not use commas for homogeneous coordinates. |
| $\lambda,\mu$ in the determinant polynomial | Conventional pencil parameters; add their projective interpretation as in F10. |
| $\omega_C$, $\mathcal O_C$ | Conventional canonical and structure sheaves. Naming $\omega_C$ once would help the intended number-theory reader. S4, §6.6, uses these symbols for canonical bundles. |
| $\#C(\mathbb F_p)$, $r_p(b)$ | Standard point count; $r_p(b)$ is explicitly defined as a square-root count. It takes values 0, 1, or 2 for odd $p$ and is not merely a binary quadratic-residue symbol. Preserve that distinction in the count at line 556. |
| $c_0$, $a_0$, $F=\mathbb Q(C)$, $\mathcal R=\mathcal O_{C,c_0}$ | Clearly defined local notation. S3's $K(C)$ is the same function-field convention. $\mathbb Q(C)$ is not $\mathbb Q(t)$ for this genus-one curve. |
| Binary residue matrix, determinant in $\mathbb F_2$ | The encoding “square $\mapsto0$, nonsquare $\mapsto1$” is stated, and the residues are nonzero. It identifies a multiplicative group of order 2 with the additive group of $\mathbb F_2$. Retain the field specification. |
| $E_a(F)[2]$, $P_1,\ldots,P_5$, $n_i$ | Conventional torsion subgroup, indexed sections, and integer coefficients. The zero 2-torsion statement is what makes the halving argument conclude equality, not merely equality modulo torsion. |
| $\overline{\mathbb Q}$, $j:C\to\mathbb P^1$ | Standard algebraic-closure and morphism notation. Finiteness of the fibres of this nonconstant map supports infinitely many geometric isomorphism classes; it does not require every rational parameter to have a distinct $j$. |

Two particularly important preservation decisions are therefore: **do not replace positive norm by total positivity**, and **do not change the descent map from $x+\theta$ to $x-\theta$ merely to imitate a source's notation**.

## 7. `avoid-ai-writing`, proofreading, and rendered output

### Issues found

The requested skill was used in detect-only mode with the technical-context exceptions. I read its pattern guidance, ran its available detector against active LaTeX text with full-line comments omitted, and manually evaluated the results against the mathematical context. The detector is not a LaTeX parser.

The detector returned one surface flag: **“Moreover” at line 89**. This introduces a second conclusion of a theorem and is reasonable mathematical prose. Removing it is not a necessary edit. The detector's authorship classifications and probability fields are not evidence about who wrote the article and are not used in this report.

The useful manual findings are concrete: vague referents (“earlier square conditions”), labels that describe the review or computation rather than the mathematics (“successful exponents,” “zero list”), the unnecessary compound “half-combination,” and the awkward sentence “We use the following convention of notations.” They are listed with proposed replacements in §4. These are editorial findings; they are not proof of machine authorship.

### Assessment

Retain normal research prose such as “We recall,” “For comparison,” “Conversely,” “Hence,” and a purposeful “Finally.” Retain “exceptional,” “real,” “primitive,” “independent,” “local,” and “geometric” when they have their mathematical meanings. Do not replace formal proof sentences by fragments, add a conversational persona, or invent a named method to make the article sound less generic.

The final “We wonder whether …” at line 594 expresses an actual open question. It should not be converted into a theorem, prediction, or stronger conjectural claim merely for stylistic uniformity. The source comments about AI-assisted tools are intentional inactive material and were left inactive.

**Editing passes:** zero, as requested. **Checks:** deterministic detector execution and input/output hashes; manual contextual review of the entire active manuscript; actual compilation and the visual checks described below. **Residuals:** all proposed edits remain unapplied; the detector's single “Moreover” flag is retained as justified. **Stop reason:** the authorized deliverable is this detailed report. A normalization or rewrite-preservation validator was not run because no rewritten manuscript was produced; byte preservation is checked directly instead.

### Additional proofreading and typography

The current bibliography has the extra brace described in F12. No undefined citation or cross-reference remains in the final build log. The corrected equation reference at line 147 successfully identifies equation (1.1); that change should be kept. Changing `(\ref{eq:elliptic})` to `\eqref{eq:elliptic}` would be source-style consistency only, not another referent correction.

The full author name now appears with its ORCID icon in the running author header. This was visible on the rendered even-numbered page inspected at full size. If an icon-free running header is preferred, the optional short-author argument can retain the same full name: `\author[Junyu Lu]{Junyu Lu\,\orcidlink{...}}`. This is a cosmetic suggestion and does not justify returning to the former abbreviated name.

The present title, tables, equations, and references fit without an observed clipping or overlap problem. All 15 pages were inspected in a contact-sheet overview, and pages 1, 11, 14, and 15 were additionally inspected at higher resolution. This is not a claim of a magnified typographic inspection of every character on every page. The main improvements needed are textual precision, not a layout redesign.

The submission snapshot and cover letter were not synchronized or rewritten. Their eventual consistency with an approved manuscript revision is a separate release task. No restoration of intentionally hidden material, change to institutional details, or alteration of the journal class is proposed.

## 8. Literature consulted and exact coverage

Page numbers before parentheses are printed page numbers where verified; “PDF” counts pages from the beginning of the local file. These are terminology and notation comparisons, with selected theorem statements read where relevant. They are not full-paper proof audits.

| ID | Local source and reading scope | Use in this review |
|---|---|---|
| S1 | [Bruin and Stoll, *Two-cover descent on hyperelliptic curves*](<C:/Users/jylu/Documents/Shared/Articles/Bruin and Stoll - Two-cover descent on hyperelliptic curves (2009).pdf>), pp. 3, 7–8, 10 (same PDF pages); p. 10 also rendered and inspected. | “Square class”; quotient conventions; $x-\theta$ descent notation and the odd-degree variant in Remark 2.1; local residues; complete intersections. |
| S2 | [Dummit and Voight, *The 2-Selmer group of a number field and heuristics for narrow class groups and signature ranks of units*](<C:/Users/jylu/Documents/Shared/Articles/Dummit and Voight - The 2-Selmer group of a number field and heuristics for narrow class groups and signature ranks of units.pdf>), pp. 5, 7–8, 10–11. | Definitions 2.1–2.3, 3.1–3.2, equation (3.4), and Proposition 4.8: signatures, singular elements, quotient by squares, ordinary/narrow class groups, and local unramified quadratic extensions. This source is used for the concepts, not falsely quoted as using the closed spelling “squareclass.” |
| S3 | [Silverman, *The Arithmetic of Elliptic Curves*, second edition](<C:/Users/jylu/Documents/Shared/Books/Silverman - The Arithmetic of Elliptic Curves.pdf>), pp. 4, 17, 42–43, 45, 282, 457 (PDF 25, 38, 63–64, 66, 299, 471). | Jacobian criterion; function fields and local rings; Weierstrass equations, identity, discriminant and $j$; Theorem IX.4.1 on $S$-units; Theorem C.20.3 on specialization. The latter's statement was checked, not its full surrounding theory or proof. |
| S4 | [Schütt and Shioda, *Elliptic Surfaces*, arXiv v3](<C:/Users/jylu/Documents/Shared/Articles/Schuett and Shioda - Elliptic Surfaces (2010, arXiv v3).pdf>), pp. 9, 18, 22, 26, 68. | §§3.4–3.5, 5.1, 6.1, 6.6: sections, base change, Mordell–Weil groups, canonical sheaves and adjunction; p. 68's lattice saturation vocabulary, with its different scope explicitly noted. |
| S5 | [Louboutin, *Non-Galois cubic number fields with exceptional units*](<C:/Users/jylu/Documents/Shared/Articles/Louboutin - Non-Galois cubic number fields with exceptional units (2017).pdf>), pp. 153–157 (PDF 1–5), with particular attention to the definitions and Lemma 6. | Exceptional units, root conventions, orders, fundamental units, and the quotient by squares. |
| S6 | [Ennola, contribution in *Computational Number Theory*](<C:/Users/jylu/Documents/Shared/Books/Petho, Pohst, Williams and Zimmer (eds) - Computational Number Theory (1991).pdf>), pp. 103, 109, 117 (PDF 117, 123, 131). | The original family and exceptional units; Proposition 3.3 on unit classes and signatures; Proposition 6.1 and the beginning of Theorem 6.1 on unramified extensions and class-group conclusions. |
| S7 | [Milne, *Algebraic Number Theory*](<C:/Users/jylu/Documents/Shared/Books/Milne - Algebraic Number Theory.pdf>), pp. 31, 55, 59, 66, 68–69, 72 (PDF 33, 57, 61, 68, 70–71, 74). | Field and ideal norms; valuations; ramification and residue degree; torsion-free ideal group; Hilbert class field convention. |
| S8 | [Milne, *Modular Functions and Modular Forms*, v1.31](<C:/Users/jylu/Documents/Shared/Books/Milne - Modular Functions and Modular Forms (v1.31, 2017).pdf>), pp. 29, 31; p. 31 also rendered and inspected. | The established modular-theoretic meaning of “elliptic point,” immediately before Proposition 2.10. |
| S9 | [Gras, *Class Field Theory: From Theory to Practice*](<C:/Users/jylu/Documents/Shared/Books/Gras - Class Field Theory - From Theory to Practice (2003, with appended errata).pdf>), §I.6(a), p. 54 (PDF 66). | Kummer radical as a subgroup of a power-class group. The appended errata were not audited in this terminology check. |
| S10 | [Conrad, *Pell's equation II*](<C:/Users/jylu/Documents/Shared/Articles/Conrad, Keith - Pell's equation II (notes, retrieved 2026-09-30).pdf>), §3, pp. 4–6, including Theorem 3.3. | Generalized Pell equations, multiplication by a norm-one unit, and reduction to finitely many initial solutions. |
| S11 | [Kala, Sgallová and Tinková, *Arithmetic of cubic number fields*, arXiv v2](<C:/Users/jylu/Documents/Shared/Articles/Kala, Sgallova and Tinkova - Arithmetic of cubic number fields - Jacobi-Perron, Pythagoras, and indecomposables (2024, arXiv v2).pdf>), §2.3, p. 6, and §3.5, Proposition 3.7, p. 11. | “Ennola's cubic fields,” the different simplest-cubic family, root conventions, orders, and the version-specific norm-bound locator. |
| S12 | [Duquesne, *Integral points on elliptic curves defined by simplest cubic fields*](<C:/Users/jylu/Documents/Shared/Articles/Duquesne - Integral points on elliptic curves defined by simplest cubic fields (2001).pdf>), pp. 91–92 (PDF 1–2). | Points on elliptic curves, fields of definition, ideal classes, and 2-descent terminology. The cyclic field family is different; it is a language comparison, not an identification of families. |
| S13 | [Laoudi, *2-rang du groupe des classes et courbes elliptiques*](<C:/Users/jylu/Documents/Shared/Articles/Laoudi - 2-rang du groupe des classes et courbes elliptiques (2006).pdf>), pp. 31–32 (PDF 1–2). | Rational points, $2$-rank, class-group notation, and descent. |
| S14 | [Lee, *Divisibility of class numbers of non-normal totally real cubic number fields*](<C:/Users/jylu/Documents/Shared/Articles/Lee - Divisibility of class numbers of non-normal totally real cubic number fields (2010).pdf>), p. 38 (PDF 1), including Theorem 1.1. | Prescribed order in the ideal class group and the different generator/parameter convention. |
| S15 | [Buell and Ennola, *On a Parameterized Family of Quadratic and Cubic Fields*](<C:/Users/jylu/Documents/Shared/Articles/Buell and Ennola - On a Parameterized Family of Quadratic and Cubic Fields (1995).pdf>), p. 134 (PDF 1), rendered and read visually. | Abstract-level verification of the quadratic/cubic family and 3-primary class-group context. This local PDF is image-only; no whole-paper text search or full-paper reading is claimed. |
| S16 | [Cassels and Flynn, *Prolegomena to a Middlebrow Arithmetic of Curves of Genus 2*](<C:/Users/jylu/Documents/Shared/Books/Cassels and Flynn - Prolegomena to a Middlebrow Arithmetic of Curves of Genus 2 (1996).pdf>), p. 175 (PDF 190), Theorem 17.0.1 and surrounding discussion. | Determinant of a pencil of quadrics and projective parameters. Its higher-dimensional theorem is not substituted for the genus-one argument in the manuscript. |

The other 17 selected library sources were used only for targeted searches or checked for potentially relevant passages: Silverman–Tate; Cassels's *Lectures on Elliptic Curves*; Serre's *Lectures on the Mordell–Weil Theorem*; Neukirch; Barbeau; Louboutin (2001); Pincus–Washington; Walsh (2023 and 2024); Gras–Gras; Choi–Kim; Schaefer–Stoll; Stoll (2001); Bugeaud–Mignotte–Siksek–Stoll–Tengely; Cohen; Smart; and Breen–Varma–Voight. Their full texts and cited theorem applications were not independently audited. The run-local manifest records the exact library paths and hashes of all 33 copies.

External supplements, explicitly separate from Shared:

- **X1:** Jonathan Hanke, [*The Structure of Masses of rank n Quadratic Lattices of varying determinant over number fields*](https://arxiv.org/abs/1108.3580), arXiv v2. The author abstract was inspected solely to attest the closed spelling “squareclasses.” No substantive theorem from this paper is used.
- **X2:** [Publisher record for Kala–Sgallová–Tinková](https://www.sciencedirect.com/science/article/pii/S0022314X25000228). Publication metadata was checked; the published Proposition 3.7 locator was not verified from this record.

No library PDF was modified, renamed, or moved. Existing copies were reused. New extracted text, source-use records, and rendered comparison pages stay in the ignored review build directory; `sources.json` itself was preserved in this read-only task.

## 9. Verification and remaining work

| Gate | Result and limits |
|---|---|
| Current-source coverage | Entire current `.tex` read, including title, abstract, all six sections, displays, tables, and intentional comments. Authoring bibliography and rendered references inspected. |
| Terminology and notation | Compared across the subject groups in §§5–6, with selected primary-source passages identified above. Direct attestations, permissible conventions, and unresolved source locators are distinguished. |
| Mathematical validation | Checked the meaning and implications relevant to editorial proposals. No claim of a new complete proof audit; the full connectedness/adjunction argument and all external theorem applications were not re-certified. |
| Exact or bounded computation | No Magma/PARI computation or independent rerun of the Pell tables, residue matrix, or point counts. Their numbers have not been altered or treated as newly certified by this review. |
| Compilation | Ran the project's `scripts/build.ps1` with the required local MiKTeX `pdflatex.exe`, into an isolated build directory. Four pdfLaTeX passes and BibTeX returned exit code 0. Output: 15 pages. No undefined references/citations or overfull/underfull box messages in the final LaTeX log. |
| Build warnings | The final log reports that shell escape is disabled for `epstopdf`; it did not prevent output. Native MiKTeX utilities also emitted a denied-access message for their per-user diagnostic log file; the compilation/extraction/render outputs themselves were produced. |
| Tool versions | PowerShell 7.6.6; pdfTeX 1.40.29 (MiKTeX 26.5); Python 3.12.14 for extraction support and file verification; Node.js 24.19.0 for the requested writing detector. No dependency installation or upgrade was needed. |
| Rendered output | All 15 pages viewed in overview; pages 1, 11, 14, 15 also viewed at higher resolution. No observed clipping/overlap in that scope. ORCID in the running author header noted as an optional cosmetic issue. |
| Source preservation | SHA-256 comparison against the starting baseline covers all pre-existing tracked files; the 33 selected Shared PDF hashes are also checked again. Results are recorded in `verification.json`. No existing manuscript, bibliography, cover letter, library source, or configuration file is changed by this review. |
| Git/publication | Read-only review: no staging, commit, push, submission, or email. The separate report is the only new non-ignored deliverable. |

The existing build script writes a fixed `date` value of `2026-10-02` into its generated build record. That is a pre-existing run-metadata issue, not this review's execution date. The actual review date is 2026-10-13, recorded in the baseline and verification record; the script was left unchanged.

Reproducible build command used:

```powershell
./scripts/build.ps1 -Source 'Draft/ennola-squareclasses.tex' -OutputDirectory 'build/terminology-review-2026-10-13/compilation'
```

Audit artifacts: [baseline](C:/Users/jylu/Documents/Ennola/build/terminology-review-2026-10-13/baseline.json), [source manifest](C:/Users/jylu/Documents/Ennola/build/terminology-review-2026-10-13/source-manifest.json), [detector output](C:/Users/jylu/Documents/Ennola/build/terminology-review-2026-10-13/avoid-ai-writing-detector.json), [verification record](C:/Users/jylu/Documents/Ennola/build/terminology-review-2026-10-13/verification.json), and [compiled current manuscript](C:/Users/jylu/Documents/Ennola/build/terminology-review-2026-10-13/compilation/ennola-squareclasses.pdf).

The report leaves a concrete set of proposed edits for a later authorized revision. The priority is to correct F02–F09 and the bibliography brace, resolve F11's source locator, and then apply only the optional changes that improve clarity without flattening the author's mathematical voice.
