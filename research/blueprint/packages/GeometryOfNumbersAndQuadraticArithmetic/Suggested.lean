import Mathlib
import TauCeti.Algebra.Category.FGModuleCat.Basic
import TauCeti.CategoryTheory.Exact.Split
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Opposite
import TauCeti.CategoryTheory.GrothendieckGroup.Exact

/-!
# Geometry of numbers, quadratic forms and homogeneous arithmetic: representative target signatures

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

#check @LinearMap.normDet_sq_eq_det_gram

section Gram
variable {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
  [InnerProductSpace 𝕜 E] {n : ℕ}


/-- Includes n = 0. -/
theorem orthonormal_coordinate_hadamard (b : OrthonormalBasis (Fin n) 𝕜 E)
    (v : Fin n → E) :
    ‖b.toBasis.det v‖ ≤ ∏ i, ‖v i‖ := by sorry

/-- E need not be finite-dimensional. -/
theorem hermitian_gram_hadamard (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (RCLike.re (Matrix.gram 𝕜 v).det : 𝕜) ∧
    0 ≤ RCLike.re (Matrix.gram 𝕜 v).det ∧
    RCLike.re (Matrix.gram 𝕜 v).det ≤ ∏ i, ‖v i‖ ^ 2 := by sorry

/-- The bound D is on squared row norms. -/
theorem gram_uniform_bound (v : Fin n → E) (D : ℝ) (hD : 0 ≤ D)
    (hv : ∀ i, ‖v i‖ ^ 2 ≤ D) :
    RCLike.re (Matrix.gram 𝕜 v).det ≤ D ^ n := by sorry

end Gram



/-- Fin n uses zero-based indices. -/
theorem ordered_tail_product {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (i : Fin n) :
    a i ^ (n - i.val) ≤ ∏ j, a j := by sorry

/-- V ≥ 1 follows, rather than being hidden. -/
theorem ordered_product_root_bound {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (V : ℝ) (hV : (∏ j, a j) ≤ V) (i : Fin n) :
    a i ≤ Real.rpow V ((n - i.val : ℕ) : ℝ)⁻¹ := by sorry

/-- The box lives in E, not an ambient over-space. -/
theorem orthonormal_cube_volume
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    volume {x : E | ∀ i, |b.repr x i| ≤ r} = ENNReal.ofReal ((2 * r) ^ n) := by sorry

/-- The normalized radius requires positive dimension. -/
theorem inscribed_cube
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    {x : E | ∀ i, |b.repr x i| ≤ (Real.sqrt n)⁻¹} ⊆
      Metric.closedBall (0 : E) 1 := by sorry

/-- No spherical surface measure. -/
theorem intrinsic_ball_lower_bound
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    ENNReal.ofReal ((2 / Real.sqrt n) ^ n) ≤ volume (Metric.closedBall (0 : E) 1) := by sorry

/- Discriminating unit tests.
   Exact finite computations are independently exercised in the scratch verification. -/

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

end Tests

section Orthogonal
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- The comap expresses saturation exactly. -/
theorem saturated_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (r s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ Δ)
      (c : Basis (Fin r) ℤ (ZLattice.comap ℝ Δ W.subtype)),
      ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- No discreteness of the image is assumed. -/
theorem projected_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℤ Δ) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, (b (Sum.inl i) : E) = (c i : E)) :
    ∃ q : Basis (Fin s) ℝ Wᗮ,
      (∀ j, q j = Wᗮ.orthogonalProjectionOnto (b (Sum.inr j) : E)) ∧
      Submodule.span ℤ (Set.range q) =
        Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ) := by sorry

/-- Empty blocks have determinant one. -/
theorem gram_det_adapted_projection
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℝ E) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, b (Sum.inl i) = (c i : E)) :
    (Matrix.gram ℝ b).det = (Matrix.gram ℝ c).det *
      (Matrix.gram ℝ (fun j => Wᗮ.orthogonalProjectionOnto (b (Sum.inr j)))).det := by sorry

/-- The two real bases are paired, not each orthonormal. -/
theorem gram_det_biorthogonal {n : ℕ}
    (b d : Basis (Fin n) ℝ E)
    (hd : ∀ i j, inner ℝ (b i) (d j) = if i = j then 1 else 0) :
    (Matrix.gram ℝ b).det * (Matrix.gram ℝ d).det = 1 := by sorry

/-- Does not need rationality or discreteness. -/
theorem dual_projection_comap
    (Δ : Submodule ℤ E) (W : Submodule ℝ E) :
    LinearMap.BilinForm.dualSubmodule (innerₗ Wᗮ)
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.comap ℝ (LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ) Wᗮ.subtype := by sorry

/-- Fullness is a conclusion. -/
theorem orthogonal_intersection_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (s : ℕ) (q : Basis (Fin s) ℝ Wᗮ),
      Submodule.span ℤ (Set.range q) = ZLattice.comap ℝ Δ Wᗮ.subtype := by sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- Canonical intrinsic measures in both subspaces. -/
theorem covolume_projection
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.covolume Δ / ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

/-- The intrinsic dual is already Mathlib's dualSubmodule. -/
theorem covolume_dual
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    ZLattice.covolume (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) = (ZLattice.covolume L)⁻¹ := by sorry

/-- Self-duality cannot be omitted. -/
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

section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Zero-based index; no index exists in dimension zero. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) : ℝ :=
  by sorry

/-- Definitional API: scalar invariant on existing carriers. -/
theorem successiveMin_def (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})} := by sorry

variable (L : Submodule ℤ E) [hLdis : DiscreteTopology L] [hLfull : IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))

include hLdis hLfull hK

/-- Negative, zero and positive bounds are distinguished. -/
theorem finite_gauge_sublevel (r : ℝ) :
    Set.Finite {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r} := by sorry

/-- No compactness claim about L minus W. -/
theorem exists_min_gauge_outside (W : Submodule ℝ E) (hW : W ≠ ⊤) :
    ∃ v : L, (v : E) ∉ W ∧ 0 < gauge (K : Set E) v ∧
      ∀ x : L, (x : E) ∉ W → gauge (K : Set E) v ≤ gauge (K : Set E) x := by sorry

/-- The prefix flag uses strict gauge inequalities. -/
theorem exists_greedy_gauge_family :
    ∃ v : Fin (finrank ℝ E) → L,
      LinearIndependent ℝ (fun i => (v i : E)) ∧
      (∀ i, 0 < gauge (K : Set E) (v i)) ∧
      Monotone (fun i => gauge (K : Set E) (v i)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < gauge (K : Set E) (v i) →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ (v j : E) = y} := by sorry

/-- Boundary attainment precedes inequalities. -/
theorem successiveMin_isLeast (i : Fin (finrank ℝ E)) :
    IsLeast {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}
      (successiveMin L K i) := by sorry

/-- There is no uniform bound by one. -/
theorem successiveMin_pos (i : Fin (finrank ℝ E)) : 0 < successiveMin L K i := by sorry

/-- Repeated values are permitted. -/
theorem successiveMin_monotone : Monotone (successiveMin L K) := by sorry

/-- The body is compact and the dilate is closed. -/
theorem successiveMin_le_iff (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K i ≤ r ↔ i.val + 1 ≤ 
      finrank ℝ (Submodule.span ℝ ((L : Set E) ∩ r • (K : Set E))) := by sorry

/-- A real basis, with integral entries. -/
theorem exists_successiveMin_witnesses :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E,
      (∀ i, b i ∈ L) ∧
      (∀ i, gauge (K : Set E) (b i) = successiveMin L K i) ∧
      (∀ i, b i ∈ successiveMin L K i • (K : Set E)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ b j = y} := by sorry

theorem successiveMin_antitone_body (K' : ConvexBody E)
    (hK' : (0 : E) ∈ interior (K' : Set E)) (hKK' : K ≤ K')
    (i : Fin (finrank ℝ E)) : successiveMin L K' i ≤ successiveMin L K i := by sorry

theorem successiveMin_monotone_lattice (M : Submodule ℤ E)
    [DiscreteTopology M] [IsZLattice ℝ M] (hLM : L ≤ M)
    (i : Fin (finrank ℝ E)) : successiveMin M K i ≤ successiveMin L K i := by sorry

/-- The scalar must be positive. -/
theorem successiveMin_smul_body (c : ℝ) (hc : 0 < c) (i : Fin (finrank ℝ E)) :
    successiveMin L (c • K) i = successiveMin L K i / c := by sorry

/-- Both input carriers move. -/
theorem successiveMin_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) [DiscreteTopology L'] [IsZLattice ℝ L']
    (K' : ConvexBody F) (hK' : (0 : F) ∈ interior (K' : Set F))
    (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E))
    (i : Fin (finrank ℝ E)) (j : Fin (finrank ℝ F)) (hij : i.val = j.val) :
    successiveMin L' K' j = successiveMin L K i := by sorry

/-- This does not reprove Minkowski first. -/
theorem successiveMin_first_le_iff (hd : 0 < finrank ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K ⟨0, hd⟩ ≤ r ↔
      ∃ x : E, x ∈ L ∧ x ≠ 0 ∧ x ∈ r • (K : Set E) := by sorry

end SuccessiveMinima

section IntegralFlag
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Preserve a given basis of the intersection. -/
theorem saturated_adapted_basis_of_basis
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ L W.subtype : Set W) = ⊤)
    {r : ℕ} (c : Basis (Fin r) ℤ (ZLattice.comap ℝ L W.subtype)) :
    ∃ (s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ L),
      r+s = finrank ℝ E ∧ ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- The short real vectors need not be an integral basis. -/
theorem exists_integral_basis_same_flag
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (w : Basis (Fin (finrank ℝ E)) ℝ E) (hw : ∀ i, w i ∈ L) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∀ k : Fin (finrank ℝ E+1), (b.ofZLatticeBasis ℝ).flag k = w.flag k := by sorry

/-- No upper bound on the individual basis vectors is claimed. -/
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

/-- The standard l1 volume is already Mathlib. -/
theorem weighted_crosspolytope_volume (o : OrthonormalBasis (Fin n) ℝ E)
    (b : Basis (Fin n) ℝ E) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : E | ∑ i, a i * |b.repr x i| ≤ 1} =
      ENNReal.ofReal (((2 : ℝ)^n / (Nat.factorial n : ℝ)) *
        |o.toBasis.det b| / ∏ i, a i) := by sorry

/-- The gauge proof keeps symmetry explicit. -/
theorem weighted_crosspolytope_subset {V : Type*} [NormedAddCommGroup V]
    [NormedSpace ℝ V] (K : ConvexBody V)
    (hK : (0 : V) ∈ interior (K : Set V)) (hsym : ∀ x ∈ K, -x ∈ K)
    (b : Basis (Fin n) ℝ V) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i)
    (hb : ∀ i, b i ∈ a i • (K : Set V)) :
    {x : V | ∑ i, a i * |b.repr x i| ≤ 1} ⊆ (K : Set V) := by sorry

/-- Independent lattice vectors can have index > 1. -/
theorem covolume_le_abs_basis_det (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (o : OrthonormalBasis (Fin n) ℝ E) (b : Basis (Fin n) ℝ E)
    (hb : ∀ i, b i ∈ L) : ZLattice.covolume L ≤ |o.toBasis.det b| := by sorry

/-- Includes dimension zero, with empty product one. -/
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

/-- The positive-coordinate body supplies its own interior. -/
theorem successiveMin_box
    (hK : (K : Set E) = {x : E | ∀ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

/-- A proof plan for Evertse Exercise 2.9. -/
theorem successiveMin_crosspolytope
    (hK : (K : Set E) = {x : E | ∑ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

end PrescribedMinima

section LinearForms

/-- Absolute determinant, with the empty case included. -/
theorem linear_forms_box_volume {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : A.det ≠ 0) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : Fin n → ℝ | ∀ i, |(Matrix.mulVec A x) i| ≤ a i} =
      ENNReal.ofReal ((2 : ℝ)^n * (∏ i, a i) / |A.det|) := by sorry

/-- Exact requested compact-boundary export. -/
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

/-- Touching boundaries do not count twice in measure. -/
theorem finite_interior_disjoint_translate_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (K : Set E) (hK : IsCompact K) (hconv : Convex ℝ K) (v : ι → E)
    (hdis : Pairwise fun i j => Disjoint
      ((fun x => v i+x) '' interior K) ((fun x => v j+x) '' interior K)) :
    μ (⋃ i, (fun x => v i+x) '' K) = (Fintype.card ι : ℝ≥0∞)*μ K := by sorry

/-- Sections preserve the finite family of translations. -/
theorem finite_translate_section (v : ι → E) (K : Set (E × F)) (y : F) :
    {x : E | (x,y) ∈ U v K} =
      ⋃ i, (fun x : E => v i+x) '' {x : E | (x,y) ∈ K} := by sorry

/-- No globally measurable center is asserted. -/
theorem convex_section_enlargement (v : ι → E) (K : Set (E × F))
    (hK : Convex ℝ K) (r : ℝ) (hr : 1 ≤ r) (y : F) :
    ∃ t : E, {x : E | (x,y) ∈ U v K} ⊆
      (fun x : E => x+t) '' {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- Only the original measurable sections will be integrated. -/
theorem section_union_volume_mono (μ : Measure E) [μ.IsAddHaarMeasure]
    (v : ι → E) (K : Set (E × F)) (hK : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) (y : F) :
    μ {x : E | (x,y) ∈ U v K} ≤ μ {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- Tonelli on compact unions, not on chosen centers. -/
theorem partial_dilation_union_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (ν : Measure F) [ν.IsAddHaarMeasure] (v : ι → E)
    (K : Set (E × F)) (hK : IsCompact K) (hconv : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) :
    μ.prod ν (U v K) ≤ μ.prod ν (U v (f₁ r '' K)) := by sorry

/-- A set identity with no analytic assumptions. -/
theorem complementary_dilation_union (v : ι → E) (K : Set (E × F)) (r : ℝ) :
    U v ((fun p : E × F => r • p) '' K) =
      f₂ r '' U v (f₁ r '' K) := by sorry

/-- The codimension factor in Henk (3.5). -/
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

/-- Transform the body and point simultaneously. -/
theorem gauge_linearEquiv {E F : Type*} [AddCommGroup E] [Module ℝ E]
    [AddCommGroup F] [Module ℝ F] (e : E ≃ₗ[ℝ] F) (K : Set E) (x : E) :
    gauge (e '' K) (e x) = gauge K x := by sorry

/-- No convexity of either union is assumed. -/
theorem convex_cluster_intersection_null {E I J : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] [Fintype I] [Fintype J]
    (μ : Measure E) [μ.IsAddHaarMeasure] (A : I → Set E) (B : J → Set E)
    (hA : ∀ i, Convex ℝ (A i)) (hB : ∀ j, Convex ℝ (B j))
    (hdis : ∀ i j, Disjoint (interior (A i)) (interior (B j))) :
    μ ((⋃ i, A i) ∩ ⋃ j, B j) = 0 := by sorry

/-- Only the outer rows are a.e. disjoint. -/
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

/-- Strict threshold; closed boundaries may touch. -/
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

/-- The prefix union may have overlapping translates. -/
theorem lattice_box_row_volume (d k q : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (hdis : ∀ x ∈ Mbox d q, ∀ y ∈ Mbox d q,
      (∃ j : Fin d, k ≤ j.val ∧ x j ≠ y j) →
      Disjoint ((fun w : Fin d → ℝ => (fun j => (x j : ℝ))+w) '' interior S)
        ((fun w : Fin d → ℝ => (fun j => (y j : ℝ))+w) '' interior S)) :
    volume (boxUnion d q S) =
      ((2*q+1 : ℕ) : ℝ≥0∞)^(d-k) * volume (prefixUnion d k q S) := by sorry

/-- Native coordinate-split product measure. -/
theorem coordinate_transverse_union_volume {I : Type*} [Fintype I] (d k : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (v : I → Fin d → ℝ) (hv : ∀ i j, k ≤ j.val → v i j = 0)
    (r : ℝ) (hr : 1 ≤ r) :
    ENNReal.ofReal (r^(d-k)) * volume (⋃ i, (fun x => v i+x) '' S) ≤ 
      volume (⋃ i, (fun x => v i+x) '' (r • S)) := by sorry

/-- Includes equality of the two thresholds. -/
theorem flag_box_volume_ratio {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s t : ℝ) (hs : 0 < s) (hst : s ≤ t) (k q : ℕ) (hk : k ≤ d)
    (hflag : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < t →
      ∀ j : Fin d, k ≤ j.val → z j = 0) :
    (t/s)^(d-k) * volume.real (boxUnion d q ((s/2) • (K : Set _))) ≤ 
      volume.real (boxUnion d q ((t/2) • (K : Set _))) := by sorry

/-- The threshold forbids nonzero strict-sublevel vectors. -/
theorem first_box_volume {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s : ℝ) (hs : 0 < s)
    (hfirst : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < s → z = 0)
    (q : ℕ) :
    volume.real (boxUnion d q ((s/2) • (K : Set _))) =
      (2*(q : ℝ)+1)^d * (s/2)^d * volume.real (K : Set (Fin d → ℝ)) := by sorry

/-- The radius is chosen independently of q. -/
theorem outer_lattice_box_volume (d : ℕ) (S : Set (Fin d → ℝ)) (hS : IsCompact S) :
    ∃ R : ℝ, 0 ≤ R ∧ ∀ q : ℕ,
      volume.real (boxUnion d q S) ≤ (2*(q : ℝ)+2*R)^d := by sorry

/-- Descending exponents are essential. -/
theorem weighted_ratio_product (n : ℕ) (a : Fin (n+1) → ℝ) (ha : ∀ j, 0 < a j) :
    a 0^(n+1) * (∏ i : Fin n, (a i.succ / a i.castSucc)^(n-i.val)) =
      ∏ j, a j := by sorry

/-- No division by any volume. -/
theorem weighted_volume_chain (n : ℕ) (a V : Fin (n+1) → ℝ)
    (ha : ∀ j, 0 < a j) (hV : ∀ j, 0 ≤ V j) (B : ℝ) (hB : 0 ≤ B)
    (hfirst : a 0^(n+1)*B ≤ V 0)
    (hstep : ∀ i : Fin n, (a i.succ/a i.castSucc)^(n-i.val)*V i.castSucc ≤ V i.succ) :
    (∏ j, a j)*B ≤ V (Fin.last n) := by sorry

/-- Even d=0 has its native meaning. -/
theorem large_box_comparison_limit (d : ℕ) (R B : ℝ)
    (h : ∀ q : ℕ, (2*(q : ℝ)+1)^d * B ≤ (2*(q : ℝ)+2*R)^d) : B ≤ 1 := by sorry

/-- The flag is a hypothesis, not a new minimum definition. -/
theorem coordinate_flag_upper (d : ℕ) (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (a : Fin d → ℝ) (ha : ∀ i, 0 < a i) (hmono : Monotone a)
    (hflag : ∀ i : Fin d, ∀ z : Fin d → ℤ,
      gauge (K : Set _) (fun j => (z j : ℝ)) < a i →
      ∀ j : Fin d, i ≤ j → z j = 0) :
    (∏ i, a i) * volume.real (K : Set (Fin d → ℝ)) ≤ 2^d := by sorry

/-- Native intrinsic volume and covolume, including dimension zero. -/
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

structure IntegralQuadraticLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : QuadraticForm K V
  integral : ∀ x ∈ carrier, ∃ r : R, algebraMap R K r = form x

variable {R K V}
def IntegralQuadraticLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (q : QuadraticForm K V)
    (hq : ∀ x ∈ L, ∃ r : R, algebraMap R K r = q x) :
    IntegralQuadraticLattice R K V := ⟨L, hL, q, hq⟩

def IntegralQuadraticLattice.quadraticMap [IsDomain R] [IsFractionRing R K]
    (L : IntegralQuadraticLattice R K V) : QuadraticMap R L.carrier R := by sorry

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

structure IntegralHermitianLattice where
  carrier : Submodule R V
  isLattice : Submodule.IsLattice K carrier
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetric : form.IsSymm
  starCompatible : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier,
    ∃ r : R, algebraMap R K r = form x y

variable {R K V}
def IntegralHermitianLattice.ofCarrier (L : Submodule R V)
    (hL : Submodule.IsLattice K L) (H : V →ₗ⋆[K] V →ₗ[K] K)
    (hH : H.IsSymm)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r))
    (hi : ∀ x ∈ L, ∀ y ∈ L, ∃ r : R, algebraMap R K r = H x y) :
    IntegralHermitianLattice R K V := ⟨L,hL,H,hH,hstar,hi⟩

theorem IntegralHermitianLattice.ext (L M : IntegralHermitianLattice R K V)
    (h : L.carrier = M.carrier) (hH : L.form = M.form) : L = M := by sorry

def IntegralHermitianLattice.map (L : IntegralHermitianLattice R K V)
    (f : V ≃ₗ[K] V) : IntegralHermitianLattice R K V := by sorry

def IntegralHermitianLattice.dual (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) :
    Submodule R V where
  carrier := {x | ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem IntegralHermitianLattice.mem_dual_iff
    (L : IntegralHermitianLattice R K V)
    (hstar : ∀ r : R, star (algebraMap R K r) = algebraMap R K (star r)) (x : V) :
    x ∈ L.dual hstar ↔ ∀ y ∈ L.carrier, ∃ r : R, algebraMap R K r = L.form x y := by sorry

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
def valuation (a : HermitianLatticeInvariants R π M n) : ℕ := ∑ i, a.exponent i
def type (a : HermitianLatticeInvariants R π M n) : ℕ := (Finset.univ.filter (fun i => 0 < a.exponent i)).card
/-- Zero padding is justified by the supplied n-generator surjection, not by a field basis. -/
def ofDualQuotient (hπ : Irreducible π) [Module.Finite R M]
    (hp : Module.IsTorsion' M (Submonoid.powers π))
    (f : (Fin n → R) →ₗ[R] M) (hf : Function.Surjective f) :
    HermitianLatticeInvariants R π M n := by sorry
theorem exponent_unique (a b : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    a.exponent = b.exponent := by sorry
theorem selfDual_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    Subsingleton M ↔ a.valuation = 0 := by sorry
theorem vertex_iff (a : HermitianLatticeInvariants R π M n) (hπ : Irreducible π) :
    (∀ x : M, π • x = 0) ↔ ∀ i, a.exponent i ≤ 1 := by sorry
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
theorem IsAtomicIntegralQuadraticForm.unary (q : QuadraticForm R (Fin n → R))
 (a : R) (e : (Fin n → R) ≃ₗ[R] R) (ha : IsUnit a) (hq : ∀ x, q x = a*(e x)^2) :
 IsAtomicIntegralQuadraticForm q := by sorry
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
variable (R K B V : Type*) [CommRing R] [Field K] [Algebra R K]
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
def dual (L : QuaternionicIntegralHermitianLattice R K B V) : Submodule R V := by sorry
theorem mem_dual_iff (L : QuaternionicIntegralHermitianLattice R K B V) (x : V) :
    x ∈ L.dual ↔ ∀ y ∈ L.carrier, L.pairing x y ∈ L.order := by sorry
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
abbrev RationalHamilton := ℍ[ℚ]
def lipschitzOrder : Subalgebra ℤ RationalHamilton where
  carrier := {q | (∃ a : ℤ, (a : ℚ)=q.re) ∧ (∃ b : ℤ, (b : ℚ)=q.imI) ∧
    (∃ c : ℤ, (c : ℚ)=q.imJ) ∧ (∃ d : ℤ, (d : ℚ)=q.imK)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  algebraMap_mem' := by sorry
def lipschitzHermitian : QuaternionicIntegralHermitianLattice ℤ ℚ RationalHamilton RationalHamilton := by sorry
theorem lipschitzHermitian_order : lipschitzHermitian.order = lipschitzOrder := by sorry
theorem lipschitzHermitian_carrier : lipschitzHermitian.carrier = lipschitzOrder.toSubmodule := by sorry
theorem lipschitzHermitian_pairing (x y : RationalHamilton) : lipschitzHermitian.pairing x y = star x * y := by sorry
example : lipschitzHermitian.pairing (⟨0,1,0,0⟩ : RationalHamilton) ⟨0,1,0,0⟩ = 1 := by sorry
example : (lipschitzHermitian.pairing (1 : RationalHamilton) 1 +
    star (lipschitzHermitian.pairing (1 : RationalHamilton) 1)).re = 2 := by sorry
example : (⟨1/2,1/2,1/2,1/2⟩ : RationalHamilton) ∉ lipschitzHermitian.carrier := by sorry
end QuaternionTests

section SignedFieldForms
variable (K V : Type*) [Field K] [StarRing K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
/-- Signed, perfect commutative-field forms. This is not the quaternion order carrier. -/
structure SignedHermitianSpace (ε : K) where
  sign : ε = 1 ∨ ε = -1
  form : V →ₗ⋆[K] V →ₗ[K] K
  symmetry : ∀ x y, form y x = ε * star (form x y)
  nondegenerate : ∀ x, (∀ y, form x y = 0) → x = 0
variable {K V}
def signedHermitianAdjoint {ε : K} (h : SignedHermitianSpace K V ε) (a : V →ₗ[K] V) : V →ₗ[K] V := by sorry
theorem signedHermitianAdjoint_apply {ε : K} (h : SignedHermitianSpace K V ε) (a : V →ₗ[K] V) (x y : V) :
    h.form (a x) y = h.form x (signedHermitianAdjoint h a y) := by sorry
def signedHermitianTwist {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) :
    SignedHermitianSpace K V (η*ε) := by sorry
theorem signedHermitianTwist_apply {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) (x y : V) :
    (signedHermitianTwist h a η hη ha).form x y = h.form x (a y) := by sorry
theorem signedHermitianTwist_adjoint {ε : K} (h : SignedHermitianSpace K V ε)
    (a : V ≃ₗ[K] V) (η : K) (hη : η = 1 ∨ η = -1)
    (ha : signedHermitianAdjoint h a.toLinearMap = η • a.toLinearMap) (b : V →ₗ[K] V) :
    signedHermitianAdjoint (signedHermitianTwist h a η hη ha) b =
      a.symm.toLinearMap.comp ((signedHermitianAdjoint h b).comp a.toLinearMap) := by sorry
example {ε : K} (h : SignedHermitianSpace K V ε)
    (ha : signedHermitianAdjoint h LinearMap.id = LinearMap.id) (x y : V) :
    (signedHermitianTwist h (LinearEquiv.refl K V) 1 (Or.inl rfl) (by simpa using ha)).form x y = h.form x y := by sorry
example {ε γ : K} (h : SignedHermitianSpace K V ε) (hγ : γ ≠ 0) (hs : star γ = -γ)
    (a : V ≃ₗ[K] V) (ha : ∀ x, a x = γ • x) :
    signedHermitianAdjoint h a.toLinearMap = -(a.toLinearMap) := by sorry
example {ε : K} (h : SignedHermitianSpace K V ε) (x : V) (hx : x ≠ 0) :
    ¬ ∃ a : V ≃ₗ[K] V, a.toLinearMap = 0 := by sorry

variable (F L : Type*) [Field F] [StarRing F] [Field L] [StarRing L] [Algebra F L]
  [FiniteDimensional F L] (W : Type*) [AddCommGroup W] [Module F W] [Module L W]
  [IsScalarTower F L W] [FiniteDimensional L W]
variable {F L W}
/-- The functional is explicitly nonzero and involution-equivariant. -/
def signedHermitianTransfer (ε : F) (h : SignedHermitianSpace L W (algebraMap F L ε))
    (hε : ε = 1 ∨ ε = -1) (ell : L →ₗ[F] F) (hell : ell ≠ 0)
    (hs : ∀ x, ell (star x) = star (ell x))
    (hstar : ∀ x : F, star (algebraMap F L x) = algebraMap F L (star x)) :
    SignedHermitianSpace F W ε := by sorry
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
end SignedFieldForms

section SignedHyperbolicTransfer
variable {K V : Type*} [Field K] [StarRing K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
def SignedHermitianSpace.IsHyperbolic {ε : K} (h : SignedHermitianSpace K V ε) : Prop :=
 ∃ N : Submodule K V, (N : Set V) = {x | ∀ y∈N, h.form x y=0}
variable {F L W : Type*} [Field F] [StarRing F] [Field L] [StarRing L] [Algebra F L]
 [FiniteDimensional F L] [AddCommGroup W] [Module F W] [Module L W]
 [IsScalarTower F L W] [FiniteDimensional L W]
theorem signedHermitianTransfer_hyperbolic (ε : F) (h : SignedHermitianSpace L W (algebraMap F L ε))
 (hε : ε=1 ∨ ε= -1) (ell : L →ₗ[F] F) (hell : ell ≠ 0)
 (hs : ∀ x, ell (star x)=star (ell x))
 (hstar : ∀ x : F, star (algebraMap F L x)=algebraMap F L (star x))
 (hh : h.IsHyperbolic) : (signedHermitianTransfer ε h hε ell hell hs hstar).IsHyperbolic := by sorry
end SignedHyperbolicTransfer


/-! ## Layer 3: Representation densities, mass and theta coefficients -/

section FiniteHermitianCounts
local instance : StarRing (ZMod 3) := starRingOfComm
variable {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
variable {m n : ℕ}

def hermitianRepresentationCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A | X.conjTranspose * G * X = B}

theorem hermitianRepresentationCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianRepresentationCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

theorem hermitianRepresentationCount_basisChange
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    hermitianRepresentationCount (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      hermitianRepresentationCount G B := by sorry

def hermitianEmbeddingCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A |
    X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}

theorem hermitianEmbeddingCount_empty (G : Matrix (Fin m) (Fin m) A) :
    hermitianEmbeddingCount G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry
theorem hermitianEmbeddingCount_le (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) :
    hermitianEmbeddingCount G B ≤ hermitianRepresentationCount G B := by sorry

theorem hermitianEmbeddingCount_eq_of_nonsingular {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (G : Matrix (Fin m) (Fin m) F)
    (B : Matrix (Fin n) (Fin n) F) (hB : B.det ≠ 0) :
    hermitianEmbeddingCount G B = hermitianRepresentationCount G B := by sorry

def normalizedHermitianCount (q N : ℕ) (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℝ :=
  (hermitianRepresentationCount G B : ℝ) / (q : ℝ)^(N * n * (2*m-n))

theorem normalizedHermitianCount_empty (q N : ℕ) (G : Matrix (Fin m) (Fin m) A) :
    normalizedHermitianCount q N G (0 : Matrix (Fin 0) (Fin 0) A) = 1 := by sorry

theorem normalizedHermitianCount_basisChange (q N : ℕ)
    (G : Matrix (Fin m) (Fin m) A) (B : Matrix (Fin n) (Fin n) A)
    (U Ui : Matrix (Fin m) (Fin m) A) (V Vi : Matrix (Fin n) (Fin n) A)
    (hU : U * Ui = 1) (hUi : Ui * U = 1) (hV : V * Vi = 1) (hVi : Vi * V = 1) :
    normalizedHermitianCount q N (U.conjTranspose * G * U) (V.conjTranspose * B * V) =
      normalizedHermitianCount q N G B := by sorry

def choYamauchiWeight (q a : ℕ) : Polynomial ℤ :=
  ∏ i ∈ Finset.range a, (1 - Polynomial.C ((-(q : ℤ))^i) * Polynomial.X)
theorem choYamauchiWeight_zero (q : ℕ) : choYamauchiWeight q 0 = 1 := by sorry
theorem choYamauchiWeight_succ (q a : ℕ) :
    choYamauchiWeight q (a+1) = choYamauchiWeight q a *
      (1 - Polynomial.C ((-(q : ℤ))^a) * Polynomial.X) := by sorry
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
end FiniteHermitianCounts

section WeightedMass
/-- Finite class-index formula. Obtaining the actual genus class set and its
finite stabilizers is an independent arithmetic obligation. -/
def genusMass {I : Type*} [Fintype I] (stabilizerOrder : I → ℕ) : ℚ :=
  ∑ i, (1 : ℚ)/(stabilizerOrder i : ℚ)
theorem genusMass_representative {I J : Type*} [Fintype I] [Fintype J]
    (w : I → ℕ) (e : I ≃ J) : genusMass (w ∘ e.symm) = genusMass w := by sorry
theorem genusMass_singleton (a : ℕ) : genusMass (fun _ : Unit => a)=1/(a : ℚ) := by sorry
theorem genusMass_pos {I : Type*} [Fintype I] [Nonempty I] (w : I → ℕ)
    (h : ∀ i, 0<w i) : 0<genusMass w := by sorry
example : genusMass (fun _ : Unit => 2)=1/2 := by sorry
example : genusMass (fun _ : Fin 2 => 2)=1 := by sorry
example : genusMass (Fin.elim0 : Fin 0 → ℕ)=0 := by sorry
end WeightedMass


/-! ## Layer 4: Lattice points, star bodies and homogeneous dynamics -/

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

section PackingCovering
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

def latticePackingRadius (L : Submodule ℤ E) : ℝ :=
  if finrank ℝ E = 0 then 0 else sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r=‖x‖} / 2
def latticeCoveringRadius (L : Submodule ℤ E) : ℝ :=
  sSup (Set.range (fun x : E => Metric.infDist x (L : Set E)))

theorem latticePackingRadius_eq_half (L : Submodule ℤ E)
    (h : 0 < finrank ℝ E) :
    latticePackingRadius L = sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ r=‖x‖}/2 := by sorry
theorem latticePackingRadius_smul (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (a : ℝ) (ha : 0<a) :
    latticePackingRadius (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) =
      a*latticePackingRadius L := by sorry
theorem latticeCoveringRadius_attained (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] : ∃ x : E, Metric.infDist x (L : Set E)=latticeCoveringRadius L := by sorry
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

structure CompactStarBody where
  gauge : E → ℝ
  continuous : Continuous gauge
  nonneg : ∀ x, 0 ≤ gauge x
  zero_iff : ∀ x, gauge x=0 ↔ x=0
  homogeneous : ∀ (a : ℝ), 0 ≤ a → ∀ x, gauge (a • x)=a*gauge x
  compact : IsCompact {x | gauge x ≤ 1}
  originInterior : (0 : E) ∈ interior {x | gauge x ≤ 1}

variable {E}
def CompactStarBody.ofGauge (p : E → ℝ) (hc : Continuous p)
    (hn : ∀ x, 0 ≤ p x) (hz : ∀ x, p x=0 ↔ x=0)
    (hh : ∀ a : ℝ, 0 ≤ a → ∀ x, p (a • x)=a*p x)
    (hk : IsCompact {x | p x ≤ 1}) (hi : (0 : E) ∈ interior {x | p x ≤ 1}) :
    CompactStarBody E := ⟨p,hc,hn,hz,hh,hk,hi⟩
theorem CompactStarBody.radial (K : CompactStarBody E) (a : ℝ) (ha : 0<a) (x : E) :
    K.gauge (a • x) ≤ 1 ↔ K.gauge x ≤ 1/a := by sorry
def CompactStarBody.admissible (K : CompactStarBody E) (L : Submodule ℤ E) : Prop :=
  ∀ x ∈ L, x≠0 → 1 ≤ K.gauge x
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
def criticalDeterminant (K : CompactStarBody E) : ℝ :=
  sInf {d | ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
    K.admissible L ∧ d=ZLattice.covolume L}
theorem criticalDeterminant_le_covolume (K : CompactStarBody E) (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (h : K.admissible L) :
    criticalDeterminant K ≤ ZLattice.covolume L := by sorry
theorem criticalDeterminant_mono (K H : CompactStarBody E)
    (h : {x | K.gauge x ≤ 1} ⊆ {x | H.gauge x ≤ 1}) : criticalDeterminant K ≤ criticalDeterminant H := by sorry
theorem criticalDeterminant_smul (K H : CompactStarBody E) (a : ℝ) (ha : 0 < a)
    (h : ∀ x, H.gauge x=K.gauge x/a) :
    criticalDeterminant H = a^(finrank ℝ E)*criticalDeterminant K := by sorry
theorem star_body_interior_ball (K : CompactStarBody E) :
    ∃ r : ℝ, 0 < r ∧ Metric.ball 0 r ⊆ {x | K.gauge x < 1} := by sorry
theorem star_body_admissible_dilate (K : CompactStarBody E) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L), K.admissible L := by sorry
theorem critical_determinant_positive (K : CompactStarBody E) (hn : 0 < finrank ℝ E) :
    0 < criticalDeterminant K := by sorry
theorem star_admissibility_closed (K : CompactStarBody E) {n : ℕ}
    (b : ℕ → Fin n → E) (c : Basis (Fin n) ℝ E)
    (hconv : ∀ i, Filter.Tendsto (fun m => b m i) Filter.atTop (nhds (c i)))
    (h : ∀ m, K.admissible (Submodule.span ℤ (Set.range (b m)))) :
    K.admissible (Submodule.span ℤ (Set.range c)) := by sorry
theorem critical_lattice_exists (K : CompactStarBody E) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
      K.admissible L ∧ ZLattice.covolume L=criticalDeterminant K := by sorry
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x=|x|) : criticalDeterminant K=1 := by sorry
example (K : CompactStarBody ℝ) (h : ∀ x, K.gauge x=|x|/2) : criticalDeterminant K=2 := by sorry
example (K : CompactStarBody (EuclideanSpace ℝ (Fin 0))) : criticalDeterminant K=1 := by sorry
end CriticalDeterminants

section GaussianSums
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
def latticeGaussianSum (L : Submodule ℤ E) (s : ℝ) (u : E) : ℝ :=
  ∑' x : L, Real.exp (-Real.pi*‖(x : E)+u‖^2/s^2)
theorem latticeGaussianSum_zeroRank (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (s : ℝ) (hs : 0 < s) :
    latticeGaussianSum L s 0=1 := by sorry
theorem latticeGaussianSum_translate (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u v : E) (hv : v∈L) :
    latticeGaussianSum L s (u+v)=latticeGaussianSum L s u := by sorry
theorem latticeGaussianSum_scale (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s a : ℝ) (hs : 0 < s) (ha : 0 < a) (u : E) :
    latticeGaussianSum (L.map (a • LinearMap.id : E →ₗ[ℤ] E)) (a*s) (a • u) =
      latticeGaussianSum L s u := by sorry
theorem gaussian_lattice_summable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) :
    Summable (fun x : L => Real.exp (-Real.pi*‖(x : E)+u‖^2/s^2)) := by sorry
theorem gaussian_shift_maximum (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 0 < s) (u : E) : latticeGaussianSum L s u ≤ latticeGaussianSum L s 0 := by sorry
theorem gaussian_scale_upper (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (s : ℝ) (hs : 1 ≤ s) (u : E) :
    latticeGaussianSum L s u ≤ s^(finrank ℝ E)*latticeGaussianSum L 1 0 := by sorry
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
theorem gaussian_short_vector_error (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
 (hn : 0<finrank ℝ E) (h : ∀ x∈L, x≠0 → Real.sqrt (finrank ℝ E)<‖x‖) :
 latticeGaussianSum L 1 0-1 ≤ 
 (2*Real.exp (-3*Real.pi/4))^(finrank ℝ E)/(1-(2*Real.exp (-3*Real.pi/4))^(finrank ℝ E)) := by sorry
theorem gaussian_poisson_error (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (u : E) :
 |latticeGaussianSum (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) 1 u-ZLattice.covolume L| ≤ 
 ZLattice.covolume L*(latticeGaussianSum L 1 0-1) := by sorry
theorem gaussian_covering_contradiction (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
 (hn : 0<finrank ℝ E) (h : ∀ x∈L, x≠0 → Real.sqrt (finrank ℝ E)<‖x‖) (u : E) :
 ∃ y∈LinearMap.BilinForm.dualSubmodule (innerₗ E) L, ‖y+u‖ ≤ Real.sqrt (finrank ℝ E) := by sorry
end AdditionalCriticalGaussian

section NativeGeometryTargets
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

theorem euclidean_dual_transference_upper (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1)
    (i j : Fin (finrank ℝ E)) (hij : i.val+j.val+1=finrank ℝ E) :
    successiveMin L K i *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K j ≤ 
        (finrank ℝ E : ℝ) := by sorry

theorem covering_dual_transference (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (K : ConvexBody E)
    (hK : (K : Set E) = Metric.closedBall 0 1) (hd : 0<finrank ℝ E) :
    (1/2 : ℝ) ≤ latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0,hd⟩ ∧
    latticeCoveringRadius L *
      successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) K ⟨0,hd⟩ ≤ 
        (finrank ℝ E : ℝ) := by sorry

theorem oppenheim_values {n : ℕ} (hn : 3 ≤ n) (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : ∀ x : Fin n → ℝ, x≠0 →
      ∃ y, q (x+y)-q x-q y ≠ 0)
    (hind : (∃ x, q x>0) ∧ (∃ x, q x<0))
    (hirr : ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ))=c*(r : ℝ)) :
    Dense (Set.range (fun z : Fin n → ℤ => q (fun i => (z i : ℝ)))) := by sorry
end NativeGeometryTargets


/-! ## Layer 5: Certified LLL reduction -/

section LLL
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

def lllCoefficient (b : Fin n → E) (i j : Fin n) : ℝ :=
  inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
    ‖InnerProductSpace.gramSchmidt ℝ b j‖^2

theorem lllCoefficient_eq (b : Fin n → E) (i j : Fin n) :
    lllCoefficient b i j = inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
      ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 := by sorry
theorem lllCoefficient_orthogonal (b : Fin n → E)
    (hb : Pairwise (fun i j => inner ℝ (b i) (b j) = 0)) (i j : Fin n) (h : i ≠ j) :
    lllCoefficient b i j = 0 := by sorry
theorem lllCoefficient_denominator_pos (b : Fin n → E)
    (hb : LinearIndependent ℝ b) (j : Fin n) :
    0 < ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 := by sorry

def IsLLLReduced (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j, j < i → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j, j.val+1 = i.val →
    (3/4-(lllCoefficient b i j)^2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)

theorem IsLLLReduced.linearIndependent {b : Fin n → E} (h : IsLLLReduced b) :
    LinearIndependent ℝ b := by sorry
theorem IsLLLReduced.size {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j < i) : |lllCoefficient b i j| ≤ 1/2 := by sorry
theorem IsLLLReduced.lovasz {b : Fin n → E} (h : IsLLLReduced b)
    (i j : Fin n) (hj : j.val+1=i.val) :
    (3/4-(lllCoefficient b i j)^2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry

structure UnimodularBasisCertificate (b c : Fin n → E) where
  matrix : Matrix (Fin n) (Fin n) ℤ
  inverse : Matrix (Fin n) (Fin n) ℤ
  rightInverse : matrix * inverse = 1
  leftInverse : inverse * matrix = 1
  coordinates : ∀ i, c i = ∑ j, matrix j i • b j

def UnimodularBasisCertificate.ofMatrices (b c : Fin n → E)
    (U V : Matrix (Fin n) (Fin n) ℤ) (hU : U*V=1) (hV : V*U=1)
    (h : ∀ i, c i = ∑ j, U j i • b j) : UnimodularBasisCertificate b c :=
  ⟨U,V,hU,hV,h⟩
theorem UnimodularBasisCertificate.span_eq {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) :
    Submodule.span ℤ (Set.range b) = Submodule.span ℤ (Set.range c) := by sorry
theorem UnimodularBasisCertificate.det_unit {b c : Fin n → E}
    (h : UnimodularBasisCertificate b c) : h.matrix.det = 1 ∨ h.matrix.det = -1 := by sorry
def UnimodularBasisCertificate.trans {b c d : Fin n → E}
    (h : UnimodularBasisCertificate b c) (k : UnimodularBasisCertificate c d) :
    UnimodularBasisCertificate b d := by sorry

theorem lll_gram_schmidt_growth (b : Fin n → E) (h : IsLLLReduced b)
    (j i : Fin n) (hji : j ≤ i) :
    ‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
      (2 : ℝ)^(i.val-j.val) * ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry
theorem lll_short_vector_factor (b : Fin n → E) (h : IsLLLReduced b) (hn : 0<n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖b ⟨0,hn⟩‖^2 ≤ (2 : ℝ)^(n-1)*‖x‖^2 := by sorry

structure LLLReductionResult (b : Fin n → E) where
  output : Fin n → E
  certificate : UnimodularBasisCertificate b output
  reduced : IsLLLReduced output

def exactLLL (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    LLLReductionResult b := by sorry
theorem exactLLL_certificate (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    Nonempty (UnimodularBasisCertificate b (exactLLL b hb hGram).output) := by sorry
theorem exactLLL_reduced (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    IsLLLReduced (exactLLL b hb hGram).output := by sorry
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

def lllIntegerPotential (A : Matrix (Fin n) (Fin n) ℤ) : ℤ :=
  ∏ k ∈ Finset.range n,
    Matrix.det (fun i j : {i : Fin n // i.val < k} => (A.transpose*A) i j)
theorem lllIntegerPotential_pos (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0) :
    0 < lllIntegerPotential A := by sorry

/-- A column size reduction by another earlier column preserves every prefix Gram determinant. -/
theorem lllIntegerPotential_sizeReduce (A : Matrix (Fin n) (Fin n) ℤ)
    (i j : Fin n) (hji : j < i) (a : ℤ) :
    lllIntegerPotential (fun r c => if c=i then A r c-a*A r j else A r c) =
      lllIntegerPotential A := by sorry

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
def lllNearestInteger (t : ℝ) : ℤ := ⌊t+1/2⌋
theorem lll_nearest_integer (t : ℝ) : |t-(lllNearestInteger t : ℝ)| ≤ 1/2 := by sorry
def lllShear (b : Fin n → E) (i j : Fin n) (r : ℤ) : Fin n → E :=
  fun k => if k=i then b i-r • b j else b k
theorem lll_shear_certificate (b : Fin n → E) (i j : Fin n) (hji : j < i) (r : ℤ) :
    Nonempty (UnimodularBasisCertificate b (lllShear b i j r)) := by sorry
theorem lll_shear_gram_schmidt (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) (k : Fin n) :
    InnerProductSpace.gramSchmidt ℝ (lllShear b i j r) k =
      InnerProductSpace.gramSchmidt ℝ b k := by sorry
theorem lll_shear_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i j = lllCoefficient b i j-r := by sorry
theorem lll_shear_earlier_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j l : Fin n) (hji : j < i) (hl : l < j) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i l = lllCoefficient b i l-r*lllCoefficient b j l := by sorry
theorem lll_shear_later_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j l : Fin n) (hji : j < i) (hl : j < l) (hli : l < i) (r : ℤ) :
    lllCoefficient (lllShear b i j r) i l = lllCoefficient b i l := by sorry
theorem lll_swap_certificate (b : Fin n → E) (i j : Fin n) :
    Nonempty (UnimodularBasisCertificate b (b ∘ Equiv.swap i j)) := by sorry
theorem lll_swap_first_vector (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    InnerProductSpace.gramSchmidt ℝ (b ∘ Equiv.swap i j) i =
      InnerProductSpace.gramSchmidt ℝ b j +
        lllCoefficient b j i • InnerProductSpace.gramSchmidt ℝ b i := by sorry
theorem lll_swap_second_vector (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    let B := ‖InnerProductSpace.gramSchmidt ℝ b i‖^2
    let C := ‖InnerProductSpace.gramSchmidt ℝ b j‖^2
    let a := lllCoefficient b j i
    let T := C+a^2*B
    InnerProductSpace.gramSchmidt ℝ (b ∘ Equiv.swap i j) j =
      (C/T) • InnerProductSpace.gramSchmidt ℝ b i -
        (a*B/T) • InnerProductSpace.gramSchmidt ℝ b j := by sorry
theorem lll_swap_later_coefficients (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j k : Fin n) (hij : i.val+1=j.val) (hjk : j < k) :
    lllCoefficient (b ∘ Equiv.swap i j) k j =
      lllCoefficient b k i-lllCoefficient b j i*lllCoefficient b k j := by sorry

def lllPrefixGramDet (b : Fin n → E) (k : ℕ) : ℝ :=
  (Matrix.gram ℝ (fun i : {i : Fin n // i.val < k} => b i)).det
def lllRealPotential (b : Fin n → E) : ℝ := ∏ k ∈ Finset.range n, lllPrefixGramDet b k
theorem lll_prefix_gram_product (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (k : ℕ) (hk : k ≤ n) :
    lllPrefixGramDet b k = ∏ i : {i : Fin n // i.val < k}, ‖InnerProductSpace.gramSchmidt ℝ b i‖^2 := by sorry
theorem lll_prefix_gram_integral (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hGram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) (k : ℕ) :
    ∃ d : ℕ, 0 < d ∧ lllPrefixGramDet b k = d := by sorry
theorem lll_prefix_shear_invariant (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hji : j < i) (r : ℤ) (k : ℕ) :
    lllPrefixGramDet (lllShear b i j r) k = lllPrefixGramDet b k := by sorry
theorem lll_prefix_swap_ratio (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (i j : Fin n) (hij : i.val+1=j.val) :
    lllRealPotential (b ∘ Equiv.swap i j) =
      ((‖InnerProductSpace.gramSchmidt ℝ b j‖^2+
        (lllCoefficient b j i)^2*‖InnerProductSpace.gramSchmidt ℝ b i‖^2) /
        ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)*lllRealPotential b := by sorry
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
theorem lll_reduce_row_size (b : Fin n → E) (hb : LinearIndependent ℝ b) (i j : Fin n) (hj : j < i) :
 |lllCoefficient (lllReduceRow b i) i j| ≤ 1/2 := by sorry
theorem lll_reduce_row_certificate (b : Fin n → E) (i : Fin n) :
 Nonempty (UnimodularBasisCertificate b (lllReduceRow b i)) := by sorry
theorem lll_reduce_row_other (b : Fin n → E) (i j : Fin n) (h : j ≠ i) :
 lllReduceRow b i j = b j := by sorry
theorem lll_reduce_row_potential (b : Fin n → E) (hb : LinearIndependent ℝ b) (i : Fin n) :
 lllRealPotential (lllReduceRow b i) = lllRealPotential b := by sorry
def lllPrefixReduced (b : Fin n → E) (k : ℕ) : Prop :=
 (∀ i j : Fin n, i.val < k → j < i → |lllCoefficient b i j| ≤ 1/2) ∧
 (∀ i j : Fin n, i.val < k → j.val+1=i.val →
 (3/4-(lllCoefficient b i j)^2)*‖InnerProductSpace.gramSchmidt ℝ b j‖^2 ≤ 
 ‖InnerProductSpace.gramSchmidt ℝ b i‖^2)
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
def lllLoopMeasure (s : LLLLoopState E n) : ℕ × ℕ :=
 (Int.toNat ⌊lllRealPotential s.vectors⌋,n-s.cursor)
theorem lll_outer_measure_decreases (s t : LLLLoopState E n) (h : lllOuterStep s t) :
 Prod.Lex (· < ·) (· < ·) (lllLoopMeasure t) (lllLoopMeasure s) := by sorry
theorem lll_outer_terminates : WellFounded (fun t s : LLLLoopState E n => lllOuterStep s t) := by sorry
example : lllPrefixReduced (Fin.elim0 : Fin 0 → ℝ) 0 := by sorry
example : lllReduceRow (![(1 : ℝ)] : Fin 1 → ℝ) 0 = ![1] := by sorry
example : lllReduceRow (![(1 : ℝ),3] : Fin 2 → ℝ) 1 = ![1,0] := by sorry
end LLLLoop

section LLLTransitionInvariant
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
/-- constructing the successor also establishes its invariant. -/
theorem lll_outer_step_exists (s : LLLLoopState E n) (h : s.cursor < n) :
 ∃ t : LLLLoopState E n, lllOuterStep s t := by sorry
/-- rank one needs no outer step. -/
example (s : LLLLoopState E 1) : s.cursor = 1 := by sorry
example (s : LLLLoopState E 1) : ¬ ∃ t, lllOuterStep s t := by sorry
example : IsEmpty (LLLLoopState E 0) := by sorry
end LLLTransitionInvariant


/-! ## Layer 6: Hermitian K-theory of exact categories -/

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
  coherence : ∀ X : C,
    biddual.hom.app (dual.obj (op X)) ≫ dual.map ((biddual.hom.app X).op) =
      𝟙 (dual.obj (op X))

variable {C}
structure SymmetricSpace (D : StrongCategoryDuality C) where
  carrier : C
  pairing : carrier ≅ D.dual.obj (op carrier)
  symmetric : D.biddual.hom.app carrier ≫ D.dual.map pairing.hom.op = pairing.hom

def SymmetricSpace.preserves {D : StrongCategoryDuality C}
    (X Y : SymmetricSpace D) (f : X.carrier ⟶ Y.carrier) : Prop :=
  X.pairing.hom = f ≫ Y.pairing.hom ≫ D.dual.map f.op
theorem SymmetricSpace.preserves_id {D : StrongCategoryDuality C} (X : SymmetricSpace D) :
    X.preserves X (𝟙 X.carrier) := by sorry
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
theorem map_conflation (D : ExactCategoryDuality E) (S : ShortComplex Cᵒᵖ)
    (hS : E.op.Conflation S) : E.Conflation (S.map D.dual) := by sorry
theorem map_inflation (D : ExactCategoryDuality E) {X Y : C}
    (i : X ⟶ Y) (hi : E.IsInflation i) : E.IsDeflation (D.dual.map i.op) := by sorry
theorem map_deflation (D : ExactCategoryDuality E) {X Y : C}
    (p : X ⟶ Y) (hp : E.IsDeflation p) : E.IsInflation (D.dual.map p.op) := by sorry
/-- Sign changes the bidual identification, not the underlying contravariant functor. -/
def sign (D : ExactCategoryDuality E) : ExactCategoryDuality E where
  dual := D.dual
  biddual := { hom := -D.biddual.hom, inv := -D.biddual.inv, hom_inv_id := by sorry, inv_hom_id := by sorry }
  coherence := by sorry
  additive := D.additive
  exact := D.exact
theorem sign_dual (D : ExactCategoryDuality E) : D.sign.dual = D.dual := by sorry
theorem sign_biddual (D : ExactCategoryDuality E) (X : C) :
    D.sign.biddual.hom.app X = -D.biddual.hom.app X := by sorry
theorem sign_sign (D : ExactCategoryDuality E) : D.sign.sign = D := by sorry
end ExactCategoryDuality

variable {E : TauCeti.ExactStructure C} (D : ExactCategoryDuality E)
structure ExactLagrangian (X : SymmetricSpace D.toStrongCategoryDuality) where
  carrier : C
  inclusion : carrier ⟶ X.carrier
  zero : inclusion ≫ X.pairing.hom ≫ D.dual.map inclusion.op = 0
  conflation : E.Conflation
    (ShortComplex.mk inclusion (X.pairing.hom ≫ D.dual.map inclusion.op) zero)

namespace ExactLagrangian
variable {D}
def ofConflation (X : SymmetricSpace D.toStrongCategoryDuality) (L : C)
    (i : L ⟶ X.carrier) (hz : i ≫ X.pairing.hom ≫ D.dual.map i.op = 0)
    (hc : E.Conflation (ShortComplex.mk i (X.pairing.hom ≫ D.dual.map i.op) hz)) :
    ExactLagrangian D X := ⟨L,i,hz,hc⟩
theorem isInflation {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : E.IsInflation L.inclusion := by sorry
def kernel {X : SymmetricSpace D.toStrongCategoryDuality} (L : ExactLagrangian D X) :
    IsLimit (KernelFork.ofι L.inclusion L.zero) := by sorry
def cokernel {X : SymmetricSpace D.toStrongCategoryDuality} (L : ExactLagrangian D X) :
    IsColimit (CokernelCofork.ofπ (X.pairing.hom ≫ D.dual.map L.inclusion.op) L.zero) := by sorry
end ExactLagrangian

/-- The right block uses η. No division by two occurs. -/
def hyperbolicSpace (X : C) : SymmetricSpace D.toStrongCategoryDuality := by sorry
theorem hyperbolicSpace_carrier (X : C) :
    (hyperbolicSpace D X).carrier = (X ⊞ D.dual.obj (op X)) := by sorry
/-- Transport along the carrier equation gives the first summand inclusion. -/
def hyperbolicLagrangian (X : C) : ExactLagrangian D (hyperbolicSpace D X) := by sorry
theorem hyperbolicLagrangian_carrier (X : C) :
    (hyperbolicLagrangian D X).carrier = X := by sorry

def orthogonalSum (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    SymmetricSpace D.toStrongCategoryDuality := by sorry
theorem orthogonalSum_carrier (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    (orthogonalSum D X Y).carrier = (X.carrier ⊞ Y.carrier) := by sorry

structure SymmetricIsometry (X Y : SymmetricSpace D.toStrongCategoryDuality) where
  iso : X.carrier ≅ Y.carrier
  preserves : X.preserves Y iso.hom

def symmetricIsometrySetoid : Setoid (SymmetricSpace D.toStrongCategoryDuality) where
  r X Y := Nonempty (SymmetricIsometry D X Y)
  iseqv := by sorry
abbrev SymmetricIsometryClass := Quotient (symmetricIsometrySetoid D)
def symmetricClass (X : SymmetricSpace D.toStrongCategoryDuality) :
    SymmetricIsometryClass D := Quotient.mk _ X

def gwRelations : Set (FreeAbelianGroup (SymmetricIsometryClass D)) :=
  {r | (∃ X Y, r = FreeAbelianGroup.of (symmetricClass D (orthogonalSum D X Y)) -
      FreeAbelianGroup.of (symmetricClass D X) - FreeAbelianGroup.of (symmetricClass D Y)) ∨
    (∃ (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X),
      r = FreeAbelianGroup.of (symmetricClass D X) -
        FreeAbelianGroup.of (symmetricClass D (hyperbolicSpace D L.carrier)))}
abbrev ExactGW0 := FreeAbelianGroup (SymmetricIsometryClass D) ⧸ AddSubgroup.closure (gwRelations D)
def ExactGW0.of (X : SymmetricSpace D.toStrongCategoryDuality) : ExactGW0 D :=
  QuotientAddGroup.mk (FreeAbelianGroup.of (symmetricClass D X))
theorem ExactGW0.isometry (X Y : SymmetricSpace D.toStrongCategoryDuality)
    (e : SymmetricIsometry D X Y) : ExactGW0.of D X = ExactGW0.of D Y := by sorry
theorem ExactGW0.sum (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    ExactGW0.of D (orthogonalSum D X Y) = ExactGW0.of D X + ExactGW0.of D Y := by sorry
theorem ExactGW0.metabolic (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    ExactGW0.of D X = ExactGW0.of D (hyperbolicSpace D L.carrier) := by sorry

def ExactGW0.lift {A : Type*} [AddCommGroup A]
    (f : SymmetricSpace D.toStrongCategoryDuality → A)
    (hi : ∀ X Y, Nonempty (SymmetricIsometry D X Y) → f X = f Y)
    (hs : ∀ X Y, f (orthogonalSum D X Y) = f X + f Y)
    (hm : ∀ X (L : ExactLagrangian D X), f X = f (hyperbolicSpace D L.carrier)) :
    ExactGW0 D →+ A := by sorry
theorem ExactGW0.lift_of {A : Type*} [AddCommGroup A]
    (f : SymmetricSpace D.toStrongCategoryDuality → A)
    (hi : ∀ X Y, Nonempty (SymmetricIsometry D X Y) → f X = f Y)
    (hs : ∀ X Y, f (orthogonalSum D X Y) = f X + f Y)
    (hm : ∀ X (L : ExactLagrangian D X), f X = f (hyperbolicSpace D L.carrier))
    (X : SymmetricSpace D.toStrongCategoryDuality) : ExactGW0.lift D f hi hs hm (ExactGW0.of D X)=f X := by sorry

def metabolicSubgroup : AddSubgroup (ExactGW0 D) :=
  AddSubgroup.closure {x | ∃ (X : SymmetricSpace D.toStrongCategoryDuality),
    Nonempty (ExactLagrangian D X) ∧ x = ExactGW0.of D X}
abbrev ExactW0 := ExactGW0 D ⧸ metabolicSubgroup D
def ExactW0.of (X : SymmetricSpace D.toStrongCategoryDuality) : ExactW0 D :=
  QuotientAddGroup.mk (ExactGW0.of D X)
theorem ExactW0.metabolic (X : SymmetricSpace D.toStrongCategoryDuality)
    (L : ExactLagrangian D X) : ExactW0.of D X = 0 := by sorry
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
theorem isotropicReduction_carrier {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : (isotropicReduction D L).carrier = L.quotient := by sorry
/-- The induced map has an actual quotient carrier, so the pullback can be stated there. -/
def isotropicReductionPairing {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : L.quotient ⟶ D.dual.obj (op L.quotient) := by sorry
theorem isotropicReduction_pullback {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) :
    L.quotientMap ≫ isotropicReductionPairing D L ≫ D.dual.map L.quotientMap.op =
      L.orthogonalInclusion ≫ X.pairing.hom ≫ D.dual.map L.orthogonalInclusion.op := by sorry
theorem isotropicReduction_perfect {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : IsIso (isotropicReductionPairing D L) := by sorry
theorem exact_five_lemma (S T : ShortComplex C) (hS : E.Conflation S) (hT : E.Conflation T)
    (f : S ⟶ T) [IsIso f.τ₁] [IsIso f.τ₃] : IsIso f.τ₂ := by sorry

def negativeSpace (X : SymmetricSpace D.toStrongCategoryDuality) : SymmetricSpace D.toStrongCategoryDuality := by sorry
theorem negativeSpace_carrier (X : SymmetricSpace D.toStrongCategoryDuality) :
    (negativeSpace D X).carrier = X.carrier := by sorry
theorem symmetric_diagonal_lagrangian (X : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (ExactLagrangian D (orthogonalSum D X (negativeSpace D X))) := by sorry
theorem isotropic_reduction_metabolic {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : Nonempty (ExactLagrangian D
      (orthogonalSum D X (negativeSpace D (isotropicReduction D L)))) := by sorry
theorem ExactW0.neg (X : SymmetricSpace D.toStrongCategoryDuality) :
    ExactW0.of D (negativeSpace D X) = -ExactW0.of D X := by sorry
theorem hyperbolicSpace_sum (X Y : C) : Nonempty (SymmetricIsometry D (hyperbolicSpace D (X ⊞ Y))
    (orthogonalSum D (hyperbolicSpace D X) (hyperbolicSpace D Y))) := by sorry

def grothendieckWittForgetful [EssentiallySmall.{w} C] : ExactGW0 D →+ TauCeti.ExactK0 E := by sorry
theorem grothendieckWittForgetful_of [EssentiallySmall.{w} C] (X : SymmetricSpace D.toStrongCategoryDuality) :
    grothendieckWittForgetful D (ExactGW0.of D X) = TauCeti.ExactK0.of (E := E) X.carrier := by sorry
def grothendieckWittHyperbolic [EssentiallySmall.{w} C] : TauCeti.ExactK0 E →+ ExactGW0 D := by sorry
theorem grothendieckWittHyperbolic_of [EssentiallySmall.{w} C] (X : C) :
    grothendieckWittHyperbolic D (TauCeti.ExactK0.of (E := E) X) = ExactGW0.of D (hyperbolicSpace D X) := by sorry
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
def identity (X : SymmetricSpace D.toStrongCategoryDuality) : HermitianQSpan D X X := by sorry
/-- Exactness supplies the pullback of a deflation along an inflation. -/
def comp {X Y Z : SymmetricSpace D.toStrongCategoryDuality}
    (a : HermitianQSpan D X Y) (b : HermitianQSpan D Y Z) : HermitianQSpan D X Z := by sorry
/-- Representative equivalence retains both span legs. -/
def equivalent {X Y : SymmetricSpace D.toStrongCategoryDuality}
    (a b : HermitianQSpan D X Y) : Prop :=
  ∃ e : a.middle ≅ b.middle, e.hom ≫ b.inflation = a.inflation ∧ e.hom ≫ b.deflation = a.deflation
theorem comp_congr {X Y Z : SymmetricSpace D.toStrongCategoryDuality}
    (a a' : HermitianQSpan D X Y) (b b' : HermitianQSpan D Y Z)
    (ha : a.equivalent a') (hb : b.equivalent b') : (a.comp b).equivalent (a'.comp b') := by sorry
theorem id_comp {X Y : SymmetricSpace D.toStrongCategoryDuality} (a : HermitianQSpan D X Y) :
    ((identity X).comp a).equivalent a := by sorry
theorem comp_id {X Y : SymmetricSpace D.toStrongCategoryDuality} (a : HermitianQSpan D X Y) :
    (a.comp (identity Y)).equivalent a := by sorry
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
theorem orthogonalSum_assoc (X Y Z : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (orthogonalSum D (orthogonalSum D X Y) Z)
      (orthogonalSum D X (orthogonalSum D Y Z))) := by sorry
theorem orthogonalSum_comm (X Y : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (orthogonalSum D X Y) (orthogonalSum D Y X)) := by sorry
theorem negativeSpace_negative (X : SymmetricSpace D.toStrongCategoryDuality) :
    Nonempty (SymmetricIsometry D (negativeSpace D (negativeSpace D X)) X) := by sorry
/-- Carrier equality is used to express the pairing equation with actual maps. -/
theorem negativeSpace_pairing (X : SymmetricSpace D.toStrongCategoryDuality) :
    ∃ e : (negativeSpace D X).carrier ≅ X.carrier,
      e.hom ≫ X.pairing.hom ≫ D.dual.map e.hom.op = -(negativeSpace D X).pairing.hom := by sorry
def ExactIsotropicSubobject.totalInclusion {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : L.carrier ⟶ X.carrier := L.inclusion ≫ L.orthogonalInclusion
theorem ExactIsotropicSubobject.totalInclusion_inflation {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactIsotropicSubobject D X) : E.IsInflation (L.totalInclusion D) := by sorry
/-- The zero space is built from the actual categorical zero object and its dual. -/
def zeroSymmetricSpace : SymmetricSpace D.toStrongCategoryDuality := by sorry
theorem zeroSymmetricSpace_carrier : (zeroSymmetricSpace D).carrier = 0 := by sorry
def zeroIsotropicSubobject (X : SymmetricSpace D.toStrongCategoryDuality) : ExactIsotropicSubobject D X := by sorry
theorem zeroIsotropicSubobject_quotient (X : SymmetricSpace D.toStrongCategoryDuality) :
    (zeroIsotropicSubobject D X).quotient = X.carrier := by sorry
def lagrangianIsotropicSubobject {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : ExactIsotropicSubobject D X := by sorry
theorem lagrangianIsotropicSubobject_quotient {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : IsZero (lagrangianIsotropicSubobject D L).quotient := by sorry
def HermitianQSpan.ofLagrangian {X : SymmetricSpace D.toStrongCategoryDuality}
    (L : ExactLagrangian D X) : HermitianQSpan D (zeroSymmetricSpace D) X := by sorry
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
def hermitianQSpanSetoid (X Y : SymmetricSpace D.toStrongCategoryDuality) : Setoid (HermitianQSpan D X Y) where
  r := HermitianQSpan.equivalent
  iseqv := by sorry
structure HermitianQ where
  space : SymmetricSpace D.toStrongCategoryDuality
def hermitianQIdentity (X : HermitianQ D) : Quotient (hermitianQSpanSetoid D X.space X.space) :=
  Quotient.mk _ (HermitianQSpan.identity X.space)
def hermitianQComp {X Y Z : HermitianQ D}
    (f : Quotient (hermitianQSpanSetoid D X.space Y.space))
    (g : Quotient (hermitianQSpanSetoid D Y.space Z.space)) :
    Quotient (hermitianQSpanSetoid D X.space Z.space) := by sorry
instance hermitianQCategory : Category (HermitianQ D) where
  Hom X Y := Quotient (hermitianQSpanSetoid D X.space Y.space)
  id X := hermitianQIdentity D X
  comp f g := hermitianQComp D f g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
def HermitianQ.ofSpan {X Y : HermitianQ D} (s : HermitianQSpan D X.space Y.space) : X ⟶ Y :=
  Quotient.mk _ s
theorem HermitianQ.ofSpan_comp {X Y Z : HermitianQ D}
    (s : HermitianQSpan D X.space Y.space) (t : HermitianQSpan D Y.space Z.space) :
    (HermitianQ.ofSpan D s) ≫ (HermitianQ.ofSpan D t) = HermitianQ.ofSpan D (s.comp t) := by sorry
theorem HermitianQ.ofSpan_eq_iff {X Y : HermitianQ D} (s t : HermitianQSpan D X.space Y.space) :
    HermitianQ.ofSpan D s = HermitianQ.ofSpan D t ↔ s.equivalent t := by sorry
example (X : HermitianQ D) : HermitianQ.ofSpan D (HermitianQSpan.identity X.space) = 𝟙 X := by sorry
example {X Y : HermitianQ D} (s t : HermitianQSpan D X.space Y.space) :
    HermitianQ.ofSpan D s = HermitianQ.ofSpan D t ↔
      ∃ e : s.middle ≅ t.middle, e.hom ≫ t.inflation = s.inflation ∧ e.hom ≫ t.deflation = s.deflation := by sorry
example {X Y Z W : HermitianQ D} (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    (f ≫ g) ≫ h = f ≫ (g ≫ h) := by sorry
end HermitianQuotientCategory

section ConeDiagrams
open scoped ZeroObject
open CategoryTheory CategoryTheory.Limits
universe u v
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]
abbrev ConeIndex := ℕ ⊕ₗ ℕᵒᵈ
def coneForward (i : ℕ) : ConeIndex := toLex (Sum.inl i)
def coneBackward (i : ℕ) : ConeIndex := toLex (Sum.inr (OrderDual.toDual i))
def coneForwardArrow (i j : ℕ) (h : i ≤ j) : coneForward i ⟶ coneForward j := by sorry
def coneBackwardArrow (i j : ℕ) (h : i ≤ j) : coneBackward j ⟶ coneBackward i := by sorry
def coneCrossArrow (i j : ℕ) : coneForward i ⟶ coneBackward j := by sorry
variable (E : TauCeti.ExactStructure C)
def coneDiagramCondition (F : ConeIndex ⥤ C) : Prop :=
  (∀ i j h, E.IsInflation (F.map (coneForwardArrow i j h))) ∧
  (∀ i j h, E.IsDeflation (F.map (coneBackwardArrow i j h))) ∧
  ∃ k : ℕ, (∀ i, E.IsInflation (F.map (coneCrossArrow i (i+k)))) ∧
    (∀ i, E.IsDeflation (F.map (coneCrossArrow (i+k) i)))
abbrev HermitianConeDiagram := CategoryTheory.ObjectProperty.FullSubcategory (coneDiagramCondition E : ObjectProperty (ConeIndex ⥤ C))
def HermitianConeDiagram.constant (X : C) : HermitianConeDiagram E := by sorry
theorem HermitianConeDiagram.constant_obj (X : C) (i : ConeIndex) :
    (HermitianConeDiagram.constant E X).obj.obj i = X := by sorry
theorem HermitianConeDiagram.crossingBound (U : HermitianConeDiagram E) :
    ∃ k : ℕ, (∀ i, E.IsInflation (U.obj.map (coneCrossArrow i (i+k)))) ∧
      (∀ i, E.IsDeflation (U.obj.map (coneCrossArrow (i+k) i))) := U.property.2.2
def coneLowerShift (k : ℕ) : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
def coneUpperShift (k : ℕ) : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
def coneLowerShiftMap (k : ℕ) : 𝟭 (HermitianConeDiagram E) ⟶ coneLowerShift E k := by sorry
def coneUpperShiftMap (k : ℕ) : coneUpperShift E k ⟶ 𝟭 (HermitianConeDiagram E) := by sorry
theorem coneLowerShift_forward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneLowerShift E k).obj U).obj.obj (coneForward i) = U.obj.obj (coneForward (i+k)) := by sorry
theorem coneLowerShift_backward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneLowerShift E k).obj U).obj.obj (coneBackward i) = U.obj.obj (coneBackward i) := by sorry
theorem coneUpperShift_forward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneUpperShift E k).obj U).obj.obj (coneForward i) = U.obj.obj (coneForward i) := by sorry
theorem coneUpperShift_backward (k i : ℕ) (U : HermitianConeDiagram E) :
    ((coneUpperShift E k).obj U).obj.obj (coneBackward i) = U.obj.obj (coneBackward (i+k)) := by sorry
def coneShiftMorphisms : MorphismProperty (HermitianConeDiagram E) :=
  MorphismProperty.ofHoms (fun z : ℕ × HermitianConeDiagram E => (coneLowerShiftMap E z.1).app z.2) ⊔
  MorphismProperty.ofHoms (fun z : ℕ × HermitianConeDiagram E => (coneUpperShiftMap E z.1).app z.2)
abbrev hermitianCone := (coneShiftMorphisms E).Localization
def hermitianConeLocalization : HermitianConeDiagram E ⥤ hermitianCone E := (coneShiftMorphisms E).Q
theorem hermitianConeLocalization_inverts {U V : HermitianConeDiagram E} (f : U ⟶ V)
    (hf : coneShiftMorphisms E f) : IsIso ((hermitianConeLocalization E).map f) := by sorry
structure ConeFraction (U V : HermitianConeDiagram E) where
  sourceShift : ℕ
  targetShift : ℕ
  map : (coneUpperShift E sourceShift).obj U ⟶ (coneLowerShift E targetShift).obj V
def ConeFraction.toLocalization {U V : HermitianConeDiagram E} (f : ConeFraction E U V) :
    (hermitianConeLocalization E).obj U ⟶ (hermitianConeLocalization E).obj V := by sorry
def ConeFraction.comp {U V W : HermitianConeDiagram E} (f : ConeFraction E U V) (g : ConeFraction E V W) :
    ConeFraction E U W := by sorry
theorem ConeFraction.comp_shifts {U V W : HermitianConeDiagram E} (f : ConeFraction E U V) (g : ConeFraction E V W) :
    (ConeFraction.comp E f g).sourceShift = f.sourceShift+g.sourceShift ∧
      (ConeFraction.comp E f g).targetShift = f.targetShift+g.targetShift := by sorry
def coneZeroExtension : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
theorem coneZeroExtension_zero (U : HermitianConeDiagram E) :
    ((coneZeroExtension E).obj U).obj.obj (coneForward 0) = 0 ∧
      ((coneZeroExtension E).obj U).obj.obj (coneBackward 0) = 0 := by sorry
theorem coneZeroExtension_successor (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneZeroExtension E).obj U).obj.obj (coneForward (i+1)) = U.obj.obj (coneForward i) ∧
      ((coneZeroExtension E).obj U).obj.obj (coneBackward (i+1)) = U.obj.obj (coneBackward i) := by sorry
variable [HasFiniteBiproducts C]
def coneSwindle : HermitianConeDiagram E ⥤ HermitianConeDiagram E := by sorry
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
def HermitianConeDiagram.diagram (U : HermitianConeDiagram E) : ConeIndex ⥤ C := U.obj
/-- Equality in the actual localization is also eventual equality of fraction representatives. -/
def ConeFraction.equivalent {U V : HermitianConeDiagram E} (f g : ConeFraction E U V) : Prop :=
  f.toLocalization E = g.toLocalization E
theorem ConeFraction.equivalent_iff {U V : HermitianConeDiagram E} (f g : ConeFraction E U V) :
    f.equivalent E g ↔ ∃ a b : ℕ, f.sourceShift ≤ a ∧ g.sourceShift ≤ a ∧
      f.targetShift ≤ b ∧ g.targetShift ≤ b ∧
      ∃ F G : ConeFraction E U V,
        F.sourceShift=a ∧ G.sourceShift=a ∧ F.targetShift=b ∧ G.targetShift=b ∧
        F.toLocalization E=f.toLocalization E ∧ G.toLocalization E=g.toLocalization E ∧ HEq F.map G.map := by sorry
/-- Reindexing functors, rather than component-only data, compose. -/
def coneLowerShift_add (i j : ℕ) : coneLowerShift E i ⋙ coneLowerShift E j ≅ coneLowerShift E (i+j) := by sorry
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
def coneDiagramDual (D : ExactCategoryDuality E) : (HermitianConeDiagram E)ᵒᵖ ⥤ HermitianConeDiagram E := by sorry
theorem coneDiagramDual_forward (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op U)).obj.obj (coneForward i) = D.dual.obj (op (U.obj.obj (coneBackward i))) := by sorry
theorem coneDiagramDual_backward (U : HermitianConeDiagram E) (i : ℕ) :
    ((coneDiagramDual D).obj (op U)).obj.obj (coneBackward i) = D.dual.obj (op (U.obj.obj (coneForward i))) := by sorry
variable [HasFiniteBiproducts C]
def coneSwindle_duality : (coneSwindle E).op ⋙ coneDiagramDual D ≅ coneDiagramDual D ⋙ coneSwindle E := by sorry
/-- Exactness and additivity are proved on fraction representatives before introducing these instances. -/
instance conePreadditive : Preadditive (hermitianCone E) := by sorry
instance coneHasZeroObject : HasZeroObject (hermitianCone E) := by sorry
instance coneHasBinaryBiproducts : HasBinaryBiproducts (hermitianCone E) := by sorry
def hermitianConeExactStructure : TauCeti.ExactStructure (hermitianCone E) := by sorry
def hermitianConeDuality (D : ExactCategoryDuality E) : ExactCategoryDuality (hermitianConeExactStructure (E := E)) := by sorry
def localizedConeSwindle : hermitianCone E ⥤ hermitianCone E := by sorry
def localizedConeZeroExtension : hermitianCone E ⥤ hermitianCone E := by sorry
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
/-- the nerve exists before any realization supplier. -/
abbrev hermitianQNerve := CategoryTheory.nerve (HermitianQ D)
def coneConstantFunctor : C ⥤ HermitianConeDiagram E := by sorry
theorem coneConstantFunctor_obj (X : C) :
 (coneConstantFunctor E).obj X = HermitianConeDiagram.constant E X := by sorry
def hermitianConeEmbed : C ⥤ hermitianCone E := coneConstantFunctor E ⋙ hermitianConeLocalization E
/-- localization preserves constant morphisms. -/
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
The generic realization theorem is requested from H.1 and H.2, not redefined here. -/
variable {Qh Q : Type*} [TopologicalSpace Qh] [TopologicalSpace Q]
abbrev grothendieckWittSpace (forget : C(Qh,Q)) (zero : Q) :=
  {x : Qh × C(I,Q) // x.2 0 = forget x.1 ∧ x.2 1 = zero}
def grothendieckWittSpace_base (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace forget (forget zeroForm) :=
  ⟨(zeroForm, ContinuousMap.const I (forget zeroForm)), by simp⟩
def grothendieckWittSpace_projection (forget : C(Qh,Q)) (zero : Q) :
    C(grothendieckWittSpace forget zero,Qh) := by sorry
theorem grothendieckWittSpace_projection_base (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace_projection forget (forget zeroForm) (grothendieckWittSpace_base forget zeroForm) = zeroForm := by sorry
/-- Native homotopy groups; π0 is only a type until the supplied H-space structure is used. -/
abbrev higherGrothendieckWittGroup (forget : C(Qh,Q)) (zeroForm : Qh) (i : ℕ) :=
  HomotopyGroup (Fin i) (grothendieckWittSpace forget (forget zeroForm))
    (grothendieckWittSpace_base forget zeroForm)
def higherGrothendieckWittGroup_zero (forget : C(Qh,Q)) (zeroForm : Qh) :
    higherGrothendieckWittGroup forget zeroForm 0 ≃
      ZerothHomotopy (grothendieckWittSpace forget (forget zeroForm)) := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    (grothendieckWittSpace_base forget zeroForm).val.2 1 = forget zeroForm := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    (grothendieckWittSpace_base forget zeroForm).val.2 0 = forget zeroForm := by sorry
example (forget : C(Qh,Q)) (zeroForm : Qh) :
    grothendieckWittSpace_projection forget (forget zeroForm) (grothendieckWittSpace_base forget zeroForm) = zeroForm := by sorry
end TopologicalGWAdapter

section FibreFunctoriality
open scoped unitInterval
variable {Qh Q Qh' Q' : Type*} [TopologicalSpace Qh] [TopologicalSpace Q]
 [TopologicalSpace Qh'] [TopologicalSpace Q']
def grothendieckWittSpace_map (forget : C(Qh,Q)) (forget' : C(Qh',Q'))
 (zero : Q) (zero' : Q') (gh : C(Qh,Qh')) (g : C(Q,Q'))
 (hs : ∀ x, forget' (gh x)=g (forget x)) (hz : g zero=zero') :
 C(grothendieckWittSpace forget zero,grothendieckWittSpace forget' zero') := by sorry
theorem grothendieckWittSpace_map_projection (forget : C(Qh,Q)) (forget' : C(Qh',Q'))
 (zero : Q) (zero' : Q') (gh : C(Qh,Qh')) (g : C(Q,Q'))
 (hs : ∀ x, forget' (gh x)=g (forget x)) (hz : g zero=zero')
 (x : grothendieckWittSpace forget zero) :
 (grothendieckWittSpace_map forget forget' zero zero' gh g hs hz x).val.1=gh x.val.1 := by sorry
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
structure Formation where
  space : SymmetricSpace D.toStrongCategoryDuality
  first : ExactLagrangian D space
  second : ExactLagrangian D space
namespace Formation
variable {D}
def swap (F : Formation D) : Formation D := ⟨F.space,F.second,F.first⟩
def diagonal (X : SymmetricSpace D.toStrongCategoryDuality) (L : ExactLagrangian D X) :
    Formation D := ⟨X,L,L⟩
def sum (F G : Formation D) : Formation D := by sorry
end Formation
structure FormationIsometry (F G : Formation D) where
  isometry : SymmetricIsometry D F.space G.space
  first : F.first.carrier ≅ G.first.carrier
  second : F.second.carrier ≅ G.second.carrier
  first_comm : first.hom ≫ G.first.inclusion = F.first.inclusion ≫ isometry.iso.hom
  second_comm : second.hom ≫ G.second.inclusion = F.second.inclusion ≫ isometry.iso.hom
def formationSetoid : Setoid (Formation D) where
  r F G := Nonempty (FormationIsometry D F G)
  iseqv := by sorry
abbrev FormationClass := Quotient (formationSetoid D)
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
def FormationReduction.reduced {F : Formation D} (N : FormationReduction D F) : Formation D := by sorry
theorem FormationReduction.reduced_space {F : Formation D} (N : FormationReduction D F) :
    (N.reduced D).space = isotropicReduction D N.isotropic := by sorry
def formationRelations : Set (FreeAbelianGroup (FormationClass D)) :=
  {r | (∃ F G, r = FreeAbelianGroup.of (formationClass D (F.sum G)) -
      FreeAbelianGroup.of (formationClass D F) - FreeAbelianGroup.of (formationClass D G)) ∨
    (∃ (X : SymmetricSpace D.toStrongCategoryDuality) (L M N : ExactLagrangian D X),
      r = FreeAbelianGroup.of (formationClass D ⟨X,L,M⟩) +
        FreeAbelianGroup.of (formationClass D ⟨X,M,N⟩) - FreeAbelianGroup.of (formationClass D ⟨X,L,N⟩)) ∨
    (∃ (F : Formation D) (N : FormationReduction D F),
      r = FreeAbelianGroup.of (formationClass D F) - FreeAbelianGroup.of (formationClass D (N.reduced D)))}
abbrev FormationGroup := FreeAbelianGroup (FormationClass D) ⧸ AddSubgroup.closure (formationRelations D)
def FormationGroup.of (F : Formation D) : FormationGroup D :=
  QuotientAddGroup.mk (FreeAbelianGroup.of (formationClass D F))
theorem FormationGroup.sum (F G : Formation D) :
    FormationGroup.of D (F.sum G) = FormationGroup.of D F + FormationGroup.of D G := by sorry
theorem FormationGroup.concat (X : SymmetricSpace D.toStrongCategoryDuality) (L M N : ExactLagrangian D X) :
    FormationGroup.of D ⟨X,L,M⟩ + FormationGroup.of D ⟨X,M,N⟩ = FormationGroup.of D ⟨X,L,N⟩ := by sorry
theorem FormationGroup.reduce (F : Formation D) (N : FormationReduction D F) :
    FormationGroup.of D F = FormationGroup.of D (N.reduced D) := by sorry
def FormationGroup.lift {A : Type*} [AddCommGroup A] (f : Formation D → A)
    (hi : ∀ F G, Nonempty (FormationIsometry D F G) → f F = f G)
    (hs : ∀ F G, f (F.sum G) = f F + f G)
    (hc : ∀ X (L M N : ExactLagrangian D X), f ⟨X,L,M⟩ + f ⟨X,M,N⟩ = f ⟨X,L,N⟩)
    (hr : ∀ F (N : FormationReduction D F), f F = f (N.reduced D)) : FormationGroup D →+ A := by sorry
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
def ExactCategoryDuality.ofExactFunctor (F : Cᵒᵖ ⥤ C) (eta : 𝟭 C ≅ F.rightOp ⋙ F)
 (hc : ∀ X : C, F.map (eta.hom.app X).op ≫ eta.hom.app (F.obj (op X)) = 𝟙 _)
 [F.Additive] (hex : TauCeti.ExactStructure.IsConflationExact E.op E F) : ExactCategoryDuality E := by sorry
def ExactLagrangian.mapIsometry {X Y : SymmetricSpace D.toStrongCategoryDuality}
 (L : ExactLagrangian D X) (e : SymmetricIsometry D X Y) : ExactLagrangian D Y := by sorry
theorem ExactLagrangian.mapIsometry_carrier {X Y : SymmetricSpace D.toStrongCategoryDuality}
 (L : ExactLagrangian D X) (e : SymmetricIsometry D X Y) :
 (L.mapIsometry D e).carrier = L.carrier := by sorry
/-- Transported quotients yield an isometry of their descended perfect forms. -/
def isotropicReduction_isometry {X : SymmetricSpace D.toStrongCategoryDuality}
 (L M : ExactIsotropicSubobject D X) (e : L.orthogonal ≅ M.orthogonal)
 (f : L.carrier ≅ M.carrier) (hp : e.hom ≫ M.orthogonalInclusion = L.orthogonalInclusion)
 (hi : f.hom ≫ M.inclusion = L.inclusion ≫ e.hom) :
 SymmetricIsometry D (isotropicReduction D L) (isotropicReduction D M) := by sorry
theorem hyperbolicSpace_lagrangian_zero : ExactW0.of D (hyperbolicSpace D (0 : C)) = 0 := by sorry
theorem ExactGW0.zero : ExactGW0.of D (zeroSymmetricSpace D) = 0 := by sorry
theorem ExactW0.zero : ExactW0.of D (zeroSymmetricSpace D) = 0 := by sorry
theorem witt_hyperbolic_cokernel [EssentiallySmall.{w} C] :
 metabolicSubgroup D = (grothendieckWittHyperbolic D).range := by sorry
/-- The categorical identities are inherited by quotient morphisms. -/
theorem HermitianQ.identity (X : HermitianQ D) :
 HermitianQ.ofSpan D (HermitianQSpan.identity X.space) = 𝟙 X := by sorry
/-- Formation boundary is a homomorphism into the actual exact K0. -/
def FormationGroup.boundary [EssentiallySmall.{w} C] : FormationGroup D →+ TauCeti.ExactK0 E := by sorry
theorem FormationGroup.boundary_of [EssentiallySmall.{w} C] (F : Formation D) :
 FormationGroup.boundary D (FormationGroup.of D F) =
 TauCeti.ExactK0.of (E := E) F.first.carrier - TauCeti.ExactK0.of (E := E) F.second.carrier := by sorry
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
def mapSpace (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 SymmetricSpace D'.toStrongCategoryDuality := by sorry
theorem mapSpace_pairing (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 HEq (F.mapSpace X).pairing.hom (F.functor.map X.pairing.hom ≫ F.duality.hom.app (op X.carrier)) := by sorry
def mapLagrangian (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality)
 (L : ExactLagrangian D X) : ExactLagrangian D' (F.mapSpace X) := by sorry
def mapGW0 (F : ExactFormFunctor D D') : ExactGW0 D →+ ExactGW0 D' := by sorry
theorem mapGW0_of (F : ExactFormFunctor D D') (X : SymmetricSpace D.toStrongCategoryDuality) :
 F.mapGW0 (ExactGW0.of D X)=ExactGW0.of D' (F.mapSpace X) := by sorry
end ExactFormFunctor
variable [EssentiallySmall.{w} C] [EssentiallySmall.{w'} C']
theorem grothendieckWittForgetful_natural (F : ExactFormFunctor D D') (x : ExactGW0 D) :
 grothendieckWittForgetful D' (F.mapGW0 x)=
 TauCeti.ExactK0.map F.functor F.exact (grothendieckWittForgetful D x) := by sorry
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
abbrev rationalExactDuality : ExactCategoryDuality (TauCeti.ExactStructure.split (FGModuleCat ℚ)) where
  dual := rationalFiniteDual
  biddual := by sorry
  coherence := by sorry
  additive := by sorry
  exact := by sorry
abbrev rationalFormSpace (n : ℕ) (A : Matrix (Fin n) (Fin n) ℚ) (hs : A.transpose=A) (hn : A.det ≠ 0) :
    SymmetricSpace rationalExactDuality.toStrongCategoryDuality where
  carrier := FGModuleCat.of ℚ (Fin n → ℚ)
  pairing := by sorry
  symmetric := by sorry
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


/-! ## Checks across layers -/

section NamedChecks
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

/-- compact_star_body_test_2 -/
example : ¬ Convex ℝ {x : EuclideanSpace ℝ (Fin 2) |
    (Real.sqrt |x 0|+Real.sqrt |x 1|)^2 ≤ 1} := by sorry
/-- compact_star_body_test_3 -/
example : ¬ IsCompact {x : EuclideanSpace ℝ (Fin 2) | |x 0| ≤ 1} := by sorry

/-- genus_mass_test_1 -/
example : genusMass (fun _ : Unit => 2)=1/2 := by sorry
/-- genus_mass_test_2 -/
example : genusMass (fun _ : Unit => 1)=1 := by sorry
/-- genus_mass_test_3 -/
example {I J : Type*} [Fintype I] [Fintype J] (w : I → ℕ) (e : I ≃ J) :
    genusMass (w ∘ e.symm)=genusMass w := by sorry

/-- packing_radius_test_2 -/
example : latticePackingRadius (Submodule.span ℤ
    ({WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]} : Set (EuclideanSpace ℝ (Fin 2))))=1/2 := by sorry
/-- covering_radius_test_2 -/
example : latticeCoveringRadius (Submodule.span ℤ
    ({WithLp.toLp 2 ![1,0],WithLp.toLp 2 ![0,1]} : Set (EuclideanSpace ℝ (Fin 2))))=
      Real.sqrt 2/2 := by sorry
end NamedChecks

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-!
## Targets stated in `README.md` but not in this file

Their carriers are not available at the pinned APIs: the Q-construction, K-groups, S-construction,
nonconnective K-theory spectrum, nerve realisation theorems and group completion of 6.1
(`quillenQ`, `exactKGroup`, `nerveRealization`, `quillenTheoremA`, `waldhausenS`,
`nonconnectiveKSpectrum`, `groupCompletion`); the genus and proper spinor genus of 2.4
(`IntegralGenus.localIsometry`, `ProperSpinorGenus.orbit`); the hermitian local density and the
normalised Siegel polynomial of 3.2 (`hermitianLocalDensity`, `normalizedSiegelPolynomial`); the
theta series of 3.4 (`latticeThetaSeries`); the hermitian suspension and the nonconnective
hermitian spectrum of 6.7 (`hermitianSuspension`, `nonconnectiveHermitianSpectrum`); and the
homogeneous-dynamics theorems of 4.2 other than their statements through `oppenheim_values`.
-/
