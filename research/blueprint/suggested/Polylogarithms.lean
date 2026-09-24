/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-Polylogarithms, revised by the independent review REV-Polylogarithms:
partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Synced with the reviewed packet (75 nodes) and elaborated with the Lean toolchain
of Mathlib 082e2d3 against its prebuilt library: `sorry` is the only warning. The
file imports only Mathlib; the Tau Ceti declarations the packet cites (places of a
function field, their orders and residues, the degree of a principal divisor, the
unit filtration) are named in comments.

Objects that another roadmap owns appear as `variable`s, never as invented
definitions: the pre-Bloch group, its generators, functoriality and the Bloch group
(K3BlochGroups V.3); indecomposable K_3 and Suslin's map (K3BlochGroups V.4); the
Borel regulator (BorelRegulators R.4); rational K-groups (GeneralAlgebraicKTheory,
MotivicEtaleKTheory M.6, SchemeKTheoryOperations S.6); the p-adic logarithm
(PadicHodgeRegulators D.1). Statements about them are forms, true only once the
variables are instantiated by the supplier. Nothing below encodes a missing theorem
as an assumed structure field or as a placeholder `Prop`: the `Prop`-valued definitions
(the condition `*_n`, and Goncharov's, Zagier's and Leopoldt's statements) have their
actual content, and none is `True` or `sorry`. `sorry` occurs only as the body of a
declaration or as a proof obligation inside one, never in a statement.

Unit tests are `example`s whose docstring begins "Test `<name>`" with the name the
packet gives. An API item or a theorem node that cannot be stated honestly yet is a
comment `-- <name>: not stated; needs <missing object>`. The main missing objects are
currents on complex manifolds, Chow varieties, hyperbolic 3-space with its volume,
and the Deligne-Beilinson complex (packet gaps and requests).
-/
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Calculus.ContDiff.Defs
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Arg
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Finsupp.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.FieldTheory.RatFunc.Defs
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Homology.HomotopyCategory.Shift
import Mathlib.Topology.Algebra.Module.Alternating.Basic
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Analysis.Calculus.DifferentialForm.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.FieldTheory.Galois.Basic

noncomputable section

open Complex Filter Topology
open scoped TensorProduct Real

namespace TauCeti.Polylog

/-! ## P.1 Classical and single-valued polylogarithms -/

/-- P.1/classical-polylogarithm: `polylog n` for an integer `n`. For `n ≥ 1` it is the
principal branch, `Li_1 z = -log (1 - z)` and `Li_{n+1} z = ∫₀¹ Li_n (t z) / t dt`, analytic
on `{z | 1 - z ∈ slitPlane} = ℂ ∖ [1, ∞)` and equal on the cut to the limit from the lower
half-plane; for `n ≤ 0` it is the rational function `(z d/dz)^{-n} (z / (1 - z))`. -/
def polylog (n : ℤ) (z : ℂ) : ℂ := sorry

theorem polylog_hasSum (n : ℤ) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun k : ℕ => z ^ (k + 1) / (((k + 1 : ℕ) : ℂ) ^ n)) (polylog n z) := by sorry

/-- For every `z`, including the cut: this pins the value of every `Li n` on `(1, ∞)`. -/
theorem polylog_one_eq_neg_log (z : ℂ) : polylog 1 z = -Complex.log (1 - z) := by sorry

@[simp] theorem polylog_zero (n : ℤ) : polylog n 0 = 0 := by sorry

theorem polylog_deriv (n : ℤ) {z : ℂ} (hz : 1 - z ∈ Complex.slitPlane) (hz0 : z ≠ 0) :
    HasDerivAt (polylog (n + 1)) (polylog n z / z) z := by sorry

theorem polylog_analyticOn (n : ℤ) (hn : 1 ≤ n) :
    AnalyticOnNhd ℂ (polylog n) {z | 1 - z ∈ Complex.slitPlane} := by sorry

theorem polylog_conj (n : ℤ) {z : ℂ} (hz : 1 - z ∈ Complex.slitPlane) :
    polylog n (starRingEnd ℂ z) = starRingEnd ℂ (polylog n z) := by sorry

theorem polylog_one_eq_zeta (n : ℕ) (hn : 2 ≤ n) : polylog n 1 = riemannZeta n := by sorry

theorem polylog_continuousOn_closedBall (n : ℤ) (hn : 2 ≤ n) :
    ContinuousOn (polylog n) (Metric.closedBall 0 1) := by sorry

/-- The formal power series `∑_{k ≥ 1} k^{-n} X^k` (HabiroNahmSeries HB.8, HB.9). -/
def polylogSeries (n : ℤ) : PowerSeries ℚ :=
  PowerSeries.mk fun k => if k = 0 then 0 else (((k : ℚ) ^ n)⁻¹)

/-- P.1/branch-change-and-monodromy: the jump across the cut. -/
theorem polylog_jump (n : ℕ) (hn : 1 ≤ n) {x : ℝ} (hx : 1 < x) :
    Tendsto (fun ε : ℝ => polylog n (x + ε * I) - polylog n (x - ε * I)) (𝓝[>] 0)
      (𝓝 (2 * π * I * (Real.log x : ℂ) ^ (n - 1) / ((n - 1).factorial : ℂ))) := by sorry

-- P.1/branch-change-and-monodromy (the criterion for a combination Σ c_k Li_{n-k} log^k|z| to be
-- continuous across the cut): not stated; the jump formula above is what the proofs use.

/-- P.1/classical-distribution. -/
theorem polylog_distribution (n : ℤ) (hn : 1 ≤ n) (m : ℕ) (hm : 0 < m) {z : ℂ}
    (hz : ∀ ζ ∈ Polynomial.nthRoots m (1 : ℂ), 1 - ζ * z ∈ Complex.slitPlane) :
    polylog n (z ^ m) =
      (m : ℂ) ^ (n - 1) * ((Polynomial.nthRoots m (1 : ℂ)).map fun ζ => polylog n (ζ * z)).sum := by
  sorry

/-- P.1/classical-inversion, for `z ∉ [0, ∞)`. -/
theorem polylog_inversion (n : ℕ) (hn : 1 ≤ n) {z : ℂ} (hz : -z ∈ Complex.slitPlane) :
    polylog n z + (-1) ^ n * polylog n z⁻¹ =
      -((2 * π * I) ^ n / (n.factorial : ℂ)) *
        Polynomial.aeval (1 / 2 + Complex.log (-z) / (2 * π * I)) (Polynomial.bernoulli n) := by
  sorry

/-- Test `weight_one`. -/
example (z : ℂ) : polylog 1 z = -Complex.log (1 - z) := by sorry

/-- Test `value_at_half_weight_two`. -/
example : polylog 2 (1 / 2) = (π : ℂ) ^ 2 / 12 - (Real.log 2 : ℂ) ^ 2 / 2 := by sorry

/-- Test `value_at_neg_one`: a cut along `(-∞, 0]` would fail this. -/
example : polylog 2 (-1) = -(π : ℂ) ^ 2 / 12 := by sorry

/-- Test `value_at_one`. -/
example : polylog 2 1 = (π : ℂ) ^ 2 / 6 := by sorry

/-- Test `derivative_recursion`. -/
example {z : ℂ} (hz : 1 - z ∈ Complex.slitPlane) (hz0 : z ≠ 0) :
    z * deriv (polylog 3) z = polylog 2 z := by sorry

/-- Test `nonpositive_index`. -/
example {z : ℂ} (hz : z ≠ 1) : polylog 0 z = z / (1 - z) ∧ polylog (-1) z = z / (1 - z) ^ 2 := by
  sorry

/-- Test `jump_across_cut`. -/
example : Tendsto (fun ε : ℝ => polylog 1 (3 + ε * I) - polylog 1 (3 - ε * I)) (𝓝[>] 0)
    (𝓝 (2 * π * I)) := by sorry

/-- The parity projection: the real part in odd weight, the imaginary part in even weight. -/
def parityProjection (n : ℕ) (z : ℂ) : ℝ := if Odd n then z.re else z.im

/-- P.1/single-valued-polylogarithm: Zagier's `L_n`, for `n ≥ 2`, with Mathlib's `bernoulli`
(`B_1 = -1/2`). -/
def singleValuedPolylog (n : ℕ) (z : ℂ) : ℝ :=
  parityProjection n (∑ k ∈ Finset.range n,
    ((2 ^ k * bernoulli k / k.factorial : ℚ) : ℂ) * polylog ((n - k : ℕ) : ℤ) z *
      (Real.log ‖z‖ : ℂ) ^ k)

theorem singleValuedPolylog_contDiffOn (n : ℕ) (hn : 2 ≤ n) :
    ContDiffOn ℝ ⊤ (singleValuedPolylog n) {z | z ≠ 0 ∧ z ≠ 1} := by sorry

@[simp] theorem singleValuedPolylog_zero (n : ℕ) (hn : 2 ≤ n) : singleValuedPolylog n 0 = 0 := by
  sorry

/-- P.1/single-valued-continuity. -/
theorem singleValuedPolylog_continuous (n : ℕ) (hn : 2 ≤ n) : Continuous (singleValuedPolylog n) := by
  sorry

/-- P.1/single-valued-continuity. -/
theorem singleValuedPolylog_at_one (n : ℕ) (hn : 2 ≤ n) :
    singleValuedPolylog n 1 = if Odd n then (riemannZeta n).re else 0 := by sorry

/-- P.1/single-valued-continuity: the value `0` at `∞`. -/
theorem singleValuedPolylog_tendsto_cocompact (n : ℕ) (hn : 2 ≤ n) :
    Tendsto (singleValuedPolylog n) (cocompact ℂ) (𝓝 0) := by sorry

/-- P.1/single-valued-continuity: no differentiability at `0` and `1`. -/
theorem singleValuedPolylog_not_differentiableAt (n : ℕ) (hn : 2 ≤ n) :
    ¬ DifferentiableAt ℝ (singleValuedPolylog n) 0 ∧ ¬ DifferentiableAt ℝ (singleValuedPolylog n) 1 := by
  sorry

/-- P.1/distribution-and-inversion: reality. -/
theorem singleValuedPolylog_conj (n : ℕ) (hn : 2 ≤ n) (z : ℂ) :
    singleValuedPolylog n (starRingEnd ℂ z) = (-1) ^ (n - 1) * singleValuedPolylog n z := by sorry

/-- P.1/distribution-and-inversion: inversion, false at `n = 1`. -/
theorem singleValuedPolylog_inv (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : z ≠ 0) :
    singleValuedPolylog n z + (-1) ^ n * singleValuedPolylog n z⁻¹ = 0 := by sorry

/-- P.1/distribution-and-inversion: the distribution relation. -/
theorem singleValuedPolylog_distribution (n : ℕ) (hn : 2 ≤ n) (m : ℕ) (hm : 0 < m) (z : ℂ) :
    singleValuedPolylog n (z ^ m) =
      (m : ℝ) ^ (n - 1) * ((Polynomial.nthRoots m (1 : ℂ)).map fun ζ => singleValuedPolylog n (ζ * z)).sum := by
  sorry

/-- Test `weight_two_is_bloch_wigner`. -/
example (z : ℂ) : singleValuedPolylog 2 z = (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖ := by
  sorry

/-- Test `reality`. -/
example (z : ℂ) : singleValuedPolylog 3 (starRingEnd ℂ z) = singleValuedPolylog 3 z ∧
    singleValuedPolylog 2 (starRingEnd ℂ z) = -singleValuedPolylog 2 z := by sorry

/-- Test `value_at_one_odd`. -/
example : singleValuedPolylog 3 1 = (riemannZeta 3).re := by sorry

/-- Test `bernoulli_sign`: with `bernoulli'` (`B_1 = +1/2`) the weight-two formula jumps by
`4π log x` across `x > 1`. -/
example : ¬ ContinuousAt (fun z : ℂ => (polylog 2 z).im - Complex.arg (1 - z) * Real.log ‖z‖) 3 := by
  sorry

/-- Test `ramakrishnan_unbounded`: Ramakrishnan's coefficients `(-1)^k/k!` give a single-valued
function that is unbounded near `∞`, so it is not `L_3`. -/
example : ¬ ∃ C : ℝ, ∀ z : ℂ, |(polylog 3 z - (Real.log ‖z‖ : ℂ) * polylog 2 z +
    (Real.log ‖z‖ : ℂ) ^ 2 / 2 * polylog 1 z).re| ≤ C := by sorry

/-- Test `not_analytic_at_one`. -/
example : ¬ DifferentiableAt ℝ (singleValuedPolylog 2) 1 := by sorry

/-- P.1/bloch-wigner-dilogarithm: `D z = Im Li₂ z + arg (1 - z) log |z|`; Mathlib's
`log 0 = 0` and `arg 0 = 0` give `D 0 = D 1 = 0` with no special case. -/
def blochWigner (z : ℂ) : ℝ := (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

theorem blochWigner_eq_singleValued : blochWigner = singleValuedPolylog 2 := by sorry

@[simp] theorem blochWigner_zero : blochWigner 0 = 0 := by sorry
@[simp] theorem blochWigner_one : blochWigner 1 = 0 := by sorry
theorem blochWigner_conj (z : ℂ) : blochWigner (starRingEnd ℂ z) = -blochWigner z := by sorry
theorem blochWigner_inv (z : ℂ) : blochWigner z⁻¹ = -blochWigner z := by sorry
theorem blochWigner_one_sub (z : ℂ) : blochWigner (1 - z) = -blochWigner z := by sorry
@[simp] theorem blochWigner_real (x : ℝ) : blochWigner x = 0 := by sorry
theorem blochWigner_continuous : Continuous blochWigner := by sorry
theorem blochWigner_tendsto_cocompact : Tendsto blochWigner (cocompact ℂ) (𝓝 0) := by sorry

/-- The differential of `D` at `z ∉ {0, 1}`: `dD = log|z| d arg(1 - z) - log|1 - z| d arg z`,
that is `v ↦ -log|z| Im(v/(1 - z)) - log|1 - z| Im(v/z)`. -/
def blochWignerDiff (z : ℂ) : ℂ →L[ℝ] ℝ :=
  (-Real.log ‖z‖) • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ (1 - z)⁻¹)) -
    Real.log ‖1 - z‖ • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ z⁻¹))

/-- P.1/bloch-wigner-differential. -/
theorem blochWigner_differential {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    HasFDerivAt blochWigner (blochWignerDiff z) z := by sorry

/-- P.1/bloch-wigner-positivity (rests on a minimum principle for superharmonic functions,
a gap). -/
theorem blochWigner_pos {z : ℂ} (hz : 0 < z.im) : 0 < blochWigner z := by sorry

-- P.1/bloch-wigner-positivity, the Laplacian `Δ D = -2 Im z / (|z|² |1 - z|²)`: not stated here;
-- it is a second-derivative computation from `blochWigner_differential`.

/-- Test `vanishes_on_reals`. -/
example (x : ℝ) (hx : 1 < x) : blochWigner x = 0 := by sorry

/-- Test `value_at_i`: Catalan's constant. -/
example : HasSum (fun k : ℕ => (-1 : ℝ) ^ k / (2 * k + 1) ^ 2) (blochWigner I) := by sorry

/-- Test `regular_tetrahedron`. -/
example : HasSum (fun k : ℕ => Real.sin ((k + 1) * π / 3) / ((k : ℝ) + 1) ^ 2)
    (blochWigner (Complex.exp (π / 3 * I))) := by sorry

/-- Test `five_term`. -/
example : blochWigner I - blochWigner (-1) + blochWigner I - blochWigner ((1 + I) / 2) +
    blochWigner ((1 - I) / 2) = 0 := by sorry

/-- Test `im_li2_jump`. -/
example : Tendsto (fun ε : ℝ => (polylog 2 (3 + ε * I)).im - (polylog 2 (3 - ε * I)).im) (𝓝[>] 0)
    (𝓝 (2 * π * Real.log 3)) := by sorry

/-- GR's cross-ratio `[s₁, s₂, s₃, s₄]`, written out (K3BlochGroups V.4 owns the cross-ratio
`crossRatio` normalised by `cr(0, ∞, 1, x) = x`; this is `1 - 1/cr`). -/
def grCrossRatio (s₁ s₂ s₃ s₄ : ℂ) : ℂ := (s₁ - s₂) * (s₃ - s₄) / ((s₁ - s₄) * (s₃ - s₂))

/-- P.1/five-cross-ratio-identity. -/
theorem grCrossRatio_one_sub (s : Fin 5 → ℂ) (hs : Function.Injective s) (i : Fin 5) :
    1 - grCrossRatio (s i) (s (i + 1)) (s (i + 2)) (s (i + 3)) =
      -(grCrossRatio (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) *
        (grCrossRatio (s (i + 2)) (s (i + 3)) (s (i + 4)) (s i))⁻¹ *
        (grCrossRatio (s (i + 3)) (s (i + 4)) (s i) (s (i + 1)))⁻¹ := by sorry

/-- P.1/bloch-wigner-five-term, the cyclic form. -/
theorem blochWigner_fiveTerm (s : Fin 5 → ℂ) (hs : Function.Injective s) :
    ∑ i : Fin 5, blochWigner (grCrossRatio (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by sorry

/-- P.1/bloch-wigner-five-term, the two-variable form in the K-book normalisation. -/
theorem blochWigner_fiveTerm_two {x y : ℂ} (hx0 : x ≠ 0) (hx1 : x ≠ 1) (hy0 : y ≠ 0) (hy1 : y ≠ 1)
    (hxy : x ≠ y) :
    blochWigner x - blochWigner y + blochWigner (y / x) - blochWigner ((1 - x⁻¹) / (1 - y⁻¹)) +
      blochWigner ((1 - x) / (1 - y)) = 0 := by sorry

/-! ## P.2 The weight-two regulator

The pre-Bloch group `P(F)`, its generators `[x]`, its functoriality and the Bloch group
`B(F) ⊆ P(F)` are K3BlochGroups V.3's (`preBloch`, `preBloch.gen`, `preBloch.map`,
`blochGroup`), in the K-book normalisation with `[1] = 0`; they appear as variables. -/

section WeightTwo

open NumberField Classical

variable (PreBloch : ∀ (F : Type) [Field F], Type)
  [∀ (F : Type) [Field F], AddCommGroup (PreBloch F)]
  (preBlochGen : ∀ {F : Type} [Field F], F → PreBloch F)
  (preBlochMap : ∀ {F K : Type} [Field F] [Field K], (F →+* K) → PreBloch F →+ PreBloch K)
  (blochGroup : ∀ (F : Type) [Field F], AddSubgroup (PreBloch F))

/-- P.2/bloch-wigner-descent: `preBloch.lift` applied to `D`. -/
def blochWignerPreHom : PreBloch ℂ →+ ℝ := sorry

theorem blochWignerPreHom_gen (x : ℂ) :
    blochWignerPreHom PreBloch (preBlochGen x) = blochWigner x := by sorry

/-- P.2/bloch-wigner-descent: the restriction to the Bloch group. -/
def blochWignerHom : blochGroup ℂ →+ ℝ :=
  (blochWignerPreHom PreBloch).comp (blochGroup ℂ).subtype

theorem blochWignerHom_gen (b : blochGroup ℂ) (s : Finset ℂ) (m : ℂ → ℤ)
    (hb : (b : PreBloch ℂ) = ∑ x ∈ s, m x • preBlochGen x) :
    blochWignerHom PreBloch blochGroup b = ∑ x ∈ s, (m x : ℝ) * blochWigner x := by sorry

theorem blochWignerHom_torsion (b : blochGroup ℂ) (hb : IsOfFinAddOrder b) :
    blochWignerHom PreBloch blochGroup b = 0 := by sorry

theorem blochWignerHom_map {F : Type} [Field F] (σ : F →+* ℂ) (x : F) :
    blochWignerPreHom PreBloch (preBlochMap σ (preBlochGen x)) = blochWigner (σ x) := by sorry

/-- Test `kills_c`. -/
example (x : ℂ) : blochWignerPreHom PreBloch (preBlochGen x + preBlochGen (1 - x)) = 0 := by sorry

/-- Test `vanishes_real_embedding`. -/
example {F : Type} [Field F] (σ : F →+* ℂ) (hσ : ∀ x, (σ x).im = 0) (p : PreBloch F) :
    blochWignerPreHom PreBloch (preBlochMap σ p) = 0 := by sorry

/-- Test `conj_embedding`. -/
example {F : Type} [Field F] (σ : F →+* ℂ) (p : PreBloch F) :
    blochWignerPreHom PreBloch (preBlochMap ((starRingEnd ℂ).comp σ) p) =
      -blochWignerPreHom PreBloch (preBlochMap σ p) := by sorry

/-- Test `nonzero`: `[exp(iπ/3)]` lies in `B(ℂ)` and its value is positive. -/
example : preBlochGen (Complex.exp (π / 3 * I)) ∈ blochGroup ℂ ∧
    0 < blochWignerPreHom PreBloch (preBlochGen (Complex.exp (π / 3 * I))) := by sorry

-- Test `convention_blind`: not stated; needs the comparison map between the Suslin and the
-- Calegari-Garoufalidis-Zagier conventions (K3BlochGroups V.3), not a variable here.

/-- P.2/weight-two-regulator: the component at a complex place `w` uses `w.embedding`. -/
def weightTwoRegulator (F : Type) [Field F] [NumberField F] (b : blochGroup F) :
    {w : InfinitePlace F // w.IsComplex} → ℝ :=
  fun w => blochWignerPreHom PreBloch (preBlochMap w.1.embedding (b : PreBloch F))

theorem weightTwoRegulator_real_place {F : Type} [Field F] [NumberField F] (σ : F →+* ℂ)
    (hσ : ComplexEmbedding.IsReal σ) (b : blochGroup F) :
    blochWignerPreHom PreBloch (preBlochMap σ (b : PreBloch F)) = 0 := by sorry

/-- The determinant on a family indexed by the complex places. -/
def weightTwoRegulator_det (F : Type) [Field F] [NumberField F]
    (y : {w : InfinitePlace F // w.IsComplex} → blochGroup F) : ℝ :=
  Matrix.det (Matrix.of fun w j => weightTwoRegulator PreBloch preBlochMap blochGroup F (y j) w)

theorem weightTwoRegulator_conj {F : Type} [Field F] [NumberField F] (σ : F →+* ℂ) (b : blochGroup F) :
    blochWignerPreHom PreBloch (preBlochMap (ComplexEmbedding.conjugate σ) (b : PreBloch F)) =
      -blochWignerPreHom PreBloch (preBlochMap σ (b : PreBloch F)) := by sorry

theorem weightTwoRegulator_map {F L : Type} [Field F] [Field L] (ι : F →+* L) (σ : L →+* ℂ)
    (p : PreBloch F) :
    blochWignerPreHom PreBloch (preBlochMap σ (preBlochMap ι p)) =
      blochWignerPreHom PreBloch (preBlochMap (σ.comp ι) p) := by sorry

/-- Test `totally_real`. -/
example (F : Type) [Field F] [NumberField F] (hF : ∀ w : InfinitePlace F, w.IsReal) (b : blochGroup F) :
    weightTwoRegulator PreBloch preBlochMap blochGroup F b = 0 := by sorry

/-- Test `determinant_sign`. -/
example (F : Type) [Field F] [NumberField F] (y : {w : InfinitePlace F // w.IsComplex} → blochGroup F)
    (e : Equiv.Perm {w : InfinitePlace F // w.IsComplex}) :
    weightTwoRegulator_det PreBloch preBlochMap blochGroup F (y ∘ e) =
      (Equiv.Perm.sign e : ℝ) * weightTwoRegulator_det PreBloch preBlochMap blochGroup F y := by sorry

/-- Test `conj_component`. -/
example {F : Type} [Field F] [NumberField F] (σ : F →+* ℂ) (b : blochGroup F) :
    blochWignerPreHom PreBloch (preBlochMap (ComplexEmbedding.conjugate σ) (b : PreBloch F)) +
      blochWignerPreHom PreBloch (preBlochMap σ (b : PreBloch F)) = 0 := by sorry

/-- Test `eisenstein_field`: a quadratic field containing a root `ω` of `t² - t + 1`. -/
example (F : Type) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) (ω : F)
    (hω : ω ^ 2 - ω + 1 = 0) (b : blochGroup F) (hb : (b : PreBloch F) = 2 • preBlochGen ω)
    (w : {w : InfinitePlace F // w.IsComplex}) :
    |weightTwoRegulator PreBloch preBlochMap blochGroup F b w| =
      2 * blochWigner (Complex.exp (π / 3 * I)) := by sorry

/-! P.2/borel-comparison. Indecomposable `K₃`, Suslin's map to the Bloch group (K3BlochGroups
V.4) and the Borel regulator at the complex places (BorelRegulators R.4) are variables. -/

variable (K3ind : ∀ (F : Type) [Field F], Type) [∀ (F : Type) [Field F], AddCommGroup (K3ind F)]
  (suslinMap : ∀ (F : Type) [Field F], K3ind F →+ blochGroup F)
  (borelRegulator : ∀ (F : Type) [Field F] [NumberField F],
    K3ind F →+ ({w : InfinitePlace F // w.IsComplex} → ℝ))

/-- P.2/borel-comparison: some nonzero rational scalar; the exact one is BorelRegulators R.7's. -/
theorem weightTwoRegulator_eq_borel :
    ∃ q : ℚ, q ≠ 0 ∧ ∀ (F : Type) [Field F] [NumberField F] (x : K3ind F),
      weightTwoRegulator PreBloch preBlochMap blochGroup F (suslinMap F x) =
        (q : ℝ) • borelRegulator F x := by sorry

end WeightTwo

/-- The determinant bracket `[u, v] = u₀ v₁ - u₁ v₀` of two vectors in `ℂ²`. -/
def bracket (u v : Fin 2 → ℂ) : ℂ := u 0 * v 1 - u 1 * v 0

/-- Goncharov's cross-ratio of four points of `ℙ¹(ℂ)` in homogeneous coordinates, normalised by
`r(∞, 0, 1, x) = x`; it is `1 / cr` for K3BlochGroups V.4's `crossRatio`. -/
def goncharovCrossRatio (a b c d : Fin 2 → ℂ) : ℂ :=
  bracket d b * bracket c a / (bracket d a * bracket c b)

/-- P.2/bloch-wigner-cocycle: `c_x(g₁, …, g₄) = D(r(g₁x, …, g₄x))`, and `0` on degenerate tuples. -/
def blochWignerCocycle (x : Fin 2 → ℂ) (g : Fin 4 → GL (Fin 2) ℂ) : ℝ :=
  if ∀ i j, i ≠ j → bracket ((g i : Matrix (Fin 2) (Fin 2) ℂ).mulVec x)
      ((g j : Matrix (Fin 2) (Fin 2) ℂ).mulVec x) ≠ 0 then
    blochWigner (goncharovCrossRatio ((g 0 : Matrix (Fin 2) (Fin 2) ℂ).mulVec x)
      ((g 1 : Matrix (Fin 2) (Fin 2) ℂ).mulVec x) ((g 2 : Matrix (Fin 2) (Fin 2) ℂ).mulVec x)
      ((g 3 : Matrix (Fin 2) (Fin 2) ℂ).mulVec x))
  else 0

theorem blochWignerCocycle_smul (x : Fin 2 → ℂ) (h : GL (Fin 2) ℂ) (g : Fin 4 → GL (Fin 2) ℂ) :
    blochWignerCocycle x (fun i => h * g i) = blochWignerCocycle x g := by sorry

theorem blochWignerCocycle_cocycle (x : Fin 2 → ℂ) (hx : x ≠ 0) (g : Fin 5 → GL (Fin 2) ℂ) :
    ∑ i : Fin 5, (-1 : ℝ) ^ (i : ℕ) * blochWignerCocycle x (g ∘ i.succAbove) = 0 := by sorry

-- blochWignerCocycle_measurable: not stated; needs the Borel measurable structure on GL₂(ℂ).

theorem blochWignerCocycle_cohomologous (x y : Fin 2 → ℂ) (hx : x ≠ 0) (hy : y ≠ 0) :
    ∃ β : (Fin 3 → GL (Fin 2) ℂ) → ℝ, (∀ (h : GL (Fin 2) ℂ) g, β (fun i => h * g i) = β g) ∧
      ∀ g : Fin 4 → GL (Fin 2) ℂ, blochWignerCocycle x g - blochWignerCocycle y g =
        ∑ i : Fin 4, (-1 : ℝ) ^ (i : ℕ) * β (g ∘ i.succAbove) := by sorry

/-- Test `standard_quadruple`. -/
example (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) (g : Fin 4 → GL (Fin 2) ℂ)
    (hg : ∀ i, (g i : Matrix (Fin 2) (Fin 2) ℂ).mulVec ![0, 1] =
      ![![1, 0], ![0, 1], ![1, 1], ![z, 1]] i) :
    blochWignerCocycle ![0, 1] g = blochWigner z := by sorry

/-- Test `degenerate_tuple`. -/
example (x : Fin 2 → ℂ) (g : Fin 4 → GL (Fin 2) ℂ) (h : g 0 = g 1) : blochWignerCocycle x g = 0 := by
  sorry

/-- Test `cocycle_is_five_term`: at the points `∞, 0, 1, a, b` the cocycle identity is the
two-variable five-term relation. -/
example {a b : ℂ} (ha0 : a ≠ 0) (ha1 : a ≠ 1) (hb0 : b ≠ 0) (hb1 : b ≠ 1) (hab : a ≠ b) :
    blochWigner a - blochWigner b + blochWigner (b / a) - blochWigner ((1 - a⁻¹) / (1 - b⁻¹)) +
      blochWigner ((1 - a) / (1 - b)) = 0 := by sorry

/-- Test `convention_sign`: with `r` replaced by `1/r` (V.4's `crossRatio`) the values change sign. -/
example (z : ℂ) : blochWigner z⁻¹ = -blochWigner z := by sorry

-- P.2/hyperbolic-volume (Lobachevsky's volume formula): not stated; needs hyperbolic 3-space, ideal
-- tetrahedra and their volume (Tau Ceti GeometricTopology layer 7, requested) and Milnor's formula.

/-- Lobachevsky's function `Л(θ) = -∫₀^θ log |2 sin t| dt`. -/
def lobachevsky (θ : ℝ) : ℝ := -∫ t in (0 : ℝ)..θ, Real.log |2 * Real.sin t|

/-- P.2/lobachevsky-identity. -/
theorem blochWigner_eq_lobachevsky {z : ℂ} (hz : 0 < z.im) :
    blochWigner z = lobachevsky (Complex.arg z) + lobachevsky (Complex.arg (1 - z)⁻¹) +
      lobachevsky (Complex.arg (1 - z⁻¹)) := by sorry

/-- P.2/certified-numerics: a computable approximation on Gaussian rationals `(a, b) ↦ a + b i`. -/
def blochWignerApprox (z : ℚ × ℚ) (p : ℕ) : ℚ := sorry

/-- P.2/certified-numerics-error. -/
theorem blochWignerApprox_error (z : ℚ × ℚ) (hz0 : ((z.1 : ℂ) + z.2 * I) ≠ 0)
    (hz1 : ((z.1 : ℂ) + z.2 * I) ≠ 1) (p : ℕ) :
    |(blochWignerApprox z p : ℝ) - blochWigner (z.1 + z.2 * I)| ≤ (2 : ℝ)⁻¹ ^ p := by sorry

/-- P.2/certified-numerics-error: the separation lemma. -/
theorem blochWignerApprox_ne_zero (z : ℚ × ℚ) (hz0 : ((z.1 : ℂ) + z.2 * I) ≠ 0)
    (hz1 : ((z.1 : ℂ) + z.2 * I) ≠ 1) (p : ℕ) (h : (2 : ℝ)⁻¹ ^ p < |(blochWignerApprox z p : ℝ)|) :
    blochWigner (z.1 + z.2 * I) ≠ 0 := by sorry

theorem blochWignerApprox_mono {p q : ℕ} (h : p ≤ q) : (2 : ℝ)⁻¹ ^ q ≤ (2 : ℝ)⁻¹ ^ p := by sorry

/-- Test `known_value`. -/
example (p N : ℕ) : |(blochWignerApprox (0, 1) p : ℝ) -
    ∑ k ∈ Finset.range N, (-1 : ℝ) ^ k / (2 * k + 1) ^ 2| ≤ (2 : ℝ)⁻¹ ^ p + 1 / (2 * N + 1) ^ 2 := by
  sorry

/-- Test `bound_tends_to_zero`. -/
example : Tendsto (fun p : ℕ => (2 : ℝ)⁻¹ ^ p) atTop (𝓝 0) := by sorry

/-- Test `zero_at_real`. -/
example (a : ℚ) (ha0 : a ≠ 0) (ha1 : a ≠ 1) (p : ℕ) :
    |(blochWignerApprox (a, 0) p : ℝ)| ≤ (2 : ℝ)⁻¹ ^ p := by sorry

/-- Test `not_a_proof`: a value below the bound proves nothing; here `D(2) = 0`. -/
example (p : ℕ) : |(blochWignerApprox (2, 0) p : ℝ)| ≤ (2 : ℝ)⁻¹ ^ p ∧ blochWigner 2 = 0 := by sorry

/-! ## P.3 and P.4 Polylogarithmic groups and complexes

`F^×_ℚ = ℚ ⊗ Additive Fˣ`; `unitQ x` is the class of `x ≠ 0`, with `unitQ 0 = 0`. P.3 builds the
explicit complexes of weight at most three on `B₂(F) = ℚ ⊗ P(F)` (K3BlochGroups V.3) and the
trilogarithm group; P.4 builds the inductive groups `ℬ_n(F)` and the general complex. -/

section Complexes

open CategoryTheory NumberField Classical

/-- The rationalised units `F^×_ℚ`. -/
abbrev unitsQ (F : Type) [Field F] : Type := ℚ ⊗[ℤ] Additive Fˣ

/-- The class of `x` in `F^×_ℚ`, with the value `0` at `x = 0`. -/
def unitQ {F : Type} [Field F] (x : F) : unitsQ F :=
  if h : x = 0 then 0 else (1 : ℚ) ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 x h)

/-- The wedge of a list of field elements in `Λⁿ F^×_ℚ`. -/
def wedge {F : Type} [Field F] (n : ℕ) (x : Fin n → F) : ⋀[ℚ]^n (unitsQ F) :=
  exteriorPower.ιMulti ℚ n (fun i => unitQ (x i))

variable (PreBloch : ∀ (F : Type) [Field F], Type)
  [∀ (F : Type) [Field F], AddCommGroup (PreBloch F)]
  (preBlochGen : ∀ {F : Type} [Field F], F → PreBloch F)
  (preBlochMap : ∀ {F K : Type} [Field F] [Field K], (F →+* K) → PreBloch F →+ PreBloch K)
  (blochBoundaryQ : ∀ (F : Type) [Field F], ℚ ⊗[ℤ] PreBloch F →ₗ[ℚ] ⋀[ℚ]^2 (unitsQ F))

/-- `B₂(F) = ℚ ⊗ P(F)`, the explicit weight-two group. -/
abbrev explicitB2 (F : Type) [Field F] : Type := ℚ ⊗[ℤ] PreBloch F

/-- The class `{x}₂ = 1 ⊗ [x]`. -/
def b2 {F : Type} [Field F] (x : F) : explicitB2 PreBloch F := (1 : ℚ) ⊗ₜ[ℤ] preBlochGen x

/-- The weight-two differential `{x}₂ ↦ (1 - x) ∧ x`. -/
def polylogD2 (F : Type) [Field F] : explicitB2 PreBloch F →ₗ[ℚ] ⋀[ℚ]^2 (unitsQ F) := sorry

/-- The weight-three middle differential `{x}₂ ⊗ y ↦ (1 - x) ∧ x ∧ y`. -/
def polylogD32 (F : Type) [Field F] :
    explicitB2 PreBloch F ⊗[ℚ] unitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (unitsQ F) := sorry

/-- P.3/trilogarithm-group: the relations (19), `{0}₃` and the 22-term relation. -/
def trilogRelations (F : Type) [Field F] : Submodule ℚ (F →₀ ℚ) := sorry

/-- P.3/trilogarithm-group: `B₃(F) = ℚ[F] / R₃(F)`. -/
abbrev trilogGroup (F : Type) [Field F] : Type := (F →₀ ℚ) ⧸ trilogRelations F

namespace trilogGroup

variable {F : Type} [Field F]

def mk (x : F) : trilogGroup F := Submodule.Quotient.mk (Finsupp.single x 1)

@[simp] theorem mk_zero : mk (0 : F) = 0 := by sorry

theorem mk_inv {x : F} (hx : x ≠ 0) : mk x = mk x⁻¹ := by sorry

theorem mk_three_term {x : F} (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    mk x + mk (1 - x) + mk (1 - x⁻¹) = mk (1 : F) := by sorry

def lift {M : Type} [AddCommGroup M] [Module ℚ M] (f : (F →₀ ℚ) →ₗ[ℚ] M)
    (hf : trilogRelations F ≤ LinearMap.ker f) : trilogGroup F →ₗ[ℚ] M :=
  Submodule.liftQ _ f hf

def map {K : Type} [Field K] (σ : F →+* K) : trilogGroup F →ₗ[ℚ] trilogGroup K := sorry

/-- `δ₃ : B₃(F) → B₂(F) ⊗ F^×_ℚ`, `{x}₃ ↦ {x}₂ ⊗ x`. -/
def delta : trilogGroup F →ₗ[ℚ] explicitB2 PreBloch F ⊗[ℚ] unitsQ F := sorry

@[simp] theorem delta_mk {x : F} (hx : x ≠ 0) :
    delta PreBloch (mk x) = b2 PreBloch preBlochGen x ⊗ₜ[ℚ] unitQ x := by sorry

end trilogGroup

/-- Test `inversion`. -/
example {F : Type} [Field F] {x : F} (hx : x ≠ 0) : trilogGroup.mk x = trilogGroup.mk x⁻¹ := by sorry

/-- Test `three_term`: at `x = 2` over `ℚ`. -/
example : trilogGroup.mk (2 : ℚ) + trilogGroup.mk (-1 : ℚ) + trilogGroup.mk (1 / 2 : ℚ) =
    trilogGroup.mk (1 : ℚ) := by sorry

/-- Test `zero_class`. -/
example {F : Type} [Field F] : trilogGroup.mk (0 : F) = 0 := by sorry

/-- Test `one_ne_zero`. -/
example : trilogGroup.mk (1 : ℚ) ≠ 0 := by sorry

-- Test `delta_compat`: stated below as `trilogToHigher_delta`, after the inductive groups.

/-- P.3/polylogarithmic-complex: the weight-`n` complex for `n ≤ 3` in degrees `1..n`. -/
def polylogComplex (F : Type) [Field F] (n : ℕ) : CochainComplex (ModuleCat ℚ) ℤ := sorry

theorem polylogComplex_d_gen {F : Type} [Field F] {x : F} (hx0 : x ≠ 0) (hx1 : x ≠ 1) (y : F) :
    polylogD2 PreBloch F (b2 PreBloch preBlochGen x) = wedge 2 ![1 - x, x] ∧
      polylogD32 PreBloch F (b2 PreBloch preBlochGen x ⊗ₜ[ℚ] unitQ y) = wedge 3 ![1 - x, x, y] ∧
      trilogGroup.delta PreBloch (trilogGroup.mk x) = b2 PreBloch preBlochGen x ⊗ₜ[ℚ] unitQ x := by sorry

/-- P.3/weight-three-complex. -/
theorem polylogComplex_d_comp_d (F : Type) [Field F] :
    polylogD32 PreBloch F ∘ₗ trilogGroup.delta PreBloch = 0 := by sorry

theorem polylogComplex_one (F : Type) [Field F] :
    Nonempty ((polylogComplex F 1).X 1 ≅ ModuleCat.of ℚ (unitsQ F)) := by sorry

theorem polylogComplex_two (F : Type) [Field F] : polylogD2 PreBloch F = -blochBoundaryQ F := by sorry

def polylogComplex_map {F K : Type} [Field F] [Field K] (σ : F →+* K) (n : ℕ) :
    polylogComplex F n ⟶ polylogComplex K n := sorry

theorem polylogComplex_map_id (F : Type) [Field F] (n : ℕ) :
    polylogComplex_map (RingHom.id F) n = 𝟙 _ := by sorry

theorem polylogComplex_map_comp {F K L : Type} [Field F] [Field K] [Field L] (σ : F →+* K)
    (τ : K →+* L) (n : ℕ) :
    polylogComplex_map (τ.comp σ) n = polylogComplex_map σ n ≫ polylogComplex_map τ n := by sorry

theorem polylogComplex_H1_eq_ker (F : Type) [Field F] (n : ℕ) :
    Nonempty ((polylogComplex F n).homology 1 ≅
      ModuleCat.of ℚ (LinearMap.ker ((polylogComplex F n).d 1 2).hom)) := by sorry

/-- Test `d_gen_over_Q`. -/
example : polylogD32 PreBloch ℚ (b2 PreBloch preBlochGen 2 ⊗ₜ[ℚ] unitQ 3) = 0 ∧
    polylogD32 PreBloch ℚ (b2 PreBloch preBlochGen 3 ⊗ₜ[ℚ] unitQ 5) ≠ 0 := by sorry

/-- Test `d_squared_weight_three`. -/
example {F : Type} [Field F] (x : F) :
    polylogD32 PreBloch F (trilogGroup.delta PreBloch (trilogGroup.mk x)) = 0 := by sorry

/-- Test `degenerate_one`. -/
example {F : Type} [Field F] : b2 PreBloch preBlochGen (1 : F) = 0 := by sorry

/-- Test `weight_two_against_V3`. -/
example {F : Type} [Field F] (x : F) :
    polylogD2 PreBloch F (b2 PreBloch preBlochGen x) = -blochBoundaryQ F (b2 PreBloch preBlochGen x) := by
  sorry

/-- Test `sign_convention`: the convention `x ∧ (1 - x)` gives the negative differential. -/
example : wedge 3 ![(3 : ℚ), 1 - 3, 5] = -wedge 3 ![(1 : ℚ) - 3, 3, 5] := by sorry

/-! P.3/exterior-residue, for a discrete valuation ring `A` of `K`. -/

/-- `res_v : Λ^{n+1} K^× → Λⁿ k^×` over `ℤ`. -/
def resExterior {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (n : ℕ) :
    ⋀[ℤ]^(n + 1) (Additive Kˣ) →ₗ[ℤ] ⋀[ℤ]^n (Additive (IsLocalRing.ResidueField A)ˣ) := sorry

/-- The unit of `K` underlying a nonzero element of `A`. -/
def unitOf {K : Type} [Field K] {A : ValuationSubring K} (a : A) (ha : a ≠ 0) : Kˣ :=
  Units.mk0 (a : K) (by simpa using ha)

/-- The image of a unit of `A` in `Kˣ` and its residue in `kˣ`. -/
def unitInK {K : Type} [Field K] {A : ValuationSubring K} (u : Aˣ) : Kˣ :=
  Units.map (A.subtype : A →* K) u

def residueUnit {K : Type} [Field K] {A : ValuationSubring K} (u : Aˣ) :
    (IsLocalRing.ResidueField A)ˣ := Units.map (IsLocalRing.residue A : A →* _) u

theorem resExterior_uniformizer {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A]
    (n : ℕ) (ϖ : A) (hϖ : Irreducible ϖ) (u : Fin n → Aˣ) :
    resExterior A n (exteriorPower.ιMulti ℤ (n + 1)
      (Fin.cons (Additive.ofMul (unitOf ϖ hϖ.ne_zero)) fun i => Additive.ofMul (unitInK (u i)))) =
      exteriorPower.ιMulti ℤ n (fun i => Additive.ofMul (residueUnit (u i))) := by sorry

theorem resExterior_unit {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A]
    (n : ℕ) (u : Fin (n + 1) → Aˣ) :
    resExterior A n (exteriorPower.ιMulti ℤ (n + 1) fun i => Additive.ofMul (unitInK (u i))) = 0 := by sorry

theorem resExterior_indep {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A]
    (n : ℕ) (ϖ ϖ' : A) (hϖ : Irreducible ϖ) (hϖ' : Irreducible ϖ') (u : Fin n → Aˣ) :
    resExterior A n (exteriorPower.ιMulti ℤ (n + 1)
      (Fin.cons (Additive.ofMul (unitOf ϖ hϖ.ne_zero)) fun i => Additive.ofMul (unitInK (u i)))) =
    resExterior A n (exteriorPower.ιMulti ℤ (n + 1)
      (Fin.cons (Additive.ofMul (unitOf ϖ' hϖ'.ne_zero)) fun i => Additive.ofMul (unitInK (u i)))) := by
  sorry

-- resExterior_two: not stated here; needs the tame symbol of K2SymbolsBrauer:T.3/tame-symbol, which is
-- not a variable of this file. The packet states res_v(f ∧ g) = (-1)^{v(f)v(g)} tame_v{f, g}⁻¹.

/-- Test `res_uniformizer`: `res(t ∧ u₁ ∧ u₂) = ū₁ ∧ ū₂` (for `K = ℚ(t)`, `u₁ = 2`, `u₂ = 3`). -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (t : A)
    (ht : Irreducible t) (u : Fin 2 → Aˣ) :
    resExterior A 2 (exteriorPower.ιMulti ℤ 3 ![Additive.ofMul (unitOf t ht.ne_zero),
      Additive.ofMul (unitInK (u 0)), Additive.ofMul (unitInK (u 1))]) =
      exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (residueUnit (u 0)), Additive.ofMul (residueUnit (u 1))] := by
  sorry

/-- Test `res_units`. -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (u : Fin 3 → Aˣ) :
    resExterior A 2 (exteriorPower.ιMulti ℤ 3 fun i => Additive.ofMul (unitInK (u i))) = 0 := by sorry

/-- Test `res_other_uniformizer`: `res(2t ∧ 3 ∧ 5) = 3 ∧ 5`, for the uniformiser `2t`. -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (t c : A)
    (ht : Irreducible t) (hc : IsUnit c) (u : Fin 2 → Aˣ) :
    resExterior A 2 (exteriorPower.ιMulti ℤ 3 ![Additive.ofMul (unitOf (c * t)
      (Irreducible.ne_zero (irreducible_isUnit_mul hc |>.mpr ht))),
      Additive.ofMul (unitInK (u 0)), Additive.ofMul (unitInK (u 1))]) =
      exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (residueUnit (u 0)), Additive.ofMul (residueUnit (u 1))] := by
  sorry

-- Test `res_tame`: not stated; needs the tame symbol of K2SymbolsBrauer T.3 (see resExterior_two).

/-! P.3/residues-and-transfers: the residue of the weight-three complex. -/

/-- `res_v : B(K; 3) → B(k; 2)[-1]`. -/
def weightThreeResidue {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    polylogComplex K 3 ⟶ (polylogComplex (IsLocalRing.ResidueField A) 2)⟦(-1 : ℤ)⟧ := sorry

/-- The middle component `{x}₂ ⊗ y ↦ v(y) {x̄}₂` (when `v(x) = 0`). -/
def residueTensor {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    explicitB2 PreBloch K ⊗[ℚ] unitsQ K →ₗ[ℚ] explicitB2 PreBloch (IsLocalRing.ResidueField A) := sorry

theorem weightThreeResidue_trilog {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    (weightThreeResidue A).f 1 = 0 := by sorry

theorem weightThreeResidue_tensor {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A]
    (ϖ : A) (hϖ : Irreducible ϖ) (x : Aˣ) (u : Aˣ) (m : ℤ) :
    residueTensor PreBloch A (b2 PreBloch preBlochGen (unitInK x : K) ⊗ₜ[ℚ]
      unitQ ((unitOf ϖ hϖ.ne_zero : K) ^ m * (unitInK u : K))) =
      (m : ℚ) • b2 PreBloch preBlochGen (residueUnit x : IsLocalRing.ResidueField A) := by sorry

theorem weightThreeResidue_comm {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    (weightThreeResidue A).f 2 ≫ ((polylogComplex (IsLocalRing.ResidueField A) 2)⟦(-1 : ℤ)⟧).d 2 3 =
      (polylogComplex K 3).d 2 3 ≫ (weightThreeResidue A).f 3 := (weightThreeResidue A).comm 2 3

/-- The weight-two residue. -/
def weightTwoResidue {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    polylogComplex K 2 ⟶ (polylogComplex (IsLocalRing.ResidueField A) 1)⟦(-1 : ℤ)⟧ := sorry

-- weightThreeResidue_natural: not stated; needs extensions of discretely valued fields with their
-- ramification index, which Mathlib states for Dedekind domains but not for a pair of valuation subrings.

/-- Test `res_unramified`: `res_t({x}₂ ⊗ t) = {x}₂`. -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (t : A)
    (ht : Irreducible t) (x : Aˣ) :
    residueTensor PreBloch A (b2 PreBloch preBlochGen (unitInK x : K) ⊗ₜ[ℚ] unitQ (unitOf t ht.ne_zero : K)) =
      b2 PreBloch preBlochGen (residueUnit x : IsLocalRing.ResidueField A) := by sorry

/-- Test `res_ramified_zero`: `res_t({t}₂ ⊗ a) = 0` for a unit `a`. -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] (t : A)
    (ht : Irreducible t) (a : Aˣ) :
    residueTensor PreBloch A (b2 PreBloch preBlochGen (unitOf t ht.ne_zero : K) ⊗ₜ[ℚ] unitQ (unitInK a : K)) = 0 := by
  sorry

/-- Test `commutes_with_d`. -/
example {K : Type} [Field K] (A : ValuationSubring K) [IsDiscreteValuationRing A] :
    (weightThreeResidue A).f 2 ≫ ((polylogComplex (IsLocalRing.ResidueField A) 2)⟦(-1 : ℤ)⟧).d 2 3 =
      (polylogComplex K 3).d 2 3 ≫ (weightThreeResidue A).f 3 := (weightThreeResidue A).comm 2 3

-- Test `integral_two_torsion`: not stated; it is about the integral complexes, which this file does not
-- build (everything here is tensored with ℚ).

/-! P.3, the maps from K-theory. Rational K-groups, their rank filtration and Borel's regulator are
other roadmaps' (variables). -/

variable (KQ : ∀ (F : Type) [Field F], ℕ → Type) [∀ (F : Type) [Field F] (m : ℕ), AddCommGroup (KQ F m)]
  [∀ (F : Type) [Field F] (m : ℕ), Module ℚ (KQ F m)]

/-- P.3/k-theory-comparison-weight-three: the maps `K_{6-i}(F)_ℚ → H^i B(F; 3)`, `i = 1, 2, 3`. -/
def kTheoryToTrilog (F : Type) [Field F] (i : ℕ) :
    ModuleCat.of ℚ (KQ F (6 - i)) ⟶ (polylogComplex F 3).homology i := sorry

-- P.3/k-theory-comparison-weight-three (vanishing on the rank filtration F^rk_2): not stated; needs the
-- rank filtration (GeneralAlgebraicKTheory K.2:plus), not a variable here.
-- P.3/trilogarithm-regulator-borel: not stated; needs the Borel regulator on K_5(ℂ) (BorelRegulators R.4).
-- P.3/milnor-degree-comparison: not stated; needs Milnor K-theory (K2SymbolsBrauer:T.2/milnor-k-theory).

/-- P.3/weight-three-special-value, part (a): cocycles `y_j ∈ ℚ[F]` (with `δ₃ y_j = 0` in
`B₂(F) ⊗ F^×_ℚ`) whose normalised trilogarithm determinant is a nonzero rational multiple of `ζ_F(3)`;
part (b) is not established by the sources read. -/
theorem zagier_weight_three (F : Type) [Field F] [NumberField F] :
    ∃ (y : {w : InfinitePlace F // Odd 3 ∨ w.IsComplex} → (F →₀ ℚ)) (q : ℚ), q ≠ 0 ∧
      (∀ j, trilogGroup.delta PreBloch (Submodule.Quotient.mk (y j) : trilogGroup F) = 0) ∧
      (NumberField.dedekindZeta F 3).re = q * π ^ (3 * InfinitePlace.nrComplexPlaces F) *
        |(NumberField.discr F : ℝ)| ^ (-(1 / 2 : ℝ)) *
        (Matrix.of fun (w j : {w : InfinitePlace F // Odd 3 ∨ w.IsComplex}) =>
          Finsupp.linearCombination ℚ (fun z : ℂ => singleValuedPolylog 3 z)
            (Finsupp.mapDomain w.1.embedding (y j))).det := by sorry

/-! ## P.4 The inductive groups -/

/-- P.4/higher-bloch-group: the relation subspace `ℛ_n(F)`, defined for all fields at once by
recursion on `n` (specialisations at `t = 1, 0` of `Ker δ_n` over `F(t)`, and `{0}`). -/
def higherBlochRel (n : ℕ) (F : Type) [Field F] : Submodule ℚ (F →₀ ℚ) := sorry

/-- P.4/higher-bloch-group: `ℬ_n(F) = ℚ[F] / ℛ_n(F)`. -/
def higherBloch (n : ℕ) (F : Type) [Field F] : Type := (F →₀ ℚ) ⧸ higherBlochRel n F

instance (n : ℕ) (F : Type) [Field F] : AddCommGroup (higherBloch n F) :=
  inferInstanceAs (AddCommGroup ((F →₀ ℚ) ⧸ higherBlochRel n F))

instance higherBloch.module (n : ℕ) (F : Type) [Field F] : Module ℚ (higherBloch n F) :=
  inferInstanceAs (Module ℚ ((F →₀ ℚ) ⧸ higherBlochRel n F))

namespace higherBloch

variable {F : Type} [Field F]

def mk (n : ℕ) (x : F) : higherBloch n F := Submodule.Quotient.mk (Finsupp.single x 1)

/-- Points of `ℙ¹(F)`, with `∞ = none` sent to `0`. -/
def mkP1 (n : ℕ) : Option F → higherBloch n F
  | none => 0
  | some x => mk n x

@[simp] theorem mk_zero (n : ℕ) : mk n (0 : F) = 0 := by sorry
@[simp] theorem mk_infty (n : ℕ) : mkP1 n (none : Option F) = 0 := rfl

theorem induction_on (n : ℕ) : Submodule.span ℚ (Set.range (mk n : F → higherBloch n F)) = ⊤ := by sorry

theorem mk_inv (n : ℕ) (hn : 2 ≤ n) {x : F} (hx : x ≠ 0) :
    mk n x = ((-1 : ℚ) ^ (n - 1)) • mk n x⁻¹ := by sorry

theorem one : Nonempty (higherBloch 1 F ≃ₗ[ℚ] unitsQ F) := by sorry

def lift (n : ℕ) {M : Type} [AddCommGroup M] [Module ℚ M] (f : (F →₀ ℚ) →ₗ[ℚ] M)
    (hf : higherBlochRel n F ≤ LinearMap.ker f) : higherBloch n F →ₗ[ℚ] M :=
  Submodule.liftQ _ f hf

def map (n : ℕ) {K : Type} [Field K] (σ : F →+* K) : higherBloch n F →ₗ[ℚ] higherBloch n K := sorry

theorem map_id (n : ℕ) : map n (RingHom.id F) = LinearMap.id := by sorry

theorem map_comp (n : ℕ) {K L : Type} [Field K] [Field L] (σ : F →+* K) (τ : K →+* L) :
    map n (τ.comp σ) = map n τ ∘ₗ map n σ := by sorry

end higherBloch

/-- `δ_{n+1}` on `ℚ[F]`: `{x} ↦ {x}_n ⊗ x`. -/
def deltaQ (n : ℕ) (F : Type) [Field F] : (F →₀ ℚ) →ₗ[ℚ] higherBloch n F ⊗[ℚ] unitsQ F :=
  Finsupp.linearCombination ℚ fun x => higherBloch.mk n x ⊗ₜ[ℚ] unitQ x

/-- `δ₂` on `ℚ[F]`: `{x} ↦ (1 - x) ∧ x`, which vanishes at `x = 0, 1`. -/
def deltaQ2 (F : Type) [Field F] : (F →₀ ℚ) →ₗ[ℚ] ⋀[ℚ]^2 (unitsQ F) :=
  Finsupp.linearCombination ℚ fun x => wedge 2 ![1 - x, x]

/-- P.4/specialization-and-delta: `ℛ_{n+1}(F) ⊆ Ker δ_{n+1}`. -/
theorem deltaMap_descends (n : ℕ) (F : Type) [Field F] :
    higherBlochRel (n + 1) F ≤ LinearMap.ker (deltaQ n F) := by sorry

theorem deltaMap_descends_two (F : Type) [Field F] : higherBlochRel 2 F ≤ LinearMap.ker (deltaQ2 F) := by
  sorry

-- P.4/specialization-and-delta (the specialisation map s_v : ℬ_n(K) → ℬ_n(k) and its compatibility with
-- δ_n): not stated here; its consequence is deltaMap_descends.

/-- P.4/delta-map: the descended map `ℬ_{n+1}(F) → ℬ_n(F) ⊗ F^×_ℚ`. -/
def deltaMap (n : ℕ) (F : Type) [Field F] : higherBloch (n + 1) F →ₗ[ℚ] higherBloch n F ⊗[ℚ] unitsQ F :=
  higherBloch.lift (n + 1) (deltaQ n F) (deltaMap_descends n F)

/-- P.4/delta-map in weight two. -/
def deltaMap2 (F : Type) [Field F] : higherBloch 2 F →ₗ[ℚ] ⋀[ℚ]^2 (unitsQ F) :=
  higherBloch.lift 2 (deltaQ2 F) (deltaMap_descends_two F)

theorem deltaMap_gen (n : ℕ) {F : Type} [Field F] (x : F) :
    deltaMap n F (higherBloch.mk (n + 1) x) = higherBloch.mk n x ⊗ₜ[ℚ] unitQ x := by sorry

theorem deltaMap_degenerate (n : ℕ) {F : Type} [Field F] :
    deltaMap n F (higherBloch.mk (n + 1) 0) = 0 ∧ deltaMap n F (higherBloch.mk (n + 1) 1) = 0 := by sorry

theorem deltaMap_map (n : ℕ) {F K : Type} [Field F] [Field K] (σ : F →+* K) (x : F) :
    deltaMap n K (higherBloch.map (n + 1) σ (higherBloch.mk (n + 1) x)) =
      higherBloch.mk n (σ x) ⊗ₜ[ℚ] unitQ (σ x) := by sorry

/-- The weight-two sign against K3BlochGroups V.3's boundary `[x] ↦ x ∧ (1 - x)`. -/
theorem deltaMap_two_eq_blochBoundary {F : Type} [Field F] (x : F) :
    deltaMap2 F (higherBloch.mk 2 x) = -wedge 2 ![x, 1 - x] := by sorry

/-- Test `weight_two_boundary`. -/
example : deltaMap2 ℚ (higherBloch.mk 2 3) = wedge 2 ![2, 3] ∧ deltaMap2 ℚ (higherBloch.mk 2 (1 / 2)) = 0 := by
  sorry

/-- Test `weight_three_gen`. -/
example {F : Type} [Field F] (x : F) : deltaMap 2 F (higherBloch.mk 3 x) = higherBloch.mk 2 x ⊗ₜ[ℚ] unitQ x := by
  sorry

/-- Test `degenerate_zero`. -/
example {F : Type} [Field F] (n : ℕ) :
    deltaMap n F (higherBloch.mk (n + 1) 0) = 0 ∧ deltaMap n F (higherBloch.mkP1 (n + 1) none) = 0 := by sorry

/-- Test `descends`. -/
example (n : ℕ) (F : Type) [Field F] : higherBlochRel (n + 1) F ≤ LinearMap.ker (deltaQ n F) :=
  deltaMap_descends n F

/-- Test `sign_against_V3`: V.3's boundary `[x] ↦ x ∧ (1 - x)` is `-δ₂`, not `δ₂`. -/
example : deltaMap2 ℚ (higherBloch.mk 2 3) ≠ wedge 2 ![3, 1 - 3] := by sorry

/-- P.4/polylog-on-higher-bloch: `L_n` descends to `ℬ_n(ℂ)`. -/
theorem singleValuedPolylog_descends (n : ℕ) (hn : 2 ≤ n) :
    higherBlochRel n ℂ ≤ LinearMap.ker
      (Finsupp.linearCombination ℚ fun z : ℂ => singleValuedPolylog n z) := by sorry

/-- The induced map `ℬ_n(ℂ) → ℝ`. -/
def polylogHom (n : ℕ) (hn : 2 ≤ n) : higherBloch n ℂ →ₗ[ℚ] ℝ :=
  higherBloch.lift n _ (singleValuedPolylog_descends n hn)

/-- P.4/explicit-to-inductive-comparison, weight two (infinite fields). -/
theorem explicitToInductive_two (F : Type) [Field F] [Infinite F] :
    ∃ e : higherBloch 2 F ≃ₗ[ℚ] explicitB2 PreBloch F,
      ∀ x : F, e (higherBloch.mk 2 x) = b2 PreBloch preBlochGen x := by sorry

/-- `higherBloch.two`: for infinite `F`, `ℬ₂(F) ≅ ℚ ⊗ P(F)`. -/
theorem higherBloch.two (F : Type) [Field F] [Infinite F] :
    Nonempty (higherBloch 2 F ≃ₗ[ℚ] explicitB2 PreBloch F) := by sorry

/-- Test `inv_two`. -/
example {F : Type} [Field F] {x : F} (hx : x ≠ 0) : higherBloch.mk 2 x + higherBloch.mk 2 x⁻¹ = 0 := by sorry

/-- Test `one_two`. -/
example {F : Type} [Field F] : higherBloch.mk 2 (1 : F) = 0 := by sorry

/-- Test `one_three_ne_zero`. -/
example : higherBloch.mk 3 (1 : ℚ) ≠ 0 := by sorry

/-- Test `not_kernel`: `{exp(iπ/3)}₂` lies in `Ker δ₂` but not in `ℛ₂(ℂ)`. -/
example : higherBlochRel 2 ℂ ≠ LinearMap.ker (deltaQ2 ℂ) := by sorry

/-- P.4/explicit-to-inductive-comparison, weight three: the natural surjection `B₃(F) → ℬ₃(F)`. -/
def trilogToHigher (F : Type) [Field F] : trilogGroup F →ₗ[ℚ] higherBloch 3 F :=
  trilogGroup.lift (Submodule.mkQ _) sorry

theorem trilogToHigher_surjective (F : Type) [Field F] [Infinite F] :
    Function.Surjective (trilogToHigher F) := by sorry

/-- The compatibility of `δ₃` (test `delta_compat` of P.3/trilogarithm-group). -/
theorem trilogToHigher_delta (F : Type) [Field F] [Infinite F] (x : F) (e : higherBloch 2 F ≃ₗ[ℚ] explicitB2 PreBloch F)
    (he : ∀ y : F, e (higherBloch.mk 2 y) = b2 PreBloch preBlochGen y) :
    TensorProduct.map e.toLinearMap LinearMap.id (deltaMap 2 F (trilogToHigher F (trilogGroup.mk x))) =
      trilogGroup.delta PreBloch (trilogGroup.mk x) := by sorry

/-- P.4/general-polylog-complex. -/
def generalPolylogComplex (F : Type) [Field F] (n : ℕ) : CochainComplex (ModuleCat ℚ) ℤ := sorry

/-- The differential `{x}_{k+1} ⊗ y₁ ∧ … ↦ {x}_k ⊗ x ∧ y₁ ∧ …` on pure tensors. -/
def generalPolylogD (F : Type) [Field F] (k m : ℕ) :
    higherBloch (k + 1) F ⊗[ℚ] ⋀[ℚ]^m (unitsQ F) →ₗ[ℚ] higherBloch k F ⊗[ℚ] ⋀[ℚ]^(m + 1) (unitsQ F) := sorry

theorem generalPolylogComplex_d_gen {F : Type} [Field F] (k m : ℕ) (x : F) (y : Fin m → F) :
    generalPolylogD F k m (higherBloch.mk (k + 1) x ⊗ₜ[ℚ] wedge m y) =
      higherBloch.mk k x ⊗ₜ[ℚ] wedge (m + 1) (Fin.cons x y) := by sorry

theorem generalPolylogComplex_d_comp_d (F : Type) [Field F] (n : ℕ) (i : ℤ) :
    (generalPolylogComplex F n).d i (i + 1) ≫ (generalPolylogComplex F n).d (i + 1) (i + 2) = 0 :=
  HomologicalComplex.d_comp_d _ _ _ _

def generalPolylogComplex_map {F K : Type} [Field F] [Field K] (σ : F →+* K) (n : ℕ) :
    generalPolylogComplex F n ⟶ generalPolylogComplex K n := sorry

theorem generalPolylogComplex_H1 (F : Type) [Field F] (n : ℕ) :
    Nonempty ((generalPolylogComplex F (n + 1)).homology 1 ≅ ModuleCat.of ℚ (LinearMap.ker (deltaMap n F))) := by
  sorry

theorem generalPolylogComplex_three_explicit (F : Type) [Field F] [Infinite F] :
    ∃ f : polylogComplex F 3 ⟶ generalPolylogComplex F 3, Function.Surjective (f.f 1).hom := by sorry

/-- Test `d_comp_d_weight_four`: `{x}₄ ↦ {x}₃ ⊗ x ↦ {x}₂ ⊗ (x ∧ x) = 0`. -/
example {F : Type} [Field F] (x : F) :
    deltaMap 3 F (higherBloch.mk 4 x) = higherBloch.mk 3 x ⊗ₜ[ℚ] unitQ x ∧
      generalPolylogD F 2 1 (higherBloch.mk 3 x ⊗ₜ[ℚ] wedge 1 ![x]) = 0 := by sorry

/-- Test `weight_one`. -/
example (F : Type) [Field F] : Nonempty ((generalPolylogComplex F 1).X 1 ≅ ModuleCat.of ℚ (unitsQ F)) := by
  sorry

/-- Test `H1_is_kernel`. -/
example (F : Type) [Field F] :
    Nonempty ((generalPolylogComplex F 2).homology 1 ≅ ModuleCat.of ℚ (LinearMap.ker (deltaMap2 F))) := by
  sorry

/-- Test `not_a_cocycle`. -/
example : deltaMap2 ℚ (higherBloch.mk 2 3) ≠ 0 := by sorry

/-- P.4/goncharov-comparison-conjecture, as a statement: `gr^n_γ K_{2n-i}(F)_ℚ ≅ H^i B(F; n)`,
with the γ-graded pieces a variable (SchemeKTheoryOperations S.6). -/
def GoncharovConjecture (grGammaK : ∀ (F : Type) [Field F], ℕ → ℕ → Type)
    [∀ (F : Type) [Field F] (n m : ℕ), AddCommGroup (grGammaK F n m)]
    [∀ (F : Type) [Field F] (n m : ℕ), Module ℚ (grGammaK F n m)]
    (F : Type) [Field F] (n i : ℕ) : Prop :=
  Nonempty (ModuleCat.of ℚ (grGammaK F n (2 * n - i)) ≅ (generalPolylogComplex F n).homology i)

/-- The cocycles `H¹ B(F; n) = Ker δ_n ⊆ ℬ_n(F)`: everything in weight at most one, `Ker δ₂`
(into `Λ²`) in weight two, and `Ker δ_n` (into `ℬ_{n-1} ⊗ F^×_ℚ`) from weight three on. -/
def cocycles (F : Type) [Field F] : (n : ℕ) → Submodule ℚ (higherBloch n F)
  | 0 => ⊤
  | 1 => ⊤
  | 2 => LinearMap.ker (deltaMap2 F)
  | k + 3 => LinearMap.ker (deltaMap (k + 2) F)

/-- P.4/condition-o-n: GR's condition `*_n`, `δ_n y = 0`. -/
def ConditionStar {F : Type} [Field F] (n : ℕ) (y : higherBloch n F) : Prop := y ∈ cocycles F n

theorem conditionStar_iff_H1 {F : Type} [Field F] (k : ℕ) (y : higherBloch (k + 3) F) :
    ConditionStar (k + 3) y ↔ deltaMap (k + 2) F y = 0 := LinearMap.mem_ker

/-- The elements satisfying `*_n` form a subspace. -/
def conditionStar_subspace (F : Type) [Field F] (n : ℕ) : Submodule ℚ (higherBloch n F) := cocycles F n

theorem conditionStar_map {F K : Type} [Field F] [Field K] (σ : F →+* K) (n : ℕ)
    (y : higherBloch n F) (hy : ConditionStar n y) : ConditionStar n (higherBloch.map n σ y) := by
  sorry

/-- Test `fails_over_Q`: `δ₂{3}₂ = 2 ∧ 3 ≠ 0`. -/
example : ¬ ConditionStar 2 (higherBloch.mk 2 (3 : ℚ)) := by sorry

/-- Test `one_three`. -/
example : ConditionStar 3 (higherBloch.mk 3 (1 : ℚ)) := by sorry

/-- Test `weight_two_compat`: `*_2` is membership in `Ker δ₂`, the rationalised Bloch group. -/
example (F : Type) [Field F] (y : higherBloch 2 F) : ConditionStar 2 y ↔ deltaMap2 F y = 0 :=
  LinearMap.mem_ker

/-- Test `subspace`. -/
example (F : Type) [Field F] (n : ℕ) (y z : higherBloch n F) (hy : ConditionStar n y)
    (hz : ConditionStar n z) (q : ℚ) : ConditionStar n (y + q • z) :=
  (cocycles F n).add_mem hy ((cocycles F n).smul_mem q hz)

/-! P.4/zagier-determinant. -/

/-- The places indexing the matrix: all infinite places for odd `n`, the complex ones for even `n`. -/
abbrev zagierIndex (F : Type) [Field F] [NumberField F] (n : ℕ) : Type :=
  {w : InfinitePlace F // Odd n ∨ w.IsComplex}

def zagierMatrix {F : Type} [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n)
    (y : zagierIndex F n → higherBloch n F) : Matrix (zagierIndex F n) (zagierIndex F n) ℝ :=
  Matrix.of fun w j => polylogHom n hn (higherBloch.map n w.1.embedding (y j))

def zagierDet {F : Type} [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n)
    (y : zagierIndex F n → higherBloch n F) : ℝ :=
  (if Odd n then π ^ (n * InfinitePlace.nrComplexPlaces F)
    else π ^ (n * (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F))) *
    |(NumberField.discr F : ℝ)| ^ (-(1 / 2 : ℝ)) * (zagierMatrix n hn y).det

theorem zagierDet_dependent {F : Type} [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n)
    (y : zagierIndex F n → higherBloch n F) (hy : ¬ LinearIndependent ℚ y) : zagierDet n hn y = 0 := by sorry

theorem zagierDet_two {F : Type} [Field F] [NumberField F] (y : zagierIndex F 2 → higherBloch 2 F) :
    zagierDet 2 le_rfl y = π ^ (2 * (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F)) *
      |(NumberField.discr F : ℝ)| ^ (-(1 / 2 : ℝ)) * (zagierMatrix 2 le_rfl y).det := by sorry

theorem zagierDet_sign {F : Type} [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n)
    (y : zagierIndex F n → higherBloch n F) (e : Equiv.Perm (zagierIndex F n)) :
    zagierDet n hn (y ∘ e) = (Equiv.Perm.sign e : ℝ) * zagierDet n hn y := by sorry

/-- Test `Q_weight_three`. -/
example (y : zagierIndex ℚ 3 → higherBloch 3 ℚ) (hy : ∀ w, y w = higherBloch.mk 3 1) :
    zagierDet 3 (by norm_num) y = (riemannZeta 3).re := by sorry

/-- Test `Qi_weight_two`: a quadratic field with `i`. -/
example (F : Type) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) (i : F) (hi : i ^ 2 = -1)
    (y : zagierIndex F 2 → higherBloch 2 F) (hy : ∀ w, y w = higherBloch.mk 2 i) :
    |zagierDet 2 le_rfl y| = 3 * (NumberField.dedekindZeta F 2).re := by sorry

/-- Test `Qi_weight_three`. -/
example (F : Type) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) (i : F) (hi : i ^ 2 = -1)
    (y : zagierIndex F 3 → higherBloch 3 F) (hy : ∀ w, y w = higherBloch.mk 3 1) :
    zagierDet 3 (by norm_num) y = 16 * (NumberField.dedekindZeta F 3).re := by sorry

/-- Test `Q_weight_four_empty`. -/
example (y : zagierIndex ℚ 4 → higherBloch 4 ℚ) : zagierDet 4 (by norm_num) y = 90 * (riemannZeta 4).re := by
  sorry

/-- Test `real_rows_vanish`. -/
example {F : Type} [Field F] [NumberField F] (w : InfinitePlace F) (hw : w.IsReal) (x : F) :
    polylogHom 2 le_rfl (higherBloch.map 2 w.embedding (higherBloch.mk 2 x)) = 0 := by sorry

/-- Test `dependent_vanishes`. -/
example {F : Type} [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n) (y : zagierIndex F n → higherBloch n F)
    (w w' : zagierIndex F n) (hww : w ≠ w') (h : y w = y w') : zagierDet n hn y = 0 := by sorry

/-- P.4/zagier-statement, (Z1): existence. -/
def ZagierExistence (F : Type) [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n) : Prop :=
  ∃ y : zagierIndex F n → higherBloch n F, (∀ j, ConditionStar n (y j)) ∧ zagierDet n hn y ≠ 0

/-- P.4/zagier-statement, (Z3): the identity for every family of cocycles, with `q = 0` allowed. -/
def ZagierIdentity (F : Type) [Field F] [NumberField F] (n : ℕ) (hn : 2 ≤ n) : Prop :=
  ∀ y : zagierIndex F n → higherBloch n F, (∀ j, ConditionStar n (y j)) →
    ∃ q : ℚ, zagierDet n hn y = q * (NumberField.dedekindZeta F n).re

-- P.4/zagier-statement, (Z2): GoncharovConjecture at i = 1 (above).

/-- P.4/weight-four-theorem (GR Theorem 1.2), with the case `r₂ = 0` corrected. -/
theorem zagier_weight_four (F : Type) [Field F] [NumberField F] :
    (0 < InfinitePlace.nrComplexPlaces F → ∃ y : zagierIndex F 4 → higherBloch 4 F,
      (∀ j, ConditionStar 4 (y j)) ∧ zagierDet 4 (by norm_num) y = (NumberField.dedekindZeta F 4).re) ∧
    ZagierIdentity F 4 (by norm_num) := by sorry

-- P.4/freeness-extension: not stated; needs GR's combinatorial Lie coalgebra L_{≤4}(F) (the proposed
-- Part II).

end Complexes

/-! ## P.5 Curves and regulator complexes

The forms are prototyped on open subsets of complex vector spaces, where Mathlib has differential
forms (`extDeriv`). Currents on complex manifolds, integration over subvarieties, Chow varieties,
Bloch's cycle complex and the Deligne-Beilinson complex are missing (packet gaps and requests), so
the constructions that need them are named in comments. -/

section Forms

/-- P.5/weight-two-regulator-form, in a chart: `η(f, g) = log|f| d arg g - log|g| d arg f`, with
`d arg g = Im(g'/g dz)`. -/
def regulatorForm (f g : ℂ → ℂ) (z : ℂ) : ℂ →L[ℝ] ℝ :=
  Real.log ‖f z‖ • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv g z / g z))) -
    Real.log ‖g z‖ • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv f z / f z)))

theorem regulatorForm_add_left (f₁ f₂ g : ℂ → ℂ) (z : ℂ) (h₁ : DifferentiableAt ℂ f₁ z)
    (h₂ : DifferentiableAt ℂ f₂ z) (h₁0 : f₁ z ≠ 0) (h₂0 : f₂ z ≠ 0) :
    regulatorForm (f₁ * f₂) g z = regulatorForm f₁ g z + regulatorForm f₂ g z := by sorry

theorem regulatorForm_antisymm (f g : ℂ → ℂ) (z : ℂ) : regulatorForm g f z = -regulatorForm f g z := by
  sorry

theorem regulatorForm_const (c : ℂ) (g : ℂ → ℂ) (z : ℂ) :
    regulatorForm (fun _ => c) g z =
      Real.log ‖c‖ • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv g z / g z))) := by sorry

/-- Closedness off the divisors: the derivative of `η` is symmetric. -/
theorem regulatorForm_closed (f g : ℂ → ℂ) (z : ℂ) (hf : DifferentiableAt ℂ f z)
    (hg : DifferentiableAt ℂ g z) (hf0 : f z ≠ 0) (hg0 : g z ≠ 0) (v w : ℂ) :
    fderiv ℝ (regulatorForm f g) z v w = fderiv ℝ (regulatorForm f g) z w v := by sorry

theorem regulatorForm_steinberg {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    regulatorForm id (fun w => 1 - w) z = blochWignerDiff z := by sorry

/-- Test `regulatorForm_constants`. -/
example (c c' z : ℂ) : regulatorForm (fun _ => c) (fun _ => c') z = 0 := by sorry

-- Test `regulatorForm_residue_P1`: dη(z, c) = -2π log|c| (δ₀ - δ_∞) on ℙ¹; not stated, needs currents (gap).

-- regulatorForm_residue: not stated; needs currents on a curve (gap): dη(f, g) = 2π Σ_x log|tame_x{f, g}| δ_x.

theorem regulatorForm_conj (f g : ℂ → ℂ) (hf : ∀ w, f (starRingEnd ℂ w) = starRingEnd ℂ (f w))
    (hg : ∀ w, g (starRingEnd ℂ w) = starRingEnd ℂ (g w)) (z : ℂ) :
    (regulatorForm f g (starRingEnd ℂ z)).comp Complex.conjCLE.toContinuousLinearMap =
      -regulatorForm f g z := by sorry

/-- Goncharov's forms `r_m(f₀, …, f_m)`, an `m`-form with values in `ℝ(m)`, on an open subset of a
complex vector space off the divisors (P.5/r-form; the packet's `r_{m-1}` of `m` functions is
`rForm (m - 1)` here). -/
def rForm {E : Type} [NormedAddCommGroup E] [NormedSpace ℂ E] (m : ℕ) (f : Fin (m + 1) → E → ℂ)
    (x : E) : E [⋀^Fin m]→L[ℝ] ℂ := sorry

/-- The coefficients `c_{j,m} = 1 / ((2j+1)! (m-2j-1)!)` of (13), for `2j + 1 ≤ m`. -/
def rFormCoeff (j m : ℕ) : ℚ := 1 / ((2 * j + 1).factorial * (m - 2 * j - 1).factorial)

theorem rForm_zero {E : Type} [NormedAddCommGroup E] [NormedSpace ℂ E] (f : Fin 1 → E → ℂ) (x : E) :
    rForm 0 f x = ContinuousAlternatingMap.constOfIsEmpty ℝ E (Fin 0) (Real.log ‖f 0 x‖ : ℂ) := by sorry

theorem rForm_one (f g : ℂ → ℂ) (z v : ℂ) : rForm 1 ![f, g] z ![v] = I * regulatorForm f g z v := by sorry

theorem regulatorForm_eq_rForm (f g : ℂ → ℂ) (z v : ℂ) : (rForm 1 ![f, g] z ![v]) = I * regulatorForm f g z v :=
  rForm_one f g z v

-- rForm_two: the explicit alternation Alt₃((1/6) log|f₁| dlog|f₂| ∧ dlog|f₃| - (1/2) log|f₁| d arg f₂ ∧
-- d arg f₃); not written out here (it is `rForm 2` with `rFormCoeff 0 3 = 1/2`, `rFormCoeff 1 3 = 1/6`).

/-- `d r_1 = π₂(dlog f ∧ dlog g) = 0` on a curve: the one case of `d r_{m-1} = π_m(dlog f₁ ∧ …)` stated
here (the wedge of 1-forms is not in the pinned Mathlib). -/
theorem rForm_d (f g : ℂ → ℂ) (z : ℂ) (hf : DifferentiableAt ℂ f z) (hg : DifferentiableAt ℂ g z)
    (hf0 : f z ≠ 0) (hg0 : g z ≠ 0) : extDeriv (rForm 1 ![f, g]) z = 0 := by sorry

-- rForm_eq_omega: not stated; needs ω_{m-1} of (15), which needs the wedge of 1-forms.

/-- Test `rForm_zero`. -/
example (f : ℂ → ℂ) (z : ℂ) :
    rForm 0 ![f] z = ContinuousAlternatingMap.constOfIsEmpty ℝ ℂ (Fin 0) (Real.log ‖f z‖ : ℂ) := by sorry

/-- Test `rForm_one`: `r₁(z ∧ (1 - z)) = i dD`. -/
example {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) (v : ℂ) :
    rForm 1 ![id, fun w => 1 - w] z ![v] = I * blochWignerDiff z v := by sorry

/-- Test `rForm_const`: the form does not kill constants. -/
example (c z v : ℂ) (hz : z ≠ 0) :
    rForm 1 ![fun _ => c, id] z ![v] = I * (Real.log ‖c‖ * (v / z).im) := by sorry

/-- Test `rForm_range`. -/
example : rFormCoeff 0 3 = 1 / 2 ∧ rFormCoeff 1 3 = 1 / 6 ∧ ∀ j, 2 * j + 1 ≤ 3 → j ≤ 1 := by sorry

/-- P.5/chow-dilogarithm on `X = ℙ¹`: `-(2π)⁻¹ ∫_ℂ r₂(f₁ ∧ f₂ ∧ f₃)`, the 2-form evaluated on the
oriented frame `(1, i)`. For a general curve the integral over `X(ℂ)` needs integration of forms on a
complex manifold (gap). -/
def chowDilog (f : Fin 3 → ℂ → ℂ) : ℝ := -(2 * π)⁻¹ * ∫ z : ℂ, (rForm 2 f z ![1, I]).re

-- chowDilog_const, chowDilog_P1, chowDilog_steinberg: not stated in general; they need the orders of
-- rational functions at the points of ℙ¹ (the divisor of a rational function), not set up here. The cases
-- below are the tests.

/-- Test `chowDilog_P1_line`. -/
example {a : ℂ} (ha0 : a ≠ 0) (ha1 : a ≠ 1) :
    chowDilog ![fun z => 1 - z, id, fun z => z - a] = blochWigner a := by sorry

/-- Test `chowDilog_real`. -/
example (f : Fin 3 → ℂ → ℂ) (hf : ∀ i w, f i (starRingEnd ℂ w) = starRingEnd ℂ (f i w)) : chowDilog f = 0 := by
  sorry

/-- Test `chowDilog_not_imaginary`: the printed normalisation is `i` times the real one. -/
example (f : Fin 3 → ℂ → ℂ) :
    (2 * π * I)⁻¹ * ∫ z : ℂ, rForm 2 f z ![1, I] = I * chowDilog f := by sorry

/-- Test `chowDilog_alternating`. -/
example (f : Fin 3 → ℂ → ℂ) : chowDilog (f ∘ Equiv.swap 0 1) = -chowDilog f := by sorry

-- P.5/strong-reciprocity-implies-suslin: not stated; needs the function field of a curve with its
-- places (Tau Ceti TauCeti.Place, not imported here) and Matsumoto's theorem (K2SymbolsBrauer T.2).

-- P.5/r-forms-and-distributions (Theorem 2.4): not stated; needs currents on complex manifolds (gap).

-- P.5/residue-map: varietyResidue, varietyResidue_finite, varietyResidue_normalization, and the tests
-- res_line, res_units, res_curve_agrees: not stated; need the irreducible divisors of a normal variety
-- (their discrete valuations are P.3's `resExterior`).

-- P.5/r-form-differential (Proposition 2.8): not stated; needs currents (gap).

/-- P.5/simplex-form: `r_m(L; H)` for the coordinate simplex in the affine chart `z₀ = 1`, where
`H = {z₁ + ⋯ = z₀}` is sent to infinity; the coordinates are the functions `zᵢ / z₀`. -/
def simplexForm (m : ℕ) (x : Fin (m + 1) → ℂ) : (Fin (m + 1) → ℂ) [⋀^Fin m]→L[ℝ] ℂ :=
  rForm m (fun i p => p i) x

theorem simplexForm_perm (m : ℕ) (e : Equiv.Perm (Fin (m + 1))) (x : Fin (m + 1) → ℂ) :
    rForm m (fun i p => p (e i)) x = (Equiv.Perm.sign e : ℤ) • simplexForm m x := by sorry

-- simplexForm_d, simplexForm_d_current: `d r_{m-1}(L; H) = π_m(Ω_L)` off `L`, and Corollary 2.9 as currents:
-- not stated; need the wedge of 1-forms and currents (gap).

/-- Test `simplexForm_one`: `r₀ = log |z|`. -/
example (x : Fin 1 → ℂ) :
    simplexForm 0 x = ContinuousAlternatingMap.constOfIsEmpty ℝ (Fin 1 → ℂ) (Fin 0) (Real.log ‖x 0‖ : ℂ) := by
  sorry

/-- Test `simplexForm_depends_on_H`: with the hyperplane `{λ}` the form is `log |z / λ|`. -/
example (x : Fin 1 → ℂ) (lam : ℂ) (hl : lam ≠ 0) :
    rForm 0 (fun _ p => p 0 / lam) x =
      ContinuousAlternatingMap.constOfIsEmpty ℝ (Fin 1 → ℂ) (Fin 0) ((Real.log ‖x 0‖ - Real.log ‖lam‖ : ℝ) : ℂ) := by
  sorry

/-- Test `simplexForm_perm`. -/
example (x : Fin 2 → ℂ) :
    rForm 1 (fun i p => p (Equiv.swap 0 1 i)) x = -simplexForm 1 x := by sorry

-- P.5/goncharov-deligne-complex (goncharovDeligneComplex, goncharovDeligneComplex_real,
-- goncharovDeligneComplex_degrees, goncharovDeligneComplex_top; tests point_weight_one, degrees,
-- comparison) and P.5/goncharov-deligne-complex-comparison: not stated; need currents of type (p, q) on
-- a complex manifold (gap) and, for the comparison, the Deligne-Beilinson complex (MotivicEtaleKTheory M.8).

-- P.5/regulator-map-on-higher-chow (chowRegulator, chowRegulator_apply, chowRegulator_top,
-- chowRegulator_chainMap, chowRegulator_real, chowRegulator_point; tests point_case, top_degree,
-- normalisation, not_on_classes), P.5/regulator-map-chain-map and P.5/regulator-map-real: not stated;
-- need Bloch's cycle complex (MotivicEtaleKTheory M.4) and Goncharov's Deligne complex (above).

-- P.5/chow-polylogarithm-forms (chowPolylog, chowPolylog_d_zero, chowPolylog_d, chowPolylog_vertex,
-- chowPolylog_analytic, chowPolylogFunction, chowPolylogFunction_torus_invariant,
-- chowPolylog_reformulation; tests q_two_is_chow_dilogarithm, torus_invariance, not_invariant_below_top,
-- cocycle, p_zero): not stated; need Chow varieties (gap) and currents (gap).

-- P.5/arakelov-motivic-complex (arakelovComplex, arakelovComplex_real, arakelovComplex_numberField,
-- higherArakelovChow, higherArakelovChow_zero, arakelovComplex_triangle; tests arakelov_point,
-- cone_triangle, real_variant, depends_on_motivic_complex) and P.5/higher-arakelov-chow-degree-zero:
-- not stated; need the regulator map above; the cone is Mathlib's `CochainComplex.mappingCone`.

-- P.5/regulator-induces-beilinson (Burgos Gil-Feliu-Takeda, Theorem 6.18): not stated; needs Beilinson's
-- regulator (MotivicEtaleKTheory M.8) and the Chern character (M.6).

-- P.5/unramified-weight-two-class: not stated; needs closed currents on a projective curve (gap).

-- P.5/strong-reciprocity-conjecture (IsReciprocityHom, StrongReciprocityConjecture,
-- isReciprocityHom_second_triangle; tests P1_case, res_nonzero, imaginary_normalisation, real_curves),
-- P.5/reciprocity-second-triangle, P.5/chow-dilogarithm-steinberg, P.5/chow-dilogarithm-projective-line,
-- P.5/reciprocity-projective-line, P.5/chow-dilogarithm-families, P.5/reciprocity-algebraic-numbers,
-- P.5/chow-dilogarithm-on-elliptic-curves, P.5/chow-dilogarithm-plane-curves and
-- P.5/general-weight-reciprocity-conjecture (GeneralReciprocityConjecture, generalReciprocity_three,
-- generalReciprocity_two; tests weight_three_cases, weight_two, not_assumed): not stated; need the
-- function field of a curve with its places (Tau Ceti TauCeti.Place), the curve complexes and, for (b),
-- integration over X(ℂ). The projective-line cases are the tests of `chowDilog` above.

-- P.5/curve-polylogarithmic-complex (curvePolylogComplex, curveResidue, curveResidue_finite,
-- unramifiedClasses, curvePolylogComplex_map; tests res_P1, res_delta_two_torsion, curveResidue_finite,
-- weil_product): not stated; needs the places of a function field (Tau Ceti TauCeti.Place,
-- TauCeti.Place.ord, TauCeti.Place.finite_setOf_ord_ne_zero), which this Mathlib-only file does not import.

/-- `α(f, g) = log|f| dlog|g| - log|g| dlog|f|`, with `dlog|g| = Re(g'/g dz)`. -/
def alphaForm (f g : ℂ → ℂ) (z : ℂ) : ℂ →L[ℝ] ℝ :=
  Real.log ‖f z‖ • (Complex.reCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv g z / g z))) -
    Real.log ‖g z‖ • (Complex.reCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv f z / f z)))

/-- P.5/weight-three-curve-regulator, in a chart: `ρ₂({f}₂ ⊗ g) = D(f) d arg g - (1/3) α(1 - f, f) log|g|`. -/
def weightThreeCurveRegulator (f g : ℂ → ℂ) (z : ℂ) : ℂ →L[ℝ] ℝ :=
  blochWigner (f z) • (Complex.imCLM.comp (ContinuousLinearMap.mul ℝ ℂ (deriv g z / g z))) -
    ((1 / 3 : ℝ) * Real.log ‖g z‖) • alphaForm (fun w => 1 - f w) f z

-- weightThreeCurveRegulator_d: dρ₂({f}₂ ⊗ g) = 2π D(f) δ(g) + r₂((1 - f) ∧ f ∧ g) as currents: not
-- stated; needs currents (gap). Its integrated form on ℙ¹ is the test rho2_d_P1 below.

theorem weightThreeCurveRegulator_diag {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    HasFDerivAt (singleValuedPolylog 3) (-weightThreeCurveRegulator id id z) z := by sorry

/-- Test `rho2_diag_exact`. -/
example {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    fderiv ℝ (singleValuedPolylog 3) z = -weightThreeCurveRegulator id id z := by sorry

/-- Test `rho2_d_P1`: `∫ r₂((1 - z) ∧ z ∧ (z - a)) = -2π D(a)`. -/
example {a : ℂ} (ha0 : a ≠ 0) (ha1 : a ≠ 1) :
    ∫ z : ℂ, (rForm 2 ![fun w => 1 - w, id, fun w => w - a] z ![1, I]).re = -(2 * π) * blochWigner a := by
  sorry

-- Test `rho_not_chow_trilog`: not stated; it contrasts ρ₃, a 2-current on the curve, with ω³₂, a function
-- on Chow varieties of surfaces in ℙ⁵ (gap).

/-- Test `rho_constant_g`. -/
example (f : ℂ → ℂ) (c z : ℂ) :
    weightThreeCurveRegulator f (fun _ => c) z =
      -(((1 / 3 : ℝ) * Real.log ‖c‖) • alphaForm (fun w => 1 - f w) f z) := by sorry

end Forms

/-! ## P.6 Leopoldt's conjecture and the tests

The p-adic logarithm is PadicHodgeRegulators D.1's; it is a variable `logp`. -/

section Leopoldt

open NumberField

variable (p : ℕ) [Fact p.Prime] (logp : PadicAlgCl p → PadicAlgCl p)

/-- P.6/padic-regulator: `(log_p σ_j(ε_i))`, an `r × d` matrix, for embeddings `σ_j : K → ℚ̄_p`. -/
def padicRegulatorMatrix (K : Type) [Field K] [NumberField K]
    (σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) :
    Matrix (Fin (Units.rank K)) (Fin (Module.finrank ℚ K)) (PadicAlgCl p) :=
  Matrix.of fun i j => logp (σ j ((Units.fundSystem K i : 𝓞 K) : K))

/-- The p-adic regulator rank `rr_p(K)`. -/
def padicRegulatorRank (K : Type) [Field K] [NumberField K]
    (σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) : ℕ :=
  (padicRegulatorMatrix p logp K σ).rank

theorem padicRegulatorRank_indep (K : Type) [Field K] [NumberField K]
    (σ σ' : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) (hσ : Function.Bijective σ)
    (hσ' : Function.Bijective σ') :
    padicRegulatorRank p logp K σ = padicRegulatorRank p logp K σ' := by sorry

theorem padicRegulatorRank_le (K : Type) [Field K] [NumberField K]
    (σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) : padicRegulatorRank p logp K σ ≤ Units.rank K := by
  sorry

/-- The p-adic regulator of a totally real field: a `(d-1) × (d-1)` minor, up to sign. -/
def padicRegulator (K : Type) [Field K] [NumberField K]
    (σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) : PadicAlgCl p :=
  ((padicRegulatorMatrix p logp K σ).submatrix id (Fin.castLE (by sorry))).det

/-- P.6/leopoldt-statement, in the rank form (NSW 10.3.5). The injectivity form
`E_K ⊗ ℤ_p → ∏ Û_𝔭` needs the p-adic completion of the local unit groups, not set up here. -/
def LeopoldtConjecture (K : Type) [Field K] [NumberField K] : Prop :=
  ∀ σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p), Function.Bijective σ →
    padicRegulatorRank p logp K σ = Units.rank K

-- leopoldt_iff_rank (P.6/leopoldt-equivalence, NSW 10.3.6): not stated; needs the completed unit groups.

theorem leopoldt_abelian (K : Type) [Field K] [NumberField K] [IsGalois ℚ K]
    (hK : ∀ a b : K ≃ₐ[ℚ] K, a * b = b * a) : LeopoldtConjecture p logp K := by sorry

/-- Test `imaginary_quadratic`. -/
example (K : Type) [Field K] [NumberField K] (h : Units.rank K = 0) : LeopoldtConjecture p logp K := by sorry

/-- Test `naive_map_injective`: the uncompleted map is always injective. -/
example (K : Type) [Field K] [NumberField K] :
    Function.Injective (fun u : (𝓞 K)ˣ => ((u : 𝓞 K) : K)) := by sorry

/-- Test `real_quadratic`, and test `padicRegulator_Q_sqrt2_7` (a real quadratic field with `p = 7`,
where `log₇ σ(1 + √2)` has valuation one). -/
example (hp : p = 7) (K : Type) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2)
    (s : K) (hs : s ^ 2 = 2) (hlog : ∀ x : PadicAlgCl p, x ≠ 1 → logp x ≠ 0) :
    LeopoldtConjecture p logp K := by sorry

/-- Test `abelian_case`. -/
example (K : Type) [Field K] [NumberField K] [IsGalois ℚ K] (hK : ∀ a b : K ≃ₐ[ℚ] K, a * b = b * a) :
    LeopoldtConjecture p logp K := leopoldt_abelian p logp K hK

/-- Test `padicRegulator_imag_quadratic`. -/
example (K : Type) [Field K] [NumberField K] (h : Units.rank K = 0)
    (σ : Fin (Module.finrank ℚ K) → (K →+* PadicAlgCl p)) : padicRegulatorRank p logp K σ = 0 := by sorry

-- Test `rank_two_places`: not stated; it contrasts the matrix with one indexed by the places above p.
-- Test `unit_not_root_of_unity`: a property of the p-adic logarithm of PadicHodgeRegulators D.1 (the
-- variable `logp` here).

end Leopoldt

/-- P.6/tests, test 1: the five-term relation at `x = i/2`, `y = (1 + i)/2`, an exact instance. -/
example : blochWigner (I / 2) - blochWigner ((1 + I) / 2) + blochWigner (1 - I) - blochWigner (2 - I) +
    blochWigner ((3 + I) / 2) = 0 := by sorry

end TauCeti.Polylog
