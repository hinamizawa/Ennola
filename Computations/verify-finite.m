// Fresh finite certificates for Draft/ennola-squareclasses-submission.tex.
// Created for this project from the displayed formulas, 2026-10-02.
// Input is self-contained and suitable for the public Magma calculator.
// No rank bounds, class-group computation, or infinite search is used.
// The manuscript supplies the general reductions and mathematical arguments.

SetSeed(1);
procedure VerifyFinite()
Q := Rationals();
Z := Integers();

// Sections 1-4: identities in a polynomial ring over Q(a,D).
F<a,D> := FunctionField(Q,2);
R<X> := PolynomialRing(F);
f := X^3+(a-1)*X^2-a*X-1;
d := (a^2+3*a-1)^2-32;
assert f eq X*(X-1)*(X+a)-1;
assert Discriminant(f) eq d;
assert d-(a^2+3*a-2)^2 eq 2*a^2+6*a-35;
assert Evaluate(f,-a) eq -1;
assert Evaluate(f,1-a) eq a^2-a-1;
assert Evaluate(f,-1) eq 2*a-3;
assert Evaluate(f,0) eq -1;
assert Evaluate(f,1) eq -1;
assert Evaluate(f,2) eq 2*a+3;
assert Resultant(f,X) eq 1;
assert Resultant(f,X-1) eq 1;
assert Resultant(f,X+D) eq D*(D+1)*(D-a)+1;
assert Resultant(f,D*X-D+1) eq
    D*(D-1)*a+D^3+D^2-2*D+1;
assert Resultant(f,4*X-3) eq 12*a+73;
assert Resultant(f,16*X-15) eq 240*a+4321;
assert Resultant(f,24*X-23) eq 552*a+14353;
ep := X^2+a*X+1;
assert (ep*(X-1)-X) mod f eq 0;
assert (X*(ep-1)-ep) mod f eq 0;
assert (ep^3-(a+4)*ep^2+(a+3)*ep-1) mod f eq 0;
assert Evaluate(Derivative(f),F!(3/4)) eq (2*(12*a+73)-137)/48;
assert Evaluate(Derivative(f),F!(15/16)) eq
    (14*(240*a+4321)-57569)/3840;
assert Evaluate(Derivative(f),F!(23/24)) eq
    (22*(552*a+14353)-304657)/13248;
assert 57569 eq 23*2503;
assert 304657 mod 137 eq 106;
assert GCD(13248,137) eq 1;

Egeneric := EllipticCurve([F|0,1-a,0,-a,1]);
assert Discriminant(Egeneric) eq 16*d;
assert jInvariant(Egeneric) eq 256*(a^2+a+1)^3/d;

// The coefficient identity used in the elementary unit-squareclass proof.
B<s,w> := PolynomialRing(Q,2);
assert (s^2-2*w)-(w^2-2*s) eq (s-w)*(s+w+2);
sw := [];
for e in [-1,1] do
    // (s-w,s+w+2)=(e,e), because their product is one.
    ss := (e+e-2) div 2;
    ww := (e-e-2) div 2;
    assert (ss-ww)*(ss+ww+2) eq 1;
    Append(~sw,[ss,ww,ss^2-2*ww-4]);
end for;
assert sw eq [[-2,-1,2],[0,-1,-2]];

// All 64 residues modulo 4: use canonical polynomial remainders.
// This avoids constructing a univariate quotient over a nonfield.
R4<X4> := PolynomialRing(Z);
f4 := X4^3+X4^2+2*X4-1;
function Rem4(g)
    h := g mod f4;
    return R4![Coefficient(h,i) mod 4 : i in [0..2]];
end function;
square4 := {Rem4((i+j*X4+k*X4^2)^2) : i,j,k in [0..3]};
assert Rem4(X4) notin square4;
assert Rem4(X4-1) notin square4;
assert Rem4((X4^2+X4+1)^2) eq Rem4(X4+2);
assert Rem4((X4^2+X4)^2) eq Rem4(2*X4^2+3*X4+1);
assert Rem4((X4^2+1)^2) eq Rem4(X4*(X4-1));
assert Rem4((4*X4-3)*(16*X4-15)) eq 1;
R2<X2> := PolynomialRing(GF(2));
f2 := X2^3+X2^2+1;
assert IsIrreducible(f2);
A2<t2> := quo<R2 | f2>;
assert (t2^2+t2+1)^2 eq t2;
assert (t2^2+t2)^2 eq t2-1;

// The mod-13 obstructions in both parameter congruence classes.
R13<X13> := PolynomialRing(GF(13));
f13a := X13^3+3*X13^2-4*X13-1;
f13b := X13^3+7*X13^2-8*X13-1;
assert f13a eq (X13-6)*(X13^2+9*X13+11);
assert f13b eq (X13-3)*(X13-4)*(X13-12);
assert Discriminant(f13a) eq 8;
assert Discriminant(f13b) ne 0;
assert (GF(13)!((4*6-3)*(16*6-15))) eq 11;
assert (GF(13)!(6*(6-1))) eq 4;
assert (GF(13)!((4*3-3)*(16*3-15))) eq 11;
assert (GF(13)!((4*12-3)*(16*12-15)*12*(12-1))) eq 5;
assert not IsSquare(GF(13)!11);
assert not IsSquare(GF(13)!5);

// The prescribed-prime arithmetic and exceptional-prime polynomial.
assert &and[(Integers(48)!b)^4 eq 1 : b in [0..47] | GCD(b,6) eq 1];
assert (Integers(2208)!137)^4 eq 1;
assert [(5^(2^n)-73) div 12 : n in [2..4]] eq [46,32546,12715657546];
assert (137^4-14353) div 552 eq 638154;
assert (137^4-14353) mod 552 eq 0;
assert ((137^4-14353) div 552) mod 4 eq 2;
alpha := 4*X-3;
q := 12*a+73;
assert (alpha^3+(q-58)/3*alpha^2+(2*q-137)/3*alpha-q) mod f eq 0;

// Finite checks of the three scaled reductions at the exceptional prime.
// The general validity for N>=4 also uses the valuation inequalities in text.
RQ<Y> := PolynomialRing(Q);
Rp<Yp> := PolynomialRing(GF(137));
function Reduce137(g)
    assert &and[Denominator(c) mod 137 ne 0 : c in Coefficients(g)];
    return Rp![GF(137)!c : c in Coefficients(g)];
end function;
for N in [4,8,16] do
    qN := 137^N;
    g := Y^3+(qN-58)/3*Y^2+(2*qN-137)/3*Y-qN;
    h1 := Reduce137(Evaluate(g,137^(N-1)*Y)/137^N);
    h2 := Reduce137(Evaluate(g,137*Y)/137^2);
    h3 := Reduce137(g);
    assert h1 eq -Yp/3-1;
    assert h2 eq -Yp*(58*Yp+1)/3;
    assert h3 eq Yp^2*(Yp-58/3);
    for pair in [<h1,GF(137)!(-3)>,<h2,GF(137)!(-1/58)>,<h3,GF(137)!(58/3)>] do
        assert Evaluate(pair[1],pair[2]) eq 0;
        assert Evaluate(Derivative(pair[1]),pair[2]) ne 0;
    end for;
end for;

// Nonmaximal-order progression and the displayed monic integral equation.
assert (Integers(6348)!5)^506 eq 1;
assert (Integers(253)!2)^110 eq 1;
assert (Integers(6348)!5)^(2^13) eq 2845;
assert (2845-73) div 12 eq 231;
assert 6348 eq 12*529;
Fk<k> := FunctionField(Q);
Rk<Xk> := PolynomialRing(Fk);
ak := 231+529*k;
fk := Xk^3+(ak-1)*Xk^2-ak*Xk-1;
xi := (Xk^2-13*Xk+30)/23;
assert (xi^3-(12167*k^2+10925*k+2454)*xi^2
    +(25392*k^2+22802*k+5119)*xi-(138*k+61)*(90*k+41)) mod fk eq 0;
print "SECTION_2_TO_4_FINITE_IDENTITIES_PASS";

// Section 5: the proved finite Pell reduction interval 0<=u<107.
function IsSquareModulo(b,m)
    return (b mod m) in {j^2 mod m : j in [0..m-1]};
end function;
survivors := [j : j in [0..106] |
    &and[IsSquareModulo(20*j^2+2861,m) : m in [16,3,7,11]]];
assert survivors eq [13,19,41,47,55,79,85,97];
survivors13 := [j : j in survivors | IsSquareModulo(20*j^2+2861,13)];
assert survivors13 eq [13,41,55];
assert 20*55^2+2861 eq 63361;
assert 251^2 lt 63361 and 63361 lt 252^2;
seedlist := [];
for j in [0..106] do
    issq,root := IsSquare(20*j^2+2861);
    if issq then
        assert j^2 lt 4*2861;
        Append(~seedlist,[root,j]);
    end if;
end for;
assert seedlist eq [[79,13],[191,41]];
assert 4*2861 lt 107^2;
M := Matrix(Z,2,2,[9,40,2,9]);
assert Determinant(M) eq 1;

function PellOrbit(seed,modulus,maxperiod)
    first := [j mod modulus : j in seed];
    orbit := [first];
    next := [(9*first[1]+40*first[2]) mod modulus,
             (2*first[1]+9*first[2]) mod modulus];
    while next ne first do
        assert #orbit lt maxperiod;
        assert (next[1]^2-20*next[2]^2-2861) mod modulus eq 0;
        Append(~orbit,next);
        next := [(9*next[1]+40*next[2]) mod modulus,
                 (2*next[1]+9*next[2]) mod modulus];
    end while;
    return orbit;
end function;

expected30 := [[6,15,22,27,34,43,50,55],[0,5,12,21,28,33,40,49]];
expected34 := [[7,14,35,42],[13,20,41,48]];
expected28 := [{6,7,14,15,22,27},{0,5,12,13,20,21}];
assert (12*30+73) mod 624 eq 433;
assert (12*34+73) mod 624 eq 481;
for i in [1,2] do
    orbit := PellOrbit(seedlist[i],624,56);
    assert #orbit eq 56;
    good30 := [j-1 : j in [1..56] | orbit[j][2]^2 mod 624 eq 433];
    good34 := [j-1 : j in [1..56] | orbit[j][2]^2 mod 624 eq 481];
    assert good30 eq expected30[i];
    assert good34 eq expected34[i];
    good := Seqset(good30 cat good34);
    assert {j mod 28 : j in good} eq expected28[i];
    assert good eq {j : j in [0..55] | (j mod 28) in expected28[i]};
end for;
assert (41^2-73) div 12 eq 134;
assert 191^2-20*41^2 eq 2861;

for row in [<137,46,2>,<23,8,1>,<2503,2504,1>] do
    modulus,period,coordinate := Explode(row);
    orbit := PellOrbit([191,41],modulus,period);
    assert #orbit eq period;
    zeros := [j-1 : j in [1..period] | orbit[j][coordinate] eq 0];
    if modulus eq 2503 then
        assert zeros eq [512,1764];
        assert orbit[9] eq [52,993];
        assert orbit[513] eq [0,1022];
        assert orbit[1253] eq [(-191) mod 2503,(-41) mod 2503];
        assert orbit[1765] eq [0,1481];
    else
        assert IsEmpty(zeros);
    end if;
end for;
assert IsPrime(313) and IsPrime(2503);
assert 2504 eq 8*313;
assert {j : j in [0..2502] | (-20*j^2-2861) mod 2503 eq 0} eq {1022,1481};
assert {r : r in [0..312] | (28*r-512) mod 1252 eq 0} eq {63};
assert (7*63) mod 313 eq 128;

// The rational parametrization and the specialization at zero used in its proof.
Ft<t> := FunctionField(Q);
ut := (41*t^2-382*t+820)/(20-t^2);
vt := (191*t^2-1640*t+3820)/(20-t^2);
at := (ut^2-73)/12;
assert vt^2-20*ut^2 eq 2861;
assert vt eq 191-t*(ut+41);
assert vt^2 eq 240*at+4321;
assert (ut/8)^2 eq (-3/4)*(1/4)*(-3/4-at)+1;
assert (vt/64)^2 eq (-15/16)*(1/16)*(-15/16-at)+1;
assert ((6*t+1)^2-73)/12 eq 3*t^2+t-6;
function AtRational(h,b)
    assert Evaluate(Denominator(h),b) ne 0;
    return Evaluate(Numerator(h),b)/Evaluate(Denominator(h),b);
end function;
assert AtRational(ut,0) eq 41;
assert AtRational(vt,0) eq 191;
assert AtRational(at,0) eq 134;
print "SECTION_5_PELL_AND_PARAMETRIZATION_PASS";

// Section 6: diagonal-pencil smoothness data and finite-field point counts.
Rlambda<L> := PolynomialRing(Q);
pencil := L*(-20+6*L)*(-2861-1015*L);
assert Degree(pencil) eq 3;
assert Degree(GCD(pencil,Derivative(pencil))) eq 0;
assert 20*1015+6*2861 eq 37466;
function RootCount(b,p)
    return #[j : j in [0..p-1] | (j^2-b) mod p eq 0];
end function;
affinecounts := [];
infinitycounts := [];
for p in [17,19,31] do
    assert GCD(p,2*20*6*2861*1015*37466) eq 1;
    Rfp<Lp> := PolynomialRing(GF(p));
    pencilp := Lp*(-20+6*Lp)*(-2861-1015*Lp);
    assert Degree(pencilp) eq 3;
    assert Degree(GCD(pencilp,Derivative(pencilp))) eq 0;
    affine := &+[RootCount(20*j^2+2861,p)*RootCount(1015-6*j^2,p) : j in [0..p-1]];
    infinity := RootCount(20,p)*RootCount(-6,p);
    Append(~affinecounts,affine);
    Append(~infinitycounts,infinity);
end for;
assert affinecounts eq [16,24,24];
assert infinitycounts eq [0,0,4];
assert [affinecounts[i]+infinitycounts[i] : i in [1..3]] eq [16,24,28];
assert GCD(16,28) eq 4;

eightpoints := {<e*59,h*1679,j*977,31> : e,h,j in [-1,1]};
assert #eightpoints eq 8;
for point in eightpoints do
    U,V,W,Zc := Explode(point);
    assert V^2-20*U^2 eq 2861*Zc^2;
    assert W^2+6*U^2 eq 1015*Zc^2;
end for;

// All five specialized points and the exact residue matrix.
a0 := Q!(-5556/961);
R0<X0> := PolynomialRing(Q);
f0 := X0^3+(a0-1)*X0^2-a0*X0-1;
assert Discriminant(f0) ne 0;
assert R2![GF(2)!c : c in Coefficients(f0)] eq f2;
assert IsIrreducible(f2);
points5 := [[Q|0,1],[-1,1],[-3/4,-59/248],[-15/16,1679/1984],[8,977/31]];
for point in points5 do
    xx,yy := Explode(point);
    assert yy^2 eq xx*(xx+1)*(xx-a0)+1;
end for;
matrixrows := [];
for pair in [<3,2>,<5,4>,<7,5>,<11,4>,<13,2>] do
    p,r := Explode(pair);
    assert Denominator(a0) mod p ne 0;
    Rp0<Xp0> := PolynomialRing(GF(p));
    fp0 := Rp0![GF(p)!c : c in Coefficients(f0)];
    rr := GF(p)!r;
    assert Evaluate(fp0,rr) eq 0;
    assert Evaluate(Derivative(fp0),rr) ne 0;
    values := [rr,rr-1,4*rr-3,16*rr-15,rr+8];
    assert &and[value ne 0 : value in values];
    Append(~matrixrows,[IsSquare(value) select 0 else 1 : value in values]);
end for;
assert matrixrows eq [[1,0,1,1,0],[0,1,1,0,1],[1,0,1,0,1],[0,0,1,0,0],[1,0,1,0,0]];
residuematrix := Matrix(GF(2),matrixrows);
assert Determinant(residuematrix) eq 1;
for mask in [1..31] do
    bits := [(mask div 2^(j-1)) mod 2 : j in [1..5]];
    assert exists{i : i in [1..5] |
        (&+[matrixrows[i][j]*bits[j] : j in [1..5]]) mod 2 eq 1};
end for;

// The proved finite interval for integral parameters of this genus-one base.
integralfirst := [b : b in [-6..8] | IsSquare(12*b+73)];
assert integralfirst eq [-6,-4,-2,4,8];
assert [240*b+4321 : b in integralfirst] eq [2881,3361,3841,5281,6241];
assert [b : b in integralfirst | IsSquare(240*b+4321)] eq [8];
assert 13^2 eq 12*8+73 and 79^2 eq 240*8+4321 and 1 eq 577-72*8;
print "SECTION_6_GENUS_ONE_AND_RESIDUE_MATRIX_PASS";
print "ENNOLA_FINITE_PASS";
end procedure;

VerifyFinite();
