import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.Data.Matrix.Basis
import TauCeti.GroupTheory.GroupExtension.Cohomology

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/K2SymbolsBrauer--T.1-2.md is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.

Following WORKERS.md (shape fixed 2026-10-12), this is a compact signature file:
there is no theory development, no data defined with sorry, and no private substitute
for a carrier absent at the pins. The Steinberg, fresh-root, normalized-generator,
plus-cover and K-space constructions, their full APIs and tests are README targets.
The statements below expose the lifted-relation milestones over existing groups;
the examples check the existing colimit/classification interfaces and product order.
Nothing here claims an implementation of classical K₂.
-/

open scoped commutatorElement

namespace K2SymbolsBrauer.T1Part2

noncomputable section

section LiftedRelations

variable {X Y : Type*} [Group X] [Group Y]

/-- The choice-independence milestone used by normalised-root-lift.
No surjectivity is needed once these preimages have been supplied. -/
theorem lift_commutator_independent (q : Y →* X)
    (hcentral : q.ker ≤ Subgroup.center Y) {a a' b b' : Y}
    (ha : q a = q a') (hb : q b = q b') :
    ⁅a, b⁆ = ⁅a', b'⁆ := by
  sorry

/-- The exact commuting-lifts milestone: the first root factors as a commutator
of two roots whose images commute with the second root. In Stₙ the spare index
supplies this factorization and both commutation hypotheses for n ≥ 5. -/
theorem commuting_lift_of_root_factorization (q : Y →* X)
    (hcentral : q.ker ≤ Subgroup.center Y) (a b y z : Y)
    (hy : q y = ⁅q a, q b⁆)
    (haz : Commute (q a) (q z)) (hbz : Commute (q b) (q z)) :
    Commute y z := by
  sorry

/-- The four-root triple-commutator milestone, with the actual commutations used
in the word-reordering proof. Exact commuting lifts supply these hypotheses for
four distinct root indices; no unrestricted Jacobi identity is assumed. -/
theorem four_root_triple_identity (u v w : Y)
    (huw : Commute u w)
    (hAB : Commute ⁅u, v⁆ ⁅v, w⁆)
    (hBC : Commute ⁅v, w⁆ ⁅⁅u, v⁆, w⁆) :
    ⁅⁅u, v⁆, w⁆ = ⁅u, ⁅v, w⁆⁆ := by
  sorry

-- Arbitrary central twists of either chosen preimage must not change the word.
example (q : Y →* X) (hcentral : q.ker ≤ Subgroup.center Y)
    (a b z t : Y) (hz : z ∈ q.ker) (ht : t ∈ q.ker) :
    ⁅a * z, b * t⁆ = ⁅a, b⁆ := by
  sorry

-- The degenerate normalized lift is trivial even for an unnormalized set section.
example (q : Y →* X) (hcentral : q.ker ≤ Subgroup.center Y)
    (a b : Y) (hb : q b = 1) : ⁅a, b⁆ = 1 := by
  sorry

end LiftedRelations

-- The pinned DirectLimit already has a Group instance; transition injectivity
-- is deliberately absent from this example.
example {G : ℕ → Type*} [∀ i, Group (G i)]
    (f : ∀ i j, i ≤ j → G i →* G j)
    [DirectedSystem G (fun i j h ↦ f i j h)] :
    Group (DirectLimit G f) := inferInstance

section ExistingClassification

variable {G M E : Type} [Group G] [CommGroup M] [Group E]
    [MulDistribMulAction G M]

-- The missing centrality/fixed-action bridge is already at the Tau Ceti pin.
example (S : GroupExtension M E G)
    (hcentral : S.inl.range ≤ Subgroup.center E)
    (htrivial : ∀ (g : G) (m : M), g • m = m) :
    TauCeti.GroupExtension.InducesAction S :=
  (TauCeti.GroupExtension.inducesAction_iff_smul_eq_self hcentral).2 htrivial

-- The normalization interface supplies the hypothesis of factor-set classification.
example (S : GroupExtension M E G) (σ : S.Section) :
    TauCeti.GroupExtension.normalizeSection σ 1 = 1 :=
  TauCeti.GroupExtension.normalizeSection_one σ

end ExistingClassification

-- These inner 2×2 matrix units are E₁₂ and E₂₁ in traditional one-based notation.
-- They distinguish ab from ba in the fresh-root and normalized-lift tests.
example : (Matrix.single 0 1 (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ) *
    Matrix.single 1 0 1 = Matrix.single 0 0 1 := by
  sorry

example : (Matrix.single 1 0 (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ) *
    Matrix.single 0 1 1 = Matrix.single 1 1 1 := by
  sorry

end

end K2SymbolsBrauer.T1Part2
