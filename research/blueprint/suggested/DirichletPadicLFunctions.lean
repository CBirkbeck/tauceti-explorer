import TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum
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
import TauCeti.NumberTheory.ModularForms.Degeneracy
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
# Suggested Lean forms: integral smoothing, Bernoulli coefficients and moments

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The signatures suggest names, hypotheses and tests, not completed implementations.
New proofs use `sorry`. The baseline is Mathlib 082e2d3 and Tau Ceti f790474.

The formal algebra uses natural smoothing parameters whose images are units. In the arithmetic
application a > 1 is prime to p. The a = 1 extension is included as a zero test. No inversion of
X occurs in the power-series ring. Generic Amice inversion is already in the pinned library.
Formal substitution by exp(X)-1 takes place over a Q-algebra, not over Z_p.
The ordinary-moment proof imports the exact planned comparison at
PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp. It is not a compiled library module:
these signatures neither assume the comparison as a hypothesis nor claim its implementation.
The actual supplier suggested file is imported above to type its planned operators.
It is an unchecked prototype dependency, not a Mathlib module or a completed proof.
The L0 actual Bernoulli and smoothing kernels, normalized continuations, zeta comparisons and formal-derivative comparisons are supplied below.
-/

noncomputable section
open scoped PowerSeries AbstractMeasure
open PowerSeries

namespace DirichletPadic

variable (R : Type*) [CommRing R]

/-- The integral quotient of `(1+X)^a-1` by X, via binomial coefficients. -/
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

/-- The pole-cancelled integral smoothing series. -/
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

-- The rational expression is a comparison in a field receiving R[[X]], not its definition.
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

-- The same rational number has independent complex and p-adic images.
-- This is a smoothing specialization of existing negative zeta values, not new continuation.
theorem smoothedBernoulli_complex (a k : ℕ) :
    algebraMap ℚ ℂ ((1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)) =
      (-1 : ℂ) ^ k * (1 - (a : ℂ) ^ (k + 1)) * riemannZeta (-(k : ℂ)) := sorry

variable (p : ℕ) [Fact p.Prime]

/-- The concrete arithmetic smoothing measure, using the existing Amice inverse. -/
def smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) : D(ℤ_[p], ℤ_[p]) := sorry

theorem amice_smoothedMeasure (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    (smoothedMeasure p a ha).amiceTransform = smoothedSeries ℤ_[p] a hu := sorry

theorem smoothedMeasure_mahler (a n : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p])) :
    smoothedMeasure p a ha (mahler n : C(ℤ_[p], ℤ_[p])) =
      coeff n (smoothedSeries ℤ_[p] a hu) := sorry

theorem smoothedMeasure_unique (a : ℕ) (ha : ¬ p ∣ a) (hu : IsUnit (a : ℤ_[p]))
    (μ : D(ℤ_[p], ℤ_[p])) (hμ : μ.amiceTransform = smoothedSeries ℤ_[p] a hu) :
    μ = smoothedMeasure p a ha := sorry

-- Uses PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp from the supplier blueprint.
-- The measure is still Z_p-valued; only its evaluated value is embedded in Q_p.
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

-- Denominator definition: zero, one, and a nonconstant small case.
-- SuggestedTests.denominator_zero
example : smoothingDenominator ℤ 0 = 0 := sorry
-- SuggestedTests.denominator_one
example : smoothingDenominator ℤ 1 = 1 := sorry
-- SuggestedTests.denominator_two
example : smoothingDenominator ℤ 2 = C 2 + X := sorry

-- Series definition: degenerate smoothing, sign, and an integral dyadic example.
-- SuggestedTests.series_one
example (h : IsUnit (1 : ℚ)) : smoothedSeries ℚ 1 h = 0 := sorry
-- SuggestedTests.series_two_sign
example (h : IsUnit (2 : ℚ)) :
    constantCoeff (smoothedSeries ℚ 2 h) = 1/2 ∧
      coeff 1 (smoothedSeries ℚ 2 h) = -1/4 := sorry
-- SuggestedTests.series_three_dyadic
example (h : IsUnit (3 : ℤ_[2])) :
    constantCoeff (smoothedSeries ℤ_[2] 3 h) = 1 := sorry

-- The measure is determined in the existing carrier: zero and two Mahler values.
-- SuggestedTests.measure_one
example (h : ¬ 3 ∣ 1) : smoothedMeasure 3 1 h = 0 := sorry
-- SuggestedTests.measure_two_mass
example (h : ¬ 3 ∣ 2) :
    2 * smoothedMeasure 3 2 h (mahler 0 : C(ℤ_[3], ℤ_[3])) = 1 := sorry
-- SuggestedTests.measure_dyadic_mass
example (h : ¬ 2 ∣ 3) :
    smoothedMeasure 2 3 h (mahler 0 : C(ℤ_[2], ℤ_[2])) = 1 := sorry

-- Coprimality is essential: the a=2 series cannot have its required constant coefficient in Z_2.
-- SuggestedTests.nonunit_dyadic_rejection
example : ¬ ∃ F : ℤ_[2]⟦X⟧,
    X * smoothingDenominator ℤ_[2] 2 * F = smoothingDenominator ℤ_[2] 2 - C 2 := sorry

-- Formal exponential substitution must be over Q or Q_p, not Z_p.
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
-- SuggestedTests.complex_zero_sign
example : (1 - (2 : ℂ)) * riemannZeta 0 = 1/2 := sorry

end SuggestedTests

namespace DirichletPadic
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]

/-- Arithmetic cancellation of the two cyclotomic rational averages. -/
theorem smoothed_rational_average {K : Type*} [Field K] [CharZero K]
    (ζ y : K) (hζ : IsPrimitiveRoot ζ p) (a : ℕ) (ha : ¬ p ∣ a)
    (hy : y ^ p ≠ 1) (hya : y ^ (p * a) ≠ 1) :
    (∑ i ∈ Finset.range p, (1 / (ζ ^ i * y - 1) -
      (a : K) / ((ζ ^ i * y) ^ a - 1))) =
      (p : K) * (1 / (y ^ p - 1) - (a : K) / (y ^ (p * a) - 1)) := sorry

-- The proof plans below require the precise rational-series averaging request in the packet.
-- No bounded psi operator is applied to 1/X, and psi invariance is not an input hypothesis.
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

/-- The arithmetic smoothing measure restricted to units, on the ambient measure carrier. -/
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

/-- The arithmetic numerator of the source's pseudomeasure, using the shared unit inverse. -/
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
-- A tempting omission of inverse weighting fails: at p=3,a=2 the unit measure's
-- first moment is 1/2 whereas the numerator's first moment is zero.
-- SuggestedTests.numerator_not_unit_measure
example (h : ¬ 3 ∣ 2) : smoothedNumerator 3 2 h ≠ unitSmoothedMeasure 3 2 h := sorry
-- Endpoint has zero Euler factor; never cancel it to infer a value for zeta(0).
-- SuggestedTests.numerator_first_dyadic
example (h : ¬ 2 ∣ 3) : smoothedNumerator 2 3 h (ContinuousMap.id ℤ_[2]) = 0 := sorry
end SuggestedTests

/-! Arithmetic smoothing relations. Generic pushforward and inverse weighting are imported.
The actual measures, not their moments as additional hypotheses, occur in every signature.
The inverse-weighted expressions are the numerator J(r μ_a)=J μ_a by the exact supplier.
-/
namespace DirichletPadic
section SmoothingRelations
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]

-- DirichletPadicLFunctions:L1/measure-smoothing-cocycle
theorem smoothedMeasure_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a * b) :
    smoothedMeasure p (a * b) hab = smoothedMeasure p a ha +
      (a : Z) • AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p b hb) := sorry

-- DirichletPadicLFunctions:L1/measure-cross-smoothing
theorem smoothedMeasure_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) :
    (b : Z) • AbstractMeasure.map
        ⟨fun z : Z => (b : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p a ha) - smoothedMeasure p a ha =
    (a : Z) • AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedMeasure p b hb) - smoothedMeasure p b hb := sorry

-- DirichletPadicLFunctions:L1/measure-reflection
theorem smoothedMeasure_reflection (a : ℕ) (ha : ¬ p ∣ a) :
    smoothedMeasure p a ha +
      AbstractMeasure.map ⟨fun z : Z => -z, continuous_neg⟩ (smoothedMeasure p a ha) =
        ((a : Z) - 1) • AbstractMeasure.dirac Z 0 := sorry

-- DirichletPadicLFunctions:L1/numerator-smoothing-cocycle
theorem smoothedNumerator_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a * b) :
    smoothedNumerator p (a * b) hab = smoothedNumerator p a ha +
      AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p b hb) := sorry

-- DirichletPadicLFunctions:L1/numerator-cross-smoothing
theorem smoothedNumerator_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) :
    AbstractMeasure.map
        ⟨fun z : Z => (b : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p a ha) - smoothedNumerator p a ha =
    AbstractMeasure.map
        ⟨fun z : Z => (a : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p b hb) - smoothedNumerator p b hb := sorry

-- DirichletPadicLFunctions:L1/numerator-even
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


/-!
Positive Eisenstein coefficients (L4). These are native integral measures on the actual unit
 group. The index is positive, so this constructor makes no assertion about A₀. The modular-form
 comparison is supplied below; the completed-algebra image remains an explicit gap.
-/
namespace DirichletPadic
section EisensteinCoefficients
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]

-- DirichletPadicLFunctions:L4/positive-eisenstein-measure
/-- The sum of Dirac measures at positive divisors of n prime to p. -/
def positiveEisensteinMeasure (n : ℕ+) : D(Zˣ, Z) := sorry

theorem positiveEisensteinMeasure_eq_sum (n : ℕ+) :
    positiveEisensteinMeasure p n =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        AbstractMeasure.dirac Z
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation
theorem positiveEisensteinMeasure_apply (n : ℕ+) (f : C(Zˣ, Z)) :
    positiveEisensteinMeasure p n f =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        f (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-moment
theorem positiveEisensteinMeasure_moment (n : ℕ+) (e : ℕ) :
    positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ =
      ∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : Z) ^ e := sorry

theorem positiveEisensteinMeasure_one :
    positiveEisensteinMeasure p 1 = AbstractMeasure.dirac Z 1 := sorry

theorem positiveEisensteinMeasure_prime_pow (r : ℕ) :
    positiveEisensteinMeasure p ⟨p ^ r, pow_pos (Fact.out : p.Prime).pos r⟩ =
      AbstractMeasure.dirac Z 1 := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-remove-p
theorem positiveEisensteinMeasure_mul_p (n : ℕ+) :
    positiveEisensteinMeasure p
      ⟨p * (n : ℕ), Nat.mul_pos (Fact.out : p.Prime).pos n.pos⟩ =
        positiveEisensteinMeasure p n := sorry

theorem positiveEisensteinMeasure_mass (n : ℕ+) :
    positiveEisensteinMeasure p n 1 =
      (((n : ℕ).divisors.filter fun d => ¬ p ∣ d).card : Z) := sorry

-- DirichletPadicLFunctions:L4/divisor-sum-euler-deletion
-- Integer subtraction, including exponent zero, avoids truncated natural subtraction.
theorem divisorSum_eulerDeletion (n : ℕ+) (e : ℕ) :
    (∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : ℤ) ^ e) =
      (ArithmeticFunction.sigma e n : ℤ) -
        if p ∣ (n : ℕ) then (p : ℤ) ^ e *
          (ArithmeticFunction.sigma e ((n : ℕ) / p) : ℤ) else 0 := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-euler-moment
theorem positiveEisensteinMeasure_euler_moment (n : ℕ+) (e : ℕ) :
    positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ =
      (ArithmeticFunction.sigma e n : Z) -
        if p ∣ (n : ℕ) then (p : Z) ^ e *
          (ArithmeticFunction.sigma e ((n : ℕ) / p) : Z) else 0 := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence
theorem positiveEisensteinMeasure_moment_congr (n : ℕ+) (r e e' : ℕ)
    (hr : 0 < r) (he : Nat.ModEq (p ^ (r - 1) * (p - 1)) e e') :
    (p : Z) ^ r ∣
      positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e', by fun_prop⟩ -
        positiveEisensteinMeasure p n ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩ := sorry

end EisensteinCoefficients
end DirichletPadic

namespace SuggestedEisensteinTests
open DirichletPadic

-- SuggestedEisensteinTests.first_coefficient
example : positiveEisensteinMeasure 3 1 = AbstractMeasure.dirac ℤ_[3] 1 := sorry

-- SuggestedEisensteinTests.prime_coefficient_survives
example : positiveEisensteinMeasure 3 3 = AbstractMeasure.dirac ℤ_[3] 1 := sorry

-- SuggestedEisensteinTests.dyadic_divisor_sum
example (h3 : IsUnit (3 : ℤ_[2])) :
    positiveEisensteinMeasure 2 6 = AbstractMeasure.dirac ℤ_[2] 1 +
      AbstractMeasure.dirac ℤ_[2] h3.unit := sorry

-- SuggestedEisensteinTests.mass_counts_divisors
example : positiveEisensteinMeasure 2 6 1 = (2 : ℤ_[2]) := sorry

-- SuggestedEisensteinTests.weight_four_dyadic
example : positiveEisensteinMeasure 2 6
    ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]) ^ 3, by fun_prop⟩ = 28 := sorry

-- SuggestedEisensteinTests.euler_deletion_six
example : (∑ d ∈ (6 : ℕ).divisors with ¬ 3 ∣ d, (d : ℤ) ^ 3) =
    (ArithmeticFunction.sigma 3 6 : ℤ) - 27 * (ArithmeticFunction.sigma 3 2 : ℤ) := sorry

-- SuggestedEisensteinTests.dyadic_precision
example : (8 : ℤ_[2]) ∣
    positiveEisensteinMeasure 2 3 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]) ^ 5, by fun_prop⟩ -
      positiveEisensteinMeasure 2 3 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]), by fun_prop⟩ := sorry

-- SuggestedEisensteinTests.tame_component_not_enough_for_precision
example [Fact (Nat.Prime 5)] : ¬ (25 : ℤ_[5]) ∣
    positiveEisensteinMeasure 5 2 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5]) ^ 7, by fun_prop⟩ -
      positiveEisensteinMeasure 5 2 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5]) ^ 3, by fun_prop⟩ := sorry

end SuggestedEisensteinTests

/-!
Arithmetic Eisenstein normalization and its actual p-stabilized modular form (L4).
The classical form is the existing Mathlib E. The source's arithmetic normalization
is a scalar multiple; the level change uses the existing Tau Ceti degeneracy map.
The positive coefficient comparison uses the same integer in ℂ and ℤ_p.
The construction of A₀ and its completed-algebra comparison remain separate gaps.
-/
namespace DirichletPadic
section ClassicalEisenstein
open scoped MatrixGroups
open CongruenceSubgroup Matrix.SpecialLinearGroup UpperHalfPlane

-- DirichletPadicLFunctions:L4/normalized-eisenstein
/-- RJW's arithmetic normalization of the existing constant-one Eisenstein form. -/
def normalizedEisenstein (k : ℕ) (hk : 4 ≤ k) : ModularForm 𝒮ℒ (k : ℤ) :=
  (-(bernoulli k : ℂ) / (2 * k)) • ModularForm.E (by omega : 3 ≤ k)

theorem normalizedEisenstein_eq_smul (k : ℕ) (hk : 4 ≤ k) :
    normalizedEisenstein k hk =
      (-(bernoulli k : ℂ) / (2*k)) • ModularForm.E (by omega : 3 ≤ k) := sorry

theorem normalizedEisenstein_apply (k : ℕ) (hk : 4 ≤ k) (z : ℍ) :
    normalizedEisenstein k hk z =
      (-(bernoulli k : ℂ) / (2*k)) * ModularForm.E (by omega : 3 ≤ k) z := sorry

-- DirichletPadicLFunctions:L4/normalized-eisenstein-coeff
theorem normalizedEisenstein_coeff (k : ℕ) (hk : 4 ≤ k) (he : Even k) (n : ℕ) :
    (qExpansion 1 (normalizedEisenstein k hk)).coeff n =
      if n = 0 then -(bernoulli k : ℂ) / (2*k)
      else (ArithmeticFunction.sigma (k-1) n : ℂ) := sorry

-- DirichletPadicLFunctions:L4/normalized-eisenstein-zeta-constant
theorem normalizedEisenstein_constant_zeta (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    (qExpansion 1 (normalizedEisenstein k hk)).coeff 0 =
      riemannZeta (1 - (k : ℂ)) / 2 ∧
    (qExpansion 1 (normalizedEisenstein k hk)).coeff 0 =
      algebraMap ℚ ℂ (-bernoulli k / (2*k)) := sorry

variable (p : ℕ) [Fact p.Prime]
-- DirichletPadicLFunctions:L4/p-stabilized-eisenstein
/-- Arithmetic p-stabilization in the native modular-form carrier at Γ₀(p). -/
def pStabilizedEisenstein (k : ℕ) (hk : 4 ≤ k) :
    ModularForm ((Gamma0 p).map (mapGL ℝ)) (k : ℤ) :=
  ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk) -
    (p : ℂ) ^ (k - 1) • TauCeti.ModularForm.levelRaise p
      (by simpa using TauCeti.Gamma0_map_le_conjAct_scaleGL 1 p)
      (ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk))

theorem pStabilizedEisenstein_eq (k : ℕ) (hk : 4 ≤ k) :
    pStabilizedEisenstein p k hk =
      ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk) -
        (p : ℂ) ^ (k - 1) • TauCeti.ModularForm.levelRaise p
          (by simpa using TauCeti.Gamma0_map_le_conjAct_scaleGL 1 p)
          (ModularForm.ofLe (Subgroup.map_le_range _ _) (normalizedEisenstein k hk)) := sorry

theorem pStabilizedEisenstein_apply (k : ℕ) (hk : 4 ≤ k) (z : ℍ) :
    pStabilizedEisenstein p k hk z = normalizedEisenstein k hk z -
      (p : ℂ) ^ (k-1) * normalizedEisenstein k hk (TauCeti.scaleGL p • z) := sorry

-- DirichletPadicLFunctions:L4/p-stabilized-q-expansion
theorem pStabilizedEisenstein_qExpansion (k : ℕ) (hk : 4 ≤ k) :
    qExpansion 1 (pStabilizedEisenstein p k hk) =
      qExpansion 1 (normalizedEisenstein k hk) - (p : ℂ) ^ (k-1) •
        (qExpansion 1 (normalizedEisenstein k hk)).expand p (NeZero.ne p) := sorry

-- DirichletPadicLFunctions:L4/p-stabilized-positive-coeff
theorem pStabilizedEisenstein_coeff_pos (k : ℕ) (hk : 4 ≤ k) (he : Even k) (n : ℕ+) :
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff (n : ℕ) =
      ((∑ d ∈ (n : ℕ).divisors with ¬ p ∣ d, (d : ℤ) ^ (k-1)) : ℂ) := sorry

-- DirichletPadicLFunctions:L4/p-stabilized-zeta-constant
theorem pStabilizedEisenstein_constant_zeta (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 =
      (1 - (p : ℂ) ^ (k-1)) * riemannZeta (1 - (k : ℂ)) / 2 ∧
    (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 =
      algebraMap ℚ ℂ (-(1-(p : ℚ)^(k-1))*bernoulli k/(2*k)) := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-modular-comparison
-- A joint comparison via ℤ, never an arbitrary map from ℂ to a p-adic field.
theorem positiveEisensteinMeasure_modular_coeff (k : ℕ) (hk : 4 ≤ k) (he : Even k)
    (n : ℕ+) :
    ∃! S : ℤ,
      (qExpansion 1 (pStabilizedEisenstein p k hk)).coeff (n : ℕ) = (S : ℂ) ∧
      positiveEisensteinMeasure p n
        ⟨fun u : ℤ_[p]ˣ => (u : ℤ_[p]) ^ (k-1), by fun_prop⟩ = (S : ℤ_[p]) := sorry

end ClassicalEisenstein
end DirichletPadic

namespace SuggestedModularTests
open DirichletPadic UpperHalfPlane

-- SuggestedModularTests.weight_four_normalization
example : (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 0 = (1/240 : ℂ) ∧
    (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 1 = 1 := sorry

-- SuggestedModularTests.weight_six_sign
example : (qExpansion 1 (normalizedEisenstein 6 (by decide))).coeff 0 = (-1/504 : ℂ) ∧
    (qExpansion 1 (normalizedEisenstein 6 (by decide))).coeff 2 = 33 := sorry

-- SuggestedModularTests.native_constant_one_rejected
example : (qExpansion 1 (normalizedEisenstein 4 (by decide))).coeff 0 ≠ (1 : ℂ) := sorry

-- SuggestedModularTests.dyadic_stabilized_constant
example : (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0 = (-7/240 : ℂ) := sorry

-- SuggestedModularTests.coefficient_at_p_survives
example : (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 2 = (1 : ℂ) ∧
    (qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 2 ≠ (0 : ℂ) := sorry

-- SuggestedModularTests.prime_to_p_index
example : (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 2 = (9 : ℂ) := sorry

-- SuggestedModularTests.multiple_of_p_index
example : (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 6 = (9 : ℂ) ∧
    (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 6 =
      (qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 2 := sorry

end SuggestedModularTests


/- Finite coordinates of the actual positive Eisenstein coefficient measures. -/
noncomputable section
namespace DirichletPadic
section FiniteEisenstein
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]

/-- The two indices are respectively the unit-group level and coefficient precision. -/
def positiveEisensteinFinite (n : ℕ+) (r s : ℕ) :
    MonoidAlgebra (ZMod (p ^ s)) (ZMod (p ^ r))ˣ := sorry

theorem positiveEisensteinFinite_eq_sum (n : ℕ+) (r s : ℕ) :
    positiveEisensteinFinite p n r s =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        MonoidAlgebra.single ((Units.map (PadicInt.toZModPow r).toMonoidHom) (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit) 1 else 0 := sorry

theorem positiveEisensteinFinite_coeff (n : ℕ+) (r s : ℕ) (a : (ZMod (p ^ r))ˣ) :
    (positiveEisensteinFinite p n r s).coeff a =
      ∑ d ∈ (n : ℕ).divisors, if hd : ¬ p ∣ d then
        (if (Units.map (PadicInt.toZModPow r).toMonoidHom) (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
          ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit = a then (1 : ZMod (p ^ s)) else 0) else 0 := sorry

theorem positiveEisensteinFinite_transition (n : ℕ+) {r r' s s' : ℕ}
    (hr : r' ≤ r) (hs : s' ≤ s) :
    MonoidAlgebra.mapDomainRingHom (ZMod (p ^ s')) (ZMod.unitsMap (pow_dvd_pow p hr))
      (MonoidAlgebra.mapRingHom _ (ZMod.castHom (pow_dvd_pow p hs) (ZMod (p ^ s')))
        (positiveEisensteinFinite p n r s)) = positiveEisensteinFinite p n r' s' := sorry

theorem positiveEisensteinFinite_apply (n : ℕ+) (r s : ℕ)
    (f : C(Zˣ, Z)) (g : (ZMod (p ^ r))ˣ → ZMod (p ^ s))
    (hfg : ∀ u : Zˣ, PadicInt.toZModPow s (f u) = g ((Units.map (PadicInt.toZModPow r).toMonoidHom) u)) :
    PadicInt.toZModPow s (positiveEisensteinMeasure p n f) =
      ∑ a, (positiveEisensteinFinite p n r s).coeff a * g a := sorry

theorem positiveEisensteinFinite_moment (n : ℕ+) {r s : ℕ} (h : s ≤ r) (e : ℕ) :
    ∑ a : (ZMod (p ^ r))ˣ, (positiveEisensteinFinite p n r s).coeff a *
      (ZMod.castHom (pow_dvd_pow p h) (ZMod (p ^ s)) (a : ZMod (p ^ r))) ^ e =
        PadicInt.toZModPow s (positiveEisensteinMeasure p n
          ⟨fun u : Zˣ => (u : Z) ^ e, by fun_prop⟩) := sorry

theorem positiveEisensteinFinite_one (r s : ℕ) :
    positiveEisensteinFinite p 1 r s = MonoidAlgebra.single 1 1 := sorry

theorem positiveEisensteinFinite_prime_pow (a r s : ℕ) :
    positiveEisensteinFinite p ⟨p ^ a, pow_pos (Fact.out : p.Prime).pos a⟩ r s =
      MonoidAlgebra.single 1 1 := sorry

theorem positiveEisensteinFinite_mul_p (n : ℕ+) (r s : ℕ) :
    positiveEisensteinFinite p ⟨p * (n : ℕ), Nat.mul_pos (Fact.out : p.Prime).pos n.pos⟩ r s =
      positiveEisensteinFinite p n r s := sorry

theorem positiveEisensteinFinite_coeff_zero (n : ℕ+) (r : ℕ) :
    positiveEisensteinFinite p n r 0 = 0 := sorry

-- FiniteCoefficientTests.dyadic_separated
example : positiveEisensteinFinite 2 6 2 3 =
    MonoidAlgebra.single 1 1 + MonoidAlgebra.single (-1) 1 := sorry
-- FiniteCoefficientTests.dyadic_collision
example : positiveEisensteinFinite 2 6 1 3 = MonoidAlgebra.single 1 2 := sorry
-- FiniteCoefficientTests.dyadic_cancellation
example : positiveEisensteinFinite 2 6 1 1 = 0 := sorry
-- FiniteCoefficientTests.prime_coefficient
example : positiveEisensteinFinite 3 3 2 2 = MonoidAlgebra.single 1 1 := sorry
-- FiniteCoefficientTests.trivial_group_mass
example : positiveEisensteinFinite 2 6 0 3 = MonoidAlgebra.single 1 2 := sorry
-- FiniteCoefficientTests.zero_coefficient_ring
example (n : ℕ+) (r : ℕ) : positiveEisensteinFinite p n r 0 = 0 := sorry
-- FiniteCoefficientTests.separate_precision_levels
example : positiveEisensteinFinite 2 6 2 1 ≠ 0 ∧ positiveEisensteinFinite 2 6 1 1 = 0 := sorry

end FiniteEisenstein
end DirichletPadic

/- DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates
Planned declaration: DirichletPadic.positiveEisenstein_completed_projection.
The actual PadicMeasuresIwasawaAlgebras:L1 completed carrier, integral measure equivalence,
Dirac comparison and separated joint finite projections are not supplied yet. Once those
native APIs exist, its statement is: projection at (r,s) of the image of
positiveEisensteinMeasure p n equals positiveEisensteinFinite p n r s.
No replacement carrier or theorem assuming that coordinate identity is introduced here. -/

/-!
The positive q-expansion, with coefficientwise topology on the native PowerSeries.
Its zero constant coefficient records truncation to the positive part. It is not A₀.
No topology on a completed group algebra or geometric weight family is introduced.
-/
namespace DirichletPadic
section PositiveSeries
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]

-- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation-bound
 theorem positiveEisensteinMeasure_norm_le (n : ℕ+) (f : C(Zˣ, Z)) :
    ‖positiveEisensteinMeasure p n f‖ ≤ ‖f‖ := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series
/-- The native measure whose values are the positive q-expansions. -/
def positiveEisensteinSeries : AbstractMeasure Zˣ Z (PowerSeries Z) := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
 theorem positiveEisensteinSeries_coeff (f : C(Zˣ, Z)) (n : ℕ) :
    (positiveEisensteinSeries p f).coeff n =
      if hn : 0 < n then positiveEisensteinMeasure p ⟨n, hn⟩ f else 0 := sorry

theorem positiveEisensteinSeries_coeff_zero (f : C(Zˣ, Z)) :
    (positiveEisensteinSeries p f).coeff 0 = 0 := sorry

theorem positiveEisensteinSeries_coeff_pos (f : C(Zˣ, Z)) (n : ℕ+) :
    (positiveEisensteinSeries p f).coeff (n : ℕ) = positiveEisensteinMeasure p n f := sorry

theorem positiveEisensteinSeries_zero : positiveEisensteinSeries p 0 = 0 := sorry

theorem positiveEisensteinSeries_add (f g : C(Zˣ, Z)) :
    positiveEisensteinSeries p (f + g) =
      positiveEisensteinSeries p f + positiveEisensteinSeries p g := sorry

theorem positiveEisensteinSeries_smul (a : Z) (f : C(Zˣ, Z)) :
    positiveEisensteinSeries p (a • f) = a • positiveEisensteinSeries p f := sorry

theorem positiveEisensteinSeries_continuous : Continuous (positiveEisensteinSeries p) := sorry

theorem positiveEisensteinSeries_unique (M : AbstractMeasure Zˣ Z (PowerSeries Z))
    (h0 : ∀ f, (M f).coeff 0 = 0)
    (hpos : ∀ f (n : ℕ+), (M f).coeff (n : ℕ) = positiveEisensteinMeasure p n f) :
    M = positiveEisensteinSeries p := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-bound
 theorem positiveEisensteinSeries_coeff_norm_le (f : C(Zˣ, Z)) (n : ℕ) :
    ‖(positiveEisensteinSeries p f).coeff n‖ ≤ ‖f‖ := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-test-congruence
 theorem positiveEisensteinSeries_test_congr (f g : C(Zˣ, Z)) (r : ℕ)
    (h : ∀ u : Zˣ, (p : Z)^r ∣ f u - g u) :
    PowerSeries.C ((p : Z)^r) ∣ positiveEisensteinSeries p f - positiveEisensteinSeries p g := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-weight-congruence
 theorem positiveEisensteinSeries_weight_congr (r e e' : ℕ)
    (hr : 0 < r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : Z)^r) ∣
      positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^e', by fun_prop⟩ -
        positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^e, by fun_prop⟩ := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-index-invariance
 theorem positiveEisensteinSeries_coeff_mul_p (f : C(Zˣ, Z)) (n : ℕ) :
    (positiveEisensteinSeries p f).coeff (p*n) = (positiveEisensteinSeries p f).coeff n := sorry

-- DirichletPadicLFunctions:L4/positive-eisenstein-series-modular-comparison
open UpperHalfPlane in
 theorem positiveEisensteinSeries_modular (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    ∃! Q : PowerSeries ℤ,
      Q.map (Int.castRingHom ℂ) =
        qExpansion 1 (pStabilizedEisenstein p k hk) -
          PowerSeries.C ((qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0) ∧
      Q.map (Int.castRingHom Z) =
        positiveEisensteinSeries p ⟨fun u : Zˣ => (u : Z)^(k-1), by fun_prop⟩ := sorry

end PositiveSeries
end DirichletPadic

namespace SuggestedPositiveSeriesTests
open DirichletPadic
open scoped PowerSeries.WithPiTopology

-- SuggestedPositiveSeriesTests.zero_input
example : positiveEisensteinSeries 2 0 = 0 := sorry

-- SuggestedPositiveSeriesTests.constant_coefficient
example (f : C(ℤ_[2]ˣ, ℤ_[2])) : (positiveEisensteinSeries 2 f).coeff 0 = 0 := sorry

-- SuggestedPositiveSeriesTests.first_coefficient
example (f : C(ℤ_[3]ˣ, ℤ_[3])) : (positiveEisensteinSeries 3 f).coeff 1 = f 1 := sorry

-- SuggestedPositiveSeriesTests.prime_coefficient
example (f : C(ℤ_[3]ˣ, ℤ_[3])) : (positiveEisensteinSeries 3 f).coeff 3 = f 1 := sorry

-- SuggestedPositiveSeriesTests.dyadic_weight_four
example : (positiveEisensteinSeries 2
    ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^3, by fun_prop⟩).coeff 6 = 28 := sorry

-- SuggestedPositiveSeriesTests.dyadic_series_precision
example : PowerSeries.C (8 : ℤ_[2]) ∣
    positiveEisensteinSeries 2 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^5, by fun_prop⟩ -
      positiveEisensteinSeries 2 ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2]), by fun_prop⟩ := sorry

-- SuggestedPositiveSeriesTests.tame_congruence_insufficient
example [Fact (Nat.Prime 5)] : ¬ PowerSeries.C (25 : ℤ_[5]) ∣
    positiveEisensteinSeries 5 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5])^7, by fun_prop⟩ -
      positiveEisensteinSeries 5 ⟨fun u : ℤ_[5]ˣ => (u : ℤ_[5])^3, by fun_prop⟩ := sorry

-- SuggestedPositiveSeriesTests.omitted_constant_is_nonzero
example : (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0 =
    (-7/240 : ℂ) ∧ (positiveEisensteinSeries 2
      ⟨fun u : ℤ_[2]ˣ => (u : ℤ_[2])^3, by fun_prop⟩).coeff 0 = 0 := sorry
end SuggestedPositiveSeriesTests


/-!
Gamma-normalized continuation from a smooth nonnegative half-line.
All derivatives and growth conditions use the native Mathlib notions.
This extends RJW Theorem 2.4 to complex-valued inputs by the same linear argument.
-/
namespace DirichletPadic
open Filter Set MeasureTheory Asymptotics
open scoped Topology
variable {f : ℝ → ℂ}

-- DirichletPadicLFunctions:L0/mellin-infinity-boundary
theorem mellin_boundary_atTop {a : ℝ} (ha : 0 < a)
    (hd : f =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (s : ℂ) :
    Tendsto (fun t : ℝ => f t * (t : ℂ)^s) atTop (𝓝 0) := sorry

-- DirichletPadicLFunctions:L0/mellin-zero-boundary
theorem mellin_boundary_zero (hf : ContinuousWithinAt f (Ici 0) 0) {s : ℂ} (hs : 0 < s.re) :
    Tendsto (fun t : ℝ => f t * (t : ℂ)^s) (𝓝[>] 0) (𝓝 0) := sorry

-- DirichletPadicLFunctions:L0/mellin-derivative-shift
theorem mellin_derivative_shift {g : ℝ → ℂ} {s : ℂ} (hs : 0 < s.re)
    (hf : ContinuousWithinAt f (Ici 0) 0)
    (hg : ∀ x : ℝ, 0 < x → HasDerivAt f (g x) x)
    (hfm : MellinConvergent f s) (hgm : MellinConvergent g (s+1))
    (hinfty : Tendsto (fun t : ℝ => f t * (t : ℂ)^s) atTop (𝓝 0)) :
    mellin g (s+1) = -s * mellin f s := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-derivative-shift
theorem normalizedMellin_derivative_shift (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (n : ℕ) {s : ℂ} (hs : 0 < s.re) :
    mellin (iteratedDerivWithin n f (Ici 0)) s / Complex.Gamma s =
      -(mellin (iteratedDerivWithin (n+1) f (Ici 0)) (s+1) / Complex.Gamma (s+1)) := sorry

-- DirichletPadicLFunctions:L0/mellin-derivative-at-one
theorem mellin_derivative_at_one (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) :
    mellin (iteratedDerivWithin (n+1) f (Ici 0)) 1 = -iteratedDerivWithin n f (Ici 0) 0 := sorry

-- DirichletPadicLFunctions:L0/mellin-shift-coherence
theorem normalizedMellin_shift_coherence (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (n m : ℕ) {s : ℂ} (hn : 0 < (s+n).re) (hm : 0 < (s+m).re) :
    (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) / Complex.Gamma (s+n)) =
      (-1 : ℂ)^m * (mellin (iteratedDerivWithin m f (Ici 0)) (s+m) / Complex.Gamma (s+m)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-continuation
def normalizedMellinContinuation (f : ℝ → ℂ) (s : ℂ) :
    ℂ := sorry

theorem normalizedMellinContinuation_def (f : ℝ → ℂ) (s : ℂ) :
    normalizedMellinContinuation f s =
      let n := Nat.ceil |s.re| + 1
      (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) /
        Complex.Gamma (s+n)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-admissible-shift
theorem normalizedMellinContinuation_eq_shift (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) {s : ℂ} (hs : 0 < (s+n).re) :
    normalizedMellinContinuation f s = (-1 : ℂ)^n * (mellin (iteratedDerivWithin n f (Ici 0)) (s+n) / Complex.Gamma (s+n)) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-initial-halfplane
theorem normalizedMellinContinuation_eq_mellin (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) {s : ℂ} (hs : 0 < s.re) :
    normalizedMellinContinuation f s = mellin f s / Complex.Gamma s := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-entire
theorem normalizedMellinContinuation_entire (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) :
    Differentiable ℂ (normalizedMellinContinuation f) := sorry

-- DirichletPadicLFunctions:L0/normalized-mellin-negative-values
theorem normalizedMellinContinuation_neg_nat (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) (n : ℕ) :
    normalizedMellinContinuation f (-(n : ℂ)) = (-1 : ℂ)^n * iteratedDerivWithin n f (Ici 0) 0 := sorry

theorem normalizedMellinContinuation_unique (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t)))
    (F : ℂ → ℂ) (hF : Differentiable ℂ F)
    (hinit : ∀ s : ℂ, 0 < s.re → F s = mellin f s / Complex.Gamma s) :
    F = normalizedMellinContinuation f := sorry

theorem normalizedMellinContinuation_congr {f g : ℝ → ℂ}
    (heq : EqOn f g (Ici 0)) :
    normalizedMellinContinuation f = normalizedMellinContinuation g := sorry

theorem normalizedMellinContinuation_zero :
    normalizedMellinContinuation (fun _ : ℝ => (0 : ℂ)) = fun _ => 0 := sorry

theorem normalizedMellinContinuation_add (hf : ContDiffOn ℝ (⊤ : ℕ∞) f (Ici 0))
    (hd : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n f (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) {g : ℝ → ℂ}
    (hg : ContDiffOn ℝ (⊤ : ℕ∞) g (Ici 0))
    (he : ∀ n : ℕ, ∃ a : ℝ, 0 < a ∧
      iteratedDerivWithin n g (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-a*t))) :
    normalizedMellinContinuation (fun t => f t + g t) =
      fun s => normalizedMellinContinuation f s + normalizedMellinContinuation g s := sorry

theorem normalizedMellinContinuation_smul (f : ℝ → ℂ) (c : ℂ) :
    normalizedMellinContinuation (fun t => c * f t) =
      fun s => c * normalizedMellinContinuation f s := sorry

end DirichletPadic

namespace SuggestedMellinContinuationTests
open DirichletPadic Filter Asymptotics
open scoped Topology

-- SuggestedMellinContinuationTests.zero_input
example (s : ℂ) : normalizedMellinContinuation (fun _ : ℝ => (0 : ℂ)) s = 0 := sorry

-- SuggestedMellinContinuationTests.exponential_normalization
example (s : ℂ) : normalizedMellinContinuation (fun t : ℝ => Complex.exp (-t)) s = 1 := sorry

-- SuggestedMellinContinuationTests.linear_exponential
example (s : ℂ) : normalizedMellinContinuation
    (fun t : ℝ => (t : ℂ) * Complex.exp (-t)) s = s := sorry

-- SuggestedMellinContinuationTests.scaled_exponential
example : normalizedMellinContinuation
    (fun t : ℝ => Complex.exp (-2*t)) (-3) = 8 := sorry

-- SuggestedMellinContinuationTests.naive_quotient_at_zero
example : normalizedMellinContinuation (fun t : ℝ => Complex.exp (-t)) 0 = 1 ∧
    mellin (fun t : ℝ => Complex.exp (-t)) 0 / Complex.Gamma 0 = 0 := sorry

-- SuggestedMellinContinuationTests.nondecaying_constant
example : ¬ ∃ a : ℝ, 0 < a ∧
    (fun _ : ℝ => (1 : ℂ)) =O[atTop] (fun t : ℝ => Real.exp (-a*t)) := sorry
end SuggestedMellinContinuationTests

/-! ## Bernoulli kernel: differentiated geometric expansion and decay
The sums below use only positive indices. Nothing in this block asserts
smoothness of the removable extension at zero or a Mellin integral comparison.
-/
namespace DirichletPadic
noncomputable section
open Filter Asymptotics Set
open scoped Topology
local notation "F" => (fun (m : ℕ) (t : ℝ) =>
  ∑' n : ℕ, ((n+1 : ℕ) : ℝ)^m * Real.exp (-t*(n+1)))
local notation "b" => (fun t : ℝ => t / (Real.exp t - 1))

theorem weightedExp_halfline_bound (m : ℕ) {δ t : ℝ} (hδ : 0 < δ) (ht : δ ≤ t) :
    0 ≤ F m t ∧ F m t ≤ Real.exp (δ-t) * F m δ := by sorry

theorem weightedExp_hasDerivAt (m : ℕ) {t : ℝ} (ht : 0 < t) :
    HasDerivAt (fun x : ℝ => F m x) (-(F (m+1) t)) t := by sorry

theorem reciprocalExp_geometric {t : ℝ} (ht : 0 < t) :
    F 0 t = 1 / (Real.exp t - 1) ∧ b t = t * F 0 t := by sorry

theorem reciprocalExp_iteratedDeriv (m : ℕ) {t : ℝ} (ht : 0 < t) :
    iteratedDeriv m (fun x : ℝ => 1 / (Real.exp x - 1)) t =
      (-1 : ℝ)^m * F m t := by sorry

theorem bernoulliKernel_iteratedDeriv_succ (m : ℕ) {t : ℝ} (ht : 0 < t) :
    iteratedDeriv (m+1) b t = (-1 : ℝ)^m * ((m+1)*F m t - t*F (m+1) t) := by sorry

theorem bernoulliKernel_iteratedDeriv_decay (m : ℕ) :
    iteratedDeriv m b =O[atTop] (fun t : ℝ => Real.exp (-t/2)) := by sorry

theorem bernoulliKernel_iteratedDerivWithin_decay (g : ℝ → ℂ)
    (hg : ∀ t : ℝ, 0 < t → g t = (b t : ℂ)) (m : ℕ) :
    iteratedDerivWithin m g (Ici 0) =O[atTop] (fun t : ℝ => Real.exp (-t/2)) := by sorry

-- SuggestedBernoulliDecayTests.geometric_log_two
example : F 0 (Real.log 2) = 1 := by sorry
-- SuggestedBernoulliDecayTests.unextended_zero
example : b 0 = 0 := by sorry
-- SuggestedBernoulliDecayTests.first_derivative_log_two
example : deriv b (Real.log 2) = 1 - 2 * Real.log 2 := by sorry
-- SuggestedBernoulliDecayTests.rate_one_fails
example : ¬ b =O[atTop] (fun t : ℝ => Real.exp (-t)) := by sorry
end
end DirichletPadic

/-! ## The Bernoulli kernel at the origin and its Mellin continuation -/
namespace DirichletPadic
noncomputable section
open Filter Asymptotics Set
open scoped Topology

def smoothBernoulliKernel (t : ℝ) : ℝ := by sorry

theorem smoothBernoulliKernel_def (t : ℝ) :
    smoothBernoulliKernel t = (dslope Real.exp 0 t)⁻¹ := by sorry

theorem smoothBernoulliKernel_zero : smoothBernoulliKernel 0 = 1 := by sorry

theorem smoothBernoulliKernel_of_ne {t : ℝ} (ht : t ≠ 0) :
    smoothBernoulliKernel t = t / (Real.exp t - 1) := by sorry

theorem smoothBernoulliKernel_analyticAt (t : ℝ) :
    AnalyticAt ℝ smoothBernoulliKernel t := by sorry

theorem smoothBernoulliKernel_contDiff :
    ContDiff ℝ (⊤ : ℕ∞) smoothBernoulliKernel := by sorry

theorem smoothBernoulliKernel_mul_exp_sub_one (t : ℝ) :
    smoothBernoulliKernel t * (Real.exp t - 1) = t := by sorry

theorem smoothBernoulliKernel_derivative_recurrence (n : ℕ) :
    (∑ k ∈ Finset.range (n+1), ((n+1).choose k : ℝ) *
      iteratedDeriv k smoothBernoulliKernel 0) = if n = 0 then 1 else 0 := by sorry

theorem smoothBernoulliKernel_iteratedDeriv_zero (n : ℕ) :
    iteratedDeriv n smoothBernoulliKernel 0 = (bernoulli n : ℝ) := by sorry

theorem smoothBernoulliKernel_complex_contDiff :
    ContDiff ℝ (⊤ : ℕ∞) (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) := by sorry

theorem smoothBernoulliKernel_iteratedDerivWithin_zero (n : ℕ) :
    iteratedDerivWithin n (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (Ici 0) 0 =
      (bernoulli n : ℂ) := by sorry

theorem smoothBernoulliKernel_mellin_entire :
    Differentiable ℂ
      (normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ))) := by sorry

theorem smoothBernoulliKernel_mellin_neg_nat (n : ℕ) :
    normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (-(n : ℂ)) =
      (-1 : ℂ)^n * (bernoulli n : ℂ) := by sorry

-- SuggestedBernoulliOriginTests.extended_zero
example : smoothBernoulliKernel 0 = 1 := by sorry
-- SuggestedBernoulliOriginTests.log_two
example : smoothBernoulliKernel (Real.log 2) = Real.log 2 := by sorry
-- SuggestedBernoulliOriginTests.literal_quotient_mismatch
example : smoothBernoulliKernel 0 ≠ (0 : ℝ) / (Real.exp 0 - 1) := by sorry
-- SuggestedBernoulliOriginTests.first_derivative
example : deriv smoothBernoulliKernel 0 = -1/2 := by sorry
-- SuggestedBernoulliOriginTests.second_derivative
example : iteratedDeriv 2 smoothBernoulliKernel 0 = 1/6 := by sorry
-- SuggestedBernoulliOriginTests.mellin_minus_one
example : normalizedMellinContinuation (fun t : ℝ => (smoothBernoulliKernel t : ℂ)) (-1) =
    1/2 := by sorry
end
end DirichletPadic

/-! ## The Bernoulli Mellin–zeta comparison
The general sum/integral mechanism is native `hasSum_mellin`. The declarations
below concern the existing actual kernel and its normalized continuation.
The raw totalized product at zero is not the removable value.
-/
namespace DirichletPadic
noncomputable section
open Set
local notation "gβ" => (fun t : ℝ => (smoothBernoulliKernel t : ℂ))
local notation "Lβ" => normalizedMellinContinuation gβ

theorem smoothBernoulliKernel_mellin_convergent {s : ℂ} (hs : 0 < s.re) :
    MellinConvergent gβ s := by sorry

theorem smoothBernoulliKernel_mellin_hasSum {s : ℂ} (hs : 0 < s.re) :
    HasSum (fun n : ℕ => Complex.Gamma (s+1) / ((n:ℂ)+1)^(s+1))
      (mellin gβ s) := by sorry

theorem smoothBernoulliKernel_mellin_eq_gamma_zeta {s : ℂ} (hs : 0 < s.re) :
    mellin gβ s = Complex.Gamma (s+1) * riemannZeta (s+1) := by sorry

theorem smoothBernoulliKernel_normalizedMellin_eq_of_re_pos {s : ℂ} (hs : 0 < s.re) :
    Lβ s = s * riemannZeta (s+1) := by sorry

theorem smoothBernoulliKernel_normalizedMellin_eq_zeta {s : ℂ} (hs : s ≠ 0) :
    Lβ s = s * riemannZeta (s+1) := by sorry

-- SuggestedBernoulliMellinTests.integral_at_one
example : mellin gβ 1 = riemannZeta 2 := by sorry
-- SuggestedBernoulliMellinTests.factor_at_two
example : Lβ 2 = 2 * riemannZeta 3 := by sorry
-- SuggestedBernoulliMellinTests.continued_origin
example : Lβ 0 = 1 := by sorry
-- SuggestedBernoulliMellinTests.raw_pole_mismatch
example : Lβ 0 ≠ (0:ℂ) * riemannZeta 1 := by sorry
end
end DirichletPadic

/-! ## The actual smoothed Mellin kernel
Use a native divided difference of the existing Bernoulli kernel difference.
Positivity of the smoothing parameter is required for decay and continuation.
The smoothed zeta-factor and analytic/formal substitution comparisons remain
separate interfaces; all declarations here remain proposed signatures.
-/
namespace DirichletPadic
noncomputable section
open Set Filter Asymptotics
open scoped Topology

def smoothedMellinKernel (a t : ℝ) : ℝ := by sorry

theorem smoothedMellinKernel_def (a t : ℝ) :
    smoothedMellinKernel a t =
      dslope (fun x => smoothBernoulliKernel x - smoothBernoulliKernel (a*x)) 0 t := by sorry

theorem smoothedMellinKernel_zero (a : ℝ) : smoothedMellinKernel a 0 = (a-1)/2 := by sorry

theorem smoothedMellinKernel_one (t : ℝ) : smoothedMellinKernel 1 t = 0 := by sorry

theorem smoothedMellinKernel_of_ne {a t : ℝ} (ha : a ≠ 0) (ht : t ≠ 0) :
    smoothedMellinKernel a t = 1/(Real.exp t-1) - a/(Real.exp (a*t)-1) := by sorry

theorem smoothedMellinKernel_analyticAt (a t : ℝ) :
    AnalyticAt ℝ (smoothedMellinKernel a) t := by sorry

theorem smoothedMellinKernel_contDiff (a : ℝ) :
    ContDiff ℝ (⊤ : ℕ∞) (smoothedMellinKernel a) := by sorry

theorem smoothedMellinKernel_mul (a t : ℝ) :
    smoothedMellinKernel a t * t = smoothBernoulliKernel t - smoothBernoulliKernel (a*t) := by sorry

theorem smoothedMellinKernel_iteratedDeriv_zero (a : ℝ) (n : ℕ) :
    iteratedDeriv n (smoothedMellinKernel a) 0 =
      (1-a^(n+1)) * (bernoulli (n+1) : ℝ) / (n+1) := by sorry

local notation "F" => (fun (m : ℕ) (t : ℝ) =>
  ∑' n : ℕ, ((n+1 : ℕ) : ℝ)^m * Real.exp (-t*(n+1)))

theorem smoothedMellinKernel_iteratedDeriv_pos {a : ℝ} (ha : 0 < a) (m : ℕ)
    {t : ℝ} (ht : 0 < t) :
    iteratedDeriv m (smoothedMellinKernel a) t =
      (-1:ℝ)^m * (F m t - a^(m+1) * F m (a*t)) := by sorry

theorem smoothedMellinKernel_iteratedDeriv_decay {a : ℝ} (ha : 0 < a) (m : ℕ) :
    iteratedDeriv m (smoothedMellinKernel a) =O[atTop]
      (fun t : ℝ => Real.exp (-(min 1 a)*t)) := by sorry

local notation "gₛ" => (fun (a t : ℝ) => (smoothedMellinKernel a t : ℂ))

theorem smoothedMellinKernel_complex_contDiff (a : ℝ) :
    ContDiff ℝ (⊤ : ℕ∞) (gₛ a) := by sorry

theorem smoothedMellinKernel_iteratedDerivWithin_zero (a : ℝ) (n : ℕ) :
    iteratedDerivWithin n (gₛ a) (Ici 0) 0 =
      (1-(a:ℂ)^(n+1)) * (bernoulli (n+1) : ℂ) / (n+1) := by sorry

theorem smoothedMellinKernel_iteratedDerivWithin_decay {a : ℝ} (ha : 0 < a) (m : ℕ) :
    iteratedDerivWithin m (gₛ a) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-(min 1 a)*t)) := by sorry

theorem smoothedMellinKernel_mellin_entire {a : ℝ} (ha : 0 < a) :
    Differentiable ℂ (normalizedMellinContinuation (gₛ a)) := by sorry

theorem smoothedMellinKernel_mellin_neg_nat {a : ℝ} (ha : 0 < a) (n : ℕ) :
    normalizedMellinContinuation (gₛ a) (-(n:ℂ)) =
      (-1:ℂ)^n * (1-(a:ℂ)^(n+1)) * (bernoulli (n+1) : ℂ) / (n+1) := by sorry

-- SuggestedSmoothedKernelTests.two_at_zero
example : smoothedMellinKernel 2 0 = 1/2 := by sorry
-- SuggestedSmoothedKernelTests.one_kernel
example : smoothedMellinKernel 1 = fun _ => 0 := by sorry
-- SuggestedSmoothedKernelTests.two_at_log_two
example : smoothedMellinKernel 2 (Real.log 2) = 1/3 := by sorry
-- SuggestedSmoothedKernelTests.two_first_derivative
example : deriv (smoothedMellinKernel 2) 0 = -1/4 := by sorry
-- SuggestedSmoothedKernelTests.negative_parameter
example : smoothedMellinKernel (-1) = fun _ => -1 := by sorry
-- SuggestedSmoothedKernelTests.two_mellin_minus_one
example : normalizedMellinContinuation (gₛ 2) (-1) = 1/4 := by sorry
end
end DirichletPadic

/-! ## Smoothed zeta comparison and the removable value at one
Reuse native Mellin shift/dilation and the preceding actual Bernoulli integral.
The zeta product is compared on s ≠ 1; continuity supplies the value at one.
-/
namespace DirichletPadic
noncomputable section
open Set Filter
open scoped Topology
local notation "gₛ" => (fun (a t : ℝ) => (smoothedMellinKernel a t : ℂ))

theorem smoothedMellinKernel_mellin_convergent {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 0 < s.re) : MellinConvergent (gₛ a) s := by sorry

theorem smoothedMellinKernel_mellin_eq_gamma_zeta {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 1 < s.re) :
    mellin (gₛ a) s = Complex.Gamma s * (1-(a:ℂ)^(1-s)) * riemannZeta s := by sorry

theorem smoothedMellinKernel_normalized_halfplane {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : 1 < s.re) :
    normalizedMellinContinuation (gₛ a) s = (1-(a:ℂ)^(1-s))*riemannZeta s := by sorry

theorem smoothedMellinKernel_normalized_eq_zeta {a : ℝ} (ha : 0 < a)
    {s : ℂ} (hs : s ≠ 1) :
    normalizedMellinContinuation (gₛ a) s = (1-(a:ℂ)^(1-s))*riemannZeta s := by sorry

theorem smoothedZeta_tendsto_one {a : ℝ} (ha : 0 < a) :
    Tendsto (fun s : ℂ => (1-(a:ℂ)^(1-s))*riemannZeta s)
      (𝓝[≠] 1) (𝓝 (Real.log a : ℂ)) := by sorry

theorem smoothedMellinKernel_mellin_one {a : ℝ} (ha : 0 < a) :
    normalizedMellinContinuation (gₛ a) 1 = (Real.log a : ℂ) := by sorry

-- SuggestedSmoothedZetaTests.two_at_two
example : normalizedMellinContinuation (gₛ 2) 2 = riemannZeta 2 / 2 := by sorry
-- SuggestedSmoothedZetaTests.two_at_one
example : normalizedMellinContinuation (gₛ 2) 1 = (Real.log 2 : ℂ) := by sorry
-- SuggestedSmoothedZetaTests.one_at_one
example : normalizedMellinContinuation (gₛ 1) 1 = 0 := by sorry
-- SuggestedSmoothedZetaTests.integral_at_one
example {a : ℝ} (ha : 0 < a) : mellin (gₛ a) 1 = (Real.log a : ℂ) := by sorry
-- SuggestedSmoothedZetaTests.raw_pole_mismatch
example : normalizedMellinContinuation (gₛ 2) 1 ≠
    (1-(2:ℂ)^((1:ℂ)-1))*riemannZeta 1 := by sorry
end
end DirichletPadic

/-! ## The common rational formal derivative and its three comparisons
Use the supplier's formal exponential conjugacy for the actual arithmetic series.
Real derivatives, complex continued values and p-adic moments are compared
through ℚ; no real/complex-to-p-adic scalar map is used.
-/
namespace DirichletPadic
noncomputable section
open PowerSeries

theorem constantCoeff_iterate_mahler_smoothedSeries (R : Type*) [CommRing R] [Algebra ℚ R]
    (a k : ℕ) (ha : IsUnit (a : R)) :
    constantCoeff ((PowerSeries.mahlerDerivation R)^[k] (smoothedSeries R a ha)) =
      algebraMap ℚ R ((1-(a:ℚ)^(k+1))*bernoulli (k+1)/(k+1)) := by sorry

theorem smoothedMellinKernel_iteratedDeriv_eq_formal (a k : ℕ) (hu : IsUnit (a : ℚ)) :
    iteratedDeriv k (smoothedMellinKernel (a:ℝ)) 0 =
      algebraMap ℚ ℝ (constantCoeff
        ((PowerSeries.mahlerDerivation ℚ)^[k] (smoothedSeries ℚ a hu))) := by sorry

theorem smoothedMellinKernel_mellin_neg_nat_eq_formal (a k : ℕ) (ha : 0 < a)
    (hu : IsUnit (a : ℚ)) :
    normalizedMellinContinuation (fun t : ℝ => (smoothedMellinKernel (a:ℝ) t : ℂ)) (-(k:ℂ)) =
      (-1:ℂ)^k * algebraMap ℚ ℂ (constantCoeff
        ((PowerSeries.mahlerDerivation ℚ)^[k] (smoothedSeries ℚ a hu))) := by sorry

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
-- SuggestedSmoothedJetTests.ordinary_derivative_control
example (hu : IsUnit (2:ℚ)) :
    iteratedDeriv 2 (smoothedMellinKernel 2) 0 = 0 ∧
      constantCoeff ((PowerSeries.derivative ℚ)^[2] (smoothedSeries ℚ 2 hu)) = 1/4 := by sorry
-- SuggestedSmoothedJetTests.mellin_odd_sign
example : normalizedMellinContinuation (fun t : ℝ => (smoothedMellinKernel 2 t : ℂ)) (-3) = -1/8 := by sorry
-- SuggestedSmoothedJetTests.dyadic_common_value
example (hu : IsUnit (3:ℚ)) :
    (smoothedMeasure 2 3 (by norm_num) (ContinuousMap.id ℤ_[2]) : ℚ_[2]) =
      algebraMap ℚ ℚ_[2] (constantCoeff (PowerSeries.mahlerDerivation ℚ (smoothedSeries ℚ 3 hu))) ∧
    algebraMap ℚ ℚ_[2] (constantCoeff (PowerSeries.mahlerDerivation ℚ (smoothedSeries ℚ 3 hu))) = -2/3 := by sorry
end
end DirichletPadic

/-! ## Actual coefficient extension of the arithmetic measures
The generic extension stays in its measure-theory supplier. The arithmetic
Amice characterization works over eligible rings; integral descent and the
moment signatures below specialize to Q_p and keep the ambient domain Z_p.
-/
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

-- Retain the supplier scalar-bound instances in these fixed-prime tests.
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

/-! ## Arithmetic numerator on the native unit group

Restriction, coefficient extension and multiplicative convolution are imported
from their single owner. No completed-algebra or denominator regularity theorem
is supplied by these measure-level statements.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => (ℤ_[p])ˣ
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, Z))

-- DirichletPadicLFunctions:L1/intrinsic-numerator
noncomputable def intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) : D(U, Z) := sorry

theorem intrinsicSmoothedNumerator_eq_restrict (a : ℕ) (ha : ¬ p ∣ a) :
    intrinsicSmoothedNumerator p a ha = restrictUnits p Z (smoothedNumerator p a ha) := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
theorem map_val_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    AbstractMeasure.map j (intrinsicSmoothedNumerator p a ha) = smoothedNumerator p a ha := sorry

theorem intrinsicSmoothedNumerator_unique (a : ℕ) (ha : ¬ p ∣ a) (η : D(U, Z))
    (hη : AbstractMeasure.map j η = smoothedNumerator p a ha) :
    η = intrinsicSmoothedNumerator p a ha := sorry

theorem intrinsicSmoothedNumerator_one (ha : ¬ p ∣ 1) :
    intrinsicSmoothedNumerator p 1 ha = 0 := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-moment
theorem intrinsicSmoothedNumerator_moment (a k : ℕ) (ha : ¬ p ∣ a) (hk : 1 ≤ k) :
    (intrinsicSmoothedNumerator p a ha (j ^ k) : ℚ_[p]) =
      ((1 - (p : ℚ_[p]) ^ (k-1)) * (1 - (a : ℚ_[p]) ^ k)) *
        ((bernoulli k : ℚ) : ℚ_[p]) / (k : ℚ_[p]) := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-dirac
theorem map_val_dirac_mul_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) (u : U) :
    AbstractMeasure.map j (dirac Z u * intrinsicSmoothedNumerator p a ha) =
      AbstractMeasure.map ⟨fun z : Z => (u : Z) * z, continuous_const.mul continuous_id⟩
        (smoothedNumerator p a ha) := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-cocycle
theorem intrinsicSmoothedNumerator_mul (a b : ℕ)
    (ha : ¬ p ∣ a) (hb : ¬ p ∣ b) (hab : ¬ p ∣ a*b) (u : U) (hu : (u : Z) = (a : Z)) :
    intrinsicSmoothedNumerator p (a*b) hab = intrinsicSmoothedNumerator p a ha +
      dirac Z u * intrinsicSmoothedNumerator p b hb := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-cross
theorem intrinsicSmoothedNumerator_cross (a b : ℕ) (ha : ¬ p ∣ a) (hb : ¬ p ∣ b)
    (u v : U) (hu : (u : Z) = (a : Z)) (hv : (v : Z) = (b : Z)) :
    (dirac Z v - dirac Z (1 : U)) * intrinsicSmoothedNumerator p a ha =
      (dirac Z u - dirac Z (1 : U)) * intrinsicSmoothedNumerator p b hb := sorry

-- DirichletPadicLFunctions:L1/intrinsic-numerator-even
theorem intrinsicSmoothedNumerator_even (a : ℕ) (ha : ¬ p ∣ a) :
    dirac Z (-1 : U) * intrinsicSmoothedNumerator p a ha =
      intrinsicSmoothedNumerator p a ha := sorry

section Coefficients
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
  [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
-- DirichletPadicLFunctions:L1/intrinsic-numerator-extension-inclusion
theorem map_val_extend_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    AbstractMeasure.map j (extendIntegralUnitCoefficients (R := R)
      (intrinsicSmoothedNumerator p a ha)) =
      extendIntegralCoefficients (R := R) (smoothedNumerator p a ha) := sorry
end Coefficients

-- DirichletPadicLFunctions:L1/intrinsic-numerator-extension-moment
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

/-! ## Smoothed Kummer congruences
These arithmetic statements use the actual integral numerator on the unit group.
Removing its smoothing factor requires integral-unit denominators. The unchecked
signatures do not assert the blanket unsmoothed congruence of RJW Remark 2.18.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
local notation "Z" => ℤ_[p]
local notation "Q" => ℚ_[p]
local notation "U" => (ℤ_[p])ˣ
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, Z))

-- DirichletPadicLFunctions:L1/intrinsic-numerator-norm
theorem norm_extend_intrinsicSmoothedNumerator (a : ℕ) (ha : ¬ p ∣ a) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := Q)
      (intrinsicSmoothedNumerator p a ha))‖ ≤ 1 := sorry

-- DirichletPadicLFunctions:L1/finite-smoothed-moments
theorem extend_intrinsicSmoothedNumerator_sum {ι : Type*} (s : Finset ι)
    (c : ι → Q) (k : ι → ℕ) (a : ℕ) (ha : ¬ p ∣ a) (hk : ∀ i ∈ s, 1 ≤ k i) :
    extendIntegralUnitCoefficients (R := Q) (intrinsicSmoothedNumerator p a ha)
      (∑ i ∈ s, c i • ((j ^ k i) • (1 : C(U,Q)))) =
      ∑ i ∈ s, c i * (((1-(p:Q)^(k i-1))*(1-(a:Q)^k i)) *
        ((bernoulli (k i) : ℚ) : Q) / (k i : Q)) := sorry

-- DirichletPadicLFunctions:L1/generalized-smoothed-kummer
theorem smoothed_kummer_sum {ι : Type*} (s : Finset ι)
    (c : ι → Q) (k : ι → ℕ) (a r : ℕ) (ha : ¬ p ∣ a) (hk : ∀ i ∈ s, 1 ≤ k i)
    (hf : ∀ u : U, ‖∑ i ∈ s, c i * ((u : Z) : Q)^k i‖ ≤ (p:ℝ)^(-(r:ℤ))) :
    ‖∑ i ∈ s, c i * (((1-(p:Q)^(k i-1))*(1-(a:Q)^k i)) *
      ((bernoulli (k i) : ℚ) : Q) / (k i : Q))‖ ≤ (p:ℝ)^(-(r:ℤ)) := sorry

-- DirichletPadicLFunctions:L1/weight-period-smoothed-kummer
theorem smoothed_kummer_weight_period (a r k l : ℕ) (ha : ¬ p ∣ a)
    (hr : 1 ≤ r) (hk : 1 ≤ k) (hl : 1 ≤ l)
    (hkl : Nat.ModEq (p^(r-1)*(p-1)) k l) :
    ‖(((1-(p:Q)^(k-1))*(1-(a:Q)^k)) * ((bernoulli k : ℚ) : Q) / (k:Q)) -
      (((1-(p:Q)^(l-1))*(1-(a:Q)^l)) * ((bernoulli l : ℚ) : Q) / (l:Q))‖ ≤
      (p:ℝ)^(-(r:ℤ)) := sorry

-- DirichletPadicLFunctions:L1/unit-denominator-kummer
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

/-! ## Actual p-power character twists
The lift is defined for every exponent. Its support and level-independence laws
require positive exponents: modulus one gives a constant function, whereas a
principal character at positive p-power level gives the unit indicator.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
variable {R : Type*} [NormedCommRing R]

-- DirichletPadicLFunctions:L2/prime-power-character
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

-- DirichletPadicLFunctions:L2/prime-power-character-support
theorem primePowerCharacter_nonunit (n : ℕ) (hn : 1 ≤ n)
    (χ : DirichletCharacter R (p^n)) (z : ℤ_[p]) (hz : ¬ IsUnit z) :
    primePowerCharacter p n χ z = 0 := sorry

-- DirichletPadicLFunctions:L2/prime-power-character-level
theorem primePowerCharacter_changeLevel (n m : ℕ) (hn : 1 ≤ n) (h : n ≤ m)
    (χ : DirichletCharacter R (p^n)) :
    primePowerCharacter p m (χ.changeLevel (pow_dvd_pow p h)) = primePowerCharacter p n χ := sorry

section ActualTwist
variable [Algebra ℤ_[p] R] [IsUltrametricDist R] [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]

-- DirichletPadicLFunctions:L2/twisted-smoothed-measure
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

-- DirichletPadicLFunctions:L2/twisted-smoothed-support
theorem unitRestriction_twistedSmoothedMeasure (n : ℕ) (hn : 1 ≤ n)
    (χ : DirichletCharacter R (p^n)) (a : ℕ) (ha : ¬ p ∣ a) :
    unitRestriction p R (twistedSmoothedMeasure p n χ a ha) =
      twistedSmoothedMeasure p n χ a ha := sorry

-- DirichletPadicLFunctions:L2/twisted-smoothed-principal
theorem twistedSmoothedMeasure_principal (n : ℕ) (hn : 1 ≤ n)
    (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p n (1 : DirichletCharacter R (p^n)) a ha =
      extendIntegralCoefficients (R := R) (unitSmoothedMeasure p a ha) := sorry

-- DirichletPadicLFunctions:L2/twisted-smoothed-level
theorem twistedSmoothedMeasure_changeLevel (n m : ℕ) (hn : 1 ≤ n) (h : n ≤ m)
    (χ : DirichletCharacter R (p^n)) (a : ℕ) (ha : ¬ p ∣ a) :
    twistedSmoothedMeasure p m (χ.changeLevel (pow_dvd_pow p h)) a ha =
      twistedSmoothedMeasure p n χ a ha := sorry

-- DirichletPadicLFunctions:L2/twisted-smoothed-product
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

/-! Tame character kernels from the existing smoothing denominator.
The construction is defined also for principal characters; only the nonprincipal
case satisfies the uncancelled Dirichlet generating identity. No L-value formula,
integral-ring measure comparison or Gauss normalization is assumed here. -/
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
-- Retain the exact supplier scalar-action bound in fixed-prime tests.
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- Numerator tests use the actual native character, with its quadratic value specified.
-- quadratic_numerator
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) :
    tameNumerator η = 1+X := by sorry
-- principal_numerator
example : tameNumerator (1 : DirichletCharacter ℚ 3) = -C 3-X := by sorry
-- modulus_one_numerator
example : tameNumerator (1 : DirichletCharacter ℚ 1) = 0 := by sorry
-- numerator_field_extension
example (η : DirichletCharacter ℚ 3) :
    PowerSeries.map (algebraMap ℚ ℚ_[2]) (tameNumerator η) =
      tameNumerator (η.ringHomComp (algebraMap ℚ ℚ_[2])) := by sorry
-- quadratic_coefficients
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 0 (tameSeries η hD) = 1/3 ∧ coeff 1 (tameSeries η hD) = 0 ∧
      coeff 2 (tameSeries η hD) = -1/9 ∧ coeff 3 (tameSeries η hD) = 1/9 := by sorry
-- principal_generating_failure
example (hD : IsUnit (3 : ℚ)) :
    (1-(1+X : ℚ⟦X⟧)^3) * tameSeries (1 : DirichletCharacter ℚ 3) hD ≠
      (1+X : ℚ⟦X⟧)+(1+X : ℚ⟦X⟧)^2 := by sorry
-- modulus_one_series
example (hD : IsUnit ((1 : ℕ) : ℚ)) : tameSeries (1 : DirichletCharacter ℚ 1) hD = 0 := by sorry
-- wild_norm_failure
example (η : DirichletCharacter ℚ_[3] 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ_[3])) :
    ‖coeff 0 (tameSeries η hD)‖ = 3 := by sorry
-- dyadic_sequence_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameCoefficientSequence η hD hpD 3 = 1/9 := by sorry
-- dyadic_sequence_norm
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖tameCoefficientSequence η hD hpD‖ ≤ 1 := by sorry
-- modulus_one_sequence
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameCoefficientSequence (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry
-- dyadic_measure_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2])) = 1/3 := by sorry
-- dyadic_measure_moment_two
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD ⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ = -2/9 := by sorry
-- modulus_one_measure
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameMeasure (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry
end SuggestedTameTests

/-! Primitive Gauss comparison for the finite tame kernel.
G is the native Gauss sum of the inverse multiplicative character. Its nonvanishing
is an explicit hypothesis; generic composite-modulus Gauss theory stays with its
existing owner. The displayed finite sum uses totalized field power-series inverses.
All signatures remain unchecked planning forms. -/
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
-- principal_fourier_failure
example (ε : ℚ) :
    (∑ a : ZMod 3, (1 : DirichletCharacter ℚ 3)⁻¹ a * ε^(a.val*0)) ≠
      (1 : DirichletCharacter ℚ 3) (0 : ZMod 3) * (-1) := by sorry
-- zero_gauss_normalization
example {K : Type*} [Field K] {D : ℕ} [NeZero D]
    (η : DirichletCharacter K D) (ε : K) :
    -C ((0 : K)⁻¹) * (∑ a : ZMod D,
      C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹) = 0 := by sorry
-- quadratic_gauss_denominator
example {K : Type*} [Field K] [CharZero K]
    (η : DirichletCharacter K 3) (hη : η.IsPrimitive) (hη2 : η 2 = -1)
    (ε : K) (hε : IsPrimitiveRoot ε 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0) :
    (C 3+C 3*X+X^2 : K⟦X⟧) *
      (-C ((gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹) *
        ∑ a : ZMod 3, C (η⁻¹ a) * (C (ε^a.val)*(1+X : K⟦X⟧)-1)⁻¹) = 1+X := by sorry
-- principal_not_primitive
example : ¬(1 : DirichletCharacter ℚ 3).IsPrimitive := by sorry
-- quadratic_gauss_cubic
example {K : Type*} [Field K] [CharZero K]
    (η : DirichletCharacter K 3) (hη2 : η 2 = -1) (hD : IsUnit (3 : K)) :
    coeff 3 (tameSeries η hD) = 1/9 := by sorry
-- zero_constant_inverse
example {K : Type*} [Field K] : (C (1 : K)*(1+X : K⟦X⟧)-1)⁻¹ = 0 := by sorry
-- actual_measure_gauss
example {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
    [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1 < D) (hDK : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    constantCoeff (tameMeasure η hDK hpD).amiceTransform =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        ∑ a : ZMod D, η⁻¹ a / (ε^a.val-1) := by sorry
-- primitive_modulus_one
example (η : DirichletCharacter ℚ 1) : tameNumerator η = 0 := by sorry
end SuggestedGaussTests

/-! Integral tame coefficients and the actual integer-valued tame measure.
The coefficient ring below is the existing integer subring of the norm valuation.
The actual measure is a restriction of tameMeasure on integer-valued tests.
Only the Amice comparison requires a compatible Z_p-algebra action on that subring.
No norm topology or field structure is installed on the integral measure carrier. -/
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
-- dyadic_integral_coefficient
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 3 (integralTameSeries η hD hpD) : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) = 1/9 := by sorry
-- modulus_one_integral_series
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameSeries (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry
-- wild_coefficient_not_integral
example : (1/3 : ℚ_[3]) ∉ Valuation.integer (NormedField.valuation (K := ℚ_[3])) := by sorry
-- dyadic_integral_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (integralTameMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) = 1/3 := by sorry
-- modulus_one_integral_measure
example (hD : IsUnit ((1 : ℕ) : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameMeasure (1 : DirichletCharacter ℚ_[2] 1) hD hpD = 0 := by sorry
-- integral_measure_zero_test
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    integralTameMeasure η hD hpD (0 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) = 0 := by sorry
-- integral_measure_scalar_test
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (r : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) :
    integralTameMeasure η hD hpD (r • f) = r * integralTameMeasure η hD hpD f := by sorry
-- integral_measure_uniqueness
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (ν : D(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hν : ∀ f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2])))), (ν f : ℚ_[2]) =
      tameMeasure η hD hpD ((⟨Subtype.val, continuous_subtype_val⟩ : C((Valuation.integer (NormedField.valuation (K := ℚ_[2]))),ℚ_[2])).comp f)) :
    ν = integralTameMeasure η hD hpD := by sorry
variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]
-- integral_transform_transport
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[2]))).subtype (integralTameMeasure η hD hpD).amiceTransform =
      tameSeries η hD := by sorry
-- integral_transform_quadratic_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 0 (integralTameMeasure η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) = 1/3 := by sorry
end SuggestedIntegralTameTests

/-! Actual finite tame coefficients and the psi eigenrelation.
The finite-cycle proof retains characteristic zero. The finite projection is the
existing PMIA construction on the actual native p-power reduction. Statements
remain unchecked roadmap signatures, including the uniform approximation step. -/
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
-- dyadic_even_cell
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 1, PadicInt.continuous_toZModPow 2 1⟩ : C(ℤ_[2],ZMod (2^1)))
      (tameMeasure η hD hpD) 0 = -1/3 := by sorry
-- dyadic_odd_cell
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 1, PadicInt.continuous_toZModPow 2 1⟩ : C(ℤ_[2],ZMod (2^1)))
      (tameMeasure η hD hpD) 1 = 2/3 := by sorry
-- dyadic_four_cells
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (fun a : ZMod 4 => AbstractMeasure.finiteProjection
      (⟨PadicInt.toZModPow 2, PadicInt.continuous_toZModPow 2 2⟩ : C(ℤ_[2],ZMod (2^2)))
      (tameMeasure η hD hpD) a) = fun a => if a=2 then -2/3 else 1/3 := by sorry
-- positive_characteristic_ambiguity
example : ((fun _ : ZMod 3 => (1 : ZMod 3)) ≠ (fun _ => 0)) ∧
    (∑ _ : ZMod 3, (1 : ZMod 3)) = ∑ _ : ZMod 3, (0 : ZMod 3) := by sorry
-- dyadic_psi_eigenvalue
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameMeasure η hD hpD) =
      -tameMeasure η hD hpD := by sorry
-- dyadic_psi_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = -1/3 := by sorry
-- dyadic_integral_psi
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2])))
      (integralTameMeasure η hD hpD) = -integralTameMeasure η hD hpD := by sorry
-- dyadic_unit_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry
-- dyadic_unit_second_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -10/9 := by sorry
-- quadratic_translation_source
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[2] => x+3, by fun_prop⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) =
      AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2]) - AbstractMeasure.dirac ℚ_[2] (2 : ℤ_[2]) := by sorry
end SuggestedResidueTameTests

/-! Tame arithmetic moments and common algebraic special values.
The field-general Amice moment identity is explicitly requested from PMIA L2:
the current supplier's integral Z_p theorem is insufficient for these K-valued
measures. The statements below are unchecked targets, not completed proofs.
The finite rational Bernoulli expression uses the native polynomial, without a
new generalized-Bernoulli carrier. Complex and p-adic values use separate maps. -/
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
-- quadratic_zero
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 0 (subst (PowerSeries.exp ℚ - 1) (tameSeries η hD)) = 1/3 := by sorry
-- quadratic_second_exponential
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    coeff 2 (subst (PowerSeries.exp ℚ - 1) (tameSeries η hD)) = -1/9 := by sorry
-- quadratic_fourth_formal
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℚ)) :
    constantCoeff ((PowerSeries.mahlerDerivation ℚ)^[4] (tameSeries η hD)) = 2/3 := by sorry
-- principal_exclusion
example (hD : IsUnit (3 : ℚ)) :
    constantCoeff (tameSeries (1 : DirichletCharacter ℚ 3) hD) = -1 ∧
    -(∑ a : ZMod 3, (1 : DirichletCharacter ℚ 3) a *
      (Polynomial.bernoulli 1).eval (a.val / 3 : ℚ)) = 0 := by sorry
-- rational_transport
example (η : DirichletCharacter ℚ 3) (hη : η 2 = -1) :
    algebraMap ℚ ℂ (-(3 : ℚ)^2/3 * ∑ a : ZMod 3,
      η a * (Polynomial.bernoulli 3).eval (a.val/3 : ℚ)) = -2/9 := by sorry
-- complex_zero
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : η.LFunction 0 = 1/3 := by sorry
-- complex_second
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : η.LFunction (-2) = -2/9 := by sorry
-- quartic_complex_zero
example (η : DirichletCharacter ℂ 5) (hη : η 2 = Complex.I) :
    η.LFunction 0 = (3+Complex.I)/5 := by sorry
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry
-- dyadic_unit_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD)
      (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 34/3 := by sorry
end
end SuggestedTameMomentTests

/-! The arithmetic tame zeta measure of Definition 5.13.
The native unit inverse is extended by zero on nonunits before being mapped to K.
General weighting is imported from PMIA; its integral-only inverseWeight is not
silently applied to K-valued measures. The special-value comparison retains the
explicit coefficient-field ordinary-moment request from the preceding section. -/
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
-- one_level_zero
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    tameZetaMeasure η hD hpD = 0 := by sorry
-- first_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry
-- omission_of_inverse
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD ≠ AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD) := by sorry
-- weight_compatibility
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.weight (⟨fun x : ℤ_[2] => (x : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))
      (tameZetaMeasure η hD hpD) (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry
-- psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (tameZetaMeasure η hD hpD) = 0 := by sorry
-- third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^3, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -10/9 := by sorry
-- fifth_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^5, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 34/3 := by sorry
-- norm_bound
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖tameZetaMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2]))‖ ≤ 1 := by sorry
end
end SuggestedTameZetaTests

/-! Integral tame zeta on the native norm-valuation integer ring.
Only the final Amice comparison needs a separately displayed compatible O-action.
Positive-value integrality retains the explicit coefficient-field moment request. -/
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
-- modulus_one
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) :
    integralTameZetaMeasure η hD hpD = 0 := by sorry
-- mass_inclusion
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    (integralTameZetaMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) =
      tameZetaMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2])) := by sorry
-- first_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = x) :
    (integralTameZetaMeasure η hD hpD f : ℚ_[2]) = 2/3 := by sorry
-- wild_scalar
example : (1/3 : ℚ_[3]) ∉ Valuation.integer (NormedField.valuation (K := ℚ_[3])) := by sorry
-- mass_bound
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ‖integralTameZetaMeasure η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2])))))‖ ≤ 1 := by sorry
-- integral_psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) (integralTameZetaMeasure η hD hpD) = 0 := by sorry
-- third_value_integral
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^3) :
    (integralTameZetaMeasure η hD hpD f : ℚ_[2]) = -10/9 ∧ (-10/9 : ℚ_[2]) ∈ (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) := by sorry
-- p_divides_weight
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^2) :
    integralTameZetaMeasure η hD hpD f = 0 := by sorry
variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]
-- amice_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    ((coeff 0 (integralTameZetaMeasure η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) =
      coeff 0 (tameZetaMeasure η hD hpD).amiceTransform := by sorry
end
end SuggestedIntegralTameZetaTests

/-! Actual tame character twists at the native product level.
Ordinary moments are deduced by evaluating the finite translation identity on
a continuous Bernoulli polynomial primitive, not from a general Amice moment
theorem. Existing older request leaves are not resolved by this arithmetic proof. -/
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
-- modulus_one
example (χ : DirichletCharacter ℚ_[2] (2^2)) (η : DirichletCharacter ℚ_[2] 1)
    (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) : twistedTameMeasure 2 χ η hD hpD = 0 := by sorry
-- zero_level_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD
    (1 : C(ℤ_[2],ℚ_[2])) = 1/3 := by sorry
-- positive_principal_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 1 (1 : DirichletCharacter ℚ_[2] (2^1)) η hD hpD
    (1 : C(ℤ_[2],ℚ_[2])) = 2/3 := by sorry
-- principal_not_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : twistedTameMeasure 1 (1 : DirichletCharacter ℚ_[2] (2^1)) η hD hpD ≠
    tameMeasure η hD hpD := by sorry
-- raised_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    twistedTameMeasure 3 (χ.changeLevel (pow_dvd_pow 2 (by decide : 2 ≤ 3))) η hD hpD =
      twistedTameMeasure 2 χ η hD hpD := by sorry
-- positive_psi_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    AbstractMeasure.psiMeasure 2 ℚ_[2] (twistedTameMeasure 2 χ η hD hpD) = 0 := by sorry
-- quadratic_translation
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    twistedTameMeasure 2 χ η hD hpD - AbstractMeasure.map
      (⟨fun x : ℤ_[2] => x+12, by fun_prop⟩ : C(ℤ_[2],ℤ_[2])) (twistedTameMeasure 2 χ η hD hpD) =
    AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2]) - AbstractMeasure.dirac ℚ_[2] (5 : ℤ_[2]) -
      AbstractMeasure.dirac ℚ_[2] (7 : ℤ_[2]) + AbstractMeasure.dirac ℚ_[2] (11 : ℤ_[2]) := by sorry
-- quadratic_amice_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : coeff 0 (twistedTameMeasure 2 χ η hD hpD).amiceTransform = 0 := by sorry
-- quadratic_first_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : twistedTameMeasure 2 χ η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^1, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = -2 := by sorry
-- quadratic_third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : twistedTameMeasure 2 χ η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^3, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 46 := by sorry
-- quadratic_shifted_second
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) = -2 := by sorry
-- complex_product_value
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1)
    (χ : DirichletCharacter ℂ (2^2)) (hχ : χ 3 = -1) :
    DirichletCharacter.LFunction
      (η.changeLevel (Nat.dvd_mul_right 3 (2^2)) * χ.changeLevel ((2^2).dvd_mul_left 3)) (-1) = -2 := by sorry
-- quadratic_shifted_fourth
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) = 46 := by sorry
end
end SuggestedTameCharacterTests

/-! Integral character specializations and finite character congruences.
The integral coefficient ring is the native norm-valuation integer ring. Only
the Amice comparison adds a compatible continuous Z_p-action on that ring.
Every special-value expression below retains the actual product level. -/
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
-- modulus_one
example (χ : DirichletCharacter ℚ_[2] (2^2)) (η : DirichletCharacter ℚ_[2] 1)
    (hD : IsUnit (1 : ℚ_[2])) (hpD : ¬2 ∣ 1) : integralTwistedTameZetaMeasure 2 χ η hD hpD = 0 := by sorry
-- principal_positive_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 2 (1 : DirichletCharacter ℚ_[2] (2^2)) η hD hpD =
    integralTameZetaMeasure η hD hpD := by sorry
-- zero_to_positive_level
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD =
    integralTwistedTameZetaMeasure 2 (1 : DirichletCharacter ℚ_[2] (2^2)) η hD hpD := by sorry
-- nontrivial_twist
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : integralTwistedTameZetaMeasure 2 χ η hD hpD ≠ integralTameZetaMeasure η hD hpD := by sorry
-- second_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^2) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD f : ℚ_[2]) = -2 := by sorry
-- inclusion_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) : ℚ_[2]) =
      tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ) := by sorry
-- integral_support
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : AbstractMeasure.psiMeasure 2 (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) (integralTwistedTameZetaMeasure 2 χ η hD hpD) = 0 := by sorry
-- inverse_character
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : integralTwistedTameZetaMeasure 2 (χ*χ⁻¹) η hD hpD = integralTameZetaMeasure η hD hpD := by sorry
-- fourth_integral_value
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^4) :
    (integralTwistedTameZetaMeasure 2 χ η hD hpD f : ℚ_[2]) = 46 := by sorry
-- character_linear_difference
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD
    (primePowerCharacter 2 2 χ * ((⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) - (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])))) = -48 := by sorry
-- dyadic_character_congruence
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : ‖tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) -
    tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^4, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])))‖ ≤ (2 : ℝ)^(-3 : ℤ) := by sorry
variable [Algebra ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [ContinuousSMul ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2])))] [IsScalarTower ℤ_[2] (Valuation.integer (NormedField.valuation (K := ℚ_[2]))) ℚ_[2]]
-- amice_constant
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : ((coeff 0 (integralTwistedTameZetaMeasure 2 χ η hD hpD).amiceTransform : (Valuation.integer (NormedField.valuation (K := ℚ_[2])))) : ℚ_[2]) =
    coeff 0 (AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD)).amiceTransform := by sorry
end
end SuggestedIntegralCharacterTests

/-! Reflection and parity of the actual tame measures.
Nonprincipality is essential for the reflected finite source. The integral
statements use inclusion into K and do not divide by2 in the integer ring. -/
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
-- quadratic_atoms
example : AbstractMeasure.map (⟨fun x : ℤ_[2] => 3-x, by fun_prop⟩ : C(ℤ_[2],ℤ_[2]))
    (AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2])-AbstractMeasure.dirac ℚ_[2] 2) =
      -(AbstractMeasure.dirac ℚ_[2] (1 : ℤ_[2])-AbstractMeasure.dirac ℚ_[2] 2) := by sorry
-- odd_tame_measure_even
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) = tameMeasure η hD hpD := by sorry
-- even_tame_measure_odd
example (η : DirichletCharacter ℚ_[2] 5) (hη : η 2 = -1)
    (hD : IsUnit (5 : ℚ_[2])) (hpD : ¬2 ∣ 5) :
    AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameMeasure η hD hpD) = -tameMeasure η hD hpD := by sorry
-- principal_hypothesis_needed
example (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameMeasure (1 : DirichletCharacter ℚ_[2] 3) hD hpD (1 : C(ℤ_[2],ℚ_[2])) = -1 := by sorry
-- odd_tame_zeta_odd
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (tameZetaMeasure η hD hpD) = -tameZetaMeasure η hD hpD := by sorry
-- two_odd_characters_even
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD)) =
      AbstractMeasure.weight (primePowerCharacter 2 2 χ) (tameZetaMeasure η hD hpD) := by sorry
-- integral_even_reflection
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : AbstractMeasure.map (⟨fun x : ℤ_[2] => -x, continuous_neg⟩ : C(ℤ_[2],ℤ_[2])) (integralTwistedTameZetaMeasure 2 χ η hD hpD) =
    integralTwistedTameZetaMeasure 2 χ η hD hpD := by sorry
-- odd_character_mass
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : integralTwistedTameZetaMeasure 0 (1 : DirichletCharacter ℚ_[2] (2^0)) η hD hpD
    (1 : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) = 0 := by sorry
-- odd_test_even_twist
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],ℚ_[2])) (hf : ∀ x, f (-x) = -f x) :
    tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * f) = 0 := by sorry
-- mismatched_second_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) : tameZetaMeasure η hD hpD (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2])) = 0 := by sorry
-- matching_second_moment_not_zero
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) : tameZetaMeasure η hD hpD (primePowerCharacter 2 2 χ * (⟨fun x : ℤ_[2] => (x : ℚ_[2])^2, by fun_prop⟩ : C(ℤ_[2],ℚ_[2]))) ≠ 0 := by sorry
-- integral_mismatched_third_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) (f : C(ℤ_[2],(Valuation.integer (NormedField.valuation (K := ℚ_[2]))))) (hf : ∀ x, (f x : ℚ_[2]) = (x : ℚ_[2])^3) :
    integralTwistedTameZetaMeasure 2 χ η hD hpD f = 0 := by sorry
end
end SuggestedTameParityTests

/-! The source-oriented complex tame kernel, with its removable value at zero.
All derivatives here are over the real variable. The normalized Mellin
continuation and the native Dirichlet L-function are the existing objects. -/
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
-- level_one_zero
example (t : ℝ) : tameComplexKernel (1 : DirichletCharacter ℂ 1) t = 0 := by sorry
-- quadratic_origin
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : tameComplexKernel η 0 = 1/3 := by sorry
-- quadratic_log_two
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) : tameComplexKernel η (Real.log 2) = 2/7 := by sorry
-- principal_origin
example : tameComplexKernel (1 : DirichletCharacter ℂ 3) 0 = -1 := by sorry
-- quartic_orientation
example (η : DirichletCharacter ℂ 5) (hη : η 2 = Complex.I) :
    tameComplexKernel η 0 = (3+Complex.I)/5 := by sorry
-- analytic_at_zero
example (η : DirichletCharacter ℂ 3) : AnalyticAt ℝ (tameComplexKernel η) 0 := by sorry
-- quadratic_second_derivative
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    iteratedDeriv 2 (tameComplexKernel η) 0 = -2/9 := by sorry
-- even_first_derivative
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    iteratedDeriv 1 (tameComplexKernel η) 0 = -2/5 := by sorry
-- even_kernel_negative
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    tameComplexKernel η (Real.log 2) = -6/31 := by sorry
-- odd_first_series
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) {t : ℝ} (ht : 0 < t) :
    HasSum (fun n : ℕ => η ((n+1 : ℕ) : ZMod 3) * (-(n+1 : ℂ)) *
      (Real.exp (-(n+1 : ℝ)*t) : ℂ)) (iteratedDeriv 1 (tameComplexKernel η) t) := by sorry
-- decay_to_zero
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    Tendsto (tameComplexKernel η) atTop (nhds 0) := by sorry
-- convergence_before_series_halfplane
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    MellinConvergent (tameComplexKernel η) (1/2) := by sorry
-- gamma_two
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    mellin (tameComplexKernel η) 2 = Complex.Gamma 2 * η.LFunction 2 := by sorry
-- entire_even_character
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    Differentiable ℂ (normalizedMellinContinuation (tameComplexKernel η)) := by sorry
-- odd_value_one
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    normalizedMellinContinuation (tameComplexKernel η) 1 = η.LFunction 1 := by sorry
-- even_negative_value_sign
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    normalizedMellinContinuation (tameComplexKernel η) (-1) = 2/5 := by sorry
end
end SuggestedTameComplexKernelTests

/-! The actual complex Gauss expression. Nonzero Gauss normalization remains
explicit; all geometric manipulations are finite. Continuity supplies the
removable comparison at zero, without evaluating an infinite formal series. -/
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
-- imaginary_denominator
example (t : ℝ) : Complex.I * (Real.exp t : ℂ)-1 ≠ 0 := by sorry
-- zero_residue_denominator
example (ε : ℂ) : ε^((0 : ZMod 3).val) * (Real.exp 0 : ℂ)-1 = 0 := by sorry
-- zero_normalization
example {D : ℕ} [NeZero D] (η : DirichletCharacter ℂ D) (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) = 0) (t : ℝ) : (-(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) = 0 := by sorry
-- quadratic_generating
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 4)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one) ≠ 0) (t : ℝ) :
    (1-(Real.exp (4*t) : ℂ)) * (-(gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 4, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) =
      (Real.exp t : ℂ) - (Real.exp (3*t) : ℂ) := by sorry
-- quadratic_gauss_origin
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0) : (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / (ε^a.val * (Real.exp 0 : ℂ)-1)) = 1/3 := by sorry
-- quadratic_gauss_log_two
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 4)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one) ≠ 0) :
    (-(gaussSum η⁻¹ (AddChar.zmodChar 4 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 4, η⁻¹ a / (ε^a.val * (Real.exp (Real.log 2) : ℂ)-1)) = 2/5 := by sorry
-- inverse_primitive_root
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (ε : ℂ)
    (hε : IsPrimitiveRoot ε 3) (hεi : IsPrimitiveRoot ε⁻¹ 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one) ≠ 0)
    (hGi : gaussSum η⁻¹ (AddChar.zmodChar 3 hεi.pow_eq_one) ≠ 0) (t : ℝ) :
    (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1)) = (-(gaussSum η⁻¹ (AddChar.zmodChar 3 hεi.pow_eq_one))⁻¹ *
      ∑ a : ZMod 3, η⁻¹ a / ((ε⁻¹)^a.val * (Real.exp t : ℂ)-1)) := by sorry
-- even_gauss_negative_value
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) (ε : ℂ) (hε : IsPrimitiveRoot ε 5)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 5 hε.pow_eq_one) ≠ 0) :
    normalizedMellinContinuation (fun t : ℝ => (-(gaussSum η⁻¹ (AddChar.zmodChar 5 hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod 5, η⁻¹ a / (ε^a.val * (Real.exp t : ℂ)-1))) (-1) = 2/5 := by sorry
-- ordinary_derivative_normalization
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℂ)) :
    iteratedDeriv 2 (tameComplexKernel η) 0 =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation ℂ)^[2] (tameSeries η hD)) := by sorry
-- exponential_factorial
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) (hD : IsUnit (3 : ℂ)) :
    PowerSeries.coeff 2 (PowerSeries.subst (PowerSeries.exp ℂ-1) (tameSeries η hD)) =
      iteratedDeriv 2 (tameComplexKernel η) 0 / 2 := by sorry
end
end SuggestedComplexGaussTests


/-! Actual tame values at native continuous unit characters.
The generic character space and its analytic branch coordinates remain with their owners. -/
namespace DirichletPadic
noncomputable section
open ContinuousMonoidHom
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]
local notation "U" => (ℤ_[p])ˣ

def tameCharacterValue (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) (κ : U →ₜ* K) : K :=
  AbstractMeasure.restrictUnits p K (tameZetaMeasure η hD hpD) κ.toContinuousMap

theorem tameCharacterValue_def (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) (κ : U →ₜ* K) :
    tameCharacterValue η hD hpD κ =
      AbstractMeasure.restrictUnits p K (tameZetaMeasure η hD hpD) κ.toContinuousMap := by rfl

theorem tameCharacterValue_one_level (η : DirichletCharacter K 1)
    (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p ∣ 1) (κ : U →ₜ* K) :
    tameCharacterValue η hD hpD κ = 0 := by sorry

theorem tameCharacterValue_one (η : DirichletCharacter K D) (hD : IsUnit (D : K))
    (hpD : ¬p ∣ D) : tameCharacterValue η hD hpD (1 : U →ₜ* K) =
      tameZetaMeasure η hD hpD (1 : C(ℤ_[p],K)) := by sorry

theorem tameCharacterValue_eq_ambient (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (κ : U →ₜ* K)
    (f : C(ℤ_[p],K)) (hf : ∀ u : U, f (u : ℤ_[p]) = κ u) :
    tameCharacterValue η hD hpD κ = tameZetaMeasure η hD hpD f := by sorry

theorem tameCharacterValue_norm_le_one (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (κ : U →ₜ* K) :
    ‖tameCharacterValue η hD hpD κ‖ ≤ 1 := by sorry

theorem tameCharacterValue_mem_integer (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (κ : U →ₜ* K) :
    tameCharacterValue η hD hpD κ ∈ Valuation.integer (NormedField.valuation (K := K)) := by sorry

theorem tameCharacterValue_sub_norm_le (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (κ ξ : U →ₜ* K) :
    ‖tameCharacterValue η hD hpD κ-tameCharacterValue η hD hpD ξ‖ ≤
      ‖κ.toContinuousMap-ξ.toContinuousMap‖ := by sorry

theorem tameCharacterValue_tendsto {ι : Type*} (l : Filter ι)
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (κ : ι → U →ₜ* K) (ξ : U →ₜ* K)
    (hκ : Filter.Tendsto (fun i => (κ i).toContinuousMap) l (nhds ξ.toContinuousMap)) :
    Filter.Tendsto (fun i => tameCharacterValue η hD hpD (κ i)) l
      (nhds (tameCharacterValue η hD hpD ξ)) := by sorry

theorem tameCharacterValue_eq_zero_of_parity (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1)
    (κ : U →ₜ* K) (hpar : κ (-1) ≠ η (-1)) :
    tameCharacterValue η hD hpD κ = 0 := by sorry

theorem tameCharacterValue_analyticAt (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (κ : K → U →ₜ* K) (s : K)
    (hκ : AnalyticAt K (fun z => (κ z).toContinuousMap) s) :
    AnalyticAt K (fun z => tameCharacterValue η hD hpD (κ z)) s := by sorry

variable [CharZero K] [Algebra ℚ K]
theorem tameCharacterValue_arithmetic (n : ℕ) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (hη : η ≠ 1)
    (k : ℕ) (hk : 1 ≤ k) (κ : U →ₜ* K)
    (hκ : ∀ u : U, κ u = primePowerCharacter p n χ (u : ℤ_[p]) *
      (algebraMap ℤ_[p] K (u : ℤ_[p]))^k) :
    let θ : DirichletCharacter K (D*p^n) :=
      η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    tameCharacterValue η hD hpD κ =
      (1-θ (p : ZMod (D*p^n))*(p : K)^(k-1)) *
      (-((D*p^n : ℕ) : K)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ K ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ))) := by sorry

theorem tameCharacterValue_common_special_value {E : Type*} [Field E] [CharZero E] [Algebra ℚ E]
    (n : ℕ) (χ : DirichletCharacter E (p^n)) (η : DirichletCharacter E D) (hη : η ≠ 1)
    (ιC : E →+* ℂ) (ιK : E →+* K) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1 ≤ k) (κ : U →ₜ* K)
    (hκ : ∀ u : U, κ u = primePowerCharacter p n (χ.ringHomComp ιK) (u : ℤ_[p]) *
      (algebraMap ℤ_[p] K (u : ℤ_[p]))^k) :
    let θ : DirichletCharacter E (D*p^n) := η.changeLevel (D.dvd_mul_right (p^n)) * χ.changeLevel ((p^n).dvd_mul_left D)
    let b : E := (1-θ (p : ZMod (D*p^n))*(p : E)^(k-1)) *
      (-((D*p^n : ℕ) : E)^(k-1)/k * ∑ a : ZMod (D*p^n),
        θ a * algebraMap ℚ E ((Polynomial.bernoulli k).eval (a.val/(D*p^n) : ℚ)))
    ιC b = (1-(θ.ringHomComp ιC) (p : ZMod (D*p^n))*(p : ℂ)^(k-1)) *
      DirichletCharacter.LFunction (θ.ringHomComp ιC) (1-(k : ℂ)) ∧
    ιK b = tameCharacterValue (η.ringHomComp ιK) hD hpD κ := by sorry
end
end DirichletPadic

namespace SuggestedCharacterIntegralTests
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (fun x y => by
    change ‖(x : ℚ_[p])*y‖ ≤ ‖(x : ℚ_[p])‖*‖y‖
    exact le_of_eq (norm_mul (x : ℚ_[p]) y))
open DirichletPadic ContinuousMonoidHom
noncomputable section
-- one_level: the actual arithmetic measure is zero at modulus one.
example (η : DirichletCharacter ℚ_[2] 1) (hD : IsUnit ((1 : ℕ) : ℚ_[2]))
    (hpD : ¬2 ∣ 1) (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) : tameCharacterValue η hD hpD κ = 0 := by sorry
-- trivial_character: evaluation at the trivial character is the unit-supported mass.
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    tameCharacterValue η hD hpD (1 : (ℤ_[2])ˣ →ₜ* ℚ_[2]) =
      tameZetaMeasure η hD hpD (1 : C(ℤ_[2],ℚ_[2])) := by sorry
-- identity_character: the modulus-three quadratic has first value two-thirds.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) (hκ : ∀ u, κ u = ((u : ℤ_[2]) : ℚ_[2])) :
    tameCharacterValue η hD hpD κ = 2/3 := by sorry
-- two_extensions: changing an ambient test away from the units changes no value.
example (η : DirichletCharacter ℚ_[3] 4) (hD : IsUnit (4 : ℚ_[3])) (hpD : ¬3 ∣ 4)
    (κ : (ℤ_[3])ˣ →ₜ* ℚ_[3]) (f g : C(ℤ_[3],ℚ_[3]))
    (hf : ∀ u : (ℤ_[3])ˣ, f (u : ℤ_[3]) = κ u)
    (hg : ∀ u : (ℤ_[3])ˣ, g (u : ℤ_[3]) = κ u) :
    tameZetaMeasure η hD hpD f = tameZetaMeasure η hD hpD g := by sorry
-- integral_bound: every continuous character has an integral tame value, including p=2.
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) : ‖tameCharacterValue η hD hpD κ‖ ≤ 1 := by sorry
-- identity_nonzero: the continuous-character functional is not identically zero.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) (hκ : ∀ u, κ u = ((u : ℤ_[2]) : ℚ_[2])) :
    tameCharacterValue η hD hpD κ ≠ 0 := by sorry
-- identical_characters: the difference bound has zero right side for identical tests.
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) :
    ‖tameCharacterValue η hD hpD (κ*1)-tameCharacterValue η hD hpD κ‖ = 0 := by sorry
-- quadratic_weight_difference: actual finite character weights give the difference -48.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ ξ : (ℤ_[2])ˣ →ₜ* ℚ_[2])
    (hκ : ∀ u, κ u = primePowerCharacter 2 2 χ (u : ℤ_[2]) * (((u : ℤ_[2]) : ℚ_[2])^2))
    (hξ : ∀ u, ξ u = primePowerCharacter 2 2 χ (u : ℤ_[2]) * (((u : ℤ_[2]) : ℚ_[2])^4)) :
    tameCharacterValue η hD hpD κ-tameCharacterValue η hD hpD ξ = -48 := by sorry
-- even_weight_vanishes: the square character has wrong sign for the odd tame measure.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) (hκ : ∀ u, κ u = (((u : ℤ_[2]) : ℚ_[2])^2)) :
    tameCharacterValue η hD hpD κ = 0 := by sorry
-- matching_sign_nonzero: the quadratic finite twist changes the parity and gives -2.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2])
    (hκ : ∀ u, κ u = primePowerCharacter 2 2 χ (u : ℤ_[2]) * (((u : ℤ_[2]) : ℚ_[2])^2)) :
    tameCharacterValue η hD hpD κ = -2 := by sorry
-- fourth_arithmetic_value: the same finite twist in degree four gives 46.
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
    (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2])
    (hκ : ∀ u, κ u = primePowerCharacter 2 2 χ (u : ℤ_[2]) * (((u : ℤ_[2]) : ℚ_[2])^4)) :
    tameCharacterValue η hD hpD κ = 46 := by sorry
-- constant_family: the analytic transfer includes constant actual character families.
example (η : DirichletCharacter ℚ_[2] 3) (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3)
    (κ : (ℤ_[2])ˣ →ₜ* ℚ_[2]) (s : ℚ_[2]) :
    AnalyticAt ℚ_[2] (fun _ : ℚ_[2] => tameCharacterValue η hD hpD κ) s := by sorry
end
end SuggestedCharacterIntegralTests


/-! The classical value at one, via the native principal logarithm and an
absolutely convergent improper integral. All general signatures are unchecked. -/
namespace DirichletPadic
open Set Filter MeasureTheory
open scoped Topology
noncomputable section

theorem tameLog_argument_re_pos (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1)
    (t : ℝ) (ht : 0 ≤ t) : 0 < (1-α*(Real.exp (-t) : ℂ)).re := by sorry

theorem tameLog_kernel_norm_le (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1)
    (t : ℝ) (ht : 0 ≤ t) :
    ‖α/((Real.exp t : ℂ)-α)‖ ≤ (min 1 (1-α.re))⁻¹ * Real.exp (-t) := by sorry

theorem tameLog_kernel_integrable (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1) :
    IntegrableOn (fun t : ℝ => α/((Real.exp t : ℂ)-α)) (Ioi 0) := by sorry

theorem tameLog_hasDerivAt (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1)
    (t : ℝ) (ht : 0 ≤ t) :
    HasDerivAt (fun u : ℝ => Complex.log (1-α*(Real.exp (-u) : ℂ)))
      (α/((Real.exp t : ℂ)-α)) t := by sorry

theorem tameLog_tendsto_zero (α : ℂ) :
    Tendsto (fun t : ℝ => Complex.log (1-α*(Real.exp (-t) : ℂ))) atTop (𝓝 0) := by sorry

theorem tameLog_integral (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1) :
    ∫ t in Ioi (0 : ℝ), α/((Real.exp t : ℂ)-α) = -Complex.log (1-α) := by sorry

section FiniteGauss
variable {D : ℕ} [NeZero D]

theorem tameComplexKernel_integral_log (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    (∫ t in Ioi (0 : ℝ), tameComplexKernel η t) =
      η (-1) * (gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε^(c : ZMod D).val) := by sorry

theorem LFunction_one_eq_log_sum (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    η.LFunction 1 = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε^(c : ZMod D).val) := by sorry

theorem LFunction_log_sum_root_independent (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (hD : 1 < D)
    (ε₁ ε₂ : ℂ) (hε₁ : IsPrimitiveRoot ε₁ D) (hε₂ : IsPrimitiveRoot ε₂ D)
    (hG₁ : gaussSum η⁻¹ (AddChar.zmodChar D hε₁.pow_eq_one) ≠ 0)
    (hG₂ : gaussSum η⁻¹ (AddChar.zmodChar D hε₂.pow_eq_one) ≠ 0) :
    -(gaussSum η⁻¹ (AddChar.zmodChar D hε₁.pow_eq_one))⁻¹ *
        ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε₁^(c : ZMod D).val) =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε₂.pow_eq_one))⁻¹ *
        ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε₂^(c : ZMod D).val) := by sorry
end FiniteGauss
end
end DirichletPadic

namespace SuggestedComplexLogTests
open DirichletPadic Set Filter MeasureTheory
open scoped Topology
noncomputable section
-- minus_one_argument
example : (1-(-1 : ℂ)*(Real.exp (-(0 : ℝ)) : ℂ)).re = 2 := by sorry
-- excluded_root_one
example : 1-(1 : ℂ)*(Real.exp (-(0 : ℝ)) : ℂ) ∉ Complex.slitPlane := by sorry
-- minus_one_bound
example : ‖(-1 : ℂ)/((Real.exp (0 : ℝ) : ℂ)-(-1))‖ ≤
    (min 1 (1-(-1 : ℂ).re))⁻¹ * Real.exp (-(0 : ℝ)) := by sorry
-- imaginary_kernel_integrable
example : IntegrableOn (fun t : ℝ => Complex.I/((Real.exp t : ℂ)-Complex.I)) (Ioi 0) := by sorry
-- minus_one_derivative
example : HasDerivAt (fun t : ℝ => Complex.log (1+(Real.exp (-t) : ℂ)))
    (-1/2 : ℂ) 0 := by sorry
-- root_one_limit
example : Tendsto (fun t : ℝ => Complex.log (1-(Real.exp (-t) : ℂ))) atTop (𝓝 0) := by sorry
-- minus_one_integral
example : (∫ t in Ioi (0 : ℝ), (-1 : ℂ)/((Real.exp t : ℂ)+1)) = -Complex.log 2 := by sorry
-- imaginary_integral
example : (∫ t in Ioi (0 : ℝ), Complex.I/((Real.exp t : ℂ)-Complex.I)) =
    -Complex.log (1-Complex.I) := by sorry
-- quadratic_three_integral
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    (∫ t in Ioi (0 : ℝ), tameComplexKernel η t) = (Real.pi/(3*Real.sqrt 3) : ℝ) := by sorry
-- quadratic_three_value
example (η : DirichletCharacter ℂ 3) (hη : η 2 = -1) :
    η.LFunction 1 = (Real.pi/(3*Real.sqrt 3) : ℝ) := by sorry
-- quadratic_four_value
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) :
    η.LFunction 1 = (Real.pi/4 : ℝ) := by sorry
-- quadratic_five_value
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    η.LFunction 1 = (2*Real.log ((1+Real.sqrt 5)/2)/Real.sqrt 5 : ℝ) := by sorry
end
end SuggestedComplexLogTests


/-! The even-character refinement of the complex logarithmic value.
The real logarithms are included in ℂ; character coefficients remain complex. -/
namespace DirichletPadic
open scoped ComplexConjugate
noncomputable section

theorem tameLog_inv_eq_conj (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1) :
    Complex.log (1-α⁻¹) = conj (Complex.log (1-α)) := by sorry

theorem tameLog_add_inv (α : ℂ) (hα : ‖α‖ = 1) (hne : α ≠ 1) :
    Complex.log (1-α) + Complex.log (1-α⁻¹) =
      2 * (Real.log ‖1-α‖ : ℂ) := by sorry

section EvenGauss
variable {D : ℕ} [NeZero D]

theorem tameLog_sum_even (η : DirichletCharacter ℂ D) (hη : η.Even)
    (hD : 1 < D) (ε : ℂ) (hε : IsPrimitiveRoot ε D) :
    (∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε^(c : ZMod D).val)) =
      ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * (Real.log ‖1-ε^(c : ZMod D).val‖ : ℂ) := by sorry

theorem LFunction_one_eq_real_log_sum (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (heven : η.Even) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    η.LFunction 1 = -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * (Real.log ‖1-ε^(c : ZMod D).val‖ : ℂ) := by sorry
end EvenGauss
end
end DirichletPadic

namespace SuggestedEvenLogTests
open DirichletPadic
open scoped ComplexConjugate
noncomputable section
-- imaginary_conjugation
example : Complex.log (1+Complex.I) = conj (Complex.log (1-Complex.I)) := by sorry
-- minus_one_conjugation
example : Complex.log (2 : ℂ) = conj (Complex.log 2) := by sorry
-- imaginary_pair
example : Complex.log (1-Complex.I)+Complex.log (1+Complex.I) = (Real.log 2 : ℂ) := by sorry
-- minus_one_pair
example : Complex.log (2 : ℂ)+Complex.log 2 = 2*(Real.log 2 : ℂ) := by sorry
-- quadratic_five_sum
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1)
    (ε : ℂ) (hε : IsPrimitiveRoot ε 5) :
    (∑ c : (ZMod 5)ˣ, η⁻¹ (c : ZMod 5) * Complex.log (1-ε^(c : ZMod 5).val)) =
      2*((Real.log ‖1-ε‖ : ℂ) - (Real.log ‖1-ε^2‖ : ℂ)) := by sorry
-- nonreal_even_coefficients
example (η : DirichletCharacter ℂ 7) (heven : η.Even)
    (ε : ℂ) (hε : IsPrimitiveRoot ε 7) :
    (∑ c : (ZMod 7)ˣ, η⁻¹ (c : ZMod 7) * Complex.log (1-ε^(c : ZMod 7).val)) =
      2*((Real.log ‖1-ε‖ : ℂ) + η⁻¹ 2*(Real.log ‖1-ε^2‖ : ℂ) +
        η⁻¹ 3*(Real.log ‖1-ε^3‖ : ℂ)) := by sorry
-- quadratic_five_value
example (η : DirichletCharacter ℂ 5) (hη : η 2 = -1) :
    η.LFunction 1 = (2*Real.log ((1+Real.sqrt 5)/2)/Real.sqrt 5 : ℝ) := by sorry
-- quadratic_eight_value
example (η : DirichletCharacter ℂ 8) (hη3 : η 3 = -1) (hη7 : η 7 = 1) :
    η.LFunction 1 = (Real.log (1+Real.sqrt 2)/Real.sqrt 2 : ℝ) := by sorry
end
end SuggestedEvenLogTests


/-! Odd-character refinement with the canonical complex exponential root.
The Bernoulli expression uses the existing rational polynomial directly. -/
namespace DirichletPadic
noncomputable section

theorem tameLog_polar_factor (t : ℝ) :
    1-Complex.exp ((2*t : ℝ)*Complex.I) =
      (2*Real.sin t : ℝ)*Complex.exp ((t-Real.pi/2 : ℝ)*Complex.I) := by sorry

theorem tameLog_phase (t : ℝ) (h0 : 0 < t) (hp : t < Real.pi) :
    Complex.log (1-Complex.exp ((2*t : ℝ)*Complex.I)) =
      (Real.log (2*Real.sin t) : ℂ) + (t-Real.pi/2 : ℝ)*Complex.I := by sorry

theorem tameLog_sub_inv_exp (x : ℝ) (h0 : 0 < x) (h1 : x < 1) :
    Complex.log (1-Complex.exp ((2*Real.pi*x : ℝ)*Complex.I)) -
      Complex.log (1-(Complex.exp ((2*Real.pi*x : ℝ)*Complex.I))⁻¹) =
        (2*Real.pi*(x-1/2) : ℝ)*Complex.I := by sorry

section OddGauss
variable {D : ℕ} [NeZero D]

theorem tameLog_sub_inv_unit (hD : 1 < D) (c : (ZMod D)ˣ)
    (ε : ℂ) (hcanonical : ε = Complex.exp (2*Real.pi*Complex.I/D)) :
    Complex.log (1-ε^(c : ZMod D).val) -
      Complex.log (1-(ε^(c : ZMod D).val)⁻¹) =
        2*Real.pi*Complex.I * algebraMap ℚ ℂ
          ((Polynomial.bernoulli 1).eval ((c : ZMod D).val/(D : ℚ))) := by sorry

theorem tameLog_sum_odd (η : DirichletCharacter ℂ D) (hη : η.Odd)
    (hD : 1 < D) (ε : ℂ) (hcanonical : ε = Complex.exp (2*Real.pi*Complex.I/D)) :
    (∑ c : (ZMod D)ˣ, η⁻¹ (c : ZMod D) * Complex.log (1-ε^(c : ZMod D).val)) =
      Real.pi*Complex.I * ∑ a : ZMod D, η⁻¹ a * algebraMap ℚ ℂ
        ((Polynomial.bernoulli 1).eval (a.val/(D : ℚ))) := by sorry

theorem LFunction_one_eq_odd_bernoulli (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (hodd : η.Odd) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hcanonical : ε = Complex.exp (2*Real.pi*Complex.I/D))
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    η.LFunction 1 = -Real.pi*Complex.I *
      (gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
      ∑ a : ZMod D, η⁻¹ a * algebraMap ℚ ℂ
        ((Polynomial.bernoulli 1).eval (a.val/(D : ℚ))) := by sorry

theorem LFunction_one_eq_odd_zero_value (η : DirichletCharacter ℂ D)
    (hη : η.IsPrimitive) (hη0 : η ≠ 1) (hodd : η.Odd) (hD : 1 < D)
    (ε : ℂ) (hε : IsPrimitiveRoot ε D)
    (hcanonical : ε = Complex.exp (2*Real.pi*Complex.I/D))
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one) ≠ 0) :
    η.LFunction 1 = Real.pi*Complex.I *
      (gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ * (η⁻¹).LFunction 0 := by sorry
end OddGauss
end
end DirichletPadic

namespace SuggestedOddLogTests
open DirichletPadic
noncomputable section
-- factor_zero_endpoint
example : 1-Complex.exp ((2*(0 : ℝ) : ℝ)*Complex.I) = 0 := by sorry
-- factor_half_pi
example : 1-Complex.exp ((2*(Real.pi/2) : ℝ)*Complex.I) = 2 := by sorry
-- quarter_pi_phase
example : Complex.log (1-Complex.I) =
    (Real.log 2/2 : ℝ) - (Real.pi/4 : ℝ)*Complex.I := by sorry
-- half_pi_phase
example : Complex.log (1-Complex.exp ((2*(Real.pi/2) : ℝ)*Complex.I)) =
    (Real.log 2 : ℂ) := by sorry
-- quarter_inverse_difference
example : Complex.log (1-Complex.I)-Complex.log (1+Complex.I) =
    -(Real.pi/2 : ℝ)*Complex.I := by sorry
-- three_quarters_inverse_difference
example : Complex.log (1+Complex.I)-Complex.log (1-Complex.I) =
    (Real.pi/2 : ℝ)*Complex.I := by sorry
-- residue_three_one
example : Complex.log (1-Complex.exp (2*Real.pi*Complex.I/3)) -
    Complex.log (1-(Complex.exp (2*Real.pi*Complex.I/3))⁻¹) =
      -(Real.pi/3 : ℝ)*Complex.I := by sorry
-- residue_four_three
example : Complex.log (1-(Complex.exp (2*Real.pi*Complex.I/4))^3) -
    Complex.log (1-((Complex.exp (2*Real.pi*Complex.I/4))^3)⁻¹) =
      (Real.pi/2 : ℝ)*Complex.I := by sorry
-- quadratic_four_weighted
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) :
    (∑ c : (ZMod 4)ˣ, η⁻¹ (c : ZMod 4) * Complex.log (1-Complex.I^(c : ZMod 4).val)) =
      -(Real.pi/2 : ℝ)*Complex.I := by sorry
-- quartic_five_weighted
example (η : DirichletCharacter ℂ 5) (hη : η 2 = Complex.I) :
    (∑ c : (ZMod 5)ˣ, η⁻¹ (c : ZMod 5) *
      Complex.log (1-(Complex.exp (2*Real.pi*Complex.I/5))^(c : ZMod 5).val)) =
        Real.pi*Complex.I*((-3+Complex.I)/5) := by sorry
-- quadratic_four_value
example (η : DirichletCharacter ℂ 4) (hη : η 3 = -1) :
    η.LFunction 1 = (Real.pi/4 : ℝ) := by sorry
-- noncanonical_root_negative_control
example : -Real.pi*Complex.I * (-2*Complex.I)⁻¹ * (-1/2 : ℂ) =
    -(Real.pi/4 : ℝ) ∧ -(Real.pi/4 : ℂ) ≠ (Real.pi/4 : ℂ) := by sorry
end
end SuggestedOddLogTests


/-! Smoothing at an arbitrary integral p-adic unit. The native binomial
coefficients give integral series at every prime, including two. -/
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
-- series_identity_parameter
example : padicSmoothedSeries 2 1 = 0 := by sorry
-- series_negative_parameter
example : padicSmoothedSeries 2 (-1) = -1 := by sorry
-- dyadic_three_coefficients
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    ((coeff 0 (padicSmoothedSeries 2 u) : ℤ_[2]) : ℚ_[2]) = 1 ∧
      ((coeff 1 (padicSmoothedSeries 2 u) : ℤ_[2]) : ℚ_[2]) = -2/3 := by sorry
-- inverse_two_coefficients
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    ((coeff 0 (padicSmoothedSeries 3 u⁻¹) : ℤ_[3]) : ℚ_[3]) = -1/4 ∧
      ((coeff 1 (padicSmoothedSeries 3 u⁻¹) : ℤ_[3]) : ℚ_[3]) = 1/16 := by sorry
-- natural_two_comparison
example (h : IsUnit (2 : ℤ_[3])) (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicSmoothedSeries 3 u = smoothedSeries ℤ_[3] 2 h := by sorry
-- natural_three_comparison
example (h : IsUnit (3 : ℤ_[2])) (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicSmoothedSeries 2 u = smoothedSeries ℤ_[2] 3 h := by sorry
-- coefficient_limit_at_negative_one
example (u : ℕ → (ℤ_[3])ˣ) (hu : ∀ n, (u n : ℤ_[3]) = 3^(n+1)-1) :
    Tendsto (fun n => coeff 1 (padicSmoothedSeries 3 (u n))) atTop (𝓝 0) := by sorry
-- constant_limit_at_negative_one
example (u : ℕ → (ℤ_[2])ˣ) (hu : ∀ n, (u n : ℤ_[2]) = 2^(n+1)-1) :
    Tendsto (fun n => coeff 0 (padicSmoothedSeries 2 (u n))) atTop (𝓝 (-1)) := by sorry
-- measure_identity_parameter
example : padicSmoothedMeasure 2 1 = 0 := by sorry
-- measure_negative_parameter
example : padicSmoothedMeasure 2 (-1) = -AbstractMeasure.dirac ℤ_[2] (0 : ℤ_[2]) := by sorry
-- inverse_two_mass
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    (padicSmoothedMeasure 3 u⁻¹ 1 : ℚ_[3]) = -1/4 := by sorry
-- negative_parameter_positive_moment
example : padicSmoothedMeasure 3 (-1) ((ContinuousMap.id ℤ_[3])^2) = 0 := by sorry
-- natural_measure_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) (h : ¬ 3 ∣ 2) :
    padicSmoothedMeasure 3 u = smoothedMeasure 3 2 h := by sorry
-- natural_measure_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) (h : ¬ 2 ∣ 3) :
    padicSmoothedMeasure 2 u = smoothedMeasure 2 3 h := by sorry
-- weak_limit_negative_parameter
example (u : ℕ → (ℤ_[2])ˣ) (hu : ∀ n, (u n : ℤ_[2]) = 2^(n+1)-1) :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := AbstractMeasure.WeakTopology
    Tendsto (fun n => padicSmoothedMeasure 2 (u n)) atTop
      (𝓝 (-AbstractMeasure.dirac ℤ_[2] (0 : ℤ_[2]))) := by sorry
-- fixed_test_limit
example (u : ℕ → (ℤ_[3])ˣ) (hu : ∀ n, (u n : ℤ_[3]) = 3^(n+1)-1)
    (f : C(ℤ_[3],ℤ_[3])) :
    Tendsto (fun n => padicSmoothedMeasure 3 (u n) f) atTop (𝓝 (-f 0)) := by sorry
-- inverse_two_first_moment
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    (padicSmoothedMeasure 3 u⁻¹ (ContinuousMap.id ℤ_[3]) : ℚ_[3]) = 1/16 := by sorry
-- inverse_two_second_moment
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicSmoothedMeasure 3 u⁻¹ ((ContinuousMap.id ℤ_[3])^2) = 0 := by sorry
end
end SuggestedPadicSmoothingTests

/-! ## Arithmetic numerators for every p-adic unit -/
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
-- psi_negative_parameter
example : psiMeasure 2 ℤ_[2] (padicSmoothedMeasure 2 (-1)) =
    -dirac ℤ_[2] (0 : ℤ_[2]) := sorry
-- psi_is_not_unit_support
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    psiMeasure 3 ℤ_[3] (padicSmoothedMeasure 3 u) ≠ 0 := sorry
-- ambient_identity_parameter
example : padicSmoothedNumerator 2 1 = 0 := sorry
-- ambient_negative_parameter
example : padicSmoothedNumerator 2 (-1) = 0 := sorry
-- ambient_inverse_two_second
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = (2 : ℤ_[3]).inv) :
    (padicSmoothedNumerator 3 u ((ContinuousMap.id ℤ_[3])^2) : ℚ_[3]) = -1/8 := sorry
-- weighting_removes_zero_atom
example : padicSmoothedMeasure 3 (-1) ≠ 0 ∧ padicSmoothedNumerator 3 (-1) = 0 := sorry
-- ambient_natural_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicSmoothedNumerator 2 u = smoothedNumerator 2 3 (by norm_num) := sorry
-- ambient_natural_identity
example : padicSmoothedNumerator 3 1 = smoothedNumerator 3 1 (by norm_num) := sorry
-- ambient_first_moment_zero
example (u : (ℤ_[2])ˣ) :
    padicSmoothedNumerator 2 u (ContinuousMap.id ℤ_[2]) = 0 := sorry
-- ambient_dyadic_third_parameter
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    (padicSmoothedNumerator 2 u ((ContinuousMap.id ℤ_[2])^2) : ℚ_[2]) = 2/3 := sorry
-- intrinsic_identity_parameter
example : padicIntrinsicNumerator 2 1 = 0 := sorry
-- intrinsic_negative_parameter
example : padicIntrinsicNumerator 2 (-1) = 0 := sorry
-- intrinsic_inverse_two_second
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = (2 : ℤ_[3]).inv) :
    (padicIntrinsicNumerator 3 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2) : ℚ_[3]) = -1/8 := sorry
-- intrinsic_inclusion_test
example (u : (ℤ_[2])ˣ) (f : C(ℤ_[2],ℤ_[2])) :
    padicIntrinsicNumerator 2 u
      (f.comp (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))) =
      padicSmoothedNumerator 2 u f := sorry
-- intrinsic_natural_three
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    padicIntrinsicNumerator 2 u = intrinsicSmoothedNumerator 2 3 (by norm_num) := sorry
-- intrinsic_natural_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    padicIntrinsicNumerator 3 u = intrinsicSmoothedNumerator 3 2 (by norm_num) := sorry
-- intrinsic_first_moment_zero
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) = 0 := sorry
-- intrinsic_second_integral
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 3) :
    (padicIntrinsicNumerator 2 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^2) : ℚ_[2]) = 2/3 := sorry
-- fixed_test_negative_limit
example (f : C((ℤ_[2])ˣ,ℤ_[2])) :
    Filter.Tendsto (fun u : (ℤ_[2])ˣ => padicIntrinsicNumerator 2 u f)
      (nhds (-1)) (nhds 0) := sorry
-- fixed_test_identity_limit
example (f : C((ℤ_[3])ˣ,ℤ_[3])) :
    Filter.Tendsto (fun u : (ℤ_[3])ˣ => padicIntrinsicNumerator 3 u f)
      (nhds 1) (nhds 0) := sorry
end SuggestedPadicNumeratorTests

/-! ## All-unit smoothing relations before localization -/
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
-- raw_cocycle_scalar
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    padicSmoothedMeasure 3 (u*u) = padicSmoothedMeasure 3 u +
      (2 : ℤ_[3]) • AbstractMeasure.map
        (⟨fun z : ℤ_[3] => 2*z, continuous_const.mul continuous_id⟩ : C(ℤ_[3],ℤ_[3]))
        (padicSmoothedMeasure 3 u) := sorry
-- raw_cocycle_negative
example (u : (ℤ_[2])ˣ) :
    padicSmoothedMeasure 2 (-u) = padicSmoothedMeasure 2 u -
      (u : ℤ_[2]) • dirac ℤ_[2] (0 : ℤ_[2]) := sorry
-- reflection_negative_boundary
example : padicSmoothedMeasure 3 (-1) +
    AbstractMeasure.map (⟨fun z : ℤ_[3] => -z, continuous_neg⟩ : C(ℤ_[3],ℤ_[3]))
      (padicSmoothedMeasure 3 (-1)) = (-2 : ℤ_[3]) • dirac ℤ_[3] (0 : ℤ_[3]) := sorry
-- reflection_dyadic_correction
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=3) :
    padicSmoothedMeasure 2 u +
      AbstractMeasure.map (⟨fun z : ℤ_[2] => -z, continuous_neg⟩ : C(ℤ_[2],ℤ_[2]))
        (padicSmoothedMeasure 2 u) = (2 : ℤ_[2]) • dirac ℤ_[2] (0 : ℤ_[2]) := sorry
-- numerator_inverse_parameters
example (u : (ℤ_[3])ˣ) : padicSmoothedNumerator 3 u +
    AbstractMeasure.map
      (⟨fun z : ℤ_[3] => (u : ℤ_[3])*z, continuous_const.mul continuous_id⟩ : C(ℤ_[3],ℤ_[3]))
      (padicSmoothedNumerator 3 u⁻¹) = 0 := sorry
-- numerator_no_extra_scalar
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    (padicSmoothedNumerator 3 (u*u) ((ContinuousMap.id ℤ_[3])^2) : ℚ_[3]) =
      1/2 + 4*(1/2) := sorry
-- ambient_dyadic_even
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.map (⟨fun z : ℤ_[2] => -z, continuous_neg⟩ : C(ℤ_[2],ℤ_[2]))
      (padicSmoothedNumerator 2 u) = padicSmoothedNumerator 2 u := sorry
-- ambient_odd_test
example (u : (ℤ_[2])ˣ) :
    padicSmoothedNumerator 2 u ((ContinuousMap.id ℤ_[2])^3) = 0 := sorry
-- dirac_identity_inclusion
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.map (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))
      (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)*padicIntrinsicNumerator 2 u) =
      padicSmoothedNumerator 2 u := sorry
-- dirac_negative_zero
example (v : (ℤ_[3])ˣ) :
    dirac ℤ_[3] v * padicIntrinsicNumerator 3 (-1) = 0 := sorry
-- intrinsic_inverse_parameters
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u + dirac ℤ_[2] u*padicIntrinsicNumerator 2 u⁻¹ = 0 := sorry
-- intrinsic_negative_parameter_change
example (u : (ℤ_[2])ˣ) : padicIntrinsicNumerator 2 (-u) = padicIntrinsicNumerator 2 u := sorry
-- cross_orientation
example (u v : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) (hv : (v : ℤ_[3])=4) :
    (((dirac ℤ_[3] v - dirac ℤ_[3] 1)*padicIntrinsicNumerator 3 u) : D((ℤ_[3])ˣ,ℤ_[3]))
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2) =
    (15 : ℤ_[3]) * (padicIntrinsicNumerator 3 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[3])ˣ,ℤ_[3]))^2)) := sorry
-- cross_identity_parameter
example (u : (ℤ_[2])ˣ) :
    (dirac ℤ_[2] u-dirac ℤ_[2] 1)*padicIntrinsicNumerator 2 1 = 0 := sorry
-- intrinsic_dyadic_even
example (u : (ℤ_[2])ˣ) :
    dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)*padicIntrinsicNumerator 2 u = padicIntrinsicNumerator 2 u := sorry
-- intrinsic_odd_moment
example (u : (ℤ_[2])ˣ) :
    padicIntrinsicNumerator 2 u
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) = 0 := sorry
end SuggestedPadicRelationTests

/-! ## The actual arithmetic pseudomeasure in the native total quotient -/
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
-- clearing_identity
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (dirac Z (1 : U)-1) *
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ = 0 := sorry
-- clearing_negative
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (dirac Z (-1 : U)-1) *
      IsLocalization.mk' Q (padicIntrinsicNumerator p a)
        ⟨dirac Z a-1,one_add_prime_dirac_sub_one_regular p a ha⟩ = 0 := sorry
-- constructor_identity_numerator
example : Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry
-- constructor_sign_numerator
example : Iwasawa.numerator δ Q (-1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry
-- constructor_integral_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    Iwasawa.numerator δ Q a (kubotaLeopoldtPseudomeasure p) =
      intrinsicSmoothedNumerator p (p+1) (by
        have hp := (Fact.out : p.Prime)
        simpa using hp.not_dvd_one) := sorry
-- constructor_not_zero
example : kubotaLeopoldtPseudomeasure p ≠ 0 := sorry
-- cleared_difference_zero
example : algebraMap M Q (dirac Z (1 : U)-1) * (kubotaLeopoldtPseudomeasure p : Q) = 0 := sorry
-- sign_annihilator
example : algebraMap M Q (dirac Z (-1 : U)-1) * (kubotaLeopoldtPseudomeasure p : Q) = 0 := sorry
-- numerator_moment_second
example (g : U) :
    (Iwasawa.numerator δ Q g (kubotaLeopoldtPseudomeasure p)
      ((⟨Units.val,Units.continuous_val⟩ : C(U,Z))^2) : ℚ_[p]) =
      (1-(p : ℚ_[p]))*(1-(g : ℚ_[p])^2)/12 := sorry
-- numerator_negative_zero
example : Iwasawa.numerator δ Q (-1 : U) (kubotaLeopoldtPseudomeasure p) = 0 := sorry
-- regular_parameter_two_choices
example (u v : U) (hu : dirac Z u-1 ∈ nonZeroDivisors M)
    (hv : dirac Z v-1 ∈ nonZeroDivisors M) :
    IsLocalization.mk' Q (padicIntrinsicNumerator p u) ⟨dirac Z u-1,hu⟩ =
      IsLocalization.mk' Q (padicIntrinsicNumerator p v) ⟨dirac Z v-1,hv⟩ := sorry
-- torsion_is_not_regular
example : dirac Z (-1 : U)-1 ∉ nonZeroDivisors M := sorry
-- uniqueness_one_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : PM)
    (hz : Iwasawa.numerator δ Q a z = padicIntrinsicNumerator p a) :
    z = kubotaLeopoldtPseudomeasure p := sorry
-- even_sign_action
example : dirac Z (-1 : U) • kubotaLeopoldtPseudomeasure p = kubotaLeopoldtPseudomeasure p := sorry
-- identity_scalar_action
example : dirac Z (1 : U) • kubotaLeopoldtPseudomeasure p = kubotaLeopoldtPseudomeasure p := sorry
end SuggestedActualPseudoTests
end DirichletPadic

/-! ## Positive interpolation of the actual arithmetic pseudomeasure -/
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
-- positive_first_zero
example : positivePseudoMoment p 1 (by omega) (kubotaLeopoldtPseudomeasure p)=0 := sorry
-- positive_second_ternary
example : positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3)=1/6 := sorry
-- positive_fourth_dyadic
example : positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)= -7/120 := sorry
-- complex_endpoint_euler
example : (1-(p : ℂ)^0)*riemannZeta 0=0 := sorry
-- complex_endpoint_nonzero
example : riemannZeta 0= -(1:ℂ)/2 ∧ riemannZeta 0 ≠ 0 := sorry
-- complex_second_ternary
example : (1-(3 : ℂ))*riemannZeta (-1)=1/6 := sorry
-- rational_dyadic_second
example : ((1/12 : ℚ) : ℂ)=(1-(2 : ℂ))*riemannZeta (-1) ∧
    ((1/12 : ℚ) : ℚ_[2])=positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2) := sorry
-- rational_first_zero
example : ((0 : ℚ) : ℂ)=(1-(p : ℂ)^0)*riemannZeta 0 ∧
    ((0 : ℚ) : ℚ_[p])=positivePseudoMoment p 1 (by omega) (kubotaLeopoldtPseudomeasure p) := sorry
-- unique_interpolating_object
example : ∃! z : PM, ∀ (k : ℕ) (hk : 0 < k), positivePseudoMoment p k hk z =
    -(1-(p : ℚ_[p])^(k-1))*algebraMap ℚ ℚ_[p] (bernoulli k/(k : ℚ)) := sorry
-- odd_third_dyadic
example : positivePseudoMoment 2 3 (by omega) (kubotaLeopoldtPseudomeasure 2)=0 := sorry
-- odd_fifth_ternary
example : positivePseudoMoment 3 5 (by omega) (kubotaLeopoldtPseudomeasure 3)=0 := sorry
end SuggestedInterpolationTests
end DirichletPadic

/-! ## A norm obstruction to integrality -/
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
-- scalar_dyadic_second
example : ‖((-(1-(2 : ℚ))*(bernoulli 2/2) : ℚ) : ℚ_[2])‖=4 := sorry
-- scalar_ternary_sixth
example : ‖((-(1-(3 : ℚ)^5)*(bernoulli 6/6) : ℚ) : ℚ_[3])‖=9 := sorry
-- scalar_quinary_fourth
example : ‖((-(1-(5 : ℚ)^3)*(bernoulli 4/4) : ℚ) : ℚ_[5])‖=5 := sorry
-- moment_dyadic_second
example : ‖positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=4 := sorry
-- moment_dyadic_fourth
example : ‖positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=8 := sorry
-- moment_ternary_second
example : ‖positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3)‖=3 := sorry
-- not_integral_each_measure
example (μ : M) : Iwasawa.integral δ Q μ ≠ kubotaLeopoldtPseudomeasure p := sorry
-- not_in_integral_range
example : (kubotaLeopoldtPseudomeasure p : Q) ∉ Set.range (algebraMap M Q) := sorry
end SuggestedNonintegralityTests
end DirichletPadic

/-! ## Unbounded positive moments exclude a bounded field-valued measure -/
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
-- growing_dyadic_degree_four
example : ‖positivePseudoMoment 2 4 (by omega) (kubotaLeopoldtPseudomeasure 2)‖=8 := sorry
-- growing_ternary_degree_twelve
example : ‖positivePseudoMoment 3 12 (by omega) (kubotaLeopoldtPseudomeasure 3)‖=9 := sorry
-- dyadic_exceeds_one_hundred
example : ∃ (k : ℕ) (hk : 0<k), (100 : ℝ) <
    ‖positivePseudoMoment 2 k hk (kubotaLeopoldtPseudomeasure 2)‖ := sorry
-- ternary_exceeds_one_hundred
example : ∃ (k : ℕ) (hk : 0<k), (100 : ℝ) <
    ‖positivePseudoMoment 3 k hk (kubotaLeopoldtPseudomeasure 3)‖ := sorry
-- no_field_measure_witness_degree
example (μ : D(U,K)) : ∃ (k : ℕ) (hk : 0<k),
    μ (t^k) ≠ positivePseudoMoment p k hk (kubotaLeopoldtPseudomeasure p) := sorry
-- identity_atom_fails_dyadic_second
example : dirac ℚ_[2] (1 : ℤ_[2]ˣ)
    ((⟨fun u : ℤ_[2]ˣ => (u : ℚ_[2]), by fun_prop⟩ : C(ℤ_[2]ˣ,ℚ_[2]))^2) ≠
      positivePseudoMoment 2 2 (by omega) (kubotaLeopoldtPseudomeasure 2) := sorry
-- sign_atom_fails_ternary_second
example : dirac ℚ_[3] (-1 : ℤ_[3]ˣ)
    ((⟨fun u : ℤ_[3]ˣ => (u : ℚ_[3]), by fun_prop⟩ : C(ℤ_[3]ˣ,ℚ_[3]))^2) ≠
      positivePseudoMoment 3 2 (by omega) (kubotaLeopoldtPseudomeasure 3) := sorry
end SuggestedUnboundedTests
end DirichletPadic

/-! ## Finite Gauss decomposition of the actual smoothed measure -/
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
-- gauss_lift_one
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) :
    (1 : K)=(gaussSum χ⁻¹ e)⁻¹ * ∑ c : ZMod (p^n), χ⁻¹ c * e c := sorry
-- gauss_lift_nonunit
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) :
    (gaussSum χ⁻¹ e)⁻¹ * ∑ c : ZMod (p^n), χ⁻¹ c * e (c*(p : ZMod (p^n))) = 0 := sorry
-- additive_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n e 0 a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry
-- additive_trivial_character
example (n : ℕ) (c : ZMod (p^n)) (a : ℕ) (ha : ¬p∣a) :
    smoothedAdditiveTwist p n (1 : AddChar (ZMod (p^n)) K) c a ha =
      extendIntegralCoefficients (R := K) (smoothedMeasure p a ha) := sorry
-- additive_one_smoothing
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n)) (h1 : ¬p∣1) :
    smoothedAdditiveTwist p n e c 1 h1 = 0 := sorry
-- additive_dyadic_sign_first_moment
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod (2^1)) ℚ_[2])
    (he : e 1 = -1) :
    smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)
      ((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],ℚ_[2]))) = -2 := sorry
-- gauss_measure_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * smoothedAdditiveTwist p n e c a ha 1 := sorry
-- gauss_measure_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (h1 : ¬p∣1) :
    (gaussSum χ⁻¹ e)⁻¹ • ∑ c : ZMod (p^n), χ⁻¹ c • smoothedAdditiveTwist p n e c 1 h1 = 0 := sorry
-- gauss_amice_coeff_zero
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform.coeff 0 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * (smoothedAdditiveTwist p n e c a ha).amiceTransform.coeff 0 := sorry
-- gauss_amice_coeff_second
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    (twistedSmoothedMeasure p n χ a ha).amiceTransform.coeff 2 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c * (smoothedAdditiveTwist p n e c a ha).amiceTransform.coeff 2 := sorry
end SuggestedPrimePowerGaussTests
end DirichletPadic

/-! ## Finite polynomial equations for additive arithmetic twists -/
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
-- geometric_denominator_zero
example : smoothingDenominator ℤ 0 = 0 := sorry
-- geometric_denominator_three
example : smoothingDenominator ℤ 3 = 1+(1+X)+(1+X)^2 := sorry
-- geometric_cancellation_one
example : (∑ i ∈ Finset.range 1, (1+X : ℚ⟦X⟧)^i) *
    smoothedSeries ℚ 1 (by norm_num) = 0 := sorry
-- geometric_cancellation_three
example : (1+(1+X)+(1+X)^2 : ℚ⟦X⟧) * smoothedSeries ℚ 3 (by norm_num) = 2+(1+X) := sorry
-- translation_two
example [IsBoundedSMul ℤ_[3] ℚ_[3]] :
    extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)) +
      AbstractMeasure.map (ContinuousMap.mk (fun x : ℤ_[3] => x+1) (by fun_prop))
        (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num))) =
      dirac ℚ_[3] (0 : ℤ_[3]) := sorry
-- translation_three
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    (∑ i ∈ Finset.range 3, AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[2] => x+(i : ℤ_[2])) (by fun_prop))
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 3 (by norm_num)))) =
    2 • dirac ℚ_[2] (0 : ℤ_[2]) + dirac ℚ_[2] (1 : ℤ_[2]) := sorry
-- weighted_translation_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) (ha : ¬p∣a) :
    (∑ i ∈ Finset.range a, AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[p] => x+(i : ℤ_[p])) (by fun_prop))
      (smoothedAdditiveTwist p n e 0 a ha)) =
    ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, dirac K (j : ℤ_[p]) := sorry
-- weighted_translation_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (∑ i ∈ Finset.range 3, (-1 : ℚ_[2])^i • AbstractMeasure.map
      (ContinuousMap.mk (fun x : ℤ_[2] => x+(i : ℤ_[2])) (by fun_prop))
      (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num))) =
    2 • dirac ℚ_[2] (0 : ℤ_[2]) - dirac ℚ_[2] (1 : ℤ_[2]) := sorry
-- additive_cancellation_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (1+X+X^2) * (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform = 1-X := sorry
-- additive_cancellation_one
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n)) (h1 : ¬p∣1) :
    (smoothedAdditiveTwist p n e c 1 h1).amiceTransform = 0 := sorry
-- denominator_zero_index
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (a : ℕ) :
    (∑ i ∈ Finset.range a, e 0 ^ i) = (a : K) := sorry
-- denominator_dyadic_sign
example : (∑ i ∈ Finset.range 3, (-1 : ℚ_[2])^i) = 1 := sorry
-- denominator_bad_smoothing
example : (∑ i ∈ Finset.range 2, (-1 : ℚ_[2])^i) = 0 := sorry
-- rational_dyadic_constant
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 0 = 1 := sorry
-- rational_dyadic_linear
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 1 = -2 := sorry
-- rational_dyadic_second
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform.coeff 2 = 1 := sorry
-- gauss_rational_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 = (gaussSum χ⁻¹ e)⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((∑ i ∈ Finset.range a, ∑ j ∈ Finset.range i, e c ^ j) /
          (∑ i ∈ Finset.range a, e c ^ i)) := sorry
-- gauss_rational_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (e : AddChar (ZMod (p^n)) K) (hG : gaussSum χ⁻¹ e ≠ 0) (h1 : ¬p∣1) :
    (twistedSmoothedMeasure p n χ 1 h1).amiceTransform = 0 := sorry
end SuggestedAdditiveRationalTests
end DirichletPadic

/-! ## The source two-fraction form of the arithmetic Gauss sum -/
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
-- nonidentity_root_odd_smoothing
example : (-1 : ℚ_[2])^3 ≠ 1 := sorry
-- nonidentity_root_bad_smoothing
example : (-1 : ℚ_[2])^2 = 1 := sorry
-- fraction_dyadic_sign
example [IsBoundedSMul ℤ_[2] ℚ_[2]] (e : AddChar (ZMod 2) ℚ_[2]) (he : e 1 = -1) :
    (smoothedAdditiveTwist 2 1 e 1 3 (by norm_num)).amiceTransform =
      (-(1+X)-1)⁻¹ - C (3 : ℚ_[2])*(-(1+X)^3-1)⁻¹ := sorry
-- fraction_identity_root_failure
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    (((1+X)-1 : ℚ_[2]⟦X⟧)⁻¹ - C (3 : ℚ_[2])*((1+X)^3-1)⁻¹).coeff 0 ≠
      (smoothedAdditiveTwist 2 1 (1 : AddChar (ZMod 2) ℚ_[2]) 0 3
        (by norm_num)).amiceTransform.coeff 0 := sorry
-- fraction_one_smoothing
example (n : ℕ) (e : AddChar (ZMod (p^n)) K) (c : ZMod (p^n))
    (h1 : ¬p∣1) (hc : e c ≠ 1) :
    (smoothedAdditiveTwist p n e c 1 h1).amiceTransform =
      (C (e c)*(1+X)-1)⁻¹-(C (e c)*(1+X)-1)⁻¹ := sorry
-- gauss_fraction_zero_index
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (a : ℕ) :
    χ⁻¹ (0 : ZMod (p^n)) •
      ((((1+X)-1 : K⟦X⟧))⁻¹-C (a : K)*((1+X)^a-1)⁻¹) = 0 := sorry
-- gauss_fraction_total_mass
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 =
      (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val-1)⁻¹-(a : K)*((ε^c.val)^a-1)⁻¹) := sorry
-- gauss_fraction_one_smoothing
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n)) (hχ : χ.IsPrimitive)
    (ε : K) (hε : IsPrimitiveRoot ε (p^n))
    (hG : gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one) ≠ 0)
    (h1 : ¬p∣1) : (twistedSmoothedMeasure p n χ 1 h1).amiceTransform = 0 := sorry
end SuggestedGaussFractionTests
end DirichletPadic

/-! ## Pure prime-power interpolation through the formal finite kernel -/
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
-- reindex_one
example (χ : DirichletCharacter K (3^1)) (e : AddChar (ZMod (3^1)) K) :
    (∑ c : ZMod (3^1), χ⁻¹ c • ((C (e c)*(1+X))^1-1)⁻¹) =
      ∑ c : ZMod (3^1), χ⁻¹ c • (C (e c)*(1+X)-1)⁻¹ := sorry
-- reindex_character_factor
example (χ : DirichletCharacter K (3^2)) (e : AddChar (ZMod (3^2)) K)
    (z : K) (hz : χ 2 = z) :
    (∑ c : ZMod (3^2), χ⁻¹ c • ((C (e c)*(1+X))^2-1)⁻¹) =
      z • ∑ c : ZMod (3^2), χ⁻¹ c • (C (e c)*(1+X)^2-1)⁻¹ := sorry
-- subst_one
example (χ : DirichletCharacter K (3^1)) (ε : K) :
    subst ((1+X : K⟦X⟧)^1-1)
      (∑ c : ZMod (3^1), χ⁻¹ c • (C (ε^c.val)*(1+X)-1)⁻¹) =
      ∑ c : ZMod (3^1), χ⁻¹ c • (C (ε^c.val)*(1+X)-1)⁻¹ := sorry
-- subst_zero_index
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
-- formal_one_smoothing
example (h1 : ¬p∣1) :
    (twistedSmoothedMeasure p n χ 1 h1).amiceTransform =
      -tameSeries χ hD + tameSeries χ hD := sorry
-- formal_mass_factor
example (a : ℕ) (ha : ¬p∣a) :
    twistedSmoothedMeasure p n χ a ha 1 =
      ((a : K)*χ (a : ZMod (p^n))-1) * constantCoeff (tameSeries χ hD) := sorry
variable [CharZero K] [Algebra ℚ K]
-- exponential_one_smoothing
example (h1 : ¬p∣1) (k : ℕ) :
    coeff k (subst (exp K-1) (twistedSmoothedMeasure p n χ 1 h1).amiceTransform) = 0 := sorry
-- ordinary_one_smoothing
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
-- exponential_three_second
example : coeff 2 (subst (exp K-1)
    (twistedSmoothedMeasure 3 1 χ 4 (by norm_num)).amiceTransform) = -7 := sorry
-- ordinary_three_mass
example : twistedSmoothedMeasure 3 1 χ 4 (by norm_num) 1 = 1 := sorry
-- ordinary_three_second
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
-- exponential_four_second
example : coeff 2 (subst (exp K-1)
    (twistedSmoothedMeasure 2 2 χ 3 (by norm_num)).amiceTransform) = 7 := sorry
-- ordinary_four_mass
example : twistedSmoothedMeasure 2 2 χ 3 (by norm_num) 1 = -2 := sorry
-- ordinary_four_second
example : twistedSmoothedMeasure 2 2 χ 3 (by norm_num)
    (((ContinuousMap.id ℤ_[2]) • (1 : C(ℤ_[2],K)))^2) = 14 := sorry
end QuadraticFour
end SuggestedPrimePowerMomentTests
end DirichletPadic

/-! ## The smoothed complex character kernel -/
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
-- kernel_level_one
example (t : ℝ) : smoothedCharacterKernel (1 : DirichletCharacter ℂ 1) 3 t = 0 := sorry
-- kernel_quadratic_three_mass
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 4 0 = 1 := sorry
-- kernel_quadratic_four_mass
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    smoothedCharacterKernel χ 3 0 = -2 := sorry
-- kernel_one_parameter
example (χ : DirichletCharacter ℂ D) : smoothedCharacterKernel χ 1 = fun _ => 0 := sorry
-- kernel_zero_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 0 0 = -1/3 := sorry
-- regularity_principal_origin
example : AnalyticAt ℝ (smoothedCharacterKernel (1 : DirichletCharacter ℂ 3) 2) 0 := sorry
-- derivative_order_zero
example (χ : DirichletCharacter ℂ D) (a : ℕ) (t : ℝ) :
    iteratedDeriv 0 (smoothedCharacterKernel χ a) t =
      -tameComplexKernel χ t + (a : ℂ)*χ (a : ZMod D)*tameComplexKernel χ ((a : ℝ)*t) := sorry
-- derivative_one_parameter
example (χ : DirichletCharacter ℂ D) (k : ℕ) :
    iteratedDeriv k (smoothedCharacterKernel χ 1) = fun _ => 0 := sorry
-- derivative_quadratic_three_second
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    iteratedDeriv 2 (smoothedCharacterKernel χ 4) 0 = -14 := sorry
-- derivative_quadratic_four_second
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    iteratedDeriv 2 (smoothedCharacterKernel χ 3) 0 = 14 := sorry
-- derivative_even_character_first
example (χ : DirichletCharacter ℂ 5) (hχ : χ 2 = -1) :
    iteratedDeriv 1 (smoothedCharacterKernel χ 6) 0 = -14 := sorry
-- decay_one_parameter
example (χ : DirichletCharacter ℂ D) (k : ℕ) :
    iteratedDerivWithin k (smoothedCharacterKernel χ 1) (Ici 0) =O[atTop]
      (fun t : ℝ => Real.exp (-t)) := sorry
-- decay_quadratic_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    Tendsto (smoothedCharacterKernel χ 4) atTop (nhds 0) := sorry
-- gauss_one_parameter
example (p : ℕ) [Fact p.Prime] (n : ℕ) (χ : DirichletCharacter ℂ (p^n))
    (ε : ℂ) (hε : IsPrimitiveRoot ε (p^n)) (t : ℝ) :
    (gaussSum χ⁻¹ (AddChar.zmodChar (p^n) hε.pow_eq_one))⁻¹ *
      ∑ c : ZMod (p^n), χ⁻¹ c *
        ((ε^c.val*(Real.exp t : ℂ)-1)⁻¹ -
          (1 : ℂ)*((ε^c.val)^1*(Real.exp ((1 : ℝ)*t) : ℂ)-1)⁻¹) = 0 := sorry
-- gauss_zero_residue
example (χ : DirichletCharacter ℂ 3) (a : ℕ) (t : ℝ) :
    χ⁻¹ (0 : ZMod 3) * ((Real.exp t-1 : ℂ)⁻¹-
      (a : ℂ)*(Real.exp ((a : ℝ)*t)-1 : ℂ)⁻¹) = 0 := sorry
-- kernel_quadratic_three_log_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    smoothedCharacterKernel χ 4 (Real.log 2) = -2/39 := sorry
-- kernel_quadratic_four_log_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    smoothedCharacterKernel χ 3 (Real.log 2) = -10/13 := sorry
end SuggestedSmoothedComplexTests
end
end DirichletPadic

/-! ## Mellin continuation of the smoothed character kernel -/
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
-- convergence_at_one
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    MellinConvergent (smoothedCharacterKernel χ 4) 1 := sorry
-- convergence_nonunit_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    MellinConvergent (smoothedCharacterKernel χ 3) (1/2) := sorry
-- raw_three_at_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    mellin (smoothedCharacterKernel χ 4) 2 = (-3/4 : ℂ)*χ.LFunction 2 := sorry
-- raw_four_at_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    mellin (smoothedCharacterKernel χ 3) 2 = (-4/3 : ℂ)*χ.LFunction 2 := sorry
-- entire_at_zero
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    DifferentiableAt ℂ (normalizedMellinContinuation (smoothedCharacterKernel χ 4)) 0 := sorry
-- entire_at_one
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    DifferentiableAt ℂ (normalizedMellinContinuation (smoothedCharacterKernel χ 3)) 1 := sorry
-- normalized_one_parameter
example (χ : DirichletCharacter ℂ D) (s : ℂ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 1) s = 0 := sorry
-- normalized_nonunit_parameter
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) (s : ℂ) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) s = -χ.LFunction s := sorry
-- normalized_three_at_one
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 1 = 0 := sorry
-- normalized_four_at_one
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 1 = -2*χ.LFunction 1 := sorry
-- normalized_three_at_two
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 2 = (-3/4 : ℂ)*χ.LFunction 2 := sorry
-- normalized_four_at_two
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 2 = (-4/3 : ℂ)*χ.LFunction 2 := sorry
-- negative_zero_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) 0 = 1 := sorry
-- negative_zero_four
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) 0 = -2 := sorry
-- negative_two_three
example (χ : DirichletCharacter ℂ 3) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 4) (-2) = -14 := sorry
-- negative_two_four
example (χ : DirichletCharacter ℂ 4) (hχ : χ 3 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 3) (-2) = 14 := sorry
-- negative_one_five
example (χ : DirichletCharacter ℂ 5) (hχ : χ 2 = -1) :
    normalizedMellinContinuation (smoothedCharacterKernel χ 6) (-1) = 14 := sorry
-- gauss_one_parameter
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

/-! ## Common algebraic values of prime-power smoothed moments -/
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
-- unit_smoothing
example {E : Type*} [Field E] {D : ℕ} [NeZero D] (χ : DirichletCharacter E D)
    (k : ℕ) (b : E) : (χ (1 : ZMod D)*(1 : E)^(k+1)-1)*b = 0 := sorry
-- quotient_denominator_one_zero
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
-- common_mass_three
example : (algebraMap ℚ ℂ) 1 = iteratedDeriv 0
    (smoothedCharacterKernel (χ.ringHomComp (algebraMap ℚ ℂ)) 4) 0 ∧
    (algebraMap ℚ K) 1 = twistedSmoothedMeasure 3 1
      (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 := sorry
-- common_second_three
example : (algebraMap ℚ ℂ) (-14) = iteratedDeriv 2
    (smoothedCharacterKernel (χ.ringHomComp (algebraMap ℚ ℂ)) 4) 0 ∧
    (algebraMap ℚ K) (-14) = twistedSmoothedMeasure 3 1
      (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
      (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) := sorry
-- shifted_weight_one
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^(1-1)) = 1 := sorry
-- shifted_weight_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^(3-1)) = -14 := sorry
-- quotient_mass_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 /
    (3 : K) = (1/3 : K) := sorry
-- quotient_second_three
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num)
    (((ContinuousMap.id ℤ_[3]) • (1 : C(ℤ_[3],K)))^2) / (63 : K) = (-2/9 : K) := sorry
-- independence_three_mass
example : twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 4 (by norm_num) 1 /
    (3 : K) = twistedSmoothedMeasure 3 1 (χ.ringHomComp (algebraMap ℚ K)) 7
      (by norm_num) 1 / (6 : K) := sorry
-- independence_three_second
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
-- common_mass_four
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
-- common_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    iteratedDeriv 0 (smoothedCharacterKernel (χ.ringHomComp ιC) 6) 0 = 3+Complex.I ∧
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 = 3+ιK (χ 2) := sorry
-- normalized_even_first_five
example (h2 : χ 2 = -1) :
    ιC 14 = normalizedMellinContinuation (smoothedCharacterKernel (χ.ringHomComp ιC) 6) (-1) ∧
    ιK 14 = -twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num)
      ((ContinuousMap.id ℤ_[5]) • (1 : C(ℤ_[5],K))) := sorry
-- shifted_weight_two_even
example (h2 : χ 2 = -1) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num)
      (((ContinuousMap.id ℤ_[5]) • (1 : C(ℤ_[5],K)))^(2-1)) = -14 := sorry
-- quotient_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 / (5 : K) =
      ιK ((3+χ 2)/5) := sorry
-- independence_quartic_mass
example (h2 : ιC (χ 2) = Complex.I) :
    twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 2 (by norm_num) 1 / (2*ιK (χ 2)-1) =
      twistedSmoothedMeasure 5 1 (χ.ringHomComp ιK) 6 (by norm_num) 1 / (5 : K) := sorry
end Five
end SuggestedPrimePowerCommonValueTests
end
end DirichletPadic

/-! ## Arithmetic characters on units and the actual smoothing numerator -/
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
-- character_identity
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) :
    primePowerArithmeticCharacter p n χ w 1 = 1 := sorry
-- level_zero_weight_zero
example (χ : DirichletCharacter R (p^0)) : primePowerArithmeticCharacter p 0 χ 0 = 1 := sorry
-- level_zero_square
example (χ : DirichletCharacter R (p^0)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p 0 χ 2 u = (algebraMap ℤ_[p] R (u : ℤ_[p]))^2 := sorry
-- positive_weight_nontrivial
example [Nontrivial R] [CharZero R] :
    primePowerArithmeticCharacter p 1 (1 : DirichletCharacter R (p^1)) 1 ≠ 1 := sorry
variable [IsUltrametricDist R] [CompleteSpace R]
-- numerator_one_parameter
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) (ha : ¬p∣1) :
    extendIntegralUnitCoefficients (R := R) (intrinsicSmoothedNumerator p 1 ha)
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry
-- denominator_identity
example (n w : ℕ) (χ : DirichletCharacter R (p^n)) :
    extendIntegralUnitCoefficients (R := R)
      (dirac ℤ_[p] (1 : (ℤ_[p])ˣ)-dirac ℤ_[p] (1 : (ℤ_[p])ˣ))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry
-- denominator_trivial_weight
example (n : ℕ) (u : (ℤ_[p])ˣ) :
    extendIntegralUnitCoefficients (R := R) (dirac ℤ_[p] u-dirac ℤ_[p] 1)
      (primePowerArithmeticCharacter p n (1 : DirichletCharacter R (p^n)) 0).toContinuousMap = 0 := sorry
end General

section Ternary
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]
-- principal_sign
example : primePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 1 (-1) = -1 := sorry
-- quadratic_weight_one_sign
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1) :
    primePowerArithmeticCharacter 3 1 χ 1 (-1) = 1 := sorry
-- quadratic_weight_zero_sign
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1) :
    primePowerArithmeticCharacter 3 1 χ 0 (-1) = -1 := sorry
-- principal_numerator_second
example : extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 2).toContinuousMap = 1/2 := sorry
-- level_zero_shift_fails
example : extendIntegralUnitCoefficients (R := ℚ_[3]) (intrinsicSmoothedNumerator 3 2 (by norm_num))
    (primePowerArithmeticCharacter 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 1).toContinuousMap = 0 ∧
    twistedSmoothedMeasure 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 2 (by norm_num) 1 = 1/2 := sorry
-- ternary_denominator
example (χ : DirichletCharacter ℚ_[3] (3^1)) (h2 : χ 2 = -1)
    (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    extendIntegralUnitCoefficients (R := ℚ_[3]) (dirac ℤ_[3] u-dirac ℤ_[3] 1)
      (primePowerArithmeticCharacter 3 1 χ 1).toContinuousMap = -3 := sorry
end Ternary

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_quadratic_sign
example (χ : DirichletCharacter ℚ_[2] (2^2)) (h3 : χ 3 = -1) :
    primePowerArithmeticCharacter 2 2 χ 1 (-1) = 1 := sorry
-- dyadic_one_add_pow
example (χ : DirichletCharacter ℚ_[2] (2^1)) (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2]) = 5) :
    primePowerArithmeticCharacter 2 1 χ 2 u = 25 := sorry
-- dyadic_positive_zero_level
example : primePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1 ≠ 1 := sorry
-- dyadic_denominator
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
-- numerator_quadratic_weight_one
example : extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap = 1 := sorry
-- numerator_quadratic_weight_three
example : extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
    (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 3).toContinuousMap = -14 := sorry
-- common_numerator_zero_value
example : (algebraMap ℚ ℂ) 1 =
    3*DirichletCharacter.LFunction (χ.ringHomComp (algebraMap ℚ ℂ)) 0 ∧
    (algebraMap ℚ K) 1 = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap := sorry
-- common_numerator_quotient
example : (algebraMap ℚ ℂ) (1/3) =
    DirichletCharacter.LFunction (χ.ringHomComp (algebraMap ℚ ℂ)) 0 ∧
    (algebraMap ℚ K) (1/3) = extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator 3 4 (by norm_num))
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap / 3 := sorry
end CommonThree
end SuggestedArithmeticCharacterTests
end
end DirichletPadic

/-! ## Actual pseudomeasure numerators and conditional coefficient-field specialization
The ring map below is an explicit input. Its canonical construction belongs to
the open PMIA L3 request; no general coefficient-field evaluator is defined here. -/
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
-- principal_unit_weight_one_value
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U)
    (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) :
    primePowerArithmeticCharacter p n χ 1 u=((1+p^(n+1) : ℕ) : K) := sorry
-- principal_unit_weight_zero_value
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U)
    (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) :
    primePowerArithmeticCharacter p n χ 0 u=1 := sorry
-- natural_identity_numerator
example : Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p) =
    intrinsicSmoothedNumerator p 1 (by exact (Fact.out : p.Prime).not_dvd_one) := sorry
-- natural_arbitrary_parameter
example (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z)) :
    Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p) =
      intrinsicSmoothedNumerator p a ha := sorry
-- numerator_weight_one
example (n : ℕ) (hn : 1≤n) (χ : DirichletCharacter K (p^n))
    (u : U) (a : ℕ) (ha : ¬p∣a) (hu : (u : Z)=(a : Z)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p))
      (primePowerArithmeticCharacter p n χ 1).toContinuousMap =
      twistedSmoothedMeasure p n χ a ha 1 := sorry
-- identity_character_numerator
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q (1 : U) (kubotaLeopoldtPseudomeasure p))
      (primePowerArithmeticCharacter p n χ w).toContinuousMap = 0 := sorry
-- zero_level_positive_admissible
example (χ : DirichletCharacter K (p^0)) (u : U)
    (hu : (u : Z)=((1+p : ℕ) : Z)) :
    IsUnit (primePowerArithmeticCharacter p 0 χ 1 u-1) := sorry
-- identity_inadmissible
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    ¬IsUnit (primePowerArithmeticCharacter p n χ w (1 : U)-1) := sorry
-- zero_weight_principal_inadmissible
example (n : ℕ) (u : U) :
    ¬IsUnit (primePowerArithmeticCharacter p n (1 : DirichletCharacter K (p^n)) 0 u-1) := sorry

-- ring_map_identity_inadmissible
example (f : M →+* K) : ¬IsUnit (f (δ (1 : U)-1)) := sorry
-- principal_unit_ring_map_admissible
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (f : M →+* K)
    (hf : ∀ μ : M, f μ=extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter p n χ w).toContinuousMap)
    (u : U) (hu : (u : Z)=((1+p^(n+1) : ℕ) : Z)) (hw : 0<w) :
    IsUnit (f (δ u-1)) := sorry
-- conditional_smoothing_independent
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
-- conditional_quadratic_zero_value
example (f : M →+* K)
    (hf : ∀ μ : M, f μ=extendIntegralUnitCoefficients (R := K) μ
      (primePowerArithmeticCharacter 3 1 (χ.ringHomComp (algebraMap ℚ K)) 1).toContinuousMap)
    (u : U) (hu : (u : ℤ_[3])=4) (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure 3)=1/3 := sorry
-- conditional_quadratic_negative_two
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

/-! ## The tame zeta measure on the actual multiplicative unit group -/
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
-- arithmetic_unit_test_formula
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ w u =
      primePowerCharacter p n χ (u : ℤ_[p])*(algebraMap ℤ_[p] K (u : ℤ_[p]))^w := sorry
-- arithmetic_unit_weight_zero_formula
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : (ℤ_[p])ˣ) :
    primePowerArithmeticCharacter p n χ 0 u = primePowerCharacter p n χ (u : ℤ_[p]) := sorry
-- trivial_tame_level
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicTameZetaMeasure η hD hpD = 0 := sorry
-- zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD 0 = 0 := sorry
-- unique_pushforward
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (ν : D((ℤ_[p])ˣ,K))
    (hν : map (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[p])ˣ,ℤ_[p])) ν =
      tameZetaMeasure η hD hpD) : ν=intrinsicTameZetaMeasure η hD hpD := sorry
-- inclusion_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C(ℤ_[p],K)) :
    intrinsicTameZetaMeasure η hD hpD
      (f.comp (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[p])ˣ,ℤ_[p]))) =
      tameZetaMeasure η hD hpD f := sorry
-- inclusion_identity_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD 1 = tameZetaMeasure η hD hpD 1 := sorry
-- zero_weight_character
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ 0).toContinuousMap =
      tameZetaMeasure η hD hpD (primePowerCharacter p n χ) := sorry
-- zero_level_zero_weight_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0).toContinuousMap =
      intrinsicTameZetaMeasure η hD hpD 1 := sorry
-- matching_coefficient_algebra_hom
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    characterIntegralAlgHom (primePowerArithmeticCharacter p n χ w) (intrinsicTameZetaMeasure η hD hpD) =
      intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ w).toContinuousMap := sorry
-- total_mass_bound
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    ‖intrinsicTameZetaMeasure η hD hpD 1‖ ≤ 1 := sorry
-- norm_bound_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (f : C((ℤ_[p])ˣ,K)) : ‖intrinsicTameZetaMeasure η hD hpD f‖ ≤ ‖f‖ := sorry
end General

section DyadicQuadratic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
variable (η : DirichletCharacter ℚ_[2] 3) (hη : η 2 = -1)
  (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2∣3)
include hη
-- first_unit_moment
example :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap = 2/3 := sorry
-- quadratic_product_weight_two
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter 2 2 χ 2).toContinuousMap = -2 := sorry
-- quadratic_product_weight_four
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter 2 2 χ 4).toContinuousMap = 46 := sorry
-- principal_positive_level_first
example :
    intrinsicTameZetaMeasure η hD hpD
      (primePowerArithmeticCharacter 2 1 (1 : DirichletCharacter ℚ_[2] (2^1)) 1).toContinuousMap = 2/3 := sorry
end DyadicQuadratic
end SuggestedIntrinsicTameTests
end
end DirichletPadic

/-! ## Integral arithmetic characters and tame measures on the unit group
The coefficient ring is the existing norm-valuation integer subring of K.
No separately chosen p-adic algebra structure on that subring is used. -/
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
-- norm_zero_weight
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    ‖primePowerArithmeticCharacter p n χ 0 u‖ ≤ 1 := sorry
-- norm_all_positive_weights
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    ‖primePowerArithmeticCharacter p n χ (w+1) u‖ ≤ 1 := sorry
-- integral_character_identity
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) :
    integralPrimePowerArithmeticCharacter p n χ w 1 = 1 := sorry
-- integral_character_trivial_boundary
example : integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0 = 1 := sorry
-- integral_character_coefficient
example (n w : ℕ) (χ : DirichletCharacter K (p^n)) (u : U) :
    (integralPrimePowerArithmeticCharacter p n χ w u : K) =
      primePowerArithmeticCharacter p n χ w u := sorry
-- integral_character_principal_sign
example : (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1 (-1) : K) = -1 := sorry
-- integral_tame_modulus_one
example (η : DirichletCharacter K 1) (hD : IsUnit ((1 : ℕ) : K)) (hpD : ¬p∣1) :
    intrinsicIntegralTameZetaMeasure η hD hpD = 0 := sorry
-- integral_zero_test
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicIntegralTameZetaMeasure η hD hpD 0 = 0 := sorry
-- integral_unique_ambient
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (ν : D(U,O)) (hν : map uMap ν=integralTameZetaMeasure η hD hpD) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry
-- integral_inclusion_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(ℤ_[p],O)) :
    intrinsicIntegralTameZetaMeasure η hD hpD (f.comp uMap) =
      integralTameZetaMeasure η hD hpD f := sorry
-- integral_inclusion_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    intrinsicIntegralTameZetaMeasure η hD hpD 1=integralTameZetaMeasure η hD hpD 1 := sorry
-- coefficient_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (f : C(U,O)) :
    (intrinsicIntegralTameZetaMeasure η hD hpD f : K) =
      intrinsicTameZetaMeasure η hD hpD ((iMap).comp f) := sorry
-- integral_mass_norm
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    ‖intrinsicIntegralTameZetaMeasure η hD hpD 1‖ ≤ 1 := sorry
-- coefficient_unique_all_tests
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) (ν : D(U,O))
    (hν : ∀ f : C(U,O), (ν f : K)=intrinsicTameZetaMeasure η hD hpD ((iMap).comp f)) :
    ν=intrinsicIntegralTameZetaMeasure η hD hpD := sorry
-- integral_character_zero_weight
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D)
    (n : ℕ) (χ : DirichletCharacter K (p^n)) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p n χ 0).toContinuousMap : K) =
    intrinsicTameZetaMeasure η hD hpD (primePowerArithmeticCharacter p n χ 0).toContinuousMap := sorry
-- integral_character_total_mass
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 0).toContinuousMap : K) =
      intrinsicTameZetaMeasure η hD hpD 1 := sorry
-- integral_character_value_mem_integer
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
-- integral_common_first_value
example : (intrinsicIntegralTameZetaMeasure η hD hpD
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap :
      ℚ_[2]) = 2/3 := sorry
-- integral_common_twisted_value
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3 = -1) :
    (intrinsicIntegralTameZetaMeasure η hD hpD
      (integralPrimePowerArithmeticCharacter 2 2 χ 2).toContinuousMap : ℚ_[2]) = -2 := sorry
end Dyadic
end SuggestedIntegralUnitTests
end
end DirichletPadic

/-! ## The localized Eisenstein constant, with its shifted denominator

Theorem 8.2(a) is used with the confirmed correction E54: its constant is a
character-twisted localized element. No membership in ordinary pseudomeasures
is asserted. The factor 2 remains in a regular denominator, including at p=2.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
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

def eisensteinTwistedDenominator (u : U) : M := sorry
lemma eisensteinTwistedDenominator_def (u : U) :
    eisensteinTwistedDenominator p u = (u : Z) • dirac Z u-1 := sorry
lemma eisensteinTwistedDenominator_apply (u : U) (f : C(U,Z)) :
    eisensteinTwistedDenominator p u f = (u : Z)*f u-f 1 := sorry
lemma eisensteinTwistedDenominator_one : eisensteinTwistedDenominator p 1 = 0 := sorry
lemma eisensteinTwistedDenominator_moment (u : U) (k : ℕ) :
    eisensteinTwistedDenominator p u (j^k) = (u : Z)^(k+1)-1 := sorry
lemma eisensteinTwistedDenominator_double_regular (a : U)
    (ha : (a : Z)=(p+1 : ℕ)) :
    2*eisensteinTwistedDenominator p a ∈ nonZeroDivisors M := sorry

def eisensteinWeightedNumerator (u : U) : M := sorry
lemma eisensteinWeightedNumerator_def (u : U) :
    eisensteinWeightedNumerator p u = weight j (padicIntrinsicNumerator p u) := sorry
lemma eisensteinWeightedNumerator_apply (u : U) (f : C(U,Z)) :
    eisensteinWeightedNumerator p u f = padicIntrinsicNumerator p u (j*f) := sorry
lemma eisensteinWeightedNumerator_one : eisensteinWeightedNumerator p 1 = 0 := sorry
lemma eisensteinWeightedNumerator_neg_one : eisensteinWeightedNumerator p (-1) = 0 := sorry
lemma eisensteinWeightedNumerator_moment (u : U) (k : ℕ) :
    (eisensteinWeightedNumerator p u (j^k) : ℚ_[p]) =
      (1-(p : ℚ_[p])^k)*(1-(u : ℚ_[p])^(k+1))*
      algebraMap ℚ ℚ_[p] (bernoulli (k+1)/(k+1)) := sorry

def localizedEisensteinConstant : Q := sorry
lemma localizedEisensteinConstant_eq_fraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    localizedEisensteinConstant p =
      IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
        ⟨2*eisensteinTwistedDenominator p a,
          eisensteinTwistedDenominator_double_regular p a ha⟩ := sorry
lemma localizedEisensteinConstant_clearing (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*
      localizedEisensteinConstant p = algebraMap M Q (eisensteinWeightedNumerator p a) := sorry
lemma localizedEisensteinConstant_unique (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : Q)
    (hz : (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*z =
      algebraMap M Q (eisensteinWeightedNumerator p a)) :
    z=localizedEisensteinConstant p := sorry
lemma localizedEisensteinConstant_double_twist (T : M ≃+* M)
    (hT : ∀ μ : M, T μ=weight j μ) :
    (2 : Q)*localizedEisensteinConstant p =
      IsFractionRing.ringEquivOfRingEquiv (K := Q) (L := Q) T
        (kubotaLeopoldtPseudomeasure p : Q) := sorry
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
-- inherited_numerator_identity
example : padicIntrinsicNumerator 3 1 = 0 := sorry
-- inherited_numerator_negative
example : padicIntrinsicNumerator 3 (-1) = 0 := sorry
-- denominator_identity
example : eisensteinTwistedDenominator p 1 = 0 := sorry
-- denominator_zero_test
example (u : U) : eisensteinTwistedDenominator p u 0 = 0 := sorry
-- denominator_mass_shift
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinTwistedDenominator p a 1 = (p : Z) := sorry
-- denominator_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinTwistedDenominator 2 a (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) = 8 := sorry
-- denominator_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinTwistedDenominator 2 a
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) = 80 := sorry
-- regular_dyadic_double
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    2*eisensteinTwistedDenominator 2 a ∈ nonZeroDivisors D((ℤ_[2])ˣ,ℤ_[2]) := sorry
-- regular_is_not_integral_division
example : ¬IsUnit (2 : ℤ_[2]) := sorry
-- numerator_identity
example : eisensteinWeightedNumerator p 1 = 0 := sorry
-- numerator_negative_identity
example : eisensteinWeightedNumerator p (-1) = 0 := sorry
-- numerator_all_tests
example (u : U) (f : C(U,Z)) :
    eisensteinWeightedNumerator p u f = padicIntrinsicNumerator p u (j*f) := sorry
-- numerator_mass_zero
example (u : U) : eisensteinWeightedNumerator p u 1 = 0 := sorry
-- numerator_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (eisensteinWeightedNumerator 2 a
      (⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2])) : ℚ_[2]) = 2/3 := sorry
-- numerator_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (eisensteinWeightedNumerator 2 a
      ((⟨Units.val,Units.continuous_val⟩ : C((ℤ_[2])ˣ,ℤ_[2]))^3) : ℚ_[2]) = -14/3 := sorry
-- constant_fraction_canonical
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    localizedEisensteinConstant p = IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨2*eisensteinTwistedDenominator p a,eisensteinTwistedDenominator_double_regular p a ha⟩ := sorry
-- constant_representative_independent
example (a b : U) (ha : (a : Z)=(p+1 : ℕ)) (hb : (b : Z)=(p+1 : ℕ)) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨2*eisensteinTwistedDenominator p a,eisensteinTwistedDenominator_double_regular p a ha⟩ =
    IsLocalization.mk' Q (eisensteinWeightedNumerator p b)
      ⟨2*eisensteinTwistedDenominator p b,eisensteinTwistedDenominator_double_regular p b hb⟩ := sorry
-- constant_clearing_unique
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (z : Q)
    (hz : (2 : Q)*algebraMap M Q (eisensteinTwistedDenominator p a)*z =
      algebraMap M Q (eisensteinWeightedNumerator p a)) :
    z=localizedEisensteinConstant p := sorry
-- clearing_keeps_two
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    algebraMap M Q (2*eisensteinTwistedDenominator p a)*localizedEisensteinConstant p =
      algebraMap M Q (eisensteinWeightedNumerator p a) := sorry
-- conditional_twist_keeps_two
example (T : M ≃+* M) (hT : ∀ μ : M, T μ=weight j μ) :
    (2 : Q)*localizedEisensteinConstant p =
      IsFractionRing.ringEquivOfRingEquiv (K := Q) (L := Q) T
        (kubotaLeopoldtPseudomeasure p : Q) := sorry
end SuggestedLocalizedEisensteinTests

/-! ## Admissible evaluation of the Eisenstein constant

The evaluator is defined on the native localization at its displayed doubled
denominator. Its image in the total quotient is the existing localized constant;
no ring homomorphism from the entire total quotient to a field is asserted.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
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

def eisensteinMomentHom (k : ℕ) : M →+* ℚ_[p] := sorry
lemma eisensteinMomentHom_def (k : ℕ) :
    eisensteinMomentHom p k = (algebraMap Z ℚ_[p]).comp
      (characterIntegralAlgHom
        (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k)).toRingHom := sorry
lemma eisensteinMomentHom_apply (k : ℕ) (μ : M) :
    eisensteinMomentHom p k μ = (μ (j^k) : ℚ_[p]) := sorry
lemma eisensteinMomentHom_dirac (k : ℕ) (u : U) :
    eisensteinMomentHom p k (dirac Z u) = (u : ℚ_[p])^k := sorry
lemma eisensteinMomentHom_zero_weight (μ : M) :
    eisensteinMomentHom p 0 μ = (μ 1 : ℚ_[p]) := sorry
lemma eisensteinMomentHom_denominator_ne_zero (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinMomentHom p k (d a) ≠ 0 := sorry

def eisensteinAwayConstant (a : U) : S a := sorry
lemma eisensteinAwayConstant_def (a : U) :
    eisensteinAwayConstant p a = IsLocalization.mk' (S a)
      (eisensteinWeightedNumerator p a) ⟨d a,Submonoid.mem_powers (d a)⟩ := sorry
lemma eisensteinAwayConstant_clearing (a : U) :
    algebraMap M (S a) (d a)*eisensteinAwayConstant p a =
      algebraMap M (S a) (eisensteinWeightedNumerator p a) := sorry
lemma eisensteinAwayConstant_unique (a : U) (z : S a)
    (hz : algebraMap M (S a) (d a)*z = algebraMap M (S a) (eisensteinWeightedNumerator p a)) :
    z=eisensteinAwayConstant p a := sorry

def eisensteinAwayToFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) : S a →+* Q := sorry
lemma eisensteinAwayToFraction_def (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha = IsLocalization.Away.lift (d a)
      (IsLocalization.map_units Q
        (⟨d a,eisensteinTwistedDenominator_double_regular p a ha⟩ : nonZeroDivisors M)) := sorry
lemma eisensteinAwayToFraction_algebraMap (a : U) (ha : (a : Z)=(p+1 : ℕ)) (μ : M) :
    eisensteinAwayToFraction p a ha (algebraMap M (S a) μ) = algebraMap M Q μ := sorry
lemma eisensteinAwayToFraction_injective (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    Function.Injective (eisensteinAwayToFraction p a ha) := sorry
lemma eisensteinAwayToFraction_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (eisensteinAwayConstant p a) = localizedEisensteinConstant p := sorry

def eisensteinAwayMoment (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) : S a →+* ℚ_[p] := sorry
lemma eisensteinAwayMoment_def (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinAwayMoment p a ha k = IsLocalization.Away.lift (d a)
      (isUnit_iff_ne_zero.mpr (eisensteinMomentHom_denominator_ne_zero p a ha k)) := sorry
lemma eisensteinAwayMoment_algebraMap (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ) = (μ (j^k) : ℚ_[p]) := sorry
lemma eisensteinAwayMoment_unique (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ)
    (F : S a →+* ℚ_[p]) (hF : ∀ μ : M, F (algebraMap M (S a) μ)=eisensteinMomentHom p k μ) :
    F=eisensteinAwayMoment p a ha k := sorry
lemma eisensteinAwayMoment_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    eisensteinAwayMoment p a ha k (eisensteinAwayConstant p a) =
      algebraMap ℚ ℚ_[p] (-(1-(p : ℚ)^k)*bernoulli (k+1)/(2*(k+1))) := sorry
theorem eisensteinAwayConstant_classical (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (k : ℕ) (hk : 4 ≤ k) (he : Even k) :
    let c : ℚ := -(1-(p : ℚ)^(k-1))*bernoulli k/(2*k)
    eisensteinAwayMoment p a ha (k-1) (eisensteinAwayConstant p a) = algebraMap ℚ ℚ_[p] c ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p k hk)).coeff 0 = algebraMap ℚ ℂ c := sorry
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
-- zero_level_coordinate_character
example (k : ℕ) (u : U) :
    primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k u = (u : Z)^k := sorry
-- moment_zero_is_mass
example (μ : M) : eisensteinMomentHom p 0 μ = (μ 1 : ℚ_[p]) := sorry
-- moment_identity_atom
example (k : ℕ) : eisensteinMomentHom p k (dirac Z (1 : U)) = 1 := sorry
-- moment_sign_atom
example (k : ℕ) : eisensteinMomentHom p k (dirac Z (-1 : U)) = (-1 : ℚ_[p])^k := sorry
-- moment_arbitrary_integral_test
example (k : ℕ) (μ : M) : eisensteinMomentHom p k μ = (μ (j^k) : ℚ_[p]) := sorry
-- denominator_mass_nonzero
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) : eisensteinMomentHom p 0 (d a) = 2*(p : ℚ_[p]) := sorry
-- denominator_dyadic_fourth_weight
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinMomentHom 2 3 (2*eisensteinTwistedDenominator 2 a) = 160 := sorry
-- away_fraction_definition
example (a : U) : eisensteinAwayConstant p a = IsLocalization.mk' (S a)
    (eisensteinWeightedNumerator p a) ⟨d a,Submonoid.mem_powers (d a)⟩ := sorry
-- away_clearing_characterizes
example (a : U) (z : S a) (hz : algebraMap M (S a) (d a)*z =
    algebraMap M (S a) (eisensteinWeightedNumerator p a)) : z=eisensteinAwayConstant p a := sorry
-- identity_parameter_collapses_localization
example : (0 : S (1 : U)) = 1 := sorry
-- inclusion_integral_numerator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (algebraMap M (S a) (eisensteinWeightedNumerator p a)) =
      algebraMap M Q (eisensteinWeightedNumerator p a) := sorry
-- inclusion_detects_equality
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (x y : S a) :
    eisensteinAwayToFraction p a ha x=eisensteinAwayToFraction p a ha y ↔ x=y := sorry
-- inclusion_unit
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) : eisensteinAwayToFraction p a ha 1=1 := sorry
-- inclusion_is_actual_constant
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayToFraction p a ha (eisensteinAwayConstant p a)=localizedEisensteinConstant p := sorry
-- evaluator_integral_measure
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ)=(μ (j^k) : ℚ_[p]) := sorry
-- evaluator_unit
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) : eisensteinAwayMoment p a ha k 1=1 := sorry
-- evaluator_unique_extension
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (F : S a →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S a) μ)=eisensteinMomentHom p k μ) :
    F=eisensteinAwayMoment p a ha k := sorry
-- constant_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayMoment p a ha 0 (eisensteinAwayConstant p a)=0 := sorry
-- constant_dyadic_weight_four
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)= -7/240 := sorry
-- constant_odd_weight_three
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    eisensteinAwayMoment p a ha 2 (eisensteinAwayConstant p a)=0 := sorry
-- common_dyadic_classical_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)=(-7/240 : ℚ_[2]) ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide))).coeff 0=(-7/240 : ℂ) := sorry
-- common_ternary_classical_constant
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    eisensteinAwayMoment 3 a ha 3 (eisensteinAwayConstant 3 a)=(-13/120 : ℚ_[3]) ∧
      (UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 3 4 (by decide))).coeff 0=(-13/120 : ℂ) := sorry
end SuggestedEisensteinAwayTests

/-! ## Full coefficientwise Eisenstein family over the denominator localization

The constant is the actual denominator-localized element, and positive
coefficients are the existing integral unit measures. Classical and p-adic
specializations are separate coefficient maps of one rational power series.
-/
namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure
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
local notation "S" => (fun a : U => Localization.Away (2*eisensteinTwistedDenominator p a))

def eisensteinAwaySeries (a : U) : PowerSeries (S a) := sorry
lemma eisensteinAwaySeries_coeff (a : U) (n : ℕ) :
    (eisensteinAwaySeries p a).coeff n = if hn : 0<n then
      algebraMap M (S a) (positiveEisensteinMeasure p ⟨n,hn⟩) else eisensteinAwayConstant p a := sorry
lemma eisensteinAwaySeries_coeff_zero (a : U) :
    (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry
lemma eisensteinAwaySeries_coeff_pos (a : U) (n : ℕ+) :
    (eisensteinAwaySeries p a).coeff (n : ℕ)=algebraMap M (S a) (positiveEisensteinMeasure p n) := sorry
lemma eisensteinAwaySeries_unique (a : U) (F : PowerSeries (S a))
    (h0 : F.coeff 0=eisensteinAwayConstant p a)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M (S a) (positiveEisensteinMeasure p n)) :
    F=eisensteinAwaySeries p a := sorry

def totalEisensteinSeries : PowerSeries Q := sorry
lemma totalEisensteinSeries_coeff (n : ℕ) :
    (totalEisensteinSeries p).coeff n = if hn : 0<n then
      algebraMap M Q (positiveEisensteinMeasure p ⟨n,hn⟩) else localizedEisensteinConstant p := sorry
lemma totalEisensteinSeries_coeff_zero :
    (totalEisensteinSeries p).coeff 0=localizedEisensteinConstant p := sorry
lemma totalEisensteinSeries_coeff_pos (n : ℕ+) :
    (totalEisensteinSeries p).coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n) := sorry
lemma totalEisensteinSeries_unique (F : PowerSeries Q)
    (h0 : F.coeff 0=localizedEisensteinConstant p)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n)) :
    F=totalEisensteinSeries p := sorry
lemma eisensteinAwaySeries_toFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p a).map (eisensteinAwayToFraction p a ha)=totalEisensteinSeries p := sorry
lemma eisensteinAwaySeries_specialize (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha k) =
      PowerSeries.C (eisensteinAwayMoment p a ha k (eisensteinAwayConstant p a))+
        (positiveEisensteinSeries p (j^k)).map (algebraMap Z ℚ_[p]) := sorry
theorem eisensteinSeries_common (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (k : ℕ) (hk : 4≤k) (he : Even k) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p k hk) ∧
      F.map (algebraMap ℚ ℚ_[p])=
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha (k-1)) := sorry
lemma eisensteinAwaySeries_coeff_mul_p (a : U) (n : ℕ) :
    (eisensteinAwaySeries p a).coeff (p*n)=(eisensteinAwaySeries p a).coeff n := sorry
end DirichletPadic

namespace SuggestedFullEisensteinTests
open scoped AbstractMeasure PowerSeries.WithPiTopology
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
local notation "S" => (fun a : U => Localization.Away (2*eisensteinTwistedDenominator p a))
-- integral_coefficient_evaluator
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) (μ : M) :
    eisensteinAwayMoment p a ha k (algebraMap M (S a) μ)=(μ (j^k) : ℚ_[p]) := sorry
-- away_constant_coefficient
example (a : U) : (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry
-- away_first_coefficient
example (a : U) : (eisensteinAwaySeries p a).coeff 1=1 := sorry
-- away_positive_coefficient
example (a : U) (n : ℕ+) : (eisensteinAwaySeries p a).coeff (n : ℕ)=
    algebraMap M (S a) (positiveEisensteinMeasure p n) := sorry
-- coefficient_zero_formula
example (a : U) : (eisensteinAwaySeries p a).coeff 0=eisensteinAwayConstant p a := sorry
-- total_constant_coefficient
example : (totalEisensteinSeries p).coeff 0=localizedEisensteinConstant p := sorry
-- total_first_coefficient
example : (totalEisensteinSeries p).coeff 1=1 := sorry
-- total_unique_coefficients
example (F : PowerSeries Q) (h0 : F.coeff 0=localizedEisensteinConstant p)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=algebraMap M Q (positiveEisensteinMeasure p n)) :
    F=totalEisensteinSeries p := sorry
-- image_is_full_total_series
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p a).map (eisensteinAwayToFraction p a ha)=totalEisensteinSeries p := sorry
-- specialization_retains_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 0=(-7/240 : ℚ_[2]) := sorry
-- specialization_prime_coefficient_survives
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 2=1 := sorry
-- specialization_dyadic_sixth_coefficient
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff 6=28 := sorry
-- common_whole_dyadic_series
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[2])=
        (eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3) := sorry
-- common_whole_ternary_series
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 3 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[3])=
        (eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 3) := sorry
-- index_invariance_includes_zero
example (a : U) : (eisensteinAwaySeries p a).coeff (p*0)=(eisensteinAwaySeries p a).coeff 0 := sorry
-- prime_power_coefficient_survives
example (a : U) (r : ℕ) : (eisensteinAwaySeries p a).coeff (p^r)=1 := sorry
end SuggestedFullEisensteinTests

/-! ## Uniform integral denominator clearing of the full Eisenstein family

The cleared coefficients live in the original integral convolution algebra.
Their arithmetic moments live in the p-adic integers before inclusion into
the field. The doubled shifted denominator remains explicit at every prime.
-/
namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure
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
local notation "Δ" => (fun a : U => 2*eisensteinTwistedDenominator p a)
local notation "S" => (fun a : U => Localization.Away (Δ a))

def clearedEisensteinSeries (a : U) : PowerSeries M := sorry
lemma clearedEisensteinSeries_coeff (a : U) (n : ℕ) :
    (clearedEisensteinSeries p a).coeff n = if hn : 0<n then
      Δ a * positiveEisensteinMeasure p ⟨n,hn⟩ else eisensteinWeightedNumerator p a := sorry
lemma clearedEisensteinSeries_coeff_zero (a : U) :
    (clearedEisensteinSeries p a).coeff 0=eisensteinWeightedNumerator p a := sorry
lemma clearedEisensteinSeries_coeff_pos (a : U) (n : ℕ+) :
    (clearedEisensteinSeries p a).coeff (n : ℕ)=Δ a * positiveEisensteinMeasure p n := sorry
lemma clearedEisensteinSeries_unique_coefficients (a : U) (F : PowerSeries M)
    (h0 : F.coeff 0=eisensteinWeightedNumerator p a)
    (hp : ∀ n : ℕ+, F.coeff (n : ℕ)=Δ a * positiveEisensteinMeasure p n) :
    F=clearedEisensteinSeries p a := sorry
lemma clearedEisensteinSeries_toAway (a : U) :
    (clearedEisensteinSeries p a).map (algebraMap M (S a)) =
      PowerSeries.C (algebraMap M (S a) (Δ a))*eisensteinAwaySeries p a := sorry
lemma clearedEisensteinSeries_toFraction (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (clearedEisensteinSeries p a).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p := sorry
lemma clearedEisensteinSeries_unique (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (F : PowerSeries M)
    (hF : F.map (algebraMap M Q)=
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p) :
    F=clearedEisensteinSeries p a := sorry

def integralClearedEisensteinMoment (a : U) (k : ℕ) : PowerSeries Z := sorry
lemma integralClearedEisensteinMoment_def (a : U) (k : ℕ) :
    integralClearedEisensteinMoment p a k = (clearedEisensteinSeries p a).map
      (characterIntegralAlgHom
        (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) k)).toRingHom := sorry
lemma integralClearedEisensteinMoment_coeff (a : U) (k n : ℕ) :
    (integralClearedEisensteinMoment p a k).coeff n =
      (clearedEisensteinSeries p a).coeff n (j^k) := sorry
lemma integralClearedEisensteinMoment_coeff_zero (a : U) (k : ℕ) :
    (integralClearedEisensteinMoment p a k).coeff 0 = eisensteinWeightedNumerator p a (j^k) := sorry
lemma integralClearedEisensteinMoment_coeff_pos (a : U) (k : ℕ) (n : ℕ+) :
    (integralClearedEisensteinMoment p a k).coeff (n : ℕ) =
      2*((a : Z)^(k+1)-1)*positiveEisensteinMeasure p n (j^k) := sorry
lemma integralClearedEisensteinMoment_unique (a : U) (k : ℕ) (F : PowerSeries Z)
    (hF : ∀ n : ℕ, F.coeff n=(clearedEisensteinSeries p a).coeff n (j^k)) :
    F=integralClearedEisensteinMoment p a k := sorry
theorem integralClearedEisensteinMoment_specialize (a : U) (ha : (a : Z)=(p+1 : ℕ)) (k : ℕ) :
    (integralClearedEisensteinMoment p a k).map (algebraMap Z ℚ_[p]) =
      PowerSeries.C (2*((a : ℚ_[p])^(k+1)-1))*
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha k) := sorry
end DirichletPadic

namespace SuggestedEisensteinClearingTests
open scoped AbstractMeasure PowerSeries.WithPiTopology
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
local notation "Δ" => (fun a : U => 2*eisensteinTwistedDenominator p a)
local notation "S" => (fun a : U => Localization.Away (Δ a))
-- away_constant_clearing_all_parameters
example (a : U) : algebraMap M (S a) (Δ a)*eisensteinAwayConstant p a =
    algebraMap M (S a) (eisensteinWeightedNumerator p a) := sorry
-- integral_cleared_constant
example (a : U) : (clearedEisensteinSeries p a).coeff 0=eisensteinWeightedNumerator p a := sorry
-- integral_cleared_first
example (a : U) : (clearedEisensteinSeries p a).coeff 1=Δ a := sorry
-- identity_parameter_zero_series
example : clearedEisensteinSeries p 1=0 := sorry
-- cleared_all_index_formula
example (a : U) (n : ℕ+) : (clearedEisensteinSeries p a).coeff (n : ℕ)=
    Δ a * positiveEisensteinMeasure p n := sorry
-- whole_away_clearing
example (a : U) : (clearedEisensteinSeries p a).map (algebraMap M (S a)) =
    PowerSeries.C (algebraMap M (S a) (Δ a))*eisensteinAwaySeries p a := sorry
-- whole_total_quotient_clearing
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (clearedEisensteinSeries p a).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p := sorry
-- integral_lift_unique
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (F : PowerSeries M)
    (hF : F.map (algebraMap M Q)=
      PowerSeries.C (algebraMap M Q (Δ a))*totalEisensteinSeries p) :
    F=clearedEisensteinSeries p a := sorry
-- integral_moment_zero_exponent
example (a : U) : (integralClearedEisensteinMoment p a 0).coeff 1=2*((a : Z)-1) := sorry
-- integral_moment_dyadic_constant
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    3*(integralClearedEisensteinMoment 2 a 3).coeff 0=(-14 : ℤ_[2]) := sorry
-- integral_moment_dyadic_first
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 1=160 := sorry
-- integral_moment_retains_double
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 1≠80 := sorry
-- integral_moment_every_coefficient
example (a : U) (k n : ℕ) : (integralClearedEisensteinMoment p a k).coeff n =
    (clearedEisensteinSeries p a).coeff n (j^k) := sorry
-- field_specialization_dyadic_four
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).map (algebraMap ℤ_[2] ℚ_[2]) =
      PowerSeries.C 160*(eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3) := sorry
-- field_specialization_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (integralClearedEisensteinMoment p a 0).map (algebraMap Z ℚ_[p]) =
      PowerSeries.C (2*(p : ℚ_[p]))*
        (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha 0) := sorry
-- field_specialization_prime_index_survives
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (integralClearedEisensteinMoment 2 a 3).coeff 2=160 := sorry
end SuggestedEisensteinClearingTests

/-! ## Integral congruences for the full cleared Eisenstein series

All divisibilities are in the p-adic integers or their power-series ring.
Norms of measure operators are taken only after extension to the p-adic field.
-/
namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure
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

lemma clearedEisensteinCoefficient_test_congr (a : U) (n r : ℕ) (f g : C(U,Z))
    (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    (p : Z)^r ∣ (clearedEisensteinSeries p a).coeff n f-
      (clearedEisensteinSeries p a).coeff n g := sorry

def clearedEisensteinEvaluation (a : U) : AbstractMeasure U Z (PowerSeries Z) := sorry
lemma clearedEisensteinEvaluation_coeff (a : U) (f : C(U,Z)) (n : ℕ) :
    (clearedEisensteinEvaluation p a f).coeff n=(clearedEisensteinSeries p a).coeff n f := sorry
lemma clearedEisensteinEvaluation_zero (a : U) : clearedEisensteinEvaluation p a 0=0 := sorry
lemma clearedEisensteinEvaluation_add (a : U) (f g : C(U,Z)) :
    clearedEisensteinEvaluation p a (f+g)=
      clearedEisensteinEvaluation p a f+clearedEisensteinEvaluation p a g := sorry
lemma clearedEisensteinEvaluation_smul (a : U) (c : Z) (f : C(U,Z)) :
    clearedEisensteinEvaluation p a (c • f)=c • clearedEisensteinEvaluation p a f := sorry
lemma clearedEisensteinEvaluation_continuous (a : U) :
    Continuous (clearedEisensteinEvaluation p a) := sorry
lemma clearedEisensteinEvaluation_unique (a : U) (F : AbstractMeasure U Z (PowerSeries Z))
    (hF : ∀ f n, (F f).coeff n=(clearedEisensteinSeries p a).coeff n f) :
    F=clearedEisensteinEvaluation p a := sorry
lemma clearedEisensteinEvaluation_moment (a : U) (k : ℕ) :
    clearedEisensteinEvaluation p a (j^k)=integralClearedEisensteinMoment p a k := sorry
lemma clearedEisensteinEvaluation_test_congr (a : U) (r : ℕ) (f g : C(U,Z))
    (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    PowerSeries.C ((p : Z)^r) ∣ clearedEisensteinEvaluation p a f-clearedEisensteinEvaluation p a g := sorry
theorem integralClearedEisensteinMoment_weight_congr (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : Z)^r) ∣
      integralClearedEisensteinMoment p a e'-integralClearedEisensteinMoment p a e := sorry
theorem eisensteinAwaySeries_cleared_weight_congr (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') (n : ℕ) :
    ‖2*((a : ℚ_[p])^(e'+1)-1)*
        ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      2*((a : ℚ_[p])^(e+1)-1)*
        ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ)) := sorry
end DirichletPadic

namespace SuggestedEisensteinCongruenceTests
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure DirichletPadic
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))
-- integral_constant_test_congruence
example (a : U) (r : ℕ) (f g : C(U,Z)) (hfg : ∀ u, (p : Z)^r ∣ f u-g u) :
    (p : Z)^r ∣ (clearedEisensteinSeries p a).coeff 0 f-
      (clearedEisensteinSeries p a).coeff 0 g := sorry
-- cleared_evaluation_zero
example (a : U) : clearedEisensteinEvaluation p a 0=0 := sorry
-- cleared_evaluation_constant
example (a : U) (f : C(U,Z)) :
    (clearedEisensteinEvaluation p a f).coeff 0=eisensteinWeightedNumerator p a f := sorry
-- cleared_evaluation_first
example (a : U) (f : C(U,Z)) :
    (clearedEisensteinEvaluation p a f).coeff 1=2*((a : Z)*f a-f 1) := sorry
-- cleared_evaluation_dyadic_cubic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    (clearedEisensteinEvaluation 2 a
      ((ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[2])ˣ,ℤ_[2]))^3)).coeff 1=160 := sorry
-- full_coefficient_evaluation
example (a : U) (f : C(U,Z)) (n : ℕ) :
    (clearedEisensteinEvaluation p a f).coeff n=(clearedEisensteinSeries p a).coeff n f := sorry
-- moment_evaluation_comparison
example (a : U) (e : ℕ) :
    clearedEisensteinEvaluation p a (j^e)=integralClearedEisensteinMoment p a e := sorry
-- precision_zero_allowed
example (a : U) (f g : C(U,Z)) :
    PowerSeries.C (1 : Z) ∣ clearedEisensteinEvaluation p a f-clearedEisensteinEvaluation p a g := sorry
-- uniform_eight_test_precision
example (a : (ℤ_[2])ˣ) (f g : C((ℤ_[2])ˣ,ℤ_[2])) (h : ∀ u, (8 : ℤ_[2]) ∣ f u-g u) :
    PowerSeries.C (8 : ℤ_[2]) ∣ clearedEisensteinEvaluation 2 a f-clearedEisensteinEvaluation 2 a g := sorry
-- dyadic_full_weight_precision
example (a : (ℤ_[2])ˣ) : PowerSeries.C (8 : ℤ_[2]) ∣
    integralClearedEisensteinMoment 2 a 7-integralClearedEisensteinMoment 2 a 3 := sorry
-- quinary_full_weight_precision
example (a : (ℤ_[5])ˣ) : PowerSeries.C (25 : ℤ_[5]) ∣
    integralClearedEisensteinMoment 5 a 23-integralClearedEisensteinMoment 5 a 3 := sorry
-- tame_component_not_full_precision
example (a : (ℤ_[5])ˣ) (ha : (a : ℤ_[5])=6) :
    ¬ PowerSeries.C (25 : ℤ_[5]) ∣
      integralClearedEisensteinMoment 5 a 7-integralClearedEisensteinMoment 5 a 3 := sorry
-- cleared_constant_dyadic_precision
example : ‖(-10400/3 : ℚ_[2])‖ ≤ (1/8 : ℝ) := sorry
-- uncleared_constant_precision_loss
example : ‖(-113/480 : ℚ_[2])‖=32 := sorry
end SuggestedEisensteinCongruenceTests

/-! ## Explicit precision loss for the full admissible Eisenstein series -/
namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "D" => (fun (a : U) (e : ℕ) => 2*((a : ℚ_[p])^(e+1)-1))

lemma eisensteinAwaySeries_coeff_eq_integral_div (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e n : ℕ) :
    ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n =
      ((integralClearedEisensteinMoment p a e).coeff n : ℚ_[p])/D a e := sorry
lemma eisensteinDenominator_weight_congr (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    ‖D a e'-D a e‖≤(p : ℝ)^(-(r : ℤ)) := sorry
lemma eisensteinAwaySeries_coeff_norm_le (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖≤
      1/‖D a e‖ := sorry
theorem eisensteinAwaySeries_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') (n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ))/(‖D a e‖*‖D a e'‖) := sorry
lemma eisensteinDenominator_norm_eq (a : U) (r e e' : ℕ) (hr : 0<r)
    (he : Nat.ModEq (p^(r-1)*(p-1)) e e')
    (hsmall : (p : ℝ)^(-(r : ℤ))<‖D a e‖) : ‖D a e'‖=‖D a e‖ := sorry
theorem eisensteinAwaySeries_local_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e')
    (hsmall : (p : ℝ)^(-(r : ℤ))<‖D a e‖) (n : ℕ) :
    ‖((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e')).coeff n-
      ((eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e)).coeff n‖ ≤
      (p : ℝ)^(-(r : ℤ))/‖D a e‖^2 := sorry
theorem rationalEisensteinSeries_weight_precision (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (r w w' : ℕ) (hr : 0<r) (hw : 4≤w) (hw' : 4≤w') (hew : Even w) (hew' : Even w')
    (he : Nat.ModEq (p^(r-1)*(p-1)) (w-1) (w'-1))
    (F G : PowerSeries ℚ)
    (hF : F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w hw))
    (hG : G.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w' hw'))
    (n : ℕ) :
    ‖algebraMap ℚ ℚ_[p] (G.coeff n-F.coeff n)‖ ≤
      (p : ℝ)^(-(r : ℤ))/(‖2*((a : ℚ_[p])^w-1)‖*‖2*((a : ℚ_[p])^w'-1)‖) := sorry
end DirichletPadic

namespace SuggestedEisensteinPrecisionTests
open scoped PowerSeries.WithPiTopology
open DirichletPadic
-- full_coefficient_quotient
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n =
      ((integralClearedEisensteinMoment 2 a 3).coeff n : ℚ_[2])/160 := sorry
-- denominator_dyadic_variation
example : ‖(13120-160 : ℚ_[2])‖≤(1/8 : ℝ) := sorry
-- uniform_dyadic_bound
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ‖((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n‖≤32 := sorry
-- dyadic_quotient_precision
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (n : ℕ) :
    ‖((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 7)).coeff n-
      ((eisensteinAwaySeries 2 a).map (eisensteinAwayMoment 2 a ha 3)).coeff n‖≤256 := sorry
-- distinct_denominator_norms
example : ‖(160 : ℚ_[2])‖=1/32 ∧ ‖(13120 : ℚ_[2])‖=1/64 := sorry
-- stable_ternary_denominator
example : ‖(2*(4^10-1) : ℚ_[3])‖=‖(2*(4^4-1) : ℚ_[3])‖ := sorry
-- strict_neighborhood_required
example : ‖(126 : ℚ_[3])‖≠‖(6 : ℚ_[3])‖ := sorry
-- local_ternary_precision
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) (n : ℕ) :
    ‖((eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 57)).coeff n-
      ((eisensteinAwaySeries 3 a).map (eisensteinAwayMoment 3 a ha 3)).coeff n‖≤(1/9 : ℝ) := sorry
-- classical_rational_precision
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) (F G : PowerSeries ℚ)
    (hF : F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)))
    (hG : G.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 8 (by decide)))
    (n : ℕ) : ‖algebraMap ℚ ℚ_[2] (G.coeff n-F.coeff n)‖≤256 := sorry
end SuggestedEisensteinPrecisionTests

/-! ## Independence of the regular smoothing parameter

All-unit shifted clearing is proved on the actual integral numerator measures.
Regularity is required only when a new representative is formed in the total quotient.
-/
namespace DirichletPadic
open scoped AbstractMeasure PowerSeries.WithPiTopology
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
local notation "Δ" => (fun u : U => 2*eisensteinTwistedDenominator p u)
local notation "S" => (fun u : U => Localization.Away (Δ u))

lemma eisensteinWeightedNumerator_cross (u v : U) :
    eisensteinTwistedDenominator p v*eisensteinWeightedNumerator p u =
      eisensteinTwistedDenominator p u*eisensteinWeightedNumerator p v := sorry
lemma localizedEisensteinConstant_clearing_all (u : U) :
    algebraMap M Q (Δ u)*localizedEisensteinConstant p =
      algebraMap M Q (eisensteinWeightedNumerator p u) := sorry
lemma localizedEisensteinConstant_regular_fraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p u) ⟨Δ u,hu⟩ =
      localizedEisensteinConstant p := sorry
lemma clearedEisensteinSeries_toFraction_all (u : U) :
    (clearedEisensteinSeries p u).map (algebraMap M Q) =
      PowerSeries.C (algebraMap M Q (Δ u))*totalEisensteinSeries p := sorry

def regularEisensteinAwayToFraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) : S u →+* Q := sorry
lemma regularEisensteinAwayToFraction_def (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu = IsLocalization.Away.lift (Δ u)
      (IsLocalization.map_units Q (⟨Δ u,hu⟩ : nonZeroDivisors M)) := sorry
lemma regularEisensteinAwayToFraction_algebraMap (u : U) (hu : Δ u ∈ nonZeroDivisors M) (μ : M) :
    regularEisensteinAwayToFraction p u hu (algebraMap M (S u) μ)=algebraMap M Q μ := sorry
lemma regularEisensteinAwayToFraction_injective (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    Function.Injective (regularEisensteinAwayToFraction p u hu) := sorry
lemma regularEisensteinAwayToFraction_canonical (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    regularEisensteinAwayToFraction p a (eisensteinTwistedDenominator_double_regular p a ha)=
      eisensteinAwayToFraction p a ha := sorry
lemma regularEisensteinAwayToFraction_constant (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu (eisensteinAwayConstant p u)=localizedEisensteinConstant p := sorry
lemma regularEisensteinAwaySeries_toFraction (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    (eisensteinAwaySeries p u).map (regularEisensteinAwayToFraction p u hu)=totalEisensteinSeries p := sorry
end DirichletPadic

namespace SuggestedEisensteinParameterTests
open scoped AbstractMeasure PowerSeries.WithPiTopology
open AbstractMeasure DirichletPadic
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
local notation "Δ" => (fun u : U => 2*eisensteinTwistedDenominator p u)
local notation "S" => (fun u : U => Localization.Away (Δ u))
-- shifted_cross_orientation
example (u v : U) :
    eisensteinTwistedDenominator p v*eisensteinWeightedNumerator p u =
      eisensteinTwistedDenominator p u*eisensteinWeightedNumerator p v := sorry
-- all_parameter_identity_clearing
example : algebraMap M Q (Δ 1)*localizedEisensteinConstant p=0 := sorry
-- torsion_parameter_annihilates_constant
example : algebraMap M Q (Δ (-1))*localizedEisensteinConstant p=0 := sorry
-- canonical_fraction_comparison
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    IsLocalization.mk' Q (eisensteinWeightedNumerator p a)
      ⟨Δ a,eisensteinTwistedDenominator_double_regular p a ha⟩=localizedEisensteinConstant p := sorry
-- all_parameter_full_clearing
example (u : U) : (clearedEisensteinSeries p u).map (algebraMap M Q) =
    PowerSeries.C (algebraMap M Q (Δ u))*totalEisensteinSeries p := sorry
-- regular_map_integral_coefficients
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) (μ : M) :
    regularEisensteinAwayToFraction p u hu (algebraMap M (S u) μ)=algebraMap M Q μ := sorry
-- regular_map_preserves_one
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) : regularEisensteinAwayToFraction p u hu 1=1 := sorry
-- regular_map_canonical_compatibility
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    regularEisensteinAwayToFraction p a (eisensteinTwistedDenominator_double_regular p a ha)=
      eisensteinAwayToFraction p a ha := sorry
-- regular_constant_image
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    regularEisensteinAwayToFraction p u hu (eisensteinAwayConstant p u)=localizedEisensteinConstant p := sorry
-- regular_full_family_image
example (u : U) (hu : Δ u ∈ nonZeroDivisors M) :
    (eisensteinAwaySeries p u).map (regularEisensteinAwayToFraction p u hu)=totalEisensteinSeries p := sorry
end SuggestedEisensteinParameterTests

/-! ## Evaluation at every character-admissible smoothing parameter

The nonvanishing condition is on the image of the doubled shifted denominator.
It does not assert regularity of that denominator in the integral measure ring.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
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
local notation "d" => (fun u : U => 2*eisensteinTwistedDenominator p u)
local notation "S" => (fun u : U => Localization.Away (d u))

lemma eisensteinMomentHom_denominator (u : U) (e : ℕ) :
    eisensteinMomentHom p e (d u)=2*((u : ℚ_[p])^(e+1)-1) := sorry
def admissibleEisensteinAwayMoment (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) : S u →+* ℚ_[p] := sorry
lemma admissibleEisensteinAwayMoment_def (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h = IsLocalization.Away.lift (d u)
      (isUnit_iff_ne_zero.mpr (by rw [eisensteinMomentHom_denominator]; exact h)) := sorry
lemma admissibleEisensteinAwayMoment_algebraMap (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (μ : M) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) μ)=(μ (j^e) : ℚ_[p]) := sorry
lemma admissibleEisensteinAwayMoment_unique (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (F : S u →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S u) μ)=eisensteinMomentHom p e μ) :
    F=admissibleEisensteinAwayMoment p u e h := sorry
lemma admissibleEisensteinAwayMoment_canonical (a : U) (ha : (a : Z)=(p+1 : ℕ))
    (e : ℕ) (h : 2*((a : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p a e h=eisensteinAwayMoment p a ha e := sorry
lemma admissibleEisensteinAwayMoment_constant (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h (eisensteinAwayConstant p u)=
      algebraMap ℚ ℚ_[p] (-(1-(p : ℚ)^e)*bernoulli (e+1)/(2*(e+1))) := sorry
lemma admissibleEisensteinSeries_canonical (u : U) (e : ℕ)
    (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e h)=
      (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e) := sorry
lemma admissibleEisensteinSeries_independent (u v : U) (e : ℕ)
    (hu : 2*((u : ℚ_[p])^(e+1)-1)≠0) (hv : 2*((v : ℚ_[p])^(e+1)-1)≠0) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e hu)=
      (eisensteinAwaySeries p v).map (admissibleEisensteinAwayMoment p v e hv) := sorry
theorem admissibleEisensteinSeries_common (u : U) (w : ℕ) (hw : 4≤w) (he : Even w)
    (h : 2*((u : ℚ_[p])^((w-1)+1)-1)≠0) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein p w hw) ∧
      F.map (algebraMap ℚ ℚ_[p])=
        (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u (w-1) h) := sorry
end DirichletPadic

namespace SuggestedAdmissibleEisensteinTests
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
local notation "d" => (fun u : U => 2*eisensteinTwistedDenominator p u)
local notation "S" => (fun u : U => Localization.Away (d u))
-- identity_is_never_admissible
example (e : ℕ) : eisensteinMomentHom p e (d 1)=0 := sorry
-- negative_parameter_even_exponent
example (e : ℕ) (he : Even e) : eisensteinMomentHom p e (d (-1))= -4 := sorry
-- negative_parameter_odd_exponent
example (e : ℕ) (he : Odd e) : eisensteinMomentHom p e (d (-1))=0 := sorry
-- noncanonical_ternary_denominator
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    eisensteinMomentHom 3 1 (2*eisensteinTwistedDenominator 3 u)=6 := sorry
-- admissible_evaluator_one
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h 1=1 := sorry
-- admissible_evaluator_integral_agreement
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (μ : M) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) μ)=(μ (j^e) : ℚ_[p]) := sorry
-- admissible_evaluator_unique_extension
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) (F : S u →+* ℚ_[p])
    (hF : ∀ μ : M, F (algebraMap M (S u) μ)=eisensteinMomentHom p e μ) :
    F=admissibleEisensteinAwayMoment p u e h := sorry
-- admissible_evaluator_canonical
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ)
    (h : 2*((a : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p a e h=eisensteinAwayMoment p a ha e := sorry
-- admissible_integral_dirac
example (u v : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0) :
    admissibleEisensteinAwayMoment p u e h (algebraMap M (S u) (dirac Z v))=(v : ℚ_[p])^e := sorry
-- noncanonical_ternary_constant
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) (h : 2*((u : ℚ_[3])^2-1)≠0) :
    admissibleEisensteinAwayMoment 3 u 1 h (eisensteinAwayConstant 3 u)=1/12 := sorry
-- noncanonical_dyadic_constant
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) (h : 2*((u : ℚ_[2])^4-1)≠0) :
    admissibleEisensteinAwayMoment 2 u 3 h (eisensteinAwayConstant 2 u)= -7/240 := sorry
-- admissible_torsion_zero_constant
example (h : 2*(((-1 : U) : ℚ_[p])^3-1)≠0) :
    admissibleEisensteinAwayMoment p (-1) 2 h (eisensteinAwayConstant p (-1))=0 := sorry
-- admissible_full_canonical_comparison
example (u : U) (e : ℕ) (h : 2*((u : ℚ_[p])^(e+1)-1)≠0)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e h)=
      (eisensteinAwaySeries p a).map (eisensteinAwayMoment p a ha e) := sorry
-- admissible_full_parameter_independence
example (u v : U) (e : ℕ)
    (hu : 2*((u : ℚ_[p])^(e+1)-1)≠0) (hv : 2*((v : ℚ_[p])^(e+1)-1)≠0) :
    (eisensteinAwaySeries p u).map (admissibleEisensteinAwayMoment p u e hu)=
      (eisensteinAwaySeries p v).map (admissibleEisensteinAwayMoment p v e hv) := sorry
-- noncanonical_common_dyadic_series
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) (h : 2*((u : ℚ_[2])^4-1)≠0) :
    ∃! F : PowerSeries ℚ,
      F.map (algebraMap ℚ ℂ)=UpperHalfPlane.qExpansion 1 (pStabilizedEisenstein 2 4 (by decide)) ∧
      F.map (algebraMap ℚ ℚ_[2])=
        (eisensteinAwaySeries 2 u).map (admissibleEisensteinAwayMoment 2 u 3 h) := sorry
end SuggestedAdmissibleEisensteinTests

/-! ## Ordinary-pseudomeasure and bounded-measure obstructions

The source constant has shifted clearing relations. Its ordinary clearing
factor at negative identity fails integrality, including in residue prime2.
All arithmetic evaluation below stays on the canonical Away localization.
-/
namespace DirichletPadic
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))
local notation "t" => (ContinuousMap.mk (fun u : U => (u : ℚ_[p])) (by fun_prop) : C(U,ℚ_[p]))
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "Q" => FractionRing M
local notation "i" => algebraMap M Q
local notation "δ" => (diracHom (G := U) (R := Z))

lemma eisensteinAwayMoment_double_constant (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    2*eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a)=
      positivePseudoMoment p (e+1) (by omega) (kubotaLeopoldtPseudomeasure p) := sorry
lemma localizedEisensteinConstant_clearing_candidate (g : U) (μ : M)
    (hμ : i μ=i (dirac Z g-1)*localizedEisensteinConstant p)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=((g : ℚ_[p])^e-1)*
      eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry
lemma localizedEisensteinConstant_sign_candidate (μ : M)
    (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p)
    (k : ℕ) (hk : 0<k) :
    (μ (j^(2*k-1)) : ℚ_[p])=
      -positivePseudoMoment p (2*k) (by omega) (kubotaLeopoldtPseudomeasure p) := sorry
theorem localizedEisensteinConstant_sign_not_integral :
    i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p ∉ Set.range i := sorry
theorem localizedEisensteinConstant_not_pseudomeasure :
    localizedEisensteinConstant p ∉ Iwasawa.pseudomeasures δ Q := sorry
theorem localizedEisensteinConstant_not_integral :
    localizedEisensteinConstant p ∉ Set.range i := sorry
theorem eisensteinAwayConstant_no_field_measure (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    ¬∃ μ : D(U,ℚ_[p]), ∀ e : ℕ,
      μ (t^e)=eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry
end DirichletPadic

namespace SuggestedEisensteinObstructionTests
open scoped AbstractMeasure
open AbstractMeasure DirichletPadic
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))
local notation "t" => (ContinuousMap.mk (fun u : U => (u : ℚ_[p])) (by fun_prop) : C(U,ℚ_[p]))
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "Q" => FractionRing M
local notation "i" => algebraMap M Q
local notation "δ" => (diracHom (G := U) (R := Z))
-- double_constant_dyadic
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    2*eisensteinAwayMoment 2 a ha 3 (eisensteinAwayConstant 2 a)= -7/120 := sorry
-- double_constant_ternary
example (a : (ℤ_[3])ˣ) (ha : (a : ℤ_[3])=4) :
    2*eisensteinAwayMoment 3 a ha 1 (eisensteinAwayConstant 3 a)=1/6 := sorry
-- double_constant_zero_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) :
    2*eisensteinAwayMoment p a ha 0 (eisensteinAwayConstant p a)=0 := sorry
-- identity_clearing_candidate_moments
example (μ : M) (hμ : i μ=i (dirac Z (1 : U)-1)*localizedEisensteinConstant p) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=0 := sorry
-- arbitrary_clearing_candidate_moments
example (g : U) (μ : M) (hμ : i μ=i (dirac Z g-1)*localizedEisensteinConstant p)
    (a : U) (ha : (a : Z)=(p+1 : ℕ)) (e : ℕ) :
    (μ (j^e) : ℚ_[p])=((g : ℚ_[p])^e-1)*
      eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry
-- sign_candidate_second_shift
example (μ : M) (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p) :
    (μ j : ℚ_[p])= -positivePseudoMoment p 2 (by omega) (kubotaLeopoldtPseudomeasure p) := sorry
-- sign_candidate_even_test_zero
example (μ : M) (hμ : i μ=i (dirac Z (-1 : U)-1)*localizedEisensteinConstant p)
    (e : ℕ) (he : Even e) : (μ (j^e) : ℚ_[p])=0 := sorry
-- sign_clearing_dyadic_not_integral
example : algebraMap D((ℤ_[2])ˣ,ℤ_[2]) (FractionRing D((ℤ_[2])ˣ,ℤ_[2]))
    (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)-1)*localizedEisensteinConstant 2 ∉
      Set.range (algebraMap D((ℤ_[2])ˣ,ℤ_[2]) (FractionRing D((ℤ_[2])ˣ,ℤ_[2]))) := sorry
-- sign_clearing_ternary_not_integral
example : algebraMap D((ℤ_[3])ˣ,ℤ_[3]) (FractionRing D((ℤ_[3])ˣ,ℤ_[3]))
    (dirac ℤ_[3] (-1 : (ℤ_[3])ˣ)-1)*localizedEisensteinConstant 3 ∉
      Set.range (algebraMap D((ℤ_[3])ˣ,ℤ_[3]) (FractionRing D((ℤ_[3])ˣ,ℤ_[3]))) := sorry
-- dyadic_not_ordinary_pseudomeasure
example : localizedEisensteinConstant 2 ∉
    Iwasawa.pseudomeasures (diracHom (G := (ℤ_[2])ˣ) (R := ℤ_[2]))
      (FractionRing D((ℤ_[2])ˣ,ℤ_[2])) := sorry
-- ternary_not_ordinary_pseudomeasure
example : localizedEisensteinConstant 3 ∉
    Iwasawa.pseudomeasures (diracHom (G := (ℤ_[3])ˣ) (R := ℤ_[3]))
      (FractionRing D((ℤ_[3])ˣ,ℤ_[3])) := sorry
-- constant_not_any_integral_image
example (μ : M) : i μ≠localizedEisensteinConstant p := sorry
-- field_measure_fails_some_exponent
example (a : U) (ha : (a : Z)=(p+1 : ℕ)) (μ : D(U,ℚ_[p])) :
    ∃ e : ℕ, μ (t^e)≠eisensteinAwayMoment p a ha e (eisensteinAwayConstant p a) := sorry
-- dyadic_identity_atom_fails
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    dirac ℚ_[2] (1 : (ℤ_[2])ˣ)
      (⟨fun u : (ℤ_[2])ˣ => (u : ℚ_[2]),by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))≠
        eisensteinAwayMoment 2 a ha 1 (eisensteinAwayConstant 2 a) := sorry
end SuggestedEisensteinObstructionTests

/-! ## The inverse-coordinate character and the localization boundary

This nontrivial integral character annihilates every shifted smoothing
denominator. Its integral-measure evaluation has no ring-map extension to
these Away localizations or the total quotient. This is not a pole theorem.
-/
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
local notation "S" => (fun u : U => Localization.Away (2*eisensteinTwistedDenominator p u))

def eisensteinInverseCharacter : ContinuousMonoidHom U Z := sorry
lemma eisensteinInverseCharacter_def :
    eisensteinInverseCharacter p =
      (primePowerArithmeticCharacter p 0 (1 : DirichletCharacter Z (p^0)) 1).comp
        (ContinuousMonoidHom.inv U) := sorry
lemma eisensteinInverseCharacter_apply (u : U) :
    eisensteinInverseCharacter p u=(↑(u⁻¹) : Z) := sorry
lemma eisensteinInverseCharacter_mul (u : U) :
    (u : Z)*eisensteinInverseCharacter p u=1 := sorry
lemma eisensteinInverseCharacter_ne_one : eisensteinInverseCharacter p≠1 := sorry
def eisensteinInverseMomentHom : M →+* ℚ_[p] := sorry
lemma eisensteinInverseMomentHom_def :
    eisensteinInverseMomentHom p=(algebraMap Z ℚ_[p]).comp
      (characterIntegralAlgHom (eisensteinInverseCharacter p)).toRingHom := sorry
lemma eisensteinInverseMomentHom_apply (μ : M) :
    eisensteinInverseMomentHom p μ=(μ (eisensteinInverseCharacter p).toContinuousMap : ℚ_[p]) := sorry
lemma eisensteinInverseMomentHom_dirac (u : U) :
    eisensteinInverseMomentHom p (dirac Z u)=((↑(u⁻¹) : Z) : ℚ_[p]) := sorry
lemma eisensteinInverseMomentHom_denominator (u : U) :
    eisensteinInverseMomentHom p (2*eisensteinTwistedDenominator p u)=0 := sorry
theorem eisensteinInverseMomentHom_no_away_extension (u : U) :
    ¬∃ F : S u →+* ℚ_[p], ∀ μ : M,
      F (algebraMap M (S u) μ)=eisensteinInverseMomentHom p μ := sorry
theorem eisensteinInverseMomentHom_no_fraction_extension :
    ¬∃ F : Q →+* ℚ_[p], ∀ μ : M,
      F (algebraMap M Q μ)=eisensteinInverseMomentHom p μ := sorry
end DirichletPadic

namespace SuggestedInverseCharacterTests
open scoped AbstractMeasure
open AbstractMeasure DirichletPadic
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "S" => (fun u : U => Localization.Away (2*eisensteinTwistedDenominator p u))
-- inverse_character_identity
example : eisensteinInverseCharacter p 1=1 := sorry
-- inverse_character_negative_identity
example : eisensteinInverseCharacter p (-1)= -1 := sorry
-- inverse_character_nontrivial
example : eisensteinInverseCharacter p≠1 := sorry
-- inverse_character_ternary_two
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    2*eisensteinInverseCharacter 3 u=1 := sorry
-- inverse_moment_unit
example : eisensteinInverseMomentHom p 1=1 := sorry
-- inverse_moment_sign_atom
example : eisensteinInverseMomentHom p (dirac Z (-1 : U))= -1 := sorry
-- inverse_moment_ordinary_factor
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=4) :
    eisensteinInverseMomentHom 3 (dirac ℤ_[3] u-1)= -3/4 := sorry
-- inverse_moment_all_integral_measures
example (μ : M) : eisensteinInverseMomentHom p μ=
    (μ (eisensteinInverseCharacter p).toContinuousMap : ℚ_[p]) := sorry
-- inverse_shifted_identity_zero
example : eisensteinInverseMomentHom p (2*eisensteinTwistedDenominator p 1)=0 := sorry
-- inverse_shifted_dyadic_canonical_zero
example (a : (ℤ_[2])ˣ) (ha : (a : ℤ_[2])=3) :
    eisensteinInverseMomentHom 2 (2*eisensteinTwistedDenominator 2 a)=0 := sorry
-- inverse_no_parameter_away_extension
example (u : U) : ¬∃ F : S u →+* ℚ_[p], ∀ μ : M,
    F (algebraMap M (S u) μ)=eisensteinInverseMomentHom p μ := sorry
-- inverse_no_dyadic_total_extension
example : ¬∃ F : FractionRing D((ℤ_[2])ˣ,ℤ_[2]) →+* ℚ_[2],
    ∀ μ : D((ℤ_[2])ˣ,ℤ_[2]), F (algebraMap _ _ μ)=eisensteinInverseMomentHom 2 μ := sorry
-- inverse_no_ternary_total_extension
example : ¬∃ F : FractionRing D((ℤ_[3])ˣ,ℤ_[3]) →+* ℚ_[3],
    ∀ μ : D((ℤ_[3])ˣ,ℤ_[3]), F (algebraMap _ _ μ)=eisensteinInverseMomentHom 3 μ := sorry
end SuggestedInverseCharacterTests

/-! ## Normalized formal logarithmic primitives

Only formal power series are constructed here. Zero constant fixes the formal
primitive; the source logarithm's constant, convergence and distribution
comparison require separate results, with the confirmed conductor restrictions.
-/
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def tameNormalizedLogPrimitive (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) : PowerSeries K := sorry
lemma tameNormalizedLogPrimitive_def (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) :
    tameNormalizedLogPrimitive η ε hε =
      -C ((gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹)*
        ∑ a : ZMod D, C (η⁻¹ a)*rescale (ε^a.val/(ε^a.val-1)) (log K) := sorry
lemma tameNormalizedLogPrimitive_constantCoeff (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) : constantCoeff (tameNormalizedLogPrimitive η ε hε)=0 := sorry
lemma tameNormalizedLogPrimitive_coeff (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (n : ℕ) (hn : 0<n) :
    coeff n (tameNormalizedLogPrimitive η ε hε)=
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹*
        algebraMap ℚ K ((-1 : ℚ)^(n+1)/n)*
          ∑ a : ZMod D, η⁻¹ a*(ε^a.val/(ε^a.val-1))^n := sorry
lemma tameNormalizedLogPrimitive_mahler (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1<D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) :
    mahlerDerivation K (tameNormalizedLogPrimitive η ε hε)=tameSeries η hDK := sorry
lemma tameNormalizedLogPrimitive_unique (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1<D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0)
    (F : PowerSeries K) (hF : mahlerDerivation K F=tameSeries η hDK)
    (h0 : constantCoeff F=0) : F=tameNormalizedLogPrimitive η ε hε := sorry
lemma tameNormalizedLogPrimitive_root_independent (η : DirichletCharacter K D)
    (hη : η.IsPrimitive) (hD : 1<D) (hDK : IsUnit (D : K))
    (ε ε' : K) (hε : IsPrimitiveRoot ε D) (hε' : IsPrimitiveRoot ε' D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0)
    (hG' : gaussSum η⁻¹ (AddChar.zmodChar D hε'.pow_eq_one)≠0) :
    tameNormalizedLogPrimitive η ε hε=tameNormalizedLogPrimitive η ε' hε' := sorry
theorem tameNormalizedLogPrimitive_all_primitives (η : DirichletCharacter K D)
    (hη : η.IsPrimitive) (hD : 1<D) (hDK : IsUnit (D : K))
    (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) (F : PowerSeries K) :
    mahlerDerivation K F=tameSeries η hDK ↔
      F=C (constantCoeff F)+tameNormalizedLogPrimitive η ε hε := sorry
end DirichletPadic

namespace SuggestedLogarithmicPrimitiveTests
open scoped BigOperators
open PowerSeries DirichletPadic
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- normalized_constant_zero
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    constantCoeff (tameNormalizedLogPrimitive η ε hε)=0 := sorry
-- normalized_modulus_one
example (hε : IsPrimitiveRoot (1 : K) 1) :
    tameNormalizedLogPrimitive (1 : DirichletCharacter K 1) 1 hε=0 := sorry
-- shifted_constant_not_normalized
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    constantCoeff (C 7+tameNormalizedLogPrimitive η ε hε)=7 := sorry
-- full_mahler_primitive
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hD : 1<D)
    (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) :
    mahlerDerivation K (tameNormalizedLogPrimitive η ε hε)=tameSeries η hDK := sorry
-- zero_constant_unique
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hD : 1<D)
    (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0)
    (F : PowerSeries K) (hF : mahlerDerivation K F=tameSeries η hDK)
    (h0 : constantCoeff F=0) : F=tameNormalizedLogPrimitive η ε hε := sorry
-- primitive_root_choice_independent
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hD : 1<D)
    (hDK : IsUnit (D : K)) (ε ε' : K) (hε : IsPrimitiveRoot ε D) (hε' : IsPrimitiveRoot ε' D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0)
    (hG' : gaussSum η⁻¹ (AddChar.zmodChar D hε'.pow_eq_one)≠0) :
    tameNormalizedLogPrimitive η ε hε=tameNormalizedLogPrimitive η ε' hε' := sorry
-- arbitrary_constant_remains
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hD : 1<D)
    (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) (c : K) :
    mahlerDerivation K (C c+tameNormalizedLogPrimitive η ε hε)=tameSeries η hDK := sorry
section Three
variable (η : DirichletCharacter K 3) (hη : η.IsPrimitive) (h2 : η 2= -1)
    (hDK : IsUnit (3 : K)) (ε : K) (hε : IsPrimitiveRoot ε 3)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar 3 hε.pow_eq_one)≠0)
include hη h2 hDK hG
-- cubic_character_first_coefficient
example : coeff 1 (tameNormalizedLogPrimitive η ε hε)=1/3 := sorry
-- cubic_character_second_coefficient
example : coeff 2 (tameNormalizedLogPrimitive η ε hε)= -1/6 := sorry
-- cubic_character_third_coefficient
example : coeff 3 (tameNormalizedLogPrimitive η ε hε)=2/27 := sorry
-- ordinary_derivative_is_different
example : coeff 1 (derivative K (tameNormalizedLogPrimitive η ε hε))= -1/3 ∧
    coeff 1 (tameSeries η hDK)=0 := sorry
end Three
end SuggestedLogarithmicPrimitiveTests

/-! Finite cyclotomic logarithm constants. ColemanIntegration L0 supplies the logarithm
and the explicit laws below. Its current suggested module imports this file, so these
consumer signatures retain those parameters; no reverse import or replacement logarithm
is introduced. Formal primitives here do not assert open-disc convergence or L-values. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries

section LogConstant
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicLogConstant (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : K := sorry
lemma cyclotomicLogConstant_def (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogConstant η ε hε ℓ =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        ∑ a : ZMod D, η⁻¹ a * ℓ (ε^a.val-1) := sorry
lemma cyclotomicLogConstant_zero (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) : cyclotomicLogConstant η ε hε (fun _ => 0)=0 := sorry
lemma cyclotomicLogConstant_congr (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ ℓ' : K → K)
    (h : ∀ a : ZMod D, η⁻¹ a≠0 → ℓ (ε^a.val-1)=ℓ' (ε^a.val-1)) :
    cyclotomicLogConstant η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ' := sorry
lemma cyclotomicLogConstant_branch_difference (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ₀ ℓ₁ v : K → K) (b : K)
    (h : ∀ a : ZMod D, η⁻¹ a≠0 → ℓ₁ (ε^a.val-1)-ℓ₀ (ε^a.val-1)=b*v (ε^a.val-1)) :
    cyclotomicLogConstant η ε hε ℓ₁-cyclotomicLogConstant η ε hε ℓ₀ =
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹*b*
        ∑ a : ZMod D, η⁻¹ a*v (ε^a.val-1) := sorry
lemma cyclotomicLogConstant_root_transport (η : DirichletCharacter K D)
    (ε ε' : K) (hε : IsPrimitiveRoot ε D) (hε' : IsPrimitiveRoot ε' D)
    (u : (ZMod D)ˣ) (hu : ε'=ε^((u : ZMod D).val)) (ℓ : K → K) :
    cyclotomicLogConstant η ε' hε' ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicLogConstant_odd (η : DirichletCharacter K D) (hD : 1<D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogConstant η ε hε ℓ=0 := sorry

def tameLogPrimitive (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : PowerSeries K := sorry
lemma tameLogPrimitive_def (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    tameLogPrimitive η ε hε ℓ=C (cyclotomicLogConstant η ε hε ℓ)+
      tameNormalizedLogPrimitive η ε hε := sorry
lemma tameLogPrimitive_constantCoeff (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    constantCoeff (tameLogPrimitive η ε hε ℓ)=cyclotomicLogConstant η ε hε ℓ := sorry
lemma tameLogPrimitive_coeff (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (n : ℕ) (hn : 0<n) :
    coeff n (tameLogPrimitive η ε hε ℓ)=coeff n (tameNormalizedLogPrimitive η ε hε) := sorry
lemma tameLogPrimitive_mahler (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1<D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) (ℓ : K → K) :
    mahlerDerivation K (tameLogPrimitive η ε hε ℓ)=tameSeries η hDK := sorry
lemma tameLogPrimitive_unique (η : DirichletCharacter K D) (hη : η.IsPrimitive)
    (hD : 1<D) (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) (ℓ : K → K)
    (F : PowerSeries K) (hF : mahlerDerivation K F=tameSeries η hDK)
    (h0 : constantCoeff F=cyclotomicLogConstant η ε hε ℓ) :
    F=tameLogPrimitive η ε hε ℓ := sorry
end LogConstant

section NormedLogConstant
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    {D : ℕ} [NeZero D]
lemma cyclotomicLogConstant_branch_independent (η : DirichletCharacter K D)
    (hη : η≠1) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ₀ ℓ₁ v : K → K) (b : K)
    (hv : ∀ x y, x≠0 → y≠0 → ‖x‖=‖y‖ → v x=v y)
    (h : ∀ x, x≠0 → ℓ₁ x-ℓ₀ x=b*v x) :
    cyclotomicLogConstant η ε hε ℓ₁=cyclotomicLogConstant η ε hε ℓ₀ := sorry
end NormedLogConstant
end DirichletPadic

namespace SuggestedLogarithmicConstantTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- zero_log_constant
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogConstant η ε hε (fun _ => 0)=0 := sorry
-- conductor_one_junk_boundary
example (hε : IsPrimitiveRoot (1 : K) 1) :
    cyclotomicLogConstant (1 : DirichletCharacter K 1) 1 hε (fun _ => 7)=-7 := sorry
-- nontrivial_constant_function_cancels
example (η : DirichletCharacter K D) (hη : η≠1) (ε : K)
    (hε : IsPrimitiveRoot ε D) (c : K) :
    cyclotomicLogConstant η ε hε (fun _ => c)=0 := sorry
-- equal_log_data
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ ℓ' : K → K) (h : ∀ a : ZMod D, η⁻¹ a≠0 → ℓ (ε^a.val-1)=ℓ' (ε^a.val-1)) :
    cyclotomicLogConstant η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ' := sorry
-- exact_branch_error
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ v : K → K) (b : K) :
    cyclotomicLogConstant η ε hε (fun x => ℓ x+b*v x)-cyclotomicLogConstant η ε hε ℓ=
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹*b*
        ∑ a : ZMod D, η⁻¹ a*v (ε^a.val-1) := sorry
-- matching_root_normalization
example (η : DirichletCharacter K D) (ε ε' : K) (hε : IsPrimitiveRoot ε D)
    (hε' : IsPrimitiveRoot ε' D) (u : (ZMod D)ˣ) (hu : ε'=ε^((u : ZMod D).val))
    (ℓ : K → K) :
    cyclotomicLogConstant η ε' hε' ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
-- odd_log_constant_zero
example (η : DirichletCharacter K 3) (ε : K) (hε : IsPrimitiveRoot ε 3)
    (hodd : η (-1)=-1) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogConstant η ε hε ℓ=0 := sorry
-- zero_log_gives_normalized_primitive
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    tameLogPrimitive η ε hε (fun _ => 0)=tameNormalizedLogPrimitive η ε hε := sorry
-- correct_logarithmic_constant
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    constantCoeff (tameLogPrimitive η ε hε ℓ)=cyclotomicLogConstant η ε hε ℓ := sorry
-- nonzero_log_constant_changes_primitive
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (h : cyclotomicLogConstant η ε hε ℓ≠0) :
    tameLogPrimitive η ε hε ℓ≠tameNormalizedLogPrimitive η ε hε := sorry
-- logarithmic_primitive_derivative
example (η : DirichletCharacter K D) (hη : η.IsPrimitive) (hD : 1<D)
    (hDK : IsUnit (D : K)) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hG : gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one)≠0) (ℓ : K → K) :
    mahlerDerivation K (tameLogPrimitive η ε hε ℓ)=tameSeries η hDK := sorry
end Field
-- every_branch_has_same_constant
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hη : η≠1) (hD : 1<D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ₀ ℓ₁ v : K → K) (b : K)
    (hv : ∀ x y, x≠0 → y≠0 → ‖x‖=‖y‖ → v x=v y)
    (h : ∀ x, x≠0 → ℓ₁ x-ℓ₀ x=b*v x) :
    cyclotomicLogConstant η ε hε ℓ₁=cyclotomicLogConstant η ε hε ℓ₀ := sorry
end SuggestedLogarithmicConstantTests
end

/-! Finite Euler removal for the supplied cyclotomic logarithm. The equality `hpow`
is exactly ColemanIntegration L3's p-power character-sum identity at f(z)=ℓ(z-1).
It remains an explicit imported law because the Coleman suggested file imports this
consumer. These finite expressions are not asserted to be analytic traces or L-values. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicFrobeniusLogConstant (p : ℕ) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : K := sorry
lemma cyclotomicFrobeniusLogConstant_def (p : ℕ) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        ∑ a : ZMod D, η⁻¹ a*ℓ (ε^(p*a.val)-1) := sorry
lemma cyclotomicFrobeniusLogConstant_one (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicFrobeniusLogConstant 1 η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicFrobeniusLogConstant_zero_log (p : ℕ) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicFrobeniusLogConstant p η ε hε (fun _ => 0)=0 := sorry
lemma cyclotomicFrobeniusLogConstant_factor (p : ℕ) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=
      η (p : ZMod D)*cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicFrobeniusLogConstant_ramified (p : ℕ) (hp : p.Prime)
    (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpD : p∣D)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=0 := sorry

def cyclotomicEulerLogValue (p : ℕ) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : K := sorry
lemma cyclotomicEulerLogValue_def (p : ℕ) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicEulerLogValue p η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ-
      (p : K)⁻¹*cyclotomicFrobeniusLogConstant p η ε hε ℓ := sorry
lemma cyclotomicEulerLogValue_zero_log (p : ℕ) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicEulerLogValue p η ε hε (fun _ => 0)=0 := sorry
lemma cyclotomicEulerLogValue_factor (p : ℕ) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicEulerLogValue p η ε hε ℓ=
      (1-η (p : ZMod D)/(p : K))*cyclotomicLogConstant η ε hε ℓ := sorry
lemma reciprocalEulerFactor_ne_zero (η : DirichletCharacter K D) (q : ℕ) (hq : 1<q) :
    1-η (q : ZMod D)/(q : K)≠0 := sorry
lemma cyclotomicEulerLogValue_eq_zero_iff (p : ℕ) (hp : 1<p)
    (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicEulerLogValue p η ε hε ℓ=0 ↔ cyclotomicLogConstant η ε hε ℓ=0 := sorry
end DirichletPadic

namespace SuggestedLogarithmicEulerTests
open scoped BigOperators
open DirichletPadic
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- power_one_recovers_constant
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicFrobeniusLogConstant 1 η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
-- powered_zero_log
example (p : ℕ) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicFrobeniusLogConstant p η ε hε (fun _ => 0)=0 := sorry
-- imprimitive_power_failure
example (ε : K) (hε : IsPrimitiveRoot ε 3) :
    cyclotomicFrobeniusLogConstant 3 (1 : DirichletCharacter K 3) ε hε (fun _ => 1)=2 := sorry
-- supplied_power_eigenvalue
example (p : ℕ) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=
      η (p : ZMod D)*cyclotomicLogConstant η ε hε ℓ := sorry
-- ramified_power_zero
example (p : ℕ) (hp : p.Prime) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (hpD : p∣D)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=0 := sorry
-- euler_zero_log
example (p : ℕ) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicEulerLogValue p η ε hε (fun _ => 0)=0 := sorry
-- euler_at_one_is_zero
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicEulerLogValue 1 η ε hε ℓ=0 := sorry
-- euler_at_zero_boundary
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicEulerLogValue 0 η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
-- euler_factor_has_reciprocal_weight
example (p : ℕ) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hpow : (∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(p*(a : ZMod D).val)-1))=
      η (p : ZMod D)*(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D)*ℓ (ε^(a : ZMod D).val-1))) :
    cyclotomicEulerLogValue p η ε hε ℓ=
      (1-η (p : ZMod D)/(p : K))*cyclotomicLogConstant η ε hε ℓ := sorry
-- reciprocal_factor_nonzero
example (η : DirichletCharacter K D) : 1-η (2 : ZMod D)/(2 : K)≠0 := sorry
-- integer_one_factor_zero
example (η : DirichletCharacter K D) : 1-η (1 : ZMod D)/(1 : K)=0 := sorry
end SuggestedLogarithmicEulerTests
end

/-! Concrete tame logarithmic convergence. The integer-growth law is supplied by
ColemanIntegration L0; no reverse import of its suggested module is made. Native
restricted power series are used directly. Summability alone does not identify
the sum with a logarithm expression, a distribution, or an L-value. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

lemma tameCyclotomicLogArgument_norm (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (u : (ZMod D)ˣ) :
    ‖ε^(u : ZMod D).val-1‖=1 ∧
      ‖ε^(u : ZMod D).val/(ε^(u : ZMod D).val-1)‖=1 := sorry

lemma tameNormalizedLogPrimitive_coeff_norm_le (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (n : ℕ) (hn : 0<n) :
    ‖coeff n (tameNormalizedLogPrimitive η ε hε)‖ ≤
      ‖(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹‖*‖(n : K)‖⁻¹ := sorry

lemma tameNormalizedLogPrimitive_coeff_polynomial_bound (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b)
    (n : ℕ) (hn : 0<n) :
    ‖coeff n (tameNormalizedLogPrimitive η ε hε)‖ ≤
      ‖(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹‖*(n : ℝ)^b := sorry

theorem tameNormalizedLogPrimitive_isRestricted (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b)
    (r : ℝ) (hr : 0≤r) (hr1 : r<1) :
    IsRestricted r (tameNormalizedLogPrimitive η ε hε) := sorry

theorem tameLogPrimitive_isRestricted (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b)
    (ℓ : K → K) (r : ℝ) (hr : 0≤r) (hr1 : r<1) :
    IsRestricted r (tameLogPrimitive η ε hε ℓ) := sorry

theorem tameLogPrimitive_summable [CompleteSpace K] (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b)
    (ℓ : K → K) (t : K) (ht : ‖t‖<1) :
    Summable (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*t^n) := sorry
end DirichletPadic

namespace SuggestedLogarithmicConvergenceTests
open scoped BigOperators
open DirichletPadic PowerSeries
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]
-- unit_residue_argument_norm
example (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) :
    ‖ε-1‖=1 := sorry
-- rescaling_preserves_open_disc
example (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (u : (ZMod D)ˣ) (t : K) (ht : ‖t‖<1) :
    ‖(ε^(u : ZMod D).val/(ε^(u : ZMod D).val-1))*t‖<1 := sorry
-- first_coefficient_bound
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) :
    ‖coeff 1 (tameNormalizedLogPrimitive η ε hε)‖≤
      ‖(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹‖ := sorry
-- normalized_padic_linear_growth
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ))
    (n : ℕ) (hn : 0<n) :
    ‖coeff n (tameNormalizedLogPrimitive η ε hε)‖≤
      ‖(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹‖*(n : ℝ) := sorry
-- half_radius_restricted
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b) :
    IsRestricted (1/2) (tameNormalizedLogPrimitive η ε hε) := sorry
-- arbitrary_constant_preserves_restrictedness
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (b : ℕ) (hbound : ∀ n : ℕ, 0<n → ‖(n : K)‖⁻¹≤(n : ℝ)^b)
    (c : K) (r : ℝ) (hr : 0≤r) (hr1 : r<1) :
    IsRestricted r (C c+tameNormalizedLogPrimitive η ε hε) := sorry
-- zero_point_sum
example [CompleteSpace K] (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    (∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*(0 : K)^n)=
      cyclotomicLogConstant η ε hε ℓ := sorry
end SuggestedLogarithmicConvergenceTests
end

/-! Evaluating the concrete tame logarithmic primitive. The supplied `hlocal`
is Coleman's owned local logarithm expansion, written in native formal-log
coefficients via the existing Tau Ceti series equation. It is an explicit law
because the Coleman suggested module imports this consumer. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicLogValue (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) : K := sorry
lemma cyclotomicLogValue_def (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogValue η ε hε ℓ t=
      -(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹ *
        ∑ a : ZMod D, η⁻¹ a*ℓ (ε^a.val*(1+t)-1) := sorry
lemma cyclotomicLogValue_eq_logConstant (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogValue η ε hε ℓ t=
      cyclotomicLogConstant η ε hε (fun x => ℓ ((x+1)*(1+t)-1)) := sorry
lemma cyclotomicLogValue_zero (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogValue η ε hε ℓ 0=cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicLogValue_zero_log (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogValue η ε hε (fun _ => 0) t=0 := sorry
lemma cyclotomicLogValue_congr (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ ℓ' : K → K) (t : K)
    (h : ∀ a : ZMod D, η⁻¹ a≠0 → ℓ (ε^a.val*(1+t)-1)=ℓ' (ε^a.val*(1+t)-1)) :
    cyclotomicLogValue η ε hε ℓ t=cyclotomicLogValue η ε hε ℓ' t := sorry
lemma cyclotomicLogValue_root_transport (η : DirichletCharacter K D) (ε ε' : K)
    (hε : IsPrimitiveRoot ε D) (hε' : IsPrimitiveRoot ε' D)
    (u : (ZMod D)ˣ) (hu : ε'=ε^(u : ZMod D).val) (ℓ : K → K) (t : K) :
    cyclotomicLogValue η ε' hε' ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
end Field

section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

lemma tameCyclotomicLogValue_argument_norm (hD : 1<D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) (u : (ZMod D)ˣ)
    (t : K) (ht : ‖t‖<1) : ‖ε^(u : ZMod D).val*(1+t)-1‖=1 := sorry

theorem tameLogPrimitive_hasSum (η : DirichletCharacter K D) (hD : 1<D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*t^n)
      (cyclotomicLogValue η ε hε ℓ t) := sorry

lemma cyclotomicLogValue_eq_tsum (η : DirichletCharacter K D) (hD : 1<D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    cyclotomicLogValue η ε hε ℓ t=
      ∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*t^n := sorry

lemma cyclotomicLogValue_branch_independent (η : DirichletCharacter K D) (hD : 1<D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) (ℓ₀ ℓ₁ : K → K)
    (hbranch : ∀ x : K, ‖x‖=1 → ℓ₀ x=ℓ₁ x) (t : K) (ht : ‖t‖<1) :
    cyclotomicLogValue η ε hε ℓ₀ t=cyclotomicLogValue η ε hε ℓ₁ t := sorry
end Normed
end DirichletPadic

namespace SuggestedLogarithmicEvaluationTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- zero_point_is_actual_constant
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogValue η ε hε ℓ 0=cyclotomicLogConstant η ε hε ℓ := sorry
-- zero_function_value
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogValue η ε hε (fun _ => 0) t=0 := sorry
-- conductor_one_boundary
example (hε : IsPrimitiveRoot (1 : K) 1) (ℓ : K → K) (t : K) :
    cyclotomicLogValue (1 : DirichletCharacter K 1) 1 hε ℓ t= -ℓ t := sorry
-- matched_root_gives_same_value
example (η : DirichletCharacter K D) (ε ε' : K) (hε : IsPrimitiveRoot ε D)
    (hε' : IsPrimitiveRoot ε' D) (u : (ZMod D)ˣ) (hu : ε'=ε^(u : ZMod D).val)
    (ℓ : K → K) (t : K) :
    cyclotomicLogValue η ε' hε' ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
end Field
section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]
-- shifted_argument_ne_zero
example (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (u : (ZMod D)ˣ) (t : K) (ht : ‖t‖<1) : ε^(u : ZMod D).val*(1+t)-1≠0 := sorry
-- supplied_local_series_value
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    (∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*t^n)=
      cyclotomicLogValue η ε hε ℓ t := sorry
-- unit_agreement_preserves_values
example (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ₀ ℓ₁ : K → K) (h : ∀ x : K, ‖x‖=1 → ℓ₀ x=ℓ₁ x)
    (t : K) (ht : ‖t‖<1) :
    cyclotomicLogValue η ε hε ℓ₀ t=cyclotomicLogValue η ε hε ℓ₁ t := sorry
end Normed
end SuggestedLogarithmicEvaluationTests
end

/-! Root-of-unity averages of the concrete logarithm value. These finite
expressions are candidates for the distribution restriction formulas; no LAD
operator or analytic L-value is defined here. The exact local logarithm law
remains supplied by Coleman. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicLogAverage (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : K := sorry
lemma cyclotomicLogAverage_def (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverage p ξ η ε hε ℓ=
      (p : K)⁻¹*∑ j ∈ Finset.range p, cyclotomicLogValue η ε hε ℓ (ξ^j-1) := sorry
lemma cyclotomicLogAverage_zero (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : cyclotomicLogAverage 0 ξ η ε hε ℓ=0 := sorry
lemma cyclotomicLogAverage_one (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverage 1 ξ η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicLogAverage_zero_log (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) : cyclotomicLogAverage p ξ η ε hε (fun _ => 0)=0 := sorry

def cyclotomicLogAverageComplement (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) : K := sorry
lemma cyclotomicLogAverageComplement_def (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ=
      cyclotomicLogConstant η ε hε ℓ-cyclotomicLogAverage p ξ η ε hε ℓ := sorry
lemma cyclotomicLogAverageComplement_zero (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverageComplement 0 ξ η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
lemma cyclotomicLogAverageComplement_one (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverageComplement 1 ξ η ε hε ℓ=0 := sorry
lemma cyclotomicLogAverageComplement_zero_log (p : ℕ) (ξ : K)
    (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogAverageComplement p ξ η ε hε (fun _ => 0)=0 := sorry
end Field

section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

lemma cyclotomicLogAverage_root_in_disc (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (j : ℕ) : ‖ξ^j-1‖<1 := sorry

theorem cyclotomicLogAverage_hasSum (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j-1)^n))
      (cyclotomicLogAverage p ξ η ε hε ℓ) := sorry

lemma cyclotomicLogAverage_eq_series_average (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    cyclotomicLogAverage p ξ η ε hε ℓ=
      (p : K)⁻¹*∑ j ∈ Finset.range p,
        ∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*(ξ^j-1)^n := sorry

theorem cyclotomicLogAverageComplement_eq_normalized (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ=
      -(p : K)⁻¹*∑ j ∈ Finset.range p,
        ∑' n : ℕ, coeff n (tameNormalizedLogPrimitive η ε hε)*(ξ^j-1)^n := sorry

theorem cyclotomicLogAverageComplement_local_law_independent (p : ℕ) (hp : p.Prime)
    (ξ : K) (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ₀ ℓ₁ : K → K)
    (h₀ : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ₀ (x*(1+u))-ℓ₀ x))
    (h₁ : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ₁ (x*(1+u))-ℓ₁ x)) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ₀=
      cyclotomicLogAverageComplement p ξ η ε hε ℓ₁ := sorry
end Normed
end DirichletPadic

namespace SuggestedLogarithmicAverageTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- empty_average
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverage 0 ξ η ε hε ℓ=0 := sorry
-- singleton_average
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverage 1 ξ η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
-- zero_function_average
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogAverage p ξ η ε hε (fun _ => 0)=0 := sorry
-- empty_complement_boundary
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverageComplement 0 ξ η ε hε ℓ=cyclotomicLogConstant η ε hε ℓ := sorry
-- singleton_complement_zero
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogAverageComplement 1 ξ η ε hε ℓ=0 := sorry
-- zero_function_complement
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogAverageComplement p ξ η ε hε (fun _ => 0)=0 := sorry
-- arbitrary_added_constant_cancels
example (p : ℕ) (hp : p≠0) (c : K) (v : ℕ → K) :
    (c+v 0)-(p : K)⁻¹*(∑ j ∈ Finset.range p, (c+v j))=
      v 0-(p : K)⁻¹*(∑ j ∈ Finset.range p, v j) := sorry
end Field
-- dyadic_root_shift
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    (h2 : ‖(2 : K)‖<1) (j : ℕ) : ‖(-1 : K)^j-1‖<1 := sorry
-- average_of_point_sums
example {K : Type*} [NormedField K] (p : ℕ) (c : ℕ → K) (t v : ℕ → K)
    (h : ∀ j ∈ Finset.range p, HasSum (fun n : ℕ => c n*t j^n) (v j)) :
    HasSum (fun n : ℕ => c n*((p : K)⁻¹*∑ j ∈ Finset.range p, t j^n))
      ((p : K)⁻¹*∑ j ∈ Finset.range p, v j) := sorry
-- adding_to_a_local_log_preserves_its_law
example {K : Type*} [NormedField K] [CharZero K] (ℓ : K → K) (b : K)
    (h : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) ((ℓ (x*(1+u))+b)-(ℓ x+b)) := sorry
end SuggestedLogarithmicAverageTests
end

/-! Parity of the concrete root-point values. The finite symmetry permits a
zero shifted argument: it is paired with zero directly. Only the final series
corollary uses the tame norm and local expansion hypotheses. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

theorem cyclotomicLogValue_root_reciprocity (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (ρ : K) (n : ℕ) (hn : 0<n) (hρ : ρ^n=1) :
    cyclotomicLogValue η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogValue η ε hε ℓ (ρ-1) := sorry

theorem cyclotomicLogAverage_odd (p : ℕ) (hp : 0<p) (ξ : K) (hξ : ξ^p=1)
    (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogAverage p ξ η ε hε ℓ=0 := sorry

lemma cyclotomicLogValue_odd_dyadic (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogValue η ε hε ℓ (-2)=0 := sorry

theorem cyclotomicLogAverageComplement_odd (p : ℕ) (hp : 0<p) (ξ : K) (hξ : ξ^p=1)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ=0 := sorry
end Field

theorem cyclotomicLogAverage_odd_hasSum {K : Type*} [NormedField K]
    [IsUltrametricDist K] [CharZero K] {D : ℕ} [NeZero D]
    (p : ℕ) (hp : p.Prime) (ξ : K) (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ : K → K) (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j-1)^n)) 0 := sorry
end DirichletPadic

namespace SuggestedLogarithmicParityTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
variable (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
variable (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
variable (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
include hmul hroot
-- cubic_inverse_pair
example (ρ : K) (hρ : ρ^3=1) :
    cyclotomicLogValue η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogValue η ε hε ℓ (ρ-1) := sorry
-- odd_dyadic_average
example (hodd : η (-1)=-1) : cyclotomicLogAverage 2 (-1) η ε hε ℓ=0 := sorry
-- odd_dyadic_fixed_point
example (hodd : η (-1)=-1) : cyclotomicLogValue η ε hε ℓ (-2)=0 := sorry
-- odd_dyadic_complement
example (hD : 1<D) (hodd : η (-1)=-1) :
    cyclotomicLogAverageComplement 2 (-1) η ε hε ℓ=0 := sorry
end Field
-- odd_dyadic_coefficient_sum
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hD : 1<D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (h2 : ‖(2 : K)‖<1) (ℓ : K → K) (hodd : η (-1)=-1)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((2 : K)⁻¹*((0 : K)^n+(-2 : K)^n))) 0 := sorry
end SuggestedLogarithmicParityTests
end

/-! Inversion of general nonzero multiplicative coordinates. The principal
character correction is retained before using nontrivial character cancellation.
The analytic comparison concerns pointwise sums, not formal substitution. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

theorem cyclotomicLogValue_inversion_defect (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogValue η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogValue η ε hε ℓ (ρ-1)+
        η (-1)*(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹*
          ℓ ρ*(∑ a : ZMod D, η⁻¹ a) := sorry

theorem cyclotomicLogValue_inversion (η : DirichletCharacter K D) (hη : η≠1)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogValue η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogValue η ε hε ℓ (ρ-1) := sorry
end Field

section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

lemma cyclotomicLogValue_inversion_norm (t : K) (ht : ‖t‖<1) :
    ‖(1+t)⁻¹-1‖=‖t‖ := sorry

theorem tameLogPrimitive_eval_inversion (η : DirichletCharacter K D) (hη : η≠1)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    (∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*((1+t)⁻¹-1)^n)=
      η (-1)*(∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*t^n) := sorry
end Normed
end DirichletPadic

namespace SuggestedLogarithmicInversionTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K]
variable (ℓ : K → K) (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
variable (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
include hmul hroot
-- principal_conductor_two_correction
example (hε : IsPrimitiveRoot (-1 : K) 2) (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogValue (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ⁻¹-1)=
      cyclotomicLogValue (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ-1)-ℓ ρ := sorry
-- nonprincipal_point_pair
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hη : η≠1)
    (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogValue η ε hε ℓ ((2 : K)⁻¹-1)=
      η (-1)*cyclotomicLogValue η ε hε ℓ 1 := sorry
end Field
-- dyadic_open_disc_coordinate
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    (h2 : ‖(2 : K)‖<1) : ‖(3 : K)⁻¹-1‖=‖(2 : K)‖ := sorry
-- odd_dyadic_series_pair
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hodd : η (-1)=-1)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (h2 : ‖(2 : K)‖<1) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    (∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*((-2 : K)/3)^n)=
      -(∑' n : ℕ, coeff n (tameLogPrimitive η ε hε ℓ)*(2 : K)^n) := sorry
end SuggestedLogarithmicInversionTests
end

/-! The finite root trace and the reciprocal Euler value. The exact weight-one
trace law is supplied by Coleman; its general distribution theorem and all
inherited request leaves are recorded in the packet. No reverse import is made. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

lemma cyclotomicLogTrace_unit_domain (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (p : ℕ) (hpD : p.Coprime D) (u : (ZMod D)ˣ) :
    (ε^(u : ZMod D).val)^p≠1 := sorry

theorem cyclotomicFrobeniusLogConstant_coprime (p : ℕ) (hpD : p.Coprime D)
    (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicFrobeniusLogConstant p η ε hε ℓ=
      η (p : ZMod D)*cyclotomicLogConstant η ε hε ℓ := sorry

theorem cyclotomicLogAverage_eq_powered (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpD : p.Coprime D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1)) :
    cyclotomicLogAverage p ξ η ε hε ℓ=
      (p : K)⁻¹*cyclotomicFrobeniusLogConstant p η ε hε ℓ := sorry

theorem cyclotomicLogAverageComplement_eq_euler (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpD : p.Coprime D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1)) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ=
      cyclotomicEulerLogValue p η ε hε ℓ := sorry

theorem cyclotomicLogAverageComplement_euler_factor (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpD : p.Coprime D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1)) :
    cyclotomicLogAverageComplement p ξ η ε hε ℓ=
      (1-η (p : ZMod D)/(p : K))*cyclotomicLogConstant η ε hε ℓ := sorry
end Field

theorem cyclotomicLogAverage_eigenvalue_hasSum {K : Type*} [NormedField K]
    [IsUltrametricDist K] [CharZero K] {D : ℕ} [NeZero D]
    (p : ℕ) (hp : p.Prime) (ξ : K) (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1)
    (hpD : p.Coprime D) (η : DirichletCharacter K D) (hD : 1<D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1))
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j-1)^n))
      ((η (p : ZMod D)/(p : K))*cyclotomicLogConstant η ε hε ℓ) := sorry
end DirichletPadic

namespace SuggestedLogarithmicTraceTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K]
-- cubic_root_dyadic_trace_domain
example (ε : K) (hε : IsPrimitiveRoot ε 3) : ε^2≠1 := sorry
-- identity_power_for_arbitrary_function
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (f : K → K) :
    cyclotomicFrobeniusLogConstant 1 η ε hε f=cyclotomicLogConstant η ε hε f := sorry
variable {D : ℕ} [NeZero D]
variable (ξ : K) (hξ : IsPrimitiveRoot ξ 2) (hpD : Nat.Coprime 2 D)
variable (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
variable (ℓ : K → K)
variable (htrace : ∀ z : K, z^2≠1 →
  (∑ j ∈ Finset.range 2, ℓ (ξ^j*z-1))=ℓ (z^2-1))
include hξ hpD hD htrace
-- dyadic_average_retains_half
example : cyclotomicLogAverage 2 ξ η ε hε ℓ=
    (2 : K)⁻¹*cyclotomicFrobeniusLogConstant 2 η ε hε ℓ := sorry
-- dyadic_complement_is_euler_value
example : cyclotomicLogAverageComplement 2 ξ η ε hε ℓ=
    cyclotomicEulerLogValue 2 η ε hε ℓ := sorry
-- dyadic_reciprocal_euler_factor
example : cyclotomicLogAverageComplement 2 ξ η ε hε ℓ=
    (1-η (2 : ZMod D)/(2 : K))*cyclotomicLogConstant η ε hε ℓ := sorry
end Field
-- dyadic_coefficient_trace_value
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    {D : ℕ} [NeZero D] (ξ : K) (hξ : IsPrimitiveRoot ξ 2)
    (h2 : ‖(2 : K)‖<1) (hpD : Nat.Coprime 2 D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (htrace : ∀ z : K, z^2≠1 →
      (∑ j ∈ Finset.range 2, ℓ (ξ^j*z-1))=ℓ (z^2-1))
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((2 : K)⁻¹*∑ j ∈ Finset.range 2, (ξ^j-1)^n))
      ((η (2 : ZMod D)/(2 : K))*cyclotomicLogConstant η ε hε ℓ) := sorry
end SuggestedLogarithmicTraceTests
end

/-! The actual logarithmic trace at general points. This is a finite expression
and its convergent coefficient evaluation, with the owned Coleman trace law.
The LAD distribution and operator objects are not defined in this consumer. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicLogDiscTrace (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) : K := sorry
lemma cyclotomicLogDiscTrace_def (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscTrace p ξ η ε hε ℓ t=
      (p : K)⁻¹*∑ j ∈ Finset.range p, cyclotomicLogValue η ε hε ℓ (ξ^j*(1+t)-1) := sorry
lemma cyclotomicLogDiscTrace_zero (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscTrace 0 ξ η ε hε ℓ t=0 := sorry
lemma cyclotomicLogDiscTrace_one (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscTrace 1 ξ η ε hε ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
lemma cyclotomicLogDiscTrace_at_zero (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogDiscTrace p ξ η ε hε ℓ 0=cyclotomicLogAverage p ξ η ε hε ℓ := sorry
lemma cyclotomicLogDiscTrace_zero_log (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogDiscTrace p ξ η ε hε (fun _ => 0) t=0 := sorry

theorem cyclotomicLogDiscTrace_eq_frobenius (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpD : p.Coprime D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K)
    (hdom : ∀ u : (ZMod D)ˣ, (ε^(u : ZMod D).val*(1+t))^p≠1)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1)) :
    cyclotomicLogDiscTrace p ξ η ε hε ℓ t=
      (η (p : ZMod D)/(p : K))*cyclotomicLogValue η ε hε ℓ ((1+t)^p-1) := sorry
end Field

section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

lemma cyclotomicLogDiscTrace_point_in_disc (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (t : K) (ht : ‖t‖<1)
    (j : ℕ) : ‖ξ^j*(1+t)-1‖<1 := sorry

lemma cyclotomicLogFrobenius_norm (p : ℕ) (t : K) (ht : ‖t‖<1) :
    ‖(1+t)^p-1‖≤‖t‖ := sorry

lemma cyclotomicLogDiscTrace_unit_domain (p : ℕ) (hpD : p.Coprime D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (t : K) (ht : ‖t‖<1) (u : (ZMod D)ˣ) :
    (ε^(u : ZMod D).val*(1+t))^p≠1 := sorry

theorem cyclotomicLogDiscTrace_hasSum (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (hpD : p.Coprime D)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1))
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j*(1+t)-1)^n))
      ((η (p : ZMod D)/(p : K))*cyclotomicLogValue η ε hε ℓ ((1+t)^p-1)) := sorry
end Normed
end DirichletPadic

namespace SuggestedLogarithmicDiscTraceTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- empty_disc_trace
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) : cyclotomicLogDiscTrace 0 ξ η ε hε ℓ t=0 := sorry
-- singleton_disc_trace
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) :
    cyclotomicLogDiscTrace 1 ξ η ε hε ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
-- disc_trace_at_origin
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogDiscTrace p ξ η ε hε ℓ 0=cyclotomicLogAverage p ξ η ε hε ℓ := sorry
-- zero_function_disc_trace
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogDiscTrace p ξ η ε hε (fun _ => 0) t=0 := sorry
-- dyadic_trace_uses_frobenius_point
example (η : DirichletCharacter K D) (hD : 1<D) (hpD : Nat.Coprime 2 D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hξ : IsPrimitiveRoot (-1 : K) 2)
    (ℓ : K → K) (hdom : ∀ u : (ZMod D)ˣ, (ε^(u : ZMod D).val*3)^2≠1)
    (htrace : ∀ z : K, z^2≠1 →
      (∑ j ∈ Finset.range 2, ℓ ((-1 : K)^j*z-1))=ℓ (z^2-1)) :
    cyclotomicLogDiscTrace 2 (-1) η ε hε ℓ 2=
      (η (2 : ZMod D)/(2 : K))*cyclotomicLogValue η ε hε ℓ 8 := sorry
end Field
section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
-- dyadic_translated_point
example (h2 : ‖(2 : K)‖<1) : ‖(-1 : K)*(1+2)-1‖<1 := sorry
-- dyadic_frobenius_fixed_point_image
example (h2 : ‖(2 : K)‖<1) : ‖(1+(-2 : K))^2-1‖≤‖(2 : K)‖ := sorry
-- tame_dyadic_powered_argument
example {D : ℕ} [NeZero D] (hD : 1<D) (hpD : Nat.Coprime 2 D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (h2 : ‖(2 : K)‖<1) (u : (ZMod D)ˣ) : (ε^(u : ZMod D).val*3)^2≠1 := sorry
-- dyadic_series_trace_at_two
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hD : 1<D)
    (hpD : Nat.Coprime 2 D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (h2 : ‖(2 : K)‖<1) (ℓ : K → K)
    (htrace : ∀ z : K, z^2≠1 →
      (∑ j ∈ Finset.range 2, ℓ ((-1 : K)^j*z-1))=ℓ (z^2-1))
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      ((2 : K)⁻¹*((2 : K)^n+(-4 : K)^n)))
      ((η (2 : ZMod D)/(2 : K))*cyclotomicLogValue η ε hε ℓ 8) := sorry
end Normed
end SuggestedLogarithmicDiscTraceTests
end

/-! The concrete logarithmic complement on the open disc. Its finite root
average vanishes for every supplied function. Analytic comparisons retain the
precise local expansion hypotheses; no LAD operator or support theorem is
identified here. General finite averaging projections already exist in Mathlib. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

def cyclotomicLogDiscComplement (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) : K := sorry
lemma cyclotomicLogDiscComplement_def (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ t=
      cyclotomicLogValue η ε hε ℓ t-cyclotomicLogDiscTrace p ξ η ε hε ℓ t := sorry
lemma cyclotomicLogDiscComplement_zero (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscComplement 0 ξ η ε hε ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
lemma cyclotomicLogDiscComplement_one (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    cyclotomicLogDiscComplement 1 ξ η ε hε ℓ t=0 := sorry
lemma cyclotomicLogDiscComplement_at_zero (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ 0=
      cyclotomicLogAverageComplement p ξ η ε hε ℓ := sorry
lemma cyclotomicLogDiscComplement_zero_log (p : ℕ) (ξ : K) (η : DirichletCharacter K D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogDiscComplement p ξ η ε hε (fun _ => 0) t=0 := sorry

theorem cyclotomicLogDiscComplement_eq_euler (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpD : p.Coprime D) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K)
    (hdom : ∀ u : (ZMod D)ˣ, (ε^(u : ZMod D).val*(1+t))^p≠1)
    (htrace : ∀ z : K, z^p≠1 →
      (∑ j ∈ Finset.range p, ℓ (ξ^j*z-1))=ℓ (z^p-1)) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ t=
      cyclotomicLogValue η ε hε ℓ t-
        (η (p : ZMod D)/(p : K))*cyclotomicLogValue η ε hε ℓ ((1+t)^p-1) := sorry

theorem cyclotomicLogDiscComplement_root_average_zero (p : ℕ) (hp : 0<p)
    (ξ : K) (hξ : ξ^p=1) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) (t : K) :
    (p : K)⁻¹*(∑ j ∈ Finset.range p,
      cyclotomicLogDiscComplement p ξ η ε hε ℓ (ξ^j*(1+t)-1))=0 := sorry
end Field

section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]

theorem cyclotomicLogDiscComplement_eq_normalized (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ t=
      (∑' n : ℕ, coeff n (tameNormalizedLogPrimitive η ε hε)*t^n)-
        (p : K)⁻¹*∑ j ∈ Finset.range p,
          ∑' n : ℕ, coeff n (tameNormalizedLogPrimitive η ε hε)*(ξ^j*(1+t)-1)^n := sorry

theorem cyclotomicLogDiscComplement_local_law_independent (p : ℕ) (hp : p.Prime)
    (ξ : K) (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ₀ ℓ₁ : K → K)
    (h₀ : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ₀ (x*(1+u))-ℓ₀ x))
    (h₁ : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ₁ (x*(1+u))-ℓ₁ x))
    (t : K) (ht : ‖t‖<1) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ₀ t=
      cyclotomicLogDiscComplement p ξ η ε hε ℓ₁ t := sorry

theorem cyclotomicLogDiscComplement_hasSum (p : ℕ) (hp : p.Prime) (ξ : K)
    (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1) (η : DirichletCharacter K D)
    (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D) (hDK : ‖(D : K)‖=1)
    (ℓ : K → K) (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      (t^n-(p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j*(1+t)-1)^n))
      (cyclotomicLogDiscComplement p ξ η ε hε ℓ t) := sorry
end Normed
end DirichletPadic

namespace SuggestedLogarithmicDiscComplementTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]
-- empty_complement
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) :
    cyclotomicLogDiscComplement 0 ξ η ε hε ℓ t=cyclotomicLogValue η ε hε ℓ t := sorry
-- singleton_complement
example (ξ : K) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) : cyclotomicLogDiscComplement 1 ξ η ε hε ℓ t=0 := sorry
-- complement_at_origin
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ℓ : K → K) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ 0=
      cyclotomicLogAverageComplement p ξ η ε hε ℓ := sorry
-- zero_function_complement
example (p : ℕ) (ξ : K) (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (t : K) :
    cyclotomicLogDiscComplement p ξ η ε hε (fun _ => 0) t=0 := sorry
-- dyadic_complement_uses_eight
example (η : DirichletCharacter K D) (hD : 1<D) (hpD : Nat.Coprime 2 D)
    (ε : K) (hε : IsPrimitiveRoot ε D) (hξ : IsPrimitiveRoot (-1 : K) 2)
    (ℓ : K → K) (hdom : ∀ u : (ZMod D)ˣ, (ε^(u : ZMod D).val*3)^2≠1)
    (htrace : ∀ z : K, z^2≠1 →
      (∑ j ∈ Finset.range 2, ℓ ((-1 : K)^j*z-1))=ℓ (z^2-1)) :
    cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ 2=
      cyclotomicLogValue η ε hε ℓ 2-
        (η (2 : ZMod D)/(2 : K))*cyclotomicLogValue η ε hε ℓ 8 := sorry
-- dyadic_complement_pair
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) :
    cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ t+
      cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ (-2-t)=0 := sorry
-- composite_repeated_root_average
example (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (t : K) :
    (4 : K)⁻¹*(∑ j ∈ Finset.range 4,
      cyclotomicLogDiscComplement 4 (-1) η ε hε ℓ ((-1 : K)^j*(1+t)-1))=0 := sorry
end Field
section Normed
variable {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
variable {D : ℕ} [NeZero D]
variable (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
variable (hDK : ‖(D : K)‖=1) (h2 : ‖(2 : K)‖<1) (ℓ : K → K)
variable (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
  HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
include hD hDK h2 hlocal
-- dyadic_normalized_difference
example : cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ 2=
    ((∑' n : ℕ, coeff n (tameNormalizedLogPrimitive η ε hε)*(2 : K)^n)-
      (∑' n : ℕ, coeff n (tameNormalizedLogPrimitive η ε hε)*(-4 : K)^n))/2 := sorry
-- shifted_local_law_same_complement
example (b : K) : cyclotomicLogDiscComplement 2 (-1) η ε hε (fun x => ℓ x+b) 2=
    cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ 2 := sorry
-- dyadic_complement_series
example : HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      (((2 : K)^n-(-4 : K)^n)/2))
    (cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ 2) := sorry
end Normed
end SuggestedLogarithmicDiscComplementTests
end

/-! Inversion of the finite logarithmic complement. The trace carries exactly
the point value's logarithmic correction, so subtraction removes it even for
principal characters. No LAD operator or formal substitution is identified. -/
noncomputable section
namespace DirichletPadic
open scoped BigOperators
open PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K] {D : ℕ} [NeZero D]

theorem cyclotomicLogDiscTrace_inversion_defect (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : ξ^p=1) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogDiscTrace p ξ η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogDiscTrace p ξ η ε hε ℓ (ρ-1)+
        η (-1)*(gaussSum η⁻¹ (AddChar.zmodChar D hε.pow_eq_one))⁻¹*
          ℓ ρ*(∑ a : ZMod D, η⁻¹ a) := sorry

theorem cyclotomicLogDiscComplement_inversion (p : ℕ) (hp : 0<p) (ξ : K)
    (hξ : ξ^p=1) (η : DirichletCharacter K D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (ℓ : K → K) (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogDiscComplement p ξ η ε hε ℓ (ρ-1) := sorry

theorem cyclotomicLogDiscComplement_odd_fixed_points (p : ℕ) (hp : 0<p)
    (ξ : K) (hξ : ξ^p=1) (η : DirichletCharacter K D) (hodd : η (-1)=-1)
    (ε : K) (hε : IsPrimitiveRoot ε D) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0) :
    cyclotomicLogDiscComplement p ξ η ε hε ℓ 0=0 ∧
      cyclotomicLogDiscComplement p ξ η ε hε ℓ (-2)=0 := sorry
end Field

theorem cyclotomicLogDiscComplement_inversion_hasSum {K : Type*} [NormedField K]
    [IsUltrametricDist K] [CharZero K] {D : ℕ} [NeZero D]
    (p : ℕ) (hp : p.Prime) (ξ : K) (hξ : IsPrimitiveRoot ξ p) (hpK : ‖(p : K)‖<1)
    (η : DirichletCharacter K D) (hD : 1<D) (ε : K) (hε : IsPrimitiveRoot ε D)
    (hDK : ‖(D : K)‖=1) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x))
    (t : K) (ht : ‖t‖<1) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive η ε hε ℓ)*
      (((1+t)⁻¹-1)^n-(p : K)⁻¹*∑ j ∈ Finset.range p, (ξ^j*(1+t)⁻¹-1)^n))
      (η (-1)*cyclotomicLogDiscComplement p ξ η ε hε ℓ t) := sorry
end DirichletPadic

namespace SuggestedComplementInversionTests
open scoped BigOperators
open DirichletPadic PowerSeries
section Field
variable {K : Type*} [Field K] [CharZero K]
variable (ℓ : K → K) (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
variable (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
include hmul hroot
-- principal_trace_correction
example (ξ : K) (hξ : ξ^3=1) (hε : IsPrimitiveRoot (-1 : K) 2)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogDiscTrace 3 ξ (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ⁻¹-1)=
      cyclotomicLogDiscTrace 3 ξ (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ-1)-ℓ ρ := sorry
-- principal_complement_invariant
example (ξ : K) (hξ : ξ^3=1) (hε : IsPrimitiveRoot (-1 : K) 2)
    (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogDiscComplement 3 ξ (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ⁻¹-1)=
      cyclotomicLogDiscComplement 3 ξ (1 : DirichletCharacter K 2) (-1) hε ℓ (ρ-1) := sorry
-- repeated_root_complement_pair
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (ε : K)
    (hε : IsPrimitiveRoot ε D) (ρ : K) (hρ : ρ≠0) :
    cyclotomicLogDiscComplement 4 (-1) η ε hε ℓ (ρ⁻¹-1)=
      η (-1)*cyclotomicLogDiscComplement 4 (-1) η ε hε ℓ (ρ-1) := sorry
-- odd_origin_and_negative_two
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D) (hodd : η (-1)=-1)
    (ε : K) (hε : IsPrimitiveRoot ε D) :
    cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ 0=0 ∧
      cyclotomicLogDiscComplement 2 (-1) η ε hε ℓ (-2)=0 := sorry
end Field
-- principal_three_adic_inverse_series
example {K : Type*} [NormedField K] [IsUltrametricDist K] [CharZero K]
    (ξ : K) (hξ : IsPrimitiveRoot ξ 3) (h3 : ‖(3 : K)‖<1)
    (hε : IsPrimitiveRoot (-1 : K) 2) (h2 : ‖(2 : K)‖=1) (ℓ : K → K)
    (hmul : ∀ x y, x≠0 → y≠0 → ℓ (x*y)=ℓ x+ℓ y)
    (hroot : ∀ z : K, ∀ n : ℕ, 0<n → z^n=1 → ℓ z=0)
    (hlocal : ∀ x u : K, x≠0 → ‖u‖<1 →
      HasSum (fun n : ℕ => coeff n (log K)*u^n) (ℓ (x*(1+u))-ℓ x)) :
    HasSum (fun n : ℕ => coeff n (tameLogPrimitive (1 : DirichletCharacter K 2) (-1) hε ℓ)*
      (((-3 : K)/4)^n-(3 : K)⁻¹*∑ j ∈ Finset.range 3, (ξ^j/4-1)^n))
      (cyclotomicLogDiscComplement 3 ξ (1 : DirichletCharacter K 2) (-1) hε ℓ 3) := sorry
end SuggestedComplementInversionTests
end

/-! Negative moments of the actual tame arithmetic measures. The continuous
inverse is the native unit inverse extended by zero, with its continuity supplied
by PMIA. The branch comparison uses a supplied factorization; it does not build
principal-unit families or identify a scalar analytic L-function. -/
namespace DirichletPadic
noncomputable section
section NegativeCharacterMoments
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))

theorem tameZetaMeasure_negative_moment_shift (n : ℕ) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1≤k) :
    tameZetaMeasure η hD hpD (primePowerCharacter p n χ*I^(k-1))=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^k) := sorry

theorem tameCharacterValue_negative_moment (n : ℕ) (χ : DirichletCharacter K (p^n))
    (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1≤k) (κ : (ℤ_[p])ˣ →ₜ* K)
    (hκ : ∀ u : (ℤ_[p])ˣ, κ u=primePowerCharacter p n χ (u : ℤ_[p])*
      (algebraMap ℤ_[p] K (↑u⁻¹ : ℤ_[p]))^(k-1)) :
    tameCharacterValue η hD hpD κ=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^k) := sorry

theorem twistedTameMeasure_negative_moment_eq_zero [CharZero K]
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hη : η≠1) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (k : ℕ) (hk : 1≤k) (hpar : η (-1)*χ (-1)=(-1 : K)^k) :
    AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^k)=0 := sorry

theorem tameCharacterValue_positive_integer_branch (n : ℕ)
    (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (k : ℕ) (hk : 1≤k)
    (ω α : (ℤ_[p])ˣ → K) (hfactor : ∀ u : (ℤ_[p])ˣ, ω u*α u=algebraMap ℤ_[p] K (u : ℤ_[p]))
    (κ : (ℤ_[p])ˣ →ₜ* K)
    (hκ : ∀ u : (ℤ_[p])ˣ, κ u=primePowerCharacter p n χ (u : ℤ_[p])*
      ((ω u)⁻¹)^(k-1)*((α u)⁻¹)^(k-1)) :
    tameCharacterValue η hD hpD κ=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^k) := sorry
end NegativeCharacterMoments
end
end DirichletPadic

namespace SuggestedNegativeMomentTests
open DirichletPadic
noncomputable section
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] {D : ℕ} [NeZero D]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))
-- first_negative_shift
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    tameZetaMeasure η hD hpD (primePowerCharacter p n χ)=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) I := sorry
-- second_negative_shift
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) :
    tameZetaMeasure η hD hpD (primePowerCharacter p n χ*I)=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^2) := sorry
-- untwisted_inverse_character
example (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p ∣ D)
    (κ : (ℤ_[p])ˣ →ₜ* K) (hκ : ∀ u : (ℤ_[p])ˣ, κ u=algebraMap ℤ_[p] K (↑u⁻¹ : ℤ_[p])) :
    tameCharacterValue η hD hpD κ=
      AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD) (I^2) := sorry
-- corrected_second_branch
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p ∣ D) (ω α : (ℤ_[p])ˣ → K)
    (hfactor : ∀ u : (ℤ_[p])ˣ, ω u*α u=algebraMap ℤ_[p] K (u : ℤ_[p]))
    (κ : (ℤ_[p])ˣ →ₜ* K) (hκ : ∀ u : (ℤ_[p])ˣ,
      κ u=primePowerCharacter p n χ (u : ℤ_[p])*(ω u)⁻¹*(α u)⁻¹) :
    tameCharacterValue η hD hpD κ=
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^2) := sorry
end General
section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[2] => algebraMap ℤ_[2] ℚ_[2] (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[2] ℚ_[2]) PadicInt.continuous_inv) : C(ℤ_[2],ℚ_[2]))
-- odd_first_negative_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (tameMeasure η hD hpD) I=0 := sorry
-- even_twist_second_negative_moment
example (η : DirichletCharacter ℚ_[2] 3) (hη : η 2=-1)
    (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3=-1)
    (hD : IsUnit (3 : ℚ_[2])) (hpD : ¬2 ∣ 3) :
    AbstractMeasure.unitRestriction 2 ℚ_[2] (twistedTameMeasure 2 χ η hD hpD) (I^2)=0 := sorry
end Dyadic
end
end SuggestedNegativeMomentTests

/-! Negative moments of the actual smoothing measures and their admissible
quotients. General coefficient-field pseudomeasure evaluation remains conditional
on the supplied compatible ring homomorphism. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure
open AbstractMeasure
section SmoothedNegativeMoments
variable (p : ℕ) [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))

theorem extend_intrinsicSmoothedNumerator_negative_moment
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hk : 1≤k) (κ : (ℤ_[p])ˣ →ₜ* K)
    (hκ : ∀ u : (ℤ_[p])ˣ, κ u=primePowerCharacter p n χ (u : ℤ_[p])*
      (algebraMap ℤ_[p] K (↑u⁻¹ : ℤ_[p]))^(k-1)) :
    extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
      κ.toContinuousMap=twistedSmoothedMeasure p n χ a ha (I^k) := sorry

theorem twistedSmoothedMeasure_negative_cross
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a b : ℕ) (ha : ¬p∣a) (hb : ¬p∣b)
    (k : ℕ) (hk : 1≤k) :
    (χ (b : ZMod (p^n))*((b : K)⁻¹)^(k-1)-1)*twistedSmoothedMeasure p n χ a ha (I^k)=
      (χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1)*twistedSmoothedMeasure p n χ b hb (I^k) := sorry

theorem twistedSmoothedMeasure_negative_quotient_independent
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a b : ℕ) (ha : ¬p∣a) (hb : ¬p∣b)
    (k : ℕ) (hk : 1≤k)
    (hda : χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1≠0)
    (hdb : χ (b : ZMod (p^n))*((b : K)⁻¹)^(k-1)-1≠0) :
    twistedSmoothedMeasure p n χ a ha (I^k)/
      (χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1)=
    twistedSmoothedMeasure p n χ b hb (I^k)/
      (χ (b : ZMod (p^n))*((b : K)⁻¹)^(k-1)-1) := sorry

theorem primePower_negative_principal_unit_admissible [CharZero K]
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (k : ℕ) (hk : 2≤k) :
    IsUnit (χ ((1+p^(n+1) : ℕ) : ZMod (p^n))*
      ((((1+p^(n+1) : ℕ) : K)⁻¹)^(k-1))-1) := sorry

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

theorem kubotaLeopoldtPseudomeasure_numerator_negative_moment
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hk : 1≤k) (κ : U →ₜ* K)
    (hκ : ∀ v : U, κ v=primePowerCharacter p n χ (v : Z)*
      (algebraMap Z K (↑v⁻¹ : Z))^(k-1)) (u : U) (hu : (u : Z)=(a : Z)) :
    extendIntegralUnitCoefficients (R := K)
      (Iwasawa.numerator δ Q u (kubotaLeopoldtPseudomeasure p)) κ.toContinuousMap=
    twistedSmoothedMeasure p n χ a ha (I^k) := sorry

theorem kubotaLeopoldtPseudomeasure_evalAt_negative_moment
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hk : 1≤k) (κ : U →ₜ* K)
    (hκ : ∀ v : U, κ v=primePowerCharacter p n χ (v : Z)*
      (algebraMap Z K (↑v⁻¹ : Z))^(k-1))
    (f : M →+* K) (hf : ∀ μ : M,
      f μ=extendIntegralUnitCoefficients (R := K) μ κ.toContinuousMap)
    (u : U) (hu : (u : Z)=(a : Z)) (hd : IsUnit (f (δ u-1))) :
    letI : Algebra M K := f.toAlgebra
    Iwasawa.evalAt δ Q K u hd (kubotaLeopoldtPseudomeasure p)=
      twistedSmoothedMeasure p n χ a ha (I^k)/
        (χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1) := sorry
end SmoothedNegativeMoments
end
end DirichletPadic

namespace SuggestedSmoothedNegativeTests
noncomputable section
open DirichletPadic AbstractMeasure
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))
-- negative_shift_level_zero
example (a : ℕ) (ha : ¬p∣a) :
    extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha) 1=
      twistedSmoothedMeasure p 0 (1 : DirichletCharacter K (p^0)) a ha I := sorry
-- negative_shift_identity_parameter
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (h1 : ¬p∣1) (k : ℕ) :
    twistedSmoothedMeasure p n χ 1 h1 (I^k)=0 := sorry
-- first_cross_denominator
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (a b : ℕ) (ha : ¬p∣a) (hb : ¬p∣b) :
    (χ (b : ZMod (p^n))-1)*twistedSmoothedMeasure p n χ a ha I=
      (χ (a : ZMod (p^n))-1)*twistedSmoothedMeasure p n χ b hb I := sorry
-- second_cross_denominator
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (a b : ℕ) (ha : ¬p∣a) (hb : ¬p∣b) :
    (χ (b : ZMod (p^n))*(b : K)⁻¹-1)*twistedSmoothedMeasure p n χ a ha (I^2)=
      (χ (a : ZMod (p^n))*(a : K)⁻¹-1)*twistedSmoothedMeasure p n χ b hb (I^2) := sorry
-- level_zero_quotient
example (a b : ℕ) (ha : ¬p∣a) (hb : ¬p∣b)
    (hda : (a : K)⁻¹-1≠0) (hdb : (b : K)⁻¹-1≠0) :
    twistedSmoothedMeasure p 0 (1 : DirichletCharacter K (p^0)) a ha (I^2)/((a : K)⁻¹-1)=
      twistedSmoothedMeasure p 0 (1 : DirichletCharacter K (p^0)) b hb (I^2)/((b : K)⁻¹-1) := sorry
-- dyadic_negative_admissible
example [IsBoundedSMul ℤ_[2] ℚ_[2]] :
    IsUnit ((3 : ℚ_[2])⁻¹-1) := sorry
-- first_principal_inadmissible
example (n : ℕ) (u : (ℤ_[p])ˣ) :
    primePowerCharacter p n (1 : DirichletCharacter K (p^n)) (u : ℤ_[p])-1=0 := sorry
end
end SuggestedSmoothedNegativeTests

/-! Exact residue masses of the actual arithmetic smoothing measure, followed
by finite inverse-moment approximation and its denominator-dependent precision. -/
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

theorem twistedSmoothedMeasure_negative_residue_error
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hk : 1≤k) (m : ℕ) (hm : 1≤m) (hn : n≤m) :
    let red : C(ℤ_[p],ZMod (p^m)) :=
      ⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩
    let c := finiteProjection red (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha))
    ‖twistedSmoothedMeasure p n χ a ha (I^k)-
      ∑ r : ZMod (p^m), c r*(primePowerCharacter p n χ (r.val : ℤ_[p])*I (r.val : ℤ_[p])^k)‖≤
      ((p : ℝ)^m)⁻¹ := sorry

theorem twistedSmoothedMeasure_negative_quotient_error
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a)
    (k : ℕ) (hk : 1≤k) (m : ℕ) (hm : 1≤m) (hn : n≤m)
    (hd : χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1≠0) :
    let red : C(ℤ_[p],ZMod (p^m)) :=
      ⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩
    let c := finiteProjection red (extendIntegralCoefficients (R := K) (smoothedMeasure p a ha))
    let d := χ (a : ZMod (p^n))*((a : K)⁻¹)^(k-1)-1
    ‖twistedSmoothedMeasure p n χ a ha (I^k)/d-
      (∑ r : ZMod (p^m), c r*(primePowerCharacter p n χ (r.val : ℤ_[p])*I (r.val : ℤ_[p])^k))/d‖≤
      ((p : ℝ)^m)⁻¹/‖d‖ := sorry
end SmoothedResidueMasses
end
end DirichletPadic

namespace SuggestedSmoothedResidueTests
noncomputable section
open scoped AbstractMeasure BigOperators
open AbstractMeasure DirichletPadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]] [IsBoundedSMul ℤ_[3] ℚ_[3]]
-- ternary_translation_difference
example :
    AbstractMeasure.map (⟨fun x : ℤ_[3] => x+2, by fun_prop⟩ : C(ℤ_[3],ℤ_[3]))
      (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)))-
      extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num))=
    dirac ℚ_[3] (1 : ℤ_[3])-dirac ℚ_[3] (0 : ℤ_[3]) := sorry
-- multiple_wrap_recurrence
example :
    let red : C(ℤ_[2],ZMod (2^1)) :=
      ⟨PadicInt.toZModPow 1,PadicInt.continuous_toZModPow 2 1⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 5 (by norm_num)))
    c 1-c 0= -2 := sorry
-- ternary_three_cells
example :
    let red : C(ℤ_[3],ZMod (3^1)) :=
      ⟨PadicInt.toZModPow 1,PadicInt.continuous_toZModPow 3 1⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[3]) (smoothedMeasure 3 2 (by norm_num)))
    c 0=1/2 ∧ c 1= -1/2 ∧ c 2=1/2 := sorry
-- dyadic_four_cells
example :
    let red : C(ℤ_[2],ZMod (2^2)) :=
      ⟨PadicInt.toZModPow 2,PadicInt.continuous_toZModPow 2 2⟩
    let c := finiteProjection red
      (extendIntegralCoefficients (R := ℚ_[2]) (smoothedMeasure 2 3 (by norm_num)))
    c 0=1 ∧ c 1= -1 ∧ c 2=0 ∧ c 3=1 := sorry
-- identity_parameter_cells
example (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]] (h1 : ¬p∣1)
    (m : ℕ) (r : ZMod (p^m)) :
    finiteProjection
      (⟨PadicInt.toZModPow m,PadicInt.continuous_toZModPow p m⟩ : C(ℤ_[p],ZMod (p^m)))
      (extendIntegralCoefficients (R := ℚ_[p]) (smoothedMeasure p 1 h1)) r=0 := sorry
-- dyadic_negative_first_approximation
example :
    let i : C(ℤ_[2],ℚ_[2]) :=
      ⟨fun x => algebraMap ℤ_[2] ℚ_[2] (PadicInt.inv x),
        (continuous_algebraMap ℤ_[2] ℚ_[2]).comp PadicInt.continuous_inv⟩
    ‖twistedSmoothedMeasure 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 3
      (by norm_num) i-(-2/3 : ℚ_[2])‖≤(1/4 : ℝ) := sorry
-- ternary_negative_first_approximation
example :
    let i : C(ℤ_[3],ℚ_[3]) :=
      ⟨fun x => algebraMap ℤ_[3] ℚ_[3] (PadicInt.inv x),
        (continuous_algebraMap ℤ_[3] ℚ_[3]).comp PadicInt.continuous_inv⟩
    ‖twistedSmoothedMeasure 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 2
      (by norm_num) i-(-1/4 : ℚ_[3])‖≤(1/3 : ℝ) := sorry
-- small_smoothing_denominator_precision
example (v s : ℚ_[3]) (h : ‖v-s‖≤(1/9 : ℝ)) :
    ‖v/(-3/4 : ℚ_[3])-s/(-3/4 : ℚ_[3])‖≤(1/3 : ℝ) := sorry
end
end SuggestedSmoothedResidueTests

/-! Concrete inverse-power arithmetic characters. The inverse coordinate is the
already owned Eisenstein character; generic character spaces are not rebuilt. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
section Ring
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]

def inversePowerArithmeticCharacter (n : ℕ) (χ : DirichletCharacter R (p^n)) (r : ℕ) :
    ContinuousMonoidHom (ℤ_[p])ˣ R := sorry

lemma inversePowerArithmeticCharacter_def (n : ℕ) (χ : DirichletCharacter R (p^n)) (r : ℕ) :
    inversePowerArithmeticCharacter p n χ r = primePowerArithmeticCharacter p n χ 0 *
      ((⟨(algebraMap ℤ_[p] R).toMonoidHom, continuous_algebraMap ℤ_[p] R⟩ :
        ContinuousMonoidHom ℤ_[p] R).comp (eisensteinInverseCharacter p))^r := sorry

lemma inversePowerArithmeticCharacter_apply (n : ℕ) (χ : DirichletCharacter R (p^n))
    (r : ℕ) (u : (ℤ_[p])ˣ) :
    inversePowerArithmeticCharacter p n χ r u = primePowerCharacter p n χ (u : ℤ_[p]) *
      (algebraMap ℤ_[p] R (↑u⁻¹ : ℤ_[p]))^r := sorry

lemma inversePowerArithmeticCharacter_zero_power (n : ℕ) (χ : DirichletCharacter R (p^n)) :
    inversePowerArithmeticCharacter p n χ 0 = primePowerArithmeticCharacter p n χ 0 := sorry

lemma inversePowerArithmeticCharacter_zero_level (χ : DirichletCharacter R (p^0))
    (r : ℕ) (u : (ℤ_[p])ˣ) :
    inversePowerArithmeticCharacter p 0 χ r u = (algebraMap ℤ_[p] R (↑u⁻¹ : ℤ_[p]))^r := sorry

lemma inversePowerArithmeticCharacter_neg_one (n : ℕ) (χ : DirichletCharacter R (p^n))
    (r : ℕ) : inversePowerArithmeticCharacter p n χ r (-1) = χ (-1)*(-1 : R)^r := sorry
end Ring

section Field
variable {K : Type*} [NormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]

lemma inversePowerArithmeticCharacter_nat (n : ℕ) (χ : DirichletCharacter K (p^n))
    (r a : ℕ) (u : (ℤ_[p])ˣ) (hu : (u : ℤ_[p]) = (a : ℤ_[p])) :
    inversePowerArithmeticCharacter p n χ r u = χ (a : ZMod (p^n))*((a : K)⁻¹)^r := sorry

lemma inversePowerArithmeticCharacter_norm_le (n : ℕ) (χ : DirichletCharacter K (p^n))
    (r : ℕ) (u : (ℤ_[p])ˣ) : ‖inversePowerArithmeticCharacter p n χ r u‖ ≤ 1 := sorry

theorem inversePowerArithmeticCharacter_exists_admissible [CharZero K]
    [CompleteSpace K] [IsUltrametricDist K] (n : ℕ) (χ : DirichletCharacter K (p^n)) (r : ℕ) :
    (∃ a : ℕ, 1<a ∧ ¬p∣a ∧ ∃ u : (ℤ_[p])ˣ,
      (u : ℤ_[p])=(a : ℤ_[p]) ∧ IsUnit (inversePowerArithmeticCharacter p n χ r u-1)) ↔
      r≠0 ∨ χ≠1 := sorry

variable [CompleteSpace K] [IsUltrametricDist K]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))

theorem extend_intrinsicSmoothedNumerator_inverse_arithmetic
    (n : ℕ) (χ : DirichletCharacter K (p^n)) (r a : ℕ) (ha : ¬p∣a) :
    extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
      (inversePowerArithmeticCharacter p n χ r).toContinuousMap =
      twistedSmoothedMeasure p n χ a ha (I^(r+1)) := sorry
end Field

section Tame
variable {K : Type*} [NontriviallyNormedField K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [CompleteSpace K] [IsUltrametricDist K] {D : ℕ} [NeZero D]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))

theorem tameCharacterValue_inverse_arithmetic (n : ℕ) (χ : DirichletCharacter K (p^n))
    (r : ℕ) (η : DirichletCharacter K D) (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    tameCharacterValue η hD hpD (inversePowerArithmeticCharacter p n χ r) =
      AbstractMeasure.unitRestriction p K (twistedTameMeasure n χ η hD hpD) (I^(r+1)) := sorry
end Tame
end
end DirichletPadic

namespace SuggestedInverseArithmeticTests
noncomputable section
open DirichletPadic AbstractMeasure
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
-- identity_value
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (r : ℕ) :
    inversePowerArithmeticCharacter p n χ r 1=1 := sorry
-- zero_exponent_finite_character
example (n : ℕ) (χ : DirichletCharacter K (p^n)) :
    inversePowerArithmeticCharacter p n χ 0=primePowerArithmeticCharacter p n χ 0 := sorry
-- level_zero_inverse_coordinate
example (u : (ℤ_[p])ˣ) :
    inversePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1 u=
      algebraMap ℤ_[p] K (eisensteinInverseCharacter p u) := sorry
-- zero_exponent_principal_inadmissible
example (n : ℕ) (u : (ℤ_[p])ˣ) :
    ¬IsUnit (inversePowerArithmeticCharacter p n (1 : DirichletCharacter K (p^n)) 0 u-1) := sorry
-- uniform_inverse_norm
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (r : ℕ) (u : (ℤ_[p])ˣ) :
    ‖inversePowerArithmeticCharacter p n χ r u‖≤1 := sorry
end General
-- ternary_reciprocal_square
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    inversePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 2 u=1/4 := sorry
-- same_residue_different_values
example (u v : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) (hv : (v : ℤ_[3])=5) :
    inversePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 1 u ≠
      inversePowerArithmeticCharacter 3 1 (1 : DirichletCharacter ℚ_[3] (3^1)) 1 v := sorry
-- dyadic_odd_sign
example (χ : DirichletCharacter ℚ_[2] (2^2)) (hχ : χ 3=-1) :
    inversePowerArithmeticCharacter 2 2 χ 1 (-1)=1 := sorry
-- dyadic_principal_admissible
example : ∃ a : ℕ, 1<a ∧ ¬2∣a ∧ ∃ u : (ℤ_[2])ˣ,
    (u : ℤ_[2])=(a : ℤ_[2]) ∧
      IsUnit (inversePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1 u-1) := sorry
-- finite_ternary_admissible
example (χ : DirichletCharacter ℚ_[3] (3^1)) (hχ : χ 2=-1)
    (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3])=2) :
    inversePowerArithmeticCharacter 3 1 χ 0 u-1=-2 := sorry
section Moments
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [CompleteSpace K] [IsUltrametricDist K]
local notation "I" => (ContinuousMap.mk (fun x : ℤ_[p] => algebraMap ℤ_[p] K (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap ℤ_[p] K) PadicInt.continuous_inv) : C(ℤ_[p],K))
-- first_smoothed_inverse_moment
example (n : ℕ) (χ : DirichletCharacter K (p^n)) (a : ℕ) (ha : ¬p∣a) :
    extendIntegralUnitCoefficients (R := K) (intrinsicSmoothedNumerator p a ha)
      (inversePowerArithmeticCharacter p n χ 0).toContinuousMap =
      twistedSmoothedMeasure p n χ a ha I := sorry
-- second_tame_inverse_moment
example {D : ℕ} [NeZero D] (η : DirichletCharacter K D)
    (hD : IsUnit (D : K)) (hpD : ¬p∣D) :
    tameCharacterValue η hD hpD
      (inversePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) 1) =
      AbstractMeasure.unitRestriction p K (tameMeasure η hD hpD) (I^2) := sorry
end Moments
end
end SuggestedInverseArithmeticTests

/-! The actual principal numerator is nonzero, including at p=2. This gives an
algebraic obstruction on every subalgebra containing the arithmetic pseudomeasure;
it is not a statement of analytic pole order or residue. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "I" => (ContinuousMap.mk (fun x : Z => algebraMap Z ℚ_[p] (PadicInt.inv x))
  (Continuous.comp (continuous_algebraMap Z ℚ_[p]) PadicInt.continuous_inv) : C(Z,ℚ_[p]))

theorem twistedSmoothedMeasure_principal_first_norm (ha : ¬p∣p+1) :
    ‖twistedSmoothedMeasure p 0 (1 : DirichletCharacter ℚ_[p] (p^0)) (p+1) ha I‖=
      if p=2 then (1/2 : ℝ) else 1 := sorry

theorem intrinsicSmoothedNumerator_canonical_mass_norm (ha : ¬p∣p+1) :
    ‖intrinsicSmoothedNumerator p (p+1) ha 1‖=if p=2 then (1/2 : ℝ) else 1 := sorry

local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "Q" => FractionRing M

theorem kubotaLeopoldtPseudomeasure_no_augmentation_subalgebra
    (A : Subalgebra M Q) (hz : (kubotaLeopoldtPseudomeasure p : Q)∈A) :
    ¬∃ f : A →+* ℚ_[p], ∀ μ : M,
      f (algebraMap M A μ)=algebraMap Z ℚ_[p] (μ 1) := sorry
end
end DirichletPadic

namespace SuggestedPrincipalNumeratorTests
noncomputable section
open scoped AbstractMeasure
open DirichletPadic AbstractMeasure
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
variable [IsBoundedSMul ℤ_[2] ℚ_[2]] [IsBoundedSMul ℤ_[3] ℚ_[3]] [IsBoundedSMul ℤ_[5] ℚ_[5]]
-- dyadic_first_moment_norm
example :
    let i : C(ℤ_[2],ℚ_[2]) := ⟨fun x => algebraMap ℤ_[2] ℚ_[2] (PadicInt.inv x),
      (continuous_algebraMap ℤ_[2] ℚ_[2]).comp PadicInt.continuous_inv⟩
    ‖twistedSmoothedMeasure 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 3 (by norm_num) i‖=
      (1/2 : ℝ) := sorry
-- ternary_first_moment_norm
example :
    let i : C(ℤ_[3],ℚ_[3]) := ⟨fun x => algebraMap ℤ_[3] ℚ_[3] (PadicInt.inv x),
      (continuous_algebraMap ℤ_[3] ℚ_[3]).comp PadicInt.continuous_inv⟩
    ‖twistedSmoothedMeasure 3 0 (1 : DirichletCharacter ℚ_[3] (3^0)) 4 (by norm_num) i‖=1 := sorry
-- five_adic_first_moment_norm
example :
    let i : C(ℤ_[5],ℚ_[5]) := ⟨fun x => algebraMap ℤ_[5] ℚ_[5] (PadicInt.inv x),
      (continuous_algebraMap ℤ_[5] ℚ_[5]).comp PadicInt.continuous_inv⟩
    ‖twistedSmoothedMeasure 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 6 (by norm_num) i‖=1 := sorry
-- dyadic_mass_nonzero_nonunit
example : intrinsicSmoothedNumerator 2 3 (by norm_num) 1≠0 ∧
    ¬IsUnit (intrinsicSmoothedNumerator 2 3 (by norm_num) 1) := sorry
-- ternary_mass_unit
example : IsUnit (intrinsicSmoothedNumerator 3 4 (by norm_num) 1) := sorry
-- identity_parameter_zero_mass
example {p : ℕ} [Fact p.Prime] (ha : ¬p∣1) : intrinsicSmoothedNumerator p 1 ha 1=0 := sorry
section Subalgebra
variable (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local instance : TotallyDisconnectedSpace U :=
  (PadicInt.unitsHomeomorphIsUnit p).isEmbedding.isTotallyDisconnected_range.mp
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)
local instance : CommRing M :=
  { (inferInstance : Ring M) with mul_comm := mul_comm_of_commMonoid }
local notation "Q" => FractionRing M
-- generated_subalgebra_obstruction
example :
    let A : Subalgebra M Q := Algebra.adjoin M {(kubotaLeopoldtPseudomeasure p : Q)}
    ¬∃ f : A →+* ℚ_[p], ∀ μ : M, f (algebraMap M A μ)=algebraMap Z ℚ_[p] (μ 1) := sorry
-- whole_subalgebra_obstruction
example : ¬∃ f : (⊤ : Subalgebra M Q) →+* ℚ_[p], ∀ μ : M,
    f (algebraMap M (⊤ : Subalgebra M Q) μ)=algebraMap Z ℚ_[p] (μ 1) := sorry
end Subalgebra
end
end SuggestedPrincipalNumeratorTests

/-! Character-weighted positive Eisenstein coefficient measures. Classical
Eisenstein forms and the existing Tau Ceti twisted-divisor arithmetic function
retain their owners. These signatures use explicit finite arithmetic sums. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
section Coefficients
variable {R : Type*} [NormedCommRing R] {D E : ℕ}

def twistedPositiveEisensteinMeasure (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) : D(U,R) := sorry

lemma twistedPositiveEisensteinMeasure_eq_sum (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ n=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (ψ ((n : ℕ)/d)*φ d) • AbstractMeasure.dirac R
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma twistedPositiveEisensteinMeasure_apply (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) (f : C(U,R)) :
    twistedPositiveEisensteinMeasure p ψ φ n f=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        ψ ((n : ℕ)/d)*φ d*f
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma twistedPositiveEisensteinMeasure_one (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) :
    twistedPositiveEisensteinMeasure p ψ φ 1=AbstractMeasure.dirac R 1 := sorry

lemma twistedPositiveEisensteinMeasure_prime_pow (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (r : ℕ) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p^r,pow_pos (Fact.out : p.Prime).pos r⟩=
      (ψ p)^r • AbstractMeasure.dirac R 1 := sorry

theorem twistedPositiveEisensteinMeasure_mul_p (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p*(n : ℕ),mul_pos (Fact.out : p.Prime).pos n.pos⟩=
      ψ p • twistedPositiveEisensteinMeasure p ψ φ n := sorry

lemma twistedPositiveEisensteinMeasure_mass (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ n 1=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d else 0 := sorry

variable [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R]
theorem twistedPositiveEisensteinMeasure_moment (ψ : DirichletCharacter R D)
    (φ : DirichletCharacter R E) (n : ℕ+) (e : ℕ) :
    twistedPositiveEisensteinMeasure p ψ φ n
      (⟨fun u : U => (algebraMap Z R (u : Z))^e, by fun_prop⟩ : C(U,R))=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d*(d : R)^e else 0 := sorry
end Coefficients

lemma twistedPositiveEisensteinMeasure_modOne (n : ℕ+) :
    twistedPositiveEisensteinMeasure p (1 : DirichletCharacter Z 1)
      (1 : DirichletCharacter Z 1) n=positiveEisensteinMeasure p n := sorry

theorem twistedPositiveEisensteinMeasure_test_bound {K : Type*} [NormedField K]
    [IsUltrametricDist K] {D E : ℕ} (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f g : C(U,K)) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f-twistedPositiveEisensteinMeasure p ψ φ n g‖≤
      ‖f-g‖ := sorry
end
end DirichletPadic

namespace SuggestedTwistedEisensteinTests
noncomputable section
open scoped AbstractMeasure
open DirichletPadic AbstractMeasure
section General
variable {p : ℕ} [Fact p.Prime] {R : Type*} [NormedCommRing R] {D E : ℕ}
-- first_twisted_coefficient
example (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) :
    twistedPositiveEisensteinMeasure p ψ φ 1=dirac R 1 := sorry
-- level_one_integral_comparison
example (n : ℕ+) : twistedPositiveEisensteinMeasure p (1 : DirichletCharacter ℤ_[p] 1)
    (1 : DirichletCharacter ℤ_[p] 1) n=positiveEisensteinMeasure p n := sorry
-- bad_left_character_annihilation
example (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) (hψ : ψ p=0) (n : ℕ+) :
    twistedPositiveEisensteinMeasure p ψ φ ⟨p*(n : ℕ),mul_pos (Fact.out : p.Prime).pos n.pos⟩=0 := sorry
end General
section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
include hχ
-- dyadic_prime_sign
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2=
    -dirac ℚ_[2] 1 := sorry
-- dyadic_square_sign
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 4=
    dirac ℚ_[2] 1 := sorry
-- character_positions_left
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) :
    twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5=
      -dirac ℚ_[2] 1+dirac ℚ_[2] u := sorry
-- character_positions_right
example (u : (ℤ_[2])ˣ) (hu : (u : ℤ_[2])=5) :
    twistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5=
      dirac ℚ_[2] 1-dirac ℚ_[2] u := sorry
-- left_character_p_scaling
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 10=
    -twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 := sorry
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_weight_two_left
example : twistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (⟨fun u : (ℤ_[2])ˣ => algebraMap ℤ_[2] ℚ_[2] (u : ℤ_[2]), by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))=4 := sorry
-- dyadic_weight_two_right
example : twistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5
    (⟨fun u : (ℤ_[2])ˣ => algebraMap ℤ_[2] ℚ_[2] (u : ℤ_[2]), by fun_prop⟩ : C((ℤ_[2])ˣ,ℚ_[2]))=-4 := sorry
end Dyadic
section Bounds
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K] [IsUltrametricDist K]
  {D E : ℕ} (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
-- uniform_single_test_bound
example (n : ℕ+) (f : C((ℤ_[p])ˣ,K)) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f‖≤‖f‖ := sorry
-- close_tests_close_coefficients
example (n : ℕ+) (f g : C((ℤ_[p])ˣ,K)) (b : ℝ) (h : ‖f-g‖≤b) :
    ‖twistedPositiveEisensteinMeasure p ψ φ n f-twistedPositiveEisensteinMeasure p ψ φ n g‖≤b := sorry
end Bounds
end
end SuggestedTwistedEisensteinTests

/-! Integral character-weighted positive Eisenstein coefficients. The native
integer subring and the existing integral arithmetic characters are reused. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators
variable (p : ℕ) [Fact p.Prime]
variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}
local notation "U" => (ℤ_[p])ˣ
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

def integralTwistedPositiveEisensteinMeasure (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) : D(U,O) := sorry

lemma integralTwistedPositiveEisensteinMeasure_eq_sum (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (⟨ψ ((n : ℕ)/d)*φ d, by
          rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
          have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
            rw [norm_mul]
            calc
              _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                (norm_nonneg _) zero_le_one
              _ = 1 := one_mul _
          exact_mod_cast hb⟩ : O) • AbstractMeasure.dirac O
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

lemma integralTwistedPositiveEisensteinMeasure_apply (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n f=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        (⟨ψ ((n : ℕ)/d)*φ d, by
          rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
          have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
            rw [norm_mul]
            calc
              _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                (norm_nonneg _) zero_le_one
              _ = 1 := one_mul _
          exact_mod_cast hb⟩ : O) * f
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit else 0 := sorry

theorem coe_integralTwistedPositiveEisensteinMeasure_apply
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f : C(U,O)) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n ((iMap).comp f) := sorry

lemma integralTwistedPositiveEisensteinMeasure_one (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1=AbstractMeasure.dirac O 1 := sorry

lemma integralTwistedPositiveEisensteinMeasure_unique_coefficient
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+)
    (ν : D(U,O)) (hν : ∀ f : C(U,O), (ν f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n ((iMap).comp f)) :
    ν=integralTwistedPositiveEisensteinMeasure p ψ φ n := sorry

lemma integralTwistedPositiveEisensteinMeasure_bound (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,O)) :
    ‖integralTwistedPositiveEisensteinMeasure p ψ φ n f‖≤‖f‖ := sorry

theorem integralTwistedPositiveEisensteinMeasure_test_congruence
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+)
    (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    b∣integralTwistedPositiveEisensteinMeasure p ψ φ n g-
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
theorem integralTwistedPositiveEisensteinMeasure_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then ψ ((n : ℕ)/d)*φ d*(d : K)^e else 0 := sorry

theorem integralTwistedPositiveEisensteinMeasure_weight_congruence
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    (p : O)^r∣
      integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e').toContinuousMap-
      integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry
end
end DirichletPadic

namespace SuggestedIntegralTwistedEisensteinTests
noncomputable section
open scoped AbstractMeasure
open DirichletPadic AbstractMeasure
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "U" => (ℤ_[p])ˣ
-- first_integral_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1=dirac O 1 := sorry
-- zero_integral_test
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n 0=0 := sorry
-- exact_coefficient_inclusion
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f : C(U,O)) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n f : K)=
      twistedPositiveEisensteinMeasure p ψ φ n
        ((ContinuousMap.mk Subtype.val continuous_subtype_val).comp f) := sorry
-- pointwise_ideal_transfer
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    b∣integralTwistedPositiveEisensteinMeasure p ψ φ n g-
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry
-- zero_modulus_is_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (f g : C(U,O)) (h : ∀ u : U, (0 : O)∣g u-f u) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n g=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry
end General

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
include hχ
local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))
-- dyadic_integral_sign
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2=
    -dirac O2 1 := sorry
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_integral_left_moment
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=4 := sorry
-- dyadic_integral_right_moment
example : integralTwistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) χ 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=-4 := sorry
-- dyadic_actual_moment_difference
example : integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=3120 := sorry
-- dyadic_weight_congruence
example : (8 : O2)∣
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap := sorry
end Dyadic

section OddCounterexample
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
variable [IsBoundedSMul ℤ_[5] ℚ_[5]]
variable (χ : DirichletCharacter ℚ_[5] 3) (hχ : χ 2=-1)
include hχ
local notation "O5" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))
-- tame_component_is_not_full_precision
example : ¬(25 : O5)∣
    integralTwistedPositiveEisensteinMeasure 5 χ (1 : DirichletCharacter ℚ_[5] 1) 2
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 7).toContinuousMap-
    integralTwistedPositiveEisensteinMeasure 5 χ (1 : DirichletCharacter ℚ_[5] 1) 2
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 3).toContinuousMap := sorry
end OddCounterexample
end
end SuggestedIntegralTwistedEisensteinTests

/-! Finite unit-group coordinates of the actual integral weighted coefficients.
The existing measure projection and unit reductions remain with their owner. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators
variable (p : ℕ) [Fact p.Prime]
variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}
local notation "U" => (ℤ_[p])ˣ
local notation "O" => Valuation.integer (NormedField.valuation (K := K))

def integralTwistedEisensteinFinite (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra O (ZMod (p^r))ˣ := sorry

lemma integralTwistedEisensteinFinite_eq_projection (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ n r=
      MonoidAlgebra.ofCoeff (AbstractMeasure.finiteProjection
        (ContinuousMap.mk (PadicInt.unitToZModPow p r) (PadicInt.continuous_unitToZModPow p r))
        (integralTwistedPositiveEisensteinMeasure p ψ φ n)) := sorry

lemma integralTwistedEisensteinFinite_eq_sum (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ n r=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        MonoidAlgebra.single (PadicInt.unitToZModPow p r
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit)
          (⟨ψ ((n : ℕ)/d)*φ d, by
            rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
            have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
              rw [norm_mul]
              calc
                _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                  (norm_nonneg _) zero_le_one
                _ = 1 := one_mul _
            exact_mod_cast hb⟩ : O) else 0 := sorry

lemma integralTwistedEisensteinFinite_coeff (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) (a : (ZMod (p^r))ˣ) :
    (integralTwistedEisensteinFinite p ψ φ n r).coeff a=
      ∑ d∈(n : ℕ).divisors, if hd : ¬p∣d then
        if PadicInt.unitToZModPow p r
          (PadicInt.isUnit_iff.mpr (PadicInt.norm_natCast_eq_one_iff.mpr
            ((Fact.out : p.Prime).coprime_iff_not_dvd.mpr hd))).unit=a then
          (⟨ψ ((n : ℕ)/d)*φ d, by
            rw [Valuation.mem_integer_iff, NormedField.valuation_apply]
            have hb : ‖ψ ((n : ℕ)/d)*φ d‖≤1 := by
              rw [norm_mul]
              calc
                _ ≤ 1*1 := mul_le_mul (ψ.norm_le_one _) (φ.norm_le_one _)
                  (norm_nonneg _) zero_le_one
                _ = 1 := one_mul _
            exact_mod_cast hb⟩ : O) else 0 else 0 := sorry

theorem integralTwistedEisensteinFinite_transition (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) {r r' : ℕ} (hr : r'≤r) :
    MonoidAlgebra.mapDomainRingHom O (ZMod.unitsMap (pow_dvd_pow p hr))
      (integralTwistedEisensteinFinite p ψ φ n r)=
        integralTwistedEisensteinFinite p ψ φ n r' := sorry

theorem integralTwistedEisensteinFinite_apply {R : Type*} [CommRing R]
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r : ℕ) (c : O →+* R) (f : C(U,O)) (g : (ZMod (p^r))ˣ → R)
    (hfg : ∀ u : U, c (f u)=g (PadicInt.unitToZModPow p r u)) :
    c (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      ∑ a, c ((integralTwistedEisensteinFinite p ψ φ n r).coeff a)*g a := sorry

lemma integralTwistedEisensteinFinite_one (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ 1 r=MonoidAlgebra.single 1 1 := sorry

lemma integralTwistedEisensteinFinite_zero_level (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (n : ℕ+) :
    integralTwistedEisensteinFinite p ψ φ n 0=
      MonoidAlgebra.single 1 (integralTwistedPositiveEisensteinMeasure p ψ φ n 1) := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
theorem integralTwistedEisensteinFinite_moment_precision
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r e : ℕ) :
    (p : O)^r∣integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap-
      ∑ a : (ZMod (p^r))ˣ, (integralTwistedEisensteinFinite p ψ φ n r).coeff a*
        ((a : ZMod (p^r)).val : O)^e := sorry

lemma integralTwistedEisensteinFinite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (r s e : ℕ) (h : s≤r) :
    Ideal.Quotient.mk (Ideal.span {(p : O)^s})
      (integralTwistedPositiveEisensteinMeasure p ψ φ n
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      ∑ a : (ZMod (p^r))ˣ,
        Ideal.Quotient.mk (Ideal.span {(p : O)^s})
          ((integralTwistedEisensteinFinite p ψ φ n r).coeff a)*
        ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e := sorry
end
end DirichletPadic

namespace SuggestedTwistedFiniteTests
noncomputable section
open scoped AbstractMeasure BigOperators
open DirichletPadic
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
-- first_finite_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (r : ℕ) :
    integralTwistedEisensteinFinite p ψ φ 1 r=MonoidAlgebra.single 1 1 := sorry
-- actual_integral_projection
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    (integralTwistedEisensteinFinite p ψ φ n r).coeff=
      AbstractMeasure.finiteProjection
        (ContinuousMap.mk (PadicInt.unitToZModPow p r) (PadicInt.continuous_unitToZModPow p r))
        (integralTwistedPositiveEisensteinMeasure p ψ φ n) := sorry
-- trivial_group_remembers_mass
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    (integralTwistedEisensteinFinite p ψ φ n 0).coeff 1=
      integralTwistedPositiveEisensteinMeasure p ψ φ n 1 := sorry
-- zero_coefficient_precision
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (Ideal.Quotient.mk (Ideal.span {(p : O)^0}))
      (integralTwistedEisensteinFinite p ψ φ n r)=0 := sorry
-- compatible_group_refinement
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) :
    MonoidAlgebra.mapDomainRingHom O (ZMod.unitsMap (pow_dvd_pow p (show 1≤2 by decide)))
      (integralTwistedEisensteinFinite p ψ φ n 2)=integralTwistedEisensteinFinite p ψ φ n 1 := sorry
end General

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
include hχ
local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))
-- dyadic_signed_separation
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3=
    -MonoidAlgebra.single 1 1+
      MonoidAlgebra.single (ZMod.unitOfCoprime 5 (by decide) : (ZMod (2^3))ˣ) 1 := sorry
-- dyadic_signed_collision
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 := sorry
-- dyadic_prime_coefficient_survives
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 2 3=
    -MonoidAlgebra.single 1 1 := sorry
-- dyadic_distinct_levels
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3≠0 ∧
    integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 := sorry
-- dyadic_residue_representative_moment
example : (∑ a : (ZMod (2^3))ˣ,
    (integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 3).coeff a*
      ((a : ZMod (2^3)).val : O2))=4 := sorry
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_sufficient_precision
example : Ideal.Quotient.mk (Ideal.span {(4 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)=0 := sorry
-- dyadic_insufficient_group_level
example : Ideal.Quotient.mk (Ideal.span {(8 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)≠0 := sorry
end Dyadic
end
end SuggestedTwistedFiniteTests

/-! Integral character-weighted positive q-expansions, with the native
coefficientwise power-series topology. The zero constant is a truncation. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
variable {K : Type*} [NormedField K] [IsUltrametricDist K] {D E : ℕ}
local notation "U" => (ℤ_[p])ˣ
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "iMap" => (ContinuousMap.mk Subtype.val continuous_subtype_val : C(O,K))

def integralTwistedPositiveEisensteinSeries (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) : AbstractMeasure U O (PowerSeries O) := sorry

theorem integralTwistedPositiveEisensteinSeries_coeff (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    PowerSeries.coeff n (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      if hn : 0<n then integralTwistedPositiveEisensteinMeasure p ψ φ ⟨n,hn⟩ f else 0 := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_zero (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.coeff 0 (integralTwistedPositiveEisensteinSeries p ψ φ f)=0 := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_pos (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry

lemma integralTwistedPositiveEisensteinSeries_zero (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) : integralTwistedPositiveEisensteinSeries p ψ φ 0=0 := sorry

lemma integralTwistedPositiveEisensteinSeries_add (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f g : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ (f+g)=
      integralTwistedPositiveEisensteinSeries p ψ φ f+
        integralTwistedPositiveEisensteinSeries p ψ φ g := sorry

lemma integralTwistedPositiveEisensteinSeries_smul (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (a : O) (f : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ (a • f)=
      a • integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

lemma integralTwistedPositiveEisensteinSeries_continuous (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) :
    Continuous (integralTwistedPositiveEisensteinSeries p ψ φ) := sorry

lemma integralTwistedPositiveEisensteinSeries_unique (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (M : AbstractMeasure U O (PowerSeries O))
    (h0 : ∀ f, PowerSeries.coeff 0 (M f)=0)
    (hpos : ∀ f (n : ℕ+), PowerSeries.coeff (n : ℕ) (M f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f) :
    M=integralTwistedPositiveEisensteinSeries p ψ φ := sorry

lemma integralTwistedPositiveEisensteinSeries_coeff_norm_le (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    ‖PowerSeries.coeff n (integralTwistedPositiveEisensteinSeries p ψ φ f)‖≤‖f‖ := sorry

theorem coe_integralTwistedPositiveEisensteinSeries_apply (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ f)=
        PowerSeries.mk (fun n => if hn : 0<n then
          twistedPositiveEisensteinMeasure p ψ φ ⟨n,hn⟩ ((iMap).comp f) else 0) := sorry

theorem integralTwistedPositiveEisensteinSeries_test_congr (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f g : C(U,O)) (b : O) (h : ∀ u : U, b∣g u-f u) :
    PowerSeries.C b∣integralTwistedPositiveEisensteinSeries p ψ φ g-
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

theorem integralTwistedPositiveEisensteinSeries_coeff_mul_p (ψ : DirichletCharacter K D)
    (φ : DirichletCharacter K E) (f : C(U,O)) (n : ℕ) :
    (PowerSeries.coeff (R := O) (p*n) (integralTwistedPositiveEisensteinSeries p ψ φ f) : K)=
      ψ p*(PowerSeries.coeff (R := O) n (integralTwistedPositiveEisensteinSeries p ψ φ f) : K) := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
theorem integralTwistedPositiveEisensteinSeries_weight_congr
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r)∣
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e').toContinuousMap-
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_finite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (r s e : ℕ) (h : s≤r) :
    PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(p : O)^s}))
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => if hn : 0<n then
        ∑ a : (ZMod (p^r))ˣ,
          Ideal.Quotient.mk (Ideal.span {(p : O)^s})
            ((integralTwistedEisensteinFinite p ψ φ ⟨n,hn⟩ r).coeff a)*
          ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e else 0) := sorry
end
end DirichletPadic

namespace SuggestedTwistedSeriesTests
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology
open DirichletPadic
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "U" => (ℤ_[p])ˣ
-- zero_test_series
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    integralTwistedPositiveEisensteinSeries p ψ φ 0=0 := sorry
-- positive_truncation_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.constantCoeff (integralTwistedPositiveEisensteinSeries p ψ φ f)=0 := sorry
-- first_series_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,O)) :
    PowerSeries.coeff 1 (integralTwistedPositiveEisensteinSeries p ψ φ f)=f 1 := sorry
-- actual_positive_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry
-- zero_ideal_series_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f g : C(U,O)) (h : ∀ u : U, (0 : O)∣g u-f u) :
    integralTwistedPositiveEisensteinSeries p ψ φ g=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry
end General

section LevelOne
variable {p : ℕ} [Fact p.Prime]
local notation "Op" => Valuation.integer (NormedField.valuation (K := ℚ_[p]))
-- level_one_mass_series
example :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := ℚ_[p]))).subtype
      (integralTwistedPositiveEisensteinSeries p
        (1 : DirichletCharacter ℚ_[p] 1) (1 : DirichletCharacter ℚ_[p] 1) 1)=
      PowerSeries.map PadicInt.Coe.ringHom
        (positiveEisensteinSeries p (1 : C((ℤ_[p])ˣ,ℤ_[p]))) := sorry
end LevelOne

section Dyadic
variable (χ : DirichletCharacter ℚ_[2] 3) (hχ : χ 2=-1)
include hχ
local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))
-- dyadic_series_prime_sign
example : PowerSeries.coeff 2
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) 1)=-1 := sorry
-- dyadic_series_index_sign
example (f : C((ℤ_[2])ˣ,O2)) : PowerSeries.coeff 10
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) f)=
      -PowerSeries.coeff 5
        (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1) f) := sorry
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_series_fifth_moment
example : PowerSeries.coeff 5
    (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap)=4 := sorry
-- dyadic_whole_series_congruence
example : PowerSeries.C (8 : O2)∣
    integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 5).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap := sorry
-- insufficient_group_level_in_series
example : integralTwistedEisensteinFinite 2 χ (1 : DirichletCharacter ℚ_[2] 1) 5 2=0 ∧
    PowerSeries.coeff 5 (PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(8 : O2)}))
      (integralTwistedPositiveEisensteinSeries 2 χ (1 : DirichletCharacter ℚ_[2] 1)
        (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap))≠0 := sorry
end Dyadic

section OddCounterexample
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
variable [IsBoundedSMul ℤ_[5] ℚ_[5]]
variable (χ : DirichletCharacter ℚ_[5] 3) (hχ : χ 2=-1)
include hχ
local notation "O5" => Valuation.integer (NormedField.valuation (K := ℚ_[5]))
-- tame_only_whole_series_failure
example : ¬PowerSeries.C (25 : O5)∣
    integralTwistedPositiveEisensteinSeries 5 χ (1 : DirichletCharacter ℚ_[5] 1)
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 7).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 5 χ (1 : DirichletCharacter ℚ_[5] 1)
      (integralPrimePowerArithmeticCharacter 5 0 (1 : DirichletCharacter ℚ_[5] (5^0)) 3).toContinuousMap := sorry
end OddCounterexample
end
end SuggestedTwistedSeriesTests

/-! Finite-character specialization of the actual weighted positive series.
Native DirichletCharacter.mul supplies the product at the lcm of levels. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
variable {K : Type*} [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}
local notation "U" => (ℤ_[p])ˣ
local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinMeasure_character_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=
    integralTwistedPositiveEisensteinMeasure p ψ (φ.mul χ) n f := sorry

theorem integralTwistedPositiveEisensteinMeasure_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap : K)=
      ∑ d∈(n : ℕ).divisors, if ¬p∣d then
        ψ ((n : ℕ)/d)*φ d*χ d*(d : K)^e else 0 := sorry

theorem integralTwistedPositiveEisensteinSeries_character_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=
    integralTwistedPositiveEisensteinSeries p ψ (φ.mul χ) f := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_twist
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap=
    integralTwistedPositiveEisensteinSeries p ψ (φ.mul χ)
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => if 0<n then
        ∑ d∈n.divisors, if ¬p∣d then ψ (n/d)*φ d*χ d*(d : K)^e else 0 else 0) := sorry

theorem integralTwistedPositiveEisensteinSeries_character_weight_congr
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t))
    (r e e' : ℕ) (hr : 0<r) (he : Nat.ModEq (p^(r-1)*(p-1)) e e') :
    PowerSeries.C ((p : O)^r)∣
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e').toContinuousMap-
      integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_character_finite_moment_mod
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t))
    (r s e : ℕ) (h : s≤r) :
    PowerSeries.map (Ideal.Quotient.mk (Ideal.span {(p : O)^s}))
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => if hn : 0<n then
        ∑ a : (ZMod (p^r))ˣ,
          Ideal.Quotient.mk (Ideal.span {(p : O)^s})
            ((integralTwistedEisensteinFinite p ψ (φ.mul χ) ⟨n,hn⟩ r).coeff a)*
          ((a : ZMod (p^r)).val : O ⧸ Ideal.span {(p : O)^s})^e else 0) := sorry
end
end DirichletPadic

namespace SuggestedWildEisensteinTests
noncomputable section
open scoped AbstractMeasure BigOperators PowerSeries.WithPiTopology
open DirichletPadic
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
local notation "U" => (ℤ_[p])ˣ
-- first_arithmetic_coefficient
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap=1 := sorry
-- principal_character_preserves_moment
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t e : ℕ) (n : ℕ+) :
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t (1 : DirichletCharacter K (p^t)) e).toContinuousMap=
    integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry
-- coefficient_twist_identity_atom
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) :
    integralTwistedPositiveEisensteinMeasure p ψ φ 1
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f)=f 1 := sorry
-- actual_series_character_specialization
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (f : C(U,O)) (n : ℕ+) :
    PowerSeries.coeff (n : ℕ) (integralTwistedPositiveEisensteinSeries p ψ φ
      ((integralPrimePowerArithmeticCharacter p t χ 0).toContinuousMap*f))=
    integralTwistedPositiveEisensteinMeasure p ψ (φ.mul χ) n f := sorry
-- principal_character_preserves_series
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (t e : ℕ) :
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t (1 : DirichletCharacter K (p^t)) e).toContinuousMap=
    integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap := sorry
-- character_series_constant_zero
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.coeff 0 (integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=0 := sorry
end General

section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
variable (χ : DirichletCharacter ℚ_[2] 4) (hχ : χ 3=-1)
include hχ
local notation "O2" => Valuation.integer (NormedField.valuation (K := ℚ_[2]))
-- wild_prime_coefficient_survives
example (e : ℕ) : PowerSeries.coeff 2
    (integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ e).toContinuousMap)=1 := sorry
-- wild_right_third_moment
example : PowerSeries.coeff 3
    (integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap)=-2 := sorry
-- wrong_left_third_moment
example : integralTwistedPositiveEisensteinMeasure 2 χ
    (1 : DirichletCharacter ℚ_[2] 1) 3
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap=2 := sorry
-- wild_whole_weight_congruence
example : PowerSeries.C (8 : O2)∣
    integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 5).toContinuousMap-
    integralTwistedPositiveEisensteinSeries 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1)
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap := sorry
-- character_inserted_before_coarse_projection
example : integralTwistedEisensteinFinite 2 (1 : DirichletCharacter ℚ_[2] 1)
    ((1 : DirichletCharacter ℚ_[2] 1).mul χ) 3 1=0 := sorry
-- coarse_after_twist_moment_precision
example : Ideal.Quotient.mk (Ideal.span {(2 : O2)})
    (integralTwistedPositiveEisensteinMeasure 2
      (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1) 3
      (integralPrimePowerArithmeticCharacter 2 2 χ 1).toContinuousMap)=0 := sorry
-- untwisted_coarse_coordinate_loses_character
example : integralTwistedEisensteinFinite 2
    (1 : DirichletCharacter ℚ_[2] 1) (1 : DirichletCharacter ℚ_[2] 1) 3 1≠
    integralTwistedEisensteinFinite 2 (1 : DirichletCharacter ℚ_[2] 1)
      ((1 : DirichletCharacter ℚ_[2] 1).mul χ) 3 1 := sorry
end Dyadic
end
end SuggestedWildEisensteinTests

/-! Coefficient change for the actual integral weighted Eisenstein objects.
The integer-ring algebra map is supplied by native Valuation.HasExtension. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
variable {K L : Type*} [NormedField K] [NormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L] [Algebra K L] [ContinuousSMul K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  {D E : ℕ}
local notation "OK" => Valuation.integer (NormedField.valuation (K := K))
local notation "OL" => Valuation.integer (NormedField.valuation (K := L))
local notation "U" => (ℤ_[p])ˣ
local notation "jMap" => (ContinuousMap.mk (algebraMap OK OL)
  (Continuous.subtype_mk (Continuous.comp (continuous_algebraMap K L) continuous_subtype_val) _) : C(OK,OL))

theorem integralTwistedPositiveEisensteinMeasure_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,OK)) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      integralTwistedPositiveEisensteinMeasure p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n
        ((jMap).comp f) := sorry

theorem integralTwistedEisensteinFinite_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
      (integralTwistedEisensteinFinite p ψ φ n r)=
      integralTwistedEisensteinFinite p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n r := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.map (algebraMap OK OL) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L))
        ((jMap).comp f) := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange_eq_iff
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f g : C(U,OK)) :
    integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f)=
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp g) ↔
      integralTwistedPositiveEisensteinSeries p ψ φ f=
        integralTwistedPositiveEisensteinSeries p ψ φ g := sorry

theorem integralTwistedPositiveEisensteinSeries_baseChange_dvd_iff
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (f g : C(U,OK)) (b : OK) :
    PowerSeries.C (algebraMap OK OL b)∣
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp g)-
      integralTwistedPositiveEisensteinSeries p
        (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f) ↔
      PowerSeries.C b∣integralTwistedPositiveEisensteinSeries p ψ φ g-
        integralTwistedPositiveEisensteinSeries p ψ φ f := sorry

variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [Algebra ℤ_[p] L] [IsBoundedSMul ℤ_[p] L]
theorem integralTwistedPositiveEisensteinMeasure_arithmetic_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (n : ℕ+) (e : ℕ) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
    integralTwistedPositiveEisensteinMeasure p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) n
      (integralPrimePowerArithmeticCharacter p t (χ.ringHomComp (algebraMap K L)) e).toContinuousMap := sorry

theorem integralTwistedPositiveEisensteinSeries_arithmetic_baseChange
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (algebraMap OK OL) (integralTwistedPositiveEisensteinSeries p ψ φ
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
    integralTwistedPositiveEisensteinSeries p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L))
      (integralPrimePowerArithmeticCharacter p t (χ.ringHomComp (algebraMap K L)) e).toContinuousMap := sorry
end
end DirichletPadic

namespace SuggestedEisensteinCoefficientChangeTests
noncomputable section
open scoped AbstractMeasure PowerSeries.WithPiTopology
open DirichletPadic
section General
variable {p : ℕ} [Fact p.Prime]
variable {K L : Type*} [NormedField K] [NormedField L]
  [IsUltrametricDist K] [IsUltrametricDist L] [Algebra K L] [ContinuousSMul K L]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  {D E : ℕ}
local notation "OK" => Valuation.integer (NormedField.valuation (K := K))
local notation "OL" => Valuation.integer (NormedField.valuation (K := L))
local notation "U" => (ℤ_[p])ˣ
local notation "jMap" => (ContinuousMap.mk (algebraMap OK OL)
  (Continuous.subtype_mk (Continuous.comp (continuous_algebraMap K L) continuous_subtype_val) _) : C(OK,OL))
-- first_coefficient_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    integralTwistedPositiveEisensteinMeasure p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) 1
      ((jMap).comp f)=algebraMap OK OL (f 1) := sorry
-- identity_coefficient_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (f : C(U,OK)) :
    algebraMap OK OK (integralTwistedPositiveEisensteinMeasure p ψ φ n f)=
      integralTwistedPositiveEisensteinMeasure p ψ φ n f := sorry
-- finite_first_atom_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
      (integralTwistedEisensteinFinite p ψ φ 1 r)=MonoidAlgebra.single 1 1 := sorry
-- identity_series_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.map (algebraMap OK OK) (integralTwistedPositiveEisensteinSeries p ψ φ f)=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry
-- extension_preserves_zero_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK)) :
    PowerSeries.coeff 0 (PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ f))=0 := sorry
-- zero_series_descends
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C(U,OK))
    (h : integralTwistedPositiveEisensteinSeries p
      (ψ.ringHomComp (algebraMap K L)) (φ.ringHomComp (algebraMap K L)) ((jMap).comp f)=0) :
    integralTwistedPositiveEisensteinSeries p ψ φ f=0 := sorry
-- zero_modulus_reflects_equality
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f g : C(U,OK))
    (h : PowerSeries.C (0 : OL)∣PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ g-
        integralTwistedPositiveEisensteinSeries p ψ φ f)) :
    integralTwistedPositiveEisensteinSeries p ψ φ g=
      integralTwistedPositiveEisensteinSeries p ψ φ f := sorry
variable [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
  [Algebra ℤ_[p] L] [IsBoundedSMul ℤ_[p] L]
-- first_arithmetic_coefficient_base_change
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    algebraMap OK OL (integralTwistedPositiveEisensteinMeasure p ψ φ 1
      (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=1 := sorry
end General

section Tower
variable {p : ℕ} [Fact p.Prime] {K L M : Type*}
  [NormedField K] [NormedField L] [NormedField M]
  [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
  [Algebra K L] [Algebra L M] [Algebra K M] [IsScalarTower K L M]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := L))]
  [Valuation.HasExtension (NormedField.valuation (K := L)) (NormedField.valuation (K := M))]
  [Valuation.HasExtension (NormedField.valuation (K := K)) (NormedField.valuation (K := M))]
  {D E : ℕ}
local notation "OK" => Valuation.integer (NormedField.valuation (K := K))
local notation "OL" => Valuation.integer (NormedField.valuation (K := L))
local notation "OM" => Valuation.integer (NormedField.valuation (K := M))
-- series_change_composes
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (f : C((ℤ_[p])ˣ,OK)) :
    PowerSeries.map (algebraMap OL OM) (PowerSeries.map (algebraMap OK OL)
      (integralTwistedPositiveEisensteinSeries p ψ φ f))=
    PowerSeries.map (algebraMap OK OM) (integralTwistedPositiveEisensteinSeries p ψ φ f) := sorry
-- finite_coordinate_change_composes
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (r : ℕ) :
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OL OM)
      (MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OL)
        (integralTwistedEisensteinFinite p ψ φ n r))=
    MonoidAlgebra.mapRingHom (ZMod (p^r))ˣ (algebraMap OK OM)
      (integralTwistedEisensteinFinite p ψ φ n r) := sorry
end Tower

section Ramification
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
variable {L : Type*} [NormedField L] [IsUltrametricDist L] [Algebra ℚ_[3] L]
  [Valuation.HasExtension (NormedField.valuation (K := ℚ_[3])) (NormedField.valuation (K := L))]
local notation "OL" => Valuation.integer (NormedField.valuation (K := L))
-- ramified_parameter_does_not_change_p_precision
example (π : OL) (hπ : π^2=3) : ¬(9 : OL)∣π^2 := sorry
-- field_divisibility_is_not_integral_precision
example : (9 : L)∣3 ∧ ¬(9 : OL)∣3 := sorry
end Ramification
end
end SuggestedEisensteinCoefficientChangeTests

/-! Comparison with the actual native two-character divisor sum.
This extension imports TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum.
The full suggested module is NOT COMPILED: no compatible existing artifact for
that pinned module was available. Separate complete Mathlib-only proofs check
the divisor bijection, finite-sum algebra and native PowerSeries.expand step. -/
namespace DirichletPadic
noncomputable section
open scoped BigOperators AbstractMeasure PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]

theorem twistedDivisorSum_euler_deletion {R : Type*} [CommRing R] {D E : ℕ}
    (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E) (n e : ℕ) :
    (∑ d∈n.divisors, if ¬p∣d then ψ (n/d)*φ d*(d : R)^e else 0)=
      DirichletCharacter.twistedDivisorSum e ψ φ n-
        if p∣n then φ p*(p : R)^e*DirichletCharacter.twistedDivisorSum e ψ φ (n/p)
        else 0 := sorry

variable {K : Type*} [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinMeasure_native_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (n : ℕ+) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      DirichletCharacter.twistedDivisorSum e ψ φ (n : ℕ)-
        if p∣(n : ℕ) then φ p*(p : K)^e*
          DirichletCharacter.twistedDivisorSum e ψ φ ((n : ℕ)/p) else 0 := sorry

theorem integralTwistedPositiveEisensteinSeries_native_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)-
        PowerSeries.C (φ p*(p : K)^e)*
          PowerSeries.expand p (Fact.out : p.Prime).ne_zero
            (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)) := sorry

theorem integralTwistedPositiveEisensteinSeries_native_arithmetic_moment
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n)-
        PowerSeries.C ((φ.mul χ) p*(p : K)^e)*
          PowerSeries.expand p (Fact.out : p.Prime).ne_zero
            (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n)) := sorry

theorem integralTwistedPositiveEisensteinSeries_native_bad_right_level
    (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (h : p∣E) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n) := sorry
end
end DirichletPadic

namespace SuggestedTwistedEulerTests
noncomputable section
open scoped BigOperators AbstractMeasure PowerSeries.WithPiTopology
open DirichletPadic
section General
variable {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] {D E : ℕ}
local notation "O" => Valuation.integer (NormedField.valuation (K := K))
-- native_zero_index
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    DirichletCharacter.twistedDivisorSum e ψ φ 0-
      φ p*(p : K)^e*DirichletCharacter.twistedDivisorSum e ψ φ (0/p)=0 := sorry
-- exponent_zero_keeps_right_factor
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) :
    DirichletCharacter.twistedDivisorSum 0 ψ φ p-
      φ p*DirichletCharacter.twistedDivisorSum 0 ψ φ 1=ψ p := sorry
-- away_index_equals_native
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (n : ℕ+) (hn : ¬p∣(n : ℕ)) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure p ψ φ n
      (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap : K)=
      DirichletCharacter.twistedDivisorSum e ψ φ (n : ℕ) := sorry
-- principal_levels_recover_sigma
example (ψ φ : DirichletCharacter K 1) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)=
      PowerSeries.mk (fun n => (ArithmeticFunction.sigma e : ArithmeticFunction K) n)-
        PowerSeries.C ((p : K)^e)*PowerSeries.expand p (Fact.out : p.Prime).ne_zero
          (PowerSeries.mk (fun n => (ArithmeticFunction.sigma e : ArithmeticFunction K) n)) := sorry
-- native_comparison_zero_constant
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E) (e : ℕ) :
    PowerSeries.coeff 0 (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)-
      PowerSeries.C (φ p*(p : K)^e)*PowerSeries.expand p (Fact.out : p.Prime).ne_zero
        (PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ φ n)))=0 := sorry
-- positive_wild_level_removes_euler_correction
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (t : ℕ) (ht : 0<t) (χ : DirichletCharacter K (p^t)) (e : ℕ) :
    PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
      (integralTwistedPositiveEisensteinSeries p ψ φ
        (integralPrimePowerArithmeticCharacter p t χ e).toContinuousMap)=
      PowerSeries.mk (fun n => DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n) := sorry
-- zero_level_wild_character_recovers_principal
example (ψ : DirichletCharacter K D) (φ : DirichletCharacter K E)
    (χ : DirichletCharacter K (p^0)) (e n : ℕ) :
    DirichletCharacter.twistedDivisorSum e ψ (φ.mul χ) n=
      DirichletCharacter.twistedDivisorSum e ψ φ n := sorry
end General

section DyadicLeft
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
variable (ψ : DirichletCharacter ℚ_[2] 3) (hψ : ψ 2=-1)
include hψ
-- left_character_prime_coefficient
example : (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 2
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap : ℚ_[2])=-1 := sorry
-- left_factor_would_be_wrong
example : DirichletCharacter.twistedDivisorSum 1 ψ (1 : DirichletCharacter ℚ_[2] 1) 2-
    ψ 2*2*DirichletCharacter.twistedDivisorSum 1 ψ (1 : DirichletCharacter ℚ_[2] 1) 1≠(-1 : ℚ_[2]) := sorry
-- divisible_index_is_not_deleted
example : (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 10
    (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) 1).toContinuousMap : ℚ_[2])=-4 := sorry
end DyadicLeft

section DyadicBadLevel
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- right_bad_level_prime_survives
example (φ : DirichletCharacter ℚ_[2] 4) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure 2 (1 : DirichletCharacter ℚ_[2] 1) φ 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) e).toContinuousMap : ℚ_[2])=1 := sorry
-- left_bad_level_prime_vanishes
example (ψ : DirichletCharacter ℚ_[2] 4) (e : ℕ) :
    (integralTwistedPositiveEisensteinMeasure 2 ψ (1 : DirichletCharacter ℚ_[2] 1) 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter ℚ_[2] (2^0)) e).toContinuousMap : ℚ_[2])=0 := sorry
end DyadicBadLevel
end
end SuggestedTwistedEulerTests

/-! Common algebraic coefficients for the positive classical comparison.
The classical modular form and its positive coefficient formula are explicit
inputs. The primitive character Eisenstein construction remains with the
existing ModularForms roadmap. The full module remains NOT COMPILED because
its required pinned TwistedDivisorSum artifact is unavailable. -/
namespace DirichletPadic
noncomputable section
open scoped AbstractMeasure MatrixGroups ModularForm PowerSeries.WithPiTopology
open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane

theorem twistedDivisorSum_ringHomComp {R S : Type*} [CommRing R] [CommRing S]
    (j : R →+* S) {D E : ℕ} (ψ : DirichletCharacter R D) (φ : DirichletCharacter R E)
    (e n : ℕ) :
    j (DirichletCharacter.twistedDivisorSum e ψ φ n)=
      DirichletCharacter.twistedDivisorSum e (ψ.ringHomComp j) (φ.ringHomComp j) n := sorry

variable (p : ℕ) [Fact p.Prime]
variable {F K : Type*} [Field F] [NormedField K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
variable (ιC : F →+* ℂ) (ιK : F →+* K) {D E N : ℕ} [NeZero N]
local notation "O" => Valuation.integer (NormedField.valuation (K := K))

theorem integralTwistedPositiveEisensteinSeries_classical_positive
    (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (k : ℕ)
    (f : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hf : ∀ n : ℕ+, (qExpansion 1 f).coeff (n : ℕ)=
      ιC (DirichletCharacter.twistedDivisorSum (k-1) ψ φ (n : ℕ))) :
    let g : ModularForm ((Gamma1 (p*N)).map (mapGL ℝ)) (k : ℤ) :=
      ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left N p)) f-
        ιC (φ p*(p : F)^(k-1)) •
          TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL N p) f
    ∃! Q : PowerSeries F,
      PowerSeries.map ιC Q=qExpansion 1 g-PowerSeries.C ((qExpansion 1 g).coeff 0) ∧
      PowerSeries.map ιK Q=
        PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
            (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) (k-1)).toContinuousMap) := sorry

theorem integralTwistedPositiveEisensteinSeries_classical_full
    (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (k : ℕ)
    (f : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hf : ∀ n : ℕ+, (qExpansion 1 f).coeff (n : ℕ)=
      ιC (DirichletCharacter.twistedDivisorSum (k-1) ψ φ (n : ℕ)))
    (c : F) (h0 : (qExpansion 1 f).coeff 0=ιC c) :
    let g : ModularForm ((Gamma1 (p*N)).map (mapGL ℝ)) (k : ℤ) :=
      ModularForm.ofLe (Gamma1_map_le_Gamma1_map_of_dvd (dvd_mul_left N p)) f-
        ιC (φ p*(p : F)^(k-1)) •
          TauCeti.ModularForm.levelRaise p (TauCeti.Gamma1_map_le_conjAct_scaleGL N p) f
    ∃! Q : PowerSeries F,
      PowerSeries.map ιC Q=qExpansion 1 g ∧
      PowerSeries.map ιK Q=PowerSeries.C (ιK ((1-φ p*(p : F)^(k-1))*c))+
        PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
          (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
            (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) (k-1)).toContinuousMap) := sorry
end
end DirichletPadic

namespace SuggestedClassicalTwistedTests
noncomputable section
open scoped AbstractMeasure MatrixGroups ModularForm PowerSeries.WithPiTopology
open Matrix.SpecialLinearGroup CongruenceSubgroup UpperHalfPlane DirichletPadic
section Algebra
variable {F K : Type*} [Field F] [NormedField K] [IsUltrametricDist K]
variable (ιK : F →+* K) {D E : ℕ}
-- identity_preserves_native_divisor_sum
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e n : ℕ) :
    DirichletCharacter.twistedDivisorSum e (ψ.ringHomComp (RingHom.id F))
      (φ.ringHomComp (RingHom.id F)) n=DirichletCharacter.twistedDivisorSum e ψ φ n := sorry
-- embedding_preserves_native_zero
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ) :
    ιK (DirichletCharacter.twistedDivisorSum e ψ φ 0)=0 := sorry
-- nonreal_prime_value_survives_embedding
example [Algebra ℤ_[2] K] [IsBoundedSMul ℤ_[2] K]
    (i : F) (hi : i^2=-1) (ψ : DirichletCharacter F 5) (hψ : ψ 2=i) :
    (integralTwistedPositiveEisensteinMeasure 2 (ψ.ringHomComp ιK)
      ((1 : DirichletCharacter F 1).ringHomComp ιK) 2
      (integralPrimePowerArithmeticCharacter 2 0 (1 : DirichletCharacter K (2^0)) 2).toContinuousMap : K)=ιK i := sorry
end Algebra

section Common
variable {p : ℕ} [Fact p.Prime] {F K : Type*} [Field F] [NormedField K]
  [IsUltrametricDist K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
variable (ιC : F →+* ℂ) (ιK : F →+* K) {D E N : ℕ} [NeZero N]
-- common_positive_zero_constant
example (Q : PowerSeries F) (k : ℕ)
    (g : ModularForm ((Gamma1 N).map (mapGL ℝ)) (k : ℤ))
    (hQ : PowerSeries.map ιC Q=qExpansion 1 g-PowerSeries.C ((qExpansion 1 g).coeff 0)) :
    Q.coeff 0=0 := sorry
-- common_positive_first_coefficient
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ)
    (Q : PowerSeries F)
    (hQ : PowerSeries.map ιK Q=
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
          (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)) :
    Q.coeff 1=1 := sorry
-- one_embedding_already_determines_common_series
example (Q Q' : PowerSeries F) (h : PowerSeries.map ιC Q=PowerSeries.map ιC Q') : Q=Q' := sorry
-- supplied_constant_has_euler_factor
example (ψ : DirichletCharacter F D) (φ : DirichletCharacter F E) (e : ℕ)
    (c : F) (Q : PowerSeries F)
    (hQ : PowerSeries.map ιK Q=PowerSeries.C (ιK ((1-φ p*(p : F)^e)*c))+
      PowerSeries.map (Valuation.integer (NormedField.valuation (K := K))).subtype
        (integralTwistedPositiveEisensteinSeries p (ψ.ringHomComp ιK) (φ.ringHomComp ιK)
          (integralPrimePowerArithmeticCharacter p 0 (1 : DirichletCharacter K (p^0)) e).toContinuousMap)) :
    Q.coeff 0=(1-φ p*(p : F)^e)*c := sorry
end Common

-- fixed_weight_constant_can_be_nonintegral
example : ‖(-7/240 : ℚ_[2])‖>1 := sorry
-- zero_truncation_cannot_supply_full_constant
example (Q : PowerSeries ℚ) (hQ : Q.coeff 0=(-7/240 : ℚ)) :
    Q≠Q-PowerSeries.C (Q.coeff 0) := sorry
end
end SuggestedClassicalTwistedTests

/-! Canonical principal mass and its logarithm series. The general logarithmic
moment and local logarithm belong to ColemanIntegration. These signatures only
compare the actual arithmetic numerator and give its finite precision controls.
No Coleman suggested-module import is made, since it already imports this file.
No analytic branch, pole order or residue is asserted here. -/
namespace DirichletPadic
noncomputable section
open scoped BigOperators
variable (p : ℕ) [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

theorem intrinsicSmoothedNumerator_canonical_logarithmic_series (ha : ¬p∣p+1) :
    HasSum (fun n : ℕ => ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n)
      (-(p : ℚ_[p])/((p : ℚ_[p])-1)*
        algebraMap ℤ_[p] ℚ_[p] (intrinsicSmoothedNumerator p (p+1) ha 1)) := sorry

theorem intrinsicSmoothedNumerator_canonical_logarithmic_error
    (ha : ¬p∣p+1) (N : ℕ) (hN : 1≤N) :
    ‖algebraMap ℤ_[p] ℚ_[p] (intrinsicSmoothedNumerator p (p+1) ha 1)+
      (1-(p : ℚ_[p])⁻¹)*(∑ n∈Finset.range N,
        ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n)‖ ≤
      (p : ℝ)*(p : ℝ)^(-(((N+1)/2 : ℕ) : ℤ)) := sorry

theorem intrinsicSmoothedNumerator_canonical_logarithmic_norm (ha : ¬p∣p+1) :
    ‖∑' n : ℕ, ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n‖=
      (if p=2 then (1/4 : ℝ) else (p : ℝ)⁻¹) ∧
    (∑' n : ℕ, ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n)≠0 := sorry
end
end DirichletPadic

namespace SuggestedPrincipalLogarithmicTests
noncomputable section
open DirichletPadic
open scoped BigOperators
section Dyadic
variable [IsBoundedSMul ℤ_[2] ℚ_[2]]
-- dyadic_mass_series_sign
example : HasSum (fun n : ℕ => ((-1 : ℚ_[2])^(n+1)/(n : ℚ_[2]))*(2 : ℚ_[2])^n)
    (-2*algebraMap ℤ_[2] ℚ_[2] (intrinsicSmoothedNumerator 2 3 (by norm_num) 1)) := sorry
-- dyadic_positive_sign_fails
example : (∑' n : ℕ, ((-1 : ℚ_[2])^(n+1)/(n : ℚ_[2]))*(2 : ℚ_[2])^n)≠
    2*algebraMap ℤ_[2] ℚ_[2] (intrinsicSmoothedNumerator 2 3 (by norm_num) 1) := sorry
-- dyadic_zero_early_sum
example : (∑ n∈Finset.range 3, ((-1 : ℚ_[2])^(n+1)/(n : ℚ_[2]))*(2 : ℚ_[2])^n)=0 := sorry
-- dyadic_five_term_mass_error
example : ‖algebraMap ℤ_[2] ℚ_[2] (intrinsicSmoothedNumerator 2 3 (by norm_num) 1)-2/3‖≤
    (1/4 : ℝ) := sorry
-- dyadic_log_norm
example : ‖∑' n : ℕ, ((-1 : ℚ_[2])^(n+1)/(n : ℚ_[2]))*(2 : ℚ_[2])^n‖=(1/4 : ℝ) := sorry
end Dyadic
section Ternary
variable [IsBoundedSMul ℤ_[3] ℚ_[3]]
-- ternary_mass_series_factor
example : HasSum (fun n : ℕ => ((-1 : ℚ_[3])^(n+1)/(n : ℚ_[3]))*(3 : ℚ_[3])^n)
    ((-3/2 : ℚ_[3])*algebraMap ℤ_[3] ℚ_[3] (intrinsicSmoothedNumerator 3 4 (by norm_num) 1)) := sorry
-- ternary_log_norm
example : ‖∑' n : ℕ, ((-1 : ℚ_[3])^(n+1)/(n : ℚ_[3]))*(3 : ℚ_[3])^n‖=(1/3 : ℝ) := sorry
end Ternary
section AllPrimes
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
-- precision_cutoff_twice_successor
example (ha : ¬p∣p+1) (r : ℕ) :
    ‖algebraMap ℤ_[p] ℚ_[p] (intrinsicSmoothedNumerator p (p+1) ha 1)+
      (1-(p : ℚ_[p])⁻¹)*(∑ n∈Finset.range (2*(r+1)),
        ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n)‖≤
      (p : ℝ)^(-(r : ℤ)) := sorry
-- totalized_zero_term
example : ((-1 : ℚ_[p])^(0+1)/(0 : ℚ_[p]))*(p : ℚ_[p])^0=0 := sorry
-- logarithm_sum_nonzero
example : (∑' n : ℕ, ((-1 : ℚ_[p])^(n+1)/(n : ℚ_[p]))*(p : ℚ_[p])^n)≠0 := sorry
end AllPrimes
end
end SuggestedPrincipalLogarithmicTests
