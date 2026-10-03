// Fresh verifier for the finitely many specialization claims in the manuscript.
// No files are loaded, no network requests are made, and no files are written.
// For a selected job, prepend (for example):
//   SpecializationFamily := "rational";
//   SpecializationParameter := Rationals()!2;
//   SpecializationMode := "full";
// Supported families/parameters:
//   rational: 0, 2, 7/2, 4 (these are t, not a);
//   integer: -54,-46,-42,-40,-39,-38,17,23,42,45,55 (these are s).
// Modes: "full", "certificate", "rank", "discover".
// "discover" constructs and certifies fresh points, without a RankBounds call.
// "certificate" uses displayed rational points or prepended FreshCoordinates.
// "full" constructs any missing integer points and also calls RankBounds.
// To replay points from a new successful discovery, prepend their exact output:
//   FreshCoordinates := [[Rationals() | x1,y1], ... ];
// A *_PASS marker certifies only the scope named by that marker.

if not assigned SpecializationFamily then
    SpecializationFamily := "rational";
end if;
if not assigned SpecializationParameter then
    SpecializationParameter := Rationals()!0;
end if;
if not assigned SpecializationMode then
    SpecializationMode := "full";
end if;
if not assigned ResiduePrimeLimit then
    ResiduePrimeLimit := 1009;
end if;
if not assigned FreshCoordinates then
    FreshCoordinates := [];
end if;

procedure RunSpecialization(SpecializationFamily,SpecializationParameter,
    SpecializationMode,ResiduePrimeLimit,FreshCoordinates)
assert SpecializationFamily in {"rational", "integer"};
assert SpecializationMode in {"full", "certificate", "rank", "discover"};
assert ResiduePrimeLimit ge 3;

SetSeed(1);
version_major, version_minor, version_patch := GetVersion();
printf "MAGMA_VERSION=%o.%o-%o\n", version_major, version_minor, version_patch;
print "SEED=1";
print "CLASS_GROUP_PROOF_SETTINGS=defaults; no GRH or bounded-proof override";
modern_rank_api := version_major gt 2 or
    (version_major eq 2 and version_minor ge 21);
printf "FAMILY=%o PARAMETER=%o MODE=%o\n", SpecializationFamily,
    SpecializationParameter, SpecializationMode;

Q := Rationals();
QX<X> := PolynomialRing(Q);
F2 := GF(2);

function MatrixFromRows(rows, number_of_columns)
    if #rows eq 0 then
        return ZeroMatrix(GF(2), 0, number_of_columns);
    end if;
    return Matrix(GF(2), #rows, number_of_columns, &cat rows);
end function;

// At a simple root r of f_a modulo p, Hensel's lemma supplies K -> Q_p.
// If p avoids the coefficient/point denominators and every r+x_i is nonzero,
// reduction supplies an exact quadratic character on each descent value.
// Return only linearly independent character rows, with their (p,r) witnesses.
function ResidueCertificateRows(parameter_a, x_coordinates, prime_limit)
    rows := [];
    prime_roots := [];
    p := 3;
    n := #x_coordinates;
    while p le prime_limit do
        usable := Denominator(parameter_a) mod p ne 0 and
            &and[Denominator(c) mod p ne 0 : c in x_coordinates];
        if usable then
            Fp := GF(p);
            FpX<Z> := PolynomialRing(Fp);
            ap := Fp!parameter_a;
            fp := Z^3 + (ap-1)*Z^2 - ap*Z - 1;
            dfp := Derivative(fp);
            for r_integer in [0..p-1] do
                r := Fp!r_integer;
                if Evaluate(fp,r) eq 0 and Evaluate(dfp,r) ne 0 then
                    values := [r+Fp!c : c in x_coordinates];
                    if &and[v ne 0 : v in values] then
                        row := [IsSquare(v) select 0 else 1 : v in values];
                        old_rank := #rows;
                        trial := MatrixFromRows(Append(rows,row),n);
                        if Rank(trial) gt old_rank then
                            Append(~rows,row);
                            Append(~prime_roots,<p,r_integer>);
                            if #rows eq n then
                                return MatrixFromRows(rows,n), prime_roots;
                            end if;
                        end if;
                    end if;
                end if;
            end for;
        end if;
        p := NextPrime(p);
    end while;
    return MatrixFromRows(rows,n), prime_roots;
end function;

// Select points by exact square tests in the cubic number field. The list
// products contains every product of the previously selected descent values.
function SelectCertifiedPoints(parameter_a, candidates, target, prime_limit)
    if #candidates lt target then
        return false, candidates;
    end if;
    QY<Y> := PolynomialRing(Rationals());
    K<theta> := NumberField(Y^3+(parameter_a-1)*Y^2-parameter_a*Y-1);
    selected := [];
    products := [K|1];
    for P in candidates do
        delta := theta+Q!(P[1]/P[3]);
        if &and[not IsSquare(delta*z) : z in products] then
            Append(~selected,P);
            products cat:= [delta*z : z in products];
            if #selected eq target then
                return true, selected;
            end if;
        end if;
    end for;
    return false, candidates;
end function;

// Construct points by a finite exact search -1 < x < 0, x=-b/d^2.
// This is a discovery bound only; the certificates do not assert completeness.
function ElementaryPointSearch(parameter_a,E,initial,target,denominator_bound)
    assert Denominator(parameter_a) eq 1;
    integer_a := Integers()!parameter_a;
    candidates := initial;
    for d in [1..denominator_bound] do
        d2 := d^2;
        for b in [1..d2-1] do
            if GCD(b,d) eq 1 then
                rhs := b*(d2-b)*(b+integer_a*d2)+d^6;
                square, root := IsSquare(rhs);
                if square then
                    P := E![-Rationals()!b/d2,Rationals()!root/d^3,1];
                    if P notin candidates and -P notin candidates then
                        Append(~candidates,P);
                        if #candidates ge target then
                            success, selected := SelectCertifiedPoints(
                                parameter_a,candidates,target,0);
                            if success then
                                return true,selected;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end for;
    end for;
    return false,candidates;
end function;

if SpecializationFamily eq "rational" then
    t := Q!SpecializationParameter;
    assert t in {Q|0,2,7/2,4};
    u := (41*t^2-382*t+820)/(20-t^2);
    v := (191*t^2-1640*t+3820)/(20-t^2);
    a := (u^2-73)/12;
    assert v^2-20*u^2 eq 2861;
    coordinates := [[Q|0,1],[-1,1],[-3/4,u/8],[-15/16,v/64]];
    if t eq 0 then
        assert a eq 134;
        expected_rank := 4;
    elif t eq 2 then
        assert a eq 619/64;
        Append(~coordinates,[Q|-5/16,227/128]);
        expected_rank := 5;
    elif t eq 7/2 then
        assert a eq -5556/961;
        Append(~coordinates,[Q|8,977/31]);
        Append(~coordinates,[Q|-7/31,163/961]);
        expected_rank := 6;
    else
        assert a eq 8;
        expected_rank := 3;
    end if;
else
    assert Denominator(Q!SpecializationParameter) eq 1;
    s := Integers()!SpecializationParameter;
    assert s in {-54,-46,-42,-40,-39,-38,17,23,42,45,55};
    a := Q!(3*s^2+s-6);
    assert a ge 3;
    u := Q!(6*s+1);
    assert u^2 eq 12*a+73;
    expected_rank := 5;
    coordinates := [[Q|0,1],[-1,1],[-3/4,u/8]];
end if;

f := X^3+(a-1)*X^2-a*X-1;
assert IsIrreducible(f);
E := EllipticCurve([Q|0,1-a,0,-a,1]);
assert Discriminant(E) ne 0;
printf "A=%o EXPECTED_RANK=%o\n", a, expected_rank;
printf "MODEL_AINVARIANTS=%o\n", aInvariants(E);
printf "CURVE_DISCRIMINANT=%o\n", Discriminant(E);
print "CUBIC_IRREDUCIBLE=true; RATIONAL_TWO_TORSION=0";

if SpecializationFamily eq "rational" then
    if t eq 4 then
        four := [E![c[1],c[2],1] : c in coordinates];
        assert 2*four[1]+four[2]+four[4] eq E!0;
        print "T4_RELATION=2P+Q+T=O";
        coordinates := coordinates[1..3];
    end if;
end if;

do_certificate := SpecializationMode ne "rank";
do_rank := SpecializationMode in {"full", "rank"};

if do_certificate then
    if SpecializationFamily eq "integer" and #FreshCoordinates gt 0 then
        assert #FreshCoordinates ge expected_rank;
        coordinates := [[Q|c[1],c[2]] : c in FreshCoordinates];
        print "POINT_SOURCE=exact coordinates from a new project discovery run";
    end if;
    for c in coordinates do
        assert #c eq 2;
        assert c[2]^2 eq c[1]*(c[1]+1)*(c[1]-a)+1;
    end for;
    candidates := [E![c[1],c[2],1] : c in coordinates];
    certified, points := SelectCertifiedPoints(a,candidates,
        expected_rank,ResiduePrimeLimit);

    if not certified and SpecializationFamily eq "integer" then
        assert SpecializationMode ne "certificate";
        print "FRESH_POINT_CONSTRUCTION_BEGIN";
        print "ELEMENTARY_POINT_SEARCH=-b/d^2; 1<=d<=150; 0<b<d^2";
        certified, elementary_points := ElementaryPointSearch(a,E,
            candidates,expected_rank,150);
        if certified then
            points := elementary_points;
            print "ELEMENTARY_POINT_SEARCH_SUCCEEDED=true";
        else
            candidates := elementary_points;
        end if;
    end if;
    if not certified and SpecializationFamily eq "integer" then
        if modern_rank_api then
            discovery_bounds, discovered, sha_information :=
                MordellWeilShaInformation(E : RankOnly:=true, Effort:=1);
            print "POINT_CONSTRUCTION_SETTINGS=RankOnly true; Effort 1";
        else
            discovery_group, discovery_map :=
                MordellWeilGroup(E : Bound:=150, HeightBound:=0);
            discovered := [discovery_map(discovery_group.i) :
                i in [1..Ngens(discovery_group)] |
                Order(discovery_group.i) eq 0];
            discovery_lower, discovery_upper := RankBounds(E : Bound:=150);
            discovery_bounds := [discovery_lower,discovery_upper];
            print "POINT_CONSTRUCTION_SETTINGS=MordellWeilGroup; Bound 150; HeightBound 0";
        end if;
        printf "POINT_CONSTRUCTION_BOUNDS=%o\n", discovery_bounds;
        printf "POINT_CONSTRUCTION_RAW_POINTS=%o\n", discovered;
        // These bounds and the independence of the returned list are not
        // accepted as a point certificate. Only exact equations and residue
        // characters below certify the selected coordinates.
        for P in discovered do
            if P ne E!0 and P notin candidates and -P notin candidates then
                Append(~candidates,P);
            end if;
        end for;
        certified, points := SelectCertifiedPoints(a,candidates,
            expected_rank,ResiduePrimeLimit);
        if not certified then
            print "FRESH_POINT_CONSTRUCTION=reduce and saturate at 2";
            reduced := ReducedBasis(candidates);
            saturated := Saturation(reduced,2 : TorsionFree:=true);
            certified, points := SelectCertifiedPoints(a,saturated,
                expected_rank,ResiduePrimeLimit);
        end if;
    end if;

    assert certified;
    assert #points eq expected_rank;
    exact_coordinates := [[Q|P[1]/P[3],P[2]/P[3]] : P in points];
    for c in exact_coordinates do
        assert c[2]^2 eq c[1]*(c[1]+1)*(c[1]-a)+1;
    end for;
    print "FRESH_COORDINATES_BEGIN";
    printf "FreshCoordinates := %o;\n", exact_coordinates;
    print "FRESH_COORDINATES_END";

    xs := [c[1] : c in exact_coordinates];
    M, prime_roots := ResidueCertificateRows(a,xs,ResiduePrimeLimit);
    assert Ncols(M) eq expected_rank;
    printf "RESIDUE_CERTIFICATE_RANK=%o\n", Rank(M);
    if Nrows(M) eq expected_rank then
        assert Rank(M) eq expected_rank;
        assert Determinant(M) eq 1;
    end if;
    for i in [1..Nrows(M)] do
        printf "RESIDUE_ROW p=%o r=%o bits=%o\n", prime_roots[i][1],
            prime_roots[i][2],Eltseq(M[i]);
    end for;
    print "RESIDUE_MATRIX=", M;

    // Exact cubic-field square tests cover every nonempty product, including
    // classes not detected by the bounded list of degree-one residue primes.
    K<theta> := NumberField(f);
    descent_values := [theta+x : x in xs];
    for mask in [1..2^expected_rank-1] do
        bits := [(mask div 2^(j-1)) mod 2 : j in [1..expected_rank]];
        value := &*[K|descent_values[j]^bits[j] : j in [1..expected_rank]];
        assert not IsSquare(value);
        witness := 0;
        for i in [1..Nrows(M)] do
            if &+[F2|M[i,j]*bits[j] : j in [1..expected_rank]] eq 1 then
                witness := i;
                break;
            end if;
        end for;
        if witness gt 0 then
            printf "NONSQUARE_PRODUCT mask=%o exact=true p=%o r=%o\n", mask,
                prime_roots[witness][1],prime_roots[witness][2];
        else
            printf "NONSQUARE_PRODUCT mask=%o exact=true\n", mask;
        end if;
    end for;
    printf "CERTIFIED_POINT_COUNT=%o PRODUCT_COUNT=%o\n", expected_rank,
        2^expected_rank-1;
    print "POINT_CERTIFICATE=exact equations and all cubic-field square tests";
end if;

if do_rank then
    print "RANK_BOUNDS_BEGIN";
    if modern_rank_api then
        print "RANK_SETTINGS=RankBounds; Effort 1";
        lower_rank, upper_rank := RankBounds(E : Effort:=1);
    else
        print "RANK_SETTINGS=RankBounds; Bound 150";
        lower_rank, upper_rank := RankBounds(E : Bound:=150);
    end if;
    printf "RANK_BOUNDS=[%o,%o]\n", lower_rank, upper_rank;
    assert lower_rank eq expected_rank;
    assert upper_rank eq expected_rank;
end if;

if SpecializationMode eq "full" then
    print "ENNOLA_SPECIALIZATION_PASS";
elif SpecializationMode eq "rank" then
    print "ENNOLA_SPECIALIZATION_RANK_PASS";
else
    print "ENNOLA_SPECIALIZATION_CERTIFICATE_PASS";
end if;
end procedure;

RunSpecialization(SpecializationFamily,SpecializationParameter,
    SpecializationMode,ResiduePrimeLimit,FreshCoordinates);
