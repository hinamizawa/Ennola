# Optional specialization development checks

Recorded on 2 October 2026. The author subsequently removed computational specialization claims from the submission scope. These records are retained for auditability and are not submission dependencies. No inference about infinite families, generic ranks, or the untested integer examples is drawn from them.

## Completed public checks

All four full checks below passed with Magma V2.29-10, seed one, and `RankBounds(E : Effort:=1)`. Each checked the exact curve equations, irreducibility of the cubic, all nonempty products of the displayed descent values by exact `IsSquare` tests in the cubic field, and matching lower and upper rank bounds. These computations do not establish a full Mordell–Weil basis or saturation at odd primes.

| Rational parameter $t$ | Curve parameter $a$ | Rank bounds | Nonempty products | Full run summary |
| --- | --- | --- | --- | --- |
| $0$ | $134$ | $[4,4]$ | 15 | [Record](../build/specializations/20261002T103757132716Z-specialization-rational-0-full/summary.json) |
| $2$ | $619/64$ | $[5,5]$ | 31 | [Record](../build/specializations/20261002T103807302837Z-specialization-rational-2-full/summary.json) |
| $7/2$ | $-5556/961$ | $[6,6]$ | 63 | [Record](../build/specializations/20261002T103810700274Z-specialization-rational-7over2-full/summary.json) |
| $4$ | $8$ | $[3,3]$ | 7 | [Record](../build/specializations/20261002T103814794904Z-specialization-rational-4-full/summary.json) |

The $t=4$ run also checked $2P+Q+T=O$. An initial [five-point smoke check](../build/specializations/20261002T103542198053Z-specialization-rational-2-certificate/summary.json) at $t=2$ passed using only residue characters. Exact point coordinates, additional residue witnesses, transmitted source, hashes, raw XML and settings remain in the linked runs and their referenced public-client directories.

## Failed and interrupted attempts

| Attempt | Actual outcome |
| --- | --- |
| [Initial residue-only full job at $t=0$](../build/specializations/20261002T103550639172Z-specialization-rational-0-full/summary.json) | The bounded residue search did not produce a full-rank certificate. An assertion failed. The client rejected the run even though the old top-level script subsequently printed a marker. This is not a successful full check. |
| [Diagnostic cubic-field test at $a=134$](../build/online-magma/20261002T103707483325Z-diagnose-a134/output.txt) | All 15 printed square tests returned false. The revised verifier then checked these assertions inside a procedure and passed in the completed $t=0$ run above. |
| [Integer $s=-54$](../build/specializations/20261002T103826186172Z-specialization-integer-minus54-full/summary.json) | The public request timed out after 60.5 seconds without output. Local V2.20-9 then entered an expensive unconditional class-group proof and was manually interrupted after 142.36 seconds to avoid continuing that discovery path. It returned no point certificate or rank bounds. The automatic process record labels the nonzero exit `magma_error`; the attached [termination note](../build/specializations/20261002T103826186172Z-specialization-integer-minus54-full/local/termination-note.json) records the actual intervention. |
| [Integer $s=-46$](../build/specializations/20261002T104105666523Z-specialization-integer-minus46-full/summary.json) | The public request timed out after 60.563 seconds without output. Its local V2.20-9 fallback exited after 17.672 seconds with an out-of-memory error during the newly added elementary point-search branch. It returned no certificate or rank bounds and had already exited when the scope-change stop was checked. |

No job was started for $s=-42,-40,-39,-38,17,23,42,45,55$. No integer specialization in this task has a completed verification. No GRH or BSD override was enabled. Local processes used `-n -S 1 -b` and source snapshots ending in `quit;`. The warning suggesting a GRH setting in the interrupted run was not followed.

## Stop state and retained files

After the editorial scope change, no further specialization request was started. The two orchestration sessions have exited, process inspection found no active Magma process, and the public-client lock is absent. The verifier, its wrapper, the complete run ledger at `build/specializations/runs.jsonl`, and all failed or interrupted input/output records are retained. The unsuccessful integer-discovery branch remains marked as unfinished development code in [the verifier explanation](specialization-verification.md).
