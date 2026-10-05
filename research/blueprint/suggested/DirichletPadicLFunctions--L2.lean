import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.Module.Submodule.Equiv
import Mathlib.Algebra.Group.Torsion
import Mathlib.RepresentationTheory.Homological.FiniteCyclic
import Mathlib.Algebra.Colimit.Module
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Algebra.Group.Pi.Units
import Mathlib.RepresentationTheory.Intertwining
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.Algebra.Module.ZMod
import Mathlib.LinearAlgebra.Matrix.Module
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.GCDMonoid.FinsetLemmas
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.NumberTheory.Wilson
import Mathlib.RingTheory.RootsOfUnity.Lemmas
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.NumberTheory.GaussSum
import Mathlib.Data.Nat.Digits.Defs
import Mathlib.Algebra.Order.ToIntervalMod
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.Analytic.Composition
import Mathlib.Analysis.Normed.Algebra.Exponential
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.NumberTheory.DirichletCharacter.Bounds
import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.Algebra.Ring.Int.Units
import Mathlib.Analysis.Normed.Algebra.Basic
import Mathlib.Topology.Algebra.IntermediateField
import Mathlib.RingTheory.Valuation.Extension
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.Data.Nat.Choose.Vandermonde
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.NumberTheory.DirichletCharacter.GaussSum
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Data.ZMod.Units
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.QExpansion
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.PowModTotient
import research.blueprint.suggested.PadicMeasuresIwasawaAlgebras
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.RingTheory.PowerSeries.Substitution
import research.blueprint.suggested.«DirichletPadicLFunctions--L0»
import research.blueprint.suggested.«DirichletPadicLFunctions--L1»
import Mathlib.NumberTheory.DirichletCharacter.Basic


/-!
# Dirichlet L2: All Dirichlet characters

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures and examples suggest names and types for review;
all implementation statuses remain unchecked.

The inherited L2 declarations are projected from the combined source.
L0 and L1 arithmetic prototypes and PMIA are imported from their owners.
The L1 split module and matching compiled supplier modules are unavailable.
The full split file is NOT COMPILED; any separate checks in the handoff
certify only the identified bounded files. No supplier object is replaced.
-/
noncomputable section
open scoped PowerSeries AbstractMeasure

open PowerSeries

noncomputable section
namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

variable {R : Type*} [NormedCommRing R]

noncomputable def primePowerCharacter (n : ℕ) (χ : DirichletCharacter R (p^n)) :
    C(ℤ_[p],R) := sorry

theorem primePowerCharacter_apply (n : ℕ) (χ : DirichletCharacter R (p^n)) (z : ℤ_[p]) :
    primePowerCharacter p n χ z = χ (PadicInt.toZModPow n z) := sorry

theorem primePowerCharacter_natCast (n : ℕ) (χ : DirichletCharacter R (p^n)) (a : ℕ) :
    primePowerCharacter p n χ a = χ a := sorry

theorem primePowerCharacter_one (n : ℕ) (χ : DirichletCharacter R (p^n)) :
    primePowerCharacter p n χ 1 = 1 := sorry

theorem primePowerCharacter_mul (n : ℕ) (χ : DirichletCharacter R (p^n)) (x y : ℤ_[p]) :
    primePowerCharacter p n χ (x*y) = primePowerCharacter p n χ x * primePowerCharacter p n χ y := sorry

theorem primePowerCharacter_mul_char (n : ℕ) (χ ψ : DirichletCharacter R (p^n)) :
    primePowerCharacter p n (χ*ψ) = primePowerCharacter p n χ * primePowerCharacter p n ψ := sorry

theorem primePowerCharacter_zero_level (χ : DirichletCharacter R (p^0)) :
    primePowerCharacter p 0 χ = 1 := sorry

theorem primePowerCharacter_principal_unit (n : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerCharacter p n (1 : DirichletCharacter R (p^n)) (u : ℤ_[p]) = 1 := sorry

theorem primePowerCharacter_nonunit (n : ℕ) (hn : 1 ≤ n)
    (χ : DirichletCharacter R (p^n)) (z : ℤ_[p]) (hz : ¬ IsUnit z) :
    primePowerCharacter p n χ z = 0 := sorry

theorem primePowerCharacter_changeLevel (n m : ℕ) (hn : 1 ≤ n) (h : n ≤ m)
    (χ : DirichletCharacter R (p^n)) :
    primePowerCharacter p m (χ.changeLevel (pow_dvd_pow p h)) = primePowerCharacter p n χ := sorry

section ActualTwist
variable [Algebra ℤ_[p] R] [IsUltrametricDist R] [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]

noncomputable def twistedSmoothedMeasure (n : ℕ) (χ : DirichletCharacter R (p^n))
    (a : ℕ) (ha : ¬ p ∣ a) : D(ℤ_[p],R) := sorry

theorem twistedSmoothedMeasure_eq_weight (n : ℕ) (χ : DirichletCharacter R (p^n))
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p n χ a ha = weight (primePowerCharacter p n χ)
      (extendIntegralCoefficients (R := R) (smoothedMeasure p a ha)) := sorry

theorem twistedSmoothedMeasure_apply (n : ℕ) (χ : DirichletCharacter R (p^n))
    (a : ℕ) (ha : ¬ p ∣ a) (f : C(ℤ_[p],R)) :
    twistedSmoothedMeasure p n χ a ha f =
      extendIntegralCoefficients (R := R) (smoothedMeasure p a ha)
        (primePowerCharacter p n χ * f) := sorry

theorem twistedSmoothedMeasure_one_parameter (n : ℕ) (χ : DirichletCharacter R (p^n))
    (h1 : ¬ p ∣ 1) :
    twistedSmoothedMeasure p n χ 1 h1 = 0 := sorry

theorem twistedSmoothedMeasure_moment (n k : ℕ) (χ : DirichletCharacter R (p^n))
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p n χ a ha
      ((ContinuousMap.id ℤ_[p])^k • (1 : C(ℤ_[p],R))) =
      extendIntegralCoefficients (R := R) (smoothedMeasure p a ha)
        (primePowerCharacter p n χ * ((ContinuousMap.id ℤ_[p])^k • (1 : C(ℤ_[p],R)))) := sorry

theorem twistedSmoothedMeasure_zero_level (χ : DirichletCharacter R (p^0))
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p 0 χ a ha =
      extendIntegralCoefficients (R := R) (smoothedMeasure p a ha) := sorry

theorem unitRestriction_twistedSmoothedMeasure (n : ℕ) (hn : 1 ≤ n)
    (χ : DirichletCharacter R (p^n)) (a : ℕ) (ha : ¬ p ∣ a) :
    unitRestriction p R (twistedSmoothedMeasure p n χ a ha) =
      twistedSmoothedMeasure p n χ a ha := sorry

theorem twistedSmoothedMeasure_principal (n : ℕ) (hn : 1 ≤ n)
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p n (1 : DirichletCharacter R (p^n)) a ha =
      extendIntegralCoefficients (R := R) (unitSmoothedMeasure p a ha) := sorry

theorem twistedSmoothedMeasure_changeLevel (n m : ℕ) (hn : 1 ≤ n) (h : n ≤ m)
    (χ : DirichletCharacter R (p^n)) (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p m (χ.changeLevel (pow_dvd_pow p h)) a ha =
      twistedSmoothedMeasure p n χ a ha := sorry

theorem twistedSmoothedMeasure_mul (n : ℕ) (χ ψ : DirichletCharacter R (p^n))
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p n (χ*ψ) a ha =
      weight (primePowerCharacter p n χ) (twistedSmoothedMeasure p n ψ a ha) := sorry

end ActualTwist

end DirichletPadic

namespace SuggestedCharacterTwistTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

-- SuggestedCharacterTwistTests.positive_level_zero
example (χ : DirichletCharacter ℚ_[3] (3^2)) : primePowerCharacter 3 2 χ 0 = 0 := sorry

-- SuggestedCharacterTwistTests.principal_unit_and_nonunit
example : primePowerCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 1 = 1 ∧
    primePowerCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 3 = 0 := sorry

-- SuggestedCharacterTwistTests.zero_level_zero
example (χ : DirichletCharacter ℚ_[3] (3^0)) : primePowerCharacter 3 0 χ 0 = 1 := sorry

-- SuggestedCharacterTwistTests.dyadic_sign
example : primePowerCharacter 2 2 (1 : DirichletCharacter ℚ_[2] (2^2)) (-1) = 1 := sorry

-- SuggestedCharacterTwistTests.inverse_product_unit
example (χ : DirichletCharacter ℚ_[3] (3^1)) :
    primePowerCharacter 3 1 (χ*χ⁻¹) 2 = 1 ∧ primePowerCharacter 3 1 (χ*χ⁻¹) 3 = 0 := sorry

-- SuggestedCharacterTwistTests.positive_level_change
example (χ : DirichletCharacter ℚ_[3] (3^1)) :
    primePowerCharacter 3 2 (χ.changeLevel (by norm_num : 3^1 ∣ 3^2)) =
      primePowerCharacter 3 1 χ := sorry

variable [IsBoundedSMul ℤ_[3] ℚ_[3]] [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedCharacterTwistTests.zero_smoothing
example (χ : DirichletCharacter ℚ_[3] (3^1)) : twistedSmoothedMeasure 3 1 χ 1 (by norm_num) = 0 := sorry

-- SuggestedCharacterTwistTests.principal_positive_moment
example : twistedSmoothedMeasure 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 2 (by norm_num)
    (ContinuousMap.id ℤ_[3] • (1 : C(ℤ_[3],ℚ_[3]))) = 1/2 := sorry

-- SuggestedCharacterTwistTests.principal_zero_level_moment
example : twistedSmoothedMeasure 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 2 (by norm_num)
    (ContinuousMap.id ℤ_[3] • (1 : C(ℤ_[3],ℚ_[3]))) = -1/4 := sorry

-- SuggestedCharacterTwistTests.dyadic_principal_moment
example : twistedSmoothedMeasure 2 1 (1 : DirichletCharacter ℚ_[2] (2^1)) 3 (by norm_num)
    (ContinuousMap.id ℤ_[2] • (1 : C(ℤ_[2],ℚ_[2]))) = 2/3 := sorry

-- SuggestedCharacterTwistTests.inverse_twist_unit_projection
example (χ : DirichletCharacter ℚ_[3] (3^1)) :
    weight (primePowerCharacter 3 1 χ⁻¹) (twistedSmoothedMeasure 3 1 χ 2 (by norm_num)) =
      extendIntegralCoefficients (R := ℚ_[3]) (unitSmoothedMeasure 3 2 (by norm_num)) := sorry

end SuggestedCharacterTwistTests

namespace DirichletPadic
section TameAlgebra
variable {R : Type*} [CommRing R] {D : ℕ} [NeZero D]

def tameNumerator (η : DirichletCharacter R D) : R⟦X⟧ :=
  -∑ a : ZMod D, C (η a) * smoothingDenominator R a.val

theorem coeff_tameNumerator (η : DirichletCharacter R D) (n : ℕ) :
    coeff n (tameNumerator η) =
      -∑ a : ZMod D, η a * (a.val.choose (n+1) : R) := by sorry

theorem constantCoeff_tameNumerator (η : DirichletCharacter R D) :
    constantCoeff (tameNumerator η) = -∑ a : ZMod D, η a * (a.val : R) := by sorry

theorem tameNumerator_one_level (η : DirichletCharacter R 1) :
    tameNumerator η = 0 := by sorry

theorem tameNumerator_map {S : Type*} [CommRing S] (f : R →+* S)
    (η : DirichletCharacter R D) :
    PowerSeries.map f (tameNumerator η) = tameNumerator (η.ringHomComp f) := by sorry

theorem X_mul_tameNumerator [IsDomain R] (η : DirichletCharacter R D) (hη : η ≠ 1) :
    X * tameNumerator η = -∑ a : ZMod D, C (η a) * (1+X : R⟦X⟧)^a.val := by sorry

def tameSeries (η : DirichletCharacter R D) (hD : IsUnit (D : R)) : R⟦X⟧ :=
  tameNumerator η * invOfUnit (smoothingDenominator R D) hD.unit

theorem smoothingDenominator_mul_tameSeries (η : DirichletCharacter R D)
    (hD : IsUnit (D : R)) :
    smoothingDenominator R D * tameSeries η hD = tameNumerator η := by sorry

theorem coeff_tameSeries_recurrence (η : DirichletCharacter R D)
    (hD : IsUnit (D : R)) (n : ℕ) :
    (D : R) * coeff n (tameSeries η hD) =
      -∑ a : ZMod D, η a * (a.val.choose (n+1) : R) -
      ∑ i ∈ Finset.range n, (D.choose (n-i+1) : R) * coeff i (tameSeries η hD) := by sorry

theorem constantCoeff_tameSeries (η : DirichletCharacter R D) (hD : IsUnit (D : R)) :
    constantCoeff (tameSeries η hD) =
      (-∑ a : ZMod D, η a * (a.val : R)) * (↑hD.unit⁻¹ : R) := by sorry

theorem tameSeries_one_level (η : DirichletCharacter R 1) (hD : IsUnit ((1 : ℕ) : R)) :
    tameSeries η hD = 0 := by sorry

theorem tameSeries_map {S : Type*} [CommRing S] (f : R →+* S)
    (η : DirichletCharacter R D) (hD : IsUnit (D : R)) (hDS : IsUnit (D : S)) :
    PowerSeries.map f (tameSeries η hD) = tameSeries (η.ringHomComp f) hDS := by sorry

theorem tameSeries_unique (η : DirichletCharacter R D) (hD : IsUnit (D : R))
    (F : R⟦X⟧) (hF : smoothingDenominator R D * F = tameNumerator η) :
    F = tameSeries η hD := by sorry

theorem tameSeries_generating [IsDomain R] (η : DirichletCharacter R D)
    (hη : η ≠ 1) (hD : IsUnit (D : R)) :
    (1-(1+X : R⟦X⟧)^D) * tameSeries η hD =
      ∑ a : ZMod D, C (η a) * (1+X : R⟦X⟧)^a.val := by sorry

end TameAlgebra

section TameBounded
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]
  {D : ℕ} [NeZero D]

theorem tameSeries_coeff_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (n : ℕ) :
    ‖coeff n (tameSeries η hD)‖ ≤ 1 := by sorry

def tameCoefficientSequence (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) : BoundedContinuousFunction ℕ K :=
  BoundedContinuousFunction.ofNormedAddCommGroupDiscrete
    (fun n => coeff n (tameSeries η hD)) 1 (tameSeries_coeff_norm_le η hD hpD)

theorem tameCoefficientSequence_apply (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (n : ℕ) :
    tameCoefficientSequence η hD hpD n = coeff n (tameSeries η hD) := by sorry

theorem tameCoefficientSequence_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    ‖tameCoefficientSequence η hD hpD‖ ≤ 1 := by sorry

theorem tameCoefficientSequence_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    tameCoefficientSequence η hD hpD = 0 := by sorry

variable [CompleteSpace K]

def tameMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) : D(ℤ_[p],K) :=
  AbstractMeasure.boundedInvTransform (tameCoefficientSequence η hD hpD)

theorem amiceTransform_tameMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    (tameMeasure η hD hpD).amiceTransform = tameSeries η hD := by sorry

theorem tameMeasure_mass (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    tameMeasure η hD hpD (1 : C(ℤ_[p],K)) =
      (-∑ a : ZMod D, η a * (a.val : K)) * (↑hD.unit⁻¹ : K) := by sorry

theorem tameMeasure_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (μ : D(ℤ_[p],K))
    (hμ : smoothingDenominator K D * μ.amiceTransform = tameNumerator η) :
    μ = tameMeasure η hD hpD := by sorry

end TameBounded

section TameNorm
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
  {D : ℕ} [NeZero D]

theorem tameMeasure_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    ‖AbstractMeasure.toCLMEquiv (tameMeasure η hD hpD)‖ ≤ 1 := by sorry

end TameNorm

end DirichletPadic

namespace SuggestedTameTests
open DirichletPadic

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTameTests.quadratic_numerator
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) :
    tameNumerator η = 1+X := by sorry

-- SuggestedTameTests.principal_numerator
example : tameNumerator (1 : DirichletCharacter ℚ 3) = -C 3-X := by sorry

-- SuggestedTameTests.modulus_one_numerator
example : tameNumerator (1 : DirichletCharacter ℚ 1) = 0 := by sorry

-- SuggestedTameTests.numerator_field_extension
example (η : DirichletCharacter ℚ 3) :
    PowerSeries.map (algebraMap ℚ ℚ_[2]) (tameNumerator η) =
      tameNumerator (η.ringHomComp (algebraMap ℚ ℚ_[2])) := by sorry

-- SuggestedTameTests.quadratic_coefficients
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 0 (tameSeries η hD) = 1/3 ∧ coeff 1 (tameSeries η hD) = 0 ∧
      coeff 2 (tameSeries η hD) = -1/9 ∧ coeff 3 (tameSeries η hD) = 1/9 := by sorry

-- SuggestedTameTests.principal_generating_failure
example (hD : IsUnit (3 : ℚ)) :
    (1-(1+X : ℚ⟦X⟧)^3) * tameSeries (1 : DirichletCharacter ℚ 3) hD ≠
      (1+X : ℚ⟦X⟧)+(1+X : ℚ⟦X⟧)^2 := by sorry

-- SuggestedTameTests.modulus_one_series
example (hD : IsUnit ((1 : ℕ) : ℚ)) : tameSeries (1 : DirichletCharacter ℚ 1) hD = 0 := by sorry

-- SuggestedTameTests.wild_norm_failure
example (η : DirichletCharacter ℚ_[3] 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ_[3])) :
    ‖coeff 0 (tameSeries η hD)‖ = 3 := by sorry

-- SuggestedTameTests.dyadic_sequence_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameCoefficientSequence η hD hpD 3 = 1/9 := by sorry

-- SuggestedTameTests.dyadic_sequence_norm
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖tameCoefficientSequence η hD hpD‖ ≤ 1 := by sorry

-- SuggestedTameTests.modulus_one_sequence
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameCoefficientSequence (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry

-- SuggestedTameTests.dyadic_measure_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2])) = 1/3 := by sorry

-- SuggestedTameTests.dyadic_measure_moment_two
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD ⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ = -2/9 := by sorry

-- SuggestedTameTests.modulus_one_measure
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameMeasure (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry

end SuggestedTameTests

namespace DirichletPadic
section TameGauss
variable {K : Type*} [Field K] {D : ℕ} [NeZero D]

theorem tameGauss_generating (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    (1-(1+X : K⟦X⟧)^D) *
      (-C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
        ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹) =
      ∑ a : ZMod D, C (η a) * (1+X : K⟦X⟧)^a.val := by sorry

theorem tameSeries_eq_gauss (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1 < D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    tameSeries η hDK =
      -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
        ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹ := by sorry

theorem coeff_tameSeries_gauss (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1 < D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) (n : ℕ) :
    coeff n (tameSeries η hDK) =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        (-1 : K)^n * ∑ a : ZMod D, η⁻¹ a * (ε^a.val)^n / (ε^a.val-1)^(n+1) := by sorry

end TameGauss

section TameGaussMeasure
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
  {D : ℕ} [NeZero D]

theorem amiceTransform_tameMeasure_gauss (η : DirichletCharacter K D)
    (hη : η.IsPrimitive) (hD : 1 < D) (hDK : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    (tameMeasure η hDK hpD).amiceTransform =
      -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
        ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹ := by sorry

end TameGaussMeasure

end DirichletPadic

namespace SuggestedGaussTests
open DirichletPadic

-- SuggestedGaussTests.principal_fourier_failure
example (ε : ℚ) :
    (∑ a : ZMod 3, (1 : DirichletCharacter ℚ 3)⁻¹ a * ε^(a.val*0)) ≠
      (1 : DirichletCharacter ℚ 3) (0 : ZMod 3) * (-1) := by sorry

-- SuggestedGaussTests.zero_gauss_normalization
example {K : Type*} [Field K] {D : ℕ} [NeZero D]
    (η : DirichletCharacter K D) (ε : K) :
    -C ((0 : K)⁻¹) * (∑ a : ZMod D,
      C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹) = 0 := by sorry

-- SuggestedGaussTests.quadratic_gauss_denominator
example {K : Type*} [Field K] [CharZero K]
    (η : DirichletCharacter K 3) (hη : η.IsPrimitive) (hη2 : η 2 = -1)
    (ε : K) (hε : IsPrimitiveRoot ε 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0) :
    (C 3+C 3*X+X^2 : K⟦X⟧) *
      (-C ((gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹) *
        ∑ a : ZMod 3, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹) = 1+X := by sorry

-- SuggestedGaussTests.principal_not_primitive
example : ¬(1 : DirichletCharacter ℚ 3).IsPrimitive := by sorry

-- SuggestedGaussTests.quadratic_gauss_cubic
example {K : Type*} [Field K] [CharZero K]
    (η : DirichletCharacter K 3) (hη2 : η 2 = -1) (hD : IsUnit (3 : K)) :
    coeff 3 (tameSeries η hD) = 1/9 := by sorry

-- SuggestedGaussTests.zero_constant_inverse
example {K : Type*} [Field K] : (C (1 : K)*(1+X : K⟦X⟧)-1)⁻¹ = 0 := by sorry

-- SuggestedGaussTests.actual_measure_gauss
example {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
    [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1 < D) (hDK : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    constantCoeff (tameMeasure η hDK hpD).amiceTransform =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        ∑ a : ZMod D, η⁻¹ a / (ε^a.val-1) := by sorry

-- SuggestedGaussTests.primitive_modulus_one
example (η : DirichletCharacter ℚ 1) : tameNumerator η = 0 := by sorry

end SuggestedGaussTests

namespace DirichletPadic
section TameIntegral
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  {D : ℕ} [NeZero D]

def integralTameSeries (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) : (Valuation.integer (NormedField.valuation (K := K)))⟦X⟧ :=
  PowerSeries.mk fun n => ⟨coeff n (tameSeries η hD), by sorry⟩

theorem coe_coeff_integralTameSeries (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (n : ℕ) :
    ((coeff n (integralTameSeries η hD hpD) : (Valuation.integer (NormedField.valuation (K := K)))) : K) = coeff n (tameSeries η hD) := by sorry

theorem map_integralTameSeries (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (integralTameSeries η hD hpD) = tameSeries η hD := by sorry

theorem integralTameSeries_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    integralTameSeries η hD hpD = 0 := by sorry

theorem integralTameSeries_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (F : (Valuation.integer (NormedField.valuation (K := K)))⟦X⟧)
    (hF : PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype F = tameSeries η hD) :
    F = integralTameSeries η hD hpD := by sorry

variable [CompleteSpace K]

theorem tameMeasure_integralTest_bound (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    ‖tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f)‖ ≤ ‖f‖ ∧
    ‖f‖ ≤ 1 := by sorry

def integralTameMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) : D(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))) :=
  AbstractMeasure.toCLMEquiv.symm
    (({ toFun := fun f =>
          ⟨tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f),
            by sorry⟩
        map_add' := by sorry
        map_smul' := by sorry } : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))) →ₗ[(Valuation.integer (NormedField.valuation (K := K)))] (Valuation.integer (NormedField.valuation (K := K)))).mkContinuous 1 (by sorry))

theorem coe_integralTameMeasure_apply (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    (integralTameMeasure η hD hpD f : K) =
      tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f) := by sorry

theorem integralTameMeasure_bound (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    ‖integralTameMeasure η hD hpD f‖ ≤ ‖f‖ := by sorry

theorem integralTameMeasure_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    integralTameMeasure η hD hpD = 0 := by sorry

theorem coe_integralTameMeasure_mass (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    (integralTameMeasure η hD hpD (1 : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) : K) =
      (-∑ a : ZMod D, η a * (a.val : K)) * (↑hD.unit⁻¹ : K) := by sorry

theorem integralTameMeasure_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (ν : D(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))))
    (hν : ∀ f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))), (ν f : K) =
      tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f)) :
    ν = integralTameMeasure η hD hpD := by sorry

variable [Algebra ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [ContinuousSMul ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [IsScalarTower ℤ_[p] (Valuation.integer (NormedField.valuation (K := K))) K]

theorem amiceTransform_integralTameMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    (integralTameMeasure η hD hpD).amiceTransform = integralTameSeries η hD hpD := by sorry

theorem map_amiceTransform_integralTameMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (integralTameMeasure η hD hpD).amiceTransform =
      (tameMeasure η hD hpD).amiceTransform := by sorry

end TameIntegral

end DirichletPadic

namespace SuggestedIntegralTameTests
open DirichletPadic

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedIntegralTameTests.dyadic_integral_coefficient
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 3 (integralTameSeries η hD hpD) : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) = 1/9 := by sorry

-- SuggestedIntegralTameTests.modulus_one_integral_series
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameSeries (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry

-- SuggestedIntegralTameTests.wild_coefficient_not_integral
example : (1/3 : ℚ_[3]) ∉ Valuation.integer (NormedField.valuation (K := ℚ_[3])) := by sorry

-- SuggestedIntegralTameTests.dyadic_integral_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (integralTameMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) = 1/3 := by sorry

-- SuggestedIntegralTameTests.modulus_one_integral_measure
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameMeasure (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry

-- SuggestedIntegralTameTests.integral_measure_zero_test
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    integralTameMeasure η hD hpD (0 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) = 0 := by sorry

-- SuggestedIntegralTameTests.integral_measure_scalar_test
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (r : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) :
    integralTameMeasure η hD hpD (r • f) = r * integralTameMeasure η hD hpD f := by sorry

-- SuggestedIntegralTameTests.integral_measure_uniqueness
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (ν : D(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hν : ∀ f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2])))), (ν f : ℚ_[2]) =
      tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := ℚ_[2]))),ℚ_[2])).comp f)) :
    ν = integralTameMeasure η hD hpD := by sorry

variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]

-- SuggestedIntegralTameTests.integral_transform_transport
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (integralTameMeasure η hD hpD).amiceTransform =
      tameSeries η hD := by sorry

-- SuggestedIntegralTameTests.integral_transform_quadratic_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 0 (integralTameMeasure η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) = 1/3 := by sorry

end SuggestedIntegralTameTests

namespace DirichletPadic
section TameResidues
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

theorem tameMeasure_translation (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    tameMeasure η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[p] => x+(D : ℤ_[p]), by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
      (tameMeasure η hD hpD) =
      ∑ b : ZMod D, η b • AbstractMeasure.dirac K (b.val : ℤ_[p]) := by sorry

variable [CharZero K]

theorem tameMeasure_residue (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (n : ℕ) (a : ZMod (p^n)) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow n, PadicInt.continuous_toZModPow p n⟩ : C(ℤ_[p],ZMod (p^n)))
      (tameMeasure η hD hpD) a =
      -(↑hD.unit⁻¹ : K) * ∑ j : ZMod D, η ((a.val+p^n*j.val : ℕ) : ZMod D) * (j.val : K) := by sorry

theorem tameMeasure_residue_zero_level (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 0, PadicInt.continuous_toZModPow p 0⟩ : C(ℤ_[p],ZMod (p^0)))
      (tameMeasure η hD hpD) 0 = tameMeasure η hD hpD (1 : C(ℤ_[p],K)) := by sorry

theorem psiMeasure_tameMeasure (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.psiMeasure p K (tameMeasure η hD hpD) =
      η (p : ZMod D) • tameMeasure η hD hpD := by sorry

theorem psiMeasure_tameMeasure_mass (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.psiMeasure p K (tameMeasure η hD hpD) (1 : C(ℤ_[p],K)) =
      η (p : ZMod D) * tameMeasure η hD hpD (1 : C(ℤ_[p],K)) := by sorry

theorem psiMeasure_integralTameMeasure (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (γ : Valuation.integer (NormedField.valuation (K := K)))
    (hγ : (γ : K) = η (p : ZMod D)) :
    AbstractMeasure.psiMeasure p (Valuation.integer (NormedField.valuation (K := K)))
      (integralTameMeasure η hD hpD) = γ • integralTameMeasure η hD hpD := by sorry

theorem unitRestriction_tameMeasure (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD) =
      tameMeasure η hD hpD - η (p : ZMod D) •
        AbstractMeasure.phiMeasure p K (tameMeasure η hD hpD) := by sorry

theorem tameMeasure_unit_moment (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (p : ZMod D)*(p : K)^k) * tameMeasure η hD hpD
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

end TameResidues

end DirichletPadic

namespace SuggestedResidueTameTests
open DirichletPadic

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedResidueTameTests.dyadic_even_cell
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 1, PadicInt.continuous_toZModPow 2 1⟩ : C(ℤ_[2],ZMod (2^1)))
      (tameMeasure η hD hpD) 0 = -1/3 := by sorry

-- SuggestedResidueTameTests.dyadic_odd_cell
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 1, PadicInt.continuous_toZModPow 2 1⟩ : C(ℤ_[2],ZMod (2^1)))
      (tameMeasure η hD hpD) 1 = 2/3 := by sorry

-- SuggestedResidueTameTests.dyadic_four_cells
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (fun a : ZMod 4 => AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 2, PadicInt.continuous_toZModPow 2 2⟩ : C(ℤ_[2],ZMod (2^2)))
      (tameMeasure η hD hpD) a) = fun a => if a=2 then -2/3 else 1/3 := by sorry

-- SuggestedResidueTameTests.positive_characteristic_ambiguity
example : ((fun _ : ZMod 3 => (1 : ZMod 3)) ≠ (fun _ => 0)) ∧
    (∑ _ : ZMod 3, (1 : ZMod 3)) = ∑ _ : ZMod 3, (0 : ZMod 3) := by sorry

-- SuggestedResidueTameTests.dyadic_psi_eigenvalue
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameMeasure η hD hpD) =
      -tameMeasure η hD hpD := by sorry

-- SuggestedResidueTameTests.dyadic_psi_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = -1/3 := by sorry

-- SuggestedResidueTameTests.dyadic_integral_psi
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2])))
      (integralTameMeasure η hD hpD) = -integralTameMeasure η hD hpD := by sorry

-- SuggestedResidueTameTests.dyadic_unit_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry

-- SuggestedResidueTameTests.dyadic_unit_second_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -10/9 := by sorry

-- SuggestedResidueTameTests.quadratic_translation_source
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[2] => x+3, by fun_prop⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) =
      AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2]) - AbstractMeasure.dirac ℚ_[2] (2 : ℤ_[2]) := by sorry

end SuggestedResidueTameTests

namespace DirichletPadic
noncomputable section
open PowerSeries

open scoped BigOperators

section TameFormalMoments
variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ E] {D : ℕ} [NeZero D]

theorem tameBernoulli_generating (η : DirichletCharacter E D) (hη : η ≠ 1) :
    (PowerSeries.mk fun k => -(D : E)^k / ((k+1).factorial : E) *
      ∑ a : ZMod D, η a * algebraMap ℚ E
        ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ))) *
      (1 - rescale (D : E) (PowerSeries.exp E)) =
    ∑ a : ZMod D, PowerSeries.C (η a) * rescale (a.val : E) (PowerSeries.exp E) := by sorry

theorem coeff_tameSeries_exp (η : DirichletCharacter E D) (hη : η ≠ 1)
    (hD : IsUnit (D : E)) (k : ℕ) :
    coeff k (subst (PowerSeries.exp E - 1) (tameSeries η hD)) =
      -(D : E)^k / ((k+1).factorial : E) * ∑ a : ZMod D,
        η a * algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)) := by sorry

theorem constantCoeff_iterate_mahler_tameSeries (η : DirichletCharacter E D)
    (hη : η ≠ 1) (hD : IsUnit (D : E)) (k : ℕ) :
    constantCoeff ((PowerSeries.mahlerDerivation E)^[k] (tameSeries η hD)) =
      -(D : E)^k / (k+1) * ∑ a : ZMod D,
        η a * algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)) := by sorry

theorem tameBernoulliValue_map {F : Type*} [Field F] [CharZero F] [Algebra ℚ F]
    (η : DirichletCharacter E D) (f : E →+* F) (k : ℕ) :
    f (-(D : E)^k / (k+1) * ∑ a : ZMod D,
      η a * algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ))) =
    -(D : F)^k / (k+1) * ∑ a : ZMod D,
      (η.ringHomComp f) a * algebraMap ℚ F
        ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)) := by sorry

end TameFormalMoments

theorem LFunction_neg_nat_tame {D : ℕ} [NeZero D]
    (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (k : ℕ) :
    η.LFunction (-(k : ℂ)) = -(D : ℂ)^k / (k+1) * ∑ a : ZMod D,
      η a * algebraMap ℚ ℂ ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)) := by sorry

section TameArithmeticMoments
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] [CharZero K] [Algebra ℚ K] {D : ℕ} [NeZero D]

theorem tameMeasure_moment_bernoulli (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    tameMeasure η hD hpD
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
    -(D : K)^k / (k+1) * ∑ a : ZMod D,
      η a * algebraMap ℚ K ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)) := by sorry

theorem tameMeasure_common_special_value {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (η : DirichletCharacter E D) (hη : η ≠ 1) (ιC : E →+* ℂ) (ιK : E →+* K)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    let b : E := -(D : E)^k / (k+1) * ∑ a : ZMod D,
      η a * algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ))
    ιC b = DirichletCharacter.LFunction (η.ringHomComp ιC) (-(k : ℂ)) ∧
    ιK b = tameMeasure (η.ringHomComp ιK) hD hpD
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

theorem tameMeasure_unit_common_special_value {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (η : DirichletCharacter E D) (hη : η ≠ 1) (ιC : E →+* ℂ) (ιK : E →+* K)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    let b : E := (1-η (p : ZMod D)*(p : E)^k) *
      (-(D : E)^k / (k+1) * ∑ a : ZMod D,
        η a * algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (a.val / D : ℚ)))
    ιC b = (1-(η.ringHomComp ιC) (p : ZMod D)*(p : ℂ)^k) *
      DirichletCharacter.LFunction (η.ringHomComp ιC) (-(k : ℂ)) ∧
    ιK b = AbstractMeasure.unitRestriction p K (tameMeasure (η.ringHomComp ιK) hD hpD)
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

end TameArithmeticMoments

end

end DirichletPadic

namespace SuggestedTameMomentTests
open DirichletPadic PowerSeries

noncomputable section
-- SuggestedTameMomentTests.quadratic_zero
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 0 (subst (PowerSeries.exp ℚ - 1) (tameSeries η hD)) = 1/3 := by sorry

-- SuggestedTameMomentTests.quadratic_second_exponential
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 2 (subst (PowerSeries.exp ℚ - 1) (tameSeries η hD)) = -1/9 := by sorry

-- SuggestedTameMomentTests.quadratic_fourth_formal
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    constantCoeff ((PowerSeries.mahlerDerivation ℚ)^[4] (tameSeries η hD)) = 2/3 := by sorry

-- SuggestedTameMomentTests.principal_exclusion
example (hD : IsUnit (3 : ℚ)) :
    constantCoeff (tameSeries (1 : DirichletCharacter ℚ 3) hD) = -1 ∧
    -(∑ a : ZMod 3, (1 : DirichletCharacter ℚ 3) a *
      (Polynomial.bernoulli 1).eval (a.val / 3 : ℚ)) = 0 := by sorry

-- SuggestedTameMomentTests.rational_transport
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) :
    algebraMap ℚ ℂ (-(3 : ℚ)^2/3 * ∑ a : ZMod 3,
      η a * (Polynomial.bernoulli 3).eval (a.val/3 : ℚ)) = -2/9 := by sorry

-- SuggestedTameMomentTests.complex_zero
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : η.LFunction 0 = 1/3 := by sorry

-- SuggestedTameMomentTests.complex_second
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : η.LFunction (-2) = -2/9 := by sorry

-- SuggestedTameMomentTests.quartic_complex_zero
example (η : DirichletCharacter ℂ 5) (hη : η 2 = Complex.I) :
    η.LFunction 0 = (3+Complex.I)/5 := by sorry

variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTameMomentTests.dyadic_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry

-- SuggestedTameMomentTests.dyadic_unit_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 34/3 := by sorry

end

end SuggestedTameMomentTests

namespace DirichletPadic
noncomputable section
section TameZeta
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

def tameZetaMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) : D(ℤ_[p],K) :=
  AbstractMeasure.weight
    (⟨fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x),
      (continuous_algebraMap ℤ_[p] K).comp PadicInt.continuous_inv⟩ : C(ℤ_[p],K))
    (AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD))

theorem tameZetaMeasure_apply (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) (f : C(ℤ_[p],K)) :
    tameZetaMeasure η hD hpD f = AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD)
      ((⟨fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x),
        (continuous_algebraMap ℤ_[p] K).comp PadicInt.continuous_inv⟩ : C(ℤ_[p],K)) * f) := by sorry

theorem tameZetaMeasure_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    tameZetaMeasure η hD hpD = 0 := by sorry

theorem tameZetaMeasure_eq_unrestricted_weight (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    tameZetaMeasure η hD hpD = AbstractMeasure.weight
      (⟨fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x),
        (continuous_algebraMap ℤ_[p] K).comp PadicInt.continuous_inv⟩ : C(ℤ_[p],K))
      (tameMeasure η hD hpD) := by sorry

theorem unitRestriction_tameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.unitRestriction p K (tameZetaMeasure η hD hpD) = tameZetaMeasure η hD hpD := by sorry

theorem psiMeasure_tameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.psiMeasure p K (tameZetaMeasure η hD hpD) = 0 := by sorry

theorem weight_id_tameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.weight
      (⟨algebraMap ℤ_[p] K, continuous_algebraMap ℤ_[p] K⟩ : C(ℤ_[p],K))
      (tameZetaMeasure η hD hpD) =
    AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD) := by sorry

theorem tameZetaMeasure_moment_shift (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    tameZetaMeasure η hD hpD
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K)) =
    AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

theorem tameZetaMeasure_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    ‖AbstractMeasure.toCLMEquiv (tameZetaMeasure η hD hpD)‖ ≤ 1 := by sorry

theorem tameZetaMeasure_apply_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],K)) :
    ‖tameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := by sorry

variable [CharZero K] [Algebra ℚ K]

theorem tameZetaMeasure_common_special_value {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (η : DirichletCharacter E D) (hη : η ≠ 1) (ιC : E →+* ℂ) (ιK : E →+* K)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) (hk : 1 ≤ k) :
    let b : E := (1-η (p : ZMod D)*(p : E)^(k-1)) *
      (-(D : E)^(k-1) / k * ∑ a : ZMod D,
        η a * algebraMap ℚ E ((Polynomial.bernoulli k).eval (a.val / D : ℚ)))
    ιC b = (1-(η.ringHomComp ιC) (p : ZMod D)*(p : ℂ)^(k-1)) *
      DirichletCharacter.LFunction (η.ringHomComp ιC) (1-(k : ℂ)) ∧
    ιK b = tameZetaMeasure (η.ringHomComp ιK) hD hpD
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

end TameZeta

end

end DirichletPadic

namespace SuggestedTameZetaTests
open DirichletPadic

noncomputable section
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTameZetaTests.one_level_zero
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameZetaMeasure η hD hpD = 0 := by sorry

-- SuggestedTameZetaTests.first_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry

-- SuggestedTameZetaTests.omission_of_inverse
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD ≠ AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD) := by sorry

-- SuggestedTameZetaTests.weight_compatibility
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.weight (⟨fun x : ℤ_[2] => (x : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))
      (tameZetaMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry

-- SuggestedTameZetaTests.psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameZetaMeasure η hD hpD) = 0 := by sorry

-- SuggestedTameZetaTests.third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^3, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -10/9 := by sorry

-- SuggestedTameZetaTests.fifth_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^5, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 34/3 := by sorry

-- SuggestedTameZetaTests.norm_bound
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖tameZetaMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2]))‖ ≤ 1 := by sorry

end

end SuggestedTameZetaTests

namespace DirichletPadic
noncomputable section
section IntegralTameZeta
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

def integralTameZetaMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) : D(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))) :=
  AbstractMeasure.weight (⟨fun x : ℤ_[p] => ⟨algebraMap ℤ_[p] K (PadicInt.inv x), by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))))
    (AbstractMeasure.unitRestriction p (Valuation.integer (NormedField.valuation (K := K))) (integralTameMeasure η hD hpD))

theorem integralTameZetaMeasure_apply (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    integralTameZetaMeasure η hD hpD f =
      AbstractMeasure.unitRestriction p (Valuation.integer (NormedField.valuation (K := K))) (integralTameMeasure η hD hpD) ((⟨fun x : ℤ_[p] => ⟨algebraMap ℤ_[p] K (PadicInt.inv x), by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) * f) := by sorry

theorem integralTameZetaMeasure_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    integralTameZetaMeasure η hD hpD = 0 := by sorry

theorem coe_integralTameZetaMeasure_apply (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    (integralTameZetaMeasure η hD hpD f : K) = tameZetaMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f) := by sorry

theorem integralTameZetaMeasure_bound (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    ‖integralTameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := by sorry

theorem unitRestriction_integralTameZetaMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.unitRestriction p (Valuation.integer (NormedField.valuation (K := K))) (integralTameZetaMeasure η hD hpD) =
      integralTameZetaMeasure η hD hpD := by sorry

theorem psiMeasure_integralTameZetaMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.psiMeasure p (Valuation.integer (NormedField.valuation (K := K))) (integralTameZetaMeasure η hD hpD) = 0 := by sorry

theorem integralTameZetaMeasure_unique (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (ν : D(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))))
    (hν : ∀ f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))), (ν f : K) = tameZetaMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f)) :
    ν = integralTameZetaMeasure η hD hpD := by sorry

section Values
variable [CharZero K] [Algebra ℚ K]

theorem tameZetaValue_mem_integer (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) (hk : 1 ≤ k) :
    (1-η (p : ZMod D)*(p : K)^(k-1)) *
      (-(D : K)^(k-1)/k * ∑ a : ZMod D,
        η a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/D : ℚ))) ∈ (Valuation.integer (NormedField.valuation (K := K))) := by sorry

theorem coe_integralTameZetaMeasure_moment (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) (hk : 1 ≤ k)
    (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (hf : ∀ x, (f x : K) = (algebraMap ℤ_[p] K x)^k) :
    (integralTameZetaMeasure η hD hpD f : K) =
      (1-η (p : ZMod D)*(p : K)^(k-1)) *
        (-(D : K)^(k-1)/k * ∑ a : ZMod D,
          η a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/D : ℚ))) := by sorry

end Values

variable [Algebra ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [ContinuousSMul ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [IsScalarTower ℤ_[p] (Valuation.integer (NormedField.valuation (K := K))) K]

theorem map_amiceTransform_integralTameZetaMeasure (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (integralTameZetaMeasure η hD hpD).amiceTransform =
      (tameZetaMeasure η hD hpD).amiceTransform := by sorry

end IntegralTameZeta

end

end DirichletPadic

namespace SuggestedIntegralTameZetaTests
open DirichletPadic

noncomputable section
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedIntegralTameZetaTests.modulus_one
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameZetaMeasure η hD hpD = 0 := by sorry

-- SuggestedIntegralTameZetaTests.mass_inclusion
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (integralTameZetaMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) =
      tameZetaMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2])) := by sorry

-- SuggestedIntegralTameZetaTests.first_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = x) :
    (integralTameZetaMeasure η hD hpD f : ℚ_[2]) = 2/3 := by sorry

-- SuggestedIntegralTameZetaTests.wild_scalar
example : (1/3 : ℚ_[3]) ∉ Valuation.integer (NormedField.valuation (K := ℚ_[3])) := by sorry

-- SuggestedIntegralTameZetaTests.mass_bound
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖integralTameZetaMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2])))))‖ ≤ 1 := by sorry

-- SuggestedIntegralTameZetaTests.integral_psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) (integralTameZetaMeasure η hD hpD) = 0 := by sorry

-- SuggestedIntegralTameZetaTests.third_value_integral
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^3) :
    (integralTameZetaMeasure η hD hpD f : ℚ_[2]) = -10/9 ∧ (-10/9 : ℚ_[2]) ∈ (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) := by sorry

-- SuggestedIntegralTameZetaTests.p_divides_weight
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^2) :
    integralTameZetaMeasure η hD hpD f = 0 := by sorry

variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]

-- SuggestedIntegralTameZetaTests.amice_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 0 (integralTameZetaMeasure η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) =
      coeff 0 (tameZetaMeasure η hD hpD).amiceTransform := by sorry

end

end SuggestedIntegralTameZetaTests

namespace DirichletPadic
noncomputable section
section TameCharacterTwists
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

def twistedTameMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) : D(ℤ_[p],K) :=
  AbstractMeasure.weight (primePowerCharacter p n χ) (tameMeasure η hD hpD)

theorem twistedTameMeasure_apply (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],K)) :
    twistedTameMeasure n χ η hD hpD f = tameMeasure η hD hpD (primePowerCharacter p n χ * f) := by sorry

theorem twistedTameMeasure_one_level (n : ℕ) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    twistedTameMeasure n χ η hD hpD = 0 := by sorry

theorem twistedTameMeasure_zero_level (χ : DirichletCharacter K (p^0))
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    twistedTameMeasure 0 χ η hD hpD = tameMeasure η hD hpD := by sorry

theorem twistedTameMeasure_principal (n : ℕ) (hn : 1 ≤ n)
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    twistedTameMeasure n (1 : DirichletCharacter K (p^n)) η hD hpD =
      AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD) := by sorry

theorem twistedTameMeasure_changeLevel (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (m : ℕ) (hn : 1 ≤ n) (hnm : n ≤ m) :
    twistedTameMeasure m (χ.changeLevel (pow_dvd_pow p hnm)) η hD hpD =
      twistedTameMeasure n χ η hD hpD := by sorry

theorem twistedTameMeasure_mul (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (ψ : DirichletCharacter K (p^n)) :
    twistedTameMeasure n (χ*ψ) η hD hpD =
      AbstractMeasure.weight (primePowerCharacter p n χ) (twistedTameMeasure n ψ η hD hpD) := by sorry

theorem twistedTameMeasure_apply_norm_le (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],K)) :
    ‖twistedTameMeasure n χ η hD hpD f‖ ≤ ‖f‖ := by sorry

theorem twistedTameMeasure_translation (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    twistedTameMeasure n χ η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[p] => x + (D*p^n : ℕ), by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
      (twistedTameMeasure n χ η hD hpD) =
    ∑ a : ZMod (D*p^n), θ a • AbstractMeasure.dirac K (a.val : ℤ_[p]) := by sorry

theorem tameZetaMeasure_character_moment_shift (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) :
    tameZetaMeasure η hD hpD (primePowerCharacter p n χ * (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K))) =
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := by sorry

variable [CharZero K]

theorem psiMeasure_twistedTameMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    AbstractMeasure.psiMeasure p K (twistedTameMeasure n χ η hD hpD) =
      θ (p : ZMod (D*p^n)) • twistedTameMeasure n χ η hD hpD := by sorry

theorem unitRestriction_twistedTameMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) =
      twistedTameMeasure n χ η hD hpD - θ (p : ZMod (D*p^n)) •
        AbstractMeasure.phiMeasure p K (twistedTameMeasure n χ η hD hpD) := by sorry

theorem amiceTransform_twistedTameMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1)
    (hN : IsUnit ((D*p^n : ℕ) : K)) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    (twistedTameMeasure n χ η hD hpD).amiceTransform = tameSeries θ hN := by sorry

variable [Algebra ℚ K]

theorem twistedTameMeasure_moment_bernoulli (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    twistedTameMeasure n χ η hD hpD (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
    -((D*p^n : ℕ) : K)^k/(k+1) * ∑ a : ZMod (D*p^n),
      θ a * algebraMap ℚ K ((Polynomial.bernoulli (k+1)).eval (a.val/(D*p^n) : ℚ)) := by sorry

theorem twistedTameMeasure_unit_moment (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-θ (p : ZMod (D*p^n))*(p : K)^k) * (-((D*p^n : ℕ) : K)^k/(k+1) * ∑ a : ZMod (D*p^n),
      θ a * algebraMap ℚ K ((Polynomial.bernoulli (k+1)).eval (a.val/(D*p^n) : ℚ))) := by sorry

theorem tameZetaMeasure_character_common_special_value {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D) (hη : η ≠ 1)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) (hk : 1 ≤ k) :
    let θ : DirichletCharacter E (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let b : E := (1-θ (p : ZMod (D*p^n))*(p : E)^(k-1)) *
      (-((D*p^n : ℕ) : E)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ E ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-(θ.ringHomComp ιC) (p : ZMod (D*p^n))*(p : ℂ)^(k-1)) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (1-(k : ℂ)) ∧
    ιK b = tameZetaMeasure (η.ringHomComp ιK) hD hpD
      (primePowerCharacter p n (χ.ringHomComp ιK) * (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K))) := by sorry

end TameCharacterTwists

end

end DirichletPadic

namespace SuggestedTameCharacterTests
open DirichletPadic

noncomputable section
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTameCharacterTests.modulus_one
example (χ : DirichletCharacter ℚ_[2] (2^2)) (η : DirichletCharacter ℚ_[2] 1)
    (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) : twistedTameMeasure 2 χ η hD hpD = 0 := by sorry

-- SuggestedTameCharacterTests.zero_level_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD
    (1 : C(ℤ_[2],ℚ_[2])) = 1/3 := by sorry

-- SuggestedTameCharacterTests.positive_principal_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 1 (1 : DirichletCharacter ℚ_[2] (2^1)) η hD hpD
    (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry

-- SuggestedTameCharacterTests.principal_not_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 1 (1 : DirichletCharacter ℚ_[2] (2^1)) η hD hpD ≠
    tameMeasure η hD hpD := by sorry

-- SuggestedTameCharacterTests.raised_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    twistedTameMeasure 3 (χ.changeLevel (pow_dvd_pow 2 (by decide : 2 ≤ 3))) η hD hpD =
      twistedTameMeasure 2 χ η hD hpD := by sorry

-- SuggestedTameCharacterTests.positive_psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (twistedTameMeasure 2 χ η hD hpD) = 0 := by sorry

-- SuggestedTameCharacterTests.quadratic_translation
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    twistedTameMeasure 2 χ η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[2] => x+12, by fun_prop⟩ : C(ℤ_[2],ℤ_[2])) (twistedTameMeasure 2 χ η hD hpD) =
    AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2]) - AbstractMeasure.dirac ℚ_[2] (5 : ℤ_[2]) -
      AbstractMeasure.dirac ℚ_[2] (7 : ℤ_[2]) + AbstractMeasure.dirac ℚ_[2] (11 : ℤ_[2]) := by sorry

-- SuggestedTameCharacterTests.quadratic_amice_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : coeff 0 (twistedTameMeasure 2 χ η hD hpD).amiceTransform = 0 := by sorry

-- SuggestedTameCharacterTests.quadratic_first_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : twistedTameMeasure 2 χ η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^1, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -2 := by sorry

-- SuggestedTameCharacterTests.quadratic_third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : twistedTameMeasure 2 χ η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^3, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 46 := by sorry

-- SuggestedTameCharacterTests.quadratic_shifted_second
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) = -2 := by sorry

-- SuggestedTameCharacterTests.complex_product_value
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1)
    (χ : DirichletCharacter ℂ (2^2)) (hχ : χ 3 = -1) :
    DirichletCharacter.LFunction
      (η.changeLevel (Nat.dvd_mul_right 3 (2^2)) * χ.changeLevel ((2^2).dvd_mul_left 3)) (-1) = -2 := by sorry

-- SuggestedTameCharacterTests.quadratic_shifted_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) = 46 := by sorry

end

end SuggestedTameCharacterTests

namespace DirichletPadic
noncomputable section
section IntegralCharacterValues
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

def integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) : D(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K)))) :=
  AbstractMeasure.weight (⟨fun x : ℤ_[p] => ⟨primePowerCharacter p n (χ) x, by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (integralTameZetaMeasure η hD hpD)

theorem integralTwistedTameZetaMeasure_apply (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    integralTwistedTameZetaMeasure n χ η hD hpD f = integralTameZetaMeasure η hD hpD ((⟨fun x : ℤ_[p] => ⟨primePowerCharacter p n (χ) x, by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) * f) := by sorry

theorem integralTwistedTameZetaMeasure_one_level (n : ℕ) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    integralTwistedTameZetaMeasure n χ η hD hpD = 0 := by sorry

theorem integralTwistedTameZetaMeasure_principal (n : ℕ) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    integralTwistedTameZetaMeasure n (1 : DirichletCharacter K (p^n)) η hD hpD =
      integralTameZetaMeasure η hD hpD := by sorry

theorem integralTwistedTameZetaMeasure_changeLevel (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (m : ℕ) (h : n ≤ m) :
    integralTwistedTameZetaMeasure m (χ.changeLevel (pow_dvd_pow p h)) η hD hpD =
      integralTwistedTameZetaMeasure n χ η hD hpD := by sorry

theorem integralTwistedTameZetaMeasure_mul (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (ψ : DirichletCharacter K (p^n)) :
    integralTwistedTameZetaMeasure n (χ*ψ) η hD hpD =
      AbstractMeasure.weight (⟨fun x : ℤ_[p] => ⟨primePowerCharacter p n (χ) x, by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (integralTwistedTameZetaMeasure n ψ η hD hpD) := by sorry

theorem unitRestriction_integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.unitRestriction p (Valuation.integer (NormedField.valuation (K := K))) (integralTwistedTameZetaMeasure n χ η hD hpD) =
      integralTwistedTameZetaMeasure n χ η hD hpD := by sorry

theorem psiMeasure_integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.psiMeasure p (Valuation.integer (NormedField.valuation (K := K))) (integralTwistedTameZetaMeasure n χ η hD hpD) = 0 := by sorry

theorem integralTwistedTameZetaMeasure_bound (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    ‖integralTwistedTameZetaMeasure n χ η hD hpD f‖ ≤ ‖f‖ := by sorry

theorem coe_integralTwistedTameZetaMeasure_apply (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) :
    (integralTwistedTameZetaMeasure n χ η hD hpD f : K) =
      tameZetaMeasure η hD hpD (primePowerCharacter p n χ * (⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := K))),K)).comp f) := by sorry

theorem inverse_weight_integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.weight (⟨fun x : ℤ_[p] => ⟨primePowerCharacter p n (χ⁻¹) x, by sorry⟩, by sorry⟩ : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (integralTwistedTameZetaMeasure n χ η hD hpD) =
      integralTameZetaMeasure η hD hpD := by sorry

section CharacterValues
variable [CharZero K] [Algebra ℚ K]

theorem tameCharacterZetaValue_mem_integer (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) (hk : 1 ≤ k) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    (1-θ (p : ZMod (D*p^n))*(p : K)^(k-1)) *
      (-((D*p^n : ℕ) : K)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ))) ∈ (Valuation.integer (NormedField.valuation (K := K))) := by sorry

theorem coe_integralTwistedTameZetaMeasure_moment (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1) (k : ℕ) (hk : 1 ≤ k)
    (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (hf : ∀ x, (f x : K) = (algebraMap ℤ_[p] K x)^k) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    (integralTwistedTameZetaMeasure n χ η hD hpD f : K) = (1-θ (p : ZMod (D*p^n))*(p : K)^(k-1)) *
      (-((D*p^n : ℕ) : K)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ))) := by sorry

theorem tameCharacterValue_finite_sum {I : Type*} [Fintype I] (n k : I → ℕ)
    (χ : ∀ i, DirichletCharacter K (p^(n i))) (c : I → K)
    (η : DirichletCharacter K D) (hη : η ≠ 1) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (hk : ∀ i, 1 ≤ k i) :
    let θ : ∀ i : I, DirichletCharacter K (D*p^(n i)) := fun i =>
      η.changeLevel (D.dvd_mul_right (p^(n i))) * (χ i).changeLevel ((p^(n i)).dvd_mul_left D)
    let b : I → K := fun i => (1-θ i (p : ZMod (D*p^(n i)))*(p : K)^(k i-1)) *
      (-((D*p^(n i) : ℕ) : K)^(k i-1)/(k i) * ∑ a : ZMod (D*p^(n i)),
        θ i a * algebraMap ℚ K ((Polynomial.bernoulli (k i)).eval (a.val/(D*p^(n i)) : ℚ)))
    tameZetaMeasure η hD hpD (∑ i : I, c i •
      (primePowerCharacter p (n i) (χ i) *
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k i), by fun_prop⟩ : C(ℤ_[p],K)))) =
      ∑ i : I, c i * b i := by sorry

theorem tameCharacterValue_kummer_sum {I : Type*} [Fintype I] (n k : I → ℕ)
    (χ : ∀ i, DirichletCharacter K (p^(n i))) (c : I → K)
    (η : DirichletCharacter K D) (hη : η ≠ 1) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (hk : ∀ i, 1 ≤ k i) (B : ℝ) (hB : 0 ≤ B)
    (htest : ∀ x : ℤ_[p], IsUnit x →
      ‖∑ i : I, c i * primePowerCharacter p (n i) (χ i) x * (algebraMap ℤ_[p] K x)^(k i)‖ ≤ B) :
    let θ : ∀ i : I, DirichletCharacter K (D*p^(n i)) := fun i =>
      η.changeLevel (D.dvd_mul_right (p^(n i))) * (χ i).changeLevel ((p^(n i)).dvd_mul_left D)
    let b : I → K := fun i => (1-θ i (p : ZMod (D*p^(n i)))*(p : K)^(k i-1)) *
      (-((D*p^(n i) : ℕ) : K)^(k i-1)/(k i) * ∑ a : ZMod (D*p^(n i)),
        θ i a * algebraMap ℚ K ((Polynomial.bernoulli (k i)).eval (a.val/(D*p^(n i)) : ℚ)))
    ‖∑ i : I, c i * b i‖ ≤ B := by sorry

end CharacterValues

variable [Algebra ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [ContinuousSMul ℤ_[p] (Valuation.integer (NormedField.valuation (K := K)))] [IsScalarTower ℤ_[p] (Valuation.integer (NormedField.valuation (K := K))) K]

theorem map_amiceTransform_integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype (integralTwistedTameZetaMeasure n χ η hD hpD).amiceTransform =
      (AbstractMeasure.weight (primePowerCharacter p n χ) (tameZetaMeasure η hD hpD)).amiceTransform := by sorry

end IntegralCharacterValues

end

end DirichletPadic

namespace SuggestedIntegralCharacterTests
open DirichletPadic

noncomputable section
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedIntegralCharacterTests.modulus_one
example (χ : DirichletCharacter ℚ_[2] (2^2)) (η : DirichletCharacter ℚ_[2] 1)
    (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) : integralTwistedTameZetaMeasure 2 χ η hD hpD = 0 := by sorry

-- SuggestedIntegralCharacterTests.principal_positive_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 2 (1 : DirichletCharacter ℚ_[2] (2^2)) η hD hpD =
    integralTameZetaMeasure η hD hpD := by sorry

-- SuggestedIntegralCharacterTests.zero_to_positive_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD =
    integralTwistedTameZetaMeasure 2 (1 : DirichletCharacter ℚ_[2] (2^2)) η hD hpD := by sorry

-- SuggestedIntegralCharacterTests.nontrivial_twist
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : integralTwistedTameZetaMeasure 2 χ η hD hpD ≠ integralTameZetaMeasure η hD hpD := by sorry

-- SuggestedIntegralCharacterTests.second_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^2) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD f : ℚ_[2]) = -2 := by sorry

-- SuggestedIntegralCharacterTests.inclusion_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) =
      tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ) := by sorry

-- SuggestedIntegralCharacterTests.integral_support
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) (integralTwistedTameZetaMeasure 2 χ η hD hpD) = 0 := by sorry

-- SuggestedIntegralCharacterTests.inverse_character
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : integralTwistedTameZetaMeasure 2 (χ*χ⁻¹) η hD hpD = integralTameZetaMeasure η hD hpD := by sorry

-- SuggestedIntegralCharacterTests.fourth_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^4) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD f : ℚ_[2]) = 46 := by sorry

-- SuggestedIntegralCharacterTests.character_linear_difference
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD
    (primePowerCharacter 2 2 χ * ((⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) - (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])))) = -48 := by sorry

-- SuggestedIntegralCharacterTests.dyadic_character_congruence
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : ‖tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) -
    tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])))‖ ≤ (2 : ℝ)^(-3 : ℤ) := by sorry

variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]

-- SuggestedIntegralCharacterTests.amice_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : ((coeff 0 (integralTwistedTameZetaMeasure 2 χ η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) =
    coeff 0 (AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD)).amiceTransform := by sorry

end

end SuggestedIntegralCharacterTests

namespace DirichletPadic
noncomputable section
section TameParity
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

theorem tameAtoms_reflection (η : DirichletCharacter K D) (hη : η ≠ 1) :
    AbstractMeasure.map (⟨fun x : ℤ_[p] => (D : ℤ_[p])-x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
      (∑ a : ZMod D, η a • AbstractMeasure.dirac K (a.val : ℤ_[p])) =
    η (-1) • (∑ a : ZMod D, η a • AbstractMeasure.dirac K (a.val : ℤ_[p])) := by sorry

theorem map_neg_tameMeasure (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.map (⟨fun x : ℤ_[p] => -x, continuous_neg⟩ : C(ℤ_[p],ℤ_[p])) (tameMeasure η hD hpD) = (-η (-1)) • (tameMeasure η hD hpD) := by sorry

theorem map_neg_tameZetaMeasure (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.map (⟨fun x : ℤ_[p] => -x, continuous_neg⟩ : C(ℤ_[p],ℤ_[p])) (tameZetaMeasure η hD hpD) = η (-1) • (tameZetaMeasure η hD hpD) := by sorry

theorem map_neg_weight_character_tameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.map (⟨fun x : ℤ_[p] => -x, continuous_neg⟩ : C(ℤ_[p],ℤ_[p])) (AbstractMeasure.weight (primePowerCharacter p n χ) (tameZetaMeasure η hD hpD)) = (η (-1) * χ (-1)) • (AbstractMeasure.weight (primePowerCharacter p n χ) (tameZetaMeasure η hD hpD)) := by sorry

theorem map_neg_integralTwistedTameZetaMeasure (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    AbstractMeasure.map (⟨fun x : ℤ_[p] => -x, continuous_neg⟩ : C(ℤ_[p],ℤ_[p])) (integralTwistedTameZetaMeasure n χ η hD hpD) =
      (⟨(η (-1) * χ (-1)), by sorry⟩ : (Valuation.integer (NormedField.valuation (K := K)))) • integralTwistedTameZetaMeasure n χ η hD hpD := by sorry

theorem tameZetaMeasure_character_test_eq_zero (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (ε : K) (f : C(ℤ_[p],K)) (hf : ∀ x, f (-x) = ε * f x) (hne : ε ≠ (η (-1) * χ (-1))) :
    (AbstractMeasure.weight (primePowerCharacter p n χ) (tameZetaMeasure η hD hpD)) f = 0 := by sorry

theorem integralTwistedTameZetaMeasure_test_eq_zero (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (ε : K) (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (hf : ∀ x, (f (-x) : K) = ε * (f x : K))
    (hne : ε ≠ (η (-1) * χ (-1))) : integralTwistedTameZetaMeasure n χ η hD hpD f = 0 := by sorry

variable [CharZero K]

theorem tameZetaMeasure_character_mass_eq_zero_of_odd (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (hodd : (η (-1) * χ (-1)) = -1) : tameZetaMeasure η hD hpD (primePowerCharacter p n χ) = 0 := by sorry

theorem integralTwistedTameZetaMeasure_mass_eq_zero_of_odd (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (hodd : (η (-1) * χ (-1)) = -1) : integralTwistedTameZetaMeasure n χ η hD hpD (1 : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) = 0 := by sorry

variable [Algebra ℚ K]

theorem tameCharacterZetaValue_eq_zero_of_parity (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1 ≤ k) (hne : (-1 : K)^k ≠ (η (-1) * χ (-1))) :
    let θ : DirichletCharacter K (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    (1-θ (p : ZMod (D*p^n))*(p : K)^(k-1)) *
      (-((D*p^n : ℕ) : K)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ))) = 0 := by sorry

theorem integralTwistedTameZetaMeasure_moment_eq_zero_of_parity (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D) (hη : η ≠ 1)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1 ≤ k) (hne : (-1 : K)^k ≠ (η (-1) * χ (-1)))
    (f : C(ℤ_[p],(Valuation.integer (NormedField.valuation (K := K))))) (hf : ∀ x, (f x : K) = (algebraMap ℤ_[p] K x)^k) :
    integralTwistedTameZetaMeasure n χ η hD hpD f = 0 := by sorry

end TameParity

end

end DirichletPadic

namespace SuggestedTameParityTests
open DirichletPadic

noncomputable section
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedTameParityTests.quadratic_atoms
example : AbstractMeasure.map (⟨fun x : ℤ_[2] => 3-x, by fun_prop⟩ : C(ℤ_[2],ℤ_[2]))
    (AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2])-AbstractMeasure.dirac ℚ_[2] 2) =
      -(AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2])-AbstractMeasure.dirac ℚ_[2] 2) := by sorry

-- SuggestedTameParityTests.odd_tame_measure_even
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) = tameMeasure η hD hpD := by sorry

-- SuggestedTameParityTests.even_tame_measure_odd
example (η : DirichletCharacter ℚ_[2] 5) (hη : η 2 = -1)
    (hD : IsUnit (5 : ℚ_[2])) (hpD : ¬2 ∣ 5) :
    AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) = -tameMeasure η hD hpD := by sorry

-- SuggestedTameParityTests.principal_hypothesis_needed
example (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure (1 : DirichletCharacter ℚ_[2] 3) hD hpD (1 : C(ℤ_[2],ℚ_[2])) = -1 := by sorry

-- SuggestedTameParityTests.odd_tame_zeta_odd
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameZetaMeasure η hD hpD) = -tameZetaMeasure η hD hpD := by sorry

-- SuggestedTameParityTests.two_odd_characters_even
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD)) =
      AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD) := by sorry

-- SuggestedTameParityTests.integral_even_reflection
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (integralTwistedTameZetaMeasure 2 χ η hD hpD) =
    integralTwistedTameZetaMeasure 2 χ η hD hpD := by sorry

-- SuggestedTameParityTests.odd_character_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD
    (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) = 0 := by sorry

-- SuggestedTameParityTests.odd_test_even_twist
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],ℚ_[2])) (hf : ∀ x, f (-x) = -f x) :
    tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * f) = 0 := by sorry

-- SuggestedTameParityTests.mismatched_second_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 0 := by sorry

-- SuggestedTameParityTests.matching_second_moment_not_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) ≠ 0 := by sorry

-- SuggestedTameParityTests.integral_mismatched_third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^3) :
    integralTwistedTameZetaMeasure 2 χ η hD hpD f = 0 := by sorry

end

end SuggestedTameParityTests

namespace DirichletPadic
noncomputable section
open Set Filter Asymptotics

section TameComplexKernel
variable {D : ℕ} [NeZero D]

def tameComplexKernel (η : DirichletCharacter ℂ D) (t : ℝ) : ℂ :=
  -(D : ℂ)⁻¹ * (smoothBernoulliKernel (D*t) : ℂ) *
    ∑ a : ZMod D, η a * ((dslope (fun u : ℝ => Real.exp (a.val*u)) 0 t : ℝ) : ℂ)

theorem tameComplexKernel_def (η : DirichletCharacter ℂ D) (t : ℝ) :
    tameComplexKernel η t = -(D : ℂ)⁻¹ * (smoothBernoulliKernel (D*t) : ℂ) *
      ∑ a : ZMod D, η a * ((dslope (fun u : ℝ => Real.exp (a.val*u)) 0 t : ℝ) : ℂ) := by rfl

theorem tameComplexKernel_zero (η : DirichletCharacter ℂ D) :
    tameComplexKernel η 0 = -(D : ℂ)⁻¹ * ∑ a : ZMod D, η a * a.val := by sorry

theorem tameComplexKernel_of_ne (η : DirichletCharacter ℂ D) {t : ℝ} (ht : t ≠ 0) :
    tameComplexKernel η t =
      (∑ a : ZMod D, η a * ((Real.exp (a.val*t) : ℂ)-1)) /
        (1-(Real.exp (D*t) : ℂ)) := by sorry

theorem tameComplexKernel_of_ne_one (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    {t : ℝ} (ht : t ≠ 0) : tameComplexKernel η t =
      (∑ a : ZMod D, η a * (Real.exp (a.val*t) : ℂ)) /
        (1-(Real.exp (D*t) : ℂ)) := by sorry

theorem tameComplexKernel_mul (η : DirichletCharacter ℂ D) (t : ℝ) :
    tameComplexKernel η t * (D : ℂ) * (t : ℂ) =
      -(smoothBernoulliKernel (D*t) : ℂ) *
        ∑ a : ZMod D, η a * ((Real.exp (a.val*t) : ℂ)-1) := by sorry

theorem tameComplexKernel_analyticAt (η : DirichletCharacter ℂ D) (t : ℝ) :
    AnalyticAt ℝ (tameComplexKernel η) t := by sorry

theorem tameComplexKernel_contDiff (η : DirichletCharacter ℂ D) :
    ContDiff ℝ (⊤ : ℕ∞) (tameComplexKernel η) := by sorry

theorem tameComplexKernel_iteratedDeriv_zero (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (k : ℕ) :
    iteratedDeriv k (tameComplexKernel η) 0 = (-(D : ℂ)^k / (k+1) * ∑ a : ZMod D, η a *
      algebraMap ℚ ℂ ((Polynomial.bernoulli (k+1)).eval (a.val/D : ℚ))) := by sorry

theorem tameComplexKernel_iteratedDerivWithin_zero (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (k : ℕ) :
    iteratedDerivWithin k (tameComplexKernel η) (Ici 0) 0 = (-(D : ℂ)^k / (k+1) * ∑ a : ZMod D, η a *
      algebraMap ℚ ℂ ((Polynomial.bernoulli (k+1)).eval (a.val/D : ℚ))) := by sorry

theorem tameComplexKernel_iteratedDeriv_zero_eq_LFunction (η : DirichletCharacter ℂ D)
    (hη : η ≠ 1) (k : ℕ) :
    iteratedDeriv k (tameComplexKernel η) 0 = η.LFunction (-(k : ℂ)) := by sorry

theorem tameComplexKernel_hasSum (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    {t : ℝ} (ht : 0 < t) :
    HasSum (fun n : ℕ => -η (-1) * η ((n+1 : ℕ) : ZMod D) *
      (Real.exp (-(n+1 : ℝ)*t) : ℂ)) (tameComplexKernel η t) := by sorry

theorem tameComplexKernel_iteratedDeriv_hasSum (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    (k : ℕ) {t : ℝ} (ht : 0 < t) :
    HasSum (fun n : ℕ => -η (-1) * η ((n+1 : ℕ) : ZMod D) * (-(n+1 : ℂ))^k *
      (Real.exp (-(n+1 : ℝ)*t) : ℂ)) (iteratedDeriv k (tameComplexKernel η) t) := by sorry

theorem tameComplexKernel_derivative_bound (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    (k : ℕ) {δ t : ℝ} (hδ : 0 < δ) (ht : δ ≤ t) :
    ‖iteratedDeriv k (tameComplexKernel η) t‖ ≤
      Real.exp (δ-t) * ∑' n : ℕ, (n+1 : ℝ)^k * Real.exp (-(n+1 : ℝ)*δ) := by sorry

theorem tameComplexKernel_within_decay (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (k : ℕ) :
    iteratedDerivWithin k (tameComplexKernel η) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-t)) := by sorry

theorem tameComplexKernel_mellin_convergent (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    {s : ℂ} (hs : 0 < s.re) : MellinConvergent (tameComplexKernel η) s := by sorry

theorem tameComplexKernel_mellin_eq_gamma_LFunction (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    {s : ℂ} (hs : 1 < s.re) :
    mellin (tameComplexKernel η) s = -η (-1) * Complex.Gamma s * η.LFunction s := by sorry

theorem tameComplexKernel_mellin_entire (η : DirichletCharacter ℂ D) (hη : η ≠ 1) :
    Differentiable ℂ (normalizedMellinContinuation (tameComplexKernel η)) := by sorry

theorem tameComplexKernel_normalized_eq_LFunction (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (s : ℂ) :
    normalizedMellinContinuation (tameComplexKernel η) s = -η (-1) * η.LFunction s := by sorry

theorem tameComplexKernel_mellin_neg_nat (η : DirichletCharacter ℂ D) (hη : η ≠ 1) (k : ℕ) :
    normalizedMellinContinuation (tameComplexKernel η) (-(k : ℂ)) = (-1 : ℂ)^k * (-(D : ℂ)^k / (k+1) * ∑ a : ZMod D, η a *
      algebraMap ℚ ℂ ((Polynomial.bernoulli (k+1)).eval (a.val/D : ℚ))) := by sorry

end TameComplexKernel

end

end DirichletPadic

namespace SuggestedTameComplexKernelTests
open DirichletPadic Set Filter

noncomputable section
-- SuggestedTameComplexKernelTests.level_one_zero
example (t : ℝ) : tameComplexKernel (1 : DirichletCharacter ℂ 1) t = 0 := by sorry

-- SuggestedTameComplexKernelTests.quadratic_origin
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : tameComplexKernel η 0 = 1/3 := by sorry

-- SuggestedTameComplexKernelTests.quadratic_log_two
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : tameComplexKernel η (Real.log 2) = 2/7 := by sorry

-- SuggestedTameComplexKernelTests.principal_origin
example : tameComplexKernel (1 : DirichletCharacter ℂ 3) 0 = -1 := by sorry

-- SuggestedTameComplexKernelTests.quartic_orientation
example (η : DirichletCharacter ℂ 5) (hη : η 2 = Complex.I) :
    tameComplexKernel η 0 = (3+Complex.I)/5 := by sorry

-- SuggestedTameComplexKernelTests.analytic_at_zero
example (η : DirichletCharacter ℂ 3) : AnalyticAt ℝ (tameComplexKernel η) 0 := by sorry

-- SuggestedTameComplexKernelTests.quadratic_second_derivative
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    iteratedDeriv 2 (tameComplexKernel η) 0 = -2/9 := by sorry

-- SuggestedTameComplexKernelTests.even_first_derivative
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    iteratedDeriv 1 (tameComplexKernel η) 0 = -2/5 := by sorry

-- SuggestedTameComplexKernelTests.even_kernel_negative
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    tameComplexKernel η (Real.log 2) = -6/31 := by sorry

-- SuggestedTameComplexKernelTests.odd_first_series
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) {t : ℝ} (ht : 0 < t) :
    HasSum (fun n : ℕ => η ((n+1 : ℕ) : ZMod 3) * (-(n+1 : ℂ)) *
      (Real.exp (-(n+1 : ℝ)*t) : ℂ)) (iteratedDeriv 1 (tameComplexKernel η) t) := by sorry

-- SuggestedTameComplexKernelTests.decay_to_zero
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    Tendsto (tameComplexKernel η) atTop (nhds 0) := by sorry

-- SuggestedTameComplexKernelTests.convergence_before_series_halfplane
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    MellinConvergent (tameComplexKernel η) (1/2) := by sorry

-- SuggestedTameComplexKernelTests.gamma_two
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    mellin (tameComplexKernel η) 2 = Complex.Gamma 2 * η.LFunction 2 := by sorry

-- SuggestedTameComplexKernelTests.entire_even_character
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    Differentiable ℂ (normalizedMellinContinuation (tameComplexKernel η)) := by sorry

-- SuggestedTameComplexKernelTests.odd_value_one
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    normalizedMellinContinuation (tameComplexKernel η) 1 = η.LFunction 1 := by sorry

-- SuggestedTameComplexKernelTests.even_negative_value_sign
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    normalizedMellinContinuation (tameComplexKernel η) (-1) = 2/5 := by sorry

end

end SuggestedTameComplexKernelTests

namespace DirichletPadic
noncomputable section
section TameComplexGauss
variable {D : ℕ} [NeZero D]

theorem tameComplexGauss_denominator_ne_zero (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (a : ZMod D) (ha : a ≠ 0) (t : ℝ) :
    ε^a.val * (Real.exp t : ℂ) - 1 ≠ 0 := by sorry

theorem tameComplexGauss_analyticAt (η : DirichletCharacter ℂ D) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D) (t : ℝ) :
    AnalyticAt ℝ (fun t : ℝ => (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1))) t := by sorry

theorem tameComplexGauss_generating (η : DirichletCharacter ℂ D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) (t : ℝ) :
    (1-(Real.exp (D*t) : ℂ)) * (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) =
      ∑ a : ZMod D, η a * (Real.exp (a.val*t) : ℂ) := by sorry

theorem tameComplexKernel_eq_gauss (η : DirichletCharacter ℂ D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) (t : ℝ) :
    tameComplexKernel η t = (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) := by sorry

theorem tameComplexGauss_mass (η : DirichletCharacter ℂ D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val-1) =
    -(D : ℂ)⁻¹ * ∑ a : ZMod D, η a * a.val := by sorry

theorem tameComplexGauss_root_independent (η : DirichletCharacter ℂ D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε₁ ε₂ : ℂ) (hε₁ : IsPrimitiveRoot ε₁ D) (hε₂ : IsPrimitiveRoot ε₂ D)
    (hG₁ : gaussSum η⁻¹ (AddChar.zmodChar D hε₁.pow_eq_one) ≠ 0)
    (hG₂ : gaussSum η⁻¹ (AddChar.zmodChar D hε₂.pow_eq_one) ≠ 0) (t : ℝ) :
    (-(gaussSum η⁻¹ (AddChar.zmodChar D hε₁.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε₁^a.val * (Real.exp t : ℂ)-1)) = (-(gaussSum η⁻¹ (AddChar.zmodChar D hε₂.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε₂^a.val * (Real.exp t : ℂ)-1)) := by sorry

theorem tameComplexGauss_normalized_eq_LFunction (η : DirichletCharacter ℂ D) (hη : η.IsPrimitive)
    (hD : 1 < D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) (s : ℂ) :
    normalizedMellinContinuation (fun t : ℝ => (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1))) s = -η (-1) * η.LFunction s := by sorry

theorem tameComplexKernel_formal_derivative (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    (hD : IsUnit (D : ℂ)) (k : ℕ) :
    iteratedDeriv k (tameComplexKernel η) 0 =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation ℂ)^[k] (tameSeries η hD)) := by sorry

theorem tameComplexKernel_formal_exponential_coeff (η : DirichletCharacter ℂ D) (hη : η ≠ 1)
    (hD : IsUnit (D : ℂ)) (k : ℕ) :
    PowerSeries.coeff k (PowerSeries.subst (PowerSeries.exp ℂ-1) (tameSeries η hD)) =
      iteratedDeriv k (tameComplexKernel η) 0 / (k.factorial : ℂ) := by sorry

end TameComplexGauss

end

end DirichletPadic

namespace SuggestedComplexGaussTests
open DirichletPadic

noncomputable section
-- SuggestedComplexGaussTests.imaginary_denominator
example (t : ℝ) : Complex.I * (Real.exp t : ℂ)-1 ≠ 0 := by sorry

-- SuggestedComplexGaussTests.zero_residue_denominator
example (ε : ℂ) : ε^((0 : ZMod 3).val) * (Real.exp 0 : ℂ)-1 = 0 := by sorry

-- SuggestedComplexGaussTests.zero_normalization
example {D : ℕ} [NeZero D] (η : DirichletCharacter ℂ D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) = 0) (t : ℝ) : (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) = 0 := by sorry

-- SuggestedComplexGaussTests.quadratic_generating
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 4)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one) ≠ 0) (t : ℝ) :
    (1-(Real.exp (4*t) : ℂ)) * (-(gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 4, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) =
      (Real.exp t : ℂ) - (Real.exp (3*t) : ℂ) := by sorry

-- SuggestedComplexGaussTests.quadratic_gauss_origin
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0) : (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / (ε^a.val * (Real.exp 0 : ℂ)-1)) = 1/3 := by sorry

-- SuggestedComplexGaussTests.quadratic_gauss_log_two
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 4)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one) ≠ 0) :
    (-(gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 4, η⁻¹ a / (ε^a.val * (Real.exp (Real.log 2) : ℂ)-1)) = 2/5 := by sorry

-- SuggestedComplexGaussTests.inverse_primitive_root
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (ε : ℂ)
    (hε : IsPrimitiveRoot ε 3) (hεi : IsPrimitiveRoot ε⁻¹ 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0)
    (hGi : gaussSum η⁻¹ (AddChar.zmodChar 3 hεi.pow_eq_one) ≠ 0) (t : ℝ) :
    (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) = (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hεi.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / ((ε⁻¹)^a.val * (Real.exp t : ℂ)-1)) := by sorry

-- SuggestedComplexGaussTests.even_gauss_negative_value
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 5)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 5 hε.pow_eq_one) ≠ 0) :
    normalizedMellinContinuation (fun t : ℝ => (-(gaussSum η⁻¹ (AddChar.zmodChar 5 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 5, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1))) (-1) = 2/5 := by sorry

-- SuggestedComplexGaussTests.ordinary_derivative_normalization
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℂ)) :
    iteratedDeriv 2 (tameComplexKernel η) 0 =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation ℂ)^[2] (tameSeries η hD)) := by sorry

-- SuggestedComplexGaussTests.exponential_factorial
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℂ)) :
    PowerSeries.coeff 2 (PowerSeries.subst (PowerSeries.exp ℂ-1) (tameSeries η hD)) =
      iteratedDeriv 2 (tameComplexKernel η) 0 / 2 := by sorry

end

end SuggestedComplexGaussTests

namespace DirichletPadic
open scoped AbstractMeasure BigOperators

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

lemma primePowerCharacter_gauss (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (z : ℤ_[p]) :
    primePowerCharacter p n χ z = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * e (c*PadicInt.toZModPow n z) := sorry

def smoothedAdditiveTwist (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) : D(ℤ_[p],K) := sorry

lemma smoothedAdditiveTwist_eq_weight (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n e c a ha = weight
      (ContinuousMap.mk (fun z : ℤ_[p] => e (c*PadicInt.toZModPow n z))
        ((continuous_of_discreteTopology : Continuous (fun x : ZMod (p^n) => e (c*x))).comp
          (PadicInt.continuous_toZModPow p n)))
      (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha)) := sorry

lemma smoothedAdditiveTwist_apply (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) (f : C(ℤ_[p],K)) :
    smoothedAdditiveTwist p n e c a ha f =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha)
        ((ContinuousMap.mk (fun z : ℤ_[p] => e (c*PadicInt.toZModPow n z))
          ((continuous_of_discreteTopology : Continuous (fun x : ZMod (p^n) => e (c*x))).comp
            (PadicInt.continuous_toZModPow p n))) * f) := sorry

lemma smoothedAdditiveTwist_zero_index (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n e 0 a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry

lemma smoothedAdditiveTwist_trivial (n : ℕ) (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n (1 : AddChar (ZMod (p^n)) K) c a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry

lemma smoothedAdditiveTwist_one_parameter (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (h1 : ¬p∣1) : smoothedAdditiveTwist p n e c 1 h1 = 0 := sorry

lemma smoothedAdditiveTwist_amice_coeff (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) (j : ℕ) :
    (smoothedAdditiveTwist p n e c a ha).amiceTransform.coeff j =
      smoothedAdditiveTwist p n e c a ha
        ((mahler j : C(ℤ_[p],ℤ_[p])) • (1 : C(ℤ_[p],K))) := sorry

lemma twistedSmoothedMeasure_gauss (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha =
      (gaussSum χ⁻¹ e)⁻¹ • ∑ c : ZMod (p^n), χ⁻¹ c • smoothedAdditiveTwist p n e c a ha := sorry

lemma twistedSmoothedMeasure_gauss_amice (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform =
      (gaussSum χ⁻¹ e)⁻¹ • ∑ c : ZMod (p^n), χ⁻¹ c •
        (smoothedAdditiveTwist p n e c a ha).amiceTransform := sorry

namespace SuggestedPrimePowerGaussTests
-- SuggestedPrimePowerGaussTests.gauss_lift_one
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) :
    (1 : K)=(gaussSum χ⁻¹ e)⁻¹ * ∑ c : ZMod (p^n), χ⁻¹ c * e c := sorry

-- SuggestedPrimePowerGaussTests.gauss_lift_nonunit
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) :
    (gaussSum χ⁻¹ e)⁻¹ * ∑ c : ZMod (p^n), χ⁻¹ c * e (c*(p : ZMod (p^n))) = 0 := sorry

-- SuggestedPrimePowerGaussTests.additive_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n e 0 a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry

-- SuggestedPrimePowerGaussTests.additive_trivial_character
example (n : ℕ) (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n (1 : AddChar (ZMod (p^n)) K) c a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry

-- SuggestedPrimePowerGaussTests.additive_one_smoothing
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n)) (h1 : ¬p∣1) :
    smoothedAdditiveTwist p n e c 1 h1 = 0 := sorry

-- SuggestedPrimePowerGaussTests.additive_dyadic_sign_first_moment
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod (2^1)) ℚ_[2])
    (he : e 1 = -1) :
    smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)
      ((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],ℚ_[2]))) = -2 := sorry

-- SuggestedPrimePowerGaussTests.gauss_measure_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * smoothedAdditiveTwist p n e c a ha 1 := sorry

-- SuggestedPrimePowerGaussTests.gauss_measure_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (h1 : ¬p∣1) :
    (gaussSum χ⁻¹ e)⁻¹ • ∑ c : ZMod (p^n), χ⁻¹ c • smoothedAdditiveTwist p n e c 1 h1 = 0 := sorry

-- SuggestedPrimePowerGaussTests.gauss_amice_coeff_zero
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform.coeff 0 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * (smoothedAdditiveTwist p n e c a ha).amiceTransform.coeff 0 := sorry

-- SuggestedPrimePowerGaussTests.gauss_amice_coeff_second
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform.coeff 2 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * (smoothedAdditiveTwist p n e c a ha).amiceTransform.coeff 2 := sorry

end SuggestedPrimePowerGaussTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure BigOperators

open AbstractMeasure PowerSeries

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

lemma extend_smoothedMeasure_translation_sum (a : ℕ) (ha : ¬p∣a) :
    (∑ i ∈ Finset.range a, AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[p] => x+(i : ℤ_[p])) (by fun_prop))
      (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha))) =
    ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, dirac K (j : ℤ_[p]) := sorry

lemma smoothedAdditiveTwist_translation_sum (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    (∑ i ∈ Finset.range a, e c ^ i • AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[p] => x+(i : ℤ_[p])) (by fun_prop))
      (smoothedAdditiveTwist p n e c a ha)) =
    ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, e c ^ j • dirac K (j : ℤ_[p]) := sorry

lemma smoothedAdditiveTwist_amice_cancellation (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    (∑ i ∈ Finset.range a, (C (e c) * (1+X))^i) *
      (smoothedAdditiveTwist p n e c a ha).amiceTransform =
    ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, (C (e c) * (1+X))^j := sorry

lemma smoothedAdditiveTwist_denominator_ne_zero (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) : ∑ i ∈ Finset.range a, e c ^ i ≠ 0 := sorry

lemma smoothedAdditiveTwist_amice_rational (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    (smoothedAdditiveTwist p n e c a ha).amiceTransform =
      (∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, (C (e c) * (1+X))^j) *
      (∑ i ∈ Finset.range a, (C (e c) * (1+X))^i)⁻¹ := sorry

lemma twistedSmoothedMeasure_gauss_rational (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform =
      (gaussSum χ⁻¹ e)⁻¹ • ∑ c : ZMod (p^n), χ⁻¹ c •
        ((∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, (C (e c) * (1+X))^j) *
          (∑ i ∈ Finset.range a, (C (e c) * (1+X))^i)⁻¹) := sorry

namespace SuggestedAdditiveRationalTests
-- SuggestedAdditiveRationalTests.translation_two
example [IsBoundedSMul ℤ_[3] ℚ_[3]] :
    extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)) +
      AbstractMeasure.map (ContinuousMap.mk (fun x : ℤ_[3] => x+1) (by fun_prop))
        (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num))) =
      dirac ℚ_[3] (0 : ℤ_[3]) := sorry

-- SuggestedAdditiveRationalTests.translation_three
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    (∑ i ∈ Finset.range 3, AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[2] => x+(i : ℤ_[2])) (by fun_prop))
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 3 (by norm_num)))) =
    2 • dirac ℚ_[2] (0 : ℤ_[2]) + dirac ℚ_[2] (1 : ℤ_[2]) := sorry

-- SuggestedAdditiveRationalTests.weighted_translation_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) (ha : ¬p∣a) :
    (∑ i ∈ Finset.range a, AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[p] => x+(i : ℤ_[p])) (by fun_prop))
      (smoothedAdditiveTwist p n e 0 a ha)) =
    ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, dirac K (j : ℤ_[p]) := sorry

-- SuggestedAdditiveRationalTests.weighted_translation_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (∑ i ∈ Finset.range 3, (-1 : ℚ_[2])^i • AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[2] => x+(i : ℤ_[2])) (by fun_prop))
      (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num))) =
    2 • dirac ℚ_[2] (0 : ℤ_[2]) - dirac ℚ_[2] (1 : ℤ_[2]) := sorry

-- SuggestedAdditiveRationalTests.additive_cancellation_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (1+X+X^2) * (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform = 1-X := sorry

-- SuggestedAdditiveRationalTests.additive_cancellation_one
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n)) (h1 : ¬p∣1) :
    (smoothedAdditiveTwist p n e c 1 h1).amiceTransform = 0 := sorry

-- SuggestedAdditiveRationalTests.denominator_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) :
    (∑ i ∈ Finset.range a, e 0 ^ i) = (a : K) := sorry

-- SuggestedAdditiveRationalTests.denominator_dyadic_sign
example : (∑ i ∈ Finset.range 3, (-1 : ℚ_[2])^i) = 1 := sorry

-- SuggestedAdditiveRationalTests.denominator_bad_smoothing
example : (∑ i ∈ Finset.range 2, (-1 : ℚ_[2])^i) = 0 := sorry

-- SuggestedAdditiveRationalTests.rational_dyadic_constant
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 0 = 1 := sorry

-- SuggestedAdditiveRationalTests.rational_dyadic_linear
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 1 = -2 := sorry

-- SuggestedAdditiveRationalTests.rational_dyadic_second
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 2 = 1 := sorry

-- SuggestedAdditiveRationalTests.gauss_rational_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, e c ^ j) /
          (∑ i ∈ Finset.range a, e c ^ i)) := sorry

-- SuggestedAdditiveRationalTests.gauss_rational_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (h1 : ¬p∣1) :
    (twistedSmoothedMeasure p n χ 1 h1).amiceTransform = 0 := sorry

end SuggestedAdditiveRationalTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure BigOperators

open AbstractMeasure PowerSeries

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

lemma smoothedAdditiveTwist_root_pow_ne_one (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) (hc : e c ≠ 1) : e c ^ a ≠ 1 := sorry

lemma smoothedAdditiveTwist_amice_fractions (n : ℕ) (e : AddChar (ZMod (p^n)) K)
    (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) (hc : e c ≠ 1) :
    (smoothedAdditiveTwist p n e c a ha).amiceTransform =
      (C (e c)*(1+X)-1)⁻¹ - C (a : K)*((C (e c)*(1+X))^a-1)⁻¹ := sorry

lemma twistedSmoothedMeasure_gauss_fractions (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform =
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ •
      ∑ c : ZMod (p^n), χ⁻¹ c •
        ((C (ε^c.val)*(1+X)-1)⁻¹ -
          C (a : K)*((C (ε^c.val)*(1+X))^a-1)⁻¹) := sorry

namespace SuggestedGaussFractionTests
-- SuggestedGaussFractionTests.nonidentity_root_odd_smoothing
example : (-1 : ℚ_[2])^3 ≠ 1 := sorry

-- SuggestedGaussFractionTests.nonidentity_root_bad_smoothing
example : (-1 : ℚ_[2])^2 = 1 := sorry

-- SuggestedGaussFractionTests.fraction_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform =
      (-(1+X)-1)⁻¹ - C (3 : ℚ_[2])*(-(1+X)^3-1)⁻¹ := sorry

-- SuggestedGaussFractionTests.fraction_identity_root_failure
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    (((1+X)-1 : ℚ_[2]⟦X⟧)⁻¹ - C (3 : ℚ_[2])*((1+X)^3-1)⁻¹).coeff 0 ≠
      (smoothedAdditiveTwist 2 1 (1 : AddChar (ZMod 2) ℚ_[2]) 0 3
        (by norm_num)).amiceTransform.coeff 0 := sorry

-- SuggestedGaussFractionTests.fraction_one_smoothing
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n))
    (h1 : ¬p∣1) (hc : e c ≠ 1) :
    (smoothedAdditiveTwist p n e c 1 h1).amiceTransform =
      (C (e c)*(1+X)-1)⁻¹-(C (e c)*(1+X)-1)⁻¹ := sorry

-- SuggestedGaussFractionTests.gauss_fraction_zero_index
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (a : ℕ) :
    χ⁻¹ (0 : ZMod (p^n)) •
      ((((1+X)-1 : K⟦X⟧))⁻¹-C (a : K)*((1+X)^a-1)⁻¹) = 0 := sorry

-- SuggestedGaussFractionTests.gauss_fraction_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 =
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val-1)⁻¹-(a : K)*((ε^c.val)^a-1)⁻¹) := sorry

-- SuggestedGaussFractionTests.gauss_fraction_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (h1 : ¬p∣1) : (twistedSmoothedMeasure p n χ 1 h1).amiceTransform = 0 := sorry

end SuggestedGaussFractionTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure BigOperators

open AbstractMeasure PowerSeries

section FiniteResolvents
variable (p : ℕ) [Fact p.Prime] {K : Type*} [Field K]

lemma primePowerGauss_resolvent_reindex (n : ℕ)
    (χ : DirichletCharacter K (p^n)) (e : AddChar (ZMod (p^n)) K)
    (a : ℕ) (ha : ¬p∣a) :
    (∑ c : ZMod (p^n), χ⁻¹ c • ((C (e c)*(1+X))^a-1)⁻¹) =
      χ (a : ZMod (p^n)) •
        ∑ c : ZMod (p^n), χ⁻¹ c • (C (e c)*(1+X)^a-1)⁻¹ := sorry

lemma primePowerGauss_resolvent_subst (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (a : ℕ) :
    subst ((1+X : K⟦X⟧)^a-1)
        (∑ c : ZMod (p^n), χ⁻¹ c • (C (ε^c.val)*(1+X)-1)⁻¹) =
      ∑ c : ZMod (p^n), χ⁻¹ c • (C (ε^c.val)*(1+X)^a-1)⁻¹ := sorry

end FiniteResolvents

section PrimePowerInterpolation
variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

theorem twistedSmoothedMeasure_amice_tameSeries (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (hD : IsUnit ((p^n : ℕ) : K)) (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform =
      -tameSeries χ hD + C ((a : K)*χ (a : ZMod (p^n))) *
        subst ((1+X : K⟦X⟧)^a-1) (tameSeries χ hD) := sorry

variable [CharZero K] [Algebra ℚ K]

theorem twistedSmoothedMeasure_exp_coeff (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (hD : IsUnit ((p^n : ℕ) : K)) (a : ℕ) (ha : ¬p∣a) (k : ℕ) :
    coeff k (subst (exp K-1) (twistedSmoothedMeasure p n χ a ha).amiceTransform) =
      (1-χ (a : ZMod (p^n))*(a : K)^(k+1)) * ((p^n : ℕ) : K)^k /
        ((k+1).factorial : K) * ∑ b : ZMod (p^n),
          χ b * algebraMap ℚ K ((Polynomial.bernoulli (k+1)).eval (b.val/(p^n) : ℚ)) := sorry

theorem twistedSmoothedMeasure_ordinary_moment (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (hD : IsUnit ((p^n : ℕ) : K)) (a : ℕ) (ha : ¬p∣a) (k : ℕ) :
    twistedSmoothedMeasure p n χ a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) =
      (1-χ (a : ZMod (p^n))*(a : K)^(k+1)) * ((p^n : ℕ) : K)^k /
        (k+1) * ∑ b : ZMod (p^n),
          χ b * algebraMap ℚ K ((Polynomial.bernoulli (k+1)).eval (b.val/(p^n) : ℚ)) := sorry

end PrimePowerInterpolation

namespace SuggestedPrimePowerMomentTests
section Algebra
variable {K : Type*} [Field K]

-- SuggestedPrimePowerMomentTests.reindex_one
example (χ : DirichletCharacter K (3^1)) (e : AddChar (ZMod (3^1)) K) :
    (∑ c : ZMod (3^1), χ⁻¹ c • ((C (e c)*(1+X))^1-1)⁻¹) =
      ∑ c : ZMod (3^1), χ⁻¹ c • (C (e c)*(1+X)-1)⁻¹ := sorry

-- SuggestedPrimePowerMomentTests.reindex_character_factor
example (χ : DirichletCharacter K (3^2)) (e : AddChar (ZMod (3^2)) K)
    (z : K) (hz : χ 2 = z) :
    (∑ c : ZMod (3^2), χ⁻¹ c • ((C (e c)*(1+X))^2-1)⁻¹) =
      z • ∑ c : ZMod (3^2), χ⁻¹ c • (C (e c)*(1+X)^2-1)⁻¹ := sorry

-- SuggestedPrimePowerMomentTests.subst_one
example (χ : DirichletCharacter K (3^1)) (ε : K) :
    subst ((1+X : K⟦X⟧)^1-1)
      (∑ c : ZMod (3^1), χ⁻¹ c • (C (ε^c.val)*(1+X)-1)⁻¹) =
      ∑ c : ZMod (3^1), χ⁻¹ c • (C (ε^c.val)*(1+X)-1)⁻¹ := sorry

-- SuggestedPrimePowerMomentTests.subst_zero_index
example (χ : DirichletCharacter K (3^1)) (a : ℕ) :
    subst ((1+X : K⟦X⟧)^a-1)
      (χ⁻¹ (0 : ZMod (3^1)) • ((1+X : K⟦X⟧)-1)⁻¹) = 0 := sorry

end Algebra

section General
variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

variable (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
  (ε : K) (hε : IsPrimitiveRoot ε (p^n))
  (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
  (hD : IsUnit ((p^n : ℕ) : K))

include hn hχ hε hG

-- SuggestedPrimePowerMomentTests.formal_one_smoothing
example (h1 : ¬p∣1) :
    (twistedSmoothedMeasure p n χ 1 h1).amiceTransform =
      -tameSeries χ hD + tameSeries χ hD := sorry

-- SuggestedPrimePowerMomentTests.formal_mass_factor
example (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 =
      ((a : K)*χ (a : ZMod (p^n))-1) * constantCoeff (tameSeries χ hD) := sorry

variable [CharZero K] [Algebra ℚ K]

-- SuggestedPrimePowerMomentTests.exponential_one_smoothing
example (h1 : ¬p∣1) (k : ℕ) :
    coeff k (subst (exp K-1) (twistedSmoothedMeasure p n χ 1 h1).amiceTransform) = 0 := sorry

-- SuggestedPrimePowerMomentTests.ordinary_one_smoothing
example (h1 : ¬p∣1) (k : ℕ) :
    twistedSmoothedMeasure p n χ 1 h1
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) = 0 := sorry

end General

section QuadraticThree
variable {K : Type*} [NormedField K] [Algebra ℤ_[3] K] [CharZero K] [Algebra ℚ K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[3] K]

variable (χ : DirichletCharacter K (3^1)) (hχ : χ.IsPrimitive) (h2 : χ 2 = -1)
  (ε : K) (hε : IsPrimitiveRoot ε (3^1))
  (hG : gaussSum χ⁻¹ (AddChar.zmodChar (3^1) hε.pow_eq_one) ≠ 0)

include hχ h2 hε hG

-- SuggestedPrimePowerMomentTests.exponential_three_second
example : coeff 2 (subst (exp K-1)
    (twistedSmoothedMeasure 3 1 χ 4 (by norm_num)).amiceTransform) = -7 := sorry

-- SuggestedPrimePowerMomentTests.ordinary_three_mass
example : twistedSmoothedMeasure 3 1 χ 4 (by norm_num) 1 = 1 := sorry

-- SuggestedPrimePowerMomentTests.ordinary_three_second
example : twistedSmoothedMeasure 3 1 χ 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) = -14 := sorry

end QuadraticThree

section QuadraticFour
variable {K : Type*} [NormedField K] [Algebra ℤ_[2] K] [CharZero K] [Algebra ℚ K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[2] K]

variable (χ : DirichletCharacter K (2^2)) (hχ : χ.IsPrimitive) (h3 : χ 3 = -1)
  (ε : K) (hε : IsPrimitiveRoot ε (2^2))
  (hG : gaussSum χ⁻¹ (AddChar.zmodChar (2^2) hε.pow_eq_one) ≠ 0)

include hχ h3 hε hG

-- SuggestedPrimePowerMomentTests.exponential_four_second
example : coeff 2 (subst (exp K-1)
    (twistedSmoothedMeasure 2 2 χ 3 (by norm_num)).amiceTransform) = 7 := sorry

-- SuggestedPrimePowerMomentTests.ordinary_four_mass
example : twistedSmoothedMeasure 2 2 χ 3 (by norm_num) 1 = -2 := sorry

-- SuggestedPrimePowerMomentTests.ordinary_four_second
example : twistedSmoothedMeasure 2 2 χ 3 (by norm_num)
    (((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],K)))^2) = 14 := sorry

end QuadraticFour

end SuggestedPrimePowerMomentTests

end DirichletPadic

namespace DirichletPadic
noncomputable section
open Set Filter Asymptotics

open scoped BigOperators

variable {D : ℕ} [NeZero D]

def smoothedCharacterKernel (χ : DirichletCharacter ℂ D) (a : ℕ) (t : ℝ) : ℂ :=
  -tameComplexKernel χ t + (a : ℂ)*χ (a : ZMod D)*tameComplexKernel χ ((a : ℝ)*t)

lemma smoothedCharacterKernel_def (χ : DirichletCharacter ℂ D) (a : ℕ) (t : ℝ) :
    smoothedCharacterKernel χ a t =
      -tameComplexKernel χ t + (a : ℂ)*χ (a : ZMod D)*tameComplexKernel χ ((a : ℝ)*t) := rfl

lemma smoothedCharacterKernel_zero (χ : DirichletCharacter ℂ D) (a : ℕ) :
    smoothedCharacterKernel χ a 0 = ((a : ℂ)*χ (a : ZMod D)-1) *
      (-(D : ℂ)⁻¹ * ∑ b : ZMod D, χ b * b.val) := sorry

lemma smoothedCharacterKernel_one (χ : DirichletCharacter ℂ D) :
    smoothedCharacterKernel χ 1 = fun _ => 0 := sorry

lemma smoothedCharacterKernel_zero_parameter (χ : DirichletCharacter ℂ D) (t : ℝ) :
    smoothedCharacterKernel χ 0 t = -tameComplexKernel χ t := sorry

theorem smoothedCharacterKernel_analyticAt (χ : DirichletCharacter ℂ D)
    (a : ℕ) (t : ℝ) : AnalyticAt ℝ (smoothedCharacterKernel χ a) t := sorry

theorem smoothedCharacterKernel_contDiff (χ : DirichletCharacter ℂ D) (a : ℕ) :
    ContDiff ℝ (⊤ : ℕ∞) (smoothedCharacterKernel χ a) := sorry

theorem smoothedCharacterKernel_iteratedDeriv (χ : DirichletCharacter ℂ D)
    (a k : ℕ) (t : ℝ) :
    iteratedDeriv k (smoothedCharacterKernel χ a) t =
      -iteratedDeriv k (tameComplexKernel χ) t +
        (a : ℂ)^(k+1)*χ (a : ZMod D)*iteratedDeriv k (tameComplexKernel χ) ((a : ℝ)*t) := sorry

theorem smoothedCharacterKernel_iteratedDeriv_zero_eq_LFunction
    (χ : DirichletCharacter ℂ D) (hχ : χ ≠ 1) (a k : ℕ) :
    iteratedDeriv k (smoothedCharacterKernel χ a) 0 =
      (χ (a : ZMod D)*(a : ℂ)^(k+1)-1)*χ.LFunction (-(k : ℂ)) := sorry

theorem smoothedCharacterKernel_iteratedDerivWithin_zero_eq_LFunction
    (χ : DirichletCharacter ℂ D) (hχ : χ ≠ 1) (a k : ℕ) :
    iteratedDerivWithin k (smoothedCharacterKernel χ a) (Ici 0) 0 =
      (χ (a : ZMod D)*(a : ℂ)^(k+1)-1)*χ.LFunction (-(k : ℂ)) := sorry

theorem smoothedCharacterKernel_within_decay (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) (k : ℕ) :
    iteratedDerivWithin k (smoothedCharacterKernel χ a) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-t)) := sorry

theorem smoothedCharacterKernel_eq_gauss (p : ℕ) [Fact p.Prime]
    (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter ℂ (p^n)) (hχ : χ.IsPrimitive)
    (ε : ℂ) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (a : ℕ) (ha : ¬p∣a) (t : ℝ) :
    smoothedCharacterKernel χ a t =
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val*(Real.exp t : ℂ)-1)⁻¹ -
          (a : ℂ)*((ε^c.val)^a*(Real.exp ((a : ℝ)*t) : ℂ)-1)⁻¹) := sorry

namespace SuggestedSmoothedComplexTests
-- SuggestedSmoothedComplexTests.kernel_level_one
example (t : ℝ) : smoothedCharacterKernel (1 : DirichletCharacter ℂ 1) 3 t = 0 := sorry

-- SuggestedSmoothedComplexTests.kernel_quadratic_three_mass
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 4 0 = 1 := sorry

-- SuggestedSmoothedComplexTests.kernel_quadratic_four_mass
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    smoothedCharacterKernel χ 3 0 = -2 := sorry

-- SuggestedSmoothedComplexTests.kernel_one_parameter
example (χ : DirichletCharacter ℂ D) : smoothedCharacterKernel χ 1 = fun _ => 0 := sorry

-- SuggestedSmoothedComplexTests.kernel_zero_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 0 0 = -1/3 := sorry

-- SuggestedSmoothedComplexTests.regularity_principal_origin
example : AnalyticAt ℝ (smoothedCharacterKernel (1 : DirichletCharacter ℂ 3) 2) 0 := sorry

-- SuggestedSmoothedComplexTests.derivative_order_zero
example (χ : DirichletCharacter ℂ D) (a : ℕ) (t : ℝ) :
    iteratedDeriv 0 (smoothedCharacterKernel χ a) t =
      -tameComplexKernel χ t + (a : ℂ)*χ (a : ZMod D)*tameComplexKernel χ ((a : ℝ)*t) := sorry

-- SuggestedSmoothedComplexTests.derivative_one_parameter
example (χ : DirichletCharacter ℂ D) (k : ℕ) :
    iteratedDeriv k (smoothedCharacterKernel χ 1) = fun _ => 0 := sorry

-- SuggestedSmoothedComplexTests.derivative_quadratic_three_second
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    iteratedDeriv 2 (smoothedCharacterKernel χ 4) 0 = -14 := sorry

-- SuggestedSmoothedComplexTests.derivative_quadratic_four_second
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    iteratedDeriv 2 (smoothedCharacterKernel χ 3) 0 = 14 := sorry

-- SuggestedSmoothedComplexTests.derivative_even_character_first
example (χ : DirichletCharacter ℂ 5) (hχ : χ 2 = -1) :
    iteratedDeriv 1 (smoothedCharacterKernel χ 6) 0 = -14 := sorry

-- SuggestedSmoothedComplexTests.decay_one_parameter
example (χ : DirichletCharacter ℂ D) (k : ℕ) :
    iteratedDerivWithin k (smoothedCharacterKernel χ 1) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-t)) := sorry

-- SuggestedSmoothedComplexTests.decay_quadratic_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    Tendsto (smoothedCharacterKernel χ 4) atTop (nhds 0) := sorry

-- SuggestedSmoothedComplexTests.gauss_one_parameter
example (p : ℕ) [Fact p.Prime] (n : ℕ) (χ : DirichletCharacter ℂ (p^n))
    (ε : ℂ) (hε : IsPrimitiveRoot ε (p^n)) (t : ℝ) :
    (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val*(Real.exp t : ℂ)-1)⁻¹ -
          (1 : ℂ)*((ε^c.val)^1*(Real.exp ((1 : ℝ)*t) : ℂ)-1)⁻¹) = 0 := sorry

-- SuggestedSmoothedComplexTests.gauss_zero_residue
example (χ : DirichletCharacter ℂ 3) (a : ℕ) (t : ℝ) :
    χ⁻¹ (0 : ZMod 3) * ((Real.exp t-1 : ℂ)⁻¹-
      (a : ℂ)*(Real.exp ((a : ℝ)*t)-1 : ℂ)⁻¹) = 0 := sorry

-- SuggestedSmoothedComplexTests.kernel_quadratic_three_log_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 4 (Real.log 2) = -2/39 := sorry

-- SuggestedSmoothedComplexTests.kernel_quadratic_four_log_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    smoothedCharacterKernel χ 3 (Real.log 2) = -10/13 := sorry

end SuggestedSmoothedComplexTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open Set Filter Asymptotics

open scoped BigOperators

variable {D : ℕ} [NeZero D]

theorem smoothedCharacterKernel_mellin_convergent (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) {s : ℂ} (hs : 0<s.re) :
    MellinConvergent (smoothedCharacterKernel χ a) s := sorry

theorem smoothedCharacterKernel_mellin_eq_gamma_LFunction (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) {s : ℂ} (hs : 1<s.re) :
    mellin (smoothedCharacterKernel χ a) s = χ (-1)*Complex.Gamma s *
      (1-χ (a : ZMod D)*(a : ℂ)^(1-s))*χ.LFunction s := sorry

theorem smoothedCharacterKernel_mellin_entire (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) :
    Differentiable ℂ (normalizedMellinContinuation (smoothedCharacterKernel χ a)) := sorry

theorem smoothedCharacterKernel_normalized_eq_LFunction (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) (s : ℂ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ a) s =
      χ (-1)*(1-χ (a : ZMod D)*(a : ℂ)^(1-s))*χ.LFunction s := sorry

theorem smoothedCharacterKernel_mellin_neg_nat (χ : DirichletCharacter ℂ D)
    (hχ : χ ≠ 1) (a : ℕ) (ha : 0<a) (k : ℕ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ a) (-(k : ℂ)) =
      (-1 : ℂ)^k*(χ (a : ZMod D)*(a : ℂ)^(k+1)-1)*χ.LFunction (-(k : ℂ)) := sorry

theorem smoothedGaussKernel_normalized_eq_LFunction (p : ℕ) [Fact p.Prime]
    (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter ℂ (p^n)) (hχ : χ.IsPrimitive)
    (ε : ℂ) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (a : ℕ) (ha : ¬p∣a) (s : ℂ) :
    normalizedMellinContinuation (fun t : ℝ =>
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val*(Real.exp t : ℂ)-1)⁻¹ -
          (a : ℂ)*((ε^c.val)^a*(Real.exp ((a : ℝ)*t) : ℂ)-1)⁻¹)) s =
      χ (-1)*(1-χ (a : ZMod (p^n))*(a : ℂ)^(1-s))*χ.LFunction s := sorry

namespace SuggestedSmoothedMellinTests
-- SuggestedSmoothedMellinTests.convergence_at_one
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    MellinConvergent (smoothedCharacterKernel χ 4) 1 := sorry

-- SuggestedSmoothedMellinTests.convergence_nonunit_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    MellinConvergent (smoothedCharacterKernel χ 3) (1/2) := sorry

-- SuggestedSmoothedMellinTests.raw_three_at_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    mellin (smoothedCharacterKernel χ 4) 2 = (-3/4 : ℂ)*χ.LFunction 2 := sorry

-- SuggestedSmoothedMellinTests.raw_four_at_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    mellin (smoothedCharacterKernel χ 3) 2 = (-4/3 : ℂ)*χ.LFunction 2 := sorry

-- SuggestedSmoothedMellinTests.entire_at_zero
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    DifferentiableAt ℂ (normalizedMellinContinuation (smoothedCharacterKernel χ 4)) 0 := sorry

-- SuggestedSmoothedMellinTests.entire_at_one
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    DifferentiableAt ℂ (normalizedMellinContinuation (smoothedCharacterKernel χ 3)) 1 := sorry

-- SuggestedSmoothedMellinTests.normalized_one_parameter
example (χ : DirichletCharacter ℂ D) (s : ℂ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 1) s = 0 := sorry

-- SuggestedSmoothedMellinTests.normalized_nonunit_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) (s : ℂ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) s = -χ.LFunction s := sorry

-- SuggestedSmoothedMellinTests.normalized_three_at_one
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 1 = 0 := sorry

-- SuggestedSmoothedMellinTests.normalized_four_at_one
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 1 = -2*χ.LFunction 1 := sorry

-- SuggestedSmoothedMellinTests.normalized_three_at_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 2 = (-3/4 : ℂ)*χ.LFunction 2 := sorry

-- SuggestedSmoothedMellinTests.normalized_four_at_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 2 = (-4/3 : ℂ)*χ.LFunction 2 := sorry

-- SuggestedSmoothedMellinTests.negative_zero_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 0 = 1 := sorry

-- SuggestedSmoothedMellinTests.negative_zero_four
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 0 = -2 := sorry

-- SuggestedSmoothedMellinTests.negative_two_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) (-2) = -14 := sorry

-- SuggestedSmoothedMellinTests.negative_two_four
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) (-2) = 14 := sorry

-- SuggestedSmoothedMellinTests.negative_one_five
example (χ : DirichletCharacter ℂ 5) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 6) (-1) = 14 := sorry

-- SuggestedSmoothedMellinTests.gauss_one_parameter
example (p : ℕ) [Fact p.Prime] (n : ℕ) (χ : DirichletCharacter ℂ (p^n))
    (ε : ℂ) (hε : IsPrimitiveRoot ε (p^n)) (s : ℂ) :
    normalizedMellinContinuation (fun t : ℝ =>
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val*(Real.exp t : ℂ)-1)⁻¹ -
          (1 : ℂ)*((ε^c.val)^1*(Real.exp ((1 : ℝ)*t) : ℂ)-1)⁻¹)) s = 0 := sorry

end SuggestedSmoothedMellinTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped BigOperators

section CommonPrimePowerValues
variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]
  [CharZero K] [Algebra ℚ K]

variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]

variable (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter E (p^n))
  (ιC : E →+* ℂ) (ιK : E →+* K)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp ιK))
  (ε : K) (hε : IsPrimitiveRoot ε (p^n))
  (hG : gaussSum (χ.ringHomComp ιK)⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
  (hD : IsUnit ((p^n : ℕ) : K))

include hn hχ hε hG hD

theorem twistedSmoothedMeasure_common_special_value (a : ℕ) (ha : ¬p∣a) (k : ℕ) :
    let b : E := (χ (a : ZMod (p^n))*(a : E)^(k+1)-1) *
      (-((p^n : ℕ) : E)^k/(k+1) * ∑ r : ZMod (p^n), χ r *
        algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (r.val/(p^n) : ℚ)))
    ιC b = ((χ.ringHomComp ιC) (a : ZMod (p^n))*(a : ℂ)^(k+1)-1) *
      DirichletCharacter.LFunction (χ.ringHomComp ιC) (-(k : ℂ)) ∧
    ιK b = twistedSmoothedMeasure p n (χ.ringHomComp ιK) a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) := sorry

theorem twistedSmoothedMeasure_common_origin_derivative (a : ℕ) (ha : ¬p∣a) (k : ℕ) :
    let b : E := (χ (a : ZMod (p^n))*(a : E)^(k+1)-1) *
      (-((p^n : ℕ) : E)^k/(k+1) * ∑ r : ZMod (p^n), χ r *
        algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (r.val/(p^n) : ℚ)))
    ιC b = iteratedDeriv k (smoothedCharacterKernel (χ.ringHomComp ιC) a) 0 ∧
    ιK b = twistedSmoothedMeasure p n (χ.ringHomComp ιK) a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) := sorry

theorem twistedSmoothedMeasure_common_normalized_value (a : ℕ) (ha : ¬p∣a) (k : ℕ) :
    let b : E := (-1 : E)^k * ((χ (a : ZMod (p^n))*(a : E)^(k+1)-1) *
      (-((p^n : ℕ) : E)^k/(k+1) * ∑ r : ZMod (p^n), χ r *
        algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (r.val/(p^n) : ℚ))))
    ιC b = normalizedMellinContinuation (smoothedCharacterKernel (χ.ringHomComp ιC) a)
      (-(k : ℂ)) ∧
    ιK b = (-1 : K)^k * twistedSmoothedMeasure p n (χ.ringHomComp ιK) a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) := sorry

theorem twistedSmoothedMeasure_common_positive_weight (a : ℕ) (ha : ¬p∣a)
    (w : ℕ) (hw : 1≤w) :
    let b : E := (χ (a : ZMod (p^n))*(a : E)^w-1) *
      (-((p^n : ℕ) : E)^(w-1)/w * ∑ r : ZMod (p^n), χ r *
        algebraMap ℚ E ((Polynomial.bernoulli w).eval (r.val/(p^n) : ℚ)))
    ιC b = ((χ.ringHomComp ιC) (a : ZMod (p^n))*(a : ℂ)^w-1) *
      DirichletCharacter.LFunction (χ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = twistedSmoothedMeasure p n (χ.ringHomComp ιK) a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^(w-1)) := sorry

theorem twistedSmoothedMeasure_quotient_common_special_value (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hd : χ (a : ZMod (p^n))*(a : E)^(k+1)-1 ≠ 0) :
    let b : E := -((p^n : ℕ) : E)^k/(k+1) * ∑ r : ZMod (p^n), χ r *
      algebraMap ℚ E ((Polynomial.bernoulli (k+1)).eval (r.val/(p^n) : ℚ))
    ιC b = DirichletCharacter.LFunction (χ.ringHomComp ιC) (-(k : ℂ)) ∧
    ιK b = twistedSmoothedMeasure p n (χ.ringHomComp ιK) a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) /
      ((χ.ringHomComp ιK) (a : ZMod (p^n))*(a : K)^(k+1)-1) := sorry

end CommonPrimePowerValues

theorem twistedSmoothedMeasure_quotient_independent (p : ℕ) [Fact p.Prime]
    {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
    [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]
    [CharZero K] [Algebra ℚ K]
    (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (hD : IsUnit ((p^n : ℕ) : K)) (a b k : ℕ) (ha : ¬p∣a) (hb : ¬p∣b)
    (hda : χ (a : ZMod (p^n))*(a : K)^(k+1)-1 ≠ 0)
    (hdb : χ (b : ZMod (p^n))*(b : K)^(k+1)-1 ≠ 0) :
    twistedSmoothedMeasure p n χ a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) /
      (χ (a : ZMod (p^n))*(a : K)^(k+1)-1) =
    twistedSmoothedMeasure p n χ b hb
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],K)))^k) /
      (χ (b : ZMod (p^n))*(b : K)^(k+1)-1) := sorry

namespace SuggestedPrimePowerCommonValueTests
-- SuggestedPrimePowerCommonValueTests.unit_smoothing
example {E : Type*} [Field E] {D : ℕ} [NeZero D] (χ : DirichletCharacter E D)
    (k : ℕ) (b : E) : (χ (1 : ZMod D)*(1 : E)^(k+1)-1)*b = 0 := sorry

-- SuggestedPrimePowerCommonValueTests.quotient_denominator_one_zero
example {E : Type*} [Field E] {D : ℕ} [NeZero D] (χ : DirichletCharacter E D)
    (k : ℕ) : χ (1 : ZMod D)*(1 : E)^(k+1)-1 = 0 := sorry

section Three
variable {K : Type*} [NormedField K] [Algebra ℤ_[3] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[3] K]
  [CharZero K] [Algebra ℚ K]

variable (χ : DirichletCharacter ℚ 3) (h2 : χ 2 = -1)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp (algebraMap ℚ K)))
  (ε : K) (hε : IsPrimitiveRoot ε 3)
  (hG : gaussSum (χ.ringHomComp (algebraMap ℚ K))⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0)

include h2 hχ hε hG

-- SuggestedPrimePowerCommonValueTests.common_mass_three
example : (algebraMap ℚ ℂ) 1 = iteratedDeriv 0
    (smoothedCharacterKernel (χ.ringHomComp (algebraMap ℚ ℂ)) 4) 0 ∧
    (algebraMap ℚ K) 1 = twistedSmoothedMeasure 3 1
      (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 := sorry

-- SuggestedPrimePowerCommonValueTests.common_second_three
example : (algebraMap ℚ ℂ) (-14) = iteratedDeriv 2
    (smoothedCharacterKernel (χ.ringHomComp (algebraMap ℚ ℂ)) 4) 0 ∧
    (algebraMap ℚ K) (-14) = twistedSmoothedMeasure 3 1
      (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
      (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) := sorry

-- SuggestedPrimePowerCommonValueTests.shifted_weight_one
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^(1-1)) = 1 := sorry

-- SuggestedPrimePowerCommonValueTests.shifted_weight_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^(3-1)) = -14 := sorry

-- SuggestedPrimePowerCommonValueTests.quotient_mass_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 /
    (3 : K) = (1/3 : K) := sorry

-- SuggestedPrimePowerCommonValueTests.quotient_second_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) / (63 : K) = (-2/9 : K) := sorry

-- SuggestedPrimePowerCommonValueTests.independence_three_mass
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 /
    (3 : K) = twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 7
      (by norm_num) 1 / (6 : K) := sorry

-- SuggestedPrimePowerCommonValueTests.independence_three_second
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) / (63 : K) =
    twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 7 (by norm_num)
      (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) / (342 : K) := sorry

end Three

section Four
variable {K : Type*} [NormedField K] [Algebra ℤ_[2] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[2] K]
  [CharZero K] [Algebra ℚ K]

variable (χ : DirichletCharacter ℚ 4) (h3 : χ 3 = -1)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp (algebraMap ℚ K)))
  (ε : K) (hε : IsPrimitiveRoot ε 4)
  (hG : gaussSum (χ.ringHomComp (algebraMap ℚ K))⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one) ≠ 0)

include h3 hχ hε hG

-- SuggestedPrimePowerCommonValueTests.common_mass_four
example : (algebraMap ℚ ℂ) (-2) = iteratedDeriv 0
    (smoothedCharacterKernel (χ.ringHomComp (algebraMap ℚ ℂ)) 3) 0 ∧
    (algebraMap ℚ K) (-2) = twistedSmoothedMeasure 2 2
      (χ.ringHomComp (algebraMap ℚ K)) 3 (by norm_num) 1 := sorry

end Four

section Five
local instance : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

variable {K : Type*} [NormedField K] [Algebra ℤ_[5] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[5] K]
  [CharZero K] [Algebra ℚ K]

variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]

variable (χ : DirichletCharacter E 5) (ιC : E →+* ℂ) (ιK : E →+* K)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp ιK))
  (ε : K) (hε : IsPrimitiveRoot ε 5)
  (hG : gaussSum (χ.ringHomComp ιK)⁻¹ (AddChar.zmodChar 5 hε.pow_eq_one) ≠ 0)

include hχ hε hG

-- SuggestedPrimePowerCommonValueTests.common_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    iteratedDeriv 0 (smoothedCharacterKernel (χ.ringHomComp ιC) 6) 0 = 3+Complex.I ∧
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 = 3+ιK (χ 2) := sorry

-- SuggestedPrimePowerCommonValueTests.normalized_even_first_five
example (h2 : χ 2 = -1) :
    ιC 14 = normalizedMellinContinuation (smoothedCharacterKernel (χ.ringHomComp ιC) 6) (-1) ∧
    ιK 14 = -twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num)
      ((ContinuousMap.id ℤ_[5]) • (1 : C(ℤ_[5],K))) := sorry

-- SuggestedPrimePowerCommonValueTests.shifted_weight_two_even
example (h2 : χ 2 = -1) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num)
      (((ContinuousMap.id ℤ_[5]) • (1 : C(ℤ_[5],K)))^(2-1)) = -14 := sorry

-- SuggestedPrimePowerCommonValueTests.quotient_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 / (5 : K) =
      ιK ((3+χ 2)/5) := sorry

-- SuggestedPrimePowerCommonValueTests.independence_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 2 (by norm_num) 1 / (2*ιK (χ 2)-1) =
      twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 / (5 : K) := sorry

end Five

end SuggestedPrimePowerCommonValueTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

section ArithmeticUnitCharacters
variable (p : ℕ) [Fact p.Prime]

variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]

def primePowerArithmeticCharacter (n : ℕ) (χ : DirichletCharacter R (p^n)) (w : ℕ) :
    ContinuousMonoidHom (ℤ_[p])ˣ R := sorry

lemma primePowerArithmeticCharacter_apply (n : ℕ) (χ : DirichletCharacter R (p^n))
    (w : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ w u = primePowerCharacter p n χ (u : ℤ_[p]) *
      (algebraMap ℤ_[p] R (u : ℤ_[p]))^w := sorry

lemma primePowerArithmeticCharacter_nat (n : ℕ) (χ : DirichletCharacter R (p^n))
    (w a : ℕ) (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = (a : ℤ_[p])) :
    primePowerArithmeticCharacter p n χ w u = χ (a : ZMod (p^n))*(a : R)^w := sorry

lemma primePowerArithmeticCharacter_neg_one (n : ℕ) (χ : DirichletCharacter R (p^n))
    (w : ℕ) : primePowerArithmeticCharacter p n χ w (-1) = χ (-1)*(-1 : R)^w := sorry

lemma primePowerArithmeticCharacter_zero_weight (n : ℕ) (χ : DirichletCharacter R (p^n)) :
    (primePowerArithmeticCharacter p n χ 0).toContinuousMap =
      (primePowerCharacter p n χ).comp (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[p])ˣ,ℤ_[p])) := sorry

lemma primePowerArithmeticCharacter_zero_level (χ : DirichletCharacter R (p^0))
    (w : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p 0 χ w u = (algebraMap ℤ_[p] R (u : ℤ_[p]))^w := sorry

lemma primePowerArithmeticCharacter_one_add_pow (n : ℕ) (χ : DirichletCharacter R (p^n))
    (w : ℕ) (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = (1+p^(n+1) : ℕ)) :
    primePowerArithmeticCharacter p n χ w u = ((1+p^(n+1) : ℕ) : R)^w := sorry

theorem primePowerArithmeticCharacter_ne_one [Nontrivial R] [CharZero R]
    (n : ℕ) (χ : DirichletCharacter R (p^n)) (w : ℕ) (hw : 0<w) :
    primePowerArithmeticCharacter p n χ w ≠ 1 := sorry

variable [IsUltrametricDist R] [CompleteSpace R]

theorem extend_intrinsicSmoothedNumerator_character (n : ℕ) (hn : 1≤n)
    (χ : DirichletCharacter R (p^n)) (a : ℕ) (ha : ¬p∣a) (w : ℕ) (hw : 1≤w) :
    extendIntegralUnitCoefficients (R := R) (intrinsicSmoothedNumerator p a ha)
      (primePowerArithmeticCharacter p n χ w).toContinuousMap =
    twistedSmoothedMeasure p n χ a ha
      (((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p],R)))^(w-1)) := sorry

theorem extend_twoDirac_arithmeticCharacter (n : ℕ) (χ : DirichletCharacter R (p^n))
    (w a : ℕ) (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = (a : ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R)
      (dirac ℤ_[p] u-dirac ℤ_[p] (1 : (ℤ_[p])ˣ))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap =
    χ (a : ZMod (p^n))*(a : R)^w-1 := sorry

end ArithmeticUnitCharacters

section CommonNumeratorValues
variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]
  [CharZero K] [Algebra ℚ K]

variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]

variable (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter E (p^n))
  (ιC : E →+* ℂ) (ιK : E →+* K)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp ιK))
  (ε : K) (hε : IsPrimitiveRoot ε (p^n))
  (hG : gaussSum (χ.ringHomComp ιK)⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
  (hD : IsUnit ((p^n : ℕ) : K))

include hn hχ hε hG hD

theorem intrinsicSmoothedNumerator_common_character_value (a : ℕ) (ha : ¬p∣a)
    (w : ℕ) (hw : 1≤w) :
    let b : E := (χ (a : ZMod (p^n))*(a : E)^w-1) *
      (-((p^n : ℕ) : E)^(w-1)/w * ∑ r : ZMod (p^n), χ r *
        algebraMap ℚ E ((Polynomial.bernoulli w).eval (r.val/(p^n) : ℚ)))
    ιC b = ((χ.ringHomComp ιC) (a : ZMod (p^n))*(a : ℂ)^w-1) *
      DirichletCharacter.LFunction (χ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
      (primePowerArithmeticCharacter p n (χ.ringHomComp ιK) w).toContinuousMap := sorry

theorem intrinsicSmoothedNumerator_quotient_common_character_value
    (a : ℕ) (ha : ¬p∣a) (w : ℕ) (hw : 1≤w)
    (hd : χ (a : ZMod (p^n))*(a : E)^w-1 ≠ 0) :
    let b : E := -((p^n : ℕ) : E)^(w-1)/w * ∑ r : ZMod (p^n), χ r *
      algebraMap ℚ E ((Polynomial.bernoulli w).eval (r.val/(p^n) : ℚ))
    ιC b = DirichletCharacter.LFunction (χ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
      (primePowerArithmeticCharacter p n (χ.ringHomComp ιK) w).toContinuousMap /
      ((χ.ringHomComp ιK) (a : ZMod (p^n))*(a : K)^w-1) := sorry

end CommonNumeratorValues

namespace SuggestedArithmeticCharacterTests
section General
variable (p : ℕ) [Fact p.Prime]

variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]

-- SuggestedArithmeticCharacterTests.character_identity
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) :
    primePowerArithmeticCharacter p n χ w 1 = 1 := sorry

-- SuggestedArithmeticCharacterTests.level_zero_weight_zero
example (χ : DirichletCharacter R (p^0)) : primePowerArithmeticCharacter p 0 χ 0 = 1 := sorry

-- SuggestedArithmeticCharacterTests.level_zero_square
example (χ : DirichletCharacter R (p^0)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p 0 χ 2 u = (algebraMap ℤ_[p] R (u : ℤ_[p]))^2 := sorry

-- SuggestedArithmeticCharacterTests.positive_weight_nontrivial
example [Nontrivial R] [CharZero R] :
    primePowerArithmeticCharacter p 1 (1 : DirichletCharacter R (p^1)) 1 ≠ 1 := sorry

variable [IsUltrametricDist R] [CompleteSpace R]

-- SuggestedArithmeticCharacterTests.numerator_one_parameter
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) (ha : ¬p∣1) :
    extendIntegralUnitCoefficients (R := R) (intrinsicSmoothedNumerator p 1 ha)
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry

-- SuggestedArithmeticCharacterTests.denominator_identity
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) :
    extendIntegralUnitCoefficients (R := R)
      (dirac ℤ_[p] (1 : (ℤ_[p])ˣ)-dirac ℤ_[p] (1 : (ℤ_[p])ˣ))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry

-- SuggestedArithmeticCharacterTests.denominator_trivial_weight
example (n : ℕ) (u : (ℤ_[p])ˣ) :
    extendIntegralUnitCoefficients (R := R) (dirac ℤ_[p] u-dirac ℤ_[p] 1)
      (primePowerArithmeticCharacter p n (1 : DirichletCharacter R (p^n)) 0).toContinuousMap = 0 := sorry

end General

section Ternary
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]

-- SuggestedArithmeticCharacterTests.principal_sign
example : primePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 1 (-1) = -1 := sorry

-- SuggestedArithmeticCharacterTests.quadratic_weight_one_sign
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1) :
    primePowerArithmeticCharacter 3 1 χ 1 (-1) = 1 := sorry

-- SuggestedArithmeticCharacterTests.quadratic_weight_zero_sign
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1) :
    primePowerArithmeticCharacter 3 1 χ 0 (-1) = -1 := sorry

-- SuggestedArithmeticCharacterTests.principal_numerator_second
example : extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 2).toContinuousMap = 1/2 := sorry

-- SuggestedArithmeticCharacterTests.level_zero_shift_fails
example : extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
    (primePowerArithmeticCharacter 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 1).toContinuousMap = 0 ∧
    twistedSmoothedMeasure 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 2 (by norm_num) 1 = 1/2 := sorry

-- SuggestedArithmeticCharacterTests.ternary_denominator
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1)
    (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    extendIntegralUnitCoefficients (R := ℚ_[3]) (dirac ℤ_[3] u-dirac ℤ_[3] 1)
      (primePowerArithmeticCharacter 3 1 χ 1).toContinuousMap = -3 := sorry

end Ternary

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

-- SuggestedArithmeticCharacterTests.dyadic_quadratic_sign
example (χ : DirichletCharacter ℚ_[2] (2^2)) (h3 : χ 3 = -1) :
    primePowerArithmeticCharacter 2 2 χ 1 (-1) = 1 := sorry

-- SuggestedArithmeticCharacterTests.dyadic_one_add_pow
example (χ : DirichletCharacter ℚ_[2] (2^1)) (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 5) :
    primePowerArithmeticCharacter 2 1 χ 2 u = 25 := sorry

-- SuggestedArithmeticCharacterTests.dyadic_positive_zero_level
example : primePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1 ≠ 1 := sorry

-- SuggestedArithmeticCharacterTests.dyadic_denominator
example (χ : DirichletCharacter ℚ_[2] (2^2)) (h3 : χ 3 = -1)
    (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    extendIntegralUnitCoefficients (R := ℚ_[2]) (dirac ℤ_[2] u-dirac ℤ_[2] 1)
      (primePowerArithmeticCharacter 2 2 χ 1).toContinuousMap = -4 := sorry

end Dyadic

section CommonThree
variable {K : Type*} [NormedField K] [Algebra ℤ_[3] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[3] K]
  [CharZero K] [Algebra ℚ K]

variable (χ : DirichletCharacter ℚ 3) (h2 : χ 2 = -1)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp (algebraMap ℚ K)))
  (ε : K) (hε : IsPrimitiveRoot ε 3)
  (hG : gaussSum (χ.ringHomComp (algebraMap ℚ K))⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0)

include h2 hχ hε hG

-- SuggestedArithmeticCharacterTests.numerator_quadratic_weight_one
example : extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap = 1 := sorry

-- SuggestedArithmeticCharacterTests.numerator_quadratic_weight_three
example : extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 3).toContinuousMap = -14 := sorry

-- SuggestedArithmeticCharacterTests.common_numerator_zero_value
example : (algebraMap ℚ ℂ) 1 =
    3*DirichletCharacter.LFunction (χ.ringHomComp (algebraMap ℚ ℂ)) 0 ∧
    (algebraMap ℚ K) 1 = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap := sorry

-- SuggestedArithmeticCharacterTests.common_numerator_quotient
example : (algebraMap ℚ ℂ) (1/3) =
    DirichletCharacter.LFunction (χ.ringHomComp (algebraMap ℚ ℂ)) 0 ∧
    (algebraMap ℚ K) (1/3) = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap / 3 := sorry

end CommonThree

end SuggestedArithmeticCharacterTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

section PseudomeasureCharacterComparison
variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "δ" => (diracHom (G := U) (R := Z))

lemma kubotaLeopoldtPseudomeasure_numerator_nat
    (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z)) :
    Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p) =
      intrinsicSmoothedNumerator p a ha := sorry

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K] [CharZero K]

theorem kubotaLeopoldtPseudomeasure_numerator_character
    (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n))
    (w : ℕ) (hw : 1≤w) (u : U) (a : ℕ) (ha : ¬p∣a)
    (hu : (u : Z)=(a : Z)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap =
    twistedSmoothedMeasure p n χ a ha
      (((ContinuousMap.id Z) • (1 : C(Z,K)))^(w-1)) := sorry

theorem primePowerArithmeticCharacter_admissible
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) (hw : 0<w)
    (u : U) (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) :
    IsUnit (primePowerArithmeticCharacter p n χ w u-1) := sorry

theorem kubotaLeopoldtPseudomeasure_evalAt_character_ratio
    (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n))
    (w : ℕ) (hw : 1≤w)
    (f : M →+* K)
    (hf : ∀ μ : M, f μ = extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter p n χ w).toContinuousMap)
    (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z))
    (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure p) =
      twistedSmoothedMeasure p n χ a ha
        (((ContinuousMap.id Z) • (1 : C(Z,K)))^(w-1)) /
        (χ (a : ZMod (p^n))*(a : K)^w-1) := sorry

section CommonValues
variable [Algebra ℚ K]

variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]

variable (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter E (p^n))
  (ιC : E →+* ℂ) (ιK : E →+* K)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp ιK))
  (ε : K) (hε : IsPrimitiveRoot ε (p^n))
  (hG : gaussSum (χ.ringHomComp ιK)⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
  (hD : IsUnit ((p^n : ℕ) : K))

include hn hχ hε hG hD

theorem kubotaLeopoldtPseudomeasure_evalAt_common_value
    (w : ℕ) (hw : 1≤w)
    (f : M →+* K)
    (hf : ∀ μ : M, f μ = extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter p n (χ.ringHomComp ιK) w).toContinuousMap)
    (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z))
    (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    let b : E := -((p^n : ℕ) : E)^(w-1)/w * ∑ r : ZMod (p^n), χ r *
      algebraMap ℚ E ((Polynomial.bernoulli w).eval (r.val/(p^n) : ℚ))
    ιC b = DirichletCharacter.LFunction (χ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure p) := sorry

end CommonValues

namespace SuggestedPseudomeasureCharacterTests
-- SuggestedPseudomeasureCharacterTests.principal_unit_weight_one_value
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U)
    (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) :
    primePowerArithmeticCharacter p n χ 1 u=((1+p^(n+1) : ℕ) : K) := sorry

-- SuggestedPseudomeasureCharacterTests.principal_unit_weight_zero_value
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U)
    (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) :
    primePowerArithmeticCharacter p n χ 0 u=1 := sorry

-- SuggestedPseudomeasureCharacterTests.natural_identity_numerator
example : Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p) =
    intrinsicSmoothedNumerator p 1 (by exact (Fact.out : p.Prime).not_dvd_one) := sorry

-- SuggestedPseudomeasureCharacterTests.natural_arbitrary_parameter
example (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z)) :
    Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p) =
      intrinsicSmoothedNumerator p a ha := sorry

-- SuggestedPseudomeasureCharacterTests.numerator_weight_one
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n))
    (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p))
      (primePowerArithmeticCharacter p n χ 1).toContinuousMap =
      twistedSmoothedMeasure p n χ a ha 1 := sorry

-- SuggestedPseudomeasureCharacterTests.identity_character_numerator
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry

-- SuggestedPseudomeasureCharacterTests.zero_level_positive_admissible
example (χ : DirichletCharacter K (p^0)) (u : U)
    (hu : (u : Z)=((1+p : ℕ) : Z)) :
    IsUnit (primePowerArithmeticCharacter p 0 χ 1 u-1) := sorry

-- SuggestedPseudomeasureCharacterTests.identity_inadmissible
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    ¬IsUnit (primePowerArithmeticCharacter p n χ w (1 : U)-1) := sorry

-- SuggestedPseudomeasureCharacterTests.zero_weight_principal_inadmissible
example (n : ℕ) (u : U) :
    ¬IsUnit (primePowerArithmeticCharacter p n (1 : DirichletCharacter K (p^n)) 0 u-1) := sorry

-- SuggestedPseudomeasureCharacterTests.ring_map_identity_inadmissible
example (f : M →+* K) : ¬IsUnit (f (δ (1 : U)-1)) := sorry

-- SuggestedPseudomeasureCharacterTests.principal_unit_ring_map_admissible
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (f : M →+* K)
    (hf : ∀ μ : M, f μ=extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter p n χ w).toContinuousMap)
    (u : U) (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) (hw : 0<w) :
    IsUnit (f (δ u-1)) := sorry

-- SuggestedPseudomeasureCharacterTests.conditional_smoothing_independent
example (f : M →+* K) (u v : U) (hu : IsUnit (f (δ u-1))) (hv : IsUnit (f (δ v-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hu (kubotaLeopoldtPseudomeasure p) =
      Iwasawa.evalAt δ Q K v hv (kubotaLeopoldtPseudomeasure p) := sorry

end SuggestedPseudomeasureCharacterTests

end PseudomeasureCharacterComparison

namespace SuggestedPseudomeasureCharacterTests
section Three
variable {K : Type*} [NormedField K] [Algebra ℤ_[3] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[3] K]
  [CharZero K] [Algebra ℚ K]

local notation "U" => (ℤ_[3])ˣ

local notation "M" => D(U,ℤ_[3])

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit 3).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "δ" => (diracHom (G := U) (R := ℤ_[3]))

variable (χ : DirichletCharacter ℚ (3^1)) (hχ2 : χ 2 = -1)
  (hχ : DirichletCharacter.IsPrimitive (χ.ringHomComp (algebraMap ℚ K)))
  (ε : K) (hε : IsPrimitiveRoot ε (3^1))
  (hG : gaussSum (χ.ringHomComp (algebraMap ℚ K))⁻¹
    (AddChar.zmodChar (3^1) hε.pow_eq_one) ≠ 0) (hD : IsUnit (3 : K))

include hχ2 hχ hε hG hD

-- SuggestedPseudomeasureCharacterTests.conditional_quadratic_zero_value
example (f : M →+* K)
    (hf : ∀ μ : M, f μ=extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap)
    (u : U) (hu : (u : ℤ_[3])=4) (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure 3)=1/3 := sorry

-- SuggestedPseudomeasureCharacterTests.conditional_quadratic_negative_two
example (f : M →+* K)
    (hf : ∀ μ : M, f μ=extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 3).toContinuousMap)
    (u : U) (hu : (u : ℤ_[3])=4) (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure 3)= -2/9 := sorry

end Three

end SuggestedPseudomeasureCharacterTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

section IntrinsicTameZeta
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "U" => (ℤ_[p])ˣ

local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,ℤ_[p]))

def intrinsicTameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) : D(U,K) := sorry

lemma intrinsicTameZetaMeasure_eq_restrict (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD = restrictUnits p K (tameZetaMeasure η hD hpD) := sorry

lemma intrinsicTameZetaMeasure_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicTameZetaMeasure η hD hpD = 0 := sorry

lemma intrinsicTameZetaMeasure_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (ν : D(U,K))
    (hν : map uMap ν = tameZetaMeasure η hD hpD) :
    ν=intrinsicTameZetaMeasure η hD hpD := sorry

lemma map_intrinsicTameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    map uMap (intrinsicTameZetaMeasure η hD hpD) = tameZetaMeasure η hD hpD := sorry

theorem intrinsicTameZetaMeasure_character (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ w).toContinuousMap =
    tameZetaMeasure η hD hpD
      (primePowerCharacter p n χ * (⟨fun z : ℤ_[p] => (algebraMap ℤ_[p] K z)^w,
        by fun_prop⟩ : C(ℤ_[p],K))) := sorry

lemma intrinsicTameZetaMeasure_characterIntegral (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    characterIntegralAlgHom (primePowerArithmeticCharacter p n χ w)
      (intrinsicTameZetaMeasure η hD hpD) =
    tameZetaMeasure η hD hpD
      (primePowerCharacter p n χ * (⟨fun z : ℤ_[p] => (algebraMap ℤ_[p] K z)^w,
        by fun_prop⟩ : C(ℤ_[p],K))) := sorry

theorem intrinsicTameZetaMeasure_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    ‖toCLMEquiv (intrinsicTameZetaMeasure η hD hpD)‖ ≤ 1 := sorry

lemma intrinsicTameZetaMeasure_apply_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,K)) :
    ‖intrinsicTameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := sorry

variable [CharZero K] [Algebra ℚ K]

theorem intrinsicTameZetaMeasure_common_character_value
    {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D) (hη : η≠1)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (w : ℕ) (hw : 1≤w) :
    let θ : DirichletCharacter E (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let b : E := (1-θ (p : ZMod (D*p^n))*(p : E)^(w-1)) *
      (-((D*p^n : ℕ) : E)^(w-1)/w * ∑ a : ZMod (D*p^n), θ a *
        algebraMap ℚ E ((Polynomial.bernoulli w).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-(θ.ringHomComp ιC) (p : ZMod (D*p^n))*(p : ℂ)^(w-1)) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = intrinsicTameZetaMeasure (η.ringHomComp ιK) hD hpD
      (primePowerArithmeticCharacter p n (χ.ringHomComp ιK) w).toContinuousMap := sorry

end IntrinsicTameZeta

namespace SuggestedIntrinsicTameTests
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

-- SuggestedIntrinsicTameTests.arithmetic_unit_test_formula
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ w u =
      primePowerCharacter p n χ (u : ℤ_[p])*(algebraMap ℤ_[p] K (u : ℤ_[p]))^w := sorry

-- SuggestedIntrinsicTameTests.arithmetic_unit_weight_zero_formula
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ 0 u = primePowerCharacter p n χ (u : ℤ_[p]) := sorry

-- SuggestedIntrinsicTameTests.trivial_tame_level
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicTameZetaMeasure η hD hpD = 0 := sorry

-- SuggestedIntrinsicTameTests.zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD 0 = 0 := sorry

-- SuggestedIntrinsicTameTests.unique_pushforward
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (ν : D((ℤ_[p])ˣ,K))
    (hν : map (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[p])ˣ,ℤ_[p])) ν =
      tameZetaMeasure η hD hpD) : ν=intrinsicTameZetaMeasure η hD hpD := sorry

-- SuggestedIntrinsicTameTests.inclusion_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],K)) :
    intrinsicTameZetaMeasure η hD hpD
      (f.comp (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[p])ˣ,ℤ_[p]))) =
      tameZetaMeasure η hD hpD f := sorry

-- SuggestedIntrinsicTameTests.inclusion_identity_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD 1 = tameZetaMeasure η hD hpD 1 := sorry

-- SuggestedIntrinsicTameTests.zero_weight_character
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ 0).toContinuousMap =
      tameZetaMeasure η hD hpD (primePowerCharacter p n χ) := sorry

-- SuggestedIntrinsicTameTests.zero_level_zero_weight_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0).toContinuousMap =
      intrinsicTameZetaMeasure η hD hpD 1 := sorry

-- SuggestedIntrinsicTameTests.matching_coefficient_algebra_hom
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    characterIntegralAlgHom (primePowerArithmeticCharacter p n χ w) (intrinsicTameZetaMeasure η hD hpD) =
      intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

-- SuggestedIntrinsicTameTests.total_mass_bound
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    ‖intrinsicTameZetaMeasure η hD hpD 1‖ ≤ 1 := sorry

-- SuggestedIntrinsicTameTests.norm_bound_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C((ℤ_[p])ˣ,K)) : ‖intrinsicTameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := sorry

end General

section DyadicQuadratic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

include hη

-- SuggestedIntrinsicTameTests.first_unit_moment
example :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap = 2/3 := sorry

-- SuggestedIntrinsicTameTests.quadratic_product_weight_two
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter 2 2 χ 2).toContinuousMap = -2 := sorry

-- SuggestedIntrinsicTameTests.quadratic_product_weight_four
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter 2 2 χ 4).toContinuousMap = 46 := sorry

-- SuggestedIntrinsicTameTests.principal_positive_level_first
example :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter 2 1 (1 : DirichletCharacter ℚ_[2] (2^1)) 1).toContinuousMap = 2/3 := sorry

end DyadicQuadratic

end SuggestedIntrinsicTameTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

section IntegralArithmeticCharacters
variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

lemma primePowerArithmeticCharacter_norm_le (n : ℕ) (χ : DirichletCharacter K (p^n))
    (w : ℕ) (u : (ℤ_[p])ˣ) : ‖primePowerArithmeticCharacter p n χ w u‖ ≤ 1 := sorry

variable [IsUltrametricDist K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

def integralPrimePowerArithmeticCharacter (n : ℕ) (χ : DirichletCharacter K (p^n))
    (w : ℕ) : ContinuousMonoidHom (ℤ_[p])ˣ O := sorry

lemma coe_integralPrimePowerArithmeticCharacter (n : ℕ) (χ : DirichletCharacter K (p^n))
    (w : ℕ) (u : (ℤ_[p])ˣ) :
    (integralPrimePowerArithmeticCharacter p n χ w u : K) =
      primePowerArithmeticCharacter p n χ w u := sorry

lemma integralPrimePowerArithmeticCharacter_one (n : ℕ) (χ : DirichletCharacter K (p^n))
    (w : ℕ) : integralPrimePowerArithmeticCharacter p n χ w 1 = 1 := sorry

lemma integralPrimePowerArithmeticCharacter_zero_weight (n : ℕ) (χ : DirichletCharacter K (p^n))
    (u : (ℤ_[p])ˣ) :
    (integralPrimePowerArithmeticCharacter p n χ 0 u : K) =
      primePowerCharacter p n χ (u : ℤ_[p]) := sorry

lemma integralPrimePowerArithmeticCharacter_neg_one (n : ℕ) (χ : DirichletCharacter K (p^n))
    (w : ℕ) :
    (integralPrimePowerArithmeticCharacter p n χ w (-1) : K) = χ (-1)*(-1 : K)^w := sorry

end IntegralArithmeticCharacters

section IntrinsicIntegralTame
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,ℤ_[p]))

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

def intrinsicIntegralTameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) : D(U,O) := sorry

lemma intrinsicIntegralTameZetaMeasure_eq_restrict (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicIntegralTameZetaMeasure η hD hpD =
      restrictUnits p O (integralTameZetaMeasure η hD hpD) := sorry

lemma intrinsicIntegralTameZetaMeasure_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicIntegralTameZetaMeasure η hD hpD = 0 := sorry

lemma intrinsicIntegralTameZetaMeasure_unique (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (ν : D(U,O))
    (hν : map uMap ν=integralTameZetaMeasure η hD hpD) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry

lemma map_intrinsicIntegralTameZetaMeasure (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    map uMap (intrinsicIntegralTameZetaMeasure η hD hpD) =
      integralTameZetaMeasure η hD hpD := sorry

theorem coe_intrinsicIntegralTameZetaMeasure_apply (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) :
    (intrinsicIntegralTameZetaMeasure η hD hpD f : K) =
      intrinsicTameZetaMeasure η hD hpD ((iMap).comp f) := sorry

lemma intrinsicIntegralTameZetaMeasure_bound (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) :
    ‖intrinsicIntegralTameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := sorry

lemma intrinsicIntegralTameZetaMeasure_unique_coefficient (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (ν : D(U,O))
    (hν : ∀ f : C(U,O), (ν f : K)=intrinsicTameZetaMeasure η hD hpD ((iMap).comp f)) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry

theorem intrinsicIntegralTameZetaMeasure_character (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap : K) =
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

variable [CharZero K] [Algebra ℚ K]

theorem intrinsicIntegralTameZetaMeasure_common_character_value
    {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D) (hη : η≠1)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (w : ℕ) (hw : 1≤w) :
    let θ : DirichletCharacter E (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let b : E := (1-θ (p : ZMod (D*p^n))*(p : E)^(w-1)) *
      (-((D*p^n : ℕ) : E)^(w-1)/w * ∑ a : ZMod (D*p^n), θ a *
        algebraMap ℚ E ((Polynomial.bernoulli w).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-(θ.ringHomComp ιC) (p : ZMod (D*p^n))*(p : ℂ)^(w-1)) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (1-(w : ℂ)) ∧
    ιK b = (intrinsicIntegralTameZetaMeasure (η.ringHomComp ιK) hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ.ringHomComp ιK) w).toContinuousMap : K) := sorry

end IntrinsicIntegralTame

namespace SuggestedIntegralUnitTests
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,ℤ_[p]))

local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

-- SuggestedIntegralUnitTests.norm_zero_weight
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    ‖primePowerArithmeticCharacter p n χ 0 u‖ ≤ 1 := sorry

-- SuggestedIntegralUnitTests.norm_all_positive_weights
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    ‖primePowerArithmeticCharacter p n χ (w+1) u‖ ≤ 1 := sorry

-- SuggestedIntegralUnitTests.integral_character_identity
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    integralPrimePowerArithmeticCharacter p n χ w 1 = 1 := sorry

-- SuggestedIntegralUnitTests.integral_character_trivial_boundary
example : integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0 = 1 := sorry

-- SuggestedIntegralUnitTests.integral_character_coefficient
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    (integralPrimePowerArithmeticCharacter p n χ w u : K) =
      primePowerArithmeticCharacter p n χ w u := sorry

-- SuggestedIntegralUnitTests.integral_character_principal_sign
example : (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1 (-1) : K) = -1 := sorry

-- SuggestedIntegralUnitTests.integral_tame_modulus_one
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicIntegralTameZetaMeasure η hD hpD = 0 := sorry

-- SuggestedIntegralUnitTests.integral_zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicIntegralTameZetaMeasure η hD hpD 0 = 0 := sorry

-- SuggestedIntegralUnitTests.integral_unique_ambient
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (ν : D(U,O)) (hν : map uMap ν=integralTameZetaMeasure η hD hpD) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry

-- SuggestedIntegralUnitTests.integral_inclusion_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(ℤ_[p],O)) :
    intrinsicIntegralTameZetaMeasure η hD hpD (f.comp uMap) =
      integralTameZetaMeasure η hD hpD f := sorry

-- SuggestedIntegralUnitTests.integral_inclusion_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicIntegralTameZetaMeasure η hD hpD 1=integralTameZetaMeasure η hD hpD 1 := sorry

-- SuggestedIntegralUnitTests.coefficient_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) :
    (intrinsicIntegralTameZetaMeasure η hD hpD f : K) =
      intrinsicTameZetaMeasure η hD hpD ((iMap).comp f) := sorry

-- SuggestedIntegralUnitTests.integral_mass_norm
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    ‖intrinsicIntegralTameZetaMeasure η hD hpD 1‖ ≤ 1 := sorry

-- SuggestedIntegralUnitTests.coefficient_unique_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (ν : D(U,O))
    (hν : ∀ f : C(U,O), (ν f : K)=intrinsicTameZetaMeasure η hD hpD ((iMap).comp f)) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry

-- SuggestedIntegralUnitTests.integral_character_zero_weight
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap : K) =
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedIntegralUnitTests.integral_character_total_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0).toContinuousMap : K) =
      intrinsicTameZetaMeasure η hD hpD 1 := sorry

-- SuggestedIntegralUnitTests.integral_character_value_mem_integer
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ w).toContinuousMap ∈
      Valuation.integer (NormedField.valuation (K := K)) := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

include hη

-- SuggestedIntegralUnitTests.integral_common_first_value
example : (intrinsicIntegralTameZetaMeasure η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap :
      ℚ_[2]) = 2/3 := sorry

-- SuggestedIntegralUnitTests.integral_common_twisted_value
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 2).toContinuousMap : ℚ_[2]) = -2 := sorry

end Dyadic

end SuggestedIntegralUnitTests

end

end DirichletPadic

namespace SuggestedEisensteinAwayTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "M" => D(U,Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }

local notation "Q" => FractionRing M

local notation "d" => (fun a : U => 2*eisensteinTwistedDenominator p a)

local notation "S" => (fun a : U => Localization.Away (d a))

-- SuggestedEisensteinAwayTests.zero_level_coordinate_character
example (k : ℕ) (u : U) :
    primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k u = (u : Z)^k := sorry

end SuggestedEisensteinAwayTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem integralPrimePowerArithmeticCharacter_weight_congruence
    (t r e e' : ℕ) (χ : DirichletCharacter K (p^t)) (hr : 1≤r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') (u : U) :
    (p : O)^r ∣ integralPrimePowerArithmeticCharacter p t χ e' u-
      integralPrimePowerArithmeticCharacter p t χ e u := sorry

variable [CompleteSpace K] {D : ℕ} [NeZero D]

end

end DirichletPadic

namespace SuggestedTameCongruenceTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

local notation "q4" => (ContinuousMap.mk (fun u : U2 => PadicInt.toZModPow 2 (u : ℤ_[2]))
  (Continuous.comp (PadicInt.continuous_toZModPow 2 2) Units.continuous_val) : C(U2,ZMod (2^2)))

local notation "f4" => ContinuousMap.comp (ContinuousMap.equivFnOfDiscrete.symm
  (Function.update (fun _ : ZMod (2^2) => (0 : O2)) 1 1)) q4

-- SuggestedTameCongruenceTests.wild_level_above_precision
example (χ : DirichletCharacter ℚ_[2] (2^3)) (u : U2) :
    (2 : O2)∣integralPrimePowerArithmeticCharacter 2 3 χ 1 u-
      integralPrimePowerArithmeticCharacter 2 3 χ 0 u := sorry

-- SuggestedTameCongruenceTests.dyadic_pointwise_eight
example (χ : DirichletCharacter ℚ_[2] (2^2)) (u : U2) :
    (8 : O2)∣integralPrimePowerArithmeticCharacter 2 2 χ 5 u-
      integralPrimePowerArithmeticCharacter 2 2 χ 1 u := sorry

variable (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)

end Dyadic

-- SuggestedTameCongruenceTests.missing_totient_factor
example : letI : Fact (Nat.Prime 5) := ⟨by decide⟩
    ¬ (5 : ℤ_[5])∣(2 : ℤ_[5])^1-(2 : ℤ_[5])^0 := sorry

end

end SuggestedTameCongruenceTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] [CharZero K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem tameMeasure_residue_shift (η : DirichletCharacter K D) (hη : η≠1)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (n : ℕ) (a b : ZMod (p^n))
    (hab : (b.val : ZMod D)=(a.val+p^n : ZMod D)) :
    let q : C(ℤ_[p],ZMod (p^n)) :=
      ⟨PadicInt.toZModPow n,PadicInt.continuous_toZModPow p n⟩
    AbstractMeasure.finiteProjection q (tameMeasure η hD hpD) b-
      AbstractMeasure.finiteProjection q (tameMeasure η hD hpD) a=
      -η (a.val : ZMod D) := sorry

end

end DirichletPadic

namespace SuggestedTameScalarTests
noncomputable section
open DirichletPadic AbstractMeasure

open scoped PowerSeries.WithPiTopology

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

-- SuggestedTameScalarTests.dyadic_residue_shift
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    let q : C(ℤ_[2],ZMod (2^3)) := ⟨PadicInt.toZModPow 3,PadicInt.continuous_toZModPow 2 3⟩
    finiteProjection q (tameMeasure η hD hpD) 3-
      finiteProjection q (tameMeasure η hD hpD) 1=-1 := sorry

-- SuggestedTameScalarTests.adding_quotient_is_not_shift
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    let q : C(ℤ_[2],ZMod (2^3)) := ⟨PadicInt.toZModPow 3,PadicInt.continuous_toZModPow 2 3⟩
    finiteProjection q (tameMeasure η hD hpD) (1+2^3)-
      finiteProjection q (tameMeasure η hD hpD) 1≠(-1 : ℚ_[2]) := sorry

end Dyadic

section Triadic
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]

-- SuggestedTameScalarTests.triadic_residue_shift
example (η : DirichletCharacter ℚ_[3] 4) (hη : η 3=-1)
    (hD : IsUnit (4 : ℚ_[3])) (hpD : ¬3∣4) :
    let q : C(ℤ_[3],ZMod (3^2)) := ⟨PadicInt.toZModPow 2,PadicInt.continuous_toZModPow 3 2⟩
    finiteProjection q (tameMeasure η hD hpD) 2-
      finiteProjection q (tameMeasure η hD hpD) 1=-1 := sorry

end Triadic

end

end SuggestedTameScalarTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

section Coefficients
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  {D : ℕ} [NeZero D]

theorem tameSeries_coeff_sub_norm_le (η0 η1 : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (B : ℝ) (hB : 0≤B)
    (hη : ∀ a, ‖η0 a-η1 a‖≤B) (n : ℕ) :
    ‖PowerSeries.coeff n (tameSeries η0 hD)-
      PowerSeries.coeff n (tameSeries η1 hD)‖≤B := sorry

end Coefficients

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem tameMeasure_sub_norm_le (η0 η1 : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (B : ℝ) (hB : 0≤B)
    (hη : ∀ a, ‖η0 a-η1 a‖≤B) :
    ‖AbstractMeasure.toCLMEquiv (tameMeasure η0 hD hpD-tameMeasure η1 hD hpD)‖≤B := sorry

end

end DirichletPadic

namespace SuggestedTameVariationTests
noncomputable section
open DirichletPadic AbstractMeasure

open scoped PowerSeries.WithPiTopology

section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

variable (η0 η1 : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)

-- SuggestedTameVariationTests.coefficient_self
example (n : ℕ) : ‖PowerSeries.coeff n (tameSeries η0 hD)-
    PowerSeries.coeff n (tameSeries η0 hD)‖=0 := sorry

-- SuggestedTameVariationTests.coefficient_level_one
example (χ0 χ1 : DirichletCharacter K 1) (h1 : IsUnit ((1 : ℕ) : K)) (n : ℕ) :
    PowerSeries.coeff n (tameSeries χ0 h1)-PowerSeries.coeff n (tameSeries χ1 h1)=0 := sorry

-- SuggestedTameVariationTests.measure_self
example : ‖toCLMEquiv (tameMeasure η0 hD hpD-tameMeasure η0 hD hpD)‖=0 := sorry

-- SuggestedTameVariationTests.measure_evaluation
example (B : ℝ) (hB : 0≤B) (hη : ∀ a, ‖η0 a-η1 a‖≤B) (f : C(ℤ_[p],K)) :
    ‖tameMeasure η0 hD hpD f-tameMeasure η1 hD hpD f‖≤B*‖f‖ := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

local notation "U2" => (ℤ_[2])ˣ

-- SuggestedTameVariationTests.principal_three_coefficient_bound
example (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (n : ℕ) :
    ‖PowerSeries.coeff n (tameSeries (1 : DirichletCharacter ℚ_[2] 3) hD)-
      PowerSeries.coeff n (tameSeries χ hD)‖≤1/2 := sorry

end Dyadic

end

end SuggestedTameVariationTests

namespace DirichletPadic
noncomputable section
open scoped PowerSeries.WithPiTopology

section Reference
variable {K : Type*} [NormedField K] [CharZero K]
  [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K] {D : ℕ} [NeZero D]

theorem exists_dyadic_tame_quadratic_reference (hD : D≠1) (hodd : ¬2∣D) :
    ∃ χ : DirichletCharacter K D, χ≠1 ∧ χ.IsQuadratic ∧
      ∀ a, ‖(1 : DirichletCharacter K D) a-χ a‖≤1/2 := sorry

end Reference

end

end DirichletPadic

namespace SuggestedDyadicClassificationTests
noncomputable section
open DirichletPadic

open scoped PowerSeries.WithPiTopology

section Reference
variable {K : Type*} [NormedField K] [CharZero K]
  [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K]

-- SuggestedDyadicClassificationTests.reference_nine
example : ∃ χ : DirichletCharacter K 9, χ≠1 ∧ χ.IsQuadratic ∧
    ∀ a, ‖(1 : DirichletCharacter K 9) a-χ a‖≤1/2 := sorry

-- SuggestedDyadicClassificationTests.reference_fifteen
example : ∃ χ : DirichletCharacter K 15, χ≠1 ∧ χ.IsQuadratic ∧
    ∀ a, ‖(1 : DirichletCharacter K 15) a-χ a‖≤1/2 := sorry

-- SuggestedDyadicClassificationTests.no_reference_one
example : ¬∃ χ : DirichletCharacter K 1, χ≠1 := sorry

end Reference

end

end SuggestedDyadicClassificationTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure

open AbstractMeasure

section IntegralUnitCharacterRelations
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

lemma integralPrimePowerArithmeticCharacter_changeLevel
    (n m : ℕ) (h : n≤m) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    integralPrimePowerArithmeticCharacter p m (χ.changeLevel (pow_dvd_pow p h)) w =
      integralPrimePowerArithmeticCharacter p n χ w := sorry

lemma integralPrimePowerArithmeticCharacter_mul
    (n : ℕ) (χ ψ : DirichletCharacter K (p^n)) (e f : ℕ) :
    integralPrimePowerArithmeticCharacter p n (χ*ψ) (e+f) =
      integralPrimePowerArithmeticCharacter p n χ e *
        integralPrimePowerArithmeticCharacter p n ψ f := sorry

end IntegralUnitCharacterRelations

section IntegralUnitTwist
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem restrictUnits_integralTwistedTameZetaMeasure
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD) =
      weight (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap
        (intrinsicIntegralTameZetaMeasure η hD hpD) := sorry

theorem restrictUnits_integralTwistedTameZetaMeasure_character
    (n : ℕ) (χ ψ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (w : ℕ) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD)
      (integralPrimePowerArithmeticCharacter p n ψ w).toContinuousMap =
    intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ*ψ) w).toContinuousMap := sorry

theorem inverse_weight_restrictUnits_integralTwistedTameZetaMeasure
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    weight (integralPrimePowerArithmeticCharacter p n χ⁻¹ 0).toContinuousMap
      (restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD)) =
        intrinsicIntegralTameZetaMeasure η hD hpD := sorry

end IntegralUnitTwist

namespace SuggestedIntegralUnitTwistTests
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

-- SuggestedIntegralUnitTwistTests.level_zero_to_positive
example (m w : ℕ) :
    integralPrimePowerArithmeticCharacter p m (1 : DirichletCharacter K (p^m)) w =
      integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) w := sorry

-- SuggestedIntegralUnitTwistTests.product_zero_weight
example (n w : ℕ) (χ ψ : DirichletCharacter K (p^n)) :
    integralPrimePowerArithmeticCharacter p n χ 0 *
      integralPrimePowerArithmeticCharacter p n ψ w =
        integralPrimePowerArithmeticCharacter p n (χ*ψ) w := sorry

-- SuggestedIntegralUnitTwistTests.product_positive_weights
example (n : ℕ) (χ ψ : DirichletCharacter K (p^n)) :
    integralPrimePowerArithmeticCharacter p n χ 1 *
      integralPrimePowerArithmeticCharacter p n ψ 2 =
        integralPrimePowerArithmeticCharacter p n (χ*ψ) 3 := sorry

-- SuggestedIntegralUnitTwistTests.restriction_all_tests
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,O)) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD) f =
      intrinsicIntegralTameZetaMeasure η hD hpD
        ((integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap*f) := sorry

-- SuggestedIntegralUnitTwistTests.restriction_principal
example (n : ℕ) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    restrictUnits p O (integralTwistedTameZetaMeasure n
      (1 : DirichletCharacter K (p^n)) η hD hpD) =
        intrinsicIntegralTameZetaMeasure η hD hpD := sorry

-- SuggestedIntegralUnitTwistTests.restriction_modulus_one
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD)=0 := sorry

-- SuggestedIntegralUnitTwistTests.moment_zero_weight
example (n : ℕ) (χ ψ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD)
      (integralPrimePowerArithmeticCharacter p n ψ 0).toContinuousMap =
    intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ*ψ) 0).toContinuousMap := sorry

-- SuggestedIntegralUnitTwistTests.inverse_all_tests
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,O)) :
    restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD)
      ((integralPrimePowerArithmeticCharacter p n χ⁻¹ 0).toContinuousMap*f) =
        intrinsicIntegralTameZetaMeasure η hD hpD f := sorry

-- SuggestedIntegralUnitTwistTests.inverse_after_level_raise
example (n m : ℕ) (h : n≤m) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    weight (integralPrimePowerArithmeticCharacter p n χ⁻¹ 0).toContinuousMap
      (restrictUnits p O (integralTwistedTameZetaMeasure m
        (χ.changeLevel (pow_dvd_pow p h)) η hD hpD)) =
      intrinsicIntegralTameZetaMeasure η hD hpD := sorry

end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedIntegralUnitTwistTests.ambient_zero_boundary
example : primePowerCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 0 ≠
    primePowerCharacter 2 2 (1 : DirichletCharacter ℚ_[2] (2^2)) 0 := sorry

-- SuggestedIntegralUnitTwistTests.quadratic_second_moment
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1)
    (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    (restrictUnits 2 O2 (integralTwistedTameZetaMeasure 2 χ η hD hpD)
      (integralPrimePowerArithmeticCharacter 2 2
        (1 : DirichletCharacter ℚ_[2] (2^2)) 2).toContinuousMap : ℚ_[2]) = -2 := sorry

-- SuggestedIntegralUnitTwistTests.quadratic_fourth_moment
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1)
    (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3) :
    (restrictUnits 2 O2 (integralTwistedTameZetaMeasure 2 χ η hD hpD)
      (integralPrimePowerArithmeticCharacter 2 2
        (1 : DirichletCharacter ℚ_[2] (2^2)) 4).toContinuousMap : ℚ_[2]) = 46 := sorry

end Dyadic

end SuggestedIntegralUnitTwistTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "U" => (ℤ_[p])ˣ

theorem intrinsicIntegralTameZetaMeasure_test_congruence
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    b∣intrinsicIntegralTameZetaMeasure η hD hpD g-
      intrinsicIntegralTameZetaMeasure η hD hpD f := sorry

theorem intrinsicIntegralTameZetaMeasure_weight_congruence
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (t r e e' : ℕ) (χ : DirichletCharacter K (p^t)) (hr : 1≤r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    (p : O)^r∣intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p t χ e').toContinuousMap-
      intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

theorem intrinsicIntegralTameZetaMeasure_finite_character_congruence
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    {I : Type*} [Fintype I] (n w : I → ℕ)
    (χ : ∀ i, DirichletCharacter K (p^(n i))) (c : I → O) (b : O)
    (h : ∀ u : U, b∣∑ i, c i*integralPrimePowerArithmeticCharacter p (n i) (χ i) (w i) u) :
    b∣∑ i, c i*intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p (n i) (χ i) (w i)).toContinuousMap := sorry

theorem restrictUnits_integralTwistedTameZetaMeasure_test_congruence
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    b∣restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD) g-
      restrictUnits p O (integralTwistedTameZetaMeasure n χ η hD hpD) f := sorry

namespace SuggestedIntegralUnitCongruenceTests
-- SuggestedIntegralUnitCongruenceTests.zero_ideal_exact_relation
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (h : ∀ u, (0 : O)∣g u-f u) :
    intrinsicIntegralTameZetaMeasure η hD hpD g=
      intrinsicIntegralTameZetaMeasure η hD hpD f := sorry

-- SuggestedIntegralUnitCongruenceTests.integral_test_perturbation
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (b : O) :
    b∣intrinsicIntegralTameZetaMeasure η hD hpD (f+b • g)-
      intrinsicIntegralTameZetaMeasure η hD hpD f := sorry

-- SuggestedIntegralUnitCongruenceTests.finite_family_kernel
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    {I : Type*} [Fintype I] (n w : I → ℕ)
    (χ : ∀ i, DirichletCharacter K (p^(n i))) (c : I → O)
    (h : ∀ u : U, ∑ i, c i*integralPrimePowerArithmeticCharacter p (n i) (χ i) (w i) u=0) :
    ∑ i, c i*intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p (n i) (χ i) (w i)).toContinuousMap=0 := sorry

-- SuggestedIntegralUnitCongruenceTests.empty_family
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (c : Fin 0 → O) (b : O) :
    b∣∑ i : Fin 0, c i*intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0).toContinuousMap := sorry

-- SuggestedIntegralUnitCongruenceTests.mixed_levels_at_zero_weight
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n m : ℕ) (χ : DirichletCharacter K (p^n)) (ψ : DirichletCharacter K (p^m))
    (c d b : O) (h : ∀ u : U, b∣c*integralPrimePowerArithmeticCharacter p n χ 0 u+
      d*integralPrimePowerArithmeticCharacter p m ψ 0 u) :
    b∣c*intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap+
      d*intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p m ψ 0).toContinuousMap := sorry

-- SuggestedIntegralUnitCongruenceTests.principal_zero_level_twist
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f g : C(U,O)) (b : O) (h : ∀ u, b∣g u-f u) :
    b∣restrictUnits p O (integralTwistedTameZetaMeasure 0
      (1 : DirichletCharacter K (p^0)) η hD hpD) g-
      restrictUnits p O (integralTwistedTameZetaMeasure 0
      (1 : DirichletCharacter K (p^0)) η hD hpD) f := sorry

-- SuggestedIntegralUnitCongruenceTests.twisted_arithmetic_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n e e' : ℕ) (χ ψ : DirichletCharacter K (p^n)) (b : O)
    (h : ∀ u : U, b∣integralPrimePowerArithmeticCharacter p n ψ e' u-
      integralPrimePowerArithmeticCharacter p n ψ e u) :
    b∣intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ*ψ) e').toContinuousMap-
      intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ*ψ) e).toContinuousMap := sorry

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]

local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))

-- SuggestedIntegralUnitCongruenceTests.wild_level_above_precision
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)
    (χ : DirichletCharacter ℚ_[2] (2^3)) :
    (2 : O2)∣intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 3 χ 1).toContinuousMap-
      intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 3 χ 0).toContinuousMap := sorry

-- SuggestedIntegralUnitCongruenceTests.dyadic_weight_period
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)
    (χ : DirichletCharacter ℚ_[2] (2^2)) :
    (2 : O2)^3∣intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 5).toContinuousMap-
      intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap := sorry

end Dyadic

section Quintic
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

variable [IsBoundedSMul ℤ_[5] ℚ_[5]]

local notation "O5" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))

-- SuggestedIntegralUnitCongruenceTests.missing_totient_factor_changes_values
example (η : DirichletCharacter ℚ_[5] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : ℚ_[5])) (hpD : ¬5∣3) :
    ¬(5 : O5)∣intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 2).toContinuousMap-
      intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 1).toContinuousMap := sorry

end Quintic

end SuggestedIntegralUnitCongruenceTests

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure

variable {p : ℕ} [Fact p.Prime] {K L : Type*} [NormedField K] [NormedField L]
  [Algebra ℤ_[p] K] [Algebra ℤ_[p] L]
  [IsBoundedSMul ℤ_[p] K] [IsBoundedSMul ℤ_[p] L]
  [IsUltrametricDist K] [IsUltrametricDist L]
  [CompleteSpace K] [CompleteSpace L]
  [Algebra K L] [ContinuousSMul K L] [IsScalarTower ℤ_[p] K L]
  {D : ℕ} [NeZero D]

local notation "iMap" => (ContinuousMap.mk (algebraMap K L) (continuous_algebraMap K L) : C(K,L))

theorem algebraMap_tameMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],K)) :
    algebraMap K L (tameMeasure η hDK hpD f) =
      tameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((iMap).comp f) := sorry

namespace SuggestedTameFieldComparisonTests
-- SuggestedTameFieldComparisonTests.mass_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) :
    algebraMap K L (tameMeasure η hDK hpD 1) =
      tameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD 1 := sorry

-- SuggestedTameFieldComparisonTests.mahler_test_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) (n : ℕ) :
    algebraMap K L (tameMeasure η hDK hpD
      ((mahler n : C(ℤ_[p],ℤ_[p])) • (1 : C(ℤ_[p],K)))) =
      tameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD
      ((mahler n : C(ℤ_[p],ℤ_[p])) • (1 : C(ℤ_[p],L))) := sorry

-- SuggestedTameFieldComparisonTests.modulus_one_after_extension
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(ℤ_[p],K)) :
    algebraMap K L (tameMeasure η hDK hpD f)=0 ∧
      tameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((iMap).comp f)=0 := sorry

end SuggestedTameFieldComparisonTests

end

end DirichletPadic

namespace SuggestedTameFieldComparisonTests
open DirichletPadic

noncomputable section
variable {L : Type*} [NormedField L] [IsUltrametricDist L] [CompleteSpace L]
  [Algebra ℤ_[2] L] [IsBoundedSMul ℤ_[2] L] [IsBoundedSMul ℤ_[2] ℚ_[2]]
  [Algebra ℚ_[2] L] [ContinuousSMul ℚ_[2] L] [IsScalarTower ℤ_[2] ℚ_[2] L]

-- SuggestedTameFieldComparisonTests.dyadic_quadratic_mass_in_extension
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : L)) (hpD : ¬2∣3) :
    tameMeasure (η.ringHomComp (algebraMap ℚ_[2] L)) hD hpD 1=1/3 := sorry

-- SuggestedTameFieldComparisonTests.dyadic_quadratic_second_mahler_in_extension
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : L)) (hpD : ¬2∣3) :
    tameMeasure (η.ringHomComp (algebraMap ℚ_[2] L)) hD hpD
      ((mahler 2 : C(ℤ_[2],ℤ_[2])) • (1 : C(ℤ_[2],L))) = -1/9 := sorry

end

end SuggestedTameFieldComparisonTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure

variable {p : ℕ} [Fact p.Prime] {K L : Type*}
  [NontriviallyNormedField K] [NontriviallyNormedField L]
  [Algebra ℤ_[p] K] [Algebra ℤ_[p] L]
  [IsBoundedSMul ℤ_[p] K] [IsBoundedSMul ℤ_[p] L]
  [IsUltrametricDist K] [IsUltrametricDist L]
  [CompleteSpace K] [CompleteSpace L]
  [Algebra K L] [ContinuousSMul K L] [IsScalarTower ℤ_[p] K L]
  {D : ℕ} [NeZero D]

local notation "U" => (ℤ_[p])ˣ

local notation "iMap" => (ContinuousMap.mk (algebraMap K L) (continuous_algebraMap K L) : C(K,L))

theorem algebraMap_tameZetaMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],K)) :
    algebraMap K L (tameZetaMeasure η hDK hpD f) =
      tameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((iMap).comp f) := sorry

theorem algebraMap_intrinsicTameZetaMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(U,K)) :
    algebraMap K L (intrinsicTameZetaMeasure η hDK hpD f) =
      intrinsicTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD
        ((iMap).comp f) := sorry

namespace SuggestedTameZetaFieldComparisonTests
-- SuggestedTameZetaFieldComparisonTests.ambient_mass_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) :
    algebraMap K L (tameZetaMeasure η hDK hpD 1) =
      tameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD 1 := sorry

-- SuggestedTameZetaFieldComparisonTests.positive_moment_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) (k : ℕ) :
    algebraMap K L (tameZetaMeasure η hDK hpD
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K))) =
      tameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] L x)^(k+1), by fun_prop⟩ : C(ℤ_[p],L)) := sorry

-- SuggestedTameZetaFieldComparisonTests.ambient_modulus_one_zero
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(ℤ_[p],K)) :
    algebraMap K L (tameZetaMeasure η hDK hpD f)=0 ∧
      tameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((iMap).comp f)=0 := sorry

-- SuggestedTameZetaFieldComparisonTests.inverse_stays_zero_on_nonunits
example (x : ℤ_[p]) (hx : ¬IsUnit x) :
    algebraMap K L (algebraMap ℤ_[p] K (PadicInt.inv x))=0 ∧
      algebraMap ℤ_[p] L (PadicInt.inv x)=0 := sorry

-- SuggestedTameZetaFieldComparisonTests.intrinsic_mass_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) :
    algebraMap K L (intrinsicTameZetaMeasure η hDK hpD 1) =
      intrinsicTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD 1 := sorry

-- SuggestedTameZetaFieldComparisonTests.intrinsic_arithmetic_character_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    algebraMap K L (intrinsicTameZetaMeasure η hDK hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap) =
      intrinsicTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD
        (primePowerArithmeticCharacter p n (χ.ringHomComp (algebraMap K L)) w).toContinuousMap := sorry

-- SuggestedTameZetaFieldComparisonTests.intrinsic_modulus_one_zero
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(U,K)) :
    algebraMap K L (intrinsicTameZetaMeasure η hDK hpD f)=0 ∧
      intrinsicTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((iMap).comp f)=0 := sorry

end SuggestedTameZetaFieldComparisonTests

end

end DirichletPadic

namespace SuggestedTameZetaFieldComparisonTests
open DirichletPadic

noncomputable section
variable {L : Type*} [NontriviallyNormedField L] [IsUltrametricDist L] [CompleteSpace L]
  [Algebra ℤ_[2] L] [IsBoundedSMul ℤ_[2] L] [IsBoundedSMul ℤ_[2] ℚ_[2]]
  [Algebra ℚ_[2] L] [ContinuousSMul ℚ_[2] L] [IsScalarTower ℤ_[2] ℚ_[2] L]

-- SuggestedTameZetaFieldComparisonTests.dyadic_intrinsic_first_moment_in_extension
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : L)) (hpD : ¬2∣3) :
    intrinsicTameZetaMeasure (η.ringHomComp (algebraMap ℚ_[2] L)) hD hpD
      (primePowerArithmeticCharacter 2 0 (1 : DirichletCharacter L (2^0)) 1).toContinuousMap = 2/3 := sorry

end

end SuggestedTameZetaFieldComparisonTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure

section IntegralCharacterFieldComparison
variable {p : ℕ} [Fact p.Prime] {K L : Type*} [NormedField K] [NormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L]
  [Algebra ℤ_[p] K] [Algebra ℤ_[p] L]
  [IsBoundedSMul ℤ_[p] K] [IsBoundedSMul ℤ_[p] L]
  [Algebra K L] [IsScalarTower ℤ_[p] K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

lemma algebraMap_integralPrimePowerArithmeticCharacter
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    algebraMap OK OL (integralPrimePowerArithmeticCharacter p n χ w u) =
      integralPrimePowerArithmeticCharacter p n (χ.ringHomComp (algebraMap K L)) w u := sorry

namespace SuggestedTameIntegralFieldComparisonTests
-- SuggestedTameIntegralFieldComparisonTests.trivial_arithmetic_character_transport
example (u : (ℤ_[p])ˣ) :
    algebraMap OK OL
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0 u)=1 := sorry

-- SuggestedTameIntegralFieldComparisonTests.arithmetic_sign_after_extension
example : algebraMap OK OL
    (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1 (-1))=-1 := sorry

end SuggestedTameIntegralFieldComparisonTests

end IntegralCharacterFieldComparison

section IntegralMeasureFieldComparison
variable {p : ℕ} [Fact p.Prime] {K L : Type*}
  [NontriviallyNormedField K] [NontriviallyNormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L]
  [Algebra ℤ_[p] K] [Algebra ℤ_[p] L]
  [IsBoundedSMul ℤ_[p] K] [IsBoundedSMul ℤ_[p] L]
  [CompleteSpace K] [CompleteSpace L]
  [Algebra K L] [ContinuousSMul K L] [IsScalarTower ℤ_[p] K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  {D : ℕ} [NeZero D]

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "OL" => Valuation.integer (NormedField.valuation (K := L))

local notation "U" => (ℤ_[p])ˣ

local notation "jMap" => (ContinuousMap.mk (algebraMap OK OL)
  (Continuous.subtype_mk (Continuous.comp (continuous_algebraMap K L) continuous_subtype_val) _) : C(OK,OL))

theorem algebraMap_integralTameMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],OK)) :
    algebraMap OK OL (integralTameMeasure η hDK hpD f) =
      integralTameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) := sorry

theorem algebraMap_integralTameZetaMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],OK)) :
    algebraMap OK OL (integralTameZetaMeasure η hDK hpD f) =
      integralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) := sorry

theorem algebraMap_intrinsicIntegralTameZetaMeasure_apply (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f : C(U,OK)) :
    algebraMap OK OL (intrinsicIntegralTameZetaMeasure η hDK hpD f) =
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) := sorry

theorem intrinsicIntegralTameZetaMeasure_baseChange_dvd_iff (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f g : C(U,OK)) (b : OK) :
    algebraMap OK OL b∣
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp g)-
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) ↔
    b∣intrinsicIntegralTameZetaMeasure η hDK hpD g-intrinsicIntegralTameZetaMeasure η hDK hpD f := sorry

namespace SuggestedTameIntegralFieldComparisonTests
-- SuggestedTameIntegralFieldComparisonTests.integral_tame_mass_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) :
    algebraMap OK OL (integralTameMeasure η hDK hpD 1) =
      integralTameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD 1 := sorry

-- SuggestedTameIntegralFieldComparisonTests.integral_tame_modulus_one
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(ℤ_[p],OK)) :
    algebraMap OK OL (integralTameMeasure η hDK hpD f)=0 ∧
      integralTameMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f)=0 := sorry

-- SuggestedTameIntegralFieldComparisonTests.integral_zeta_mass_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) :
    algebraMap OK OL (integralTameZetaMeasure η hDK hpD 1) =
      integralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD 1 := sorry

-- SuggestedTameIntegralFieldComparisonTests.integral_zeta_modulus_one
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(ℤ_[p],OK)) :
    algebraMap OK OL (integralTameZetaMeasure η hDK hpD f)=0 ∧
      integralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f)=0 := sorry

-- SuggestedTameIntegralFieldComparisonTests.integral_arithmetic_moment_transport
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    algebraMap OK OL (intrinsicIntegralTameZetaMeasure η hDK hpD
      (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap) =
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD
        (integralPrimePowerArithmeticCharacter p n (χ.ringHomComp (algebraMap K L)) w).toContinuousMap := sorry

-- SuggestedTameIntegralFieldComparisonTests.intrinsic_integral_modulus_one
example (η : DirichletCharacter K 1)
    (hDK : IsUnit ((1 : ℕ) : K)) (hDL : IsUnit ((1 : ℕ) : L)) (hpD : ¬p∣1)
    (f : C(U,OK)) :
    algebraMap OK OL (intrinsicIntegralTameZetaMeasure η hDK hpD f)=0 ∧
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f)=0 := sorry

-- SuggestedTameIntegralFieldComparisonTests.zero_ideal_reflects_equality
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D) (f g : C(U,OK)) :
    intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp g)=
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) ↔
    intrinsicIntegralTameZetaMeasure η hDK hpD g=intrinsicIntegralTameZetaMeasure η hDK hpD f := sorry

-- SuggestedTameIntegralFieldComparisonTests.same_rational_prime_precision
example (η : DirichletCharacter K D)
    (hDK : IsUnit (D : K)) (hDL : IsUnit (D : L)) (hpD : ¬p∣D)
    (f g : C(U,OK)) (r : ℕ) :
    (p : OL)^r∣intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp g)-
      intrinsicIntegralTameZetaMeasure (η.ringHomComp (algebraMap K L)) hDL hpD ((jMap).comp f) ↔
    (p : OK)^r∣intrinsicIntegralTameZetaMeasure η hDK hpD g-intrinsicIntegralTameZetaMeasure η hDK hpD f := sorry

end SuggestedTameIntegralFieldComparisonTests

end IntegralMeasureFieldComparison

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
section CharacterFieldAlgebraic
variable (p : ℕ) [Fact p.Prime] {K : Type*} [Field K] [Algebra ℚ_[p] K]
  {D : ℕ} [NeZero D]

def tameCharacterField (η : DirichletCharacter K D) : IntermediateField ℚ_[p] K :=
  IntermediateField.adjoin ℚ_[p] (Set.range η)

lemma tameCharacterField_eq_adjoin (η : DirichletCharacter K D) :
    tameCharacterField p η=IntermediateField.adjoin ℚ_[p] (Set.range η) := sorry

lemma tameCharacterField_mem (η : DirichletCharacter K D) (a : ZMod D) :
    η a∈tameCharacterField p η := sorry

theorem tameCharacterField_le_iff (η : DirichletCharacter K D)
    (E : IntermediateField ℚ_[p] K) :
    tameCharacterField p η≤E ↔ ∀ a,η a∈E := sorry

lemma tameCharacterField_principal :
    tameCharacterField p (1 : DirichletCharacter K D)=⊥ := sorry

lemma tameCharacterField_quadratic (η : DirichletCharacter K D) (hη : η.IsQuadratic) :
    tameCharacterField p η=⊥ := sorry

theorem tameCharacterValue_isIntegral (η : DirichletCharacter K D) (a : ZMod D) :
    IsIntegral ℚ_[p] (η a) := sorry

theorem tameCharacterField_finiteDimensional (η : DirichletCharacter K D) :
    FiniteDimensional ℚ_[p] (tameCharacterField p η) := sorry

def tameCharacterInField (η : DirichletCharacter K D) :
    DirichletCharacter (tameCharacterField p η) D := sorry

lemma coe_tameCharacterInField (η : DirichletCharacter K D) (a : ZMod D) :
    (tameCharacterInField p η a : K)=η a := sorry

theorem tameCharacterInField_ringHomComp (η : DirichletCharacter K D) :
    (tameCharacterInField p η).ringHomComp (algebraMap (tameCharacterField p η) K)=η := sorry

lemma tameCharacterInField_unique (η : DirichletCharacter K D)
    (χ : DirichletCharacter (tameCharacterField p η) D)
    (hχ : ∀ a,(χ a : K)=η a) : χ=tameCharacterInField p η := sorry

lemma tameCharacterInField_ne_one_iff (η : DirichletCharacter K D) :
    tameCharacterInField p η≠1 ↔ η≠1 := sorry

namespace SuggestedTameCharacterFieldTests
-- SuggestedTameCharacterFieldTests.principal_modulus_one_field
example : tameCharacterField p (1 : DirichletCharacter K 1)=⊥ := sorry

-- SuggestedTameCharacterFieldTests.quadratic_character_needs_only_base
example (η : DirichletCharacter K 3) (hη : η.IsQuadratic) :
    tameCharacterField p η=⊥ := sorry

-- SuggestedTameCharacterFieldTests.nonbase_value_prevents_base_field
example (η : DirichletCharacter K D) (a : ZMod D)
    (ha : η a∉(⊥ : IntermediateField ℚ_[p] K)) :
    tameCharacterField p η≠⊥ := sorry

-- SuggestedTameCharacterFieldTests.modulus_one_restricted_character
example : tameCharacterInField p (1 : DirichletCharacter K 1)=1 := sorry

-- SuggestedTameCharacterFieldTests.restricted_character_nonunit_zero
example (η : DirichletCharacter K D) (a : ZMod D) (ha : ¬IsUnit a) :
    tameCharacterInField p η a=0 := sorry

-- SuggestedTameCharacterFieldTests.restricted_quadratic_sign
example (η : DirichletCharacter K 3) (hη : η 2=-1) :
    tameCharacterInField p η 2=-1 := sorry

-- SuggestedTameCharacterFieldTests.nonprincipal_character_stays_nonprincipal
example (η : DirichletCharacter K D) (hη : η≠1) :
    tameCharacterInField p η≠1 := sorry

-- SuggestedTameCharacterFieldTests.quadratic_field_degree_one
example (η : DirichletCharacter K D) (hη : η.IsQuadratic) :
    Module.finrank ℚ_[p] (tameCharacterField p η)=1 := sorry

end SuggestedTameCharacterFieldTests

end CharacterFieldAlgebraic

section CharacterFieldTopology
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K] [NormedAlgebra ℚ_[p] K]
  {D : ℕ} [NeZero D]

theorem tameCharacterField_complete (η : DirichletCharacter K D) :
    CompleteSpace (tameCharacterField p η) := sorry

namespace SuggestedTameCharacterFieldTests
-- SuggestedTameCharacterFieldTests.completeness_without_ambient_completeness
example (η : DirichletCharacter K D) :
    CompleteSpace (tameCharacterField p η) := sorry

-- SuggestedTameCharacterFieldTests.dyadic_character_field_complete
example {L : Type*} [NormedField L] [NormedAlgebra ℚ_[2] L]
    (η : DirichletCharacter L 5) : CompleteSpace (tameCharacterField 2 η) := sorry

end SuggestedTameCharacterFieldTests

end CharacterFieldTopology

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
section CharacterFieldScalars
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K]
  {D : ℕ} [NeZero D]

lemma tameCharacterField_integerScalarTower (η : DirichletCharacter K D) :
    IsScalarTower ℤ_[p] (tameCharacterField p η) K := sorry

lemma tameCharacterField_isBoundedSMul [IsBoundedSMul ℤ_[p] K]
    (η : DirichletCharacter K D) : IsBoundedSMul ℤ_[p] (tameCharacterField p η) := sorry

end CharacterFieldScalars

section CharacterFieldValuation
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [NormedAlgebra ℚ_[p] K] [IsUltrametricDist K] {D : ℕ} [NeZero D]

lemma tameCharacterField_valuationExtension (η : DirichletCharacter K D) :
    Valuation.HasExtension (NormedField.valuation (K := tameCharacterField p η))
      (NormedField.valuation (K := K)) := sorry

end CharacterFieldValuation

section CharacterMeasureDescent
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K]
  [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
  {D : ℕ} [NeZero D] (η : DirichletCharacter K D)

local notation "Fη" => tameCharacterField p η

local instance : CompleteSpace Fη := tameCharacterField_complete p η

local instance : IsBoundedSMul ℤ_[p] Fη := tameCharacterField_isBoundedSMul p η

local instance : IsScalarTower ℤ_[p] Fη K := tameCharacterField_integerScalarTower p η

local instance : Valuation.HasExtension (NormedField.valuation (K := Fη))
  (NormedField.valuation (K := K)) := tameCharacterField_valuationExtension p η

local notation "hF" => (isUnit_iff_ne_zero.mpr (Nat.cast_ne_zero.mpr (NeZero.ne D)) : IsUnit (D : Fη))

local notation "hK" => (Iff.mpr isUnit_iff_ne_zero
  (Iff.mpr (@Nat.cast_ne_zero K _ (Algebra.charZero_of_charZero ℚ_[p] K) D) (NeZero.ne D)) : IsUnit (D : K))

local notation "ηF" => tameCharacterInField p η

local notation "iMap" => (ContinuousMap.mk (algebraMap Fη K) continuous_subtype_val : C(Fη,K))

local notation "OF" => Valuation.integer (NormedField.valuation (K := Fη))

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "jMap" => (ContinuousMap.mk (algebraMap OF OK)
  (Continuous.subtype_mk (Continuous.comp continuous_subtype_val continuous_subtype_val) _) : C(OF,OK))

theorem tameMeasure_characterField_apply (hpD : ¬p∣D) (f : C(ℤ_[p],Fη)) :
    (tameMeasure ηF hF hpD f : K)=tameMeasure η hK hpD ((iMap).comp f) := sorry

theorem tameZetaMeasure_characterField_apply (hpD : ¬p∣D) (f : C(ℤ_[p],Fη)) :
    (tameZetaMeasure ηF hF hpD f : K)=tameZetaMeasure η hK hpD ((iMap).comp f) := sorry

theorem intrinsicTameZetaMeasure_characterField_apply (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,Fη)) :
    (intrinsicTameZetaMeasure ηF hF hpD f : K)=
      intrinsicTameZetaMeasure η hK hpD ((iMap).comp f) := sorry

theorem integralTameMeasure_characterField_apply (hpD : ¬p∣D) (f : C(ℤ_[p],OF)) :
    algebraMap OF OK (integralTameMeasure ηF hF hpD f)=
      integralTameMeasure η hK hpD ((jMap).comp f) := sorry

theorem integralTameZetaMeasure_characterField_apply (hpD : ¬p∣D) (f : C(ℤ_[p],OF)) :
    algebraMap OF OK (integralTameZetaMeasure ηF hF hpD f)=
      integralTameZetaMeasure η hK hpD ((jMap).comp f) := sorry

theorem intrinsicIntegralTameZetaMeasure_characterField_apply (hpD : ¬p∣D)
    (f : C((ℤ_[p])ˣ,OF)) :
    algebraMap OF OK (intrinsicIntegralTameZetaMeasure ηF hF hpD f)=
      intrinsicIntegralTameZetaMeasure η hK hpD ((jMap).comp f) := sorry

namespace SuggestedTameCharacterDescentTests
-- SuggestedTameCharacterDescentTests.scalar_tower_on_integer
example (x : ℤ_[p]) : (algebraMap ℤ_[p] Fη x : K)=algebraMap ℤ_[p] K x := sorry

-- SuggestedTameCharacterDescentTests.bounded_integer_scalar_action
example (x : ℤ_[p]) (y : Fη) : ‖x • y‖≤‖x‖*‖y‖ := sorry

-- SuggestedTameCharacterDescentTests.integer_inclusion_reflects_divisibility
example (x y : OF) : algebraMap OF OK x∣algebraMap OF OK y ↔ x∣y := sorry

-- SuggestedTameCharacterDescentTests.zero_ideal_is_not_vacuous
example (x y : OF) : algebraMap OF OK (0 : OF)∣algebraMap OF OK (x-y) ↔ x=y := sorry

-- SuggestedTameCharacterDescentTests.tame_mass_in_character_field
example (hpD : ¬p∣D) : (tameMeasure ηF hF hpD 1 : K)=tameMeasure η hK hpD 1 := sorry

-- SuggestedTameCharacterDescentTests.tame_mahler_in_character_field
example (hpD : ¬p∣D) (n : ℕ) :
    (tameMeasure ηF hF hpD ((mahler n : C(ℤ_[p],ℤ_[p])) • (1 : C(ℤ_[p],Fη))) : K)=
      tameMeasure η hK hpD ((mahler n : C(ℤ_[p],ℤ_[p])) • (1 : C(ℤ_[p],K))) := sorry

-- SuggestedTameCharacterDescentTests.zeta_mass_in_character_field
example (hpD : ¬p∣D) : (tameZetaMeasure ηF hF hpD 1 : K)=tameZetaMeasure η hK hpD 1 := sorry

-- SuggestedTameCharacterDescentTests.intrinsic_positive_moment_in_character_field
example (hpD : ¬p∣D) (w : ℕ) :
    (intrinsicTameZetaMeasure ηF hF hpD
      (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Fη (p^0)) (w+1)).toContinuousMap : K)=
      intrinsicTameZetaMeasure η hK hpD
        (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) (w+1)).toContinuousMap := sorry

-- SuggestedTameCharacterDescentTests.integral_tame_mass_in_character_field
example (hpD : ¬p∣D) : algebraMap OF OK (integralTameMeasure ηF hF hpD 1)=
    integralTameMeasure η hK hpD 1 := sorry

-- SuggestedTameCharacterDescentTests.integral_zeta_mass_in_character_field
example (hpD : ¬p∣D) : algebraMap OF OK (integralTameZetaMeasure ηF hF hpD 1)=
    integralTameZetaMeasure η hK hpD 1 := sorry

-- SuggestedTameCharacterDescentTests.intrinsic_integral_mass_in_character_field
example (hpD : ¬p∣D) : algebraMap OF OK (intrinsicIntegralTameZetaMeasure ηF hF hpD 1)=
    intrinsicIntegralTameZetaMeasure η hK hpD 1 := sorry

-- SuggestedTameCharacterDescentTests.modulus_one_tame_descent_is_zero
example (hD1 : D=1) (hpD : ¬p∣D) (f : C(ℤ_[p],Fη)) :
    (tameMeasure ηF hF hpD f : K)=0 ∧ tameMeasure η hK hpD ((iMap).comp f)=0 := sorry

-- SuggestedTameCharacterDescentTests.modulus_one_intrinsic_integral_descent_is_zero
example (hD1 : D=1) (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,OF)) :
    algebraMap OF OK (intrinsicIntegralTameZetaMeasure ηF hF hpD f)=0 ∧
      intrinsicIntegralTameZetaMeasure η hK hpD ((jMap).comp f)=0 := sorry

end SuggestedTameCharacterDescentTests

end CharacterMeasureDescent

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
section CharacterMeasureRange
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K]
  [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
  {D : ℕ} [NeZero D] (η : DirichletCharacter K D)

local notation "Fη" => tameCharacterField p η

local instance : CompleteSpace Fη := tameCharacterField_complete p η

local instance : IsBoundedSMul ℤ_[p] Fη := tameCharacterField_isBoundedSMul p η

local instance : IsScalarTower ℤ_[p] Fη K := tameCharacterField_integerScalarTower p η

local instance : Valuation.HasExtension (NormedField.valuation (K := Fη))
  (NormedField.valuation (K := K)) := tameCharacterField_valuationExtension p η

local notation "hF" => (isUnit_iff_ne_zero.mpr (Nat.cast_ne_zero.mpr (NeZero.ne D)) : IsUnit (D : Fη))

local notation "hK" => (Iff.mpr isUnit_iff_ne_zero
  (Iff.mpr (@Nat.cast_ne_zero K _ (Algebra.charZero_of_charZero ℚ_[p] K) D) (NeZero.ne D)) : IsUnit (D : K))

local notation "ηF" => tameCharacterInField p η

local notation "iMap" => (ContinuousMap.mk (algebraMap Fη K) continuous_subtype_val : C(Fη,K))

local notation "OF" => Valuation.integer (NormedField.valuation (K := Fη))

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

local notation "jMap" => (ContinuousMap.mk (algebraMap OF OK)
  (Continuous.subtype_mk (Continuous.comp continuous_subtype_val continuous_subtype_val) _) : C(OF,OK))

lemma tameCharacterField_integer_range (x : OK) :
    x∈Set.range (algebraMap OF OK) ↔ (x : K)∈Fη := sorry

theorem tameMeasure_mem_characterField (hpD : ¬p∣D) (f : C(ℤ_[p],K))
    (hf : ∀ x,f x∈Fη) : tameMeasure η hK hpD f∈Fη := sorry

theorem tameZetaMeasure_mem_characterField (hpD : ¬p∣D) (f : C(ℤ_[p],K))
    (hf : ∀ x,f x∈Fη) : tameZetaMeasure η hK hpD f∈Fη := sorry

theorem intrinsicTameZetaMeasure_mem_characterField (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,K))
    (hf : ∀ x,f x∈Fη) : intrinsicTameZetaMeasure η hK hpD f∈Fη := sorry

theorem integralTameMeasure_mem_characterIntegerRange (hpD : ¬p∣D) (f : C(ℤ_[p],OK))
    (hf : ∀ x,(f x : K)∈Fη) :
    integralTameMeasure η hK hpD f∈Set.range (algebraMap OF OK) := sorry

theorem integralTameZetaMeasure_mem_characterIntegerRange (hpD : ¬p∣D) (f : C(ℤ_[p],OK))
    (hf : ∀ x,(f x : K)∈Fη) :
    integralTameZetaMeasure η hK hpD f∈Set.range (algebraMap OF OK) := sorry

theorem intrinsicIntegralTameZetaMeasure_mem_characterIntegerRange (hpD : ¬p∣D) (f : C((ℤ_[p])ˣ,OK))
    (hf : ∀ x,(f x : K)∈Fη) :
    intrinsicIntegralTameZetaMeasure η hK hpD f∈Set.range (algebraMap OF OK) := sorry

namespace SuggestedTameCharacterRangeTests
-- SuggestedTameCharacterRangeTests.integer_range_contains_zero
example : (0 : OK)∈Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.integer_range_contains_one
example : (1 : OK)∈Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.integral_element_outside_character_field
example (x : OK) (hx : (x : K)∉Fη) : x∉Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.tame_mass_range
example (hpD : ¬p∣D) : tameMeasure η hK hpD 1∈Fη := sorry

-- SuggestedTameCharacterRangeTests.tame_constant_test_range
example (hpD : ¬p∣D) (b : Fη) :
    tameMeasure η hK hpD (ContinuousMap.const ℤ_[p] (b : K))∈Fη := sorry

-- SuggestedTameCharacterRangeTests.zeta_mass_range
example (hpD : ¬p∣D) : tameZetaMeasure η hK hpD 1∈Fη := sorry

-- SuggestedTameCharacterRangeTests.zeta_constant_test_range
example (hpD : ¬p∣D) (b : Fη) :
    tameZetaMeasure η hK hpD (ContinuousMap.const ℤ_[p] (b : K))∈Fη := sorry

-- SuggestedTameCharacterRangeTests.intrinsic_mass_range
example (hpD : ¬p∣D) : intrinsicTameZetaMeasure η hK hpD 1∈Fη := sorry

-- SuggestedTameCharacterRangeTests.intrinsic_constant_test_range
example (hpD : ¬p∣D) (b : Fη) :
    intrinsicTameZetaMeasure η hK hpD (ContinuousMap.const ((ℤ_[p])ˣ) (b : K))∈Fη := sorry

-- SuggestedTameCharacterRangeTests.integral_tame_mass_range
example (hpD : ¬p∣D) : integralTameMeasure η hK hpD 1∈Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.integral_zeta_mass_range
example (hpD : ¬p∣D) : integralTameZetaMeasure η hK hpD 1∈Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.intrinsic_integral_mass_range
example (hpD : ¬p∣D) : intrinsicIntegralTameZetaMeasure η hK hpD 1∈Set.range (algebraMap OF OK) := sorry

-- SuggestedTameCharacterRangeTests.zero_tame_test_range
example (hpD : ¬p∣D) : tameMeasure η hK hpD 0=0 ∧ tameMeasure η hK hpD 0∈Fη := sorry

-- SuggestedTameCharacterRangeTests.outside_constant_dirac_control
example (b : K) (hb : b∉Fη) :
    AbstractMeasure.dirac K (0 : ℤ_[p]) (ContinuousMap.const ℤ_[p] b)∉Fη := sorry

end SuggestedTameCharacterRangeTests

end CharacterMeasureRange

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
section ArithmeticCharacterFieldValues
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K]
  [IsBoundedSMul ℤ_[p] K]

lemma primePowerArithmeticCharacter_mem_characterField (n : ℕ)
    (χ : DirichletCharacter K (p^n)) (w : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ w u∈tameCharacterField p χ := sorry

namespace SuggestedJointCharacterMomentTests
-- SuggestedJointCharacterMomentTests.wild_weight_zero_value_in_its_field
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ 0 u∈tameCharacterField p χ := sorry

-- SuggestedJointCharacterMomentTests.zero_level_value_in_base_field
example (w : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) w u∈
      (⊥ : IntermediateField ℚ_[p] K) := sorry

-- SuggestedJointCharacterMomentTests.dyadic_wild_value_in_its_field
example {L : Type*} [NormedField L] [NormedAlgebra ℚ_[2] L]
    [Algebra ℤ_[2] L] [IsScalarTower ℤ_[2] ℚ_[2] L] [IsBoundedSMul ℤ_[2] L]
    (χ : DirichletCharacter L (2^4)) (w : ℕ) (u : (ℤ_[2])ˣ) :
    primePowerArithmeticCharacter 2 4 χ w u∈tameCharacterField 2 χ := sorry

end SuggestedJointCharacterMomentTests

end ArithmeticCharacterFieldValues

section JointCharacterMoments
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsScalarTower ℤ_[p] ℚ_[p] K]
  [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
  {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (n : ℕ)
  (χ : DirichletCharacter K (p^n))

local notation "J" => (tameCharacterField p η ⊔ tameCharacterField p χ : IntermediateField ℚ_[p] K)

local instance : FiniteDimensional ℚ_[p] (tameCharacterField p η) :=
  tameCharacterField_finiteDimensional p η

local instance : FiniteDimensional ℚ_[p] (tameCharacterField p χ) :=
  tameCharacterField_finiteDimensional p χ

local instance : NormedAlgebra ℚ_[p] J := Subalgebra.toNormedAlgebra (J).toSubalgebra

local instance : CompleteSpace J := FiniteDimensional.complete ℚ_[p] J

local instance : IsBoundedSMul ℤ_[p] J := by
  apply IsBoundedSMul.of_norm_smul_le
  intro r x
  change ‖r • (x : K)‖≤‖r‖*‖(x : K)‖
  exact norm_smul_le r (x : K)

local instance : IsScalarTower ℤ_[p] J K := by
  apply IsScalarTower.of_algebraMap_eq
  intro x
  rfl

local instance : Valuation.HasExtension (NormedField.valuation (K := J))
    (NormedField.valuation (K := K)) := by
  constructor
  intro x y
  rfl

local notation "ηJ" => MulChar.ringHomComp (tameCharacterInField p η)
  (AlgHom.toRingHom (IntermediateField.inclusion
    (le_sup_left : tameCharacterField p η≤J)))

local notation "χJ" => MulChar.ringHomComp (tameCharacterInField p χ)
  (AlgHom.toRingHom (IntermediateField.inclusion
    (le_sup_right : tameCharacterField p χ≤J)))

local notation "hJ" => (isUnit_iff_ne_zero.mpr (Nat.cast_ne_zero.mpr (NeZero.ne D)) : IsUnit (D : J))

local notation "hK" => (Iff.mpr isUnit_iff_ne_zero
  (Iff.mpr (@Nat.cast_ne_zero K _ (Algebra.charZero_of_charZero ℚ_[p] K) D) (NeZero.ne D)) : IsUnit (D : K))

local notation "OJ" => Valuation.integer (NormedField.valuation (K := J))

local notation "OK" => Valuation.integer (NormedField.valuation (K := K))

theorem intrinsicTameZetaMeasure_characterSup_apply (hpD : ¬p∣D) (w : ℕ) :
    (intrinsicTameZetaMeasure ηJ hJ hpD
      (primePowerArithmeticCharacter p n χJ w).toContinuousMap : K)=
      intrinsicTameZetaMeasure η hK hpD
        (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

theorem intrinsicIntegralTameZetaMeasure_characterSup_apply (hpD : ¬p∣D) (w : ℕ) :
    algebraMap OJ OK (intrinsicIntegralTameZetaMeasure ηJ hJ hpD
      (integralPrimePowerArithmeticCharacter p n χJ w).toContinuousMap)=
      intrinsicIntegralTameZetaMeasure η hK hpD
        (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

theorem intrinsicTameZetaMeasure_arithmetic_mem_characterSup (hpD : ¬p∣D) (w : ℕ) :
    intrinsicTameZetaMeasure η hK hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap∈J := sorry

theorem intrinsicIntegralTameZetaMeasure_arithmetic_mem_characterSupIntegers
    (hpD : ¬p∣D) (w : ℕ) :
    intrinsicIntegralTameZetaMeasure η hK hpD
      (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap∈
        Set.range (algebraMap OJ OK) := sorry

namespace SuggestedJointCharacterMomentTests
-- SuggestedJointCharacterMomentTests.principal_wild_field_adds_nothing
example (hχ : χ=1) : J=tameCharacterField p η := sorry

-- SuggestedJointCharacterMomentTests.quadratic_wild_field_adds_nothing
example (hχ : χ.IsQuadratic) : J=tameCharacterField p η := sorry

-- SuggestedJointCharacterMomentTests.wild_value_outside_tame_field_enlarges_it
example (a : ZMod (p^n)) (ha : χ a∉tameCharacterField p η) : J≠tameCharacterField p η := sorry

-- SuggestedJointCharacterMomentTests.zero_weight_joint_comparison
example (hpD : ¬p∣D) :
    (intrinsicTameZetaMeasure ηJ hJ hpD
      (primePowerArithmeticCharacter p n χJ 0).toContinuousMap : K)=
      intrinsicTameZetaMeasure η hK hpD
        (primePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedJointCharacterMomentTests.weight_zero_integral_joint_comparison
example (hpD : ¬p∣D) :
    algebraMap OJ OK (intrinsicIntegralTameZetaMeasure ηJ hJ hpD
      (integralPrimePowerArithmeticCharacter p n χJ 0).toContinuousMap)=
      intrinsicIntegralTameZetaMeasure η hK hpD
        (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedJointCharacterMomentTests.principal_wild_moment_in_tame_field
example (hpD : ¬p∣D) (hχ : χ=1) (w : ℕ) :
    intrinsicTameZetaMeasure η hK hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap∈tameCharacterField p η := sorry

-- SuggestedJointCharacterMomentTests.quadratic_wild_moment_in_tame_field
example (hpD : ¬p∣D) (hχ : χ.IsQuadratic) (w : ℕ) :
    intrinsicTameZetaMeasure η hK hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap∈tameCharacterField p η := sorry

-- SuggestedJointCharacterMomentTests.modulus_one_joint_moment_is_zero
example (hD1 : D=1) (hpD : ¬p∣D) (w : ℕ) :
    intrinsicTameZetaMeasure η hK hpD
      (primePowerArithmeticCharacter p n χ w).toContinuousMap=0 := sorry

-- SuggestedJointCharacterMomentTests.modulus_one_integral_joint_moment_is_zero
example (hD1 : D=1) (hpD : ¬p∣D) (w : ℕ) :
    intrinsicIntegralTameZetaMeasure η hK hpD
      (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap=0 := sorry

end SuggestedJointCharacterMomentTests

end JointCharacterMoments

end

end DirichletPadic

namespace DirichletPadic
section TamePrimeLevel
variable {R : Type*} [CommRing R] {M q : ℕ} [NeZero M] [Fact q.Prime]

lemma changeLevel_prime_nat_value (η : DirichletCharacter R M) (a : ℕ) :
    η.changeLevel (dvd_mul_left M q) (a : ZMod (q*M)) =
      if q ∣ a then 0 else η (a : ZMod M) := sorry

lemma changeLevel_prime_finite_sum {S : Type*} [CommRing S]
    (η : DirichletCharacter R M) (φ : R →+* S) (Y : S) :
    (∑ a ∈ Finset.range (q*M), φ (η.changeLevel (dvd_mul_left M q)
      (a : ZMod (q*M))) * Y^a) =
      (∑ a ∈ Finset.range M, φ (η (a : ZMod M)) * Y^a) *
        (∑ j ∈ Finset.range q, Y^(j*M)) -
      φ (η (q : ZMod M)) *
        (∑ a ∈ Finset.range M, φ (η (a : ZMod M)) * (Y^q)^a) := sorry

lemma tameSeries_changeLevel_prime [IsDomain R] (η : DirichletCharacter R M)
    (hη : η ≠ 1) (hM : IsUnit (M : R)) (hN : IsUnit ((q*M : ℕ) : R)) :
    tameSeries (η.changeLevel (dvd_mul_left M q)) hN =
      tameSeries η hM - C (η (q : ZMod M)) *
        PowerSeries.subst ((1+X : R⟦X⟧)^q-1) (tameSeries η hM) := sorry

lemma tameSeries_changeLevel_prime_dvd [IsDomain R] (η : DirichletCharacter R M)
    (hη : η ≠ 1) (hM : IsUnit (M : R)) (hN : IsUnit ((q*M : ℕ) : R))
    (hqM : q ∣ M) :
    tameSeries (η.changeLevel (dvd_mul_left M q)) hN = tameSeries η hM := sorry

end TamePrimeLevel

end DirichletPadic

namespace SuggestedTamePrimeLevelTests
open DirichletPadic

variable {R : Type*} [CommRing R] {M q : ℕ} [NeZero M] [Fact q.Prime]

-- SuggestedTamePrimeLevelTests.added_prime_zero
example (η : DirichletCharacter R M) :
    η.changeLevel (dvd_mul_left M q) (q : ZMod (q*M)) = 0 := sorry

-- SuggestedTamePrimeLevelTests.unchanged_away_from_prime
example (η : DirichletCharacter R M) (a : ℕ) (ha : ¬ q ∣ a) :
    η.changeLevel (dvd_mul_left M q) (a : ZMod (q*M)) = η (a : ZMod M) := sorry

-- SuggestedTamePrimeLevelTests.principal_lift_has_new_zero
example : (1 : DirichletCharacter ℚ 3).changeLevel (dvd_mul_left 3 2)
    (2 : ZMod (2*3)) = 0 := sorry

-- SuggestedTamePrimeLevelTests.principal_polynomial_mod_three_to_six
example (Y : R) :
    (∑ a ∈ Finset.range 6, (1 : DirichletCharacter R 6) (a : ZMod 6)*Y^a) =
      Y + Y^5 := sorry

-- SuggestedTamePrimeLevelTests.repeated_prime_finite_sum
example (η : DirichletCharacter R M) (Y : R) (hqM : q ∣ M) :
    (∑ a ∈ Finset.range (q*M), η.changeLevel (dvd_mul_left M q)
      (a : ZMod (q*M))*Y^a) =
      (∑ a ∈ Finset.range M, η (a : ZMod M)*Y^a) *
        (∑ j ∈ Finset.range q, Y^(j*M)) := sorry

-- SuggestedTamePrimeLevelTests.nonprincipal_mass_factor
example [IsDomain R] (η : DirichletCharacter R M) (hη : η ≠ 1)
    (hM : IsUnit (M : R)) (hN : IsUnit ((q*M : ℕ) : R)) :
    constantCoeff (tameSeries (η.changeLevel (dvd_mul_left M q)) hN) =
      (1-η (q : ZMod M))*constantCoeff (tameSeries η hM) := sorry

-- SuggestedTamePrimeLevelTests.principal_mass_counterexample
example : constantCoeff (tameSeries (1 : DirichletCharacter ℚ 9)
    (by norm_num : IsUnit ((9 : ℕ) : ℚ))) ≠
    constantCoeff (tameSeries (1 : DirichletCharacter ℚ 3)
      (by norm_num : IsUnit ((3 : ℕ) : ℚ))) := sorry

-- SuggestedTamePrimeLevelTests.correct_zero_constant_substitution
example : constantCoeff ((1+X : R⟦X⟧)^q-1) = 0 := sorry

-- SuggestedTamePrimeLevelTests.repeated_prime_character_value_zero
example (η : DirichletCharacter R M) (hqM : q ∣ M) : η (q : ZMod M) = 0 := sorry

-- SuggestedTamePrimeLevelTests.repeated_prime_series_coefficients
example [IsDomain R] (η : DirichletCharacter R M) (hη : η ≠ 1)
    (hM : IsUnit (M : R)) (hN : IsUnit ((q*M : ℕ) : R)) (hqM : q ∣ M) (n : ℕ) :
    coeff n (tameSeries (η.changeLevel (dvd_mul_left M q)) hN) =
      coeff n (tameSeries η hM) := sorry

end SuggestedTamePrimeLevelTests

namespace DirichletPadic
section TamePrimeMeasure
variable {p q M : ℕ} [Fact p.Prime] [Fact q.Prime] [NeZero M]
  {K : Type*} [NormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K]

theorem tameMeasure_changeLevel_prime (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      tameMeasure η hM hpM - η (q : ZMod M) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
        (tameMeasure η hM hpM) := sorry

theorem tameMeasure_changeLevel_prime_dvd (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      tameMeasure η hM hpM := sorry

theorem tameMeasure_changeLevel_prime_moment (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (k : ℕ) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (q : ZMod M)*(q : K)^k) * tameMeasure η hM hpM
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

end TamePrimeMeasure

end DirichletPadic

namespace SuggestedTamePrimeMeasureTests
open DirichletPadic

variable {p q M : ℕ} [Fact p.Prime] [Fact q.Prime] [NeZero M]
  {K : Type*} [NormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K]

-- SuggestedTamePrimeMeasureTests.all_continuous_test_comparison
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (f : C(ℤ_[p],K)) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      tameMeasure η hM hpM f - η (q : ZMod M) * tameMeasure η hM hpM
        (f.comp (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTamePrimeMeasureTests.mass_euler_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN (1 : C(ℤ_[p],K)) =
      (1-η (q : ZMod M))*tameMeasure η hM hpM (1 : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeMeasureTests.characteristic_prime_excluded
example (h : ¬p ∣ q*M) : p ≠ q := sorry

-- SuggestedTamePrimeMeasureTests.repeated_prime_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) (f : C(ℤ_[p],K)) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      tameMeasure η hM hpM f := sorry

-- SuggestedTamePrimeMeasureTests.repeated_prime_zero_test
example (η : DirichletCharacter K M)
    (hN : IsUnit ((q*M : ℕ) : K)) (hpN : ¬p ∣ q*M) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN (0 : C(ℤ_[p],K)) = 0 := sorry

-- SuggestedTamePrimeMeasureTests.dyadic_repeated_prime
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (η : DirichletCharacter ℚ_[2] 3) (hη : η ≠ 1)
    (hM : IsUnit ((3 : ℕ) : ℚ_[2])) (hN : IsUnit ((9 : ℕ) : ℚ_[2]))
    (hpM : ¬2 ∣ 3) (hpN : ¬2 ∣ 9) :
    tameMeasure (η.changeLevel (dvd_mul_left 3 3)) hN hpN =
      tameMeasure η hM hpM := sorry

-- SuggestedTamePrimeMeasureTests.weight_zero_is_mass
example (η : DirichletCharacter K M) (hM : IsUnit (M : K)) (hpM : ¬p ∣ M) :
    tameMeasure η hM hpM
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^0, by fun_prop⟩ : C(ℤ_[p],K)) =
      tameMeasure η hM hpM (1 : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeMeasureTests.first_moment_euler_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨algebraMap ℤ_[p] K, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (q : ZMod M)*(q : K))*tameMeasure η hM hpM
        (⟨algebraMap ℤ_[p] K, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeMeasureTests.repeated_prime_all_moments
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) (k : ℕ) :
    tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
      tameMeasure η hM hpM
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

end SuggestedTamePrimeMeasureTests

namespace DirichletPadic
section TamePrimeZeta
variable {p q M : ℕ} [Fact p.Prime] [Fact q.Prime] [NeZero M]
  {K : Type*} [NontriviallyNormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K]

theorem unitRestriction_tameMeasure_changeLevel_prime (η : DirichletCharacter K M)
    (hη : η ≠ 1) (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    AbstractMeasure.unitRestriction p K
      (tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN) =
      AbstractMeasure.unitRestriction p K (tameMeasure η hM hpM) -
        η (q : ZMod M) • AbstractMeasure.map
          (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
          (AbstractMeasure.unitRestriction p K (tameMeasure η hM hpM)) := sorry

theorem tameZetaMeasure_changeLevel_prime (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      tameZetaMeasure η hM hpM - (η (q : ZMod M)/(q : K)) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
        (tameZetaMeasure η hM hpM) := sorry

theorem tameZetaMeasure_changeLevel_prime_dvd (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      tameZetaMeasure η hM hpM := sorry

theorem intrinsicTameZetaMeasure_changeLevel_prime (η : DirichletCharacter K M)
    (hη : η ≠ 1) (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (u : (ℤ_[p])ˣ)
    (hu : (u : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      intrinsicTameZetaMeasure η hM hpM - (η (q : ZMod M)/(q : K)) • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => u*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))
        (intrinsicTameZetaMeasure η hM hpM) := sorry

theorem tameZetaMeasure_changeLevel_prime_positive_moment (η : DirichletCharacter K M)
    (hη : η ≠ 1) (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (k : ℕ) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (q : ZMod M)*(q : K)^k) * tameZetaMeasure η hM hpM
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K)) := sorry

end TamePrimeZeta

end DirichletPadic

namespace SuggestedTamePrimeZetaTests
open DirichletPadic

variable {p q M : ℕ} [Fact p.Prime] [Fact q.Prime] [NeZero M]
  {K : Type*} [NontriviallyNormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K]

-- SuggestedTamePrimeZetaTests.unit_restriction_mass_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    AbstractMeasure.unitRestriction p K
      (tameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN) (1 : C(ℤ_[p],K)) =
      (1-η (q : ZMod M))*AbstractMeasure.unitRestriction p K
        (tameMeasure η hM hpM) (1 : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeZetaTests.unit_restriction_zero_test
example (η : DirichletCharacter K M) (hM : IsUnit (M : K)) (hpM : ¬p ∣ M) :
    AbstractMeasure.unitRestriction p K (tameMeasure η hM hpM) (0 : C(ℤ_[p],K)) = 0 := sorry

-- SuggestedTamePrimeZetaTests.zeta_all_continuous_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (f : C(ℤ_[p],K)) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      tameZetaMeasure η hM hpM f - (η (q : ZMod M)/(q : K))*tameZetaMeasure η hM hpM
        (f.comp (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTamePrimeZetaTests.zeta_mass_inverse_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN (1 : C(ℤ_[p],K)) =
      (1-η (q : ZMod M)/(q : K))*tameZetaMeasure η hM hpM (1 : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeZetaTests.inverse_weight_stays_zero
example (x : ℤ_[p]) (hx : ¬ IsUnit x) : algebraMap ℤ_[p] K (PadicInt.inv x) = 0 := sorry

-- SuggestedTamePrimeZetaTests.repeated_prime_zeta_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) (f : C(ℤ_[p],K)) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      tameZetaMeasure η hM hpM f := sorry

-- SuggestedTamePrimeZetaTests.dyadic_repeated_prime_zeta
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (η : DirichletCharacter ℚ_[2] 3) (hη : η ≠ 1)
    (hM : IsUnit ((3 : ℕ) : ℚ_[2])) (hN : IsUnit ((9 : ℕ) : ℚ_[2]))
    (hpM : ¬2 ∣ 3) (hpN : ¬2 ∣ 9) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left 3 3)) hN hpN =
      tameZetaMeasure η hM hpM := sorry

-- SuggestedTamePrimeZetaTests.actual_dilation_unit_exists
example (hpN : ¬p ∣ q*M) : ∃ u : (ℤ_[p])ˣ, (u : ℤ_[p]) = (q : ℤ_[p]) := sorry

-- SuggestedTamePrimeZetaTests.unit_choice_is_unique
example (u v : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = (q : ℤ_[p]))
    (hv : (v : ℤ_[p]) = (q : ℤ_[p])) : u = v := sorry

-- SuggestedTamePrimeZetaTests.intrinsic_zeta_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (u : (ℤ_[p])ˣ)
    (hu : (u : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,K)) :
    intrinsicTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      intrinsicTameZetaMeasure η hM hpM f - (η (q : ZMod M)/(q : K))*
        intrinsicTameZetaMeasure η hM hpM
          (f.comp (⟨fun x : (ℤ_[p])ˣ => u*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTamePrimeZetaTests.first_zeta_moment_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨algebraMap ℤ_[p] K, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (q : ZMod M))*tameZetaMeasure η hM hpM
        (⟨algebraMap ℤ_[p] K, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

-- SuggestedTamePrimeZetaTests.second_zeta_moment_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) :
    tameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^2, by fun_prop⟩ : C(ℤ_[p],K)) =
      (1-η (q : ZMod M)*(q : K))*tameZetaMeasure η hM hpM
        (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^2, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

end SuggestedTamePrimeZetaTests

namespace DirichletPadic
section TamePrimeIntegral
variable {p q M : ℕ} [Fact p.Prime]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem tamePrimeCorrection_mem_integer (η : DirichletCharacter K M) (hpq : ¬p ∣ q) :
    η (q : ZMod M) / (q : K) ∈ O := sorry

variable [Fact q.Prime] [NeZero M] [CompleteSpace K]

theorem integralTameMeasure_changeLevel_prime (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (a : O) (ha : (a : K) = η (q : ZMod M)) :
    integralTameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      integralTameMeasure η hM hpM - a • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
        (integralTameMeasure η hM hpM) := sorry

theorem integralTameZetaMeasure_changeLevel_prime (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) :
    integralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      integralTameZetaMeasure η hM hpM - c • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => (q : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
        (integralTameZetaMeasure η hM hpM) := sorry

theorem intrinsicIntegralTameZetaMeasure_changeLevel_prime (η : DirichletCharacter K M)
    (hη : η ≠ 1) (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) (u : (ℤ_[p])ˣ)
    (hu : (u : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      intrinsicIntegralTameZetaMeasure η hM hpM - c • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => u*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))
        (intrinsicIntegralTameZetaMeasure η hM hpM) := sorry

end TamePrimeIntegral

end DirichletPadic

namespace SuggestedTamePrimeIntegralTests
open DirichletPadic

variable {p q M : ℕ} [Fact p.Prime] [Fact q.Prime] [NeZero M]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "dMap" => (ContinuousMap.mk (fun x : ℤ_[p] => (q : ℤ_[p])*x) (by fun_prop) : C(ℤ_[p],ℤ_[p]))

-- SuggestedTamePrimeIntegralTests.actual_integral_coefficients_exist
example (η : DirichletCharacter K M) (hpN : ¬p ∣ q*M) :
    (∃! a : O, (a : K) = η (q : ZMod M)) ∧
      (∃! c : O, (c : K) = η (q : ZMod M)/(q : K)) := sorry

-- SuggestedTamePrimeIntegralTests.dyadic_inverse_coefficient_is_integral
example : (-1/(3 : ℚ_[2])) ∈ Valuation.integer (NormedField.valuation (K := ℚ_[2])) := sorry

-- SuggestedTamePrimeIntegralTests.nonunit_denominator_is_excluded
example : ¬ (1/(2 : ℚ_[2])) ∈ Valuation.integer (NormedField.valuation (K := ℚ_[2])) := sorry

-- SuggestedTamePrimeIntegralTests.integral_measure_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (a : O) (ha : (a : K) = η (q : ZMod M))
    (f : C(ℤ_[p],O)) :
    integralTameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      integralTameMeasure η hM hpM f - a * integralTameMeasure η hM hpM (f.comp (dMap)) := sorry

-- SuggestedTamePrimeIntegralTests.integral_measure_mass_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (a : O) (ha : (a : K) = η (q : ZMod M)) :
    integralTameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN 1 =
      (1-a) * integralTameMeasure η hM hpM 1 := sorry

-- SuggestedTamePrimeIntegralTests.integral_measure_repeated_prime
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) :
    integralTameMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      integralTameMeasure η hM hpM := sorry

-- SuggestedTamePrimeIntegralTests.integral_zeta_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) (f : C(ℤ_[p],O)) :
    integralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      integralTameZetaMeasure η hM hpM f - c * integralTameZetaMeasure η hM hpM (f.comp (dMap)) := sorry

-- SuggestedTamePrimeIntegralTests.integral_zeta_mass_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) :
    integralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN 1 =
      (1-c) * integralTameZetaMeasure η hM hpM 1 := sorry

-- SuggestedTamePrimeIntegralTests.integral_zeta_repeated_prime
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) :
    integralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      integralTameZetaMeasure η hM hpM := sorry

-- SuggestedTamePrimeIntegralTests.intrinsic_integral_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) (u : (ℤ_[p])ˣ)
    (hu : (u : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,O)) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN f =
      intrinsicIntegralTameZetaMeasure η hM hpM f - c * intrinsicIntegralTameZetaMeasure η hM hpM
        (f.comp (⟨fun x : (ℤ_[p])ˣ => u*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTamePrimeIntegralTests.intrinsic_integral_mass_factor
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (c : O)
    (hc : (c : K) = η (q : ZMod M)/(q : K)) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN 1 =
      (1-c) * intrinsicIntegralTameZetaMeasure η hM hpM 1 := sorry

-- SuggestedTamePrimeIntegralTests.intrinsic_integral_repeated_prime
example (η : DirichletCharacter K M) (hη : η ≠ 1)
    (hM : IsUnit (M : K)) (hN : IsUnit ((q*M : ℕ) : K))
    (hpM : ¬p ∣ M) (hpN : ¬p ∣ q*M) (hqM : q ∣ M) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel (dvd_mul_left M q)) hN hpN =
      intrinsicIntegralTameZetaMeasure η hM hpM := sorry

end SuggestedTamePrimeIntegralTests

namespace DirichletPadic
section TameLevelComparison
variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

theorem tameMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) :
    tameMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (N.primeFactors \ M.primeFactors).powerset,
        ((-1 : K)^t.card * η ((∏ q ∈ t, q : ℕ) : ZMod M)) •
          AbstractMeasure.map
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
            (tameMeasure η hM hpM) := sorry

theorem tameZetaMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) :
    tameZetaMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (N.primeFactors \ M.primeFactors).powerset,
        ((-1 : K)^t.card * (η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))) •
          AbstractMeasure.map
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
            (tameZetaMeasure η hM hpM) := sorry

end TameLevelComparison

section PrimitiveTameComparison
variable {p N : ℕ} [Fact p.Prime] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

variable (η : DirichletCharacter K N)

local instance : NeZero η.conductor := ⟨η.conductor_ne_zero⟩

theorem tameMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor) :
    tameMeasure η hN hpN =
      ∑ t ∈ (N.primeFactors \ η.conductor.primeFactors).powerset,
        ((-1 : K)^t.card * η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor)) •
          AbstractMeasure.map
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
            (tameMeasure η.primitiveCharacter hF hpF) := sorry

theorem tameZetaMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor) :
    tameZetaMeasure η hN hpN =
      ∑ t ∈ (N.primeFactors \ η.conductor.primeFactors).powerset,
        ((-1 : K)^t.card * (η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) /
          ((∏ q ∈ t, q : ℕ) : K))) •
          AbstractMeasure.map
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
            (tameZetaMeasure η.primitiveCharacter hF hpF) := sorry

end PrimitiveTameComparison

end DirichletPadic

namespace SuggestedTameLevelComparisonTests
open DirichletPadic

variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

-- SuggestedTameLevelComparisonTests.level_measure_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (f : C(ℤ_[p],K)) :
    tameMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (N.primeFactors \ M.primeFactors).powerset,
        ((-1 : K)^t.card * η ((∏ q ∈ t, q : ℕ) : ZMod M)) *
          tameMeasure η hM hpM (f.comp
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTameLevelComparisonTests.level_measure_empty_new_primes
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (hs : N.primeFactors = M.primeFactors) :
    tameMeasure (η.changeLevel hMN) hN hpN = tameMeasure η hM hpM := sorry

-- SuggestedTameLevelComparisonTests.level_measure_moment_product
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (k : ℕ) :
    tameMeasure (η.changeLevel hMN) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1-η (q : ZMod M)*(q : K)^k)) *
        tameMeasure η hM hpM
          (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^k, by fun_prop⟩ : C(ℤ_[p],K)) := sorry

-- SuggestedTameLevelComparisonTests.level_zeta_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (f : C(ℤ_[p],K)) :
    tameZetaMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (N.primeFactors \ M.primeFactors).powerset,
        ((-1 : K)^t.card * (η ((∏ q ∈ t, q : ℕ) : ZMod M)/((∏ q ∈ t, q : ℕ) : K))) *
          tameZetaMeasure η hM hpM (f.comp
            (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTameLevelComparisonTests.level_zeta_mass_product
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) :
    tameZetaMeasure (η.changeLevel hMN) hN hpN 1 =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1-η (q : ZMod M)/(q : K))) *
        tameZetaMeasure η hM hpM 1 := sorry

-- SuggestedTameLevelComparisonTests.level_zeta_positive_moment_product
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (k : ℕ) :
    tameZetaMeasure (η.changeLevel hMN) hN hpN
      (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K)) =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1-η (q : ZMod M)*(q : K)^k)) *
        tameZetaMeasure η hM hpM
          (⟨fun x : ℤ_[p] => (algebraMap ℤ_[p] K x)^(k+1), by fun_prop⟩ : C(ℤ_[p],K)) := sorry

-- SuggestedTameLevelComparisonTests.actual_primitive_is_nonprincipal
example (η : DirichletCharacter K N) (hη : η ≠ 1) : η.primitiveCharacter ≠ 1 := sorry

-- SuggestedTameLevelComparisonTests.conductor_constructor_certificates
example (η : DirichletCharacter K N) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N) :
    η.conductor ≠ 0 ∧ IsUnit (η.conductor : K) ∧ ¬p ∣ η.conductor := sorry

-- SuggestedTameLevelComparisonTests.native_primitive_recovers_character
example (η : DirichletCharacter K N) :
    η.primitiveCharacter.changeLevel η.conductor_dvd_level = η := sorry

-- SuggestedTameLevelComparisonTests.primitive_zeta_no_new_prime_factor
example (η : DirichletCharacter K N) (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (hs : N.primeFactors = η.conductor.primeFactors) :
    letI : NeZero η.conductor := ⟨η.conductor_ne_zero⟩
    tameZetaMeasure η hN hpN = tameZetaMeasure η.primitiveCharacter hF hpF := sorry

end SuggestedTameLevelComparisonTests

namespace DirichletPadic
section TameLevelIntegral
variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "S" => N.primeFactors \ M.primeFactors

theorem intrinsicTameZetaMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : K)^t.card * (η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))) • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ)) (intrinsicTameZetaMeasure η hM hpM) := sorry

theorem integralTameMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (a : ZMod M → O) (ha : ∀ x, (a x : K) = η x) :
    integralTameMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod M)) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p])) (integralTameMeasure η hM hpM) := sorry

theorem integralTameZetaMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K)) :
    integralTameZetaMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p])) (integralTameZetaMeasure η hM hpM) := sorry

theorem intrinsicIntegralTameZetaMeasure_changeLevel (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ)) (intrinsicIntegralTameZetaMeasure η hM hpM) := sorry

end TameLevelIntegral

end DirichletPadic

namespace SuggestedTameLevelIntegralTests
open DirichletPadic

variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "S" => N.primeFactors \ M.primeFactors

-- SuggestedTameLevelIntegralTests.actual_unit_family_exists
example (hpN : ¬p ∣ N) :
    ∃ u : ℕ → (ℤ_[p])ˣ, ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p]) := sorry

-- SuggestedTameLevelIntegralTests.unit_family_irrelevant_outside_support
example (u v : ℕ → (ℤ_[p])ˣ)
    (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (hv : ∀ q ∈ S, (v q : ℤ_[p]) = (q : ℤ_[p])) (t : Finset ℕ) (ht : t ∈ (S).powerset) :
    (∏ q ∈ t, u q) = ∏ q ∈ t, v q := sorry

-- SuggestedTameLevelIntegralTests.actual_character_coefficient_family_exists
example (η : DirichletCharacter K M) : ∃ a : ZMod M → O, ∀ x, (a x : K) = η x := sorry

-- SuggestedTameLevelIntegralTests.actual_subset_coefficient_family_exists
example (η : DirichletCharacter K M) (hpN : ¬p ∣ N) :
    ∃ c : Finset ℕ → O, ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K) := sorry

-- SuggestedTameLevelIntegralTests.intrinsic_field_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,K)) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : K)^t.card * (η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))) * intrinsicTameZetaMeasure η hM hpM (f.comp (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTameLevelIntegralTests.intrinsic_field_same_prime_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (hs : N.primeFactors = M.primeFactors) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN = intrinsicTameZetaMeasure η hM hpM := sorry

-- SuggestedTameLevelIntegralTests.integral_measure_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (a : ZMod M → O) (ha : ∀ x, (a x : K) = η x) (f : C(ℤ_[p],O)) :
    integralTameMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod M)) * integralTameMeasure η hM hpM (f.comp (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTameLevelIntegralTests.integral_measure_mass_sum
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (a : ZMod M → O) (ha : ∀ x, (a x : K) = η x) :
    integralTameMeasure (η.changeLevel hMN) hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod M))) * integralTameMeasure η hM hpM 1 := sorry

-- SuggestedTameLevelIntegralTests.integral_measure_same_prime_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (hs : N.primeFactors = M.primeFactors) :
    integralTameMeasure (η.changeLevel hMN) hN hpN = integralTameMeasure η hM hpM := sorry

-- SuggestedTameLevelIntegralTests.integral_zeta_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K)) (f : C(ℤ_[p],O)) :
    integralTameZetaMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) * integralTameZetaMeasure η hM hpM (f.comp (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTameLevelIntegralTests.integral_zeta_mass_sum
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K)) :
    integralTameZetaMeasure (η.changeLevel hMN) hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t)) * integralTameZetaMeasure η hM hpM 1 := sorry

-- SuggestedTameLevelIntegralTests.integral_zeta_same_prime_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (hs : N.primeFactors = M.primeFactors) :
    integralTameZetaMeasure (η.changeLevel hMN) hN hpN = integralTameZetaMeasure η hM hpM := sorry

-- SuggestedTameLevelIntegralTests.intrinsic_integral_all_tests
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,O)) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) * intrinsicIntegralTameZetaMeasure η hM hpM (f.comp (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTameLevelIntegralTests.intrinsic_integral_mass_sum
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K)) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t)) * intrinsicIntegralTameZetaMeasure η hM hpM 1 := sorry

-- SuggestedTameLevelIntegralTests.intrinsic_integral_same_prime_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (hs : N.primeFactors = M.primeFactors) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN = intrinsicIntegralTameZetaMeasure η hM hpM := sorry

end SuggestedTameLevelIntegralTests

namespace DirichletPadic
section TamePrimitiveIntegral
variable {p N : ℕ} [Fact p.Prime] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

variable (η : DirichletCharacter K N)

local instance : NeZero η.conductor := ⟨η.conductor_ne_zero⟩

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "S" => N.primeFactors \ η.conductor.primeFactors

theorem intrinsicTameZetaMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicTameZetaMeasure η hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : K)^t.card * (η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))) • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ)) (intrinsicTameZetaMeasure η.primitiveCharacter hF hpF) := by
  have hη₀ : η.primitiveCharacter ≠ 1 := by
    intro h
    apply hη
    rw [← η.changeLevel_primitiveCharacter, h, map_one]
  have h := intrinsicTameZetaMeasure_changeLevel η.primitiveCharacter hη₀ η.conductor_dvd_level
    hF hN hpF hpN u hu
  simpa only [η.changeLevel_primitiveCharacter] using h

theorem integralTameMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (a : ZMod η.conductor → O) (ha : ∀ x, (a x : K) = η.primitiveCharacter x) :
    integralTameMeasure η hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod η.conductor)) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p])) (integralTameMeasure η.primitiveCharacter hF hpF) := by
  have hη₀ : η.primitiveCharacter ≠ 1 := by
    intro h
    apply hη
    rw [← η.changeLevel_primitiveCharacter, h, map_one]
  have h := integralTameMeasure_changeLevel η.primitiveCharacter hη₀ η.conductor_dvd_level
    hF hN hpF hpN a ha
  simpa only [η.changeLevel_primitiveCharacter] using h

theorem integralTameZetaMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K)) :
    integralTameZetaMeasure η hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) • AbstractMeasure.map
        (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p])) (integralTameZetaMeasure η.primitiveCharacter hF hpF) := by
  have hη₀ : η.primitiveCharacter ≠ 1 := by
    intro h
    apply hη
    rw [← η.changeLevel_primitiveCharacter, h, map_one]
  have h := integralTameZetaMeasure_changeLevel η.primitiveCharacter hη₀ η.conductor_dvd_level
    hF hN hpF hpN c hc
  simpa only [η.changeLevel_primitiveCharacter] using h

theorem intrinsicIntegralTameZetaMeasure_primitiveCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicIntegralTameZetaMeasure η hN hpN =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) • AbstractMeasure.map
        (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ)) (intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF) := by
  have hη₀ : η.primitiveCharacter ≠ 1 := by
    intro h
    apply hη
    rw [← η.changeLevel_primitiveCharacter, h, map_one]
  have h := intrinsicIntegralTameZetaMeasure_changeLevel η.primitiveCharacter hη₀ η.conductor_dvd_level
    hF hN hpF hpN c hc u hu
  simpa only [η.changeLevel_primitiveCharacter] using h

end TamePrimitiveIntegral

end DirichletPadic

namespace SuggestedTamePrimitiveIntegralTests
open DirichletPadic

variable {p N : ℕ} [Fact p.Prime] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

variable (η : DirichletCharacter K N)

local instance : NeZero η.conductor := ⟨η.conductor_ne_zero⟩

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

local notation "S" => N.primeFactors \ η.conductor.primeFactors

-- SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_all_tests
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,K)) :
    intrinsicTameZetaMeasure η hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : K)^t.card * (η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))) * intrinsicTameZetaMeasure η.primitiveCharacter hF hpF (f.comp (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_mass
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicTameZetaMeasure η hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : K)^t.card * (η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K)))) * intrinsicTameZetaMeasure η.primitiveCharacter hF hpF 1 := sorry

-- SuggestedTamePrimitiveIntegralTests.intrinsic_field_primitive_same_support
example (hη : η ≠ 1) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (hs : N.primeFactors = η.conductor.primeFactors) :
    intrinsicTameZetaMeasure η hN hpN = intrinsicTameZetaMeasure η.primitiveCharacter hF hpF := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_all_tests
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (a : ZMod η.conductor → O) (ha : ∀ x, (a x : K) = η.primitiveCharacter x) (f : C(ℤ_[p],O)) :
    integralTameMeasure η hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod η.conductor)) * integralTameMeasure η.primitiveCharacter hF hpF (f.comp (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_mass
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (a : ZMod η.conductor → O) (ha : ∀ x, (a x : K) = η.primitiveCharacter x) :
    integralTameMeasure η hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * a ((∏ q ∈ t, q : ℕ) : ZMod η.conductor))) * integralTameMeasure η.primitiveCharacter hF hpF 1 := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_measure_primitive_same_support
example (hη : η ≠ 1) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (hs : N.primeFactors = η.conductor.primeFactors) :
    integralTameMeasure η hN hpN = integralTameMeasure η.primitiveCharacter hF hpF := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_all_tests
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K)) (f : C(ℤ_[p],O)) :
    integralTameZetaMeasure η hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) * integralTameZetaMeasure η.primitiveCharacter hF hpF (f.comp (⟨fun x : ℤ_[p] => ((∏ q ∈ t, q : ℕ) : ℤ_[p])*x, by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))) := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_mass
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K)) :
    integralTameZetaMeasure η hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t)) * integralTameZetaMeasure η.primitiveCharacter hF hpF 1 := sorry

-- SuggestedTamePrimitiveIntegralTests.integral_zeta_primitive_same_support
example (hη : η ≠ 1) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (hs : N.primeFactors = η.conductor.primeFactors) :
    integralTameZetaMeasure η hN hpN = integralTameZetaMeasure η.primitiveCharacter hF hpF := sorry

-- SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_all_tests
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) (f : C((ℤ_[p])ˣ,O)) :
    intrinsicIntegralTameZetaMeasure η hN hpN f =
      ∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t) * intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF (f.comp (⟨fun x : (ℤ_[p])ˣ => (∏ q ∈ t, u q)*x, by fun_prop⟩ : C((ℤ_[p])ˣ,(ℤ_[p])ˣ))) := sorry

-- SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_mass
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (S).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ S, (u q : ℤ_[p]) = (q : ℤ_[p])) :
    intrinsicIntegralTameZetaMeasure η hN hpN 1 =
      (∑ t ∈ (S).powerset, ((-1 : O)^t.card * c t)) * intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF 1 := sorry

-- SuggestedTamePrimitiveIntegralTests.intrinsic_integral_primitive_same_support
example (hη : η ≠ 1) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (hs : N.primeFactors = η.conductor.primeFactors) :
    intrinsicIntegralTameZetaMeasure η hN hpN = intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF := sorry

-- SuggestedTamePrimitiveIntegralTests.primitive_constructor_certificates
example (hη : η ≠ 1) (hN : IsUnit (N : K)) (hpN : ¬p ∣ N) :
    η.conductor ≠ 0 ∧ IsUnit (η.conductor : K) ∧ ¬p ∣ η.conductor ∧ η.primitiveCharacter ≠ 1 := sorry

-- SuggestedTamePrimitiveIntegralTests.primitive_bad_prime_values
example (q : ℕ) (hq : q.Prime) (hqN : q ∣ N) (hqF : ¬q ∣ η.conductor) :
    η (q : ZMod N) = 0 ∧ η.primitiveCharacter (q : ZMod η.conductor) ≠ 0 := sorry

-- SuggestedTamePrimitiveIntegralTests.primitive_coefficient_families
example (hpN : ¬p ∣ N) :
    ∃ a : ZMod η.conductor → O, ∃ c : Finset ℕ → O,
    (∀ x, (a x : K) = η.primitiveCharacter x) ∧
    (∀ t ∈ (S).powerset, (c t : K) = η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) /
      ((∏ q ∈ t, q : ℕ) : K)) := sorry

end SuggestedTamePrimitiveIntegralTests

namespace DirichletPadic
section TameMomentLevel
variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem intrinsicTameZetaMeasure_changeLevel_arithmeticCharacter (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN (primePowerArithmeticCharacter p n χ w).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η ((q : ℕ) : ZMod M) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^w / (q : K))) * intrinsicTameZetaMeasure η hM hpM (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

theorem intrinsicIntegralTameZetaMeasure_changeLevel_arithmeticCharacter (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ M.primeFactors).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ M.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ w (u q))) * intrinsicIntegralTameZetaMeasure η hM hpM (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

end TameMomentLevel

section TamePrimitiveMoment
variable {p N : ℕ} [Fact p.Prime] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

variable (η : DirichletCharacter K N)

local instance : NeZero η.conductor := ⟨η.conductor_ne_zero⟩

theorem intrinsicTameZetaMeasure_primitiveCharacter_arithmeticCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    intrinsicTameZetaMeasure η hN hpN (primePowerArithmeticCharacter p n χ w).toContinuousMap =
      (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - η.primitiveCharacter ((q : ℕ) : ZMod η.conductor) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^w / (q : K))) * intrinsicTameZetaMeasure η.primitiveCharacter hF hpF (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

theorem intrinsicIntegralTameZetaMeasure_primitiveCharacter_arithmeticCharacter (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ η.conductor.primeFactors).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ η.conductor.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    intrinsicIntegralTameZetaMeasure η hN hpN (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap =
      (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ w (u q))) * intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

end TamePrimitiveMoment

end DirichletPadic

namespace SuggestedTameMomentLevelTests
open DirichletPadic

section Relative
variable {p M N : ℕ} [Fact p.Prime] [NeZero M] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

-- SuggestedTameMomentLevelTests.field_relative_weight_zero
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (n : ℕ) (χ : DirichletCharacter K (p^n))  :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN (primePowerArithmeticCharacter p n χ 0).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η ((q : ℕ) : ZMod M) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^0 / (q : K))) * intrinsicTameZetaMeasure η hM hpM (primePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.field_relative_same_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) (hs : N.primeFactors = M.primeFactors) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN (primePowerArithmeticCharacter p n χ w).toContinuousMap = intrinsicTameZetaMeasure η hM hpM (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.field_relative_positive_weight
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (k : ℕ) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN (primePowerArithmeticCharacter p n χ (k+1)).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η ((q : ℕ) : ZMod M) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^k)) * intrinsicTameZetaMeasure η hM hpM (primePowerArithmeticCharacter p n χ (k+1)).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_relative_weight_zero
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ M.primeFactors).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ M.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n))  :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ 0 (u q))) * intrinsicIntegralTameZetaMeasure η hM hpM (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_relative_same_support
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) (hs : N.primeFactors = M.primeFactors) :
    intrinsicIntegralTameZetaMeasure (η.changeLevel hMN) hN hpN (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap = intrinsicIntegralTameZetaMeasure η hM hpM (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_relative_factor_inclusion
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ M.primeFactors).powerset, (c t : K) =
      η ((∏ q ∈ t, q : ℕ) : ZMod M) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ M.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    (((∏ q ∈ N.primeFactors \ M.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ w (u q))) : O) : K) = (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η ((q : ℕ) : ZMod M) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^w / (q : K))) := sorry

-- SuggestedTameMomentLevelTests.field_relative_level_zero
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) (χ : DirichletCharacter K (p^0)) (w : ℕ) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN (primePowerArithmeticCharacter p 0 χ w).toContinuousMap =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η (q : ZMod M) * (q : K)^w / (q : K))) *
        intrinsicTameZetaMeasure η hM hpM (primePowerArithmeticCharacter p 0 χ w).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.field_relative_trivial_mass
example (η : DirichletCharacter K M) (hη : η ≠ 1) (hMN : M ∣ N)
    (hM : IsUnit (M : K)) (hN : IsUnit (N : K)) (hpM : ¬p ∣ M) (hpN : ¬p ∣ N) :
    intrinsicTameZetaMeasure (η.changeLevel hMN) hN hpN 1 =
      (∏ q ∈ N.primeFactors \ M.primeFactors, (1 - η (q : ZMod M) / (q : K))) *
        intrinsicTameZetaMeasure η hM hpM 1 := sorry

end Relative

section Primitive
variable {p N : ℕ} [Fact p.Prime] [NeZero N]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

variable (η : DirichletCharacter K N)

local instance : NeZero η.conductor := ⟨η.conductor_ne_zero⟩

-- SuggestedTameMomentLevelTests.field_primitive_weight_zero
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (n : ℕ) (χ : DirichletCharacter K (p^n))  :
    intrinsicTameZetaMeasure η hN hpN (primePowerArithmeticCharacter p n χ 0).toContinuousMap =
      (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - η.primitiveCharacter ((q : ℕ) : ZMod η.conductor) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^0 / (q : K))) * intrinsicTameZetaMeasure η.primitiveCharacter hF hpF (primePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.field_primitive_same_support
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) (hs : N.primeFactors = η.conductor.primeFactors) :
    intrinsicTameZetaMeasure η hN hpN (primePowerArithmeticCharacter p n χ w).toContinuousMap = intrinsicTameZetaMeasure η.primitiveCharacter hF hpF (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.field_primitive_positive_weight
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (k : ℕ) :
    intrinsicTameZetaMeasure η hN hpN (primePowerArithmeticCharacter p n χ (k+1)).toContinuousMap =
      (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - η.primitiveCharacter ((q : ℕ) : ZMod η.conductor) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^k)) * intrinsicTameZetaMeasure η.primitiveCharacter hF hpF (primePowerArithmeticCharacter p n χ (k+1)).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_primitive_weight_zero
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ η.conductor.primeFactors).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ η.conductor.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n))  :
    intrinsicIntegralTameZetaMeasure η hN hpN (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap =
      (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ 0 (u q))) * intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_primitive_same_support
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) (hs : N.primeFactors = η.conductor.primeFactors) :
    intrinsicIntegralTameZetaMeasure η hN hpN (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap = intrinsicIntegralTameZetaMeasure η.primitiveCharacter hF hpF (integralPrimePowerArithmeticCharacter p n χ w).toContinuousMap := sorry

-- SuggestedTameMomentLevelTests.integral_primitive_factor_inclusion
example (hη : η ≠ 1)
    (hN : IsUnit (N : K)) (hpN : ¬p ∣ N)
    (hF : IsUnit (η.conductor : K)) (hpF : ¬p ∣ η.conductor)
    (c : Finset ℕ → O)
    (hc : ∀ t ∈ (N.primeFactors \ η.conductor.primeFactors).powerset, (c t : K) =
      η.primitiveCharacter ((∏ q ∈ t, q : ℕ) : ZMod η.conductor) / ((∏ q ∈ t, q : ℕ) : K))
    (u : ℕ → (ℤ_[p])ˣ) (hu : ∀ q ∈ N.primeFactors \ η.conductor.primeFactors, (u q : ℤ_[p]) = (q : ℤ_[p]))
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (w : ℕ) :
    (((∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - c {q} * integralPrimePowerArithmeticCharacter p n χ w (u q))) : O) : K) = (∏ q ∈ N.primeFactors \ η.conductor.primeFactors, (1 - η.primitiveCharacter ((q : ℕ) : ZMod η.conductor) * χ ((q : ℕ) : ZMod (p^n)) * (q : K)^w / (q : K))) := sorry

end Primitive

-- SuggestedTameMomentLevelTests.dyadic_quadratic_new_prime
example (η : DirichletCharacter ℚ_[2] 3) (hη : η ≠ 1) (hη2 : η 2 = -1)
    (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ3 : χ 3 = -1)
    (h3 : IsUnit ((3 : ℕ) : ℚ_[2])) (h15 : IsUnit ((15 : ℕ) : ℚ_[2]))
    (hp3 : ¬2 ∣ 3) (hp15 : ¬2 ∣ 15) :
    intrinsicTameZetaMeasure (η.changeLevel (by decide : 3 ∣ 15)) h15 hp15
      (primePowerArithmeticCharacter 2 2 χ 0).toContinuousMap =
    (6/5 : ℚ_[2]) * intrinsicTameZetaMeasure η h3 hp3
      (primePowerArithmeticCharacter 2 2 χ 0).toContinuousMap := sorry

end SuggestedTameMomentLevelTests

namespace DirichletPadic
section TamePrimitiveGauss
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem tameGauss_norm (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    ‖gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)‖ = 1 := by sorry

theorem tameGauss_unit (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    ∃ u : Oˣ, ((u : O) : K) = gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) := by
  have hn := tameGauss_norm η hη hpD ε hε
  let g : O := ⟨gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one), by
    change ‖gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)‖₊ ≤ 1
    exact_mod_cast hn.le⟩
  have hu : IsUnit g := by
    apply (Valuation.Integers.isUnit_iff_valuation_eq_one
      (Valuation.integer.integers (NormedField.valuation (K := K)))).mpr
    change ‖gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)‖₊ = 1
    apply Subtype.ext
    exact hn
  refine ⟨hu.unit, ?_⟩
  rw [hu.unit_spec]

theorem tameSeries_eq_gauss_of_tame (η : DirichletCharacter K D)
    (hη : η.IsPrimitive) (hD : 1 < D) (hDK : IsUnit (D : K))
    (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    tameSeries η hDK = -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
      ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹ := by
  apply tameSeries_eq_gauss η hη hD hDK ε hε
  intro hzero
  have hn := tameGauss_norm η hη hpD ε hε
  rw [hzero, norm_zero] at hn
  exact zero_ne_one hn

theorem map_integralTameSeries_gauss_of_tame (η : DirichletCharacter K D)
    (hη : η.IsPrimitive) (hD : 1 < D) (hDK : IsUnit (D : K))
    (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    PowerSeries.map (O).subtype (integralTameSeries η hDK hpD) = -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
      ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹ := by
  rw [map_integralTameSeries]
  exact tameSeries_eq_gauss_of_tame η hη hD hDK hpD ε hε

end TamePrimitiveGauss

end DirichletPadic

namespace SuggestedPrimitiveGaussTests
open DirichletPadic

variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  {D : ℕ} [NeZero D]

local notation "O" => Valuation.integer (NormedField.valuation (K := K))

-- SuggestedPrimitiveGaussTests.gauss_nonzero
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0 := by sorry

-- SuggestedPrimitiveGaussTests.gauss_inverse_norm
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    ‖(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹‖ = 1 := by sorry

-- SuggestedPrimitiveGaussTests.gauss_modulus_one
example (ε : K) (hε : IsPrimitiveRoot ε 1) :
    gaussSum (1 : DirichletCharacter K 1) (AddChar.zmodChar 1 hε.pow_eq_one) = 1 := by sorry

-- SuggestedPrimitiveGaussTests.gauss_composite_norm
example (η : DirichletCharacter K 9) (hη : η.IsPrimitive) (hpD : ¬p ∣ 9) (ε : K) (hε : IsPrimitiveRoot ε 9) :
    ‖gaussSum η⁻¹ (AddChar.zmodChar 9 hε.pow_eq_one)‖ = 1 := by sorry

-- SuggestedPrimitiveGaussTests.gauss_dyadic_norm
example (η : DirichletCharacter K 3) (hη : η.IsPrimitive) (hp : p = 2) (ε : K) (hε : IsPrimitiveRoot ε 3) :
    ‖gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one)‖ = 1 := by sorry

-- SuggestedPrimitiveGaussTests.unit_inverse_coefficient
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (u : Oˣ) (hu : ((u : O) : K) = gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)) :
    (((u⁻¹ : Oˣ) : O) : K) = (gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ := by sorry

-- SuggestedPrimitiveGaussTests.unit_presentation_unique
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (u v : Oˣ) (hu : ((u : O) : K) = gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)) (hv : ((v : O) : K) = gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)) :
    u = v := by sorry

-- SuggestedPrimitiveGaussTests.unit_coefficient_product
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (u : Oˣ) (hu : ((u : O) : K) = gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)) :
    ((u : O) : K) * (((u⁻¹ : Oˣ) : O) : K) = 1 := by sorry

-- SuggestedPrimitiveGaussTests.series_gauss_mass
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (hD : 1 < D) (hDK : IsUnit (D : K)) :
    coeff 0 (tameSeries η hDK) = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ * ∑ a : ZMod D, η⁻¹ a / (ε^a.val-1) := by sorry

-- SuggestedPrimitiveGaussTests.series_gauss_positive_coefficient
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (hD : 1 < D) (hDK : IsUnit (D : K)) (n : ℕ) :
    coeff n (tameSeries η hDK) = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ * (-1 : K)^n * ∑ a : ZMod D, η⁻¹ a * (ε^a.val)^n / (ε^a.val-1)^(n+1) := by sorry

-- SuggestedPrimitiveGaussTests.series_quadratic_cubic
example (η : DirichletCharacter K 3) (hη : η.IsPrimitive) (hquad : η 2 = -1) (hDK : IsUnit (3 : K)) (hpD : ¬p ∣ 3) (ε : K) (hε : IsPrimitiveRoot ε 3) :
    coeff 3 (tameSeries η hDK) = 1/9 := by sorry

-- SuggestedPrimitiveGaussTests.integral_gauss_mass
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (hD : 1 < D) (hDK : IsUnit (D : K)) :
    ((coeff 0 (integralTameSeries η hDK hpD) : O) : K) = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ * ∑ a : ZMod D, η⁻¹ a / (ε^a.val-1) := by sorry

-- SuggestedPrimitiveGaussTests.integral_gauss_coefficients
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (hD : 1 < D) (hDK : IsUnit (D : K)) (n : ℕ) :
    ((coeff n (integralTameSeries η hDK hpD) : O) : K) = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ * (-1 : K)^n * ∑ a : ZMod D, η⁻¹ a * (ε^a.val)^n / (ε^a.val-1)^(n+1) := by sorry

-- SuggestedPrimitiveGaussTests.integral_gauss_root_independence
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) (hD : 1 < D) (hDK : IsUnit (D : K)) (δ : K) (hδ : IsPrimitiveRoot δ D) :
    -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹) *
      ∑ a : ZMod D, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹ = -C ((gaussSum η⁻¹ (AddChar.zmodChar D hδ.pow_eq_one))⁻¹) *
      ∑ a : ZMod D, C (η⁻¹ a) * (C (δ^a.val)*(1+X : K⟦X⟧)-1)⁻¹ := by sorry

-- SuggestedPrimitiveGaussTests.integral_series_map_coefficient
example (η : DirichletCharacter K D) (hDK : IsUnit (D : K)) (hpD : ¬p ∣ D) (n : ℕ) :
    coeff n (PowerSeries.map (O).subtype (integralTameSeries η hDK hpD)) = coeff n (tameSeries η hDK) := by sorry

-- SuggestedPrimitiveGaussTests.integral_series_map_level_one
example (η : DirichletCharacter K 1) (hDK : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) :
    PowerSeries.map (O).subtype (integralTameSeries η hDK hpD) = 0 := by sorry

-- SuggestedPrimitiveGaussTests.same_additive_gauss_parity
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hpD : ¬p ∣ D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    gaussSum η (AddChar.zmodChar D hε.pow_eq_one) * gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) = η (-1) * (D : K) := by sorry

-- SuggestedPrimitiveGaussTests.principal_composite_gauss_zero
example (ε : K) (hε : IsPrimitiveRoot ε 9) :
    gaussSum (1 : DirichletCharacter K 9) (AddChar.zmodChar 9 hε.pow_eq_one) = 0 := by sorry

end SuggestedPrimitiveGaussTests


/-! Primitive-conductor interpolation and its coefficient-general uniqueness boundary.
The requested PMIA separation theorem belongs to its owner; these are signatures. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators
section PrimitiveProduct
variable {E : Type*} [Field E] {p D : ℕ} [Fact p.Prime] [NeZero D]

lemma tameWildProduct_isPrimitive (n : ℕ)
    (η : DirichletCharacter E D) (χ : DirichletCharacter E (p^n))
    (hη : η.IsPrimitive) (hχ : χ.IsPrimitive) (hDM : D.Coprime (p^n)) :
    (η.changeLevel (D.dvd_mul_right (p^n)) *
      χ.changeLevel ((p^n).dvd_mul_left D)).IsPrimitive := by sorry

lemma tameWildProduct_primitive_eval_prime (n : ℕ)
    (η : DirichletCharacter E D) (χ : DirichletCharacter E (p^n))
    (hη : η.IsPrimitive) (hχ : χ.IsPrimitive) (hpD : ¬p∣D) :
    let θ : DirichletCharacter E (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    θ.primitiveCharacter (p : ZMod θ.conductor) = η (p : ZMod D)*χ (p : ZMod (p^n)) ∧
    (n=0 → θ.primitiveCharacter (p : ZMod θ.conductor)=η (p : ZMod D)) ∧
    (1≤n → θ.primitiveCharacter (p : ZMod θ.conductor)=0) := by sorry
end PrimitiveProduct

section PrimitiveIntegral
variable {p D : ℕ} [Fact p.Prime] [NeZero D]
variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K] [CharZero K] [Algebra ℚ K]
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "U" => (ℤ_[p])ˣ

theorem intrinsicIntegralTameZetaMeasure_primitive_interpolation
    {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D)
    (hη : η.IsPrimitive) (hχ : χ.IsPrimitive) (hDgt : 1<D)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (k : ℕ) (hk : 1≤k) :
    let θ : DirichletCharacter E (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let v : E := θ.primitiveCharacter (p : ZMod θ.conductor)
    let b : E := (1-v*(p : E)^(k-1)) *
      (-((D*p^n : ℕ) : E)^(k-1)/k * ∑ a : ZMod (D*p^n), θ a *
        algebraMap ℚ E ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-ιC v*(p : ℂ)^(k-1)) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (1-(k : ℂ)) ∧
    ιK b = (intrinsicIntegralTameZetaMeasure (η.ringHomComp ιK) hD hpD
      (integralPrimePowerArithmeticCharacter p n (χ.ringHomComp ιK) k).toContinuousMap : K) ∧
    ιK b ∈ O := by sorry

/-- Uses the precisely requested PMIA L2 separation theorem for O-valued measures.
The Z_p-coefficient L3 statement alone does not prove this signature. -/
theorem intrinsicIntegralTameZetaMeasure_unique_positive_moments
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (ν : D(U,O))
    (hν : ∀ k : ℕ, 1≤k →
      ν (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) k).toContinuousMap =
      intrinsicIntegralTameZetaMeasure η hD hpD
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) k).toContinuousMap) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := by sorry
end PrimitiveIntegral

namespace SuggestedPrimitiveInterpolationTests
section CharacterTests
variable {E : Type*} [Field E]
-- quadratic_product_conductor
example (η : DirichletCharacter E 3) (χ : DirichletCharacter E 4)
    (hη : η.IsPrimitive) (hχ : χ.IsPrimitive) :
    (η.changeLevel (by decide : 3∣12) * χ.changeLevel (by decide : 4∣12)).conductor=12 := by sorry
-- zero_level_product
example {D : ℕ} [NeZero D] (η : DirichletCharacter E D) (hη : η.IsPrimitive) :
    (η.changeLevel (D.dvd_mul_right 1) *
      (1 : DirichletCharacter E 1).changeLevel (one_dvd (D*1))).conductor=D := by sorry
-- overlapping_conductors_fail
example (η : DirichletCharacter E 3) (hη : η 2 = -1) (hηsq : η*η=1) :
    (η*η).conductor=1 := by sorry
-- principal_inflation_changes_euler_value
example (η : DirichletCharacter E 3) (hη : η.IsPrimitive) (hη2 : η 2 = -1) :
    let θ := η.changeLevel (by decide : 3∣6)
    θ (2 : ZMod 6)=0 ∧ θ.primitiveCharacter (2 : ZMod θ.conductor)=-1 := by sorry
end CharacterTests
section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)
include hη
-- dyadic_trivial_wild_first_value
example :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap : ℚ_[2])=2/3 := by sorry
-- quadratic_wild_weight_two
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 2).toContinuousMap : ℚ_[2])=-2 := by sorry
-- quadratic_wild_weight_four
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 4).toContinuousMap : ℚ_[2])=46 := by sorry
end Dyadic
section EvenWeights
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K] [CharZero K]
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "U" => (ℤ_[p])ˣ
-- even_weights_insufficient
example :
    let δ : D(U,O) := AbstractMeasure.dirac 1-AbstractMeasure.dirac (-1)
    δ≠0 ∧ ∀ k : ℕ, δ (integralPrimePowerArithmeticCharacter p 0
      (1 : DirichletCharacter K (p^0)) (2*k)).toContinuousMap=0 := by sorry
end EvenWeights
end SuggestedPrimitiveInterpolationTests
end
end DirichletPadic
