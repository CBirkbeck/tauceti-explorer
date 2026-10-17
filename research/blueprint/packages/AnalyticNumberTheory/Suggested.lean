import Mathlib

/-!
# AnalyticNumberTheory: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. The choices made explicit
are inclusive arithmetic cutoffs, analytic pole cancellation, conductor-aware conditional
hypotheses, actual ideal counts, indexed Beurling primes, principal-branch convergent series,
and the product normalization of Barnes G. Heavy continuation, arithmetic-geometric and
operator-algebra constructions remain mathematical targets in README.md.
-/

noncomputable section

open Filter Topology Asymptotics Complex HurwitzZeta
open scoped BigOperators nonZeroDivisors NumberField

namespace TauCetiRoadmap.AnalyticNumberTheory

/-! ## Layer 0: Entire functions and quantitative prime estimates -/

section AN2

/-- The Chebyshev sum `θ(x; a, q)` over primes `p ≤ x` with `p ≡ a mod q`,
inclusive real cutoff. No coprimality is built in; asymptotic theorems assume it. -/
def thetaAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ p ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- At level one the progression sum is Mathlib's `θ`. -/
theorem thetaAP_one (x : ℝ) : thetaAP 1 0 x = Chebyshev.theta x := by
  sorry

/-- Summing over all residue classes recovers `θ`. -/
theorem sum_thetaAP (q : ℕ) [NeZero q] (x : ℝ) :
    ∑ a : ZMod q, thetaAP q a x = Chebyshev.theta x := by
  sorry

/-- `θ(1; a, q) = 0`. -/
example (q : ℕ) (a : ZMod q) : thetaAP q a 1 = 0 := by
  sorry

/-- `θ(5; 3, 8) = log 3` and `θ(5; 5, 8) = log 5`. -/
example : thetaAP 8 3 5 = Real.log 3 ∧ thetaAP 8 5 5 = Real.log 5 := by
  sorry

/-- The noncoprime class `0 mod 2` contains only the prime `2`. -/
example {x : ℝ} (hx : 2 ≤ x) : thetaAP 2 0 x = Real.log 2 := by
  sorry

/-- The inclusive progression ψ agrees with the ordinary ψ at level one. -/
example (x : ℝ) : psiAP 1 0 x = Chebyshev.psi x := by
  sorry

/-- At cutoff three there is exactly one prime in the class three modulo four. -/
example : primeCountAP 4 3 3 = 1 := by
  sorry

/-- `β` is a `c`-exceptional real zero of the primitive
nonprincipal quadratic character `χ` of conductor `N > 1`. No zero is asserted to exist. -/
def IsExceptionalRealZero (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (β : ℝ) :
    Prop :=
  0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
    1 - c / Real.log N < β ∧ β < 1 ∧ DirichletCharacter.LFunction χ β = 0

/-- Increasing the positive width parameter enlarges the exceptional-zero region. -/
theorem IsExceptionalRealZero.mono {c c' : ℝ} {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {β : ℝ} (h : IsExceptionalRealZero c χ β) (hc : c ≤ c') : IsExceptionalRealZero c' χ β := by
  sorry

/-- `β = 1` is never exceptional. -/
example (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ¬ IsExceptionalRealZero c χ 1 := by
  sorry

/-- The entire Riemann `ξ`, written through Mathlib's entire
`completedRiemannZeta₀`, so that no junk value at `s = 0, 1` enters. -/
def riemannXi (s : ℂ) : ℂ :=
  1 / 2 + 1 / 2 * s * (s - 1) * completedRiemannZeta₀ s

/-- Away from `0` and `1`, `ξ(s) = s(s-1)Λ(s)/2`. -/
theorem riemannXi_eq {s : ℂ} (hs₀ : s ≠ 0) (hs₁ : s ≠ 1) :
    riemannXi s = 1 / 2 * s * (s - 1) * completedRiemannZeta s := by
  sorry

/-- The pole-cancelled xi function is invariant under s ↦ 1 − s. -/
theorem riemannXi_one_sub (s : ℂ) : riemannXi (1 - s) = riemannXi s := by
  sorry

/-- At zero, xi has value one half. -/
example : riemannXi 0 = 1 / 2 := by
  sorry

/-- `f` is entire of order at most `ρ` (an upper-order predicate). -/
def EntireOrderAtMost (ρ : ℝ) (f : ℂ → ℂ) : Prop :=
  0 ≤ ρ ∧ Differentiable ℂ f ∧ ∀ b > ρ, ∃ C > 0, ∀ z : ℂ, ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)

/-- The exponential has upper order one. -/
example : EntireOrderAtMost 1 Complex.exp := by
  sorry

/-- `exp (z²)` has order `2`, not at most `1`. -/
example : ¬ EntireOrderAtMost 1 fun z => Complex.exp (z ^ 2) := by
  sorry

/-- A bound `exp (C |z| log (2 + |z|))` gives order at most one. -/
example (f : ℂ → ℂ) (hf : Differentiable ℂ f) (C : ℝ)
    (h : ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * ‖z‖ * Real.log (2 + ‖z‖))) : EntireOrderAtMost 1 f := by
  sorry

/-- `ξ` is entire of order at most one. -/
theorem entireOrderAtMost_riemannXi : EntireOrderAtMost 1 riemannXi := by
  sorry

/-- The Riemann zeta function has a classical zero-free region at large positive height. -/
theorem classical_zero_free_region :
    ∃ c > 0, ∃ t₀ > 1, ∀ s : ℂ, t₀ ≤ s.im → 1 - c / Real.log s.im ≤ s.re → riemannZeta s ≠ 0 := by
  sorry

/-- Siegel–Walfisz in ψ form, uniformly for q ≤ (log x)^B; the constant can be ineffective. -/
theorem siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |psiAP q a x - x / q.totient| ≤ C * x * Real.log x ^ (-A) := by
  sorry

/-- Explicit two-sided bounds for `π(x)` when `x ≥ 59`. -/
theorem rosser_schoenfeld_primeCounting {x : ℝ} (hx : 59 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- The unconditional Schoenfeld upper bound holds for every positive real cutoff. -/
theorem theta_lt {x : ℝ} (hx : 0 < x) : Chebyshev.theta x < 1.000081 * x := by
  sorry

end AN2

/-! ## Layer 1: Explicit formulas, mean values and conditional prime estimates -/

section AN3

/-- The explicit formula and zero-free region give the de la Vallée Poussin error term. -/
theorem abs_psi_sub_self_le :
    ∃ c > 0, ∃ C > 0, ∀ᶠ x in atTop,
      |Chebyshev.psi x - x| ≤ C * x * Real.exp (-c * Real.sqrt (Real.log x)) := by
  sorry

/-- The Riemann hypothesis for one Dirichlet `L`-function.
`0 < re s` removes trivial zeros and the zeros of missing Euler factors; the pole of the principal
character is excluded. -/
def DirichletGRH {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The generalized Riemann hypothesis for all Dirichlet characters. A statement only. -/
def GRH : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), DirichletGRH χ

/-- At conductor one, Dirichlet GRH is Mathlib’s Riemann hypothesis. -/
theorem dirichletGRH_one_iff_riemannHypothesis :
    DirichletGRH (1 : DirichletCharacter ℂ 1) ↔ RiemannHypothesis := by
  sorry

/-- GRH for all Dirichlet characters implies the Riemann hypothesis. -/
theorem GRH.riemannHypothesis (h : GRH) : RiemannHypothesis := by
  sorry

/-- A zero with real part three quarters refutes both the individual and universal predicates. -/
example {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (t : ℝ)
    (hz : DirichletCharacter.LFunction χ (3 / 4 + t * I) = 0) :
    ¬ DirichletGRH χ ∧ ¬ GRH := by
  sorry

/-- Under Dirichlet GRH, every nontrivial zero has real part one half. -/
theorem DirichletGRH.re_eq_half {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (h : DirichletGRH χ) {s : ℂ} (hs : 0 < s.re) (hχ : χ ≠ 1 ∨ s ≠ 1)
    (hz : DirichletCharacter.LFunction χ s = 0) : s.re = 1 / 2 :=
  by
    sorry

/-- Under RH, ψ has square-root error with any positive power loss. -/
theorem psi_sub_self_isBigO_of_riemannHypothesis (h : RiemannHypothesis) {ε : ℝ} (hε : 0 < ε) :
    (fun x => Chebyshev.psi x - x) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- For a fixed modulus, character-wise GRH gives the corresponding progression error. -/
theorem psiAP_isBigO_of_dirichletGRH (q : ℕ) [NeZero q]
    (h : ∀ χ : DirichletCharacter ℂ q, DirichletGRH χ) (a : ZMod q) (ha : IsUnit a) {ε : ℝ}
    (hε : 0 < ε) :
    (fun x => psiAP q a x - x / q.totient) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- `|Γ(x + iy)| ~ √(2π) |y|^(x - 1/2) e^(-π|y|/2)` as
`|y| → ∞`, uniformly for `x` in a compact interval. -/
theorem uniform_complex_stirling (a b : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ Y > 0, ∀ x ∈ Set.Icc a b, ∀ y : ℝ, Y ≤ |y| →
      |‖Complex.Gamma (x + y * I)‖ /
          (Real.sqrt (2 * Real.pi) * |y| ^ (x - 1 / 2) * Real.exp (-(Real.pi * |y|) / 2)) - 1| ≤ ε := by
  sorry

/-- The Dirichlet-polynomial mean square has the Montgomery–Vaughan weighted error. -/
theorem dirichlet_polynomial_mean_square :
    ∃ C > 0, ∀ (N : ℕ) (a : ℕ → ℂ) (T : ℝ), 1 ≤ T →
      |(∫ t in (-T)..T, ‖∑ n ∈ Finset.Icc 1 N, a n * (n : ℂ) ^ (-((t : ℂ) * I))‖ ^ 2) -
          2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2| ≤
        C * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by
  sorry

end AN3

/-! ## Layer 2: Hecke and Artin comparisons and quantitative number-field estimates -/

section AN4

open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- The partial zeta series of an ideal class, an `LSeries` over the
norm-indexed count of nonzero integral ideals in the class. -/
def partialIdealZeta (A : ClassGroup (𝓞 K)) (s : ℂ) : ℂ :=
  LSeries (fun n => (Nat.card {I : (Ideal (𝓞 K))⁰ //
    Ideal.absNorm (I : Ideal (𝓞 K)) = n ∧ ClassGroup.mk0 I = A} : ℂ)) s

/-- The class sum is the Dedekind zeta series. -/
theorem sum_partialIdealZeta {s : ℂ} (hs : 1 < s.re) :
    ∑ A : ClassGroup (𝓞 K), partialIdealZeta K A s = dedekindZeta K s := by
  sorry

/-- Over `ℚ` the only class gives `ζ`. -/
example {s : ℂ} (hs : 1 < s.re) (A : ClassGroup (𝓞 ℚ)) : partialIdealZeta ℚ A s = riemannZeta s := by
  sorry

/-- In fixed degree, hR has discriminant exponent one half, with any positive power loss. -/
theorem bounded_degree_brauer_siegel (n : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L = n →
      C⁻¹ * |(discr L : ℝ)| ^ (1 / 2 - ε) ≤ classNumber L * Units.regulator L ∧
        classNumber L * Units.regulator L ≤ C * |(discr L : ℝ)| ^ (1 / 2 + ε) := by
  sorry

/-- Every primitive quadratic Dirichlet character has root number one, including conductor one. -/
theorem rootNumber_eq_one_of_isPrimitive_of_sq_eq_one {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (hsq : χ ^ 2 = 1) :
    DirichletCharacter.rootNumber χ = 1 := by
  sorry

/-- Check of `quadratic-gauss-sum-sign` at `D = -4`: the root number of `χ₋₄` is `1`, i.e. its Gauss
sum is `2i`. -/
example : DirichletCharacter.rootNumber (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) = 1 := by
  sorry

end AN4

/-! ## Layer 3: Multiplicative means, smooth numbers and moments -/

section AN5

/-- `D(f, g; x)`, a distance on prime data. -/
def pretentiousDist (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (f p * starRingEnd ℂ (g p)).re) / (p : ℝ))

/-- The constant unit function has zero distance from itself. -/
example (x : ℝ) : pretentiousDist 1 1 x = 0 := by
  sorry

/-- `D(1, -1; x)² = 2 Σ_{p ≤ x} 1/p`. -/
example (x : ℝ) :
    pretentiousDist 1 (fun _ => -1) x ^ 2 =
      2 * ∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 : ℝ) / p := by
  sorry

/-- The prime-data distance satisfies the multiplicative triangle inequality for disk-valued functions. -/
theorem pretentiousDist_mul_le (f₁ f₂ g₁ g₂ : ℕ → ℂ) (x : ℝ)
    (hf₁ : ∀ p, ‖f₁ p‖ ≤ 1) (hf₂ : ∀ p, ‖f₂ p‖ ≤ 1) (hg₁ : ∀ p, ‖g₁ p‖ ≤ 1) (hg₂ : ∀ p, ‖g₂ p‖ ≤ 1) :
    pretentiousDist (f₁ * f₂) (g₁ * g₂) x ≤ pretentiousDist f₁ g₁ x + pretentiousDist f₂ g₂ x := by
  sorry

/-- `Ψ(x, y)`, the number of `1 ≤ n ≤ x` with every prime factor `≤ y`. -/
def smoothCount (x y : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p ∈ n.primeFactors, (p : ℝ) ≤ y).card

/-- Comparison with Mathlib's strict-cutoff `smoothNumbers`. -/
theorem smoothCount_eq (x y : ℝ) (hy : 0 ≤ y) :
    smoothCount x y = ((Finset.Icc 1 ⌊x⌋₊).filter (· ∈ Nat.smoothNumbers (⌊y⌋₊ + 1))).card := by
  sorry

/-- `Ψ(8, 2) = 4`, counting `1, 2, 4, 8`. -/
example : smoothCount 8 2 = 4 := by
  sorry

/-- `Ψ(6, 3) = 5`, counting `1, 2, 3, 4, 6`; the prime `3` is allowed. -/
example : smoothCount 6 3 = 5 := by
  sorry

/-- For each positive exponent, the divisor count has a uniform subpower bound. -/
theorem card_divisors_le (ε : ℝ) (hε : 0 < ε) :
    ∃ C ≥ 1, ∀ n : ℕ, 0 < n → (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε := by
  sorry

/-- A discrete Beurling prime system, repeated values allowed. -/
structure BeurlingPrimeSystem where
  /-- The generalized primes `p₀ ≤ p₁ ≤ ⋯`. -/
  p : ℕ → ℝ
  one_lt : ∀ j, 1 < p j
  mono : Monotone p
  tendsto : Tendsto p atTop atTop

/-- The prime-counting function `π_P(x)` of a Beurling system, counted with multiplicity. -/
def BeurlingPrimeSystem.primeCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {j : ℕ // P.p j ≤ x}

/-- The rational primes form a Beurling system. -/
theorem exists_beurlingPrimeSystem_nth_prime :
    ∃ P : BeurlingPrimeSystem, ∀ j, P.p j = Nat.nth Nat.Prime j := by
  sorry

/-- No indexed Beurling prime contributes at or below one. -/
example (P : BeurlingPrimeSystem) {x : ℝ} (hx : x ≤ 1) : P.primeCount x = 0 := by
  sorry

end AN5

/-! ## Layer 4: Lerch continuation, complex Hurwitz zeta and Barnes G -/

section AN7

/-- As its defining series `Σ zⁿ (n + c)^(-s)` with the principal
logarithm; meaningful for `‖z‖ < 1`, `0 < re c`. -/
def lerchSeries (z s c : ℂ) : ℂ :=
  ∑' n : ℕ, z ^ n * Complex.exp (-s * Complex.log (n + c))

/-- The `z = 1` series for `0 < re c`, `1 < re s`. -/
def complexHurwitzSeries (s c : ℂ) : ℂ :=
  ∑' n : ℕ, Complex.exp (-s * Complex.log (n + c))

/-- At `s = 0` the series is geometric. -/
example (z c : ℂ) (hz : ‖z‖ < 1) : lerchSeries z 0 c = 1 / (1 - z) := by
  sorry

/-- At `c = 1` the series is `ζ(s)`. -/
theorem complexHurwitzSeries_one {s : ℂ} (hs : 1 < s.re) : complexHurwitzSeries s 1 = riemannZeta s := by
  sorry

/-- `ζ_H(2, 1) = π² / 6`. -/
example : complexHurwitzSeries 2 1 = (Real.pi : ℂ) ^ 2 / 6 := by
  sorry

/-- Mathlib's exponential zeta is `z Φ(z, s, 1)`. -/
theorem expZeta_eq_lerchSeries (a : ℝ) {s : ℂ} (hs : 1 < s.re) :
    expZeta (a : UnitAddCircle) s =
      Complex.exp (2 * Real.pi * I * a) * lerchSeries (Complex.exp (2 * Real.pi * I * a)) s 1 := by
  sorry

/-- For a real parameter in `(0, 1]` the complex series is
Mathlib's Hurwitz zeta. -/
theorem complexHurwitzSeries_ofReal {a : ℝ} (ha : 0 < a) (ha' : a ≤ 1) {s : ℂ} (hs : 1 < s.re) :
    complexHurwitzSeries s a = hurwitzZeta (a : UnitAddCircle) s := by
  sorry

/-- Barnes' `G`, through the Weierstrass product for `G(z + 1)`. -/
def barnesG (z : ℂ) : ℂ :=
  let w := z - 1
  (2 * Real.pi : ℂ) ^ (w / 2) *
    Complex.exp (-(w * (w + 1)) / 2 - Real.eulerMascheroniConstant * w ^ 2 / 2) *
    ∏' k : ℕ, (1 + w / (k + 1)) ^ (k + 1) * Complex.exp (-w + w ^ 2 / (2 * (k + 1)))

/-- Barnes G satisfies the Gamma recurrence away from the Gamma poles. -/
theorem barnesG_add_one (z : ℂ) (hz : ∀ n : ℕ, z ≠ -(n : ℂ)) : barnesG (z + 1) = Complex.Gamma z * barnesG z := by
  sorry

/-- The canonical Barnes product is normalized by G(1) = 1. -/
theorem barnesG_one : barnesG 1 = 1 := by
  sorry

/-- The recurrence must exclude Gamma poles. -/
example : barnesG 1 ≠ Complex.Gamma 0 * barnesG 0 := by
  simp [Complex.Gamma_zero, barnesG_one]

/-- `G(4) = 2` and `G(5) = 12`. -/
example : barnesG 4 = 2 ∧ barnesG 5 = 12 := by
  sorry

/-- `G(0) = 0`. -/
example : barnesG 0 = 0 := by
  sorry

end AN7

/-! ## Layer 5: Double Dirichlet series and binary-cubic zeta functions

The canonical double-series and cubic continuation, local Fourier matrices, residues and
pole-aware convexity bounds are specified in README.md.
-/

/-! ## Layer 6: The Bost–Connes system and compact spectral determinants -/

section AN9

/-- The zeta series `Σ λⱼ^(-s)` of a positive spectrum. -/
def spectralZetaSeries (lam : ℕ → ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, Complex.exp (-s * Real.log (lam j))

/-- Scaling the spectrum by `c > 0` multiplies by `c^(-s)`. -/
theorem spectralZetaSeries_smul (lam : ℕ → ℝ) (hlam : ∀ j, 0 < lam j) {c : ℝ} (hc : 0 < c)
    (s : ℂ) :
    spectralZetaSeries (fun j => c * lam j) s =
      Complex.exp (-s * Real.log c) * spectralZetaSeries lam s := by
  sorry

/-- Test: the spectrum `1, 2, 3, …` gives the Riemann zeta function for `1 < re s`. -/
example {s : ℂ} (hs : 1 < s.re) : spectralZetaSeries (fun j => j + 1) s = riemannZeta s := by
  sorry

end AN9


/-!
The additional definitions and constructions specified in README.md are the genus-one and
general canonical factors; finite zero multiset; Weil test functions; all-prime Artin local
polynomials and Euler series, Artin holomorphy, Dedekind ERH and Hecke GRH; exceptional
squareclasses; even and truncated von Mangoldt functions and their error; the Halász coefficient
class; Dickman function, Beurling zeta and moment constants; Lerch covering continuation and
complex Hurwitz continuation; mod-eight characters, quadratic twist data, double Dirichlet
series and their reflection/tube data; local binary-cubic integrals, Shintani series, signature
matrix, adelic integral, continuation data and cubic-order generating series; the positive ax+b
pair and its integral subgroup, named matrices, diagonal map and Hecke algebra; rational
presentation and rational forms, time evolution, regular representation, heat operator, Gibbs
and KMS states, C⋆-completion, coefficient state, completed states and barycentres, finite-adele
scaling measures, symmetry action, KMS∞ and ground states, trigonometric Eisenstein functions
and recurrence polynomials, arithmetic algebra and ratio set; scalar heat and Selberg products,
regularized and entire shifted determinants, and the finite spectral determinant benchmark.
The additional local constructions are quadratic Nielsen cores with their oriented boundary
maps, ramification-defined Artin conductors, algebraic bounded-generator GNS, universal
completion, minimal dilation and crossed products, the conditional expectation and measured
group algebra, and its flow-of-weights and type predicates.
-/

end TauCetiRoadmap.AnalyticNumberTheory
