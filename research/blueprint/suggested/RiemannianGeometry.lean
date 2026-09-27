import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.FDeriv.Bilinear
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv

/-!
This file is not the roadmap and is not exhaustive. The companion reader is
 definitive. These are suggested forms for contributors and reviewers, not an
 implementation claim. This file has NOT been compiled at the required pins.

All fields below are actual functions with actual derivatives. The geometric
application must first construct an orthonormal PARALLEL frame and identify
K(t) with R(-,gamma'(t))gamma'(t). An arbitrary moving frame does not work.

Regularity at every point of a closed interval means regularity in a neighbourhood
of that point, not merely within-differentiability with an arbitrary extension.
There is no assertion about junk values of deriv or a divergent total integral.
The interval integral is oriented; positivity always requires a <= b.
-/

noncomputable section
namespace TauCeti.RiemannianComparison

open Set MeasureTheory
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- The fixed-frame Wronskian, with the derivative in the first positive term. -/
def wronskian (J L : ℝ → E) (t : ℝ) : ℝ :=
  inner ℝ (deriv J t) (L t) - inner ℝ (J t) (deriv L t)

theorem wronskian_apply (J L : ℝ → E) (t : ℝ) :
    wronskian J L t = inner ℝ (deriv J t) (L t) - inner ℝ (J t) (deriv L t) := rfl

theorem wronskian_swap (J L : ℝ → E) (t : ℝ) :
    wronskian L J t = -wronskian J L t := by sorry

theorem wronskian_self (J : ℝ → E) (t : ℝ) : wronskian J J t = 0 := by sorry

theorem wronskian_deriv (J L : ℝ → E) (t : ℝ)
    (hJ : ContDiffAt ℝ 2 J t) (hL : ContDiffAt ℝ 2 L t) :
    deriv (wronskian J L) t =
      inner ℝ (deriv (deriv J) t) (L t) - inner ℝ (J t) (deriv (deriv L) t) := by sorry

/-- Constancy uses a common symmetric coefficient and the actual second-order ODE. -/
theorem wronskian_const (K : ℝ → E →L[ℝ] E) (J L : ℝ → E)
    (a b : ℝ) (hab : a ≤ b)
    (hJ : ∀ t ∈ Icc a b, ContDiffAt ℝ 2 J t)
    (hL : ∀ t ∈ Icc a b, ContDiffAt ℝ 2 L t)
    (hK : ∀ t ∈ Icc a b, ∀ u v, inner ℝ (K t u) v = inner ℝ u (K t v))
    (eqJ : ∀ t ∈ Icc a b, deriv (deriv J) t + K t (J t) = 0)
    (eqL : ∀ t ∈ Icc a b, deriv (deriv L) t + K t (L t) = 0) :
    ∀ t ∈ Icc a b, wronskian J L t = wronskian J L a := by sorry

/-- No factor one-half: this is the Hessian of the half-energy functional. -/
def indexForm (K : ℝ → E →L[ℝ] E) (a b : ℝ) (V W : ℝ → E) : ℝ :=
  ∫ t in a..b, inner ℝ (deriv V t) (deriv W t) - inner ℝ (K t (V t)) (W t)

theorem indexForm_apply (K : ℝ → E →L[ℝ] E) (a b : ℝ) (V W : ℝ → E) :
    indexForm K a b V W =
      ∫ t in a..b, inner ℝ (deriv V t) (deriv W t) - inner ℝ (K t (V t)) (W t) := rfl

theorem indexForm_same (K : ℝ → E →L[ℝ] E) (a : ℝ) (V W : ℝ → E) :
    indexForm K a a V W = 0 := by sorry

theorem indexForm_reverse (K : ℝ → E →L[ℝ] E) (a b : ℝ) (V W : ℝ → E) :
    indexForm K b a V W = -indexForm K a b V W := by sorry

theorem indexForm_integrable (K : ℝ → E →L[ℝ] E) (a b : ℝ) (hab : a ≤ b)
    (V W : ℝ → E) (hK : ContinuousOn K (Icc a b))
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t) :
    IntervalIntegrable
      (fun t => inner ℝ (deriv V t) (deriv W t) - inner ℝ (K t (V t)) (W t)) volume a b := by sorry

theorem indexForm_add_left (K : ℝ → E →L[ℝ] E) (a b : ℝ) (hab : a ≤ b)
    (U V W : ℝ → E) (hK : ContinuousOn K (Icc a b))
    (hU : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 U t)
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t) :
    indexForm K a b (fun t => U t + V t) W =
      indexForm K a b U W + indexForm K a b V W := by sorry

theorem indexForm_smul_left (K : ℝ → E →L[ℝ] E) (a b c : ℝ) (hab : a ≤ b)
    (V W : ℝ → E) (hK : ContinuousOn K (Icc a b))
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t) :
    indexForm K a b (fun t => c • V t) W = c * indexForm K a b V W := by sorry

theorem indexForm_symm (K : ℝ → E →L[ℝ] E) (a b : ℝ) (hab : a ≤ b)
    (V W : ℝ → E)
    (hK : ∀ t ∈ Icc a b, ∀ u v, inner ℝ (K t u) v = inner ℝ u (K t v)) :
    indexForm K a b V W = indexForm K a b W V V := by sorry

/-- Green's identity with the endpoint terms retained; K need not be symmetric. -/
theorem indexForm_green (K : ℝ → E →L[ℝ] E) (a b : ℝ) (hab : a ≤ b)
    (V W : ℝ → E) (hK : ContinuousOn K (Icc a b))
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 2 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t) :
    indexForm K a b V W =
      inner ℝ (deriv V b) (W b) - inner ℝ (deriv V a) (W a) -
        ∫ t in a..b, inner ℝ (deriv (deriv V) t + K t (V t)) (W t) := by sorry

/-- Two separately smooth pieces, continuous at c. The jump is RIGHT minus LEFT,
and its contribution is MINUS that jump paired with W(c). -/
theorem indexForm_broken_green (K : ℝ → E →L[ℝ] E)
    (a c b : ℝ) (hac : a ≤ c) (hcb : c ≤ b) (U V W : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hU : ∀ t ∈ Icc a c, ContDiffAt ℝ 2 U t)
    (hV : ∀ t ∈ Icc c b, ContDiffAt ℝ 2 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t) (hc : U c = V c) :
    indexForm K a c U W + indexForm K c b V W =
      inner ℝ (deriv V b) (W b) - inner ℝ (deriv U a) (W a) -
      inner ℝ (deriv V c - deriv U c) (W c) -
      (∫ t in a..c, inner ℝ (deriv (deriv U) t + K t (U t)) (W t)) -
      (∫ t in c..b, inner ℝ (deriv (deriv V) t + K t (V t)) (W t)) := by sorry

theorem indexForm_jacobi_boundary (K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a ≤ b) (J W : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hJ : ∀ t ∈ Icc a b, ContDiffAt ℝ 2 J t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t)
    (eqJ : ∀ t ∈ Icc a b, deriv (deriv J) t + K t (J t) = 0) :
    indexForm K a b J W =
      inner ℝ (deriv J b) (W b) - inner ℝ (deriv J a) (W a) := by sorry

/-- Nonpositive K gives a lower bound by derivative energy, not by position energy. -/
theorem indexForm_ge_derivative_energy (K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a ≤ b) (V : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hneg : ∀ t ∈ Icc a b, ∀ v, inner ℝ (K t v) v ≤ 0) :
    (∫ t in a..b, ‖deriv V t‖ ^ 2) ≤ indexForm K a b V V := by sorry

theorem indexForm_zero_imp_zero (K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a < b) (V : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hneg : ∀ t ∈ Icc a b, ∀ v, inner ℝ (K t v) v ≤ 0)
    (ha : V a = 0) (hI : indexForm K a b V V = 0) :
    ∀ t ∈ Icc a b, V t = 0 := by sorry

theorem jacobi_two_zeros (K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a < b) (J : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hJ : ∀ t ∈ Icc a b, ContDiffAt ℝ 2 J t)
    (hneg : ∀ t ∈ Icc a b, ∀ v, inner ℝ (K t v) v ≤ 0)
    (eqJ : ∀ t ∈ Icc a b, deriv (deriv J) t + K t (J t) = 0)
    (ha : J a = 0) (hb : J b = 0) : ∀ t ∈ Icc a b, J t = 0 := by sorry

/-- The Riccati equation is a checkable differential hypothesis on the actual S.
Its construction from an invertible Jacobi tensor is a separate geometric target. -/
theorem riccati_integrand (S K : ℝ → E →L[ℝ] E) (V W : ℝ → E) (t : ℝ)
    (hS : ContDiffAt ℝ 1 S t) (hV : ContDiffAt ℝ 1 V t) (hW : ContDiffAt ℝ 1 W t)
    (hsym : ∀ u v, inner ℝ (S t u) v = inner ℝ u (S t v))
    (hR : deriv S t + (S t).comp (S t) + K t = 0) :
    inner ℝ (deriv V t) (deriv W t) - inner ℝ (K t (V t)) (W t) =
      inner ℝ (deriv V t - S t (V t)) (deriv W t - S t (W t)) +
        deriv (fun s => inner ℝ (S s (V s)) (W s)) t := by sorry

theorem riccati_factorization (S K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a ≤ b) (V W : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hS : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 S t)
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hW : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 W t)
    (hsym : ∀ t ∈ Icc a b, ∀ u v, inner ℝ (S t u) v = inner ℝ u (S t v))
    (hR : ∀ t ∈ Icc a b, deriv S t + (S t).comp (S t) + K t = 0) :
    indexForm K a b V W =
      (∫ t in a..b, inner ℝ (deriv V t - S t (V t)) (deriv W t - S t (W t))) +
      inner ℝ (S b (V b)) (W b) - inner ℝ (S a (V a)) (W a) := by sorry

theorem riccati_dirichlet_nonneg (S K : ℝ → E →L[ℝ] E)
    (a b : ℝ) (hab : a ≤ b) (V : ℝ → E)
    (hK : ContinuousOn K (Icc a b))
    (hS : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 S t)
    (hV : ∀ t ∈ Icc a b, ContDiffAt ℝ 1 V t)
    (hsym : ∀ t ∈ Icc a b, ∀ u v, inner ℝ (S t u) v = inner ℝ u (S t v))
    (hR : ∀ t ∈ Icc a b, deriv S t + (S t).comp (S t) + K t = 0)
    (ha : V a = 0) (hb : V b = 0) : 0 ≤ indexForm K a b V V := by sorry

/-! Seven definition tests. -/
-- wronskian_linear_constant
example (v w : E) (t : ℝ) : wronskian (fun s => s • v) (fun _ => w) t = inner ℝ v w := by sorry
-- wronskian_trigonometric
example (t : ℝ) : wronskian Real.sin Real.cos t = 1 := by sorry
-- wronskian_zero_field
example (J : ℝ → E) (t : ℝ) : wronskian J (fun _ => 0) t = 0 := by sorry
-- index_flat_linear
example (v w : E) : indexForm (fun _ => 0) 0 1 (fun t => t • v) (fun t => t • w) = inner ℝ v w := by sorry
-- index_positive_potential_constant
example : indexForm (fun _ => ContinuousLinearMap.id ℝ ℝ) 0 1 (fun _ => (1 : ℝ)) (fun _ => (1 : ℝ)) = -1 := by sorry
-- index_collapsed_interval
example (K : ℝ → E →L[ℝ] E) (V W : ℝ → E) (a : ℝ) : indexForm K a a V W = 0 := by sorry
-- index_reversed_interval
example : indexForm (fun _ => (0 : ℝ →L[ℝ] ℝ)) 1 0 (fun t => t) (fun t => t) = -1 := by sorry

/-! Three theorem-level counterchecks. -/
-- Positive curvature admits a nonzero two-zero Jacobi field, so hneg is essential.
example : indexForm (fun _ => ContinuousLinearMap.id ℝ ℝ) 0 Real.pi Real.sin Real.sin = 0 := by sorry
-- A corner contributes a derivative jump even when both pieces solve the flat equation.
example : deriv (fun t : ℝ => 2-t) 1 - deriv (fun t : ℝ => t) 1 = -2 := by sorry
-- Without an endpoint condition, flat constant fields have zero index but need not vanish.
example : indexForm (fun _ => (0 : ℝ →L[ℝ] ℝ)) 0 1 (fun _ => (1 : ℝ)) (fun _ => (1 : ℝ)) = 0 := by sorry

end TauCeti.RiemannianComparison
