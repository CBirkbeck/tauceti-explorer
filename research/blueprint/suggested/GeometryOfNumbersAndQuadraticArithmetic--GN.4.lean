import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Convex.Body
import Mathlib.Analysis.Convex.Gauge
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.MeasureTheory.Measure.Haar.Quotient
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Analysis.Normed.Algebra.MatrixExponential
import Mathlib.Analysis.Complex.UpperHalfPlane.Metric
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Dynamics.Ergodic.Ergodic
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Data.ZMod.ValMinAbs
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Analysis.Asymptotics.Defs

/-!
# Geometry of numbers, Layer GN.4 follow-up: suggested Lean forms

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.4.md` is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`.

Conventions. Lattices are Mathlib's discrete full `Submodule ℤ E` (`DiscreteTopology`,
`IsZLattice ℝ`) in a finite-dimensional real inner-product space; Euclidean successive minima
are indexed from `0` by `Fin (finrank ℝ E)` (the document indexes from `1`). The space of
lattices is `SL(n, ℝ) ⧸ SL(n, ℤ)` with left cosets and the column convention `gΓ ↦ gℤⁿ`.
`euclMin` restates with a real body the base packet's successive minimum for the unit ball
(GN.1/successive-minimum) so that this file elaborates on its own; it is not a new target.
Statements whose carriers are not at the pins are listed in the closing comment.
-/

noncomputable section

open Module MeasureTheory Filter Topology Metric
open scoped BigOperators Pointwise

namespace TauCeti.GeometryOfNumbersPlan

section Carriers
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- Base packet GN.1/successive-minimum for the closed unit ball: the `i`-th (zero-based)
Euclidean successive minimum of `L`. -/
def euclMin (L : Submodule ℤ E) (i : Fin (finrank ℝ E)) : ℝ :=
  sInf {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
    finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ ‖x‖ ≤ r})}

/-- The product `λ_0 ⋯ λ_{j-1}` of the first `j` Euclidean minima (GN.1 partial products). -/
def euclMinProd (L : Submodule ℤ E) (j : ℕ) : ℝ :=
  ∏ i : Fin (finrank ℝ E) with i.val < j, euclMin L i

/-- Length of a shortest nonzero vector. -/
def minNorm (L : Submodule ℤ E) : ℝ :=
  sInf {r : ℝ | ∃ x ∈ L, x ≠ 0 ∧ ‖x‖ = r}

end Carriers

/-! ## 4.6 Davenport's principle and semialgebraic regions -/

section Davenport
variable {n : ℕ}

/-- The coordinate projection `ℝⁿ → ℝ^J`. -/
def coordProj (J : Finset (Fin n)) (x : Fin n → ℝ) : J → ℝ := fun j ↦ x j

/-- `V_J(Z)`: outer Lebesgue measure of the projection of `Z` onto the coordinates in `J`. -/
def coordProjVolume (Z : Set (Fin n → ℝ)) (J : Finset (Fin n)) : ENNReal :=
  volume (coordProj J '' Z)

/-- `V_j(Z)`, the sum over `|J| = j`, with `V_0 = 1`. -/
def coordProjVolumeSum (Z : Set (Fin n → ℝ)) (j : ℕ) : ENNReal :=
  if j = 0 then 1 else ∑ J ∈ (Finset.univ : Finset (Finset (Fin n))) with J.card = j,
    coordProjVolume Z J

/-- Bhargava–Shankar's `Vol(R̄)`: the largest projection volume in dimensions `1, …, n-1`. -/
def projMaxVolume (Z : Set (Fin n → ℝ)) : ENNReal :=
  ⨆ (J : Finset (Fin n)) (_ : 1 ≤ J.card ∧ J.card + 1 ≤ n), coordProjVolume Z J

theorem coordProjVolumeSum_zero (Z : Set (Fin n → ℝ)) : coordProjVolumeSum Z 0 = 1 := by
  simp [coordProjVolumeSum]

theorem coordProjVolume_mono {Z Z' : Set (Fin n → ℝ)} (h : Z ⊆ Z') (J : Finset (Fin n)) :
    coordProjVolume Z J ≤ coordProjVolume Z' J := sorry

theorem coordProjVolume_vadd (Z : Set (Fin n → ℝ)) (v : Fin n → ℝ) (J : Finset (Fin n)) :
    coordProjVolume (v +ᵥ Z) J = coordProjVolume Z J := sorry

theorem coordProjVolume_smul (Z : Set (Fin n → ℝ)) (c : ℝ) (J : Finset (Fin n)) :
    coordProjVolume (c • Z) J = ENNReal.ofReal (|c| ^ J.card) * coordProjVolume Z J := sorry

/-- Test `coordProjVolume_unitCube`. -/
example (J : Finset (Fin n)) : coordProjVolume (Set.Icc (0 : Fin n → ℝ) 1) J = 1 := sorry

/-- Test `coordProjVolume_diagonal`: the diagonal segment has volume `0` but `V_1 = 2`. -/
example : volume ((fun t : ℝ ↦ ![t, t]) '' Set.Icc 0 1) = 0 ∧
    coordProjVolumeSum ((fun t : ℝ ↦ ![t, t]) '' Set.Icc 0 1) 1 = 2 := sorry

/-- The line section of `Z` through `y` parallel to the `i`-th axis. -/
def lineSection {ι : Type*} [DecidableEq ι] (Z : Set (ι → ℝ)) (i : ι) (y : ι → ℝ) : Set ℝ :=
  {t | Function.update y i t ∈ Z}

/-- Davenport's interval condition with constant `h`: every axis-parallel line meets `Z` in a
union of at most `h` intervals. -/
def IntervalCondition {ι : Type*} [DecidableEq ι] (h : ℕ) (Z : Set (ι → ℝ)) : Prop :=
  ∀ i y, ∃ I : Fin h → Set ℝ, (∀ k, (I k).OrdConnected) ∧ lineSection Z i y = ⋃ k, I k

/-- Davenport's principle (davenport-principle). -/
theorem abs_card_inter_sub_volume_le_davenport (h : ℕ) (Z : Set (Fin n → ℝ)) (hZ : IsCompact Z)
    (h1 : IntervalCondition h Z)
    (h2 : ∀ J : Finset (Fin n), IntervalCondition h (coordProj J '' Z)) :
    |((Z ∩ Set.range (fun z : Fin n → ℤ ↦ fun i ↦ (z i : ℝ))).ncard : ℝ) - (volume Z).toReal| ≤
      ∑ j ∈ Finset.range n, (h : ℝ) ^ (n - j) * (coordProjVolumeSum Z j).toReal := sorry

/-- Description complexity at most `(k, ℓ)`: a sign condition on `k` polynomials of degree `≤ ℓ`. -/
def HasComplexity (k ℓ : ℕ) (S : Set (Fin n → ℝ)) : Prop :=
  ∃ f : Fin k → MvPolynomial (Fin n) ℝ, (∀ i, (f i).totalDegree ≤ ℓ) ∧
    ∃ σs : Set (Fin k → SignType), S = {x | (fun i ↦ SignType.sign (MvPolynomial.eval x (f i))) ∈ σs}

theorem HasComplexity.compl {k ℓ : ℕ} {S : Set (Fin n → ℝ)} (hS : HasComplexity k ℓ S) :
    HasComplexity k ℓ Sᶜ := sorry

theorem HasComplexity.inter {k ℓ k' ℓ' : ℕ} {S T : Set (Fin n → ℝ)} (hS : HasComplexity k ℓ S)
    (hT : HasComplexity k' ℓ' T) : HasComplexity (k + k') (max ℓ ℓ') (S ∩ T) := sorry

theorem HasComplexity.image_affine {k ℓ : ℕ} {S : Set (Fin n → ℝ)} (hS : HasComplexity k ℓ S)
    (e : (Fin n → ℝ) ≃ᵃ[ℝ] (Fin n → ℝ)) : HasComplexity k ℓ (e '' S) := sorry

/-- Test `hasComplexity_closedBall`. -/
example : HasComplexity 1 2 (Metric.closedBall (0 : Fin 1 → ℝ) 1) := sorry

/-- Test `not_hasComplexity_integers`. -/
example (k ℓ : ℕ) : ¬ HasComplexity k ℓ (Set.range (fun z : Fin 1 → ℤ ↦ fun i ↦ (z i : ℝ))) :=
  sorry

/-- Uniform component bound (semialgebraic-uniform-components), for complexity-bounded sets. -/
theorem exists_card_components_le (n k ℓ : ℕ) :
    ∃ B : ℕ, ∀ S : Set (Fin n → ℝ), HasComplexity k ℓ S →
      ∃ C : Fin B → Set (Fin n → ℝ), (∀ j, IsPreconnected (C j)) ∧ S = ⋃ j, C j := sorry

/-- The interval condition for complexity-bounded sets (semialgebraic-interval-condition (a)). -/
theorem hasComplexity_interval_condition (n k ℓ : ℕ) :
    ∃ h : ℕ, ∀ Z : Set (Fin n → ℝ), HasComplexity k ℓ Z →
      ∀ J : Finset (Fin n), IntervalCondition h (coordProj J '' Z) := sorry

/-- Davenport's estimate for upper triangular unipotent images (unipotent-davenport-transfer),
stated for complexity-bounded regions. -/
theorem abs_card_unipotent_image_inter_sub_volume_le (n k ℓ : ℕ) :
    ∃ C : ℝ, ∀ (Z : Set (Fin n → ℝ)), Bornology.IsBounded Z → HasComplexity k ℓ Z →
      ∀ u : Matrix (Fin n) (Fin n) ℝ, u.BlockTriangular id → (∀ i, u i i = 1) →
      |(((Matrix.toLin' u) '' Z ∩ Set.range (fun z : Fin n → ℤ ↦ fun i ↦ (z i : ℝ))).ncard : ℝ)
          - (volume Z).toReal| ≤ C * max 1 (projMaxVolume Z).toReal := sorry

end Davenport

/-! ## 4.7 Counting by successive minima -/

section Minima
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- ball-count-successive-minima. -/
theorem card_inter_closedBall_le_successiveMinima (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (T : ℝ) (hT : 0 < T) :
    ((L : Set E) ∩ closedBall 0 T).ncard ≤
      (2 : ℝ) ^ (3 * finrank ℝ E - 1) *
        ∑ j ∈ Finset.range (finrank ℝ E + 1), T ^ j / euclMinProd L j := sorry

/-- ball-count-intermediate-minimum. -/
theorem card_inter_closedBall_le_of_minimum_le (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (i₀ : Fin (finrank ℝ E)) (T : ℝ) (hT : euclMin L i₀ ≤ T) :
    ((L : Set E) ∩ closedBall 0 T).ncard ≤
      (2 : ℝ) ^ (3 * finrank ℝ E - 1) * (finrank ℝ E + 1) * T ^ finrank ℝ E /
        (euclMinProd L i₀.val * euclMin L i₀ ^ (finrank ℝ E - i₀.val)) := sorry

/-- bounded-domain-count (Schmidt, with the constant term). -/
theorem card_smul_inter_le_max (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (D : Set E) (hD : Bornology.IsBounded D) :
    ∃ C : ℝ, ∀ Y : ℝ, 0 < Y → ((L : Set E) ∩ Y • D).ncard ≤
      C * ⨆ j : Fin (finrank ℝ E + 1), Y ^ (j : ℕ) / euclMinProd L j := sorry

/-- Test `bounded_domain_constant_term`: the origin is counted for every `Y > 0`. -/
example (L : Submodule ℤ E) (D : Set E) (h0 : (0 : E) ∈ D) (Y : ℝ) :
    (0 : E) ∈ (L : Set E) ∩ Y • D := sorry

/-- adapted-basis-coordinates. -/
theorem exists_basis_abs_repr_le (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L, ∃ c : ℝ,
      (∀ j, ‖(b j : E)‖ ≤ (j.val + 1 : ℝ) * euclMin L j) ∧
      ∀ (x : E) (j : Fin (finrank ℝ E)),
        |(b.ofZLatticeBasis ℝ L).repr x j| ≤ c * ‖x‖ / euclMin L j := sorry

/-- Lipschitz parametrisable boundary data `Lip(D, 1, M, Λ)` (Widmer; GlobalNumberFields 3A). -/
def LipBoundary (M : ℕ) (Λ : NNReal) (S : Set E) : Prop :=
  ∃ f : Fin M → (Fin (finrank ℝ E - 1) → ℝ) → E,
    (∀ j, LipschitzWith Λ (f j)) ∧ frontier S ⊆ ⋃ j, f j '' Set.Icc 0 1

/-- widmer-lipschitz-count. -/
theorem abs_card_inter_sub_volume_div_covolume_le_widmer (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (S : Set E) (hS : Bornology.IsBounded S)
    (M : ℕ) (Λ : NNReal) (hb : LipBoundary M Λ S) :
    MeasurableSet S ∧
    |(((L : Set E) ∩ S).ncard : ℝ) - (volume S).toReal / ZLattice.covolume L| ≤
      (finrank ℝ E : ℝ) ^ (3 * finrank ℝ E ^ 2 / 2 : ℝ) * M *
        ⨆ i : Fin (finrank ℝ E), (Λ : ℝ) ^ (i : ℕ) / euclMinProd L i := sorry

end Minima

/-! ## 4.8 Primitive lattices, angular bands and weighted sums -/

section Bands
variable {N : ℕ}

/-- The angular band `C_v^{(γ)} = {t : |⟨v,t⟩| ≤ ‖v‖‖t‖/(2γ)}`. -/
def angularBand (γ : ℝ) (v : EuclideanSpace ℝ (Fin N)) : Set (EuclideanSpace ℝ (Fin N)) :=
  {t | |inner ℝ v t| ≤ ‖v‖ * ‖t‖ / (2 * γ)}

/-- `R_v(T, γ)`: the ball of radius `T` intersected with the bands of `v_1, …, v_I`. -/
def bandRegion {I : ℕ} (T γ : ℝ) (v : Fin I → EuclideanSpace ℝ (Fin N)) :
    Set (EuclideanSpace ℝ (Fin N)) :=
  closedBall 0 T ∩ ⋂ i, angularBand γ (v i)

theorem mem_angularBand_smul (γ : ℝ) (v t : EuclideanSpace ℝ (Fin N)) (c : ℝ) (hc : c ≠ 0) :
    c • t ∈ angularBand γ v ↔ t ∈ angularBand γ v := sorry

theorem bandRegion_eq_smul {I : ℕ} (T γ : ℝ) (hT : 0 < T) (v : Fin I → EuclideanSpace ℝ (Fin N)) :
    bandRegion T γ v = T • bandRegion 1 γ v := sorry

theorem angularBand_antitone (v : EuclideanSpace ℝ (Fin N)) {γ γ' : ℝ} (h0 : 0 < γ)
    (h : γ ≤ γ') : angularBand γ' v ⊆ angularBand γ v := sorry

/-- Test `angularBand_half_eq_univ`. -/
example (v : EuclideanSpace ℝ (Fin N)) : angularBand (1 / 2) v = Set.univ := sorry

/-- Test `angularBand_not_convex`. -/
example : ¬ Convex ℝ (angularBand 1 (EuclideanSpace.single (0 : Fin 2) (1 : ℝ))) := sorry

/-- `S*_k(Λ; R)`: the sum of `‖a‖^{-k}` over primitive vectors of `ℤ^N` in `Λ ∩ R`. -/
def primitiveWeightedSum (Λ : Set (Fin N → ℤ)) (R : Set (Fin N → ℝ)) (k : ℕ) : ℝ :=
  ∑' a : {a : Fin N → ℤ // a ∈ Λ ∧ Finset.univ.gcd a = 1 ∧ (fun i ↦ (a i : ℝ)) ∈ R},
    (‖(WithLp.equiv 2 (Fin N → ℝ)).symm (fun i ↦ (a.1 i : ℝ))‖ ^ k)⁻¹

/-- `S_k(Λ; R)`: the same sum over all nonzero vectors. -/
def nonzeroWeightedSum (Λ : Set (Fin N → ℤ)) (R : Set (Fin N → ℝ)) (k : ℕ) : ℝ :=
  ∑' a : {a : Fin N → ℤ // a ∈ Λ ∧ a ≠ 0 ∧ (fun i ↦ (a i : ℝ)) ∈ R},
    (‖(WithLp.equiv 2 (Fin N → ℝ)).symm (fun i ↦ (a.1 i : ℝ))‖ ^ k)⁻¹

theorem primitiveWeightedSum_le_nonzero (Λ : Set (Fin N → ℤ)) (R : Set (Fin N → ℝ))
    (hR : Bornology.IsBounded R) (k : ℕ) :
    primitiveWeightedSum Λ R k ≤ nonzeroWeightedSum Λ R k := sorry

/-- Test `primitiveWeightedSum_two_lattice`. -/
example (R : Set (Fin 2 → ℝ)) (k : ℕ) :
    primitiveWeightedSum {a | ∀ i, (2 : ℤ) ∣ a i} R k = 0 := sorry

end Bands

/-! ## 4.11 Explicit counts in applications -/

section Markoff

/-- `R⁺(K)`: points of the positive Markoff fundamental set below `K`. -/
def markoffPlusCount (K : ℝ) : ℕ :=
  {x : Fin 3 → ℤ | 3 ≤ x 0 ∧ x 0 ≤ x 1 ∧ x 1 ≤ x 2 ∧
    ((x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 + x 0 * x 1 * x 2 : ℤ) : ℝ) ≤ K}.ncard

/-- markoff-fundamental-set-count (positive sign), with the corrected constant `1/48`. -/
theorem markoffFundamentalCount_eq :
    (fun K : ℝ ↦ (markoffPlusCount K : ℝ) - K * Real.log K ^ 2 / 48) =O[atTop]
      (fun K ↦ K * Real.log K) := sorry

/-- hyperplane-orthant-count for `d = 2`, `a = (1, 1)`, `L = ℤ²` (its first check). -/
example (n : ℕ) : {x : Fin 2 → ℕ | x 0 + x 1 = n}.ncard = n + 1 := sorry

end Markoff

/-! ## 4.12 Transference, covering and Construction A -/

section Transference
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The inner dual lattice. -/
abbrev innerDual (L : Submodule ℤ E) : Submodule ℤ E :=
  LinearMap.BilinForm.dualSubmodule (innerₗ E) L

/-- transference-minkowski-constant. -/
theorem successiveMinimum_mul_dual_le (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (i j : Fin (finrank ℝ E)) (hij : i.val + j.val + 1 = finrank ℝ E) :
    1 ≤ euclMin L i * euclMin (innerDual L) j ∧
      euclMin L i * euclMin (innerDual L) j ≤
        4 ^ finrank ℝ E / (volume (closedBall (0 : EuclideanSpace ℝ (Fin (finrank ℝ E))) 1)).toReal ^ 2
  := sorry

/-- max-norm-covering. -/
theorem exists_mem_sup_norm_sub_le_of_dual {n : ℕ} (hn : 1 ≤ n)
    (L : Submodule ℤ (EuclideanSpace ℝ (Fin n))) [DiscreteTopology L] [IsZLattice ℝ L]
    (R : ℝ) (hR : 0 < R)
    (h : ∀ y ∈ innerDual L, y ≠ 0 → R ≤ ⨆ i, |y i|) (b : EuclideanSpace ℝ (Fin n)) :
    ∃ x ∈ L, ‖x - b‖ ≤ n / R := sorry

/-- construction-a-minimum, in the binary case: the minimal norm is `min(4, d(C))`. -/
theorem construction_a_minNorm_eq {n : ℕ} (C : Submodule (ZMod 2) (Fin n → ZMod 2))
    (d : ℕ) (hd : d = sInf {w | ∃ c ∈ C, c ≠ 0 ∧ (Finset.univ.filter (fun i ↦ c i ≠ 0)).card = w})
    (hC : C ≠ ⊥) :
    sInf {s : ℕ | ∃ x : Fin n → ℤ, x ≠ 0 ∧ (fun i ↦ (x i : ZMod 2)) ∈ C ∧ ∑ i, (x i) ^ 2 = s}
      = min 4 d := sorry

end Transference

/-! ## 4.13 The space of lattices, its measure and its flows -/

section LatticeSpace
open Matrix

/-- The integral special linear group inside the real one. -/
abbrev slZ (n : ℕ) : Subgroup (SpecialLinearGroup (Fin n) ℝ) :=
  (SpecialLinearGroup.map (Int.castRingHom ℝ)).range

/-- `X_n = SL(n, ℝ) ⧸ SL(n, ℤ)`, left cosets. -/
abbrev UnimodularLattices (n : ℕ) := SpecialLinearGroup (Fin n) ℝ ⧸ slZ n

/-- The lattice `gℤⁿ` spanned by the columns of `g`. -/
def latticeOf {n : ℕ} (g : SpecialLinearGroup (Fin n) ℝ) : Submodule ℤ (Fin n → ℝ) :=
  Submodule.span ℤ (Set.range fun j ↦ fun i ↦ (g : Matrix (Fin n) (Fin n) ℝ) i j)

theorem latticeOf_mul_slZ {n : ℕ} (g : SpecialLinearGroup (Fin n) ℝ) (γ : slZ n) :
    latticeOf (g * (γ : SpecialLinearGroup (Fin n) ℝ)) = latticeOf g := sorry

instance (n : ℕ) : MeasurableSpace (UnimodularLattices n) := borel _
instance (n : ℕ) : BorelSpace (UnimodularLattices n) := ⟨rfl⟩

/-- `toLattice : X_n → lattices`, well defined by `latticeOf_mul_slZ`. -/
def UnimodularLattices.toLattice {n : ℕ} (x : UnimodularLattices n) : Submodule ℤ (Fin n → ℝ) :=
  Quotient.liftOn' x latticeOf (fun a b h ↦ sorry)

theorem UnimodularLattices.toLattice_injective (n : ℕ) :
    Function.Injective (UnimodularLattices.toLattice (n := n)) := sorry

theorem UnimodularLattices.toLattice_smul {n : ℕ} (h : SpecialLinearGroup (Fin n) ℝ)
    (x : UnimodularLattices n) :
    UnimodularLattices.toLattice (h • x) =
      (UnimodularLattices.toLattice x).map
        ((Matrix.toLin' (h : Matrix (Fin n) (Fin n) ℝ)).restrictScalars ℤ) := sorry

/-- Test `toLattice_base`. -/
example (n : ℕ) : UnimodularLattices.toLattice (QuotientGroup.mk 1 : UnimodularLattices n) =
    Submodule.span ℤ (Set.range fun j : Fin n ↦ (Pi.single j 1 : Fin n → ℝ)) := sorry

/-- Test `unimodularLattices_one_subsingleton`. -/
example : Subsingleton (UnimodularLattices 1) := sorry

/-- The transpose identification of the right quotient with `X_n`. -/
def transposeHomeomorph (n : ℕ) :
    Quotient (QuotientGroup.rightRel (slZ n)) ≃ₜ UnimodularLattices n := sorry

/-- lattice-space-invariant-probability: existence and uniqueness. -/
theorem existsUnique_invariant_probability (n : ℕ) (hn : 2 ≤ n) :
    ∃! μ : Measure (UnimodularLattices n), IsProbabilityMeasure μ ∧
      SMulInvariantMeasure (SpecialLinearGroup (Fin n) ℝ) (UnimodularLattices n) μ := sorry

/-- The diagonal flow `a_t = diag(e^t, e^{-t})` on `X_2`. -/
def diagFlowTwo (t : ℝ) : SpecialLinearGroup (Fin 2) ℝ :=
  ⟨!![Real.exp t, 0; 0, Real.exp (-t)], by
    simp [Matrix.det_fin_two, ← Real.exp_add]⟩

/-- The unipotent flow `u_t`. -/
def unipotentFlowTwo (t : ℝ) : SpecialLinearGroup (Fin 2) ℝ :=
  ⟨!![1, t; 0, 1], by simp [Matrix.det_fin_two]⟩

theorem diagFlowTwo_add (s t : ℝ) : diagFlowTwo (s + t) = diagFlowTwo s * diagFlowTwo t := sorry

theorem conj_diagFlowTwo_unipotentFlowTwo (s t : ℝ) :
    diagFlowTwo s * unipotentFlowTwo t * diagFlowTwo (-s) = unipotentFlowTwo (Real.exp (2 * s) * t) :=
  sorry

/-- Test `diagFlow_zero`. -/
example : diagFlowTwo 0 = 1 := sorry

/-- time-one-mixing-sl2: the time-one diagonal map on `X_2` is mixing, for the invariant
probability `μ`. -/
theorem tendsto_measure_inter_timeOne (μ : Measure (UnimodularLattices 2)) [IsProbabilityMeasure μ]
    [SMulInvariantMeasure (SpecialLinearGroup (Fin 2) ℝ) (UnimodularLattices 2) μ]
    (A B : Set (UnimodularLattices 2)) (hA : MeasurableSet A) (hB : MeasurableSet B) :
    Tendsto (fun k : ℕ ↦ μ ((fun x ↦ diagFlowTwo k • x) ⁻¹' A ∩ B)) atTop (𝓝 (μ A * μ B)) :=
  sorry

/-- The time-one map is ergodic. -/
theorem ergodic_timeOne_sl2 (μ : Measure (UnimodularLattices 2)) [IsProbabilityMeasure μ]
    [SMulInvariantMeasure (SpecialLinearGroup (Fin 2) ℝ) (UnimodularLattices 2) μ] :
    Ergodic (fun x : UnimodularLattices 2 ↦ diagFlowTwo 1 • x) μ := sorry

end LatticeSpace

/-! ## 4.14 Quantitative nondivergence -/

section Nondivergence

/-- `(C, α)`-good functions on `V ⊆ ℝ^d` (Kleinbock–Margulis); balls on which `f` vanishes
identically impose nothing (the source's convention `1/0 = ∞`). -/
def IsGood {d : ℕ} (C α : ℝ) (V : Set (EuclideanSpace ℝ (Fin d)))
    (f : EuclideanSpace ℝ (Fin d) → ℝ) : Prop :=
  ContinuousOn f V ∧ ∀ x r, ball x r ⊆ V → 0 < (⨆ y ∈ ball x r, |f y|) → ∀ ε > 0,
    (volume {y ∈ ball x r | |f y| < ε}).toReal ≤
      C * (ε / ⨆ y ∈ ball x r, |f y|) ^ α * (volume (ball x r)).toReal

theorem IsGood.abs {d : ℕ} {C α : ℝ} {V : Set (EuclideanSpace ℝ (Fin d))}
    {f : EuclideanSpace ℝ (Fin d) → ℝ} (hf : IsGood C α V f) : IsGood C α V (fun x ↦ |f x|) :=
  sorry

theorem IsGood.const_mul {d : ℕ} {C α : ℝ} {V : Set (EuclideanSpace ℝ (Fin d))}
    {f : EuclideanSpace ℝ (Fin d) → ℝ} (hf : IsGood C α V f) (c : ℝ) :
    IsGood C α V (fun x ↦ c * f x) := sorry

/-- unipotent-quantitative-recurrence (Kleinbock–Margulis, Theorem 5.3), for a continuous
one-parameter group `u` of unipotent matrices. -/
theorem volume_unipotent_minimum_lt_le {k : ℕ} (hk : 1 ≤ k)
    (L : Submodule ℤ (EuclideanSpace ℝ (Fin k))) [DiscreteTopology L] [IsZLattice ℝ L] :
    ∃ ρ > 0, ∀ u : ℝ → Matrix (Fin k) (Fin k) ℝ, Continuous u → (∀ s t, u (s + t) = u s * u t) →
      (∀ t, IsNilpotent (u t - 1)) → ∀ T > 0, ∀ ε, 0 < ε → ε ≤ ρ →
      (volume {x ∈ Set.Ioo (0 : ℝ) T | minNorm (L.map
        ((Matrix.toEuclideanLin (u x)).restrictScalars ℤ)) < ε}).toReal
        ≤ 2 * k * 3 ^ k * ((k : ℝ) ^ 2 + 1) ^ (1 / (k : ℝ) ^ 2) * (ε / ρ) ^ (1 / (k : ℝ) ^ 2) * T :=
  sorry

end Nondivergence

/-! ## 4.15 Borel density and the Oppenheim auxiliaries -/

section Oppenheim

/-- The Zariski closure of a set of real `n × n` matrices. -/
def zariskiClosure {n : ℕ} (S : Set (Matrix (Fin n) (Fin n) ℝ)) : Set (Matrix (Fin n) (Fin n) ℝ) :=
  {g | ∀ p : MvPolynomial (Fin n × Fin n) ℝ, (∀ s ∈ S, MvPolynomial.eval (fun ij ↦ s ij.1 ij.2) p = 0) →
    MvPolynomial.eval (fun ij ↦ g ij.1 ij.2) p = 0}

theorem subset_zariskiClosure {n : ℕ} (S : Set (Matrix (Fin n) (Fin n) ℝ)) :
    S ⊆ zariskiClosure S := sorry

/-- Test: `SL(2, ℤ)` is Zariski dense in `SL(2, ℝ)`. -/
example : {g : Matrix (Fin 2) (Fin 2) ℝ | g.det = 1} ⊆
    zariskiClosure (Set.range fun γ : Matrix.SpecialLinearGroup (Fin 2) ℤ ↦
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ))) := sorry

end Oppenheim

/-! ## 4.16 Siegel's mean value theorem -/

section Siegel

/-- The Siegel transform `S f(x) = ∑_{v ∈ x ∖ 0} f v`. -/
def siegelTransform {n : ℕ} (f : (Fin n → ℝ) → ENNReal) (x : UnimodularLattices n) : ENNReal :=
  ∑' v : {v : Fin n → ℝ // v ∈ x.toLattice ∧ v ≠ 0}, f v

/-- The primitive Siegel transform. -/
def primitiveSiegelTransform {n : ℕ} (f : (Fin n → ℝ) → ENNReal) (x : UnimodularLattices n) :
    ENNReal :=
  ∑' v : {v : Fin n → ℝ // v ∈ x.toLattice ∧ v ≠ 0 ∧
      ∀ m : ℕ, 2 ≤ m → ∀ w ∈ x.toLattice, v ≠ (m : ℝ) • w}, f v

theorem siegelTransform_mono {n : ℕ} {f g : (Fin n → ℝ) → ENNReal} (h : f ≤ g) :
    siegelTransform f ≤ siegelTransform g := sorry

theorem siegelTransform_eq_tsum_primitive {n : ℕ} (f : (Fin n → ℝ) → ENNReal) :
    siegelTransform f = fun x ↦ ∑' m : ℕ+, primitiveSiegelTransform (fun v ↦ f ((m : ℝ) • v)) x :=
  sorry

/-- Test `siegelTransform_zero`. -/
example {n : ℕ} : siegelTransform (n := n) 0 = 0 := sorry

/-- primitive-siegel-mean-value. -/
theorem lintegral_primitiveSiegelTransform_eq {n : ℕ} (hn : 2 ≤ n) (μ : Measure (UnimodularLattices n))
    [IsProbabilityMeasure μ]
    [SMulInvariantMeasure (Matrix.SpecialLinearGroup (Fin n) ℝ) (UnimodularLattices n) μ]
    (f : (Fin n → ℝ) → ENNReal) (hf : Measurable f) :
    ∫⁻ x, primitiveSiegelTransform f x ∂μ =
      ENNReal.ofReal (1 / (riemannZeta n).re) * ∫⁻ v, f v ∧
    ∫⁻ x, siegelTransform f x ∂μ = ∫⁻ v, f v := sorry

end Siegel

/-! ## 4.17 Arithmetic packets for equidistribution -/

section Packets
open UpperHalfPlane Complex

/-- The CM point `(-b + i√|D|)/(2a)` of a positive definite form `[a, b, c]`. -/
def cmPoint (a b c : ℤ) (ha : 0 < a) (hD : b ^ 2 - 4 * a * c < 0) : ℍ :=
  ⟨(-b + Complex.I * Real.sqrt (-(b ^ 2 - 4 * a * c : ℤ))) / (2 * a), sorry⟩

/-- Test `cmPoint_minus_four`. -/
example : (cmPoint 1 0 1 one_pos (by norm_num) : ℂ) = Complex.I := sorry

/-- The geodesic of an indefinite form `[a, b, c]`: `a|z|² + b Re z + c = 0`. -/
def geodesicOfForm (a b c : ℤ) : Set ℍ :=
  {z | (a : ℝ) * Complex.normSq (z : ℂ) + b * z.re + c = 0}

/-- Test `geodesicOfForm_sqrt2`. -/
example : geodesicOfForm 1 0 (-2) = {z : ℍ | ‖(z : ℂ)‖ = Real.sqrt 2} := sorry

/-- closed-geodesic-length: the automorph built from the minimal solution of `t² - Du² = 4`
translates its geodesic by `2 log ε`. -/
theorem length_closedGeodesic_eq (a b c t u : ℤ) (ht : t ^ 2 - (b ^ 2 - 4 * a * c) * u ^ 2 = 4)
    (hu : 0 < u) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) ℤ) = !![(t - b * u) / 2, -c * u; a * u, (t + b * u) / 2])
    (z : ℍ) (hz : z ∈ geodesicOfForm a b c) :
    dist z (γ • z) = 2 * Real.log ((t + u * Real.sqrt (b ^ 2 - 4 * a * c : ℤ)) / 2) := sorry

/-- The lattice points on the sphere of radius `√n` in `ℤ³`. -/
def latticeSphere (n : ℕ) : Finset (Fin 3 → ℤ) :=
  (Fintype.piFinset fun _ ↦ Finset.Icc (-(n : ℤ)) n).filter fun m ↦ ∑ i, m i ^ 2 = n

/-- The Weyl sum of `u` over `R_n/√n`. -/
def harmonicWeylSum (u : (Fin 3 → ℝ) → ℝ) (n : ℕ) : ℝ :=
  ((latticeSphere n).card : ℝ)⁻¹ * ∑ m ∈ latticeSphere n, u (fun i ↦ (m i : ℝ) / Real.sqrt n)

/-- Test `latticeSphere_card_three`. -/
example : (latticeSphere 3).card = 8 := sorry

/-- Test `latticeSphere_seven_empty`. -/
example : latticeSphere 7 = ∅ := sorry

/-- Test `nonharmonic_not_mean_zero`: the average of `x²` is `1/3`. -/
example (n : ℕ) (hn : (latticeSphere n).Nonempty) :
    harmonicWeylSum (fun x ↦ x 0 ^ 2) n = 1 / 3 := sorry

end Packets

/-! ## Further API items and tests -/

section Extra
open Matrix

variable {n : ℕ}

theorem coordProjVolume_univ (Z : Set (Fin n → ℝ)) :
    coordProjVolume Z Finset.univ = volume Z := sorry

/-- Test `coordProjVolume_empty`. -/
example (J : Finset (Fin n)) (hJ : J.Nonempty) : coordProjVolume (∅ : Set (Fin n → ℝ)) J = 0 :=
  sorry

/-- Test `coordProjVolume_box`. -/
example (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    coordProjVolumeSum (Set.Icc (0 : Fin 2 → ℝ) ![a, b]) 1 = ENNReal.ofReal (a + b) ∧
    coordProjVolumeSum (Set.Icc (0 : Fin 2 → ℝ) ![a, b]) 2 = ENNReal.ofReal (a * b) := sorry

theorem HasComplexity.union {k ℓ k' ℓ' : ℕ} {S T : Set (Fin n → ℝ)} (hS : HasComplexity k ℓ S)
    (hT : HasComplexity k' ℓ' T) : HasComplexity (k + k') (max ℓ ℓ') (S ∪ T) := sorry

theorem HasComplexity.mono {k ℓ k' ℓ' : ℕ} {S : Set (Fin n → ℝ)} (hk : k ≤ k') (hl : ℓ ≤ ℓ')
    (hS : HasComplexity k ℓ S) : HasComplexity k' ℓ' S := sorry

theorem HasComplexity.preimage_affine {d k ℓ : ℕ} {S : Set (Fin n → ℝ)}
    (hS : HasComplexity k ℓ S) (a : (Fin d → ℝ) →ᵃ[ℝ] (Fin n → ℝ)) :
    HasComplexity k ℓ (a ⁻¹' S) := sorry

/-- Test `hasComplexity_Icc`. -/
example (a b : ℝ) (h : a ≤ b) :
    HasComplexity 1 2 ((fun x : Fin 1 → ℝ ↦ x 0) ⁻¹' Set.Icc a b) := sorry

/-- Test `hasComplexity_empty_univ`. -/
example : HasComplexity 0 0 (∅ : Set (Fin n → ℝ)) ∧ HasComplexity 0 0 (Set.univ : Set (Fin n → ℝ)) :=
  sorry

/-- Bounded semialgebraic multisets of maximal multiplicity `m` and complexity `(k, ℓ)`. -/
structure SemialgebraicMultiset (n m k ℓ : ℕ) where
  /-- The multiplicity function. -/
  mult : (Fin n → ℝ) → ℕ
  le_max : ∀ x, mult x ≤ m
  bounded : Bornology.IsBounded (Function.support mult)
  complexity : ∀ i, 1 ≤ i → i ≤ m → HasComplexity k ℓ {x | i ≤ mult x}

/-- The lattice count with multiplicity. -/
def SemialgebraicMultiset.latticeCount {n m k ℓ : ℕ} (R : SemialgebraicMultiset n m k ℓ) : ℕ :=
  ∑' z : Fin n → ℤ, R.mult (fun i ↦ (z i : ℝ))

/-- The volume `∫ mult`. -/
def SemialgebraicMultiset.volume {n m k ℓ : ℕ} (R : SemialgebraicMultiset n m k ℓ) : ENNReal :=
  ∫⁻ x, (R.mult x : ENNReal)

theorem angularBand_zero {N : ℕ} (γ : ℝ) : angularBand γ (0 : EuclideanSpace ℝ (Fin N)) = Set.univ :=
  sorry

/-- Test `angularBand_e1_one`. -/
example : (WithLp.equiv 2 (Fin 2 → ℝ)).symm ![1, 1] ∉ angularBand 1 (EuclideanSpace.single 0 1) ∧
    (WithLp.equiv 2 (Fin 2 → ℝ)).symm ![1, 2] ∈ angularBand 1 (EuclideanSpace.single 0 1) := sorry

/-- The base point `SL(n, ℤ) ∈ X_n`. -/
def UnimodularLattices.base (n : ℕ) : UnimodularLattices n := QuotientGroup.mk 1

/-- Test `twoZ_not_unimodular`. -/
example (x : UnimodularLattices 2) :
    x.toLattice ≠ Submodule.span ℤ (Set.range fun j : Fin 2 ↦ (Pi.single j 2 : Fin 2 → ℝ)) := sorry

/-- Test `toLattice_diag`. -/
example (t : ℝ) : (diagFlowTwo t • UnimodularLattices.base 2).toLattice =
    Submodule.span ℤ {(Pi.single 0 (Real.exp t) : Fin 2 → ℝ), Pi.single 1 (Real.exp (-t))} := sorry

theorem IsGood.mono {d : ℕ} {C C' α : ℝ} {V : Set (EuclideanSpace ℝ (Fin d))}
    {f : EuclideanSpace ℝ (Fin d) → ℝ} (h : C ≤ C') (hf : IsGood C α V f) : IsGood C' α V f :=
  sorry

/-- Test `isGood_id`. -/
example : IsGood 4 1 Set.univ (fun x : EuclideanSpace ℝ (Fin 1) ↦ x 0) := sorry

/-- Test `isGood_zero`. -/
example {d : ℕ} (C α : ℝ) (hC : 0 ≤ C) : IsGood C α Set.univ (fun _ : EuclideanSpace ℝ (Fin d) ↦ (0 : ℝ)) :=
  sorry

theorem siegelTransform_smul (f : (Fin n → ℝ) → ENNReal) (h : SpecialLinearGroup (Fin n) ℝ)
    (x : UnimodularLattices n) :
    siegelTransform f (h • x) =
      siegelTransform (fun v ↦ f (Matrix.toLin' (h : Matrix (Fin n) (Fin n) ℝ) v)) x := sorry

theorem measurable_siegelTransform {f : (Fin n → ℝ) → ENNReal} (hf : Measurable f) :
    Measurable (siegelTransform f) := sorry

/-- Test `siegelTransform_excludes_origin`. -/
example : siegelTransform (n := n) (Set.indicator {0} 1) = 0 := sorry

/-- Test `cmPoint_minus_three`. -/
example : (cmPoint 1 1 1 one_pos (by norm_num) : ℂ) = (-1 + Complex.I * Real.sqrt 3) / 2 := sorry

theorem harmonicWeylSum_one (m : ℕ) (hm : (latticeSphere m).Nonempty) :
    harmonicWeylSum (fun _ ↦ 1) m = 1 := sorry

end Extra
end TauCeti.GeometryOfNumbersPlan

/-!
## Statements not typed at the pins

The packet names below are specified in the roadmap document but not typed here, because their
carriers are not at the pins (the Haar probability on `X_n` as data, the semialgebraic family and
the cylindrical decomposition, Lipschitz parametrisable sets of GlobalNumberFields Layer 3, curvature
of planar curves, primitive saturated sublattices, symmetric row lattices, Lie subalgebras between
`𝔰𝔬(2,1)` and `𝔰𝔩₃`, Maass-form free statements about weak convergence on the sphere) or because
their statement needs auxiliary data the file does not build. A formalisation should use these names.

§4.6 Davenport's principle and semialgebraic regions: coordProjVolume_unipotent_final,
coordProjVolume_le_of_proj, proj_volume_shear (test), HasComplexity.isSemialgebraic,
exists_hasComplexity, multiset_count_double (test).

§4.7 Counting by successive minima: card_quadraticForm_le_le_partialProduct,
card_ne_zero_inter_closedBall_le, abs_card_fiber_inter_sub_le_semialgebraic,
card_hyperplane_orthant_eq.

§4.8 Primitive lattices, angular bands and weighted sums: bandVolume, hasComplexity_bandRegion,
bandRegion_volume_plane (test), card_inter_bandRegion_eq, primitiveWithMinima,
primitiveWithMinima, primitiveWithMinima_finite, mem_primitiveWithMinima_iff,
primitiveWithMinima_one, primitiveWithMinima_eq_empty, primitiveWithMinima_line_count (test),
primitiveWithMinima_full_rank (test), primitiveWithMinima_nonprimitive_excluded (test),
primitiveWithMinima_small_s (test), card_primitive_extensions_le, card_primitiveWithMinima_le,
oneBandVolume, oneBandVolume, twoBandVolume, bandDelta, bandDelta_pos_iff,
oneBandVolume_of_norm_le_one, twoBandVolume_of_norm_le_one, oneBandVolume_orthogonal,
twoBandVolume_le, bandDelta_orthonormal (test), oneBandVolume_small (test), bandDelta_dependent
(test), twoBandVolume_not_product (test), oneBandVolume_asymptotic, primitiveWeightedSum_le,
primitiveWeightedSum_mono, nonzeroWeightedSum_zero_eq_card, primitiveWeightedSum_of_not_primitive,
primitiveWeightedSum_unit_disc (test), nonzeroWeightedSum_disc_two (test),
primitive_in_Z_not_in_lattice (test), primitiveWeightedSum_closedBall_eq.

§4.9 Singular symmetric matrices in skewed balls: symRowLattice, symRowLattice, symRowFullRank,
symStar, skewConstant, symStar_comm, norm_symStar_le, mem_symRowFullRank_saturation,
smul_symRowLattice, skewConstant_le, symRowLattice_line (test), norm_symStar_e1_e2 (test),
skewConstant_trivial (test), symRowFullRank_ne_span (test), symStar_basis_symRowLattice,
minima_mul_le_of_nonempty, card_smul_inter_symRowFullRank_le, card_skewRowLattices_le,
card_skew_singular_symmetric_le.

§4.10 Planar domains with curvature: CurvatureLatticeClass, IsC2ConvexDomain,
CurvatureLatticeClass, IsAdmissibleExponent, CurvatureLatticeClass.mono,
IsAdmissibleExponent.mono, radiusOfCurvatureMax_ellipse, curvatureClass_disc_translate (test),
curvatureClass_small_area (test), square_not_C2 (test), isAdmissible_mono_test (test),
abs_card_smul_inter_sub_le_vanDerCorput, abs_card_smul_inter_sub_le_huxley,
isAdmissibleExponent_of_two_thirds_lt.

§4.11 Explicit counts in applications: markoffFibreCount_eq, card_two_representations_le.

§4.13 The space of lattices, its measure and its flows: UnimodularLattices.range_toLattice,
UnimodularLattices.instTopologicalSpace, UnimodularLattices.transposeHomeomorph,
toLattice_covolume_one (test), latticeSpaceMeasure, latticeSpaceMeasure,
latticeSpaceMeasure.isProbabilityMeasure, latticeSpaceMeasure.smulInvariant,
latticeSpaceMeasure_eq_of_invariant, latticeSpaceMeasure_quotient, integral_latticeSpace_eq,
latticeSpaceMeasure_univ (test), latticeSpaceMeasure_one (test), latticeSpaceMeasure_base_null
(test), counting_measure_not_invariant (test), isCompact_setOf_supNorm_le,
exists_basis_norm_le_of_minimum, diagFlow, diagFlow, unipotentFlow, diagFlow_add,
unipotentFlow_add, continuous_diagFlow_smul, conj_diagFlow_unipotentFlow,
measurePreserving_diagFlow, timeOne, diagFlow_two_base (test), conj_relation_test (test),
unipotentFlow_not_diag (test), ae_invariant_of_ae_invariant_conj, tendsto_integral_comp_flow_mul.

§4.14 Quantitative nondivergence: IsGood.iSup, isGood_polynomial, isGood_square (test),
not_isGood_flat (test), volume_setOf_minimum_lt_le.

§4.15 Borel density and the Oppenheim auxiliaries: unipotent_mem_zariskiClosure_of_lattice,
eq_or_eq_top_of_so21_le, exists_rational_of_isClosed_orbit, exists_rational_ternary_restriction.

§4.16 Siegel's mean value theorem: siegelTransform_indicator_ball, siegelTransform_base_ball
(test), primitiveSiegelTransform_base_ball2 (test), lintegral_primitiveSiegelTransform_eq_mul,
eq_smul_volume_of_slInvariant.

§4.17 Arithmetic packets for equidistribution: cmPointPacket, cmPoint_smul, cmPointPacket,
card_cmPointPacket, cmWeight, cmMeasure, cmMeasure_isProbability, card_cmPointPacket_minus_twenty
(test), cmPointPacket_not_imprimitive (test), orientedClosedGeodesic, closedGeodesicIntegral,
closedGeodesicIntegral_indep, closedGeodesicIntegral_smul, closedGeodesicIntegral_nsmul,
closedGeodesicIntegral_one, mem_geodesicOfForm_roots, closedGeodesicIntegral_one_D8 (test),
closedGeodesicIntegral_zero (test), geodesic_square_disc_excluded (test), closedGeodesic_neg,
harmonicWeylSum_odd, thetaHarmonic, thetaHarmonic_coeff, harmonicWeylSum_xy_three (test),
tendsto_of_harmonicWeylSum_tendsto_zero.

-/
