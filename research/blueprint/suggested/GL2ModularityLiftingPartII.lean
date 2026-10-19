import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic

/-!
# GL₂ Modularity Lifting, Part II: Minimal Defect-One R = T

This file contains suggested statements, not an implementation of the roadmap.
The list is not exhaustive; the companion roadmap document is definitive.
The names and statements suggest the shape of a future API, not a commitment to
its final design. Proofs are placeholders.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

WORKERS.md restricts this file to light definitions over existing carriers and
milestones statable at the pins. All arithmetic carriers, their API contracts,
and their discriminating tests are specified in the reader. In particular this
file does not invent abstract replacements for Katz forms, coherent homology,
vexing bundles or the Bianchi Conjecture A interface.

The matrix milestones below belong to D1.1 and D1.2. They fix the column
convention in CG18 Lemma 3.5, pp. 318–320, and correct the doubling matrix in
CG18 Theorem 3.11, p. 328, and Lemma 3.16, p. 332. The selected-root injection
from CG20 Lemma 8.14, pp. 865–866, is a reader target because its geometric
carriers are absent at the pins. These statements use Mathlib's determinant,
characteristic polynomial and Cayley–Hamilton; they do not rebuild those APIs.

The matrix calculation first applies over B = A[T_p]. It does not itself show
that T_p belongs to the p-anaemic weight-one image A. The reader's D1.2 target
proves B = A separately using the high-weight ordinary Galois Frobenius trace,
before using quadratic freeness over A in the weight-one unramifiedness proof.
-/

namespace TauCeti.ModularityLifting.DefectOne.Suggested

open Matrix Polynomial

section Oldforms

variable {R : Type*} [CommRing R]

/-- D1.1: the normalized weight-one oldform matrix. The norm x is a unit. -/
def oldformUpMatrix (x : Rˣ) (t d : R) : Matrix (Fin 2) (Fin 2) R :=
  !![t, (x : R) * d; -((x⁻¹ : Rˣ) : R), 0]

/-- D1.1: the trace pairing in the ordered coordinates (π₁*, V_x). -/
def oldformPairingMatrix (x : Rˣ) (t d : R) : Matrix (Fin 2) (Fin 2) R :=
  !![((x⁻¹ : Rˣ) : R) * ((x : R) + 1), t; t, ((x : R) + 1) * d]

/-- The two off-diagonal entries have product −d, independently of x. -/
theorem oldformUpMatrix_det (x : Rˣ) (t d : R) :
    (oldformUpMatrix x t d).det = d := by
  sorry

/-- Specialization of the existing characteristic-polynomial construction. -/
theorem oldformUpMatrix_charpoly (x : Rˣ) (t d : R) :
    (oldformUpMatrix x t d).charpoly = X ^ 2 - C t * X + C d := by
  sorry

/-- The relation is quadratic over an arbitrary commutative coefficient ring. -/
theorem oldformUpMatrix_quadratic (x : Rˣ) (t d : R) :
    oldformUpMatrix x t d * oldformUpMatrix x t d -
      t • oldformUpMatrix x t d + d • (1 : Matrix (Fin 2) (Fin 2) R) = 0 := by
  sorry

/-- The residual root-ratio exclusions are exactly the two factors here. -/
theorem oldformPairingMatrix_det (x : Rˣ) (a b : R) :
    (oldformPairingMatrix x (a + b) (a * b)).det =
      ((x⁻¹ : Rˣ) : R) * (a - (x : R) * b) * (b - (x : R) * a) := by
  sorry

/-- Unit norm recovers the ordinary weight-one column convention. -/
example (t d : R) : oldformUpMatrix 1 t d = !![t, d; -1, 0] := by
  sorry

/-- An asymmetric norm distinguishes the formula from its transpose. -/
example : oldformUpMatrix (Units.mk0 (2 : ℚ) (by norm_num)) 0 3 =
    !![(0 : ℚ), 6; -(1 / 2), 0] := by
  sorry

/-- At a forbidden root ratio, the pairing degenerates. -/
example (x : Rˣ) (b : R) :
    (oldformPairingMatrix x ((x : R) * b + b) (((x : R) * b) * b)).det = 0 := by
  sorry

/-- Norm one: residual roots 1 and 2 over F₅ give an invertible pairing. -/
example : (oldformPairingMatrix (1 : (ZMod 5)ˣ) 3 2).det = 4 := by
  sorry

/-- At roots 1 and 1 the same pairing is singular. -/
example : (oldformPairingMatrix (1 : (ZMod 5)ˣ) 2 1).det = 0 := by
  sorry

end Oldforms

section Doubling

variable {R : Type*} [CommRing R]

/-- D1.2: U_p on the ordered doubling pair (φ, φT_p − U_pφ). -/
def doublingUpMatrix (t d : R) : Matrix (Fin 2) (Fin 2) R :=
  !![t, d; -1, 0]

/-- Compatibility with the ordinary oldform convention at unit norm. -/
theorem doublingUpMatrix_eq_oldform (t d : R) :
    doublingUpMatrix t d = oldformUpMatrix 1 t d := by
  sorry

/-- Its constant characteristic coefficient is the diamond scalar. -/
theorem doublingUpMatrix_charpoly (t d : R) :
    (doublingUpMatrix t d).charpoly = X ^ 2 - C t * X + C d := by
  sorry

/-- The relation yielding U_p + d/U_p = T_p on the doubled space. -/
theorem doublingUpMatrix_quadratic (t d : R) :
    doublingUpMatrix t d * doublingUpMatrix t d -
      t • doublingUpMatrix t d + d • (1 : Matrix (Fin 2) (Fin 2) R) = 0 := by
  sorry

/-- The lower-left unit proves independence of 1 and U on a full doubled space. -/
theorem doublingUpMatrix_linearIndependent (t d a b : R)
    (h : a • (1 : Matrix (Fin 2) (Fin 2) R) + b • doublingUpMatrix t d = 0) :
    a = 0 ∧ b = 0 := by
  sorry

/-- Distinct roots separate after choosing a root; the whole matrix is not scalar. -/
example : doublingUpMatrix (3 : ZMod 5) 2 ≠ (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) := by
  sorry

/-- Upper-right diamond 3 and lower-left −1 exclude the printed swapped entries. -/
example : doublingUpMatrix (0 : ZMod 5) 3 = !![(0 : ZMod 5), 3; 4, 0] := by
  sorry

/-- Repeated eigenvalue 1 does not make U scalar: the Jordan block remains. -/
example : doublingUpMatrix (2 : ZMod 5) 1 ≠ (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) := by
  sorry

/-- The repeated-root quadratic is (X−1)², with its nilpotent part retained. -/
example : (doublingUpMatrix (2 : ZMod 5) 1).charpoly =
    (X - 1 : (ZMod 5)[X]) ^ 2 := by
  sorry

/-- A zero trace does not force a zero determinant. -/
example : (doublingUpMatrix (0 : ZMod 5) 3).det = 3 := by
  sorry

end Doubling

end TauCeti.ModularityLifting.DefectOne.Suggested
