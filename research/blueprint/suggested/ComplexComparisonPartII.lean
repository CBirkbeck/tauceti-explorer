import Mathlib.Geometry.RingedSpace.LocallyRingedSpace
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import TauCeti.Topology.Sheaves.Flasque

/-!
Suggested interfaces for a partial fix, not an implementation.
Pinned sources: Mathlib 082e2d3, Tau Ceti f790474.
No build at both pins was available; this file has not been elaborated.

The new carriers have not been supplied. These typed signatures are comments,
not artificial definitions of analytic spaces or cohomology as propositions.
The companion packet gives source passages, APIs, tests and unresolved leaves.

With FiniteTypeCScheme and ComplexAnalyticSpace supplied by the tracked PR196
integration, the intended signatures include:

  Analytification.functor : FiniteTypeCScheme ⥤ ComplexAnalyticSpace
  Analytification.homEquiv (X : FiniteTypeCScheme) (T : ComplexAnalyticSpace) :
    (T ⟶ Analytification.functor.obj X) ≃
      (T.toLocallyRingedSpace ⟶ X.toLocallyRingedSpace)
  Analytification.fiberProductIso (f : X ⟶ Z) (g : Y ⟶ Z) :
    Analytification.functor.obj (pullback f g) ≅
      pullback (Analytification.functor.map f) (Analytification.functor.map g)

The second Hom must be restricted to morphisms over C in the final carrier API.
Its domain is analytic spaces with quotient sheaves retaining nilpotents.

  CoherentAnalytification.functor (X : FiniteTypeCScheme) :
    CoherentModules X ⥤ CoherentModules (Analytification.functor.obj X)
  CoherentComparison.theta (f : X ⟶ Y) (F : CoherentModules X) (q : ℕ) :
    analytify (higherDirectImage f q F) ⟶
      higherDirectImage (Analytification.functor.map f) q (analytify F)

For proper f this specific comparison is an isomorphism, with no projectivity
or reducedness assumption. The final API must carry the proof of properness
and the locally finite-type complex hypotheses. The base-change and projection
formula statements must retain their independently established hypotheses.

  BettiComparison.addEquiv (T : TopCat) (A : AddCommGrpCat) (q : ℕ)
    (hT : SemiLocallyContractible T) :
    CategoryTheory.Sheaf.H (constantAbelianSheaf T A) q ≃+
      SingularCohomology T A q

This is additive. Ring products, coefficient maps and naturality require actual
chain comparisons; complex comparison does not supply an integral lattice.

Required higher-level tests, to be elaborated after the carriers are supplied:
* The dual-number point retains C[e]/(e^2), including its nonzero nilpotent.
* Coherent pullback preserves O_X, free modules and the length-two quotient.
* theta^0 for the identity is the identity; for the dual-number proper point it
  identifies the length-two module; projective twists compare the named maps.
* The curve completion is imported: A^1 embeds in P^1 with one-point complement.
* The Z→Q→C Betti maps commute with comparison, including degree zero.

The three executable examples below check only the reused baseline interface.
They are not tests of the unavailable analytic or singular-cohomology carriers.
-/

open CategoryTheory TopologicalSpace

universe u

namespace ComplexComparisonRepair

variable {X : TopCat.{u}}

example (F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u})
    [TopCat.Presheaf.IsFlasque F.obj] (q : ℕ) :
    Subsingleton (CategoryTheory.Sheaf.H.{u} F (q + 1)) := by
  exact TauCeti.Topology.subsingleton_H_succ_of_isFlasque F q

example (F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u})
    (q : ℕ) (x : CategoryTheory.Sheaf.H.{u} F q) :
    CategoryTheory.Sheaf.H.map (𝟙 F) q x = x := by
  simp

example {F G K : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}}
    (f : F ⟶ G) (g : G ⟶ K) (q : ℕ)
    (x : CategoryTheory.Sheaf.H.{u} F q) :
    CategoryTheory.Sheaf.H.map (f ≫ g) q x =
      CategoryTheory.Sheaf.H.map g q (CategoryTheory.Sheaf.H.map f q x) := by
  rw [CategoryTheory.Sheaf.H.map_comp_apply]

end ComplexComparisonRepair
