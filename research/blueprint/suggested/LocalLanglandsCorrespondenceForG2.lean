import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Tactic.NormNum

/-!
# The local Langlands correspondence for G₂

This is a suggested roadmap file, not an implementation. It states only the
light definitions and milestones expressible using carriers at the pinned
Mathlib/Tau Ceti baseline. The README specifies the exceptional parameters,
theta transfers, packet enhancements and theorems requiring new carriers.

LG.0: the explicit A₂ torus calculation is a check on the restriction
1 ⊕ Std₃ ⊕ Std₃∨. It does not define an exceptional group or a Langlands map.
The eight-dimensional diagonal model adds the invariant spinor line.
-/

namespace G2Atlas

open Polynomial

/-- Eigenvalues of the seven-dimensional restriction on an A₂ torus. -/
def a2Seven (a b : ℂˣ) : Fin 7 → ℂ :=
  ![1, (a : ℂ), (b : ℂ), ((a * b)⁻¹ : ℂˣ), (a⁻¹ : ℂˣ), (b⁻¹ : ℂˣ), (a * b : ℂˣ)]

/-- The vector restriction matrix in this chosen weight basis. -/
def a2Vector (a b : ℂˣ) : Matrix (Fin 7) (Fin 7) ℂ :=
  Matrix.diagonal (a2Seven a b)

/-- The spin restriction matrix, with its extra invariant line. -/
def a2Spin (a b : ℂˣ) : Matrix (Fin 8) (Fin 8) ℂ :=
  Matrix.diagonal
    ![1, 1, (a : ℂ), (b : ℂ), ((a * b)⁻¹ : ℂˣ), (a⁻¹ : ℂˣ),
      (b⁻¹ : ℂˣ), (a * b : ℂˣ)]

/-- The characteristic polynomial of the vector restriction. -/
noncomputable def a2Polynomial (a b : ℂˣ) : ℂ[X] :=
  (a2Vector a b).charpoly

/-- A layer milestone: the seven weights have determinant one. -/
theorem det_a2Vector (a b : ℂˣ) : (a2Vector a b).det = 1 := by
  sorry

/-- A layer milestone: the extra spinor line contributes one linear factor. -/
theorem charpoly_a2Spin (a b : ℂˣ) :
    (a2Spin a b).charpoly = (X - 1) * a2Polynomial a b := by
  sorry

/-- A layer milestone relating the explicit weights to the existing charpoly API. -/
theorem a2Polynomial_factorization (a b : ℂˣ) :
    a2Polynomial a b =
      (X - 1) * (X - C (a : ℂ)) * (X - C (b : ℂ)) *
        (X - C (((a * b)⁻¹ : ℂˣ) : ℂ)) *
        (X - C ((a⁻¹ : ℂˣ) : ℂ)) * (X - C ((b⁻¹ : ℂˣ) : ℂ)) *
        (X - C ((a * b : ℂˣ) : ℂ)) := by
  sorry

/-- The characteristic polynomial has the intended degree. -/
theorem a2Polynomial_natDegree (a b : ℂˣ) : (a2Polynomial a b).natDegree = 7 := by
  sorry

/-- The characteristic polynomial has the intended leading coefficient. -/
theorem a2Polynomial_monic (a b : ℂˣ) : (a2Polynomial a b).Monic := by
  sorry

example : a2Vector 1 1 = 1 := by
  sorry

example : a2Spin 1 1 = 1 := by
  sorry

example : a2Polynomial 1 1 = (X - 1) ^ 7 := by
  sorry

example : a2Polynomial (-1) 1 = (X - 1) ^ 3 * (X + 1) ^ 4 := by
  sorry

example (a b : ℂˣ) : a2Seven a b 3 = (((a * b)⁻¹ : ℂˣ) : ℂ) := by
  sorry

example (a b : ℂˣ) : a2Polynomial a b = (Matrix.diagonal (a2Seven a b)).charpoly := by
  sorry

/-- Distinct reciprocal weights detect an erroneous second copy of Std₃. -/
example :
    a2Seven (Units.mk0 (2 : ℂ) (by norm_num)) (Units.mk0 (3 : ℂ) (by norm_num)) =
      ![1, 2, 3, 1 / 6, 1 / 2, 1 / 3, 6] := by
  sorry

end G2Atlas
