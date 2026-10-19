import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.BicartesianSq
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.Tactic.NormNum

/-!
# The C_st-conjecture for dagger varieties — suggested Lean

This file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these examples suggest pinned conventions, so contributors and reviewers agree about the
existing carriers and signs. The baseline is Mathlib `082e2d3` and Tau Ceti `f790474`.

WORKERS.md's fixed roadmap shape of 12 October 2026 permits only light real-bodied
definitions on existing carriers and theorem statements expressible at the pins.
The actual dagger cohomology, filtered period modules over C, modified FF bundles,
reasonable period Pairs and natural Topological Vector Space/qBC functor categories
are absent from the audited interfaces. Their exact targets, APIs and tests belong
to the reader. No comparison theorem is represented here by an arbitrary carrier,
opaque placeholder, or assumed mathematical conclusion.

The examples below check existing period-ring carriers, the existing bicartesian
predicate, finite free module conventions, and the difference-map sign. They do not
encode any of the 46 new mathematical targets. No theory is developed in this file.
-/

noncomputable section

namespace TauCeti.DaggerCst

/-! ## CS.0: reuse the pinned period-ring carriers, with their actual assumptions -/

variable (R : Type*) [CommRing R] (p : ℕ) [Fact p.Prime]
  [Fact ¬IsUnit (p : R)] [IsAdicComplete (Ideal.span {(p : R)}) R]

example : CommRing (BDeRhamPlus R p) := inferInstance

example : CommRing (BDeRham R p) := by
  unfold BDeRham
  infer_instance

/-! ## CS.1: the square predicate is already in Mathlib -/

open CategoryTheory CategoryTheory.Limits
open ZeroObject

section Squares

variable {C : Type*} [Category C] [HasZeroObject C] [HasZeroMorphisms C]

example (X : C) :
    BicartesianSq (𝟙 X) (0 : X ⟶ 0) (0 : X ⟶ 0) (0 : (0 : C) ⟶ 0) :=
  BicartesianSq.of_isPullback_isPushout (IsPullback.zero_bot X) (IsPushout.zero_bot X)

example (X Y : C) [HasBinaryBiproduct X Y] :
    BicartesianSq biprod.fst biprod.snd (0 : X ⟶ 0) (0 : Y ⟶ 0) :=
  BicartesianSq.of_has_biproduct₁

example (X Y : C) [HasBinaryBiproduct X Y] :
    BicartesianSq (0 : 0 ⟶ X) (0 : 0 ⟶ Y) biprod.inl biprod.inr :=
  BicartesianSq.of_has_biproduct₂

end Squares

/-! The trivial rank-one point tests the sign of equation (6.16). -/

example : (1 : ℚ) - 1 = 0 := sub_self _

example : (1 : ℚ) + 1 ≠ 0 := by norm_num

/-! Smallness uses both freeness and finite generation, not just one of them. -/

example : Module.Free ℚ ℚ := inferInstance

example : Module.Finite ℚ ℚ := inferInstance

example : (ModuleCat.of ℚ ℚ : Type) = ℚ := rfl

/-!
## Mathematical target coverage

CS.0: filtered-module-c, modified-bundle, acyclic-module-c, acyclicity-criteria,
bounded-period-spaces, eigenspace-generation and the three period-Hom comparisons.
CS.1: the genuine analytic cohomology package, smallness, fundamental square,
twist invariance, proper comparison and the Stein/affinoid cases.
CS.2: bundle-cohomology failure terms, qBC filtration, defect exact sequence,
height/equivalent criteria, and the qualified noncanonical splitting branch.
CS.3: products, algebraic analytifications, almost proper varieties and tubes.
CS.4: derived exhaustion descent, proper-factor Künneth and proper times Stein.
CS.5: arithmetic recovery with Galois structure, geometric natural-functor Hom,
and the qualified positive crystalline affinoid refinement.

Every target above requires a heavy carrier or comparison interface unavailable
at the pins. G-LEAN in the packet records this coverage limit explicitly.
-/

end TauCeti.DaggerCst
