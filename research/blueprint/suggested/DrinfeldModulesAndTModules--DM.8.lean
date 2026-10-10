/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/DrinfeldModulesAndTModules--DM.8.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. All proofs are placeholders; no implementation is claimed.

The retained fixed-vector component is followed by native analytic-series,
matrix, solution-ring and degree-span interfaces. Category-valued supplier
signatures that cannot yet be stated are enumerated at the end of the file.
-/
import Mathlib.LinearAlgebra.FixedSubmodule
import Mathlib.LinearAlgebra.LinearIndependent.Lemmas
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Complex.Module

import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Nilpotent.GeometricallyReduced
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Basic
import Mathlib.RingTheory.AlgebraicIndependent.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Category.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Smooth.GeometricallyReduced

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

namespace TauCeti.Difference.Periods

open scoped TensorProduct
open Module

noncomputable section

section Twist
variable {C : Type*} [CommRing C]

/-- DM.8/coefficient-twist: changes coefficients and fixes the variable. -/
def twistSeries (σ : C ≃+* C) : PowerSeries C ≃+* PowerSeries C where
  toFun := PowerSeries.map σ.toRingHom
  invFun := PowerSeries.map σ.symm.toRingHom
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry

lemma twist_coeff (σ : C ≃+* C) (f : PowerSeries C) (n : ℕ) :
    PowerSeries.coeff n (twistSeries σ f) = σ (PowerSeries.coeff n f) := by sorry
lemma twist_X (σ : C ≃+* C) : twistSeries σ PowerSeries.X = PowerSeries.X := by sorry
lemma twist_C (σ : C ≃+* C) (a : C) :
    twistSeries σ (PowerSeries.C a) = PowerSeries.C (σ a) := by sorry
lemma twist_mul (σ : C ≃+* C) (f g : PowerSeries C) :
    twistSeries σ (f * g) = twistSeries σ f * twistSeries σ g := by sorry
lemma twist_matrix_mul {ι κ η : Type*} [Fintype κ] (σ : C ≃+* C)
    (A : Matrix ι κ (PowerSeries C)) (B : Matrix κ η (PowerSeries C)) :
    (A * B).map (twistSeries σ) = A.map (twistSeries σ) * B.map (twistSeries σ) := by sorry
lemma twist_inverse (σ : C ≃+* C) (f : PowerSeries C) :
    twistSeries σ.symm (twistSeries σ f) = f := by sorry

-- TauCeti.Difference.Periods.test_coefficient_twist_1
example (σ : C ≃+* C) : twistSeries σ PowerSeries.X = PowerSeries.X := by sorry
-- TauCeti.Difference.Periods.test_coefficient_twist_2
example (σ : C ≃+* C) (a : C) (ha : σ a ≠ a) :
    twistSeries σ (PowerSeries.C a) ≠ PowerSeries.C a := by sorry
-- TauCeti.Difference.Periods.test_coefficient_twist_3
example (σ : C ≃+* C) (a b : C) :
    twistSeries σ ((PowerSeries.X - PowerSeries.C a) * (PowerSeries.X - PowerSeries.C b)) =
      (PowerSeries.X - PowerSeries.C (σ a)) * (PowerSeries.X - PowerSeries.C (σ b)) := by sorry
end Twist

section Entire
variable (k kinf C : Type*) [Field k] [Field kinf] [NormedField C]
  [Algebra k kinf] [Algebra k C] [Algebra kinf C] [IsScalarTower k kinf C]
  [IsUltrametricDist C] [CompleteSpace C]

/-- DM.8/entire-series. The coefficient-field finiteness condition is essential. -/
def entireSubring : Subring (PowerSeries C) where
  carrier := {f | (∀ n, IsAlgebraic k (PowerSeries.coeff n f)) ∧
    (∀ r : ℝ, 0 < r → PowerSeries.IsRestricted r f) ∧
    FiniteDimensional kinf (IntermediateField.adjoin kinf
      (Set.range (fun n => PowerSeries.coeff n f)))}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

lemma entire_mem (f : PowerSeries C) : f ∈ entireSubring k kinf C ↔
    (∀ n, IsAlgebraic k (PowerSeries.coeff n f)) ∧
    (∀ r : ℝ, 0 < r → PowerSeries.IsRestricted r f) ∧
    FiniteDimensional kinf (IntermediateField.adjoin kinf
      (Set.range (fun n => PowerSeries.coeff n f))) := by sorry

/-- Evaluation is a ring homomorphism, not a formal-series substitution at an arbitrary point. -/
def entire_eval (z : C) : entireSubring k kinf C →+* C where
  toFun f := ∑' n : ℕ, PowerSeries.coeff n f.val * z ^ n
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

lemma entire_polynomial (f : Polynomial C) (hf : ∀ n, IsAlgebraic k (f.coeff n)) :
    (f : PowerSeries C) ∈ entireSubring k kinf C := by sorry
lemma entire_restricted (f : entireSubring k kinf C) :
    f.val ∈ PowerSeries.IsRestricted.subring (R := C) 1 := by sorry
lemma entire_eval_polynomial (z : C) (f : Polynomial C)
    (hf : ∀ n, IsAlgebraic k (f.coeff n)) :
    entire_eval k kinf C z ⟨f, entire_polynomial k kinf C f hf⟩ = f.eval z := by sorry

-- TauCeti.Difference.Periods.test_entire_series_1
example (z : C) : entire_eval k kinf C z 0 = 0 := by sorry
-- TauCeti.Difference.Periods.test_entire_series_2
example (a z : C) (ha : IsAlgebraic k a) :
    ∃ h : PowerSeries.C a ∈ entireSubring k kinf C,
      entire_eval k kinf C z ⟨PowerSeries.C a, h⟩ = a := by sorry
-- TauCeti.Difference.Periods.test_entire_series_3
example : PowerSeries.mk (fun _ : ℕ => (1 : C)) ∉ entireSubring k kinf C := by sorry
end Entire

section Rigid
variable {F L V : Type*} [Field F] [Field L] [Algebra F L]
  [AddCommGroup V] [Module F V] [Module L V] [IsScalarTower F L V]

/-- DM.8/rigid-triviality, using the native fixed submodule and native base-change map. -/
def IsRigidTrivial (f : V →ₗ[F] V) : Prop :=
  Function.Bijective (f.fixedSubmodule.subtype.liftBaseChange L)

lemma rigid_iff (f : V →ₗ[F] V) : IsRigidTrivial (L := L) f ↔
    Function.Bijective (f.fixedSubmodule.subtype.liftBaseChange L) := by sorry
lemma rigid_finrank (σ : L ≃ₐ[F] L) (f : V →ₗ[F] V)
    (hs : ∀ a v, f (a • v) = σ a • f v)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    [FiniteDimensional L V] : IsRigidTrivial (L := L) f ↔
      finrank F f.fixedSubmodule = finrank L V := by sorry
lemma rigid_invariant {W : Type*} [AddCommGroup W] [Module F W] [Module L W]
    [IsScalarTower F L W] (f : V →ₗ[F] V) (g : W →ₗ[F] W)
    (e : V ≃ₗ[L] W) (he : ∀ v, e (f v) = g (e v)) :
    IsRigidTrivial (L := L) f ↔ IsRigidTrivial (L := L) g := by sorry

-- TauCeti.Difference.Periods.test_rigid_triviality_1
example : IsRigidTrivial (L := ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry
-- TauCeti.Difference.Periods.test_rigid_triviality_2
example : IsRigidTrivial (L := ℚ) (LinearMap.id : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)) := by sorry
-- TauCeti.Difference.Periods.test_rigid_triviality_3
example : ¬ IsRigidTrivial (L := ℚ) ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) := by sorry
end Rigid

section Fields
variable {F K L : Type*} [Field F] [Field K] [Field L]
  [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]

/-- DM.8/admissible-fields. Geometric reducedness is general separability here.
Algebra.IsSeparable would additionally force algebraicity, and is inappropriate. -/
def IsAdmissible (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L) : Prop :=
  (∀ a, σL (algebraMap K L a) = algebraMap K L (σK a)) ∧
  (∀ a : K, σK a = a ↔ ∃ c : F, algebraMap F K c = a) ∧
  (∀ a : L, σL a = a ↔ ∃ c : F, algebraMap F L c = a) ∧
  Algebra.IsGeometricallyReduced K L

lemma admissible_compat (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (a : K) :
    σL (algebraMap K L a) = algebraMap K L (σK a) := by sorry
lemma admissible_constants (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) :
    (∀ a : K, σK a = a ↔ ∃ c : F, algebraMap F K c = a) ∧
    (∀ a : L, σL a = a ↔ ∃ c : F, algebraMap F L c = a) := by sorry
lemma admissible_separable (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) : Algebra.IsGeometricallyReduced K L := by sorry

-- TauCeti.Difference.Periods.test_admissible_fields_1
example : IsAdmissible (F := ℚ) (K := ℚ) (L := ℚ) AlgEquiv.refl AlgEquiv.refl := by sorry
-- TauCeti.Difference.Periods.test_admissible_fields_2
example : IsAdmissible (F := ℝ) (K := ℝ) (L := ℂ) AlgEquiv.refl Complex.conjAe := by sorry
-- TauCeti.Difference.Periods.test_admissible_fields_3
example : ¬ IsAdmissible (F := ℝ) (K := ℝ) (L := ℂ) AlgEquiv.refl AlgEquiv.refl := by sorry
end Fields

section FundamentalDefinition
variable {F K L : Type*} [CommRing F] [CommRing K] [CommRing L]
  [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]
  {ι : Type*} [Fintype ι] [DecidableEq ι]
/-- DM.8/fundamental-matrix: a native matrix unit plus the displayed equation. -/
def IsFundamental (σ : L ≃ₐ[F] L) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) : Prop :=
  (Ψ.val.map σ) = (Φ.val.map (algebraMap K L)) * Ψ.val

end FundamentalDefinition

section Matrices
variable {F K L : Type*} [Field F] [Field K] [Field L]
  [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]
  {ι : Type*} [Fintype ι] [DecidableEq ι]


lemma fundamental_equation (σ : L ≃ₐ[F] L) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) : IsFundamental σ Φ Ψ ↔
    Ψ.val.map σ = Φ.val.map (algebraMap K L) * Ψ.val := by sorry
lemma fundamental_change_basis (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (hc : ∀ a, σL (algebraMap K L a) = algebraMap K L (σK a))
    (Φ B : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σL Φ Ψ) :
    IsFundamental σL
      ((Units.map (RingHom.mapMatrix σK.toRingHom).toMonoidHom B) * Φ * B⁻¹)
      ((Units.map (RingHom.mapMatrix (algebraMap K L)).toMonoidHom B) * Ψ) := by sorry
lemma fundamental_right_constant (σ : L ≃ₐ[F] L) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σ Φ Ψ)
    (D : Matrix.GeneralLinearGroup ι F) :
    IsFundamental σ Φ (Ψ * Units.map (RingHom.mapMatrix (algebraMap F L)).toMonoidHom D) := by sorry
lemma fundamental_unique (σ : L ≃ₐ[F] L)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σ Φ Ψ) {j : Type*} [Fintype j]
    (X : Matrix ι j L) (hX : X.map σ = (Φ.val.map (algebraMap K L)) * X) :
    ∃! D : Matrix ι j F, X = Ψ.val * D.map (algebraMap F L) := by sorry
lemma fundamental_unique_invertible (σ : L ≃ₐ[F] L)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ X : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σ Φ Ψ) (hX : IsFundamental σ Φ X) :
    ∃! D : Matrix.GeneralLinearGroup ι F,
      X = Ψ * Units.map (RingHom.mapMatrix (algebraMap F L)).toMonoidHom D := by sorry

-- TauCeti.Difference.Periods.test_fundamental_matrix_1
example (σ : L ≃ₐ[F] L) : IsFundamental (ι := Fin 1) (K := K) σ 1 1 := by sorry
-- TauCeti.Difference.Periods.test_fundamental_matrix_2
example (σ : L ≃ₐ[F] L) : IsFundamental (ι := Fin 0) (K := K) σ 1 1 := by sorry
-- TauCeti.Difference.Periods.test_fundamental_matrix_3: expressed entrywise, so no ad hoc scalar unit.
example (Ψ : Matrix.GeneralLinearGroup (Fin 1) ℚ) :
    Ψ.val ≠ (2 : Matrix (Fin 1) (Fin 1) ℚ) * Ψ.val := by sorry

/-- DM.8/solution-space. Also meaningful for singular Φ. -/
def solutionSpace (σ : L ≃ₐ[F] L) (Φ : Matrix ι ι L) : Submodule F (ι → L) where
  carrier := {v | (fun i => σ (v i)) = Φ.mulVec v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

lemma solution_mem (σ : L ≃ₐ[F] L) (Φ : Matrix ι ι L) (v : ι → L) :
    v ∈ solutionSpace σ Φ ↔ (fun i => σ (v i)) = Φ.mulVec v := by sorry
lemma solution_finrank (σ : L ≃ₐ[F] L)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a) (Φ : Matrix ι ι L) :
    FiniteDimensional F (solutionSpace σ Φ) ∧
      finrank F (solutionSpace σ Φ) ≤ Fintype.card ι := by sorry
/-- The canonical map sends c to Ψc; its actual formula is retained. -/
lemma solution_coordinates (σ : L ≃ₐ[F] L)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σ Φ Ψ) :
    ∃ e : (ι → F) ≃ₗ[F] solutionSpace σ (Φ.val.map (algebraMap K L)),
      ∀ c, (e c).val = Ψ.val.mulVec (fun i => algebraMap F L (c i)) := by sorry

-- TauCeti.Difference.Periods.test_solution_space_1
example : solutionSpace (F := ℚ) (L := ℚ) (ι := Fin 1) AlgEquiv.refl 1 = ⊤ := by sorry
-- TauCeti.Difference.Periods.test_solution_space_2
example : solutionSpace (F := ℚ) (L := ℚ) (ι := Fin 1) AlgEquiv.refl 2 = ⊥ := by sorry
-- TauCeti.Difference.Periods.test_solution_space_3
example : ¬ LinearIndependent ℚ (fun _ : Fin 2 => (fun _ : Fin 1 => (1 : ℚ))) := by sorry

/-- DM.8/solution-ring: determinant inversion is included in the generator set. -/
def solutionRing (K : Type*) [Field K] [Algebra K L] (Ψ : Matrix.GeneralLinearGroup ι L) :
    Subalgebra K L :=
  Algebra.adjoin K (Set.range (fun ij : ι × ι => Ψ.val ij.1 ij.2) ∪ {Ψ.val.det⁻¹})

/-- The companion native intermediate field is the fraction field of solutionRing. -/
def solutionField (K : Type*) [Field K] [Algebra K L] (Ψ : Matrix.GeneralLinearGroup ι L) :
    IntermediateField K L := IntermediateField.adjoin K
      (Set.range (fun ij : ι × ι => Ψ.val ij.1 ij.2))

lemma solutionRing_entry (Ψ : Matrix.GeneralLinearGroup ι L) :
    (∀ i j, Ψ.val i j ∈ solutionRing K Ψ) ∧ Ψ.val.det⁻¹ ∈ solutionRing K Ψ := by sorry
lemma solutionRing_le (Ψ : Matrix.GeneralLinearGroup ι L) (A : Subalgebra K L) :
    solutionRing K Ψ ≤ A ↔ (∀ i j, Ψ.val i j ∈ A) ∧ Ψ.val.det⁻¹ ∈ A := by sorry
/-- Supply the canonical algebra structure through the ambient field, not an unrelated one. -/
lemma solutionField_fraction (Ψ : Matrix.GeneralLinearGroup ι L) :
    ∃ a : Algebra (solutionRing K Ψ) (solutionField K Ψ),
      (∀ x : solutionRing K Ψ, ((@algebraMap _ _ _ _ a x : solutionField K Ψ) : L) = x.val) ∧
      (letI : Algebra (solutionRing K Ψ) (solutionField K Ψ) := a;
        IsFractionRing (solutionRing K Ψ) (solutionField K Ψ)) := by sorry
lemma solutionRing_twist (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (hc : ∀ a, σL (algebraMap K L a) = algebraMap K L (σK a))
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σL Φ Ψ) :
    ∃ e : solutionRing K Ψ ≃+* solutionRing K Ψ, ∀ x, (e x).val = σL x.val := by sorry

-- TauCeti.Difference.Periods.test_solution_ring_1
example : solutionRing K (1 : Matrix.GeneralLinearGroup (Fin 1) L) = ⊥ ∧
    solutionField K (1 : Matrix.GeneralLinearGroup (Fin 1) L) = ⊥ := by sorry
-- TauCeti.Difference.Periods.test_solution_ring_2
example : solutionRing K (1 : Matrix.GeneralLinearGroup (Fin 0) L) = ⊥ := by sorry
-- TauCeti.Difference.Periods.test_solution_ring_3
example (Ψ : Matrix.GeneralLinearGroup (Fin 1) L)
    (hz : ¬ IsAlgebraic K (Ψ.val 0 0)) :
    Ψ.val.det⁻¹ ∈ solutionRing K Ψ ∧
    Ψ.val.det⁻¹ ∉ Algebra.adjoin K {Ψ.val 0 0} := by sorry
end Matrices

section Comparison
variable {F K L : Type*} [Field F] [Field K] [Field L]
  [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]
  {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The comparison matrix is defined in the tensor ring, which need not be a domain. -/
def comparisonMatrix (Ψ : Matrix.GeneralLinearGroup ι L) :
    Matrix.GeneralLinearGroup ι (L ⊗[K] L) :=
  (Units.map (RingHom.mapMatrix
    (Algebra.TensorProduct.includeLeft : L →ₐ[K] L ⊗[K] L).toRingHom).toMonoidHom Ψ)⁻¹ *
  Units.map (RingHom.mapMatrix
    (Algebra.TensorProduct.includeRight : L →ₐ[K] L ⊗[K] L).toRingHom).toMonoidHom Ψ

/-- DM.8/comparison-algebra. No group structure is assumed in its definition. -/
def comparisonAlgebra (F K : Type*) [Field F] [Field K] [Algebra F K]
    [Algebra K L] [Algebra F L] [IsScalarTower F K L]
    (Ψ : Matrix.GeneralLinearGroup ι L) : Subalgebra F (L ⊗[K] L) :=
  Algebra.adjoin F (Set.range (fun ij : ι × ι => (comparisonMatrix (K := K) Ψ).val ij.1 ij.2) ∪
    {((comparisonMatrix (K := K) Ψ)⁻¹).val.det})

lemma comparisonMatrix_formula (Ψ : Matrix.GeneralLinearGroup ι L) :
    comparisonMatrix (K := K) Ψ =
    (Units.map (RingHom.mapMatrix
      (Algebra.TensorProduct.includeLeft : L →ₐ[K] L ⊗[K] L).toRingHom).toMonoidHom Ψ)⁻¹ *
    Units.map (RingHom.mapMatrix
      (Algebra.TensorProduct.includeRight : L →ₐ[K] L ⊗[K] L).toRingHom).toMonoidHom Ψ := by sorry
lemma comparisonAlgebra_le (Ψ : Matrix.GeneralLinearGroup ι L) (A : Subalgebra F (L ⊗[K] L)) :
    comparisonAlgebra F K Ψ ≤ A ↔
    (∀ i j, (comparisonMatrix (K := K) Ψ).val i j ∈ A) ∧
      ((comparisonMatrix (K := K) Ψ)⁻¹).val.det ∈ A := by sorry
lemma comparisonMatrix_fixed (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (hc : ∀ a, σL (algebraMap K L a) = algebraMap K L (σK a))
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σL Φ Ψ)
    (σT : (L ⊗[K] L) ≃ₐ[F] (L ⊗[K] L))
    (hσT : ∀ x y : L, σT (x ⊗ₜ[K] y) = σL x ⊗ₜ[K] σL y) :
    (comparisonMatrix (K := K) Ψ).val.map σT = (comparisonMatrix (K := K) Ψ).val := by sorry
/-- Universal cocycle identity; specialize A to the three-fold tensor product and a,b,c to its embeddings. -/
lemma comparisonMatrix_cocycle {A : Type*} [CommRing A] [Algebra K A]
    (a b c : L →ₐ[K] A) (Ψ : Matrix.GeneralLinearGroup ι L) :
    ((Units.map (RingHom.mapMatrix a.toRingHom).toMonoidHom Ψ)⁻¹ *
      Units.map (RingHom.mapMatrix b.toRingHom).toMonoidHom Ψ) *
    ((Units.map (RingHom.mapMatrix b.toRingHom).toMonoidHom Ψ)⁻¹ *
      Units.map (RingHom.mapMatrix c.toRingHom).toMonoidHom Ψ) =
    (Units.map (RingHom.mapMatrix a.toRingHom).toMonoidHom Ψ)⁻¹ *
      Units.map (RingHom.mapMatrix c.toRingHom).toMonoidHom Ψ := by sorry

-- TauCeti.Difference.Periods.test_comparison_algebra_1
example : comparisonMatrix (K := K) (1 : Matrix.GeneralLinearGroup (Fin 1) L) = 1 ∧
    comparisonAlgebra F K (1 : Matrix.GeneralLinearGroup (Fin 1) L) = ⊥ := by sorry
-- TauCeti.Difference.Periods.test_comparison_algebra_2
example : comparisonMatrix (K := K) (1 : Matrix.GeneralLinearGroup (Fin 0) L) = 1 ∧
    comparisonAlgebra F K (1 : Matrix.GeneralLinearGroup (Fin 0) L) = ⊥ := by sorry
-- TauCeti.Difference.Periods.test_comparison_algebra_3
example (Ψ : Matrix.GeneralLinearGroup (Fin 1) L) :
    (comparisonMatrix (K := K) Ψ).val 0 0 =
      (Algebra.TensorProduct.includeLeft : L →ₐ[K] L ⊗[K] L) ((Ψ.val 0 0)⁻¹) *
      (Algebra.TensorProduct.includeRight : L →ₐ[K] L ⊗[K] L) (Ψ.val 0 0) := by sorry
end Comparison

section Degree
variable (F : Type*) [Field F] {A I : Type*} [CommRing A] [Algebra F A] [Fintype I]

/-- DM.8/degree-span: constant monomials are retained, including for an empty family. -/
def degreeSpan (x : I → A) (d : ℕ) : Submodule F A :=
  Submodule.span F {a | ∃ e : I → ℕ, (∑ i, e i) ≤ d ∧ a = ∏ i, x i ^ e i}
lemma degreeSpan_zero (x : I → A) : degreeSpan F x 0 = Submodule.span F {1} := by sorry
lemma degreeSpan_mono (x : I → A) {d e : ℕ} (h : d ≤ e) :
    degreeSpan F x d ≤ degreeSpan F x e := by sorry
lemma degreeSpan_polynomial (x : I → A) (d : ℕ) :
    ∃ P : Submodule F (MvPolynomial I F),
      (∀ f, f ∈ P ↔ f.totalDegree ≤ d) ∧
      degreeSpan F x d = P.map (MvPolynomial.aeval x).toLinearMap := by sorry
lemma degreeSpan_finite (x : I → A) (d : ℕ) : FiniteDimensional F (degreeSpan F x d) := by sorry

-- TauCeti.Difference.Periods.test_degree_span_1
example : (1 : A) ∈ degreeSpan F (fun i : Fin 0 => Fin.elim0 i) 0 := by sorry
-- TauCeti.Difference.Periods.test_degree_span_2
example (d : ℕ) : degreeSpan F (fun _ : Fin 1 => (0 : A)) d = Submodule.span F {1} := by sorry
-- TauCeti.Difference.Periods.test_degree_span_3
example (x : A) (hx : ¬ IsAlgebraic F x) :
    finrank F (degreeSpan F (fun _ : Fin 1 => x) 2) = 3 := by sorry
end Degree

section LogMatrices
variable {C : Type*} [NormedField C] [CompleteSpace C] [IsUltrametricDist C]

/-- DM.8/carlitz-deformation. Each denominator is expanded as a formal series before coefficientwise summation.
Analytic identities below require the small-argument bound; the total definition alone asserts no convergence. -/
def carlitzDeformation (q : ℕ) (θ α : C) : PowerSeries C :=
  PowerSeries.mk (fun n => ∑' i : ℕ, PowerSeries.coeff n
    (PowerSeries.C (α ^ (q ^ i)) *
      (∏ j ∈ Finset.range i, (PowerSeries.X - PowerSeries.C (θ ^ (q ^ (j + 1)))))⁻¹))

lemma carlitzDeformation_zero (q : ℕ) (hq : 1 < q) (θ : C) :
    carlitzDeformation q θ 0 = 0 := by sorry
lemma carlitzDeformation_add (p m q : ℕ) [CharP C p] [Fact p.Prime]
    (hm : 0 < m) (hq : q = p ^ m) (θ α β : C) (hθ : ‖θ‖ = q)
    (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ)))
    (hβ : ‖β‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    carlitzDeformation q θ (α + β) = carlitzDeformation q θ α + carlitzDeformation q θ β := by sorry
lemma carlitzDeformation_smul (p m q : ℕ) [CharP C p] [Fact p.Prime]
    (hm : 0 < m) (hq : q = p ^ m) (θ α a : C) (hθ : ‖θ‖ = q)
    (ha : a ^ q = a) (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    carlitzDeformation q θ (a * α) = PowerSeries.C a * carlitzDeformation q θ α := by sorry
lemma carlitzDeformation_twist (p m q : ℕ) [CharP C p] [Fact p.Prime]
    (hm : 0 < m) (hq : q = p ^ m) (θ α : C) (hθ : ‖θ‖ = q)
    (σ : C ≃+* C) (hσ : ∀ a, (σ a) ^ q = a)
    (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    twistSeries σ (carlitzDeformation q θ α) = PowerSeries.C (σ α) +
      carlitzDeformation q θ α * (PowerSeries.X - PowerSeries.C θ)⁻¹ := by sorry
/-- The right side is the DM.2 Carlitz logarithm series, stated without inventing a supplier type. -/
lemma carlitzDeformation_value (p m q : ℕ) [CharP C p] [Fact p.Prime]
    (hm : 0 < m) (hq : q = p ^ m) (θ α : C) (hθ : ‖θ‖ = q)
    (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    (∑' n : ℕ, PowerSeries.coeff n (carlitzDeformation q θ α) * θ ^ n) =
      ∑' i : ℕ, α ^ (q ^ i) / ∏ j ∈ Finset.range i, (θ - θ ^ (q ^ (j + 1))) := by sorry

-- TauCeti.Difference.Periods.test_carlitz_deformation_1
example (q : ℕ) (hq : 1 < q) (θ : C) : carlitzDeformation q θ 0 = 0 := by sorry
-- TauCeti.Difference.Periods.test_carlitz_deformation_2
example (p m q : ℕ) [CharP C p] [Fact p.Prime] (hm : 0 < m) (hq : q = p ^ m)
    (θ α : C) (hθ : ‖θ‖ = q)
    (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    carlitzDeformation q θ (-α) = -carlitzDeformation q θ α := by sorry
-- TauCeti.Difference.Periods.test_carlitz_deformation_3
example (p m q : ℕ) [CharP C p] [Fact p.Prime] (hm : 0 < m) (hq : q = p ^ m)
    (θ α : C) (hθ : ‖θ‖ = q) (hα0 : α ≠ 0)
    (hα : ‖α‖ < (q : ℝ) ^ ((q : ℝ) / (q - 1 : ℝ))) :
    PowerSeries.coeff 0 (carlitzDeformation q θ α) ≠ 0 := by sorry

/-- DM.8/logarithm-matrices: the source's column convention, indexed by the Carlitz summand plus the logarithm summands. -/
def logPhi {r : ℕ} (σ : C ≃+* C) (θ : C) (α : Fin r → C) :
    Matrix (Unit ⊕ Fin r) (Unit ⊕ Fin r) (Polynomial C) :=
  fun i j => match i, j with
    | .inl _, .inl _ => Polynomial.X - Polynomial.C θ
    | .inl _, .inr _ => 0
    | .inr a, .inl _ => Polynomial.C (σ (α a)) * (Polynomial.X - Polynomial.C θ)
    | .inr a, .inr b => if a = b then 1 else 0

def logPsi {r : ℕ} (Ω : PowerSeries C) (L : Fin r → PowerSeries C) :
    Matrix (Unit ⊕ Fin r) (Unit ⊕ Fin r) (PowerSeries C) :=
  fun i j => match i, j with
    | .inl _, .inl _ => Ω
    | .inl _, .inr _ => 0
    | .inr a, .inl _ => Ω * L a
    | .inr a, .inr b => if a = b then 1 else 0

lemma logPhi_entries {r : ℕ} (σ : C ≃+* C) (θ : C) (α : Fin r → C) :
    logPhi σ θ α (.inl ()) (.inl ()) = Polynomial.X - Polynomial.C θ ∧
    (∀ i, logPhi σ θ α (.inr i) (.inl ()) =
      Polynomial.C (σ (α i)) * (Polynomial.X - Polynomial.C θ)) ∧
    (∀ i j, logPhi σ θ α (.inr i) (.inr j) = if i = j then 1 else 0) ∧
    (∀ i, logPhi σ θ α (.inl ()) (.inr i) = 0) := by sorry
lemma logPsi_entries {r : ℕ} (Ω : PowerSeries C) (L : Fin r → PowerSeries C) :
    logPsi Ω L (.inl ()) (.inl ()) = Ω ∧
    (∀ i, logPsi Ω L (.inr i) (.inl ()) = Ω * L i) ∧
    (∀ i j, logPsi Ω L (.inr i) (.inr j) = if i = j then 1 else 0) ∧
    (∀ i, logPsi Ω L (.inl ()) (.inr i) = 0) := by sorry
lemma logMatrices_det {r : ℕ} (σ : C ≃+* C) (θ : C) (α : Fin r → C)
    (Ω : PowerSeries C) (L : Fin r → PowerSeries C) :
    (logPhi σ θ α).det = Polynomial.X - Polynomial.C θ ∧ (logPsi Ω L).det = Ω := by sorry
lemma logMatrices_equation {r : ℕ} (σ : C ≃+* C) (θ : C) (α : Fin r → C)
    (Ω : PowerSeries C) (L : Fin r → PowerSeries C)
    (hΩ : twistSeries σ Ω = (PowerSeries.X - PowerSeries.C θ) * Ω)
    (hL : ∀ i, twistSeries σ (L i) = PowerSeries.C (σ (α i)) +
      L i * (PowerSeries.X - PowerSeries.C θ)⁻¹) (hθ : θ ≠ 0) :
    (logPsi Ω L).map (twistSeries σ) =
      (logPhi σ θ α).map Polynomial.toPowerSeries * logPsi Ω L := by sorry

-- TauCeti.Difference.Periods.test_logarithm_matrices_1
example (σ : C ≃+* C) (θ : C) (Ω : PowerSeries C) :
    logPhi σ θ (fun i : Fin 0 => Fin.elim0 i) (.inl ()) (.inl ()) = Polynomial.X - Polynomial.C θ ∧
    logPsi Ω (fun i : Fin 0 => Fin.elim0 i) (.inl ()) (.inl ()) = Ω := by sorry
-- TauCeti.Difference.Periods.test_logarithm_matrices_2
example (σ : C ≃+* C) (θ : C) (Ω : PowerSeries C) :
    logPhi σ θ (fun _ : Fin 1 => 0) (.inr 0) (.inl ()) = 0 ∧
    logPsi Ω (fun _ : Fin 1 => 0) (.inr 0) (.inl ()) = 0 := by sorry
-- TauCeti.Difference.Periods.test_logarithm_matrices_3
example (σ : C ≃+* C) (θ α : C) (Ω L : PowerSeries C) :
    logPhi σ θ (fun _ : Fin 2 => α) (.inr 0) (.inl ()) =
      logPhi σ θ (fun _ : Fin 2 => α) (.inr 1) (.inl ()) ∧
    logPsi Ω (fun _ : Fin 2 => L) (.inr 0) (.inl ()) =
      logPsi Ω (fun _ : Fin 2 => L) (.inr 1) (.inl ()) := by sorry
end LogMatrices

section DifferenceTargets
variable {F K L : Type*} [Field F] [Field K] [Field L]
  [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]
  {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- DM.8/solution-ring-simple. Stable by inclusion already suffices. -/
theorem solution_ring_simple (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σL Φ Ψ)
    (e : solutionRing K Ψ ≃+* solutionRing K Ψ) (he : ∀ x, (e x).val = σL x.val)
    (I : Ideal (solutionRing K Ψ)) (hI : I.map e.toRingHom ≤ I) : I = ⊥ ∨ I = ⊤ := by sorry

/-- DM.8/difference-torsor, its coordinate-ring formulation.
The Hopf-algebra target includes the explicit matrix generator formulas in the document. -/
theorem difference_torsor (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σL Φ Ψ) :
    Nonempty ((solutionRing K Ψ ⊗[K] solutionRing K Ψ) ≃ₐ[K]
      (solutionRing K Ψ ⊗[F] comparisonAlgebra F K Ψ)) := by sorry

/-- A native Hopf structure, asserted only after the torsor theorem.
Implementation must construct the inherited multiplication, identity and inverse on generators. -/
theorem difference_hopf (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σL Φ Ψ) :
    Nonempty (HopfAlgebra F (comparisonAlgebra F K Ψ)) := by sorry

/-- DM.8/difference-smooth-dimension, dimension and the native group smoothness form.
Relative algebraic closure is stated elementwise, and general separability remains in IsAdmissible. -/
theorem difference_smooth_dimension (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σL Φ Ψ)
    (hclosed : ∀ x : solutionField K Ψ, IsAlgebraic K x →
      ∃ a : K, algebraMap K (solutionField K Ψ) a = x) :
    ∃ d : ℕ, ringKrullDim (comparisonAlgebra F K Ψ) = d ∧
      Algebra.trdeg K (solutionField K Ψ) = (d : Cardinal) := by sorry

/-- Smoothness uses the native finite-type Hopf criterion, not geometric reducedness of an arbitrary scheme. -/
theorem difference_group_smooth (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L)
    (h : IsAdmissible σK σL) (Φ : Matrix.GeneralLinearGroup ι K)
    (Ψ : Matrix.GeneralLinearGroup ι L) (hΨ : IsFundamental σL Φ Ψ)
    [HopfAlgebra F (comparisonAlgebra F K Ψ)]
    (hclosed : ∀ x : solutionField K Ψ, IsAlgebraic K x →
      ∃ a : K, algebraMap K (solutionField K Ψ) a = x) :
    TauCeti.smoothCommHopfAlgProperty F (CommHopfAlgCat.of F (comparisonAlgebra F K Ψ)) := by sorry
end DifferenceTargets

section ArithmeticTargets
variable (F kinf C : Type*) [Field F] [Fintype F] [NormedField kinf]
  [NormedField C] [CompleteSpace C] [IsUltrametricDist C]
  [Algebra (RatFunc F) kinf] [Algebra (RatFunc F) C] [NormedAlgebra kinf C]
  [IsScalarTower (RatFunc F) kinf C] [CompleteSpace kinf] [IsUltrametricDist kinf]
  [IsAlgClosed C]

/-- DM.8/analytic-fixed-fields, the native restricted-series part. The fraction-field
and higher-twist forms require the canonical RatFunc embedding discussed in the omissions. -/
theorem analytic_fixed_fields (σ : C ≃+* C)
    (hσ : ∀ a : C, (σ a) ^ Fintype.card F = a)
    [Algebra F C] [IsScalarTower F (RatFunc F) C] (f : PowerSeries C)
    (hf : PowerSeries.IsRestricted 1 f) :
    twistSeries σ f = f ↔ ∃ P : Polynomial F,
      PowerSeries.map (algebraMap F C) (P : PowerSeries F) = f := by sorry

/-- DM.8/entire-from-equation. The ambient coefficient field and its completion are explicit.
Polynomial coefficients algebraic over the global field and invertibility at zero are retained. -/
theorem entire_from_equation (σ : C ≃+* C)
    (hσ : ∀ a : C, (σ a) ^ Fintype.card F = a)
    {r : ℕ} (Φ : Matrix (Fin r) (Fin r) (Polynomial C))
    (hcoeff : ∀ i j n, IsAlgebraic (RatFunc F) ((Φ i j).coeff n))
    (hdet : Φ.det.eval 0 ≠ 0) (ψ : Fin r → PowerSeries C)
    (hψ : ∀ i, PowerSeries.IsRestricted 1 (ψ i))
    (heq : (fun i => twistSeries σ (ψ i)) =
      (Φ.map Polynomial.toPowerSeries).mulVec ψ) :
    ∀ i, ψ i ∈ entireSubring (RatFunc F) kinf C := by sorry

/-- DM.8/abp-lifting, with the global rational field rather than a characteristic-zero coefficient field. -/
theorem abp_lifting (σ : C ≃+* C)
    (hσ : ∀ a : C, (σ a) ^ Fintype.card F = a)
    (θ : C) (hθ : θ = algebraMap (RatFunc F) C RatFunc.X)
    (hnorm : ‖θ‖ = Fintype.card F)
    {r : ℕ} (Φ : Matrix (Fin r) (Fin r) (Polynomial C))
    (hcoeff : ∀ i j n, IsAlgebraic (RatFunc F) ((Φ i j).coeff n))
    (c : C) (hc : c ≠ 0) (hcalg : IsAlgebraic (RatFunc F) c) (s : ℕ)
    (hdet : Φ.det = Polynomial.C c * (Polynomial.X - Polynomial.C θ) ^ s)
    (ψ : Fin r → entireSubring (RatFunc F) kinf C)
    (heq : (fun i => twistSeries σ (ψ i).val) =
      (Φ.map Polynomial.toPowerSeries).mulVec (fun i => (ψ i).val))
    (ρ : Fin r → C) (hρ : ∀ i, IsAlgebraic (RatFunc F) (ρ i))
    (hrel : ∑ i, ρ i * entire_eval (RatFunc F) kinf C θ (ψ i) = 0) :
    ∃ P : Fin r → Polynomial C,
      (∀ i n, IsAlgebraic (RatFunc F) ((P i).coeff n)) ∧
      (∑ i, (P i : PowerSeries C) * (ψ i).val) = 0 ∧
      ∀ i, (P i).eval θ = ρ i := by sorry

/-- DM.8/period-transcendence, the specialization equality, with t included among the function generators; identification with Γ_M
uses the separately documented motive/category supplier interface. -/
theorem period_transcendence (K : Type*) [Field K] [Algebra (RatFunc F) K]
    [Algebra K C] [IsAlgClosure (RatFunc F) K] [IsScalarTower (RatFunc F) K C]
    (σ : C ≃+* C) (hσ : ∀ a : C, (σ a) ^ Fintype.card F = a)
    (θK : K) (hθK : θK = algebraMap (RatFunc F) K RatFunc.X)
    (θ : C) (hθ : θ = algebraMap K C θK) (hnorm : ‖θ‖ = Fintype.card F)
    {r : ℕ} (Φ : Matrix (Fin r) (Fin r) (Polynomial K))
    (c : K) (hc : c ≠ 0) (s : ℕ)
    (hdet : Φ.det = Polynomial.C c * (Polynomial.X - Polynomial.C θK) ^ s)
    (Ψ : Matrix (Fin r) (Fin r) (entireSubring (RatFunc F) kinf C))
    (hunit : IsUnit ((Ψ.map (fun f => f.val)).det))
    (heq : (Ψ.map (fun f => twistSeries σ f.val)) =
      (Φ.map (fun P => (P.map (algebraMap K C) : PowerSeries C))) * Ψ.map (fun f => f.val))
    [Algebra K (PowerSeries C)]
    (hconstants : ∀ a : K, algebraMap K (PowerSeries C) a = PowerSeries.C (algebraMap K C a)) :
    let A := Algebra.adjoin K
      (Set.range (fun ij : Fin r × Fin r => (Ψ ij.1 ij.2).val) ∪ {PowerSeries.X})
    letI : Algebra K (FractionRing A) :=
      ((algebraMap A (FractionRing A)).comp (algebraMap K A)).toAlgebra
    Algebra.trdeg K (FractionRing A) =
    Algebra.trdeg K (IntermediateField.adjoin K
      (Set.range (fun ij : Fin r × Fin r => entire_eval (RatFunc F) kinf C θ (Ψ ij.1 ij.2)))) + 1 := by sorry

/-- DM.8/carlitz-logarithm-independence. The DM.2 exponential is characterized by its exact series,
so this does not introduce a competing exponential definition or choose a principal logarithm branch. -/
theorem carlitz_logarithm_independence (K : Type*) [Field K] [Algebra (RatFunc F) K]
    [Algebra K C] [IsAlgClosure (RatFunc F) K] [IsScalarTower (RatFunc F) K C]
    (θ : C) (hθ : θ = algebraMap (RatFunc F) C RatFunc.X)
    (hnorm : ‖θ‖ = Fintype.card F) (expC : C →+ C)
    (hexp : ∀ z, expC z = ∑' i : ℕ, z ^ (Fintype.card F ^ i) /
      ∏ j ∈ Finset.range i, (θ ^ (Fintype.card F ^ i) - θ ^ (Fintype.card F ^ j)))
    {r : ℕ} (ell : Fin r → C)
    (halg : ∀ i, IsAlgebraic (RatFunc F) (expC (ell i)))
    (hli : LinearIndependent (RatFunc F) ell) : AlgebraicIndependent K ell := by sorry

-- Acceptance: the rank-one conclusion includes logarithms whose exponential is zero.
example (K : Type*) [Field K] [Algebra (RatFunc F) K] [Algebra K C]
    [IsAlgClosure (RatFunc F) K] [IsScalarTower (RatFunc F) K C]
    (θ : C) (hθ : θ = algebraMap (RatFunc F) C RatFunc.X) (hnorm : ‖θ‖ = Fintype.card F)
    (expC : C →+ C)
    (hexp : ∀ z, expC z = ∑' i : ℕ, z ^ (Fintype.card F ^ i) /
      ∏ j ∈ Finset.range i, (θ ^ (Fintype.card F ^ i) - θ ^ (Fintype.card F ^ j)))
    (ell : C) (hell : ell ≠ 0) (halg : IsAlgebraic (RatFunc F) (expC ell)) :
    ¬ IsAlgebraic K ell := by sorry
end ArithmeticTargets


section IdealTargets
variable {F L A : Type*} [Field F] [Field L] [CommRing A] [Algebra F L] [Algebra F A]

/-- DM.8/invariant-ideal-descent. Use A equal to the native localized GL coordinate ring.
This stronger tensor form separates coefficient descent from choosing coordinates. -/
theorem invariant_ideal_descent (σ : L ≃ₐ[F] L)
    (hc : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (σT : (L ⊗[F] A) ≃ₐ[F] (L ⊗[F] A))
    (hσT : ∀ x y, σT (x ⊗ₜ[F] y) = σ x ⊗ₜ[F] y) :
    (∀ I : Ideal (L ⊗[F] A), I.map σT.toRingHom = I →
      I = (I.comap (Algebra.TensorProduct.includeRight : A →ₐ[F] L ⊗[F] A)).map
        (Algebra.TensorProduct.includeRight : A →ₐ[F] L ⊗[F] A)) ∧
    (∀ J : Ideal A, (J.map (Algebra.TensorProduct.includeRight : A →ₐ[F] L ⊗[F] A)).comap
      (Algebra.TensorProduct.includeRight : A →ₐ[F] L ⊗[F] A) = J) := by sorry

/-- DM.8/solution-invariant-ideal-descent. The exact solution-ring and simplicity hypotheses are retained. -/
theorem solution_invariant_ideal_descent {K : Type*} [Field K]
    [Algebra F K] [Algebra K L] [IsScalarTower F K L]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (σK : K ≃ₐ[F] K) (σL : L ≃ₐ[F] L) (h : IsAdmissible σK σL)
    (Φ : Matrix.GeneralLinearGroup ι K) (Ψ : Matrix.GeneralLinearGroup ι L)
    (hΨ : IsFundamental σL Φ Ψ)
    (e : solutionRing K Ψ ≃ₐ[F] solutionRing K Ψ) (he : ∀ x, (e x).val = σL x.val)
    (σT : (solutionRing K Ψ ⊗[F] A) ≃ₐ[F] (solutionRing K Ψ ⊗[F] A))
    (hσT : ∀ x y, σT (x ⊗ₜ[F] y) = e x ⊗ₜ[F] y) :
    (∀ I : Ideal (solutionRing K Ψ ⊗[F] A), I.map σT.toRingHom = I →
      I = (I.comap (Algebra.TensorProduct.includeRight : A →ₐ[F] solutionRing K Ψ ⊗[F] A)).map
        (Algebra.TensorProduct.includeRight : A →ₐ[F] solutionRing K Ψ ⊗[F] A)) ∧
    (∀ J : Ideal A, (J.map (Algebra.TensorProduct.includeRight : A →ₐ[F] solutionRing K Ψ ⊗[F] A)).comap
      (Algebra.TensorProduct.includeRight : A →ₐ[F] solutionRing K Ψ ⊗[F] A) = J) := by sorry
end IdealTargets

section SpecializationRank
variable (F kinf C K : Type*) [Field F] [Fintype F] [NormedField kinf]
  [NormedField C] [CompleteSpace C] [IsUltrametricDist C]
  [Algebra (RatFunc F) kinf] [Algebra (RatFunc F) C] [NormedAlgebra kinf C]
  [IsScalarTower (RatFunc F) kinf C] [CompleteSpace kinf] [IsUltrametricDist kinf]
  [IsAlgClosed C] [Field K] [Algebra (RatFunc F) K] [IsAlgClosure (RatFunc F) K]
  [Algebra K C] [IsScalarTower (RatFunc F) K C]

/-- DM.8/specialization-rank, with the polynomial action specified by its actual formal-series map. -/
theorem specialization_rank (σ : C ≃+* C)
    (hσ : ∀ a : C, (σ a) ^ Fintype.card F = a)
    (θK : K) (hθK : θK = algebraMap (RatFunc F) K RatFunc.X)
    (θ : C) (hθ : θ = algebraMap K C θK) (hnorm : ‖θ‖ = Fintype.card F)
    {r : ℕ} (Φ : Matrix (Fin r) (Fin r) (Polynomial K))
    (c : K) (hc : c ≠ 0) (s : ℕ)
    (hdet : Φ.det = Polynomial.C c * (Polynomial.X - Polynomial.C θK) ^ s)
    (ψ : Fin r → entireSubring (RatFunc F) kinf C)
    (heq : (fun i => twistSeries σ (ψ i).val) =
      (Φ.map (fun P => (P.map (algebraMap K C) : PowerSeries C))).mulVec (fun i => (ψ i).val))
    [Algebra (Polynomial K) (entireSubring (RatFunc F) kinf C)]
    (hpoly : ∀ P : Polynomial K,
      (algebraMap (Polynomial K) (entireSubring (RatFunc F) kinf C) P).val =
        (P.map (algebraMap K C) : PowerSeries C)) :
    Module.rank (Polynomial K) (Submodule.span (Polynomial K) (Set.range ψ)) =
      (finrank K (Submodule.span K (Set.range
        (fun i => entire_eval (RatFunc F) kinf C θ (ψ i)))) : Cardinal) := by sorry
end SpecializationRank

section Denominators
variable {F K : Type*} [Field F] [Field K] [Algebra F K]

/-- DM.8/constant-denominator, its denominator-clearing consequence. B is rational, not polynomial. -/
theorem constant_denominator (σ : K ≃ₐ[F] K)
    (hc : ∀ a : K, σ a = a ↔ ∃ c : F, algebraMap F K c = a)
    (σR : RatFunc K ≃+* RatFunc K)
    (hσR : ∀ P : Polynomial K, σR (algebraMap (Polynomial K) (RatFunc K) P) =
      algebraMap (Polynomial K) (RatFunc K) (P.map σ.toRingHom))
    (θ : K) (hθ : ∀ n : ℕ, 0 < n → (σ.toEquiv : K → K)^[n] θ ≠ θ)
    {r s : ℕ} (Φ₁ : Matrix (Fin r) (Fin r) (Polynomial K))
    (Φ₂ : Matrix (Fin s) (Fin s) (Polynomial K))
    (c₁ c₂ : K) (hc₁ : c₁ ≠ 0) (hc₂ : c₂ ≠ 0) (n₁ n₂ : ℕ)
    (hd₁ : Φ₁.det = Polynomial.C c₁ * (Polynomial.X - Polynomial.C θ) ^ n₁)
    (hd₂ : Φ₂.det = Polynomial.C c₂ * (Polynomial.X - Polynomial.C θ) ^ n₂)
    (B : Matrix (Fin r) (Fin s) (RatFunc K))
    (hB : B.map σR * Φ₂.map (algebraMap (Polynomial K) (RatFunc K)) =
      Φ₁.map (algebraMap (Polynomial K) (RatFunc K)) * B) :
    ∃ D : Polynomial F, D ≠ 0 ∧ ∀ i j, ∃ P : Polynomial K,
      algebraMap (Polynomial K) (RatFunc K) P =
        algebraMap (Polynomial K) (RatFunc K) (D.map (algebraMap F K)) * B i j := by sorry
end Denominators
/- Supplier-dependent signatures deliberately omitted, rather than represented by opaque types
or unspecified proposition fields:
* tate_analytic_interface and twisting_limit need the current Tate Gauss-norm instance, which postdates
  the pin. analytic_separability and the full analytic_fixed_fields need DM.2's chosen analytic
  fraction field and its canonical rational-field algebra tower.
* fundamental_betti_basis, integral_trivialization, betti_exact_tensor and neutral_category need
  DM.4's actual dual-σ category/scalar extension plus MC.6's arbitrary-field reconstruction.
* relative_algebraic_closure needs the actual analytic-field instantiation and FA.0 curve transport.
* difference_invariants needs the σ-power algebraic-closure fields and the native group action on
  the base-changed solution field. tannakian_identification needs the actual tensor functor.
* abp_estimates needs FA.0's infinite-place arithmetic size/integers interfaces. period_transcendence
  above states the field equality only; its Γ_M dimension form needs those category interfaces.
* logarithm_motive_membership, carlitz_group, logarithm_group_linear and logarithm_linear_relations
  need the actual motives and affine group schemes. The linear-kernel target also retains the explicit
  separability gap from the source proof. logarithm_division needs DM.2's period normalization and
  exponential/local inverse interface. constant_denominator above gives denominator clearing; the monic least-denominator
  strengthening needs the canonical polynomial-denominator API. These mathematical targets are stated in full
  in the reader and packet, with sources, proof routes and supplier requests.
All eleven definition/construction nodes, all 43 API items and all 33 named definition tests have
native signatures above. The twelve retained fixed-vector acceptance examples also remain.
-/

end
end TauCeti.Difference.Periods
