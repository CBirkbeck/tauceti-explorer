# Gross–Zagier formulas and arithmetic heights (part from GZ.0)

This is the first blueprint checkpoint. It covers GZ.0, the normalisation and change-of-convention interfaces, and pins every convention to the Tau Ceti library as it is at the pinned commit f790474. Every declaration is a plan. GZ.0 is partial, and GZ.1–GZ.7 are not read.

## The normalisation table

| Quantity | Tau Ceti at f790474 | BSD / LMFDB / Müller–Stoll | Factor |
| --- | --- | --- | --- |
| Canonical height | `Point.canonicalHeight` = ½·lim h(x(2ⁿP))/4ⁿ, the (O)-height (Silverman's) | ĥ = lim h(x(nP))/n², the 2(O)-height; here `Point.xCanonicalHeight` | ĥ_x = 2ĥ |
| Pairing | `neronTatePairing` = halved polar form, ⟨P, P⟩ = ĥ(P) | ⟨P, Q⟩_BSD = ĥ(P+Q) − ĥ(P) − ĥ(Q), ⟨P, P⟩ = ĥ_x(P); here `bsdHeightPairing` | 2 |
| Regulator | `regulator` = \|det\| of the halved Gram matrix | Reg_BSD; here `bsdRegulator` | 2^r |
| Height over K | Mathlib `logHeight` of the supplied `AdmissibleAbsValues` (no number-field instance yet) | Cai–Shu–Tian's ĥ_K over K; LMFDB's base-change-invariant ĥ/[K:ℚ] | [K:ℚ], and [K:ℚ]^r on regulators (gap) |
| Real period | EllipticCurves Layer 7 plans Ω = 2∫_{D_W>0} dx/√D_W = ∫_{E(ℝ)}\|ω\| | LMFDB Ω = c∞ · (least positive real period) | c∞ ∈ {1, 2} |
| Centre | motivic L(E, s), centre 1 | unitary L(s, π_E) = L(E, s + ½), centre ½ | shift ½; Λ′(E,1) = N^{1/2}π⁻¹L′(E,1) with Γ_ℂ |
| Heegner point | trace Tr_{H/K} | normalised average (1/h)·Tr | h² in heights |
| Unit index | u = [O_K^× : ℤ^×] = #μ(K)/2 (Cai–Shu–Tian, Gross–Zagier) | Conrad p. 69: u_x = #μ(K) | 2, or 4 in u² (E1) |
| Artin map | uniformiser ↦ arithmetic Frobenius (Gross–Zagier, Conrad) | geometric convention | χ ↦ χ⁻¹ |

**Two statements in the Tau Ceti corpus disagree with the implementation.**

- The EllipticCurves roadmap (Layer 6) pins ĥ(P) = lim h(x(n • P))/n² and says the regulator and the Layer 7 BSD quotient are stated against it. The implemented `canonicalHeight` is half of that.
- The `CanonicalHeight` module docstring says the (O)-height is the one the pairing, the regulator and the BSD formula are stated with. The BSD formula needs Reg_BSD = 2^r · `regulator`.

For 37.a1 the LMFDB gives Reg = ĥ_x((0,0)) = 0.0511114082… and Ω·Reg = L′(E,1) = 0.3059997738…, whereas Tau Ceti's `regulator` there is 0.0255557041…. A request to EllipticCurves Layer 7 asks that the BSD quotient use `bsdRegulator`.

## GZ.0 declarations

### Rescaling a pairing rescales its Gram determinant by c^r

Declaration: TauCeti.GrossZagier.det_gram_smul (theorem). Node: GrossZagierAndArithmeticHeights:GZ.0/gram-determinant-rescaling. Planet: Gram determinant rescaling.

Let R be a commutative ring, M an R-module, B : M →ₗ M →ₗ R a bilinear map and v : Fin r → M. For c ∈ R the Gram matrix of c • B on v is c • (Gram matrix of B on v), so det Gram(c • B, v) = c^r · det Gram(B, v). For a real-valued pairing on a free ℤ-module of rank r, the regulator |det Gram| rescales by |c|^r.

Hypotheses: R commutative; r the length of the family.

Proof or construction:

1. Gram(c • B, v)_{ij} = c·B(v_i, v_j), so the Gram matrix is c • Gram(B, v).
2. Matrix.det_smul: det(c • A) = c^r det A for an r × r matrix.
3. Taking absolute values gives the regulator statement.

Acceptance:

- c = 2, r = 1: a rank-one regulator doubles, which is the factor between Tau Ceti's regulator and the BSD regulator (GZ.0/bsd-regulator).
- c = [K:ℚ]: passing from absolute heights to heights over K multiplies a rank-r regulator by [K:ℚ]^r.

Library: `Matrix.det_smul`, `Matrix.det`, `Matrix.of`, `LinearMap.BilinMap`.

Source: muller-stoll-2016, Remark 3.1, p. 4 (arXiv v2).

### The x-height canonical height ĥ_x

Declaration: WeierstrassCurve.Affine.Point.xCanonicalHeight (definition). Node: GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height. Planet: x-height canonical height.

For an elliptic curve given by a Weierstrass equation W over a field K with admissible absolute values, the x-height canonical height is ĥ_x(P) = lim_{n→∞} h(x(2ⁿP))/4ⁿ, where h is Tau Ceti's naïve height of the x-coordinate (Point.naiveHeight). It equals 2 · Point.canonicalHeight P, where Tau Ceti's canonicalHeight carries the factor 1/2 and is the height attached to the divisor (O) (Silverman's normalisation). ĥ_x is the height attached to 2(O), and it is the normalisation of Cremona–Prickett–Siksek, Müller–Stoll and the LMFDB, in which the BSD regulator is computed.

Hypotheses: W elliptic ([W.toAffine.IsElliptic]); K with Height.AdmissibleAbsValues.

Proof or construction:

1. Tau Ceti's Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow: h(2ⁿP)/(2·4ⁿ) tends to canonicalHeight P, so h(2ⁿP)/4ⁿ tends to 2·canonicalHeight P. Hence ĥ_x is a limit, not a junk limUnder value.
2. Consequences: ĥ_x(nP) = n²ĥ_x(P) (Point.canonicalHeight_nsmul), ĥ_x ≥ 0, and ĥ_x(P) = 0 iff P is torsion.

The required uses are:

- GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing: Its associated bilinear form is the BSD pairing.
- GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator: The BSD regulator is its Gram determinant.
- RankZeroOneBSD:BSD.3: The rank-one BSD formula reads L′(E,1)/Ω = ĥ_x(P)·#Ш·∏c_p/#E(ℚ)²_tors.
- GrossZagierAndArithmeticHeights:GZ.1: The Poincaré-biextension height of GZ.1 is compared with it.

The API supplies:

- WeierstrassCurve.Affine.Point.xCanonicalHeight (constructor): Point.xCanonicalHeight P := 2 * P.canonicalHeight.
- WeierstrassCurve.Affine.Point.tendsto_naiveHeight_div_four_pow (characterisation): Tendsto (fun n ↦ ((2^n) • P).naiveHeight / 4^n) atTop (𝓝 P.xCanonicalHeight).
- WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_two_mul (compatibility): P.xCanonicalHeight = 2 * P.canonicalHeight (the comparison with Tau Ceti's normalisation).
- WeierstrassCurve.Affine.Point.xCanonicalHeight_nsmul (simp): (n • P).xCanonicalHeight = n^2 * P.xCanonicalHeight.
- WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_zero_iff (characterisation): P.xCanonicalHeight = 0 ↔ IsOfFinAddOrder P, under Northcott finiteness as for canonicalHeight.

Discriminating tests:

- WeierstrassCurve.Affine.Point.xCanonicalHeight_zero (degenerate): (0 : W.Point).xCanonicalHeight = 0.
- WeierstrassCurve.Affine.Point.xCanonicalHeight_ne_canonicalHeight (non-example): For a point of infinite order, xCanonicalHeight P ≠ canonicalHeight P: the two normalisations differ by the factor 2.
- WeierstrassCurve.Affine.Point.xCanonicalHeight_two_nsmul (value): ((2 : ℕ) • P).xCanonicalHeight = 4 * P.xCanonicalHeight.
- WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_neronTatePairing (comparison): P.xCanonicalHeight = 2 * neronTatePairing W P P: Tau Ceti's pairing on the diagonal is half of ĥ_x.

Acceptance:

- For 37.a1 (y² + y = x³ − x) and P = (0, 0): ĥ_x(P) = 0.0511114082… (LMFDB), so canonicalHeight P = 0.0255557041….

Library: `WeierstrassCurve.Affine.Point.canonicalHeight`, `WeierstrassCurve.Affine.Point.naiveHeight`, `WeierstrassCurve.Affine.Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, `WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `Filter.Tendsto`.

Source: muller-stoll-2016, §3, p. 3 (arXiv v2); muller-stoll-2016, Remark 3.1, p. 4 (arXiv v2); lmfdb-2026, Knowl ec.canonical_height (accessed 2026-09-28).

### The BSD height pairing

Declaration: WeierstrassCurve.Affine.bsdHeightPairing (definition). Node: GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing. Planet: BSD height pairing.

The BSD height pairing is ⟨P, Q⟩_BSD = ĥ(P + Q) − ĥ(P) − ĥ(Q) with ĥ = Tau Ceti's canonicalHeight, the polar form of the (O)-normalised height. Equivalently it is the halved polar form of ĥ_x, and ⟨P, Q⟩_BSD = 2 · neronTatePairing W P Q, where Tau Ceti's neronTatePairing is QuadraticMap.associated', the halved polar form of ĥ. On the diagonal ⟨P, P⟩_BSD = ĥ_x(P) = 2ĥ(P). This is the pairing whose Gram determinant is the regulator in the Birch–Swinnerton-Dyer formula.

Hypotheses: W elliptic.

Proof or construction:

1. ⟨,⟩_BSD = QuadraticMap.polar of canonicalHeightQuadratic, which is bilinear because ĥ satisfies the parallelogram law exactly.
2. neronTatePairing_apply gives neronTatePairing W P Q = (ĥ(P + Q) − ĥ(P) − ĥ(Q))/2, so ⟨,⟩_BSD = 2 • neronTatePairing W.
3. On the diagonal: polar(ĥ)(P, P) = ĥ(2P) − 2ĥ(P) = 2ĥ(P) = ĥ_x(P).

The required uses are:

- GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator: Its Gram determinant is the BSD regulator.
- GrossZagierAndArithmeticHeights:GZ.1: The pairing induced by the Poincaré biextension and the principal polarisation is compared with it.
- RankZeroOneBSD:BSD.3: The BSD consumers state their regulators against it.

The API supplies:

- WeierstrassCurve.Affine.bsdHeightPairing (constructor): bsdHeightPairing W : LinearMap.BilinMap ℤ W.Point ℝ := QuadraticMap.polarBilin (canonicalHeightQuadratic W).
- WeierstrassCurve.Affine.bsdHeightPairing_apply (characterisation): bsdHeightPairing W P Q = (P + Q).canonicalHeight − P.canonicalHeight − Q.canonicalHeight.
- WeierstrassCurve.Affine.bsdHeightPairing_eq_two_smul (compatibility): bsdHeightPairing W = 2 • neronTatePairing W.
- WeierstrassCurve.Affine.bsdHeightPairing_self (simp): bsdHeightPairing W P P = P.xCanonicalHeight.
- WeierstrassCurve.Affine.bsdHeightPairing_comm (relation): bsdHeightPairing W P Q = bsdHeightPairing W Q P.
- WeierstrassCurve.Affine.bsdHeightPairing_eq_zero_of_isOfFinAddOrder_left (other): The pairing kills torsion.

Discriminating tests:

- WeierstrassCurve.Affine.bsdHeightPairing_self_zero (degenerate): bsdHeightPairing W 0 0 = 0.
- WeierstrassCurve.Affine.bsdHeightPairing_ne_neronTatePairing (non-example): For P of infinite order, bsdHeightPairing W P P ≠ neronTatePairing W P P.
- WeierstrassCurve.Affine.bsdHeightPairing_two_nsmul (value): bsdHeightPairing W (2 • P) P = 2 * P.xCanonicalHeight.
- WeierstrassCurve.Affine.bsdHeightPairing_self_eq_two_mul (comparison): bsdHeightPairing W P P = 2 * P.canonicalHeight.

Acceptance:

- For 37.a1: ⟨(0,0), (0,0)⟩_BSD = 0.0511114082…, the LMFDB regulator, while neronTatePairing W (0,0) (0,0) = 0.0255557041….

Depends on: GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height.

Library: `WeierstrassCurve.Affine.canonicalHeightQuadratic`, `WeierstrassCurve.Affine.neronTatePairing`, `WeierstrassCurve.Affine.neronTatePairing_apply`, `WeierstrassCurve.Affine.neronTatePairing_self`, `QuadraticMap.polar`, `QuadraticMap.polarBilin`, `QuadraticMap.associated`.

Source: muller-stoll-2016, §1, p. 1 (arXiv v2); lmfdb-2026, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); muller-stoll-2016, Remark 3.1, p. 4 (arXiv v2).

### The BSD regulator, and Tau Ceti's regulator

Declaration: WeierstrassCurve.Affine.bsdRegulator (definition). Node: GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator. Planet: BSD regulator.

For W elliptic with E(K)/tors finitely generated of rank r, the BSD regulator is Reg_BSD = |det Gram(⟨,⟩_BSD)| on any ℤ-basis of E(K)/tors, and it equals 2^r · regulator W, where Tau Ceti's regulator is the Gram determinant of the halved pairing neronTatePairing. The Birch–Swinnerton-Dyer quotient is stated with Reg_BSD. Tau Ceti's regulator agrees with it only in rank 0.

Hypotheses: W elliptic; [Module.Finite ℤ (PointModTorsion W)]; r = finrank ℤ (PointModTorsion W).

Proof or construction:

1. ⟨,⟩_BSD = 2 • neronTatePairing (GZ.0/bsd-height-pairing), so on any basis Gram(⟨,⟩_BSD) = 2 • neronTateGramMatrix.
2. GZ.0/gram-determinant-rescaling gives |det| = 2^r |det neronTateGramMatrix| = 2^r regulator W (regulator_eq_abs_det_neronTateGramMatrix); basis independence is inherited.

The required uses are:

- RankZeroOneBSD:BSD.3: The BSD quotient for rank one uses Reg_BSD.
- tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4: The arithmetic BSD quotient of Layer 7 must use Reg_BSD, not regulator (request below).
- GrossZagierAndArithmeticHeights:GZ.8: Explicit Gross–Zagier specialisations compare ĥ with L′ through this regulator.

The API supplies:

- WeierstrassCurve.Affine.bsdRegulator (constructor): bsdRegulator W := |det (2 • neronTateGramMatrix W (Module.finBasis ℤ (PointModTorsion W)))|, the Gram determinant of the BSD pairing descended to E(K)/tors.
- WeierstrassCurve.Affine.bsdRegulator_eq_two_pow_mul_regulator (compatibility): bsdRegulator W = 2 ^ finrank ℤ (PointModTorsion W) * regulator W.
- WeierstrassCurve.Affine.bsdRegulator_eq_abs_det (characterisation): Any ℤ-basis of PointModTorsion W computes bsdRegulator W.
- WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_zero (simp): bsdRegulator W = 1 in rank 0.
- WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_one (characterisation): In rank 1 with generator P of E(K)/tors, bsdRegulator W = P.xCanonicalHeight.

Discriminating tests:

- WeierstrassCurve.Affine.bsdRegulator_rank_zero (degenerate): In rank 0, bsdRegulator W = regulator W = 1.
- WeierstrassCurve.Affine.bsdRegulator_rank_one (value): In rank 1, bsdRegulator W = 2 * regulator W.
- WeierstrassCurve.Affine.bsdRegulator_ne_regulator (non-example): In positive rank, bsdRegulator W ≠ regulator W: the two differ by 2^r.
- WeierstrassCurve.Affine.bsdRegulator_eq_xCanonicalHeight (comparison): In rank 1, bsdRegulator W equals ĥ_x of a generator, the LMFDB value 0.0511114082… for 37.a1.

Acceptance:

- 37.a1 (rank 1): Reg_BSD = 0.0511114082… and Ω = 5.9869172924…, so Ω·Reg_BSD = 0.3059997738… = L′(E, 1), with Ш, c_p and torsion all 1 (LMFDB). Tau Ceti's regulator is 0.0255557041… there, and Ω·regulator = L′(E,1)/2.
- Rank 0: Reg_BSD = regulator = 1 (regulator_eq_one_of_finrank_eq_zero).

Depends on: GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing, GrossZagierAndArithmeticHeights:GZ.0/gram-determinant-rescaling.

Library: `WeierstrassCurve.Affine.regulator`, `WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`, `WeierstrassCurve.Affine.neronTateGramMatrix`, `WeierstrassCurve.Affine.PointModTorsion`, `Module.finrank`.

Source: lmfdb-2026, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); muller-stoll-2016, §1, p. 1 (arXiv v2); muller-stoll-2016, Remark 3.1, p. 4 (arXiv v2).

### The dictionary of height conventions

Declaration: TauCeti.GrossZagier.heightConventions (comparison). Node: GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary.

At the pinned Tau Ceti (f790474): canonicalHeight = ½·lim h_x(2ⁿP)/4ⁿ is the (O)-normalised height (Silverman's); neronTatePairing = QuadraticMap.associated' of it, with ⟨P, P⟩ = canonicalHeight P; regulator = |det| of that Gram matrix. In the normalisation of Cremona–Prickett–Siksek, Müller–Stoll and the LMFDB, ĥ = lim h(x(nP))/n² = 2·canonicalHeight, and the BSD regulator is the Gram determinant of the pairing with ⟨P, P⟩ = that ĥ, so Reg_BSD = 2^r·regulator. Two statements in the Tau Ceti corpus disagree with the implementation. (i) The EllipticCurves roadmap pins 'ĥ(P) = lim_n h(x(n • P))/n²' and says the regulator and BSD quotient are stated against it; the implemented ĥ is half of that. (ii) The CanonicalHeight module says the (O)-height is 'the one the Néron–Tate pairing, the regulator and the BSD formula are stated with'. The BSD formula needs Reg_BSD, which is 2^r times the regulator built from that height's halved pairing. Heights over K versus absolute heights differ by [K:ℚ]; Tau Ceti's naïve height is the Mathlib height of the supplied AdmissibleAbsValues instance, and no number-field instance exists at the pin, so that factor is not yet fixed.

Hypotheses: None.

Proof or construction:

1. The Tau Ceti side is read off the definitions of canonicalHeight, neronTatePairing and regulator (GZ.0/x-height-canonical-height, GZ.0/bsd-height-pairing, GZ.0/bsd-regulator).
2. The other side is Müller–Stoll's §3 and Remark 3.1 together with the LMFDB values for 37.a1, where Ω·ĥ_x((0,0)) = L′(E,1) to 30 digits.

Acceptance:

- No consumer infers a factor of 2 from the name 'Néron–Tate': every formula states which of canonicalHeight, xCanonicalHeight, neronTatePairing or bsdHeightPairing it uses.
- A BSD consumer that uses Tau Ceti's regulator W directly is off by 2^r; in rank 1 this is a factor of 2 in the 2-part of Ш.

Depends on: GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height, GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing, GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator.

Library: `WeierstrassCurve.Affine.Point.naiveHeight`.

Source: muller-stoll-2016, Remark 3.1, p. 4 (arXiv v2); muller-stoll-2016, §3, p. 3 (arXiv v2); lmfdb-2026, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); lmfdb-2026, Knowl ec.canonical_height (accessed 2026-09-28).

### The canonical height on E(K) ⊗ ℚ

Declaration: WeierstrassCurve.Affine.canonicalHeightRat (construction). Node: GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational. Planet: Canonical height on E(K) ⊗ ℚ.

The canonical height extends uniquely to a quadratic form ĥ_ℚ on the ℚ-vector space E(K) ⊗_ℤ ℚ with ĥ_ℚ(P ⊗ q) = q²·ĥ(P); torsion goes to zero. The same holds for ĥ_x and the two pairings. Averages of points, such as a normalised average of a Galois orbit, live here.

Hypotheses: W elliptic.

Proof or construction:

1. ĥ is a ℤ-quadratic map W.Point → ℝ (canonicalHeightQuadratic) and ℝ is a ℚ-vector space; a ℤ-quadratic map into a ℚ-vector space extends uniquely along M → M ⊗ ℚ, because M ⊗ ℚ is the localisation of M at the nonzero integers and ĥ(nP) = n²ĥ(P) forces the value on P ⊗ (1/n).
2. Torsion maps to zero in M ⊗ ℚ, consistently with ĥ vanishing on torsion.

The required uses are:

- GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average: Heights of averages of Galois orbits are computed in E(K) ⊗ ℚ.
- GrossZagierAndArithmeticHeights:GZ.8: Gross–Zagier formulas are identities of pairings on A(K)_ℚ ⊗ A∨(K)_ℚ.
- HeegnerPointEulerSystems:HE.1: Normalised Heegner points with denominators u are points of E(K) ⊗ ℚ.

The API supplies:

- WeierstrassCurve.Affine.canonicalHeightRat (constructor): canonicalHeightRat W : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ.
- WeierstrassCurve.Affine.canonicalHeightRat_tmul (simp): canonicalHeightRat W (P ⊗ₜ q) = q^2 * P.canonicalHeight.
- WeierstrassCurve.Affine.canonicalHeightRat_unique (universal-property): It is the unique ℚ-quadratic map agreeing with canonicalHeight on P ⊗ₜ 1.
- WeierstrassCurve.Affine.canonicalHeightRat_nonneg (other): canonicalHeightRat W x ≥ 0.

Discriminating tests:

- WeierstrassCurve.Affine.canonicalHeightRat_inv_nat (value): canonicalHeightRat W (P ⊗ₜ (1/m : ℚ)) = P.canonicalHeight / m^2.
- WeierstrassCurve.Affine.canonicalHeightRat_torsion (degenerate): For torsion P, canonicalHeightRat W (P ⊗ₜ 1) = 0.
- WeierstrassCurve.Affine.canonicalHeightRat_one (comparison): canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight.
- WeierstrassCurve.Affine.canonicalHeightRat_not_linear (non-example): canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight for P of infinite order: the extension is quadratic, not linear.

Acceptance:

- ĥ_ℚ(P ⊗ (1/m)) = ĥ(P)/m².

Library: `WeierstrassCurve.Affine.canonicalHeightQuadratic`, `WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `QuadraticMap`, `TensorProduct`, `QuadraticMap.map_smul`.

Source: cai-shu-tian-2014, §1, after Theorem 1.1, p. 2 (arXiv v2).

### Trace versus normalised average of a Galois orbit

Declaration: WeierstrassCurve.Affine.canonicalHeightRat_average (lemma). Node: GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average.

Let H/K be a finite Galois extension of degree h and P ∈ E(H). The trace Tr(P) = Σ_{σ ∈ Gal(H/K)} σP lies in E(K), and the normalised average Av(P) = (1/h)·Tr(P) lies in E(K) ⊗ ℚ. Then ĥ_ℚ(Av(P)) = ĥ(Tr P)/h², and the same factor relates any pairing of averages to the pairing of traces. A formula written with averages and one written with traces differ by h² in every height.

Hypotheses: H/K Galois of degree h; the heights over H and over K are compared by the same normalisation.

Proof or construction:

1. Av(P) = Tr(P) ⊗ (1/h), and GZ.0/canonical-height-rational gives the factor (1/h)².

Acceptance:

- Cai–Shu–Tian take the trace P_K(f) = Tr_{H_K/K} f(P) ∈ E(K); an average-based statement of the same formula carries h_K² in its constant.

Depends on: GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational.

Library: `IsGalois`.

Source: cai-shu-tian-2014, §1, after Theorem 1.1, p. 2 (arXiv v2).

### The motivic centre s = 1 and the unitary centre s = 1/2

Declaration: TauCeti.GrossZagier.deriv_completed_at_one_of_eq_zero (lemma). Node: GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres.

Let L(E, s) be the motivic L-function of an elliptic curve over ℚ of conductor N (centre s = 1), L(s, π_E) := L(E, s + 1/2) its unitary normalisation (centre s = 1/2), and Λ(E, s) := N^{s/2}·Γ_ℂ(s)·L(E, s) the completed function with Mathlib's Γ_ℂ(s) = 2(2π)^{−s}Γ(s). If L(E, ·) is differentiable at 1 and L(E, 1) = 0, then (d/ds)L(s, π_E) at s = 1/2 equals L′(E, 1), and Λ′(E, 1) = N^{1/2}·π^{−1}·L′(E, 1). With the other common convention Λ = N^{s/2}(2π)^{−s}Γ(s)L, the factor is N^{1/2}(2π)^{−1}.

Hypotheses: L(E, ·) differentiable at 1 with L(E, 1) = 0 (the case of odd analytic rank).

Proof or construction:

1. The shift s ↦ s + 1/2 has derivative 1.
2. Product rule (deriv_mul) at a zero of L: (G·L)′(1) = G(1)·L′(1) + G′(1)·L(1) = G(1)·L′(1).
3. G(1) = N^{1/2}·Γ_ℂ(1) = N^{1/2}·2(2π)^{−1}Γ(1) = N^{1/2}/π (Complex.Gammaℂ_def, Complex.Gamma_one).

Acceptance:

- The factor 2 between Γ_ℂ and (2π)^{−s}Γ(s) is a convention and must be written, not absorbed.
- Cai–Shu–Tian write L_v(s, A, M) = L(s − 1/2, π_v) at finite places, and the complete L(s, π_A) includes the archimedean factors.

Library: `Complex.Gammaℂ`, `Complex.Gammaℂ_def`, `Complex.Gamma_one`, `deriv_mul`, `HasDerivAt.mul`.

Source: cai-shu-tian-2014, §1.2, p. 4 (arXiv v2).

### The unit index u

Declaration: TauCeti.GrossZagier.unitIndex (definition). Node: GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index.

For an imaginary quadratic field K, u(K) = [O_K^× : ℤ^×] = #μ(K)/2, the number that appears squared in the Gross–Zagier constant. In Mathlib terms, u(K) = NumberField.Units.torsionOrder K / 2. So u(K) = 1 except u(ℚ(√−1)) = 2 and u(ℚ(√−3)) = 3.

Hypotheses: K imaginary quadratic.

Proof or construction:

1. O_K^× is finite for K imaginary quadratic, so it equals its torsion μ(K), and ℤ^× = {±1} has index #μ(K)/2.

The required uses are:

- GrossZagierAndArithmeticHeights:GZ.8: The explicit Gross–Zagier constant has u² in the denominator.
- HeegnerPointEulerSystems:HE.1: Heegner points over K are normalised by 1/u.

The API supplies:

- TauCeti.GrossZagier.unitIndex (constructor): unitIndex K := NumberField.Units.torsionOrder K / 2 for K imaginary quadratic.
- TauCeti.GrossZagier.two_mul_unitIndex (characterisation): 2 * unitIndex K = torsionOrder K.
- TauCeti.GrossZagier.unitIndex_eq_one_iff (characterisation): unitIndex K = 1 ↔ K ≠ ℚ(√−1), ℚ(√−3).

Discriminating tests:

- TauCeti.GrossZagier.unitIndex_gaussian (value): unitIndex ℚ(√−1) = 2.
- TauCeti.GrossZagier.unitIndex_eisenstein (value): unitIndex ℚ(√−3) = 3.
- TauCeti.GrossZagier.unitIndex_sqrt_neg_seven (degenerate): unitIndex ℚ(√−7) = 1.
- TauCeti.GrossZagier.unitIndex_ne_torsionOrder (non-example): unitIndex K ≠ torsionOrder K for every K: Conrad's p. 69 u_x is twice the Gross–Zagier u.

Acceptance:

- Conrad's §1 defines u_x as #μ(K) itself, but his §9 uses u_x ∈ {1, 2, 3}; the Gross–Zagier constant needs #μ(K)/2 (GrossZagierAndArithmeticHeights/E1).

Library: `NumberField.Units.torsionOrder`.

Source: cai-shu-tian-2014, §1, Theorem 1.1, p. 2 (arXiv v2); conrad-2004, §1, 'Some conventions', p. 69; corrected in GrossZagierAndArithmeticHeights/E1.

### The Artin-map convention and the Galois action on Heegner points

Declaration: TauCeti.GrossZagier.artinConvention (comparison). Node: GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention.

The Gross–Zagier and Conrad convention sends uniformisers to arithmetic Frobenius elements. The opposite (geometric) convention is its composite with inversion on Gal(H/K). Under the arithmetic convention [a] ∈ Cl_K acts on the Heegner point ([b], n) by ([b][a]⁻¹, n). Every formula indexed by class-group characters χ changes χ to χ⁻¹ when the convention changes; a Gross–Zagier formula pairs χ with χ⁻¹ and is therefore stated together with its convention.

Hypotheses: K imaginary quadratic with Hilbert class field H.

Proof or construction:

1. The two reciprocity maps Cl_K → Gal(H/K) differ by inversion, by definition.
2. The action on Heegner points is Conrad's statement, p. 69, which he derives from the analytic description C/b → C/n⁻¹b.

Acceptance:

- A reciprocity law stated without its convention is not accepted.

Library: `IsGalois`.

Source: conrad-2004, §1, 'Some conventions', p. 69; conrad-2004, §1, 'Some conventions', p. 69.

### Full real period, identity-component period and c∞

Declaration: TauCeti.GrossZagier.realPeriod_eq_card_components_mul (comparison). Node: GrossZagierAndArithmeticHeights:GZ.0/real-period-components.

For E/ℚ with a minimal Weierstrass equation and Néron differential ω, let Ω⁰ be the least positive real period (∫ of |ω| over the identity component E(ℝ)⁰) and c∞ = #π₀(E(ℝ)), which is 2 if Δ > 0 and 1 if Δ < 0. The BSD real period is Ω = c∞·Ω⁰ = ∫_{E(ℝ)}|ω|, and it is what EllipticCurves Layer 7's integral 2∫_{D_W > 0} dx/√D_W computes. A formula stated with Ω⁰ must carry c∞ separately, and a formula stated with Ω must not multiply by c∞ again.

Hypotheses: E/ℚ; minimal model; Δ ≠ 0.

Proof or construction:

1. E(ℝ) has two components exactly when the cubic 4x³ + b₂x² + 2b₄x + b₆ has three real roots, i.e. Δ > 0.
2. The integral over E(ℝ) is the sum over its components, which have equal ∫|ω| because translation by a point of the non-identity component preserves |ω|.

Acceptance:

- 37.a1 has Δ = 37 > 0, so c∞ = 2, and the LMFDB real period 5.9869172924… is the full period Ω = 2Ω⁰.

Library: `WeierstrassCurve.Δ`, `WeierstrassCurve.b₂`, `Real.sqrt`, `MeasureTheory.lintegral`.

Source: lmfdb-2026, Knowl ec.q.real_period (accessed 2026-09-28).

## Requests, gaps and source issues

- **Request to tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4.** State the arithmetic BSD quotient Ω(E)·Reg·#Ш·∏c_p/#E(K)²_tors with the BSD regulator Reg_BSD = 2^r · regulator W (GZ.0/bsd-regulator), or with a regulator built from the polar form of canonicalHeight. At f790474 the implemented canonicalHeight carries the factor 1/2 and regulator is the Gram determinant of the halved pairing, so it is 2^{−r}·Reg_BSD (37.a1: 0.02556 against LMFDB 0.05111). Layer 6's text pins ĥ = lim h(x(nP))/n², which is twice the implemented one. The same Layer 7 supplies the full real period Ω = 2∫_{D_W>0} dx/√D_W that GZ.0/real-period-components compares with c∞·Ω⁰.
- **Gap: The [K:ℚ] normalisation of heights over number fields.** Tau Ceti's naïve height is Mathlib's logHeight for whatever Height.AdmissibleAbsValues instance is supplied, and neither library has an instance for number fields (Mathlib's Height/Basic.lean lists it as a TODO). Whether ĥ over K is the height over K (as in Cai–Shu–Tian's ĥ_K) or the absolute height (the LMFDB's base-change-invariant ĥ/[K:ℚ]) is therefore not yet fixed; the factor is [K:ℚ], and [K:ℚ]^r on regulators.
- **Gap: The Poincaré-biextension pairing against ⟨,⟩_BSD.** Cai–Shu–Tian's pairing A(K̄)_ℚ ⊗ A∨(K̄)_ℚ → ℝ, restricted to an elliptic curve through the principal polarisation P ↦ [P] − [O], should be ⟨,⟩_BSD (with the height over K). That comparison needs GZ.1's Poincaré construction, which this checkpoint does not plan.
- **GrossZagierAndArithmeticHeights/E1** (misprint, §1, 'Some conventions', p. 69 (SLMath PDF p. 4); against §9, p. 119 (PDF p. 54)). Printed: If x is a Heegner point with associated CM field K, we will write ux to denote the cardinality of the group of roots of unity in K (so ux = 2 unless K = Q(√−1) or K = Q(√−3)). Correction: u_x is half that cardinality (u_x = 1 unless K = Q(√−1), Q(√−3), where it is 2, 3), as p. 119 uses it and as in Gross–Zagier's u = #O_K^×/2. On p. 119 the same symbol appears in 'The group AutF(x) … has order 2ux with ux ∈ {1, 2, 3}'. Aut_F(x) is the unit group of the CM order, of order #μ(K) ∈ {2, 4, 6}, so there u_x = #μ(K)/2. The two uses differ by a factor of 2, which becomes 4 in any formula with u_x².

## Coverage

- GrossZagierAndArithmeticHeights:GZ.0: partial. Haar-measure and torus-volume normalisations (the global volume 2L(1, η) of the torus measure) and the comparison maps for differentials, polarisations and coefficient embeddings, from AutomorphicLFunctionsAndLocalFactors AL.0–AL.3. The [K:ℚ] height normalisation (gap) and the Poincaré-pairing comparison (gap). Isogenies: ĥ_{E′}(φP) = deg φ·ĥ_E(P) and the change of Néron differential φ*ω′ = c·ω, from EllipticCurves Layers 6–7.
- GrossZagierAndArithmeticHeights:GZ.1: not_read. Point heights on abelian varieties from ArakelovGeometryAndAbelianHeights R35.1–R35.2 and the Poincaré biextension pairing.
- GrossZagierAndArithmeticHeights:GZ.2: not_read. Admissible pairings on arithmetic surfaces (Zhang; Hriljac).
- GrossZagierAndArithmeticHeights:GZ.3: not_read. Rational automorphic realisations and modular degrees.
- GrossZagierAndArithmeticHeights:GZ.4: not_read. Local toric multiplicity one, the dichotomy and test vectors (Tunnell, Saito; YZZ Ch. 1).
- GrossZagierAndArithmeticHeights:GZ.5: not_read. Coherent theta kernels and the Waldspurger formula (YZZ Ch. 2–4).
- GrossZagierAndArithmeticHeights:GZ.6: not_read. Arithmetic generating series and incoherent analytic kernels (YZZ Ch. 5–6).
- GrossZagierAndArithmeticHeights:GZ.7: not_read. Local arithmetic identities and boundary contributions (YZZ Ch. 7–8; Gross–Zagier Ch. III).

## Sources

- J. Steffen Müller and Michael Stoll, *Computing canonical heights on elliptic curves in quasi-linear time*, arXiv:1509.08748v2 (22 Dec 2015); published in LMS J. Comput. Math. 19 (2016); accessed 2026-09-28. https://arxiv.org/abs/1509.08748v2 (SHA-256 10576e85c77e…). Read: §1 Introduction and §3 Heights, through Remark 3.1 (pp. 1–4).
- The LMFDB Collaboration, *The L-functions and modular forms database*, Web pages read 2026-09-28: elliptic curve 37.a1, and the knowls ec.canonical_height and ec.q.real_period. https://www.lmfdb.org/EllipticCurve/Q/37/a/1. Read: Curve 37.a1: regulator, real period, L′(E,1), Tamagawa product, torsion, analytic Ш, height of (0,0) and the BSD check; knowl ec.canonical_height; knowl ec.q.real_period.
- Li Cai, Jie Shu and Ye Tian, *Explicit Gross–Zagier and Waldspurger formulae*, arXiv:1408.1733v2 (Nov 2014); published in Algebra & Number Theory 8 (2014) 2523–2572; accessed 2026-09-28. https://arxiv.org/abs/1408.1733v2 (SHA-256 8d908543404a…). Read: §1: Theorem 1.1 and the BSD comparison after it (pp. 1–2), and §1.2 on L(s, π_A) and L_v(s, A, M) (pp. 4–5).
- Brian Conrad (with an appendix by W. R. Mann), *Gross–Zagier revisited*, Heegner Points and Rankin L-Series, MSRI Publications 49 (2004) 67–163; SLMath library PDF; printed page = PDF page + 65; accessed 2026-09-28. https://library.slmath.org/books/Book49/files/05conrad.pdf (SHA-256 31396cc7f513…). Read: §1 Introduction and 'Some conventions' (pp. 67–70); §9 (p. 119), the paragraph on Aut_F(x).
