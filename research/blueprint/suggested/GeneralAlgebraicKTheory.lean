import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import Mathlib.Algebra.Algebra.Unitization
import Mathlib.Algebra.Homology.Homotopy

/-!
This file is not the roadmap and is not exhaustive. The definitive target,
API, hypothesis, source and Check specifications are in
`research/blueprint/readmes/GeneralAlgebraicKTheory.md` and its packet.
Only light definitions and selected milestones over existing pinned carriers
appear here. The Q, plus, S, spectrum, Tor-unitality and Poincaré targets belong
to the reader because their required carriers are absent at these pins.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Admitted proposition proofs state proposed work; no data is admitted.
-/

noncomputable section
namespace TauCeti.HigherK
open CategoryTheory CategoryTheory.Limits
universe u v w

section ExactSubstrate
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall.{w} C]
  (E : ExactStructure C)

/-- The object-class map used by the proposed fundamental-group comparison. -/
abbrev objectClass (X : C) : ExactK0 E := ExactK0.of X

/-- The degree-zero relation which the Q comparison must preserve. -/
theorem objectClass_conflation (S : ShortComplex C) (hS : E.Conflation S) :
    objectClass E S.X₂ = objectClass E S.X₁ + objectClass E S.X₃ :=
  ExactK0.of_conflation hS

/-- The existing universal property is the degree-zero comparison interface. -/
def additiveClassEquiv (G : Type*) [AddCommGroup G] :
    ExactK0.AdditiveInvariant E G ≃ (ExactK0 E →+ G) :=
  ExactK0.liftEquiv

example (G : Type*) [AddCommGroup G] (a : ExactK0.AdditiveInvariant E G) (X : C) :
    additiveClassEquiv E G a (objectClass E X) = a.obj X :=
  ExactK0.lift_of a X

example (X Y : C) :
    objectClass E (X ⊞ Y) = objectClass E X + objectClass E Y :=
  ExactK0.of_biprod X Y

end ExactSubstrate

/-- Ring K₀ uses the existing finite-projective exact structure. -/
abbrev projectiveK0 (R : Type u) [Ring R] :=
  ExactK0.{u} (finiteProjectiveModulesExactStructure R)

example (R : Type u) [Ring R] :
    finiteProjectiveModulesExactStructure R =
      ExactStructure.split (finiteProjectiveModules R).FullSubcategory :=
  finiteProjectiveModulesExactStructure_eq_split R

example (R : Type u) [Ring R]
    (S : ShortComplex (finiteProjectiveModules R).FullSubcategory) :
    (finiteProjectiveModulesExactStructure R).Conflation S ↔
      (S.map (finiteProjectiveModules R).ι).ShortExact :=
  finiteProjectiveModulesExactStructure_conflation_iff R S

/-- The actual pinned unitization carrier, before adding relative K-theory. -/
abbrev integralUnitization (I : Type u) := Unitization ℤ I

example (I : Type u) [Zero I] (n : ℤ) :
    (Unitization.inl n : integralUnitization I).fst = n :=
  Unitization.fst_inl I n

example (I : Type u) [Zero I] (n : ℤ) :
    (Unitization.inl n : integralUnitization I).snd = 0 :=
  Unitization.snd_inl I n

section FiniteDomination
variable {U : Type u} [Category.{v} U] [Preadditive U]

/-- K.6 finite domination retains the actual chain homotopy. -/
structure FiniteChainDomination (A : ObjectProperty U) (V : ChainComplex U ℤ) where
  D : ChainComplex U ℤ
  mem : ∀ i, A (D.X i)
  bounded : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → IsZero (D.X i)
  forward : V ⟶ D
  backward : D ⟶ V
  homotopy : Homotopy (forward ≫ backward) (𝟙 V)

namespace FiniteChainDomination
variable {A : ObjectProperty U} {V W : ChainComplex U ℤ}

/-- The endomorphism on the finite dominator is homotopy idempotent. -/
theorem homotopyIdempotent (d : FiniteChainDomination A V) :
    Nonempty (Homotopy ((d.backward ≫ d.forward) ≫ (d.backward ≫ d.forward))
      (d.backward ≫ d.forward)) := by
  sorry

/-- Homotopy equivalences preserve existence of a finite domination. -/
theorem transport_exists (d : FiniteChainDomination A V) (e : HomotopyEquiv V W) :
    Nonempty (FiniteChainDomination A W) := by
  sorry

example (hA : ∀ i, A (V.X i))
    (hb : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → IsZero (V.X i)) :
    FiniteChainDomination A V :=
  ⟨V, hA, hb, 𝟙 V, 𝟙 V, Homotopy.ofEq (by simp)⟩

end FiniteChainDomination
end FiniteDomination
end TauCeti.HigherK
