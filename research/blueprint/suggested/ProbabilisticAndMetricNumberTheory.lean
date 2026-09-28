import Mathlib.Data.Int.CardIntervalMod
import Mathlib.Probability.CDF
import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.Data.ZMod.QuotientRing
/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: GPT-6 Astra Pro (astra-20260926-pm-83c1), Codex (codex-a71f92), Claude Code (cc-fb70e5)
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

end TauCeti.Equidistribution
