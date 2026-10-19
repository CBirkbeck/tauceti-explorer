import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive; these statements suggest interfaces over carriers available at the
pinned commits. They do not claim an implementation of the roadmap.

RJ.2/two-affine-cohomology: the additive H¹ comparison can already be stated
using native cohomology and its restriction maps. The reader gives the affine
case, the R-module refinement, naturality, and the worked O(-2) calculation.
Current affine acyclicity discharges the two vanishing hypotheses in that case.

The scheme-valued Picard and Néron targets require theory absent at the pins.
Their definitions, APIs and Checks remain in the reader document.
-/

open CategoryTheory Limits TopologicalSpace AlgebraicGeometry
open TauCeti.AlgebraicGeometry.Scheme.Modules

universe u

namespace RelativeJacobiansAndIntegralCurveModels

/-- The difference of the restriction maps has H¹ of the union as its cokernel
when the two opens have vanishing H¹. This uses actual sheaf cohomology. -/
theorem h1_cokernel_of_two_opens {X : Scheme.{u}} (M : X.Modules)
    (U V : Opens X)
    (hU : Subsingleton (cohomologyOn M 1 U))
    (hV : Subsingleton (cohomologyOn M 1 V)) :
    Nonempty (cokernel
      (biprod.desc (cohomologyOnRes M 0 (inf_le_left : U ⊓ V ≤ U))
        (-cohomologyOnRes M 0 (inf_le_right : U ⊓ V ≤ V))) ≅
      cohomologyOn M 1 (U ⊔ V)) := by
  sorry

end RelativeJacobiansAndIntegralCurveModels
