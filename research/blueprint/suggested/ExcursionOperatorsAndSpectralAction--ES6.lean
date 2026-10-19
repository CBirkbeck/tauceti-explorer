import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.Coevaluation
import Mathlib.LinearAlgebra.Trace
import Mathlib.Algebra.MonoidAlgebra.Module
import Mathlib.CategoryTheory.Center.Basic
import Mathlib.Data.ZMod.Basic

/-!
# Excursion operators: ES6 and ES7

This is not the roadmap. The accompanying reader document is definitive for
the targets, hypotheses, planning API and tests that Tau Ceti is to implement.

The accompanying reader imports the existing ES5 and ES7 target nodes. This file
gives only the algebraic endpoints whose actual carriers exist at the atlas pins
(Mathlib 082e2d3, Tau Ceti f790474). It does not replace either packet's definitions.

The absent carriers include the enhanced lisse category, its Hecke functors and
spectral centre, reductive local-field L-groups, the classical towers and the
D-elliptic moduli. Their exact targets, API and discriminating tests remain in
the imported nodes and reader. No opaque or admitted data models stand for them.

The finite-dimensional contraction below is the algebraic part of
ES7:GLn-comparison/two-leg-excursion-is-a-trace. The regular-module checks are
the coefficient-sensitive boundary of ES6:functoriality/torus-two-leg-calculation.
Admitted propositions are target signatures, not implementation claims.
-/

noncomputable section

namespace TauCetiAtlas.ExcursionES6

section Trace

variable {L W V : Type*} [Field L] [Group W]
  [AddCommGroup V] [Module L V] [FiniteDimensional L V]

/-- The actual coevaluation/action/evaluation contraction on a representation.
The dual action includes inversion of the second group element. -/
def twoLegScalar (ρ : Representation L W V) (g h : W) : L :=
  contractRight L V
    (TensorProduct.map (ρ g) (ρ.dual h) (coevaluation L V 1))

/-- Native algebraic endpoint of the two-operation geometric realization.
No continuity, smoothness or geometric realization is supplied by this theorem. -/
theorem twoLegScalar_eq_trace (ρ : Representation L W V) (g h : W) :
    twoLegScalar ρ g h = LinearMap.trace L V (ρ (g * h⁻¹)) := by
  sorry

-- Equal legs give dimension, not 1 or dimension squared.
example (ρ : Representation L W V) (g : W) :
    twoLegScalar ρ g g = (Module.finrank L V : L) := by
  sorry

-- In rank one the second factor must act by its inverse.
example (ρ : Representation L W L) (g h : W) :
    twoLegScalar ρ g h = ρ g 1 * ρ h⁻¹ 1 := by
  sorry

-- Zero-dimensional spaces contribute zero.
example (g h : W) :
    twoLegScalar (Representation.trivial L W (Fin 0 → L)) g h = 0 := by
  sorry

/-- The identity-tuple normalization requires a nonzero dimension in L.
Characteristic zero and positive dimension are sufficient in the geometric use. -/
theorem identityTuple_normalization (a b : L) (n : ℕ)
    (hn : (n : L) ≠ 0) (h : a * b * (n : L) = (n : L)) :
    a * b = 1 := by
  sorry

-- The normalization hypothesis cannot be dropped when the dimension vanishes.
example : (0 : ZMod 2) * 1 * (2 : ZMod 2) = 2 ∧
    (0 : ZMod 2) * 1 ≠ 1 := by
  sorry

end Trace

section RegularModule

variable {R A B : Type*} [CommRing R] [Group A] [Group B]

-- Torus translation acts on a basis vector by multiplying its index.
example (u x : A) :
    MonoidAlgebra.single u (1 : R) * MonoidAlgebra.single x (1 : R) =
      MonoidAlgebra.single (u * x) (1 : R) := by
  sorry

-- Refining a level changes the quotient coordinate without an index scalar.
example (q : A →* B) (x : A) (r : R) :
    MonoidAlgebra.mapDomainLinearMap R R q (MonoidAlgebra.single x r) =
      MonoidAlgebra.single (q x) r := by
  sorry

-- Checking the identity basis vector detects the whole group-ring element.
example (r s : MonoidAlgebra R A)
    (h : r * MonoidAlgebra.single 1 1 = s * MonoidAlgebra.single 1 1) : r = s := by
  sorry

end RegularModule

section OrdinaryCentre

open CategoryTheory

variable {C : Type*} [Category C]

-- Evaluation on every object detects an ordinary categorical centre element.
-- This says nothing about the missing enhanced-to-ordinary comparison.
example (z z' : CatCenter C) (h : ∀ X : C, z.app X = z'.app X) : z = z' := by
  sorry

end OrdinaryCentre

end TauCetiAtlas.ExcursionES6
