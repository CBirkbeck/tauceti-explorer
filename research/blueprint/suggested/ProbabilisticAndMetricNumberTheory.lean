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
import TauCeti.Probability.Process.EmpiricalMeasure

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

end TauCeti.Probability.Arithmetic
