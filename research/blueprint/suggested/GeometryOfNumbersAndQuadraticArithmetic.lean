import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.Algebra.Module.Lattice
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.SesquilinearForm.Star
import Mathlib.CategoryTheory.Opposites
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Topology.MetricSpace.HausdorffDistance
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
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Measure.NullMeasurable
import Mathlib.Analysis.Convex.Measure
import Mathlib.LinearAlgebra.Determinant
import Mathlib.Data.Pi.Interval
import Mathlib.Data.Int.Interval
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive; the roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names and signatures.
Breadth-first planning pass for #1030; every new statement is an unchecked planning obligation.
No replacement lattice, Gram matrix, covolume or measure carrier is introduced.
The primitive-orthogonal proof chain and both sharp halves of Minkowski's second theorem are planned here; all statements remain unchecked.
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

/-- GN.1/finite-interior-disjoint-volume. Touching boundaries do not count twice in measure. -/
theorem finite_interior_disjoint_translate_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (K : Set E) (hK : IsCompact K) (hconv : Convex ℝ K) (v : ι → E)
    (hdis : Pairwise fun i j => Disjoint
      ((fun x => v i+x) '' interior K) ((fun x => v j+x) '' interior K)) :
    μ (⋃ i, (fun x => v i+x) '' K) = (Fintype.card ι : ℝ≥0∞)*μ K := by sorry

/-- GN.1/finite-translate-section. Sections preserve the finite family of translations. -/
theorem finite_translate_section (v : ι → E) (K : Set (E × F)) (y : F) :
    {x : E | (x,y) ∈ U v K} =
      ⋃ i, (fun x : E => v i+x) '' {x : E | (x,y) ∈ K} := by sorry

/-- GN.1/convex-section-enlargement. No globally measurable center is asserted. -/
theorem convex_section_enlargement (v : ι → E) (K : Set (E × F))
    (hK : Convex ℝ K) (r : ℝ) (hr : 1 ≤ r) (y : F) :
    ∃ t : E, {x : E | (x,y) ∈ U v K} ⊆
      (fun x : E => x+t) '' {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- GN.1/section-union-volume-monotone. Only the original measurable sections will be integrated. -/
theorem section_union_volume_mono (μ : Measure E) [μ.IsAddHaarMeasure]
    (v : ι → E) (K : Set (E × F)) (hK : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) (y : F) :
    μ {x : E | (x,y) ∈ U v K} ≤ μ {x : E | (x,y) ∈ U v (f₁ r '' K)} := by sorry

/-- GN.1/partial-dilation-union-volume. Tonelli on compact unions, not on chosen centers. -/
theorem partial_dilation_union_volume (μ : Measure E) [μ.IsAddHaarMeasure]
    (ν : Measure F) [ν.IsAddHaarMeasure] (v : ι → E)
    (K : Set (E × F)) (hK : IsCompact K) (hconv : Convex ℝ K)
    (r : ℝ) (hr : 1 ≤ r) :
    μ.prod ν (U v K) ≤ μ.prod ν (U v (f₁ r '' K)) := by sorry

/-- GN.1/complementary-dilation-union. A set identity with no analytic assumptions. -/
theorem complementary_dilation_union (v : ι → E) (K : Set (E × F)) (r : ℝ) :
    U v ((fun p : E × F => r • p) '' K) =
      f₂ r '' U v (f₁ r '' K) := by sorry

/-- GN.1/transverse-union-volume. The codimension factor in Henk (3.5). -/
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

/-- GN.1/gauge-linear-equiv. Transform the body and point simultaneously. -/
lemma gauge_linearEquiv {E F : Type*} [AddCommGroup E] [Module ℝ E]
    [AddCommGroup F] [Module ℝ F] (e : E ≃ₗ[ℝ] F) (K : Set E) (x : E) :
    gauge (e '' K) (e x) = gauge K x := by sorry

/-- GN.1/convex-cluster-intersection-null. No convexity of either union is assumed. -/
lemma convex_cluster_intersection_null {E I J : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] [Fintype I] [Fintype J]
    (μ : Measure E) [μ.IsAddHaarMeasure] (A : I → Set E) (B : J → Set E)
    (hA : ∀ i, Convex ℝ (A i)) (hB : ∀ j, Convex ℝ (B j))
    (hdis : ∀ i j, Disjoint (interior (A i)) (interior (B j))) :
    μ ((⋃ i, A i) ∩ ⋃ j, B j) = 0 := by sorry

/-- GN.1/clustered-translate-volume. Only the outer rows are a.e. disjoint. -/
lemma clustered_translate_volume {E I J : Type*}
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

/-- GN.1/strict-flag-translate-separation. Strict threshold; closed boundaries may touch. -/
lemma strict_flag_translate_separation {d : ℕ}
    (K : ConvexBody (Fin d → ℝ)) (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _))
    (hsym : ∀ x ∈ K, -x ∈ K) (t : ℝ) (ht : 0 < t) (k : ℕ) (hk : k ≤ d)
    (hflag : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < t →
      ∀ j : Fin d, k ≤ j.val → z j = 0)
    (x y : Fin d → ℤ) (hxy : ∃ j : Fin d, k ≤ j.val ∧ x j ≠ y j) :
    Disjoint ((fun w : Fin d → ℝ => (fun j => (x j : ℝ))+w) ''
      interior ((t/2) • (K : Set _)))
      ((fun w : Fin d → ℝ => (fun j => (y j : ℝ))+w) ''
      interior ((t/2) • (K : Set _))) := by sorry

/-- GN.1/lattice-box-row-volume. The prefix union may have overlapping translates. -/
lemma lattice_box_row_volume (d k q : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (hdis : ∀ x ∈ Mbox d q, ∀ y ∈ Mbox d q,
      (∃ j : Fin d, k ≤ j.val ∧ x j ≠ y j) →
      Disjoint ((fun w : Fin d → ℝ => (fun j => (x j : ℝ))+w) '' interior S)
        ((fun w : Fin d → ℝ => (fun j => (y j : ℝ))+w) '' interior S)) :
    volume (boxUnion d q S) =
      ((2*q+1 : ℕ) : ℝ≥0∞)^(d-k) * volume (prefixUnion d k q S) := by sorry

/-- GN.1/coordinate-transverse-union-volume. Native coordinate-split product measure. -/
lemma coordinate_transverse_union_volume {I : Type*} [Fintype I] (d k : ℕ) (hk : k ≤ d)
    (S : Set (Fin d → ℝ)) (hS : IsCompact S) (hconv : Convex ℝ S)
    (v : I → Fin d → ℝ) (hv : ∀ i j, k ≤ j.val → v i j = 0)
    (r : ℝ) (hr : 1 ≤ r) :
    ENNReal.ofReal (r^(d-k)) * volume (⋃ i, (fun x => v i+x) '' S) ≤
      volume (⋃ i, (fun x => v i+x) '' (r • S)) := by sorry

/-- GN.1/successive-box-volume-ratio. Includes equality of the two thresholds. -/
lemma flag_box_volume_ratio {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s t : ℝ) (hs : 0 < s) (hst : s ≤ t) (k q : ℕ) (hk : k ≤ d)
    (hflag : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < t →
      ∀ j : Fin d, k ≤ j.val → z j = 0) :
    (t/s)^(d-k) * volume.real (boxUnion d q ((s/2) • (K : Set _))) ≤
      volume.real (boxUnion d q ((t/2) • (K : Set _))) := by sorry

/-- GN.1/first-box-volume. The threshold forbids nonzero strict-sublevel vectors. -/
lemma first_box_volume {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (s : ℝ) (hs : 0 < s)
    (hfirst : ∀ z : Fin d → ℤ, gauge (K : Set _) (fun j => (z j : ℝ)) < s → z = 0)
    (q : ℕ) :
    volume.real (boxUnion d q ((s/2) • (K : Set _))) =
      (2*(q : ℝ)+1)^d * (s/2)^d * volume.real (K : Set (Fin d → ℝ)) := by sorry

/-- GN.1/outer-lattice-box-volume. The radius is chosen independently of q. -/
lemma outer_lattice_box_volume (d : ℕ) (S : Set (Fin d → ℝ)) (hS : IsCompact S) :
    ∃ R : ℝ, 0 ≤ R ∧ ∀ q : ℕ,
      volume.real (boxUnion d q S) ≤ (2*(q : ℝ)+2*R)^d := by sorry

/-- GN.1/weighted-ratio-product. Descending exponents are essential. -/
lemma weighted_ratio_product (n : ℕ) (a : Fin (n+1) → ℝ) (ha : ∀ j, 0 < a j) :
    a 0^(n+1) * (∏ i : Fin n, (a i.succ / a i.castSucc)^(n-i.val)) =
      ∏ j, a j := by sorry

/-- GN.1/weighted-volume-chain. No division by any volume. -/
lemma weighted_volume_chain (n : ℕ) (a V : Fin (n+1) → ℝ)
    (ha : ∀ j, 0 < a j) (hV : ∀ j, 0 ≤ V j) (B : ℝ) (hB : 0 ≤ B)
    (hfirst : a 0^(n+1)*B ≤ V 0)
    (hstep : ∀ i : Fin n, (a i.succ/a i.castSucc)^(n-i.val)*V i.castSucc ≤ V i.succ) :
    (∏ j, a j)*B ≤ V (Fin.last n) := by sorry

/-- GN.1/large-box-comparison-limit. Even d=0 has its native meaning. -/
lemma large_box_comparison_limit (d : ℕ) (R B : ℝ)
    (h : ∀ q : ℕ, (2*(q : ℝ)+1)^d * B ≤ (2*(q : ℝ)+2*R)^d) : B ≤ 1 := by sorry

/-- GN.1/coordinate-flag-upper. The flag is a hypothesis, not a new minimum definition. -/
theorem coordinate_flag_upper (d : ℕ) (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set _)) (hsym : ∀ x ∈ K, -x ∈ K)
    (a : Fin d → ℝ) (ha : ∀ i, 0 < a i) (hmono : Monotone a)
    (hflag : ∀ i : Fin d, ∀ z : Fin d → ℤ,
      gauge (K : Set _) (fun j => (z j : ℝ)) < a i →
      ∀ j : Fin d, i ≤ j → z j = 0) :
    (∏ i, a i) * volume.real (K : Set (Fin d → ℝ)) ≤ 2^d := by sorry

/-- GN.1/minkowski-second-upper. Native intrinsic volume and covolume, including dimension zero. -/
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

end TauCeti.GeometryOfNumbersPlan

namespace TauCeti.GeometryOfNumbersPlan

/-! Breadth pass: all statements below are admitted planning obligations.
Integral carriers reuse native Submodule.IsLattice and QuadraticForm. The new
star-body carrier records the additional nonconvex geometry, not a replacement
for the native ConvexBody. Foreign exact, adelic and stable homotopy interfaces
are explicitly listed after these signatures; no dummy carriers are introduced.
-/

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

section CategoryDuality
open CategoryTheory Opposite
universe u v
variable (C : Type u) [Category.{v} C]

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
  homogeneous : ∀ (a : ℝ), 0≤a → ∀ x, gauge (a • x)=a*gauge x
  compact : IsCompact {x | gauge x≤1}
  originInterior : (0 : E) ∈ interior {x | gauge x≤1}

variable {E}
def CompactStarBody.ofGauge (p : E → ℝ) (hc : Continuous p)
    (hn : ∀ x, 0≤p x) (hz : ∀ x, p x=0 ↔ x=0)
    (hh : ∀ a : ℝ, 0≤a → ∀ x, p (a • x)=a*p x)
    (hk : IsCompact {x | p x≤1}) (hi : (0 : E) ∈ interior {x | p x≤1}) :
    CompactStarBody E := ⟨p,hc,hn,hz,hh,hk,hi⟩
theorem CompactStarBody.radial (K : CompactStarBody E) (a : ℝ) (ha : 0<a) (x : E) :
    K.gauge (a • x)≤1 ↔ K.gauge x≤1/a := by sorry
def CompactStarBody.admissible (K : CompactStarBody E) (L : Submodule ℤ E) : Prop :=
  ∀ x ∈ L, x≠0 → 1≤K.gauge x
def CompactStarBody.convexComparison (K : CompactStarBody E)
    (h : Convex ℝ {x | K.gauge x≤1}) : ConvexBody E :=
  ⟨{x | K.gauge x≤1},h,K.compact,⟨0,by sorry⟩⟩

example (K : CompactStarBody E) : K.gauge 0=0 := by sorry
example (K : CompactStarBody E) : K.gauge (0 • (0 : E))=0 := by sorry
example (K : CompactStarBody E) (h : Convex ℝ {x | K.gauge x≤1}) :
    (K.convexComparison h : Set E)={x | K.gauge x≤1} := by sorry
end StarBodies

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

end TauCeti.GeometryOfNumbersPlan

namespace TauCeti.GeometryOfNumbersPlan

section NativeImportTargets
open scoped Classical nonZeroDivisors
variable (K : Type*) [Field K] [NumberField K]

theorem mixed_embedding_normalization (I : (FractionalIdeal (NumberField.RingOfIntegers K)⁰ K)ˣ) :
    ZLattice.covolume (NumberField.mixedEmbedding.idealLattice K I) =
      FractionalIdeal.absNorm (I : FractionalIdeal (NumberField.RingOfIntegers K)⁰ K) *
        (2⁻¹ : ℝ)^NumberField.InfinitePlace.nrComplexPlaces K *
          Real.sqrt |NumberField.discr K| := by sorry

/-- Re-export the exact pinned Dirichlet statement, with its native quotient instances. -/
abbrev unit_application_import := NumberField.Units.finrank_modTorsion K

theorem ideal_class_application_import (C : ClassGroup (NumberField.RingOfIntegers K)) :
    ∃ I : (Ideal (NumberField.RingOfIntegers K))⁰, ClassGroup.mk0 I=C ∧
      (Ideal.absNorm (I : Ideal (NumberField.RingOfIntegers K)) : ℝ) ≤
        (4/Real.pi)^NumberField.InfinitePlace.nrComplexPlaces K *
          ((Nat.factorial (finrank ℚ K) : ℝ)/(finrank ℚ K : ℝ)^(finrank ℚ K)) *
            Real.sqrt |NumberField.discr K| := by sorry
end NativeImportTargets

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

theorem oppenheim_values {n : ℕ} (hn : 3≤n) (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : ∀ x : Fin n → ℝ, x≠0 →
      ∃ y, q (x+y)-q x-q y ≠ 0)
    (hind : (∃ x, q x>0) ∧ (∃ x, q x<0))
    (hirr : ¬ ∃ c : ℝ, c≠0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ))=c*(r : ℝ)) :
    Dense (Set.range (fun z : Fin n → ℤ => q (fun i => (z i : ℝ)))) := by sorry
end NativeGeometryTargets

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
    (Real.sqrt |x 0|+Real.sqrt |x 1|)^2≤1} := by sorry
/-- compact_star_body_test_3 -/
example : ¬ IsCompact {x : EuclideanSpace ℝ (Fin 2) | |x 0|≤1} := by sorry

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

end TauCeti.GeometryOfNumbersPlan

/-!
## Exact mathematical prototype frontier

The reader and packet are definitive. This catalogue records the full API and
test contracts under their proposed names, including conditions that cannot
yet be stated in the checked context. Those signatures are omitted under
protocol section 13; these comments are not executable declarations and are
not claimed to discharge them. No foreign context is replaced by a Prop field.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice — Integral quadratic lattices over a Dedekind domain
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a Dedekind domain R with fraction field K, a finite-dimensional K-space V and native q:V→K quadratic, an integral quadratic lattice is L:Submodule R V with Submodule.IsLattice K L and q(L)⊆R. Nondegeneracy of q and unimodularity of its integral polar pairing are separate predicates. There is no global free-basis field.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.ofCarrier [constructor]: Bundle a native full finite submodule and q with q(L)⊆R.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.carrier [projection]: Return the original R-submodule, preserving its IsLattice instance.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.quadraticMap [compatibility]: The restricted native R-quadratic map extends back to q on the K-span.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.ext [extensionality]: For fixed q, equal carriers yield equal bundled integral-lattice data.
TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_1: R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular.
TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_2: The integral symmetric pairing B(x,y)=xy on Z does not make q(x)=B(x,x)/2 integral.
TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_3: A nonprincipal fractional ideal is allowed as an R-lattice; no constructor asks for an R-basis.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization — Localization of an integral quadratic lattice
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a nonzero prime p of R, extend L to L_(p)=L⊗R R_(p), viewed as the span of L in the same K-space; extend its quadratic map and coefficient line by scalar change. Integral values and full finite generation are preserved.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize [constructor]: Return the R_(p)-lattice and restricted quadratic form.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize_mem_iff [characterisation]: x lies in L_(p) iff s x lies in L for some s∈R\p.
TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize_map [functoriality]: An integral isometry localizes, preserving identity and composition.
TauCeti.GeometryOfNumbersPlan.lattice_localization_test_1: Z_(2) contains 1/3 and excludes 1/2; this is not Z₂.
TauCeti.GeometryOfNumbersPlan.lattice_localization_test_2: Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain.
TauCeti.GeometryOfNumbersPlan.lattice_localization_test_3: Localizing the zero-dimensional lattice still gives the zero-dimensional lattice.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations — Recover a lattice from its localizations
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For full R-lattices L,M in a fixed K-space, L=⋂p L_(p), and L⊆M iff L_(p)⊆M_(p) for every maximal ideal p. Consequently equality of localized submodules detects equality of global submodules.
TauCeti.GeometryOfNumbersPlan.lattice_intersection_localizations_test_1: 2Z and Z differ at the prime 2, though their Q-spans coincide.
TauCeti.GeometryOfNumbersPlan.lattice_intersection_localizations_test_2: For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent — Descent of a lattice from a DVR completion
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
If R is a DVR with fraction field K and completion R̂ with fraction field K̂, extension L↦L⊗R R̂ and intersection N↦N∩V are inverse bijections between full R-lattices in finite-dimensional V and full R̂-lattices in V⊗K K̂.
TauCeti.GeometryOfNumbersPlan.completed_lattice_descent_test_1: The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice.
TauCeti.GeometryOfNumbersPlan.completed_lattice_descent_test_2: The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus — Integral genus inside a rational quadratic space
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Within a fixed nondegenerate quadratic K-space (V,q), two integral R-lattices belong to the same genus when their completed lattices are isometric under O(q_v)(K_v) at every nonzero prime v. If quadratic spaces themselves vary, also require the archimedean signature data and the rational-space identification from GlobalQuadraticForms. Genus classes are integral isometry classes inside this equivalence class.
TauCeti.GeometryOfNumbersPlan.IntegralGenus.localIsometry [data]: A local isometry at each retained finite place, with archimedean data when spaces vary.
TauCeti.GeometryOfNumbersPlan.IntegralGenus.equivalence [structure]: The genus relation is an equivalence relation.
TauCeti.GeometryOfNumbersPlan.IntegralGenus.ofIntegralIsometry [compatibility]: A global integral isometry determines a genus relation.
TauCeti.GeometryOfNumbersPlan.IntegralGenus.classSet [constructor]: Integral-isometry classes of lattices in the fixed genus.
TauCeti.GeometryOfNumbersPlan.integral_genus_test_1: In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus.
TauCeti.GeometryOfNumbersPlan.integral_genus_test_2: A global integral isometry yields local isometries at every place.
TauCeti.GeometryOfNumbersPlan.integral_genus_test_3: Opposite real signatures cannot be identified when ambient spaces vary.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus — Proper spinor genus
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For nondegenerate q in characteristic different from 2, proper spinor genus is the orbit of an integral lattice under SO(q)(K) times the image of Spin(q)(A_f)→SO(q)(A_f), acting on its finite adelic completion. Proper genus uses SO instead of O. Their forgetful maps to ordinary genus are separate.
TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.orbit [constructor]: Use global SO and the finite adelic spin image.
TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.equivalence [structure]: Orbit relation is reflexive, symmetric and transitive.
TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.toGenus [compatibility]: Forget orientation and the spin-image restriction.
TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_1: At a place where a nontrivial spinor-norm class occurs, an SO-point with that norm cannot be inserted into the spin image merely by asserting surjectivity.
TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_2: A proper spinor-genus relation implies genus; the converse is not an API lemma.
TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_3: For rank one the proper orthogonal group is trivial; no higher-rank spin-image claim is inferred from that case.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice — Integral hermitian lattices
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
Let K be a field with involution, R⊂K a stable integral subring and V a finite K-space. A hermitian integral lattice consists of native L:Submodule R V, Submodule.IsLattice K L and a native sesquilinear H, conjugate-linear in its first argument and linear in its second, with H(y,x)=star H(x,y) and H(L,L)⊆R. Generic nondegeneracy is distinct from integral self-duality.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.ofCarrier [constructor]: Bundle the existing full finite submodule and actual integral star-sesquilinear form.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.carrier [projection]: The native R-submodule, with its IsLattice certificate.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.ext [extensionality]: For fixed H, equality of native carriers identifies bundled lattice data.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.map [functoriality]: Transport along a hermitian isometry; identity and composition laws.
TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_1: For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual.
TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_2: Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1.
TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_3: An integral hermitian lattice with nonunit Gram determinant is nondegenerate over F but not self-dual over O_F.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice — Hermitian dual lattice
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a nondegenerate integral hermitian lattice L in V, define L∨={x∈V : H(x,L)⊆R}; under the stable involution this equals the right-dual condition H(L,x)⊆R. This is a full finite R-lattice over a Dedekind domain; integrality is equivalent to L⊆L∨. Self-duality means equality, not just equality of generic spans.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.dual [constructor]: The native submodule defined by integral pairings.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.mem_dual_iff [characterisation]: Membership is equivalent to all pairings with L lying in R.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.dual_dual [relation]: The double dual equals L under the stated Dedekind/nondegeneracy hypotheses.
TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.integral_iff_le_dual [characterisation]: Integrality is exactly L⊆L∨.
TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_1: For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e.
TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_2: The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual.
TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_3: The zero-dimensional lattice equals its dual and has zero discriminant length.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants — Fundamental invariants of a local hermitian lattice
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For an integral nondegenerate O_F-hermitian lattice L of rank n over a DVR, attach the unique ordered a₁≤…≤a_n with a_i≥0 and L∨/L≅⊕O_F/π^{a_i}; define val(L)=Σa_i and t(L)=#{i:a_i>0}. Vertex means a_i∈{0,1}; self-dual means all a_i=0.
TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.ofDualQuotient [constructor]: The ordered DVR elementary-divisor exponents.
TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.valuation [data]: Sum of the exponents, equal to O_F-length.
TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.type [data]: Number of positive exponents.
TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.selfDual_iff [characterisation]: Self-duality iff valuation is zero.
TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.vertex_iff [characterisation]: Vertex iff every exponent is 0 or 1.
TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_1: Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice.
TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_2: Invariants (0,1,1) give val=2, type=2 and a vertex lattice.
TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_3: The cardinality of L∨/L is q^{2 val(L)} in an unramified quadratic extension, not q^{val(L)}.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-coefficient — Gram–Schmidt reduction coefficients
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a real inner-product space and a family b:Fin n→V, set μ_{ij}=⟨b_i,b*_j⟩/‖b*_j‖² using the native ordered gramSchmidt b. Reduced-basis theorems require linear independence so denominators for relevant j are nonzero; the total function still uses the native zero-division convention.
TauCeti.GeometryOfNumbersPlan.lllCoefficient [constructor]: The native Gram–Schmidt inner-product ratio.
TauCeti.GeometryOfNumbersPlan.lllCoefficient_eq [simp]: Evaluation equals the stated ratio.
TauCeti.GeometryOfNumbersPlan.lllCoefficient_orthogonal [relation]: Off-diagonal coefficient is zero for an orthogonal family.
TauCeti.GeometryOfNumbersPlan.lllCoefficient_denominator_pos [relation]: Independent input gives a strictly positive squared denominator.
TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_1: For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2.
TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_2: For an orthogonal family, off-diagonal reduction coefficients vanish.
TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_3: For dependent input b*_j can be zero; the total coefficient does not certify a reduced basis.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced — LLL-reduced independent families
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
An LLL-reduced family at δ=3/4 is linearly independent, has |μ_{ij}|≤1/2 for j<i, and for each adjacent j<i with i=j+1 satisfies ‖b*_i‖²≥(3/4−μ_{ij}²)‖b*_j‖². A basis of the input lattice is required separately by output certificates.
TauCeti.GeometryOfNumbersPlan.IsLLLReduced [constructor]: The concrete independence, size and Lovász predicate.
TauCeti.GeometryOfNumbersPlan.IsLLLReduced.linearIndependent [projection]: Return independence.
TauCeti.GeometryOfNumbersPlan.IsLLLReduced.size [projection]: Return |μ_{ij}|≤1/2 for j<i.
TauCeti.GeometryOfNumbersPlan.IsLLLReduced.lovasz [projection]: Return the adjacent δ=3/4 inequality.
TauCeti.GeometryOfNumbersPlan.lll_reduced_test_1: The standard orthonormal basis is reduced.
TauCeti.GeometryOfNumbersPlan.lll_reduced_test_2: The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition.
TauCeti.GeometryOfNumbersPlan.lll_reduced_test_3: The dependent family ((1,0),(2,0)) is not reduced even when a zero-denominator convention makes some inequalities vacuous.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/unimodular-basis-certificate — Exact integer change-of-basis certificates
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
A certificate for input b and output c consists of U,V∈Mat_n(Z), UV=VU=I, and c_i=Σ_j U_{ji}b_j. Columns are output coordinates in the input family. This proves equality of integer spans and determinant ±1; determinant −1 is allowed.
TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.ofMatrices [constructor]: Supply actual integral inverse matrices and the exact output coordinates.
TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.span_eq [relation]: The input and output Z-spans are equal.
TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.det_unit [relation]: det U is 1 or −1.
TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.trans [functoriality]: Compose certificates by matrix multiplication with the correct column order.
TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_1: The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate.
TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_2: diag(2,1) is not an integer-invertible basis change.
TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_3: A floating matrix approximately inverting U does not inhabit this certificate.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-gram-schmidt-growth — Growth bound for reduced orthogonal lengths
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For an LLL-reduced family and j<i, ‖b*_j‖²≤2^{i−j}‖b*_i‖².
TauCeti.GeometryOfNumbersPlan.lll_gram_schmidt_growth_test_1: For orthonormal input the right-hand side is at least the left-hand side.
TauCeti.GeometryOfNumbersPlan.lll_gram_schmidt_growth_test_2: The exponent is an index difference, not the full ambient dimension.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-short-vector-factor — LLL shortest-vector approximation bound
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For n≥1 and an LLL-reduced basis b of a full real Euclidean Z-lattice L, every nonzero x∈L satisfies ‖b₀‖²≤2^{n−1}‖x‖². Equivalently b₀ is within factor 2^{(n−1)/2} of the shortest nonzero vector.
TauCeti.GeometryOfNumbersPlan.lll_short_vector_factor_test_1: For n=1 the factor is 1 and the basis vector is shortest.
TauCeti.GeometryOfNumbersPlan.lll_short_vector_factor_test_2: Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-integer-potential — Integer Gram-prefix potential
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For independent integer-column input in Euclidean R^n, let d_i be the determinant of the Gram matrix of the first i vectors, d₀=1, and D=∏_{1≤i<n} d_i. Each d_i is a positive integer; in ranks 0 and 1 the empty potential is 1.
TauCeti.GeometryOfNumbersPlan.lllIntegerPotential [constructor]: Product of positive integral Gram-prefix determinants.
TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_pos [relation]: The potential is a positive integer for independent integral input.
TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_sizeReduce [compatibility]: An integer shear within the relevant prefix preserves the potential.
TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_swap [relation]: A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4.
TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_1: The standard basis has all prefix determinants and potential equal to 1.
TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_2: A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers.
TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_3: In ranks 0 and 1 the empty potential is 1, and no adjacent swap exists.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-exact-reduction — Exact terminating LLL reduction
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
Given a nonsingular integer basis matrix (or rational input cleared by a common denominator) in the standard Euclidean metric, compute a reduced output basis together with an exact unimodular-basis certificate. Use nearest-integer size reduction and strict Lovász-failing adjacent swaps at δ=3/4.
TauCeti.GeometryOfNumbersPlan.exactLLL [constructor]: Return output coordinates, reducedness and the exact integer inverse certificate.
TauCeti.GeometryOfNumbersPlan.exactLLL_certificate [projection]: Recover the original-lattice certificate.
TauCeti.GeometryOfNumbersPlan.exactLLL_reduced [projection]: Recover the exact size and Lovász tests.
TauCeti.GeometryOfNumbersPlan.exactLLL_shortVector [relation]: For positive rank, the first vector satisfies the proven approximation inequality in the original lattice.
TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_1: Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1.
TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_2: Rank zero returns an empty reduced basis and empty identity matrices.
TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_3: An output without a proven Lovász condition is rejected even if short in floating-point arithmetic.

GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-original-lattice-verification — Verify the short output in the original lattice
The native statement is prototyped using actual fundamental-domain and original-lattice hypotheses. Other source-specific forms and examples retain their explicit refinement obligations.
If a certified output c is LLL-reduced and b is an independent input basis of L, then c₀∈L is nonzero and for every nonzero x∈L, ‖c₀‖²≤2^{n−1}‖x‖², for n≥1.
TauCeti.GeometryOfNumbersPlan.lll_original_lattice_verification_test_1: A verified certificate includes both original membership and the approximation factor.
TauCeti.GeometryOfNumbersPlan.lll_original_lattice_verification_test_2: A short vector in the real span but outside the integer span cannot pass verification.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-representation-count — Finite hermitian representation counts
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a finite commutative star ring A and hermitian Gram matrices G of size m and B of size n, count all m×n matrices X with XᴴGX=B. This is a finite count of form-preserving maps, including noninjective maps when the source form is degenerate.
TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount [constructor]: Finite cardinality of XᴴGX=B.
TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount_empty [simp]: The empty source has count 1.
TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount_basisChange [functoriality]: Invertible source/target coordinate changes induce a bijection of representation sets.
TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_1: Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps.
TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_2: With G=1,B=0 over Z/3 the count is 1: the zero map.
TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_3: For n=0 there is one empty-column representation, for every ambient rank.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-embedding-count — Finite hermitian embedding counts
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For the same finite matrices, count solutions XᴴGX=B whose associated A-linear map A^n→A^m is injective. Over finite fields this is equivalent to column rank n; with a degenerate source it is stronger than the representation equation.
TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount [constructor]: Finite count with the actual injectivity condition.
TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_empty [simp]: Count is 1 for n=0.
TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_le [relation]: Embedding count is at most representation count.
TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_eq_of_nonsingular [compatibility]: Over a field with nonsingular source, every representation is injective.
TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_1: Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation.
TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_2: For an empty source the unique map is injective and the count is 1.
TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_3: When n>m over a field the embedding count is zero.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula — Finite-field hermitian isometry formula
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For an n-dimensional F_{q²}/F_q-hermitian source with radical dimension a and a nondegenerate m-dimensional target, m≥n, the number of injective isometries is q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m}).
TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_1: n=m=1,a=0 gives q+1 norm-one elements.
TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_2: n=m=1,a=1 gives 0 embeddings.
TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_3: n=0,a=0 gives the empty product 1.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-hermitian-count — Normalized finite-level hermitian counts
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
Given quotient rings A_N=O_F/π^N, Gram matrices reduced from fixed integral source/target lattices of ranks n≤m, and q=#k_{F₀}, set a_N=#Rep_{M,L}(A_N)/q^{N n(2m−n)} for N≥1. The denominator uses q, not q².
TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount [constructor]: Finite count divided by q^{N n(2m−n)}.
TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount_empty [simp]: The empty-source count is 1.
TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount_basisChange [compatibility]: Integral invertible basis changes preserve every normalized count.
TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_1: For n=0 the normalized count is 1 at every level.
TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_2: For m=n=1 the exponent is N, not 2N.
TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_3: A generic empty representation problem is not treated as a smooth nonempty scheme of the stated dimension.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density — Hermitian local representation density
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Under the preceding local-field hypotheses, Den(M,L) is the limit of normalized finite-level counts. Its existence, finite value and basis independence are part of the construction, with the specified nonempty generic-fibre assumptions. The statement is separate from the geometric intersection identity.
TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity [constructor]: The proved limit of normalized counts.
TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity_tendsto [characterisation]: The normalized sequence tends to the stated density.
TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity_basisChange [compatibility]: Integral isometries preserve the density.
TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_1: Density of the empty source is 1.
TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_2: The denominator and measure use q=#k_{F₀}; substituting q² changes the limit.
TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_3: A ramified quadratic extension cannot reuse the unramified formula without a new theorem.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial — Normalized hermitian Siegel polynomial
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For an integral nondegenerate unramified hermitian lattice L of rank n, construct the unique D_L∈Z[X] such that D_L((−q)^−k)=Den(⟨1⟩_{n+k},L)/Den(⟨1⟩_{n+k},⟨1⟩_n) for every integer k≥0. The denominator is ∏_{i=1}^n(1−(−q)^−i(−q)^−k).
TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial [constructor]: The integral normalized density polynomial.
TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_eval [characterisation]: Evaluate at (−q)^−k to recover the specified density ratio.
TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_selfDual [simp]: Polynomial equals 1 for a self-dual lattice.
TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_isometry [functoriality]: Integral hermitian isometries preserve the polynomial.
TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_1: For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i.
TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_2: A self-dual lattice has polynomial 1.
TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_3: Using q^−k instead of (−q)^−k loses the alternating sign.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight — Cho–Yamauchi weight polynomial
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For q≥2 and a∈N define m_q(a;X)=∏_{i=0}^{a−1}(1−(−q)^i X) in Z[X], with empty product m_q(0;X)=1. The derivative weight is −m_q(a;X)′ at X=1; for a=0 it is 0, and for a≥1 it is ∏_{i=1}^{a−1}(1−(−q)^i).
TauCeti.GeometryOfNumbersPlan.choYamauchiWeight [constructor]: The native integral polynomial finite product.
TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_zero [simp]: Empty polynomial weight is 1.
TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_succ [relation]: m(a+1;X)=m(a;X)(1−(−q)^a X).
TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_derivative [relation]: The negative derivative at 1 is 0 for a=0 and the stated product for a>0.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_1: m_q(0;X)=1, derivative weight 0.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_2: m_q(1;X)=1−X, derivative weight 1.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_3: m_q(2;X)=(1−X)(1+qX), derivative weight 1+q.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula — Cho–Yamauchi hermitian density formula
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
D_L(X)=Σ_{L⊆L′⊆(L′)∨} X^{2 length_{O_F}(L′/L)} m_q(t(L′);X), summing over integral overlattices of L. The sum is finite because every such L′ lies between L and L∨.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_1: For valuation-one rank one, D=1−X and the negative derivative is 1.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_2: For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2.
TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_3: A self-dual L contributes just L with type 0 and polynomial 1.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation — Hermitian Siegel polynomial functional equation
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For integral nondegenerate L, D_L(X)=(−X)^{val(L)}D_L(X^−1), interpreted in the Laurent polynomial ring. If val(L) is odd then D_L(1)=0.
TauCeti.GeometryOfNumbersPlan.siegel_polynomial_functional_equation_test_1: Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1).
TauCeti.GeometryOfNumbersPlan.siegel_polynomial_functional_equation_test_2: At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/strong-category-duality — Strong duality on a category
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
A strong duality on a category C is a functor D:Cᵒᵖ→C and a natural isomorphism η:Id_C→D D with D(η_X)∘η_{DX}=id_{DX}. This is classical categorical duality, distinct from a stable Poincaré infinity-category.
TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality [constructor]: The actual contravariant functor, natural isomorphism and coherence equation.
TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.dual [projection]: Return D:Cᵒᵖ→C.
TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.biddual [projection]: Return the natural double-dual isomorphism.
TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.coherence [relation]: D(η_X)η_{DX}=id_{DX}.
TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_1: Identity double-dual data on a discrete one-object category is a strong duality.
TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_2: The functor reverses morphism composition.
TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_3: A natural transformation that is not invertible gives the source’s weak duality, not this strong-duality structure.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality — Exact category with strong duality
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
On an existing TauCeti.ExactStructure on a preadditive category E, equip a strong duality D that is additive and sends each conflation X→Y→Z to the reversed dual conflation DZ→DY→DX. The coefficient sign −η gives the alternating variant when D is additive.
TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.ofExactFunctor [constructor]: An additive conflation-exact strong duality on the existing exact category.
TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.dualConflation [functoriality]: Reverse a conflation to its dual conflation.
TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.signTwist [constructor]: The sign-twisted duality with double dual −η.
TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_1: Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality.
TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_2: Over Z the hyperbolic symmetric plane is available without 1/2.
TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_3: Changing η to −η changes the symmetry equation and does not identify symmetric and quadratic refinements at 2.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space — Nondegenerate symmetric spaces
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For strong duality (D,η), a symmetric space is (X,φ) with an isomorphism φ:X→DX satisfying D(φ)η_X=φ. A form-preserving map f:X→Y satisfies φ_X=D(f)φ_Y f; an isometry is such a map whose underlying morphism is an isomorphism.
TauCeti.GeometryOfNumbersPlan.SymmetricSpace [constructor]: Object, pairing isomorphism and typed symmetry equation.
TauCeti.GeometryOfNumbersPlan.SymmetricSpace.pairing [projection]: The actual map X≅DX.
TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves [characterisation]: Form-preservation is the displayed categorical equation.
TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves_id [simp]: Identity preserves a symmetric space.
TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves_comp [functoriality]: The composite of form-preserving maps preserves the forms.
TauCeti.GeometryOfNumbersPlan.symmetric_space_test_1: The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z.
TauCeti.GeometryOfNumbersPlan.symmetric_space_test_2: The identity map preserves every symmetric space.
TauCeti.GeometryOfNumbersPlan.symmetric_space_test_3: A noninvertible form-preserving map is not called an isometry.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian — Admissible Lagrangians
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
A Lagrangian of (X,φ) is an admissible inflation i:L→X such that L→X→DL, with second map D(i)φ, is a conflation. Thus L is its own orthogonal, in the actual exact structure. A space is metabolic when a Lagrangian exists.
TauCeti.GeometryOfNumbersPlan.ExactLagrangian.ofConflation [constructor]: A conflation L→X→DL with the displayed second map.
TauCeti.GeometryOfNumbersPlan.ExactLagrangian.isotropic [relation]: D(i)φi=0.
TauCeti.GeometryOfNumbersPlan.ExactLagrangian.mapIsometry [functoriality]: An isometry transports the admissible Lagrangian.
TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_1: The first summand of the hyperbolic plane is a Lagrangian.
TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_2: 2Z⊂Z is not an admissible summand in the split exact category of projectives.
TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_3: An isotropic subobject of too small a rank is not a Lagrangian.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space — Hyperbolic symmetric space
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For X in an exact category with duality, H(X) has underlying object X⊕DX and pairing matrix [[0,1],[η_X,0]] to DX⊕DDX, with its actual biproduct identifications. The inclusion of X is an admissible Lagrangian.
TauCeti.GeometryOfNumbersPlan.hyperbolicSpace [constructor]: The native biproduct with the off-diagonal perfect pairing.
TauCeti.GeometryOfNumbersPlan.hyperbolicSpace_lagrangian [projection]: The first summand is an admissible Lagrangian.
TauCeti.GeometryOfNumbersPlan.hyperbolicSpace_sum [compatibility]: Hyperbolic construction carries sums to orthogonal sums.
TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_1: Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular.
TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_2: H(0) is the zero symmetric space.
TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_3: H(X⊕Y) is isometric to H(X)⊥H(Y).

GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction — Isotropic reduction of a symmetric space
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For an admissible totally isotropic L⊂X with L⊂L⊥ also an inflation, there is a unique nondegenerate symmetric form on L⊥/L pulling back to the restricted form. X⊥−(L⊥/L) is metabolic with Lagrangian L⊥.
TauCeti.GeometryOfNumbersPlan.isotropicReduction [constructor]: The unique induced perfect symmetric quotient form.
TauCeti.GeometryOfNumbersPlan.isotropicReduction_pullback [characterisation]: Its pullback is the restricted pairing.
TauCeti.GeometryOfNumbersPlan.isotropicReduction_metabolic [relation]: X⊥−reduction is metabolic.
TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_1: For L=0 the quotient is X and X⊥−X is metabolic.
TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_2: For a Lagrangian L the quotient L⊥/L is zero.
TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_3: For a nonadmissible inclusion the quotient construction cannot be invoked.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group — Degree-zero Grothendieck–Witt group of an exact category
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
GW₀(E) is the group completion of isometry classes of nondegenerate symmetric spaces modulo [M]=[H(L)] for every metabolic M with an admissible Lagrangian L. Orthogonal sum is addition. This extra relation is essential in a nonsplit exact category.
TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup [constructor]: The presented additive group.
TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.ofSpace [constructor]: The generator class of a symmetric space.
TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.orthogonalSum [simp]: Orthogonal sum becomes addition.
TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.metabolic [relation]: [M]=[H(L)] for an admissible Lagrangian.
TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.lift [universal-property]: Descend exactly the additive invariants satisfying the metabolic relation.
TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_1: A metabolic space with Lagrangian L has the same GW class as H(L).
TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_2: Over a split exact projective category, stable metabolic cancellation yields the usual group completion.
TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_3: Over Z the symmetric and quadratic-refined group presentations are not conflated.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group — Witt group of an exact category
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
W₀(E) is the monoid of symmetric-space isometry classes modulo metabolic spaces. It is a group because X⊥−X has the diagonal as an admissible Lagrangian. Equivalently it is the quotient of GW₀(E) by hyperbolic classes.
TauCeti.GeometryOfNumbersPlan.ExactWittGroup [constructor]: The metabolic quotient group.
TauCeti.GeometryOfNumbersPlan.ExactWittGroup.ofSpace [constructor]: The Witt class of a symmetric space.
TauCeti.GeometryOfNumbersPlan.ExactWittGroup.metabolic_eq_zero [simp]: Metabolic spaces have zero class.
TauCeti.GeometryOfNumbersPlan.ExactWittGroup.neg [relation]: Negating the pairing gives the additive inverse.
TauCeti.GeometryOfNumbersPlan.ExactWittGroup.fieldComparison [compatibility]: For fields in the existing owner’s scope, recover its Witt group.
TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_1: A hyperbolic plane has zero Witt class.
TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_2: The inverse of [X,φ] is [X,−φ].
TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_3: W=GW is false: over R the hyperbolic plane has nonzero rank in GW but zero Witt class.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-forgetful-relations — Hyperbolic and forgetful maps in degree zero
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Forgetting gives F:GW₀(E)→K₀(E), and H:K₀(E)→GW₀(E) is induced by X↦H(X). Their composite F H sends [X] to [X]+[DX], rather than universally to 2[X]. The sequence K₀(E)→GW₀(E)→W₀(E)→0 is exact.
TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_1: Over a field with trivial rank-duality action, F H doubles rank.
TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_2: The hyperbolic image maps to zero in W₀.
TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_3: For a nontrivial K₀ involution, the equation is 1+D and cannot be simplified without proof.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction — Hermitian Q-construction
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Qʰ(E) has symmetric spaces as objects. A morphism X→Y is an isomorphism class of spans X←p U→i Y with p an admissible deflation and i an admissible inflation, satisfying the matching restricted pairings and ker p≅ker(D(i)φ_Y). Equivalently the corresponding pairing square is bicartesian. Composition is the imported Q pullback composition.
TauCeti.GeometryOfNumbersPlan.HermitianQ [constructor]: The native category of hermitian Q-spans.
TauCeti.GeometryOfNumbersPlan.HermitianQ.ofSpan [constructor]: A span with its actual bicartesian pairing condition.
TauCeti.GeometryOfNumbersPlan.HermitianQ.forget [functoriality]: Forget the pairings to the existing Q-construction.
TauCeti.GeometryOfNumbersPlan.HermitianQ.identity [simp]: Identity is the identity span.
TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_1: A Lagrangian gives a Qʰ path from zero to its metabolic space.
TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_2: The identity span gives the identity morphism.
TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_3: A Q-span with incompatible pairing or wrong kernel is not a hermitian morphism.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space — Grothendieck–Witt space of an exact category
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
GW(E) is the pointed homotopy fibre over the zero object of |Qʰ(E)|→|Q(E)|.
TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace [constructor]: The specified pointed homotopy fibre.
TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace_fibration [relation]: GW(E)→|QʰE|→|QE| is the defining fibre sequence.
TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace_map [functoriality]: Nonsingular exact form functors induce pointed maps.
TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_1: The base point is the zero object, not an arbitrary unrecorded form.
TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_2: For the hyperbolic category HE, GW(HE)≃K(E).
TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_3: GW_i is a homotopy degree; a four-periodic shifted-duality statement does not say GW_i≅GW_{i+4}.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space-components — Degree-zero comparison for the GW space
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
There is a natural additive isomorphism π₀GW(E)≅GW₀(E) with the previously defined metabolic presentation, compatible with forgetful and hyperbolic maps.
TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_components_test_1: The comparison respects the hyperbolic image of an actual exact object.
TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_components_test_2: The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data — Quaternionic integral hermitian lattices
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a quaternion algebra B over a characteristic-not-two number field K, a fixed star-stable R-order O⊂B, a finite right B-module V and nondegenerate hermitian H:V×V→B satisfying H(xa,yb)=star(a)H(x,y)b, specify a full finite R-lattice L stable under right O with H(L,L)⊆O. The integral-isometry and local-genus data retain O, its involution and the hermitian sign.
TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.ofOrderStableCarrier [constructor]: The actual O-stable native R-lattice and quaternionic pairing.
TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.order [projection]: Retain the coefficient order and its involution.
TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.localize [functoriality]: Localize order, lattice and pairing simultaneously.
TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_1: For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition.
TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_2: Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison.
TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_3: Changing the order changes the integral-isometry problem even when the ambient quaternion algebra is unchanged.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form — Atomic integral quadratic forms over a local PID
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Over a local PID R with valuation v and uniformizer π, an atomic quadratic form is either ⟨a⟩ with a a unit, or, when 2 is not a unit, a binary [a,b,c] satisfying v(b)<v(2a)≤v(2c) and v(a)v(b)=0. These are integral quadratic maps; the polar pairing is not divided by two.
TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm [constructor]: The exact unary or dyadic binary valuation predicate.
TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm.unary [characterisation]: Unary atomic forms have unit coefficient.
TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm.binary [characterisation]: The binary alternative includes 2 nonunit and all valuation inequalities.
TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_1: Over Z₂ the hyperbolic quadratic form xy is an atomic binary form.
TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_2: Over a ring with 2 invertible only the rank-one unit alternative occurs.
TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_3: A field diagonal basis need not be an integral diagonal basis over Z₂.

GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form — Normalized integral quadratic form
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Every finite-projective quadratic form over a local PID has an integral basis giving an orthogonal sum π^{e₁}Q₁⊥…⊥π^{e_s}Q_s of atomic unary/binary forms, with ordered exponents e_i≥0, allowing the zero blocks specified by the source infinity convention. This normalized form is not asserted unique.
TauCeti.GeometryOfNumbersPlan.integral_normalized_form_test_1: The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization.
TauCeti.GeometryOfNumbersPlan.integral_normalized_form_test_2: The zero quadratic map requires the specified zero-block convention.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite — Finite integral isometry stabilizers
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a full Z-lattice in a positive-definite real Euclidean space, its integral isometry group is finite. For a totally positive number-field quadratic lattice, restriction through all real embeddings gives the corresponding finite stabilizer.
TauCeti.GeometryOfNumbersPlan.definite_integral_isometry_finite_test_1: For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2.
TauCeti.GeometryOfNumbersPlan.definite_integral_isometry_finite_test_2: Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite — Finiteness of a positive-definite genus class set
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
The integral-isometry class set of a fixed positive-definite quadratic genus over Z, and of a fixed totally positive genus over a number ring, is finite.
TauCeti.GeometryOfNumbersPlan.definite_genus_class_finite_test_1: Infinitely many embedded coordinate changes can represent one integral-isometry class.
TauCeti.GeometryOfNumbersPlan.definite_genus_class_finite_test_2: The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/genus-mass — Weighted genus mass
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a positive-definite genus with its proved finite class set, mass(L)=Σ_[M] 1/|O(M)| as a positive rational number. Proper mass uses proper classes and SO(M) separately; neither is substituted for the other without an index comparison.
TauCeti.GeometryOfNumbersPlan.genusMass [constructor]: Finite sum of rational reciprocal integral-isometry stabilizer orders.
TauCeti.GeometryOfNumbersPlan.genusMass_representative [compatibility]: The summand is independent of the chosen representative.
TauCeti.GeometryOfNumbersPlan.genusMass_singleton [simp]: A singleton class set has mass the reciprocal stabilizer order.
TauCeti.GeometryOfNumbersPlan.genusMass_pos [relation]: A nonempty finite positive genus has strictly positive mass.
TauCeti.GeometryOfNumbersPlan.genus_mass_test_1: The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1.
TauCeti.GeometryOfNumbersPlan.genus_mass_test_2: For proper rank-one classes the stabilizer is trivial and proper mass is 1.
TauCeti.GeometryOfNumbersPlan.genus_mass_test_3: Changing representatives cannot change the stabilizer cardinality.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity — Adelic weighted mass identity
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Let q be totally positive over a totally real number field, G=SO(q), and K_f the integral stabilizer of a fixed lattice in its finite adelic genus. For compatible product Haar measures with convergent product vol(K_f), proper mass equals vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Every double-coset contribution is the reciprocal order of the proper integral stabilizer.
TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_1: Rescaling one local Haar measure changes the numerator and local factor compatibly.
TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_2: Replacing the weighted sum by the class number gives the wrong rank-one value.
TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_3: The numerical constant 2 is not an assumption-free formula for SO of rank 1 or 2.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface — Integral lattice theta coefficient interface
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a positive-definite even integral Z-lattice, the imported convergent theta kernel specializes to the lattice theta series whose coefficient at m is #{x∈L:q(x)=m}, with q(x)=B(x,x)/2. Scalar weight, level and Weil-representation/discriminant conventions are inherited from the theta owner.
TauCeti.GeometryOfNumbersPlan.theta_lattice_coefficient_interface_test_1: For an even lattice q=B(x,x)/2 is integer valued.
TauCeti.GeometryOfNumbersPlan.theta_lattice_coefficient_interface_test_2: For an odd rank-one Gram-1 lattice the half-norm is not integral, so its level/exponent conventions require a different specialization.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count — Davenport semialgebraic multiset estimate
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For n≥1, a bounded semialgebraic multiset R⊂R^n with maximum multiplicity m, given by at most k polynomial inequalities of degrees≤ell, and an upper or lower triangular unipotent image R′, the multiplicity-weighted integer count differs from vol(R) by at most C(n,m,k,ell)·max(1,max_{1≤d<n}vol_d(proj_d R)). Projections are coordinate projections of the original region R.
TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_1: For an interval [0,N] with N integral, count−length=1.
TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_2: Counting a region twice multiplies both volume and point count; ignoring multiset multiplicity is wrong.
TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_3: The projection error for a triangular image refers to the original region as in Proposition 2.5.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing — Howe–Moore matrix-coefficient decay
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a connected noncompact almost-simple real Lie group G with finite centre and a strongly continuous unitary representation on a Hilbert space with no nonzero G-invariant vector, every matrix coefficient tends to 0 as g leaves all compact subsets of G.
TauCeti.GeometryOfNumbersPlan.howe_moore_mixing_test_1: A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem.
TauCeti.GeometryOfNumbersPlan.howe_moore_mixing_test_2: Escaping only one factor of a product does not justify the unqualified product theorem.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity — Ergodicity of a noncompact subgroup action
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Let G be connected noncompact almost-simple with finite centre, Γ a lattice and μ the invariant probability measure on G/Γ. Every closed noncompact subgroup H acts ergodically on (G/Γ,μ).
TauCeti.GeometryOfNumbersPlan.homogeneous_ergodicity_test_1: A compact subgroup does not meet the noncompactness hypothesis.
TauCeti.GeometryOfNumbersPlan.homogeneous_ergodicity_test_2: For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence — Dani–Margulis recurrence in the lattice space
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For d≥2, X=SL_d(R)/SL_d(Z), a one-parameter unipotent subgroup u_t, x∈X and epsilon>0, there exists a compact K⊂X such that for every T>0, Leb{t∈[0,T]:u_t x∈K}/T≥1−epsilon.
TauCeti.GeometryOfNumbersPlan.unipotent_nondivergence_test_1: A diagonal flow can diverge and cannot replace the unipotent flow.
TauCeti.GeometryOfNumbersPlan.unipotent_nondivergence_test_2: The statement controls every T>0 with a compact set containing the necessary initial trajectory segment.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure — Ratner orbit-closure theorem
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a connected linear semisimple real Lie group G, a lattice Γ, a connected subgroup U generated by one-parameter unipotent subgroups and x=gΓ, the closure of Ux is Lx for a connected closed subgroup L containing U, with L∩gΓg^−1 a lattice in L.
TauCeti.GeometryOfNumbersPlan.ratner_orbit_closure_test_1: The orbit closure carries a finite L-invariant measure, not just an unspecified closed set.
TauCeti.GeometryOfNumbersPlan.ratner_orbit_closure_test_2: Diagonal-flow fractal orbit closures show why the unipotent-generation hypothesis is retained.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification — Ratner invariant-measure classification
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
In the preceding homogeneous setting, every ergodic U-invariant probability measure on G/Γ is the unique normalized L-invariant measure on a closed finite-volume orbit Lx for a closed subgroup L containing U.
TauCeti.GeometryOfNumbersPlan.ratner_measure_classification_test_1: A convex combination of different homogeneous orbit measures need not be ergodic.
TauCeti.GeometryOfNumbersPlan.ratner_measure_classification_test_2: Replacing probability by an arbitrary infinite invariant measure is outside the statement.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-unipotent-equidistribution — Equidistribution of a unipotent orbit
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a one-parameter unipotent flow u_t and x∈G/Γ, there is a closed finite-volume homogeneous orbit Lx containing u_t x and a normalized invariant probability μ_L such that T^−1∫_0^T f(u_t x)dt→∫f dμ_L for every continuous compactly supported f.
TauCeti.GeometryOfNumbersPlan.ratner_unipotent_equidistribution_test_1: A closed periodic unipotent orbit equidistributes on itself, not on the full quotient.
TauCeti.GeometryOfNumbersPlan.ratner_unipotent_equidistribution_test_2: The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/oppenheim-values — Margulis’s theorem on irrational quadratic values
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For n≥3, a real nondegenerate indefinite quadratic form q on R^n that is not proportional to a form with rational coefficients has q(Z^n) dense in R.
TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_1: An integral form has discrete values and is excluded.
TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_2: Positive-definite forms do not have values dense in all R.
TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_3: The n=2 form x²−(3+2√2)y² shows why dimension≥3 is required.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution — Duke spherical lattice-point equidistribution
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
As n→∞ through positive square-free integers n not congruent to 7 modulo 8, the normalized counting measure on {v/√n:v∈Z³,‖v‖²=n} converges to normalized rotation-invariant surface measure on S².
TauCeti.GeometryOfNumbersPlan.duke_spherical_equidistribution_test_1: n≡7 mod8 has no three-square representations and is excluded.
TauCeti.GeometryOfNumbersPlan.duke_spherical_equidistribution_test_2: A measure on primitive representations for nonsquare-free n is a different theorem.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/packing-radius — Euclidean lattice packing radius
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a positive-dimensional full Euclidean lattice L, its packing radius is half the attained shortest nonzero norm. In dimension zero set it to zero.
TauCeti.GeometryOfNumbersPlan.latticePackingRadius [constructor]: Half the attained first Euclidean minimum, zero in rank zero.
TauCeti.GeometryOfNumbersPlan.latticePackingRadius_eq_half [characterisation]: In positive rank it is half the first Euclidean minimum.
TauCeti.GeometryOfNumbersPlan.latticePackingRadius_smul [functoriality]: Positive scalar multiplication multiplies the packing radius by that scalar.
TauCeti.GeometryOfNumbersPlan.packing_radius_test_1: For aZ in R, a>0, the packing radius is a/2.
TauCeti.GeometryOfNumbersPlan.packing_radius_test_2: For Z² the packing radius is 1/2.
TauCeti.GeometryOfNumbersPlan.packing_radius_test_3: In dimension zero the packing radius is zero.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/compact-star-body — Compact star bodies from homogeneous gauges
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
A compact star body is specified by a continuous positive homogeneous function p:V→R_{≥0} with p(x)=0 iff x=0, p(t x)=t p(x) for t≥0, and compact unit sublevel K={p≤1}. Convexity is not assumed. Nonzero lattice avoidance and critical determinants use this body, rather than the convex-body API without its hypotheses.
TauCeti.GeometryOfNumbersPlan.CompactStarBody.ofGauge [constructor]: The actual continuous definite homogeneous gauge and compact unit sublevel.
TauCeti.GeometryOfNumbersPlan.CompactStarBody.radial [characterisation]: Positive radial scaling is governed by p(tx)=t p(x).
TauCeti.GeometryOfNumbersPlan.CompactStarBody.admissible [data]: No nonzero lattice point in the interior.
TauCeti.GeometryOfNumbersPlan.CompactStarBody.convexComparison [compatibility]: When the unit sublevel is convex, compare to the native ConvexBody.
TauCeti.GeometryOfNumbersPlan.compact_star_body_test_1: The Euclidean norm gives a convex star body.
TauCeti.GeometryOfNumbersPlan.compact_star_body_test_2: p(x,y)=(√|x|+√|y|)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not.
TauCeti.GeometryOfNumbersPlan.compact_star_body_test_3: A gauge vanishing along a nonzero ray fails the stated definiteness/compactness conditions.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower — Polar-body transference lower inequality
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a full real Euclidean lattice L and symmetric convex body K with nonempty interior, λ_i(K,L)·λ_{n+1−i}(K°,L*)≥1 for 1≤i≤n, where K° is the inner-product polar and L* the pairing-integral dual.
TauCeti.GeometryOfNumbersPlan.dual_transference_lower_test_1: For rectangular lattices and reciprocal coordinate boxes the paired products equal 1.
TauCeti.GeometryOfNumbersPlan.dual_transference_lower_test_2: An arbitrary real pairing has no integer ≥1 floor.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness — Mahler compactness criterion
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For n≥2 and X_n=SL_n(R)/SL_n(Z), the closed set of covolume-one lattices whose shortest nonzero norm is at least epsilon>0 is compact. A subset is relatively compact iff its first minimum is uniformly bounded below away from zero.
TauCeti.GeometryOfNumbersPlan.mahler_compactness_test_1: diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0.
TauCeti.GeometryOfNumbersPlan.mahler_compactness_test_2: A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value — Siegel lattice mean-value theorem
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For n≥2, invariant probability μ on X_n=SL_n(R)/SL_n(Z), and integrable f:R^n→R, its lattice transform Σ_{v∈L\{0}}f(v) is integrable on X_n and its μ-integral equals the Lebesgue integral of f. For nonnegative measurable f the Tonelli version permits infinity.
TauCeti.GeometryOfNumbersPlan.siegel_mean_value_test_1: Including v=0 adds f(0) and changes the formula.
TauCeti.GeometryOfNumbersPlan.siegel_mean_value_test_2: In dimension one the single lattice Z does not give the Lebesgue mean-value formula.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface — Construction A real-lattice comparison
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a linear code C⊂F_p^n, import the completed Construction A lattice and identify its unscaled real realization {x∈Z^n:x mod p∈C} with covolume p^{n−dim C}. The rescaled realization p^−1/2L has covolume p^{n/2−dim C}; unimodularity/integrality/evenness require the supplier’s exact self-duality and parity hypotheses.
TauCeti.GeometryOfNumbersPlan.construction_a_real_lattice_interface_test_1: For the zero code, the unscaled lattice is pZ^n and has covolume p^n.
TauCeti.GeometryOfNumbersPlan.construction_a_real_lattice_interface_test_2: For the whole code it is Z^n with covolume 1.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line — Canonical residue duality coefficient
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a Dedekind ring R, nonzero prime p and line bundle M with involution, the right adjoint residue dual coefficient RHom_R(R/p,M) is canonically (p^−1M/M)[−1]. A choice of uniformizer identifies p^−1M/M with M/pM; this last identification is not canonically natural under ramified base change.
TauCeti.GeometryOfNumbersPlan.dedekind_residue_duality_line_test_1: The residue term has a −1 duality shift, not degree zero.
TauCeti.GeometryOfNumbersPlan.dedekind_residue_duality_line_test_2: For Z→Z[i] at 2, the integer 2 does not become a uniformizer at (1+i), so the naive residue-field identity is not the induced map.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization — Symmetric Grothendieck–Witt localization for Dedekind rings
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For R,M as above, a set S of nonzero primes and every duality shift r, there is a canonical fibre sequence ⊕_{p∈S}GW(R/p;Q^s_{RHom_R(R/p,M)}[r])→GW(R;Q^s_M[r])→GW(R_S;Q^s_{M_S}[r]). With chosen uniformizers the left coefficient is (M/pM)[r−1].
TauCeti.GeometryOfNumbersPlan.dedekind_symmetric_localization_test_1: The left shift is r−1 after a uniformizer choice.
TauCeti.GeometryOfNumbersPlan.dedekind_symmetric_localization_test_2: Quadratic L-theory at the prime 2 cannot simply replace symmetric L-theory in this sequence.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization — Hermitian filtering localization
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a duality-preserving s-filtering inclusion A⊂U of exact categories with strong duality, with A idempotent complete, |QʰA|→|QʰU|→|Qʰ(U/A)| is a pointed homotopy fibre sequence over zero.
TauCeti.GeometryOfNumbersPlan.schlichting_filtering_localization_test_1: A fully exact inclusion without the four s-filtering conditions is not enough.
TauCeti.GeometryOfNumbersPlan.schlichting_filtering_localization_test_2: Idempotent completeness of A is an explicit hypothesis.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity — Source-scoped shifted Karoubi periodicity
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a dg category with weak equivalences and duality whose mapping complexes are uniquely 2-divisible, the shifted classical GW spectra satisfy GW^[r+4](A)≃GW^[r](A), and the forgetful/hyperbolic Bott triangle is GW^[r](A)→K(A)→GW^[r+1](A)→ΣGW^[r](A). This shifts the duality index, not the higher homotopy degree.
TauCeti.GeometryOfNumbersPlan.shifted_karoubi_periodicity_test_1: The equality relates shift r with r+4 while keeping homotopy degree fixed.
TauCeti.GeometryOfNumbersPlan.shifted_karoubi_periodicity_test_2: The hypothesis 2 invertible cannot be removed by citing the characteristic-free exact-category definitions.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit — Number-ring homotopy-limit comparison
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a Dedekind ring R whose fraction field is a number field, a line bundle M with involution ±1 and any duality shift r, GW(R;Q^s_M[r])→K(R;Q^s_M[r])^{hC₂} is a 2-adic equivalence. Its classical symmetric connective-cover specialization is an equivalence in nonnegative degrees after 2-completion.
TauCeti.GeometryOfNumbersPlan.number_ring_homotopy_limit_test_1: A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement.
TauCeti.GeometryOfNumbersPlan.number_ring_homotopy_limit_test_2: Classical connective groups give the nonnegative-degree specialization.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-invert-two-comparison — Berrick–Karoubi comparison after inverting two
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For a Dedekind ring R with number-field fraction field and epsilon=±1, GW^s(R;epsilon)→GW^s(R[1/2];epsilon) is a 2-local equivalence on connected covers, hence in strictly positive homotopy degrees, and is injective in degree zero.
TauCeti.GeometryOfNumbersPlan.number_ring_invert_two_comparison_test_1: The map on π₀ is injective; it need not be surjective.
TauCeti.GeometryOfNumbersPlan.number_ring_invert_two_comparison_test_2: The theorem compares R with R[1/2], not GW with ordinary K without duality.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius — Euclidean lattice covering radius
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a full Euclidean lattice L, μ(L)=sup_x inf_{v∈L} ‖x−v‖. It is the maximum of the continuous periodic distance-to-L function on the compact quotient; dimension zero gives zero.
TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius [constructor]: Supremum of the native distance-to-lattice function.
TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius_attained [relation]: A point in a compact fundamental domain attains the radius.
TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius_smul [functoriality]: Positive scalar multiplication multiplies μ by the same scalar.
TauCeti.GeometryOfNumbersPlan.covering_radius_test_1: For aZ in R with a>0, μ=a/2.
TauCeti.GeometryOfNumbersPlan.covering_radius_test_2: For Z², μ=√2/2, larger than its packing radius 1/2.
TauCeti.GeometryOfNumbersPlan.covering_radius_test_3: In dimension zero μ=0; a non-full-rank subgroup in positive dimension can have infinite ambient covering radius.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-upper — Euclidean successive-minima transference
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a full rank-n Euclidean lattice L, n≥1, and 1≤i≤n, λ_i(L)λ_(n+1−i)(L*)≤n, where L* is defined by integral inner products and both bodies are the Euclidean unit ball.
TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_1: For aZ in R, the product is one.
TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_2: For Zⁿ, each product is one and is at most n.
TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_3: No dimension-independent upper bound is claimed.

GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference — Covering radius and reciprocal shortest vector
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a full rank-n Euclidean lattice L, n≥1, 1/2≤μ(L)λ_1(L*)≤n. This pass chooses Regev’s weaker uniform upper constant n; it does not claim that the scanned original proof of the sharper n/2 bound has been checked.
TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_1: For aZ in R the product is 1/2.
TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_2: For Zⁿ the product is √n/2.
TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_3: An asymptotic 0.1275+o(1) constant from Aggarwal–Stephens-Davidowitz is not a uniform small-rank constant.

GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula — Mass formula for maximal integral lattices
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Let K be totally real of degree d≥2, Q a totally positive nondegenerate m-dimensional form, m≥3, and Λ the genus of maximal integral O_K-lattices. With ordinary O-isometry mass, r=floor(m/2), G=SO(Q), 2 mass(Λ)=2 γ_G^d |disc K|^(dim G/2) L(G) ∏_p λ_p(Q). Here dim G=r(2r−(−1)^m); γ_G=∏_(i=1)^r(2i−1)!/(2π)^(r(r+1)) for odd m and (r−1)!∏_(i=1)^(r−1)(2i−1)!/(2π)^(r²) for even m. L(G)=∏_(i=1)^r ζ_K(2i) for odd m; ζ_K(r)∏_(i=1)^(r−1)ζ_K(2i) for even m with square discriminant; otherwise [ζ_E(r)/ζ_K(r)] N(d_E/K)^(r−1/2)∏_(i=1)^(r−1)ζ_K(2i), E=K(√disc Q). The local λ_p are exactly the table in Definition 3.1, not the hermitian normalized density polynomial of GN.3.
TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_1: Class number one implies mass=1/|Aut L|; it is not an unweighted class count.
TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_2: The formula is restricted to m≥3; binary zeta-at-one substitution is excluded.
TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_3: A dyadic exceptional factor is retained rather than set to one.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/higher-grothendieck-witt-groups — Higher Grothendieck–Witt groups
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For i≥0, GW_i(E)=π_i of the pointed Grothendieck–Witt fibre space; in degree zero use its canonical abelian H-space component group, not a shifted-duality index.
TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup [constructor]: Pointed homotopy group of the Grothendieck–Witt fibre.
TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup_map [functoriality]: Nonsingular exact form functors induce group maps.
TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup_zero [compatibility]: The component group agrees with exact-category GW_0.
TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_1: GW_0 agrees with the exact presentation, including metabolic relations.
TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_2: For HE the higher groups agree with ordinary K_i(E).
TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_3: Four-periodicity of duality shifts does not imply four-periodicity of i.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension — Hermitian suspension of an exact category
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For idempotent-complete exact E with strong exact duality, S_h E=C(E,E)/E is Schlichting’s hermitian suspension, using the actual cone category and filtering exact quotient, with induced duality. The cone has its duality-preserving Eilenberg swindle.
TauCeti.GeometryOfNumbersPlan.hermitianSuspension [constructor]: The specified exact quotient with induced strong duality.
TauCeti.GeometryOfNumbersPlan.hermitianSuspension_map [functoriality]: Compatible exact form functors induce suspension form functors.
TauCeti.GeometryOfNumbersPlan.hermitianCone_contractible [relation]: The duality-preserving cone swindle contracts its GW space.
TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_1: The cone GW space is contractible by id⊥T≅T.
TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_2: The quotient is by the embedded E and retains exact duality.
TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_3: No ordinary K carrier is asserted to equal this hermitian suspension.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping — Hermitian suspension delooping
The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
For idempotent-complete exact E with strong exact duality, GW(E)≃ΩGW(S_h E). The idempotent-completion map ΩGW(S_h E)→ΩGW(˜S_h E) is an equivalence by cofinality.
TauCeti.GeometryOfNumbersPlan.hermitian_suspension_delooping_test_1: Idempotent completion is explicitly retained before iteration.
TauCeti.GeometryOfNumbersPlan.hermitian_suspension_delooping_test_2: The analogous Ω|Qʰ(S_h E)| completion map is not always a π_0 isomorphism.

GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum — Nonconnective hermitian spectrum
The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
Iterating idempotent-completed hermitian suspension gives the Ω-spectrum with levels GW(E), GW(˜S_h E), GW(˜S_h² E), … and structure equivalences from delooping. Its homotopy groups in all integer degrees are nonconnective hermitian groups. For the hyperbolic exact category HE this spectrum agrees with the imported nonconnective K spectrum of E.
TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum [constructor]: The completed hermitian-suspension Ω-spectrum.
TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum_loop [relation]: Each adjacent structure map is a loop equivalence.
TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum_hyperbolic [compatibility]: Comparison with the imported nonconnective K spectrum for HE.
TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_1: Degree-zero recovery does not require this construction.
TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_2: For HE negative groups recover nonconnective K groups.
TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_3: Qʰ-only levels can fail the Ω-spectrum condition when negative K groups are nonzero.

GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization — Mixed embedding covolume normalization
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a number field K and an invertible fractional O_K-ideal I, use the existing mixed real/complex embedding and its real Haar measure. Its lattice covolume is absNorm(I)·2^(−r₂)·√|disc K|, and its real ambient dimension is [K:Q]. A complex coordinate contributes two real dimensions; replacing the metric or embedding coordinates requires the actual real determinant factor.
TauCeti.GeometryOfNumbersPlan.mixed_embedding_normalization_test_1: The complex-place factor is 2^(-r₂), not 2^(r₂).
TauCeti.GeometryOfNumbersPlan.mixed_embedding_normalization_test_2: Real dimension is r₁+2r₂, not r₁+r₂.

GeometryOfNumbersAndQuadraticArithmetic:GN.1/blichfeldt-native-interface — Blichfeldt native interface
The native statement is prototyped using actual fundamental-domain and original-lattice hypotheses. Other source-specific forms and examples retain their explicit refinement obligations.
Under the pinned countable additive action, invariant measure and actual fundamental-domain hypotheses, a null-measurable S with μ(F)<μ(S) has two distinct lattice translates that intersect. For a subgroup acting by translations this gives distinct points of S whose difference is a nonzero lattice element.
TauCeti.GeometryOfNumbersPlan.blichfeldt_native_interface_test_1: The strict volume comparison is retained.
TauCeti.GeometryOfNumbersPlan.blichfeldt_native_interface_test_2: Two distinct lattice translations produce a nonzero difference.

GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-first-native-interface — Minkowski first theorem boundary interface
The native statement is prototyped using actual fundamental-domain and original-lattice hypotheses. Other source-specific forms and examples retain their explicit refinement obligations.
For a countable additive lattice subgroup L of a finite-dimensional real normed space, a convex symmetric set S with μ(F)·2^dim<μ(S) contains a nonzero lattice point. For a compact S and discrete L, in a nontrivial ambient space, the non-strict ≥ threshold suffices. Dimension zero does not satisfy the compact theorem’s nontrivial-space hypothesis.
TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_1: For Z in R and S=[−1,1], the non-strict theorem finds ±1.
TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_2: The open interval (−1,1) at equality cannot use the compact variant.
TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_3: No nonzero vector is asserted in zero dimension.

GeometryOfNumbersAndQuadraticArithmetic:GN.1/ideal-class-application-import — Bounded ideal-class representatives
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
For a number field K of degree d, every ideal class of O_K has a nonzero integral representative I with N(I)≤(4/π)^r₂·d!/d^d·√|disc K|. The ideal class group is already finite in Mathlib. Geometry supplies this bound; no new class-group carrier is planned here.
TauCeti.GeometryOfNumbersPlan.ideal_class_application_import_test_1: The representative is nonzero integral, not an arbitrary fractional-ideal placeholder.
TauCeti.GeometryOfNumbersPlan.ideal_class_application_import_test_2: The factor d!/d^d and complex-place factor are retained.

GeometryOfNumbersAndQuadraticArithmetic:GN.1/unit-application-import — Dirichlet unit rank import
Native construction/statement is prototyped. Source-specific completion, quotient, smoothness or classification hypotheses and arithmetic examples beyond the displayed native context remain mathematical contracts in the reader.
The native quotient of O_K^× by its torsion subgroup is a finitely generated free abelian group of rank r₁+r₂−1; use the existing NumberField.Units Dirichlet API, not a new logarithmic unit lattice carrier.
TauCeti.GeometryOfNumbersPlan.unit_application_import_test_1: For Q the unit rank is zero.
TauCeti.GeometryOfNumbersPlan.unit_application_import_test_2: A complex place contributes one logarithmic unit coordinate even though it contributes two real embedding dimensions.

-/

namespace TauCeti.GeometryOfNumbersPlan
section ExistingFirstTheorems
open scoped Pointwise
open MeasureTheory.Measure
variable {E L : Type*} [MeasurableSpace E] {μ : Measure E} {F S : Set E}
theorem blichfeldt_native_interface [AddGroup L] [Countable L] [AddAction L E]
    [MeasurableSpace L] [MeasurableVAdd L E] [VAddInvariantMeasure L E μ]
    (fund : IsAddFundamentalDomain L F μ) (hS : NullMeasurableSet S μ)
    (h : μ F < μ S) :
    ∃ x y : L, x ≠ y ∧ ¬ Disjoint (x +ᵥ S) (y +ᵥ S) := by sorry

theorem minkowski_first_native_interface [NormedAddCommGroup E]
    [NormedSpace ℝ E] [BorelSpace E] [FiniteDimensional ℝ E]
    [Nontrivial E] [IsAddHaarMeasure μ]
    {L : AddSubgroup E} [Countable L] [DiscreteTopology L]
    (fund : IsAddFundamentalDomain L F μ) (hs : ∀ x ∈ S, -x ∈ S)
    (hc : Convex ℝ S) (hk : IsCompact S)
    (hv : μ F * 2 ^ finrank ℝ E ≤ μ S) :
    ∃ x : L, x ≠ 0 ∧ (x : E) ∈ S := by sorry
end ExistingFirstTheorems

section OriginalLLLVerification
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
theorem lll_original_lattice_verification (b c : Fin n → E)
    (cert : UnimodularBasisCertificate b c) (hc : IsLLLReduced c) (hn : 0<n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x≠0) :
    c ⟨0,hn⟩ ∈ Submodule.span ℤ (Set.range b) ∧ c ⟨0,hn⟩ ≠ 0 ∧
      ‖c ⟨0,hn⟩‖^2 ≤ (2 : ℝ)^(n-1)*‖x‖^2 := by sorry
end OriginalLLLVerification
end TauCeti.GeometryOfNumbersPlan

namespace TauCeti.GeometryOfNumbersPlan
/-- compact_star_body_test_1: the norm itself gives the native star-body gauge. -/
example : ∃ K : CompactStarBody (EuclideanSpace ℝ (Fin 2)), K.gauge=fun x => ‖x‖ := by sorry
/-- compact_star_body_test_2: the record admits the actual nonconvex gauge. -/
example : ∃ K : CompactStarBody (EuclideanSpace ℝ (Fin 2)),
    K.gauge=(fun x => (Real.sqrt |x 0|+Real.sqrt |x 1|)^2) ∧
      ¬ Convex ℝ {x | K.gauge x≤1} := by sorry
/-- packing_radius_test_1 -/
example (a : ℝ) (ha : 0<a) :
    latticePackingRadius (Submodule.span ℤ ({a} : Set ℝ))=a/2 := by sorry
/-- covering_radius_test_1 -/
example (a : ℝ) (ha : 0<a) :
    latticeCoveringRadius (Submodule.span ℤ ({a} : Set ℝ))=a/2 := by sorry
end TauCeti.GeometryOfNumbersPlan
