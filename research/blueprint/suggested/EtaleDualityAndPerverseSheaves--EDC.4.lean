import Mathlib

/-!
# EtaleDualityAndPerverseSheaves: representative target signatures

The roadmap document is definitive. This file is not exhaustive: it records only light
definitions and representative signatures expressible using the pinned Mathlib APIs.
The geometric cohomology groups, Gysin maps and enhanced coefficient categories are targets
in the document. Here the vanishing and restricted spaces use native linear-map kernels
and ranges. Their orthogonality milestone explicitly retains the adjunction and perfectness
inputs that Poincaré duality must supply. The finite-field example detects a false assertion
that these spaces always give complementary summands.
-/

namespace TauCetiRoadmap.EtaleDualityAndPerverseSheaves

/-! ## Layer EDC.4: weak Lefschetz, projective bundles and blow-ups -/

-- Native affine geometry used for the hyperplane complement.
#check AlgebraicGeometry.isClosedImmersion_iff_isAffineHom
#check AlgebraicGeometry.isAffine_of_isAffineHom
#check AlgebraicGeometry.Proj.basicOpenIsoSpec

namespace LinearModels

variable {E U V W : Type*} [Field E]
variable [AddCommGroup U] [Module E U] [AddCommGroup V] [Module E V]
variable [AddCommGroup W] [Module E W]

/-- The linear model of the vanishing space is the kernel of the specified Gysin map. -/
def vanishingSubspace (gysin : V →ₗ[E] W) : Submodule E V :=
  LinearMap.ker gysin

/-- The restricted space is the range of the specified restriction map. -/
def restrictedSubspace (restriction : U →ₗ[E] V) : Submodule E V :=
  LinearMap.range restriction

/-- The primitive space is the kernel of the specified power of the Lefschetz operator.
The geometric exponent and Tate twist are specified in the roadmap document. -/
def primitiveSubspace (lefschetzPower : V →ₗ[E] W) : Submodule E V :=
  LinearMap.ker lefschetzPower

/-- Adjointness and separation on the target of Gysin identify the vanishing space
with the orthogonal of the restricted space. This is the linear part of the geometric
Poincaré-duality argument; it does not assume a direct-sum decomposition. -/
theorem vanishingSubspace_eq_orthogonal
    (restriction : U →ₗ[E] V) (gysin : V →ₗ[E] W)
    (pairX : U →ₗ[E] W →ₗ[E] E) (pairY : LinearMap.BilinForm E V)
    (hX : ∀ w, (∀ u, pairX u w = 0) → w = 0)
    (hAdjoint : ∀ u v, pairY (restriction u) v = pairX u (gysin v)) :
    vanishingSubspace gysin = pairY.orthogonal (restrictedSubspace restriction) := by
  sorry

/-- Finite-dimensional perfect reflexive duality gives the reverse orthogonality.
Perfectness alone does not assert that the two subspaces have zero intersection. -/
theorem restrictedSubspace_eq_orthogonal [FiniteDimensional E V]
    (restriction : U →ₗ[E] V) (gysin : V →ₗ[E] W)
    (pairX : U →ₗ[E] W →ₗ[E] E) (pairY : LinearMap.BilinForm E V)
    (hX : ∀ w, (∀ u, pairX u w = 0) → w = 0)
    (hY : pairY.Nondegenerate) (hRefl : pairY.IsRefl)
    (hAdjoint : ∀ u v, pairY (restriction u) v = pairX u (gysin v)) :
    restrictedSubspace restriction = pairY.orthogonal (vanishingSubspace gysin) := by
  sorry

-- Zero and identity maps distinguish kernels from ranges in both directions.
example : vanishingSubspace (0 : V →ₗ[E] W) = ⊤ := by sorry
example : vanishingSubspace (LinearMap.id : V →ₗ[E] V) = ⊥ := by sorry
example : restrictedSubspace (0 : U →ₗ[E] V) = ⊥ := by sorry
example : restrictedSubspace (LinearMap.id : V →ₗ[E] V) = ⊤ := by sorry
example : primitiveSubspace (0 : V →ₗ[E] W) = ⊤ := by sorry
example : primitiveSubspace (LinearMap.id : V →ₗ[E] V) = ⊥ := by sorry

-- In the quadric-surface test the ruling coordinates give restriction a ↦ (a,a)
-- and Gysin (x,y) ↦ x+y. Over F₂ their nonzero diagonal is both image and kernel.
example : ∃ v : Fin 2 → ZMod 2,
    v ≠ 0 ∧ (∃ a : ZMod 2, v = fun _ => a) ∧ v 0 + v 1 = 0 := by
  sorry

end LinearModels

/-! ## Layer EDC.6: coefficient and comparison interfaces

The normalized-system category, pro-étale realization, analytic comparison and diamond
right-adjoint recovery require the enhanced geometric carriers specified in the roadmap.
They have no declarations here until those carriers are available.
-/

end TauCetiRoadmap.EtaleDualityAndPerverseSheaves
