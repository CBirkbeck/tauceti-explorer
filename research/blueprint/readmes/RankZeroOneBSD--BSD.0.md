# Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory — part 1 (BSD.0–BSD.6a)

This document is the reader for the blueprint packet `research/blueprint/packets/RankZeroOneBSD--BSD.0.json`. It plans layers BSD.0 to BSD.6a of the roadmap `RankZeroOneBSD`; layers BSD.7 to BSD.9 (the Eisenstein-prime branches, the all-prime certificate and the end-to-end tests) are planned by part 2 (`RankZeroOneBSD--BSD.7`). The packet and this document agree node for node; the suggested Lean file `research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean` gives the Lean shape of every definition, API item and unit test that can be stated against the pinned libraries.

Following the accepted restructuring RS-30, this roadmap is **Elliptic curves, Part II**: it extends Tau Ceti's roadmap *Elliptic curves* (`tauceti:TauCetiRoadmap/EllipticCurves`), which is its first prerequisite and the sole owner of the general theory it builds on — the Weierstrass model and its points (Mathlib), twists (Layer 5), Mordell–Weil, the canonical height and the regulator (Layer 6), Selmer groups, Ш, the real period, the arithmetic BSD quotient over ℚ and Cassels' isogeny invariance (Layer 7), and the local theory with Tate's algorithm and Tamagawa numbers (Layer 4). This part starts where those layers stop.

## Purpose

For every elliptic curve E/ℚ of analytic rank r ≤ 1, prove that rank E(ℚ) = r and that the whole of Ш(E/ℚ) is finite; build the analytic and arithmetic comparisons the leading-term formula needs (the actual L-function, quadratic twists and base change, the rational BSD defect, the Heegner index); and prove the named p-parts of the leading-term formula that the literature establishes, each with exactly its source's hypotheses: Skinner–Urban and Skinner in rank zero at good ordinary and multiplicative primes, Burungale–Skinner–Tian–Wan in rank zero at supersingular primes, Jetchev–Skinner–Wan in rank one at good primes, and Castella's corrected Theorem A′ in rank one at multiplicative primes. The roadmap does **not** claim the full leading-term formula for every curve; the all-prime assembly is BSD.8's, and it is gated on certificates.

## Scope and boundaries

* **Imported, not rebuilt.** The L-function as a formal Euler product (`WeierstrassCurve.LFunction`, Mathlib); its analytic continuation and functional equation through modularity (EllipticCurveModularity R29.3–R29.6); the quadratic twist and its Galois-twisted point isomorphism (Tau Ceti `WeierstrassCurve.quadraticTwist`, `quadraticTwistPointEquiv`); Mordell–Weil, the canonical height and the regulator (Tau Ceti, EllipticCurves Layer 6); Selmer groups, Ш, the real period and the arithmetic BSD quotient over ℚ (EllipticCurves Layer 7); height and period normalisations (GrossZagierAndArithmeticHeights GZ.0); the Gross–Zagier formulas (GZ.8, GZ.9); Heegner points and Kolyvagin's descent (HeegnerPointEulerSystems HE.0–HE.7); the BFH genus-two analysis (MetaplecticAutomorphicForms MP.8); Kato's Euler system (KatoEulerSystems L0–L4); modular symbols (ModularSymbolsPadicLFunctions); Néron-model character groups (NeronModelsAndSemistableAbelianVarieties R11); Iwasawa cohomology and control (SelmerIwasawaCohomology); Perrin-Riou and Coleman maps (PadicHodgeRegulators); and the main-conjecture and congruence inputs of ModularIwasawaMainConjectures, AutomorphicCongruences, AutomorphicPadicLFunctions and GeneralizedHeegnerCycles.
* **Owned here.** The interface from the Euler product to the actual entire L-function, analytic rank and leading term; quadratic-twist Euler factors, root numbers and the factorisation over quadratic fields; the arithmetic comparisons over quadratic fields; the residue and nonvanishing argument for quadratic twists with prescribed local behaviour and the choice of auxiliary fields; the rank and finiteness theorems in analytic rank ≤ 1; rationality and positivity of the leading term, the Heegner index, the rational BSD defect and the Ribet–Takahashi comparisons; the named prime-part theorems and the branch-specific main-conjecture inputs (anticyclotomic control and divisibility, the BSTW zeta element, the signed main conjecture, Castella's corrected Theorem 1.1).
* **Not here.** Eisenstein primes (BSD.7–BSD.7a), the finite-support certificate and the full formula for individual curves (BSD.8), and the certified examples (BSD.9). Main conjectures in families are ModularIwasawaMainConjectures'.

## Conventions

* **Curves.** E is a `WeierstrassCurve ℚ` with `E.IsElliptic`; points are `E.toAffine.Point` and, over an extension F, `(E⁄F).toAffine.Point`. The conductor N of E is the level of its newform (EllipticCurveModularity R29.4/exact-conductor). Mathlib's `localPolynomial` is computed on minimal models.
* **The L-function.** `E.LFunction` is Mathlib's Euler product, an `ArithmeticFunction ℤ`; `E.LSeries s` is a `tsum` and equals 0 wherever the series is not absolutely summable, so it is never evaluated on Re s ≤ 3/2. `ellipticL E` is the unique entire function agreeing with `E.LSeries` on Re s > 3/2. The centre is s = 1 (motivic normalisation); the unitary centre s = 1/2 of L(s, π_E) = L(E, s + 1/2) is converted by GZ.0/unitary-and-motivic-centres.
* **Completed function and root number.** Λ(E, s) = N^{s/2} Γ_ℂ(s) L(E, s) with Mathlib's Γ_ℂ(s) = 2(2π)^{−s}Γ(s). This is twice the function N^{s/2}(2π)^{−s}Γ(s)L(E, s) of R29.6 and of Bump–Friedberg–Hoffstein; the factor does not change the sign. The root number w_E ∈ {±1} satisfies Λ(E, 2 − s) = w_E Λ(E, s), and w_E = −ε_N(F_E) for the eigenvalue ε_N of Tau Ceti's normalised Fricke operator (weight-two sign i²ε_N).
* **Analytic rank and leading term.** analyticRank E = analyticOrderNatAt (ellipticL E) 1; leadingTerm E = L^{(r)}(E, 1)/r!, a nonzero real number.
* **Quadratic fields.** K is a quadratic number field with discriminant D_K = `NumberField.discr K`; χ_K is the Kronecker character of D_K (ClassicalArithmeticCompletion CA.1/kronecker-character): χ_K(ℓ) = 1, −1, 0 for ℓ split, inert, ramified. E^K = `E.quadraticTwist K`. The Heegner hypothesis for N means every ℓ | N splits in K; the generalized Heegner hypothesis for N = N⁺N⁻ (N⁻ squarefree) means ℓ | N⁺ split and ℓ | N⁻ inert.
* **Heights and regulators.** Tau Ceti's `canonicalHeight` is the (O)-normalised height, half the x-height ĥ_x of Cremona, Müller–Stoll and the LMFDB; `regulator` is the Gram determinant of its halved polar form. Every BSD statement here uses Reg_BSD = 2^r · `regulator` (GZ.0/bsd-regulator). Heights relative to a quadratic K are [K:ℚ] = 2 times absolute heights on points defined over ℚ.
* **Periods.** Ω_E is the full real period of the global minimal model (EllipticCurves Layer 7), Ω_E = c∞ Ω_E⁰ (GZ.0/real-period-components); no separate c∞ is inserted. Ω_{E/K} is JSW's period over K (BSD.1/quadratic-period).
* **Prime parts.** For a positive rational d, "the p-part of BSD" is padicValRat p (bsdDefect E) = 0. A p-adic valuation of a real quotient is taken only after the quotient is proved rational (BSD.5).

## Sources

The papers read for this part are listed with versions, hashes and the sections read in the packet's `sources` and `sourceVersions`: Jetchev–Skinner–Wan (arXiv v1; §1 and §7 in full), Skinner's multiplicative paper (arXiv v1; §1, §3.1–3.2), Castella's 2018 paper (arXiv v2; §1, §5) and his 2024 erratum (complete), Burungale–Skinner–Tian–Wan (arXiv v2; §1), Bump–Friedberg–Hoffstein (introduction and Theorem, from the page images), Burungale–Tian (§1), Skinner–Zhang (§9), Kato (§14), Pollack–Weston (§1, §6), and, through excerpts verified by GZ.8 and HE.0 and the extractions PAPER-GROSS-ZAGIER-86 and PAPER-KOLYVAGIN-90, Gross–Zagier Chapter V §2 and Gross's *Kolyvagin's work on modular elliptic curves*. Friedberg–Hoffstein (Annals 1995) and Birch–Stephens (Topology 1966) are not publicly available and were not read; both are recorded as gaps.


## Layer overview

| Layer | Title | Nodes | Planets |
| --- | --- | --- | --- |
| BSD.0 | Actual analytic L-functions, vanishing order and twists | 13 | L-function of an elliptic curve over ℚ, Root number, Analytic rank, Root-number parity, Twist Euler factors, Base-change factorisation |
| BSD.1 | Arithmetic invariants and quadratic descent | 10 | Quadratic trace and twist maps, Rank splitting over K, Odd-primary Selmer decomposition, Descent of Sha finiteness, Tamagawa factors under base change |
| BSD.2 | Quadratic twists with prescribed local conditions and nonvanishing | 6 | Heegner hypothesis, Bump–Friedberg–Hoffstein nonvanishing, Heegner field selection |
| BSD.3 | Analytic rank one implies rank one and finite Sha | 3 | Non-torsion Heegner point, Gross–Zagier–Kolyvagin rank-one theorem |
| BSD.4 | Analytic rank zero implies rank zero and finite Sha | 5 | Kolyvagin's rank-zero theorem, Analytic rank at most one theorem |
| BSD.5 | Rational leading-term quotient and Heegner index formula | 12 | Positivity of the leading term, Rationality of L′(E,1)/ΩReg, Heegner index, Gross–Zagier index formula, Ribet–Takahashi degree formula, Rational BSD defect |
| BSD.6 | Irreducible-prime leading-term formulas | 8 | Cyclotomic control at the trivial character, Skinner–Urban rank-zero p-part, Jetchev–Skinner–Wan theorem, Castella's Theorem A′ |
| BSD.6a | Main-conjecture inputs for the irreducible-prime branches | 8 | BSTW two-variable zeta element, Kobayashi's signed main conjecture (BSTW), Castella's corrected Theorem 1.1 |

<a id="bsd-0"></a>
## BSD.0. Actual analytic L-functions, vanishing order and twists

BSD.0 turns Mathlib's formal Euler product into the analytic object the BSD statements are about, and supplies every comparison involving quadratic twists that BSD.1–BSD.6a use. RS-30 narrowed it to adapters: the continuation, functional equation and newform comparison are R29.6's, the twist curve is EllipticCurves Layer 5's, and the rationality of the newform's coefficients is R29.3's.

The actual L-function is defined as the unique entire extension, using Tau Ceti's `LSeries.HasEntireExtension`, whose uniqueness is the identity theorem on a half-plane. The analytic rank is the order of that function at s = 1, never of Mathlib's `tsum` (which is identically 0 on Re s ≤ 3/2 and would give an infinite or meaningless order). Root-number parity follows from the functional equation by comparing Taylor coefficients.

For quadratic twists the comparison is made Euler factor by Euler factor. Away from D_K the reduction type is preserved and the trace is multiplied by χ_K(ℓ), including at ℓ = 2 through the Artin–Schreier twist; at ℓ | D_K the factor is computed from the Galois representation V_r(E) ⊗ χ_ℓ. This gives the factorisation L(E/K, s) = L(E, s)·L(E^K, s) as formal Dirichlet series over any quadratic K, the twisted coefficients and conductor N D_K² when (D_K, N) = 1, the twisted root number χ_K(−N)w_E, and the order, leading term and sign of L(E/K, s) at the centre. The congruent-number root numbers (w(E^(n)) = +1 exactly for n ≡ 1, 2, 3 mod 8) are recorded here for the consumers in ArithmeticStatistics.

**Dependencies on other roadmaps:** `ClassicalArithmeticCompletion:CA.1`, `EllipticCurveModularity:R29.3`, `EllipticCurveModularity:R29.4`, `EllipticCurveModularity:R29.6`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCetiRoadmap`.


### `BSD.0/actual-l-function` — The actual L-function of an elliptic curve over ℚ (construction) — planet *L-function of an elliptic curve over ℚ*

Let E be a Weierstrass curve over ℚ with E.IsElliptic and conductor N. The coefficient sequence n ↦ (E.LFunction n : ℂ) of Mathlib's formal Euler product has finite abscissa of absolute convergence (at most 3/2) and an entire extension in Tau Ceti's sense LSeries.HasEntireExtension. ellipticL E : ℂ → ℂ is the unique entire function with ellipticL E s = E.LSeries s for every s with Re s > 3/2. It is the function the Birch–Swinnerton-Dyer statements are about: on Re s ≤ 3/2 Mathlib's E.LSeries is a tsum with junk value 0 and is never used there.

*Hypotheses and conventions.*

* E/ℚ elliptic; no semistability or other hypothesis.
* The extension is defined through modularity (EllipticCurveModularity R29.6); no continuation is assumed as a hypothesis.

*Proof outline.*

1. Absolute convergence for Re s > 3/2: E.LFunction n = a_n(F_E) for all n ≥ 1 (rational-newform-bridge), and the cusp-form coefficient bound gives finite abscissa (Tau Ceti ModularForms Layer 7, abscissa ≤ k/2 + 1 = 2) and, by Deligne's bound in the weight-two case |a_p| ≤ 2√p, abscissa ≤ 3/2.
2. Existence: CuspForm.hasEntireExtension_qExpansion_coeff gives an entire extension of the coefficient series of F_E ∈ S₂(Γ₀(N)) (strict width one at ∞); transport it along the coefficient equality.
3. Uniqueness: LSeries.HasEntireExtension.unique (identity theorem on a connected half-plane); define ellipticL E as the witness of LSeries.HasEntireExtension.existsUnique.
4. Agreement on Re s > 3/2 rather than on the full convergence half-plane follows from LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re.

*Uses:* `mathlib:WeierstrassCurve.LFunction`, `mathlib:WeierstrassCurve.LSeries`, `mathlib:LSeries`, `mathlib:LSeries.abscissaOfAbsConv`, `tauceti:LSeries.HasEntireExtension`, `tauceti:LSeries.HasEntireExtension.unique`, `tauceti:LSeries.HasEntireExtension.existsUnique`, `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re`, `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`, `EllipticCurveModularity:R29.6/l-function-continuation`, `BSD.0/rational-newform-bridge`.

*Sources:* tauceti-entire, TauCeti/NumberTheory/LSeries/EntireExtension.lean, docstring of HasEntireExtension; jsw, Conjecture 7.1.1(a), p. 41.

*Uses of the object.* RankZeroOneBSD:BSD.0/analytic-rank: its order of vanishing at s = 1 is the analytic rank. RankZeroOneBSD:BSD.0/base-change-factorization: L(E/K,s) is continued as the product of ellipticL E and ellipticL E^K. RankZeroOneBSD:BSD.5: the numerator of the rational BSD defect is its leading Taylor coefficient at 1. EllipticCurves Layer 7 statement-only BSD milestone: the analytic hypothesis there is discharged by this function: an analytic continuation agreeing with the Dirichlet series on part of its half-plane of convergence. JSW Conjecture 7.1.1: L(E/F,s) means the continued Hasse–Weil L-function.

*API.*

| Name | Role | Statement |
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

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.ellipticL_two` | characterisation | ellipticL E 2 = E.LSeries 2 for every E/ℚ elliptic. |
| `WeierstrassCurve.LSeries_one_eq_zero_ne_ellipticL` | non-example | For E = 11a3 (a₁ = 0, a₂ = −1, a₃ = 1, a₄ = 0, a₆ = 0): E.LSeries 1 = 0 (the tsum junk value) but ellipticL E 1 ≠ 0, so the tempting definition ellipticL := E.LSeries fails. |
| `WeierstrassCurve.ellipticL_eq_newformL` | compatibility | ellipticL E s = (h Γ₀(N))^{-s}-normalised Mathlib ModularForm.L of the newform F_E, i.e. its entire extension, for all s (strict width one, so the factor is 1). |
| `WeierstrassCurve.ellipticL_isogenous_11` | compatibility | ellipticL (11a1) = ellipticL (11a3): isogenous curves have the same L-function. |

*Acceptance.*

* ellipticL E 2 = E.LSeries 2, and both equal the absolutely convergent Euler product at s = 2.
* For E = 11a3 (y² + y = x³ − x²) the function ellipticL E is entire while E.LSeries 1 = 0 is the tsum junk value; ellipticL E 1 ≠ 0 (BSD.4 certifies analytic rank zero).


### `BSD.0/completed-l-function` — The completed L-function and the root number (definition) — planet *Root number*

For E/ℚ elliptic of conductor N, completedEllipticL E s := N^{s/2} · Γ_ℂ(s) · ellipticL E s with Mathlib's Γ_ℂ(s) = 2(2π)^{-s}Γ(s). It is entire and satisfies completedEllipticL E s = w_E · completedEllipticL E (2 − s) for a unique sign w_E ∈ {±1}, the root number rootNumber E : ℤˣ. In Tau Ceti's normalisation of the Fricke operator, w_E = −ε_N(F_E), where 𝒲_N F_E = ε_N(F_E)·F_E: the sign of the functional equation of a weight-two newform is i²·ε_N = −ε_N.

*Hypotheses and conventions.*

* E/ℚ elliptic; N is the conductor of E, equal to the level of F_E (EllipticCurveModularity R29.4/exact-conductor).
* Γ_ℂ convention: Λ(E,s) here is 2 × the function N^{s/2}(2π)^{-s}Γ(s)L(E,s) of R29.6 and of BFH; the factor 2 does not change the sign w_E.

*Proof outline.*

1. Entire: N^{s/2} and Γ_ℂ(s)·ellipticL E s are entire because Γ_ℂ(s)L(E,s) is the Mellin transform of a cusp form (Mathlib ModularForm.Λ via R29.6); poles of Γ at s = 0, −1, … are cancelled.
2. Functional equation: R29.6/l-function-continuation gives Λ(E,s) = w_E Λ(E,2−s) with w_E the eigenvalue of −W_N on F_E.
3. Uniqueness of the sign: completedEllipticL E 2 ≠ 0 (Euler product), so ε with Λ(s) = εΛ(2 − s) is determined by evaluating at s = 2 and s = 0.
4. Comparison with Tau Ceti ModularForms Layer 6–7: the companion equation Λ_N(k−s,f) = i^k Λ_N(s, 𝒲_N f) with k = 2 gives the sign −ε_N.

*Uses:* `mathlib:Complex.Gammaℂ`, `BSD.0/actual-l-function`, `EllipticCurveModularity:R29.6/l-function-continuation`, `EllipticCurveModularity:R29.4/exact-conductor`, `tauceti:TauCeti.frickeOperator`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

*Sources:* bfh90, Introduction, p. 543; tauceti-modularforms-roadmap, ModularForms README, Layer 6; gross-kolyvagin, §5, after (5.2), p. 243 (read from the page image).

*Uses of the object.* RankZeroOneBSD:BSD.0/root-number-parity: the sign forces the parity of the order at s = 1. RankZeroOneBSD:BSD.0/twist-root-number: w(E^D) = χ_D(−N)w(E). BFH90, Introduction: ε selects which quadratic twists can have nonvanishing central value or derivative. RankZeroOneBSD:BSD.3: analytic rank one forces w_E = −1, which selects the value branch of BSD.2.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.completedEllipticL` | constructor | completedEllipticL E s = (N : ℂ)^{s/2} * Gammaℂ s * ellipticL E s. |
| `WeierstrassCurve.differentiable_completedEllipticL` | structure | completedEllipticL E is entire. |
| `WeierstrassCurve.rootNumber` | data | rootNumber E : ℤˣ, the sign of the functional equation. |
| `WeierstrassCurve.completedEllipticL_two_sub` | relation | completedEllipticL E (2 − s) = rootNumber E * completedEllipticL E s. |
| `WeierstrassCurve.rootNumber_eq_neg_fricke` | compatibility | rootNumber E = −ε_N(F_E), the negative of the eigenvalue of Tau Ceti's normalised Fricke operator on the newform of E. |
| `WeierstrassCurve.rootNumber_eq_of_isogenous` | compatibility | Isogenous curves have equal root numbers. |
| `WeierstrassCurve.rootNumber_eq_prod_local` | relation | rootNumber E = ∏_v w_v(E) over all places, w_∞ = −1, w_ℓ = −a_ℓ at multiplicative ℓ and w_ℓ = 1 at good ℓ (local ε-factors, GL2AutomorphicRepresentationsAndTransfer R16.3). |
| `WeierstrassCurve.completedEllipticL_one` | simp | completedEllipticL E 1 = N^{1/2} π^{-1} ellipticL E 1 (Γ_ℂ(1) = π^{-1}). |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.rootNumber_37a` | computation | rootNumber (37a1 : y² + y = x³ − x) = −1, while the Fricke eigenvalue of its newform is +1. |
| `WeierstrassCurve.rootNumber_11a` | computation | rootNumber (11a1) = +1 (a₁₁ = 1, split multiplicative, w₁₁ = −1, w_∞ = −1). |
| `WeierstrassCurve.completedEllipticL_one_eq` | degenerate | completedEllipticL E 1 = Real.sqrt N / π · ellipticL E 1. |
| `WeierstrassCurve.rootNumber_ne_fricke` | non-example | For 37a1, rootNumber E ≠ ε_N(F_E): the tempting definition rootNumber := Fricke eigenvalue has the wrong sign in weight two. |

*Acceptance.*

* w(11a1) = +1 and w(37a1) = −1.
* rootNumber is invariant under ℚ-isogeny (equal L-functions and conductors).


### `BSD.0/analytic-rank` — Analytic rank and the leading coefficient at s = 1 (definition) — planet *Analytic rank*

For E/ℚ elliptic, analyticRank E := analyticOrderNatAt (ellipticL E) 1 ∈ ℕ, and analyticOrderAt (ellipticL E) 1 ≠ ⊤. The leading coefficient is leadingTerm E := iteratedDeriv r (ellipticL E) 1 / r! with r = analyticRank E; it is a nonzero real number, and ellipticL E s = (s − 1)^r (leadingTerm E + O(s − 1)) near s = 1. In particular analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0.

*Hypotheses and conventions.*

* Defined on the entire continuation ellipticL E, never on Mathlib's tsum E.LSeries.
* Finiteness uses only that ellipticL E is entire and not identically zero (it is nonzero at s = 2).

*Proof outline.*

1. ellipticL E is analytic on the connected set ℂ and nonzero at s = 2 (ellipticL_ne_zero_of_re_gt), so its order at 1 is finite (identity theorem; AnalyticAt.analyticOrderAt_ne_top).
2. The factorisation (s − 1)^r g(s) with g(1) ≠ 0 gives g(1) = iteratedDeriv r (ellipticL E) 1 / r! by Taylor's formula.
3. Reality: ellipticL E is real on ℝ (actual-l-function, ellipticL_conj), hence so are all derivatives at 1.
4. The order-zero and order-one criteria are analyticOrderAt_eq_zero and the r = 1 case of the factorisation.

*Uses:* `mathlib:analyticOrderAt`, `mathlib:analyticOrderNatAt`, `mathlib:AnalyticAt.analyticOrderAt_ne_top`, `mathlib:analyticOrderAt_eq_zero`, `mathlib:iteratedDeriv`, `mathlib:Nat.factorial`, `BSD.0/actual-l-function`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

*Sources:* mathlib-order, Mathlib/Analysis/Analytic/Order.lean, docstring of analyticOrderAt; jsw, Conjecture 1.1.1(a), p. 1; tauceti-modularforms-roadmap, ModularForms README, Layer 7.

*Uses of the object.* RankZeroOneBSD:BSD.3: the hypothesis analyticRank E = 1 of the rank-one theorem. RankZeroOneBSD:BSD.4: the hypothesis analyticRank E = 0. RankZeroOneBSD:BSD.5: leadingTerm E is the numerator of the rational BSD defect. JSW Theorem 1.2.1: ord_{s=1} L(E,s) = 1 and L′(E,1) in the p-part formula.

*API.*

| Name | Role | Statement |
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

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.analyticRank_eq_zero_iff_test` | degenerate | analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and then leadingTerm E = ellipticL E 1. |
| `WeierstrassCurve.analyticRank_37a` | computation | analyticRank (37a1) = 1. |
| `WeierstrassCurve.analyticRank_eq_newform` | compatibility | analyticRank E equals Tau Ceti ModularForms Layer 7's analytic rank of F_E (order of its entire continuation at the centre k/2 = 1). |
| `WeierstrassCurve.analyticRank_unitary_centre` | compatibility | analyticRank E = analyticOrderNatAt (fun s ↦ ellipticL E (s + 1/2)) (1/2): the unitary centre s = 1/2 of L(s, π_E) is the motivic centre 1 (GZ.0/unitary-and-motivic-centres). |
| `WeierstrassCurve.leadingTerm_not_halved` | non-example | For analytic rank one, leadingTerm E = deriv (ellipticL E) 1, not deriv (ellipticL E) 1 / 2: the factor is 1/r! = 1. |

*Acceptance.*

* analyticRank (11a1) = 0 and analyticRank (37a1) = 1, with the nonvanishing certified by BSD.9's rigorous enclosures.


### `BSD.0/root-number-parity` — Root-number parity of the analytic rank (theorem) — planet *Root-number parity*

For every E/ℚ elliptic, (−1)^{analyticRank E} = rootNumber E. Consequently rootNumber E = −1 implies ellipticL E 1 = 0, and analyticRank E = 1 implies rootNumber E = −1.

*Hypotheses and conventions.*

* E/ℚ elliptic.

*Proof outline.*

1. Write Λ = completedEllipticL E and r = analyticRank E. The factor N^{s/2}Γ_ℂ(s) is analytic and nonzero at s = 1, so ord_{s=1} Λ = r.
2. The functional equation Λ(1 + t) = w_E Λ(1 − t) compares Taylor coefficients at t = 0: c_k = w_E (−1)^k c_k.
3. Taking k = r, where c_r ≠ 0, gives (−1)^r = w_E.

*Uses:* `BSD.0/completed-l-function`, `BSD.0/analytic-rank`, `mathlib:analyticOrderAt`, `mathlib:iteratedDeriv`.

*Sources:* bfh90, Introduction, p. 543.

*Acceptance.*

* 37a1: w = −1 and analyticRank = 1; 11a1: w = +1 and analyticRank = 0.
* For the congruent-number twists (congruent-number-root-numbers) the parity of the analytic rank is read off n mod 8.


### `BSD.0/quadratic-field-character` — The quadratic character of a quadratic field (comparison)

Let K be a quadratic number field with discriminant D_K = NumberField.discr K (a fundamental discriminant) and χ_K := kroneckerCharacter D_K (ClassicalArithmeticCompletion CA.1). Then for every rational prime ℓ: χ_K(ℓ) = 1 if ℓ splits in K, −1 if ℓ is inert, 0 if ℓ ramifies (equivalently ℓ | D_K); for ℓ ∤ D_K and any arithmetic Frobenius σ at a prime above ℓ, χ_K(ℓ) = quadraticCharacter ℚ K σ (Tau Ceti); and χ_K(−1) = sign D_K, so K is imaginary iff χ_K(−1) = −1.

*Hypotheses and conventions.*

* K/ℚ quadratic, as a number field with Algebra.IsQuadraticExtension ℚ K.
* χ_K is a primitive Dirichlet character of conductor |D_K| (CA.1/kronecker-character-is-primitive).

*Proof outline.*

1. Write K = ℚ(√d) with d squarefree; D_K = d or 4d (Mathlib Int.IsFundamentalDiscr, Tau Ceti IsFundamentalDiscriminant).
2. For odd ℓ ∤ d, ℓ splits iff d is a square mod ℓ (Dedekind–Kummer); Tau Ceti's NumberField.isArithFrobAt_multiquadratic_eq_one_iff states the Frobenius form, and kroneckerCharacter D_K (ℓ) = legendreSym ℓ D_K by CA.1.
3. For ℓ = 2 ∤ D_K (d ≡ 1 mod 4), 2 splits iff d ≡ 1 mod 8, matching kroneckerCharacter's value at 2.
4. Ramified primes are exactly ℓ | D_K (discriminant criterion), where χ_K vanishes.

*Uses:* `ClassicalArithmeticCompletion:CA.1/kronecker-character`, `ClassicalArithmeticCompletion:CA.1/kronecker-character-is-primitive`, `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter`, `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff`, `mathlib:IsArithFrobAt`, `mathlib:NumberField.discr`, `mathlib:Int.IsFundamentalDiscr`, `mathlib:Algebra.IsQuadraticExtension`.

*Sources:* bfh90, Introduction, p. 543.

*Acceptance.*

* K = ℚ(√−7): D_K = −7, χ_K(2) = 1 (2 splits), χ_K(3) = −1 (3 inert), χ_K(7) = 0.
* K = ℚ(i): D_K = −4, χ_K = χ₄.


### `BSD.0/finite-field-twist-trace` — Trace of Frobenius of a twist over a finite field (lemma)

Let F be a finite field with q elements and E an elliptic Weierstrass curve over F, a_q(E) := q + 1 − #E(F). (i) If char F ≠ 2 and d ∈ Fˣ, the twist E_d := E.quadraticTwistOf 0 (−d/4) (discriminant D = d) satisfies a_q(E_d) = quadraticChar F d · a_q(E); this includes d a square, where E_d ≅ E and the factor is 1. (ii) If char F = 2 and E_c := E.quadraticTwistOf 1 c (discriminant 1, the Artin–Schreier twist by x² − x + c), then a_q(E_c) = (−1)^{Tr_{F/𝔽₂}(c)} · a_q(E).

*Hypotheses and conventions.*

* E elliptic over a finite field; for (i) char F odd.
* The twist is Tau Ceti's quadraticTwistOf; its Weierstrass model is elliptic when D ≠ 0.

*Proof outline.*

1. Odd characteristic: complete the square, y² = f(x) with f a cubic; the twist is d y² = f(x) up to a change of variables (Tau Ceti exists_smul_quadraticTwistOf_eq).
2. Count points: for each x ∈ F there are 1 + χ(f(x)) points on E and 1 + χ(d f(x)) = 1 + χ(d)χ(f(x)) on E_d; add the point at infinity and sum.
3. Characteristic two: the number of y with y² + (a₁x + a₃)y = g(x) is 1 + (−1)^{Tr(·)} of the Artin–Schreier invariant; twisting by c multiplies that sign by (−1)^{Tr(c)}.

*Uses:* `tauceti:WeierstrassCurve.quadraticTwistOf`, `mathlib:quadraticChar`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

*Sources:* tauceti-twist, TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistOf.

*Acceptance.*

* Over 𝔽₅, E : y² = x³ + x + 1 has 9 points (a = −3); with d = 2 (a nonsquare) the twist 2y² = x³ + x + 1 has 3 points (a = 3).
* d = 4 (a square in 𝔽₅) gives the same count 9.


### `BSD.0/twist-local-factors` — Local Euler factors of a quadratic twist (theorem) — planet *Twist Euler factors*

Let E/ℚ be elliptic, K a quadratic field with character χ = χ_K and E^K := E.quadraticTwist K. (a) For every prime ℓ ∤ D_K, E^K has the same reduction type as E at ℓ and its local polynomial is P_ℓ(E^K, T) = P_ℓ(E, χ(ℓ)T): at good ℓ, a_ℓ(E^K) = χ(ℓ)a_ℓ(E); at multiplicative ℓ, split and nonsplit reduction are exchanged exactly when χ(ℓ) = −1; at additive ℓ both factors are 1. (b) For ℓ | D_K, P_ℓ(E^K, T) = det(1 − Frob_ℓ T | (V_r(E) ⊗ χ_ℓ)^{I_ℓ}) for any prime r ≠ ℓ, where χ_ℓ is the local character of K at ℓ; in particular if E has good or multiplicative reduction at ℓ then E^K has additive reduction at ℓ and P_ℓ(E^K, T) = 1.

*Hypotheses and conventions.*

* Mathlib's localPolynomial is computed on minimal models (WeierstrassCurve.minimal); the comparison includes the change to a minimal model of the twist.
* ℓ = 2 is included in both (a) and (b).

*Proof outline.*

1. (a), ℓ odd: D_K is an ℓ-adic unit, so the twisted model has Δ ↦ D⁶Δ with the same valuation; minimality and the reduction type are preserved, and the reduction of E^K is the twist of the reduction of E by the class of D_K mod ℓ (finite-field-twist-trace).
2. Multiplicative reduction: the tangent directions at the node are defined over 𝔽_ℓ(√(−c₆)); twisting multiplies −c₆ by D³, so splitness flips exactly when D_K is a nonsquare mod ℓ, i.e. χ(ℓ) = −1.
3. (a), ℓ = 2 ∤ D_K: D_K ≡ 1 mod 4, and the twist is an Artin–Schreier twist over 𝔽₂ by x² − x + (1 − D_K)/4, whose trace is 1 exactly when D_K ≡ 5 mod 8, i.e. χ(2) = −1 (finite-field-twist-trace (ii)).
4. (b): the Tate module of E^K is V_r(E) ⊗ χ as a G_ℚ-representation (Tau Ceti quadraticTwistPointEquiv twists the Galois action by the quadratic character). The Néron–Ogg–Shafarevich criterion and the Galois description of local factors (EllipticCurves Layer 4; EllipticCurveModularity R29.4/bad-euler-factors) give the local polynomial as the characteristic polynomial on inertia invariants. If V_r(E) is unramified or has unipotent inertia action, tensoring with the ramified χ_ℓ kills the invariants.

*Uses:* `BSD.0/finite-field-twist-trace`, `BSD.0/quadratic-field-character`, `tauceti:WeierstrassCurve.quadraticTwist`, `tauceti:WeierstrassCurve.isElliptic_quadraticTwist`, `mathlib:WeierstrassCurve.localPolynomial`, `mathlib:WeierstrassCurve.HasGoodReduction`, `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasAdditiveReduction`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

*Sources:* jsw, Footnote 7, p. 42; skinner-zhang, §9.1, Corollary 9.2 and proof, p. 29.

*Acceptance.*

* E = 11a1, K = ℚ(√−7): a₂(E) = −2 and χ(2) = 1, so a₂(E^K) = −2; a₃(E) = −1 and χ(3) = −1, so a₃(E^K) = 1.
* E = 11a1, K = ℚ(√−1): at ℓ = 11, χ(11) = −1, so the split multiplicative reduction of E becomes nonsplit for E^K.


### `BSD.0/twist-l-series` — The L-series and conductor of a quadratic twist coprime to the conductor (theorem)

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then E.quadraticTwist K has conductor N·D_K², its coefficients are a_n(E^K) = χ_K(n)·a_n(E) for every n ≥ 1, ellipticL E^K is the entire continuation of Σ χ_K(n)a_n(E)n^{-s}, and the newform of E^K is the twist F_E ⊗ χ_K, a newform of level N D_K².

*Hypotheses and conventions.*

* (D_K, N) = 1. Without it the coefficients at ℓ | (D_K, N) and the conductor need twist-local-factors (b).

*Proof outline.*

1. For ℓ ∤ D_K, twist-local-factors (a) gives P_ℓ(E^K,T) = P_ℓ(E, χ(ℓ)T), so a_{ℓ^k}(E^K) = χ(ℓ)^k a_{ℓ^k}(E).
2. For ℓ | D_K, ℓ ∤ N: E has good reduction at ℓ, so E^K is additive there (twist-local-factors (b)) and a_{ℓ^k}(E^K) = 0 = χ(ℓ^k)a_{ℓ^k}(E).
3. Multiplicativity of both coefficient sequences gives the identity for all n.
4. Conductor: at ℓ | D_K the representation V ⊗ χ_ℓ has V unramified, so its conductor exponent is 2·a(χ_ℓ) = 2 v_ℓ(D_K); elsewhere it is unchanged (R29.4/exact-conductor identifies the level with this conductor).
5. Newform: F_E ⊗ χ_K has the coefficients a_n(E^K) and level N D_K² (twist of a newform by a character of coprime conductor is new), and equals F_{E^K} by strong multiplicity one (R29.3/newform-of-E).

*Uses:* `BSD.0/twist-local-factors`, `BSD.0/quadratic-field-character`, `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.4/exact-conductor`, `mathlib:WeierstrassCurve.LFunction`, `BSD.0/actual-l-function`.

*Sources:* bfh90, Introduction, p. 543; jsw, Footnote 8, p. 43.

*Acceptance.*

* E = 11a1, K = ℚ(√−7): E^K has conductor 11·49 = 539.


### `BSD.0/twist-root-number` — Root number of a quadratic twist (theorem)

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then rootNumber (E.quadraticTwist K) = χ_K(−N)·rootNumber E. In particular, if K is imaginary and every prime dividing N splits in K, then rootNumber E^K = −rootNumber E, and rootNumber E · rootNumber E^K = −1.

*Hypotheses and conventions.*

* (D_K, N) = 1.
* For K imaginary χ_K(−1) = −1; the Heegner hypothesis gives χ_K(N) = 1.

*Proof outline.*

1. Twist the completed function: Λ(s, F_E ⊗ χ_K) with conductor N D_K² (twist-l-series).
2. The twist of a newform of level N and sign ε by a primitive character χ of conductor D coprime to N has sign ε·χ(N)·τ(χ)²/D; for quadratic χ = χ_K, τ(χ_K)² = χ_K(−1)|D_K|, so the sign is ε·χ_K(−N). Equivalently, with local ε-factors (GL2AutomorphicRepresentationsAndTransfer R16.3) only the places ℓ | D_K change, together contributing χ_K(−N).
3. Under the Heegner hypothesis χ_K(N) = ∏ χ_K(ℓ)^{v_ℓ(N)} = 1 and χ_K(−1) = −1.

*Uses:* `BSD.0/completed-l-function`, `BSD.0/twist-l-series`, `BSD.0/quadratic-field-character`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

*Sources:* bfh90, Introduction, p. 543; bfh90, Introduction, p. 543.

*Acceptance.*

* E = 37a1 (w = −1), K = ℚ(√−7) (37 ≡ 2 mod 7 is a square, so 37 splits): w(E^K) = +1.
* E = 11a1 (w = +1), K = ℚ(√−7) (11 ≡ 4 mod 7 is a square): w(E^K) = −1.


### `BSD.0/base-change-factorization` — Factorisation of the L-function over a quadratic field (theorem) — planet *Base-change factorisation*

Let E/ℚ be elliptic and K a quadratic field. As arithmetic functions, (E.baseChange K).LFunction = E.LFunction ⍟ (E.quadraticTwist K).LFunction (Dirichlet convolution), the left side being Mathlib's Euler product over the height-one primes of 𝓞_K grouped by norm. Hence (E.baseChange K).LSeries s = E.LSeries s · (E.quadraticTwist K).LSeries s for Re s > 3/2, and L(E/K, s) has the entire continuation ellipticL E · ellipticL E^K.

*Hypotheses and conventions.*

* K/ℚ quadratic (real or imaginary); no coprimality between D_K and N is assumed.

*Proof outline.*

1. Both sides are Euler products; compare, for each rational prime ℓ, the product of the factors of E/K at the primes 𝔩 | ℓ with P_ℓ(E,T)P_ℓ(E^K,T).
2. ℓ split: K_𝔩 = ℚ_ℓ for both 𝔩, and E^K ≅ E over ℚ_ℓ since D_K is a square there, so both sides are P_ℓ(E,T)².
3. ℓ inert: one prime of norm ℓ², with factor P_𝔩(E/K, T²) computed over the quadratic unramified extension; at good ℓ the identity (1 − αT)(1 − βT)(1 + αT)(1 + βT) = (1 − α²T²)(1 − β²T²) with a_{ℓ²} = a_ℓ² − 2ℓ (point count over 𝔽_{ℓ²}, EllipticCurves Layer 3) and twist-local-factors (a) with χ(ℓ) = −1; at multiplicative ℓ (1 − aT)(1 + aT) = 1 − T² since the reduction over 𝔽_{ℓ²} is split; at additive ℓ both sides are 1.
4. ℓ ramified: one prime of norm ℓ; as I_ℓ/I_𝔩 ≅ {±1} acts on V^{I_𝔩} by an involution, V^{I_𝔩} = V^{I_ℓ} ⊕ (V ⊗ χ_ℓ)^{I_ℓ} as Frobenius modules, which is twist-local-factors (b).
5. Convergence for Re s > 3/2 of each factor gives the LSeries identity (LSeries_convolution); the product of the two entire functions agrees with it there, so it is the continuation.

*Uses:* `BSD.0/twist-local-factors`, `BSD.0/actual-l-function`, `mathlib:WeierstrassCurve.LFunction`, `mathlib:WeierstrassCurve.LSeries`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:ArithmeticFunction.eulerProduct`, `mathlib:LSeries_convolution`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

*Sources:* jsw, §7.4.1, p. 46; mathlib-lfunction, Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean, docstring of LFunction.

*Acceptance.*

* E = 11a1, K = ℚ(√−7): the coefficient of 2^{−s} in L(E/K,s) is a₂(E) + a₂(E^K) = −4 (two primes of norm 2, each with a = −2).
* Coefficient of 3^{−s} in L(E/K,s) is 0 (3 inert: no ideal of norm 3), matching a₃(E) + a₃(E^K) = −1 + 1.


### `BSD.0/base-change-central-identities` — Order, leading term and sign of L(E/K, s) at the centre (lemma)

Let E/ℚ be elliptic, K quadratic, r = analyticRank E and r' = analyticRank E^K. The continuation ellipticL E · ellipticL E^K of L(E/K,s) has order r + r' at s = 1 and leading coefficient leadingTerm E · leadingTerm E^K. In particular (a) if r = 1 and ellipticL E^K 1 ≠ 0, then L(E/K,s) has a simple zero and L′(E/K,1) = L′(E,1)·L(E^K,1); (b) if r = 0 and r' = 1, then L′(E/K,1) = L(E,1)·L′(E^K,1). If (D_K, N) = 1, K is imaginary and every prime dividing N splits in K, then r + r' is odd.

*Hypotheses and conventions.*

* K quadratic; for the parity statement, the Heegner hypothesis and (D_K, N) = 1.

*Proof outline.*

1. Orders add and leading coefficients multiply for a product of analytic functions (Mathlib analyticOrderAt of a product).
2. (a), (b) are the cases r + r' = 1 of the product rule.
3. Parity: root-number-parity for E and E^K and twist-root-number give (−1)^{r+r'} = w(E)w(E^K) = −1.

*Uses:* `BSD.0/base-change-factorization`, `BSD.0/analytic-rank`, `BSD.0/root-number-parity`, `BSD.0/twist-root-number`, `mathlib:analyticOrderAt`.

*Sources:* jsw, §7.4.1, p. 45; jsw, §7.4.1, p. 45.

*Acceptance.*

* E = 37a1, K = ℚ(√−7): r = 1 and w(E^K) = +1 (twist-root-number), consistent with r' even.


### `BSD.0/rational-newform-bridge` — The rational newform of E and its L-series (comparison)

For E/ℚ elliptic of conductor N, the newform F_E ∈ S₂(Γ₀(N)) of EllipticCurveModularity R29.3 has rational integer Fourier coefficients and (E.LFunction n : ℂ) = a_n(F_E) for every n ≥ 1, including n divisible by primes of bad reduction. Hence E.LSeries = the Dirichlet series of F_E on Re s > 3/2, the entire extension of E's coefficient series is that of F_E (Mathlib ModularForm.L at strict width one), and ellipticL E takes real values on ℝ with real derivatives at s = 1.

*Hypotheses and conventions.*

* Uses the actual modularity theorem (R29.6), not a hypothesis on E.

*Proof outline.*

1. Prime coefficients: R29.4/bad-euler-factors identifies every local polynomial of E with that of F_E.
2. Prime-power and composite coefficients: both sequences are multiplicative with the same Hecke recursion at each prime, so the Euler products agree coefficientwise.
3. Rationality: R29.3/rational-coefficient-field; real coefficients give ellipticL E (conj s) = conj (ellipticL E s).

*Uses:* `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.3/rational-coefficient-field`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `EllipticCurveModularity:R29.6/modularity-theorem`, `mathlib:WeierstrassCurve.LFunction`, `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`.

*Sources:* jsw, §7.3.2, p. 44.

*Acceptance.*

* E = 11a1: a₂ = −2, a₃ = −1, a₅ = 1, a₁₁ = 1 agree with η(q)²η(q¹¹)² = q − 2q² − q³ + 2q⁴ + q⁵ + ⋯.


### `BSD.0/congruent-number-root-numbers` — Root numbers of the congruent-number twists (application)

Let E : y² = x³ − x (conductor 32) and, for a positive squarefree integer n, E^(n) : n y² = x³ − x, the quadratic twist of E by ℚ(√n). Then rootNumber E^(n) = +1 exactly when n ≡ 1, 2, 3 (mod 8), and −1 when n ≡ 5, 6, 7 (mod 8). E^(−1) ≅ E, so the classification is for positive n only.

*Hypotheses and conventions.*

* n > 0 squarefree. The twist-root-number formula does not apply directly, since D = disc ℚ(√n) is even when n ≢ 1 mod 4 or n even, and 2 | N.

*Proof outline.*

1. Write rootNumber E^(n) = w_∞ · w_2 · ∏_{ℓ | n odd} w_ℓ with w_∞ = −1 (rootNumber_eq_prod_local).
2. For odd ℓ | n, E^(n) has additive potentially good reduction of type I₀* at ℓ and w_ℓ = (−1/ℓ) (local ε-factor of a ramified quadratic twist of an unramified representation, GL2AutomorphicRepresentationsAndTransfer R16.3).
3. At 2, w_2(E^(n)) depends only on n mod 8 (E has CM by ℤ[i] and potentially good reduction at 2); evaluate it on the representatives n = 1, 2, 3, 5, 6, 7 (Birch–Stephens).
4. Combine: the product is +1 exactly for n ≡ 1, 2, 3 (mod 8).

*Uses:* `BSD.0/completed-l-function`, `BSD.0/twist-local-factors`, `BSD.0/root-number-parity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

*Sources:* burungale-tian, Footnote 2 to Theorem 1.2, p. 2.

*Acceptance.*

* n = 1, 2, 3: w = +1 (not congruent numbers); n = 5, 6, 7: w = −1 (congruent numbers, analytic rank odd).
* The ArithmeticStatistics ST.5 consumer reads w(E^(n)) = +1 for n ≡ 1, 2, 3 mod 8 from this node.


**Acceptance tests for BSD.0.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* ellipticL E 2 = E.LSeries 2, and both equal the absolutely convergent Euler product at s = 2.
* For E = 11a3 (y² + y = x³ − x²) the function ellipticL E is entire while E.LSeries 1 = 0 is the tsum junk value; ellipticL E 1 ≠ 0 (BSD.4 certifies analytic rank zero).
* w(11a1) = +1 and w(37a1) = −1.
* rootNumber is invariant under ℚ-isogeny (equal L-functions and conductors).
* analyticRank (11a1) = 0 and analyticRank (37a1) = 1, with the nonvanishing certified by BSD.9's rigorous enclosures.
* 37a1: w = −1 and analyticRank = 1; 11a1: w = +1 and analyticRank = 0.


<a id="bsd-1"></a>
## BSD.1. Arithmetic invariants and quadratic descent

BSD.1 compares the arithmetic of E over a quadratic field K with that of E and E^K over ℚ. All objects are imported (points, heights, regulators, Selmer groups, Ш, Tamagawa numbers, periods); the layer owns the comparisons.

The maps res, conj, tr and ι realise E(ℚ) and E^K(ℚ) as the ±1 eigenspaces of complex conjugation on E(K) (from Tau Ceti's Galois-twisted point isomorphism and Galois descent). Because 2E(K) ⊆ res E(ℚ) + ι E^K(ℚ), the ranks add, and the lattice index is a power of 2 bounded by 2^r; the regulator over K is 2^r Reg(E/ℚ)Reg(E^K/ℚ) divided by the square of that index, with heights relative to K. At odd p the Selmer and Ш groups split into eigenspaces; at p = 2 only the kernels and cokernels of restriction and corestriction, killed by 2, are controlled — no integral direct sum is asserted. Finiteness of Ш descends along any finite Galois extension because the kernel of restriction is a finitely generated group killed by the degree. The Tamagawa factors over K agree in their odd parts with the product over E and E^K (Skinner–Zhang), and the period over K is Ω_E Ω_{E^K}|D_K|^{1/2} up to a power of 2; together these give the comparison of BSD quotients over K and over ℚ at odd primes that BSD.5 and BSD.6 use. The exact dyadic bookkeeping is a recorded gap needed only at p = 2.

**Dependencies on other roadmaps:** `ArithmeticGaloisDuality:R02.4`, `GrossZagierAndArithmeticHeights:GZ.0`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `tauceti:TauCetiRoadmap`.

**Dependencies inside this roadmap:** BSD.0.


### `BSD.1/quadratic-point-maps` — Restriction, conjugation, trace and twist maps on points over a quadratic field (construction) — planet *Quadratic trace and twist maps*

Let E/ℚ be elliptic, K a quadratic field with nontrivial automorphism σ, E_K = E.baseChange K and E^K = E.quadraticTwist K. Define the additive maps res : E(ℚ) → E(K) (Point.map along ℚ → K), conj : E(K) → E(K) (Point.map along σ), tr : E(K) → E(ℚ) with res (tr P) = P + σP, and ι : E^K(ℚ) → E(K), the composite of res for E^K with quadraticTwistPointEquiv E^K(K) ≃+ E(K). Then res and ι are injective, range res = {P : σP = P}, range ι = {P : σP = −P}, tr ∘ res = 2·id, res ∘ tr = 1 + conj, and 2·E(K) ⊆ range res + range ι.

*Hypotheses and conventions.*

* K/ℚ quadratic; the twist is Tau Ceti's quadraticTwist and the point isomorphism is chosen once (well defined up to the automorphism −1).

*Proof outline.*

1. res and conj are Mathlib's Point.map; σ² = 1 gives conj² = id.
2. tr: P + σP is σ-fixed, so it descends uniquely to E(ℚ) by Point.exists_baseChange_eq_of_map_eq (uniqueness from injectivity of res).
3. ι: by quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map with M = K and σ the nontrivial element (χ(σ) = −1), points of E^K(ℚ) go to σ-anti-fixed points; conversely an anti-fixed point of E(K) pulls back to a σ-fixed point of E^K(K), which descends.
4. 2P = (P + σP) + (P − σP) with P + σP ∈ range res and P − σP ∈ range ι.

*Uses:* `mathlib:WeierstrassCurve.Affine.Point`, `mathlib:WeierstrassCurve.Affine.Point.map`, `mathlib:WeierstrassCurve.baseChange`, `tauceti:WeierstrassCurve.quadraticTwist`, `tauceti:WeierstrassCurve.quadraticTwistPointEquiv`, `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

*Sources:* tauceti-twist, TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map; jsw, §7.4.1, p. 47.

*Uses of the object.* RankZeroOneBSD:BSD.1/rank-splitting: the ± decomposition of E(K) ⊗ ℚ. RankZeroOneBSD:BSD.3: the Heegner point y_K lies in the eigenspace selected by the root number, read through range res or range ι. Gross, Kolyvagin's work, §5: complex conjugation acts on y_K by a sign, placing it in E(ℚ) or in the twist.

*API.*

| Name | Role | Statement |
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

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.Affine.Point.quadraticTrace_res_test` | characterisation | For E = 37a1, K = ℚ(√−7) and P = (0, 0) ∈ E(ℚ), tr (res P) = 2P = (1, 0). |
| `WeierstrassCurve.Affine.Point.twistEmbed_anti` | characterisation | conj (ι Q) = −ι Q for every Q ∈ E^K(ℚ). |
| `WeierstrassCurve.Affine.Point.quadraticTrace_not_surjective` | non-example | tr is not surjective in general: for E = 37a1 (E(ℚ) = ℤ·(0,0), no torsion) and any quadratic K with E(K) = res E(ℚ) + E(K)_tors, the image of tr is 2E(ℚ) ≠ E(ℚ). |
| `WeierstrassCurve.Affine.Point.ker_res_add_twistEmbed` | compatibility | The kernel of res + ι on E(ℚ) × E^K(ℚ) is contained in E(ℚ)[2] × E^K(ℚ)[2] (Submodule.torsionBy ℤ _ 2). |

*Acceptance.*

* For P ∈ E(ℚ), tr (res P) = 2P.
* ker(res + ι : E(ℚ) × E^K(ℚ) → E(K)) is a subgroup of E(ℚ)[2] × E^K(ℚ)[2].


### `BSD.1/rank-splitting` — Rank splitting over a quadratic field (theorem) — planet *Rank splitting over K*

For E/ℚ elliptic and K a quadratic field, rank E(K) = rank E(ℚ) + rank E^K(ℚ), where rank is Module.finrank ℤ of the free quotient PointModTorsion. More precisely res + ι : E(ℚ) ⊕ E^K(ℚ) → E(K) has kernel and cokernel killed by 2, both finite.

*Hypotheses and conventions.*

* K/ℚ quadratic; all three groups finitely generated (Mordell–Weil over number fields).

*Proof outline.*

1. Kernel: if res P + ι Q = 0 then applying conj gives res P − ι Q = 0, so 2 res P = 0 and 2 ι Q = 0, hence P ∈ E(ℚ)[2] and Q ∈ E^K(ℚ)[2].
2. Cokernel: 2E(K) ⊆ range res + range ι (quadratic-point-maps), so the cokernel is a quotient of E(K)/2E(K), finite by Mordell–Weil and killed by 2.
3. Tensoring with ℚ kills both, giving the rank identity.

*Uses:* `BSD.1/quadratic-point-maps`, `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `mathlib:Module.finrank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

*Sources:* jsw, §7.4.1, p. 46.

*Acceptance.*

* E = 37a1, K = ℚ(√−7): rank E(ℚ) = 1, and once rank E(K) = 1 is proved (BSD.3), rank E^K(ℚ) = 0.


### `BSD.1/quadratic-regulator-comparison` — Lattice index and regulators over a quadratic field (theorem)

Let E/ℚ be elliptic, K quadratic, Λ = E(K)/tors, Λ₊ = image of res and Λ₋ = image of ι, r₊ = rank E(ℚ), r₋ = rank E^K(ℚ), r = r₊ + r₋. Then Λ₊ ⊥ Λ₋ for the Néron–Tate pairing over K, [Λ : Λ₊ ⊕ Λ₋] = 2^a with 0 ≤ a ≤ r, and with K-relative heights (⟨P, P⟩_K = [K:ℚ]·⟨P, P⟩_ℚ for P defined over ℚ) Reg_BSD(E/K) = 2^r · Reg_BSD(E/ℚ) · Reg_BSD(E^K/ℚ) / 4^a. In particular, if r₋ = 0 then Reg_BSD(E/K) = 2^{r₊} Reg_BSD(E/ℚ)/4^a and E(K)/tors contains res(E(ℚ)/tors) with index 2^a.

*Hypotheses and conventions.*

* Reg_BSD is the regulator of GrossZagierAndArithmeticHeights GZ.0 (x-height normalisation, Reg_BSD = 2^r · Tau Ceti regulator).
* K-relative heights need a number-field instance of Tau Ceti's height machinery, which the pinned library lacks (GZ.0 gap); the statement is made for that instance.

*Proof outline.*

1. Orthogonality: the height pairing over K is invariant under σ; for P ∈ Λ₊, Q ∈ Λ₋, ⟨P, Q⟩ = ⟨σP, σQ⟩ = −⟨P, Q⟩.
2. Index: 2Λ ⊆ Λ₊ ⊕ Λ₋ (quadratic-point-maps), so the index divides 2^r.
3. Heights of rational points relative to K are [K:ℚ] = 2 times their heights relative to ℚ; points of E^K(ℚ) carry the same K-height through the isomorphism over K.
4. Gram determinants: det Gram_K(Λ₊ ⊕ Λ₋) = 2^{r₊}Reg(E/ℚ)·2^{r₋}Reg(E^K/ℚ), and passing to the superlattice Λ divides by its index squared (GZ.0/gram-determinant-rescaling).

*Uses:* `BSD.1/quadratic-point-maps`, `BSD.1/rank-splitting`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/gram-determinant-rescaling`, `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`, `tauceti:WeierstrassCurve.Affine.regulator`, `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

*Sources:* jsw, §7.4.1, p. 46.

*Acceptance.*

* Rank one, r₋ = 0, a = 0: Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ).
* Rank zero over K: all regulators are 1 (regulator_eq_one_of_finrank_eq_zero).


### `BSD.1/torsion-comparison` — Torsion over a quadratic field (lemma)

For E/ℚ elliptic, K quadratic and p an odd prime, res + ι induces E(ℚ)[p^∞] ⊕ E^K(ℚ)[p^∞] ≅ E(K)[p^∞]. At p = 2 the map E(ℚ)[2^∞] ⊕ E^K(ℚ)[2^∞] → E(K)[2^∞] has kernel and cokernel killed by 2. Consequently #E(K)_tors and #E(ℚ)_tors · #E^K(ℚ)_tors have the same odd part.

*Hypotheses and conventions.*

* K quadratic; torsion groups finite (Mordell–Weil).

*Proof outline.*

1. On a p-primary group with p odd, multiplication by 2 is invertible, so P = ½(P + σP) + ½(P − σP) splits E(K)[p^∞] into its ±1 eigenspaces; quadratic-point-maps identifies them.
2. At p = 2 use the same kernel and cokernel estimates as rank-splitting.

*Uses:* `BSD.1/quadratic-point-maps`, `tauceti:WeierstrassCurve.Affine.finite_torsion`, `mathlib:Submodule.torsionBy`.

*Sources:* jsw, §7.4.1, p. 47.

*Acceptance.*

* E = 11a1, K = ℚ(√−7): E(ℚ)_tors ≅ ℤ/5, and E(K)[5] = E(ℚ)[5] ⊕ E^K(ℚ)[5].


### `BSD.1/odd-selmer-sha-decomposition` — Odd-primary Selmer and Sha over a quadratic field (theorem) — planet *Odd-primary Selmer decomposition*

Let E/ℚ be elliptic, K quadratic and p an odd prime. Restriction and the twist isomorphism give isomorphisms Sel_{p^∞}(E/K) ≅ Sel_{p^∞}(E/ℚ) ⊕ Sel_{p^∞}(E^K/ℚ) and Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞] ⊕ Ш(E^K/ℚ)[p^∞], compatible with the Kummer maps and the decomposition of points.

*Hypotheses and conventions.*

* p odd; the Selmer and Sha groups are those of EllipticCurves Layer 7 (Selmer structures on E[p^∞] with the Kummer local conditions).

*Proof outline.*

1. Gal(K/ℚ) = {1, σ} has order prime to p, so restriction H¹(ℚ, M) → H¹(K, M)^{Gal(K/ℚ)} is an isomorphism for p-primary M (inflation–restriction, H^i(ℤ/2, ·) killed by 2).
2. H¹(K, E[p^∞]) splits into σ-eigenspaces; the +1 part is H¹(ℚ, E[p^∞]) and the −1 part is H¹(ℚ, E^K[p^∞]) since E^K[p^∞] ≅ E[p^∞] ⊗ χ_K.
3. Local conditions: at each place v of ℚ the same argument applies to ⊕_{w|v} H¹(K_w, ·) (semilocal Shapiro), and the Kummer images correspond.
4. Sha is the cokernel of the Kummer map on Selmer groups; combine with torsion-comparison and rank-splitting for the points.

*Uses:* `BSD.1/quadratic-point-maps`, `BSD.1/torsion-comparison`, `mathlib:groupCohomology`, `mathlib:groupCohomology.H1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology`.

*Sources:* jsw, §7.4.1, p. 47.

*Acceptance.*

* If rank E^K(ℚ) = 0 and Ш(E^K/ℚ)[p^∞] = 0 then Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞].


### `BSD.1/two-primary-comparison` — The 2-primary restriction and corestriction comparison (theorem)

For E/ℚ elliptic and K quadratic, the restriction maps res : Sel_{2^∞}(E/ℚ) ⊕ Sel_{2^∞}(E^K/ℚ) → Sel_{2^∞}(E/K) and the corestriction cor in the other direction satisfy cor ∘ res = 2 and res ∘ cor = 1 + σ. Hence ker(res) ⊆ H¹(Gal(K/ℚ), E(K)[2^∞]) ⊕ H¹(Gal(K/ℚ), E^K(K)[2^∞]) and the kernel and cokernel of res on Selmer and on Ш[2^∞] are finite groups killed by 2. No integral direct-sum decomposition at p = 2 is asserted.

*Hypotheses and conventions.*

* The 2-primary groups of EllipticCurves Layer 7; no hypothesis on E[2].

*Proof outline.*

1. cor ∘ res = multiplication by [K:ℚ] = 2 and res ∘ cor = norm in group cohomology (Tau Ceti's corestriction for profinite cohomology; Mathlib's group cohomology for the finite quotient).
2. The kernel of restriction is H¹(Gal(K/ℚ), (E[2^∞])^{G_K}) by inflation–restriction, finite as E(K)[2^∞] is finite, and killed by 2.
3. Cokernel: an element x of Sel(E/K) satisfies 2x = res(cor x) + (x − σx), and the σ-anti-invariant part comes from the twist; local conditions match as in odd-selmer-sha-decomposition, up to the same 2-torsion ambiguity.

*Uses:* `BSD.1/quadratic-point-maps`, `BSD.1/odd-selmer-sha-decomposition`, `mathlib:groupCohomology`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

*Sources:* jsw, §7.2, p. 42.

*Acceptance.*

* E = 11a1, K = ℚ(√−7): Sel₂ comparisons hold up to groups of exponent 2, and no statement about Ш[2] is made beyond this.


### `BSD.1/sha-finiteness-descent` — Finiteness of Sha descends along a finite extension (theorem) — planet *Descent of Sha finiteness*

Let E/ℚ be elliptic and K/ℚ a finite Galois extension. If Ш(E/K) is finite then Ш(E/ℚ) is finite. In particular, for K quadratic, finiteness of Ш(E/K) implies finiteness of Ш(E/ℚ) and of Ш(E^K/ℚ).

*Hypotheses and conventions.*

* K/ℚ finite Galois; Ш as in EllipticCurves Layer 7, for the whole group (all primes).

*Proof outline.*

1. The kernel of restriction Ш(E/ℚ) → Ш(E/K) lies in H¹(Gal(K/ℚ), E(K)) by inflation–restriction.
2. E(K) is finitely generated (Mordell–Weil) and Gal(K/ℚ) is finite, so H¹(Gal(K/ℚ), E(K)) is a finitely generated abelian group killed by [K:ℚ], hence finite.
3. So Ш(E/ℚ) is an extension of a subgroup of the finite Ш(E/K) by a finite group.
4. For E^K apply the same argument, since E^K ≅ E over K.

*Uses:* `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField`, `mathlib:groupCohomology`, `mathlib:groupCohomology.H1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

*Sources:* jsw, §1.2, p. 1.

*Acceptance.*

* If Ш(E/K) is finite for some imaginary quadratic K (from HE.7), then Ш(E/ℚ) is finite: this is the descent step of BSD.3 and BSD.4.


### `BSD.1/tamagawa-base-change` — Tamagawa factors under quadratic base change and twist (theorem) — planet *Tamagawa factors under base change*

Let E/ℚ be elliptic, K quadratic and p an odd prime with p unramified in K. For every rational prime ℓ ≠ p, ord_p ∏_{w | ℓ} c_w(E/K) = ord_p c_ℓ(E/ℚ) + ord_p c_ℓ(E^K/ℚ), where c_w(E/K) = [E(K_w) : E₀(K_w)]. If E has good reduction at p and p splits in K, the same holds at ℓ = p with all terms 0. Summing, ord_p ∏_w c_w(E/K) = ord_p (∏_ℓ c_ℓ(E/ℚ) · ∏_ℓ c_ℓ(E^K/ℚ)).

*Hypotheses and conventions.*

* p odd; Tamagawa numbers from Tate's algorithm (EllipticCurves Layer 4) and their identification with the Néron component groups (NeronModelsAndSemistableAbelianVarieties R11.6/equation-component-comparison).

*Proof outline.*

1. The p-part of c_w is the length of H¹(F_w, E[p^∞]^{I_w}) for w ∤ p (component groups and unramified cohomology, as in Skinner–Zhang Lemma 9.1).
2. ℓ split: E^K ≅ E over ℚ_ℓ = K_w for both w, so the two sides agree.
3. ℓ inert or ramified: with w the unique place above ℓ and p odd, restriction H¹(F_ℓ, E[p^∞]^{I_ℓ}) ⊕ H¹(F_ℓ, E^K[p^∞]^{I_ℓ}) → H¹(F_w, E[p^∞]^{I_w}) is an isomorphism (the ±1 eigenspaces of σ).
4. At ℓ = p with good reduction all Tamagawa factors are 1.

*Uses:* `BSD.1/odd-selmer-sha-decomposition`, `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

*Sources:* skinner-zhang, §9.1, Corollary 9.2, p. 29; jsw, §7.3.1, (7.3.a), p. 43.

*Acceptance.*

* E = 11a1 (c₁₁ = 5), K = ℚ(√−7) with 11 split: ∏_{w|11} c_w(E/K) = 25 = c₁₁(E)·c₁₁(E^K).


### `BSD.1/quadratic-period` — The period of E over an imaginary quadratic field and its comparison (construction)

For E/ℚ elliptic with Néron differential ω and K imaginary quadratic of discriminant D, the period of E/K is Ω_{E/K} := N_{K/ℚ}(𝔞_ω) · 2∫_{E(ℂ)} |ω ∧ ω̄|, where 𝔞_ω is the fractional ideal with 𝔞_ω·ω = Ω¹(Néron model of E over 𝓞_K). Comparison: Ω_{E/K} · |D|^{−1/2} and Ω_E · Ω_{E^K} (real periods with all real components) agree up to a power of 2 and the norm of the Néron-lattice change at primes dividing (D, N); when (D, 2N) = 1 the ideal 𝔞_ω is 𝓞_K and Ω_E·Ω_{E^K} = 2^e·|D|^{−1/2}·Ω_{E/K} with e ∈ ℤ determined by c∞(E), c∞(E^K) and the shape of the period lattice.

*Hypotheses and conventions.*

* K imaginary quadratic. The exact power of 2 is fixed in the proof from the real-component counts; the comparison at odd primes needs no such bookkeeping.

*Proof outline.*

1. Néron differentials: if ℓ ∤ 2D, the minimal model of E over ℤ_ℓ stays minimal over 𝓞_{K,w}, so 𝔞_ω is supported on primes dividing 2D (NeronModelsAndSemistableAbelianVarieties R11.6/semistable-differential-basechange and equation-minimal-differential).
2. The twist E^K has the Néron differential ω_{E^K} = u·√D^{−1}·ω over K for an explicit u ∈ ℤ[1/2D]^× from its minimal model.
3. Write the period lattice of ω as Λ_ω; ∫_{E(ℂ)}|ω∧ω̄| = 2·covol(Λ_ω), Ω_E = c∞(E)·(least positive real period) and Ω_{E^K} is the corresponding real period of √D^{−1}ω, i.e. |D|^{−1/2} times the least imaginary period of Λ_ω up to the index of Λ_ω^+ ⊕ Λ_ω^− in Λ_ω (1 or 2).
4. Combine: Ω_E Ω_{E^K} |D|^{1/2} = 2^e covol(Λ_ω), and Ω_{E/K} = 4 covol(Λ_ω) when 𝔞_ω = 𝓞_K.

*Uses:* `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-differential-basechange`, `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-minimal-differential`, `BSD.1/quadratic-point-maps`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

*Sources:* jsw, Conjecture 7.1.1, (7.1.b), p. 42; jsw, §7.3.2, (7.3.e), p. 44.

*Uses of the object.* JSW Conjecture 7.1.1(b): the period in the BSD formula over F = K. RankZeroOneBSD:BSD.5: the Gross–Zagier formula over K is converted into a statement about Ω_E Reg(E/ℚ) and L(E^K,1)/Ω_{E^K}. RankZeroOneBSD:BSD.6: the period relation (7.3.e) in the p-part arguments.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.quadraticPeriod` | constructor | Ω_{E/K} for K imaginary quadratic, as N(𝔞_ω)·2∫_{E(ℂ)}∣ω∧ω̄∣. |
| `WeierstrassCurve.quadraticPeriod_pos` | other | 0 < Ω_{E/K}. |
| `WeierstrassCurve.quadraticPeriod_eq_covolume` | characterisation | If 𝔞_ω = 𝓞_K then Ω_{E/K} = 4·covol(Λ_ω), Λ_ω the period lattice of the Néron differential. |
| `WeierstrassCurve.realPeriod_mul_twist_eq` | relation | Ω_E · Ω_{E^K} · ∣D∣^{1/2} = 2^e · Ω_{E/K} for (D, 2N) = 1, with e explicit. |
| `WeierstrassCurve.padicValRat_period_ratio` | compatibility | For p ∤ 2DN, the p-adic valuation of the rational number Ω_E Ω_{E^K}∣D∣^{1/2}/Ω_{E/K} is 0. |
| `WeierstrassCurve.quadraticPeriod_of_isogenous` | compatibility | Under a ℚ-isogeny of degree prime to p the ratio of periods over K is a p-adic unit. |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.quadraticPeriod_pos_test` | degenerate | Ω_{E/K} > 0 for every E/ℚ and K imaginary quadratic. |
| `WeierstrassCurve.period_ratio_rational` | characterisation | Ω_E Ω_{E^K}∣D∣^{1/2}/Ω_{E/K} ∈ ℚ^× and its odd part is 1 when (D, 2N) = 1. |
| `WeierstrassCurve.quadraticPeriod_not_square` | non-example | Ω_{E/K} ≠ Ω_E²: the complex period is not the square of the real period (for E = 11a1, K = ℚ(√−7) the ratio Ω_{E/K}/Ω_E² is irrational up to the factor Ω_{E^K}/Ω_E). |

*Acceptance.*

* Odd-part identity: for p ∤ 2DN, ord_p(Ω_E Ω_{E^K} |D|^{1/2}) = ord_p(Ω_{E/K}) in the sense of the rational ratio (JSW (7.3.e) up to ℤ_(p)^× multiples).


### `BSD.1/odd-part-bsd-over-K` — The BSD quotient over K versus over ℚ at odd primes (comparison)

Let E/ℚ be elliptic, K imaginary quadratic with (D_K, 2N) = 1, and p an odd prime unramified in K at which E has good reduction or p ∤ ∏c. Assume Ш(E/K)[p^∞], Ш(E/ℚ)[p^∞] and Ш(E^K/ℚ)[p^∞] are finite. Then the p-adic valuation of the quotient of the two sides of the BSD formula for E/K (JSW (7.1.a)) equals the sum of the p-adic valuations of the corresponding quotients for E/ℚ and E^K/ℚ. In particular the p-part of BSD for E/K is equivalent to the conjunction of the p-parts for E and E^K whenever one of them is known.

*Hypotheses and conventions.*

* p odd, p ∤ D_K; every ingredient is compared at p only, not integrally.

*Proof outline.*

1. L-values: L*(E/K,1) = L*(E,1)·L*(E^K,1) (BSD.0/base-change-central-identities).
2. Regulators: quadratic-regulator-comparison; the powers of 2 are p-adic units.
3. Periods: quadratic-period; |D_K|^{−1/2} in (7.1.a) cancels the |D|^{1/2} of the comparison.
4. Tamagawa factors: tamagawa-base-change. Torsion: torsion-comparison. Sha: odd-selmer-sha-decomposition.

*Uses:* `BSD.1/quadratic-regulator-comparison`, `BSD.1/quadratic-period`, `BSD.1/tamagawa-base-change`, `BSD.1/torsion-comparison`, `BSD.1/odd-selmer-sha-decomposition`, `BSD.0/base-change-central-identities`.

*Sources:* jsw, §7.1, p. 41.

*Acceptance.*

* Used with p ∤ 2N D_K in BSD.6: the p-part of BSD for E/K′ plus the rank-zero p-part for E^{K′} gives the p-part for E.


**Acceptance tests for BSD.1.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* For P ∈ E(ℚ), tr (res P) = 2P.
* ker(res + ι : E(ℚ) × E^K(ℚ) → E(K)) is a subgroup of E(ℚ)[2] × E^K(ℚ)[2].
* E = 37a1, K = ℚ(√−7): rank E(ℚ) = 1, and once rank E(K) = 1 is proved (BSD.3), rank E^K(ℚ) = 0.
* Rank one, r₋ = 0, a = 0: Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ).
* Rank zero over K: all regulators are 1 (regulator_eq_one_of_finrank_eq_zero).
* E = 11a1, K = ℚ(√−7): E(ℚ)_tors ≅ ℤ/5, and E(K)[5] = E(ℚ)[5] ⊕ E^K(ℚ)[5].


<a id="bsd-2"></a>
## BSD.2. Quadratic twists with prescribed local conditions and nonvanishing

BSD.2 produces the auxiliary imaginary quadratic fields. A root number alone proves no nonvanishing, and no density statement of Goldfeld type is assumed.

The genus-two metaplectic analysis is imported from MetaplecticAutomorphicForms MP.8 (the BFH twist series Z^±(u, s), its joint meromorphic continuation and its polar combination near (u, s) = (1/2, 2), and the nonvanishing of the local test values); MP.8 assigns to this layer the residues, positivity and noncancellation, the simultaneous local conditions and the infinitude of fundamental twists. The layer proves the Bump–Friedberg–Hoffstein theorem in both branches — a twist with nonzero central value when εD > 0, and a twist with a simple zero when εD < 0, with every prime of a prescribed finite set split — and its infinitude by enlarging the set. Friedberg–Hoffstein's Theorem B, which allows inert and ramified prescriptions (needed for JSW's K′ and K″ and for Castella's K), is used in the form JSW apply it; the paper was not available and is a recorded gap. The exported fields satisfy the Heegner hypothesis, have odd discriminant different from −3 and −4 (by making 2 and 3 split), and have the required nonvanishing, so that L(E/K, s) has a simple zero.

**Dependencies on other roadmaps:** `ClassicalArithmeticCompletion:CA.1`, `MetaplecticAutomorphicForms:MP.7`, `MetaplecticAutomorphicForms:MP.8`.

**Dependencies inside this roadmap:** BSD.0.


### `BSD.2/heegner-local-conditions` — Admissible discriminants with prescribed local conditions (definition) — planet *Heegner hypothesis*

Fix N ≥ 1 and a finite set S of primes with every ℓ | N in S, together with a local prescription π : S → {split, inert, ramified} and a sign η ∈ {±1}. A fundamental discriminant D is (S, π, η)-admissible if sign D = η and each ℓ ∈ S has the prescribed behaviour in ℚ(√D) (χ_D(ℓ) = 1, −1 or 0). The Heegner hypothesis for N is the prescription 'every ℓ | N splits'; the generalized Heegner hypothesis for a factorisation N = N⁺N⁻ with N⁻ squarefree is 'ℓ | N⁺ splits, ℓ | N⁻ inert'. The prescription is compatible with an elliptic curve E of conductor N and a target sign w ∈ {±1} if every admissible D coprime to N gives rootNumber E^{ℚ(√D)} = w (by twist-root-number this is a condition on η and on π at the primes dividing N).

*Hypotheses and conventions.*

* Only finitely many primes are prescribed.
* Fundamental discriminants as in Mathlib's Int.IsFundamentalDiscr.

*Proof outline.*

1. Admissibility is decidable: it is a finite list of Kronecker-symbol conditions (quadratic-field-character).
2. Compatibility: for (D, N) = 1, rootNumber E^D = χ_D(−N)·rootNumber E with χ_D(−N) = η·∏_{ℓ|N} χ_D(ℓ)^{v_ℓ(N)}, which is determined by η and π.
3. Nonemptiness: the conditions χ_D(ℓ) = ±1 at the finitely many ℓ ∈ S are congruence conditions on D modulo 8∏ℓ, and each residue class modulo it contains infinitely many fundamental discriminants of either sign (Dirichlet's theorem on primes in progressions, Mathlib PrimesInAP).

*Uses:* `BSD.0/quadratic-field-character`, `BSD.0/twist-root-number`, `mathlib:Int.IsFundamentalDiscr`, `ClassicalArithmeticCompletion:CA.1/kronecker-character`.

*Sources:* jsw, §7.4.1, p. 45; bfh90, Introduction, p. 543.

*Uses of the object.* RankZeroOneBSD:BSD.2/heegner-field-selection: selects K with the Heegner hypothesis and nonvanishing twist. JSW §7.4.1–7.4.2: the auxiliary fields K′ and K″ are given by generalized Heegner prescriptions with p split. Castella erratum Theorem 1.1: the field K with a Heegner ideal 𝔑, p split and conditions at 2 and at nonsplit q.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.LocalPrescription` | structure | A finite set S of primes, a map S → {split, inert, ramified} and a sign. |
| `TauCeti.BSD.LocalPrescription.Admissible` | constructor | The predicate on fundamental discriminants D: sign and Kronecker symbols at S as prescribed. |
| `TauCeti.BSD.LocalPrescription.heegner` | constructor | The Heegner prescription for N (all ℓ ∣ N split, sign −1). |
| `TauCeti.BSD.LocalPrescription.generalizedHeegner` | constructor | The generalized Heegner prescription for N = N⁺N⁻. |
| `TauCeti.BSD.LocalPrescription.admissible_decidable` | instance | Admissibility is decidable. |
| `TauCeti.BSD.LocalPrescription.rootNumber_twist_of_admissible` | relation | For admissible D with (D, N) = 1, rootNumber E^D = η·∏_{ℓ∣N} χ_D(ℓ)^{v_ℓ(N)}·rootNumber E. |
| `TauCeti.BSD.LocalPrescription.infinite_admissible` | other | If the prescription has no ramified entries, the set of admissible D is infinite (of either prescribed sign). |
| `TauCeti.BSD.LocalPrescription.mono` | functoriality | Enlarging S (with any prescription on the new primes) shrinks the admissible set. |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.BSD.LocalPrescription.heegner_11_neg7` | computation | D = −7 is admissible for the Heegner prescription of N = 11. |
| `TauCeti.BSD.LocalPrescription.heegner_11_neg3` | non-example | D = −3 is not admissible for the Heegner prescription of N = 11 (11 is inert in ℚ(√−3)). |
| `TauCeti.BSD.LocalPrescription.empty` | degenerate | With S = ∅ and η = −1 every negative fundamental discriminant is admissible. |
| `TauCeti.BSD.LocalPrescription.heegner_sign` | compatibility | For the Heegner prescription and (D, N) = 1, rootNumber E^D = −rootNumber E (BSD.0/twist-root-number). |

*Acceptance.*

* For N = 11 and S = {11}, D = −7 is admissible for 'split' (11 ≡ 4 = 2² mod 7), D = −3 is not (11 ≡ 2 mod 3 is a nonsquare).


### `BSD.2/twist-series-residue` — The polar term of the BFH twist series and its nonvanishing (theorem)

Let f ∈ S_k(Γ₀(M)) be a newform of even weight k with trivial character and sign ε, and take the arithmetic BFH datum (N, m) of MetaplecticAutomorphicForms MP.8 with m = N·rad(N), r = 1 and local test vectors at the primes of a finite set S chosen so that the coefficient L(s, D) of the series Z^±(u, s) vanishes unless D is admissible for 'every ℓ ∈ S splits'. Then, near (u, s) = (1/2, 2), the polar combination of MP.8/two-variable-polar-combination has a nonzero polar coefficient along the hyperplane carrying the central values L(k/2, f ⊗ χ_D) for ±D > 0 with εD > 0, and, along the hyperplane carrying the central derivatives L′(k/2, f ⊗ χ_D) for εD < 0, a nonzero coefficient after differentiation in s. Hence the Dirichlet series Σ_{D admissible, εD>0} L(k/2, f ⊗ χ_D)|D|^{−w} and Σ_{D admissible, εD<0} L′(k/2, f ⊗ χ_D)|D|^{−w} are not identically zero.

*Hypotheses and conventions.*

* f a newform of even weight with trivial character (k = 2 for elliptic curves).
* Test vectors and K-types as in MP.8/local-test-nonzero-f, -tau, -m.
* The identification L(s, D₀) = L_N(s + k/2 − 2, f ⊗ χ_{D₀})/L_N(2s + k − 4, Sym²f) of MP.8/bsd2-export.

*Proof outline.*

1. Import the jointly meromorphic polar combination A near (u, s) = (1/2, 2) and the permitted residue/derivative interchanges (MP.8/two-variable-polar-combination, MP.8/fourier-residue-interchanges).
2. Its polar coefficients are products of a nonzero Sym² ratio L(s, 0) (no zero of L_N(·, Sym² f) on the relevant line), the nonzero local test values TM, TM̃, Tτ (MP.8 local test nonzero nodes) and explicit powers of N, y₂.
3. Comparing with the Dirichlet-series expansion of Z^± (MP.8/two-variable-twist-series) and the fundamental-discriminant identification (MP.8/bsd2-export) shows that the coefficient attached to central values (respectively derivatives) is nonzero (BFH §9).
4. A Dirichlet series with eventually nonnegative or controlled coefficients whose continuation has a nonzero polar term cannot vanish identically.

*Uses:* `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`, `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`, `MetaplecticAutomorphicForms:MP.8/two-variable-twist-series`, `MetaplecticAutomorphicForms:MP.8/bsd2-export`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`, `MetaplecticAutomorphicForms:MP.7`, `BSD.2/heegner-local-conditions`.

*Sources:* bfh90, Introduction, p. 544; bfh90, Introduction, p. 544.

*Acceptance.*

* For f the newform of 37a1 (ε = −1) and S = {37}, the series over admissible D < 0 of L(1, f ⊗ χ_D)|D|^{−w} is not identically zero; every admissible D coprime to 37 has twisted sign +1 (BSD.0/twist-root-number), so no central value is forced to vanish.


### `BSD.2/bfh-nonvanishing` — Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein) (theorem) — planet *Bump–Friedberg–Hoffstein nonvanishing*

Let f be a cuspidal newform of even weight k with trivial character for Γ₀(M), S a finite set of primes containing all primes dividing M, and ε the sign of the functional equation of f. (i) There is a fundamental discriminant D with εD < 0 such that every prime in S splits in ℚ(√D) and L(s, f, χ_D) has a simple zero at s = k/2. (ii) There is a fundamental discriminant D with εD > 0 such that every prime in S splits in ℚ(√D) and L(k/2, f, χ_D) ≠ 0. Moreover in each case there are infinitely many such D.

*Hypotheses and conventions.*

* Every prime of S split; the sign of D is forced by ε through the twisted sign εχ_D(−M) (BSD.0/twist-root-number).
* Infinitely many: not stated in BFH's Theorem; proved here by enlarging S.

*Proof outline.*

1. Existence: twist-series-residue gives a nonzero Dirichlet series in w over admissible D whose coefficients are the central values (case (ii)) or derivatives (case (i)); some coefficient is nonzero.
2. In case (i), εD < 0 and every ℓ | M splits give sign −ε·ε = −1 for f ⊗ χ_D, so its order at k/2 is odd; a nonzero derivative means a simple zero.
3. Infinitely many: given admissible D₁, …, D_n, choose a prime q₁ dividing D₁ ⋯ D_n (or q₁ ∤ M arbitrary when n = 0) and apply existence with S ∪ {q₁}; the new D has q₁ split, so it differs from every D_i, all of which have q_1 ramified.

*Uses:* `BSD.2/twist-series-residue`, `BSD.2/heegner-local-conditions`, `BSD.0/twist-root-number`, `BSD.0/root-number-parity`.

*Sources:* bfh90, Theorem, pp. 543–544; bfh90, Theorem, p. 544.

*Acceptance.*

* For f attached to 11a1 (ε = +1), case (i) produces D < 0 with 11 split and L′(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (11 splits) whose twist has sign −1.
* For f attached to 37a1 (ε = −1), case (ii) produces D < 0 with 37 split and L(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (37 splits) whose twist has sign +1.


### `BSD.2/prescribed-local-conditions-value-branch` — Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein) (theorem)

Let f ∈ S₂(Γ₀(N)) be a newform with trivial character and (S, π, η) a local prescription (heegner-local-conditions) in which π may require primes to be split, inert or ramified, compatible with root number +1 for the twists: every admissible D coprime to N has w(f ⊗ χ_D) = +1. Then there are infinitely many admissible fundamental discriminants D with L(1, f ⊗ χ_D) ≠ 0.

*Hypotheses and conventions.*

* Compatibility with sign +1 is necessary: a twist of sign −1 has vanishing central value.
* The theorem is Friedberg–Hoffstein, Annals 142 (1995), Theorem B; the paper is not publicly available and was not read for this plan (recorded gap); the statement is taken in the form JSW applies it.

*Proof outline.*

1. Friedberg–Hoffstein construct the twist series with arbitrary local test data on the double cover of GL₂ (MetaplecticAutomorphicForms MP.7) instead of the genus-two Jacobi construction, and extract a nonzero residue as in twist-series-residue.
2. Infinitude by enlarging S as in bfh-nonvanishing.

*Uses:* `MetaplecticAutomorphicForms:MP.7`, `BSD.2/heegner-local-conditions`, `BSD.2/twist-series-residue`, `BSD.0/twist-root-number`.

*Sources:* jsw, §7.4.1, p. 45.

*Acceptance.*

* JSW §7.4.1: with N = q₁⋯q_r squarefree, the conditions (gen-H), q inert or ramified and p split are compatible with sign +1 for E^{D′} when ord L(E,s) = 1.


### `BSD.2/heegner-field-selection` — Choice of a Heegner field for analytic rank zero or one (theorem) — planet *Heegner field selection*

Let E/ℚ be elliptic of conductor N with analyticRank E ≤ 1, and let T be a finite set of primes. There are infinitely many imaginary quadratic fields K with discriminant D_K such that (a) every prime dividing N splits in K, (b) every prime in T splits in K, (c) D_K ∉ {−3, −4} and (D_K, 2N) = 1, and (d) analyticRank E^K = 1 − analyticRank E: if analyticRank E = 1 then ellipticL E^K 1 ≠ 0, and if analyticRank E = 0 then E^K has analytic rank one. For every such K, L(E/K, s) has a simple zero at s = 1.

*Hypotheses and conventions.*

* Applies to every E/ℚ, including CM and nonsemistable curves; the restrictions on K are discharged by the construction and are not hypotheses on E.

*Proof outline.*

1. Put S = {primes dividing 2N} ∪ T ∪ {3} and apply bfh-nonvanishing to f = F_E (k = 2, ε = rootNumber E = (−1)^{analyticRank E} by root-number-parity).
2. Rank one: ε = −1, case (ii) gives D with εD > 0, i.e. D < 0, every ℓ ∈ S split and L(1, f ⊗ χ_D) ≠ 0; E^K has newform f ⊗ χ_D (BSD.0/twist-l-series) so ellipticL E^K 1 ≠ 0.
3. Rank zero: ε = +1, case (i) gives D < 0 with a simple zero of L(s, f ⊗ χ_D), i.e. analyticRank E^K = 1.
4. 2 split forces D ≡ 1 mod 8, so D is odd and D ≠ −4; 3 split forces D ≢ 0, 2 mod 3, so D ≠ −3; ℓ | N split forces (D, N) = 1.
5. BSD.0/base-change-central-identities gives the simple zero of L(E/K, s).

*Uses:* `BSD.2/bfh-nonvanishing`, `BSD.2/heegner-local-conditions`, `BSD.0/root-number-parity`, `BSD.0/twist-l-series`, `BSD.0/base-change-central-identities`, `BSD.0/analytic-rank`.

*Sources:* bfh90, Introduction, p. 544.

*Acceptance.*

* E = 37a1 (rank one): ℚ(√−7) satisfies the Heegner hypothesis (37 and 2 split) but 3 is inert in it, so it is excluded once 3 ∈ S; the fields produced have D ≡ 1 mod 24 with 37 split.
* Every K produced has D_K odd, so the Heegner points of BSD.3 are defined with u_K = 1.


### `BSD.2/auxiliary-fields-for-prime-parts` — Simultaneous choice of the auxiliary fields of the prime-part arguments (theorem)

Let E/ℚ be semistable of conductor N with analyticRank E = 1, p an odd prime of good reduction with E[p] irreducible, and q ∥ N a prime at which E[p] is ramified. (a) There are infinitely many imaginary quadratic K′ with (gen-H) for N = N⁺N⁻, q inert or ramified, p split, and ellipticL E^{K′} 1 ≠ 0. (b) There are infinitely many imaginary quadratic K″ with the primes of N⁺ split, those of N⁻ inert (N⁺ = q, N⁻ = N/q if the number of prime factors of N is odd; N⁺ = 1 otherwise), p split and ellipticL E^{K″} 1 ≠ 0. (c) For E with multiplicative reduction at p > 3 and a nonsplit multiplicative q ≠ p at which E[p] ramifies, there are infinitely many K satisfying the hypotheses of Castella's corrected Theorem 1.1: a Heegner ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N, p split, 2 ∥ N if 2 is nonsplit, every q ∥ N nonsplit in K of nonsplit multiplicative reduction with at least one residually ramified, and ellipticL E^K 1 ≠ 0 whenever analyticRank E = 1.

*Hypotheses and conventions.*

* Hypotheses as in JSW §7.4 and the Castella erratum; each list is a finite set of local conditions compatible with root number +1 for the twist.

*Proof outline.*

1. Each set of conditions is a local prescription (heegner-local-conditions) with finitely many primes.
2. Root numbers: w(E/K) = −1 for these K (sign −1 under (gen-H) with N⁻ having an even number of prime factors, resp. under (H)), and w(E) = −1, so w(E^K) = +1 by BSD.0/base-change-central-identities.
3. Apply prescribed-local-conditions-value-branch to the newform of E.

*Uses:* `BSD.2/prescribed-local-conditions-value-branch`, `BSD.2/heegner-local-conditions`, `BSD.0/base-change-central-identities`, `BSD.0/twist-root-number`.

*Sources:* jsw, §7.4.2, p. 47; castella-erratum, Theorem 1.1, p. 1.

*Acceptance.*

* JSW §7.4.1 and §7.4.2: both K′ and K″ exist for every E in Theorem 1.2.1.


**Acceptance tests for BSD.2.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* For N = 11 and S = {11}, D = −7 is admissible for 'split' (11 ≡ 4 = 2² mod 7), D = −3 is not (11 ≡ 2 mod 3 is a nonsquare).
* For f the newform of 37a1 (ε = −1) and S = {37}, the series over admissible D < 0 of L(1, f ⊗ χ_D)|D|^{−w} is not identically zero; every admissible D coprime to 37 has twisted sign +1 (BSD.0/twist-root-number), so no central value is forced to vanish.
* For f attached to 11a1 (ε = +1), case (i) produces D < 0 with 11 split and L′(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (11 splits) whose twist has sign −1.
* For f attached to 37a1 (ε = −1), case (ii) produces D < 0 with 37 split and L(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (37 splits) whose twist has sign +1.
* JSW §7.4.1: with N = q₁⋯q_r squarefree, the conditions (gen-H), q inert or ramified and p split are compatible with sign +1 for E^{D′} when ord L(E,s) = 1.
* E = 37a1 (rank one): ℚ(√−7) satisfies the Heegner hypothesis (37 and 2 split) but 3 is inert in it, so it is excluded once 3 ∈ S; the fields produced have D ≡ 1 mod 24 with 37 split.


<a id="bsd-3"></a>
## BSD.3. Analytic rank one implies rank one and finite Sha

BSD.3 proves the analytic-rank-one theorem for every E/ℚ, including CM and nonsemistable curves. A field K from BSD.2 gives L(E/K, s) a simple zero; the Gross–Zagier height formula (GZ.8) shows that the Heegner point y_K has infinite order; Kolyvagin's theorem in the form HE.7/classical-full-sha-finiteness gives rank E(K) = 1 and Ш(E/K) finite. The sign of complex conjugation on y_K is −w_E (Gross, Proposition 5.4), and w_E = −1 by parity, so the trace of y_K is a point of infinite order in E(ℚ); rank splitting then forces rank E(ℚ) = 1 and rank E^K(ℚ) = 0 without any appeal to the theorem for E^K, and Ш(E/ℚ) is finite by descent.

**Dependencies on other roadmaps:** `EllipticCurveModularity:R29.5`, `GrossZagierAndArithmeticHeights:GZ.8`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`, `HeegnerPointEulerSystems:HE.4`, `HeegnerPointEulerSystems:HE.7`.

**Dependencies inside this roadmap:** BSD.0, BSD.1, BSD.2.


### `BSD.3/heegner-point-nontorsion` — A nonzero derivative over K gives a non-torsion Heegner point (theorem) — planet *Non-torsion Heegner point*

Let E/ℚ be elliptic of conductor N with a modular parametrisation φ : X₀(N) → E sending ∞ to O (EllipticCurveModularity R29.5), K imaginary quadratic of odd discriminant D_K with every prime dividing N split, and y_K = Tr_{H_K/K} φ(x₁) ∈ E(K) the Heegner point (HeegnerPointEulerSystems HE.1). If the continuation of L(E/K, s) = ellipticL E · ellipticL E^K has nonzero derivative at s = 1, then y_K has infinite order; conversely if y_K has infinite order then L′(E/K, 1) > 0.

*Hypotheses and conventions.*

* Heegner hypothesis and D_K odd (Gross–Zagier's standing hypotheses; CST's version allows the general case).
* L(E/K, s) is the continuation of BSD.0/base-change-factorization, so the derivative is that of the product.

*Proof outline.*

1. Gross–Zagier: L′(E/K, 1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with ‖ω₀‖² > 0, C the Manin constant of φ (GZ.8/elliptic-curve-heegner-height-formula); the L-function there is the Rankin L-series of F_E with the trivial class character, which is L(E/K, s) by BSD.0/base-change-factorization and BSD.0/rational-newform-bridge.
2. If L′(E/K, 1) ≠ 0 then ĥ_K(y_K) ≠ 0; a torsion point has canonical height 0, so y_K has infinite order.
3. Conversely a point of infinite order has positive canonical height (isOfFinAddOrder_of_canonicalHeight_eq_zero and nonnegativity), so L′(E/K, 1) > 0.

*Uses:* `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `BSD.0/base-change-factorization`, `BSD.0/rational-newform-bridge`, `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`.

*Sources:* gross-zagier-86, Chapter V §2, Theorem (2.1), p. 311; jsw, §7.4.1, p. 46.

*Acceptance.*

* E = 37a1, K with D_K ≡ 1 mod 24 from BSD.2/heegner-field-selection: y_K has infinite order, and lies in res E(ℚ) up to torsion (heegner-point-eigenspace).


### `BSD.3/heegner-point-eigenspace` — Complex conjugation on the Heegner point selects the rational or the twisted part (theorem)

In the setting of heegner-point-nontorsion, let σ be complex conjugation (the nontrivial automorphism of K). Then σ(y_K) = −rootNumber(E)·y_K + t for a torsion point t ∈ E(K)_tors. Consequently, if y_K has infinite order: when rootNumber E = −1, tr(y_K) ∈ E(ℚ) has infinite order (so rank E(ℚ) ≥ 1); when rootNumber E = +1, the point y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order (so rank E^K(ℚ) ≥ 1).

*Hypotheses and conventions.*

* Gross's normalisation of the parametrisation (Gross §5, Proposition 5.3 with n = 1, traced from K₁ to K); t comes from the Fricke translate of the cusp ∞ and is torsion by Manin–Drinfeld (HE.1/parameter-choice-and-degree).

*Proof outline.*

1. σ maps x₁ to w_N(x₁)^{[𝔫]}, a Galois conjugate of the Fricke translate (HE.0/dihedral-conjugation).
2. φ ∘ w_N = −ε_N·φ + φ(w_N(∞)) with ε_N the Fricke eigenvalue on F_E and φ(w_N(∞)) torsion; summing over Gal(H_K/K) gives σ y_K = ε_N y_K + t.
3. rootNumber E = −ε_N (BSD.0/completed-l-function), so σ y_K = −w y_K + t (the n = 1 case of HE.4/complex-conjugation-parity).
4. If w = −1, res(tr y_K) = y_K + σ y_K = 2y_K + t, of infinite order; if w = +1, y_K − σ y_K = 2y_K − t is anti-invariant, hence in range ι (BSD.1/quadratic-point-maps).

*Uses:* `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `BSD.0/completed-l-function`, `BSD.1/quadratic-point-maps`, `BSD.3/heegner-point-nontorsion`.

*Sources:* gross-kolyvagin, §5, Proposition 5.3, p. 243 (read from the page image); gross-kolyvagin, §5, (5.2) and the sentence after it, p. 243.

*Acceptance.*

* E = 37a1 (w = −1): y_K is, up to torsion, a nonzero multiple of the generator (0, 0) of E(ℚ).


### `BSD.3/analytic-rank-one-theorem` — Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin) (theorem) — planet *Gross–Zagier–Kolyvagin rank-one theorem*

For every elliptic curve E/ℚ with analyticRank E = 1: Module.finrank ℤ (E(ℚ)/tors) = 1 and Ш(E/ℚ) is finite. No further hypothesis is placed on E: CM curves, nonsemistable curves and curves with exceptional primes are included.

*Hypotheses and conventions.*

* E/ℚ elliptic with analyticRank E = 1 (BSD.0).

*Proof outline.*

1. Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, ellipticL E^K 1 ≠ 0, so L(E/K, s) has a simple zero (BSD.0/base-change-central-identities (a)).
2. heegner-point-nontorsion: y_K has infinite order.
3. HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) is finite (Kolyvagin, with the CM and p = 2 cases included).
4. rootNumber E = −1 (BSD.0/root-number-parity), so heegner-point-eigenspace gives rank E(ℚ) ≥ 1; BSD.1/rank-splitting gives rank E(ℚ) + rank E^K(ℚ) = 1, hence rank E(ℚ) = 1 and rank E^K(ℚ) = 0. No appeal to this theorem for E^K is made.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

*Uses:* `BSD.2/heegner-field-selection`, `BSD.0/base-change-central-identities`, `BSD.0/root-number-parity`, `BSD.3/heegner-point-nontorsion`, `BSD.3/heegner-point-eigenspace`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `BSD.1/rank-splitting`, `BSD.1/sha-finiteness-descent`, `BSD.0/analytic-rank`.

*Sources:* jsw, §1.2, p. 1; burungale-tian, §1.0.1, p. 1.

*Acceptance.*

* E = 37a1: rank 1 and Ш(E/ℚ) finite (indeed trivial, a statement for BSD.8/BSD.9).
* The same argument gives rank E^K(ℚ) = 0 and finite Ш(E^K/ℚ) for the auxiliary K.


**Acceptance tests for BSD.3.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* E = 37a1, K with D_K ≡ 1 mod 24 from BSD.2/heegner-field-selection: y_K has infinite order, and lies in res E(ℚ) up to torsion (heegner-point-eigenspace).
* E = 37a1 (w = −1): y_K is, up to torsion, a nonzero multiple of the generator (0, 0) of E(ℚ).
* E = 37a1: rank 1 and Ш(E/ℚ) finite (indeed trivial, a statement for BSD.8/BSD.9).
* The same argument gives rank E^K(ℚ) = 0 and finite Ш(E^K/ℚ) for the auxiliary K.


<a id="bsd-4"></a>
## BSD.4. Analytic rank zero implies rank zero and finite Sha

BSD.4 proves the analytic-rank-zero theorem by the same mechanism with the opposite sign: K is chosen with L(E^K, s) having a simple zero, y_K has infinite order, and since w_E = +1 the Heegner point lies in the twisted eigenspace, so rank E^K(ℚ) ≥ 1 and rank E(ℚ) = 0. The direct sign calculation replaces any appeal to BSD.3 for the twist. The layer also plans Kato's independent route (finiteness of E(ℚ) and of Ш(E/ℚ) from the Beilinson–Kato Euler system and the nonvanishing of L(E, 1), Kato Theorem 14.2(2)), Kato's p-adic upper bound for Ш at odd good or multiplicative primes with E[p] irreducible (JSW Theorem 7.2.1(i)), the comparison of the two routes, and the combined theorem for analytic rank at most one with separate rank and finiteness conclusions.

**Dependencies on other roadmaps:** `EllipticCurveModularity:R29.4`, `EulerSystemsAndKolyvaginSystems:ES.4`, `GrossZagierAndArithmeticHeights:GZ.3`, `HeegnerPointEulerSystems:HE.6`, `HeegnerPointEulerSystems:HE.7`, `KatoEulerSystems:L3`, `KatoEulerSystems:L4`, `tauceti:TauCetiRoadmap`.

**Dependencies inside this roadmap:** BSD.0, BSD.1, BSD.2, BSD.3, BSD.5, BSD.6.


### `BSD.4/analytic-rank-zero-theorem` — Analytic rank zero implies rank zero and finite Sha (Kolyvagin) (theorem) — planet *Kolyvagin's rank-zero theorem*

For every elliptic curve E/ℚ with ellipticL E 1 ≠ 0 (analyticRank E = 0): E(ℚ) is finite and Ш(E/ℚ) is finite. No further hypothesis is placed on E.

*Hypotheses and conventions.*

* E/ℚ elliptic with analyticRank E = 0.

*Proof outline.*

1. rootNumber E = +1 (BSD.0/root-number-parity). Choose K by BSD.2/heegner-field-selection: Heegner hypothesis, D_K ∉ {−3, −4} odd, and analyticRank E^K = 1, so L(E/K, s) has a simple zero with L′(E/K, 1) = L(E, 1)L′(E^K, 1) ≠ 0 (BSD.0/base-change-central-identities (b)).
2. BSD.3/heegner-point-nontorsion: y_K has infinite order; HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) finite.
3. BSD.3/heegner-point-eigenspace with rootNumber E = +1: y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order, so rank E^K(ℚ) ≥ 1.
4. BSD.1/rank-splitting: rank E(ℚ) + rank E^K(ℚ) = 1, so rank E(ℚ) = 0 and E(ℚ) is finite. The sign calculation is direct: BSD.3 is not applied to E^K.
5. BSD.1/sha-finiteness-descent: Ш(E/ℚ) is finite.

*Uses:* `BSD.2/heegner-field-selection`, `BSD.0/base-change-central-identities`, `BSD.0/root-number-parity`, `BSD.3/heegner-point-nontorsion`, `BSD.3/heegner-point-eigenspace`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `BSD.1/rank-splitting`, `BSD.1/sha-finiteness-descent`, `BSD.0/analytic-rank`.

*Sources:* bfh90, Introduction, p. 544.

*Acceptance.*

* E = 11a1: E(ℚ) ≅ ℤ/5 and Ш(E/ℚ) finite.
* The argument also yields rank E^K(ℚ) = 1 and Ш(E^K/ℚ) finite for the auxiliary field.


### `BSD.4/kato-rank-zero-finiteness` — The Beilinson–Kato route to finiteness in analytic rank zero (theorem)

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0, and f = F_E. For every prime p and every G_ℚ-stable lattice T ⊂ V_p(E), Kato's Bloch–Kato Selmer group Sel(ℚ, T) ⊂ H¹(ℚ, T ⊗ ℚ/ℤ) is finite, and Sel(ℚ, T) = 0 for all but finitely many p. Consequently E(ℚ) is finite and Ш(E/ℚ) is finite, and Ш(E/ℚ)[p^∞] = 0 for all but finitely many p. This route uses the Beilinson–Kato Euler system, its explicit reciprocity law and the nonvanishing of L(E, 1); it uses no Heegner point, no primitivity of Kato's classes and no main conjecture.

*Hypotheses and conventions.*

* Kato, Theorem 14.2(2) with K = ℚ, χ trivial, k = 2, r = k/2 = 1, so V_{F_λ}(f)(1) ≅ V_p(E) by EllipticCurveModularity R29.4/tate-module-comparison.
* The identification of Kato's Sel(ℚ, T_p E) with Sel_{p^∞}(E/ℚ) of EllipticCurves Layer 7: Bloch–Kato's H¹_f at p is the Kummer image (finite flat or Tate-curve local condition).

*Proof outline.*

1. KatoEulerSystems L3: the zeta class z_γ interpolates L(f, 1) through the dual exponential, so its localisation at p is nonzero when L(f, 1) ≠ 0.
2. KatoEulerSystems L4 and EulerSystemsAndKolyvaginSystems ES.4: the Euler-system bound kills the Selmer group up to the index of the bottom class, which is finite.
3. For almost all p the image of G_ℚ contains SL₂(ℤ_p) (or the CM Cartan analogue) and the bottom class is a unit multiple, giving vanishing.
4. Sel(E/ℚ) = ⊕_p Sel(ℚ, T_p E) (Kato §14.1) is then finite, so E(ℚ) ⊗ ℚ_p/ℤ_p and Ш(E/ℚ) are finite.

*Uses:* `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EllipticCurveModularity:R29.4/tate-module-comparison`, `BSD.0/analytic-rank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

*Sources:* kato, Theorem 14.2(2), p. 234; kato, §14.1, p. 235.

*Acceptance.*

* Agrees with analytic-rank-zero-theorem on every E; for E = 11a1 both give E(ℚ) finite and Ш(E/ℚ) finite.


### `BSD.4/kato-p-part-upper-bound` — Kato's upper bound for the p-part of Sha in analytic rank zero (theorem)

Let E/ℚ be elliptic with good or multiplicative reduction at an odd prime p, E[p] irreducible, and ellipticL E 1 ≠ 0. Then ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L(E, 1)/(Ω_E · ∏_ℓ c_ℓ(E))), where L(E, 1)/Ω_E ∈ ℚ^× by BSD.5/rank-zero-rationality.

*Hypotheses and conventions.*

* p odd, good or multiplicative reduction at p, E[p] irreducible (so E(ℚ)[p] = 0 and the torsion term is a p-adic unit).
* Ω_E is the full real period of EllipticCurves Layer 7.

*Proof outline.*

1. Cyclotomic Iwasawa theory: Kato's divisibility char X(T) ⊇ (L_p(f)) up to the exceptional configuration (KatoEulerSystems L4/ordinary-selmer-divisibility in the ordinary case; the signed/integral variants for supersingular p via BSD.6a).
2. Control at the trivial character: specialising at γ − 1 relates the characteristic ideal to #Sel_{p^∞}(E/ℚ)·∏ c_ℓ and the Euler factor at p, and L_p(f)(1) to (1 − 1/α)² L(E,1)/Ω_E (BSD.6/cyclotomic-specialization-formula).
3. Period comparison Ω_E = −2πi Ω_f^+ up to ℤ_(p)^× (needs p-integrality of the Manin constant, requested from GZ.3).

*Uses:* `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `BSD.6/cyclotomic-specialization-formula`, `BSD.5/rank-zero-rationality`, `GrossZagierAndArithmeticHeights:GZ.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

*Sources:* jsw, Theorem 7.2.1(i), p. 42.

*Acceptance.*

* E = 11a1, p = 3: ord₃(L(E,1)/(Ω_E c₁₁)) = ord₃(1/25) = 0, so Ш(E/ℚ)[3^∞] = 0.


### `BSD.4/analytic-rank-at-most-one-theorem` — Analytic rank at most one: rank equals analytic rank and Sha is finite (theorem) — planet *Analytic rank at most one theorem*

For every elliptic curve E/ℚ with analyticRank E ≤ 1: Module.finrank ℤ (E(ℚ)/tors) = analyticRank E and Ш(E/ℚ) is finite. The separate conclusions (rank equality; finiteness of the whole of Ш) are exported as distinct declarations.

*Hypotheses and conventions.*

* E/ℚ elliptic, analyticRank E ≤ 1; no hypothesis on reduction, CM or residual representations.

*Proof outline.*

1. analyticRank E = 0: analytic-rank-zero-theorem.
2. analyticRank E = 1: BSD.3/analytic-rank-one-theorem.

*Uses:* `BSD.4/analytic-rank-zero-theorem`, `BSD.3/analytic-rank-one-theorem`.

*Sources:* burungale-tian, §1.0.1, p. 1.

*Acceptance.*

* 11a1: rank 0 = analytic rank; 37a1: rank 1 = analytic rank; both with finite Ш.


### `BSD.4/kato-heegner-comparison` — The Kato and Heegner routes in analytic rank zero compared (comparison)

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0. (a) Both analytic-rank-zero-theorem (Heegner points on an auxiliary E^K, Kolyvagin over K) and kato-rank-zero-finiteness (Beilinson–Kato elements over ℚ) prove that E(ℚ) and Ш(E/ℚ) are finite, and both prove Ш(E/ℚ)[p^∞] = 0 for all p outside a finite set. (b) At an odd prime p of good or multiplicative reduction with E[p] irreducible, the Kato route gives the explicit bound ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p(L(E,1)/(Ω_E ∏c_ℓ)) (kato-p-part-upper-bound), whereas the Heegner route bounds #Ш(E/K)[p^∞] by the square of the Heegner index of the auxiliary twist, which is not a bound in terms of L(E,1). (c) Neither route uses a main conjecture or the primitivity of an Euler system; the equality of p-parts needs the main-conjecture inputs of BSD.6.

*Hypotheses and conventions.*

* As in the two theorems compared.

*Proof outline.*

1. (a) is the conjunction of the two theorems' conclusions; the finite exceptional sets are the primes where the Kolyvagin (HE.7/almost-all-primary-sha-vanishing) or Kato (large-image) arguments lose control.
2. (b) compares kato-p-part-upper-bound with HE.6/sha-square-index-bound applied to E^K and BSD.1/odd-selmer-sha-decomposition.
3. (c) records the inputs of each proof.

*Uses:* `BSD.4/analytic-rank-zero-theorem`, `BSD.4/kato-rank-zero-finiteness`, `BSD.4/kato-p-part-upper-bound`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `BSD.1/odd-selmer-sha-decomposition`.

*Sources:* jsw, §7.2, p. 42.

*Acceptance.*

* 11a1: both routes give E(ℚ) finite and Ш(E/ℚ) finite; at p = 3 the Kato bound already gives Ш(E/ℚ)[3^∞] = 0.


**Acceptance tests for BSD.4.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* E = 11a1: E(ℚ) ≅ ℤ/5 and Ш(E/ℚ) finite.
* The argument also yields rank E^K(ℚ) = 1 and Ш(E^K/ℚ) finite for the auxiliary field.
* Agrees with analytic-rank-zero-theorem on every E; for E = 11a1 both give E(ℚ) finite and Ш(E/ℚ) finite.
* E = 11a1, p = 3: ord₃(L(E,1)/(Ω_E c₁₁)) = ord₃(1/25) = 0, so Ш(E/ℚ)[3^∞] = 0.
* 11a1: rank 0 = analytic rank; 37a1: rank 1 = analytic rank; both with finite Ш.
* 11a1: both routes give E(ℚ) finite and Ш(E/ℚ) finite; at p = 3 the Kato bound already gives Ш(E/ℚ)[3^∞] = 0.


<a id="bsd-5"></a>
## BSD.5. Rational leading-term quotient and Heegner index formula

BSD.5 makes the leading term a positive rational multiple of Ω_E Reg_BSD and defines the rational BSD defect. Rank-zero rationality comes from modular symbols (ModularSymbolsPadicLFunctions L1) and the comparison of Ω_E with the modular-symbol period; rank-one rationality from the Gross–Zagier formula over a field K with L(E^K, 1) ≠ 0, the index–height formula and the period comparison of BSD.1 (Gross–Zagier, Theorem 7.3). Positivity needs nonnegativity of central values (Waldspurger), requested from GZ.5 as RT-AREA-iwasawa-1/16 asks, together with the sign of the Gross–Zagier formula.

The Heegner index I_K = [E(K) : ℤy_K] (including torsion) and its free version are defined; the height of y_K is I_free² Reg(E/K). Gross–Zagier's Conjecture (2.2), I_K = c·m·u_K·#Ш(E/K)^{1/2}, is proved equivalent, at odd primes prime to D_K, to the p-part of BSD over K; Kolyvagin's index bound gives only one inequality. The Ribet–Takahashi comparison of modular degrees on X₀(N) and on Shimura curves, and the definite congruence-period identity of Pollack–Weston requested early by HeegnerPointEulerSystems HE.6, are planned here; the latter is the proposed sub-layer BSD.3a. The rational BSD defect d_E = L*(E,1)·#E(ℚ)²_tors/(Ω_E Reg_BSD #Ш ∏c_ℓ) is a positive rational number, isogeny invariant by composing Cassels' theorem and the equality of L-functions (both EllipticCurves Layer 7), with the valuation formula that turns every prime-part theorem into padicValRat p d_E = 0. This is the interface part 2's BSD.8 requests.

**Dependencies on other roadmaps:** `EllipticCurveModularity:R29.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GrossZagierAndArithmeticHeights:GZ.0`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.5`, `GrossZagierAndArithmeticHeights:GZ.8`, `HeegnerPointEulerSystems:HE.1`, `HeegnerPointEulerSystems:HE.6`, `HeegnerPointEulerSystems:HE.7`, `ModularSymbolsPadicLFunctions:L1`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `tauceti:TauCetiRoadmap`.

**Dependencies inside this roadmap:** BSD.0, BSD.1, BSD.2, BSD.3, BSD.3a, BSD.4.


### `BSD.5/rank-zero-rationality` — Rationality of L(E,1)/Ω_E (theorem)

For every elliptic curve E/ℚ, ellipticL E 1 / Ω_E ∈ ℚ, where Ω_E is the full real period of the global minimal model (EllipticCurves Layer 7, the integral 2∫_{D_W>0} dx/√D_W). If L(E,1) ≠ 0 the quotient is a nonzero rational number whose denominator divides 2·c_E·#E(ℚ)_tors·n for an explicit integer n depending only on the Manin–Drinfeld order of the cusp 0, c_E the Manin constant of the optimal parametrisation.

*Hypotheses and conventions.*

* E/ℚ elliptic; the Manin constant enters through the comparison of Ω_E with the modular-symbol period Ω_f^+.

*Proof outline.*

1. Modular symbols: L(f, 1) = −2πi ∫_0^{i∞} f(z)dz = Ω_f^+ · ½T(φ^+) with T(φ^+) ∈ ℚ (MSPL L1/critical-value-algebraicity with k = 0, j = 0, χ = 1, f = F_E, coefficient field ℚ).
2. Period comparison: φ_E^* ω_E = c·2πi F_E dz (EllipticCurveModularity R29.5/modular-parametrisation); the image of H₁(X₀(N), ℤ)^+ under ∫ φ_E^*ω_E is a sublattice of the real period lattice of E of finite index, so −2πiΩ_f^+(φ^+) ∈ ℚ^× · Ω_E⁰ for an integral generator φ^+ (MSPL L1/integral-period-lattices).
3. Ω_E = c∞ Ω_E⁰ (GZ.0/real-period-components), with c∞ ∈ {1, 2}.
4. Combine with BSD.0/rational-newform-bridge (L(E, s) = L(F_E, s)).

*Uses:* `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`, `ModularSymbolsPadicLFunctions:L1/period-lines`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `BSD.0/rational-newform-bridge`, `BSD.0/analytic-rank`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `GrossZagierAndArithmeticHeights:GZ.3`.

*Sources:* jsw, Theorem 7.2.1(i), p. 42; jsw, §7.3.2, (7.3.b), p. 44.

*Acceptance.*

* E = 11a1: L(E,1)/Ω_E = 1/5.
* E = 37a1: L(E,1)/Ω_E = 0 (rank one).


### `BSD.5/leading-term-positivity` — Positivity of the leading term in analytic rank at most one (theorem) — planet *Positivity of the leading term*

For every elliptic curve E/ℚ with analyticRank E ≤ 1, leadingTerm E > 0: L(E, 1) > 0 if the analytic rank is 0, and L′(E, 1) > 0 if it is 1. Positivity rests on the nonnegativity of central values L(1/2, π ⊗ χ) ≥ 0 for cuspidal π on PGL₂/ℚ and quadratic χ (Waldspurger), requested from GrossZagierAndArithmeticHeights GZ.5, together with the sign of the Gross–Zagier formula.

*Hypotheses and conventions.*

* analyticRank E ≤ 1.
* The nonnegativity input is RT-AREA-iwasawa-1/16's missing statement; modular symbols give only rationality, not sign.

*Proof outline.*

1. Rank zero: L(E, 1) = L(1/2, π_E) ≥ 0 by the requested Waldspurger nonnegativity (χ trivial), and L(E,1) ≠ 0.
2. Rank one: choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0; then L′(E/K, 1) = L′(E, 1)L(E^K, 1) (BSD.0/base-change-central-identities) and L′(E/K, 1) > 0 because y_K has infinite order (BSD.3/heegner-point-nontorsion, converse direction).
3. L(E^K, 1) > 0 by the rank-zero case applied to E^K, so L′(E, 1) > 0.

*Uses:* `GrossZagierAndArithmeticHeights:GZ.5`, `GrossZagierAndArithmeticHeights:GZ.8/derivative-corollaries`, `BSD.2/heegner-field-selection`, `BSD.0/base-change-central-identities`, `BSD.3/heegner-point-nontorsion`, `BSD.0/analytic-rank`.

*Sources:* gross-zagier-86, Chapter V §1, Corollary (1.1), pp. 308–309 (excerpt as verified by GZ.8).

*Acceptance.*

* L(11a1, 1) = 0.2538… > 0 and L′(37a1, 1) = 0.3059… > 0 (numerical values for orientation; certification is BSD.9's).


### `BSD.5/rank-one-rationality` — Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one (theorem) — planet *Rationality of L′(E,1)/ΩReg*

For every elliptic curve E/ℚ with analyticRank E = 1, L′(E, 1)/(Ω_E · Reg_BSD(E/ℚ)) ∈ ℚ_{>0}, where Reg_BSD is GZ.0's regulator in the x-height normalisation (twice Tau Ceti's regulator in rank one).

*Hypotheses and conventions.*

* analyticRank E = 1 (so rank E(ℚ) = 1 by BSD.3/analytic-rank-one-theorem).
* Normalisation: GZ.0/height-convention-dictionary; with Tau Ceti's regulator the quotient changes by the factor 2.

*Proof outline.*

1. Choose K by BSD.2/heegner-field-selection with L(E^K, 1) ≠ 0 and D_K odd.
2. Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula): L′(E,1)·L(E^K,1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with C, u_K ∈ ℤ_{>0}.
3. heegner-index-height-formula: ĥ_K(y_K) = I_K² · 2 · Reg_BSD(E/ℚ)/4^a.
4. BSD.1/quadratic-period: ‖ω₀‖²/|D_K|^{1/2} = r·Ω_E·Ω_{E^K} with r ∈ ℚ^× (a power of 2 when (D_K, 2N) = 1).
5. rank-zero-rationality for E^K: L(E^K, 1)/Ω_{E^K} ∈ ℚ^×. Dividing gives L′(E,1)/(Ω_E Reg_BSD) ∈ ℚ^×, positive by leading-term-positivity.

*Uses:* `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `BSD.5/heegner-index-height-formula`, `BSD.1/quadratic-period`, `BSD.5/rank-zero-rationality`, `BSD.5/leading-term-positivity`, `BSD.2/heegner-field-selection`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

*Sources:* jsw, §1.2, p. 2.

*Acceptance.*

* E = 37a1: L′(E,1)/(Ω_E Reg_BSD) = 1 (Ш trivial, c₃₇ = 1, E(ℚ)_tors = 0), as BSD.9 certifies.


### `BSD.5/heegner-index` — The Heegner index (definition) — planet *Heegner index*

Let E/ℚ be elliptic, K imaginary quadratic satisfying the Heegner hypothesis, and y_K ∈ E(K) the Heegner point attached to a fixed modular parametrisation φ. When rank E(K) = 1 and y_K has infinite order, heegnerIndex := I_K = [E(K) : ℤ·y_K] (Gross's index, which includes E(K)_tors), and the free index I_K^free := [E(K)/tors : ℤ·ȳ_K]; I_K = I_K^free · #E(K)_tors. The pair (I_K, deg φ, c_φ) depends on φ only through I_K/c_φ.

*Hypotheses and conventions.*

* rank E(K) = 1 (supplied by BSD.3/BSD.4 for the fields of BSD.2) and y_K of infinite order.

*Proof outline.*

1. Both indices are finite because ȳ_K is a nonzero element of the rank-one free group E(K)/tors.
2. I_K = I_K^free·#E(K)_tors from the exact sequence 0 → E(K)_tors → E(K) → E(K)/tors → 0 restricted to ℤy_K, which meets torsion trivially.
3. Changing φ by an isogeny or by a multiple scales y_K and c_φ by the same integer (HE.1/parameter-choice-and-degree).

*Uses:* `BSD.3/heegner-point-nontorsion`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `tauceti:WeierstrassCurve.Affine.finite_torsion`.

*Sources:* gross-zagier-86, Chapter V §2, (2.2) Conjecture, p. 311; jsw, §7.4.1, p. 46.

*Uses of the object.* RankZeroOneBSD:BSD.5/heegner-index-height-formula: ĥ_K(y_K) = I_K^free² Reg(E/K). RankZeroOneBSD:BSD.5/gross-index-formula: Gross's conjecture #Ш(E/K) = (I_K/(c·m))². HeegnerPointEulerSystems HE.6/sha-square-index-bound: Kolyvagin's bound ord_p #Ш(E/K) ≤ 2 ord_p I_K. JSW §7.4: m_{K′} = [E(K′) : ℤ z_{K′}] in the lower and upper bounds.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.heegnerIndex` | constructor | I_K = [E(K) : ℤ y_K] as a positive natural number, given rank E(K) = 1 and y_K of infinite order. |
| `TauCeti.BSD.heegnerIndexFree` | constructor | I_K^free = [E(K)/tors : ℤ ȳ_K]. |
| `TauCeti.BSD.heegnerIndex_eq_free_mul_torsion` | relation | I_K = I_K^free · #E(K)_tors. |
| `TauCeti.BSD.heegnerIndex_pos` | other | 0 < I_K. |
| `TauCeti.BSD.heegnerIndex_div_maninConstant_invariant` | compatibility | I_K/c_φ is independent of the modular parametrisation φ (HE.1/parameter-choice-and-degree). |
| `TauCeti.BSD.torsion_dvd_heegnerIndex` | relation | #E(ℚ)_tors divides I_K. |
| `TauCeti.BSD.not_dvd_heegnerIndex_of_large` | other | For all but finitely many primes p, p ∤ I_K (HE.7/non-torsion-point-prime-divisibility). |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.BSD.heegnerIndex_torsion_factor` | characterisation | heegnerIndex = heegnerIndexFree * Nat.card (E(K)_tors). |
| `TauCeti.BSD.heegnerIndex_scale` | non-example | Replacing φ by 2φ doubles y_K and the index I_K while c_φ doubles too; so I_K alone is not an invariant of E and K, only I_K/c_φ. |
| `TauCeti.BSD.heegnerIndex_11a` | computation | For E₀ = J₀(11) = 11a1 (E(ℚ)_tors ≅ ℤ/5), 5 divides I_K for every point y_K of infinite order generating a finite-index subgroup: the torsion meets ℤy_K trivially (GZ86 Chapter V §2, before (2.3)). |
| `TauCeti.BSD.heegnerIndexFree_one_of_generator` | degenerate | If ȳ_K generates E(K)/tors then I_K^free = 1 and I_K = #E(K)_tors. |

*Acceptance.*

* E = 37a1: y_K = m_K·(0,0) up to torsion and I_K = |m_K| (the integers m_K are coefficients of a weight-3/2 form, Gross §1).
* GZ86 (2.3): t = #E(ℚ)_tors divides I_K.


### `BSD.5/heegner-index-height-formula` — Height of the Heegner point and the squared index (theorem)

In the setting of heegner-index, with heights relative to K in the x-height normalisation: ĥ_K(y_K) = (I_K^free)² · Reg_BSD(E/K). If moreover rank E(ℚ) = 1 and rank E^K(ℚ) = 0 (the case of BSD.3), then Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ)/4^a with 2^a = [E(K)/tors : res(E(ℚ)/tors)] ∈ {1, 2}, so ĥ_K(y_K) = 2·(I_K^free)²·Reg_BSD(E/ℚ)/4^a.

*Hypotheses and conventions.*

* rank E(K) = 1; K-relative heights (GZ.0 gap on the number-field instance).

*Proof outline.*

1. In a rank-one lattice the regulator is the height of a generator, and ĥ is quadratic: ĥ_K(y_K) = (I^free)² ĥ_K(generator).
2. BSD.1/quadratic-regulator-comparison with r₊ = 1, r₋ = 0.

*Uses:* `BSD.5/heegner-index`, `BSD.1/quadratic-regulator-comparison`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`.

*Sources:* jsw, §7.4.1, p. 46.

*Acceptance.*

* E = 37a1: if ȳ_K = m·res(P₀) + torsion with P₀ = (0,0) and a = 0, then ĥ_K(y_K) = 2m²·ĥ_x(P₀) = 2m²·0.0511…, with ĥ_x(P₀) = Reg_BSD(37a1).


### `BSD.5/gross-index-formula` — Gross–Zagier's index conjecture as a form of BSD over K (theorem) — planet *Gross–Zagier index formula*

Let E/ℚ be elliptic of conductor N with optimal parametrisation of Manin constant c, K imaginary quadratic with D_K odd, every prime of N split, u_K = #𝓞_K^×/2, rank E(K) = 1 and Ш(E/K) finite. For a prime ℓ | N let m_ℓ be the order of the component group of the Néron model at either prime above ℓ, and m = ∏_{ℓ|N} m_ℓ. Then for every odd prime p ∤ D_K, the p-part of the BSD formula for E/K (JSW (7.1.a)) holds if and only if ord_p I_K = ord_p(c · m · u_K) + ½ ord_p #Ш(E/K), i.e. the p-part of Gross–Zagier's Conjecture (2.2): I_K = c·m·u_K·#Ш(E/K)^{1/2}. In particular the p-part of BSD for E/K implies that t = #E(ℚ)_tors divides c·m·u_K·#Ш(E/K)^{1/2} in its p-part (Conjecture (2.3)). For D_K ∉ {−3, −4} (u_K = 1) this is Gross's Conjecture 1.2(2): #Ш(E/K) = (I_K/(c·∏_{ℓ|N} m_ℓ))² with m_ℓ = [E(ℚ_ℓ) : E⁰(ℚ_ℓ)]. The index bound, the Sha bound and the exact formula are three different statements: Kolyvagin's Theorem 1.3 (#Ш(E/K) divides t_{E/K}·I_K²) and Howard's ord_p #Ш(E/K) ≤ 2 ord_p I_K (HE.6) are only one inequality.

*Hypotheses and conventions.*

* Gross–Zagier's standing hypotheses (D_K odd, Heegner hypothesis); p odd and p ∤ D_K so that powers of 2 and the discriminant term are units.
* m_ℓ is the same at both primes above a split ℓ (m_𝔭 = m_𝔭̄), so ∏_{w|N} c_w(E/K) = m².

*Proof outline.*

1. Write BSD for E/K: L′(E/K,1)/(Ω_{E/K} Reg_BSD(E/K) |D_K|^{−1/2}) = #Ш(E/K)·∏_w c_w(E/K)/#E(K)_tors².
2. Substitute Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula) for L′(E/K,1), heegner-index-height-formula for ĥ_K(y_K) = (I_K^free)² Reg_BSD(E/K), and BSD.1/quadratic-period for ‖ω₀‖² versus Ω_{E/K}.
3. I_K = I_K^free·#E(K)_tors cancels the torsion term; the Tamagawa product over K is m² (split primes, BSD.1/tamagawa-base-change).
4. What remains is (I_K)² = (c·m·u_K)²·#Ш(E/K) up to powers of 2, which are p-adic units.

*Uses:* `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `BSD.5/heegner-index-height-formula`, `BSD.5/heegner-index`, `BSD.1/quadratic-period`, `BSD.1/tamagawa-base-change`, `BSD.1/odd-part-bsd-over-K`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index`.

*Sources:* gross-zagier-86, Chapter V §2, (2.2) Conjecture, p. 311; gross-zagier-86, Chapter V §2, (2.3) Conjecture, p. 311; gross-kolyvagin, §1, Conjecture 1.2(2), p. 236 (read from the page image); gross-kolyvagin, §1, Theorem 1.3(2), p. 236.

*Acceptance.*

* Gross's example E = X₀(37)/w₃₇ (37a1, φ of degree 2, c = 1, m₃₇ = 1): the formula reads #Ш(E/K) = I_K², and y_K = m_K·(0,0) with the m_K Fourier coefficients of a weight-3/2 form; certifying instances is BSD.9's.
* GZ86 examples at N = 11: (E₀ = J₀(11); c, m, t) = (1, 5, 5), (J₁(11); 5, 1, 5), (E₀/(ℤ/5ℤ); 1, 1, 1): t | c·m in each case.
* N = 65: for E₀ = J₀(65)/⟨w₅, w₁₃⟩, (c, m, t) = (1, 1, 2), so for K ≠ ℚ(i) with 5 and 13 split the conjecture forces 2 | #Ш(E/K)^{1/2} or rank E(K) > 1; Kramer's computation gives 2-Selmer rank ≥ 4 (stated in GZ86, not reproved here).


### `BSD.3a/definite-congruence-period` — The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston) (theorem)

Let g ∈ S₂(Γ₀(N)) be a newform with trivial character and Hecke field with ring O, 𝔭 | p ≥ 5 a prime of O with p ∤ N, ρ̄_{g,𝔭} : G_ℚ → GL₂(k₀) surjective, and N = N⁺N⁻ with N⁻ squarefree with an odd number of prime factors (the definite quaternion algebra of discriminant N⁻), satisfying Pollack–Weston's hypothesis CR (in particular ρ̄ ramified at every ℓ | N⁻ with ℓ ≡ ±1 mod p, and the nonsquarefree alternatives of Hypothesis ♥ when N is not squarefree). Let η_g(N) be the congruence number of g at full level and ξ_g(N⁺, N⁻) the self-pairing of a primitive integral eigenfunction on the definite quaternion algebra. Then ord_𝔭 (η_g(N)/ξ_g(N⁺, N⁻)) = Σ_{ℓ|N⁻} t_g(ℓ), where t_g(ℓ) = length_{O_𝔭} Φ(A_g/ℚ_ℓ)_𝔭 is the 𝔭-part of the Tamagawa (component-group) factor at ℓ.

*Hypotheses and conventions.*

* The hypotheses are those of HeegnerPointEulerSystems HE.6/ribet-takahashi-tamagawa-comparison, which consumes this node; its contract forbids HE.6, rank-zero BSD, Jochnowitz congruences and the final Heegner-index result as inputs.
* This node is the early export the HE.0 review requested (proposed sub-layer BSD.3a, recorded in restructure); it depends only on Néron-model character groups and the GL₂ transfer.

*Proof outline.*

1. Character groups: for N₁N₂ with N₂ having an even number of primes, the character group X̂_r(J) of the Shimura curve Jacobian's toric part at r | N⁻ is free of rank one over the localised Hecke algebra under CR (Pollack–Weston Theorem 6.2, from NeronModelsAndSemistableAbelianVarieties R11.4/characters-graph-homology, R11.4/integral-monodromy-pairing).
2. The monodromy pairing on X̂_r computes congruence numbers: ⟨g_r, g_r⟩ = η_g(N₁/r, rN₂) (Pollack–Weston Proposition 6.4) and the cokernel of the monodromy map is the component group (R11.4/component-cokernel).
3. Ribet–Takahashi: comparing the pairings at successive levels gives ord_𝔭 η_g(aℓ, b) = t_g(ℓ) + ord_𝔭 η_g(a, ℓb) (Pollack–Weston (2)); degeneracy maps and their adjoints are R11.6/degeneracy-functoriality.
4. Iterate over the primes of N⁻ and identify ξ_g(N⁺, N⁻) with η_g(N⁺, N⁻) by freeness (the GL₂ transfer of GL2AutomorphicRepresentationsAndTransfer R17.3 gives the Jacquet–Langlands eigenfunction).

*Uses:* `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing`, `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`, `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`, `NeronModelsAndSemistableAbelianVarieties:R11.6/character-exact-sequences`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GrossZagierAndArithmeticHeights:GZ.3`.

*Sources:* pollack-weston, §1, formula (1), p. 3; pollack-weston, §6.1, end of the section.

*Acceptance.*

* When N⁻ = ℓ is prime and p ∤ c_ℓ(g), ord_𝔭 η_g(N) = ord_𝔭 ξ_g(N⁺, ℓ).
* JSW use the elliptic case: δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ up to p-units (ribet-takahashi-degree-comparison).


### `BSD.5/ribet-takahashi-degree-comparison` — Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi) (theorem) — planet *Ribet–Takahashi degree formula*

Let E/ℚ be semistable of conductor N, optimal, p ≥ 5 a prime of good reduction with E[p] irreducible, and N = N⁺N⁻ with N⁻ a product of an even number of primes. Let δ(N, 1) be the degree of the optimal parametrisation X₀(N) → E and δ(N⁺, N⁻) that of the optimal parametrisation by the Shimura curve X_{N⁺,N⁻}. Then ord_p(δ(N,1)/δ(N⁺,N⁻)) = ord_p ∏_{ℓ|N⁻} c_ℓ(E/ℚ); in JSW's application, where the primes of N⁻ are inert in K′, c_ℓ(E/ℚ) may be replaced by c_ℓ(E/K′) at the same primes up to p-adic units.

*Hypotheses and conventions.*

* Indefinite quaternion algebra (N⁻ with an even number of primes); E[p] irreducible so that the relevant Hecke modules are free (Ribet's multiplicity one).

*Proof outline.*

1. Degrees are congruence numbers up to p-adic units: δ(N, 1) ~ η_E(N) and δ(N⁺, N⁻) ~ η_E(N⁺, N⁻) (multiplicity one at the maximal ideal of E[p]).
2. Apply the Ribet–Takahashi recursion of definite-congruence-period one prime at a time along N⁻, now in the indefinite case (component groups of J₀(N) and of the Shimura-curve Jacobian at ℓ | N⁻, R11.4).
3. At an inert prime ℓ of K′, c_ℓ(E/K′) and c_ℓ(E/ℚ) have the same p-part for multiplicative ℓ with p odd (BSD.1/tamagawa-base-change applied to the twist, which has c_ℓ(E^{K′}) prime to p when E[p] is irreducible).

*Uses:* `BSD.3a/definite-congruence-period`, `BSD.1/tamagawa-base-change`, `NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel`, `NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality`, `GrossZagierAndArithmeticHeights:GZ.3`.

*Sources:* jsw, §7.4.1, p. 46.

*Acceptance.*

* JSW §7.4.1: δ_{N⁺,N⁻} = δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ(E/K′) up to ℤ_p^×.


### `BSD.5/rational-bsd-defect` — The rational BSD defect (definition) — planet *Rational BSD defect*

For E/ℚ elliptic with analyticRank E ≤ 1 (so rank E(ℚ) = analyticRank E and Ш(E/ℚ) is finite by BSD.4/analytic-rank-at-most-one-theorem), bsdDefect E := leadingTerm E · #E(ℚ)_tors² / (Ω_E · Reg_BSD(E/ℚ) · #Ш(E/ℚ) · ∏_ℓ c_ℓ(E)). It is a positive rational number: bsdDefect E ∈ ℚ_{>0}, with the real identity leadingTerm E = bsdDefect E · (Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors²). The Birch–Swinnerton-Dyer formula for E is the statement bsdDefect E = 1, and its p-part is padicValRat p (bsdDefect E) = 0.

*Hypotheses and conventions.*

* The arithmetic quotient Ω_E·Reg·#Ш·∏c_ℓ/#tors² is EllipticCurves Layer 7's BSD quotient, stated with GZ.0's Reg_BSD (x-height normalisation); with Tau Ceti's halved regulator the defect changes by 2^{rank}.
* Only finitely many c_ℓ differ from 1 (good primes), so the product is finite.

*Proof outline.*

1. Rationality: rank-zero-rationality (rank 0, Reg = 1) and rank-one-rationality (rank 1); the arithmetic terms other than Ω_E and Reg are integers.
2. Positivity: leading-term-positivity, Ω_E > 0, Reg_BSD > 0 (positive-definite height on the free quotient), c_ℓ ≥ 1, #Ш ≥ 1.
3. Define the rational number as the quotient of the rational L*(E,1)/(Ω_E Reg_BSD) by #Ш ∏c_ℓ / #tors².

*Uses:* `BSD.5/rank-zero-rationality`, `BSD.5/rank-one-rationality`, `BSD.5/leading-term-positivity`, `BSD.4/analytic-rank-at-most-one-theorem`, `BSD.0/analytic-rank`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `mathlib:padicValRat`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

*Sources:* jsw, Conjecture 1.1.1(b), (1.1.a), p. 1; jsw, §7, p. 41.

*Uses of the object.* RankZeroOneBSD:BSD.6: each prime-part theorem is the statement padicValRat p (bsdDefect E) = 0 under its hypotheses. RankZeroOneBSD:BSD.8/elliptic-endpoint: the full formula from a finite certificate of vanishing valuations (BSD.7 packet request: d_E ∈ ℚ, 0 < d_E, real identity). PeriodsAndSpecialValues:PS.6: re-export of prime-part and conditional full formulas. JSW Theorem 1.2.1: (1.2.a) is ord_p of the defect being zero.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `WeierstrassCurve.bsdDefect` | constructor | bsdDefect E : ℚ for E/ℚ with analyticRank E ≤ 1. |
| `WeierstrassCurve.bsdDefect_pos` | other | 0 < bsdDefect E. |
| `WeierstrassCurve.leadingTerm_eq_bsdDefect_mul` | characterisation | leadingTerm E = bsdDefect E · Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors² as real numbers. |
| `WeierstrassCurve.bsdDefect_eq_one_iff` | characterisation | bsdDefect E = 1 ↔ the full BSD formula (1.1.a) holds for E. |
| `WeierstrassCurve.padicValRat_bsdDefect` | relation | padicValRat p (bsdDefect E) = v_p(L*/(Ω Reg)) + 2 v_p(#tors) − v_p(#Ш) − Σ_ℓ v_p(c_ℓ). |
| `WeierstrassCurve.bsdDefect_eq_of_isogenous` | compatibility | Isogenous curves have equal defects (defect-isogeny-invariance). |
| `WeierstrassCurve.bsdDefect_regulator_convention` | compatibility | The defect computed with Tau Ceti's regulator equals 2^{analyticRank E} · bsdDefect E (GZ.0/bsd-regulator). |
| `WeierstrassCurve.bsdDefect_eq_one_of_forall_padicValRat` | characterisation | If padicValRat p (bsdDefect E) = 0 for every prime p then bsdDefect E = 1 (positive rational, BSD.8's reconstruction). |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `WeierstrassCurve.bsdDefect_11a1` | computation | bsdDefect (11a1) = 1 (L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, #Ш = 1). |
| `WeierstrassCurve.bsdDefect_rank_zero_regulator` | degenerate | If analyticRank E = 0 then Reg_BSD = 1 and bsdDefect E = L(E,1)·#tors²/(Ω_E·#Ш·∏c_ℓ). |
| `WeierstrassCurve.bsdDefect_tauCeti_regulator` | non-example | For 37a1 (rank one) the quotient formed with Tau Ceti's halved regulator is 2, not 1: the regulator convention changes the answer. |
| `WeierstrassCurve.bsdDefect_11a_isogeny` | compatibility | bsdDefect (11a1) = bsdDefect (11a3) although their periods, torsion and Tamagawa numbers differ. |

*Acceptance.*

* 11a1: L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, Ш = 1 gives bsdDefect = (1/5)·25/5 = 1.


### `BSD.5/defect-isogeny-invariance` — Isogeny invariance of the rational BSD defect (theorem)

If E and E′ are ℚ-isogenous elliptic curves with analyticRank E ≤ 1, then analyticRank E′ = analyticRank E and bsdDefect E = bsdDefect E′.

*Hypotheses and conventions.*

* The arithmetic invariance is Cassels' theorem and the analytic invariance is equality of all local factors; both are owned by EllipticCurves Layer 7 (RS-30) and only composed here.

*Proof outline.*

1. Equal local Euler factors give ellipticL E = ellipticL E′ (BSD.0/actual-l-function, ellipticL_eq_of_isogenous), hence equal analytic rank and leading term.
2. Cassels: the arithmetic BSD quotient Ω·Reg·#Ш·∏c/#tors² is isogeny invariant (EllipticCurves Layer 7), stated with Reg_BSD; the normalisation adapter GZ.0/bsd-regulator is the same on both sides.
3. Divide.

*Uses:* `BSD.5/rational-bsd-defect`, `BSD.0/actual-l-function`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

*Sources:* jsw, §7, p. 41.

*Acceptance.*

* 11a1, 11a2, 11a3 all have defect 1.


### `BSD.5/p-part-from-two-bounds` — The p-part of BSD from an upper and a lower bound (lemma)

Let E/ℚ be elliptic with analyticRank E ≤ 1 and p a prime with E(ℚ)[p] = 0 (for instance p odd with E[p] irreducible). Then padicValRat p (bsdDefect E) = v_p(L*(E,1)/(Ω_E Reg_BSD ∏_ℓ c_ℓ)) − v_p(#Ш(E/ℚ)[p^∞]). Hence the upper bound v_p #Ш[p^∞] ≤ v_p(L*/(ΩReg∏c)) is equivalent to padicValRat p (bsdDefect E) ≥ 0, the lower bound to ≤ 0, and the p-part of the BSD formula to the conjunction of the two bounds. Neither a bound on the Heegner index nor a one-sided Euler-system divisibility alone gives padicValRat p (bsdDefect E) = 0.

*Hypotheses and conventions.*

* E(ℚ)[p] = 0 so the torsion term is a p-adic unit; for p = 2 or curves with rational p-torsion the torsion term is kept (BSD.7).

*Proof outline.*

1. Expand padicValRat of the defining quotient (rational-bsd-defect, padicValRat_bsdDefect); v_p(#Ш) = v_p(#Ш[p^∞]); the torsion term vanishes.
2. Reg_BSD's powers of 2 and the regulator itself are absorbed in the rational L*/(Ω Reg) whose valuation is taken as a whole.

*Uses:* `BSD.5/rational-bsd-defect`, `mathlib:padicValRat`.

*Sources:* jsw, §1.3, p. 2.

*Acceptance.*

* JSW (7.4.d) and (7.4.e) are the two bounds whose conjunction is Theorem 1.2.1.


### `BSD.5/sha-bound-from-heegner-index` — Kolyvagin's index bound as a one-sided p-part statement (lemma)

Let E/ℚ, K, y_K be as in heegner-index with rank E(K) = 1, p an odd prime with p ∤ D_K N and G_K → GL₂(ℤ_p) surjective on T_pE, D_K ∉ {−3, −4}. Then ord_p #Ш(E/K)[p^∞] ≤ 2 ord_p I_K (HE.6/sha-square-index-bound), whereas Gross–Zagier's conjecture (gross-index-formula) predicts 2 ord_p I_K = ord_p #Ш(E/K) + 2 ord_p(c·m·u_K). Combined with the rank-zero p-part for E^K (BSD.6) and the odd decomposition of Ш(E/K), the inequality gives an upper bound for ord_p #Ш(E/ℚ)[p^∞]. It is not an exact formula: equality needs the opposite inequality from a main conjecture or from Kolyvagin's primitivity, which this lemma does not supply.

*Hypotheses and conventions.*

* Howard's hypotheses for HE.6/clean-rank-one-descent-theorem-A; p odd and prime to the index of the Heegner class modulo torsion as appropriate.

*Proof outline.*

1. HE.6/sha-square-index-bound gives length Ш[p^∞] ≤ 2·length(E(K) ⊗ ℤ_p/ℤ_p y_K).
2. With E(K)[p] = 0 (surjectivity), the length on the right is ord_p I_K.
3. Rewrite the index through gross-index-formula, and split Ш(E/K)[p^∞] by BSD.1/odd-selmer-sha-decomposition.

*Uses:* `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`, `BSD.5/heegner-index`, `BSD.5/gross-index-formula`, `BSD.1/odd-selmer-sha-decomposition`.

*Sources:* jsw, §7.4.2, p. 47.

*Acceptance.*

* HE.6/primitivity-versus-nonzero: a nonzero Kolyvagin class gives only this inequality.


**Acceptance tests for BSD.5.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* E = 11a1: L(E,1)/Ω_E = 1/5.
* E = 37a1: L(E,1)/Ω_E = 0 (rank one).
* L(11a1, 1) = 0.2538… > 0 and L′(37a1, 1) = 0.3059… > 0 (numerical values for orientation; certification is BSD.9's).
* E = 37a1: L′(E,1)/(Ω_E Reg_BSD) = 1 (Ш trivial, c₃₇ = 1, E(ℚ)_tors = 0), as BSD.9 certifies.
* E = 37a1: y_K = m_K·(0,0) up to torsion and I_K = |m_K| (the integers m_K are coefficients of a weight-3/2 form, Gross §1).
* GZ86 (2.3): t = #E(ℚ)_tors divides I_K.


<a id="bsd-6"></a>
## BSD.6. Irreducible-prime leading-term formulas

BSD.6 states and proves the named prime-part theorems against the rational defect, each with its source's hypotheses and nothing broader. In rank zero: at good ordinary and multiplicative p ≥ 3 with E[p] irreducible and a multiplicative prime q ≠ p where E[p] ramifies (Skinner–Urban, Skinner Theorem C; JSW Theorem 7.2.1(ii)), from the cyclotomic main conjecture in the Skinner–Urban form and, for p ∥ N, Skinner's Theorem A, specialised at the trivial character with the trivial-zero analysis at split multiplicative p (Greenberg–Stevens and the nonvanishing of the L-invariant); at supersingular p > 2 with a_p = 0 for semistable curves and their permitted twists (BSTW Theorem 1.5 with r = 0). In rank one: the Jetchev–Skinner–Wan theorem for semistable E, p ≥ 3 of good reduction, E[p] irreducible (a₃ = 0 if p = 3 is supersingular), from a lower bound through the anticyclotomic BDP main conjecture over K′ and an upper bound through the Shimura-curve Kolyvagin bound over K″; and Castella's corrected Theorem A′ at multiplicative p > 3 (E[p] irreducible, a nonsplit multiplicative q where E[p] ramifies, E(ℚ_p)[p] = 0), the original wider Theorem A not being a target. Each theorem is the conjunction of an upper and a lower bound for Ш[p^∞] (BSD.5/p-part-from-two-bounds); integral ambiguities of rational main-conjecture statements are removed explicitly (μ = 0, no finite submodules, Manin constants prime to p).

**Dependencies on other roadmaps:** `DiophantineApproximationAndTranscendence:DT.5`, `EulerSystemsAndKolyvaginSystems:ES.4`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.8`, `GrossZagierAndArithmeticHeights:GZ.9`, `HeegnerPointEulerSystems:HE.6`, `HeegnerPointEulerSystems:HE.7`, `ModularIwasawaMainConjectures:L0`, `ModularIwasawaMainConjectures:L1`, `PadicFamilies:L3`, `PadicHodgeRegulators:L3`, `PadicHodgeRegulators:L4`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L4`, `SerreWeightAndLevelOptimisation:R20.2`, `tauceti:TauCetiRoadmap`.

**Dependencies inside this roadmap:** BSD.0, BSD.1, BSD.2, BSD.3, BSD.4, BSD.5, BSD.6a.


### `BSD.6/cyclotomic-specialization-formula` — Specialising a cyclotomic main conjecture at the trivial character (theorem) — planet *Cyclotomic control at the trivial character*

Let f ∈ S₂(Γ₀(N)) be the newform of E/ℚ, p ≥ 3 a prime of good ordinary or multiplicative reduction, ρ̄ = E[p] irreducible, Λ = ℤ_p[[Γ]] the cyclotomic Iwasawa algebra with topological generator γ, X the dual of the Iwasawa–Greenberg Selmer group and L_f ∈ Λ the p-adic L-function with periods Ω_f^±. Assume the main conjecture Ch_Λ(X) = (L_f). (a) If E does not have split multiplicative reduction at p, then #ℤ_p/(L_alg(f,1)) = #Sel(f)·∏_ℓ c_ℓ(T_f)·#(ℤ_p/(α_p − 1))² , with L_alg(f,1) = L(f,1)/(−2πiΩ_f^+), α_p the unit root (or a_p at multiplicative p), and where the Euler factor (1 − α_p^{−1})² of the interpolation formula is matched by the local term #K_p = #(ℤ_p/(α_p − 1))². (b) If E has split multiplicative reduction at p (α_p = 1), then L_f = (γ − 1)L′_f and Ch_Λ(X) = (γ − 1)Ch′; the leading coefficients are related through the L-invariant L(V_f) = log_p(q_E)/ord_p(q_E) (Greenberg–Stevens) and the local term involves the Tamagawa number at p and log_p q_E; with L(V_f) ≠ 0 the same equality #ℤ_p/(L_alg(f,1)) = #Sel(f)·∏_ℓ c_ℓ(T_f) results.

*Hypotheses and conventions.*

* Selmer groups with Σ-imprimitive conditions are compared with the primitive ones by local factors at ℓ ∈ Σ (Skinner §3.1).
* In case (b), the nonvanishing of L(V_f) is an input (transcendence of the Tate period), requested from DiophantineApproximationAndTranscendence DT.5; the Greenberg–Stevens derivative formula is requested from PadicFamilies L3.

*Proof outline.*

1. No nonzero finite Λ-submodules in X (Greenberg; Skinner Proposition 2.3.3), so char ideals equal Fitting ideals and specialise.
2. Control: 0 → S → Sel_{ℚ∞}(f) → H¹(F_p, (M⁻)^{I_p}) → 0, and the last term vanishes unless α_p = 1 (Skinner §3.2); SelmerIwasawaCohomology L3/iwasawa-descent.
3. Local terms: #K_ℓ = c_ℓ(T_f) for ℓ ≠ p, and #K_p = c′_p c″_p with c′_p = c″_p = #(ℤ_p/(α_p − 1)) when α_p ≠ 1 (Tate local duality).
4. Split multiplicative case: the extra zero of L_f at the trivial character and of Ch at γ − 1; compare L′_f(0) with L(V_f)·L_alg(f,1) (Greenberg–Stevens) and c_p with ψ_ur/ψ_cyc of the extension class (log_p q_E).

*Uses:* `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L3/iwasawa-torsion-criterion`, `SelmerIwasawaCohomology:L4/greenberg-main-conjecture`, `ModularIwasawaMainConjectures:L0`, `PadicFamilies:L3`, `DiophantineApproximationAndTranscendence:DT.5`, `PadicHodgeRegulators:L3/rubin-coleman-map`, `PadicHodgeRegulators:L4/split-multiplicative-augmentation`.

*Sources:* skinner-mult, §3.2, p. 20; skinner-mult, §1, Theorem B (iii), p. 2.

*Acceptance.*

* 11a1 at p = 5 is excluded (E[5] reducible); 11a1 at p = 3 (ordinary, good) has L_alg(f,1) a 3-adic unit and Sel(f) = 0.


### `BSD.6/rank-zero-ordinary-multiplicative-p-part` — The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner) (theorem) — planet *Skinner–Urban rank-zero p-part*

Let E/ℚ be elliptic with good ordinary or multiplicative reduction at a prime p ≥ 3, E[p] irreducible, and a prime q ≠ p of multiplicative reduction at which E[p] is ramified. If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0, i.e. ord_p #Ш(E/ℚ)[p^∞] = ord_p (L(E,1)/(Ω_E ∏_ℓ c_ℓ(E))).

*Hypotheses and conventions.*

* The hypotheses are JSW Theorem 7.2.1(ii) and Skinner Theorem C, kept exactly; the residual hypothesis is the Skinner–Urban form (q ∥ N with ρ̄ ramified at q), not the stronger FW 1.6 form (RT-AREA-iwasawa-1/14).
* Multiplicative p (p ∥ N): the main conjecture is Skinner's Theorem A for p | N, and in the split case the exceptional-zero inputs (Greenberg–Stevens, L(V_f) ≠ 0) are used (RT-AREA-iwasawa-1/4); good ordinary p: Skinner–Urban plus Kato.

*Proof outline.*

1. Main conjecture Ch_Λ(X) = (L_f) in Λ: for p ∤ N, Skinner–Urban's Theorem in the SU/Skinner Theorem A (p ∤ N) form (requested from ModularIwasawaMainConjectures L1); for p ∥ N, Skinner's Theorem A deduced from the p ∤ N case through Hida families and Fitting ideals (requested as a new ModularIwasawaMainConjectures layer beside L1).
2. cyclotomic-specialization-formula turns the equality into #ℤ_p/(L_alg(E,1)) = #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ, with the split multiplicative case through L(V_f) ≠ 0.
3. Sel_{p^∞}(E/ℚ) = Ш(E/ℚ)[p^∞] as E(ℚ) is finite (BSD.4/analytic-rank-zero-theorem) and E(ℚ)[p] = 0.
4. Periods: Ω_E = −2πiΩ_f^+ up to ℤ_(p)^× (Manin constant prime to p, requested from GZ.3); then BSD.5/p-part-from-two-bounds.

*Uses:* `BSD.6/cyclotomic-specialization-formula`, `ModularIwasawaMainConjectures:L1`, `BSD.4/analytic-rank-zero-theorem`, `BSD.5/p-part-from-two-bounds`, `BSD.5/rank-zero-rationality`, `BSD.4/kato-p-part-upper-bound`, `GrossZagierAndArithmeticHeights:GZ.3`, `PadicFamilies:L3`, `DiophantineApproximationAndTranscendence:DT.5`.

*Sources:* skinner-mult, §1, Theorem C, p. 3; jsw, Theorem 7.2.1(ii), pp. 42–43.

*Acceptance.*

* E = 11a1, p = 3: hypotheses hold with q = 11 (E[3] ramified at 11 since 3 ∤ ord₁₁Δ = 5), and the formula gives Ш(E/ℚ)[3^∞] = 0.


### `BSD.6/rank-zero-supersingular-p-part` — The p-part of BSD in rank zero at supersingular primes (theorem)

Let E/ℚ be semistable, or a quadratic twist of a semistable curve by a character unramified at the primes dividing the conductor of the semistable curve and with discriminant supported at primes of ordinary reduction and coprime to Np, and let p > 2 be a prime of good supersingular reduction with a_p(E) = 0 (automatic for p ≥ 5). If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0.

*Hypotheses and conventions.*

* Hypotheses of BSTW Theorems 1.3 and 1.5 (r = 0); the twist range is BSTW's, not a broader one from a differently normalised statement.
* JSW Theorem 7.2.1(iii) is the same statement, cited from the withdrawn Wan preprint; the proof here follows BSTW (Remark 1.4).

*Proof outline.*

1. Kobayashi's signed main conjecture (L^±_p(E)) = ξ_Λ(X^±(E)) for E and its permitted twists (BSD.6a/bstw-signed-main-conjecture).
2. Specialise the + (or −) equality at the trivial character: Kobayashi's control theorem for signed Selmer groups gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ against L^±_p(E)(1) = (unit)·L(E,1)/Ω_E (BSD.6a/bstw-rank-zero-p-part).
3. E(ℚ) finite (BSD.4) and E(ℚ)[p] = 0; conclude by BSD.5/p-part-from-two-bounds.

*Uses:* `BSD.6a/bstw-rank-zero-p-part`, `BSD.6a/bstw-signed-main-conjecture`, `BSD.4/analytic-rank-zero-theorem`, `BSD.5/p-part-from-two-bounds`.

*Sources:* bstw, Theorem 1.5, p. 3; jsw, Theorem 7.2.1(iii), p. 43.

*Acceptance.*

* E = 37a1 has rank one and is outside this node; for a semistable rank-zero curve with a supersingular p ≥ 5 the node applies with a_p = 0.


### `BSD.6/residually-ramified-prime` — A semistable curve with irreducible E[p] is residually ramified somewhere (lemma)

Let E/ℚ be semistable of conductor N > 1 and p an odd prime with E[p] irreducible. Then there is a prime q | N at which E[p] is ramified; equivalently p ∤ c_q(E) = ord_q(Δ_min) for some q | N. For any imaginary quadratic K in which such a q is inert or ramified, E[p] restricted to G_K is irreducible (Skinner, Lemma 2.8.1).

*Hypotheses and conventions.*

* E semistable, p odd, E[p] irreducible.

*Proof outline.*

1. If E[p] were unramified at every q | N, Ribet's level-lowering theorem would remove each q in turn, producing a weight-two cusp form of level 1 with residual representation E[p]; there is none (requested from SerreWeightAndLevelOptimisation R20.2).
2. At a multiplicative q, E[p] is ramified iff p ∤ ord_q(Δ_min) (Tate curve), and c_q = ord_q(Δ_min) in the split case.
3. Irreducibility over K: a G_K-stable line would be stable under the inertia at q, whose image is unipotent nontrivial, forcing a G_ℚ-stable line.

*Uses:* `SerreWeightAndLevelOptimisation:R20.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `BSD.0/twist-local-factors`.

*Sources:* jsw, §7.4, p. 45; jsw, §7.4.1, p. 45.

*Acceptance.*

* E = 11a1, p = 3: ord₁₁Δ = 5, so E[3] is ramified at 11.


### `BSD.6/jsw-lower-bound` — The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1) (theorem)

Let E/ℚ be semistable, optimal, analyticRank E = 1, p ≥ 3 a prime of good reduction with E[p] irreducible (and a_p = 0 if p = 3 is supersingular). Then ord_p #Ш(E/ℚ)[p^∞] ≥ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

*Hypotheses and conventions.*

* Hypotheses of JSW Theorem 1.2.1; isogeny invariance (BSD.5/defect-isogeny-invariance) reduces to optimal E.

*Proof outline.*

1. Choose q | N with E[p] ramified (residually-ramified-prime) and K′ by BSD.2/auxiliary-fields-for-prime-parts (a): (gen-H), q inert or ramified, p split, L(E^{K′},1) ≠ 0; so rank E(K′) = 1, Ш(E/K′) finite.
2. Anticyclotomic main-conjecture divisibility plus control (BSD.6a/wan-anticyclotomic-divisibility, BSD.6a/anticyclotomic-selmer-control): ord_p L_p(f,1) ≤ ord_p(#H¹_{F_ac}(K′,E[p^∞])·C(E[p^∞])).
3. The BDP–Brooks formula (GZ.9/quaternionic-weight-two-formula, GZ.9/p-optimal-quotient-formula): ord_p L_p(f,1) = 2 ord_p(((1 + p − a_p)/p)·log_ω z_{K′}); hence (JSW (7.4.b)) ord_p #Ш(E/K′)[p^∞] ≥ 2 ord_p m_{K′} − ord_p ∏_{w|N⁺} c_w(E/K′).
4. Gross–Zagier in Zhang's form for z_{K′} and the Ribet–Takahashi comparison (BSD.5/ribet-takahashi-degree-comparison) give 2 ord_p m_{K′} = ord_p((L′(E,1)/(Ω_E Reg))·(L(E^{K′},1)/Ω_{E^{K′}})) − ord_p ∏_{ℓ|N⁻} c_ℓ(E/K′), using BSD.1/quadratic-period and the Manin constant prime to p.
5. BSD.1/tamagawa-base-change, BSD.1/odd-selmer-sha-decomposition and the Kato bound for E^{K′} (BSD.4/kato-p-part-upper-bound) give the bound for E.

*Uses:* `BSD.6/residually-ramified-prime`, `BSD.2/auxiliary-fields-for-prime-parts`, `BSD.6a/wan-anticyclotomic-divisibility`, `BSD.6a/anticyclotomic-selmer-control`, `GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula`, `GrossZagierAndArithmeticHeights:GZ.9/p-optimal-quotient-formula`, `BSD.5/ribet-takahashi-degree-comparison`, `BSD.1/quadratic-period`, `BSD.1/tamagawa-base-change`, `BSD.1/odd-selmer-sha-decomposition`, `BSD.4/kato-p-part-upper-bound`, `BSD.3/analytic-rank-one-theorem`, `BSD.5/defect-isogeny-invariance`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`.

*Sources:* jsw, §7.4.1, (7.4.d), p. 47.

*Acceptance.*

* JSW (7.4.d).


### `BSD.6/jsw-upper-bound` — The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2) (theorem)

Under the hypotheses of jsw-lower-bound, ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

*Hypotheses and conventions.*

* As jsw-lower-bound.

*Proof outline.*

1. Factor N = N⁺N⁻ (N⁺ = q, N⁻ = N/q if the number of primes of N is odd; N⁺ = 1 otherwise) and choose K″ by BSD.2/auxiliary-fields-for-prime-parts (b): N⁺ split, N⁻ inert, p split, L(E^{K″},1) ≠ 0.
2. Kolyvagin-type bound for the Shimura-curve Heegner point (JSW Theorem 4.4.1; Nekovář's Shimura-curve Euler-system descent HE.7/dyadic-integral-conjugation-descent with the error terms of ES.4, and Howard's bound HE.6/sha-square-index-bound in the classical case): ord_p #Ш(E/K″)[p^∞] ≤ 2 ord_p m_{K″}.
3. Gross–Zagier for z_{K″} and Ribet–Takahashi as in jsw-lower-bound; no prime w | N⁺ has p | c_w(E/K″).
4. The rank-zero equality for E^{K″} (rank-zero-ordinary-multiplicative-p-part or rank-zero-supersingular-p-part) and the odd decomposition give the bound for E.

*Uses:* `BSD.2/auxiliary-fields-for-prime-parts`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `BSD.5/ribet-takahashi-degree-comparison`, `BSD.6/rank-zero-ordinary-multiplicative-p-part`, `BSD.6/rank-zero-supersingular-p-part`, `BSD.1/odd-selmer-sha-decomposition`, `BSD.1/tamagawa-base-change`, `BSD.1/quadratic-period`, `GrossZagierAndArithmeticHeights:GZ.3`.

*Sources:* jsw, §7.4.2, (7.4.e), p. 48.

*Acceptance.*

* JSW (7.4.e).


### `BSD.6/jsw-rank-one-p-part` — The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan) (theorem) — planet *Jetchev–Skinner–Wan theorem*

Let E/ℚ be semistable with analyticRank E = 1 and p ≥ 3 a prime of good reduction with E[p] irreducible; if p = 3 and E is supersingular at 3, assume a₃(E) = 0. Then padicValRat p (bsdDefect E) = 0, i.e. ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_ℓ c_ℓ(E/ℚ)).

*Hypotheses and conventions.*

* Semistability of E is a global hypothesis and is not the same as good reduction at p; both are assumed.
* p = 3 is included under JSW's extra hypothesis; no upgrade beyond it is claimed.

*Proof outline.*

1. Reduce to E optimal (BSD.5/defect-isogeny-invariance).
2. Combine jsw-lower-bound and jsw-upper-bound with BSD.5/p-part-from-two-bounds (E(ℚ)[p] = 0 as E[p] is irreducible).

*Uses:* `BSD.6/jsw-lower-bound`, `BSD.6/jsw-upper-bound`, `BSD.5/p-part-from-two-bounds`, `BSD.5/defect-isogeny-invariance`, `BSD.5/rational-bsd-defect`.

*Sources:* jsw, Theorem 1.2.1, p. 2; jsw, §1.2, p. 2.

*Acceptance.*

* E = 37a1 (prime conductor, no rational isogeny) at every prime p ≥ 3 with p ≠ 37: ord_p of the defect is 0.


### `BSD.6/castella-multiplicative-rank-one-p-part` — The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′) (theorem) — planet *Castella's Theorem A′*

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3. Assume E[p] is irreducible, E has nonsplit multiplicative reduction at some prime q ≠ p at which E[p] is ramified, and E(ℚ_p)[p] = 0. If analyticRank E = 1, then padicValRat p (bsdDefect E) = 0: ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_{ℓ|N} c_ℓ(E/ℚ)). E need not be semistable (additive primes other than p allowed); the original wider Theorem A of Castella (2018) is not a target.

*Hypotheses and conventions.*

* Exactly the hypotheses of Theorem A′ of Castella's erratum; the nonsplit condition at q and E(ℚ_p)[p] = 0 are additional to the 2018 statement.

*Proof outline.*

1. Choose K by BSD.2/auxiliary-fields-for-prime-parts (c) satisfying the hypotheses of the corrected Theorem 1.1, with L(E^K, 1) ≠ 0.
2. Anticyclotomic main conjecture Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)) (BSD.6a/castella-anticyclotomic-main-conjecture).
3. Specialise at the trivial character with the multiplicative-prime BDP formula L_p(f,1) = (1 − a_p p^{−1})²(log_{ω_E} P_K)² up to units (GZ.9/multiplicative-prime-formula; no exceptional zero) and the anticyclotomic control theorem at a multiplicative prime (Castella §5).
4. Convert log_{ω_E} P_K into the Heegner index and use Gross–Zagier, BSD.1 comparisons, and the rank-zero p-part for E^K (rank-zero-ordinary-multiplicative-p-part, applicable because p is multiplicative for E^K and q is a residually ramified multiplicative prime), as in Castella §5.

*Uses:* `BSD.6a/castella-anticyclotomic-main-conjecture`, `BSD.2/auxiliary-fields-for-prime-parts`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `BSD.6/rank-zero-ordinary-multiplicative-p-part`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `BSD.1/odd-part-bsd-over-K`, `BSD.5/p-part-from-two-bounds`, `BSD.3/analytic-rank-one-theorem`, `BSD.5/defect-isogeny-invariance`.

*Sources:* castella-erratum, Theorem A′, p. 1; castella-erratum, Remark after Theorem A′, pp. 1–2.

*Acceptance.*

* Castella's Remark: for split multiplicative p, E(ℚ_p)[p] = 0 is equivalent to p ∤ ord_p(q_E) and log_p(q_E) ∈ pℤ_p^× (Skinner–Zhang's condition (b)).


**Acceptance tests for BSD.6.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* 11a1 at p = 5 is excluded (E[5] reducible); 11a1 at p = 3 (ordinary, good) has L_alg(f,1) a 3-adic unit and Sel(f) = 0.
* E = 11a1, p = 3: hypotheses hold with q = 11 (E[3] ramified at 11 since 3 ∤ ord₁₁Δ = 5), and the formula gives Ш(E/ℚ)[3^∞] = 0.
* E = 37a1 has rank one and is outside this node; for a semistable rank-zero curve with a supersingular p ≥ 5 the node applies with a_p = 0.
* E = 11a1, p = 3: ord₁₁Δ = 5, so E[3] is ramified at 11.
* JSW (7.4.d).
* JSW (7.4.e).


<a id="bsd-6a"></a>
## BSD.6a. Main-conjecture inputs for the irreducible-prime branches

BSD.6a owns the branch-specific main-conjecture inputs that no other layer supplies. For the JSW branch: JSW's anticyclotomic control theorem and the divisibility of the BDP characteristic ideal by the p-adic L-function (Wan's method, with the U(3,1) congruences of AutomorphicCongruences L2 and, at supersingular primes, the Castella–Liu–Wan semi-ordinary replacement L2s; Hsieh's μ = 0). For the supersingular rank-zero branch: the BSTW two-variable zeta element with its two explicit reciprocity laws and common integral normalisation, and Kobayashi's signed main conjecture for semistable E (BSTW Theorem 1.3) with its twist range, exported to ModularIwasawaMainConjectures L6; Wan's withdrawn preprint is superseded by BSTW (Remark 1.4). For the multiplicative rank-one branch: Castella's corrected anticyclotomic Theorem 1.1, proved from the higher-weight Theorem 2.3 of the erratum and Lemmas 2.1–2.2 by congruences in a Hida family, without the invalid specialisation step; its inputs from GeneralizedHeegnerCycles GH.7, Castella–Grossi–Skinner (BSD.7a), Fouquet–Ochiai (AutomorphicCongruences L5a) and Burungale–Castella–Kim (HE.8b) are listed exactly. A restructure proposal moves the zeta element to an early sub-layer BSD.6z so that AutomorphicCongruences L5a can import it without a cycle.

**Dependencies on other roadmaps:** `ArithmeticGaloisDuality:R02.4`, `AutomorphicCongruences:L2`, `AutomorphicCongruences:L2s`, `AutomorphicCongruences:L5a`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L4e`, `EulerSystemsAndKolyvaginSystems:ES.4`, `GeneralizedHeegnerCycles:GH.7`, `GrossZagierAndArithmeticHeights:GZ.3`, `GrossZagierAndArithmeticHeights:GZ.9`, `HeegnerPointEulerSystems:HE.8`, `HeegnerPointEulerSystems:HE.8b`, `KatoEulerSystems:L2`, `KatoEulerSystems:L3`, `KatoEulerSystems:L4`, `ModularIwasawaMainConjectures:L0`, `ModularIwasawaMainConjectures:L1`, `ModularIwasawaMainConjectures:L4`, `ModularSymbolsPadicLFunctions:L4`, `PadicFamilies:L1`, `PadicHodgeRegulators:L3`, `PadicHodgeRegulators:L4`, `SelmerIwasawaCohomology:L3`.

**Dependencies inside this roadmap:** BSD.1, BSD.2, BSD.4, BSD.7a.


### `BSD.6a/anticyclotomic-selmer-control` — Anticyclotomic control at the trivial character (JSW Theorem 3.3.1) (theorem)

Let E/ℚ be semistable, p ≥ 3 a prime of good reduction with E[p] irreducible, K imaginary quadratic with p = 𝔭𝔭̄ split, (gen-H) for N = N⁺N⁻ and (irred_K). Let K_∞ be the anticyclotomic ℤ_p-extension, Λ = ℤ_p[[Gal(K_∞/K)]], and X_ac the dual of the Selmer group with the 'relaxed at 𝔭, strict at 𝔭̄' conditions at p (the Greenberg-type condition of the BDP main conjecture). If rank E(K) = 1 and Ш(E/K)[p^∞] is finite, then X_ac is Λ-torsion and ord_p(Ch_Λ(X_ac)(0)) = ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])), where, by JSW (3.5.d), ord_p(#H¹_{F_ac}·C) = ord_p #Ш(E/K) − 2 ord_p [E(K) : ℤz_K] + 2 ord_p(((1 + p − a_p)/p)·log_ω z_K) + ord_p ∏_{w|N⁺} c_w(E/K).

*Hypotheses and conventions.*

* JSW's (split), (gen-H), (good), (-free), (irred_K), (corank 1), (sur); the control is a comparison of finite modules with all local terms kept.

*Proof outline.*

1. Control via Greenberg's method: compare the Λ-adic Selmer group at the augmentation ideal with H¹_{F_ac}(K, E[p^∞]), the kernel and cokernel being controlled by H⁰ terms that vanish under (irred_K) and local terms at primes w | N⁺ split in K (Tamagawa factors) (SelmerIwasawaCohomology L3/iwasawa-descent, L3/semilocal-cohomology).
2. No proper finite-index Λ-submodules (as in Castella erratum Lemma 2.2), so the characteristic ideal specialises to the Fitting ideal.
3. Express #H¹_{F_ac} through Ш, the index of z_K and the p-adic logarithm at 𝔭 using the Bloch–Kato logarithm of the Kummer class (GZ.9/bloch-kato-logarithm-of-heegner-class) and Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate).

*Uses:* `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-torsion-criterion`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `BSD.1/tamagawa-base-change`, `ModularIwasawaMainConjectures:L0`.

*Sources:* jsw, §1.3, p. 3.

*Acceptance.*

* Used with K = K′ in BSD.6/jsw-lower-bound (JSW (7.4.a)–(7.4.b)).


### `BSD.6a/wan-anticyclotomic-divisibility` — The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6) (theorem)

In the setting of anticyclotomic-selmer-control (p ≥ 3 good ordinary or supersingular, with a_p = 0 if p = 3 is supersingular), the BDP–Brooks p-adic L-function L_p(f) ∈ Λ^ur (GZ.9) satisfies the divisibility Ch_{Λ^ur}(X_ac) ⊆ (L_p(f)) in Λ^ur ⊗ ℚ_p, and integrally in Λ^ur under JSW's hypotheses (the μ-part being controlled by Hsieh's theorem); consequently ord_p L_p(f, 1) ≤ ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])) (JSW Proposition 6.2.1).

*Hypotheses and conventions.*

* Inputs are owned elsewhere: the U(3,1) Eisenstein congruences (AutomorphicCongruences L2 for the ordinary FW route, L2s for the semi-ordinary CLW replacement of withdrawn Wan arXiv:1412.1767), Hsieh's μ theorem (AutomorphicPadicLFunctions L3h) and the Eischen–Wan finite-slope families (L4e).
* The divisibility direction is the one giving lower bounds for Sha; the reverse divisibility is not claimed here.

*Proof outline.*

1. Construct the Klingen Eisenstein family on GU(3,1) whose constant term is L_p(f)·(Katz factor) and whose non-degenerate Fourier–Jacobi coefficients are p-adic units (AutomorphicCongruences L2/L2s; Eischen–Wan for finite slope, APL L4e).
2. Lattice construction: the congruence between the Eisenstein family and cusp forms produces Selmer classes, giving Ch(X_ac) ⊆ (L_p(f)) (the Ribet–Urban method).
3. Remove the ambiguity of powers of p: μ(L_p(f)) = 0 by Hsieh (APL L3h) and the comparison of BDP and Hida's two-variable functions (GZ.9/imprimitive-function-dictionary).
4. Specialise at the trivial character with anticyclotomic-selmer-control.

*Uses:* `AutomorphicCongruences:L2`, `AutomorphicCongruences:L2s`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L4e`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `BSD.6a/anticyclotomic-selmer-control`.

*Sources:* jsw, §1.3, p. 3.

*Acceptance.*

* JSW (7.4.a) for K = K′.


### `BSD.6a/bstw-two-variable-zeta-element` — The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW) (construction) — planet *BSTW two-variable zeta element*

Let E/ℚ have conductor N, p ∤ 2N, with a_p = 0 if p = 3 is supersingular, and L an imaginary quadratic field with (D_L, N) = 1, p split in L and E[p](L) = 0 (BSTW (1.3)–(1.5)). There is a zeta element Z^•(E/L) ∈ H¹_{rel,∘}(𝓞_L[1/p], T(1) ⊗̂ Λ_L), Λ_L the two-variable Iwasawa algebra of the ℤ_p²-extension of L, constructed from the Beilinson–Kato elements of the newform and its CM-family companions, with the representation/twist conventions and completed unramified coefficients of BSTW (1.3)–(1.8).

*Hypotheses and conventions.*

* Hypotheses (1.3), (1.4), (1.5) of BSTW; in the supersingular case • ∈ {+, −} and the signed local conditions come from PadicHodgeRegulators L4 (Coleman maps), not from a second definition.
* Ownership (RT-AREA-iwasawa-1/30): this packet is the single owner of the zeta element and of the §9.3.2 comparison; AutomorphicCongruences L5a imports them (restructure proposal).

*Proof outline.*

1. Start from Kato's Beilinson–Kato classes for f and its twists (KatoEulerSystems L2/p-adic-zeta-elements-and-their-norm-relations) and the Hida/CM families of PadicFamilies L1.
2. Interpolate over the two-variable family using Rankin–Selberg zeta elements and the norm relations, as in BSTW §§3–4.
3. Project to the signed (supersingular) or ordinary local components with the Coleman and Perrin-Riou maps (PadicHodgeRegulators L3/crystalline-regulator, L4/signed-local-condition, L4/actual-coleman-image).
4. Integrality: the element lies in the lattice H¹_{rel,∘}(…, T(1) ⊗̂ Λ_L), proved with the integral image index of the Coleman maps (PadicHodgeRegulators L4/integral-image-index).

*Uses:* `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicFamilies:L1/family-measure`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L4/signed-local-condition`, `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/integral-image-index`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

*Sources:* bstw, Theorem 1.14, p. 6; bstw, Remark 1.15(ii), p. 6.

*Uses of the object.* BSTW Proposition 1.19: one-sided divisibilities in the three main conjectures 1.16–1.18 are equivalent through the zeta element. RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture: the comparison and cyclotomic descent of BSTW §§9–10. AutomorphicCongruences:L5a: BCS Theorem 4.1.3's two-variable comparison is BSTW §9.3.2 and must import this element (RT-AREA-iwasawa-1/30).

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.BSD.bstwZetaElement` | constructor | Z^•(E/L) in the two-variable Iwasawa cohomology with the relaxed/signed local condition. |
| `TauCeti.BSD.bstwZetaElement_ne_zero` | other | Z^•(E/L) ≠ 0. |
| `TauCeti.BSD.bstwZetaElement_col` | relation | Col^•_v(loc_v Z^•(E/L)) = L^•_p(E/L) (first explicit reciprocity law). |
| `TauCeti.BSD.bstwZetaElement_log` | relation | Log^•_v(loc_v Z^•(E/L)) = L^Gr_p(E/L) (second explicit reciprocity law). |
| `TauCeti.BSD.bstwZetaElement_cyclotomic` | compatibility | Its image under the projection to the cyclotomic ℤ_p-extension of ℚ is Kato's zeta element up to the Euler factors of BSTW §10. |
| `TauCeti.BSD.bstwZetaElement_twist` | functoriality | Compatible with the twist conventions (1.3)–(1.8) and with changing L within the hypotheses. |

*Unit tests.*

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.BSD.bstwZetaElement_ne_zero_test` | characterisation | Z^•(E/L) ≠ 0 whenever the hypotheses (1.3)–(1.5) hold. |
| `TauCeti.BSD.bstwZetaElement_cyclotomic_test` | compatibility | The cyclotomic specialisation of Z^•(E/L) is Kato's z_γ^{(p)} for E and E^L up to the stated Euler factors. |
| `TauCeti.BSD.bstwZetaElement_requires_split` | non-example | If p is inert in L the construction does not apply: the two-variable signed Coleman maps of BSTW need p = 𝔭𝔭̄ split, and no element is asserted. |
| `TauCeti.BSD.bstwZetaElement_reciprocity_square` | degenerate | At the trivial character, Col^•_v of the specialised element is the value L^•_p(E/L)(1), a unit multiple of L(E,1)L(E^L,1)/(Ω_E Ω_{E^L}) times the Euler factor at p. |

*Acceptance.*

* Its images under the two explicit reciprocity laws are the nonzero p-adic L-functions L^•_p(E/L) and L^Gr_p(E/L), so Z^•(E/L) ≠ 0 (BSTW Remark 1.15(ii)).


### `BSD.6a/bstw-explicit-reciprocity-laws` — The two explicit reciprocity laws for the BSTW zeta element (theorem)

In the setting of bstw-two-variable-zeta-element, Col^•_v(loc_v(Z^•(E/L))) = L^•_p(E/L) and Log^•_v(loc_v(Z^•(E/L))) = L^Gr_p(E/L), where Col^•_v : H¹(L_v, T(1) ⊗ Λ_L) → Λ_L and Log^•_v : H¹_∘(L_v, T(1) ⊗ Λ_L) → Λ_L are Perrin-Riou regulator maps interpolating the Bloch–Kato dual exponential and logarithm, with one common integral normalisation of the two laws.

*Hypotheses and conventions.*

* As bstw-two-variable-zeta-element; the Greenberg-type function L^Gr_p(E/L) is the BDP function of GZ.9 extended in two variables.

*Proof outline.*

1. First law: Kato's explicit reciprocity (KatoEulerSystems L3) interpolated over the family, with the signed Coleman maps of PadicHodgeRegulators L4.
2. Second law: the Perrin-Riou logarithm at the other prime above p, compared with the BDP–Brooks interpolation (GZ.9/bdp-p-adic-l-function, GZ.9/bdp-weight-two-heegner-formula) through the explicit reciprocity of PadicHodgeRegulators L3/explicit-reciprocity.
3. Common normalisation: both are computed with the same integral basis of D_cris and the same CM periods (BSTW §§5–6).

*Uses:* `BSD.6a/bstw-two-variable-zeta-element`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicHodgeRegulators:L3/explicit-reciprocity`, `PadicHodgeRegulators:L4/regulator-coordinate-decomposition`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`.

*Sources:* bstw, Theorem 1.14, p. 6.

*Acceptance.*

* Specialising both laws at the trivial character recovers Kato's reciprocity for E and the BDP formula for E/L.


### `BSD.6a/bstw-signed-main-conjecture` — Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3) (theorem) — planet *Kobayashi's signed main conjecture (BSTW)*

Let E/ℚ be semistable and p > 2 a supersingular prime, with a₃(E) = 0 if p = 3. Then for ∘ ∈ {+, −}, (L^∘_p(E)) = ξ_Λ(X^∘(E)) in Λ = ℤ_p[[Gal(ℚ_∞/ℚ)]], where L^±_p(E) are Pollack's signed p-adic L-functions and X^±(E) the duals of Kobayashi's signed Selmer groups. The same holds for every quadratic twist E^K with D_K coprime to Np and divisible only by primes of ordinary reduction for E. The equality is exported to ModularIwasawaMainConjectures L6.

*Hypotheses and conventions.*

* Exactly BSTW's hypotheses and twist range; Wan arXiv:1411.6352 is withdrawn and superseded in part by BSTW (Remark 1.4); its CM case is Pollack–Rubin.

*Proof outline.*

1. Choose an auxiliary imaginary quadratic L as in bstw-two-variable-zeta-element (BSD.2/heegner-local-conditions selects it).
2. One divisibility in the two-variable Greenberg main conjecture over L from the semi-ordinary GU(3,1) congruences of Castella–Liu–Wan (AutomorphicCongruences L2s) and Hsieh's μ theorem (AutomorphicPadicLFunctions L3h).
3. Transfer it to the signed main conjecture over L through the zeta element and the two reciprocity laws (BSTW Proposition 1.19).
4. The opposite divisibility from Kato's signed Euler-system bound (KatoEulerSystems L4, EulerSystemsAndKolyvaginSystems ES.4, signed local conditions of PadicHodgeRegulators L4).
5. Cyclotomic descent from L to ℚ (BSTW §10), separating E and E^L; track the height-one primes and residual conditions.

*Uses:* `BSD.6a/bstw-explicit-reciprocity-laws`, `BSD.6a/bstw-two-variable-zeta-element`, `AutomorphicCongruences:L2s`, `AutomorphicPadicLFunctions:L3h`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `PadicHodgeRegulators:L4/signed-local-condition`, `ModularSymbolsPadicLFunctions:L4/plus-minus-decomposition`, `ModularIwasawaMainConjectures:L4`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `BSD.2/heegner-local-conditions`.

*Sources:* bstw, Theorem 1.3, p. 3; bstw, Theorem 1.3, p. 3.

*Acceptance.*

* 11a1 at p = 19 (a₁₉ = 0, E[19] irreducible, semistable): both signed main conjectures hold, and so does the twisted statement for E^K with D_K coprime to 11·19 supported at ordinary primes.


### `BSD.6a/bstw-rank-zero-p-part` — Specialisation of the signed main conjecture in rank zero (theorem)

Under the hypotheses of bstw-signed-main-conjecture (E or a permitted twist E^K), if L(E, 1) ≠ 0 then #Ш(E/ℚ)[p^∞]·∏_ℓ c_ℓ(E) and L(E,1)/Ω_E have the same p-adic valuation (the r = 0 case of BSTW Theorem 1.5).

*Hypotheses and conventions.*

* Supersingular p > 2 with a_p = 0 (automatic for p ≥ 5).

*Proof outline.*

1. Specialise (L^+_p(E)) = ξ_Λ(X^+(E)) at the trivial character: L^+_p(E)(1) is a p-adic unit times L(E,1)/Ω_E^+ (interpolation with the factor (p − 1) or 2 from the half-logarithms, ModularSymbolsPadicLFunctions L4/half-logarithms), and Kobayashi's control theorem for the + Selmer group gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ.
2. E(ℚ) is finite (BSD.4) so Sel = Ш[p^∞]; Ω_E^+ versus Ω_E needs the Manin constant prime to p (GZ.3).

*Uses:* `BSD.6a/bstw-signed-main-conjecture`, `ModularSymbolsPadicLFunctions:L4/half-logarithms`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `BSD.4/analytic-rank-zero-theorem`, `GrossZagierAndArithmeticHeights:GZ.3`.

*Sources:* bstw, Theorem 1.5, p. 3.

*Acceptance.*

* BSTW Theorem 1.5 with r = 0.


### `BSD.6a/castella-anticyclotomic-main-conjecture` — Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1) (theorem) — planet *Castella's corrected Theorem 1.1*

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3, K imaginary quadratic with an ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N and p = 𝔭𝔭̄ split. Assume (i) E[p] irreducible; (ii) if 2 is nonsplit in K then 2 ∥ N; (iii) E has nonsplit multiplicative reduction at each prime q ∥ N nonsplit in K, and E[p] is ramified at at least one such q; (iv) E(ℚ_p)[p] = 0. Then Ch_Λ(X_ac(E[p^∞])) is Λ-torsion and Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)), with L_p(f) the BDP-type function of GZ.9/multiplicative-prime-formula.

*Hypotheses and conventions.*

* Exactly the corrected hypotheses; the invalid Hida specialisation step of Castella (2018) Theorem 4.2 is not used, and additive primes are allowed.

*Proof outline.*

1. Choose a Hida family f through the p-stabilised newform and, for each m, a p-ordinary newform g of weight k ≥ 2 and level M with p ∤ M congruent to f modulo p^m (Skinner §3.1's Hida-family/Fitting-ideal argument; requested from ModularIwasawaMainConjectures).
2. For g, the higher-weight main conjecture castella-higher-weight-input gives Ch(X_ac^Σ(A_g)) = (L^Σ_p(g)).
3. castella-higher-weight-input's Lemma 2.1 (needs (iv)) identifies Sel^Σ_p(K, M_f[ϖ^m]) with Sel^Σ_p(K, M_f)[ϖ^m]; Lemma 2.2 (no proper finite-index submodules) turns characteristic ideals into Fitting ideals, which are compatible with the congruence.
4. Congruence of p-adic L-functions modulo p^m (GH.7 big Heegner/BDP families) and letting m → ∞ gives the equality for f; remove Σ-imprimitivity with local factors.

*Uses:* `BSD.6a/castella-higher-weight-input`, `GeneralizedHeegnerCycles:GH.7`, `GrossZagierAndArithmeticHeights:GZ.9/multiplicative-prime-formula`, `ModularIwasawaMainConjectures:L1`, `SelmerIwasawaCohomology:L3/iwasawa-descent`.

*Sources:* castella-erratum, Theorem 1.1, p. 1; castella-erratum, §1, p. 1.

*Acceptance.*

* Castella erratum Theorem 1.1.


### `BSD.6a/castella-higher-weight-input` — The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction (theorem)

(a) (Erratum Theorem 2.3.) Let g ∈ S_k(Γ₀(M)) be a p-ordinary newform of even weight k ≥ 2 and level M ≥ 3 with p ∤ M, and K imaginary quadratic with p split and a Heegner ideal of norm M. Assume ρ̄_g|_{G_K} irreducible; 2 ∥ M if 2 is nonsplit in K; some q ∥ M nonsplit in K; and at every ℓ ∥ M nonsplit in K, π(g)_ℓ is the special representation twisted by the unramified character ℓ ↦ −ℓ^{k/2−1}. Then for every finite set Σ of primes not above p, X^Σ_ac(A_g) is Λ_O-torsion and Ch_{Λ_O}(X^Σ_ac(A_g))Λ^ur_O = (L^Σ_p(g)). (b) (Lemma 2.1.) If Σ contains the primes v ∤ p where T_g ramifies, ρ̄_g|_{G_K} is irreducible and H⁰(K_𝔭, A_g[ϖ]) = 0, then Sel^Σ_p(K, M_g[ϖ^m]) ≅ Sel^Σ_p(K, M_g)[ϖ^m]. (c) (Lemma 2.2.) If X_ac(A_g) is Λ_O-torsion, Sel^Σ_p(K, M_g) has no proper finite-index Λ_O-submodules.

*Hypotheses and conventions.*

* The inputs of (a), as listed by RT-AREA-iwasawa-1/15: Castella–Hsieh (4.7) and §5.2, Castella–Hsieh Theorems 5.7/6.1, Longo–Vigni Theorem 4.7 and Castella Theorems 2.11/5.3 (GeneralizedHeegnerCycles GH.2–GH.7); the reverse divisibility from AutomorphicCongruences L2 (Fouquet–Wan), AutomorphicPadicLFunctions L3h (Hsieh μ) and L4e (Eischen–Wan); Castella–Grossi–Skinner v2 Theorem 6.5.1 and Proposition 2.4.5 (owned by BSD.7a); Fouquet–Ochiai 2012 Corollary 7.2.1 and Lemma 2.14 (requested from AutomorphicCongruences L5a); Burungale–Castella–Kim Theorem 5.2 (requested from HeegnerPointEulerSystems HE.8b); the Chida–Hsieh erratum and the Kobayashi–Ota replacement local-condition proof.

*Proof outline.*

1. (a) Upper divisibility from the generalized Heegner class Kolyvagin system with the Λ-adic bound including the prime (γ⁻ − 1) (Castella–Grossi–Skinner v2 Theorem 6.5.1, from BSD.7a) and the explicit reciprocity of GH.7; lower divisibility from the Fouquet–Wan U(3,1) congruences (AutomorphicCongruences L2) with Hsieh's μ = 0 (APL L3h); combine with the factorisation of Fouquet–Ochiai and the comparison of Burungale–Castella–Kim.
2. (b) Shapiro's lemma and H⁰(K, M_g) = H⁰(K_∞, A_g) = 0 give H¹(G_{K,S}, M_g[ϖ^m]) ≅ H¹(G_{K,S}, M_g)[ϖ^m]; the local kernel at 𝔭 is H⁰(K_𝔭, M_g)/ϖ^m, zero when H⁰(K_𝔭, A_g[ϖ]) = 0.
3. (c) Greenberg's general results (as in Hsieh–Lei and Skinner Proposition 2.3.3).

*Uses:* `GeneralizedHeegnerCycles:GH.7`, `AutomorphicCongruences:L2`, `AutomorphicCongruences:L5a`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L4e`, `BSD.7a`, `HeegnerPointEulerSystems:HE.8b`, `HeegnerPointEulerSystems:HE.8`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds`.

*Sources:* castella-erratum, Theorem 2.3, p. 3; castella-erratum, Lemma 2.1, p. 2; castella-erratum, Remark after Theorem A′, p. 2.

*Acceptance.*

* For g of weight 2 congruent to the p-stabilised form of E, (b) needs E(ℚ_p)[p] = 0: this is where hypothesis (iv) of Theorem 1.1 enters.


**Acceptance tests for BSD.6a.** The layer is accepted when every node above is proved and its acceptance checks hold; in particular:

* Used with K = K′ in BSD.6/jsw-lower-bound (JSW (7.4.a)–(7.4.b)).
* JSW (7.4.a) for K = K′.
* Its images under the two explicit reciprocity laws are the nonzero p-adic L-functions L^•_p(E/L) and L^Gr_p(E/L), so Z^•(E/L) ≠ 0 (BSTW Remark 1.15(ii)).
* Specialising both laws at the trivial character recovers Kato's reciprocity for E and the BDP formula for E/L.
* 11a1 at p = 19 (a₁₉ = 0, E[19] irreducible, semistable): both signed main conjectures hold, and so does the twisted statement for E^K with D_K coprime to 11·19 supported at ordinary primes.
* BSTW Theorem 1.5 with r = 0.


## Requests to other roadmaps

* **GL2AutomorphicRepresentationsAndTransfer:R16.3** (for `BSD.0/twist-root-number`, `BSD.0/congruent-number-root-numbers`, `BSD.0/completed-l-function`): Local ε-factors of GL₂(ℚ_ℓ) representations attached to elliptic curves: w_ℓ = −a_ℓ at multiplicative ℓ, w_ℓ = 1 at good ℓ, the twist formula ε(π ⊗ χ) = χ(−1)-twisted value for unramified π and ramified quadratic χ, and the dyadic values for potentially good reduction needed by the Birch–Stephens table; and the product formula w_E = ∏_v w_v with w_∞ = −1 for weight two.
* **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1** (for `BSD.0/finite-field-twist-trace`, `BSD.0/base-change-factorization`): For an elliptic curve over a finite field 𝔽_q, the trace a_q = q + 1 − #E(𝔽_q) and the relation a_{q²} = a_q² − 2q (equivalently the characteristic polynomial of Frobenius over extensions).
* **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** (for `BSD.0/twist-local-factors`, `BSD.0/base-change-factorization`): Néron–Ogg–Shafarevich and the Galois description of local factors: for ℓ ≠ r, the local polynomial of a minimal model equals det(1 − Frob T | V_r(E)^{I_ℓ}); Tate's algorithm local index c_ℓ = [E(ℚ_ℓ) : E₀(ℚ_ℓ)] and its base change behaviour.
* **tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5** (for `BSD.0/twist-local-factors`): The quadratic twist E.quadraticTwist K and the Galois-twisted point isomorphism (quadraticTwistPointEquiv), together with the identification of V_r(E^K) with V_r(E) ⊗ χ_K as G_ℚ-representations.
* **tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators** (for `BSD.0/completed-l-function`): The normalised Fricke operator 𝒲_N on S₂(Γ₀(N)) and the sign ε_N(f) of a newform under it.
* **tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions** (for `BSD.0/completed-l-function`, `BSD.0/analytic-rank`): Hecke's functional equation Λ_N(2 − s, f) = i² Λ_N(s, 𝒲_N f) for weight two newforms, and the analytic rank of a newform as the order of its entire continuation at s = 1.
* **tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii** (for `BSD.1/rank-splitting`, `BSD.1/quadratic-regulator-comparison`): Mordell–Weil over number fields with the free quotient PointModTorsion and the canonical height, Néron–Tate pairing and regulator (already in Tau Ceti), plus a number-field AdmissibleAbsValues instance so that K-relative heights over quadratic K are defined.
* **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4** (for `BSD.1/odd-selmer-sha-decomposition`, `BSD.1/two-primary-comparison`, `BSD.1/sha-finiteness-descent`, `BSD.1/quadratic-period`): Selmer structures and the groups Sel_{p^∞}(E/F), Ш(E/F) for F = ℚ and quadratic F, with Kummer sequences, restriction/corestriction and inflation–restriction for the forced-discrete coefficient modules E[p^∞] and E(F̄); the real period Ω_E = 2∫_{D_W>0} dx/√D_W of the global minimal model and the arithmetic BSD quotient over ℚ with Ш finite; Cassels' isogeny invariance and isogeny equality of all local Euler factors.
* **MetaplecticAutomorphicForms:MP.7** (for `BSD.2/prescribed-local-conditions-value-branch`, `BSD.2/twist-series-residue`): Half-integral-weight metaplectic Eisenstein and Whittaker kernels with ramified local characters and test functions (Friedberg–Hoffstein's construction), with their Fourier coefficient and Euler-factor identities, so that the twist series with arbitrary prescribed local behaviour (split, inert, ramified) at finitely many primes can be formed.
* **GrossZagierAndArithmeticHeights:GZ.3** (for `BSD.4/kato-p-part-upper-bound`, `BSD.5/rank-zero-rationality`, `BSD.6/jsw-lower-bound`, `BSD.6/jsw-upper-bound`, `BSD.6/rank-zero-ordinary-multiplicative-p-part`): RT-AREA-iwasawa-1/17: a node proving that the Manin constant c of the X₀(N)-optimal curve is a positive integer prime to p for p ∤ 2N·D in the range JSW Remark 7.3.3 uses (Mazur, via Jetchev 2008 §1), checked against later sharpenings, with its transfer across the isogeny class and to the twist E^D; consumed by the Néron-period versus canonical-period comparisons of BSD.4–BSD.6a.
* **GrossZagierAndArithmeticHeights:GZ.5** (for `BSD.5/leading-term-positivity`): RT-AREA-iwasawa-1/16: a node stating L(1/2, π ⊗ χ) ≥ 0 for every cuspidal automorphic representation π of PGL₂ over ℚ and every quadratic Hecke character χ (Waldspurger's period formula, or Guo's relative trace formula, or Lapid–Rallis), with the sign conventions for the unitary normalisation; linked to BSD.5 for the positivity of L(E,1) and L′(E,1).
* **GrossZagierAndArithmeticHeights:GZ.3** (for `BSD.5/rank-zero-rationality`, `BSD.5/ribet-takahashi-degree-comparison`, `BSD.3a/definite-congruence-period`): Rational automorphic realisations and modular degrees: the Manin constant of the optimal parametrisation as a positive integer (with its p-integrality, RT-AREA-iwasawa-1/17), the degrees δ(N⁺, N⁻) of optimal Shimura-curve parametrisations, and the comparison of Néron periods with the modular-symbol periods Ω_f^±.
* **GL2AutomorphicRepresentationsAndTransfer:R17.3** (for `BSD.3a/definite-congruence-period`): The Jacquet–Langlands transfer with integral multiplicity one at a non-Eisenstein maximal ideal: a primitive integral eigenfunction on the definite (or indefinite) quaternion algebra of discriminant N⁻ attached to g, with the freeness of the localised character groups needed for Pollack–Weston Theorem 6.2.
* **ModularIwasawaMainConjectures:L1** (for `BSD.6/rank-zero-ordinary-multiplicative-p-part`): RT-AREA-iwasawa-1/14: a second, weight-two target in the Skinner–Urban Theorem 1 / Skinner Theorem A (p ∤ N) form: p ≥ 3, f ordinary at p, ρ̄ irreducible, and some q ≠ p with q ∥ N and ρ̄ ramified at q; integral equality Ch_Λ(X) = (L_f) in Λ, with its own route (Skinner–Urban plus Kato, integrality as in Skinner's remark after Theorem A). The FW 1.6 form stays as it is.
* **ModularIwasawaMainConjectures:L1** (for `BSD.6/rank-zero-ordinary-multiplicative-p-part`, `BSD.6a/castella-higher-weight-input`): RT-AREA-iwasawa-1/4 (a): a new ModularIwasawaMainConjectures layer beside L1 proving Skinner's Theorem A for p ∥ N (weight two, ordinary at p, ρ̄ irreducible, q ≠ p with q ∥ N and ρ̄ ramified at q) by the Hida-family deduction from the p ∤ N case with the Fitting-ideal argument of Skinner §3.1. Until that layer exists, this request is routed to L1 as its nearest owner.
* **PadicFamilies:L3** (for `BSD.6/cyclotomic-specialization-formula`, `BSD.6/rank-zero-ordinary-multiplicative-p-part`): RT-AREA-iwasawa-1/4 (b): the Greenberg–Stevens theorem (Invent. Math. 111 (1993), Theorem 7.1): for f of weight two with split multiplicative reduction at p, L′_p(f, 1) = L(V_f)·L_alg(f, 1) with L(V_f) = log_p(q_E)/ord_p(q_E), including the Mazur–Kitagawa two-variable p-adic L-function it uses.
* **DiophantineApproximationAndTranscendence:DT.5** (for `BSD.6/cyclotomic-specialization-formula`, `BSD.6/rank-zero-ordinary-multiplicative-p-part`): RT-AREA-iwasawa-1/4 (c): transcendence of the Tate period q_E when j(E) is algebraic (Barré-Sirieix–Diaz–Gramain–Philibert 1996), hence log_p q_E ≠ 0 and L(V_f) ≠ 0 for every elliptic curve over ℚ with split multiplicative reduction at p.
* **ModularIwasawaMainConjectures:L0** (for `BSD.6/cyclotomic-specialization-formula`): The ordinary Greenberg Selmer group, its dual X over the cyclotomic Iwasawa algebra and the formulation Ch_Λ(X) = (L_f) with canonical integral periods and primitive/imprimitive conventions, as consumed by the specialisation at the trivial character.
* **SerreWeightAndLevelOptimisation:R20.2** (for `BSD.6/residually-ramified-prime`): Ribet's level-lowering theorem away from p (Rib90, Theorem 1.1) for weight two newforms with trivial character: if ρ̄_{f,p} is irreducible and unramified at q ∥ N, q ≠ p, there is a newform of level N/q with the same residual representation.
* **AutomorphicCongruences:L2** (for `BSD.6a/wan-anticyclotomic-divisibility`, `BSD.6a/castella-higher-weight-input`): Fouquet–Wan's U(3,1) Eisenstein congruence divisibility (the lower bound on characteristic ideals of anticyclotomic and two-variable Selmer groups by p-adic L-functions) for p-ordinary newforms of even weight, with the exceptional height-one primes treated, as used by JSW §6 (through Wan) and by Castella's erratum Theorem 2.3.
* **AutomorphicCongruences:L2s** (for `BSD.6a/wan-anticyclotomic-divisibility`, `BSD.6a/bstw-signed-main-conjecture`): Castella–Liu–Wan's semi-ordinary GU(3,1) congruence divisibility (the replacement of withdrawn Wan arXiv:1412.1767) at good supersingular p with a_p = 0, giving one divisibility of the two-variable Greenberg main conjecture over an auxiliary imaginary quadratic L.
* **AutomorphicCongruences:L5a** (for `BSD.6a/castella-higher-weight-input`, `BSD.6a/bstw-two-variable-zeta-element`): RT-AREA-iwasawa-1/15 and /30: (i) Fouquet–Ochiai 2012 Corollary 7.2.1 and Lemma 2.14 (factorisation of the two-variable p-adic L-function into Rankin/Katz factors), consumed by Castella's corrected proof; (ii) L5a must import the BSTW two-variable zeta element and the §9.3.2 comparison from RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element instead of planning them.
* **AutomorphicPadicLFunctions:L3h** (for `BSD.6a/wan-anticyclotomic-divisibility`, `BSD.6a/bstw-signed-main-conjecture`, `BSD.6a/castella-higher-weight-input`): Hsieh's toric BDP measure and μ = 0 theorem for the anticyclotomic p-adic L-function of a weight-two (and higher even weight) newform, with its CM periods and hypotheses (squarefree N⁻, local root number conditions).
* **AutomorphicPadicLFunctions:L4e** (for `BSD.6a/wan-anticyclotomic-divisibility`, `BSD.6a/castella-higher-weight-input`): Eischen–Wan finite-slope Klingen families on definite GU(2,0)/GU(3,1) with their constant-term divisibility (Theorem 5.8, Corollary 5.9), used for the finite-slope (supersingular) congruence argument.
* **GeneralizedHeegnerCycles:GH.7** (for `BSD.6a/castella-higher-weight-input`, `BSD.6a/castella-anticyclotomic-main-conjecture`): Castella–Hsieh (4.7), §5.2 and Theorems 5.7/6.1, Longo–Vigni Theorem 4.7 and Castella Theorems 2.11/5.3: big Heegner/generalized Heegner classes in Hida families, their two-variable explicit reciprocity and the congruence of BDP p-adic L-functions along the family, with the Chida–Hsieh erratum and the Kobayashi–Ota local-condition replacement.
* **HeegnerPointEulerSystems:HE.8b** (for `BSD.6a/castella-higher-weight-input`): RT-AREA-iwasawa-1/15: Burungale–Castella–Kim Theorem 5.2, consumed by Castella's corrected Theorem 1.1.
* **HeegnerPointEulerSystems:HE.8** (for `BSD.6a/castella-higher-weight-input`): Λ-adic Heegner classes over the anticyclotomic tower with nonvanishing (Cornut–Vatsal) at an ordinary prime, as an input of the Kolyvagin-system bound in Castella's corrected proof.
* **ModularIwasawaMainConjectures:L4** (for `BSD.6a/bstw-signed-main-conjecture`): The signed (Kobayashi/Pollack) local conditions and the formulation of the signed main conjecture with Pollack's L^±_p, to which BSD.6a exports BSTW Theorem 1.3 through L6; only the formulation and the FW/LLZ consequence are imported.

## Recorded gaps

* **Friedberg–Hoffstein Theorem B not read.** Friedberg–Hoffstein, Nonvanishing theorems for automorphic L-functions on GL(2), Annals of Math. 142 (1995), Theorem B, is used through JSW's citation only; the paper is not publicly available. Its statement (arbitrary prescribed local conditions compatible with sign +1) and the double-cover construction must be read and checked before RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch is proved.
* **Exact powers of 2 in the quadratic period and Tamagawa comparisons.** BSD.1/quadratic-period states Ω_E·Ω_{E^K}·|D|^{1/2} = 2^e·Ω_{E/K} with e determined by c∞(E), c∞(E^K) and the dyadic Néron-lattice change, and BSD.1/tamagawa-base-change is proved for odd p only. The explicit e and the 2-part of ∏_w c_w(E/K) versus c_ℓ(E)c_ℓ(E^K) at dyadic and ramified places are not established; they are needed only for statements at p = 2 (BSD.8/BSD.9).
* **Number-field heights at the pinned Tau Ceti.** K-relative canonical heights over imaginary quadratic K need an AdmissibleAbsValues instance for number fields, which Tau Ceti f790474 lacks (the GZ.0 gap); BSD.1/quadratic-regulator-comparison and BSD.5/heegner-index-height-formula are stated for that instance.
* **Birch–Stephens dyadic root numbers not read.** The values w_2(E^(n)) for E : y² = x³ − x and n mod 8 are taken from Birch–Stephens (Topology 5, 1966) through Burungale–Tian's footnote 2; the paper is not publicly available, and the local computation (or Rohrlich's formula for dyadic potentially good reduction) must be read before RankZeroOneBSD:BSD.0/congruent-number-root-numbers is proved.

## Mistakes found in the sources

* **RankZeroOneBSD/E1** (error, castella-cjm, Theorem A and the proof of Theorem 4.4 (via Theorem 4.2), arXiv:1704.06608v2 = Cambridge J. Math. 6 (2018) 1–23): printed “Let E/Q be a semistable elliptic curve of conductor N with ords=1 L(E, s) = 1, and let p > 3 be a prime such that the mod p Galois representation ρ̄E,p is irreducible. If p | N , assume in addition that E[p] is ramified at some prime q ≠ p.” Correction: For p ∥ N the theorem holds under the corrected hypotheses of Theorem A′: E[p] irreducible, nonsplit multiplicative reduction at some q ≠ p where E[p] is ramified, and E(ℚ_p)[p] = 0 (semistability no longer needed). Reason: The proof of Theorem 4.4 uses a point φ in the weight space of a Hida family through a p-new weight-two form whose existence is not guaranteed (Castella's erratum, §1). Known: Castella, Erratum to 'On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes' (author's homepage, 2024).
* **RankZeroOneBSD/E2** (gap, jsw, Theorem 7.2.1(iii) and its attribution, p. 42 ([Wan14b, Cor. 4.8])): printed “and that of part (iii) for the supersingular case is a consequence of the proof of Kobayashi’s main conjecture [Wan14b, Cor.4.8].” Correction: Cite Burungale–Skinner–Tian–Wan, arXiv:2409.01350v2, Theorems 1.3 and 1.5 (r = 0), which prove Kobayashi's main conjecture for semistable E and the permitted twists. Reason: The cited preprint (Wan arXiv:1411.6352) was withdrawn and its pertinent parts superseded (BSTW Remark 1.4), so the supersingular rank-zero input of JSW rests on BSTW. Known: BSTW arXiv:2409.01350v2, Remark 1.4.

## Confirmed red-team findings handled in this part

* **RT-AREA-iwasawa-1/4.** BSD.6/cyclotomic-specialization-formula proves the Selmer-side trivial-zero comparison (Skinner §3.2) and BSD.6/rank-zero-ordinary-multiplicative-p-part consumes (a) Skinner's Theorem A for p ∥ N (request to ModularIwasawaMainConjectures, routed to L1 until the new layer exists), (b) Greenberg–Stevens (request to PadicFamilies L3) and (c) transcendence of q_E (request to DiophantineApproximationAndTranscendence DT.5). The multiplicative rank-zero branch is kept, with these inputs explicit.
* **RT-AREA-iwasawa-1/14.** BSD.6/rank-zero-ordinary-multiplicative-p-part states the Skinner–Urban residual hypothesis (q ∥ N, ρ̄ ramified at q) and consumes a requested SU-form target in ModularIwasawaMainConjectures L1; the FW 1.6 form is not used.
* **RT-AREA-iwasawa-1/15.** BSD.6a/castella-higher-weight-input names Castella CJM 2018 with its 2024 erratum (Theorem 1.1, Theorem A′) and lists CGS v2 Theorem 6.5.1 and Proposition 2.4.5 (prerequisite stage BSD.7a; acyclic), Fouquet–Ochiai Corollary 7.2.1 and Lemma 2.14 (request to AutomorphicCongruences L5a), Skinner §3.1 (request to ModularIwasawaMainConjectures) and Burungale–Castella–Kim Theorem 5.2 (request to HE.8b).
* **RT-AREA-iwasawa-1/16.** Request to GrossZagierAndArithmeticHeights GZ.5 for L(1/2, π ⊗ χ) ≥ 0; BSD.5/leading-term-positivity derives positivity of L(E,1) and L′(E,1) from it and the Gross–Zagier sign, and BSD.5/rational-bsd-defect states positivity as depending on it.
* **RT-AREA-iwasawa-1/17.** Request to GrossZagierAndArithmeticHeights GZ.3 for p-integrality of the Manin constant (Mazur, via Jetchev §1) with isogeny and twist transfer; listed as an input of BSD.4/kato-p-part-upper-bound, BSD.5/rank-zero-rationality, BSD.6/jsw-lower-bound, BSD.6/jsw-upper-bound, BSD.6/rank-zero-ordinary-multiplicative-p-part and BSD.6a/bstw-rank-zero-p-part.
* **RT-AREA-iwasawa-1/30.** The BSTW zeta element (Theorem 1.14) and both reciprocity laws are planned once, in BSD.6a/bstw-two-variable-zeta-element and BSD.6a/bstw-explicit-reciprocity-laws; a restructure proposal moves them to an early sub-layer BSD.6z feeding both BSD.6a and AutomorphicCongruences L5a, and a request tells L5a to import them.

## Structural proposals

* **split** (RankZeroOneBSD, HeegnerPointEulerSystems). HeegnerPointEulerSystems HE.6/ribet-takahashi-tamagawa-comparison needs the definite congruence-period identity, which BSD.5 owns (Ribet–Takahashi character-group calculation), but BSD.5 depends on HE.6 through BSD.3–BSD.4, so the stage edge BSD.5 → HE.6 would create a cycle. The independent HE.0 review requested an early export. *Proposal:* Create sub-layer RankZeroOneBSD:BSD.3a 'Definite congruence periods' containing RankZeroOneBSD:BSD.3a/definite-congruence-period (planned here under BSD.5). It requires NeronModelsAndSemistableAbelianVarieties R11.4 and R11.6, GL2AutomorphicRepresentationsAndTransfer R17.3 and GrossZagierAndArithmeticHeights GZ.3, and has consumers HeegnerPointEulerSystems HE.6 and RankZeroOneBSD BSD.5 (ribet-takahashi-degree-comparison). It does not depend on HE.6, rank-zero BSD, Jochnowitz congruences or the Heegner index.
* **split** (RankZeroOneBSD, AutomorphicCongruences). RT-AREA-iwasawa-1/30: the BSTW two-variable zeta element and the §9.3.2 comparison are needed by BSD.6a and by AutomorphicCongruences L5a; BSD.6a also consumes L5a's Fouquet–Ochiai factorisation (RT-AREA-iwasawa-1/15), so the zeta element cannot live in BSD.6a without a stage cycle BSD.6a → L5a → BSD.6a. *Proposal:* Create sub-layer RankZeroOneBSD:BSD.6z 'Two-variable zeta elements and their reciprocity laws' containing RankZeroOneBSD:BSD.6a/bstw-two-variable-zeta-element and RankZeroOneBSD:BSD.6a/bstw-explicit-reciprocity-laws (planned here under BSD.6a). It requires KatoEulerSystems L2–L3, PadicFamilies L1, PadicHodgeRegulators L3–L4, GrossZagierAndArithmeticHeights GZ.9 and SelmerIwasawaCohomology L3, and has consumers RankZeroOneBSD BSD.6a and AutomorphicCongruences L5a. Both new edges are acyclic in the current graph.
* **rescope** (RankZeroOneBSD). The atlas gives BSD.6a the same description as BSD.6 (the text of both milestones), so the two stages read as duplicates in the atlas. *Proposal:* Give BSD.6 the first milestone (the named prime-part theorems: Skinner–Urban/Skinner rank zero, BSTW supersingular rank zero, Jetchev–Skinner–Wan, Castella A′) and BSD.6a the second (anticyclotomic control and divisibility, BSTW zeta element, signed main conjecture, Castella's corrected Theorem 1.1), as this packet's nodes do.

## Notes for the Tau Ceti maintainers

* (tauceti:TauCetiRoadmap/EllipticCurves) Layer 6 pins ĥ(P) = lim h(x(nP))/n² and says the regulator and the BSD quotient of Layer 7 are stated against it, but the implemented canonicalHeight at f790474 is half of that (the (O)-normalised height) and regulator is the Gram determinant of its halved polar form; the BSD quotient therefore needs Reg_BSD = 2^r·regulator (GrossZagierAndArithmeticHeights GZ.0). This packet states its defect with Reg_BSD.
* (tauceti:TauCetiRoadmap/EllipticCurves) Mathlib's WeierstrassCurve.LSeries is a tsum and equals 0 wherever the series is not absolutely summable (Re s ≤ 3/2 in the elliptic case); Layer 7's statement-only BSD milestone already asks for a continuation agreeing with the Dirichlet series on part of its half-plane, and Tau Ceti's LSeries.HasEntireExtension is the right carrier for it.

## Suggested Lean file

`research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean` states the definitions of BSD.0 (`ellipticL`, `completedEllipticL`, `rootNumber`, `analyticRank`, `leadingTerm`), the point maps and period of BSD.1, the local prescriptions of BSD.2, the rank theorem of BSD.3–BSD.4, the rational BSD defect and the Heegner index of BSD.5, with their API lemmas and unit tests as `example`s; no proof is given there. Invariants owned by layers not yet in the libraries (the conductor, Ω_E, Ш, Tamagawa numbers, Reg_BSD) are explicit data placeholders, never `Prop` fields. The BSTW zeta element of BSD.6a, whose carrier (two-variable Iwasawa cohomology with signed local conditions) is absent, is recorded in the file by name only, and the Iwasawa-theoretic theorems of BSD.6–BSD.6a are stated in this document.
