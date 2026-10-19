/-
Independent fix review REV-FIX-RT-AREA-ktheory-1~2, Codex codex-WBAmLh, 2026-10-19.
This companion states a small selection of targets over pinned library carriers.
The full roadmap, API obligations, source locators and worked checks remain in
`research/blueprint/readmes/K2SymbolsBrauer--T.1.md` and its packet. Unsupported carriers and
constructions are reader targets; none is replaced here by admitted data.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Theorem proofs marked `sorry` are proposed work, not a formalization.
-/

import Mathlib.GroupTheory.FreeGroup.IsFreeGroup
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality

noncomputable section

universe u

namespace TauCeti.Steinberg

section CentralExtensions
variable {X G Y : Type u} [Group X] [Group G] [Group Y]

/-- Kernel centrality. Surjectivity is a separate part of an extension. -/
def IsCentral (p : X →* G) : Prop := p.ker ≤ Subgroup.center X

/-- Universality in the chosen common universe of central extensions over G.
The quantified target need not have the same marked kernel as p. -/
def IsUniversalCentralExtension (p : X →* G) : Prop :=
  Function.Surjective p ∧ IsCentral p ∧
    ∀ (Y : Type u) [Group Y] (q : Y →* G),
      Function.Surjective q → IsCentral q → ∃! f : X →* Y, q.comp f = p

theorem uce_isPerfect {p : X →* G} (hp : IsUniversalCentralExtension p) :
    Group.IsPerfect X ∧ Group.IsPerfect G := by
  sorry

theorem perfect_source_rigidity {p : X →* G} {q : Y →* G}
    (hX : Group.IsPerfect X) (hq : IsCentral q)
    (f g : X →* Y) (hf : q.comp f = p) (hg : q.comp g = p) : f = g := by
  sorry

end CentralExtensions

-- Centrality alone does not include surjectivity.
example (G : Type u) [Group G] : IsCentral (MonoidHom.id G) := by
  sorry

section Recognition
open CategoryTheory

/-- `H_n(G, ℤ)` with trivial coefficients. -/
abbrev intHomology (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  groupHomology (Rep.trivial ℤ G ℤ) n

/-- T.1:classical/superperfect: `H₁(G, ℤ) = H₂(G, ℤ) = 0`. -/
def Group.IsSuperperfect (G : Type) [Group G] : Prop :=
  Subsingleton (intHomology G 1) ∧ Subsingleton (intHomology G 2)

theorem Group.isSuperperfect_iff (G : Type) [Group G] :
    Group.IsSuperperfect G ↔ Group.IsPerfect G ∧ Subsingleton (intHomology G 2) := by
  sorry

/-- Test `isSuperperfect_trivial`. -/
example : Group.IsSuperperfect Unit := by
  sorry

/-- Test `not_isSuperperfect_free`: `H₂` of a free group vanishes, `H₁` does not. -/
example : ¬ Group.IsSuperperfect (FreeGroup Unit) := by
  sorry


variable {X G : Type} [Group X] [Group G]

/-- T.1/recognition-theorem (K-book III.5.4), for a central extension of a perfect group. -/
theorem recognition {p : X →* G} [Group.IsPerfect G] (hp : Function.Surjective p)
    (hpc : IsCentral p) :
    (IsUniversalCentralExtension p ↔ Group.IsSuperperfect X) ∧
      (IsUniversalCentralExtension p ↔ (Group.IsPerfect X ∧
        ∀ (Y : Type) [Group Y] (ρ : Y →* X), Function.Surjective ρ → IsCentral ρ →
          ∃ s : X →* Y, ρ.comp s = MonoidHom.id X)) := by
  sorry

/-- T.1:classical/uce-kernel-h2 (K-book III.5.4, chapter p.37): the comparison is a target,
not a chosen equivalence with an admitted body. -/
theorem uce_kernel_h2 {p : X →* G} [Group.IsPerfect G]
    (hp : IsUniversalCentralExtension p) :
    Nonempty (Additive p.ker ≃+ intHomology G 2) := by
  sorry

end Recognition

end TauCeti.Steinberg
