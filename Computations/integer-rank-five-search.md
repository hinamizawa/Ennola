# Local search for integer rank-five parameters

This optional experiment addresses `conj:integer-rank-five` in the current manuscript: find integers $s$ with $a=3s^2+s-6\geq3$ and $\operatorname{rank}E_a(\mathbb Q)\geq5$, where $E_a:y^2=x(x+1)(x-a)+1$. The second square condition $v^2=240a+4321$ is not imposed. The manuscript and its submission source are preserved; these experiments are not dependencies of their written proofs.

## Discovery and certification

[search-integer-rank-five.m](search-integer-rank-five.m) first checks the points $(0,1)$, $(-1,1)$ and $(-3/4,(6s+1)/8)$, searches integer $x$ with $-100\leq x\leq100$, then searches $x=-b/d^2$ with $2\leq d\leq D$, $0<b<d^2$ and $\gcd(b,d)=1$. The cleared equation is $y_0^2=b(d^2-b)(b+ad^2)+d^6$, giving the point $(-b/d^2,y_0/d^3)$. All square tests and rational coordinates are exact. The finite discovery bounds do not exhaust rational points or possible parameters.

For each parameter, the script checks the irreducibility of $f_a(X)=X^3+(a-1)X^2-aX-1$ and the nonsingularity of $E_a$. It finds simple roots $r$ of $f_a$ modulo odd primes $p\leq P$. A usable pair $(p,r)$ avoids every selected $x$-coordinate denominator and has $r+x_i\ne0$. Its row records $0$ for square residues and $1$ for nonsquare residues among the five values $r+x_i$. A success consists of five exact points and five such rows forming an invertible matrix over $\mathbb F_2$. Successful input and output are retained with their SHA-256 hashes; an error, missing completion marker, memory stop or timeout is never a success.

Here is the mathematical implication of that certificate. Put $K=\mathbb Q(\theta)$, with $f_a(\theta)=0$, and $g_a(T)=T(T+1)(T-a)+1$. Set $\delta(O)=1$ and $\delta(P)=[x(P)+\theta]\in K^\times/K^{\times2}$. For three intersections of a nonvertical line $y=L(x)$ with the curve, counting tangent multiplicities, substitute $T=-\theta$ into $g_a(T)-L(T)^2=\prod_{i=1}^3(T-x_i)$. This gives $\prod_i(\theta+x_i)=L(-\theta)^2$. The vertical-line case gives $\delta(P)\delta(-P)=1$. The chord-and-tangent law therefore makes $\delta$ a homomorphism, so it annihilates doubles; this is also the argument in the manuscript's proof of `thm:four-points`.

Each simple root $(p,r)$ lifts by Hensel's lemma to an embedding $K\hookrightarrow\mathbb Q_p$. A square unit has square nonzero residue, so the displayed quadratic characters annihilate every squareclass relation. An invertible five-column matrix excludes all 31 nonempty products of the descent values from being squares. Since $\delta$ annihilates doubles, the five point classes are independent in $E_a(\mathbb Q)/2E_a(\mathbb Q)$. Irreducibility of $f_a$ implies $E_a(\mathbb Q)[2]=0$, so finite generation gives $\dim_{\mathbb F_2}E_a(\mathbb Q)/2E_a(\mathbb Q)=\operatorname{rank}E_a(\mathbb Q)\geq5$. This proves a lower bound, without determining the exact rank or a full Mordell--Weil basis. No analytic rank, GRH, BSD or class-group proof setting is used.

[replay-integer-rank-five.m](replay-integer-rank-five.m) checks saved certificates in a fresh process without running a point-search routine: the curve equations, cubic irreducibility, nonsingularity, primality of each modulus, the simple-root conditions, all residue characters, the determinant, and detection of every nonzero vector in $\mathbb F_2^5$. The replay wrapper preserves its complete input, output, hashes and status separately from discovery.

For example, the [discovery log for $s=-69$](../build/integer-rank-five-20261002T1238Z/lane-3/s--69/output.log) gives $a=14208$ and the five points

$$
(0,1),\quad(-1,1),\quad(-3/4,-413/8),\quad(-12/49,17585/343),\quad(-41/81,43451/729).
$$

The pairs $(p,r)=(11,10),(17,14),(19,5),(31,7),(37,34)$ give the character matrix

$$
M=\begin{pmatrix}
1&0&0&0&1\\
1&0&0&1&1\\
0&0&0&0&1\\
0&1&0&1&1\\
0&0&1&0&0
\end{pmatrix}.
$$

Writing $R_i$ for its rows, the combinations $R_1+R_3$, $R_4+R_2+R_1+R_3$, $R_5$, $R_2+R_1$, $R_3$ are respectively the five standard basis vectors. Thus $M$ is invertible over $\mathbb F_2$. The exact equations and all root/residue conditions passed the [final fresh replay](../build/integer-rank-five-20261002T1238Z/replay-final/record.json), certifying $\operatorname{rank}E_{14208}(\mathbb Q)\geq5$.

## Arithmetic structure of the parameters

Every one of the 42 final certificates contains the three family points displayed above and two further independent points. The detected values include 21 positive and 21 negative integers; their counts in residue classes $0,1,2,3$ modulo four are respectively $10,11,10,11$. Thus neither a prescribed sign nor one residue class modulo four characterizes this list. These are statistics of the finite search, whose point bounds favor certificates with relatively small coordinates; they do not establish an asymptotic distribution.

Fix an extra abscissa $x=-b/d^2$, with $0<b<d^2$ and $\gcd(b,d)=1$. Put $u=6s+1$, so $a=(u^2-73)/12$. The cleared point equation becomes

$$12N^2-bd^2(d^2-b)u^2=12d^6+b(d^2-b)(12b-73d^2),\qquad u\equiv1\pmod6.$$

Here $N=d^3y$ is an integer whenever $s$ is an integer and $y$ is rational: its square is the integer cleared right-hand side, and a rational number whose square is integral is integral. This is a generalized Pell equation. Two fixed extra abscissae impose two such equations simultaneously. Point existence alone does not prove their independence; the separate residue certificate establishes that.

For $s=-69$, the extra abscissae $-12/49$ and $-41/81$ give

$$Y^2-1813u^2=-9372,\qquad Z^2-11070u^2=-209429,$$

with $(u,Y,Z)=(-413,17585,43451)$. Their projective closure in coordinates $[u:Y:Z:w]$ is a smooth complete intersection of two quadrics of genus one, with this rational point. The [exact structure check](../build/integer-rank-five-2026-10-02/check-structure.m), [output](../build/integer-rank-five-2026-10-02/check-structure.log) and [record](../build/integer-rank-five-2026-10-02/check-structure.record.json) verify the general polynomial identity, both numerical equations, nonsingularity and genus one in local Magma V2.20-9.

Consequently this fixed pair of extra abscissae occurs for only finitely many integer $s$: its integral triples lie on an affine genus-one curve, to which Siegel's finiteness theorem applies. The theorem is summarized on [Hindry and Silverman's author page for Diophantine Geometry](https://www.math.brown.edu/johsilve/DGIHome.html), inspected on 2 October 2026. We have not enumerated all those integral triples. This explains a limitation of producing an infinite integer family from this particular auxiliary curve, while leaving `conj:integer-rank-five` open. The statement does not assert that every possible pair of extra abscissae has a smooth genus-one intersection.

## Native Windows execution

The installed local executable is `C:/Program Files (x86)/Magma/magma.exe`; the actual smoke and replay runs report V2.20-9. Every invocation uses `-n -S 1 -b`, with standalone inputs ending in `quit;`. No public-calculator request is made in this experiment. The runner uses four native processes, a 60-second limit per parameter, a 700 MB working-set stop per process, and a single shared two-hour wall deadline. The parameter queue partitions both signs in increasing absolute value without overlap. All child windows are hidden. The runner stops only its own Magma processes and writes results for interrupted work separately.

```powershell
./scripts/search-integer-rank-five.ps1 -Workers 4 -MaxAbsS 5000 -DenominatorBound 120 -ResiduePrimeBound 1009 -WallSeconds 7200 -JobSeconds 60
./scripts/replay-integer-rank-five.ps1 -RunDirectory 'build/integer-rank-five-20261002T1238Z' -Name 'replay-final'
```

## Run of 2 October 2026

The [run directory](../build/integer-rank-five-20261002T1238Z/) contains the [manifest](../build/integer-rank-five-20261002T1238Z/manifest.json), live [progress](../build/integer-rank-five-20261002T1238Z/progress.json), per-lane JSONL ledgers, and every parameter's input, log and record. It started at 20:37:48 China time, with a deadline of 22:37:48. At launch the queue was $2\leq|s|\leq5000$, $D=120$, $P=1009$; both signs are included and all these parameters satisfy $a\geq3$. Previously listed parameters are $-54,-46,-42,-40,-39,-38,17,23,42,45,55$; newness below means absence from this eleven-element list, not a literature-priority claim.

The broad pass finished at 21:41:11 China time: all 9998 parameter jobs completed normally, with 30 certified values and 22 absent from the prior list. The deeper pass ran from 21:41:16 to 22:08:02 and completed all 998 jobs normally, with 35 certified values. Both final replays passed: [30 broad certificates](../build/integer-rank-five-20261002T1238Z/replay-final/record.json) and [35 deeper certificates](../build/integer-rank-five-deep-20261002/replay-final/record.json). Their union contains 42 distinct parameters, including 34 additional values; the deeper pass added twelve values to the broad pass. The final report was written at 22:08:11, about 90 minutes 23 seconds after the start, within the original two-hour budget. No parameter job failed or timed out, and all eight worker exit codes were zero. A bounded search without a certificate makes no assertion that the rank is below five.

The [full results](../build/integer-rank-five-2026-10-02/RESULTS.md), [additional-value CSV](../build/integer-rank-five-2026-10-02/new-certified.csv), [all-value CSV](../build/integer-rank-five-2026-10-02/all-certified.csv) and [summary](../build/integer-rank-five-2026-10-02/summary.json) give the final parameters and links to certificate logs. Both manuscript source hashes match their starting values. No manuscript compilation, PDF rendering or publication action was needed or performed.

The deeper pass used $2\leq|s|\leq500$, $D=400$, $P=5003$, within the same original deadline. Its [source candidate](../build/integer-rank-five-2026-10-02/sieved-candidate.m) skips a numerator only when the cleared right-hand side is not a square modulo 64. For fixed $a,d$, that integer polynomial is periodic in $b$ modulo 64; an integer square must lie in the exact set $\{r^2\bmod64:0\leq r<64\}$. Enumerating each admissible residue class therefore preserves the entire stated numerator domain. A [regression check](../build/integer-rank-five-2026-10-02/check-sieve.log) confirmed identical point sets for $s=-54,-17,17,69$ and $d\leq100$. This finite check supplements the general congruence argument. A pilot at $s=-54$ still found no five-column certificate; its point list, reduction/saturation attempt, alternate-real-branch attempt and timed-out native point search are retained under the [experiment directory](../build/integer-rank-five-2026-10-02/) and do not give an upper rank bound.

The [continuation script](../build/integer-rank-five-2026-10-02/continue-with-deep-pass.ps1) waited for the broad pass, applied the remaining original wall-time budget to the deeper pass, ran both final replays and wrote the deduplicated CSV and report. The original broad-pass runner and source were copied into its run directory with unchanged hashes before extending the runner to accept a different search-source path.
