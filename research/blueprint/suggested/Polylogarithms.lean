/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation: every node of the blueprint has
implementationStatus `unchecked`, and every `sorry` is a planning placeholder.

Roadmap `Polylogarithms` (Polylogarithms, explicit regulators and Zagier statements),
assembled by ASM-Polylogarithms from the suggested files of its six parts:
the first packet (BP-Polylogarithms, REV-Polylogarithms and its fix rounds) and the
follow-up parts P.2–P.6 (BP-Polylogarithms--P.2 … --P.6 with their reviews; the P.3
part's review asks for a revision of its signatures, see the P.3 section).
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports individual Mathlib modules only: the Tau Ceti declarations the
first packet cites (places of a function field, their orders and residues, the degree
of a principal divisor, the unit filtration) are named in comments.

Layout. The first packet's declarations come first, in layer order P.1–P.6, in the
namespace `TauCeti.Polylog`. Each follow-up part follows in its own section with its own
`open`s: P.2 in `TauCeti.Polylog`, P.3 in `TauCeti.Polylog.WeightThree`, P.4 in
`TauCeti.Polylog.WeightFour`, P.5 in `TauCeti.CurveRegulator` (the namespace its packet
records), P.6 in `TauCeti.Polylog`. Names are those of the packets. Where a part
prototyped an object the first packet declares, the part uses the first packet's
declaration: P.2's local `D` is `blochWigner`, its `lobachevsky` is the first packet's,
P.3's `UnitsQ` is `unitsQ`, and P.6's three supplier prototypes are the first packet's
`polylog`, `singleValuedPolylog` and `blochWigner`.

Conventions. Objects another roadmap owns appear as `variable`s or as parameters, never
as invented definitions: the pre-Bloch group, its generators and the Bloch group
(K3BlochGroups V.3); indecomposable K₃ and Suslin's map (K3BlochGroups V.4); the Borel
regulator (BorelRegulators R.4); rational K-groups; the p-adic logarithm. Statements
about them are forms, true once the supplier instantiates them. No missing theorem is
encoded as an assumed structure field or a placeholder `Prop`: the `Prop`-valued
definitions (the condition `*_n`, Goncharov's, Zagier's and Leopoldt's statements,
P.4's assertions and homotopy statement) have their actual content. Unit tests are
`example`s whose docstring or preceding comment names the test the packet gives. An API
item or theorem that cannot be stated honestly yet is a comment
`-- <name>: not stated; needs <missing object>` with its exact statement in the roadmap.
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
import Mathlib.Analysis.SpecialFunctions.Integrability.LogMeromorphic
import Mathlib.Analysis.SpecialFunctions.Integrals.LogTrigonometric
import Mathlib.Analysis.Complex.Norm
import Mathlib.Analysis.PSeries
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Rat.Cast.Order
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.Finsupp.Defs
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.Algebra.DirectSum.Module
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.Analysis.Distribution.Distribution
import Mathlib.Analysis.Normed.Module.Alternating.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Data.Finsupp.BigOperators
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Analysis.SpecialFunctions.Complex.LogDeriv

noncomputable section

section FirstPacket

/-
First packet. P.5 keeps Goncharov's concrete current complex; its comparison with the
general real Deligne complex needs the early part of MotivicEtaleKTheory M.8, not all of
M.8. P.6's rank-form `LeopoldtConjecture` is the adapter through which this roadmap reads
IntegralIwasawaTheory I.2's completed-unit map and strong Leopoldt proposition; its
equivalence with I.2's form is unstated until those carriers exist. The weak cyclotomic
theorem and the abelian case (L4) stay distinct. Ordinary units need an explicit pro-p or
Teichmüller passage before a principal-unit logarithm applies.
-/

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

-- P.2/hyperbolic-volume: P.2 is the sole owner of the ideal-tetrahedron identity vol I = D(r).
-- GeometricTopology layer 7 supplies metric/volume foundations; layer 8 supplies the model.
-- Both layers are explicit stage prerequisites of this node, with separate supplier requests.
-- The ideal boundary, oriented ideal tetrahedra and finite-region-volume interface require
-- an early GeometricTopology Part II extension (packet gap), before P.2 and QT.5.
-- Milnor's Lobachevsky-volume formula is P.2's own separate proof gap. The geometric theorem
-- is therefore not stated. Neither missing interface is claimed as an existing supplier result.
-- ArithmeticQuantumTopology QT.5 imports this identity for the manifold volume sum; it is
-- not an input here. Keep r(infinity, 0, 1, z) = z, so D(r) = -D(V.4.crossRatio).

/-- P.2/lobachevsky-function: Lobachevsky's function `Л(θ) = -∫₀^θ log |2 sin t| dt`, in
Milnor's normalization (the Clausen function is `Cl₂(2θ) = 2 Л(θ)`). Its API is in the
P.2 follow-up section below. -/
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

-- leopoldt_iff_rank (P.6/leopoldt-equivalence, NSW 10.3.6): not stated; needs
-- I.2 completed global/local unit groups and their map, with torsion treatment.

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

end FirstPacket

/-! ## P.2 follow-up: Lobachevsky, Kummer, certified Fourier numerics, Milnor, calibration -/

section P2FollowUp

/-
P.2 part (BP-Polylogarithms--P.2, REV-Polylogarithms--P.2). The eight first-packet P.2
nodes are not redeclared. `blochWignerFourierApprox` implements the first packet's
`blochWignerApprox` contract (P.2/certified-numerics), and its error theorem gives
`blochWignerApprox_error` with the bound 1/(2·2^p). The ideal-tetrahedron theorem is not
stated: GeometricTopology's metric and volume and the requested Part II region and boundary
interface have no pinned carrier; its analytic sector calculation is stated below. The
exact Borel/Suslin scalar remains a gap, not an axiom or a `Prop` field.
-/

open MeasureTheory Filter
open scoped BigOperators Real Interval

namespace TauCeti.Polylog

-- `D` is P.1's Bloch–Wigner function: its integral formula Im Li₂(z) + arg(1 − z) log |z|,
-- with Li₂(z) = −∫₀¹ log(1 − tz)/t dt, is the definition of `blochWigner` above.
local notation "D" => blochWigner

-- P.2/lobachevsky-function is the first packet's `lobachevsky` above (one declaration).

theorem lobachevsky_integrand_intervalIntegrable (a b : ℝ) :
    IntervalIntegrable (fun t => Real.log |2 * Real.sin t|) volume a b := by sorry

@[simp] theorem lobachevsky_zero : lobachevsky 0 = 0 := by sorry
@[simp] theorem lobachevsky_pi_div_two : lobachevsky (π / 2) = 0 := by sorry

theorem lobachevsky_neg (θ : ℝ) : lobachevsky (-θ) = -lobachevsky θ := by sorry

theorem lobachevsky_add_pi (θ : ℝ) : lobachevsky (θ + π) = lobachevsky θ := by sorry

theorem lobachevsky_continuous : Continuous lobachevsky := by sorry

theorem lobachevsky_hasDerivAt {θ : ℝ} (hθ : Real.sin θ ≠ 0) :
    HasDerivAt lobachevsky (-Real.log |2 * Real.sin θ|) θ := by sorry

theorem lobachevsky_integral_compat :
    lobachevsky π = -(∫ t in (0 : ℝ)..π, Real.log (Real.sin t)) - π * Real.log 2 ∧
      lobachevsky π = 0 := by sorry

/-- Test `lobachevsky_zero`. -/
example : lobachevsky 0 = 0 := by sorry
/-- Test `lobachevsky_half_period`. -/
example : lobachevsky (π / 2) = 0 := by sorry
/-- Test `lobachevsky_catalan_half`: distinguishes Lambda from Cl_2(2 theta). -/
example : lobachevsky (π / 4) =
    (1 / 2 : ℝ) * ∑' k : ℕ, (-1 : ℝ) ^ k / (2 * (k : ℝ) + 1) ^ 2 := by sorry
/-- Test `lobachevsky_native_integral`. -/
example : lobachevsky π = -(∫ t in (0 : ℝ)..π, Real.log (Real.sin t)) - π * Real.log 2 ∧
    lobachevsky π = 0 := by sorry

/-- P.2/lobachevsky-fourier: n begins at 1, and the convergence is uniform in theta. -/
theorem lobachevsky_fourier :
    (∀ θ : ℝ, Summable
      (fun k : ℕ => |Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) /
        (2 * (((k + 1 : ℕ) : ℝ) ^ 2))|)) ∧
    (∀ θ : ℝ, HasSum
      (fun k : ℕ => Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) /
        (2 * (((k + 1 : ℕ) : ℝ) ^ 2))) (lobachevsky θ)) ∧
    TendstoUniformly
      (fun N θ => ∑ k ∈ Finset.range N,
        Real.sin (2 * ((k + 1 : ℕ) : ℝ) * θ) / (2 * (((k + 1 : ℕ) : ℝ) ^ 2)))
      lobachevsky atTop := by sorry

/-- P.2/lobachevsky-duplication. -/
theorem lobachevsky_duplication (θ : ℝ) :
    lobachevsky (2 * θ) = 2 * lobachevsky θ + 2 * lobachevsky (θ + π / 2) := by sorry

/-- P.2/unit-circle-fourier, on the canonical P.1 expression. -/
theorem blochWigner_unit_fourier {w : ℂ} (hw : ‖w‖ = 1) :
    Summable (fun k : ℕ => |(w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)|) ∧
    HasSum (fun k : ℕ => (w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)) (D w) := by sorry

/-- P.2/unit-circle-fourier-tail; includes w = 1. -/
theorem blochWigner_unit_fourier_tail {w : ℂ} (hw : ‖w‖ = 1)
    {N : ℕ} (hN : 1 ≤ N) :
    |D w - ∑ k ∈ Finset.range N, (w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2)| ≤
      1 / (N : ℝ) := by sorry

/-- P.2/kummer-unit-reduction. No cut or half-plane restriction. -/
theorem blochWigner_kummer {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    let w₀ := z / starRingEnd ℂ z
    let w₁ := (1 / (1 - z)) / starRingEnd ℂ (1 / (1 - z))
    let w₂ := (1 - 1 / z) / starRingEnd ℂ (1 - 1 / z)
    (‖w₀‖ = 1 ∧ ‖w₁‖ = 1 ∧ ‖w₂‖ = 1) ∧
      D z = (D w₀ + D w₁ + D w₂) / 2 := by sorry

/-- P.2/rational-unit-shapes. All helpers are local rational formulas. -/
def rationalUnitShapes (z : ℚ × ℚ) : Fin 3 → ℚ × ℚ :=
  if z = (0, 0) ∨ z = (1, 0) then fun _ => (1, 0)
  else
    let ρ : ℚ → ℚ → ℚ × ℚ := fun x y =>
      ((x ^ 2 - y ^ 2) / (x ^ 2 + y ^ 2), 2 * x * y / (x ^ 2 + y ^ 2))
    let w₀ := ρ z.1 z.2
    let w₂ := ρ (z.1 - 1) z.2
    fun j => match j.val with
      | 0 => w₀
      | 1 => ρ (1 - z.1) z.2
      | _ => (w₂.1 * w₀.1 + w₂.2 * w₀.2, -w₂.1 * w₀.2 + w₂.2 * w₀.1)

local notation "ι" => (fun z : ℚ × ℚ => ((((Prod.fst z) : ℚ) : ℂ) + (((Prod.snd z) : ℚ) : ℂ) * Complex.I))

@[simp] theorem rationalUnitShapes_zero (j : Fin 3) :
    rationalUnitShapes (0, 0) j = (1, 0) := by sorry
@[simp] theorem rationalUnitShapes_one (j : Fin 3) :
    rationalUnitShapes (1, 0) j = (1, 0) := by sorry

theorem rationalUnitShapes_conj (a b : ℚ) (j : Fin 3) :
    rationalUnitShapes (a, -b) j =
      ((rationalUnitShapes (a, b) j).1, -(rationalUnitShapes (a, b) j).2) := by sorry

theorem rationalUnitShapes_real (a : ℚ) (j : Fin 3) :
    rationalUnitShapes (a, 0) j = (1, 0) := by sorry

/-- P.2/rational-unit-shapes-correct; promoted compatibility API. -/
theorem rationalUnitShapes_correct {q : ℚ × ℚ} (h0 : q ≠ (0, 0)) (h1 : q ≠ (1, 0)) :
    (∀ j : Fin 3, ‖ι (rationalUnitShapes q j)‖ = 1) ∧
    (∀ j : Fin 3, ι (rationalUnitShapes q j) =
      match j.val with
      | 0 => ι q / starRingEnd ℂ (ι q)
      | 1 => (1 / (1 - ι q)) / starRingEnd ℂ (1 / (1 - ι q))
      | _ => (1 - 1 / ι q) / starRingEnd ℂ (1 - 1 / ι q)) := by sorry

/-- Test `unit_shapes_i`. -/
example : rationalUnitShapes (0, 1) 0 = (-1, 0) ∧
    rationalUnitShapes (0, 1) 1 = (0, 1) ∧ rationalUnitShapes (0, 1) 2 = (0, 1) := by sorry
/-- Test `unit_shapes_exceptional`. -/
example (j : Fin 3) : rationalUnitShapes (0, 0) j = (1, 0) ∧
    rationalUnitShapes (1, 0) j = (1, 0) := by sorry
/-- Test `unit_shapes_real_two`. -/
example (j : Fin 3) : rationalUnitShapes (2, 0) j = (1, 0) := by sorry
/-- Test `unit_shapes_native_norm`. -/
example {q : ℚ × ℚ} (h0 : q ≠ (0, 0)) (h1 : q ≠ (1, 0)) (j : Fin 3) :
    ‖ι (rationalUnitShapes q j)‖ = 1 := by sorry

/-- P.2/rational-fourier-sum. The recurrence computes genuine rational powers. -/
def rationalFourierSum (w : ℚ × ℚ) (N : ℕ) : ℚ :=
  let power : ℕ → ℚ × ℚ := fun n =>
    Nat.rec (1, 0) (fun _ q => (q.1 * w.1 - q.2 * w.2, q.1 * w.2 + q.2 * w.1)) n
  ∑ k ∈ Finset.range N, (power (k + 1)).2 / (((k + 1 : ℕ) : ℚ) ^ 2)

@[simp] theorem rationalFourierSum_zero (w : ℚ × ℚ) : rationalFourierSum w 0 = 0 := by sorry
@[simp] theorem rationalFourierSum_one (N : ℕ) : rationalFourierSum (1, 0) N = 0 := by sorry

theorem rationalFourierSum_conj (a b : ℚ) (N : ℕ) :
    rationalFourierSum (a, -b) N = -rationalFourierSum (a, b) N := by sorry

theorem rationalFourierSum_succ (w : ℚ × ℚ) (N : ℕ) :
    (rationalFourierSum w (N + 1) : ℝ) = (rationalFourierSum w N : ℝ) +
      (ι w ^ (N + 1)).im / (((N + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- P.2/rational-fourier-compatibility; promoted API. -/
theorem rationalFourierSum_coe (w : ℚ × ℚ) (N : ℕ) :
    (rationalFourierSum w N : ℝ) =
      ∑ k ∈ Finset.range N, (ι w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- Test `fourier_sum_i_three`. -/
example : rationalFourierSum (0, 1) 3 = 8 / 9 := by sorry
/-- Test `fourier_sum_empty`. -/
example : rationalFourierSum (2, 3) 0 = 0 := by sorry
/-- Test `fourier_sum_one`. -/
example : rationalFourierSum (1, 0) 7 = 0 := by sorry
/-- Test `fourier_sum_native_powers`. -/
example (w : ℚ × ℚ) (N : ℕ) : (rationalFourierSum w N : ℝ) =
    ∑ k ∈ Finset.range N, (ι w ^ (k + 1)).im / (((k + 1 : ℕ) : ℝ) ^ 2) := by sorry

/-- P.2/rational-fourier-approximation; 3*2^p terms per circle. -/
def blochWignerFourierApprox (z : ℚ × ℚ) (p : ℕ) : ℚ :=
  (∑ j : Fin 3, rationalFourierSum (rationalUnitShapes z j) (3 * 2 ^ p)) / 2

theorem blochWignerFourierApprox_formula (z : ℚ × ℚ) (p : ℕ) :
    blochWignerFourierApprox z p =
      (∑ j : Fin 3, rationalFourierSum (rationalUnitShapes z j) (3 * 2 ^ p)) / 2 := by sorry

@[simp] theorem blochWignerFourierApprox_zero (p : ℕ) :
    blochWignerFourierApprox (0, 0) p = 0 := by sorry
@[simp] theorem blochWignerFourierApprox_one (p : ℕ) :
    blochWignerFourierApprox (1, 0) p = 0 := by sorry

theorem blochWignerFourierApprox_real (a : ℚ) (p : ℕ) :
    blochWignerFourierApprox (a, 0) p = 0 := by sorry

theorem blochWignerFourierApprox_conj (a b : ℚ) (p : ℕ) :
    blochWignerFourierApprox (a, -b) p = -blochWignerFourierApprox (a, b) p := by sorry

/-- P.2/rational-fourier-error; promoted compatibility API with the stronger bound. -/
theorem blochWignerFourierApprox_error {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ) :
    |(blochWignerFourierApprox z p : ℝ) - D (ι z)| ≤ 1 / (2 * (2 : ℝ) ^ p) ∧
    |(blochWignerFourierApprox z p : ℝ) - D (ι z)| ≤ 1 / (2 : ℝ) ^ p := by sorry

/-- Strict sign consequence, never merely a nonzero numerical output. -/
theorem blochWignerFourierApprox_pos {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : (1 : ℚ) / 2 ^ p < blochWignerFourierApprox z p) : 0 < D (ι z) := by sorry

theorem blochWignerFourierApprox_neg {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : blochWignerFourierApprox z p < -(1 : ℚ) / 2 ^ p) : D (ι z) < 0 := by sorry

theorem blochWignerFourierApprox_ne_zero {z : ℚ × ℚ}
    (h0 : z ≠ (0, 0)) (h1 : z ≠ (1, 0)) (p : ℕ)
    (h : (1 : ℚ) / 2 ^ p < |blochWignerFourierApprox z p|) : D (ι z) ≠ 0 := by sorry

/-- Finite sums carry weighted error radii; Bloch boundary membership is a separate supplier. -/
theorem blochWignerFourierApprox_sum_error {I : Type*} (s : Finset I)
    (z : I → ℚ × ℚ) (n : I → ℤ) (p : I → ℕ)
    (h0 : ∀ i ∈ s, z i ≠ (0, 0)) (h1 : ∀ i ∈ s, z i ≠ (1, 0)) :
    |(∑ i ∈ s, (n i : ℝ) * (blochWignerFourierApprox (z i) (p i) : ℝ)) -
      ∑ i ∈ s, (n i : ℝ) * D (ι (z i))| ≤
        ∑ i ∈ s, |(n i : ℝ)| / (2 : ℝ) ^ p i := by sorry

/-- Test `approx_i_precision_zero`. -/
example : blochWignerFourierApprox (0, 1) 0 = 8 / 9 := by sorry
/-- Test `approx_i_precision_one`. -/
example : blochWignerFourierApprox (0, 1) 1 = 209 / 225 := by sorry
/-- Test `approx_exceptional`. -/
example (p : ℕ) : blochWignerFourierApprox (0, 0) p = 0 ∧
    blochWignerFourierApprox (1, 0) p = 0 := by sorry
/-- Test `approx_real_two`. -/
example (p : ℕ) : blochWignerFourierApprox (2, 0) p = 0 := by sorry
/-- Test `approx_conjugate`. -/
example : blochWignerFourierApprox (0, -1) 0 = -8 / 9 := by sorry

-- idealTetrahedron_volume_eq_lobachevsky: not stated; requires the canonical
-- curvature -1 metric/volume from GeometricTopology layers 7–8 and early Part II
-- ideal boundary, measurable tetrahedron regions and ordered orientation.
-- The inherited idealTetrahedron_volume_eq_blochWigner uses the same supplier.

/-- Analytic sector integral in the proof of P.2/milnor-angle-volume. -/
theorem milnor_sector_integral {a : ℝ} (ha : 0 < a) (ha' : a < π / 2) :
    (∫ x in (0 : ℝ)..Real.cos a,
      ∫ y in (0 : ℝ)..(x * Real.tan a), 1 / (2 * (1 - x ^ 2 - y ^ 2))) =
        lobachevsky a / 2 := by sorry

/-- P.2/goncharov-elementary-calibration. Here e12,e21,e22 use indices 0,1. -/
theorem goncharov_weightTwo_elementaryCalibration :
    let X : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 0 ∧ j = 1 then 1 else 0
    let Y : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 1 ∧ j = 0 then 1 else 0
    let Z : Matrix (Fin 2) (Fin 2) ℂ := fun i j => if i = 1 ∧ j = 1 then 1 else 0
    let alt := Matrix.trace (X * Y * Z) + Matrix.trace (Y * Z * X) +
      Matrix.trace (Z * X * Y) - Matrix.trace (X * Z * Y) -
      Matrix.trace (Z * Y * X) - Matrix.trace (Y * X * Z)
    alt = -3 ∧ (1 / 2 : ℂ) * alt = -3 / 2 ∧ (-1 / 6 : ℂ) * alt = 1 / 2 := by sorry

-- Exact borel-comparison: not stated. Recompute the failed source calibration,
-- compare beta_DR with AF.1a and R.4's Burgos class, divide by the fixed Tate
-- generator 2*pi*i, and compare the natural V.4 Suslin/Hurewicz maps.
-- R.7/weight-two-bloch-wigner is a consumer of this P.2 result, not a premise.

end TauCeti.Polylog

end P2FollowUp

/-! ## P.3 follow-up: configurations and the weight-three comparison -/

section P3FollowUp

/-
P.3 part (BP-Polylogarithms--P.3; REV-Polylogarithms--P.3, verdict needs_changes).
The native configuration and finite-sum prototypes below are meaningful; generic module
parameters are not the first packet's B₂/B₃ merely because comments call them so, and
the false universal claims have been removed. Names marked "not stated" need the first
packet's B₂/B₃ quotient symbols, differential laws, Γ, L₃ and regulator bound into their
signatures; a revision of the P.3 part binds them. No desired theorem is replaced by a
`Prop` field.
-/

open scoped TensorProduct DirectSum
namespace TauCeti.Polylog.WeightThree

section Relation
variable {F : Type} [Field F]

private def bracket (z : F) : F →₀ ℚ := Finsupp.single z 1
private def relationBlock (a b c : F) : F →₀ ℚ :=
  let A := c*a-a+1
  let B := b*c-c+1
  bracket A + bracket (A/(c*a)) + bracket c + bracket (B/(A*b)) -
    bracket (A/c) + bracket (-B*a/A) - bracket (B/(A*b*c)) - bracket 1

/-- The corrected coordinate formula. Admissibility is required for the quotient theorem. -/
def relation22 (a b c : F) : F →₀ ℚ :=
  relationBlock a b c + relationBlock c a b + relationBlock b c a + bracket (-a*b*c)

private def admissible (a b c : F) : Prop :=
  a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ c*a-a+1 ≠ 0 ∧ a*b-b+1 ≠ 0 ∧ b*c-c+1 ≠ 0

theorem relation22_cyclic (a b c : F) : relation22 a b c = relation22 c a b := by sorry

theorem relation22_map {E : Type} [Field E] (f : F →+* E) (a b c : F) :
    Finsupp.lmapDomain ℚ ℚ f (relation22 a b c) = relation22 (f a) (f b) (f c) := by sorry

theorem relation22_eval {M : Type} [AddCommGroup M] [Module ℚ M]
    (v : F → M) (a b c : F) :
    Finsupp.linearCombination ℚ v (relation22 a b c) =
      Finsupp.linearCombination ℚ v (relationBlock a b c) +
      Finsupp.linearCombination ℚ v (relationBlock c a b) +
      Finsupp.linearCombination ℚ v (relationBlock b c a) + v (-a*b*c) := by sorry

-- TauCeti.Polylog.WeightThree.relation22_quotient: not stated; needs the
-- actual parent B₃ quotient symbol and its relation-kernel law. An arbitrary
-- F → B₃ cannot satisfy this statement (R(1,1,1)=3[1]+4[−1]).

/-- Test `TauCeti.Polylog.WeightThree.relation222`. -/
example : relation22 (2 : ℚ) 2 2 =
    3 • bracket 3 + 3 • bracket (3/4) + 3 • bracket 2 + 3 • bracket (1/2) +
    3 • bracket (-2 : ℚ) - 3 • bracket (3/2) - 3 • bracket (1/4) -
    3 • bracket 1 + bracket (-8 : ℚ) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.relation111`. -/
example : relation22 (1 : ℚ) 1 1 = 3 • bracket 1 + 4 • bracket (-1 : ℚ) := by sorry

/-- Native quotient used only to test equality modulo inversion, not to define B₃. -/
private def inversionSpan : Submodule ℚ (F →₀ ℚ) :=
  Submodule.span ℚ {v | ∃ z : F, z ≠ 0 ∧ v = bracket z - bracket z⁻¹}
/-- Test `TauCeti.Polylog.WeightThree.relation11c`. -/
example (c : F) (hc : c ≠ 0) :
    (inversionSpan (F := F)).mkQ (relation22 1 1 c) =
      (inversionSpan (F := F)).mkQ (-bracket (c^2) + 4 • bracket c + 4 • bracket (-c)) := by sorry
end Relation

section Configurations
variable (F : Type) [Field F]

/-- Genericity uses native linear independence, including subfamilies shorter than the rank. -/
private def IsGeneric {q m : ℕ} (l : Fin m → Fin q → F) : Prop :=
  ∀ k : ℕ, k ≤ q → ∀ e : Fin k → Fin m, Function.Injective e →
    LinearIndependent F (fun i => l (e i))

def GenericTuple (q m : ℕ) := {l : Fin m → Fin q → F // IsGeneric F l}

private def genericGL {q m : ℕ} (g : Matrix.GeneralLinearGroup (Fin q) F)
    (l : GenericTuple F q m) : GenericTuple F q m :=
  ⟨fun i => (g.val).mulVec (l.val i), by sorry⟩

/-- The permutation representation on native finite formal sums of generic tuples. -/
private def configRepresentation (q m : ℕ) :
    Representation ℚ (Matrix.GeneralLinearGroup (Fin q) F) (GenericTuple F q m →₀ ℚ) where
  toFun g := Finsupp.lmapDomain ℚ ℚ (genericGL F g)
  map_one' := by sorry
  map_mul' := by sorry

abbrev Config (q m : ℕ) := Representation.Coinvariants (configRepresentation F q m)

def configMk {q m : ℕ} (l : GenericTuple F q m) : Config F q m :=
  Representation.Coinvariants.mk (configRepresentation F q m) (Finsupp.single l 1)

theorem configMk_gl {q m : ℕ} (g : Matrix.GeneralLinearGroup (Fin q) F)
    (l : GenericTuple F q m) : configMk F (genericGL F g l) = configMk F l := by sorry

variable {M : Type} [AddCommGroup M] [Module ℚ M]

def configLift {q m : ℕ} (f : GenericTuple F q m → M)
    (h : ∀ g l, f (genericGL F g l) = f l) : Config F q m →ₗ[ℚ] M := by sorry

/-- The universal property is part of the API, not just existence of a map. -/
theorem configLift_mk {q m : ℕ} (f : GenericTuple F q m → M)
    (h : ∀ g l, f (genericGL F g l) = f l) (l : GenericTuple F q m) :
    configLift F f h (configMk F l) = f l := by sorry

theorem config_ext {q m : ℕ} (f g : Config F q m →ₗ[ℚ] M)
    (h : ∀ l, f (configMk F l) = g (configMk F l)) : f = g := by sorry

/-- Target tuple size decreases by one; deletion itself works in every row. -/
def configDelete {q m : ℕ} (i : Fin (m+1)) : Config F q (m+1) →ₗ[ℚ] Config F q m := by sorry

/-- Quotienting by the chosen nonzero vector lowers ambient dimension as well. -/
def configProject {q m : ℕ} (i : Fin (m+1)) :
    Config F (q+1) (m+1) →ₗ[ℚ] Config F q m := by sorry

theorem config_coinvariants (q m : ℕ) :
    Config F q m = Representation.Coinvariants (configRepresentation F q m) := by sorry

/-- Test `TauCeti.Polylog.WeightThree.generic_basis`. -/
example : IsGeneric ℚ (fun i j : Fin 3 => if i = j then 1 else 0) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.generic_zero`. -/
example {q m : ℕ} (hq : 1 ≤ q) (l : Fin m → Fin q → F) (i : Fin m)
    (hi : l i = 0) : ¬IsGeneric F l := by sorry
private def pairOne (a : ℚ) (ha : a ≠ 0) : GenericTuple ℚ 1 2 := ⟨![![1], ![a]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.config_ratios`. -/
example : configMk ℚ (pairOne 2 (by norm_num)) ≠ configMk ℚ (pairOne 3 (by norm_num)) := by sorry

abbrev bigrassmannian (m : ℕ) := ⨁ q : {q : ℕ // 3 ≤ q ∧ q < m}, Config F q.val m

def bigrassmannianD (m : ℕ) : bigrassmannian F (m+1) →ₗ[ℚ] bigrassmannian F m := by sorry

/-- Deletion and projection sums; signs refer to zero-based indices. -/
private def deleteD (q m : ℕ) : Config F q (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configDelete F i
private def projectD (q m : ℕ) : Config F (q+1) (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configProject F i

-- TauCeti.Polylog.WeightThree.bigrassmannianD_component: not stated here;
-- needs the dependent row-inclusion/projection API for the finite direct sum.
-- Its required statement is exactly deletion in row q and projection in row q−1.
theorem bigrassmannianD_sq (m : ℕ) :
    (bigrassmannianD F m).comp (bigrassmannianD F (m+1)) = 0 := by sorry

def bigrassmannian_corner : bigrassmannian F 4 ≃ₗ[ℚ] Config F 3 4 := by sorry

-- TauCeti.Polylog.WeightThree.bigrassmannian_map: not stated; needs the
-- induced generic-tuple field map and its native coinvariant map.

/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_degree3`. -/
example : Subsingleton (bigrassmannian F 3) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_degree4`. -/
example : (bigrassmannianD F 3) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_mixed`. -/
example : (deleteD F 3 5).comp (projectD F 3 6) +
    (projectD F 3 5).comp (deleteD F 4 6) = 0 := by sorry
end Configurations

section Ratios
variable {F : Type} [Field F]
private def minor {m : ℕ} (l : Fin m → Fin 3 → F) (i j k : Fin m) : F :=
  Matrix.det (fun a : Fin 3 => (![l i, l j, l k] : Fin 3 → Fin 3 → F) a)

/-- In GR §7's order, the inverse of the V.4 cross-ratio. -/
def projectedRatio (l : GenericTuple F 3 5) : F :=
  minor l.val 0 1 3 * minor l.val 0 2 4 /
    (minor l.val 0 1 4 * minor l.val 0 2 3)

theorem projectedRatio_ne (l : GenericTuple F 3 5) :
    projectedRatio l ≠ 0 ∧ projectedRatio l ≠ 1 := by sorry

theorem projectedRatio_gl (g : Matrix.GeneralLinearGroup (Fin 3) F)
    (l : GenericTuple F 3 5) : projectedRatio (genericGL F g l) = projectedRatio l := by sorry

private def scaled {m : ℕ} (s : Fin m → Fˣ) (l : GenericTuple F 3 m) :
    GenericTuple F 3 m := ⟨fun i => (s i : F) • l.val i, by sorry⟩

theorem projectedRatio_scale (s : Fin 5 → Fˣ) (l : GenericTuple F 3 5) :
    projectedRatio (scaled s l) = projectedRatio l := by sorry
-- TauCeti.Polylog.WeightThree.projectedRatio_blochCrossRatio: not stated;
-- needs V.4's ordered projective quotient-point cross-ratio carrier/map.

private def moment (t : ℚ) : Fin 3 → ℚ := ![1,t,t^2]
private def moment5 : GenericTuple ℚ 3 5 :=
  ⟨fun i => moment (![1,2,3,5,7] i), by sorry⟩
private def permute {q m : ℕ} (l : GenericTuple F q m) (σ : Equiv.Perm (Fin m)) :
    GenericTuple F q m := ⟨fun i => l.val (σ i), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_moment`. -/
example : projectedRatio moment5 = 6/5 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_swap`. -/
example : projectedRatio (permute moment5 (Equiv.swap 3 4)) = 5/6 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_bad`. -/
example : ¬ IsGeneric ℚ (![0, moment 2, moment 3, moment 5, moment 7]) := by sorry

def tripleRatio (l : GenericTuple F 3 6) : F :=
  minor l.val 0 1 3 * minor l.val 1 2 4 * minor l.val 0 2 5 /
    (minor l.val 0 1 4 * minor l.val 1 2 5 * minor l.val 0 2 3)

theorem tripleRatio_scale (s : Fin 6 → Fˣ) (l : GenericTuple F 3 6) :
    tripleRatio (scaled s l) = tripleRatio l := by sorry

private def moment6 : GenericTuple ℚ 3 6 :=
  ⟨fun i => moment (![1,2,3,5,7,11] i), by sorry⟩
private def ratioOne : GenericTuple ℚ 3 6 :=
  ⟨![![1,0,0], ![0,1,0], ![0,0,1], ![1,1,1], ![1,2,3], ![1,3,2]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.tripleRatio_moment`. -/
example : tripleRatio moment6 = 10/9 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.tripleRatio_one`. -/
example : tripleRatio ratioOne = 1 := by sorry
end Ratios

section ConfigurationMaps
variable {F : Type} [Field F]
/-- The rational unit module `F^× ⊗ ℚ`, instantiated natively: the first packet's `unitsQ`. -/
abbrev UnitsQ (F : Type) [Field F] := TauCeti.Polylog.unitsQ F
private def unitClass (x : F) : UnitsQ F := by
  classical
  exact if h : x = 0 then 0 else TensorProduct.tmul ℤ 1 (Additive.ofMul (Units.mk0 x h))
private def wedge (x y z : UnitsQ F) : ⋀[ℚ]^3 (UnitsQ F) :=
  exteriorPower.ιMulti ℚ 3 ![x,y,z]
private def signQ {m : ℕ} (σ : Equiv.Perm (Fin m)) : ℚ :=
  ((Equiv.Perm.sign σ : ℤˣ) : ℤ)
private def alternate {M : Type} [AddCommGroup M] [Module ℚ M] {q m : ℕ}
    (f : GenericTuple F q m → M) (l : GenericTuple F q m) : M :=
  ∑ σ : Equiv.Perm (Fin m), signQ σ • f (permute l σ)

private def exteriorFormula (vol : Fˣ) (l : GenericTuple F 3 4) : ⋀[ℚ]^3 (UnitsQ F) :=
  (-3 : ℚ) • alternate (fun v => wedge
    (unitClass ((vol : F)*minor v.val 0 1 2))
    (unitClass ((vol : F)*minor v.val 0 1 3))
    (unitClass ((vol : F)*minor v.val 0 2 3))) l

def configExterior (vol : Fˣ) : Config F 3 4 →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F) :=
  configLift F (exteriorFormula vol) (by sorry)

theorem configExterior_mk (vol : Fˣ) (l : GenericTuple F 3 4) :
    configExterior vol (configMk F l) = exteriorFormula vol l := by sorry

theorem configExterior_volume (vol w : Fˣ) : configExterior vol = configExterior w := by sorry

theorem configExterior_alt (vol : Fˣ) (l : GenericTuple F 3 4) (σ : Equiv.Perm (Fin 4)) :
    configExterior vol (configMk F (permute l σ)) =
      signQ σ • configExterior vol (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configExterior_fieldMap: not stated; needs the
-- canonical tensor extension of the supplier unit map and the config field map.

private def small4 : GenericTuple ℚ 3 4 :=
  ⟨![![1,8,2], ![7,3,11], ![1,3,2], ![9,4,3]], by sorry⟩
private def moment4 : GenericTuple ℚ 3 4 :=
  ⟨fun i => moment (![1,2,3,5] i), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configExterior_small`. -/
example : configExterior (1 : ℚˣ) (configMk ℚ small4) =
    (18 : ℚ) • wedge (unitClass (5 : ℚ)) (unitClass (67 : ℚ)) (unitClass (197 : ℚ)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configExterior_moment4`. -/
example : configExterior (1 : ℚˣ) (configMk ℚ moment4) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configExterior_native`. -/
example (x y z : UnitsQ F) : wedge x y z = exteriorPower.ιMulti ℚ 3 ![x,y,z] := by sorry

variable {B2 B3 : Type} [AddCommGroup B2] [Module ℚ B2] [AddCommGroup B3] [Module ℚ B3]
variable (gen2 : F → B2) (gen3 : F → B3)
private def middleFormula (vol : Fˣ) (l : GenericTuple F 3 5) : B2 ⊗[ℚ] UnitsQ F :=
  alternate (fun v => gen2 (projectedRatio v) ⊗ₜ[ℚ]
    unitClass ((vol : F)*minor v.val 2 3 4)) l

-- TauCeti.Polylog.WeightThree.configMiddle: not stated; middleFormula is
-- the raw finite sum, but GL descent and volume independence require the actual
-- B₂ symbol and five-term law. They fail for arbitrary gen2.
-- TauCeti.Polylog.WeightThree.configMiddle_mk: not stated; needs that descent.
-- TauCeti.Polylog.WeightThree.configMiddle_volume: not stated; needs five-term.
-- TauCeti.Polylog.WeightThree.configMiddle_alt: not stated; needs that descent.
-- TauCeti.Polylog.WeightThree.configMiddle_fieldMap: not stated; needs the
-- actual B₂/configuration/unit field maps.
-- Test TauCeti.Polylog.WeightThree.configMiddle_moment: not stated; needs the
-- parent d₂ formula on symbols. Taking an arbitrary d₂=0 refutes the old test.
-- Test TauCeti.Polylog.WeightThree.configMiddle_scaleVolume: not stated;
-- requires the actual B₂ quotient symbol.
-- Test TauCeti.Polylog.WeightThree.configMiddle_notProjective: not stated;
-- requires the actual d₂; the rational computations are recorded in the review.

def configTrilog : Config F 3 6 →ₗ[ℚ] B3 :=
  configLift F (fun l => (-1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l) (by sorry)

theorem configTrilog_mk (l : GenericTuple F 3 6) :
    configTrilog gen3 (configMk F l) =
      (-1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l := by sorry

theorem configTrilog_alt (l : GenericTuple F 3 6) (σ : Equiv.Perm (Fin 6)) :
    configTrilog gen3 (configMk F (permute l σ)) =
      signQ σ • configTrilog gen3 (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configTrilog_fieldMap: not stated; needs the
-- canonical parent B₃ field map, not an arbitrary linear map between modules.
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_normalization`. -/
example (l : GenericTuple F 3 6) :
    (5 : ℚ) • configTrilog gen3 (configMk F l) =
      -alternate (fun v => gen3 (tripleRatio v)) l := by sorry

-- TauCeti.Polylog.WeightThree.seven_term_configuration_relation: not stated;
-- requires the actual B₃ relation quotient; an arbitrary gen3 has no such law.
-- TauCeti.Polylog.WeightThree.configuration_chain_comparison: not stated;
-- requires actual B₂/B₃ symbols, their differentials and explicit Γ. Correct
-- coefficients are −3 Alt₄ and −(1/5) Alt₆ under the packet's conventions.
-- TauCeti.Polylog.WeightThree.relation_cobracket: not stated; requires the
-- parent δ₃ law on the actual quotient, not an arbitrary delta3.

/-- Coordinate (v_p∧v_q)⊗v_r of (δ₂⊗1)δ₃[z]₃ over ℚ.
The native valuation is zero at z=0; z=1 gives a zero coordinate as required. -/
private def cobracketCoordinate (p q r : ℕ) (z : ℚ) : ℚ :=
  ((padicValRat p (1-z) : ℚ) * (padicValRat q z : ℚ) -
    (padicValRat q (1-z) : ℚ) * (padicValRat p z : ℚ)) * (padicValRat r z : ℚ)
private def topCoordinate (l : GenericTuple ℚ 3 6) : ℚ :=
  (-1/5 : ℚ) * ∑ σ : Equiv.Perm (Fin 6),
    signQ σ * cobracketCoordinate 2 3 2 (tripleRatio (permute l σ))
private def middleCoordinate (l : GenericTuple ℚ 3 5) : ℚ :=
  ∑ σ : Equiv.Perm (Fin 5), signQ σ *
    (((padicValRat 2 (1-projectedRatio (permute l σ)) : ℚ) *
      (padicValRat 3 (projectedRatio (permute l σ)) : ℚ) -
      (padicValRat 3 (1-projectedRatio (permute l σ)) : ℚ) *
      (padicValRat 2 (projectedRatio (permute l σ)) : ℚ)) *
      (padicValRat 2 (minor (permute l σ).val 2 3 4) : ℚ))
private def deleteTuple (l : GenericTuple ℚ 3 6) (i : Fin 6) : GenericTuple ℚ 3 5 :=
  ⟨fun j => l.val (i.succAbove j), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_cobracketCoordinate`.
This checks the corrected raw formula without assuming a B₃ interface. -/
example : topCoordinate ratioOne = -60 ∧
    (∑ i : Fin 6, (-1 : ℚ)^i.val * middleCoordinate (deleteTuple ratioOne i)) = -60 := by sorry
end ConfigurationMaps

section GeometricPresentation
variable (F : Type) [Field F] [Infinite F]
private abbrev SixPoints := Fin 6 → Projectivization F (Fin 3 → F)
/-- Span of projective GL changes, repeat/four-collinear degeneracies, seven-term
relations and the precise intersection R3 family in the reader document. This
submodule is a proposed construction, not an assumed proposition. -/
private def geometricRelations : Submodule ℚ (SixPoints F →₀ ℚ) := by sorry

def GeometricTrilog := (SixPoints F →₀ ℚ) ⧸ geometricRelations F
instance : AddCommGroup (GeometricTrilog F) := inferInstanceAs (AddCommGroup (_ ⧸ _))
instance : Module ℚ (GeometricTrilog F) := inferInstanceAs (Module ℚ (_ ⧸ _))

def geometricMk (l : SixPoints F) : GeometricTrilog F :=
  (geometricRelations F).mkQ (Finsupp.single l 1)

theorem geometricMk_alt (l : SixPoints F) (σ : Equiv.Perm (Fin 6)) :
    geometricMk F (fun i => l (σ i)) = signQ σ • geometricMk F l := by sorry

/-- Native quotient universal property; its hypothesis names the actual generated
submodule and does not replace its relation families by an unspecified proposition. -/
def geometricLift {M : Type} [AddCommGroup M] [Module ℚ M]
    (f : (SixPoints F →₀ ℚ) →ₗ[ℚ] M) (h : geometricRelations F ≤ LinearMap.ker f) :
    GeometricTrilog F →ₗ[ℚ] M := (geometricRelations F).liftQ f h

/-- The triangle-family class with its specified source degeneration at 1. -/
def geometricTriangle (z : F) : GeometricTrilog F := by sorry

/-- Test `TauCeti.Polylog.WeightThree.geometric_repeat`. -/
example (l : SixPoints F) (h : l 0 = l 1) : geometricMk F l = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.geometric_fourCollinear`. -/
example (l : SixPoints F) (W : Submodule F (Fin 3 → F))
    (hW : Module.finrank F W = 2)
    (h : ∀ i : Fin 4, (l (i.castSucc.castSucc)).rep ∈ W) :
    geometricMk F l = 0 := by sorry
-- Test TauCeti.Polylog.WeightThree.geometric_triangle_nonzero: not stated;
-- needs the actual B₃ comparison and descended L₃; the expected value is ζ(3).

-- TauCeti.Polylog.WeightThree.geometric_trilogarithm_comparison: not stated;
-- needs the actual parent B₃ quotient and a native intersection/projection API.
-- Existence of an isomorphism to every arbitrary rational module was false.
-- The packet records the printed Alt M₃=(3/2) Alt[T] and the separate corrected
-- r₆=−(1/5) Alt[T]. Their full explicit-quotient adapter is still required.

/-- Native vector-configuration duality, not a second Grassmannian definition. -/
def configurationDual (q m : ℕ) (hq : 0 < q) (hqm : q < m) :
    Config F q m ≃ₗ[ℚ] Config F (m-q) m := by sorry

-- TauCeti.Polylog.WeightThree.configurationDual_sq: not stated in full
-- generality; needs the finite-index transport identifying m−(m−q) with q.
-- The same-rank six-point test below gives the unambiguous special case.
-- TauCeti.Polylog.WeightThree.configurationDual_matrix: not stated;
-- needs the dependent Fin-sum transport for the blocks (I_q,B) and (−Bᵀ,I).
-- TauCeti.Polylog.WeightThree.configurationDual_faces: not stated;
-- needs the same transport on the deletion/projection source and target rows.

private def dualFourInput : GenericTuple ℚ 2 4 :=
  ⟨![![1,0], ![0,1], ![1,2], ![1,3]], by sorry⟩
private def dualFourOutput : GenericTuple ℚ 2 4 :=
  ⟨![![-1,-1], ![-2,-3], ![1,0], ![0,1]], by sorry⟩
private def dualWrongInverse : GenericTuple ℚ 2 4 :=
  ⟨![![1,0], ![0,1], ![3,-2], ![-1,1]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_four`. -/
example : configurationDual ℚ 2 4 (by omega) (by omega) (configMk ℚ dualFourInput) =
    configMk ℚ dualFourOutput := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_six`. -/
example (x : Config F 3 6) :
    configurationDual F 3 6 (by omega) (by omega)
      (configurationDual F 3 6 (by omega) (by omega) x) = x := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_notInverse`. -/
example : configurationDual ℚ 2 4 (by omega) (by omega) (configMk ℚ dualFourInput) ≠
    configMk ℚ dualWrongInverse := by sorry

-- TauCeti.Polylog.WeightThree.trilogarithm_duality: not stated;
-- needs the arbitrary projective six-tuple duality map on the no-four-collinear
-- locus, then the native M₃ comparison. Its conclusion is [dual x]=−[x], not
-- a real functional identity. configuration_chain_comparison states its r₆p consequence.
end GeometricPresentation

section Homology
variable (F : Type) [Field F] [Infinite F]
private abbrev HGL (n k : ℕ) :=
  groupHomology (Rep.trivial ℚ (Matrix.GeneralLinearGroup (Fin n) F) ℚ) k
-- This type prototype must be specialized to the parent Γ and constrained by
-- the actual configuration edge construction. Its type and zero test alone
-- also admit a zero map, and do not validate the planned comparison.
variable (Gamma : CochainComplex (ModuleCat ℚ) ℕ)

def configurationComparison (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    HGL F n (6-i) →ₗ[ℚ] Gamma.homology i := by sorry

-- TauCeti.Polylog.WeightThree.configurationComparison_stabilize: not stated;
-- needs V.4's native block-stabilization map on group homology.
-- TauCeti.Polylog.WeightThree.configurationComparison_rank3: not stated;
-- needs the parent Γ's three module identifications and the hyperhomology edge map.
-- TauCeti.Polylog.WeightThree.configurationComparison_fieldMap: not stated;
-- needs the Γ and group-homology field maps from the supplier interfaces.
-- TauCeti.Polylog.WeightThree.configurationComparison_K: not stated;
-- needs GeneralAlgebraicKTheory Part II's rational primitive Hurewicz map.

/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_zero`. -/
example (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    configurationComparison F Gamma n i hn hi 0 = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_degree2`. -/
example (n : ℕ) (hn : 3 ≤ n) : HGL F n 4 →ₗ[ℚ] Gamma.homology 2 :=
  configurationComparison F Gamma n 2 hn ⟨by omega, by omega⟩
-- Test `TauCeti.Polylog.WeightThree.configurationComparison_stableFixture`:
-- not stated; needs the same block-stabilization and cycle-to-homology interface.
-- TauCeti.Polylog.WeightThree.rank_two_vanishing: not stated; needs the
-- GL₂→GL_n homology map. No Adams/rank filtration equality is assumed.
-- TauCeti.Polylog.WeightThree.suslin_top_comparison: not stated; needs the
-- primitive Hurewicz/Milnor diagonal adapter in the precise supplier request.
-- TauCeti.Polylog.WeightThree.cycle_lifting: not stated; needs the stable
-- generic-resolution edge map, including the omitted higher differentials.
end Homology

section Milnor
variable {F : Type} [Field F]
variable {B2 : Type} [AddCommGroup B2] [Module ℚ B2]
variable (d2 : B2 ⊗[ℚ] UnitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F))
private def steinbergSpan : Submodule ℚ (⋀[ℚ]^3 (UnitsQ F)) :=
  Submodule.span ℚ {v | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧
    v = wedge (unitClass (1-x)) (unitClass x) (unitClass y)}

-- TauCeti.Polylog.WeightThree.steinberg_boundary_image: not stated; requires
-- the generating parent B₂ symbol and d₂([x]⊗u(y))=(1−x)∧x∧y law.
-- An arbitrary linear map d₂, in particular zero, has no such range equality.
-- The kernel equality with Milnor symbols is the imported T.2 presentation;
-- no new Milnor K-group or new H³Γ equivalence is defined here.

variable {HF HE HL MF ME ML : Type}
variable [AddCommGroup HF] [Module ℚ HF] [AddCommGroup HE] [Module ℚ HE]
variable [AddCommGroup HL] [Module ℚ HL] [AddCommGroup MF] [Module ℚ MF]
variable [AddCommGroup ME] [Module ℚ ME] [AddCommGroup ML] [Module ℚ ML]
/-- η is the parent's H³–Milnor equivalence; N is the supplier Milnor norm. -/
def h3Transfer (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME) (N : ME →ₗ[ℚ] MF) :
    HE →ₗ[ℚ] HF := etaF.symm.toLinearMap.comp (N.comp etaE.toLinearMap)

theorem h3Transfer_eta (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME) (N : ME →ₗ[ℚ] MF) :
    etaF.toLinearMap.comp (h3Transfer etaF etaE N) = N.comp etaE.toLinearMap := by sorry

theorem h3Transfer_id (etaF : HF ≃ₗ[ℚ] MF) :
    h3Transfer etaF etaF LinearMap.id = LinearMap.id := by sorry

theorem h3Transfer_comp (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME)
    (etaL : HL ≃ₗ[ℚ] ML) (NFE : ME →ₗ[ℚ] MF) (NEL : ML →ₗ[ℚ] ME) :
    (h3Transfer etaF etaE NFE).comp (h3Transfer etaE etaL NEL) =
      h3Transfer etaF etaL (NFE.comp NEL) := by sorry

-- TauCeti.Polylog.WeightThree.h3Transfer_res: not stated; needs the actual
-- Milnor restriction and its eta-compatible parent cohomology restriction.
-- TauCeti.Polylog.WeightThree.h3Transfer_projection: not stated; needs the
-- supplier graded Milnor product with the degree-1/2 eta comparisons.
-- TauCeti.Polylog.WeightThree.h3Transfer_residue: not stated; needs the
-- valuation/residue-field transfer family with finite-integral-closure hypotheses.
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_identity`. -/
example (etaF : HF ≃ₗ[ℚ] MF) (x : HF) : h3Transfer etaF etaF LinearMap.id x = x := by sorry
-- Test `TauCeti.Polylog.WeightThree.h3Transfer_quadratic`: not stated;
-- needs the actual quadratic Milnor restriction/transfer maps; coefficient is 2.
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_notExteriorNorm`.
This is a native exterior-power computation of the competing coefficient law. -/
example (d : ℚ) (v : ⋀[ℚ]^3 (UnitsQ F)) :
    exteriorPower.map 3 (d • (LinearMap.id : UnitsQ F →ₗ[ℚ] UnitsQ F)) v = d^3 • v := by sorry
-- TauCeti.Polylog.WeightThree.conditional_complex_transfer: not stated;
-- needs P.4's weight-four localization quasi-isomorphism in the native derived
-- category and its residue-at-infinity map. The condition is not a fake Prop field.
end Milnor

-- The following actual-parent signatures cannot yet be stated faithfully.
-- TauCeti.Polylog.WeightThree.trilogDescent: not stated; requires the parent
-- explicit B₃(C) quotient, the actual single-valued L₃, and kernel inclusion
-- for its linearCombination map. Arbitrary L₃ and gen3C cannot descend.
-- TauCeti.Polylog.WeightThree.trilogDescent_mk: not stated; same interfaces.
-- TauCeti.Polylog.WeightThree.trilogDescent_sum: not stated; same interfaces.
-- TauCeti.Polylog.WeightThree.trilogDescent_conj: not stated; actual conjugation.
-- TauCeti.Polylog.WeightThree.trilogRegulatorAt: not stated; needs the actual
-- B₃ embedding map, δ₃ and descended functional, not an arbitrary linear map.
-- TauCeti.Polylog.WeightThree.trilogRegulatorAt_conj: not stated; same maps.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_zero: not stated; L₃(0)=0.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_one: not stated; L₃(1)=ζ(3)>0.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_minusOne: not stated;
-- L₃(−1)=−3ζ(3)/4 for the actual function.
-- TauCeti.Polylog.WeightThree.trilogarithm_functional_relations: not stated;
-- requires that actual function and the source's continuity hypotheses.
-- TauCeti.Polylog.WeightThree.configuration_borel_class: not stated;
-- needs measurable configuration cohomology and its continuous comparison.
-- TauCeti.Polylog.WeightThree.rational_regulator_calibration: not stated;
-- needs R.7's original-class/Tate-coordinate adapter, π² times a nonzero rational.
-- TauCeti.Polylog.WeightThree.regulator_image_containment: not stated;
-- needs actual K₅ and the R.4 regulator, and the cycle-lifting construction.
-- TauCeti.Polylog.WeightThree.every_family_special_value: not stated; requires
-- the actual L₃ regulator on parent cycles and the lifting/calibration suppliers.
-- For arbitrary regAt the removed determinant statement was false. The intended
-- equality is det=q sqrt|D_F| π^(−3r₂) ζ_F(3), allowing q=0, with native infinite
-- places and native NumberField.discr/dedekindZeta as specified in the packet.
end TauCeti.Polylog.WeightThree

end P3FollowUp

/-! ## P.4 follow-up: specialisation, descent, Zagier assertions, weight four -/

section P4FollowUp

/-
Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
All packet nodes remain unchecked. `sorry` marks proposed proofs, not results.

The accepted parent owns B_n, the actual delta maps, L_n, number-field embedding
coordinates and K-groups. Those definitions are not available as Lean imports.
This file therefore prototypes the new linear algebra on actual Mathlib tensor
products, exterior powers, kernels, quotients, determinants and cochain complexes.
Parameters sp, u, p, r and the boundary maps stand for those imported maps, not
arbitrary replacements asserted to satisfy the mathematical source theorems.
Their compatibility hypotheses are stated explicitly.

Full relation-specialization induction, analytic differential factorization,
Suslin rigidity, number-field normalization and the GR regulator interface
cannot yet be stated against the missing parent/supplier Lean definitions.
They are omitted, not replaced by Prop fields. Their precise statements and
proof steps are in the packet. Below are their concrete linear/topological
reductions, including the six named theorem nodes' available signature parts.
The test identifiers are attached to `example`s by comments.
-/

open scoped TensorProduct
open CategoryTheory

namespace TauCeti.Polylog.WeightFour

universe u

section Specialization
variable {B B' B'' U U' U'' : Type u}
variable [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
variable [AddCommGroup B''] [Module ℚ B'']
variable [AddCommGroup U] [Module ℚ U] [AddCommGroup U'] [Module ℚ U']
variable [AddCommGroup U''] [Module ℚ U'']

def specializeTerm (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') :
    B ⊗[ℚ] (⋀[ℚ]^j U) →ₗ[ℚ] B' ⊗[ℚ] (⋀[ℚ]^j U') :=
  TensorProduct.map sp (exteriorPower.map j u)

theorem specializeTerm_tmul (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U')
    (b : B) (Y : ⋀[ℚ]^j U) :
    specializeTerm j sp u (b ⊗ₜ[ℚ] Y) = sp b ⊗ₜ[ℚ] exteriorPower.map j u Y := by
  sorry

def specializeLast (n : ℕ) (u : U →ₗ[ℚ] U') : ⋀[ℚ]^n U →ₗ[ℚ] ⋀[ℚ]^n U' :=
  exteriorPower.map n u

theorem specializeTerm_comp (j : ℕ) (sp : B →ₗ[ℚ] B') (sp' : B' →ₗ[ℚ] B'')
    (u : U →ₗ[ℚ] U') (u' : U' →ₗ[ℚ] U'') :
    (specializeTerm j sp' u').comp (specializeTerm j sp u) =
      specializeTerm j (sp'.comp sp) (u'.comp u) := by
  sorry

theorem specializeTerm_id (j : ℕ) :
    specializeTerm j (LinearMap.id : B →ₗ[ℚ] B) (LinearMap.id : U →ₗ[ℚ] U) =
      LinearMap.id := by
  sorry

theorem specializeLast_wedge (n : ℕ) (u : U →ₗ[ℚ] U') (x : Fin n → U) :
    specializeLast n u (exteriorPower.ιMulti ℚ n x) =
      exteriorPower.ιMulti ℚ n (u ∘ x) := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_unit_product
-- Apply to the actual additive unit classes t, 2/t and 2 once the parent exists.
example (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B)
    (t invtwo two : U) (h : t + invtwo = two) :
    specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => two)) =
      specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => t)) +
      specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => invtwo)) := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_uniformizer
example (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B) (π : U) (hπ : u π = 0) :
    specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => π)) = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_constant_tensor
example (b : B) (x : Fin 2 → U) :
    specializeTerm 2 LinearMap.id LinearMap.id
      (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 2 x) = b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 2 x := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_pole_symbol
example (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B)
    (hb : sp b = 0) (Y : ⋀[ℚ]^j U) : specializeTerm j sp u (b ⊗ₜ[ℚ] Y) = 0 := by
  sorry

-- relation-specialization-induction: the native quotient-descent reduction.
-- The hypothesis is exactly the unresolved relation-preservation input.
theorem relationSpecialization_descend (R : Submodule ℚ B) (R' : Submodule ℚ B')
    (sp : B →ₗ[ℚ] B') (h : ∀ x ∈ R, sp x ∈ R') :
    ∃ S : (B ⧸ R) →ₗ[ℚ] (B' ⧸ R'), S.comp R.mkQ = R'.mkQ.comp sp := by
  sorry

-- higher-symbol-inversion: even endpoint consequence of imported inversion.
theorem higherSymbolInversion_even_one (oneSymbol : B)
    (inversion_at_one : oneSymbol + oneSymbol = 0) : oneSymbol = 0 := by
  sorry
end Specialization

section Evaluation
-- `none` encodes the projective infinity point. eval is the parent's projective
-- evaluation, never RatFunc.eval's totalized field value at a pole.
variable (L : Option ℂ → ℝ) (eval : RatFunc ℂ → ℂ → Option ℂ)

def cycleEvaluation : (RatFunc ℂ →₀ ℚ) →ₗ[ℚ] (ℂ → ℝ) :=
  Finsupp.linearCombination ℚ (fun f a => L (eval f a))

theorem cycleEvaluation_single (f : RatFunc ℂ) (q : ℚ) (a : ℂ) :
    cycleEvaluation L eval (Finsupp.single f q) a = (q : ℝ) * L (eval f a) := by
  sorry

theorem cycleEvaluation_add (α β : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval (α + β) a = cycleEvaluation L eval α a + cycleEvaluation L eval β a := by
  sorry

theorem cycleEvaluation_smul (q : ℚ) (α : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval (q • α) a = (q : ℝ) * cycleEvaluation L eval α a := by
  sorry

theorem cycleEvaluation_specialize (α : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval α a =
      (Finsupp.linearCombination ℚ (fun f => L (eval f a))) α := by
  sorry

theorem cycleEvaluation_constant (f : RatFunc ℂ) (c : Option ℂ)
    (hc : ∀ a, eval f a = c) (a : ℂ) :
    cycleEvaluation L eval (Finsupp.single f 1) a = L c := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_pole
example (f : RatFunc ℂ) (a : ℂ) (hpole : eval f a = none) (hinfty : L none = 0) :
    cycleEvaluation L eval (Finsupp.single f 1) a = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_odd_one
example (a : ℂ) (h1 : eval 1 a = some 1) (zeta3 : ℝ)
    (hL : L (some 1) = zeta3) (hz : zeta3 ≠ 0) :
    cycleEvaluation L eval (Finsupp.single 1 1) a = zeta3 ∧
      cycleEvaluation L eval (Finsupp.single 1 1) a ≠ 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_even_one
example (a : ℂ) (h1 : eval 1 a = some 1) (hL : L (some 1) = 0) :
    cycleEvaluation L eval (Finsupp.single 1 1) a = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_cancellation
example (f g : RatFunc ℂ) (a : ℂ) :
    cycleEvaluation L eval
      (Finsupp.single f 1 + Finsupp.single g 1 - Finsupp.single f 1) a = L (eval g a) := by
  sorry

-- cycle-constancy: topological end of the scalar analytic proof. The omitted
-- r_n factorization must establish the derivative hypothesis for an actual cycle.
theorem cycleConstancy (E : ℂ → ℝ) (S : Finset ℂ) (hcont : Continuous E)
    (hd : ∀ z ∉ S, HasFDerivAt E (0 : ℂ →L[ℝ] ℝ) z) (a b : ℂ) : E a = E b := by
  sorry
end Evaluation

section Numerical
variable {M K M' : Type u}
variable [AddCommGroup M] [Module ℚ M] [AddCommGroup K] [Module ℚ K]
variable [AddCommGroup M'] [Module ℚ M']

def normalizedDet {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c : ℝ) (y : Fin d → M) : ℝ :=
  c * Matrix.det (fun i j => p (y j) i)

def rationalExistence {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) : Prop :=
  ∃ y : Fin d → M, ∃ q : ℚ, q ≠ 0 ∧ normalizedDet p c y = (q : ℝ) * ζ

theorem rationalExistence_of_witness {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (y : Fin d → M) (q : ℚ) (hq : q ≠ 0)
    (hy : normalizedDet p c y = (q : ℝ) * ζ) : rationalExistence p c ζ := by
  sorry

theorem rationalExistence_nonzero {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (hζ : ζ ≠ 0) (h : rationalExistence p c ζ) :
    ∃ y, normalizedDet p c y ≠ 0 := by
  sorry

theorem rationalExistence_normalize {d : ℕ} (hd : 0 < d)
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) :
    rationalExistence p c ζ ↔ ∃ y, normalizedDet p c y = ζ := by
  sorry

theorem rationalExistence_empty (p : M →ₗ[ℚ] (Fin 0 → ℝ)) (c ζ : ℝ) :
    rationalExistence p c ζ ↔ ∃ q : ℚ, q ≠ 0 ∧ c = (q : ℝ) * ζ := by
  sorry

theorem rationalExistence_transport {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (e : M ≃ₗ[ℚ] M') (c ζ : ℝ) :
    rationalExistence p c ζ ↔ rationalExistence (p.comp e.symm.toLinearMap) c ζ := by
  sorry

def rationalColumn : ℚ →ₗ[ℚ] (Fin 1 → ℝ) where
  toFun x := fun _ => (x : ℝ)
  map_add' := by sorry
  map_smul' := by sorry

-- TauCeti.Polylog.WeightFour.existence_empty_rational
example : rationalExistence (0 : ℚ →ₗ[ℚ] (Fin 0 → ℝ)) 90 1 ∧
    normalizedDet (0 : ℚ →ₗ[ℚ] (Fin 0 → ℝ)) 90 (fun i => Fin.elim0 i) ≠ 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_zero_factor
example : ¬ rationalExistence (0 : ℚ →ₗ[ℚ] (Fin 1 → ℝ)) 1 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_rank_one
example : normalizedDet rationalColumn 2 (fun _ => (1 / 2 : ℚ)) = 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_transport_test
example {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (e : M ≃ₗ[ℚ] M') (c ζ : ℝ) :
    rationalExistence p c ζ = rationalExistence (p.comp e.symm.toLinearMap) c ζ := by
  sorry

def regulatorComparison {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) : Prop :=
  ∃ φ : M ≃ₗ[ℚ] K, ∃ lam : ℚ, lam ≠ 0 ∧
    ∀ y, p y = ((lam : ℝ) * A) • r (φ y)

theorem regulatorComparison_witness {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (h : regulatorComparison p r A) :
    ∃ φ : M ≃ₗ[ℚ] K, ∃ lam : ℚ, lam ≠ 0 ∧ ∀ y, p y = ((lam : ℝ) * A) • r (φ y) := by
  sorry

theorem regulatorComparison_forget {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (h : regulatorComparison p r A) :
    Nonempty (M ≃ₗ[ℚ] K) := by
  sorry

theorem regulatorComparison_rescale {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (q : ℚ) (hq : q ≠ 0)
    (h : regulatorComparison p r A) : regulatorComparison p (q • r) A := by
  sorry

theorem regulatorComparison_injective {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (hA : A ≠ 0)
    (hr : Function.Injective r) (h : regulatorComparison p r A) : Function.Injective p := by
  sorry

theorem regulatorComparison_transport {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (e : M ≃ₗ[ℚ] M') (A : ℝ) :
    regulatorComparison p r A ↔ regulatorComparison (p.comp e.symm.toLinearMap) r A := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_identity
example : regulatorComparison rationalColumn rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_zero_period
example : ¬ regulatorComparison (0 : ℚ →ₗ[ℚ] (Fin 1 → ℝ)) rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_rational_scale
example : regulatorComparison ((3 : ℚ) • rationalColumn) rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_zero_spaces
example : regulatorComparison
    (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℝ))
    (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℝ)) Real.pi := by
  sorry

-- A routine predicate abbreviating the inherited every-family assertion.
def everyFamily {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) : Prop :=
  ∀ y, ∃ q : ℚ, normalizedDet p c y = (q : ℝ) * ζ

-- assertion-logic: rank plus every-family rationality supplies the Q× witness.
theorem assertionLogic_rank_every {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ)
    (hrank : ∃ y, normalizedDet p c y ≠ 0) (hall : everyFamily p c ζ) :
    rationalExistence p c ζ := by
  sorry

theorem assertionLogic_dimension {d : ℕ} [FiniteDimensional ℚ M]
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) (hζ : ζ ≠ 0)
    (hdim : Module.finrank ℚ M = d) (hex : rationalExistence p c ζ) :
    everyFamily p c ζ := by
  sorry

-- period-calibration: concrete exponent identity. R.5 supplies the nonzero
-- covolume formula; R.7 must still provide the actual scalar period conversion.
theorem periodCalibration_exponent (n N d : ℤ) :
    (n - 1) * d + d - N * n = -(n * (N - d)) := by
  sorry

-- weight-four-totally-real: the Q example catches the empty-determinant error.
-- ζ_Q(4)=π⁴/90 is imported arithmetic; it is not redefined here.
theorem weightFourTotallyReal_rational (p : M →ₗ[ℚ] (Fin 0 → ℝ)) :
    rationalExistence p (Real.pi ^ 4) (Real.pi ^ 4 / 90) := by
  sorry
end Numerical

section ExplicitComplex
variable {B4 B3 B2 U : Type}
variable [AddCommGroup B4] [Module ℚ B4] [AddCommGroup B3] [Module ℚ B3]
variable [AddCommGroup B2] [Module ℚ B2] [AddCommGroup U] [Module ℚ U]

def explicitTerms (B4 B3 B2 U : Type)
    [AddCommGroup B4] [Module ℚ B4] [AddCommGroup B3] [Module ℚ B3]
    [AddCommGroup B2] [Module ℚ B2] [AddCommGroup U] [Module ℚ U] : ℕ → ModuleCat ℚ
  | 1 => ModuleCat.of ℚ B4
  | 2 => ModuleCat.of ℚ (B3 ⊗[ℚ] U)
  | 3 => ModuleCat.of ℚ (B2 ⊗[ℚ] (⋀[ℚ]^2 U))
  | 4 => ModuleCat.of ℚ (⋀[ℚ]^4 U)
  | _ => ModuleCat.of ℚ (Fin 0 → ℚ)

def explicitDifferential
    (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
    (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
    (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U) :
    ∀ i, explicitTerms B4 B3 B2 U i ⟶ explicitTerms B4 B3 B2 U (i + 1)
  | 0 => 0
  | 1 => ModuleCat.ofHom a
  | 2 => ModuleCat.ofHom b
  | 3 => ModuleCat.ofHom c
  | _ => 0

def explicitComplex
    (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
    (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
    (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U)
    (hba : b.comp a = 0) (hcb : c.comp b = 0) : CochainComplex (ModuleCat ℚ) ℕ :=
  CochainComplex.of (explicitTerms B4 B3 B2 U) (explicitDifferential a b c) (by sorry)

variable (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
variable (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
variable (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U)
variable (hba : b.comp a = 0) (hcb : c.comp b = 0)

theorem explicitComplex_X (i : ℕ) :
    (explicitComplex a b c hba hcb).X i = explicitTerms B4 B3 B2 U i := by
  sorry

theorem explicitComplex_d :
    (explicitComplex a b c hba hcb).d 1 2 = ModuleCat.ofHom a ∧
    (explicitComplex a b c hba hcb).d 2 3 = ModuleCat.ofHom b ∧
    (explicitComplex a b c hba hcb).d 3 4 = ModuleCat.ofHom c := by
  sorry

theorem explicitComplex_first_kernel :
    LinearMap.ker ((explicitComplex a b c hba hcb).d 1 2).hom = LinearMap.ker a := by
  sorry

def explicitComplex_map {X Y : CochainComplex (ModuleCat ℚ) ℕ}
    (f : ∀ i, X.X i ⟶ Y.X i)
    (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1)) : X ⟶ Y :=
  CochainComplex.ofHom f hf

-- TauCeti.Polylog.WeightFour.explicit_degree_one
example : (explicitComplex a b c hba hcb).X 1 = ModuleCat.of ℚ B4 := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_zero_outside
example : (explicitComplex a b c hba hcb).X 0 = ModuleCat.of ℚ (Fin 0 → ℚ) ∧
    (explicitComplex a b c hba hcb).X 5 = ModuleCat.of ℚ (Fin 0 → ℚ) := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_first_boundary
example : ((explicitComplex a b c hba hcb).d 1 2).hom = a := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_no_extra_summand
example : (explicitComplex a b c hba hcb).X 2 = ModuleCat.of ℚ (B3 ⊗[ℚ] U) := by
  sorry
end ExplicitComplex

section Presentation
def presentationMap {X Y : CochainComplex (ModuleCat ℚ) ℕ}
    (f : ∀ i, X.X i ⟶ Y.X i)
    (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1)) : X ⟶ Y :=
  CochainComplex.ofHom f hf

variable {X Y : CochainComplex (ModuleCat ℚ) ℕ}
variable (f : ∀ i, X.X i ⟶ Y.X i)
variable (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1))

theorem presentationMap_first : (presentationMap f hf).f 1 = f 1 := by sorry
theorem presentationMap_second : (presentationMap f hf).f 2 = f 2 := by sorry
theorem presentationMap_square :
    f 1 ≫ Y.d 1 2 = X.d 1 2 ≫ f 2 := by sorry

def presentationMap_cycles :
    LinearMap.ker (X.d 1 2).hom →ₗ[ℚ] LinearMap.ker (Y.d 1 2).hom :=
  LinearMap.codRestrict _ ((f 1).hom.comp (LinearMap.ker (X.d 1 2).hom).subtype) (by
    have hsquare := hf 1
    sorry)

theorem presentationMap_period {d : ℕ}
    (pX : X.X 1 →ₗ[ℚ] (Fin d → ℝ)) (pY : Y.X 1 →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : pY.comp (f 1).hom = pX) (x : X.X 1) :
    pY ((presentationMap f hf).f 1 x) = pX x := by sorry

-- TauCeti.Polylog.WeightFour.presentation_zero_cycle
example : presentationMap_cycles f hf 0 = 0 := by sorry

-- TauCeti.Polylog.WeightFour.presentation_pure_tensor
example {B B' U : Type u} [AddCommGroup B] [Module ℚ B]
    [AddCommGroup B'] [Module ℚ B'] [AddCommGroup U] [Module ℚ U]
    (p3 : B →ₗ[ℚ] B') (b : B) (u : U) :
    TensorProduct.map p3 LinearMap.id (b ⊗ₜ[ℚ] u) = p3 b ⊗ₜ[ℚ] u := by sorry

-- TauCeti.Polylog.WeightFour.presentation_cycle_boundary
example (x : LinearMap.ker (X.d 1 2).hom) :
    (Y.d 1 2).hom ((f 1).hom x) = 0 := by
  have hsquare := hf 1
  sorry

-- TauCeti.Polylog.WeightFour.presentation_top_identity
example (h4 : X.X 4 = Y.X 4) (hid : f 4 = eqToHom h4) :
    (presentationMap f hf).f 4 = eqToHom h4 := by sorry
end Presentation

section Obstruction
variable {C D E J : Type u}
variable [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
variable [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]

def boundaryOnKernel (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p) :
    LinearMap.ker p →ₗ[ℚ] LinearMap.ker q :=
  LinearMap.codRestrict _ (a.comp (LinearMap.ker p).subtype) (by sorry)

def obstructionSubmodule (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p) :
    Submodule ℚ (LinearMap.ker q) := LinearMap.range (boundaryOnKernel a b p q hsq)

def cycleObstruction (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p)
    (hp : Function.Surjective p) :
    LinearMap.ker b →ₗ[ℚ] ((LinearMap.ker q) ⧸ obstructionSubmodule a b p q hsq) where
  toFun y := (obstructionSubmodule a b p q hsq).mkQ
    ⟨a (Classical.choose (hp y)), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

variable (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
variable (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p)
variable (hp : Function.Surjective p)

theorem cycleObstruction_lift (y : LinearMap.ker b) (x : C) (hx : p x = y) :
    cycleObstruction a b p q hsq hp y =
      (obstructionSubmodule a b p q hsq).mkQ ⟨a x, by sorry⟩ := by sorry

theorem cycleObstruction_zero_iff (y : LinearMap.ker b) :
    cycleObstruction a b p q hsq hp y = 0 ↔ ∃ x : C, a x = 0 ∧ p x = y := by sorry

theorem cycleObstruction_image :
    ∀ y : LinearMap.ker b, y ∈ LinearMap.ker (cycleObstruction a b p q hsq hp) ↔
      ∃ x : LinearMap.ker a, p x = y := by sorry

theorem cycleObstruction_injective_target (hq : Function.Injective q) :
    cycleObstruction a b p q hsq hp = 0 := by sorry

-- TauCeti.Polylog.WeightFour.obstruction_explicit_cycle
example (x : C) (ha : a x = 0) (y : LinearMap.ker b) (hy : p x = y) :
    cycleObstruction a b p q hsq hp y = 0 := by sorry

-- TauCeti.Polylog.WeightFour.obstruction_change_lift
example (y : LinearMap.ker b) (x k : C) (hx : p x = y) (hk : p k = 0) :
    (obstructionSubmodule a b p q hsq).mkQ (⟨a x, by sorry⟩ : LinearMap.ker q) =
      (obstructionSubmodule a b p q hsq).mkQ (⟨a (x + k), by sorry⟩ : LinearMap.ker q) := by
  sorry

-- TauCeti.Polylog.WeightFour.obstruction_missing_cycle
-- C=D=E=Q, J=0, p=a=id, b=q=0: a group lift exists, a cycle lift does not.
example :
    let a : ℚ →ₗ[ℚ] ℚ := LinearMap.id
    let b : ℚ →ₗ[ℚ] (Fin 0 → ℚ) := 0
    let p : ℚ →ₗ[ℚ] ℚ := LinearMap.id
    let q : ℚ →ₗ[ℚ] (Fin 0 → ℚ) := 0
    cycleObstruction a b p q (by sorry) (by sorry) ⟨1, by sorry⟩ ≠ 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.obstruction_injective_square
example (hq : Function.Injective q) (y : LinearMap.ker b) :
    ∃ x, p x = y ∧ a x = 0 := by
  have hsquare := hsq
  have hsurj := hp
  sorry
end Obstruction

section DeterminantTransfer
variable {M M' : Type u} [AddCommGroup M] [Module ℚ M]
variable [AddCommGroup M'] [Module ℚ M']

-- weight-four-determinant-lifting: existence needs a map, not a surjective cycle map.
theorem weightFourDeterminantLifting_existence {d : ℕ} (P : M →ₗ[ℚ] M')
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (p' : M' →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : p'.comp P = p) (c ζ : ℝ) (h : rationalExistence p c ζ) :
    rationalExistence p' c ζ := by sorry

theorem weightFourDeterminantLifting_family {d : ℕ} (P : M →ₗ[ℚ] M')
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (p' : M' →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : p'.comp P = p) (c ζ : ℝ) (h : everyFamily p c ζ)
    (y : Fin d → M') (hlift : ∀ j, ∃ x, P x = y j) :
    ∃ q : ℚ, normalizedDet p' c y = (q : ℝ) * ζ := by sorry

-- weight-four-regulator-input: κ and reverse image containment are different
-- typed hypotheses. This reduction transfers all-family rationality from K.
theorem weightFourRegulatorInput_image {d : ℕ}
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (r : M' →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (hall : everyFamily r c ζ)
    (himage : LinearMap.range p ≤ LinearMap.range r) : everyFamily p c ζ := by sorry
end DeterminantTransfer

section Residue
variable {B B' B'' U : Type u}
variable [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
variable [AddCommGroup B''] [Module ℚ B''] [AddCommGroup U] [Module ℚ U]

def residueTensor (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) : B ⊗[ℚ] U →ₗ[ℚ] B' :=
  TensorProduct.lift
    { toFun := fun b =>
        { toFun := fun u => v u • sp b
          map_add' := by sorry
          map_smul' := by sorry }
      map_add' := by sorry
      map_smul' := by sorry }

theorem residueTensor_tmul (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (u : U) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = v u • sp b := by sorry

theorem residueTensor_add (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (x y : B ⊗[ℚ] U) :
    residueTensor sp v (x + y) = residueTensor sp v x + residueTensor sp v y := by sorry

theorem residueTensor_zero_unit (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ)
    (b : B) (u : U) (hu : v u = 0) : residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry

theorem residueTensor_comp (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (h : B' →ₗ[ℚ] B'') :
    h.comp (residueTensor sp v) = residueTensor (h.comp sp) v := by sorry

theorem residueTensor_uniformizer (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ)
    (b : B) (π : U) (hπ : v π = 1) : residueTensor sp v (b ⊗ₜ[ℚ] π) = sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_uniformizer
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (π : U) (hπ : v π = 1) :
    residueTensor sp v (b ⊗ₜ[ℚ] π) = sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_unit
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (u : U) (hu : v u = 0) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry

-- TauCeti.Polylog.WeightFour.residue_inverse_uniformizer
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (π : U) (hπ : v π = 1) :
    residueTensor sp v (b ⊗ₜ[ℚ] (-π)) = -sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_symbol_pole
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (hb : sp b = 0) (u : U) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry
end Residue

-- homotopy-conjecture: this is the real library predicate, without a proof or
-- an instance. Q and T must be the parent's quotient complex and direct sum
-- of shifted residue-field complexes; rho must be its finite-place map.
-- Constructing these requires the finite-place descent gap, so they are explicit
-- parameters here. This does not assert the conjecture for arbitrary complexes.
-- The parent's rational-curve model gives an analogue of Gon95 Conjecture 1.39;
-- identifying it with Gon95's all-smooth-curve model needs a compatible comparison.
def polylogHomotopyFour {Q T : CochainComplex (ModuleCat ℚ) ℕ}
    [∀ i, Q.HasHomology i] [∀ i, T.HasHomology i] (rho : Q ⟶ T) : Prop := QuasiIso rho

end TauCeti.Polylog.WeightFour

end P4FollowUp

/-! ## P.5 follow-up: currents, Green classes, the BFT comparison, the elliptic formula -/

section P5FollowUp

/-
The pinned Mathlib supplies chart test functions/distributions, exterior algebra
and infinite sums. It has no global LF test forms, manifold currents, Chow
incidence, higher cycle complexes or real Deligne hypercohomology. The omission
manifest below names every unavailable packet signature and its precise carrier.
No arbitrary proposition or assumed comparison field replaces those carriers.

The concrete sections prototype chart signs, the full finite Wang polynomial,
the three-coordinate auxiliary differential, the comparison's minus sign and
the explicit two-index elliptic series. The global statements remain mathematical
targets with the supplier and proof gaps recorded in the packet.
-/

set_option autoImplicit false
open scoped BigOperators Distributions
open MeasureTheory

namespace TauCeti.CurveRegulator

section Chart
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The existing LF chart model, with alternating-form coefficients. -/
abbrev ChartTestForms (Ω : TopologicalSpace.Opens E) (k : ℕ) :=
  TestFunction Ω (ContinuousAlternatingMap ℝ E ℂ (Fin k)) ⊤

/-- The top-current chart is the existing real-test-function dual. -/
abbrev ChartTopCurrent (Ω : TopologicalSpace.Opens E) := Distribution Ω ℂ ⊤

-- ManifoldCurrent.dirac: chart specialization of the packet's test.
example (Ω : TopologicalSpace.Opens E) (x : E) (φ : TestFunction Ω ℝ ⊤) :
    (Distribution.delta x : Distribution Ω ℝ ⊤) φ = φ x := by
  sorry

-- ManifoldCurrent.derivative_sign: the actual existing chart derivative.
example (Ω : TopologicalSpace.Opens E) (v : E)
    (T : Distribution Ω ℂ ⊤) (φ : TestFunction Ω ℝ ⊤) :
    Distribution.lineDerivCLM v T φ = -T (TestFunction.lineDerivCLM ℝ v φ) := by
  sorry

-- Locally integrable representatives do not bypass Mathlib's integrability condition.
example (Ω : TopologicalSpace.Opens ℂ) (f : ℂ → ℝ)
    (hf : LocallyIntegrableOn f Ω volume) (φ : TestFunction Ω ℝ ⊤) :
    Distribution.ofFun Ω f volume ⊤ φ = ∫ z, φ z * f z := by
  sorry

def chartDerivative (Ω : TopologicalSpace.Opens ℂ) (v : ℂ) :
    Distribution Ω ℝ ⊤ →L[ℝ] Distribution Ω ℝ ⊤ := Distribution.lineDerivCLM v

/-- Δ log|z|=2πδ₀: the positively oriented scalar chart of Poincaré–Lelong. -/
theorem poincareLelong_chart (Ω : TopologicalSpace.Opens ℂ) :
    let T : Distribution Ω ℝ ⊤ := Distribution.ofFun Ω (fun z : ℂ => Real.log ‖z‖) volume ⊤
    chartDerivative Ω 1 (chartDerivative Ω 1 T) +
      chartDerivative Ω Complex.I (chartDerivative Ω Complex.I T) =
        (2 * Real.pi) • (Distribution.delta (0 : ℂ) : Distribution Ω ℝ ⊤) := by
  sorry
end Chart

namespace WangForm
variable {V : Type*} [AddCommGroup V] [Module ℂ V]
variable {m : ℕ}

/-- Pointwise logarithmic data: value, ∂ component and bar∂ component. -/
structure Jet (V : Type*) where
  value : ℝ
  hol : V
  anti : V

def zeroJet : Jet V := ⟨0, 0, 0⟩

/-- An ordered product; exterior-algebra multiplication retains wedge order. -/
def orderedProduct (jets : Fin m → Jet V) (σ : Equiv.Perm (Fin m)) (i : ℕ) :
    ExteriorAlgebra ℂ V :=
  ((List.finRange m).drop 1).foldl
    (fun acc j => acc * ExteriorAlgebra.ι ℂ
      (if j.val < i then (jets (σ j)).hol else (jets (σ j)).anti)) 1

/-- Full unaveraged alternating polynomial, with only one factorial division. -/
def coefficients (jets : Fin m → Jet V) : ExteriorAlgebra ℂ V :=
  if hm : m = 0 then 1 else
    (((-2 : ℂ) ^ m) / (2 * (Nat.factorial m : ℂ))) •
      ∑ i ∈ Finset.range m, (-1 : ℂ) ^ (i + 1) •
        ∑ σ : Equiv.Perm (Fin m),
          (((Equiv.Perm.sign σ : ℤ) : ℂ) * (jets (σ ⟨0, Nat.pos_of_ne_zero hm⟩)).value) •
            orderedProduct jets σ (i + 1)

theorem one (jets : Fin 1 → Jet V) :
    coefficients jets = (jets 0).value • (1 : ExteriorAlgebra ℂ V) := by
  sorry

theorem two (jets : Fin 2 → Jet V) :
    coefficients jets =
      (jets 0).value • ExteriorAlgebra.ι ℂ ((jets 1).hol - (jets 1).anti) -
      (jets 1).value • ExteriorAlgebra.ι ℂ ((jets 0).hol - (jets 0).anti) := by
  sorry

theorem alternating (jets : Fin m → Jet V) (σ : Equiv.Perm (Fin m)) :
    coefficients (jets ∘ σ) = (((Equiv.Perm.sign σ : ℤ) : ℂ)) • coefficients jets := by
  sorry

/-- The coefficient-level part of pullback; global Dolbeault morphisms are omitted. -/
theorem pullback {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : V →ₗ[ℂ] W) (jets : Fin m → Jet V) :
    ExteriorAlgebra.map f (coefficients jets) =
      coefficients (fun j => ⟨(jets j).value, f (jets j).hol, f (jets j).anti⟩) := by
  sorry

/-- The function 1 has its entire logarithmic jet zero. -/
theorem unit_function (jets : Fin m → Jet V) (j : Fin m) (hj : jets j = zeroJet) :
    coefficients jets = 0 := by
  sorry

-- WangForm.test_one
example : coefficients (V := V) (fun _ : Fin 1 => ⟨3, 0, 0⟩) =
    (3 : ℂ) • (1 : ExteriorAlgebra ℂ V) := by
  sorry

-- WangForm.test_two
example (a : V) : coefficients (fun j : Fin 2 =>
      if j = 0 then (⟨1, 0, 0⟩ : Jet V) else ⟨0, a, 0⟩) = ExteriorAlgebra.ι ℂ a := by
  sorry

-- WangForm.test_zero, including the empty tuple.
example : coefficients (V := V) (fun j : Fin 0 => Fin.elim0 j) = 1 := by
  sorry

example : coefficients (V := V) (fun _ : Fin 1 => zeroJet) = 0 := by
  sorry
end WangForm

namespace MixedWangForm
variable {V : Type*} [AddCommGroup V] [Module ℂ V] {n m : ℕ}

/-- The pointwise concatenated polynomial, before taking current extensions. -/
def apply (c : Fin n → WangForm.Jet V) (s : Fin m → WangForm.Jet V) :=
  WangForm.coefficients (Fin.append c s)

theorem cube (c : Fin n → WangForm.Jet V) :
    apply c (fun j : Fin 0 => Fin.elim0 j) = WangForm.coefficients c := by
  sorry

theorem simplex (s : Fin m → WangForm.Jet V) :
    apply (fun j : Fin 0 => Fin.elim0 j) s = WangForm.coefficients s := by
  sorry

-- MixedWangForm.origin
example : apply (V := V) (fun j : Fin 0 => Fin.elim0 j)
    (fun j : Fin 0 => Fin.elim0 j) = 1 := by
  sorry

-- MixedWangForm.one_each
example (c s : Fin 1 → WangForm.Jet V) :
    apply c s = (c 0).value • ExteriorAlgebra.ι ℂ ((s 0).hol - (s 0).anti) -
      (s 0).value • ExteriorAlgebra.ι ℂ ((c 0).hol - (c 0).anti) := by
  sorry

-- MixedWangForm.ratio_one, at the coefficient level.
example (s : Fin m → WangForm.Jet V) :
    apply (fun _ : Fin 1 => WangForm.zeroJet) s = 0 := by
  sorry
end MixedWangForm

namespace BFTAuxiliary
variable {A B C : ℤ → Type*}
variable [∀ k, AddCommGroup (A k)] [∀ k, AddCommGroup (B k)] [∀ k, AddCommGroup (C k)]

/-- The shifted simple in degree k is A(k+1) ⊕ B(k) ⊕ C(k). -/
abbrev Degree (k : ℤ) := A (k + 1) × B k × C k

def differential
    (dA : ∀ k, A k →+ A (k + 1))
    (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1))
    (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (k : ℤ) (x : Degree (A := A) (B := B) (C := C) k) :
    Degree (A := A) (B := B) (C := C) (k + 1) :=
  (-dA (k + 1) x.1, dB k x.2.1 + g (k + 1) x.1,
    dC k x.2.2 - ρ (k + 1) x.1)

/-- Pointwise β. Its global quasi-isomorphism requires the support/purity carrier. -/
def beta (k : ℤ) (z : C k) : Degree (A := A) (B := B) (C := C) k := (0, 0, z)

-- BFTAuxiliary.beta_sign
example (dA : ∀ k, A k →+ A (k + 1)) (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1)) (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (k : ℤ) (z : C k) :
    differential dA dB dC g ρ k (beta k z) = beta (k + 1) (dC k z) := by
  sorry

-- BFTAuxiliary.square: actual graded maps and their actual chain identities.
example (dA : ∀ k, A k →+ A (k + 1)) (dB : ∀ k, B k →+ B (k + 1))
    (dC : ∀ k, C k →+ C (k + 1)) (g : ∀ k, A k →+ B k) (ρ : ∀ k, A k →+ C k)
    (hA : ∀ k a, dA (k + 1) (dA k a) = 0)
    (hB : ∀ k b, dB (k + 1) (dB k b) = 0)
    (hC : ∀ k c, dC (k + 1) (dC k c) = 0)
    (hg : ∀ k a, dB k (g k a) = g (k + 1) (dA k a))
    (hρ : ∀ k a, dC k (ρ k a) = ρ (k + 1) (dA k a))
    (k : ℤ) (x : Degree (A := A) (B := B) (C := C) k) :
    differential dA dB dC g ρ (k + 1) (differential dA dB dC g ρ k x) = 0 := by
  sorry
end BFTAuxiliary

namespace RegulatorComparison
variable {Z G F T : Type*} [AddCommGroup T]

/-- The pointwise three summands; the global chain maps are not assumed. -/
def apply (pc : Z → T) (green : G → T) (φ : F → T) (z : Z) (g : G) (a : F) : T :=
  pc z - green g + φ a

-- RegulatorComparison.first
example (pc : Z → T) (green : G → T) (φ : F → T) (z : Z) (g0 : G) (a0 : F)
    (hg : green g0 = 0) (hφ : φ a0 = 0) : apply pc green φ z g0 a0 = pc z := by
  sorry

-- RegulatorComparison.third
example (pc : Z → T) (green : G → T) (φ : F → T) (z0 : Z) (g0 : G) (a : F)
    (hp : pc z0 = 0) (hg : green g0 = 0) : apply pc green φ z0 g0 a = φ a := by
  sorry

-- RegulatorComparison.middle_sign
example (pc : Z → T) (green : G → T) (φ : F → T) (z0 : Z) (g : G) (a0 : F)
    (hp : pc z0 = 0) (hφ : φ a0 = 0) : apply pc green φ z0 g a0 = -green g := by
  sorry
end RegulatorComparison

namespace EllipticTrilog
/-- A full oriented real lattice; positivity is the actual nondegeneracy condition. -/
structure OrientedLattice where
  u : ℂ
  v : ℂ
  positiveArea : 0 < (star u * v).im

def area (L : OrientedLattice) : ℝ := (star L.u * L.v).im
def latticePoint (L : OrientedLattice) (k : ℤ × ℤ) : ℂ :=
  (k.1 : ℂ) * L.u + (k.2 : ℂ) * L.v
def character (L : OrientedLattice) (γ z : ℂ) : ℂ :=
  Complex.exp ((2 * Real.pi * (z * star γ).im / area L : ℝ) * Complex.I)

def summand (L : OrientedLattice) (x y z : ℂ) (k : (ℤ × ℤ) × (ℤ × ℤ)) : ℂ :=
  let γ₁ := latticePoint L k.1
  let γ₂ := latticePoint L k.2
  let γ₃ := -γ₁ - γ₂
  if γ₁ = 0 ∨ γ₂ = 0 ∨ γ₃ = 0 then 0 else
    character L γ₁ x * character L γ₂ y * character L γ₃ z *
      (star γ₃ - star γ₂) / ((‖γ₁‖ ^ 2 * ‖γ₂‖ ^ 2 * ‖γ₃‖ ^ 2 : ℝ) : ℂ)

def kernel (L : OrientedLattice) (x y z : ℂ) : ℂ := ∑' k, summand L x y z k

theorem absoluteSummability (L : OrientedLattice) (x y z : ℂ) :
    Summable (fun k => ‖summand L x y z k‖) := by
  sorry

theorem periodic (L : OrientedLattice) (x y z : ℂ) (k : ℤ × ℤ) :
    kernel L (x + latticePoint L k) y z = kernel L x y z ∧
    kernel L x (y + latticePoint L k) z = kernel L x y z ∧
    kernel L x y (z + latticePoint L k) = kernel L x y z := by
  sorry

theorem translation (L : OrientedLattice) (x y z a : ℂ) :
    kernel L (x + a) (y + a) (z + a) = kernel L x y z := by
  sorry

theorem antisymmetric (L : OrientedLattice) (x y z : ℂ) :
    kernel L x z y = -kernel L x y z := by
  sorry

def divisors (L : OrientedLattice) (D F H : ℂ →₀ ℤ) : ℂ :=
  D.sum fun x nx => F.sum fun y ny => H.sum fun z nz =>
    (nx : ℂ) * (ny : ℂ) * (nz : ℂ) * kernel L x y z

def scaleLattice (L : OrientedLattice) (c : ℂ) (hc : c ≠ 0) : OrientedLattice where
  u := c * L.u
  v := c * L.v
  positiveArea := by sorry

theorem scale (L : OrientedLattice) (c : ℂ) (hc : c ≠ 0) (x y z : ℂ) :
    kernel (scaleLattice L c hc) (c * x) (c * y) (c * z) =
      (star c / ((‖c‖ ^ 6 : ℝ) : ℂ)) * kernel L x y z := by
  sorry

-- EllipticTrilog.diagonal
example (L : OrientedLattice) (x y : ℂ) : kernel L x y y = 0 := by
  sorry

-- EllipticTrilog.zero_divisor
example (L : OrientedLattice) (D F H : ℂ →₀ ℤ) :
    divisors L 0 F H = 0 ∧ divisors L D 0 H = 0 ∧ divisors L D F 0 = 0 := by
  sorry

-- EllipticTrilog.scaling_test
example (L : OrientedLattice) (x y z : ℂ) :
    kernel (scaleLattice L 2 (by norm_num)) (2*x) (2*y) (2*z) = kernel L x y z / 32 := by
  sorry
end EllipticTrilog

end TauCeti.CurveRegulator

/-! Omission manifest — exact packet names and carrier boundaries.

Polylogarithms:P.5/compact-test-forms
Declaration TestForms: For a second countable smooth oriented real m-manifold M, TestForms^k(M) consists of smooth sections of Λ^k T* M with compact support. Its topology is the locally convex inductive limit over compact K of the Fréchet spaces of sections supported in K, with all coordinate derivative seminorms. Complexification gives complex test forms; complex manifolds have their canonical orientation. Extension by zero is defined for an open embedding only for support compactly contained in that open.
Signature omitted; precise absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.ext: Equality of sections at every point implies equality.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.chart: On an open finite-dimensional normed-space chart, k-forms identify with TestFunction with continuous alternating-map coefficients, with the same LF topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.extendZero: Open embeddings give continuous extension by zero; identity and composition hold when the support is compactly contained.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.d: Exterior derivative is a continuous map TestForms^k→TestForms^(k+1), with square zero.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.empty: TestForms^k of the empty manifold is zero.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.chart_scalar: Degree-zero real test forms on Ω are Mathlib TestFunction Ω R ∞, including its topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).
Signature omitted — TestForms.support_escape: Bump functions translated to disjoint balls escaping every compact subset of R do not converge to zero in the test LF topology, although they converge to zero in the compact-open smooth topology.
Absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).

Polylogarithms:P.5/manifold-currents
Declaration ManifoldCurrent: On an oriented m-manifold M define a degree-q current as a continuous linear functional on TestForms^(m-q)(M), with real or complex coefficients as specified. Set dT(φ)=(-1)^(q+1)T(dφ). On a complex d-manifold this decomposes as ∂+bar∂ and has bidegrees (p,q). Locally L1 forms α define [α](φ)=∫ α∧φ. Pushforward exists for smooth maps proper on the support, with degree changed by the dimension difference; use holomorphic maps, whose real dimension difference is even, so d commutes. Pullback of arbitrary currents is restricted to submersions (and open embeddings); multiplication is by smooth forms, not by arbitrary currents.
Signature omitted; precise absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.ext: Agreement on all test forms implies equality.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.ofForm: Locally L1 coefficients yield the integral current, additive and invariant under almost-everywhere equality.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.d_apply: dT(φ)=(-1)^(degree T+1)T(dφ); d²=0.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.pushforward: For holomorphic maps proper on support, pushforward is functorial and commutes with d, ∂ and bar∂.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.pullback: Submersions admit pullback, with identity/composition and compatibility with smooth forms.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Signature omitted — ManifoldCurrent.chart_top: A top-degree current in an oriented real chart is a scalar Mathlib Distribution under the complementary-degree-zero test-form identification.
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.
Prototyped chart/coefficient/graded statement — ManifoldCurrent.dirac: The top-degree Dirac current δx evaluates a scalar test function at x, agreeing with Distribution.delta.
Prototyped chart/coefficient/graded statement — ManifoldCurrent.derivative_sign: The derivative of a scalar chart distribution evaluates φ as -T(∂vφ), agreeing with Distribution.lineDerivCLM.
Signature omitted — ManifoldCurrent.no_arbitrary_product: The product δ0·δ0 has no canonical product in this API; smoothing δ0 by scale ε gives squares whose mass grows like ε^(-m).
Absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.

Polylogarithms:P.5/analytic-cycle-current
Declaration CycleCurrent: For a pure-dimensional closed complex analytic subset Y of a complex d-manifold X, integrate complementary test forms over Yreg with its complex orientation. This is locally finite and defines the closed current [Y]raw of bidegree (c,c), c=codim Y. Extend additively to integral cycles. Whenever a proper resolution of Y is supplied, it equals pushforward of its integration current; for algebraic cycles such resolutions are constructed by R09.7, and the normalised BFT current is δY=(2πi)^(-(d-c))[Y]raw.
Signature omitted; precise absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.add: The current of Z+W is the sum of currents.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.resolution: A proper resolution computes the same raw integration current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.closed: The integration current of a closed analytic cycle is d-closed.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.bft: In complex dimension d and codimension c the normalised current is (2πi)^(-(d-c)) times the raw current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.point: In a complex curve the BFT current of a point is the ordinary Dirac current.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.multiplicity: The current of div(z^r) on C is rδ0 for r a positive integer.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.
Signature omitted — CycleCurrent.whole_space: For c=0, δX=(2πi)^(-d)[X]raw=[1] in BFT conventions.
Absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.

Polylogarithms:P.5/current-resolution
Declaration currentResolution: On a second countable smooth oriented manifold the inclusion of smooth forms into currents is a quasi-isomorphism of de Rham sheaf complexes. On a complex manifold the same inclusion is a quasi-isomorphism for each Dolbeault complex, compatibly with type and conjugation. Consequently the smooth and current Dolbeault models of real Deligne theory agree after the M.8 comparison is supplied.
Signature omitted; precise absent carrier: global de Rham/Dolbeault sheaf complexes of forms and currents, their cohomology and inclusion.

Polylogarithms:P.5/poincare-lelong
Declaration poincareLelong: For a meromorphic function f on a complex manifold which does not vanish identically on any connected component, log|f| is locally L1 and (i/π)∂bar∂[log|f|]=[div f]raw. Define dd^c=(i/π)∂bar∂; this is equivalently bar∂∂[log|f|]=πi[div f]raw. On a complex curve d[darg f]=2π[div f]raw. The BFT degree-one Deligne differential is -2∂bar∂, hence d_D[-log|f|]=-δdiv f with its dimension/twist normalisation.
Signature omitted; precise absent carrier: meromorphic functions/divisors on a complex manifold and typed global ∂,bar∂ current operators; only the scalar chart Laplacian is prototyped.

Polylogarithms:P.5/admissible-chow-locus
Declaration AdmissibleChowLocus: Given P^N over C, finitely many specified simplex faces L_I and a general-position hyperplane H, let U_(c,e) be the open locus in the requested degree-e, codimension-c Chow parameter space whose cycles meet every L_I properly and have no irreducible component contained in H where the coordinate-ratio construction requires this (the zero cycle satisfies this condition vacuously). The analytic parameter space Z^c is the disjoint union over e≥0 of these finite-dimensional loci. Its incidence cycle has a proper projection to the parameter space. Face intersection maps and vertex projection maps exist only on the loci where they preserve the prescribed dimensions; their target degree is recorded.
Signature omitted; precise absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.points: Complex points represent effective cycles of the fixed degree with all required proper face intersections.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.incidence: The incidence cycle projects properly to each finite-degree locus.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.face: Proper intersection with a specified face induces its cycle map and respects iterated faces on the common domain.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.vertex: Projection from a vertex is defined only when dimension and codimension are preserved; no unrestricted map is exported.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.zero: The degree-zero component consists of the zero cycle and has empty incidence cycle.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.line: For lines in P², each line distinct from every fixed one-dimensional face and avoiding every vertex meets all faces properly.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.
Signature omitted — AdmissibleChowLocus.face_line: A line equal to a one-dimensional face fails proper intersection with that face and is excluded.
Absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.

Polylogarithms:P.5/logarithmic-green-forms
Declaration LogGreenForm: For smooth projective complex X, a codimension-p cycle z and Y=supp z, a logarithmic Green form is a real Deligne support representative (ω,g) of cl(z) in degree 2p: ω is smooth on X, g is smooth on X\Y, and g pulls back on an embedded resolution of (X,Y) to a logarithmic form along a normal-crossings divisor. Representatives are taken modulo the support-complex boundaries, retaining the support class, not merely the off-support equation d_Dg=ω. A basic representative has g=Σλj αj+β on a resolution, with λj divisor Green functions, αj smooth of type (p-1,p-1), restrictions ∂ and bar∂ closed, and β smooth.
Signature omitted; precise absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.class: The support Deligne class is cl(z), with the specified Tate twist.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.basic: Every Green-form class has a basic logarithmic representative as stated.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.refine: Passing to a common resolution does not change its class.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.change: Adding a support-complex boundary changes the representative but not its Green-form class.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.principal: For a rational function f, (0,-log|f|) is the Green representative for div f in BFT conventions.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.zero: The zero cycle admits the zero pair.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.
Signature omitted — LogGreenForm.residue_required: On P¹ the zero form on the complement of a nonzero point satisfies d_Dg=0 there but is not a Green representative for that point: its support class is zero.
Absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.

Polylogarithms:P.5/logarithmic-current-estimate
Declaration logarithmicCurrentEstimate: Let Y have codimension p in a complex manifold X, and let α be a degree-r logarithmic form along Y, defined through a resolution of (X,Y). If r<2p, α is locally L1. If r<2p-1, d[α]=[dα]. In the borderline Green degree, a basic Green representative (ω,g) of cl(z) satisfies d_D[g]+δz=[ω]. These conclusions apply to currents modulo those annihilating test forms vanishing along the boundary used by the normalised cubical model.
Signature omitted; precise absent carrier: logarithmic form weight filtration, resolution pullback, local integrability and current residue on a global manifold.

Polylogarithms:P.5/green-current-comparison
Declaration greenCurrentComparison: For smooth projective complex X and a codimension-p cycle z, the map from logarithmic Green-form classes for z to Green current classes for z is an isomorphism. In BFT conventions its image satisfies d_D[g]+δz=[ω]; in unscaled conventions dd^c[g]+[z]raw is smooth. The map respects addition and pullback along morphisms for which the cycle pullback is defined and codimension p is preserved. No pullback of an arbitrary current is asserted.
Signature omitted; precise absent carrier: logarithmic Green-form quotient, current ∂/bar∂ quotient and their translation spaces.

Polylogarithms:P.5/green-presentation
Declaration GreenCH: For a smooth projective complex X and p≥1, define GreenCH^p(X) as the abelian group of pairs (z,g), z an integral codimension-p cycle and g a real (p-1,p-1) raw current, with dd^c g+[z]raw smooth, modulo (0,∂u+bar∂v) with the required real condition and principal pairs (div_Y f,-ιY*log|f|), where Y has codimension p-1 and the pushforward uses a resolution if Y is singular. Here dd^c=(i/π)∂bar∂=bar∂∂/(πi). This is the degree-zero complex-variety presentation of G05 equation (38), which was equation (36) in the preprint; it does not define arithmetic Chow groups of an arbitrary arithmetic ring.
Signature omitted; precise absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.mk: A pair satisfying the Green condition determines a class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.forget: Forget the Green current to obtain CH^p(X), respecting principal relations.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.curvature: Curvature dd^c g+[z]raw is a well-defined smooth closed (p,p) form on the quotient.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.principal: The principal pair on every codimension-(p-1) Y has zero class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.current_boundary: Adding ∂u+bar∂v does not change the class.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.P1_principal: On P¹, ([0]-[∞],-log|z|) represents zero.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.point: GreenCH^1(Spec C)=0: cycles vanish and principal pairs for constant f kill every real constant Green function.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.
Signature omitted — GreenCH.positive_curvature: A pair on P¹ with z=[0] and curvature integral one cannot be zero, whereas a principal pair has zero curvature.
Absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.

Polylogarithms:P.5/gersten-green-assembly
Declaration gerstenGreenAssembly: For smooth projective complex X, identify the parent degree-zero higher Arakelov group with GreenCH^p(X), using the graph morphism from the final Gersten terms ⊕_(codim p-2) Λ² C(Y)*→⊕_(codim p-1) C(Y)*→Z^p(X) into the Bloch cycle complex. The requested input is an isomorphism on the last two cohomology groups, together with its compatible tame-symbol/divisor differential; no quasi-isomorphism of the entire complexes is asserted.
Signature omitted; precise absent carrier: M.4 final Gersten graph comparison in two cohomology degrees and the parent Arakelov cone cohomology.

Polylogarithms:P.5/mixed-wang-forms
Declaration MixedWangForm.apply: On (P¹)^n×P^m define M_(n,m)=T_(n+m)(y1/x1,…,yn/xn,z1/z0,…,zm/z0), with M_(0,0)=1. Its current differential is the sum of cubical face currents with signs (-1)^(i+j) and simplicial face currents with signs (-1)^(n+i). It restricts to Wn when m=0 and to Gm when n=0. It vanishes on every ratio-one cubical boundary.
Concrete restricted model above; global specialization still needs: global current extension and its face differential; only ordered concatenation of logarithmic jets is prototyped.
Prototyped chart/coefficient/graded statement — MixedWangForm.apply: The form is T on the ordered concatenation of cube and simplex ratios.
Prototyped chart/coefficient/graded statement — MixedWangForm.cube: M_(n,0)=Wn.
Prototyped chart/coefficient/graded statement — MixedWangForm.simplex: M_(0,m)=Gm.
Signature omitted — MixedWangForm.boundary: d_D[M_(n,m)] has the cube signs (-1)^(i+j) and simplex signs (-1)^(n+i).
Absent carrier: global current extension and its face differential; only ordered concatenation of logarithmic jets is prototyped.
Prototyped chart/coefficient/graded statement — MixedWangForm.origin: M_(0,0)=1.
Prototyped chart/coefficient/graded statement — MixedWangForm.one_each: M_(1,1) equals T2 of the two coordinate logarithmic jets, with coefficient one in the explicit T2 formula.
Prototyped chart/coefficient/graded statement — MixedWangForm.ratio_one: The restriction to y1/x1=1 is zero, whereas evaluation at a nonconstant ratio need not vanish.

Polylogarithms:P.5/mixed-regulator
Declaration MixedRegulator: For the M.4 admissible mixed codimension-p cycle complex on X×□^n×Δ^m, use Δ^m=P^m minus {Σ_(i=0)^m zi=0}. Define Pcs(Z)=πX*(δZ∧M_(n,m)) through projective closure and resolution, in Deligne degree 2p-n-m. The mixed total boundary is δ+(-1)^n∂. The map is a chain map and restricts along the M.4 cubical and simplicial inclusions ic,is to Pc and Ps. To identify the parent simplex convention Σ_(i=1)^m zi=z0 use z0↦-z0; constant factors -1 do not change logarithmic jets.
Signature omitted; precise absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.cycle: An admissible mixed generator maps to its resolved M current pushed to X.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.degree: Bidegree (n,m) maps to Deligne degree 2p-n-m.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.chain: d_D Pcs=Pcs(δ+(-1)^n∂).
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.restrict: Pcs∘ic=Pc and Pcs∘is=Ps in the same BFT model.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.axes: At (n,0) the map equals Pc, and at (0,m) it equals Ps.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.degree_test: For p=2,n=1,m=1 the target degree is 2, rather than 3.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.
Signature omitted — MixedRegulator.origin: At (0,0) an admissible cycle maps to δZ.
Absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.

Polylogarithms:P.5/simplicial-cubical-comparison
Declaration simplicialCubicalComparison: For smooth projective complex X, the M.4 mixed-cycle inclusions is and ic are quasi-isomorphisms and identify the homology maps of Ps and Pc through Pcs. The simplicial regulator is the parent Goncharov cycle formula evaluated in the BFT normalised current model. The additional degreewise conversion from the parent raw G05 model is a separate recorded gap.
Signature omitted; precise absent carrier: M.4 mixed-inclusion quasi-isomorphisms and induced higher Chow regulator maps.

Polylogarithms:P.5/beilinson-comparison-assembly
Declaration beilinsonComparisonAssembly: For every smooth projective complex variety X and n≥0, the direct sum of the BFT-normalised simplicial regulators CH_s^p(X,n)_Q→H_D^(2p-n)(X,R(p)), composed with the M.6 rational higher Chern character K_n(X)_Q→⊕pCH_s^p(X,n)_Q, equals the M.8 universal Beilinson regulator. This is the precise content and hypothesis range of BFT Theorem 6.18. Identification with every raw parent convention is conditional on the recorded model-conversion gap.
Signature omitted; precise absent carrier: M.6 rational higher Chern character and early M.8 Beilinson regulator in the same normalization.

Polylogarithms:P.5/curve-symbol-chern-comparison
Declaration curveSymbolChernComparison: For a smooth projective geometrically integral curve X over C and a rational K2 class represented by Σj{fj,gj} with vanishing tame symbols in κ(x)*⊗Q, its weight-two real Deligne regulator is represented by iΣjη(fj,gj), η(f,g)=log|f|darg g-log|g|darg f, in the M.8 differential-form model. With ch_(i,j)=(-1)^(j-1)c_(i,j)/(j-1)!, ch_(2,2)=-c_(2,2); multiplicativity and the Chern product coefficient -1 give the positive unit cup product. This fixes the general curve formula once, without adding the elliptic embedding, period or rational-orientation choices owned by ER.2.
Signature omitted; precise absent carrier: rational Quillen K2 and its tame kernel, M.8 Deligne hypercohomology/cup product/Chern character, parent global η current.

Polylogarithms:P.5/weight-three-relation-descent
Declaration weightThreeRelationDescent: On a smooth complex curve, the parent formula ρ2({f}2⊗g)=D(f)darg g-(1/3)α(1-f,f)log|g|, α(a,b)=log|a|dlog|b|-log|b|dlog|a|, is compatible with the B2 functional relations and is additive in g. Thus it defines the middle map of the imported weight-three curve polylogarithmic complex. Under the G00 convention Lhat2=iD and α_G00=-α, r3(2)=-ρ2. The neighbouring map is r3(1)=L3, whereas the parent diagonal relation is ρ2({f}2⊗f)=-dL3(f).
Signature omitted; precise absent carrier: imported B2 relation quotient, function-field tensor complex, single-valued D/L3 and global logarithmic current form.

Polylogarithms:P.5/weight-three-motivic-comparison
Declaration weightThreeMotivicComparison: Let X be a smooth projective geometrically integral curve over a number field F. The imported rational map c_(2,3):K4(F(X))_Q→H²Γ(F(X),3)_Q is compatible with Quillen residues K3(κ(x))_Q→H¹Γ(κ(x),2)_Q and with the real Deligne regulator. The resulting unramified class from K4(X)_Q has the curve regulator represented by r3(2)=-ρ2 in the D96 convention. The diagram is a compatibility statement, not an isomorphism on K4. The generic-field construction remains subject to the imported P.3 proof gap.
Signature omitted; precise absent carrier: P.3 K4 comparison, rational polylogarithmic cohomology, Quillen residues and M.8 Deligne regulator.

Polylogarithms:P.5/generalized-elliptic-trilogarithm
Declaration EllipticTrilog.kernel: Let Λ=Zu+Zv⊂C with A=Im(conj(u)v)>0 and E(C)=C/Λ. For γ∈Λ set χγ(z)=exp(2πi Im(z conjγ)/A). Define K3(x,y,z)=Σ′_(γ1+γ2+γ3=0) χγ1(x)χγ2(y)χγ3(z)(conjγ3-conjγ2)/(|γ1|²|γ2|²|γ3|²), excluding each zero γ. Equivalently sum over two independent Z² indices with γ3=-γ1-γ2. The sum is absolutely convergent and descends to E³. Extend separately linearly to finite integral divisors in each argument. This three-point weight-three kernel is the generalized elliptic trilogarithmic series in D96, not a one-variable weight-two series.
Concrete restricted model above; global specialization still needs: quotient elliptic-curve uniformization and divisor lifts; the lifted explicit lattice kernel, divisor sums and invariance signatures are prototyped.
Prototyped chart/coefficient/graded statement — EllipticTrilog.kernel: The explicit absolutely convergent two-index sum defines K3.
Prototyped chart/coefficient/graded statement — EllipticTrilog.periodic: Adding a lattice element to any argument leaves K3 unchanged.
Prototyped chart/coefficient/graded statement — EllipticTrilog.translation: K3(x+a,y+a,z+a)=K3(x,y,z).
Prototyped chart/coefficient/graded statement — EllipticTrilog.antisymmetric: K3(x,z,y)=-K3(x,y,z), hence K3(x,y,y)=0.
Prototyped chart/coefficient/graded statement — EllipticTrilog.divisors: Finite integral divisors are evaluated by the trilinear finite sum.
Prototyped chart/coefficient/graded statement — EllipticTrilog.scale: Scaling Λ,x,y,z by λ≠0 multiplies K3 by conjλ/|λ|⁶.
Prototyped chart/coefficient/graded statement — EllipticTrilog.diagonal: K3(x,y,y)=0, by exchanging the second and third summation variables.
Prototyped chart/coefficient/graded statement — EllipticTrilog.zero_divisor: Evaluation on a zero divisor is zero in every slot.
Prototyped chart/coefficient/graded statement — EllipticTrilog.scaling_test: For a positive real scale 2, K3_(2Λ)(2x,2y,2z)=K3_Λ(x,y,z)/32; a weight-two single-index kernel has the wrong exponent.

Polylogarithms:P.5/elliptic-trilogarithm-summability
Declaration EllipticTrilog.absoluteSummability: For every oriented full lattice Λ in C, the absolute values of the K3 summands over (γ1,γ2)∈Λ² with γ1γ2(γ1+γ2)≠0 are summable, uniformly in x,y,z because all characters have modulus one. Consequently the divisor sum, index permutations, lattice-lift invariance and the scaling identity may be evaluated by absolutely convergent rearrangement.
Concrete restricted model above; global specialization still needs: no absent carrier for the explicit lifted-lattice summability signature; the analytic proof is unproved.

Polylogarithms:P.5/weight-three-pairing
Declaration weightThreePairing: For a smooth projective complex curve X, nonzero meromorphic f,1-f,g and a holomorphic or antiholomorphic one-form ω, the locally integrable parent regulator satisfies ∫X ρ2({f}2⊗g)∧ω=-(4/3)∫X log|g|α(1-f,f)∧ω. For r3(2)=-ρ2 the scalar is +4/3. The identities hold termwise, without requiring Σ(1-f)∧f∧g=0; that condition enters the subsequent divisor-only Fourier formula.
Signature omitted; precise absent carrier: global meromorphic functions, Bloch–Wigner form, locally integrable current pairing and holomorphic/antiholomorphic global one-forms.

Polylogarithms:P.5/elliptic-fourier-comparison
Declaration ellipticFourierComparison: Let E=C/(Zu+Zv), A=Im(conj(u)v)>0, with positive complex orientation and dz the lifted holomorphic form. For a finite rational symbol cycle Σj{fj}2⊗gj with Σj(1-fj)∧fj∧gj=0 in Λ³(C(E)*⊗Q), put Dj=div gj, Fj=div fj, Hj=div(1-fj). In the explicit character and area convention of K3, the target comparison is Σj∫E log|gj|α(1-fj,fj)∧dbarz = iA³/(4π²) ΣjK3(Dj,Fj,Hj), and hence Σj∫Eρ2({fj}2⊗gj)∧dbarz = -iA³/(3π²)ΣjK3(Dj,Fj,Hj). The constants are derived using ordinary area, not copied from D96’s implicit normalization; rigorous Fourier regularisation and source collation are recorded proof gaps.
Signature omitted; precise absent carrier: elliptic uniformization, meromorphic divisor/symbol complex and current integral; Fourier regularization and normalization collation remain proof gaps.

Polylogarithms:P.5/bft-current-dictionary
Declaration bftCurrentDictionary: On a smooth projective complex d-fold, the BFT form current is [α](ω)=(2πi)^(-d)∫ω∧α, and its codimension-p cycle current is δY=(2πi)^(-(d-p))∫Yω. Below Deligne degree 2p a degree-k cochain has ordinary form degree k-1 and twist p-1; the top degree uses closed (p,p) currents of twist p. The top differential is -2∂bar∂=2bar∂∂. Apply the requested M.8 Dolbeault real Deligne functor to the smooth/current quasi-isomorphism to identify cohomology with H_D. This pins the BFT model. Identification of the parent raw simplicial regulator with this normalised map still requires its separate degreewise sign/scale dictionary, recorded as a gap.
Signature omitted; precise absent carrier: early M.8 Deligne models, Tate twists, smooth/current inclusion and global current degrees.

Polylogarithms:P.5/wang-forms
Declaration WangForm.coefficients: For a Dolbeault algebra A and u1,…,um∈D¹(A,1), set S_m^i=(-2)^m Alt(u1∂u2∧…∧∂ui∧bar∂u_(i+1)∧…∧bar∂um), with Alt the unaveraged signed permutation sum. Define T0=1 and Tm=(2m!)^(-1)Σ_(i=1)^m(-1)^i S_m^i. It lies in D^m(A,m), ordinary degree m-1 for m>0. For rational functions use uj=-log|fj|, with ∂uj=-½dlog fj and bar∂uj=-½dbarlog fj. Define Wm=Tm(y1/x1,…,ym/xm) and Gm=Tm(z1/z0,…,zm/z0).
Concrete restricted model above; global specialization still needs: global Dolbeault/Deligne algebra and its rational-function jets; the entire coefficient polynomial and its algebraic naturality are prototyped.
Prototyped chart/coefficient/graded statement — WangForm.coefficients: The pointwise finite polynomial takes real u-values and holomorphic/antiholomorphic degree-one components, with exactly (-2)^m/(2m!) and signs (-1)^i.
Prototyped chart/coefficient/graded statement — WangForm.one: T1(u)=u; for f this is -log|f|.
Prototyped chart/coefficient/graded statement — WangForm.two: T2(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u).
Prototyped chart/coefficient/graded statement — WangForm.alternating: Permuting inputs multiplies Tm by the permutation sign.
Prototyped chart/coefficient/graded statement — WangForm.pullback: Pullback by a Dolbeault-algebra morphism commutes with Tm, Wm and Gm.
Prototyped chart/coefficient/graded statement — WangForm.unit_function: For m>0, Tm(f1,…,1,…,fm)=0.
Prototyped chart/coefficient/graded statement — WangForm.test_one: T1 with u=3 and zero derivatives is 3, rather than -3 or 6.
Prototyped chart/coefficient/graded statement — WangForm.test_two: For u=1,v=0, ∂u=bar∂u=bar∂v=0 and ∂v=a, the pointwise T2 is the degree-one form a.
Prototyped chart/coefficient/graded statement — WangForm.test_zero: T0=1; a tuple containing the zero jet (the logarithmic jet of the constant function 1) gives zero for m>0.

Polylogarithms:P.5/wang-differential
Declaration wangDifferential: For u_j∈D¹(A,1), Tm is (1/m!) times the alternating right-nested Deligne product uσ1•(uσ2•…•uσm), and d_D Tm=Σ_(j=1)^m(-1)^(j-1)d_Duj•T_(m-1)(u1,…,omit uj,…,um). The nesting is retained: the Deligne product is associative up to homotopy rather than strictly associative.
Signature omitted; precise absent carrier: typed global ∂,bar∂ and Deligne differential/product, including its homotopy associativity.

Polylogarithms:P.5/r-wang-comparison
Declaration rWangComparison: For nonzero rational functions f1,…,fm, Tm(-log|f1|,…,-log|fm|)=(-1)^m r_(m-1)(f1,…,fm), where the parent r-form uses unaveraged Alt and coefficients 1/((2j+1)!(m-2j-1)!). Equality is of the off-divisor forms and of their locally integrable extension currents. In particular T1=-r0, T2=r1=iη, and T3=-r2.
Signature omitted; precise absent carrier: parent global logarithmic r forms and their locally integrable current extension.

Polylogarithms:P.5/wang-boundary-currents
Declaration wangBoundaryCurrents: For rational functions on a smooth projective complex variety, in the BFT normalisation d_D[Tm]=-[T_(m-1)]∘Res, with the exterior residue placing the uniformiser first and T0=1. On (P¹)^m this gives d_D[Wm]=Σ_(i=1)^mΣ_(j=0,1)(-1)^(i+j)(δ_i^j)*[W_(m-1)], with j=0 the zero face and j=1 the infinity face. For Gm on P^m, d_D[Gm]=Σ_(i=0)^m(-1)^i(∂i)*[G_(m-1)]. The restriction of Wm to a holomorphic map factoring through any ratio-one boundary is zero.
Signature omitted; precise absent carrier: global Wang currents, cubical/simplicial embeddings and exterior-residue current pushforward.

Polylogarithms:P.5/cubical-regulator
Declaration CubicalRegulator: For smooth projective complex X and an admissible integral codimension-p cycle Z in X×□^m, □=P¹\{1}, let Zbar be its projective closure and ι:Ztilde→X×(P¹)^m a resolution. Define Pc(Z)=πX*ι*[Tm of the restricted coordinate functions]=πX*(δZ∧Wm) in τ≤2p D_D^(2p-m)(X,p), with the BFT current twists. The product notation is defined through resolution and integration, not by an arbitrary current product. Extend linearly on the M.4 normalised cube complex ∩ker(infinity faces), with differential δ=Σ_i(-1)^i zero-face_i. Pc is independent of resolution and is a chain map.
Signature omitted; precise absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.cycle: An admissible generator maps to πX* of its resolved Wang current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.resolution: Different resolutions give the same current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.boundary: d_D Pc(Z)=Pc(δZ) on the normalised complex.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.zero_degree: Pc at m=0 is the BFT cycle current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.point: For a point on a complex curve in m=0 the image is its Dirac current.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.P1_unit: For the degree-one point t=a of □ with a≠0,1,∞ and X a point, Pc(a)=-log|a|.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.
Signature omitted — CubicalRegulator.face_excluded: A component lying in t=0 is not an admissible input; assigning log 0 to it is not a regulator extension.
Absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.

Polylogarithms:P.5/bft-auxiliary-complex
Declaration BFTAuxiliary.Degree: With M.8 logarithmic Deligne complexes and M.4 admissible cube supports, form DA^(r,-m)=τ≤2p Dlog^r(X×□^m,p), take infinity-face normalisation, and totalise with d_D+(-1)^rδ. Let DA_Z be the corresponding support cone s(Dlog(X×□^m)→Dlog((X×□^m)\Z)), and Hp_m its top support cohomology H_D,Z^(2p). Use the standard maps g1:DA_Z^(2p-*)→Hp_* and ρ:DA_Z→DA. Fix cochain grading: DA_H^q=DA_Z^(q+1)⊕Hp^q⊕DA^q. Define DA_H as the shifted simple of Hp←g1 DA_Z→ρ DA: d(a1,a2,a3)=(-da1, da2+g1a1, da3-ρa1). Its maps are β(α)=(0,0,α) and the cycle map z↦(0,cl(z),0).
Concrete restricted model above; global specialization still needs: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.differential: The three-coordinate differential is exactly the one in the statement.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.beta: β includes DA as the third coordinate and is a quasi-isomorphism.
Signature omitted — BFTAuxiliary.cycle: In the fixed (support,cycle,base) order, a cycle z maps to (0,cl(z),0).
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Signature omitted — BFTAuxiliary.purity: Top support Deligne cohomology is the admissible cycle group tensored with R; g1 is the induced top-class projection.
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.beta_sign: d(0,0,α)=(0,0,dα), so β is a cochain map.
Prototyped chart/coefficient/graded statement — BFTAuxiliary.square: For chain maps g1 and ρ, the displayed differential squares to zero on each of the three summands.
Signature omitted — BFTAuxiliary.point_top: For X a point and p=m=0, the top support cycle class is R and sends the integral generator to 1.
Absent carrier: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.

Polylogarithms:P.5/integration-comparison
Declaration WangIntegration: For DA^(r,-m), define φ(α)=πX*[α•Wm] in Deligne degree r-m. The product uses the M.8 fixed Deligne product and has ordinary degree r+m-1 before projection, except at m=0,r=2p, where the top Deligne cochain is an ordinary degree-2p form and W0=1 preserves that degree. On the infinity-face normalised DA complex this lands in smooth τ≤2p D(X,p), is a cochain map and a quasi-inverse of the base inclusion τD(X,p)→DA(X,p)_0.
Signature omitted; precise absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.apply: φ(α)=πX*[α•Wm].
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.chain: φ commutes with the total d_D+(-1)^rδ differential.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.base: At m=0, φ is the normalised smooth-form inclusion into currents.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.inverse: On cohomology φ is inverse to base inclusion.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.base_test: φ at m=0 has current evaluation (2πi)^(-dim X)∫ω∧α.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.zero: φ(0)=0 in every bidegree.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.
Signature omitted — WangIntegration.degree: An input of bidegree (r,-m) has output Deligne degree r-m, not r+m. At m=0,r=2p (in particular p=1,r=2), W0 preserves the ordinary top degree 2p, rather than the lower-degree formula 2p-1.
Absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.

Polylogarithms:P.5/green-wang-product
Declaration greenWangProduct: For a normalised support representative (ω,g) of degree r over X×□^m, the form g•Wm is locally L1. At r=2p, if cl(ω,g)=cl(z), d_D[g•Wm]=[ω•Wm]-δz•Wm-[δg•W_(m-1)]. At r<2p, d_D[g•Wm]=[d_Dg•Wm]+(-1)^(r-1)[δg•W_(m-1)]. Face sums in δ use the normalised cube differential and support changes. The expression δz•Wm is the resolved cycle current of Pc.
Signature omitted; precise absent carrier: global logarithmic Green representatives, Wang-current products defined on resolutions and their face residues.

Polylogarithms:P.5/regulator-homotopy
Declaration RegulatorComparison.apply: On DA_H^(2p-*) define ψ((ω,g),z,α)=Pc(z)-πX*[g•Wm]+φ(α), in the fixed (support,cycle,base) coordinate order, with the bidegree of the support representative specifying m. This is a cochain map to τD_D^(2p-*) and satisfies ψ∘cycle=Pc and ψ∘β=φ. Thus Pc and the Burgos–Feliu support regulator agree on higher Chow homology through the common support complex.
Concrete restricted model above; global specialization still needs: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Prototyped chart/coefficient/graded statement — RegulatorComparison.apply: ψ is Pc minus the Green integral plus φ, with the specified grading.
Signature omitted — RegulatorComparison.chain: ψ commutes with the three-coordinate differential.
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Signature omitted — RegulatorComparison.cycle: ψ(0,z,0)=Pc(z) in the fixed (support,cycle,base) order.
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Signature omitted — RegulatorComparison.beta: ψ(0,0,α)=φ(α).
Absent carrier: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.
Prototyped chart/coefficient/graded statement — RegulatorComparison.first: On a pure cycle the comparison gives Pc.
Prototyped chart/coefficient/graded statement — RegulatorComparison.third: On a pure third-coordinate form the comparison gives φ.
Prototyped chart/coefficient/graded statement — RegulatorComparison.middle_sign: On ((ω,g),0,0) in the fixed coordinate order the value is -πX*[g•Wm], rather than its positive.

Polylogarithms:P.5/cubical-beilinson
Declaration cubicalBeilinson: For smooth projective complex X and p,n≥0, Pc:CH_c^p(X,n)→H_D^(2p-n)(X,R(p)) agrees with the Burgos–Feliu support regulator. After the M.6 rational Chern character K_n(X)_Q≅⊕pCH^p(X,n)_Q and the M.8 universal Chern normalisation, its direct sum is Beilinson’s regulator. This does not redefine the universal Chern classes in P.5.
Signature omitted; precise absent carrier: M.4 higher Chow homology, M.6 rational K/Chern character and early M.8 universal regulator.

Local analytic-cycle closedness still needs the recorded El Mir positive-current/
pluripolar extension interface; Poincaré–Lelong needs the normal-current support
theorem with its order-zero hypotheses. These are not supplied by the scalar chart model.

The fixed auxiliary coordinate order is (support,cycle,base); the finite
RegulatorComparison.apply helper accepts its inputs in term order (cycle,Green,base).
BFTAuxiliary.beta is only the graded inclusion here; its quasi-isomorphism API
requires the omitted purity diagram. Global Wang pullback similarly requires the
Dolbeault morphism, beyond the coefficient-level ExteriorAlgebra.map statement.
-/

end P5FollowUp

/-! ## P.6 follow-up: the real differential of the single-valued trilogarithm -/

section P6FollowUp

/-
P.6 part (BP-Polylogarithms--P.6, REV-Polylogarithms--P.6). The shared strong-Leopoldt
statement, map and defect belong to IntegralIwasawaTheory I.2; the p-adic regulator and the
equivalence are in the first packet's P.6 section above. This part adds the real
differential of the single-valued trilogarithm and its exact tests.
-/

open Complex

namespace TauCeti.Polylog

-- `polylog`, `singleValuedPolylog` and `blochWigner` are the first packet's declarations above.

/-- P.6/single-valued-trilogarithm-differential, promoted API of P.1's `L_n`.
The differentiability conjunct is essential: `fderiv` alone is totalised.
`Im (v/z)` denotes the smooth angular one-form, including on the cut. -/
theorem singleValuedPolylog_three_differential {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValuedPolylog 3) z ∧
      ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) z v =
        -blochWigner z * (v / z).im +
          (Real.log ‖z‖ / 3) *
            (Real.log ‖1 - z‖ * (v / z).re - Real.log ‖z‖ * (v / (z - 1)).re) := by
  sorry

/-- Test `trilog_diff_half`: the coefficient detects the Bernoulli normalisation. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (1 / 2 : ℂ) ∧
    ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) (1 / 2 : ℂ) v =
      (4 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- Test `trilog_diff_on_cut`: the principal cut does not restrict the theorem. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (2 : ℂ) ∧
    ∀ v : ℂ, fderiv ℝ (singleValuedPolylog 3) (2 : ℂ) v =
      -(1 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- Test `trilog_diff_minus_one`: a zero derivative at a regular point. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) (-1 : ℂ) ∧
    fderiv ℝ (singleValuedPolylog 3) (-1 : ℂ) = 0 := by
  sorry

/-- Test `trilog_diff_unit_circle`: radial zero and the signed angular derivative. -/
example {z : ℂ} (hz : ‖z‖ = 1) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValuedPolylog 3) z ∧
      fderiv ℝ (singleValuedPolylog 3) z z = 0 ∧
        fderiv ℝ (singleValuedPolylog 3) z (I * z) = -blochWigner z := by
  sorry

/-- Test `trilog_diff_i_sign`: `D(i)>0` imports the separate
P.1/bloch-wigner-positivity lemma. Its existing minimum-principle proof input
is recorded as an inherited gap in the packet; the derivative equalities
themselves do not require positivity. -/
example : DifferentiableAt ℝ (singleValuedPolylog 3) I ∧
    fderiv ℝ (singleValuedPolylog 3) I (-1) = -blochWigner I ∧
      fderiv ℝ (singleValuedPolylog 3) I (-1) < 0 ∧
        fderiv ℝ (singleValuedPolylog 3) I I = 0 := by
  sorry

end TauCeti.Polylog

end P6FollowUp
