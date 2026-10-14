/-
This file is not the roadmap and is not exhaustive: the packet and its reader
document are definitive. These statements suggest Lean forms so contributors
and reviewers can agree on interfaces. Admitted proofs certify no mathematics.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Steinberg presentations, their stable group, column and row normal forms, and
the Hopf and bar-complex constructions are README targets. Their missing
carriers are not developed here. The predicates below are real-bodied, light
forms of the inherited central-extension and superperfectness definitions.
The factor-set objects and cohomology classes are the actual pinned objects.
-/
import TauCeti.GroupTheory.GroupExtension.Cohomology
import Mathlib.GroupTheory.IsPerfect
import Mathlib.RepresentationTheory.Homological.GroupHomology.LowDegree
import Mathlib.Data.ZMod.Basic

noncomputable section

namespace TauCetiBlueprint.K2Classical

section Actions

variable {G A E : Type} [Group G] [CommGroup A] [Group E]
  [MulDistribMulAction G A] (S : GroupExtension A E G)

/-- New node: centrality is exactly compatibility with a specified trivial action. -/
theorem central_iff_inducesAction (htriv : ∀ (g : G) (a : A), g • a = a) :
    S.inl.range ≤ Subgroup.center E ↔ TauCeti.GroupExtension.InducesAction S := by
  sorry

/-- The inherited classification specializes the fixed-action theorem, retaining
both markings. Normalized sections are set-theoretic sections. -/
theorem central_extensions_equiv_iff
    {E' : Type} [Group E'] (S' : GroupExtension A E' G)
    (σ : S.Section) (σ' : S'.Section) (hσ : σ 1 = 1) (hσ' : σ' 1 = 1)
    (hact : TauCeti.GroupExtension.InducesAction S)
    (hact' : TauCeti.GroupExtension.InducesAction S') :
    Nonempty (S.Equiv S') ↔
      (TauCeti.GroupExtension.factorSet σ hσ hact).cohomologyClass =
      (TauCeti.GroupExtension.factorSet σ' hσ' hact').cohomologyClass := by
  sorry

/-- Every cohomology class has a central factor-set representative when the
specified action is trivial. This is the surjectivity part of classification. -/
theorem every_class_has_central_representative
    (htriv : ∀ (g : G) (a : A), g • a = a)
    (c : groupCohomology.H2 (Rep.ofMulDistribMulAction G A)) :
    ∃ α : TauCeti.FactorSet G A,
      α.cohomologyClass = c ∧ α.groupExtension.inl.range ≤ Subgroup.center α.Extension := by
  sorry

/-- Splitting is a property of the actual marked extension. -/
theorem central_splits_iff_zero
    (σ : S.Section) (hσ : σ 1 = 1)
    (hact : TauCeti.GroupExtension.InducesAction S) :
    Nonempty S.Splitting ↔
      (TauCeti.GroupExtension.factorSet σ hσ hact).cohomologyClass = 0 := by
  sorry

-- Tests of the classification interface, on existing carriers.
example (σ τ : S.Section) (hσ : σ 1 = 1) (hτ : τ 1 = 1)
    (hact : TauCeti.GroupExtension.InducesAction S) :
    (TauCeti.GroupExtension.factorSet σ hσ hact).cohomologyClass =
      (TauCeti.GroupExtension.factorSet τ hτ hact).cohomologyClass := by
  sorry

example (α : TauCeti.FactorSet G A) :
    Nonempty α.groupExtension.Splitting ↔ α.cohomologyClass = 0 := by
  sorry

example (htriv : ∀ (g : G) (a : A), g • a = a)
    (α : TauCeti.FactorSet G A) :
    α.groupExtension.inl.range ≤ Subgroup.center α.Extension := by
  sorry

end Actions

section Recognition

variable {G X : Type} [Group G] [Group X]

/-- Inherited universal-central-extension definition, in one common universe.
Targets range over all central extensions, with no fixed kernel marking. -/
def IsUniversalCentralExtension (p : X →* G) : Prop :=
  Function.Surjective p ∧ p.ker ≤ Subgroup.center X ∧
    ∀ (Y : Type) [Group Y] (q : Y →* G),
      Function.Surjective q → q.ker ≤ Subgroup.center Y →
        ∃! f : X →* Y, q.comp f = p

/-- Inherited superperfectness definition using actual trivial integral homology. -/
def IsSuperperfect (G : Type) [Group G] : Prop :=
  Subsingleton (groupHomology.H1 (Rep.trivial ℤ G ℤ)) ∧
    Subsingleton (groupHomology.H2 (Rep.trivial ℤ G ℤ))

/-- Weibel III Recognition Theorem 5.4, inherited from T.1. -/
theorem recognition (p : X →* G) (hp : Function.Surjective p)
    (hc : p.ker ≤ Subgroup.center X) :
    (IsUniversalCentralExtension p ↔ IsSuperperfect X) ∧
    (IsUniversalCentralExtension p ↔
      Group.IsPerfect X ∧
        ∀ (Y : Type) [Group Y] (q : Y →* X),
          Function.Surjective q → q.ker ≤ Subgroup.center Y →
            ∃ s : X →* Y, q.comp s = MonoidHom.id X) := by
  sorry

theorem perfect_has_universal_extension (hG : Group.IsPerfect G) :
    ∃ (X : Type) (_ : Group X) (p : X →* G), IsUniversalCentralExtension p := by
  sorry

theorem universal_kernel_h2 (p : X →* G) (hp : IsUniversalCentralExtension p) :
    Nonempty (p.ker ≃* Multiplicative (groupHomology.H2 (Rep.trivial ℤ G ℤ))) := by
  sorry

-- Three tests of universality, including a non-example.
example : IsUniversalCentralExtension (MonoidHom.id (Multiplicative (ZMod 1))) := by
  sorry

example : ¬ IsUniversalCentralExtension (MonoidHom.id (Multiplicative (ZMod 2))) := by
  sorry

example (hG : IsSuperperfect G) : IsUniversalCentralExtension (MonoidHom.id G) := by
  sorry

-- Three tests of superperfectness, using integral homology throughout.
example : IsSuperperfect (Multiplicative (ZMod 1)) := by
  sorry

example : ¬ IsSuperperfect (Multiplicative (ZMod 2)) := by
  sorry

example : ¬ IsSuperperfect (Multiplicative ℤ) := by
  sorry

end Recognition

end TauCetiBlueprint.K2Classical
