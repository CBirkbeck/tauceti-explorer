/-
# Global centres and termination: suggested native statements

This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/AlgebraicModuliForArithmeticGeometry--R09.7c.md.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. They do not implement resolution.

The canonical target owners are R09.7 and R09.7a. Following the fixed WORKERS
shape, this file contains only a native endpoint consequence and a few examples.
The full invariant, selected centres, SNC subset conditions, finite blowup
towers, transforms, and coherent whole-tower comparisons are explicit imported
README targets. Their unavailable carriers are not replaced by proposition
fields or data definitions with missing bodies. In particular, the endpoint
statement below is weaker than the complete finite-resolution target.
-/

import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.Algebra.MvPolynomial.Eval

noncomputable section

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GlobalCentres

open CategoryTheory AlgebraicGeometry

/-- Native endpoint consequence of R09.7/local-isomorphism-resolution.
The finite selected tower and its local-isomorphism comparison remain part of
the full imported target. Over a characteristic-zero field, the smooth open is
the regular open for this finite-type input. -/
theorem localIsomorphismResolution_exists {k : Type} [Field k] [CharZero k]
    {X : Scheme} [IsReduced X] (s : X ⟶ Spec (.of k))
    [LocallyOfFiniteType s] [QuasiCompact s] :
    ∃ (Y : Scheme) (π : Y ⟶ X), Smooth (π ≫ s) ∧ QuasiCompact (π ≫ s) ∧
      IsProper π ∧ IsIso (π ∣_ s.smoothLocus) := by
  sorry

/-- Native pullback consistency for PrincipalizationTowerTests.nativePullback:
the total ideal along a two-step composite has the contravariant order. -/
example {X Y Z : Scheme} (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    I.comap (f ≫ g) = (I.comap g).comap f := by
  sorry

/-- Length-zero ideal bookkeeping for PrincipalizationTowerTests.unit. -/
example {M : Scheme} (I : M.IdealSheafData) :
    I.comap (𝟙 M) = I := by
  sorry

/-- Total-transform chart check for (x²y³), with x=u and y=uv.
The total exponents remain visible; reduced support loses this information. -/
example :
    let u : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let v : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let chart := MvPolynomial.eval₂Hom
      (MvPolynomial.C : ℚ →+* MvPolynomial (Fin 2) ℚ)
      (fun i : Fin 2 => if i = 0 then u else u * v)
    chart (u ^ 2 * v ^ 3) = u ^ 5 * v ^ 3 := by
  sorry

/-- Cusp chart: total equation u²(v²-u); its strict factor is v²-u.
The equation is a native polynomial check, not a substitute strict-transform
construction or a proof of the SNC endpoint. -/
example :
    let u : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let v : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let chart := MvPolynomial.eval₂Hom
      (MvPolynomial.C : ℚ →+* MvPolynomial (Fin 2) ℚ)
      (fun i : Fin 2 => if i = 0 then u else u * v)
    chart (v ^ 2 - u ^ 3) = u ^ 2 * (v ^ 2 - u) := by
  sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.GlobalCentres
