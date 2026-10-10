import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.RemovableSingularity
import Mathlib.Analysis.Fourier.RiemannLebesgueLemma
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Sinc
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.NumberTheory.LSeries.Convolution
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import TauCeti.Order.Northcott

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Proof admissions specify work to do; they assert no implementation.
-/

noncomputable section
open Filter MeasureTheory Set
open scoped Topology
attribute [local instance] Classical.propDecidable

namespace TauCeti

-- The existing Northcott summatory function is used, with the zero coefficient suppressed.
local instance : Northcott (fun n : ℕ => n) where
  finite_le b := Set.finite_Iic b

/-! Layer HP.0: convergent transforms and genuine boundary germs. -/

-- The carrier and measure convention follow Mathlib PR #40582. The real counting
-- functions below are cast explicitly to ℂ; the endpoint has zero Lebesgue measure.
def HasLaplace {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMul ℂ E]
    (f : ℝ → E) (s : ℂ) (z : E) (μ : Measure ℝ := volume.restrict (Ioi 0)) : Prop :=
  Integrable (fun t : ℝ => Complex.exp (-s * t) • f t) μ ∧
    (∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ) = z

section LaplaceAPI
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

lemma HasLaplace.integrable [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) :
    Integrable (fun t : ℝ => Complex.exp (-s * t) • f t) μ := by sorry

lemma HasLaplace.integral_eq [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) :
    (∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ) = z := by sorry

lemma HasLaplace.unique [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z z' : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) (h' : HasLaplace f s z' μ) : z = z' := by sorry

lemma HasLaplace.congr_ae [SMul ℂ E] {f g : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) (heq : f =ᵐ[μ] g) : HasLaplace g s z μ := by sorry

lemma HasLaplace.add [DistribSMul ℂ E] {f g : ℝ → E} {s : ℂ} {z w : E} {μ : Measure ℝ}
    (hf : HasLaplace f s z μ) (hg : HasLaplace g s w μ) :
    HasLaplace (fun t => f t + g t) s (z + w) μ := by sorry

lemma HasLaplace.const_smul [NormedSpace ℂ E] [IsScalarTower ℝ ℂ E]
    {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ} (h : HasLaplace f s z μ) (c : ℂ) :
    HasLaplace (fun t => c • f t) s (c • z) μ := by sorry

lemma HasLaplace.comp_mul_left [NormedSpace ℂ E] [IsScalarTower ℝ ℂ E]
    {f : ℝ → E} {s : ℂ} {z : E} {c : ℝ} (h : HasLaplace f (s / c) z) (hc : 0 < c) :
    HasLaplace (fun t => f (c * t)) s ((c : ℂ)⁻¹ • z) := by sorry
end LaplaceAPI

-- Test: HasLaplace_test_zero
example (s : ℂ) : HasLaplace (fun _ => (0 : ℂ)) s 0 := by sorry
-- Test: HasLaplace_test_constant
example {s : ℂ} (hs : 0 < s.re) :
    HasLaplace (fun _ => (1 : ℂ)) s (1 / s) := by sorry
-- Test: HasLaplace_test_nonintegrable
example : ¬ HasLaplace (fun _ => (1 : ℂ)) 0 0 := by sorry

-- Test: HasLaplace_test_quadratic
example {s : ℂ} (hs : 0 < s.re) :
    HasLaplace (fun t => (t : ℂ) ^ 2) s (2 / s ^ 3) := by sorry

namespace HigherPoleTauberian

/-- With nonzero leading coefficient, pole order is k+1. All agreement statements are on the open half-plane.
Boundary values of the total function F are irrelevant. -/
structure PoleBoundary (F : ℂ → ℂ) (a : ℝ) (k : ℕ) (A : ℝ) : Prop where
  interior : AnalyticOnNhd ℂ F {s : ℂ | a < s.re}
  pole : ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ,
    AnalyticOnNhd ℂ g (Metric.ball (a : ℂ) r) ∧ g a = (A : ℂ) ∧
      ∀ s ∈ Metric.ball (a : ℂ) r, a < s.re →
        F s = g s / (s - a) ^ (k + 1)
  away : ∀ y : ℝ, y ≠ 0 → ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ,
    AnalyticOnNhd ℂ g (Metric.ball ((a : ℂ) + y * Complex.I) r) ∧
      ∀ s ∈ Metric.ball ((a : ℂ) + y * Complex.I) r, a < s.re → F s = g s

lemma PoleBoundary.congr {F G : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) (heq : ∀ s : ℂ, a < s.re → F s = G s) :
    PoleBoundary G a k A := by sorry

lemma PoleBoundary.leading_unique {F : ℂ → ℂ} {a A B : ℝ} {k : ℕ}
    (hA : PoleBoundary F a k A) (hB : PoleBoundary F a k B) : A = B := by sorry

lemma PoleBoundary.order_unique {F : ℂ → ℂ} {a A B : ℝ} {k l : ℕ}
    (hA : PoleBoundary F a k A) (hB : PoleBoundary F a l B)
    (hA0 : A ≠ 0) (hB0 : B ≠ 0) : k = l := by sorry

lemma PoleBoundary.div_argument {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) (ha : 0 < a) :
    PoleBoundary (fun s => F s / s) a k (A / a) := by sorry

lemma PoleBoundary.rescale {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) (ha : 0 < a) :
    PoleBoundary (fun s => F ((a : ℂ) * s)) 1 k (A / a ^ (k + 1)) := by sorry

lemma PoleBoundary.mul_regular {F H : ℂ → ℂ} {a A C : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A)
    (hH : AnalyticOnNhd ℂ H {s : ℂ | a ≤ s.re}) (hHa : H a = (C : ℂ)) :
    PoleBoundary (fun s => F s * H s) a k (A * C) := by sorry

-- Test: PoleBoundary_test_model
example (a A : ℝ) (k : ℕ) :
    PoleBoundary (fun s => (A : ℂ) / (s - a) ^ (k + 1)) a k A := by sorry
-- Test: PoleBoundary_test_wrong_leading
example :
    ¬ PoleBoundary (fun s => 1 / (s - 1)) 1 0 2 := by sorry
-- Test: PoleBoundary_test_boundary_value
example :
    PoleBoundary (fun s => if s = 1 then 37 else 1 / (s - 1)) 1 0 1 := by sorry
-- Test: PoleBoundary_test_zero_not_exact
example {a : ℝ} {k : ℕ} {A : ℝ} (hA : A ≠ 0) :
    ¬ PoleBoundary (fun _ => 0) a k A := by sorry

-- Test: PoleBoundary_test_dyadic
example : ¬ PoleBoundary
    (fun s => 1 / (1 - Complex.exp ((1 - s) * Real.log 2))) 1 0 (1 / Real.log 2) := by sorry

/-! Layer HP.1: analytic smoothing and the polynomial weight. -/

def squaredSinc (ell v : ℝ) : ℝ := ell / Real.pi * Real.sinc (ell * v) ^ 2

lemma squaredSinc_nonneg {ell : ℝ} (hell : 0 < ell) (v : ℝ) : 0 ≤ squaredSinc ell v := by sorry
lemma squaredSinc_even (ell v : ℝ) : squaredSinc ell (-v) = squaredSinc ell v := by sorry
lemma squaredSinc_continuous (ell : ℝ) : Continuous (squaredSinc ell) := by sorry
lemma squaredSinc_integrable {ell : ℝ} (hell : 0 < ell) : Integrable (squaredSinc ell) := by sorry
lemma squaredSinc_mass {ell : ℝ} (hell : 0 < ell) : (∫ v : ℝ, squaredSinc ell v) = 1 := by sorry
lemma squaredSinc_fourier {ell : ℝ} (hell : 0 < ell) (v : ℝ) :
    (squaredSinc ell v : ℂ) = (1 / (2 * (Real.pi : ℂ))) *
      ∫ y : ℝ in (-2 * ell)..(2 * ell),
        ((1 - |y| / (2 * ell) : ℝ) : ℂ) * Complex.exp (Complex.I * y * v) := by sorry
lemma squaredSinc_tail {h : ℝ} (hh : 0 < h) :
    Tendsto (fun ell : ℝ => ∫ v : ℝ in {v | h ≤ |v|}, squaredSinc ell v)
      atTop (𝓝 0) := by sorry

-- Test: squaredSinc_test_origin
example {ell : ℝ} (hell : 0 < ell) :
    squaredSinc ell 0 = ell / Real.pi := by sorry
-- Test: squaredSinc_test_zero
example {ell : ℝ} (hell : 0 < ell) :
    squaredSinc ell (Real.pi / ell) = 0 := by sorry
-- Test: squaredSinc_test_mass_two
example : (∫ v : ℝ, squaredSinc 2 v) = 1 := by sorry

/-- The integration cutoff is 1; changing it to another positive cutoff gives the same limit. -/
def delangeWeight (k : ℕ) (t : ℝ) : ℝ :=
  t * ∫ u : ℝ in (0 : ℝ)..1, Real.exp (-u * t) * u ^ k / (k.factorial : ℝ)

lemma delangeWeight_continuous (k : ℕ) : Continuous (delangeWeight k) := by sorry
lemma delangeWeight_nonneg (k : ℕ) {t : ℝ} (ht : 0 ≤ t) : 0 ≤ delangeWeight k t := by sorry
lemma delangeWeight_pos (k : ℕ) {t : ℝ} (ht : 0 < t) : 0 < delangeWeight k t := by sorry
lemma delangeWeight_normalization (k : ℕ) :
    Tendsto (fun t : ℝ => delangeWeight k t * t ^ k) atTop (𝓝 1) := by sorry
lemma delangeWeight_shift (k : ℕ) (h : ℝ) :
    Tendsto (fun t : ℝ => delangeWeight k (t + h) / delangeWeight k t)
      atTop (𝓝 1) := by sorry
lemma delangeWeight_bound (k : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    delangeWeight k t * t ^ k ≤ 1 := by sorry

-- Test: delangeWeight_test_origin
example (k : ℕ) : delangeWeight k 0 = 0 := by sorry
-- Test: delangeWeight_test_simple
example (t : ℝ) : delangeWeight 0 t = 1 - Real.exp (-t) := by sorry
-- Test: delangeWeight_test_double
example (t : ℝ) :
    t * delangeWeight 1 t = 1 - (1 + t) * Real.exp (-t) := by sorry

-- Test: delangeWeight_test_triple
example (t : ℝ) :
    t ^ 2 * delangeWeight 2 t =
      1 - (1 + t + t ^ 2 / 2) * Real.exp (-t) := by sorry

/-! Layer HP.2: the nontrivial transform and boundary steps. -/

theorem integerGammaLaplace (k : ℕ) {a : ℝ} {s : ℂ} (hs : a < s.re) :
    HasLaplace (fun t => ((Real.exp (a * t) * t ^ k : ℝ) : ℂ)) s
      ((k.factorial : ℂ) / (s - a) ^ (k + 1)) := by sorry

/-- R = F - A/(s-a)^(k+1). Its lower poles are regularized by -∫ R'(s+u)u^k/k! du.
There is a locally L1 boundary value and convergence in L1 on every compact interval. -/
theorem regularizedBoundaryL1 {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) :
    let R := fun s : ℂ => F s - (A : ℂ) / (s - a) ^ (k + 1)
    let H := fun s : ℂ => -∫ u : ℝ in (0 : ℝ)..1,
      deriv R (s + u) * ((u ^ k / (k.factorial : ℝ) : ℝ) : ℂ)
    ∃ b : ℝ → ℂ, ∀ L : ℝ, 0 < L →
      IntegrableOn b (Icc (-L) L) ∧
      Tendsto (fun ε : ℝ => ∫ y : ℝ in Icc (-L) L,
        ‖H ((a : ℂ) + ε + y * Complex.I) - b y‖) (𝓝[>] 0) (𝓝 0) := by sorry

theorem delangeSmoothedLimit {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t => (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) {ell : ℝ} (hell : 0 < ell) :
    (∀ T : ℝ, IntegrableOn (fun t : ℝ =>
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
    Tendsto (fun T : ℝ => ∫ t : ℝ in Ici 0,
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by sorry

/-! Layer HP.3: monotonicity removes smoothing. -/

theorem monotoneUnsmoothing {α : ℝ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hC : 0 ≤ C)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hsmooth : ∀ ell : ℝ, 0 < ell →
      (∀ T : ℝ, IntegrableOn (fun t : ℝ =>
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
      Tendsto (fun T : ℝ => ∫ t : ℝ in Ici 0,
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
        atTop (𝓝 C)) :
    Tendsto (fun t : ℝ => α t / (Real.exp (a * t) * t ^ k)) atTop (𝓝 C) := by sorry

theorem delangeLaplace {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hA : 0 < A)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t => (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun t : ℝ => α t / (Real.exp (a * t) * t ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by sorry

/-! Layer HP.4: the inclusive Dirichlet-series bridge and perturbations. -/

theorem logSummatory_hasLaplace {c : ℕ → ℝ} {F : ℂ → ℂ} {s : ℂ}
    (hc : ∀ n, 0 ≤ c n) (hs : 0 < s.re)
    (hF : LSeriesHasSum (fun n => (c n : ℂ)) s (F s)) :
    let α := fun t => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else c n) (Real.exp t)
    HasLaplace (fun t => (α t : ℂ)) s (F s / s) ∧
      (∀ t ∈ Ici (0 : ℝ), 0 ≤ α t) ∧ MonotoneOn α (Ici 0) ∧ α 0 = c 1 := by sorry

-- Test: logSummatory_test_initial
example (c : ℕ → ℝ) :
    TauCeti.summatory (fun n : ℕ => n) (fun n => if n = 0 then 0 else c n)
      (Real.exp 0) = c 1 := by sorry
-- Test: logSummatory_test_unit_mass
example {s : ℂ} (hs : 0 < s.re) :
    HasLaplace (fun t => (TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 1 then (1 : ℝ) else 0) (Real.exp t) : ℂ)) s (1 / s) := by sorry
-- Test: logSummatory_test_endpoint
example (c : ℕ → ℝ) :
    TauCeti.summatory (fun n : ℕ => n) (fun n => if n = 0 then 0 else c n)
      (Real.exp (Real.log 2)) = c 1 + c 2 := by sorry

theorem delangeDirichlet {c : ℕ → ℝ} {F : ℂ → ℂ} {A : ℝ} {k : ℕ}
    (hc : ∀ n, 0 ≤ c n) (hA : 0 < A)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n => (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F 1 k A) :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else c n) X / (X * Real.log X ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by sorry

theorem delangeDirichlet_positiveAbscissa {c : ℕ → ℝ} {F : ℂ → ℂ}
    {a A : ℝ} {k : ℕ} (hc : ∀ n, 0 ≤ c n) (ha : 0 < a) (hA : 0 < A)
    (hF : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n => (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 (A / (a * (k.factorial : ℝ)))) := by sorry

theorem finiteChange_asymptotic {c d : ℕ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hcd : ∀ᶠ n in cofinite, c n = d n)
    (hc : Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by sorry

/-- A signed perturbation is bounded by a nonnegative sequence with a strictly lower pole.
Both convergence and boundary continuation are required for the majorant. -/
theorem lowerPole_perturbation {c d b : ℕ → ℝ} {G : ℂ → ℂ} {a B C : ℝ} {k l : ℕ}
    (ha : 0 < a) (hB : 0 < B) (hlk : l < k) (hb : ∀ n, 0 ≤ b n)
    (hbound : ∀ n, |d n - c n| ≤ b n)
    (hG : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n => (b n : ℂ)) s (G s))
    (hboundary : PoleBoundary G a l B)
    (hc : Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by sorry

/-! Layer HP.5: applications and rejection tests. -/

theorem zetaSquare_counting :
    (∀ s : ℂ, 1 < s.re → LSeriesHasSum
      (fun n => (n.divisors.card : ℂ)) s (riemannZeta s ^ 2)) ∧
    PoleBoundary (fun s => riemannZeta s ^ 2) 1 1 1 ∧
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => (n.divisors.card : ℝ)) X / (X * Real.log X)) atTop (𝓝 1) := by sorry

-- Test: counting_test_ones
example :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => if n = 0 then (0 : ℝ) else 1) X / X) atTop (𝓝 1) := by sorry
-- Test: counting_test_divisors_four
example : (4 : ℕ).divisors.card = 3 := by sorry
-- Test: counting_test_insert_one
example :
    Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
      (fun n => (n.divisors.card : ℝ) + if n = 1 then 7 else 0) X /
        (X * Real.log X)) atTop (𝓝 1) := by sorry

-- Test: counting_test_abscissa_two
example : Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n)
    (fun n => (n : ℝ)) X / X ^ (2 : ℝ)) atTop (𝓝 (1 / 2)) := by sorry

/-- The dyadic series has a simple pole at 1 but additional poles on Re(s)=1.
The local principal part does not imply the proposed counting limit. -/
theorem dyadicLocalPoleCounterexample :
    let c : ℕ → ℝ := fun n => if ∃ j : ℕ, n = 2 ^ j then (n : ℝ) else 0
    let F := fun s : ℂ => 1 / (1 - Complex.exp ((1 - s) * Real.log 2))
    (∀ n, 0 ≤ c n) ∧
    (∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n => (c n : ℂ)) s (F s)) ∧
    (∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ,
      AnalyticOnNhd ℂ g (Metric.ball 1 r) ∧ g 1 = (1 / (Real.log 2 : ℂ)) ∧
      ∀ s ∈ Metric.ball (1 : ℂ) r, 1 < s.re → F s = g s / (s - 1)) ∧
    ¬ PoleBoundary F 1 0 (1 / Real.log 2) ∧
    Tendsto (fun j : ℕ => TauCeti.summatory (fun n : ℕ => n) c ((2 : ℝ) ^ j) /
      (2 : ℝ) ^ j) atTop (𝓝 2) ∧
    Tendsto (fun j : ℕ => TauCeti.summatory (fun n : ℕ => n) c (3 * (2 : ℝ) ^ j) /
      (3 * (2 : ℝ) ^ j)) atTop (𝓝 (4 / 3)) ∧
    ¬ Tendsto (fun X : ℝ => TauCeti.summatory (fun n : ℕ => n) c X / X)
      atTop (𝓝 (1 / Real.log 2)) := by sorry

end HigherPoleTauberian
end TauCeti
