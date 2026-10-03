import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.Analytic.IsolatedZeros
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Analysis.Complex.RealDeriv
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Tactic

/-!
# Dirichlet L0: normalized Mellin continuation and smoothing
Suggested declarations only, at Mathlib 082e2d3 / Tau Ceti f790474.
All 57 inherited node contracts and their 34 tests remain represented.
The two L1 arithmetic suppliers and PMIA's Mahler operator are expressed by
local notation for their exact native formulas at the final interface below.
Those notations export no definition and make no second ownership claim.
The file imports no later Dirichlet layer and can be checked independently.
-/
noncomputable section
/-!
Gamma-normalized continuation from a smooth nonnegative half-line.
All derivatives and growth conditions use the native Mathlib notions.
This extends RJW Theorem 2.4 to complex-valued inputs by the same linear argument.
-/
namespace DirichletPadic
open Filter Set MeasureTheory Asymptotics
open scoped Topology
variable {f : ℝ → ℂ}

-- DirichletPadicLFunctions:L0/mellin-infinity-boundary
theorem mellin_boundary_atTop {a : ℝ} (ha : 0 < a)
    (hd : f =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (s : ℂ) :
    Tendsto (fun t : ℝ => f t * (t : ℂ)^s) atTop (𝓝 0) := sorry

-- DirichletPadicLFunctions:L0/mellin-zero-boundary
theorem mellin_boundary_zero (hf : ContinuousWithinAt f (Ici 0) 0) {s : ℂ} (hs : 0 < s.re) :
    Tendsto (fun t : ℝ => f t * (t : ℂ)^s) (𝓝[>] 0) (𝓝 0) := sorry

-- DirichletPadicLFunctions:L0/mellin-derivative-shift
theorem mellin_derivative_shift {g : ℝ → ℂ} {s : ℂ} (hs : 0 < s.re)
    (hf : ContinuousWithinAt f (Ici 0) 0)
    (hg : ∀ x : ℝ, 0 < x → HasDerivAt f (g x) x)
    (hfm : MellinConvergent f s) (hgm : MellinConvergent g (s+1))
    (hinfty : Tendsto (fun t : ℝ => f t * (t : ℂ)^s) atTop (𝓝 0)) :
    mellin g (s+1) = -s * mellin f s := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-derivative-shift
theorem normalizedMellin_derivative_shift (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (n : ℕ) {s : ℂ} (hs : 0 < s.re) :
    mellin (iteratedDerivWithin n f (Ici 0)) s / Complex.Gamma s =
      -(mellin (iteratedDerivWithin (n+1) f (Ici 0)) (s+1) / Complex.Gamma (s+1)) := sorry

-- DirichletPadicLFunctions:L0/mellin-derivative-at-one
theorem mellin_derivative_at_one (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) :
    mellin (iteratedDerivWithin (n+1) f (Ici 0)) 1 = -iteratedDerivWithin n f (Ici 0) 0 := sorry

-- DirichletPadicLFunctions:L0/mellin-shift-coherence
theorem normalizedMellin_shift_coherence (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (n m : ℕ) {s : ℂ} (hn : 0 < (s+n).re) (hm : 0 < (s+m).re) :
    (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) / Complex.Gamma (s+n)) =
      (-1 : ℂ)^m * (mellin (iteratedDerivWithin m f (Ici 0)) (s+m) / Complex.Gamma (s+m)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-continuation
def normalizedMellinContinuation (f : ℝ → ℂ) (s : ℂ) :
    ℂ := sorry

theorem normalizedMellinContinuation_def (f : ℝ → ℂ) (s : ℂ) :
    normalizedMellinContinuation f s =
      let n := Nat.ceil |s.re| + 1
      (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) /
        Complex.Gamma (s+n)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift
theorem normalizedMellinContinuation_eq_shift (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) {s : ℂ} (hs : 0 < (s+n).re) :
    normalizedMellinContinuation f s = (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) / Complex.Gamma (s+n)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane
theorem normalizedMellinContinuation_eq_mellin (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) {s : ℂ} (hs : 0 < s.re) :
    normalizedMellinContinuation f s = mellin f s / Complex.Gamma s := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-entire
theorem normalizedMellinContinuation_entire (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) :
    Differentiable ℂ (normalizedMellinContinuation f) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-negative-values
theorem normalizedMellinContinuation_neg_nat (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) :
    normalizedMellinContinuation f (-(n : ℂ)) = (-1 : ℂ)^n * iteratedDerivWithin n f (Ici 0) 0 := sorry

theorem normalizedMellinContinuation_unique (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (F : ℂ → ℂ) (hF : Differentiable ℂ F)
    (hinit : ∀ s : ℂ, 0 < s.re → F s = mellin f s / Complex.Gamma s) :
    F = normalizedMellinContinuation f := sorry

theorem normalizedMellinContinuation_congr {f g : ℝ → ℂ}
    (heq : EqOn f g (Ici 0)) :
    normalizedMellinContinuation f = normalizedMellinContinuation g := sorry

theorem normalizedMellinContinuation_zero :
    normalizedMellinContinuation (fun _ : ℝ => (0 : ℂ)) = fun _ => 0 := sorry

theorem normalizedMellinContinuation_add (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) {g : ℝ → ℂ}
    (hg : ContDiffOn ℝ (⊤ : ℕ∞) g (Ici 0))
    (he : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n g (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) :
    normalizedMellinContinuation (fun t => f t + g t) =
      fun s => normalizedMellinContinuation f s + normalizedMellinContinuation g s := sorry

theorem normalizedMellinContinuation_smul (f : ℝ → ℂ) (c : ℂ) :
    normalizedMellinContinuation (fun t => c * f t) =
      fun s => c * normalizedMellinContinuation f s := sorry

end DirichletPadic

namespace SuggestedMellinContinuationTests
open DirichletPadic Filter Asymptotics
open scoped Topology

-- SuggestedMellinContinuationTests.zero_input
example (s : ℂ) : normalizedMellinContinuation (fun _ : ℝ => (0 : ℂ)) s = 0 := sorry

-- SuggestedMellinContinuationTests.exponential_normalization
example (s : ℂ) : normalizedMellinContinuation (fun t : ℝ => Complex.exp (-t)) s = 1 := sorry

-- SuggestedMellinContinuationTests.linear_exponential
example (s : ℂ) : normalizedMellinContinuation
    (fun t : ℝ => (t : ℂ) * Complex.exp (-t)) s = s := sorry

-- SuggestedMellinContinuationTests.scaled_exponential
example : normalizedMellinContinuation
    (fun t : ℝ => Complex.exp (-2*t)) (-3) = 8 := sorry

-- SuggestedMellinContinuationTests.naive_quotient_at_zero
example : normalizedMellinContinuation (fun t : ℝ => Complex.exp (-t)) 0 = 1 ∧
    mellin (fun t : ℝ => Complex.exp (-t)) 0 / Complex.Gamma 0 = 0 := sorry

-- SuggestedMellinContinuationTests.nondecaying_constant
example : ¬ ∃ a : ℝ, 0 < a ∧
    (fun _ : ℝ => (1 : ℂ)) =O[atTop] (fun t : ℝ => Real.exp (-a*t)) := sorry
end SuggestedMellinContinuationTests

/-! ## Bernoulli kernel: differentiated geometric expansion and decay
The sums below use only positive indices. Nothing in this block asserts
smoothness of the removable extension at zero or a Mellin integral comparison.
-/
namespace DirichletPadic
noncomputable section
open Filter Asymptotics Set
open scoped Topology
local notation "F" => (fun (m : ℕ) (t : ℝ) =>
  ∑' n : ℕ, ((n+1 : ℕ) : ℝ)^m * Real.exp (-t*(n+1)))
local notation "b" => (fun t : ℝ => t / (Real.exp t - 1))

theorem weightedExp_halfline_bound (m : ℕ) {δ t : ℝ} (hδ : 0 < δ) (ht : δ ≤ t) :
    0 ≤ F m t ∧ F m t ≤ Real.exp (δ-t) * F m δ := by sorry

theorem weightedExp_hasDerivAt (m : ℕ) {t : ℝ} (ht : 0 < t) :
    HasDerivAt (fun x : ℝ => F m x) (-(F (m+1) t)) t := by sorry

theorem reciprocalExp_geometric {t : ℝ} (ht : 0 < t) :
    F 0 t = 1 / (Real.exp t - 1) ∧ b t = t * F 0 t := by sorry

theorem reciprocalExp_iteratedDeriv (m : ℕ) {t : ℝ} (ht : 0 < t) :
    iteratedDeriv m (fun x : ℝ => 1 / (Real.exp x - 1)) t =
      (-1 : ℝ)^m * F m t := by sorry

theorem bernoulliKernel_iteratedDeriv_succ (m : ℕ) {t : ℝ} (ht : 0 < t) :
    iteratedDeriv (m+1) b t = (-1 : ℝ)^m * ((m+1)*F m t - t*F (m+1) t) := by sorry

theorem bernoulliKernel_iteratedDeriv_decay (m : ℕ) :
    iteratedDeriv m b =O[atTop] (fun t : ℝ => Real.exp (-t/2)) := by sorry

theorem bernoulliKernel_iteratedDerivWithin_decay (g : ℝ → ℂ)
    (hg : ∀ t : ℝ, 0 < t → g t = (b t : ℂ)) (m : ℕ) :
    iteratedDerivWithin m g (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-t/2)) := by sorry

-- SuggestedBernoulliDecayTests.geometric_log_two
example : F 0 (Real.log 2) = 1 := by sorry
-- SuggestedBernoulliDecayTests.unextended_zero
example : b 0 = 0 := by sorry
-- SuggestedBernoulliDecayTests.first_derivative_log_two
example : deriv b (Real.log 2) = 1 - 2 * Real.log 2 := by sorry
-- SuggestedBernoulliDecayTests.rate_one_fails
example : ¬ b =O[atTop] (fun t : ℝ => Real.exp (-t)) := by sorry
end
end DirichletPadic

/-! ## The Bernoulli kernel at the origin and its Mellin continuation -/
namespace DirichletPadic
noncomputable section
open Filter Asymptotics Set
open scoped Topology

def smoothBernoulliKernel (t : ℝ) : ℝ := by sorry

theorem smoothBernoulliKernel_def (t : ℝ) :
    smoothBernoulliKernel t = (dslope Real.exp 0 t)⁻¹ := by sorry

theorem smoothBernoulliKernel_zero : smoothBernoulliKernel 0 = 1 := by sorry

theorem smoothBernoulliKernel_of_ne {t : ℝ} (ht : t ≠ 0) :
    smoothBernoulliKernel t = t / (Real.exp t - 1) := by sorry

theorem smoothBernoulliKernel_analyticAt (t : ℝ) :
    AnalyticAt ℝ smoothBernoulliKernel t := by sorry

theorem smoothBernoulliKernel_contDiff :
    ContDiff ℝ (⊤ : ℕ∞) smoothBernoulliKernel := by sorry

theorem smoothBernoulliKernel_mul_exp_sub_one (t : ℝ) :
    smoothBernoulliKernel t * (Real.exp t - 1) = t := by sorry

theorem smoothBernoulliKernel_derivative_recurrence (n : ℕ) :
    (∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) *
      iteratedDeriv k smoothBernoulliKernel 0) = if n = 0 then 1 else 0 := by sorry

theorem smoothBernoulliKernel_iteratedDeriv_zero (n : ℕ) :
    iteratedDeriv n smoothBernoulliKernel 0 = (bernoulli n : ℝ) := by sorry

theorem smoothBernoulliKernel_complex_contDiff :
    ContDiff ℝ (⊤ : ℕ∞) (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) := by sorry

theorem smoothBernoulliKernel_iteratedDerivWithin_zero (n : ℕ) :
    iteratedDerivWithin n (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (Ici 0) 0 =
      (bernoulli n : ℂ) := by sorry

theorem smoothBernoulliKernel_mellin_entire :
    Differentiable ℂ
      (normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ))) := by sorry

theorem smoothBernoulliKernel_mellin_neg_nat (n : ℕ) :
    normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (-(n : ℂ)) =
      (-1 : ℂ)^n * (bernoulli n : ℂ) := by sorry

-- SuggestedBernoulliOriginTests.extended_zero
example : smoothBernoulliKernel 0 = 1 := by sorry
-- SuggestedBernoulliOriginTests.log_two
example : smoothBernoulliKernel (Real.log 2) = Real.log 2 := by sorry
-- SuggestedBernoulliOriginTests.literal_quotient_mismatch
example : smoothBernoulliKernel 0 ≠ (0 : ℝ) / (Real.exp 0 - 1) := by sorry
-- SuggestedBernoulliOriginTests.first_derivative
example : deriv smoothBernoulliKernel 0 = -1/2 := by sorry
-- SuggestedBernoulliOriginTests.second_derivative
example : iteratedDeriv 2 smoothBernoulliKernel 0 = 1/6 := by sorry
-- SuggestedBernoulliOriginTests.mellin_minus_one
example : normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (-1) =
    1/2 := by sorry
end
end DirichletPadic

/-! ## The Bernoulli Mellin–zeta comparison
The general sum/integral mechanism is native `hasSum_mellin`. The declarations
below concern the existing actual kernel and its normalized continuation.
The raw totalized product at zero is not the removable value.
-/
namespace DirichletPadic
noncomputable section
open Set
local notation "gβ" => (fun t : ℝ => (smoothBernoulliKernel t : ℂ))
local notation "Lβ" => normalizedMellinContinuation gβ

theorem smoothBernoulliKernel_mellin_convergent {s : ℂ} (hs : 0 < s.re) :
    MellinConvergent gβ s := by sorry

theorem smoothBernoulliKernel_mellin_hasSum {s : ℂ} (hs : 0 < s.re) :
    HasSum (fun n : ℕ => Complex.Gamma (s+1) / ((n:ℂ)+1)^(s+1))
      (mellin gβ s) := by sorry

theorem smoothBernoulliKernel_mellin_eq_gamma_zeta {s : ℂ} (hs : 0 < s.re) :
    mellin gβ s = Complex.Gamma (s+1) * riemannZeta (s+1) := by sorry

theorem smoothBernoulliKernel_normalizedMellin_eq_of_re_pos {s : ℂ} (hs : 0 < s.re) :
    Lβ s = s * riemannZeta (s+1) := by sorry

theorem smoothBernoulliKernel_normalizedMellin_eq_zeta {s : ℂ} (hs : s ≠ 0) :
    Lβ s = s * riemannZeta (s+1) := by sorry

-- SuggestedBernoulliMellinTests.integral_at_one
example : mellin gβ 1 = riemannZeta 2 := by sorry
-- SuggestedBernoulliMellinTests.factor_at_two
example : Lβ 2 = 2 * riemannZeta 3 := by sorry
-- SuggestedBernoulliMellinTests.continued_origin
example : Lβ 0 = 1 := by sorry
-- SuggestedBernoulliMellinTests.raw_pole_mismatch
example : Lβ 0 ≠ (0:ℂ) * riemannZeta 1 := by sorry
end
end DirichletPadic

/-! ## The actual smoothed Mellin kernel
Use a native divided difference of the existing Bernoulli kernel difference.
Positivity of the smoothing parameter is required for decay and continuation.
The smoothed zeta-factor and analytic/formal substitution comparisons remain
separate interfaces; all declarations here remain proposed signatures.
-/
namespace DirichletPadic
noncomputable section
open Set Filter Asymptotics
open scoped Topology

def smoothedMellinKernel (a t : ℝ) : ℝ := by sorry

theorem smoothedMellinKernel_def (a t : ℝ) :
    smoothedMellinKernel a t =
      dslope (fun x => smoothBernoulliKernel x - smoothBernoulliKernel (a*x)) 0 t := by sorry

theorem smoothedMellinKernel_zero (a : ℝ) : smoothedMellinKernel a 0 = (a-1)/2 := by sorry

theorem smoothedMellinKernel_one (t : ℝ) : smoothedMellinKernel 1 t = 0 := by sorry

theorem smoothedMellinKernel_of_ne {a t : ℝ} (ha : a ≠ 0) (ht : t ≠ 0) :
    smoothedMellinKernel a t = 1/(Real.exp t-1) - a/(Real.exp (a*t)-1) := by sorry

theorem smoothedMellinKernel_analyticAt (a t : ℝ) :
    AnalyticAt ℝ (smoothedMellinKernel a) t := by sorry

theorem smoothedMellinKernel_contDiff (a : ℝ) :
    ContDiff ℝ (⊤ : ℕ∞) (smoothedMellinKernel a) := by sorry

theorem smoothedMellinKernel_mul (a t : ℝ) :
    smoothedMellinKernel a t * t = smoothBernoulliKernel t - smoothBernoulliKernel (a*t) := by sorry

theorem smoothedMellinKernel_iteratedDeriv_zero (a : ℝ) (n : ℕ) :
    iteratedDeriv n (smoothedMellinKernel a) 0 =
      (1-a^(n+1)) * (bernoulli (n+1) : ℝ) / (n+1) := by sorry

local notation "F" => (fun (m : ℕ) (t : ℝ) =>
  ∑' n : ℕ, ((n+1 : ℕ) : ℝ)^m * Real.exp (-t*(n+1)))

theorem smoothedMellinKernel_iteratedDeriv_pos {a : ℝ} (ha : 0 < a) (m : ℕ)
    {t : ℝ} (ht : 0 < t) :
    iteratedDeriv m (smoothedMellinKernel a) t =
      (-1:ℝ)^m * (F m t - a^(m+1) * F m (a*t)) := by sorry

theorem smoothedMellinKernel_iteratedDeriv_decay {a : ℝ} (ha : 0 < a) (m : ℕ) :
    iteratedDeriv m (smoothedMellinKernel a) =O[atTop]
      (fun t : ℝ => Real.exp (-(min 1 a)*t)) := by sorry

local notation "gₛ" => (fun (a t : ℝ) => (smoothedMellinKernel a t : ℂ))

theorem smoothedMellinKernel_complex_contDiff (a : ℝ) :
    ContDiff ℝ (⊤ : ℕ∞) (gₛ a) := by sorry

theorem smoothedMellinKernel_iteratedDerivWithin_zero (a : ℝ) (n : ℕ) :
    iteratedDerivWithin n (gₛ a) (Ici 0) 0 =
      (1-(a:ℂ)^(n+1)) * (bernoulli (n+1) : ℂ) / (n+1) := by sorry

theorem smoothedMellinKernel_iteratedDerivWithin_decay {a : ℝ} (ha : 0 < a) (m : ℕ) :
    iteratedDerivWithin m (gₛ a) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-(min 1 a)*t)) := by sorry

theorem smoothedMellinKernel_mellin_entire {a : ℝ} (ha : 0 < a) :
    Differentiable ℂ (normalizedMellinContinuation (gₛ a)) := by sorry

theorem smoothedMellinKernel_mellin_neg_nat {a : ℝ} (ha : 0 < a) (n : ℕ) :
    normalizedMellinContinuation (gₛ a) (-(n:ℂ)) =
      (-1:ℂ)^n * (1-(a:ℂ)^(n+1)) * (bernoulli (n+1) : ℂ) / (n+1) := by sorry

-- SuggestedSmoothedKernelTests.two_at_zero
example : smoothedMellinKernel 2 0 = 1/2 := by sorry
-- SuggestedSmoothedKernelTests.one_kernel
example : smoothedMellinKernel 1 = fun _ => 0 := by sorry
-- SuggestedSmoothedKernelTests.two_at_log_two
example : smoothedMellinKernel 2 (Real.log 2) = 1/3 := by sorry
-- SuggestedSmoothedKernelTests.two_first_derivative
example : deriv (smoothedMellinKernel 2) 0 = -1/4 := by sorry
-- SuggestedSmoothedKernelTests.negative_parameter
example : smoothedMellinKernel (-1) = fun _ => -1 := by sorry
-- SuggestedSmoothedKernelTests.two_mellin_minus_one
example : normalizedMellinContinuation (gₛ 2) (-1) = 1/4 := by sorry
end
end DirichletPadic

/-! ## Smoothed zeta comparison and the removable value at one
Reuse native Mellin shift/dilation and the preceding actual Bernoulli integral.
The zeta product is compared on s ≠ 1; continuity supplies the value at one.
-/
namespace DirichletPadic
noncomputable section
open Set Filter
open scoped Topology
local notation "gₛ" => (fun (a t : ℝ) => (smoothedMellinKernel a t : ℂ))

theorem smoothedMellinKernel_mellin_convergent {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 0 < s.re) : MellinConvergent (gₛ a) s := by sorry

theorem smoothedMellinKernel_mellin_eq_gamma_zeta {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 1 < s.re) :
    mellin (gₛ a) s = Complex.Gamma s * (1-(a:ℂ)^(1-s)) * riemannZeta s := by sorry

theorem smoothedMellinKernel_normalized_halfplane {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 1 < s.re) :
    normalizedMellinContinuation (gₛ a) s = (1-(a:ℂ)^(1-s))*riemannZeta s := by sorry

theorem smoothedMellinKernel_normalized_eq_zeta {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : s ≠ 1) :
    normalizedMellinContinuation (gₛ a) s = (1-(a:ℂ)^(1-s))*riemannZeta s := by sorry

theorem smoothedZeta_tendsto_one {a : ℝ} (ha : 0 < a) :
    Tendsto (fun s : ℂ => (1-(a:ℂ)^(1-s))*riemannZeta s)
      (𝓝[≠] 1) (𝓝 (Real.log a : ℂ)) := by sorry

theorem smoothedMellinKernel_mellin_one {a : ℝ} (ha : 0 < a) :
    normalizedMellinContinuation (gₛ a) 1 = (Real.log a : ℂ) := by sorry

-- SuggestedSmoothedZetaTests.two_at_two
example : normalizedMellinContinuation (gₛ 2) 2 = riemannZeta 2 / 2 := by sorry
-- SuggestedSmoothedZetaTests.two_at_one
example : normalizedMellinContinuation (gₛ 2) 1 = (Real.log 2 : ℂ) := by sorry
-- SuggestedSmoothedZetaTests.one_at_one
example : normalizedMellinContinuation (gₛ 1) 1 = 0 := by sorry
-- SuggestedSmoothedZetaTests.integral_at_one
example {a : ℝ} (ha : 0 < a) : mellin (gₛ a) 1 = (Real.log a : ℂ) := by sorry
-- SuggestedSmoothedZetaTests.raw_pole_mismatch
example : normalizedMellinContinuation (gₛ 2) 1 ≠
    (1-(2:ℂ)^((1:ℂ)-1))*riemannZeta 1 := by sorry
end
end DirichletPadic


namespace DirichletPadic
-- DirichletPadicLFunctions:L0/smoothed-value-complex
 theorem smoothedValue_complex (a k : ℕ) :
    algebraMap ℚ ℂ ((1-(a:ℚ)^(k+1))*bernoulli (k+1)/(k+1)) =
      (-1:ℂ)^k * (1-(a:ℂ)^(k+1))*riemannZeta (-(k:ℂ)) := by sorry
-- SuggestedTests.complex_zero_sign
example : (1-(2:ℂ))*riemannZeta 0 = 1/2 := by sorry

/-! Imported formulas, not additional L0 carriers:
L1/series-coefficient-recurrence supplies smoothedSeries, with denominator
q_a = mk (n ↦ choose(a,n+1)); L1/smoothed-series-euler-values supplies its
iterated Mahler constant. PMIA:L2/mahler-derivation owns (1+X)•derivative.
These local notations are the exact definitions in the supplier sketches.
-/
open PowerSeries
local notation "FQ" => (fun (a : ℕ) (ha : IsUnit (a : ℚ)) =>
  (PowerSeries.mk fun n => (Nat.choose a (n+2) : ℚ)) *
    PowerSeries.invOfUnit (PowerSeries.mk fun n => (Nat.choose a (n+1) : ℚ))
      (IsUnit.unit ha))
local notation "dQ" => ((1 + X : ℚ⟦X⟧) • PowerSeries.derivative ℚ)
theorem smoothedMellinKernel_iteratedDeriv_eq_formal (a k : ℕ) (hu : IsUnit (a : ℚ)) :
    iteratedDeriv k (smoothedMellinKernel (a:ℝ)) 0 =
      algebraMap ℚ ℝ (constantCoeff
        ((dQ)^[k] (FQ a hu))) := by sorry

theorem smoothedMellinKernel_mellin_neg_nat_eq_formal (a k : ℕ) (ha : 0 < a)
    (hu : IsUnit (a : ℚ)) :
    normalizedMellinContinuation (fun t : ℝ => (smoothedMellinKernel (a:ℝ) t : ℂ)) (-(k:ℂ)) =
      (-1:ℂ)^k * algebraMap ℚ ℂ (constantCoeff
        ((dQ)^[k] (FQ a hu))) := by sorry

-- SuggestedSmoothedJetTests.ordinary_derivative_control
example (hu : IsUnit (2:ℚ)) :
    iteratedDeriv 2 (smoothedMellinKernel 2) 0 = 0 ∧
      constantCoeff ((PowerSeries.derivative ℚ)^[2] (FQ 2 hu)) = 1/4 := by sorry
-- SuggestedSmoothedJetTests.mellin_odd_sign
example : normalizedMellinContinuation (fun t : ℝ => (smoothedMellinKernel 2 t : ℂ)) (-3) = -1/8 := by sorry

end DirichletPadic

/-! Composition of the existing smoothing kernels.
The real statements allow zero and negative parameters. The analytic statements
require positive parameters, with the continued value at one retained.
-/
namespace DirichletPadic
-- DirichletPadicLFunctions:L0/smoothed-kernel-cocycle
theorem smoothedMellinKernel_cocycle (a b t : ℝ) :
    smoothedMellinKernel (a*b) t = smoothedMellinKernel a t +
      a*smoothedMellinKernel b (a*t) := by sorry
-- DirichletPadicLFunctions:L0/smoothed-kernel-commute
theorem smoothedMellinKernel_commute (a b t : ℝ) :
    smoothedMellinKernel a t + a*smoothedMellinKernel b (a*t) =
      smoothedMellinKernel b t + b*smoothedMellinKernel a (b*t) := by sorry
-- DirichletPadicLFunctions:L0/smoothed-origin-derivative-cocycle
theorem smoothedMellinKernel_iteratedDeriv_cocycle (a b : ℝ) (n : ℕ) :
    iteratedDeriv n (smoothedMellinKernel (a*b)) 0 =
      iteratedDeriv n (smoothedMellinKernel a) 0 +
        a^(n+1)*iteratedDeriv n (smoothedMellinKernel b) 0 := by sorry
-- DirichletPadicLFunctions:L0/smoothed-mellin-cocycle
theorem smoothedMellinKernel_mellin_cocycle {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    {s : ℂ} (hs : 0 < s.re) :
    mellin (fun t => (smoothedMellinKernel (a*b) t : ℂ)) s =
      mellin (fun t => (smoothedMellinKernel a t : ℂ)) s +
        (a:ℂ)^(1-s)*mellin (fun t => (smoothedMellinKernel b t : ℂ)) s := by sorry
-- DirichletPadicLFunctions:L0/smoothed-normalized-cocycle
theorem smoothedMellinKernel_normalized_cocycle {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (s : ℂ) :
    normalizedMellinContinuation (fun t => (smoothedMellinKernel (a*b) t : ℂ)) s =
      normalizedMellinContinuation (fun t => (smoothedMellinKernel a t : ℂ)) s +
        (a:ℂ)^(1-s)*normalizedMellinContinuation
          (fun t => (smoothedMellinKernel b t : ℂ)) s := by sorry

-- SuggestedSmoothingCocycleTests.origin
example : smoothedMellinKernel 6 0 = smoothedMellinKernel 2 0 +
    2*smoothedMellinKernel 3 0 ∧ smoothedMellinKernel 6 0 = 5/2 := by sorry
-- SuggestedSmoothingCocycleTests.negative_parameter
example (t : ℝ) : smoothedMellinKernel (-6) t = smoothedMellinKernel (-2) t +
    (-2)*smoothedMellinKernel 3 (-2*t) := by sorry
-- SuggestedSmoothingCocycleTests.zero_parameter
example (a t : ℝ) : smoothedMellinKernel 0 t = smoothedMellinKernel a t +
    a*smoothedMellinKernel 0 (a*t) := by sorry
-- SuggestedSmoothingCocycleTests.missing_weight
example : smoothedMellinKernel 6 0 ≠ smoothedMellinKernel 2 0 +
    smoothedMellinKernel 3 0 := by sorry
-- SuggestedSmoothingCocycleTests.third_derivative
example : iteratedDeriv 3 (smoothedMellinKernel 6) 0 = 259/24 ∧
    iteratedDeriv 3 (smoothedMellinKernel 6) 0 =
      iteratedDeriv 3 (smoothedMellinKernel 2) 0 +
        16*iteratedDeriv 3 (smoothedMellinKernel 3) 0 := by sorry
-- SuggestedSmoothingCocycleTests.pole_value
example : normalizedMellinContinuation (fun t => (smoothedMellinKernel 6 t : ℂ)) 1 =
    (Real.log 2 : ℂ) + (Real.log 3 : ℂ) := by sorry
-- SuggestedSmoothingCocycleTests.negative_value
example : normalizedMellinContinuation (fun t => (smoothedMellinKernel 6 t : ℂ)) (-3) =
    (-259/24 : ℂ) := by sorry
-- SuggestedSmoothingCocycleTests.origin_not_punctured
example : normalizedMellinContinuation (fun t => (smoothedMellinKernel 6 t : ℂ)) 1 ≠
    (1-(6:ℂ)^((1:ℂ)-1))*riemannZeta 1 := by sorry
end DirichletPadic
