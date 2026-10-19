import Mathlib.AlgebraicTopology.Quasicategory.Basic
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import TauCeti.Algebra.Category.ModuleCat.CartanMap

/-!
This file is not the roadmap and is not exhaustive. The companion reader document
is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures.

The 2026-10-12 roadmap shape applies: only statements over carriers available at
the pins belong here. The enhanced categories, spectra, K-theory functors and
chromatic localizations of KII.0–KII.10 are README targets, together with every
API item and discriminating test. No substitute carrier is introduced here.

The examples below check the existing interfaces used by KII.0/perfect-categories,
KII.0/ring-k-theory and KII.3/bounded-t-structure. They neither construct enhanced
K-theory nor assert the purity theorem. Right modules in the reader use the
opposite ring when comparing with Tau Ceti's left-module exact structure.
-/

open CategoryTheory CategoryTheory.Limits

example (S : SSet) [SSet.KanComplex S] : SSet.Quasicategory S :=
  inferInstance

example {C : Type*} [Category* C] (P : Idempotents.Karoubi C) :
    P.p ≫ P.p = P.p :=
  P.idem

example (R : Type*) [Ring R] :
    TauCeti.finiteProjectiveModulesExactStructure R =
      TauCeti.ExactStructure.split (TauCeti.finiteProjectiveModules R).FullSubcategory :=
  TauCeti.finiteProjectiveModulesExactStructure_eq_split R

section Bounded

variable {C : Type*} [Category* C] [Preadditive C] [HasZeroObject C]
  [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

example (t : Triangulated.TStructure C) (X : C) :
    t.bounded X ↔ (∃ n : ℤ, t.IsGE X n) ∧ (∃ n : ℤ, t.IsLE X n) :=
  Iff.rfl

end Bounded
