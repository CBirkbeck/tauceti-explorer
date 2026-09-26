/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap
 document is definitive. These signatures suggest Lean forms so contributors
 and reviewers converge on names and interfaces. All proof placeholders are
 intentional; this file has NOT been elaborated at the pinned baseline.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only the rational certificate core can currently be stated against those
 libraries. The application RankZeroOneBSD:BSD.8/elliptic-endpoint is omitted:
 its actual BSD.5 defect, L-function, period and whole-Sha interfaces are
 required. No opaque proposition, arbitrary elliptic-data carrier, axiom, or
 predicted cardinality substitutes for those interfaces.
-/
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Data.Real.Basic

namespace Rat

/-- The canonical finite prime support, with the library's empty zero convention. -/
def primeSupport (q : ℚ) : Finset ℕ :=
  q.num.natAbs.primeFactors ∪ q.den.primeFactors

-- RankZeroOneBSD:BSD.8/support-membership; Rat.mem_primeSupport.
theorem mem_primeSupport {q : ℚ} (hq : q ≠ 0) (p : ℕ) :
    p ∈ primeSupport q ↔ p.Prime ∧ (p ∣ q.num.natAbs ∨ p ∣ q.den) := by
  sorry

-- Rat.primeSupport_zero
@[simp] theorem primeSupport_zero : primeSupport 0 = ∅ := by sorry
-- Rat.primeSupport_one
@[simp] theorem primeSupport_one : primeSupport 1 = ∅ := by sorry
-- Rat.primeSupport_neg
@[simp] theorem primeSupport_neg (q : ℚ) : primeSupport (-q) = primeSupport q := by sorry
-- Rat.primeSupport_inv
@[simp] theorem primeSupport_inv (q : ℚ) : primeSupport q⁻¹ = primeSupport q := by sorry
-- Rat.primeSupport_mul_subset
theorem primeSupport_mul_subset (q r : ℚ) :
    primeSupport (q * r) ⊆ primeSupport q ∪ primeSupport r := by sorry

-- Rat.primeSupport_test_six_thirtyfive
example : primeSupport (6 / 35 : ℚ) = {2, 3, 5, 7} := by sorry
-- Rat.primeSupport_test_zero
example : primeSupport (0 : ℚ) = ∅ ∧ (0 : ℚ) ≠ 1 := by sorry
-- Rat.primeSupport_test_cancellation
example : primeSupport ((2 : ℚ) * (1 / 2)) = ∅ ∧
    primeSupport (2 : ℚ) ∪ primeSupport (1 / 2 : ℚ) = {2} := by sorry
-- Rat.primeSupport_test_negative
example : primeSupport (-6 / 35 : ℚ) = primeSupport (6 / 35 : ℚ) := by sorry

-- RankZeroOneBSD:BSD.8/zero-numerator-denominator
theorem zero_num_den_of_padicValRat_eq_zero {p : ℕ} (hp : p.Prime)
    (q : ℚ) (h : padicValRat p q = 0) :
    padicValNat p q.num.natAbs = 0 ∧ padicValNat p q.den = 0 := by sorry

-- RankZeroOneBSD:BSD.8/zero-iff-outside-support
theorem padicValRat_eq_zero_iff_not_mem_primeSupport {q : ℚ} (hq : q ≠ 0)
    {p : ℕ} (hp : p.Prime) :
    padicValRat p q = 0 ↔ p ∉ primeSupport q := by sorry

-- RankZeroOneBSD:BSD.8/empty-support-units
theorem primeSupport_eq_empty_iff {q : ℚ} (hq : q ≠ 0) :
    primeSupport q = ∅ ↔ q = 1 ∨ q = -1 := by sorry

-- RankZeroOneBSD:BSD.8/positive-rational-reconstruction
theorem eq_one_iff_all_prime_padicValRat_eq_zero {q : ℚ} (hq : 0 < q) :
    q = 1 ↔ ∀ p : ℕ, p.Prime → padicValRat p q = 0 := by sorry

/-- A finite support cover together with proofs at every listed prime.
This structure deliberately does not assert positivity or the output q = 1. -/
structure PrimeValuationCertificate (q : ℚ) where
  -- Rat.PrimeValuationCertificate.primes
  primes : Finset ℕ
  -- Rat.PrimeValuationCertificate.prime_mem
  prime_mem : ∀ p ∈ primes, p.Prime
  -- Rat.PrimeValuationCertificate.covers
  covers : primeSupport q ⊆ primes
  -- Rat.PrimeValuationCertificate.localZero
  localZero : ∀ p ∈ primes, padicValRat p q = 0

namespace PrimeValuationCertificate

-- Rat.PrimeValuationCertificate.ext
@[ext] theorem ext {q : ℚ} (c d : PrimeValuationCertificate q)
    (h : c.primes = d.primes) : c = d := by sorry

-- RankZeroOneBSD:BSD.8/certificate-from-all-primes
-- Rat.PrimeValuationCertificate.ofAllPrimes
def ofAllPrimes (q : ℚ) (h : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    PrimeValuationCertificate q := by sorry

-- Rat.PrimeValuationCertificate.ofAllPrimes_primes
@[simp] theorem ofAllPrimes_primes (q : ℚ)
    (h : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    (ofAllPrimes q h).primes = primeSupport q := by sorry

-- RankZeroOneBSD:BSD.8/certificate-all-primes
-- Rat.PrimeValuationCertificate.zeroValuation
theorem zeroValuation {q : ℚ} (c : PrimeValuationCertificate q)
    (p : ℕ) (hp : p.Prime) : padicValRat p q = 0 := by sorry

-- RankZeroOneBSD:BSD.8/certificate-reconstruction
-- Rat.PrimeValuationCertificate.eq_one
theorem eq_one {q : ℚ} (c : PrimeValuationCertificate q) (hq : 0 < q) : q = 1 := by sorry

-- RankZeroOneBSD:BSD.8/certificate-from-exceptions
-- Rat.PrimeValuationCertificate.ofExceptionSet
def ofExceptionSet (q : ℚ) (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime)
    (hin : ∀ p ∈ S, padicValRat p q = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    PrimeValuationCertificate q := by sorry

-- Rat.PrimeValuationCertificate.ofExceptionSet_primes
@[simp] theorem ofExceptionSet_primes (q : ℚ) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (hin : ∀ p ∈ S, padicValRat p q = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    (ofExceptionSet q S hS hin hout).primes = S := by sorry

-- Rat.PrimeValuationCertificate.test_one
example : ∃ c : PrimeValuationCertificate (1 : ℚ), c.primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.test_zero
example : (∃ c : PrimeValuationCertificate (0 : ℚ), c.primes = ∅) ∧
    ¬(0 < (0 : ℚ)) := by sorry
-- Rat.PrimeValuationCertificate.test_negative_one
example : Nonempty (PrimeValuationCertificate (-1 : ℚ)) ∧ (-1 : ℚ) ≠ 1 := by sorry
-- Rat.PrimeValuationCertificate.test_two
example : ¬ Nonempty (PrimeValuationCertificate (2 : ℚ)) := by sorry
-- Rat.PrimeValuationCertificate.test_quarter
example : ¬ Nonempty (PrimeValuationCertificate (1 / 4 : ℚ)) := by sorry

-- Rat.PrimeValuationCertificate.ofAllPrimes_test_one
example (h : ∀ p : ℕ, p.Prime → padicValRat p (1 : ℚ) = 0) :
    (ofAllPrimes 1 h).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofAllPrimes_test_zero
example (h : ∀ p : ℕ, p.Prime → padicValRat p (0 : ℚ) = 0) :
    (ofAllPrimes 0 h).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofAllPrimes_test_negative_one
example (h : ∀ p : ℕ, p.Prime → padicValRat p (-1 : ℚ) = 0) :
    (ofAllPrimes (-1) h).primes = ∅ := by sorry

-- Rat.PrimeValuationCertificate.ofExceptionSet_test_empty
example (hS : ∀ p ∈ (∅ : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ (∅ : Finset ℕ), padicValRat p (1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ (∅ : Finset ℕ) → padicValRat p (1 : ℚ) = 0) :
    (ofExceptionSet 1 ∅ hS hin hout).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofExceptionSet_test_enlarged
example (hS : ∀ p ∈ ({2, 3} : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ ({2, 3} : Finset ℕ), padicValRat p (1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ ({2, 3} : Finset ℕ) → padicValRat p (1 : ℚ) = 0) :
    (ofExceptionSet 1 {2, 3} hS hin hout).primes = {2, 3} := by sorry
-- Rat.PrimeValuationCertificate.ofExceptionSet_test_negative_one
example (hS : ∀ p ∈ ({2} : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ ({2} : Finset ℕ), padicValRat p (-1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ ({2} : Finset ℕ) → padicValRat p (-1 : ℚ) = 0) :
    (ofExceptionSet (-1) {2} hS hin hout).primes = {2} ∧ (-1 : ℚ) ≠ 1 := by sorry

end PrimeValuationCertificate

-- RankZeroOneBSD:BSD.8/real-identity
theorem real_eq_of_primeValuationCertificate {q : ℚ} (hq : 0 < q)
    (c : PrimeValuationCertificate q) {A B : ℝ} (hB : B ≠ 0)
    (hident : (q : ℝ) = A / B) : A = B := by sorry

-- RankZeroOneBSD:BSD.9/away-from-prime
theorem padicValRat_of_distinct_primes {p ell : ℕ}
    (hp : p.Prime) (hell : ell.Prime) (hne : p ≠ ell) :
    padicValRat ell (p : ℚ) = 0 := by sorry

-- RankZeroOneBSD:BSD.9/prime-obstruction
theorem no_primeValuationCertificate_prime {p : ℕ} (hp : p.Prime) :
    ¬ Nonempty (PrimeValuationCertificate (p : ℚ)) := by sorry

-- RankZeroOneBSD:BSD.9/dyadic-gate
theorem eq_one_iff_padicValRat_two_eq_zero {q : ℚ} (hq : 0 < q)
    (hodd : ∀ p : ℕ, p.Prime → Odd p → padicValRat p q = 0) :
    q = 1 ↔ padicValRat 2 q = 0 := by sorry

-- The two counterexamples to omitting positivity.
example : (∀ p : ℕ, padicValRat p (0 : ℚ) = 0) ∧ (0 : ℚ) ≠ 1 := by sorry
example : (∀ p : ℕ, padicValRat p (-1 : ℚ) = 0) ∧ (-1 : ℚ) ≠ 1 := by sorry
-- An omitted dyadic prime can hide either a numerator or a denominator.
example : (∀ p : ℕ, p.Prime → Odd p → padicValRat p (2 : ℚ) = 0) ∧
    padicValRat 2 (2 : ℚ) = 1 ∧ ¬ Nonempty (PrimeValuationCertificate (2 : ℚ)) := by sorry
example : (∀ p : ℕ, p.Prime → Odd p → padicValRat p (1 / 4 : ℚ) = 0) ∧
    padicValRat 2 (1 / 4 : ℚ) = -2 ∧ ¬ Nonempty (PrimeValuationCertificate (1 / 4 : ℚ)) := by sorry

end Rat
