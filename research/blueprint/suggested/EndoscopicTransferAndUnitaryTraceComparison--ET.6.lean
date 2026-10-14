import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
EndoscopicTransferAndUnitaryTraceComparison--ET.6.md is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures.

This compact prototype follows WORKERS.md's 2026-10-12 shape. It uses only the
pinned matrix carriers. The reader specifies the full smooth-representation,
nearby-cycle, Weil–Deligne, Langlands-data and Grothendieck-group targets; their
carriers are absent from the pinned libraries and are not simulated here.

The following two matrices are projections of the imported unnormalized
special block of length two, evaluated at arithmetic Frobenius. For geometric
Frobenius the scalar t is inverted. They do not define a Weil representation or
a Weil–Deligne object. In particular t = 0 is a matrix boundary test, not an
admissible Frobenius value. Matrix.charpoly and Matrix.trace are imported,
never redefined.
-/

namespace TauCeti.LocalLanglands.RawSpecialBlock2

/-- Arithmetic-Frobenius weights of the raw length-two special block. -/
def frobenius (t : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  Matrix.diagonal ![1, t]

/-- The imported block convention sends the first basis vector to the second. -/
def monodromy : Matrix (Fin 2) (Fin 2) ℚ :=
  !![0, 0; 1, 0]

/-- Milestone: the Frobenius and monodromy normalization is compatible. -/
theorem covariance (t : ℚ) :
    frobenius t * monodromy = t • (monodromy * frobenius t) := by
  sorry

/-- Milestone: the first nontrivial special block retains a nilpotent operator. -/
theorem monodromy_properties :
    monodromy * monodromy = 0 ∧ monodromy ≠ 0 := by
  sorry

/-- The terminal, rather than initial, basis line survives in the Euler factor. -/
theorem kernel_coordinates (v : Fin 2 → ℚ) :
    monodromy.mulVec v = 0 ↔ v 0 = 0 := by
  sorry

/-- The trace of the underlying Weil matrix does not inspect monodromy. -/
theorem trace_frobenius (t : ℚ) :
    Matrix.trace (frobenius t) = 1 + t := by
  sorry

-- Projection of SegmentWDAdapter.lengthTwo: nilpotency does not mean zero.
example : monodromy * monodromy = 0 ∧ monodromy ≠ 0 := by
  sorry

-- RawSpecialBlock2.sameWeilDifferentMonodromy: identical characteristic
-- polynomials of first components do not identify the two operator pairs.
example (t : ℚ) :
    Matrix.charpoly ((frobenius t, monodromy).1) =
      Matrix.charpoly ((frobenius t, (0 : Matrix (Fin 2) (Fin 2) ℚ)).1) ∧
    (frobenius t, monodromy) ≠
      (frobenius t, (0 : Matrix (Fin 2) (Fin 2) ℚ)) := by
  sorry

-- Reversing the special-block orientation fails this kernel test.
example : monodromy.mulVec ![0, 1] = 0 ∧
    monodromy.mulVec ![1, 0] = ![0, 1] := by
  sorry

end TauCeti.LocalLanglands.RawSpecialBlock2
