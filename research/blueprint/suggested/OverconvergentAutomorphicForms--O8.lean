/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These statements suggest Lean forms so that contributors and
 reviewers converge on names and signatures. Every proof is a placeholder.

Only the five finite matrix declarations are expressible against this baseline.
The five geometric declarations require the actual O0/O1, S1/S3 and B4 APIs.
They are omitted here, rather than represented by unconstrained propositions.
-/
import Mathlib.Data.Matrix.ColumnRowPartitioned
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation

noncomputable section
open Matrix

namespace TauCeti.Overconvergent.Siegel

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- Row-graph normalisation on the locus where the denominator is a unit. -/
lemma graph_normalisation (A B C D Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    Matrix.fromCols (1 : Matrix n n R) Z * Matrix.fromBlocks A B C D =
      (A + Z * C) * Matrix.fromCols (1 : Matrix n n R)
        ((A + Z * C)⁻¹ * (B + Z * D)) := by
  sorry

/-- The actual Siegel denominator satisfies the right-action cocycle identity. -/
lemma factor_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    (A * E + B * G) + Z * (C * E + D * G) =
      (A + Z * C) * (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G) := by
  sorry

/-- Composition of chart coordinates, with both denominators invertible. -/
lemma coordinate_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det)
    (hK : IsUnit (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G).det) :
    (((A * E + B * G) + Z * (C * E + D * G))⁻¹ *
      ((A * F + B * H) + Z * (C * F + D * H))) =
    (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G)⁻¹ *
      (F + ((A + Z * C)⁻¹ * (B + Z * D)) * H) := by
  sorry

/-- Correct antidiagonal dual factor: the lower-left block precedes Z. -/
lemma antidiagonal_dual_factor (W A C Z : Matrix n n R)
    (hW : W * W = 1) (hZ : W * Z.transpose * W = Z) :
    W * (A + Z * C).transpose * W =
      W * A.transpose * W + (W * C.transpose * W) * Z := by
  sorry

/-- Apply a scalar character to the determinant of the actual matrix factor.
The three units are the unique unit lifts of the displayed denominators. -/
lemma determinant_character_cocycle {S : Type*} [CommRing S]
    (A B C D E F G H Z : Matrix n n R)
    (j k l : Matrix.GeneralLinearGroup n R)
    (hj : (j : Matrix n n R) = A + Z * C)
    (hk : (k : Matrix n n R) =
      E + ((A + Z * C)⁻¹ * (B + Z * D)) * G)
    (hl : (l : Matrix n n R) = (A * E + B * G) + Z * (C * E + D * G))
    (χ : Rˣ →* Sˣ) :
    (χ (Matrix.GeneralLinearGroup.det l))⁻¹ =
      (χ (Matrix.GeneralLinearGroup.det j))⁻¹ *
      (χ (Matrix.GeneralLinearGroup.det k))⁻¹ := by
  sorry

-- Acceptance: the identity block acts identically.
example (Z : Matrix n n R) :
    ((1 : Matrix n n R) + Z * 0)⁻¹ * (0 + Z * 1) = Z := by
  sorry

-- Acceptance: in genus one the denominator is a + z*c, not c*z + d.
example (a b c d z : ℚ) (h : a + z * c ≠ 0) :
    (((!![a] : Matrix (Fin 1) (Fin 1) ℚ) + !![z] * !![c])⁻¹ *
      (!![b] + !![z] * !![d])) 0 0 = (a + z * c)⁻¹ * (b + z * d) := by
  sorry

-- Acceptance: unit denominators are essential; a zero denominator cannot be cancelled.
example :
    Matrix.fromCols (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) *
        Matrix.fromBlocks (0 : Matrix (Fin 1) (Fin 1) ℚ) (1 : Matrix (Fin 1) (Fin 1) ℚ) (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) ≠
      (0 : Matrix (Fin 1) (Fin 1) ℚ) * Matrix.fromCols (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) := by
  sorry

-- Acceptance: multiplication order of two genus-two factors is observable.
example :
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 1, 1] ≠
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] := by
  sorry

-- Acceptance: the source's antidiagonal-dual order fails for a lower unipotent
-- symplectic element with C = 3*E21 and Z = E12.
example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    W * (1 + Z * C).transpose * W = !![1, 0; 0, 4] := by
  sorry

example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    W * (1 + Z * C).transpose * W ≠ 1 + Z * (W * C.transpose * W) := by
  sorry

-- Acceptance: determinant character agrees with integer powers, including duals.
example (j k : Matrix.GeneralLinearGroup n R) (m : ℤ) :
    Matrix.GeneralLinearGroup.det (j * k) ^ (-m) =
      Matrix.GeneralLinearGroup.det j ^ (-m) *
      Matrix.GeneralLinearGroup.det k ^ (-m) := by
  sorry

example (j : Matrix.GeneralLinearGroup n R) :
    Matrix.GeneralLinearGroup.det j ^ (0 : ℤ) = 1 := by
  sorry

example (j : Matrix.GeneralLinearGroup n R) :
    Matrix.GeneralLinearGroup.det j ^ (-1 : ℤ) =
      (Matrix.GeneralLinearGroup.det j)⁻¹ := by
  sorry

-- Acceptance: finite algebra handles the empty index set; geometric genus stays positive.
example (j : Matrix.GeneralLinearGroup (Fin 0) R) :
    Matrix.GeneralLinearGroup.det j = 1 := by
  sorry

#check Matrix.fromCols_mul_fromBlocks
#check Matrix.mul_nonsing_inv
#check Matrix.GeneralLinearGroup.det
#check Matrix.transpose_mul

end TauCeti.Overconvergent.Siegel
