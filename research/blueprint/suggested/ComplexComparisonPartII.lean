import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Laplacian
import Mathlib.Analysis.Normed.Operator.Compact.Basic

/-!
# Complex comparison: selected native statements

The roadmap document is definitive and gives the full targets and supplier
contracts. Analytic spaces, coherent GAGA, currents and relative Hodge bundles
need their shared carriers before their geometric statements can be typed.
The elementary models here fix nilpotents, the Hermitian slot and Laplacian sign.
-/

noncomputable section

namespace TauCeti.ComplexComparison

/-- The defining ideal of the complex dual-number point. -/
def dualNumberIdeal : Ideal (Polynomial ℂ) := Ideal.span {Polynomial.X ^ 2}

/-- The infinitesimal coordinate, with its quotient structure retained. -/
def dualNumberEpsilon : Polynomial ℂ ⧸ dualNumberIdeal :=
  Ideal.Quotient.mk dualNumberIdeal Polynomial.X

/-- A one-point analytic local model must retain this nonzero nilpotent. -/
theorem dualNumberEpsilon_nonzero_square_zero :
    dualNumberEpsilon ≠ 0 ∧ dualNumberEpsilon ^ 2 = 0 := by
  sorry

/-- Constants and the first infinitesimal coefficient determine the whole ring. -/
theorem dualNumber_unique_coefficients (z : Polynomial ℂ ⧸ dualNumberIdeal) :
    ∃! ab : ℂ × ℂ,
      z = algebraMap ℂ _ ab.1 + algebraMap ℂ _ ab.2 * dualNumberEpsilon := by
  sorry

abbrev PlaneOneForm := EuclideanSpace ℂ (Fin 2)

/-- Star on one-forms in an oriented orthonormal real plane, extended C-linearly. -/
def planeStar (a : PlaneOneForm) : PlaneOneForm :=
  WithLp.toLp 2 ![-a 1, a 0]

/-- The coefficient of the oriented area form in a wedge product. -/
def planeWedge (a b : PlaneOneForm) : ℂ := a 0 * b 1 - a 1 * b 0

/-- Mathlib's inner product is conjugate-linear in its first argument. -/
theorem planeStar_wedge_identity (a b : PlaneOneForm) :
    planeWedge a (planeStar (WithLp.toLp 2 (fun i => star (b i)))) =
      inner ℂ b a := by
  sorry

/-- The nonnegative Hodge sign is opposite to the scalar div-grad sign. -/
def scalarHodgeLaplacian (f : EuclideanSpace ℝ (Fin 3) → ℝ) :
    EuclideanSpace ℝ (Fin 3) → ℝ := -Laplacian.laplacian f

/-- The independent compact inclusion and estimate give the Fredholm step. -/
theorem compactEllipticHodge {E H : Type}
    [NormedAddCommGroup E] [NormedAddCommGroup H]
    [NormedSpace ℂ E] [NormedSpace ℂ H] [CompleteSpace E]
    (T J : E →L[ℂ] H) (hJ : IsCompactOperator J) (C : ℝ) (hC : 0 < C)
    (hest : ∀ u, ‖u‖ ≤ C * (‖T u‖ + ‖J u‖)) :
    FiniteDimensional ℂ (LinearMap.ker T.toLinearMap) ∧
      IsClosed (Set.range T) := by
  sorry

example : dualNumberEpsilon ^ 2 = 0 ∧ dualNumberEpsilon ≠ 0 := by
  sorry

example : (algebraMap ℂ (Polynomial ℂ ⧸ dualNumberIdeal)) 1 = 1 := by
  sorry

example : Ideal.Quotient.mk dualNumberIdeal (Polynomial.X ^ 3) = 0 := by
  sorry

example : planeStar (WithLp.toLp 2 ![1, 0]) = WithLp.toLp 2 ![0, 1] ∧
    planeStar (WithLp.toLp 2 ![0, 1]) = WithLp.toLp 2 ![-1, 0] := by
  sorry

example (a : PlaneOneForm) : planeStar (planeStar a) = -a := by
  sorry

example : planeWedge (WithLp.toLp 2 ![Complex.I, 0])
    (planeStar (WithLp.toLp 2 ![1, 0])) = Complex.I ∧
    inner ℂ (WithLp.toLp 2 ![1, 0] : PlaneOneForm)
      (WithLp.toLp 2 ![Complex.I, 0]) = Complex.I := by
  sorry

example : scalarHodgeLaplacian (fun _ => (7 : ℝ)) = 0 := by
  sorry

example (x : EuclideanSpace ℝ (Fin 3)) :
    scalarHodgeLaplacian (fun y => (y 0) ^ 2) x = -2 := by
  sorry

end TauCeti.ComplexComparison
