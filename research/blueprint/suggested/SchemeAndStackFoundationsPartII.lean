import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Data.ZMod.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree

/-!
# Flat cohomology: suggested forms

These prototypes are aids, not the specification. The companion markdown is
 definitive; the declarations below illustrate forms expressible at the pins.
They do not constitute an exhaustive checklist. Animation, gerbes, derived
support cohomology and Dieudonné modules are specified in the markdown because
their carriers are supplied by other roadmaps.

The single definition below has a real body over native algebra categories.
The statements express the ind-fppf interface and split-cover milestone; they
do not develop a replacement category of group schemes or animated rings.
-/

open CategoryTheory

universe u

namespace TauCeti.FlatCohomology

/-- Finite-presentation factorization form of an ind-fppf algebra.
CS24 §2.3.3, p.24. The README also specifies its filtered-colimit equivalence. -/
def IsIndFppf (R : Type u) [CommRing R] (B : CommAlgCat.{u} R) : Prop :=
  ∀ (C : CommAlgCat.{u} R), Algebra.FinitePresentation R C →
    ∀ g : C ⟶ B, ∃ (D : CommAlgCat.{u} R),
      Module.FaithfullyFlat R D ∧ Algebra.FinitePresentation R D ∧
        ∃ (i : C ⟶ D) (j : D ⟶ B), i ≫ j = g

/-- Native faithfully flat finite-presentation algebras satisfy the predicate. -/
theorem IsIndFppf.of_fppf (R : Type u) [CommRing R] (B : CommAlgCat.{u} R)
    [Module.FaithfullyFlat R B] [Algebra.FinitePresentation R B] : IsIndFppf R B := by
  sorry

/-- The factorization condition retains faithfulness, not only flatness. -/
theorem IsIndFppf.faithfullyFlat {R : Type u} [CommRing R] {B : CommAlgCat.{u} R}
    (h : IsIndFppf R B) : Module.FaithfullyFlat R B := by
  sorry

/-- CS24 Lemma 5.3.1, p.58: an ind-fppf algebra splitting all fppf covers. -/
theorem exists_indFppf_split (R : Type u) [CommRing R] :
    ∃ (S : CommAlgCat.{u} R), IsIndFppf R S ∧
      ∀ (T : CommAlgCat.{u} S), Module.FaithfullyFlat S T →
        Algebra.FinitePresentation S T → Nonempty (T →ₐ[S] S) := by
  sorry

/-- Identity, also valid over the zero ring. -/
example (R : Type u) [CommRing R] : IsIndFppf R (CommAlgCat.of R R) := by
  sorry

/-- A nontrivial polynomial extension is ind-fppf, even over a nonreduced base. -/
example (R : Type u) [CommRing R] :
    IsIndFppf R (CommAlgCat.of R (Polynomial R)) := by
  sorry

/-- Ordinary flatness of the rational numbers does not suffice. -/
example : ¬ IsIndFppf ℤ (CommAlgCat.of ℤ ℚ) := by
  sorry

/-- An ordinary nonflat quotient fails the predicate. -/
example : ¬ IsIndFppf ℤ (CommAlgCat.of ℤ (ZMod 4)) := by
  sorry

/-- Use the native finite locally free Cartier-dual carrier, without wrapping it. -/
example (R : Type u) [CommRing R]
    (G : TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) :
    Nonempty (G ≅
      TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R
        (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)) := by
  sorry

end TauCeti.FlatCohomology
