/-
Suggested forms for MC.0, the pointed curve moduli problem.

This file is not the roadmap and is not exhaustive. The reader document
StableReductionPartII--MC.0.md is definitive. These statements suggest Lean forms
so contributors and reviewers can converge on names and signatures.

Only the raw scheme/slice part of Universal.sectionEquiv is statable at the pins.
The geometric targets below remain in the reader document under WORKERS.md's
2026-10-12 shape rule. No moduli object, genus predicate, dualizing construction,
or descent proof is replaced by an arbitrary proposition or a data stub.

Omission inventory (identifiers have prefix StableReductionPartII:MC.0/):
* pointed-approximation: finite diagrams of geometric pointed families are absent.
* arbitrary-base-genus: the required relative derived cohomology interface is absent.
* arbitrary-base-duality: LogDualizing.omega, markingCartier, line, baseChange,
  mapIso, noetherianComparison, smoothComparison, componentDegree and ample_iff;
  tests rationalThree, rationalTwo, fourPointBoundary, selfNodeFlags and
  nonflatBaseChange require geometric curve and relative duality carriers.
* native-family-realization: Moduli.obj, isoEquiv, pullback, pullbackId,
  pullbackComp, smoothInclusion, geometricPoints and noetherianComparison;
  tests ellipticInvolution, orderedTriple, noninvertibleArrow, emptyBase and
  markingBaseChange require actual family predicates, not arbitrary Cat objects.
* polarized-descent-comparison: the geometric moduli pseudofunctor and the
  canonical polarization cocycle cannot yet be named at the pins.
* universal-evaluation: Universal.fiberEquivalence, marking, markingPullback,
  projectionProperties, baseChange and smoothRestriction; tests nodeAllowed,
  collisionAllowed, nodalProjection, markingPullbackTest and identifiedFibre
  require the actual extra-section moduli object. The sectionEquiv_spec below
  expresses only its raw slice universal property, not these geometric targets.
* smooth-base-restriction: the smooth and stable moduli carriers are absent.

The parent owned definition StableReductionPartII:key/moduli-curves and the
parent pullback-coherence, effective-descent and universal-curve identifiers are
retained. MC.2 supplies rationalThreeEquivalence, crossRatio, stableStackProperties,
universalForgetful and forgetStabilize, with the sample tests routed in the reader.
Elaboration certifies only the statements present here; proofs remain open.
-/
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

namespace TauCeti.PointedCurves.Universal

variable {C S T : Scheme.{u}} (f : C ⟶ S) (u : T ⟶ S)

/-- The native scheme/slice statement underlying unrestricted universal evaluation.
The section on the pullback is sent to its composite with the first projection.
There is no smoothness or disjointness condition on the section. -/
theorem sectionEquiv_spec :
    ∃ e : (Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f)) ≃
        { a : T ⟶ C // a ≫ f = u },
      ∀ s, (e s).val = s.left ≫ pullback.fst f u := by
  sorry

/-- In particular an existing marking is an allowed extra section after base change. -/
example (σ : S ⟶ C) (hσ : σ ≫ f = 𝟙 S) :
    ∃ s : Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f),
      s.left ≫ pullback.fst f u = u ≫ σ := by
  sorry

/-- Any map into the total curve gives an extra section after its own base change.
This allows a node-valued map as soon as a geometric nodal family is supplied. -/
example (a : T ⟶ C) :
    ∃ s : Over.mk (𝟙 T) ⟶ (Over.pullback (a ≫ f)).obj (Over.mk f),
      s.left ≫ pullback.fst f (a ≫ f) = a := by
  sorry

/-- A fixed identification with the pulled-back family leaves no freedom in a section
once its evaluation map is fixed. This is the raw discreteness check for the
represented two-fibre product; it does not erase moduli automorphisms. -/
example (s t : Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f))
    (h : s.left ≫ pullback.fst f u = t.left ≫ pullback.fst f u) :
    s = t := by
  sorry

end TauCeti.PointedCurves.Universal
