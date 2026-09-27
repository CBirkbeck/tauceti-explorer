import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Analysis.InnerProductSpace.GramSchmidtOrtho
import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive; the roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names and signatures.
Blueprint checkpoint for #1030; every new statement is an unchecked planning obligation.
No replacement lattice, Gram matrix, covolume or measure carrier is introduced.
The primitive-orthogonal proof chain is included. Minkowski's second theorem remains a packet gap.
-/
noncomputable section
open scoped BigOperators
open MeasureTheory Module

namespace TauCeti.GeometryOfNumbersPlan

section Gram
variable {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
  [InnerProductSpace 𝕜 E] {n : ℕ}

/-- GN.0/gram-det-orthonormal-coordinates. No independence hypothesis. -/
theorem gram_det_orthonormal_coordinates (b : OrthonormalBasis (Fin n) 𝕜 E)
    (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (‖b.toBasis.det v‖ ^ 2 : ℝ) := by sorry

/-- GN.0/orthonormal-coordinate-hadamard. Includes n = 0. -/
theorem orthonormal_coordinate_hadamard (b : OrthonormalBasis (Fin n) 𝕜 E)
    (v : Fin n → E) :
    ‖b.toBasis.det v‖ ≤ ∏ i, ‖v i‖ := by sorry

/-- GN.0/hermitian-gram-hadamard. E need not be finite-dimensional. -/
theorem hermitian_gram_hadamard (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (RCLike.re (Matrix.gram 𝕜 v).det : 𝕜) ∧
    0 ≤ RCLike.re (Matrix.gram 𝕜 v).det ∧
    RCLike.re (Matrix.gram 𝕜 v).det ≤ ∏ i, ‖v i‖ ^ 2 := by sorry

/-- GN.0/gram-uniform-bound. The bound D is on squared row norms. -/
theorem gram_uniform_bound (v : Fin n → E) (D : ℝ) (hD : 0 ≤ D)
    (hv : ∀ i, ‖v i‖ ^ 2 ≤ D) :
    RCLike.re (Matrix.gram 𝕜 v).det ≤ D ^ n := by sorry

end Gram

/-- GN.0/covolume-square-gram. Intrinsic real volume on E. -/
theorem covolume_square_gram
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {n : ℕ} (b : Basis (Fin n) ℤ L) :
    ZLattice.covolume L ^ 2 =
      (Matrix.gram ℝ (fun i => (b i : E))).det := by sorry

/-- GN.1/ordered-tail-product. Fin n uses zero-based indices. -/
theorem ordered_tail_product {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (i : Fin n) :
    a i ^ (n - i.val) ≤ ∏ j, a j := by sorry

/-- GN.1/ordered-product-root-bound. V ≥ 1 follows, rather than being hidden. -/
theorem ordered_product_root_bound {n : ℕ} (a : Fin n → ℝ) (ha : Monotone a)
    (h1 : ∀ i, 1 ≤ a i) (V : ℝ) (hV : (∏ j, a j) ≤ V) (i : Fin n) :
    a i ≤ Real.rpow V ((n - i.val : ℕ) : ℝ)⁻¹ := by sorry

/-- GN.1/orthonormal-cube-volume. The box lives in E, not an ambient over-space. -/
theorem orthonormal_cube_volume
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    volume {x : E | ∀ i, |b.repr x i| ≤ r} = ENNReal.ofReal ((2 * r) ^ n) := by sorry

/-- GN.1/inscribed-cube. The normalized radius requires positive dimension. -/
theorem inscribed_cube
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    {x : E | ∀ i, |b.repr x i| ≤ (Real.sqrt n)⁻¹} ⊆
      Metric.closedBall (0 : E) 1 := by sorry

/-- GN.1/intrinsic-ball-lower-bound. No spherical surface measure. -/
theorem intrinsic_ball_lower_bound
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {n : ℕ} (b : OrthonormalBasis (Fin n) ℝ E) (hn : 0 < n) :
    ENNReal.ofReal ((2 / Real.sqrt n) ^ n) ≤ volume (Metric.closedBall (0 : E) 1) := by sorry

/- Discriminating contract tests: these are still unproved planning statements.
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

/-- GN.0/saturated-adapted-basis. The comap expresses saturation exactly. -/
theorem saturated_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (r s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ Δ)
      (c : Basis (Fin r) ℤ (ZLattice.comap ℝ Δ W.subtype)),
      ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- GN.0/projected-adapted-basis. No discreteness of the image is assumed. -/
theorem projected_adapted_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℤ Δ) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, (b (Sum.inl i) : E) = (c i : E)) :
    ∃ q : Basis (Fin s) ℝ Wᗮ,
      (∀ j, q j = Wᗮ.orthogonalProjectionOnto (b (Sum.inr j) : E)) ∧
      Submodule.span ℤ (Set.range q) =
        Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ) := by sorry

/-- GN.0/gram-det-adapted-projection. Empty blocks have determinant one. -/
theorem gram_det_adapted_projection
    (W : Submodule ℝ E) {r s : ℕ}
    (b : Basis (Fin r ⊕ Fin s) ℝ E) (c : Basis (Fin r) ℝ W)
    (hc : ∀ i, b (Sum.inl i) = (c i : E)) :
    (Matrix.gram ℝ b).det = (Matrix.gram ℝ c).det *
      (Matrix.gram ℝ (fun j => Wᗮ.orthogonalProjectionOnto (b (Sum.inr j)))).det := by sorry

/-- GN.0/gram-det-biorthogonal. The two real bases are paired, not each orthonormal. -/
theorem gram_det_biorthogonal {n : ℕ}
    (b d : Basis (Fin n) ℝ E)
    (hd : ∀ i j, inner ℝ (b i) (d j) = if i = j then 1 else 0) :
    (Matrix.gram ℝ b).det * (Matrix.gram ℝ d).det = 1 := by sorry

/-- GN.0/dual-projection-comap. Does not need rationality or discreteness. -/
theorem dual_projection_comap
    (Δ : Submodule ℤ E) (W : Submodule ℝ E) :
    LinearMap.BilinForm.dualSubmodule (innerₗ Wᗮ)
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.comap ℝ (LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ) Wᗮ.subtype := by sorry

/-- GN.0/orthogonal-intersection-basis. Fullness is a conclusion. -/
theorem orthogonal_intersection_basis
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ∃ (s : ℕ) (q : Basis (Fin s) ℝ Wᗮ),
      Submodule.span ℤ (Set.range q) = ZLattice.comap ℝ Δ Wᗮ.subtype := by sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- GN.0/covolume-projection. Canonical intrinsic measures in both subspaces. -/
theorem covolume_projection
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.covolume Δ / ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

/-- GN.0/covolume-dual. The intrinsic dual is already Mathlib's dualSubmodule. -/
theorem covolume_dual
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    ZLattice.covolume (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) = (ZLattice.covolume L)⁻¹ := by sorry

/-- GN.0/primitive-orthogonal-covolume. Self-duality cannot be omitted. -/
theorem primitive_orthogonal_covolume
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume (ZLattice.comap ℝ Δ Wᗮ.subtype) =
      ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

end Orthogonal

/- Each named contract below is an unproved example, not an implementation. -/
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


end TauCeti.GeometryOfNumbersPlan
