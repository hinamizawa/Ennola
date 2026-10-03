# Possible refinements of the integer rank-five conjecture

This note responds to the author's question on 2 October 2026 about restricting $s$ in `conj:integer-rank-five`. It proposes formulations for discussion and does not change either manuscript. The underlying curve is $E_a:y^2=x(x+1)(x-a)+1$, with $a=3s^2+s-6$.

## A modest strengthening

For integer $s$, the condition $3s^2+s-6\geq3$ is equivalent to $|s|\geq2$. Thus that change alone is editorial. Restricting to $s\geq2$ is a substantive strengthening: the original conjecture allows all but finitely many successful parameters to be negative.

One clean proposed formulation is: **There are infinitely many integers $s\geq2$ such that $\operatorname{rank}E_{3s^2+s-6}(\mathbb Q)\geq5$.** A further, symmetric strengthening asserts this separately for both signs: for each $\varepsilon\in\{1,-1\}$, there are infinitely many integers $n\geq2$ such that $\operatorname{rank}E_{3n^2+\varepsilon n-6}(\mathbb Q)\geq5$. The 42 certified parameters contain 21 of each sign, but this finite observation does not prove either infinitude. The two signs are not interchangeable through an integer reparametrization: the other solution of $3t^2+t-6=3s^2+s-6$ is $t=-s-1/3$.

## A natural arithmetic restriction

A stronger question tied directly to the paper is: **Are there infinitely many integers $s\geq2$ such that $720s^2+240s+2881$ is a square and $\operatorname{rank}E_{3s^2+s-6}(\mathbb Q)\geq5$?** This restores the second square condition $v^2=240a+4321$, or equivalently

$$v^2-20u^2=2861,\qquad u=6s+1.$$

It fixes the additional abscissa $x=-15/16$, giving the point $(-15/16,v/64)$. The manuscript's `cor:rational-family` gives four independent sections on this rational parameter curve. The fifth point is free to vary. In particular, the earlier finiteness argument for two fixed extra abscissae on a genus-one curve does not apply to this single Pell condition.

The underlying positive integral parameter set is infinite. The certified example $s=125$ gives $(u,v)=(751,3359)$ and $a=46994$. Starting with this pair, multiply $v+u\sqrt{20}$ by $(9+2\sqrt{20})^4=51841+11592\sqrt{20}$ repeatedly. The recurrence is

$$u'=51841u+11592v,\qquad v'=231840u+51841v.$$

The multiplier has norm one, so it preserves $v^2-20u^2=2861$. It also preserves $u\equiv1\pmod6$, and both positive coordinates increase. Thus it gives infinitely many positive integer candidates $s=(u-1)/6$. This proves infinitude of the parameter set only; it does not propagate rank at least five from the seed.

At $s=125$ our replayed five-point certificate consists of

$$ (0,1),\quad(-1,1),\quad(-3/4,751/8),\quad(-15/16,3359/64),\quad(-440/441,95941/9261). $$

See the [exact certificate](../build/integer-rank-five-20261002T1238Z/lane-2/s-125/output.log) and [final replay](../build/integer-rank-five-20261002T1238Z/replay-final/record.json). Among the 42 newly replayed parameters, only $125$ satisfies the second square condition. Therefore this is a mathematically motivated stronger question, with limited computational evidence, rather than a conclusion of the broad search.

## Congruences and parity

The [restriction check](../build/integer-rank-five-2026-10-02/check-refinements.m), [output](../build/integer-rank-five-2026-10-02/check-refinements.log) and [run record](../build/integer-rank-five-2026-10-02/check-refinements.record.json) use native Magma V2.20-9, flags `-n -S 1 -b`, and exact arithmetic. The certified parameters occupy every residue class modulo each of $2,3,4,5,7,8$. Modulo $13$, classes $5$ and $11$ have no certificates in this list, but an empty finite sample is not a local obstruction or a rank upper bound. No single preferred congruence follows from these observations.

The paper's existing restriction $a\equiv30,34\pmod{52}$ translates exactly to $s\equiv24,28,32,37,41,45\pmod{52}$. Only $s=45,249$ from the certified list satisfy it, and neither satisfies the second square condition. Thus the present list does not certify rank at least five in the simultaneous square-and-congruence subfamily of `thm:four-points`.

The same check computed the global root number $W(E_a)$ using Magma's documented [RootNumber function](https://magma.maths.usyd.edu.au/magma/handbook/text/1567). It is $-1$ for 32 certified curves and $+1$ for the ten parameters

$$s=-351,-153,-142,94,119,380,495,546,1044,2778.$$

Under the parity conjecture $(-1)^{\operatorname{rank}E_a(\mathbb Q)}=W(E_a)$, those ten curves have rank at least six. This is a conditional inference, not a new unconditional rank certificate. The distinction between Mordell--Weil rank parity and Selmer rank parity matters here; see [Tim Dokchitser, Notes on the Parity Conjecture](https://arxiv.org/abs/1009.5389), whose abstract states the implication from finiteness of the Tate--Shafarevich group. No parity hypothesis enters our existing lower bounds of five. These signs give no reason to replace the broad conjecture's lower bound by a universal exact-rank-five assertion.

For the manuscript, the positive-$s$ formulation is a concise candidate strengthening. The additional Pell condition is better recorded as a stronger question until a targeted search or further argument provides more evidence. An arbitrary congruence restriction, a positive-density assertion, and an exact-rank assertion are not warranted by the completed search.
