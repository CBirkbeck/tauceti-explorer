/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap document
(research/blueprint/readmes/RankZeroOneBSD--BSD.9.md) is definitive. The statements below suggest Lean
forms so that contributors and reviewers converge on names and signatures. Every `sorry` is intentional.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Stage BSD.9 of RankZeroOneBSD, a follow-up of the BSD.7 packet. Only statements whose carriers exist at the pins
are typed here: the coefficient bound for Mathlib's `WeierstrassCurve.LFunction`, the bounds and series of the
exponential integral (written as the integral itself; the function is QSeries QM.3's `Γ(0, x)`), the explicit sums
and tails of the nonvanishing criterion, and the reduction statement behind rational `p`-torsion at a good odd
prime. The endpoints, the `p`-part proposition and the criterion's conclusions need RankZeroOneBSD's `ellipticL`,
`analyticRank`, `bsdDefect` and Ш; they are listed in the closing comment.
-/
import Mathlib

open Real

namespace WeierstrassCurve.BSD

/-! ## The coefficient bound (RankZeroOneBSD:BSD.9/coefficient-bound) -/

/-- The divisor-count bound `σ₀(n) ≤ 2√n` (pair each divisor `d ≤ √n` with `n / d`). -/
theorem sigma_zero_le_two_mul_sqrt (n : ℕ) :
    (ArithmeticFunction.sigma 0 n : ℝ) ≤ 2 * Real.sqrt n := by
  sorry

/-- `|a_n| ≤ σ₀(n)·√n` for the coefficients of the L-function of an elliptic curve over `ℚ`. -/
theorem abs_LFunction_le_sigma_mul_sqrt (W : WeierstrassCurve ℚ) [W.IsElliptic] (n : ℕ) :
    |(W.LFunction n : ℝ)| ≤ (ArithmeticFunction.sigma 0 n : ℝ) * Real.sqrt n := by
  sorry

/-- The linear form `|a_n| ≤ 2n` used in the tails of the nonvanishing criterion. -/
theorem abs_LFunction_le_two_mul (W : WeierstrassCurve ℚ) [W.IsElliptic] (n : ℕ) :
    |(W.LFunction n : ℝ)| ≤ 2 * n := by
  sorry

/-! ## The exponential integral (RankZeroOneBSD:BSD.9/exponential-integral-bounds)

`E₁(x) = ∫_x^∞ e^{-t}/t dt` is written as the integral: the function is the upper incomplete gamma function
`Γ(0, x)` of QSeriesPartitionsAndMockModularForms QM.3, which is not at the pins. -/

/-- Lower bound `e^{-x}/(x+1) < E₁(x)` for `x > 0` (DLMF 6.8.2). -/
theorem exp_neg_div_add_one_lt_expIntegral {x : ℝ} (hx : 0 < x) :
    Real.exp (-x) / (x + 1) < ∫ t in Set.Ioi x, Real.exp (-t) / t := by
  sorry

/-- Upper bound `E₁(x) < e^{-x}/x` for `x > 0` (DLMF 6.8.2). -/
theorem expIntegral_lt_exp_neg_div {x : ℝ} (hx : 0 < x) :
    ∫ t in Set.Ioi x, Real.exp (-t) / t < Real.exp (-x) / x := by
  sorry

/-- The series `E₁(x) = -γ - log x + Σ_{n ≥ 1} (-1)^{n+1} x^n / (n · n!)` (DLMF 6.6.2), in the form
`Σ_{m ≥ 0} (-1)^m x^{m+1} / ((m+1)(m+1)!) = γ + log x + E₁(x)`. -/
theorem hasSum_expIntegral_series {x : ℝ} (hx : 0 < x) :
    HasSum (fun m : ℕ => (-1 : ℝ) ^ m * x ^ (m + 1) / ((m + 1 : ℝ) * (m + 1).factorial))
      (Real.eulerMascheroniConstant + Real.log x + ∫ t in Set.Ioi x, Real.exp (-t) / t) := by
  sorry

/-! ## Explicit sums and tails of the nonvanishing criterion
(RankZeroOneBSD:BSD.9/explicit-nonvanishing-criterion)

With `β = 2π/√N` and `ρ = e^{-β}`: `S₀(M) = 2 Σ_{n ≤ M} (a_n/n) e^{-βn}`, `S₁(M) = 2 Σ_{n ≤ M} (a_n/n) E₁(βn)`,
`T₀(M) = 4ρ^{M+1}/(1-ρ)` and `T₁(M) = 4ρ^{M+1}/(β(M+1)(1-ρ))`. The criterion itself (if the root number is `+1`
and `|S₀| > T₀` then the analytic rank is `0`, and similarly for `-1`) needs `ellipticL` and is a roadmap target. -/

/-- `β = 2π/√N`. -/
noncomputable def centralBeta (N : ℕ) : ℝ := 2 * π / Real.sqrt N

/-- `S₀(M) = 2 Σ_{1 ≤ n ≤ M} (a_n/n) e^{-βn}`. -/
noncomputable def centralValueSum (a : ℕ → ℤ) (N M : ℕ) : ℝ :=
  2 * ∑ n ∈ Finset.Icc 1 M, (a n : ℝ) / n * Real.exp (-(centralBeta N * n))

/-- `S₁(M) = 2 Σ_{1 ≤ n ≤ M} (a_n/n) E₁(βn)`. -/
noncomputable def centralDerivativeSum (a : ℕ → ℤ) (N M : ℕ) : ℝ :=
  2 * ∑ n ∈ Finset.Icc 1 M, (a n : ℝ) / n * ∫ t in Set.Ioi (centralBeta N * n), Real.exp (-t) / t

/-- `T₀(M) = 4ρ^{M+1}/(1-ρ)`. -/
noncomputable def centralValueTail (N M : ℕ) : ℝ :=
  4 * Real.exp (-centralBeta N) ^ (M + 1) / (1 - Real.exp (-centralBeta N))

/-- `T₁(M) = 4ρ^{M+1}/(β(M+1)(1-ρ))`. -/
noncomputable def centralDerivativeTail (N M : ℕ) : ℝ :=
  4 * Real.exp (-centralBeta N) ^ (M + 1) /
    (centralBeta N * (M + 1) * (1 - Real.exp (-centralBeta N)))

/-- The tails are positive for a positive conductor. -/
theorem centralValueTail_pos {N : ℕ} (hN : 0 < N) (M : ℕ) : 0 < centralValueTail N M := by
  sorry

theorem centralDerivativeTail_pos {N : ℕ} (hN : 0 < N) (M : ℕ) : 0 < centralDerivativeTail N M := by
  sorry

/-- The tails decrease with the cutoff. -/
theorem centralValueTail_succ_lt {N : ℕ} (hN : 0 < N) (M : ℕ) :
    centralValueTail N (M + 1) < centralValueTail N M := by
  sorry

/-! ## Rational `p`-torsion at a good odd prime
(RankZeroOneBSD:BSD.9/rational-torsion-eisenstein-ordinary, part (i))

Stated for an integral model with `p ∤ Δ`, so that the model has good reduction at `p`. -/

/-- A rational point of odd prime order `p` on an integral model with good reduction at `p` reduces injectively,
so `p` divides the number of points of the reduction. -/
theorem prime_dvd_card_reduction_of_addOrderOf (W : WeierstrassCurve ℤ) {p : ℕ} [Fact p.Prime]
    (hp : p ≠ 2) (hΔ : ¬ (p : ℤ) ∣ W.Δ) (P : (W.baseChange ℚ).toAffine.Point) (hP : addOrderOf P = p) :
    p ∣ Nat.card (W.map (Int.castRingHom (ZMod p))).toAffine.Point := by
  sorry

/-- Equivalently the Frobenius trace `a_p = p + 1 - #Ẽ(𝔽_p)` is `≡ 1 (mod p)`; in particular `p ∤ a_p`, so the
reduction is ordinary. -/
theorem trace_modEq_one_of_addOrderOf (W : WeierstrassCurve ℤ) {p : ℕ} [Fact p.Prime]
    (hp : p ≠ 2) (hΔ : ¬ (p : ℤ) ∣ W.Δ) (P : (W.baseChange ℚ).toAffine.Point) (hP : addOrderOf P = p) :
    ((p : ℤ) + 1 - Nat.card (W.map (Int.castRingHom (ZMod p))).toAffine.Point) ≡ 1 [ZMOD p] := by
  sorry

end WeierstrassCurve.BSD

/-! ## Statements not typed at the pins

They need RankZeroOneBSD's `ellipticL`, `rootNumber`, `analyticRank`, `leadingTerm` (BSD.0), `bsdDefect` (BSD.5),
Ш(E/ℚ) and the Layer 7 BSD statement of EllipticCurves, the newform and modular-symbol carriers of
EllipticCurveModularity and ModularSymbolsPadicLFunctions, or the Heegner carriers of HeegnerPointEulerSystems.

- prime-part-formula: `WeierstrassCurve.BSD.PrimePartFormula`, `primePartFormula_iff_valuation`,
  `primePartFormula_iff_primary`, `primePartFormula_of_isogenous`, `forall_primePartFormula_iff`,
  `primePartFormula_of_bsdDefect_eq_one`; tests `primePartFormula_test_torsion_square`,
  `primePartFormula_test_away_from_support`, `primePartFormula_test_odd_not_full`,
  `primePartFormula_test_ky_form`, `primePartFormula_test_dyadic_regulator`.
- ec-bsd-statement-compatibility, public-rank-endpoint, public-sha-endpoint, public-fixed-prime-endpoint,
  public-full-endpoint.
- explicit-nonvanishing-criterion (its conclusions about `ellipticL E 1`, its derivative and `analyticRank`).
- manin-closing-the-path, exact-rank-zero-quotient.
- rational-torsion-eisenstein-ordinary parts (ii)–(iv), cm-branch-range, dyadic-branch-exclusion.
- odd-sha-from-heegner-index, gross-37a-sha-vanishing.
- conditional-fixture-ranks, conditional-eisenstein-five, conditional-sha-vanishing-fixtures,
  conditional-full-formula.
-/
