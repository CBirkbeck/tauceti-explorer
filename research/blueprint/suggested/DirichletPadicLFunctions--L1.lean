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
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
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

/-!
# Dirichlet L1: The smoothed measure and Kubota–Leopoldt

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures and examples suggest names and types for review;
all implementation statuses remain unchecked.

Inherited L1 declarations are projected from the combined source. Generic
measure and pseudomeasure operations remain imported from PMIA. The current
PMIA prototype has no matching authenticated compiled module available; the
full file is NOT COMPILED. Missing completed-algebra comparison carriers are
recorded explicitly, not replaced by fabricated structures or Prop fields.
-/
noncomputable section
open scoped PowerSeries AbstractMeasure

open PowerSeries

namespace DirichletPadic
variable (R : Type*) [CommRing R]

def smoothingDenominator (a : ℕ) : R⟦X⟧ :=
  PowerSeries.mk fun n => (a.choose (n + 1) : R)

theorem coeff_smoothingDenominator (a n : ℕ) :
    coeff n (smoothingDenominator R a) = (a.choose (n + 1) : R) := sorry

theorem constantCoeff_smoothingDenominator (a : ℕ) :
    constantCoeff (smoothingDenominator R a) = (a : R) := sorry

theorem X_mul_smoothingDenominator (a : ℕ) :
    X * smoothingDenominator R a = (1 + X : R⟦X⟧) ^ a - 1 := sorry

theorem smoothingDenominator_isUnit (a : ℕ) (ha : IsUnit (a : R)) :
    IsUnit (smoothingDenominator R a) := sorry

theorem smoothingDenominator_map {S : Type*} [CommRing S] (f : R →+* S) (a : ℕ) :
    PowerSeries.map f (smoothingDenominator R a) = smoothingDenominator S a := sorry

def smoothedSeries (a : ℕ) (ha : IsUnit (a : R)) : R⟦X⟧ :=
  (PowerSeries.mk fun n => (a.choose (n + 2) : R)) *
    PowerSeries.invOfUnit (smoothingDenominator R a) ha.unit

theorem smoothingDenominator_mul_smoothedSeries (a : ℕ) (ha : IsUnit (a : R)) :
    smoothingDenominator R a * smoothedSeries R a ha =
      PowerSeries.mk (fun n => (a.choose (n + 2) : R)) := sorry

theorem X_mul_smoothingDenominator_mul_smoothedSeries (a : ℕ) (ha : IsUnit (a : R)) :
    X * smoothingDenominator R a * smoothedSeries R a ha =
      smoothingDenominator R a - C (a : R) := sorry

theorem smoothedSeries_unique (a : ℕ) (ha : IsUnit (a : R)) (F : R⟦X⟧)
    (hF : X * smoothingDenominator R a * F = smoothingDenominator R a - C (a : R)) :
    F = smoothedSeries R a ha := sorry

theorem constantCoeff_smoothedSeries (a : ℕ) (ha : IsUnit (a : R)) :
    constantCoeff (smoothedSeries R a ha) = (a.choose 2 : R) * ↑ha.unit⁻¹ := sorry

theorem coeff_smoothedSeries_recurrence (a n : ℕ) (ha : IsUnit (a : R)) :
    (a : R) * coeff n (smoothedSeries R a ha) = (a.choose (n + 2) : R) -
      ∑ i ∈ Finset.range n,
        (a.choose (n - i + 1) : R) * coeff i (smoothedSeries R a ha) := sorry

theorem smoothedSeries_map {S : Type*} [CommRing S] (f : R →+* S)
    (a : ℕ) (ha : IsUnit (a : R)) (haS : IsUnit (a : S)) :
    PowerSeries.map f (smoothedSeries R a ha) = smoothedSeries S a haS := sorry

theorem smoothedSeries_one (h : IsUnit ((1 : ℕ) : R)) : smoothedSeries R 1 h = 0 := sorry

theorem smoothedSeries_fraction_formula (a : ℕ) (ha : IsUnit (a : R))
    {K : Type*} [Field K] (f : R⟦X⟧ →+* K) (hX : f X ≠ 0) :
    f (smoothedSeries R a ha) = 1 / f X - (a : K) / ((1 + f X) ^ a - 1) := sorry

section BernoulliComparison
variable [Algebra ℚ R]

theorem exp_sub_one_mul_smoothingDenominator_subst (a : ℕ) :
    (PowerSeries.exp R - 1) *
        (smoothingDenominator R a).subst (PowerSeries.exp R - 1) =
      PowerSeries.exp R ^ a - 1 := sorry

theorem bernoulli_mul_smoothingDenominator_subst (a : ℕ) :
    PowerSeries.rescale (a : R) (bernoulliPowerSeries R) *
        (smoothingDenominator R a).subst (PowerSeries.exp R - 1) =
      C (a : R) * bernoulliPowerSeries R := sorry

theorem X_mul_smoothedSeries_subst_exp (a : ℕ) (ha : IsUnit (a : R)) :
    X * (smoothedSeries R a ha).subst (PowerSeries.exp R - 1) =
      bernoulliPowerSeries R -
        PowerSeries.rescale (a : R) (bernoulliPowerSeries R) := sorry

theorem factorial_mul_coeff_smoothedSeries_subst_exp (a k : ℕ) (ha : IsUnit (a : R)) :
    (k.factorial : R) * coeff k ((smoothedSeries R a ha).subst (PowerSeries.exp R - 1)) =
      algebraMap ℚ R ((1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) := sorry

end BernoulliComparison

variable (p : ℕ) [Fact p.Prime]

def smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) : D(ℤ_[p], ℤ_[p]) := sorry

theorem amice_smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    (smoothedMeasure p a ha).amiceTransform = smoothedSeries ℤ_[p] a hu := sorry

theorem smoothedMeasure_mahler (a n : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    smoothedMeasure p a ha (mahler n : C(ℤ_[p], ℤ_[p])) =
      coeff n (smoothedSeries ℤ_[p] a hu) := sorry

theorem smoothedMeasure_unique (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p]))
    (μ : D(ℤ_[p], ℤ_[p])) (hμ : μ.amiceTransform = smoothedSeries ℤ_[p] a hu) :
    μ = smoothedMeasure p a ha := sorry

theorem smoothedMeasure_moment (a k : ℕ) (ha : ¬ p ∣ a) :
    (smoothedMeasure p a ha ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      algebraMap ℚ ℚ_[p]
        ((1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) := sorry

theorem smoothedBernoulli_mem_padicInt (a k : ℕ) (ha : ¬ p ∣ a) :
    ∃ z : ℤ_[p], (z : ℚ_[p]) = algebraMap ℚ ℚ_[p]
      ((1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) := sorry

end DirichletPadic

namespace SuggestedTests
open DirichletPadic

-- SuggestedTests.denominator_zero
example : smoothingDenominator ℤ 0 = 0 := sorry

-- SuggestedTests.denominator_one
example : smoothingDenominator ℤ 1 = 1 := sorry

-- SuggestedTests.denominator_two
example : smoothingDenominator ℤ 2 = C 2 + X := sorry

-- SuggestedTests.series_one
example (h : IsUnit (1 : ℚ)) : smoothedSeries ℚ 1 h = 0 := sorry

-- SuggestedTests.series_two_sign
example (h : IsUnit (2 : ℚ)) :
    constantCoeff (smoothedSeries ℚ 2 h) = 1/2 ∧
      coeff 1 (smoothedSeries ℚ 2 h) = -1/4 := sorry

-- SuggestedTests.series_three_dyadic
example (h : IsUnit (3 : ℤ_[2])) :
    constantCoeff (smoothedSeries ℤ_[2] 3 h) = 1 := sorry

-- SuggestedTests.measure_one
example (h : ¬ 3 ∣ 1) : smoothedMeasure 3 1 h = 0 := sorry

-- SuggestedTests.measure_two_mass
example (h : ¬ 3 ∣ 2) :
    2 * smoothedMeasure 3 2 h (mahler 0 : C(ℤ_[3], ℤ_[3])) = 1 := sorry

-- SuggestedTests.measure_dyadic_mass
example (h : ¬ 2 ∣ 3) :
    smoothedMeasure 2 3 h (mahler 0 : C(ℤ_[2], ℤ_[2])) = 1 := sorry

-- SuggestedTests.series_exp_one
example (h : IsUnit (1 : ℚ)) :
    (smoothedSeries ℚ 1 h).subst (PowerSeries.exp ℚ - 1) = 0 := sorry

-- SuggestedTests.series_exp_two
example (h : IsUnit (2 : ℚ)) :
    coeff 0 ((smoothedSeries ℚ 2 h).subst (PowerSeries.exp ℚ - 1)) = 1/2 ∧
    coeff 1 ((smoothedSeries ℚ 2 h).subst (PowerSeries.exp ℚ - 1)) = -1/4 ∧
    coeff 2 ((smoothedSeries ℚ 2 h).subst (PowerSeries.exp ℚ - 1)) = 0 := sorry

-- SuggestedTests.series_exp_factorial
example (h : IsUnit (2 : ℚ)) :
    coeff 3 ((smoothedSeries ℚ 2 h).subst (PowerSeries.exp ℚ - 1)) = 1/48 := sorry

-- SuggestedTests.moment_zero_sign
example (h : ¬ 3 ∣ 2) :
    (smoothedMeasure 3 2 h ((ContinuousMap.id ℤ_[3]) ^ 0) : ℚ_[3]) = 1/2 := sorry

-- SuggestedTests.moment_one_dyadic
example (h : ¬ 2 ∣ 3) :
    (smoothedMeasure 2 3 h (ContinuousMap.id ℤ_[2]) : ℚ_[2]) = -2/3 := sorry

-- SuggestedTests.moment_two_not_mahler
example (h : ¬ 3 ∣ 2) :
    (smoothedMeasure 3 2 h ((ContinuousMap.id ℤ_[3]) ^ 2) : ℚ_[3]) = 0 := sorry

-- SuggestedTests.moment_three_factorial
example (h : ¬ 3 ∣ 2) :
    (smoothedMeasure 3 2 h ((ContinuousMap.id ℤ_[3]) ^ 3) : ℚ_[3]) = 1/8 := sorry

end SuggestedTests

namespace DirichletPadic
open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

theorem smoothed_rational_average {K : Type*} [Field K] [CharZero K]
    (ζ y : K) (hζ : IsPrimitiveRoot ζ p) (a : ℕ) (ha : ¬ p ∣ a)
    (hy : y ^ p ≠ 1) (hya : y ^ (p * a) ≠ 1) :
    (∑ i ∈ Finset.range p, (1 / (ζ ^ i * y - 1) -
      (a : K) / ((ζ ^ i * y) ^ a - 1))) =
      (p : K) * (1 / (y ^ p - 1) - (a : K) / (y ^ (p * a) - 1)) := sorry

theorem phi_psi_smoothedSeries (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    (AbstractMeasure.psiSeries p (smoothedSeries ℤ_[p] a hu)).subst
        ((1 + X : ℤ_[p]⟦X⟧) ^ p - 1) =
      (smoothedSeries ℤ_[p] a hu).subst ((1 + X : ℤ_[p]⟦X⟧) ^ p - 1) := sorry

theorem psi_smoothedSeries (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    AbstractMeasure.psiSeries p (smoothedSeries ℤ_[p] a hu) =
      smoothedSeries ℤ_[p] a hu := sorry

theorem psi_smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) :
    psiMeasure p ℤ_[p] (smoothedMeasure p a ha) = smoothedMeasure p a ha := sorry

theorem smoothedMeasure_one (ha : ¬ p ∣ 1) : smoothedMeasure p 1 ha = 0 := sorry

def unitSmoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) : D(ℤ_[p], ℤ_[p]) :=
  unitRestriction p ℤ_[p] (smoothedMeasure p a ha)

theorem unitSmoothedMeasure_eq (a : ℕ) (ha : ¬ p ∣ a) :
    unitSmoothedMeasure p a ha = unitRestriction p ℤ_[p] (smoothedMeasure p a ha) := sorry

theorem unitSmoothedMeasure_supported (a : ℕ) (ha : ¬ p ∣ a) :
    unitRestriction p ℤ_[p] (unitSmoothedMeasure p a ha) = unitSmoothedMeasure p a ha := sorry

theorem unitSmoothedMeasure_eq_sub_phi (a : ℕ) (ha : ¬ p ∣ a) :
    unitSmoothedMeasure p a ha = smoothedMeasure p a ha -
      phiMeasure p ℤ_[p] (smoothedMeasure p a ha) := sorry

theorem unitSmoothedMeasure_euler (a k : ℕ) (ha : ¬ p ∣ a) :
    unitSmoothedMeasure p a ha ((ContinuousMap.id ℤ_[p]) ^ k) =
      (1 - (p : ℤ_[p]) ^ k) * smoothedMeasure p a ha ((ContinuousMap.id ℤ_[p]) ^ k) := sorry

theorem unitSmoothedMeasure_moment (a k : ℕ) (ha : ¬ p ∣ a) :
    (unitSmoothedMeasure p a ha ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      algebraMap ℚ ℚ_[p] ((1 - (p : ℚ) ^ k) *
        (1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) := sorry

theorem unitSmoothedMeasure_mass (a : ℕ) (ha : ¬ p ∣ a) :
    unitSmoothedMeasure p a ha 1 = 0 := sorry

theorem unitSmoothedBernoulli_mem_padicInt (a k : ℕ) (ha : ¬ p ∣ a) :
    ∃ z : ℤ_[p], (z : ℚ_[p]) = algebraMap ℚ ℚ_[p] ((1 - (p : ℚ) ^ k) *
      (1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) := sorry

theorem unitSmoothedMeasure_one (ha : ¬ p ∣ 1) : unitSmoothedMeasure p 1 ha = 0 := sorry

def smoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) : D(ℤ_[p], ℤ_[p]) :=
  inverseWeight p (smoothedMeasure p a ha)

theorem smoothedNumerator_eq_inverse_restriction (a : ℕ) (ha : ¬ p ∣ a) :
    smoothedNumerator p a ha = inverseWeight p (unitSmoothedMeasure p a ha) := sorry

theorem smoothedNumerator_apply (a : ℕ) (ha : ¬ p ∣ a) (f : C(ℤ_[p], ℤ_[p])) :
    smoothedNumerator p a ha f = smoothedMeasure p a ha
      ((⟨PadicInt.inv, PadicInt.continuous_inv⟩ : C(ℤ_[p], ℤ_[p])) * f) := sorry

theorem smoothedNumerator_supported (a : ℕ) (ha : ¬ p ∣ a) :
    unitRestriction p ℤ_[p] (smoothedNumerator p a ha) = smoothedNumerator p a ha := sorry

theorem weight_smoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    weight (ContinuousMap.id ℤ_[p]) (smoothedNumerator p a ha) = unitSmoothedMeasure p a ha := sorry

theorem smoothedNumerator_unique (a : ℕ) (ha : ¬ p ∣ a) (ν : D(ℤ_[p], ℤ_[p]))
    (hν : unitRestriction p ℤ_[p] ν = ν)
    (hw : weight (ContinuousMap.id ℤ_[p]) ν = unitSmoothedMeasure p a ha) :
    ν = smoothedNumerator p a ha := sorry

theorem smoothedNumerator_moment_shift (a k : ℕ) (ha : ¬ p ∣ a) :
    smoothedNumerator p a ha ((ContinuousMap.id ℤ_[p]) ^ (k + 1)) =
      unitSmoothedMeasure p a ha ((ContinuousMap.id ℤ_[p]) ^ k) := sorry

theorem smoothedNumerator_moment (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    (smoothedNumerator p a ha ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      algebraMap ℚ ℚ_[p] ((1 - (p : ℚ) ^ (k - 1)) *
        (1 - (a : ℚ) ^ k) * bernoulli k / k) := sorry

theorem smoothedNumeratorBernoulli_mem_padicInt (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    ∃ z : ℤ_[p], (z : ℚ_[p]) = algebraMap ℚ ℚ_[p] ((1 - (p : ℚ) ^ (k - 1)) *
      (1 - (a : ℚ) ^ k) * bernoulli k / k) := sorry

theorem amice_smoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    (smoothedNumerator p a ha).amiceTransform =
      inverseMahler p (smoothedSeries ℤ_[p] a hu) := sorry

theorem smoothedNumerator_one (ha : ¬ p ∣ 1) : smoothedNumerator p 1 ha = 0 := sorry

end DirichletPadic

namespace SuggestedTests
open DirichletPadic AbstractMeasure

-- SuggestedTests.unit_smoothing_mass
example (h : ¬ 3 ∣ 2) : unitSmoothedMeasure 3 2 h 1 = 0 := sorry

-- SuggestedTests.unit_smoothing_first_moment
example (h : ¬ 3 ∣ 2) :
    (unitSmoothedMeasure 3 2 h (ContinuousMap.id ℤ_[3]) : ℚ_[3]) = 1/2 := sorry

-- SuggestedTests.unit_smoothing_dyadic
example (h : ¬ 2 ∣ 3) :
    (unitSmoothedMeasure 2 3 h (ContinuousMap.id ℤ_[2]) : ℚ_[2]) = 2/3 := sorry

-- SuggestedTests.unit_smoothing_one
example (h : ¬ 3 ∣ 1) : unitSmoothedMeasure 3 1 h = 0 := sorry

-- SuggestedTests.numerator_endpoint
example (h : ¬ 3 ∣ 2) : smoothedNumerator 3 2 h (ContinuousMap.id ℤ_[3]) = 0 := sorry

-- SuggestedTests.numerator_second_moment
example (h : ¬ 3 ∣ 2) :
    (smoothedNumerator 3 2 h ((ContinuousMap.id ℤ_[3]) ^ 2) : ℚ_[3]) = 1/2 := sorry

-- SuggestedTests.numerator_dyadic
example (h : ¬ 2 ∣ 3) :
    (smoothedNumerator 2 3 h ((ContinuousMap.id ℤ_[2]) ^ 2) : ℚ_[2]) = 2/3 := sorry

-- SuggestedTests.numerator_one
example (h : ¬ 3 ∣ 1) : smoothedNumerator 3 1 h = 0 := sorry

-- SuggestedTests.numerator_not_unit_measure
example (h : ¬ 3 ∣ 2) : smoothedNumerator 3 2 h ≠ unitSmoothedMeasure 3 2 h := sorry

end SuggestedTests

namespace DirichletPadic
section SmoothingRelations
variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

theorem smoothedMeasure_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a * b) :
    smoothedMeasure p (a * b) hab = smoothedMeasure p a ha +
      (a : Z) • AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p b hb) := sorry

theorem smoothedMeasure_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) :
    (b : Z) • AbstractMeasure.map
        ⟨fun z : Z => (b : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p a ha) - smoothedMeasure p a ha =
    (a : Z) • AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p b hb) - smoothedMeasure p b hb := sorry

theorem smoothedMeasure_reflection (a : ℕ) (ha : ¬ p ∣ a) :
    smoothedMeasure p a ha +
      AbstractMeasure.map ⟨fun z : Z => -z, continuous_neg⟩ (smoothedMeasure p a ha) =
        ((a : Z) - 1) • AbstractMeasure.dirac Z 0 := sorry

theorem smoothedNumerator_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a * b) :
    smoothedNumerator p (a * b) hab = smoothedNumerator p a ha +
      AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p b hb) := sorry

theorem smoothedNumerator_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) :
    AbstractMeasure.map
        ⟨fun z : Z => (b : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p a ha) - smoothedNumerator p a ha =
    AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p b hb) - smoothedNumerator p b hb := sorry

theorem smoothedNumerator_even (a : ℕ) (ha : ¬ p ∣ a) :
    AbstractMeasure.map ⟨fun z : Z => -z, continuous_neg⟩
      (smoothedNumerator p a ha) = smoothedNumerator p a ha := sorry

end SmoothingRelations

end DirichletPadic

namespace SuggestedSmoothingTests
open DirichletPadic

open scoped AbstractMeasure

-- SuggestedSmoothingTests.measure_product_odd
example (h2 : ¬ 3 ∣ 2) (h4 : ¬ 3 ∣ 4) :
    smoothedMeasure 3 4 h4 = smoothedMeasure 3 2 h2 +
      (2 : ℤ_[3]) • AbstractMeasure.map
        ⟨fun z : ℤ_[3] => 2 * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure 3 2 h2) := sorry

-- SuggestedSmoothingTests.measure_product_dyadic
example (h3 : ¬ 2 ∣ 3) (h5 : ¬ 2 ∣ 5) (h15 : ¬ 2 ∣ 15) :
    smoothedMeasure 2 15 h15 = smoothedMeasure 2 3 h3 +
      (3 : ℤ_[2]) • AbstractMeasure.map
        ⟨fun z : ℤ_[2] => 3 * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure 2 5 h5) := sorry

-- SuggestedSmoothingTests.reflection_zero_atom
example (h2 : ¬ 3 ∣ 2) :
    smoothedMeasure 3 2 h2 + AbstractMeasure.map
      ⟨fun z : ℤ_[3] => -z, continuous_neg⟩ (smoothedMeasure 3 2 h2) =
        AbstractMeasure.dirac ℤ_[3] 0 := sorry

-- SuggestedSmoothingTests.reflection_dyadic
example (h3 : ¬ 2 ∣ 3) :
    smoothedMeasure 2 3 h3 + AbstractMeasure.map
      ⟨fun z : ℤ_[2] => -z, continuous_neg⟩ (smoothedMeasure 2 3 h3) =
        (2 : ℤ_[2]) • AbstractMeasure.dirac ℤ_[2] 0 := sorry

-- SuggestedSmoothingTests.numerator_product_scalar
example (h2 : ¬ 3 ∣ 2) (h4 : ¬ 3 ∣ 4) :
    smoothedNumerator 3 4 h4 =
      smoothedNumerator 3 2 h2 +
        AbstractMeasure.map
          ⟨fun z : ℤ_[3] => 2 * z, continuous_const.mul continuous_id⟩
          (smoothedNumerator 3 2 h2) := sorry

-- SuggestedSmoothingTests.cross_smoothing_second_moment
example (h2 : ¬ 3 ∣ 2) (h4 : ¬ 3 ∣ 4) :
    (15 : ℤ_[3]) * smoothedNumerator 3 2 h2
      ((ContinuousMap.id ℤ_[3]) ^ 2) =
    3 * smoothedNumerator 3 4 h4
      ((ContinuousMap.id ℤ_[3]) ^ 2) := sorry

-- SuggestedSmoothingTests.even_dyadic_numerator
example (h3 : ¬ 2 ∣ 3) :
    AbstractMeasure.map ⟨fun z : ℤ_[2] => -z, continuous_neg⟩
      (smoothedNumerator 2 3 h3) =
        smoothedNumerator 2 3 h3 := sorry

end SuggestedSmoothingTests

noncomputable section
namespace DirichletPadic
noncomputable section
open PowerSeries

theorem constantCoeff_iterate_mahler_smoothedSeries (R : Type*) [CommRing R] [Algebra ℚ R]
    (a k : ℕ) (ha : IsUnit (a : R)) :
    constantCoeff ((PowerSeries.mahlerDerivation R)^[k] (smoothedSeries R a ha)) =
      algebraMap ℚ R ((1-(a:ℚ)^(k+1))*bernoulli (k+1)/(k+1)) := by sorry

theorem smoothedMeasure_moment_eq_formal (p : ℕ) [Fact p.Prime]
    (a k : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℚ)) :
    (smoothedMeasure p a ha ((ContinuousMap.id ℤ_[p])^k) : ℚ_[p]) =
      algebraMap ℚ ℚ_[p] (constantCoeff
        ((PowerSeries.mahlerDerivation ℚ)^[k] (smoothedSeries ℚ a hu))) := by sorry

-- SuggestedSmoothedJetTests.one_parameter
example (k : ℕ) (hu : IsUnit (1:ℚ)) :
    constantCoeff ((PowerSeries.mahlerDerivation ℚ)^[k] (smoothedSeries ℚ 1 hu)) = 0 := by sorry

-- SuggestedSmoothedJetTests.two_third
example (hu : IsUnit (2:ℚ)) :
    constantCoeff ((PowerSeries.mahlerDerivation ℚ)^[3] (smoothedSeries ℚ 2 hu)) = 1/8 := by sorry

-- SuggestedSmoothedJetTests.three_first
example (hu : IsUnit (3:ℚ)) :
    constantCoeff (PowerSeries.mahlerDerivation ℚ (smoothedSeries ℚ 3 hu)) = -2/3 := by sorry

-- SuggestedSmoothedJetTests.dyadic_common_value
example (hu : IsUnit (3:ℚ)) :
    (smoothedMeasure 2 3 (by norm_num) (ContinuousMap.id ℤ_[2]) : ℚ_[2]) =
      algebraMap ℚ ℚ_[2] (constantCoeff (PowerSeries.mahlerDerivation ℚ (smoothedSeries ℚ 3 hu))) ∧
    algebraMap ℚ ℚ_[2] (constantCoeff (PowerSeries.mahlerDerivation ℚ (smoothedSeries ℚ 3 hu))) = -2/3 := by sorry

end

end DirichletPadic

namespace DirichletPadic
noncomputable section
open AbstractMeasure PowerSeries

section GeneralArithmeticExtension
variable {p : ℕ} [Fact p.Prime] {R : Type*}
  [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
  [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]

theorem amice_extend_smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : R)) :
    (extendIntegralCoefficients (R := R) (smoothedMeasure p a ha)).amiceTransform =
      smoothedSeries R a hu := by sorry

theorem smoothedMeasure_extension_unique (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : R))
    (η : D(ℤ_[p],R)) (hη : η.amiceTransform = smoothedSeries R a hu) :
    η = extendIntegralCoefficients (R := R) (smoothedMeasure p a ha) := by sorry

end GeneralArithmeticExtension

section RationalArithmeticExtension
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

theorem smoothedMeasure_extension_integral_descent (a : ℕ) (ha : ¬ p ∣ a)
    (hu : IsUnit (a : ℚ_[p])) (η : D(ℤ_[p],ℚ_[p]))
    (hη : η.amiceTransform = smoothedSeries ℚ_[p] a hu) :
    ∃! μ : D(ℤ_[p],ℤ_[p]), extendIntegralCoefficients (R := ℚ_[p]) μ = η := by sorry

theorem extend_smoothedMeasure_moment (a k : ℕ) (ha : ¬ p ∣ a) :
    extendIntegralCoefficients (R := ℚ_[p]) (smoothedMeasure p a ha)
      ((ContinuousMap.id ℤ_[p])^k • (1 : C(ℤ_[p],ℚ_[p]))) =
      algebraMap ℚ ℚ_[p] ((1-(a:ℚ)^(k+1))*bernoulli (k+1)/(k+1)) := by sorry

theorem extend_unitSmoothedMeasure_moment (a k : ℕ) (ha : ¬ p ∣ a) :
    extendIntegralCoefficients (R := ℚ_[p]) (unitSmoothedMeasure p a ha)
      ((ContinuousMap.id ℤ_[p])^k • (1 : C(ℤ_[p],ℚ_[p]))) =
      algebraMap ℚ ℚ_[p] ((1-(p:ℚ)^k)*(1-(a:ℚ)^(k+1))*bernoulli (k+1)/(k+1)) := by sorry

theorem extend_smoothedNumerator_moment (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    extendIntegralCoefficients (R := ℚ_[p]) (smoothedNumerator p a ha)
      ((ContinuousMap.id ℤ_[p])^k • (1 : C(ℤ_[p],ℚ_[p]))) =
      algebraMap ℚ ℚ_[p] ((1-(p:ℚ)^(k-1))*(1-(a:ℚ)^k)*bernoulli k/k) := by sorry

end RationalArithmeticExtension

variable [IsBoundedSMul ℤ_[2] ℚ_[2]] [IsBoundedSMul ℤ_[3] ℚ_[3]]

-- SuggestedArithmeticExtensionTests.one_parameter
example : extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 1 (by norm_num)) = 0 := by sorry

-- SuggestedArithmeticExtensionTests.two_amice_coefficients
example : let F := (extendIntegralCoefficients (R := ℚ_[3])
    (smoothedMeasure 3 2 (by norm_num))).amiceTransform
    constantCoeff F = 1/2 ∧ coeff 1 F = -1/4 := by sorry

-- SuggestedArithmeticExtensionTests.dyadic_first
example : extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 3 (by norm_num))
    ((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],ℚ_[2]))) = -2/3 := by sorry

-- SuggestedArithmeticExtensionTests.dyadic_unit_first
example : extendIntegralCoefficients (R := ℚ_[2]) (unitSmoothedMeasure 2 3 (by norm_num))
    ((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],ℚ_[2]))) = 2/3 := by sorry

-- SuggestedArithmeticExtensionTests.numerator_endpoint
example : extendIntegralCoefficients (R := ℚ_[3]) (smoothedNumerator 3 2 (by norm_num))
    ((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],ℚ_[3]))) = 0 := by sorry

-- SuggestedArithmeticExtensionTests.dyadic_numerator_second
example : extendIntegralCoefficients (R := ℚ_[2]) (smoothedNumerator 2 3 (by norm_num))
    ((ContinuousMap.id ℤ_[2])^2 • (1 : C(ℤ_[2],ℚ_[2]))) = 2/3 := by sorry

end

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => (ℤ_[p])ˣ

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, Z))

noncomputable def intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) : D(U, Z) := sorry

theorem intrinsicSmoothedNumerator_eq_restrict (a : ℕ) (ha : ¬ p ∣ a) :
    intrinsicSmoothedNumerator p a ha = restrictUnits p Z (smoothedNumerator p a ha) := sorry

theorem map_val_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    AbstractMeasure.map j (intrinsicSmoothedNumerator p a ha) = smoothedNumerator p a ha := sorry

theorem intrinsicSmoothedNumerator_unique (a : ℕ) (ha : ¬ p ∣ a) (η : D(U, Z))
    (hη : AbstractMeasure.map j η = smoothedNumerator p a ha) :
    η = intrinsicSmoothedNumerator p a ha := sorry

theorem intrinsicSmoothedNumerator_one (ha : ¬ p ∣ 1) :
    intrinsicSmoothedNumerator p 1 ha = 0 := sorry

theorem intrinsicSmoothedNumerator_moment (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    (intrinsicSmoothedNumerator p a ha (j ^ k) : ℚ_[p]) =
      ((1 - (p : ℚ_[p]) ^ (k-1)) * (1 - (a : ℚ_[p]) ^ k)) *
        ((bernoulli k : ℚ) : ℚ_[p]) / (k : ℚ_[p]) := sorry

theorem map_val_dirac_mul_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) (u : U) :
    AbstractMeasure.map j (dirac Z u * intrinsicSmoothedNumerator p a ha) =
      AbstractMeasure.map ⟨fun z : Z => (u : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p a ha) := sorry

theorem intrinsicSmoothedNumerator_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a*b) (u : U) (hu : (u : Z) = (a : Z)) :
    intrinsicSmoothedNumerator p (a*b) hab = intrinsicSmoothedNumerator p a ha +
      dirac Z u * intrinsicSmoothedNumerator p b hb := sorry

theorem intrinsicSmoothedNumerator_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b)
    (u v : U) (hu : (u : Z) = (a : Z)) (hv : (v : Z) = (b : Z)) :
    (dirac Z v - dirac Z (1 : U)) * intrinsicSmoothedNumerator p a ha =
      (dirac Z u - dirac Z (1 : U)) * intrinsicSmoothedNumerator p b hb := sorry

theorem intrinsicSmoothedNumerator_even (a : ℕ) (ha : ¬ p ∣ a) :
    dirac Z (-1 : U) * intrinsicSmoothedNumerator p a ha =
      intrinsicSmoothedNumerator p a ha := sorry

section Coefficients
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
  [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]

theorem map_val_extend_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    AbstractMeasure.map j (extendIntegralUnitCoefficients (R := R)
      (intrinsicSmoothedNumerator p a ha)) =
      extendIntegralCoefficients (R := R) (smoothedNumerator p a ha) := sorry

end Coefficients

theorem extend_intrinsicSmoothedNumerator_moment [IsBoundedSMul Z ℚ_[p]]
    (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    extendIntegralUnitCoefficients (R := ℚ_[p]) (intrinsicSmoothedNumerator p a ha)
      ((j ^ k) • (1 : C(U, ℚ_[p]))) =
      ((1 - (p : ℚ_[p]) ^ (k-1)) * (1 - (a : ℚ_[p]) ^ k)) *
        ((bernoulli k : ℚ) : ℚ_[p]) / (k : ℚ_[p]) := sorry

end DirichletPadic

namespace SuggestedIntrinsicNumeratorTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

-- SuggestedIntrinsicNumeratorTests.zero_parameter
example : intrinsicSmoothedNumerator 3 1 (by norm_num) = 0 := sorry

-- SuggestedIntrinsicNumeratorTests.first_moment
example : intrinsicSmoothedNumerator 3 2 (by norm_num)
    (⟨Units.val, Units.continuous_val⟩ : C((ℤ_[3])ˣ, ℤ_[3])) = 0 := sorry

-- SuggestedIntrinsicNumeratorTests.second_moment
example : (intrinsicSmoothedNumerator 3 2 (by norm_num)
    ((⟨Units.val, Units.continuous_val⟩ : C((ℤ_[3])ˣ, ℤ_[3])) ^ 2) : ℚ_[3]) = 1/2 := sorry

-- SuggestedIntrinsicNumeratorTests.dyadic_second
example : (intrinsicSmoothedNumerator 2 3 (by norm_num)
    ((⟨Units.val, Units.continuous_val⟩ : C((ℤ_[2])ˣ, ℤ_[2])) ^ 2) : ℚ_[2]) = 2/3 := sorry

-- SuggestedIntrinsicNumeratorTests.product_without_scalar
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    intrinsicSmoothedNumerator 3 4 (by norm_num) = intrinsicSmoothedNumerator 3 2 (by norm_num) +
      dirac ℤ_[3] u * intrinsicSmoothedNumerator 3 2 (by norm_num) := sorry

-- SuggestedIntrinsicNumeratorTests.cross_denominator_orientation
example (u v : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) (hv : (v : ℤ_[3]) = 4) :
    (dirac ℤ_[3] v - dirac ℤ_[3] 1) * intrinsicSmoothedNumerator 3 2 (by norm_num) =
      (dirac ℤ_[3] u - dirac ℤ_[3] 1) * intrinsicSmoothedNumerator 3 4 (by norm_num) := sorry

-- SuggestedIntrinsicNumeratorTests.dyadic_even
example : dirac ℤ_[2] (-1 : (ℤ_[2])ˣ) * intrinsicSmoothedNumerator 2 3 (by norm_num) =
    intrinsicSmoothedNumerator 2 3 (by norm_num) := sorry

-- SuggestedIntrinsicNumeratorTests.dyadic_extended_second
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    extendIntegralUnitCoefficients (R := ℚ_[2]) (intrinsicSmoothedNumerator 2 3 (by norm_num))
      (((⟨Units.val, Units.continuous_val⟩ : C((ℤ_[2])ˣ, ℤ_[2])) ^ 2) •
        (1 : C((ℤ_[2])ˣ, ℚ_[2]))) = 2/3 := sorry

end SuggestedIntrinsicNumeratorTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

local notation "Z" => ℤ_[p]

local notation "Q" => ℚ_[p]

local notation "U" => (ℤ_[p])ˣ

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, Z))

theorem norm_extend_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := Q)
      (intrinsicSmoothedNumerator p a ha))‖ ≤ 1 := sorry

theorem extend_intrinsicSmoothedNumerator_sum {ι : Type*} (s : Finset ι)
    (c : ι → Q) (k : ι → ℕ) (a : ℕ) (ha : ¬ p ∣ a) (hk : ∀ i ∈ s, 1 ≤ k i) :
    extendIntegralUnitCoefficients (R := Q) (intrinsicSmoothedNumerator p a ha)
      (∑ i ∈ s, c i • ((j ^ k i) • (1 : C(U,Q)))) =
      ∑ i ∈ s, c i * (((1-(p:Q)^(k i-1))*(1-(a:Q)^k i)) *
        ((bernoulli (k i) : ℚ) : Q) / (k i : Q)) := sorry

theorem smoothed_kummer_sum {ι : Type*} (s : Finset ι)
    (c : ι → Q) (k : ι → ℕ) (a r : ℕ) (ha : ¬ p ∣ a) (hk : ∀ i ∈ s, 1 ≤ k i)
    (hf : ∀ u : U, ‖∑ i ∈ s, c i * ((u : Z) : Q)^k i‖ ≤ (p:ℝ)^(-(r:ℤ))) :
    ‖∑ i ∈ s, c i * (((1-(p:Q)^(k i-1))*(1-(a:Q)^k i)) *
      ((bernoulli (k i) : ℚ) : Q) / (k i : Q))‖ ≤ (p:ℝ)^(-(r:ℤ)) := sorry

theorem smoothed_kummer_weight_period (a r k l : ℕ) (ha : ¬ p ∣ a)
    (hr : 1 ≤ r) (hk : 1 ≤ k) (hl : 1 ≤ l)
    (hkl : Nat.ModEq (p^(r-1)*(p-1)) k l) :
    ‖(((1-(p:Q)^(k-1))*(1-(a:Q)^k)) * ((bernoulli k : ℚ) : Q) / (k:Q)) -
      (((1-(p:Q)^(l-1))*(1-(a:Q)^l)) * ((bernoulli l : ℚ) : Q) / (l:Q))‖ ≤
      (p:ℝ)^(-(r:ℤ)) := sorry

theorem kummer_of_unit_smoothing (a r k l : ℕ) (ha : ¬ p ∣ a)
    (hr : 1 ≤ r) (hk : 1 ≤ k) (hl : 1 ≤ l)
    (hkl : Nat.ModEq (p^(r-1)*(p-1)) k l)
    (hd : IsUnit (1-(a:Z)^k)) (he : IsUnit (1-(a:Z)^l)) :
    ‖((1-(p:Q)^(k-1)) * ((bernoulli k : ℚ) : Q) / (k:Q)) -
      ((1-(p:Q)^(l-1)) * ((bernoulli l : ℚ) : Q) / (l:Q))‖ ≤
      (p:ℝ)^(-(r:ℤ)) := sorry

end DirichletPadic

namespace SuggestedKummerTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

-- SuggestedKummerTests.zero_parameter_bound
example [IsBoundedSMul ℤ_[3] ℚ_[3]] :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[3])
      (intrinsicSmoothedNumerator 3 1 (by norm_num)))‖ = 0 := sorry

-- SuggestedKummerTests.empty_combination
example [IsBoundedSMul ℤ_[3] ℚ_[3]] :
    extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
      (∑ i ∈ (∅ : Finset ℕ), (i : ℚ_[3]) • (1 : C((ℤ_[3])ˣ,ℚ_[3]))) = 0 := sorry

-- SuggestedKummerTests.first_weight_boundary
example [IsBoundedSMul ℤ_[3] ℚ_[3]] :
    extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
      ((ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[3])ˣ,ℤ_[3])) •
        (1 : C((ℤ_[3])ˣ,ℚ_[3]))) = 0 := sorry

-- SuggestedKummerTests.smoothed_precision
example : ‖(((1-(3:ℚ_[3]))*(1-2^2))*(1/6)/2 -
    ((1-3^3)*(1-2^4))*(-1/30)/4)‖ = (3:ℝ)⁻¹ := sorry

-- SuggestedKummerTests.unsmoothed_negative_control
example : ‖((1-(3:ℚ_[3]))*(1/6)/2 - (1-3^3)*(-1/30)/4)‖ = 3 := sorry

-- SuggestedKummerTests.dyadic_precision
example : ‖((1-(2:ℚ_[2]))*(1-3^2)*(1/6)/2 -
    (1-2^3)*(1-3^4)*(-1/30)/4)‖ ≤ (2:ℝ)^(-(2:ℤ)) := sorry

-- SuggestedKummerTests.unit_denominator_odd_prime
example [Fact (Nat.Prime 5)] : IsUnit (1-(2:ℤ_[5])^2) ∧ IsUnit (1-(2:ℤ_[5])^6) ∧
    ‖((1-(5:ℚ_[5]))*(1/6)/2 - (1-5^5)*(1/42)/6)‖ = (5:ℝ)⁻¹ := sorry

end SuggestedKummerTests

namespace DirichletPadic
open PowerSeries AbstractMeasure

open scoped PowerSeries.WithPiTopology Topology

noncomputable section
variable (p : ℕ) [Fact p.Prime]

def padicSmoothedSeries (u : (ℤ_[p])ˣ) : PowerSeries ℤ_[p] := by sorry

theorem padicSmoothedSeries_def (u : (ℤ_[p])ˣ) :
    padicSmoothedSeries p u =
      (PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+2))) *
        PowerSeries.invOfUnit (PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+1))) u := by sorry

theorem padicSmoothedSeries_mul_denominator (u : (ℤ_[p])ˣ) :
    (PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+1))) * padicSmoothedSeries p u =
      PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+2)) := by sorry

theorem padicSmoothedSeries_constantCoeff (u : (ℤ_[p])ˣ) :
    constantCoeff (padicSmoothedSeries p u) =
      Ring.choose (u : ℤ_[p]) 2 * ((u⁻¹ : (ℤ_[p])ˣ) : ℤ_[p]) := by sorry

theorem padicSmoothedSeries_unique (u : (ℤ_[p])ˣ) (F : PowerSeries ℤ_[p])
    (hF : (PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+1))) * F =
      PowerSeries.mk (fun n => Ring.choose (u : ℤ_[p]) (n+2))) :
    F = padicSmoothedSeries p u := by sorry

theorem padicSmoothedSeries_one : padicSmoothedSeries p 1 = 0 := by sorry

theorem padicSmoothedSeries_neg_one : padicSmoothedSeries p (-1) = -1 := by sorry

theorem padicSmoothedSeries_nat (a : ℕ) (ha : IsUnit (a : ℤ_[p]))
    (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = a) :
    padicSmoothedSeries p u = smoothedSeries ℤ_[p] a ha := by sorry

theorem padicSmoothedSeries_coeff_continuous (n : ℕ) :
    Continuous (fun u : (ℤ_[p])ˣ => coeff n (padicSmoothedSeries p u)) := by sorry

theorem padicSmoothedSeries_continuous : Continuous (padicSmoothedSeries p) := by sorry

def padicSmoothedMeasure (u : (ℤ_[p])ˣ) : D(ℤ_[p],ℤ_[p]) := by sorry

theorem padicSmoothedMeasure_def (u : (ℤ_[p])ˣ) :
    padicSmoothedMeasure p u =
      AbstractMeasure.amiceTransformEquiv.symm (padicSmoothedSeries p u) := by sorry

theorem amice_padicSmoothedMeasure (u : (ℤ_[p])ˣ) :
    (padicSmoothedMeasure p u).amiceTransform = padicSmoothedSeries p u := by sorry

theorem padicSmoothedMeasure_mahler (u : (ℤ_[p])ˣ) (n : ℕ) :
    padicSmoothedMeasure p u (mahler n : C(ℤ_[p],ℤ_[p])) =
      coeff n (padicSmoothedSeries p u) := by sorry

theorem padicSmoothedMeasure_unique (u : (ℤ_[p])ˣ) (μ : D(ℤ_[p],ℤ_[p]))
    (hμ : μ.amiceTransform = padicSmoothedSeries p u) :
    μ = padicSmoothedMeasure p u := by sorry

theorem padicSmoothedMeasure_one : padicSmoothedMeasure p 1 = 0 := by sorry

theorem padicSmoothedMeasure_neg_one :
    padicSmoothedMeasure p (-1) = -AbstractMeasure.dirac ℤ_[p] (0 : ℤ_[p]) := by sorry

theorem padicSmoothedMeasure_nat (a : ℕ) (ha : ¬ p ∣ a)
    (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = a) :
    padicSmoothedMeasure p u = smoothedMeasure p a ha := by sorry

theorem padicSmoothedMeasure_continuous_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := AbstractMeasure.WeakTopology
    Continuous (padicSmoothedMeasure p) := by sorry

theorem padicSmoothedMeasure_apply_continuous (f : C(ℤ_[p],ℤ_[p])) :
    Continuous (fun u : (ℤ_[p])ˣ => padicSmoothedMeasure p u f) := by sorry

theorem padicSmoothedMeasure_moment (u : (ℤ_[p])ˣ) (k : ℕ) :
    (padicSmoothedMeasure p u ((ContinuousMap.id ℤ_[p])^k) : ℚ_[p]) =
      (1-((u : ℤ_[p]) : ℚ_[p])^(k+1)) *
        algebraMap ℚ ℚ_[p] (bernoulli (k+1)/(k+1)) := by sorry

end

end DirichletPadic

namespace SuggestedPadicSmoothingTests
open DirichletPadic PowerSeries AbstractMeasure Set Filter

open scoped Topology PowerSeries.WithPiTopology

noncomputable section
-- SuggestedPadicSmoothingTests.series_identity_parameter
example : padicSmoothedSeries 2 1 = 0 := by sorry

-- SuggestedPadicSmoothingTests.series_negative_parameter
example : padicSmoothedSeries 2 (-1) = -1 := by sorry

-- SuggestedPadicSmoothingTests.dyadic_three_coefficients
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    ((coeff 0 (padicSmoothedSeries 2 u) : ℤ_[2]) : ℚ_[2]) = 1 ∧
      ((coeff 1 (padicSmoothedSeries 2 u) : ℤ_[2]) : ℚ_[2]) = -2/3 := by sorry

-- SuggestedPadicSmoothingTests.inverse_two_coefficients
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    ((coeff 0 (padicSmoothedSeries 3 u⁻¹) : ℤ_[3]) : ℚ_[3]) = -1/4 ∧
      ((coeff 1 (padicSmoothedSeries 3 u⁻¹) : ℤ_[3]) : ℚ_[3]) = 1/16 := by sorry

-- SuggestedPadicSmoothingTests.natural_two_comparison
example (h : IsUnit (2 : ℤ_[3])) (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicSmoothedSeries 3 u = smoothedSeries ℤ_[3] 2 h := by sorry

-- SuggestedPadicSmoothingTests.natural_three_comparison
example (h : IsUnit (3 : ℤ_[2])) (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicSmoothedSeries 2 u = smoothedSeries ℤ_[2] 3 h := by sorry

-- SuggestedPadicSmoothingTests.coefficient_limit_at_negative_one
example (u : ℕ → (ℤ_[3])ˣ) (hu : ∀ n, (u n : ℤ_[3]) = 3^(n+1)-1) :
    Tendsto (fun n => coeff 1 (padicSmoothedSeries 3 (u n))) atTop (𝓝 0) := by sorry

-- SuggestedPadicSmoothingTests.constant_limit_at_negative_one
example (u : ℕ → (ℤ_[2])ˣ) (hu : ∀ n, (u n : ℤ_[2]) = 2^(n+1)-1) :
    Tendsto (fun n => coeff 0 (padicSmoothedSeries 2 (u n))) atTop (𝓝 (-1)) := by sorry

-- SuggestedPadicSmoothingTests.measure_identity_parameter
example : padicSmoothedMeasure 2 1 = 0 := by sorry

-- SuggestedPadicSmoothingTests.measure_negative_parameter
example : padicSmoothedMeasure 2 (-1) = -AbstractMeasure.dirac ℤ_[2] (0 : ℤ_[2]) := by sorry

-- SuggestedPadicSmoothingTests.inverse_two_mass
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    (padicSmoothedMeasure 3 u⁻¹ 1 : ℚ_[3]) = -1/4 := by sorry

-- SuggestedPadicSmoothingTests.negative_parameter_positive_moment
example : padicSmoothedMeasure 3 (-1) ((ContinuousMap.id ℤ_[3])^2) = 0 := by sorry

-- SuggestedPadicSmoothingTests.natural_measure_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) (h : ¬ 3 ∣ 2) :
    padicSmoothedMeasure 3 u = smoothedMeasure 3 2 h := by sorry

-- SuggestedPadicSmoothingTests.natural_measure_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) (h : ¬ 2 ∣ 3) :
    padicSmoothedMeasure 2 u = smoothedMeasure 2 3 h := by sorry

-- SuggestedPadicSmoothingTests.weak_limit_negative_parameter
example (u : ℕ → (ℤ_[2])ˣ) (hu : ∀ n, (u n : ℤ_[2]) = 2^(n+1)-1) :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := AbstractMeasure.WeakTopology
    Tendsto (fun n => padicSmoothedMeasure 2 (u n)) atTop
      (𝓝 (-AbstractMeasure.dirac ℤ_[2] (0 : ℤ_[2]))) := by sorry

-- SuggestedPadicSmoothingTests.fixed_test_limit
example (u : ℕ → (ℤ_[3])ˣ) (hu : ∀ n, (u n : ℤ_[3]) = 3^(n+1)-1)
    (f : C(ℤ_[3],ℤ_[3])) :
    Tendsto (fun n => padicSmoothedMeasure 3 (u n) f) atTop (𝓝 (-f 0)) := by sorry

-- SuggestedPadicSmoothingTests.inverse_two_first_moment
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    (padicSmoothedMeasure 3 u⁻¹ (ContinuousMap.id ℤ_[3]) : ℚ_[3]) = 1/16 := by sorry

-- SuggestedPadicSmoothingTests.inverse_two_second_moment
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicSmoothedMeasure 3 u⁻¹ ((ContinuousMap.id ℤ_[3])^2) = 0 := by sorry

end

end SuggestedPadicSmoothingTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "x" => (ContinuousMap.id Z)

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local notation "ι" => (ContinuousMap.mk PadicInt.inv PadicInt.continuous_inv : C(Z,Z))

theorem psi_padicSmoothedMeasure (u : U) :
    psiMeasure p Z (padicSmoothedMeasure p u) = padicSmoothedMeasure p u := sorry

lemma unitRestriction_padicSmoothedMeasure (u : U) :
    unitRestriction p Z (padicSmoothedMeasure p u) = padicSmoothedMeasure p u -
      phiMeasure p Z (padicSmoothedMeasure p u) := sorry

def padicSmoothedNumerator (u : U) : D(Z,Z) := sorry

lemma padicSmoothedNumerator_def (u : U) :
    padicSmoothedNumerator p u = inverseWeight p (padicSmoothedMeasure p u) := sorry

lemma padicSmoothedNumerator_apply (u : U) (f : C(Z,Z)) :
    padicSmoothedNumerator p u f = padicSmoothedMeasure p u (ι*f) := sorry

lemma padicSmoothedNumerator_supported (u : U) :
    unitRestriction p Z (padicSmoothedNumerator p u) = padicSmoothedNumerator p u := sorry

lemma weight_padicSmoothedNumerator (u : U) :
    weight x (padicSmoothedNumerator p u) =
      unitRestriction p Z (padicSmoothedMeasure p u) := sorry

lemma padicSmoothedNumerator_unique (u : U) (ν : D(Z,Z))
    (hν : unitRestriction p Z ν = ν)
    (hw : weight x ν = unitRestriction p Z (padicSmoothedMeasure p u)) :
    ν = padicSmoothedNumerator p u := sorry

lemma padicSmoothedNumerator_one : padicSmoothedNumerator p 1 = 0 := sorry

lemma padicSmoothedNumerator_neg_one : padicSmoothedNumerator p (-1) = 0 := sorry

lemma padicSmoothedNumerator_apply_continuous (f : C(Z,Z)) :
    Continuous (fun u : U => padicSmoothedNumerator p u f) := sorry

lemma padicSmoothedNumerator_nat (u : U) (a : ℕ) (ha : ¬ p ∣ a)
    (hu : (u : Z) = (a : Z)) :
    padicSmoothedNumerator p u = smoothedNumerator p a ha := sorry

theorem padicSmoothedNumerator_moment (u : U) (k : ℕ) (hk : 1 ≤ k) :
    (padicSmoothedNumerator p u (x^k) : ℚ_[p]) =
      (1-(p : ℚ_[p])^(k-1)) * (1-(u : ℚ_[p])^k) *
      algebraMap ℚ ℚ_[p] (bernoulli k / k) := sorry

def padicIntrinsicNumerator (u : U) : D(U,Z) := sorry

lemma padicIntrinsicNumerator_def (u : U) :
    padicIntrinsicNumerator p u = restrictUnits p Z (padicSmoothedNumerator p u) := sorry

lemma padicIntrinsicNumerator_unique (u : U) (η : D(U,Z))
    (hη : AbstractMeasure.map j η = padicSmoothedNumerator p u) :
    η = padicIntrinsicNumerator p u := sorry

lemma padicIntrinsicNumerator_one : padicIntrinsicNumerator p 1 = 0 := sorry

lemma padicIntrinsicNumerator_neg_one : padicIntrinsicNumerator p (-1) = 0 := sorry

lemma map_val_padicIntrinsicNumerator (u : U) :
    AbstractMeasure.map j (padicIntrinsicNumerator p u) = padicSmoothedNumerator p u := sorry

lemma padicIntrinsicNumerator_nat (u : U) (a : ℕ) (ha : ¬ p ∣ a)
    (hu : (u : Z) = (a : Z)) :
    padicIntrinsicNumerator p u = intrinsicSmoothedNumerator p a ha := sorry

theorem padicIntrinsicNumerator_moment (u : U) (k : ℕ) (hk : 1 ≤ k) :
    (padicIntrinsicNumerator p u (j^k) : ℚ_[p]) =
      (1-(p : ℚ_[p])^(k-1)) * (1-(u : ℚ_[p])^k) *
      algebraMap ℚ ℚ_[p] (bernoulli k / k) := sorry

lemma padicIntrinsicNumerator_apply_continuous (f : C(U,Z)) :
    Continuous (fun u : U => padicIntrinsicNumerator p u f) := sorry

lemma padicIntrinsicNumerator_continuous_weak :
    @Continuous U D(U,Z) inferInstance AbstractMeasure.WeakTopology
      (padicIntrinsicNumerator p) := sorry

end DirichletPadic

namespace SuggestedPadicNumeratorTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

-- SuggestedPadicNumeratorTests.psi_negative_parameter
example : psiMeasure 2 ℤ_[2] (padicSmoothedMeasure 2 (-1)) =
    -dirac ℤ_[2] (0 : ℤ_[2]) := sorry

-- SuggestedPadicNumeratorTests.psi_is_not_unit_support
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    psiMeasure 3 ℤ_[3] (padicSmoothedMeasure 3 u) ≠ 0 := sorry

-- SuggestedPadicNumeratorTests.ambient_identity_parameter
example : padicSmoothedNumerator 2 1 = 0 := sorry

-- SuggestedPadicNumeratorTests.ambient_negative_parameter
example : padicSmoothedNumerator 2 (-1) = 0 := sorry

-- SuggestedPadicNumeratorTests.ambient_inverse_two_second
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = (2 : ℤ_[3]).inv) :
    (padicSmoothedNumerator 3 u ((ContinuousMap.id ℤ_[3])^2) : ℚ_[3]) = -1/8 := sorry

-- SuggestedPadicNumeratorTests.weighting_removes_zero_atom
example : padicSmoothedMeasure 3 (-1) ≠ 0 ∧ padicSmoothedNumerator 3 (-1) = 0 := sorry

-- SuggestedPadicNumeratorTests.ambient_natural_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicSmoothedNumerator 2 u = smoothedNumerator 2 3 (by norm_num) := sorry

-- SuggestedPadicNumeratorTests.ambient_natural_identity
example : padicSmoothedNumerator 3 1 = smoothedNumerator 3 1 (by norm_num) := sorry

-- SuggestedPadicNumeratorTests.ambient_first_moment_zero
example (u : (ℤ_[2])ˣ) :
    padicSmoothedNumerator 2 u (ContinuousMap.id ℤ_[2]) = 0 := sorry

-- SuggestedPadicNumeratorTests.ambient_dyadic_third_parameter
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    (padicSmoothedNumerator 2 u ((ContinuousMap.id ℤ_[2])^2) : ℚ_[2]) = 2/3 := sorry

-- SuggestedPadicNumeratorTests.intrinsic_identity_parameter
example : padicIntrinsicNumerator 2 1 = 0 := sorry

-- SuggestedPadicNumeratorTests.intrinsic_negative_parameter
example : padicIntrinsicNumerator 2 (-1) = 0 := sorry

-- SuggestedPadicNumeratorTests.intrinsic_inverse_two_second
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = (2 : ℤ_[3]).inv) :
    (padicIntrinsicNumerator 3 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2) : ℚ_[3]) = -1/8 := sorry

-- SuggestedPadicNumeratorTests.intrinsic_inclusion_test
example (u : (ℤ_[2])ˣ) (f : C(ℤ_[2],ℤ_[2])) :
    padicIntrinsicNumerator 2 u
      (f.comp (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))) =
      padicSmoothedNumerator 2 u f := sorry

-- SuggestedPadicNumeratorTests.intrinsic_natural_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicIntrinsicNumerator 2 u = intrinsicSmoothedNumerator 2 3 (by norm_num) := sorry

-- SuggestedPadicNumeratorTests.intrinsic_natural_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicIntrinsicNumerator 3 u = intrinsicSmoothedNumerator 3 2 (by norm_num) := sorry

-- SuggestedPadicNumeratorTests.intrinsic_first_moment_zero
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) = 0 := sorry

-- SuggestedPadicNumeratorTests.intrinsic_second_integral
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    (padicIntrinsicNumerator 2 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^2) : ℚ_[2]) = 2/3 := sorry

-- SuggestedPadicNumeratorTests.fixed_test_negative_limit
example (f : C((ℤ_[2])ˣ,ℤ_[2])) :
    Filter.Tendsto (fun u : (ℤ_[2])ˣ => padicIntrinsicNumerator 2 u f)
      (nhds (-1)) (nhds 0) := sorry

-- SuggestedPadicNumeratorTests.fixed_test_identity_limit
example (f : C((ℤ_[3])ˣ,ℤ_[3])) :
    Filter.Tendsto (fun u : (ℤ_[3])ˣ => padicIntrinsicNumerator 3 u f)
      (nhds 1) (nhds 0) := sorry

end SuggestedPadicNumeratorTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

local notation "σ" => (fun u : U => (AbstractMeasure.map
  (ContinuousMap.mk (fun z : Z => (u : Z)*z) (continuous_const.mul continuous_id)) :
    D(Z,Z) →ₗ[Z] D(Z,Z)))

lemma padicSmoothedMeasure_mul (u v : U) :
    padicSmoothedMeasure p (u*v) = padicSmoothedMeasure p u +
      (u : Z) • σ u (padicSmoothedMeasure p v) := sorry

lemma padicSmoothedMeasure_reflection (u : U) :
    padicSmoothedMeasure p u + σ (-1 : U) (padicSmoothedMeasure p u) =
      ((u : Z)-1) • dirac Z (0 : Z) := sorry

lemma padicSmoothedNumerator_mul (u v : U) :
    padicSmoothedNumerator p (u*v) = padicSmoothedNumerator p u +
      σ u (padicSmoothedNumerator p v) := sorry

lemma padicSmoothedNumerator_even (u : U) :
    σ (-1 : U) (padicSmoothedNumerator p u) = padicSmoothedNumerator p u := sorry

lemma map_val_dirac_mul_padicIntrinsicNumerator (u v : U) :
    AbstractMeasure.map j (dirac Z v * padicIntrinsicNumerator p u) =
      σ v (padicSmoothedNumerator p u) := sorry

lemma padicIntrinsicNumerator_mul (u v : U) :
    padicIntrinsicNumerator p (u*v) = padicIntrinsicNumerator p u +
      dirac Z u * padicIntrinsicNumerator p v := sorry

lemma padicIntrinsicNumerator_cross (u v : U) :
    (dirac Z v-dirac Z (1 : U))*padicIntrinsicNumerator p u =
      (dirac Z u-dirac Z (1 : U))*padicIntrinsicNumerator p v := sorry

lemma padicIntrinsicNumerator_even (u : U) :
    dirac Z (-1 : U)*padicIntrinsicNumerator p u = padicIntrinsicNumerator p u := sorry

end DirichletPadic

namespace SuggestedPadicRelationTests
open scoped AbstractMeasure

open AbstractMeasure DirichletPadic

-- SuggestedPadicRelationTests.raw_cocycle_scalar
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    padicSmoothedMeasure 3 (u*u) = padicSmoothedMeasure 3 u +
      (2 : ℤ_[3]) • AbstractMeasure.map
        (⟨fun z : ℤ_[3] => 2*z, continuous_const.mul continuous_id⟩ : C(ℤ_[3],ℤ_[3]))
        (padicSmoothedMeasure 3 u) := sorry

-- SuggestedPadicRelationTests.raw_cocycle_negative
example (u : (ℤ_[2])ˣ) :
    padicSmoothedMeasure 2 (-u) = padicSmoothedMeasure 2 u -
      (u : ℤ_[2]) • dirac ℤ_[2] (0 : ℤ_[2]) := sorry

-- SuggestedPadicRelationTests.reflection_negative_boundary
example : padicSmoothedMeasure 3 (-1) +
    AbstractMeasure.map (⟨fun z : ℤ_[3] => -z, continuous_neg⟩ : C(ℤ_[3],ℤ_[3]))
      (padicSmoothedMeasure 3 (-1)) = (-2 : ℤ_[3]) • dirac ℤ_[3] (0 : ℤ_[3]) := sorry

-- SuggestedPadicRelationTests.reflection_dyadic_correction
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=3) :
    padicSmoothedMeasure 2 u +
      AbstractMeasure.map (⟨fun z : ℤ_[2] => -z, continuous_neg⟩ : C(ℤ_[2],ℤ_[2]))
        (padicSmoothedMeasure 2 u) = (2 : ℤ_[2]) • dirac ℤ_[2] (0 : ℤ_[2]) := sorry

-- SuggestedPadicRelationTests.numerator_inverse_parameters
example (u : (ℤ_[3])ˣ) : padicSmoothedNumerator 3 u +
    AbstractMeasure.map
      (⟨fun z : ℤ_[3] => (u : ℤ_[3])*z, continuous_const.mul continuous_id⟩ : C(ℤ_[3],ℤ_[3]))
      (padicSmoothedNumerator 3 u⁻¹) = 0 := sorry

-- SuggestedPadicRelationTests.numerator_no_extra_scalar
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    (padicSmoothedNumerator 3 (u*u) ((ContinuousMap.id ℤ_[3])^2) : ℚ_[3]) =
      1/2 + 4*(1/2) := sorry

-- SuggestedPadicRelationTests.ambient_dyadic_even
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.map (⟨fun z : ℤ_[2] => -z, continuous_neg⟩ : C(ℤ_[2],ℤ_[2]))
      (padicSmoothedNumerator 2 u) = padicSmoothedNumerator 2 u := sorry

-- SuggestedPadicRelationTests.ambient_odd_test
example (u : (ℤ_[2])ˣ) :
    padicSmoothedNumerator 2 u ((ContinuousMap.id ℤ_[2])^3) = 0 := sorry

-- SuggestedPadicRelationTests.dirac_identity_inclusion
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.map (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))
      (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)*padicIntrinsicNumerator 2 u) =
      padicSmoothedNumerator 2 u := sorry

-- SuggestedPadicRelationTests.dirac_negative_zero
example (v : (ℤ_[3])ˣ) :
    dirac ℤ_[3] v * padicIntrinsicNumerator 3 (-1) = 0 := sorry

-- SuggestedPadicRelationTests.intrinsic_inverse_parameters
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u + dirac ℤ_[2] u*padicIntrinsicNumerator 2 u⁻¹ = 0 := sorry

-- SuggestedPadicRelationTests.intrinsic_negative_parameter_change
example (u : (ℤ_[2])ˣ) : padicIntrinsicNumerator 2 (-u) = padicIntrinsicNumerator 2 u := sorry

-- SuggestedPadicRelationTests.cross_orientation
example (u v : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) (hv : (v : ℤ_[3])=4) :
    (((dirac ℤ_[3] v - dirac ℤ_[3] 1)*padicIntrinsicNumerator 3 u) : D((ℤ_[3])ˣ,ℤ_[3]))
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2) =
    (15 : ℤ_[3]) * (padicIntrinsicNumerator 3 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2)) := sorry

-- SuggestedPadicRelationTests.cross_identity_parameter
example (u : (ℤ_[2])ˣ) :
    (dirac ℤ_[2] u-dirac ℤ_[2] 1)*padicIntrinsicNumerator 2 1 = 0 := sorry

-- SuggestedPadicRelationTests.intrinsic_dyadic_even
example (u : (ℤ_[2])ˣ) :
    dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)*padicIntrinsicNumerator 2 u = padicIntrinsicNumerator 2 u := sorry

-- SuggestedPadicRelationTests.intrinsic_odd_moment
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) = 0 := sorry

end SuggestedPadicRelationTests

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

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

local notation "PM" => Iwasawa.pseudomeasures δ Q

lemma arithmeticFraction_clearing (a : U) (ha : (a : Z)=(p+1 : ℕ)) (g : U) :
    algebraMap M Q (dirac Z g-1) *
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ =
      algebraMap M Q (padicIntrinsicNumerator p g) := sorry

def kubotaLeopoldtPseudomeasure : PM := sorry

lemma kubotaLeopoldtPseudomeasure_coe (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (kubotaLeopoldtPseudomeasure p : Q) =
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ := sorry

lemma kubotaLeopoldtPseudomeasure_clearing (g : U) :
    algebraMap M Q (dirac Z g-1) * (kubotaLeopoldtPseudomeasure p : Q) =
      algebraMap M Q (padicIntrinsicNumerator p g) := sorry

lemma kubotaLeopoldtPseudomeasure_numerator (g : U) :
    Iwasawa.numerator δ Q g (kubotaLeopoldtPseudomeasure p) =
      padicIntrinsicNumerator p g := sorry

lemma kubotaLeopoldtPseudomeasure_eq_fraction (u : U)
    (hu : dirac Z u-1 ∈ nonZeroDivisors M) :
    (kubotaLeopoldtPseudomeasure p : Q) =
      IsLocalization.mk' Q (padicIntrinsicNumerator p u) ⟨dirac Z u-1,hu⟩ := sorry

theorem kubotaLeopoldtPseudomeasure_unique (z : PM)
    (hz : ∀ g : U, Iwasawa.numerator δ Q g z = padicIntrinsicNumerator p g) :
    z = kubotaLeopoldtPseudomeasure p := sorry

theorem kubotaLeopoldtPseudomeasure_even :
    dirac Z (-1 : U) • kubotaLeopoldtPseudomeasure p = kubotaLeopoldtPseudomeasure p := sorry

namespace SuggestedActualPseudoTests
-- SuggestedActualPseudoTests.clearing_identity
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (dirac Z (1 : U)-1) *
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ = 0 := sorry

-- SuggestedActualPseudoTests.clearing_negative
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (dirac Z (-1 : U)-1) *
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ = 0 := sorry

-- SuggestedActualPseudoTests.constructor_identity_numerator
example : Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry

-- SuggestedActualPseudoTests.constructor_sign_numerator
example : Iwasawa.numerator δ Q (-1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry

-- SuggestedActualPseudoTests.constructor_integral_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    Iwasawa.numerator δ Q a (kubotaLeopoldtPseudomeasure p) =
      intrinsicSmoothedNumerator p (p+1) (by
        have hp := (Fact.out : p.Prime)
        simpa using hp.not_dvd_one) := sorry

-- SuggestedActualPseudoTests.constructor_not_zero
example : kubotaLeopoldtPseudomeasure p ≠ 0 := sorry

-- SuggestedActualPseudoTests.cleared_difference_zero
example : algebraMap M Q (dirac Z (1 : U)-1) * (kubotaLeopoldtPseudomeasure p : Q) = 0 := sorry

-- SuggestedActualPseudoTests.sign_annihilator
example : algebraMap M Q (dirac Z (-1 : U)-1) * (kubotaLeopoldtPseudomeasure p : Q) = 0 := sorry

-- SuggestedActualPseudoTests.numerator_moment_second
example (g : U) :
    (Iwasawa.numerator δ Q g (kubotaLeopoldtPseudomeasure p)
      ((⟨Units.val,Units.continuous_val⟩ : C(U,Z))^2) : ℚ_[p]) =
      (1-(p : ℚ_[p]))*(1-(g : ℚ_[p])^2)/12 := sorry

-- SuggestedActualPseudoTests.numerator_negative_zero
example : Iwasawa.numerator δ Q (-1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry

-- SuggestedActualPseudoTests.regular_parameter_two_choices
example (u v : U) (hu : dirac Z u-1 ∈ nonZeroDivisors M)
    (hv : dirac Z v-1 ∈ nonZeroDivisors M) :
    IsLocalization.mk' Q (padicIntrinsicNumerator p u) ⟨dirac Z u-1,hu⟩ =
      IsLocalization.mk' Q (padicIntrinsicNumerator p v) ⟨dirac Z v-1,hv⟩ := sorry

-- SuggestedActualPseudoTests.torsion_is_not_regular
example : dirac Z (-1 : U)-1 ∉ nonZeroDivisors M := sorry

-- SuggestedActualPseudoTests.uniqueness_one_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : PM)
    (hz : Iwasawa.numerator δ Q a z = padicIntrinsicNumerator p a) :
    z = kubotaLeopoldtPseudomeasure p := sorry

-- SuggestedActualPseudoTests.even_sign_action
example : dirac Z (-1 : U) • kubotaLeopoldtPseudomeasure p = kubotaLeopoldtPseudomeasure p := sorry

-- SuggestedActualPseudoTests.identity_scalar_action
example : dirac Z (1 : U) • kubotaLeopoldtPseudomeasure p = kubotaLeopoldtPseudomeasure p := sorry

end SuggestedActualPseudoTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

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

local notation "PM" => Iwasawa.pseudomeasures (diracHom (G := U) (R := Z)) Q

theorem kubotaLeopoldtPseudomeasure_moment (k : ℕ) (hk : 0 < k) :
    positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p) =
      -(1-(p : ℚ_[p])^(k-1))*algebraMap ℚ ℚ_[p] (bernoulli k/(k : ℚ)) := sorry

lemma arithmeticEulerValue_complex (k : ℕ) (hk : 0 < k) :
    ((-(1-(p : ℚ)^(k-1))*(bernoulli k/(k : ℚ)) : ℚ) : ℂ) =
      (1-(p : ℂ)^(k-1))*riemannZeta (1-(k : ℂ)) := sorry

theorem kubotaLeopoldtPseudomeasure_interpolation (k : ℕ) (hk : 0 < k) :
    ∃! r : ℚ, (r : ℂ)=(1-(p : ℂ)^(k-1))*riemannZeta (1-(k : ℂ)) ∧
      (r : ℚ_[p])=positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p) := sorry

theorem kubotaLeopoldtPseudomeasure_unique_of_moments (z : PM)
    (hz : ∀ (k : ℕ) (hk : 0 < k), positivePseudoMoment p k hk z =
      -(1-(p : ℚ_[p])^(k-1))*algebraMap ℚ ℚ_[p] (bernoulli k/(k : ℚ))) :
    z=kubotaLeopoldtPseudomeasure p := sorry

lemma kubotaLeopoldtPseudomeasure_odd_moment (k : ℕ) (hk : Odd k) :
    positivePseudoMoment p k hk.pos (kubotaLeopoldtPseudomeasure p)=0 := sorry

namespace SuggestedInterpolationTests
-- SuggestedInterpolationTests.positive_first_zero
example : positivePseudoMoment p 1 (by omega) (kubotaLeopoldtPseudomeasure p)=0 := sorry

-- SuggestedInterpolationTests.positive_second_ternary
example : positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3)=1/6 := sorry

-- SuggestedInterpolationTests.positive_fourth_dyadic
example : positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)= -7/120 := sorry

-- SuggestedInterpolationTests.complex_endpoint_euler
example : (1-(p : ℂ)^0)*riemannZeta 0=0 := sorry

-- SuggestedInterpolationTests.complex_endpoint_nonzero
example : riemannZeta 0= -(1:ℂ)/2 ∧ riemannZeta 0 ≠ 0 := sorry

-- SuggestedInterpolationTests.complex_second_ternary
example : (1-(3 : ℂ))*riemannZeta (-1)=1/6 := sorry

-- SuggestedInterpolationTests.rational_dyadic_second
example : ((1/12 : ℚ) : ℂ)=(1-(2 : ℂ))*riemannZeta (-1) ∧
    ((1/12 : ℚ) : ℚ_[2])=positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2) := sorry

-- SuggestedInterpolationTests.rational_first_zero
example : ((0 : ℚ) : ℂ)=(1-(p : ℂ)^0)*riemannZeta 0 ∧
    ((0 : ℚ) : ℚ_[p])=positivePseudoMoment p 1 (by omega) (kubotaLeopoldtPseudomeasure p) := sorry

-- SuggestedInterpolationTests.unique_interpolating_object
example : ∃! z : PM, ∀ (k : ℕ) (hk : 0 < k), positivePseudoMoment p k hk z =
    -(1-(p : ℚ_[p])^(k-1))*algebraMap ℚ ℚ_[p] (bernoulli k/(k : ℚ)) := sorry

-- SuggestedInterpolationTests.odd_third_dyadic
example : positivePseudoMoment 2 3 (by omega) (kubotaLeopoldtPseudomeasure 2)=0 := sorry

-- SuggestedInterpolationTests.odd_fifth_ternary
example : positivePseudoMoment 3 5 (by omega) (kubotaLeopoldtPseudomeasure 3)=0 := sorry

end SuggestedInterpolationTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

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

lemma arithmeticEulerValue_norm (k : ℕ) (hk : 0<k) (hd : p-1 ∣ 2*k) :
    ‖((-(1-(p : ℚ)^(2*k-1))*(bernoulli (2*k)/(2*k : ℚ)) : ℚ) : ℚ_[p])‖ =
      (p : ℝ)/‖(2*k : ℚ_[p])‖ := sorry

theorem kubotaLeopoldtPseudomeasure_moment_norm (k : ℕ) (hk : 0<k)
    (hd : p-1 ∣ 2*k) :
    ‖positivePseudoMoment p (2*k) (by omega) (kubotaLeopoldtPseudomeasure p)‖ =
      (p : ℝ)/‖(2*k : ℚ_[p])‖ ∧
    (p : ℝ) ≤ ‖positivePseudoMoment p (2*k) (by omega) (kubotaLeopoldtPseudomeasure p)‖ := sorry

theorem kubotaLeopoldtPseudomeasure_not_integral :
    ¬ ∃ μ : M, Iwasawa.integral δ Q μ=kubotaLeopoldtPseudomeasure p := sorry

namespace SuggestedNonintegralityTests
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

-- SuggestedNonintegralityTests.scalar_dyadic_second
example : ‖((-(1-(2 : ℚ))*(bernoulli 2/2) : ℚ) : ℚ_[2])‖=4 := sorry

-- SuggestedNonintegralityTests.scalar_ternary_sixth
example : ‖((-(1-(3 : ℚ)^5)*(bernoulli 6/6) : ℚ) : ℚ_[3])‖=9 := sorry

-- SuggestedNonintegralityTests.scalar_quinary_fourth
example : ‖((-(1-(5 : ℚ)^3)*(bernoulli 4/4) : ℚ) : ℚ_[5])‖=5 := sorry

-- SuggestedNonintegralityTests.moment_dyadic_second
example : ‖positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=4 := sorry

-- SuggestedNonintegralityTests.moment_dyadic_fourth
example : ‖positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=8 := sorry

-- SuggestedNonintegralityTests.moment_ternary_second
example : ‖positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3)‖=3 := sorry

-- SuggestedNonintegralityTests.not_integral_each_measure
example (μ : M) : Iwasawa.integral δ Q μ ≠ kubotaLeopoldtPseudomeasure p := sorry

-- SuggestedNonintegralityTests.not_in_integral_range
example : (kubotaLeopoldtPseudomeasure p : Q) ∉ Set.range (algebraMap M Q) := sorry

end SuggestedNonintegralityTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure

open AbstractMeasure

variable (p : ℕ) [Fact p.Prime]

local notation "Z" => ℤ_[p]

local notation "U" => Zˣ

local notation "K" => ℚ_[p]

local notation "t" => (ContinuousMap.mk (fun u : U => (u : K)) (by fun_prop) : C(U,K))

theorem kubotaLeopoldtPseudomeasure_growing_moments (r : ℕ) :
    (p : ℝ)^(r+1) ≤
      ‖positivePseudoMoment p (2*((p-1)*p^r)) (by
        have hp := (Fact.out : p.Prime)
        have hp0 : 0<p := hp.pos
        have hpos : 0<p-1 := Nat.sub_pos_of_lt hp.one_lt
        positivity) (kubotaLeopoldtPseudomeasure p)‖ := sorry

theorem kubotaLeopoldtPseudomeasure_unbounded_moments (B : ℝ) :
    ∃ (k : ℕ) (hk : 0<k), B <
      ‖positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p)‖ := sorry

theorem kubotaLeopoldtPseudomeasure_no_field_measure :
    ¬ ∃ μ : D(U,K), ∀ (k : ℕ) (hk : 0<k),
      μ (t^k)=positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p) := sorry

namespace SuggestedUnboundedTests
-- SuggestedUnboundedTests.growing_dyadic_degree_four
example : ‖positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=8 := sorry

-- SuggestedUnboundedTests.growing_ternary_degree_twelve
example : ‖positivePseudoMoment 3 12 (by omega) (kubotaLeopoldtPseudomeasure 3)‖=9 := sorry

-- SuggestedUnboundedTests.dyadic_exceeds_one_hundred
example : ∃ (k : ℕ) (hk : 0<k), (100 : ℝ) <
    ‖positivePseudoMoment 2 k hk (kubotaLeopoldtPseudomeasure 2)‖ := sorry

-- SuggestedUnboundedTests.ternary_exceeds_one_hundred
example : ∃ (k : ℕ) (hk : 0<k), (100 : ℝ) <
    ‖positivePseudoMoment 3 k hk (kubotaLeopoldtPseudomeasure 3)‖ := sorry

-- SuggestedUnboundedTests.no_field_measure_witness_degree
example (μ : D(U,K)) : ∃ (k : ℕ) (hk : 0<k),
    μ (t^k) ≠ positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p) := sorry

-- SuggestedUnboundedTests.identity_atom_fails_dyadic_second
example : dirac ℚ_[2] (1 : ℤ_[2]ˣ)
    ((⟨fun u : ℤ_[2]ˣ => (u : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2]ˣ,ℚ_[2]))^2) ≠
      positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2) := sorry

-- SuggestedUnboundedTests.sign_atom_fails_ternary_second
example : dirac ℚ_[3] (-1 : ℤ_[3]ˣ)
    ((⟨fun u : ℤ_[3]ˣ => (u : ℚ_[3]), by fun_prop⟩ : C(ℤ_[3]ˣ,ℚ_[3]))^2) ≠
      positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3) := sorry

end SuggestedUnboundedTests

end DirichletPadic

namespace DirichletPadic
open scoped AbstractMeasure BigOperators

open AbstractMeasure PowerSeries

lemma smoothingDenominator_geometric (R : Type*) [CommRing R] (a : ℕ) :
    smoothingDenominator R a = ∑ i ∈ Finset.range a, (1+X : R⟦X⟧)^i := sorry

lemma smoothedSeries_geometric_cancellation (R : Type*) [CommRing R]
    (a : ℕ) (ha : IsUnit (a : R)) :
    (∑ i ∈ Finset.range a, (1+X : R⟦X⟧)^i) * smoothedSeries R a ha =
      ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, (1+X : R⟦X⟧)^j := sorry

variable (p : ℕ) [Fact p.Prime]

variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
  [IsUltrametricDist K] [CompleteSpace K] [IsBoundedSMul ℤ_[p] K]

namespace SuggestedAdditiveRationalTests
-- SuggestedAdditiveRationalTests.geometric_denominator_zero
example : smoothingDenominator ℤ 0 = 0 := sorry

-- SuggestedAdditiveRationalTests.geometric_denominator_three
example : smoothingDenominator ℤ 3 = 1+(1+X)+(1+X)^2 := sorry

-- SuggestedAdditiveRationalTests.geometric_cancellation_one
example : (∑ i ∈ Finset.range 1, (1+X : ℚ⟦X⟧)^i) *
    smoothedSeries ℚ 1 (by norm_num) = 0 := sorry

-- SuggestedAdditiveRationalTests.geometric_cancellation_three
example : (1+(1+X)+(1+X)^2 : ℚ⟦X⟧) * smoothedSeries ℚ 3 (by norm_num) = 2+(1+X) := sorry

end SuggestedAdditiveRationalTests

end DirichletPadic

namespace SuggestedLocalizedEisensteinTests
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

-- SuggestedLocalizedEisensteinTests.inherited_numerator_identity
example : padicIntrinsicNumerator 3 1 = 0 := sorry

-- SuggestedLocalizedEisensteinTests.inherited_numerator_negative
example : padicIntrinsicNumerator 3 (-1) = 0 := sorry

end SuggestedLocalizedEisensteinTests

namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure

section SmoothedResidueMasses
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))

theorem extend_smoothedMeasure_translation_difference (a : ℕ) (ha : ¬p∣a) :
    AbstractMeasure.map
      (⟨fun x : ℤ_[p] => x+(a : ℤ_[p]), by fun_prop⟩ : C(ℤ_[p],ℤ_[p]))
      (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha))-
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha)=
    (∑ i ∈ Finset.range a, dirac K (i : ℤ_[p]))-(a : K) • dirac K (0 : ℤ_[p]) := sorry

theorem smoothedMeasure_residue_recurrence (a : ℕ) (ha : ¬p∣a) (m : ℕ)
    (r : ZMod (p^m)) :
    let red : C(ℤ_[p],ZMod (p^m)) :=
      ⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩
    let c := finiteProjection red (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha))
    c (r-(a : ZMod (p^m)))-c r=
      (∑ i ∈ Finset.range a, if (i : ZMod (p^m))=r then (1 : K) else 0)-
        (a : K)*(if r=0 then 1 else 0) := sorry

theorem smoothedMeasure_residue [CharZero K] (a : ℕ) (ha : ¬p∣a) (m : ℕ)
    (u : (ZMod (p^m))ˣ) (hu : (u : ZMod (p^m))=(a : ZMod (p^m)))
    (r : ZMod (p^m)) :
    finiteProjection
      (⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩ : C(ℤ_[p],ZMod (p^m)))
      (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha)) r=
    ((a : K)-1)/2+((r.val : K)-(a : K)*(((↑u⁻¹ : ZMod (p^m))*r).val : K))/
      ((p^m : ℕ) : K) := sorry

end SmoothedResidueMasses

end

end DirichletPadic

namespace SuggestedSmoothedResidueTests
noncomputable section
open scoped AbstractMeasure BigOperators

open AbstractMeasure DirichletPadic

variable [IsBoundedSMul ℤ_[2] ℚ_[2]] [IsBoundedSMul ℤ_[3] ℚ_[3]]

-- SuggestedSmoothedResidueTests.ternary_translation_difference
example :
    AbstractMeasure.map (⟨fun x : ℤ_[3] => x+2, by fun_prop⟩ : C(ℤ_[3],ℤ_[3]))
      (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)))-
      extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num))=
    dirac ℚ_[3] (1 : ℤ_[3])-dirac ℚ_[3] (0 : ℤ_[3]) := sorry

-- SuggestedSmoothedResidueTests.multiple_wrap_recurrence
example :
    let red : C(ℤ_[2],ZMod (2^1)) :=
      ⟨PadicInt.toZModPow 1,PadicInt.continuous_toZModPow 2 1⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 5 (by norm_num)))
    c 1-c 0= -2 := sorry

-- SuggestedSmoothedResidueTests.ternary_three_cells
example :
    let red : C(ℤ_[3],ZMod (3^1)) :=
      ⟨PadicInt.toZModPow 1,PadicInt.continuous_toZModPow 3 1⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)))
    c 0=1/2 ∧ c 1= -1/2 ∧ c 2=1/2 := sorry

-- SuggestedSmoothedResidueTests.dyadic_four_cells
example :
    let red : C(ℤ_[2],ZMod (2^2)) :=
      ⟨PadicInt.toZModPow 2,PadicInt.continuous_toZModPow 2 2⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 3 (by norm_num)))
    c 0=1 ∧ c 1= -1 ∧ c 2=0 ∧ c 3=1 := sorry

-- SuggestedSmoothedResidueTests.identity_parameter_cells
example (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]] (h1 : ¬p∣1)
    (m : ℕ) (r : ZMod (p^m)) :
    finiteProjection
      (⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩ : C(ℤ_[p],ZMod (p^m)))
      (extendIntegralCoefficients (R := ℚ_[p]) (smoothedMeasure p 1 h1)) r=0 := sorry

end

end SuggestedSmoothedResidueTests

/-! Arithmetic specializations of the existing PMIA character evaluator. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "K" => ℚ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "E" => (fun (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) =>
  unitCharacterEval p κ hκ (kubotaLeopoldtPseudomeasure p))

theorem kubotaLeopoldt_character_clearing
    (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) :
    ((padicIntrinsicNumerator p g) κ.toContinuousMap : K) =
      ((κ g-1 : Z) : K) * E κ hκ := sorry

theorem kubotaLeopoldt_character_ratio
    (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) (hg : κ g ≠ 1) :
    E κ hκ = ((padicIntrinsicNumerator p g) κ.toContinuousMap : K) /
      ((κ g-1 : Z) : K) := sorry

theorem kubotaLeopoldt_character_positive
    (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (k : ℕ) (hk : 0 < k)
    (hpow : ∀ u : U, κ u = (u : Z)^k) :
    E κ hκ = -(1-(p : K)^(k-1))*algebraMap ℚ K (bernoulli k/(k : ℚ)) := sorry

theorem kubotaLeopoldt_character_odd
    (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hodd : κ (-1) = -1) :
    E κ hκ = 0 := sorry

variable [IsBoundedSMul Z K]

theorem kubotaLeopoldt_character_combination {ι : Type*} (s : Finset ι)
    (κ : ι → ContinuousMonoidHom U Z) (hκ : ∀ i, κ i ≠ 1) (c : ι → K)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a)
    (hd : ∀ i ∈ s, κ i g ≠ 1) :
    ∑ i ∈ s, c i * E (κ i) (hκ i) =
      extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
        (∑ i ∈ s, (c i / ((κ i g-1 : Z) : K)) •
          (⟨fun u => (κ i u : K), by fun_prop⟩ : C(U,K))) := sorry

theorem kubotaLeopoldt_character_kummer {ι : Type*} (s : Finset ι)
    (κ : ι → ContinuousMonoidHom U Z) (hκ : ∀ i, κ i ≠ 1) (c : ι → K)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a)
    (hd : ∀ i ∈ s, κ i g ≠ 1) (B : ℝ) (hB : 0 ≤ B)
    (hf : ∀ u : U, ‖∑ i ∈ s, (c i / ((κ i g-1 : Z) : K)) * (κ i u : K)‖ ≤ B) :
    ‖∑ i ∈ s, c i * E (κ i) (hκ i)‖ ≤ B := sorry

theorem kubotaLeopoldt_character_difference
    (κ η : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hη : η ≠ 1)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a)
    (hdκ : κ g ≠ 1) (hdη : η g ≠ 1) (ε : ℝ) (hε : 0 ≤ ε)
    (hclose : ∀ u : U, ‖κ u-η u‖ ≤ ε) :
    ‖E κ hκ-E η hη‖ ≤ ε / (‖κ g-1‖ * ‖η g-1‖) := sorry

theorem kubotaLeopoldt_character_unit_denominators
    (κ η : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hη : η ≠ 1)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a)
    (hdκ : IsUnit (κ g-1)) (hdη : IsUnit (η g-1)) (ε : ℝ) (hε : 0 ≤ ε)
    (hclose : ∀ u : U, ‖κ u-η u‖ ≤ ε) :
    ‖E κ hκ-E η hη‖ ≤ ε := sorry

theorem kubotaLeopoldt_fixed_character_weight_period
    (α κ η : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hη : η ≠ 1)
    (k l r : ℕ) (hk : 0 < k) (hl : 0 < l) (hr : 0 < r)
    (hweight : Nat.ModEq (p^(r-1)*(p-1)) k l)
    (hκpow : ∀ u : U, κ u = α u*(u : Z)^k)
    (hηpow : ∀ u : U, η u = α u*(u : Z)^l)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a)
    (hdκ : IsUnit (κ g-1)) (hdη : IsUnit (η g-1)) :
    ‖E κ hκ-E η hη‖ ≤ ((p : ℝ)^r)⁻¹ := sorry

namespace SuggestedArithmeticCharacterTests
-- SuggestedArithmeticCharacterTests.identity_clearing
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) :
    ((padicIntrinsicNumerator p 1) κ.toContinuousMap : K) =
      ((κ 1-1 : Z) : K) * E κ hκ := sorry
-- SuggestedArithmeticCharacterTests.zero_denominator_numerator
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) (hg : κ g = 1) :
    (padicIntrinsicNumerator p g) κ.toContinuousMap = 0 := sorry
-- SuggestedArithmeticCharacterTests.ratio_sign_parameter
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hodd : κ (-1) = -1) :
    ((padicIntrinsicNumerator p (-1)) κ.toContinuousMap : K) /
      ((κ (-1)-1 : Z) : K) = 0 := sorry
-- SuggestedArithmeticCharacterTests.ratio_two_parameters
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g h : U)
    (hg : κ g ≠ 1) (hh : κ h ≠ 1) :
    ((padicIntrinsicNumerator p g) κ.toContinuousMap : K) / ((κ g-1 : Z) : K) =
    ((padicIntrinsicNumerator p h) κ.toContinuousMap : K) / ((κ h-1 : Z) : K) := sorry
-- SuggestedArithmeticCharacterTests.positive_first
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hv : ∀ u : U, κ u = (u : Z)) :
    E κ hκ = 0 := sorry
-- SuggestedArithmeticCharacterTests.positive_ternary_second
example (κ : ContinuousMonoidHom (ℤ_[3])ˣ ℤ_[3]) (hκ : κ ≠ 1)
    (hv : ∀ u : (ℤ_[3])ˣ, κ u = (u : ℤ_[3])^2) :
    unitCharacterEval 3 κ hκ (kubotaLeopoldtPseudomeasure 3) = 1/6 := sorry
-- SuggestedArithmeticCharacterTests.odd_dyadic
example (κ : ContinuousMonoidHom (ℤ_[2])ˣ ℤ_[2]) (hκ : κ ≠ 1) (hodd : κ (-1) = -1) :
    unitCharacterEval 2 κ hκ (kubotaLeopoldtPseudomeasure 2) = 0 := sorry
-- SuggestedArithmeticCharacterTests.odd_is_nontrivial
example : (1 : ContinuousMonoidHom U Z) (-1) ≠ -1 := sorry
-- SuggestedArithmeticCharacterTests.combination_empty
example (κ : ℕ → ContinuousMonoidHom U Z) (hκ : ∀ i, κ i ≠ 1) (c : ℕ → K) :
    ∑ i ∈ (∅ : Finset ℕ), c i*E (κ i) (hκ i) = 0 := sorry
-- SuggestedArithmeticCharacterTests.combination_single
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (a : ℕ) (ha : ¬p∣a) (g : U) (hg : (g : Z) = a) (hd : κ g ≠ 1) :
    ((κ g-1 : Z) : K)*E κ hκ =
      extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
        (⟨fun u => (κ u : K), by fun_prop⟩ : C(U,K)) := sorry
-- SuggestedArithmeticCharacterTests.kummer_zero_function
example {ι : Type*} (s : Finset ι) (κ : ι → ContinuousMonoidHom U Z)
    (hκ : ∀ i, κ i ≠ 1) (c : ι → K) (a : ℕ) (ha : ¬p∣a)
    (g : U) (hg : (g : Z) = a) (hd : ∀ i ∈ s, κ i g ≠ 1)
    (hf : ∀ u : U, ∑ i ∈ s, (c i / ((κ i g-1 : Z) : K)) * (κ i u : K) = 0) :
    ∑ i ∈ s, c i * E (κ i) (hκ i) = 0 := sorry
-- SuggestedArithmeticCharacterTests.kummer_ternary_control
example : ‖(15/4 : ℚ_[3])‖ = (1/3 : ℝ) ∧ ‖(23/60 : ℚ_[3])‖ = 3 := sorry
-- SuggestedArithmeticCharacterTests.difference_equal_characters
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) : ‖E κ hκ-E κ hκ‖ = 0 := sorry
-- SuggestedArithmeticCharacterTests.difference_ternary_loss
example : ‖(23/60 : ℚ_[3])‖ = (1/3 : ℝ) / (‖(3 : ℚ_[3])‖*‖(15 : ℚ_[3])‖) := sorry
-- SuggestedArithmeticCharacterTests.unit_denominator_quinary
example : IsUnit ((2 : ℤ_[5])^2-1) ∧ IsUnit ((2 : ℤ_[5])^6-1) ∧
    ‖(-760/63 : ℚ_[5])‖ = (1/5 : ℝ) := sorry
-- SuggestedArithmeticCharacterTests.dyadic_no_unit_denominator
example (κ : ContinuousMonoidHom (ℤ_[2])ˣ ℤ_[2]) (g : (ℤ_[2])ˣ) :
    ¬IsUnit (κ g-1) := sorry
-- SuggestedArithmeticCharacterTests.fixed_component_identity
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (r : ℕ) :
    ‖E κ hκ-E κ hκ‖ ≤ ((p : ℝ)^r)⁻¹ := sorry
-- SuggestedArithmeticCharacterTests.fixed_component_trivial_factor
example (κ η : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hη : η ≠ 1)
    (k l : ℕ) (hk : 0 < k) (hl : 0 < l)
    (hκpow : ∀ u : U, κ u = (u : Z)^k) (hηpow : ∀ u : U, η u = (u : Z)^l) :
    E κ hκ-E η hη =
      -(1-(p : K)^(k-1))*algebraMap ℚ K (bernoulli k/(k : ℚ)) +
        (1-(p : K)^(l-1))*algebraMap ℚ K (bernoulli l/(l : ℚ)) := sorry
end SuggestedArithmeticCharacterTests
end
end DirichletPadic

/-! Exact signatures omitted until the owned supplier carriers/maps are present:

DirichletPadic.kubotaLeopoldt_completed_comparison
DirichletPadic.kubotaLeopoldt_completed_plus
DirichletPadic.kubotaLeopoldt_sign_quotient_comparison
DirichletPadic.kubotaLeopoldt_coefficient_naturality

The packet states their arithmetic contracts and five precise PMIA requests.
In particular, a corner ring has identity e-plus, and a quotient pushforward is
not automatically a map of total quotient rings. No abstract carrier with a
field asserting the requested comparison is substituted for those inputs.
-/
