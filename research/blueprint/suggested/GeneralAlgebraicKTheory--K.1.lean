import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap

/-!
This file is not the roadmap and is not exhaustive. The definitive specification
is `research/blueprint/readmes/GeneralAlgebraicKTheory--K.1.md`, together with its
packet. These examples suggest Lean forms over existing carriers so contributors
and reviewers converge on names and signatures.

The Q-construction, higher K-spaces, Waldhausen constructions and their comparisons
remain reader targets. Their carriers are not available at the pins, so no
signatures for those objects appear here. The examples below verify the existing
exact-category substrate used by K.1 and K.2:plus; they implement no higher K-theory.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Independent fix-review continuation: Codex codex-6SZXyE, 2026-10-19.
-/

noncomputable section
namespace TauCeti.HigherK
open CategoryTheory CategoryTheory.Limits

universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall.{w} C]

-- These examples use existing declarations only; they are not higher K proofs.
example (E : ExactStructure C) (S : ShortComplex C) (hS : E.Conflation S) :
    (ExactK0.of S.X₂ : ExactK0 E) = ExactK0.of S.X₁ + ExactK0.of S.X₃ :=
  ExactK0.of_conflation hS

example (R : Type u) [Ring R] :
    finiteProjectiveModulesExactStructure R =
      ExactStructure.split (finiteProjectiveModules R).FullSubcategory :=
  finiteProjectiveModulesExactStructure_eq_split R

example (R : Type u) [Ring R]
    (S : ShortComplex (finiteProjectiveModules R).FullSubcategory) :
    (finiteProjectiveModulesExactStructure R).Conflation S ↔
      (S.map (finiteProjectiveModules R).ι).ShortExact :=
  finiteProjectiveModulesExactStructure_conflation_iff R S


end TauCeti.HigherK
