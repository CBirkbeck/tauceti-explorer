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
import Mathlib.Algebra.Star.Subalgebra
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.CStarAlgebra.ContinuousLinearMap
import Mathlib.Topology.Algebra.StarSubalgebra
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Analysis.CStarAlgebra.CStarMatrix
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.Regular
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import TauCeti.NumberTheory.HeckeRing.Basic
import TauCeti.NumberTheory.HeckeRing.Multiplication
import TauCeti.NumberTheory.HeckeRing.Associativity

/-!
# Analytic number theory AN.8–AN.9 — suggested declarations

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, with the shared prebuilt Tau Ceti modules). Elaboration checks
the signatures, not the proposed mathematical proofs.

The signatures cover both scoped stages. Imported carriers are used directly, or are
parameters with precise adapter hypotheses when their owner has not yet supplied a module. The Bost–Connes algebra is Tau Ceti's
Hecke ring `𝕋 P⁺_ℚ P⁺_ℤ K` of the ax+b pair inside `GL₂(ℚ)`. Its rational generators are the
double cosets `x n = [X_n]`, `x' n = [X_n⁻¹]` and `e γ`; Bost–Connes' `μ_n` is `n^{-1/2} • x n`
over `ℂ`. `ℚ/ℤ` is `AddCircle (1 : ℚ)`. Symmetry prototypes use `AddAut (ℚ/ℤ)`;
the canonical comparison with the imported profinite unit group is a separate adapter.
-/

noncomputable section

open Matrix Complex HeckeCosetModule
open scoped HeckeCosetModule ComplexOrder ENNReal

namespace TauCeti.CStarDynamics
variable {A : Type*} [NormedRing A] [NormedAlgebra ℂ A] [StarRing A]

def IsState (φ : A →L[ℂ] ℂ) : Prop :=
  φ 1 = 1 ∧ ∀ a, 0 ≤ φ (Star.star a * a)

def IsKMS (σ : ℝ → A ≃ₐ[ℂ] A) (β : ℝ) (φ : A →L[ℂ] ℂ) : Prop :=
  0 < β ∧ IsState φ ∧ ∀ a b, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ β} ∧
    DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < β} ∧
    (∃ M : ℝ, ∀ z, 0 ≤ z.im → z.im ≤ β → ‖F z‖ ≤ M) ∧
    (∀ t : ℝ, F t = φ (a * σ t b)) ∧
    (∀ t : ℝ, F (t + Complex.I * β) = φ (σ t b * a))

def IsGround (σ : ℝ → A ≃ₐ[ℂ] A) (φ : A →L[ℂ] ℂ) : Prop :=
  IsState φ ∧ ∀ a b, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0 ≤ z.im} ∧
    DifferentiableOn ℂ F {z | 0 < z.im} ∧
    (∃ M : ℝ, ∀ z, 0 ≤ z.im → ‖F z‖ ≤ M) ∧
    ∀ t : ℝ, F t = φ (a * σ t b)

def IsKMSInfinity (σ : ℝ → A ≃ₐ[ℂ] A) (φ : A →L[ℂ] ℂ) : Prop :=
  IsState φ ∧ ∀ (s : Finset A) (ε : ℝ), 0 < ε → ∀ B : ℝ,
    ∃ (β : ℝ) (ψ : A →L[ℂ] ℂ), B < β ∧ IsKMS σ β ψ ∧
      ∀ a ∈ s, ‖ψ a - φ a‖ < ε

theorem trivial_ground (φ : A →L[ℂ] ℂ) (h : IsState φ) :
    IsGround (fun _ => AlgEquiv.refl) φ := by sorry

theorem trivial_kms_iff_trace (β : ℝ) (hβ : 0 < β) (φ : A →L[ℂ] ℂ) :
    IsKMS (fun _ => AlgEquiv.refl) β φ ↔
      IsState φ ∧ ∀ a b, φ (a * b) = φ (b * a) := by sorry

theorem trivial_kmsInfinity_is_trace (φ : A →L[ℂ] ℂ)
    (h : IsKMSInfinity (fun _ => AlgEquiv.refl) φ) (a b : A) :
    φ (a * b) = φ (b * a) := by sorry

abbrev MatrixTwo := CStarMatrix (Fin 2) (Fin 2) ℂ

/-- Evaluation in the unit vector at the first matrix coordinate. -/
def matrixVectorState : MatrixTwo →L[ℂ] ℂ := sorry
theorem matrixVectorState_apply (a : MatrixTwo) : matrixVectorState a = a 0 0 := by sorry

def matrixUnit (i j : Fin 2) : MatrixTwo :=
  CStarMatrix.ofMatrix (fun k l => if k = i ∧ l = j then 1 else 0)

-- The same two predicates are tested on the same C*-system.
-- TauCeti.BostConnes.KMSInfinity.test_different_notions
example : IsGround (fun _ => AlgEquiv.refl) matrixVectorState ∧
    ¬ IsKMSInfinity (fun _ => AlgEquiv.refl) matrixVectorState := by sorry
example : matrixVectorState (matrixUnit 0 1 * matrixUnit 1 0) = 1 ∧
    matrixVectorState (matrixUnit 1 0 * matrixUnit 0 1) = 0 := by sorry
example : IsState matrixVectorState := by sorry
end TauCeti.CStarDynamics


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
theorem star_x (n : ℕ+) : Star.star (x n : BCHecke ℂ) = x' n := by sorry

-- Declaration TauCeti.BostConnes.BCHecke.star_e
theorem star_e (γ : QmodZ) : Star.star (e γ : BCHecke ℂ) = e (-γ) := by sorry

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
    timeEvolution t (Star.star f) = Star.star (timeEvolution t f) := by sorry

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
    regularRep u (Star.star f) = ContinuousLinearMap.adjoint (regularRep u f) := by sorry

/-- `e^{-βH}`, the diagonal operator `ε_k ↦ k^{-β} ε_k`. -/
-- Declaration TauCeti.BostConnes.hamiltonianExp
def hamiltonianExp (β : ℝ) (hβ : 0 < β) : L2 →L[ℂ] L2 := sorry

theorem hamiltonianExp_apply (β : ℝ) (hβ : 0 < β) (k : ℕ+) :
    hamiltonianExp β hβ (lp.single 2 k 1) =
      ((k:ℂ)^(-(β:ℂ))) • lp.single 2 k 1 := by sorry
theorem hamiltonianExp_norm (β : ℝ) (hβ : 0 < β) : ‖hamiltonianExp β hβ‖ = 1 := by sorry
theorem hamiltonianExp_add (β γ : ℝ) (hβ : 0 < β) (hγ : 0 < γ) :
    hamiltonianExp (β+γ) (by linarith) =
      (hamiltonianExp β hβ).comp (hamiltonianExp γ hγ) := by sorry
-- TauCeti.BostConnes.hamiltonianExp_test_one
example (β : ℝ) (hβ : 0 < β) :
    hamiltonianExp β hβ (lp.single 2 1 1) = lp.single 2 1 1 := by sorry
-- TauCeti.BostConnes.hamiltonianExp_test_two
example : hamiltonianExp 1 (by norm_num) (lp.single 2 2 1) =
    (1/2:ℂ) • lp.single 2 2 1 := by sorry
-- TauCeti.BostConnes.hamiltonianExp_test_positive
example (β : ℝ) (hβ : 0 < β) (v : L2) :
    0 ≤ inner ℂ v (hamiltonianExp β hβ v) := by sorry

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
    0 ≤ gibbsState β hβ u (Star.star f * f) := by sorry

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
  0 < β ∧ φ 1 = 1 ∧ (∀ f, 0 ≤ φ (Star.star f * f)) ∧ ∀ f g, φ (f * timeEvolution (I * β) g) = φ (g * f)

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

theorem baseState_apply (f : BCHecke ℂ) : baseState f =
    f (HeckeCoset.mk axbInt axbInt ⟨(1:axbRat), (1:axbRat).2⟩) := by sorry
theorem baseState_positive (f : BCHecke ℂ) : 0 ≤ baseState (Star.star f*f) := by sorry
theorem baseState_e (γ : QmodZ) : baseState (e γ) = if γ=0 then 1 else 0 := by sorry
-- TauCeti.BostConnes.baseState_test_one
example : baseState 1 = 1 := by sorry
-- TauCeti.BostConnes.baseState_test_half
example : baseState (e (1/2:ℚ)) = 0 := by sorry
-- TauCeti.BostConnes.baseState_test_projection
example : baseState (x 2*x' 2) = 1 := by sorry

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
    (symmetry (v + w) : BCHecke K ≃ₐ[K] BCHecke K) = (symmetry w).trans (symmetry v) := by sorry

end Symmetry

/-- Pullback on the native Hecke module, avoiding competing algebra-module instances. -/
def symmetryLinear (v : AddAut QmodZ) : BCHecke ℂ →ₗ[ℂ] BCHecke ℂ where
  toFun := symmetry v
  map_add' := sorry
  map_smul' := sorry

-- Declaration TauCeti.BostConnes.IsKMS.comp_symmetry
theorem IsKMS.comp_symmetry {β : ℝ} {φ : BCHecke ℂ →ₗ[ℂ] ℂ} (h : IsKMS β φ) (v : AddAut QmodZ) :
    IsKMS β (φ ∘ₗ symmetryLinear v) := by sorry

-- Declaration TauCeti.BostConnes.symmetry_timeEvolution
theorem symmetry_timeEvolution (v : AddAut QmodZ) (z : ℂ) (f : BCHecke ℂ) :
    symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f) := by sorry

-- Test TauCeti.BostConnes.symmetry_neg_e
example (γ : QmodZ) : symmetry (AddEquiv.neg QmodZ) (e γ : BCHecke ℚ) = e (-γ) := by
  sorry

-- Test TauCeti.BostConnes.symmetry_one
example : (symmetry 0 : BCHecke ℚ ≃ₐ[ℚ] BCHecke ℚ) = AlgEquiv.refl := by sorry

-- Test TauCeti.BostConnes.symmetry_gibbs
example (β : ℝ) (hβ : 1 < β) (u v : AddAut QmodZ) :
    gibbsState β hβ u ∘ₗ symmetryLinear v =
      gibbsState β hβ (u + v) := by sorry

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
continuations are separate data-valued constructions. -/

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
theorem unit_table : (fun i j : Fin 4 => value i (2*j.val+1)) =
    !![(1 : ℂ), 1, 1, 1; 1, -1, 1, -1; 1, -1, -1, 1; 1, 1, -1, -1] := by sorry
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
def polarPolynomial (z : ℂ × ℂ) : ℂ := (z.1-1)*(z.2-1)*(z.1+z.2-3/2)
/-- The entire cleared function; its values on the polar set retain residue data. -/
def cleared (i j : Characters8) : ℂ × ℂ → ℂ := sorry
/-- Only values away from the polar set represent the meromorphic continuation. -/
def continued (i j : Characters8) (z : ℂ × ℂ) : ℂ := cleared i j z / polarPolynomial z
theorem cleared_agrees (i j : Characters8) (s w : ℂ) (hs : 1<s.re) (hw : 1<w.re) :
    cleared i j (s,w) = polarPolynomial (s,w) * series i j s w := by sorry
theorem cleared_entire (i j : Characters8) :
    AnalyticOnNhd ℂ (cleared i j) Set.univ := by sorry
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
  if 2 ≤ i.val then 8 else if (i.val=0 ∧ a.val%2=0) ∨ (i.val=1 ∧ a.val%2=1) then 1 else 4
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.parity
def parity (i : Fin 4) : ℂ := if i.val%2=0 then 0 else 1
-- Declaration TauCeti.SeveralVariableZeta.FunctionalSystem.twoValue
def twoValue (i a : Fin 4) : ℂ :=
  if q i a = 1 then if a.val=0 ∨ a.val=3 then 1 else -1 else 0
/-- The three primitive-character invariants used by one residue block. -/
structure PrimitiveTwistData where
  conductorFactor : ℂ
  characterParity : ℂ
  valueAtTwo : ℂ
def primitiveTwistData (i a : Fin 4) : PrimitiveTwistData :=
  ⟨q i a, parity i, twoValue i a⟩
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
theorem swap_apply (s w : ℂ) : swap (s,w) = (w,s) := by sorry
theorem swap_involution (z : ℂ × ℂ) : swap (swap z) = z := by sorry
theorem swap_fixed (z : ℂ × ℂ) : swap z = z ↔ z.1 = z.2 := by sorry
theorem reflect_apply (s w : ℂ) : reflect (s,w) = (1-s,s+w-1/2) := by sorry
theorem reflect_involution (z : ℂ × ℂ) : reflect (reflect z) = z := by sorry
theorem reflect_fixed (z : ℂ × ℂ) : reflect z = z ↔ z.1 = 1/2 := by sorry
theorem A_entry (ij kl : Fin 4 × Fin 4) : A ij kl = (1/16:ℂ)*
    ∑ a : Fin 4, ∑ b : Fin 4,
      Characters8.value ij.1 (2*b.val+1)*Characters8.value ij.2 (2*a.val+1)*
      Characters8.value kl.1 (2*a.val+1)*Characters8.value kl.2 (2*b.val+1)*
      (-1:ℂ)^(a.val*b.val) := by sorry
theorem A_involution : A*A = 1 := by sorry
theorem A_symmetric : Matrix.transpose A = A := by sorry
theorem B_cross_block (s : ℂ) (i j k l : Fin 4) (h : i ≠ k) :
    B s (i,j) (k,l) = 0 := by sorry
theorem B_analytic_left (ij kl : Fin 4 × Fin 4) :
    AnalyticOnNhd ℂ (fun s => B s ij kl) {s : ℂ | s.re < 1} := by sorry
theorem localRatio_analytic (i a : Fin 4) :
    AnalyticOnNhd ℂ (localRatio i a) {s : ℂ | s.re < 1} := by sorry
theorem localRatio_formula (i a : Fin 4) (s : ℂ) : localRatio i a s =
    (q i a/(Real.pi:ℂ))^(1/2-s)*Complex.Gamma ((1-s+parity i)/2)/
      Complex.Gamma ((s+parity i)/2)*(1-twoValue i a*(2:ℂ)^(-s))/
      (1-twoValue i a*(2:ℂ)^(s-1)) := by sorry
theorem localRatio_twist_two (a : Fin 4) (s : ℂ) : localRatio 2 a s =
    ((Real.pi:ℂ)/8)^(s-1/2)*Complex.Gamma ((1-s)/2)/Complex.Gamma (s/2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_principal
example : A (0,0) (0,0) = 1/2 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_signed
example : A (0,0) (1,1) = -1/2 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_origin
example : swap (0,0) = (0,0) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_pair
example : swap (2,3) = (3,2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_fixed
example (s : ℂ) : swap (s,s) = (s,s) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_origin
example : reflect (0,0) = (1,-1/2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_pair
example : reflect (2,3) = (-1,9/2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_fixed
example (w : ℂ) : reflect (1/2,w) = (1/2,w) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_conductor_principal
example : q 0 0 = 1 ∧ q 0 1 = 4 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_conductor_eight
example (a : Fin 4) : q 2 a = 8 ∧ q 3 a = 8 ∧ parity 2 = 0 ∧ parity 3 = 1 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_two_values
example (a : Fin 4) : twoValue 0 0 = 1 ∧ twoValue 1 1 = -1 ∧ twoValue 2 a = 0 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_even_zero
example (a : Fin 4) : localRatio 0 a 0 = 0 ∧ localRatio 2 a 0 = 0 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_eight_even
example (a : Fin 4) (s : ℂ) : localRatio 2 a s =
    ((Real.pi:ℂ)/8)^(s-1/2)*Complex.Gamma ((1-s)/2)/Complex.Gamma (s/2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_eight_odd
example (a : Fin 4) (s : ℂ) : localRatio 3 a s =
    ((Real.pi:ℂ)/8)^(s-1/2)*Complex.Gamma ((2-s)/2)/Complex.Gamma ((s+1)/2) := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_B_principal_zero
example (j k : Fin 4) : B 0 (0,j) (0,k) = 0 := by sorry
-- TauCeti.SeveralVariableZeta.FunctionalSystem.test_B_odd_zero
example : B 0 (1,0) (1,0) = 4/(3*(Real.pi:ℂ)) := by sorry
end FunctionalSystem

-- Declaration TauCeti.SeveralVariableZeta.double_series_pole_clear_entire
theorem double_series_pole_clear_entire (i j : Fin 4) :
  AnalyticOnNhd ℂ (DoubleSeries.cleared i j) Set.univ := by sorry
-- Declaration TauCeti.SeveralVariableZeta.reciprocity_swap_equation
theorem reciprocity_swap_equation (z : ℂ × ℂ)
    (hz : DoubleSeries.polarPolynomial z ≠ 0) :
  (fun ij : Fin 4 × Fin 4 => DoubleSeries.continued ij.1 ij.2 z) =
    Matrix.mulVec FunctionalSystem.A (fun ij => DoubleSeries.continued ij.1 ij.2 (z.2,z.1)) := by sorry

-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral
def LocalIntegral {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
    (disc : V → K) (absValue : K → ℝ) (Φ : V → ℂ) (s : ℂ) : ℂ :=
  ∫ x in {x | disc x ≠ 0}, Φ x * (absValue (disc x) : ℂ)^s ∂μ
namespace LocalIntegral
-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral.integral
def integral := @LocalIntegral
-- Declaration TauCeti.SeveralVariableZeta.LocalIntegral.shellDensity
def shellDensity {V K : Type*} [MeasurableSpace V] [Zero K] (μ : MeasureTheory.Measure V)
    (disc : V → K) (valuation : V → ℕ) (U : Set V) (k : ℕ) : ENNReal :=
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
example (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)] [BorelSpace (Padic p)]
    (μ : MeasureTheory.Measure (Padic p)) [MeasureTheory.Measure.IsAddHaarMeasure μ]
    (hnorm : μ {x | ‖x‖ ≤ 1} = 1) (s : ℂ) (hs : -1 < s.re) :
    LocalIntegral μ (fun x : Padic p => x) norm
      (fun x => if ‖x‖ ≤ 1 then 1 else 0) s =
        (1-(p:ℂ)^(-1:ℂ))/(1-(p:ℂ)^(-s-1)) := by sorry
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

/- The canonical quotient kernel comes from AL.0, AA.2 and ST.1. This constructor
uses its actual descended theta function and determinant norm. The canonical adapter
must prove theta_right_invariant before providing those functions on the quotient. -/
def CubicAdelic {Q : Type*} [MeasurableSpace Q] (μ : MeasureTheory.Measure Q)
    (detNorm : Q → ℝ) (theta : Q → ℂ) (s : ℂ) : ℂ :=
  ∫ g, (detNorm g : ℂ)^(2*s)*theta g ∂μ
namespace CubicAdelic
 def integral := @CubicAdelic
 theorem linear {Q : Type*} [MeasurableSpace Q] (μ : MeasureTheory.Measure Q)
    (d : Q → ℝ) (theta eta : Q → ℂ) (s a b : ℂ)
    (ht : MeasureTheory.Integrable (fun g => (d g:ℂ)^(2*s)*theta g) μ)
    (he : MeasureTheory.Integrable (fun g => (d g:ℂ)^(2*s)*eta g) μ) :
    integral μ d (fun g => a*theta g+b*eta g) s =
      a*integral μ d theta s+b*integral μ d eta s := by sorry
 theorem theta_right_invariant {G ι : Type*} [Group G] (thetaTerm : G → ι → ℂ)
    (g h : G) (reindex : ι ≃ ι) (hr : ∀ x, thetaTerm (g*h) x = thetaTerm g (reindex x)) :
    (∑' x, thetaTerm (g*h) x) = ∑' x, thetaTerm g x := by sorry
 theorem inversion_kernel {G : Type*} [Group G] (d : G → ℝ) (theta : G → ℂ)
    (g : G) (s : ℂ) (hd : 0 < d g) (hi : d (g⁻¹) = (d g)⁻¹) :
    (d (g⁻¹):ℂ)^(2*s)*theta (g⁻¹) = (d g:ℂ)^(-2*s)*theta (g⁻¹) := by sorry
 -- TauCeti.SeveralVariableZeta.CubicAdelic.test_zero
 example {Q : Type*} [MeasurableSpace Q] (μ : MeasureTheory.Measure Q)
    (d : Q → ℝ) (s : ℂ) : integral μ d 0 s = 0 := by sorry
 -- TauCeti.SeveralVariableZeta.CubicAdelic.test_scaling
 example (s : ℂ) : integral (MeasureTheory.Measure.dirac ())
    (fun _ : Unit => (2:ℝ)) (fun _ => (3:ℂ)) s = 3*(2:ℂ)^(2*s) := by sorry
 -- TauCeti.SeveralVariableZeta.CubicAdelic.test_singular_locus
 example {Q ι : Type*} [MeasurableSpace Q] (μ : MeasureTheory.Measure Q)
    (d : Q → ℝ) (disc : ι → ℚ) (Phi : Q → ι → ℂ) (s : ℂ)
    (h : ∀ g x, disc x ≠ 0 → Phi g x = 0) :
    integral μ d (fun g => ∑' x, if disc x ≠ 0 then Phi g x else 0) s = 0 := by sorry
 -- TauCeti.SeveralVariableZeta.CubicAdelic.test_quotient_side
 example {G : Type*} [Group G] (d : G → ℝ) (theta : G → ℂ) (g : G) (s : ℂ)
    (hd : 0 < d g) (hi : d (g⁻¹) = (d g)⁻¹) :
    (d (g⁻¹):ℂ)^(2*s)*theta (g⁻¹) = (d g:ℂ)^(-2*s)*theta (g⁻¹) := by sorry
end CubicAdelic

namespace LocalIntegral
 theorem shell_sum {V K : Type*} [MeasurableSpace V] [Zero K]
    (μ : MeasureTheory.Measure V) (disc : V → K) (absValue : K → ℝ)
    (valuation : V → ℕ) (U : Set V) (r : ℝ) (s : ℂ)
    (hdisc : MeasurableSet {x | disc x ≠ 0}) (hU : MeasurableSet U)
    (hv : Measurable valuation) (hμ : μ U ≠ ⊤) (hr : 1 < r) (hs : 0 ≤ s.re)
    (habs : ∀ x, disc x ≠ 0 → absValue (disc x) = r^(-(valuation x:ℝ))) :
    integral μ disc absValue (U.indicator (fun _ => (1:ℂ))) s =
      ∑' k : ℕ, ((shellDensity μ disc valuation U k).toReal:ℂ)*(r:ℂ)^(-(k:ℂ)*s) := by sorry
end LocalIntegral

/-- The actual analytic clearance, including values at the two possible poles. -/
structure CubicContinuation (xi : ℂ → ℂ) where
  continued : ℂ → ℂ
  clear : ℂ → ℂ
  meromorphic : MeromorphicOn continued Set.univ
  agrees : ∀ s : ℂ, 1 < s.re → continued s = xi s
  entire : AnalyticOnNhd ℂ clear Set.univ
  clear_agrees : ∀ s : ℂ, s ≠ 1 → s ≠ 5/6 →
    clear s = (s-1)*(s-5/6)*continued s

namespace CubicContinuation
 theorem clear_spec (xi : ℂ → ℂ) (c : CubicContinuation xi) :
    AnalyticOnNhd ℂ c.clear Set.univ ∧
      ∀ s : ℂ, s ≠ 1 → s ≠ 5/6 → c.clear s = (s-1)*(s-5/6)*c.continued s := by sorry
 theorem residue_one (xi : ℂ → ℂ) (c : CubicContinuation xi) :
    Filter.Tendsto (fun s => (s-1)*c.continued s)
      (nhdsWithin 1 {s : ℂ | s ≠ 1}) (nhds (6*c.clear 1)) := by sorry
 theorem residue_five_sixths (xi : ℂ → ℂ) (c : CubicContinuation xi) :
    Filter.Tendsto (fun s => (s-5/6)*c.continued s)
      (nhdsWithin (5/6) {s : ℂ | s ≠ 5/6}) (nhds (-6*c.clear (5/6))) := by sorry
 def rationalBenchmark (R T : ℂ) : CubicContinuation (fun s => R/(s-1)+T/(s-5/6)) where
   continued := fun s => R/(s-1)+T/(s-5/6)
   clear := fun s => (s-5/6)*R+(s-1)*T
   meromorphic := by sorry
   agrees := by sorry
   entire := by sorry
   clear_agrees := by sorry
 -- TauCeti.SeveralVariableZeta.CubicContinuation.test_first_pole
 example (R T : ℂ) : (rationalBenchmark R T).clear 1 = R/6 := by sorry
 -- TauCeti.SeveralVariableZeta.CubicContinuation.test_second_pole
 example (R T : ℂ) : (rationalBenchmark R T).clear (5/6) = -T/6 := by sorry
 -- TauCeti.SeveralVariableZeta.CubicContinuation.test_off_poles
 example (s : ℂ) (h1 : s ≠ 1) (h2 : s ≠ 5/6) (R T : ℂ) :
   (rationalBenchmark R T).clear s =
     (s-1)*(s-5/6)*(rationalBenchmark R T).continued s := by sorry
end CubicContinuation

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
def SpectralData {ι : Type*} (eigenvalue : ι → ℝ) (s : ℂ) : ℂ :=
  ∑' j, if 0 < eigenvalue j then (eigenvalue j:ℂ)^(-s) else 0
namespace SpectralData
-- Declaration TauCeti.SpectralZeta.SpectralData.series
def series := @SpectralData
-- Declaration TauCeti.SpectralZeta.SpectralData.heat
def heat {ι : Type*} (eigenvalue : ι → ℝ) (t : ℝ) : ℂ := ∑' j, Complex.exp (-(t:ℂ)*(eigenvalue j:ℂ))
-- TauCeti.SpectralZeta.SpectralData.test_single_eigenvalue
example (eigenvalue : ℝ) (h : 0<eigenvalue) (s : ℂ) :
  series (fun _ : Unit => eigenvalue) s=(eigenvalue:ℂ)^(-s) := by sorry
-- TauCeti.SpectralZeta.SpectralData.test_zero_omitted
example (t : ℝ) (s : ℂ) : heat (fun _ : Unit => 0) t=1 ∧
  series (fun _ : Unit => 0) s=0 := by sorry
-- TauCeti.SpectralZeta.SpectralData.test_scaling
example {ι : Type*} (eigenvalue : ι → ℝ) (c : ℝ) (hc : 0<c) (heigenvalue : ∀ j, 0<eigenvalue j) (s : ℂ)
  (h : Summable (fun j => (eigenvalue j:ℂ)^(-s))) :
  series (fun j => c*eigenvalue j) s=(c:ℂ)^(-s)*series eigenvalue s := by sorry
end SpectralData
/-- The geometric supplier must identify these concrete spectral and heat outputs. -/
structure HeatAsymptotics (eigenvalue : ℕ → ℝ) : Prop where
  zero : eigenvalue 0 = 0
  positive : ∀ j, 0 < eigenvalue (j+1)
  monotone : Monotone eigenvalue
  finite_counts : ∀ R : ℝ, Set.Finite {j | eigenvalue j ≤ R}
  weyl : ∃ C : ℝ, 0 < C ∧ ∀ R : ℝ, 1 ≤ R →
    (({j | eigenvalue j ≤ R}).ncard : ℝ) ≤ C*R
  expansion : ∃ a : ℕ → ℂ, ∀ N : ℕ, ∃ C : ℝ, 0 < C ∧
    ∀ t : ℝ, 0 < t → t ≤ 1 →
      ‖SpectralData.heat eigenvalue t -
        ∑ k ∈ Finset.range (N+1), a k * (t:ℂ)^((k:ℤ)-1)‖ ≤ C*t^N

/-- Pole clearance is an analytic function, including its actual value at the pole. -/
structure SpectralContinuation (eigenvalue : ℕ → ℝ) where
  positiveZeta : ℂ → ℂ
  shiftedZeta : ℂ → ℂ → ℂ
  poleClear : ℂ → ℂ
  meromorphic : MeromorphicOn positiveZeta Set.univ
  regular_zero : AnalyticAt ℂ positiveZeta 0
  agrees_positive : ∀ z : ℂ, 1 < z.re →
    positiveZeta z = SpectralData.series eigenvalue z
  clear_analytic : AnalyticAt ℂ poleClear 1
  clear_agrees : ∀ᶠ z in nhdsWithin 1 {z : ℂ | z ≠ 1},
    poleClear z = (z-1)*positiveZeta z
  shifted_meromorphic : ∀ u : ℂ, 0 < u.re →
    MeromorphicOn (shiftedZeta u) Set.univ
  shifted_regular : ∀ u : ℂ, 0 < u.re → AnalyticAt ℂ (shiftedZeta u) 0
  shifted_agrees : ∀ u z : ℂ, 0 < u.re → 1 < z.re →
    shiftedZeta u z = ∑' j : ℕ, (eigenvalue j + u)^(-z)

namespace SpectralData
/-- Adapter to the actual Mellin continuation data, rather than an arbitrary function. -/
def continued (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue) : ℂ → ℂ :=
  c.positiveZeta
theorem continued_agrees (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (z : ℂ) (hz : 1 < z.re) : continued eigenvalue c z = series eigenvalue z := by sorry
end SpectralData
 theorem spectral_continuation_exists (eigenvalue : ℕ → ℝ)
    (h : HeatAsymptotics eigenvalue) : Nonempty (SpectralContinuation eigenvalue) := by sorry

-- Declaration TauCeti.SpectralZeta.Selberg
def Selberg {ι : Type*} (length : ι → ℝ) (s : ℂ) : ℂ :=
  tprod (fun p : ι => tprod (fun k : ℕ => 1 - Complex.exp (-((s+k)*(length p:ℂ)))))
namespace Selberg
-- Declaration TauCeti.SpectralZeta.Selberg.product
def product := @Selberg
/-- Actual output data of the surface-specific continuation theorem. -/
structure Continuation (length : ℕ → ℝ) where
  function : ℂ → ℂ
  entire : AnalyticOnNhd ℂ function Set.univ
  agrees : ∀ s : ℂ, 1 < s.re → function s = product length s
-- Declaration TauCeti.SpectralZeta.Selberg.continued
def continued (length : ℕ → ℝ) (c : Continuation length) : ℂ → ℂ := c.function
theorem continued_agrees (length : ℕ → ℝ) (c : Continuation length)
    (s : ℂ) (hs : 1 < s.re) : continued length c s = product length s := by sorry
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
example (eigenvalue : ℝ) (heigenvalue : 0<eigenvalue) : ofZeta (fun s => (eigenvalue:ℂ)^(-s))=eigenvalue := by sorry
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
instance : DecidableEq Coset := Classical.decEq _
-- Declaration TauCeti.BostConnes.Completed.Space
abbrev Space := lp (fun _ : Coset => ℂ) 2
-- Declaration TauCeti.BostConnes.Completed.leftRegular
def leftRegular : BCHecke ℂ →ₐ[ℂ] (Space →L[ℂ] Space) := sorry
-- Declaration TauCeti.BostConnes.Completed.algebra
def algebra : StarSubalgebra ℂ (Space →L[ℂ] Space) :=
  (StarAlgebra.adjoin ℂ (Set.range leftRegular)).topologicalClosure
-- Declaration TauCeti.BostConnes.Completed.embed
def embed : BCHecke ℂ →ₐ[ℂ] algebra := sorry
-- Declaration TauCeti.BostConnes.Completed.mu
def mu (n : ℕ+) : algebra := ((n:ℂ)^(- (1/2:ℂ))) • embed (BCHecke.x n)
-- Declaration TauCeti.BostConnes.Completed.dynamics
def dynamics (t : ℝ) : algebra ≃ₐ[ℂ] algebra := sorry
-- TauCeti.BostConnes.Completed.test_unit
example : embed 1=1 := by sorry
-- TauCeti.BostConnes.Completed.test_isometry
example (n : ℕ+) : Star.star (mu n)*mu n=1 := by sorry
-- TauCeti.BostConnes.Completed.test_range_projection
example : mu 2*Star.star (mu 2)=(1/2:ℂ) • (1+embed (BCHecke.e (1/2:ℚ))) ∧
  mu 2*Star.star (mu 2)≠1 := by sorry
end Completed
-- Declaration TauCeti.BostConnes.CompletedKMS
def CompletedKMS (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) : Prop :=
  0<β ∧ φ 1=1 ∧ (∀ a, 0≤φ (Star.star a*a)) ∧
  ∀ a b, ∃ F : ℂ → ℂ,
    ContinuousOn F {z | 0≤z.im ∧ z.im≤β} ∧
    DifferentiableOn ℂ F {z | 0<z.im ∧ z.im<β} ∧
    (∃ M : ℝ, ∀ z, 0≤z.im → z.im≤β → ‖F z‖≤M) ∧
    (∀ t : ℝ, F t=φ (a*Completed.dynamics t b)) ∧
    (∀ t : ℝ, F (t+Complex.I*β)=φ (Completed.dynamics t b*a))
namespace CompletedKMS
-- Declaration TauCeti.BostConnes.CompletedKMS.state
def state (φ : Completed.algebra →L[ℂ] ℂ) : Prop := φ 1=1 ∧ ∀ a, 0≤φ (Star.star a*a)
-- Declaration TauCeti.BostConnes.CompletedKMS.isKMS
def isKMS := CompletedKMS
/-- Restriction along the concrete Hecke embedding. -/
def restrictState (φ : Completed.algebra →L[ℂ] ℂ) : BCHecke ℂ →ₗ[ℂ] ℂ where
  toFun := fun a => φ (Completed.embed a)
  map_add' := sorry
  map_smul' := sorry

/-- The continuous coefficient state of the faithful left regular representation. -/
def base : Completed.algebra →L[ℂ] ℂ := sorry
theorem base_restrict : restrictState base = baseState := by sorry

-- Declaration TauCeti.BostConnes.CompletedKMS.restrict
theorem restrict (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) (h : isKMS β φ) :
  IsKMS β (restrictState φ) := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_temperature_one
example : isKMS 1 base := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_scaling_projection
example (β : ℝ) (φ : Completed.algebra →L[ℂ] ℂ) (h : isKMS β φ) (n : ℕ+) :
  φ (Completed.mu n * Star.star (Completed.mu n))=(n:ℂ)^(-(β:ℂ)) := by sorry
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
theorem vectorState_one (u : AddAut QmodZ) : vectorState u 1 = 1 := by sorry
theorem vectorState_basis (u : AddAut QmodZ) (n m : ℕ+) (γ : QmodZ) :
    vectorState u (Completed.mu n*Completed.embed (BCHecke.e γ)*Star.star (Completed.mu m)) =
      if n=1 ∧ m=1 then rootOfUnityOf (u γ) else 0 := by sorry
theorem vectorState_isLimit (u : AddAut QmodZ) : isLimit (vectorState u) := by sorry
-- TauCeti.BostConnes.KMSInfinity.vectorState_test_one
example (u : AddAut QmodZ) : vectorState u 1 = 1 := by sorry
-- TauCeti.BostConnes.KMSInfinity.vectorState_test_shift
example (u : AddAut QmodZ) : vectorState u (Completed.mu 2) = 0 := by sorry
-- TauCeti.BostConnes.KMSInfinity.test_gibbs_limit
example (u : AddAut QmodZ) : isLimit (vectorState u) := by sorry
-- TauCeti.BostConnes.KMSInfinity.test_value_half
example (u : AddAut QmodZ) : vectorState u (Completed.embed (BCHecke.e (1/2:ℚ)))=-1 := by sorry
-- The discriminating trivial-dynamics example is in CStarDynamics above.
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
theorem polynomial_recurrence (k : ℕ) (hk : 1 ≤ k) :
    polynomial (k+1) = ((k:ℚ)⁻¹) •
      ((Polynomial.X^2-Polynomial.C (1/4))*Polynomial.derivative (polynomial k)) := by sorry
theorem polynomial_monic (k : ℕ) (hk : 1 ≤ k) : (polynomial k).Monic := by sorry
theorem polynomial_degree (k : ℕ) (hk : 1 ≤ k) : (polynomial k).natDegree = k := by sorry
theorem higher_eval (k : ℕ) (a : QmodZ) : higher k a =
    Polynomial.eval₂ (algebraMap ℚ (BCHecke ℚ)) (first a) (polynomial k) := by sorry
theorem higher_one (a : QmodZ) : higher 1 a = first a := by sorry
theorem higher_zero_argument (k : ℕ) :
    higher k 0 = algebraMap ℚ (BCHecke ℚ) ((polynomial k).eval 0) := by sorry
theorem neg (a : QmodZ) : first (-a) = -first a := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_two
example : polynomial 2 = Polynomial.X^2-Polynomial.C (1/4) := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_three
example : polynomial 3 = Polynomial.X^3-(1/4:ℚ) • Polynomial.X := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_four
example : polynomial 4 = Polynomial.X^4-(1/3:ℚ) • Polynomial.X^2+
    Polynomial.C (1/48) := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_first_zero
example : first 0 = 0 := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_higher_half
example : higher 2 (1/2:ℚ) = (-1/4:ℚ) • (1:BCHecke ℚ) ∧
    higher 3 (1/2:ℚ) = 0 := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_higher_third
example : higher 2 (1/3:ℚ) = (1/36:ℚ) •
    (BCHecke.e (1/3:ℚ)+BCHecke.e (2/3:ℚ)-11) := by sorry
-- Declaration TauCeti.BostConnes.ArithmeticEisenstein.finite_sum
theorem finite_sum (a : QmodZ) (N : ℕ) (hN : 0<N) (ha : N • a=0) :
  first a = ∑ k∈Finset.range N, if k=0 then 0 else
    ((k:ℚ)/(N:ℚ)-1/2) • BCHecke.e (k • a) := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_zero
example : first 0=0 ∧ higher 2 0 = (-(1/4:ℚ)) • (1 : BCHecke ℚ) := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_half
example : first (1/2:ℚ)=0 := by sorry
-- TauCeti.BostConnes.ArithmeticEisenstein.test_third
example : first (1/3:ℚ)=(-1/6:ℚ) • BCHecke.e (1/3:ℚ)+(1/6:ℚ) • BCHecke.e (2/3:ℚ) := by sorry
end ArithmeticEisenstein
end TauCeti.BostConnes

namespace TauCeti.BostConnes
open BCHecke

theorem mem_axbInt_iff (g : GL (Fin 2) ℚ) : g ∈ axbInt ↔
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 0 = 0 ∧
    (g : Matrix (Fin 2) (Fin 2) ℚ) 0 0 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) ℚ) 1 1 = 1 ∧
    ∃ n : ℤ, (g : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = n := by sorry
theorem diagEntry_coset_invariant (g h : axbRat)
    (hcoset : HeckeCoset.mk axbInt axbInt ⟨g.val,g.property⟩ =
      HeckeCoset.mk axbInt axbInt ⟨h.val,h.property⟩) : diagEntry g = diagEntry h := by sorry

theorem diagEntry_translation (b : ℚ) : diagEntry (translation (.ofAdd b)) = 1 := by sorry
theorem diagEntry_dilation (a : ℚ) (ha : 0 < a) :
    ((diagEntry (dilation a ha) : ℚˣ) : ℚ) = a := by sorry
-- TauCeti.BostConnes.test_translation_integral
example : ((translation (.ofAdd (2:ℚ)) : axbRat) : GL (Fin 2) ℚ) ∈ axbInt := by sorry
-- TauCeti.BostConnes.test_diagonal_one
example : diagEntry (1 : axbRat) = 1 := by sorry
-- TauCeti.BostConnes.test_diagonal_two
example : ((diagEntry (dilation 2 (by norm_num)) : ℚˣ) : ℚ) = 2 := by sorry
-- TauCeti.BostConnes.test_translation_zero
example : translation (.ofAdd (0:ℚ)) = 1 := by sorry
-- TauCeti.BostConnes.test_dilation_one
example : dilation 1 (by norm_num) = 1 := by sorry
-- TauCeti.BostConnes.test_translation_add
example : translation (.ofAdd (1/2:ℚ)) * translation (.ofAdd (1/3:ℚ)) =
    translation (.ofAdd (5/6:ℚ)) := by sorry

abbrev DoubleCoset := HeckeCoset axbRat.toSubmonoid axbInt axbInt
def inverseCoset (X : DoubleCoset) : DoubleCoset := sorry
theorem inverse_degree_eq_num (X : DoubleCoset) :
    (inverseCoset X).degree = (cosetEntry X).num.natAbs := by sorry
abbrev NormalIndex := {nm : ℕ+ × ℕ+ // Nat.Coprime nm.1 nm.2} × QmodZ
def normalCoset (i : NormalIndex) : DoubleCoset := sorry
theorem normalCoset_bijective : Function.Bijective normalCoset := by sorry
theorem preimage_ncard (n : ℕ+) (γ : QmodZ) :
    Set.Finite {δ : QmodZ | (n:ℕ) • δ = γ} ∧
    {δ : QmodZ | (n:ℕ) • δ = γ}.ncard = n := by sorry

namespace BCHecke
variable {K B : Type*} [Field K] [CharZero K] [Ring B] [Algebra K B]
/-- The eight actual relations in a receiving algebra. No field is an unspecified proposition. -/
structure GeneratorRelations (X Xprime : ℕ+ → B) (E : QmodZ → B) : Prop where
  left_inverse : ∀ n, Xprime n * X n = algebraMap K B (n:K)
  dilations : ∀ n m, X (n*m) = X n * X m
  inverse_dilations : ∀ n m, Xprime (n*m) = Xprime n * Xprime m
  coprime : ∀ n m : ℕ+, Nat.Coprime n m → X n * Xprime m = Xprime m * X n
  translation_zero : E 0 = 1
  translation_add : ∀ γ δ, E (γ+δ) = E γ * E δ
  transport : ∀ γ n, E γ * X n = X n * E ((n:ℕ) • γ)
  preimage_sum : ∀ γ n, X n * E γ * Xprime n =
    ∑ᶠ (δ : QmodZ) (_ : (n:ℕ) • δ = γ), E δ

def lift (X Xprime : ℕ+ → B) (E : QmodZ → B)
    (h : GeneratorRelations (K:=K) X Xprime E) : BCHecke K →ₐ[K] B := sorry
theorem lift_x (X Xprime : ℕ+ → B) (E : QmodZ → B)
    (h : GeneratorRelations (K:=K) X Xprime E) (n : ℕ+) :
    lift X Xprime E h (x n) = X n := by sorry
theorem lift_x_prime (X Xprime : ℕ+ → B) (E : QmodZ → B)
    (h : GeneratorRelations (K:=K) X Xprime E) (n : ℕ+) :
    lift X Xprime E h (x' n) = Xprime n := by sorry
theorem lift_e (X Xprime : ℕ+ → B) (E : QmodZ → B)
    (h : GeneratorRelations (K:=K) X Xprime E) (γ : QmodZ) :
    lift X Xprime E h (e γ) = E γ := by sorry
theorem lift_unique (X Xprime : ℕ+ → B) (E : QmodZ → B)
    (h : GeneratorRelations (K:=K) X Xprime E) (f : BCHecke K →ₐ[K] B)
    (hx : ∀ n, f (x n) = X n) (hxp : ∀ n, f (x' n) = Xprime n)
    (he : ∀ γ, f (e γ) = E γ) : f = lift X Xprime E h := by sorry
end BCHecke

def normalForm (i : NormalIndex) : BCHecke ℂ :=
  x i.1.val.1 * e i.2 * x' i.1.val.2
theorem bc_normal_form_independent : LinearIndependent ℂ normalForm := by sorry
theorem bc_normal_form_span : Submodule.span ℂ (Set.range normalForm) = ⊤ := by sorry

namespace Completed
theorem leftRegular_star (f : BCHecke ℂ) :
    leftRegular (Star.star f) = ContinuousLinearMap.adjoint (leftRegular f) := by sorry
theorem leftRegular_injective : Function.Injective leftRegular := by sorry
theorem single_norm_le (X : DoubleCoset) :
    ‖leftRegular (single ℂ X 1)‖ ≤ Real.sqrt (X.degree * (inverseCoset X).degree : ℝ) := by sorry
theorem bc_convolution_norm_bound (f : BCHecke ℂ) :
    ‖leftRegular f‖ ≤ ∑ X ∈ f.support,
      ‖f X‖ * Real.sqrt (X.degree * (inverseCoset X).degree : ℝ) := by sorry
theorem coefficient_recovery (f : BCHecke ℂ) (g : axbRat) :
    (leftRegular f (lp.single 2 (QuotientGroup.mk (1:axbRat)) 1))
      (QuotientGroup.mk g) =
    f (HeckeCoset.mk axbInt axbInt ⟨(g⁻¹ : axbRat), (g⁻¹).2⟩) := by sorry
theorem embed_star (f : BCHecke ℂ) : embed (Star.star f) = Star.star (embed f) := by sorry
theorem embed_injective : Function.Injective embed := by sorry
theorem denseRange_embed : DenseRange embed := by sorry
theorem embed_norm (f : BCHecke ℂ) : ‖embed f‖ = ‖leftRegular f‖ := by sorry
theorem mu_relations (n : ℕ+) (γ : QmodZ) :
    Star.star (mu n) * mu n = 1 ∧
    mu n * embed (e γ) * Star.star (mu n) =
      ((n:ℂ)⁻¹) • ∑ᶠ (δ : QmodZ) (_ : (n:ℕ) • δ = γ), embed (e δ) := by sorry
theorem continuous_dynamics (a : algebra) : Continuous (fun t => dynamics t a) := by sorry
theorem dynamics_embed (t : ℝ) (f : BCHecke ℂ) :
    dynamics t (embed f) = embed (timeEvolution t f) := by sorry
theorem entire_embed_orbit (f : BCHecke ℂ) :
    AnalyticOnNhd ℂ (fun z => embed (timeEvolution z f)) Set.univ := by sorry
theorem dynamics_star (t : ℝ) (a : algebra) :
    dynamics t (Star.star a) = Star.star (dynamics t a) := by sorry
end Completed

namespace CompletedKMS
def gibbs (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : Completed.algebra →L[ℂ] ℂ := sorry
theorem gibbs_restrict (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    restrictState (gibbs β hβ u) = gibbsState β hβ u := by sorry
theorem gibbs_norm (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : ‖gibbs β hβ u‖ = 1 := by sorry
theorem gibbs_isKMS (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    isKMS β (gibbs β hβ u) := by sorry
theorem core_iff (β : ℝ) (hβ : 0 < β) (φ : Completed.algebra →L[ℂ] ℂ) :
    isKMS β φ ↔ IsKMS β (restrictState φ) := by sorry
theorem positive_core_extension (φ : BCHecke ℂ →ₗ[ℂ] ℂ)
    (h1 : φ 1 = 1) (hp : ∀ f, 0 ≤ φ (Star.star f * f)) :
    ∃! ψ : Completed.algebra →L[ℂ] ℂ, state ψ ∧ restrictState ψ = φ := by sorry
theorem base_norm : ‖base‖ = 1 := by sorry
-- TauCeti.BostConnes.CompletedKMS.base_test_one
example : base 1 = 1 := by sorry
-- TauCeti.BostConnes.CompletedKMS.base_test_half
example : base (Completed.embed (e (1/2:ℚ))) = 0 := by sorry
-- TauCeti.BostConnes.CompletedKMS.base_test_projection
example : base (Completed.mu 2*Star.star (Completed.mu 2)) = 1/2 := by sorry
theorem base_kms_iff (β : ℝ) (hβ : 0 < β) : isKMS β base ↔ β = 1 := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_gibbs_one
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) : gibbs β hβ u 1 = 1 := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_gibbs_half
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbs β hβ u (Completed.embed (e (1/2:ℚ))) = (2:ℂ)^(1-(β:ℂ))-1 := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_gibbs_projection
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbs β hβ u (Completed.mu 2 * Star.star (Completed.mu 2)) = (2:ℂ)^(-(β:ℂ)) := by sorry
-- TauCeti.BostConnes.CompletedKMS.test_wrong_sign
example (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ) :
    gibbs β hβ u (Completed.embed (x' 2 * timeEvolution (-Complex.I*β) (x 2))) ≠
      gibbs β hβ u (Completed.embed (x 2 * x' 2)) := by sorry
end CompletedKMS

theorem completed_ground_compatibility (φ : Completed.algebra →L[ℂ] ℂ) :
    KMSInfinity.isGround φ ↔
      TauCeti.CStarDynamics.IsGround Completed.dynamics φ := by sorry
theorem completed_kmsInfinity_compatibility (φ : Completed.algebra →L[ℂ] ℂ) :
    KMSInfinity φ ↔ TauCeti.CStarDynamics.IsKMSInfinity Completed.dynamics φ := by sorry

/- The canonical unit carrier is supplied by ProfiniteArithmetic. This parameterized
signature only requires its actual identification and continuity of every torsion character. -/
section Barycentres
variable {W : Type*} [TopologicalSpace W] [CompactSpace W] [T2Space W]
  [MeasurableSpace W] [BorelSpace W]
variable (parameter : W ≃ AddAut QmodZ)
  (hparameter : ∀ γ : QmodZ, Continuous (fun u => rootOfUnityOf (parameter u γ)))

def completedBarycentre (parameter : W ≃ AddAut QmodZ)
    (hparameter : ∀ γ : QmodZ, Continuous (fun u => rootOfUnityOf (parameter u γ)))
    (β : ℝ) (hβ : 1 < β) (ν : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] : Completed.algebra →L[ℂ] ℂ := sorry
theorem completedBarycentre_apply (β : ℝ) (hβ : 1 < β) (ν : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] (a : Completed.algebra) :
    completedBarycentre parameter hparameter β hβ ν a =
      ∫ u, CompletedKMS.gibbs β hβ (parameter u) a ∂ν := by sorry
theorem completedBarycentre_norm (β : ℝ) (hβ : 1 < β) (ν : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] :
    ‖completedBarycentre parameter hparameter β hβ ν‖ = 1 := by sorry
theorem completedBarycentre_isKMS (β : ℝ) (hβ : 1 < β) (ν : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] :
    CompletedKMS β (completedBarycentre parameter hparameter β hβ ν) := by sorry
-- TauCeti.BostConnes.completedBarycentre_test_dirac
example (β : ℝ) (hβ : 1 < β) (u : W) :
    completedBarycentre parameter hparameter β hβ (MeasureTheory.Measure.dirac u) =
      CompletedKMS.gibbs β hβ (parameter u) := by sorry
-- TauCeti.BostConnes.completedBarycentre_test_projection
example (β : ℝ) (hβ : 1 < β) (ν : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] :
    completedBarycentre parameter hparameter β hβ ν
      (Completed.mu 2*Star.star (Completed.mu 2)) = (2:ℂ)^(-(β:ℂ)) := by sorry
-- TauCeti.BostConnes.completedBarycentre_test_affine
example (β : ℝ) (hβ : 1 < β) (ν η : MeasureTheory.Measure W)
    [MeasureTheory.IsProbabilityMeasure ν] [MeasureTheory.IsProbabilityMeasure η]
    (t : NNReal) (ht : t ≤ 1)
    [MeasureTheory.IsProbabilityMeasure (t • ν+(1-t) • η)] (a : Completed.algebra) :
    completedBarycentre parameter hparameter β hβ (t • ν+(1-t) • η) a =
      (t:ℂ)*completedBarycentre parameter hparameter β hβ ν a+
        (1-(t:ℂ))*completedBarycentre parameter hparameter β hβ η a := by sorry
theorem high_beta_barycentre_unique (β : ℝ) (hβ : 1 < β)
    (φ : Completed.algebra →L[ℂ] ℂ) (hφ : CompletedKMS β φ) :
    ∃! ν : MeasureTheory.Measure W, MeasureTheory.IsProbabilityMeasure ν ∧
      ∀ a, φ a = ∫ u, CompletedKMS.gibbs β hβ (parameter u) a ∂ν := by sorry
theorem low_beta_unique (β : ℝ) (hβ : 0 < β) (hcrit : β ≤ 1) :
    ∃! φ : Completed.algebra →L[ℂ] ℂ, CompletedKMS β φ := by sorry
end Barycentres
end TauCeti.BostConnes



namespace TauCeti.BostConnes
open MeasureTheory

/-- The existing restricted-product finite-adele ring, equipped with its Borel sets. -/
abbrev FiniteAdeles := IsDedekindDomain.FiniteAdeleRing ℤ ℚ
local instance : MeasurableSpace FiniteAdeles := borel FiniteAdeles
local instance : BorelSpace FiniteAdeles := ⟨rfl⟩

def integralAdeles : Set FiniteAdeles :=
  {x | ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ,
    x v ∈ v.adicCompletionIntegers ℚ}

def IsScalingMeasure (β : ℝ) (μ : Measure FiniteAdeles) : Prop :=
  μ.InnerRegular ∧ IsFiniteMeasureOnCompacts μ ∧ μ integralAdeles = 1 ∧
  ∀ q : ℚ, 0 < q → ∀ E : Set FiniteAdeles, MeasurableSet E →
    μ ((fun x => (algebraMap ℚ FiniteAdeles q) * x) '' E) =
      ENNReal.ofReal ((q:ℝ)^(-β)) * μ E

namespace IsScalingMeasure
theorem normalized (β : ℝ) (μ : Measure FiniteAdeles) (h : IsScalingMeasure β μ) :
    μ integralAdeles = 1 := by sorry
theorem scale (β : ℝ) (μ : Measure FiniteAdeles) (h : IsScalingMeasure β μ)
    (q : ℚ) (hq : 0 < q) (E : Set FiniteAdeles) (hE : MeasurableSet E) :
    μ ((fun x => (algebraMap ℚ FiniteAdeles q) * x) '' E) =
      ENNReal.ofReal ((q:ℝ)^(-β)) * μ E := by sorry
theorem zero_atom (β : ℝ) (hβ : 0 < β) (μ : Measure FiniteAdeles)
    (h : IsScalingMeasure β μ) : μ {0} = 0 := by sorry
theorem convex (β : ℝ) (μ ν : Measure FiniteAdeles)
    (hμ : IsScalingMeasure β μ) (hν : IsScalingMeasure β ν)
    (t : NNReal) (ht : t ≤ 1) :
    IsScalingMeasure β (t • μ + (1-t) • ν) := by sorry
end IsScalingMeasure

/-- Restricted-product extension of the local p-adic densities at positive beta. -/
def ScalingMeasure (β : ℝ) (hβ : 0 < β) : Measure FiniteAdeles := sorry
namespace ScalingMeasure
def measure := ScalingMeasure
/-- The value at zero is set to zero; additive Haar has no atom there. -/
def «local» (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)]
    (β : ℝ) (μ : Measure (Padic p)) : Measure (Padic p) := by
  classical
  exact μ.withDensity (fun x => if x = 0 then 0 else
    ENNReal.ofReal (((1-(p:ℝ)^(-β))/(1-(p:ℝ)^(-1:ℝ)))*‖x‖^(β-1)))
def adelic := ScalingMeasure
theorem scale (β : ℝ) (hβ : 0 < β) (q : ℚ) (hq : 0 < q)
    (E : Set FiniteAdeles) (hE : MeasurableSet E) :
    adelic β hβ ((fun x => (algebraMap ℚ FiniteAdeles q⁻¹)*x) '' E) =
      ENNReal.ofReal ((q:ℝ)^β)*adelic β hβ E := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_valuation_shell
example (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)] [BorelSpace (Padic p)]
    (μ : Measure (Padic p)) [Measure.IsAddHaarMeasure μ]
    (hnorm : μ {x | ‖x‖ ≤ 1} = 1) (β : ℝ) (hβ : 0 < β) (k : ℕ) :
    «local» p β μ {x | ‖x‖ = (p:ℝ)^(-(k:ℝ))} =
      ENNReal.ofReal ((1-(p:ℝ)^(-β))*(p:ℝ)^(-(k:ℝ)*β)) := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_units_mass
example (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)] [BorelSpace (Padic p)]
    (μ : Measure (Padic p)) [Measure.IsAddHaarMeasure μ]
    (hnorm : μ {x | ‖x‖ ≤ 1} = 1) (β : ℝ) (hβ : 0 < β) :
    «local» p β μ {x | ‖x‖ = 1} = ENNReal.ofReal (1-(p:ℝ)^(-β)) := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_beta_one
example (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)] [BorelSpace (Padic p)]
    (μ : Measure (Padic p)) [Measure.IsAddHaarMeasure μ] : «local» p 1 μ = μ := by sorry
theorem normalized (β : ℝ) (hβ : 0 < β) :
    ScalingMeasure β hβ integralAdeles = 1 := by sorry
theorem scaling (β : ℝ) (hβ : 0 < β) :
    IsScalingMeasure β (ScalingMeasure β hβ) := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_beta_one
example (E : Set FiniteAdeles) (hE : MeasurableSet E) :
    ScalingMeasure 1 (by norm_num)
      ((fun x => (algebraMap ℚ FiniteAdeles 2) * x) '' E) =
    (1/2:ℝ≥0∞) * ScalingMeasure 1 (by norm_num) E := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_integral_normalized
example (β : ℝ) (hβ : 0 < β) : ScalingMeasure β hβ integralAdeles = 1 := by sorry
-- TauCeti.BostConnes.ScalingMeasure.test_zero_atom
example (β : ℝ) (hβ : 0 < β) : ScalingMeasure β hβ {0} = 0 := by sorry
end ScalingMeasure
-- TauCeti.BostConnes.IsScalingMeasure.test_zero_measure
example (β : ℝ) : ¬ IsScalingMeasure β (0 : Measure FiniteAdeles) := by sorry
-- TauCeti.BostConnes.IsScalingMeasure.test_dirac_zero
example (β : ℝ) (hβ : 0 < β) :
    ¬ IsScalingMeasure β (Measure.dirac (0:FiniteAdeles)) := by sorry
-- TauCeti.BostConnes.IsScalingMeasure.test_canonical
example (β : ℝ) (hβ : 0 < β) :
    IsScalingMeasure β (ScalingMeasure β hβ) := by sorry

/-- Pushforward-at-target derivative convention. The action and derivative are actual maps. -/
def RatioSet {G X : Type*} [MeasurableSpace X] (μ : Measure X)
    (action : G → X → X) (ρ : G → X → ℝ) : Set ℝ :=
  {r | 0 ≤ r ∧ ∀ A : Set X, MeasurableSet A → 0 < μ A →
    ∀ ε : ℝ, 0 < ε → ∃ g : G,
      0 < μ {x | x ∈ A ∧ x ∈ action g '' A ∧ |ρ g x-r| < ε}}
namespace RatioSet
theorem one_mem {G X : Type*} [MeasurableSpace X] (μ : Measure X)
    (action : G → X → X) (ρ : G → X → ℝ)
    (e : G) (he : ∀ x, action e x = x) (hρ : ∀ x, ρ e x = 1) :
    1 ∈ RatioSet μ action ρ := by sorry
theorem closed {G X : Type*} [MeasurableSpace X] (μ : Measure X)
    (action : G → X → X) (ρ : G → X → ℝ) :
    IsClosed (RatioSet μ action ρ) := by sorry
/-- The two actual countable nonsingular actions have the same orbit relation. -/
theorem orbit_invariant {G H X : Type*} [Group G] [Group H] [Countable G]
    [Countable H] [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (a : G → (X ≃ᵐ X)) (b : H → (X ≃ᵐ X))
    (ha_one : ∀ x, a 1 x=x) (ha_mul : ∀ g h x, a (g*h) x=a g (a h x))
    (hb_one : ∀ x, b 1 x=x) (hb_mul : ∀ g h x, b (g*h) x=b g (b h x))
    (ρ : G → X → ℝ) (τ : H → X → ℝ)
    (hρ : ∀ g, Measurable (ρ g) ∧
      Measure.map (a g) μ = μ.withDensity (fun x => ENNReal.ofReal (ρ g x)))
    (hτ : ∀ h, Measurable (τ h) ∧
      Measure.map (b h) μ = μ.withDensity (fun x => ENNReal.ofReal (τ h x)))
    (horbit : ∀ x y : X, (∃ g, a g x=y) ↔ ∃ h, b h x=y) :
    RatioSet μ (fun g => a g) ρ = RatioSet μ (fun h => b h) τ := by sorry
-- TauCeti.BostConnes.RatioSet.test_trivial_one
example : 1 ∈ RatioSet (Measure.dirac ()) (fun _ : Unit => id) (fun _ _ => 1) := by sorry
-- TauCeti.BostConnes.RatioSet.test_trivial_two
example : 2 ∉ RatioSet (Measure.dirac ()) (fun _ : Unit => id) (fun _ _ => 1) := by sorry
-- TauCeti.BostConnes.RatioSet.test_trivial_zero
example : 0 ∉ RatioSet (Measure.dirac ()) (fun _ : Unit => id) (fun _ _ => 1) := by sorry
end RatioSet

theorem canonical_ratio_set (β : ℝ) (hβ : 0 < β) (hcrit : β ≤ 1) :
    RatioSet (ScalingMeasure β hβ)
      (fun q : {q : ℚ // 0 < q} => fun x => algebraMap ℚ FiniteAdeles q.val * x)
      (fun q _ => (q.val:ℝ)^β) = Set.Ici 0 := by sorry
end TauCeti.BostConnes


namespace TauCeti.SpectralZeta
/-- Includes the one-dimensional zero eigenspace. -/
def ShiftedDet (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (u : ℂ) : ℂ :=
  u * Complex.exp (-deriv c.positiveZeta 0 + deriv c.poleClear 1*u) *
    ∏' j : ℕ, (1+u/(eigenvalue (j+1):ℂ))*
      Complex.exp (-u/(eigenvalue (j+1):ℂ))
namespace ShiftedDet
 theorem entire (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) : AnalyticOnNhd ℂ (ShiftedDet eigenvalue c) Set.univ := by sorry
 theorem agrees (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) (u : ℂ) (hu : 0 < u.re) :
    ShiftedDet eigenvalue c u = Complex.exp (-deriv (c.shiftedZeta u) 0) := by sorry
 theorem zero_mode (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) :
    Filter.Tendsto (fun u => ShiftedDet eigenvalue c u/u)
      (nhdsWithin 0 {u : ℂ | u ≠ 0}) (nhds (RegularizedDet c.positiveZeta)) := by sorry
 def finite {ι : Type*} [Fintype ι] (eigenvalue : ι → ℝ) (u : ℂ) : ℂ :=
   ∏ j, ((eigenvalue j:ℂ)+u)
 -- TauCeti.SpectralZeta.ShiftedDet.test_finite_empty
 example (u : ℂ) : finite (fun _ : Empty => (0:ℝ)) u = 1 := by sorry
 -- TauCeti.SpectralZeta.ShiftedDet.test_finite_single
 example (a : ℝ) (u : ℂ) : finite (fun _ : Unit => a) u = a+u := by sorry
 -- TauCeti.SpectralZeta.ShiftedDet.test_quarter_pullback
 example (s : ℂ) : finite (fun _ : Unit => (1/4:ℝ)) (s*(s-1)) = (s-1/2)^2 := by sorry
 theorem finite_empty (u : ℂ) : finite (fun _ : Empty => (0:ℝ)) u = 1 := by sorry
 theorem finite_zero_iff {ι : Type*} [Fintype ι] (eigenvalue : ι → ℝ) (u : ℂ) :
    finite eigenvalue u = 0 ↔ ∃ j, (eigenvalue j:ℂ)+u = 0 := by sorry
 theorem finite_entire {ι : Type*} [Fintype ι] (eigenvalue : ι → ℝ) :
    AnalyticOnNhd ℂ (finite eigenvalue) Set.univ := by sorry
 -- TauCeti.SpectralZeta.ShiftedDet.test_zero
 example (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) : ShiftedDet eigenvalue c 0 = 0 := by sorry
 -- TauCeti.SpectralZeta.ShiftedDet.test_positive_shift
 example (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) :
    ShiftedDet eigenvalue c 1 = Complex.exp (-deriv (c.shiftedZeta 1) 0) := by sorry
 -- TauCeti.SpectralZeta.ShiftedDet.test_actual_quarter
 example (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) (hq : eigenvalue 1 = 1/4) :
    ShiftedDet eigenvalue c (-1/4) = 0 := by sorry
end ShiftedDet

theorem shifted_zero_divisor (eigenvalue : ℕ → ℝ) (c : SpectralContinuation eigenvalue)
    (h : HeatAsymptotics eigenvalue) (a : ℝ) :
    ∃ f : ℂ → ℂ, AnalyticAt ℂ f (-(a:ℂ)) ∧ f (-(a:ℂ)) ≠ 0 ∧
      ∀ᶠ u in nhds (-(a:ℂ)), ShiftedDet eigenvalue c u =
        (u+a)^({j | eigenvalue j=a}.ncard)*f u := by sorry

theorem spectral_pullback_order (D : ℂ → ℂ) (s₀ : ℂ) (m : ℕ)
    (h : ∃ f : ℂ → ℂ, AnalyticAt ℂ f (s₀*(s₀-1)) ∧ f (s₀*(s₀-1)) ≠ 0 ∧
      ∀ᶠ u in nhds (s₀*(s₀-1)), D u=(u-s₀*(s₀-1))^m*f u) :
    ∃ f : ℂ → ℂ, AnalyticAt ℂ f s₀ ∧ f s₀ ≠ 0 ∧
      ∀ᶠ s in nhds s₀, D (s*(s-1))=(s-s₀)^(if s₀=1/2 then 2*m else m)*f s := by sorry

/-- Barnes G is the exact normalized AN.7 supplier function, not a generic logarithm.
The scalar normalization follows JSS (8.4), p.27, and the differentiated heat transform.
JSS (6.2), p.20, has an incompatible scalar Gamma coefficient; see source issue E24. -/
def scalarIdentity (G : ℂ → ℂ) (g : ℕ) (s : ℂ) : ℂ :=
  (2*Real.pi:ℂ)^(2*((g-1:ℕ):ℂ)*s) *
  Complex.exp (2*((g-1:ℕ):ℂ)*s*(1-s)) *
  Complex.Gamma s^(2*(g-1)) / G (s+1)^(4*(g-1))

theorem selberg_functional_equation (Z D G : ℂ → ℂ) (g : ℕ) (C : ℂ)
    (hcomp : ∀ s : ℂ, D (s*(s-1))=Z s*scalarIdentity G g s*Complex.exp (-2*C))
    (s : ℂ) (hI : scalarIdentity G g (1-s) ≠ 0) :
    Z (1-s)=Z s*scalarIdentity G g s/scalarIdentity G g (1-s) := by sorry
end TauCeti.SpectralZeta


namespace TauCeti.SeveralVariableZeta
namespace Tubes
/-- Real tube bases R1,...,R6 are base 0,...,base 5. -/
def base : ℕ → Set (ℝ × ℝ)
  | 0 => {z | 1 < z.2 ∧ 3/2 < z.1+z.2}
  | n+1 => base n ∪ (if n%2=0 then
      {z | (z.2,z.1) ∈ base n} else {z | (1-z.1,z.1+z.2-1/2) ∈ base n})
theorem base_zero (z : ℝ × ℝ) : z ∈ base 0 ↔ 1 < z.2 ∧ 3/2 < z.1+z.2 := by sorry
theorem base_step (n : ℕ) : base (n+1) = base n ∪
    (if n%2=0 then {z | (z.2,z.1) ∈ base n} else
      {z | (1-z.1,z.1+z.2-1/2) ∈ base n}) := by sorry
theorem base_mono (n : ℕ) : base n ⊆ base (n+1) ∧ IsOpen (base n) := by sorry
-- TauCeti.SeveralVariableZeta.Tubes.test_initial
example : (2,2) ∈ base 0 := by sorry
-- TauCeti.SeveralVariableZeta.Tubes.test_negative
example : (-2,-2) ∈ base 4 ∧ (-2,-2) ∉ base 3 := by sorry
-- TauCeti.SeveralVariableZeta.Tubes.test_hole
example : (0,0) ∉ base 5 := by sorry
end Tubes

theorem tube_bochner_extension (Ω : Set (ℝ × ℝ)) (ho : IsOpen Ω)
    (hc : IsConnected Ω) (f : ℂ × ℂ → ℂ)
    (hf : AnalyticOnNhd ℂ f {z | (z.1.re,z.2.re) ∈ Ω}) :
    ∃ F : ℂ × ℂ → ℂ, AnalyticOnNhd ℂ F {z | (z.1.re,z.2.re) ∈ convexHull ℝ Ω} ∧
      Set.EqOn F f {z | (z.1.re,z.2.re) ∈ Ω} ∧
      ∀ G : ℂ × ℂ → ℂ,
        AnalyticOnNhd ℂ G {z | (z.1.re,z.2.re) ∈ convexHull ℝ Ω} →
        Set.EqOn G f {z | (z.1.re,z.2.re) ∈ Ω} →
        Set.EqOn G F {z | (z.1.re,z.2.re) ∈ convexHull ℝ Ω} := by sorry

theorem tube_reciprocal_bound (Ω : Set (ℝ × ℝ)) (ho : IsOpen Ω)
    (hc : IsConnected Ω) (f F : ℂ × ℂ → ℂ)
    (hf : AnalyticOnNhd ℂ f {z | (z.1.re,z.2.re) ∈ Ω})
    (hF : AnalyticOnNhd ℂ F {z | (z.1.re,z.2.re) ∈ convexHull ℝ Ω})
    (heq : Set.EqOn F f {z | (z.1.re,z.2.re) ∈ Ω}) (M : ℝ) (hM : 0 ≤ M)
    (hb : ∀ z, (z.1.re,z.2.re) ∈ Ω → ‖f z‖ ≤ M) :
    ∀ z, (z.1.re,z.2.re) ∈ convexHull ℝ Ω → ‖F z‖ ≤ M := by sorry

namespace FunctionalSystem
theorem affine_order (z : ℂ × ℂ) :
    ((fun w => swap (reflect w))^[6]) z = z ∧
    Function.Injective (fun k : Fin 6 =>
      ((fun w => swap (reflect w))^[k.val]) ((2,3) : ℂ × ℂ)) := by sorry
end FunctionalSystem

theorem characters_hadamard_orthogonality :
    let H : Matrix (Fin 4) (Fin 4) ℂ := fun i a => Characters8.value i (2*a.val+1)
    H * Matrix.transpose H = 4 • (1 : Matrix (Fin 4) (Fin 4) ℂ) ∧
      Matrix.transpose H * H = 4 • (1 : Matrix (Fin 4) (Fin 4) ℂ) := by sorry

theorem double_growth (a b c d : ℝ) (i j : Fin 4) :
    ∃ C : ℝ, 0 < C ∧ ∃ N : ℕ, ∀ s w : ℂ,
      s.re ∈ Set.Icc a b → w.re ∈ Set.Icc c d →
      ‖DoubleSeries.cleared i j (s,w)‖ ≤ C*(1+|s.im|)^N*(1+|w.im|)^N := by sorry

theorem double_gamma_quotient_growth (a b : ℝ) (hb : b < 1) :
    ∃ C : ℝ, 0 < C ∧ ∃ N : ℕ, ∀ s : ℂ, s.re ∈ Set.Icc a b →
      ∀ i j : Fin 4, ‖FunctionalSystem.localRatio i j s‖ ≤ C*(1+|s.im|)^N := by sorry

/-- This is a holomorphic cleared branch and retains its polar values. -/
theorem double_shell_normalizer (F : ℂ × ℂ → ℂ)
    (hf : AnalyticOnNhd ℂ F {z | 4 < z.1.re^2+z.2.re^2 ∧ z.1.re^2+z.2.re^2 < 5})
    (C : ℝ) (hC : 0 < C) (N : ℕ)
    (hb : ∀ z, 4 < z.1.re^2+z.2.re^2 → z.1.re^2+z.2.re^2 < 5 →
      ‖F z‖ ≤ C*(1+|z.1.im|)^N*(1+|z.2.im|)^N) :
    ∃ M : ℕ, N ≤ M ∧
      AnalyticOnNhd ℂ (fun z => F z/((3+z.1)^M*(3+z.2)^M))
        {z | 4 < z.1.re^2+z.2.re^2 ∧ z.1.re^2+z.2.re^2 < 5} ∧
      ∃ B : ℝ, ∀ z, 4 < z.1.re^2+z.2.re^2 → z.1.re^2+z.2.re^2 < 5 →
        ‖F z/((3+z.1)^M*(3+z.2)^M)‖ ≤ B := by sorry
end TauCeti.SeveralVariableZeta

namespace TauCeti.BostConnes
open BCHecke

def mu (n : ℕ+) : BCHecke ℂ := ((n:ℂ)^(- (1/2:ℂ))) • x n

theorem mu_relations (n : ℕ+) (γ : QmodZ) :
    Star.star (mu n) = ((n:ℂ)^(- (1/2:ℂ))) • x' n ∧
    Star.star (mu n)*mu n = 1 ∧
    mu n*e γ*Star.star (mu n) = (1/(n:ℂ)) •
      ∑ᶠ (δ : QmodZ) (_ : (n:ℕ) • δ=γ), e δ := by sorry

theorem normalForm_reduce_gcd (n m : ℕ+) (γ : QmodZ) :
    (x n*e γ*x' m : BCHecke ℂ) =
      ∑ᶠ (δ : QmodZ) (_ : (Nat.gcd (n:ℕ) (m:ℕ)) • δ=γ),
        x (PNat.divExact n (PNat.gcd n m))*e δ*x' (PNat.divExact m (PNat.gcd n m)) := by sorry

theorem mu_star_mul_gcd (m n : ℕ+) :
    Star.star (mu m)*mu n = mu (PNat.divExact n (PNat.gcd m n))*Star.star (mu (PNat.divExact m (PNat.gcd m n))) := by sorry

theorem bc_normal_form_product (i j : NormalIndex) :
    normalForm i*normalForm j ∈ Submodule.span ℂ (Set.range normalForm) ∧
      Star.star (normalForm i) ∈ Submodule.span ℂ (Set.range normalForm) := by sorry

theorem core_correlation_bound (β : ℝ) (hβ : 0 < β)
    (φ : Completed.algebra →L[ℂ] ℂ) (hφ : CompletedKMS.state φ)
    (hcore : IsKMS β (CompletedKMS.restrictState φ)) (a b : BCHecke ℂ)
    (z : ℂ) (hz0 : 0 ≤ z.im) (hzβ : z.im ≤ β) :
    ‖φ (Completed.embed (a*timeEvolution z b))‖ ≤
      ‖Completed.embed a‖*‖Completed.embed b‖ := by sorry

theorem completed_gibbs_summable (β : ℝ) (hβ : 1 < β)
    (a : ℕ+ → ℂ) (M : ℝ) (hb : ∀ k, ‖a k‖ ≤ M) :
    Summable (fun k : ℕ+ => (k:ℂ)^(-(β:ℂ))*a k) := by sorry

theorem bc_gibbs_tail_limit (β : ℝ) (hβ : 1 < β) (u : AddAut QmodZ)
    (a : Completed.algebra) :
    ‖CompletedKMS.gibbs β hβ u a-KMSInfinity.vectorState u a‖ ≤
      2*‖a‖*(riemannZeta β-1).re/(riemannZeta β).re := by sorry

theorem bc_eisenstein_finite_fourier (N : ℕ) (hN : 0 < N) (ζ : ℂ) (hζ : ζ^N=1) :
    (∑ j ∈ Finset.range N, if j=0 then 0 else ((j:ℂ)/(N:ℂ)-1/2)*ζ^j) =
      if ζ=1 then 0 else (ζ+1)/(2*(ζ-1)) := by sorry

namespace ScalingMeasure
theorem local_shell (p : ℕ) [Fact p.Prime] [MeasurableSpace (Padic p)] [BorelSpace (Padic p)]
    (μ : MeasureTheory.Measure (Padic p)) [MeasureTheory.Measure.IsAddHaarMeasure μ]
    (hnorm : μ {x | ‖x‖ ≤ 1} = 1) (β : ℝ) (hβ : 0 < β) (k : ℤ) :
    «local» p β μ {x | ‖x‖ = (p:ℝ)^(-(k:ℝ))} =
      ENNReal.ofReal ((1-(p:ℝ)^(-β))*(p:ℝ)^(-(k:ℝ)*β)) := by sorry
end ScalingMeasure
end TauCeti.BostConnes


namespace TauCeti.SeveralVariableZeta
abbrev OddPositive := {d : ℕ // 0 < d ∧ d%2=1}
instance oddPositiveModulusNeZero (d : OddPositive) : NeZero (8*d.val) :=
  ⟨by have h := d.property.1; omega⟩

/-- The character is imprimitive at modulus 8d; its primitive conductor is separate. -/
def quadraticTwist (i : Characters8) (d : OddPositive) : DirichletCharacter ℂ (8*d.val) := sorry
namespace quadraticTwist
theorem value (i : Characters8) (d : OddPositive) (n : ℕ) :
    quadraticTwist i d (n : ZMod (8*d.val)) =
      if n%2=1 then (jacobiSym (d.val:ℤ) n : ℂ)*Characters8.value i n else 0 := by sorry

theorem series_agrees (i : Characters8) (d : OddPositive) (s : ℂ) (hs : 1 < s.re) :
    DirichletCharacter.LFunction (quadraticTwist i d) s = DoubleSeries.oddL i d.val s := by sorry

theorem real_values (i : Characters8) (d : OddPositive) (n : ℕ) :
    quadraticTwist i d (n : ZMod (8*d.val)) ∈ ({-1,0,1} : Set ℂ) := by sorry
-- TauCeti.SeveralVariableZeta.quadraticTwist.test_principal
example (n : ℕ) (hn : n%2=1) :
    quadraticTwist 0 ⟨1,by norm_num,by norm_num⟩ (n : ZMod 8) = 1 := by sorry
-- TauCeti.SeveralVariableZeta.quadraticTwist.test_square
example : quadraticTwist 0 ⟨9,by norm_num,by norm_num⟩ (3 : ZMod 72) = 0 := by sorry
-- TauCeti.SeveralVariableZeta.quadraticTwist.test_two_twist
example : quadraticTwist 2 ⟨1,by norm_num,by norm_num⟩ (3 : ZMod 8) = -1 := by sorry
end quadraticTwist

namespace DoubleSeries
def oddLContinuation (i : Characters8) (d : OddPositive) : ℂ → ℂ :=
  DirichletCharacter.LFunction (quadraticTwist i d)
theorem oddLContinuation_agrees (i : Characters8) (d : OddPositive)
    (s : ℂ) (hs : 1 < s.re) : oddLContinuation i d s = oddL i d.val s := by sorry
theorem oddLContinuation_meromorphic (i : Characters8) (d : OddPositive) :
    MeromorphicOn (oddLContinuation i d) Set.univ := by sorry
theorem oddLContinuation_entire (i : Characters8) (d : OddPositive)
    (h : quadraticTwist i d ≠ 1) : Differentiable ℂ (oddLContinuation i d) := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_L_principal
example (s : ℂ) (hs : s ≠ 1) :
    oddLContinuation 0 ⟨1,by norm_num,by norm_num⟩ s = oddZeta s := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_L_deleted_three
example (s : ℂ) (hs : s ≠ 1) :
    oddLContinuation 0 ⟨9,by norm_num,by norm_num⟩ s =
      (1-(3:ℂ)^(-s))*oddZeta s := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_L_negative_one
example : oddLContinuation 0 ⟨1,by norm_num,by norm_num⟩ (-1) = 1/12 := by sorry

def poleClearL (i : Characters8) (d : OddPositive) (s : ℂ) : ℂ := by
  classical
  exact if s=1 then if quadraticTwist i d = 1 then
    ∏ p ∈ (8*d.val).primeFactors, (1-(p:ℂ)⁻¹) else 0
    else (s-1)*oddLContinuation i d s

theorem poleClearL_off_one (i : Characters8) (d : OddPositive) (s : ℂ) (hs : s ≠ 1) :
    poleClearL i d s = (s-1)*oddLContinuation i d s := by sorry
theorem poleClearL_entire (i : Characters8) (d : OddPositive) :
    AnalyticOnNhd ℂ (poleClearL i d) Set.univ := by sorry
theorem poleClearL_one (i : Characters8) (d : OddPositive) :
    (quadraticTwist i d = 1 → poleClearL i d 1 =
      ∏ p ∈ (8*d.val).primeFactors, (1-(p:ℂ)⁻¹)) ∧
    (quadraticTwist i d ≠ 1 → poleClearL i d 1 = 0) := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_residue_half
example : poleClearL 0 ⟨1,by norm_num,by norm_num⟩ 1 = 1/2 := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_residue_third
example : poleClearL 0 ⟨9,by norm_num,by norm_num⟩ 1 = 1/3 := by sorry
-- TauCeti.SeveralVariableZeta.DoubleSeries.test_nonprincipal_zero
example : poleClearL 2 ⟨1,by norm_num,by norm_num⟩ 1 = 0 := by sorry
end DoubleSeries

theorem quadratic_mean_bound_import (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ i : Characters8, ∀ X : ℕ, 1 ≤ X → ∀ t : ℝ,
      (∑ k ∈ Finset.range X, if h : (k+1)%2=1 then
        ‖DoubleSeries.oddLContinuation i ⟨k+1,by omega,h⟩ ((1/2:ℂ)+Complex.I*t)‖ else 0) ≤
      C*(X:ℝ)^(1+ε)*(1+|t|)^(1/4+ε) := by sorry

theorem quadratic_pole_aware_strip_moment (a b ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∃ N : ℕ, ∀ i : Characters8, ∀ X : ℕ, 1 ≤ X → ∀ s : ℂ,
      s.re ∈ Set.Icc a b →
      (∑ k ∈ Finset.range X, if h : (k+1)%2=1 then
        ‖DoubleSeries.poleClearL i ⟨k+1,by omega,h⟩ s‖ else 0) ≤
      C*(X:ℝ)^(max 1 (3/2-s.re)+ε)*(1+|s.im|)^N := by sorry
end TauCeti.SeveralVariableZeta


namespace TauCeti.SeveralVariableZeta

theorem odd_squarefree_factorization (d : ℕ) (hd : 0 < d) (ho : d%2=1) :
    ∃! pair : ℕ × ℕ, 0 < pair.1 ∧ 0 < pair.2 ∧ pair.1%2=1 ∧ pair.2%2=1 ∧
      Squarefree pair.1 ∧ d=pair.1*pair.2^2 := by sorry

theorem odd_double_sum_absolute (i j : Characters8) (s w : ℂ)
    (hs : 1 < s.re) (hw : 1 < w.re) :
    Summable (fun nd : ℕ × ℕ => if nd.1%2=1 ∧ nd.2%2=1 then
      (jacobiSym (nd.2:ℤ) nd.1:ℂ)*Characters8.value i nd.1*
        Characters8.value j nd.2/(nd.1:ℂ)^s/(nd.2:ℂ)^w else 0) := by sorry

theorem double_normal_convergence (i j : Characters8) (K : Set (ℂ × ℂ))
    (hK : IsCompact K) (hd : K ⊆ {z | 1 < z.1.re ∧ 1 < z.2.re}) :
    ∃ bound : ℕ × ℕ → ℝ, Summable bound ∧ ∀ nd : ℕ × ℕ, ∀ z ∈ K,
      ‖(if nd.1%2=1 ∧ nd.2%2=1 then
        (jacobiSym (nd.2:ℤ) nd.1:ℂ)*Characters8.value i nd.1*
          Characters8.value j nd.2/(nd.1:ℂ)^z.1/(nd.2:ℂ)^z.2 else 0)‖ ≤ bound nd := by sorry

theorem squarefree_square_decomposition (i j : Characters8) (s w : ℂ)
    (hs : 1 < s.re) (hw : 1 < w.re) :
    DoubleSeries.series i j s w = DoubleSeries.oddZeta (2*s+2*w-1)*
      DoubleSeries.oddZeta (2*w)*∑' d : ℕ,
        if 0 < d ∧ d%2=1 ∧ Squarefree d then
          DoubleSeries.oddL i d s*Characters8.value j d/
            ((d:ℂ)^w*DoubleSeries.oddL i d (s+2*w)) else 0 := by sorry

theorem double_denominator_unit (i : Characters8) (d : OddPositive) (s : ℂ)
    (hs : 1 < s.re) : DoubleSeries.oddLContinuation i d s ≠ 0 := by sorry

theorem double_R1_convergence (i j : Characters8) :
    ∃ F : ℂ × ℂ → ℂ,
      AnalyticOnNhd ℂ F {z | 1 < z.2.re ∧ 3/2 < z.1.re+z.2.re} ∧
      ∀ s w : ℂ, 1 < s.re → 1 < w.re →
        F (s,w)=(s-1)*DoubleSeries.series i j s w := by sorry

theorem quadratic_reflection_equation (z : ℂ × ℂ)
    (hz : DoubleSeries.polarPolynomial z ≠ 0)
    (hr : DoubleSeries.polarPolynomial (FunctionalSystem.reflect z) ≠ 0)
    (hB : ∀ i j, AnalyticAt ℂ (fun s => FunctionalSystem.B s i j) z.1) :
    (fun ij : Fin 4 × Fin 4 => DoubleSeries.continued ij.1 ij.2 z) =
      Matrix.mulVec (FunctionalSystem.B z.1)
        (fun ij => DoubleSeries.continued ij.1 ij.2 (FunctionalSystem.reflect z)) := by sorry

theorem reflect_holomorphy_and_zero (ij kl : Fin 4 × Fin 4) :
    AnalyticOnNhd ℂ (fun s => FunctionalSystem.B s ij kl) {s : ℂ | s.re < 1} ∧
      ∀ j k : Fin 4, FunctionalSystem.B 0 (0,j) (0,k)=0 := by sorry

theorem double_overlap_identity (U : Set (ℂ × ℂ)) (ho : IsOpen U)
    (hc : IsConnected U) (F G : ℂ × ℂ → ℂ)
    (hF : AnalyticOnNhd ℂ F U) (hG : AnalyticOnNhd ℂ G U)
    (V : Set (ℂ × ℂ)) (hv : IsOpen V) (hn : V.Nonempty)
    (hVU : V ⊆ U) (heq : Set.EqOn F G V) : Set.EqOn F G U := by sorry

theorem double_reflected_pole_cancellation (f : ℂ → ℂ) (j k : Fin 4)
    (hf : ∃ H : ℂ → ℂ, AnalyticAt ℂ H 0 ∧
      ∀ᶠ s in nhdsWithin 0 {s : ℂ | s ≠ 0}, H s=s*f s) :
    ∃ H : ℂ → ℂ, AnalyticAt ℂ H 0 ∧
      ∀ᶠ s in nhdsWithin 0 {s : ℂ | s ≠ 0},
        H s=FunctionalSystem.B s (0,j) (0,k)*f s := by sorry

theorem double_shell_hull :
    {z : ℝ × ℝ | 4 < z.1^2+z.2^2 ∧ z.1^2+z.2^2 < 5} ⊆ Tubes.base 5 ∧
    convexHull ℝ {z : ℝ × ℝ | 4 < z.1^2+z.2^2 ∧ z.1^2+z.2^2 < 5} =
      {z : ℝ × ℝ | z.1^2+z.2^2 < 5} := by sorry
end TauCeti.SeveralVariableZeta

namespace TauCeti.SpectralZeta
open MeasureTheory

theorem spectral_weyl_summability (eigenvalue : ℕ → ℝ)
    (h : HeatAsymptotics eigenvalue) (σ : ℝ) (hσ : 1 < σ) :
    Summable (fun j : ℕ => eigenvalue (j+1)^(-σ)) := by sorry

theorem heat_large_time_tail (eigenvalue : ℕ → ℝ) (h : HeatAsymptotics eigenvalue) :
    ∃ C : ℝ, 0 < C ∧ ∀ t : ℝ, 1 ≤ t →
      ‖SpectralData.heat eigenvalue t-1‖ ≤ C*Real.exp (-eigenvalue 1*t/2) := by sorry

theorem heat_mellin_on_right_half_plane (eigenvalue : ℕ → ℝ)
    (h : HeatAsymptotics eigenvalue) (z : ℂ) (hz : 1 < z.re) :
    (∫ t in Set.Ioi (0:ℝ), (t:ℂ)^(z-1)*(SpectralData.heat eigenvalue t-1)) =
      Complex.Gamma z*SpectralData.series eigenvalue z := by sorry

theorem heat_small_time_subtraction (a : ℕ → ℂ) (N : ℕ) (z : ℂ) (hz : 1 < z.re) :
    (∫ t in Set.Ioo (0:ℝ) 1,
      (t:ℂ)^(z-1)*((∑ k ∈ Finset.range (N+1), a k*(t:ℂ)^((k:ℤ)-1))-1)) =
      (∑ k ∈ Finset.range (N+1), a k/(z+k-1))-1/z := by sorry

theorem spectral_regularity_zero (eigenvalue : ℕ → ℝ)
    (c : SpectralContinuation eigenvalue) : AnalyticAt ℂ c.positiveZeta 0 := by sorry

theorem shifted_genus_one_product (eigenvalue : ℕ → ℝ)
    (h : HeatAsymptotics eigenvalue) (u : ℂ) :
    Multipliable (fun j : ℕ => (1+u/(eigenvalue (j+1):ℂ))*
      Complex.exp (-u/(eigenvalue (j+1):ℂ))) := by sorry

theorem selberg_laplace_integral (a : ℝ) (ha : 0 < a) (w : ℂ)
    (hw : 0 < w.re) (hw2 : 0 < (w^2).re) :
    (∫ t in Set.Ioi (0:ℝ), (t:ℂ)^(-(3/2:ℂ))*
      Complex.exp (-w^2*t-(a:ℂ)^2/(4*t))) =
        (2*(Real.sqrt Real.pi):ℂ)/(a:ℂ)*Complex.exp (-(a:ℂ)*w) := by sorry
end TauCeti.SpectralZeta


namespace TauCeti.BostConnes
open BCHecke

theorem bc_eisenstein_mobius_divisibility (n : ℤ) (N m : ℕ)
    (hN : 0 < N) (hm : 0 < m) (hd : m ∣ N) :
    (∑ j ∈ m.divisors, ∑ d ∈ j.divisors,
      (ArithmeticFunction.moebius d:ℚ)*(j/d:ℚ)^n) = (m:ℚ)^n := by sorry

theorem bc_eisenstein_division (k N : ℕ) (hk : 1 ≤ k) (hN : 0 < N) :
    let f : ℤ → ℕ → ℚ := fun j d => ∑ a ∈ d.divisors,
      (ArithmeticFunction.moebius a:ℚ)*(d/a:ℚ)^j
    let gamma : ℚ := (ArithmeticEisenstein.polynomial k).eval 0 / (2^k-1)
    (∑ᶠ (a : QmodZ) (_ : N • a=0), ArithmeticEisenstein.higher k a) =
      gamma • ∑ d ∈ N.divisors,
        ((2^k-2)*f 1 d+(N:ℚ)^k*f (1-(k:ℤ)) d) •
          ((d:ℚ)⁻¹ • (x d.toPNat'*x' d.toPNat' : BCHecke ℚ)) := by sorry

theorem bc_eisenstein_prime_projections (p b : ℕ) (hp : p.Prime) :
    (((p^b:ℚ)⁻¹) • (x (p^b).toPNat'*x' (p^b).toPNat' : BCHecke ℚ)) ∈
      Algebra.adjoin ℚ (Set.range ArithmeticEisenstein.first) := by sorry

-- The exceptional doubled-level computation is an equality in the actual Hecke core.
example : ((2:ℚ)⁻¹) • (x 2*x' 2 : BCHecke ℚ) =
    3 + (2:ℚ) • ∑ᶠ (a : QmodZ) (_ : 4 • a=0), ArithmeticEisenstein.higher 2 a := by sorry

theorem bc_eisenstein_roots_recovery (a : QmodZ) :
    (e a : BCHecke ℚ) ∈ Algebra.adjoin ℚ (Set.range ArithmeticEisenstein.first) := by sorry

theorem bc_eisenstein_semigroup_preservation (n : ℕ+) (a b : QmodZ)
    (h : (n:ℕ) • b=a) :
    ((n:ℚ)⁻¹) • (x n*ArithmeticEisenstein.first a*x' n) =
      (((n:ℚ)⁻¹) • (x n*x' n))*ArithmeticEisenstein.first b := by sorry

theorem bc_eisenstein_prime_level_induction (p b : ℕ) (hp : p.Prime) (hb : 0 < b) :
    (e ((1/(p^b):ℚ):QmodZ) : BCHecke ℚ) ∈
      Algebra.adjoin ℚ (Set.range ArithmeticEisenstein.first) := by sorry

local instance : Algebra ℚ (BCHecke ℂ) :=
  ((algebraMap ℂ (BCHecke ℂ)).comp (Rat.castHom ℂ)).toAlgebra' (by sorry)

theorem bc_eisenstein_isometry_generation :
    Algebra.adjoin ℚ
      (Set.range (fun a => BCHecke.map (Rat.castHom ℂ) (ArithmeticEisenstein.first a)) ∪
       Set.range mu ∪ Set.range (fun n => Star.star (mu n))) =
    Algebra.adjoin ℚ
      (Set.range (fun i : ℕ+ × (QmodZ × ℕ+) =>
        mu i.1*(e i.2.1 : BCHecke ℂ)*Star.star (mu i.2.2))) := by sorry

theorem bc_eisenstein_complexification :
    Algebra.adjoin ℂ
      (Set.range (fun a => BCHecke.map (Rat.castHom ℂ) (ArithmeticEisenstein.first a)) ∪
       Set.range mu ∪ Set.range (fun n => Star.star (mu n))) = ⊤ := by sorry

open MeasureTheory
local instance : MeasurableSpace FiniteAdeles := borel FiniteAdeles
local instance : BorelSpace FiniteAdeles := ⟨rfl⟩

theorem high_beta_unit_measure (β : ℝ) (hβ : 1 < β)
    (μ : Measure FiniteAdeles) (hμ : IsScalingMeasure β μ) :
    μ {x | ∃ u : FiniteAdelesˣ, (u:FiniteAdeles)=x ∧
      (u:FiniteAdeles) ∈ integralAdeles ∧ ((u⁻¹:FiniteAdelesˣ):FiniteAdeles) ∈ integralAdeles} =
        (ENNReal.ofReal (riemannZeta (β:ℂ)).re)⁻¹ := by sorry

theorem bc_high_beta_unit_orbits (β : ℝ) (hβ : 1 < β)
    (μ : Measure FiniteAdeles) (hμ : IsScalingMeasure β μ) :
    μ {x | ¬ ∃ q : ℚ, 0 < q ∧ ∃ u : FiniteAdelesˣ,
      (u:FiniteAdeles) ∈ integralAdeles ∧ ((u⁻¹:FiniteAdelesˣ):FiniteAdeles) ∈ integralAdeles ∧
      x=algebraMap ℚ FiniteAdeles q*(u:FiniteAdeles)} = 0 := by sorry

theorem canonical_scaling_extreme (β : ℝ) (hβ : 0 < β) (hc : β ≤ 1)
    (μ ν : Measure FiniteAdeles) (hμ : IsScalingMeasure β μ) (hν : IsScalingMeasure β ν)
    (t : NNReal) (ht : 0 < t) (ht1 : t < 1)
    (heq : ScalingMeasure β hβ=t • μ+(1-t) • ν) :
    μ=ScalingMeasure β hβ ∧ ν=ScalingMeasure β hβ := by sorry

theorem prime_progression_reciprocal_diverges (d a : ℕ) (hd : 0 < d)
    (ha : a < d) (hc : a.Coprime d) :
    Filter.Tendsto (fun X : ℕ => ∑ p ∈ (Finset.range X).filter
      (fun p => p.Prime ∧ p%d=a), (p:ℝ)⁻¹) Filter.atTop Filter.atTop := by sorry

section Barycentres
variable {W : Type*} [TopologicalSpace W] [CompactSpace W] [T2Space W]
  [MeasurableSpace W] [BorelSpace W]
variable (parameter : W ≃ AddAut QmodZ)
  (hparameter : ∀ γ : QmodZ, Continuous (fun u => rootOfUnityOf (parameter u γ)))

theorem kms_classification (β : ℝ) (hβ : 0 < β) :
    (β ≤ 1 → ∃! φ : Completed.algebra →L[ℂ] ℂ, CompletedKMS β φ) ∧
    (∀ h : 1 < β, ∀ φ : Completed.algebra →L[ℂ] ℂ, CompletedKMS β φ →
      ∃! ν : Measure W, IsProbabilityMeasure ν ∧
        ∀ a, φ a=∫ u, CompletedKMS.gibbs β h (parameter u) a ∂ν) := by sorry
end Barycentres
end TauCeti.BostConnes

namespace TauCeti.CStarDynamics
theorem matrix_ground_not_kmsInfinity :
    IsGround (fun _ => AlgEquiv.refl) matrixVectorState ∧
      ¬ IsKMSInfinity (fun _ => AlgEquiv.refl) matrixVectorState := by sorry
end TauCeti.CStarDynamics

/-!
## Exact native omissions

The roadmap states the following obligations in mathematics. Their missing canonical
carriers or stronger clauses are recorded here; no proposition hole replaces them.

AnalyticNumberTheory:AN.9/bc-regular-shift-bounds — TauCeti.BostConnes.regular_shift_bounds
regularRep and its isometry examples are native. Separate coordinate operators S_n, S_n-adjoint and D_(u,gamma), with the exact lp coordinate/adjoint formula, have not been named as bounded operators.

AnalyticNumberTheory:AN.9/bc-gns-generator-bounds — TauCeti.BostConnes.algebraic_gns_generator_bounds
The algebraic positive-functional quotient and its Hilbert completion before a C*-norm is available require OP2-universal. Mathlib PositiveLinearMap.gnsStarAlgHom assumes a C*-algebra and cannot stand for this precompletion bound.

AnalyticNumberTheory:AN.9/bc-convolution-row-column — TauCeti.BostConnes.Completed.kernel_degree
The native leftRegular is an actual bounded operator on lp of right cosets. The missing leaf is the representative-independent indicator kernel K_X(gH,hH) and exact finite row/column cardinalities L(X),R(X); it requires the canonical quotient kernel construction, rather than the Gibbs l2(N+) carrier.

AnalyticNumberTheory:AN.9/bc-universal-norm — TauCeti.BostConnes.universal_norm_finite
Missing is a quantified carrier of all bounded unital star representations of the algebraic Hecke core and its universal norm/completion. Completed.algebra is instead the concrete left-regular operator closure; equality to the universal completion uses OP2-universal and OP2-dilation-corner.

AnalyticNumberTheory:AN.9/bc-adelic-endomorphism — TauCeti.BostConnes.adele_division_endomorphism
Missing is the compact-open C(zHat) corner star-endomorphism carrier and its canonical multiplication-by-n/extension-by-zero map on the imported ProfiniteArithmetic zHat.

AnalyticNumberTheory:AN.9/bc-adelic-dilation — TauCeti.BostConnes.adele_minimal_dilation
Missing is the actual C0(FiniteAdeles) automorphic action and its equivariant embedding of C(zHat); the minimal-dilation exhaustion must be stated in this function-algebra topology.

AnalyticNumberTheory:AN.9/bc-crossed-product-full-corner — TauCeti.BostConnes.crossed_product_full_corner
No canonical crossed-product C*-algebra or full-projection corner exists at the pin. OP2-dilation-corner must expose the universal covariant maps and their inverse before this particular BC comparison can be given a native signature.

AnalyticNumberTheory:AN.9/bc-universal-reduced — TauCeti.BostConnes.universal_eq_reduced
The full and reduced crossed-product norms and the canonical regular quotient map are the missing OP2-dilation-corner objects. The existing Completed closure alone does not express their amenability comparison.

AnalyticNumberTheory:AN.9/bc-gibbs-strip-series — TauCeti.BostConnes.gibbs_strip_normal_convergence
Completed Gibbs and its algebraic KMS identity are native. The omitted stronger leaf names the actual entire correlation series, its compact-strip uniform convergence and its two boundary evaluations for arbitrary completed arguments.

AnalyticNumberTheory:AN.9/bc-real-dynamics-extension — TauCeti.BostConnes.bc_real_dynamics_extension
Completed.dynamics, dynamics_embed, dynamics_star and continuous_dynamics are native. The separate existence-and-uniqueness leaf for extending the core real star-automorphism group, including its group law, has no named signature.

AnalyticNumberTheory:AN.9/bc-finite-prime-projection — TauCeti.BostConnes.bc_finite_prime_projection
Missing is the explicit rational-subsemigroup orbit conditional projection in L2(FiniteAdeles,mu_beta), its product shell formula and dependence on a finite set of primes; the Gibbs representation on l2(N+) is a different space.

AnalyticNumberTheory:AN.9/bc-local-character-density — TauCeti.BostConnes.bc_local_character_density
Missing is the canonical local character span on the finite-prime invariant L2 space and the cylinder approximation map to the full adelic space. The general Hilbert density theorem is imported; the concrete character embedding is absent.

AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection — TauCeti.BostConnes.bc_nontrivial_character_projection
Missing is the finite-prime L2 conditional projection applied to a nontrivial finite-conductor unit character, with its explicit product and AN.2 progression-partial-sum estimate.

AnalyticNumberTheory:AN.9/bc-decreasing-projections — TauCeti.BostConnes.decreasing_projection_strong
The imported OperatorTheory Hilbert projection theorem supplies the general limit. Missing here are the canonical BC decreasing projection sequence and the identification of its limiting range with rational-dilation invariant functions.

AnalyticNumberTheory:AN.9/bc-critical-ergodicity — TauCeti.BostConnes.bc_critical_ergodicity
ScalingMeasure and canonical_scaling_extreme are native. A native ergodicity signature requires the canonical nonsingular Q-positive action on the L2/exhaustion carrier and the preceding projection-to-invariant-range identification.

AnalyticNumberTheory:AN.9/bc-unit-average — TauCeti.BostConnes.unit_average_canonical
Missing is the imported compact unit group acting continuously on actual finite adeles and the normalized Haar pushforward average of an arbitrary scaling measure. The native parameter W in barycentres supplies torsion characters only.

AnalyticNumberTheory:AN.9/bc-extreme-average-rigidity — TauCeti.BostConnes.extreme_unit_average_rigid
Missing is that concrete unit averaging operator and its continuous compact-cylinder separating test family. canonical_scaling_extreme is native, but does not state this additional averaging-rigidity argument.

AnalyticNumberTheory:AN.9/bc-corner-expectation — TauCeti.BostConnes.corner_expectation
OP2-expectation-measure must expose the actual reduced crossed-product identity-coefficient conditional expectation and its compact-open corner restriction; neither is represented by an arbitrary linear-functional field.

AnalyticNumberTheory:AN.9/bc-measure-to-kms — TauCeti.BostConnes.scalingMeasure_to_kms
The missing canonical map integrates the actual corner expectation against a scaling Radon measure. ScalingMeasure and CompletedKMS are native separately; their expectation-mediated map depends on OP2-expectation-measure.

AnalyticNumberTheory:AN.9/bc-kms-to-measure — TauCeti.BostConnes.kms_to_scalingMeasure
Missing is the diagonal C(zHat) embedding into the completed Hecke algebra and the canonical measure recovered from that restriction. The current Tau Ceti character-space measure theorem is imported for existence, with uniqueness separately required.

AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence — TauCeti.BostConnes.bc_kms_scaling_correspondence
Missing are the two preceding canonical maps and their mutually inverse affine and weak-topological identities. The native kms_classification states a barycentre result without replacing this measure-state equivalence by a placeholder.

AnalyticNumberTheory:AN.9/bc-high-beta-affine-homeomorphism — TauCeti.BostConnes.high_beta_affine_homeomorphism
The native high_beta_barycentre_unique proves only unique probability-measure representation on a compact parameter W. The missing stronger signature identifies W with the imported zHat units and equips completed states with pointwise weak evaluation topology; norm topology of continuous linear maps is incorrect.

AnalyticNumberTheory:AN.9/bc-high-beta-extremes — TauCeti.BostConnes.high_beta_extreme_iff
The missing signature uses the actual convex set of completed states and its ExtremePoints, the canonical unit parametrization and the weak topology. Unique barycentres alone do not give a native extreme-boundary declaration.

AnalyticNumberTheory:AN.9/bc-unit-qmodz-adapter — TauCeti.BostConnes.profiniteUnits_qmodz_equiv
Native barycentres accept an actual equivalence W to AddAut(Q/Z) with continuous torsion evaluations. Construction of that equivalence from the imported profinite unit carrier and its compatible finite restrictions is omitted.

AnalyticNumberTheory:AN.9/bc-high-beta-barycentres — TauCeti.BostConnes.bc_high_beta_barycentres
Native high_beta_barycentre_unique and kms_classification give the unique-measure part. The Bauer-simplex and homeomorphic extreme-boundary clauses require the missing weak state topology and canonical zHat-unit comparison.

AnalyticNumberTheory:AN.9/bc-kms-symmetry-transitive — TauCeti.BostConnes.extreme_symmetry_torsor
symmetryAction on the core is native. Its completed star-automorphism extension and the weak extreme-boundary/unit identification are missing from the stronger free/transitive action signature.

AnalyticNumberTheory:AN.9/bc-eisenstein-corner-power-sums — TauCeti.BostConnes.bc_eisenstein_corner_power_sums
The missing signature introduces the actual idempotent e=1-pi_p corner, its unit e and z_j=e E1(j/N), then asserts all their power sums belong to Qe. Existing native division and prime-projection identities supply its inputs.

AnalyticNumberTheory:AN.9/bc-eisenstein-newton-rationality — TauCeti.BostConnes.bc_eisenstein_newton_rationality
The pinned generic Newton identity is cited. Missing is its specialization to the actual e-corner, where constants map to c e and the product polynomial has degree N-1, including repeated and zero roots.

AnalyticNumberTheory:AN.9/bc-eisenstein-cotangent-roots — TauCeti.BostConnes.bc_eisenstein_cotangent_roots
The missing carrier is evaluation of the commutative arithmetic corner at an invertible Q-lattice character. It must identify the full multiset of N-1 roots with cot(pi j/N)/(2i), including zero at even N.

AnalyticNumberTheory:AN.9/bc-eisenstein-bezout-cayley — TauCeti.BostConnes.bc_eisenstein_bezout_cayley
Missing is the preceding corner polynomial Q_N and its Bezout identity with X-1/2, evaluated with corner unit e. That identity supplies the inverse needed for the Cayley recovery of e e(1/N).

AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation — TauCeti.BostConnes.bc_arithmetic_algebra_generation
Native bc_eisenstein_roots_recovery, bc_eisenstein_isometry_generation and bc_eisenstein_complexification cover the torsion recovery and normalized arithmetic form. The node additionally asks for a canonical rational presentation comparison and hence keeps its own composite target signature omitted.

AnalyticNumberTheory:AN.9/bc-cyclotomic-restrictions — TauCeti.BostConnes.cyclotomic_restrictions_compatible
Finite cyclotomic Galois identifications are imported from GN.10. Missing is their inverse-limit compatibility map to the actual zHat-unit carrier and its comparison with AddAut(Q/Z); no global Artin map is assumed.

AnalyticNumberTheory:AN.8/quadratic-primitive-adapter — TauCeti.SeveralVariableZeta.quadratic_primitive_adapter
quadraticTwist is an actual DirichletCharacter and its LFunction is native. The omitted signature names its primitive fundamental-discriminant character, proves the exact conductor/parity table and Gauss-sum root number +1, and identifies all change-level deleted factors, including conductor one.

AnalyticNumberTheory:AN.8/quadratic-fourth-moment — TauCeti.SeveralVariableZeta.quadratic_fourth_moment
The exact moment is requested from ST.2. Its native statement needs a finite enumeration of nonprincipal primitive real characters across varying conductor modules, with constants uniform in that enumeration and the conductor bound, rather than an arbitrary same-modulus family.

AnalyticNumberTheory:AN.8/quadratic-holder-first-moment — TauCeti.SeveralVariableZeta.quadratic_holder_first_moment
The missing native signature sums only squarefree discriminants, with each corresponding primitive character and its fundamental-discriminant conductor. quadratic_mean_bound_import already states the resulting all-odd continued first moment.

AnalyticNumberTheory:AN.8/quadratic-square-factor-sum — TauCeti.SeveralVariableZeta.quadratic_square_factor_sum
The native squarefree_square_decomposition is a double-series identity. This omitted analytic leaf compares continued primitive and imprimitive L-functions via the exact deleted-prime factors, uniformly over the square component and the real strip.

AnalyticNumberTheory:AN.8/tube-overlap-gluing — TauCeti.SeveralVariableZeta.tube_overlap_gluing
double_overlap_identity is native for actual analytic branches on an open preconnected domain. The missing stronger signature recursively constructs canonical branches on each transported tube base and records their compatibility across every gluing.

AnalyticNumberTheory:AN.8/tube-hull-extension — TauCeti.SeveralVariableZeta.tube_hull_extension
tube_bochner_extension and tube_reciprocal_bound are native exact analytic statements. This composite application to the canonical double-series shell has no additional named signature; primary Bochner proof acquisition remains the source gap.

AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient — TauCeti.SeveralVariableZeta.cubic_orbit_to_coefficient
The native CubicShintani uses supplied actual disc/aut/signature functions. Their canonical construction from all locally free cubic O_F-modules and finite automorphism groups is missing, including nonprincipal ideal-class components.

AnalyticNumberTheory:AN.8/local-measure-normalization — TauCeti.SeveralVariableZeta.local_measure_normalization
Missing are the actual local field, different-normalized additive character, self-dual Haar pairing and GL2 Haar normalization maps from AL.0/AA.2. LocalIntegral accepts a genuine measure, but does not identify these canonical measures or their |3| factors.

AnalyticNumberTheory:AN.8/local-orbit-jacobian — TauCeti.SeveralVariableZeta.local_orbit_jacobian
Missing is the canonical binary-cubic GL2 orbit covering with finite stabilizer and its change-of-variables map, on the supplier local field and normalized Haar carriers.

AnalyticNumberTheory:AN.8/local-density-coefficient-comparison — TauCeti.SeveralVariableZeta.local_density_coefficient_comparison
LocalIntegral.shell_sum is native for actual norm/discriminant shells. The stronger comparison needs the actual open-orbit selector, representative discriminant, stabilizer order and GL2 orbital measure; it is not an equality with arbitrary coefficient data.

AnalyticNumberTheory:AN.8/cubic-adelic-convergence — TauCeti.SeveralVariableZeta.cubic_adelic_convergence
CubicAdelic.integral is native for actual quotient measure, determinant norm and theta supplied as parameters. Identifying them with GL2(A_F)/GL2(F) and proving the canonical Schwartz-Siegel majorant requires AA.2/AL.0/ST.1.

AnalyticNumberTheory:AN.8/cubic-adelic-unfolding — TauCeti.SeveralVariableZeta.cubic_adelic_unfolding
Missing are the actual GL2 adelic quotient measure, Schwartz-Bruhat space, rational binary-cubic orbit quotient and finite stabilizers, all with the right-quotient determinant exponent 2s. Generic theta reindexing and inversion_kernel are native, but not this canonical orbital unfolding.

AnalyticNumberTheory:AN.8/cubic-class-group-components — TauCeti.SeveralVariableZeta.cubic_class_group_components
Missing is the finite ideal-class component index and the S-integral-to-all-locally-free-module comparison supplied by ST.1 and GN arithmetic. A freely chosen generic series index cannot express that equality.

AnalyticNumberTheory:AN.8/local-split-orbit-factor — TauCeti.SeveralVariableZeta.local_split_orbit_factor
Missing is the standard split auxiliary orbital integral I_alpha(omega,Phi1), its four explicit valuation support subsets and their normalized measures. The rational factor alone would omit the proof carrier.

AnalyticNumberTheory:AN.8/local-unramified-quadratic-factor — TauCeti.SeveralVariableZeta.local_unramified_quadratic_factor
Missing is the standard auxiliary integral with its unramified quadratic integral basis and two support regions, using the actual field norm and GL2 orbital measure.

AnalyticNumberTheory:AN.8/local-ramified-quadratic-factor — TauCeti.SeveralVariableZeta.local_ramified_quadratic_factor
Missing is the standard auxiliary integral with ramified quadratic uniformizer basis and its two field-norm valuation regions, retaining residue characteristic two and the separate discriminant Jacobian.

AnalyticNumberTheory:AN.8/local-unramified-cubic-factor — TauCeti.SeveralVariableZeta.local_unramified_cubic_factor
Missing is the standard auxiliary integral with unramified cubic integral basis and the three valuation regions, not merely the algebraic rational-function simplification.

AnalyticNumberTheory:AN.8/local-ramified-cubic-factor — TauCeti.SeveralVariableZeta.local_ramified_cubic_factor
Missing is the standard auxiliary integral with ramified cubic uniformizer basis, norm valuation and its three support regions; wild discriminant factors stay in the canonical measure adapter.

AnalyticNumberTheory:AN.8/local-orbital-euler-factor — TauCeti.SeveralVariableZeta.local_orbital_euler_factor
Missing are the five canonical local etale-cubic orbit types, standard representatives, unramified quasicharacter and orbital integrals. The five-factor formula is fully stated in the reader; neither a generic shell nor a rational function field replaces these objects.

AnalyticNumberTheory:AN.8/cubic-absolute-convergence — TauCeti.SeveralVariableZeta.cubic_absolute_convergence
CubicShintani is native as a generic weighted series. Its canonical number-field order coefficients, finite inverse-automorphism sums and all signature/class-group indices must be supplied before the unconditional arithmetic convergence signature.

AnalyticNumberTheory:AN.8/cubic-truncated-entire — TauCeti.SeveralVariableZeta.cubic_truncated_entire
Missing is the actual determinant-at-least-one GL2 adelic quotient restriction and Schwartz-Bruhat tempered distribution topology; a generic integrability assumption would lose the uniform Siegel majorant target.

AnalyticNumberTheory:AN.8/cubic-poisson-decomposition — TauCeti.SeveralVariableZeta.cubic_poisson_decomposition
Missing is the canonical finite-product adelic Fourier transform, nonsingular/singular theta decomposition and quotient measures. The exact zero/triple-root/double-root rational orbit selectors must accompany the exponent u and Jacobian.

AnalyticNumberTheory:AN.8/cubic-smoothing-residue — TauCeti.SeveralVariableZeta.cubic_smoothing_residue
Missing is the normalized GL2 rank-one Eisenstein function, entire vertical test space and contour smoothing operator from AS.2/AA.2, with the residue rho0=Res Z_F(1)/Z_F(2).

AnalyticNumberTheory:AN.8/cubic-zero-singular-term — TauCeti.SeveralVariableZeta.cubic_zero_singular_term
Missing is the actual zero-orbit smoothed theta integral and determinant-one idele character; its vanishing by character orthogonality is stated on the canonical quotient measure.

AnalyticNumberTheory:AN.8/cubic-compact-average-laws — TauCeti.SeveralVariableZeta.cubic_compact_average_laws
Missing is the canonical maximal compact adelic group, its probability Haar measure and its action on the binary-cubic Schwartz space, together with the unitary determinant-character Fourier intertwining.

AnalyticNumberTheory:AN.8/cubic-singular-tate-restrictions — TauCeti.SeveralVariableZeta.cubic_singular_tate_restrictions
Missing is the actual adelic Schwartz restriction/integration map T1,T2 and their normalized Tate meromorphic continuations. The four residue distributions must be stated as these canonical restrictions.

AnalyticNumberTheory:AN.8/cubic-triple-root-unfolding — TauCeti.SeveralVariableZeta.cubic_triple_root_unfolding
Missing is the triple-root locus parametrization by GL2(F)/B(F) together with a nonzero scalar on the preserved cubic line, and its smoothed theta integral, compact average and idele/Tate change of variables, including the factor 1/3. The Borel preserves that line, rather than fixing each vector on it.

AnalyticNumberTheory:AN.8/cubic-triple-root-residue — TauCeti.SeveralVariableZeta.cubic_triple_root_residue
Missing are the actual Sigma1 continued Tate restriction, smoothing contours and normalized residue distributions, whose poles are at w=2 and w=3.

AnalyticNumberTheory:AN.8/cubic-double-root-unfolding — TauCeti.SeveralVariableZeta.cubic_double_root_unfolding
Missing is the rational double-root selector and its unfolded smoothed integral, nonconstant Eisenstein part and two Tate contours with parameters -1-z and z-3.

AnalyticNumberTheory:AN.8/cubic-double-root-residue — TauCeti.SeveralVariableZeta.cubic_double_root_residue
Missing are the actual Sigma2(-1) distribution and contour functions; the w=2,3,4 residue formula must use the same normalized restriction integrals as the triple-root term.

AnalyticNumberTheory:AN.8/cubic-singular-cancellation — TauCeti.SeveralVariableZeta.cubic_singular_cancellation
Missing is the canonical Fourier-minus-original singular distribution and its determinant-one quotient integration map. The w=3 and w=4 cancellations are identities of those distributions.

AnalyticNumberTheory:AN.8/cubic-singular-rational-term — TauCeti.SeveralVariableZeta.cubic_singular_rational_term
Missing is the canonical singular correction I(Phi,u), with actual Fourier and Sigma1/Sigma2 distribution evaluations. A rational expression in unrelated complex parameters would not state its identity with the integral.

AnalyticNumberTheory:AN.8/cubic-adelic-meromorphic-equation — TauCeti.SeveralVariableZeta.cubic_adelic_meromorphic_equation
Missing is the canonical adelic Z(Phi,u) continued as a Schwartz-Bruhat distribution and its actual Fourier transform; the generic CubicContinuation instead describes ordinary two-pole arithmetic functions.

AnalyticNumberTheory:AN.8/local-finite-fourier-dual — TauCeti.SeveralVariableZeta.local_finite_fourier_dual
Missing is the different-normalized local binary-cubic Fourier operator and its integral/trace-divisible lattice indicators, including the exact |3|^(-1) q^(-2e) self-dual mass.

AnalyticNumberTheory:AN.8/cubic-archimedean-fourier-comparison — TauCeti.SeveralVariableZeta.cubic_archimedean_fourier_comparison
ArchMatrix is native. Its identification as the Fourier matrix for the actual real/complex binary-cubic orbital distributions is omitted; the real primary Shintani proof and nonarchimedean Igusa proof remain named source gaps.

AnalyticNumberTheory:AN.8/cubic-global-functional-equation — TauCeti.SeveralVariableZeta.cubic_global_functional_equation
Missing are the canonical ordinary and trace-divisible dual series on the same number-field signature index and the self-dual local/global normalization comparison. ArchMatrix alone and supplied generic meromorphic functions do not establish this equation.

AnalyticNumberTheory:AN.8/cubic-meromorphic-continuation — TauCeti.SeveralVariableZeta.cubic_meromorphic_continuation
CubicContinuation prototypes actual meromorphic continuation and entire pole clearance of a given series. The omitted existence theorem constructs this data for the canonical cubic-order series from the adelic unfolding, local factors and all ideal-class components.

AnalyticNumberTheory:AN.8/cubic-entire-order-bound — TauCeti.SeveralVariableZeta.cubic_entire_order_bound
Missing is the canonical cleared arithmetic function C_(F,alpha) and the primary quantitative entire-plane growth proof. A function with assumed order-one bound would hide the precise remaining source gap.

AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance — TauCeti.SeveralVariableZeta.cubic_residues_and_entire_clearance
Native CubicContinuation.clear_spec and its two residue limits are present. The stronger arithmetic target additionally constructs the canonical continuation and proves order at most one, whose separate growth proof is a gap.

AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one — TauCeti.SeveralVariableZeta.arch_entry_vanishing_at_one
ArchMatrix and explicit sine entries are native. This omitted leaf states their local analytic vanishing orders in the number-field signature matrix, including the double complex factor and total n=r1+2r2.

AnalyticNumberTheory:AN.8/gamma-unit-at-one — TauCeti.SeveralVariableZeta.gamma_unit_at_one
Missing is the canonical global number-field Gamma/discriminant prefactor with its normalization and its local analytic unit germ at one; generic Gamma facts do not identify that prefactor.

AnalyticNumberTheory:AN.8/cubic-dual-simple-poles — TauCeti.SeveralVariableZeta.cubic_dual_simple_poles
CubicShintani.dual is native as an actual trace-selector weighted series. Its canonical trace-divisible order lattice, meromorphic continuation and two simple-pole assertion require the same arithmetic/adelic adapters as the ordinary series.

AnalyticNumberTheory:AN.8/cubic-zero-at-origin — TauCeti.SeveralVariableZeta.cubic_zero_at_origin
Missing is the canonical ordinary/dual functional equation and their analytic germs. The vanishing order n-1 cannot be concluded from independently supplied arbitrary continuation data.

AnalyticNumberTheory:AN.8/cubic-orders-generating-series — TauCeti.SeveralVariableZeta.cubic_orders_generating_series
Missing are canonical orders inside an etale cubic F-algebra, their relative index norm and counting coefficients, and the arithmetic-to-local-orbit bijection supplied by ST.1. The zeta quotient is specified mathematically.

AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound — TauCeti.SeveralVariableZeta.cubic_reducible_and_field_coefficient_bound
Missing is the canonical split/quadratic/cubic-field decomposition of weighted cubic order coefficients, h2(F), and the ST.3 uniform field-count comparison on number-field discriminant carriers.

AnalyticNumberTheory:AN.8/cubic-reflected-bound — TauCeti.SeveralVariableZeta.cubic_reflected_bound
Missing are canonical xi_hat, the ordinary/dual comparison, h2(F) and absolute field discriminant D. The stated exponents and pole exclusion are explicit; arbitrary complex-function bounds would omit these hypotheses.

AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity — TauCeti.SeveralVariableZeta.cubic_pole_cleared_convexity
Missing is the canonical entire pole-cleared ordinary cubic function with its established order-one estimate and number-field discriminant normalization; AN.5 supplies the uniform Gamma and Phragmen-Lindelof adapter.

AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl — TauCeti.SpectralZeta.compact_spectrum_and_weyl
HeatAsymptotics has actual monotone eigenvalues, counts and expansion. AS.4 must construct that data from the scalar Laplacian of the imported compact oriented hyperbolic surface and identify multiplicities and its simple zero.

AnalyticNumberTheory:AN.9/heat-subtracted-holomorphy — TauCeti.SpectralZeta.heat_subtracted_holomorphy
heat_small_time_subtraction and spectral_continuation_exists are native. The omitted intermediate signature gives the precise locally uniform holomorphy of the actual remainder integral on Re z>-N, with quantitative compact-dependent derivative bounds.

AnalyticNumberTheory:AN.9/selberg-geodesic-majorant — TauCeti.SpectralZeta.selberg_geodesic_majorant
Selberg is native for actual length data. AS.6 must identify its index with primitive conjugacy classes and provide positive systole, finite counts, exponential growth and the selected orientation convention.

AnalyticNumberTheory:AN.9/selberg-log-product — TauCeti.SpectralZeta.selberg_log_product
Selberg.log_derivative is native under an actual convergence condition. The stronger leaf proves compact-normal convergence and the logarithmic product expansion from the canonical primitive geodesic count and systole.

AnalyticNumberTheory:AN.9/scalar-heat-trace-formula — TauCeti.SpectralZeta.scalar_heat_trace_formula
Missing is the actual scalar Laplacian heat data and matching primitive geodesic index from AS.4/AS.6, plus the Gaussian trace-test adapter. No generic sequence and length fields are asserted to satisfy the geometric identity.

AnalyticNumberTheory:AN.9/selberg-transform-normal-convergence — TauCeti.SpectralZeta.selberg_transform_normal_convergence
Missing is the canonical hyperbolic heat summand and its geometric count majorant, sufficient to state joint compact-normal z,s convergence on the restricted Laplace cone.

AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin — TauCeti.SpectralZeta.hyperbolic_laplace_mellin
selberg_laplace_integral is native with Re w>0 and Re(w^2)>0. Missing is its identification with the actual Gaussian hyperbolic trace sum, justified by the stronger geometric counting cone and the same primitive orientation.

AnalyticNumberTheory:AN.9/identity-barnes-transform — TauCeti.SpectralZeta.identity_barnes_transform
scalarIdentity is native for supplied actual Barnes G. AN.7 must supply the normalized G, its original derivative/asymptotic proof and the geometric identity heat-transform comparison; recurrence alone is insufficient.

AnalyticNumberTheory:AN.9/shifted-zeta-holomorphic — TauCeti.SpectralZeta.shifted_zeta_holomorphic
SpectralContinuation has actual shifted meromorphic functions and right-half-plane agreement. Missing is a native joint holomorphy carrier in the complex shift u and Mellin z, with the principal-logarithm cut and parameter derivatives.

AnalyticNumberTheory:AN.9/selberg-identity-germ — TauCeti.SpectralZeta.scalar_identity_germ
scalarIdentity states the single-valued integer-power formula. Missing is the actual normalized Barnes G continuation and equality to its logarithmic heat-transform formula as meromorphic germs.

AnalyticNumberTheory:AN.9/selberg-determinant-comparison — TauCeti.SpectralZeta.selberg_determinant_comparison
ShiftedDet and scalarIdentity are native separately. Missing is the canonical geometric equality involving the scalar Laplacian, primitive-geodesic continued Z and normalized Barnes G, with the v2 constant fixed by their asymptotics.

AnalyticNumberTheory:AN.9/selberg-identity-nonvanishing — TauCeti.SpectralZeta.selberg_identity_nonvanishing
Missing is the normalized Barnes G zero divisor and Gamma-unit comparison needed for the canonical identity factor; its order 2g-2 pole at zero is retained in the mathematical target.

AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison — TauCeti.SpectralZeta.selberg_spectral_zero_comparison
shifted_zero_divisor and spectral_pullback_order are native exact statements for actual eigenvalues and determinant functions. The missing geometric comparison identifies those zeros with canonical Selberg Z and separates the identity-factor endpoint orders.

AnalyticNumberTheory:AN.9/bc-prime-pair-ratio — TauCeti.BostConnes.bc_prime_pair_ratio
Missing is the exact prime-pair sequence construction with disjoint coordinates, quantitative ratio limit and divergent weighted source masses, using the AN.2 fixed-progression PNT contract.

AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio — TauCeti.BostConnes.bc_valuation_tail_ratio
ScalingMeasure.local_shell is native. Missing is the canonical two-prime cylinder swap on the local product and its target-evaluated pushforward derivative; the forward and inverse rational maps have different stated powers.

AnalyticNumberTheory:AN.9/bc-prime-pairs-congruence — TauCeti.BostConnes.prime_pair_congruence_ratio
prime_progression_reciprocal_diverges is native. The stronger missing leaf constructs disjoint pairs in congruence classes with matching proportional intervals and divergent source masses, uniformly avoiding any prescribed finite prime set.

AnalyticNumberTheory:AN.9/bc-asymptotic-ratio-inclusion — TauCeti.BostConnes.asymptotic_ratio_mem
RatioSet is native for actual actions and densities. OP2-ratio must supply the finite-block product equivalence relation, independent swaps and the asymptotic-ratio inclusion theorem with its precise recurrence assumptions.

AnalyticNumberTheory:AN.9/bc-ratio-unit-lifting — TauCeti.BostConnes.ratio_witness_unit_lift
Missing is the actual adelic cylinder coordinate map from the canonical product measure and profinite units. It connects congruent prime swaps to the full adelic action and its essential-ratio witnesses.

AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set — TauCeti.BostConnes.bc_full_positive_ratio_set
canonical_ratio_set is native on FiniteAdeles with the explicit target density q^beta. The additional leaf is its canonical prime/cylinder witness proof; that proof is recorded in the packet rather than a second named native theorem.

AnalyticNumberTheory:AN.9/bc-ergodic-crossed-product-factor — TauCeti.BostConnes.ergodic_crossed_product_factor
The sigma-finite group-measure-space von Neumann algebra and its center theorem are missing OP2-factor carriers. No C*-closed operator algebra is substituted for the GNS von Neumann factor.

AnalyticNumberTheory:AN.9/bc-ratio-factor-type — TauCeti.BostConnes.ratio_set_type_three_one
Missing are the operator-theoretic TypeIII1 predicate, flow of weights and the OP2-factor ratio-set classification theorem for the actual measured crossed product.

AnalyticNumberTheory:AN.9/bc-full-corner-type — TauCeti.BostConnes.full_corner_type_three_one
Missing are the group-measure-space factor, its von Neumann corner and the completed-state GNS compression equivalence, plus the nonzero-corner type invariance theorem from OP2-factor.

AnalyticNumberTheory:AN.9/bc-type-three-one — TauCeti.BostConnes.bc_type_three_one
The actual GNS von Neumann algebra and TypeIII1 predicate are missing OP2-factor objects; native canonical_ratio_set and completed state classification provide arithmetic inputs only.

AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry — TauCeti.BostConnes.bc_arithmetic_values_and_symmetry
groundState and groundState_galois are native on the core. The stronger target needs the canonical cyclotomic subfield Qcycl, its generated-field comparison and the completed unit/cyclotomic restriction intertwining map.

AnalyticNumberTheory:AN.8/cubic-residue-one — TauCeti.SeveralVariableZeta.cubic_residue_one
CubicContinuation.residue_one is native as 6 C(1). The omitted arithmetic evaluation identifies C(1) with the actual zeta_F residue, signature and discriminant-normalized AF, rather than a supplied complex constant.

AnalyticNumberTheory:AN.8/cubic-residue-five-sixths — TauCeti.SeveralVariableZeta.cubic_residue_five_sixths
CubicContinuation.residue_five_sixths is native as -6 C(5/6). The omitted arithmetic evaluation identifies that value with BF times 3^(-r_alpha/2), on the canonical number-field zeta and signature carriers.

-/
