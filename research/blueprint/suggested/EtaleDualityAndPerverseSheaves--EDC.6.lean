import Mathlib.CategoryTheory.Adjunction.FullyFaithful

/-!
# EDC.6: representative comparison signatures

This file is a roadmap prototype, not an implementation. The companion README is the
complete mathematical specification, including the coefficient ranges, reduction and
mapping-limit conditions, orientation API, tests and external inputs.

Only the categorical end of `diamond-trace-mates-and-image-condition` can be stated
on carriers present at the pins. Constructible normalized adic categories, their six
operations and analytic orientation sheaves are README targets owned by the recorded
suppliers. They are not replaced here by new structures or arbitrary proposition fields.

For the characteristic-p application, L is c_Y^*, R is Rc_Y*, B is the diamond exceptional
object, and e is its scheme-side recovery isomorphism. Full faithfulness supplies the
unit. The counit at B is the additional geometric condition required for strong transport.
-/

namespace TauCetiRoadmap.EtaleDuality.Comparison

open CategoryTheory

universe u₁ u₂ v₁ v₂

variable {C : Type u₁} [Category.{v₁} C]
variable {D : Type u₂} [Category.{v₂} D]
variable {L : C ⥤ D} {R : D ⥤ C} [L.Full] [L.Faithful]

/-- The canonical comparison obtained from a recovery isomorphism is invertible
exactly on the essential image. This is the categorical end milestone of the
scheme/diamond comparison; it does not assert geometric image preservation. -/
theorem recoveredComparison_isIso_iff (h : L ⊣ R) {A : C} {B : D}
    (e : R.obj B ≅ A) :
    IsIso ((L.mapIso e.symm).hom ≫ h.counit.app B) ↔ L.essImage B := by
  sorry

-- An object already in the image satisfies the comparison criterion.
example (h : L ⊣ R) {A : C} {B : D} (e : R.obj B ≅ A)
    (hB : L.essImage B) :
    IsIso ((L.mapIso e.symm).hom ≫ h.counit.app B) := by
  exact (recoveredComparison_isIso_iff h e).2 hB

-- A recovery isomorphism alone cannot put an object into the image.
example (h : L ⊣ R) {A : C} {B : D} (e : R.obj B ≅ A)
    (hB : ¬ L.essImage B) :
    ¬ IsIso ((L.mapIso e.symm).hom ≫ h.counit.app B) := by
  intro hIso
  exact hB ((recoveredComparison_isIso_iff h e).1 hIso)

-- The actual pinned full-faithfulness API already handles objects of the form L(A).
example (h : L ⊣ R) (A : C) : IsIso (h.counit.app (L.obj A)) := by
  infer_instance

end TauCetiRoadmap.EtaleDuality.Comparison
