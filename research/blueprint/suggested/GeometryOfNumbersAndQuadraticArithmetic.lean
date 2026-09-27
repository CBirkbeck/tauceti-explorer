import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Analysis.InnerProductSpace.GramSchmidtOrtho
import Mathlib.Analysis.InnerProductSpace.Projection.FiniteDimensional
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Basis.Flag
import Mathlib.Data.ZMod.QuotientGroup
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convex.Body
import Mathlib.Analysis.Convex.Gauge
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.Data.Set.Finite.Lemmas
import Mathlib.Data.Set.Card
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.IndexNSmul
import Mathlib.MeasureTheory.Group.GeometryOfNumbers
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive; the roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names and signatures.
Blueprint checkpoint for #1030; every new statement is an unchecked planning obligation.
No replacement lattice, Gram matrix, covolume or measure carrier is introduced.
The primitive-orthogonal proof chain is included. The sharp lower half of Minkowski's second theorem is included; its upper half remains a packet gap.
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



open scoped Pointwise Topology

section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- GN.1/successive-minimum. Zero-based index; no index exists in dimension zero. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) : ℝ :=
  by sorry

/-- Definitional API: scalar invariant on existing carriers. -/
lemma successiveMin_def (L : Submodule ℤ E) (K : ConvexBody E)
    (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})} := by sorry

variable (L : Submodule ℤ E) [hLdis : DiscreteTopology L] [hLfull : IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))

include hLdis hLfull hK

/-- GN.1/finite-gauge-sublevel. Negative, zero and positive bounds are distinguished. -/
lemma finite_gauge_sublevel (r : ℝ) :
    Set.Finite {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r} := by sorry

/-- GN.1/minimum-outside-subspace. No compactness claim about L minus W. -/
lemma exists_min_gauge_outside (W : Submodule ℝ E) (hW : W ≠ ⊤) :
    ∃ v : L, (v : E) ∉ W ∧ 0 < gauge (K : Set E) v ∧
      ∀ x : L, (x : E) ∉ W → gauge (K : Set E) v ≤ gauge (K : Set E) x := by sorry

/-- GN.1/greedy-minimum-family. The prefix flag uses strict gauge inequalities. -/
lemma exists_greedy_gauge_family :
    ∃ v : Fin (finrank ℝ E) → L,
      LinearIndependent ℝ (fun i => (v i : E)) ∧
      (∀ i, 0 < gauge (K : Set E) (v i)) ∧
      Monotone (fun i => gauge (K : Set E) (v i)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < gauge (K : Set E) (v i) →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ (v j : E) = y} := by sorry

/-- GN.1/successive-minimum-is-least. Boundary attainment precedes inequalities. -/
lemma successiveMin_isLeast (i : Fin (finrank ℝ E)) :
    IsLeast {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}
      (successiveMin L K i) := by sorry

/-- GN.1/successive-minimum-pos. There is no uniform bound by one. -/
lemma successiveMin_pos (i : Fin (finrank ℝ E)) : 0 < successiveMin L K i := by sorry

/-- GN.1/successive-minimum-monotone. Repeated values are permitted. -/
lemma successiveMin_monotone : Monotone (successiveMin L K) := by sorry

/-- GN.1/successive-minimum-le-iff. The body is compact and the dilate is closed. -/
lemma successiveMin_le_iff (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K i ≤ r ↔ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ ((L : Set E) ∩ r • (K : Set E))) := by sorry

/-- GN.1/successive-minimum-witnesses. A real basis, with integral entries. -/
theorem exists_successiveMin_witnesses :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E,
      (∀ i, b i ∈ L) ∧
      (∀ i, gauge (K : Set E) (b i) = successiveMin L K i) ∧
      (∀ i, b i ∈ successiveMin L K i • (K : Set E)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ b j = y} := by sorry

/-- GN.1/successive-minimum-antitone-body. -/
lemma successiveMin_antitone_body (K' : ConvexBody E)
    (hK' : (0 : E) ∈ interior (K' : Set E)) (hKK' : K ≤ K')
    (i : Fin (finrank ℝ E)) : successiveMin L K' i ≤ successiveMin L K i := by sorry

/-- GN.1/successive-minimum-monotone-lattice. -/
lemma successiveMin_monotone_lattice (M : Submodule ℤ E)
    [DiscreteTopology M] [IsZLattice ℝ M] (hLM : L ≤ M)
    (i : Fin (finrank ℝ E)) : successiveMin M K i ≤ successiveMin L K i := by sorry

/-- GN.1/successive-minimum-smul-body. The scalar must be positive. -/
lemma successiveMin_smul_body (c : ℝ) (hc : 0 < c) (i : Fin (finrank ℝ E)) :
    successiveMin L (c • K) i = successiveMin L K i / c := by sorry

/-- GN.1/successive-minimum-linear-equiv. Both input carriers move. -/
lemma successiveMin_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) [DiscreteTopology L'] [IsZLattice ℝ L']
    (K' : ConvexBody F) (hK' : (0 : F) ∈ interior (K' : Set F))
    (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E))
    (i : Fin (finrank ℝ E)) (j : Fin (finrank ℝ F)) (hij : i.val = j.val) :
    successiveMin L' K' j = successiveMin L K i := by sorry

/-- GN.1/successive-minimum-first. This does not reprove Minkowski first. -/
lemma successiveMin_first_le_iff (hd : 0 < finrank ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K ⟨0, hd⟩ ≤ r ↔
      ∃ x : E, x ∈ L ∧ x ≠ 0 ∧ x ∈ r • (K : Set E) := by sorry

end SuccessiveMinima

section Crosspolytope
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {n : ℕ}

/-- GN.1/weighted-crosspolytope-volume. The standard l1 volume is already Mathlib. -/
lemma weighted_crosspolytope_volume (o : OrthonormalBasis (Fin n) ℝ E)
    (b : Basis (Fin n) ℝ E) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : E | ∑ i, a i * |b.repr x i| ≤ 1} =
      ENNReal.ofReal (((2 : ℝ)^n / (Nat.factorial n : ℝ)) *
        |o.toBasis.det b| / ∏ i, a i) := by sorry

/-- GN.1/crosspolytope-containment. The gauge proof keeps symmetry explicit. -/
lemma weighted_crosspolytope_subset {V : Type*} [NormedAddCommGroup V]
    [NormedSpace ℝ V] (K : ConvexBody V)
    (hK : (0 : V) ∈ interior (K : Set V)) (hsym : ∀ x ∈ K, -x ∈ K)
    (b : Basis (Fin n) ℝ V) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i)
    (hb : ∀ i, b i ∈ a i • (K : Set V)) :
    {x : V | ∑ i, a i * |b.repr x i| ≤ 1} ⊆ (K : Set V) := by sorry

/-- GN.1/lattice-determinant-lower-bound. Independent lattice vectors can have index > 1. -/
lemma covolume_le_abs_basis_det (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (o : OrthonormalBasis (Fin n) ℝ E) (b : Basis (Fin n) ℝ E)
    (hb : ∀ i, b i ∈ L) : ZLattice.covolume L ≤ |o.toBasis.det b| := by sorry

/-- GN.1/minkowski-second-lower. Includes dimension zero, with empty product one. -/
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

/-- GN.1/rectangular-body-minima. The positive-coordinate body supplies its own interior. -/
theorem successiveMin_box
    (hK : (K : Set E) = {x : E | ∀ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

/-- GN.1/crosspolytope-minima. A proof plan for Evertse Exercise 2.9. -/
theorem successiveMin_crosspolytope
    (hK : (K : Set E) = {x : E | ∑ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

end PrescribedMinima


section LinearForms

/-- GN.1/linear-forms-box-volume. Absolute determinant, with the empty case included. -/
lemma linear_forms_box_volume {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : A.det ≠ 0) (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) :
    volume {x : Fin n → ℝ | ∀ i, |(Matrix.mulVec A x) i| ≤ a i} =
      ENNReal.ofReal ((2 : ℝ)^n * (∏ i, a i) / |A.det|) := by sorry

/-- GN.1/minkowski-linear-forms. Exact requested compact-boundary export. -/
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

section LatticePointCounting

/-- GN.4/coset-difference-bound. Finite index excludes the infinite-index sentinel. -/
lemma ncard_le_index_mul {G : Type*} [AddCommGroup G]
    (N : AddSubgroup G) [N.FiniteIndex] (S T : Set G)
    (hT : T.Finite)
    (hsub : ∀ x ∈ S, ∀ y ∈ S, x - y ∈ N → x - y ∈ T) :
    S.ncard ≤ N.index * T.ncard := by sorry

/-- GN.4/residue-separation-count. The basis must be integral and span the whole group. -/
lemma ncard_le_pow_of_no_congruent {G : Type*} [AddCommGroup G]
    {n : ℕ} (b : Basis (Fin n) ℤ G) (q : ℕ) (hq : 0 < q) (S : Set G)
    (hsep : ∀ x ∈ S, ∀ y ∈ S, (∃ z : G, x - y = (q : ℤ) • z) → x = y) :
    S.ncard ≤ q^n := by sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- GN.4/henk-sublattice-count. Index form of Henk Lemma 2.1, including boundary points. -/
theorem henk_sublattice_count
    (L M : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (hML : M ≤ L) (hindex : M.toAddSubgroup.relIndex L.toAddSubgroup ≠ 0)
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    {x : E | x ∈ L ∧ x ∈ K}.ncard ≤
      M.toAddSubgroup.relIndex L.toAddSubgroup *
        {x : E | x ∈ M ∧ x ∈ (2 : ℝ) • (K : Set E)}.ncard := by sorry

/-- GN.4/homothetic-lattice-avoidance. No symmetry is needed at this intermediate step. -/
lemma homothetic_lattice_avoidance
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hd : 0 < finrank ℝ E) (q : ℕ) (hq : 0 < q)
    (hcut : 2 / (q : ℝ) < successiveMin L K ⟨0, hd⟩) :
    ((q : ℝ) • (L : Set E)) ∩ ((2 : ℝ) • (K : Set E)) = {0} := by sorry

/-- GN.4/first-minimum-count. Henk (1.3), not its product conjecture or Theorem 1.5. -/
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


section IntegralFlag
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- GN.0/prescribed-primitive-basis. Preserve a given basis of the intersection. -/
lemma saturated_adapted_basis_of_basis
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ L W.subtype : Set W) = ⊤)
    {r : ℕ} (c : Basis (Fin r) ℤ (ZLattice.comap ℝ L W.subtype)) :
    ∃ (s : ℕ) (b : Basis (Fin r ⊕ Fin s) ℤ L),
      r+s = finrank ℝ E ∧ ∀ i, (b (Sum.inl i) : E) = ((c i : W) : E) := by sorry

/-- GN.0/integral-rational-flag. The short real vectors need not be an integral basis. -/
lemma exists_integral_basis_same_flag
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (w : Basis (Fin (finrank ℝ E)) ℝ E) (hw : ∀ i, w i ∈ L) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∀ k : Fin (finrank ℝ E+1), (b.ofZLatticeBasis ℝ).flag k = w.flag k := by sorry

/-- GN.1/integral-minimum-flag. No upper bound on the individual basis vectors is claimed. -/
lemma exists_integral_minimum_flag
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E)) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i →
        (x : E) ∈ (b.ofZLatticeBasis ℝ).flag i.castSucc := by sorry
end IntegralFlag

section DivisibilityRounding

/-- GN.4/divisible-rounding-step. Natural subtraction; even a zero remainder advances. -/
lemma divisible_rounding_step (q m : ℕ) (hq : 0 < q) (hm : 0 < m)
    (hupper : m < 2*q) :
    let n := if q ≤ m then m else q+m-q%m
    q ≤ n ∧ n < 2*q ∧ m ∣ n := by sorry

/-- GN.4/divisible-rounding-chain. The last factor is unchanged. -/
lemma exists_divisible_rounding {d : ℕ} (q : Fin d → ℕ)
    (hq : ∀ i, 0 < q i) (hmono : Antitone q) :
    ∃ n : Fin d → ℕ, (∀ i, q i ≤ n i) ∧
      (∀ i, i.val+1 = d → n i = q i) ∧
      (∀ i, i.val+1 < d → n i < 2*q i) ∧
      (∀ i j, i ≤ j → n j ∣ n i) := by sorry

/-- GN.4/divisible-rounding-product. Strictness requires at least two factors. -/
lemma divisible_rounding_product {d : ℕ} (hd : 2 ≤ d)
    (q n : Fin d → ℕ) (hq : ∀ i, 0 < q i) (hn : ∀ i, q i ≤ n i)
    (hlast : ∀ i, i.val+1 = d → n i = q i)
    (hupper : ∀ i, i.val+1 < d → n i < 2*q i) :
    (∏ i, n i) < 2^(d-1) * ∏ i, q i := by sorry

/-- GN.4/diagonal-span-coordinates. No positivity is needed for membership. -/
lemma mem_diagonal_span_iff {G : Type*} [AddCommGroup G] {d : ℕ}
    (b : Basis (Fin d) ℤ G) (n : Fin d → ℕ) (x : G) :
    x ∈ Submodule.span ℤ (Set.range (fun i => (n i : ℤ) • b i)) ↔
      ∀ i, (n i : ℤ) ∣ b.repr x i := by sorry

/-- GN.4/diagonal-span-index. A zero factor gives the native infinite-index sentinel. -/
lemma diagonal_span_index {G : Type*} [AddCommGroup G] {d : ℕ}
    (b : Basis (Fin d) ℤ G) (n : Fin d → ℕ) :
    (Submodule.span ℤ (Set.range (fun i => (n i : ℤ) • b i))).toAddSubgroup.index =
      ∏ i, n i := by sorry
end DivisibilityRounding

section HenkProduct
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- GN.4/diagonal-lattice-avoidance. Divide by the last nonzero coordinate's factor. -/
lemma diagonal_lattice_avoidance
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

/-- GN.4/henk-successive-minima-count. Henk Theorem 1.5, not Conjecture 1.4. -/
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

end TauCeti.GeometryOfNumbersPlan
