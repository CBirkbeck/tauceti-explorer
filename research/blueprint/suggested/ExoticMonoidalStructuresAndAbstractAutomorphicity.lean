import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.CategoryTheory.Monoidal.Braided.Basic

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures.

The fixed roadmap shape permits light definitions on existing carriers and
milestones statable at the pins. The reader gives all 57 targets, their APIs,
tests and carrier dependencies. In particular this file does not introduce a
replacement smooth representation category, a triality kernel, or an assumed
exotic monoidal structure. Their construction is the roadmap's mathematical
work. All implementation statuses remain unchecked.

EX.0 is represented by its matrix pairing; EX.5 by the categorical idempotent
theorem. The remaining targets require the supplier interfaces in the reader.
-/

open Matrix

namespace TauCeti.ExoticGL2

section DeterminantPairing

variable {R : Type*} [CommRing R]

/-- The determinant polarization on the native two-by-two matrix carrier. -/
def detPairing (m n : Matrix (Fin 2) (Fin 2) R) : R :=
  Matrix.trace m * Matrix.trace n - Matrix.trace (m * n)

/-- EX.0: the pairing has the determinant normalization used by triality. -/
theorem detPairing_polar (m n : Matrix (Fin 2) (Fin 2) R) :
    detPairing m n = (m + n).det - m.det - n.det := by
  sorry

theorem detPairing_symm (m n : Matrix (Fin 2) (Fin 2) R) :
    detPairing m n = detPairing n m := by
  sorry

theorem detPairing_nondegenerate (m : Matrix (Fin 2) (Fin 2) R)
    (hm : ∀ n, detPairing m n = 0) : m = 0 := by
  sorry

theorem detPairing_transpose (m n : Matrix (Fin 2) (Fin 2) R) :
    detPairing m.transpose n.transpose = detPairing m n := by
  sorry

-- EX.0/determinant-pairing.1: the two complementary coordinate pairs.
example : detPairing (!![1, 0; 0, 0] : Matrix (Fin 2) (Fin 2) R)
    !![0, 0; 0, 1] = 1 := by
  sorry

example : detPairing (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) R)
    !![0, 0; 1, 0] = -1 := by
  sorry

-- EX.0/determinant-pairing.2: the factor of two survives on the diagonal.
example (m : Matrix (Fin 2) (Fin 2) R) : detPairing m m = 2 * m.det := by
  sorry

-- EX.0/determinant-pairing.3: a coordinate test detects sign errors.
example (a b c d r s t u : R) :
    detPairing !![a, b; c, d] !![r, s; t, u] = a * u + d * r - b * t - c * s := by
  sorry

end DeterminantPairing

section IdempotentCoherence

open CategoryTheory MonoidalCategory

variable {C : Type*} [Category C] [MonoidalCategory C]

/-- EX.5, GH11 Theorem 3.1.2: the two intertwining equations are essential.
The discrepancy `a` compares the left and right triple products through `θ`.
-/
theorem idempotentCoherence (P : C) (θ : P ⊗ P ≅ P) (a : P ≅ P)
    (hdiscrepancy : (θ.hom ▷ P) ≫ θ.hom ≫ a.hom =
      (α_ P P P).hom ≫ (P ◁ θ.hom) ≫ θ.hom)
    (hleft : (a.hom ▷ P) ≫ θ.hom = θ.hom ≫ a.hom)
    (hright : (P ◁ a.hom) ≫ θ.hom = θ.hom ≫ a.hom) :
    a.hom = 𝟙 P := by
  sorry

end IdempotentCoherence

end TauCeti.ExoticGL2
