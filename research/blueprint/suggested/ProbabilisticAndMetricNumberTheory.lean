import Mathlib.Algebra.ContinuedFractions.Basic
import Mathlib.Algebra.ContinuedFractions.Computation.Approximations
import Mathlib.Algebra.ContinuedFractions.Computation.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Real.OfDigits
import Mathlib.Dynamics.BirkhoffSum.Average
import Mathlib.Dynamics.Ergodic.AddCircle
import Mathlib.Dynamics.Ergodic.Ergodic
import Mathlib.MeasureTheory.Function.ConditionalExpectation.Basic
import Mathlib.MeasureTheory.MeasurableSpace.Invariants
import Mathlib.MeasureTheory.Measure.Hausdorff
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.NumberTheory.ArithmeticFunction.Defs
import Mathlib.NumberTheory.ArithmeticFunction.Liouville
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Distributions.Geometric
import Mathlib.Probability.Independence.Basic
import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.Topology.MetricSpace.HausdorffDimension
import Mathlib.Data.Int.CardIntervalMod
import Mathlib.Probability.CDF
import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.Data.ZMod.QuotientRing
/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: GPT-6 Astra Pro (astra-20260926-pm-83c1), Codex (codex-a71f92), Claude Code (cc-fb70e5), Claude Code (cc-39fac3)
-/
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.GCDMonoid.FinsetLemmas
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Algebra.Order.Antidiag.FinsuppEquiv
import Mathlib.Data.Fintype.Perm
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Algebra.BigOperators.Associated
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Data.Nat.Choose.Sum
import TauCeti.Probability.Process.EmpiricalMeasure
import TauCeti.Probability.Distributions.Gaussian.Moments
import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.MeasureTheory.Measure.Portmanteau
import Mathlib.MeasureTheory.Measure.DiracProba
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Data.Matrix.Mul
import Mathlib.NumberTheory.WellApproximable
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Order.LiminfLimsup
import Mathlib.Data.Nat.Totient
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal

/-!
# Suggested finite arithmetic probability signatures

This file is a suggested signature skeleton, not the roadmap and not an exhaustive
file plan. The companion Markdown and JSON mathematical contracts are definitive;
names and signatures are suggestions. Pinned elaboration is recorded in the handoff.
Proof placeholders are not formalization evidence. Target pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Reuse empiricalMeasure and ArithmeticFunction. The local notation below introduces
no new carrier. The sample has m+1 positive integers and never contains zero.
-/

noncomputable section
open MeasureTheory
open scoped BigOperators

namespace TauCeti.Probability.Arithmetic

local notation "uLaw" =>
  (fun m : ℕ => (TauCeti.Probability.empiricalMeasure (fun k : ℕ => k + 1) m : Measure ℕ))

/-- PM.0/prime-divisibility-sum: zero-extended finite weighted divisor sum.
Primality is required by the arithmetic laws, not by this constructor. -/
def primeDivisibilitySum (P : Finset ℕ) (a : ℕ → ℝ) : ArithmeticFunction ℝ := by
  sorry

/-- PM.0/positive-evaluation. -/
theorem primeDivisibilitySum_apply (P : Finset ℕ) (a : ℕ → ℝ)
    {n : ℕ} (hn : 0 < n) :
    primeDivisibilitySum P a n = ∑ p ∈ P, if p ∣ n then a p else 0 := by
  sorry

/-- PM.0/empty-truncation. -/
theorem primeDivisibilitySum_empty (a : ℕ → ℝ) :
    primeDivisibilitySum ∅ a = 0 := by
  sorry

/-- PM.0/coefficient-congruence. -/
theorem primeDivisibilitySum_congr (P : Finset ℕ) (a b : ℕ → ℝ)
    (hab : ∀ p ∈ P, a p = b p) :
    primeDivisibilitySum P a = primeDivisibilitySum P b := by
  sorry

/-- PM.0/coefficient-addition. These are pointwise additions, not convolution. -/
theorem primeDivisibilitySum_add (P : Finset ℕ) (a b : ℕ → ℝ) :
    primeDivisibilitySum P (fun p => a p + b p) =
      primeDivisibilitySum P a + primeDivisibilitySum P b := by
  sorry

/-- PM.0/coprime-additivity. -/
theorem primeDivisibilitySum_mul_of_coprime (P : Finset ℕ) (a : ℕ → ℝ)
    (hP : ∀ p ∈ P, Nat.Prime p) {u v : ℕ} (hu : 0 < u) (hv : 0 < v)
    (huv : Nat.Coprime u v) :
    primeDivisibilitySum P a (u * v) =
      primeDivisibilitySum P a u + primeDivisibilitySum P a v := by
  sorry

/-- PM.0/prime-power-evaluation. -/
theorem primeDivisibilitySum_prime_pow (P : Finset ℕ) (a : ℕ → ℝ)
    (hP : ∀ p ∈ P, Nat.Prime p) {q k : ℕ} (hq : Nat.Prime q) (hk : 0 < k) :
    primeDivisibilitySum P a (q ^ k) = if q ∈ P then a q else 0 := by
  sorry

/-- PM.0/omega-compatibility: consume the existing distinct-factor count. -/
theorem primeDivisibilitySum_primeFactors (n : ℕ) :
    primeDivisibilitySum n.primeFactors (fun _ => 1) n =
      (ArithmeticFunction.cardDistinctFactors n : ℝ) := by
  sorry

/-- PM.0/divisibility-probability: Nat.card_multiples is imported, not rebuilt. -/
theorem divisibility_probability (m d : ℕ) (hd : 0 < d) :
    ((uLaw m) {n : ℕ | d ∣ n}).toReal =
      (((m + 1) / d : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/divisibility-error: the remainder sign is part of the contract. -/
theorem divisibility_error (m d : ℕ) (hd : 0 < d) :
    let e : ℝ := ((uLaw m) {n : ℕ | d ∣ n}).toReal - 1 / (d : ℝ)
    e = -(((m + 1) % d : ℕ) : ℝ) / (((m + 1 : ℕ) : ℝ) * (d : ℝ)) ∧
      -(1 / ((m + 1 : ℕ) : ℝ)) < e ∧ e ≤ 0 ∧ |e| ≤ 1 / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/joint-divisibility: lcm is necessary without coprimality. -/
theorem joint_divisibility_probability (m d e : ℕ) (hd : 0 < d) (he : 0 < e) :
    ((uLaw m) {n : ℕ | d ∣ n ∧ e ∣ n}).toReal =
      (((m + 1) / Nat.lcm d e : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/weighted-mean. -/
theorem primeDivisibilitySum_mean (m : ℕ) (P : Finset ℕ) (a : ℕ → ℝ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    (∫ n, primeDivisibilitySum P a n ∂(uLaw m)) =
      ∑ p ∈ P, a p * (((m + 1) / p : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/weighted-mean-error: model centering need not be the empirical mean. -/
theorem primeDivisibilitySum_mean_error (m : ℕ) (P : Finset ℕ) (a : ℕ → ℝ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    |(∫ n, primeDivisibilitySum P a n ∂(uLaw m)) - ∑ p ∈ P, a p / (p : ℝ)| ≤
      (∑ p ∈ P, |a p|) / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/centered-pair-identity. No primality is used here. -/
theorem centered_pair_identity (m p q : ℕ) (hp : 0 < p) (hq : 0 < q) :
    (∫ n : ℕ, ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) *
      ((if q ∣ n then (1 : ℝ) else 0) - 1 / (q : ℝ)) ∂(uLaw m)) =
      (((m + 1) / Nat.lcm p q : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ) -
      (((m + 1) / p : ℕ) : ℝ) / (((m + 1 : ℕ) : ℝ) * (q : ℝ)) -
      (((m + 1) / q : ℕ) : ℝ) / (((m + 1 : ℕ) : ℝ) * (p : ℝ)) +
      1 / ((p : ℝ) * (q : ℝ)) := by
  sorry

/-- PM.0/centered-pair-error: the diagonal is present, not an independence premise. -/
theorem centered_pair_error (m p q : ℕ) (hp : Nat.Prime p) (hq : Nat.Prime q) :
    |(∫ n : ℕ, ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) *
      ((if q ∣ n then (1 : ℝ) else 0) - 1 / (q : ℝ)) ∂(uLaw m)) -
        (if p = q then 1 / (p : ℝ) - 1 / (p : ℝ) ^ 2 else 0)| ≤
      2 / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/second-moment-comparison: centered about A, not about an assumed exact mean. -/
theorem primeDivisibilitySum_secondMoment_error (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) :
    let A : ℝ := ∑ p ∈ P, a p / (p : ℝ)
    let L : ℝ := ∑ p ∈ P, |a p|
    let V : ℝ := ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2)
    |(∫ n, (primeDivisibilitySum P a n - A) ^ 2 ∂(uLaw m)) - V| ≤
      2 * L ^ 2 / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/complete-period-moments: the exact mean also follows from the mean formula. -/
theorem primeDivisibilitySum_secondMoment_completePeriod (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p)
    (hperiod : (∏ p ∈ P, p) ∣ m + 1) :
    (∫ n, (primeDivisibilitySum P a n - ∑ p ∈ P, a p / (p : ℝ)) ^ 2 ∂(uLaw m)) =
      ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2) := by
  sorry

/-! ## Five constructor/API regression contracts; placeholders are not proofs -/

/-- weighted_twelve -/
example : primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 12 = 5 := by
  sorry

/-- zero_extension: an unguarded sum would give 5. -/
example : primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 0 = 0 := by
  sorry

/-- unit -/
example (P : Finset ℕ) (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) :
    primeDivisibilitySum P a 1 = 0 := by
  sorry

/-- omega_twelve: distinct factors, not multiplicity. -/
example : primeDivisibilitySum (12 : ℕ).primeFactors (fun _ => 1) 12 = 2 ∧
    ArithmeticFunction.cardDistinctFactors 12 = 2 ∧
    ArithmeticFunction.cardFactors 12 = 3 := by
  sorry

/-- not_completely_additive -/
example : primeDivisibilitySum {2} (fun _ => 2) 4 = 2 ∧
    primeDivisibilitySum {2} (fun _ => 2) 4 ≠
      primeDivisibilitySum {2} (fun _ => 2) 2 + primeDivisibilitySum {2} (fun _ => 2) 2 := by
  sorry

/-- PM.0/simultaneous-divisibility: the product equals the finite lcm only for
pairwise coprime factors. Empty products are one. -/
theorem simultaneous_divisibility_probability (m : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    ((uLaw m) {n : ℕ | ∀ p ∈ P, p ∣ n}).toReal =
      (((m + 1) / (∏ p ∈ P, p) : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/divisibility-pattern-formula: all signed calculations are in the reals. -/
theorem divisibility_pattern_formula (m : ℕ) (S T : Finset ℕ)
    (hS : ∀ p ∈ S, Nat.Prime p) (hT : ∀ q ∈ T, Nat.Prime q)
    (hST : Disjoint S T) :
    ((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ T, ¬ q ∣ n)}).toReal =
      ∑ U ∈ T.powerset, (-1 : ℝ) ^ U.card *
        ((((m + 1) / (∏ p ∈ S ∪ U, p) : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ)) := by
  sorry

/-- PM.0/divisibility-pattern-error. No assertion of exact independence at arbitrary m. -/
theorem divisibility_pattern_error (m : ℕ) (S T : Finset ℕ)
    (hS : ∀ p ∈ S, Nat.Prime p) (hT : ∀ q ∈ T, Nat.Prime q)
    (hST : Disjoint S T) :
    |((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ T, ¬ q ∣ n)}).toReal -
      (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ T, (1 - 1 / (q : ℝ)))| ≤
      (2 : ℝ) ^ T.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/complete-period-joint-law: every Boolean atom has the Bernoulli-product mass. -/
theorem divisibility_pattern_completePeriod (m : ℕ) (S T : Finset ℕ)
    (hS : ∀ p ∈ S, Nat.Prime p) (hT : ∀ q ∈ T, Nat.Prime q)
    (hST : Disjoint S T) (hperiod : (∏ p ∈ S ∪ T, p) ∣ m + 1) :
    ((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ T, ¬ q ∣ n)}).toReal =
      (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ T, (1 - 1 / (q : ℝ))) := by
  sorry

/-- PM.0/divisibility-pattern-summed-error: an explicit sum over all Boolean atoms,
not a newly defined total-variation carrier. -/
theorem divisibility_pattern_summed_error (m : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    (∑ S ∈ P.powerset,
      |((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ P \ S, ¬ q ∣ n)}).toReal -
        (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ P \ S, (1 - 1 / (q : ℝ)))|) ≤
      (3 : ℝ) ^ P.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-! ## Ten finite-pattern regression contracts -/

/-- incomplete_all: the product exceeds the sample. -/
example : ((uLaw 4) {n : ℕ | 2 ∣ n ∧ 3 ∣ n}).toReal = 0 := by
  sorry

/-- incomplete_signed: not equal to the Bernoulli mass 1/3. -/
example : ((uLaw 4) {n : ℕ | 2 ∣ n ∧ ¬ 3 ∣ n}).toReal = 2 / 5 := by
  sorry

/-- complete_signed -/
example : ((uLaw 5) {n : ℕ | 2 ∣ n ∧ ¬ 3 ∣ n}).toReal = 1 / 3 := by
  sorry

/-- complete_none -/
example : ((uLaw 5) {n : ℕ | ¬ 2 ∣ n ∧ ¬ 3 ∣ n}).toReal = 1 / 3 := by
  sorry

/-- complete_only_three -/
example : ((uLaw 5) {n : ℕ | 3 ∣ n ∧ ¬ 2 ∣ n}).toReal = 1 / 6 := by
  sorry

/-- empty_constraints: the unique empty Boolean pattern has mass one. -/
example (m : ℕ) :
    ((uLaw m) {n : ℕ | (∀ p ∈ (∅ : Finset ℕ), p ∣ n) ∧
      (∀ q ∈ (∅ : Finset ℕ), ¬ q ∣ n)}).toReal = 1 := by
  sorry

/-- overlap_rejection: the event is empty, even on complete periods. -/
example (m : ℕ) : ((uLaw m) {n : ℕ | 2 ∣ n ∧ ¬ 2 ∣ n}).toReal = 0 ∧
    (1 / (2 : ℝ)) * (1 - 1 / 2) = 1 / 4 := by
  sorry

/-- composite_rejection: the correct joint divisor is lcm(2,4)=4, not 8. -/
example : ((uLaw 3) {n : ℕ | 2 ∣ n ∧ 4 ∣ n}).toReal = 1 / 4 := by
  sorry

/-- one_positive_sample: zero is not accidentally included. -/
example : ((uLaw 0) {n : ℕ | ¬ 2 ∣ n}).toReal = 1 := by
  sorry

/-- summed_atom_error_five: the four errors sum to 1/3, not zero. -/
example :
    (∑ S ∈ ({2, 3} : Finset ℕ).powerset,
      |((uLaw 4) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧
        (∀ q ∈ ({2, 3} : Finset ℕ) \ S, ¬ q ∣ n)}).toReal -
        (∏ p ∈ S, 1 / (p : ℝ)) *
          (∏ q ∈ ({2, 3} : Finset ℕ) \ S, (1 - 1 / (q : ℝ)))|) = 1 / 3 := by
  sorry

/-! ## Centered mixed products and weighted moments -/

/-- PM.0/centered-product-expansion. Exponent zero is allowed. -/
theorem centered_prime_product_expansion (m : ℕ) (P : Finset ℕ) (α : ℕ → ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    let v : ℕ → ℝ := fun p => (-(1 / (p : ℝ))) ^ α p
    let w : ℕ → ℝ := fun p => (1 - 1 / (p : ℝ)) ^ α p - v p
    (∫ n : ℕ, (∏ p ∈ P,
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ α p) ∂(uLaw m)) =
      ∑ D ∈ P.powerset, (∏ p ∈ D, w p) * (∏ p ∈ P \ D, v p) *
        ((((m + 1) / (∏ p ∈ D, p) : ℕ) : ℝ) / ((m + 1 : ℕ) : ℝ)) := by
  sorry

/-- PM.0/centered-product-error. The empty subset contributes no remainder. -/
theorem centered_prime_product_error (m : ℕ) (P : Finset ℕ) (α : ℕ → ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    let v : ℕ → ℝ := fun p => (-(1 / (p : ℝ))) ^ α p
    let w : ℕ → ℝ := fun p => (1 - 1 / (p : ℝ)) ^ α p - v p
    |(∫ n : ℕ, (∏ p ∈ P,
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ α p) ∂(uLaw m)) -
      ∏ p ∈ P, (v p + w p / (p : ℝ))| ≤
        ((∏ p ∈ P, (|v p| + |w p|)) - ∏ p ∈ P, |v p|) /
          ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/centered-product-uniform-error. Uniform in all natural exponents. -/
theorem centered_prime_product_uniform_error (m : ℕ) (P : Finset ℕ) (α : ℕ → ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    |(∫ n : ℕ, (∏ p ∈ P,
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ α p) ∂(uLaw m)) -
      ∏ p ∈ P, ((1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) ^ α p +
        (1 - 1 / (p : ℝ)) * (-(1 / (p : ℝ))) ^ α p)| ≤
          (3 / 2 : ℝ) ^ P.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- PM.0/complete-period-centered-product. This is an arithmetic specialization,
not a new generic independent-product integration theorem. -/
theorem centered_prime_product_completePeriod (m : ℕ) (P : Finset ℕ) (α : ℕ → ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) (hperiod : (∏ p ∈ P, p) ∣ m + 1) :
    (∫ n : ℕ, (∏ p ∈ P,
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ α p) ∂(uLaw m)) =
      ∏ p ∈ P, ((1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) ^ α p +
        (1 - 1 / (p : ℝ)) * (-(1 / (p : ℝ))) ^ α p) := by
  sorry

/-- PM.0/weighted-moment-comparison. Each tuple keeps its repeated prime coordinates.
The product is over its image; alpha records fiber cardinalities. -/
theorem primeDivisibilitySum_moment_error (m k : ℕ) (P : Finset ℕ) (a : ℕ → ℝ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    let A : ℝ := ∑ p ∈ P, a p / (p : ℝ)
    let L : ℝ := ∑ p ∈ P, |a p|
    let G : (Fin k → ℕ) → ℝ := fun t =>
      ∏ p ∈ Finset.univ.image t,
        (1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) ^
          (Finset.univ.filter (fun j => t j = p)).card +
        (1 - 1 / (p : ℝ)) * (-(1 / (p : ℝ))) ^
          (Finset.univ.filter (fun j => t j = p)).card
    |(∫ n, (primeDivisibilitySum P a n - A) ^ k ∂(uLaw m)) -
      ∑ t ∈ Fintype.piFinset (fun _ : Fin k => P), (∏ j, a (t j)) * G t| ≤
        (3 / 2 : ℝ) ^ k * L ^ k / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-! ## Centered-moment regression contracts -/

/-- centered_zero_exponents -/
example (m : ℕ) (P : Finset ℕ) :
    (∫ n : ℕ, (∏ p ∈ P,
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ (0 : ℕ)) ∂(uLaw m)) = 1 := by
  sorry

/-- centered_empty_product -/
example (m : ℕ) (α : ℕ → ℕ) :
    (∫ n : ℕ, (∏ p ∈ (∅ : Finset ℕ),
      ((if p ∣ n then (1 : ℝ) else 0) - 1 / (p : ℝ)) ^ α p) ∂(uLaw m)) = 1 := by
  sorry

/-- centered_two_square: exact even without a complete period. -/
example (m : ℕ) :
    (∫ n : ℕ, ((if 2 ∣ n then (1 : ℝ) else 0) - 1 / 2) ^ 2 ∂(uLaw m)) =
      1 / 4 := by
  sorry

/-- centered_two_square_sharp_bound: w=0 gives zero numerator. -/
example :
    (|(-(1 / 2 : ℝ)) ^ 2| + |(1 - (1 / 2 : ℝ)) ^ 2 - (-(1 / 2 : ℝ)) ^ 2|) -
      |(-(1 / 2 : ℝ)) ^ 2| = 0 := by
  sorry

/-- centered_three_cube: an odd Bernoulli moment need not vanish. -/
example :
    (∫ n : ℕ, ((if 3 ∣ n then (1 : ℝ) else 0) - 1 / 3) ^ 3 ∂(uLaw 2)) =
      2 / 27 := by
  sorry

/-- centered_incomplete_pair: distinct arithmetic indicators are not independent. -/
example :
    (∫ n : ℕ, ((if 2 ∣ n then (1 : ℝ) else 0) - 1 / 2) *
      ((if 3 ∣ n then (1 : ℝ) else 0) - 1 / 3) ∂(uLaw 4)) = -(1 / 15) := by
  sorry

/-- centered_complete_pair -/
example :
    (∫ n : ℕ, ((if 2 ∣ n then (1 : ℝ) else 0) - 1 / 2) *
      ((if 3 ∣ n then (1 : ℝ) else 0) - 1 / 3) ∂(uLaw 5)) = 0 := by
  sorry

/-- weighted_signed_cube: a=-1 at 3, complete period 3. -/
example :
    (∫ n, (primeDivisibilitySum {3} (fun _ => -1) n + 1 / 3) ^ 3 ∂(uLaw 2)) =
      -(2 / 27) := by
  sorry

/-- weighted_zeroth_moment: 0^0 is 1 in the moment convention. -/
example (m : ℕ) :
    (∫ n, (primeDivisibilitySum ∅ (fun _ => 0) n - 0) ^ (0 : ℕ) ∂(uLaw m)) = 1 := by
  sorry

/-- weighted_empty_positive_moment -/
example (m : ℕ) (a : ℕ → ℝ) {k : ℕ} (hk : 0 < k) :
    (∫ n, (primeDivisibilitySum ∅ a n - 0) ^ k ∂(uLaw m)) = 0 := by
  sorry

/-! ## Finite unweighted Gaussian moment comparison

These local abbreviations are only notation for finite expressions, not new
definitions or probability carriers. Unit weights and prime indices are essential.
-/

local notation "νPrime" => (fun (p e : ℕ) =>
  (1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) ^ e +
    (1 - 1 / (p : ℝ)) * (-(1 / (p : ℝ))) ^ e)
local notation "vPrime" => (fun p : ℕ => (1 / (p : ℝ)) * (1 - 1 / (p : ℝ)))
local notation "vTotal" => (fun P : Finset ℕ => ∑ p ∈ P, vPrime p)
local notation "hSubset" => (fun (P : Finset ℕ) (r : ℕ) =>
  ∑ S ∈ Finset.powersetCard r P, ∏ p ∈ S, vPrime p)
local notation "dTuple" => (fun (P : Finset ℕ) (r : ℕ) =>
  ∑ t ∈ Finset.filter Function.Injective (Fintype.piFinset (fun _ : Fin r => P)),
    ∏ j, vPrime (t j))
local notation "multiMoment" => (fun (P : Finset ℕ) (k : ℕ) =>
  ∑ α ∈ Finset.piAntidiag P k, (Nat.multinomial P α : ℝ) * ∏ p ∈ P, νPrime p (α p))
local notation "gaussCoeff" => (fun r : ℕ =>
  (Nat.factorial (2 * r) : ℝ) / ((2 : ℝ)^r * (Nat.factorial r : ℝ)))
local notation "smallBound" => (fun (k : ℕ) (V : ℝ) =>
  (Nat.factorial k : ℝ) * ∑ s ∈ Finset.Icc 1 ((k - 1) / 2),
    (Nat.choose (k - s - 1) (s - 1) : ℝ) * V^s /
      ((2 : ℝ)^s * (Nat.factorial s : ℝ)))

/-- PM.1/local-factor-bound. Prime 2 is included; exponent one vanishes. -/
theorem centered_prime_factor_bound (p e : ℕ) (hp : p.Prime) (he : 2 ≤ e) :
    0 ≤ νPrime p e ∧ νPrime p e ≤ vPrime p := by
  sorry

/-- PM.1/model-multinomial-expansion. M is the inherited unit-weight tuple model. -/
theorem prime_model_multinomial (P : Finset ℕ) (k : ℕ)
    (hP : ∀ p ∈ P, p.Prime) :
    (∑ t ∈ Fintype.piFinset (fun _ : Fin k => P),
      ∏ p ∈ Finset.univ.image t,
        νPrime p ((Finset.univ.filter (fun j => t j = p)).card)) =
      multiMoment P k := by
  sorry

/-- PM.1/paired-support-formula. There is one multiplicity assignment per r-subset. -/
theorem prime_model_paired_support (P : Finset ℕ) (r : ℕ)
    (hP : ∀ p ∈ P, p.Prime) :
    (∑ α ∈ (P.piAntidiag (2*r)).filter (fun α =>
        ∀ p ∈ P, α p = 0 ∨ α p = 2),
      (Nat.multinomial P α : ℝ) * ∏ p ∈ P, νPrime p (α p)) =
      ((2*r).factorial : ℝ) / (2 : ℝ)^r * hSubset P r := by
  sorry

/-- PM.1/distinct-prime-tuples. Existing equivalence cardinality supplies r!. -/
theorem prime_variance_distinct_tuples (P : Finset ℕ) (r : ℕ)
    (hP : ∀ p ∈ P, p.Prime) :
    dTuple P r = (r.factorial : ℝ) * hSubset P r := by
  sorry

/-- PM.1/prime-collision-bound. No division by total variance, so empty P is allowed. -/
theorem prime_variance_collision (P : Finset ℕ) (r : ℕ)
    (hP : ∀ p ∈ P, p.Prime) (hr : 2 ≤ r) :
    let V := vTotal P
    let Q := ∑ p ∈ P, (vPrime p)^2
    0 ≤ V^r - dTuple P r ∧
      V^r - dTuple P r ≤ (r.choose 2 : ℝ) * Q * V^(r-2) := by
  sorry

/-- PM.1/fixed-support-bound. The weak-composition count has both minus ones. -/
theorem prime_model_fixed_support_bound (S : Finset ℕ) (k : ℕ)
    (hS : ∀ p ∈ S, p.Prime) (hne : S.Nonempty) (hk : 2*S.card ≤ k) :
    let B := ∑ α ∈ (S.piAntidiag k).filter (fun α => ∀ p ∈ S, 2 ≤ α p),
      (Nat.multinomial S α : ℝ) * ∏ p ∈ S, νPrime p (α p)
    0 ≤ B ∧ B ≤
      (k.factorial : ℝ) * ((k - S.card - 1).choose (S.card - 1) : ℝ) /
        (2 : ℝ)^S.card * ∏ p ∈ S, vPrime p := by
  sorry

/-- PM.1/smaller-support-bound. Singleton fibers contribute zero. -/
theorem prime_model_smaller_support_bound (P : Finset ℕ) (k : ℕ)
    (hP : ∀ p ∈ P, p.Prime) (hk : 0 < k) :
    let B := ∑ α ∈ (P.piAntidiag k).filter (fun α =>
        (P.filter (fun p => α p ≠ 0)).card ≤ (k-1)/2),
      (Nat.multinomial P α : ℝ) * ∏ p ∈ P, νPrime p (α p)
    0 ≤ B ∧ B ≤ smallBound k (vTotal P) := by
  sorry

/-- PM.1/finite-even-gaussian-bound. Gaussian evaluation is imported from Tau Ceti. -/
theorem primeDivisibilitySum_even_gaussian_bound (m r : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, p.Prime) (hr : 2 ≤ r) :
    let A : ℝ := ∑ p ∈ P, 1 / (p : ℝ)
    let V := vTotal P
    let Q := ∑ p ∈ P, (vPrime p)^2
    |(∫ n, (primeDivisibilitySum P (fun _ => 1) n - A)^(2*r) ∂(uLaw m)) -
      ProbabilityTheory.centralMoment id (2*r)
        (ProbabilityTheory.gaussianReal 0 (Real.toNNReal V))| ≤
      (3/2 : ℝ)^(2*r) * (P.card : ℝ)^(2*r) / ((m+1 : ℕ) : ℝ) +
        gaussCoeff r * (r.choose 2 : ℝ) * Q * V^(r-2) +
        smallBound (2*r) V := by
  sorry

/-- PM.1/finite-odd-moment-bound. Neither empirical nor model odd moments are set to zero. -/
theorem primeDivisibilitySum_odd_moment_bound (m r : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, p.Prime) :
    let A : ℝ := ∑ p ∈ P, 1 / (p : ℝ)
    |(∫ n, (primeDivisibilitySum P (fun _ => 1) n - A)^(2*r+1) ∂(uLaw m))| ≤
      (3/2 : ℝ)^(2*r+1) * (P.card : ℝ)^(2*r+1) / ((m+1 : ℕ) : ℝ) +
        smallBound (2*r+1) (vTotal P) := by
  sorry

/-! ## Eight finite-Gaussian regression contracts -/

/-- factor_at_three_four: an exponent-four contribution survives below paired support. -/
example : νPrime 3 4 = 2/27 := by
  sorry

/-- odd_two_factor: symmetry at 2, not at every prime. -/
example (r : ℕ) : νPrime 2 (2*r+1) = 0 := by
  sorry

/-- paired_fourth: the paired contribution is not the full fourth moment. -/
example : ((4).factorial : ℝ) / (2 : ℝ)^2 * hSubset {2,3} 2 = 1/3 := by
  sorry

/-- full_fourth: the two single-prime fourth moments must be retained. -/
example : multiMoment {2,3} 4 = 203/432 := by
  sorry

/-- gaussian_fourth_difference: matching variance alone does not match fourth moments. -/
example : multiMoment {2,3} 4 - 3*(vTotal {2,3})^2 = -43/216 := by
  sorry

/-- collision_two: with one available prime, no injective two-tuple exists. -/
example : (vTotal {3})^2 - dTuple {3} 2 = (2/9 : ℝ)^2 := by
  sorry

/-- zero_order_model: empty prime set, nonempty empty-tuple convention. -/
example : multiMoment ∅ 0 = 1 ∧ hSubset ∅ 0 = 1 ∧ dTuple ∅ 0 = 1 := by
  sorry

/-- incomplete_odd_negative: empirical odd moments need not be nonnegative. -/
example :
    (∫ n, (primeDivisibilitySum {3} (fun _ => 1) n - 1/3)^3 ∂(uLaw 0)) =
      -(1/27) := by
  sorry


/-! ## Deterministic cutoff removal and finite moment transfer

P_z uses the existing inclusive prime set and natural floor. These abbreviations
are local notation only. All moment bounds use the same positive sample.
-/
local notation "primeCut" => (fun z : ℝ => Nat.primesLE ⌊z⌋₊)
local notation "cutMean" => (fun z : ℝ => ∑ p ∈ primeCut z, 1 / (p : ℝ))
local notation "cutCentered" => (fun (z : ℝ) (n : ℕ) =>
  primeDivisibilitySum (primeCut z) (fun _ => 1) n - cutMean z)
local notation "cutError" => (fun (m : ℕ) (z b : ℝ) =>
  Real.log ((m+1 : ℕ) : ℝ) / Real.log z + |cutMean z - b|)
local notation "cutMoment" => (fun (m : ℕ) (z : ℝ) (j : ℕ) =>
  ∫ n, (cutCentered z n)^j ∂(uLaw m))
local notation "evenEnvelope" => (fun (m : ℕ) (z : ℝ) (j : ℕ) =>
  ite (Even j) (cutMoment m z j)
    (Real.sqrt (cutMoment m z (j-1) * cutMoment m z (j+1))))

/-- PM.1/omega-cutoff-identity. Equality at the cutoff belongs to the head. -/
theorem omega_cutoff_identity (n : ℕ) (z : ℝ) (hn : 0 < n) (hz : 0 ≤ z) :
    (ArithmeticFunction.cardDistinctFactors n : ℝ) =
      primeDivisibilitySum (primeCut z) (fun _ => 1) n +
        ((n.primeFactors.filter (fun p : ℕ => z < (p : ℝ))).card : ℝ) := by
  sorry

/-- PM.1/large-prime-log-bound. No logarithmic assertion at n=0 or z=1. -/
theorem large_prime_log_bound (n : ℕ) (z : ℝ) (hn : 0 < n) (hz : 1 < z) :
    ((n.primeFactors.filter (fun p : ℕ => z < (p : ℝ))).card : ℝ) ≤
      Real.log (n : ℝ) / Real.log z := by
  sorry

/-- PM.1/centered-cutoff-error. The center discrepancy is not suppressed. -/
theorem omega_centered_cutoff_error (m n : ℕ) (z b : ℝ) (hz : 1 < z)
    (hn : 0 < n) (hnN : n ≤ m+1) :
    |((ArithmeticFunction.cardDistinctFactors n : ℝ) - b) - cutCentered z n| ≤
      cutError m z b := by
  sorry

/-- PM.1/cutoff-power-error. Absolute lower powers, not signed odd powers. -/
theorem omega_cutoff_power_error (m n k : ℕ) (z b : ℝ) (hz : 1 < z)
    (hn : 0 < n) (hnN : n ≤ m+1) :
    |((ArithmeticFunction.cardDistinctFactors n : ℝ) - b)^k - (cutCentered z n)^k| ≤
      ∑ j ∈ Finset.range k, (k.choose j : ℝ) * (cutError m z b)^(k-j) *
        |cutCentered z n|^j := by
  sorry

/-- PM.1/absolute-odd-moment. Specialize existing finite Cauchy–Schwarz. -/
theorem primeDivisibilitySum_abs_odd_moment_le (m r : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (b : ℝ) :
    (∫ n, |primeDivisibilitySum P a n - b|^(2*r+1) ∂(uLaw m)) ≤
      Real.sqrt ((∫ n, (primeDivisibilitySum P a n - b)^(2*r) ∂(uLaw m)) *
        (∫ n, (primeDivisibilitySum P a n - b)^(2*r+2) ∂(uLaw m))) := by
  sorry

/-- PM.1/cutoff-moment-transfer. Finite bound; no asymptotic conclusion is assumed. -/
theorem omega_cutoff_moment_transfer (m k : ℕ) (z b : ℝ) (hz : 1 < z) :
    |(∫ n, ((ArithmeticFunction.cardDistinctFactors n : ℝ) - b)^k ∂(uLaw m)) -
      cutMoment m z k| ≤
        ∑ j ∈ Finset.range k, (k.choose j : ℝ) * (cutError m z b)^(k-j) *
          evenEnvelope m z j := by
  sorry

/-! ## Ten cutoff-removal regression contracts -/

/-- cutoff_sixty: the boundary prime 3 is retained. -/
example : primeDivisibilitySum (primeCut 3) (fun _ => 1) 60 = 2 ∧
    (((60 : ℕ).primeFactors.filter (fun p : ℕ => (3 : ℝ) < (p : ℝ))).card : ℝ) = 1 := by
  sorry

/-- cutoff_at_five: inclusive, not strict, prime cutoff. -/
example : primeDivisibilitySum (primeCut 5) (fun _ => 1) 60 = 3 ∧
    (((60 : ℕ).primeFactors.filter (fun p : ℕ => (5 : ℝ) < (p : ℝ))).card : ℝ) = 0 := by
  sorry

/-- cutoff_below_two: a prime power contributes once. -/
example : primeDivisibilitySum (primeCut (3/2)) (fun _ => 1) 8 = 0 ∧
    (((8 : ℕ).primeFactors.filter (fun p : ℕ => (3/2 : ℝ) < (p : ℝ))).card : ℝ) = 1 := by
  sorry

/-- cutoff_unit: log(1)=0, no empty-product pathology. -/
example (z : ℝ) (hz : 1 < z) :
    (((1 : ℕ).primeFactors.filter (fun p : ℕ => z < (p : ℝ))).card : ℝ) = 0 ∧
      Real.log (1 : ℝ) / Real.log z = 0 := by
  sorry

/-- cutoff_center_mismatch: every sampled factor can be retained but b can differ. -/
example : |((ArithmeticFunction.cardDistinctFactors 1 : ℝ) - 0) -
    cutCentered 2 1| = 1/2 ∧ cutError 0 2 0 = 1/2 := by
  sorry

/-- cutoff_zeroth_moments -/
example (m : ℕ) (z b : ℝ) :
    (∫ n, ((ArithmeticFunction.cardDistinctFactors n : ℝ) - b)^(0 : ℕ) ∂(uLaw m)) = 1 ∧
      cutMoment m z 0 = 1 := by
  sorry

/-- cutoff_first_transfer -/
example (m : ℕ) (z b : ℝ) (hz : 1 < z) :
    |(∫ n, ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b) ∂(uLaw m)) -
      cutMoment m z 1| ≤ cutError m z b := by
  sorry

/-- cutoff_second_transfer -/
example (m : ℕ) (z b : ℝ) (hz : 1 < z) :
    |(∫ n, ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b)^2 ∂(uLaw m)) -
      cutMoment m z 2| ≤ (cutError m z b)^2 +
        2 * cutError m z b * Real.sqrt (cutMoment m z 2) := by
  sorry

/-- absolute_first_not_signed: cancellation is not an absolute-moment bound. -/
example :
    (∫ n, |primeDivisibilitySum {3} (fun _ => 1) n - 1/3| ∂(uLaw 2)) = 4/9 ∧
    (∫ n, (primeDivisibilitySum {3} (fun _ => 1) n - 1/3) ∂(uLaw 2)) = 0 := by
  sorry

/-- absolute_two_equality: adjacent-even Cauchy–Schwarz can be sharp. -/
example (m r : ℕ) :
    (∫ n, |primeDivisibilitySum {2} (fun _ => 1) n - 1/2|^(2*r+1) ∂(uLaw m)) =
      (1/2 : ℝ)^(2*r+1) := by
  sorry


/-! Full residue laws: local expressions reuse the native empirical measure and ZMod. -/

/-- PM.0/residue-probability. The inverse shift records the positive sample origin. -/
theorem residue_probability (m d : ℕ) [NeZero d] (a : ZMod d) :
    ((uLaw m) {n : ℕ | (n : ZMod d) = a}).toReal =
      (((m + 1) / d : ℕ) + (if (a - 1).val < (m + 1) % d then 1 else 0) : ℝ) /
        (m + 1 : ℕ) := by sorry

/-- PM.0/residue-atom-error. -/
theorem residue_atom_error (m d : ℕ) [NeZero d] (a : ZMod d) :
    |((uLaw m) {n : ℕ | (n : ZMod d) = a}).toReal - 1 / (d : ℝ)| <
      1 / (m + 1 : ℕ) := by sorry

/-- PM.0/residue-summed-error. The difference d-R is in the reals. -/
theorem residue_summed_error (m d : ℕ) [NeZero d] :
    (∑ a : ZMod d, |((uLaw m) {n : ℕ | (n : ZMod d) = a}).toReal - 1 / (d : ℝ)|) =
      2 * ((m + 1) % d : ℕ) * ((d : ℝ) - ((m + 1) % d : ℕ)) /
        ((m + 1 : ℕ) * (d : ℝ)) := by sorry

/-- PM.0/residue-event-error. The factor 1/2 relative to the summed error is essential. -/
theorem residue_event_error (m d : ℕ) [NeZero d] (A : Finset (ZMod d)) :
    |((uLaw m) {n : ℕ | (n : ZMod d) ∈ A}).toReal - (A.card : ℝ) / d| ≤
      ((m + 1) % d : ℕ) * ((d : ℝ) - ((m + 1) % d : ℕ)) /
        ((m + 1 : ℕ) * (d : ℝ)) := by sorry

/-- PM.0/residue-statistic-error. Range bounds may be negative. -/
theorem residue_statistic_error (m d : ℕ) [NeZero d] (F : ZMod d → ℝ)
    (L U : ℝ) (hLU : L ≤ U) (hF : ∀ a, L ≤ F a ∧ F a ≤ U) :
    |(∫ n : ℕ, F (n : ZMod d) ∂uLaw m) - (1 / (d : ℝ)) * ∑ a, F a| ≤
      (U - L) * ((m + 1) % d : ℕ) * ((d : ℝ) - ((m + 1) % d : ℕ)) /
        ((m + 1 : ℕ) * (d : ℝ)) := by sorry

/-- PM.0/crt-residue-probability. Pairwise coprimality is on indexed moduli. -/
theorem crt_residue_probability {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (a : ∀ i, ZMod (q i)) :
    ((uLaw m) {n : ℕ | ∀ i, (n : ZMod (q i)) = a i}).toReal =
      (((m + 1) / (∏ i, q i) : ℕ) +
        (if ((ZMod.prodEquivPi q hcop).symm a - 1).val < (m + 1) % (∏ i, q i)
          then 1 else 0) : ℝ) / (m + 1 : ℕ) := by sorry

/-- PM.0/crt-complete-period-law. Empty families and moduli one are included. -/
theorem crt_complete_period_law {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (hperiod : (∏ i, q i) ∣ m + 1) (a : ∀ i, ZMod (q i)) :
    ((uLaw m) {n : ℕ | ∀ i, (n : ZMod (q i)) = a i}).toReal =
      ∏ i, 1 / (q i : ℝ) := by sorry

/-- PM.0/crt-summed-error. -/
theorem crt_summed_error {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j))) :
    (∑ a : (∀ i, ZMod (q i)),
      |((uLaw m) {n : ℕ | ∀ i, (n : ZMod (q i)) = a i}).toReal - ∏ i, 1 / (q i : ℝ)|) =
      2 * ((m + 1) % (∏ i, q i) : ℕ) *
        (((∏ i, q i : ℕ) : ℝ) - ((m + 1) % (∏ i, q i) : ℕ)) /
        ((m + 1 : ℕ) * ((∏ i, q i : ℕ) : ℝ)) := by sorry

/-- PM.0/crt-statistic-error. -/
theorem crt_statistic_error {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (F : (∀ i, ZMod (q i)) → ℝ) (L U : ℝ) (hLU : L ≤ U)
    (hF : ∀ a, L ≤ F a ∧ F a ≤ U) :
    |(∫ n : ℕ, F (fun i => (n : ZMod (q i))) ∂uLaw m) -
      (∏ i, 1 / (q i : ℝ)) * ∑ a, F a| ≤
      (U - L) * ((m + 1) % (∏ i, q i) : ℕ) *
        (((∏ i, q i : ℕ) : ℝ) - ((m + 1) % (∏ i, q i) : ℕ)) /
        ((m + 1 : ℕ) * ((∏ i, q i : ℕ) : ℝ)) := by sorry


/-! Residue-law acceptance cases. -/
/-- zero_residue_positive_sample. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 3) = 0}).toReal = (1 : ℝ)/5 := by sorry

/-- nonzero_residue_positive_sample. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 3) = 1}).toReal = (2 : ℝ)/5 := by sorry

/-- unit_modulus. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 1) = 0}).toReal = 1 := by sorry

/-- one_sample_observed. -/
example : ((uLaw 0) {n : ℕ | (n : ZMod 7) = 1}).toReal = 1 := by sorry

/-- one_sample_excludes_zero. -/
example : ((uLaw 0) {n : ℕ | (n : ZMod 7) = 0}).toReal = 0 := by sorry

/-- positive_residue_error. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 3) = 1}).toReal - (1 : ℝ)/3 = 1/15 := by sorry

/-- exact_residue_l1. -/
example : (∑ a : ZMod 3, |((uLaw 4) {n : ℕ | (n : ZMod 3) = a}).toReal - (1 : ℝ)/3|) = 4/15 := by sorry

/-- l1_can_exceed_one. -/
example : (∑ a : ZMod 5, |((uLaw 1) {n : ℕ | (n : ZMod 5) = a}).toReal - (1 : ℝ)/5|) = 6/5 := by sorry

/-- complete_period_no_error. -/
example : (∑ a : ZMod 3, |((uLaw 5) {n : ℕ | (n : ZMod 3) = a}).toReal - (1 : ℝ)/3|) = 0 := by sorry

/-- sharp_event_half_l1. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 3) ∈ ({1,2} : Finset (ZMod 3))}).toReal - (2 : ℝ)/3 = 2/15 := by sorry

/-- sharp_signed_statistic. -/
example : |(∫ n : ℕ, (if (n : ZMod 3) = 0 then (-1 : ℝ) else 1) ∂uLaw 4) - (1 : ℝ)/3| = 4/15 := by sorry

/-- negative_constant_statistic. -/
example : (∫ _n : ℕ, (-3 : ℝ) ∂uLaw 4) = -3 := by sorry

/-- truncated_joint_not_uniform. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 2) = 0 ∧ (n : ZMod 3) = 0}).toReal = 0 := by sorry

/-- complete_joint_uniform. -/
example : ((uLaw 5) {n : ℕ | (n : ZMod 2) = 0 ∧ (n : ZMod 3) = 0}).toReal = (1 : ℝ)/6 := by sorry

/-- incompatible_noncoprime_tuple. -/
example : ((uLaw 7) {n : ℕ | (n : ZMod 2) = 0 ∧ (n : ZMod 4) = 1}).toReal = 0 := by sorry

/-- composite_coprime_tuple. -/
example : ((uLaw 35) {n : ℕ | (n : ZMod 4) = 0 ∧ (n : ZMod 9) = 0}).toReal = (1 : ℝ)/36 := by sorry

/-- empty_tuple_probability. -/
example : ((uLaw 4) {n : ℕ | ∀ _i : Fin 0, (n : ZMod 1) = 0}).toReal = 1 := by sorry

/-- unit_coordinate. -/
example : ((uLaw 4) {n : ℕ | (n : ZMod 1) = 0 ∧ (n : ZMod 3) = 0}).toReal = (1 : ℝ)/5 := by sorry


/-! Repeated prime factors: no new carrier; all signatures remain placeholders. -/

local notation "factorExcess" => (fun n : ℕ =>
  (ArithmeticFunction.cardFactors n : ℝ) - ArithmeticFunction.cardDistinctFactors n)

/-- PM.0/excess-factorization. Real casts precede subtraction. -/
theorem excess_factorization (n : ℕ) :
    factorExcess n = ∑ p ∈ n.primeFactors, ((n.factorization p : ℝ) - 1) := by
  sorry

/-- PM.0/prime-power-tail-count. Positivity excludes the zero-divisibility pathology. -/
theorem prime_power_tail_count {n N p : ℕ} (hn : 0 < n) (hnN : n ≤ N)
    (hp : p.Prime) :
    (∑ j ∈ Finset.Icc 2 N, if p^j ∣ n then (1 : ℕ) else 0) =
      n.factorization p - 1 := by
  sorry

/-- PM.0/excess-prime-power-expansion. Both bounds are finite and inclusive. -/
theorem excess_prime_power_expansion {n N : ℕ} (hn : 0 < n) (hnN : n ≤ N) :
    factorExcess n =
      ∑ p ∈ Nat.primesLE N, ∑ j ∈ Finset.Icc 2 N,
        if p^j ∣ n then (1 : ℝ) else 0 := by
  sorry

/-- PM.0/excess-mean-formula. Division inside the cast is natural division. -/
theorem excess_mean_formula (m : ℕ) :
    (∫ n : ℕ, factorExcess n ∂uLaw m) =
      ∑ p ∈ Nat.primesLE (m+1), ∑ j ∈ Finset.Icc 2 (m+1),
        (((m+1) / p^j : ℕ) : ℝ) / (m+1 : ℕ) := by
  sorry

/-- PM.0/excess-mean-bound. A mean bound, not a pointwise bound. -/
theorem excess_mean_bound (m : ℕ) :
    0 ≤ (∫ n : ℕ, factorExcess n ∂uLaw m) ∧
      (∫ n : ℕ, factorExcess n ∂uLaw m) ≤ 1 - 1/(m+1 : ℕ) := by
  sorry

/-- PM.0/excess-tail-bound. The threshold is strictly positive. -/
theorem excess_tail_bound (m : ℕ) (t : ℝ) (ht : 0 < t) :
    ((uLaw m) {n : ℕ | t ≤ factorExcess n}).toReal ≤
      (1 - 1/(m+1 : ℕ)) / t := by
  sorry

/-- PM.0/excess-scaled-l1. -/
theorem excess_scaled_l1 (m : ℕ) (s : ℝ) (hs : 0 < s) :
    (∫ n : ℕ, |factorExcess n / s| ∂uLaw m) ≤
      (1 - 1/(m+1 : ℕ)) / s := by
  sorry

/-- PM.0/excess-cdf-sandwich. A common center and positive scale are essential. -/
theorem excess_cdf_sandwich (m : ℕ) (b s x δ : ℝ) (hs : 0 < s) (hδ : 0 < δ) :
    ((uLaw m) {n : ℕ | ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b)/s ≤ x-δ}).toReal -
        (1 - 1/(m+1 : ℕ)) / (s*δ) ≤
      ((uLaw m) {n : ℕ | ((ArithmeticFunction.cardFactors n : ℝ)-b)/s ≤ x}).toReal ∧
    ((uLaw m) {n : ℕ | ((ArithmeticFunction.cardFactors n : ℝ)-b)/s ≤ x}).toReal ≤
      ((uLaw m) {n : ℕ | ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b)/s ≤ x}).toReal := by
  sorry

/-! Sixteen repeated-factor regression contracts, not proofs. -/

/-- excess_zero_unit: the arithmetic zero extension does not license sampling zero. -/
example : factorExcess 0 = 0 ∧ factorExcess 1 = 0 := by sorry

/-- excess_mixed_powers. -/
example : factorExcess 72 = 3 := by sorry

/-- excess_prime_power. -/
example {p k : ℕ} (hp : p.Prime) (hk : 0 < k) :
    factorExcess (p^k) = (k : ℝ)-1 := by sorry

/-- excess_squarefree. -/
example : factorExcess 30 = 0 := by sorry

/-- excess_not_pointwise_bounded_by_one. -/
example : factorExcess 16 = 3 := by sorry

/-- tail_exponent_one_omitted. -/
example : (∑ j ∈ Finset.Icc 2 12, if (3:ℕ)^j ∣ 12 then (1:ℕ) else 0) = 0 := by sorry

/-- tail_multiple_repetitions. -/
example : (∑ j ∈ Finset.Icc 2 8, if (2:ℕ)^j ∣ 8 then (1:ℕ) else 0) = 2 := by sorry

/-- tail_composite_counterexample. -/
example : (∑ j ∈ Finset.Icc 2 16, if (4:ℕ)^j ∣ 16 then (1:ℕ) else 0) = 1 ∧
    (16:ℕ).factorization 4 - 1 = 0 := by sorry

/-- excess_one_point_sample. -/
example : (∫ n : ℕ, factorExcess n ∂uLaw 0) = 0 := by sorry

/-- excess_first_repetition. -/
example : (∫ n : ℕ, factorExcess n ∂uLaw 3) = 1/4 := by sorry

/-- excess_exact_mean_twelve. -/
example : (∫ n : ℕ, factorExcess n ∂uLaw 11) = 5/12 := by sorry

/-- excess_exact_mean_sixteen. -/
example : (∫ n : ℕ, factorExcess n ∂uLaw 15) = 1/2 := by sorry

/-- excess_inclusive_thresholds. -/
example : ((uLaw 11) {n : ℕ | (1:ℝ) ≤ factorExcess n}).toReal = 1/3 ∧
    ((uLaw 11) {n : ℕ | (2:ℝ) ≤ factorExcess n}).toReal = 1/12 := by sorry

/-- excess_zero_threshold_rejected. -/
example : ((uLaw 11) {n : ℕ | (0:ℝ) ≤ factorExcess n}).toReal = 1 := by sorry

/-- excess_scaled_absolute_mean. -/
example : (∫ n : ℕ, |factorExcess n / 2| ∂uLaw 11) = 5/24 := by sorry

/-- excess_cdf_direction. -/
example : ((uLaw 3) {n : ℕ | (ArithmeticFunction.cardFactors n : ℝ) ≤ 1}).toReal = 3/4 ∧
    ((uLaw 3) {n : ℕ | (ArithmeticFunction.cardDistinctFactors n : ℝ) ≤ 1}).toReal = 1 := by sorry



/-! Arithmetic observation laws and repeated-factor limit transfer.
The measures change with m. No use of a fixed-measure Slutsky theorem is implicit.
-/
open Filter ProbabilityTheory
open scoped Topology NNReal Classical

/-- PM.0/arithmetic-law-count. Counts keep repeated observation values. -/
theorem arithmetic_law_count (m : ℕ) (f : ℕ → ℝ) (B : Set ℝ)
    (hB : MeasurableSet B) :
    ((uLaw m).map f).real B =
      (((Finset.range (m+1)).filter (fun k => f (k+1) ∈ B)).card : ℝ) /
        (m+1 : ℕ) := by sorry

/-- PM.0/arithmetic-law-cdf. The endpoint is inclusive. -/
theorem arithmetic_law_cdf (m : ℕ) (f : ℕ → ℝ) (x : ℝ) :
    cdf ((uLaw m).map f) x =
      (((Finset.range (m+1)).filter (fun k => f (k+1) ≤ x)).card : ℝ) /
        (m+1 : ℕ) := by sorry

/-- PM.0/arithmetic-law-charfun. Positive probability phase, with no 2*pi. -/
theorem arithmetic_law_charfun (m : ℕ) (f : ℕ → ℝ) (t : ℝ) :
    charFun ((uLaw m).map f) t =
      (∑ k ∈ Finset.range (m+1), Complex.exp
        (((t * f (k+1) : ℝ) : ℂ) * Complex.I)) / (m+1 : ℕ) := by sorry

/-- PM.0/arithmetic-levy-criterion. The target must be a probability law. -/
theorem arithmetic_levy_criterion (f : ℕ → ℕ → ℝ)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution f atTop (fun x : ℝ => x) uLaw ν ↔
      ∀ t : ℝ, Tendsto (fun m =>
        (∑ k ∈ Finset.range (m+1), Complex.exp
          (((t * f m (k+1) : ℝ) : ℂ) * Complex.I)) / (m+1 : ℕ))
        atTop (𝓝 (charFun ν t)) := by sorry

/-- PM.0/excess-lipschitz-bound. g need not be globally bounded. -/
theorem excess_lipschitz_bound (m : ℕ) (b s : ℝ) (hs : 0 < s)
    (g : ℝ → ℝ) (L : ℝ≥0) (hg : LipschitzWith L g) :
    |(∫ n : ℕ, g (((ArithmeticFunction.cardFactors n : ℝ)-b)/s) ∂uLaw m) -
      (∫ n : ℕ, g (((ArithmeticFunction.cardDistinctFactors n : ℝ)-b)/s) ∂uLaw m)| ≤
      (L : ℝ) * ((1 - 1/(m+1 : ℕ)) / s) := by sorry

/-- PM.0/excess-l1-limit. Divergence implies eventual positivity; no all-index premise. -/
theorem excess_l1_limit (s : ℕ → ℝ) (hs : Tendsto s atTop atTop) :
    Tendsto (fun m => ∫ n : ℕ, |factorExcess n / s m| ∂uLaw m)
      atTop (𝓝 0) := by sorry

/-- PM.0/excess-tail-limit. This is a changing-measure tail limit. -/
theorem excess_tail_limit (s : ℕ → ℝ) (hs : Tendsto s atTop atTop)
    (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun m => (uLaw m).real {n : ℕ | ε ≤ |factorExcess n / s m|})
      atTop (𝓝 0) := by sorry

/-- PM.0/excess-distribution-transfer. Either convergence remains a hypothesis. -/
theorem excess_distribution_transfer (b s : ℕ → ℝ) (hs : Tendsto s atTop atTop)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν ↔
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν := by sorry

/-! Sixteen law/transfer contracts. -/
/-- law_constant_retains_multiplicity. -/
example : ((uLaw 3).map (fun _ : ℕ => (7 : ℝ))).real {7} = 1 := by sorry
/-- law_one_point_samples_one. -/
example : ((uLaw 0).map (fun n : ℕ => (n : ℝ))).real {1} = 1 := by sorry
/-- cdf_inclusive_at_atom. -/
example : cdf ((uLaw 1).map (fun n : ℕ => (n : ℝ))) 1 = 1/2 := by sorry
/-- cdf_below_positive_sample. -/
example : cdf ((uLaw 3).map (fun n : ℕ => (n : ℝ))) 0 = 0 := by sorry
/-- charfun_zero_normalization. -/
example (m : ℕ) (f : ℕ → ℝ) : charFun ((uLaw m).map f) 0 = 1 := by sorry
/-- charfun_positive_phase. -/
example : charFun ((uLaw 0).map (fun _ : ℕ => (1 : ℝ))) (Real.pi/2) =
    Complex.I := by sorry
/-- levy_constant_law. -/
example (c : ℝ) :
    TendstoInDistribution (fun _ _ : ℕ => c) atTop (fun x : ℝ => x)
      uLaw (Measure.dirac c) := by sorry
/-- levy_sum_at_zero_not_zero. -/
example (m : ℕ) :
    (∑ _k ∈ Finset.range (m+1), (1 : ℂ)) / (m+1 : ℕ) = 1 := by sorry
/-- lipschitz_constant_statistic. -/
example (m : ℕ) (c : ℝ) :
    |(∫ _n : ℕ, c ∂uLaw m) - (∫ _n : ℕ, c ∂uLaw m)| = 0 := by sorry
/-- lipschitz_identity_signed_gap. -/
example : (∫ n : ℕ, (ArithmeticFunction.cardFactors n : ℝ) ∂uLaw 3) -
    (∫ n : ℕ, (ArithmeticFunction.cardDistinctFactors n : ℝ) ∂uLaw 3) = 1/4 := by sorry
/-- l1_scale_can_start_at_zero. -/
example : Tendsto (fun m => ∫ n : ℕ, |factorExcess n / (m : ℝ)| ∂uLaw m)
    atTop (𝓝 0) := by sorry
/-- l1_fixed_scale_not_a_vanishing_bound. -/
example : (∫ n : ℕ, |factorExcess n / 1| ∂uLaw 3) = 1/4 := by sorry
/-- tail_diverging_integer_scale. -/
example : Tendsto (fun m => (uLaw m).real {n : ℕ | (1:ℝ) ≤ |factorExcess n/(m+1:ℕ)|})
    atTop (𝓝 0) := by sorry
/-- tail_zero_threshold_mass_one. -/
example (m : ℕ) (s : ℝ) :
    (uLaw m).real {n : ℕ | (0:ℝ) ≤ |factorExcess n/s|} = 1 := by sorry
/-- transfer_arbitrary_common_center. -/
example (b : ℕ → ℝ) (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b m)/(m+1:ℕ))
      atTop (fun x : ℝ => x) uLaw ν ↔
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardFactors n : ℝ)-b m)/(m+1:ℕ))
      atTop (fun x : ℝ => x) uLaw ν := by sorry
/-- transfer_does_not_identify_finite_laws. -/
example : ((uLaw 3).map (fun n : ℕ => (ArithmeticFunction.cardFactors n : ℝ))).real {2} = 1/4 ∧
    ((uLaw 3).map (fun n : ℕ => (ArithmeticFunction.cardDistinctFactors n : ℝ))).real {2} = 0 := by sorry

/-! Higher repeated-factor moments via a finite positive geometric expansion. -/

/-- PM.0/excess-local-geometric. No first-power contribution is included. -/
theorem excess_local_geometric {n N p : ℕ} (hn : 0 < n) (hnN : n ≤ N)
    (hp : p.Prime) :
    (3/2 : ℝ) ^ (n.factorization p - 1) =
      1 + ∑ j ∈ Finset.Icc 2 N,
        if p^j ∣ n then (1/2 : ℝ)*(3/2 : ℝ)^(j-2) else 0 := by sorry

/-- PM.0/excess-exponential-product. The constant prime-power cutoff is finite. -/
theorem excess_exponential_product {n N : ℕ} (hn : 0 < n) (hnN : n ≤ N) :
    Real.exp (Real.log (3/2) * factorExcess n) =
      ∏ p ∈ Nat.primesLE N, (3/2 : ℝ)^(n.factorization p-1) := by sorry

/-- PM.0/excess-exponential-euler. Uses exact CRT counts, not independence. -/
theorem excess_exponential_euler (m : ℕ) :
    (∫ n : ℕ, Real.exp (Real.log (3/2) * factorExcess n) ∂uLaw m) ≤
      ∏ p ∈ Nat.primesLE (m+1), (1 + ∑ j ∈ Finset.Icc 2 (m+1),
        (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j) := by sorry

/-- PM.0/excess-local-euler-bound. The worst geometric ratio is 3/4 at p=2. -/
theorem excess_local_euler_bound {p : ℕ} (hp : p.Prime) (N : ℕ) :
    (∑ j ∈ Finset.Icc 2 N, (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j) ≤
      2/(p : ℝ)^2 := by sorry

/-- PM.0/excess-finite-euler-bound. No infinite Euler product is constructed. -/
theorem excess_finite_euler_bound (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) (N : ℕ) :
    (∏ p ∈ P, (1 + ∑ j ∈ Finset.Icc 2 N,
      (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j)) ≤ Real.exp 2 := by sorry

/-- PM.0/excess-exponential-mean. Uniform in the positive sample size. -/
theorem excess_exponential_mean (m : ℕ) :
    (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw m) ≤
      Real.exp 2 := by sorry

/-- PM.0/excess-all-moments. Explicit k-dependent constant, including k=0. -/
theorem excess_all_moments (m k : ℕ) :
    (∫ n : ℕ, |factorExcess n|^k ∂uLaw m) ≤
      Real.exp 2 * (k.factorial : ℝ) / (Real.log (3/2))^k := by sorry

/-- PM.0/excess-exponential-tail. The exponential threshold is positive for every t. -/
theorem excess_exponential_tail (m : ℕ) (t : ℝ) :
    ((uLaw m) {n : ℕ | t ≤ factorExcess n}).toReal ≤
      Real.exp (2 - Real.log (3/2)*t) := by sorry

/-- PM.0/excess-scaled-moments. A finite bound, not a Gaussian convergence theorem. -/
theorem excess_scaled_moments (m k : ℕ) (s : ℝ) (hs : 0 < s) :
    (∫ n : ℕ, |factorExcess n / s|^k ∂uLaw m) ≤
      Real.exp 2 * (k.factorial : ℝ) / ((Real.log (3/2))^k * s^k) := by sorry

/-- geometric_unit -/
example : (3/2 : ℝ)^((1 : ℕ).factorization 2 - 1) = 1 := by sorry
/-- geometric_cube -/
example : (3/2 : ℝ)^((8 : ℕ).factorization 2 - 1) = 9/4 := by sorry
/-- first_prime_power_has_no_excess_weight -/
example : (3/2 : ℝ)^((2 : ℕ).factorization 2 - 1) = 1 := by sorry
/-- exponential_mixed_powers -/
example : Real.exp (Real.log (3/2)*factorExcess 72) = 27/8 := by sorry
/-- squarefree_exponential_weight -/
example : Real.exp (Real.log (3/2)*factorExcess 30) = 1 := by sorry
/-- exponential_mean_four -/
example : (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw 3) = 9/8 := by sorry
/-- exponential_mean_three -/
example : (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw 2) = 1 := by sorry
/-- local_density_first_term -/
example : (∑ j ∈ Finset.Icc 2 2,
    (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(2 : ℝ)^j) = 1/8 := by sorry
/-- local_density_empty_cutoff -/
example (p : ℕ) : (∑ j ∈ Finset.Icc 2 1,
    (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j) = 0 := by sorry
/-- base_two_loses_geometric_decay -/
example : (∑ j ∈ Finset.Icc 2 10, (2 : ℝ)^(j-2)/(2 : ℝ)^j) = 9/4 := by sorry
/-- empty_euler_family -/
example (N : ℕ) : (∏ p ∈ (∅ : Finset ℕ), (1 + ∑ j ∈ Finset.Icc 2 N,
    (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j)) = 1 := by sorry
/-- two_prime_finite_euler -/
example : (∏ p ∈ ({2,3} : Finset ℕ), (1 + ∑ j ∈ Finset.Icc 2 2,
    (1/2 : ℝ)*(3/2 : ℝ)^(j-2)/(p : ℝ)^j)) = 19/16 := by sorry
/-- exponential_singleton_sample -/
example : (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw 0) = 1 := by sorry
/-- excess_zeroth_moment -/
example (m : ℕ) : (∫ n : ℕ, |factorExcess n|^(0 : ℕ) ∂uLaw m) = 1 := by sorry
/-- excess_second_moment_eight -/
example : (∫ n : ℕ, |factorExcess n|^(2 : ℕ) ∂uLaw 7) = 5/8 := by sorry
/-- excess_inclusive_tail_eight -/
example : ((uLaw 7) {n : ℕ | (2 : ℝ) ≤ factorExcess n}).toReal = 1/8 := by sorry
/-- scaled_second_moment_eight -/
example : (∫ n : ℕ, |factorExcess n / 2|^(2 : ℕ) ∂uLaw 7) = 5/32 := by sorry
/-- scaled_zeroth_moment -/
example (m : ℕ) : (∫ n : ℕ, |factorExcess n / 2|^(0 : ℕ) ∂uLaw m) = 1 := by sorry
end TauCeti.Probability.Arithmetic

/-! ## PM.2: asymptotic equidistribution on tori

Claude Code (cc-fb70e5), 2026-09-28. Source: Tao, *Higher order Fourier analysis*, §1.1.1.
Signatures only: every body is `sorry`, and this section has not been elaborated (the machine that
wrote it has no build at the pinned commits). The carrier is Tau Ceti's `empiricalMeasure` in
Mathlib's `ProbabilityMeasure` topology; the torus is Mathlib's `UnitAddTorus` with its characters
`UnitAddTorus.mFourier`. Van der Corput's inequality is
`ExponentialSumsAndCircleMethod:ES.0/q-vdc-lag-bound` at `r = 1` and is not restated here.
Sequences are indexed by `ℕ` and averaged over `0, …, n`; equidistribution ignores finite shifts.
-/

namespace TauCeti.Equidistribution

open MeasureTheory Filter Topology
open scoped Classical

section General

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X]

/-- PM.2/asymptotic-equidistribution: the empirical measures of `x` converge to `μ`. -/
def AsympEquidistributed (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)

theorem asympEquidistributed_iff_integral_tendsto (x : ℕ → X) (μ : ProbabilityMeasure X) :
    AsympEquidistributed x μ ↔ ∀ f : X →ᵇ ℝ,
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℝ)⁻¹ * ∑ i ∈ Finset.range (n + 1), f (x i)) atTop
        (𝓝 (∫ y, f y ∂(μ : Measure X))) := by
  sorry

theorem asympEquidistributed_iff_integral_tendsto_complex (x : ℕ → X)
    (μ : ProbabilityMeasure X) :
    AsympEquidistributed x μ ↔ ∀ f : X →ᵇ ℂ,
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ * ∑ i ∈ Finset.range (n + 1), f (x i)) atTop
        (𝓝 (∫ y, f y ∂(μ : Measure X))) := by
  sorry

theorem asympEquidistributed_comp_add_iff (x : ℕ → X) (μ : ProbabilityMeasure X) (m : ℕ) :
    AsympEquidistributed (fun n => x (n + m)) μ ↔ AsympEquidistributed x μ := by
  sorry

theorem AsympEquidistributed.congr_of_eventuallyEq {x y : ℕ → X} {μ : ProbabilityMeasure X}
    (h : AsympEquidistributed x μ) (hxy : x =ᶠ[atTop] y) : AsympEquidistributed y μ := by
  sorry

/-- The source's appeal to the Riesz representation theorem, as Hausdorffness of the topology. -/
theorem AsympEquidistributed.unique [HasOuterApproxClosed X] [BorelSpace X] {x : ℕ → X}
    {μ ν : ProbabilityMeasure X} (hμ : AsympEquidistributed x μ)
    (hν : AsympEquidistributed x ν) : μ = ν := by
  sorry

/-- Portmanteau: frequencies of visits to a set whose frontier is `μ`-null. -/
theorem AsympEquidistributed.tendsto_frequency [HasOuterApproxClosed X] {x : ℕ → X}
    {μ : ProbabilityMeasure X} (h : AsympEquidistributed x μ) {E : Set X}
    (hE : MeasurableSet E) (hbd : (μ : Measure X) (frontier E) = 0) :
    Tendsto (fun n : ℕ =>
      (((Finset.range (n + 1)).filter (fun i => x i ∈ E)).card : ℝ) / (n + 1))
      atTop (𝓝 ((μ : Measure X) E).toReal) := by
  sorry

theorem AsympEquidistributed.eventually_frequency_ge [HasOuterApproxClosed X] {x : ℕ → X}
    {μ : ProbabilityMeasure X} (h : AsympEquidistributed x μ) {U : Set X} (hU : IsOpen U)
    (hμU : 0 < (μ : Measure X) U) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ n in atTop,
      c ≤ (((Finset.range (n + 1)).filter (fun i => x i ∈ U)).card : ℝ) / (n + 1) := by
  sorry

theorem AsympEquidistributed.denseRange [HasOuterApproxClosed X] {x : ℕ → X}
    {μ : ProbabilityMeasure X} (h : AsympEquidistributed x μ)
    (hμ : ∀ U : Set X, IsOpen U → U.Nonempty → 0 < (μ : Measure X) U) : DenseRange x := by
  sorry

theorem asympEquidistributed_const_iff [HasOuterApproxClosed X] [BorelSpace X] (p : X)
    (μ : ProbabilityMeasure X) :
    AsympEquidistributed (fun _ : ℕ => p) μ ↔ μ = diracProba p := by
  sorry

/-- PM.2/total-asymptotic-equidistribution: equidistribution along every progression `q n + r`. -/
def TotallyAsympEquidistributed (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ

theorem TotallyAsympEquidistributed.asympEquidistributed {x : ℕ → X}
    {μ : ProbabilityMeasure X} (h : TotallyAsympEquidistributed x μ) :
    AsympEquidistributed x μ := by
  sorry

theorem TotallyAsympEquidistributed.comp_affine {x : ℕ → X} {μ : ProbabilityMeasure X}
    (h : TotallyAsympEquidistributed x μ) {q : ℕ} (hq : 0 < q) (r : ℕ) :
    TotallyAsympEquidistributed (fun n => x (q * n + r)) μ := by
  sorry

end General

section Torus

variable {d : Type*} [Fintype d]

/-- PM.2/torus-haar-probability: the Haar probability measure on `ℝ/ℤ`. -/
def circleHaar : ProbabilityMeasure UnitAddCircle :=
  ⟨AddCircle.haarAddCircle, inferInstance⟩

/-- PM.2/torus-haar-probability: the Haar probability measure on `(ℝ/ℤ)^d`. -/
def torusHaar (d : Type*) [Fintype d] : ProbabilityMeasure (UnitAddTorus d) :=
  ⟨Measure.pi (fun _ : d => AddCircle.haarAddCircle), by sorry⟩

theorem torusHaar_eq_volume : (torusHaar d : Measure (UnitAddTorus d)) = volume := by
  sorry

theorem circleHaar_eq_volume : (circleHaar : Measure UnitAddCircle) = volume := by
  sorry

instance isAddHaarMeasure_torusHaar :
    (torusHaar d : Measure (UnitAddTorus d)).IsAddHaarMeasure := by
  sorry

theorem integral_mFourier_torusHaar (k : d → ℤ) :
    ∫ x, UnitAddTorus.mFourier k x ∂(torusHaar d : Measure (UnitAddTorus d)) =
      if k = 0 then 1 else 0 := by
  sorry

theorem integral_fourier_circleHaar (n : ℤ) :
    ∫ y, fourier n y ∂(circleHaar : Measure UnitAddCircle) = if n = 0 then 1 else 0 := by
  sorry

/-- PM.2/torus-irrational: `k · α ≠ 0` for every nonzero frequency `k`. -/
def TorusIrrational (α : UnitAddTorus d) : Prop :=
  ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0

theorem mFourier_eq_fourier_sum (k : d → ℤ) (α : UnitAddTorus d) :
    UnitAddTorus.mFourier k α = fourier 1 (∑ i, k i • α i) := by
  sorry

theorem torusIrrational_iff_mFourier (α : UnitAddTorus d) :
    TorusIrrational α ↔ ∀ k : d → ℤ, k ≠ 0 → UnitAddTorus.mFourier k α ≠ 1 := by
  sorry

theorem torusIrrational_unique_iff [Unique d] (α : UnitAddTorus d) :
    TorusIrrational α ↔ addOrderOf (α default) = 0 := by
  sorry

theorem TorusIrrational.zsmul {α : UnitAddTorus d} (h : TorusIrrational α) {m : ℤ}
    (hm : m ≠ 0) : TorusIrrational (m • α) := by
  sorry

theorem TorusIrrational.nsmul {α : UnitAddTorus d} (h : TorusIrrational α) {m : ℕ}
    (hm : m ≠ 0) : TorusIrrational (m • α) := by
  sorry

/-- PM.2/weyl-criterion (Tao, Proposition 1.1.2). -/
theorem weyl_criterion (x : ℕ → UnitAddTorus d) :
    AsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 →
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), UnitAddTorus.mFourier k (x i)) atTop (𝓝 0) := by
  sorry

/-- PM.2/weyl-criterion-projections (Tao, Corollary 1.1.3). -/
theorem asympEquidistributed_iff_projections (x : ℕ → UnitAddTorus d) :
    AsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 →
      AsympEquidistributed (fun n => ∑ i, k i • x n i) circleHaar := by
  sorry

/-- PM.2/linear-equidistribution (Tao, Exercise 1.1.5, the `ℕ`-indexed statements). -/
theorem linear_equidistribution_tfae (α β : UnitAddTorus d) :
    List.TFAE [AsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TotallyAsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TorusIrrational α] := by
  sorry

/-- PM.2/van-der-corput-lemma (Tao, Corollary 1.1.7). -/
theorem asympEquidistributed_of_forall_sub (x : ℕ → UnitAddTorus d)
    (hx : ∀ h : ℕ, 0 < h → AsympEquidistributed (fun n => x (n + h) - x n) (torusHaar d)) :
    AsympEquidistributed x (torusHaar d) := by
  sorry

/-- PM.2/weyl-polynomial-equidistribution (Tao, Corollary 1.1.9, on `ℕ`). -/
theorem weyl_polynomial (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d)
    (hα : TorusIrrational (α s)) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
      (torusHaar d) := by
  sorry

/-- PM.2/uniform-distribution-mod-one: the classical definition and Weyl's criterion. -/
theorem uniformDistribution_mod_one_tfae (u : ℕ → ℝ) :
    List.TFAE [AsympEquidistributed (fun n => (u n : UnitAddCircle)) circleHaar,
      ∀ a b : ℝ, 0 ≤ a → a ≤ b → b ≤ 1 →
        Tendsto (fun n : ℕ => (((Finset.range (n + 1)).filter
          (fun i => Int.fract (u i) ∈ Set.Ico a b)).card : ℝ) / (n + 1)) atTop (𝓝 (b - a)),
      ∀ k : ℤ, k ≠ 0 → Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), fourier k (u i : UnitAddCircle)) atTop (𝓝 0)] := by
  sorry

end Torus

/-! Unit tests for the PM.2 definitions, named as in the packet. -/

/-- asympEquidistributed.test_const_dirac -/
example {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X] (p : X) :
    AsympEquidistributed (fun _ : ℕ => p) (diracProba p) := by sorry

/-- asympEquidistributed.test_dyadic_blocks (Tao, Example 1.1.1) -/
example : ¬ ∃ μ : ProbabilityMeasure Bool, AsympEquidistributed
    (fun n : ℕ => decide (∃ j : ℕ, 2 ^ (2 * j) ≤ n ∧ n < 2 ^ (2 * j + 1))) μ := by sorry

/-- asympEquidistributed.test_alternating -/
example : AsympEquidistributed (fun n : ℕ => decide (n % 2 = 1))
    ⟨(PMF.uniformOfFintype Bool).toMeasure, inferInstance⟩ := by sorry

/-- asympEquidistributed.test_update_first_term -/
example {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X]
    (x : ℕ → X) (p : X) (μ : ProbabilityMeasure X) :
    AsympEquidistributed (Function.update x 0 p) μ ↔ AsympEquidistributed x μ := by sorry

/-- asympEquidistributed.test_zero_not_haar -/
example : ¬ AsympEquidistributed (fun _ : ℕ => (0 : UnitAddCircle)) circleHaar := by sorry

/-- totallyAsympEquidistributed.test_half_rotation -/
example : ¬ ∃ μ : ProbabilityMeasure UnitAddCircle,
    TotallyAsympEquidistributed (fun n : ℕ => n • ((1 / 2 : ℝ) : UnitAddCircle)) μ := by sorry

/-- totallyAsympEquidistributed.test_const -/
example {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X] (p : X) :
    TotallyAsympEquidistributed (fun _ : ℕ => p) (diracProba p) := by sorry

/-- totallyAsympEquidistributed.test_implies_plain -/
example {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X]
    (x : ℕ → X) (μ : ProbabilityMeasure X) (h : TotallyAsympEquidistributed x μ) :
    AsympEquidistributed x μ := by sorry

/-- torusHaar.test_character_integral -/
example : ∫ x, UnitAddTorus.mFourier (![1, -1] : Fin 2 → ℤ) x
    ∂(torusHaar (Fin 2) : Measure (UnitAddTorus (Fin 2))) = 0 := by sorry

/-- torusHaar.test_zero_dim -/
example : (torusHaar (Fin 0) : Measure (UnitAddTorus (Fin 0))) = Measure.dirac 0 := by sorry

/-- torusHaar.test_marginal -/
example : (torusHaar (Fin 1) : Measure (UnitAddTorus (Fin 1))).map (fun x => x 0) =
    (circleHaar : Measure UnitAddCircle) := by sorry

/-- circleHaar.test_volume -/
example : (circleHaar : Measure UnitAddCircle) = volume := by sorry

/-- torusIrrational.test_mixed -/
example : ¬ TorusIrrational
    (![((Real.sqrt 2 : ℝ) : UnitAddCircle), ((1 / 2 : ℝ) : UnitAddCircle)] :
      UnitAddTorus (Fin 2)) := by
  sorry

/-- torusIrrational.test_sqrt2_sqrt3 -/
example : TorusIrrational
    (![((Real.sqrt 2 : ℝ) : UnitAddCircle), ((Real.sqrt 3 : ℝ) : UnitAddCircle)] :
      UnitAddTorus (Fin 2)) := by
  sorry

/-- torusIrrational.test_empty -/
example (α : UnitAddTorus (Fin 0)) : TorusIrrational α := by sorry

/-- torusIrrational.test_one_dim -/
example (a : UnitAddCircle) : TorusIrrational (fun _ : Unit => a) ↔ addOrderOf a = 0 := by sorry


/-! ### PM.2, second pass: the rest of Tao §1.1.1

Claude Code (cc-fb70e5), 2026-09-28. Doubly infinite sequences, the general-measure Weyl
criterion, rational twists, the polynomial criterion, subtori and the abelian Ratner theorems.
Signatures only; not elaborated, as for the first pass.
-/

section Continuation

open MeasureTheory Filter Topology

section Int

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [OpensMeasurableSpace X]

/-- PM.2/asymptotic-equidistribution-int: both halves, `x 0` omitted. -/
def AsympEquidistributedInt (x : ℤ → X) (μ : ProbabilityMeasure X) : Prop :=
  AsympEquidistributed (fun n : ℕ => x (n + 1)) μ ∧
    AsympEquidistributed (fun n : ℕ => x (-(n + 1))) μ

def TotallyAsympEquidistributedInt (x : ℤ → X) (μ : ProbabilityMeasure X) : Prop :=
  ∀ q : ℕ, 0 < q → ∀ r : ℤ, AsympEquidistributedInt (fun n => x (q * n + r)) μ

theorem AsympEquidistributedInt.natCast {x : ℤ → X} {μ : ProbabilityMeasure X}
    (h : AsympEquidistributedInt x μ) : AsympEquidistributed (fun n : ℕ => x n) μ := by
  sorry

theorem asympEquidistributedInt_update_zero (x : ℤ → X) (p : X) (μ : ProbabilityMeasure X) :
    AsympEquidistributedInt (Function.update x 0 p) μ ↔ AsympEquidistributedInt x μ := by
  sorry

theorem TotallyAsympEquidistributedInt.asympEquidistributedInt {x : ℤ → X}
    {μ : ProbabilityMeasure X} (h : TotallyAsympEquidistributedInt x μ) :
    AsympEquidistributedInt x μ := by
  sorry

theorem TotallyAsympEquidistributedInt.totallyAsympEquidistributed_natCast {x : ℤ → X}
    {μ : ProbabilityMeasure X} (h : TotallyAsympEquidistributedInt x μ) :
    TotallyAsympEquidistributed (fun n : ℕ => x n) μ := by
  sorry

/-- asympEquidistributedInt.test_irrational_rotation -/
example :
    AsympEquidistributedInt (fun n : ℤ => n • ((Real.sqrt 2 : ℝ) : UnitAddCircle)) circleHaar := by
  sorry

/-- asympEquidistributedInt.test_one_sided -/
example : ¬ AsympEquidistributedInt
    (fun n : ℤ => if 0 ≤ n then (0 : UnitAddCircle) else n • ((Real.sqrt 2 : ℝ) : UnitAddCircle))
    circleHaar := by
  sorry

/-- asympEquidistributedInt.test_zero_irrelevant -/
example (x : ℤ → X) (p : X) (μ : ProbabilityMeasure X) :
    AsympEquidistributedInt (Function.update x 0 p) μ ↔ AsympEquidistributedInt x μ := by sorry

end Int

section TorusContinuation

variable {d : Type*} [Fintype d]

/-- PM.2/weyl-criterion-general-measure. -/
theorem asympEquidistributed_iff_mFourier (x : ℕ → UnitAddTorus d)
    (μ : ProbabilityMeasure (UnitAddTorus d)) :
    AsympEquidistributed x μ ↔ ∀ k : d → ℤ,
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), UnitAddTorus.mFourier k (x i)) atTop
        (𝓝 (∫ y, UnitAddTorus.mFourier k y ∂(μ : Measure (UnitAddTorus d)))) := by
  sorry

/-- PM.2/total-equidistribution-twisted-weyl (Tao, Exercise 1.1.4). -/
theorem totallyAsympEquidistributed_iff_twisted (x : ℕ → UnitAddTorus d) :
    TotallyAsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 → ∀ (a : ℤ) (b : ℕ), 0 < b →
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ * ∑ i ∈ Finset.range (n + 1),
        UnitAddTorus.mFourier k (x i) * fourier a (((i : ℝ) / b : ℝ) : UnitAddCircle))
        atTop (𝓝 0) := by
  sorry

/-- PM.2/linear-equidistribution-int (Tao, Exercise 1.1.5 (iii)). -/
theorem totallyAsympEquidistributedInt_linear_iff (α β : UnitAddTorus d) :
    TotallyAsympEquidistributedInt (fun n : ℤ => n • α + β) (torusHaar d) ↔ TorusIrrational α := by
  sorry

/-- PM.2/polynomial-equidistribution-criterion (Tao, Exercise 1.1.6). -/
theorem polynomial_equidistribution_tfae (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d) :
    List.TFAE [
      AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j) (torusHaar d),
      TotallyAsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
        (torusHaar d),
      TotallyAsympEquidistributedInt (fun n : ℤ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
        (torusHaar d),
      ¬ ∃ k : d → ℤ, k ≠ 0 ∧ ∀ j ∈ Finset.Icc 1 s, ∑ i, k i • α j i = 0] := by
  sorry

/-- PM.2/subtorus: the image of an integer matrix `M : d × n`, with its Haar measure. -/
structure Subtorus (d : Type*) [Fintype d] where
  n : ℕ
  M : Matrix d (Fin n) ℤ

namespace Subtorus

variable (S : Subtorus d)

def toHom : UnitAddTorus (Fin S.n) →+ UnitAddTorus d where
  toFun y i := ∑ j, S.M i j • y j
  map_zero' := by sorry
  map_add' := by sorry

theorem continuous_toHom : Continuous S.toHom := by sorry

def carrier : AddSubgroup (UnitAddTorus d) := S.toHom.range

theorem isCompact_carrier : IsCompact (S.carrier : Set (UnitAddTorus d)) := by sorry

theorem isConnected_carrier : IsConnected (S.carrier : Set (UnitAddTorus d)) := by sorry

def haar : ProbabilityMeasure (UnitAddTorus d) :=
  ⟨Measure.map S.toHom (torusHaar (Fin S.n) : Measure (UnitAddTorus (Fin S.n))), by sorry⟩

theorem haar_carrier : (S.haar : Measure (UnitAddTorus d)) S.carrier = 1 := by sorry

theorem integral_mFourier_haar (k : d → ℤ) :
    ∫ y, UnitAddTorus.mFourier k y ∂(S.haar : Measure (UnitAddTorus d)) =
      if Matrix.vecMul k S.M = 0 then 1 else 0 := by
  sorry

theorem mFourier_eq_one_iff (k : d → ℤ) :
    (∀ y ∈ S.carrier, UnitAddTorus.mFourier k y = 1) ↔ Matrix.vecMul k S.M = 0 := by
  sorry

theorem haar_eq_of_carrier_eq {S' : Subtorus d} (h : S.carrier = S'.carrier) :
    S.haar = S'.haar := by
  sorry

variable (d) in
/-- The full torus. -/
def top : Subtorus d :=
  ⟨Fintype.card d, Matrix.of fun i j => if Fintype.equivFin d i = j then 1 else 0⟩

variable (d) in
/-- The zero subtorus. -/
def bot : Subtorus d := ⟨0, 0⟩

end Subtorus

/-- PM.2/torus-rational-decomposition. -/
theorem exists_subtorus_rational_decomposition {s : ℕ} (α : Fin s → UnitAddTorus d) :
    ∃ S : Subtorus d, Function.Injective S.toHom ∧
      (∀ k : d → ℤ, (∀ y ∈ S.carrier, ∑ i, k i • y i = 0) ↔
        ∀ j, IsOfFinAddOrder (∑ i, k i • α j i)) ∧
      ∀ j, ∃ α' ∈ S.carrier, IsOfFinAddOrder (α j - α') := by
  sorry

/-- PM.2/abelian-ratner-polynomial (Tao, Exercise 1.1.7). -/
theorem exists_abelian_ratner_polynomial (s : ℕ) (α : ℕ → UnitAddTorus d) :
    ∃ (S : Subtorus d) (α' α'' : ℕ → UnitAddTorus d),
      (∀ j, 1 ≤ j → j ≤ s → α' j ∈ S.carrier ∧ IsOfFinAddOrder (α'' j) ∧ α j = α' j + α'' j) ∧
      TotallyAsympEquidistributed
        (fun n : ℕ => ∑ j ∈ Finset.Icc 1 s, (n ^ j) • α' j) S.haar ∧
      TotallyAsympEquidistributedInt
        (fun n : ℤ => ∑ j ∈ Finset.Icc 1 s, (n ^ j) • α' j) S.haar ∧
      ∃ Q : ℕ, 0 < Q ∧ Function.Periodic
        (fun n : ℤ => α 0 + ∑ j ∈ Finset.Icc 1 s, (n ^ j) • α'' j) (Q : ℤ) := by
  sorry

/-- PM.2/abelian-ratner-linear (Tao, Proposition 1.1.5). -/
theorem exists_abelian_ratner_linear (α β : UnitAddTorus d) :
    ∃ (S : Subtorus d) (α' α'' : UnitAddTorus d),
      α' ∈ S.carrier ∧ IsOfFinAddOrder α'' ∧ α = α' + α'' ∧
      TotallyAsympEquidistributed (fun n : ℕ => n • α') S.haar ∧
      TotallyAsympEquidistributedInt (fun n : ℤ => n • α') S.haar ∧
      ∃ Q : ℕ, 0 < Q ∧ Function.Periodic (fun n : ℤ => n • α'' + β) (Q : ℤ) := by
  sorry

/-- subtorus.test_top -/
example : (Subtorus.top d).haar = torusHaar d := by sorry

/-- subtorus.test_bot -/
example : (Subtorus.bot d).haar = diracProba 0 := by sorry

/-- subtorus.test_diagonal -/
example :
    let D : Subtorus (Fin 2) := ⟨1, Matrix.of fun _ _ => 1⟩
    ∫ y, UnitAddTorus.mFourier (![1, -1] : Fin 2 → ℤ) y
        ∂(D.haar : Measure (UnitAddTorus (Fin 2))) = 1 ∧
      ∫ y, UnitAddTorus.mFourier (![1, 0] : Fin 2 → ℤ) y
        ∂(D.haar : Measure (UnitAddTorus (Fin 2))) = 0 := by
  sorry

/-- subtorus.test_non_injective: `x ↦ 2x` on `T` still has Haar pushforward `torusHaar`. -/
example : (⟨1, Matrix.of fun _ _ => 2⟩ : Subtorus (Fin 1)).haar = torusHaar (Fin 1) := by sorry

end TorusContinuation

end Continuation

end TauCeti.Equidistribution

/-!
## PM.3: metric Diophantine approximation — the Duffin–Schaeffer theorem

Checkpoint by Claude Code (cc-39fac3), following Koukoulopoulos–Maynard, *On the
Duffin–Schaeffer conjecture*, Ann. of Math. 192 (2020), 251–307 (arXiv:1907.04593v3).
This section imports Mathlib only; Gallagher's zero-one law is Mathlib's
`AddCircle.addWellApproximable_ae_empty_or_univ`, and Borel–Cantelli is
`MeasureTheory.measure_limsup_atTop_eq_zero`.
-/

namespace TauCeti.DuffinSchaeffer

open MeasureTheory Filter Topology
open scoped ENNReal

/-! ### Approximation sets -/

/-- PM.3/duffin-schaeffer-sets. `𝒜_q = [0,1] ∩ ⋃_{1≤a≤q, (a,q)=1} [a/q − ψ(q)/q, a/q + ψ(q)/q]`,
Koukoulopoulos–Maynard (1.3). -/
def dsSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- PM.3/duffin-schaeffer-sets, data: `𝒜 = limsup 𝒜_q` (1.4). -/
def dsLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (dsSet ψ) atTop

/-- PM.3/duffin-schaeffer-sets, data: Khinchin's `𝒦_q` of (1.2), with every `0 ≤ a ≤ q`. -/
def khinchinSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ Finset.range (q + 1),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- PM.3/duffin-schaeffer-sets, data: `𝒦 = limsup 𝒦_q`. -/
def khinchinLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (khinchinSet ψ) atTop

/-- PM.3/duffin-schaeffer-sets, API: the union bound `λ(𝒜_q) ≤ 2φ(q)ψ(q)/q`. -/
theorem volume_dsSet_le (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) (q : ℕ) :
    volume (dsSet ψ q) ≤ ENNReal.ofReal (2 * q.totient * ψ q / q) := by
  sorry

/-- PM.3/duffin-schaeffer-sets, API: `λ(𝒜_q) ≥ φ(q)ψ(q)/q` when `ψ(q) ≤ 1/2`. -/
theorem le_volume_dsSet (ψ : ℕ → ℝ) (q : ℕ) (hq : 1 ≤ q) (h0 : 0 ≤ ψ q) (h1 : ψ q ≤ 1 / 2) :
    ENNReal.ofReal (q.totient * ψ q / q) ≤ volume (dsSet ψ q) := by
  sorry

/-- PM.3/duffin-schaeffer-sets, API: monotone in `ψ`. -/
theorem dsSet_mono {ψ ψ' : ℕ → ℝ} (h : ∀ q, ψ q ≤ ψ' q) (q : ℕ) : dsSet ψ q ⊆ dsSet ψ' q := by
  sorry

/-- PM.3/duffin-schaeffer-sets, API: reduced fractions are among all fractions. -/
theorem dsSet_subset_khinchinSet (ψ : ℕ → ℝ) (q : ℕ) : dsSet ψ q ⊆ khinchinSet ψ q := by
  sorry

/-- PM.3/duffin-schaeffer-sets, API: Mathlib's open-ball well-approximable set on the circle,
pulled back to `[0,1]`, lies in `𝒜`. -/
theorem mem_dsLimsup_of_mem_addWellApproximable (ψ : ℕ → ℝ) {x : ℝ} (hx : x ∈ Set.Icc 0 1)
    (h : (x : UnitAddCircle) ∈ addWellApproximable UnitAddCircle (fun n => ψ n / n)) :
    x ∈ dsLimsup ψ := by
  sorry

/-- PM.3/duffin-schaeffer-sets, API: an irrational point of `𝒜` is `2ψ`-well-approximable on
the circle. -/
theorem mem_addWellApproximable_of_mem_dsLimsup (ψ : ℕ → ℝ) {x : ℝ} (hx : Irrational x)
    (h : x ∈ dsLimsup ψ) :
    (x : UnitAddCircle) ∈ addWellApproximable UnitAddCircle (fun n => 2 * ψ n / n) := by
  sorry

example : dsSet (fun _ => 1 / 2) 1 = Set.Icc (1 / 2) 1 := by
  sorry

example : dsSet (fun _ => 1 / 2) 2 = Set.Icc (1 / 4) (3 / 4) := by
  sorry

example (q : ℕ) : volume (dsSet (fun _ => 0) q) = 0 := by
  sorry

example : (0 : ℝ) ∈ khinchinSet (fun _ => 1 / 2) 2 ∧ (0 : ℝ) ∉ dsSet (fun _ => 1 / 2) 2 := by
  sorry

/-! ### The main theorems -/

/-- PM.3/duffin-schaeffer-convergence. (1.5): convergence gives measure zero. -/
theorem volume_dsLimsup_eq_zero (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hsum : Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 0 := by
  sorry

/-- PM.3/duffin-schaeffer-theorem. Koukoulopoulos–Maynard Theorem 1. -/
theorem volume_dsLimsup_eq_one (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 1 := by
  sorry

/-- PM.3/catlin-theorem. Koukoulopoulos–Maynard Theorem 2 (Catlin's conjecture), with
`ψ*(q) = φ(q) sup_{q ∣ n} ψ(n)/n` valued in `[0, ∞]`. -/
theorem catlin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) :
    let ψstar : ℕ → ℝ≥0∞ := fun q =>
      (q.totient : ℝ≥0∞) * ⨆ n : ℕ, ⨆ (_ : 0 < n ∧ q ∣ n), ENNReal.ofReal (ψ n / n)
    ((∑' q, ψstar q) < ∞ → volume (khinchinLimsup ψ) = 0) ∧
      ((∑' q, ψstar q) = ∞ → volume (khinchinLimsup ψ) = 1) := by
  sorry

/-- PM.3/catlin-reduction. (2.2): with `ξ(q)/q = max_{q ∣ n} ψ(n)/n`, the reduced-fraction
limsup for `ξ` and the Khinchin limsup for `ψ` agree off the rationals, when `ψ ≤ 1/2`. -/
theorem catlin_reduction (ψ ξ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1 / 2)
    (hξ : ∀ q, 0 < q → IsGreatest {r | ∃ n, 0 < n ∧ q ∣ n ∧ r = ψ n / n} (ξ q / q)) :
    dsLimsup ξ \ Set.range ((↑) : ℚ → ℝ) = khinchinLimsup ψ \ Set.range ((↑) : ℚ → ℝ) := by
  sorry

/-- PM.3/decreasing-series-comparison. If `ψ ≥ 0` is decreasing and `∑ ψ(q) = ∞`, then
`∑ φ(q)ψ(q)/q = ∞`. -/
theorem not_summable_totient_mul_of_antitone (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hanti : Antitone ψ) (hdiv : ¬ Summable ψ) :
    ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q := by
  sorry

/-- PM.3/khinchin-theorem. Khinchin's theorem for `qψ(q)` decreasing. -/
theorem khinchin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hmono : ∀ q r : ℕ, 1 ≤ q → q ≤ r → (r : ℝ) * ψ r ≤ q * ψ q) :
    (Summable ψ → volume (khinchinLimsup ψ) = 0) ∧
      (¬ Summable ψ → volume (khinchinLimsup ψ) = 1) := by
  sorry

/-! ### Section 5: reduction to a second-moment bound -/

/-- PM.3/second-moment-union-bound. For a finite family, `λ(⋃ Aᵢ) · ∑ λ(Aᵢ ∩ Aⱼ) ≥ (∑ λ(Aᵢ))²`
(Cauchy–Schwarz applied to the counting function). -/
theorem sq_sum_volume_le (s : Finset ℕ) (A : ℕ → Set ℝ) (hA : ∀ i, MeasurableSet (A i))
    (hfin : ∀ i, volume (A i) ≠ ∞) :
    (∑ i ∈ s, volume (A i)) ^ 2 ≤
      volume (⋃ i ∈ s, A i) * ∑ i ∈ s, ∑ j ∈ s, volume (A i ∩ A j) := by
  sorry

/-- PM.3/duffin-schaeffer-large-values. Koukoulopoulos–Maynard Lemma 5.2 (Pollington–Vaughan
Theorem 2): the conjecture when every nonzero value of `ψ` is at least `1/2`. -/
theorem volume_dsLimsup_eq_one_of_large (ψ : ℕ → ℝ) (hψ : ∀ q, ψ q = 0 ∨ 1 / 2 ≤ ψ q)
    (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 1 := by
  sorry

/-- PM.3/overlap-estimate. Koukoulopoulos–Maynard Lemma 5.3 (Pollington–Vaughan), with the
indicator corrected to `2M(q,r) ≥ gcd(q,r)` (finding E10). -/
theorem volume_dsSet_inter_le :
    ∃ C : ℝ, ∀ (ψ : ℕ → ℝ), (∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1 / 2) → ∀ q r : ℕ, 1 ≤ q → 1 ≤ r → q ≠ r →
      let M : ℝ := max (r * ψ q) (q * ψ r)
      (volume (dsSet ψ q ∩ dsSet ψ r)).toReal ≤
        C * (volume (dsSet ψ q)).toReal * (volume (dsSet ψ r)).toReal *
          (if (Nat.gcd q r : ℝ) ≤ 2 * M then
            ∏ p ∈ (q * r / Nat.gcd q r ^ 2).primeFactors.filter (fun p : ℕ => M / Nat.gcd q r < (p : ℝ)),
              (1 + 1 / (p : ℝ)) else 0) := by
  sorry

/-- PM.3/second-moment-bound. Koukoulopoulos–Maynard Proposition 5.4, with
`L_t(v,w) = ∑_{p ∣ vw/gcd(v,w)², p ≥ t} 1/p`. -/
theorem second_moment_bound :
    ∃ C : ℝ, ∀ (ψ : ℕ → ℝ), (∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1 / 2) → ∀ X Y : ℕ, 1 ≤ X → X ≤ Y →
      1 ≤ (∑ q ∈ Finset.Icc X Y, ψ q * q.totient / q) →
      (∑ q ∈ Finset.Icc X Y, ψ q * q.totient / q) ≤ 2 → ∀ t : ℝ, 1 ≤ t →
      (∑ vw ∈ (Finset.Icc X Y ×ˢ Finset.Icc X Y).filter (fun vw : ℕ × ℕ =>
          max (vw.1 * ψ vw.2) (vw.2 * ψ vw.1) ≤ t * Nat.gcd vw.1 vw.2 ∧
          10 ≤ ∑ p ∈ (vw.1 * vw.2 / Nat.gcd vw.1 vw.2 ^ 2).primeFactors.filter
            (fun p : ℕ => t ≤ (p : ℝ)), 1 / (p : ℝ)),
        (vw.1.totient * ψ vw.1 / vw.1) * (vw.2.totient * ψ vw.2 / vw.2)) ≤ C / t := by
  sorry

/-! ### Section 6: GCD graphs -/

/-- PM.3/gcd-graph. Koukoulopoulos–Maynard Definition 6.1: a weighted bipartite graph on finite
sets of positive integers with multiplicative data `(P, f, g)`. The set of primes is finite, as
it is throughout the iteration. -/
structure GCDGraph where
  μ : ℕ → ℝ
  μ_nonneg : ∀ n, 0 ≤ μ n
  V : Finset ℕ
  W : Finset ℕ
  E : Finset (ℕ × ℕ)
  E_subset : E ⊆ V ×ˢ W
  pos_of_mem_V : ∀ v ∈ V, 0 < v
  pos_of_mem_W : ∀ w ∈ W, 0 < w
  P : Finset ℕ
  prime_of_mem_P : ∀ p ∈ P, p.Prime
  f : ℕ → ℕ
  g : ℕ → ℕ
  pow_dvd_V : ∀ p ∈ P, ∀ v ∈ V, p ^ f p ∣ v
  pow_dvd_W : ∀ p ∈ P, ∀ w ∈ W, p ^ g p ∣ w
  factorization_gcd : ∀ p ∈ P, ∀ e ∈ E, (Nat.gcd e.1 e.2).factorization p = min (f p) (g p)
  factorization_V : ∀ p ∈ P, f p ≠ g p → ∀ v ∈ V, v.factorization p = f p
  factorization_W : ∀ p ∈ P, f p ≠ g p → ∀ w ∈ W, w.factorization p = g p

namespace GCDGraph

variable (G : GCDGraph)

/-- PM.3/gcd-graph, data: `μ(𝒮) = ∑_{n ∈ 𝒮} μ(n)`. -/
def vertexMeasure (S : Finset ℕ) : ℝ := ∑ n ∈ S, G.μ n

/-- PM.3/gcd-graph, data: `μ(𝒩) = ∑_{(n₁,n₂) ∈ 𝒩} μ(n₁)μ(n₂)`. -/
def edgeMeasure (N : Finset (ℕ × ℕ)) : ℝ := ∑ e ∈ N, G.μ e.1 * G.μ e.2

/-- PM.3/gcd-graph, data: Definition 6.2, `μ(ℰ) > 0`. -/
def IsNontrivial : Prop := 0 < G.edgeMeasure G.E

/-- PM.3/gcd-graph, data: Definition 6.4, `G' ⪯ G`. -/
def IsSubgraph (G' : GCDGraph) : Prop :=
  G'.μ = G.μ ∧ G'.V ⊆ G.V ∧ G'.W ⊆ G.W ∧ G'.E ⊆ G.E ∧ G.P ⊆ G'.P ∧
    ∀ p ∈ G.P, G'.f p = G.f p ∧ G'.g p = G.g p

/-- PM.3/gcd-graph-quality, data: the edge density `δ(G)`, zero when a vertex set has
measure zero. -/
def edgeDensity : ℝ :=
  if G.vertexMeasure G.V = 0 ∨ G.vertexMeasure G.W = 0 then 0
  else G.edgeMeasure G.E / (G.vertexMeasure G.V * G.vertexMeasure G.W)

/-- PM.3/gcd-graph-quality, data: the neighbourhood of `v ∈ 𝒱`. -/
def nbhdV (v : ℕ) : Finset ℕ := (G.W).filter (fun w => (v, w) ∈ G.E)

/-- PM.3/gcd-graph-quality, data: the neighbourhood of `w ∈ 𝒲`. -/
def nbhdW (w : ℕ) : Finset ℕ := (G.V).filter (fun v => (v, w) ∈ G.E)

/-- PM.3/gcd-graph-quality, data: `ℛ(G)`, primes outside `𝒫` dividing the gcd of an edge. -/
def R : Finset ℕ :=
  (G.E.biUnion fun e => (Nat.gcd e.1 e.2).primeFactors).filter (fun p => p ∉ G.P)

/-- PM.3/gcd-graph-quality, data: `𝒱_{p^k} = {v ∈ 𝒱 : p^k ∥ v}`. -/
def Vpow (p k : ℕ) : Finset ℕ := (G.V).filter (fun v => v.factorization p = k)

/-- PM.3/gcd-graph-quality, data: `𝒲_{p^k}`. -/
def Wpow (p k : ℕ) : Finset ℕ := (G.W).filter (fun w => w.factorization p = k)

/-- PM.3/gcd-graph-quality, data: `ℛ♯(G)`, primes of `ℛ(G)` for which one exact power `p^k`
holds on a proportion at least `1 − 10⁴⁰/p` of both vertex sets. -/
def RSharp : Finset ℕ :=
  G.R.filter (fun p => ∃ k ≤ (G.V ∪ G.W).sup id,
    (1 - 10 ^ 40 / (p : ℝ)) * G.vertexMeasure G.V ≤ G.vertexMeasure (G.Vpow p k) ∧
    (1 - 10 ^ 40 / (p : ℝ)) * G.vertexMeasure G.W ≤ G.vertexMeasure (G.Wpow p k))

/-- PM.3/gcd-graph-quality, data: `ℛ♭(G) = ℛ(G) \ ℛ♯(G)`. -/
def RFlat : Finset ℕ := G.R \ G.RSharp

/-- PM.3/gcd-graph-quality. Definition 6.6(d): the quality
`q(G) = δ¹⁰ μ(𝒱) μ(𝒲) ∏_{p ∈ 𝒫} p^{|f(p) − g(p)|} / ((1 − 𝟙_{f(p)=g(p)≥1}/p)² (1 − p^{−31/30})¹⁰)`. -/
def quality : ℝ :=
  G.edgeDensity ^ 10 * G.vertexMeasure G.V * G.vertexMeasure G.W *
    ∏ p ∈ G.P, (p : ℝ) ^ (Int.natAbs ((G.f p : ℤ) - G.g p)) /
      ((1 - (if G.f p = G.g p ∧ 1 ≤ G.f p then 1 / (p : ℝ) else 0)) ^ 2 *
        (1 - (p : ℝ) ^ (-(31 / 30 : ℝ))) ^ 10)

/-- PM.3/gcd-graph, API: Lemma 6.7(a), the subgraph relation is transitive. -/
theorem IsSubgraph.trans {G₁ G₂ G₃ : GCDGraph} (h₁ : G₂.IsSubgraph G₁) (h₂ : G₃.IsSubgraph G₂) :
    G₃.IsSubgraph G₁ := by
  sorry

/-- PM.3/gcd-graph, API: every GCD graph is a subgraph of itself. -/
theorem IsSubgraph.refl : G.IsSubgraph G := by
  sorry

/-- PM.3/gcd-graph, API: Lemma 6.7(b), `ℛ` is monotone along subgraphs. -/
theorem R_subset_of_isSubgraph {G' : GCDGraph} (h : G.IsSubgraph G') : G'.R ⊆ G.R := by
  sorry

/-- PM.3/gcd-graph, API: Lemma 6.7(c), a non-trivial graph has vertex sets of positive
measure. -/
theorem vertexMeasure_pos_of_isNontrivial (h : G.IsNontrivial) :
    0 < G.vertexMeasure G.V ∧ 0 < G.vertexMeasure G.W := by
  sorry

/-- PM.3/gcd-graph-quality, API: Lemma 6.7(d), non-trivial iff positive density iff positive
quality. -/
theorem isNontrivial_iff : (G.IsNontrivial ↔ 0 < G.edgeDensity) ∧
    (G.IsNontrivial ↔ 0 < G.quality) := by
  sorry

/-- PM.3/gcd-graph-quality, API: the remark after Definition 6.6,
`q(G) = μ(ℰ)¹⁰/(μ(𝒱)⁹ μ(𝒲)⁹) ∏ …` when both vertex sets have positive measure. -/
theorem quality_eq (hV : 0 < G.vertexMeasure G.V) (hW : 0 < G.vertexMeasure G.W) :
    G.quality = G.edgeMeasure G.E ^ 10 / (G.vertexMeasure G.V ^ 9 * G.vertexMeasure G.W ^ 9) *
      ∏ p ∈ G.P, (p : ℝ) ^ (Int.natAbs ((G.f p : ℤ) - G.g p)) /
        ((1 - (if G.f p = G.g p ∧ 1 ≤ G.f p then 1 / (p : ℝ) else 0)) ^ 2 *
          (1 - (p : ℝ) ^ (-(31 / 30 : ℝ))) ^ 10) := by
  sorry

/-- PM.3/gcd-graph-quality, API: `δ ≤ 1` when `μ` weights are at most the vertex measures,
here for the edge sets inside `𝒱 × 𝒲`. -/
theorem edgeDensity_le_one : G.edgeDensity ≤ 1 := by
  sorry

/-- PM.3/gcd-graph-special-subgraph. Definition 6.5(c): `G_{p^k,p^ℓ}`, restricting to
`𝒱_{p^k}`, `𝒲_{p^ℓ}` and recording `f(p) = k`, `g(p) = ℓ`. -/
def restrictPow (p k ℓ : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) : GCDGraph where
  μ := G.μ
  μ_nonneg := G.μ_nonneg
  V := G.Vpow p k
  W := G.Wpow p ℓ
  E := G.E.filter (fun e => e.1 ∈ G.Vpow p k ∧ e.2 ∈ G.Wpow p ℓ)
  E_subset := by sorry
  pos_of_mem_V := by sorry
  pos_of_mem_W := by sorry
  P := insert p G.P
  prime_of_mem_P := by sorry
  f := Function.update G.f p k
  g := Function.update G.g p ℓ
  pow_dvd_V := by sorry
  pow_dvd_W := by sorry
  factorization_gcd := by sorry
  factorization_V := by sorry
  factorization_W := by sorry

/-- PM.3/gcd-graph-special-subgraph, API: `G_{p^k,p^ℓ} ⪯ G`. -/
theorem restrictPow_isSubgraph (p k ℓ : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) :
    G.IsSubgraph (G.restrictPow p k ℓ hp hpP) := by
  sorry

/-- PM.3/gcd-graph-special-subgraph, API: `p` joins the primes and leaves `ℛ`. -/
theorem R_restrictPow (p k ℓ : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) :
    (G.restrictPow p k ℓ hp hpP).R ⊆ G.R.erase p := by
  sorry

/-- PM.3/special-subgraph-quality-ratio. Koukoulopoulos–Maynard Lemma 11.1, for any prime
`p ∉ 𝒫` (the source assumes `p ∈ ℛ(G)`; see finding E13). -/
theorem quality_restrictPow (p k ℓ : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) (hG : G.IsNontrivial)
    (hV : 0 < G.vertexMeasure (G.Vpow p k)) (hW : 0 < G.vertexMeasure (G.Wpow p ℓ)) :
    (G.restrictPow p k ℓ hp hpP).quality / G.quality =
      ((G.restrictPow p k ℓ hp hpP).edgeMeasure (G.restrictPow p k ℓ hp hpP).E /
          G.edgeMeasure G.E) ^ 10 *
        (G.vertexMeasure G.V / G.vertexMeasure (G.Vpow p k)) ^ 9 *
        (G.vertexMeasure G.W / G.vertexMeasure (G.Wpow p ℓ)) ^ 9 *
        ((p : ℝ) ^ (Int.natAbs ((k : ℤ) - ℓ)) /
          ((1 - (if k = ℓ ∧ 1 ≤ k then 1 / (p : ℝ) else 0)) ^ 2 *
            (1 - (p : ℝ) ^ (-(31 / 30 : ℝ))) ^ 10)) := by
  sorry

example (hE : G.E = {(2, 3)}) (hμ : G.μ = fun _ => 1) : G.edgeMeasure G.E = 1 := by
  sorry

example (hE : G.E = ∅) : ¬ G.IsNontrivial := by
  sorry

example : ∀ p ∈ G.P, ∀ e ∈ G.E, ¬ p ^ (min (G.f p) (G.g p) + 1) ∣ Nat.gcd e.1 e.2 := by
  sorry

example (hE : G.E = ∅) : G.quality = 0 := by
  sorry

example (hP : G.P = ∅) (hV : 0 < G.vertexMeasure G.V) (hW : 0 < G.vertexMeasure G.W) :
    G.quality = G.edgeDensity ^ 9 * G.edgeMeasure G.E := by
  sorry

example (hcop : ∀ e ∈ G.E, Nat.gcd e.1 e.2 = 1) : G.R = ∅ := by
  sorry

example (hp : (2 : ℕ).Prime) (hpP : 2 ∉ G.P) :
    (G.restrictPow 2 0 0 hp hpP).V = G.V.filter (fun v => ¬ 2 ∣ v) := by
  sorry

example (p : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) (k ℓ : ℕ) (hkℓ : k ≠ ℓ) :
    ∀ v ∈ (G.restrictPow p k ℓ hp hpP).V, v.factorization p = k := by
  sorry

example (p k ℓ : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) (hV : G.Vpow p k = ∅) :
    (G.restrictPow p k ℓ hp hpP).quality = 0 := by
  sorry

/-! ### Section 7: reduction to a good GCD subgraph -/

/-- PM.3/edge-set-bound. Koukoulopoulos–Maynard Proposition 6.3, with `μ(v) = ψ(v)φ(v)/v`,
trivial primes and `ℰ ⊆ ℰ_t`. -/
theorem edgeMeasure_le_of_Et :
    ∃ C : ℝ, ∀ (G : GCDGraph) (ψ : ℕ → ℝ) (t : ℝ), 1 ≤ t → G.P = ∅ → G.W = G.V →
      (∀ v, G.μ v = ψ v * v.totient / v) → G.vertexMeasure G.V ≤ 2 →
      (∀ e ∈ G.E, max (e.1 * ψ e.2) (e.2 * ψ e.1) ≤ t * Nat.gcd e.1 e.2 ∧
        10 ≤ ∑ p ∈ (e.1 * e.2 / Nat.gcd e.1 e.2 ^ 2).primeFactors.filter (fun p : ℕ => t ≤ (p : ℝ)),
          1 / (p : ℝ)) →
      G.edgeMeasure G.E ≤ C / t := by
  sorry

/-- PM.3/multiplicative-function-bound. The case of Koukoulopoulos–Maynard Lemma 7.2 used in
Lemma 7.3: `f` multiplicative with `f(p^ν) = f(p) ≥ 1` for `ν ≥ 1`. -/
theorem sum_le_mul_exp_of_const_on_powers (f : ℕ → ℝ) (hf1 : f 1 = 1)
    (hmul : ∀ m n, Nat.Coprime m n → f (m * n) = f m * f n)
    (hpow : ∀ p ν, p.Prime → 1 ≤ ν → f (p ^ ν) = f p) (hge : ∀ p, p.Prime → 1 ≤ f p)
    (x : ℕ) :
    ∑ n ∈ Finset.Icc 1 x, f n ≤
      x * Real.exp (∑ p ∈ (Finset.Icc 1 x).filter Nat.Prime, (f p - 1) / p) := by
  sorry

/-- PM.3/few-integers-many-large-primes. Koukoulopoulos–Maynard Lemma 7.3. -/
theorem card_many_large_prime_factors_le :
    ∃ C : ℝ, ∀ (x t c : ℝ), 1 ≤ x → 1 ≤ t → 1 ≤ c → c ≤ 10 →
      (((Finset.Icc 1 ⌊x⌋₊).filter (fun n : ℕ =>
          c ≤ ∑ p ∈ n.primeFactors.filter (fun p : ℕ => t ≤ (p : ℝ)), 1 / (p : ℝ))).card : ℝ) ≤
        C * x * Real.exp (-(t ^ Real.exp (c - 1))) := by
  sorry

/-- PM.3/good-gcd-subgraph. Koukoulopoulos–Maynard Proposition 7.1. -/
theorem exists_good_subgraph :
    ∃ C : ℝ, 0 < C ∧ ∀ (G : GCDGraph) (t : ℝ), G.P = ∅ → 0 < G.edgeDensity →
      (∀ e ∈ G.E, 10 ≤ ∑ p ∈ (e.1 * e.2 / Nat.gcd e.1 e.2 ^ 2).primeFactors.filter
        (fun p : ℕ => t ≤ (p : ℝ)), 1 / (p : ℝ)) →
      10 * G.edgeDensity ^ (-(1 / 50 : ℝ)) ≤ t → 10 ^ 2000 < t →
      ∃ G' : GCDGraph, G.IsSubgraph G' ∧ 0 < G'.edgeDensity ∧ G'.R = ∅ ∧
        (∀ v ∈ G'.V, 9 * G'.edgeDensity / 10 * G'.vertexMeasure G'.W ≤
          G'.vertexMeasure (G'.nbhdV v)) ∧
        (∀ w ∈ G'.W, 9 * G'.edgeDensity / 10 * G'.vertexMeasure G'.V ≤
          G'.vertexMeasure (G'.nbhdW w)) ∧
        (C * G.edgeDensity * t ^ 50 * G.quality ≤ G'.quality ∨
          (C * G.quality ≤ G'.quality ∧ ∀ e ∈ G'.E,
            let v' := e.1 / ∏ p ∈ G'.P, p ^ G'.f p
            let w' := e.2 / ∏ p ∈ G'.P, p ^ G'.g p
            4 ≤ ∑ p ∈ (v' * w' / Nat.gcd v' w' ^ 2).primeFactors.filter (fun p : ℕ => t ≤ (p : ℝ)),
              1 / (p : ℝ))) := by
  sorry

/-! ### Section 8: the iterative propositions -/

/-- PM.3/iteration-flat-primes. Koukoulopoulos–Maynard Proposition 8.1. -/
theorem exists_subgraph_of_RFlat_nonempty (G : GCDGraph) (hδ : 0 < G.edgeDensity)
    (hR : ∀ p ∈ G.R, 10 ^ 2000 < p) (hflat : G.RFlat.Nonempty) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ 0 < G'.edgeDensity ∧ G.P ⊂ G'.P ∧
      G'.P ⊆ G.P ∪ G.R ∧ G'.R ⊂ G.R ∧
      (2 : ℝ) ^ ((G'.P \ G.P).filter (fun p => G'.f p ≠ G'.g p)).card ≤
        min 1 (G'.edgeDensity / G.edgeDensity) * (G'.quality / G.quality) := by
  sorry

/-- PM.3/iteration-sharp-primes. Koukoulopoulos–Maynard Proposition 8.2. -/
theorem exists_subgraph_of_RFlat_empty (G : GCDGraph) (hδ : 0 < G.edgeDensity)
    (hR : ∀ p ∈ G.R, 10 ^ 2000 < p) (hflat : G.RFlat = ∅) (hsharp : G.RSharp.Nonempty) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G.P ⊂ G'.P ∧ G'.P ⊆ G.P ∪ G.R ∧ G'.R ⊂ G.R ∧
      G.quality ≤ G'.quality := by
  sorry

/-- PM.3/iteration-small-primes. Koukoulopoulos–Maynard Proposition 8.3. -/
theorem exists_subgraph_small_primes (G : GCDGraph) (hδ : 0 < G.edgeDensity) (hP : G.P = ∅) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ 0 < G'.edgeDensity ∧ (∀ p ∈ G'.P, p ≤ 10 ^ 2000) ∧
      (∀ p ∈ G'.R, 10 ^ 2000 < p) ∧
      1 / (10 : ℝ) ^ (10 ^ 3000 : ℕ) ≤
        min 1 (G'.edgeDensity / G.edgeDensity) * (G'.quality / G.quality) := by
  sorry

/-- PM.3/remove-R-from-anatomy. Koukoulopoulos–Maynard Lemma 8.4. -/
theorem exists_subgraph_remove_R (G : GCDGraph) (t : ℝ) (ht : 300 ≤ t)
    (hflat : G.RFlat = ∅) (hδ : (10 / t) ^ 50 ≤ G.edgeDensity)
    (hE : ∀ e ∈ G.E, 10 ≤ ∑ p ∈ (e.1 * e.2 / Nat.gcd e.1 e.2 ^ 2).primeFactors.filter
      (fun p : ℕ => t ≤ (p : ℝ)), 1 / (p : ℝ)) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.V = G.V ∧ G'.W = G.W ∧ G'.P = G.P ∧
      G.quality / 2 ≤ G'.quality ∧ 0 < G'.quality ∧
      ∀ e ∈ G'.E, 5 ≤ ∑ p ∈ (e.1 * e.2 / Nat.gcd e.1 e.2 ^ 2).primeFactors.filter
        (fun p : ℕ => t ≤ (p : ℝ) ∧ p ∉ G.R), 1 / (p : ℝ) := by
  sorry

/-- PM.3/high-degree-subgraph. Koukoulopoulos–Maynard Lemma 8.5. -/
theorem exists_high_degree_subgraph (G : GCDGraph) (hδ : 0 < G.edgeDensity) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = G.P ∧ 0 < G'.edgeDensity ∧
      G.quality ≤ G'.quality ∧ G.edgeDensity ≤ G'.edgeDensity ∧
      (∀ v ∈ G'.V, 9 * G'.edgeDensity / 10 * G'.vertexMeasure G'.W ≤
        G'.vertexMeasure (G'.nbhdV v)) ∧
      ∀ w ∈ G'.W, 9 * G'.edgeDensity / 10 * G'.vertexMeasure G'.V ≤
        G'.vertexMeasure (G'.nbhdW w) := by
  sorry

/-- PM.3/degree-or-increment. Koukoulopoulos–Maynard Lemma 10.1. -/
theorem high_degree_or_increment (G : GCDGraph) (hδ : 0 < G.edgeDensity) :
    ((∀ v ∈ G.V, 9 * G.edgeDensity / 10 * G.vertexMeasure G.W ≤ G.vertexMeasure (G.nbhdV v)) ∧
      ∀ w ∈ G.W, 9 * G.edgeDensity / 10 * G.vertexMeasure G.V ≤ G.vertexMeasure (G.nbhdW w)) ∨
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = G.P ∧ G.edgeDensity ≤ G'.edgeDensity ∧
      G.quality ≤ G'.quality ∧ (G'.V ⊂ G.V ∨ G'.W ⊂ G.W) := by
  sorry

/-! ### Section 11: preparatory lemmas -/

/-- PM.3/partition-pigeonhole. Koukoulopoulos–Maynard Lemma 11.2. -/
theorem exists_part_subgraph (G : GCDGraph) (hδ : 0 < G.edgeDensity) (I J : ℕ)
    (Vs : Fin I → Finset ℕ) (Ws : Fin J → Finset ℕ)
    (hV : (Finset.univ : Finset (Fin I)).biUnion Vs = G.V)
    (hVd : Set.PairwiseDisjoint (Set.univ : Set (Fin I)) Vs)
    (hW : (Finset.univ : Finset (Fin J)).biUnion Ws = G.W)
    (hWd : Set.PairwiseDisjoint (Set.univ : Set (Fin J)) Ws) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = G.P ∧ 0 < G'.edgeDensity ∧
      G.quality / ((I : ℝ) * J) ^ 10 ≤ G'.quality ∧
      G.edgeDensity / ((I : ℝ) * J) ≤ G'.edgeDensity ∧
      (∃ i, G'.V = Vs i) ∧ (∃ j, G'.W = Ws j) ∧ G'.E = G.E.filter (fun e => e.1 ∈ G'.V ∧ e.2 ∈ G'.W) := by
  sorry

/-- PM.3/unbalanced-sets-few-edges. Koukoulopoulos–Maynard Lemma 11.3 (and, by symmetry,
Lemma 11.4), for a prime `p ∉ 𝒫`. -/
theorem restrictPow_increment_or_few_edges (G : GCDGraph) (hδ : 0 < G.edgeDensity)
    (p : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) (r k : ℕ) (hr : 1 ≤ r)
    (hpr : (10 : ℝ) ^ 2000 < (p : ℝ) ^ r)
    (hW : (1 - 10 ^ 40 / (p : ℝ)) * G.vertexMeasure G.W ≤ G.vertexMeasure (G.Wpow p k)) :
    (∃ ℓ : ℕ, r + 1 ≤ Int.natAbs ((ℓ : ℤ) - k) ∧
      2 * G.quality < (G.restrictPow p k ℓ hp hpP).quality ∧
      2 * G.edgeDensity * G.quality <
        (G.restrictPow p k ℓ hp hpP).edgeDensity * (G.restrictPow p k ℓ hp hpP).quality) ∨
    ∀ L : Finset ℕ, (∀ ℓ ∈ L, r + 1 ≤ Int.natAbs ((ℓ : ℤ) - k)) →
      ∑ ℓ ∈ L, (G.restrictPow p k ℓ hp hpP).edgeMeasure (G.restrictPow p k ℓ hp hpP).E ≤
        G.edgeMeasure G.E / (4 * (p : ℝ) ^ (31 / 30 : ℝ)) := by
  sorry

/-- PM.3/small-sets-few-edges. Koukoulopoulos–Maynard Lemma 11.5. -/
theorem few_edges_small_sets_or_increment (G : GCDGraph) (hδ : 0 < G.edgeDensity) (η : ℝ)
    (hη0 : 0 < η) (hη1 : η < 1) :
    (∀ A ⊆ G.V, ∀ B ⊆ G.W, G.vertexMeasure A ≤ η * G.vertexMeasure G.V →
      G.vertexMeasure B ≤ η * G.vertexMeasure G.W →
      G.edgeMeasure (G.E.filter (fun e => e.1 ∈ A ∧ e.2 ∈ B)) ≤ η ^ (9 / 5 : ℝ) * G.edgeMeasure G.E) ∨
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = G.P ∧ G.quality < G'.quality ∧
      G'.V ⊂ G.V ∧ G'.W ⊂ G.W := by
  sorry

/-- PM.3/small-sets-subgraph. Koukoulopoulos–Maynard Lemma 11.6. -/
theorem exists_subgraph_few_edges_small_sets (G : GCDGraph) (hδ : 0 < G.edgeDensity) (η : ℝ)
    (hη0 : 0 < η) (hη1 : η < 1) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = G.P ∧ 0 < G'.edgeDensity ∧
      G.quality ≤ G'.quality ∧
      ∀ A ⊆ G'.V, ∀ B ⊆ G'.W, G'.vertexMeasure A ≤ η * G'.vertexMeasure G'.V →
        G'.vertexMeasure B ≤ η * G'.vertexMeasure G'.W →
        G'.edgeMeasure (G'.E.filter (fun e => e.1 ∈ A ∧ e.2 ∈ B)) ≤
          η ^ (9 / 5 : ℝ) * G'.edgeMeasure G'.E := by
  sorry

/-! ### Sections 12–14: proofs of the iterative propositions -/

/-- PM.3/edge-distribution-bound. Koukoulopoulos–Maynard Lemma 12.1. -/
theorem exists_heavy_restriction (G : GCDGraph) (hδ : 0 < G.edgeDensity) (p : ℕ) (hp : p.Prime)
    (hpP : p ∉ G.P) :
    ∃ k ℓ : ℕ, 0 < G.vertexMeasure (G.Vpow p k) ∧ 0 < G.vertexMeasure (G.Wpow p ℓ) ∧
      let α := fun j => G.vertexMeasure (G.Vpow p j) / G.vertexMeasure G.V
      let β := fun j => G.vertexMeasure (G.Wpow p j) / G.vertexMeasure G.W
      (if k = ℓ then (α k * β k) ^ (9 / 10 : ℝ)
        else (α k * (1 - β k) + β k * (1 - α k) + α ℓ * (1 - β ℓ) + β ℓ * (1 - α ℓ)) /
          ((2 : ℝ) ^ ((Int.natAbs ((k : ℤ) - ℓ) : ℝ) / 20) * 1000)) * G.edgeMeasure G.E ≤
        (G.restrictPow p k ℓ hp hpP).edgeMeasure (G.restrictPow p k ℓ hp hpP).E := by
  sorry

/-- PM.3/large-prime-increment. Koukoulopoulos–Maynard Lemma 12.2. -/
theorem restrictPow_increment_or_concentrated (G : GCDGraph) (hδ : 0 < G.edgeDensity) (p : ℕ)
    (hp : p.Prime) (hpP : p ∉ G.P) (hp40 : (10 : ℝ) ^ 40 < p) :
    (∃ k ℓ : ℕ, 0 < (G.restrictPow p k ℓ hp hpP).edgeDensity ∧
      (2 : ℝ) ^ (if k = ℓ then 0 else 1) ≤
        min 1 ((G.restrictPow p k ℓ hp hpP).edgeDensity / G.edgeDensity) *
          ((G.restrictPow p k ℓ hp hpP).quality / G.quality)) ∨
    ∃ k : ℕ, (1 - 10 ^ 40 / (p : ℝ)) * G.vertexMeasure G.V ≤ G.vertexMeasure (G.Vpow p k) ∧
      (1 - 10 ^ 40 / (p : ℝ)) * G.vertexMeasure G.W ≤ G.vertexMeasure (G.Wpow p k) := by
  sorry

/-- PM.3/any-prime-bounded-loss. Koukoulopoulos–Maynard Lemma 13.1. -/
theorem restrictPow_bounded_loss_or_concentrated (G : GCDGraph) (hδ : 0 < G.edgeDensity)
    (p : ℕ) (hp : p.Prime) (hpP : p ∉ G.P) :
    (∃ k ℓ : ℕ, 0 < (G.restrictPow p k ℓ hp hpP).edgeDensity ∧
      1 / (10 : ℝ) ^ 40 ≤ min 1 ((G.restrictPow p k ℓ hp hpP).edgeDensity / G.edgeDensity) *
          ((G.restrictPow p k ℓ hp hpP).quality / G.quality)) ∨
    ∃ k : ℕ, 9 / 10 * G.vertexMeasure G.V ≤ G.vertexMeasure (G.Vpow p k) ∧
      9 / 10 * G.vertexMeasure G.W ≤ G.vertexMeasure (G.Wpow p k) := by
  sorry

/-- PM.3/add-small-prime. Koukoulopoulos–Maynard Lemma 13.2. -/
theorem exists_subgraph_add_small_prime (G : GCDGraph) (hδ : 0 < G.edgeDensity) (p : ℕ)
    (hp : p ∈ G.R) (hp2000 : p ≤ 10 ^ 2000) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = insert p G.P ∧ G'.R ⊆ G.R.erase p ∧
      0 < G'.edgeDensity ∧
      1 / (10 : ℝ) ^ 50 ≤ min 1 (G'.edgeDensity / G.edgeDensity) * (G'.quality / G.quality) := by
  sorry

/-- PM.3/sharp-prime-increment. Koukoulopoulos–Maynard Lemma 14.1. -/
theorem exists_subgraph_add_large_prime (G : GCDGraph) (hδ : 0 < G.edgeDensity) (p : ℕ)
    (hp : p ∈ G.R) (hp2000 : 10 ^ 2000 ≤ p) :
    ∃ G' : GCDGraph, G.IsSubgraph G' ∧ G'.P = insert p G.P ∧ G'.R ⊆ G.R.erase p ∧
      G.quality ≤ G'.quality ∧ 0 < G'.quality := by
  sorry

end GCDGraph

end TauCeti.DuffinSchaeffer

/-!
## Continuation: all six metric/probabilistic stages
Every proof remains a planning admission. Omitted signatures identify unresolved native interfaces.
The current compilation check covers this Mathlib-only section, not the incoming Tau Ceti prefix.
-/
noncomputable section
open MeasureTheory Filter Set
open scoped BigOperators Topology NNReal ENNReal
namespace TauCeti.Probability.MetricNumberTheory

-- ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate
def IsAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  f 1 = 0 ∧ ∀ m n : ℕ, 0 < m → 0 < n → m.Coprime n → f (m*n) = f m + f n

-- ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-1
theorem IsAdditive.map_one {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsAdditive f) : f 1 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-2
theorem IsAdditive.map_mul {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsAdditive f) {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hc : m.Coprime n) :
    f (m*n) = f m + f n := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/additive-predicate-api-3
theorem IsAdditive.add {R : Type*} [AddCommMonoid R] {f g : ArithmeticFunction R}
    (hf : IsAdditive f) (hg : IsAdditive g) : IsAdditive (f+g) := by sorry

-- test additive_zero
example : IsAdditive (0 : ArithmeticFunction ℝ) := by sorry

-- test additive_omega
example : IsAdditive (ArithmeticFunction.cardDistinctFactors : ArithmeticFunction ℝ) := by sorry

-- test additive_Omega
example : IsAdditive (ArithmeticFunction.cardFactors : ArithmeticFunction ℝ) := by sorry

-- test additive_unit_rejected
example : ¬ IsAdditive (1 : ArithmeticFunction ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate
def IsStronglyAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  IsAdditive f ∧ ∀ p k : ℕ, p.Prime → 0 < k → f (p^k) = f p

-- ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-1
theorem IsStronglyAdditive.isAdditive {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsStronglyAdditive f) : IsAdditive f := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-2
theorem IsStronglyAdditive.prime_pow {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsStronglyAdditive f) {p k : ℕ} (hp : p.Prime) (hk : 0 < k) : f (p^k) = f p := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-predicate-api-3
theorem IsStronglyAdditive.add {R : Type*} [AddCommMonoid R] {f g : ArithmeticFunction R}
    (hf : IsStronglyAdditive f) (hg : IsStronglyAdditive g) : IsStronglyAdditive (f+g) := by sorry

-- test strong_zero
example : IsStronglyAdditive (0 : ArithmeticFunction ℝ) := by sorry

-- test strong_omega
example : IsStronglyAdditive (ArithmeticFunction.cardDistinctFactors : ArithmeticFunction ℝ) := by sorry

-- test strong_Omega_rejected
example : ¬ IsStronglyAdditive (ArithmeticFunction.cardFactors : ArithmeticFunction ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/additive-prime-powers
theorem additive_prime_powers {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsAdditive f) {n : ℕ} (hn : 0 < n) :
    f n = ∑ p ∈ n.primeFactors, f (p ^ n.factorization p) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/strongly-additive-primes
theorem strongly_additive_primes {R : Type*} [AddCommMonoid R] {f : ArithmeticFunction R}
    (h : IsStronglyAdditive f) {n : ℕ} (hn : 0 < n) : f n = ∑ p ∈ n.primeFactors, f p := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/real-concentration
def concentration (ν : ProbabilityMeasure ℝ) (δ : ℝ) : ℝ :=
  sSup {v : ℝ | ∃ u : ℝ, v = (ν : Measure ℝ).real (Set.Ioo (u-δ) (u+δ))}

-- ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-1
theorem concentration_bounds (ν : ProbabilityMeasure ℝ) (δ : ℝ) :
    0 ≤ concentration ν δ ∧ concentration ν δ ≤ 1 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-2
theorem concentration_mono (ν : ProbabilityMeasure ℝ) {δ ε : ℝ} (h : δ ≤ ε) :
    concentration ν δ ≤ concentration ν ε := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-3
theorem concentration_translate (ν : ProbabilityMeasure ℝ) (b δ : ℝ) :
    concentration (ν.map (fun x => x+b)) δ = concentration ν δ := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/real-concentration-api-4
theorem concentration_scale (ν : ProbabilityMeasure ℝ) {a : ℝ} (ha : a ≠ 0) (δ : ℝ) :
    concentration (ν.map (fun x => a*x)) δ = concentration ν (δ/|a|) := by sorry

-- test concentration_zero_radius
example : concentration (⟨Measure.dirac 0, inferInstance⟩ : ProbabilityMeasure ℝ) 0 = 0 := by sorry

-- test concentration_dirac_positive
example (δ : ℝ) (hδ : 0 < δ) : concentration (⟨Measure.dirac 0, inferInstance⟩ : ProbabilityMeasure ℝ) δ = 1 := by sorry

-- test concentration_two_atoms_boundary
example (ν : ProbabilityMeasure ℝ)
    (hν : (ν : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 + (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    concentration ν (1/2) = 1/2 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/kolmogorov-rogozin
theorem kolmogorov_rogozin : ∃ C : ℝ, 0 < C ∧
    ∀ (Ω : Type*) [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω) (k : ℕ) (X : Fin k → Ω → ℝ)
      (hX : ∀ j, AEMeasurable (X j) (μ : Measure Ω))
      (hi : ProbabilityTheory.iIndepFun X (μ : Measure Ω)) (δ : ℝ) (hδ : 0 < δ),
      let D := ∑ j, (1 - concentration (μ.map (X j)) δ)
      0 < D → concentration (μ.map (fun ω => ∑ j, X j ω)) δ ≤ C / Real.sqrt D := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/cdf-weak-criterion
theorem cdf_weak_criterion (νs : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ) :
    Tendsto νs atTop (𝓝 ν) ↔
      ∀ x : ℝ, ContinuousAt (ProbabilityTheory.cdf (ν : Measure ℝ)) x →
        Tendsto (fun m => ProbabilityTheory.cdf (νs m : Measure ℝ) x) atTop
          (𝓝 (ProbabilityTheory.cdf (ν : Measure ℝ) x)) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.1/turan-kubilius
theorem turan_kubilius (f : ArithmeticFunction ℝ) (hf : IsAdditive f) (N : ℕ) (hN : 2 ≤ N) :
    let A := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then f (p^k)/(p^k : ℕ) else 0
    let B := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then (f (p^k))^2/(p^k : ℕ) else 0
    ∑ n ∈ Finset.Icc 1 N, (f n-A)^2 ≤ 30*(N:ℝ)*B := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.1/hardy-ramanujan
theorem hardy_ramanujan (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardDistinctFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.1/erdos-kac
theorem erdos_kac (x : ℝ) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardDistinctFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.1/restricted-squarefree-window
theorem restricted_squarefree_window : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    ((D.filter (fun n => Real.rpow (Real.log (Real.log N)) (2/3) ≤
      |(ArithmeticFunction.cardDistinctFactors n : ℝ) - (1/2)*Real.log (Real.log N)|)).card : ℝ) ≤
      C * D.card / Real.rpow (Real.log (Real.log N)) (1/100) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy
def starDiscrepancy {N : ℕ} (x : Fin N → ℝ) : ℝ :=
  if N = 0 then 0 else sSup {v : ℝ | ∃ t ∈ Set.Icc (0:ℝ) 1,
    v = |((Finset.univ.filter (fun j => x j < t)).card : ℝ)/(N:ℝ)-t|}

-- ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-1
theorem starDiscrepancy_bounds {N : ℕ} (x : Fin N → ℝ) :
    0 ≤ starDiscrepancy x ∧ starDiscrepancy x ≤ 1 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-2
theorem starDiscrepancy_perm {N : ℕ} (x : Fin N → ℝ) (σ : Equiv.Perm (Fin N)) :
    starDiscrepancy (x ∘ σ) = starDiscrepancy x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy-api-3
theorem starDiscrepancy_perturb {N : ℕ} (x y : Fin N → ℝ) {ε : ℝ} (hε : 0 ≤ ε)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (hy : ∀ j, y j ∈ Set.Ico (0:ℝ) 1)
    (hxy : ∀ j, |x j-y j| ≤ ε) : |starDiscrepancy x-starDiscrepancy y| ≤ ε := by sorry

-- test discrepancy_empty
example (x : Fin 0 → ℝ) : starDiscrepancy x = 0 := by sorry

-- test discrepancy_at_zero
example : starDiscrepancy (fun _ : Fin 1 => (0:ℝ)) = 1 := by sorry

-- test discrepancy_midpoint
example : starDiscrepancy (fun _ : Fin 1 => (1/2:ℝ)) = 1/2 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/erdos-turan
theorem erdos_turan {N H : ℕ} (hN : 0 < N) (hH : 0 < H) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) :
    starDiscrepancy x ≤ 3 / ((H:ℝ)+1) +
      3 * ∑ h ∈ Finset.Icc 1 H,
        ‖(∑ j : Fin N, Complex.exp (2*Real.pi*Complex.I*(h:ℂ)*(x j:ℂ))) / (N:ℂ)‖ / (h:ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/koksma
theorem koksma {N : ℕ} (hN : 0 < N) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (f : ℝ → ℝ) (hf : BoundedVariationOn f (Set.Icc 0 1)) :
    |(∑ j, f (x j))/(N:ℝ) - ∫ t in Set.Icc (0:ℝ) 1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal * starDiscrepancy x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/normal-base
def IsNormalBase (b : ℕ) [NeZero b] (x : ℝ) : Prop :=
  2 ≤ b ∧ x ∈ Set.Ico (0:ℝ) 1 ∧ ∀ k : ℕ, ∀ w : Fin k → Fin b,
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹)

-- ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-1
theorem IsNormalBase.block {b : ℕ} [NeZero b] {x : ℝ} (h : IsNormalBase b x)
    (k : ℕ) (w : Fin k → Fin b) :
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-2
theorem IsNormalBase.digit {b : ℕ} [NeZero b] {x : ℝ} (h : IsNormalBase b x) (a : Fin b) :
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j => Real.digits x b j = a)).card / (N:ℝ))
      atTop (𝓝 (1/(b:ℝ))) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/normal-base-api-3
theorem IsNormalBase.empty_block {b : ℕ} [NeZero b] (x : ℝ) (w : Fin 0 → Fin b) :
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin 0, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 1) := by sorry

-- test normal_zero_rejected
example : ¬ IsNormalBase 2 0 := by sorry

-- test normal_half_rejected
example : ¬ IsNormalBase 2 (1/2) := by sorry

-- test normal_base_one_rejected
example (x : ℝ) : ¬ IsNormalBase 1 x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/borel-normal
theorem borel_normal {b : ℕ} [NeZero b] (hb : 2 ≤ b) :
    ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)), IsNormalBase b x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/borel-normal-all-bases
theorem borel_normal_all_bases : ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)),
    ∀ b : ℕ, ∀ hb : 2 ≤ b, @IsNormalBase b ⟨by omega⟩ x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge
def IsDimensionGauge (f : ℝ≥0 → ℝ≥0) : Prop :=
  f 0 = 0 ∧ (∀ r, 0 < r → 0 < f r) ∧ Monotone f ∧ Continuous f

-- ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-1
theorem IsDimensionGauge.zero {f : ℝ≥0 → ℝ≥0} (h : IsDimensionGauge f) : f 0 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-2
theorem IsDimensionGauge.positive {f : ℝ≥0 → ℝ≥0} (h : IsDimensionGauge f) {r : ℝ≥0} (hr : 0 < r) : 0 < f r := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/dimension-gauge-api-3
theorem IsDimensionGauge.tendsto_zero {f : ℝ≥0 → ℝ≥0} (h : IsDimensionGauge f) :
    Tendsto f (𝓝 0) (𝓝 0) := by sorry

-- test gauge_linear
example : IsDimensionGauge (fun r : ℝ≥0 => r) := by sorry

-- test gauge_square
example : IsDimensionGauge (fun r : ℝ≥0 => r^2) := by sorry

-- test gauge_constant_rejected
example : ¬ IsDimensionGauge (fun _ : ℝ≥0 => 1) := by sorry

-- test gauge_zero_rejected
example : ¬ IsDimensionGauge (fun _ : ℝ≥0 => 0) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-geometry
theorem mass_transference_ball_geometry {k : ℕ} (a m : EuclideanSpace ℝ (Fin k))
    {rA rM c : ℝ} (hA : 0 < rA) (hM : 0 < rM) (hc : 3 ≤ c)
    (hmeet : (Metric.closedBall a rA ∩ Metric.closedBall m rM).Nonempty)
    (hout : (Metric.closedBall a rA \ Metric.closedBall m (c*rM)).Nonempty) :
    rM ≤ rA ∧ Metric.closedBall m (c*rM) ⊆ Metric.closedBall a (5*rA) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-power
theorem mass_transference_power (s : ℝ) (hs : 0 < s) (hs1 : s < 1)
    (c r : ℕ → ℝ) (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))
    (hfull : ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      volume (Metric.ball x R \ (limsup (fun i => Metric.closedBall (c i) (Real.rpow (r i) s)) atTop)) = 0) :
    ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      Measure.hausdorffMeasure s (Metric.ball x R ∩ limsup (fun i => Metric.closedBall (c i) (r i)) atTop) = ∞ := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/quasi-independent-borel-cantelli
theorem quasi_independent_limsup {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (E : ℕ → Set Ω) (hm : ∀ n, MeasurableSet (E n)) {C : ℝ} (hC : 1 ≤ C)
    (hdiv : ¬ Summable (fun n => (μ : Measure Ω).real (E n)))
    (hpair : ∀ M : ℕ, ∀ K : ℕ, ∃ N : ℕ, M ≤ N ∧ K ≤ N ∧
      (∑ i ∈ Finset.Icc M N, ∑ j ∈ Finset.Icc M N, (μ : Measure Ω).real (E i ∩ E j)) ≤
        C * (∑ i ∈ Finset.Icc M N, (μ : Measure Ω).real (E i))^2) :
    1/C ≤ (μ : Measure Ω).real (limsup E atTop) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise
theorem birkhoff_pointwise {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω))
    (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop
      (𝓝 (MeasureTheory.condExp (MeasurableSpace.invariants T) (μ : Measure Ω) f x)) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic
theorem birkhoff_pointwise_ergodic {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : Ergodic T (μ : Measure Ω)) (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop (𝓝 (∫ y, f y ∂(μ : Measure Ω))) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-map
def gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-1
theorem gaussMap_zero : gaussMap 0 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-2
theorem gaussMap_range (x : ℝ) : gaussMap x ∈ Set.Ico (0:ℝ) 1 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-map-api-3
theorem gaussMap_measurable : Measurable gaussMap := by sorry

-- test gauss_half
example : gaussMap (1/2) = 0 := by sorry

-- test gauss_two_thirds
example : gaussMap (2/3) = 1/2 := by sorry

-- test gauss_zero
example : gaussMap 0 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure
def gaussMeasure : Measure ℝ :=
  (volume.restrict (Set.Ioc (0:ℝ) 1)).withDensity (fun x => ENNReal.ofReal (1 / ((1+x)*Real.log 2)))
instance gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-1
theorem gaussMeasure_univ : gaussMeasure Set.univ = 1 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-2
theorem gaussMeasure_interval {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 1) :
    gaussMeasure.real (Set.Ioc a b) = (Real.log (1+b)-Real.log (1+a))/Real.log 2 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-measure-api-3
theorem gaussMeasure_equivalent :
    gaussMeasure ≪ volume.restrict (Set.Ioc (0:ℝ) 1) ∧ volume.restrict (Set.Ioc (0:ℝ) 1) ≪ gaussMeasure := by sorry

-- test gauss_mass
example : gaussMeasure (Set.Ioc (0:ℝ) 1) = 1 := by sorry

-- test gauss_first_digit
example : gaussMeasure.real (Set.Ioc (1/2:ℝ) 1) = Real.log (4/3)/Real.log 2 := by sorry

-- test gauss_no_atoms
example : gaussMeasure ({0} : Set ℝ) = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit
def gaussDigit (x : ℝ) (n : ℕ) : ℕ := ⌊((gaussMap^[n]) x)⁻¹⌋₊

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-1
theorem gaussDigit_zero (x : ℝ) : gaussDigit x 0 = ⌊x⁻¹⌋₊ := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-2
theorem gaussDigit_shift (x : ℝ) (n : ℕ) : gaussDigit (gaussMap x) n = gaussDigit x (n+1) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-api-3
theorem gaussDigit_native {x : ℝ} (hx : Irrational x) (h0 : 0 < x) (h1 : x < 1) (n : ℕ) :
    (GenContFract.of x).partDens.get? n = some (gaussDigit x n : ℝ) := by sorry

-- test digit_half_first
example : gaussDigit (1/2) 0 = 2 := by sorry

-- test digit_half_terminated
example : gaussDigit (1/2) 1 = 0 := by sorry

-- test digit_two_thirds
example : gaussDigit (2/3) 0 = 1 ∧ gaussDigit (2/3) 1 = 2 ∧ gaussDigit (2/3) 2 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing
def IsStrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
        (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B))

-- ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-1
theorem IsStrongMixing.measurePreserving {Ω : Type*} [MeasurableSpace Ω]
    {T : Ω → Ω} {μ : ProbabilityMeasure Ω} (h : IsStrongMixing T μ) :
    MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-2
theorem IsStrongMixing.ergodic {Ω : Type*} [MeasurableSpace Ω]
    {T : Ω → Ω} {μ : ProbabilityMeasure Ω} (h : IsStrongMixing T μ) : Ergodic T (μ : Measure Ω) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/strong-mixing-api-3
theorem IsStrongMixing.correlation {Ω : Type*} [MeasurableSpace Ω]
    {T : Ω → Ω} {μ : ProbabilityMeasure Ω} (h : IsStrongMixing T μ)
    (A B : Set Ω) (hA : MeasurableSet A) (hB : MeasurableSet B) :
    Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
      (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B)) := by sorry

-- test mix_dirac
example : IsStrongMixing (id : ℝ → ℝ) (⟨Measure.dirac 0, inferInstance⟩ : ProbabilityMeasure ℝ) := by sorry

-- test mix_identity_rejected
example (μ : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 + (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    ¬ IsStrongMixing (id : ℝ → ℝ) μ := by sorry

-- test mix_periodic_rejected
example (μ : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 + (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    ¬ IsStrongMixing (fun x => 1-x) μ := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/exact-system
def IsExact {Ω : Type*} [m : MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m] A →
      (μ : Measure Ω) A = 0 ∨ (μ : Measure Ω) Aᶜ = 0

-- ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-1
theorem IsExact.measurePreserving {Ω : Type*} [MeasurableSpace Ω] {T : Ω → Ω}
    {μ : ProbabilityMeasure Ω} (h : IsExact T μ) : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-2
theorem IsExact.tail_zero_one {Ω : Type*} [m : MeasurableSpace Ω] {T : Ω → Ω}
    {μ : ProbabilityMeasure Ω} (h : IsExact T μ) (A : Set Ω)
    (hA : MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m] A) :
    (μ : Measure Ω) A = 0 ∨ (μ : Measure Ω) Aᶜ = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/exact-system-api-3
theorem IsExact.strongMixing {Ω : Type*} [MeasurableSpace Ω] {T : Ω → Ω}
    {μ : ProbabilityMeasure Ω} (h : IsExact T μ) : IsStrongMixing T μ := by sorry

-- test exact_dirac
example : IsExact (id : ℝ → ℝ) (⟨Measure.dirac 0, inferInstance⟩ : ProbabilityMeasure ℝ) := by sorry

-- test exact_identity_rejected
example (μ : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 + (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    ¬ IsExact (id : ℝ → ℝ) μ := by sorry

-- test exact_swap_rejected
example (μ : ProbabilityMeasure ℝ)
    (hμ : (μ : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 + (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    ¬ IsExact (fun x => 1-x) μ := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-jacobian
theorem gauss_branch {a : ℕ} (ha : 0 < a) {x : ℝ} (hx : x ∈ Set.Ioo (0:ℝ) 1) :
    gaussMap (1/((a:ℝ)+x)) = x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-telescope
theorem gauss_density_telescope {x : ℝ} (hx : x ∈ Set.Icc (0:ℝ) 1) :
    (∑' a : ℕ, 1 / (((a:ℝ)+1+x)*((a:ℝ)+2+x))) = 1/(1+x) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-invariant
theorem gauss_invariant : MeasurePreserving gaussMap gaussMeasure gaussMeasure := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-single-branch-distortion
theorem gauss_branch_log_distortion {a : ℕ} (ha : 0 < a) {x y : ℝ}
    (hx : x ∈ Set.Icc (0:ℝ) 1) (hy : y ∈ Set.Icc (0:ℝ) 1) :
    |Real.log (1/(((a:ℝ)+x)^2))-Real.log (1/(((a:ℝ)+y)^2))| ≤ 2*|x-y| := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-exact
theorem gauss_exact : IsExact gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-mixing
theorem gauss_mixing : IsStrongMixing gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-ergodic
theorem gauss_ergodic : Ergodic gaussMap gaussMeasure := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-digit-frequency
theorem gauss_digit_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ a : ℕ, 0 < a → Tendsto (fun N : ℕ =>
      ((Finset.range N).filter (fun j => gaussDigit x j = a)).card / (N:ℝ)) atTop
      (𝓝 (Real.log (((a:ℝ)+1)^2 / ((a:ℝ)*((a:ℝ)+2))) / Real.log 2)) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-word-frequency
theorem gauss_word_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ k : ℕ, 0 < k → ∀ w : Fin k → ℕ, (∀ i, 0 < w i) →
      Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
        ∀ i : Fin k, gaussDigit x (j+i) = w i)).card / (N:ℝ)) atTop
        (𝓝 (gaussMeasure.real {y | y ∈ Set.Ioo (0:ℝ) 1 ∧ ∀ i : Fin k, gaussDigit y i = w i})) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant
def khinchinConstant : ℝ := Real.exp (∑' k : ℕ,
  Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) / Real.log 2)

-- ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-1
theorem khinchin_series_summable : Summable (fun k : ℕ =>
    Real.log ((k:ℝ)+1)*Real.log (1+1/(((k:ℝ)+1)*((k:ℝ)+3)))/Real.log 2) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-2
theorem khinchinConstant_pos : 0 < khinchinConstant := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/khinchin-constant-api-3
theorem khinchinConstant_log_integral :
    Real.log khinchinConstant = ∫ x, Real.log (gaussDigit x 0) ∂gaussMeasure := by sorry

-- test khinchin_first_term
example : Real.log (1:ℝ)*Real.log (1+1/(1*3:ℝ))/Real.log 2 = 0 := by sorry

-- test khinchin_second_term
example : Real.log (2:ℝ)*Real.log (1+1/(2*4:ℝ))/Real.log 2 = Real.log (9/8) := by sorry

-- test khinchin_not_unit
example : 1 < khinchinConstant := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-log-integrability
theorem gauss_log_integrable :
    Integrable (fun x => Real.log (gaussDigit x 0)) gaussMeasure ∧
    Integrable (fun x : ℝ => -Real.log x) gaussMeasure := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/khinchin-geometric-mean
theorem khinchin_geometric_mean : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.rpow (∏ j ∈ Finset.range N, (gaussDigit x j : ℝ)) ((N:ℝ)⁻¹))
      atTop (𝓝 khinchinConstant) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-denominator-log-bridge
theorem gauss_denominator_log_bridge {x : ℝ} (hx : Irrational x)
    (h0 : 0 < x) (h1 : x < 1) (N : ℕ) :
    |Real.log ((GenContFract.of x).dens N) + ∑ j ∈ Finset.range N, Real.log ((gaussMap^[j]) x)| ≤ Real.log 2 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-density-log-integral
theorem gauss_density_log_integral : (∫ x : ℝ, -Real.log x ∂gaussMeasure) = Real.pi^2/(12*Real.log 2) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/levy-denominator
theorem levy_denominator : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.log ((GenContFract.of x).dens N)/(N:ℝ)) atTop
      (𝓝 (Real.pi^2/(12*Real.log 2))) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-kuzmin
theorem gauss_kuzmin : ∃ C ρ : ℝ, 0 < C ∧ 0 < ρ ∧ ρ < 1 ∧
    ∀ a : ℕ, 0 < a → ∀ n : ℕ,
      |(volume.restrict (Set.Ioc (0:ℝ) 1)).real {x | gaussDigit x n = a} -
        Real.log (((a:ℝ)+1)^2/((a:ℝ)*((a:ℝ)+2)))/Real.log 2| ≤ C*ρ^n := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean
def shortMean (f : ArithmeticFunction ℝ) (x h : ℕ) : ℝ :=
  (∑ n ∈ Finset.Icc x (x+h), f n)/(h:ℝ)

-- ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-1
theorem shortMean_zero (f : ArithmeticFunction ℝ) (x : ℕ) : shortMean f x 0 = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-2
theorem shortMean_add (f g : ArithmeticFunction ℝ) (x h : ℕ) :
    shortMean (f+g) x h = shortMean f x h + shortMean g x h := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/short-interval-mean-api-3
theorem shortMean_bound (f : ArithmeticFunction ℝ) (x h : ℕ) (hh : 0 < h)
    (hf : ∀ n ∈ Finset.Icc x (x+h), |f n| ≤ 1) : |shortMean f x h| ≤ ((h:ℝ)+1)/(h:ℝ) := by sorry

-- test short_zero
example (x h : ℕ) : shortMean 0 x h = 0 := by sorry

-- test short_one_length
example (f : ArithmeticFunction ℝ) (x : ℕ) : shortMean f x 1 = f x + f (x+1) := by sorry

-- test short_constant
example (f : ArithmeticFunction ℝ) (hf : ∀ n, 0 < n → f n = 1) (x h : ℕ)
    (hx : 0 < x) (hh : 0 < h) : shortMean f x h = ((h:ℝ)+1)/(h:ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/matomaki-radziwill
theorem matomaki_radziwill : ∃ C C' : ℝ, 1 < C ∧ 1 < C' ∧
    ∀ (f : ArithmeticFunction ℝ) (hf : f.IsMultiplicative)
      (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1) (h X : ℕ) (hh : 2 ≤ h) (hX : h ≤ X)
      (δ : ℝ) (hδ : 0 < δ),
      (((Finset.Icc X (2*X)).filter (fun x =>
        δ+C'*Real.log (Real.log h)/Real.log h < |shortMean f x h-shortMean f X X|)).card : ℝ) ≤
      C*(X:ℝ)*(Real.rpow (Real.log h) (1/3)/(δ^2*Real.rpow h (δ/25)) +
        1/(δ^2*Real.rpow (Real.log X) (1/50))) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/log-correlation
def logCorrelation (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) : ℂ :=
  (∑ n ∈ Finset.Ioc ⌊x/w⌋₊ ⌊x⌋₊,
    f (((a₁:ℤ)*(n:ℤ)+b₁).toNat) * g (((a₂:ℤ)*(n:ℤ)+b₂).toNat) / (n:ℂ)) / (Real.log w : ℂ)

-- ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-1
theorem logCorrelation_swap (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) :
    logCorrelation f g a₁ a₂ b₁ b₂ x w = logCorrelation g f a₂ a₁ b₂ b₁ x w := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-2
theorem logCorrelation_add_left (f g h : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) :
    logCorrelation (f+g) h a₁ a₂ b₁ b₂ x w =
      logCorrelation f h a₁ a₂ b₁ b₂ x w + logCorrelation g h a₁ a₂ b₁ b₂ x w := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/log-correlation-api-3
theorem logCorrelation_one_window (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x : ℝ) :
    logCorrelation f g a₁ a₂ b₁ b₂ x 1 = 0 := by sorry

-- test log_weight_small
example : logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
    (ArithmeticFunction.liouville : ArithmeticFunction ℂ) 1 1 0 1 2 2 = 1/(2*(Real.log 2 : ℂ)) := by sorry

-- test log_weight_sign
example : logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
    (ArithmeticFunction.liouville : ArithmeticFunction ℂ) 1 1 0 1 4 4 = (-1/12)/(Real.log 4 : ℂ) := by sorry

-- test log_degenerate_forms
example : logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
    (ArithmeticFunction.liouville : ArithmeticFunction ℂ) 1 1 0 0 4 4 = (13/12)/(Real.log 4 : ℂ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-chowla
theorem logarithmic_chowla (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)
    (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (w : ℝ → ℝ)
    (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x) (hw : Tendsto w atTop atTop) :
    Tendsto (fun x : ℝ => logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) a₁ a₂ b₁ b₂ x (w x)) atTop (𝓝 0) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/liouville-two-point-nontrivial
theorem liouville_two_point_nontrivial (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, (ArithmeticFunction.liouville n : ℝ) * (ArithmeticFunction.liouville (n+h) : ℝ)| ≤
        (1-δ)*(X:ℝ) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model
def rademacherModel {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : ArithmeticFunction ℝ where
  toFun n := if Squarefree n then ∏ p ∈ n.primeFactors, ξ p ω else 0
  map_zero' := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-1
theorem rademacherModel_squarefree {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) {n : ℕ} (hn : Squarefree n) :
    rademacherModel ξ ω n = ∏ p ∈ n.primeFactors, ξ p ω := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-2
theorem rademacherModel_nonsquarefree {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) {n : ℕ} (hn : ¬ Squarefree n) :
    rademacherModel ξ ω n = 0 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/rademacher-model-api-3
theorem rademacherModel_multiplicative {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) :
    (rademacherModel ξ ω).IsMultiplicative := by sorry

-- test rademacher_one
example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : rademacherModel ξ ω 1 = 1 := by sorry

-- test rademacher_four
example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : rademacherModel ξ ω 4 = 0 := by sorry

-- test rademacher_six
example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : rademacherModel ξ ω 6 = ξ 2 ω * ξ 3 ω := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model
def steinhausModel {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : ArithmeticFunction ℂ where
  toFun n := if n = 0 then 0 else ∏ p ∈ n.primeFactors, (ζ p ω)^n.factorization p
  map_zero' := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-1
theorem steinhausModel_mul {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) (m n : ℕ) :
    steinhausModel ζ ω (m*n) = steinhausModel ζ ω m * steinhausModel ζ ω n := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-2
theorem steinhausModel_prime_pow {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω)
    {p k : ℕ} (hp : p.Prime) (hk : 0 < k) : steinhausModel ζ ω (p^k) = (ζ p ω)^k := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-model-api-3
theorem steinhausModel_norm {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω)
    (hζ : ∀ p : ℕ, p.Prime → ‖ζ p ω‖ = 1) {n : ℕ} (hn : 0 < n) : ‖steinhausModel ζ ω n‖ = 1 := by sorry

-- test steinhaus_zero
example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : steinhausModel ζ ω 0 = 0 := by sorry

-- test steinhaus_one
example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : steinhausModel ζ ω 1 = 1 := by sorry

-- test steinhaus_four
example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : steinhausModel ζ ω 4 = (ζ 2 ω)^2 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-branch-derivative
theorem gauss_branch_derivative {a : ℕ} (ha : 0 < a) {x : ℝ} (hx : x ∈ Set.Icc (0:ℝ) 1) :
    HasDerivAt (fun y : ℝ => 1/((a:ℝ)+y)) (-1/(((a:ℝ)+x)^2)) x := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.0/kubilius-small-prime-model
theorem kubilius_small_prime_model (β : ℕ → ℝ)
    (hβ : ∀ N, 0 < β N) (hβinf : Tendsto β atTop atTop)
    (ν : (N : ℕ) → ProbabilityMeasure
      ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ))
    (hν : ∀ (N : ℕ) (v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)), (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v} =
      ∏ p : {p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊},
        (1-1/(p:ℝ)) / (p:ℝ)^(v p)) :
    ∃ C δ : ℝ, 0 < C ∧ 0 < δ ∧ ∀ᶠ N : ℕ in atTop,
      (1/2:ℝ) * ∑' v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ),
        |(((Finset.Icc 1 N).filter (fun n => ∀ p, n.factorization p = v p)).card : ℝ)/(N:ℝ) -
          (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v}| ≤ C*Real.exp (-δ*β N) := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.3/duffin-schaeffer-dimension
theorem duffin_schaeffer_dimension (ψ : ℕ → ℝ)
    (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1/2) :
    dimH (limsup (fun q : ℕ => Set.Icc (0:ℝ) 1 ∩
      ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
        Set.Icc ((a:ℝ)/q-ψ q/q) ((a:ℝ)/q+ψ q/q)) atTop) =
      min (sInf {b : ℝ≥0∞ | ∃ t : ℝ, 0 ≤ t ∧ b = ENNReal.ofReal t ∧
        Summable (fun q : ℕ => (q.totient:ℝ)*Real.rpow (ψ q/q) t)}) 1 := by sorry

-- ProbabilisticAndMetricNumberTheory:PM.2/digit-cylinder-bridge: Signature omitted: Iterate the digit shift and sum indicators. The floor/circle/cylinder comparison needs a fresh detailed native proof; do not identify dense orbits with digit frequencies.
-- ProbabilisticAndMetricNumberTheory:PM.3/gauge-normalization: Signature omitted: Handle the zero/finite-ratio cases separately. The exact gauge-extension and comparison signatures are omitted until their ENNReal boundary convention is fixed.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cover: Signature omitted: The source-specific expanding-radius signature awaits the dimension-gauge bridge; record the omitted signature explicitly.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor: Signature omitted: Induct over the finite sublevels and levels. The source-specific finite-tree carrier and native projective-measure interface are not fixed; omit their signatures explicitly.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-1: API signature omitted: Every level lies inside its parent level.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-2: API signature omitted: Every point of Kη belongs to infinitely many original balls with unbounded indices.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor-api-3: API signature omitted: Distinct child triples are disjoint; the stronger expanded-ball disjointness holds within each sublevel.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor/cantor_parent: Example omitted: No child crosses the boundary of its parent.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor/cantor_indices: Example omitted: A construction repeating a fixed finite collection of balls is rejected by the increasing-cutoff requirement.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-cantor/cantor_multi_sublevel: Example omitted: For nonroot parents the source choice gives at least two sublevels, preventing an incorrect single-child measure model.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure: Signature omitted: The measure-extension signature is omitted pending the native finite-tree interface.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-1: API signature omitted: The root mass is one.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-2: API signature omitted: The sum of finite child masses equals the parent mass.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure-api-3: API signature omitted: For A of radius below the construction cutoff, μ(A)≤C_k f(r_A)/η with C_k independent of η and A.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure/mass_positive: Example omitted: Every selected positive-radius ball has positive normalized mass.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure/mass_sum: Example omitted: For two children of equal gauge size the masses are each half the parent mass.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-measure/mass_eta_uniform: Example omitted: The constant C_k cannot grow with η; otherwise infinite Hausdorff measure does not follow.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-level-mass: Signature omitted: The finite-tree signature is omitted until its native interface is fixed.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-ball-bound: Signature omitted: The native finite-tree/small-radius interface is not yet fixed, so its signature is omitted.
-- ProbabilisticAndMetricNumberTheory:PM.3/mass-transference-general: Signature omitted: The general gauge/tree interface and external measure-extension input are explicit gaps; omit the unavailable general signature.
-- ProbabilisticAndMetricNumberTheory:PM.3/jarnik-besicovitch: Signature omitted: Strict versus closed approximation radii require a constant-radius comparison; the native rational-approximation/dimH signature bridge remains explicit.
-- ProbabilisticAndMetricNumberTheory:PM.3/hausdorff-duffin-schaeffer: Signature omitted: The general gauge comparison, strict-radius and enumeration bridges are explicit gaps; omit the general gauge signature until they are fixed.
-- ProbabilisticAndMetricNumberTheory:PM.3/higher-dimensional-duffin-schaeffer: Signature omitted: The finite-coordinate reduced-approximation/native-volume bridge and the original proof are not yet obtained; omit the full signature until that interface is specified.
-- ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-coloring: Signature omitted: First let the long orbit length tend to infinity, then remove the bad set and ε. A precise measurable extended-limsup representative and the finite coloring lemma signatures remain to be split.
-- ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-identification: Signature omitted: The exact native conditional-expectation uniqueness/restriction lemmas are still to be matched; omit a bundled limit signature rather than a Prop-valued stand-in.
-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-cylinder-distortion: Signature omitted: The finite-word/native stream and differentiable branch interface has not been fixed; the general-word signature is explicitly omitted.
-- ProbabilisticAndMetricNumberTheory:PM.4/gauss-renyi: Signature omitted: The general finite-word cylinder/continuant bridge must be made explicit; its signature is omitted until that native comparison is fixed.
-- ProbabilisticAndMetricNumberTheory:PM.5/short-interval-good-set: Signature omitted: Keep the exact good-set interface, real-starting-point endpoint convention and all interval inequalities from (4). Its full Sections 3–9 proof is unread; omit that foreign supplier-dependent signature.
-- ProbabilisticAndMetricNumberTheory:PM.5/logarithmic-elliott: Signature omitted: The AN.5-owned distance/character API and complete entropy-decrement proof have not been supplied; omit the foreign condition signature explicitly.
-- ProbabilisticAndMetricNumberTheory:PM.5/rademacher-covariance: Signature omitted: The exact native independent fair-sign product-law conditions are not yet matched; omit the law-bearing signature.
-- ProbabilisticAndMetricNumberTheory:PM.5/steinhaus-covariance: Signature omitted: The exact native independent Haar-phase product-law conditions are not yet matched; omit the law-bearing signature.
-- ProbabilisticAndMetricNumberTheory:PM.5/random-model-orthogonality: Signature omitted: The exact native law-bearing signatures are omitted until the corresponding product probability interfaces are fixed.
end TauCeti.Probability.MetricNumberTheory
end
