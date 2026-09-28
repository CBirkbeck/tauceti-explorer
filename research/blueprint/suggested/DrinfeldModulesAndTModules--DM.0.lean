/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude Code (cc-fb70e5)
-/
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Algebraic.Basic

/-!
# Suggested declarations for DM.0: twisted polynomials and Drinfeld modules

This file is a suggested signature skeleton, not the roadmap and not an exhaustive file plan.
The companion document `readmes/DrinfeldModulesAndTModules--DM.0.md` and the packet are
definitive; names and signatures here are suggestions. Every body is `sorry`. **This file has not
been elaborated:** the machine that wrote it has no build at the pinned commits (Mathlib 082e2d37,
Tau Ceti f7904748), so the first worker with such a build should elaborate it.

Design. `L{τ}` is Mathlib's `SkewPolynomial L`, whose twist is read from a
`MulSemiringAction (Multiplicative ℕ) L`. The q-power Frobenius action is supplied by
`frobeniusAction`, a `def` rather than an instance, and `TwistedPolynomial K L` builds its ring
structure with that action, so that the twist is part of the type and never becomes a global
instance on `L`. `K` plays the role of `F_q`.

Source: Brownawell–Papanikolas, *A rapid introduction to Drinfeld modules, t-modules, and
t-motives*, arXiv:1806.03919v1, §§2.1–2.4.
-/

noncomputable section

namespace TauCeti.Drinfeld

open Polynomial

section Frobenius

variable (K L : Type*) [Field K] [Fintype K] [CommRing L] [Algebra K L]

/-- DM.0/frobenius-action: `ofAdd n` acts by `x ↦ x ^ (q ^ n)`. Not an instance. -/
def frobeniusAction : MulSemiringAction (Multiplicative ℕ) L where
  smul n x := (⇑(FiniteField.frobeniusAlgHom K L))^[Multiplicative.toAdd n] x
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry
  smul_one := by sorry
  smul_mul := by sorry

theorem frobeniusAction_smul (n : ℕ) (x : L) :
    letI := frobeniusAction K L
    (Multiplicative.ofAdd n) • x = x ^ (Fintype.card K ^ n) := by
  sorry

theorem frobeniusAction_smul_algebraMap (n : ℕ) (c : K) :
    letI := frobeniusAction K L
    (Multiplicative.ofAdd n) • algebraMap K L c = algebraMap K L c := by
  sorry

theorem frobeniusAction_φ :
    letI := frobeniusAction K L
    (SkewPolynomial.φ : L →+* L) = (FiniteField.frobeniusAlgHom K L : L →+* L) := by
  sorry

/-- frobeniusAction.test_one -/
example (x : L) :
    letI := frobeniusAction K L
    (Multiplicative.ofAdd 1 : Multiplicative ℕ) • x = x ^ Fintype.card K := by sorry

/-- frobeniusAction.test_fixes_base -/
example (x : K) :
    letI := frobeniusAction K K
    (Multiplicative.ofAdd 1 : Multiplicative ℕ) • x = x := by sorry

/-- frobeniusAction.test_not_p_frobenius: over `F_4 ⊆ F_16` the action is `x ↦ x ^ 4`. -/
example (K L : Type*) [Field K] [Fintype K] [Field L] [Algebra K L] (hK : Fintype.card K = 4)
    (x : L) :
    letI := frobeniusAction K L
    (Multiplicative.ofAdd 1 : Multiplicative ℕ) • x = x ^ 4 := by sorry

end Frobenius

section Twisted

variable (K L : Type*) [Field K] [Fintype K] [CommRing L] [Algebra K L]

/-- DM.0/twisted-polynomial-ring: `L{τ}`, with `τ * a = a ^ q * τ`. -/
def TwistedPolynomial : Type _ := SkewPolynomial L

namespace TwistedPolynomial

instance : Ring (TwistedPolynomial K L) :=
  letI := frobeniusAction K L
  inferInstanceAs (Ring (SkewPolynomial L))

instance : Algebra K (TwistedPolynomial K L) := by sorry

variable {K L}

/-- The element `τ`. -/
def τ : TwistedPolynomial K L :=
  letI := frobeniusAction K L
  (SkewPolynomial.X : SkewPolynomial L)

/-- The constants. -/
def C : L →+* TwistedPolynomial K L :=
  letI := frobeniusAction K L
  (SkewPolynomial.CRingHom : L →+* SkewPolynomial L)

theorem τ_mul_C (a : L) : τ * C a = C (a ^ Fintype.card K) * (τ : TwistedPolynomial K L) := by
  sorry

theorem τ_pow_mul_C (n : ℕ) (a : L) :
    τ ^ n * C a = C (a ^ (Fintype.card K ^ n)) * (τ : TwistedPolynomial K L) ^ n := by
  sorry

theorem algebraMap_eq (c : K) :
    algebraMap K (TwistedPolynomial K L) c = C (algebraMap K L c) := by
  sorry

/-- The coefficient of `τ ^ n`. -/
def coeff (f : TwistedPolynomial K L) (n : ℕ) : L :=
  SkewPolynomial.coeff (f : SkewPolynomial L) n

theorem ext {f g : TwistedPolynomial K L} (h : ∀ n, f.coeff n = g.coeff n) : f = g := by
  sorry

/-- The τ-degree (`0` for `f = 0`). -/
def natDegree (f : TwistedPolynomial K L) : ℕ := by
  sorry

def leadingCoeff (f : TwistedPolynomial K L) : L :=
  f.coeff f.natDegree

theorem sum_C_mul_τ_pow (f : TwistedPolynomial K L) :
    f = ∑ i ∈ Finset.range (f.natDegree + 1), C (f.coeff i) * τ ^ i := by
  sorry

/-- The constant-coefficient ring homomorphism `∂`. -/
def constantCoeff : TwistedPolynomial K L →+* L := by
  sorry

@[simp] theorem constantCoeff_C (a : L) : constantCoeff (C a : TwistedPolynomial K L) = a := by
  sorry

@[simp] theorem constantCoeff_τ : constantCoeff (τ : TwistedPolynomial K L) = 0 := by
  sorry

theorem natDegree_C_add_τ (a : L) [Nontrivial L] :
    (C a + τ : TwistedPolynomial K L).natDegree = 1 := by
  sorry

/-- DM.0/tau-degree-mul. -/
theorem natDegree_mul [IsDomain L] {f g : TwistedPolynomial K L} (hf : f ≠ 0) (hg : g ≠ 0) :
    (f * g).natDegree = f.natDegree + g.natDegree := by
  sorry

/-- DM.0/tau-degree-mul: the leading coefficient is twisted. -/
theorem leadingCoeff_mul [IsDomain L] (f g : TwistedPolynomial K L) :
    (f * g).leadingCoeff =
      f.leadingCoeff * g.leadingCoeff ^ (Fintype.card K ^ f.natDegree) := by
  sorry

instance [IsDomain L] : NoZeroDivisors (TwistedPolynomial K L) := by
  sorry

theorem isUnit_iff [IsDomain L] {u : TwistedPolynomial K L} :
    IsUnit u ↔ ∃ c : L, IsUnit c ∧ u = C c := by
  sorry

/-- twistedPolynomial.test_trivial_twist: over `L = K` the twist is trivial. -/
example (a : K) : (τ : TwistedPolynomial K K) * C a = C a * τ := by sorry

/-- twistedPolynomial.test_constantCoeff_mul -/
example (a b : L) :
    constantCoeff ((C a + τ) * (C b + τ) : TwistedPolynomial K L) = a * b := by sorry

/-- twistedPolynomial.test_zero_degree -/
example : (0 : TwistedPolynomial K L).natDegree = 0 ∧
    (0 : TwistedPolynomial K L).leadingCoeff = 0 := by sorry

/-- twistedPolynomial.test_noncommutative: over `F_2 ⊆ F_4`, `τ * C ω ≠ C ω * τ`. -/
example (K L : Type*) [Field K] [Fintype K] [Field L] [Algebra K L] (hK : Fintype.card K = 2)
    (ω : L) (hω : ω ^ 2 = ω + 1) :
    (τ : TwistedPolynomial K L) * C ω ≠ C ω * τ := by sorry

end TwistedPolynomial

end Twisted

section Evaluation

variable {K L : Type*} [Field K] [Fintype K] [CommRing L] [Algebra K L]

open TwistedPolynomial

/-- DM.0/twisted-polynomial-eval: `L{τ} → End_K(L)`. -/
def evalEnd : TwistedPolynomial K L →ₐ[K] Module.End K L := by
  sorry

theorem evalEnd_apply (f : TwistedPolynomial K L) (x : L) :
    evalEnd f x = ∑ i ∈ Finset.range (f.natDegree + 1), f.coeff i * x ^ (Fintype.card K ^ i) := by
  sorry

@[simp] theorem evalEnd_τ :
    evalEnd (τ : TwistedPolynomial K L) = (FiniteField.frobeniusAlgHom K L).toLinearMap := by
  sorry

@[simp] theorem evalEnd_C (a : L) :
    evalEnd (C a : TwistedPolynomial K L) = a • LinearMap.id := by
  sorry

/-- The q-polynomial `Σ aᵢ X ^ (q ^ i)` of a twisted polynomial. -/
def toPolynomial (f : TwistedPolynomial K L) : L[X] :=
  ∑ i ∈ Finset.range (f.natDegree + 1), monomial (Fintype.card K ^ i) (f.coeff i)

theorem toPolynomial_mul (f g : TwistedPolynomial K L) :
    toPolynomial (f * g) = (toPolynomial f).comp (toPolynomial g) := by
  sorry

theorem eval_toPolynomial (f : TwistedPolynomial K L) (x : L) :
    (toPolynomial f).eval x = evalEnd f x := by
  sorry

theorem natDegree_toPolynomial [IsDomain L] {f : TwistedPolynomial K L} (hf : f ≠ 0) :
    (toPolynomial f).natDegree = Fintype.card K ^ f.natDegree := by
  sorry

theorem derivative_toPolynomial (f : TwistedPolynomial K L) :
    derivative (toPolynomial f) = Polynomial.C (constantCoeff f) := by
  sorry

/-- DM.0/twisted-polynomial-eval-injective. -/
theorem toPolynomial_injective :
    Function.Injective (toPolynomial : TwistedPolynomial K L → L[X]) := by
  sorry

/-- DM.0/twisted-polynomial-eval-injective. -/
theorem evalEnd_injective [IsDomain L] [Infinite L] :
    Function.Injective (evalEnd : TwistedPolynomial K L →ₐ[K] Module.End K L) := by
  sorry

/-- DM.0/additive-polynomial-characterisation: `F_q`-linear polynomials are q-polynomials. -/
theorem isFqLinear_iff {L : Type*} [Field L] [Infinite L] [Algebra K L] (P : L[X]) :
    ((∀ x y : L, P.eval (x + y) = P.eval x + P.eval y) ∧
        ∀ (c : K) (x : L), P.eval (c • x) = c • P.eval x) ↔
      P ∈ Set.range (toPolynomial : TwistedPolynomial K L → L[X]) := by
  sorry

/-- evalEnd.test_carlitz_t -/
example (θ x : L) : evalEnd (C θ + τ : TwistedPolynomial K L) x = θ * x + x ^ Fintype.card K := by
  sorry

/-- evalEnd.test_finite_field_kernel -/
example : evalEnd (τ - 1 : TwistedPolynomial K K) = 0 ∧ (τ - 1 : TwistedPolynomial K K) ≠ 0 := by
  sorry

/-- toPolynomial.test_composition -/
example (a : L) : toPolynomial (τ * C a : TwistedPolynomial K L) =
    (X ^ Fintype.card K : L[X]).comp (Polynomial.C a * X) := by sorry

/-- toPolynomial.test_separable -/
example : derivative (toPolynomial (τ : TwistedPolynomial K L)) = 0 := by sorry

end Evaluation

section Drinfeld

variable (K : Type*) [Field K] [Fintype K]
variable (A : Type*) [CommRing A] [Algebra K A]
variable {L : Type*} [Field L] [Algebra K L]

open TwistedPolynomial

/-- DM.0/drinfeld-module: a Drinfeld `A`-module over `(L, γ)`. -/
structure DrinfeldModule (γ : A →ₐ[K] L) where
  toAlgHom : A →ₐ[K] TwistedPolynomial K L
  constantCoeff_apply' : ∀ a, constantCoeff (toAlgHom a) = γ a
  nonconstant : ∃ a, 0 < (toAlgHom a).natDegree

namespace DrinfeldModule

variable {K A} {γ : A →ₐ[K] L}

instance instFunLike : FunLike (DrinfeldModule K A γ) A (TwistedPolynomial K L) where
  coe φ := φ.toAlgHom
  coe_injective' := by sorry

@[ext] theorem ext {φ ψ : DrinfeldModule K A γ} (h : ∀ a, φ a = ψ a) : φ = ψ := by sorry

theorem ext_polynomial {γ : K[X] →ₐ[K] L} {φ ψ : DrinfeldModule K K[X] γ} (h : φ X = ψ X) :
    φ = ψ := by
  sorry

theorem constantCoeff_apply (φ : DrinfeldModule K A γ) (a : A) : constantCoeff (φ a) = γ a :=
  φ.constantCoeff_apply' a

@[simp] theorem map_algebraMap (φ : DrinfeldModule K A γ) (c : K) :
    φ (algebraMap K A c) = C (algebraMap K L c) := by
  sorry

/-- The characteristic ideal; it depends only on `γ`. -/
def charIdeal (_φ : DrinfeldModule K A γ) : Ideal A := RingHom.ker γ

def IsGenericChar (_φ : DrinfeldModule K A γ) : Prop := Function.Injective γ

/-- The `A`-module `(φ, L)`. -/
def Points (_φ : DrinfeldModule K A γ) : Type _ := L

instance (φ : DrinfeldModule K A γ) : AddCommGroup φ.Points := by
  unfold Points; infer_instance

instance (φ : DrinfeldModule K A γ) : Module A φ.Points := by sorry

theorem smul_def (φ : DrinfeldModule K A γ) (a : A) (x : φ.Points) :
    a • x = (evalEnd (φ a) (x : L) : L) := by
  sorry

/-- Base change along a field extension `L → L'`. -/
def baseChange (φ : DrinfeldModule K A γ) (L' : Type*) [Field L'] [Algebra K L'] (f : L →ₐ[K] L') :
    DrinfeldModule K A (f.comp γ) := by
  sorry

/-- `φ` is defined over the subfield `k'` when every `φ a` has coefficients in `k'`. -/
def IsDefinedOver (φ : DrinfeldModule K A γ) (k' : Subfield L) : Prop :=
  ∀ a n, (φ a).coeff n ∈ k'

/-- DM.0/rank (for `A = K[X]`; for general `A` the rank is the `r` of DM.0/rank-general, which
awaits FunctionFieldArithmetic:FA.1's ring `A` and degree). -/
def rank {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) : ℕ := (φ X).natDegree

theorem rank_eq_natDegree_X {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) :
    φ.rank = (φ X).natDegree := rfl

theorem rank_pos {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) : 1 ≤ φ.rank := by sorry

/-- DM.0/rank-polynomial-ring. -/
theorem natDegree_apply {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) {a : K[X]} (ha : a ≠ 0) :
    (φ a).natDegree = φ.rank * a.natDegree := by
  sorry

/-- DM.0/rank-polynomial-ring: the leading coefficient of `φ a`. -/
theorem leadingCoeff_apply_polynomial {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ)
    {a : K[X]} (ha : a ≠ 0) :
    (φ a).leadingCoeff = algebraMap K L a.leadingCoeff *
      (φ X).leadingCoeff ^ (∑ i ∈ Finset.range a.natDegree, Fintype.card K ^ (φ.rank * i)) := by
  sorry

theorem natDegree_toPolynomial_apply {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) {a : K[X]}
    (ha : a ≠ 0) :
    (toPolynomial (φ a)).natDegree = Fintype.card K ^ (φ.rank * a.natDegree) := by
  sorry

theorem rank_baseChange {γ : K[X] →ₐ[K] L} (φ : DrinfeldModule K K[X] γ) (L' : Type*) [Field L']
    [Algebra K L'] (f : L →ₐ[K] L') : (φ.baseChange L' f).rank = φ.rank := by
  sorry

/-- DM.0/drinfeld-module-hom: morphisms `φ → ψ`. -/
def Hom (φ ψ : DrinfeldModule K A γ) : Submodule K (TwistedPolynomial K L) where
  carrier := {u | ∀ a, u * φ a = ψ a * u}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

theorem mem_Hom {φ ψ : DrinfeldModule K A γ} {u : TwistedPolynomial K L} :
    u ∈ Hom φ ψ ↔ ∀ a, u * φ a = ψ a * u := Iff.rfl

theorem Hom.comp_mem {φ ψ χ : DrinfeldModule K A γ} {u v : TwistedPolynomial K L}
    (hv : v ∈ Hom ψ χ) (hu : u ∈ Hom φ ψ) : v * u ∈ Hom φ χ := by
  sorry

theorem Hom.smul_mem {φ ψ : DrinfeldModule K A γ} {u : TwistedPolynomial K L} (hu : u ∈ Hom φ ψ)
    (a : A) : ψ a * u ∈ Hom φ ψ := by
  sorry

/-- The endomorphism ring. -/
def End (φ : DrinfeldModule K A γ) : Subring (TwistedPolynomial K L) where
  carrier := {u | u ∈ Hom φ φ}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

theorem apply_mem_End (φ : DrinfeldModule K A γ) (a : A) : φ a ∈ φ.End := by sorry

def IsIsogeny (φ ψ : DrinfeldModule K A γ) (u : TwistedPolynomial K L) : Prop :=
  u ∈ Hom φ ψ ∧ u ≠ 0

theorem isIso_iff {φ ψ : DrinfeldModule K A γ} {u : TwistedPolynomial K L} (hu : IsUnit u) :
    u ∈ Hom φ ψ ↔ ∃ c : L, c ≠ 0 ∧ u = C c ∧ ∀ a, ψ a = C c * φ a * C c⁻¹ := by
  sorry

/-- DM.0/isogeny-rank. -/
theorem rank_eq_of_isogeny {γ : K[X] →ₐ[K] L} {φ ψ : DrinfeldModule K K[X] γ}
    {u : TwistedPolynomial K L} (hu : IsIsogeny φ ψ u) : φ.rank = ψ.rank := by
  sorry

end DrinfeldModule

/-- DM.0/carlitz-module: `t ↦ θ + τ` over `γ = aeval θ`. -/
def carlitz (θ : L) : DrinfeldModule K K[X] (aeval θ) where
  toAlgHom := aeval (C θ + τ : TwistedPolynomial K L)
  constantCoeff_apply' := by sorry
  nonconstant := by sorry

variable {K}

@[simp] theorem carlitz_X (θ : L) : carlitz K θ X = C θ + τ := by sorry

theorem carlitz_constantCoeff (θ : L) (a : K[X]) : constantCoeff (carlitz K θ a) = aeval θ a := by
  sorry

theorem carlitz_rank (θ : L) : (carlitz K θ).rank = 1 := by sorry

theorem carlitz_leadingCoeff (θ : L) (a : K[X]) :
    (carlitz K θ a).leadingCoeff = algebraMap K L a.leadingCoeff := by
  sorry

theorem carlitz_smul_X (θ : L) (x : (carlitz K θ).Points) :
    (X : K[X]) • x = (θ * (x : L) + (x : L) ^ Fintype.card K : L) := by
  sorry

theorem carlitz_isGenericChar_iff (θ : L) :
    (carlitz K θ).IsGenericChar ↔ Transcendental K θ := by
  sorry

/-! Unit tests for the definitions, named as in the packet. -/

/-- drinfeldModule.test_rank_two: `t ↦ θ + g τ + Δ τ²` with `Δ ≠ 0` is a Drinfeld module. -/
example (θ g Δ : L) (hΔ : Δ ≠ 0) :
    ∃ φ : DrinfeldModule K K[X] (aeval θ), φ X = C θ + C g * τ + C Δ * τ ^ 2 := by sorry

/-- drinfeldModule.test_special_char -/
example : ∃ φ : DrinfeldModule K K[X] (aeval (0 : L)), φ X = τ ∧ ¬ φ.IsGenericChar := by sorry

/-- drinfeldModule.test_constant_not_module -/
example (γ : K[X] →ₐ[K] L) :
    ¬ ∃ φ : DrinfeldModule K K[X] γ, ∀ a, φ a = C (γ a) := by sorry

/-- drinfeldModule.test_constant_coeff_rigid -/
example (θ : L) : ¬ ∃ φ : DrinfeldModule K K[X] (aeval θ), φ X = C (θ + 1) + τ := by sorry

/-- drinfeldModule.test_points_smul -/
example (θ : L) (x : (carlitz K θ).Points) :
    (X : K[X]) • x = (θ * (x : L) + (x : L) ^ Fintype.card K : L) := by sorry

/-- rank.test_carlitz -/
example (θ : L) : (carlitz K θ).rank = 1 := by sorry

/-- rank.test_two -/
example (θ g Δ : L) (hΔ : Δ ≠ 0) (φ : DrinfeldModule K K[X] (aeval θ))
    (hφ : φ X = C θ + C g * τ + C Δ * τ ^ 2) : φ.rank = 2 := by sorry

/-- rank.test_top_coefficient -/
example (θ g : L) (hg : g ≠ 0) (φ : DrinfeldModule K K[X] (aeval θ))
    (hφ : φ X = C θ + C g * τ + C 0 * τ ^ 2) : φ.rank = 1 := by sorry

/-- rank.test_kernel_degree -/
example (θ : L) : (toPolynomial (carlitz K θ (X ^ 2))).natDegree = Fintype.card K ^ 2 := by sorry

/-- carlitz.test_t_squared -/
example (θ : L) :
    carlitz K θ (X ^ 2) = C (θ ^ 2) + C (θ + θ ^ Fintype.card K) * τ + τ ^ 2 := by sorry

/-- carlitz.test_special_char -/
example : carlitz K (0 : L) X = τ ∧
    toPolynomial (carlitz K (0 : L) X) = X ^ Fintype.card K := by sorry

/-- carlitz.test_torsion_count -/
example [IsAlgClosed L] (θ : L) (hθ : θ ≠ 0) :
    ((toPolynomial (carlitz K θ X)).roots.toFinset.card) = Fintype.card K := by sorry

/-- carlitz.test_not_minus_convention (q odd) -/
example (θ : L) (hq : Odd (Fintype.card K)) : carlitz K θ X ≠ C θ - τ := by sorry

/-- hom.test_apply_mem_End -/
example (θ : L) (a : K[X]) : carlitz K θ a ∈ (carlitz K θ).End := by sorry

/-- hom.test_constant_endomorphisms -/
example (θ c : L) : C c ∈ (carlitz K θ).End ↔ c ^ Fintype.card K = c := by sorry

/-- hom.test_different_rank_zero -/
example (θ : L) (ψ : DrinfeldModule K K[X] (aeval θ)) (hψ : ψ.rank = 2) :
    DrinfeldModule.Hom (carlitz K θ) ψ = ⊥ := by sorry

/-- hom.test_frobenius_endomorphism: over `L = K`, `τ` is an endomorphism of the Carlitz module. -/
example (θ : K) : (τ : TwistedPolynomial K K) ∈ (carlitz K θ).End := by sorry

end Drinfeld

end TauCeti.Drinfeld
