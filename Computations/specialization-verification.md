# Specialization verifier

**Development only.** The author subsequently removed the computational specialization claims from the submission scope. These scripts and completed logs are retained as optional development evidence. They are not a dependency of the submission's proofs. No further specialization job was started after that change; see [the final run note](specialization-development-results.md).

`verify-specialization.m` is new code for this project. It does not load older scripts or certificates. It checks only the four rational specializations and eleven integer specializations named in the current manuscript. It makes no assertion about exact rank over a function field or the conjectured infinitude of integer parameters.

## Selected jobs

Prepend assignments to the complete source and submit the resulting standalone input. For example:

```magma
SpecializationFamily := "rational";
SpecializationParameter := Rationals()!2;
SpecializationMode := "certificate";
```

The rational parameters are $t=0,2,7/2,4$, with expected ranks $4,5,6,3$. The integer parameters are $s=-54,-46,-42,-40,-39,-38,17,23,42,45,55$, with expected rank five. Here $a=(u(t)^2-73)/12$ in the first family and $a=3s^2+s-6$ in the second; the input parameter is never $a$ itself.

| Mode | Work and required success marker |
| --- | --- |
| `certificate` | Check the displayed rational points or supplied `FreshCoordinates`; require `ENNOLA_SPECIALIZATION_CERTIFICATE_PASS`. No discovery or rank routine runs. |
| `discover` | Construct fresh integer points if necessary and certify them; require `ENNOLA_SPECIALIZATION_CERTIFICATE_PASS`. The discovery routine itself also returns diagnostic bounds, but the script does not assert that these match. |
| `rank` | Call the version-specific `RankBounds` and assert both bounds equal the expected rank; require `ENNOLA_SPECIALIZATION_RANK_PASS`. |
| `full` | Both point certification and matching rank bounds; require `ENNOLA_SPECIALIZATION_PASS`. |

Suggested first smoke job: the rational parameter $t=2$ in `certificate` mode. This covers five explicit points and all 31 nonempty products without any rank or point-discovery calculation. Follow with $t=7/2$ to cover the six-point claim. Run one selected public-calculator job at a time. A timed-out job may be rerun locally under the owner's instruction, with the new version and settings recorded separately. The source contains no `quit` statement because the public client appends its own final records. All verification code runs inside one procedure, so an assertion failure aborts the procedure before its final marker.

The integer-discovery branch is unfinished development code and has not produced a passing integer certificate. It begins with $(0,1)$, $(-1,1)$, and $(-3/4,(6s+1)/8)$, then tries a finite exact search with $x=-b/d^2$ and $1\leq d\leq150$. That newly added branch exhausted local V2.20 memory in its only completed local attempt. Its subsequent fallback uses `MordellWeilShaInformation` with `RankOnly:=true, Effort:=1` on modern versions, or the older `MordellWeilGroup` path with `Bound:=150, HeightBound:=0`; the latter path was not reached. The earlier local version's `MordellWeilShaInformation` attempt was interrupted during an unconditional class-group proof. These paths should not be described as validated integer verifiers.

## Mathematical scope

The script verifies that $f_a(X)=X^3+(a-1)X^2-aX-1$ is irreducible over $\mathbb Q$ and that $E_a:y^2=x(x+1)(x-a)+1$ is nonsingular. For selected points $P_i=(x_i,y_i)$, the descent values are $\theta+x_i$, where $f_a(\theta)=0$. Exact `IsSquare` tests in $\mathbb Q(\theta)$ exclude every nonempty product of the descent values. The curve equations, number-field arithmetic and residue computations are exact.

The script also searches for finite-prime residue witnesses. For each row, an odd prime $p$ avoids all displayed denominators, $r$ is a simple root of $f_a\bmod p$, and every $r+x_i$ is nonzero. Hensel's lemma gives an embedding $\mathbb Q(\theta)\longrightarrow\mathbb Q_p$ reducing $\theta$ to $r$. A square descent value that is a unit would have square residue. A row records residue squares as zero and nonsquares as one. When these rows span the full column space over $\mathbb F_2$, they give an additional elementary certificate for all products. If the bounded residue search has smaller rank, the exact cubic-field tests remain the certificate; failure to find a residue witness is not evidence of a squareclass relation. Together with the manuscript's descent argument and the absence of rational two-torsion, the exact certificate establishes independence modulo torsion and saturation at two for those points. It does not establish saturation at odd primes or a full Mordell–Weil basis.

At $t=4$ the script also checks $2P+Q+T=O$ and certifies the three-point set $P,Q,R$.

## Rank APIs and reproducibility

The installed V2.20 handbook (`C:/Program Files (x86)/Magma/htmlhelp/text1400.htm`, entries 15580 and 15584) documents `MordellWeilShaInformation` with `RankOnly`, and `RankBounds` with `Bound:=150`. This bound controls the numerator and denominator search on quartic covering curves. The [current handbook](https://magma.maths.usyd.edu.au/magma/handbook/text/1570) documents `RankBounds` with `Effort:=1` and `MordellWeilShaInformation` with `RankOnly` and `Effort`. The [V2.21 release notes](https://magma.maths.usyd.edu.au/magma/releasenotes/pdf/relv221.pdf) record the API change. These settings are not assumed equivalent. The current routine can also use analytic methods internally; a rank result is accepted here only when the documented lower and upper bounds both match, separately from the explicit point certificate.

The script sets seed one, reports all three version components and the selected API, and leaves class-group proof settings at their defaults without a GRH override. The installed V2.20 class-group handbook (`htmlhelp/text381.htm`) states that its defaults use unconditional bounds. The caller must preserve the exact submitted or executed input, its SHA-256, software version, raw output, process/service outcome, and final marker. A timeout, missing marker, or failed assertion is not a successful check. The prime search is bounded by `ResiduePrimeLimit` (default 1009); this only bounds the search for additional residue witnesses.

`scripts/verify-specializations.py` assembles one selected input, calls `scripts/magma-online.py` with the current explicit interpreter, and records a summary under `build/specializations/`. An actual remote timeout triggers the same logical job through local Magma with `-n -S 1 -b` and an appended `quit;`. Other remote errors stop the job. The local wrapper preserves its separate input, hash, command, output, exit code and timeout outcome, and rejects errors even if any marker appears in the output.

## Validation status

The four rational full jobs passed on the public calculator (Magma V2.29-10) on 2 October 2026, with ranks $4,5,6,3$ and all $15,31,63,7$ nonempty products checked. Their complete records are in `build/specializations/runs.jsonl`. The earlier residue-only attempt at $a=134$ failed to find a full-rank matrix below 1009; its failed output is retained separately. Exact square tests confirmed all 15 products are nonsquares, and the revised full job passed. Neither attempted integer specialization produced a complete certificate or a rank result. Computation stopped after the editorial scope change.
