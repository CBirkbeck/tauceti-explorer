import Mathlib

/-!
# K₂, symbols and central extensions: representative target signatures

The roadmap is `research/blueprint/readmes/K2SymbolsBrauer--T.1.md`, with full
contracts in its blueprint packet. This file is not exhaustive. Centrality and
universality are predicates on genuine group homomorphisms. Stable elementary
groups, Steinberg presentations and their K₂ comparison are supplied separately.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

universe u

/-! ## Layer 1: universal central extensions -/

/-- Kernel centrality; surjectivity is a separate condition. -/
def IsCentral {X G : Type u} [Group X] [Group G] (p : X →* G) : Prop :=
  p.ker ≤ Subgroup.center X

/-- Universality amongst central surjective homomorphisms over G, in a fixed
common universe. The morphism must commute with the projections. -/
def IsUniversalCentralExtension {X G : Type u} [Group X] [Group G]
    (p : X →* G) : Prop :=
  Function.Surjective p ∧ IsCentral p ∧
    ∀ (Y : Type u) [Group Y] (q : Y →* G),
      Function.Surjective q → IsCentral q → ∃! f : X →* Y, q.comp f = p

/-- The source and quotient of a universal central extension are perfect. -/
theorem universal_isPerfect {X G : Type u} [Group X] [Group G]
    (p : X →* G) (hp : IsUniversalCentralExtension p) :
    Group.IsPerfect X ∧ Group.IsPerfect G := by
  sorry

/-- Perfectness removes differences between two lifts into a central extension. -/
theorem perfect_source_rigidity {X G Y : Type u} [Group X] [Group G] [Group Y]
    (p : X →* G) (q : Y →* G) (hX : Group.IsPerfect X) (hq : IsCentral q)
    (f g : X →* Y) (hf : q.comp f = p) (hg : q.comp g = p) : f = g := by
  sorry

example {G : Type u} [Group G] : IsCentral (MonoidHom.id G) := by
  sorry

/-- Centrality alone does not assert that a homomorphism is onto. -/
example : IsCentral (1 : PUnit →* Multiplicative ℤ) ∧
    ¬ Function.Surjective (1 : PUnit →* Multiplicative ℤ) := by
  sorry

example : ¬ IsUniversalCentralExtension (MonoidHom.id (Multiplicative ℤ)) := by
  sorry

/- Finite and stable Steinberg groups, the universal projection to E(R),
classical K₂, Matsumoto symbols, global Milnor theorems and tame boundaries
remain targets over the actual owner carriers. A global-field Milnor theorem
is imported from the existing symbol packet rather than proved again here. -/

end TauCetiRoadmap.K2SymbolsBrauer
