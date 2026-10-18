import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Separated

/-!
# Stable compactifications and Torelli: native scheme milestone

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/StableReductionPartII--MC.6.md`. These signatures
suggest forms for milestones expressible at the pinned libraries; discharging
them finishes neither the layer nor the roadmap.

The scheme part of `MC.6/stable-input-compactification` retains both the base
coordinate and the moduli-cover coordinate. The native `pullback.lift` already
provides that map. There is no replacement definition here. Finiteness follows
from the existing `IsFinite.of_comp` theorem and separated base change.

README-only targets (their carriers are not available together at the pins):
* stable-input-compactification: the stable-family and relative-normalization
  construction in the finite-cover field, beyond this native scheme milestone;
* torelli-family-composition: relative Picard, principal polarization and level;
* regular-component-hodge-pullback: Hodge bundles on the fine moduli scheme;
* signed-level-fibres: strong Torelli and its geometric point count;
* stable-picard-atlas-comparison: the stable Picard functor and atlas descent;
* boundary-abelian-part: the normalization exact sequence and product polarization;
* minimal-torelli-descent: all-characteristic minimal compactified Torelli;
* minimal-hodge-power: the positive-power comparison on the stable stack;
* maximal-variation-generic-finiteness: the coarse classifying map and its image;
* hodge-nef-big-application: numerical positivity of the Hodge determinant;
* finite-cover-hodge-descent: coherent Hodge pullback and numerical transfer;
* arbitrary-field-hodge-positivity: geometric components over imperfect fields.

The reader states all hypotheses, APIs, checks and supplier proof leaves.
No generic placeholder for these objects is introduced in this file.
-/

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

namespace TauCetiRoadmap.StableReductionPartII.MC6

universe u

/-- Native scheme milestone in retaining the base in graph closure.
The separated map is the moduli-cover coordinate `v`; its base change to `S`
is the first projection. Finiteness of `q` then implies finiteness of the map
remembering both `q` and `r`. This does not assert that the map is a monomorphism. -/
theorem finite_retainedBaseMap
    {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v)
    [IsFinite q] [IsSeparated v] :
    IsFinite (pullback.lift q r h) := by
  sorry

-- Keeping the first coordinate recovers the original map to the base.
example {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v) :
    pullback.lift q r h ≫ pullback.fst s v = q := by
  sorry

-- Keeping the second coordinate recovers the universal-family cover map.
example {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v) :
    pullback.lift q r h ≫ pullback.snd s v = r := by
  sorry

-- If the cover coordinate is the base itself, the retained map still remembers q.
example {W S B : Scheme.{u}} (s : S ⟶ B) (q : W ⟶ S) :
    pullback.lift q (q ≫ s) (by simp) ≫ pullback.fst s (𝟙 B) = q := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC6
