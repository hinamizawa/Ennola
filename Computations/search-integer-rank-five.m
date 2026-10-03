// Local discovery with exact, independently replayable residue certificates.
// Prepend SearchS, DenominatorBound, and ResiduePrimeBound; seed is one.
// No analytic rank, class group, GRH, BSD, or generic-rank assumption is used.
procedure SearchIntegerRankFive(s, denominator_bound, prime_bound)
    SetColumns(1000);
    SetSeed(1);
    major, minor, patch := GetVersion();
    printf "MAGMA_VERSION=%o.%o-%o\n", major, minor, patch;
    printf "SETTINGS seed=1 denominator_bound=%o residue_prime_bound=%o\n", denominator_bound, prime_bound;
    a := 3*s^2+s-6;
    assert a ge 3;
    Q := Rationals();
    QX<X> := PolynomialRing(Q);
    f := X^3+(a-1)*X^2-a*X-1;
    assert IsIrreducible(f);
    E := EllipticCurve([Q|0,1-a,0,-a,1]);
    assert Discriminant(E) ne 0;
    printf "PARAMETER s=%o a=%o\n", s, a;
    coordinates := [[Q|0,1],[-1,1],[-3/4,(6*s+1)/8]];
    witnesses := [];
    for p in PrimesInInterval(3,prime_bound) do
        F := GF(p);
        FX<Z> := PolynomialRing(F);
        fp := Z^3+(F!a-1)*Z^2-F!a*Z-1;
        for root in Roots(fp) do
            r := root[1];
            if Evaluate(Derivative(fp),r) ne 0 then
                Append(~witnesses,<p,Integers()!r>);
            end if;
        end for;
    end for;

    function Certificate(coords, ws)
        n := #coords;
        rows := [];
        good_ws := [];
        for w in ws do
            p := w[1];
            if &and[Denominator(c[1]) mod p ne 0 : c in coords] then
                F := GF(p);
                values := [F!w[2]+F!c[1] : c in coords];
                if &and[v ne 0 : v in values] then
                    Append(~rows,[IsSquare(v) select 0 else 1 : v in values]);
                    Append(~good_ws,w);
                end if;
            end if;
        end for;
        if #rows eq 0 then return false,[],[],[]; end if;
        M := Matrix(GF(2),#rows,n,&cat rows);
        if Rank(M) lt 5 then return false,[],[],[]; end if;
        indices := [];
        B := ZeroMatrix(GF(2),#rows,0);
        for j in [1..n] do
            trial := HorizontalJoin(B,Submatrix(M,1,j,#rows,1));
            if Rank(trial) gt #indices then
                B := trial;
                Append(~indices,j);
                if #indices eq 5 then break; end if;
            end if;
        end for;
        assert #indices eq 5;
        selected_rows := [];
        selected_ws := [];
        C := ZeroMatrix(GF(2),0,5);
        for i in [1..Nrows(B)] do
            trial := VerticalJoin(C,Matrix(GF(2),1,5,Eltseq(B[i])));
            if Rank(trial) gt #selected_rows then
                C := trial;
                Append(~selected_rows,Eltseq(B[i]));
                Append(~selected_ws,good_ws[i]);
                if #selected_rows eq 5 then break; end if;
            end if;
        end for;
        assert Determinant(C) eq 1;
        return true,[coords[j] : j in indices],selected_rows,selected_ws;
    end function;

    function EmitCertificate(coords,ws)
        success, selected, rows, used_ws := Certificate(coords,ws);
        if success then
            for c in selected do
                assert c[2]^2 eq c[1]*(c[1]+1)*(c[1]-a)+1;
                P := E![c[1],c[2],1];
            end for;
            print "CERTIFICATE_BEGIN";
            for i in [1..5] do
                printf "POINT index=%o x=%o y=%o\n", i,selected[i][1],selected[i][2];
                printf "WITNESS p=%o r=%o bits=%o\n", used_ws[i][1],used_ws[i][2],rows[i];
            end for;
            printf "RANK_LOWER_BOUND=5 s=%o a=%o\n",s,a;
            print "CERTIFICATE_END";
            print "ENNOLA_INTEGER_RANK_FIVE_CERTIFICATE_PASS";
        end if;
        return success;
    end function;

    // Integer points in the bounded interval -100<=x<=100, outside (-1,0).
    for x in [-100..100] do
        square, y := IsSquare(x*(x+1)*(x-a)+1);
        if square and [Q|x,y] notin coordinates then
            Append(~coordinates,[Q|x,y]);
            if #coordinates ge 5 and EmitCertificate(coordinates,witnesses) then return; end if;
        end if;
    end for;
    // Exact search -1<x<0, x=-b/d^2 in lowest terms.
    // While loops keep the V2.20 memory footprint bounded.
    d := 2;
    while d le denominator_bound do
        d2 := d^2;
        d6 := d^6;
        b := 1;
        while b lt d2 do
            if GCD(b,d) eq 1 then
                rhs := b*(d2-b)*(b+a*d2)+d6;
                square, y := IsSquare(rhs);
                if square then
                    c := [Q|-Q!b/d2,Q!y/d^3];
                    if c notin coordinates and [Q|c[1],-c[2]] notin coordinates then
                        Append(~coordinates,c);
                        if #coordinates ge 5 and EmitCertificate(coordinates,witnesses) then return; end if;
                    end if;
                end if;
            end if;
            b +:= 1;
        end while;
        d +:= 1;
    end while;
    printf "NO_CERTIFICATE candidate_points=%o\n",#coordinates;
    print "ENNOLA_INTEGER_RANK_FIVE_SEARCH_COMPLETE";
end procedure;

SearchIntegerRankFive(SearchS,DenominatorBound,ResiduePrimeBound);
quit;
