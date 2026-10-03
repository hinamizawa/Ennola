# Explanation of the optional finite checks

Manuscript: **Prescribed ideal classes and elliptic points in Ennola cubic fields**, by Junyu Lu. Prepared on 2 October 2026.

The manuscript gives written proofs with explicit identities, residue calculations, finite tables and a squareclass matrix. [verify-finite.m](verify-finite.m) provides optional checks of that arithmetic. None of its theorems invokes a software rank bound, point search, class-group computation or unit-group computation. Software-dependent exact-rank examples have been removed from the submission. The mathematical proof reductions and cited theorems remain essential; running this file is not a substitute for checking them.

## Arithmetic and scope

The code uses exact arithmetic over the integers, rational numbers, polynomial rings, rational function fields, finite fields and finite residue rings. For the family $f_a(X)=X^3+(a-1)X^2-aX-1$, resultants verify the displayed field-norm identities. In the manuscript these are norms $N_{K_a/\mathbb Q}$ for $K_a=\mathbb Q(\theta)$ with $f_a(\theta)=0$. Positive absolute ideal norms are separately defined there.

| Manuscript scope | Checks in the script |
| --- | --- |
| Sections 1–2 | Polynomial discriminant and endpoint values; field-norm identities; exceptional-unit identity and polynomial; the two integer coefficient solutions in the unit argument; all 64 residues in the dyadic nonsquare checks; factorizations and nonsquare residues modulo 13; elliptic discriminant and $j$-invariant. |
| Sections 3–4 | Linear-form norm and derivative identities; prescribed-prime congruences and printed initial parameters; the polynomial of $4\theta-3$; exceptional-prime scaled reductions for $N=4,8,16$; nonmaximal-order modular identities and the integral-element equation; the dyadic square congruences for the unramified extensions. |
| Section 5 | Every integer $0\leq u<107$ in the proved Pell reduction interval; intermediate residue filters; both complete periods modulo 624 and the exponent table; complete periods and zero lists modulo 137, 23 and 2503; the short 2503 certificate; the rational parametrization and its specialization at zero. |
| Section 6 | Squarefreeness of the diagonal pencil over $\mathbb Q$ and at 17, 19 and 31; point counts $16+0$, $24+0$, $24+4$ including infinity; the eight rational sign points; nonsingularity and reduction-modulo-two irreducibility of the specialized cubic; substitution of the five specialized points; every simple root and nonzero residue in the displayed matrix; determinant one and detection of all 31 nonempty products; the finite interval for integral values of $a$. |

The three sample exceptional-prime reductions do not prove the general valuation argument. The script does not certify the ideal-class constructions, the geometric connectedness or adjunction arguments, the imported specialization and torsion theorems, or infinite families as standalone deductions. Those are supplied by the manuscript's mathematics. No numerical approximation or unbounded search is used in this file.

## Execution

The final file passed through the [public Magma calculator](https://magma.maths.usyd.edu.au/calc/) on 2 October 2026, using V2.29-10 and explicit seed one. The transmitted input was 12183 bytes, within the service's 50000-byte limit. All three section markers and `ENNOLA_FINITE_PASS` appeared, with no reported errors. The program-reported CPU time was 0.030 seconds; the service reported 0.050 seconds including its wrapper. All assertions and the final marker are inside a procedure, so an assertion failure aborts before the marker.

- Source SHA-256: `7b6bbe20ae37346281b51359c1e83b6a982f13a278870089bc5af85cc7565eee`.
- Transmitted-input SHA-256: `b25d0d20320417598dab07247caf79fc73c5d416b640c07a23b42d65b5767be9`.
- [Run record](../build/online-magma/20261002T104407585389Z-finite-submission-final/record.json), [transmitted input](../build/online-magma/20261002T104407585389Z-finite-submission-final/input.m), [raw response](../build/online-magma/20261002T104407585389Z-finite-submission-final/response.xml), and [plain output](../build/online-magma/20261002T104407585389Z-finite-submission-final/output.txt).

From the project root, using the Python interpreter documented in `Environment.md`, run:

```text
python scripts/magma-online.py Computations/verify-finite.m --name finite-check --expect-pass ENNOLA_FINITE_PASS
```

Alternatively paste the self-contained file into the public calculator. The file sets seed one. For a local batch run, use `magma -n -S 1 -b` on a copy with `quit;` appended. Always inspect the full output and errors as well as the final marker. A timeout or missing marker is not a pass. Public requests should be sequential and respect the current service limits.

## Software use and disclosure

The supplied finite check used the publicly available calculator. Separate development attempts for examples now omitted from the manuscript were rerun with local V2.20-9 after public timeouts; they are not evidence for any submitted claim. The author confirmed on 2 October 2026 that the local installation is covered by a valid license. The manuscript retains its AI-assistance disclosure. This file and the accompanying code provide the separate explanation requested in the [journal's author instructions](https://publi.math.unideb.hu/for-authors).
