import Mathlib

/-!
# R03.4: finiteness and characteristic-zero points

Suggested declarations only. Every proof is admitted. Mathlib-only imports allow checking at
082e2d37e8b0463410cdb532e111cd43d5a66174; this file does not import the predecessor's
Tau Ceti-dependent file. The five accepted algebraic point lemmas are dependencies by packet ID.

The constructed finite-local-field integer-ring point has no unconditional signature here:
LocalFieldsRamification Layer 0 must first supply the induced valuation/topology on the actual
IntermediateField and its integer-ring comparison. The adapter below uses an actual AlgEquiv,
not a proposition standing for that missing construction. Likewise the Artinian lifting input
below quantifies concrete AlgHoms and their reductions; R03.1 must derive it from smoothness
in the complete-local coefficient category after the necessary residue-field base change.
-/

namespace TauCeti.R034

/-- residual-fibre-finite-over-complete-subring; finite free completeness is an R03.1 input. -/
theorem finite_of_finite_residual_fibre
    {A B : Type*} [CommRing A] [IsLocalRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CommRing B] [IsLocalRing B] [IsNoetherianRing B]
    [Algebra A B] [IsLocalHom (algebraMap A B)]
    [Module.Finite A (B ⧸ (IsLocalRing.maximalIdeal A).map (algebraMap A B))] :
    Module.Finite A B := by
  sorry

/-- completed-residual-fibre-criterion. The induced completed-ring map is explicit.
Noetherianity of the target completion remains an explicit hypothesis here. -/
theorem finite_completed_of_finite_residual_fibre
    {A B : Type*} [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [CommRing B] [IsLocalRing B] [IsNoetherianRing B]
    [Algebra (AdicCompletion (IsLocalRing.maximalIdeal A) A)
      (AdicCompletion (IsLocalRing.maximalIdeal B) B)]
    [IsLocalHom (algebraMap (AdicCompletion (IsLocalRing.maximalIdeal A) A)
      (AdicCompletion (IsLocalRing.maximalIdeal B) B))]
    [IsNoetherianRing (AdicCompletion (IsLocalRing.maximalIdeal B) B)]
    [Module.Finite (AdicCompletion (IsLocalRing.maximalIdeal A) A)
      ((AdicCompletion (IsLocalRing.maximalIdeal B) B) ⧸
        (IsLocalRing.maximalIdeal (AdicCompletion (IsLocalRing.maximalIdeal A) A)).map
          (algebraMap (AdicCompletion (IsLocalRing.maximalIdeal A) A)
            (AdicCompletion (IsLocalRing.maximalIdeal B) B)))] :
    Module.Finite (AdicCompletion (IsLocalRing.maximalIdeal A) A)
      (AdicCompletion (IsLocalRing.maximalIdeal B) B) := by
  sorry

/-- finite-dvr-algebra-iff-finite-special-fibre. Finite means cardinality on the right. -/
theorem finite_iff_finite_special_fibre
    {O A : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (O ⧸ IsLocalRing.maximalIdeal O)]
    [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [Algebra O A] [IsLocalHom (algebraMap O A)] :
    Module.Finite O A ↔
      Finite (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) := by
  sorry

/-- Integrated finiteness-of-deformation-rings-criteria, narrowed to its faithful-module core. -/
theorem finite_of_faithful_module
    {S R M : Type*} [CommRing S] [IsNoetherianRing S] [CommRing R]
    [Algebra S R] [AddCommGroup M] [Module S M] [Module R M]
    [IsScalarTower S R M] [SMulCommClass R S M]
    [Module.Finite S M] [FaithfulSMul R M] : Module.Finite S R := by
  sorry

/-- finite-maximal-power-quotients, used in the finite-image argument's algebraic tail. -/
theorem finite_maximal_power_quotient
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [Finite (R ⧸ IsLocalRing.maximalIdeal R)] (n : ℕ) :
    Finite (R ⧸ (IsLocalRing.maximalIdeal R) ^ n) := by
  sorry

/-- finite-local-ring-of-dimension-zero. No completeness is required. -/
theorem finite_of_dimension_zero
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [Finite (R ⧸ IsLocalRing.maximalIdeal R)] [Ring.KrullDimLE 0 R] : Finite R := by
  sorry

/-- finite-local-ring-of-finite-prime-quotients. -/
theorem finite_of_finite_prime_quotients
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    (h : ∀ q : Ideal R, q.IsPrime → Finite (R ⧸ q)) : Finite R := by
  sorry

/-- dimension-one-iff-nonnilpotent-uniformizer. Locality of the coefficient map is explicit. -/
theorem dimension_ge_one_iff_not_nilpotent
    {O A : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CommRing A] [IsLocalRing A] [Algebra O A] [Module.Finite O A]
    [IsLocalHom (algebraMap O A)] (π : O) (hπ : Irreducible π) :
    (1 ≤ ringKrullDim A) ↔ ¬ IsNilpotent (algebraMap O A π) := by
  sorry

/-- characteristic-zero-point-of-nonnilpotent-uniformizer: algebraic, with residue extension allowed. -/
theorem exists_integral_point_of_not_nilpotent
    {O K A Ω : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [Field Ω] [Algebra K Ω] [Algebra O Ω] [IsScalarTower O K Ω] [IsAlgClosed Ω]
    [CommRing A] [IsLocalRing A] [Algebra O A] [Module.Finite O A]
    [IsLocalHom (algebraMap O A)] (π : O) (hπ : Irreducible π)
    (h : ¬ IsNilpotent (algebraMap O A π)) :
    ∃ E : IntermediateField K Ω, Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : A →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-- local-hom-continuous-for-maximal-adic-topologies. -/
theorem continuous_local_hom
    {A B : Type*} [CommRing A] [CommRing B] [IsLocalRing A] [IsLocalRing B]
    (f : A →+* B) [IsLocalHom f] :
    @Continuous A B (IsLocalRing.maximalIdeal A).adicTopology
      (IsLocalRing.maximalIdeal B).adicTopology f := by
  sorry

/-- Native adapter for integer-ring-point-with-topology; construction of S and e is supplied upstream. -/
theorem local_point_of_integralClosure_equiv
    {O A E S : Type*} [CommRing O] [CommRing A] [Algebra O A]
    [Field E] [Algebra O E] [CommRing S] [Algebra O S]
    (e : integralClosure O E ≃ₐ[O] S)
    (f : A →ₐ[O] integralClosure O E) [IsLocalHom f.toRingHom] :
    ∃ g : A →ₐ[O] S, IsLocalHom g.toRingHom ∧ ∀ a, g a = e (f a) := by
  sorry

/-- compatible-artinian-limit-is-local: existence and reduction identities already belong to Mathlib. -/
theorem liftAlgHom_isLocalHom
    {A B E : Type*} [CommRing A] [CommRing B] [CommRing E]
    [Algebra A B] [Algebra A E] [IsLocalRing E]
    [IsAdicComplete (IsLocalRing.maximalIdeal E) E]
    (f : (n : ℕ) → B →ₐ[A] E ⧸ (IsLocalRing.maximalIdeal E) ^ n)
    (hf : ∀ {m n : ℕ} (hle : m ≤ n),
      (Ideal.Quotient.factorₐ A (Ideal.pow_le_pow_right hle)).comp (f n) = f m)
    [IsLocalHom (f 1).toRingHom] :
    IsLocalHom (IsAdicComplete.liftAlgHom (IsLocalRing.maximalIdeal E) f hf).toRingHom := by
  sorry

/-- framed-point-from-artinian-lifting. The concrete lifting hypothesis must be supplied
from coefficient-category formal smoothness; it includes the initial residue point. -/
theorem exists_local_lift_of_artinian_lifting
    {A B E : Type*} [CommRing A] [CommRing B] [CommRing E]
    [Algebra A B] [Algebra A E] [IsLocalRing B] [IsLocalRing E]
    [IsAdicComplete (IsLocalRing.maximalIdeal E) E]
    (f₁ : B →ₐ[A] E ⧸ (IsLocalRing.maximalIdeal E) ^ 1)
    [IsLocalHom f₁.toRingHom]
    (hstep : ∀ (n : ℕ) (g : B →ₐ[A] E ⧸ (IsLocalRing.maximalIdeal E) ^ (n + 1)),
      IsLocalHom g.toRingHom →
        ∃ h : B →ₐ[A] E ⧸ (IsLocalRing.maximalIdeal E) ^ (n + 2),
          IsLocalHom h.toRingHom ∧
          (Ideal.Quotient.factorₐ A (Ideal.pow_le_pow_right (by omega : n + 1 ≤ n + 2))).comp h = g) :
    ∃ f : B →ₐ[A] E, IsLocalHom f.toRingHom ∧
      (Ideal.Quotient.mkₐ A ((IsLocalRing.maximalIdeal E) ^ 1)).comp f = f₁ ∧
      @Continuous B E (IsLocalRing.maximalIdeal B).adicTopology
        (IsLocalRing.maximalIdeal E).adicTopology f := by
  sorry

/-- framed-point-from-power-series-presentation; all framing variables are sent to zero. -/
theorem exists_local_point_of_power_series_presentation
    {A B E : Type*} [CommRing A] [CommRing B] [CommRing E]
    [Algebra A B] [Algebra A E] [IsLocalRing A] [IsLocalRing B] [IsLocalRing E]
    (d : ℕ) (e : B ≃ₐ[A] MvPowerSeries (Fin d) A)
    [IsLocalHom (algebraMap A E)] :
    ∃ f : B →ₐ[A] E, IsLocalHom f.toRingHom ∧
      @Continuous B E (IsLocalRing.maximalIdeal B).adicTopology
        (IsLocalRing.maximalIdeal E).adicTopology f := by
  sorry

/-- positive-framing-is-not-module-finite. A monic relation for X contradicts its top coefficient. -/
theorem not_finite_power_series
    {O A : Type*} [CommRing O] [CommRing A] [Nontrivial A] [Algebra O A]
    (d : ℕ) (hd : 0 < d) : ¬ Module.Finite O (MvPowerSeries (Fin d) A) := by
  sorry

/-! Discrimination tests on existing carriers; no new definitions need an API. -/

example (f : ZMod 3 →+* ℚ) : False := by sorry
example : ¬ IsNilpotent (3 : ℤ) := by sorry
example : IsNilpotent (3 : ZMod 9) := by sorry
example : ¬ Module.Finite (ZMod 3) (PowerSeries (ZMod 3)) := by sorry
example : Finite ((PowerSeries (ZMod 3)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (ZMod 3))}) := by sorry
example {A : Type*} [CommRing A] (d : ℕ) (i : Fin d) :
    MvPowerSeries.constantCoeff (MvPowerSeries.X i : MvPowerSeries (Fin d) A) = 0 := by sorry
example {A : Type*} [CommRing A] (a : A) :
    MvPowerSeries.constantCoeff (MvPowerSeries.C a : MvPowerSeries (Fin 0) A) = a := by sorry
example : ¬ ∃ x : ZMod 3, x ^ 2 = 2 := by sorry
example {A : Type*} [CommRing A] (n : ℕ) :
    MvPowerSeries.coeff (Finsupp.single (0 : Fin 1) n)
      ((MvPowerSeries.X (0 : Fin 1) : MvPowerSeries (Fin 1) A) ^ n) = 1 := by sorry

end TauCeti.R034
