/-
Independent fix review REV-FIX-RT-AREA-ktheory-1~2, Codex codex-WBAmLh, 2026-10-19.
This companion states a small selection of targets over pinned library carriers.
The full roadmap, API obligations, source locators and worked checks remain in
`research/blueprint/readmes/GeneralAlgebraicKTheory--K.6.md` and its packet. Unsupported carriers and
constructions are reader targets; none is replaced here by admitted data.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Theorem proofs marked `sorry` are proposed work, not a formalization.
-/

import Mathlib.Algebra.Homology.Homotopy
import Mathlib.CategoryTheory.ObjectProperty.Basic

universe v w

open CategoryTheory

namespace TauCeti.HigherK

section FiniteDomination

variable {U : Type v} [Category.{w} U] [Preadditive U]

/-- A finite domination of `V` by a bounded complex with terms in the full subcategory `A`:
chain maps `f : V ⟶ D`, `g : D ⟶ V` and a homotopy `g ∘ f ≃ id_V`. -/
structure FiniteChainDomination (A : ObjectProperty U) (V : ChainComplex U ℤ) where
  D : ChainComplex U ℤ
  mem : ∀ i, A (D.X i)
  bounded : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → Limits.IsZero (D.X i)
  forward : V ⟶ D
  backward : D ⟶ V
  homotopy : Homotopy (forward ≫ backward) (𝟙 V)

namespace FiniteChainDomination

variable {A : ObjectProperty U} {V W : ChainComplex U ℤ}

/-- K.6/finite-chain-domination: invariance under a chain homotopy equivalence.
Only existence is asserted; constructing the transported data is future work. -/
theorem transport_exists (d : FiniteChainDomination A V) (e : HomotopyEquiv V W) :
    Nonempty (FiniteChainDomination A W) := by
  sorry

/-- The domination yields a homotopy idempotent, rather than a strict idempotent. -/
theorem fg_homotopy_exists (d : FiniteChainDomination A V) :
    Nonempty (Homotopy ((d.backward ≫ d.forward) ≫ (d.backward ≫ d.forward))
      (d.backward ≫ d.forward)) := by
  sorry

/-- Test self_domination: a bounded complex in `A` dominates itself, with `f = g = id`. -/
example (hA : ∀ i, A (V.X i))
    (hb : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → Limits.IsZero (V.X i)) :
    FiniteChainDomination A V :=
  ⟨V, hA, hb, 𝟙 V, 𝟙 V, Homotopy.ofEq (by simp)⟩

end FiniteChainDomination

-- Test contractible_domination
example (A : ObjectProperty U) (Z : U) (hZ : Limits.IsZero Z) (hA : A Z) (V : ChainComplex U ℤ)
    (h : Homotopy (𝟙 V) 0) : Nonempty (FiniteChainDomination A V) := sorry

end FiniteDomination

end TauCeti.HigherK
