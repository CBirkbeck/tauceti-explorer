import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.Data.ZMod.Basic

/-!
# MC.3: local algebra for clutching and the smoothing conormal

The accompanying README is the definitive roadmap. This file records suggested forms
using carriers that exist at the pinned libraries. Each `sorry` is an admitted
example, not a formalisation claim. There are no axioms for moduli stacks,
nodal families, partial normalization or their line bundles: those are README targets.

The two abbreviations below are ordinary polynomial quotients. They serve the local
calculation in `MC.3/persistent-node-incidence`; they do not define a nodal family.
Current Tau Ceti already has `NodeAlgebra`, `NodeAlgebra.jacobianQuotientEquiv`
and `NodeAlgebra.singularLocusIso` (a91d3aaf). Those modules are absent at f790474.
These are pinned-presentation examples, not targets to redevelop that existing API.
The tensor examples check the unsigned transition convention of
`MC.3/smoothing-conormal-descent` using Mathlib's existing symmetry and map.
-/

namespace TauCetiRoadmap.StableReductionPartII.MC3

open MvPolynomial
open scoped TensorProduct

universe u v w

noncomputable section

/-- The ring of the chart `xy = q`, over an arbitrary commutative ring. -/
abbrev NodeChart (R : Type u) [CommRing R] (q : R) :=
  MvPolynomial (Fin 2) R ⧸ Ideal.span {X 0 * X 1 - C q}

/-- The two branch coordinates in the chart. -/
abbrev branchCoordinate (R : Type u) [CommRing R] (q : R) (i : Fin 2) :
    NodeChart R q :=
  Ideal.Quotient.mk (Ideal.span {X 0 * X 1 - C q}) (X i)

/-- The Jacobian singular scheme has base ring `R/(q)`, including nilpotent bases. -/
example (R : Type u) [CommRing R] (q : R) :
    Nonempty ((NodeChart R q ⧸
      Ideal.span {branchCoordinate R q 0, branchCoordinate R q 1}) ≃ₐ[R]
        (R ⧸ Ideal.span {q})) := by
  sorry

/-- A persistent split node has one copy of the base in its singular scheme. -/
example (R : Type u) [CommRing R] :
    Nonempty ((NodeChart R 0 ⧸
      Ideal.span {branchCoordinate R 0 0, branchCoordinate R 0 1}) ≃ₐ[R] R) := by
  sorry

/-- A unit smoothing parameter leaves no singular scheme. -/
example (R : Type u) [CommRing R] (q : R) (hq : IsUnit q) :
    Subsingleton (NodeChart R q ⧸
      Ideal.span {branchCoordinate R q 0, branchCoordinate R q 1}) := by
  sorry

-- Nonlinear changes of node charts and geometric atlas descent are README targets.
-- These examples check only their induced action on the two cotangent factors.
section TensorTransitions

variable (R : Type u) [CommRing R]
variable (M : Type v) (N : Type w)
variable [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- The multiplier of the conormal generator is the product of the two slopes.
example (a b : Rˣ) (dx : M) (dy : N) :
    TensorProduct.map ((a : R) • (LinearMap.id : M →ₗ[R] M))
      ((b : R) • (LinearMap.id : N →ₗ[R] N)) (dx ⊗ₜ[R] dy) =
        ((a : R) * (b : R)) • (dx ⊗ₜ[R] dy) := by
  sorry

-- Exchange has no sign; these are ungraded cotangent lines.
example (dx : M) (dy : N) :
    TensorProduct.comm R M N (dx ⊗ₜ[R] dy) = dy ⊗ₜ[R] dx := by
  sorry

-- Applying exchange twice is the identity.
example (z : M ⊗[R] N) :
    TensorProduct.comm R N M (TensorProduct.comm R M N z) = z := by
  sorry

-- The product transition law satisfies the ordinary cocycle identity.
example (f₁ f₂ : M →ₗ[R] M) (g₁ g₂ : N →ₗ[R] N) (z : M ⊗[R] N) :
    TensorProduct.map f₂ g₂ (TensorProduct.map f₁ g₁ z) =
      TensorProduct.map (f₂.comp f₁) (g₂.comp g₁) z := by
  sorry

end TensorTransitions

-- Characteristic two retains unsigned tensor symmetry. This says nothing about
-- exactness of invariants or replacing the constant exchange group by μ₂.
example :
    TensorProduct.comm (ZMod 2) (ZMod 2) (ZMod 2)
      ((1 : ZMod 2) ⊗ₜ[ZMod 2] (1 : ZMod 2)) =
        ((1 : ZMod 2) ⊗ₜ[ZMod 2] (1 : ZMod 2)) := by
  sorry

-- The zero-ring base has empty spectrum, as required by the incidence convention.
example : Subsingleton (NodeChart (ZMod 1) 0) := by
  sorry

end

end TauCetiRoadmap.StableReductionPartII.MC3
