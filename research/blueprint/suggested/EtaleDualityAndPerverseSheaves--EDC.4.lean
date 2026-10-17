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

The weak Lefschetz theorem for complexes reduces, after compact-support vanishing on the
affine complement, to the linear algebra of an exact sequence; that step is stated below on
native modules. The primitive middle Betti number of a smooth hypersurface is a real-bodied
integer function whose small values pin its sign convention.
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

/-- The localization step of weak Lefschetz in degree `n`: in an exact sequence
`H^n_c(U) → H^n_c(X) → H^n_c(Y)`, vanishing of the compactly supported group of the affine
complement makes restriction injective. -/
theorem restriction_injective_of_exact {R A B C : Type*} [CommRing R]
    [AddCommGroup A] [Module R A] [AddCommGroup B] [Module R B]
    [AddCommGroup C] [Module R C]
    (extend : A →ₗ[R] B) (restrict : B →ₗ[R] C)
    (hExact : Function.Exact extend restrict) (hA : ∀ a : A, a = 0) :
    Function.Injective restrict := by
  sorry

/-- Below degree `n` both neighbouring compactly supported groups of the affine complement
vanish, and restriction is bijective. -/
theorem restriction_bijective_of_exact {R A B C D : Type*} [CommRing R]
    [AddCommGroup A] [Module R A] [AddCommGroup B] [Module R B]
    [AddCommGroup C] [Module R C] [AddCommGroup D] [Module R D]
    (extend : A →ₗ[R] B) (restrict : B →ₗ[R] C) (boundary : C →ₗ[R] D)
    (hExact₁ : Function.Exact extend restrict) (hExact₂ : Function.Exact restrict boundary)
    (hA : ∀ a : A, a = 0) (hD : ∀ d : D, d = 0) :
    Function.Bijective restrict := by
  sorry

-- Without the vanishing of the outer group, restriction can fail to be injective:
-- the identity followed by the zero map is exact, and the zero map on ℚ is not injective.
example : Function.Exact (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (0 : ℚ →ₗ[ℚ] ℚ) ∧
    ¬ Function.Injective (0 : ℚ →ₗ[ℚ] ℚ) := by
  sorry

end LinearModels

/-! ## Layer EDC.6: coefficient and comparison interfaces

The normalized-system category, pro-étale realization, analytic comparison and diamond
right-adjoint recovery require the enhanced geometric carriers specified in the roadmap.
They have no declarations here until those carriers are available. The one numerical
invariant below, the primitive middle Betti number of a smooth hypersurface, needs no carrier.
-/

/-- The primitive middle Betti number `((d - 1)^(m + 2) + (-1)^m (d - 1)) / d` of a smooth
hypersurface of degree `d` and dimension `m ≥ 1`; the division is exact. -/
def hypersurfacePrimitiveRank (d m : ℕ) : ℤ :=
  (((d : ℤ) - 1) ^ (m + 2) + (-1) ^ m * ((d : ℤ) - 1)) / d

-- Plane conic and plane cubic: genus zero and genus one.
example : hypersurfacePrimitiveRank 2 1 = 0 := by norm_num [hypersurfacePrimitiveRank]
example : hypersurfacePrimitiveRank 3 1 = 2 := by norm_num [hypersurfacePrimitiveRank]
-- Quadric, cubic and quartic surfaces: b₂ = 2, 7 and 22, so primitive ranks 1, 6 and 21.
example : hypersurfacePrimitiveRank 2 2 = 1 := by norm_num [hypersurfacePrimitiveRank]
example : hypersurfacePrimitiveRank 3 2 = 6 := by norm_num [hypersurfacePrimitiveRank]
example : hypersurfacePrimitiveRank 4 2 = 21 := by norm_num [hypersurfacePrimitiveRank]
-- The quintic threefold has b₃ = 204.
example : hypersurfacePrimitiveRank 5 3 = 204 := by norm_num [hypersurfacePrimitiveRank]

end TauCetiRoadmap.EtaleDualityAndPerverseSheaves
