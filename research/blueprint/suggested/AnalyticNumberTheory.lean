/-
This file is not the roadmap and is not exhaustive. The definitive mathematical specification is
research/blueprint/readmes/AnalyticNumberTheory.md. These statements suggest Lean forms so that
contributors and reviewers can converge on names and signatures. Proofs of proposed results use
`sorry`; no implementation is claimed. Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The file keeps the compact subset that the pinned libraries can state: light definitions with real
bodies over existing carriers (Chebyshev sums, Dirichlet L-functions, the completed Riemann zeta
function, ideals and class groups of number fields, prime factorizations, complex logarithms), the
layer milestones whose statements use only those carriers, and a few unit tests as `example`s.
Hecke, Artin and Tate-continued L-functions, the canonical product, zero multisets, the Dickman
function, the Shintani and double Dirichlet series, Selberg zeta functions and the Bost–Connes
C*-dynamical system have no carrier at the pins; they are specified in the reader document only.

Assembly concordance: the reader's "Interfaces between the reviewed parts" gives the shared
contracts. AN.3 supplies uniform ordinary-Gamma estimates to AN.8; AN.7 supplies Barnes G to the
AN.9 identity factor and AN.5 moment constants; AN.2 imports the qualitative prime asymptotics
used by the Bost-Connes arguments. Their native names here all use TauCeti.AnalyticNumberTheory.
The accepted whole-roadmap signatures are retained, including the review's Barnes pole exclusions.
-/

import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.NumberTheory.LSeries.HurwitzZeta
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.SmoothNumbers
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic

noncomputable section

open Filter Topology Asymptotics Complex HurwitzZeta
open scoped BigOperators nonZeroDivisors NumberField

namespace TauCeti.AnalyticNumberTheory

/-! ## AN.2: prime number theorems, zero-free regions and exceptional zeros -/

section AN2

/-- AN.2 `theta-ap`: the Chebyshev sum `θ(x; a, q)` over primes `p ≤ x` with `p ≡ a mod q`,
inclusive real cutoff. No coprimality is built in; asymptotic theorems assume it. -/
def thetaAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ p ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- API `theta_ap.level_one`: at level one the progression sum is Mathlib's `θ`. -/
theorem thetaAP_one (x : ℝ) : thetaAP 1 0 x = Chebyshev.theta x := by
  sorry

/-- API `theta_ap.sum_classes`: summing over all residue classes recovers `θ`. -/
theorem sum_thetaAP (q : ℕ) [NeZero q] (x : ℝ) :
    ∑ a : ZMod q, thetaAP q a x = Chebyshev.theta x := by
  sorry

/-- Test `theta_ap.below_two`: `θ(1; a, q) = 0`. -/
example (q : ℕ) (a : ZMod q) : thetaAP q a 1 = 0 := by
  sorry

/-- Test `theta_ap.mod_eight`: `θ(5; 3, 8) = log 3` and `θ(5; 5, 8) = log 5`. -/
example : thetaAP 8 3 5 = Real.log 3 ∧ thetaAP 8 5 5 = Real.log 5 := by
  sorry

/-- Test `theta_ap.noncoprime`: the noncoprime class `0 mod 2` contains only the prime `2`. -/
example {x : ℝ} (hx : 2 ≤ x) : thetaAP 2 0 x = Real.log 2 := by
  sorry

/-- AN.2 `exceptional-real-zero`: `β` is a `c`-exceptional real zero of the primitive
nonprincipal quadratic character `χ` of conductor `N > 1`. No zero is asserted to exist. -/
def IsExceptionalRealZero (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (β : ℝ) :
    Prop :=
  0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
    1 - c / Real.log N < β ∧ β < 1 ∧ DirichletCharacter.LFunction χ β = 0

/-- API `ExceptionalRealZero.mono`. -/
theorem IsExceptionalRealZero.mono {c c' : ℝ} {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {β : ℝ} (h : IsExceptionalRealZero c χ β) (hc : c ≤ c') : IsExceptionalRealZero c' χ β := by
  sorry

/-- Test `ExceptionalRealZero.one`: `β = 1` is never exceptional. -/
example (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    ¬ IsExceptionalRealZero c χ 1 := by
  sorry

/-- AN.2 `riemann-xi`: the entire Riemann `ξ`, written through Mathlib's entire
`completedRiemannZeta₀`, so that no junk value at `s = 0, 1` enters. -/
def riemannXi (s : ℂ) : ℂ :=
  1 / 2 + 1 / 2 * s * (s - 1) * completedRiemannZeta₀ s

/-- API `riemann_xi.comparison`: away from `0` and `1`, `ξ(s) = s(s-1)Λ(s)/2`. -/
theorem riemannXi_eq {s : ℂ} (hs₀ : s ≠ 0) (hs₁ : s ≠ 1) :
    riemannXi s = 1 / 2 * s * (s - 1) * completedRiemannZeta s := by
  sorry

/-- API `riemann_xi.reflection`. -/
theorem riemannXi_one_sub (s : ℂ) : riemannXi (1 - s) = riemannXi s := by
  sorry

/-- Test `riemann_xi.zero`. -/
example : riemannXi 0 = 1 / 2 := by
  sorry

/-- AN.2 `entire-order-at-most`: `f` is entire of order at most `ρ` (an upper-order predicate). -/
def EntireOrderAtMost (ρ : ℝ) (f : ℂ → ℂ) : Prop :=
  0 ≤ ρ ∧ Differentiable ℂ f ∧ ∀ b > ρ, ∃ C > 0, ∀ z : ℂ, ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)

/-- Test `entire_order_at_most.exp`. -/
example : EntireOrderAtMost 1 Complex.exp := by
  sorry

/-- Test `entire_order_at_most.exp_square`: `exp (z²)` has order `2`, not at most `1`. -/
example : ¬ EntireOrderAtMost 1 fun z => Complex.exp (z ^ 2) := by
  sorry

/-- Test `entire_order_at_most.xi`: a bound `exp (C |z| log (2 + |z|))` gives order at most one. -/
example (f : ℂ → ℂ) (hf : Differentiable ℂ f) (C : ℝ)
    (h : ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * ‖z‖ * Real.log (2 + ‖z‖))) : EntireOrderAtMost 1 f := by
  sorry

/-- AN.2 `riemann-xi`: `ξ` is entire of order at most one (proof ingredient `xi-order-one-growth`). -/
theorem entireOrderAtMost_riemannXi : EntireOrderAtMost 1 riemannXi := by
  sorry

/-- AN.2 `classical-zero-free-region`, at large positive height. -/
theorem classical_zero_free_region :
    ∃ c > 0, ∃ t₀ > 1, ∀ s : ℂ, t₀ ≤ s.im → 1 - c / Real.log s.im ≤ s.re → riemannZeta s ≠ 0 := by
  sorry

/-- AN.2 `qualitative-prime-number-theorems` (i), imported from Tau Ceti's prime ideal theorem. -/
theorem psi_div_self_tendsto : Tendsto (fun x => Chebyshev.psi x / x) atTop (𝓝 1) := by
  sorry

/-- AN.2 `qualitative-prime-number-theorems` (ii): fixed coprime progressions, from Tau Ceti
Chebotarev over the cyclotomic field. -/
theorem primeCountAP_tendsto (q : ℕ) [NeZero q] (a : ZMod q) (ha : IsUnit a) :
    Tendsto (fun x : ℝ => (primeCountAP q a x : ℝ) / (x / Real.log x)) atTop
      (𝓝 (1 / (q.totient : ℝ))) := by
  sorry

/-- AN.2 `rational-pnt-error`: the de la Vallée Poussin error term, with effective constants. -/
theorem abs_psi_sub_self_le :
    ∃ c > 0, ∃ C > 0, ∀ᶠ x in atTop,
      |Chebyshev.psi x - x| ≤ C * x * Real.exp (-c * Real.sqrt (Real.log x)) := by
  sorry

/-- AN.2 `siegel-walfisz`, in `ψ` form: uniform in `q ≤ (log x)^B`; the constant is ineffective. -/
theorem siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |psiAP q a x - x / q.totient| ≤ C * x * Real.log x ^ (-A) := by
  sorry

/-- AN.2 `rosser-schoenfeld-pi`: explicit two-sided bounds for `π(x)` when `x ≥ 59`. -/
theorem rosser_schoenfeld_primeCounting {x : ℝ} (hx : 59 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- AN.2 `schoenfeld-theta-upper`. -/
theorem theta_lt {x : ℝ} (hx : 0 < x) : Chebyshev.theta x < 1.000081 * x := by
  sorry

end AN2

/-! ## AN.3: explicit formulas, mean values and the RH/GRH register -/

section AN3

/-- AN.3 `generalized-riemann-hypothesis`: the Riemann hypothesis for one Dirichlet `L`-function.
`0 < re s` removes trivial zeros and the zeros of missing Euler factors; the pole of the principal
character is excluded. -/
def DirichletGRH {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The generalized Riemann hypothesis for all Dirichlet characters. A statement only. -/
def GRH : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), DirichletGRH χ

/-- API `dirichletGRH_one_iff_riemannHypothesis` (also a compatibility test). -/
theorem dirichletGRH_one_iff_riemannHypothesis :
    DirichletGRH (1 : DirichletCharacter ℂ 1) ↔ RiemannHypothesis := by
  sorry

/-- API `GRH.riemannHypothesis`. -/
theorem GRH.riemannHypothesis (h : GRH) : RiemannHypothesis := by
  sorry

/-- API `DirichletGRH.re_eq_half`. -/
theorem DirichletGRH.re_eq_half {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (h : DirichletGRH χ) {s : ℂ} (hs : 0 < s.re) (hχ : χ ≠ 1 ∨ s ≠ 1)
    (hz : DirichletCharacter.LFunction χ s = 0) : s.re = 1 / 2 :=
  h s hs hχ hz

/-- AN.3 `conditional-prime-error-terms` (i): the hypothesis is explicit. -/
theorem psi_sub_self_isBigO_of_riemannHypothesis (h : RiemannHypothesis) {ε : ℝ} (hε : 0 < ε) :
    (fun x => Chebyshev.psi x - x) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- AN.3 `conditional-prime-error-terms` (ii), for a fixed modulus. -/
theorem psiAP_isBigO_of_dirichletGRH (q : ℕ) [NeZero q]
    (h : ∀ χ : DirichletCharacter ℂ q, DirichletGRH χ) (a : ZMod q) (ha : IsUnit a) {ε : ℝ}
    (hε : 0 < ε) :
    (fun x => psiAP q a x - x / q.totient) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- AN.3 `uniform-complex-stirling` (i): `|Γ(x + iy)| ~ √(2π) |y|^(x - 1/2) e^(-π|y|/2)` as
`|y| → ∞`, uniformly for `x` in a compact interval. -/
theorem uniform_complex_stirling (a b : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ Y > 0, ∀ x ∈ Set.Icc a b, ∀ y : ℝ, Y ≤ |y| →
      |‖Complex.Gamma (x + y * I)‖ /
          (Real.sqrt (2 * Real.pi) * |y| ^ (x - 1 / 2) * Real.exp (-(Real.pi * |y|) / 2)) - 1| ≤ ε := by
  sorry

/-- AN.3 `dirichlet-polynomial-mean-square` (Montgomery–Vaughan form). -/
theorem dirichlet_polynomial_mean_square :
    ∃ C > 0, ∀ (N : ℕ) (a : ℕ → ℂ) (T : ℝ), 1 ≤ T →
      |(∫ t in (-T)..T, ‖∑ n ∈ Finset.Icc 1 N, a n * (n : ℂ) ^ (-((t : ℂ) * I))‖ ^ 2) -
          2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2| ≤
        C * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by
  sorry

end AN3

/-! ## AN.4: number-field comparisons -/

section AN4

open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- AN.4 `partial-ideal-zeta`: the partial zeta series of an ideal class, an `LSeries` over the
norm-indexed count of nonzero integral ideals in the class. -/
def partialIdealZeta (A : ClassGroup (𝓞 K)) (s : ℂ) : ℂ :=
  LSeries (fun n => (Nat.card {I : (Ideal (𝓞 K))⁰ //
    Ideal.absNorm (I : Ideal (𝓞 K)) = n ∧ ClassGroup.mk0 I = A} : ℂ)) s

/-- API `partial_ideal_zeta.sum_classes`: the class sum is the Dedekind zeta series. -/
theorem sum_partialIdealZeta {s : ℂ} (hs : 1 < s.re) :
    ∑ A : ClassGroup (𝓞 K), partialIdealZeta K A s = dedekindZeta K s := by
  sorry

/-- Test `partial_ideal_zeta.q`: over `ℚ` the only class gives `ζ`. -/
example {s : ℂ} (hs : 1 < s.re) (A : ClassGroup (𝓞 ℚ)) : partialIdealZeta ℚ A s = riemannZeta s := by
  sorry

/-- AN.4 `bounded-degree-brauer-siegel`, in fixed degree `n`; the lower constant is ineffective. -/
theorem bounded_degree_brauer_siegel (n : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L = n →
      C⁻¹ * |(discr L : ℝ)| ^ (1 / 2 - ε) ≤ classNumber L * Units.regulator L ∧
        classNumber L * Units.regulator L ≤ C * |(discr L : ℝ)| ^ (1 / 2 + ε) := by
  sorry

/-- AN.4 `quadratic-gauss-sum-sign`: Gauss's sign. Every primitive quadratic Dirichlet character has
root number `1`; by Mathlib's definition of `rootNumber` this says that its Gauss sum is
`i^a N^(1/2)`. The proof route is the Dedekind functional equation of the quadratic field. -/
theorem rootNumber_eq_one_of_isPrimitive_of_sq_eq_one {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (hsq : χ ^ 2 = 1) :
    DirichletCharacter.rootNumber χ = 1 := by
  sorry

/-- Check of `quadratic-gauss-sum-sign` at `D = -4`: the root number of `χ₋₄` is `1`, i.e. its Gauss
sum is `2i`. -/
example : DirichletCharacter.rootNumber (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) = 1 := by
  sorry

end AN4

/-! ## AN.5: multiplicative functions and value distribution -/

section AN5

/-- AN.5 `pretentious-distance` `D(f, g; x)`, a distance on prime data. -/
def pretentiousDist (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (f p * starRingEnd ℂ (g p)).re) / (p : ℝ))

/-- Test `pretentious_distance.unit`. -/
example (x : ℝ) : pretentiousDist 1 1 x = 0 := by
  sorry

/-- Test `pretentious_distance.minus`: `D(1, -1; x)² = 2 Σ_{p ≤ x} 1/p`. -/
example (x : ℝ) :
    pretentiousDist 1 (fun _ => -1) x ^ 2 =
      2 * ∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 : ℝ) / p := by
  sorry

/-- API `pretentious_distance.triangle` (proof ingredient `pretentious-product-triangle`). -/
theorem pretentiousDist_mul_le (f₁ f₂ g₁ g₂ : ℕ → ℂ) (x : ℝ)
    (hf₁ : ∀ p, ‖f₁ p‖ ≤ 1) (hf₂ : ∀ p, ‖f₂ p‖ ≤ 1) (hg₁ : ∀ p, ‖g₁ p‖ ≤ 1) (hg₂ : ∀ p, ‖g₂ p‖ ≤ 1) :
    pretentiousDist (f₁ * f₂) (g₁ * g₂) x ≤ pretentiousDist f₁ g₁ x + pretentiousDist f₂ g₂ x := by
  sorry

/-- AN.5 `smooth-count`: `Ψ(x, y)`, the number of `1 ≤ n ≤ x` with every prime factor `≤ y`. -/
def smoothCount (x y : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p ∈ n.primeFactors, (p : ℝ) ≤ y).card

/-- API `smooth_count.floor`: comparison with Mathlib's strict-cutoff `smoothNumbers`. -/
theorem smoothCount_eq (x y : ℝ) (hy : 0 ≤ y) :
    smoothCount x y = ((Finset.Icc 1 ⌊x⌋₊).filter (· ∈ Nat.smoothNumbers (⌊y⌋₊ + 1))).card := by
  sorry

/-- Test `smooth_count.two`: `Ψ(8, 2) = 4`, counting `1, 2, 4, 8`. -/
example : smoothCount 8 2 = 4 := by
  sorry

/-- Test `smooth_count.inclusive`: `Ψ(6, 3) = 5`, counting `1, 2, 3, 4, 6`; the prime `3` is allowed. -/
example : smoothCount 6 3 = 5 := by
  sorry

/-- AN.5 `uniform-divisor-subpower-bound`. -/
theorem card_divisors_le (ε : ℝ) (hε : 0 < ε) :
    ∃ C ≥ 1, ∀ n : ℕ, 0 < n → (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε := by
  sorry

/-- AN.5 `beurling-prime-system`: a discrete Beurling prime system, repeated values allowed. -/
structure BeurlingPrimeSystem where
  /-- The generalized primes `p₀ ≤ p₁ ≤ ⋯`. -/
  p : ℕ → ℝ
  one_lt : ∀ j, 1 < p j
  mono : Monotone p
  tendsto : Tendsto p atTop atTop

/-- The prime-counting function `π_P(x)` of a Beurling system, counted with multiplicity. -/
def BeurlingPrimeSystem.primeCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {j : ℕ // P.p j ≤ x}

/-- API `beurling_prime_system.ordinary`: the rational primes form a Beurling system. -/
theorem exists_beurlingPrimeSystem_nth_prime :
    ∃ P : BeurlingPrimeSystem, ∀ j, P.p j = Nat.nth Nat.Prime j := by
  sorry

end AN5

/-! ## AN.7: Hurwitz and Lerch zeta functions with complex parameters -/

section AN7

/-- AN.7 `lerch-transcendent`, as its defining series `Σ zⁿ (n + c)^(-s)` with the principal
logarithm; meaningful for `‖z‖ < 1`, `0 < re c`. -/
def lerchSeries (z s c : ℂ) : ℂ :=
  ∑' n : ℕ, z ^ n * Complex.exp (-s * Complex.log (n + c))

/-- AN.7 `complex-hurwitz-series`, the `z = 1` series for `0 < re c`, `1 < re s`. -/
def complexHurwitzSeries (s c : ℂ) : ℂ :=
  ∑' n : ℕ, Complex.exp (-s * Complex.log (n + c))

/-- Test `lerch_transcendent.s_zero`: at `s = 0` the series is geometric. -/
example (z c : ℂ) (hz : ‖z‖ < 1) : lerchSeries z 0 c = 1 / (1 - z) := by
  sorry

/-- API `complex_hurwitz_series.c_one`: at `c = 1` the series is `ζ(s)`. -/
theorem complexHurwitzSeries_one {s : ℂ} (hs : 1 < s.re) : complexHurwitzSeries s 1 = riemannZeta s := by
  sorry

/-- Test `complex_hurwitz_series.one`: `ζ_H(2, 1) = π² / 6`. -/
example : complexHurwitzSeries 2 1 = (Real.pi : ℂ) ^ 2 / 6 := by
  sorry

/-- AN.7 `exp-zeta-lerch-comparison`: Mathlib's exponential zeta is `z Φ(z, s, 1)`. -/
theorem expZeta_eq_lerchSeries (a : ℝ) {s : ℂ} (hs : 1 < s.re) :
    expZeta (a : UnitAddCircle) s =
      Complex.exp (2 * Real.pi * I * a) * lerchSeries (Complex.exp (2 * Real.pi * I * a)) s 1 := by
  sorry

/-- AN.7 `circle-hurwitz-import`: for a real parameter in `(0, 1]` the complex series is
Mathlib's Hurwitz zeta. -/
theorem complexHurwitzSeries_ofReal {a : ℝ} (ha : 0 < a) (ha' : a ≤ 1) {s : ℂ} (hs : 1 < s.re) :
    complexHurwitzSeries s a = hurwitzZeta (a : UnitAddCircle) s := by
  sorry

/-- AN.7 `barnes-g-function`: Barnes' `G`, through the Weierstrass product for `G(z + 1)`. -/
def barnesG (z : ℂ) : ℂ :=
  let w := z - 1
  (2 * Real.pi : ℂ) ^ (w / 2) *
    Complex.exp (-(w * (w + 1)) / 2 - Real.eulerMascheroniConstant * w ^ 2 / 2) *
    ∏' k : ℕ, (1 + w / (k + 1)) ^ (k + 1) * Complex.exp (-w + w ^ 2 / (2 * (k + 1)))

/-- API `barnesG_add_one`. -/
theorem barnesG_add_one (z : ℂ) (hz : ∀ n : ℕ, z ≠ -(n : ℂ)) : barnesG (z + 1) = Complex.Gamma z * barnesG z := by
  sorry

/-- API `barnesG_one`. -/
theorem barnesG_one : barnesG 1 = 1 := by
  sorry

/-- Test `barnesG_totalized_gamma_origin`: the recurrence must exclude Gamma poles. -/
example : barnesG 1 ≠ Complex.Gamma 0 * barnesG 0 := by
  simp [Complex.Gamma_zero, barnesG_one]

/-- Test `barnesG_small_values`: `G(4) = 2` and `G(5) = 12`. -/
example : barnesG 4 = 2 ∧ barnesG 5 = 12 := by
  sorry

/-- Test `barnesG_zero`: `G(0) = 0`. -/
example : barnesG 0 = 0 := by
  sorry

end AN7

/-! ## AN.8: several-variable and cubic zeta functions

The double-series continuation, cubic functional equation, residues and pole-cleared convexity
are reader targets. Their canonical arithmetic, Schwartz and quotient-measure carriers are not
available at the pins. The AN.3 Stirling statement above is their shared quantitative Gamma input;
the separate entire-order and normalized strip-interpolation obligations remain in the reader.
-/

/-! ## AN.9: spectral zeta functions -/

section AN9

/-- AN.9 `spectral-zeta-series`: the zeta series `Σ λⱼ^(-s)` of a positive spectrum. -/
def spectralZetaSeries (lam : ℕ → ℝ) (s : ℂ) : ℂ :=
  ∑' j : ℕ, Complex.exp (-s * Real.log (lam j))

/-- Test `SpectralData.test_scaling`: scaling the spectrum by `c > 0` multiplies by `c^(-s)`. -/
theorem spectralZetaSeries_smul (lam : ℕ → ℝ) (hlam : ∀ j, 0 < lam j) {c : ℝ} (hc : 0 < c)
    (s : ℂ) :
    spectralZetaSeries (fun j => c * lam j) s =
      Complex.exp (-s * Real.log c) * spectralZetaSeries lam s := by
  sorry

/-- Test: the spectrum `1, 2, 3, …` gives the Riemann zeta function for `1 < re s`. -/
example {s : ℂ} (hs : 1 < s.re) : spectralZetaSeries (fun j => j + 1) s = riemannZeta s := by
  sorry

end AN9

end TauCeti.AnalyticNumberTheory
