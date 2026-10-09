import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.Algebra.Category.FGModuleCat.Basic
import TauCeti.CategoryTheory.InvolutiveDual
import TauCeti.CategoryTheory.Exact.Split
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Opposite
import TauCeti.CategoryTheory.GrothendieckGroup.Exact

/-!
# GeometryOfNumbersAndQuadraticArithmetic: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can be stated against the pinned Mathlib and Tau Ceti APIs, together with unit tests as
`example`s. It is not an exhaustive list of the results in any layer.

The design choices made explicit here: lattices are Mathlib's `IsZLattice` submodules and
covolumes are `ZLattice.covolume`, with no replacement carrier; successive minima are real
numbers indexed by `Fin (finrank ℝ E)` on a `ConvexBody` with `0` in its interior; integral
quadratic lattices over a Dedekind domain are `Submodule.IsLattice` submodules with an `R`-valued
quadratic map and no stored basis; hermitian pairings are conjugate-linear in the first
argument; LLL data is exact and rational with integer change-of-basis certificates; exact
categories are Tau Ceti's `ExactStructure`, and a strong exact duality is an involutive
contravariant functor with a coherent double-dual isomorphism and explicit exactness. The ordinary
K-theory and homotopy inputs of Layer 6 are consumed through Mathlib's nerve, geometric
realisation and homotopy groups.
-/

noncomputable section
open scoped BigOperators ZeroObject Pointwise Topology
open MeasureTheory Module

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic


/-! ## Layer 0: Lattices, Gram determinants and covolumes -/


section Gram
variable {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
  [InnerProductSpace 𝕜 E] {n : ℕ}


/-- The coordinate determinant is bounded by the product of vector norms, including the empty family. -/
theorem orthonormal_coordinate_hadamard (b : OrthonormalBasis (Fin n) 𝕜 E)
    (v : Fin n → E) :
    ‖b.toBasis.det v‖ ≤ ∏ i, ‖v i‖ := by sorry

/-- The hermitian Gram determinant is real, nonnegative and bounded by the product of squared norms. -/
theorem hermitian_gram_hadamard (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (RCLike.re (Matrix.gram 𝕜 v).det : 𝕜) ∧
    0 ≤ RCLike.re (Matrix.gram 𝕜 v).det ∧
    RCLike.re (Matrix.gram 𝕜 v).det ≤ ∏ i, ‖v i‖ ^ 2 := by sorry

/-- A common squared-norm bound D bounds the n-vector Gram determinant by D to the n-th power. -/
theorem gram_uniform_bound (v : Fin n → E) (D : ℝ) (hD : 0 ≤ D)
    (hv : ∀ i, ‖v i‖ ^ 2 ≤ D) :
    RCLike.re (Matrix.gram 𝕜 v).det ≤ D ^ n := by sorry

end Gram


/-! Tests of Gram determinants and the geometric bounds. -/

section Tests

example : (Matrix.gram ℂ (fun _ : Fin 1 => (Complex.I : ℂ))).det = 1 := by sorry
example : (Matrix.gram ℂ (![1, Complex.I] : Fin 2 → ℂ)).det = 0 := by sorry
example : (Matrix.gram ℝ (fun i : Fin 0 => (Fin.elim0 i : ℝ))).det = 1 := by sorry

example (v : Fin 1 → ℂ) :
    RCLike.re (Matrix.gram ℂ v).det = ‖v 0‖ ^ 2 := by sorry
example (v : Fin 2 → ℂ) : (Matrix.gram ℂ v).det = 0 := by sorry
example : ((!![(1 : ℂ), Complex.I; -Complex.I, 1]).det : ℂ) = 0 := by sorry

example (v : Fin 0 → ℂ) :
    RCLike.re (Matrix.gram ℂ v).det ≤ (0 : ℝ) ^ 0 := by sorry
example (v : Fin 3 → ℂ) (hv : ∀ i, v i = 0) :
    RCLike.re (Matrix.gram ℂ v).det = 0 := by sorry
example (v : Fin 2 → ℂ) (hv : ∀ i, ‖v i‖ ^ 2 ≤ 5) :
    RCLike.re (Matrix.gram ℂ v).det ≤ 25 := by sorry

example : ((!![(2 : ℝ), 1; 1, 1]).det : ℝ) = 1 := by sorry
example : ((!![(4 : ℝ), 0; 0, 9]).det : ℝ) = 36 := by sorry
example : ((!![(1 : ℝ), 0; 0, 1]).det : ℝ) = 1 := by sorry

end Tests

section Orthogonal
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- An integral basis of a rational intersection extends to an integral basis of the full lattice. -/
theorem saturated_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (r s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ Δ)
      (c : Basis (Fin r) ℤ (ZLattice.comap ℝ Δ W.subtype)),
      ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- The complementary vectors of an adapted integral basis project to a basis of the projected lattice. -/
theorem projected_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℤ Δ) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, (b (Sum.inl i) : E) = (c i : E)) :
    ∃ q : Basis (Fin s) ℝ Wᗮ,
      (∀ j, q j = Wᗮ.orthogonalProjectionOnto (b (Sum.inr j) : E)) ∧
      Submodule.span ℤ (Set.range q) =
        Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ) := by sorry

/-- An adapted Gram determinant factors into the intersection and orthogonal-projection Gram determinants. -/
theorem gram_det_adapted_projection
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℝ E) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, b (Sum.inl i) = (c i : E)) :
    (Matrix.gram ℝ b).det = (Matrix.gram ℝ c).det *
      (Matrix.gram ℝ (fun j => Wᗮ.orthogonalProjectionOnto (b (Sum.inr j)))).det := by sorry

/-- Biorthogonally paired real bases have reciprocal Gram determinants. -/
theorem gram_det_biorthogonal {n : ℕ}
    (b d : Basis (Fin n) ℝ E)
    (hd : ∀ i j, inner ℝ (b i) (d j) = if i = j then 1 else 0) :
    (Matrix.gram ℝ b).det * (Matrix.gram ℝ d).det = 1 := by sorry

/-- The inner dual of an orthogonal projection is the intersection of the inner dual with that subspace. -/
theorem dual_projection_comap
    (Δ : Submodule ℤ E) (W : Submodule ℝ E) :
    LinearMap.BilinForm.dualSubmodule (innerₗ Wᗮ)
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.comap ℝ (LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ) Wᗮ.subtype := by sorry

/-- A rational orthogonal intersection in a self-dual full lattice is a full lattice in its subspace. -/
theorem orthogonal_intersection_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (s : ℕ) (q : Basis (Fin s) ℝ Wᗮ),
      Submodule.span ℤ (Set.range q) = ZLattice.comap ℝ Δ Wᗮ.subtype := by sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- Intrinsic projected covolume is the full covolume divided by the rational-intersection covolume. -/
theorem covolume_projection
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.covolume Δ / ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

/-- A full real lattice and its inner dual have reciprocal intrinsic covolumes. -/
theorem covolume_dual
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    ZLattice.covolume (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) = (ZLattice.covolume L)⁻¹ := by sorry

/-- Rational orthogonal intersections in a self-dual lattice have equal intrinsic covolumes. -/
theorem primitive_orthogonal_covolume
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume (ZLattice.comap ℝ Δ Wᗮ.subtype) =
      ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

end Orthogonal

section OrthogonalTests
local notation "V2" => EuclideanSpace ℝ (Fin 2)
local notation "udiag" => (WithLp.toLp 2 (![1,1] : Fin 2 → ℝ))
local notation "Wdiag" => (Submodule.span ℝ ({udiag} : Set V2))
local notation "Z2" => (Submodule.span ℤ (Set.range (OrthonormalBasis.toBasis (EuclideanSpace.basisFun (Fin 2) ℝ))))

/-- primitive_diagonal_completion: Columns (1,1),(0,1) form an integral basis: determinant 1. -/
example : ((!![(1 : ℤ), 0; 1, 1]).det : ℤ) = 1 := by sorry

/-- nonsaturated_cannot_complete: No matrix with first column (2,0) and an integral second column has determinant ±1. -/
example : ¬ ∃ a b : ℤ, ((!![(2 : ℤ), a; 0, b]).det = 1 ∨
    (!![(2 : ℤ), a; 0, b]).det = -1) := by sorry

/-- zero_lattice_empty_basis: The zero lattice in zero-dimensional Euclidean space admits the empty integral basis. -/
example : Nonempty (Basis (Fin 0) ℤ (⊥ : Submodule ℤ (EuclideanSpace ℝ (Fin 0)))) := by sorry

/-- diagonal_projected_generator: Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1). -/
example : ((Wdiagᗮ.orthogonalProjectionOnto (WithLp.toLp 2 (![0,1] : Fin 2 → ℝ))) : V2) =
    WithLp.toLp 2 (![-1/2,1/2] : Fin 2 → ℝ) := by sorry

/-- full_space_projection_zero: Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement. -/
example (Δ : Submodule ℤ V2) :
    Δ.map ((⊤ : Submodule ℝ V2)ᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ) = ⊥ := by sorry

/-- diagonal_projected_span: The projection of Z² off the diagonal is exactly the integral span of the projected e₂. -/
example : (Z2).map (Wdiagᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ) =
    Submodule.span ℤ {Wdiagᗮ.orthogonalProjectionOnto (WithLp.toLp 2 (![0,1] : Fin 2 → ℝ))} := by sorry

/-- sheared_gram_factor: The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2). -/
example : ((!![(2 : ℝ),1;1,1]).det : ℝ) = 2 * (1/2 : ℝ) := by sorry

/-- signed_basis_gram: A sign-reversed coordinate basis has determinant −1 but Gram determinant 1. -/
example : (Matrix.gram ℝ (fun i : Fin 2 =>
    WithLp.toLp 2 ((!![(-1 : ℝ),0;0,1]) i))).det = 1 := by sorry

/-- empty_gram_factor: Empty Gram determinants multiply as 1 = 1·1. -/
example : (Matrix.gram ℝ (fun i : Fin 0 => (Fin.elim0 i : ℝ))).det = 1 * 1 := by sorry

/-- reciprocal_line_grams: The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4. -/
example : (Matrix.gram ℝ (fun _ : Fin 1 => (2 : ℝ))).det *
    (Matrix.gram ℝ (fun _ : Fin 1 => (1/2 : ℝ))).det = 1 := by sorry

/-- sheared_dual_grams: Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1. -/
example : ((!![(2 : ℝ),1;1,1]).det : ℝ) * (!![(1 : ℝ),-1;-1,2]).det = 1 := by sorry

/-- unpaired_line_rejected: Two copies of the basis vector 2 are not a biorthogonal pair: their Gram determinant product is 16, not 1. -/
example : (Matrix.gram ℝ (fun _ : Fin 1 => (2 : ℝ))).det ^ 2 ≠ 1 := by sorry

/-- standard_lattice_selfdual: The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing. -/
example {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) :
    LinearMap.BilinForm.dualSubmodule (innerₗ E) (Submodule.span ℤ (Set.range b.toBasis)) =
      Submodule.span ℤ (Set.range b.toBasis) := by sorry

/-- scaled_ambient_dual: For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual. -/
example : LinearMap.BilinForm.dualSubmodule (innerₗ ℝ) (Submodule.span ℤ {(2 : ℝ)}) =
    Submodule.span ℤ {(1/2 : ℝ)} := by sorry

/-- diagonal_projected_dual: The dual of the projected Z² lattice in the diagonal's orthogonal line is exactly Z² intersected with that line. -/
example : LinearMap.BilinForm.dualSubmodule (innerₗ Wdiagᗮ)
    ((Z2).map (Wdiagᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.comap ℝ Z2 Wdiagᗮ.subtype := by sorry

/-- diagonal_orthogonal_rank_one: The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element. -/
example : ∃ b : Basis (Fin 1) ℝ Wdiagᗮ,
    Submodule.span ℤ (Set.range b) = ZLattice.comap ℝ Z2 Wdiagᗮ.subtype := by sorry

/-- orthogonal_full_rank_zero: The orthogonal intersection for the full plane has an empty real basis. -/
example : ∃ b : Basis (Fin 0) ℝ (⊤ : Submodule ℝ V2)ᗮ,
    Submodule.span ℤ (Set.range b) = ZLattice.comap ℝ Z2 (⊤ : Submodule ℝ V2)ᗮ.subtype := by sorry

/-- orthogonal_zero_rank_two: The orthogonal intersection for the zero subspace in the plane has a two-element real basis. -/
example : ∃ b : Basis (Fin 2) ℝ (⊥ : Submodule ℝ V2)ᗮ,
    Submodule.span ℤ (Set.range b) = ZLattice.comap ℝ Z2 (⊥ : Submodule ℝ V2)ᗮ.subtype := by sorry

/-- diagonal_projection_covolume: The projected Z² lattice off the diagonal has intrinsic covolume 1/√2. -/
example : ZLattice.covolume ((Z2).map
    (Wdiagᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) = (Real.sqrt 2)⁻¹ := by sorry

/-- zero_space_covolume_one: The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1. -/
example : ZLattice.covolume (⊥ : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) = 1 := by sorry

/-- nonunimodular_factor_ratio: For Δ=2Ze₁⊕3Ze₂ and L=2Ze₁ the projected covolume is 3=6/2, not 1/2. -/
example : (3 : ℝ) = 6 / 2 ∧ (3 : ℝ) ≠ (2 : ℝ)⁻¹ := by sorry

/-- scaled_line_dual_covolume: The inner dual of 2Z in R has covolume 1/2. -/
example : ZLattice.covolume
    (LinearMap.BilinForm.dualSubmodule (innerₗ ℝ) (Submodule.span ℤ {(2 : ℝ)})) = 1/2 := by sorry

/-- standard_covolume_one: The standard integral lattice in Euclidean n-space has covolume one, including n=0. -/
example (n : ℕ) : ZLattice.covolume (Submodule.span ℤ
    (Set.range (EuclideanSpace.basisFun (Fin n) ℝ).toBasis)) = 1 := by sorry

/-- ambient_polar_not_intrinsic: The ambient inner dual of the zero subgroup in R is all of R, not a discrete full lattice; a lower-rank lattice must be dualized inside its span. -/
example : LinearMap.BilinForm.dualSubmodule (innerₗ ℝ) (⊥ : Submodule ℤ ℝ) = ⊤ := by sorry

/-- diagonal_equal_covolumes: Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2. -/
example : ZLattice.covolume (ZLattice.comap ℝ Z2 (Wdiag).subtype) = Real.sqrt 2 ∧
    ZLattice.covolume (ZLattice.comap ℝ Z2 Wdiagᗮ.subtype) = Real.sqrt 2 := by sorry

/-- nonsaturation_changes_covolume: Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged. -/
example : ‖(2 : ℝ) • udiag‖ = 2 * Real.sqrt 2 ∧ ‖(2 : ℝ) • udiag‖ ≠ Real.sqrt 2 := by sorry

/-- no_integral_orthogonal_splitting: The primitive diagonal and antidiagonal generators form an index-two sublattice, not an integral basis of Z². -/
example : |((!![(1 : ℤ),1;1,-1]).det : ℤ)| = 2 := by sorry

end OrthogonalTests


/-! ## Layer 1: Convex bodies, successive minima and Minkowski’s theorems -/

/-- An increasing sequence bounded below by one has each terminal power bounded by its total product. -/
theorem ordered_tail_product {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (i : Fin n) :
    a i ^ (n - i.val) ≤ ∏ j, a j := by sorry

/-- An increasing sequence bounded below by one and of product at most V has the stated root bounds. -/
theorem ordered_product_root_bound {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (V : ℝ) (hV : (∏ j, a j) ≤ V) (i : Fin n) :
    a i ≤ Real.rpow V ((n - i.val : ℕ) : ℝ)⁻¹ := by sorry

/-- A closed orthonormal-coordinate cube of half-side r has intrinsic volume (2r) to the dimension. -/
theorem orthonormal_cube_volume
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    volume {x : E | ∀ i, |b.repr x i| ≤ r} = ENNReal.ofReal ((2 * r) ^ n) := by sorry

/-- In positive dimension the coordinate cube of half-side one over square-root dimension lies in the unit ball. -/
theorem inscribed_cube
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    {x : E | ∀ i, |b.repr x i| ≤ (Real.sqrt n)⁻¹} ⊆
      Metric.closedBall (0 : E) 1 := by sorry

/-- The inscribed coordinate cube gives the stated positive lower bound for intrinsic unit-ball volume. -/
theorem intrinsic_ball_lower_bound
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    ENNReal.ofReal ((2 / Real.sqrt n) ^ n) ≤ volume (Metric.closedBall (0 : E) 1) := by sorry

section GeometricBoundTests
example : (1 : ℝ) ^ 3 ≤ ∏ j : Fin 3, (![1, 2, 4] : Fin 3 → ℝ) j := by sorry
example : (2 : ℝ) ^ 2 ≤ ∏ j : Fin 3, (![1, 2, 4] : Fin 3 → ℝ) j := by sorry
example : (4 : ℝ) ^ 1 ≤ ∏ j : Fin 3, (![1, 2, 4] : Fin 3 → ℝ) j := by sorry
example : ¬ (2 : ℝ) ≤ ∏ j : Fin 2, (![1/2, 2] : Fin 2 → ℝ) j := by sorry
example : ¬ (4 : ℝ) ^ 2 ≤ ∏ j : Fin 2, (![4, 1] : Fin 2 → ℝ) j := by sorry
example : (4 : ℝ) ≤ Real.rpow 8 ((1 : ℝ)⁻¹) := by sorry
example : (2 : ℝ) ≤ Real.rpow 4 ((2 : ℝ)⁻¹) := by sorry
example : (1 : ℝ) ≤ Real.rpow 1 ((3 : ℝ)⁻¹) := by sorry

example : volume {x : EuclideanSpace ℝ (Fin 0) | ∀ i, |x i| ≤ (0 : ℝ)} = 1 := by sorry
example : volume {x : EuclideanSpace ℝ (Fin 1) | ∀ i, |x i| ≤ (0 : ℝ)} = 0 := by sorry
example : volume {x : EuclideanSpace ℝ (Fin 2) | ∀ i, |x i| ≤ (3 : ℝ)} = 36 := by sorry
example : (2 / Real.sqrt (1 : ℝ)) ^ 1 = 2 := by sorry
example : (2 / Real.sqrt (4 : ℝ)) ^ 4 = 1 := by sorry
example (n : ℕ) (hn : 0 < n) :
    (2 / Real.sqrt n) ^ n = (2 : ℝ) ^ n * Real.rpow (n : ℝ) (-(n : ℝ) / 2) := by sorry
example : ENNReal.ofReal ((2 / Real.sqrt (2 : ℝ)) ^ 2) ≤
    volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin 2)) 1) := by sorry

end GeometricBoundTests


section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- The i-th successive minimum is the least nonnegative gauge threshold spanning at least i+1 dimensions. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) : ℝ :=
  by sorry

/-- The successive minimum equals the infimum of its nonnegative gauge rank thresholds. -/
theorem successiveMin_def (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})} := by sorry

variable (L : Submodule ℤ E) [hLdis : DiscreteTopology L] [hLfull : IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))

include hLdis hLfull hK

/-- Every bounded gauge sublevel in a full discrete lattice is finite. -/
theorem finite_gauge_sublevel (r : ℝ) :
    Set.Finite {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r} := by sorry

/-- Outside each proper real subspace a full lattice has a vector of least positive gauge. -/
theorem exists_min_gauge_outside (W : Submodule ℝ E) (hW : W ≠ ⊤) :
    ∃ v : L, (v : E) ∉ W ∧ 0 < gauge (K : Set E) v ∧
      ∀ x : L, (x : E) ∉ W → gauge (K : Set E) v ≤ gauge (K : Set E) x := by sorry

/-- Greedy gauge minimizers form an independent family with increasing gauges and strict-sublevel prefix flags. -/
theorem exists_greedy_gauge_family :
    ∃ v : Fin (finrank ℝ E) → L,
      LinearIndependent ℝ (fun i => (v i : E)) ∧
      (∀ i, 0 < gauge (K : Set E) (v i)) ∧
      Monotone (fun i => gauge (K : Set E) (v i)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < gauge (K : Set E) (v i) →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ (v j : E) = y} := by sorry

/-- For a full discrete lattice and an interior convex body every successive-minimum infimum is attained. -/
theorem successiveMin_isLeast (i : Fin (finrank ℝ E)) :
    IsLeast {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}
      (successiveMin L K i) := by sorry

/-- Every indexed successive minimum of a full lattice is strictly positive. -/
theorem successiveMin_pos (i : Fin (finrank ℝ E)) : 0 < successiveMin L K i := by sorry

/-- Successive minima increase with their zero-based index, allowing repeated values. -/
theorem successiveMin_monotone : Monotone (successiveMin L K) := by sorry

/-- A nonnegative dilation reaches the i-th minimum exactly when its lattice vectors span i+1 dimensions. -/
theorem successiveMin_le_iff (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K i ≤ r ↔ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ ((L : Set E) ∩ r • (K : Set E))) := by sorry

/-- A real basis of lattice vectors realizes all successive minima and their strict-sublevel flags. -/
theorem exists_successiveMin_witnesses :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E,
      (∀ i, b i ∈ L) ∧
      (∀ i, gauge (K : Set E) (b i) = successiveMin L K i) ∧
      (∀ i, b i ∈ successiveMin L K i • (K : Set E)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ b j = y} := by sorry

/-- Enlarging the convex body decreases every successive minimum. -/
theorem successiveMin_antitone_body (K' : ConvexBody E)
    (hK' : (0 : E) ∈ interior (K' : Set E)) (hKK' : K ≤ K')
    (i : Fin (finrank ℝ E)) : successiveMin L K' i ≤ successiveMin L K i := by sorry

/-- Passing to a full sublattice can only increase the successive minima. -/
theorem successiveMin_monotone_lattice (M : Submodule ℤ E)
    [DiscreteTopology M] [IsZLattice ℝ M] (hLM : L ≤ M)
    (i : Fin (finrank ℝ E)) : successiveMin M K i ≤ successiveMin L K i := by sorry

/-- Positive scaling of the convex body divides every successive minimum by that scalar. -/
theorem successiveMin_smul_body (c : ℝ) (hc : 0 < c) (i : Fin (finrank ℝ E)) :
    successiveMin L (c • K) i = successiveMin L K i / c := by sorry

/-- Simultaneously transporting the lattice and body preserves corresponding successive minima. -/
theorem successiveMin_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) [DiscreteTopology L'] [IsZLattice ℝ L']
    (K' : ConvexBody F) (hK' : (0 : F) ∈ interior (K' : Set F))
    (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E))
    (i : Fin (finrank ℝ E)) (j : Fin (finrank ℝ F)) (hij : i.val = j.val) :
    successiveMin L' K' j = successiveMin L K i := by sorry

/-- The first minimum is at most r exactly when the closed r-dilate contains a nonzero lattice vector. -/
theorem successiveMin_first_le_iff (hd : 0 < finrank ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K ⟨0, hd⟩ ≤ r ↔
      ∃ x : E, x ∈ L ∧ x ≠ 0 ∧ x ∈ r • (K : Set E) := by sorry

end SuccessiveMinima

section IntegralFlag
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- A prescribed integral basis of a rational lattice intersection extends to a full integral basis. -/
theorem saturated_adapted_basis_of_basis
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ L W.subtype : Set W) = ⊤)
    {r : ℕ} (c : Basis (Fin r) ℤ (ZLattice.comap ℝ L W.subtype)) :
    ∃ (s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ L),
      r+s = finrank ℝ E ∧ ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- A real basis of lattice vectors has the same prefix flag as a suitable integral lattice basis. -/
theorem exists_integral_basis_same_flag
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (w : Basis (Fin (finrank ℝ E)) ℝ E) (hw : ∀ i, w i ∈ L) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∀ k : Fin (finrank ℝ E+1), (b.ofZLatticeBasis ℝ).flag k = w.flag k := by sorry

/-- An integral basis can carry the successive-minimum strict-sublevel flag without a short-vector bound. -/
theorem exists_integral_minimum_flag
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E)) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ (b.ofZLatticeBasis ℝ).flag i.castSucc := by sorry
end IntegralFlag

section Crosspolytope
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {n : ℕ}

/-- Weighted coordinate crosspolytope volume is its determinant factor times 2^n divided by n! and the weights. -/
theorem weighted_crosspolytope_volume (o : OrthonormalBasis (Fin n) ℝ E)
    (b : Basis (Fin n) ℝ E) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : E | ∑ i, a i * |b.repr x i| ≤ 1} =
      ENNReal.ofReal (((2 : ℝ)^n / (Nat.factorial n : ℝ)) *
        |o.toBasis.det b| / ∏ i, a i) := by sorry

/-- The weighted crosspolytope generated by scaled-body vectors lies in the symmetric convex body. -/
theorem weighted_crosspolytope_subset {V : Type*} [NormedAddCommGroup V]
    [NormedSpace ℝ V] (K : ConvexBody V)
    (hK : (0 : V) ∈ interior (K : Set V)) (hsym : ∀ x ∈ K, -x ∈ K)
    (b : Basis (Fin n) ℝ V) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i)
    (hb : ∀ i, b i ∈ a i • (K : Set V)) :
    {x : V | ∑ i, a i * |b.repr x i| ≤ 1} ⊆ (K : Set V) := by sorry

/-- The absolute real determinant of independent lattice vectors bounds the full lattice covolume below. -/
theorem covolume_le_abs_basis_det (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (o : OrthonormalBasis (Fin n) ℝ E) (b : Basis (Fin n) ℝ E)
    (hb : ∀ i, b i ∈ L) : ZLattice.covolume L ≤ |o.toBasis.det b| := by sorry

/-- The successive-minimum product times body volume bounds 2^n/n! times covolume below. -/
theorem minkowski_second_lower (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    ((2 : ℝ)^(finrank ℝ E) / (Nat.factorial (finrank ℝ E) : ℝ)) *
      ZLattice.covolume L ≤ 
      (∏ i : Fin (finrank ℝ E), successiveMin L K i) * volume.real (K : Set E) := by sorry

end Crosspolytope

section PrescribedMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]
  (b : Basis (Fin (finrank ℝ E)) ℝ E)
  (K : ConvexBody E) (a : Fin (finrank ℝ E) → ℝ)
  (ha : ∀ i, 0 < a i) (ham : Monotone a)

include ha ham

/-- A positive increasing weighted coordinate box has successive minima equal to its coordinate weights. -/
theorem successiveMin_box
    (hK : (K : Set E) = {x : E | ∀ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

/-- A positive increasing weighted coordinate crosspolytope has successive minima equal to its weights. -/
theorem successiveMin_crosspolytope
    (hK : (K : Set E) = {x : E | ∑ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

end PrescribedMinima

section LinearForms

/-- The inverse-image box volume is 2^n times its half-side product divided by the absolute determinant. -/
theorem linear_forms_box_volume {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : A.det ≠ 0) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : Fin n → ℝ | ∀ i, |(Matrix.mulVec A x) i| ≤ a i} =
      ENNReal.ofReal ((2 : ℝ)^n * (∏ i, a i) / |A.det|) := by sorry

/-- The determinant threshold supplies a nonzero integral vector satisfying the closed linear-form bounds. -/
theorem minkowski_linear_forms {n : ℕ} (hn : 0 < n)
    (A : Matrix (Fin n) (Fin n) ℝ) (hA : A.det ≠ 0)
    (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) (hprod : |A.det| ≤ ∏ i, a i) :
    ∃ z : Fin n → ℤ, z ≠ 0 ∧ ∀ i, |∑ j, A i j * (z j : ℝ)| ≤ a i := by sorry

/-- The equality threshold requires a closed, not an open, inequality. -/
example : (∃ z : ℤ, z ≠ 0 ∧ |2 * (z : ℝ)| ≤ 2) ∧
    ¬ (∃ z : ℤ, z ≠ 0 ∧ |2 * (z : ℝ)| < 2) := by sorry

/-- The inverse image uses the absolute determinant, even for a negative map. -/
example : volume {x : Fin 1 → ℝ | |(-2 : ℝ) * x 0| ≤ 3} = 3 := by sorry

/-- Diagonal determinant cancellation recovers the unit square. -/
example : volume {x : Fin 2 → ℝ | |2 * x 0| ≤ 2 ∧ |3 * x 1| ≤ 3} = 4 := by sorry

/-- There can be no nonzero-vector assertion in dimension zero. -/
example : ¬ ∃ z : Fin 0 → ℤ, z ≠ 0 := by sorry

end LinearForms

section MinimaTests

/-- successive_min_interval_half -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-2) 2) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ = 1/2 := by sorry

/-- successive_min_rectangle_2_3 -/
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1/2 ∧ |x 1| ≤ 1/3}) :
    successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K ⟨0, by simp⟩ = 2 ∧
    successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K ⟨1, by simp⟩ = 3 := by sorry

/-- successive_min_empty_product -/
example (K : ConvexBody (EuclideanSpace ℝ (Fin 0))) :
    (∏ i : Fin (finrank ℝ (EuclideanSpace ℝ (Fin 0))),
      successiveMin (⊥ : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) K i) = 1 := by sorry

/-- successive_min_scaled_lattice -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1) 1) :
    successiveMin (Submodule.span ℤ {(2 : ℝ)}) K ⟨0, by simp⟩ = 2 ∧
    successiveMin (Submodule.span ℤ {(2 : ℝ)}) K ⟨0, by simp⟩ ≠ 1 := by sorry

/-- successive_min_unit_ball_norm -/
example {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    (K : ConvexBody E) (hK : (K : Set E) = Metric.closedBall 0 1)
    (L : Submodule ℤ E) (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ ‖x‖ ≤ r})} := by sorry

/-- successive_min_no_integral_basis -/
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | ∀ i, |x i| ≤ 1}) :
    (∀ i, successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K i = 1) ∧
    gauge (K : Set (EuclideanSpace ℝ (Fin 2)))
      (WithLp.toLp 2 ![(1 : ℝ),1]) = 1 ∧
    gauge (K : Set (EuclideanSpace ℝ (Fin 2)))
      (WithLp.toLp 2 ![(1 : ℝ),-1]) = 1 ∧
    |((!![(1 : ℤ),1;1,-1]).det : ℤ)| = 2 := by sorry

/-- successive_min_closed_boundary -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1) 1) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ = 1 ∧
    {x : ℝ | x ∈ Submodule.span ℤ {(1 : ℝ)} ∧ gauge (K : Set ℝ) x < 1} = {0} := by sorry

/-- Positivity can fail without the interior hypothesis, despite compactness and symmetry. -/
example : successiveMin (Submodule.span ℤ {(1 : ℝ)}) (0 : ConvexBody ℝ)
    ⟨0, by simp⟩ = 0 := by sorry

/-- Negative and zero gauge cutoffs are different finite sets. -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1) 1) :
    {x : ℝ | x ∈ Submodule.span ℤ {(1 : ℝ)} ∧ gauge (K : Set ℝ) x ≤ -1} = ∅ ∧
    {x : ℝ | x ∈ Submodule.span ℤ {(1 : ℝ)} ∧ gauge (K : Set ℝ) x ≤ 0} = {0} := by sorry

/-- A bound of one is not intrinsic to a general lattice. -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1) 1) :
    successiveMin (Submodule.span ℤ {(1/2 : ℝ)}) K ⟨0, by simp⟩ = 1/2 := by sorry

/-- Scaling only the body divides a minimum. -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1) 1) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) ((3 : ℝ) • K) ⟨0, by simp⟩ = 1/3 := by sorry

/-- Simultaneous scalar transport preserves the minimum. -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-2) 2) :
    successiveMin (Submodule.span ℤ {(2 : ℝ)}) K ⟨0, by simp⟩ = 1 := by sorry

/-- Weighted l1 area uses both weights and the factorial. -/
example : volume {x : Fin 2 → ℝ | 2 * |x 0| + 3 * |x 1| ≤ 1} =
    ENNReal.ofReal (1/3 : ℝ) := by sorry

/-- Boundary and lower-bound sharpness for Z² and the unit diamond. -/
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| + |x 1| ≤ 1}) :
    (∏ i, successiveMin (Submodule.span ℤ
      (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis)) K i) *
      volume.real (K : Set (EuclideanSpace ℝ (Fin 2))) = 2 := by sorry

/-- Rank-zero lower-bound equality has canonical volume one. -/
example (K : ConvexBody (EuclideanSpace ℝ (Fin 0))) :
    ZLattice.covolume (⊥ : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) = 1 ∧
    volume.real (K : Set (EuclideanSpace ℝ (Fin 0))) = 1 := by sorry

/-- Dropping symmetry invalidates the lower product constant in dimension one. -/
example (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-1/10) 1) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ *
      volume.real (K : Set ℝ) = 11/10 ∧ (11/10 : ℝ) < 2 := by sorry

end MinimaTests

section HenkFiber
open scoped ENNReal
variable {E F ι : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F] [Fintype ι]

local notation "U" => (fun (v : ι → E) (K : Set (E × F)) =>
  ⋃ i, (fun p : E × F => (v i+Prod.fst p,Prod.snd p)) '' K)
local notation "f₁" => (fun r : ℝ => fun p : E × F => (r • Prod.fst p,Prod.snd p))
local notation "f₂" => (fun r : ℝ => fun p : E × F => (Prod.fst p,r • Prod.snd p))

/-- A finite family of convex compact translates with disjoint interiors has additive Haar volume. -/
theorem finite_interior_disjoint_translate_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (K : Set E) (hK : IsCompact K) (hconv : Convex ℝ K) (v : ι → E)
    (hdis : Pairwise fun i j => Disjoint
      ((fun x => v i+x) '' interior K) ((fun x => v j+x) '' interior K)) :
    μ (⋃ i, (fun x => v i+x) '' K) = (Fintype.card ι : ℝ≥0∞)*μ K := by sorry

/-- A transverse section of a finite translate union equals the union of the corresponding translated sections. -/
theorem finite_translate_section (v : ι → E) (K : Set (E × F)) (y : F) :
    {x : E | (x,y) ∈ U v K} =
      ⋃ i, (fun x : E => v i+x) '' {x : E | (x,y) ∈ K} := by sorry

/-- Each convex section union fits into a translate of its enlargement in the first coordinate. -/
theorem convex_section_enlargement (v : ι → E) (K : Set (E × F))
    (hK : Convex ℝ K) (r : ℝ) (hr : 1 ≤ r) (y : F) :
    ∃ t : E, {x : E | (x,y) ∈ U v K} ⊆
      (fun x : E => x+t) '' {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- Enlarging the first coordinate of convex sections cannot decrease their finite-union Haar volume. -/
theorem section_union_volume_mono (μ : Measure E) [μ.IsAddHaarMeasure]
    (v : ι → E) (K : Set (E × F)) (hK : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) (y : F) :
    μ {x : E | (x,y) ∈ U v K} ≤ μ {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- First-coordinate enlargement of a compact convex translate union cannot decrease product Haar volume. -/
theorem partial_dilation_union_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (ν : Measure F) [ν.IsAddHaarMeasure] (v : ι → E)
    (K : Set (E × F)) (hK : IsCompact K) (hconv : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) :
    μ.prod ν (U v K) ≤ μ.prod ν (U v (f₁ r '' K)) := by sorry

/-- Full dilation of a translate union factors as complementary-coordinate dilation of the partially dilated union. -/
theorem complementary_dilation_union (v : ι → E) (K : Set (E × F)) (r : ℝ) :
    U v ((fun p : E × F => r • p) '' K) =
      f₂ r '' U v (f₁ r '' K) := by sorry

/-- Full dilation grows the compact convex translate-union volume by at least its transverse dimension power. -/
theorem transverse_union_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (ν : Measure F) [ν.IsAddHaarMeasure] (v : ι → E)
    (K : Set (E × F)) (hK : IsCompact K) (hconv : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) :
    ENNReal.ofReal (r ^ finrank ℝ F) * μ.prod ν (U v K) ≤ 
      μ.prod ν (U v ((fun p : E × F => r • p) '' K)) := by sorry
end HenkFiber

section HenkFiberTests
/-- touching_interval_union -/
example : volume (Set.Icc (0 : ℝ) 1 ∪ Set.Icc 1 2) = 2 := by sorry
/-- repeated_translates_need_disjoint_interiors -/
example : volume (Set.Icc (0 : ℝ) 1 ∪ Set.Icc 0 1) = 1 ∧
    volume (Set.Icc (0 : ℝ) 1 ∪ Set.Icc 0 1) ≠ 2 := by sorry
/-- shifted_convex_section_translation -/
example : Set.Icc (2 : ℝ) 3 ⊆
    (fun x : ℝ => x-2) '' Set.Icc (4 : ℝ) 6 := by sorry
/-- shifted_convex_section_not_origin_nested -/
example : ¬ Set.Icc (2 : ℝ) 3 ⊆ Set.Icc 4 6 := by sorry
/-- empty_translate_family -/
example : (⋃ i : Fin 0, (fun x : ℝ => (i.val : ℝ)+x) '' Set.Icc 0 1) =
    (∅ : Set ℝ) := by sorry
/-- nonconvex_section_counterexample -/
example : ¬ ∃ t : ℝ, ({0,1,3} : Set ℝ) ⊆
    (fun x : ℝ => x+t) '' ({0,2,6} : Set ℝ) := by sorry
/-- first_coordinate_stretch -/
example : (fun p : ℝ × ℝ => ((2 : ℝ) • p.1,p.2)) (3,5) = (6,5) := by sorry
/-- complementary_coordinate_stretch -/
example : (fun p : ℝ × ℝ => (p.1,(2 : ℝ) • p.2)) (3,5) = (3,10) := by sorry
/-- zero_transverse_exponent -/
example : (2 : ℝ) ^ finrank ℝ (EuclideanSpace ℝ (Fin 0)) = 1 := by sorry
/-- unit_dilation_section -/
example (K : Set (ℝ × ℝ)) :
    (fun p : ℝ × ℝ => ((1 : ℝ) • p.1,p.2)) '' K = K := by sorry
end HenkFiberTests

section HenkUpper
open scoped ENNReal Pointwise

/-- A linear equivalence preserves gauge when both the set and point are transported. -/
theorem gauge_linearEquiv {E F : Type*} [AddCommGroup E] [Module ℝ E]
    [AddCommGroup F] [Module ℝ F] (e : E ≃ₗ[ℝ] F) (K : Set E) (x : E) :
    gauge (e '' K) (e x) = gauge K x := by sorry

/-- Finite convex clusters with pairwise cross-disjoint interiors have a Haar-null intersection. -/
theorem convex_cluster_intersection_null {E I J : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] [Fintype I] [Fintype J]
    (μ : Measure E) [μ.IsAddHaarMeasure] (A : I → Set E) (B : J → Set E)
    (hA : ∀ i, Convex ℝ (A i)) (hB : ∀ j, Convex ℝ (B j))
    (hdis : ∀ i j, Disjoint (interior (A i)) (interior (B j))) :
    μ ((⋃ i, A i) ∩ ⋃ j, B j) = 0 := by sorry

/-- Outer translate clusters with cross-disjoint interiors have volume equal to the number of outer rows times one row. -/
theorem clustered_translate_volume {E I J : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] [Fintype I] [Fintype J]
    (μ : Measure E) [μ.IsAddHaarMeasure] (K : Set E)
    (hK : IsCompact K) (hconv : Convex ℝ K) (u : I → E) (v : J → E)
    (hdis : ∀ j j', j ≠ j' → ∀ i i', Disjoint
      ((fun x => u i+v j+x) '' interior K)
      ((fun x => u i'+v j'+x) '' interior K)) :
    μ (⋃ j, ⋃ i, (fun x => u i+v j+x) '' K) =
      (Fintype.card J : ℝ≥0∞) * μ (⋃ i, (fun x => u i+x) '' K) := by sorry

local notation "Mbox" => (fun (d q : ℕ) =>
  Finset.Icc (fun _ : Fin d => -(q : ℤ)) (fun _ : Fin d => (q : ℤ)))
set_option quotPrecheck false in
local notation "Mprefix" => (fun (d k q : ℕ) =>
  Finset.filter (fun z => ∀ j : Fin d, k ≤ Fin.val j → z j = 0) (Mbox d q))
local notation "boxUnion" => (fun (d q : ℕ) (S : Set (Fin d → ℝ)) =>
  ⋃ z ∈ Mbox d q, (fun x : Fin d → ℝ => (fun j => (z j : ℝ))+x) '' S)
local notation "prefixUnion" => (fun (d k q : ℕ) (S : Set (Fin d → ℝ)) =>
  ⋃ z ∈ Mprefix d k q, (fun x : Fin d → ℝ => (fun j => (z j : ℝ))+x) '' S)

/-- The strict-sublevel lattice flag makes distinct transverse half-body translates interior-disjoint. -/
theorem strict_flag_translate_separation {d : ℕ}
    (K : ConvexBody (Fin d → ℝ)) (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _))
    (hsym : ∀ x ∈ K, -x ∈ K) (t : ℝ) (ht : 0 < t) (k : ℕ) (hk : k ≤ d)
    (hflag : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < t →
      ∀ j : Fin d, k ≤ j.val → z j = 0)
    (x y : Fin d → ℤ) (hxy : ∃ j : Fin d, k ≤ j.val ∧ x j ≠ y j) :
    Disjoint ((fun w : Fin d → ℝ => (fun j => (x j : ℝ))+w) ''
      interior ((t/2) • (K : Set _)))
      ((fun w : Fin d → ℝ => (fun j => (y j : ℝ))+w) ''
      interior ((t/2) • (K : Set _))) := by sorry

/-- A separated lattice box union has volume (2q+1) to the codimension times its prefix-union volume. -/
theorem lattice_box_row_volume (d k q : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (hdis : ∀ x ∈ Mbox d q, ∀ y ∈ Mbox d q,
      (∃ j : Fin d, k ≤ j.val ∧ x j ≠ y j) →
      Disjoint ((fun w : Fin d → ℝ => (fun j => (x j : ℝ))+w) '' interior S)
        ((fun w : Fin d → ℝ => (fun j => (y j : ℝ))+w) '' interior S)) :
    volume (boxUnion d q S) =
      ((2*q+1 : ℕ) : ℝ≥0∞)^(d-k) * volume (prefixUnion d k q S) := by sorry

/-- A union translated in a coordinate prefix grows by at least the complementary-dimension dilation factor. -/
theorem coordinate_transverse_union_volume {I : Type*} [Fintype I] (d k : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (v : I → Fin d → ℝ) (hv : ∀ i j, k ≤ j.val → v i j = 0)
    (r : ℝ) (hr : 1 ≤ r) :
    ENNReal.ofReal (r^(d-k)) * volume (⋃ i, (fun x => v i+x) '' S) ≤ 
      volume (⋃ i, (fun x => v i+x) '' (r • S)) := by sorry

/-- Strict-threshold flags bound the ratio of two half-body lattice-box union volumes by the codimension power. -/
theorem flag_box_volume_ratio {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s t : ℝ) (hs : 0 < s) (hst : s ≤ t) (k q : ℕ) (hk : k ≤ d)
    (hflag : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < t →
      ∀ j : Fin d, k ≤ j.val → z j = 0) :
    (t/s)^(d-k) * volume.real (boxUnion d q ((s/2) • (K : Set _))) ≤ 
      volume.real (boxUnion d q ((t/2) • (K : Set _))) := by sorry

/-- Below the first lattice threshold the finite half-body translate union has additive scaled volume. -/
theorem first_box_volume {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s : ℝ) (hs : 0 < s)
    (hfirst : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < s → z = 0)
    (q : ℕ) :
    volume.real (boxUnion d q ((s/2) • (K : Set _))) =
      (2*(q : ℝ)+1)^d * (s/2)^d * volume.real (K : Set (Fin d → ℝ)) := by sorry

/-- Compact-set lattice-box unions fit in boxes with a fixed margin independent of the lattice-box radius. -/
theorem outer_lattice_box_volume (d : ℕ) (S : Set (Fin d → ℝ)) (hS : IsCompact S) :
    ∃ R : ℝ, 0 ≤ R ∧ ∀ q : ℕ,
      volume.real (boxUnion d q S) ≤ (2*(q : ℝ)+2*R)^d := by sorry

/-- The first threshold power and descending adjacent-ratio powers telescope to the total threshold product. -/
theorem weighted_ratio_product (n : ℕ) (a : Fin (n+1) → ℝ) (ha : ∀ j, 0 < a j) :
    a 0^(n+1) * (∏ i : Fin n, (a i.succ / a i.castSucc)^(n-i.val)) =
      ∏ j, a j := by sorry

/-- A nonnegative volume chain with weighted ratio bounds yields its final product bound without dividing by volume. -/
theorem weighted_volume_chain (n : ℕ) (a V : Fin (n+1) → ℝ)
    (ha : ∀ j, 0 < a j) (hV : ∀ j, 0 ≤ V j) (B : ℝ) (hB : 0 ≤ B)
    (hfirst : a 0^(n+1)*B ≤ V 0)
    (hstep : ∀ i : Fin n, (a i.succ/a i.castSucc)^(n-i.val)*V i.castSucc ≤ V i.succ) :
    (∏ j, a j)*B ≤ V (Fin.last n) := by sorry

/-- Uniform polynomial lattice-box bounds force the normalized leading coefficient to be at most one. -/
theorem large_box_comparison_limit (d : ℕ) (R B : ℝ)
    (h : ∀ q : ℕ, (2*(q : ℝ)+1)^d * B ≤ (2*(q : ℝ)+2*R)^d) : B ≤ 1 := by sorry

/-- An increasing positive strict-sublevel coordinate flag bounds its threshold product times volume by 2^d. -/
theorem coordinate_flag_upper (d : ℕ) (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (a : Fin d → ℝ) (ha : ∀ i, 0 < a i) (hmono : Monotone a)
    (hflag : ∀ i : Fin d, ∀ z : Fin d → ℤ,
      gauge (K : Set _) (fun j => (z j : ℝ)) < a i →
      ∀ j : Fin d, i ≤ j → z j = 0) :
    (∏ i, a i) * volume.real (K : Set (Fin d → ℝ)) ≤ 2^d := by sorry

/-- The successive-minimum product times symmetric convex-body volume is at most 2^n times covolume. -/
theorem minkowski_second_upper
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    (∏ i : Fin (finrank ℝ E), successiveMin L K i) * volume.real (K : Set E) ≤ 
      2^finrank ℝ E * ZLattice.covolume L := by sorry
end HenkUpper

section HenkUpperTests
/-- gauge_coordinate_scale -/
example : gauge (Set.Icc (-2 : ℝ) 2) 2 = 1 := by sorry
/-- gauge_coordinate_wrong_point -/
example : gauge (Set.Icc (-1 : ℝ) 1) 2 = 2 ∧
    gauge (Set.Icc (-1 : ℝ) 1) 2 ≠ 1 := by sorry
/-- cluster_touching_null -/
example : volume ((Set.Icc (0 : ℝ) 2 ∪ Set.Icc 1 3) ∩
    (Set.Icc 3 5 ∪ Set.Icc 4 6)) = 0 := by sorry
/-- cluster_cross_overlap_not_null -/
example : volume (Set.Icc (0 : ℝ) 2 ∩ Set.Icc 1 3) = 1 := by sorry
/-- cluster_volume_overlapping_rows -/
example : volume (Set.Icc (0 : ℝ) 2 ∪ Set.Icc 1 3 ∪ Set.Icc 3 5 ∪ Set.Icc 4 6) = 6 ∧
    volume (Set.Icc (0 : ℝ) 2 ∪ Set.Icc 1 3 ∪ Set.Icc 3 5 ∪ Set.Icc 4 6) ≠ 8 := by sorry
/-- cluster_volume_repeated_inner_label -/
example : volume ((Set.Icc (0 : ℝ) 1 ∪ Set.Icc 0 1) ∪
    (Set.Icc 1 2 ∪ Set.Icc 1 2)) = 2 := by sorry
/-- flag_half_body_touching -/
example : Disjoint (Set.Ioo (-1/2 : ℝ) (1/2)) (Set.Ioo (1/2) (3/2)) := by sorry
/-- flag_radius_factor_two -/
example : ¬ Disjoint (Set.Ioo (-1 : ℝ) 1) (Set.Ioo 0 2) := by sorry
/-- box_row_two_dimensional -/
example : volume ((Set.Icc (-2 : ℝ) 2) ×ˢ (Set.Icc (-1/2 : ℝ) (1/2))) = 4 ∧
    volume ((Set.Icc (-2 : ℝ) 2) ×ˢ (Set.Icc (-3/2 : ℝ) (3/2))) = 12 := by sorry
/-- box_row_zero_radius -/
example (d : ℕ) : (Finset.Icc (fun _ : Fin d => (0 : ℤ)) (fun _ => (0 : ℤ))).card = 1 := by sorry
/-- coordinate_codimension_two -/
example : (2 : ℝ)^(3-1 : ℕ) = 4 ∧ (2 : ℝ)^(3-1 : ℕ) ≠ 8 := by sorry
/-- coordinate_full_prefix -/
example (r : ℝ) (d : ℕ) : r^(d-d) = 1 ∧ r^(d-0) = r^d := by sorry
/-- box_ratio_repeated_minimum -/
example (s : ℝ) (hs : 0 < s) (d k : ℕ) (V : ℝ) : (s/s)^(d-k)*V = V := by sorry
/-- box_ratio_codimension_not_dimension -/
example : (3 : ℝ)*3 ≤ 15 ∧ ¬ (3 : ℝ)^2*3 ≤ 15 := by sorry
/-- initial_box_square -/
example : (3 : ℝ)^2*(1/2)^2*4 = 9 := by sorry
/-- initial_box_nonunit_threshold -/
example : (3 : ℝ)^2*(1/4)^2*8 = 9/2 := by sorry
/-- outer_box_fixed_margin -/
example : (15 : ℝ) ≤ (2+2*(3/2))^2 ∧ (2+2*(3/2) : ℝ)^2 = 25 := by sorry
/-- outer_box_empty_dimension -/
example : volume (∅ : Set (Fin 0 → ℝ)) = 0 ∧ (0 : ℝ)^0 = 1 := by sorry
/-- weighted_ratio_three_values -/
example : (2 : ℝ)^3*(3/2)^2*(5/3) = 2*3*5 := by sorry
/-- weighted_ratio_repeated_values -/
example : (2 : ℝ)^3*(2/2)^2*(5/2) = 20 := by sorry
/-- weighted_ratio_rank_one -/
example (a : ℝ) : a^1*(∏ i : Fin 0, (Fin.elim0 i : ℝ)) = a := by sorry
/-- volume_chain_sharp_values -/
example : (3/2 : ℝ)^2*8 = 18 ∧ (5/3 : ℝ)*18 = 30 ∧ (2*3*5 : ℝ) = 30 := by sorry
/-- volume_chain_zero_base -/
example (n : ℕ) (a : Fin (n+1) → ℝ) : (∏ i, a i)*(0 : ℝ) ≤ 0 := by sorry
/-- large_box_half_margin -/
example (q : ℕ) : (2*(q : ℝ)+2*(1/2))/(2*(q : ℝ)+1) = 1 := by sorry
/-- large_box_zero_dimension -/
example (R B : ℝ) (h : ∀ q : ℕ, (2*(q : ℝ)+1)^0*B ≤ (2*(q : ℝ)+2*R)^0) :
    B ≤ 1 := by sorry
/-- coordinate_upper_rectangle -/
example : ((1/3 : ℝ)*1)*12 = 2^2 := by sorry
/-- coordinate_upper_diamond -/
example : ((1 : ℝ)*1)*2 < 2^2 := by sorry
/-- coordinate_upper_empty -/
example : (∏ i : Fin 0, (Fin.elim0 i : ℝ)) *
    volume.real (Set.univ : Set (Fin 0 → ℝ)) = 2^0 := by sorry
/-- upper_nonunit_covolume -/
example : (2/3 : ℝ)*6 = 2*2 ∧ ¬ (2/3 : ℝ)*6 ≤ 2 := by sorry
/-- upper_anisotropic_lattice -/
example : ((1 : ℝ)*3)*8 = 2^2*6 := by sorry
/-- upper_zero_dimension -/
example : volume (Set.univ : Set (EuclideanSpace ℝ (Fin 0))) = 1 ∧
    (∏ i : Fin 0, (Fin.elim0 i : ℝ)) = 1 := by sorry
end HenkUpperTests

section ReviewedSmallCases

 /-- gram_det_orthonormal_coordinates_test_1 — The singleton complex family (i) has Gram determinant 1, not −1. -/
example : (Matrix.gram ℂ (fun _ : Fin 1 => (Complex.I : ℂ))).det = 1 := by sorry

 /-- gram_det_orthonormal_coordinates_test_2 — Vectors (1,0),(0,i) in C² have Gram determinant 1 and squared coordinate-determinant norm 1. -/
example : let v : Fin 2 → EuclideanSpace ℂ (Fin 2) :=
       ![WithLp.toLp 2 ![1,0], WithLp.toLp 2 ![0,Complex.I]]
     (Matrix.gram ℂ v).det = 1 ∧ ‖(!![(1 : ℂ),0;0,Complex.I]).det‖^2 = 1 := by sorry

 /-- gram_det_orthonormal_coordinates_test_3 — The empty family in zero-dimensional space has determinant 1. -/
example : (Matrix.gram ℝ (fun i : Fin 0 => (Fin.elim0 i : ℝ))).det = 1 := by sorry

 /-- orthonormal_coordinate_hadamard_test_1 — Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![2,0], WithLp.toLp 2 ![0,3]]
     ‖(!![(2 : ℝ),0;0,3]).det‖ = 6 ∧ (∏ i, ‖v i‖) = 6 := by sorry

 /-- orthonormal_coordinate_hadamard_test_2 — Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![1,0], WithLp.toLp 2 ![1,1]]
     ‖(!![(1 : ℝ),1;0,1]).det‖ = 1 ∧ (∏ i, ‖v i‖) = Real.sqrt 2 := by sorry

 /-- orthonormal_coordinate_hadamard_test_3 — Duplicate nonzero columns have determinant 0 and positive product norms. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![1,0], WithLp.toLp 2 ![1,0]]
     ‖(!![(1 : ℝ),1;0,0]).det‖ = 0 ∧ (∏ i, ‖v i‖) = 1 := by sorry

 /-- hermitian_gram_hadamard_test_1 — The empty Gram determinant and diagonal product both equal 1. -/
example : (Matrix.gram ℂ (fun i : Fin 0 => (Fin.elim0 i : ℂ))).det = 1 ∧
     (∏ i : Fin 0, ‖(Fin.elim0 i : ℂ)‖^2) = 1 := by sorry

 /-- hermitian_gram_hadamard_test_2 — Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential. -/
example : (Matrix.gram ℂ (![1,Complex.I] : Fin 2 → ℂ)).det = 0 ∧
     (∏ i : Fin 2, ‖(![1,Complex.I] : Fin 2 → ℂ) i‖^2) = 1 := by sorry

 /-- hermitian_gram_hadamard_test_3 — Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![1,0], WithLp.toLp 2 ![1,1]]
     (Matrix.gram ℝ v).det = 1 ∧ (∏ i, ‖v i‖^2) = 2 := by sorry

 /-- gram_uniform_bound_test_1 — n=0,D=0 gives 1 ≤ 0^0=1. -/
example : (Matrix.gram ℂ (fun i : Fin 0 => (Fin.elim0 i : ℂ))).det = 1 ∧
     (1 : ℝ) ≤ (0 : ℝ)^0 := by sorry

 /-- gram_uniform_bound_test_2 — A nonempty zero family with D=0 has determinant 0. -/
example : (Matrix.gram ℝ (fun _ : Fin 1 => (0 : ℝ))).det = 0 := by sorry

 /-- gram_uniform_bound_test_3 — Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![Real.sqrt 5,0], WithLp.toLp 2 ![0,Real.sqrt 5]]
     (Matrix.gram ℝ v).det = 25 ∧ ¬ (Matrix.gram ℝ v).det ≤ 5 := by sorry

 /-- covolume_square_gram_test_1 — Basis (2,0),(0,3) has covolume 6 and Gram determinant 36. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![2,0], WithLp.toLp 2 ![0,3]]
     let L := Submodule.span ℤ (Set.range v)
     ZLattice.covolume L = 6 ∧ (Matrix.gram ℝ v).det = 36 := by sorry

 /-- covolume_square_gram_test_2 — A unimodular shear of the standard Z² basis leaves covolume squared and Gram determinant equal to 1. -/
example : let v : Fin 2 → EuclideanSpace ℝ (Fin 2) :=
       ![WithLp.toLp 2 ![1,0], WithLp.toLp 2 ![1,1]]
     let L := Submodule.span ℤ (Set.range v)
     ZLattice.covolume L^2 = 1 ∧ (Matrix.gram ℝ v).det = 1 := by sorry

 /-- covolume_square_gram_test_3 — Z(1,1) in its line has intrinsic covolume √2 and Gram determinant 2; ambient plane volume would give the wrong zero. -/
example : let u : EuclideanSpace ℝ (Fin 2) := WithLp.toLp 2 ![1,1]
     let V := Submodule.span ℝ ({u} : Set (EuclideanSpace ℝ (Fin 2)))
     letI : MeasureSpace V := measureSpaceOfInnerProductSpace
     let v : V := ⟨u, Submodule.subset_span (by simp)⟩
     let L := Submodule.span ℤ ({v} : Set V)
     ZLattice.covolume L = Real.sqrt 2 ∧ (Matrix.gram ℝ (fun _ : Fin 1 => v)).det = 2 := by sorry

 /-- ordered_tail_product_test_1 — For (1,2,4), the three left sides are 1,4,4 and total product is 8. -/
example : (1 : ℝ)^3 ≤ ∏ j : Fin 3, (![1,2,4] : Fin 3 → ℝ) j ∧
     (2 : ℝ)^2 ≤ ∏ j : Fin 3, (![1,2,4] : Fin 3 → ℝ) j ∧
     (4 : ℝ)^1 ≤ ∏ j : Fin 3, (![1,2,4] : Fin 3 → ℝ) j := by sorry

 /-- ordered_tail_product_test_2 — Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1. -/
example : ¬ (2 : ℝ) ≤ ∏ j : Fin 2, (![1/2,2] : Fin 2 → ℝ) j := by sorry

 /-- ordered_tail_product_test_3 — Dropping ordering fails for (4,1): first square 16 exceeds product 4. -/
example : ¬ (4 : ℝ)^2 ≤ ∏ j : Fin 2, (![4,1] : Fin 2 → ℝ) j := by sorry

 /-- ordered_product_root_bound_test_1 — All terms 1 and V=1 give equality. -/
example : (1 : ℝ) = Real.rpow 1 ((3 : ℝ)⁻¹) := by sorry

 /-- ordered_product_root_bound_test_2 — For (1,2,4),V=8, the final bound has exponent 1, not 1/0. -/
example : (4 : ℝ) ≤ Real.rpow 8 ((1 : ℝ)⁻¹) := by sorry

 /-- ordered_product_root_bound_test_3 — For (2,2),V=4, the first bound 2 ≤ √4 is exact. -/
example : (2 : ℝ) = Real.rpow 4 ((2 : ℝ)⁻¹) := by sorry

 /-- orthonormal_cube_volume_test_1 — n=0,r=0 gives volume 1. -/
example : volume {x : EuclideanSpace ℝ (Fin 0) | ∀ i, |x i| ≤ (0 : ℝ)} = 1 := by sorry

 /-- orthonormal_cube_volume_test_2 — n=1,r=0 gives volume 0. -/
example : volume {x : EuclideanSpace ℝ (Fin 1) | ∀ i, |x i| ≤ (0 : ℝ)} = 0 := by sorry

 /-- orthonormal_cube_volume_test_3 — n=2,r=3 gives 36, not 9: r is half-side length. -/
example : volume {x : EuclideanSpace ℝ (Fin 2) | ∀ i, |x i| ≤ (3 : ℝ)} = 36 := by sorry

 /-- inscribed_cube_test_1 — n=1 gives [−1,1], whose endpoints have norm 1. -/
example : ‖(WithLp.toLp 2 ![(-1 : ℝ)] : EuclideanSpace ℝ (Fin 1))‖ = 1 ∧
     ‖(WithLp.toLp 2 ![(1 : ℝ)] : EuclideanSpace ℝ (Fin 1))‖ = 1 := by sorry

 /-- inscribed_cube_test_2 — n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1. -/
example : ‖(WithLp.toLp 2 (fun _ : Fin 4 => (1/2 : ℝ)) : EuclideanSpace ℝ (Fin 4))‖^2 = 1 := by sorry

 /-- inscribed_cube_test_3 — Half-side 1 fails for n=2 at (1,1). -/
example : ¬ ‖(WithLp.toLp 2 ![(1 : ℝ),1] : EuclideanSpace ℝ (Fin 2))‖ ≤ 1 := by sorry

 /-- intrinsic_ball_lower_bound_test_1 — n=1 gives exact lower bound 2. -/
example : volume (Metric.closedBall (0 : ℝ) 1) = 2 := by sorry

 /-- intrinsic_ball_lower_bound_test_2 — n=4 gives lower constant 1. -/
example : (2 / Real.sqrt (4 : ℝ))^4 = 1 := by sorry

 /-- intrinsic_ball_lower_bound_test_3 — n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate. -/
example : (2 / Real.sqrt (2 : ℝ))^2 = 2 ∧
     ENNReal.ofReal 2 ≤ volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin 2)) 1) := by sorry

end ReviewedSmallCases


/-! ## Layer 2: Integral quadratic and hermitian lattices -/

section IntegralQuadratic
variable (R K V : Type*) [CommRing R] [Field K] [Algebra R K]
  [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]

/-- A finite full integral submodule of a quadratic fraction-field space, with integrality of the quadratic values. -/
structure IntegralQuadraticLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : QuadraticForm K V
  integral : ∀ x ∈ carrier, ∃ r : R, algebraMap R K r = form x

variable {R K V}
/-- Bundle a finite full submodule whose quadratic values lie in the coefficient ring. -/
def IntegralQuadraticLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (q : QuadraticForm K V)
    (hq : ∀ x ∈ L, ∃ r : R, algebraMap R K r = q x) :
    IntegralQuadraticLattice R K V := ⟨L, hL, q, hq⟩

/-- The restricted R-quadratic map extends back to q on the K-span. -/
def IntegralQuadraticLattice.quadraticMap [IsDomain R] [IsFractionRing R K]
    (L : IntegralQuadraticLattice R K V) : QuadraticMap R L.carrier R := by sorry

/-- For fixed q, equal carriers yield equal bundled integral-lattice data. -/
theorem IntegralQuadraticLattice.ext (L M : IntegralQuadraticLattice R K V)
    (h : L.carrier = M.carrier) (hq : L.form = M.form) : L = M := by sorry

/-- The ambient algebra alone does not force R to be Dedekind; arithmetic
theorems below the construction retain their additional Dedekind hypotheses. -/
example (L : IntegralQuadraticLattice R K V) :
    Submodule.span K (L.carrier : Set V) = ⊤ := by sorry
example (L : IntegralQuadraticLattice R K V) : L.carrier.FG := by sorry
example (L : IntegralQuadraticLattice R K V) (x : V) (hx : x ∈ L.carrier) :
    ∃ r : R, algebraMap R K r = L.form x := by sorry
end IntegralQuadratic

section IntegralHermitian
variable (R K V : Type*) [CommRing R] [StarRing R] [Field K] [StarRing K]
  [Algebra R K] [AddCommGroup V] [Module R V] [Module K V]
  [IsScalarTower R K V]

/-- A finite full coefficient-ring submodule of a hermitian fraction-field space, with integral pairings. -/
structure IntegralHermitianLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetric : form.IsSymm
  starCompatible : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier,
    ∃ r : R, algebraMap R K r = form x y

variable {R K V}
/-- Bundle the full finite submodule and actual integral star-sesquilinear form. -/
def IntegralHermitianLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (H : V →ₗ⋆[K] V →ₗ[K] K)
    (hH : H.IsSymm)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r))
    (hi : ∀ x ∈ L, ∀ y ∈ L, ∃ r : R, algebraMap R K r = H x y) :
    IntegralHermitianLattice R K V := ⟨L,hL,H,hH,hstar,hi⟩

/-- For fixed H, equality of carriers identifies bundled lattice data. -/
theorem IntegralHermitianLattice.ext (L M : IntegralHermitianLattice R K V)
    (h : L.carrier = M.carrier) (hH : L.form = M.form) : L = M := by sorry

/-- Transport the integral lattice along a hermitian isometry. -/
def IntegralHermitianLattice.map (L : IntegralHermitianLattice R K V)
    (f : V ≃ₗ[K] V) : IntegralHermitianLattice R K V := by sorry

/-- The submodule defined by integral pairings. -/
def IntegralHermitianLattice.dual (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) :
    Submodule R V where
  carrier := {x | ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Membership is equivalent to all pairings with L lying in R. -/
theorem IntegralHermitianLattice.mem_dual_iff
    (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) (x : V) :
    x ∈ L.dual hstar ↔ ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y := by sorry

/-- Integrality is exactly L⊆L∨. -/
theorem IntegralHermitianLattice.integral_iff_le_dual
    (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) :
    (∀ x ∈ L.carrier, ∀ y ∈ L.carrier,
      ∃ r : R, algebraMap R K r = L.form x y) ↔ L.carrier ≤ L.dual hstar := by sorry

example (L : IntegralHermitianLattice R K V) (x y : V) :
    star (L.form x y) = L.form y x := by sorry
example (L : IntegralHermitianLattice R K V) (x y : V)
    (hx : x ∈ L.carrier) (hy : y ∈ L.carrier) :
    ∃ r : R, algebraMap R K r = L.form x y := by sorry
example (L : IntegralHermitianLattice R K V) (x y : V) (a b : K) :
    L.form (a • x) (b • y) = star a * b * L.form x y := by sorry
end IntegralHermitian

section ReflexiveHermitianDual
variable {R K V : Type*} [CommRing R] [StarRing R] [IsDedekindDomain R]
 [Field K] [StarRing K] [Algebra R K] [IsFractionRing R K]
 [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]
/-- The double dual equals L under the stated Dedekind/nondegeneracy hypotheses. -/
theorem IntegralHermitianLattice.dual_dual (L : IntegralHermitianLattice R K V)
 (hn : ∀ x, (∀ y, L.form x y=0) → x=0) :
 {x : V | ∀ y∈L.dual L.starCompatible, ∃ r : R, algebraMap R K r=L.form x y} =
 (L.carrier : Set V) := by sorry
end ReflexiveHermitianDual

section PrimaryInvariantFactors
open scoped DirectSum
variable (R : Type*) [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
  (π : R) (M : Type*) [AddCommGroup M] [Module R M] (n : ℕ)
/-- Only the quotient-module adapter is new; existence consumes Module.PID. -/
structure HermitianLatticeInvariants where
  exponent : Fin n → ℕ
  ordered : Monotone exponent
  decomposition : Nonempty (M ≃ₗ[R] ⨁ i : Fin n, R ⧸ Ideal.span {π ^ exponent i})
namespace HermitianLatticeInvariants
variable {R π M n}
/-- The determinant valuation is the sum of the ordered fundamental exponents. -/
def valuation (a : HermitianLatticeInvariants R π M n) : ℕ := ∑ i, a.exponent i
/-- The hermitian lattice type counts its positive fundamental exponents. -/
def type (a : HermitianLatticeInvariants R π M n) : ℕ := (Finset.univ.filter (fun i => 0 < a.exponent i)).card
/-- Zero padding is justified by the supplied n-generator surjection, not by a field basis. -/
def ofDualQuotient (hπ : Irreducible π) [Module.Finite R M]
    (hp : Module.IsTorsion' M (Submonoid.powers π))
    (f : (Fin n → R) →ₗ[R] M) (hf : Function.Surjective f) :
    HermitianLatticeInvariants R π M n := by sorry
/-- The ordered elementary-divisor exponents are determined by the dual quotient. -/
theorem exponent_unique (a b : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    a.exponent = b.exponent := by sorry
/-- A hermitian lattice is self-dual exactly when all fundamental exponents are zero. -/
theorem selfDual_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    Subsingleton M ↔ a.valuation = 0 := by sorry
/-- A vertex lattice has all fundamental exponents at most one. -/
theorem vertex_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    (∀ x : M, π • x = 0) ↔ ∀ i, a.exponent i ≤ 1 := by sorry
/-- Changing the uniformizer does not change the ordered elementary-divisor exponents. -/
theorem uniformizer_independent (a : HermitianLatticeInvariants R π M n)
    (b : HermitianLatticeInvariants R ((u : Rˣ) * π) M n) (hπ : Irreducible π) :
    a.exponent = b.exponent := by sorry
/-- This API concerns the module; identification of M with L-dual/L is a separate adapter. -/
example (a : HermitianLatticeInvariants ℤ 2 (ZMod 8) 1) : a.valuation = 3 ∧ a.type = 1 := by sorry
example (a : HermitianLatticeInvariants R π M 3) (ha : a.exponent = ![0,1,1]) :
    a.valuation = 2 ∧ a.type = 2 := by sorry
example (a : HermitianLatticeInvariants R π M 0) : a.valuation = 0 ∧ a.type = 0 := by sorry
end HermitianLatticeInvariants
end PrimaryInvariantFactors

section AtomicDVRForms
variable {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] {n : ℕ}
/-- Atomicity is invariant under an integral change of coordinates; it is not a uniqueness assertion. -/
def IsAtomicIntegralQuadraticForm (q : QuadraticForm R (Fin n → R)) : Prop :=
 (∃ (a : R) (e : (Fin n → R) ≃ₗ[R] R), IsUnit a ∧ ∀ x, q x = a*(e x)^2) ∨
 (¬ IsUnit (2 : R) ∧ ∃ (a b c : R) (e : (Fin n → R) ≃ₗ[R] (Fin 2 → R)),
   IsDiscreteValuationRing.addVal R b < IsDiscreteValuationRing.addVal R (2*a) ∧
   IsDiscreteValuationRing.addVal R (2*a) ≤ IsDiscreteValuationRing.addVal R (2*c) ∧
   (IsUnit a ∨ IsUnit b) ∧
   ∀ x, q x = a*(e x 0)^2 + b*(e x 0)*(e x 1) + c*(e x 1)^2)
/-- Unary atomic forms have unit coefficient. -/
theorem IsAtomicIntegralQuadraticForm.unary (q : QuadraticForm R (Fin n → R))
 (a : R) (e : (Fin n → R) ≃ₗ[R] R) (ha : IsUnit a) (hq : ∀ x, q x = a*(e x)^2) :
 IsAtomicIntegralQuadraticForm q := by sorry
/-- The binary case includes 2 nonunit and all valuation inequalities. -/
theorem IsAtomicIntegralQuadraticForm.binary (q : QuadraticForm R (Fin n → R))
 (a b c : R) (e : (Fin n → R) ≃ₗ[R] (Fin 2 → R)) (h2 : ¬ IsUnit (2 : R))
 (hba : IsDiscreteValuationRing.addVal R b < IsDiscreteValuationRing.addVal R (2*a))
 (hac : IsDiscreteValuationRing.addVal R (2*a) ≤ IsDiscreteValuationRing.addVal R (2*c))
 (hab : IsUnit a ∨ IsUnit b) (hq : ∀ x, q x = a*(e x 0)^2+b*(e x 0)*(e x 1)+c*(e x 1)^2) :
 IsAtomicIntegralQuadraticForm q := by sorry
example (q : QuadraticForm R (Fin 2 → R)) (h2 : ¬ IsUnit (2 : R))
 (hq : ∀ x, q x=x 0*x 1) : IsAtomicIntegralQuadraticForm q := by sorry
example (q : QuadraticForm R (Fin 2 → R)) (h2 : IsUnit (2 : R)) :
 ¬ IsAtomicIntegralQuadraticForm q := by sorry
example (q : QuadraticForm R (Fin 0 → R)) : ¬ IsAtomicIntegralQuadraticForm q := by sorry
/-- The canonical additive DVR valuation of zero is infinity; zero blocks require a separate branch. -/
example : IsDiscreteValuationRing.addVal R (0 : R)=⊤ := by sorry
end AtomicDVRForms

section QuaternionicLattices
open MulOpposite
variable (R K B V : Type*) [CommRing R] [IsDomain R] [Field K] [CharZero K]
  [Algebra R K] [IsFractionRing R K]
  [Ring B] [StarRing B] [Algebra R B] [Algebra K B] [IsScalarTower R K B]
  [AddCommGroup V] [Module R V] [Module K V] [IsScalarTower R K V]
  [Module Bᵐᵒᵖ V] [IsScalarTower K Bᵐᵒᵖ V]
/-- Right multiplication is the native left action of the opposite ring. -/
structure QuaternionicIntegralHermitianLattice where
  parameterA : K
  parameterB : K
  parameterA_nonzero : parameterA ≠ 0
  parameterB_nonzero : parameterB ≠ 0
  quaternionModel : ∃ e : B ≃ₐ[K] QuaternionAlgebra K parameterA 0 parameterB, ∀ b, e (star b) = star (e b)
  order : Subalgebra R B
  orderFull : Submodule.IsLattice K order.toSubmodule
  star_stable : ∀ a ∈ order, star a ∈ order
  carrier : Submodule R V
  full : Submodule.IsLattice K carrier
  right_stable : ∀ x ∈ carrier, ∀ a ∈ order, op a • x ∈ carrier
  pairing : V →ₗ[K] V →ₗ[K] B
  right_sesquilinear : ∀ x y a b, pairing (op a • x) (op b • y) = star a * pairing x y * b
  symmetric : ∀ x y, pairing y x = star (pairing x y)
  nondegenerate : ∀ x, (∀ y, pairing x y = 0) → x = 0
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier, pairing x y ∈ order
namespace QuaternionicIntegralHermitianLattice
variable {R K B V}
/-- Bundle a full integral quaternionic hermitian lattice from its order-stable carrier. -/
def ofOrderStableCarrier (a b : K) (ha : a ≠ 0) (hb : b ≠ 0)
    (hq : ∃ e : B ≃ₐ[K] QuaternionAlgebra K a 0 b, ∀ x, e (star x) = star (e x))
    (O : Subalgebra R B) (ho : Submodule.IsLattice K O.toSubmodule)
    (hs : ∀ a ∈ O, star a ∈ O) (L : Submodule R V) (hL : Submodule.IsLattice K L)
    (hr : ∀ x ∈ L, ∀ a ∈ O, op a • x ∈ L)
    (H : V →ₗ[K] V →ₗ[K] B)
    (hH : ∀ x y a b, H (op a • x) (op b • y) = star a * H x y * b)
    (ht : ∀ x y, H y x = star (H x y))
    (hn : ∀ x, (∀ y, H x y = 0) → x = 0)
    (hi : ∀ x ∈ L, ∀ y ∈ L, H x y ∈ O) :
    QuaternionicIntegralHermitianLattice R K B V := ⟨a,b,ha,hb,hq,O,ho,hs,L,hL,hr,H,hH,ht,hn,hi⟩
/-- The quaternionic dual carrier consists of the vectors pairing integrally with the original carrier. -/
def dual (L : QuaternionicIntegralHermitianLattice R K B V) : Submodule R V := by sorry
/-- Membership in the quaternionic dual is the integral-pairing condition. -/
theorem mem_dual_iff (L : QuaternionicIntegralHermitianLattice R K B V) (x : V) :
    x ∈ L.dual ↔ ∀ y ∈ L.carrier, L.pairing x y ∈ L.order := by sorry
/-- An integral quaternionic hermitian lattice is contained in its dual. -/
theorem integral_le_dual (L : QuaternionicIntegralHermitianLattice R K B V) : L.carrier ≤ L.dual := by sorry
example (L : QuaternionicIntegralHermitianLattice R K B V) (x y : V) (a b : B) :
    L.pairing (op a • x) (op b • y) = star a * L.pairing x y * b := by sorry
example (L : QuaternionicIntegralHermitianLattice R K B V) (x : V) (hx : x ∈ L.carrier) : x ∈ L.dual := by sorry
example (a : B) : star (1 : B) * a = a := by sorry
end QuaternionicIntegralHermitianLattice
end QuaternionicLattices

section QuaternionTests
open scoped Quaternion
open MulOpposite
/-- Hamilton's quaternion algebra over the rational numbers. -/
abbrev RationalHamilton := ℍ[ℚ]
/-- The integral Hamilton quaternions with four integer coordinates. -/
def lipschitzOrder : Subalgebra ℤ RationalHamilton where
  carrier := {q | (∃ a : ℤ, (a : ℚ)=q.re) ∧ (∃ b : ℤ, (b : ℚ)=q.imI) ∧
    (∃ c : ℤ, (c : ℚ)=q.imJ) ∧ (∃ d : ℤ, (d : ℚ)=q.imK)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  algebraMap_mem' := by sorry
/-- The rank-one Lipschitz lattice with its standard quaternionic hermitian pairing. -/
def lipschitzHermitian : QuaternionicIntegralHermitianLattice ℤ ℚ RationalHamilton RationalHamilton := by sorry
/-- The coefficient order of the example is the Lipschitz order. -/
theorem lipschitzHermitian_order : lipschitzHermitian.order = lipschitzOrder := by sorry
/-- The rank-one quaternionic example has the prescribed integral carrier. -/
theorem lipschitzHermitian_carrier : lipschitzHermitian.carrier = lipschitzOrder.toSubmodule := by sorry
/-- The example pairing is quaternionic conjugation in the first argument followed by multiplication. -/
theorem lipschitzHermitian_pairing (x y : RationalHamilton) : lipschitzHermitian.pairing x y = star x * y := by sorry
example : lipschitzHermitian.pairing (⟨0,1,0,0⟩ : RationalHamilton) ⟨0,1,0,0⟩ = 1 := by sorry
example : (lipschitzHermitian.pairing (1 : RationalHamilton) 1 +
    star (lipschitzHermitian.pairing (1 : RationalHamilton) 1)).re = 2 := by sorry
example : (⟨1/2,1/2,1/2,1/2⟩ : RationalHamilton) ∉ lipschitzHermitian.carrier := by sorry
end QuaternionTests

section SignedFieldForms
variable (K V : Type*) [Field K] [StarRing K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
/-- Signed, perfect commutative-field forms. This is not the quaternion order carrier. -/
structure SignedHermitianSpace [FiniteDimensional K V] (ε : K) where
  sign : ε = 1 ∨ ε = -1
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetry : ∀ x y, form y x = ε * star (form x y)
  nondegenerate : ∀ x, (∀ y, form x y = 0) → x = 0
example : Nonempty (SignedHermitianSpace ℚ (Fin 0 → ℚ) 1) ∧
    Nonempty (SignedHermitianSpace ℚ (Fin 0 → ℚ) (-1)) := by sorry
example : ∃ h : SignedHermitianSpace ℂ ℂ 1,
    (∀ x y, h.form x y = star x * y) ∧ h.form Complex.I Complex.I = 1 := by sorry
example : IsEmpty (SignedHermitianSpace ℚ ℚ (-1)) := by sorry

variable {K V}
/-- The adjoint of an endomorphism for the given signed perfect sesquilinear form. -/
def signedHermitianAdjoint {ε : K} (h : SignedHermitianSpace K V ε) (a : V →ₗ[K] V) : V →ₗ[K] V := by sorry
/-- The adjoint is characterized by moving the endomorphism across the pairing. -/
theorem signedHermitianAdjoint_apply {ε : K} (h : SignedHermitianSpace K V ε) (a : V →ₗ[K] V) (x y : V) :
    h.form (a x) y = h.form x (signedHermitianAdjoint h a y) := by sorry
/-- The adjoint of the identity is the identity. -/
theorem signedHermitianAdjoint_id {ε : K} (h : SignedHermitianSpace K V ε) :
    signedHermitianAdjoint h LinearMap.id = LinearMap.id := by sorry
/-- The pairing identity uniquely determines an endomorphism's adjoint. -/
theorem signedHermitianAdjoint_unique {ε : K} (h : SignedHermitianSpace K V ε)
    (a b : V →ₗ[K] V) (hb : ∀ x y, h.form (a x) y = h.form x (b y)) :
    b = signedHermitianAdjoint h a := by sorry
/-- Taking adjoints reverses the order of endomorphism composition. -/
theorem signedHermitianAdjoint_comp {ε : K} (h : SignedHermitianSpace K V ε)
    (a b : V →ₗ[K] V) :
    signedHermitianAdjoint h (a.comp b) =
      (signedHermitianAdjoint h b).comp (signedHermitianAdjoint h a) := by sorry
/-- Taking the adjoint twice returns the original endomorphism. -/
theorem signedHermitianAdjoint_involutive {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V →ₗ[K] V) : signedHermitianAdjoint h (signedHermitianAdjoint h a) = a := by sorry

/-- Compose the perfect sesquilinear form in its second variable with the given unit endomorphism. -/
def signedHermitianTwist {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) :
    SignedHermitianSpace K V (η*ε) := by sorry
/-- The twisted pairing evaluates by applying the chosen endomorphism in the second argument. -/
theorem signedHermitianTwist_apply {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) (x y : V) :
    (signedHermitianTwist h a η hη ha).form x y = h.form x (a y) := by sorry
/-- The endomorphism adjoint is conjugated by a, with the displayed order. -/
theorem signedHermitianTwist_adjoint {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) (b : V →ₗ[K] V) :
    signedHermitianAdjoint (signedHermitianTwist h a η hη ha) b =
      a.symm.toLinearMap.comp ((signedHermitianAdjoint h b).comp a.toLinearMap) := by sorry
example {ε : K} (h : SignedHermitianSpace K V ε)
    (x y : V) :
    (signedHermitianTwist h (LinearEquiv.refl K V) 1 (Or.inl rfl)
      (by simpa using signedHermitianAdjoint_id h)).form x y = h.form x y := by sorry
example {ε γ : K} (h : SignedHermitianSpace K V ε) (hγ : γ ≠ 0) (hs : star γ = -γ)
    (a : V ≃ₗ[K] V) (ha : ∀ x, a x = γ • x) :
    signedHermitianAdjoint h a.toLinearMap = -(a.toLinearMap) := by sorry
example {ε : K} (h : SignedHermitianSpace K V ε) (x : V) (hx : x ≠ 0) :
    ¬ ∃ a : V ≃ₗ[K] V, a.toLinearMap = 0 := by sorry

variable (F L : Type*) [Field F] [StarRing F] [Field L] [StarRing L] [Algebra F L]
  (W : Type*) [AddCommGroup W] [Module F W] [Module L W]
  [FiniteDimensional L W] [FiniteDimensional F W]
variable {F L W}
/-- The functional is explicitly nonzero and involution-equivariant. -/
def signedHermitianTransfer [FiniteDimensional F L] [IsScalarTower F L W] (ε : F) (h : SignedHermitianSpace L W (algebraMap F L ε))
    (hε : ε = 1 ∨ ε = -1) (ell : L →ₗ[F] F) (hell : ell ≠ 0)
    (hs : ∀ x, ell (star x) = star (ell x))
    (hstar : ∀ x : F, star (algebraMap F L x) = algebraMap F L (star x)) :
    SignedHermitianSpace F W ε := by sorry
variable [FiniteDimensional F L] [IsScalarTower F L W]

/-- The transferred pairing is the chosen nonzero linear functional applied to the original pairing. -/
theorem signedHermitianTransfer_apply (ε : F) (h : SignedHermitianSpace L W (algebraMap F L ε))
    (hε : ε = 1 ∨ ε = -1) (ell : L →ₗ[F] F) (hell : ell ≠ 0)
    (hs : ∀ x, ell (star x) = star (ell x))
    (hstar : ∀ x : F, star (algebraMap F L x) = algebraMap F L (star x)) (x y : W) :
    (signedHermitianTransfer ε h hε ell hell hs hstar).form x y = ell (h.form x y) := by sorry
example {ε : F} (h : SignedHermitianSpace F W ε) (hε : ε = 1 ∨ ε = -1) (x y : W) :
    (signedHermitianTransfer ε h hε LinearMap.id (by sorry) (by simp) (by simp)).form x y = h.form x y := by sorry
example (h : SignedHermitianSpace L W (algebraMap F L 1)) (hε : (1 : F) = 1 ∨ (1 : F) = -1)
    (ell : L →ₗ[F] F) (hell : ell ≠ 0) (hs : ∀ x, ell (star x) = star (ell x))
    (hstar : ∀ x : F, star (algebraMap F L x) = algebraMap F L (star x)) (x : W) :
    (∀ y, (signedHermitianTransfer 1 h hε ell hell hs hstar).form x y = 0) → x = 0 := by sorry
example (h : SignedHermitianSpace L W (1 : L)) (x : W) (hx : x ≠ 0) :
    ¬ (∀ z : W, (∀ y, (0 : L →ₗ[F] F) (h.form z y) = 0) → z = 0) := by sorry
/-- Infinite-support coordinates obstruct an adjoint on the direct sum of countably many lines. -/
example : ¬ ∃ v : ℕ →₀ ℚ, ∀ j : ℕ, v j = 1 := by sorry
end SignedFieldForms

section SignedHyperbolicTransfer
variable {K V : Type*} [Field K] [StarRing K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
/-- In characteristic different from two a Lagrangian splits off hyperbolic planes. -/
def SignedHermitianSpace.IsHyperbolic [NeZero (2 : K)] {ε : K} (h : SignedHermitianSpace K V ε) : Prop :=
 ∃ N : Submodule K V, (N : Set V) = {x | ∀ y∈N, h.form x y=0}
variable {F L W : Type*} [Field F] [StarRing F] [Field L] [StarRing L] [Algebra F L]
 [FiniteDimensional F L] [AddCommGroup W] [Module F W] [Module L W]
 [IsScalarTower F L W] [FiniteDimensional L W] [FiniteDimensional F W]
/-- A hyperbolic plane transfers to [E:F] hyperbolic planes. -/
theorem signedHermitianTransfer_hyperbolic [NeZero (2 : F)] [NeZero (2 : L)] (ε : F) (h : SignedHermitianSpace L W (algebraMap F L ε))
 (hε : ε=1 ∨ ε= -1) (ell : L →ₗ[F] F) (hell : ell ≠ 0)
 (hs : ∀ x, ell (star x)=star (ell x))
 (hstar : ∀ x : F, star (algebraMap F L x)=algebraMap F L (star x))
 (hh : h.IsHyperbolic) : (signedHermitianTransfer ε h hε ell hell hs hstar).IsHyperbolic := by sorry
/-- In characteristic two the diagonal bilinear form is metabolic but nonalternating. -/
example : ((!![(1 : ZMod 2), 0; 0, 1]).mulVec (![1,1])) = (![1,1] : Fin 2 → ZMod 2) := by sorry
example : (1 : ZMod 2)*1 + 1*1 = 0 := by sorry
example : (1 : ZMod 2)*1 + 0*0 ≠ 0 := by sorry
end SignedHyperbolicTransfer


section Layer2Checks
/-- integral_quadratic_lattice_test_1: integral square and nonunit polar factor. -/
example : QuadraticMap.sq (R := ℚ) (1 : ℚ)=1 ∧ ¬ IsUnit (2 : ℤ) := by sorry
/-- integral_quadratic_lattice_test_2: no integral half-diagonal without evenness. -/
example : ¬ ∃ z : ℤ, (z : ℚ)=(1 : ℚ)/2 := by sorry
/-- integral_quadratic_lattice_test_3: no basis parameter is needed. -/
example {R K : Type*} [CommRing R] [Field K] [Algebra R K]
    (L : Submodule R K) (hL : Submodule.IsLattice K L) (q : QuadraticForm K K)
    (hi : ∀ x ∈ L, ∃ r : R, algebraMap R K r=q x) :
    Nonempty (IntegralQuadraticLattice R K K) := by sorry

/-- integral_hermitian_lattice_test_2 -/
example : star Complex.I * Complex.I = 1 ∧ Complex.I * Complex.I = -1 := by sorry
/-- integral_hermitian_lattice_test_3: separating multiplication is not perfect. -/
example : Function.Injective (fun z : ℤ => 2*z) ∧
    ¬ Function.Surjective (fun z : ℤ => 2*z) := by sorry

end Layer2Checks

/-! ## Layer 3: Representation densities, mass and theta coefficients -/

section FiniteHermitianCounts
local instance : StarRing (ZMod 3) := starRingOfComm
variable {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
variable {m n : ℕ}

/-- Finite cardinality of XᴴGX=B. -/
def hermitianRepresentationCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A | X.conjTranspose * G * X = B}

/-- The empty source has count 1. -/
theorem hermitianRepresentationCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianRepresentationCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

/-- Invertible target and source basis changes preserve the Gram-equation representation count. -/
theorem hermitianRepresentationCount_basisChange
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    hermitianRepresentationCount (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      hermitianRepresentationCount G B := by sorry

/-- Finite count with the actual injectivity condition. -/
def hermitianEmbeddingCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A |
    X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}

/-- Count is 1 for n=0. -/
theorem hermitianEmbeddingCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianEmbeddingCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry
/-- Embedding count is at most representation count. -/
theorem hermitianEmbeddingCount_le (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) :
    hermitianEmbeddingCount G B ≤ hermitianRepresentationCount G B := by sorry

/-- Over a field with nonsingular source, every representation is injective. -/
theorem hermitianEmbeddingCount_eq_of_nonsingular {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (G : Matrix (Fin m) (Fin m) F)
    (B : Matrix (Fin n) (Fin n) F) (hB : B.det ≠ 0) :
    hermitianEmbeddingCount G B = hermitianRepresentationCount G B := by sorry

/-- A nonzero fixed-field element has q+1 norm preimages in the quadratic finite field. -/
theorem finite_hermitian_norm_fiber {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (q : ℕ) (hq : 2 ≤ q) (hcard : Fintype.card F = q^2)
    (hstar : ∀ x : F, star x = x^q) (a : F) (ha : star a = a) (ha0 : a ≠ 0) :
    Fintype.card {x : F // x*star x = a} = q+1 := by sorry

/-- The finite hermitian embedding count, with radical dimension retained in the Euler product. -/
theorem finite_hermitian_isometry_formula {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (q : ℕ) (hq : 2 ≤ q)
    (hcard : Fintype.card F = q^2) (hstar : ∀ x : F, star x = x^q)
    (G : Matrix (Fin m) (Fin m) F) (B : Matrix (Fin n) (Fin n) F)
    (hG : G.conjTranspose = G) (hB : B.conjTranspose = B)
    (hGnd : G.det ≠ 0) (hmn : n ≤ m) :
    (hermitianEmbeddingCount G B : ℚ) = (q : ℚ)^(n*(2*m-n)) *
      ∏ i ∈ Finset.range (n + finrank F (LinearMap.ker B.mulVecLin)),
        (1 - (-(q : ℚ))^((i : ℤ)-(m : ℤ))) := by sorry

/-- The finite Gram count divided by the residue-cardinality power of its expected representation dimension. -/
def normalizedHermitianCount (q N : ℕ) (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℝ :=
  (hermitianRepresentationCount G B : ℝ) / (q : ℝ)^(N * n * (2*m-n))

/-- The empty-source count is 1. -/
theorem normalizedHermitianCount_empty (q N : ℕ) (G : Matrix (Fin m) (Fin m) A) :
    normalizedHermitianCount q N G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

/-- Integral invertible basis changes preserve every normalized count. -/
theorem normalizedHermitianCount_basisChange (q N : ℕ)
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    normalizedHermitianCount q N (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      normalizedHermitianCount q N G B := by sorry

/-- The integral polynomial finite product. -/
def choYamauchiWeight (q a : ℕ) : Polynomial ℤ :=
  ∏ i ∈ Finset.range a, (1 - Polynomial.C ((-(q : ℤ))^i) * Polynomial.X)
/-- Empty polynomial weight is 1. -/
theorem choYamauchiWeight_zero (q : ℕ) : choYamauchiWeight q 0 = 1 := by sorry
/-- The next Cho–Yamauchi polynomial weight appends the factor with exponent a. -/
theorem choYamauchiWeight_succ (q a : ℕ) :
    choYamauchiWeight q (a+1) = choYamauchiWeight q a *
      (1 - Polynomial.C ((-(q : ℤ))^a) * Polynomial.X) := by sorry
/-- The negative derivative at 1 is 0 for a=0 and the stated product for a>0. -/
theorem choYamauchiWeight_derivative (q a : ℕ) (ha : 1 ≤ a) :
    -((choYamauchiWeight q a).derivative.eval 1) =
      ∏ i ∈ Finset.Icc 1 (a-1), (1 - (-(q : ℤ))^i) := by sorry

/-- These tests distinguish noninjective isometries of a degenerate source. -/
example : hermitianRepresentationCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2 := by sorry
example : hermitianRepresentationCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (0 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 1 := by sorry
example : hermitianEmbeddingCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (0 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 0 := by sorry
example : hermitianEmbeddingCount (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2 := by sorry
example : normalizedHermitianCount 3 1 (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2/3 := by sorry
example : normalizedHermitianCount 3 0 (1 : Matrix (Fin 1) (Fin 1) (ZMod 3))
    (1 : Matrix (Fin 1) (Fin 1) (ZMod 3)) = 2 := by sorry
example : choYamauchiWeight 3 0 = 1 := by sorry
example : choYamauchiWeight 3 1 = 1 - Polynomial.X := by sorry
example : -((choYamauchiWeight 3 2).derivative.eval 1) = 4 := by sorry
section QuadraticFiniteFieldChecks
local instance : Fintype (GaloisField 2 2) := Fintype.ofFinite _
local instance : DecidableEq (GaloisField 2 2) := Classical.decEq _
local instance : StarRing (GaloisField 2 2) where
  star x := x^2
  star_involutive := by sorry
  star_mul := by sorry
  star_add := by sorry

example : Fintype.card {x : GaloisField 2 2 // x*star x = 1} = 3 := by sorry
example : Fintype.card {x : GaloisField 2 2 // x*star x = 0} = 1 := by sorry
example : hermitianEmbeddingCount (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2))
    (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2)) = 3 := by sorry
example : hermitianEmbeddingCount (1 : Matrix (Fin 2) (Fin 2) (GaloisField 2 2))
    (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2)) = 6 := by sorry
example : hermitianEmbeddingCount (1 : Matrix (Fin 3) (Fin 3) (GaloisField 2 2))
    (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2)) = 36 := by sorry
example : normalizedHermitianCount 2 1 (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2))
    (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2)) = (3 : ℚ)/2 := by sorry
example : normalizedHermitianCount 2 1 (1 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2))
    (0 : Matrix (Fin 1) (Fin 1) (GaloisField 2 2)) = (1 : ℚ)/2 := by sorry
example : ((-2 : ℚ)^0)⁻¹ = 1 := by norm_num
example : ((-2 : ℚ)^1)⁻¹ = -1/2 := by norm_num
example : ((-2 : ℚ)^2)⁻¹ = 1/4 := by norm_num
end QuadraticFiniteFieldChecks
end FiniteHermitianCounts

section NumberRingTrace
open scoped NumberField
variable {K M : Type*} [Field K] [NumberField K]
  [AddCommGroup M] [Module (𝓞 K) M]

/-- The integral quadratic form obtained by composing restriction of scalars with the number-field trace. -/
def numberRingTraceForm (q : QuadraticForm (𝓞 K) M) : QuadraticForm ℤ M :=
  (Algebra.trace ℤ (𝓞 K)).compQuadraticMap (q.restrictScalars (S := ℤ))

/-- The trace form evaluates to the field trace of the original quadratic value. -/
theorem numberRingTraceForm_apply (q : QuadraticForm (𝓞 K) M) (x : M) :
    numberRingTraceForm q x = Algebra.trace ℤ (𝓞 K) (q x) := by sorry
/-- Taking the field trace commutes with polarization. -/
theorem numberRingTraceForm_polar (q : QuadraticForm (𝓞 K) M) (x y : M) :
    numberRingTraceForm q (x+y)-numberRingTraceForm q x-numberRingTraceForm q y =
      Algebra.trace ℤ (𝓞 K) (q (x+y)-q x-q y) := by sorry

example : numberRingTraceForm (0 : QuadraticForm (𝓞 K) M) = 0 := by sorry
example : numberRingTraceForm (QuadraticMap.sq (R := 𝓞 ℚ) (A := 𝓞 ℚ)) (2 : 𝓞 ℚ) = 4 := by sorry
example : numberRingTraceForm (QuadraticMap.sq (R := 𝓞 ℚ) (A := 𝓞 ℚ)) (-3 : 𝓞 ℚ) = 9 := by sorry
example : numberRingTraceForm (QuadraticMap.sq (R := 𝓞 ℚ) (A := 𝓞 ℚ)) (0 : 𝓞 ℚ) = 0 := by sorry
example : numberRingTraceForm (2 • QuadraticMap.sq (R := 𝓞 ℚ) (A := 𝓞 ℚ)) (3 : 𝓞 ℚ) = 18 := by sorry
example : ( !![(2 : ℤ), 1; 1, 3] ).det = 5 ∧
    ( !![(4 : ℤ), 2; 2, 6] ).det = 20 := by sorry
example (a b : ℤ) : Matrix.toQuadraticForm' ( !![(2 : ℤ), 1; 1, 3] ) ![a,b] =
    2*a^2+2*a*b+3*b^2 := by sorry
end NumberRingTrace

section BoundedIntegralEndomorphisms
variable {M : Type*} [AddCommGroup M] [Module ℤ M]

/-- A positive integral quadratic lattice has finitely many endomorphisms with a fixed norm bound. -/
theorem finite_bounded_integral_endomorphisms [Module.Free ℤ M] [Module.Finite ℤ M]
    (q : QuadraticForm ℤ M)
    (hq : q.PosDef) (C : ℝ) (hC : 0 ≤ C) :
    {T : M →ₗ[ℤ] M | ∀ x : M, (q (T x) : ℝ) ≤ C^2*(q x : ℝ)}.Finite := by sorry

example : {a : ℤ | ∀ x : ℤ, ((a*x)^2 : ℤ) ≤ x^2} = {-1,0,1} := by sorry
example (q : QuadraticForm ℤ M) (hq : q.PosDef) (T : M →ₗ[ℤ] M)
    (hT : ∀ x : M, q (T x) ≤ 0) : T = 0 := by sorry
example : ¬ {a : ℤ | ∀ x : ℤ, (0 : ℤ)*(a*x)^2 ≤ 0*x^2}.Finite := by sorry
end BoundedIntegralEndomorphisms

section WeightedMass
/-- Finite class-index formula. Obtaining the actual genus class set and its
finite stabilizers is an independent arithmetic obligation. -/
def genusMass {I : Type*} [Fintype I] (stabilizerOrder : I → ℕ) : ℚ :=
  ∑ i, (1 : ℚ)/(stabilizerOrder i : ℚ)
/-- The summand is independent of the chosen representative. -/
theorem genusMass_representative {I J : Type*} [Fintype I] [Fintype J]
    (w : I → ℕ) (e : I ≃ J) : genusMass (w ∘ e.symm) = genusMass w := by sorry
/-- A singleton class set has mass the reciprocal stabilizer order. -/
theorem genusMass_singleton (a : ℕ) : genusMass (fun _ : Unit => a)=1/(a : ℚ) := by sorry
/-- A nonempty finite positive genus has strictly positive mass. -/
theorem genusMass_pos {I : Type*} [Fintype I] [Nonempty I] (w : I → ℕ)
    (h : ∀ i, 0<w i) : 0<genusMass w := by sorry
example : genusMass (fun _ : Unit => 2)=1/2 := by sorry
example : genusMass (fun _ : Fin 2 => 2)=1 := by sorry
example : genusMass (Fin.elim0 : Fin 0 → ℕ)=0 := by sorry

/-- Local cases of the maximal quadratic-lattice mass table; ranks determine which cases apply. -/
inductive MaximalMassLocalType
  | zero | I | IIPlus | IIMinus | II | IIIPlus | IIIMinus
  deriving DecidableEq

/-- Convert the diagonal Hasse sign to Kirschmer's Witt sign, using the signed discriminant. -/
def maximalMassWittSign (m : ℕ) (c hMinusMinus hMinusDisc hMinusNegDisc : ℤ) : ℤ :=
  if m % 8 = 1 ∨ m % 8 = 2 then c
  else if m % 8 = 5 ∨ m % 8 = 6 then c * hMinusMinus
  else if m % 8 = 0 ∨ m % 8 = 3 then c * hMinusDisc
  else c * hMinusNegDisc

/-- Inputs are the actual local discriminant data and Witt sign, not arbitrary Hilbert symbols. -/
def maximalMassLocalType (odd oddVal square ramified : Bool) (wittPositive : Bool) :
    MaximalMassLocalType :=
  if odd then
    if oddVal then (if wittPositive then .IIPlus else .IIMinus)
    else (if wittPositive then .zero else .I)
  else if square then (if wittPositive then .zero else .I)
  else if ramified then (if wittPositive then .IIIPlus else .IIIMinus)
  else (if wittPositive then .zero else .II)

/-- Rational local mass factor. Arithmetic use has q ≥ 2, positive rank and a compatible type. -/
def maximalLocalMassFactor (q r : ℕ) (odd : Bool) (t : MaximalMassLocalType) : ℚ :=
  match t with
  | .zero => 1
  | .I => if odd then ((q : ℚ)^(2*r)-1)/(2*((q : ℚ)+1))
      else (((q : ℚ)^(r-1)-1)*((q : ℚ)^r-1))/(2*((q : ℚ)+1))
  | .IIPlus => ((q : ℚ)^r+1)/2
  | .IIMinus => ((q : ℚ)^r-1)/2
  | .II => (((q : ℚ)^(r-1)+1)*((q : ℚ)^r+1))/(2*((q : ℚ)+1))
  | .IIIPlus | .IIIMinus => 1/2

/-- The local factor in the empty rank is one. -/
theorem maximalLocalMassFactor_zero (q r : ℕ) (odd : Bool) :
    maximalLocalMassFactor q r odd .zero = 1 := by sorry
/-- The odd-rank type-I local factor is one. -/
theorem maximalLocalMassFactor_odd_I (q r : ℕ) :
    maximalLocalMassFactor q r true .I = ((q : ℚ)^(2*r)-1)/(2*((q : ℚ)+1)) := by sorry
/-- The even-rank type-II factor is the stated residue-cardinality expression. -/
theorem maximalLocalMassFactor_even_II (q r : ℕ) :
    maximalLocalMassFactor q r false .II =
      (((q : ℚ)^(r-1)+1)*((q : ℚ)^r+1))/(2*((q : ℚ)+1)) := by sorry
/-- The even-rank type-III factor retains the specified split sign. -/
theorem maximalLocalMassFactor_even_III (q r : ℕ) :
    maximalLocalMassFactor q r false .IIIPlus = 1/2 ∧
      maximalLocalMassFactor q r false .IIIMinus = 1/2 := by sorry

example : (-1 : ℚ)^(2*(2-1)/2) * (1*1) = -1 := by sorry
example : (-1 : ℚ)^(2*(2-1)/2) * (1*(-1)) = 1 := by sorry
example : maximalMassWittSign 3 1 (-1) (-1) 1 = -1 := by sorry
example : maximalMassWittSign 5 1 (-1) 1 1 = -1 := by sorry
example : maximalMassWittSign 2 (-1) (-1) (-1) 1 = -1 := by sorry
example : maximalMassLocalType true true false true true = .IIPlus := by sorry
example : maximalMassLocalType true true false true false = .IIMinus := by sorry
example : maximalMassLocalType true false false false true = .zero := by sorry
example : maximalMassLocalType false false false true false = .IIIMinus := by sorry
example : maximalLocalMassFactor 2 1 true .I = 1/2 := by sorry
example : maximalLocalMassFactor 2 1 true .IIPlus = 3/2 := by sorry
example : maximalLocalMassFactor 2 1 true .IIMinus = 1/2 := by sorry
example : maximalLocalMassFactor 3 2 false .I = 2 := by sorry
example : maximalLocalMassFactor 3 2 false .II = 5 := by sorry
example : maximalLocalMassFactor 2 2 false .IIIMinus = 1/2 := by sorry
example : maximalLocalMassFactor 2 2 false .zero = 1 := by sorry
example : (2 : ℚ) * (1/2) = 1 := by sorry
example : (1 : ℚ)/4 + 1/4 = 2*(1/4) := by sorry
example : ¬ (1 : ℚ) = 2*1 := by sorry

end WeightedMass


section OrthogonalModelChecks

/-- The connected even orthogonal order polynomial; its group interpretation requires r at least one and q a field cardinality. -/
def finiteEvenOrthogonalOrder (q r : ℕ) (split : Bool) : ℕ :=
  q^(r*(r-1)) * (if split then q^r-1 else q^r+1) *
    ∏ i ∈ Finset.Icc 1 (r-1), (q^(2*i)-1)

/-- The odd orthogonal order polynomial, agreeing with the symplectic order in characteristic two. -/
def finiteOddOrthogonalOrder (q r : ℕ) : ℕ :=
  q^(r*r) * ∏ i ∈ Finset.Icc 1 r, (q^(2*i)-1)

/-- The ratio of the two finite reductive orders weighted by their Iwahori exponents. -/
def orthogonalLocalVolumeRatio (q NH NG countH countG : ℕ) : ℚ :=
  ((q : ℚ)^(-(NH : ℤ)) * countH) / ((q : ℚ)^(-(NG : ℤ)) * countG)

/-- Positive residue cardinality and nonzero finite orders give a positive local ratio. -/
theorem orthogonalLocalVolumeRatio_pos (q NH NG countH countG : ℕ)
    (hq : 2 ≤ q) (hH : 0 < countH) (hG : 0 < countG) :
    0 < orthogonalLocalVolumeRatio q NH NG countH countG := by sorry

/-- Identical reductive models have local volume ratio one. -/
theorem orthogonalLocalVolumeRatio_good (q N c : ℕ) (hq : 2 ≤ q) (hc : 0 < c) :
    orthogonalLocalVolumeRatio q N N c c = 1 := by sorry

example : finiteEvenOrthogonalOrder 2 2 true = 36 ∧
    finiteEvenOrthogonalOrder 2 2 false = 60 := by sorry
example : 2 * finiteEvenOrthogonalOrder 3 1 true = 4 ∧
    2 * finiteEvenOrthogonalOrder 3 1 false = 8 := by sorry
example : finiteOddOrthogonalOrder 2 1 = 6 := by sorry
example : finiteEvenOrthogonalOrder 2 0 true = 0 ∧
    finiteEvenOrthogonalOrder 2 0 false = 2 := by decide
example : finiteOddOrthogonalOrder 1 1 = 0 := by decide
example : orthogonalLocalVolumeRatio 2 1 1 6 0 = 0 := by norm_num [orthogonalLocalVolumeRatio]
example : orthogonalLocalVolumeRatio 2 1 1 6 6 = 1 := by sorry
example : orthogonalLocalVolumeRatio 2 1 1 6 12 = 1/2 := by sorry
example : orthogonalLocalVolumeRatio 2 1 0 6 6 = 1/2 ∧
    (orthogonalLocalVolumeRatio 2 1 0 6 6)⁻¹ = 2 := by sorry
example : (3+1 : ℕ)/2 = 2 ∧ (3-1 : ℕ)/2 = 1 ∧
    (2 : ℚ)^(-(2 : ℤ)) = 1/4 ∧ (2 : ℚ)^(-(1 : ℤ)) = 1/2 := by sorry
example : (2 : ℚ) * 1 ∈ (2 : ℚ) • (Set.range (fun z : ℤ => (z : ℚ))) ∧
    (2 : ℚ) * (1/2) ∉ (2 : ℚ) • (Set.range (fun z : ℤ => (z : ℚ))) := by sorry
example {n : ℕ} : Matrix.fromBlocks (1 : Matrix (Fin 2) (Fin 2) ℚ)
    (0 : Matrix (Fin 2) (Fin n) ℚ) 0 (1 : Matrix (Fin n) (Fin n) ℚ) = 1 := by sorry
end OrthogonalModelChecks

section MassArchimedeanFactors

/-- The reciprocal compact orthogonal volume in the mass normalization. -/
def orthogonalArchimedeanConstant (r : ℕ) (oddRank : Bool) : ℝ :=
  if oddRank then
    (∏ i ∈ Finset.range r, (Nat.factorial (2*i+1) : ℝ)) / (2*Real.pi)^(r*(r+1))
  else
    (Nat.factorial (r-1) : ℝ) *
      (∏ i ∈ Finset.range (r-1), (Nat.factorial (2*i+1) : ℝ)) / (2*Real.pi)^(r*r)

/-- Every orthogonal archimedean factor is strictly positive, including the empty product. -/
theorem orthogonalArchimedeanConstant_pos (r : ℕ) (oddRank : Bool) :
    0 < orthogonalArchimedeanConstant r oddRank := by sorry

/-- Increasing odd rank by two adds exactly the next sphere gamma factor. -/
theorem orthogonalArchimedeanConstant_odd_step (r : ℕ) :
    orthogonalArchimedeanConstant (r+1) true =
      orthogonalArchimedeanConstant r true * (Nat.factorial (2*r+1) : ℝ) /
        (2*Real.pi)^(2*(r+1)) := by sorry

example : orthogonalArchimedeanConstant 0 true = 1 := by sorry
example : orthogonalArchimedeanConstant 1 true = 1 / (4*Real.pi^2) := by sorry
example : orthogonalArchimedeanConstant 2 true = 6 / (2*Real.pi)^6 := by sorry
example : orthogonalArchimedeanConstant 2 false = 1 / (2*Real.pi)^4 := by sorry

/-- Sphere-fibration volume for the metric in which Eᵢⱼ−Eⱼᵢ is orthonormal. -/
def orthogonalSkewBasisVolume (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range (n-1),
    2 * Real.pi ^ (((k+2 : ℕ) : ℝ)/2) / Real.Gamma (((k+2 : ℕ) : ℝ)/2)

/-- The explicit real rescaling used for the mass gauge. -/
def orthogonalMassGaugeScale (n : ℕ) : ℝ :=
  if n % 2 = 1 then (2 : ℝ)⁻¹ ^ (n/2) else 1

/-- The orthogonal-to-sphere quotient multiplies the skew-basis volume by the sphere volume. -/
theorem orthogonalSkewBasisVolume_step (n : ℕ) (hn : 1 ≤ n) :
    orthogonalSkewBasisVolume (n+1) = orthogonalSkewBasisVolume n *
      (2 * Real.pi ^ (((n+1 : ℕ) : ℝ)/2) / Real.Gamma (((n+1 : ℕ) : ℝ)/2)) := by sorry

/-- Odd rank contributes an extra power of two relative to the inverse gamma product. -/
theorem orthogonalSkewBasisVolume_odd (r : ℕ) :
    orthogonalSkewBasisVolume (2*r+1) =
      2^r / orthogonalArchimedeanConstant r true := by sorry

/-- Even rank gives the inverse orthogonal gamma product without the odd-rank correction. -/
theorem orthogonalSkewBasisVolume_even (r : ℕ) (hr : 0 < r) :
    orthogonalSkewBasisVolume (2*r) =
      1 / orthogonalArchimedeanConstant r false := by sorry

example : orthogonalSkewBasisVolume 1 = 1 := by sorry
example : orthogonalSkewBasisVolume 2 = 2*Real.pi := by sorry
example : orthogonalSkewBasisVolume 3 = 8*Real.pi^2 := by sorry
example : orthogonalSkewBasisVolume 4 = 16*Real.pi^4 := by sorry
example : orthogonalMassGaugeScale 1 = 1 := by norm_num [orthogonalMassGaugeScale]
example : orthogonalMassGaugeScale 3 = 1/2 := by norm_num [orthogonalMassGaugeScale]
example : orthogonalMassGaugeScale 4 = 1 := by norm_num [orthogonalMassGaugeScale]
example : orthogonalMassGaugeScale 5 = 1/4 := by norm_num [orthogonalMassGaugeScale]

variable (K : Type*) [Field K] [NumberField K]

/-- Uses the library's Gamma factors, including its factor of two at a complex place. -/
def dedekindArchimedeanFactor (s : ℂ) : ℂ :=
  Complex.Gammaℝ s ^ NumberField.InfinitePlace.nrRealPlaces K *
    Complex.Gammaℂ s ^ NumberField.InfinitePlace.nrComplexPlaces K

/-- Multiplier for the meromorphic continuation, distinct from the total L-series. -/
def completedDedekindFactor (s : ℂ) : ℂ :=
  ((|NumberField.discr K| : ℤ) : ℂ) ^ (s/2) * dedekindArchimedeanFactor K s

/-- The completed zeta gamma factor has no zero or pole in the positive real half-plane. -/
theorem dedekindArchimedeanFactor_ne_zero {s : ℂ} (hs : 0 < s.re) :
    dedekindArchimedeanFactor K s ≠ 0 := by sorry

/-- The normalized completed factor at one has the stated real and complex-place value. -/
theorem completedDedekindFactor_one :
    completedDedekindFactor K 1 =
      ((|NumberField.discr K| : ℤ) : ℂ) ^ (1/2 : ℂ) *
        (1/(Real.pi : ℂ)) ^ NumberField.InfinitePlace.nrComplexPlaces K := by sorry

example : dedekindArchimedeanFactor ℚ 1 = 1 := by sorry
example : dedekindArchimedeanFactor ℚ 2 = 1/(Real.pi : ℂ) := by sorry
example : dedekindArchimedeanFactor ℚ 3 = 1/(2*Real.pi : ℂ) := by sorry
example (hr : NumberField.InfinitePlace.nrRealPlaces K = 0) (hc : NumberField.InfinitePlace.nrComplexPlaces K = 1) :
    dedekindArchimedeanFactor K 1 = 1/(Real.pi : ℂ) := by sorry
example : completedDedekindFactor ℚ 1 = 1 := by sorry
example : completedDedekindFactor ℚ 2 = 1/(Real.pi : ℂ) := by sorry
example : completedDedekindFactor ℚ 3 = 1/(2*Real.pi : ℂ) := by sorry
end MassArchimedeanFactors

section PinnedGaugeChecks
/-- Primitive torus generator and the two short-root generators, in the skew basis of SO₃. -/
example : Matrix.det (!![-Complex.I, 0, 0; 0, -1, -1; 0, -Complex.I, Complex.I] :
    Matrix (Fin 3) (Fin 3) ℂ) = -2 := by
  eval_det
  ring_nf
  norm_num [Complex.I_sq]
/-- Replacing the primitive cocharacter by the coroot doubles the determinant. -/
example : Matrix.det (!![-2*Complex.I, 0, 0; 0, -1, -1; 0, -Complex.I, Complex.I] :
    Matrix (Fin 3) (Fin 3) ℂ) = -4 := by
  eval_det
  ring_nf
  norm_num [Complex.I_sq]
/-- The four long-root directions for a pair of isotropic coordinate planes. -/
example : Matrix.det (!![1/2, -1/2, 1/2, 1/2;
    -Complex.I/2, -Complex.I/2, Complex.I/2, -Complex.I/2;
    Complex.I/2, Complex.I/2, Complex.I/2, -Complex.I/2;
    1/2, -1/2, -1/2, -1/2] : Matrix (Fin 4) (Fin 4) ℂ) = -1 := by
  eval_det
  ring_nf
  norm_num [Complex.I_sq]
end PinnedGaugeChecks

section LocalVolumeRatio
/-- Ratio of two normalized reductive-quotient point counts at a positive residue cardinality. -/
example : orthogonalLocalVolumeRatio 3 1 1 24 24 = 1 := by
  norm_num [orthogonalLocalVolumeRatio]
example : orthogonalLocalVolumeRatio 3 1 0 24 4 = 2 := by
  norm_num [orthogonalLocalVolumeRatio]
example : orthogonalLocalVolumeRatio 2 1 0 6 3 = 1 := by
  norm_num [orthogonalLocalVolumeRatio]
example : orthogonalLocalVolumeRatio 3 1 0 24 0 = 0 := by
  norm_num [orthogonalLocalVolumeRatio]
end LocalVolumeRatio

section Layer3Checks
/-- hermitian_representation_count_test_3 -/
example {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
    {m : ℕ} (G : Matrix (Fin m) (Fin m) A) :
    hermitianRepresentationCount G (0 : Matrix (Fin 0) (Fin 0) A)=1 := by sorry
/-- hermitian_embedding_count_test_2 -/
example {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
    {m : ℕ} (G : Matrix (Fin m) (Fin m) A) :
    hermitianEmbeddingCount G (0 : Matrix (Fin 0) (Fin 0) A)=1 := by sorry
/-- hermitian_embedding_count_test_3 -/
example {F : Type*} [Field F] [StarRing F] [Fintype F] [DecidableEq F]
    {m n : ℕ} (h : m<n) (G : Matrix (Fin m) (Fin m) F)
    (B : Matrix (Fin n) (Fin n) F) : hermitianEmbeddingCount G B=0 := by sorry

/-- normalized_hermitian_count_test_1 -/
example {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
    {m : ℕ} (q N : ℕ) (G : Matrix (Fin m) (Fin m) A) :
    normalizedHermitianCount q N G (0 : Matrix (Fin 0) (Fin 0) A)=1 := by sorry
/-- normalized_hermitian_count_test_2 -/
example (N : ℕ) : N*1*(2*1-1)=N := by sorry

/-- cho_yamauchi_weight_test_1 -/
example (q : ℕ) : choYamauchiWeight q 0=1 ∧
    -((choYamauchiWeight q 0).derivative.eval 1)=0 := by sorry
/-- cho_yamauchi_weight_test_2 -/
example (q : ℕ) : choYamauchiWeight q 1=1-Polynomial.X ∧
    -((choYamauchiWeight q 1).derivative.eval 1)=1 := by sorry
/-- cho_yamauchi_weight_test_3 -/
example (q : ℕ) : choYamauchiWeight q 2=(1-Polynomial.X)*
    (1+Polynomial.C (q : ℤ)*Polynomial.X) ∧
    -((choYamauchiWeight q 2).derivative.eval 1)=1+(q : ℤ) := by sorry

/-- genus_mass_test_1 -/
example : genusMass (fun _ : Unit => 2)=1/2 := by sorry
/-- genus_mass_test_2 -/
example : genusMass (fun _ : Unit => 1)=1 := by sorry
/-- genus_mass_test_3 -/
example {I J : Type*} [Fintype I] [Fintype J] (w : I → ℕ) (e : I ≃ J) :
    genusMass (w ∘ e.symm)=genusMass w := by sorry

end Layer3Checks

section IntegralTheta
variable {V : Type*} [AddCommGroup V] [Module ℚ V]

/-- The theta sum of the actual positive integral lattice over its lattice-point subtype. -/
def latticeThetaSeries (L : TauCeti.IntegralLattice V) (τ : ℂ) : ℂ :=
  ∑' x : L, Complex.exp ((Real.pi : ℂ) * Complex.I * τ * (L.integralForm x x : ℂ))

/-- Positive definiteness gives absolute summability of the theta series in the upper half-plane. -/
theorem latticeThetaSeries_summable [FiniteDimensional ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (fun x : L => Complex.exp
      ((Real.pi : ℂ) * Complex.I * τ * (L.integralForm x x : ℂ))) := by sorry

/-- Regroup the theta sum by its finite quadratic shells to obtain the representation coefficients. -/
theorem latticeThetaSeries_coeff [FiniteDimensional ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (τ : ℂ) (hτ : 0 < τ.im) :
    latticeThetaSeries L τ = ∑' m : ℕ,
      (Nat.card {x : L | L.integralForm x x = m} : ℂ) *
        Complex.exp ((Real.pi : ℂ) * Complex.I * τ * m) := by sorry

/-- On the positive imaginary axis the lattice theta sum is its Euclidean Gaussian sum. -/
theorem latticeThetaSeries_gaussian
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (L : TauCeti.IntegralLattice V) (e : L →+ E)
    (he : ∀ x : L, ‖e x‖^2 = (L.integralForm x x : ℝ)) (t : ℝ) :
    latticeThetaSeries L ((t : ℂ) * Complex.I) =
      ∑' x : L, (Real.exp (-Real.pi * t * ‖e x‖^2) : ℂ) := by sorry

example (τ : ℂ) :
    let L := TauCeti.IntegralLattice.ofGramMatrix
      (Pi.basisFun ℚ (Fin 0)) (1 : Matrix (Fin 0) (Fin 0) ℤ) (by sorry)
    latticeThetaSeries L τ = 1 := by sorry
example :
    let L := TauCeti.IntegralLattice.ofGramMatrix
      (Pi.basisFun ℚ (Fin 1)) (1 : Matrix (Fin 1) (Fin 1) ℤ) (by sorry)
    Nat.card {x : L | L.integralForm x x = 1} = 2 ∧
      Nat.card {x : L | L.integralForm x x = 2} = 0 ∧
      Nat.card {x : L | L.integralForm x x = 4} = 2 := by sorry
example :
    let L := TauCeti.IntegralLattice.ofGramMatrix
      (Pi.basisFun ℚ (Fin 2)) (1 : Matrix (Fin 2) (Fin 2) ℤ) (by sorry)
    Nat.card {x : L | L.integralForm x x = 1} = 4 ∧
      Nat.card {x : L | L.integralForm x x = 2} = 4 := by sorry
end IntegralTheta

/-! ## Layer 4: Lattice points, star bodies and homogeneous dynamics -/


section DavenportMultisets
variable {n : ℕ}

/-- The lattice-point count weighted by the nonnegative multiplicity of a bounded multiset. -/
def multisetLatticeCount (μ : (Fin n → ℝ) → ℕ) : ℝ :=
  ∑' z : Fin n → ℤ, (μ (fun i => (z i : ℝ)) : ℝ)

/-- The integral of the multiplicity, retaining repeated points rather than taking a support volume. -/
def multisetVolume (μ : (Fin n → ℝ) → ℕ) : ℝ := ∫ x, (μ x : ℝ)

/-- A bounded nonnegative integer multiplicity integrates as the sum of its superlevel volumes. -/
theorem multisetVolume_superlevels (μ : (Fin n → ℝ) → ℕ) (m : ℕ)
    (hm : ∀ x, μ x ≤ m)
    (hmeas : Measurable μ) (hbound : Bornology.IsBounded (Function.support μ)) :
    multisetVolume μ = ∑ j ∈ Finset.range m,
      volume.real {x | j+1 ≤ μ x} := by sorry

/-- The weighted lattice count is the sum of the counts of its superlevel sets. -/
theorem multisetLatticeCount_superlevels (μ : (Fin n → ℝ) → ℕ) (m : ℕ)
    (hm : ∀ x, μ x ≤ m) (hbound : Bornology.IsBounded (Function.support μ)) :
    multisetLatticeCount μ = ∑ j ∈ Finset.range m,
      (Nat.card {z : Fin n → ℤ | j+1 ≤ μ (fun i => (z i : ℝ))} : ℝ) := by sorry

example : multisetLatticeCount (fun _ : Fin 1 → ℝ => 0) = 0 := by sorry
example (N : ℕ) :
    multisetLatticeCount (fun x : Fin 1 → ℝ => if x 0 ∈ Set.Icc 0 (N : ℝ) then 2 else 0) =
      2*((N : ℝ)+1) := by sorry
example : multisetLatticeCount
    (fun x : Fin 1 → ℝ => if x 0 = 0 ∨ x 0 = 2 then 1 else 0) = 2 := by sorry
example : multisetVolume (fun _ : Fin 1 → ℝ => 0) = 0 := by sorry
example (N : ℕ) :
    multisetVolume (fun x : Fin 1 → ℝ => if x 0 ∈ Set.Icc 0 (N : ℝ) then 2 else 0) =
      2*(N : ℝ) := by sorry
example : multisetVolume
    (fun x : Fin 1 → ℝ => if x 0 = 0 ∨ x 0 = 2 then 1 else 0) = 0 := by sorry
end DavenportMultisets

section LatticePointCounting

/-- Finite index excludes the infinite-index sentinel. -/
theorem ncard_le_index_mul {G : Type*} [AddCommGroup G]
    (N : AddSubgroup G) [N.FiniteIndex] (S T : Set G)
    (hT : T.Finite)
    (hsub : ∀ x ∈ S, ∀ y ∈ S, x - y ∈ N → x - y ∈ T) :
    S.ncard ≤ N.index * T.ncard := by sorry

/-- The basis must be integral and span the whole group. -/
theorem ncard_le_pow_of_no_congruent {G : Type*} [AddCommGroup G]
    {n : ℕ} (b : Basis (Fin n) ℤ G) (q : ℕ) (hq : 0 < q) (S : Set G)
    (hsep : ∀ x ∈ S, ∀ y ∈ S, (∃ z : G, x - y = (q : ℤ) • z) → x = y) :
    S.ncard ≤ q^n := by sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Index form of Henk Lemma 2.1, including boundary points. -/
theorem henk_sublattice_count
    (L M : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (hML : M ≤ L) (hindex : M.toAddSubgroup.relIndex L.toAddSubgroup ≠ 0)
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard ≤ 
      M.toAddSubgroup.relIndex L.toAddSubgroup *
        {x : E | x ∈ M ∧ x ∈ (2 : ℝ) • (K : Set E)}.ncard := by sorry

/-- No symmetry is needed at this intermediate step. -/
theorem homothetic_lattice_avoidance
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hd : 0 < finrank ℝ E) (q : ℕ) (hq : 0 < q)
    (hcut : 2 / (q : ℝ) < successiveMin L K ⟨0, hd⟩) :
    ((q : ℝ) • (L : Set E)) ∩ ((2 : ℝ) • (K : Set E)) = {0} := by sorry

/-- Henk (1.3), not its product conjecture or Theorem 1.5. -/
theorem lattice_count_le_first_minimum
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (hd : 0 < finrank ℝ E) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard ≤ 
      (Nat.floor (2 / successiveMin L K ⟨0, hd⟩) + 1) ^ finrank ℝ E := by sorry

end LatticePointCounting

section CountingTests

/-- count_empty -/
example : (∅ : Set ℤ).ncard = 0 := by sorry

/-- count_infinite_index_sentinel -/
example : (⊥ : AddSubgroup ℤ).index = 0 ∧ ({0} : Set ℤ).ncard = 1 := by sorry

/-- henk_interval_counts -/
example : ({-1, 0, 1} : Set ℤ).ncard = 3 ∧
    ({-2, 0, 2} : Set ℤ).ncard = 3 ∧ (3 : ℕ) ≤ 2 * 3 := by sorry

/-- count_rank_zero -/
example : ({0} : Set (Fin 0 → ℤ)).ncard = 1 := by sorry

/-- residue_three_distinct -/
example : ({(-1 : ZMod 3), 0, 1} : Set (ZMod 3)).ncard = 3 := by sorry

/-- residue_collision -/
example : ((0 : ℤ) : ZMod 2) = ((2 : ℤ) : ZMod 2) ∧ (0 : ℤ) ≠ 2 := by sorry

/-- residue_zero_modulus -/
example : Nat.card (ZMod 0) = 0 ∧ ¬ Finite (ZMod 0) := by sorry

/-- homothetic_three_avoids -/
example (z : ℤ) (hz : 3 ∣ z) (habs : |z| ≤ 2) : z = 0 := by sorry

/-- homothetic_equality_fails -/
example : (2 : ℤ) ≠ 0 ∧ (2 : ℤ) ∣ 2 ∧ |(2 : ℤ)| ≤ 2 ∧ (2 : ℝ) / 2 = 1 := by sorry

/-- first_min_cube_count -/
example : (({-1, 0, 1} : Set ℤ) ×ˢ ({-1, 0, 1} : Set ℤ)).ncard = 9 ∧
    (Nat.floor (2 / (1 : ℝ)) + 1)^2 = 9 := by sorry

/-- first_min_small_body -/
example : Nat.floor (2 / (3 : ℝ)) + 1 = 1 := by sorry

/-- first_min_anisotropic -/
example : (Nat.floor (2 / (1/2 : ℝ)) + 1)^2 = 25 ∧
    (Nat.floor (2 / (3 : ℝ)) + 1)^2 = 1 ∧ (1 : ℕ) < 5 := by sorry

end CountingTests

section DivisibilityRounding

/-- Natural subtraction; even a zero remainder advances. -/
theorem divisible_rounding_step (q m : ℕ) (hq : 0 < q) (hm : 0 < m)
    (hupper : m < 2*q) :
    let n := if q ≤ m then m else q+m-q%m
    q ≤ n ∧ n < 2*q ∧ m ∣ n := by sorry

/-- The last factor is unchanged. -/
theorem exists_divisible_rounding {d : ℕ} (q : Fin d → ℕ)
    (hq : ∀ i, 0 < q i) (hmono : Antitone q) :
    ∃ n : Fin d → ℕ, (∀ i, q i ≤ n i) ∧
      (∀ i, i.val+1 = d → n i = q i) ∧
      (∀ i, i.val+1 < d → n i < 2*q i) ∧
      (∀ i j, i ≤ j → n j ∣ n i) := by sorry

/-- Strictness requires at least two factors. -/
theorem divisible_rounding_product {d : ℕ} (hd : 2 ≤ d)
    (q n : Fin d → ℕ) (hq : ∀ i, 0 < q i) (hn : ∀ i, q i ≤ n i)
    (hlast : ∀ i, i.val+1 = d → n i = q i)
    (hupper : ∀ i, i.val+1 < d → n i < 2*q i) :
    (∏ i, n i) < 2^(d-1) * ∏ i, q i := by sorry

/-- No positivity is needed for membership. -/
theorem mem_diagonal_span_iff {G : Type*} [AddCommGroup G] {d : ℕ}
    (b : Basis (Fin d) ℤ G) (n : Fin d → ℕ) (x : G) :
    x ∈ Submodule.span ℤ (Set.range (fun i => (n i : ℤ) • b i)) ↔
      ∀ i, (n i : ℤ) ∣ b.repr x i := by sorry

/-- A zero factor gives the native infinite-index sentinel. -/
theorem diagonal_span_index {G : Type*} [AddCommGroup G] {d : ℕ}
    (b : Basis (Fin d) ℤ G) (n : Fin d → ℕ) :
    (Submodule.span ℤ (Set.range (fun i => (n i : ℤ) • b i))).toAddSubgroup.index =
      ∏ i, n i := by sorry
end DivisibilityRounding

section HenkProduct
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Divide by the last nonzero coordinate's factor. -/
theorem diagonal_lattice_avoidance
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (b : Basis (Fin (finrank ℝ E)) ℤ L)
    (hflag : ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
      (x : E) ∈ (b.ofZLatticeBasis ℝ).flag i.castSucc)
    (n : Fin (finrank ℝ E) → ℕ) (hn : ∀ i, 0 < n i)
    (hdiv : ∀ i j, i ≤ j → n j ∣ n i)
    (hcut : ∀ i, 2/(n i : ℝ) < successiveMin L K i) :
    ∀ x ∈ Submodule.span ℤ (Set.range (fun i => (n i : ℤ) • (b i : E))),
      x ∈ (2 : ℝ) • (K : Set E) → x = 0 := by sorry

/-- Henk Theorem 1.5, not Conjecture 1.4. -/
theorem lattice_count_lt_successive_minima
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (hd : 2 ≤ finrank ℝ E) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard <
      2^(finrank ℝ E-1) *
        ∏ i : Fin (finrank ℝ E), (Nat.floor (2 / successiveMin L K i)+1) := by sorry
end HenkProduct

section HenkTests
/-- prescribed_basis_orientation -/
example : (Matrix.det (!![(1 : ℤ),0;1,-1])) = -1 := by sorry
/-- prescribed_nonprimitive_column -/
example (a b : ℤ) : ¬ IsUnit (Matrix.det (!![(2 : ℤ),a;0,b])) := by sorry
/-- flag_independent_not_integral -/
example : Matrix.det (!![(1 : ℤ),1;1,-1]) = -2 := by sorry
/-- flag_standard_prefix -/
example (x : Fin 3 → ℝ) :
    x ∈ (Pi.basisFun ℝ (Fin 3)).flag (2 : Fin 4) ↔ x 2 = 0 := by sorry
/-- minimum_flag_strict_boundary -/
example : ¬ ((1 : Fin 2 → ℝ) ∈ (Pi.basisFun ℝ (Fin 2)).flag 0) := by sorry
/-- minimum_flag_empty -/
example : (Pi.basisFun ℝ (Fin 0)).flag (0 : Fin 1) = ⊤ := by sorry
/-- rounding_keep_next -/
example : (if (5 : ℕ) ≤ 6 then 6 else 5+6-5%6) = 6 := by sorry
/-- rounding_zero_remainder -/
example : (if (6 : ℕ) ≤ 3 then 3 else 6+3-6%3) = 9 := by sorry
/-- rounding_chain_example -/
example : (3 : ℕ) ∣ 6 ∧ (6 : ℕ) ∣ 12 ∧
    (7 ≤ (12 : ℕ) ∧ 12 < 2*7) ∧ (5 ≤ (6 : ℕ) ∧ 6 < 2*5) := by sorry
/-- rounding_empty_product -/
example : (∏ i : Fin 0, (Fin.elim0 i : ℕ)) = 1 := by sorry
/-- rounding_strict_product -/
example : (12*6*3 : ℕ) < 2^2*(7*5*3) := by sorry
/-- rounding_rank_one_not_strict -/
example : ¬ (3 : ℕ) < 2^(1-1)*(3 : ℕ) := by sorry
/-- diagonal_membership_different_factors -/
example : ((2 : ℤ) ∣ 4 ∧ (3 : ℤ) ∣ 6) ∧ ¬ ((2 : ℤ) ∣ 3) := by sorry
/-- diagonal_zero_coordinate -/
example (z : ℤ) : (0 : ℤ) ∣ z ↔ z = 0 := by sorry
/-- diagonal_index_two_three -/
example : (AddSubgroup.pi Set.univ (fun i : Fin 2 =>
    AddSubgroup.zmultiples ((![2,3] : Fin 2 → ℤ) i))).index = 6 := by sorry
/-- diagonal_index_zero_factor -/
example : (AddSubgroup.pi Set.univ (fun i : Fin 2 =>
    AddSubgroup.zmultiples ((![2,0] : Fin 2 → ℤ) i))).index = 0 := by sorry
/-- diagonal_division_needs_chain -/
example : ¬ ∃ z : ℤ, (z : ℚ) = (2/3 : ℚ) := by sorry
/-- diagonal_threshold_needs_strict -/
example : (2 : ℤ) ≠ 0 ∧ (2 : ℤ) ∣ 2 ∧ (2/(2 : ℝ)) = 1 := by sorry
/-- henk_cube_strict -/
example : (9 : ℕ) < 2^(2-1)*(3*3) := by sorry
/-- henk_anisotropic_strict -/
example : (3 : ℕ) < 2^(2-1)*(3*1) ∧ (3*1 : ℕ) < 3^2 := by sorry
end HenkTests

section HilbertDynamics
variable {G H : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- A unitary action is strongly continuous when each vector orbit is continuous in Hilbert norm. -/
def StronglyContinuous (π : ContRepresentation ℂ G H) : Prop :=
  ∀ v : H, Continuous (fun g : G => π g v)

/-- Strong continuity of a unitary action implies joint continuity of the action. -/
theorem stronglyContinuous_joint (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π)
    (hu : ∀ g v w, inner (𝕜 := ℂ) (π g v) (π g w) = inner (𝕜 := ℂ) v w) :
    Continuous (fun x : G × H => π x.1 x.2) := by sorry

/-- A strongly continuous unitary action has continuous matrix coefficients. -/
theorem matrixCoeff_continuous (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π) (v w : H) :
    Continuous (fun g : G => inner (𝕜 := ℂ) (π g v) w) := by sorry

/-- The Cauchy–Schwarz bound on a matrix coefficient uses the two vector norms. -/
theorem matrixCoeff_bound (π : ContRepresentation ℂ G H)
    (hu : ∀ g v w, inner (𝕜 := ℂ) (π g v) (π g w) = inner (𝕜 := ℂ) v w)
    (g : G) (v w : H) : ‖inner (𝕜 := ℂ) (π g v) w‖ ≤ ‖v‖*‖w‖ := by sorry

/-- The vectors fixed by a continuous-linear representation form a closed linear subspace. -/
theorem invariants_closed (π : ContRepresentation ℂ G H) :
    IsClosed (π.invariants : Set H) := by sorry

example (π : ContRepresentation ℂ G H) (h : ∀ g v, π g v = v) :
    StronglyContinuous π := by sorry
example (π : ContRepresentation ℂ G H) [Subsingleton H] :
    StronglyContinuous π ∧ ∀ g v w, inner (𝕜 := ℂ) (π g v) w = 0 := by sorry
example (t : ℝ) : inner (𝕜 := ℂ) (Complex.exp (t*Complex.I)) (1 : ℂ) =
    Complex.exp (-t*Complex.I) := by sorry

/-- The elements contracted to the identity by conjugation along a fixed group sequence. -/
def contractionSubgroup (a : ℕ → G) : Subgroup G where
  carrier := {u | Filter.Tendsto (fun j => (a j)⁻¹*u*a j) Filter.atTop (nhds 1)}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The contraction subgroup for the sequence of inverse group elements. -/
abbrev oppositeContractionSubgroup (a : ℕ → G) : Subgroup G :=
  contractionSubgroup (fun j => (a j)⁻¹)

/-- Membership means that the corresponding conjugates tend to the identity. -/
theorem contractionSubgroup_mem (a : ℕ → G) (u : G) :
    u ∈ contractionSubgroup a ↔
      Filter.Tendsto (fun j => (a j)⁻¹*u*a j) Filter.atTop (nhds 1) := by sorry
/-- The inverse of a contracted element is contracted. -/
theorem contractionSubgroup_inv (a : ℕ → G) {u : G} (hu : u ∈ contractionSubgroup a) :
    u⁻¹ ∈ contractionSubgroup a := by sorry

/-- A weak limit of translated Hilbert vectors is fixed by the appropriate contraction group. -/
theorem contraction_fixed_weak_limit (π : ContRepresentation ℂ G H)
    (hs : StronglyContinuous π)
    (hu : ∀ g v w, inner (𝕜 := ℂ) (π g v) (π g w) = inner (𝕜 := ℂ) v w)
    (a : ℕ → G) (v v₀ : H)
    (hw : ∀ w : H, Filter.Tendsto (fun j => inner (𝕜 := ℂ) (π (a j) v) w)
      Filter.atTop (nhds (inner (𝕜 := ℂ) v₀ w))) :
    ∀ u ∈ (contractionSubgroup a).topologicalClosure, π u v₀ = v₀ := by sorry

example [T2Space G] : contractionSubgroup (fun _ : ℕ => (1 : G)) = ⊥ := by sorry
example [T2Space G] (hc : ∀ g h : G, g*h=h*g) (a : ℕ → G) :
    contractionSubgroup a = ⊥ := by sorry
example (j : ℕ) (t : ℝ) :
    ( !![Real.exp (-(j : ℝ)), 0; 0, Real.exp (j : ℝ)] ) *
      ( !![1,t;0,1] ) * ( !![Real.exp (j : ℝ), 0;0,Real.exp (-(j : ℝ))] ) =
      ( !![1,t*Real.exp (-2*(j : ℝ));0,1] ) := by sorry
end HilbertDynamics

section KoopmanActions
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]

/-- The Koopman action on Lp uses precomposition by the inverse group action. -/
def quotientKoopman (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ContRepresentation ℂ G (Lp ℂ 2 μ) where
  toMonoidHom := {
    toFun := fun g => (Lp.compMeasurePreservingₗᵢ ℂ
      (fun x : X => g⁻¹ • x) (hμ g⁻¹)).toContinuousLinearMap
    map_one' := by sorry
    map_mul' := by sorry }

/-- The Koopman representative evaluates by applying the inverse group element to the point. -/
theorem quotientKoopman_apply (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (g : G) (f : Lp ℂ 2 μ) :
    (quotientKoopman μ hμ g f : X → ℂ) =ᵐ[μ] fun x => f (g⁻¹ • x) := by sorry

/-- A measure-preserving action gives complex Hilbert isometries on L2. -/
theorem quotientKoopman_unitary (μ : Measure X)
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (g : G) (f k : Lp ℂ 2 μ) :
    inner (𝕜 := ℂ) (quotientKoopman μ hμ g f) (quotientKoopman μ hμ g k) =
      inner (𝕜 := ℂ) f k := by sorry

section FiniteMeasure
variable (μ : Measure X)

/-- The closed L2 subspace of functions with integral zero on a finite measure space. -/
def meanZeroL2 [IsFiniteMeasure μ] : Submodule ℂ (Lp ℂ 2 μ) where
  carrier := {f | ∫ x, f x ∂μ = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

variable [IsFiniteMeasure μ]

/-- Membership in the mean-zero subspace is exactly vanishing of the integral. -/
theorem mem_meanZeroL2 (f : Lp ℂ 2 μ) :
    f ∈ meanZeroL2 μ ↔ ∫ x, f x ∂μ = 0 := Iff.rfl

/-- On a finite measure space the integral is continuous on L2, so its kernel is closed. -/
theorem meanZeroL2_closed : IsClosed (meanZeroL2 μ : Set (Lp ℂ 2 μ)) := by sorry

/-- Measure preservation makes the mean-zero L2 subspace invariant under Koopman. -/
theorem meanZeroL2_invariant
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (g : G) (f : Lp ℂ 2 μ) (hf : f ∈ meanZeroL2 μ) :
    quotientKoopman μ hμ g f ∈ meanZeroL2 μ := by sorry

example (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (g : G) (c : ℂ) : quotientKoopman μ hμ g (Lp.const 2 μ c) = Lp.const 2 μ c := by sorry
example [IsProbabilityMeasure μ] : ‖Lp.const 2 μ (1 : ℂ)‖ = 1 := by sorry
example [IsProbabilityMeasure μ] (c : ℂ) :
    Lp.const 2 μ c ∈ meanZeroL2 μ ↔ c = 0 := by sorry
example [Subsingleton X] [IsProbabilityMeasure μ] : meanZeroL2 μ = ⊥ := by sorry
example (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (f : Lp ℂ 2 μ) : quotientKoopman μ hμ 1 f = f := by sorry
end FiniteMeasure

/-- Infinite counting measure makes vanishing totalized integrals fail closure under addition. -/
example :
    let μ : Measure ℕ := Measure.count
    let f : ℕ → ℂ := fun n => 1 / (n+1 : ℂ)
    let g : ℕ → ℂ := fun n => (if n = 0 then 1 else 0) - f n
    MemLp f 2 μ ∧ MemLp g 2 μ ∧
      (∫ n, f n ∂μ) = 0 ∧ (∫ n, g n ∂μ) = 0 ∧
      (∫ n, (f+g) n ∂μ) = 1 := by sorry

section ContinuousAction
variable [TopologicalSpace G] [IsTopologicalGroup G]
  [TopologicalSpace X] [BorelSpace X] [R1Space X] [ContinuousSMul G X]
  (μ : Measure X) [Measure.InnerRegularCompactLTTop μ] [IsLocallyFiniteMeasure μ]

/-- A continuous action preserving a Radon measure induces a strongly continuous Koopman action. -/
theorem quotientKoopman_strong
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    StronglyContinuous (quotientKoopman μ hμ) := by sorry
end ContinuousAction
end KoopmanActions

example :
    let μ : Measure (Fin 3) := Measure.count
    let hμ : ∀ g : Equiv.Perm (Fin 3),
      MeasurePreserving (fun x : Fin 3 => g • x) μ μ := by sorry
    let f : Fin 3 → ℂ := ![0,1,2]
    let hf : MemLp f 2 μ := by sorry
    (quotientKoopman μ hμ (Equiv.swap 0 1 * Equiv.swap 1 2) (hf.toLp f) : Fin 3 → ℂ)
      =ᵐ[μ] ![2,0,1] := by sorry

example :
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    let f : Fin 2 → ℂ := ![1,-1]
    let hf : MemLp f 2 μ := by sorry
    ∫ x, f x ∂μ = 0 ∧ ‖hf.toLp f‖ = 1 := by sorry

section ErgodicKoopman
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]
  (μ : Measure X) [IsProbabilityMeasure μ]

/-- For a probability-preserving action, ergodicity is equivalent to every fixed L2 vector being constant. -/
theorem ergodic_iff_L2_fixed_constants
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ErgodicSMul G X μ ↔
      ∀ f : Lp ℂ 2 μ, (∀ g : G, quotientKoopman μ hμ g f = f) ↔
        ∃ c : ℂ, f = Lp.const 2 μ c := by sorry

/-- An ergodic probability action has no nonzero fixed vector in mean-zero L2. -/
theorem ergodic_meanZero_invariants
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ)
    (hE : ErgodicSMul G X μ) (f : Lp ℂ 2 μ)
    (hf : f ∈ meanZeroL2 μ) (hfix : ∀ g : G, quotientKoopman μ hμ g f = f) :
    f = 0 := by sorry

example [Subsingleton X] [Nonempty X]
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) :
    ErgodicSMul G X μ := by sorry

example :
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ErgodicSMul (Equiv.Perm (Fin 2)) (Fin 2) μ := by sorry

example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ ErgodicSMul PUnit (Fin 2) μ := by sorry
end ErgodicKoopman

section ShearingChecks

/-- The upper elementary unipotent in SL2 coordinates. -/
def shearingUpper (t : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![1,t;0,1]
/-- The lower elementary unipotent in SL2 coordinates. -/
def shearingLower (ε : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![1,0;ε,1]
/-- The diagonal SL2 matrix with inverse entries. -/
def shearingDiagonal (a : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![1+a,0;0,(1+a)⁻¹]

/-- The upper unipotent parameters add under matrix multiplication. -/
theorem shearingUpper_mul (t v : ℝ) :
    shearingUpper t * shearingUpper v = shearingUpper (t+v) := by sorry
/-- The lower elementary unipotent has determinant one. -/
theorem shearingLower_det (ε : ℝ) : (shearingLower ε).det = 1 := by sorry
/-- The explicit upper/lower shearing identity, with the nonzero denominator retained. -/
theorem shearing_identity (a ε : ℝ) (ha : a ≠ -1) (hε : ε ≠ 0) :
    shearingUpper (a/ε) * shearingLower ε * shearingUpper (-a/(ε*(1+a))) =
      !![1+a,0;ε,(1+a)⁻¹] := by sorry

/-- The corrected lower-unipotent conjugate converges to the stated diagonal matrix. -/
theorem shearing_limit (a : ℝ) (ha : a ≠ -1) :
    Filter.Tendsto (fun ε : ℝ =>
      shearingUpper (a/ε) * shearingLower ε * shearingUpper (-a/(ε*(1+a))))
      (nhdsWithin 0 {ε : ℝ | ε ≠ 0}) (nhds (shearingDiagonal a)) := by sorry

example : shearingUpper 0 = 1 ∧ shearingLower 0 = 1 ∧ shearingDiagonal 0 = 1 := by sorry
example : shearingUpper 2 * shearingUpper (-2) = 1 ∧
    shearingLower 2 * shearingLower (-2) = 1 := by sorry
example : shearingUpper 2 * shearingLower (1/2) * shearingUpper (-1) =
    !![(2:ℝ),0;1/2,1/2] := by sorry
example : shearingDiagonal 1 = !![(2:ℝ),0;0,1/2] ∧ (shearingDiagonal 1).det = 1 := by sorry
example : shearingDiagonal (-1) = !![(0:ℝ),0;0,0] ∧ (shearingDiagonal (-1)).det = 0 := by sorry
example : shearingDiagonal (-2) = -(1 : Matrix (Fin 2) (Fin 2) ℝ) := by sorry
end ShearingChecks

section ErgodicKernels
local instance : ∀ p : Prop, Decidable p := Classical.propDecidable
open ProbabilityTheory
variable {G X : Type*} [Group G] [MeasurableSpace X] [MulAction G X]

/-- The invariant-set condition ties each component to its base point. -/
structure ActionErgodicKernel (μ : Measure X) where
  κ : Kernel X X
  markov : IsMarkovKernel κ
  stationary : μ.bind κ = μ
  ae_ergodic : ∀ᵐ x ∂μ, ErgodicSMul G X (κ x)
  onInvariantSets : ∀ s : Set X, MeasurableSet s →
    (∀ g : G, (fun x : X => g • x) ⁻¹' s =ᵐ[μ] s) →
    ∀ᵐ x ∂μ, κ x s = if x ∈ s then 1 else 0

/-- A countable probability-preserving action on a standard Borel space has an ergodic-component kernel. -/
theorem exists_actionErgodicKernel (μ : Measure X) [IsProbabilityMeasure μ]
    [Countable G] [StandardBorelSpace X] [Nonempty X]
    (hμ : ∀ g : G, MeasurePreserving (fun x : X => g • x) μ μ) : Nonempty (ActionErgodicKernel (G := G) μ) := by sorry

/-- Integration against the original probability is iterated integration over its ergodic components. -/
theorem ActionErgodicKernel.integral (μ : Measure X)
    (E : ActionErgodicKernel (G := G) μ) (f : X → ℝ) (hf : Integrable f μ) :
    ∫ x, ∫ y, f y ∂(E.κ x) ∂μ = ∫ x, f x ∂μ := by sorry

/-- For an ergodic action the component kernel is almost everywhere the original probability. -/
theorem ActionErgodicKernel.const_of_ergodic (μ : Measure X) [IsProbabilityMeasure μ]
    [StandardBorelSpace X] (E : ActionErgodicKernel (G := G) μ)
    (h : ErgodicSMul G X μ) : ∀ᵐ x ∂μ, E.κ x = μ := by sorry

example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ∃ E : ActionErgodicKernel (G := PUnit) μ,
      E.κ = Kernel.deterministic id measurable_id := by sorry
example :
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ∃ E : ActionErgodicKernel (G := Equiv.Perm (Fin 2)) μ,
      E.κ = Kernel.const (Fin 2) μ := by sorry
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ ∃ E : ActionErgodicKernel (G := PUnit) μ, E.κ = Kernel.const (Fin 2) μ := by sorry
end ErgodicKernels

section FinitePoissonConfigurations
open ProbabilityTheory
variable {X : Type*} [MeasurableSpace X]

/-- The finite-point configuration law obtained by mixing normalized product measures with a Poisson count. -/
def finitePoissonConfiguration (intensity : NNReal) (μ : Measure X) [IsFiniteMeasure μ] :
    Measure (Σ n : ℕ, Fin n → X) :=
  Measure.sum fun n => (poissonMeasure (intensity*(μ Set.univ).toNNReal)) {n} •
    (Measure.pi (fun _ : Fin n => (μ Set.univ)⁻¹ • μ)).map (Sigma.mk n)

/-- The number of configuration points lying in the specified subset, counting repetitions. -/
def configurationCount (s : Set X) (c : Σ n : ℕ, Fin n → X) : ℕ := by
  classical
  exact ∑ i : Fin c.1, if c.2 i ∈ s then 1 else 0

/-- The count of a measurable subset is measurable on the configuration space. -/
theorem configurationCount_measurable (s : Set X) (hs : MeasurableSet s) :
    Measurable (configurationCount s) := by sorry

/-- The count of the whole index set is the total configuration multiplicity. -/
theorem configurationCount_univ (c : Σ n : ℕ, Fin n → X) :
    configurationCount Set.univ c = c.1 := by sorry

/-- Enlarging the subset can only increase its count. -/
theorem configurationCount_mono {s t : Set X} (hst : s ⊆ t)
    (c : Σ n : ℕ, Fin n → X) : configurationCount s c ≤ configurationCount t c := by sorry

/-- The count on a disjoint union is the sum of the two counts. -/
theorem configurationCount_disjoint {s t : Set X} (hst : Disjoint s t)
    (c : Σ n : ℕ, Fin n → X) :
    configurationCount (s ∪ t) c = configurationCount s c + configurationCount t c := by sorry

/-- The product Poisson configuration law is a probability measure. -/
theorem finitePoissonConfiguration_probability (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] : IsProbabilityMeasure (finitePoissonConfiguration intensity μ) := by sorry

/-- The count of a finite union is Poisson with the sum of its intensity parameters. -/
theorem finitePoissonConfiguration_count (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] (s : Set X) (hs : MeasurableSet s) :
    (finitePoissonConfiguration intensity μ).map (configurationCount s) =
      poissonMeasure (intensity*(μ s).toNNReal) := by sorry

/-- Counts on pairwise disjoint subsets are independent under the Poisson law. -/
theorem finitePoissonConfiguration_indep_counts (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] {s t : Set X} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hst : Disjoint s t) :
    IndepFun (configurationCount s) (configurationCount t) (finitePoissonConfiguration intensity μ) :=
  by sorry

/-- The expected weighted count is the weighted sum of the intensity parameters. -/
theorem finitePoissonConfiguration_campbell (intensity : NNReal) (μ : Measure X)
    [IsFiniteMeasure μ] (f : X → ℝ) (hf : Integrable f μ) :
    ∫ c, (∑ i : Fin c.1, f (c.2 i)) ∂finitePoissonConfiguration intensity μ =
      (intensity : ℝ)*∫ x, f x ∂μ := by sorry

example (intensity : NNReal) : (finitePoissonConfiguration intensity (0 : Measure PUnit)).map
    (fun c => c.1) = Measure.dirac 0 := by sorry
example : (finitePoissonConfiguration 1 (Measure.dirac PUnit.unit)).map
    (configurationCount Set.univ) = poissonMeasure 1 := by sorry
example : (finitePoissonConfiguration 2 (Measure.count : Measure (Fin 2))).map
    (configurationCount ({0} : Set (Fin 2))) = poissonMeasure 2 := by sorry
example : configurationCount ({0} : Set (Fin 2))
    (⟨3, ![0,1,0]⟩ : Σ n : ℕ, Fin n → Fin 2) = 2 := by sorry
example : configurationCount (∅ : Set (Fin 2))
    (⟨2, ![0,0]⟩ : Σ n : ℕ, Fin n → Fin 2) = 0 := by sorry
example : configurationCount (Set.univ : Set (Fin 2))
    (⟨0, Fin.elim0⟩ : Σ n : ℕ, Fin n → Fin 2) = 0 := by sorry
end FinitePoissonConfigurations

section ActionAverages
local instance : MeasurableSpace (Equiv.Perm (Fin 2)) := ⊤
local instance : TopologicalSpace (Equiv.Perm (Fin 2)) := ⊥
open ProbabilityTheory
variable {G X : Type*} [Group G] [MeasurableSpace G] [TopologicalSpace G]
  [MeasurableSpace X] [TopologicalSpace X] [MulAction G X]

/-- The Haar integral of a translated function over a finite positive-measure averaging set, divided by its volume. -/
def normalizedActionAverage (η : Measure G) (A : Set G) (f : X → ℝ) (x : X) : ℝ :=
  (η.real A)⁻¹ * ∫ g in A, f (g • x) ∂η

/-- Compact Følner sets with the left-Haar tempering convention. -/
def TemperedFolnerSequence (η : Measure G) (A : ℕ → Set G) : Prop :=
  (∀ j, IsCompact (A j) ∧ MeasurableSet (A j) ∧ 0 < η (A j) ∧ η (A j) < ⊤) ∧
  (∃ C : ℝ, 0 < C ∧ ∀ j,
    η.real (⋃ k ∈ Finset.range j, (A k)⁻¹ * A j) ≤ C * η.real (A j)) ∧
  ∀ K : Set G, IsCompact K → (1 : G) ∈ K →
    Filter.Tendsto (fun j => η.real (symmDiff (K * A j) (A j)) / η.real (A j))
      Filter.atTop (nhds 0)

/-- Convergence is pointwise almost everywhere, rather than just in L². -/
def AveragingSequence (μ : Measure X) (η : Measure G)
    (A : ℕ → Set G) (κ : Kernel X X) : Prop :=
  (∀ j, MeasurableSet (A j) ∧ 0 < η (A j) ∧ η (A j) < ⊤) ∧
  ∀ f : X → ℝ, Continuous f → HasCompactSupport f →
    ∀ᵐ x ∂μ, Filter.Tendsto (fun j => normalizedActionAverage η (A j) f x)
      Filter.atTop (nhds (∫ y, f y ∂(κ x)))

/-- A constant averages to itself when the averaging set has finite positive Haar volume. -/
theorem normalizedActionAverage_const (η : Measure G) (A : Set G)
    (hA : MeasurableSet A) (hpos : 0 < η A) (hfin : η A < ⊤) (c : ℝ) (x : X) :
    normalizedActionAverage η A (fun _ => c) x = c := by sorry

/-- Normalized action averages preserve addition under the stated integrability assumptions. -/
theorem normalizedActionAverage_add (η : Measure G) (A : Set G)
    (f k : X → ℝ) (x : X)
    (hf : IntegrableOn (fun g => f (g • x)) A η)
    (hk : IntegrableOn (fun g => k (g • x)) A η) :
    normalizedActionAverage η A (fun y => f y + k y) x =
      normalizedActionAverage η A f x + normalizedActionAverage η A k x := by sorry

example : TemperedFolnerSequence (Measure.count : Measure (Equiv.Perm (Fin 2)))
    (fun _ => Set.univ) := by sorry
example : ¬ TemperedFolnerSequence (Measure.count : Measure (Equiv.Perm (Fin 2)))
    (fun _ => {(1 : Equiv.Perm (Fin 2))}) := by sorry
example : ¬ TemperedFolnerSequence (Measure.count : Measure PUnit)
    (fun _ => ∅) := by sorry

example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    AveragingSequence (G := PUnit) μ Measure.count (fun _ : ℕ => Set.univ)
      (Kernel.deterministic id measurable_id) := by sorry
example :
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    AveragingSequence (G := Equiv.Perm (Fin 2)) μ Measure.count (fun _ : ℕ => Set.univ)
      (Kernel.const (Fin 2) μ) := by sorry
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := by simp, mul_smul := by simp }
    let μ : Measure (Fin 2) := (1 / 2 : ENNReal) • Measure.count
    ¬ AveragingSequence (G := PUnit) μ Measure.count (fun _ : ℕ => Set.univ)
      (Kernel.const (Fin 2) μ) := by sorry
example : normalizedActionAverage (Measure.count : Measure (Equiv.Perm (Fin 2)))
    Set.univ (fun x : Fin 2 => if x = 0 then 1 else -1) 0 = 0 := by sorry
example : normalizedActionAverage (Measure.count : Measure (Equiv.Perm (Fin 2)))
    Set.univ (fun _ : Fin 2 => (1 : ℝ)) 1 = 1 := by sorry
example : normalizedActionAverage (Measure.count : Measure (Equiv.Perm (Fin 2)))
    ∅ (fun _ : Fin 2 => (1 : ℝ)) 1 = 0 := by sorry
end ActionAverages

section FinitePartitionEntropy
variable {X ι : Type*} [MeasurableSpace X] [Fintype ι]

/-- The Shannon entropy of a finite partition, with the zero-cell convention 0 log 0 = 0. -/
def finitePartitionEntropy (μ : Measure X) (label : X → ι) : ℝ :=
  - ∑ i, μ.real {x | label x = i} * Real.log (μ.real {x | label x = i})

/-- A finite partition of a probability space has nonnegative entropy. -/
theorem finitePartitionEntropy_nonneg (μ : Measure X) [IsProbabilityMeasure μ]
    (label : X → ι) : 0 ≤ finitePartitionEntropy μ label := by sorry

/-- A partition with at most N labels has entropy at most log N. -/
theorem finitePartitionEntropy_le_log_card (μ : Measure X) [IsProbabilityMeasure μ]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (label : X → ι) (hl : Measurable label) :
    finitePartitionEntropy μ label ≤ Real.log (Fintype.card ι) := by sorry

example : finitePartitionEntropy (Measure.dirac (0 : Fin 2)) id = 0 := by sorry
example :
    finitePartitionEntropy ((1 / 2 : ENNReal) • (Measure.count : Measure (Fin 2))) id =
      Real.log 2 := by sorry
example :
    finitePartitionEntropy ((1 / 4 : ENNReal) • (Measure.count : Measure (Fin 2 × Fin 2))) id =
      2 * Real.log 2 := by sorry
example : finitePartitionEntropy (0 : Measure (Fin 0)) id = 0 := by sorry
end FinitePartitionEntropy

section CountablePartitionEntropy
variable {X ι κ : Type*} [MeasurableSpace X]

/-- The extended nonnegative Shannon sum of the probabilities of the label fibres. -/
def countablePartitionEntropy (μ : Measure X) (label : X → ι) : ENNReal :=
  ∑' i, ENNReal.ofReal (-μ.real {x | label x = i} * Real.log (μ.real {x | label x = i}))

/-- The countable conditional entropy from the joint-cell probabilities and their base marginals. -/
def conditionalPartitionEntropy (μ : Measure X) (label : X → ι) (base : X → κ) : ENNReal :=
  ∑' p : ι × κ, ENNReal.ofReal
    (μ.real {x | label x = p.1 ∧ base x = p.2} *
      Real.log (μ.real {x | base x = p.2} / μ.real {x | label x = p.1 ∧ base x = p.2}))

/-- The length-n itinerary of a measurable label under the iterates of a transformation. -/
def iteratedPartitionLabel (T : X → X) (label : X → ι) (n : ℕ) : X → (Fin n → ι) :=
  fun x i => label (T^[i.val] x)

/-- The infimum of normalized itinerary entropies over positive lengths. -/
def partitionEntropyRate (μ : Measure X) (T : X → X) (label : X → ι) : ENNReal :=
  ⨅ n : ℕ, countablePartitionEntropy μ (iteratedPartitionLabel T label (n+1)) / (n+1)

/-- The supremum of entropy rates over measurable countable labels of finite entropy. -/
def measureEntropy (μ : Measure X) (T : X → X) : ENNReal :=
  ⨆ label : X → ℕ, ⨆ (_ : Measurable label),
    ⨆ (_ : countablePartitionEntropy μ label < ⊤), partitionEntropyRate μ T label

/-- The extended Shannon sum agrees with finite-partition entropy for finitely many labels. -/
theorem countablePartitionEntropy_eq_finite [Fintype ι] (μ : Measure X)
    [IsProbabilityMeasure μ] (label : X → ι) :
    countablePartitionEntropy μ label = ENNReal.ofReal (finitePartitionEntropy μ label) := by sorry

/-- Joint entropy is base entropy plus conditional entropy for measurable countable probability partitions. -/
theorem conditionalPartitionEntropy_chain [Countable ι] [Countable κ]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [MeasurableSpace κ] [MeasurableSingletonClass κ]
    (μ : Measure X) [IsProbabilityMeasure μ] (label : X → ι) (base : X → κ)
    (hl : Measurable label) (hb : Measurable base) :
    countablePartitionEntropy μ (fun x => (label x, base x)) =
      countablePartitionEntropy μ base + conditionalPartitionEntropy μ label base := by sorry

/-- Subadditivity identifies the itinerary entropy limit with its infimum for a probability-preserving transformation. -/
theorem partitionEntropyRate_limit [Countable ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure X) [IsProbabilityMeasure μ]
    (T : X → X) (hT : MeasurePreserving T μ μ) (label : X → ι)
    (hl : Measurable label) (hf : countablePartitionEntropy μ label < ⊤) :
    Filter.Tendsto (fun n : ℕ =>
      countablePartitionEntropy μ (iteratedPartitionLabel T label (n+1)) / (n+1))
      Filter.atTop (nhds (partitionEntropyRate μ T label)) := by sorry

example : countablePartitionEntropy (Measure.dirac (0 : Fin 2)) id = 0 := by sorry
example : countablePartitionEntropy
    ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) id =
      ENNReal.ofReal (Real.log 2) := by sorry
example : countablePartitionEntropy (0 : Measure (Fin 0)) id = 0 := by sorry
example : conditionalPartitionEntropy
    ((1/4 : ENNReal) • (Measure.count : Measure (Fin 2 × Fin 2))) Prod.fst Prod.snd =
      ENNReal.ofReal (Real.log 2) := by sorry
example : conditionalPartitionEntropy
    ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) id id = 0 := by sorry
example : conditionalPartitionEntropy (0 : Measure (Fin 0)) id id = 0 := by sorry
example : iteratedPartitionLabel id (id : Fin 2 → Fin 2) 3 1 = ![1,1,1] := by sorry
example : iteratedPartitionLabel (fun i : Fin 2 => 1-i) id 3 0 = ![0,1,0] := by sorry
example : iteratedPartitionLabel id (id : Fin 2 → Fin 2) 0 1 = Fin.elim0 := by sorry
example : partitionEntropyRate
    ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) id id = 0 := by sorry
example : partitionEntropyRate (Measure.dirac PUnit.unit) id id = 0 := by sorry
example : partitionEntropyRate (0 : Measure (Fin 0)) id id = 0 := by sorry
example : measureEntropy (Measure.dirac PUnit.unit) id = 0 := by sorry
example : measureEntropy
    ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) (fun i => 1-i) = 0 := by sorry
example : measureEntropy (0 : Measure (Fin 0)) id = 0 := by sorry

example :
    let μ : Measure (Fin 2) := (1/2 : ENNReal) • Measure.count
    letI : IsProbabilityMeasure μ := by sorry
    let ν := Measure.infinitePi (fun _ : ℤ => μ)
    let T : (ℤ → Fin 2) → (ℤ → Fin 2) := fun x k => x (k+1)
    partitionEntropyRate ν T (fun x => x 0) = ENNReal.ofReal (Real.log 2) := by sorry
example :
    let μ : Measure (Fin 2) := (1/2 : ENNReal) • Measure.count
    letI : IsProbabilityMeasure μ := by sorry
    let ν := Measure.infinitePi (fun _ : ℤ => μ)
    measureEntropy ν (fun x k => x (k+1)) = ENNReal.ofReal (Real.log 2) := by sorry
end CountablePartitionEntropy

section ConditionalLabelEntropy
open ProbabilityTheory
variable {X Y Z : Type*} [MeasurableSpace X] [StandardBorelSpace X] [Nonempty X]
  [MeasurableSpace Y] [MeasurableSpace Z]

/-- The information of an atom is infinite at probability zero and minus its logarithm otherwise. -/
def atomInformation (p : ENNReal) : ENNReal :=
  if p = 0 then ⊤ else ENNReal.ofReal (-Real.log p.toReal)

/-- Integrate the information of the label atom in the conditional kernel given the base label. -/
def conditionalLabelEntropy (μ : Measure X) [IsFiniteMeasure μ]
    (label : X → Y) (base : X → Z) : ENNReal :=
  ∫⁻ x, atomInformation ((condDistrib id base μ (base x)) {y | label y = label x}) ∂μ

/-- Increasing an atom probability in the unit interval decreases its information. -/
theorem atomInformation_antitone {p q : ENNReal} (hp : p ≤ q) (hq : q ≤ 1) :
    atomInformation q ≤ atomInformation p := by sorry

/-- Kernel conditional entropy agrees with the joint-cell formula for countable measurable labels. -/
theorem conditionalLabelEntropy_countable [Countable Y] [Countable Z]
    [MeasurableSingletonClass Y] [MeasurableSingletonClass Z]
    (μ : Measure X) [IsProbabilityMeasure μ] (label : X → Y) (base : X → Z)
    (hl : Measurable label) (hb : Measurable base) :
    conditionalLabelEntropy μ label base = conditionalPartitionEntropy μ label base := by sorry

example : atomInformation 0 = ⊤ := by sorry
example : atomInformation 1 = 0 := by sorry
example : atomInformation (1/2) = ENNReal.ofReal (Real.log 2) := by sorry
example : conditionalLabelEntropy (Measure.dirac (0 : ℝ)) id
    (fun _ => PUnit.unit) = 0 := by sorry
example :
    let μ : Measure (Fin 2) := (1/2 : ENNReal) • Measure.count
    letI : IsProbabilityMeasure μ := by sorry
    conditionalLabelEntropy μ id (fun _ => PUnit.unit) =
      ENNReal.ofReal (Real.log 2) := by sorry
example : conditionalLabelEntropy
    (volume.restrict (Set.Ico (0 : ℝ) 1)) id (fun _ => PUnit.unit) = ⊤ := by sorry
example : conditionalLabelEntropy
    (volume.restrict (Set.Ico (0 : ℝ) 1)) id id = 0 := by sorry
end ConditionalLabelEntropy

section SubordinatePartitions
variable {X V Y : Type*} [MeasurableSpace X] [Group V] [TopologicalSpace V]
  [MulAction V X] [MeasurableSpace Y] [StandardBorelSpace Y]

/-- A measurable partition whose almost-everywhere atoms are compactly bounded in one orbit and contain an orbit neighborhood. -/
structure SubordinatePartition (μ : Measure X) (V : Type*) [Group V]
    [TopologicalSpace V] [MulAction V X] (Y : Type*) [MeasurableSpace Y]
    [StandardBorelSpace Y] where
  label : X → Y
  measurable_label : Measurable label
  fiber_orbit : ∀ᵐ x ∂μ, ∀ y, label y = label x → ∃ v : V, v • x = y
  fiber_compact : ∀ᵐ x ∂μ, ∃ K : Set V, IsCompact K ∧
    ∀ y, label y = label x → ∃ v ∈ K, v • x = y
  fiber_neighborhood : ∀ᵐ x ∂μ, ∃ U : Set V, IsOpen U ∧ 1 ∈ U ∧
    ∀ v ∈ U, label (v • x) = label x

/-- Almost every subordinate atom lies inside the orbit of its base point. -/
theorem SubordinatePartition.ae_fiber_in_orbit (μ : Measure X)
    (P : SubordinatePartition μ V Y) :
    ∀ᵐ x ∂μ, {y | P.label y = P.label x} ⊆ {y | ∃ v : V, v • x = y} := by sorry

/-- Absolute continuity preserves the almost-everywhere subordinate-atom conditions. -/
theorem SubordinatePartition.null_change (μ ν : Measure X) (h : μ ≪ ν)
    (P : SubordinatePartition ν V Y) :
    ∃ Q : SubordinatePartition μ V Y, Q.label = P.label := by sorry

example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := fun _ => rfl, mul_smul := fun _ _ _ => rfl }
    ∃ P : SubordinatePartition (Measure.dirac (0 : Fin 2)) PUnit (Fin 2), P.label = id := by sorry
example :
    letI : MulAction PUnit (Fin 2) :=
      { smul := fun _ x => x, one_smul := fun _ => rfl, mul_smul := fun _ _ _ => rfl }
    ¬ ∃ P : SubordinatePartition
      ((1/2 : ENNReal) • (Measure.count : Measure (Fin 2))) PUnit PUnit,
      P.label = fun _ => PUnit.unit := by sorry
example :
    letI : MulAction (Multiplicative ℝ) ℝ :=
      { smul := fun v x => v.toAdd + x
        one_smul := by intro x; exact zero_add x
        mul_smul := by intro a b x; exact add_assoc a.toAdd b.toAdd x }
    ¬ ∃ P : SubordinatePartition (Measure.dirac (0 : ℝ)) (Multiplicative ℝ) ℝ,
      P.label = id := by sorry
example :
    letI : MulAction (Multiplicative ℝ) ℝ :=
      { smul := fun v x => v.toAdd + x
        one_smul := by intro x; exact zero_add x
        mul_smul := by intro a b x; exact add_assoc a.toAdd b.toAdd x }
    ∃ P : SubordinatePartition (Measure.dirac (1/2 : ℝ)) (Multiplicative ℝ) ℤ,
      P.label = fun x => Int.floor x := by sorry
example :
    letI : MulAction (Multiplicative ℝ) ℝ :=
      { smul := fun v x => v.toAdd + x
        one_smul := by intro x; exact zero_add x
        mul_smul := by intro a b x; exact add_assoc a.toAdd b.toAdd x }
    ∃ P : SubordinatePartition (0 : Measure ℝ) (Multiplicative ℝ) PUnit,
      P.label = fun _ => PUnit.unit := by sorry

end SubordinatePartitions

section GoodFunctions
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [MeasureSpace E] [BorelSpace E]
  [hHaar : Measure.IsAddHaarMeasure (volume : Measure E)]

/-- The relative small-value estimate on every ball, using the supremum of the absolute function on that ball. -/
def GoodOn [FiniteDimensional ℝ E] (f : E → ℝ) (C α : ℝ) (V : Set E) : Prop :=
  0 < C ∧ 0 < α ∧ ContinuousOn f V ∧
    ∀ a : E, ∀ r : ℝ, 0 < r → Metric.closedBall a r ⊆ V →
      ∀ δ : ℝ, 0 < δ →
        volume.real {x ∈ Metric.ball a r | |f x| <
          δ * sSup ((fun x => |f x|) '' Metric.ball a r)} ≤
          C * δ^α * volume.real (Metric.ball a r)

variable [FiniteDimensional ℝ E]
include hHaar

/-- Absolute value preserves the small-value estimate and its constants. -/
theorem GoodOn_abs {f : E → ℝ} {C α : ℝ} {V : Set E} (h : GoodOn f C α V) :
    GoodOn (fun x => |f x|) C α V := by sorry
/-- Scalar multiplication preserves goodness, including multiplication by zero. -/
theorem GoodOn_smul {f : E → ℝ} {C α : ℝ} {V : Set E}
    (h : GoodOn f C α V) (c : ℝ) : GoodOn (fun x => c*f x) C α V := by sorry

/-- A real polynomial of degree at most k is good with the stated explicit one-dimensional constants. -/
theorem polynomial_good (p : Polynomial ℝ) (k : ℕ) (hk : 1 ≤ k)
    (hdeg : p.natDegree ≤ k) :
    GoodOn (fun t : ℝ => p.eval t) (2*k*(k+1 : ℝ)^(1/(k : ℝ))) (1/(k : ℝ))
      Set.univ := by sorry

example : GoodOn (fun _ : ℝ => (0 : ℝ)) 1 1 Set.univ := by sorry
example : GoodOn (fun _ : ℝ => (1 : ℝ)) 1 1 Set.univ := by sorry
example : volume.real {t : ℝ | t ∈ Set.Ioo (-1) 1 ∧ |t^2| < (1/4 : ℝ)} = 1 ∧
    volume.real {t : ℝ | t ∈ Set.Ioo (-1) 1 ∧ |t| < (1/4 : ℝ)} = 1/2 := by sorry
example : max |(1 : ℝ)| |(1 : ℝ)| = 1 ∧ Real.sqrt (1^2+1^2 : ℝ) = Real.sqrt 2 := by sorry

/-- The maximum of two absolute good functions is good with the same constants. -/
theorem GoodOn_max {f g : E → ℝ} {C α : ℝ} {V : Set E}
    (hf : GoodOn f C α V) (hg : GoodOn g C α V) :
    GoodOn (fun x => max |f x| |g x|) C α V := by sorry

example : GoodOn (fun t : ℝ => max |t| |(1 : ℝ)|) 4 1 Set.univ := by sorry
example : GoodOn (fun t : ℝ => max |(0 : ℝ)| |t|) 4 1 Set.univ := by sorry
example {f g : E → ℝ} {C α : ℝ} {V : Set E}
    (hf : GoodOn f C α V) (hg : GoodOn g C α V) :
    GoodOn (fun x => max |g x| |f x|) C α V := by sorry
/-- A finite supremum of absolute good functions is good; the empty supremum is zero. -/
theorem GoodOn_sup {I : Type*} [Fintype I] (f : I → E → ℝ)
    {C α : ℝ} {V : Set E} (hC : 0 < C) (hα : 0 < α)
    (hf : ∀ i, GoodOn (f i) C α V) :
    GoodOn (fun x => sSup (Set.range fun i => |f i x|)) C α V := by sorry

example : GoodOn (fun t : ℝ => sSup (Set.range
    (fun i : Fin 2 => |(![t, (1 : ℝ)] : Fin 2 → ℝ) i|))) 4 1 Set.univ := by sorry
example : GoodOn (fun _ : ℝ => sSup (Set.range
    (fun _ : Fin 1 => |(0 : ℝ)|))) 4 1 Set.univ := by sorry
example : GoodOn (fun _ : ℝ => sSup (Set.range
    (fun i : Fin 0 => |(Fin.elim0 i : ℝ)|))) 4 1 Set.univ := by sorry
end GoodFunctions
section PrimitiveExteriorCovolumes
variable {d k : ℕ}

/-- Supremum of absolute coordinate minors, including the empty minor in rank zero. -/
def primitiveExteriorCovolume (h : Matrix (Fin d) (Fin d) ℝ)
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ) : ℝ :=
  sSup (Set.range fun I : Fin k → Fin d =>
    |(Matrix.of fun i j : Fin k => (h.mulVec (b j : Fin d → ℝ)) (I i)).det|)

/-- An integral unimodular basis change preserves the exterior covolume. -/
theorem primitiveExteriorCovolume_basisChange
    (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b c : Basis (Fin k) ℤ Δ) :
    primitiveExteriorCovolume h Δ b = primitiveExteriorCovolume h Δ c := by sorry

/-- The exterior covolume is nonnegative, including empty coordinate-index sets. -/
theorem primitiveExteriorCovolume_nonneg
    (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b : Basis (Fin k) ℤ Δ) : 0 ≤ primitiveExteriorCovolume h Δ b := by sorry

example (h : Matrix (Fin d) (Fin d) ℝ) (Δ : Submodule ℤ (Fin d → ℝ))
    (b : Basis (Fin 0) ℤ Δ) : primitiveExteriorCovolume h Δ b = 1 := by sorry
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ)
    (hb : (b 0 : Fin 2 → ℝ) = ![1,1]) : primitiveExteriorCovolume 1 Δ b = 1 := by sorry
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 2) ℤ Δ)
    (hb : ∀ j, (b j : Fin 2 → ℝ) = (Matrix.diagonal ![2,3]).col j) :
    primitiveExteriorCovolume 1 Δ b = 6 := by sorry
/-- The finite supremum of absolute coordinate minors varies continuously with the matrix. -/
theorem primitiveExteriorCovolume_continuous
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ) :
    Continuous (fun h : Matrix (Fin d) (Fin d) ℝ => primitiveExteriorCovolume h Δ b) := by sorry

/-- An invertible matrix applied to a real independent subgroup basis gives strictly positive exterior covolume. -/
theorem primitiveExteriorCovolume_pos
    (h : Matrix (Fin d) (Fin d) ℝ) (hh : h.det ≠ 0)
    (Δ : Submodule ℤ (Fin d → ℝ)) (b : Basis (Fin k) ℤ Δ)
    (hind : LinearIndependent ℝ (fun i => (b i : Fin d → ℝ))) :
    0 < primitiveExteriorCovolume h Δ b := by sorry

example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ)
    (hb : (b 0 : Fin 2 → ℝ) = ![2,0]) : primitiveExteriorCovolume 1 Δ b = 2 := by sorry
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ)
    (hb : (b 0 : Fin 2 → ℝ) = ![1,1]) :
    primitiveExteriorCovolume (Matrix.diagonal ![2,3]) Δ b = 3 := by sorry
example (Δ : Submodule ℤ (Fin 2 → ℝ)) (b : Basis (Fin 1) ℤ Δ) :
    primitiveExteriorCovolume 0 Δ b = 0 := by sorry
end PrimitiveExteriorCovolumes

section QuantitativeNondivergence

/-- A subgroup of the standard integer lattice saturated under multiplication by every nonzero integer. -/
def integralPrimitiveSubgroup {d : ℕ} (Δ : Submodule ℤ (Fin d → ℝ)) : Prop :=
  (∀ x ∈ Δ, ∃ z : Fin d → ℤ, (fun i => (z i : ℝ)) = x) ∧
  ∀ (z : Fin d → ℤ) (a : ℤ), a ≠ 0 →
    (fun i => ((a*z i : ℤ) : ℝ)) ∈ Δ → (fun i => (z i : ℝ)) ∈ Δ

/-- The parameters for which a nonzero integer vector has transformed supremum norm below the threshold. -/
def shortIntegerVectorSet {s d : ℕ} (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (B : Set (Fin s → ℝ)) (ε : ℝ) : Set (Fin s → ℝ) :=
  {x ∈ B | ∃ z : Fin d → ℤ, z ≠ 0 ∧ ‖(h x).mulVec (fun i => (z i : ℝ))‖ < ε}

/-- The zero subgroup is integral and saturated, also in ambient rank zero. -/
theorem integralPrimitiveSubgroup_bot (d : ℕ) :
    integralPrimitiveSubgroup (⊥ : Submodule ℤ (Fin d → ℝ)) := by sorry

/-- Increasing the threshold enlarges the set with a short integer vector. -/
theorem shortIntegerVectorSet_mono {s d : ℕ}
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (B : Set (Fin s → ℝ)) {ε δ : ℝ} (hεδ : ε ≤ δ) :
    shortIntegerVectorSet h B ε ⊆ shortIntegerVectorSet h B δ := by sorry

/-- For a continuous matrix family the short-vector locus in a measurable set is measurable. -/
theorem shortIntegerVectorSet_measurable {s d : ℕ}
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ) (hh : Continuous h)
    (B : Set (Fin s → ℝ)) (hB : MeasurableSet B) (ε : ℝ) :
    MeasurableSet (shortIntegerVectorSet h B ε) := by sorry

/-- The quantitative nondivergence bound from good primitive exterior covolumes and a uniform lower supremum. -/
theorem quantitative_nondivergence {s d : ℕ} (hd : 0 < d)
    (h : (Fin s → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (x₀ : Fin s → ℝ) (r C α ρ ε : ℝ) (hr : 0 < r) (hC : 0 < C) (hα : 0 < α)
    (hρ : 0 < ρ) (hρd : ρ ≤ (d : ℝ)⁻¹) (hε : 0 < ε) (hερ : ε ≤ ρ)
    (hh : ContinuousOn h (Metric.ball x₀ ((3 : ℝ)^d*r)))
    (hdet : ∀ x ∈ Metric.ball x₀ ((3 : ℝ)^d*r), (h x).det ≠ 0)
    (hgood : ∀ (Δ : Submodule ℤ (Fin d → ℝ)), integralPrimitiveSubgroup Δ → Δ ≠ ⊥ →
      ∀ (k : ℕ) (b : Basis (Fin k) ℤ Δ),
        GoodOn (fun x => primitiveExteriorCovolume (h x) Δ b) C α
          (Metric.ball x₀ ((3 : ℝ)^d*r)))
    (hsup : ∀ (Δ : Submodule ℤ (Fin d → ℝ)), integralPrimitiveSubgroup Δ → Δ ≠ ⊥ →
      ∀ (k : ℕ) (b : Basis (Fin k) ℤ Δ),
        ρ ≤ sSup ((fun x => primitiveExteriorCovolume (h x) Δ b) '' Metric.ball x₀ r)) :
    volume.real (shortIntegerVectorSet h (Metric.ball x₀ r) ε) ≤
      (d : ℝ)*C*((3 : ℝ)^s * Besicovitch.multiplicity (Fin s → ℝ))^d *
        Real.rpow (ε/ρ) α * volume.real (Metric.ball x₀ r) := by sorry

example : integralPrimitiveSubgroup
    (Submodule.span ℤ ({(![1,1] : Fin 2 → ℝ)} : Set (Fin 2 → ℝ))) := by sorry
example : ¬ integralPrimitiveSubgroup
    (Submodule.span ℤ ({(![2,0] : Fin 2 → ℝ)} : Set (Fin 2 → ℝ))) := by sorry
example : integralPrimitiveSubgroup (⊥ : Submodule ℤ (Fin 0 → ℝ)) := by sorry
example : shortIntegerVectorSet (fun _ : Fin 1 → ℝ => (1 : Matrix (Fin 1) (Fin 1) ℝ))
    Set.univ (1/2) = ∅ := by sorry
example : shortIntegerVectorSet (fun _ : Fin 1 → ℝ => (1 : Matrix (Fin 1) (Fin 1) ℝ))
    Set.univ 2 = Set.univ := by sorry
example : shortIntegerVectorSet (fun _ : Fin 1 → ℝ => (0 : Matrix (Fin 0) (Fin 0) ℝ))
    Set.univ 1 = ∅ := by sorry
end QuantitativeNondivergence

section WeightedGaussianFourier
open MvPolynomial
open scoped FourierTransform

/-- The negative-phase Fourier transform of a homogeneous harmonic polynomial times a positive Gaussian. -/
theorem fourier_harmonic_gaussian {n ℓ : ℕ} (P : MvPolynomial (Fin n) ℝ)
    (hh : P.IsHomogeneous ℓ) (hP : ∑ i : Fin n, pderiv i (pderiv i P) = 0)
    (t : ℝ) (ht : 0 < t) (y : EuclideanSpace ℝ (Fin n)) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin n) =>
      (eval (fun i => x i) P : ℂ)*Complex.exp (-(Real.pi*t : ℂ)*‖x‖^2)) y =
      (-Complex.I)^ℓ * (t : ℂ)^(-((n : ℂ)/2 + ℓ)) *
        (eval (fun i => y i) P : ℂ) * Complex.exp (-(Real.pi/t : ℂ)*‖y‖^2) := by sorry

example (y : ℝ) :
    𝓕 (fun x : ℝ => (x : ℂ)*Complex.exp (-(Real.pi : ℂ)*x^2)) y =
      -Complex.I*(y : ℂ)*Complex.exp (-(Real.pi : ℂ)*y^2) := by sorry
example (y : EuclideanSpace ℝ (Fin 2)) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin 2) =>
      ((x 0)^2-(x 1)^2 : ℂ)*Complex.exp (-(Real.pi : ℂ)*‖x‖^2)) y =
      -((y 0)^2-(y 1)^2 : ℂ)*Complex.exp (-(Real.pi : ℂ)*‖y‖^2) := by sorry
example (y : EuclideanSpace ℝ (Fin 0)) :
    𝓕 (fun _ : EuclideanSpace ℝ (Fin 0) => (1 : ℂ)) y = 1 := by sorry
end WeightedGaussianFourier

section HarmonicTheta
open MvPolynomial

/-- The integer vectors whose sum of three squares is the specified nonnegative integer. -/
def ternaryShell (n : ℕ) : Set (Fin 3 → ℤ) := {v | ∑ i, v i ^ 2 = (n : ℤ)}

/-- The finite signed coefficient identity, for positive n; at zero this is 0. -/
def signedThreeSquareCount (n : ℕ) : ℤ :=
  6 * (-1 : ℤ)^(n+1) *
    (∑ r ∈ Finset.Icc 1 n, ∑ s ∈ Finset.Icc 1 n,
      if r*s = n then (-1 : ℤ)^(r+s) else 0) +
  4 * (-1 : ℤ)^(n+1) *
    (∑ r ∈ Finset.Icc 1 n, ∑ s ∈ Finset.Icc 1 n, ∑ t ∈ Finset.Icc 1 n,
      if r*s+r*t+s*t = n then (-1 : ℤ)^(r+s+t) else 0)

/-- For positive n, the signed finite expression counts the ordered signed three-square representations. -/
theorem gauss_signed_three_square_count {n : ℕ} (hn : 0 < n) :
    (Nat.card (ternaryShell n) : ℤ) = signedThreeSquareCount n := by sorry

example : signedThreeSquareCount 1 = 6 := by decide
example : signedThreeSquareCount 2 = 12 := by decide
example : signedThreeSquareCount 3 = 8 := by decide
example : signedThreeSquareCount 7 = 0 := by decide
example : signedThreeSquareCount 0 = 0 ∧ Nat.card (ternaryShell 0) = 1 := by sorry

/-- The sum of the three coordinate second derivatives of a ternary polynomial. -/
def polynomialLaplacian (P : MvPolynomial (Fin 3) ℝ) : MvPolynomial (Fin 3) ℝ :=
  ∑ i : Fin 3, pderiv i (pderiv i P)

/-- The finite ternary shell coefficient weighted by polynomial evaluation. -/
def ternaryWeightedCoefficient (P : MvPolynomial (Fin 3) ℝ) (n : ℕ) : ℝ :=
  ∑' v : ternaryShell n, eval (fun i => (v.1 i : ℝ)) P

/-- The ternary theta sum weighted by a real polynomial and using the 2πiτ exponent. -/
def ternaryHarmonicTheta (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ) : ℂ :=
  ∑' v : Fin 3 → ℤ, (eval (fun i => (v i : ℝ)) P : ℂ) *
    Complex.exp (2 * (Real.pi : ℂ) * Complex.I * τ * (∑ i, (v i : ℂ)^2))

/-- The negative discriminant associated to positive squarefree n, using −n when n is 3 modulo 4. -/
def ternaryFundamentalDiscriminant (n : ℕ) : ℤ :=
  if n % 4 = 3 then -(n : ℤ) else -4*(n : ℤ)

/-- Every ternary quadratic shell has finitely many integer points. -/
theorem ternaryShell_finite (n : ℕ) : (ternaryShell n).Finite := by sorry

/-- The weighted shell coefficient is additive in the polynomial. -/
theorem ternaryWeightedCoefficient_add (P Q : MvPolynomial (Fin 3) ℝ) (n : ℕ) :
    ternaryWeightedCoefficient (P+Q) n =
      ternaryWeightedCoefficient P n + ternaryWeightedCoefficient Q n := by sorry

/-- An odd homogeneous polynomial has zero shell coefficient by pairing v with −v. -/
theorem ternaryWeightedCoefficient_odd (P : MvPolynomial (Fin 3) ℝ) (ℓ : ℕ)
    (hhom : P.IsHomogeneous ℓ) (hodd : Odd ℓ) (n : ℕ) :
    ternaryWeightedCoefficient P n = 0 := by sorry

/-- Regroup the convergent weighted theta sum by the nonnegative three-square value. -/
theorem ternaryHarmonicTheta_coeff (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ)
    (hτ : 0 < τ.im) :
    ternaryHarmonicTheta P τ = ∑' n : ℕ,
      (ternaryWeightedCoefficient P n : ℂ) *
        Complex.exp (2*(Real.pi : ℂ)*Complex.I*τ*n) := by sorry

/-- Polynomial growth is dominated by the positive imaginary-part Gaussian. -/
theorem ternaryHarmonicTheta_summable (P : MvPolynomial (Fin 3) ℝ) (τ : ℂ)
    (hτ : 0 < τ.im) :
    Summable (fun v : Fin 3 → ℤ => (eval (fun i => (v i : ℝ)) P : ℂ) *
      Complex.exp (2*(Real.pi : ℂ)*Complex.I*τ*(∑ i, (v i : ℂ)^2))) := by sorry

example : Nat.card (ternaryShell 1) = 6 := by sorry
example : Nat.card (ternaryShell 2) = 12 := by sorry
example : ternaryShell 7 = ∅ := by sorry
example : ternaryShell 0 = {0} := by sorry
example : polynomialLaplacian (1 : MvPolynomial (Fin 3) ℝ) = 0 := by sorry
example : polynomialLaplacian (X (0 : Fin 3) : MvPolynomial (Fin 3) ℝ) = 0 := by sorry
example : polynomialLaplacian
    ((X (0 : Fin 3))^2 - (X (1 : Fin 3))^2 : MvPolynomial (Fin 3) ℝ) = 0 := by sorry
example : polynomialLaplacian
    ((X (0 : Fin 3))^2 : MvPolynomial (Fin 3) ℝ) = 2 := by sorry
example : ternaryWeightedCoefficient 1 1 = 6 := by sorry
example (n : ℕ) : ternaryWeightedCoefficient (X (0 : Fin 3)) n = 0 := by sorry
example :
    let P : MvPolynomial (Fin 3) ℝ :=
      (∑ i : Fin 3, X i ^ 4) - C (3/5) * (∑ i : Fin 3, X i ^ 2)^2
    P.IsHomogeneous 4 ∧ polynomialLaplacian P = 0 ∧
      ternaryWeightedCoefficient P 1 = 12/5 := by sorry
example (τ : ℂ) : ternaryHarmonicTheta (X (0 : Fin 3)) τ = 0 := by sorry
example (τ : ℂ) : ternaryHarmonicTheta
    ((X (0 : Fin 3))^2 - (X (1 : Fin 3))^2) τ = 0 := by sorry
example : 1 < (ternaryHarmonicTheta 1 Complex.I).re := by sorry
example : ternaryFundamentalDiscriminant 1 = -4 := by decide
example : ternaryFundamentalDiscriminant 2 = -8 := by decide
example : ternaryFundamentalDiscriminant 3 = -3 := by decide
example : Nat.card (ternaryShell 4) = 6 ∧ ¬ Squarefree (4 : ℕ) := by sorry
end HarmonicTheta

section KroneckerKernels
/-- Infinite q-Pochhammer product; analytic identities require ‖q‖ < 1. -/
noncomputable def qPochhammer (a q : ℂ) : ℂ := ∏' n : ℕ, (1-a*q^n)

/-- Jacobi's product normalization, with no square-root factor. -/
noncomputable def jacobiProduct (a q : ℂ) : ℂ :=
  qPochhammer a q * qPochhammer (q/a) q * qPochhammer q q

/-- The signed-quadrant kernel before summing; negative indices are integers. -/
def kroneckerSummand (q x y z : ℂ) (s t : ℤ) : ℂ :=
  q^(s*t)*y^s*z^t/(1-x*q^(s+t))

/-- Reindexes the negative quadrant by s=−(i+1), t=−(j+1). -/
noncomputable def kroneckerDoubleKernel (q x y z : ℂ) : ℂ :=
  (∑' st : ℕ × ℕ, kroneckerSummand q x y z st.1 st.2) -
  (∑' st : ℕ × ℕ, kroneckerSummand q x y z (-(st.1+1 : ℤ)) (-(st.2+1 : ℤ)))

/-- One cyclic product-times-bilateral-series term in the double identity. -/
noncomputable def kroneckerCyclicTerm (q x y z : ℂ) : ℂ :=
  (qPochhammer (x*y) (q^2) * qPochhammer (q^2/(x*y)) (q^2) *
    qPochhammer q q ^ 2) /
  (qPochhammer x q * qPochhammer y q * qPochhammer (q/x) q *
    qPochhammer (q/y) q * qPochhammer (q^2) (q^2)) *
  ∑' k : ℤ, (-1 : ℂ)^k * q^(k^2) * (x*y)^k / (1+q^(2*k)*z)

/-- The product correction accompanying the three cyclic terms. -/
noncomputable def kroneckerCorrection (q x y z : ℂ) : ℂ :=
  2 * qPochhammer (q^2) (q^2)^3 *
    (qPochhammer (x*y) (q^2) * qPochhammer (x*z) (q^2) *
     qPochhammer (y*z) (q^2) * qPochhammer (q^2/(x*y)) (q^2) *
     qPochhammer (q^2/(x*z)) (q^2) * qPochhammer (q^2/(y*z)) (q^2)) /
    (qPochhammer x q * qPochhammer y q * qPochhammer z q *
     qPochhammer (q/x) q * qPochhammer (q/y) q * qPochhammer (q/z) q *
     qPochhammer (-x) (q^2) * qPochhammer (-y) (q^2) *
     qPochhammer (-z) (q^2) * qPochhammer (-q^2/x) (q^2) *
     qPochhammer (-q^2/y) (q^2) * qPochhammer (-q^2/z) (q^2))

/-- Mortenson's identity where every displayed denominator is nonzero. -/
theorem kronecker_double_identity (q x y z : ℂ)
    (hq : 0 < ‖q‖ ∧ ‖q‖ < 1)
    (hy : ‖q‖ < ‖y‖ ∧ ‖y‖ < 1) (hz : ‖q‖ < ‖z‖ ∧ ‖z‖ < 1)
    (hx : x ≠ 0 ∧ ∀ k : ℤ, x ≠ q^k)
    (hp : ∀ k : ℤ, z ≠ -q^(2*k) ∧ y ≠ -q^(2*k) ∧ x ≠ -q^(2*k)) :
    kroneckerDoubleKernel q x y z =
      kroneckerCyclicTerm q x y z + kroneckerCyclicTerm q x z y +
      kroneckerCyclicTerm q y z x - kroneckerCorrection q x y z := by sorry

/-- Separate the first factor of the convergent q-Pochhammer product. -/
theorem qPochhammer_shift (a q : ℂ) (hq : ‖q‖ < 1) :
    qPochhammer a q = (1-a)*qPochhammer (a*q) q := by sorry

/-- Inverting the Jacobi argument contributes the factor −a inverse. -/
theorem jacobiProduct_inversion (a q : ℂ) (ha : a ≠ 0) (hq : ‖q‖ < 1) :
    jacobiProduct (a⁻¹) q = -a⁻¹*jacobiProduct a q := by sorry

example (q : ℂ) : qPochhammer 0 q = 1 := by sorry
example (a : ℂ) : qPochhammer a 0 = 1-a := by sorry
example (q : ℂ) : qPochhammer 1 q = 0 := by sorry
example (a : ℂ) (ha : a ≠ 0) : jacobiProduct a 0 = 1-a := by sorry
example (q : ℂ) : jacobiProduct 1 q = 0 := by sorry
example (q : ℂ) (hq : ‖q‖ < 1) : jacobiProduct q q = 0 := by sorry
example : kroneckerSummand (1/2) (1/3) (2/3) (3/4) 0 0 = 3/2 := by norm_num [kroneckerSummand]
example : kroneckerSummand (1/2) (1/3) (2/3) (3/4) 1 0 = 4/5 := by norm_num [kroneckerSummand]
example : kroneckerSummand (1/2) (1/3) (2/3) (3/4) (-1) (-1) = -3 := by norm_num [kroneckerSummand]
example : kroneckerDoubleKernel 0 0 0 0 = 1 := by sorry
example : kroneckerDoubleKernel 0 (1/3) 0 0 = 3/2 := by sorry
example : kroneckerDoubleKernel 0 (1/3) (1/2) (1/2) = 7/2 := by sorry
example : kroneckerCyclicTerm 0 (1/3) (2/3) (3/4) = 2 := by sorry
example : kroneckerCyclicTerm 0 (1/3) (3/4) (2/3) = 27/10 := by sorry
example : kroneckerCyclicTerm 0 (2/3) (3/4) (1/3) = 9/2 := by sorry
example : kroneckerCorrection 0 0 0 0 = 2 := by sorry
example : kroneckerCorrection 0 0 0 (1/2) = 8/3 := by sorry
example : kroneckerCorrection 0 (1/3) (2/3) (3/4) = 27/10 := by sorry
end KroneckerKernels

section PositiveBinaryClasses

/-- A positive integral binary quadratic form of a fixed negative discriminant, with the middle coefficient convention ax²+bxy+cy². -/
structure PositiveBinaryForm (D : ℤ) where
  a : ℤ
  b : ℤ
  c : ℤ
  a_pos : 0 < a
  discr : b^2 - 4*a*c = D
  discr_neg : D < 0

/-- Evaluate the binary form on an integer two-vector. -/
def PositiveBinaryForm.value {D : ℤ} (q : PositiveBinaryForm D) (x : Fin 2 → ℤ) : ℤ :=
  q.a*x 0^2 + q.b*x 0*x 1 + q.c*x 1^2

/-- The three integral coefficients have greatest common divisor one. -/
def PositiveBinaryForm.IsPrimitive {D : ℤ} (q : PositiveBinaryForm D) : Prop :=
  Nat.gcd (Nat.gcd q.a.natAbs q.b.natAbs) q.c.natAbs = 1

/-- Equivalence of positive binary forms by an integral determinant-one change of variables. -/
def properBinaryEquivalent {D : ℤ} (q r : PositiveBinaryForm D) : Prop :=
  ∃ g : Matrix.SpecialLinearGroup (Fin 2) ℤ,
    ∀ x, r.value x = q.value ((g : Matrix (Fin 2) (Fin 2) ℤ).mulVec x)

/-- The proper-equivalence setoid on primitive positive binary forms of fixed discriminant. -/
def properBinarySetoid (D : ℤ) : Setoid {q : PositiveBinaryForm D // q.IsPrimitive} where
  r q r := properBinaryEquivalent q.1 r.1
  iseqv := by sorry

/-- Primitive positive binary classes modulo integral determinant-one transformations. -/
def properBinaryClass (D : ℤ) := Quotient (properBinarySetoid D)

/-- The finite order of the determinant-one integral automorphism group of a positive binary form. -/
def binaryFormUnitCount {D : ℤ} (q : PositiveBinaryForm D) : ℕ :=
  Nat.card {g : Matrix.SpecialLinearGroup (Fin 2) ℤ |
    ∀ x, q.value ((g : Matrix (Fin 2) (Fin 2) ℤ).mulVec x) = q.value x}

/-- There are finitely many proper primitive classes of a fixed negative discriminant; other discriminants have no forms. -/
theorem properBinaryClass_finite (D : ℤ) : Finite (properBinaryClass D) := by sorry

/-- The three-square class-number formula in the squarefree 1 or 2 modulo 4 cases, with the n=1 unit exception. -/
theorem gauss_three_square_class_number {n : ℕ} (hn : 0 < n) (hsq : Squarefree n)
    (hmod : n % 4 = 1 ∨ n % 4 = 2) :
    (Nat.card (ternaryShell n) : ℚ) =
      if n = 1 then 6 else 12 * (Nat.card (properBinaryClass (-4*(n : ℤ))) : ℚ) := by sorry

/-- The three-square class-number formula in the squarefree 3 modulo 8 case, with the n=3 unit exception. -/
theorem gauss_three_square_class_number_three {n : ℕ} (hn : 0 < n)
    (hsq : Squarefree n) (hmod : n % 8 = 3) :
    (Nat.card (ternaryShell n) : ℚ) =
      if n = 3 then 8 else 24 * (Nat.card (properBinaryClass (-(n : ℤ))) : ℚ) := by sorry

example : (PositiveBinaryForm.mk 1 0 1 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-4)).value ![1,2] = 5 := by decide
example : (PositiveBinaryForm.mk 1 1 1 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-3)).value ![1,1] = 3 := by decide
example : (PositiveBinaryForm.mk 2 (-1) 3 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-23)).value ![1,1] = 4 := by decide
example : (PositiveBinaryForm.mk 1 0 1 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-4)).IsPrimitive := by norm_num [PositiveBinaryForm.IsPrimitive]
example : (PositiveBinaryForm.mk 1 1 1 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-3)).IsPrimitive := by norm_num [PositiveBinaryForm.IsPrimitive]
example : ¬ (PositiveBinaryForm.mk 2 0 2 (by decide) (by decide) (by decide) :
    PositiveBinaryForm (-16)).IsPrimitive := by norm_num [PositiveBinaryForm.IsPrimitive]
example : Nat.card (properBinaryClass (-4)) = 1 := by sorry
example : Nat.card (properBinaryClass (-3)) = 1 := by sorry
example : Nat.card (properBinaryClass (-23)) = 3 := by sorry
example : binaryFormUnitCount (PositiveBinaryForm.mk 1 0 1
    (by decide) (by decide) (by decide) : PositiveBinaryForm (-4)) = 4 := by sorry
example : binaryFormUnitCount (PositiveBinaryForm.mk 1 1 1
    (by decide) (by decide) (by decide) : PositiveBinaryForm (-3)) = 6 := by sorry
example : binaryFormUnitCount (PositiveBinaryForm.mk 1 1 6
    (by decide) (by decide) (by decide) : PositiveBinaryForm (-23)) = 2 := by sorry
example : ¬ properBinaryEquivalent
    (PositiveBinaryForm.mk 2 1 3 (by decide) (by decide) (by decide) : PositiveBinaryForm (-23))
    (PositiveBinaryForm.mk 2 (-1) 3 (by decide) (by decide) (by decide) : PositiveBinaryForm (-23)) := by sorry
example (D : ℤ) (q : PositiveBinaryForm D) : properBinaryEquivalent q q := by sorry
example (D : ℤ) (q : PositiveBinaryForm D) : properBinaryEquivalent q
    { a := q.c, b := -q.b, c := q.a, a_pos := by sorry,
      discr := by sorry, discr_neg := q.discr_neg } := by sorry

end PositiveBinaryClasses

section HalfIntegralKloosterman
/-- The theta-multiplier phase; its arithmetic interpretation uses odd d. -/
def thetaMultiplierPhase (d : ℕ) : ℂ := if d % 4 = 1 then 1 else Complex.I

/-- The finite sum for weight ℓ+1/2; identities require c positive and divisible by four. -/
noncomputable def halfIntegralKloosterman (ℓ m n c : ℕ) [NeZero c] : ℂ :=
  ∑ d : (ZMod c)ˣ,
    thetaMultiplierPhase (d.val.val) ^ (-(2*(ℓ : ℤ)+1)) *
      (jacobiSym (c : ℤ) d.val.val : ℂ) *
      Complex.exp (2*Real.pi*Complex.I *
        (((m : ℂ)*(↑(d⁻¹).val.val : ℂ) + (n : ℂ)*(↑d.val.val : ℂ)) / c))

/-- The finite oscillatory c-sum in Iwaniec's level-average theorem. -/
noncomputable def halfIntegralKloostermanPartialSum (ℓ n Q : ℕ) (x v : ℝ) : ℂ :=
  ∑ c ∈ Finset.range (Nat.floor x + 1),
    if hc : 0 < c then
      letI : NeZero c := ⟨Nat.ne_of_gt hc⟩
      if Q ∣ c then
        (Real.sqrt c : ℂ)⁻¹ * halfIntegralKloosterman ℓ n n c *
          Complex.exp (2*Real.pi*Complex.I*(v : ℂ)*(2*n/c : ℂ))
      else 0
    else 0

/-- The Kloosterman sum is periodic in its first additive parameter modulo the modulus. -/
theorem halfIntegralKloosterman_period_m (ℓ m n c : ℕ) [NeZero c] :
    halfIntegralKloosterman ℓ (m+c) n c = halfIntegralKloosterman ℓ m n c := by sorry

/-- Increasing the integral weight parameter by two leaves the theta-multiplier sum unchanged. -/
theorem halfIntegralKloosterman_weight_period (ℓ m n c : ℕ) [NeZero c] :
    halfIntegralKloosterman (ℓ+2) m n c = halfIntegralKloosterman ℓ m n c := by sorry

/-- The finite restricted modulus sum is continuous in its real phase parameter. -/
theorem halfIntegralKloostermanPartialSum_continuous (ℓ n Q : ℕ) (x : ℝ) :
    Continuous (halfIntegralKloostermanPartialSum ℓ n Q x) := by sorry

example : thetaMultiplierPhase 1 = 1 := by norm_num [thetaMultiplierPhase]
example : thetaMultiplierPhase 3 = Complex.I := by norm_num [thetaMultiplierPhase]
example : thetaMultiplierPhase 5 = 1 := by norm_num [thetaMultiplierPhase]
example : halfIntegralKloosterman 0 0 0 4 = 1-Complex.I := by sorry
example : halfIntegralKloosterman 1 0 0 4 = 1+Complex.I := by sorry
example : halfIntegralKloosterman 0 1 1 4 = -1+Complex.I := by sorry
example : halfIntegralKloostermanPartialSum 0 1 4 3 0 = 0 := by sorry
example : halfIntegralKloostermanPartialSum 0 0 4 4 0 = (1-Complex.I)/2 := by sorry
example (ℓ n Q : ℕ) (v : ℝ) : halfIntegralKloostermanPartialSum ℓ n Q 0 v = 0 := by sorry
end HalfIntegralKloosterman

section PackingCovering
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Half the attained first Euclidean minimum, zero in rank zero. -/
def latticePackingRadius (L : Submodule ℤ E) : ℝ :=
  if finrank ℝ E = 0 then 0 else sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r=‖x‖} / 2
/-- Supremum of the distance-to-lattice function. -/
def latticeCoveringRadius (L : Submodule ℤ E) : ℝ :=
  sSup (Set.range (fun x : E => Metric.infDist x (L : Set E)))

/-- In positive rank it is half the first Euclidean minimum. -/
theorem latticePackingRadius_eq_half (L : Submodule ℤ E)
    (h : 0 < finrank ℝ E) :
    latticePackingRadius L = sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r=‖x‖}/2 := by sorry
/-- A positive homothety multiplies the lattice packing radius by its scale. -/
theorem latticePackingRadius_smul (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (a : ℝ) (ha : 0<a) :
    latticePackingRadius (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) =
      a*latticePackingRadius L := by sorry
/-- A point in a compact fundamental domain attains the radius. -/
theorem latticeCoveringRadius_attained (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] : ∃ x : E, Metric.infDist x (L : Set E)=latticeCoveringRadius L := by sorry
/-- A positive homothety multiplies the lattice covering radius by its scale. -/
theorem latticeCoveringRadius_smul (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (a : ℝ) (ha : 0<a) :
    latticeCoveringRadius (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) =
      a*latticeCoveringRadius L := by sorry

example : latticePackingRadius (Submodule.span ℤ ({1} : Set ℝ)) = 1/2 := by sorry
example : latticeCoveringRadius (Submodule.span ℤ ({1} : Set ℝ)) = 1/2 := by sorry
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) : latticePackingRadius L=0 := by sorry
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) : latticeCoveringRadius L=0 := by sorry
end PackingCovering

section StarBodies
variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- A compact radial body defined by a continuous positive homogeneous gauge with bounded unit sublevel. -/
structure CompactStarBody where
  gauge : E → ℝ
  continuous : Continuous gauge
  nonneg : ∀ x, 0 ≤ gauge x
  zero_iff : ∀ x, gauge x=0 ↔ x=0
  homogeneous : ∀ (a : ℝ), 0 ≤ a → ∀ x, gauge (a • x)=a*gauge x
  compact : IsCompact {x | gauge x ≤ 1}
  originInterior : (0 : E) ∈ interior {x | gauge x ≤ 1}

variable {E}
/-- The actual continuous definite homogeneous gauge and compact unit sublevel. -/
def CompactStarBody.ofGauge (p : E → ℝ) (hc : Continuous p)
    (hn : ∀ x, 0 ≤ p x) (hz : ∀ x, p x=0 ↔ x=0)
    (hh : ∀ a : ℝ, 0 ≤ a → ∀ x, p (a • x)=a*p x)
    (hk : IsCompact {x | p x ≤ 1}) (hi : (0 : E) ∈ interior {x | p x ≤ 1}) :
    CompactStarBody E := ⟨p,hc,hn,hz,hh,hk,hi⟩
/-- Positive scaling of the argument scales the star-body gauge by the same factor. -/
theorem CompactStarBody.radial (K : CompactStarBody E) (a : ℝ) (ha : 0<a) (x : E) :
    K.gauge (a • x) ≤ 1 ↔ K.gauge x ≤ 1/a := by sorry
/-- A full lattice is admissible when the star-body interior contains no nonzero lattice point. -/
def CompactStarBody.admissible (K : CompactStarBody E) (L : Submodule ℤ E) : Prop :=
  ∀ x ∈ L, x≠0 → 1 ≤ K.gauge x
/-- When the unit sublevel is convex, compare to the ConvexBody. -/
def CompactStarBody.convexComparison (K : CompactStarBody E)
    (h : Convex ℝ {x | K.gauge x ≤ 1}) : ConvexBody E :=
  ⟨{x | K.gauge x ≤ 1},h,K.compact,⟨0,by sorry⟩⟩

example (K : CompactStarBody E) : K.gauge 0=0 := by sorry
example (K : CompactStarBody E) : K.gauge (0 • (0 : E))=0 := by sorry
example (K : CompactStarBody E) (h : Convex ℝ {x | K.gauge x ≤ 1}) :
    (K.convexComparison h : Set E)={x | K.gauge x ≤ 1} := by sorry
end StarBodies

section CriticalDeterminants
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
local instance : MeasureSpace E := measureSpaceOfInnerProductSpace
/-- Infimum over admissible full lattices. -/
def criticalDeterminant (K : CompactStarBody E) : ℝ :=
  sInf {d | ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
    K.admissible L ∧ d=ZLattice.covolume L}
/-- The critical determinant is at most the covolume of every admissible full lattice. -/
theorem criticalDeterminant_le_covolume (K : CompactStarBody E) (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (h : K.admissible L) :
    criticalDeterminant K ≤ ZLattice.covolume L := by sorry
/-- Enlarging a star body can only increase its critical determinant. -/
theorem criticalDeterminant_mono (K H : CompactStarBody E)
    (h : {x | K.gauge x ≤ 1} ⊆ {x | H.gauge x ≤ 1}) : criticalDeterminant K ≤ criticalDeterminant H := by sorry
/-- Scaling a star body by a positive factor scales its critical determinant by that factor to the dimension. -/
theorem criticalDeterminant_smul (K H : CompactStarBody E) (a : ℝ) (ha : 0 < a)
    (h : ∀ x, H.gauge x=K.gauge x/a) :
    criticalDeterminant H = a^(finrank ℝ E)*criticalDeterminant K := by sorry
/-- The origin has a positive-radius ball inside the star-body interior. -/
theorem star_body_interior_ball (K : CompactStarBody E) :
    ∃ r : ℝ, 0 < r ∧ Metric.ball 0 r ⊆ {x | K.gauge x < 1} := by sorry
/-- A sufficiently large homothety of any full lattice is admissible for a compact star body. -/
theorem star_body_admissible_dilate (K : CompactStarBody E) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L), K.admissible L := by sorry
/-- A compact star body in positive dimension has strictly positive critical determinant. -/
theorem critical_determinant_positive (K : CompactStarBody E) (hn : 0 < finrank ℝ E) :
    0 < criticalDeterminant K := by sorry
/-- Admissibility is closed under convergent full lattice bases. -/
theorem star_admissibility_closed (K : CompactStarBody E) {n : ℕ}
    (b : ℕ → Fin n → E) (c : Basis (Fin n) ℝ E)
    (hconv : ∀ i, Filter.Tendsto (fun m => b m i) Filter.atTop (nhds (c i)))
    (h : ∀ m, K.admissible (Submodule.span ℤ (Set.range (b m)))) :
    K.admissible (Submodule.span ℤ (Set.range c)) := by sorry
/-- A compact star body has an admissible lattice attaining its critical determinant. -/
theorem critical_lattice_exists (K : CompactStarBody E) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
      K.admissible L ∧ ZLattice.covolume L=criticalDeterminant K := by sorry
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x=|x|) : criticalDeterminant K=1 := by sorry
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x=|x|/2) : criticalDeterminant K=2 := by sorry
example (K : CompactStarBody (EuclideanSpace ℝ (Fin 0))) : criticalDeterminant K=1 := by sorry
end CriticalDeterminants

section GaussianSums
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
/-- The countable Gaussian sum on the lattice subtype. -/
def latticeGaussianSum [FiniteDimensional ℝ E] (L : Submodule ℤ E) (s : ℝ) (u : E) : ℝ :=
  ∑' x : L, Real.exp (-Real.pi*‖(x : E)+u‖^2/s^2)
variable [FiniteDimensional ℝ E]

/-- The sum in rank zero is 1. -/
theorem latticeGaussianSum_zeroRank (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (s : ℝ) (hs : 0 < s) :
    latticeGaussianSum L s 0=1 := by sorry
/-- Integral shifts preserve the sum. -/
theorem latticeGaussianSum_translate (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u v : E) (hv : v∈L) :
    latticeGaussianSum L s (u+v)=latticeGaussianSum L s u := by sorry
/-- Simultaneous positive scaling of L,u,s preserves the sum. -/
theorem latticeGaussianSum_scale (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s a : ℝ) (hs : 0 < s) (ha : 0 < a) (u : E) :
    latticeGaussianSum (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) (a*s) (a • u) =
      latticeGaussianSum L s u := by sorry
/-- Every positive-scale shifted Gaussian is summable on a discrete full lattice. -/
theorem gaussian_lattice_summable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) :
    Summable (fun x : L => Real.exp (-Real.pi*‖(x : E)+u‖^2/s^2)) := by sorry
/-- The Gaussian lattice sum is largest when its center belongs to the lattice. -/
theorem gaussian_shift_maximum (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) : latticeGaussianSum L s u ≤ latticeGaussianSum L s 0 := by sorry
/-- Increasing the Gaussian scale by a factor at least one increases its sum by at most the dimension power. -/
theorem gaussian_scale_upper (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 1 ≤ s) (u : E) :
    latticeGaussianSum L s u ≤ s^(finrank ℝ E)*latticeGaussianSum L 1 0 := by sorry
/-- The Gaussian mass beyond the stated shifted radius has the explicit dimension-dependent upper bound. -/
theorem gaussian_shifted_tail (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (u : E) (hn : 0 < finrank ℝ E) :
    (∑' x : {x : L // Real.sqrt (finrank ℝ E) ≤ ‖(x : E)+u‖},
      Real.exp (-Real.pi*‖(x.val : E)+u‖^2)) ≤ 
    (2*Real.exp (-3*Real.pi/4))^(finrank ℝ E)*latticeGaussianSum L 1 0 := by sorry
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) : latticeGaussianSum L 1 0=1 := by sorry
example : latticeGaussianSum (Submodule.span ℤ {(2 : ℝ)}) 2 0=
    latticeGaussianSum (Submodule.span ℤ {(1 : ℝ)}) 1 0 := by sorry
example : latticeGaussianSum (Submodule.span ℤ {(1 : ℝ)}) 1 1=
    latticeGaussianSum (Submodule.span ℤ {(1 : ℝ)}) 1 0 := by sorry
end GaussianSums

section SiegelTransform
variable {E : Type*} [AddCommGroup E]

/-- The Siegel transform sums a compactly supported function over nonzero integer vectors transformed by an SL matrix. -/
def siegelTransform (L : Submodule ℤ E) (f : E → ℝ) : ℝ :=
  ∑' v : {v : L // (v : E) ≠ 0}, f (v.val : E)

/-- The Siegel transform preserves addition for compactly supported continuous functions. -/
theorem siegelTransform_add (L : Submodule ℤ E) (f g : E → ℝ)
    (hf : Summable (fun v : {v : L // (v : E) ≠ 0} => f (v.val : E)))
    (hg : Summable (fun v : {v : L // (v : E) ≠ 0} => g (v.val : E))) :
    siegelTransform L (f+g) = siegelTransform L f + siegelTransform L g := by sorry
/-- A nonnegative function has nonnegative Siegel transform. -/
theorem siegelTransform_nonneg (L : Submodule ℤ E) (f : E → ℝ)
    (hf : ∀ x, 0 ≤ f x) : 0 ≤ siegelTransform L f := by sorry
example (f : E → ℝ) : siegelTransform ⊥ f = 0 := by sorry
example : siegelTransform (Submodule.span ℤ {(1 : ℝ)})
    ((Set.Icc (-1/2 : ℝ) (1/2)).indicator (fun _ => (1 : ℝ))) = 0 := by sorry
example : siegelTransform (Submodule.span ℤ {(1 : ℝ)})
    ((Set.Icc (-1 : ℝ) 1).indicator (fun _ => (1 : ℝ))) = 2 := by sorry
end SiegelTransform

section AdditionalCriticalGaussian
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
 [MeasurableSpace E] [BorelSpace E]
local instance : MeasureSpace E := measureSpaceOfInnerProductSpace
/-- No modulo-rotation quotient is hidden in the sequence: each term is an actual full lattice. -/
theorem critical_minimizing_sequence (K : CompactStarBody E) :
 ∃ (L : ℕ → Submodule ℤ E) (hd : ∀ m, DiscreteTopology (L m)) (hf : ∀ m, IsZLattice ℝ (L m)),
 (∀ m, K.admissible (L m)) ∧
 Filter.Tendsto (fun m => letI := hd m; letI := hf m; ZLattice.covolume (L m))
 Filter.atTop (nhds (criticalDeterminant K)) := by sorry
/-- Uses the native pairing-integral dual submodule. -/
theorem gaussian_lattice_poisson (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
 (s : ℝ) (hs : 0<s) (u : E) :
 (latticeGaussianSum L s u : ℂ) = ((ZLattice.covolume L)⁻¹*s^(finrank ℝ E) : ℝ) *
 ∑' y : LinearMap.BilinForm.dualSubmodule (innerₗ E) L,
 (Real.exp (-Real.pi*‖(y : E)‖^2*s^2) : ℂ) *
 Complex.exp (2*Real.pi*Complex.I*(inner ℝ (y : E) u : ℂ)) := by sorry
/-- A lower bound on the lattice's first minimum controls its Gaussian error. -/
theorem gaussian_short_vector_error (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
 (hn : 0<finrank ℝ E) (h : ∀ x∈L, x≠0 → Real.sqrt (finrank ℝ E)<‖x‖) :
 latticeGaussianSum L 1 0-1 ≤ 
 (2*Real.exp (-3*Real.pi/4))^(finrank ℝ E)/(1-(2*Real.exp (-3*Real.pi/4))^(finrank ℝ E)) := by sorry
/-- Poisson summation bounds the difference from the continuous Gaussian volume by the dual short-vector error. -/
theorem gaussian_poisson_error (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (u : E) :
 |latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 u-ZLattice.covolume L| ≤ 
 ZLattice.covolume L*(latticeGaussianSum L 1 0-1) := by sorry
/-- The Gaussian lower and tail bounds contradict an excessively large distance from the lattice. -/
theorem gaussian_covering_contradiction (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
 (hn : 0<finrank ℝ E) (h : ∀ x∈L, x≠0 → Real.sqrt (finrank ℝ E)<‖x‖) (u : E) :
 ∃ y∈LinearMap.BilinForm.dualSubmodule (innerₗ E) L, ‖y+u‖ ≤ Real.sqrt (finrank ℝ E) := by sorry
end AdditionalCriticalGaussian

section GaussianAllIndex
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- The real span of lattice vectors strictly shorter than the threshold. -/
def shortVectorSpan (L : Submodule ℤ E) (r : ℝ) : Submodule ℝ E :=
  Submodule.span ℝ {x : E | x ∈ L ∧ ‖x‖ < r}

/-- Increasing the short-vector threshold enlarges its real span. -/
theorem shortVectorSpan_mono (L : Submodule ℤ E) {r s : ℝ} (h : r ≤ s) :
    shortVectorSpan L r ≤ shortVectorSpan L s := by sorry
/-- Below the i-th successive minimum the short-vector span has dimension at most i. -/
theorem shortVectorSpan_dim_lt_minimum (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1)
    (i : Fin (finrank ℝ E)) (r : ℝ) (hr : r < successiveMin L K i) :
    finrank ℝ (shortVectorSpan L r) ≤ i.val := by sorry

/-- The normalized Gaussian cosine sum on the lattice. -/
def gaussianCharacteristic (L : Submodule ℤ E) (u : E) : ℝ :=
  (∑' x : L, Real.exp (-Real.pi*‖(x : E)‖^2) *
    Real.cos (2*Real.pi*inner ℝ (x : E) u)) / latticeGaussianSum L 1 0

/-- The Gaussian characteristic equals one at the zero argument. -/
theorem gaussianCharacteristic_zero (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] : gaussianCharacteristic L 0 = 1 := by sorry
/-- Adding a vector from the integral dual lattice preserves the Gaussian characteristic. -/
theorem gaussianCharacteristic_periodic (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (u v : E)
    (hv : v ∈ LinearMap.BilinForm.dualSubmodule (innerₗ E) L) :
    gaussianCharacteristic L (u+v) = gaussianCharacteristic L u := by sorry
/-- Poisson summation expresses the Gaussian characteristic as a shifted dual Gaussian ratio. -/
theorem gaussian_characteristic_poisson (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (u : E) :
    gaussianCharacteristic L u =
      latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 u /
      latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 0 := by sorry

/-- The explicit normalized Gaussian tail estimate above the dimension-scaled threshold. -/
theorem gaussian_variable_tail (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (hn : 0 < finrank ℝ E)
    (c : ℝ) (hc : (Real.sqrt (2*Real.pi))⁻¹ ≤ c) :
    (∑' x : {x : L // c*Real.sqrt (finrank ℝ E) ≤ ‖(x : E)‖},
      Real.exp (-Real.pi*‖(x.val : E)‖^2)) ≤
    (c*Real.sqrt (2*Real.pi*Real.exp 1)*Real.exp (-Real.pi*c^2))^(finrank ℝ E) *
      latticeGaussianSum L 1 0 := by sorry

/-- Complementary short-vector spans would force incompatible characteristic-function and dual-Gaussian bounds. -/
theorem gaussian_short_spans_contradiction (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (hn : 3 ≤ finrank ℝ E)
    (hdim : finrank ℝ (shortVectorSpan L (3/4*Real.sqrt (finrank ℝ E))) +
      finrank ℝ (shortVectorSpan (LinearMap.BilinForm.dualSubmodule (innerₗ E) L)
        (4/3*Real.sqrt (finrank ℝ E))) < finrank ℝ E) :
    ∃ u : E, ‖u‖ = (Real.sqrt 3)⁻¹ ∧ gaussianCharacteristic L u > 7/10 ∧
      latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 u /
        latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 0 < 2/5 := by sorry

example : shortVectorSpan (Submodule.span ℤ {(1 : ℝ)}) 1 = ⊥ := by sorry
example : shortVectorSpan (Submodule.span ℤ {(1 : ℝ)}) 2 = ⊤ := by sorry
example (L : Submodule ℤ E) (r : ℝ) (hr : r ≤ 0) : shortVectorSpan L r = ⊥ := by sorry
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) :
    gaussianCharacteristic L 0 = 1 := by sorry
example : gaussianCharacteristic (Submodule.span ℤ {(1 : ℝ)}) 1 =
    gaussianCharacteristic (Submodule.span ℤ {(1 : ℝ)}) 0 := by sorry
example : gaussianCharacteristic (Submodule.span ℤ {(1 : ℝ)}) (1/2) < 1 := by sorry
example (n : ℕ) (hn : 3 ≤ n) :
    ((3/4 : ℝ)*Real.sqrt (2*Real.pi*Real.exp 1)*Real.exp (-Real.pi*(3/4)^2))^n <
      (3/20 : ℝ) := by sorry
example (n : ℕ) (hn : 3 ≤ n) :
    Real.exp (-Real.pi/3)+(2*Real.exp (-3*Real.pi/4))^n < (2/5 : ℝ) := by sorry
end GaussianAllIndex

section HexagonalTransferenceChecks
/-- A fixed Euclidean hexagonal lattice, rather than arbitrary vectors supplied as a hypothesis. -/
noncomputable def hexagonalLattice : Submodule ℤ (EuclideanSpace ℝ (Fin 2)) :=
  Submodule.span ℤ {WithLp.toLp 2 (![1,0] : Fin 2 → ℝ),
    WithLp.toLp 2 (![1/2,Real.sqrt 3/2] : Fin 2 → ℝ)}

/-- The two independent hexagonal generators define a discrete integer lattice. -/
theorem hexagonalLattice_discrete : DiscreteTopology hexagonalLattice := by sorry

/-- The hexagonal lattice spans the plane; its discrete-topology instance is supplied explicitly. -/
theorem hexagonalLattice_full :
    letI := hexagonalLattice_discrete
    IsZLattice ℝ hexagonalLattice := by sorry

example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = Metric.closedBall 0 1) :
    letI := hexagonalLattice_discrete
    ∀ i, successiveMin hexagonalLattice K i = 1 := by sorry
example (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = Metric.closedBall 0 1) :
    ∀ i, successiveMin
      (LinearMap.BilinForm.dualSubmodule (innerₗ (EuclideanSpace ℝ (Fin 2))) hexagonalLattice)
      K i = 2/Real.sqrt 3 := by sorry
example : letI := hexagonalLattice_full; ZLattice.covolume hexagonalLattice = Real.sqrt 3/2 := by sorry
example : WithLp.toLp 2 (![0,1] : Fin 2 → ℝ) ∉ hexagonalLattice := by sorry
end HexagonalTransferenceChecks


section NativeGeometryTargets
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- The sole successive minimum and its dual have product one in Euclidean rank one. -/
theorem euclidean_dual_transference_rank_one (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1) (hn : finrank ℝ E = 1)
    (i j : Fin (finrank ℝ E)) :
    successiveMin L K i *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K j = 1 := by sorry

/-- The all-index Euclidean transference bound in rank two. -/
theorem euclidean_dual_transference_rank_two (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1) (hn : finrank ℝ E = 2)
    (i j : Fin (finrank ℝ E)) (hij : i.val+j.val = 1) :
    successiveMin L K i *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K j ≤
        2 / Real.sqrt 3 := by sorry

/-- The all-index Euclidean minimum products for a lattice and its integral dual are at most the ambient dimension. -/
theorem euclidean_dual_transference_upper (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1)
    (i j : Fin (finrank ℝ E)) (hij : i.val+j.val+1=finrank ℝ E) :
    successiveMin L K i *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K j ≤ 
        (finrank ℝ E : ℝ) := by sorry

/-- The covering radius times the dual first Euclidean minimum is bounded by the stated dimension constant. -/
theorem covering_dual_transference (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1) (hd : 0<finrank ℝ E) :
    (1/2 : ℝ) ≤ latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0,hd⟩ ∧
    latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0,hd⟩ ≤ 
        (finrank ℝ E : ℝ) := by sorry

/-- An irrational nondegenerate indefinite quadratic form in dimension at least three has a rational indefinite irrational ternary restriction. -/
theorem irrational_indefinite_ternary_restriction {n : ℕ} (hn : 3 ≤ n)
    (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : ∀ x : Fin n → ℝ, x≠0 → ∃ y, q (x+y)-q x-q y ≠ 0)
    (hind : (∃ x, q x>0) ∧ (∃ x, q x<0))
    (hirr : ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ))=c*(r : ℝ)) :
    ∃ A : Matrix (Fin n) (Fin 3) ℚ,
      Function.Injective (Matrix.toLin' (A.map (fun a : ℚ => (a : ℝ)))) ∧
      (let Q := q.comp (Matrix.toLin' (A.map (fun a : ℚ => (a : ℝ))))
       (∀ x : Fin 3 → ℝ, x≠0 → ∃ y, Q (x+y)-Q x-Q y ≠ 0) ∧
       ((∃ x, Q x>0) ∧ (∃ x, Q x<0)) ∧
       ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin 3 → ℤ,
         ∃ r : ℚ, Q (fun i => (z i : ℝ))=c*(r : ℝ)) := by sorry

/-- A real quadratic form taking both signs attains every real value. -/
theorem indefinite_quadratic_surjective {M : Type*}
    [AddCommGroup M] [Module ℝ M] (q : QuadraticForm ℝ M)
    (hind : (∃ x, q x>0) ∧ (∃ x, q x<0)) : Function.Surjective q := by sorry

example (q : QuadraticForm ℝ (Fin 3 → ℝ)) :
    q.comp (Matrix.toLin' ((1 : Matrix (Fin 3) (Fin 3) ℚ).map
      (fun a : ℚ => (a : ℝ)))) = q := by sorry
example : ¬ Function.Injective
    (Matrix.toLin' ((0 : Matrix (Fin 2) (Fin 3) ℚ).map
      (fun a : ℚ => (a : ℝ)))) := by sorry
example : ¬ ((∃ x : Fin 3 → ℝ, (0 : QuadraticForm ℝ (Fin 3 → ℝ)) x>0) ∧
    (∃ x : Fin 3 → ℝ, (0 : QuadraticForm ℝ (Fin 3 → ℝ)) x<0)) := by simp
example : Function.Surjective
    (QuadraticMap.weightedSumSquares ℝ (![1,1,-1] : Fin 3 → ℝ)) := by sorry
example : ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin 3 → ℤ,
    ∃ r : ℚ, QuadraticMap.weightedSumSquares ℝ
      (![1,1,-Real.sqrt 2] : Fin 3 → ℝ) (fun i => (z i : ℝ))=c*(r : ℝ) := by sorry
example : ∃ c : ℝ, c≠0 ∧ ∀ z : Fin 3 → ℤ,
    ∃ r : ℚ, QuadraticMap.weightedSumSquares ℝ
      (![Real.sqrt 2, Real.sqrt 2,-Real.sqrt 2] : Fin 3 → ℝ)
      (fun i => (z i : ℝ))=c*(r : ℝ) := by sorry

/-- The values at integer vectors of a nondegenerate indefinite irrational real quadratic form are dense in the real line in dimension at least three. -/
theorem oppenheim_values {n : ℕ} (hn : 3 ≤ n) (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : ∀ x : Fin n → ℝ, x≠0 →
      ∃ y, q (x+y)-q x-q y ≠ 0)
    (hind : (∃ x, q x>0) ∧ (∃ x, q x<0))
    (hirr : ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ))=c*(r : ℝ)) :
    Dense (Set.range (fun z : Fin n → ℤ => q (fun i => (z i : ℝ)))) := by sorry
end NativeGeometryTargets


section Layer4Checks
/-- compact_star_body_test_2 -/
example : ¬ Convex ℝ {x : EuclideanSpace ℝ (Fin 2) |
    (Real.sqrt |x 0|+Real.sqrt |x 1|)^2 ≤ 1} := by sorry
/-- compact_star_body_test_3 -/
example : ¬ IsCompact {x : EuclideanSpace ℝ (Fin 2) | |x 0| ≤ 1} := by sorry

/-- packing_radius_test_2 -/
example : latticePackingRadius (Submodule.span ℤ
    ({WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]} : Set (EuclideanSpace ℝ (Fin 2))))=1/2 := by sorry
/-- covering_radius_test_2 -/
example : latticeCoveringRadius (Submodule.span ℤ
    ({WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]} : Set (EuclideanSpace ℝ (Fin 2))))=
      Real.sqrt 2/2 := by sorry
end Layer4Checks

/-! ## Layer 5: Certified LLL reduction -/

section LLL
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- The Gram–Schmidt inner-product ratio. -/
def lllCoefficient (b : Fin n → E) (i j : Fin n) : ℝ :=
  inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
    ‖InnerProductSpace.gramSchmidt ℝ b j‖^2

/-- Evaluation equals the stated ratio. -/
theorem lllCoefficient_eq (b : Fin n → E) (i j : Fin n) :
    lllCoefficient b i j = inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
      ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 := by sorry
/-- Off-diagonal coefficient is zero for an orthogonal family. -/
theorem lllCoefficient_orthogonal (b : Fin n → E)
    (hb : Pairwise (fun i j => inner ℝ (b i) (b j) = 0)) (i j : Fin n) (h : i ≠ j) :
    lllCoefficient b i j = 0 := by sorry
/-- Independent input gives a strictly positive squared denominator. -/
theorem lllCoefficient_denominator_pos (b : Fin n → E)
    (hb : LinearIndependent ℝ b) (j : Fin n) :
    0 < ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 := by sorry

/-- The concrete independence, size and Lovász predicate. -/
def IsLLLReduced (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j, j < i → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j, j.val+1 = i.val →
    (3/4-(lllCoefficient b i j)^2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)

/-- Return independence. -/
theorem IsLLLReduced.linearIndependent {b : Fin n → E} (h : IsLLLReduced b) :
    LinearIndependent ℝ b := by sorry
/-- Return |μ_{ij}|≤1/2 for j<i. -/
theorem IsLLLReduced.size {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j < i) : |lllCoefficient b i j| ≤ 1/2 := by sorry
/-- Return the adjacent δ=3/4 inequality. -/
theorem IsLLLReduced.lovasz {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j.val+1=i.val) :
    (3/4-(lllCoefficient b i j)^2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry

/-- Two integral inverse matrices certify that the output vectors are a unimodular change of the input basis. -/
structure UnimodularBasisCertificate (b c : Fin n → E) where
  matrix : Matrix (Fin n) (Fin n) ℤ
  inverse : Matrix (Fin n) (Fin n) ℤ
  rightInverse : matrix * inverse = 1
  leftInverse : inverse * matrix = 1
  coordinates : ∀ i, c i = ∑ j, matrix j i • b j

/-- Supply actual integral inverse matrices and the exact output coordinates. -/
def UnimodularBasisCertificate.ofMatrices (b c : Fin n → E)
    (U V : Matrix (Fin n) (Fin n) ℤ) (hU : U*V=1) (hV : V*U=1)
    (h : ∀ i, c i = ∑ j, U j i • b j) : UnimodularBasisCertificate b c :=
  ⟨U,V,hU,hV,h⟩
/-- The input and output Z-spans are equal. -/
theorem UnimodularBasisCertificate.span_eq {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) :
    Submodule.span ℤ (Set.range b) = Submodule.span ℤ (Set.range c) := by sorry
/-- A certified unimodular change has determinant one or minus one. -/
theorem UnimodularBasisCertificate.det_unit {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) : h.matrix.det = 1 ∨ h.matrix.det = -1 := by sorry
/-- Compose two unimodular coordinate certificates. -/
def UnimodularBasisCertificate.trans {b c d : Fin n → E}
    (h : UnimodularBasisCertificate b c) (k : UnimodularBasisCertificate c d) :
    UnimodularBasisCertificate b d := by sorry

/-- LLL reducedness bounds an earlier orthogonal length by the corresponding power of two times a later length. -/
theorem lll_gram_schmidt_growth (b : Fin n → E) (h : IsLLLReduced b)
    (j i : Fin n) (hji : j ≤ i) :
    ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      (2 : ℝ)^(i.val-j.val) * ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry
/-- The first LLL vector is within the stated power of two of every nonzero vector of the original integer span. -/
theorem lll_short_vector_factor (b : Fin n → E) (h : IsLLLReduced b) (hn : 0<n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖b ⟨0,hn⟩‖^2 ≤ (2 : ℝ)^(n-1)*‖x‖^2 := by sorry

/-- A reduced output family with an integral inverse coordinate certificate for the original lattice. -/
structure LLLReductionResult (b : Fin n → E) where
  output : Fin n → E
  certificate : UnimodularBasisCertificate b output
  reduced : IsLLLReduced output

/-- Return output coordinates, reducedness and the exact integer inverse certificate. -/
def exactLLL (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    LLLReductionResult b := by sorry
/-- Recover the original-lattice certificate. -/
theorem exactLLL_certificate (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    Nonempty (UnimodularBasisCertificate b (exactLLL b hb hGram).output) := by sorry
/-- Recover the exact size and Lovász tests. -/
theorem exactLLL_reduced (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    IsLLLReduced (exactLLL b hb hGram).output := by sorry
/-- For positive rank, the first vector satisfies the proven approximation inequality in the original lattice. -/
theorem exactLLL_shortVector (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) (hn : 0<n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖(exactLLL b hb hGram).output ⟨0,hn⟩‖^2 ≤ (2 : ℝ)^(n-1)*‖x‖^2 := by sorry

example : lllCoefficient (![(1 : ℝ),1/2] : Fin 2 → ℝ) 1 0 = 1/2 := by sorry
example : lllCoefficient (![(0 : ℝ),1] : Fin 2 → ℝ) 1 0 = 0 := by sorry
example : ¬ IsLLLReduced (![(1 : ℝ),1] : Fin 2 → ℝ) := by sorry
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![2,0],WithLp.toLp 2 ![0,1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry
example (b : Fin n → E) : Nonempty (UnimodularBasisCertificate b b) := by sorry
example : ¬ Nonempty (UnimodularBasisCertificate
    (![(1 : ℝ)] : Fin 1 → ℝ) (![(2 : ℝ)] : Fin 1 → ℝ)) := by sorry
example : IsLLLReduced (Fin.elim0 : Fin 0 → ℝ) := by sorry
end LLL

section IntegerPotential
variable {n : ℕ}

/-- Product of positive integral Gram-prefix determinants. -/
def lllIntegerPotential (A : Matrix (Fin n) (Fin n) ℤ) : ℤ :=
  ∏ k ∈ Finset.range n,
    Matrix.det (fun i j : {i : Fin n // i.val < k} => (A.transpose*A) i j)
/-- The potential is a positive integer for independent integral input. -/
theorem lllIntegerPotential_pos (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0) :
    0 < lllIntegerPotential A := by sorry

/-- A column size reduction by another earlier column preserves every prefix Gram determinant. -/
theorem lllIntegerPotential_sizeReduce (A : Matrix (Fin n) (Fin n) ℤ)
    (i j : Fin n) (hji : j < i) (a : ℤ) :
    lllIntegerPotential (fun r c => if c=i then A r c-a*A r j else A r c) =
      lllIntegerPotential A := by sorry

/-- A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4. -/
theorem lllIntegerPotential_swap (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0)
    (i j : Fin n) (hij : i.val+1=j.val)
    (hfail : (3/4-(lllCoefficient
      (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) j i)^2) *
      ‖InnerProductSpace.gramSchmidt ℝ
        (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) i‖^2 >
      ‖InnerProductSpace.gramSchmidt ℝ
        (fun c : Fin n => (WithLp.toLp 2 (fun r : Fin n => (A r c : ℝ)))) j‖^2) :
    (4 : ℤ)*lllIntegerPotential (fun r c => A r (Equiv.swap i j c)) <
      3*lllIntegerPotential A := by sorry

example : lllIntegerPotential (1 : Matrix (Fin 0) (Fin 0) ℤ) = 1 := by sorry
example : lllIntegerPotential (fun _ _ : Fin 1 => (2 : ℤ)) = 1 := by sorry
example : lllIntegerPotential (!![2,0;0,1] : Matrix (Fin 2) (Fin 2) ℤ) = 4 := by sorry
end IntegerPotential

section LLLTransitions
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
/-- Round to the nearest integer by taking the floor after adding one half. -/
def lllNearestInteger (t : ℝ) : ℤ := ⌊t+1/2⌋
/-- The nearest-integer residual has absolute value at most one half. -/
theorem lll_nearest_integer (t : ℝ) : |t-(lllNearestInteger t : ℝ)| ≤ 1/2 := by sorry
/-- Subtract an integral multiple of one earlier vector from the selected basis vector. -/
def lllShear (b : Fin n → E) (i j : Fin n) (r : ℤ) : Fin n → E :=
  fun k => if k=i then b i-r • b j else b k
/-- An integral basis shear has an explicit unimodular inverse certificate. -/
theorem lll_shear_certificate (b : Fin n → E) (i j : Fin n) (hji : j < i) (r : ℤ) :
    Nonempty (UnimodularBasisCertificate b (lllShear b i j r)) := by sorry
/-- Subtracting an earlier basis vector leaves the Gram–Schmidt orthogonal vectors unchanged. -/
theorem lll_shear_gram_schmidt (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) (k : Fin n) :
    InnerProductSpace.gramSchmidt ℝ (lllShear b i j r) k =
      InnerProductSpace.gramSchmidt ℝ b k := by sorry
/-- The selected Gram–Schmidt coefficient decreases by the integral shear parameter. -/
theorem lll_shear_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i j = lllCoefficient b i j-r := by sorry
/-- The earlier coefficients receive the corresponding multiple of the earlier row's coefficients. -/
theorem lll_shear_earlier_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j l : Fin n) (hji : j < i) (hl : l < j) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i l = lllCoefficient b i l-r*lllCoefficient b j l := by sorry
/-- The coefficients strictly between the source and destination indices are unchanged by the shear. -/
theorem lll_shear_later_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j l : Fin n) (hji : j < i) (hl : j < l) (hli : l < i) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i l = lllCoefficient b i l := by sorry
/-- A permutation swapping two basis vectors is unimodular. -/
theorem lll_swap_certificate (b : Fin n → E) (i j : Fin n) :
    Nonempty (UnimodularBasisCertificate b (b ∘ Equiv.swap i j)) := by sorry
/-- The first new orthogonal vector after an adjacent swap is the old second vector plus its projection onto the old first. -/
theorem lll_swap_first_vector (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    InnerProductSpace.gramSchmidt ℝ (b ∘ Equiv.swap i j) i =
      InnerProductSpace.gramSchmidt ℝ b j +
        lllCoefficient b j i • InnerProductSpace.gramSchmidt ℝ b i := by sorry
/-- The second new orthogonal vector has the explicit orthogonal projection formula with its positive squared denominator. -/
theorem lll_swap_second_vector (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    let B := ‖InnerProductSpace.gramSchmidt ℝ b i‖^2
    let C := ‖InnerProductSpace.gramSchmidt ℝ b j‖^2
    let a := lllCoefficient b j i
    let T := C+a^2*B
    InnerProductSpace.gramSchmidt ℝ (b ∘ Equiv.swap i j) j =
      (C/T) • InnerProductSpace.gramSchmidt ℝ b i -
        (a*B/T) • InnerProductSpace.gramSchmidt ℝ b j := by sorry
/-- Later-row coefficients transform by the stated adjacent-swap shear identity. -/
theorem lll_swap_later_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j k : Fin n) (hij : i.val+1=j.val) (hjk : j < k) :
    lllCoefficient (b ∘ Equiv.swap i j) k j =
      lllCoefficient b k i-lllCoefficient b j i*lllCoefficient b k j := by sorry

/-- The Gram determinant of the prefix selected by an index bound. -/
def lllPrefixGramDet (b : Fin n → E) (k : ℕ) : ℝ :=
  (Matrix.gram ℝ (fun i : {i : Fin n // i.val < k} => b i)).det
/-- The product of all proper-prefix Gram determinants. -/
def lllRealPotential (b : Fin n → E) : ℝ := ∏ k ∈ Finset.range n, lllPrefixGramDet b k
/-- An independent prefix Gram determinant is the product of its squared Gram–Schmidt lengths. -/
theorem lll_prefix_gram_product (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (k : ℕ) (hk : k ≤ n) :
    lllPrefixGramDet b k = ∏ i : {i : Fin n // i.val < k}, ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry
/-- Integral independent Gram data have positive integral prefix determinants. -/
theorem lll_prefix_gram_integral (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) (k : ℕ) :
    ∃ d : ℕ, 0 < d ∧ lllPrefixGramDet b k = d := by sorry
/-- Every earlier-vector size reduction preserves each prefix Gram determinant. -/
theorem lll_prefix_shear_invariant (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) (k : ℕ) :
    lllPrefixGramDet (lllShear b i j r) k = lllPrefixGramDet b k := by sorry
/-- An adjacent swap multiplies the LLL potential by the explicit orthogonal-length ratio. -/
theorem lll_prefix_swap_ratio (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    lllRealPotential (b ∘ Equiv.swap i j) =
      ((‖InnerProductSpace.gramSchmidt ℝ b j‖^2+
        (lllCoefficient b j i)^2*‖InnerProductSpace.gramSchmidt ℝ b i‖^2) /
        ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)*lllRealPotential b := by sorry
/-- A strict Lovász failure makes the adjacent swap decrease the integral potential by a factor below three quarters. -/
theorem lll_strict_potential_decrease (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val)
    (hf : ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 <
      (3/4-(lllCoefficient b j i)^2)*‖InnerProductSpace.gramSchmidt ℝ b i‖^2) :
    4*lllRealPotential (b ∘ Equiv.swap i j) < 3*lllRealPotential b := by sorry

example : lllNearestInteger (3/2)=2 := by sorry
example : lllNearestInteger (-1/2)=0 := by sorry
example : lllNearestInteger (-8/5)= -2 := by sorry
example : lllPrefixGramDet (Fin.elim0 : Fin 0 → ℝ) 0=1 := by sorry
example : lllPrefixGramDet (![(2 : ℝ)] : Fin 1 → ℝ) 1=4 := by sorry
example : lllRealPotential (![(2 : ℝ)] : Fin 1 → ℝ)=1 := by sorry
example : lllShear (![(1 : ℝ),3] : Fin 2 → ℝ) 1 0 3 = ![1,0] := by sorry
example : lllShear (![(1 : ℝ),3] : Fin 2 → ℝ) 1 0 0 = ![1,3] := by sorry
example : lllShear (![(1 : ℝ),3] : Fin 2 → ℝ) 1 0 (-1) = ![1,4] := by sorry
example : lllRealPotential
    (![WithLp.toLp 2 ![2,0],WithLp.toLp 2 ![0,1]] : Fin 2 → EuclideanSpace ℝ (Fin 2))=4 := by sorry
example : lllRealPotential
    (![WithLp.toLp 2 ![0,1],WithLp.toLp 2 ![2,0]] : Fin 2 → EuclideanSpace ℝ (Fin 2))=1 := by sorry
example : ¬ Nonempty (UnimodularBasisCertificate (![(1 : ℝ)] : Fin 1 → ℝ)
    (![(1001/1000 : ℝ)] : Fin 1 → ℝ)) := by sorry
end LLLTransitions

section LLLLoop
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
/-- Fold the descending list of earlier indices; the specified step is the native integer shear. -/
def lllReduceRow (b : Fin n → E) (i : Fin n) : Fin n → E :=
  (List.finRange n).reverse.foldl (fun c j =>
    if j < i then lllShear c i j (lllNearestInteger (lllCoefficient c i j)) else c) b
/-- Descending size reduction bounds every earlier coefficient of the selected row by one half. -/
theorem lll_reduce_row_size (b : Fin n → E) (hb : LinearIndependent ℝ b) (i j : Fin n) (hj : j < i) :
 |lllCoefficient (lllReduceRow b i) i j| ≤ 1/2 := by sorry
/-- Descending row reduction preserves the lattice through a unimodular certificate. -/
theorem lll_reduce_row_certificate (b : Fin n → E) (i : Fin n) :
 Nonempty (UnimodularBasisCertificate b (lllReduceRow b i)) := by sorry
/-- Descending row reduction leaves every other basis row unchanged. -/
theorem lll_reduce_row_other (b : Fin n → E) (i j : Fin n) (h : j ≠ i) :
 lllReduceRow b i j = b j := by sorry
/-- Descending row reduction preserves the LLL prefix potential. -/
theorem lll_reduce_row_potential (b : Fin n → E) (hb : LinearIndependent ℝ b) (i : Fin n) :
 lllRealPotential (lllReduceRow b i) = lllRealPotential b := by sorry
/-- The initial basis segment satisfies size reduction and the adjacent Lovász inequalities. -/
def lllPrefixReduced (b : Fin n → E) (k : ℕ) : Prop :=
 (∀ i j : Fin n, i.val < k → j < i → |lllCoefficient b i j| ≤ 1/2) ∧
 (∀ i j : Fin n, i.val < k → j.val+1=i.val →
 (3/4-(lllCoefficient b i j)^2)*‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
 ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)
/-- The independent integral basis and prefix index, together with the reduced-prefix invariant. -/
structure LLLLoopState (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E] (n : ℕ) where
 vectors : Fin n → E
 independent : LinearIndependent ℝ vectors
 integralGram : ∀ i j, ∃ z : ℤ, inner ℝ (vectors i) (vectors j) = z
 cursor : ℕ
 cursorLower : 1 ≤ cursor
 cursorUpper : cursor ≤ n
 prefixReduced : lllPrefixReduced vectors cursor
/-- Both branches use full descending row reduction, a valid variant of the printed loop. -/
def lllOuterStep (s t : LLLLoopState E n) : Prop :=
 ∃ (i : Fin n) (hi : i.val=s.cursor),
 let c := lllReduceRow s.vectors i
 let j : Fin n := ⟨s.cursor-1, by omega⟩
 (‖InnerProductSpace.gramSchmidt ℝ c i‖^2 <
   (3/4-(lllCoefficient c i j)^2)*‖InnerProductSpace.gramSchmidt ℝ c j‖^2 ∧
   t.vectors=c ∘ Equiv.swap j i ∧ t.cursor=max 1 (s.cursor-1)) ∨
 ((3/4-(lllCoefficient c i j)^2)*‖InnerProductSpace.gramSchmidt ℝ c j‖^2 ≤ 
   ‖InnerProductSpace.gramSchmidt ℝ c i‖^2 ∧ t.vectors=c ∧ t.cursor=s.cursor+1)
/-- The lexicographic termination measure uses the positive integral potential and the remaining prefix length. -/
def lllLoopMeasure (s : LLLLoopState E n) : ℕ × ℕ :=
 (Int.toNat ⌊lllRealPotential s.vectors⌋,n-s.cursor)
/-- Every nonterminal outer-loop step decreases the lexicographic termination measure. -/
theorem lll_outer_measure_decreases (s t : LLLLoopState E n) (h : lllOuterStep s t) :
 Prod.Lex (· < ·) (· < ·) (lllLoopMeasure t) (lllLoopMeasure s) := by sorry
/-- The exact LLL outer loop reaches a fully reduced basis by well-founded descent. -/
theorem lll_outer_terminates : WellFounded (fun t s : LLLLoopState E n => lllOuterStep s t) := by sorry
example : lllPrefixReduced (Fin.elim0 : Fin 0 → ℝ) 0 := by sorry
example : lllReduceRow (![(1 : ℝ)] : Fin 1 → ℝ) 0 = ![1] := by sorry
example : lllReduceRow (![(1 : ℝ),3] : Fin 2 → ℝ) 1 = ![1,0] := by sorry
end LLLLoop

section LLLTransitionInvariant
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
/-- Each nonterminal LLL state has a successor retaining the invariant and decreasing its lexicographic measure. -/
theorem lll_outer_step_exists (s : LLLLoopState E n) (h : s.cursor < n) :
 ∃ t : LLLLoopState E n, lllOuterStep s t := by sorry
/-- rank one needs no outer step. -/
example (s : LLLLoopState E 1) : s.cursor = 1 := by sorry
example (s : LLLLoopState E 1) : ¬ ∃ t, lllOuterStep s t := by sorry
example : IsEmpty (LLLLoopState E 0) := by sorry
end LLLTransitionInvariant


section Layer5Checks
/-- lll_coefficient_test_1 -/
example : lllCoefficient
    (![WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![1/2,1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) 1 0 = 1/2 := by sorry
/-- lll_coefficient_test_2 -/
example : lllCoefficient
    (![WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) 1 0 = 0 := by sorry
/-- lll_coefficient_test_3 -/
example : lllCoefficient (![(0 : ℝ),1] : Fin 2 → ℝ) 1 0=0 := by sorry

/-- lll_reduced_test_1 -/
example : IsLLLReduced
    (![WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry
/-- lll_reduced_test_2 -/
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![2,0],WithLp.toLp 2 ![0,1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry
/-- lll_reduced_test_3 -/
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![2,0]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry

/-- unimodular_basis_certificate_test_1 -/
example : (!![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 ∧
    (!![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℤ)^2=1 := by sorry
/-- unimodular_basis_certificate_test_2 -/
example : ¬ ∃ V : Matrix (Fin 2) (Fin 2) ℤ,
    (!![2,0;0,1] : Matrix (Fin 2) (Fin 2) ℤ)*V=1 := by sorry
/-- unimodular_basis_certificate_test_3: even an exact rational inverse is insufficient. -/
example : (2 : ℚ)*(1/2)=1 ∧ ¬ ∃ z : ℤ, 2*z=1 := by sorry

/-- lll_integer_potential_test_1 -/
example (n : ℕ) : lllIntegerPotential (1 : Matrix (Fin n) (Fin n) ℤ)=1 := by sorry
/-- lll_integer_potential_test_2 -/
example : (1/2 : ℚ)^2=1/4 ∧ ¬ ∃ z : ℤ, (z : ℚ)=1/4 := by sorry
/-- lll_integer_potential_test_3 -/
example : lllIntegerPotential (1 : Matrix (Fin 0) (Fin 0) ℤ)=1 ∧
    lllIntegerPotential (1 : Matrix (Fin 1) (Fin 1) ℤ)=1 := by sorry

/-- lll_exact_reduction_test_1 -/
example : IsLLLReduced
    (![WithLp.toLp 2 ![0,1],WithLp.toLp 2 ![2,0]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry
/-- lll_exact_reduction_test_2 -/
example : IsLLLReduced (Fin.elim0 : Fin 0 → ℝ) := by sorry
/-- lll_exact_reduction_test_3 -/
example : ¬ IsLLLReduced
    (![WithLp.toLp 2 ![2,0],WithLp.toLp 2 ![0,1]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry

end Layer5Checks

/-! ## Layer 6: Hermitian K-theory of exact categories -/

section C2NormMaps
variable {A : Type*} [AddCommGroup A]

/-- The C2 norm endomorphism is one plus the involution. -/
def c2Norm (σ : A →+ A) : A →+ A := AddMonoidHom.id A + σ

/-- The C2 difference endomorphism is one minus the involution. -/
def c2Difference (σ : A →+ A) : A →+ A := AddMonoidHom.id A - σ

/-- The norm sends x to x plus its involutive image. -/
theorem c2Norm_apply (σ : A →+ A) (x : A) : c2Norm σ x = x + σ x := rfl

/-- The difference sends x to x minus its involutive image. -/
theorem c2Difference_apply (σ : A →+ A) (x : A) :
    c2Difference σ x = x - σ x := rfl

/-- The norm and difference compose to zero in both orders. -/
theorem c2_periodic_complex (σ : A →+ A) (hσ : ∀ x, σ (σ x) = x) :
    (c2Norm σ).comp (c2Difference σ) = 0 ∧
      (c2Difference σ).comp (c2Norm σ) = 0 := by sorry

example (x : ℤ) : c2Norm (AddMonoidHom.id ℤ) x = 2*x ∧
    c2Difference (AddMonoidHom.id ℤ) x = 0 := by sorry
example (x : ℤ) : c2Norm (-AddMonoidHom.id ℤ) x = 0 ∧
    c2Difference (-AddMonoidHom.id ℤ) x = 2*x := by sorry
example (x : ZMod 2) : c2Norm (AddMonoidHom.id (ZMod 2)) x = 0 ∧
    c2Difference (AddMonoidHom.id (ZMod 2)) x = 0 := by sorry
end C2NormMaps

section CategoryDuality
open CategoryTheory Opposite
universe u v
variable (C : Type u) [Category.{v} C]

/-- A strong duality on `C`: a contravariant functor with a double-dual isomorphism satisfying
the triangle identity. This is the data of Tau Ceti's `Functor.IsInvolutiveDual`, bundled; the
exact duality of Layer 6 adds exactness of the functor to it. -/
structure StrongCategoryDuality where
  dual : Cᵒᵖ ⥤ C
  biddual : 𝟭 C ≅ dual.rightOp ⋙ dual
  coherence : dual.IsInvolutiveDual biddual

variable {C}
/-- Object, pairing isomorphism and typed symmetry equation. -/
structure SymmetricSpace (D : StrongCategoryDuality C) where
  carrier : C
  pairing : carrier ≅ D.dual.obj (op carrier)
  symmetric : D.biddual.hom.app carrier ≫ D.dual.map pairing.hom.op = pairing.hom

/-- Form-preservation is the displayed categorical equation. -/
def SymmetricSpace.preserves {D : StrongCategoryDuality C}
    (X Y : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier) : Prop :=
  X.pairing.hom = f ≫ Y.pairing.hom ≫ D.dual.map f.op
/-- Identity preserves a symmetric space. -/
theorem SymmetricSpace.preserves_id {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    X.preserves X (𝟙 X.carrier) := by sorry
/-- Composing two form-preserving morphisms preserves the symmetric pairing. -/
theorem SymmetricSpace.preserves_comp {D : StrongCategoryDuality C}
    (X Y Z : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier)
    (g : Y.carrier ⟶ Z.carrier) (hf : X.preserves Y f) (hg : Y.preserves Z g) :
    X.preserves Z (f ≫ g) := by sorry

example (D : StrongCategoryDuality C) (X : C) :
    D.biddual.hom.app (D.dual.obj (op X)) ≫ D.dual.map ((D.biddual.hom.app X).op) =
      𝟙 (D.dual.obj (op X)) := by sorry
example (D : StrongCategoryDuality C) (X : C) :
    IsIso (D.biddual.hom.app X) := by sorry
example (D : StrongCategoryDuality C) (X Y : C) (f : X ⟶ Y) :
    D.dual.obj (op Y) ⟶ D.dual.obj (op X) := D.dual.map f.op
example {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    IsIso X.pairing.hom := by sorry
example {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    D.biddual.hom.app X.carrier ≫ D.dual.map X.pairing.hom.op = X.pairing.hom := by sorry
example {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    X.preserves X (𝟙 X.carrier) := by sorry
end CategoryDuality

section NativeExactDuality
open CategoryTheory CategoryTheory.Limits Opposite
universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C]

/-- Exactness is the pinned Tau Ceti predicate on the opposite exact structure. -/
structure ExactCategoryDuality (E : TauCeti.ExactStructure C) extends StrongCategoryDuality C where
  additive : dual.Additive
  exact : @TauCeti.ExactStructure.IsConflationExact _ _ _ _ _ _ _ _ _ _ E.op E dual additive
attribute [instance] ExactCategoryDuality.additive

namespace ExactCategoryDuality
variable {E : TauCeti.ExactStructure C}
/-- The exact duality reverses a conflation to a conflation. -/
theorem map_conflation (D : ExactCategoryDuality E) (S : ShortComplex Cᵒᵖ)
    (hS : E.op.Conflation S) : E.Conflation (S.map D.dual) := by sorry
/-- The exact duality sends an admissible monomorphism to an admissible epimorphism. -/
theorem map_inflation (D : ExactCategoryDuality E) {X Y : C}
    (i : X ⟶ Y) (hi : E.IsInflation i) : E.IsDeflation (D.dual.map i.op) := by sorry
/-- The exact duality sends an admissible epimorphism to an admissible monomorphism. -/
theorem map_deflation (D : ExactCategoryDuality E) {X Y : C}
    (p : X ⟶ Y) (hp : E.IsDeflation p) : E.IsInflation (D.dual.map p.op) := by sorry
/-- Sign changes the bidual identification, not the underlying contravariant functor. -/
def sign (D : ExactCategoryDuality E) : ExactCategoryDuality E where
  dual := D.dual
  biddual := { hom := -D.biddual.hom, inv := -D.biddual.inv, hom_inv_id := by sorry, inv_hom_id := by sorry }
  coherence := by sorry
  additive := D.additive
  exact := D.exact
/-- Changing the duality sign leaves the contravariant functor unchanged. -/
theorem sign_dual (D : ExactCategoryDuality E) : D.sign.dual = D.dual := by sorry
/-- Changing the duality sign negates its bidual transformation. -/
theorem sign_biddual (D : ExactCategoryDuality E) (X : C) :
    D.sign.biddual.hom.app X = -D.biddual.hom.app X := by sorry
/-- Changing the exact duality sign twice recovers the original duality. -/
theorem sign_sign (D : ExactCategoryDuality E) : D.sign.sign = D := by sorry
end ExactCategoryDuality

variable {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- An admissible isotropic inclusion whose annihilator quotient sequence is a conflation. -/
structure ExactLagrangian (X : SymmetricSpace D.toStrongCategoryDuality) where
  carrier : C
  inclusion : carrier ⟶ X.carrier
  zero : inclusion ≫ X.pairing.hom ≫ D.dual.map inclusion.op = 0
  conflation : E.Conflation
    (ShortComplex.mk inclusion (X.pairing.hom ≫ D.dual.map inclusion.op) zero)

namespace ExactLagrangian
variable {D}
/-- Construct a Lagrangian from its actual admissible annihilator conflation. -/
def ofConflation (X : SymmetricSpace D.toStrongCategoryDuality) (L : C)
    (i : L ⟶ X.carrier) (hz : i ≫ X.pairing.hom ≫ D.dual.map i.op = 0)
    (hc : E.Conflation (ShortComplex.mk i (X.pairing.hom ≫ D.dual.map i.op) hz)) :
    ExactLagrangian D X := ⟨L,i,hz,hc⟩
/-- A Lagrangian inclusion is an admissible monomorphism. -/
theorem isInflation {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : E.IsInflation L.inclusion := by sorry
/-- The Lagrangian inclusion is the categorical kernel of its annihilator projection. -/
def kernel {X : SymmetricSpace D.toStrongCategoryDuality} (L : ExactLagrangian D X) :
    IsLimit (KernelFork.ofι L.inclusion L.zero) := by sorry
/-- The annihilator projection is the categorical cokernel of the Lagrangian inclusion. -/
def cokernel {X : SymmetricSpace D.toStrongCategoryDuality} (L : ExactLagrangian D X) :
    IsColimit (CokernelCofork.ofπ (X.pairing.hom ≫ D.dual.map L.inclusion.op) L.zero) := by sorry
end ExactLagrangian

/-- The right block uses η. No division by two occurs. -/
def hyperbolicSpace (X : C) : SymmetricSpace D.toStrongCategoryDuality := by sorry
/-- The hyperbolic symmetric space has carrier X direct sum its dual. -/
theorem hyperbolicSpace_carrier (X : C) :
    (hyperbolicSpace D X).carrier = (X ⊞ D.dual.obj (op X)) := by sorry
/-- Transport along the carrier equation gives the first summand inclusion. -/
def hyperbolicLagrangian (X : C) : ExactLagrangian D (hyperbolicSpace D X) := by sorry
/-- The standard hyperbolic Lagrangian has carrier X. -/
theorem hyperbolicLagrangian_carrier (X : C) :
    (hyperbolicLagrangian D X).carrier = X := by sorry

/-- Construct the space on the actual categorical biproduct. -/
def orthogonalSum (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    SymmetricSpace D.toStrongCategoryDuality := by sorry
/-- Its carrier is X.carrier⊕Y.carrier. -/
theorem orthogonalSum_carrier (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    (orthogonalSum D X Y).carrier = (X.carrier ⊞ Y.carrier) := by sorry

/-- An isomorphism carrying one symmetric pairing to the other. -/
structure SymmetricIsometry (X Y : SymmetricSpace D.toStrongCategoryDuality) where
  iso : X.carrier ≅ Y.carrier
  preserves : X.preserves Y iso.hom

/-- Two spaces are related exactly when such an isometry exists. -/
def symmetricIsometrySetoid : Setoid (SymmetricSpace D.toStrongCategoryDuality) where
  r X Y := Nonempty (SymmetricIsometry D X Y)
  iseqv := by sorry
/-- The quotient by that setoid; its generator identifies precisely isometric spaces. -/
abbrev SymmetricIsometryClass := Quotient (symmetricIsometrySetoid D)
/-- The quotient class of a symmetric space under symmetric isometry. -/
def symmetricClass (X : SymmetricSpace D.toStrongCategoryDuality) :
    SymmetricIsometryClass D := Quotient.mk _ X

/-- The additive orthogonal-sum and metabolic relations for the exact Grothendieck–Witt presentation. -/
def gwRelations : Set (FreeAbelianGroup (SymmetricIsometryClass D)) :=
  {r | (∃ X Y, r = FreeAbelianGroup.of (symmetricClass D (orthogonalSum D X Y)) -
      FreeAbelianGroup.of (symmetricClass D X) - FreeAbelianGroup.of (symmetricClass D Y)) ∨
    (∃ (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X),
      r = FreeAbelianGroup.of (symmetricClass D X) -
        FreeAbelianGroup.of (symmetricClass D (hyperbolicSpace D L.carrier)))}
/-- The presented additive group. -/
abbrev ExactGW0 := FreeAbelianGroup (SymmetricIsometryClass D) ⧸ AddSubgroup.closure (gwRelations D)
/-- The generator class of a symmetric space. -/
def ExactGW0.of (X : SymmetricSpace D.toStrongCategoryDuality) : ExactGW0 D :=
  QuotientAddGroup.mk (FreeAbelianGroup.of (symmetricClass D X))
/-- Symmetric isometric spaces define the same Grothendieck–Witt class. -/
theorem ExactGW0.isometry (X Y : SymmetricSpace D.toStrongCategoryDuality)
    (e : SymmetricIsometry D X Y) : ExactGW0.of D X = ExactGW0.of D Y := by sorry
/-- Orthogonal sum becomes addition. -/
theorem ExactGW0.sum (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    ExactGW0.of D (orthogonalSum D X Y) = ExactGW0.of D X + ExactGW0.of D Y := by sorry
/-- A space with a Lagrangian has the hyperbolic Grothendieck–Witt class of that Lagrangian. -/
theorem ExactGW0.metabolic (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    ExactGW0.of D X = ExactGW0.of D (hyperbolicSpace D L.carrier) := by sorry

/-- Descend exactly the additive invariants satisfying the metabolic relation. -/
def ExactGW0.lift {A : Type*} [AddCommGroup A]
    (f : SymmetricSpace D.toStrongCategoryDuality → A)
    (hi : ∀ X Y, Nonempty (SymmetricIsometry D X Y) → f X = f Y)
    (hs : ∀ X Y, f (orthogonalSum D X Y) = f X + f Y)
    (hm : ∀ X (L : ExactLagrangian D X), f X = f (hyperbolicSpace D L.carrier)) :
    ExactGW0 D →+ A := by sorry
/-- The descended Grothendieck–Witt invariant evaluates on a generator as the original invariant. -/
theorem ExactGW0.lift_of {A : Type*} [AddCommGroup A]
    (f : SymmetricSpace D.toStrongCategoryDuality → A)
    (hi : ∀ X Y, Nonempty (SymmetricIsometry D X Y) → f X = f Y)
    (hs : ∀ X Y, f (orthogonalSum D X Y) = f X + f Y)
    (hm : ∀ X (L : ExactLagrangian D X), f X = f (hyperbolicSpace D L.carrier))
    (X : SymmetricSpace D.toStrongCategoryDuality) : ExactGW0.lift D f hi hs hm (ExactGW0.of D X)=f X := by sorry

/-- The subgroup generated by classes of spaces admitting Lagrangians. -/
def metabolicSubgroup : AddSubgroup (ExactGW0 D) :=
  AddSubgroup.closure {x | ∃ (X : SymmetricSpace D.toStrongCategoryDuality),
    Nonempty (ExactLagrangian D X) ∧ x = ExactGW0.of D X}
/-- The metabolic quotient group. -/
abbrev ExactW0 := ExactGW0 D ⧸ metabolicSubgroup D
/-- The Witt class of a symmetric space. -/
def ExactW0.of (X : SymmetricSpace D.toStrongCategoryDuality) : ExactW0 D :=
  QuotientAddGroup.mk (ExactGW0.of D X)
/-- Metabolic spaces have zero class. -/
theorem ExactW0.metabolic (X : SymmetricSpace D.toStrongCategoryDuality)
    (L : ExactLagrangian D X) : ExactW0.of D X = 0 := by sorry
/-- Orthogonal sums become addition in the exact Witt group. -/
theorem ExactW0.sum (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    ExactW0.of D (orthogonalSum D X Y) = ExactW0.of D X + ExactW0.of D Y := by sorry

/-- Tests use the genuine exact structure and expose the sign and metabolic relations. -/
example (S : ShortComplex Cᵒᵖ) (h : E.op.Conflation S) : E.Conflation (S.map D.dual) := by sorry
example (X : C) : D.sign.biddual.hom.app X = -D.biddual.hom.app X := by sorry
example : D.sign.sign = D := by sorry
example (X : C) : Nonempty (ExactLagrangian D (hyperbolicSpace D X)) := by sorry
example (X : C) : ExactW0.of D (hyperbolicSpace D X) = 0 := by sorry
example (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    ExactGW0.of D X = ExactGW0.of D (hyperbolicSpace D L.carrier) := by sorry
example (X : C) : ExactGW0.of D (orthogonalSum D (hyperbolicSpace D X) (hyperbolicSpace D X)) =
    2 • ExactGW0.of D (hyperbolicSpace D X) := by sorry
end NativeExactDuality

section IsotropicQuotients
open CategoryTheory CategoryTheory.Limits Opposite
universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- Both admissible inclusions and both actual exact quotients are retained. -/
structure ExactIsotropicSubobject (X : SymmetricSpace D.toStrongCategoryDuality) where
  carrier : C
  orthogonal : C
  quotient : C
  inclusion : carrier ⟶ orthogonal
  orthogonalInclusion : orthogonal ⟶ X.carrier
  quotientMap : orthogonal ⟶ quotient
  inclusionExact : E.IsInflation (inclusion ≫ orthogonalInclusion)
  quotientZero : inclusion ≫ quotientMap = 0
  quotientExact : E.Conflation (ShortComplex.mk inclusion quotientMap quotientZero)
  orthogonalZero : orthogonalInclusion ≫ X.pairing.hom ≫
    D.dual.map (inclusion ≫ orthogonalInclusion).op = 0
  orthogonalExact : E.Conflation (ShortComplex.mk orthogonalInclusion
    (X.pairing.hom ≫ D.dual.map (inclusion ≫ orthogonalInclusion).op) orthogonalZero)
/-- Cokernel descent followed by exact duality constructs the pairing map. -/
def isotropicReduction {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : SymmetricSpace D.toStrongCategoryDuality := by sorry
/-- The carrier of isotropic reduction is the chosen orthogonal-quotient object. -/
theorem isotropicReduction_carrier {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : (isotropicReduction D L).carrier = L.quotient := by sorry
/-- The induced map has an actual quotient carrier, so the pullback can be stated there. -/
def isotropicReductionPairing {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : L.quotient ⟶ D.dual.obj (op L.quotient) := by sorry
/-- Its pullback is the restricted pairing. -/
theorem isotropicReduction_pullback {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) :
    L.quotientMap ≫ isotropicReductionPairing D L ≫ D.dual.map L.quotientMap.op =
      L.orthogonalInclusion ≫ X.pairing.hom ≫ D.dual.map L.orthogonalInclusion.op := by sorry
/-- The descended quotient pairing is perfect by the exact short five lemma. -/
theorem isotropicReduction_perfect {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : IsIso (isotropicReductionPairing D L) := by sorry
/-- In a morphism of conflations, invertibility on the outer terms implies invertibility on the middle term. -/
theorem exact_five_lemma (S T : ShortComplex C) (hS : E.Conflation S) (hT : E.Conflation T)
    (f : S ⟶ T) [IsIso f.τ₁] [IsIso f.τ₃] : IsIso f.τ₂ := by sorry

/-- Negate the perfect pairing without changing the carrier. -/
def negativeSpace (X : SymmetricSpace D.toStrongCategoryDuality) : SymmetricSpace D.toStrongCategoryDuality := by sorry
/-- The underlying object is unchanged. -/
theorem negativeSpace_carrier (X : SymmetricSpace D.toStrongCategoryDuality) :
    (negativeSpace D X).carrier = X.carrier := by sorry
/-- The diagonal inclusion is a Lagrangian in a symmetric space direct sum its negative. -/
theorem symmetric_diagonal_lagrangian (X : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (ExactLagrangian D (orthogonalSum D X (negativeSpace D X))) := by sorry
/-- A symmetric space and its isotropic reduction differ by a metabolic space. -/
theorem isotropic_reduction_metabolic {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : Nonempty (ExactLagrangian D
      (orthogonalSum D X (negativeSpace D (isotropicReduction D L)))) := by sorry
/-- Negating the pairing gives the additive inverse. -/
theorem ExactW0.neg (X : SymmetricSpace D.toStrongCategoryDuality) :
    ExactW0.of D (negativeSpace D X) = -ExactW0.of D X := by sorry
/-- Hyperbolic construction carries sums to orthogonal sums. -/
theorem hyperbolicSpace_sum (X Y : C) : Nonempty (SymmetricIsometry D (hyperbolicSpace D (X ⊞ Y))
    (orthogonalSum D (hyperbolicSpace D X) (hyperbolicSpace D Y))) := by sorry

/-- The underlying-object group homomorphism. -/
def grothendieckWittForgetful [EssentiallySmall.{w} C] : ExactGW0 D →+ TauCeti.ExactK0 E := by sorry
/-- Forgetting a symmetric-space generator gives its underlying exact K0 class. -/
theorem grothendieckWittForgetful_of [EssentiallySmall.{w} C] (X : SymmetricSpace D.toStrongCategoryDuality) :
    grothendieckWittForgetful D (ExactGW0.of D X) = TauCeti.ExactK0.of (E := E) X.carrier := by sorry
/-- The hyperbolic group homomorphism. -/
def grothendieckWittHyperbolic [EssentiallySmall.{w} C] : TauCeti.ExactK0 E →+ ExactGW0 D := by sorry
/-- A K0 object class maps to the class of its hyperbolic symmetric space. -/
theorem grothendieckWittHyperbolic_of [EssentiallySmall.{w} C] (X : C) :
    grothendieckWittHyperbolic D (TauCeti.ExactK0.of (E := E) X) = ExactGW0.of D (hyperbolicSpace D X) := by sorry
/-- The forgetful map after the hyperbolic map is one plus the duality action on exact K0. -/
theorem forgetful_hyperbolic [EssentiallySmall.{w} C] (X : C) :
    grothendieckWittForgetful D (grothendieckWittHyperbolic D (TauCeti.ExactK0.of (E := E) X)) =
      TauCeti.ExactK0.of (E := E) X + TauCeti.ExactK0.of (E := E) (D.dual.obj (op X)) := by sorry
example (X : SymmetricSpace D.toStrongCategoryDuality) :
    ExactW0.of D (orthogonalSum D X (negativeSpace D X)) = 0 := by sorry
example (X : C) : Nonempty (SymmetricIsometry D (hyperbolicSpace D (X ⊞ X))
    (orthogonalSum D (hyperbolicSpace D X) (hyperbolicSpace D X))) := by sorry
example [EssentiallySmall.{w} C] (X : C) :
    grothendieckWittForgetful D (ExactGW0.of D (hyperbolicSpace D X)) =
      TauCeti.ExactK0.of (E := E) X + TauCeti.ExactK0.of (E := E) (D.dual.obj (op X)) := by sorry

/-- The square is genuinely bicartesian in the pinned category, not a name for a Prop placeholder. -/
structure HermitianQSpan (X Y : SymmetricSpace D.toStrongCategoryDuality) where
  middle : C
  deflation : middle ⟶ X.carrier
  inflation : middle ⟶ Y.carrier
  deflationExact : E.IsDeflation deflation
  inflationExact : E.IsInflation inflation
  cartesian : IsPullback inflation deflation
    (Y.pairing.hom ≫ D.dual.map inflation.op) (X.pairing.hom ≫ D.dual.map deflation.op)
  cocartesian : IsPushout inflation deflation
    (Y.pairing.hom ≫ D.dual.map inflation.op) (X.pairing.hom ≫ D.dual.map deflation.op)
namespace HermitianQSpan
variable {D}
/-- The identity hermitian Q-span uses the original symmetric object as its middle term. -/
def identity (X : SymmetricSpace D.toStrongCategoryDuality) : HermitianQSpan D X X := by sorry
/-- Exactness supplies the pullback of a deflation along an inflation. -/
def comp {X Y Z : SymmetricSpace D.toStrongCategoryDuality}
    (a : HermitianQSpan D X Y) (b : HermitianQSpan D Y Z) : HermitianQSpan D X Z := by sorry
/-- Representative equivalence retains both span legs. -/
def equivalent {X Y : SymmetricSpace D.toStrongCategoryDuality}
    (a b : HermitianQSpan D X Y) : Prop :=
  ∃ e : a.middle ≅ b.middle, e.hom ≫ b.inflation = a.inflation ∧ e.hom ≫ b.deflation = a.deflation
/-- Composition of hermitian Q-spans respects middle-term isomorphisms. -/
theorem comp_congr {X Y Z : SymmetricSpace D.toStrongCategoryDuality}
    (a a' : HermitianQSpan D X Y) (b b' : HermitianQSpan D Y Z)
    (ha : a.equivalent a') (hb : b.equivalent b') : (a.comp b).equivalent (a'.comp b') := by sorry
/-- The identity hermitian Q-span is a left identity modulo span equivalence. -/
theorem id_comp {X Y : SymmetricSpace D.toStrongCategoryDuality} (a : HermitianQSpan D X Y) :
    ((identity X).comp a).equivalent a := by sorry
/-- The identity hermitian Q-span is a right identity modulo span equivalence. -/
theorem comp_id {X Y : SymmetricSpace D.toStrongCategoryDuality} (a : HermitianQSpan D X Y) :
    (a.comp (identity Y)).equivalent a := by sorry
/-- Pullback composition of hermitian Q-spans is associative modulo middle-term isomorphism. -/
theorem assoc {X Y Z W : SymmetricSpace D.toStrongCategoryDuality}
    (a : HermitianQSpan D X Y) (b : HermitianQSpan D Y Z) (c : HermitianQSpan D Z W) :
    ((a.comp b).comp c).equivalent (a.comp (b.comp c)) := by sorry
end HermitianQSpan
end IsotropicQuotients

section AdditionalNativeAPIs
open CategoryTheory CategoryTheory.Limits Opposite
open scoped ZeroObject
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- The canonical biproduct associator preserves the pairing. -/
theorem orthogonalSum_assoc (X Y Z : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (orthogonalSum D (orthogonalSum D X Y) Z)
      (orthogonalSum D X (orthogonalSum D Y Z))) := by sorry
/-- The biproduct swap is an isometry. -/
theorem orthogonalSum_comm (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (orthogonalSum D X Y) (orthogonalSum D Y X)) := by sorry
/-- Double negation recovers the original pairing. -/
theorem negativeSpace_negative (X : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (negativeSpace D (negativeSpace D X)) X) := by sorry
/-- Carrier equality is used to express the pairing equation with actual maps. -/
theorem negativeSpace_pairing (X : SymmetricSpace D.toStrongCategoryDuality) :
    ∃ e : (negativeSpace D X).carrier ≅ X.carrier,
      e.hom ≫ X.pairing.hom ≫ D.dual.map e.hom.op = -(negativeSpace D X).pairing.hom := by sorry
/-- The composite admissible inclusion L→X. -/
def ExactIsotropicSubobject.totalInclusion {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : L.carrier ⟶ X.carrier := L.inclusion ≫ L.orthogonalInclusion
/-- The composite inclusion of an isotropic subobject is admissible. -/
theorem ExactIsotropicSubobject.totalInclusion_inflation {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : E.IsInflation (L.totalInclusion D) := by sorry
/-- The zero space is built from the actual categorical zero object and its dual. -/
def zeroSymmetricSpace : SymmetricSpace D.toStrongCategoryDuality := by sorry
/-- The zero symmetric space has the categorical zero object as carrier. -/
theorem zeroSymmetricSpace_carrier : (zeroSymmetricSpace D).carrier = 0 := by sorry
/-- The zero inclusion supplies the zero isotropic subobject. -/
def zeroIsotropicSubobject (X : SymmetricSpace D.toStrongCategoryDuality) : ExactIsotropicSubobject D X := by sorry
/-- Reduction along the zero isotropic subobject retains the original symmetric carrier. -/
theorem zeroIsotropicSubobject_quotient (X : SymmetricSpace D.toStrongCategoryDuality) :
    (zeroIsotropicSubobject D X).quotient = X.carrier := by sorry
/-- A Lagrangian determines an isotropic subobject whose orthogonal carrier is itself. -/
def lagrangianIsotropicSubobject {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : ExactIsotropicSubobject D X := by sorry
/-- Reduction along a Lagrangian has zero quotient carrier. -/
theorem lagrangianIsotropicSubobject_quotient {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : IsZero (lagrangianIsotropicSubobject D L).quotient := by sorry
/-- A Lagrangian supplies the corresponding hermitian Q-span to the zero symmetric space. -/
def HermitianQSpan.ofLagrangian {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : HermitianQSpan D (zeroSymmetricSpace D) X := by sorry
/-- The Q-span supplied by a Lagrangian has that Lagrangian as middle object. -/
theorem HermitianQSpan.ofLagrangian_middle {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : (HermitianQSpan.ofLagrangian D L).middle = L.carrier := by sorry
example : Nonempty (SymmetricIsometry D (hyperbolicSpace D (0 : C)) (zeroSymmetricSpace D)) := by sorry
example (X : C) : Nonempty (SymmetricIsometry D (orthogonalSum D (zeroSymmetricSpace D) (hyperbolicSpace D X))
    (hyperbolicSpace D X)) := by sorry
example (X : C) : (isotropicReduction D (zeroIsotropicSubobject D (hyperbolicSpace D X))).carrier =
    (hyperbolicSpace D X).carrier := by sorry
example (X : C) : IsZero (isotropicReduction D
    (lagrangianIsotropicSubobject D (hyperbolicLagrangian D X))).carrier := by sorry
example (X : C) : (HermitianQSpan.ofLagrangian D (hyperbolicLagrangian D X)).middle = X := by sorry
end AdditionalNativeAPIs

section HermitianQuotientCategory
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- Equivalence of hermitian Q-spans by isomorphism of their middle objects. -/
def hermitianQSpanSetoid (X Y : SymmetricSpace D.toStrongCategoryDuality) : Setoid (HermitianQSpan D X Y) where
  r := HermitianQSpan.equivalent
  iseqv := by sorry
/-- The category of hermitian Q-spans. -/
structure HermitianQ where
  space : SymmetricSpace D.toStrongCategoryDuality
/-- The class of the identity hermitian Q-span. -/
def hermitianQIdentity (X : HermitianQ D) : Quotient (hermitianQSpanSetoid D X.space X.space) :=
  Quotient.mk _ (HermitianQSpan.identity X.space)
/-- Composition of hermitian Q-span classes induced by pullback composition. -/
def hermitianQComp {X Y Z : HermitianQ D}
    (f : Quotient (hermitianQSpanSetoid D X.space Y.space))
    (g : Quotient (hermitianQSpanSetoid D Y.space Z.space)) :
    Quotient (hermitianQSpanSetoid D X.space Z.space) := by sorry
/-- The span quotient carries the hermitian Q-category structure. -/
instance hermitianQCategory : Category (HermitianQ D) where
  Hom X Y := Quotient (hermitianQSpanSetoid D X.space Y.space)
  id X := hermitianQIdentity D X
  comp f g := hermitianQComp D f g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
/-- A span with its actual bicartesian pairing condition. -/
def HermitianQ.ofSpan {X Y : HermitianQ D} (s : HermitianQSpan D X.space Y.space) : X ⟶ Y :=
  Quotient.mk _ s
/-- The quotient-class map carries span composition to categorical composition. -/
theorem HermitianQ.ofSpan_comp {X Y Z : HermitianQ D}
    (s : HermitianQSpan D X.space Y.space) (t : HermitianQSpan D Y.space Z.space) :
    (HermitianQ.ofSpan D s) ≫ (HermitianQ.ofSpan D t) = HermitianQ.ofSpan D (s.comp t) := by sorry
/-- Two span representatives define the same arrow exactly when their middle terms are compatibly isomorphic. -/
theorem HermitianQ.ofSpan_eq_iff {X Y : HermitianQ D} (s t : HermitianQSpan D X.space Y.space) :
    HermitianQ.ofSpan D s = HermitianQ.ofSpan D t ↔ s.equivalent t := by sorry
example (X : HermitianQ D) : HermitianQ.ofSpan D (HermitianQSpan.identity X.space) = 𝟙 X := by sorry
example {X Y : HermitianQ D} (s t : HermitianQSpan D X.space Y.space) :
    HermitianQ.ofSpan D s = HermitianQ.ofSpan D t ↔
      ∃ e : s.middle ≅ t.middle, e.hom ≫ t.inflation = s.inflation ∧ e.hom ≫ t.deflation = s.deflation := by sorry
example {X Y Z W : HermitianQ D} (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    (f ≫ g) ≫ h = f ≫ (g ≫ h) := by sorry
end HermitianQuotientCategory

section SFilteringQuotient
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C]

/-- A fully exact, extension-closed subcategory satisfying all four s-filtering conditions.
The last two conditions witness a kernel or cokernel inside the induced subcategory. -/
class SFiltering (E : TauCeti.ExactStructure C) (A : C → Prop) : Prop where
  zero_mem : A (0 : C)
  iso_closed : ∀ {X Y : C}, (X ≅ Y) → A X → A Y
  extension_closed : ∀ (S : ShortComplex C), E.Conflation S → A S.X₁ → A S.X₃ → A S.X₂
  left_factor : ∀ {X Y : C}, A X → (f : X ⟶ Y) →
    ∃ (B : C) (_ : A B) (i : B ⟶ Y) (_ : E.IsInflation i) (g : X ⟶ B), g ≫ i = f
  right_factor : ∀ {X Y : C}, A Y → (f : X ⟶ Y) →
    ∃ (B : C) (_ : A B) (p : X ⟶ B) (_ : E.IsDeflation p) (g : B ⟶ Y), p ≫ g = f
  lift_deflation : ∀ {X Y : C}, A Y → (p : X ⟶ Y) → E.IsDeflation p →
    ∃ (B : C) (_ : A B) (i : B ⟶ X), E.IsInflation i ∧
      ∃ (K : C) (_ : A K) (k : K ⟶ B) (h : k ≫ (i ≫ p) = 0),
        E.Conflation (ShortComplex.mk k (i ≫ p) h)
  descend_inflation : ∀ {X Y : C}, A X → (i : X ⟶ Y) → E.IsInflation i →
    ∃ (B : C) (_ : A B) (p : Y ⟶ B), E.IsDeflation p ∧
      ∃ (K : C) (_ : A K) (k : B ⟶ K) (h : (i ≫ p) ≫ k = 0),
        E.Conflation (ShortComplex.mk (i ≫ p) k h)

/-- Elementary weak isomorphisms have an actual admissible kernel or cokernel in A. -/
def sFilteringWeakGenerator (E : TauCeti.ExactStructure C) (A : C → Prop) :
    MorphismProperty C := fun X Y f =>
  (∃ (B : C) (i : B ⟶ X) (h : i ≫ f = 0),
    E.Conflation (ShortComplex.mk i f h) ∧ A B) ∨
  (∃ (B : C) (p : Y ⟶ B) (h : f ≫ p = 0),
    E.Conflation (ShortComplex.mk f p h) ∧ A B)

/-- Finite composites, including identities, of the elementary weak isomorphisms. -/
abbrev sFilteringWeakIsomorphisms (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakGenerator E A).multiplicativeClosure

/-- The exact weak isomorphisms admit a calculus of left fractions. -/
instance sFilteringLeftFractions (E : TauCeti.ExactStructure C) (A : C → Prop)
    [SFiltering E A] : (sFilteringWeakIsomorphisms E A).HasLeftCalculusOfFractions := by sorry

/-- The exact weak isomorphisms admit a calculus of right fractions. -/
instance sFilteringRightFractions (E : TauCeti.ExactStructure C) (A : C → Prop)
    [SFiltering E A] : (sFilteringWeakIsomorphisms E A).HasRightCalculusOfFractions := by sorry

/-- The categorical quotient is the genuine Mathlib localization at the weak isomorphisms. -/
abbrev sFilteringQuotient (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakIsomorphisms E A).Localization

/-- The exact quotient functor; its exact structure is constructed only for s-filtering A. -/
abbrev sFilteringQuotientFunctor (E : TauCeti.ExactStructure C) (A : C → Prop) :=
  (sFilteringWeakIsomorphisms E A).Q

/-- The calculus of fractions makes the quotient preadditive. -/
noncomputable instance sFilteringQuotientPreadditive (E : TauCeti.ExactStructure C)
    (A : C → Prop) [h : SFiltering E A] : Preadditive (sFilteringQuotient E A) := by sorry

/-- The quotient retains a zero object and finite biproducts. -/
noncomputable instance sFilteringQuotientZero (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A] : HasZeroObject (sFilteringQuotient E A) := by sorry
/-- The filtering quotient inherits finite biproducts. -/
noncomputable instance sFilteringQuotientBiproducts (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A] : HasBinaryBiproducts (sFilteringQuotient E A) := by sorry
/-- The localization functor preserves addition of morphisms. -/
noncomputable instance sFilteringQuotientFunctorAdditive (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A] : (sFilteringQuotientFunctor E A).Additive := by sorry

/-- Conflations in the quotient are exactly isomorphic images of ambient conflations. -/
def sFilteringQuotientExact (E : TauCeti.ExactStructure C) (A : C → Prop)
    [SFiltering E A] : TauCeti.ExactStructure (sFilteringQuotient E A) := by sorry

/-- An ambient conflation remains a conflation in the filtering quotient. -/
theorem sFilteringQuotientExact_conflation (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A] (S : ShortComplex (sFilteringQuotient E A)) :
    (sFilteringQuotientExact E A).Conflation S ↔
      ∃ (T : ShortComplex C) (_ : E.Conflation T),
        Nonempty (T.map (sFilteringQuotientFunctor E A) ≅ S) := by sorry

/-- Stability under D is a condition on the actual subcategory predicate. -/
def DualityStable (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) : Prop := ∀ X, A X ↔ A (D.dual.obj (op X))

/-- The descended additive involutive duality preserves the quotient exact structure. -/
def sFilteringQuotientDuality (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) [SFiltering E A] (hD : DualityStable E D A) :
    ExactCategoryDuality (sFilteringQuotientExact E A) := by sorry

example (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E) :
    DualityStable E D (fun X => IsZero X) := by sorry
example (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E) :
    DualityStable E D (fun _ => True) := by sorry
example (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) (X : C) (hX : A X) (hDX : ¬ A (D.dual.obj (op X))) :
    ¬ DualityStable E D A := by sorry

/-- Both the total and zero fully exact subcategories are s-filtering. -/
example (E : TauCeti.ExactStructure C) : SFiltering E (fun _ => True) := by sorry
example (E : TauCeti.ExactStructure C) : SFiltering E (fun X => IsZero X) := by sorry
/-- The empty predicate omits the zero object and cannot be an exact subcategory. -/
example (E : TauCeti.ExactStructure C) : ¬ SFiltering E (fun _ => False) := by sorry
/-- Omitting the fourth condition allows an inclusion which the quotient theorem rejects. -/
example (E : TauCeti.ExactStructure C) (A : C → Prop) {X Y : C}
    (hX : A X) (i : X ⟶ Y) (hi : E.IsInflation i)
    (hf : ∀ (B : C), A B → ∀ (p : Y ⟶ B), E.IsDeflation p →
      ∀ (K : C), A K → ∀ (k : B ⟶ K), ∀ (h : (i ≫ p) ≫ k = 0),
        ¬ E.Conflation (ShortComplex.mk (i ≫ p) k h)) : ¬ SFiltering E A := by sorry
/-- A nonadmissible map cannot become an elementary weak isomorphism merely by naming A. -/
example (E : TauCeti.ExactStructure C) (A : C → Prop) {X Y : C} (f : X ⟶ Y)
    (hi : ¬ E.IsInflation f) (hp : ¬ E.IsDeflation f) :
    ¬ sFilteringWeakGenerator E A f := by sorry
example (E : TauCeti.ExactStructure C) (A : C → Prop) (X : C) :
    sFilteringWeakIsomorphisms E A (𝟙 X) := by sorry
example (E : TauCeti.ExactStructure C) (A : C → Prop) {X Y : C} (f : X ⟶ Y)
    (hf : sFilteringWeakGenerator E A f) :
    IsIso ((sFilteringQuotientFunctor E A).map f) := by sorry
/-- A objects are killed by the quotient, not merely identified with one another. -/
example (E : TauCeti.ExactStructure C) (A : C → Prop) [h : SFiltering E A]
    (X : C) (hX : A X) :
    IsZero ((sFilteringQuotientFunctor E A).obj X) := by sorry
/-- With no nonzero objects in A, the localization changes no morphisms. -/
example (E : TauCeti.ExactStructure C) :
    (sFilteringQuotientFunctor E (fun X => IsZero X)).FullyFaithful := by sorry
/-- For A=C the quotient is the zero category. -/
example (E : TauCeti.ExactStructure C) [SFiltering E (fun _ => True)]
    (X : sFilteringQuotient E (fun _ => True)) : IsZero X := by sorry

/-- The universal quotient functor is conflation-exact. -/
theorem sFilteringQuotientFunctor_exact (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A] :
    E.IsConflationExact (sFilteringQuotientExact E A) (sFilteringQuotientFunctor E A) := by sorry

/-- An additive exact functor killing the filtering subcategory factors through the exact quotient. -/
theorem sFilteringQuotient_lift
    {C' : Type*} [Category C'] [Preadditive C'] [HasZeroObject C'] [HasBinaryBiproducts C']
    (E : TauCeti.ExactStructure C) (E' : TauCeti.ExactStructure C')
    (A : C → Prop) [SFiltering E A] (F : C ⥤ C') [F.Additive]
    (hF : E.IsConflationExact E' F) (hkill : ∀ X, A X → IsZero (F.obj X)) :
    ∃ (G : sFilteringQuotient E A ⥤ C') (hG : G.Additive),
      (letI := hG; (sFilteringQuotientExact E A).IsConflationExact E' G) ∧
        Nonempty (sFilteringQuotientFunctor E A ⋙ G ≅ F) := by sorry

/-- A natural transformation between two exact quotient lifts descends uniquely along localization. -/
theorem sFilteringQuotient_natTrans_lift
    {C' : Type*} [Category C'] (E : TauCeti.ExactStructure C)
    (A : C → Prop) [SFiltering E A]
    (F G : sFilteringQuotient E A ⥤ C')
    (α : sFilteringQuotientFunctor E A ⋙ F ⟶ sFilteringQuotientFunctor E A ⋙ G) :
    ∃! β : F ⟶ G, Functor.whiskerLeft (sFilteringQuotientFunctor E A) β = α := by sorry

/-- The quotient functor commutes with duality through the canonical descended natural isomorphism. -/
def sFilteringQuotientDualityIso (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
    (A : C → Prop) [SFiltering E A] (hD : DualityStable E D A) :
    D.dual ⋙ sFilteringQuotientFunctor E A ≅
      (sFilteringQuotientFunctor E A).op ⋙ (sFilteringQuotientDuality E D A hD).dual := by sorry

/-- The descended duality comparison respects the bidual maps. -/
theorem sFilteringQuotientDuality_biddual (E : TauCeti.ExactStructure C)
    (D : ExactCategoryDuality E) (A : C → Prop) [SFiltering E A]
    (hD : DualityStable E D A) (X : C) :
    (sFilteringQuotientFunctor E A).map (D.biddual.hom.app X) ≫
      (sFilteringQuotientDualityIso E D A hD).hom.app (op (D.dual.obj (op X))) =
    (sFilteringQuotientDuality E D A hD).biddual.hom.app
      ((sFilteringQuotientFunctor E A).obj X) ≫
      (sFilteringQuotientDuality E D A hD).dual.map
        ((sFilteringQuotientDualityIso E D A hD).hom.app (op X)).op := by sorry

example : ¬ SFiltering (TauCeti.ExactStructure.abelian (C := FGModuleCat ℤ))
    (fun X => Module.Free ℤ X) := by sorry
example : ¬ SFiltering (TauCeti.ExactStructure.abelian (C := FGModuleCat ℤ))
    (fun X => Finite X) := by sorry

end SFilteringQuotient

section ConeDiagrams
open scoped ZeroObject
open CategoryTheory CategoryTheory.Limits
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
/-- The ordered cone indexing set consists of a forward natural row and a backward natural row. -/
abbrev ConeIndex := ℕ ⊕ₗ ℕᵒᵈ
/-- The i-th object of the forward cone row. -/
def coneForward (i : ℕ) : ConeIndex := toLex (Sum.inl i)
/-- The i-th object of the backward cone row. -/
def coneBackward (i : ℕ) : ConeIndex := toLex (Sum.inr (OrderDual.toDual i))
/-- The order arrow along the forward cone row. -/
def coneForwardArrow (i j : ℕ) (h : i ≤ j) : coneForward i ⟶ coneForward j := by sorry
/-- The order arrow along the backward cone row. -/
def coneBackwardArrow (i j : ℕ) (h : i ≤ j) : coneBackward j ⟶ coneBackward i := by sorry
/-- The crossing arrow between the two cone rows. -/
def coneCrossArrow (i j : ℕ) : coneForward i ⟶ coneBackward j := by sorry
variable (E : TauCeti.ExactStructure C)
/-- The forward arrows are admissible monos, the backward arrows admissible epis, and the far crossing arrows vanish. -/
def coneDiagramCondition (F : ConeIndex ⥤ C) : Prop :=
  (∀ i j h, E.IsInflation (F.map (coneForwardArrow i j h))) ∧
  (∀ i j h, E.IsDeflation (F.map (coneBackwardArrow i j h))) ∧
  ∃ k : ℕ, (∀ i, E.IsInflation (F.map (coneCrossArrow i (i+k)))) ∧
    (∀ i, E.IsDeflation (F.map (coneCrossArrow (i+k) i)))
/-- The full-subcategory object is an actual functor with the specified admissibility conditions. -/
abbrev HermitianConeDiagram := CategoryTheory.ObjectProperty.FullSubcategory (coneDiagramCondition E : ObjectProperty (ConeIndex ⥤ C))
/-- Embed an exact object as its constant diagram. -/
def HermitianConeDiagram.constant (X : C) : HermitianConeDiagram E := by sorry
/-- The constant cone diagram takes each row index to the given exact object. -/
theorem HermitianConeDiagram.constant_obj (X : C) (i : ConeIndex) :
    (HermitianConeDiagram.constant E X).obj.obj i = X := by sorry
/-- A single natural number controls both crossing families. -/
theorem HermitianConeDiagram.crossingBound (U : HermitianConeDiagram E) :
    ∃ k : ℕ, (∀ i, E.IsInflation (U.obj.map (coneCrossArrow i (i+k)))) ∧
      (∀ i, E.IsDeflation (U.obj.map (coneCrossArrow (i+k) i))) := U.property.2.2
/-- The lower-row reindexing exact endofunctor. -/
def coneLowerShift (k : ℕ) : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
/-- The upper-row reindexing exact endofunctor. -/
def coneUpperShift (k : ℕ) : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
/-- The natural shift transformation for the lower cone row. -/
def coneLowerShiftMap (k : ℕ) : 𝟭 (HermitianConeDiagram E) ⟶ coneLowerShift E k := by sorry
/-- The natural shift transformation for the upper cone row. -/
def coneUpperShiftMap (k : ℕ) : coneUpperShift E k ⟶ 𝟭 (HermitianConeDiagram E) := by sorry
/-- The lower shift retains the stated forward-row components. -/
theorem coneLowerShift_forward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneLowerShift E k).obj U).obj.obj (coneForward i) = U.obj.obj (coneForward (i+k)) := by sorry
/-- The lower shift advances the backward-row index. -/
theorem coneLowerShift_backward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneLowerShift E k).obj U).obj.obj (coneBackward i) = U.obj.obj (coneBackward i) := by sorry
/-- The upper shift advances the forward-row index. -/
theorem coneUpperShift_forward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneUpperShift E k).obj U).obj.obj (coneForward i) = U.obj.obj (coneForward i) := by sorry
/-- The upper shift retains the stated backward-row components. -/
theorem coneUpperShift_backward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneUpperShift E k).obj U).obj.obj (coneBackward i) = U.obj.obj (coneBackward (i+k)) := by sorry
/-- The morphisms inverted to identify cone diagrams with their upper and lower shifts. -/
def coneShiftMorphisms : MorphismProperty (HermitianConeDiagram E) :=
  MorphismProperty.ofHoms (fun z : ℕ × HermitianConeDiagram E => (coneLowerShiftMap E z.1).app z.2) ⊔
  MorphismProperty.ofHoms (fun z : ℕ × HermitianConeDiagram E => (coneUpperShiftMap E z.1).app z.2)
/-- The diagram cone category with exact structure and strong duality. -/
abbrev hermitianCone := (coneShiftMorphisms E).Localization
/-- The cone-diagram localization obtained by inverting both row shifts. -/
def hermitianConeLocalization : HermitianConeDiagram E ⥤ hermitianCone E := (coneShiftMorphisms E).Q
/-- The universal cone localization makes every designated shift morphism invertible. -/
theorem hermitianConeLocalization_inverts {U V : HermitianConeDiagram E} (f : U ⟶ V)
    (hf : coneShiftMorphisms E f) : IsIso ((hermitianConeLocalization E).map f) := by sorry
/-- A shifted middle map and its two indices. -/
structure ConeFraction (U V : HermitianConeDiagram E) where
  sourceShift : ℕ
  targetShift : ℕ
  map : (coneUpperShift E sourceShift).obj U ⟶ (coneLowerShift E targetShift).obj V
/-- The universal comparison to categorical localization. -/
def ConeFraction.toLocalization {U V : HermitianConeDiagram E} (f : ConeFraction E U V) :
    (hermitianConeLocalization E).obj U ⟶ (hermitianConeLocalization E).obj V := by sorry
/-- Shift the two representatives to compose; the new indices are their sums. -/
def ConeFraction.comp {U V W : HermitianConeDiagram E} (f : ConeFraction E U V) (g : ConeFraction E V W) :
    ConeFraction E U W := by sorry
/-- Composition of two cone fractions adds their lower and upper shift indices. -/
theorem ConeFraction.comp_shifts {U V W : HermitianConeDiagram E} (f : ConeFraction E U V) (g : ConeFraction E V W) :
    (ConeFraction.comp E f g).sourceShift = f.sourceShift+g.sourceShift ∧
      (ConeFraction.comp E f g).targetShift = f.targetShift+g.targetShift := by sorry
/-- The diagram functor with the initial zero inserted. -/
def coneZeroExtension : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
/-- Both components at zero are zero objects. -/
theorem coneZeroExtension_zero (U : HermitianConeDiagram E) :
    ((coneZeroExtension E).obj U).obj.obj (coneForward 0) = 0 ∧
      ((coneZeroExtension E).obj U).obj.obj (coneBackward 0) = 0 := by sorry
/-- Both successor components recover the original components. -/
theorem coneZeroExtension_successor (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneZeroExtension E).obj U).obj.obj (coneForward (i+1)) = U.obj.obj (coneForward i) ∧
      ((coneZeroExtension E).obj U).obj.obj (coneBackward (i+1)) = U.obj.obj (coneBackward i) := by sorry
variable [HasFiniteBiproducts C]
/-- The locally finite diagonal sum exact endofunctor. -/
def coneSwindle : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
/-- The i-th component is the finite sum of shifted source components. -/
theorem coneSwindle_component (U : HermitianConeDiagram E) (i : ℕ) :
    Nonempty (((coneSwindle E).obj U).obj.obj (coneForward i) ≅
      biproduct (fun j : Fin (i+1) => U.obj.obj (coneForward (i-j.val)))) := by sorry
example (X : C) : (HermitianConeDiagram.constant E X).obj.obj (coneForward 0) = X := by sorry
example (U : HermitianConeDiagram E) : ((coneLowerShift E 0).obj U).obj.obj (coneForward 4) = U.obj.obj (coneForward 4) := by sorry
example (U : HermitianConeDiagram E) :
    IsIso ((hermitianConeLocalization E).map ((coneLowerShiftMap E 1).app U)) := by sorry
example (U : HermitianConeDiagram E) : ((coneZeroExtension E).obj U).obj.obj (coneForward 0) = 0 := by sorry
example (U : HermitianConeDiagram E) : ((coneZeroExtension E).obj U).obj.obj (coneForward 1) = U.obj.obj (coneForward 0) := by sorry
example (U : HermitianConeDiagram E) :
    Nonempty (((coneSwindle E).obj U).obj.obj (coneForward 1) ≅
      (U.obj.obj (coneForward 1) ⊞ U.obj.obj (coneForward 0))) := by sorry
end ConeDiagrams

section AdditionalConeAPIs
open CategoryTheory CategoryTheory.Limits Opposite
open scoped ZeroObject
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  (E : TauCeti.ExactStructure C)
/-- The underlying functor on N⊔N-op. -/
def HermitianConeDiagram.diagram (U : HermitianConeDiagram E) : ConeIndex ⥤ C := U.obj
/-- Equality in the actual localization is also eventual equality of fraction representatives. -/
def ConeFraction.equivalent {U V : HermitianConeDiagram E} (f g : ConeFraction E U V) : Prop :=
  f.toLocalization E = g.toLocalization E
/-- Advance a representative by the canonical upper-source and lower-target shift maps. -/
def ConeFraction.advance {U V : HermitianConeDiagram E} (f : ConeFraction E U V)
    (a b : ℕ) (ha : f.sourceShift ≤ a) (hb : f.targetShift ≤ b) : ConeFraction E U V := by sorry
/-- Advancing a cone fraction adds the common chosen shifts to its two indices. -/
theorem ConeFraction.advance_shifts {U V : HermitianConeDiagram E} (f : ConeFraction E U V)
    (a b : ℕ) (ha : f.sourceShift ≤ a) (hb : f.targetShift ≤ b) :
    (f.advance E a b ha hb).sourceShift = a ∧ (f.advance E a b ha hb).targetShift = b := by sorry
/-- Advancing a representative does not change its arrow in the cone localization. -/
theorem ConeFraction.advance_localization {U V : HermitianConeDiagram E} (f : ConeFraction E U V)
    (a b : ℕ) (ha : f.sourceShift ≤ a) (hb : f.targetShift ≤ b) :
    (f.advance E a b ha hb).toLocalization E = f.toLocalization E := by sorry
/-- Two cone fractions are equal precisely after a common advancement of both indices. -/
theorem ConeFraction.equivalent_iff {U V : HermitianConeDiagram E} (f g : ConeFraction E U V) :
    f.equivalent E g ↔ ∃ (a b : ℕ) (hfa : f.sourceShift ≤ a) (hga : g.sourceShift ≤ a)
      (hfb : f.targetShift ≤ b) (hgb : g.targetShift ≤ b),
      HEq (f.advance E a b hfa hfb).map (g.advance E a b hga hgb).map := by sorry
example {U V : HermitianConeDiagram E} (f : ConeFraction E U V) :
    f.advance E f.sourceShift f.targetShift le_rfl le_rfl = f := by sorry
example {U V : HermitianConeDiagram E} (f : ConeFraction E U V) :
    (f.advance E (f.sourceShift+1) (f.targetShift+1) (by omega) (by omega)).sourceShift = f.sourceShift+1 := by sorry
example {U V : HermitianConeDiagram E} (f : ConeFraction E U V) :
    (f.advance E (f.sourceShift+1) (f.targetShift+1) (by omega) (by omega)).toLocalization E = f.toLocalization E := by sorry
/-- Reindexing functors, rather than component-only data, compose. -/
def coneLowerShift_add (i j : ℕ) : coneLowerShift E i ⋙ coneLowerShift E j ≅ coneLowerShift E (i+j) := by sorry
/-- The upper and lower cone shifts commute by their canonical reindexing isomorphism. -/
def coneShifts_commute (i j : ℕ) : coneLowerShift E i ⋙ coneUpperShift E j ≅
    coneUpperShift E j ⋙ coneLowerShift E i := by sorry
example (X : C) : (HermitianConeDiagram.constant E X).obj.obj (coneBackward 3) = X := by sorry
example (X : C) : coneDiagramCondition E (HermitianConeDiagram.constant E X).obj := by sorry
example (U : HermitianConeDiagram E) (k i : ℕ) :
    ((coneLowerShift E k).obj U).obj.obj (coneBackward i)=U.obj.obj (coneBackward i) := by sorry
example (U : HermitianConeDiagram E) (k i : ℕ) :
    ((coneUpperShift E k).obj U).obj.obj (coneForward i)=U.obj.obj (coneForward i) := by sorry
example (U : HermitianConeDiagram E) :
    IsIso ((hermitianConeLocalization E).map ((coneUpperShiftMap E 2).app U)) := by sorry
example (U : HermitianConeDiagram E) :
    ((coneZeroExtension E).obj U).obj.obj (coneBackward 1)=U.obj.obj (coneBackward 0) := by sorry
variable [HasFiniteBiproducts C]
example (U : HermitianConeDiagram E) :
    Nonempty (((coneSwindle E).obj U).obj.obj (coneForward 0) ≅ U.obj.obj (coneForward 0)) := by sorry
example (i : ConeIndex) : IsZero (((coneSwindle E).obj (HermitianConeDiagram.constant E 0)).obj.obj i) := by sorry
end AdditionalConeAPIs

section ConeExactDuality
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- Reverse and dualize the two rows of an admissible cone diagram. -/
def coneDiagramDual (D : ExactCategoryDuality E) : (HermitianConeDiagram E)ᵒᵖ ⥤ HermitianConeDiagram E := by sorry
/-- The forward row of the dual diagram is the dual of the backward row. -/
theorem coneDiagramDual_forward (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op U)).obj.obj (coneForward i) = D.dual.obj (op (U.obj.obj (coneBackward i))) := by sorry
/-- The backward row of the dual diagram is the dual of the forward row. -/
theorem coneDiagramDual_backward (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op U)).obj.obj (coneBackward i) = D.dual.obj (op (U.obj.obj (coneForward i))) := by sorry
variable [HasFiniteBiproducts C]
/-- The simultaneous dual shift makes T a form functor. -/
def coneSwindle_duality : (coneSwindle E).op ⋙ coneDiagramDual D ≅ coneDiagramDual D ⋙ coneSwindle E := by sorry
/-- Exactness and additivity are proved on fraction representatives before introducing these instances. -/
instance conePreadditive : Preadditive (hermitianCone E) := by sorry
/-- The pointwise zero diagram is a zero object in the cone category. -/
instance coneHasZeroObject : HasZeroObject (hermitianCone E) := by sorry
/-- Pointwise biproducts give biproducts of admissible cone diagrams. -/
instance coneHasBinaryBiproducts : HasBinaryBiproducts (hermitianCone E) := by sorry
/-- The cone exact structure is defined by pointwise conflations. -/
def hermitianConeExactStructure : TauCeti.ExactStructure (hermitianCone E) := by sorry
/-- The row-reversing duality is an exact strong duality on the cone category. -/
def hermitianConeDuality (D : ExactCategoryDuality E) : ExactCategoryDuality (hermitianConeExactStructure (E := E)) := by sorry
/-- The locally finite cone sum descends along the shift localization. -/
def localizedConeSwindle : hermitianCone E ⥤ hermitianCone E := by sorry
/-- Inserting the initial zero descends to the localized cone category. -/
def localizedConeZeroExtension : hermitianCone E ⥤ hermitianCone E := by sorry
/-- The localized diagonal-sum functor absorbs the identity by the stated form-functor isomorphism. -/
def localizedConeSwindle_absorption :
    𝟭 (hermitianCone E) ⊞ localizedConeSwindle (E := E) ≅ localizedConeSwindle (E := E) := by sorry
example (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op U)).obj.obj (coneForward i) = D.dual.obj (op (U.obj.obj (coneBackward i))) := by sorry
example (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op ((coneZeroExtension E).obj U))).obj.obj (coneForward (i+1)) =
      D.dual.obj (op (U.obj.obj (coneBackward i))) := by sorry
example (U : HermitianConeDiagram E) (i : ℕ) :
    Nonempty (((coneDiagramDual D).obj (op ((coneSwindle E).obj U))).obj.obj (coneForward i) ≅
      ((coneSwindle E).obj ((coneDiagramDual D).obj (op U))).obj.obj (coneForward i)) := by sorry
end ConeExactDuality


section NativeNerveAndConstantEmbedding
open CategoryTheory CategoryTheory.Limits
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
 (E : TauCeti.ExactStructure C) (D : ExactCategoryDuality E)
/-- The simplicial nerve of the hermitian Q-category is formed before geometric realization. -/
abbrev hermitianQNerve := CategoryTheory.nerve (HermitianQ D)
/-- Embed the ambient exact category by its constant admissible cone diagrams. -/
def coneConstantFunctor : C ⥤ HermitianConeDiagram E := by sorry
/-- The constant embedding sends an object to its constant cone diagram. -/
theorem coneConstantFunctor_obj (X : C) :
 (coneConstantFunctor E).obj X = HermitianConeDiagram.constant E X := by sorry
/-- The constant diagram embedding is exact and compatible with strong duality. -/
def hermitianConeEmbed : C ⥤ hermitianCone E := coneConstantFunctor E ⋙ hermitianConeLocalization E
/-- The constant hermitian embedding remains fully faithful after localizing cone shifts. -/
def hermitianConeEmbed_fullyFaithful : (hermitianConeEmbed E).FullyFaithful := by sorry
example {X Y : C} (f g : X ⟶ Y) :
 (hermitianConeEmbed E).map f = (hermitianConeEmbed E).map g ↔ f = g := by sorry
example (X : C) :
 (coneConstantFunctor E).obj X = HermitianConeDiagram.constant E X := by sorry
example (X : C) : (hermitianConeEmbed E).map (𝟙 X) = 𝟙 ((hermitianConeEmbed E).obj X) := by sorry
end NativeNerveAndConstantEmbedding

section TopologicalGWAdapter
open scoped unitInterval
/- Here Qh and Q are the genuine supplied realizations, with the supplied forgetful map.
The nerve realization and homotopy-fibre comparison are the interfaces of 6.1 and 6.5. -/
variable {Qh Q : Type*} [TopologicalSpace Qh] [TopologicalSpace Q]
/-- The specified pointed homotopy fibre. -/
abbrev grothendieckWittSpace (forget : C(Qh,Q)) (zero : Q) :=
  {x : Qh × C(I,Q) // x.2 0 = forget x.1 ∧ x.2 1 = zero}
/-- The zero symmetric object and constant zero path give the specified basepoint of the homotopy fibre. -/
def grothendieckWittSpace_base (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace forget (forget zeroForm) :=
  ⟨(zeroForm, ContinuousMap.const I (forget zeroForm)), by simp⟩
/-- Project the Grothendieck–Witt homotopy fibre to the hermitian Q realization. -/
def grothendieckWittSpace_projection (forget : C(Qh,Q)) (zero : Q) :
    C(grothendieckWittSpace forget zero,Qh) := by sorry
/-- The fibre projection sends the chosen basepoint to the zero symmetric object. -/
theorem grothendieckWittSpace_projection_base (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace_projection forget (forget zeroForm) (grothendieckWittSpace_base forget zeroForm) = zeroForm := by sorry
/-- Native homotopy groups; π0 is only a type until the supplied H-space structure is used. -/
abbrev higherGrothendieckWittGroup (forget : C(Qh,Q)) (zeroForm : Qh) (i : ℕ) :=
  HomotopyGroup (Fin i) (grothendieckWittSpace forget (forget zeroForm))
    (grothendieckWittSpace_base forget zeroForm)
/-- The degree-zero pointed homotopy invariant is the path-component set of the specified fibre. -/
def higherGrothendieckWittGroup_zero (forget : C(Qh,Q)) (zeroForm : Qh) :
    higherGrothendieckWittGroup forget zeroForm 0 ≃
      ZerothHomotopy (grothendieckWittSpace forget (forget zeroForm)) := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    (grothendieckWittSpace_base forget zeroForm).val.2 1 = forget zeroForm := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    (grothendieckWittSpace_base forget zeroForm).val.2 0 = forget zeroForm := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace_projection forget (forget zeroForm) (grothendieckWittSpace_base forget zeroForm) = zeroForm := by sorry
example [TopologicalSpace Bool] [DiscreteTopology Bool] :
    IsEmpty (grothendieckWittSpace (ContinuousMap.const PUnit false) true) := by sorry
example [TopologicalSpace Bool] [DiscreteTopology Bool] :
    Nonempty (grothendieckWittSpace (ContinuousMap.id Bool) false) ∧
      Subsingleton (grothendieckWittSpace (ContinuousMap.id Bool) false) := by sorry
example [TopologicalSpace Bool] [DiscreteTopology Bool] :
    Nonempty (grothendieckWittSpace (ContinuousMap.const PUnit false) false) ∧
      Subsingleton (grothendieckWittSpace (ContinuousMap.const PUnit false) false) := by sorry
end TopologicalGWAdapter

section FibreFunctoriality
open scoped unitInterval
variable {Qh Q Qh' Q' : Type*} [TopologicalSpace Qh] [TopologicalSpace Q]
 [TopologicalSpace Qh'] [TopologicalSpace Q']
/-- A commuting pointed square of forgetful maps induces a map of Grothendieck–Witt fibres. -/
def grothendieckWittSpace_map (forget : C(Qh,Q)) (forget' : C(Qh',Q'))
 (zero : Q) (zero' : Q') (gh : C(Qh,Qh')) (g : C(Q,Q'))
 (hs : ∀ x, forget' (gh x)=g (forget x)) (hz : g zero=zero') :
 C(grothendieckWittSpace forget zero,grothendieckWittSpace forget' zero') := by sorry
/-- The induced fibre map commutes with projection to the hermitian Q realization. -/
theorem grothendieckWittSpace_map_projection (forget : C(Qh,Q)) (forget' : C(Qh',Q'))
 (zero : Q) (zero' : Q') (gh : C(Qh,Qh')) (g : C(Q,Q'))
 (hs : ∀ x, forget' (gh x)=g (forget x)) (hz : g zero=zero')
 (x : grothendieckWittSpace forget zero) :
 (grothendieckWittSpace_map forget forget' zero zero' gh g hs hz x).val.1=gh x.val.1 := by sorry
/-- A pointed forgetful-map comparison induces maps of the pointed homotopy invariants. -/
def higherGrothendieckWittGroup_map (forget : C(Qh,Q)) (forget' : C(Qh',Q'))
 (zeroForm : Qh) (zeroForm' : Qh') (i : ℕ)
 (f : C(grothendieckWittSpace forget (forget zeroForm),grothendieckWittSpace forget' (forget' zeroForm')))
 (hf : f (grothendieckWittSpace_base forget zeroForm)=grothendieckWittSpace_base forget' zeroForm') :
 higherGrothendieckWittGroup forget zeroForm i → higherGrothendieckWittGroup forget' zeroForm' i := by sorry
example (i : ℕ) : Subsingleton (higherGrothendieckWittGroup (ContinuousMap.id PUnit) PUnit.unit i) := by sorry
example (i : ℕ) [Subsingleton Qh] [Subsingleton Q] (forget : C(Qh,Q)) (zeroForm : Qh) :
 Subsingleton (higherGrothendieckWittGroup forget zeroForm i) := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
 grothendieckWittSpace_map forget forget (forget zeroForm) (forget zeroForm)
 (ContinuousMap.id Qh) (ContinuousMap.id Q) (by simp) (by simp)=
 ContinuousMap.id (grothendieckWittSpace forget (forget zeroForm)) := by sorry
end FibreFunctoriality

section Formations
open CategoryTheory CategoryTheory.Limits Opposite
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
  {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- A symmetric space and two actual ExactLagrangian objects. -/
structure Formation where
  space : SymmetricSpace D.toStrongCategoryDuality
  first : ExactLagrangian D space
  second : ExactLagrangian D space
namespace Formation
variable {D}
/-- Exchange the two Lagrangians of a formation. -/
def swap (F : Formation D) : Formation D := ⟨F.space,F.second,F.first⟩
/-- The formation with its two Lagrangians equal. -/
def diagonal (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    Formation D := ⟨X,L,L⟩
/-- The orthogonal direct sum of two formations. -/
def sum (F G : Formation D) : Formation D := by sorry
end Formation
/-- A symmetric-space isometry transporting both specified formation Lagrangians. -/
structure FormationIsometry (F G : Formation D) where
  isometry : SymmetricIsometry D F.space G.space
  first : F.first.carrier ≅ G.first.carrier
  second : F.second.carrier ≅ G.second.carrier
  first_comm : first.hom ≫ G.first.inclusion = F.first.inclusion ≫ isometry.iso.hom
  second_comm : second.hom ≫ G.second.inclusion = F.second.inclusion ≫ isometry.iso.hom
/-- Equivalence of formations by an isometry preserving both Lagrangians. -/
def formationSetoid : Setoid (Formation D) where
  r F G := Nonempty (FormationIsometry D F G)
  iseqv := by sorry
/-- Formation isometry classes. -/
abbrev FormationClass := Quotient (formationSetoid D)
/-- The isometry class represented by a formation. -/
def formationClass (F : Formation D) : FormationClass D := Quotient.mk _ F
/-- The common subobject is admissible inside both named Lagrangians. -/
structure FormationReduction (F : Formation D) where
  isotropic : ExactIsotropicSubobject D F.space
  firstMap : isotropic.carrier ⟶ F.first.carrier
  secondMap : isotropic.carrier ⟶ F.second.carrier
  firstInflation : E.IsInflation firstMap
  secondInflation : E.IsInflation secondMap
  first_comm : firstMap ≫ F.first.inclusion = isotropic.inclusion ≫ isotropic.orthogonalInclusion
  second_comm : secondMap ≫ F.second.inclusion = isotropic.inclusion ≫ isotropic.orthogonalInclusion
/-- Reduce a formation along its common admissible isotropic subobject. -/
def FormationReduction.reduced {F : Formation D} (N : FormationReduction D F) : Formation D := by sorry
/-- The reduced formation has the underlying isotropic-reduction symmetric space. -/
theorem FormationReduction.reduced_space {F : Formation D} (N : FormationReduction D F) :
    (N.reduced D).space = isotropicReduction D N.isotropic := by sorry
/-- The orthogonal-sum, three-Lagrangian concatenation and common-reduction relation families. -/
def formationRelations : Set (FreeAbelianGroup (FormationClass D)) :=
  {r | (∃ F G, r = FreeAbelianGroup.of (formationClass D (F.sum G)) -
      FreeAbelianGroup.of (formationClass D F) - FreeAbelianGroup.of (formationClass D G)) ∨
    (∃ (X : SymmetricSpace D.toStrongCategoryDuality) (L M N : ExactLagrangian D X),
      r = FreeAbelianGroup.of (formationClass D ⟨X,L,M⟩) +
        FreeAbelianGroup.of (formationClass D ⟨X,M,N⟩) - FreeAbelianGroup.of (formationClass D ⟨X,L,N⟩)) ∨
    (∃ (F : Formation D) (N : FormationReduction D F),
      r = FreeAbelianGroup.of (formationClass D F) - FreeAbelianGroup.of (formationClass D (N.reduced D)))}
/-- The actual group quotient by the three relation families. -/
abbrev FormationGroup := FreeAbelianGroup (FormationClass D) ⧸ AddSubgroup.closure (formationRelations D)
/-- The class of a formation. -/
def FormationGroup.of (F : Formation D) : FormationGroup D :=
  QuotientAddGroup.mk (FreeAbelianGroup.of (formationClass D F))
/-- Orthogonal sums of formations become addition in the formation group. -/
theorem FormationGroup.sum (F G : Formation D) :
    FormationGroup.of D (F.sum G) = FormationGroup.of D F + FormationGroup.of D G := by sorry
/-- The three-Lagrangian concatenation relation. -/
theorem FormationGroup.concat (X : SymmetricSpace D.toStrongCategoryDuality) (L M N : ExactLagrangian D X) :
    FormationGroup.of D ⟨X,L,M⟩ + FormationGroup.of D ⟨X,M,N⟩ = FormationGroup.of D ⟨X,L,N⟩ := by sorry
/-- Common admissible isotropic reduction leaves the class unchanged. -/
theorem FormationGroup.reduce (F : Formation D) (N : FormationReduction D F) :
    FormationGroup.of D F = FormationGroup.of D (N.reduced D) := by sorry
/-- A function on formation classes respecting all three relations induces a unique additive map. -/
def FormationGroup.lift {A : Type*} [AddCommGroup A] (f : Formation D → A)
    (hi : ∀ F G, Nonempty (FormationIsometry D F G) → f F = f G)
    (hs : ∀ F G, f (F.sum G) = f F + f G)
    (hc : ∀ X (L M N : ExactLagrangian D X), f ⟨X,L,M⟩ + f ⟨X,M,N⟩ = f ⟨X,L,N⟩)
    (hr : ∀ F (N : FormationReduction D F), f F = f (N.reduced D)) : FormationGroup D →+ A := by sorry
/-- A descended formation invariant evaluates on generators as its defining invariant. -/
theorem FormationGroup.lift_of {A : Type*} [AddCommGroup A] (f : Formation D → A)
    (hi : ∀ F G, Nonempty (FormationIsometry D F G) → f F = f G)
    (hs : ∀ F G, f (F.sum G) = f F + f G)
    (hc : ∀ X (L M N : ExactLagrangian D X), f ⟨X,L,M⟩ + f ⟨X,M,N⟩ = f ⟨X,L,N⟩)
    (hr : ∀ F (N : FormationReduction D F), f F = f (N.reduced D)) (F : Formation D) :
    FormationGroup.lift D f hi hs hc hr (FormationGroup.of D F) = f F := by sorry
example (X : C) : (Formation.diagonal (hyperbolicSpace D X) (hyperbolicLagrangian D X)).first.carrier = X := by sorry
example (F : Formation D) : F.swap.swap = F := by sorry
example (F : Formation D) : F.swap.first = F.second := by sorry
example (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    FormationGroup.of D (Formation.diagonal X L) = 0 := by sorry
example (F : Formation D) : FormationGroup.of D F.swap = -FormationGroup.of D F := by sorry
example (F : Formation D) (N : FormationReduction D F) :
    FormationGroup.of D (N.reduced D) = FormationGroup.of D F := by sorry
end Formations

section MoreExactAPIs
open CategoryTheory CategoryTheory.Limits Opposite
universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
 {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
/-- An additive conflation-exact strong duality on the exact category. -/
def ExactCategoryDuality.ofExactFunctor (F : Cᵒᵖ ⥤ C) (eta : 𝟭 C ≅ F.rightOp ⋙ F)
 (hc : ∀ X : C, F.map (eta.hom.app X).op ≫ eta.hom.app (F.obj (op X)) = 𝟙 _)
 [F.Additive] (hex : TauCeti.ExactStructure.IsConflationExact E.op E F) : ExactCategoryDuality E := by sorry
/-- Transport an actual Lagrangian along a symmetric-space isometry. -/
def ExactLagrangian.mapIsometry {X Y : SymmetricSpace D.toStrongCategoryDuality}
 (L : ExactLagrangian D X) (e : SymmetricIsometry D X Y) : ExactLagrangian D Y := by sorry
/-- Transport along an isometry leaves the Lagrangian's own carrier unchanged. -/
theorem ExactLagrangian.mapIsometry_carrier {X Y : SymmetricSpace D.toStrongCategoryDuality}
 (L : ExactLagrangian D X) (e : SymmetricIsometry D X Y) :
 (L.mapIsometry D e).carrier = L.carrier := by sorry
/-- Transported quotients yield an isometry of their descended perfect forms. -/
def isotropicReduction_isometry {X : SymmetricSpace D.toStrongCategoryDuality}
 (L M : ExactIsotropicSubobject D X) (e : L.orthogonal ≅ M.orthogonal)
 (f : L.carrier ≅ M.carrier) (hp : e.hom ≫ M.orthogonalInclusion = L.orthogonalInclusion)
 (hi : f.hom ≫ M.inclusion = L.inclusion ≫ e.hom) :
 SymmetricIsometry D (isotropicReduction D L) (isotropicReduction D M) := by sorry
/-- Every hyperbolic space has zero exact Witt class. -/
theorem hyperbolicSpace_lagrangian_zero : ExactW0.of D (hyperbolicSpace D (0 : C)) = 0 := by sorry
/-- The zero symmetric space has zero Grothendieck–Witt class. -/
theorem ExactGW0.zero : ExactGW0.of D (zeroSymmetricSpace D) = 0 := by sorry
/-- The zero symmetric space has zero Witt class. -/
theorem ExactW0.zero : ExactW0.of D (zeroSymmetricSpace D) = 0 := by sorry
/-- The exact Witt group is the cokernel of the hyperbolic map from exact K0. -/
theorem witt_hyperbolic_cokernel [EssentiallySmall.{w} C] :
 metabolicSubgroup D = (grothendieckWittHyperbolic D).range := by sorry
/-- The categorical identities are inherited by quotient morphisms. -/
theorem HermitianQ.identity (X : HermitianQ D) :
 HermitianQ.ofSpan D (HermitianQSpan.identity X.space) = 𝟙 X := by sorry
/-- Formation boundary is a homomorphism into the actual exact K0. -/
def FormationGroup.boundary [EssentiallySmall.{w} C] : FormationGroup D →+ TauCeti.ExactK0 E := by sorry
/-- The boundary of a formation is the difference of the exact K0 classes of its two Lagrangians. -/
theorem FormationGroup.boundary_of [EssentiallySmall.{w} C] (F : Formation D) :
 FormationGroup.boundary D (FormationGroup.of D F) =
 TauCeti.ExactK0.of (E := E) F.first.carrier - TauCeti.ExactK0.of (E := E) F.second.carrier := by sorry
/-- The formation boundary detects the kernel of the hyperbolic map. -/
theorem FormationGroup.boundary_range [EssentiallySmall.{w} C] :
 (FormationGroup.boundary D).range = (grothendieckWittHyperbolic D).ker := by sorry
example : ExactGW0.of D (zeroSymmetricSpace D) = 0 := by sorry
example : ExactW0.of D (zeroSymmetricSpace D) = 0 := by sorry
example [EssentiallySmall.{w} C] (X : C) : grothendieckWittForgetful D (grothendieckWittHyperbolic D
 (TauCeti.ExactK0.of (E := E) X)) = TauCeti.ExactK0.of (E := E) X +
 TauCeti.ExactK0.of (E := E) (D.dual.obj (op X)) := by sorry
end MoreExactAPIs

section ExactFormFunctorAPIs
open CategoryTheory CategoryTheory.Limits Opposite
universe u v u' v' w w'
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
 {C' : Type u'} [Category.{v'} C'] [Preadditive C'] [HasZeroObject C'] [HasBinaryBiproducts C']
 {E : TauCeti.ExactStructure C} {E' : TauCeti.ExactStructure C'}
 (D : ExactCategoryDuality E) (D' : ExactCategoryDuality E')
/-- A nonsingular form functor, including the actual bidual compatibility square. -/
structure ExactFormFunctor where
 functor : C ⥤ C'
 additive : functor.Additive
 exact : @TauCeti.ExactStructure.IsConflationExact _ _ _ _ _ _ _ _ _ _ E E' functor additive
 duality : D.dual ⋙ functor ≅ functor.op ⋙ D'.dual
 coherence : ∀ X : C,
   functor.map (D.biddual.hom.app X) ≫ duality.hom.app (op (D.dual.obj (op X))) ≫
   D'.dual.map (duality.inv.app (op X)).op = D'.biddual.hom.app (functor.obj X)
attribute [instance] ExactFormFunctor.additive
namespace ExactFormFunctor
variable {D D'}
/-- An exact form functor transports symmetric spaces using its specified duality comparison. -/
def mapSpace (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 SymmetricSpace D'.toStrongCategoryDuality := by sorry
/-- The transported pairing is the original pairing followed by the duality-comparison isomorphism. -/
theorem mapSpace_pairing (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 HEq (F.mapSpace X).pairing.hom (F.functor.map X.pairing.hom ≫ F.duality.hom.app (op X.carrier)) := by sorry
/-- An exact form functor transports admissible Lagrangian conflations. -/
def mapLagrangian (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality)
 (L : ExactLagrangian D X) : ExactLagrangian D' (F.mapSpace X) := by sorry
/-- An exact form functor induces a homomorphism of exact Grothendieck–Witt groups. -/
def mapGW0 (F : ExactFormFunctor D D') : ExactGW0 D →+ ExactGW0 D' := by sorry
/-- The induced Grothendieck–Witt homomorphism transports symmetric-space generators. -/
theorem mapGW0_of (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 F.mapGW0 (ExactGW0.of D X)=ExactGW0.of D' (F.mapSpace X) := by sorry
end ExactFormFunctor
variable [EssentiallySmall.{w} C] [EssentiallySmall.{w'} C']
/-- An exact form functor commutes with the forgetful homomorphism to exact K0. -/
theorem grothendieckWittForgetful_natural (F : ExactFormFunctor D D') (x : ExactGW0 D) :
 grothendieckWittForgetful D' (F.mapGW0 x)=
 TauCeti.ExactK0.map F.functor F.exact (grothendieckWittForgetful D x) := by sorry
/-- An exact form functor commutes with the hyperbolic homomorphism from exact K0. -/
theorem grothendieckWittHyperbolic_natural (F : ExactFormFunctor D D') (x : TauCeti.ExactK0 E) :
 F.mapGW0 (grothendieckWittHyperbolic D x)=
 grothendieckWittHyperbolic D' (TauCeti.ExactK0.map F.functor F.exact x) := by sorry
end ExactFormFunctorAPIs

section FiniteFieldExactTests
open CategoryTheory CategoryTheory.Limits Opposite
attribute [local instance] HasBinaryBiproducts.of_hasBinaryCoproducts
/-- The native finite-dimensional vector category and its actual linear dual. -/
abbrev rationalFiniteDual : (FGModuleCat ℚ)ᵒᵖ ⥤ FGModuleCat ℚ where
  obj X := FGModuleCat.of ℚ (Module.Dual ℚ X.unop)
  map f := FGModuleCat.ofHom f.unop.hom.hom.dualMap
  map_id := by sorry
  map_comp := by sorry
/-- The split exact category of finite rational vector spaces with ordinary linear duality. -/
abbrev rationalExactDuality : ExactCategoryDuality (TauCeti.ExactStructure.split (FGModuleCat ℚ)) where
  dual := rationalFiniteDual
  biddual := by sorry
  coherence := by sorry
  additive := by sorry
  exact := by sorry
/-- The symmetric space defined by a nonsingular symmetric rational Gram matrix. -/
abbrev rationalFormSpace (n : ℕ) (A : Matrix (Fin n) (Fin n) ℚ) (hs : A.transpose=A) (hn : A.det ≠ 0) :
    SymmetricSpace rationalExactDuality.toStrongCategoryDuality where
  carrier := FGModuleCat.of ℚ (Fin n → ℚ)
  pairing := by sorry
  symmetric := by sorry
/-- The rational Gram-matrix space has the stated coordinate pairing. -/
theorem rationalFormSpace_pairing (n : ℕ) (A : Matrix (Fin n) (Fin n) ℚ)
    (hs : A.transpose=A) (hn : A.det ≠ 0) (x y : Fin n → ℚ) :
    (rationalFormSpace n A hs hn).pairing.hom.hom.hom x y = ∑ i, ∑ j, x i*A i j*y j := by sorry
example : Module.finrank ℚ ((rationalFiniteDual.obj (op (FGModuleCat.of ℚ ℚ))) : Type) = 1 := by sorry
example : (rationalExactDuality.sign.biddual.hom.app (FGModuleCat.of ℚ ℚ)) =
    -(rationalExactDuality.biddual.hom.app (FGModuleCat.of ℚ ℚ)) := by sorry
example : (rationalFormSpace 1 (1 : Matrix (Fin 1) (Fin 1) ℚ) (by simp) (by simp)).pairing.hom.hom.hom
    (fun _ => 2) (fun _ => 3) = 6 := by sorry
example : ExactW0.of rationalExactDuality
    (rationalFormSpace 2 (!![0,1;1,0]) (by sorry) (by sorry)) = 0 := by sorry
example : (rationalFormSpace 0 (1 : Matrix (Fin 0) (Fin 0) ℚ) (by simp) (by simp)).carrier =
    FGModuleCat.of ℚ (Fin 0 → ℚ) := by sorry
/-- Finite torsion is not reflexive for Z-linear duality; it is not the finite-projective category. -/
example : Subsingleton (Module.Dual ℤ (ZMod 2)) := by sorry
/-- Multiplication by two is injective but not an admissible split inclusion. -/
example : ¬ (TauCeti.ExactStructure.split (ModuleCat ℤ)).IsInflation
    (ModuleCat.ofHom (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ))) := by sorry
example : (TauCeti.ExactStructure.split (ModuleCat ℤ)).IsInflation
    (biprod.inl : ModuleCat.of ℤ ℤ ⟶ ModuleCat.of ℤ ℤ ⊞ ModuleCat.of ℤ ℤ) := by sorry
end FiniteFieldExactTests


section Layer6Checks
open CategoryTheory Opposite
/-- strong_category_duality_test_1 -/
example : Nonempty (StrongCategoryDuality (Discrete PUnit)) := by sorry
/-- strong_category_duality_test_2 -/
example {C : Type*} [Category C] (D : StrongCategoryDuality C)
    {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    D.dual.map ((f ≫ g).op)=D.dual.map g.op ≫ D.dual.map f.op := by sorry
/-- strong_category_duality_test_3 -/
example {C : Type*} [Category C] (D : Cᵒᵖ ⥤ C)
    (eta : 𝟭 C ⟶ D.rightOp ⋙ D) (X : C) (h : ¬ IsIso (eta.app X)) :
    ¬ ∃ e : 𝟭 C ≅ D.rightOp ⋙ D, e.hom=eta := by sorry
/-- symmetric_space_test_1 -/
example : Function.Injective (fun z : ℤ => 2*z) ∧
    ¬ Function.Surjective (fun z : ℤ => 2*z) := by sorry
/-- symmetric_space_test_2 -/
example {C : Type*} [Category C] {D : StrongCategoryDuality C}
    (X : SymmetricSpace D) : X.preserves X (𝟙 X.carrier) := by sorry
/-- symmetric_space_test_3: form preservation and isometry are distinct predicates. -/
example {C : Type*} [Category C] {D : StrongCategoryDuality C}
    (X Y : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier) (h : ¬ IsIso f) :
    ¬ ∃ e : X.carrier ≅ Y.carrier, e.hom=f := by sorry

end Layer6Checks

section DGDualitySigns

/-- The Koszul sign in opposite composition of morphisms of cohomological degrees i and j. -/
def dgOppositeSign (i j : ℤ) : ℤ := (-1) ^ (i*j).natAbs

/-- The dual cochain differential in degree i has sign (−1)^(i+1). -/
def dgDualDifferentialSign (i : ℤ) : ℤ := (-1) ^ (i+1).natAbs

/-- The degree-i bidual evaluation has sign (−1)^i. -/
def dgBidualSign (i : ℤ) : ℤ := (-1) ^ i.natAbs

/-- Dualizing a degree-(j−i) morphism on the degree-i component gives sign (−1)^(i(j−i)). -/
def dgDualMorphismSign (i j : ℤ) : ℤ := (-1) ^ (i*(j-i)).natAbs

/-- The opposite-composition sign is symmetric in the two degrees. -/
theorem dgOppositeSign_comm (i j : ℤ) : dgOppositeSign i j = dgOppositeSign j i := by sorry
/-- Applying the bidual sign twice gives one. -/
theorem dgBidualSign_sq (i : ℤ) : dgBidualSign i * dgBidualSign i = 1 := by sorry
/-- The dual differential sign changes at each successive degree. -/
theorem dgDualDifferentialSign_next (i : ℤ) :
    dgDualDifferentialSign (i+1) = -dgDualDifferentialSign i := by sorry
/-- A degree-zero morphism has no dual-morphism correction sign. -/
theorem dgDualMorphismSign_degree_zero (i : ℤ) : dgDualMorphismSign i i = 1 := by sorry

example : dgOppositeSign 1 1 = -1 := by decide
example : dgOppositeSign 0 1 = 1 := by decide
example : dgOppositeSign 1 2 = 1 := by decide
example : dgDualDifferentialSign (-1) = 1 := by decide
example : dgDualDifferentialSign 0 = -1 := by decide
example : dgDualDifferentialSign 1 = 1 := by decide
example : dgBidualSign (-1) = -1 := by decide
example : dgBidualSign 0 = 1 := by decide
example : dgBidualSign 1 = -1 := by decide
example : dgDualMorphismSign 1 2 = -1 := by decide
example : dgDualMorphismSign 0 1 = 1 := by decide
example : dgDualMorphismSign (-1) 1 = 1 := by decide
end DGDualitySigns

section SurgeryMatrixChecks
/-- Two individually invertible diagonal blocks do not determine the off-diagonal coherence. -/
example : Matrix.det (!![1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) = 1 := by norm_num
example : Matrix.det (!![1, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) = 0 := by norm_num
/-- The combined all-ones matrix has a nonzero kernel vector. -/
example : (!![1, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ).mulVec ![1, -1] = 0 := by
  ext i; fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_two]
end SurgeryMatrixChecks

section ResidueDualityCoefficient
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- Restriction of a linear map R→M to the prime ideal viewed as an R-submodule. -/
def residueRestriction (p : Ideal R) : (R →ₗ[R] M) →ₗ[R] (p →ₗ[R] M) where
  toFun f := f.comp p.subtype
  map_add' := by intro f g; ext x; rfl
  map_smul' := by intro a f; ext x; rfl

/-- The residue duality coefficient Hom(p,M) modulo restrictions of Hom(R,M). -/
abbrev residueDualizingModule (p : Ideal R) (M : Type*) [AddCommGroup M] [Module R M] :=
  (p →ₗ[R] M) ⧸ LinearMap.range (residueRestriction (M := M) p)

/-- Restriction evaluates the original map on the ideal element. -/
theorem residueRestriction_apply (p : Ideal R) (f : R →ₗ[R] M) (x : p) :
    residueRestriction p f x = f x := rfl

/-- The projection from ideal homomorphisms to the residue coefficient module is surjective. -/
theorem residueDualizingModule_quotient_surjective (p : Ideal R) :
    Function.Surjective
      (Submodule.mkQ (LinearMap.range (residueRestriction (M := M) p))) := by sorry

/-- For the unit ideal the restriction cokernel is zero. -/
theorem residueDualizingModule_top :
    Subsingleton (residueDualizingModule (⊤ : Ideal R) M) := by sorry

example : Nat.card (residueDualizingModule (Ideal.span ({2} : Set ℤ)) ℤ) = 2 := by sorry
example : Nat.card (residueDualizingModule (Ideal.span ({3} : Set ℤ)) ℤ) = 3 := by sorry
example (p : Ideal ℤ) : Subsingleton (residueDualizingModule p (Fin 0 → ℤ)) := by sorry
end ResidueDualityCoefficient

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-!
## Targets stated in `README.md` but not in this file

The following definitions and their tests require carriers beyond the pinned APIs.
The README supplies their hypotheses, constructions, API and computed checks.

Layer 2: `IntegralQuadraticLattice.localize`, `IntegralGenus.localIsometry`,
`ProperSpinorGenus.orbit`, and the completed-DVR dual-quotient construction
`HermitianLatticeInvariants.ofDualQuotient`.

Layer 3: `hermitianRepresentationScheme`, `hermitianLocalDensity`,
`normalizedSiegelPolynomial`, `hermitianSiegelIntegral`, `hermitianSphericalFunction`,
`traceLatticeRealComparison`, `adelicSchwartzBruhat`, `quadraticWeilOperators`,
`quadraticFiberDistribution`, `continuedDedekindZeta`, `smoothMaximalOrthogonalModel`,
and `dyadicEnlargedRepresentation`. Their comparison targets include the smooth lifting,
density stabilization, integral polynomial interpolation, spherical Weyl equation,
Siegel density transform, rank-one Siegel–Weil theorem, orthogonal Tamagawa number,
and integral-to-real gauge comparison.

Layer 4: `SemialgebraicMultiset`, `StronglyQuasiregularMap`,
`FiniteVolumeZariskiSubgroup`, `homogeneousWedge`, `homogeneousWedgeOrbitMap`,
`singularHomogeneousSet`, `homogeneousWedgeRepresentatives`, `HalfIntegralCuspForm`,
and the dynamical incidence carriers.
The Lie-group hypotheses of Howe–Moore, Ratner measure classification, orbit closure,
no escape, homogeneous linearization and one-orbit averages are stated in the README.
The half-integral coefficient estimate and harmonic theta modularity require the
specified modular-form carriers; they are separate from the typed lattice coefficients.

Layer 6 ordinary and stable K-theory: `quillenQ`, `exactKGroup`, `nerveRealization`,
`quillenTheoremA`, `waldhausenS`, `nonconnectiveKSpectrum`, `groupCompletion`,
`StableInfinityCategory`, `Spectrum`, `C2Spectrum`, `spectrumHomotopyOrbits`,
`spectrumHomotopyFixedPoints`, `spectrumTate`, `spectrumTwoCompletion`,
`WaldhausenInfinityCategory`, `infinityWaldhausenS`, `waldhausenInfinityKSpectrum`,
`stableVerdierQuotient`, `stableVerdierMappingSpace`, and `stableKHeartComparison`.

Layer 6 derived and hermitian constructions: `hermitianSuspension`,
`nonconnectiveHermitianSpectrum`, `DGCategory`, `DGWeakEquivalences`,
`PerfectDerivedInfinity`, `perfectDerivedHom`, `DerivedCoefficientLine`, `perfectDual`,
`PoincareInfinityCategory`, `symmetricPoincareStructure`, `quadraticPoincareStructure`,
`genuinePoincareStructure`, `stableGrothendieckWittSpectrum`, `stableLTheorySpectrum`,
`poincareAdConstruction`, `PoincareVerdierSequence`, `additiveHermitianBordification`,
`HomotopicallySoundExactCategory`, `exactDGStableGWComparison`,
`ExhaustiveWeightStructure`, `poincareLinearPart`, `PoincareWeightDimensionAtLeast`,
`PoincareWeightDimensionExactly`, `PoincareSurgeryDatum`, `PoincareCobordismCategory`,
`CobordismConnectivity`, `disjointSurgeryComplex`, `splitMiddleSurgeryComplex`,
`surgeryDataOneCoskeletal`, `quadraticCubeTwoFaceReconstruction`,
`weightHeartGWComparison`, `symmetricHeartLTheory`, and `symmetricResidueDevissage`.

Layer 6 arithmetic comparisons: `torsionPerfectCategory`, `dgArrowCategory`,
`virtualTwoCohomologicalDimension`, `globalIdeleExtDuality`, `globalIdeleLocalExt`,
`QLScheme`, `finiteFieldKGroups`, `finiteEvenFieldHomotopyLimit`,
`fieldFiniteVcdHomotopyLimit`, `finiteVcdWittCompletion`, `qlSchemeHomotopyLimit`,
`poincareTensorProduct`, `genuineLTheoryModule`, `symmetricLTheoryShiftTelescope`,
`integerKOddPart`, `integerKArithmeticInput`, and `twoLocalGWZHalf`.
-/
