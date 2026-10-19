import Mathlib
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Monoidal
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor

/-!
# MC.6: motivic Galois groups and periods

These are suggested forms, not an exhaustive checklist. The reader is definitive.
Heavy neutral/relative reconstruction, Nori categories and comparison algebras are
README targets: their carriers are not supplied at the pins. No replacement data
are admitted here. This file gives the actual coefficient functional, its small
checks, and the rigidity-to-antipode milestone on existing comodule carriers.

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
-/

open CategoryTheory

namespace MC6Suggested

universe u

variable {k V W : Type u} [Field k]
variable [AddCommGroup V] [Module k V] [AddCommGroup W] [Module k W]

/-- The finite comparison coefficient used in the retained comparison-algebra
and period-space targets: a vector belongs to the source and a covector to the
target. It becomes a period only after evaluating at the comparison map. -/
def comparisonCoefficient (v : V) (ell : Module.Dual k W) :
    Module.Dual k (V →ₗ[k] W) where
  toFun f := ell (f v)
  map_add' f g := by simp
  map_smul' r f := by simp

-- A zero source vector has zero coefficient for every covector.
example (ell : Module.Dual k W) : comparisonCoefficient (0 : V) ell = 0 := by
  ext f
  simp [comparisonCoefficient]

-- The scalar comparison x ↦ 3x evaluated on source vector 2 has coefficient 6.
example : comparisonCoefficient (2 : ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    (3 • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = 6 := by
  norm_num [comparisonCoefficient]

-- Off-diagonal coefficients distinguish the source vector from the covector:
-- the map (x,y) ↦ (y,0), the vector (0,1), and first-coordinate covector give 1.
example : comparisonCoefficient (k := ℚ) ((0, 1) : ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ)
    ((LinearMap.snd ℚ ℚ ℚ).prod (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ)) = 1 := by
  norm_num [comparisonCoefficient]

/-- Retained target MC.6/rigid-bialgebra-is-hopf (HMS Appendix B.7; DM 2.11).
The two identities concern the supplied bialgebra's own multiplication,
comultiplication and counit. No HopfAlgebra instance is assumed, and the existing
Hopf-to-rigidity instance cannot prove this converse circularly. -/
theorem exists_antipode_of_rigid_finite_comodules
    (B : Type u) [CommRing B] [Bialgebra k B]
    [RigidCategory (TauCeti.FGComoduleCat.{u, u, u} k B)] :
    ∃ S : B →ₗ[k] B,
      LinearMap.mul' k B ∘ₗ S.rTensor B ∘ₗ Coalgebra.comul =
        (Algebra.linearMap k B) ∘ₗ Coalgebra.counit ∧
      LinearMap.mul' k B ∘ₗ S.lTensor B ∘ₗ Coalgebra.comul =
        (Algebra.linearMap k B) ∘ₗ Coalgebra.counit := by
  sorry

-- The known-Hopf comparison is an import, not an arbitrary-category theorem.
-- Its assumptions and universe lift are deliberately visible in the library.
#check TauCeti.Tannaka.tensorAutFunctor
#check TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor

end MC6Suggested
