-- Immutable planning evidence; extract one delimited source at a time.
-- BEGIN ARCHIVED CHECKED AFFINE NORMALIZATION COKERNEL
import Mathlib

open Polynomial
noncomputable section
universe u v w

namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- node: G.1/quadratic-pinch-algebra
/-- The preimage of the constants in the native polynomial quotient. -/
def algebra (q : k[X]) : Subalgebra k k[X] :=
  (⊥ : Subalgebra k (AdjoinRoot q)).comap (AdjoinRoot.mkₐ q)

lemma mem_algebra (q f : k[X]) :
    f ∈ algebra q ↔ ∃ c : k, ∃ h : k[X], f = Polynomial.C c + q * h := by
  change AdjoinRoot.mkₐ q f ∈ (⊥ : Subalgebra k (AdjoinRoot q)) ↔ _
  rw [Algebra.mem_bot]
  constructor
  · rintro ⟨c, hc⟩
    have hdiv : q ∣ f - Polynomial.C c := AdjoinRoot.mk_eq_mk.mp hc.symm
    obtain ⟨h, hh⟩ := hdiv
    exact ⟨c, h, by rw [← hh]; ring⟩
  · rintro ⟨c, h, rfl⟩
    exact ⟨c, by simp⟩

lemma constants (q : k[X]) (c : k) : Polynomial.C c ∈ algebra q := by
  exact (mem_algebra q _).mpr ⟨c, 0, by simp⟩

lemma normalization_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : k[X]) :
    f %ₘ q = Polynomial.C ((f %ₘ q).coeff 0) +
      Polynomial.C ((f %ₘ q).coeff 1) * Polynomial.X := by
  have hm := Polynomial.natDegree_modByMonic_lt f hq (by
    intro he; have he' := congrArg Polynomial.natDegree he; simp [hd] at he')
  have hm' : (f %ₘ q).natDegree ≤ 1 := by omega
  simpa [add_comm] using Polynomial.eq_X_add_C_of_natDegree_le_one hm'

noncomputable def moduleCoefficients (q f : k[X]) : algebra q × algebra q :=
  (⟨Polynomial.C ((f %ₘ q).coeff 0) + q * (f /ₘ q),
    (mem_algebra q _).mpr ⟨(f %ₘ q).coeff 0, f /ₘ q, rfl⟩⟩,
   ⟨Polynomial.C ((f %ₘ q).coeff 1), constants q _⟩)

lemma moduleCoefficients_fst (q f : k[X]) :
    ((moduleCoefficients q f).1 : k[X]) =
      Polynomial.C ((f %ₘ q).coeff 0) + q * (f /ₘ q) := rfl

lemma moduleCoefficients_snd (q f : k[X]) :
    ((moduleCoefficients q f).2 : k[X]) = Polynomial.C ((f %ₘ q).coeff 1) := rfl

lemma moduleCoefficients_reconstruct (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (moduleCoefficients q f).1 • (1 : k[X]) +
      (moduleCoefficients q f).2 • Polynomial.X = f := by
  simp only [Subalgebra.smul_def, moduleCoefficients_fst, moduleCoefficients_snd, smul_eq_mul, mul_one]
  rw [add_right_comm, ← normalization_remainder q hq hd f,
    Polynomial.modByMonic_add_div]

lemma normalization_span (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Submodule.span (algebra q) ({1, Polynomial.X} : Set k[X]) = ⊤ := by
  apply Submodule.eq_top_iff'.mpr
  intro f
  rw [← moduleCoefficients_reconstruct q hq hd f]
  exact Submodule.add_mem _
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))

lemma normalization_module_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Module.Finite (algebra q) k[X] := by
  rw [Module.finite_def, ← normalization_span q hq hd]
  exact Submodule.fg_span (Set.toFinite _)

lemma finite_normalization (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (algebra q).val.toRingHom.Finite := by
  exact normalization_module_finite q hq hd

lemma normalization_spec_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    AlgebraicGeometry.IsFinite (AlgebraicGeometry.Spec.map
      (CommRingCat.ofHom (algebra q).val.toRingHom)) := by
  exact (AlgebraicGeometry.IsFinite.SpecMap_iff _).mpr (finite_normalization q hq hd)

lemma fraction_ring (q : k[X]) (hq : q ≠ 0)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsFractionRing (algebra q) K := by
  have hinj : Function.Injective (algebraMap (algebra q) K) := by
    rw [IsScalarTower.algebraMap_eq (algebra q) k[X] K]
    exact (IsFractionRing.injective k[X] K).comp Subtype.val_injective
  have : FaithfulSMul (algebra q) K :=
    (faithfulSMul_iff_algebraMap_injective (algebra q) K).mpr hinj
  apply IsFractionRing.of_field
  intro z
  obtain ⟨a, b, hb, hz⟩ := IsFractionRing.div_surjective k[X] z
  let qa : algebra q := ⟨q * a, (mem_algebra q _).mpr ⟨0, a, by simp⟩⟩
  let qb : algebra q := ⟨q * b, (mem_algebra q _).mpr ⟨0, b, by simp⟩⟩
  refine ⟨qa, qb, ?_⟩
  rw [IsScalarTower.algebraMap_apply (algebra q) k[X] K qa,
    IsScalarTower.algebraMap_apply (algebra q) k[X] K qb]
  change z = algebraMap k[X] K (q * a) / algebraMap k[X] K (q * b)
  rw [map_mul, map_mul, mul_div_mul_left _ _
    ((map_ne_zero_iff _ (IsFractionRing.injective k[X] K)).mpr hq)]
  exact hz.symm

lemma integral_closure (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsIntegralClosure k[X] (algebra q) K := by
  have : Module.Finite (algebra q) k[X] := normalization_module_finite q hq hd
  have : Algebra.IsIntegral (algebra q) k[X] := Algebra.IsIntegral.of_finite _ _
  infer_instance

lemma integral_iff_polynomial (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K] (z : K) :
    IsIntegral (algebra q) z ↔ ∃ f : k[X], algebraMap k[X] K f = z := by
  have := integral_closure q hq hd K
  exact IsIntegralClosure.isIntegral_iff

noncomputable def fractionEquiv (q : k[X]) (hq : q ≠ 0) :
    FractionRing (algebra q) ≃ₐ[algebra q] FractionRing k[X] := by
  have := fraction_ring q hq (FractionRing k[X])
  exact FractionRing.algEquiv (A := algebra q) (FractionRing k[X])

lemma fractionEquiv_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    fractionEquiv q hq (algebraMap (algebra q) (FractionRing (algebra q)) a) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) := by
  exact (fractionEquiv q hq).commutes a

lemma fractionEquiv_symm_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra q) (FractionRing (algebra q)) a := by
  apply (fractionEquiv q hq).injective
  rw [AlgEquiv.apply_symm_apply]
  exact (fractionEquiv_algebraMap q hq a).symm

lemma fractionEquiv_symm_X (q : k[X]) (hq : q ≠ 0) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) Polynomial.X) =
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q * Polynomial.X, (mem_algebra q _).mpr ⟨0, Polynomial.X, by simp⟩⟩ : algebra q) /
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) := by
  apply (fractionEquiv q hq).injective
  rw [AlgEquiv.apply_symm_apply, map_div₀, fractionEquiv_algebraMap,
    fractionEquiv_algebraMap, map_mul]
  exact (mul_div_cancel_left₀ _
    ((map_ne_zero_iff _ (IsFractionRing.injective k[X] (FractionRing k[X]))).mpr hq)).symm

lemma module_generator_map_not_injective (q : k[X]) (hq : q ≠ 0) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by
  intro hinj
  let a : algebra q := ⟨-(q * Polynomial.X),
    (mem_algebra q _).mpr ⟨0, -Polynomial.X, by simp⟩⟩
  let b : algebra q := ⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩
  have he : a • (1 : k[X]) + b • Polynomial.X =
      (0 : algebra q) • (1 : k[X]) + (0 : algebra q) • Polynomial.X := by
    simp [Subalgebra.smul_def, smul_eq_mul, a, b]
  have hp := hinj (show (fun z : algebra q × algebra q =>
    z.1 • (1 : k[X]) + z.2 • Polynomial.X) (a, b) =
    (fun z : algebra q × algebra q => z.1 • (1 : k[X]) + z.2 • Polynomial.X) (0, 0)
    from he)
  have hb := congrArg (fun z : algebra q × algebra q => (z.2 : k[X])) hp
  exact hq hb

-- test: QuadraticPinch.moduleCoefficients.zero
example (q : k[X]) : moduleCoefficients q 0 = (0, 0) := by
  apply Prod.ext <;> apply Subtype.ext <;> simp [moduleCoefficients]

-- test: QuadraticPinch.moduleCoefficients.generator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    moduleCoefficients q Polynomial.X = (0, 1) := by
  have ht : (Polynomial.X : k[X]).degree < q.degree := by
    rw [Polynomial.degree_X, Polynomial.degree_eq_natDegree hq.ne_zero, hd]
    decide
  have hr := (Polynomial.modByMonic_eq_self_iff hq).mpr ht
  have hdv : (Polynomial.X : k[X]) /ₘ q = 0 :=
    (Polynomial.divByMonic_eq_zero_iff hq).mpr ht
  apply Prod.ext <;> apply Subtype.ext <;> simp [moduleCoefficients, hr, hdv]

-- test: QuadraticPinch.moduleCoefficients.cusp
example :
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).1 : (ZMod 2)[X]) = Polynomial.X ^ 3 ∧
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).2 : (ZMod 2)[X]) = 0 := by
  have he : (Polynomial.X ^ 3 : (ZMod 2)[X]) = Polynomial.X ^ 2 * Polynomial.X := by ring
  simp [moduleCoefficients, he, Polynomial.self_mul_modByMonic,
    Polynomial.monic_X_pow, Polynomial.mul_divByMonic_cancel_left]

-- test: QuadraticPinch.normalization.cusp_finite
example : (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])).val.toRingHom.Finite := by
  exact finite_normalization _ (Polynomial.monic_X_pow 2) (by simp)

-- test: QuadraticPinch.normalization.nonsplit_finite
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).val.toRingHom.Finite := by
  apply finite_normalization
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.normalization.not_basis
example (q : k[X]) (hq : q.Monic) (_hd : q.natDegree = 2) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by
  exact module_generator_map_not_injective q hq.ne_zero

-- test: QuadraticPinch.fractionEquiv.cusp
example (a : algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) :
    fractionEquiv (Polynomial.X ^ 2 : (ZMod 2)[X]) (by simp)
      (algebraMap (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) _ a) =
        algebraMap (ZMod 2)[X] (FractionRing (ZMod 2)[X]) (a : (ZMod 2)[X]) := by
  apply fractionEquiv_algebraMap

-- test: QuadraticPinch.fractionEquiv.unit
example (a : algebra (1 : k[X])) :
    (fractionEquiv (1 : k[X]) one_ne_zero).symm
      (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra (1 : k[X])) (FractionRing (algebra (1 : k[X]))) a := by
  apply fractionEquiv_symm_algebraMap

-- test: QuadraticPinch.fractionEquiv.fractions
example (q : k[X]) (hq : q ≠ 0) (a b : algebra q) :
    fractionEquiv q hq
      (algebraMap (algebra q) (FractionRing (algebra q)) a /
        algebraMap (algebra q) (FractionRing (algebra q)) b) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) /
        algebraMap k[X] (FractionRing k[X]) (b : k[X]) := by
  rw [map_div₀, fractionEquiv_algebraMap, fractionEquiv_algebraMap]

-- test: QuadraticPinch.normalization.repeated_char3
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom.Finite := by
  apply finite_normalization
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.normalization.integral_coordinate
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    IsIntegral (algebra q) (algebraMap k[X] (FractionRing k[X]) Polynomial.X) := by
  exact (integral_iff_polynomial q hq hd _ _).mpr ⟨Polynomial.X, rfl⟩

-- test: QuadraticPinch.normalization.zero_not_finite
example : ¬ (algebra (0 : k[X])).val.toRingHom.Finite := by
  intro hf
  have ha : algebra (0 : k[X]) = ⊥ := by ext f; simp [mem_algebra, Algebra.mem_bot, eq_comm]
  have : Module.Finite (algebra (0 : k[X])) k[X] := hf
  have : Module.Finite k (algebra (0 : k[X])) := by rw [ha]; infer_instance
  have : Module.Finite k k[X] := by
    exact Module.Finite.trans (algebra (0 : k[X])) k[X]
  exact Polynomial.not_finite (R := k) this

end TauCeti.GenusOne.QuadraticPinch

#print axioms TauCeti.GenusOne.QuadraticPinch.algebra
#print axioms TauCeti.GenusOne.QuadraticPinch.mem_algebra
#print axioms TauCeti.GenusOne.QuadraticPinch.constants
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_remainder
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_fst
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_snd
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_reconstruct
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_span
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_module_finite
#print axioms TauCeti.GenusOne.QuadraticPinch.finite_normalization
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_spec_finite
#print axioms TauCeti.GenusOne.QuadraticPinch.fraction_ring
#print axioms TauCeti.GenusOne.QuadraticPinch.integral_closure
#print axioms TauCeti.GenusOne.QuadraticPinch.integral_iff_polynomial
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_algebraMap
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_algebraMap
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_X
#print axioms TauCeti.GenusOne.QuadraticPinch.module_generator_map_not_injective

namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- Native quotient structure, made explicit because AdjoinRoot seals its polynomial action.
local instance polynomialQuotientAlgebra (q : k[X]) : Algebra k[X] (AdjoinRoot q) :=
  (AdjoinRoot.mk q).toAlgebra

local instance polynomialQuotientTower (q : k[X]) :
    IsScalarTower k k[X] (AdjoinRoot q) :=
  IsScalarTower.of_algebraMap_eq fun _ => rfl

lemma normalization_image_span (q f : k[X]) :
    f ∈ Submodule.span (algebra q) ({1} : Set k[X]) ↔ f ∈ algebra q := by
  rw [Submodule.mem_span_singleton]
  constructor
  · rintro ⟨a, ha⟩
    have hav : (a : k[X]) = f := by
      simpa only [Subalgebra.smul_def, smul_eq_mul, mul_one] using ha
    exact hav ▸ a.property
  · intro hf
    exact ⟨⟨f, hf⟩, by simp [Subalgebra.smul_def, smul_eq_mul]⟩

lemma conductor_image_span (q : k[X]) (z : AdjoinRoot q) :
    z ∈ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) ↔
      z ∈ (⊥ : Subalgebra k (AdjoinRoot q)) := by
  rw [Submodule.mem_span_singleton]
  constructor
  · rintro ⟨a, ha⟩
    have hp := a.property
    change AdjoinRoot.mkₐ q (a : k[X]) ∈ (⊥ : Subalgebra k (AdjoinRoot q)) at hp
    have hav : AdjoinRoot.mk q (a : k[X]) = z := by
      change AdjoinRoot.mk q (a : k[X]) * 1 = z at ha
      simpa only [mul_one] using ha
    exact hav ▸ hp
  · intro hz
    obtain ⟨c, hc⟩ := Algebra.mem_bot.mp hz
    refine ⟨⟨Polynomial.C c, constants q c⟩, ?_⟩
    change AdjoinRoot.mk q (Polynomial.C c) * 1 = z
    simpa only [mul_one, AdjoinRoot.mk_C, AdjoinRoot.algebraMap_eq] using hc

def residueCokernelMap (q : k[X]) :
    k[X] →ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) :=
  (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))).mkQ.comp
    (IsScalarTower.toAlgHom (algebra q) k[X] (AdjoinRoot q)).toLinearMap

lemma residueCokernelMap_apply (q f : k[X]) :
    residueCokernelMap q f =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := rfl

lemma residueCokernelMap_ker (q : k[X]) :
    LinearMap.ker (residueCokernelMap q) =
      Submodule.span (algebra q) ({1} : Set k[X]) := by
  ext f
  rw [LinearMap.mem_ker, residueCokernelMap_apply, Submodule.Quotient.mk_eq_zero,
    conductor_image_span, normalization_image_span]
  rfl

lemma residueCokernelMap_surjective (q : k[X]) :
    Function.Surjective (residueCokernelMap q) := by
  intro z
  obtain ⟨e, rfl⟩ := (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))).mkQ_surjective z
  obtain ⟨f, rfl⟩ := AdjoinRoot.mk_surjective e
  exact ⟨f, rfl⟩

noncomputable def residueCokernelEquiv (q : k[X]) :
    (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≃ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) :=
  (Submodule.quotEquivOfEq _ _ (residueCokernelMap_ker q).symm).trans
    ((residueCokernelMap q).quotKerEquivOfSurjective (residueCokernelMap_surjective q))

lemma residueCokernelEquiv_apply (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := rfl

lemma residueCokernelEquiv_symm_apply (q f : k[X]) :
    (residueCokernelEquiv q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by
  rw [← residueCokernelEquiv_apply q f, LinearEquiv.symm_apply_apply]

lemma conductor_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))).restrictScalars k =
      (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule := by
  ext z
  exact conductor_image_span q z

lemma normalization_quotient_reconstruction (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (moduleCoefficients q f).2 • Submodule.Quotient.mk Polynomial.X := by
  conv_lhs => rw [← moduleCoefficients_reconstruct q hq hd f]
  rw [Submodule.Quotient.mk_add, Submodule.Quotient.mk_smul,
    Submodule.Quotient.mk_smul]
  have h1 : (Submodule.Quotient.mk (1 : k[X]) :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 0 := by
    rw [Submodule.Quotient.mk_eq_zero]
    exact Submodule.mem_span_singleton_self _
  simp [h1]

-- node: G.1/quadratic-constant-remainder
lemma constant_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) (h : k[X]) :
    (Polynomial.C c + q * h) %ₘ q = Polynomial.C c := by
  rw [Polynomial.add_modByMonic, Polynomial.self_mul_modByMonic hq, add_zero]
  apply (Polynomial.modByMonic_eq_self_iff hq).mpr
  apply Polynomial.degree_C_le.trans_lt
  rw [Polynomial.degree_eq_natDegree hq.ne_zero, hd]
  norm_num

-- node: G.1/quadratic-remainder-scalar
lemma remainder_scalar (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) : f.val %ₘ q = Polynomial.C ((f.val %ₘ q).coeff 0) := by
  obtain ⟨c, h, hf⟩ := (mem_algebra q f.val).mp f.property
  rw [hf, constant_remainder q hq hd]
  simp

-- node: G.1/quadratic-scalar-unique
lemma scalar_unique (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    {f : k[X]} {c d : k} {h j : k[X]}
    (hc : f = Polynomial.C c + q * h) (hj : f = Polynomial.C d + q * j) : c = d := by
  have hmod := congrArg (fun p : k[X] => p %ₘ q) (hc.symm.trans hj)
  rw [constant_remainder q hq hd, constant_remainder q hq hd] at hmod
  exact Polynomial.C_injective hmod

-- node: G.1/quadratic-linear-remainder
lemma linear_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) : (Polynomial.C c * Polynomial.X) %ₘ q = Polynomial.C c * Polynomial.X := by
  by_cases hc : c = 0
  · simp [hc]
  · apply (Polynomial.modByMonic_eq_self_iff hq).mpr
    rw [Polynomial.degree_C_mul_X hc, Polynomial.degree_eq_natDegree hq.ne_zero, hd]
    norm_num

-- acceptance: the degree-two quotient has a genuine nonconstant root.
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Polynomial.X ∉ algebra q := by
  intro hm
  let f : algebra q := ⟨Polynomial.X, hm⟩
  have h := remainder_scalar q hq hd f
  have hX : (Polynomial.X : k[X]) %ₘ q = Polynomial.X := by
    simpa using linear_remainder q hq hd 1
  change (Polynomial.X : k[X]) %ₘ q = _ at h
  rw [hX] at h
  have hc := congrArg (fun p : k[X] => p.coeff 1) h
  simp at hc

-- acceptance: the zero quotient polynomial leaves only constants.
example : Polynomial.X ∉ algebra (0 : k[X]) := by
  intro h
  obtain ⟨c, j, hj⟩ := (mem_algebra 0 Polynomial.X).mp h
  have hc := congrArg (fun p : k[X] => p.coeff 1) hj
  simp at hc

-- acceptance: degree one makes the pinch all polynomials; degree two is essential.
example : (Polynomial.X : k[X]) ∈ algebra Polynomial.X :=
  (mem_algebra Polynomial.X Polynomial.X).mpr ⟨0, 1, by simp⟩

-- acceptance: the unit ideal prevents scalar uniqueness and residue recovery.
example : (Polynomial.C (1 : k)) %ₘ (1 : k[X]) ≠ Polynomial.C 1 := by simp

-- node: G.1/quadratic-pinch-residue
/-- Compute the unique scalar remainder, with the actual ring-map laws. -/
def residue (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) : algebra q →ₐ[k] k where
  toFun f := (f.val %ₘ q).coeff 0
  map_zero' := by simp
  map_one' := by
    change ((1 : k[X]) %ₘ q).coeff 0 = 1
    have hc : (1 : k[X]) %ₘ q = 1 := by simpa using constant_remainder q hq hd 1 0
    simp [hc]
  map_add' f g := by
    change ((f.val + g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.add_modByMonic, Polynomial.coeff_add]
  map_mul' f g := by
    change ((f.val * g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.mul_modByMonic, remainder_scalar q hq hd f,
      remainder_scalar q hq hd g, ← Polynomial.C_mul]
    have hc := constant_remainder q hq hd
      ((f.val %ₘ q).coeff 0 * (g.val %ₘ q).coeff 0) 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc
  commutes' c := by
    change ((Polynomial.C c) %ₘ q).coeff 0 = c
    have hc := constant_remainder q hq hd c 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc

lemma residue_normal_form (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) (c : k) (h : k[X]) (hf : f.val = Polynomial.C c + q * h) :
    residue q hq hd f = c := by
  change (f.val %ₘ q).coeff 0 = c
  rw [hf, constant_remainder q hq hd]
  simp

lemma residue_surjective (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Function.Surjective (residue q hq hd) := fun c =>
  ⟨algebraMap k (algebra q) c, (residue q hq hd).commutes c⟩

lemma residue_kernel (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    RingHom.ker (residue q hq hd).toRingHom =
      (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by
  ext f
  change ((f.val %ₘ q).coeff 0 = 0) ↔ f.val ∈ Ideal.span {q}
  rw [Ideal.mem_span_singleton]
  constructor
  · intro h
    apply (Polynomial.modByMonic_eq_zero_iff_dvd hq).mp
    rw [remainder_scalar q hq hd f, h, Polynomial.C_0]
  · intro h
    rw [(Polynomial.modByMonic_eq_zero_iff_dvd hq).mpr h]
    simp

-- test: QuadraticPinch.test_residue_constant
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    residue q hq hd (algebraMap k (algebra q) 1) = 1 := (residue q hq hd).commutes 1

-- test: QuadraticPinch.test_residue_q
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (hmem : q ∈ algebra q) :
    residue q hq hd ⟨q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 1 (by simp)

-- test: QuadraticPinch.test_residue_tq
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (hmem : Polynomial.X * q ∈ algebra q) :
    residue q hq hd ⟨Polynomial.X * q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 Polynomial.X (by simp [mul_comm])


lemma normalization_quotient_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (f : k[X]) :
    a • (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        residue q hq hd a • Submodule.Quotient.mk f := by
  obtain ⟨c, h, ha⟩ := (mem_algebra q (a : k[X])).mp a.property
  rw [residue_normal_form q hq hd a c h ha]
  rw [← Submodule.Quotient.mk_smul, ← Submodule.Quotient.mk_smul]
  apply (Submodule.Quotient.eq _).mpr
  rw [normalization_image_span]
  simp only [Algebra.smul_def,
    Polynomial.algebraMap_eq]
  change (a : k[X]) * f - Polynomial.C c * f ∈ algebra q
  rw [ha]
  exact (mem_algebra q _).mpr ⟨0, h * f, by simp only [Polynomial.C_0, zero_add]; ring⟩

lemma normalization_quotient_generator_ne_zero (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    (Submodule.Quotient.mk Polynomial.X :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≠ 0 := by
  intro hm
  rw [Submodule.Quotient.mk_eq_zero, normalization_image_span] at hm
  let f : algebra q := ⟨Polynomial.X, hm⟩
  have h := remainder_scalar q hq hd f
  have hX : (Polynomial.X : k[X]) %ₘ q = Polynomial.X := by
    simpa using linear_remainder q hq hd 1
  change (Polynomial.X : k[X]) %ₘ q = _ at h
  rw [hX] at h
  have hc := congrArg (fun p : k[X] => p.coeff 1) h
  simp at hc

lemma normalization_quotient_annihilator_mem (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) :
    a ∈ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ↔
        residue q hq hd a = 0 := by
  rw [Module.mem_annihilator]
  constructor
  · intro ha
    have he := ha (Submodule.Quotient.mk Polynomial.X)
    rw [normalization_quotient_scalar_action q hq hd] at he
    exact (smul_eq_zero.mp he).resolve_right
      (normalization_quotient_generator_ne_zero q hq hd)
  · intro ha z
    induction z using Submodule.Quotient.induction_on with
    | _ f =>
      rw [normalization_quotient_scalar_action q hq hd, ha, zero_smul]

lemma normalization_quotient_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by
  rw [← residue_kernel q hq hd]
  ext a
  exact normalization_quotient_annihilator_mem q hq hd a

lemma normalization_quotient_finrank (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.finrank k (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 1 := by
  apply (finrank_eq_one_iff_of_nonzero' _
    (normalization_quotient_generator_ne_zero q hq hd)).mpr
  intro z
  induction z using Submodule.Quotient.induction_on with
  | _ f =>
    refine ⟨residue q hq hd (moduleCoefficients q f).2, ?_⟩
    rw [← normalization_quotient_scalar_action q hq hd,
      ← normalization_quotient_reconstruction q hq hd]

lemma residueCokernelEquiv_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by
  rw [← (residueCokernelEquiv q).annihilator_eq]
  exact normalization_quotient_annihilator q hq hd

-- test: QuadraticPinch.residueCokernelMap.constant
example (q : k[X]) (c : k) : residueCokernelMap q (Polynomial.C c) = 0 := by
  apply LinearMap.mem_ker.mp
  rw [residueCokernelMap_ker, normalization_image_span]
  exact constants q c

-- test: QuadraticPinch.residueCokernelMap.multiple
example (q h : k[X]) : residueCokernelMap q (q * h) = 0 := by
  apply LinearMap.mem_ker.mp
  rw [residueCokernelMap_ker, normalization_image_span]
  exact (mem_algebra q _).mpr ⟨0, h, by simp⟩

-- test: QuadraticPinch.residueCokernelMap.cusp_root
example : residueCokernelMap (Polynomial.X ^ 2 : (ZMod 2)[X]) Polynomial.X ≠ 0 := by
  intro hh
  have hm := (LinearMap.mem_ker.mpr hh)
  rw [residueCokernelMap_ker] at hm
  apply normalization_quotient_generator_ne_zero
    (Polynomial.X ^ 2 : (ZMod 2)[X]) (Polynomial.monic_X_pow 2) (by simp)
  exact (Submodule.Quotient.mk_eq_zero _).mpr hm

-- test: QuadraticPinch.residueCokernelEquiv.representatives
example (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by
  exact residueCokernelEquiv_apply q f

-- test: QuadraticPinch.residueCokernelEquiv.unit
example (f : k[X]) :
    residueCokernelEquiv (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by
  have hh : (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra (1 : k[X])) ({1} : Set k[X])) = 0 := by
    rw [Submodule.Quotient.mk_eq_zero, normalization_image_span]
    exact (mem_algebra 1 _).mpr ⟨0, f, by simp⟩
  rw [hh, map_zero]

-- test: QuadraticPinch.residueCokernelEquiv.zero
example (f : k[X]) :
    (residueCokernelEquiv (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra (0 : k[X])) ({1} : Set k[X])) := by
  exact residueCokernelEquiv_symm_apply 0 f

-- test: QuadraticPinch.normalizationCokernel.cusp_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span (algebra (Polynomial.X ^ 2 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by
  exact normalization_quotient_finrank _ (Polynomial.monic_X_pow 2) (by simp)

-- test: QuadraticPinch.normalizationCokernel.nonsplit_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by
  apply normalization_quotient_finrank
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.residueCokernelEquiv.repeated_char3
example :
    Module.annihilator
      (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
      (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]) ⧸
        Submodule.span
          (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
          ({1} : Set (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])))) =
      (Ideal.span ({Polynomial.X ^ 2 + Polynomial.X + 1} : Set (ZMod 3)[X])).comap
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom := by
  apply residueCokernelEquiv_annihilator
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.normalizationCokernel.unit_not_annihilator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (1 : algebra q) ∉ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by
  rw [normalization_quotient_annihilator_mem q hq hd, map_one]
  exact one_ne_zero

-- test: QuadraticPinch.normalizationCokernel.conductor_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (f : k[X]) :
    (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) •
      (Submodule.Quotient.mk f :
        k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 0 := by
  rw [normalization_quotient_scalar_action q hq hd]
  have hr := residue_normal_form q hq hd
    (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) 0 1 (by simp)
  rw [hr, zero_smul]

lemma residueCokernelEquiv_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by
  obtain ⟨f, rfl⟩ := AdjoinRoot.mk_surjective z
  have hh := congrArg (residueCokernelEquiv q)
    (normalization_quotient_scalar_action q hq hd a f)
  have hc :
      residueCokernelEquiv q ((residue q hq hd a) • Submodule.Quotient.mk f) =
        (residue q hq hd a) • residueCokernelEquiv q (Submodule.Quotient.mk f) :=
    LinearMapClass.map_smul_of_tower (R := k) (residueCokernelEquiv q) _ _
  rw [(residueCokernelEquiv q).map_smul] at hh
  simpa only [residueCokernelEquiv_apply] using hh.trans hc

-- test: QuadraticPinch.residueCokernelEquiv.scalar_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by
  exact residueCokernelEquiv_scalar_action q hq hd a z

lemma normalization_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set k[X])).restrictScalars k =
      (algebra q).toSubmodule := by
  ext f
  exact normalization_image_span q f

noncomputable def residueCokernelEquiv_over_k (q : k[X]) :
    (k[X] ⧸ (algebra q).toSubmodule) ≃ₗ[k]
      AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule :=
  (Submodule.quotEquivOfEq _ _ (normalization_span_restrictScalars q).symm).trans
    ((Submodule.Quotient.restrictScalarsEquiv k
      (Submodule.span (algebra q) ({1} : Set k[X]))).trans
      (((residueCokernelEquiv q).restrictScalars k).trans
        ((Submodule.Quotient.restrictScalarsEquiv k
          (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)))).symm.trans
            (Submodule.quotEquivOfEq _ _ (conductor_span_restrictScalars q)))))

lemma residueCokernelEquiv_over_k_apply (q f : k[X]) :
    residueCokernelEquiv_over_k q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule) := by
  simp only [residueCokernelEquiv_over_k, LinearEquiv.trans_apply,
    Submodule.quotEquivOfEq_mk, Submodule.Quotient.restrictScalarsEquiv_mk]
  rfl

lemma residueCokernelEquiv_over_k_symm_apply (q f : k[X]) :
    (residueCokernelEquiv_over_k q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra q).toSubmodule) := by
  rw [← residueCokernelEquiv_over_k_apply q f, LinearEquiv.symm_apply_apply]

-- test: QuadraticPinch.residueCokernelEquiv_over_k.cusp
example (f : (ZMod 2)[X]) :
    residueCokernelEquiv_over_k (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk (Polynomial.X ^ 2) f) :
        AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]) ⧸
          (⊥ : Subalgebra (ZMod 2) (AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]))).toSubmodule) := by
  exact residueCokernelEquiv_over_k_apply _ f

-- test: QuadraticPinch.residueCokernelEquiv_over_k.unit
example (f : k[X]) :
    residueCokernelEquiv_over_k (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by
  have hh : (Submodule.Quotient.mk f :
      k[X] ⧸ (algebra (1 : k[X])).toSubmodule) = 0 := by
    rw [Submodule.Quotient.mk_eq_zero]
    exact (mem_algebra 1 _).mpr ⟨0, f, by simp⟩
  rw [hh, map_zero]

-- test: QuadraticPinch.residueCokernelEquiv_over_k.zero
example (f : k[X]) :
    (residueCokernelEquiv_over_k (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra (0 : k[X])).toSubmodule) := by
  exact residueCokernelEquiv_over_k_symm_apply 0 f
end TauCeti.GenusOne.QuadraticPinch

#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_image_span
#print axioms TauCeti.GenusOne.QuadraticPinch.conductor_image_span
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelMap
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_apply
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_ker
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_surjective
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_apply
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_symm_apply
#print axioms TauCeti.GenusOne.QuadraticPinch.conductor_span_restrictScalars
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_reconstruction
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_finrank
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_annihilator
#print axioms TauCeti.GenusOne.QuadraticPinch.polynomialQuotientAlgebra
#print axioms TauCeti.GenusOne.QuadraticPinch.polynomialQuotientTower
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_scalar_action
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_span_restrictScalars
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k_apply
#print axioms TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k_symm_apply
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_annihilator
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_annihilator_mem
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_generator_ne_zero
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_quotient_scalar_action
#print axioms TauCeti.GenusOne.QuadraticPinch.residue_kernel
#print axioms TauCeti.GenusOne.QuadraticPinch.residue_surjective
#print axioms TauCeti.GenusOne.QuadraticPinch.residue_normal_form
#print axioms TauCeti.GenusOne.QuadraticPinch.residue
#print axioms TauCeti.GenusOne.QuadraticPinch.linear_remainder
#print axioms TauCeti.GenusOne.QuadraticPinch.scalar_unique
#print axioms TauCeti.GenusOne.QuadraticPinch.remainder_scalar
#print axioms TauCeti.GenusOne.QuadraticPinch.constant_remainder
-- END ARCHIVED CHECKED AFFINE NORMALIZATION COKERNEL

-- BEGIN ARCHIVED ADMITTED AFFINE COKERNEL HEADERS
import Mathlib

open Polynomial
noncomputable section
universe u v w

namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- node: G.1/quadratic-pinch-algebra
/-- The preimage of the constants in the native polynomial quotient. -/
def algebra (q : k[X]) : Subalgebra k k[X] :=
  (⊥ : Subalgebra k (AdjoinRoot q)).comap (AdjoinRoot.mkₐ q)

lemma mem_algebra (q f : k[X]) :
    f ∈ algebra q ↔ ∃ c : k, ∃ h : k[X], f = Polynomial.C c + q * h := by
  change AdjoinRoot.mkₐ q f ∈ (⊥ : Subalgebra k (AdjoinRoot q)) ↔ _
  rw [Algebra.mem_bot]
  constructor
  · rintro ⟨c, hc⟩
    have hdiv : q ∣ f - Polynomial.C c := AdjoinRoot.mk_eq_mk.mp hc.symm
    obtain ⟨h, hh⟩ := hdiv
    exact ⟨c, h, by rw [← hh]; ring⟩
  · rintro ⟨c, h, rfl⟩
    exact ⟨c, by simp⟩

lemma constants (q : k[X]) (c : k) : Polynomial.C c ∈ algebra q := by
  exact (mem_algebra q _).mpr ⟨c, 0, by simp⟩

lemma normalization_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : k[X]) :
    f %ₘ q = Polynomial.C ((f %ₘ q).coeff 0) +
      Polynomial.C ((f %ₘ q).coeff 1) * Polynomial.X := by
  have hm := Polynomial.natDegree_modByMonic_lt f hq (by
    intro he; have he' := congrArg Polynomial.natDegree he; simp [hd] at he')
  have hm' : (f %ₘ q).natDegree ≤ 1 := by omega
  simpa [add_comm] using Polynomial.eq_X_add_C_of_natDegree_le_one hm'

noncomputable def moduleCoefficients (q f : k[X]) : algebra q × algebra q :=
  (⟨Polynomial.C ((f %ₘ q).coeff 0) + q * (f /ₘ q),
    (mem_algebra q _).mpr ⟨(f %ₘ q).coeff 0, f /ₘ q, rfl⟩⟩,
   ⟨Polynomial.C ((f %ₘ q).coeff 1), constants q _⟩)

lemma moduleCoefficients_fst (q f : k[X]) :
    ((moduleCoefficients q f).1 : k[X]) =
      Polynomial.C ((f %ₘ q).coeff 0) + q * (f /ₘ q) := rfl

lemma moduleCoefficients_snd (q f : k[X]) :
    ((moduleCoefficients q f).2 : k[X]) = Polynomial.C ((f %ₘ q).coeff 1) := rfl

lemma moduleCoefficients_reconstruct (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (moduleCoefficients q f).1 • (1 : k[X]) +
      (moduleCoefficients q f).2 • Polynomial.X = f := by
  simp only [Subalgebra.smul_def, moduleCoefficients_fst, moduleCoefficients_snd, smul_eq_mul, mul_one]
  rw [add_right_comm, ← normalization_remainder q hq hd f,
    Polynomial.modByMonic_add_div]

lemma normalization_span (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Submodule.span (algebra q) ({1, Polynomial.X} : Set k[X]) = ⊤ := by
  apply Submodule.eq_top_iff'.mpr
  intro f
  rw [← moduleCoefficients_reconstruct q hq hd f]
  exact Submodule.add_mem _
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))

lemma normalization_module_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Module.Finite (algebra q) k[X] := by
  rw [Module.finite_def, ← normalization_span q hq hd]
  exact Submodule.fg_span (Set.toFinite _)

lemma finite_normalization (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (algebra q).val.toRingHom.Finite := by
  exact normalization_module_finite q hq hd

lemma normalization_spec_finite (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    AlgebraicGeometry.IsFinite (AlgebraicGeometry.Spec.map
      (CommRingCat.ofHom (algebra q).val.toRingHom)) := by
  exact (AlgebraicGeometry.IsFinite.SpecMap_iff _).mpr (finite_normalization q hq hd)

lemma fraction_ring (q : k[X]) (hq : q ≠ 0)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsFractionRing (algebra q) K := by
  have hinj : Function.Injective (algebraMap (algebra q) K) := by
    rw [IsScalarTower.algebraMap_eq (algebra q) k[X] K]
    exact (IsFractionRing.injective k[X] K).comp Subtype.val_injective
  have : FaithfulSMul (algebra q) K :=
    (faithfulSMul_iff_algebraMap_injective (algebra q) K).mpr hinj
  apply IsFractionRing.of_field
  intro z
  obtain ⟨a, b, hb, hz⟩ := IsFractionRing.div_surjective k[X] z
  let qa : algebra q := ⟨q * a, (mem_algebra q _).mpr ⟨0, a, by simp⟩⟩
  let qb : algebra q := ⟨q * b, (mem_algebra q _).mpr ⟨0, b, by simp⟩⟩
  refine ⟨qa, qb, ?_⟩
  rw [IsScalarTower.algebraMap_apply (algebra q) k[X] K qa,
    IsScalarTower.algebraMap_apply (algebra q) k[X] K qb]
  change z = algebraMap k[X] K (q * a) / algebraMap k[X] K (q * b)
  rw [map_mul, map_mul, mul_div_mul_left _ _
    ((map_ne_zero_iff _ (IsFractionRing.injective k[X] K)).mpr hq)]
  exact hz.symm

lemma integral_closure (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K]
    :
    IsIntegralClosure k[X] (algebra q) K := by
  have : Module.Finite (algebra q) k[X] := normalization_module_finite q hq hd
  have : Algebra.IsIntegral (algebra q) k[X] := Algebra.IsIntegral.of_finite _ _
  infer_instance

lemma integral_iff_polynomial (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (K : Type v) [Field K] [Algebra k[X] K] [IsFractionRing k[X] K] (z : K) :
    IsIntegral (algebra q) z ↔ ∃ f : k[X], algebraMap k[X] K f = z := by
  have := integral_closure q hq hd K
  exact IsIntegralClosure.isIntegral_iff

noncomputable def fractionEquiv (q : k[X]) (hq : q ≠ 0) :
    FractionRing (algebra q) ≃ₐ[algebra q] FractionRing k[X] := by
  have := fraction_ring q hq (FractionRing k[X])
  exact FractionRing.algEquiv (A := algebra q) (FractionRing k[X])

lemma fractionEquiv_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    fractionEquiv q hq (algebraMap (algebra q) (FractionRing (algebra q)) a) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) := by
  exact (fractionEquiv q hq).commutes a

lemma fractionEquiv_symm_algebraMap (q : k[X]) (hq : q ≠ 0) (a : algebra q) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra q) (FractionRing (algebra q)) a := by
  apply (fractionEquiv q hq).injective
  rw [AlgEquiv.apply_symm_apply]
  exact (fractionEquiv_algebraMap q hq a).symm

lemma fractionEquiv_symm_X (q : k[X]) (hq : q ≠ 0) :
    (fractionEquiv q hq).symm (algebraMap k[X] (FractionRing k[X]) Polynomial.X) =
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q * Polynomial.X, (mem_algebra q _).mpr ⟨0, Polynomial.X, by simp⟩⟩ : algebra q) /
      algebraMap (algebra q) (FractionRing (algebra q))
        (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) := by
  apply (fractionEquiv q hq).injective
  rw [AlgEquiv.apply_symm_apply, map_div₀, fractionEquiv_algebraMap,
    fractionEquiv_algebraMap, map_mul]
  exact (mul_div_cancel_left₀ _
    ((map_ne_zero_iff _ (IsFractionRing.injective k[X] (FractionRing k[X]))).mpr hq)).symm

lemma module_generator_map_not_injective (q : k[X]) (hq : q ≠ 0) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by
  intro hinj
  let a : algebra q := ⟨-(q * Polynomial.X),
    (mem_algebra q _).mpr ⟨0, -Polynomial.X, by simp⟩⟩
  let b : algebra q := ⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩
  have he : a • (1 : k[X]) + b • Polynomial.X =
      (0 : algebra q) • (1 : k[X]) + (0 : algebra q) • Polynomial.X := by
    simp [Subalgebra.smul_def, smul_eq_mul, a, b]
  have hp := hinj (show (fun z : algebra q × algebra q =>
    z.1 • (1 : k[X]) + z.2 • Polynomial.X) (a, b) =
    (fun z : algebra q × algebra q => z.1 • (1 : k[X]) + z.2 • Polynomial.X) (0, 0)
    from he)
  have hb := congrArg (fun z : algebra q × algebra q => (z.2 : k[X])) hp
  exact hq hb

-- test: QuadraticPinch.moduleCoefficients.zero
example (q : k[X]) : moduleCoefficients q 0 = (0, 0) := by
  apply Prod.ext <;> apply Subtype.ext <;> simp [moduleCoefficients]

-- test: QuadraticPinch.moduleCoefficients.generator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    moduleCoefficients q Polynomial.X = (0, 1) := by
  have ht : (Polynomial.X : k[X]).degree < q.degree := by
    rw [Polynomial.degree_X, Polynomial.degree_eq_natDegree hq.ne_zero, hd]
    decide
  have hr := (Polynomial.modByMonic_eq_self_iff hq).mpr ht
  have hdv : (Polynomial.X : k[X]) /ₘ q = 0 :=
    (Polynomial.divByMonic_eq_zero_iff hq).mpr ht
  apply Prod.ext <;> apply Subtype.ext <;> simp [moduleCoefficients, hr, hdv]

-- test: QuadraticPinch.moduleCoefficients.cusp
example :
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).1 : (ZMod 2)[X]) = Polynomial.X ^ 3 ∧
    ((moduleCoefficients (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Polynomial.X ^ 3)).2 : (ZMod 2)[X]) = 0 := by
  have he : (Polynomial.X ^ 3 : (ZMod 2)[X]) = Polynomial.X ^ 2 * Polynomial.X := by ring
  simp [moduleCoefficients, he, Polynomial.self_mul_modByMonic,
    Polynomial.monic_X_pow, Polynomial.mul_divByMonic_cancel_left]

-- test: QuadraticPinch.normalization.cusp_finite
example : (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])).val.toRingHom.Finite := by
  exact finite_normalization _ (Polynomial.monic_X_pow 2) (by simp)

-- test: QuadraticPinch.normalization.nonsplit_finite
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X])).val.toRingHom.Finite := by
  apply finite_normalization
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 2)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.normalization.not_basis
example (q : k[X]) (hq : q.Monic) (_hd : q.natDegree = 2) :
    ¬ Function.Injective (fun z : algebra q × algebra q =>
      z.1 • (1 : k[X]) + z.2 • Polynomial.X) := by
  exact module_generator_map_not_injective q hq.ne_zero

-- test: QuadraticPinch.fractionEquiv.cusp
example (a : algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) :
    fractionEquiv (Polynomial.X ^ 2 : (ZMod 2)[X]) (by simp)
      (algebraMap (algebra (Polynomial.X ^ 2 : (ZMod 2)[X])) _ a) =
        algebraMap (ZMod 2)[X] (FractionRing (ZMod 2)[X]) (a : (ZMod 2)[X]) := by
  apply fractionEquiv_algebraMap

-- test: QuadraticPinch.fractionEquiv.unit
example (a : algebra (1 : k[X])) :
    (fractionEquiv (1 : k[X]) one_ne_zero).symm
      (algebraMap k[X] (FractionRing k[X]) (a : k[X])) =
      algebraMap (algebra (1 : k[X])) (FractionRing (algebra (1 : k[X]))) a := by
  apply fractionEquiv_symm_algebraMap

-- test: QuadraticPinch.fractionEquiv.fractions
example (q : k[X]) (hq : q ≠ 0) (a b : algebra q) :
    fractionEquiv q hq
      (algebraMap (algebra q) (FractionRing (algebra q)) a /
        algebraMap (algebra q) (FractionRing (algebra q)) b) =
      algebraMap k[X] (FractionRing k[X]) (a : k[X]) /
        algebraMap k[X] (FractionRing k[X]) (b : k[X]) := by
  rw [map_div₀, fractionEquiv_algebraMap, fractionEquiv_algebraMap]

-- test: QuadraticPinch.normalization.repeated_char3
example : (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom.Finite := by
  apply finite_normalization
  · simpa [Polynomial.Monic] using (Polynomial.leadingCoeff_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)
  · simpa using (Polynomial.natDegree_quadratic
      (a := (1 : ZMod 3)) (b := 1) (c := 1) one_ne_zero)

-- test: QuadraticPinch.normalization.integral_coordinate
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    IsIntegral (algebra q) (algebraMap k[X] (FractionRing k[X]) Polynomial.X) := by
  exact (integral_iff_polynomial q hq hd _ _).mpr ⟨Polynomial.X, rfl⟩

-- test: QuadraticPinch.normalization.zero_not_finite
example : ¬ (algebra (0 : k[X])).val.toRingHom.Finite := by
  intro hf
  have ha : algebra (0 : k[X]) = ⊥ := by ext f; simp [mem_algebra, Algebra.mem_bot, eq_comm]
  have : Module.Finite (algebra (0 : k[X])) k[X] := hf
  have : Module.Finite k (algebra (0 : k[X])) := by rw [ha]; infer_instance
  have : Module.Finite k k[X] := by
    exact Module.Finite.trans (algebra (0 : k[X])) k[X]
  exact Polynomial.not_finite (R := k) this

end TauCeti.GenusOne.QuadraticPinch

#print axioms TauCeti.GenusOne.QuadraticPinch.algebra
#print axioms TauCeti.GenusOne.QuadraticPinch.mem_algebra
#print axioms TauCeti.GenusOne.QuadraticPinch.constants
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_remainder
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_fst
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_snd
#print axioms TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_reconstruct
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_span
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_module_finite
#print axioms TauCeti.GenusOne.QuadraticPinch.finite_normalization
#print axioms TauCeti.GenusOne.QuadraticPinch.normalization_spec_finite
#print axioms TauCeti.GenusOne.QuadraticPinch.fraction_ring
#print axioms TauCeti.GenusOne.QuadraticPinch.integral_closure
#print axioms TauCeti.GenusOne.QuadraticPinch.integral_iff_polynomial
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_algebraMap
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_algebraMap
#print axioms TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_X
#print axioms TauCeti.GenusOne.QuadraticPinch.module_generator_map_not_injective

namespace TauCeti.GenusOne.QuadraticPinch

variable {k : Type u} [Field k]

-- Native quotient structure, made explicit because AdjoinRoot seals its polynomial action.
local instance polynomialQuotientAlgebra (q : k[X]) : Algebra k[X] (AdjoinRoot q) :=
  (AdjoinRoot.mk q).toAlgebra

local instance polynomialQuotientTower (q : k[X]) :
    IsScalarTower k k[X] (AdjoinRoot q) :=
  IsScalarTower.of_algebraMap_eq fun _ => rfl

lemma normalization_image_span (q f : k[X]) :
    f ∈ Submodule.span (algebra q) ({1} : Set k[X]) ↔ f ∈ algebra q := by sorry

lemma conductor_image_span (q : k[X]) (z : AdjoinRoot q) :
    z ∈ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) ↔
      z ∈ (⊥ : Subalgebra k (AdjoinRoot q)) := by sorry

def residueCokernelMap (q : k[X]) :
    k[X] →ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) := by sorry

lemma residueCokernelMap_apply (q f : k[X]) :
    residueCokernelMap q f =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

lemma residueCokernelMap_ker (q : k[X]) :
    LinearMap.ker (residueCokernelMap q) =
      Submodule.span (algebra q) ({1} : Set k[X]) := by sorry

lemma residueCokernelMap_surjective (q : k[X]) :
    Function.Surjective (residueCokernelMap q) := by sorry

noncomputable def residueCokernelEquiv (q : k[X]) :
    (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≃ₗ[algebra q]
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q)) := by sorry

lemma residueCokernelEquiv_apply (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

lemma residueCokernelEquiv_symm_apply (q f : k[X]) :
    (residueCokernelEquiv q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by sorry

lemma conductor_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))).restrictScalars k =
      (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule := by sorry

lemma normalization_quotient_reconstruction (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (f : k[X]) :
    (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (moduleCoefficients q f).2 • Submodule.Quotient.mk Polynomial.X := by sorry

-- node: G.1/quadratic-constant-remainder
lemma constant_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) (h : k[X]) :
    (Polynomial.C c + q * h) %ₘ q = Polynomial.C c := by
  rw [Polynomial.add_modByMonic, Polynomial.self_mul_modByMonic hq, add_zero]
  apply (Polynomial.modByMonic_eq_self_iff hq).mpr
  apply Polynomial.degree_C_le.trans_lt
  rw [Polynomial.degree_eq_natDegree hq.ne_zero, hd]
  norm_num

-- node: G.1/quadratic-remainder-scalar
lemma remainder_scalar (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) : f.val %ₘ q = Polynomial.C ((f.val %ₘ q).coeff 0) := by
  obtain ⟨c, h, hf⟩ := (mem_algebra q f.val).mp f.property
  rw [hf, constant_remainder q hq hd]
  simp

-- node: G.1/quadratic-scalar-unique
lemma scalar_unique (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    {f : k[X]} {c d : k} {h j : k[X]}
    (hc : f = Polynomial.C c + q * h) (hj : f = Polynomial.C d + q * j) : c = d := by
  have hmod := congrArg (fun p : k[X] => p %ₘ q) (hc.symm.trans hj)
  rw [constant_remainder q hq hd, constant_remainder q hq hd] at hmod
  exact Polynomial.C_injective hmod

-- node: G.1/quadratic-linear-remainder
lemma linear_remainder (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (c : k) : (Polynomial.C c * Polynomial.X) %ₘ q = Polynomial.C c * Polynomial.X := by
  by_cases hc : c = 0
  · simp [hc]
  · apply (Polynomial.modByMonic_eq_self_iff hq).mpr
    rw [Polynomial.degree_C_mul_X hc, Polynomial.degree_eq_natDegree hq.ne_zero, hd]
    norm_num

-- acceptance: the degree-two quotient has a genuine nonconstant root.
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Polynomial.X ∉ algebra q := by
  intro hm
  let f : algebra q := ⟨Polynomial.X, hm⟩
  have h := remainder_scalar q hq hd f
  have hX : (Polynomial.X : k[X]) %ₘ q = Polynomial.X := by
    simpa using linear_remainder q hq hd 1
  change (Polynomial.X : k[X]) %ₘ q = _ at h
  rw [hX] at h
  have hc := congrArg (fun p : k[X] => p.coeff 1) h
  simp at hc

-- acceptance: the zero quotient polynomial leaves only constants.
example : Polynomial.X ∉ algebra (0 : k[X]) := by
  intro h
  obtain ⟨c, j, hj⟩ := (mem_algebra 0 Polynomial.X).mp h
  have hc := congrArg (fun p : k[X] => p.coeff 1) hj
  simp at hc

-- acceptance: degree one makes the pinch all polynomials; degree two is essential.
example : (Polynomial.X : k[X]) ∈ algebra Polynomial.X :=
  (mem_algebra Polynomial.X Polynomial.X).mpr ⟨0, 1, by simp⟩

-- acceptance: the unit ideal prevents scalar uniqueness and residue recovery.
example : (Polynomial.C (1 : k)) %ₘ (1 : k[X]) ≠ Polynomial.C 1 := by simp

-- node: G.1/quadratic-pinch-residue
/-- Compute the unique scalar remainder, with the actual ring-map laws. -/
def residue (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) : algebra q →ₐ[k] k where
  toFun f := (f.val %ₘ q).coeff 0
  map_zero' := by simp
  map_one' := by
    change ((1 : k[X]) %ₘ q).coeff 0 = 1
    have hc : (1 : k[X]) %ₘ q = 1 := by simpa using constant_remainder q hq hd 1 0
    simp [hc]
  map_add' f g := by
    change ((f.val + g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.add_modByMonic, Polynomial.coeff_add]
  map_mul' f g := by
    change ((f.val * g.val) %ₘ q).coeff 0 = _
    rw [Polynomial.mul_modByMonic, remainder_scalar q hq hd f,
      remainder_scalar q hq hd g, ← Polynomial.C_mul]
    have hc := constant_remainder q hq hd
      ((f.val %ₘ q).coeff 0 * (g.val %ₘ q).coeff 0) 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc
  commutes' c := by
    change ((Polynomial.C c) %ₘ q).coeff 0 = c
    have hc := constant_remainder q hq hd c 0
    simpa using congrArg (fun p : k[X] => p.coeff 0) hc

lemma residue_normal_form (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (f : algebra q) (c : k) (h : k[X]) (hf : f.val = Polynomial.C c + q * h) :
    residue q hq hd f = c := by
  change (f.val %ₘ q).coeff 0 = c
  rw [hf, constant_remainder q hq hd]
  simp

lemma residue_surjective (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    Function.Surjective (residue q hq hd) := fun c =>
  ⟨algebraMap k (algebra q) c, (residue q hq hd).commutes c⟩

lemma residue_kernel (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    RingHom.ker (residue q hq hd).toRingHom =
      (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by
  ext f
  change ((f.val %ₘ q).coeff 0 = 0) ↔ f.val ∈ Ideal.span {q}
  rw [Ideal.mem_span_singleton]
  constructor
  · intro h
    apply (Polynomial.modByMonic_eq_zero_iff_dvd hq).mp
    rw [remainder_scalar q hq hd f, h, Polynomial.C_0]
  · intro h
    rw [(Polynomial.modByMonic_eq_zero_iff_dvd hq).mpr h]
    simp

-- test: QuadraticPinch.test_residue_constant
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    residue q hq hd (algebraMap k (algebra q) 1) = 1 := (residue q hq hd).commutes 1

-- test: QuadraticPinch.test_residue_q
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (hmem : q ∈ algebra q) :
    residue q hq hd ⟨q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 1 (by simp)

-- test: QuadraticPinch.test_residue_tq
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (hmem : Polynomial.X * q ∈ algebra q) :
    residue q hq hd ⟨Polynomial.X * q,hmem⟩ = 0 :=
  residue_normal_form q hq hd _ 0 Polynomial.X (by simp [mul_comm])


lemma normalization_quotient_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (f : k[X]) :
    a • (Submodule.Quotient.mk f :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        residue q hq hd a • Submodule.Quotient.mk f := by sorry

lemma normalization_quotient_generator_ne_zero (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    (Submodule.Quotient.mk Polynomial.X :
      k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ≠ 0 := by sorry

lemma normalization_quotient_annihilator_mem (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) :
    a ∈ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) ↔
        residue q hq hd a = 0 := by sorry

lemma normalization_quotient_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by sorry

lemma normalization_quotient_finrank (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.finrank k (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 1 := by sorry

lemma residueCokernelEquiv_annihilator (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) :
    Module.annihilator (algebra q)
      (AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        (Ideal.span ({q} : Set k[X])).comap (algebra q).val.toRingHom := by sorry

-- test: QuadraticPinch.residueCokernelMap.constant
example (q : k[X]) (c : k) : residueCokernelMap q (Polynomial.C c) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelMap.multiple
example (q h : k[X]) : residueCokernelMap q (q * h) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelMap.cusp_root
example : residueCokernelMap (Polynomial.X ^ 2 : (ZMod 2)[X]) Polynomial.X ≠ 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.representatives
example (q f : k[X]) :
    residueCokernelEquiv q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.unit
example (f : k[X]) :
    residueCokernelEquiv (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.zero
example (f : k[X]) :
    (residueCokernelEquiv (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f :
          k[X] ⧸ Submodule.span (algebra (0 : k[X])) ({1} : Set k[X])) := by sorry

-- test: QuadraticPinch.normalizationCokernel.cusp_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span (algebra (Polynomial.X ^ 2 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by sorry

-- test: QuadraticPinch.normalizationCokernel.nonsplit_dimension
example :
    Module.finrank (ZMod 2)
      ((ZMod 2)[X] ⧸ Submodule.span
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 2)[X]))
        ({1} : Set (ZMod 2)[X])) = 1 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.repeated_char3
example :
    Module.annihilator
      (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
      (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]) ⧸
        Submodule.span
          (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X]))
          ({1} : Set (AdjoinRoot (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])))) =
      (Ideal.span ({Polynomial.X ^ 2 + Polynomial.X + 1} : Set (ZMod 3)[X])).comap
        (algebra (Polynomial.X ^ 2 + Polynomial.X + 1 : (ZMod 3)[X])).val.toRingHom := by sorry

-- test: QuadraticPinch.normalizationCokernel.unit_not_annihilator
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) :
    (1 : algebra q) ∉ Module.annihilator (algebra q)
      (k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) := by sorry

-- test: QuadraticPinch.normalizationCokernel.conductor_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2) (f : k[X]) :
    (⟨q, (mem_algebra q _).mpr ⟨0, 1, by simp⟩⟩ : algebra q) •
      (Submodule.Quotient.mk f :
        k[X] ⧸ Submodule.span (algebra q) ({1} : Set k[X])) = 0 := by sorry

lemma residueCokernelEquiv_scalar_action (q : k[X]) (hq : q.Monic)
    (hd : q.natDegree = 2) (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by sorry

-- test: QuadraticPinch.residueCokernelEquiv.scalar_action
example (q : k[X]) (hq : q.Monic) (hd : q.natDegree = 2)
    (a : algebra q) (z : AdjoinRoot q) :
    a • (Submodule.Quotient.mk z :
      AdjoinRoot q ⧸ Submodule.span (algebra q) ({1} : Set (AdjoinRoot q))) =
        residue q hq hd a • Submodule.Quotient.mk z := by sorry

lemma normalization_span_restrictScalars (q : k[X]) :
    (Submodule.span (algebra q) ({1} : Set k[X])).restrictScalars k =
      (algebra q).toSubmodule := by sorry

noncomputable def residueCokernelEquiv_over_k (q : k[X]) :
    (k[X] ⧸ (algebra q).toSubmodule) ≃ₗ[k]
      AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule := by sorry

lemma residueCokernelEquiv_over_k_apply (q f : k[X]) :
    residueCokernelEquiv_over_k q (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk q f) :
        AdjoinRoot q ⧸ (⊥ : Subalgebra k (AdjoinRoot q)).toSubmodule) := by sorry

lemma residueCokernelEquiv_over_k_symm_apply (q f : k[X]) :
    (residueCokernelEquiv_over_k q).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk q f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra q).toSubmodule) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.cusp
example (f : (ZMod 2)[X]) :
    residueCokernelEquiv_over_k (Polynomial.X ^ 2 : (ZMod 2)[X])
      (Submodule.Quotient.mk f) =
      (Submodule.Quotient.mk (AdjoinRoot.mk (Polynomial.X ^ 2) f) :
        AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]) ⧸
          (⊥ : Subalgebra (ZMod 2) (AdjoinRoot (Polynomial.X ^ 2 : (ZMod 2)[X]))).toSubmodule) := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.unit
example (f : k[X]) :
    residueCokernelEquiv_over_k (1 : k[X]) (Submodule.Quotient.mk f) = 0 := by sorry

-- test: QuadraticPinch.residueCokernelEquiv_over_k.zero
example (f : k[X]) :
    (residueCokernelEquiv_over_k (0 : k[X])).symm
      (Submodule.Quotient.mk (AdjoinRoot.mk 0 f)) =
        (Submodule.Quotient.mk f : k[X] ⧸ (algebra (0 : k[X])).toSubmodule) := by sorry

end TauCeti.GenusOne.QuadraticPinch
-- END ARCHIVED ADMITTED AFFINE COKERNEL HEADERS
