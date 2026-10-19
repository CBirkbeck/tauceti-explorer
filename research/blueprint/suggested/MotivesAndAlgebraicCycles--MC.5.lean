import Mathlib
import TauCeti.AlgebraicTopology.Singular.Triple
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Monoidal

/-!
# Nori motives and diagram categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.5.md`.
These signatures suggest forms for milestones that already have native carriers at the pins.
Proving them alone does not finish MC.5. Coalgebra colimits, cellular algebraic filtrations,
Nori categories and realization functors remain mathematical targets in the reader.
There are no admitted data definitions here.
-/

namespace TauCetiRoadmap.MotivesAndAlgebraicCycles.Nori

open CategoryTheory

universe u v

noncomputable section

variable (K : Type u) [Field K] (C : Type v) [SmallCategory C]

/-- The finite-endomorphism model uses the existing representation functor carrier.
For a quiver representation take `C` to be its free path category. -/
def compatibleEnd (T : C ⥤ ModuleCat.{u} K) :
    Subalgebra K (∀ c : C, Module.End K (T.obj c)) where
  carrier := {a | ∀ (c d : C) (f : c ⟶ d) (x : T.obj c),
    T.map f (a c x) = a d (T.map f x)}
  zero_mem' := by
    intro c d f x
    simp
  one_mem' := by
    intro c d f x
    rfl
  add_mem' := by
    intro a b ha hb c d f x
    change T.map f (a c x + b c x) = a d (T.map f x) + b d (T.map f x)
    rw [map_add, ha, hb]
  mul_mem' := by
    intro a b ha hb c d f x
    change T.map f (a c (b c x)) = a d (b d (T.map f x))
    rw [ha, hb]
  algebraMap_mem' := by
    intro r c d f x
    change T.map f (r • x) = r • T.map f x
    exact map_smul _ _ _

/-- A finite object set and finite vertex spaces give a finite endomorphism algebra.
No finiteness of the hom sets is needed. -/
theorem compatibleEnd_finiteDimensional (T : C ⥤ ModuleCat.{u} K)
    [Finite C] [∀ c, FiniteDimensional K (T.obj c)] :
    FiniteDimensional K (compatibleEnd K C T) := by
  sorry

/-- Edge compatibility is precisely naturality on the path-category representation.
This is a proposition asserting existence of the native algebra equivalence, rather than
an admitted equivalence used to manufacture subsequent carriers. -/
theorem compatibleEnd_equiv_end (T : C ⥤ ModuleCat.{u} K) :
    Nonempty ((compatibleEnd K C T) ≃ₐ[K] CategoryTheory.End T) := by
  sorry

/-- Evaluation of the zero compatible family, one of two lightweight prototype checks. -/
example (T : C ⥤ ModuleCat.{u} K) (c : C) (x : T.obj c) :
    ((0 : compatibleEnd K C T).val c) x = 0 := rfl

/-- The unit must act by the identity, with the same multiplication order as native End. -/
example (T : C ⥤ ModuleCat.{u} K) (c : C) (x : T.obj c) :
    ((1 : compatibleEnd K C T).val c) x = x := rfl

/-! The existing homological boundary is the input to the cohomological adapter.
The new mathematical target is its dualization, finite Betti comparison and algebraic
specialization, not another long exact sequence of topological triples. -/

example (T : TauCeti.TopTriple.{u}) :
    (ShortComplex.mk _ _
      (T.singularHomologyδ_comp (ModuleCat.of K K) 1 0 rfl)).Exact :=
  T.singularHomology_exact_inner (ModuleCat.of K K) 1 0 rfl

example {T T' : TauCeti.TopTriple.{u}} (f : T ⟶ T') :
    T.singularHomologyδ (ModuleCat.of K K) 1 0 rfl ≫
        TopPair.singularHomologyMap (TauCeti.TopTriple.innerPair.map f)
          (ModuleCat.of K K) 0 =
      TopPair.singularHomologyMap (TauCeti.TopTriple.outerPair.map f)
          (ModuleCat.of K K) 1 ≫
        T'.singularHomologyδ (ModuleCat.of K K) 1 0 rfl :=
  TauCeti.TopTriple.singularHomologyδ_naturality f (ModuleCat.of K K) 1 0 rfl

/-! The finite-comodule tensor carrier already exists; MC.5 supplies its coefficient bialgebra. -/

example (A : Type u) [Ring A] [Bialgebra K A] :
    MonoidalCategory (TauCeti.FGComoduleCat.{u, u, u} K A) := inferInstance

example (A : Type u) [Ring A] [Bialgebra K A] :
    TauCeti.FGComoduleCat.{u, u, u} K A := TauCeti.FGComoduleCat.tensorUnit K A

end

end TauCetiRoadmap.MotivesAndAlgebraicCycles.Nori
