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

/- BEGIN L0 COMPOSITION EVIDENCE
Inert reproducibility archive; removed in the following commit.
@@BEGIN Native.lean 6adfee03e050d5e5134cece079228e29e17e70450feb68548d9e5ced00f3b649
import Mathlib.Analysis.MellinTransform
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Tactic
import Mathlib.Analysis.Analytic.IsolatedZeros
import Mathlib.Analysis.Analytic.Constructions
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.NumberTheory.Bernoulli
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Complex.RealDeriv
import Mathlib.Analysis.Calculus.TangentCone.Real
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Push
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
noncomputable section
open Filter Set
open scoped Topology
namespace OriginProbe

def beta (t : ℝ) : ℝ := (dslope Real.exp 0 t)⁻¹

lemma beta_zero : beta 0 = 1 := by simp [beta, Real.deriv_exp]

lemma beta_ne_zero {t : ℝ} (ht : t ≠ 0) : beta t = t / (Real.exp t - 1) := by
  simp [beta, dslope_of_ne _ ht, slope, div_eq_mul_inv, mul_comm]

lemma dslope_exp_ne_zero (t : ℝ) : dslope Real.exp 0 t ≠ 0 := by
  by_cases ht : t = 0
  · subst t; simp [Real.deriv_exp]
  · simp [dslope_of_ne _ ht, slope, ht, sub_ne_zero, Real.exp_eq_one_iff]

lemma dslope_exp_analytic (t : ℝ) : AnalyticAt ℝ (dslope Real.exp 0) t := by
  by_cases ht : t = 0
  · subst t
    obtain ⟨p, hp⟩ := (analyticAt_rexp : AnalyticAt ℝ Real.exp 0)
    exact hp.has_fpower_series_dslope_fslope.analyticAt
  · have h : AnalyticAt ℝ (fun x : ℝ => (Real.exp x - 1) / x) t :=
      (analyticAt_rexp.sub analyticAt_const).div analyticAt_id ht
    apply h.congr
    filter_upwards [eventually_ne_nhds ht] with x hx
    simp [dslope_of_ne _ hx, slope, div_eq_mul_inv, mul_comm]

lemma beta_analytic (t : ℝ) : AnalyticAt ℝ beta t :=
  (dslope_exp_analytic t).inv (dslope_exp_ne_zero t)

lemma beta_smooth : ContDiff ℝ (⊤ : ℕ∞) beta :=
  (show AnalyticOnNhd ℝ beta univ from fun t _ => beta_analytic t).contDiff

lemma beta_product (t : ℝ) : beta t * (Real.exp t - 1) = t := by
  by_cases ht : t = 0
  · simp [ht]
  · rw [beta_ne_zero ht]
    exact div_mul_cancel₀ _ (sub_ne_zero.mpr (by simpa using ht))

lemma beta_log_two : beta (Real.log 2) = Real.log 2 := by
  rw [beta_ne_zero (ne_of_gt (Real.log_pos (by norm_num))), Real.exp_log (by norm_num)]
  norm_num

lemma exp_sub_deriv (n : ℕ) :
    iteratedDeriv n (fun t : ℝ => Real.exp t - 1) 0 = if n = 0 then 0 else 1 := by
  rw [iteratedDeriv_fun_sub Real.contDiff_exp.contDiffAt contDiffAt_const]
  simp [iteratedDeriv_eq_iterate, Real.iter_deriv_exp, iteratedDeriv_const]
  split_ifs <;> norm_num

lemma beta_recurrence (n : ℕ) :
    (∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) * iteratedDeriv k beta 0) =
      if n = 0 then 1 else 0 := by
  have h := iteratedDeriv_fun_mul (x := (0 : ℝ)) (g := fun t : ℝ => Real.exp t - 1)
    (beta_smooth.of_le (by simp) : ContDiff ℝ (n+1) beta).contDiffAt
    (Real.contDiff_exp.sub contDiff_const).contDiffAt
  have prod : (fun t : ℝ => beta t * (Real.exp t - 1)) = fun t => t :=
    funext beta_product
  rw [prod, iteratedDeriv_fun_id_zero, Finset.sum_range_succ] at h
  simp only [exp_sub_deriv, Nat.sub_self] at h
  have hs : (∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) *
      iteratedDeriv k beta 0 * (if n+1-k=0 then 0 else 1)) =
      ∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) * iteratedDeriv k beta 0 := by
    apply Finset.sum_congr rfl
    intro k hk
    have hk' : n+1-k ≠ 0 := by have := Finset.mem_range.mp hk; omega
    simp [hk']
  rw [hs] at h
  simpa using h.symm

lemma beta_derivatives (n : ℕ) : iteratedDeriv n beta 0 = (bernoulli n : ℝ) := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    have hb : (∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) * (bernoulli k : ℝ)) =
        if n = 0 then 1 else 0 := by
      have h := congrArg (fun q : ℚ => (q : ℝ)) (sum_bernoulli (n+1))
      push_cast at h
      simpa only [apply_ite (fun q : ℚ => (q : ℝ)), Rat.cast_one, Rat.cast_zero] using h
    have hd := beta_recurrence n
    rw [Finset.sum_range_succ] at hb hd
    have hh : (∑ k ∈ Finset.range n, ((n+1).choose k : ℝ) * iteratedDeriv k beta 0) =
        ∑ k ∈ Finset.range n, ((n+1).choose k : ℝ) * (bernoulli k : ℝ) := by
      apply Finset.sum_congr rfl
      intro k hk
      rw [ih k (Finset.mem_range.mp hk)]
    rw [hh] at hd
    have he := add_left_cancel (hd.trans hb.symm)
    have hc : (((n+1).choose n : ℕ) : ℝ) ≠ 0 := by
      rw [Nat.choose_succ_self_right]
      exact_mod_cast (Nat.succ_ne_zero n)
    exact mul_left_cancel₀ hc he

lemma beta_first : deriv beta 0 = -1 / 2 := by
  simpa using beta_derivatives 1

lemma beta_second : iteratedDeriv 2 beta 0 = 1 / 6 := by
  simpa using beta_derivatives 2

lemma beta_complex_smooth : ContDiff ℝ (⊤ : ℕ∞) (fun t : ℝ => (beta t : ℂ)) :=
  beta_smooth.continuousLinearMap_comp Complex.ofRealCLM

lemma beta_complex_derivatives (n : ℕ) (t : ℝ) :
    iteratedDeriv n (fun t : ℝ => (beta t : ℂ)) t = ((iteratedDeriv n beta t : ℝ) : ℂ) := by
  have h := Complex.ofRealCLM.iteratedFDeriv_comp_left (x := t) beta_smooth.contDiffAt (i := n) (by simp)
  exact congrArg (fun f => f (fun _ => (1 : ℝ))) h

lemma beta_within (n : ℕ) :
    iteratedDerivWithin n (fun t : ℝ => (beta t : ℂ)) (Ici 0) 0 = (bernoulli n : ℂ) := by
  rw [iteratedDerivWithin_eq_iteratedDeriv (uniqueDiffOn_Ici 0)
    (beta_complex_smooth.of_le (by simp)).contDiffAt self_mem_Ici,
    beta_complex_derivatives, beta_derivatives]
  simp

lemma literal_mismatch : beta 0 ≠ (0 : ℝ) / (Real.exp 0 - 1) := by
  simp [beta_zero]

end OriginProbe

namespace SmoothedProbe
open OriginProbe

def h (a t : ℝ) : ℝ := dslope (fun x => beta x - beta (a*x)) 0 t

lemma difference_analytic (a t : ℝ) :
    AnalyticAt ℝ (fun x => beta x - beta (a*x)) t :=
  (beta_analytic t).sub ((beta_analytic (a*t)).comp (analyticAt_const.mul analyticAt_id))

lemma h_analytic (a t : ℝ) : AnalyticAt ℝ (h a) t := by
  by_cases ht : t = 0
  · subst t
    obtain ⟨p,hp⟩ := difference_analytic a 0
    exact hp.has_fpower_series_dslope_fslope.analyticAt
  · have hh : AnalyticAt ℝ (fun x : ℝ => (beta x - beta (a*x)) / x) t :=
      (difference_analytic a t).div analyticAt_id ht
    apply hh.congr
    filter_upwards [eventually_ne_nhds ht] with x hx
    simp [h, dslope_of_ne _ hx, slope, div_eq_mul_inv, mul_comm]

lemma h_smooth (a : ℝ) : ContDiff ℝ (⊤ : ℕ∞) (h a) :=
  (show AnalyticOnNhd ℝ (h a) univ from fun t _ => h_analytic a t).contDiff

lemma h_product (a t : ℝ) : h a t * t = beta t - beta (a*t) := by
  simpa [h, smul_eq_mul, mul_comm] using
    sub_smul_dslope (fun x : ℝ => beta x - beta (a*x)) 0 t

lemma h_quotient {a t : ℝ} (ha : a ≠ 0) (ht : t ≠ 0) :
    h a t = 1/(Real.exp t-1) - a/(Real.exp (a*t)-1) := by
  have he : Real.exp t - 1 ≠ 0 := sub_ne_zero.mpr (by simpa using ht)
  have hae : Real.exp (a*t)-1 ≠ 0 := sub_ne_zero.mpr (by simpa using mul_ne_zero ha ht)
  have hp := (eq_div_iff ht).mpr (h_product a t)
  rw [beta_ne_zero ht, beta_ne_zero (mul_ne_zero ha ht)] at hp
  rw [hp]
  field_simp

lemma h_derivatives (a : ℝ) (n : ℕ) :
    iteratedDeriv n (h a) 0 = (1-a^(n+1)) * (bernoulli (n+1):ℝ) / (n+1) := by
  have hp := iteratedDeriv_fun_mul (x := (0:ℝ)) (g:=fun t : ℝ => t)
    ((h_smooth a).of_le (by simp) : ContDiff ℝ (n+1) (h a)).contDiffAt
    contDiffAt_id
  have he : (fun t : ℝ => h a t * t) = fun t => beta t - beta (a*t) :=
    funext (h_product a)
  have hb : ContDiff ℝ (n+1) beta := beta_smooth.of_le (by simp)
  have hba : ContDiff ℝ (n+1) (fun t : ℝ => beta (a*t)) :=
    hb.comp (contDiff_const.mul contDiff_id)
  rw [he, iteratedDeriv_fun_sub hb.contDiffAt hba.contDiffAt] at hp
  simp only [iteratedDeriv_comp_const_mul hb a, mul_zero, beta_derivatives] at hp
  have hs : (∑ i ∈ Finset.range (n+1+1), ((n+1).choose i : ℝ) *
      iteratedDeriv i (h a) 0 * iteratedDeriv (n+1-i) (fun t : ℝ => t) 0) =
      (n+1) * iteratedDeriv n (h a) 0 := by
    rw [Finset.sum_eq_single n]
    · simp [iteratedDeriv_fun_id_zero, Nat.choose_succ_self_right]
    · intro i hi hin
      have hn : n+1-i ≠ 1 := by omega
      simp [iteratedDeriv_fun_id_zero, hn]
    · intro hn
      exact False.elim (hn (by simp))
  rw [hs] at hp
  have hn : (n+1:ℝ) ≠ 0 := by positivity
  apply (eq_div_iff hn).2
  rw [mul_comm]
  linarith

lemma h_zero (a : ℝ) : h a 0 = (a-1)/2 := by
  have hh := h_derivatives a 0
  simp at hh
  linarith

lemma h_one (t : ℝ) : h 1 t = 0 := by
  by_cases ht : t = 0
  · norm_num [ht, h_zero]
  · simp [h, dslope_of_ne _ ht, slope]

lemma h_first (a : ℝ) : deriv (h a) 0 = (1-a^2)/12 := by
  have hh := h_derivatives a 1
  norm_num at hh
  linarith

lemma h_complex_smooth (a : ℝ) : ContDiff ℝ (⊤ : ℕ∞) (fun t => (h a t : ℂ)) :=
  (h_smooth a).continuousLinearMap_comp Complex.ofRealCLM

lemma h_within_values (a : ℝ) (n : ℕ) :
    iteratedDerivWithin n (fun t => (h a t : ℂ)) (Ici 0) 0 =
      (1-(a:ℂ)^(n+1)) * (bernoulli (n+1):ℂ) / (n+1) := by
  rw [iteratedDerivWithin_eq_iteratedDeriv (uniqueDiffOn_Ici 0)
    ((h_complex_smooth a).of_le (by simp)).contDiffAt self_mem_Ici]
  have hh := Complex.ofRealCLM.iteratedFDeriv_comp_left (x := (0:ℝ))
    (h_smooth a).contDiffAt (i:=n) (by simp)
  have hv := congrArg (fun f => f (fun _ => (1:ℝ))) hh
  change iteratedDeriv n (fun t => (h a t : ℂ)) 0 = ((iteratedDeriv n (h a) (0:ℝ) : ℝ) : ℂ) at hv
  rw [hv, h_derivatives]
  push_cast
  rfl

lemma h_two (t : ℝ) : h 2 t = 1/(Real.exp t+1) := by
  by_cases ht : t = 0
  · norm_num [ht, h_zero]
  · have he : Real.exp t - 1 ≠ 0 := sub_ne_zero.mpr (by simpa using ht)
    have hep : Real.exp t + 1 ≠ 0 := ne_of_gt (by positivity)
    rw [h_quotient (by norm_num) ht, show 2*t=t+t by ring, Real.exp_add,
      show Real.exp t * Real.exp t - 1 = (Real.exp t-1)*(Real.exp t+1) by ring]
    field_simp
    ring

lemma h_log_two : h 2 (Real.log 2) = 1/3 := by
  rw [h_two, Real.exp_log (by norm_num)]
  norm_num

lemma h_negative_one (t : ℝ) : h (-1) t = -1 := by
  by_cases ht : t = 0
  · norm_num [ht, h_zero]
  · have he : Real.exp t - 1 ≠ 0 := sub_ne_zero.mpr (by simpa using ht)
    have he0 : Real.exp t ≠ 0 := Real.exp_ne_zero _
    have he1 : 1-Real.exp t ≠ 0 := sub_ne_zero.mpr (Ne.symm (sub_ne_zero.mp he))
    rw [h_quotient (by norm_num) ht, neg_one_mul, Real.exp_neg]
    field_simp [he1]
    ring

lemma h_two_first : deriv (h 2) 0 = -1/4 := by
  rw [h_first]
  norm_num

lemma positive_derivatives_of_series {F : ℕ → ℝ → ℝ} {a : ℝ} (ha : 0 < a)
    (hbase : ∀ t : ℝ, 0 < t → h a t = F 0 t - a * F 0 (a*t))
    (hF : ∀ m : ℕ, ∀ t : ℝ, 0 < t → HasDerivAt (F m) (-F (m+1) t) t)
    (m : ℕ) {t : ℝ} (ht : 0 < t) :
    iteratedDeriv m (h a) t = (-1:ℝ)^m * (F m t - a^(m+1) * F m (a*t)) := by
  induction m generalizing t with
  | zero => simpa using hbase t ht
  | succ m ih =>
    have heq : iteratedDeriv m (h a) =ᶠ[𝓝 t]
        (fun u => (-1:ℝ)^m * (F m u - a^(m+1) * F m (a*u))) := by
      filter_upwards [isOpen_Ioi.mem_nhds ht] with u hu
      exact ih hu
    rw [iteratedDeriv_succ, heq.deriv_eq]
    have hd := ((hF m t ht).sub
      (((hF m (a*t) (mul_pos ha ht)).comp t (hasDerivAt_const_mul a)).const_mul
        (a^(m+1)))).const_mul ((-1:ℝ)^m)
    simp only [Pi.sub_apply, Function.comp_apply] at hd
    rw [hd.deriv]
    simp only [pow_succ]
    ring

lemma decay_majorant {a t C u v : ℝ} (ha : 0 < a) (ht : 0 ≤ t) (hC : 0 ≤ C)
    (hu : 0 ≤ u) (hv : 0 ≤ v)
    (hub : u ≤ C * Real.exp (-t)) (hvb : v ≤ C * Real.exp (-(a*t))) (m : ℕ) :
    |(-1:ℝ)^m * (u - a^(m+1)*v)| ≤
      C * (1+a^(m+1)) * Real.exp (-(min 1 a)*t) := by
  have h1 : Real.exp (-t) ≤ Real.exp (-(min 1 a)*t) := by
    apply Real.exp_le_exp.mpr
    have hc := min_le_left (1:ℝ) a
    nlinarith
  have h2 : Real.exp (-(a*t)) ≤ Real.exp (-(min 1 a)*t) := by
    apply Real.exp_le_exp.mpr
    have hc := min_le_right (1:ℝ) a
    nlinarith
  simp only [abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  calc
    |u-a^(m+1)*v| ≤ |u|+|a^(m+1)*v| := abs_sub _ _
    _ = u+a^(m+1)*v := by rw [abs_of_nonneg hu, abs_of_nonneg (mul_nonneg (pow_nonneg ha.le _) hv)]
    _ ≤ C*Real.exp (-(min 1 a)*t) + a^(m+1)*(C*Real.exp (-(min 1 a)*t)) :=
      add_le_add (hub.trans (mul_le_mul_of_nonneg_left h1 hC))
        (mul_le_mul_of_nonneg_left (hvb.trans (mul_le_mul_of_nonneg_left h2 hC)) (pow_nonneg ha.le _))
    _ = _ := by ring

end SmoothedProbe

namespace SmoothedProbe
lemma kernel_cocycle (a b t : ℝ) : h (a*b) t = h a t + a*h b (a*t) := by
  by_cases ht : t = 0
  · subst t; simp only [mul_zero, h_zero]; ring
  · apply mul_right_cancel₀ ht
    have h1 := h_product (a*b) t
    have h2 := h_product a t
    have h3 := h_product b (a*t)
    rw [show b*(a*t)=(a*b)*t by ring] at h3
    nlinarith
lemma kernel_commute (a b t : ℝ) :
    h a t + a*h b (a*t) = h b t + b*h a (b*t) := by
  rw [← kernel_cocycle, ← kernel_cocycle, mul_comm a b]
lemma jet_cocycle (a b : ℝ) (n : ℕ) :
    iteratedDeriv n (h (a*b)) 0 = iteratedDeriv n (h a) 0 +
      a^(n+1)*iteratedDeriv n (h b) 0 := by
  simp only [h_derivatives, mul_pow]
  ring
lemma mellin_cocycle {a b : ℝ} (ha : 0 < a) (s : ℂ)
    (hca : MellinConvergent (fun t => (h a t : ℂ)) s)
    (hcb : MellinConvergent (fun t => (h b t : ℂ)) s) :
    mellin (fun t => (h (a*b) t : ℂ)) s =
      mellin (fun t => (h a t : ℂ)) s +
        (a:ℂ)^(1-s)*mellin (fun t => (h b t : ℂ)) s := by
  have he : (fun t => (h (a*b) t : ℂ)) =
      fun t => (h a t : ℂ) + (a:ℂ)*(h b (a*t) : ℂ) := by
    funext t; rw [kernel_cocycle]; push_cast; rfl
  rw [he]
  have hadd := (hasMellin_add hca (((MellinConvergent.comp_mul_left ha).mpr hcb).const_smul (a:ℂ))).2
  simp only [smul_eq_mul] at hadd
  rw [hadd]
  rw [show (fun t => (a:ℂ)*(h b (a*t) : ℂ)) =
    (fun t => (a:ℂ) • (h b (a*t) : ℂ)) from rfl,
    mellin_const_smul, mellin_comp_mul_left (fun t : ℝ => (h b t : ℂ)) s ha]
  simp only [smul_eq_mul]
  rw [sub_eq_add_neg, Complex.cpow_add _ _ (Complex.ofReal_ne_zero.mpr ha.ne'), Complex.cpow_one]
  ring
lemma continued_cocycle (L : ℝ → ℂ → ℂ)
    (hz : ∀ a : ℝ, 0 < a → ∀ s : ℂ, s ≠ 1 →
      L a s = (1-(a:ℂ)^(1-s))*riemannZeta s)
    (h1 : ∀ a : ℝ, 0 < a → L a 1 = (Real.log a : ℂ))
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (s : ℂ) :
    L (a*b) s = L a s + (a:ℂ)^(1-s)*L b s := by
  by_cases hs : s = 1
  · subst s
    rw [h1 _ (mul_pos ha hb), h1 _ ha, h1 _ hb, Real.log_mul ha.ne' hb.ne']
    simp
  · rw [hz _ (mul_pos ha hb) _ hs, hz _ ha _ hs, hz _ hb _ hs,
      Complex.ofReal_mul, Complex.mul_cpow_ofReal_nonneg ha.le hb.le]
    ring
lemma test_origin : h 6 0 = h 2 0 + 2*h 3 0 ∧ h 6 0 = 5/2 := by
  norm_num [h_zero]
lemma test_negative (t : ℝ) : h (-6) t = h (-2) t + (-2)*h 3 (-2*t) := by
  convert kernel_cocycle (-2) 3 t using 1
  norm_num
lemma test_zero (a t : ℝ) : h 0 t = h a t + a*h 0 (a*t) := by
  simpa using kernel_cocycle a 0 t
lemma test_third : iteratedDeriv 3 (h 6) 0 = 259/24 ∧
    iteratedDeriv 3 (h 6) 0 = iteratedDeriv 3 (h 2) 0 + 16*iteratedDeriv 3 (h 3) 0 := by
  constructor
  · norm_num [h_derivatives, bernoulli, bernoulli']
  · convert jet_cocycle 2 3 3 using 1 <;> norm_num
lemma test_missing_weight : h 6 0 ≠ h 2 0 + h 3 0 := by
  norm_num [h_zero]
#print axioms kernel_cocycle
#print axioms kernel_commute
#print axioms jet_cocycle
#print axioms mellin_cocycle
#print axioms continued_cocycle
#print axioms test_origin
#print axioms test_negative
#print axioms test_zero
#print axioms test_third
#print axioms test_missing_weight
end SmoothedProbe
@@END Native.lean
@@BEGIN native.log cb402c3ca99baa78de025adc212cabb2bd4720bfd2cb9d664e77585359c79cd3
'SmoothedProbe.kernel_cocycle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.kernel_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.jet_cocycle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.mellin_cocycle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.continued_cocycle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.test_origin' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.test_negative' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.test_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.test_third' depends on axioms: [propext, Classical.choice, Quot.sound]
'SmoothedProbe.test_missing_weight' depends on axioms: [propext, Classical.choice, Quot.sound]
2.70 seconds 3799088 KiB
@@END native.log
@@BEGIN suggested.log e8ec42415191f457bf19c4889085739ef5f5548a66c63955fa7642a8f0c0dd9e
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:34:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:39:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:43:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:51:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:59:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:65:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:73:4: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:76:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:83:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:89:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:95:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:101:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:106:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:113:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:117:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:120:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:129:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:140:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:143:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:146:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:150:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:154:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:158:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:174:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:177:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:180:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:183:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:187:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:190:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:193:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:198:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:200:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:202:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:204:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:214:4: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:216:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:219:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:221:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:224:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:227:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:230:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:233:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:237:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:240:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:243:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:247:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:251:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:256:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:258:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:260:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:262:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:264:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:266:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:282:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:285:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:289:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:292:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:295:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:299:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:301:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:303:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:305:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:320:4: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:322:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:326:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:328:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:330:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:333:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:336:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:339:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:342:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:349:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:354:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:360:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:363:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:367:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:371:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:374:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:379:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:381:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:383:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:385:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:387:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:389:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:403:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:406:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:410:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:414:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:418:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:422:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:426:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:428:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:430:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:432:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:434:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:442:9: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:446:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:460:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:465:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:472:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:476:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:486:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:490:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:494:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:499:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:505:8: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:513:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:516:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:519:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:522:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:525:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:530:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:533:0: warning: declaration uses `sorry`
research/blueprint/suggested/DirichletPadicLFunctions--L0.lean:536:0: warning: declaration uses `sorry`
2.60 seconds 3768236 KiB
@@END suggested.log
END L0 COMPOSITION EVIDENCE -/
