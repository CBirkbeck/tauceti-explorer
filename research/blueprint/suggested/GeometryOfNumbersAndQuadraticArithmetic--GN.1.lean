import Mathlib.Analysis.Convex.Body
import Mathlib.Analysis.Convex.Gauge
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Defs
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Div
import Mathlib.FieldTheory.IsAlgClosed.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Norm
import TauCeti.LinearAlgebra.IntegralLattice.Signature

/-!
# Geometry of numbers, Layer GN.1 follow-up: suggested Lean forms

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.1.md` is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`.

Conventions. Lattices are Mathlib's discrete full `Submodule ℤ E` (`DiscreteTopology`,
`IsZLattice ℝ`); bodies are `ConvexBody E` with `0` in the interior, symmetry assumed only where
stated; successive minima are real, zero-based, indexed by `Fin (finrank ℝ E)`. The two
declarations `successiveMin` and `latticeGaussianSum` restate, with real bodies, the base
packet's definitions (GN.1/successive-minimum and GN.4/lattice-gaussian-sum), so that this file
elaborates on its own; they are not new targets.
-/

noncomputable section

open Module MeasureTheory Polynomial
open scoped BigOperators Pointwise

namespace TauCeti.GeometryOfNumbersPlan

/-! ## Base-packet carriers restated -/

section Carriers
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- Base packet, GN.1/successive-minimum: the `i`-th (zero-based) successive minimum of `K`
with respect to `L`, the least nonnegative gauge bound whose lattice vectors span `i + 1`
dimensions. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) : ℝ :=
  sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
    finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}

end Carriers

section GaussianCarrier
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- Base packet, GN.4/lattice-gaussian-sum: `ρ_s(L + u) = ∑_{x ∈ L} exp(-π‖x + u‖²/s²)`. -/
def latticeGaussianSum (L : Submodule ℤ E) (s : ℝ) (u : E) : ℝ :=
  ∑' x : L, Real.exp (-Real.pi * ‖(x : E) + u‖ ^ 2 / s ^ 2)

/-- The inner dual of a lattice, `{y | ∀ x ∈ L, ⟪y, x⟫ ∈ ℤ}` (Mathlib's `dualSubmodule`). -/
abbrev innerDual (L : Submodule ℤ E) : Submodule ℤ E :=
  LinearMap.BilinForm.dualSubmodule (innerₗ E) L

end GaussianCarrier

/-! ## GN.1: partial products, the integral-norm bridge, Euclidean minima and covolume -/

section PartialProducts
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- GN.1/successive-minimum-partial-product: `a_k = λ_0 ⋯ λ_{k-1}`, the product of the first `k`
successive minima (all of them once `k ≥ finrank ℝ E`). -/
def successiveMinProd (L : Submodule ℤ E) (K : ConvexBody E) (k : ℕ) : ℝ :=
  ∏ i ∈ Finset.univ.filter (fun i : Fin (finrank ℝ E) => i.val < k), successiveMin L K i

theorem successiveMinProd_zero (L : Submodule ℤ E) (K : ConvexBody E) :
    successiveMinProd L K 0 = 1 := by sorry

theorem successiveMinProd_succ (L : Submodule ℤ E) (K : ConvexBody E) (k : ℕ)
    (hk : k < finrank ℝ E) :
    successiveMinProd L K (k + 1) = successiveMinProd L K k * successiveMin L K ⟨k, hk⟩ := by
  sorry

theorem successiveMinProd_of_le (L : Submodule ℤ E) (K : ConvexBody E) (k : ℕ)
    (hk : finrank ℝ E ≤ k) :
    successiveMinProd L K k = ∏ i : Fin (finrank ℝ E), successiveMin L K i := by sorry

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
include hK

theorem successiveMinProd_pos (k : ℕ) : 0 < successiveMinProd L K k := by sorry

theorem successiveMinProd_pow_le (k : ℕ) (hk : 1 ≤ k) (hkd : k ≤ finrank ℝ E) :
    successiveMin L K ⟨0, by omega⟩ ^ k ≤ successiveMinProd L K k ∧
      successiveMinProd L K k ≤ successiveMin L K ⟨k - 1, by omega⟩ ^ k := by sorry

theorem successiveMinProd_mul_pow_le (k j : ℕ) (hkj : k < j) (hj : j ≤ finrank ℝ E) :
    successiveMinProd L K k * successiveMin L K ⟨k, by omega⟩ ^ (j - k) ≤
      successiveMinProd L K j := by sorry

theorem successiveMinProd_smul_body (c : ℝ) (hc : 0 < c) (k : ℕ) :
    successiveMinProd L (c • K) k = successiveMinProd L K k / c ^ min k (finrank ℝ E) := by
  sorry

theorem successiveMinProd_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) [DiscreteTopology L'] [IsZLattice ℝ L']
    (K' : ConvexBody F) (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E)) (k : ℕ) :
    successiveMinProd L' K' k = successiveMinProd L K k := by sorry

end PartialProducts

section PartialProductsVolume
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- Minkowski's second theorem (base packet, both halves) restated with `a_d`. -/
theorem successiveMinProd_top_bounds (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E)) (hsym : ∀ x ∈ K, -x ∈ K) :
    (2 : ℝ) ^ finrank ℝ E / (finrank ℝ E).factorial * ZLattice.covolume L ≤
        successiveMinProd L K (finrank ℝ E) * volume.real (K : Set E) ∧
      successiveMinProd L K (finrank ℝ E) * volume.real (K : Set E) ≤
        2 ^ finrank ℝ E * ZLattice.covolume L := by sorry

end PartialProductsVolume

/-- Test `successiveMinProd_box_example`: for `ℤ²` and the box `|x₀| ≤ 1/2, |x₁| ≤ 1/3` the
partial products are `1, 2, 6`. -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 2)))
    (hL : L = Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ)))
    (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1 / 2 ∧ |x 1| ≤ 1 / 3}) :
    successiveMinProd L K 0 = 1 ∧ successiveMinProd L K 1 = 2 ∧ successiveMinProd L K 2 = 6 := by
  sorry

/-- Test `successiveMinProd_dim_zero`: in dimension zero every partial product is `1`. -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (K : ConvexBody (EuclideanSpace ℝ (Fin 0)))
    (k : ℕ) : successiveMinProd L K k = 1 := by sorry

/-- Test `successiveMinProd_cube`: for `ℤ^d` and the cube `[-1,1]^d` every partial product is `1`. -/
example (d : ℕ) (L : Submodule ℤ (EuclideanSpace ℝ (Fin d)))
    (hL : L = Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin d) ℝ)))
    (K : ConvexBody (EuclideanSpace ℝ (Fin d)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin d))) = {x | ∀ i, |x i| ≤ 1}) (k : ℕ) :
    successiveMinProd L K k = 1 := by sorry

/-- Test `successiveMinProd_not_shifted`: `a_1 = λ_0 = 2`, not `λ_0 λ_1 = 6`. -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 2)))
    (hL : L = Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin 2) ℝ)))
    (K : ConvexBody (EuclideanSpace ℝ (Fin 2)))
    (hK : (K : Set (EuclideanSpace ℝ (Fin 2))) = {x | |x 0| ≤ 1 / 2 ∧ |x 1| ≤ 1 / 3}) :
    successiveMinProd L K 1 ≠ 6 := by sorry

section IntegralNormBridge
variable {V : Type*} [AddCommGroup V] [Module ℚ V]
  {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- GN.1/integral-norm-minima-comparison: for a positive definite Tau Ceti integral lattice
realised isometrically in Euclidean space, the squared Euclidean minima are characterised by
independent families of bounded integral norm, the defining condition of the norm-valued,
zero-based minima of IntegralLattices milestone 2F. -/
theorem successiveMin_closedBall_sq_le_iff (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef)
    (ι : L.carrier →+ E) (hι : ∀ x, ‖ι x‖ ^ 2 = (L.integralNorm x : ℝ))
    (Λ : Submodule ℤ E) (hΛ : (Λ : Set E) = Set.range ι) [DiscreteTopology Λ] [IsZLattice ℝ Λ]
    (B : ConvexBody E) (hB : (B : Set E) = Metric.closedBall 0 1)
    (i : Fin (finrank ℝ E)) (c : ℕ) :
    successiveMin Λ B i ^ 2 ≤ c ↔
      ∃ x : Fin (i.val + 1) → L.carrier, LinearIndependent ℤ x ∧
        ∀ j, L.integralNorm (x j) ≤ (c : ℤ) := by sorry

/-- Consequence: every squared Euclidean minimum of such a realisation is a natural number. -/
theorem exists_nat_successiveMin_closedBall_sq (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef)
    (ι : L.carrier →+ E) (hι : ∀ x, ‖ι x‖ ^ 2 = (L.integralNorm x : ℝ))
    (Λ : Submodule ℤ E) (hΛ : (Λ : Set E) = Set.range ι) [DiscreteTopology Λ] [IsZLattice ℝ Λ]
    (B : ConvexBody E) (hB : (B : Set E) = Metric.closedBall 0 1) (i : Fin (finrank ℝ E)) :
    ∃ c : ℕ, successiveMin Λ B i ^ 2 = c := by sorry

end IntegralNormBridge

section DefiniteMinima
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- GN.1/definite-minima-discriminant: `covol Λ ≤ ∏ μ_i ≤ (2^r / V_r) covol Λ` for the Euclidean
minima `μ_i` of a full lattice, `V_r = π^{r/2} / Γ(r/2 + 1)`. -/
theorem covolume_le_prod_successiveMin_closedBall_le (Λ : Submodule ℤ E) [DiscreteTopology Λ]
    [IsZLattice ℝ Λ] (B : ConvexBody E) (hB : (B : Set E) = Metric.closedBall 0 1) :
    ZLattice.covolume Λ ≤ ∏ i, successiveMin Λ B i ∧
      ∏ i, successiveMin Λ B i ≤
        2 ^ finrank ℝ E * Real.Gamma (finrank ℝ E / 2 + 1) /
          Real.sqrt Real.pi ^ finrank ℝ E * ZLattice.covolume Λ := by sorry

end DefiniteMinima

/-! ## GN.1: bases from successive minima and Hermite's theorem -/

section Bases
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- GN.1/basis-from-minima (Evertse, Exercise 2.8): a `ℤ`-basis with `b_i ∈ (λ_0 + ⋯ + λ_i) K`
and, in particular, `gauge_K b_i ≤ (i + 1) λ_i`. -/
theorem exists_basis_gauge_le_sum_successiveMin (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      (∀ i, gauge (K : Set E) (b i) ≤
        ∑ j ∈ Finset.univ.filter (fun j : Fin (finrank ℝ E) => j ≤ i), successiveMin L K j) ∧
      ∀ i, gauge (K : Set E) (b i) ≤ (i.val + 1) * successiveMin L K i := by sorry

end Bases

section Hermite
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- GN.1/hermite-basis (Evertse, Theorem 2.11): a basis with
`∏ ‖b_i‖ ≤ (4/3)^{n(n-1)/4} covol L`. -/
theorem exists_basis_prod_norm_le_hermite (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L,
      ∏ i, ‖(b i : E)‖ ≤
        (4 / 3 : ℝ) ^ ((finrank ℝ E * (finrank ℝ E - 1) : ℕ) / 4 : ℝ) * ZLattice.covolume L := by
  sorry

/-- Hadamard's inequality for a `ℤ`-basis: `covol L ≤ ∏ ‖b_i‖` (the reverse bound). -/
theorem covolume_le_prod_norm_basis (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (b : Basis (Fin (finrank ℝ E)) ℤ L) :
    ZLattice.covolume L ≤ ∏ i, ‖(b i : E)‖ := by sorry

/-- GN.1/hermite-minima-product (a): Euclidean minima. -/
theorem prod_successiveMin_closedBall_le_hermite (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (B : ConvexBody E) (hB : (B : Set E) = Metric.closedBall 0 1) :
    ∏ i, successiveMin L B i ≤
      (4 / 3 : ℝ) ^ ((finrank ℝ E * (finrank ℝ E - 1) : ℕ) / 4 : ℝ) * ZLattice.covolume L := by
  sorry

end Hermite

/-! ## GN.1: central ellipsoids and John's theorem -/

section Ellipsoid
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- GN.1/central-ellipsoid: the image of the closed unit ball under `T`, as a convex body. -/
def ellipsoid (T : E ≃L[ℝ] E) : ConvexBody E where
  carrier := T '' Metric.closedBall 0 1
  convex' := (convex_closedBall 0 1).linear_image (T : E →ₗ[ℝ] E)
  isCompact' := (isCompact_closedBall 0 1).image T.continuous
  nonempty' := ⟨T 0, 0, Metric.mem_closedBall_self zero_le_one, rfl⟩

theorem mem_ellipsoid_iff (T : E ≃L[ℝ] E) (x : E) : x ∈ ellipsoid T ↔ ‖T.symm x‖ ≤ 1 := by sorry

@[simp] theorem gauge_ellipsoid (T : E ≃L[ℝ] E) (x : E) :
    gauge (ellipsoid T : Set E) x = ‖T.symm x‖ := by sorry

theorem ellipsoid_neg_mem (T : E ≃L[ℝ] E) {x : E} (hx : x ∈ ellipsoid T) :
    -x ∈ ellipsoid T := by sorry

theorem zero_mem_interior_ellipsoid (T : E ≃L[ℝ] E) : (0 : E) ∈ interior (ellipsoid T : Set E) := by
  sorry

theorem ellipsoid_refl : (ellipsoid (ContinuousLinearEquiv.refl ℝ E) : Set E) =
    Metric.closedBall 0 1 := by sorry

theorem image_ellipsoid (T S : E ≃L[ℝ] E) :
    S '' (ellipsoid T : Set E) = ellipsoid (T.trans S) := by sorry

theorem ellipsoid_smul (T : E ≃L[ℝ] E) (c : ℝ) (hc : 0 < c) :
    c • (ellipsoid T : Set E) = ellipsoid (T.trans (ContinuousLinearEquiv.smulLeft
      (Units.mk0 c hc.ne'))) := by sorry

theorem ellipsoid_eq_iff (T T' : E ≃L[ℝ] E) :
    ellipsoid T = ellipsoid T' ↔ ∀ x, ‖T.symm (T' x)‖ = ‖x‖ := by sorry

/-- Quadratic description: `E(T) = {x | ⟪x, P x⟫ ≤ 1}` with `P = (T Tᴴ)⁻¹`. -/
theorem ellipsoid_eq_quadratic (T : E ≃L[ℝ] E) :
    ∃ P : E →L[ℝ] E, (∀ x y, inner ℝ (P x) y = inner ℝ x (P y)) ∧
      (∀ x, x ≠ 0 → 0 < inner ℝ x (P x)) ∧
      (ellipsoid T : Set E) = {x | inner ℝ x (P x) ≤ 1} := by sorry

variable [MeasurableSpace E] [BorelSpace E]

theorem volume_ellipsoid (T : E ≃L[ℝ] E) :
    volume (ellipsoid T : Set E) =
      ENNReal.ofReal |LinearMap.det (T : E →ₗ[ℝ] E)| * volume (Metric.closedBall (0 : E) 1) := by
  sorry

/-- GN.1/hermite-minima-product (b): minima of a central ellipsoid. -/
theorem prod_successiveMin_ellipsoid_le_hermite (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (T : E ≃L[ℝ] E) :
    (∏ i, successiveMin L (ellipsoid T) i) * volume.real (ellipsoid T : Set E) ≤
      (4 / 3 : ℝ) ^ ((finrank ℝ E * (finrank ℝ E - 1) : ℕ) / 4 : ℝ) *
        volume.real (Metric.closedBall (0 : E) 1) * ZLattice.covolume L := by sorry

/-- GN.1/maximal-inscribed-ellipsoid. -/
theorem exists_isMaxOn_volume_ellipsoid_subset (K : ConvexBody E)
    (hK : (0 : E) ∈ interior (K : Set E)) (hsym : ∀ x ∈ K, -x ∈ K) :
    ∃ T : E ≃L[ℝ] E, (ellipsoid T : Set E) ⊆ K ∧
      ∀ T' : E ≃L[ℝ] E, (ellipsoid T' : Set E) ⊆ K →
        volume (ellipsoid T' : Set E) ≤ volume (ellipsoid T : Set E) := by sorry

/-- GN.1/john-decomposition: if the unit ball is a maximal inscribed central ellipsoid, the
identity is a positive combination of `u ⊗ u` over contact points, with weights summing to `n`. -/
theorem exists_john_decomposition (K : ConvexBody E) (hsym : ∀ x ∈ K, -x ∈ K)
    (hB : Metric.closedBall (0 : E) 1 ⊆ K)
    (hmax : ∀ T : E ≃L[ℝ] E, (ellipsoid T : Set E) ⊆ K →
      volume (ellipsoid T : Set E) ≤ volume (Metric.closedBall (0 : E) 1))
    (hn : 0 < finrank ℝ E) :
    ∃ (m : ℕ) (u : Fin m → E) (c : Fin m → ℝ),
      (∀ i, ‖u i‖ = 1 ∧ u i ∈ frontier (K : Set E)) ∧ (∀ i, 0 < c i) ∧
      (∀ x, x = ∑ i, (c i * inner ℝ x (u i)) • u i) ∧ ∑ i, c i = finrank ℝ E := by sorry

/-- GN.1/john-ellipsoid: `E(T) ⊆ K ⊆ √n · E(T)`. -/
theorem exists_ellipsoid_subset_subset_sqrt_smul (K : ConvexBody E)
    (hK : (0 : E) ∈ interior (K : Set E)) (hsym : ∀ x ∈ K, -x ∈ K) :
    ∃ T : E ≃L[ℝ] E, (ellipsoid T : Set E) ⊆ K ∧
      (K : Set E) ⊆ Real.sqrt (finrank ℝ E) • (ellipsoid T : Set E) := by sorry

/-- GN.1/john-weak-minkowski-second: `∏ λ_i vol K ≤ n^{n/2} (4/3)^{n(n-1)/4} V_n covol L`. -/
theorem prod_successiveMin_mul_volume_le_john (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) :
    (∏ i, successiveMin L K i) * volume.real (K : Set E) ≤
      Real.sqrt (finrank ℝ E) ^ finrank ℝ E *
        (4 / 3 : ℝ) ^ ((finrank ℝ E * (finrank ℝ E - 1) : ℕ) / 4 : ℝ) *
        volume.real (Metric.closedBall (0 : E) 1) * ZLattice.covolume L := by sorry

end Ellipsoid

/-- Test `ellipsoid_refl_eq_ball`. -/
example : (ellipsoid (ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin 3))) :
    Set (EuclideanSpace ℝ (Fin 3))) = Metric.closedBall 0 1 := by sorry

/-- The diagonal map `diag(2,3)` on the plane. -/
def diagTwoThree : EuclideanSpace ℝ (Fin 2) ≃L[ℝ] EuclideanSpace ℝ (Fin 2) :=
  (((WithLp.linearEquiv 2 ℝ (Fin 2 → ℝ)).trans
      (LinearEquiv.piCongrRight fun i : Fin 2 =>
        LinearEquiv.smulOfUnit (Units.mk0 (![2, 3] i : ℝ) (by fin_cases i <;> norm_num)))).trans
    (WithLp.linearEquiv 2 ℝ (Fin 2 → ℝ)).symm).toContinuousLinearEquiv

/-- Test `ellipsoid_diag_volume`: `vol E(diag(2,3)) = 6π`. -/
example : volume (ellipsoid diagTwoThree : Set (EuclideanSpace ℝ (Fin 2))) =
    ENNReal.ofReal (6 * Real.pi) := by sorry

/-- Test `ellipsoid_diag_gauge`. -/
example : gauge (ellipsoid diagTwoThree : Set (EuclideanSpace ℝ (Fin 2)))
    (EuclideanSpace.single 0 2) = 1 ∧
    gauge (ellipsoid diagTwoThree : Set (EuclideanSpace ℝ (Fin 2)))
      (EuclideanSpace.single 1 1) = 1 / 3 := by sorry

/-- Test `ellipsoid_dim_zero`. -/
example (T : EuclideanSpace ℝ (Fin 0) ≃L[ℝ] EuclideanSpace ℝ (Fin 0)) :
    (ellipsoid T : Set (EuclideanSpace ℝ (Fin 0))) = {0} ∧
      volume (ellipsoid T : Set (EuclideanSpace ℝ (Fin 0))) = 1 := by sorry

/-- Test `square_not_ellipsoid`: the unit square is not a central ellipsoid. -/
example : ∀ T : EuclideanSpace ℝ (Fin 2) ≃L[ℝ] EuclideanSpace ℝ (Fin 2),
    (ellipsoid T : Set (EuclideanSpace ℝ (Fin 2))) ≠ {x | |x 0| ≤ 1 ∧ |x 1| ≤ 1} := by sorry

/-- Hermite in dimension 2 is attained by the hexagonal lattice with minimal length 1. -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 2)))
    (hL : L = Submodule.span ℤ {EuclideanSpace.single 0 1,
      (1 / 2 : ℝ) • EuclideanSpace.single 0 1 + (Real.sqrt 3 / 2) • EuclideanSpace.single 1 1})
    [DiscreteTopology L] [IsZLattice ℝ L] :
    ZLattice.covolume L = Real.sqrt 3 / 2 ∧
      (4 / 3 : ℝ) ^ ((2 * (2 - 1) : ℕ) / 4 : ℝ) * ZLattice.covolume L = 1 := by sorry

/-! ## GN.1: Smith's evaluation polytopes -/

section EvaluationPolytope
variable {m : ℕ}

/-- GN.1/evaluation-polytope: coefficient vectors `a` (constant term first) of real polynomials of
degree `≤ m` with `v_k |P_a(α_k)| ≤ 1` for every node. -/
def evaluationPolytope (α : Fin (m + 1) → ℝ) (hα : Function.Injective α)
    (v : Fin (m + 1) → ℝ) (hv : ∀ k, 0 < v k) : ConvexBody (EuclideanSpace ℝ (Fin (m + 1))) where
  carrier := {a | ∀ k, v k * |∑ j, a j * α k ^ (j : ℕ)| ≤ 1}
  convex' := by sorry
  isCompact' := by sorry
  nonempty' := ⟨0, fun k => by simp⟩

/-- The integer polynomials of degree `≤ m`, as the standard lattice in coefficient space. -/
def intCoeffLattice (m : ℕ) : Submodule ℤ (EuclideanSpace ℝ (Fin (m + 1))) :=
  Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin (m + 1)) ℝ))

instance (m : ℕ) : DiscreteTopology (intCoeffLattice m) := by sorry
instance (m : ℕ) : IsZLattice ℝ (intCoeffLattice m) := by sorry

theorem covolume_intCoeffLattice (m : ℕ) : ZLattice.covolume (intCoeffLattice m) = 1 := by sorry

variable (α : Fin (m + 1) → ℝ) (hα : Function.Injective α) (v : Fin (m + 1) → ℝ)
  (hv : ∀ k, 0 < v k)

theorem mem_evaluationPolytope_iff (a : EuclideanSpace ℝ (Fin (m + 1))) :
    a ∈ evaluationPolytope α hα v hv ↔ ∀ k, v k * |∑ j, a j * α k ^ (j : ℕ)| ≤ 1 := Iff.rfl

theorem mem_evaluationPolytope_iff_eval (P : degreeLT ℝ (m + 1)) :
    (WithLp.equiv 2 (Fin (m + 1) → ℝ)).symm (degreeLTEquiv ℝ (m + 1) P) ∈
        evaluationPolytope α hα v hv ↔
      ∀ k, v k * |(P : ℝ[X]).eval (α k)| ≤ 1 := by sorry

theorem evaluationPolytope_eq_preimage :
    (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin (m + 1)))) =
      {a | ∀ k, |(Matrix.vandermonde α).mulVec (fun j => a j) k| ≤ 1 / v k} := by sorry

theorem gauge_evaluationPolytope (a : EuclideanSpace ℝ (Fin (m + 1))) :
    gauge (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin (m + 1)))) a =
      Finset.univ.sup' Finset.univ_nonempty (fun k => v k * |∑ j, a j * α k ^ (j : ℕ)|) := by
  sorry

theorem evaluationPolytope_neg_mem {a : EuclideanSpace ℝ (Fin (m + 1))}
    (ha : a ∈ evaluationPolytope α hα v hv) : -a ∈ evaluationPolytope α hα v hv := by sorry

theorem zero_mem_interior_evaluationPolytope :
    (0 : EuclideanSpace ℝ (Fin (m + 1))) ∈
      interior (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin (m + 1)))) := by sorry

theorem evaluationPolytope_smul (c : ℝ) (hc : 0 < c) :
    c • (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin (m + 1)))) =
      evaluationPolytope α hα (fun k => v k / c) (fun k => div_pos (hv k) hc) := by sorry

theorem evaluationPolytope_antitone (v' : Fin (m + 1) → ℝ) (hv' : ∀ k, 0 < v' k)
    (hvv' : ∀ k, v k ≤ v' k) :
    (evaluationPolytope α hα v' hv' : Set (EuclideanSpace ℝ (Fin (m + 1)))) ⊆
      evaluationPolytope α hα v hv := by sorry

/-- GN.1/evaluation-polytope-volume. -/
theorem volume_evaluationPolytope :
    volume (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin (m + 1)))) =
      ENNReal.ofReal (2 ^ (m + 1) /
        ((∏ k, v k) * ∏ i, ∏ j ∈ Finset.Ioi i, |α j - α i|)) := by sorry

/-- GN.1/evaluation-polytope-minima (Smith, Proposition 3.4):
`D / (m+1)! ≤ λ_0 ⋯ λ_m ≤ D` with `D = ∏ v_k ∏_{i<j} |α_i - α_j|`. -/
theorem evaluationPolytope_successiveMin_prod_bounds :
    ((∏ k, v k) * ∏ i, ∏ j ∈ Finset.Ioi i, |α j - α i|) / (m + 1).factorial ≤
        ∏ i, successiveMin (intCoeffLattice m) (evaluationPolytope α hα v hv) i ∧
      ∏ i, successiveMin (intCoeffLattice m) (evaluationPolytope α hα v hv) i ≤
        (∏ k, v k) * ∏ i, ∏ j ∈ Finset.Ioi i, |α j - α i| := by sorry

end EvaluationPolytope

/-- Test `evaluationPolytope_m_zero`: for `m = 0` the body is `[-1/v₀, 1/v₀]`. -/
example (α v : Fin 1 → ℝ) (hα : Function.Injective α) (hv : ∀ k, 0 < v k) :
    (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin 1))) =
      {a | |a 0| ≤ 1 / v 0} := by sorry

/-- Test `evaluationPolytope_area_example`: `α = (0,1)`, `v = (1,1)` gives area `4`. -/
example (h : Function.Injective (![0, 1] : Fin 2 → ℝ)) :
    volume (evaluationPolytope ![0, 1] h ![1, 1] (by intro k; fin_cases k <;> norm_num) :
      Set (EuclideanSpace ℝ (Fin 2))) = 4 := by sorry

/-- Test `evaluationPolytope_gauge_one`: the constant polynomial `1` has gauge `max v_k`. -/
example (α : Fin 2 → ℝ) (hα : Function.Injective α) (v : Fin 2 → ℝ) (hv : ∀ k, 0 < v k) :
    gauge (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin 2)))
      (EuclideanSpace.single 0 1) = max (v 0) (v 1) := by sorry

/-- Test `evaluationPolytope_vandermonde_compat`: the carrier is a Vandermonde preimage of a box. -/
example (α : Fin 3 → ℝ) (hα : Function.Injective α) (v : Fin 3 → ℝ) (hv : ∀ k, 0 < v k) :
    (evaluationPolytope α hα v hv : Set (EuclideanSpace ℝ (Fin 3))) =
      (fun a : EuclideanSpace ℝ (Fin 3) => (Matrix.vandermonde α).mulVec (fun j => a j)) ⁻¹'
        {y | ∀ k, |y k| ≤ 1 / v k} := by sorry

/-- Test `evaluationPolytope_repeated_node`: with a repeated node the defining set is unbounded. -/
example (v : Fin 2 → ℝ) (hv : ∀ k, 0 < v k) :
    ¬ Bornology.IsBounded {a : EuclideanSpace ℝ (Fin 2) |
      ∀ k, v k * |∑ j, a j * (![0, 0] : Fin 2 → ℝ) k ^ (j : ℕ)| ≤ 1} := by sorry

/-- Smith's bound attained above: `α = (0,1)`, `v = (1,1)` has both minima `1` and `D = 1`. -/
example (h : Function.Injective (![0, 1] : Fin 2 → ℝ)) :
    ∏ i, successiveMin (intCoeffLattice 1)
      (evaluationPolytope ![0, 1] h ![1, 1] (by intro k; fin_cases k <;> norm_num)) i = 1 := by
  sorry

/-! ## GN.1: cofactors of a squarefree integer polynomial -/

section Cofactors
variable {n : ℕ}

/-- GN.1/cofactor-polynomials: `Q_i = Q / (X - α_i)` in `ℂ[X]`. -/
def cofactor (Q : ℤ[X]) (α : Fin n → ℂ) (i : Fin n) : ℂ[X] :=
  (Q.map (Int.castRingHom ℂ)) /ₘ (X - C (α i))

variable (Q : ℤ[X]) (hQ : Squarefree Q) (hdeg : Q.natDegree = n) (α : Fin n → ℂ)
  (hα : Function.Injective α) (hroot : ∀ i, (Q.map (Int.castRingHom ℂ)).IsRoot (α i))
include hQ hdeg hα hroot

theorem X_sub_C_mul_cofactor (i : Fin n) :
    (X - C (α i)) * cofactor Q α i = Q.map (Int.castRingHom ℂ) := by sorry

theorem natDegree_cofactor (i : Fin n) :
    (cofactor Q α i).natDegree = n - 1 ∧ (cofactor Q α i).leadingCoeff = (Q.leadingCoeff : ℂ) := by
  sorry

theorem coeff_cofactor (i : Fin n) (j : ℕ) :
    (cofactor Q α i).coeff j =
      ∑ k ∈ Finset.Icc (j + 1) n, α i ^ (k - (j + 1)) * (Q.coeff k : ℂ) := by sorry

theorem cofactor_eval_self (i : Fin n) :
    (cofactor Q α i).eval (α i) = ((derivative Q).map (Int.castRingHom ℂ)).eval (α i) ∧
      (cofactor Q α i).eval (α i) ≠ 0 := by sorry

theorem cofactor_eval_of_ne {i k : Fin n} (hik : k ≠ i) : (cofactor Q α i).eval (α k) = 0 := by
  sorry

theorem cofactorBasis :
    ∃ b : Basis (Fin n) ℂ (degreeLT ℂ n), (∀ i, (b i : ℂ[X]) = cofactor Q α i) ∧
      ∀ P : degreeLT ℂ n, (P : ℂ[X]) = ∑ i, ((P : ℂ[X]).eval (α i) /
        ((derivative Q).map (Int.castRingHom ℂ)).eval (α i)) • cofactor Q α i := by sorry

theorem isIntegral_coeff_cofactor (i : Fin n) (j : ℕ) : IsIntegral ℤ ((cofactor Q α i).coeff j) := by
  sorry

theorem cofactor_map_ringEquiv (σ : ℂ ≃+* ℂ) (π : Fin n → Fin n) (hπ : ∀ i, σ (α i) = α (π i))
    (i : Fin n) : (cofactor Q α i).map (σ : ℂ →+* ℂ) = cofactor Q α (π i) := by sorry

theorem cofactor_conj {i k : Fin n} (hik : starRingEnd ℂ (α i) = α k) :
    (cofactor Q α i).map (starRingEnd ℂ) = cofactor Q α k := by sorry

/-- GN.1/cofactor-integer-functional: a nonzero integer coefficient functional takes a value of
absolute value at least `1` on some cofactor; the product of the nonzero values is an integer. -/
theorem exists_one_le_norm_cofactor_functional (d : Fin n → ℤ) (hd : d ≠ 0) :
    (∃ i, 1 ≤ ‖∑ j : Fin n, (d j : ℂ) * (cofactor Q α i).coeff j‖) ∧
      ∃ z : ℤ, z ≠ 0 ∧
        ∏ i ∈ Finset.univ.filter (fun i => ∑ j : Fin n, (d j : ℂ) * (cofactor Q α i).coeff j ≠ 0),
          (∑ j : Fin n, (d j : ℂ) * (cofactor Q α i).coeff j) = z := by sorry

end Cofactors

/-- Test `cofactor_sq_sub_two`. -/
example : cofactor (X ^ 2 - 2) ![(Real.sqrt 2 : ℂ), -(Real.sqrt 2 : ℂ)] 0 =
    X + C (Real.sqrt 2 : ℂ) := by sorry

/-- Test `cofactor_two_sq_sub_one_integral`. -/
example : cofactor (2 * X ^ 2 - 1) ![(1 / Real.sqrt 2 : ℂ), -(1 / Real.sqrt 2 : ℂ)] 0 =
      C 2 * X + C (Real.sqrt 2 : ℂ) ∧
    IsIntegral ℤ (Real.sqrt 2 : ℂ) ∧ ¬ IsIntegral ℤ (1 / Real.sqrt 2 : ℂ) := by sorry

/-- Test `cofactor_degree_one`. -/
example (c a : ℤ) (hc : c ≠ 0) :
    cofactor (C c * X - C a) ![((a : ℂ) / c)] 0 = C (c : ℂ) := by sorry

/-- Test `cofactor_not_squarefree`. -/
example : cofactor (X ^ 2) ![(0 : ℂ), 0] 0 = X ∧ cofactor (X ^ 2) ![(0 : ℂ), 0] 1 = X ∧
    ¬ Squarefree (X ^ 2 : ℤ[X]) := by sorry

section RealCofactors
variable {n : ℕ}

/-- GN.1/real-cofactor-basis: realified cofactors, with `τ` the conjugation involution on root
indices (`α (τ i) = conj (α i)`). -/
def realCofactor (Q : ℤ[X]) (α : Fin n → ℂ) (τ : Fin n → Fin n) (i : Fin n) : ℝ[X] :=
  ∑ j ∈ Finset.range n, C (if τ i = i then ((cofactor Q α i).coeff j).re
    else if i < τ i then Real.sqrt 2 * ((cofactor Q α i).coeff j).re
    else -(Real.sqrt 2 * ((cofactor Q α (τ i)).coeff j).im)) * X ^ j

variable (Q : ℤ[X]) (hQ : Squarefree Q) (hdeg : Q.natDegree = n) (α : Fin n → ℂ)
  (hα : Function.Injective α) (hroot : ∀ i, (Q.map (Int.castRingHom ℂ)).IsRoot (α i))
  (τ : Fin n → Fin n) (hτ : ∀ i, α (τ i) = starRingEnd ℂ (α i)) (hτ2 : ∀ i, τ (τ i) = i)
include hQ hdeg hα hroot hτ hτ2

theorem realCofactor_of_isReal (i : Fin n) (hi : τ i = i) :
    (realCofactor Q α τ i).map Complex.ofRealHom = cofactor Q α i := by sorry

theorem realCofactorBasis :
    ∃ b : Basis (Fin n) ℝ (degreeLT ℝ n), ∀ i, (b i : ℝ[X]) = realCofactor Q α τ i := by sorry

theorem realCofactor_functional (d : Fin n → ℤ) (hd : d ≠ 0) :
    ∃ i, 1 ≤ |∑ j : Fin n, (d j : ℝ) * (realCofactor Q α τ i).coeff j| := by sorry

theorem realCofactor_coord_transfer (γ : Fin n → ℝ) :
    ∃ β : Fin n → ℂ,
      (∑ i, γ i • realCofactor Q α τ i).map Complex.ofRealHom = ∑ i, β i • cofactor Q α i ∧
        ∑ i, ‖β i‖ ≤ Real.sqrt 2 * ∑ i, |γ i| := by sorry

theorem realCofactor_totallyReal (hreal : ∀ i, τ i = i) (i : Fin n) :
    (realCofactor Q α τ i).map Complex.ofRealHom = cofactor Q α i := by sorry

end RealCofactors

/-- Test `realCofactor_X_sq_add_one`: for `X² + 1` the realified cofactors are `√2 X` and `-√2`. -/
example : realCofactor (X ^ 2 + 1) ![Complex.I, -Complex.I] ![1, 0] 0 = C (Real.sqrt 2) * X ∧
    realCofactor (X ^ 2 + 1) ![Complex.I, -Complex.I] ![1, 0] 1 = -C (Real.sqrt 2) := by sorry

/-- Test `realCofactor_totally_real_example`. -/
example : (realCofactor (X ^ 2 - 2) ![(Real.sqrt 2 : ℂ), -(Real.sqrt 2 : ℂ)] id 0).map
    Complex.ofRealHom = X + C (Real.sqrt 2 : ℂ) := by sorry

/-- Test `realCofactor_functional_example`: `d = (1,1)` on `X² + 1` gives values `±√2`. -/
example : ∀ i : Fin 2, Real.sqrt 2 ≤
    |∑ j : Fin 2, ((![1, 1] : Fin 2 → ℤ) j : ℝ) *
      (realCofactor (X ^ 2 + 1) ![Complex.I, -Complex.I] ![1, 0] i).coeff j| := by sorry

/-- Test `realCofactor_needs_sqrt_two`: for `X² - X + 1` and `d = (1,0)`, the unnormalised real and
imaginary parts of `d(Q_i)` both have absolute value `< 1`. -/
example (α : Fin 2 → ℂ) (hα : α = ![(1 + Complex.I * Real.sqrt 3) / 2,
      (1 - Complex.I * Real.sqrt 3) / 2]) :
    |((cofactor (X ^ 2 - X + 1) α 0).coeff 0).re| < 1 ∧
      |((cofactor (X ^ 2 - X + 1) α 0).coeff 0).im| < 1 := by sorry

/-! ## GN.4 nodes of this follow-up: Gaussian tails and the ℓ¹ covering bound -/

section GaussianCovering
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- GN.4/gaussian-directional-tail. -/
theorem gaussian_directional_tail (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (c u : E) (hu : ‖u‖ = 1) (r : ℝ) (hr : 0 ≤ r) :
    (∑' x : {x : L // r ≤ |inner ℝ ((x : E) + c) u|},
        Real.exp (-Real.pi * ‖((x : L) : E) + c‖ ^ 2)) ≤
      2 * Real.exp (-Real.pi * r ^ 2) * latticeGaussianSum L 1 0 := by sorry

/-- GN.4/gaussian-coordinate-tails, (a) sup-norm tail and (b) ℓ¹ moment and tail. -/
theorem gaussian_coordinate_tails (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (e : OrthonormalBasis (Fin (finrank ℝ E)) ℝ E) (c : E) :
    (∀ r : ℝ, 0 ≤ r →
      (∑' x : {x : L // ∃ i, r ≤ |inner ℝ ((x : E) + c) (e i)|},
          Real.exp (-Real.pi * ‖((x : L) : E) + c‖ ^ 2)) ≤
        2 * finrank ℝ E * Real.exp (-Real.pi * r ^ 2) * latticeGaussianSum L 1 0) ∧
    (∑' x : L, Real.exp (-Real.pi * ‖(x : E) + c‖ ^ 2) *
        ∑ i, |inner ℝ ((x : E) + c) (e i)|) ≤ finrank ℝ E * latticeGaussianSum L 1 0 ∧
    (∀ r : ℝ, 0 < r →
      (∑' x : {x : L // r ≤ ∑ i, |inner ℝ ((x : E) + c) (e i)|},
          Real.exp (-Real.pi * ‖((x : L) : E) + c‖ ^ 2)) ≤
        finrank ℝ E / r * latticeGaussianSum L 1 0) := by sorry

/-- GN.4/l1-covering-transference: `μ₁(L) · λ₁^∞(L*) ≤ 3n √(log(8n)/π) ≤ 6n log(2n)`. -/
theorem exists_mem_sum_abs_inner_lt_of_dual (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (e : OrthonormalBasis (Fin (finrank ℝ E)) ℝ E) (hn : 0 < finrank ℝ E)
    (m : ℝ) (hm : 0 < m)
    (hdual : ∀ y ∈ innerDual L, y ≠ 0 → ∃ i, m ≤ |inner ℝ y (e i)|) (t : E) :
    ∃ v ∈ L, ∑ i, |inner ℝ (t - v) (e i)| <
      3 * finrank ℝ E / m * Real.sqrt (Real.log (8 * finrank ℝ E) / Real.pi) := by sorry

theorem three_mul_sqrt_log_le (n : ℕ) (hn : 1 ≤ n) :
    3 * n * Real.sqrt (Real.log (8 * n) / Real.pi) ≤ 6 * n * Real.log (2 * n) := by sorry

end GaussianCovering

/-- GN.4/smith-cofactor-adjustment (Smith, Theorem 3.2): every real polynomial of degree `< n` is
an integer polynomial plus `∑ β_i Q_i` with `∑ |β_i| < 3√2 n √(log(8n)/π) ≤ 9 n log(2n)`. -/
theorem smith_cofactor_adjustment {n : ℕ} (hn : 1 ≤ n) (Q : ℤ[X]) (hQ : Squarefree Q)
    (hdeg : Q.natDegree = n) (α : Fin n → ℂ) (hα : Function.Injective α)
    (hroot : ∀ i, (Q.map (Int.castRingHom ℂ)).IsRoot (α i)) (P : ℝ[X]) (hP : P.degree < n) :
    ∃ β : Fin n → ℂ, ∑ i, ‖β i‖ < 3 * Real.sqrt 2 * n * Real.sqrt (Real.log (8 * n) / Real.pi) ∧
      ∃ R : ℤ[X], R.degree < n ∧
        P.map Complex.ofRealHom - ∑ i, β i • cofactor Q α i = R.map (Int.castRingHom ℂ) := by sorry

theorem smith_constant_le (n : ℕ) (hn : 1 ≤ n) :
    3 * Real.sqrt 2 * n * Real.sqrt (Real.log (8 * n) / Real.pi) ≤ 9 * n * Real.log (2 * n) := by
  sorry

/-- Smith's theorem for `n = 1`: `Q = cX - a`, the cofactor is `c`, and `β = (p - k)/c`. -/
example (c a : ℤ) (hc : c ≠ 0) (p : ℝ) :
    ∃ β : ℂ, ‖β‖ ≤ 1 / 2 ∧ ∃ k : ℤ, (p : ℂ) - β * c = k := by sorry
end TauCeti.GeometryOfNumbersPlan
