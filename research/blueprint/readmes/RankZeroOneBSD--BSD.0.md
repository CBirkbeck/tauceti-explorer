# Rank-zero and rank-one Birch–Swinnerton-Dyer theory

This roadmap develops the analytic-rank-zero and analytic-rank-one theorems for elliptic curves over ℚ, the rational leading-term quotient, and the irreducible-prime BSD formulas. It connects modularity and analytic continuation to quadratic descent, Heegner points, Euler systems and Iwasawa theory. The final invariant is the positive rational BSD defect; its vanishing valuations express the prime-part formula.

It is Part II of the existing EllipticCurves roadmap. Import its group law, torsion, isogenies, Néron–Tate heights, regulator, reduction and statement-only BSD milestone. Import the generic Selmer, Tate–Shafarevich and Cassels–Tate theories from their owners. This roadmap owns the curve/newform analytic adapters and the quadratic comparisons required by its BSD arguments. Eisenstein primes and the global reconstruction at all primes belong to BSD.7–BSD.9, outside this part.

## Conventions and library boundary

Let E/ℚ be elliptic, N its conductor, and K an imaginary quadratic field of discriminant D. The completed L-function uses Γℂ(s)=2(2π)⁻ˢΓ(s). Its expression through Γℂ(s)L(E,s) is used on Re(s)>0; its entire continuation supplies values at the poles of the gamma factor. Functional-equation signs use the normalized Fricke involution.

Mathlib’s `WeierstrassCurve.LSeries` is a sum of a Dirichlet series. Its value is zero if the terms are not summable. The entire continuation below is therefore the analytic object at s=1. Absolute convergence is proved for Re(s)>3/2, without claiming an exact abscissa or nonsummability at every point below that bound.

Tau Ceti’s height pairing gives the regulator `E.regulator`; use Reg_BSD(E)=2ʳ·E.regulator in the leading-term formula. A rank-zero regulator is one. All Tate–Shafarevich cardinalities are taken after finiteness has been proved. Define the defect with the torsion-square factor so it agrees with the full BSD leading-term quotient.

For the complex period use the lattice Λω⊂ℂ obtained by integrating the chosen Néron differential on integral homology. Its covolume is Mathlib’s `ZLattice.covolumeL`. If aω is the invertible fractional differential ideal over 𝓞_K, use Ω(E/K)=Norm(aω)·4·covol(Λω), equivalently Norm(aω)·2∫|ω∧ω̄|. This fixes both the fractional-ideal norm and the complex-place factor.

Signed Iwasawa coefficients are geometric T_pE with their compact topology and continuous Galois action. Use Tau Ceti’s continuous H¹ at finite levels and corestriction-compatible inverse limits; local signed conditions are submodules of local cohomology. With generators fixed, Λ_K=ℤ_p[[X,Y]] and Λ_K^ur=W(𝔽̄_p)[[X,Y]]. The Coleman law is at v, and the logarithm law at v̄. BSTW §§2.2.4–2.2.5, printed pp.13–14, defines the cohomological lattice T_g with determinant χ_cyc⁻¹. Its twist T_g(1) is compared with V_pE through modularity and the polarization; an integral comparison with T_pE must track the modular-parametrization lattice index and chosen differential/Betti bases. The geometric coefficient here is T_pE, not T_pE(1).

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Native number-field finite generation, canonical heights and admissible-height/Northcott instances are imports. Current Tau Ceti also supplies the elliptic Tate module. The prototype uses a pin-compatible inverse-limit presentation of that existing object. IntegralLattices supplies the generic lattice/index comparisons; they are not rebuilt here.

## Layers and early exports

Every target in the eight layers has a statement, source, proof outline and prerequisite chain below. Definition APIs and tests are part of the target contract. Proof refinements with incomplete source or integral comparisons are listed explicitly at the end; no target is asserted formalized.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| RankZeroOneBSD:BSD.0 | 13 | 6 | planned |
| RankZeroOneBSD:BSD.1 | 10 | 5 | planned |
| RankZeroOneBSD:BSD.2 | 6 | 3 | planned |
| RankZeroOneBSD:BSD.3 | 3 | 2 | planned |
| RankZeroOneBSD:BSD.4 | 5 | 2 | planned |
| RankZeroOneBSD:BSD.5 | 12 | 6 | planned |
| RankZeroOneBSD:BSD.6 | 9 | 5 | planned |
| RankZeroOneBSD:BSD.6a | 10 | 5 | planned |

The dependency structure requires three early exports: BSD.0a supplies modular-symbol rationality to BSD.4 and BSD.5; BSD.3a supplies definite congruence periods to HE.6 and BSD.5; BSD.6z supplies the signed BSTW construction, laws and comparison to AC L5a and BSD.6a. The ordinary BSTW construction, laws and comparison belong to KatoEulerSystems L5. These placements precede their consumers and avoid circular dependence on the finished BSD theorems.

## BSD.0

Construct the actual analytic L-function and its completed continuation. Compare curve and modular-form coefficients, quadratic local factors and functional-equation signs, then obtain the base-change product and central identities.

### actual-l-function — The actual L-function of an elliptic curve over ℚ

Target `RankZeroOneBSD:BSD.0/actual-l-function` (construction). Atlas planet: **L-function of an elliptic curve over ℚ**.

Let E be a Weierstrass curve over ℚ with E.IsElliptic and conductor N. The coefficient sequence n ↦ (E.LFunction n : ℂ) of Mathlib's formal Euler product has finite abscissa of absolute convergence (at most 3/2) and an entire extension in Tau Ceti's sense LSeries.HasEntireExtension. ellipticL E : ℂ → ℂ is the unique entire function with ellipticL E s = E.LSeries s for every s with Re s > 3/2. It is the function the Birch–Swinnerton-Dyer statements are about: Mathlib's E.LSeries is a tsum, with value 0 wherever its defining series is not summable; ellipticL is used at s = 1 without asserting an unproved exact abscissa of convergence.

**Hypotheses.**

- E/ℚ elliptic; no semistability or other hypothesis.
- The extension is defined through modularity (EllipticCurveModularity R29.6); no continuation is assumed as a hypothesis.

**Construction or proof.**

1. Absolute convergence for Re s > 3/2: E.LFunction n = a_n(F_E) for all n ≥ 1 (rational-newform-bridge), and the cusp-form coefficient bound gives finite abscissa (Tau Ceti ModularForms Layer 7, abscissa ≤ k/2 + 1 = 2) and, by Deligne's bound in the weight-two case |a_p| ≤ 2√p, abscissa ≤ 3/2.
2. Existence: CuspForm.hasEntireExtension_qExpansion_coeff gives an entire extension of the coefficient series of F_E ∈ S₂(Γ₀(N)) (strict width one at ∞); transport it along the coefficient equality.
3. Uniqueness: LSeries.HasEntireExtension.unique (identity theorem on a connected half-plane); define ellipticL E as the witness of LSeries.HasEntireExtension.existsUnique.
4. Agreement on Re s > 3/2 rather than on the full convergence half-plane follows from LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.ellipticL` | constructor | For E/ℚ elliptic, the entire function ellipticL E : ℂ → ℂ. |
| `WeierstrassCurve.hasEntireExtension_LFunction` | other | LSeries.HasEntireExtension (fun n ↦ (E.LFunction n : ℂ)). |
| `WeierstrassCurve.ellipticL_eq_LSeries` | characterisation | For Re s > 3/2, ellipticL E s = E.LSeries s. |
| `WeierstrassCurve.differentiable_ellipticL` | structure | Differentiable ℂ (ellipticL E); in particular AnalyticOnNhd on ℂ. |
| `WeierstrassCurve.ellipticL_unique` | universal-property | If G is entire and G s = E.LSeries s on some half-plane Re s > c, then G = ellipticL E. |
| `WeierstrassCurve.ellipticL_eq_eulerProduct` | simp | For Re s > 3/2, ellipticL E s = ∏_ℓ P_ℓ(E, ℓ^{-s})^{-1} with P_ℓ = E.localPolynomial at ℓ, the product converging absolutely. |
| `WeierstrassCurve.ellipticL_ne_zero_of_re_gt` | other | ellipticL E s ≠ 0 for Re s > 3/2 (absolutely convergent Euler product). |
| `WeierstrassCurve.ellipticL_conj` | relation | ellipticL E (conj s) = conj (ellipticL E s); ellipticL E is real on the real axis. |
| `WeierstrassCurve.ellipticL_eq_of_isogenous` | compatibility | If E and E' are ℚ-isogenous then ellipticL E = ellipticL E' (equality of all local factors, EllipticCurves Layer 7). |
| `WeierstrassCurve.ellipticL_eq_of_variableChange` | compatibility | ellipticL is unchanged under a change of variables over ℚ (Mathlib's LFunction uses minimal models). |

**Consumers.**

- `RankZeroOneBSD:BSD.0/analytic-rank`: its order of vanishing at s = 1 is the analytic rank
- `RankZeroOneBSD:BSD.0/base-change-factorization`: L(E/K,s) is continued as the product of ellipticL E and ellipticL E^K
- `RankZeroOneBSD:BSD.5`: the numerator of the rational BSD defect is its leading Taylor coefficient at 1
- `EllipticCurves Layer 7 statement-only BSD milestone`: the analytic hypothesis there is discharged by this function: an analytic continuation agreeing with the Dirichlet series on part of its half-plane of convergence
- `JSW Conjecture 7.1.1`: L(E/F,s) means the continued Hasse–Weil L-function

**Unit tests.**

- `WeierstrassCurve.ellipticL_two` (characterisation): ellipticL E 2 = E.LSeries 2 for every E/ℚ elliptic.
- `WeierstrassCurve.LSeries_one_eq_zero_ne_ellipticL` (non-example): For E = 11a3, assuming the defining L-series terms are not summable at s = 1, E.LSeries 1 = 0 while ellipticL E 1 ≠ 0. The hypothesis is explicit; abscissa ≤ 3/2 does not imply nonsummability at every point below it.
- `WeierstrassCurve.ellipticL_eq_newformL` (compatibility): ellipticL E s = (h Γ₀(N))^{-s}-normalised Mathlib ModularForm.L of the newform F_E, i.e. its entire extension, for all s (strict width one, so the factor is 1).
- `WeierstrassCurve.ellipticL_isogenous_11` (compatibility): ellipticL (11a1) = ellipticL (11a3): isogenous curves have the same L-function.

**Prerequisites.** `mathlib:WeierstrassCurve.LFunction`, `mathlib:WeierstrassCurve.LSeries`, `mathlib:LSeries`, `mathlib:LSeries.abscissaOfAbsConv`, `tauceti:LSeries.HasEntireExtension`, `tauceti:LSeries.HasEntireExtension.unique`, `tauceti:LSeries.HasEntireExtension.existsUnique`, `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re`, `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`, `EllipticCurveModularity:R29.6/l-function-continuation`, `RankZeroOneBSD:BSD.0/rational-newform-bridge`, `tauceti:TauCeti.Isogeny`.

**Sources.**

- [TauCeti/NumberTheory/LSeries/EntireExtension.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/EntireExtension.lean), TauCeti/NumberTheory/LSeries/EntireExtension.lean, docstring of HasEntireExtension: The predicate whose unique witness is ellipticL.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Conjecture 7.1.1(a), p. 41: The analytic object of the BSD statements is the continuation, not the Dirichlet series.

**Acceptance.**

- ellipticL E 2 = E.LSeries 2, and both equal the absolutely convergent Euler product at s = 2.
- For E = 11a3, ellipticL E 1 ≠ 0. Whenever the defining series at 1 is not summable, E.LSeries 1 = 0, so that value cannot be substituted for the continuation.

### completed-l-function — The completed L-function and the root number

Target `RankZeroOneBSD:BSD.0/completed-l-function` (definition). Atlas planet: **Root number**.

For E/ℚ elliptic of conductor N, completedEllipticL E is the unique entire continuation of s ↦ N^{s/2} Γ_ℂ(s) ellipticL E s from Re s > 0, where Γ_ℂ(s)=2(2π)^{-s}Γ(s). This product formula is asserted only there; at Gamma poles use the continuation. It satisfies Λ(E,s)=w_E Λ(E,2−s) for a unique sign rootNumber E∈ℤˣ. With the normalised Fricke involution supplied by ModularForms Layer 6, w_E=−ε_N(F_E). The pinned raw TauCeti.frickeOperator has no normalising scalar and does not directly supply that involution.

**Hypotheses.**

- E/ℚ elliptic; N is the conductor of E, equal to the level of F_E (EllipticCurveModularity R29.4/exact-conductor).
- Γ_ℂ convention: Λ(E,s) here is 2 × the function N^{s/2}(2π)^{-s}Γ(s)L(E,s) of R29.6 and of BFH; the factor 2 does not change the sign w_E.

**Construction or proof.**

1. Construct the entire Mellin transform through R29.6 and identify it with N^{s/2} Γ_ℂ(s) ellipticL E s on Re s > 0. Choose this witness and prove uniqueness by the identity theorem. Do not define the value at s=0 by a pointwise total Gamma product: Gammaℂ 0=0 in Lean whereas Λ(E,0)=w_E Λ(E,2)≠0.
2. Functional equation: R29.6/l-function-continuation gives Λ(E,s) = w_E Λ(E,2−s) with w_E the eigenvalue of −W_N on F_E.
3. Uniqueness of the sign: completedEllipticL E 2 ≠ 0 (Euler product), so ε with Λ(s) = εΛ(2 − s) is determined by evaluating at s = 2 and s = 0.
4. Comparison with Tau Ceti ModularForms Layer 6–7: the companion equation Λ_N(k−s,f) = i^k Λ_N(s, 𝒲_N f) with k = 2 gives the sign −ε_N.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.completedEllipticL` | constructor | completedEllipticL E : ℂ → ℂ, the unique entire continuation of the Gamma product from Re s > 0. |
| `WeierstrassCurve.differentiable_completedEllipticL` | structure | completedEllipticL E is entire. |
| `WeierstrassCurve.rootNumber` | data | rootNumber E : ℤˣ, the sign of the functional equation. |
| `WeierstrassCurve.completedEllipticL_two_sub` | relation | completedEllipticL E (2 − s) = rootNumber E * completedEllipticL E s. |
| `WeierstrassCurve.rootNumber_eq_neg_fricke` | compatibility | rootNumber E = −ε_N(F_E), the negative of the eigenvalue of Tau Ceti's normalised Fricke operator on the newform of E. |
| `WeierstrassCurve.rootNumber_eq_of_isogenous` | compatibility | Isogenous curves have equal root numbers. |
| `WeierstrassCurve.rootNumber_eq_prod_local` | relation | rootNumber E = ∏_v w_v(E) over all places, w_∞ = −1, w_ℓ = −a_ℓ at multiplicative ℓ and w_ℓ = 1 at good ℓ (local ε-factors, GL2AutomorphicRepresentationsAndTransfer R16.3). |
| `WeierstrassCurve.completedEllipticL_one` | simp | completedEllipticL E 1 = N^{1/2} π^{-1} ellipticL E 1 (Γ_ℂ(1) = π^{-1}). |
| `WeierstrassCurve.exists_completedEllipticL` | constructor | There is an entire F agreeing with N^{s/2} Gammaℂ(s) ellipticL E s for Re s > 0. |
| `WeierstrassCurve.completedEllipticL_eq_gammaProduct` | characterisation | If Re s > 0, completedEllipticL E s = N^{s/2} Gammaℂ(s) ellipticL E s. |
| `WeierstrassCurve.completedEllipticL_unique` | universal-property | Two entire functions agreeing with that product on Re s > 0 are equal. |

**Consumers.**

- `RankZeroOneBSD:BSD.0/root-number-parity`: the sign forces the parity of the order at s = 1
- `RankZeroOneBSD:BSD.0/twist-root-number`: w(E^D) = χ_D(−N)w(E)
- `BFH90, Introduction`: ε selects which quadratic twists can have nonvanishing central value or derivative
- `RankZeroOneBSD:BSD.3`: analytic rank one forces w_E = −1, which selects the value branch of BSD.2

**Unit tests.**

- `WeierstrassCurve.rootNumber_37a` (computation): rootNumber (37a1 : y² + y = x³ − x) = −1, while the Fricke eigenvalue of its newform is +1.
- `WeierstrassCurve.rootNumber_11a` (computation): rootNumber (11a1) = +1 (a₁₁ = 1, split multiplicative, w₁₁ = −1, w_∞ = −1).
- `WeierstrassCurve.completedEllipticL_one_eq` (degenerate): completedEllipticL E 1 = Real.sqrt N / π · ellipticL E 1.
- `WeierstrassCurve.rootNumber_ne_fricke` (non-example): For 37a1, rootNumber E ≠ ε_N(F_E): the tempting definition rootNumber := Fricke eigenvalue has the wrong sign in weight two.
- `WeierstrassCurve.completedEllipticL_zero` (non-example): completedEllipticL E 0 = rootNumber E * completedEllipticL E 2 ≠ 0, detecting the wrong pointwise Gamma product at zero.

**Prerequisites.** `mathlib:Complex.Gammaℂ`, `RankZeroOneBSD:BSD.0/actual-l-function`, `EllipticCurveModularity:R29.6/l-function-continuation`, `EllipticCurveModularity:R29.4/exact-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCeti.Isogeny`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The completed function and its sign, for k = 2 and M = N.
- [Roadmap: modular forms (Tau Ceti), Layers 6–7](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md), ModularForms README, Layer 6: The relation w_E = −ε_N(F_E) for weight two.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, after (5.2), p. 243 (read from the page image): The same relation, with ε the eigenvalue of the Fricke involution on f.

**Acceptance.**

- w(11a1) = +1 and w(37a1) = −1.
- rootNumber is invariant under ℚ-isogeny (equal L-functions and conductors).

### analytic-rank — Analytic rank and the leading coefficient at s = 1

Target `RankZeroOneBSD:BSD.0/analytic-rank` (definition). Atlas planet: **Analytic rank**.

For E/ℚ elliptic, analyticRank E := analyticOrderNatAt (ellipticL E) 1 ∈ ℕ, and analyticOrderAt (ellipticL E) 1 ≠ ⊤. The leading coefficient is leadingTerm E := iteratedDeriv r (ellipticL E) 1 / r! with r = analyticRank E; it is a nonzero real number, and ellipticL E s = (s − 1)^r (leadingTerm E + O(s − 1)) near s = 1. In particular analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0.

**Hypotheses.**

- Defined on the entire continuation ellipticL E, never on Mathlib's tsum E.LSeries.
- Finiteness uses only that ellipticL E is entire and not identically zero (it is nonzero at s = 2).

**Construction or proof.**

1. ellipticL E is analytic on the connected set ℂ and nonzero at s = 2 (ellipticL_ne_zero_of_re_gt), so its order at 1 is finite (identity theorem; AnalyticAt.analyticOrderAt_ne_top).
2. The factorisation (s − 1)^r g(s) with g(1) ≠ 0 gives g(1) = iteratedDeriv r (ellipticL E) 1 / r! by Taylor's formula.
3. Reality: ellipticL E is real on ℝ (actual-l-function, ellipticL_conj), hence so are all derivatives at 1.
4. The order-zero and order-one criteria are analyticOrderAt_eq_zero and the r = 1 case of the factorisation.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.analyticRank` | constructor | analyticRank E = analyticOrderNatAt (ellipticL E) 1. |
| `WeierstrassCurve.analyticOrderAt_ellipticL_ne_top` | other | analyticOrderAt (ellipticL E) 1 ≠ ⊤, and analyticOrderAt (ellipticL E) 1 = analyticRank E. |
| `WeierstrassCurve.analyticRank_eq_zero_iff` | characterisation | analyticRank E = 0 ↔ ellipticL E 1 ≠ 0. |
| `WeierstrassCurve.analyticRank_eq_one_iff` | characterisation | analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0. |
| `WeierstrassCurve.leadingTerm` | data | leadingTerm E = iteratedDeriv (analyticRank E) (ellipticL E) 1 / (analyticRank E)! as a real number. |
| `WeierstrassCurve.leadingTerm_ne_zero` | other | leadingTerm E ≠ 0. |
| `WeierstrassCurve.leadingTerm_of_analyticRank_eq_zero` | simp | analyticRank E = 0 → leadingTerm E = ellipticL E 1. |
| `WeierstrassCurve.leadingTerm_of_analyticRank_eq_one` | simp | analyticRank E = 1 → leadingTerm E = deriv (ellipticL E) 1. |
| `WeierstrassCurve.ellipticL_isBigO_leading` | characterisation | ellipticL E s − leadingTerm E (s − 1)^r = O((s − 1)^{r+1}) as s → 1. |
| `WeierstrassCurve.analyticRank_eq_of_isogenous` | compatibility | Isogenous curves have equal analytic rank and leading term. |

**Consumers.**

- `RankZeroOneBSD:BSD.3`: the hypothesis analyticRank E = 1 of the rank-one theorem
- `RankZeroOneBSD:BSD.4`: the hypothesis analyticRank E = 0
- `RankZeroOneBSD:BSD.5`: leadingTerm E is the numerator of the rational BSD defect
- `JSW Theorem 1.2.1`: ord_{s=1} L(E,s) = 1 and L′(E,1) in the p-part formula

**Unit tests.**

- `WeierstrassCurve.analyticRank_eq_zero_iff_test` (degenerate): analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and then leadingTerm E = ellipticL E 1.
- `WeierstrassCurve.analyticRank_37a` (computation): analyticRank (37a1) = 1.
- `WeierstrassCurve.analyticRank_eq_newform` (compatibility): analyticRank E equals Tau Ceti ModularForms Layer 7's analytic rank of F_E (order of its entire continuation at the centre k/2 = 1).
- `WeierstrassCurve.analyticRank_unitary_centre` (compatibility): analyticRank E = analyticOrderNatAt (fun s ↦ ellipticL E (s + 1/2)) (1/2): the unitary centre s = 1/2 of L(s, π_E) is the motivic centre 1 (GZ.0/unitary-and-motivic-centres).
- `WeierstrassCurve.leadingTerm_not_halved` (non-example): For analytic rank one, leadingTerm E = deriv (ellipticL E) 1, not deriv (ellipticL E) 1 / 2: the factor is 1/r! = 1.

**Prerequisites.** `mathlib:analyticOrderAt`, `mathlib:analyticOrderNatAt`, `mathlib:AnalyticAt.analyticOrderAt_ne_top`, `mathlib:analyticOrderAt_eq_zero`, `mathlib:iteratedDeriv`, `mathlib:Nat.factorial`, `RankZeroOneBSD:BSD.0/actual-l-function`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Sources.**

- [Mathlib/Analysis/Analytic/Order.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean), Mathlib/Analysis/Analytic/Order.lean, docstring of analyticOrderAt: The Mathlib notion applied to ellipticL E at s = 1.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Conjecture 1.1.1(a), p. 1: Analytic rank is the order of the zero at s = 1.
- [Roadmap: modular forms (Tau Ceti), Layers 6–7](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md), ModularForms README, Layer 7: The same discipline for newforms; the two notions agree through the rational newform bridge.

**Acceptance.**

- analyticRank (11a1) = 0 and analyticRank (37a1) = 1, with the nonvanishing certified by BSD.9's rigorous enclosures.

### root-number-parity — Root-number parity of the analytic rank

Target `RankZeroOneBSD:BSD.0/root-number-parity` (theorem). Atlas planet: **Root-number parity**.

For every E/ℚ elliptic, (−1)^{analyticRank E} = rootNumber E. Consequently rootNumber E = −1 implies ellipticL E 1 = 0, and analyticRank E = 1 implies rootNumber E = −1.

**Hypotheses.**

- E/ℚ elliptic.

**Construction or proof.**

1. Write Λ = completedEllipticL E and r = analyticRank E. The factor N^{s/2}Γ_ℂ(s) is analytic and nonzero at s = 1, so ord_{s=1} Λ = r.
2. The functional equation Λ(1 + t) = w_E Λ(1 − t) compares Taylor coefficients at t = 0: c_k = w_E (−1)^k c_k.
3. Taking k = r, where c_r ≠ 0, gives (−1)^r = w_E.

**Prerequisites.** `RankZeroOneBSD:BSD.0/completed-l-function`, `RankZeroOneBSD:BSD.0/analytic-rank`, `mathlib:analyticOrderAt`, `mathlib:iteratedDeriv`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The parity relation, for k = 2.

**Acceptance.**

- 37a1: w = −1 and analyticRank = 1; 11a1: w = +1 and analyticRank = 0.
- For the congruent-number twists (congruent-number-root-numbers) the parity of the analytic rank is read off n mod 8.

### quadratic-field-character — The quadratic character of a quadratic field

Target `RankZeroOneBSD:BSD.0/quadratic-field-character` (comparison).

Let K be a quadratic number field with discriminant D_K = NumberField.discr K (a fundamental discriminant) and χ_K := kroneckerCharacter D_K (ClassicalArithmeticCompletion CA.1). Then for every rational prime ℓ: χ_K(ℓ) = 1 if ℓ splits in K, −1 if ℓ is inert, 0 if ℓ ramifies (equivalently ℓ | D_K); for ℓ ∤ D_K and any arithmetic Frobenius σ at a prime above ℓ, χ_K(ℓ) = quadraticCharacter ℚ K σ (Tau Ceti); and χ_K(−1) = sign D_K, so K is imaginary iff χ_K(−1) = −1.

**Hypotheses.**

- K/ℚ quadratic, as a number field with Algebra.IsQuadraticExtension ℚ K.
- χ_K is a primitive Dirichlet character of conductor |D_K| (CA.1/kronecker-character-is-primitive).

**Construction or proof.**

1. Write K = ℚ(√d) with d squarefree; D_K = d or 4d (Mathlib Int.IsFundamentalDiscr, Tau Ceti IsFundamentalDiscriminant).
2. For odd ℓ ∤ d, ℓ splits iff d is a square mod ℓ (Dedekind–Kummer); Tau Ceti's NumberField.isArithFrobAt_multiquadratic_eq_one_iff states the Frobenius form, and kroneckerCharacter D_K (ℓ) = legendreSym ℓ D_K by CA.1.
3. For ℓ = 2 ∤ D_K (d ≡ 1 mod 4), 2 splits iff d ≡ 1 mod 8, matching kroneckerCharacter's value at 2.
4. Ramified primes are exactly ℓ | D_K (discriminant criterion), where χ_K vanishes.
5. The pinned multiquadratic Frobenius theorem covers odd unramified primes only. Obtain the prime 2 splitting criterion and identification of the discriminant Kronecker character with the quadratic Galois character from the requested arithmetic/local exports; do not infer them from that theorem.

**Prerequisites.** `ClassicalArithmeticCompletion:CA.1/kronecker-character`, `ClassicalArithmeticCompletion:CA.1/kronecker-character-is-primitive`, `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter`, `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff`, `mathlib:IsArithFrobAt`, `mathlib:NumberField.discr`, `mathlib:Int.IsFundamentalDiscr`, `mathlib:Algebra.IsQuadraticExtension`, `ClassicalArithmeticCompletion:CA.1`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The dictionary between D, χ_D and ℚ(√D).

**Acceptance.**

- K = ℚ(√−7): D_K = −7, χ_K(2) = 1 (2 splits), χ_K(3) = −1 (3 inert), χ_K(7) = 0.
- K = ℚ(i): D_K = −4, χ_K = χ₄.

### finite-field-twist-trace — Trace of Frobenius of a twist over a finite field

Target `RankZeroOneBSD:BSD.0/finite-field-twist-trace` (lemma).

Let F be a finite field with q elements and E an elliptic Weierstrass curve over F, a_q(E) := q + 1 − #E(F). (i) If char F ≠ 2 and d ∈ Fˣ, the twist E_d := E.quadraticTwistOf 0 (−d/4) (discriminant D = d) satisfies a_q(E_d) = quadraticChar F d · a_q(E); this includes d a square, where E_d ≅ E and the factor is 1. (ii) If char F = 2 and E_c := E.quadraticTwistOf 1 c (discriminant 1, the Artin–Schreier twist by x² − x + c), then a_q(E_c) = (−1)^{Tr_{F/𝔽₂}(c)} · a_q(E).

**Hypotheses.**

- E elliptic over a finite field; for (i) char F odd.
- The twist is Tau Ceti's quadraticTwistOf; its Weierstrass model is elliptic when D ≠ 0.

**Construction or proof.**

1. Odd characteristic: complete the square, y² = f(x) with f a cubic; the twist is d y² = f(x) up to a change of variables (Tau Ceti exists_smul_quadraticTwistOf_eq).
2. Count points: for each x ∈ F there are 1 + χ(f(x)) points on E and 1 + χ(d f(x)) = 1 + χ(d)χ(f(x)) on E_d; add the point at infinity and sum.
3. Characteristic two: for a₁x+a₃≠0 divide the equation to obtain an Artin–Schreier equation, whose trace obstruction changes by Tr(c). For a₁x+a₃=0, y↦y² is bijective and both curves have exactly one point above x; this contribution has zero trace sign and must be handled separately.

**Prerequisites.** `tauceti:WeierstrassCurve.quadraticTwistOf`, `mathlib:quadraticChar`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Sources.**

- [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistOf: The characteristic-free twist used in both parts.

**Acceptance.**

- Over 𝔽₅, E : y² = x³ + x + 1 has 9 points (a = −3); with d = 2 (a nonsquare) the twist 2y² = x³ + x + 1 has 3 points (a = 3).
- d = 4 (a square in 𝔽₅) gives the same count 9.

### twist-local-factors — Local Euler factors of a quadratic twist

Target `RankZeroOneBSD:BSD.0/twist-local-factors` (theorem). Atlas planet: **Twist Euler factors**.

Let E/ℚ be elliptic, K a quadratic field with character χ = χ_K and E^K := E.quadraticTwist K. (a) For every prime ℓ ∤ D_K, E^K has the same reduction type as E at ℓ and its local polynomial is P_ℓ(E^K, T) = P_ℓ(E, χ(ℓ)T): at good ℓ, a_ℓ(E^K) = χ(ℓ)a_ℓ(E); at multiplicative ℓ, split and nonsplit reduction are exchanged exactly when χ(ℓ) = −1; at additive ℓ both factors are 1. (b) For ℓ | D_K, P_ℓ(E^K, T) = det(1 − Frob_ℓ T | (V_r(E) ⊗ χ_ℓ)^{I_ℓ}) for any prime r ≠ ℓ, where χ_ℓ is the local character of K at ℓ; in particular if E has good or multiplicative reduction at ℓ then E^K has additive reduction at ℓ and P_ℓ(E^K, T) = 1.

**Hypotheses.**

- Mathlib's localPolynomial is computed on minimal models (WeierstrassCurve.minimal); the comparison includes the change to a minimal model of the twist.
- ℓ = 2 is included in both (a) and (b).

**Construction or proof.**

1. (a), ℓ odd: D_K is an ℓ-adic unit, so the twisted model has Δ ↦ D⁶Δ with the same valuation; minimality and the reduction type are preserved, and the reduction of E^K is the twist of the reduction of E by the class of D_K mod ℓ (finite-field-twist-trace).
2. Multiplicative reduction: the tangent directions at the node are defined over 𝔽_ℓ(√(−c₆)); twisting multiplies −c₆ by D³, so splitness flips exactly when D_K is a nonsquare mod ℓ, i.e. χ(ℓ) = −1.
3. (a), ℓ = 2 ∤ D_K: D_K ≡ 1 mod 4, and the twist is an Artin–Schreier twist over 𝔽₂ by x² − x + (1 − D_K)/4, whose trace is 1 exactly when D_K ≡ 5 mod 8, i.e. χ(2) = −1 (finite-field-twist-trace (ii)).
4. (b): the Tate module of E^K is V_r(E) ⊗ χ as a G_ℚ-representation (Tau Ceti quadraticTwistPointEquiv twists the Galois action by the quadratic character). The Néron–Ogg–Shafarevich criterion and the Galois description of local factors (EllipticCurves Layer 4; EllipticCurveModularity R29.4/bad-euler-factors) give the local polynomial as the characteristic polynomial on inertia invariants. If V_r(E) is unramified or has unipotent inertia action, tensoring with the ramified χ_ℓ kills the invariants.

**Prerequisites.** `RankZeroOneBSD:BSD.0/finite-field-twist-trace`, `RankZeroOneBSD:BSD.0/quadratic-field-character`, `tauceti:WeierstrassCurve.quadraticTwist`, `tauceti:WeierstrassCurve.isElliptic_quadraticTwist`, `mathlib:WeierstrassCurve.localPolynomial`, `mathlib:WeierstrassCurve.HasGoodReduction`, `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasAdditiveReduction`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Footnote 7, p. 42: Twisting E twists every Euler factor by χ_K.
- [Indivisibility of Heegner points in the multiplicative case](https://arxiv.org/abs/1407.1099v1), §9.1, Corollary 9.2 and proof, p. 29: The local comparison at split primes; inert and ramified primes use the Galois description.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): a₂(E) = −2 and χ(2) = 1, so a₂(E^K) = −2; a₃(E) = −1 and χ(3) = −1, so a₃(E^K) = 1.
- E = 11a1, K = ℚ(√−1): at ℓ = 11, χ(11) = −1, so the split multiplicative reduction of E becomes nonsplit for E^K.

### twist-l-series — The L-series and conductor of a quadratic twist coprime to the conductor

Target `RankZeroOneBSD:BSD.0/twist-l-series` (theorem).

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then E.quadraticTwist K has conductor N·D_K², its coefficients are a_n(E^K) = χ_K(n)·a_n(E) for every n ≥ 1, ellipticL E^K is the entire continuation of Σ χ_K(n)a_n(E)n^{-s}, and the newform of E^K is the twist F_E ⊗ χ_K, a newform of level N D_K².

**Hypotheses.**

- (D_K, N) = 1. Without it the coefficients at ℓ | (D_K, N) and the conductor need twist-local-factors (b).

**Construction or proof.**

1. For ℓ ∤ D_K, twist-local-factors (a) gives P_ℓ(E^K,T) = P_ℓ(E, χ(ℓ)T), so a_{ℓ^k}(E^K) = χ(ℓ)^k a_{ℓ^k}(E).
2. For ℓ | D_K, ℓ ∤ N: E has good reduction at ℓ, so E^K is additive there (twist-local-factors (b)) and a_{ℓ^k}(E^K) = 0 = χ(ℓ^k)a_{ℓ^k}(E).
3. Multiplicativity of both coefficient sequences gives the identity for all n.
4. Conductor: at ℓ | D_K the representation V ⊗ χ_ℓ has V unramified, so its conductor exponent is 2·a(χ_ℓ) = 2 v_ℓ(D_K); elsewhere it is unchanged (R29.4/exact-conductor identifies the level with this conductor).
5. Newform: F_E ⊗ χ_K has the coefficients a_n(E^K) and level N D_K² (twist of a newform by a character of coprime conductor is new), and equals F_{E^K} by strong multiplicity one (R29.3/newform-of-E).

**Prerequisites.** `RankZeroOneBSD:BSD.0/twist-local-factors`, `RankZeroOneBSD:BSD.0/quadratic-field-character`, `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.4/exact-conductor`, `mathlib:WeierstrassCurve.LFunction`, `RankZeroOneBSD:BSD.0/actual-l-function`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The twisted L-series and its conductor D²M.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Footnote 8, p. 43: The newform of the twist.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): E^K has conductor 11·49 = 539.

### twist-root-number — Root number of a quadratic twist

Target `RankZeroOneBSD:BSD.0/twist-root-number` (theorem).

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then rootNumber (E.quadraticTwist K) = χ_K(−N)·rootNumber E. In particular, if K is imaginary and every prime dividing N splits in K, then rootNumber E^K = −rootNumber E, and rootNumber E · rootNumber E^K = −1.

**Hypotheses.**

- (D_K, N) = 1.
- For K imaginary χ_K(−1) = −1; the Heegner hypothesis gives χ_K(N) = 1.

**Construction or proof.**

1. Twist the completed function: Λ(s, F_E ⊗ χ_K) with conductor N D_K² (twist-l-series).
2. The twist of a newform of level N and sign ε by a primitive character χ of conductor D coprime to N has sign ε·χ(N)·τ(χ)²/D; for quadratic χ = χ_K, τ(χ_K)² = χ_K(−1)|D_K|, so the sign is ε·χ_K(−N). Equivalently, with local ε-factors (GL2AutomorphicRepresentationsAndTransfer R16.3) only the places ℓ | D_K change, together contributing χ_K(−N).
3. Under the Heegner hypothesis χ_K(N) = ∏ χ_K(ℓ)^{v_ℓ(N)} = 1 and χ_K(−1) = −1.

**Prerequisites.** `RankZeroOneBSD:BSD.0/completed-l-function`, `RankZeroOneBSD:BSD.0/twist-l-series`, `RankZeroOneBSD:BSD.0/quadratic-field-character`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The twisted sign εχ_D(−M).
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The Heegner-hypothesis specialisation.

**Acceptance.**

- E = 37a1 (w = −1), K = ℚ(√−7) (37 ≡ 2 mod 7 is a square, so 37 splits): w(E^K) = +1.
- E = 11a1 (w = +1), K = ℚ(√−7) (11 ≡ 4 mod 7 is a square): w(E^K) = −1.

### base-change-factorization — Factorisation of the L-function over a quadratic field

Target `RankZeroOneBSD:BSD.0/base-change-factorization` (theorem). Atlas planet: **Base-change factorisation**.

Let E/ℚ be elliptic and K a quadratic field. As arithmetic functions, (E.baseChange K).LFunction = E.LFunction ⍟ (E.quadraticTwist K).LFunction (Dirichlet convolution), the left side being Mathlib's Euler product over the height-one primes of 𝓞_K grouped by norm. Hence (E.baseChange K).LSeries s = E.LSeries s · (E.quadraticTwist K).LSeries s for Re s > 3/2, and L(E/K, s) has the entire continuation ellipticL E · ellipticL E^K.

**Hypotheses.**

- K/ℚ quadratic (real or imaginary); no coprimality between D_K and N is assumed.

**Construction or proof.**

1. Both sides are Euler products; compare, for each rational prime ℓ, the product of the factors of E/K at the primes 𝔩 | ℓ with P_ℓ(E,T)P_ℓ(E^K,T).
2. ℓ split: K_𝔩 = ℚ_ℓ for both 𝔩, and E^K ≅ E over ℚ_ℓ since D_K is a square there, so both sides are P_ℓ(E,T)².
3. ℓ inert: one prime of norm ℓ², with factor P_𝔩(E/K, T²) computed over the quadratic unramified extension; at good ℓ the identity (1 − αT)(1 − βT)(1 + αT)(1 + βT) = (1 − α²T²)(1 − β²T²) with a_{ℓ²} = a_ℓ² − 2ℓ (point count over 𝔽_{ℓ²}, EllipticCurves Layer 3) and twist-local-factors (a) with χ(ℓ) = −1; at multiplicative ℓ (1 − aT)(1 + aT) = 1 − T² since the reduction over 𝔽_{ℓ²} is split; at additive ℓ both sides are 1.
4. ℓ ramified: one prime of norm ℓ; as I_ℓ/I_𝔩 ≅ {±1} acts on V^{I_𝔩} by an involution, V^{I_𝔩} = V^{I_ℓ} ⊕ (V ⊗ χ_ℓ)^{I_ℓ} as Frobenius modules, which is twist-local-factors (b).
5. Convergence for Re s > 3/2 of each factor gives the LSeries identity (LSeries_convolution); the product of the two entire functions agrees with it there, so it is the continuation.

**Prerequisites.** `RankZeroOneBSD:BSD.0/twist-local-factors`, `RankZeroOneBSD:BSD.0/actual-l-function`, `mathlib:WeierstrassCurve.LFunction`, `mathlib:WeierstrassCurve.LSeries`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:ArithmeticFunction.eulerProduct`, `mathlib:LSeries_convolution`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: The factorisation L(E/K,s) = L(E,s)L(E^D,s) used at the centre.
- [Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean), Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean, docstring of LFunction: The left-hand side over K.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): the coefficient of 2^{−s} in L(E/K,s) is a₂(E) + a₂(E^K) = −4 (two primes of norm 2, each with a = −2).
- Coefficient of 3^{−s} in L(E/K,s) is 0 (3 inert: no ideal of norm 3), matching a₃(E) + a₃(E^K) = −1 + 1.

### base-change-central-identities — Order, leading term and sign of L(E/K, s) at the centre

Target `RankZeroOneBSD:BSD.0/base-change-central-identities` (lemma).

Let E/ℚ be elliptic, K quadratic, r = analyticRank E and r' = analyticRank E^K. The continuation ellipticL E · ellipticL E^K of L(E/K,s) has order r + r' at s = 1 and leading coefficient leadingTerm E · leadingTerm E^K. In particular (a) if r = 1 and ellipticL E^K 1 ≠ 0, then L(E/K,s) has a simple zero and L′(E/K,1) = L′(E,1)·L(E^K,1); (b) if r = 0 and r' = 1, then L′(E/K,1) = L(E,1)·L′(E^K,1). If (D_K, N) = 1, K is imaginary and every prime dividing N splits in K, then r + r' is odd.

**Hypotheses.**

- K quadratic; for the parity statement, the Heegner hypothesis and (D_K, N) = 1.

**Construction or proof.**

1. Orders add and leading coefficients multiply for a product of analytic functions (Mathlib analyticOrderAt of a product).
2. (a), (b) are the cases r + r' = 1 of the product rule.
3. Parity: root-number-parity for E and E^K and twist-root-number give (−1)^{r+r'} = w(E)w(E^K) = −1.

**Prerequisites.** `RankZeroOneBSD:BSD.0/base-change-factorization`, `RankZeroOneBSD:BSD.0/analytic-rank`, `RankZeroOneBSD:BSD.0/root-number-parity`, `RankZeroOneBSD:BSD.0/twist-root-number`, `mathlib:analyticOrderAt`, `mathlib:analyticOrderAt_mul`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45: Order one over K from rank one over ℚ and a nonvanishing twist.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45: Signs multiply under the factorisation.

**Acceptance.**

- E = 37a1, K = ℚ(√−7): r = 1 and w(E^K) = +1 (twist-root-number), consistent with r' even.

### rational-newform-bridge — The rational newform of E and its L-series

Target `RankZeroOneBSD:BSD.0/rational-newform-bridge` (comparison).

For E/ℚ elliptic of conductor N, the newform F_E ∈ S₂(Γ₀(N)) of EllipticCurveModularity R29.3 has rational integer Fourier coefficients and (E.LFunction n : ℂ) = a_n(F_E) for every n ≥ 1, including n divisible by primes of bad reduction. Hence E.LSeries = the Dirichlet series of F_E on Re s > 3/2, the entire extension of E's coefficient series is that of F_E (Mathlib ModularForm.L at strict width one), and ellipticL E takes real values on ℝ with real derivatives at s = 1.

**Hypotheses.**

- Uses the actual modularity theorem (R29.6), not a hypothesis on E.

**Construction or proof.**

1. Prime coefficients: R29.4/bad-euler-factors identifies every local polynomial of E with that of F_E.
2. Prime-power and composite coefficients: both sequences are multiplicative with the same Hecke recursion at each prime, so the Euler products agree coefficientwise.
3. Rationality: R29.3/rational-coefficient-field; real coefficients give ellipticL E (conj s) = conj (ellipticL E s).

**Prerequisites.** `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.3/rational-coefficient-field`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `EllipticCurveModularity:R29.6/modularity-theorem`, `mathlib:WeierstrassCurve.LFunction`, `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.3.2, p. 44: L(E,s) = L(F_E,s) with F_E of weight two and level N.

**Acceptance.**

- E = 11a1: a₂ = −2, a₃ = −1, a₅ = 1, a₁₁ = 1 agree with η(q)²η(q¹¹)² = q − 2q² − q³ + 2q⁴ + q⁵ + ⋯.

### congruent-number-root-numbers — Root numbers of the congruent-number twists

Target `RankZeroOneBSD:BSD.0/congruent-number-root-numbers` (application).

Let E : y² = x³ − x (conductor 32) and, for a positive squarefree integer n, E^(n) : n y² = x³ − x, the twist by the quadratic character attached to n (for n=1 use E itself; ℚ(√1) is not a quadratic extension). Then rootNumber E^(n) = +1 exactly when n ≡ 1, 2, 3 (mod 8), and −1 when n ≡ 5, 6, 7 (mod 8). E^(−1) ≅ E, so the classification is for positive n only.

**Hypotheses.**

- n > 0 squarefree. The twist-root-number formula does not apply directly, since D = disc ℚ(√n) is even when n ≢ 1 mod 4 or n even, and 2 | N.

**Construction or proof.**

1. Write rootNumber E^(n) = w_∞ · w_2 · ∏_{ℓ | n odd} w_ℓ with w_∞ = −1 (rootNumber_eq_prod_local).
2. For odd ℓ | n, E^(n) has additive potentially good reduction of type I₀* at ℓ and w_ℓ = (−1/ℓ) (local ε-factor of a ramified quadratic twist of an unramified representation, GL2AutomorphicRepresentationsAndTransfer R16.3).
3. At 2, w_2(E^(n)) depends only on n mod 8 (E has CM by ℤ[i] and potentially good reduction at 2); evaluate it on the representatives n = 1, 2, 3, 5, 6, 7 (Birch–Stephens).
4. Combine: the product is +1 exactly for n ≡ 1, 2, 3 (mod 8).

**Prerequisites.** `RankZeroOneBSD:BSD.0/completed-l-function`, `RankZeroOneBSD:BSD.0/twist-local-factors`, `RankZeroOneBSD:BSD.0/root-number-parity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Sources.**

- [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2), Footnote 2 to Theorem 1.2, p. 2: The statement, cited from Birch–Stephens.

**Acceptance.**

- n = 1, 2, 3: w = +1 (not congruent numbers); n = 5, 6, 7: w = −1 (congruent numbers, analytic rank odd).
- The ArithmeticStatistics ST.5 consumer reads w(E^(n)) = +1 for n ≡ 1, 2, 3 mod 8 from this node.

**Layer completion obligations.**

- Prove the dyadic congruent-number trace/root table from the original Birch–Stephens computation or an acquired local epsilon-factor formula; the public full text was not acquired for this plan.
- Odd, dyadic Artin–Schreier and ramified trace/base-change cases are already represented at target level; do not require a lemma-level split in this target-level job.

## BSD.1

Separate invariant and anti-invariant points through the explicit quadratic twist isomorphism. Compare ranks, heights, regulators, periods, torsion, Selmer groups, Tate–Shafarevich groups and Tamagawa factors. Odd-primary comparisons use division by two; the dyadic error groups retain their precise exponent bounds.

### quadratic-point-maps — Restriction, conjugation, trace and twist maps on points over a quadratic field

Target `RankZeroOneBSD:BSD.1/quadratic-point-maps` (construction). Atlas planet: **Quadratic trace and twist maps**.

Let E/ℚ be elliptic, K a quadratic field with nontrivial automorphism σ, E_K = E.baseChange K and E^K = E.quadraticTwist K. Define the additive maps res : E(ℚ) → E(K) (Point.map along ℚ → K), conj : E(K) → E(K) (Point.map along σ), tr : E(K) → E(ℚ) with res (tr P) = P + σP, and ι : E^K(ℚ) → E(K), the composite of res for E^K with quadraticTwistPointEquiv E^K(K) ≃+ E(K). Then res and ι are injective, range res = {P : σP = P}, range ι = {P : σP = −P}, tr ∘ res = 2·id, res ∘ tr = 1 + conj, and 2·E(K) ⊆ range res + range ι.

**Hypotheses.**

- K/ℚ quadratic; the twist is Tau Ceti's quadraticTwist and the point isomorphism is chosen once (well defined up to the automorphism −1).

**Construction or proof.**

1. res and conj are Mathlib's Point.map; σ² = 1 gives conj² = id.
2. tr: P + σP is σ-fixed, so it descends uniquely to E(ℚ) by Point.exists_baseChange_eq_of_map_eq (uniqueness from injectivity of res).
3. ι: by quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map with M = K and σ the nontrivial element (χ(σ) = −1), points of E^K(ℚ) go to σ-anti-fixed points; conversely an anti-fixed point of E(K) pulls back to a σ-fixed point of E^K(K), which descends.
4. 2P = (P + σP) + (P − σP) with P + σP ∈ range res and P − σP ∈ range ι.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.Affine.Point.quadraticRes` | constructor | res : E(ℚ) →+ E(K), injective. |
| `WeierstrassCurve.Affine.Point.quadraticConj` | constructor | conj : E(K) →+ E(K), the action of σ; conj ∘ conj = id. |
| `WeierstrassCurve.Affine.Point.quadraticTrace` | constructor | tr : E(K) →+ E(ℚ) with res (tr P) = P + conj P. |
| `WeierstrassCurve.Affine.Point.twistEmbed` | constructor | ι : E^K(ℚ) →+ E(K), injective. |
| `WeierstrassCurve.Affine.Point.quadraticTrace_res` | simp | tr (res P) = 2 • P. |
| `WeierstrassCurve.Affine.Point.res_quadraticTrace` | simp | res (tr P) = P + conj P. |
| `WeierstrassCurve.Affine.Point.range_quadraticRes` | characterisation | range res = {P ∣ conj P = P}. |
| `WeierstrassCurve.Affine.Point.range_twistEmbed` | characterisation | range ι = {P ∣ conj P = −P}. |
| `WeierstrassCurve.Affine.Point.two_smul_mem_sup` | relation | 2 • P ∈ range res ⊔ range ι for every P ∈ E(K). |
| `WeierstrassCurve.Affine.Point.quadraticTrace_twistEmbed` | simp | tr (ι Q) = 0. |

**Consumers.**

- `RankZeroOneBSD:BSD.1/rank-splitting`: the ± decomposition of E(K) ⊗ ℚ
- `RankZeroOneBSD:BSD.3`: the Heegner point y_K lies in the eigenspace selected by the root number, read through range res or range ι
- `Gross, Kolyvagin's work, §5`: complex conjugation acts on y_K by a sign, placing it in E(ℚ) or in the twist

**Unit tests.**

- `WeierstrassCurve.Affine.Point.quadraticTrace_res_test` (characterisation): For E = 37a1, K = ℚ(√−7) and P = (0, 0) ∈ E(ℚ), tr (res P) = 2P = (1, 0).
- `WeierstrassCurve.Affine.Point.twistEmbed_anti` (characterisation): conj (ι Q) = −ι Q for every Q ∈ E^K(ℚ).
- `WeierstrassCurve.Affine.Point.quadraticTrace_not_surjective` (non-example): tr is not surjective in general: for E = 37a1 (E(ℚ) = ℤ·(0,0), no torsion) and any quadratic K with E(K) = res E(ℚ) + E(K)_tors, the image of tr is 2E(ℚ) ≠ E(ℚ).
- `WeierstrassCurve.Affine.Point.ker_res_add_twistEmbed` (compatibility): The kernel of res + ι on E(ℚ) × E^K(ℚ) is contained in E(ℚ)[2] × E^K(ℚ)[2] (Submodule.torsionBy ℤ _ 2).

**Prerequisites.** `mathlib:WeierstrassCurve.Affine.Point`, `mathlib:WeierstrassCurve.Affine.Point.map`, `mathlib:WeierstrassCurve.baseChange`, `tauceti:WeierstrassCurve.quadraticTwist`, `tauceti:WeierstrassCurve.quadraticTwistPointEquiv`, `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Sources.**

- [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map: The twist points are the χ-eigenspace of E(K).
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47: The eigenspace decomposition the maps realise, at odd p.

**Acceptance.**

- For P ∈ E(ℚ), tr (res P) = 2P.
- ker(res + ι : E(ℚ) × E^K(ℚ) → E(K)) is a subgroup of E(ℚ)[2] × E^K(ℚ)[2].

### rank-splitting — Rank splitting over a quadratic field

Target `RankZeroOneBSD:BSD.1/rank-splitting` (theorem). Atlas planet: **Rank splitting over K**.

For E/ℚ elliptic and K a quadratic field, rank E(K) = rank E(ℚ) + rank E^K(ℚ), where rank is Module.finrank ℤ of the free quotient PointModTorsion. More precisely res + ι : E(ℚ) ⊕ E^K(ℚ) → E(K) has kernel and cokernel killed by 2, both finite.

**Hypotheses.**

- K/ℚ quadratic; all three groups finitely generated (Mordell–Weil over number fields).

**Construction or proof.**

1. Kernel: if res P + ι Q = 0 then applying conj gives res P − ι Q = 0, so 2 res P = 0 and 2 ι Q = 0, hence P ∈ E(ℚ)[2] and Q ∈ E^K(ℚ)[2].
2. Cokernel: 2E(K) ⊆ range res + range ι (quadratic-point-maps), so the cokernel is a quotient of E(K)/2E(K), finite by Mordell–Weil and killed by 2.
3. Tensoring with ℚ kills both, giving the rank identity.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `mathlib:Module.finrank`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: The rank-zero twist case of the splitting, used with its regulator consequence.

**Acceptance.**

- E = 37a1, K = ℚ(√−7): rank E(ℚ) = 1, and once rank E(K) = 1 is proved (BSD.3), rank E^K(ℚ) = 0.

### quadratic-regulator-comparison — Lattice index and regulators over a quadratic field

Target `RankZeroOneBSD:BSD.1/quadratic-regulator-comparison` (theorem).

Let E/ℚ be elliptic, K quadratic, Λ = E(K)/tors, Λ₊ = image of res and Λ₋ = image of ι, r₊ = rank E(ℚ), r₋ = rank E^K(ℚ), r = r₊ + r₋. Then Λ₊ ⊥ Λ₋ for the Néron–Tate pairing over K, [Λ : Λ₊ ⊕ Λ₋] = 2^a with 0 ≤ a ≤ r, and with K-relative heights (⟨P, P⟩_K = [K:ℚ]·⟨P, P⟩_ℚ for P defined over ℚ) Reg_BSD(E/K) = 2^r · Reg_BSD(E/ℚ) · Reg_BSD(E^K/ℚ) / 4^a. In particular, if r₋ = 0 then Reg_BSD(E/K) = 2^{r₊} Reg_BSD(E/ℚ)/4^a and E(K)/tors contains res(E(ℚ)/tors) with index 2^a.

**Hypotheses.**

- Reg_BSD is the regulator of GrossZagierAndArithmeticHeights GZ.0 (x-height normalisation, Reg_BSD = 2^r · Tau Ceti regulator).
- K-relative heights need a number-field instance of Tau Ceti's height machinery, which the pinned library lacks (GZ.0 gap); the statement is made for that instance.

**Construction or proof.**

1. Orthogonality: the height pairing over K is invariant under σ; for P ∈ Λ₊, Q ∈ Λ₋, ⟨P, Q⟩ = ⟨σP, σQ⟩ = −⟨P, Q⟩.
2. Index: 2Λ ⊆ Λ₊ ⊕ Λ₋ (quadratic-point-maps), so the index divides 2^r.
3. Heights of rational points relative to K are [K:ℚ] = 2 times their heights relative to ℚ; points of E^K(ℚ) carry the same K-height through the isomorphism over K.
4. Gram determinants: det Gram_K(Λ₊ ⊕ Λ₋) = 2^{r₊}Reg(E/ℚ)·2^{r₋}Reg(E^K/ℚ), and passing to the superlattice Λ divides by its index squared (GZ.0/gram-determinant-rescaling).
5. Write the sublattice Gram matrix as AᵀGA. Matrix.det_mul and Matrix.det_transpose give det(A)² det(G); AddSubgroup.index_eq_natAbs_det identifies |det(A)| with the finite lattice index. These are native pinned declarations, so no removed GZ.0 gram-determinant node is needed. NumberField.instAdmissibleAbsValues and Northcott supply the height instances; GZ.0 supplies the x-height/relative-height normalization transport.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `RankZeroOneBSD:BSD.1/rank-splitting`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`, `tauceti:WeierstrassCurve.Affine.regulator`, `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_transpose`, `mathlib:AddSubgroup.index_eq_natAbs_det`, `mathlib:NumberField.instAdmissibleAbsValues`, `mathlib:NumberField.totalWeight_eq_finrank`, `mathlib:NumberField.finite_setOfPred_logHeight₁_le`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: JSW's comparison up to p-adic units; here the powers of 2 are kept.

**Acceptance.**

- Rank one, r₋ = 0, a = 0: Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ).
- Rank zero over K: all regulators are 1 (regulator_eq_one_of_finrank_eq_zero).

### torsion-comparison — Torsion over a quadratic field

Target `RankZeroOneBSD:BSD.1/torsion-comparison` (lemma).

For E/ℚ elliptic, K quadratic and p an odd prime, res + ι induces E(ℚ)[p^∞] ⊕ E^K(ℚ)[p^∞] ≅ E(K)[p^∞]. At p = 2 the map E(ℚ)[2^∞] ⊕ E^K(ℚ)[2^∞] → E(K)[2^∞] has kernel and cokernel killed by 2. Consequently #E(K)_tors and #E(ℚ)_tors · #E^K(ℚ)_tors have the same odd part.

**Hypotheses.**

- K quadratic; torsion groups finite (Mordell–Weil).

**Construction or proof.**

1. On a p-primary group with p odd, multiplication by 2 is invertible, so P = ½(P + σP) + ½(P − σP) splits E(K)[p^∞] into its ±1 eigenspaces; quadratic-point-maps identifies them.
2. At p = 2 use the same kernel and cokernel estimates as rank-splitting.
3. For unconditional finiteness over number fields use fg_point_of_numberField and finite torsion of a finitely generated abelian group; pinned finite_torsion additionally requires height/Northcott instances.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `mathlib:Submodule.torsionBy`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47: The same odd-p eigenspace splitting, applied to torsion.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): E(ℚ)_tors ≅ ℤ/5, and E(K)[5] = E(ℚ)[5] ⊕ E^K(ℚ)[5].

### odd-selmer-sha-decomposition — Odd-primary Selmer and Sha over a quadratic field

Target `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition` (theorem). Atlas planet: **Odd-primary Selmer decomposition**.

Let E/ℚ be elliptic, K quadratic and p an odd prime. Restriction and the twist isomorphism give isomorphisms Sel_{p^∞}(E/K) ≅ Sel_{p^∞}(E/ℚ) ⊕ Sel_{p^∞}(E^K/ℚ) and Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞] ⊕ Ш(E^K/ℚ)[p^∞], compatible with the Kummer maps and the decomposition of points.

**Hypotheses.**

- p odd; the Selmer and Sha groups are those of EllipticCurves Layer 7 (Selmer structures on E[p^∞] with the Kummer local conditions).

**Construction or proof.**

1. Gal(K/ℚ) = {1, σ} has order prime to p, so restriction H¹(ℚ, M) → H¹(K, M)^{Gal(K/ℚ)} is an isomorphism for p-primary M (inflation–restriction, H^i(ℤ/2, ·) killed by 2).
2. H¹(K, E[p^∞]) splits into σ-eigenspaces; the +1 part is H¹(ℚ, E[p^∞]) and the −1 part is H¹(ℚ, E^K[p^∞]) since E^K[p^∞] ≅ E[p^∞] ⊗ χ_K.
3. Local conditions: at each place v of ℚ the same argument applies to ⊕_{w|v} H¹(K_w, ·) (semilocal Shapiro), and the Kummer images correspond.
4. Sha is the cokernel of the Kummer map on Selmer groups; combine with torsion-comparison and rank-splitting for the points.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `RankZeroOneBSD:BSD.1/torsion-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology`, `tauceti:TauCeti.ContCohomology.H1`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47: The odd-primary decomposition used in the rank-one p-part argument.

**Acceptance.**

- If rank E^K(ℚ) = 0 and Ш(E^K/ℚ)[p^∞] = 0 then Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞].

### two-primary-comparison — The 2-primary restriction and corestriction comparison

Target `RankZeroOneBSD:BSD.1/two-primary-comparison` (theorem).

For E/ℚ elliptic and K quadratic, let R:Sel_{2∞}(E/ℚ)⊕Sel_{2∞}(E^K/ℚ)→Sel_{2∞}(E/K) be the combined ordinary and twisted restriction maps, and C the corresponding pair of corestrictions. Then C∘R=2·id on the direct sum and R∘C=2·id on Sel(E/K). The same holds on Sha[2∞]. Hence their kernels and cokernels are killed by 2, and finite using finite Sel₂ and the isogeny local-condition comparison. No integral direct sum decomposition at 2 is asserted. The formula res∘cor=1+σ applies only to the untwisted summand; the twisted summand contributes 1−σ.

**Hypotheses.**

- The 2-primary groups of EllipticCurves Layer 7; no hypothesis on E[2].

**Construction or proof.**

1. The rational isogenies Res_{K/ℚ}E ⇄ E×E^K induced by trace and twisted trace compose to multiplication by 2 in both orders. Obtain their Selmer and Sha maps from EC Layer 7, with Weil restriction and local Kummer compatibility.
2. The untwisted and twisted norms are 1+σ and 1−σ; adding gives 2. Cross terms vanish.
3. The finite isogeny-Selmer kernel and cokernel, or finite Sel₂ plus the local comparison, proves finiteness; being killed by 2 by itself is insufficient.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCeti.ContCohomology.H1`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.2, p. 42: The passage is made for odd p; at p = 2 only the bounded comparison here is available.

**Acceptance.**

- E = 11a1, K = ℚ(√−7): Sel₂ comparisons hold up to groups of exponent 2, and no statement about Ш[2] is made beyond this.

### sha-finiteness-descent — Finiteness of Sha descends along a finite extension

Target `RankZeroOneBSD:BSD.1/sha-finiteness-descent` (theorem). Atlas planet: **Descent of Sha finiteness**.

Let E/ℚ be elliptic and K/ℚ a finite Galois extension. If Ш(E/K) is finite then Ш(E/ℚ) is finite. In particular, for K quadratic, finiteness of Ш(E/K) implies finiteness of Ш(E/ℚ) and of Ш(E^K/ℚ).

**Hypotheses.**

- K/ℚ finite Galois; Ш as in EllipticCurves Layer 7, for the whole group (all primes).

**Construction or proof.**

1. The kernel of restriction Ш(E/ℚ) → Ш(E/K) lies in H¹(Gal(K/ℚ), E(K)) by inflation–restriction.
2. E(K) is finitely generated (Mordell–Weil) and Gal(K/ℚ) is finite, so H¹(Gal(K/ℚ), E(K)) is a finitely generated abelian group killed by [K:ℚ], hence finite.
3. So Ш(E/ℚ) is an extension of a subgroup of the finite Ш(E/K) by a finite group.
4. For E^K apply the same argument, since E^K ≅ E over K.

**Prerequisites.** `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCeti.ContCohomology.H1`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.2, p. 1: Finiteness over ℚ is obtained from finiteness over an auxiliary K by this descent.

**Acceptance.**

- If Ш(E/K) is finite for some imaginary quadratic K (from HE.7), then Ш(E/ℚ) is finite: this is the descent step of BSD.3 and BSD.4.

### tamagawa-base-change — Tamagawa factors under quadratic base change and twist

Target `RankZeroOneBSD:BSD.1/tamagawa-base-change` (theorem). Atlas planet: **Tamagawa factors under base change**.

Let E/ℚ be elliptic, K quadratic and p an odd prime split in K. For every rational prime ℓ, v_p(∏_{w|ℓ} c_w(E/K))=v_p(c_ℓ(E/ℚ)c_ℓ(E^K/ℚ)). Thus the same equality holds for the global Tamagawa products. The split hypothesis at the valuation prime p is retained from Skinner–Zhang Corollary 9.2; it handles ℓ=p without using a prime-to-residue-characteristic cohomology argument.

**Hypotheses.**

- p odd; Tamagawa numbers from Tate's algorithm (EllipticCurves Layer 4) and their identification with the Néron component groups (NeronModelsAndSemistableAbelianVarieties R11.6/equation-component-comparison).
- p splits in K, as in the selected source Corollary 9.2. A broader version requires a separate local proof.

**Construction or proof.**

1. The p-part of c_w is the length of H¹(F_w, E[p^∞]^{I_w}) for w ∤ p (component groups and unramified cohomology, as in Skinner–Zhang Lemma 9.1).
2. ℓ split: E^K ≅ E over ℚ_ℓ = K_w for both w, so the two sides agree.
3. ℓ inert or ramified: with w the unique place above ℓ and p odd, restriction H¹(F_ℓ, E[p^∞]^{I_ℓ}) ⊕ H¹(F_ℓ, E^K[p^∞]^{I_ℓ}) → H¹(F_w, E[p^∞]^{I_w}) is an isomorphism (the ±1 eigenspaces of σ).
4. At ℓ=p, K_w=ℚ_p and the local twist is trivial, so the two factors agree directly. The inertia-cohomology argument above is used only at ℓ≠p.

**Prerequisites.** `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.**

- [Indivisibility of Heegner points in the multiplicative case](https://arxiv.org/abs/1407.1099v1), §9.1, Corollary 9.2, p. 29: The p-adic lengths t of the Tamagawa factors add over a quadratic base change.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.3.1, (7.3.a), p. 43: The product form used by JSW.

**Acceptance.**

- E = 11a1 (c₁₁ = 5), K = ℚ(√−7) with 11 split: ∏_{w|11} c_w(E/K) = 25 = c₁₁(E)·c₁₁(E^K).

### quadratic-period — The period of E over an imaginary quadratic field and its comparison

Target `RankZeroOneBSD:BSD.1/quadratic-period` (construction).

For E/ℚ elliptic, choose a global minimal Néron differential ω, and an imaginary quadratic field K of discriminant D. Let Λ_ω⊂ℂ be the image of H₁(E(ℂ),ℤ) under integration of ω, a discrete full ℤ-lattice. Let 𝔞_ω be the invertible fractional ideal of 𝓞_K satisfying 𝔞_ω·ω=e*Ω¹ of the Néron model. Define Ω_{E/K}=N(𝔞_ω)·4 covol(Λ_ω), where the covolume uses ordinary Euclidean Haar measure on ℂ. This equals the complex-place factor N(𝔞_ω)·2∫|ω∧ω̄| in the BSD period. If δ=[Λ_ω:Λ_ω^real+Λ_ω^imag]∈{1,2} and the twist pulls its Néron differential back to uω/√D, then Ω_E Ω_{E^K}√|D|/Ω_{E/K}=c∞(E)c∞(E^K)|u|δ/(4N(𝔞_ω)). For (D,2N)=1 the ideal is the unit ideal and u is dyadic, giving a power of two. In general the ratio is rational and is a p-unit when p∤2ND.

**Hypotheses.**

- K imaginary quadratic; fix the minimal differential and the twist isomorphism. The norm is the absolute fractional-ideal norm, including denominators. The ratio formula retains differential changes and both real component counts; an exact dyadic exponent and the dyadic Tamagawa formula belong to the recorded dyadic refinement.

**Construction or proof.**

1. Import the integrated homology period lattice from GZ.0 and the invertible Néron differential module from R11.6. Represent them by Submodule ℤ ℂ with DiscreteTopology/IsZLattice ℝ and a unit in FractionalIdeal (𝓞_K)⁰ K. Use native ZLattice.covolume and FractionalIdeal.absNorm; do not choose arbitrary real-valued period data.
2. Complex uniformization identifies the integral of |ω∧ω̄| with twice the Euclidean covolume; the extra complex-place factor two in JSW (7.1.b) gives four times that covolume. Positivity follows from the lattice and invertible ideal.
3. Conjugation gives real and imaginary rank-one sublattices; their rectangular lattice has index δ=1 or 2. Its area is the product of the least real and imaginary periods, hence δ times covol(Λ_ω). Include c∞ for the full real periods of both curves and the absolute twist differential multiplier u.
4. R11.6’s local minimal differential/base-change comparison identifies 𝔞_ω and u. Away from 2ND their valuations vanish. When (D,2N)=1, 𝔞_ω=1 and u has only dyadic valuation. Substitute into the displayed rational ratio; the all-prime dyadic exponent is a refinement, not an input to an odd-primary identity.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.quadraticPeriod` | constructor | Ω_{E/K}=N(𝔞_ω)·4 covol(Λ_ω), with actual full period lattice and invertible fractional differential ideal. |
| `WeierstrassCurve.quadraticPeriod_pos` | other | 0 < Ω_{E/K}. |
| `WeierstrassCurve.quadraticPeriod_eq_covolume` | characterisation | If 𝔞_ω = 𝓞_K then Ω_{E/K} = 4·covol(Λ_ω), Λ_ω the period lattice of the Néron differential. |
| `WeierstrassCurve.realPeriod_mul_twist_eq` | relation | For (D,2N)=1, Ω_E Ω_{E^K}√∣D∣=2^e Ω_{E/K} for an integer e; compute e from c∞, the rectangular lattice index and the twist differential multiplier, as in the displayed exact ratio. |
| `WeierstrassCurve.padicValRat_period_ratio` | compatibility | For p ∤ 2DN, the p-adic valuation of the rational number Ω_E Ω_{E^K}∣D∣^{1/2}/Ω_{E/K} is 0. |
| `WeierstrassCurve.quadraticPeriod_of_isogenous` | compatibility | Under a ℚ-isogeny of degree prime to p the ratio of periods over K is a p-adic unit. |
| `WeierstrassCurve.quadraticPeriod_eq_norm_mul_covolume` | relation | quadraticPeriod E K = FractionalIdeal.absNorm(𝔞_ω) · (4·ZLattice.covolume Λ_ω volume); the norm is rational before casting to ℝ. |

**Consumers.**

- `JSW Conjecture 7.1.1(b)`: the period in the BSD formula over F = K
- `RankZeroOneBSD:BSD.5`: the Gross–Zagier formula over K is converted into a statement about Ω_E Reg(E/ℚ) and L(E^K,1)/Ω_{E^K}
- `RankZeroOneBSD:BSD.6`: Convert the geometric number-field period and, separately, the congruence-period identity JSW (7.3.e) in prime-part arguments.

**Unit tests.**

- `WeierstrassCurve.quadraticPeriod_pos_test` (degenerate): Ω_{E/K} > 0 for every E/ℚ and K imaginary quadratic.
- `WeierstrassCurve.period_ratio_rational` (characterisation): For (D,2N)=1, the real/twist/quadratic-period ratio is a nonzero rational power of two. This tests agreement with the complex covolume and all real components.
- `WeierstrassCurve.quadraticPeriod_not_half_covolume` (non-example): If the Néron differential ideal has norm 1 and its period-lattice covolume c is positive, Ω_{E/K}=4c and Ω_{E/K}≠2c. This detects the missing factor 2 in the complex integral, without asserting an unproved transcendence comparison with Ω_E².

**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-differential-basechange`, `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-minimal-differential`, `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCeti.Isogeny`, `tauceti:TauCeti.Isogeny.degree`, `mathlib:IsZLattice`, `mathlib:ZLattice.covolume`, `mathlib:ZLattice.covolume_pos`, `mathlib:FractionalIdeal.absNorm`, `mathlib:FractionalIdeal.absNorm_eq_zero_iff`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf), §7.1, (7.1.b), printed p.421: The number-field BSD period and the fractional differential ideal.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, printed pp.310–312, particularly p.312 period identity: Complex Néron differential norm versus real/twist periods, with differential and component normalization transported explicitly.

**Acceptance.**

- For the unit differential ideal Ω_{E/K}=4 covol(Λ_ω)>0. For p∤2ND the actual rational real/twist/quadratic-period ratio has valuation zero. JSW (7.3.e) concerns the congruence period; it is not a source for this geometric lattice identity.

### odd-part-bsd-over-K — The BSD quotient over K versus over ℚ at odd primes

Target `RankZeroOneBSD:BSD.1/odd-part-bsd-over-K` (comparison).

Under the hypotheses listed here, the valuation of the rational nonzero BSD defect for E/K equals the sum of those for E and E^K. Thus if one of the two rational-curve p-parts is already known, the p-part over K is equivalent to the other. No conclusion about the separate vanishing of two arbitrary summands follows from their sum alone.

**Hypotheses.**

- p odd and split in K; (D_K,2N)=1. Assume matching analytic/algebraic ranks and rational nonzero normalized BSD quotients for E, E^K and E/K, with finite p-primary Sha; rank≤1 applications obtain these from BSD.3–5. The comparison itself does not assert general-rank rationality or finiteness.

**Construction or proof.**

1. L-values: L*(E/K,1) = L*(E,1)·L*(E^K,1) (BSD.0/base-change-central-identities).
2. Regulators: quadratic-regulator-comparison; the powers of 2 are p-adic units.
3. Periods: quadratic-period; |D_K|^{−1/2} in (7.1.a) cancels the |D|^{1/2} of the comparison.
4. Tamagawa factors: tamagawa-base-change. Torsion: torsion-comparison. Sha: odd-selmer-sha-decomposition.

**Prerequisites.** `RankZeroOneBSD:BSD.1/quadratic-regulator-comparison`, `RankZeroOneBSD:BSD.1/quadratic-period`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `RankZeroOneBSD:BSD.1/torsion-comparison`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.0/base-change-central-identities`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.1, p. 41: The comparison principle.

**Acceptance.**

- Used with p ∤ 2N D_K in BSD.6: the p-part of BSD for E/K′ plus the rank-zero p-part for E^{K′} gives the p-part for E.

**Layer completion obligations.**

- Compute the exact dyadic period exponent and dyadic/ramified 2-primary Tamagawa corrections for BSD.8/BSD.9. All target carriers and odd-primary comparisons are planned; number-field height instances are already at the pin.

## BSD.2

Construct auxiliary imaginary quadratic fields with the prescribed splitting and sign conditions. Nonvanishing comes from the BFH weighted two-series argument or the Friedberg–Hoffstein local-prescription theorem. Ramified prescriptions and supersingular support have explicit compatibility obligations.

### heegner-local-conditions — Admissible discriminants with prescribed local conditions

Target `RankZeroOneBSD:BSD.2/heegner-local-conditions` (definition). Atlas planet: **Heegner hypothesis**.

Fix N ≥ 1 and a finite set S of primes with every ℓ | N in S, together with a local prescription π : S → {split, inert, ramified} and a sign η ∈ {±1}. A fundamental discriminant D is (S, π, η)-admissible if sign D = η and each ℓ ∈ S has the prescribed behaviour in ℚ(√D) (χ_D(ℓ) = 1, −1 or 0). The Heegner hypothesis for N is the prescription 'every ℓ | N splits'; the generalized Heegner hypothesis for a factorisation N = N⁺N⁻ with N⁻ squarefree is 'ℓ | N⁺ splits, ℓ | N⁻ inert'. The prescription is compatible with an elliptic curve E of conductor N and a target sign w ∈ {±1} if every admissible D coprime to N gives rootNumber E^{ℚ(√D)} = w (by twist-root-number this is a condition on η and on π at the primes dividing N). S contains actual primes, D≠1 is required to define a quadratic field, and compatibility includes existence of an admissible discriminant. For prescriptions ramified at a conductor prime, the coprime twist-root-number formula does not apply; use the local epsilon-factor computation separately.

**Hypotheses.**

- Only finitely many primes are prescribed.
- Fundamental discriminants as in Mathlib's Int.IsFundamentalDiscr.
- S contains primes, and a prescription used in a nonvanishing theorem is nonempty and has the required local epsilon sign, including at ramified conductor primes.

**Construction or proof.**

1. Admissibility is decidable: it is a finite list of Kronecker-symbol conditions (quadratic-field-character).
2. Compatibility: for (D, N) = 1, rootNumber E^D = χ_D(−N)·rootNumber E with χ_D(−N) = η·∏_{ℓ|N} χ_D(ℓ)^{v_ℓ(N)}, which is determined by η and π.
3. For prescriptions with no ramified entries, choose a nonzero residue class satisfying the odd Legendre and dyadic Kronecker conditions, then a prime in the corresponding progression to obtain fundamental discriminants of the chosen sign. Discard D=1. General ramified prescriptions require their own compatible local construction, not a vacuous coprime implication.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BSD.LocalPrescription` | structure | A finite set S of primes, a map S → {split, inert, ramified} and a sign. |
| `TauCeti.BSD.LocalPrescription.Admissible` | constructor | The predicate on fundamental discriminants D: sign and Kronecker symbols at S as prescribed. Require D≠1; the set S consists of actual primes. |
| `TauCeti.BSD.LocalPrescription.heegner` | constructor | The Heegner prescription for N (all ℓ ∣ N split, sign −1). |
| `TauCeti.BSD.LocalPrescription.generalizedHeegner` | constructor | The generalized Heegner prescription for N = N⁺N⁻. |
| `TauCeti.BSD.LocalPrescription.admissible_decidable` | instance | Admissibility is decidable. |
| `TauCeti.BSD.LocalPrescription.rootNumber_twist_of_admissible` | relation | For admissible D with (D, N) = 1, rootNumber E^D = η·∏_{ℓ∣N} χ_D(ℓ)^{v_ℓ(N)}·rootNumber E. Assume every prime of N lies in the prescribed set S. |
| `TauCeti.BSD.LocalPrescription.infinite_admissible` | other | If the prescription has no ramified entries, the set of admissible D is infinite (of either prescribed sign). |
| `TauCeti.BSD.LocalPrescription.mono` | functoriality | Enlarging S (with any prescription on the new primes) shrinks the admissible set. |
| `TauCeti.BSD.LocalPrescription.admissible_congr` | extensionality | Equal prescribed prime sets, equal behaviours on that set and equal signs give equivalent admissibility predicates for every D; values of the behaviour map outside S are irrelevant. |

**Consumers.**

- `RankZeroOneBSD:BSD.2/heegner-field-selection`: selects K with the Heegner hypothesis and nonvanishing twist
- `JSW §7.4.1–7.4.2`: the auxiliary fields K′ and K″ are given by generalized Heegner prescriptions with p split
- `Castella erratum Theorem 1.1`: the field K with a Heegner ideal 𝔑, p split and conditions at 2 and at nonsplit q

**Unit tests.**

- `TauCeti.BSD.LocalPrescription.heegner_11_neg7` (computation): D = −7 is admissible for the Heegner prescription of N = 11.
- `TauCeti.BSD.LocalPrescription.heegner_11_neg3` (non-example): D = −3 is not admissible for the Heegner prescription of N = 11 (11 is inert in ℚ(√−3)).
- `TauCeti.BSD.LocalPrescription.empty` (degenerate): With S = ∅ and η = −1 every negative fundamental discriminant is admissible.
- `TauCeti.BSD.LocalPrescription.heegner_sign` (compatibility): For the Heegner prescription and (D, N) = 1, rootNumber E^D = −rootNumber E (BSD.0/twist-root-number).

**Prerequisites.** `RankZeroOneBSD:BSD.0/quadratic-field-character`, `RankZeroOneBSD:BSD.0/twist-root-number`, `mathlib:Int.IsFundamentalDiscr`, `ClassicalArithmeticCompletion:CA.1/kronecker-character`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45: Local prescriptions are finitely many congruence conditions.
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543: The Heegner hypothesis as a Kronecker-symbol condition.

**Acceptance.**

- For N = 11 and S = {11}, D = −7 is admissible for 'split' (11 ≡ 4 = 2² mod 7), D = −3 is not (11 ≡ 2 mod 3 is a nonsquare).

### twist-series-residue — The polar term of the BFH twist series and its nonvanishing

Target `RankZeroOneBSD:BSD.2/twist-series-residue` (theorem).

For a cuspidal even-weight newform f with trivial character and a finite set S of primes containing its conductor primes, choose the BFH arithmetic datum with all S dividing N, 8|N, m=N rad(N), r=1 and the test-vector data of §9. There exist compatible test vectors giving a nonzero polar coefficient for the central derivative branch and a nonzero polar coefficient for the central value branch. These are the weighted double-Dirichlet series of MP.8; they are not asserted to be the unweighted series over fundamental discriminants. The poles force infinitely many squareclasses supporting nonzero central values/derivatives with every S-prime split.

**Hypotheses.**

- f a newform of even weight with trivial character (k = 2 for elliptic curves).
- Test vectors and K-types as in MP.8/local-test-nonzero-f, -tau, -m.
- The identification L(s, D₀) = L_N(s + k/2 − 2, f ⊗ χ_{D₀})/L_N(2s + k − 4, Sym²f) of MP.8/bsd2-export.

**Construction or proof.**

1. Import MP.8 two-variable polar combination, interchanges and the special-value coefficient identification. After twisting initially, BFH §9 reduces to ε=+1.
2. BFH pp.614–615: choose σ₁,T₁,y₂ with F₁⁺(1/2,2)≠0 and τ₁(2)=0 using Proposition 3.12; independently choose σ₂,T₂,y₂ with τ₂(2)≠0 using Proposition 3.13. Subtract (9.4),(9.5) to obtain (9.6), with q=F₁⁺ τ₂ nonzero at (1/2,2). No assertion that all test values of one vector are simultaneously nonzero is used.
3. Derivative branch, p.616: Z⁻(u,2)=0 by sign and Lemma 9.1; therefore p(1/2,2)=q(1/2,2). Differentiating (9.6), the double-pole coefficient is −(p+q) at the intersection, equal to −2q≠0.
4. Value branch, p.617: a third vector from Proposition 3.15 has M₃(2)≠0 and τ₃(2)=0. Multiply (9.5) by M₃(2) and (9.10) by M₂(2), then subtract. After Z⁻(u,2)=0 the simple-pole coefficient is M₃(2)τ₂(2)≠0.
5. Lemma 9.1 factors each coefficient as a holomorphic multiplier times L(s+k/2−2,f⊗χ_{D₀}); its derivative implication uses the central zero. Proposition 7.1 excludes a pole of this order from finitely many fundamental squareclasses. This proves the required infinitude, not just a nonzero series.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`, `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`, `MetaplecticAutomorphicForms:MP.8/two-variable-twist-series`, `MetaplecticAutomorphicForms:MP.8/bsd2-export`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`, `MetaplecticAutomorphicForms:MP.7`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544: The twist series whose polar behaviour is analysed.
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544: Nonvanishing from the polar term.
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §9, printed pp.614–617, equations (9.4)–(9.10), Lemma 9.1: The derivative double-pole coefficient is −2q; the value branch uses a third representation and M₃(2)τ₂(2). Read directly from the scan.

**Acceptance.**

- For f the newform of 37a1 (ε = −1) and S = {37}, the series over admissible D < 0 of L(1, f ⊗ χ_D)|D|^{−w} is not identically zero; every admissible D coprime to 37 has twisted sign +1 (BSD.0/twist-root-number), so no central value is forced to vanish.

### bfh-nonvanishing — Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein)

Target `RankZeroOneBSD:BSD.2/bfh-nonvanishing` (theorem). Atlas planet: **Bump–Friedberg–Hoffstein nonvanishing**.

Let f be a cuspidal newform of even weight k with trivial character for Γ₀(M), S a finite set of primes containing all primes dividing M, and ε the sign of the functional equation of f. (i) There is a fundamental discriminant D with εD < 0 such that every prime in S splits in ℚ(√D) and L(s, f, χ_D) has a simple zero at s = k/2. (ii) There is a fundamental discriminant D with εD > 0 such that every prime in S splits in ℚ(√D) and L(k/2, f, χ_D) ≠ 0. Moreover in each case there are infinitely many such D.

**Hypotheses.**

- Every prime of S split; the sign of D is forced by ε through the twisted sign εχ_D(−M) (BSD.0/twist-root-number).
- Infinitely many: not stated in BFH's Theorem; proved here by enlarging S.

**Construction or proof.**

1. twist-series-residue, including BFH Proposition 7.1, gives infinitely many fundamental squareclasses with nonzero central value or derivative; Lemma 9.1 transfers from weighted coefficients.
2. In case (i), εD < 0 and every ℓ | M splits give sign −ε·ε = −1 for f ⊗ χ_D, so its order at k/2 is odd; a nonzero derivative means a simple zero.
3. Alternatively, to exclude any finite list D₁,…,D_n, choose for each D_i a prime q_i dividing that D_i and enlarge S by all q_i. Each new discriminant has every q_i split and therefore differs from every old D_i. One prime dividing the product need not divide every D_i.

**Prerequisites.** `RankZeroOneBSD:BSD.2/twist-series-residue`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`, `RankZeroOneBSD:BSD.0/twist-root-number`, `RankZeroOneBSD:BSD.0/root-number-parity`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Theorem, pp. 543–544: Derivative branch.
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Theorem, p. 544: Value branch.

**Acceptance.**

- For f attached to 11a1 (ε = +1), case (i) produces D < 0 with 11 split and L′(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (11 splits) whose twist has sign −1.
- For f attached to 37a1 (ε = −1), case (ii) produces D < 0 with 37 split and L(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (37 splits) whose twist has sign +1.

### prescribed-local-conditions-value-branch — Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein)

Target `RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch` (theorem).

Let f ∈ S₂(Γ₀(N)) be a newform with trivial character and (S, π, η) a local prescription (heegner-local-conditions) in which π may require primes to be split, inert or ramified. Assume admissible discriminants exist and the prescription is compatible with the actual local root-number formula: every admissible D, including those ramified at a conductor prime, has w(f ⊗ χ_D) = +1. Then there are infinitely many admissible fundamental discriminants D with L(1, f ⊗ χ_D) ≠ 0.

**Hypotheses.**

- Compatibility with sign +1 is necessary: a twist of sign −1 has vanishing central value.
- The target is the prescribed-local nonvanishing theorem cited by JSW from Friedberg–Hoffstein, Annals142 (1995), Theorem B. Its original full text was not acquired for this plan; direct verification of this stated range remains a source obligation.
- The local prescription has admissible discriminants and actual local twist sign +1; ramified conductor prescriptions cannot be justified by a statement quantified only over coprime D.

**Construction or proof.**

1. Friedberg–Hoffstein construct the twist series with arbitrary local test data on the double cover of GL₂ (MetaplecticAutomorphicForms MP.7) instead of the genus-two Jacobi construction, and extract a nonzero residue as in twist-series-residue.
2. Infinitude by enlarging S as in bfh-nonvanishing.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`, `RankZeroOneBSD:BSD.2/twist-series-residue`, `RankZeroOneBSD:BSD.0/twist-root-number`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45: The theorem as JSW use it.

**Acceptance.**

- JSW §7.4.1: with N = q₁⋯q_r squarefree, the conditions (gen-H), q inert or ramified and p split are compatible with sign +1 for E^{D′} when ord L(E,s) = 1.

### heegner-field-selection — Choice of a Heegner field for analytic rank zero or one

Target `RankZeroOneBSD:BSD.2/heegner-field-selection` (theorem). Atlas planet: **Heegner field selection**.

Let E/ℚ be elliptic of conductor N with analyticRank E ≤ 1, and let T be a finite set of primes. There are infinitely many imaginary quadratic fields K with discriminant D_K such that (a) every prime dividing N splits in K, (b) every prime in T splits in K, (c) D_K ∉ {−3, −4} and (D_K, 2N) = 1, and (d) analyticRank E^K = 1 − analyticRank E: if analyticRank E = 1 then ellipticL E^K 1 ≠ 0, and if analyticRank E = 0 then E^K has analytic rank one. For every such K, L(E/K, s) has a simple zero at s = 1.

**Hypotheses.**

- Applies to every E/ℚ, including CM and nonsemistable curves; the restrictions on K are discharged by the construction and are not hypotheses on E.

**Construction or proof.**

1. Put S = {primes dividing 2N} ∪ T ∪ {3} and apply bfh-nonvanishing to f = F_E (k = 2, ε = rootNumber E = (−1)^{analyticRank E} by root-number-parity).
2. Rank one: ε = −1, case (ii) gives D with εD > 0, i.e. D < 0, every ℓ ∈ S split and L(1, f ⊗ χ_D) ≠ 0; E^K has newform f ⊗ χ_D (BSD.0/twist-l-series) so ellipticL E^K 1 ≠ 0.
3. Rank zero: ε = +1, case (i) gives D < 0 with a simple zero of L(s, f ⊗ χ_D), i.e. analyticRank E^K = 1.
4. 2 split forces D ≡ 1 mod 8, so D is odd and D ≠ −4; 3 split forces D ≢ 0, 2 mod 3, so D ≠ −3; ℓ | N split forces (D, N) = 1.
5. BSD.0/base-change-central-identities gives the simple zero of L(E/K, s).

**Prerequisites.** `RankZeroOneBSD:BSD.2/bfh-nonvanishing`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`, `RankZeroOneBSD:BSD.0/root-number-parity`, `RankZeroOneBSD:BSD.0/twist-l-series`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.0/analytic-rank`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544: The rank-zero use of the derivative branch.

**Acceptance.**

- E = 37a1 (rank one): ℚ(√−7) satisfies the Heegner hypothesis (37 and 2 split) but 3 is inert in it, so it is excluded once 3 ∈ S; the fields produced have D ≡ 1 mod 24 with 37 split.
- Every K produced has D_K odd, so the Heegner points of BSD.3 are defined with u_K = 1.

### auxiliary-fields-for-prime-parts — Simultaneous choice of the auxiliary fields of the prime-part arguments

Target `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts` (theorem).

Let E/ℚ be semistable of conductor N with analyticRank E = 1, p an odd prime of good reduction with E[p] irreducible, and q ∥ N a prime at which E[p] is ramified. (a) There are infinitely many imaginary quadratic K′ with (gen-H) for N = N⁺N⁻, q inert or ramified, p split, and ellipticL E^{K′} 1 ≠ 0. (b) There are infinitely many imaginary quadratic K″ with the primes of N⁺ split, those of N⁻ inert (N⁺ = q, N⁻ = N/q if the number of prime factors of N is odd; N⁺ = 1 otherwise), p split and ellipticL E^{K″} 1 ≠ 0. (c) For E with multiplicative reduction at p > 3 and a nonsplit multiplicative q ≠ p at which E[p] ramifies, there are infinitely many K satisfying the hypotheses of Castella's corrected Theorem 1.1: a Heegner ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N, p split, 2 ∥ N if 2 is nonsplit, every q ∥ N nonsplit in K of nonsplit multiplicative reduction with at least one residually ramified, and ellipticL E^K 1 ≠ 0 whenever analyticRank E = 1.

**Hypotheses.**

- Hypotheses as in JSW §7.4 and the Castella erratum; each list is a finite set of local conditions compatible with root number +1 for the twist.

**Construction or proof.**

1. Each set of conditions is a local prescription (heegner-local-conditions) with finitely many primes.
2. Root numbers: w(E/K) = −1 for these K (sign −1 under (gen-H) with N⁻ having an even number of prime factors, resp. under (H)), and w(E) = −1, so w(E^K) = +1 by BSD.0/base-change-central-identities.
3. Apply prescribed-local-conditions-value-branch to the newform of E.
4. In Castella branch (c), q is ramified in K (per the erratum proof), so D_K is not coprime to N and E^K is additive at q. Compute the local epsilon signs and the Heegner-ideal ramified behaviour; BSD.0/twist-root-number is not sufficient. For the JSW supersingular upper-bound branch, also prove the chosen twist lies in BSTW’s ordinary-support range or use the direct rank-one BSTW endpoint instead.

**Prerequisites.** `RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.0/twist-root-number`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.2, p. 47: The second auxiliary field.
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 1.1, p. 1: The field of Castella's Theorem 1.1.

**Acceptance.**

- JSW §7.4.1 and §7.4.2: both K′ and K″ exist for every E in Theorem 1.2.1.

**Layer completion obligations.**

- Acquire Friedberg–Hoffstein Theorem B and prove nonvacuous ramified local compatibility for Castella and ordinary-support nonvanishing for the supersingular auxiliary route.
- BFH §9 weighted-series residue cancellation and infinitude were read and corrected; consume the exact MP.8 analysis export at target level.

## BSD.3

Use Gross–Zagier to prove the selected Heegner point is nontorsion, place it in the correct conjugation eigenspace, and apply Kolyvagin to obtain rank one and finite Tate–Shafarevich group over ℚ.

### heegner-point-nontorsion — A nonzero derivative over K gives a non-torsion Heegner point

Target `RankZeroOneBSD:BSD.3/heegner-point-nontorsion` (theorem). Atlas planet: **Non-torsion Heegner point**.

Let E/ℚ be elliptic of conductor N with a modular parametrisation φ : X₀(N) → E sending ∞ to O (EllipticCurveModularity R29.5), K imaginary quadratic of odd discriminant D_K with every prime dividing N split, and y_K = Tr_{H_K/K} φ(x₁) ∈ E(K) the Heegner point (HeegnerPointEulerSystems HE.1). If the continuation of L(E/K, s) = ellipticL E · ellipticL E^K has nonzero derivative at s = 1, then y_K has infinite order; conversely if y_K has infinite order then L′(E/K, 1) > 0.

**Hypotheses.**

- Heegner hypothesis and D_K odd (Gross–Zagier's standing hypotheses; CST's version allows the general case).
- L(E/K, s) is the continuation of BSD.0/base-change-factorization, so the derivative is that of the product.

**Construction or proof.**

1. Gross–Zagier: L′(E/K, 1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with ‖ω₀‖² > 0, C the Manin constant of φ (GZ.8/elliptic-curve-heegner-height-formula); the L-function there is the Rankin L-series of F_E with the trivial class character, which is L(E/K, s) by BSD.0/base-change-factorization and BSD.0/rational-newform-bridge.
2. If L′(E/K, 1) ≠ 0 then ĥ_K(y_K) ≠ 0; a torsion point has canonical height 0, so y_K has infinite order.
3. Conversely a point of infinite order has positive canonical height (isOfFinAddOrder_of_canonicalHeight_eq_zero and nonnegativity), so L′(E/K, 1) > 0.

**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `RankZeroOneBSD:BSD.0/base-change-factorization`, `RankZeroOneBSD:BSD.0/rational-newform-bridge`, `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, Theorem (2.1), p. 311: The height formula; excerpt as verified by GZ.8.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: Non-torsion of the Heegner point from the Gross–Zagier formula.

**Acceptance.**

- E = 37a1, K with D_K ≡ 1 mod 24 from BSD.2/heegner-field-selection: y_K has infinite order, and lies in res E(ℚ) up to torsion (heegner-point-eigenspace).

### heegner-point-eigenspace — Complex conjugation on the Heegner point selects the rational or the twisted part

Target `RankZeroOneBSD:BSD.3/heegner-point-eigenspace` (theorem).

In the setting of heegner-point-nontorsion, let σ be complex conjugation (the nontrivial automorphism of K). Then σ(y_K) = −rootNumber(E)·y_K + t for a torsion point t ∈ E(K)_tors. Consequently, if y_K has infinite order: when rootNumber E = −1, tr(y_K) ∈ E(ℚ) has infinite order (so rank E(ℚ) ≥ 1); when rootNumber E = +1, the point y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order (so rank E^K(ℚ) ≥ 1).

**Hypotheses.**

- Gross's normalisation of the parametrisation (Gross §5, Proposition 5.3 with n = 1, traced from K₁ to K); t comes from the Fricke translate of the cusp ∞ and is torsion by Manin–Drinfeld (HE.1/parameter-choice-and-degree).

**Construction or proof.**

1. σ maps x₁ to w_N(x₁)^{[𝔫]}, a Galois conjugate of the Fricke translate (HE.0/dihedral-conjugation).
2. φ ∘ w_N = ε_N·φ + φ(w_N(∞)) with ε_N the Fricke eigenvalue on F_E and φ(w_N(∞)) torsion; summing over Gal(H_K/K) gives σ y_K = ε_N y_K + t.
3. rootNumber E = −ε_N (BSD.0/completed-l-function), so σ y_K = −w y_K + t (the n = 1 case of HE.4/complex-conjugation-parity).
4. If w = −1, res(tr y_K) = y_K + σ y_K = 2y_K + t, of infinite order; if w = +1, y_K − σ y_K = 2y_K − t is anti-invariant, hence in range ι (BSD.1/quadratic-point-maps).
5. The geometric Fricke eigenvalue is ε_N=−w_E. Thus φ∘w_N=ε_N φ+t=−w_E φ+t; do not insert an additional minus sign in the parametrisation relation. Gross Proposition 5.3 (printed p.243) matches this convention.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `RankZeroOneBSD:BSD.0/completed-l-function`, `RankZeroOneBSD:BSD.1/quadratic-point-maps`, `RankZeroOneBSD:BSD.3/heegner-point-nontorsion`.

**Sources.**

- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, Proposition 5.3, p. 243 (read from the page image): Complex conjugation on the Heegner points, ε the Fricke eigenvalue; tracing to K gives σ(y_K) = ε y_K + torsion.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, (5.2) and the sentence after it, p. 243: So ε = −w_E.

**Acceptance.**

- E = 37a1 (w = −1): y_K is, up to torsion, a nonzero multiple of the generator (0, 0) of E(ℚ).

### analytic-rank-one-theorem — Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin)

Target `RankZeroOneBSD:BSD.3/analytic-rank-one-theorem` (theorem). Atlas planet: **Gross–Zagier–Kolyvagin rank-one theorem**.

For every elliptic curve E/ℚ with analyticRank E = 1: Module.finrank ℤ (E(ℚ)/tors) = 1 and Ш(E/ℚ) is finite. No further hypothesis is placed on E: CM curves, nonsemistable curves and curves with exceptional primes are included.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E = 1 (BSD.0).

**Construction or proof.**

1. Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, ellipticL E^K 1 ≠ 0, so L(E/K, s) has a simple zero (BSD.0/base-change-central-identities (a)).
2. heegner-point-nontorsion: y_K has infinite order.
3. HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) is finite (Kolyvagin, with the CM and p = 2 cases included).
4. rootNumber E = −1 (BSD.0/root-number-parity), so heegner-point-eigenspace gives rank E(ℚ) ≥ 1; BSD.1/rank-splitting gives rank E(ℚ) + rank E^K(ℚ) = 1, hence rank E(ℚ) = 1 and rank E^K(ℚ) = 0. No appeal to this theorem for E^K is made.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

**Prerequisites.** `RankZeroOneBSD:BSD.2/heegner-field-selection`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.0/root-number-parity`, `RankZeroOneBSD:BSD.3/heegner-point-nontorsion`, `RankZeroOneBSD:BSD.3/heegner-point-eigenspace`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `RankZeroOneBSD:BSD.1/rank-splitting`, `RankZeroOneBSD:BSD.1/sha-finiteness-descent`, `RankZeroOneBSD:BSD.0/analytic-rank`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.2, p. 1: The theorem.
- [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2), §1.0.1, p. 1: Attribution of ord ≤ 1 ⇒ rank = ord and finite Sha.

**Acceptance.**

- E = 37a1: rank 1 and Ш(E/ℚ) finite (indeed trivial, a statement for BSD.8/BSD.9).
- The same argument gives rank E^K(ℚ) = 0 and finite Ш(E^K/ℚ) for the auxiliary K.

**Layer completion obligations.**

The target-level chain has no additional refinement listed for this layer.

## BSD.4

Prove analytic rank zero gives rank zero and finite Tate–Shafarevich group by quadratic descent and independently by Kato. The finite-level Kato upper bound is one-sided and does not assume a main-conjecture equality. The requested endpoint includes the CM and all-prime finiteness branches.

### analytic-rank-zero-theorem — Analytic rank zero implies rank zero and finite Sha (Kolyvagin)

Target `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem` (theorem). Atlas planet: **Kolyvagin's rank-zero theorem**.

For every elliptic curve E/ℚ with ellipticL E 1 ≠ 0 (analyticRank E = 0): E(ℚ) is finite and Ш(E/ℚ) is finite. No further hypothesis is placed on E.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E = 0.

**Construction or proof.**

1. rootNumber E = +1 (BSD.0/root-number-parity). Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, and analyticRank E^K = 1, so L(E/K, s) has a simple zero with L′(E/K, 1) = L(E, 1)L′(E^K, 1) ≠ 0 (BSD.0/base-change-central-identities (b)).
2. BSD.3/heegner-point-nontorsion: y_K has infinite order; HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) finite.
3. BSD.3/heegner-point-eigenspace with rootNumber E = +1: y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order, so rank E^K(ℚ) ≥ 1.
4. BSD.1/rank-splitting: rank E(ℚ) + rank E^K(ℚ) = 1, so rank E(ℚ) = 0 and E(ℚ) is finite. The sign calculation is direct: BSD.3 is not applied to E^K.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

**Prerequisites.** `RankZeroOneBSD:BSD.2/heegner-field-selection`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.0/root-number-parity`, `RankZeroOneBSD:BSD.3/heegner-point-nontorsion`, `RankZeroOneBSD:BSD.3/heegner-point-eigenspace`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `RankZeroOneBSD:BSD.1/rank-splitting`, `RankZeroOneBSD:BSD.1/sha-finiteness-descent`, `RankZeroOneBSD:BSD.0/analytic-rank`.

**Sources.**

- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544: The route: a twist with a simple zero, Gross–Zagier over K and Kolyvagin.

**Acceptance.**

- E = 11a1: E(ℚ) ≅ ℤ/5 and Ш(E/ℚ) finite.
- The argument also yields rank E^K(ℚ) = 1 and Ш(E^K/ℚ) finite for the auxiliary field.

### kato-rank-zero-finiteness — The Beilinson–Kato route to finiteness in analytic rank zero

Target `RankZeroOneBSD:BSD.4/kato-rank-zero-finiteness` (theorem).

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0, and f = F_E. For every prime p and every G_ℚ-stable lattice T ⊂ V_p(E), Kato's Bloch–Kato Selmer group Sel(ℚ, T) ⊂ H¹(ℚ, T ⊗ ℚ/ℤ) is finite, and Sel(ℚ, T) = 0 for all but finitely many p. Consequently E(ℚ) is finite and Ш(E/ℚ) is finite, and Ш(E/ℚ)[p^∞] = 0 for all but finitely many p. This route uses the Beilinson–Kato Euler system, its explicit reciprocity law and the nonvanishing of L(E, 1); it uses no Heegner point, no primitivity of Kato's classes and no main conjecture.

**Hypotheses.**

- Kato, Theorem 14.2(2) with K = ℚ, χ trivial, k = 2, r = k/2 = 1, so V_{F_λ}(f)(1) ≅ V_p(E) by EllipticCurveModularity R29.4/tate-module-comparison.
- The identification of Kato's Sel(ℚ, T_p E) with Sel_{p^∞}(E/ℚ) of EllipticCurves Layer 7: Bloch–Kato's H¹_f at p is the Kummer image (finite flat or Tate-curve local condition).

**Construction or proof.**

1. KatoEulerSystems L3: the zeta class z_γ interpolates L(f, 1) through the dual exponential, so its localisation at p is nonzero when L(f, 1) ≠ 0.
2. KatoEulerSystems L4 and EulerSystemsAndKolyvaginSystems ES.4: the Euler-system bound kills the Selmer group up to the index of the bottom class, which is finite.
3. For almost all p the image of G_ℚ contains SL₂(ℤ_p) (or the CM Cartan analogue) and the bottom class is a unit multiple, giving vanishing.
4. Sel(E/ℚ) = ⊕_p Sel(ℚ, T_p E) (Kato §14.1) is then finite, so E(ℚ) ⊗ ℚ_p/ℤ_p and Ш(E/ℚ) are finite.

**Prerequisites.** `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EllipticCurveModularity:R29.4/tate-module-comparison`, `RankZeroOneBSD:BSD.0/analytic-rank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `KatoEulerSystems:L4`.

**Sources.**

- [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 14.2(2), p. 235: Finiteness of the Selmer group (transcribed from the Numdam scan, whose text layer is garbled).
- [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §14.1, p. 235: Kato's Selmer groups recover the usual Selmer group.

**Acceptance.**

- Agrees with analytic-rank-zero-theorem on every E; for E = 11a1 both give E(ℚ) finite and Ш(E/ℚ) finite.

### kato-p-part-upper-bound — Kato's upper bound for the p-part of Sha in analytic rank zero

Target `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound` (theorem).

Let E/ℚ be elliptic with good or multiplicative reduction at an odd prime p, E[p] irreducible, and ellipticL E 1 ≠ 0. Then ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L(E, 1)/(Ω_E · ∏_ℓ c_ℓ(E))), where L(E, 1)/Ω_E ∈ ℚ^× by BSD.5/rank-zero-rationality.

**Hypotheses.**

- p odd, good or multiplicative reduction at p, E[p] irreducible (so E(ℚ)[p] = 0 and the torsion term is a p-adic unit).
- Ω_E is the full real period of EllipticCurves Layer 7.

**Construction or proof.**

1. Import the requested finite-level one-sided Kato bound with good ordinary, supersingular and multiplicative local cases stated separately. The current cohomological height-one divisibility alone does not give this conclusion.
2. Use the requested augmentation/Fitting and compact/discrete local-control comparison, retaining every Euler and Tamagawa factor. Do not use BSD.6/cyclotomic-specialization-formula here: it assumes an equality/main conjecture, whereas this is a one-sided input.
3. Transport canonical periods to the full Néron real period using the exact Manin-constant integrality hypotheses from GZ.3; the multiplicative p∥N branch needs its separately requested export. Rationality is an early modular-symbol result, currently located in BSD.5 and proposed for an early export.

**Prerequisites.** `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `GrossZagierAndArithmeticHeights:GZ.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `KatoEulerSystems:L4`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(i), p. 42: Attribution and scope of the bound.

**Acceptance.**

- E = 11a1, p = 3: ord₃(L(E,1)/(Ω_E c₁₁)) = ord₃(1/25) = 0, so Ш(E/ℚ)[3^∞] = 0.

### analytic-rank-at-most-one-theorem — Analytic rank at most one: rank equals analytic rank and Sha is finite

Target `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` (theorem). Atlas planet: **Analytic rank at most one theorem**.

For every elliptic curve E/ℚ with analyticRank E ≤ 1: Module.finrank ℤ (E(ℚ)/tors) = analyticRank E and Ш(E/ℚ) is finite. The separate conclusions (rank equality; finiteness of the whole of Ш) are exported as distinct declarations.

**Hypotheses.**

- E/ℚ elliptic, analyticRank E ≤ 1; no hypothesis on reduction, CM or residual representations.

**Construction or proof.**

1. analyticRank E = 0: analytic-rank-zero-theorem.
2. analyticRank E = 1: BSD.3/analytic-rank-one-theorem.

**Prerequisites.** `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem`, `RankZeroOneBSD:BSD.3/analytic-rank-one-theorem`.

**Sources.**

- [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2), §1.0.1, p. 1: The combined theorem.

**Acceptance.**

- 11a1: rank 0 = analytic rank; 37a1: rank 1 = analytic rank; both with finite Ш.

### kato-heegner-comparison — The Kato and Heegner routes in analytic rank zero compared

Target `RankZeroOneBSD:BSD.4/kato-heegner-comparison` (comparison).

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0. (a) Both analytic-rank-zero-theorem (Heegner points on an auxiliary E^K, Kolyvagin over K) and kato-rank-zero-finiteness (Beilinson–Kato elements over ℚ) prove that E(ℚ) and Ш(E/ℚ) are finite, and both prove Ш(E/ℚ)[p^∞] = 0 for all p outside a finite set. (b) At an odd prime p of good or multiplicative reduction with E[p] irreducible, the Kato route gives the explicit bound ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p(L(E,1)/(Ω_E ∏c_ℓ)) (kato-p-part-upper-bound), whereas the Heegner route bounds #Ш(E/K)[p^∞] by the square of the Heegner index of the auxiliary twist, which first involves the auxiliary height/index; conversion to L(E,1) requires Gross–Zagier and the auxiliary twist factors. (c) Neither route uses a main conjecture or the primitivity of an Euler system; the equality of p-parts needs the main-conjecture inputs of BSD.6.

**Hypotheses.**

- As in the two theorems compared.

**Construction or proof.**

1. (a) is the conjunction of the two theorems' conclusions; the finite exceptional sets are the primes where the Kolyvagin (HE.7/almost-all-primary-sha-vanishing) or Kato (large-image) arguments lose control.
2. (b) compares kato-p-part-upper-bound with HE.6/sha-square-index-bound applied to E^K and BSD.1/odd-selmer-sha-decomposition.
3. (c) records the inputs of each proof.

**Prerequisites.** `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem`, `RankZeroOneBSD:BSD.4/kato-rank-zero-finiteness`, `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.2, p. 42: The Kato route's p-adic bound.

**Acceptance.**

- 11a1: both routes give E(ℚ) finite and Ш(E/ℚ) finite; at p = 3 the Kato bound already gives Ш(E/ℚ)[3^∞] = 0.

**Layer completion obligations.**

- Kato14.2(2), printed p.235, includes all primes and CM curves; request its exact Selmer/local-condition endpoint, CM proof and one-sided finite-level bound instead of presuming the narrower current L4 supplier.
- Apply early BSD.0a rationality export to break the BSD.4↔BSD.5 stage cycle; see cumulative graph check and restructure proposal.

## BSD.5

Relate the leading coefficient to real periods, canonical heights and the Heegner index. Prove rationality and positivity separately. Keep definite congruence periods early, and distinguish the proved index identity from the Gross–Zagier index conjecture.

### rank-zero-rationality — Rationality of L(E,1)/Ω_E

Target `RankZeroOneBSD:BSD.5/rank-zero-rationality` (theorem).

For every elliptic curve E/ℚ, ellipticL E 1 / Ω_E is rational, where Ω_E is the full real Néron period. When L(E,1)≠0 the ratio is nonzero. No specific denominator bound is asserted without a separate integral modular-symbol/Manin–Drinfeld computation.

**Hypotheses.**

- E/ℚ elliptic; the Manin constant enters through the comparison of Ω_E with the modular-symbol period Ω_f^+.

**Construction or proof.**

1. Modular symbols: L(f, 1) = −2πi ∫_0^{i∞} f(z)dz = Ω_f^+ · ½T(φ^+) with T(φ^+) ∈ ℚ (MSPL L1/critical-value-algebraicity with k = 0, j = 0, χ = 1, f = F_E, coefficient field ℚ).
2. Period comparison: φ_E^* ω_E = c·2πi F_E dz (EllipticCurveModularity R29.5/modular-parametrisation); the image of H₁(X₀(N), ℤ)^+ under ∫ φ_E^*ω_E is a sublattice of the real period lattice of E of finite index, so −2πiΩ_f^+(φ^+) ∈ ℚ^× · Ω_E⁰ for an integral generator φ^+ (MSPL L1/integral-period-lattices).
3. Ω_E = c∞ Ω_E⁰ (GZ.0/real-period-components), with c∞ ∈ {1, 2}.
4. Combine with BSD.0/rational-newform-bridge (L(E, s) = L(F_E, s)).

**Prerequisites.** `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`, `ModularSymbolsPadicLFunctions:L1/period-lines`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `RankZeroOneBSD:BSD.0/rational-newform-bridge`, `RankZeroOneBSD:BSD.0/analytic-rank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `GrossZagierAndArithmeticHeights:GZ.3`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(i), p. 42: The rank-zero quotient whose p-adic valuation is taken presupposes its rationality.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.3.2, (7.3.b), p. 44: The comparison of Ω_E with −2πiΩ_f^+ up to ℤ_(p)^×.

**Acceptance.**

- E = 11a1: L(E,1)/Ω_E = 1/5.
- E = 37a1: L(E,1)/Ω_E = 0 (rank one).

### leading-term-positivity — Positivity of the leading term in analytic rank at most one

Target `RankZeroOneBSD:BSD.5/leading-term-positivity` (theorem). Atlas planet: **Positivity of the leading term**.

For every elliptic curve E/ℚ with analyticRank E ≤ 1, leadingTerm E > 0: L(E, 1) > 0 if the analytic rank is 0, and L′(E, 1) > 0 if it is 1. Positivity rests on the nonnegativity of central values L(1/2, π ⊗ χ) ≥ 0 for cuspidal π on PGL₂/ℚ and quadratic χ (Waldspurger), requested from GrossZagierAndArithmeticHeights GZ.5, together with the sign of the Gross–Zagier formula.

**Hypotheses.**

- analyticRank E ≤ 1.
- The nonnegativity input is the requested quadratic central-value nonnegativity theorem; modular symbols give only rationality, not sign.

**Construction or proof.**

1. Rank zero: L(E, 1) = L(1/2, π_E) ≥ 0 by the requested Waldspurger nonnegativity (χ trivial), and L(E,1) ≠ 0.
2. Rank one: choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0; then L′(E/K, 1) = L′(E, 1)L(E^K, 1) (BSD.0/base-change-central-identities) and L′(E/K, 1) > 0 because y_K has infinite order (BSD.3/heegner-point-nontorsion, converse direction).
3. L(E^K, 1) > 0 by the rank-zero case applied to E^K, so L′(E, 1) > 0.

**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.5`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `RankZeroOneBSD:BSD.2/heegner-field-selection`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.3/heegner-point-nontorsion`, `RankZeroOneBSD:BSD.0/analytic-rank`.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §1, Corollary (1.1), pp. 308–309 (excerpt as verified by GZ.8): Sign of the derivative over K.

**Acceptance.**

- L(11a1, 1) = 0.2538… > 0 and L′(37a1, 1) = 0.3059… > 0 (numerical values for orientation; certification is BSD.9's).

### rank-one-rationality — Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one

Target `RankZeroOneBSD:BSD.5/rank-one-rationality` (theorem). Atlas planet: **Rationality of L′(E,1)/ΩReg**.

For every elliptic curve E/ℚ with analyticRank E = 1, L′(E, 1)/(Ω_E · Reg_BSD(E/ℚ)) ∈ ℚ_{>0}, where Reg_BSD is GZ.0's regulator in the x-height normalisation (twice Tau Ceti's regulator in rank one).

**Hypotheses.**

- analyticRank E = 1 (so rank E(ℚ) = 1 by BSD.3/analytic-rank-one-theorem).
- Normalisation: GZ.0/height-convention-dictionary; with Tau Ceti's regulator the quotient changes by the factor 2.

**Construction or proof.**

1. Choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0 and D_K odd.
2. Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula): L′(E,1)·L(E^K,1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with C, u_K ∈ ℤ_{>0}.
3. heegner-index-height-formula: ĥ_K(y_K) = I_K² · 2 · Reg_BSD(E/ℚ)/4^a.
4. BSD.1/quadratic-period: ‖ω₀‖²/|D_K|^{1/2} = r·Ω_E·Ω_{E^K} with r ∈ ℚ^× (a power of 2 when (D_K, 2N) = 1).
5. rank-zero-rationality for E^K: L(E^K, 1)/Ω_{E^K} ∈ ℚ^×. Dividing gives L′(E,1)/(Ω_E Reg_BSD) ∈ ℚ^×, positive by leading-term-positivity.

**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `RankZeroOneBSD:BSD.5/heegner-index-height-formula`, `RankZeroOneBSD:BSD.1/quadratic-period`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.5/leading-term-positivity`, `RankZeroOneBSD:BSD.2/heegner-field-selection`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.2, p. 2: The statement, with its source.

**Acceptance.**

- E = 37a1: L′(E,1)/(Ω_E Reg_BSD) = 1 (Ш trivial, c₃₇ = 1, E(ℚ)_tors = 0), as BSD.9 certifies.

### heegner-index — The Heegner index

Target `RankZeroOneBSD:BSD.5/heegner-index` (definition). Atlas planet: **Heegner index**.

Let E/ℚ be elliptic, K imaginary quadratic satisfying the Heegner hypothesis, and y_K ∈ E(K) the Heegner point attached to a fixed modular parametrisation φ. When rank E(K) = 1 and y_K has infinite order, heegnerIndex := I_K = [E(K) : ℤ·y_K] (Gross's index, which includes E(K)_tors), and the free index I_K^free := [E(K)/tors : ℤ·ȳ_K]; I_K = I_K^free · #E(K)_tors. For positive integer multiples mφ on the fixed curve, I_K and c_φ both scale by m, so I_K/c_φ is unchanged. Across an isogeny the Mordell–Weil lattice and torsion change and need explicit correction factors.

**Hypotheses.**

- rank E(K) = 1 (supplied by BSD.3/BSD.4 for the fields of BSD.2) and y_K of infinite order.

**Construction or proof.**

1. Both indices are finite because ȳ_K is a nonzero element of the rank-one free group E(K)/tors.
2. I_K = I_K^free·#E(K)_tors from the exact sequence 0 → E(K)_tors → E(K) → E(K)/tors → 0 restricted to ℤy_K, which meets torsion trivially.
3. For positive multiples mφ on the fixed E, y_K becomes my_K and c_φ becomes mc_φ; in the rank-one free lattice the index scales by m. An arbitrary isogeny is not multiplication by an integer on the same lattice.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BSD.heegnerIndex` | constructor | I_K = [E(K) : ℤ y_K] as a positive natural number, given rank E(K) = 1 and y_K of infinite order. |
| `TauCeti.BSD.heegnerIndexFree` | constructor | I_K^free = [E(K)/tors : ℤ ȳ_K]. |
| `TauCeti.BSD.heegnerIndex_eq_free_mul_torsion` | relation | I_K = I_K^free · #E(K)_tors. |
| `TauCeti.BSD.heegnerIndex_pos` | other | 0 < I_K. |
| `TauCeti.BSD.heegnerIndex_div_maninConstant_invariant` | compatibility | For m>0 on the fixed E, I(my_K)/(m c_φ)=I(y_K)/c_φ; no arbitrary-isogeny invariance is asserted. |
| `TauCeti.BSD.torsion_dvd_heegnerIndex` | relation | #E(ℚ)_tors divides I_K. Assume y_K has infinite order and finite index. |
| `TauCeti.BSD.not_dvd_heegnerIndex_of_large` | other | For all but finitely many primes p, p ∤ I_K (HE.7/non-torsion-point-prime-divisibility). Assume finite index (so I_K>0); a zero junk index is divisible by every prime. |

**Consumers.**

- `RankZeroOneBSD:BSD.5/heegner-index-height-formula`: ĥ_K(y_K) = I_K^free² Reg(E/K)
- `RankZeroOneBSD:BSD.5/gross-index-formula`: Gross's conjecture #Ш(E/K) = (I_K/(c·m))²
- `HeegnerPointEulerSystems HE.6/sha-square-index-bound`: Kolyvagin's bound ord_p #Ш(E/K) ≤ 2 ord_p I_K
- `JSW §7.4`: m_{K′} = [E(K′) : ℤ z_{K′}] in the lower and upper bounds

**Unit tests.**

- `TauCeti.BSD.heegnerIndex_torsion_factor` (characterisation): heegnerIndex = heegnerIndexFree * Nat.card (E(K)_tors).
- `TauCeti.BSD.heegnerIndex_scale` (non-example): Replacing φ by 2φ doubles y_K and the index I_K while c_φ doubles too; so I_K alone is not an invariant of E and K, only I_K/c_φ.
- `TauCeti.BSD.heegnerIndex_11a` (computation): For E₀ = J₀(11) = 11a1 (E(ℚ)_tors ≅ ℤ/5), 5 divides I_K for every point y_K of infinite order generating a finite-index subgroup: the torsion meets ℤy_K trivially (GZ86 Chapter V §2, before (2.3)).
- `TauCeti.BSD.heegnerIndexFree_one_of_generator` (degenerate): If ȳ_K generates E(K)/tors then I_K^free = 1 and I_K = #E(K)_tors. Assume y_K has infinite order, not merely that its image generates a possibly rank-zero quotient.

**Prerequisites.** `RankZeroOneBSD:BSD.3/heegner-point-nontorsion`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `tauceti:WeierstrassCurve.Affine.finite_torsion`.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.2) Conjecture, p. 311: The index of ℤP_K in E(K).
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: The index used in the p-part argument.

**Acceptance.**

- E = 37a1: y_K = m_K·(0,0) up to torsion and I_K = |m_K| (the integers m_K are coefficients of a weight-3/2 form, Gross §1).
- GZ86 (2.3): t = #E(ℚ)_tors divides I_K.

### heegner-index-height-formula — Height of the Heegner point and the squared index

Target `RankZeroOneBSD:BSD.5/heegner-index-height-formula` (theorem).

In the setting of heegner-index, with heights relative to K in the x-height normalisation: ĥ_K(y_K) = (I_K^free)² · Reg_BSD(E/K). If moreover rank E(ℚ) = 1 and rank E^K(ℚ) = 0 (the case of BSD.3), then Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ)/4^a with 2^a = [E(K)/tors : res(E(ℚ)/tors)] ∈ {1, 2}, so ĥ_K(y_K) = 2·(I_K^free)²·Reg_BSD(E/ℚ)/4^a.

**Hypotheses.**

- rank E(K)=1; y_K non-torsion, with finite index; use K-relative x-height, namely twice the pinned (O)-height, and Mathlib’s number-field absolute-value/Northcott instances.

**Construction or proof.**

1. In a rank-one lattice the regulator is the height of a generator, and ĥ is quadratic: ĥ_K(y_K) = (I^free)² ĥ_K(generator).
2. BSD.1/quadratic-regulator-comparison with r₊ = 1, r₋ = 0.

**Prerequisites.** `RankZeroOneBSD:BSD.5/heegner-index`, `RankZeroOneBSD:BSD.1/quadratic-regulator-comparison`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`, `mathlib:NumberField.instAdmissibleAbsValues`, `mathlib:NumberField.totalWeight_eq_finrank`, `mathlib:NumberField.finite_setOfPred_logHeight₁_le`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: JSW's version up to p-adic units (their index enters squared in the height).

**Acceptance.**

- E = 37a1: if ȳ_K = m·res(P₀) + torsion with P₀ = (0,0) and a = 0, then ĥ_K(y_K) = 2m²·ĥ_x(P₀) = 2m²·0.0511…, with ĥ_x(P₀) = Reg_BSD(37a1).

### gross-index-formula — Gross–Zagier's index conjecture as a form of BSD over K

Target `RankZeroOneBSD:BSD.5/gross-index-formula` (theorem). Atlas planet: **Gross–Zagier index formula**.

Let E/ℚ be elliptic of conductor N with optimal parametrisation of Manin constant c, K imaginary quadratic with D_K odd, every prime of N split, u_K = #𝓞_K^×/2, rank E(K) = 1, y_K has infinite order, and Ш(E/K) finite. For a prime ℓ | N let m_ℓ be the order of the component group of the Néron model at either prime above ℓ, and m = ∏_{ℓ|N} m_ℓ. Then for every odd prime p ∤ D_K, the p-part of the BSD formula for E/K (JSW (7.1.a)) holds if and only if ord_p I_K = ord_p(c · m · u_K) + ½ ord_p #Ш(E/K), i.e. the p-part of Gross–Zagier's Conjecture (2.2): I_K = c·m·u_K·#Ш(E/K)^{1/2}. In particular the p-part of BSD for E/K implies that t = #E(ℚ)_tors divides c·m·u_K·#Ш(E/K)^{1/2} in its p-part (Conjecture (2.3)). For D_K ∉ {−3, −4} (u_K = 1) this is Gross's Conjecture 1.2(2): #Ш(E/K) = (I_K/(c·∏_{ℓ|N} m_ℓ))² with m_ℓ = [E(ℚ_ℓ) : E⁰(ℚ_ℓ)]. The index bound, the Sha bound and the exact formula are three different statements: Kolyvagin's Theorem 1.3 (#Ш(E/K) divides t_{E/K}·I_K²) and Howard's ord_p #Ш(E/K) ≤ 2 ord_p I_K (HE.6) are only one inequality.

**Hypotheses.**

- Gross–Zagier's standing hypotheses (D_K odd, Heegner hypothesis); p odd and p ∤ D_K so that powers of 2 and the discriminant term are units.
- m_ℓ is the same at both primes above a split ℓ (m_𝔭 = m_𝔭̄), so ∏_{w|N} c_w(E/K) = m².
- The modular Heegner point y_K has infinite order (equivalently the base-change analytic rank is one in this setting). Algebraic rank one by itself is not an analytic simple-zero hypothesis.

**Construction or proof.**

1. Write BSD for E/K: L′(E/K,1)/(Ω_{E/K} Reg_BSD(E/K) |D_K|^{−1/2}) = #Ш(E/K)·∏_w c_w(E/K)/#E(K)_tors².
2. Substitute Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula) for L′(E/K,1), heegner-index-height-formula for ĥ_K(y_K) = (I_K^free)² Reg_BSD(E/K), and BSD.1/quadratic-period for ‖ω₀‖² versus Ω_{E/K}.
3. I_K = I_K^free·#E(K)_tors cancels the torsion term; the Tamagawa product over K is m² (split primes, BSD.1/tamagawa-base-change).
4. What remains is (I_K)² = (c·m·u_K)²·#Ш(E/K) up to powers of 2, which are p-adic units.

**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `RankZeroOneBSD:BSD.5/heegner-index-height-formula`, `RankZeroOneBSD:BSD.5/heegner-index`, `RankZeroOneBSD:BSD.1/quadratic-period`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `RankZeroOneBSD:BSD.1/odd-part-bsd-over-K`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index`.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.2) Conjecture, p. 311: Conjecture (2.2).
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.3) Conjecture, p. 311: Conjecture (2.3), with t = |E(ℚ)_tors|.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1, Conjecture 1.2(2), p. 236 (read from the page image): Gross's form of the index formula.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1, Theorem 1.3(2), p. 236: Kolyvagin's one-sided bound.

**Acceptance.**

- Gross's example E = X₀(37)/w₃₇ (37a1, φ of degree 2, c = 1, m₃₇ = 1): the formula reads #Ш(E/K) = I_K², and y_K = m_K·(0,0) with the m_K Fourier coefficients of a weight-3/2 form; certifying instances is BSD.9's.
- GZ86 examples at N = 11: (E₀ = J₀(11); c, m, t) = (1, 5, 5), (J₁(11); 5, 1, 5), (E₀/(ℤ/5ℤ); 1, 1, 1): t | c·m in each case.
- N = 65: for E₀ = J₀(65)/⟨w₅, w₁₃⟩, (c, m, t) = (1, 1, 2), so for K ≠ ℚ(i) with 5 and 13 split the conjecture forces 2 | #Ш(E/K)^{1/2} or rank E(K) > 1; Kramer's computation gives 2-Selmer rank ≥ 4 (stated in GZ86, not reproved here).

### definite-congruence-period — The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston)

Target `RankZeroOneBSD:BSD.3a/definite-congruence-period` (theorem).

Let g ∈ S₂(Γ₀(N)) be a newform with trivial character and Hecke field with ring O, 𝔭 | p ≥ 5 a prime of O with p ∤ N, ρ̄_{g,𝔭} : G_ℚ → GL₂(k₀) surjective, and N = N⁺N⁻ with N⁻ squarefree with an odd number of prime factors (the definite quaternion algebra of discriminant N⁻), satisfying Pollack–Weston's hypothesis CR (in particular ρ̄ ramified at every ℓ | N⁻ with ℓ ≡ ±1 mod p, and the nonsquarefree alternatives of Hypothesis ♥ when N is not squarefree). Let η_g(N) be the congruence number of g at full level and ξ_g(N⁺, N⁻) the self-pairing of a primitive integral eigenfunction on the definite quaternion algebra. Then ord_𝔭 (η_g(N)/ξ_g(N⁺, N⁻)) = Σ_{ℓ|N⁻} t_g(ℓ), where t_g(ℓ) = length_{O_𝔭} Φ(A_g/ℚ_ℓ)_𝔭 is the 𝔭-part of the Tamagawa (component-group) factor at ℓ.

**Hypotheses.**

- The hypotheses are those of HeegnerPointEulerSystems HE.6/ribet-takahashi-tamagawa-comparison, which consumes this node; its contract forbids HE.6, rank-zero BSD, Jochnowitz congruences and the final Heegner-index result as inputs.
- This is an early export (proposed sub-layer BSD.3a); it depends only on Néron-model character groups and the GL₂ transfer.

**Construction or proof.**

1. Character groups: for N₁N₂ with N₂ having an even number of primes, the character group X̂_r(J) of the Shimura curve Jacobian's toric part at r | N⁻ is free of rank one over the localised Hecke algebra under CR (Pollack–Weston Theorem 6.2, from NeronModelsAndSemistableAbelianVarieties R11.4/characters-graph-homology, R11.4/integral-monodromy-pairing).
2. The monodromy pairing on X̂_r computes congruence numbers: ⟨g_r, g_r⟩ = η_g(N₁/r, rN₂) (Pollack–Weston Proposition 6.4) and the cokernel of the monodromy map is the component group (R11.4/component-cokernel).
3. Ribet–Takahashi: comparing the pairings at successive levels gives ord_𝔭 η_g(aℓ, b) = t_g(ℓ) + ord_𝔭 η_g(a, ℓb) (Pollack–Weston (2)); degeneracy maps and their adjoints are R11.6/degeneracy-functoriality.
4. Iterate over the primes of N⁻ and identify ξ_g(N⁺, N⁻) with η_g(N⁺, N⁻) by freeness (the GL₂ transfer of GL2AutomorphicRepresentationsAndTransfer R17.3 gives the Jacquet–Langlands eigenfunction).

**Prerequisites.** `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing`, `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`, `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`, `NeronModelsAndSemistableAbelianVarieties:R11.6/character-exact-sequences`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GrossZagierAndArithmeticHeights:GZ.3`.

**Sources.**

- [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/abs/math/0610694v1), §1, formula (1), p. 3: The identity ord_p(η_f(N)/ξ_f(N⁺,N⁻)) = Σ_{q|N⁻} t_f(q).
- [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/abs/math/0610694v1), §6.1, end of the section: The proof route.

**Acceptance.**

- When N⁻ = ℓ is prime and p ∤ c_ℓ(g), ord_𝔭 η_g(N) = ord_𝔭 ξ_g(N⁺, ℓ).
- JSW use the elliptic case: δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ up to p-units (ribet-takahashi-degree-comparison).

### ribet-takahashi-degree-comparison — Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi)

Target `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison` (theorem). Atlas planet: **Ribet–Takahashi degree formula**.

For the semistable optimal degree comparison under the localised multiplicity-one/freeness and residual hypotheses of JSW7.3.2 and the selected Ribet–Takahashi theorem, v_p(δ(N,1)/δ(N⁺,N⁻))=Σ_{ℓ|N⁻} v_p(ord_ℓ Δ_min(E)), with N⁻ of even cardinality. These are geometric component multiplicities. In JSW’s application ℓ|N⁻ is inert in K′, so over K′ the multiplicative torus splits and c_ℓ(E/K′)=ord_ℓ Δ_min. At a nonsplit rational multiplicative prime c_ℓ(E/ℚ) is only 1 or 2 and cannot be substituted.

**Hypotheses.**

- Indefinite quaternion algebra (N⁻ with an even number of primes); E[p] irreducible so that the relevant Hecke modules are free (Ribet's multiplicity one).
- The exact localised character-module freeness and period comparison must be proved under the endpoint hypotheses; irreducibility alone is not silently identified with Pollack–Weston CR/surjectivity.

**Construction or proof.**

1. Degrees are congruence numbers up to p-adic units: δ(N, 1) ~ η_E(N) and δ(N⁺, N⁻) ~ η_E(N⁺, N⁻) (multiplicity one at the maximal ideal of E[p]).
2. Apply the Ribet–Takahashi recursion of definite-congruence-period one prime at a time along N⁻, now in the indefinite case (component groups of J₀(N) and of the Shimura-curve Jacobian at ℓ | N⁻, R11.4).
3. An unramified quadratic extension makes the nonsplit multiplicative torus split; its geometric component multiplicity is ord_ℓ Δ_min. Rational c_ℓ need not have the same odd p-part. Use the K′ factor or the geometric multiplicity in the degree recursion.

**Prerequisites.** `RankZeroOneBSD:BSD.3a/definite-congruence-period`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`, `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`, `GrossZagierAndArithmeticHeights:GZ.3`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46: The degree comparison as JSW use it, up to a unit in ℤ_p^×.

**Acceptance.**

- JSW §7.4.1: δ_{N⁺,N⁻} = δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ(E/K′) up to ℤ_p^×.

### rational-bsd-defect — The rational BSD defect

Target `RankZeroOneBSD:BSD.5/rational-bsd-defect` (definition). Atlas planet: **Rational BSD defect**.

For E/ℚ elliptic with analyticRank E ≤ 1 (so rank E(ℚ) = analyticRank E and Ш(E/ℚ) is finite by BSD.4/analytic-rank-at-most-one-theorem), bsdDefect E := leadingTerm E · #E(ℚ)_tors² / (Ω_E · Reg_BSD(E/ℚ) · #Ш(E/ℚ) · ∏_ℓ c_ℓ(E)). It is a positive rational number: bsdDefect E ∈ ℚ_{>0}, with the real identity leadingTerm E = bsdDefect E · (Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors²). The Birch–Swinnerton-Dyer formula for E is the statement bsdDefect E = 1, and its p-part is padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- The arithmetic quotient Ω_E·Reg·#Ш·∏c_ℓ/#tors² is EllipticCurves Layer 7's BSD quotient, stated with GZ.0's Reg_BSD (x-height normalisation); with Tau Ceti's halved regulator the defect changes by 2^{rank}.
- Only finitely many c_ℓ differ from 1 (good primes), so the product is finite.

**Construction or proof.**

1. Rationality: rank-zero-rationality (rank 0, Reg = 1) and rank-one-rationality (rank 1); the arithmetic terms other than Ω_E and Reg are integers.
2. Positivity: leading-term-positivity, Ω_E > 0, Reg_BSD > 0 (positive-definite height on the free quotient), c_ℓ ≥ 1, #Ш ≥ 1.
3. Define the rational number as the quotient of the rational L*(E,1)/(Ω_E Reg_BSD) by #Ш ∏c_ℓ / #tors².

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `WeierstrassCurve.bsdDefect` | constructor | bsdDefect E : ℚ for E/ℚ with analyticRank E ≤ 1. |
| `WeierstrassCurve.bsdDefect_pos` | other | 0 < bsdDefect E. |
| `WeierstrassCurve.leadingTerm_eq_bsdDefect_mul` | characterisation | leadingTerm E = bsdDefect E · Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors² as real numbers. |
| `WeierstrassCurve.bsdDefect_eq_one_iff` | characterisation | bsdDefect E = 1 ↔ the full BSD formula (1.1.a) holds for E. |
| `WeierstrassCurve.padicValRat_bsdDefect` | relation | padicValRat p (bsdDefect E) = v_p(L*/(Ω Reg)) + 2 v_p(#tors) − v_p(#Ш) − Σ_ℓ v_p(c_ℓ). |
| `WeierstrassCurve.bsdDefect_eq_of_isogenous` | compatibility | Isogenous curves have equal defects (defect-isogeny-invariance). |
| `WeierstrassCurve.bsdDefect_regulator_convention` | compatibility | The defect computed with Tau Ceti's regulator equals 2^{analyticRank E} · bsdDefect E (GZ.0/bsd-regulator). |
| `WeierstrassCurve.bsdDefect_eq_one_of_forall_padicValRat` | characterisation | If padicValRat p (bsdDefect E) = 0 for every prime p then bsdDefect E = 1 (positive rational, BSD.8's reconstruction). |

**Consumers.**

- `RankZeroOneBSD:BSD.6`: each prime-part theorem is the statement padicValRat p (bsdDefect E) = 0 under its hypotheses
- `RankZeroOneBSD:BSD.8/elliptic-endpoint`: the full formula from a finite certificate of vanishing valuations (BSD.7 packet request: d_E ∈ ℚ, 0 < d_E, real identity)
- `PeriodsAndSpecialValues:PS.6`: re-export of prime-part and conditional full formulas
- `JSW Theorem 1.2.1`: (1.2.a) is ord_p of the defect being zero

**Unit tests.**

- `WeierstrassCurve.bsdDefect_11a1` (computation): bsdDefect (11a1) = 1 (L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, #Ш = 1).
- `WeierstrassCurve.bsdDefect_rank_zero_regulator` (degenerate): If analyticRank E = 0 then Reg_BSD = 1 and bsdDefect E = L(E,1)·#tors²/(Ω_E·#Ш·∏c_ℓ).
- `WeierstrassCurve.bsdDefect_tauCeti_regulator` (non-example): For 37a1 (rank one) the quotient formed with Tau Ceti's halved regulator is 2, not 1: the regulator convention changes the answer.
- `WeierstrassCurve.bsdDefect_11a_isogeny` (compatibility): bsdDefect (11a1) = bsdDefect (11a3) although their periods, torsion and Tamagawa numbers differ.

**Prerequisites.** `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.5/rank-one-rationality`, `RankZeroOneBSD:BSD.5/leading-term-positivity`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`, `RankZeroOneBSD:BSD.0/analytic-rank`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `mathlib:padicValRat`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Conjecture 1.1.1(b), (1.1.a), p. 1: The defect is the ratio of the two sides of (1.1.a).
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7, p. 41: The defect is the ratio and is isogeny invariant.

**Acceptance.**

- 11a1: L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, Ш = 1 gives bsdDefect = (1/5)·25/5 = 1.

### defect-isogeny-invariance — Isogeny invariance of the rational BSD defect

Target `RankZeroOneBSD:BSD.5/defect-isogeny-invariance` (theorem).

If E and E′ are ℚ-isogenous elliptic curves with analyticRank E ≤ 1, then analyticRank E′ = analyticRank E and bsdDefect E = bsdDefect E′.

**Hypotheses.**

- The arithmetic invariance is Cassels' theorem and the analytic invariance is equality of all local factors; both are owned by EllipticCurves Layer 7 (RS-30) and only composed here.

**Construction or proof.**

1. Equal local Euler factors give ellipticL E = ellipticL E′ (BSD.0/actual-l-function, ellipticL_eq_of_isogenous), hence equal analytic rank and leading term.
2. Cassels: the arithmetic BSD quotient Ω·Reg·#Ш·∏c/#tors² is isogeny invariant (EllipticCurves Layer 7), stated with Reg_BSD; the normalisation adapter GZ.0/bsd-regulator is the same on both sides.
3. Divide.

**Prerequisites.** `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.0/actual-l-function`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCeti.Isogeny`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7, p. 41: Isogeny invariance of the ratio.

**Acceptance.**

- 11a1, 11a2, 11a3 all have defect 1.

### p-part-from-two-bounds — The p-part of BSD from an upper and a lower bound

Target `RankZeroOneBSD:BSD.5/p-part-from-two-bounds` (lemma).

Let E/ℚ be elliptic with analyticRank E ≤ 1 and p a prime with E(ℚ)[p] = 0 (for instance p odd with E[p] irreducible). Then padicValRat p (bsdDefect E) = v_p(L*(E,1)/(Ω_E Reg_BSD ∏_ℓ c_ℓ)) − v_p(#Ш(E/ℚ)[p^∞]). Hence the upper bound v_p #Ш[p^∞] ≤ v_p(L*/(ΩReg∏c)) is equivalent to padicValRat p (bsdDefect E) ≥ 0, the lower bound to ≤ 0, and the p-part of the BSD formula to the conjunction of the two bounds. Neither a bound on the Heegner index nor a one-sided Euler-system divisibility alone gives padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- E(ℚ)[p] = 0 so the torsion term is a p-adic unit; for p = 2 or curves with rational p-torsion the torsion term is kept (BSD.7).

**Construction or proof.**

1. Expand padicValRat of the defining quotient (rational-bsd-defect, padicValRat_bsdDefect); v_p(#Ш) = v_p(#Ш[p^∞]); the torsion term vanishes.
2. Reg_BSD's powers of 2 and the regulator itself are absorbed in the rational L*/(Ω Reg) whose valuation is taken as a whole.

**Prerequisites.** `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `mathlib:padicValRat`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.3, p. 2: The two-bound structure.

**Acceptance.**

- JSW (7.4.d) and (7.4.e) are the two bounds whose conjunction is Theorem 1.2.1.

### sha-bound-from-heegner-index — Kolyvagin's index bound as a one-sided p-part statement

Target `RankZeroOneBSD:BSD.5/sha-bound-from-heegner-index` (lemma).

Let E/ℚ, K, y_K be as in heegner-index with rank E(K) = 1, p an odd prime with p ∤ D_K N and G_K → GL₂(ℤ_p) surjective on T_pE, D_K ∉ {−3, −4}. Then ord_p #Ш(E/K)[p^∞] ≤ 2 ord_p I_K (HE.6/sha-square-index-bound), whereas Gross–Zagier's conjecture (gross-index-formula) predicts 2 ord_p I_K = ord_p #Ш(E/K) + 2 ord_p(c·m·u_K). Combined with the rank-zero p-part for E^K (BSD.6) and the odd decomposition of Ш(E/K), the inequality gives an upper bound for ord_p #Ш(E/ℚ)[p^∞]. It is not an exact formula: equality needs the opposite inequality from a main conjecture or from Kolyvagin's primitivity, which this lemma does not supply.

**Hypotheses.**

- Retain all Howard Theorem A hypotheses and parametrisation/local error factors of HE.6; the stated clean inequality is used only when those factors are discharged.

**Construction or proof.**

1. HE.6/sha-square-index-bound gives length Ш[p^∞] ≤ 2·length(E(K) ⊗ ℤ_p/ℤ_p y_K).
2. With E(K)[p] = 0 (surjectivity), the length on the right is ord_p I_K.
3. Convert the index using the proved Gross–Zagier height formula plus quadratic regulator/period comparisons, and split Sha at odd p. gross-index-formula is only an equivalence with BSD; assuming its predicted equality here would assume the desired result.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`, `RankZeroOneBSD:BSD.5/heegner-index`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `RankZeroOneBSD:BSD.5/heegner-index-height-formula`, `RankZeroOneBSD:BSD.1/quadratic-period`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.2, p. 47: The index bound as it is used.

**Acceptance.**

- HE.6/primitivity-versus-nonzero: a nonzero Kolyvagin class gives only this inequality.

**Layer completion obligations.**

- The 2-power bookkeeping in rank-one-rationality and gross-index-formula is stated only up to units at odd primes; the exact dyadic form is BSD.8/BSD.9 work.
- BSD.3a/definite-congruence-period is planned here pending the proposed sub-layer BSD.3a (restructure).
- Apply early BSD.0a rationality export to break the BSD.4↔BSD.5 stage cycle; see cumulative graph check and restructure proposal.

## BSD.6

State the named irreducible-prime formulas with their individual source hypotheses. Ordinary and multiplicative rank zero use Skinner’s cyclotomic argument; supersingular rank zero and the direct semistable rank-one branch use BSTW. JSW rank one compares two inequalities. Castella A′ allows additive reduction away from p and requires its additional local conditions.

### cyclotomic-specialization-formula — Specialising a cyclotomic main conjecture at the trivial character

Target `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula` (theorem). Atlas planet: **Cyclotomic control at the trivial character**.

Let f=F_E have weight two and p≥3 good ordinary or multiplicative, with irreducible residual representation and L(f,1)≠0. Assume the integral cyclotomic main conjecture and the local control/period conventions of Skinner §3.2. If reduction is not split multiplicative, the final equality is #ℤ_p/(L_alg(f,1))=#Sel(f)·∏_ℓ c_ℓ(T_f). The anomalous factor #(ℤ_p/(α_p−1))² appears on both sides before cancellation, not as an extra factor in this final equality. For split multiplicative p use the leading coefficients at γ−1, Greenberg–Stevens and the nonzero L-invariant; the same finite equality results after keeping the p-local Tamagawa factor.

**Hypotheses.**

- Selmer groups with Σ-imprimitive conditions are compared with the primitive ones by local factors at ℓ ∈ Σ (Skinner §3.1).
- In case (b), the nonvanishing of L(V_f) is an input (transcendence of the Tate period), requested from DiophantineApproximationAndTranscendence DT.5; the Greenberg–Stevens derivative formula is requested from PadicFamilies L3.
- L(f,1)≠0, integral main conjecture, precise Greenberg no-finite-submodule/projective-dimension and local control hypotheses; all orders displayed are finite.

**Construction or proof.**

1. No nonzero finite Λ-submodules in X (Greenberg; Skinner Proposition 2.3.3), so char ideals equal Fitting ideals and specialise.
2. Control: 0 → S → Sel_{ℚ∞}(f) → H¹(F_p, (M⁻)^{I_p}) → 0, and the last term vanishes unless α_p = 1 (Skinner §3.2); SelmerIwasawaCohomology L3/iwasawa-descent.
3. Local terms: #K_ℓ = c_ℓ(T_f) for ℓ ≠ p, and #K_p = c′_p c″_p with c′_p = c″_p = #(ℤ_p/(α_p − 1)) when α_p ≠ 1 (Tate local duality).
4. Cancel the local anomalous factor against the interpolation factor before displaying the finite BSD equality, as in Skinner (3.2.7).
5. Split multiplicative case: the extra zero of L_f at the trivial character and of Ch at γ − 1; compare L′_f(0) with L(V_f)·L_alg(f,1) (Greenberg–Stevens) and c_p with ψ_ur/ψ_cyc of the extension class (log_p q_E).

**Prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L4/greenberg-main-conjecture`, `ModularIwasawaMainConjectures:L0`, `PadicFamilies:L3`, `DiophantineApproximationAndTranscendence:DT.5`, `PadicHodgeRegulators:L3/rubin-coleman-map`, `PadicHodgeRegulators:L4/split-multiplicative-augmentation`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §3.2, p. 20: Control at γ − 1.
- [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, Theorem B (iii), p. 2: The exceptional-zero hypothesis, satisfied for elliptic curves by Barré-Sirieix–Diaz–Gramain–Philibert.

**Acceptance.**

- 11a1 at p = 5 is excluded (E[5] reducible); 11a1 at p = 3 (ordinary, good) has L_alg(f,1) a 3-adic unit and Sel(f) = 0.

### rank-zero-ordinary-multiplicative-p-part — The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)

Target `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part` (theorem). Atlas planet: **Skinner–Urban rank-zero p-part**.

Let E/ℚ be elliptic with good ordinary or multiplicative reduction at a prime p ≥ 3, E[p] irreducible, and a prime q ≠ p of multiplicative reduction at which E[p] is ramified. If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0, i.e. ord_p #Ш(E/ℚ)[p^∞] = ord_p (L(E,1)/(Ω_E ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- The hypotheses are JSW Theorem 7.2.1(ii) and Skinner Theorem C, kept exactly; the residual hypothesis is the Skinner–Urban form (q ∥ N with ρ̄ ramified at q), not the stronger FW 1.6 form.
- Multiplicative p (p ∥ N): the main conjecture is Skinner's Theorem A for p | N, and in the split case the exceptional-zero inputs (Greenberg–Stevens, L(V_f) ≠ 0) are used; good ordinary p: Skinner–Urban plus Kato.

**Construction or proof.**

1. Main conjecture Ch_Λ(X) = (L_f) in Λ: for p ∤ N, Skinner–Urban's Theorem in the SU/Skinner Theorem A (p ∤ N) form (requested from ModularIwasawaMainConjectures L1); for p ∥ N, Skinner's Theorem A deduced from the p ∤ N case through Hida families and Fitting ideals (requested as a new ModularIwasawaMainConjectures layer beside L1).
2. cyclotomic-specialization-formula turns the equality into #ℤ_p/(L_alg(E,1)) = #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ, with the split multiplicative case through L(V_f) ≠ 0.
3. Sel_{p^∞}(E/ℚ) = Ш(E/ℚ)[p^∞] as E(ℚ) is finite (BSD.4/analytic-rank-zero-theorem) and E(ℚ)[p] = 0.
4. Periods: Ω_E = −2πiΩ_f^+ up to ℤ_(p)^× (Manin constant prime to p, requested from GZ.3); then BSD.5/p-part-from-two-bounds.

**Prerequisites.** `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`, `ModularIwasawaMainConjectures:L1`, `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem`, `RankZeroOneBSD:BSD.5/p-part-from-two-bounds`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound`, `GrossZagierAndArithmeticHeights:GZ.3`, `PadicFamilies:L3`, `DiophantineApproximationAndTranscendence:DT.5`.

**Sources.**

- [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, Theorem C, p. 3: The hypotheses.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(ii), pp. 42–43: The same branch as JSW state it.

**Acceptance.**

- E = 11a1, p = 3: hypotheses hold with q = 11 (E[3] ramified at 11 since 3 ∤ ord₁₁Δ = 5), and the formula gives Ш(E/ℚ)[3^∞] = 0.

### rank-zero-supersingular-p-part — The p-part of BSD in rank zero at supersingular primes

Target `RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part` (theorem).

Let E/ℚ be semistable, or a quadratic twist of a semistable curve by a character unramified at the primes dividing the conductor of the semistable curve and with discriminant supported at primes of ordinary reduction and coprime to Np, and let p > 2 be a prime of good supersingular reduction with a_p(E) = 0 (automatic for p ≥ 5). If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0.

**Hypotheses.**

- Hypotheses of BSTW Theorems 1.3 and 1.5 (r = 0); the twist range is BSTW's, not a broader one from a differently normalised statement.
- JSW7.2.1(iii) cites a withdrawn Wan preprint and allows a larger coprime-twist range. BSTW1.3/1.5 repair the semistable and ordinary-support twist endpoint only; the statements must not be called identical.

**Construction or proof.**

1. Kobayashi's signed main conjecture (L^±_p(E)) = ξ_Λ(X^±(E)) for E and its permitted twists (BSD.6a/bstw-signed-main-conjecture).
2. Specialise the + (or −) equality at the trivial character: Kobayashi's control theorem for signed Selmer groups gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ against L^±_p(E)(1) = (unit)·L(E,1)/Ω_E (BSD.6a/bstw-rank-zero-p-part).
3. E(ℚ) finite (BSD.4) and E(ℚ)[p] = 0; conclude by BSD.5/p-part-from-two-bounds.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem`, `RankZeroOneBSD:BSD.5/p-part-from-two-bounds`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.5, p. 3: The r = 0 case is used; the r = 1 case rests on the p-adic Gross–Zagier formula, which is not imported.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(iii), p. 43: JSW's statement of the branch.

**Acceptance.**

- E = 37a1 has rank one and is outside this node; for a semistable rank-zero curve with a supersingular p ≥ 5 the node applies with a_p = 0.

### residually-ramified-prime — A semistable curve with irreducible E[p] is residually ramified somewhere

Target `RankZeroOneBSD:BSD.6/residually-ramified-prime` (lemma).

Let E/ℚ be semistable of conductor N>1 and p an odd prime of good reduction with E[p] irreducible. Some q|N, necessarily q≠p, has E[p] ramified. At a multiplicative q≠p this is equivalent to p∤ord_q(Δ_min), the geometric component multiplicity; it is not equivalent to p∤c_q(E/ℚ) at a nonsplit prime. For an imaginary quadratic K in which q is inert or ramified, the residual representation remains irreducible over K under the cited index-two inertia argument.

**Hypotheses.**

- E semistable, p odd, E[p] irreducible.
- p has good reduction, the range used in JSW’s level-lowering application; q≠p is required in the Tate-curve residual criterion.

**Construction or proof.**

1. If E[p] were unramified at every q | N, Ribet's level-lowering theorem would remove each q in turn, producing a weight-two cusp form of level 1 with residual representation E[p]; there is none (requested from SerreWeightAndLevelOptimisation R20.2).
2. At a multiplicative q, E[p] is ramified iff p ∤ ord_q(Δ_min) (Tate curve), and c_q = ord_q(Δ_min) in the split case.
3. Irreducibility over K: a G_K-stable line would be stable under the inertia at q, whose image is unipotent nontrivial, forcing a G_ℚ-stable line.

**Prerequisites.** `SerreWeightAndLevelOptimisation:R20.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `RankZeroOneBSD:BSD.0/twist-local-factors`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4, p. 45: The argument.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45: Irreducibility over K.

**Acceptance.**

- E = 11a1, p = 3: ord₁₁Δ = 5, so E[3] is ramified at 11.

### jsw-lower-bound — The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1)

Target `RankZeroOneBSD:BSD.6/jsw-lower-bound` (theorem).

Let E/ℚ be semistable, optimal, analyticRank E = 1, p ≥ 3 a prime of good reduction with E[p] irreducible (and a_p = 0 if p = 3 is supersingular). Then ord_p #Ш(E/ℚ)[p^∞] ≥ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- Hypotheses of JSW Theorem 1.2.1; isogeny invariance (BSD.5/defect-isogeny-invariance) reduces to optimal E.

**Construction or proof.**

1. Choose q | N with E[p] ramified (residually-ramified-prime) and K′ by BSD.2/auxiliary-fields-for-prime-parts (a): (gen-H), q inert or ramified, p split, L(E^{K′},1) ≠ 0; so rank E(K′) = 1, Ш(E/K′) finite.
2. Anticyclotomic main-conjecture divisibility plus control (BSD.6a/wan-anticyclotomic-divisibility, BSD.6a/anticyclotomic-selmer-control): ord_p L_p(f,1) ≤ ord_p(#H¹_{F_ac}(K′,E[p^∞])·C(E[p^∞])).
3. Remove the excluded height-one and p factors using JSW6.1.6’s exact μ input: Burungale Proposition5.1.3 for BDP/Brooks, with Hsieh’s auxiliary conditions where needed. Check squarefree conductor, a nonsplit bad prime, (irred_K), corank1 and local surjectivity. A generic Hsieh μ=0 citation alone does not discharge these.
4. The BDP–Brooks formula (GZ.9/quaternionic-weight-two-formula, GZ.9/p-optimal-quotient-formula): ord_p L_p(f,1) = 2 ord_p(((1 + p − a_p)/p)·log_ω z_{K′}); hence (JSW (7.4.b)) ord_p #Ш(E/K′)[p^∞] ≥ 2 ord_p m_{K′} − ord_p ∏_{w|N⁺} c_w(E/K′).
5. Gross–Zagier in Zhang's form for z_{K′} and the Ribet–Takahashi comparison (BSD.5/ribet-takahashi-degree-comparison) give 2 ord_p m_{K′} = ord_p((L′(E,1)/(Ω_E Reg))·(L(E^{K′},1)/Ω_{E^{K′}})) − ord_p ∏_{ℓ|N⁻} c_ℓ(E/K′), using BSD.1/quadratic-period and the Manin constant prime to p.
6. BSD.1/tamagawa-base-change, BSD.1/odd-selmer-sha-decomposition and the Kato bound for E^{K′} (BSD.4/kato-p-part-upper-bound) give the bound for E.

**Prerequisites.** `RankZeroOneBSD:BSD.6/residually-ramified-prime`, `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts`, `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility`, `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`, `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison`, `RankZeroOneBSD:BSD.1/quadratic-period`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound`, `RankZeroOneBSD:BSD.3/analytic-rank-one-theorem`, `RankZeroOneBSD:BSD.5/defect-isogeny-invariance`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.1, (7.4.d), p. 47: The lower bound.

**Acceptance.**

- JSW (7.4.d).

### jsw-upper-bound — The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2)

Target `RankZeroOneBSD:BSD.6/jsw-upper-bound` (theorem).

Under the hypotheses of jsw-lower-bound, ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

**Hypotheses.**

- As jsw-lower-bound.

**Construction or proof.**

1. Factor N = N⁺N⁻ (N⁺ = q, N⁻ = N/q if the number of primes of N is odd; N⁺ = 1 otherwise) and choose K″ by BSD.2/auxiliary-fields-for-prime-parts (b): N⁺ split, N⁻ inert, p split, L(E^{K″},1) ≠ 0.
2. Use the actual odd-prime Shimura-curve Kolyvagin bound of JSW Theorem4.4.1 with its full residual/local hypotheses and defect terms, requested from HE.7/ES.4. The HE.7 dyadic conjugation node and Howard’s more restrictive clean classical bound cannot be substituted without a hypothesis proof.
3. Gross–Zagier for z_{K″} and Ribet–Takahashi as in jsw-lower-bound; no prime w | N⁺ has p | c_w(E/K″).
4. The rank-zero equality for E^{K″} (rank-zero-ordinary-multiplicative-p-part or rank-zero-supersingular-p-part) and the odd decomposition give the bound for E.

**Prerequisites.** `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison`, `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`, `RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `RankZeroOneBSD:BSD.1/quadratic-period`, `GrossZagierAndArithmeticHeights:GZ.3`, `HeegnerPointEulerSystems:HE.7`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §7.4.2, (7.4.e), p. 48: The upper bound.

**Acceptance.**

- JSW (7.4.e).

### jsw-rank-one-p-part — The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)

Target `RankZeroOneBSD:BSD.6/jsw-rank-one-p-part` (theorem). Atlas planet: **Jetchev–Skinner–Wan theorem**.

Let E/ℚ be semistable with analyticRank E = 1 and p ≥ 3 a prime of good reduction with E[p] irreducible; if p = 3 and E is supersingular at 3, assume a₃(E) = 0. Then padicValRat p (bsdDefect E) = 0, i.e. ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_ℓ c_ℓ(E/ℚ)).

**Hypotheses.**

- Semistability of E is a global hypothesis and is not the same as good reduction at p; both are assumed.
- p = 3 is included under JSW's extra hypothesis; no upgrade beyond it is claimed.

**Construction or proof.**

1. Reduce to E optimal (BSD.5/defect-isogeny-invariance).
2. Combine jsw-lower-bound and jsw-upper-bound with BSD.5/p-part-from-two-bounds (E(ℚ)[p] = 0 as E[p] is irreducible).
3. For the semistable good-supersingular endpoint use bstw-rank-one-p-part directly; that source does not justify the separate jsw-upper-bound auxiliary-twist proof. The ordinary JSW route still needs the recorded exact finite/control/degree inputs.

**Prerequisites.** `RankZeroOneBSD:BSD.6/jsw-lower-bound`, `RankZeroOneBSD:BSD.6/jsw-upper-bound`, `RankZeroOneBSD:BSD.5/p-part-from-two-bounds`, `RankZeroOneBSD:BSD.5/defect-isogeny-invariance`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), Theorem 1.2.1, p. 2: The theorem (with the p = 3 clause that follows it).
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.2, p. 2: The p = 3 case.

**Acceptance.**

- E = 37a1 (prime conductor, no rational isogeny) at every prime p ≥ 3 with p ≥ 5, p ≠ 37: ord_p of the defect is 0.

### castella-multiplicative-rank-one-p-part — The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)

Target `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part` (theorem). Atlas planet: **Castella's Theorem A′**.

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3. Assume E[p] is irreducible, E has nonsplit multiplicative reduction at some prime q ≠ p at which E[p] is ramified, and E(ℚ_p)[p] = 0. If analyticRank E = 1, then padicValRat p (bsdDefect E) = 0: ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_{ℓ|N} c_ℓ(E/ℚ)). E need not be semistable (additive primes other than p allowed); the original wider Theorem A of Castella (2018) is not a target.

**Hypotheses.**

- Exactly the hypotheses of Theorem A′ of Castella's erratum; the nonsplit condition at q and E(ℚ_p)[p] = 0 are additional to the 2018 statement.

**Construction or proof.**

1. Choose K by BSD.2/auxiliary-fields-for-prime-parts (c) satisfying the hypotheses of the corrected Theorem 1.1, with L(E^K, 1) ≠ 0.
2. Anticyclotomic main conjecture Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)) (BSD.6a/castella-anticyclotomic-main-conjecture).
3. Specialise at the trivial character with the multiplicative-prime BDP formula L_p(f,1) = (1 − a_p p^{−1})²(log_{ω_E} P_K)² up to units (GZ.9/multiplicative-prime-formula; no exceptional zero) and the anticyclotomic control theorem at a multiplicative prime (Castella §5).
4. Convert the Heegner logarithm/index with the proved Gross–Zagier formula and quadratic comparisons. The chosen q is ramified in K, so E^K is additive there; Skinner C cannot be invoked using q as a multiplicative ramification prime. Supply a separate proved rank-zero input or an alternative inequality, and extend the semistable GZ.9 multiplicative formula/control to the additive-away-from-p range of A′.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `RankZeroOneBSD:BSD.1/odd-part-bsd-over-K`, `RankZeroOneBSD:BSD.5/p-part-from-two-bounds`, `RankZeroOneBSD:BSD.3/analytic-rank-one-theorem`, `RankZeroOneBSD:BSD.5/defect-isogeny-invariance`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.9`.

**Sources.**

- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem A′, p. 1: The hypotheses of the corrected theorem.
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Remark after Theorem A′, pp. 1–2: Additive primes allowed.

**Acceptance.**

- Castella's Remark: for split multiplicative p, E(ℚ_p)[p] = 0 is equivalent to p ∤ ord_p(q_E) and log_p(q_E) ∈ pℤ_p^× (Skinner–Zhang's condition (b)).

### bstw-rank-one-p-part — BSTW supersingular rank-one p-part

Target `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part` (theorem). Atlas planet: **Supersingular rank-one p-part**.

Let E/ℚ be semistable with analyticRank E=1, and p>2 a good supersingular prime with a_p=0 (explicit when p=3). Then v_p(bsdDefect E)=0. The same holds for twists in BSTW1.3’s coprime ordinary-support range. This direct endpoint does not assert the JSW auxiliary-twist proof applies outside that range.

**Hypotheses.**

- Exactly BSTW1.5 rank-one hypotheses, with the Néron period and BSD regulator normalization. No residual irreducibility is added to the source endpoint.

**Construction or proof.**

1. Use the signed main conjecture and the source’s supersingular p-adic Gross–Zagier formula (Kobayashi [88]), signed Selmer control, cyclotomic descent and finite Sha/rank theorem.
2. Transfer the resulting leading-term equality to bsdDefect with the correct regulator and torsion denominator; good supersingular p gives no rational p-torsion.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `GrossZagierAndArithmeticHeights:GZ.9`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem1.5, printed p.4 (rank one), and §11: Direct semistable rank-one supersingular endpoint, preserving the ordinary-support twist range.

**Acceptance.**

- Retain a₃=0 when p=3; 37a1 has a₃=−3 and is not an example at that prime.

**Layer completion obligations.**

- The main-conjecture inputs are requested from ModularIwasawaMainConjectures (L0, L1 and the proposed p ∥ N layer), PadicFamilies L3 (Greenberg–Stevens) and DiophantineApproximationAndTranscendence DT.5 (Barré-Sirieix–Diaz–Gramain–Philibert); the p-part theorems are planned on top of them.
- Discharge the JSW μ, degree, local/Tamagawa and Kolyvagin hypotheses. The supersingular auxiliary-twist route and Castella ramified-q rank-zero deduction remain gaps; the direct BSTW1.5 semistable rank-one node does not repair those arguments.

## BSD.6a

Construct the signed two-variable classes and both reciprocity laws in their actual arithmetic carriers. Develop integral signed control and comparison; specialize to the BSD endpoints. The corrected multiplicative anticyclotomic branch imports distinct local-type, Rankin/Katz, generalized-Heegner and higher-weight Kolyvagin inputs.

### anticyclotomic-selmer-control — Anticyclotomic control at the trivial character (JSW Theorem 3.3.1)

Target `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control` (theorem).

Let E/ℚ be semistable, p ≥ 3 a prime of good reduction with E[p] irreducible, K imaginary quadratic with p = 𝔭𝔭̄ split, (gen-H) for N = N⁺N⁻ and (irred_K). Let K_∞ be the anticyclotomic ℤ_p-extension, Λ = ℤ_p[[Gal(K_∞/K)]], and X_ac the dual of the Selmer group with the 'relaxed at 𝔭, strict at 𝔭̄' conditions at p (the Greenberg-type condition of the BDP main conjecture). If rank E(K) = 1 and Ш(E/K)[p^∞] is finite, then X_ac is Λ-torsion and ord_p(Ch_Λ(X_ac)(0)) = ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])), where, by JSW (3.5.d), ord_p(#H¹_{F_ac}·C) = ord_p #Ш(E/K) − 2 ord_p [E(K) : ℤz_K] + 2 ord_p(((1 + p − a_p)/p)·log_ω z_K) + ord_p ∏_{w|N⁺} c_w(E/K).

**Hypotheses.**

- JSW's (split), (gen-H), (good), (-free), (irred_K), (corank 1), (sur); the control is a comparison of finite modules with all local terms kept.
- Use the finite-level/index/regulator convention of JSW3.5 with E(K)[p]=0, nonzero z_K and the (sur) local map; do not replace finite-level H1_ac and Λ-adic duals without the control theorem.

**Construction or proof.**

1. Control via Greenberg's method: compare the Λ-adic Selmer group at the augmentation ideal with H¹_{F_ac}(K, E[p^∞]), the kernel and cokernel being controlled by H⁰ terms that vanish under (irred_K) and local terms at primes w | N⁺ split in K (Tamagawa factors) (SelmerIwasawaCohomology L3/iwasawa-descent, L3/semilocal-cohomology). This requires a Selmer-specific map with its finite kernel/cokernel and augmentation correction; derived cohomology descent alone is insufficient.
2. No proper finite-index Λ-submodules (as in Castella erratum Lemma 2.2), so the characteristic ideal specialises to the Fitting ideal.
3. Express #H¹_{F_ac} through Ш, the index of z_K and the p-adic logarithm at 𝔭 using the Bloch–Kato logarithm of the Kummer class (GZ.9/bloch-kato-logarithm-of-heegner-class) and Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate).

**Prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `ModularIwasawaMainConjectures:L0`, `SelmerIwasawaCohomology:L3`, `ArithmeticGaloisDuality:R02.4`, `tauceti:TauCeti.ContCohomology.H1`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.3, p. 3: The control theorem.

**Acceptance.**

- Used with K = K′ in BSD.6/jsw-lower-bound (JSW (7.4.a)–(7.4.b)).

### wan-anticyclotomic-divisibility — The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6)

Target `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility` (theorem).

In the setting of anticyclotomic-selmer-control (p ≥ 3 good ordinary or supersingular, with a_p = 0 if p = 3 is supersingular), the BDP–Brooks p-adic L-function L_p(f) ∈ Λ^ur (GZ.9) satisfies the divisibility Ch_{Λ^ur}(X_ac) ⊆ (L_p(f)) in Λ^ur ⊗ ℚ_p, and integrally in Λ^ur under JSW's hypotheses (the μ-part requiring JSW6.1.6/Burungale5.1.3 and all selected Hsieh hypotheses); consequently ord_p L_p(f, 1) ≤ ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])) (JSW Proposition 6.2.1).

**Hypotheses.**

- Inputs are owned elsewhere: the U(3,1) Eisenstein congruences (AutomorphicCongruences L2 for the ordinary FW route, L2s for the semi-ordinary CLW replacement of withdrawn Wan arXiv:1412.1767), Hsieh's μ theorem (AutomorphicPadicLFunctions L3h) and the Eischen–Wan finite-slope families (L4e).
- The divisibility direction is the one giving lower bounds for Sha; the reverse divisibility is not claimed here.

**Construction or proof.**

1. Construct the Klingen Eisenstein family on GU(3,1) whose constant term is L_p(f)·(Katz factor) and whose non-degenerate Fourier–Jacobi coefficients are p-adic units (AutomorphicCongruences L2/L2s; Eischen–Wan for finite slope, APL L4e).
2. Lattice construction: the congruence between the Eisenstein family and cusp forms produces Selmer classes, giving Ch(X_ac) ⊆ (L_p(f)) (the Ribet–Urban method).
3. Remove the ambiguity of powers of p: μ(L_p(f)) = 0 by Hsieh (APL L3h) and the comparison of BDP and Hida's two-variable functions (GZ.9/imprimitive-function-dictionary).
4. Specialise at the trivial character with anticyclotomic-selmer-control.
5. CLW L2s supplies fractional one-sided containment with auxiliary-character/local/residual hypotheses and inverted coefficient elements, not an unrestricted integral supersingular equality. Prove those conditions and removal of exceptional height-one primes before asserting the integral JSW consequence.

**Prerequisites.** `AutomorphicCongruences:L2`, `AutomorphicCongruences:L2s`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L4e`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control`.

**Sources.**

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1), §1.3, p. 3: The divisibility and its integral ambiguity, removed in JSW §6.

**Acceptance.**

- JSW (7.4.a) for K = K′.

### bstw-two-variable-zeta-element — The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW)

Target `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element` (construction). Atlas planet: **BSTW two-variable zeta element**.

Let E/ℚ have good supersingular reduction at p∤2N with a_p=0, and L imaginary quadratic with (D_L,N)=1, p=v v̄ split (v fixed by the p-adic embedding), E[p](L)=0. Construct BSTW §6’s signed zeta element Z^•(E/L) in the actual two-variable relaxed/signed Iwasawa cohomology with its integral lattice and completed unramified coefficients. This node owns only the supersingular construction. The ordinary element, its laws and ordinary Proposition9.18 belong to the requested KatoEulerSystems L5; reuse that owner’s underlying classes/CM-family machinery. Use the cofinal two-variable tower of finite extensions, continuous H¹ of compact T_pE at each level, and corestriction-compatible inverse limits. The relaxed group is the unramified-away-p subgroup with the signed condition at v̄; localization at v is relaxed. With chosen generators Λ_L=ℤ_p[[X,Y]], and Λ_L^ur=R₀[[X,Y]] where R₀=W(𝔽̄_p). Its cyclotomic projection is a rational class over K, identified by BSTW6.26(i) with c^•(ω,γ,γ′)g(χ_K)⁻¹ times the combination of z_g and z_{g⊗χ_K} of §3.3, not a single Kato class. Integrality uses the basis/lattice hypotheses of 6.26(ii).

**Hypotheses.**

- p>2 good supersingular and a_p=0 (explicit also at p=3); (D_L,N)=1, p split and E[p](L)=0. The embedding fixes v; signs •∈{+,−} use the actual Kobayashi/Pollack normalization.
- Ordinary ownership is KatoEulerSystems proposed L5, requested at its present nearest L4 stage. BSD.6a owns the signed §6 construction and signed §9.3.2 comparison only.
- Fix the Néron differential, both Betti sign bases and the Gauss-sum normalization of BSTW6.26; for the integral refinement require irr_ℚ and integral primitive differential/Betti bases. Cyclotomic comparison is made over ℚ_p unless these lattice hypotheses have been discharged.
- BSTW §§2.2.4–2.2.5, printed pp.13–14, defines the cohomological lattice T_g with determinant χ_cyc⁻¹. Its twist T_g(1) is compared with V_pE through modularity and the polarization; an integral comparison with T_pE must track the modular-parametrization lattice index and chosen differential/Betti bases. The geometric coefficient here is T_pE, not T_pE(1).

**Construction or proof.**

1. Import Kato’s actual classes/norm relations and the ordinary owner’s CM-family base construction; PadicFamilies L4, not merely its eigencurve L1, must supply the CM family specialization.
2. Apply the R29.4 modular Tate-module comparison and polarization to transport T_g(1) to V_pE; prove the integral lattice/basis comparison required by 6.26(ii) before claiming an equality over ℤ_p. Keep all lattice indices in the normalization.
3. Carry out BSTW §6’s supersingular signed construction with the integral two-variable local maps, using the rank-one cohomology statement and no global congruence equality as a construction assumption.
4. Prove both local reciprocity laws with a common integral normalization; one-variable rational PHR maps require the requested signed/unramified two-variable extension and normalization proof.
5. Nonzero analytic images imply nonzero zeta class. Preserve local conditions and lattice under the specified cyclotomic projections, not arbitrary changes of the quadratic field.
6. Construct the cyclotomic target independently as continuous-H¹ inverse limits. BSTW6.26(i), printed p.68, compares specialization with the normalized two-class combination; apply the same-field ± character projectors of §3.3 under Shapiro. A quotient of two-variable cohomology is related by a control theorem and is not its definition.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.BSD.bstwZetaElement` | constructor | Z^•(E/L) in the two-variable Iwasawa cohomology with the relaxed/signed local condition. |
| `TauCeti.BSD.bstwZetaElement_ne_zero` | other | Z^•(E/L) ≠ 0. |
| `TauCeti.BSD.bstwZetaElement_col` | relation | Col^•_v(loc_v Z^•(E/L)) = L^•_p(E/L) (first explicit reciprocity law). |
| `TauCeti.BSD.bstwZetaElement_log` | relation | Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L) in the completed unramified coefficient extension. The Coleman law uses v; the logarithm law uses v̄. |
| `TauCeti.BSD.bstwZetaElement_cyclotomic` | compatibility | In ℚ_p⊗H¹_Iw(K_cyc,T_pE), cyclotomic projection of Z^• equals c^•(ω,γ,γ′)g(χ_K)⁻¹ times the combination of the two Kato classes from BSTW§3.3/6.26(i). No identification with a single class is asserted. |
| `TauCeti.BSD.bstwZetaElement_twist` | functoriality | Apply the same-field ± quadratic-character projectors to the cyclotomic equality of 6.26(i); under Shapiro they give the specified g and g⊗χ_K eigenspaces with their differential/Betti/Gauss-sum factors. |

**Consumers.**

- `BSTW Proposition 1.19`: one-sided divisibilities in the three main conjectures 1.16–1.18 are equivalent through the zeta element
- `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`: the comparison and cyclotomic descent of BSTW §§9–10
- `AutomorphicCongruences:L5a`: BCS Theorem 4.1.3's two-variable comparison is BSTW §9.3.2 and must import this element ()

**Unit tests.**

- `TauCeti.BSD.bstwZetaElement_ne_zero_test` (characterisation): Under the signed construction hypotheses Z^•≠0, because the nonzero signed analytic image under Col_v is prescribed.
- `TauCeti.BSD.bstwZetaElement_cyclotomic_test` (compatibility): The same-field character projections of the cyclotomic class agree with those of the independently supplied normalized two-Kato-class combination. Use rational coefficients as in 6.26(i).
- `TauCeti.BSD.bstwZetaElement_requires_split` (non-example): The actual split-prime datum has distinct v and v̄: if v=w then v̄≠w. A repeated prime fails this input condition and cannot give both local maps.
- `TauCeti.BSD.bstwZetaElement_reciprocity_square` (degenerate): Constant-coefficient specialization sends Col_v(loc_v Z^•) to the constant term of L_p^• and Log_v̄(loc_v̄ Z^•) to the constant term of L_p^Gr in R₀. The two equality targets are distinct and retain their source normalization.

**Prerequisites.** `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L4/signed-local-condition`, `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/integral-image-index`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `ArithmeticGaloisDuality:R02.4`, `KatoEulerSystems:L4`, `PadicFamilies:L4`, `PadicHodgeRegulators:L4`, `AutomorphicPadicLFunctions:L3`, `tauceti:TauCeti.ContCohomology.H1`, `EllipticCurveModularity:R29.4/tate-module-comparison`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.14, printed p. 7: The construction.
- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Remark 1.15(ii), printed p. 7: Nonvanishing.
- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), §6.6.2, Theorems6.25–6.26, printed p.68; §3.3: Signed construction, common normalization and rational cyclotomic comparison with the two Kato classes; integral refinement requires the selected basis hypotheses.
- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), §§2.2.4–2.2.5, printed pp.13–14; Theorem6.26(ii), printed p.68: Cohomological lattice and determinant convention, with the separate integral specialization hypotheses.

**Acceptance.**

- Its images under the two explicit reciprocity laws are the nonzero p-adic L-functions L^•_p(E/L) and L^Gr_p(E/L), so Z^•(E/L) ≠ 0 (BSTW Remark 1.15(ii)).

### bstw-explicit-reciprocity-laws — The two explicit reciprocity laws for the BSTW zeta element

Target `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws` (theorem).

In the signed setting of bstw-two-variable-zeta-element, Col^•_v(loc_v Z^•)=L^•_p(E/L) and Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L). The maps have the precise signed local domains and targets Λ_L, respectively its completed unramified coefficient extension, with the common integral normalization of BSTW Theorem1.14, printed p.7. The laws are at conjugate primes. The Greenberg function is the Rankin–Selberg/CM-family function from its analytic owner, with BDP obtained only by the specified anticyclotomic projection.

**Hypotheses.**

- As the signed zeta construction. No ordinary construction is replanned, and no one-variable BDP function is simply declared to be the two-variable Greenberg function.

**Construction or proof.**

1. First law: Kato's explicit reciprocity (KatoEulerSystems L3) interpolated over the family, with the signed Coleman maps of PadicHodgeRegulators L4.
2. Second law: the Perrin-Riou logarithm at the other prime above p, compared with the BDP–Brooks interpolation (GZ.9/bdp-p-adic-l-function, GZ.9/bdp-weight-two-heegner-formula) through the explicit reciprocity of PadicHodgeRegulators L3/explicit-reciprocity.
3. Common normalisation: both are computed with the same integral basis of D_cris and the same CM periods (BSTW §§5–6).

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicHodgeRegulators:L3/explicit-reciprocity`, `PadicHodgeRegulators:L4/regulator-coordinate-decomposition`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `ArithmeticGaloisDuality:R02.4`, `PadicHodgeRegulators:L4`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.14, printed p. 7: The two displayed laws, transcribed visually with the conjugate-prime bar restored; the OCR loses it.

**Acceptance.**

- Specialising both laws at the trivial character recovers Kato's reciprocity for E and the BDP formula for E/L.

### bstw-signed-main-conjecture — Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3)

Target `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture` (theorem). Atlas planet: **Kobayashi's signed main conjecture (BSTW)**.

Let E/ℚ be semistable and p > 2 a supersingular prime, with a₃(E) = 0 if p = 3. Then for ∘ ∈ {+, −}, (L^∘_p(E)) = ξ_Λ(X^∘(E)) in Λ = ℤ_p[[Gal(ℚ_∞/ℚ)]], where L^±_p(E) are Pollack's signed p-adic L-functions and X^±(E) the duals of Kobayashi's signed Selmer groups. The same holds for every quadratic twist E^K with D_K coprime to Np and divisible only by primes of ordinary reduction for E. The equality is exported to ModularIwasawaMainConjectures L6.

**Hypotheses.**

- Exactly BSTW's hypotheses and twist range; Wan arXiv:1411.6352 is withdrawn and superseded in part by BSTW (Remark 1.4); its CM case is Pollack–Rubin.

**Construction or proof.**

1. Choose auxiliary L with split p and the required local character/congruence hypotheses and cyclotomic (nv). Proposition1.19 uses (irr_L), stronger than (van_L), but BSTW §1.2.1 explicitly says (irr_L) holds for good supersingular p>2. Discharge it from the local supersingular residual representation at the split p-adic place; do not present it as an extra unproved field-existence restriction.
2. One divisibility in the two-variable Greenberg main conjecture over L from the semi-ordinary GU(3,1) congruences of Castella–Liu–Wan (AutomorphicCongruences L2s) and Hsieh's μ theorem (AutomorphicPadicLFunctions L3h).
3. Transfer the rational divisibility using bstw-signed-main-conjecture-comparison. BSTW Proposition1.19 upgrades to an integral comparison under E[p]|G_L irreducible (1.6); the weaker van_L is sufficient for Proposition9.18’s comparison identity but not for every integral MC step.
4. The opposite divisibility from Kato's signed Euler-system bound (KatoEulerSystems L4, EulerSystemsAndKolyvaginSystems ES.4, signed local conditions of PadicHodgeRegulators L4).
5. Cyclotomic descent from L to ℚ (BSTW §10), separating E and E^L; track the height-one primes and residual conditions.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`, `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `AutomorphicCongruences:L2s`, `AutomorphicPadicLFunctions:L3h`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `PadicHodgeRegulators:L4/signed-local-condition`, `ModularSymbolsPadicLFunctions:L4/plus-minus-decomposition`, `ModularIwasawaMainConjectures:L4`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `RankZeroOneBSD:BSD.2/heegner-local-conditions`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p. 3: The theorem.
- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p. 3: The twist range.

**Acceptance.**

- 11a1 at p = 19 (a₁₉ = 0, E[19] irreducible, semistable): both signed main conjectures hold, and so does the twisted statement for E^K with D_K coprime to 11·19 supported at ordinary primes.

### bstw-rank-zero-p-part — Specialisation of the signed main conjecture in rank zero

Target `RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part` (theorem).

Under the hypotheses of bstw-signed-main-conjecture (E or a permitted twist E^K), if L(E, 1) ≠ 0 then #Ш(E/ℚ)[p^∞]·∏_ℓ c_ℓ(E) and L(E,1)/Ω_E have the same p-adic valuation (the r = 0 case of BSTW Theorem 1.5).

**Hypotheses.**

- Supersingular p > 2 with a_p = 0 (automatic for p ≥ 5).

**Construction or proof.**

1. Specialise (L^+_p(E)) = ξ_Λ(X^+(E)) at the trivial character: L^+_p(E)(1) is a p-adic unit times L(E,1)/Ω_E^+ (interpolation with the factor (p − 1) or 2 from the half-logarithms, ModularSymbolsPadicLFunctions L4/half-logarithms), and Kobayashi's control theorem for the + Selmer group gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ.
2. E(ℚ) is finite (BSD.4) so Sel = Ш[p^∞]; Ω_E^+ versus Ω_E needs the Manin constant prime to p (GZ.3).

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `ModularSymbolsPadicLFunctions:L4/half-logarithms`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem`, `GrossZagierAndArithmeticHeights:GZ.3`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), Theorem 1.5, p. 3: The r = 0 case.

**Acceptance.**

- BSTW Theorem 1.5 with r = 0.

### castella-anticyclotomic-main-conjecture — Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1)

Target `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture` (theorem). Atlas planet: **Castella's corrected Theorem 1.1**.

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3, K imaginary quadratic with an ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N and p = 𝔭𝔭̄ split. Assume (i) E[p] irreducible; (ii) if 2 is nonsplit in K then 2 ∥ N; (iii) E has nonsplit multiplicative reduction at each prime q ∥ N nonsplit in K, and E[p] is ramified at at least one such q; (iv) E(ℚ_p)[p] = 0. Then X_ac(E[p^∞]) is Λ-torsion and Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)), with L_p(f) the BDP-type function of GZ.9/multiplicative-prime-formula.

**Hypotheses.**

- Exactly the corrected hypotheses; the invalid Hida specialisation step of Castella (2018) Theorem 4.2 is not used, and additive primes are allowed.

**Construction or proof.**

1. Choose a Hida family f through the p-stabilised newform and, for each m, a p-ordinary newform g of weight k > 2 with k≡2 mod p−1 and level M with p ∤ M congruent to f modulo p^m (Skinner §3.1's Hida-family/Fitting-ideal argument; requested from ModularIwasawaMainConjectures).
2. For g, the higher-weight main conjecture castella-higher-weight-input gives Ch(X_ac^Σ(A_g)) = (L^Σ_p(g)).
3. castella-higher-weight-input's Lemma 2.1 (needs (iv)) identifies Sel^Σ_p(K, M_f[ϖ^m]) with Sel^Σ_p(K, M_f)[ϖ^m]; Lemma 2.2 (no proper finite-index submodules) turns characteristic ideals into Fitting ideals, which are compatible with the congruence.
4. Congruence of p-adic L-functions modulo p^m (GH.7 big Heegner/BDP families) and letting m → ∞ gives the equality for f; remove Σ-imprimitivity with local factors.
5. Preserve the nonsplit special local type along the Hida family by FO12 Lemma2.14 from R21.3; carry hypotheses (iii)–(iv) into each g_m using the Hecke relation. Prove the anticyclotomic Fitting-congruence argument for every m, not merely its analogy with Skinner’s cyclotomic proof.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`, `GeneralizedHeegnerCycles:GH.7`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `ModularIwasawaMainConjectures:L1`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `GrossZagierAndArithmeticHeights:GZ.9`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`.

**Sources.**

- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 1.1, p. 1: The conclusion.
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), §1, p. 1: The correction.

**Acceptance.**

- Castella erratum Theorem 1.1.

### castella-higher-weight-input — The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction

Target `RankZeroOneBSD:BSD.6a/castella-higher-weight-input` (theorem).

(a) (Erratum Theorem 2.3.) Let g ∈ S_k(Γ₀(M)) be a p-ordinary newform of even weight k ≥ 2 and level M ≥ 3 with p ∤ M, and K imaginary quadratic with p split and a Heegner ideal of norm M. Assume ρ̄_g|_{G_K} irreducible; 2 ∥ M if 2 is nonsplit in K; some q ∥ M nonsplit in K; and at every ℓ ∥ M nonsplit in K, π(g)_ℓ is the special representation twisted by the unramified character ℓ ↦ −ℓ^{k/2−1}. Then for every finite set Σ of primes not above p, X^Σ_ac(A_g) is Λ_O-torsion and Ch_{Λ_O}(X^Σ_ac(A_g))Λ^ur_O = (L^Σ_p(g)). (b) (Lemma 2.1.) If Σ contains the primes v ∤ p where T_g ramifies, ρ̄_g|_{G_K} is irreducible and H⁰(K_𝔭, A_g[ϖ]) = 0, then Sel^Σ_p(K, M_g[ϖ^m]) ≅ Sel^Σ_p(K, M_g)[ϖ^m]. (c) (Lemma 2.2.) If X_ac(A_g) is Λ_O-torsion, Sel^Σ_p(K, M_g) has no proper finite-index Λ_O-submodules.

**Hypotheses.**

- Use GH.2–7 generalized Heegner classes and the exact reciprocity laws; the higher-weight integral Kolyvagin bound is proved in BSD.6a/higher-weight-integral-kolyvagin-bound. Import only CGS’s elliptic-curve rational comparison as background, not a ready higher-weight integral theorem. The reverse divisibility uses FW Theorem4.41/Corollary7.21 from AC L2; CGS Proposition2.4.5 from APL L3h; FO12 Lemma2.14 from R21.3; BCK5.2 from HE.8/HE.8b; Greenberg no-finite-submodule theorem from SIC L3. Prove each local/residual/integral hypothesis and the Σ-imprimitive projection here.

**Construction or proof.**

1. (a) Use the higher-weight integral Kolyvagin bound added in this packet, retaining the augmentation-prime case, C1=C2=0 proof and corrected generalized Heegner local conditions. Combine the BCK comparison, exact GH reciprocity, FW reverse divisibility and APL anticyclotomic Rankin/Katz-to-BDP projection. Prove the Σ-imprimitive version via JSW3.4.2/6.1.6 with matching factors.
2. (b) Shapiro's lemma and H⁰(K, M_g) = H⁰(K_∞, A_g) = 0 give H¹(G_{K,S}, M_g[ϖ^m]) ≅ H¹(G_{K,S}, M_g)[ϖ^m]; the local kernel at 𝔭 is H⁰(K_𝔭, M_g)/ϖ^m, zero when H⁰(K_𝔭, A_g[ϖ]) = 0.
3. (c) Greenberg's general results (as in Hsieh–Lei and Skinner Proposition 2.3.3).
4. CGS6.5.1 is for T_pE and gives its displayed bound over Λ[1/p]. Prove the extension to T_g, rather than assuming it. Correct the erratum’s second C2=0 to C1=0 and discharge it via Cha05/large-image input. The nonexistent FO12 Cor7.2.1 is not a supplier.
5. For FW4.41, verify absolute residual irreducibility over K, the crystalline p-local alternative, a nonsplit q∥M, and that every nonsplit conductor prime is ramified special with the prescribed unramified twist; otherwise the source gives only the inclusion away from pullbacks of cyclotomic height-one primes. The cyclic Heegner ideal and residual/local-type comparison must discharge these hypotheses explicitly. Apply FW7.21 with its class-number and Katz factors before the Σ projection; FO2.14 is only the local-type input.

**Prerequisites.** `GeneralizedHeegnerCycles:GH.7`, `AutomorphicCongruences:L2`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L4e`, `HeegnerPointEulerSystems:HE.8b`, `HeegnerPointEulerSystems:HE.8`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds`, `SelmerIwasawaCohomology:L3`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`, `RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound`.

**Sources.**

- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 2.3, p. 3: Part (a).
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Lemma 2.1, p. 2: Part (b).
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Remark after Theorem A′, p. 2: Why E(ℚ_p)[p] = 0 is needed.
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Lemma2.2, p.3: The no-proper-finite-index-submodule statement concerns the discrete Selmer group.
- [Control theorems for Selmer groups of nearly ordinary deformations](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf), Lemma2.14, pp.12–13: Transfers the special local type between arithmetic specializations; supplies no Rankin/Katz factorization.
- [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem4.41, p.58; Corollary7.21, p.89: Distinct reverse divisibility and Rankin/Katz factorization inputs, with their integral and local hypotheses retained.

**Acceptance.**

- For g of weight 2 congruent to the p-stabilised form of E, (b) needs E(ℚ_p)[p] = 0: this is where hypothesis (iv) of Theorem 1.1 enters.

### bstw-signed-main-conjecture-comparison — Signed Perrin–Riou and Greenberg main-conjecture comparison

Target `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison` (theorem). Atlas planet: **Signed main-conjecture comparison**.

For the signed BSTW zeta datum with rank-one relaxed cohomology, nonzero analytic images and van_L:E[p](L)=0, the signed and Greenberg dual Selmer modules are torsion and char(X_Gr)·(L_p^•)=char(X_•)·(L_p^Gr) in Λ_L^ur. Obtain the cyclotomic-quotient version only when both localizations of the specialized class are non-torsion (nv). Without van_L retain the source’s rational form after inverting p. This comparison identity is distinct from the extra irreducibility assumptions in an integral main-conjecture proof.

**Hypotheses.**

- Good supersingular p>2, a_p=0, split p, (D_L,N)=1; actual two-variable and cyclotomic local conditions/coefficients of BSTW9.3.2.
- Rank-one relaxed cohomology, zeta nonzero and the signed analogues of exact sequences(9.11)–(9.13), with integral local image corrections computed; (nv) for the cyclotomic version.

**Construction or proof.**

1. Prove the signed Poitou–Tate sequences with actual signed lattices, common unramified coefficient extension and Coleman image factors. BSTW presents only the ordinary proof and explicitly leaves the supersingular argument to the reader.
2. Taking characteristic ideals gives char(H/ΛZ)char(X_Gr)=(L_Gr)char(X_st) and char(H/ΛZ)char(X_•)=(L_•)char(X_st); all canceled terms are nonzero torsion ideals. Cancel in the regular Iwasawa domain, keeping integral image terms until shown to match.
3. This identity transports both directions of divisibility; the cyclotomic comparison repeats the argument after the exact specialization and (nv), rather than specializing a characteristic ideal without Tor/control corrections.

**Prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`, `ArithmeticGaloisDuality:R02.4`, `SelmerIwasawaCohomology:L3`, `PadicHodgeRegulators:L4`.

**Sources.**

- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), §9.3.2, Proposition9.18 and proof, printed pp.83–84: The signed comparison is an owned proof obligation; the source does not print its full proof.

**Acceptance.**

- Verify the product-ideal identity with signed local image corrections and no unproved equality of the main conjectures.
- Verify (nv) is retained after cyclotomic specialization.

### higher-weight-integral-kolyvagin-bound — Higher-weight integral Kolyvagin bound

Target `RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound` (theorem). Atlas planet: **Integral higher-weight Kolyvagin bound**.

Extend the rank-two conjugate-self-dual ordinary Kolyvagin-system argument to the actual lattice T_g of an even-weight p-ordinary newform over K with residual representation irreducible over G_K and the corrected generalized Heegner local conditions. For the nonzero Λ-adic generalized Heegner class κ_g, the ordinary compact Selmer group S and dual X have Λ_O-rank one, and char(X_tors)⊇char(S/Λ_O κ_g)^2 integrally, including the augmentation prime, once C1=C2=0 is proved. CGS6.5.1’s elliptic rational theorem alone is not this extension.

**Hypotheses.**

- The actual T_g, critical self-dual twist, saturated ordinary filtration and cartesian local conditions satisfying the rank-one Kolyvagin-system hypotheses of ES.8; p split in K.
- Residual irreducibility over G_K, nonzero generalized Heegner class from GH.7 and the required local conditions corrected by Kobayashi–Ota.
- Prove C1=C2=0 from the specified irreducible image/cohomology inputs rather than adding it as an unexplained assumption.

**Construction or proof.**

1. Transport the CGS6.1.1/6.5.1 rank-two linear-algebra proof to T_g and prove every image, local and cartesian hypothesis.
2. C2: supply CGLS22 Remark3.3.5 irreducible-image argument. C1: verify Cha05 Theorem2 and the applicable Matar–Nekovář0.9 variant for T_g and its finite-level restriction kernel.
3. Handle the augmentation prime before passing from height-one bounds to the integral characteristic ideal. Connect the corrected generalized Heegner class with this ordinary Kolyvagin system.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.8`, `GeneralizedHeegnerCycles:GH.7`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Proof of Theorem2.3, printed pp.3–4, equation(2.2): The integral extension is asserted here and must be justified for T_g.
- [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), §6 opening and Theorems6.1.1,6.5.1: The source restricts to an elliptic Tate module and states the characteristic bound over Λ[1/p]; it is background, not the desired higher-weight integral conclusion.

**Acceptance.**

- Give an actual T_g local-condition signature and separate proofs for C1 and C2.
- Retain the augmentation-prime estimate and no unresolved power of p.

**Layer completion obligations.**

- Prove the signed Proposition9.18 node; source prints only the ordinary proof. Ordinary element/reciprocity/comparison are requested from KatoEulerSystems proposed L5, not replanned.
- Prove the higher-weight integral Kolyvagin bound and Σ-imprimitive projection with the exact C1/C2/local hypotheses; FW factorization belongs AC L2, FO local type R21.3, projection APL L3h.
- Discharge the recorded Selmer/Fitting/control, μ/exceptional-prime and additive-range gaps before identifying the suppliers with the claimed integral endpoint.
- The actual continuous inverse-limit/signed-local signatures and all six API/four examples are supplied; refine the integral image, Selmer-control and normalization proofs through the exact owner requests.

## Supplier contracts

The following exports are required from their single owners. Existing declarations remain imports; an extended range is requested explicitly rather than inferred from a narrower theorem.

### `GL2AutomorphicRepresentationsAndTransfer:R16.3`

Local ε-factors of GL₂(ℚ_ℓ) representations attached to elliptic curves: w_ℓ = −a_ℓ at multiplicative ℓ, w_ℓ = 1 at good ℓ, the twist formula ε(π ⊗ χ) = χ(−1)-twisted value for unramified π and ramified quadratic χ, and the dyadic values for potentially good reduction needed by the Birch–Stephens table; and the product formula w_E = ∏_v w_v with w_∞ = −1 for weight two.

Consumers: `RankZeroOneBSD:BSD.0/twist-root-number`, `RankZeroOneBSD:BSD.0/congruent-number-root-numbers`, `RankZeroOneBSD:BSD.0/completed-l-function`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

For an elliptic curve over a finite field 𝔽_q, the trace a_q = q + 1 − #E(𝔽_q) and the relation a_{q²} = a_q² − 2q (equivalently the characteristic polynomial of Frobenius over extensions).

Consumers: `RankZeroOneBSD:BSD.0/finite-field-twist-trace`, `RankZeroOneBSD:BSD.0/base-change-factorization`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Néron–Ogg–Shafarevich and the Galois description of local factors: for ℓ ≠ r, the local polynomial of a minimal model equals det(1 − Frob T | V_r(E)^{I_ℓ}); Tate's algorithm local index c_ℓ = [E(ℚ_ℓ) : E₀(ℚ_ℓ)] and its base change behaviour.

Consumers: `RankZeroOneBSD:BSD.0/twist-local-factors`, `RankZeroOneBSD:BSD.0/base-change-factorization`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`

The quadratic twist E.quadraticTwist K and the Galois-twisted point isomorphism (quadraticTwistPointEquiv), together with the identification of V_r(E^K) with V_r(E) ⊗ χ_K as G_ℚ-representations.

Consumers: `RankZeroOneBSD:BSD.0/twist-local-factors`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`

The normalised Fricke operator 𝒲_N on S₂(Γ₀(N)) and the sign ε_N(f) of a newform under it.

Consumers: `RankZeroOneBSD:BSD.0/completed-l-function`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Hecke's functional equation Λ_N(2 − s, f) = i² Λ_N(s, 𝒲_N f) for weight two newforms, and the analytic rank of a newform as the order of its entire continuation at s = 1.

Consumers: `RankZeroOneBSD:BSD.0/completed-l-function`, `RankZeroOneBSD:BSD.0/analytic-rank`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Selmer structures and the groups Sel_{p^∞}(E/F), Ш(E/F) for F = ℚ and quadratic F, with Kummer sequences, restriction/corestriction and inflation–restriction for the forced-discrete coefficient modules E[p^∞] and E(F̄); the real period Ω_E = 2∫_{D_W>0} dx/√D_W of the global minimal model and the arithmetic BSD quotient over ℚ with Ш finite; Cassels' isogeny invariance and isogeny equality of all local Euler factors. In particular provide continuous cohomology, finite isogeny-Selmer comparison for Res_{K/ℚ}E ⇄ E×E^K, both compositions [2], finite Sel₂, and maps on locally trivial Sha. Abstract groupCohomology.H1 is not this interface.

Consumers: `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.1/two-primary-comparison`, `RankZeroOneBSD:BSD.1/sha-finiteness-descent`, `RankZeroOneBSD:BSD.1/quadratic-period`.

### `MetaplecticAutomorphicForms:MP.7`

Half-integral-weight metaplectic Eisenstein and Whittaker kernels with ramified local characters and test functions (Friedberg–Hoffstein's construction), with their Fourier coefficient and Euler-factor identities, so that the twist series with arbitrary prescribed local behaviour (split, inert, ramified) at finitely many primes can be formed.

Consumers: `RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch`, `RankZeroOneBSD:BSD.2/twist-series-residue`.

### `GrossZagierAndArithmeticHeights:GZ.3`

a node proving that the Manin constant c of the X₀(N)-optimal curve is a positive integer prime to p for p ∤ 2N·D in the range JSW Remark 7.3.3 uses (Mazur, via Jetchev 2008 §1), checked against later sharpenings, with its transfer across the isogeny class and to the twist E^D; consumed by the Néron-period versus canonical-period comparisons of BSD.4–BSD.6a.

Consumers: `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.6/jsw-lower-bound`, `RankZeroOneBSD:BSD.6/jsw-upper-bound`, `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`.

### `GrossZagierAndArithmeticHeights:GZ.5`

a node stating L(1/2, π ⊗ χ) ≥ 0 for every cuspidal automorphic representation π of PGL₂ over ℚ and every quadratic Hecke character χ (Waldspurger's period formula, or Guo's relative trace formula, or Lapid–Rallis), with the sign conventions for the unitary normalisation; linked to BSD.5 for the positivity of L(E,1) and L′(E,1).

Consumers: `RankZeroOneBSD:BSD.5/leading-term-positivity`.

### `GrossZagierAndArithmeticHeights:GZ.3`

Rational automorphic realisations and modular degrees: the Manin constant of the optimal parametrisation as a positive integer (with its p-integrality, ), the degrees δ(N⁺, N⁻) of optimal Shimura-curve parametrisations, and the comparison of Néron periods with the modular-symbol periods Ω_f^±.

Consumers: `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison`, `RankZeroOneBSD:BSD.3a/definite-congruence-period`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.3`

The Jacquet–Langlands transfer with integral multiplicity one at a non-Eisenstein maximal ideal: a primitive integral eigenfunction on the definite (or indefinite) quaternion algebra of discriminant N⁻ attached to g, with the freeness of the localised character groups needed for Pollack–Weston Theorem 6.2.

Consumers: `RankZeroOneBSD:BSD.3a/definite-congruence-period`.

### `ModularIwasawaMainConjectures:L1`

a second, weight-two target in the Skinner–Urban Theorem 1 / Skinner Theorem A (p ∤ N) form: p ≥ 3, f ordinary at p, ρ̄ irreducible, and some q ≠ p with q ∥ N and ρ̄ ramified at q; integral equality Ch_Λ(X) = (L_f) in Λ, with its own route (Skinner–Urban plus Kato, integrality as in Skinner's remark after Theorem A). The FW 1.6 form stays as it is.

Consumers: `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`.

### `ModularIwasawaMainConjectures:L1`

a new ModularIwasawaMainConjectures layer beside L1 proving Skinner's Theorem A for p ∥ N (weight two, ordinary at p, ρ̄ irreducible, q ≠ p with q ∥ N and ρ̄ ramified at q) by the Hida-family deduction from the p ∤ N case with the Fitting-ideal argument of Skinner §3.1. The nearest present owner is L1; the proposed multiplicative layer exports this theorem.

Consumers: `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `PadicFamilies:L3`

the Greenberg–Stevens theorem (Invent. Math. 111 (1993), Theorem 7.1): for f of weight two with split multiplicative reduction at p, L′_p(f, 1) = L(V_f)·L_alg(f, 1) with L(V_f) = log_p(q_E)/ord_p(q_E), including the Mazur–Kitagawa two-variable p-adic L-function it uses.

Consumers: `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`, `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`.

### `DiophantineApproximationAndTranscendence:DT.5`

transcendence of the Tate period q_E when j(E) is algebraic (Barré-Sirieix–Diaz–Gramain–Philibert 1996), hence log_p q_E ≠ 0 and L(V_f) ≠ 0 for every elliptic curve over ℚ with split multiplicative reduction at p.

Consumers: `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`, `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`.

### `ModularIwasawaMainConjectures:L0`

The ordinary Greenberg Selmer group, its dual X over the cyclotomic Iwasawa algebra and the formulation Ch_Λ(X) = (L_f) with canonical integral periods and primitive/imprimitive conventions, as consumed by the specialisation at the trivial character.

Consumers: `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`.

### `SerreWeightAndLevelOptimisation:R20.2`

Ribet's level-lowering theorem away from p (Rib90, Theorem 1.1) for weight two newforms with trivial character: if ρ̄_{f,p} is irreducible and unramified at q ∥ N, q ≠ p, there is a newform of level N/q with the same residual representation.

Consumers: `RankZeroOneBSD:BSD.6/residually-ramified-prime`.

### `AutomorphicCongruences:L2`

Fouquet–Wan's U(3,1) Eisenstein congruence divisibility (the lower bound on characteristic ideals of anticyclotomic and two-variable Selmer groups by p-adic L-functions) for p-ordinary newforms of even weight, with the exceptional height-one primes treated, as used by JSW §6 (through Wan) and by Castella's erratum Theorem 2.3.

Consumers: `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `AutomorphicCongruences:L2s`

Castella–Liu–Wan's semi-ordinary GU(3,1) congruence divisibility (the replacement of withdrawn Wan arXiv:1412.1767) at good supersingular p with a_p = 0, giving one divisibility of the two-variable Greenberg main conjecture over an auxiliary imaginary quadratic L.

Consumers: `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`.

### `AutomorphicCongruences:L5a`

AC L5a imports the ordinary BSTW element/Proposition9.18 from proposed KatoEulerSystems L5 and, when its signed branch needs it, the early signed comparison from BSD.6z. It must not depend on completed BSD.6a. FW factorisation is requested from AC L2 and FO local type from R21.3 separately.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`.

### `AutomorphicPadicLFunctions:L3h`

Hsieh's toric BDP measure and μ = 0 theorem for the anticyclotomic p-adic L-function of a weight-two (and higher even weight) newform, with its CM periods and hypotheses (squarefree N⁻, local root number conditions). For JSW’s weight-two use export Burungale Proposition5.1.3 and JSW6.1.6’s BDP/Brooks μ calculation with its nonsplit-prime and auxiliary conductor conditions. Do not identify Hsieh’s square-root function with its square.

Consumers: `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `AutomorphicPadicLFunctions:L4e`

Eischen–Wan finite-slope Klingen families on definite GU(2,0)/GU(3,1) with their constant-term divisibility (Theorem 5.8, Corollary 5.9), used for the finite-slope (supersingular) congruence argument.

Consumers: `RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `GeneralizedHeegnerCycles:GH.7`

Castella–Hsieh (4.7), §5.2 and Theorems 5.7/6.1, Longo–Vigni Theorem 4.7 and Castella Theorems 2.11/5.3: big Heegner/generalized Heegner classes in Hida families, their two-variable explicit reciprocity and the congruence of BDP p-adic L-functions along the family, with the Chida–Hsieh erratum and the Kobayashi–Ota local-condition replacement.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`, `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`.

### `HeegnerPointEulerSystems:HE.8b`

Burungale–Castella–Kim Theorem 5.2, consumed by Castella's corrected Theorem 1.1.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `HeegnerPointEulerSystems:HE.8`

Λ-adic Heegner classes over the anticyclotomic tower with nonvanishing (Cornut–Vatsal) at an ordinary prime, as an input of the Kolyvagin-system bound in Castella's corrected proof.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `ModularIwasawaMainConjectures:L4`

The signed (Kobayashi/Pollack) local conditions and the formulation of the signed main conjecture with Pollack's L^±_p, to which BSD.6a exports BSTW Theorem 1.3 through L6; only the formulation and the FW/LLZ consequence are imported.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`.

### `ClassicalArithmeticCompletion:CA.1`

Extend the primitive discriminant character export to its splitting/Frobenius identification for quadratic number fields, including the explicit dyadic Kronecker rule; identify NumberField.discr with the fundamental discriminant. The pinned multiquadratic theorem alone omits 2.

Consumers: `RankZeroOneBSD:BSD.0/quadratic-field-character`.

### `KatoEulerSystems:L4`

Export Kato Theorem14.2(2), printed p.235, finite Bloch–Kato Selmer for every coefficient prime and zero for almost all when L(E,1)≠0, including the separate CM proof of §15. Provide comparison with EC Layer7 p∞ Selmer at good, finite-flat and Tate-curve primes; existing non-CM/Hyp(v) and good-ordinary divisibilities do not supply all these cases.

Consumers: `RankZeroOneBSD:BSD.4/kato-rank-zero-finiteness`.

### `KatoEulerSystems:L4`

Finite-level integral upper bound of JSW7.2.1(i) for weight-two E, odd good (ordinary or supersingular) or multiplicative p, irreducible E[p], L(E,1)≠0, with Néron-period/Tamagawa normalization. Specify the source proof including local finite-flat/Tate conditions and integral lattice errors; ordinary L4 divisibility is only good ordinary and a specialization theorem assuming main-conjecture equality cannot prove this one-sided bound.

Consumers: `RankZeroOneBSD:BSD.4/kato-p-part-upper-bound`.

### `GrossZagierAndArithmeticHeights:GZ.3`

Export JSW7.3.2’s exact integral modular-degree/Néron-period comparison with localised multiplicity-one hypotheses and proof of their discharge for semistable E, good odd p and irreducible E[p]. Track geometric component multiplicities ord_ℓ Δ and the definite/indefinite parity change; a rational automorphic realization alone does not give it.

Consumers: `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison`.

### `SelmerIwasawaCohomology:L3`

Provide Greenberg’s no-finite-submodule result and the required presentation/Fitting-ideal and augmentation control statements for the specific ordinary/signed/Σ-imprimitive dual Selmer modules. Distinguish a dual having no finite submodule from a discrete Selmer group having no proper finite-index submodule. Current iwasawa-torsion-criterion is a specialised acyclicity statement and iwasawa-descent is derived global cohomology, not this Selmer theorem.

Consumers: `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`, `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control`, `RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `GrossZagierAndArithmeticHeights:GZ.3`

For the multiplicative branch p∥N, export the exact p-integral canonical-period/Néron-period comparison used by Skinner C and Castella, with optimal/nonoptimal transfer and full local hypotheses. The existing p∤2ND Manin-constant request does not cover this branch.

Consumers: `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part`, `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part`.

### `HeegnerPointEulerSystems:HE.7`

Export JSW Theorem4.4.1’s odd-prime Shimura-curve Kolyvagin bound in its (gen-H), residual and local conditions, keeping Tamagawa/parametrisation defects. Prove the clean square-index specialization in the exact upper-bound application; dyadic conjugation descent is not this export.

Consumers: `RankZeroOneBSD:BSD.6/jsw-upper-bound`.

### `GrossZagierAndArithmeticHeights:GZ.9`

Extend multiplicative-prime BDP/control and period comparisons from the existing semistable optimal export to Castella erratum A′/Theorem1.1: multiplicative p>3, additive primes away from p allowed, nonsplit residually ramified q, E(Q_p)[p]=0 and ramified Heegner ideal. Keep Euler factors and local hypotheses; prove the extension instead of calling the semistable theorem identical.

Consumers: `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part`, `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`.

### `ArithmeticGaloisDuality:R02.4`

Extend finite-module Poitou–Tate to the compact Tate/discrete p-divisible and Λ-adic coefficients needed here, with continuous cohomology, completed semilocal terms, exact transition maps, local annihilator conditions and inverse/direct limit exactness. The existing nine-term finite-module statement is not itself this Iwasawa exact sequence.

Consumers: `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control`, `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`.

### `KatoEulerSystems:L4`

introduce early L5 for the ordinary BSTW two-variable zeta element, ordinary reciprocity laws and ordinary Proposition9.18/BCS4.1.3 comparison; BSD imports these. The present request is assigned to L4, with the early export placed in proposed L5. It must not depend on AC L5a or completed BSD.6a.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`.

### `PadicFamilies:L4`

The actual integral CM Hida family and its Galois lattice, character conventions and weight/cyclotomic specialization used in BSTW§§3–6; an ordinary eigencurve geometry statement at L1 is not this construction.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`.

### `PadicHodgeRegulators:L4`

Integral signed local maps over Λ_L and Λ_L^ur at both split primes, comparison with Kobayashi/Pollack signs, image indices and common lattice/period normalization for BSTW1.14. Current rational one-variable Coleman-image and arbitrary Wach-basis signed-condition statements are insufficient.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`.

### `AutomorphicPadicLFunctions:L3`

The two-variable Hida Rankin–Selberg Greenberg function against the CM family used in BSTW1.14, with completed unramified coefficient ring, interpolation and primitive/imprimitive factors; distinguish it from the anticyclotomic BDP projection.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`, `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`.

### `AutomorphicCongruences:L2`

exact FW Theorem4.41 reverse divisibility and Corollary7.21 Rankin/Katz/Hida factorization with class-number, period and local factors. The erratum’s FO12 Cor7.2.1 does not exist; do not route this factorization to L5a. Retain absolute residual irreducibility over K, crystalline p-local alternative, q∥M nonsplit, and all nonsplit primes ramified-special with the specified twist for the fully integral inclusion; outside that range retain the excluded pullback height-one primes.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `AutomorphicPadicLFunctions:L3h`

CGS v2 Proposition2.4.5 anticyclotomic Greenberg ideal equals the BDP ideal, with the square-root/squared convention explicit. Here BSD proves its Σ-imprimitive extension with JSW3.4.2/6.1.6, matching lattices and Euler factors.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`

FO12 Lemma2.14 constancy of the special local type at ℓ|M in the actual ordinary big Galois representation; export the representation/lattice and Hecke relation so BSD transfers nonsplit special hypotheses from f to each g_m.

Consumers: `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`.

### `EulerSystemsAndKolyvaginSystems:ES.8`

Rank-two conjugate-self-dual ordinary Λ-adic Kolyvagin-system bound for actual T_g and cartesian local conditions, including the augmentation-prime proof; supply the generic machinery, while BSD.6a owns its higher-weight image/constant specialization.

Consumers: `RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound`.

### `GrossZagierAndArithmeticHeights:GZ.9`

Kobayashi’s supersingular p-adic Gross–Zagier formula [BSTW88], with signed local normalization and exact Euler factors used in BSTW1.5 rank-one deduction. Current ordinary/multiplicative BDP exports do not supply that supersingular formula.

Consumers: `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part`.

### `GrossZagierAndArithmeticHeights:GZ.0`

Construct the actual integration image of H₁(E(ℂ),ℤ) for a global minimal Néron differential as a discrete full Submodule ℤ ℂ. Export its real/imaginary rank-one sublattices, index δ∈{1,2}, covolume/complex-integral factor two, and full real-component period comparison; use native IsZLattice/ZLattice.covolume rather than new real-valued data. This specializes the complex uniformization/real-period development; no new generic lattice theory is planned.

Consumers: `RankZeroOneBSD:BSD.1/quadratic-period`.

### `NeronModelsAndSemistableAbelianVarieties:R11.6`

Export the invertible fractional ideal 𝔞_ω=(e*Ω¹)/ω for E base-changed to 𝓞_K, relative to its rational global minimal differential, and the rational twist differential multiplier u. Use FractionalIdeal.absNorm with denominators. Prove local unit/valuation comparisons away from 2ND, and 𝔞_ω=1 with dyadic u when (D,2N)=1.

Consumers: `RankZeroOneBSD:BSD.1/quadratic-period`.

### `SelmerIwasawaCohomology:L3`

Export the embedded cofinal cyclotomic/anticyclotomic compositum tower, compact T_pE continuous-H¹ corestriction system and completed semilocal localizations with the same transitions. Export the independent cyclotomic tower, projection and same-field character projectors under Shapiro. Prove the Λ-coefficient quotient comparison with its Tor/control hypotheses; do not define cyclotomic H¹ as that quotient. Use the existing TauCeti.ContCohomology.H1 and current Tau Ceti Tate-module implementation.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison`.

### `AutomorphicPadicLFunctions:L3`

Export BSTW’s two-variable signed Rankin functions L_p^±∈Λ_L alongside L_p^Gr∈Λ_L^ur, with the common differential/Betti/Gauss-sum normalization of 6.25–6.26. The one-variable Pollack functions are obtained by the specified cyclotomic specialization, not identified with these functions by type.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`, `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`.

## Proof and source refinements

The following obligations remain within the planned targets. The packet records their exact consumers; completing them is required before the corresponding stage can be marked closed.

### Friedberg–Hoffstein Theorem B not read

Friedberg–Hoffstein, Nonvanishing theorems for automorphic L-functions on GL(2), Annals of Math. 142 (1995), Theorem B, is used through JSW's citation only; the public full text was not acquired for this plan. Its statement (arbitrary prescribed local conditions compatible with sign +1) and the double-cover construction must be read and checked before RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch is proved.

Consumers: `RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch`, `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts`.

### Exact powers of 2 in the quadratic period and Tamagawa comparisons

BSD.1/quadratic-period states Ω_E·Ω_{E^K}·|D|^{1/2} = 2^e·Ω_{E/K} with e determined by c∞(E), c∞(E^K) and the dyadic Néron-lattice change, and BSD.1/tamagawa-base-change is proved for odd p only. The explicit e and the 2-part of ∏_w c_w(E/K) versus c_ℓ(E)c_ℓ(E^K) at dyadic and ramified places are not established; they are needed only for statements at p = 2 (BSD.8/BSD.9).

Consumers: `RankZeroOneBSD:BSD.1/quadratic-period`, `RankZeroOneBSD:BSD.1/tamagawa-base-change`, `RankZeroOneBSD:BSD.1/odd-part-bsd-over-K`, `RankZeroOneBSD:BSD.5/gross-index-formula`.

### Birch–Stephens dyadic root numbers not read

The values w_2(E^(n)) for E : y² = x³ − x and n mod 8 are taken from Birch–Stephens (Topology 5, 1966) through Burungale–Tian's footnote 2; the public full text was not acquired for this plan, and the local computation (or Rohrlich's formula for dyadic potentially good reduction) must be read before RankZeroOneBSD:BSD.0/congruent-number-root-numbers is proved.

Consumers: `RankZeroOneBSD:BSD.0/congruent-number-root-numbers`.

### Auxiliary ramified twists and supersingular support

Acquire Friedberg–Hoffstein Theorem B and prove compatible local signs, nonempty prescriptions and the ramified Heegner-ideal conditions. In the Castella choice q|D_K, E^K is additive at q; Skinner C does not follow at that q. In the supersingular JSW upper-bound choice, (D_K,Np)=1 alone does not imply the ordinary-support hypothesis of BSTW1.3/1.5. A direct semistable rank-one BSTW1.5 route is available, but does not validate that auxiliary-twist proof.

Consumers: `RankZeroOneBSD:BSD.2/auxiliary-fields-for-prime-parts`, `RankZeroOneBSD:BSD.6/jsw-upper-bound`, `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part`.

### Integral modular-degree comparison hypotheses

BSD.5/ribet-takahashi-degree-comparison must state and discharge the precise localised character-module freeness/multiplicity-one hypotheses of JSW7.3.2/Ribet–Takahashi. PW’s surjective CR definite theorem and a general character exact sequence are not automatically the irreducible indefinite application. Use geometric ord_ℓ Δ or split-over-K′ Tamagawa numbers, not rational nonsplit c_ℓ.

Consumers: `RankZeroOneBSD:BSD.5/ribet-takahashi-degree-comparison`, `RankZeroOneBSD:BSD.6/jsw-lower-bound`, `RankZeroOneBSD:BSD.6/jsw-upper-bound`.

### Castella higher-weight integral extension and Σ comparison

Prove the extension of CGS v2 6.5.1 from elliptic T_pE to self-dual ordinary T_g, including the augmentation prime and C1=C2=0 under residual irreducibility. Acquire/verify Cha05 Theorem2/Matar–Nekovář0.9 for C1 and CGLS Remark3.3.5 for C2. Separately prove the Σ-imprimitive APL projection and FW/BCK/local-type hypotheses. Do not infer this from the elliptic rational theorem or from the words “in the same way”. Discharge FWv3 4.41’s all-nonsplit ramified-special and absolute residual hypotheses explicitly; its unrestricted version excludes pullbacks of cyclotomic height-one primes.

Consumers: `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`, `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`.

### Signed Proposition9.18 proof not printed

BSTW v2 pp.83–84 prints the ordinary proof and leaves the supersingular case to the reader. BSD owns the full signed Poitou–Tate/rank/image argument and cyclotomic (nv) specialization. Record this as a source proof gap until written.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison`.

### Integral signed Selmer/image and cyclotomic control hypotheses

The signed cohomology and local-map signatures are supplied. Discharge the exact integral Coleman/logarithm image indices, CLW/Wan excluded height-one primes, μ hypotheses and both cyclotomic local non-torsion conditions (nv) in the BSD.6a proof. Continuous H¹ and derived Iwasawa descent supply carriers/global base change; they do not by themselves prove these Selmer control results. Requests to PHR L4, SIC L3, APL L3/L3h and duality R02.4 identify the missing exports. The R29.4 comparison must also match BSTW’s cohomological T_g(1) with geometric T_pE, including the integral lattice index; rational representation comparison alone is insufficient.

Consumers: `RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `RankZeroOneBSD:BSD.6a/bstw-rank-zero-p-part`, `RankZeroOneBSD:BSD.6a/anticyclotomic-selmer-control`, `RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element`.

## Corrected source conventions

Use the following corrected mathematics at the stated locators. These are paraphrases; the sources retain their own notation.

- `RankZeroOneBSD/E1` — Theorem A and the proof of Theorem 4.4 (via Theorem 4.2), arXiv:1704.06608v2 = Cambridge J. Math. 6 (2018) 1–23: For p ∥ N the theorem holds under the corrected hypotheses of Theorem A′: E[p] irreducible, nonsplit multiplicative reduction at some q ≠ p where E[p] is ramified, and E(ℚ_p)[p] = 0 (semistability no longer needed). The proof of Theorem 4.4 uses a point φ in the weight space of a Hida family through a p-new weight-two form whose existence is not guaranteed (Castella's erratum, §1).
- `RankZeroOneBSD/E2` — Theorem 7.2.1(iii) and its attribution, p. 42 ([Wan14b, Cor. 4.8]): Use BSTW1.3 and1.5 for semistable curves and only twists supported at ordinary primes as specified there. This repairs that endpoint, not all of the wider coprime-twist range in old JSW7.2.1(iii). The cited preprint (Wan arXiv:1411.6352) was withdrawn and its pertinent parts superseded (BSTW Remark 1.4), so the supersingular rank-zero input of JSW rests on BSTW.
- `RankZeroOneBSD/E3` — Published CJM5 (2017),p.427, sentence immediately after(7.4.c): Use the square of the free index: ⟨z,z⟩=(m_free)² Reg. In this odd-primary application the full index has the same p-part because p-torsion vanishes. Quadratic height scales by the square of the lattice index; equation(7.4.c) on the same page already has m². This is a missing square, not evidence that the endpoint is false.
- `RankZeroOneBSD/E4` — Author erratum,Theorem1.1,p.1: X_ac(E[p∞]) is Λ-torsion. A characteristic ideal is an ideal in Λ, not the Selmer module; the proof states torsion of X_ac and then its characteristic-ideal equality.
- `RankZeroOneBSD/E5` — Author erratum,proof of Theorem2.3,p.3,after the Cha05/MN19 citation: The second occurrence must be C1=0; C2=0 was established in the preceding sentence. The immediately preceding sentence identifies C1 as the restriction-kernel exponent; the argument needs both constants zero. This does not verify the cited higher-weight extension.
- `RankZeroOneBSD/E6` — Proof of Theorem2.3,pp.3–4,(2.2),using CGS23 Theorem5.5.1(v2 6.5.1): Prove the higher-weight T_g extension, including the augmentation prime and C1=C2=0. CGS§6 is elliptic and its displayed bound is rational; it does not directly supply the higher-weight integral conclusion. The missing extension is now its own BSD.6a node and gap.
- `RankZeroOneBSD/E7` — arXiv2409.01350v2,§9.3.2,proof of Proposition9.18,printed p.84: Write out the signed Poitou–Tate/image/rank comparison and cyclotomic specialization with(nv). The proof presented is ordinary. The supersingular analogue has different signed image corrections and is an owned proof obligation, not supplied by an ordinary proof citation.

## Sources and versions

Node citations give the theorem, section and page supporting each target. The packet records version-specific receipts and dates for the following sources.

- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1) — Dimitar Jetchev, Christopher Skinner and Xin Wan. arXiv:1512.06894v1 (2015); published in Cambridge Journal of Mathematics 5 (2017), no. 3, 369–434.
- [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1) — Christopher Skinner. arXiv:1407.1093v1 (2014); published in Pacific Journal of Mathematics 283 (2016), no. 1, 171–200.
- [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2) — Francesc Castella. arXiv:1704.06608v2; published in Cambridge Journal of Mathematics 6 (2018), no. 1, 1–23.
- [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) — Francesc Castella. Author's homepage erratum (2024), 5 pages.
- [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2) — Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan. arXiv:2409.01350v2 (11 September 2024).
- [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) — Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein. Inventiones Mathematicae 102 (1990), 543–618 (GDZ scan).
- [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2) — Ashay A. Burungale and Ye Tian. arXiv:2506.03465v2 (October 2025); Annals of Mathematics 203 (2026), no. 1.
- [Indivisibility of Heegner points in the multiplicative case](https://arxiv.org/abs/1407.1099v1) — Christopher Skinner and Wei Zhang. arXiv:1407.1099v1 (2014).
- [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf) — Kazuya Kato. Astérisque 295 (2004), 117–290 (Numdam).
- [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/abs/math/0610694v1) — Robert Pollack and Tom Weston. arXiv:math/0610694v1; published in Compositio Mathematica 147 (2011).
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) — Benedict H. Gross and Don B. Zagier. Inventiones Mathematicae 84 (1986), 225–320 (GDZ scan).
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf) — Benedict H. Gross. L-functions and Arithmetic (Durham, 1989), LMS Lecture Note Series 153 (1991), 235–256.
- [TauCeti/NumberTheory/LSeries/EntireExtension.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/EntireExtension.lean) — Chris Birkbeck (Tau Ceti). Tau Ceti at f790474.
- [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean) — Tau Ceti contributors. Tau Ceti at f790474.
- [Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean) — Thomas Browning (Mathlib). Mathlib at 082e2d3.
- [Mathlib/Analysis/Analytic/Order.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean) — Mathlib contributors. Mathlib at 082e2d3.
- [Roadmap: modular forms (Tau Ceti), Layers 6–7](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md) — Tau Ceti contributors. content/tau-ceti/ModularForms/README.md in this repository.
- [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf) — Jetchev, Skinner and Wan. Cambridge J. Math.5 (2017),369–434.
- [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf) — Francesc Castella. Cambridge J. Math.6 (2018),1–23.
- [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2) — Castella, Grossi and Skinner. arXiv:2303.04373v2.
- [Control theorems for Selmer groups of nearly ordinary deformations](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf) — Olivier Fouquet and Tadashi Ochiai. Author-hosted ControlF-O.pdf; pagination of this copy, accessed 2026-10-10.
- [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3) — Olivier Fouquet and Xin Wan. arXiv:2107.13726v3 (8 April 2022).

The bibliography identifies sources required for refinement as well as sources supporting completed readings. Friedberg–Hoffstein Theorem B and Birch–Stephens’ original dyadic computation still require direct acquisition and verification. The Castella higher-weight extension and BSTW signed Proposition 9.18 require proofs beyond those printed in the cited elliptic/ordinary arguments.
