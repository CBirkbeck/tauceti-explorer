/- Independent review REV-AnalyticNumberTheory--AN.8 (2026-10-05): needs_changes.
Elaboration was attempted through lean-check and blocked at a missing prebuilt Tau Ceti import.
New relation signatures and corrected tests remain unelaborated; omission blocks are review gaps. -/
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
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.CStarAlgebra.ContinuousLinearMap
import Mathlib.Topology.Algebra.StarSubalgebra
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import TauCeti.NumberTheory.HeckeRing.Basic
import TauCeti.NumberTheory.HeckeRing.Multiplication
import TauCeti.NumberTheory.HeckeRing.Associativity

/-!
# Analytic number theory AN.8–AN.9 — suggested declarations (target-planning pass)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

The inherited core covers the Bost–Connes branch of AN.9; the additions below cover both scoped stages. Missing supplier carrier signatures are explicitly omitted, as the protocol requires. The Bost–Connes algebra is Tau Ceti's
Hecke ring `𝕋 P⁺_ℚ P⁺_ℤ K` of the ax+b pair inside `GL₂(ℚ)`. Its rational generators are the
double cosets `x n = [X_n]`, `x' n = [X_n⁻¹]` and `e γ`; Bost–Connes' `μ_n` is `n^{-1/2} • x n`
over `ℂ`. `ℚ/ℤ` is `AddCircle (1 : ℚ)`, and `Ẑ^×` is `AddAut (ℚ/ℤ)`.
-/

noncomputable section

open Matrix Complex HeckeCosetModule
open scoped HeckeCosetModule ComplexOrder

namespace TauCeti.BostConnes

/-- `ℚ/ℤ`. -/
-- Declaration TauCeti.BostConnes.QmodZ
abbrev QmodZ := AddCircle (1 : ℚ)

/-- `ζ_γ = exp(2πiγ)`, well defined on `ℚ/ℤ`. -/
-- Declaration TauCeti.BostConnes.rootOfUnityOf
def rootOfUnityOf (γ : QmodZ) : ℂ := sorry

-- Declaration TauCeti.BostConnes.rootOfUnityOf_add
theorem rootOfUnityOf_add (γ δ : QmodZ) :
    rootOfUnityOf (γ + δ) = rootOfUnityOf γ * rootOfUnityOf δ := by sorry

/-! ## The ax+b pair -/

/-- `P⁺_ℚ`: the matrices `[1 b; 0 a]` with `a > 0`. -/
-- Declaration TauCeti.BostConnes.axbRat
def axbRat : Subgroup (GL (Fin 2) ℚ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
    0 < (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `P⁺_ℤ`: the matrices `[1 n; 0 1]` with `n ∈ ℤ`. -/
-- Declaration TauCeti.BostConnes.axbInt
def axbInt : Subgroup (GL (Fin 2) ℚ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1 = 1 ∧ ∃ n : ℤ, (g : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = n}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

-- Declaration TauCeti.BostConnes.mem_axbRat_iff
theorem mem_axbRat_iff (g : GL (Fin 2) ℚ) : g ∈ axbRat ↔
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧ (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
      0 < (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1 := Iff.rfl

-- Declaration TauCeti.BostConnes.axbInt_le_axbRat
theorem axbInt_le_axbRat : axbInt ≤ axbRat := by sorry

/-- The `(2,2)` entry `a(g)`, a homomorphism with positive values. -/
-- Declaration TauCeti.BostConnes.diagEntry
def diagEntry : axbRat →* ℚˣ := sorry

-- Declaration TauCeti.BostConnes.diagEntry_pos
theorem diagEntry_pos (g : axbRat) : 0 < ((diagEntry g : ℚˣ) : ℚ) := by sorry

/-- `[1 b; 0 1]`. -/
-- Declaration TauCeti.BostConnes.translation
def translation : Multiplicative ℚ →* axbRat := sorry

/-- `[1 0; 0 a]` for `a > 0`. -/
-- Declaration TauCeti.BostConnes.dilation
def dilation (a : ℚ) (ha : 0 < a) : axbRat := sorry

-- Declaration TauCeti.BostConnes.conj_translation
theorem conj_translation (g : axbRat) (n : ℚ) :
    g * translation (.ofAdd n) * g⁻¹ =
      translation (.ofAdd (n / ((diagEntry g : ℚˣ) : ℚ))) := by sorry

-- Test TauCeti.BostConnes.translation_half_mem_axbRat_not_mem_axbInt
example :
    ((translation (.ofAdd (1 / 2 : ℚ)) : axbRat) : GL (Fin 2) ℚ) ∉ axbInt := by sorry

-- Test TauCeti.BostConnes.not_mem_axbRat_neg_diag
example :
    GeneralLinearGroup.mkOfDetNeZero !![(1 : ℚ), 0; 0, -1] (by simp [det_fin_two]) ∉ axbRat := by
  sorry

-- Test TauCeti.BostConnes.axbInt_not_normal
example : ¬ (axbInt.subgroupOf axbRat).Normal := by sorry

-- Test TauCeti.BostConnes.diagEntry_mul_example
example (g h : axbRat) (hg : ((diagEntry g : ℚˣ) : ℚ) = 2)
    (hh : ((diagEntry h : ℚˣ) : ℚ) = 3) : ((diagEntry (g * h) : ℚˣ) : ℚ) = 6 := by sorry

/-- AN.9/ax-plus-b-hecke-triple. -/
-- Declaration TauCeti.BostConnes.isHeckeTriple_axb
theorem isHeckeTriple_axb : IsHeckeTriple axbRat.toSubmonoid axbInt axbInt := by sorry

instance : IsHeckeTriple axbRat.toSubmonoid axbInt axbInt := isHeckeTriple_axb

/-- The `(2,2)` entry of a double coset. -/
-- Declaration TauCeti.BostConnes.cosetEntry
def cosetEntry (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) : ℚ := sorry

/-- AN.9/double-cosets-and-degrees: `L(X) = den a(X)`. -/
-- Declaration TauCeti.BostConnes.degree_heckeCoset_eq_den
theorem degree_heckeCoset_eq_den (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) :
    X.degree = (cosetEntry X).den := by sorry

/-! ## The Bost–Connes Hecke algebra -/

/-- AN.9/bost-connes-hecke-algebra. -/
-- Declaration TauCeti.BostConnes.BCHecke
abbrev BCHecke (K : Type*) [Field K] := 𝕋 axbRat.toSubmonoid axbInt K

namespace BCHecke

variable {K : Type*} [Field K] [CharZero K]

-- Declaration TauCeti.BostConnes.BCHecke.instAlgebra
instance instAlgebra : Algebra K (BCHecke K) := sorry

/-- `x n = [X_n]`, the double coset of `dilation n`. -/
-- Declaration TauCeti.BostConnes.BCHecke.x
def x (n : ℕ+) : BCHecke K := sorry

/-- `x' n = [X_n⁻¹]`, the double coset of `dilation (1/n)`. -/
-- Declaration TauCeti.BostConnes.BCHecke.x'
def x' (n : ℕ+) : BCHecke K := sorry

/-- `e γ`, the double coset of the translation by a lift of `γ ∈ ℚ/ℤ`. -/
-- Declaration TauCeti.BostConnes.BCHecke.e
def e (γ : QmodZ) : BCHecke K := sorry

-- Declaration TauCeti.BostConnes.BCHecke.e_zero
@[simp] theorem e_zero : (e 0 : BCHecke K) = 1 := by sorry

-- Declaration TauCeti.BostConnes.BCHecke.e_add
theorem e_add (γ δ : QmodZ) : (e (γ + δ) : BCHecke K) = e γ * e δ := by sorry

/-- Tau Ceti's product is Bost–Connes' convolution `(f₁ ∗ f₂)(d) = Σ_{g₁Γ₀} f₁(g₁) f₂(g₁⁻¹d)`. -/
-- Declaration TauCeti.BostConnes.BCHecke.mul_eq_convolution
theorem mul_eq_convolution (f₁ f₂ : BCHecke K) (d : axbRat) :
    (f₁ * f₂) (HeckeCoset.mk axbInt axbInt ⟨d, d.2⟩) =
      ∑ᶠ q : axbRat ⧸ axbInt.subgroupOf axbRat,
        f₁ (HeckeCoset.mk axbInt axbInt ⟨(q.out : GL (Fin 2) ℚ), q.out.2⟩) *
          f₂ (HeckeCoset.mk axbInt axbInt ⟨((q.out⁻¹ * d : axbRat) : GL (Fin 2) ℚ),
            (q.out⁻¹ * d).2⟩) := by sorry

-- Declaration TauCeti.BostConnes.BCHecke.star
instance star : StarRing (BCHecke ℂ) := sorry

-- Declaration TauCeti.BostConnes.BCHecke.star_x
theorem star_x (n : ℕ+) : _root_.star (x n : BCHecke ℂ) = x' n := by sorry

-- Declaration TauCeti.BostConnes.BCHecke.star_e
theorem star_e (γ : QmodZ) : _root_.star (e γ : BCHecke ℂ) = e (-γ) := by sorry

/-- The map induced by a field map. -/
-- Declaration TauCeti.BostConnes.BCHecke.map
def map {L : Type*} [Field L] [CharZero L] (φ : K →+* L) : BCHecke K →+* BCHecke L := sorry

-- Test TauCeti.BostConnes.e_half_mul_self
example : (e (1 / 2 : ℚ) * e (1 / 2 : ℚ) : BCHecke ℚ) = 1 := by sorry

-- Test TauCeti.BostConnes.x'_mul_x_two
example : (x' 2 * x 2 : BCHecke ℚ) = 2 := by sorry

-- Test TauCeti.BostConnes.x_mul_x'_two
example : (x 2 * x' 2 : BCHecke ℚ) = 1 + e (1 / 2 : ℚ) := by sorry

-- Test TauCeti.BostConnes.not_commute_e_half_x_two
example : (e (1 / 2 : ℚ) * x 2 : BCHecke ℚ) ≠ x 2 * e (1 / 2 : ℚ) := by
  sorry

-- Test TauCeti.BostConnes.x_one
example : (x 1 : BCHecke K) = 1 ∧ (x' 1 : BCHecke K) = 1 := by sorry

-- Declaration TauCeti.BostConnes.BCHecke.x_prime_mul_x
theorem x_prime_mul_x (n : ℕ+) : (x' n * x n : BCHecke K) = algebraMap K _ ((n : ℕ) : K) := by sorry
-- Declaration TauCeti.BostConnes.BCHecke.x_mul
theorem x_mul (n m : ℕ+) : (x (n*m) : BCHecke K) = x n * x m := by sorry
-- Declaration TauCeti.BostConnes.BCHecke.x_prime_mul
theorem x_prime_mul (n m : ℕ+) : (x' (n*m) : BCHecke K) = x' n * x' m := by sorry
-- Declaration TauCeti.BostConnes.BCHecke.x_mul_x_prime_of_coprime
theorem x_mul_x_prime_of_coprime (n m : ℕ+) (h : Nat.Coprime n m) : (x n * x' m : BCHecke K) = x' m * x n := by sorry
-- Declaration TauCeti.BostConnes.BCHecke.e_mul_x
theorem e_mul_x (γ : QmodZ) (n : ℕ+) : (e γ * x n : BCHecke K) = x n * e ((n : ℕ) • γ) := by sorry
-- Declaration TauCeti.BostConnes.BCHecke.x_mul_e_mul_x_prime
theorem x_mul_e_mul_x_prime (γ : QmodZ) (n : ℕ+) : (x n * e γ * x' n : BCHecke K) = ∑ᶠ (δ : QmodZ) (_ : (n : ℕ) • δ = γ), e δ := by sorry

/-- AN.9/rational-presentation: the relations (a′)–(f′) and the double-coset basis
`x n * e γ * x' m = [class of [1 γ/m; 0 n/m]]` for coprime `n, m`. -/
-- Declaration TauCeti.BostConnes.BCHecke.presentation
theorem presentation :
    (∀ n : ℕ+, (x' n * x n : BCHecke K) = algebraMap K _ ((n : ℕ) : K)) ∧
    (∀ n m : ℕ+, (x (n * m) : BCHecke K) = x n * x m ∧ (x' (n * m) : BCHecke K) = x' n * x' m) ∧
    (∀ n m : ℕ+, Nat.Coprime n m → (x n * x' m : BCHecke K) = x' m * x n) ∧
    (∀ (γ : QmodZ) (n : ℕ+), (e γ * x n : BCHecke K) = x n * e ((n : ℕ) • γ)) ∧
    (∀ (γ : QmodZ) (n : ℕ+), (x n * e γ * x' n : BCHecke K) =
      ∑ᶠ (δ : QmodZ) (_ : (n : ℕ) • δ = γ), e δ) := by
  sorry

/-- The double-coset basis: `x n * e γ * x' m` is the class of `[1 γ/m; 0 n/m]`. -/
-- Declaration TauCeti.BostConnes.BCHecke.x_mul_e_mul_x'
theorem x_mul_e_mul_x' (n m : ℕ+) (hnm : Nat.Coprime n m) (γ : ℚ) :
    (x n * e γ * x' m : BCHecke K) =
      single K (HeckeCoset.mk axbInt axbInt
        ⟨((dilation ((n : ℚ) / m) (by positivity) * translation (.ofAdd (γ / m)) : axbRat) :
          GL (Fin 2) ℚ), (dilation ((n : ℚ) / m) (by positivity) *
            translation (.ofAdd (γ / m))).2⟩) 1 := by sorry

end BCHecke

/-! ## The time evolution -/

/-- AN.9/time-evolution: `σ_z f = (X ↦ a(X)^{iz} f(X))`. -/
-- Declaration TauCeti.BostConnes.timeEvolution
def timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ := sorry

open BCHecke

-- Declaration TauCeti.BostConnes.timeEvolution_zero
@[simp] theorem timeEvolution_zero : timeEvolution 0 = AlgEquiv.refl := by sorry

-- Declaration TauCeti.BostConnes.timeEvolution_add
theorem timeEvolution_add (z w : ℂ) :
    timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w) := by sorry

-- Declaration TauCeti.BostConnes.timeEvolution_x
@[simp] theorem timeEvolution_x (z : ℂ) (n : ℕ+) :
    timeEvolution z (x n) = ((n : ℂ) ^ (I * z)) • x n := by sorry

-- Declaration TauCeti.BostConnes.timeEvolution_x'
@[simp] theorem timeEvolution_x' (z : ℂ) (n : ℕ+) :
    timeEvolution z (x' n) = ((n : ℂ) ^ (-(I * z))) • x' n := by sorry

-- Declaration TauCeti.BostConnes.timeEvolution_e
@[simp] theorem timeEvolution_e (z : ℂ) (γ : QmodZ) : timeEvolution z (e γ) = e γ := by sorry

-- Declaration TauCeti.BostConnes.timeEvolution_star
theorem timeEvolution_star (t : ℝ) (f : BCHecke ℂ) :
    timeEvolution t (_root_.star f) = _root_.star (timeEvolution t f) := by sorry

/-- Bost–Connes' form `σ_t(f)(X) = (L(X)/R(X))^{-it} f(X)`. -/
-- Declaration TauCeti.BostConnes.timeEvolution_eq_LR
theorem timeEvolution_eq_LR (t : ℝ) (f : BCHecke ℂ)
    (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt) :
    timeEvolution t f X = ((X.degree : ℂ) / (cosetEntry X).num.natAbs) ^ (-(I * t)) * f X := by
  sorry

/-- Unit test: weighting by the left degree `L(X)` alone is not multiplicative. -/
-- Test TauCeti.BostConnes.not_multiplicative_left_degree_only
example (t : ℝ) (ht : (2 : ℂ) ^ (I * t) ≠ 1) :
    ¬ ∃ θ : BCHecke ℂ →ₐ[ℂ] BCHecke ℂ,
      ∀ (f : BCHecke ℂ) (X : HeckeCoset axbRat.toSubmonoid axbInt axbInt),
        θ f X = (X.degree : ℂ) ^ (I * t) * f X := by sorry

-- Test TauCeti.BostConnes.timeEvolution_x_two
example (t : ℝ) : timeEvolution t (x 2) = ((2 : ℂ) ^ (I * t)) • x 2 := by
  sorry

-- Test TauCeti.BostConnes.timeEvolution_x_mul_x'
example (z : ℂ) : timeEvolution z (x 2 * x' 2) = x 2 * x' 2 := by sorry

-- Test TauCeti.BostConnes.timeEvolution_neg_half_I
example (n : ℕ+) :
    timeEvolution (-I / 2) (((n : ℂ) ^ (-(1 / 2) : ℂ)) • x n) = x n := by sorry

/-- AN.9/rational-forms-comparison: `σ_{-i/2}` carries Bost–Connes' rational span of the
`μ_n e(γ) μ*_m` onto the `ℚ`-valued functions. -/
-- Declaration TauCeti.BostConnes.sigma_neg_half_I_map_rationalForm
theorem sigma_neg_half_I_map_rationalForm (n m : ℕ+) (γ : QmodZ) :
    timeEvolution (-I / 2) (((n * m : ℕ) : ℂ) ^ (-(1 / 2) : ℂ) • (x n * e γ * x' m)) =
      ((m : ℂ)⁻¹) • (x n * e γ * x' m) := by sorry

/-! ## The representation on `ℓ²(ℕ≥1)` and the partition function -/

/-- `ℓ²(ℕ≥1)`. -/
-- Declaration TauCeti.BostConnes.L2
abbrev L2 := lp (fun _ : ℕ+ ↦ ℂ) 2

/-- AN.9/regular-representation. -/
-- Declaration TauCeti.BostConnes.regularRep
def regularRep (u : AddAut QmodZ) : BCHecke ℂ →ₐ[ℂ] (L2 →L[ℂ] L2) := sorry

-- Declaration TauCeti.BostConnes.regularRep_x
theorem regularRep_x (u : AddAut QmodZ) (n k : ℕ+) :
    regularRep u (x n) (lp.single 2 k 1) = ((n : ℂ) ^ (1 / 2 : ℂ)) • lp.single 2 (n * k) 1 := by
  sorry

-- Declaration TauCeti.BostConnes.regularRep_e
theorem regularRep_e (u : AddAut QmodZ) (γ : QmodZ) (k : ℕ+) :
    regularRep u (e γ) (lp.single 2 k 1) = rootOfUnityOf ((k : ℕ) • u γ) • lp.single 2 k 1 := by
  sorry

-- Declaration TauCeti.BostConnes.regularRep_star
theorem regularRep_star (u : AddAut QmodZ) (f : BCHecke ℂ) :
    regularRep u (_root_.star f) = ContinuousLinearMap.adjoint (regularRep u f) := by sorry

/-- `e^{-βH}`, the diagonal operator `ε_k ↦ k^{-β} ε_k`. -/
-- Declaration TauCeti.BostConnes.hamiltonianExp
def hamiltonianExp (β : ℝ) (hβ : 0 < β) : L2 →L[ℂ] L2 := sorry

/-- `π_u(σ_t f) = e^{itH} π_u(f) e^{-itH}`, in matrix coefficients. -/
-- Declaration TauCeti.BostConnes.regularRep_timeEvolution
theorem regularRep_timeEvolution (u : AddAut QmodZ) (t : ℝ) (f : BCHecke ℂ) (j k : ℕ+) :
    inner ℂ (lp.single 2 j (1 : ℂ)) (regularRep u (timeEvolution t f) (lp.single 2 k 1)) =
      ((j : ℂ) / k) ^ (I * t) *
        inner ℂ (lp.single 2 j (1 : ℂ)) (regularRep u f (lp.single 2 k 1)) := by sorry

-- Test TauCeti.BostConnes.regularRep_x_mul_x'_two
example (u : AddAut QmodZ) (k : ℕ+) :
    regularRep u (x 2 * x' 2) (lp.single 2 k 1) =
      (if 2 ∣ (k : ℕ) then (2 : ℂ) else 0) • lp.single 2 k 1 := by sorry

-- Test TauCeti.BostConnes.regularRep_one
example (u : AddAut QmodZ) : regularRep u 1 = 1 := by sorry

-- Test TauCeti.BostConnes.regularRep_mu_isometry
example (u : AddAut QmodZ) (v : L2) :
    ‖((2 : ℂ) ^ (-(1 / 2) : ℂ)) • regularRep u (x 2) v‖ = ‖v‖ := by sorry

-- Test TauCeti.BostConnes.regularRep_x'_one_zero
example (u : AddAut QmodZ) :
    regularRep u (x' 2) (lp.single 2 1 1) = 0 := by sorry

/-- AN.9/partition-function: `Σ_k ⟨ε_k, e^{-βH} ε_k⟩ = ζ(β)` for `β > 1`. -/
-- Declaration TauCeti.BostConnes.tsum_hamiltonian_eq_riemannZeta
theorem tsum_hamiltonian_eq_riemannZeta (β : ℝ) (hβ : 1 < β) :
    ∑' k : ℕ+, ((k : ℂ) ^ (-(β : ℂ))) = riemannZeta β := by sorry

/-! ## Gibbs states, KMS states, symmetries -/

/-- AN.9/gibbs-states. -/
-- Declaration TauCeti.BostConnes.gibbsState
def gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

-- Declaration TauCeti.BostConnes.gibbsState_one
theorem gibbsState_one (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : gibbsState β hβ u 1 = 1 := by
  sorry

-- Declaration TauCeti.BostConnes.gibbsState_star_mul_self_nonneg
theorem gibbsState_star_mul_self_nonneg (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (f : BCHecke ℂ) :
    0 ≤ gibbsState β hβ u (_root_.star f * f) := by sorry

-- Declaration TauCeti.BostConnes.gibbsState_e
theorem gibbsState_e (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (γ : QmodZ) :
    gibbsState β hβ u (e γ) =
      (∑' k : ℕ+, rootOfUnityOf ((k : ℕ) • u γ) / (k : ℂ) ^ (β : ℂ)) / riemannZeta β := by sorry

-- Declaration TauCeti.BostConnes.gibbsState_basis_of_ne
theorem gibbsState_basis_of_ne (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) (n m : ℕ+) (γ : QmodZ)
    (h : n ≠ m) : gibbsState β hβ u (x n * e γ * x' m) = 0 := by sorry

-- Test TauCeti.BostConnes.gibbsState_e_half
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (e (1 / 2 : ℚ)) = 2 ^ (1 - (β : ℂ)) - 1 := by sorry

-- Test TauCeti.BostConnes.gibbsState_x_mul_x'_two
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x 2 * x' 2) = 2 ^ (1 - (β : ℂ)) := by sorry

-- Test TauCeti.BostConnes.gibbsState_e_zero
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (e 0) = 1 := by sorry

-- Test TauCeti.BostConnes.gibbsState_x_two
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x 2) = 0 := by sorry

/-- AN.9/kms-states: the algebraic KMS condition on the dense Hecke algebra. -/
-- Declaration TauCeti.BostConnes.IsKMS
def IsKMS (β : ℝ) (φ : BCHecke ℂ →ₗ[ℂ] ℂ) : Prop :=
  0 < β ∧ φ 1 = 1 ∧ (∀ f, 0 ≤ φ (_root_.star f * f)) ∧ ∀ f g, φ (f * timeEvolution (I * β) g) = φ (g * f)

-- Declaration TauCeti.BostConnes.IsKMS.timeEvolution_invariant
theorem IsKMS.timeEvolution_invariant {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) (t : ℝ)
    (f : BCHecke ℂ) : φ (timeEvolution t f) = φ f := by sorry

-- Declaration TauCeti.BostConnes.IsKMS.convex
theorem IsKMS.convex {β : ℝ} : Convex ℝ {φ : BCHecke ℂ →ₗ[ℂ] ℂ | IsKMS β φ} := by sorry

/-- AN.9/gibbs-states-are-kms. -/
-- Declaration TauCeti.BostConnes.isKMS_gibbsState
theorem isKMS_gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    IsKMS β (gibbsState β hβ u) := by sorry

/-- The vector state at the base point, `f ↦ f(identity coset)`. -/
-- Declaration TauCeti.BostConnes.baseState
def baseState : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

-- Test TauCeti.BostConnes.isKMS_one_iff
example (β : ℝ) (hβ : 0 < β) : IsKMS β baseState ↔ β = 1 := by sorry

-- Test TauCeti.BostConnes.isKMS_sign
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbsState β hβ u (x' 2 * timeEvolution (-(I * β)) (x 2)) ≠
      gibbsState β hβ u (x 2 * x' 2) := by sorry

-- Test TauCeti.BostConnes.isKMS_x_mul_x'_two
example {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) :
    φ (x 2 * x' 2) = 2 ^ (1 - (β : ℂ)) := by sorry

/-- AN.9/symmetry-action. -/
-- Declaration TauCeti.BostConnes.symmetry
def symmetry {K : Type*} [Field K] [CharZero K] (v : AddAut QmodZ) : BCHecke K ≃ₐ[K] BCHecke K :=
  sorry

section Symmetry
variable {K : Type*} [Field K] [CharZero K]

-- Declaration TauCeti.BostConnes.symmetry_e
@[simp] theorem symmetry_e (v : AddAut QmodZ) (γ : QmodZ) :
    symmetry v (e γ : BCHecke K) = e (v γ) := by sorry

-- Declaration TauCeti.BostConnes.symmetry_x
@[simp] theorem symmetry_x (v : AddAut QmodZ) (n : ℕ+) :
    symmetry v (x n : BCHecke K) = x n ∧ symmetry v (x' n : BCHecke K) = x' n := by sorry

-- Declaration TauCeti.BostConnes.symmetry_mul
theorem symmetry_mul (v w : AddAut QmodZ) :
    (symmetry (v * w) : BCHecke K ≃ₐ[K] BCHecke K) = (symmetry w).trans (symmetry v) := by sorry

end Symmetry

-- Declaration TauCeti.BostConnes.IsKMS.comp_symmetry
theorem IsKMS.comp_symmetry {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) (v : AddAut QmodZ) :
    IsKMS β (φ ∘ₗ (symmetry v : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ).toLinearMap) := by sorry

-- Declaration TauCeti.BostConnes.symmetry_timeEvolution
theorem symmetry_timeEvolution (v : AddAut QmodZ) (z : ℂ) (f : BCHecke ℂ) :
    symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f) := by sorry

-- Test TauCeti.BostConnes.symmetry_neg_e
example (γ : QmodZ) : symmetry (AddEquiv.neg QmodZ) (e γ : BCHecke ℚ) = e (-γ) := by
  sorry

-- Test TauCeti.BostConnes.symmetry_one
example : (symmetry 1 : BCHecke ℚ ≃ₐ[ℚ] BCHecke ℚ) = AlgEquiv.refl := by sorry

-- Test TauCeti.BostConnes.symmetry_gibbs
example (β : ℝ) (hβ : 1 < β) (u v : AddAut QmodZ) :
    gibbsState β hβ u ∘ₗ (symmetry v : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ).toLinearMap =
      gibbsState β hβ (u * v) := by sorry

-- Test TauCeti.BostConnes.no_symmetry_of_double
example :
    ¬ ∃ θ : BCHecke ℚ →ₐ[ℚ] BCHecke ℚ,
      (∀ γ : QmodZ, θ (e γ) = e (2 • γ)) ∧ ∀ n : ℕ+, θ (x n) = x n ∧ θ (x' n) = x' n := by sorry

/-- Algebraic-core consequences of the phase transition. The complete bounded-state
classification and barycentre interface is omitted below. -/
-- Declaration TauCeti.BostConnes.kms_classification_algebraic_core
theorem kms_classification_algebraic_core (β : ℝ) (hβ : 0 < β) :
    (β ≤ 1 → ∃! φ : BCHecke ℂ →ₗ[ℂ] ℂ, IsKMS β φ) ∧
    (∀ hβ' : 1 < β, ∀ u v : AddAut QmodZ, gibbsState β hβ' u = gibbsState β hβ' v → u = v) := by
  sorry

/-- The extremal KMS∞ vector state `f ↦ ⟨ε₁, π_u(f) ε₁⟩`. -/
-- Declaration TauCeti.BostConnes.groundState
def groundState (u : AddAut QmodZ) : BCHecke ℂ →ₗ[ℂ] ℂ := sorry

/-- AN.9/galois-action-on-ground-states: for every automorphism `τ` of `ℂ` there is `v` with
`τ ∘ φ_{∞,u} = φ_{∞,u} ∘ θ_v` on the rational algebra. -/
-- Declaration TauCeti.BostConnes.groundState_galois
theorem groundState_galois (u : AddAut QmodZ) (τ : ℂ ≃+* ℂ) :
    ∃ v : AddAut QmodZ, ∀ f : BCHecke ℚ,
      τ (groundState u (BCHecke.map (Rat.castHom ℂ) f)) =
        groundState u (symmetry v (BCHecke.map (Rat.castHom ℂ) f)) := by sorry

end TauCeti.BostConnes


/-! These signatures are prototypes against actual carriers. Canonical supplier adapters remain
explicit gaps. Infinite sums/products are only analytic values on their proved convergence domains;
continuations are separate data-valued constructions. No build at both pins was available. -/

namespace TauCeti.SeveralVariableZeta

-- Declaration TauCeti.SeveralVariableZeta.Characters8
abbrev Characters8 := Fin 4
namespace Characters8
-- Declaration TauCeti.SeveralVariableZeta.Characters8.value
def value (i : Characters8) (n : ℕ) : ℂ :=
  if n % 2 = 0 then 0 else
  match i.val with
  | 0 => 1
  | 1 => if n % 4 = 1 then 1 else -1
  | 2 => if n % 8 = 1 ∨ n % 8 = 7 then 1 else -1
  | _ => if n % 8 = 1 ∨ n % 8 = 3 then 1 else -1
-- Declaration TauCeti.SeveralVariableZeta.Characters8.mul
theorem mul (i : Characters8) (m n : ℕ) : value i (m*n) = value i m * value i n := by sorry
-- Declaration TauCeti.SeveralVariableZeta.Characters8.unit_table
theorem unit_table : (value 2 1, value 2 3, value 2 5, value 2 7) = (1,-1,-1,1) := by sorry
-- TauCeti.SeveralVariableZeta.Characters8.test_one
example (i : Characters8) : value i 1 = 1 := by sorry
-- TauCeti.SeveralVariableZeta.Characters8.test_signs
example : value 2 3 = -1 ∧ value 3 7 = -1 := by sorry
-- TauCeti.SeveralVariableZeta.Characters8.test_orthogonality
example (i j : Characters8) : (∑ k : Fin 4, value i (2*k.val+1) * value j (2*k.val+1)) =
    if i=j then 4 else 0 := by sorry
end Characters8

-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries
def DoubleSeries (i j : Characters8) (s w : ℂ) : ℂ :=
  ((1 - (2:ℂ)^(- (2*s+2*w-1))) * riemannZeta (2*s+2*w-1)) *
  ∑' d : ℕ, (if d % 2 = 1 then
    LSeries (fun n => if n % 2 = 1 then (jacobiSym (d:ℤ) n : ℂ) * Characters8.value i n else 0) s *
      Characters8.value j d / (d:ℂ)^w else 0)
namespace DoubleSeries
-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries.oddZeta
def oddZeta (s : ℂ) : ℂ := (1-(2:ℂ)^(-s))*riemannZeta s
-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries.oddL
def oddL (i : Characters8) (d : ℕ) (s : ℂ) : ℂ :=
  LSeries (fun n => if n%2=1 then (jacobiSym (d:ℤ) n : ℂ)*Characters8.value i n else 0) s
-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries.series
def series := DoubleSeries
-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries.continued
def continued (i j : Characters8) : ℂ × ℂ → ℂ := sorry
-- Declaration TauCeti.SeveralVariableZeta.DoubleSeries.continued_agrees
theorem continued_agrees (i j : Characters8) (s w : ℂ) (hs : 1<s.re) (hw : 1<w.re) :
  continued i j (s,w) = series i j s w := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_odd_zeta
example (s : ℂ) (hs : 1<s.re) : oddZeta s =
  ∑' n : ℕ, if n%2=1 then 1/(n:ℂ)^s else 0 := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_imprimitive
example : jacobiSym 9 3 = 0 ∧ jacobiSym 1 3 = 1 := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_first_coefficient
example (i : Characters8) (s : ℂ) : oddL i 1 s =
  LSeries (fun n => Characters8.value i n) s := by sorry
end DoubleSeries

-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem
structure FunctionalSystem where
  swapMap : ℂ × ℂ → ℂ × ℂ
  reflectMap : ℂ × ℂ → ℂ × ℂ
  reciprocity : Matrix (Fin 4 × Fin 4) (Fin 4 × Fin 4) ℂ
  reflection : ℂ → Matrix (Fin 4 × Fin 4) (Fin 4 × Fin 4) ℂ
namespace FunctionalSystem
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.swap
def swap (z : ℂ × ℂ) := (z.2,z.1)
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.reflect
def reflect (z : ℂ × ℂ) := (1-z.1,z.1+z.2-1/2)
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.A
def A (ij kl : Fin 4 × Fin 4) : ℂ := (1/16:ℂ) * ∑ a : Fin 4, ∑ b : Fin 4,
  Characters8.value ij.1 (2*b.val+1) * Characters8.value ij.2 (2*a.val+1) *
  Characters8.value kl.1 (2*a.val+1) * Characters8.value kl.2 (2*b.val+1) * (-1:ℂ)^(a.val*b.val)
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.q
def q (i a : Fin 4) : ℂ :=
  if 2≤i.val then 8 else if (i.val=0 ∧ a.val%2=0) ∨ (i.val=1 ∧ a.val%2=1) then 1 else 4
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.parity
def parity (i : Fin 4) : ℂ := if i.val%2=0 then 0 else 1
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.twoValue
def twoValue (i a : Fin 4) : ℂ :=
  if q i a = 1 then if a.val=0 ∨ a.val=3 then 1 else -1 else 0
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio
def localRatio (i a : Fin 4) (s : ℂ) : ℂ :=
  (q i a / (Real.pi:ℂ))^(1/2-s) * Complex.Gamma ((1-s+parity i)/2) /
  Complex.Gamma ((s+parity i)/2) * (1-twoValue i a*(2:ℂ)^(-s)) /
  (1-twoValue i a*(2:ℂ)^(s-1))
/-- Meromorphic factors with removable singularities filled as specified by the source.
The displayed raw quotient is compared to this construction only off its denominators. -/
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.B
def B (s : ℂ) : Matrix (Fin 4 × Fin 4) (Fin 4 × Fin 4) ℂ := sorry
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.B_off_denominators
theorem B_off_denominators (s : ℂ) (i j k : Fin 4)
    (hp : ∀ a : Fin 4, ∀ n : ℕ, (1-s+parity i)/2 ≠ -(n:ℂ))
    (h : ∀ a : Fin 4, Complex.Gamma ((s+parity i)/2) ≠ 0 ∧
      1-twoValue i a*(2:ℂ)^(s-1) ≠ 0) :
  B s (i,j) (i,k) = (1/4:ℂ)*∑ a : Fin 4,
    Characters8.value j (2*a.val+1)*localRatio i a s*Characters8.value k (2*a.val+1) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_square
example : A * A = 1 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_affine_order
example (z : ℂ × ℂ) : swap (swap z)=z ∧ reflect (reflect z)=z ∧
  (swap ∘ reflect)^[6] z=z := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_twist_two
example (s : ℂ) (j k : Fin 4) (h : Complex.Gamma (s/2) ≠ 0)
  (hp : ∀ n : ℕ, (1-s)/2 ≠ -(n:ℂ)) :
  B s (2,j) (2,k) = if j=k then ((Real.pi:ℂ)/8)^(s-1/2) *
    Complex.Gamma ((1-s)/2)/Complex.Gamma (s/2) else 0 := by sorry
end FunctionalSystem

-- Declaration TauCeti.SeveralVariableZeta.double_series_pole_clear_entire
theorem double_series_pole_clear_entire (i j : Fin 4) :
  AnalyticOnNhd ℂ (fun z : ℂ × ℂ =>
    (z.1-1)*(z.2-1)*(z.1+z.2-3/2)*DoubleSeries.continued i j z) Set.univ := by sorry
-- Declaration TauCeti.SeveralVariableZeta.reciprocity_swap_equation
theorem reciprocity_swap_equation (z : ℂ × ℂ) :
  (fun ij : Fin 4 × Fin 4 => DoubleSeries.continued ij.1 ij.2 z) =
    FunctionalSystem.A.mulVec (fun ij => DoubleSeries.continued ij.1 ij.2 (z.2,z.1)) := by sorry

-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral
def LocalIntegral {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
    (disc : V → K) (absValue : K → ℝ) (Φ : V → ℂ) (s : ℂ) : ℂ :=
  ∫ x in {x | disc x ≠ 0}, Φ x * (absValue (disc x) : ℂ)^s ∂μ
namespace LocalIntegral
-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral.integral
def integral := @LocalIntegral
-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral.shellDensity
def shellDensity {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
    (disc : V → K) (valuation : V → ℕ) (U : Set V) (k : ℕ) : ℝ≥0∞ :=
  μ {x | x∈U ∧ disc x ≠ 0 ∧ valuation x=k}
-- TauCeti.SeveralVariableZeta.LocalIntegral.test_zero_test_function
example {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
  (d : V → K) (v : K → ℝ) (s : ℂ) : LocalIntegral μ d v 0 s = 0 := by sorry
-- TauCeti.SeveralVariableZeta.LocalIntegral.test_unit_support
example {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
  (d : V → K) (v : K → ℝ) (Φ : V → ℂ) (s : ℂ)
  (h : ∀ x, Φ x ≠ 0 → d x ≠ 0 ∧ v (d x)=1) :
  LocalIntegral μ d v Φ s = ∫ x, Φ x ∂μ := by sorry
-- TauCeti.SeveralVariableZeta.LocalIntegral.test_linear_benchmark
example (q : ℝ) (hq : 1<q) (s : ℂ) (hs : -1<s.re) :
  (∑' k : ℕ, (1-(q:ℂ)⁻¹)*(q:ℂ)^(-((k:ℂ)*(s+1)))) =
    (1-(q:ℂ)⁻¹)/(1-(q:ℂ)^(-s-1)) := by sorry
end LocalIntegral

/-! The general functions below take the actual ST enumeration and invariant maps as parameters.
Their canonical number-field/adelic adapters are explicit gaps, not surrogate orbit definitions. -/
-- Declaration TauCeti.SeveralVariableZeta.CubicShintani
def CubicShintani {ι : Type*} (disc aut : ι → ℕ) {σ : Type*} [DecidableEq σ] (signature : ι → σ) (a : σ) (s : ℂ) : ℂ :=
  ∑' x : ι, if disc x ≠ 0 ∧ signature x=a then (aut x:ℂ)⁻¹/(disc x:ℂ)^s else 0
namespace CubicShintani
-- Declaration TauCeti.SeveralVariableZeta.CubicShintani.coefficient
def coefficient {ι : Type*} (disc aut : ι → ℕ) {σ : Type*} [DecidableEq σ] (signature : ι → σ) (a : σ) (m : ℕ) : ℂ :=
  ∑' x : ι, if disc x=m ∧ m≠0 ∧ signature x=a then (aut x:ℂ)⁻¹ else 0
-- Declaration TauCeti.SeveralVariableZeta.CubicShintani.series
def series := @CubicShintani
-- Declaration TauCeti.SeveralVariableZeta.CubicShintani.dual
def dual {ι : Type*} (disc aut : ι → ℕ) {σ : Type*} [DecidableEq σ] (signature : ι → σ) (traceDivisible : ι → Bool)
    (a : σ) (s : ℂ) : ℂ :=
  ∑' x : ι, if disc x≠0 ∧ signature x=a ∧ traceDivisible x=true then
    (aut x:ℂ)⁻¹/(disc x:ℂ)^s else 0
-- Declaration TauCeti.SeveralVariableZeta.CubicShintani.dual_le
theorem dual_le {ι : Type*} (disc aut : ι → ℕ) {σ : Type*} [DecidableEq σ] (signature : ι → σ) (traceDivisible : ι → Bool)
  (a : σ) (σ : ℝ) (hσ : 1<σ) (ha : ∀ x, 0<aut x)
  (hs : Summable (fun x : ι => (aut x:ℝ)⁻¹/(disc x:ℝ)^σ)) :
  0 ≤ (dual disc aut signature traceDivisible a σ).re ∧
  (dual disc aut signature traceDivisible a σ).re ≤ (series disc aut signature a σ).re := by sorry
-- TauCeti.SeveralVariableZeta.CubicShintani.test_split_weight
example : series (fun _ : Unit => 1) (fun _ => 6) (fun _ => false) false (2:ℂ) =
  1/6 := by sorry
-- TauCeti.SeveralVariableZeta.CubicShintani.test_zero_discriminant
example (s : ℂ) : series (fun _ : Unit => 0) (fun _ => 1) (fun _ => false) false s = 0 := by sorry
-- TauCeti.SeveralVariableZeta.CubicShintani.test_dual_subseries
example (s : ℂ) : dual (fun _ : Unit => 1) (fun _ => 1) (fun _ => false)
  (fun _ => false) false s = 0 ∧
  series (fun _ : Unit => 1) (fun _ => 1) (fun _ => false) false s = 1 := by sorry
end CubicShintani

-- Declaration TauCeti.SeveralVariableZeta.ArchMatrix
def ArchMatrix (r c : ℕ) (α β : Fin r → Bool) (s : ℂ) : ℂ :=
  (∏ v, if α v=β v then Complex.sin (2*Real.pi*s)/2 else
    if α v=false then 3*Complex.sin (Real.pi*s)/2 else Complex.sin (Real.pi*s)/2) *
  (Complex.sin (Real.pi*s)^2 * Complex.sin (Real.pi*s-Real.pi/6) *
    Complex.sin (Real.pi*s+Real.pi/6))^c
namespace ArchMatrix
-- Declaration TauCeti.SeveralVariableZeta.ArchMatrix.realEntry
def realEntry (a b : Bool) (s : ℂ) : ℂ := if a=b then Complex.sin (2*Real.pi*s)/2 else
  if a=false then 3*Complex.sin (Real.pi*s)/2 else Complex.sin (Real.pi*s)/2
-- Declaration TauCeti.SeveralVariableZeta.ArchMatrix.complexEntry
def complexEntry (s : ℂ) : ℂ := Complex.sin (Real.pi*s)^2 *
  Complex.sin (Real.pi*s-Real.pi/6)*Complex.sin (Real.pi*s+Real.pi/6)
-- Declaration TauCeti.SeveralVariableZeta.ArchMatrix.entry
def entry := ArchMatrix
-- TauCeti.SeveralVariableZeta.ArchMatrix.test_real_one
example (a b : Bool) : realEntry a b 1=0 := by sorry
-- TauCeti.SeveralVariableZeta.ArchMatrix.test_complex_order_two
example : Filter.Tendsto (fun s : ℂ => complexEntry s/(s-1)^2)
  (nhdsWithin 1 {s : ℂ | s≠1}) (nhds (-(Real.pi:ℂ)^2/4)) := by sorry
-- TauCeti.SeveralVariableZeta.ArchMatrix.test_tensor_degree
example (r c : ℕ) (α β : Fin r → Bool) : ∃ f : ℂ → ℂ,
  AnalyticAt ℂ f 1 ∧ ∀ s, entry r c α β s=(s-1)^(r+2*c)*f s := by sorry
end ArchMatrix
end TauCeti.SeveralVariableZeta

namespace TauCeti.SpectralZeta
-- Declaration TauCeti.SpectralZeta.SpectralData
def SpectralData {ι : Type*} (λ : ι → ℝ) (s : ℂ) : ℂ := ∑' j, (λ j:ℂ)^(-s)
namespace SpectralData
-- Declaration TauCeti.SpectralZeta.SpectralData.series
def series := @SpectralData
-- Declaration TauCeti.SpectralZeta.SpectralData.heat
def heat {ι : Type*} (λ : ι → ℝ) (t : ℝ) : ℂ := ∑' j, Complex.exp (-(t:ℂ)*(λ j:ℂ))
-- Declaration TauCeti.SpectralZeta.SpectralData.continued
def continued (λ : ℕ → ℝ) : ℂ → ℂ := sorry
-- TauCeti.SpectralZeta.SpectralData.test_single_eigenvalue
example (λ : ℝ) (s : ℂ) : series (fun _ : Unit => λ) s=(λ:ℂ)^(-s) := by sorry
-- TauCeti.SpectralZeta.SpectralData.test_zero_omitted
example (t : ℝ) : heat (fun _ : Unit => 0) t=1 := by sorry
-- TauCeti.SpectralZeta.SpectralData.test_scaling
example {ι : Type*} (λ : ι → ℝ) (c : ℝ) (hc : 0<c) (hλ : ∀ j, 0<λ j) (s : ℂ)
  (h : Summable (fun j => (λ j:ℂ)^(-s))) :
  series (fun j => c*λ j) s=(c:ℂ)^(-s)*series λ s := by sorry
end SpectralData
-- Declaration TauCeti.SpectralZeta.Selberg
def Selberg {ι : Type*} (length : ι → ℝ) (s : ℂ) : ℂ :=
  ∏' p, ∏' k : ℕ, 1-Complex.exp (-((s+k)*(length p:ℂ)))
namespace Selberg
-- Declaration TauCeti.SpectralZeta.Selberg.product
def product := @Selberg
-- Declaration TauCeti.SpectralZeta.Selberg.continued
def continued (length : ℕ → ℝ) : ℂ → ℂ := sorry
-- Declaration TauCeti.SpectralZeta.Selberg.log_derivative
theorem log_derivative (length : ℕ → ℝ) (s : ℂ) (hs : 1<s.re)
  (hprod : Multipliable (fun p => ∏' k : ℕ, 1-Complex.exp (-((s+k)*(length p:ℂ)))))
  (hd : DifferentiableAt ℂ (product length) s)
  (hz : product length s ≠ 0)
  (hl : ∀ p, 0<length p)
  (hfinite : ∀ T : ℝ, Set.Finite {p | length p≤T})
  (hg : ∃ C : ℝ, ∀ T : ℝ, 0<T →
    (({p | length p≤T}).ncard:ℝ)≤C*Real.exp T) :
  deriv (product length) s / product length s =
    ∑' p : ℕ, ∑' m : ℕ+, (length p:ℂ)*Complex.exp (-(m:ℂ)*s*(length p:ℂ)) /
      (1-Complex.exp (-(m:ℂ)*(length p:ℂ))) := by sorry
-- TauCeti.SpectralZeta.Selberg.test_primitive_repeat
example (l : ℝ) (s : ℂ) : product (fun _ : Unit => l) s=
  ∏' k : ℕ, 1-Complex.exp (-((s+k)*(l:ℂ))) := by sorry
-- TauCeti.SpectralZeta.Selberg.test_two_lengths
example (l₁ l₂ : ℝ) (s : ℂ) : product (fun b : Bool => if b then l₁ else l₂) s=
  product (fun _ : Unit => l₁) s * product (fun _ : Unit => l₂) s := by sorry
-- TauCeti.SpectralZeta.Selberg.test_orientation
example (l : ℝ) (s : ℂ) : product (fun _ : Bool => l) s=
  (product (fun _ : Unit => l) s)^2 := by sorry
end Selberg
-- Declaration TauCeti.SpectralZeta.RegularizedDet
def RegularizedDet (f : ℂ → ℂ) : ℂ := Complex.exp (-deriv f 0)
namespace RegularizedDet
-- Declaration TauCeti.SpectralZeta.RegularizedDet.ofZeta
def ofZeta := RegularizedDet
-- Declaration TauCeti.SpectralZeta.RegularizedDet.shifted
def shifted (f : ℝ → ℂ → ℂ) (v : ℝ) := ofZeta (f v)
-- Declaration TauCeti.SpectralZeta.RegularizedDet.scale
theorem scale (f : ℂ → ℂ) (c : ℝ) (hc : 0<c) (hf : DifferentiableAt ℂ f 0) :
  ofZeta (fun s => (c:ℂ)^(-s)*f s)=(c:ℂ)^(f 0)*ofZeta f := by sorry
-- TauCeti.SpectralZeta.RegularizedDet.test_one_eigenvalue
example (λ : ℝ) (hλ : 0<λ) : ofZeta (fun s => (λ:ℂ)^(-s))=λ := by sorry
-- TauCeti.SpectralZeta.RegularizedDet.test_empty_positive_spectrum
example : ofZeta (fun _ => 0)=1 := by sorry
-- TauCeti.SpectralZeta.RegularizedDet.test_two_eigenvalues
example (a b : ℝ) (ha : 0<a) (hb : 0<b) :
  ofZeta (fun s => (a:ℂ)^(-s)+(b:ℂ)^(-s))=(a*b:ℝ) := by sorry
end RegularizedDet
end TauCeti.SpectralZeta

namespace TauCeti.BostConnes
namespace Completed
-- Declaration TauCeti.BostConnes.Completed.Coset
abbrev Coset := axbRat ⧸ (axbInt.subgroupOf axbRat)
-- Declaration TauCeti.BostConnes.Completed.Space
abbrev Space := lp (fun _ : Coset => ℂ) 2
-- Declaration TauCeti.BostConnes.Completed.leftRegular
def leftRegular : BCHecke ℂ →ₐ[ℂ] (Space →L[ℂ] Space) := sorry
-- Declaration TauCeti.BostConnes.Completed.algebra
def algebra : StarSubalgebra ℂ (Space →L[ℂ] Space) :=
  (StarSubalgebra.adjoin ℂ (Set.range leftRegular)).topologicalClosure
-- Declaration TauCeti.BostConnes.Completed.embed
def embed : BCHecke ℂ →ₐ[ℂ] algebra := sorry
-- Declaration TauCeti.BostConnes.Completed.mu
def mu (n : ℕ+) : algebra := ((n:ℂ)^(- (1/2:ℂ))) • embed (BCHecke.x n)
-- Declaration TauCeti.BostConnes.Completed.dynamics
def dynamics (t : ℝ) : algebra ≃ₐ[ℂ] algebra := sorry
-- TauCeti.BostConnes.Completed.test_unit
example : embed 1=1 := by sorry
-- TauCeti.BostConnes.Completed.test_isometry
example (n : ℕ+) : _root_.star (mu n)*mu n=1 := by sorry
-- TauCeti.BostConnes.Completed.test_range_projection
example : mu 2*_root_.star (mu 2)=(1/2:ℂ) • (1+embed (BCHecke.e (1/2:ℚ))) ∧
  mu 2*_root_.star (mu 2)≠1 := by sorry
end Completed
-- Declaration TauCeti.BostConnes.CompletedKMS
def CompletedKMS (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) : Prop :=
  0<β ∧ φ 1=1 ∧ (∀ a, 0≤φ (_root_.star a*a)) ∧
  ∀ a b, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0≤z.im ∧ z.im≤β} ∧
    DifferentiableOn ℂ F {z | 0<z.im ∧ z.im<β} ∧
    (∃ M : ℝ, ∀ z, 0≤z.im → z.im≤β → ‖F z‖≤M) ∧
    (∀ t : ℝ, F t=φ (a*Completed.dynamics t b)) ∧
    (∀ t : ℝ, F (t+Complex.I*β)=φ (Completed.dynamics t b*a))
namespace CompletedKMS
-- Declaration TauCeti.BostConnes.CompletedKMS.state
def state (φ : Completed.algebra →L[ℂ] ℂ) : Prop := φ 1=1 ∧ ∀ a, 0≤φ (_root_.star a*a)
-- Declaration TauCeti.BostConnes.CompletedKMS.isKMS
def isKMS := CompletedKMS
-- Declaration TauCeti.BostConnes.CompletedKMS.restrict
theorem restrict (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) (h : isKMS β φ) :
  IsKMS β (φ.toLinearMap.comp Completed.embed.toLinearMap) := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_wrong_sign
example (β : ℝ) (hβ : 1<β) (u : AddAut QmodZ) :
  gibbsState β hβ u (BCHecke.x' 2*timeEvolution (-Complex.I*β) (BCHecke.x 2)) ≠
    gibbsState β hβ u (BCHecke.x 2*BCHecke.x' 2) := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_temperature_one
example : IsKMS 1 baseState := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_scaling_projection
example (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) (h : isKMS β φ) (n : ℕ+) :
  φ (Completed.mu n * _root_.star (Completed.mu n))=(n:ℂ)^(-(β:ℂ)) := by sorry
end CompletedKMS
-- Declaration TauCeti.BostConnes.KMSInfinity
def KMSInfinity (φ : Completed.algebra →L[ℂ] ℂ) : Prop :=
  CompletedKMS.state φ ∧ ∀ (s : Finset Completed.algebra) (ε : ℝ), 0<ε → ∀ B : ℝ,
    ∃ (β : ℝ) (ψ : Completed.algebra →L[ℂ] ℂ), B<β ∧ CompletedKMS β ψ ∧
      ∀ a∈s, ‖ψ a-φ a‖<ε
namespace KMSInfinity
-- Declaration TauCeti.BostConnes.KMSInfinity.isLimit
def isLimit := KMSInfinity
-- Declaration TauCeti.BostConnes.KMSInfinity.isGround
def isGround (φ : Completed.algebra →L[ℂ] ℂ) : Prop :=
  CompletedKMS.state φ ∧ ∀ a b, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0≤z.im} ∧ DifferentiableOn ℂ F {z | 0<z.im} ∧
    (∃ M : ℝ, ∀ z, 0≤z.im → ‖F z‖≤M) ∧
    ∀ t : ℝ, F t=φ (a*Completed.dynamics t b)
-- Declaration TauCeti.BostConnes.KMSInfinity.limit_isGround
theorem limit_isGround (φ : Completed.algebra →L[ℂ] ℂ) (h : isLimit φ) : isGround φ := by sorry
-- Declaration TauCeti.BostConnes.KMSInfinity.vectorState
def vectorState (u : AddAut QmodZ) : Completed.algebra →L[ℂ] ℂ := sorry
-- TauCeti.BostConnes.KMSInfinity.test_gibbs_limit
example (u : AddAut QmodZ) : isLimit (vectorState u) := by sorry
-- TauCeti.BostConnes.KMSInfinity.test_value_half
example (u : AddAut QmodZ) : vectorState u (Completed.embed (BCHecke.e (1/2:ℚ)))=-1 := by sorry
-- TauCeti.BostConnes.KMSInfinity.test_different_notions
example : ¬ isGround (0 : Completed.algebra →L[ℂ] ℂ) ∧
  ¬ isLimit (0 : Completed.algebra →L[ℂ] ℂ) := by sorry
end KMSInfinity

-- Declaration TauCeti.BostConnes.ArithmeticEisenstein
def ArithmeticEisenstein (a : QmodZ) : BCHecke ℚ := sorry
namespace ArithmeticEisenstein
-- Declaration TauCeti.BostConnes.ArithmeticEisenstein.first
def first := ArithmeticEisenstein
-- Declaration TauCeti.BostConnes.ArithmeticEisenstein.polynomial
def polynomial : ℕ → Polynomial ℚ
  | 0 => 0
  | 1 => Polynomial.X
  | n+2 => ((n+1:ℚ)⁻¹) • ((Polynomial.X^2-Polynomial.C (1/4)) *
      Polynomial.derivative (polynomial (n+1)))
-- Declaration TauCeti.BostConnes.ArithmeticEisenstein.higher
def higher (k : ℕ) (a : QmodZ) : BCHecke ℚ :=
  Polynomial.eval₂ (algebraMap ℚ (BCHecke ℚ)) (first a) (polynomial k)
-- Declaration TauCeti.BostConnes.ArithmeticEisenstein.finite_sum
theorem finite_sum (a : QmodZ) (N : ℕ) (hN : 0<N) (ha : N • a=0) :
  first a = ∑ k∈Finset.range N, if k=0 then 0 else
    ((k:ℚ)/(N:ℚ)-1/2) • BCHecke.e (k • a) := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_zero
example : first 0=0 ∧ higher 2 0=-1/4 := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_half
example : first (1/2:ℚ)=0 := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_third
example : first (1/3:ℚ)=(-1/6:ℚ) • BCHecke.e (1/3:ℚ)+(1/6:ℚ) • BCHecke.e (2/3:ℚ) := by sorry
end ArithmeticEisenstein
end TauCeti.BostConnes

/- Omitted signature interface: AnalyticNumberTheory:AN.9/kms-classification
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.kms_classification
Mathematical obligation: For bounded states on the C*-completion and β>0, (1) If β ≤ 1 there is exactly one KMS_β state; on e(a/b) with gcd(a, b) = 1 it takes the value b^{−β} ∏_{p | b} (1 − p^{β−1})/(1 − p^{−1}). (2) If β > 1 the extremal completed KMS_β states are exactly the Gibbs states φ_{β,u}, u ∈ Ẑ^× = Aut(ℚ/ℤ), these are pairwise distinct, and every KMS_β state is a barycentre of them. (3) The symmetries of B.9/symmetry-action act freely and transitively on the extremal completed KMS_β states for β > 1.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/odd-double-sum-absolute
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.odd_double_sum_absolute
Mathematical obligation: For Res>1 and Rew>1 the odd n,d double sum is absolutely convergent, locally uniformly on compact sub-tubes; hence it may be summed in either order.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/squarefree-square-decomposition
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.squarefree_square_decomposition
Mathematical obligation: Each odd d has a unique d=d0 d1² with d0 squarefree. In the initial tube, Z=ζ2(2s+2w−1)ζ2(2w)Σd0 odd squarefree L2(s,χd0ψ)ψ′(d0)/(d0^w L2(s+2w,χd0ψ)).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/quadratic-mean-bound-import
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.quadratic_mean_bound_import
Mathematical obligation: For every fixed vertical strip needed in (29), use the uniform quadratic L-first-moment estimate of Blomer (16), together with its conductor/parity-correct functional equation, to bound the squarefree-d0 sum. Its full source proof is a gap, not a consequence of bounded coefficients.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/double-R1-convergence
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.double_R1_convergence
Mathematical obligation: The pole-cleared squarefree expression is holomorphic on R1={Rew>1,Res+Rew>3/2}; its only possible polar line there is s=1, from the trivial inner twist.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/quadratic-reflection-equation
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.quadratic_reflection_equation
Mathematical obligation: The 16-vector continuation satisfies Z(s,w)=B(s)Z(1−s,s+w−1/2) as an equality of meromorphic germs.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.reflect_holomorphy_and_zero
Mathematical obligation: After removing singularities, B(s) is holomorphic for Res<1, has polynomial vertical growth in bounded real strips, and its first four-dimensional block has B1(0)=0.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/tube-overlap-gluing
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.tube_overlap_gluing
Mathematical obligation: R2=α(R1)∪R1; R3=β(R2)∪R2; R4=α(R3)∪R3. The functional equations agree on their nonempty open overlaps and the gluing leaves possible poles only at s=1,w=1,s+w=3/2.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/tube-hull-extension
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.tube_hull_extension
Mathematical obligation: The pole-cleared continuation outside the bounded real twelve-gon extends holomorphically through it by the bounded tube-domain argument cited in Blomer from DGH03 Propositions4.6–4.7. The extension and its growth are a recorded several-complex-variable proof interface.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/double-series-continuation
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.double_series_continuation
Mathematical obligation: For each pair of twists there is a continuation agreeing with the series in the initial tube such that (s−1)(w−1)(s+w−3/2)Z(s,w) is entire on C². In every bounded real strip it has polynomial growth in (1+|Ims|)(1+|Imw|). The two matrix functional equations hold as meromorphic identities; no scalar Euler product or multiple-zeta-value identification is asserted.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/pvs-local-zeta
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.LocalIntegral.shell_sum
Mathematical obligation: For supported integral Φ with an absolutely integrable shell expansion, its integral equals the weighted shell sum.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_orbit_to_coefficient
Mathematical obligation: ST.1 Delone–Faddeev and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general O_F, nonprincipal locally free modules are included by the full adelic orbit interface.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/local-density-coefficient-comparison
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.local_density_coefficient_comparison
Mathematical obligation: For a compact-open integral local condition U, the normalized binary-cubic Haar integral uses shell masses dk(U); its arithmetic coefficient condition is the ST-local orbit selector with the same discriminant valuation and inverse stabilizer convention. LD.3 specialization is invoked only for its proved residue-characteristic range; factors at2 and3 are kept separately.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-adelic-zeta
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.CubicAdelic
Mathematical obligation: With the ST binary-cubic representation and AA.2 quotient Haar measure, define Z(Φ,s)=∫GL2(A_F)/GL2(F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x) dg. Use the twisted action (g·f)(u,v)=det(g)^(−1)f((u,v)g), so Disc(g·f)=det(g)² Disc f. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted ξF,α times local zeta factors is a separate comparison and original-source gap. The theta sum is invariant under g↦gh for h∈GL2(F), by rational reindexing and the product formula. Transport AA.2 left-quotient measure by inversion; a left-quotient formulation instead uses Φ(g⁻¹·x) and |det g|^(−2s).
TauCeti.SeveralVariableZeta.CubicAdelic.integral
Mathematical obligation: The right-quotient integral on GL2(A_F)/GL2(F), with |det g|^(2s) and the nonzero-discriminant theta sum Φ(g·x).
TauCeti.SeveralVariableZeta.CubicAdelic.linear
Mathematical obligation: Z(aΦ+bΨ,s)=aZ(Φ,s)+bZ(Ψ,s) when the summands are integrable.
TauCeti.SeveralVariableZeta.CubicAdelic.unfolding
Mathematical obligation: Decompose by signatures and arithmetic orbit weights with the pinned local zeta factors.
TauCeti.SeveralVariableZeta.CubicAdelic.theta_right_invariant
Mathematical obligation: For h∈GL2(F), thetaΦ(gh)=thetaΦ(g), and the full integrand is right invariant by the product formula.
TauCeti.SeveralVariableZeta.CubicAdelic.test_zero
Mathematical obligation: Z(0,s)=0.
TauCeti.SeveralVariableZeta.CubicAdelic.test_scaling
Mathematical obligation: The discriminant character is det² for the chosen twisted action; this fixes the exponent2s.
TauCeti.SeveralVariableZeta.CubicAdelic.test_singular_locus
Mathematical obligation: Degenerate binary cubics are excluded from the theta sum and return only as separately analyzed singular terms after Poisson.
TauCeti.SeveralVariableZeta.CubicAdelic.test_quotient_side
Mathematical obligation: Right rational translation leaves the theta integrand unchanged; inversion transports it to the left quotient with inverse action and determinant exponent −2s.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-absolute-convergence
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_absolute_convergence
Mathematical obligation: Every ξF,α(s) and dual series converges absolutely on Res>1.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-global-functional-equation
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_global_functional_equation
Mathematical obligation: Write n=[F:Q], D=|Disc F|. Then ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s). This is the exact global theorem of LOWW Proposition3.7(3), with the original Poisson/local source proof still a recorded gap.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_residues_and_entire_clearance
Mathematical obligation: Let ρF=Res_s=1 ζF(s), rα the number of split real cubic factors, n=r1+2r2. Set AF=ζF(2)ρF/2^(r1+r2+1), BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n. ξF,α has at most simple poles1 and5/6, with residues AF(1+3^(−rα−r2)) and BF 3^(−rα/2). Its product with (s−1)(s−5/6) is entire of order1.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.arch_entry_vanishing_at_one
Mathematical obligation: Every cαβ(s) vanishes to order at least n=r1+2r2 at s=1; each real factor has order≥1 and each complex factor has order2.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/gamma-unit-at-one
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.gamma_unit_at_one
Mathematical obligation: The gamma/discriminant prefactor in the cubic functional equation is holomorphic and nonzero at s=1, since its gamma arguments are1,5/6 and7/6.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-zero-at-origin
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_zero_at_origin
Mathematical obligation: For n≥2, ξF,α(0)=0. More precisely the functional equation gives vanishing order at least n−1 at0, since each dual series has at most a simple pole at1.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-orders-generating-series
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_orders_generating_series
Mathematical obligation: For an étale cubic F-algebra A, let an(A) count O_F-orders in O_A of relative index norm n. Then Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s) in a right half-plane. The exponent2s encodes discriminant multiplication by index².
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_reducible_and_field_coefficient_bound
Mathematical obligation: For every ε>0 and real σ>3/2, ξF,α(σ)≪[F:Q],σ,ε D^(1/2+ε)h2(F). Prove the separate split/quadratic-factor and cubic-field contributions using LOWW Lemma3.5 and the orders formula; the field-count input remains with ST.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-reflected-bound
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_reflected_bound
Mathematical obligation: For σ<−1/2 and |t|≥1, the functional equation gives ξF,α(σ+it)≪ε,n,σ h2(F)D^(5/2−4σ+ε)(1+|t|)^(n(2−4σ)+ε), using the right-half-plane dual bound. Constants depend on the fixed real strip.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SeveralVariableZeta.cubic_pole_cleared_convexity
Mathematical obligation: For −1/2≤σ≤3/2, |t|≥1 and ε>0, ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε). Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at s=1 and5/6; the accepted LOWW erratum route already records that restriction.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.compact_spectrum_and_weyl
Mathematical obligation: AS.4 supplies a complete orthonormal scalar eigenbasis with finite multiplicities and Weyl counting N(Λ)~area(X)Λ/(4π). Connectedness gives the simple zero eigenvalue.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.heat_mellin_on_right_half_plane
Mathematical obligation: For Res>1, ζΔ(s)=Γ(s)^(−1)∫0∞(H(t)−1)t^(s−1)dt.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/heat-small-time-subtraction
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.heat_small_time_subtraction
Mathematical obligation: Write H(t)=Σj≥0 exp(−tλj), including its simple zero mode. The positive spectral Mellin integral uses H(t)−1. If H(t)=Σk=0..N ak t^(k−1)+O(t^N), then subtract Σk=0..N ak t^(k−1)−1. Its integral on (0,1) is Σk=0..N ak/(s+k−1)−1/s. The remainder integral is holomorphic for Re s>−N under locally uniform remainder bounds; thus the coefficient at s=0 is a1−1, not a1.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/spectral-regularity-zero
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.spectral_regularity_zero
Mathematical obligation: The positive spectral zeta continues meromorphically, and is analytic at0 because Γ(s)^(−1) has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/selberg-log-product
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.selberg_log_product
Mathematical obligation: For Res>1, expand log(1−e^(−(s+k)ℓp)) and sum k geometrically. This gives Z′/Z=Σp,m≥1 ℓp e^(−msℓp)/(1−e^(−mℓp)), locally uniformly.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/scalar-heat-trace-formula
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.scalar_heat_trace_formula
Mathematical obligation: For t>0, H(t)=area(X)/(4π)∫R r tanh(πr)e^(−t(r²+1/4))dr +Σp,m≥1 ℓp/[2sinh(mℓp/2)] · e^(−t/4−(mℓp)²/(4t))/√(4πt). Class multiplicities agree with the primitive list fixed above. There are no cusp, elliptic or continuous-spectrum terms in this selected compact torsion-free case.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.hyperbolic_laplace_mellin
Mathematical obligation: For real s>1, the Laplace–Mellin transform of the hyperbolic heat contribution in the shifted determinant has derivative at Mellin exponent0 equal to−log ZΓ(s). This is the scalar specialization of JSS Proposition5.4; the exact integral proof remains a source-refinement gap.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/identity-barnes-transform
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.identity_barnes_transform
Mathematical obligation: Let C=area(X)/(4π)=g−1. The scalar identity factor is I_g(s)=exp(2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)]), where G is the classical Barnes G-function normalized by G(1)=1, G(s+1)=Γ(s)G(s) and the source asymptotic expansion. The full normalization/asymptotic input is required; recurrence alone is insufficient.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/selberg-determinant-comparison
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.selberg_determinant_comparison
Mathematical obligation: For the selected scalar compact surface, det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)]) for real s>1, extended by the proved analytic continuation. Thus det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1)). The sign is the corrected v2 sign; source v1(1.3) has the opposite Euler-characteristic sign.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/selberg-functional-equation
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.selberg_functional_equation
Mathematical obligation: With D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)]), the continued scalar Selberg function satisfies ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s) as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real s>1 and avoids an unnormalized path integral.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.SpectralZeta.selberg_spectral_zero_comparison
Mathematical obligation: The spectral zeros occur at both solutions of s(1−s)=λj, with multiplicities determined by the determinant comparison and the identity factor. For λj≥1/4 they lie on Res=1/2; for 0<λj<1/4 they are real in(0,1). The zero mode gives s=0,1. Identity-factor trivial zeros are separated before calling zeros spectral; no Riemann RH consequence follows.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-normal-form-product
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_normal_form_product
Mathematical obligation: The span of μn eγ μm* with gcd(n,m)=1 is star-closed and product-closed: first cancel q=gcd(m1,n2) using μm1* μn2=μn2/q μm1/q*, then move e terms across the shifts and use the finite preimage average to reduce any remaining gcd.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-normal-form-independent
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_normal_form_independent
Mathematical obligation: For coprime n,m, the normal form μn eγ μm*=(nm)^(−1/2)[class(1,γ/m;0,n/m)]. The parameterγ modZ gives a bijection onto the double cosets of fixed n/m; hence these normal forms are linearly independent.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-convolution-norm-bound
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_convolution_norm_bound
Mathematical obligation: Each finite-support Hecke element acts boundedly on the right-coset l² carrier by a finite sum of finite-degree correspondences; operator adjoint matches the Hecke involution and the action on the base vector detects each coefficient.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-real-dynamics-extension
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_real_dynamics_extension
Mathematical obligation: The real σt are isometric star automorphisms in the left representation and extend to a point-norm-continuous automorphism group on C_Q. The complex σz is retained only on the entire dense Hecke algebra.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-bounded-state-extension
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_bounded_state_extension
Mathematical obligation: A normalized positive functional on the presented Hecke star algebra has a GNS representation in which the μn are isometries and eγ are unitaries. The universal norm bound and universal=reduced comparison imply continuity and a unique positive extension to C_Q.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_analytic_core_strip_equivalence
Mathematical obligation: For a bounded completed state and β>0, the algebraic boundary identity on the entire Hecke core is equivalent to the completed bounded strip condition.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.ScalingMeasure
Mathematical obligation: For β>0, let μβ,p on Qp have μβ,p(Zp)=1 and density (1−p^(−β))/(1−p^(−1))·|x|p^(β−1) relative to additive Haar measure with vol(Zp)=1. Form the normalized restricted-product measure μβ on A_Q,f. It obeys μβ(q^(−1)E)=q^β μβ(E) for positive rational q. The local expression is interpreted almost everywhere away from0; it is not evaluated as0^negative at the point0.
TauCeti.BostConnes.ScalingMeasure.local
Mathematical obligation: The displayed p-adic density with normalized Haar measure.
TauCeti.BostConnes.ScalingMeasure.adelic
Mathematical obligation: The restricted-product measure with μβ(Ẑ)=1.
TauCeti.BostConnes.ScalingMeasure.scale
Mathematical obligation: μβ(q^(−1)E)=q^β μβ(E).
TauCeti.BostConnes.ScalingMeasure.test_beta_one
Mathematical obligation: Atβ=1 the local measures and restricted product are additive Haar.
TauCeti.BostConnes.ScalingMeasure.test_valuation_shell
Mathematical obligation: μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ) for k≥0.
TauCeti.BostConnes.ScalingMeasure.test_units_mass
Mathematical obligation: μβ,p(Zp×)=1−p^(−β).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_kms_scaling_correspondence
Mathematical obligation: Restriction to C(Ẑ) identifies completed KMSβ states with normalized measures on the finite adeles satisfying rational scaling. Off-diagonal dilation components vanish by invariance, and the KMS relation gives μ(nẐ)=n^(−β).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-finite-prime-projection
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_finite_prime_projection
Mathematical obligation: For a finite prime set A, NA is its generated multiplicative monoid and WA={x∈Ẑ:xp∈Zp× for p∈A}. On WA the projection to NA-invariant functions is PAf(x)=ζA(β)^(−1)Σn∈NA n^(−β)f(nx), extended along NA-orbits, where ζA(β)=∏p∈A(1−p^(−β))^(−1).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-local-character-density
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_local_character_density
Mathematical obligation: Functions depending on finitely many p-adic coordinates and valuation shells, with characters of local unit quotients, span a dense subspace of L²(Ẑ,μβ).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_nontrivial_character_projection
Mathematical obligation: For0<β≤1 and a nontrivial local unit characterχ, the increasing-prime projections P_Aχ tend to0: their product coefficients contain factors (1−p^(−β))/(1−χ(p)p^(−β)), and divergence of the prime reciprocal sum in a suitable character sector forces the product to0.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-critical-ergodicity
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_critical_ergodicity
Mathematical obligation: For0<β≤1 the Q+× action on(A_Q,f,μβ) is ergodic: every invariant L² function on the compact integral slice is constant, and rational dilates cover the finite adeles.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_low_temperature_uniqueness
Mathematical obligation: For0<β≤1 the completed Bost–Connes system has a unique KMSβ state. On e(a/b), with gcd(a,b)=1, its value is b^(−β)∏p|b(1−p^(β−1))/(1−p^(−1)).
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_high_beta_unit_orbits
Mathematical obligation: Forβ>1, the disjoint sets nẐ× cover a μβ-full subset ofẐ, and μβ(Ẑ×)=∏p(1−p^(−β))=ζ(β)^(−1). Every scaling measure is reconstructed from a probability measure onẐ× by the weighted orbit sums.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-high-beta-barycentres
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_high_beta_barycentres
Mathematical obligation: Forβ>1 the KMS simplex is affinely identified with probability measures onẐ×; its extreme points are the Dirac-unit Gibbs states. The unit symmetries act freely transitively on those extreme points.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-prime-pair-ratio
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_prime_pair_ratio
Mathematical obligation: For0<β≤1, λ>1 and ε>0 there are disjoint prime pairs(pn,qn) with |(qn/pn)^β−λ|<ε and Σn qn^(−β)=∞.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_valuation_tail_ratio
Mathematical obligation: For the product of geometric valuation probabilities νβ,p(k)=(1−p^(−β))p^(−kβ), the cylinder change(0,1)↦(1,0) at a disjoint prime pair(p,q) has exact mass ratio(q/p)^β. The cylinder masses sum divergently over the prescribed prime pairs.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_full_positive_ratio_set
Mathematical obligation: The valuation tail equivalence relation has allλ>0 in its ratio set: disjoint cylinder swaps give the asymptotic ratio criterion forλ>1, and inversion/closure give the remaining positiveλ.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-type-three-one
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_type_three_one
Mathematical obligation: For0<β≤1 the GNS von Neumann algebra of the unique completed KMSβ state is a factor of type III₁. In particular this proves the requiredβ=1 type statement. Lift the valuation quotient ratio computation through the compact unit action and the full-corner crossed-product description.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_eisenstein_mobius_divisibility
Mathematical obligation: For fn(j)=Σd|j μ(d)(j/d)^n, the projection sum Σd|N fn(d)πd evaluates on a Q-lattice to m^n, where m is the order of its N-torsion kernel. Keep n=1 and n=1−k, including negative exponents.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-eisenstein-division
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_eisenstein_division
Mathematical obligation: For k≥1, ΣNa=0 ek,a=γk Σd|N[(2^k−2)f1(d)+N^k f1−k(d)]πd, with γk=(2πi)^(−k)Σy∈Z\{0} y^(−k) in the source normalization (symmetric principal value for k=1; absolute convergence for k>1). For odd k the vanishing is interpreted consistently. Both the arithmetic coefficients and the degenerate-value convention are fixed by the preceding identities.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_eisenstein_prime_projections
Mathematical obligation: All projections πp^b belong to the Q-algebra generated by e1,a. For odd p, solve the k=2 division relation inductively in b. For p=2 the leading π2^b coefficient vanishes, so use the relation at N=2^(b+1) to recover π2^b; e.g. π2=3+2Σ4a=0 e2,a.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_eisenstein_roots_recovery
Mathematical obligation: The rational algebra generated by e1,a contains every e(a). At each prime-power level use the projection1−πp, the power sums of z(j)=(1−πp)e1,j/N and Newton identities; resolve the primitive-root Cayley transform, then add the lower-level πp component inductively.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_arithmetic_algebra_generation
Mathematical obligation: The e1,a generate Q[Q/Z]. Together with μn,μn* they generate the arithmetic algebra A1,Q; complexification gives the dense complex algebra. This is BC’s normalized rational form and is compared to the Q-valued Hecke form only through σ−i/2, which is not a star map.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_gibbs_tail_limit
Mathematical obligation: For β→∞ the Gibbs states converge weakly to the ε1 vector state, uniformly on each fixed norm-bounded observable set: the difference is at most2||a||(ζ(β)−1)/ζ(β), which tends to0. This supplies completed KMS∞ states.
-/

/- Omitted signature interface: AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry
Reason: The exact canonical carrier or full theorem hypotheses require the recorded source/supplier refinements. The reader states the mathematical obligation; no proposition hole substitutes for it.
TauCeti.BostConnes.bc_arithmetic_values_and_symmetry
Mathematical obligation: For an extremal KMS∞ vector state, e(a) evaluates to the corresponding root of unity and every reduced normal-form monomial with(n,m)≠(1,1) evaluates to0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.
-/

/- Review-added omitted signature: TauCeti.SeveralVariableZeta.cubic_dual_simple_poles
For each number field F and archimedean signature α, the dual ξhatF,α has a meromorphic continuation with no poles except possible simple poles at 1 and 5/6. In particular (s−1)ξhatF,α(s) is holomorphic near 1.
Canonical number-field continuation carrier remains a supplier gap. -/
