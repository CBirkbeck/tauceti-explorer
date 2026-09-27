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
