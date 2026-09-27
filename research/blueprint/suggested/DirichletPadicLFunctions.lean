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
The analytic Mellin proof remains separate L0 work.
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
