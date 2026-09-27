/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/DrinfeldModulesAndTModules--DM.8.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. All proofs are placeholders; no implementation is claimed.

Bounded component of Papanikolas, arXiv:math/0506078v2, Lemma 3.3.7,
Proposition 3.3.8 and the coordinate argument of Lemma 4.1.6.
The actual pre-t-motive, analytic field, tensor category, Galois group and
specialization/logarithm results are missing interfaces recorded in the packet.
-/
import Mathlib.LinearAlgebra.FixedSubmodule
import Mathlib.LinearAlgebra.LinearIndependent.Lemmas
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Complex.Module

open scoped TensorProduct
open Module

namespace TauCeti.Difference.FixedVectors

variable {F L V : Type*} [Field F] [Field L] [Algebra F L]
  [AddCommGroup V] [Module F V] [Module L V] [IsScalarTower F L V]

/-- DM.8/fixed-coefficients. Coefficients in an independent fixed family are fixed. -/
lemma fixed_coefficients (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    {ι : Type*} [Fintype ι] (v : ι → V)
    (hv : ∀ i, f (v i) = v i) (hli : LinearIndependent L v)
    (c : ι → L) (hc : f (∑ i, c i • v i) = ∑ i, c i • v i) :
    ∀ i, σ (c i) = c i := by sorry

/-- DM.8/fixed-span-descent. Equality of constants is an essential hypothesis. -/
lemma fixed_mem_span_iff (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    {ι : Type*} [Fintype ι] (v : ι → V)
    (hv : ∀ i, f (v i) = v i) (hli : LinearIndependent L v)
    (w : V) (hw : f w = w) :
    w ∈ Submodule.span L (Set.range v) ↔ w ∈ Submodule.span F (Set.range v) := by sorry

/-- DM.8/finite-fixed-independence. Induct on n using fixed-span descent. -/
lemma linearIndependent_fin_of_fixed (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    {n : ℕ} (v : Fin n → V) (hv : ∀ i, f (v i) = v i)
    (hli : LinearIndependent F v) : LinearIndependent L v := by sorry

/-- DM.8/fixed-independence. Papanikolas Lemma 3.3.7, without a finiteness restriction. -/
theorem linearIndependent_of_fixed (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    {ι : Type*} (v : ι → V) (hv : ∀ i, f (v i) = v i)
    (hli : LinearIndependent F v) : LinearIndependent L v := by sorry

/-- DM.8/betti-comparison-injective. The map itself is already in Mathlib. -/
lemma bettiComparison_injective (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a) :
    Function.Injective (f.fixedSubmodule.subtype.liftBaseChange L) := by sorry

/-- DM.8/fixed-space-finite. No finite-dimensional hypothesis over F on V is assumed. -/
lemma finite_fixedSubmodule (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    [FiniteDimensional L V] : FiniteDimensional F f.fixedSubmodule := by sorry

/-- DM.8/fixed-dimension-bound. Papanikolas Proposition 3.3.8, inequality. -/
lemma finrank_fixedSubmodule_le (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    [FiniteDimensional L V] : finrank F f.fixedSubmodule ≤ finrank L V := by sorry

/-- DM.8/betti-comparison-dimension. Papanikolas Proposition 3.3.8, equality criterion. -/
theorem bettiComparison_bijective_iff (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    [FiniteDimensional L V] :
    Function.Bijective (f.fixedSubmodule.subtype.liftBaseChange L) ↔
      finrank F f.fixedSubmodule = finrank L V := by sorry

/-- DM.8/fixed-basis-coordinates. Fixed vectors have unique constant coordinates. -/
lemma fixed_iff_existsUnique_coordinates (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ (a : L) (v : V), f (a • v) = σ a • f v)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    {ι : Type*} [Fintype ι] (b : Basis ι L V) (hb : ∀ i, f (b i) = b i)
    (w : V) :
    f w = w ↔ ∃! c : ι → F, ∑ i, (algebraMap F L (c i)) • b i = w := by sorry

-- Acceptance: complex_conjugation_constants.
example : ∀ z : ℂ, Complex.conjAe z = z ↔ ∃ r : ℝ, algebraMap ℝ ℂ r = z := by sorry

-- Acceptance: complex_conjugation_fixed_space (native fixedSubmodule agrees with real axis).
example : (Complex.conjAe.toLinearMap.fixedSubmodule : Set ℂ) = {z : ℂ | z.im = 0} := by sorry

-- Acceptance: complex_conjugation_dimension.
example : finrank ℝ Complex.conjAe.toLinearMap.fixedSubmodule = 1 := by sorry

-- Acceptance: complex_conjugation_comparison.
example : Function.Bijective
    (Complex.conjAe.toLinearMap.fixedSubmodule.subtype.liftBaseChange ℂ) := by sorry

-- Acceptance: identity_comparison. The source is a native tensor product of a submodule.
example : Function.Bijective
    ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).fixedSubmodule.subtype.liftBaseChange ℚ) := by sorry

-- Acceptance: zero_dimensional_comparison.
example : Function.Bijective
    ((LinearMap.id : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)).fixedSubmodule.subtype.liftBaseChange ℚ) := by sorry

-- Acceptance: invertible_operator_without_fixed_vectors.
example : ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).fixedSubmodule = ⊥ := by sorry

-- Acceptance: invertibility_does_not_imply_triviality. Multiplication by 2 is invertible.
example : ¬ Function.Surjective
    (((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)).fixedSubmodule.subtype.liftBaseChange ℚ) := by sorry

-- Acceptance: smaller_constant_field_fails. With sigma=id on C, R is too small.
example : LinearIndependent ℝ (fun i : Fin 2 => Complex.basisOneI i) ∧
    ¬ LinearIndependent ℂ (fun i : Fin 2 => Complex.basisOneI i) := by sorry

-- Acceptance: exact_constants_required.
example : ¬ (∀ z : ℂ, (AlgEquiv.refl : ℂ ≃ₐ[ℝ] ℂ) z = z ↔
    ∃ r : ℝ, algebraMap ℝ ℂ r = z) := by sorry

-- Acceptance: fixed_vector_hypothesis_required. 1,I cannot be fed to conjugation descent.
example : Complex.conjAe Complex.I ≠ Complex.I := by sorry

-- Acceptance: dependent_pair_is_rejected, even though both vectors are fixed by id.
example : ¬ LinearIndependent ℚ (fun _ : Fin 2 => (1 : ℚ)) := by sorry

#check LinearMap.fixedSubmodule
#check LinearMap.liftBaseChangeEquiv
#check Module.Basis.baseChange
#check LinearIndependent.finite
#check Module.finrank_baseChange
#check LinearMap.injective_iff_surjective_of_finrank_eq_finrank

end TauCeti.Difference.FixedVectors
