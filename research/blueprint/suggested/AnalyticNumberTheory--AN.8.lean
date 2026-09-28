/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.HeckeRing.Defs
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.Algebra.Group.End
import TauCeti.NumberTheory.HeckeRing.Basic
import TauCeti.NumberTheory.HeckeRing.Multiplication
import TauCeti.NumberTheory.HeckeRing.Associativity

/-!
# Analytic number theory AN.8–AN.9 — suggested declarations (first checkpoint)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

This checkpoint covers the Bost–Connes branch of AN.9. The Bost–Connes algebra is Tau Ceti's
Hecke ring `𝕋 P⁺_ℚ P⁺_ℤ K` of the ax+b pair inside `GL₂(ℚ)`. Its rational generators are the
double cosets `x n = [X_n]`, `x' n = [X_n⁻¹]` and `e γ`; Bost–Connes' `μ_n` is `n^{-1/2} • x n`
over `ℂ`. `ℚ/ℤ` is `AddCircle (1 : ℚ)`, and `Ẑ^×` is `AddAut (ℚ/ℤ)`.
-/

noncomputable section

open Matrix Complex HeckeCosetModule
open scoped HeckeCosetModule ComplexOrder

namespace TauCeti.BostConnes

/-- `ℚ/ℤ`. -/
abbrev QmodZ := AddCircle (1 : ℚ)

/-- `ζ_γ = exp(2πiγ)`, well defined on `ℚ/ℤ`. -/
def rootOfUnityOf (γ : QmodZ) : ℂ := sorry

theorem rootOfUnityOf_add (γ δ : QmodZ) :
    rootOfUnityOf (γ + δ) = rootOfUnityOf γ * rootOfUnityOf δ := by sorry

/-! ## The ax+b pair -/

/-- `P⁺_ℚ`: the matrices `[1 b; 0 a]` with `a > 0`. -/
def axbRat : Subgroup (GL (Fin 2) ℚ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
    0 < (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `P⁺_ℤ`: the matrices `[1 n; 0 1]` with `n ∈ ℤ`. -/
def axbInt : Subgroup (GL (Fin 2) ℚ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1 = 1 ∧ ∃ n : ℤ, (g : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = n}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

theorem mem_axbRat_iff (g : GL (Fin 2) ℚ) : g ∈ axbRat ↔
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
      0 < (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1 := Iff.rfl

theorem axbInt_le_axbRat : axbInt ≤ axbRat := by sorry

/-- The `(2,2)` entry `a(g)`, a homomorphism with positive values. -/
def diagEntry : axbRat →* ℚˣ := sorry

theorem diagEntry_pos (g : axbRat) : 0 < ((diagEntry g : ℚˣ) : ℚ) := by sorry

/-- `[1 b; 0 1]`. -/
def translation : Multiplicative ℚ →* axbRat := sorry

/-- `[1 0; 0 a]` for `a > 0`. -/
def dilation (a : ℚ) (ha : 0 < a) : axbRat := sorry

theorem conj_translation (g : axbRat) (n : ℚ) :
    g * translation (.ofAdd n) * g⁻¹ =
      translation (.ofAdd (n / ((diagEntry g : ℚˣ) : ℚ))) := by sorry

theorem translation_half_mem_axbRat_not_mem_axbInt :
    ((translation (.ofAdd (1 / 2 : ℚ)) : axbRat) : GL (Fin 2) ℚ) ∉ axbInt := by sorry

theorem not_mem_axbRat_neg_diag :
    GeneralLinearGroup.mkOfDetNeZero !![(1 : ℚ), 0; 0, -1] (by simp [det_fin_two]) ∉ axbRat := by
  sorry

theorem axbInt_not_normal : ¬ (axbInt.subgroupOf axbRat).Normal := by sorry

theorem diagEntry_mul_example (g h : axbRat) (hg : ((diagEntry g : ℚˣ) : ℚ) = 2)
    (hh : ((diagEntry h : ℚˣ) : ℚ) = 3) : ((diagEntry (g * h) : ℚˣ) : ℚ) = 6 := by sorry

/-- AN.9/ax-plus-b-hecke-triple. -/
theorem isHeckeTriple_axb : IsHeckeTriple axbRat.toSubmonoid axbInt axbInt := by sorry

instance : IsHeckeTriple axbRat.toSubmonoid axbInt axbInt := isHeckeTriple_axb

/-- The `(2,2)` entry of a double coset. -/
def cosetEntry (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) : ℚ := sorry

/-- AN.9/double-cosets-and-degrees: `L(X) = den a(X)`. -/
theorem degree_heckeCoset_eq_den (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) :
    X.degree = (cosetEntry X).den := by sorry

/-! ## The Bost–Connes Hecke algebra -/

/-- AN.9/bost-connes-hecke-algebra. -/
abbrev BCHecke (K : Type*) [Field K] := 𝕋 axbRat.toSubmonoid axbInt K

namespace BCHecke

variable {K : Type*} [Field K] [CharZero K]

instance instAlgebra : Algebra K (BCHecke K) := sorry

/-- `x n = [X_n]`, the double coset of `dilation n`. -/
def x (n : ℕ+) : BCHecke K := sorry

/-- `x' n = [X_n⁻¹]`, the double coset of `dilation (1/n)`. -/
def x' (n : ℕ+) : BCHecke K := sorry

/-- `e γ`, the double coset of the translation by a lift of `γ ∈ ℚ/ℤ`. -/
def e (γ : QmodZ) : BCHecke K := sorry

@[simp] theorem e_zero : (e 0 : BCHecke K) = 1 := by sorry

theorem e_add (γ δ : QmodZ) : (e (γ + δ) : BCHecke K) = e γ * e δ := by sorry

/-- Tau Ceti's product is Bost–Connes' convolution `(f₁ ∗ f₂)(d) = Σ_{g₁Γ₀} f₁(g₁) f₂(g₁⁻¹d)`. -/
theorem mul_eq_convolution (f₁ f₂ : BCHecke K) (d : axbRat) :
    (f₁ * f₂) (HeckeCoset.mk axbInt axbInt ⟨d, d.2⟩) =
      ∑ᶠ q : axbRat ⧸ axbInt.subgroupOf axbRat,
        f₁ (HeckeCoset.mk axbInt axbInt ⟨(q.out : GL (Fin 2) ℚ), q.out.2⟩) *
          f₂ (HeckeCoset.mk axbInt axbInt ⟨((q.out⁻¹ * d : axbRat) : GL (Fin 2) ℚ),
            (q.out⁻¹ * d).2⟩) := by sorry

instance star : StarRing (BCHecke ℂ) := sorry

theorem star_x (n : ℕ+) : star (x n : BCHecke ℂ) = x' n := by sorry

theorem star_e (γ : QmodZ) : star (e γ : BCHecke ℂ) = e (-γ) := by sorry

/-- The map induced by a field map. -/
def map {L : Type*} [Field L] [CharZero L] (φ : K →+* L) : BCHecke K →ₐ[K] BCHecke L := sorry

theorem e_half_mul_self : (e (1 / 2 : ℚ) * e (1 / 2 : ℚ) : BCHecke ℚ) = 1 := by sorry

theorem x'_mul_x_two : (x' 2 * x 2 : BCHecke ℚ) = 2 := by sorry

theorem x_mul_x'_two : (x 2 * x' 2 : BCHecke ℚ) = 1 + e (1 / 2 : ℚ) := by sorry

theorem not_commute_e_half_x_two : (e (1 / 2 : ℚ) * x 2 : BCHecke ℚ) ≠ x 2 * e (1 / 2 : ℚ) := by
  sorry

theorem x_one : (x 1 : BCHecke K) = 1 ∧ (x' 1 : BCHecke K) = 1 := by sorry

/-- AN.9/rational-presentation: the relations (a′)–(f′) and the double-coset basis
`x n * e γ * x' m = [class of [1 γ/m; 0 n/m]]` for coprime `n, m`. -/
theorem presentation :
    (∀ n : ℕ+, (x' n * x n : BCHecke K) = algebraMap K _ ((n : ℕ) : K)) ∧
    (∀ n m : ℕ+, (x (n * m) : BCHecke K) = x n * x m ∧ (x' (n * m) : BCHecke K) = x' n * x' m) ∧
    (∀ n m : ℕ+, Nat.Coprime n m → (x n * x' m : BCHecke K) = x' m * x n) ∧
    (∀ (γ : QmodZ) (n : ℕ+), (e γ * x n : BCHecke K) = x n * e ((n : ℕ) • γ)) ∧
    (∀ (γ : QmodZ) (n : ℕ+), (x n * e γ * x' n : BCHecke K) =
      ∑ᶠ (δ : QmodZ) (_ : (n : ℕ) • δ = γ), e δ) := by
  sorry

/-- The double-coset basis: `x n * e γ * x' m` is the class of `[1 γ/m; 0 n/m]`. -/
theorem x_mul_e_mul_x' (n m : ℕ+) (hnm : Nat.Coprime n m) (γ : ℚ) :
    (x n * e γ * x' m : BCHecke K) =
      single K (HeckeCoset.mk axbInt axbInt
        ⟨((dilation ((n : ℚ) / m) (by positivity) * translation (.ofAdd (γ / m)) : axbRat) :
          GL (Fin 2) ℚ), (dilation ((n : ℚ) / m) (by positivity) *
            translation (.ofAdd (γ / m))).2⟩) 1 := by sorry

end BCHecke

/-! ## The time evolution -/

/-- AN.9/time-evolution: `σ_z f = (X ↦ a(X)^{iz} f(X))`. -/
def timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ := sorry

open BCHecke

@[simp] theorem timeEvolution_zero : timeEvolution 0 = AlgEquiv.refl := by sorry

theorem timeEvolution_add (z w : ℂ) :
    timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w) := by sorry

@[simp] theorem timeEvolution_x (z : ℂ) (n : ℕ+) :
    timeEvolution z (x n) = ((n : ℂ) ^ (I * z)) • x n := by sorry

@[simp] theorem timeEvolution_x' (z : ℂ) (n : ℕ+) :
    timeEvolution z (x' n) = ((n : ℂ) ^ (-(I * z))) • x' n := by sorry

@[simp] theorem timeEvolution_e (z : ℂ) (γ : QmodZ) : timeEvolution z (e γ) = e γ := by sorry

theorem timeEvolution_star (t : ℝ) (f : BCHecke ℂ) :
    timeEvolution t (star f) = star (timeEvolution t f) := by sorry

/-- Bost–Connes' form `σ_t(f)(X) = (L(X)/R(X))^{-it} f(X)`. -/
theorem timeEvolution_eq_LR (t : ℝ) (f : BCHecke ℂ)
    (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) :
    timeEvolution t f X = ((X.degree : ℂ) / (cosetEntry X).num.natAbs) ^ (-(I * t)) * f X := by
  sorry

/-- Unit test: weighting by the left degree `L(X)` alone is not multiplicative. -/
theorem not_multiplicative_left_degree_only (t : ℝ) (ht : (2 : ℂ) ^ (I * t) ≠ 1) :
    ¬ ∃ θ : BCHecke ℂ →ₐ[ℂ] BCHecke ℂ,
      ∀ (f : BCHecke ℂ) (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt),
        θ f X = (X.degree : ℂ) ^ (I * t) * f X := by sorry

theorem timeEvolution_x_two (t : ℝ) : timeEvolution t (x 2) = ((2 : ℂ) ^ (I * t)) • x 2 := by
  sorry

theorem timeEvolution_x_mul_x' (z : ℂ) : timeEvolution z (x 2 * x' 2) = x 2 * x' 2 := by sorry

theorem timeEvolution_neg_half_I (n : ℕ+) :
    timeEvolution (-I / 2) (((n : ℂ) ^ (-(1 / 2) : ℂ)) • x n) = x n := by sorry

/-- AN.9/rational-forms-comparison: `σ_{-i/2}` carries Bost–Connes' rational span of the
`μ_n e(γ) μ*_m` onto the `ℚ`-valued functions. -/
theorem sigma_neg_half_I_map_rationalForm (n m : ℕ+) (γ : QmodZ) :
    timeEvolution (-I / 2) (((n * m : ℕ) : ℂ) ^ (-(1 / 2) : ℂ) • (x n * e γ * x' m)) =
      ((m : ℂ)⁻¹) • (x n * e γ * x' m) := by sorry

/-! ## The representation on `ℓ²(ℕ≥1)` and the partition function -/

/-- `ℓ²(ℕ≥1)`. -/
abbrev L2 := lp (fun _ : ℕ+ ↦ ℂ) 2

/-- AN.9/regular-representation. -/
def regularRep (u : AddAut QmodZ) : BCHecke ℂ →ₐ[ℂ] (L2 →L[ℂ] L2) := sorry

theorem regularRep_x (u : AddAut QmodZ) (n k : ℕ+) :
    regularRep u (x n) (lp.single 2 k 1) = ((n : ℂ) ^ (1 / 2 : ℂ)) • lp.single 2 (n * k) 1 := by
  sorry

theorem regularRep_e (u : AddAut QmodZ) (γ : QmodZ) (k : ℕ+) :
    regularRep u (e γ) (lp.single 2 k 1) = rootOfUnityOf ((k : ℕ) • u γ) • lp.single 2 k 1 := by
  sorry

theorem regularRep_star (u : AddAut QmodZ) (f : BCHecke ℂ) :
    regularRep u (star f) = ContinuousLinearMap.adjoint (regularRep u f) := by sorry

/-- `e^{-βH}`, the diagonal operator `ε_k ↦ k^{-β} ε_k`. -/
def hamiltonianExp (β : ℝ) (hβ : 0 < β) : L2 →L[ℂ] L2 := sorry

/-- `π_u(σ_t f) = e^{itH} π_u(f) e^{-itH}`, in matrix coefficients. -/
theorem regularRep_timeEvolution (u : AddAut QmodZ) (t : ℝ) (f : BCHecke ℂ) (j k : ℕ+) :
    inner ℂ (lp.single 2 j (1 : ℂ)) (regularRep u (timeEvolution t f) (lp.single 2 k 1)) =
      ((j : ℂ) / k) ^ (I * t) *
        inner ℂ (lp.single 2 j (1 : ℂ)) (regularRep u f (lp.single 2 k 1)) := by sorry

theorem regularRep_x_mul_x'_two (u : AddAut QmodZ) (k : ℕ+) :
    regularRep u (x 2 * x' 2) (lp.single 2 k 1) =
      (if 2 ∣ (k : ℕ) then (2 : ℂ) else 0) • lp.single 2 k 1 := by sorry

theorem regularRep_one (u : AddAut QmodZ) : regularRep u 1 = 1 := map_one _

theorem regularRep_mu_isometry (u : AddAut QmodZ) (v : L2) :
    ‖((2 : ℂ) ^ (-(1 / 2) : ℂ)) • regularRep u (x 2) v‖ = ‖v‖ := by sorry

theorem regularRep_x'_one_zero (u : AddAut QmodZ) :
    regularRep u (x' 2) (lp.single 2 1 1) = 0 := by sorry

/-- AN.9/partition-function: `Σ_k ⟨ε_k, e^{-βH} ε_k⟩ = ζ(β)` for `β > 1`. -/
theorem tsum_hamiltonian_eq_riemannZeta (β : ℝ) (hβ : 1 < β) :
    ∑' k : ℕ+, ((k : ℂ) ^ (-(β : ℂ))) = riemannZeta β := by sorry

/-! ## Gibbs states, KMS states, symmetries -/

/-- AN.9/gibbs-states. -/
def gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

theorem gibbsState_one (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : gibbsState β hβ u 1 = 1 := by
  sorry

theorem gibbsState_star_mul_self_nonneg (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (f : BCHecke ℂ) :
    0 ≤ gibbsState β hβ u (star f * f) := by sorry

theorem gibbsState_e (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (γ : QmodZ) :
    gibbsState β hβ u (e γ) =
      (∑' k : ℕ+, rootOfUnityOf ((k : ℕ) • u γ) / (k : ℂ) ^ (β : ℂ)) / riemannZeta β := by sorry

theorem gibbsState_basis_of_ne (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (n m : ℕ+) (γ : QmodZ)
    (h : n ≠ m) : gibbsState β hβ u (x n * e γ * x' m) = 0 := by sorry

theorem gibbsState_e_half (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (e (1 / 2 : ℚ)) = 2 ^ (1 - (β : ℂ)) - 1 := by sorry

theorem gibbsState_x_mul_x'_two (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x 2 * x' 2) = 2 ^ (1 - (β : ℂ)) := by sorry

theorem gibbsState_e_zero (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (e 0) = 1 := by sorry

theorem gibbsState_x_two (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x 2) = 0 := by sorry

/-- AN.9/kms-states: the algebraic KMS condition on the dense Hecke algebra. -/
def IsKMS (β : ℝ) (φ : BCHecke ℂ →ₗ[ℂ] ℂ) : Prop :=
  φ 1 = 1 ∧ (∀ f, 0 ≤ φ (star f * f)) ∧ ∀ f g, φ (f * timeEvolution (I * β) g) = φ (g * f)

theorem IsKMS.timeEvolution_invariant {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) (t : ℝ)
    (f : BCHecke ℂ) : φ (timeEvolution t f) = φ f := by sorry

theorem IsKMS.convex {β : ℝ} : Convex ℝ {φ : BCHecke ℂ →ₗ[ℂ] ℂ | IsKMS β φ} := by sorry

/-- AN.9/gibbs-states-are-kms. -/
theorem isKMS_gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    IsKMS β (gibbsState β hβ u) := by sorry

/-- The vector state at the base point, `f ↦ f(identity coset)`. -/
def baseState : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

theorem isKMS_one_iff (β : ℝ) (hβ : 0 < β) : IsKMS β baseState ↔ β = 1 := by sorry

theorem isKMS_sign (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x' 2 * timeEvolution (-(I * β)) (x 2)) ≠
      gibbsState β hβ u (x 2 * x' 2) := by sorry

theorem isKMS_x_mul_x'_two {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) :
    φ (x 2 * x' 2) = 2 ^ (1 - (β : ℂ)) := by sorry

/-- AN.9/symmetry-action. -/
def symmetry {K : Type*} [Field K] [CharZero K] (v : AddAut QmodZ) : BCHecke K ≃ₐ[K] BCHecke K :=
  sorry

section Symmetry
variable {K : Type*} [Field K] [CharZero K]

@[simp] theorem symmetry_e (v : AddAut QmodZ) (γ : QmodZ) :
    symmetry v (e γ : BCHecke K) = e (v γ) := by sorry

@[simp] theorem symmetry_x (v : AddAut QmodZ) (n : ℕ+) :
    symmetry v (x n : BCHecke K) = x n ∧ symmetry v (x' n : BCHecke K) = x' n := by sorry

theorem symmetry_mul (v w : AddAut QmodZ) :
    (symmetry (v * w) : BCHecke K ≃ₐ[K] BCHecke K) = (symmetry w).trans (symmetry v) := by sorry

end Symmetry

theorem IsKMS.comp_symmetry {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) (v : AddAut QmodZ) :
    IsKMS β (φ ∘ₗ (symmetry v : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ).toLinearMap) := by sorry

theorem symmetry_timeEvolution (v : AddAut QmodZ) (z : ℂ) (f : BCHecke ℂ) :
    symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f) := by sorry

theorem symmetry_neg_e (γ : QmodZ) : symmetry (-1 : AddAut QmodZ) (e γ : BCHecke ℚ) = e (-γ) := by
  sorry

theorem symmetry_one : (symmetry 1 : BCHecke ℚ ≃ₐ[ℚ] BCHecke ℚ) = AlgEquiv.refl := by sorry

theorem symmetry_gibbs (β : ℝ) (hβ : 1 < β) (u v : AddAut QmodZ) :
    gibbsState β hβ u ∘ₗ (symmetry v : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ).toLinearMap =
      gibbsState β hβ (u * v) := by sorry

theorem no_symmetry_of_double :
    ¬ ∃ θ : BCHecke ℚ →ₐ[ℚ] BCHecke ℚ,
      (∀ γ : QmodZ, θ (e γ) = e (2 • γ)) ∧ ∀ n : ℕ+, θ (x n) = x n ∧ θ (x' n) = x' n := by sorry

/-- AN.9/kms-classification (the phase transition), in the form used downstream. -/
theorem kms_classification (β : ℝ) (hβ : 0 < β) :
    (β ≤ 1 → ∃! φ : BCHecke ℂ →ₗ[ℂ] ℂ, IsKMS β φ) ∧
    (∀ hβ' : 1 < β, ∀ u v : AddAut QmodZ, gibbsState β hβ' u = gibbsState β hβ' v → u = v) := by
  sorry

/-- The ground state `f ↦ ⟨ε₁, π_u(f) ε₁⟩`. -/
def groundState (u : AddAut QmodZ) : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

/-- AN.9/galois-action-on-ground-states: for every automorphism `τ` of `ℂ` there is `v` with
`τ ∘ φ_{∞,u} = φ_{∞,u} ∘ θ_v` on the rational algebra. -/
theorem groundState_galois (u : AddAut QmodZ) (τ : ℂ ≃+* ℂ) :
    ∃ v : AddAut QmodZ, ∀ f : BCHecke ℚ,
      τ (groundState u (BCHecke.map (Rat.castHom ℂ) f)) =
        groundState u (symmetry v (BCHecke.map (Rat.castHom ℂ) f)) := by sorry

end TauCeti.BostConnes
