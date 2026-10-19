import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.Algebra.Tower

/-!
These prototypes are aids, not the specification. The reader document is definitive;
this file suggests forms for statements, rather than an exhaustive checklist.
Only light coordinate definitions on existing carriers occur here. The quaternionic,
Shimura, automorphic-cohomology and compatible-realization carriers are README targets.
No such carrier is replaced by an abstract placeholder or an assumed data definition.

JL.1: the six exterior coordinates use order 12,13,14,23,24,34 and volume orientation -1.
JL.3: rational coordinates expose the parity restriction before forming the integral lattice.
JL.8: the Hodge table includes the coefficient normalization.
JL.10: determinant descent is stated on actual matrices over field extensions.
-/

namespace TauCeti.JacquetLanglandsHodge

/-- Coordinates of the semilinear exterior operator for a real diagonal hermitian form. -/
def diagonalStar (a : Fin 4 → ℝ) (x : Fin 6 → ℂ) : Fin 6 → ℂ :=
  ![-(a 2 : ℂ) * a 3 * star (x 5),
    (a 1 : ℂ) * a 3 * star (x 4),
    -(a 1 : ℂ) * a 2 * star (x 3),
    -(a 0 : ℂ) * a 3 * star (x 2),
    (a 0 : ℂ) * a 2 * star (x 1),
    -(a 0 : ℂ) * a 1 * star (x 0)]

/-- The coordinate operator is additive. -/
theorem diagonalStar_add (a : Fin 4 → ℝ) (x y : Fin 6 → ℂ) :
    diagonalStar a (x + y) = diagonalStar a x + diagonalStar a y := by
  sorry

/-- Multiplication by a complex scalar is conjugated. -/
theorem diagonalStar_smul (a : Fin 4 → ℝ) (c : ℂ) (x : Fin 6 → ℂ) :
    diagonalStar a (c • x) = star c • diagonalStar a x := by
  sorry

/-- The square is multiplication by the hermitian volume (Proposition 5.3). -/
theorem diagonalStar_square (a : Fin 4 → ℝ) (x : Fin 6 → ℂ) :
    diagonalStar a (diagonalStar a x) =
      ((a 0 * a 1 * a 2 * a 3 : ℝ) : ℂ) • x := by
  sorry

example : diagonalStar ![1, 1, 1, 1] ![1, 0, 0, 0, 0, 0] =
    ![0, 0, 0, 0, 0, -1] := by
  sorry

example : diagonalStar ![1, 1, 1, 1] ![Complex.I, 0, 0, 0, 0, 0] =
    ![0, 0, 0, 0, 0, Complex.I] := by
  sorry

example (J₁ J₂ : ℝ) (x : Fin 6 → ℂ) :
    diagonalStar ![1, -J₁, 1, -J₂]
      (diagonalStar ![1, -J₁, 1, -J₂] x) = ((J₁ * J₂ : ℝ) : ℂ) • x := by
  sorry

/-- Rational form of the exceptional character map (Corollary 6.3). -/
def weightMap (l : Fin 3 → ℚ) : Fin 4 → ℚ :=
  ![(l 0 + l 1 + l 2) / 2, (-l 0 - l 1 + l 2) / 2,
    (l 0 - l 1 - l 2) / 2, (-l 0 + l 1 - l 2) / 2]

/-- Inverse coordinates, whose domain is restricted to sum zero in the inverse theorem. -/
def inverseWeightMap (k : Fin 4 → ℚ) : Fin 3 → ℚ :=
  ![k 0 + k 2, k 0 + k 3, k 0 + k 1]

theorem weightMap_sum (l : Fin 3 → ℚ) : ∑ i, weightMap l i = 0 := by
  sorry

theorem inverseWeightMap_weightMap (l : Fin 3 → ℚ) :
    inverseWeightMap (weightMap l) = l := by
  sorry

theorem weightMap_inverseWeightMap (k : Fin 4 → ℚ) (hk : ∑ i, k i = 0) :
    weightMap (inverseWeightMap k) = k := by
  sorry

/-- Even total weight, rather than integer division, ensures integral coordinates. -/
theorem weightMap_integral (l : Fin 3 → ℤ) (hl : Even (l 0 + l 1 + l 2)) :
    ∀ i, ∃ z : ℤ, weightMap (fun j => (l j : ℚ)) i = (z : ℚ) := by
  sorry

example : weightMap ![2, 0, 0] = ![1, -1, 1, -1] := by
  sorry

example : weightMap ![0, 0, 2] = ![1, 1, -1, -1] := by
  sorry

example : ¬ ∃ z : ℤ, weightMap ![1, 0, 0] 0 = (z : ℚ) := by
  sorry

/-- The six actual Hodge types after the unitary coefficient shift (Proposition 11.6).
This is the numerical table, not a definition of a Hodge structure or its cohomology. -/
def normalizedHodgeTable (k : ℤ) : Fin 6 → ℤ × ℤ :=
  ![(2-k, k+2), (1, 1), (2, 2), (2, 2), (3, 3), (k+2, 2-k)]

theorem normalizedHodgeTable_degreeTwo (k : ℤ) :
    normalizedHodgeTable k 1 = (1, 1) := by
  sorry

example : normalizedHodgeTable 2 0 = (0, 4) := by
  sorry

example : normalizedHodgeTable 4 0 = (-2, 6) := by
  sorry

example : normalizedHodgeTable 4 1 = (1, 1) := by
  sorry

/-- The linear parameter version of rational determinant descent.
The matrices may have L-valued coefficients; the parameters can still be chosen in K. -/
theorem determinant_descent
    {K L : Type*} [Field K] [Field L] [Algebra K L] [Infinite K]
    {r m : ℕ} (M : Fin r → Matrix (Fin m) (Fin m) L)
    (h : ∃ x : Fin r → L, (∑ i, x i • M i).det ≠ 0) :
    ∃ x : Fin r → K, (∑ i, (algebraMap K L (x i)) • M i).det ≠ 0 := by
  sorry

/-- Two independent rational parameter blocks, as in the corrected component descent.
The theta parameters lie in K and the component parameters in ℚ. -/
theorem bilinear_determinant_descent
    {K L : Type*} [Field K] [CharZero K] [Field L]
    [Algebra ℚ K] [Algebra K L] [Algebra ℚ L] [IsScalarTower ℚ K L]
    {r s m : ℕ} (M : Fin r → Fin s → Matrix (Fin m) (Fin m) L)
    (h : ∃ (x : Fin r → L) (y : Fin s → L),
      (∑ i, ∑ j, (x i * y j) • M i j).det ≠ 0) :
    ∃ (x : Fin r → K) (y : Fin s → ℚ),
      (∑ i, ∑ j, (algebraMap K L (x i) * algebraMap ℚ L (y j)) • M i j).det ≠ 0 := by
  sorry

end TauCeti.JacquetLanglandsHodge
