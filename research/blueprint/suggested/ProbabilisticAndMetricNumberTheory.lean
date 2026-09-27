/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: GPT-6 Astra Pro (astra-20260926-pm-83c1), Codex (codex-a71f92)
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

end TauCeti.Probability.Arithmetic
