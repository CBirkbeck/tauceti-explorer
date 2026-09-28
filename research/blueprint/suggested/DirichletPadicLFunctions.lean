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
