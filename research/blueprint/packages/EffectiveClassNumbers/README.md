# Roadmap: effective lower bounds for class numbers of imaginary quadratic fields

**Summary.** Goldfeld's analytic principle, made quantitative by Oesterlé and fed with the two rank-three elliptic curves of Gross–Zagier and Buhler–Gross–Zagier, gives an effective lower bound for the class number h(K) of an imaginary quadratic field K in terms of log|disc K|; with the exclusion computations of Montgomery–Weinberger and Lehmer–Lehmer–Shanks it determines the sixteen fields of class number three.

This roadmap builds the effective solution of Gauss's class number problem for imaginary quadratic fields, in the form proved by Goldfeld, Gross–Zagier and Oesterlé. It starts from the class group, the discriminant and genus theory of an imaginary quadratic field as Mathlib and Tau Ceti provide them, and from the modularity, L-function, Gross–Zagier and Diophantine-methods roadmaps named below. Its end theorems are: the effective technical theorem of Oesterlé, which turns an L-function with a central zero of order three into a uniform lower bound for h(K) (§1.8); the two elliptic curves of conductors 37·139² and 5077 whose analytic and arithmetic ranks are both three (§2.12, §2.13); the uniform bounds θ(d)·log d ≤ 7000·h(K) for every K and θ(d)·log d ≤ 55·h(K) for discriminants prime to 5077 (§3.6, §3.7); the effective bound h(K) > κ(q)(log|disc K|)^(1−q) with an explicit rational κ(q) for every rational q > 0, and the resulting computable cutoff for every fixed class number (§4.7, §4.8); and the list of the sixteen imaginary quadratic fields of class number three, the largest being ℚ(√−907) (§5.8).

`README.md` is normative. `Suggested.lean` records the definitions and theorem signatures that can be stated against the pinned libraries, together with the `example` checks named below; it is not exhaustive, and its docstrings cite the subsections of this file as §k.n. All new declarations live under the namespace `TauCetiRoadmap.EffectiveClassNumbers` in the suggested file; the names given in each subsection are the proposed ones. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source, and the earlier statements or library declarations it rests on. Numbers taken from the historical computations (zeros of L-functions, least primes with a prescribed character pattern, the constants 7000 and 55) are never assumed: each is stated here as a theorem, an explicit inequality or equality between explicitly defined numbers, whose proof is a finite computation. The roadmap states these theorems; the data and formats of the computations that prove them are not targets. Nothing here is optional.

## Scope and ownership

The roadmap owns:

- the arithmetic of imaginary quadratic fields that the argument needs beyond the libraries: the bridge from a quadratic field to a squarefree radicand and its fundamental discriminant, the class number as a count of Tau Ceti's reduced forms, the ramified-prime weight θ(d), the split-prime obstruction p^h ≥ d/4 and the agreement of the quadratic character with Liouville's function below it, Oesterlé's reduced-form decomposition of ζ_K(s)/ζ(2s) and the integrated lattice-point estimate for its nonaxial part (Layer 0);
- Goldfeld's analytic principle in Oesterlé's quantitative form: the degree-four completion, the positive inverse Mellin kernels, the positive-measure comparison, the fundamental contour identity, the truncated residue, the three remainder estimates and the uniform technical theorem under Oesterlé's conditions C1–C4 (Layer 1);
- the two rank-three curves E₁₃₉ and E₅₀₇₇ with their models, local data, Mordell–Weil ranks, the Buhler–Gross–Zagier kernels with explicit remainder bounds and the explicit values of the central derivatives, the Heegner height-gap argument, the modular unit (η(z)/η(37z))² on X₀(37) and the vanishing of the conductor-37 Heegner trace over ℚ(√−139) (Layer 2);
- the symmetric-square factorization of the Liouville product attached to a weight-two newform, Goldfeld's modular analytic systems with every ramified twist correction, the explicit evaluation of Oesterlé's constant for the two curves, the two uniform logarithmic bounds and the exclusion of the discriminant −5077 (Layer 3);
- the explicit prime-product majorants, the asymptotics of prime sums over the first primes, the rational witness κ(q), the effective logarithmic class-number theorem, the computable cutoff for a fixed class number and its comparison with Siegel's ineffective bound (Layer 4);
- the class number three problem: reduction to prime discriminants, the Hardy functions of odd real characters with Stirling's remainder, the three Montgomery–Weinberger zeros and the phase exclusion, the least primes with a prescribed quadratic-character pattern, the Lehmer–Lehmer–Shanks small-range exclusion and the final enumeration (Layer 5).

It leaves to named roadmaps:

- the binary-form / ideal-class dictionary for quadratic orders, reduction of definite forms and the finite list of reduced forms to TauCetiRoadmap **IntegralLattices**, Layer B (milestones B1, B2, B5); §0.2 adds only the maximal-order comparison with Mathlib's `ClassGroup (𝓞 K)`, Gauss reduction itself being in the current Tau Ceti library;
- the primitive quadratic character χ_d of a quadratic field with its Kronecker value at 2 to TauCetiRoadmap **GlobalNumberFields**, Layer 10;
- local reduction types, Tate's algorithm and minimal models, quadratic twists, Mordell–Weil, explicit two-descent, canonical heights and the reduction bound on torsion to TauCetiRoadmap **EllipticCurves**, Layers 4, 5 and 6;
- Dedekind's η, Δ = η²⁴ and the Ligozat criterion for η-quotients to TauCetiRoadmap **ModularForms** (worked examples), and the modular curve X₀(N) over ℚ to TauCetiRoadmap **ModularCurves**, Layer 8;
- the residue theorem for null-homologous cycles to the Completed **ContourIntegration** roadmap;
- Siegel's theorem, the class-number value L(1,χ_D) = πh/(u√d) and explicit prime-count bounds to **AnalyticNumberTheoryPartI** (§0.5, §0.9, §2.15, §2.18);
- Rankin–Selberg theory for GL₂ × GL₂ (global poles, functional equation and vertical-strip bounds) to **AutomorphicLFunctionsAndLocalFactors**, AL.3;
- the newform attached to an elliptic curve over ℚ, the equality of conductor and level, every bad Euler factor, the modular parametrisation and the entire continuation of L(E,s) with its functional equation to **EllipticCurveModularity**, R29.3–R29.6;
- the analytic rank, root-number parity and the L-series, local factors and root numbers of quadratic twists to **RankZeroOneBSD**, Layer 0;
- the Gross–Zagier formula on X₀(N), the Heegner height formula on an elliptic curve, the Petersson norm and the dictionary of height normalizations to **GrossZagierAndArithmeticHeights**, Layers 0 and 8;
- the enumeration of rational points of bounded naive height, the local images of the two-descent map, the descent rank bound, Cremona's height-difference bound, canonical heights computed by doubling, independence and regulator bounds from heights, lower bounds for the canonical height by a complete search, saturation, torsion and Mordell–Weil bases to **EffectiveDiophantineMethods**, Layers 0 and 3.

Already stated or built elsewhere, and therefore cited rather than stated here:

- The class number `NumberField.classNumber K`, the discriminant `NumberField.discr K`, the Dedekind zeta function `NumberField.dedekindZeta` with its real residue limit `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, Liouville's function `ArithmeticFunction.liouville`, Mellin transforms `mellin` and `mellinInv` with `mellinInv_mellin_eq`, `analyticOrderAt` and `analyticOrderNatAt`, the Dirichlet L-function `DirichletCharacter.LFunction` with its nonvanishing on Re s ≥ 1, Legendre and Kronecker symbols `legendreSym` and `ZMod.χ₈`, `Nat.nth Nat.Prime` with `Nat.add_two_le_nth_prime`, the Weierstrass curve carrier with its affine equation and point group, its formal L-function `WeierstrassCurve.LFunction` (an arithmetic function whose Euler factor at a prime of additive, split or nonsplit multiplicative reduction is 1, (1−T)⁻¹ or (1+T)⁻¹) and the totalized series `WeierstrassCurve.LSeries`, Dedekind's `ModularForm.eta` and the product formula `ModularForm.discriminant_eq_q_prod` for Δ, and Mathlib's fundamental-discriminant predicate `Int.IsFundamentalDiscr`: all Mathlib.
- Genus theory in the form "for K = ℚ(√d) with d < −1 squarefree, given by an integral generator θ with minimal polynomial X² − d, the number t of ramified primes satisfies t − 1 ≤ 2-rank of the class group": Tau Ceti `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`; together with `NumberField.two_pow_classGroupTwoRank_dvd_classNumber` this gives 2^(t−1) | h. The discriminant of such a field is Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, the fundamental-discriminant predicate is `TauCeti.Multiquadratic.IsFundamentalDiscriminant`, and ramification is divisibility of the discriminant by `NumberField.mem_ramifiedPrimes_iff_dvd_discr`. §0.1 adds only the bridge from an arbitrary imaginary quadratic field to this radicand data and the case K = ℚ(i).
- Integral binary quadratic forms, Gauss reduction and the bijection between reduced forms of discriminant −D and SL₂(ℤ)-classes of positive definite forms: the current Tau Ceti library, `TauCeti.BinaryQuadraticForm`, `TauCeti.IsReducedForm`, `TauCeti.reducedForms`, `TauCeti.BinaryQuadraticForm.orbit_mk_reducedForms_bijective` (`NumberTheory/BinaryQuadraticForm/`); §0.2 adds only primitivity for fundamental discriminants and the comparison with `ClassGroup (𝓞 K)`.
- The residue of a function at a point and the residue theorem for a null-homologous cycle: Tau Ceti `TauCeti.Contour.residue` and `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`.
- Quadratic twists of Weierstrass curves `WeierstrassCurve.quadraticTwistOf`, the free quotient `WeierstrassCurve.Affine.PointModTorsion`, the canonical height `WeierstrassCurve.Affine.Point.canonicalHeight` and entire extensions of L-series `LSeries.HasEntireExtension`: Tau Ceti.
- The qualitative prime number theorem `TauCeti.primeCount_univ_isEquivalent_div_log`, the transfer from boundary data to prime asymptotics `TauCeti.primeNumberTheoremTransfer` and the Wiener–Ikehara theorem `TauCeti.LSeries.wienerIkehara`: Tau Ceti; §4.4 uses them only to read off the n-th prime and the sum of p^(−1/2) over the first primes.

## Conventions

K is a number field of degree two over ℚ with negative discriminant D = `NumberField.discr K`; write d = |D| and h = h(K) = `NumberField.classNumber K`, the order of the ideal class group of the maximal order 𝓞_K (never the class number of a non-maximal order). D is a fundamental discriminant, so d ≥ 3, and d = 3, 4 are the fields ℚ(√−3), ℚ(i) with 6 and 4 roots of unity. The integer −243 is a discriminant of a quadratic order but not fundamental, and −5077 is not a discriminant at all (it is ≡ 3 mod 4). Mathlib's and Tau Ceti's fundamental-discriminant predicates both accept D = 1; every use here carries D < 0 separately.

The quadratic character χ = χ_D is the primitive character of conductor d attached to K, with χ(n) = 0 when gcd(n,d) > 1 and with the Kronecker value at 2 determined by D mod 8 (χ(2) = 1 for D ≡ 1 mod 8, −1 for D ≡ 5 mod 8, 0 for even D). A prime p splits, ramifies or is inert in K according as χ(p) = 1, 0, −1. The Legendre symbol at an odd prime never replaces the value at 2. λ is Liouville's function, λ(p) = −1 for every prime p, completely multiplicative.

Binary quadratic forms q(x,y) = ax² + bxy + cy² are integral and positive definite, with discriminant b² − 4ac = −d (Oesterlé writes 4ac − b² = d). A form is reduced when |b| ≤ a ≤ c, and b ≥ 0 whenever |b| = a or a = c; a reduced form has a ≤ √(d/3) and c ≥ √d/2. Each proper equivalence class of primitive forms of discriminant −d contains exactly one reduced form, so for fundamental −d there are exactly h reduced primitive forms. For a reduced form q, a(q) = a is its first coefficient and N_q(t) = #{(m,n) ∈ ℤ × ℤ_{≥1} : q(m,n) ≤ t} counts its nonaxial values.

t = t(d) is the number of distinct primes dividing d, P(d) is the set of those primes with the largest one removed (empty when t ≤ 1), and θ(d) = ∏_{p ∈ P(d)} (1 − ⌊2√p⌋/(p + 1)), with ⌊·⌋ the floor on nonnegative reals; the factor is 1/3, 1/4, 1/3, 3/8 at p = 2, 3, 5, 7 and at least 1/2 for p ≥ 11. Genus theory gives 2^(t−1) | h; in particular h odd forces t = 1 and θ(d) = 1. p_j = `Nat.nth Nat.Prime j` is the j-th prime counted from p₀ = 2.

L-functions. Complex powers a^s with a > 0 are exp(s log a). An elliptic curve E/ℚ of conductor N has L(E,s) = Σ a_n n^(−s), absolutely convergent on Re s > 3/2, and L(E,s) also denotes its entire continuation; the totalized Mathlib series is never evaluated outside the half-plane of convergence. The completed function is Λ(E,s) = N^(s/2)(2π)^(−s)Γ(s)L(E,s), with Λ(E,2−s) = w_E Λ(E,s) and root number w_E = ±1; the centre is s = 1 (the motivic normalization). The analytic rank is ord_{s=1} L(E,s), a natural number only once L(E,·) is known not to vanish identically; arithmetic rank is the ℤ-rank of E(ℚ)/E(ℚ)_tors. For a newform f of weight two and level N, a_n are its Fourier coefficients and |a_n| ≤ τ(n)√n with τ the divisor-counting function. Euler factors are written in the variable p^(−s).

Heights. ĥ is the Néron–Tate height on E(ℚ) for the divisor 2(O): ĥ(P) = lim_{n→∞} h(x(2ⁿP))/4ⁿ with h(a/b) = log max(|a|,|b|). This is the normalization of the conjecture of Birch and Swinnerton-Dyer, of Buhler–Gross–Zagier's height tables and of GrossZagierAndArithmeticHeights §0.1; the height for the divisor (O) is ĥ/2. Tau Ceti's `WeierstrassCurve.Affine.Point.canonicalHeight` divides the doubling limit by 4ⁿ in its current form, which is ĥ, and by 2·4ⁿ in the pinned library against which `Suggested.lean` and EffectiveDiophantineMethods §§3.12–3.15 are written, which is ĥ/2. Every numerical height bound in this README is stated for ĥ; under the (O) normalization it halves (the gap 1/2 of §2.8 becomes 1/4 in `Suggested.lean`), and bounds imported from EffectiveDiophantineMethods are doubled.

The degree-four completion of Layer 1 is F(s) = d^(s−1) M^s Γ(s)² Ψ(s) G(s), with the reflection s ↦ 2 − s. When ΨG = L(E,s)L(E⊗χ,s) and M = √(N N_χ)/(4π² d), F = Λ(E,s)Λ(E⊗χ,s)/d: the positive factor 1/d does not affect zeros or reflection, but it enters every residue and tail constant. For coefficient series A(s) = Σ α_n n^(−s) and B(s) = Σ β_n n^(−s), "A ≪ B" means |α_n| ≤ β_n for every n (domination of coefficients, not of values).

Effectivity. A constant is effective when it is the output of a stated finite computation on rational data. A theorem with an effective constant states the constant, or states an explicit rational function of rational parameters that computes it; for a real parameter ε the effective statement takes as input a rational q with 0 < q ≤ ε. A numerical value read from a table, or produced by floating-point computation, is never a proof: every numerical input is a theorem of this roadmap, stated as an explicit inequality or equality between rational numbers and explicitly defined real numbers, and the finite computation that proves it is part of its proof, not a separate target.

Standing assumptions shared by several layers: K is imaginary quadratic with d and h as above; when K is varied in a uniform statement, the constant is independent of K and of the class number. Each statement records its own extra hypotheses (d > 4, coprimality with a conductor, a sign of χ at a prime).

## Exact supplier contracts

The library vocabulary is that of Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, against which `Suggested.lean` is elaborated; the current Tau Ceti library additionally supplies the reduced binary forms used in §0.2 (after the pin, so they do not appear in `Suggested.lean`), and changes the height normalization recorded under Conventions. A prerequisite on another roadmap's layer or subsection refers to that statement as written there; where this roadmap needs a sharper or more specific form, the sharpening is a target here and is named in the last column.

### From Mathlib

| Use here | Exact declarations |
|---|---|
| quadratic fields | `NumberField.classNumber`, `NumberField.classNumber_pos`, `NumberField.discr`, `ClassGroup`, `Ideal.absNorm`, `minpoly`, `Algebra.adjoin`, `Int.IsFundamentalDiscr` with `isFundamentalDiscr_iff_squarefree`, `Nat.primeFactors`, `Squarefree` |
| zeta and L-functions | `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re`, `NumberField.dedekindZeta`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `LSeries`, `LSeriesSummable`, `DirichletCharacter`, `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `DirichletCharacter.IsPrimitive`, `legendreSym`, `ZMod.χ₈`, `ArithmeticFunction.liouville`, `ArithmeticFunction.sigma` |
| complex analysis | `Complex.Gamma`, `Complex.cpow`, `Real.rpow`, `mellin`, `mellinInv`, `mellinInv_mellin_eq`, `analyticOrderAt`, `analyticOrderNatAt`, `AnalyticAt`, `AnalyticOnNhd`, `iteratedDeriv`, `Differentiable`, `HasDerivAt`, `MeasureTheory.Measure`, `MeasureTheory.Integrable`, `intervalIntegral`, `ConvexOn`, `AntitoneOn` |
| primes | `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Nat.add_two_le_nth_prime`, `Nat.primeCounting`, `Real.exp_bound`, `Real.pi_gt_d20`, `Real.pi_lt_d20` |
| elliptic curves | `WeierstrassCurve` with `a₁ … a₆`, `Δ`, `c₄`, `IsElliptic`, `toAffine`, `Affine.Equation`, `Affine.Point` and its group law, `WeierstrassCurve.LFunction` (formal Dirichlet series with the Euler factors 1 − a_pT + pT², 1 − T, 1 + T, 1 at good, split, nonsplit and additive primes), `WeierstrassCurve.LSeries` |
| modular forms | `ModularForm.eta` (η(z) = q^(1/24)∏(1 − qⁿ)), `ModularForm.discriminant_eq_q_prod` (Δ = q∏(1 − qⁿ)²⁴), `ModularForm.discriminant_ne_zero`, `UpperHalfPlane`, `CongruenceSubgroup.Gamma0` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| genus theory and discriminants (`NumberTheory/Multiquadratic/`) | `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank` (hypotheses: θ ∈ 𝓞_K with `minpoly ℤ θ = X² − C d`, `Algebra.adjoin ℚ {θ} = ⊤`, d squarefree, d < −1), `NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant` (same radicand hypotheses), `TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `TauCeti.Multiquadratic.exists_sq_sub_fundamentalDiscriminant_mul_sq_eq_four_mul_norm`, `NumberField.mem_ramifiedPrimes_iff_dvd_discr` |
| contour integration (`Analysis/Contour/`) | `TauCeti.Contour.residue`, `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (an open set, a finite singular set, meromorphic germs there, a cycle avoiding them and null-homologous in the set) |
| elliptic curves (`AlgebraicGeometry/EllipticCurve/`) | `WeierstrassCurve.quadraticTwistOf` with its coefficient simp lemmas, `WeierstrassCurve.Affine.PointModTorsion`, `WeierstrassCurve.Affine.Point.canonicalHeight` with `canonicalHeight_zero` and `canonicalHeight_neg`, the regulator of `MordellWeil/Regulator.lean` |
| L-series | `LSeries.HasEntireExtension` (a differentiable extension agreeing on a right half-plane, unique) |
| binary quadratic forms (current library, `NumberTheory/BinaryQuadraticForm/`) | `TauCeti.BinaryQuadraticForm ℤ` with `discrim` and the SL₂(ℤ) action, `TauCeti.IsReducedForm`, `TauCeti.reducedForms` with `mem_reducedForms`, `exists_smul_isReducedForm`, `orbit_mk_injOn_isReducedForm`, `orbit_mk_reducedForms_bijective` |
| primes | `TauCeti.primeCount_univ_isEquivalent_div_log`, `TauCeti.primeNumberTheoremTransfer`, `TauCeti.LSeries.wienerIkehara` |

### From TauCetiRoadmap.IntegralLattices, Layer B

B1 attaches to a binary lattice its quadratic order, B2 identifies proper classes of primitive forms of discriminant Δ with the Picard group of the order 𝒪_Δ through the Global Number Fields order API (`NumberFieldOrder.mkPic`), and B5 proves that for Δ < 0 every class contains a form with |b| ≤ a ≤ c and that the classes form an explicit finite list (realized for Δ < 0 by Tau Ceti's `TauCeti.reducedForms`). These are consumed as stated. §0.2 adds what this roadmap needs on top of them for fundamental Δ < 0: the identification of Pic 𝒪_Δ with `ClassGroup (𝓞 K)` and the resulting count of `NumberField.classNumber K` by reduced forms. (B1 records that `ClassGroup (𝓞 K)` is the wrong carrier for a non-maximal order; for the maximal order the comparison is exactly what §0.2 states.) [IntegralLattices, Layer B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralLattices#layer-b-binary-lattices-and-quadratic-orders).

### From TauCetiRoadmap.GlobalNumberFields, Layer 10

The primitive quadratic character χ_d of ℚ(√d) for squarefree d ≠ 1, of conductor |D(d)| with D(d) = d or 4d, with χ_d(n) the Kronecker symbol (D(d)/n) including its value at 2, and its primitivity and parity. [GlobalNumberFields, Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic). This roadmap uses it for χ_D with D = disc K < 0 and, in Layer 5, for χ_{−k} with k = 17923, 115147, 123204.

### From TauCetiRoadmap.EllipticCurves, Layers 4, 5 and 6

Layer 4: minimal models over a discrete valuation ring, the reduction types (good, split and nonsplit multiplicative, additive) and Tate's algorithm with its correctness theorems, including invariance under integral changes of variables, the split/nonsplit test and the algorithmic (Ogg) conductor exponent. Layer 5: quadratic twists. Layer 6: the weak Mordell–Weil theorem, the explicit two-descent in the square classes of the étale algebra ℚ[X]/(f) with the resulting Mordell–Weil rank bound, canonical heights and the injection of rational torsion into the reduction at a good odd prime. [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii). The identification of the Ogg exponent with the conductor of the Galois representation is EllipticCurveModularity R29.4's, below.

### From TauCetiRoadmap.ModularForms and TauCetiRoadmap.ModularCurves

ModularForms supplies η, its transformation law under SL₂(ℤ), Δ = η²⁴ and the Ligozat criterion for an η-quotient ∏ η(δz)^(r_δ) to be a modular function on Γ₀(N), as worked examples ([ModularForms, worked examples](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#worked-examples-acceptance-criteria-keeping-the-theory-honest)). ModularCurves, Layer 8, supplies the modular curve X₀(N) over ℚ with its cusps ∞ and 0. §2.9 uses both for the single η-quotient (η(z)/η(37z))².

### From the Completed ContourIntegration roadmap

The residue theorem for a null-homologous cycle and the Cauchy theorem on rectangles ([ContourIntegration, Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ContourIntegration#layer-2-residues-the-cauchy-primitive-and-the-classical-residue-theorem)), as implemented by the Tau Ceti declarations above. §§1.5–1.6 add only rectangle adapters and limits of horizontal sides.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

| Use here | Statement consumed |
|---|---|
| §4.4 | [§0.5](../AnalyticNumberTheoryPartI/README.md#s0-5), the Rosser–Schoenfeld bounds (x/log x)(1 + 1/(2 log x)) < π(x) < (x/log x)(1 + 3/(2 log x)) for x ≥ 59 |
| §4.9 | [§0.9](../AnalyticNumberTheoryPartI/README.md#s0-9), Siegel's theorem L(1,χ_D) ≥ c(ε)|D|^(−ε) with an ineffective c(ε), and [§2.15](../AnalyticNumberTheoryPartI/README.md#s2-15), h(D) ≥ c_ε|D|^(1/2−ε) for negative fundamental D |
| §4.9, §5.1 | [§2.18](../AnalyticNumberTheoryPartI/README.md#s2-18), L(1,χ_D) = πh/(u√d) with u half the number of roots of unity |

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors, AL.3

For unitary cuspidal automorphic representations π, π′ of GL₂: the completed Rankin–Selberg function Λ(s, π × π′∨) is meromorphic with at most simple poles at s = 0, 1, a pole at 1 exactly when π ≅ π′ ([`rs-global-poles`](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-poles)); its functional equation ([`rs-global-functional-equation`](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-functional-equation)); boundedness on vertical strips away from the poles ([`rs-vertical-strip-bounds`](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-vertical-strip-bounds)); nonvanishing on the boundary line ([`rs-boundary-nonvanishing`](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-boundary-nonvanishing)); and the local factor at a good place twisted by a ramified character ([`local-conductor-test-vector-comparison`](../AutomorphicLFunctionsAndLocalFactors/README.md#local-conductor-test-vector-comparison)). §3.1 specializes these to π = π′ = π_f for a weight-two newform f and states the symmetric-square factorization with every bad factor; the specialization is a target here.

### From TauCetiRoadmap.EllipticCurveModularity, R29.3–R29.6

For an elliptic curve E/ℚ: the normalized rational newform F_E of weight two attached to E (R29.3); equality of its level with the conductor N_E and, for every prime ℓ, equality of Mathlib's local polynomial of E with that of F_E, so that the formal L-functions coincide at good and bad primes (R29.4, "The level is the conductor" and "The bad factors and all Dirichlet coefficients"); the modular parametrisation φ_E : X₀(N_E) → E with φ_E(∞) = O, through the quotient of J₀(N_E) attached to F_E and a chosen isogeny (R29.5, "Isogeny from the modular quotient" and "The morphism from X₀ at the conductor"); and the entire continuation of Λ(E,s) with Λ(E,2−s) = w_E Λ(E,s), agreeing with the Dirichlet series on Re s > 3/2 (R29.6, "Continuation and the functional equation"). [EllipticCurveModularity](../EllipticCurveModularity/README.md). This roadmap writes L(E,s) for that entire function.

### From TauCetiRoadmap.RankZeroOneBSD, Layer 0

The analytic rank analyticOrderNatAt (L(E,·)) 1 with its finiteness (§0.2); root-number parity (−1)^(analytic rank) = w_E (§0.5); the local factors of a quadratic twist P_ℓ(E^K,T) = P_ℓ(E,χ(ℓ)T) (§0.6); for a quadratic field K of discriminant D_K prime to N_E, conductor N_E·D_K² and coefficients a_n(E^K) = χ_K(n)a_n(E) (§0.7); and the root number of a quadratic twist, w(E^K) = χ_K(−N_E)·w_E (§0.10). [RankZeroOneBSD](../RankZeroOneBSD/README.md). The twists with D_K not prime to N_E that Layer 3 needs are treated in §3.3.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights, Layers 0 and 8

The dictionary of height normalizations ([§0.1](../GrossZagierAndArithmeticHeights/README.md#target-height-convention-dictionary)); the Petersson norm (φ,φ)_{Γ₀(N)} and the degree of a modular parametrisation ([§8.4](../GrossZagierAndArithmeticHeights/README.md#target-petersson-norm-and-parametrisation-degree)); the Gross–Zagier formula on X₀(N): for a newform φ of weight two and level N, K imaginary quadratic in which no prime dividing N is inert, Heegner points P_a ∈ X₀(N)(H) attached to the cyclic isogenies ℂ/a → ℂ/a𝔑⁻¹ with H the Hilbert class field, and the trace P_K = Σ_{[a]} (P_a − ∞) ∈ J₀(N)(K), L′(1, φ, K) is a positive multiple of the height of the φ-isotypic part of P_K ([§8.15](../GrossZagierAndArithmeticHeights/README.md#target-classical-gross-zagier-formula)); and its form on an elliptic curve, L′(E/K,1) = L′(E,1)L(E⊗χ_K,1) as a positive multiple of ĥ_K of the trace of f(P) for a modular parametrisation f ([§8.19](../GrossZagierAndArithmeticHeights/README.md#target-elliptic-curve-heegner-height-formula)).

### From TauCetiRoadmap.EffectiveDiophantineMethods, Layers 0 and 3

Enumeration of rational points of bounded naive height (§0.11); the local image of the two-descent map and its completeness test (§§3.2–3.4), the 2-Selmer group and the descent rank upper bound (§§3.5–3.7), Cremona's height-difference bound (§3.12), canonical-height enclosures by doubling (§3.13), independence and regulator lower bounds from heights (§3.14), a lower bound for the canonical height of non-torsion points by a complete search (§3.15), p-saturation from reductions (§§3.17–3.18), torsion (§3.20) and Mordell–Weil bases (§3.22). [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md). §§3.12–3.15 there use the height for (O), half of ĥ. Its interval-arithmetic and enclosure layers are not consumed: the numerical statements here are theorems in their own right.

## How to read the build

The layers are built in the order Layer 0 → 1 → 2 → 3 → 4 → 5, and each `### k.n` subsection lists its statements in dependency order; *Needs:* at the end of a statement names the earlier statements, by subsection or by Lean name, and the library declarations and supplier statements it rests on. Layer 0 delivers the arithmetic of imaginary quadratic fields: radicands and genus divisibility for every such field, the class number as a count of reduced forms, the weight θ(d), the split-prime obstruction and the agreement of χ with λ, and Oesterlé's reduced-form decomposition with its integrated lattice estimate. Layer 1 delivers Goldfeld's principle in Oesterlé's form: a fixed pair (Ψ, M) satisfying C1 and C4 gives a constant C with C·h ≥ min(1, ∏_{p∈P(d)} |G_p(1)|/(1 + 1/p))·log d for every K and every G satisfying C1–C3. Layer 2 delivers the two curves of rank three, each with an arithmetic proof (descent upper bound and independent points) and an analytic one (exact vanishing of L′(1) through a Heegner argument and explicit rational bounds showing L‴(1) ≠ 0). Layer 3 inserts these curves into Layer 1, with every ramified correction and with the explicit evaluation of Oesterlé's constant, and proves the bounds 7000 and 55. Layer 4 converts the weighted bounds into explicit functions of the number t of ramified primes, then into the effective bound h > κ(q)(log d)^(1−q) and a computable cutoff for each class number. Layer 5 solves the class number three problem: the 55 bound gives d < 10⁷², and two complete exclusion computations leave d ≤ 907, where reduced forms are enumerated. Each subsection opens with its references and the declarations it is built on; each definition gives its API as named lemmas and its checks as a **Checks.** list, whose key items are the `example`s of `Suggested.lean`; every layer ends with its examples and its dependencies.

## Layer 0: imaginary quadratic fields, discriminant weights and small split primes

A small class group forces many small primes to be inert. This layer makes that precise in the two forms the analytic argument uses: a split prime p satisfies p^h ≥ d/4, so below (d/4)^(1/h) the character χ agrees with Liouville's λ; and the Dedekind zeta function decomposes over the h reduced forms, with an integrated lattice-point bound for the nonaxial terms. It also supplies the adapters that let Tau Ceti's genus theory and the binary-form dictionary of IntegralLattices be applied to an arbitrary imaginary quadratic field given only as a number field of degree two.

Standing assumptions for this layer: K is a number field with `Module.finrank ℚ K = 2` and `NumberField.discr K < 0`; d = |disc K|, h = `NumberField.classNumber K`, t the number of primes dividing d. No lower bound on d is assumed unless a statement says so; d = 3 and d = 4 are the fields with extra units and are excluded exactly where the statement says d > 4.

<a id="s0-1"></a>

### 0.1 Quadratic fields, radicands and genus divisibility

References: O85 §1.1, p. 311, for the conventions; the genus consequence 2^(t−1) | h is recalled in O85, p. 310, after Theorem 1. Built on Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `NumberField.two_pow_classGroupTwoRank_dvd_classNumber` and `NumberField.mem_ramifiedPrimes_iff_dvd_discr`.

**Radicand of a quadratic field.** Prove `exists_squarefree_radicand`: for every number field K of degree two over ℚ there are a squarefree integer d₀ ∉ {0, 1} and θ ∈ 𝓞_K with `minpoly ℤ θ = X² − C d₀` and `Algebra.adjoin ℚ {(θ : K)} = ⊤`; d₀ is unique, and `NumberField.discr K < 0` if and only if d₀ < 0. Proof: a primitive element α of K over ℚ satisfies a monic quadratic; completing the square gives β with β² ∈ ℚ, β ∉ ℚ; scaling β by a rational number makes β² a squarefree integer d₀, and β is then integral with minimal polynomial X² − d₀; uniqueness holds because two such radicands differ by a rational square factor; the sign follows from Tau Ceti's discriminant formula below. *Needs:* Mathlib `minpoly`, `Algebra.adjoin`, `Squarefree`.

**The discriminant is fundamental.** Prove `discr_eq_fundamentalDiscriminant_radicand`: with d₀ as above, `NumberField.discr K` equals d₀ when d₀ ≡ 1 mod 4 and 4d₀ otherwise; and `isFundamentalDiscriminant_discr`: `NumberField.discr K` satisfies both `TauCeti.Multiquadratic.IsFundamentalDiscriminant` and `Int.IsFundamentalDiscr`, and is different from 1. *Needs:* `exists_squarefree_radicand`, Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, Mathlib `Int.isFundamentalDiscr_iff_squarefree`.

**Genus divisibility for every imaginary quadratic field.** Prove `two_pow_sub_one_dvd_classNumber`: if disc K < 0 then 2^(t−1) divides h, where t = `(NumberField.discr K).natAbs.primeFactors.card`. For d₀ < −1 combine the radicand with Tau Ceti's lower bound t − 1 ≤ 2-rank (whose t is the number of ramified primes, equal to the number of primes dividing disc K by `NumberField.mem_ramifiedPrimes_iff_dvd_discr`) and with the divisibility of h by 2^(2-rank). The remaining field ℚ(i), radicand −1, has t = 1 and the statement is 1 | h. *Needs:* `exists_squarefree_radicand`, Tau Ceti `ncard_ramifiedPrimes_sub_one_le_twoRank`, `NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `NumberField.mem_ramifiedPrimes_iff_dvd_discr`.

**Fields with one ramified prime.** Prove `discr_of_card_primeFactors_eq_one`: if disc K < 0 and t = 1, then disc K ∈ {−4, −8} or disc K = −p for a prime p ≡ 3 mod 4. A negative fundamental discriminant divisible by exactly one prime is −4, −8 (the 4m branch with m = −1, −2) or an odd −p with −p ≡ 1 mod 4. With genus divisibility this gives: h odd implies t = 1. *Needs:* `isFundamentalDiscriminant_discr`, `two_pow_sub_one_dvd_classNumber`.

**Checks.**
- ℚ(√−5): radicand −5, disc −20 (−5 ≡ 3 mod 4), t = 2, so 2 | h; indeed h = 2 (Tau Ceti's computation for −5). A statement with 2^t in place of 2^(t−1) would require 4 | 2 and fails.
- ℚ(i): radicand −1, disc −4, t = 1; the genus statement is the trivial 1 | h, and ℚ(i) is outside the hypothesis d₀ < −1 of Tau Ceti's lower bound, so a proof that only cites that bound is incomplete here.
- ℚ(√−3): θ = √−3 is integral with minimal polynomial X² + 3 although 𝓞_K = ℤ[(1+√−3)/2] ≠ ℤ[θ]; disc K = −3 because −3 ≡ 1 mod 4. A definition of the radicand that demanded 𝓞_K = ℤ[θ] has no witness here.
- Non-examples: −243 = −3⁵ and −5077 ≡ 3 mod 4 fail both fundamental-discriminant predicates, so neither is disc K for any K.

<a id="s0-2"></a>

### 0.2 Reduced forms and the class number

References: O85 §1.2 and §1.3, conditions (i)–(ii), pp. 311–312. Built on the reduced binary forms of the current Tau Ceti library (`TauCeti.NumberTheory.BinaryQuadraticForm.Reduced` and `.Reduction`), on IntegralLattices B1 and B2, and on Mathlib `ClassGroup`.

Tau Ceti already has the carrier and the reduction theory used here: the forms `TauCeti.BinaryQuadraticForm ℤ` with `discrim`, the predicate `TauCeti.IsReducedForm` (|b| ≤ a ≤ c, and 0 ≤ b whenever |b| = a or a = c), the finite set `TauCeti.reducedForms D` of reduced forms of discriminant −D with `mem_reducedForms` (for D ≠ 0, membership is reducedness and discriminant −D, so the search box 1 ≤ a ≤ √(D/3) loses nothing), `exists_smul_isReducedForm` (every positive definite form is SL₂(ℤ)-equivalent to a reduced one), `orbit_mk_injOn_isReducedForm` (two equivalent reduced forms are equal) and `orbit_mk_reducedForms_bijective` (reduced forms biject onto the SL₂(ℤ)-classes of positive definite forms of discriminant −D). These are consumed, never restated. `TauCeti.reducedForms D` contains imprimitive forms when −D is not fundamental (it is the set behind the Hurwitz class number); this roadmap adds only what the class number of a field needs.

**Reduced forms of a fundamental discriminant.** Prove `reducedForms_primitive`: if −d is a fundamental discriminant, every member of `TauCeti.reducedForms d` is primitive, since the square of a common divisor of (a, b, c) divides b² − 4ac = −d. Prove `reducedForm_four_mul_c_sq_ge`: a reduced form of discriminant −d satisfies 4c² ≥ d, and 4c² > d when the form is primitive and d ≠ 4, in particular for every member of `TauCeti.reducedForms d` when −d is fundamental and d ≠ 4 (O85 §1.3, p. 312, states c ≥ √d/2, and c > √d/2 for d ≠ 4, for the forms of a field discriminant). Equality 4c² = d forces c = a and b = 0, the form (a, 0, a) of discriminant −4a², which is primitive only for a = 1. Together with 3a² ≤ d these are the two inequalities §0.6 and §0.7 use. *Needs:* Tau Ceti `TauCeti.mem_reducedForms`.

**Class number as a count of reduced forms.** Prove `classNumber_eq_card_reducedForms`: if disc K = −d < 0 then h(K) = #`TauCeti.reducedForms d`. Proof: for the maximal order 𝒪_{−d} = 𝓞_K every nonzero fractional ideal is invertible, so the Picard group of IntegralLattices B2 is `ClassGroup (𝓞 K)`; B2 identifies it with the proper classes of primitive forms of discriminant −d; by `reducedForms_primitive` all forms of discriminant −d are primitive, and `orbit_mk_reducedForms_bijective` counts their SL₂(ℤ)-classes by reduced forms. *Needs:* `reducedForms_primitive`, `isFundamentalDiscriminant_discr`, Tau Ceti `orbit_mk_reducedForms_bijective`, IntegralLattices B1 and B2.

**Checks.**
- d = 23: the reduced forms are (1,1,6), (2,1,3), (2,−1,3), and h(ℚ(√−23)) = 3.
- d = 20: the reduced forms are (1,0,5) and (2,2,3); (2,−2,3) is excluded by the boundary convention, which is what makes the count 2 = h(ℚ(√−5)) rather than 3.
- d = 907: the reduced forms are (1,1,227), (13,9,19), (13,−9,19); (13,−9,19) is kept because neither |b| = a nor a = c.
- d = 4: the only reduced form is (1,0,1), and 4c² = d there, so the strict inequality 4c² > d needs d ≠ 4.
- Non-example for the strict inequality without primitivity: d = 16 has the reduced forms (1,0,4) and the imprimitive (2,0,2), and (2,0,2) has 4c² = 16 = d; −16 is not a fundamental discriminant.
- Non-example: for the non-fundamental d = 12 the set contains the imprimitive (2,2,2), so `reducedForms_primitive` genuinely needs −d fundamental, and h of the order of discriminant −12 is not #`TauCeti.reducedForms 12`.

<a id="s0-3"></a>

### 0.3 The ramified-prime weight

References: O85, Theorem 1 and the definition of P(d) and θ(d), p. 310, and the values of the factors, p. 311. Built on Mathlib `Nat.primeFactors`, `Real.sqrt` and `Nat.floor`.

**The weight θ.** Define `ramifiedWeight (d : ℕ) : ℝ` as the product, over the distinct prime factors of d with the largest one removed, of 1 − ⌊2√p⌋/(p + 1), where ⌊·⌋ is the natural floor; the product is empty (value 1) for d = 0, 1 and for prime powers. In Lean the removed prime is the maximum of `d.primeFactors`, taken as 0 for the empty set. It is not a product over the primes of a conductor, and prime multiplicities do not enter. Its API is `ramifiedWeight_pos` (0 < θ(d), each factor being at least 1/4), `ramifiedWeight_le_one` (θ(d) ≤ 1), `ramifiedWeight_prime_pow` (θ(p^k) = 1 for p prime and k ≥ 1), `ramifiedWeight_congr_primeFactors` (θ depends only on the set of prime factors), and `ramifiedWeight_eq_one_of_odd_classNumber` (θ(d) = 1 for an imaginary quadratic field of odd class number, by §0.1). *Needs:* `two_pow_sub_one_dvd_classNumber`, `discr_of_card_primeFactors_eq_one`.

**Checks.**
- θ(0) = 1 and θ(907) = 1: the empty product, and a prime.
- θ(15) = 1/4: the primes are 3 and 5, the largest 5 is removed, and 1 − ⌊2√3⌋/4 = 1 − 3/4. Removing the smallest prime instead would give 1 − ⌊2√5⌋/6 = 1/3.
- θ(84) = 1/12: the primes are 2, 3, 7, the largest 7 is removed, and (1 − 2/3)(1 − 3/4) = 1/12. Using the multiplicity of 2 in 84 = 2²·3·7, or keeping 7 (factor 3/8), changes the value.
- The factors at p = 2, 3, 5, 7 are 1/3, 1/4, 1/3, 3/8: they are not monotone in p, so no argument may assume the floor factors decrease (§4.2 compares them with a smooth majorant instead).

<a id="s0-4"></a>

### 0.4 Small split primes

References: O85 §1.4(a), p. 312. Built on Mathlib `NumberField.classNumber` and `Ideal.absNorm`.

**Split-prime size bound.** Prove `splitPrime_size`: if d > 4, p is a prime not dividing d, and some prime ideal of 𝓞_K has norm p (so p splits), then d ≤ 4p^h. Proof: the h-th power of a prime 𝔭 of norm p is principal, generated by (a + b√−d)/2 with integers a ≡ bd mod 2; its norm is p^h = (a² + db²)/4; b ≠ 0 because 𝔭^h is not stable under conjugation (𝔭 and its conjugate are distinct, as p is unramified), so 4p^h ≥ d. For d = 3, 4 the unit group is larger but the same computation applies; the hypothesis d > 4 is kept only because the applications use it. *Needs:* `exists_squarefree_radicand`, `discr_eq_fundamentalDiscriminant_radicand`, Tau Ceti `exists_sq_sub_fundamentalDiscriminant_mul_sq_eq_four_mul_norm`.

**Checks.**
- d = 23, h = 3: 2 splits (−23 ≡ 1 mod 8) and 4·2³ = 32 ≥ 23.
- d = 907, h = 3: every prime p with 4p³ < 907, that is p ≤ 5, must be inert; indeed (−907/2) = −1 (−907 ≡ 5 mod 8), (−907/3) = −1 and (−907/5) = −1.
- The factor 4 cannot be dropped: for d = 7, h = 1, the prime 2 splits (−7 ≡ 1 mod 8) and 4·2 = 8 ≥ 7, but 2 < 7.
- d = 20, h = 2: 3 splits in ℚ(√−5), as 3 = (3, 1+√−5)(3, 1−√−5), and 4·3² = 36 ≥ 20; the exponent is the class number h, not the order of the class of 𝔭 (here also 2).

<a id="s0-5"></a>

### 0.5 Agreement with Liouville's function

References: O85 §1.4, p. 312, and §3.5, p. 318. Built on Mathlib `ArithmeticFunction.liouville` and the character χ_D of GlobalNumberFields, Layer 10.

**Quadratic character and Liouville agreement.** Prove `liouville_agreement`: if d > 4, 1 ≤ n < (d/4)^(1/h) and gcd(n,d) = 1, then χ_D(n) = λ(n). Every prime divisor q of n is below the threshold, cannot split by §0.4 and cannot ramify by coprimality, so χ_D(q) = −1 = λ(q); complete multiplicativity of both functions finishes, including n = 1. The Lean form isolates the arithmetic: a completely multiplicative function with value −1 at every prime factor of n agrees with λ at n. *Needs:* `splitPrime_size`, Mathlib `ArithmeticFunction.liouville`, GlobalNumberFields Layer 10 (χ_D and its values at split, ramified and inert primes).

**Checks.**
- Coprimality is necessary: for a prime p | d, χ_D(p) = 0 while λ(p) = −1.
- d = 907, h = 3: (907/4)^(1/3) ≈ 6.1, so the statement covers n ≤ 6, and χ(4) = 1 = λ(4), χ(6) = 1 = λ(6), χ(5) = −1 = λ(5).

<a id="s0-6"></a>

### 0.6 The reduced-form decomposition of ζ_K(s)/ζ(2s)

References: O85 §1.2, the partial zeta function of a class as w⁻¹ times the Epstein sum of the corresponding form, p. 311; §1.3, formulas (1.3.1) and (1.3.2), p. 312; §1.4(b), p. 312. Built on Mathlib `NumberField.dedekindZeta`, `riemannZeta`, `LSeries`, and §0.2.

**Reduced-form decomposition.** Prove `dedekindZeta_eq_sum_reducedForms`: for d > 4 and Re s > 1,

```text
ζ_K(s) = Σ_{q reduced} ( a(q)^(−s) ζ(2s) + Σ_{m ∈ ℤ, n ≥ 1} q(m,n)^(−s) ),
ζ_K(s)/ζ(2s) = ∏_p (1 + p^(−s))/(1 − χ(p)p^(−s))
             = Σ_{q reduced} ( a(q)^(−s) + Σ_{m ∈ ℤ, n ≥ 1, gcd(m,n) = 1} q(m,n)^(−s) ),
```

the sums running over the h reduced forms of §0.2. The axial terms come from the vectors (m, 0), the nonaxial ones from n ≥ 1, and the factor w = 2 of units is absorbed by the sign symmetry (m,n) ↦ (−m,−n). The Euler product follows from ζ_K = ζ·L(s,χ) and the local identity (1 − p^(−2s))/((1 − p^(−s))(1 − χ(p)p^(−s))) = (1 + p^(−s))/(1 − χ(p)p^(−s)) at unramified p, with the factor (1 + p^(−s)) at ramified p. Its API is `nu_nonneg` (the Dirichlet coefficients ν_n of ζ_K(s)/ζ(2s) are nonnegative integers: ν_n is the number of pairs (q, primitive vector) with value n, plus the axial count), `nu_one` (ν₁ = 1), and `sum_nu_le_classNumber` (for d > 4, Σ_{n ≤ √d/2} ν_n ≤ h, because a primitive nonaxial value of a reduced form is at least c ≥ √d/2 and exceeds it unless d = 4; O85 §1.4(b)). *Needs:* `classNumber_eq_card_reducedForms`, `reducedForm_four_mul_c_sq_ge`, IntegralLattices B2 (the partial zeta function of a class as an Epstein sum), Mathlib `NumberField.dedekindZeta`, GlobalNumberFields Layer 10 (ζ_K = ζ·L(s,χ_D) through the character of K).

**Checks.**
- d = 23: the three reduced forms give ν₁ = 1 (from a = 1), ν₂ = 2 (from the two forms with a = 2), and Σ_{n ≤ √23/2} ν_n = ν₁ + ν₂ = 3 = h: the bound of `sum_nu_le_classNumber` is attained.
- The Euler factor at a ramified prime is 1 + p^(−s), not 1: at d = 23, p = 23 contributes ν₂₃ ≥ 1 from the factor 1 + 23^(−s); a decomposition that dropped ramified factors would miss it.
- Non-example: the full Epstein sums Σ_{(m,n)≠0} q(m,n)^(−s) of §1.2 count each value twice (sign symmetry); the decomposition above uses n ≥ 1 and the half-line of axial vectors, and the factor w is the one that distinguishes d = 3, 4 (w = 6, 4), excluded by d > 4.

<a id="s0-7"></a>

### 0.7 The integrated nonaxial lattice-point estimate

References: O85 §1.3, p. 312 (the count N_q(t), its vanishing below c ≥ √d/2, its asymptotic πt/√d, and the integrated inequality, there attributed to Oesterlé's own work). Built on §0.2 and Mathlib's Lebesgue integral.

**Nonaxial count and its integrated bound.** For a reduced form q of discriminant −d let N_q(t) = #{(m,n) ∈ ℤ × ℤ_{≥1} : q(m,n) ≤ t}. Prove `nonaxialCount_eq_zero` (N_q(t) = 0 for t < c, in particular for t < √d/2), `nonaxialCount_asymptotic` (N_q(t) ∼ πt/√d as t → ∞; πt/√d is the area of the half-ellipse q ≤ t, y > 0), and the main estimate `integral_nonaxialCount_le`: for every A ≥ 0,

```text
∫₀^A N_q(t) dt ≤ ∫₀^A (πt/√d)·1_{[√d/2, ∞)}(t) dt.
```

Equivalently, for the measure ν_q = Σ_{(m,n), n ≥ 1} δ_{q(m,n)} and the comparison measure ν = (π/2)δ_{√d/2} + (π/√d)·(Lebesgue on [√d/2, ∞)), whose cumulative mass is (πt/√d)·1_{[√d/2,∞)}(t), the integrated cumulative masses satisfy ∫₀^T ν_q((0,t])dt ≤ ∫₀^T ν((0,t])dt for every T ≥ 0; this is exactly the hypothesis of the positive Mellin comparison §1.4, and ν has Mellin transform ∫ x^(−s) dν = (π/2)·(s/(s − 1))·(√d/2)^(−s) for Re s > 1. Proof: write ∫₀^A N_q(t)dt = Σ_{n ≥ 1} Σ_m (A − q(m,n))₊; for fixed n the summand is a concave function of m supported on an interval, compare each inner sum with the corresponding integral in m using concavity and the minimum of q(·, n), and sum over n ≥ 1 using a ≤ √(d/3) and q(m,n) ≥ dn²/(4a). *Needs:* Tau Ceti `TauCeti.mem_reducedForms` (3a² ≤ d), `reducedForm_four_mul_c_sq_ge`, Mathlib `MeasureTheory.Measure`, `intervalIntegral`.

**Checks.**
- For q = (1,1,6) (d = 23) the nonaxial values up to 12 are 6, 6, 8, 8, 12, 12 (at (0,1), (−1,1), (1,1), (−2,1), (2,1), (−3,1)), so N_q(t) = 0 for t < 6 = c, which is stronger than vanishing below √23/2 ≈ 2.40.
- At A = √d/2 the right side is 0, so the left side must vanish: N_q(t) = 0 for t < c and c ≥ √d/2 make ∫₀^{√d/2} N_q = 0.
- Counting all (m,n) ≠ (0,0) instead of n ≥ 1 doubles the left side asymptotically (to about πA²/√d), while the right side is (π/(2√d))(A² − d/4); the inequality then fails for large A, so the restriction to n ≥ 1 is essential.
- The Mellin transform of ν at s = 2 is (π/2)·2·(√d/2)^(−2) = 4π/d: a comparison measure without the atom (π/2)δ_{√d/2} would have transform (π/√d)(√d/2)^(1−s)/(s − 1), which at s = 2 is 2π/d, and its cumulative mass would be smaller by π/2 just above √d/2.

### Examples

- K = ℚ(√−23): radicand −23, disc −23, t = 1, θ = 1; reduced forms (1,1,6), (2,±1,3), h = 3; 2 splits and 4·2³ ≥ 23; ν₁ + ν₂ = 3 = h.
- K = ℚ(√−5): disc −20, t = 2, 2 | h = 2; the boundary convention removes (2,−2,3); θ(20) = 1 − ⌊2√2⌋/3 = 1/3.
- K = ℚ(√−907): h = 3, θ = 1, the primes 2, 3, 5 are inert, and the three reduced forms are (1,1,227), (13,±9,19).

### Dependencies

Mathlib (`NumberField.classNumber`, `NumberField.discr`, `NumberField.dedekindZeta`, `riemannZeta`, `ClassGroup`, `Int.IsFundamentalDiscr`, `ArithmeticFunction.liouville`, the Lebesgue integral); Tau Ceti's genus theory and quadratic discriminants (`TauCeti.Multiquadratic`); TauCetiRoadmap IntegralLattices, Layer B (B1, B2, B5); TauCetiRoadmap GlobalNumberFields, Layer 10. No earlier layer.

## Layer 1: Goldfeld's effective analytic principle

The analytic engine compares a contour integral of a degree-four L-function, which vanishes because of a central zero of order at least three and a plus-sign functional equation, with its residue at s = 1, whose size is governed by log d and by the Euler factors at the small primes. A fixed pair (Ψ, M) is used for every K; only the auxiliary quotient G varies with K. The output is a uniform constant C, depending only on Ψ and M, with C·h ≥ min(1, ∏_{p∈P(d)} |G_p(1)|/(1 + 1/p))·log d.

Standing assumptions for this layer: d ∈ ℕ with d > 0 (d > 4 where K is involved), M > 0 real, Ψ and G complex functions; complex powers of positive reals are principal; integrals along vertical lines are oriented upwards and normalized by 1/(2πi). Coefficient domination ≪ is coefficient-wise, as in the Conventions.

<a id="s1-1"></a>

### 1.1 The degree-four completion

References: O85, condition C3, p. 314, and §4.2, p. 320. Built on Mathlib `Complex.cpow` and `Complex.Gamma`.

**Goldfeld's completion.** Define `goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : ℂ → ℂ` by F(s) = d^(s−1) M^s Γ(s)² Ψ(s) G(s), with no new gamma-factor or L-function carrier. Its API is `goldfeldCompletion_one` (F(1) = M Ψ(1) G(1), since d⁰ = 1 for every d, including d = 0), `goldfeldCompletion_two` (F(2) = d M² Ψ(2) G(2)), `goldfeldCompletion_congr` (equal Ψ and G give equal completions), `goldfeldCompletion_product` (if Ψ(s)G(s) = L(s)L_χ(s) and M = √(N N_χ)/(4π² d), then F(s) = Λ(s)Λ_χ(s)/d with Λ(s) = N^(s/2)(2π)^(−s)Γ(s)L(s) and likewise for L_χ), and `goldfeldCompletion_analyticOrder` (if ΨG is analytic at 1 with finite order there, F has the same order at 1, the factor d^(s−1)M^sΓ(s)² being analytic and nonzero at 1). *Needs:* Mathlib `Complex.cpow`, `Complex.Gamma`, `Complex.Gamma_one`, `analyticOrderNatAt`.

**Checks.**
- d = 2, M = 3, Ψ ≡ 2, G ≡ 5: F(1) = 3·2·5 = 30 (d^0 = 1, Γ(1) = 1).
- d = 2, M = 3, Ψ ≡ G ≡ 1: F(2) = 2·9·Γ(2)² = 18. A completion with d^s in place of d^(s−1) would give 36.
- Ψ ≡ 0 gives F ≡ 0.
- With ΨG = L(E,s)L(E⊗χ,s) the scale M = √(N N_χ)/(4π²d) produces Λ(E,s)Λ(E⊗χ,s)/d, not Λ(E,s)Λ(E⊗χ,s): the factor 1/d is visible at s = 1, where F(1) = M·L(E,1)L(E⊗χ,1) while Λ(E,1)Λ(E⊗χ,1) = √(N N_χ)(2π)^(−2)L(E,1)L(E⊗χ,1) = dM·L(E,1)L(E⊗χ,1).

<a id="s1-2"></a>

### 1.2 Oesterlé's conditions C1–C4

References: O85 §3, conditions C1–C4, p. 314, and Theorem 2, p. 314. This subsection fixes the hypotheses of §§1.5–1.8; it has no proof obligation of its own.

For d, M, Ψ, G as above, and K imaginary quadratic of discriminant −d:

- **C1** (coefficient domination). Ψ(s) = Σ a_n n^(−s) with Ψ ≪ ζ(2s − 1)², absolutely convergent for Re s > 1; G(s) = Σ b_n n^(−s) with G ≪ (ζ_K(s − 1/2)/ζ(2s − 1))², absolutely convergent for Re s > 3/2. In terms of coefficients: |a_n| ≤ m·τ(m) when n = m² and a_n = 0 otherwise, and |b_n| ≤ √n·Σ_{q|n} ν_q ν_{n/q} with ν the nonnegative coefficients of ζ_K(s)/ζ(2s) from §0.6. A bound on the values |Ψ(s)| or |G(s)| on one line does not imply C1.
- **C2** (Euler product). G(s) = ∏_p G_p(s) on Re s > 3/2 with G_p(s) = (1 + α_p p^(−s))(1 + β_p p^(−s)) / ((1 + α′_p p^(−s))(1 + β′_p p^(−s))) and |α_p|, |β_p|, |α′_p|, |β′_p| ≤ √p.
- **C3** (completed function). F = `goldfeldCompletion d M Ψ G` extends to an entire function, decreases faster than every power of |Im s| on every bounded vertical strip, satisfies F(2 − s) = F(s), and vanishes to order at least three at s = 1.
- **C4** (the fixed factor). Ψ is holomorphic on a neighbourhood of the closed half-plane Re s ≥ 1, has a simple zero at s = 1, and M^sΓ(s)²Ψ(s) decreases faster than every power of |Im s| on every bounded vertical strip of the closed half-plane Re s ≥ 1 (O85 asks for the strips of that half-plane, not of the neighbourhood; the indentation of §1.6 leaves the half-plane only on a compact set).

By the reflection F(2 − s) = F(s) the order of F at 1 is even, so C3 gives order at least four.

<a id="s1-3"></a>

### 1.3 The positive inverse Mellin kernels

References: O85 §3.3, Lemmas 1 and 2, pp. 315–316. Built on Mathlib `Real.rpow`, `Real.log`, `mellin` and `mellinInv_mellin_eq`.

**The kernel I_{a,m}.** For a ∈ ℝ and m ∈ ℕ with m ≥ 2 define `inverseMellinKernel (a : ℝ) (m : ℕ) : ℝ → ℝ` by I_{a,m}(x) = x^(−a)(log(1/x))^(m−1)/(m−1)! for 0 < x ≤ 1 and 0 otherwise; so I(1) = 0 and I(x) = 0 for x ≤ 0 and x ≥ 1. Its API is `inverseMellinKernel_of_pos_of_le_one` (the displayed formula on (0,1]), `inverseMellinKernel_eq_zero` (vanishing off (0,1)), `inverseMellinKernel_nonneg` (0 ≤ I for m ≥ 2), `inverseMellinKernel_antitoneOn` (for a ≥ 0 and m ≥ 2, I is nonincreasing on (0, ∞)), `inverseMellinKernel_convexOn` (for a ≥ 0 and m ≥ 2, I is convex on (0, ∞)), and `inverseMellinKernel_mellin` (for Re s > a, the Mellin transform ∫₀^∞ I(x)x^(s−1)dx equals (s − a)^(−m), absolutely convergent; with m ≥ 2 the transform is integrable on vertical lines, so `mellinInv_mellin_eq` applies). *Needs:* Mathlib `mellin`, `mellinInv_mellin_eq`, `ConvexOn`, `AntitoneOn`.

**Checks.**
- I_{0,2}(1/2) = log 2 and I_{1,2}(1/2) = 2 log 2: the factor x^(−a) is x^(−1) = 2 at x = 1/2.
- I_{0,3}(1) = 0 and I_{0,2}(2) = 0: the kernel vanishes at 1 and beyond.
- For a = 0, m = 2 the kernel is −log x on (0,1): convex and decreasing there, with a corner at x = 1 where it meets 0; for a < 0 monotonicity fails (I_{−1,2}(x) = −x log x increases on (0, 1/e)), so a ≥ 0 is needed for the comparison of §1.4.

<a id="s1-4"></a>

### 1.4 Positive Mellin comparison

References: O85 §3.3, Lemmas 1–3 and Examples 1–2, pp. 315–316. Built on §1.3 and Mathlib `MeasureTheory.Measure` and Fubini–Tonelli.

**Comparison of positive measures.** Prove `positiveMellin_comparison`: let a ≥ 0, m ≥ 2, x > 0, and let μ_j, ν_j (j in a finite index set) be positive measures on (0, ∞) with finite mass on every (0, t]. Suppose their Mellin transforms μ̂_j(s) = ∫ t^(−s) dμ_j converge on a common line Re s = σ > a, that (s − a)^(−m)∏_j μ̂_j(s) and (s − a)^(−m)∏_j ν̂_j(s) are absolutely integrable on that line, and that for every j and every T ≥ 0,

```text
∫₀^T μ_j((0,t]) dt ≤ ∫₀^T ν_j((0,t]) dt.
```

Then the inverse Mellin transforms of (s − a)^(−m)∏_j μ̂_j(s) and (s − a)^(−m)∏_j ν̂_j(s) at x are nonnegative and ordered in the same way. Proof: by Fubini (justified by the absolute integrability) each inverse transform equals ∫ I_{a,m}(x ∏_j t_j) ∏_j dμ_j(t_j); for fixed x the function t ↦ I_{a,m}(xt) is nonnegative, nonincreasing and convex with support bounded on the right, so it is a positive combination of hinges (u − t)₊ (its distributional second derivative is a positive measure, with an atom at the corner when m = 2); by Tonelli ∫ (u − t)₊ dμ(t) = ∫₀^u μ((0,t])dt, which gives the comparison for one factor; replace the factors one at a time. Pointwise domination μ_j((0,t]) ≤ ν_j((0,t]) for all t implies the integrated hypothesis (`positiveMellin_comparison_of_cumulative`). The application in §1.7 uses the integrated form for the nonaxial measures of §0.7, and the discrete comparison of ζ(2s) through the pushforward of counting measure along n ↦ n². *Needs:* `inverseMellinKernel_nonneg`, `inverseMellinKernel_antitoneOn`, `inverseMellinKernel_convexOn`, `inverseMellinKernel_mellin`, Mathlib `mellinInv_mellin_eq`, `MeasureTheory.integral_prod`.

**Checks.**
- μ = δ₁ and ν = (δ_{1/2} + δ_{3/2})/2 satisfy the integrated hypothesis for every T (the two sides are (T − 1)₊ and ((T − 1/2)₊ + (T − 3/2)₊)/2, equal for T ≥ 3/2), but pointwise domination fails for 1 ≤ t < 3/2, where μ((0,t]) = 1 > 1/2 = ν((0,t]). For a = 0, m = 2, x = 1 the kernel integrals are ∫ I_{0,2}(t)dμ = I_{0,2}(1) = 0 and ∫ I_{0,2}(t)dν = (log 2)/2, in the predicted order; the theorem must cover this example, so it may not assume pointwise domination.
- Positivity of the measures is needed for the nonnegativity part: the signed μ = −δ_{1/2} and ν = 0 satisfy the integrated inequality, but ∫ I_{0,2}(t) dμ = −log 2 < 0.
- Monotonicity of the kernel needs a ≥ 0: for a = −1 the hinge representation fails because I_{−1,2} is not monotone (§1.3).

<a id="s1-5"></a>

### 1.5 The fundamental contour identity

References: O85 §3.1, identity (3.1.1), p. 314. Built on Tau Ceti `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` and Mathlib `analyticOrderNatAt`.

**Vanishing of the central contour integral.** Prove `fundamentalContour`: if F is entire, F(2 − s) = F(s), F has a zero of order at least three at s = 1, and on every bounded vertical strip |F(s)| decreases faster than every power of |Im s|, then for every σ > 3/2

```text
(1/2πi) ∫_{Re s = σ} F(s)/(s − 1)³ ds = 0.
```

Proof: the order of F at 1 is even, hence at least four, so F(s)/(s − 1)³ is entire; integrate around the rectangle with vertical sides Re s = σ and Re s = 2 − σ and horizontal sides at height ±T, which encloses no singularity; the horizontal sides tend to 0 by strip decay, so the residue theorem gives I(σ) = I(2 − σ) for the two upward vertical integrals; the substitution s ↦ 2 − s maps the left line onto the right one, reverses orientation and multiplies the integrand by −1 (odd power of s − 1), so I(2 − σ) = −I(σ); hence I(σ) = 0. (O85 §3.1, p. 314, instead moves the line to Re s = 1, where the same symmetry makes the integral vanish.) With F = `goldfeldCompletion d M Ψ G` this is Oesterlé's identity J = 0. *Needs:* `goldfeldCompletion`, Tau Ceti `classicalResidueTheorem_nullHomologous`, Mathlib `analyticOrderNatAt`.

**Checks.**
- The plus sign is required: F(s) = (s − 1)³e^{(s−1)²} is entire, decays on vertical strips, vanishes to order three at 1 and satisfies F(2 − s) = −F(s); its integrand is e^{(s−1)²}, whose line integral (1/2πi)∫ e^{(σ−1+iy)²} i dy equals (1/2)π^(−1/2) ≠ 0.
- The order condition is necessary: F(s) = e^{(s−1)²} is even with order 0 at 1; the integrand has a triple pole there with residue F″(1)/2 = 1, the rectangle gives I(σ) − I(2 − σ) = 1, the reflection gives I(2 − σ) = −I(σ), and so the line integral is 1/2, not 0.

<a id="s1-6"></a>

### 1.6 The truncated Euler-product residue

References: O85 §3.1, formula (3.1.2), and §3.2, formulas (3.2.1)–(3.2.2), p. 315. Built on Tau Ceti `TauCeti.Contour.residue` and the residue theorem.

**Residue of the truncated integrand.** Assume C4, write γ(s) = M^sΓ(s)² and let H be the analytic function on a neighbourhood of 1 equal to γ(s)Ψ(s)/(s − 1) off s = 1 (the removable extension; H(1) = γ(1)Ψ′(1) = MΨ′(1) ≠ 0). For U ≥ 1 let G_U(s) = ∏_{p < U} G_p(s) with the local factors of C2; the cutoff is strict, p < U, the primes p ≥ U forming the complementary tail. Prove `truncatedResidue`: with c₁ = H(1) and c₂ = H′(1)/H(1), the residue at s = 1 of d^(s−1)γ(s)Ψ(s)G_U(s)/(s − 1)³ is

```text
c₁ G_U(1) [ log d + G_U′(1)/G_U(1) + c₂ ].
```

Moreover, let Δ be the upward contour that follows the line Re s = 1 except near s = 1, where it detours to the left along the boundary of the rectangle [1 − η, 1] × [−η′, η′], with η ≤ 1/4 and η′ > 0 small enough that Ψ is holomorphic on the region between Δ and the line Re s = σ (O85 §3.2, figure, p. 315); on Δ one has Re s ≥ 3/4, so no local denominator of C2 vanishes there. Then the integral J(U) = (1/2πi)∫_{Re s = σ} d^(s−1)γΨG_U (s − 1)^(−3) ds equals the residue plus the Δ-integral, and the Δ-integral is bounded by c₃·sup_Δ |G_U|, where c₃ = (1/2π)∫_Δ |γ(s)Ψ(s)(s − 1)^(−3)||ds| depends only on Ψ, M and Δ. Proof: at s = 1 every local denominator is nonzero because |α′_p|/p ≤ p^(−1/2) < 1; the integrand is d^(s−1)H(s)G_U(s)/(s − 1)², a double pole, whose residue is the derivative of d^(s−1)H(s)G_U(s) at 1; then apply the residue theorem to the region between Δ and Re s = σ truncated at height ±T, which contains the single pole s = 1, and let T → ∞ using the strip decay of C4. *Needs:* `fundamentalContour`, Tau Ceti `TauCeti.Contour.residue`, `classicalResidueTheorem_nullHomologous`.

**Checks.**
- The residue is independent of how H is presented: replacing H by any analytic function agreeing with γΨ/(s − 1) near 1 gives the same c₁, c₂; evaluating the totalized quotient γΨ/(s − 1) at s = 1 (value 0 in Lean's convention for division by 0) would give c₁ = 0, which is wrong.
- Lean form of the residue: for H, G analytic at 1, the residue of d^(s−1)H(s)G(s)/(s − 1)² at 1 is H(1)G(1)log d + H(1)G′(1) + H′(1)G(1); with H ≡ G ≡ 1 it is log d, a check of the factor d^(s−1).
- The strict cutoff matters when U is prime: with U = 2 the product G_U is empty (G_U ≡ 1) and the residue is c₁(log d + c₂), whereas a non-strict cutoff would include the factor at 2.

<a id="s1-7"></a>

### 1.7 The three remainder estimates

References: O85 §3.4, equations (3.4.2)–(3.4.9) and Proposition 1, pp. 316–318. Built on §§0.6, 0.7, 1.4 and 1.6.

**The tail J*.** Under C1 and C2, with d > 4 and U ≥ 1, let G* = G − G_U and J* = (1/2πi)∫_{Re s = σ} d^(s−1)γ(s)Ψ(s)G*(s)(s − 1)^(−3) ds. Prove `tailThreePieces`: |J*| ≤ J₁ + J₂ + J₃ with

```text
J₁ ≤ (M/96)·h²·U^(−1/2)·(|log(dM/U)| + 3)⁴,
J₂ ≤ (2π⁴/3)·M^(3/2)·h·Σ_q a(q)^(−1),
J₃ ≤ 4π²e·M^(3/2)·max(2, log 4M)·h²·d^(−1/2),
```

the sum in J₂ running over the h reduced forms. Proof: shift s by 1/2 and dominate the coefficients of G* by those of (ζ_K(s)/ζ(2s))² from which the pairs with a(q)a(q′) < U removed by the truncation are discarded (C1 and §0.6); split the reduced-form expansion into axial/axial, axial/nonaxial and nonaxial/nonaxial products; replace each nonaxial measure by the comparison measure ν of §0.7 using the positive Mellin comparison §1.4 with its integrated hypothesis, and the measure of ζ(2s) by the pushforward of counting measure along n ↦ n²; evaluate the resulting gamma-kernel integrals by residues for J₁ and by the elementary vertical integrals (3.4.8)–(3.4.9) for J₂, J₃. *Needs:* `dedekindZeta_eq_sum_reducedForms`, `nu_nonneg`, `integral_nonaxialCount_le`, `positiveMellin_comparison`, `truncatedResidue`, `classNumber_eq_card_reducedForms`.

**Checks.**
- Normalization of J₂: with M = N/(4π²) the coefficient (2π⁴/3)M^(3/2) equals πN^(3/2)/12.
- The absolute value in |log(dM/U)| is needed: for dM < U the logarithm is negative and (log(dM/U) + 3)⁴ could be smaller than the true contribution.
- The sum Σ_q a(q)^(−1) at d = 23 is 1 + 1/2 + 1/2 = 2, using the three reduced forms of §0.2.

<a id="s1-8"></a>

### 1.8 Oesterlé's effective technical theorem

References: O85 §3.5, Theorem 2 and equations (3.5.1)–(3.5.6), pp. 318–319; §3.6, p. 319. Built on §§0.1, 0.4, 0.6, 1.5–1.7.

**The technical theorem.** Prove `oesterleTechnical`: fix M > 0 and Ψ satisfying the Ψ-part of C1 and C4. There is C > 0, depending only on Ψ and M, such that for every imaginary quadratic field K with d > 4 and every G satisfying the G-part of C1, C2 and C3,

```text
C·h ≥ min(1, ∏_{p∈P(d)} |G_p(1)|/(1 + 1/p))·log d.
```

C is independent of K, G and h, and it is effective: it is an explicit function of rational bounds for M, for c₁ and c₂ (the Taylor data of H at 1), for the C4 neighbourhood and for the strip and contour integrals defining c₃. Proof: choose U = (√d/2)^(1/m), where m is the least positive integer with m² + m ≥ h/2, except that h = 4 uses m = 3/2; then at most one prime p ≤ U splits in K, and such a p satisfies p ≥ (d/4)^(1/h) (O85 §3.5, Lemma 1, p. 318, from §0.4 and `sum_nu_le_classNumber`); and the largest prime divisor of d exceeds U, because genus theory (§0.1) gives t ≤ 2m and d or d/4 is squarefree, so some prime divisor of d is at least (d/4)^(1/t) ≥ U; apply the four estimates (3.5.1)–(3.5.4) for the reduced-form sum Σ a(q)^(−1), for |G_U(1)|, for Re(G_U′/G_U)(1) and for sup_Δ |G_U|; combine the residue of §1.6 with J(U) = −J* from §1.5 and the tail bound of §1.7; for d ≥ exp(λh) the error ratio α₅/α₆ is at most 1 + c₇(λ) with α₆ > 0 and c₇(λ) → 0 as λ → ∞, which gives C = max(λ, c₅(1 + c₇(λ))/|c₁|), while for d < exp(λh) the inequality log d < λh holds directly. Every constant in this choice is given by an explicit rational bound; analyticity of Ψ given as an arbitrary function, without such bounds, does not determine C algorithmically. *Needs:* `tailThreePieces`, `truncatedResidue`, `fundamentalContour`, `splitPrime_size`, `sum_nu_le_classNumber`, `two_pow_sub_one_dvd_classNumber`.

**Checks.**
- The constant does not depend on G or on K: a version with C depending on d (for instance through U) would be vacuous, since log d/h is what is being bounded.
- h = 4 uses m = 3/2, not the least integer m = 1 with m² + m ≥ 2: genus theory allows t = 3 when h = 4 (2² | 4), and the step t ≤ 2m that puts the largest prime divisor of d above U fails for m = 1.
- When all p ∈ P(d) have |G_p(1)| ≥ 1 + 1/p (for instance P(d) = ∅, t = 1), the minimum is 1 and the conclusion is log d ≤ C·h.

### Examples

- With Ψ ≡ 2, G ≡ 5, d = 2, M = 3: F(1) = 30 and F(2) = d·M²·Ψ(2)·G(2) = 2·9·2·5 = 180, which pins the factors d^(s−1) and M^s.
- The measures δ₁ and (δ_{1/2} + δ_{3/2})/2 illustrate the integrated hypothesis of §1.4 without pointwise domination.
- For the comparison measure ν of §0.7 at d = 23, the Mellin transform at s = 2 is 4π/23.

### Dependencies

Layer 0 (§§0.1, 0.4, 0.6, 0.7); Mathlib (`Complex.Gamma`, `Complex.cpow`, `mellin`, `mellinInv_mellin_eq`, measures, Fubini); Tau Ceti contour integration (`TauCeti.Contour.residue`, `classicalResidueTheorem_nullHomologous`) and the Completed ContourIntegration roadmap.

## Layer 2: two elliptic curves of rank three

Goldfeld's principle needs an L-function with a central zero of order at least three. The zero can be shown to exist only indirectly: a numerical enclosure of L′(1) close to 0 proves nothing, but the Gross–Zagier formula expresses L′(1), times a nonzero twisted central value, as a positive multiple of the height of a rational point, and a point of small height must be torsion. This layer produces the two classical curves, E₁₃₉ of conductor 37·139² (Gross–Zagier) and E₅₀₇₇ of conductor 5077 (Buhler–Gross–Zagier), each with an arithmetic proof of rank three (a complete descent bound and three independent points) and an analytic one (exact vanishing of L′(1) and explicit rational bounds excluding L‴(1) = 0), kept independent of each other.

Standing assumptions for this layer: curves are `WeierstrassCurve ℚ` with integral coefficients; L(E,s) is the entire continuation supplied by EllipticCurveModularity R29.6, agreeing with Σ a_n n^(−s) on Re s > 3/2; heights are ĥ (normalization 2(O)) unless stated; every numerical claim is a stated inequality between rational numbers and explicitly defined real numbers.

<a id="s2-1"></a>

### 2.1 The Gross–Zagier curve E₁₃₉

References: GZ86, I, Proposition (7.4), p. 231; O85 §4.3, p. 320; O88 §8, p. 66. Built on Mathlib `WeierstrassCurve` and `WeierstrassCurve.Affine.Equation`.

**The curve.** Define `curve139 : WeierstrassCurve ℚ` with coefficients (a₁, a₂, a₃, a₄, a₆) = (0, −1, 1, −64403, −6220110), the equation Y² + Y = X³ − X² − 64403X − 6220110, and `curve37 : WeierstrassCurve ℚ` with coefficients (0, 1, 1, −3, 1), the equation y² + y = x³ + x² − 3x + 1 of discriminant 37. Their API is `curve139_discriminant` (Δ = 37·139⁶ = 266864328286957), `curve37_discriminant` (Δ = 37), `curve139_isElliptic` (Δ ≠ 0), `curve139_c₄_c₆` (c₄ = 3091360 = (−139)²·160 and c₆ = 5392722952 = (−139)³·(−2008), where 160 and −2008 are c₄ and c₆ of `curve37`), `curve139_j` (j = 4096000/37, equal to j of `curve37`), `curve139_isQuadraticTwist` (E₁₃₉ is ℚ-isomorphic to the quadratic twist of `curve37` by ℚ(√−139), expressed with Tau Ceti `WeierstrassCurve.quadraticTwistOf` and an explicit change of variables; equality of c₄ and c₆ up to the factors (−139)² and (−139)³ is the invariant form of this), and `curve139_source_equation` (the substitution x = (4X + 462)/(−139), y = (8Y + 4)/139² identifies the affine equation with −139y² = x³ + 10x² − 20x + 8, the model in which GZ86 states the curve, with inverse X = (−139x − 462)/4, Y = (139²y − 4)/8, extending to an isomorphism of curves that fixes the point at infinity). The model printed in O88, p. 66, with coefficients (0, −1, 1, −450823, 112971139) and discriminant 37³·139⁶, has j-invariant 1404928000/37³ and is the −139 twist of E₀ : y² + y = x³ + x² − 23x − 50 (discriminant 37³, the conductor-37 curve used in O85 §4.3, p. 320), which lies in the isogeny class of `curve37` (the two have the same a_p); it is isogenous to E₁₃₉, not isomorphic, and rank transfers between them only through an explicit isogeny, while the L-function, depending only on the isogeny class, is the same. *Needs:* Mathlib `WeierstrassCurve`, `WeierstrassCurve.Affine.Equation`, Tau Ceti `WeierstrassCurve.quadraticTwistOf`.

**Checks.**
- a₂ = −1, a₄ = −64403, a₆ = −6220110 (sign errors in the printed sources are common; these are the values of the integral model above).
- (0, 0) is not on E₁₃₉: the right side is −6220110 ≠ 0.
- (−156, 77) is on E₁₃₉: 77² + 77 = 6006 = (−156)³ − (−156)² − 64403·(−156) − 6220110.
- Δ = 37·139⁶ while Δ(`curve37`) = 37: twisting by −139 multiplies the minimal discriminant by 139⁶, and the conductor becomes 37·139² (§2.3); the discriminant is not the conductor.

<a id="s2-2"></a>

### 2.2 The Buhler–Gross–Zagier curve E₅₀₇₇

References: BGZ85, equation (2), p. 473, and §2, pp. 475–476; GZ86, I §8, p. 232. Built on Mathlib `WeierstrassCurve`.

**The curve.** Define `curve5077 : WeierstrassCurve ℚ` with coefficients (0, 0, 1, −7, 6), the equation y² + y = x³ − 7x + 6. Its API is `curve5077_discriminant` (Δ = 5077), `curve5077_c₄` (c₄ = 336), `curve5077_isElliptic`, `curve5077_equation` (the affine equation is y² + y = x³ − 7x + 6), `curve5077_minus_y_equation` (y ↦ −y maps it to y² − y = x³ − 7x + 6, the model of GZ86 I §8), and `curve5077_points` (P₀ = (0, 2), P₁ = (1, 0), P₂ = (2, 0) lie on the plus-y model). No second curve or height is introduced for the minus-y model. *Needs:* Mathlib `WeierstrassCurve`, `WeierstrassCurve.Affine.Equation`.

**Checks.**
- (0, 2), (1, 0), (2, 0) satisfy y² + y = x³ − 7x + 6 (values 6, 0, 0).
- (0, −2) is not on the plus-y model (4 − 2 = 2 ≠ 6); it is on the minus-y model, where the three generators appear with y negated.
- Δ = 5077 is prime, so E₅₀₇₇ has multiplicative reduction at 5077 and good reduction elsewhere.

<a id="s2-3"></a>

### 2.3 Conductors, reduction types and root numbers

References: O85 §4.3, p. 320; BGZ85 §2 and §4, pp. 475 and 477–478; GZ86, I §§7–8, pp. 231–232. Built on EllipticCurves Layer 4, EllipticCurveModularity R29.4, RankZeroOneBSD §§0.6, 0.7, 0.10 and Mathlib's `Nat.Prime`.

**Local data of the two curves.** Prove `curve_local_data`: E₁₃₉ has conductor 37·139² = 714877 and root number −1; E₅₀₇₇ has conductor 5077, nonsplit multiplicative reduction at 5077, good reduction elsewhere, root number −1 and bad Euler factor (1 + 5077^(−s))^(−1). In terms of Mathlib's formal L-functions: the coefficient of 139 in `curve139.LFunction` is 0 (additive reduction) and that of 5077 in `curve5077.LFunction` is −1 (nonsplit). Proof: 37, 139 and 5077 are prime (Mathlib's `norm_num` primality extension decides this); for E₅₀₇₇, Δ = 5077 and c₄ = 336 ≢ 0 mod 5077 give multiplicative reduction, and the node of (2y + 1)² = 4x³ − 28x + 25 mod 5077 is at x = 92 with tangent slopes the square roots of 12·92 = 1104, a non-square mod 5077, so the reduction is nonsplit; the local root number at a nonsplit multiplicative prime is +1 and at ∞ is −1. For E₁₃₉, use the twist description of §2.1: `curve37` has conductor 37 and root number +1 (it is the conductor-37 curve with L(1) ≠ 0 of §2.11), −139 is prime to 37, so RankZeroOneBSD §0.7 gives conductor 37·139² and §0.10 gives root number χ_{−139}(−37)·(+1) = χ_{−139}(−1)χ_{−139}(37) = (−1)(+1) = −1, since 37 splits in ℚ(√−139) ((−139/37) = 1). The conductor is the intrinsic (Galois) conductor of EllipticCurveModularity R29.4, matched with Tate's algorithm of EllipticCurves Layer 4 at each bad prime. *Needs:* `curve139_isQuadraticTwist`, `curve5077_discriminant`, `curve5077_c₄`, EllipticCurves Layer 4 (reduction types and Tate's algorithm), EllipticCurveModularity R29.4 (level = conductor, bad factors), RankZeroOneBSD §§0.6, 0.7, 0.10, Mathlib `Nat.Prime` (`Mathlib.Tactic.NormNum.Prime`).

**Checks.**
- 714877 = 37·139², and no prime outside {37, 139} divides the conductor of E₁₃₉; in particular 2 is a prime of good reduction because Δ is odd.
- a₃(E₅₀₇₇) = −3 and a₅(E₅₀₇₇) = −4 (from #E(𝔽₃) = 7 and #E(𝔽₅) = 10), and a_p(E₁₃₉) = χ_{−139}(p)a_p(`curve37`) at p = 3, 5, 7, 11, 13 (values −1, 0, −1, 3, −4).
- At 5077 a split node would give the factor (1 − 5077^(−s))^(−1) and local root number −1, hence global root number +1 and even analytic rank: the nonsplit computation is what makes the order odd.

<a id="s2-4"></a>

### 2.4 Arithmetic ranks

References: BGZ85 §§1–2, pp. 473–476, especially the height bound and the 2-descent on p. 476; GZ86, I, Proposition (7.4), p. 231. Built on EllipticCurves Layer 6, EffectiveDiophantineMethods §§3.5–3.7, 3.13–3.15, 3.17–3.22, and Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`.

**Mordell–Weil ranks.** Prove `mordellWeilRank_eq_three`: the ℤ-rank of E₁₃₉(ℚ)/E₁₃₉(ℚ)_tors is 3, and E₅₀₇₇(ℚ) is free of rank 3 with basis P₀ = (0, 2), P₁ = (1, 0), P₂ = (2, 0). Each assertion is the conjunction of a complete descent upper bound and an independence lower bound; neither uses the analytic rank or any part of the conjecture of Birch and Swinnerton-Dyer.

- E₅₀₇₇, torsion: #E(𝔽₃) = 7 and #E(𝔽₅) = 10 have gcd 1, and E(ℚ)_tors injects into both (EllipticCurves Layer 6 at good odd primes), so E(ℚ) is torsion-free.
- E₅₀₇₇, independence: the height matrix (⟨P_i, P_j⟩) has entries approximately 0.9909, 0.6682, 0.7670 on the diagonal and −0.2365, −0.2764, 0.0333 off it, with determinant the regulator 0.41714… (BGZ85, p. 476); rational bounds for these entries (EffectiveDiophantineMethods §3.13, doubled to the 2(O) normalization) giving a positive lower bound for the determinant prove independence (§3.14 there).
- E₅₀₇₇, upper bound and saturation: a complete 2-descent (EffectiveDiophantineMethods §§3.5–3.7 on EllipticCurves Layer 6) shows that E(ℚ)/2E(ℚ) has 𝔽₂-dimension 3 and that P₀, P₁, P₂ generate it; the height-difference bound (7) of BGZ85, p. 475, and a complete search of the points of small naive height show that ±P₀, ±P₁, ±P₂ are the only points with ĥ < 1, so every non-torsion point has ĥ ≥ ĥ(P₁) ≈ 0.6682 > 1/2 (EffectiveDiophantineMethods §3.15); together with torsion-freeness this gives E(ℚ) = ℤP₀ ⊕ ℤP₁ ⊕ ℤP₂ (§3.22 there).
- E₁₃₉, torsion: #E₁₃₉(𝔽₃) = 5 and #E₁₃₉(𝔽₇) = 9 are coprime, so the torsion is trivial.
- E₁₃₉, independence: the integral points Q₁ = (−156, 77), Q₂ = (510, 9660), Q₃ = (1344, 48302) lie on E₁₃₉ (and (350, 3740) = −2Q₂); their height Gram matrix is approximately (4.5803, −0.3583, −0.6590; −0.3583, 1.5516, −0.2874; −0.6590, −0.2874, 2.3720), with determinant about 15.36; rational bounds for the entries giving a positive lower bound for the determinant prove that Q₁, Q₂, Q₃ are independent.
- E₁₃₉, upper bound: the 2-Selmer group of E₁₃₉ over ℚ has 𝔽₂-dimension 3 (a complete 2-descent, EffectiveDiophantineMethods §§3.2–3.7), which bounds the rank by 3. The published sources state the rank but do not print this descent; carrying it out is part of the proof of this target. The Birch–Swinnerton-Dyer quotient computed from §2.7, Ω ≈ 0.29985, the regulator above and the Tamagawa numbers c₃₇ = 1, c₁₃₉ = 4 is 1.000 to four digits, consistent with a 2-Selmer group of dimension exactly 3 but not a proof of it; should the 2-Selmer group be larger, a descent by one of the rational 3-isogenies of the isogeny class (the −139 twist of the 3-isogeny class of `curve37`) gives the bound instead.

*Needs:* `curve_local_data`, `curve5077_points`, Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`, `WeierstrassCurve.Affine.Point.canonicalHeight`, EllipticCurves Layer 6, EffectiveDiophantineMethods §§3.2–3.7, 3.13–3.15, 3.17–3.22.

**Checks.**
- A nonsingular 3 × 3 height matrix proves only rank ≥ 3; without the descent bound it does not give rank = 3.
- (350, 3740) is not independent of Q₂: 2Q₂ = (350, −3741), the negative of (350, 3740); a Gram matrix that used it with Q₂ would have determinant 0.
- BGZ's heights are for 2(O); the pinned Tau Ceti `canonicalHeight` of P₁ is 0.6682…/2 ≈ 0.3341.

<a id="s2-5"></a>

### 2.5 The Buhler–Gross–Zagier kernels

References: BGZ85 §4, formulas (12)–(14), pp. 478–479. Built on Mathlib's Lebesgue integral on [1, ∞), `mellinInv` and `Complex.Gamma`.

**The kernels G_r.** For r ∈ ℕ define `bgzKernel (r : ℕ) : ℝ → ℝ` by G₀(x) = e^(−x) and, for r ≥ 1, G_r(x) = (1/(r − 1)!)∫₁^∞ e^(−xy)(log y)^(r−1) dy/y, for x > 0; for x ≤ 0 the value is 0, a convention kept away from every analytic statement. Its API is `bgzKernel_zero` (G₀(x) = e^(−x) for x > 0), `bgzKernel_of_nonpos` (G_r(x) = 0 for x ≤ 0), `bgzKernel_pos` (G_r(x) > 0 for x > 0), `bgzKernel_hasDerivAt` (for r ≥ 1 and x > 0, G_r′(x) = −G_{r−1}(x)/x, by differentiation under the integral with a dominating function on compact subintervals of (0, ∞)), `bgzKernel_le` (G_r(x) ≤ e^(−x)/x^r for x > 0, from log y ≤ y − 1 and the substitution y = 1 + u), `bgzKernel_mellinInv` (for r ≥ 1, x > 0 and c > 0, the inverse Mellin transform of Γ(s)s^(−r) on Re s = c equals G_r(x), formula (13) of BGZ), and `bgzKernel_series` (G_r(x) = P_r(log(1/x)) + Σ_{n≥1} (−1)^(n−r) x^n/(n^r·n!) for x > 0, with P_r the polynomial of degree r obtained from the residue at s = 0 of Γ(s)x^(−s)s^(−r), whose coefficients are the Taylor coefficients of Γ(1 + s) at 0; for r = 1 this is −γ − log x − Σ_{n≥1} (−x)^n/(n·n!)). *Needs:* Mathlib `MeasureTheory.integral`, `mellinInv`, `Complex.Gamma`, `HasDerivAt`.

**Remainder bounds.** Prove `bgzKernel_series_remainder`: for r ≥ 1, x > 0 and an integer K ≥ x, the truncation of `bgzKernel_series` after the term n = K differs from G_r(x) by at most x^(K+1)/((K + 1)^r·(K + 1)!), the first omitted term, since the tail is alternating with terms decreasing in n once n + 1 ≥ x. Prove `bgzKernel_integral_tail_le`: for r ≥ 1, x > 0 and Y ≥ e^(r−1), the part ∫_Y^∞ of the defining integral, divided by (r − 1)!, is at most e^(−xY)(log Y)^(r−1)/(xY(r − 1)!), because (log y)^(r−1)/y is nonincreasing on [e^(r−1), ∞). With Mathlib's `Real.exp_bound` and the Taylor coefficients of Γ(1 + s) at 0, these give explicit rational bounds for G_r(x) at rational x, which is how the numerical statements of §2.7 are proved. *Needs:* `bgzKernel_series`, `bgzKernel_le`, Mathlib `Real.exp_bound`.

**Checks.**
- G₀(1) = e^(−1), and G₃(0) = 0 by the boundary convention.
- 0 < G₁(1) < e^(−1): G₁(1) = E₁(1) ≈ 0.2194, and the bound e^(−x)/x^r with r = 1 gives e^(−1) ≈ 0.3679.
- G₃(2) ≤ e^(−2)/8 (numerically G₃(2) ≈ 0.00354 against e^(−2)/8 ≈ 0.0169); an asymptotic G_r(x) ∼ x^(−r)e^(−x) is not a bound and is not used.
- The remainder bound needs K ≥ x: for x = 5, r = 1 and K = 1 the omitted terms 25/4 = 6.25 and 125/18 ≈ 6.94 increase, so the tail is not bounded by its first term.
- G₁′(x) = −G₀(x)/x = −e^(−x)/x: the derivative relation fixes the normalization by (r − 1)! (with 1/r! instead, G₂′ = −G₁/x would fail by a factor 2).

<a id="s2-6"></a>

### 2.6 Odd central derivatives as kernel series

References: BGZ85 §4, formulas (10)–(12), pp. 478–479. Built on §2.5, EllipticCurveModularity R29.4 and R29.6, and Mathlib `mellin`.

**The derivative series.** Prove `centralDerivative_series`: let E/ℚ have conductor N and root number −1, with coefficients a_n and entire L(E,s). For odd r ≥ 1 such that L(E,·) vanishes to order at least r at 1,

```text
L^(r)(E,1) = 2·r!·Σ_{n≥1} (a_n/n)·G_r(2πn/√N),
```

the series converging absolutely. For root number +1 the same argument at r = 0 gives L(E,1) = 2·Σ_{n≥1} (a_n/n)e^(−2πn/√N). Proof: with f(iy) = Σ a_n e^(−2πny), Λ(E,s) = ∫₀^∞ f(iy/√N)y^(s−1)dy (formula of BGZ before (10)); the Fricke relation f(i/(√N y)) = w·y²·f(iy/√N), equivalent to Λ(E,2 − s) = wΛ(E,s), splits the integral at y = 1 into ∫₁^∞ f(iy/√N)(y^(s−1) + w·y^(1−s))dy, which for w = −1 is BGZ's formula (10); differentiate r times at s = 1 under an integrable majorant, expand f and integrate by parts once, using the vanishing of the lower derivatives, to reach the coefficient a_n/n. The lower vanishing is essential: applied at r = 3 before L′(E,1) = 0 is known, the right side computes a different expression. *Needs:* `bgzKernel_hasDerivAt`, `bgzKernel_le`, EllipticCurveModularity R29.6 (Λ(E,2 − s) = w_E Λ(E,s) and the newform F_E), R29.4 (coefficients), Mathlib `mellin`.

**Tail bound.** Prove `centralDerivative_tail`: with α = 2π/√N and |a_n| ≤ τ(n)√n, the tail Σ_{n>B} satisfies |2·r!·Σ_{n>B} (a_n/n)G_r(αn)| ≤ 2·r!·Σ_{n>B} τ(n)n^(−1/2)e^(−αn)/(αn)^r, and, using τ(n) ≤ 2√n, this is at most 4·r!·e^(−α(B+1))/((α(B + 1))^r(1 − e^(−α))). The coefficient bound comes from |a_p| ≤ 2√p (Hasse, EllipticCurves Layer 3), multiplicativity and the Hecke recursion at good primes, and |a_p| ≤ 1 at bad primes. *Needs:* `centralDerivative_series`, `bgzKernel_le`, Mathlib `ArithmeticFunction.sigma`.

**Checks.**
- The summand carries a_n/n: for E₅₀₇₇ at n = 2 (a₂ = −2) the r = 1 term is 2·(−2/2)·G₁(2α) ≈ −2.6538, taking the partial sum from 3.8748 to 1.2211 as in BGZ's Table 2; without the factor 1/n it would be −5.3075.
- For r = 1 and root number −1 the order is automatically at least 1, so no hypothesis beyond the sign is needed; for r = 3 the hypothesis L′(E,1) = 0 must be supplied (by §2.8 or §2.11).

<a id="s2-7"></a>

### 2.7 Central values and derivatives of the explicit curves

References: BGZ85 §4, pp. 478–479, and Table 2, p. 480; GZ86, I §8, p. 232. Built on §§2.3, 2.5 and 2.6.

**Coefficients from point counts.** Prove `LFunction_coeff_eq`: for an explicit integral Weierstrass curve E with known conductor and bad reduction types, the coefficients a_n for n ≤ B are computed exactly from point counts: a_p = p + 1 − #E(𝔽_p) at good p, a_p ∈ {0, 1, −1} at bad p by the reduction type (Mathlib's local polynomial), a_{p^k} by the recursion a_{p^(k+1)} = a_p a_{p^k} − p·a_{p^(k−1)} at good p (and a_{p^k} = a_p^k at bad p), and multiplicativity. Through EllipticCurveModularity R29.4 these are the Fourier coefficients of the newform F_E, and they are the coefficients of `WeierstrassCurve.LFunction`. *Needs:* `curve_local_data`, Mathlib `WeierstrassCurve.LFunction`, EllipticCurveModularity R29.4.

**Numerical values.** Prove the following five inequalities. Each is proved the same way: write L^(r)(E,1) by `centralDerivative_series` (or its r = 0 form), compute a_n for n ≤ B by `LFunction_coeff_eq`, bound each of the first B terms above and below by rational numbers through the remainder bounds of §2.5 and rational bounds for π and √N, and add the tail bound `centralDerivative_tail`. *Needs:* `LFunction_coeff_eq`, `centralDerivative_series`, `centralDerivative_tail`, `bgzKernel_series_remainder`, `bgzKernel_integral_tail_le`, `curve_local_data`.

- `curve5077_deriv_small`: |L′(E₅₀₇₇,1)| < 10^(−12), with B = 250 (BGZ85, p. 479, reports agreement with 0 to 13 decimals).
- `curve5077_third_deriv_bounds`: 173/100 < L‴(E₅₀₇₇,1)/3! < 174/100, that is 10.38 < L‴(E₅₀₇₇,1) < 10.44, the r = 3 series being available once L′(E₅₀₇₇,1) = 0 (§2.8) (BGZ85, (14), p. 479, reports 1.7318499…).
- `curve5077_twist7_central_bounds`, r = 0: the twist of E₅₀₇₇ by ℚ(√−7) has conductor 5077·7² = 248773 (−7 is prime to 5077) and root number χ_{−7}(−5077)·(−1) = (−1)(+1)(−1) = +1, since 5077 ≡ 2 mod 7 and 2 is a square mod 7; with α = 2π/√248773 > 1/80, the sum 2Σ_{n≤2048} (a_nχ_{−7}(n)/n)e^(−αn) plus a tail at most 4e^(−2049α)/(1 − e^(−α)) < 10^(−8) gives 4 < L(E₅₀₇₇⊗χ_{−7},1) < 5 (the finite sum is about 4.4768).
- `curve139_third_deriv_bounds`: 1842/100 < L‴(E₁₃₉,1)/3! < 1844/100, with N = 714877 and the r = 3 series available once L′(E₁₃₉,1) = 0 (§2.11); the series with B = 6000 gives about 18.4294 (the published sources do not print this value; it is the value whose quotient by Ω·R·c₃₇·c₁₃₉ is 1.000, §2.4).
- `curve37_central_bounds`: 72/100 < L(`curve37`,1) < 73/100 (conductor 37, root number +1; the r = 0 series gives about 0.72568), used in §2.11.

**Checks.**
- A bound |L′(E,1)| < ε does not prove L′(E,1) = 0; the exact vanishing is §2.8's conclusion, not this subsection's.
- For E₅₀₇₇ the first terms of the r = 3 series are those of BGZ's Table 2 (partial sums 4.5335, 2.5635, 1.4644, 1.8080, …, converging to 1.7318…); a kernel normalized without the factor 1/(r − 1)! would multiply every term by 2.

<a id="s2-8"></a>

### 2.8 Exact vanishing from a Heegner height gap

References: BGZ85 §4, p. 479; O88 §8, p. 66; GZ86, I §§6–7, pp. 230–231. Built on §2.7, GrossZagierAndArithmeticHeights §8.19, RankZeroOneBSD §0.5, and EffectiveDiophantineMethods §3.15.

**The height-gap principle.** Prove `heegnerHeight_gap`: suppose that for E/ℚ and an imaginary quadratic field K satisfying the Heegner hypotheses of GrossZagierAndArithmeticHeights §8.15, the formula of §8.19 reads L′(E,1)·L(E⊗χ_K,1) = c·ĥ_K(P_K) with c > 0, where P_K ∈ E(K) is the Heegner trace; that L(E⊗χ_K,1) ≠ 0; that every point of E(K) of infinite order in the relevant eigenspace has ĥ_K ≥ δ > 0; and that explicit bounds give |L′(E,1)·L(E⊗χ_K,1)| < c·δ. Then P_K is torsion and L′(E,1) = 0; if moreover w_E = −1, root-number parity (RankZeroOneBSD §0.5) gives ord_{s=1} L(E,s) ≥ 3. The Lean form isolates the arithmetic core: from ab = c·η, c > 0, b ≠ 0, η = 0 or η ≥ δ, and |ab| < cδ, conclude η = 0 and a = 0 (the positivity of δ is what makes the hypothesis a gap, but the deduction does not use it). *Needs:* GrossZagierAndArithmeticHeights §8.15 and §8.19, RankZeroOneBSD §0.5, Tau Ceti `canonicalHeight_zero`.

**The data for E₅₀₇₇.** Take K = ℚ(√−7). The Heegner hypothesis holds because 5077 splits in K (χ_{−7}(5077) = 1). Since w_E = −1 and w(E⊗χ_{−7}) = +1, P_K lies in E(ℚ) up to torsion, and ĥ_K(P) = 2ĥ(P) for P ∈ E(ℚ); by §2.4 every non-torsion P ∈ E(ℚ) has ĥ(P) ≥ 0.668 > 1/2 (`curve5077_height_gap`, stated as 1/4 ≤ `canonicalHeight` in the pinned (O) normalization), so δ = 1 works for ĥ_K. The constant c is the explicit Gross–Zagier constant of §8.19 (‖ω₀‖²/(C²u²√7) with u = 1, ‖ω₀‖² from the period lattice computed by the arithmetic–geometric mean, C the Manin constant of the parametrisation), for which any explicit positive lower bound c⁻ with 5·10^(−12) < c⁻ suffices (from |L′(E,1)| < 10^(−12) and L(E⊗χ_{−7},1) < 5, §2.7). Conclusion: L′(E₅₀₇₇,1) = 0 and ord_{s=1} L(E₅₀₇₇,s) ≥ 3. *Needs:* `heegnerHeight_gap`, `curve5077_deriv_small`, `curve5077_twist7_central_bounds`, `mordellWeilRank_eq_three`, GrossZagierAndArithmeticHeights §§0.1, 8.4, 8.19, Tau Ceti `WeierstrassCurve.quadraticTwistOf`.

**Checks.**
- A small bound for |L′(E,1)| alone proves nothing; both the twisted nonvanishing and the height gap are used.
- The trace P_K, not the normalized average (1/h_K)P_K, enters the formula of §8.19; for K = ℚ(√−7), h_K = 1 and the two agree, but the height normalization relative to K (factor 2 for points of E(ℚ)) does not disappear.
- In the pinned Tau Ceti normalization the gap statement is `canonicalHeight P ≥ 1/4` for P ≠ 0 in E₅₀₇₇(ℚ).

<a id="s2-9"></a>

### 2.9 The modular unit on X₀(37)

References: GZ83, Corollary 6 and its proof, p. 87. Built on ModularForms (η, Δ = η²⁴, the Ligozat criterion), ModularCurves Layer 8 (X₀(37) over ℚ), and Mathlib `ModularForm.eta` and `ModularForm.discriminant_eq_q_prod`.

**The η-quotient u.** Define u(z) = (η(z)/η(37z))² on the upper half-plane. Prove `etaQuotient37_invariant`: u is invariant under Γ₀(37) (the Ligozat conditions hold: 1·2 + 37·(−2) = −72 ≡ 0 and 37·2 + 1·(−2) = 72 ≡ 0 mod 24, weight 0, and 37^(−2) is a square); `etaQuotient37_qExpansion`: u = q^(−3)∏_{n≥1}(1 − qⁿ)²/(1 − q^(37n))², with integer coefficients; and `etaQuotient37_divisor`: as a function on X₀(37), u has a pole of order 3 at the cusp ∞, a zero of order 3 at the cusp 0, and no other zeros or poles. By the q-expansion principle u is a rational function on X₀(37) defined over ℚ, of degree 3. Moreover u¹² = Δ(z)/Δ(37z). *Needs:* ModularForms worked examples (η, Δ = η²⁴, Ligozat criterion), ModularCurves Layer 8, Mathlib `ModularForm.eta`, `ModularForm.discriminant_eq_q_prod`, `ModularForm.discriminant_ne_zero`.

**Checks.**
- The order at ∞ is (1/24)(1·2 + 37·(−2)) = −3 and at 0 is (1/24)(37·2 + 1·(−2)) = +3; they sum to 0, as for any function on a compact curve.
- (η(z)/η(37z)) itself (exponents ±1) fails the Ligozat congruences (1 − 37 = −36 ≢ 0 mod 24), so the square is needed.
- The q-expansion begins q^(−3) − 2q^(−2) (from (1 − q)²) and has integer coefficients; its pole order 3 at ∞ is the degree of u as a map X₀(37) → ℙ¹, which is why u − c has exactly three zeros, with multiplicity, in §2.11.

<a id="s2-10"></a>

### 2.10 CM values of u at Heegner points of discriminant −139

References: GZ83, Corollary 6 and its proof, p. 87. Built on §§0.2, 2.9 and GrossZagierAndArithmeticHeights §8.15.

**The CM relation.** Let K = ℚ(√−139) (h = 3 by §0.2, with reduced forms (1,1,35), (5,±1,7)), H its Hilbert class field, [H:K] = 3, and 𝔫 one of the two ideals of 𝓞_K of norm 37 (37 splits). For each ideal class [a] let x_a ∈ X₀(37)(H) be the Heegner point of the cyclic isogeny ℂ/a → ℂ/a𝔫^(−1) (GrossZagierAndArithmeticHeights §8.15). Prove `etaQuotient37_cm_value`: u(x_a)¹² = λ¹², where λ ∈ 𝓞_K, of norm 37, generates the ideal conjugate to 𝔫 (λ is one of (3 ± √−139)/2). Proof: write a = ω⟨1, τ⟩, so that a𝔫^(−1) = (ω/37)⟨1, 37τ⟩; homogeneity of Δ of weight 12 gives Δ(τ)/Δ(37τ) = 37¹²Δ(a)/Δ(a𝔫^(−1)), and with 𝔫 = (μ), a𝔫^(−1) = μ^(−1)a, so Δ(a𝔫^(−1)) = μ¹²Δ(a) and the quotient is (37/μ)¹² = μ̄¹². Then prove `etaQuotient37_cm_value_eq`: all three values u(x_a) are equal to the same element ±λ of K. Proof: u is defined over ℚ and x_a ∈ X₀(37)(H), so u(x_a) ∈ H and u(x_a) = ζλ with ζ¹² = 1; since K contains neither i nor a primitive cube root of unity, K(i) and K(ζ₃) have degree 2 over K and are not contained in H, so ζ = ±1 and u(x_a) ∈ K; Gal(H/K) permutes the three points x_a (§8.15) and fixes u(x_a), so the three values coincide. *Needs:* `etaQuotient37_divisor`, `classNumber_eq_card_reducedForms`, GrossZagierAndArithmeticHeights §8.15 (Heegner points over H and the Galois action), Mathlib `ModularForm.discriminant_eq_q_prod`.

**Checks.**
- 37 = N((3 + √−139)/2) = (9 + 139)/4, and (−139/37) = 1, so 37 splits in K and the Heegner hypothesis of §8.15 holds at N = 37.
- The argument needs the twelfth roots of unity in H, not only the units of K: knowing u(x_a)/λ is a root of unity in H does not place it in K without the degree argument.
- The two choices of 𝔫 give conjugate Heegner points with values ±λ̄ and ±λ; the trace in §2.11 uses one choice.

<a id="s2-11"></a>

### 2.11 The conductor-37 Heegner trace vanishes

References: GZ83, Corollary 6, p. 87; GZ86, I, Proposition (7.4), p. 231. Built on §§2.3, 2.7, 2.9, 2.10, GrossZagierAndArithmeticHeights §8.15 and EllipticCurveModularity R29.5.

**Vanishing of L′(E₁₃₉,1).** Prove `heegnerTrace_37_eq_zero`: with K, 𝔫 and x_a as in §2.10, the divisor Σ_{[a]}(x_a) − 3(∞) on X₀(37) is principal, so the Heegner trace P_K = Σ_{[a]}(x_a − ∞) is 0 in J₀(37)(K) and its f-isotypic part vanishes for the newform f of `curve37`. Proof: with c the common value of §2.10, u − c has polar divisor 3(∞) (§2.9) and vanishes at the three distinct points x_a, so div(u − c) = Σ(x_a) − 3(∞). Then prove `heegnerTrace_139`: L′(E₁₃₉,1) = 0. Proof: f has root number +1 and L(f,1) ≠ 0 (`curve37_central_bounds`, §2.7); by GrossZagierAndArithmeticHeights §8.15 for f and K, L′(f/K,1) = L(f,1)·L′(f⊗χ_{−139},1) is a positive multiple of the height of the f-isotypic part of P_K, which is 0; f⊗χ_{−139} is the newform of E₁₃₉ (§2.1, §2.3), so L′(E₁₃₉,1) = 0. Through the modular parametrisation of EllipticCurveModularity R29.5 the same vanishing holds on the curve. *Needs:* `etaQuotient37_cm_value_eq`, `etaQuotient37_divisor`, `curve139_isQuadraticTwist`, `curve37_central_bounds`, GrossZagierAndArithmeticHeights §8.15, EllipticCurveModularity R29.5, RankZeroOneBSD §0.7.

**Checks.**
- The class number of ℚ(√−139) is computed directly from the reduced forms (1,1,35), (5,1,7), (5,−1,7) of §0.2, not taken from the final enumeration of Layer 5 (which depends on this subsection).
- L(f,1) ≠ 0 is needed: if L(f,1) = 0, the Gross–Zagier formula would say nothing about L′(f⊗χ,1).

<a id="s2-12"></a>

### 2.12 Gross–Zagier's rank-three example

References: GZ86, I, Proposition (7.4), p. 231. Built on §§2.4, 2.7, 2.11 and RankZeroOneBSD §§0.2, 0.5.

**Rank three for E₁₃₉.** Prove `rankThree_139`: ord_{s=1} L(E₁₃₉,s) = rank E₁₃₉(ℚ) = 3, with conductor 714877. Proof: L′(E₁₃₉,1) = 0 (§2.11) and root number −1 (§2.3) give order at least 3 by parity (RankZeroOneBSD §0.5); the bounds 1842/100 < L‴(E₁₃₉,1)/3! < 1844/100 of §2.7 give order exactly 3, and in particular L(E₁₃₉,·) is not identically zero, so the order is finite; the arithmetic rank is §2.4. *Needs:* `heegnerTrace_139`, `curve139_third_deriv_bounds`, `mordellWeilRank_eq_three`, `curve_local_data`, RankZeroOneBSD §§0.2, 0.5.

**Checks.**
- No statement about the Tate–Shafarevich group or the leading coefficient of the conjecture of Birch and Swinnerton-Dyer is made or used.
- The order is finite because a derivative is nonzero; the natural-number analytic order of Mathlib returns 0 for a function vanishing identically, so finiteness is stated separately.

<a id="s2-13"></a>

### 2.13 Buhler–Gross–Zagier's rank-three example

References: BGZ85 §§2, 4–5, pp. 476 and 478–481; GZ86, I §8, p. 232. Built on §§2.4, 2.7, 2.8 and RankZeroOneBSD §§0.2, 0.5.

**Rank three for E₅₀₇₇.** Prove `rankThree_5077`: ord_{s=1} L(E₅₀₇₇,s) = rank E₅₀₇₇(ℚ) = 3, with conductor 5077; L′(E₅₀₇₇,1) = 0 and 173/100 < L‴(E₅₀₇₇,1)/3! < 174/100. The same holds for the minus-y model. Proof: §2.8 gives L′ = 0 and order at least 3; §2.7 gives the bounds for L‴(1)/3!, which exclude 0; §2.4 gives the basis P₀, P₁, P₂. *Needs:* `heegnerHeight_gap` with the E₅₀₇₇ data, `curve5077_third_deriv_bounds`, `mordellWeilRank_eq_three`, `curve5077_minus_y_equation`, RankZeroOneBSD §§0.2, 0.5.

**Checks.**
- 10.38 < L‴(E₅₀₇₇,1) < 10.44 is a statement about the uncompleted L-function after the exact vanishing of L′(1), and it agrees with Ω·R = 1.7318499… of BGZ85, p. 480, times 3! only as a numerical observation, not as an input.
- The minus-y model is the same curve up to the isomorphism y ↦ −y, so no separate proof is needed for it.

### Examples

- E₅₀₇₇: Δ = 5077, basis (0,2), (1,0), (2,0) with regulator 0.41714…, L′(1) = 0 by the height gap with the twist by ℚ(√−7), L‴(1)/6 ≈ 1.73185.
- E₁₃₉: the −139 twist of y² + y = x³ + x² − 3x + 1, Δ = 37·139⁶, conductor 714877, independent points (−156, 77), (510, 9660), (1344, 48302), L′(1) = 0 by the vanishing of the Heegner trace on X₀(37).
- The η-quotient (η(z)/η(37z))² has q-expansion q^(−3) − 2q^(−2) + … and divisor 3(0) − 3(∞) on X₀(37).

### Dependencies

Layer 0 (§0.2 for the class number of ℚ(√−139)); Mathlib (Weierstrass curves and their formal L-functions, η and Δ, Mellin transforms); Tau Ceti (quadratic twists, `PointModTorsion`, `canonicalHeight`); TauCetiRoadmap EllipticCurves Layers 3–6, ModularForms, ModularCurves Layer 8; EllipticCurveModularity R29.3–R29.6; RankZeroOneBSD Layer 0; GrossZagierAndArithmeticHeights §§0.1, 8.4, 8.15, 8.19; EffectiveDiophantineMethods §§0.11, 3.2–3.22.

## Layer 3: uniform logarithmic class-number bounds

For a rational newform f of weight two whose L-function has a central zero of order at least three, put Ψ = L(f)L(f⊗λ) and G = L(f⊗χ_D)/L(f⊗λ), where f⊗λ is the coefficient-wise Liouville twist. Then ΨG = L(f)L(f⊗χ_D), whose completion is Λ(f)Λ(f⊗χ_D)/d, and Ψ has a simple zero at s = 1 coming from the pole of ζ(2s − 1) in the symmetric-square factorization, whatever the order of L(f) at 1. This layer verifies C1–C4 for these data, including every case in which d shares primes with the level, evaluates Oesterlé's constant for E₁₃₉ and E₅₀₇₇, and proves θ(d)·log d ≤ 7000·h for every K and θ(d)·log d ≤ 55·h when 5077 ∤ d.

Standing assumptions for this layer: f is a normalized newform of weight two on Γ₀(N) with rational coefficients a_n, attached to an elliptic curve over ℚ by EllipticCurveModularity R29.3; K is imaginary quadratic with discriminant −d and character χ = χ_{−d}. Series are first defined on their common half-plane of absolute convergence, Re s > 3/2, and then continued.

<a id="s3-1"></a>

### 3.1 The symmetric-square factorization of the Liouville product

References: O85 §2.3, formulas (2.3.1)–(2.3.3), p. 313. Built on AutomorphicLFunctionsAndLocalFactors AL.3 (`rs-global-poles`, `rs-boundary-nonvanishing`, `rs-vertical-strip-bounds`, `rs-global-functional-equation`), AnalyticNumberTheoryPartI §0.33 and Mathlib `riemannZeta_ne_zero_of_one_le_re`.

**The Liouville product and its local factors.** Define the Liouville twist L(f⊗λ, s) = Σ λ(n)a_n n^(−s) and Ψ_f(s) = L(f,s)L(f⊗λ,s), both absolutely convergent on Re s > 3/2 (|a_n| ≤ τ(n)√n). Prove `liouvilleProduct_eulerFactor`: at a prime p ∤ N with a_p = α + β, αβ = p, the Euler factor of Ψ_f is ((1 − α²p^(−2s))(1 − β²p^(−2s)))^(−1); at p ∥ N (a_p = ±1) it is (1 − p^(−2s))^(−1); at p with a_p = 0 it is 1. Define L(Sym² f, w) as the Euler product with factor ((1 − α²p^(−w))(1 − p^(1−w))(1 − β²p^(−w)))^(−1) at p ∤ N, (1 − p^(−w))^(−1) at p ∥ N, and, at p with p² | N where f is locally the quadratic twist of a newform g unramified at p, the good factor of g. At p ∤ N and p ∥ N this is Oesterlé's normalization (2.3.1); at p² | N he takes the factor 1, which differs from the one here by an Euler factor holomorphic and nonzero on Re w ≥ 2, and the factor here is the one for which the Rankin–Selberg continuation below applies directly. Hence

```text
L(Sym² f, 2s) = ζ(2s − 1) · Ψ_f(s) · ∏_{p | N} R_p(s)   on Re s > 3/2,
```

where R_p(s) = 1 − p^(1−2s) for p ∥ N (O85 (2.3.1)), and, for p² | N with f locally the quadratic twist of a newform g unramified at p (the case of E₁₃₉ at 139, g = the form of `curve37`), R_p(s) = ((1 − α_g²p^(−2s))(1 − β_g²p^(−2s)))^(−1) with α_g + β_g = a_p(g). Each R_p is holomorphic and nonzero on Re s ≥ 1 since |α²p^(−2s)| ≤ p^(−1) and |p^(1−2s)| ≤ p^(−1) there. *Needs:* Mathlib `ArithmeticFunction.liouville`, EllipticCurveModularity R29.4 (bad factors), RankZeroOneBSD §0.6.

**Continuation and the simple zero.** Prove `liouvilleProduct_C4`: Ψ_f extends holomorphically to an open neighbourhood of Re s ≥ 1, has a simple zero at s = 1 with Ψ_f′(1) = 2·L(Sym² f, 2)/∏_{p|N} R_p(1) ≠ 0, and M^sΓ(s)²Ψ_f(s) decreases faster than every power of |Im s| on every bounded vertical strip of the half-plane Re s ≥ 1, for every M > 0. Proof: define L(Sym² f, w) from the Rankin–Selberg function L(w − 1, π_f × π_f) (unitary normalization) divided by ζ(w − 1), corrected by the finitely many bad factors; by AL.3 the Rankin–Selberg function is holomorphic on Re w ≥ 2 except for a simple pole at w = 2 and has no zeros there (`rs-global-poles`, `rs-boundary-nonvanishing`), and ζ(w − 1) has a simple pole at w = 2 and no zeros on Re w ≥ 2, so L(Sym² f, ·) is holomorphic and nonzero on Re w ≥ 2, in particular at w = 2; the set where ζ(2s − 1) ≠ 0 is open and contains Re s ≥ 1 minus the pole, which gives the neighbourhood; ζ(2s − 1) ∼ 1/(2(s − 1)) at s = 1 gives the simple zero and the derivative; polynomial growth of the Rankin–Selberg function on strips (`rs-vertical-strip-bounds`) and of 1/ζ near the line Re = 1 (AnalyticNumberTheoryPartI §0.33), against the exponential decay of Γ(s)², give the strip decay. The simple zero holds also when ord_{s=1}L(f,s) > 3: it comes from ζ(2s − 1), not from L(f). *Needs:* `liouvilleProduct_eulerFactor`, AL.3 `rs-global-poles`, `rs-boundary-nonvanishing`, `rs-vertical-strip-bounds`, AnalyticNumberTheoryPartI §0.33, Mathlib `riemannZeta_ne_zero_of_one_le_re`.

**Checks.**
- At a good prime the product of the two Euler factors is ((1 − αp^(−s))(1 − βp^(−s))(1 + αp^(−s))(1 + βp^(−s)))^(−1) = ((1 − α²p^(−2s))(1 − β²p^(−2s)))^(−1): the Liouville twist has the factor (1 + αX)(1 + βX), not (1 − αX)(1 + βX).
- For E₅₀₇₇ (N = 5077 prime, a₅₀₇₇ = −1) the correction is R₅₀₇₇(s) = 1 − 5077^(1−2s); omitting it changes Ψ′(1) by the factor 1 − 1/5077.
- L(f⊗λ, s) is a coefficient series, not the L-function of a Dirichlet character: λ is not periodic, and L(f⊗λ) has no functional equation of its own.

<a id="s3-2"></a>

### 3.2 Goldfeld's modular analytic system

References: O85 §2.3, formulas (2.3.1)–(2.3.3), p. 313, and §4.1, Proposition 2, pp. 319–320. Built on §§1.2, 3.1, RankZeroOneBSD §§0.6, 0.7, 0.10 and EllipticCurveModularity R29.6.

**The system for coprime discriminants.** Prove `liouvilleSystem`: let f have level N, rational coefficients and ord_{s=1}L(f,s) ≥ 3. For K with gcd(d, N) = 1 and χ(−N) = 1, the data M = N/(4π²), Ψ = Ψ_f and G = L(f⊗χ)/L(f⊗λ) satisfy C1–C4 of §1.2. Proof: C1 for Ψ from |a_n| ≤ τ(n)√n and the factorization of §3.1; C1 for G by comparing local factors with those of (ζ_K(s − 1/2)/ζ(2s − 1))²; C2 with α_p, β_p from the factor of L(f⊗χ) and α′_p, β′_p from that of L(f⊗λ), all of absolute value at most √p; C3 because ΨG = L(f)L(f⊗χ) and goldfeldCompletion d M Ψ G = Λ(f)Λ(f⊗χ)/d (`goldfeldCompletion_product`, with N_χ = Nd² by RankZeroOneBSD §0.7), which is entire with root number w(f)w(f⊗χ) = w(f)²χ(−N) = +1 (RankZeroOneBSD §0.10) and vanishes to order at least 3 + 0 at 1; C4 by `liouvilleProduct_C4`. The sign hypothesis χ(−N) = 1 is not automatic from the order of L(f): for χ(−N) = −1 the product has root number −1. *Needs:* `liouvilleProduct_C4`, `goldfeldCompletion_product`, RankZeroOneBSD §§0.7, 0.10, EllipticCurveModularity R29.6.

**Checks.**
- At a prime p | d with p ∤ N, G_p(1) = 1 + a_p/p + 1/p, and |a_p| ≤ ⌊2√p⌋ gives G_p(1) ≥ 1 + 1/p − ⌊2√p⌋/p; this is the source of the factor 1 − ⌊2√p⌋/(p + 1) in θ(d) after division by 1 + 1/p.
- For f of E₅₀₇₇ and K = ℚ(√−23): 5077 ≡ 17 mod 23 and 17 is not a square mod 23, so χ(5077) = −1 and χ(−5077) = χ(−1)χ(5077) = 1, and the system applies. For K = ℚ(√−7), χ(5077) = 1 and χ(−5077) = −1: the system does not apply, and the split-prime branch of §3.7 is used instead.

<a id="s3-3"></a>

### 3.3 Ramified twist systems

References: O85 §4.2, p. 320, and §4.3, pp. 320–321. Built on §3.2, RankZeroOneBSD §§0.6, 0.10, EllipticCurves Layers 4–5 and AutomorphicLFunctionsAndLocalFactors `local-conductor-test-vector-comparison`.

**Overlapping conductors.** Prove `ramifiedTwistSystem`: when d and N share primes and the twist f⊗χ has the matching sign, replace the Euler factor of Ψ at each prime p with p² | gcd(N, d²) by the local factor L_p(f⊗χ, s) of the genuine newform twist, put G = L(f)L(f⊗χ)/Ψ and M = √(N N_χ)/(4π² d), with N_χ the conductor of the newform f⊗χ. These data satisfy C1–C4, and for fixed f the possible local conductor types, hence the scales M and the corrected factors, form a finite list. Proof: the coprime coefficient identity a_n(f⊗χ) = χ(n)a_n(f) fails at primes dividing both conductors, so the local factors there come from the local theory of twists (a multiplicative prime p ∥ N twisted by a character ramified at p becomes additive with conductor exponent 2 and trivial Euler factor; a prime where f is itself a quadratic twist of an unramified form becomes unramified after twisting by a character with the same ramification); check C1 and C2 case by case; `goldfeldCompletion_product` identifies the completion with Λ(f)Λ(f⊗χ)/d, preserving C3; C4 holds because the corrected Ψ differs from Ψ_f by finitely many factors holomorphic and nonzero on Re s ≥ 1. *Needs:* `liouvilleSystem`, `liouvilleProduct_C4`, `goldfeldCompletion_product`, RankZeroOneBSD §§0.6, 0.10, EllipticCurves Layer 4 (Tate's algorithm) and Layer 5 (twists), AutomorphicLFunctionsAndLocalFactors `local-conductor-test-vector-comparison`.

**The cases for E₁₃₉.** With f = f₁₃₉ of conductor 37·139², the scales are M = 37^α·139^β/(4π²) with α = 1 if 37 ∤ d and α = 1/2 if 37 | d, and β = 2 if 139 ∤ d and β = 0 if 139 | d. When 139 | d, the character χ_{−d}χ_{−139}, made primitive by removing the common ramification at 139, has a value ε = ±1 at 139, and the corrected factor at 139 is (1 + 4ε·139^(−s) + 139^(1−2s))^(−1), coming from a₁₃₉(`curve37`) = −4 (O85 §4.3, p. 320); when 139 ∤ d the factor at 139 is 1. Both signs ε = ±1 occur and both are treated.

**Checks.**
- a₁₃₉(`curve37`) = 139 + 1 − #(`curve37`)(𝔽₁₃₉) = −4, so the corrected factor is (1 − (−4)ε·139^(−s) + 139^(1−2s))^(−1).
- The value at 139 is that of the primitive character after removing the common ramification, not the value 0 of the naive pointwise product χ_{−d}·χ_{−139} at 139.
- For 37 | d, √(N N_χ)/(4π²d) has 37-part √(37·37²)/37 = 37^(1/2), matching α = 1/2.

<a id="s3-4"></a>

### 3.4 Oesterlé's constant for the two curves

References: O85 §3 (the construction of C), §4.1 (for M = N/(4π²): c₁ = 2π∏_{p|N}(p/(p − 1)) times the integral of |f(τ)|²·|dτ ∧ dτ̄| over a fundamental domain of Γ₀(N), and c₅ = πN^(3/2)/12), pp. 319–320, and §5.1, p. 321 (the constants 7000 and 55); O88 §9, pp. 66–67 (the consequences). Built on §§1.8, 3.2, 3.3, 2.12, 2.13 and GrossZagierAndArithmeticHeights §8.4.

**The explicit constants.** Prove `oesterleConstant_139`: for f = f₁₃₉ and each local case of §3.3 (the four scales M = 37^α·139^β/(4π²) and, when 139 | d, both signs ε at 139), the conclusion of `oesterleTechnical` holds with C = 7000 for every imaginary quadratic field K in that case for which the system of §3.2 or §3.3 applies. Prove `oesterleConstant_5077`: for f = f₅₀₇₇ and M = 5077/(4π²), the conclusion holds with C = 55 for every K with χ(5077) = −1, and with C replaced by a constant C₅₅ < 55 (so that the inequality is strict) when d is prime. Proof: C is the explicit function of §1.8, C = max(λ, (c₅/|c₁|)(1 + c₇(λ))), of the Taylor data c₁ = H(1) = MΨ′(1) and c₂ = H′(1)/H(1), the contour constant c₃ of §1.6 for a fixed admissible indentation, the strip integrals of §1.7 and the choice of λ. Bound each of these by rational numbers: c₁ through `liouvilleProduct_C4` and the value L(Sym² f, 2), which O85 (2.3.3), p. 313, expresses through the Petersson norm and GrossZagierAndArithmeticHeights §8.4 relates to the degree of the modular parametrisation; c₂ through the logarithmic derivative of the same factors at 1; c₃ and the strip integrals by explicit integration of γΨ along Δ; then verify the inequality C ≤ 7000 (respectively C ≤ 55, and C₅₅ < 55) for a chosen λ. The sources report the two constants without the intermediate values; computing them is part of the proof of these two theorems. *Needs:* `oesterleTechnical`, `ramifiedTwistSystem`, `liouvilleSystem`, `liouvilleProduct_C4`, `rankThree_139`, `rankThree_5077`, GrossZagierAndArithmeticHeights §8.4.

**Checks.**
- Every local case of §3.3 is a separate case of `oesterleConstant_139`: a computation covering only the coprime scale 37·139²/(4π²) does not prove the bound for d divisible by 37 or 139.
- The strict inequality log d < 55h on prime discriminants (§3.7) needs a constant strictly below 55, not only C ≤ 55.
- For M = N/(4π²), the leading ratio c₅/c₁ of O85 §4.1 has c₅ = (2π⁴/3)M^(3/2) = πN^(3/2)/12; a computation with c₅ = (2π⁴/3)M (wrong power of M) would be off by the factor M^(1/2) ≈ 11.3 for N = 5077.

<a id="s3-5"></a>

### 3.5 The discriminant −5077 does not occur

References: O85 §1.1, p. 311, and §5.1, p. 321. Built on §0.1 and Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`.

**Exclusion of −5077.** Prove `exceptional_5077`: no imaginary quadratic field has |disc K| = 5077. Negativity would force disc K = −5077, which is odd with −5077 ≡ 3 mod 4, so it satisfies neither branch of the fundamental-discriminant predicate, contradicting `isFundamentalDiscriminant_discr`. No class-number hypothesis is needed; consequently gcd(d, 5077) = 1 for every K with d prime, which is how §5.7 applies the coprime bound. *Needs:* `isFundamentalDiscriminant_discr`.

**Checks.**
- (−5077) mod 4 = 3 and (−5077) mod 8 = 3; `TauCeti.Multiquadratic.IsFundamentalDiscriminant (−5077)` is false (a decidable check).
- +5077 ≡ 1 mod 4 is squarefree and fundamental, the discriminant of the real field ℚ(√5077); the negativity of disc K is what excludes it.

<a id="s3-6"></a>

### 3.6 Oesterlé's universal bound

References: O85, Theorem 1, p. 310, and §§4.3, 5.1, pp. 320–321. Built on §§0.3, 0.4, 3.3, 3.4.

**The constant 7000.** Prove `global_7000`: for every imaginary quadratic field K, θ(d)·log d ≤ 7000·h(K). The statement includes d = 3, 4 and every d sharing primes with 37·139. Proof: for f₁₃₉ the sign condition of §3.2 is χ(−37·139²) = χ(−1)χ(37) = −χ(37) = 1 when 139 ∤ d. If 37 splits in K (χ(37) = 1), §0.4 gives log(d/4) ≤ h·log 37, which implies the bound since θ ≤ 1; if 37 is inert (χ(37) = −1), apply §1.8 with the system of §3.2 when 139 ∤ d and with the corrected system of §3.3 when 139 | d; if 37 ramifies, apply §1.8 with the corrected systems of §3.3; in each case use the constant 7000 of §3.4 (`oesterleConstant_139`); the factor ∏_{p∈P(d)} |G_p(1)|/(1 + 1/p) is at least θ(d) by the local bound of §3.2; the finitely many small d are checked directly. *Needs:* `oesterleTechnical`, `ramifiedTwistSystem`, `oesterleConstant_139`, `splitPrime_size`, `ramifiedWeight_le_one`, `rankThree_139`.

**Checks.**
- For odd h, θ(d) = 1 (§0.3), so the statement reads log d ≤ 7000h; for h = 1, d ≤ e^7000.
- d = 3, 4, 7, 8, 11, 19, 43, 67, 163 (class number one) satisfy log d ≤ log 163 < 6 ≤ 7000.

<a id="s3-7"></a>

### 3.7 The improved bound away from 5077

References: O85 §5.1, p. 321; O88 §9, p. 67; GZ86, I §8, bound (8.2), p. 232. Built on §§0.4, 3.2, 3.4, 3.5, 2.13.

**The constant 55.** Prove `coprime_55`: for every imaginary quadratic field K with gcd(d, 5077) = 1, θ(d)·log d ≤ 55·h(K); and `primeDiscriminant_55_strict`: if moreover d is prime, log d < 55·h(K). Proof: χ(5077) ≠ 0 by coprimality. If χ(5077) = 1, 5077 splits and §0.4 gives log(d/4) ≤ h log 5077 < 8.6h; if χ(5077) = −1, then χ(−5077) = χ(−1)χ(5077) = 1, which is the sign condition of §3.2 for N = 5077; apply §1.8 with the system of §3.2 for f₅₀₇₇, M = 5077/(4π²), the nonsplit factor at 5077 and the constant of §3.4 (`oesterleConstant_5077`). No bound with 55 is asserted when 5077 | d. *Needs:* `liouvilleSystem`, `oesterleTechnical`, `oesterleConstant_5077`, `splitPrime_size`, `rankThree_5077`.

**Checks.**
- At h = 3 and prime d ≠ 5077 the strict form gives log d < 165, hence d < e¹⁶⁵ < 10⁷².
- The coprimality hypothesis stays in the statement: for d divisible by 5077 the conductor of f₅₀₇₇ ⊗ χ changes and the system of §3.2 does not apply.
- log 5077 ≈ 8.53 < 55, so the split branch is far from the constant.

### Examples

- For f₅₀₇₇ and a field with χ(5077) = −1, the data of §3.2 are M = 5077/(4π²) ≈ 128.6, Ψ = L(f)L(f⊗λ) with the correction 1 − 5077^(1−2s), and G = L(f⊗χ)/L(f⊗λ).
- For f₁₃₉ and 139 | d, the corrected factor at 139 is (1 ± 4·139^(−s) + 139^(1−2s))^(−1), and M = 37^α/(4π²).
- Class number one fields satisfy log d ≤ log 163 ≈ 5.09, far inside both bounds.

### Dependencies

Layers 0–2 (§§0.3, 0.4, 1.1, 1.2, 1.8, 2.3, 2.12, 2.13); AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg poles, boundary nonvanishing, strip bounds, functional equation, twisted local factors); AnalyticNumberTheoryPartI §0.33; RankZeroOneBSD §§0.6, 0.7, 0.10; EllipticCurveModularity R29.3, R29.4, R29.6; EllipticCurves Layers 4–5; GrossZagierAndArithmeticHeights §8.4; Mathlib (`riemannZeta`, `ArithmeticFunction.liouville`).

## Layer 4: explicit constants and effective finiteness

The weighted bounds of Layer 3 are converted into bounds depending only on the number t of ramified primes: θ(d)^(−1) is dominated by a product over the first t − 1 primes, whose logarithm grows like 4√(t/log t). Genus theory bounds t by 1 + log₂ h, and a generous elementary estimate then yields an explicit rational κ(q) with h > κ(q)(log d)^(1−q) for every rational q > 0, and a computable cutoff for each class number. The comparison with Siegel's ineffective bound h ≫_η d^(1/2−η) is recorded without changing either theorem's quantifiers.

Standing assumptions for this layer: p_j = `Nat.nth Nat.Prime j` (p₀ = 2); c ≥ 0 real; t ∈ ℕ; natural subtraction t − 1 is 0 for t = 0.

<a id="s4-1"></a>

### 4.1 The prime-product majorant

References: GZ86, I §8, bound (8.2) and the sentence after it, p. 232; O85, Theorem 1, pp. 310–311. Built on Mathlib `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`.

**The majorant C_c(t).** Define `primeMajorant (c : ℝ) (t : ℕ) : ℝ` by C_c(t) = c·∏_{j=0}^{t−2} (p_j + 1)/(p_j + 1 − 2√p_j), the product being empty for t = 0, 1. Each denominator p + 1 − 2√p = (√p − 1)² is positive for p ≥ 2. Its API is `primeMajorant_zero` and `primeMajorant_one` (C_c(0) = C_c(1) = c), `primeMajorant_succ` (C_c(t + 1) = C_c(t)·(p_{t−1} + 1)/(p_{t−1} + 1 − 2√p_{t−1}) for t ≥ 1), `primeMajorant_pos` (C_c(t) > 0 for c > 0), and `primeMajorant_monotone` (t ↦ C_c(t) is nondecreasing for c ≥ 0, each factor exceeding 1). *Needs:* Mathlib `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Real.sqrt`.

**Checks.**
- C_7000(0) = 7000 and C_55(1) = 55.
- C_55(2) = 55·3/(3 − 2√2) = 165/(3 − 2√2) ≈ 961.8, the factor at p₀ = 2.
- C_55(3) = 165/(3 − 2√2)·4/(4 − 2√3) = 660/((3 − 2√2)(4 − 2√3)); replacing t − 1 by t in the range would give C_55(1) = 165/(3 − 2√2), which would break the prime-discriminant endpoint C_55(1) = 55.

<a id="s4-2"></a>

### 4.2 Prime-product domination of the ramified weight

References: O85, Theorem 1 and the factors 1 − ⌊2√p⌋/(p + 1), pp. 310–311; GZ86, I §8, p. 232. Built on §§0.3, 4.1 and Mathlib `Nat.add_two_le_nth_prime`.

**Domination and growth.** Prove `primeMajorant_weight`: for d > 1 with t distinct prime factors and c ≥ 0, θ(d)·C_c(t) ≥ c; and `primeMajorant_log_le`: for c > 0, log C_c(t) ≤ log c + 16√t. Proof: each floor factor satisfies 1 − ⌊2√p⌋/(p + 1) ≥ 1 − 2√p/(p + 1) = (p + 1 − 2√p)/(p + 1); the function p ↦ (p + 1)/(p + 1 − 2√p) = (p + 1)/(√p − 1)² is decreasing for p > 1, so after listing the t − 1 primes of P(d) increasingly, the i-th is at least p_i and its smooth factor is at most that of p_i; this gives θ(d)^(−1) ≤ ∏_{j<t−1}(p_j + 1)/(p_j + 1 − 2√p_j). The floor factors themselves are not monotone (1/3, 1/4, 1/3, 3/8 at 2, 3, 5, 7), so the comparison goes through the smooth factor. For the growth, log((p + 1)/(p + 1 − 2√p)) ≤ 8/√p for p ≥ 2 by elementary calculus, p_j ≥ j + 2, and Σ_{j<t−1} 8/√(j + 2) ≤ 16√t. *Needs:* `ramifiedWeight`, `primeMajorant`, Mathlib `Nat.add_two_le_nth_prime`.

**Checks.**
- d = 84: θ(84)·C_c(3) = (1/12)·c·(3/(3 − 2√2))·(4/(4 − 2√3)) ≈ (1/12)·c·17.49·7.46 ≈ 10.9c ≥ c.
- At p = 2 the smooth factor is 3/(3 − 2√2) ≈ 17.49, whose logarithm 2.86 is below 8/√2 ≈ 5.66; no prime number theorem is used.
- A comparison that assumed the floor factors decrease would conclude 1/4 ≥ 1/3 at (2, 3), which is false.

<a id="s4-3"></a>

### 4.3 Explicit t-dependent bounds

References: GZ86, I, bound (8.2), p. 232. Built on §§3.6, 3.7, 4.2.

**Bounds in terms of t.** Prove `explicitT_bound`: for every imaginary quadratic field K with t primes dividing d, log d ≤ C_7000(t)·h(K); and if gcd(d, 5077) = 1, log d ≤ C_55(t)·h(K). In particular, for prime d coprime to 5077, log d ≤ 55·h. Proof: multiply the weighted bounds of §§3.6–3.7 by C_c(t)/c and use θ(d)C_c(t) ≥ c; the case t = 1 uses the empty product. *Needs:* `global_7000`, `coprime_55`, `primeMajorant_weight`.

**Checks.**
- t ≥ 1 for every imaginary quadratic field (d ≥ 3), and C_55(1) = 55 recovers GZ86 (8.2) for prime discriminants.
- The two constants have different domains: C_7000 for all K, C_55 only when 5077 ∤ d.

<a id="s4-4"></a>

### 4.4 Prime sums over the first primes

References: GZ86, I §8, the sentence after (8.2), p. 232 (the asymptotic it requires); AnalyticNumberTheoryPartI §0.5 (Rosser–Schoenfeld bounds). Built on Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log` and Mathlib `Nat.nth`.

**The n-th prime and the sum of p^(−1/2).** Prove `nth_prime_isEquivalent`: p_n ∼ n log n as n → ∞, with p_n = `Nat.nth Nat.Prime n`; and `sum_inv_sqrt_nth_prime_isEquivalent`: Σ_{j<n} p_j^(−1/2) ∼ 2√(n/log n). Proof: invert the prime number theorem π(x) ∼ x/log x at x = p_n, where π(p_n) = n + 1 with zero-based indexing; by partial summation Σ_{p≤x} p^(−1/2) = ∫_{2^−}^x t^(−1/2)dπ(t) ∼ 2√x/log x; substitute x = p_{n−1} ∼ n log n, using log(n log n) ∼ log n. *Needs:* Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log`, AnalyticNumberTheoryPartI §0.5, Mathlib `Nat.nth`, `Nat.primeCounting`.

**Checks.**
- Indexing: p₀ = 2, p₁ = 3, p₄ = 11, and π(p_n) = n + 1; an off-by-one in the index does not change the asymptotic but does change every finite check.
- The sum is not ∼ 2√n: Σ_{j<n} p_j^(−1/2) ≤ Σ_{j<n} (j + 2)^(−1/2) ≤ 2√(n + 1), and the extra factor (log n)^(−1/2) is what the prime number theorem contributes.

<a id="s4-5"></a>

### 4.5 The asymptotic of the constant

References: GZ86, I §8, the sentence after (8.2), p. 232. Built on §§4.1, 4.4.

**Growth of log C_c(t).** Prove `primeMajorant_log_asymptotic`: for every fixed c > 0, log C_c(t)/(4√(t/log t)) → 1 as t → ∞ through ℕ. Proof: log((p + 1)/(p + 1 − 2√p)) = 2/√p + O(1/p) uniformly for p ≥ 2; sum over j < t − 1 with §4.4 (the omitted last factor and the shift by one are negligible), and bound Σ_{j<t} 1/p_j = O(log log t) as a lower-order term; the constant log c is negligible. *Needs:* `primeMajorant`, `sum_inv_sqrt_nth_prime_isEquivalent`.

**Checks.**
- The asymptotic does not depend on c (55 or 7000), and it is not used to compute κ: the effective statements of §§4.6–4.8 use only the elementary bound of §4.2.
- log C_c(t) = o(t^(1/2+ε)) for every ε > 0 but is not O(√t/log t): the exponent 1/2 with the factor (log t)^(−1/2) is sharp.

<a id="s4-6"></a>

### 4.6 The rational witness κ(q)

References: GZ86, I, Theorem (8.1), p. 232 (an effective constant for every positive loss in the exponent); O85, Theorem 1 and the genus consequence, pp. 310–311. The explicit rational formula is derived here. Built on Mathlib `Rat`, `Int.ceil`.

**The witness.** Define `effectiveKappa (q : ℚ) : ℚ` by κ(q) = 0 for q ≤ 0, κ(q) = 1/2 for q ≥ 1, and κ(q) = 2^(−(46 + ⌈256(1 − q)/q⌉)) for 0 < q < 1. It is computed by exact rational comparison, ceiling and integer powers, with no analytic limit or real-number oracle. Its API is `effectiveKappa_of_nonpos`, `effectiveKappa_of_one_le`, `effectiveKappa_pos` (κ(q) > 0 for q > 0), `effectiveKappa_of_pos_of_lt_one` (the displayed formula), and `effectiveKappa_monotoneOn` (κ is nondecreasing on (0, ∞), since ⌈256(1 − q)/q⌉ decreases with q and 2^(−46) < 1/2). The exponent comes from log C_7000(t) ≤ log 7000 + 16√t (§4.2), t ≤ 1 + log₂ h (§0.1), 16√(u/log 2) ≤ δu + 64/(δ log 2) with u = log h and δ = q/(1 − q), log 2 ≥ 1/2, e^x ≤ 2^(2x) for x ≥ 0 and 7000 < 2¹³, which together give C_7000(t) < 2^(45+⌈256/δ⌉)·h^δ; one more factor 2 makes the final inequality strict. *Needs:* Mathlib `Int.ceil`.

**Checks.**
- κ(0) = 0 and κ(1) = 1/2.
- κ(1/2) = 2^(−302): ⌈256·(1/2)/(1/2)⌉ = 256 and 46 + 256 = 302.
- κ(1/4) = 2^(−814): ⌈256·(3/4)/(1/4)⌉ = 768.

<a id="s4-7"></a>

### 4.7 The effective logarithmic class-number theorem

References: GZ86, I, Theorem (8.1), p. 232. Built on §§0.1, 4.2, 4.3, 4.6.

**The effective bound.** Prove `effectiveLogarithmic_bound`: for every imaginary quadratic field K and every rational q > 0, h(K) > κ(q)·(log d)^(1−q); and for every real ε ≥ q, h(K) > κ(q)·(log d)^(1−ε). So κ(q) is a uniform effective constant for every exponent loss at least q, and a real ε is handled by supplying a rational 0 < q ≤ ε. Proof: for 0 < q < 1 put u = log h and δ = q/(1 − q); genus theory gives t ≤ 1 + u/log 2, so C_7000(t) < 2^(45+⌈256/δ⌉)h^δ (§4.6); with log d ≤ C_7000(t)h (§4.3), h^(1+δ) > 2^(−(45+⌈256/δ⌉))log d; raise to the power 1/(1 + δ) = 1 − q and use the extra factor 2 for strictness. For q ≥ 1 use h ≥ 1 and κ = 1/2. Since d ≥ 3, log d > 1, so (log d)^(1−ε) ≤ (log d)^(1−q) for ε ≥ q. *Needs:* `effectiveKappa`, `explicitT_bound`, `primeMajorant_log_le`, `two_pow_sub_one_dvd_classNumber`, Mathlib `NumberField.classNumber_pos`.

**Checks.**
- At q = 1/2: h > 2^(−302)(log d)^(1/2); no Siegel zero, no generalized Riemann hypothesis and no unknown constant enters.
- The statement fails with κ(q) replaced by an unspecified "effectively computable" constant: the content is the explicit function.
- For q ≥ 1, (log d)^(1−q) ≤ 1 because log d > 1, so κ(q)(log d)^(1−q) ≤ 1/2 < 1 ≤ h: the case is trivial but must be covered for the statement to hold for every rational q > 0.

<a id="s4-8"></a>

### 4.8 Effective finiteness for a fixed class number

References: O85 §3.6, p. 319; GZ86, I §8, p. 232. Built on §§0.2, 4.7.

**A computable cutoff.** Prove `effective_cutoff`: if h(K) = H ≥ 1, then d < exp(2^604·H²) and d < B(H) := 2^(2^605·H²); consequently the imaginary quadratic fields of class number H are among the finitely many fundamental discriminants −d with d < B(H), and listing the reduced forms of §0.2 for each such d decides the list. Proof: square the case q = 1/2 of §4.7, log d < 2^604H², and use e^x ≤ 4^x. The bound is deliberately enormous; it expresses effectivity, not practicality. *Needs:* `effectiveLogarithmic_bound`, `classNumber_eq_card_reducedForms`.

**Checks.**
- B(1) = 2^(2^605) is a natural number given by an explicit formula; its decimal expansion is not needed to decide d < B(1).
- The cutoff concerns d = |disc K| with K imaginary quadratic; real quadratic fields are outside the statement.

<a id="s4-9"></a>

### 4.9 Effective logarithmic versus ineffective power bounds

References: G77 §1, p. 219; O85, Introduction, pp. 309–310; AnalyticNumberTheoryPartI §0.9 and §2.15.

**Comparison.** Record `effective_vs_siegel`: Siegel's theorem (AnalyticNumberTheoryPartI §2.15: for every η > 0 there is c_η > 0 with h ≥ c_η d^(1/2−η), the proof giving no procedure for c_η) and §4.7 hold together, with their quantifiers unchanged: §4.7 provides an explicit rational κ(q) and a weaker growth (log d)^(1−q); Siegel provides the stronger growth d^(1/2−η) with an existential constant. Neither implies an effective form of the other. The class-number value L(1, χ_D) = πh/(u√d) (AnalyticNumberTheoryPartI §2.18) translates both into lower bounds for L(1, χ_D). *Needs:* `effectiveLogarithmic_bound`, AnalyticNumberTheoryPartI §§0.9, 2.15, 2.18.

**Checks.**
- For d = 907, h = 3: §4.7 at q = 1/2 asks only 3 > 2^(−302)·(log 907)^(1/2) ≈ 2^(−302)·2.61, while L(1, χ_{−907}) = 3π/√907 ≈ 0.313 by §2.18.
- The comparison asserts no implication: an effective c_η does not follow from §4.7, and §4.7 does not follow from Siegel's theorem.

### Examples

- C_55(1) = 55, C_55(2) = 165/(3 − 2√2) ≈ 961.8, C_7000(3) ≈ 7000·17.49·7.46.
- κ(1/2) = 2^(−302), giving h > 2^(−302)√(log d) and d < 2^(2^605·H²) for class number H.
- p₄ = 11 and Σ_{j<5} p_j^(−1/2) = 2^(−1/2) + 3^(−1/2) + 5^(−1/2) + 7^(−1/2) + 11^(−1/2) ≈ 2.41, against 2√(5/log 5) ≈ 3.52: the asymptotic is approached slowly.

### Dependencies

Layers 0 and 3 (§§0.1, 0.2, 0.3, 3.6, 3.7); Mathlib (`Nat.nth`, `Nat.primeCounting`, `Int.ceil`, `NumberField.classNumber_pos`); Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log`; AnalyticNumberTheoryPartI §§0.5, 0.9, 2.15, 2.18.

## Layer 5: the sixteen fields of class number three

Class number three forces a prime discriminant −p with p ≡ 3 mod 4, so θ = 1 and the bound of §3.7 gives log p < 165, that is p < 10⁷². Two independent exclusion computations remove the range 907 < p < 10⁷²: Montgomery–Weinberger's phase argument at zeros of three auxiliary L-functions covers 10¹² ≤ p ≤ 10²⁵⁰⁰, and the least primes with prescribed quadratic-character patterns, combined with the split-prime obstruction of §0.4, cover 907 < p < 10¹². Below 907 the reduced forms are enumerated.

Standing assumptions for this layer: K is imaginary quadratic with h(K) = 3 where stated; for k > 0 with −k a fundamental discriminant, χ_{−k} is the primitive real character of conductor k attached to ℚ(√−k), odd (χ(−1) = −1), with values (−k/q) at odd primes q and the Kronecker value at 2.

<a id="s5-1"></a>

### 5.1 Class number three forces a prime discriminant

References: GZ86, I §8, p. 232 (genus divisibility); LLS70, pp. 445–446. Built on §§0.1, 0.2.

**Reduction to prime discriminants.** Prove `classThree_prime`: if h(K) = 3, then disc K = −p for a prime p ≡ 3 mod 4; in particular t = 1 and θ(p) = 1. Proof: 3 is odd, so 2^(t−1) | 3 forces t = 1 (§0.1); by `discr_of_card_primeFactors_eq_one`, disc K ∈ {−4, −8} or disc K = −p with p ≡ 3 mod 4; the reduced forms of discriminants −4 and −8 are (1,0,1) and (1,0,2) only, so those fields have h = 1. Moreover, if p ≡ 7 mod 8 then 2 splits and §0.4 gives p ≤ 4·2³ = 32. *Needs:* `two_pow_sub_one_dvd_classNumber`, `discr_of_card_primeFactors_eq_one`, `classNumber_eq_card_reducedForms`, `splitPrime_size`, `ramifiedWeight_prime_pow`.

**Checks.**
- −3 is a fundamental discriminant with h = 1; −243 = −3⁵ is not a field discriminant and is outside the statement.
- p = 23 and p = 31 are the two class-number-three primes ≡ 7 mod 8, both below 32.

<a id="s5-2"></a>

### 5.2 Hardy functions of odd real characters

References: MW74 §5, the approximate functional equation and the gamma factor for odd characters, pp. 539–540; DLMF §5.11, Stirling's series with the error bounds of §5.11(ii). Built on Mathlib `DirichletCharacter.LFunction`, `Complex.Gamma` and `Complex.log`.

**The completed function and its Hardy function.** For an odd primitive real character χ of conductor k, Λ(s, χ) = (k/π)^((s+1)/2)Γ((s + 1)/2)L(s, χ) is entire and satisfies Λ(1 − s, χ) = Λ(s, χ) (the root number of a real primitive character is 1). Define the Hardy function Z_χ(t) = e^(iϑ_χ(t))L(1/2 + it, χ), where ϑ_χ(t) is the continuous real argument of (k/π)^(it/2)Γ((3/2 + it)/2) with ϑ_χ(0) = 0. Prove `hardyZ_real`: Z_χ is real-valued and continuous on ℝ, and Z_χ(t) = 0 exactly when L(1/2 + it, χ) = 0. Prove `hardyTheta_stirling`: ϑ_χ(t) = (t/2)·log(k/π) + Im log Γ((3/2 + it)/2), with log Γ the branch continuous along the vertical line and real on the real axis, and for every integer J ≥ 1 the truncation of Stirling's series for log Γ((3/2 + it)/2) after J terms has error at most the explicit bound of DLMF §5.11(ii) (the first omitted term times a factor depending only on the argument of (3/2 + it)/2). Prove `hardyZ_approximate_functional_equation`: Z_χ(t) is given by the two rapidly convergent series of MW74 (8), p. 539 (Lavrik's form, with incomplete gamma functions), at s = 1/2 + it; truncating each after B terms leaves an error bounded by an explicit tail. Together these give explicit rational bounds for Z_χ(t) at rational t, which is how the sign statements of §5.3 are proved. *Needs:* Mathlib `DirichletCharacter.LFunction`, `Complex.Gamma`, GlobalNumberFields Layer 10 (primitivity and parity of χ_{−k}).

**Checks.**
- For an odd character the gamma factor is Γ((s + 1)/2), not Γ(s/2); with Γ(s/2), Λ(1 − s) = Λ(s) fails and the phase ϑ_χ is wrong by arg((1/2 + it)/2)-type terms, so sign changes of the resulting function need not be zeros.
- Z_χ(0) = L(1/2, χ) is real; for χ = χ_{−3} it is about 0.4808 > 0.
- Bounds for Z_χ(t) that straddle 0 say nothing about the sign; only one-sided bounds (an upper bound below 0 or a lower bound above 0) are used.

<a id="s5-3"></a>

### 5.3 The Montgomery–Weinberger zeros

References: MW74, Table I, p. 537, and §5, pp. 539–542. Built on §5.2, GlobalNumberFields Layer 10 and Mathlib `Nat.Prime`.

**Three zeros on the critical line.** Prove `mwZero_brackets`: for k = 17923, 115147, 123204 the character χ_{−k} has a zero 1/2 + iγ_k of L(s, χ_{−k}) with γ₁₇₉₂₃ ∈ [30985/10⁶, 30987/10⁶], γ₁₁₅₁₄₇ ∈ [3157/10⁶, 3159/10⁶] and γ₁₂₃₂₀₄ ∈ [10649/10⁶, 10651/10⁶]. Proof: −17923, −115147 and −123204 are fundamental discriminants (17923 is prime, 115147 = 113·1019, 123204 = 4·3·10267 with 10267 prime; −17923 ≡ −115147 ≡ 1 mod 4 and −123204 = 4·(−30801) with −30801 ≡ 3 mod 4 squarefree), so χ_{−k} is primitive of conductor k and odd; prove opposite strict signs of Z_χ at the two rational endpoints with the explicit bounds of §5.2 and apply the intermediate value theorem to the continuous real Z_χ. The statement asserts existence of a zero in each bracket, not that it is the lowest zero, not simplicity, and nothing about the generalized Riemann hypothesis; the brackets are refined as far as the phase inequalities of §5.4 require, and Table I of MW74 supplies only starting approximations. *Needs:* `hardyZ_real`, `hardyTheta_stirling`, `hardyZ_approximate_functional_equation`, Mathlib `Nat.Prime` (primality of 17923, 113, 1019 and 10267 by `norm_num`), `legendreSym`, `ZMod.χ₈`.

**Checks.**
- χ_{−17923}(−1) = −1 and χ_{−17923}(3) = (−17923/3) = −1 (17923 ≡ 1 mod 3); using +17923 instead would give (17923/3) = +1.
- The values at 2 are χ_{−17923}(2) = −1, χ_{−115147}(2) = −1 (−17923 ≡ −115147 ≡ 5 mod 8) and χ_{−123204}(2) = 0 (even discriminant); a Legendre symbol at 2 is not defined and cannot replace these.
- A small value of |L(1/2 + iγ, χ)| at a single point does not prove a zero; the sign change of the real Z_χ does.

<a id="s5-4"></a>

### 5.4 The Montgomery–Weinberger exclusion

References: MW74, Theorem, p. 530; §§2–4, Lemmas 1–9, pp. 530–539; §5, pp. 539–542. Built on §§0.2, 0.4, 5.1, 5.3 and GlobalNumberFields Layer 10.

**No class number three for 10¹² ≤ d ≤ 10²⁵⁰⁰.** Prove `montgomeryWeinberger`: no imaginary quadratic field with 10¹² ≤ d ≤ 10²⁵⁰⁰ has class number 3. Proof: by §5.1, d = p is prime, so gcd(p, k) = 1 for the three auxiliary conductors. MW's Lemma 1 (from the Epstein zeta functions of the reduced forms) writes (k√p/2π)^(s−1/2)Γ(s)L(s, χ_{−k})L(s, χ_{−k}χ_{−p}) as T(s) + T(1 − s) + U(s), where T(s) involves ζ(2s), the finite product ∏_{q|k}(1 − q^(−2s)) and the sum A(s) = Σ_Q χ_{−k}(a)a^(−s) over the three reduced forms Q = (a, b, c) of discriminant −p, and U(s) is an explicit series of Bessel functions. At s = 1/2 + iγ_k the left side vanishes, which gives M(γ_k)·|sin φ(γ_k)| ≤ γ_k·E(γ_k) with the amplitude M, phase φ and error E of MW (3)–(5). For h = 3 the two non-principal reduced forms have a ≥ (p/4)^(1/3) (MW Lemma 3, the norm form of §0.4), which with Lemma 4 bounds M from below; Lemma 5 shows φ(t) = t(C + log(k√p/8π)) up to explicit terms of order t³ and t·Σ_{q|k} log q/(q − 1), C being Euler's constant (every log-gamma term is kept); Lemmas 6–9 bound E. Hence φ(γ_k) lies within an explicit distance of a multiple of π, which confines log p to short windows spaced about 2π/γ_k apart. Verify, with explicit rational bounds and monotonicity of the phase on each subinterval, that the windows avoid the stated ranges: k = 17923 covers 10¹² ≤ p ≤ 10⁵², k = 115147 covers 10⁵² ≤ p ≤ 10²⁵⁰⁰ except the windows 10⁸⁵⁰ ≤ p ≤ 10⁸⁶⁰ and 10¹⁷⁰⁵ ≤ p ≤ 10¹⁷³⁵, and k = 123204 covers both windows; the closed intervals overlap at their endpoints. Only the existence of the three zeros is used. *Needs:* `mwZero_brackets`, `classThree_prime`, `splitPrime_size`, `classNumber_eq_card_reducedForms`, GlobalNumberFields Layer 10.

**Checks.**
- The theorem says nothing about 907 < d < 10¹²; that range is §5.6's, and MW's introduction refers to the earlier computation for it.
- Point evaluations of the phase at sample values of p do not prove a bound on an interval; the proof uses monotonicity on each subinterval.

<a id="s5-5"></a>

### 5.5 Least primes with a prescribed quadratic-character pattern

References: LLS70, the prescribed-character searches and tables, pp. 433–444, and Table III, p. 440. Built on GlobalNumberFields Layer 10 and Mathlib `legendreSym` and `Nat.Prime`.

**Inert patterns.** For x ≥ 2 call a prime p x-inert when p ≡ 3 mod 8 and (−p/q) = −1 for every odd prime q ≤ x; for p ≡ 3 mod 4 these are exactly the primes in which every prime q ≤ x is inert in ℚ(√−p), the condition at 2 being the Kronecker value χ_{−p}(2) = −1. Prove `leastInertPrime_43`, `leastInertPrime_67` and `leastInertPrime_163`: the least 43-inert prime is 1333963, the least 67-inert prime is 51599563 and the least 163-inert prime is 1432817816347 (LLS70, Table III, p. 440, column of least prime solutions, where the condition is written (N/p_i) = −(−1/p_i) with N ≡ 3 mod 8). Each is a finite statement: membership of the stated prime, and the absence of a smaller one, which a sieve over residue classes modulo the products of the small primes establishes. *Needs:* Mathlib `legendreSym`, `ZMod.χ₈`, `Nat.Prime`, GlobalNumberFields Layer 10 (the splitting of q in ℚ(√−p) read off from χ_{−p}(q)).

**Checks.**
- The condition at 2 is p ≡ 3 mod 8: a pattern that only asked p ≡ 3 mod 4 would admit p ≡ 7 mod 8, where 2 splits.
- 1333963 is 43-inert and 47-inert (Table III lists it for both 43 and 47), while the least 41-inert prime is 222643; the least integer N ≡ 3 mod 8 with the 43-pattern is the composite 77683 = 131·593, so the statement must ask for primes.
- The thresholds 1333963 and 51599563 can be checked by a direct search of the primes p ≡ 3 mod 8 below them; 1432817816347 needs the residue-class sieve.

<a id="s5-6"></a>

### 5.6 The small-range exclusion

References: LLS70, the class number three application, pp. 445–447, and Table III, p. 440. Built on §§0.2, 0.4, 5.1, 5.5.

**No class number three for 907 < d < 10¹².** Prove `smallRange_sieve`: no imaginary quadratic field with 907 < d < 10¹² has class number 3. Proof: by §5.1, d = p is a prime ≡ 3 mod 8 (p > 32); for 907 < p ≤ 318028 = 4·43³ enumerate the reduced forms of §0.2 and check h ≠ 3 directly; for p > 318028, §0.4 forces every prime q ≤ 43 to be inert, and `leastInertPrime_43` (§5.5) says that the least such prime is 1333963; since 4·67³ = 1203052 < 1333963, every q ≤ 67 is inert, and `leastInertPrime_67` says the least such prime is 51599563; since 4·163³ = 17322988 < 51599563, every q ≤ 163 is inert, and `leastInertPrime_163` says the least such prime is 1432817816347 > 10¹². The longer iteration of LLS70 with larger patterns is not needed for this range. *Needs:* `classThree_prime`, `splitPrime_size`, `classNumber_eq_card_reducedForms`, `leastInertPrime_43`, `leastInertPrime_67`, `leastInertPrime_163`.

**Checks.**
- 4·43³ = 318028, 4·67³ = 1203052, 4·163³ = 17322988 and 1432817816347 > 10¹² are exact integer facts used in the chain.
- The thresholds 1333963, 51599563 and 1432817816347 are least primes with the 43-, 67- and 163-patterns (LLS70, Table III); the least integers with the patterns may differ, and only primes matter here.

<a id="s5-7"></a>

### 5.7 The cutoff d ≤ 907

References: GZ86, I §8, p. 232; O88 §9, p. 67. Built on §§3.5, 3.7, 5.1, 5.4, 5.6.

**The cutoff.** Prove `classThree_cutoff`: if h(K) = 3 then d ≤ 907. Proof: by §5.1, d = p is prime with θ = 1; by §3.5, p ≠ 5077, so gcd(p, 5077) = 1 and §3.7 gives log p < 165; since 165 < 72·log 10, p < 10⁷² ≤ 10²⁵⁰⁰; split p > 907 into p < 10¹² (§5.6) and 10¹² ≤ p ≤ 10²⁵⁰⁰ (§5.4). *Needs:* `classThree_prime`, `exceptional_5077`, `primeDiscriminant_55_strict`, `smallRange_sieve`, `montgomeryWeinberger`, Mathlib `Real.exp_one_lt_d9` (for e¹⁶⁵ < 10⁷²).

**Checks.**
- 72·log 10 ≈ 165.78 > 165: from e < 2.7182818286 (`Real.exp_one_lt_d9`) and the exact rational inequality 2.7182818286¹⁶⁵ < 10⁷² (165·log₁₀ 2.7182818286 ≈ 71.66).
- The analytic bound alone gives only p < 10⁷²; both exclusion computations are needed to reach 907.

<a id="s5-8"></a>

### 5.8 The sixteen discriminants

References: GZ86, I §8, final paragraph, p. 232; LLS70, pp. 445–447; O85, Introduction, p. 309. Built on §§0.2, 5.7.

**The list.** Define `classThreeDiscriminants : Finset ℤ` as the set below and prove `classThree_enumeration`: for every imaginary quadratic field K, h(K) = 3 if and only if disc K ∈ {−23, −31, −59, −83, −107, −139, −211, −283, −307, −331, −379, −499, −547, −643, −883, −907}. All sixteen are negative fundamental discriminants, and the largest |disc K| is 907, attained by ℚ(√−907). Proof: by §5.7 it suffices to treat d ≤ 907; for each negative fundamental discriminant −d with d ≤ 907 count the reduced forms of §0.2 (an exact finite computation), and compare with the list; each listed d is a field discriminant by `isFundamentalDiscriminant_discr` in the converse direction (the field ℚ(√−d) has discriminant −d). *Needs:* `classThree_cutoff`, `classNumber_eq_card_reducedForms`, `isFundamentalDiscriminant_discr`, Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`.

**Checks.**
- d = 907: the reduced forms are (1,1,227), (13,9,19), (13,−9,19), so h = 3.
- d = 23 and d = 31 are the members ≡ 7 mod 8; the other fourteen are ≡ 3 mod 8.
- −243 is rejected by the fundamental-discriminant filter although b² − 4ac = −243 has reduced forms.

### Examples

- ℚ(√−907): h = 3, the primes 2, 3, 5 are inert, and the three reduced forms are listed above.
- The chain of §5.6: 318028 → 1333963 → 51599563 → 1432817816347.
- χ_{−17923}: primitive, odd, conductor 17923, with a zero 1/2 + iγ, γ ≈ 0.030986.

### Dependencies

Layers 0, 3 and 4 (§§0.1, 0.2, 0.4, 3.5, 3.7); Mathlib (`DirichletCharacter.LFunction`, `Complex.Gamma`, `legendreSym`, `ZMod.χ₈`); Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`; GlobalNumberFields Layer 10.

## Downstream consumers

No roadmap currently cites this one. Its natural consumers are further effective class-number problems (class numbers 4 to 100, imaginary quadratic orders, CM fields) and the explicit determination of CM points of small degree, all of which would cite Layer 1's technical theorem, Layer 2's rank-three theorems and the explicit constants of Layers 3–4.

## References

- **[O85]** Joseph Oesterlé, [Nombres de classes des corps quadratiques imaginaires](https://www.numdam.org/item/SB_1983-1984__26__309_0.pdf), Séminaire Bourbaki, exposé 631 (1983–84), Astérisque 121–122 (1985), 309–323. Used: Introduction and Theorem 1, pp. 309–311; §1 (quadratic fields, reduced forms, (1.3.1)–(1.3.2), §1.4), pp. 311–312; §2.3 ((2.3.1)–(2.3.3)), p. 313; §3 (conditions C1–C4, Theorem 2, Lemmas 1–3, (3.1.1)–(3.5.6)), pp. 314–319; §4 (Proposition 2, §§4.2–4.3), pp. 319–321; §5.1, p. 321.
- **[O88]** Joseph Oesterlé, [Le problème de Gauss sur le nombre de classes](https://doi.org/10.5169/seals-56588), L'Enseignement Mathématique 34 (1988), 43–67. Used: §8, p. 66 (the curves and the height argument); §9, pp. 66–67 (the constants and the class number three consequence).
- **[GZ86]** Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Inventiones mathematicae 84 (1986), 225–320. Used: Chapter I, §6 ((6.3)–(6.5)), p. 230; §7, Proposition (7.4), p. 231; §8, Theorem (8.1), bound (8.2) and the class number three consequence, p. 232.
- **[GZ83]** Benedict H. Gross and Don B. Zagier, [Points de Heegner et dérivées de fonctions L](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PointsHeegner/fulltext.pdf), C. R. Acad. Sci. Paris, Série I 297 (1983), 85–87. Used: Theorem 1 and Corollaries 2–6, pp. 85–87, in particular Corollary 6 and its proof, p. 87.
- **[BGZ85]** Joe P. Buhler, Benedict H. Gross and Don B. Zagier, [On the conjecture of Birch and Swinnerton-Dyer for an elliptic curve of rank 3](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.2307/2007967/fulltext.pdf), Mathematics of Computation 44 (1985), 473–481. Used: equation (2), p. 473; §§1–2 (heights, (7), the Mordell–Weil group and the regulator (8)), pp. 474–476; §4 ((10)–(14)), pp. 477–479; Table 2 and §5, p. 480.
- **[MW74]** Hugh L. Montgomery and Peter J. Weinberger, [Notes on small class numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa24/aa2457.pdf), Acta Arithmetica 24 (1974), 529–542. Used: Theorem, p. 530; §§2–4, Lemmas 1–9, pp. 530–539; Table I, p. 537; §5, pp. 539–542.
- **[LLS70]** D. H. Lehmer, Emma Lehmer and Daniel Shanks, [Integer sequences having prescribed quadratic character](https://oeis.org/A002189/a002189.pdf), Mathematics of Computation 24 (1970), 433–451. Used: the prescribed-character searches and tables, pp. 433–444; Table III, p. 440; the class number three application, pp. 445–447.
- **[G77]** Dorian M. Goldfeld, [The conjectures of Birch and Swinnerton-Dyer and the class numbers of quadratic fields](https://www.numdam.org/item/AST_1977__41-42__219_0.pdf), Astérisque 41–42 (1977), 219–227. Used: §1, p. 219, and §§2–5, pp. 220–225.
- **[DLMF]** [NIST Digital Library of Mathematical Functions](https://dlmf.nist.gov/5.11), §5.11, Stirling's series (5.11.1) and its error bounds, §5.11(ii).
- The supplier roadmaps cited by section above: TauCetiRoadmap [IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralLattices), [GlobalNumberFields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields), [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms), [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), [ContourIntegration](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ContourIntegration); [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md), [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md), [EllipticCurveModularity](../EllipticCurveModularity/README.md), [RankZeroOneBSD](../RankZeroOneBSD/README.md), [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md), [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md).
