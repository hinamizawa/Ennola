// Supply ReplayCertificates as tuples <s, coordinates, witnesses, bit rows>.
// A fresh local process checks all exact data without a point-search routine.
procedure ReplayIntegerCertificates(certificates)
    SetColumns(1000);
    major, minor, patch := GetVersion();
    printf "MAGMA_VERSION=%o.%o-%o\n", major, minor, patch;
    Q := Rationals();
    QX<X> := PolynomialRing(Q);
    for certificate in certificates do
        s := certificate[1];
        a := 3*s^2+s-6;
        coords := certificate[2];
        witnesses := certificate[3];
        supplied_rows := certificate[4];
        assert a ge 3 and #coords eq 5 and #witnesses eq 5;
        f := X^3+(a-1)*X^2-a*X-1;
        assert IsIrreducible(f);
        E := EllipticCurve([Q|0,1-a,0,-a,1]);
        assert Discriminant(E) ne 0;
        for c in coords do
            assert #c eq 2;
            assert c[2]^2 eq c[1]*(c[1]+1)*(c[1]-a)+1;
            point := E![c[1],c[2],1];
        end for;
        rows := [];
        for w in witnesses do
            p := w[1];
            assert IsPrime(p) and p gt 2;
            assert Denominator(Q!a) mod p ne 0;
            assert &and[Denominator(c[1]) mod p ne 0 : c in coords];
            F := GF(p);
            FX<Z> := PolynomialRing(F);
            fp := Z^3+(F!a-1)*Z^2-F!a*Z-1;
            r := F!w[2];
            assert Evaluate(fp,r) eq 0;
            assert Evaluate(Derivative(fp),r) ne 0;
            values := [r+F!c[1] : c in coords];
            assert &and[v ne 0 : v in values];
            Append(~rows,[IsSquare(v) select 0 else 1 : v in values]);
        end for;
        assert rows eq supplied_rows;
        M := Matrix(GF(2),5,5,&cat rows);
        assert Determinant(M) eq 1;
        for mask in [1..31] do
            bits := Vector(GF(2),[(mask div 2^(j-1)) mod 2 : j in [1..5]]);
            assert M*Transpose(Matrix(bits)) ne ZeroMatrix(GF(2),5,1);
        end for;
        printf "REPLAY_CERTIFIED s=%o a=%o rank_lower_bound=5\n",s,a;
    end for;
    printf "REPLAY_CERTIFICATE_COUNT=%o\n",#certificates;
    print "ENNOLA_INTEGER_RANK_FIVE_REPLAY_PASS";
end procedure;
ReplayIntegerCertificates(ReplayCertificates);
quit;
