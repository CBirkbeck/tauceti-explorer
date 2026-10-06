/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap
 document is definitive. These signatures suggest Lean forms so contributors
 and reviewers converge on names and interfaces. All proof placeholders are
 intentional. Elaboration results and the precise build commits are recorded
in the handoff note.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The rational certificate core and actual Weierstrass models/points can be
 stated against the pinned Mathlib. The arithmetic/Iwasawa and applied analytic
 signatures require the named provider APIs in the accompanying packet. The application RankZeroOneBSD:BSD.8/elliptic-endpoint is omitted:
 its actual BSD.5 defect, L-function, period and whole-Sha interfaces are
 required. No opaque proposition, arbitrary elliptic-data carrier, axiom, or
 predicted cardinality substitutes for those interfaces.
-/
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Prod

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

-- Rat.PrimeValuationCertificate.ofAllPrimes_proof_independent
theorem ofAllPrimes_proof_independent (q : ℚ)
    (h h' : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    ofAllPrimes q h = ofAllPrimes q h' := by sorry

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

-- Rat.PrimeValuationCertificate.ofExceptionSet_proof_independent
theorem ofExceptionSet_proof_independent (q : ℚ) (S : Finset ℕ)
    (hS hS' : ∀ p ∈ S, p.Prime)
    (hin hin' : ∀ p ∈ S, padicValRat p q = 0)
    (hout hout' : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    ofExceptionSet q S hS hin hout = ofExceptionSet q S hS' hin' hout' := by sorry

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

-- RankZeroOneBSD:BSD.8/torsion-square-valuation
namespace Rat
theorem padicValRat_torsion_square {p : ℕ} [Fact p.Prime]
    {q a t : ℚ} (hq : q ≠ 0) (ha : a ≠ 0) (ht : t ≠ 0) :
    padicValRat p (q * t ^ 2 / a) =
      padicValRat p q + 2 * padicValRat p t - padicValRat p a := by sorry

example : padicValRat 5 ((1 / 25 : ℚ) * 5 ^ 2) = 0 ∧
    padicValRat 5 (1 / 25 : ℚ) = -2 := by sorry
end Rat

namespace WeierstrassCurve.BSD
noncomputable section

-- These are actual Mathlib models, with fixed invariant differentials.
-- The arithmetic labels are descriptive and do not supply ranks or Sha orders.

-- RankZeroOneBSD:BSD.9/fixture-11
def fixture11 : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := -1
  a₃ := 1
  a₄ := 0
  a₆ := 0

-- WeierstrassCurve.BSD.fixture11_coefficients
theorem fixture11_coefficients :
    fixture11.a₁ = 0 ∧ fixture11.a₂ = -1 ∧ fixture11.a₃ = 1 ∧ fixture11.a₄ = 0 ∧ fixture11.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-discriminant
-- WeierstrassCurve.BSD.fixture11_discriminant
@[simp] theorem fixture11_discriminant : fixture11.Δ = -11 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-elliptic
-- WeierstrassCurve.BSD.fixture11_elliptic
theorem fixture11_elliptic : fixture11.IsElliptic := by sorry
attribute [instance] fixture11_elliptic

-- WeierstrassCurve.BSD.fixture11_origin_nonsingular
theorem fixture11_origin_nonsingular : fixture11.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_equation
example : fixture11.toAffine.Equation 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_not_optimal_model
example : fixture11.a₄ = 0 ∧ fixture11.a₆ = 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_real_components
example : fixture11.Δ < 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-11
def point11 : fixture11.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture11_origin_nonsingular

-- WeierstrassCurve.BSD.point11_coordinates
theorem point11_coordinates : point11 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture11_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point11_nonzero
theorem point11_nonzero : point11 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-11-order
-- WeierstrassCurve.BSD.point11_order
theorem point11_order : addOrderOf point11 = 5 := by sorry

-- WeierstrassCurve.BSD.point11_test_double
example : ∃ h : fixture11.toAffine.Nonsingular 1 (-1),
    (2 : ℕ) • point11 = WeierstrassCurve.Affine.Point.some 1 (-1) h := by sorry
-- WeierstrassCurve.BSD.point11_test_order_five
example : (5 : ℕ) • point11 = 0 ∧ point11 ≠ 0 := by sorry
-- WeierstrassCurve.BSD.point11_test_not_two_torsion
example : (2 : ℕ) • point11 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37
def fixture37 : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := 0
  a₃ := 1
  a₄ := -1
  a₆ := 0

-- WeierstrassCurve.BSD.fixture37_coefficients
theorem fixture37_coefficients :
    fixture37.a₁ = 0 ∧ fixture37.a₂ = 0 ∧ fixture37.a₃ = 1 ∧ fixture37.a₄ = -1 ∧ fixture37.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37-discriminant
-- WeierstrassCurve.BSD.fixture37_discriminant
@[simp] theorem fixture37_discriminant : fixture37.Δ = 37 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37-elliptic
-- WeierstrassCurve.BSD.fixture37_elliptic
theorem fixture37_elliptic : fixture37.IsElliptic := by sorry
attribute [instance] fixture37_elliptic

-- WeierstrassCurve.BSD.fixture37_origin_nonsingular
theorem fixture37_origin_nonsingular : fixture37.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture37_test_equation
example : fixture37.toAffine.Equation 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture37_test_positive_discriminant
example : 0 < fixture37.Δ := by sorry

-- WeierstrassCurve.BSD.fixture37_test_distinct_from_11
example : fixture37.a₂ = 0 ∧ fixture37.Δ = 37 ∧ fixture37 ≠ fixture11 := by sorry

-- RankZeroOneBSD:BSD.9/point-37
def point37 : fixture37.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture37_origin_nonsingular

-- WeierstrassCurve.BSD.point37_coordinates
theorem point37_coordinates : point37 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture37_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point37_nonzero
theorem point37_nonzero : point37 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-37-order
-- WeierstrassCurve.BSD.point37_order
theorem point37_order : addOrderOf point37 = 0 := by sorry

-- WeierstrassCurve.BSD.point37_test_double
example : ∃ h : fixture37.toAffine.Nonsingular 1 0,
    (2 : ℕ) • point37 = WeierstrassCurve.Affine.Point.some 1 0 h := by sorry
-- WeierstrassCurve.BSD.point37_test_infinite_order
example : ∃ h : fixture37.toAffine.Nonsingular (21 / 25) (-69 / 125),
    (8 : ℕ) • point37 = WeierstrassCurve.Affine.Point.some (21 / 25) (-69 / 125) h := by sorry
-- WeierstrassCurve.BSD.point37_test_not_torsion_generator
example : ∀ m : ℤ, m ≠ 0 → m • point37 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32
def fixture32 : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -1
  a₆ := 0

-- WeierstrassCurve.BSD.fixture32_coefficients
theorem fixture32_coefficients :
    fixture32.a₁ = 0 ∧ fixture32.a₂ = 0 ∧ fixture32.a₃ = 0 ∧ fixture32.a₄ = -1 ∧ fixture32.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32-discriminant
-- WeierstrassCurve.BSD.fixture32_discriminant
@[simp] theorem fixture32_discriminant : fixture32.Δ = 64 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32-elliptic
-- WeierstrassCurve.BSD.fixture32_elliptic
theorem fixture32_elliptic : fixture32.IsElliptic := by sorry
attribute [instance] fixture32_elliptic

-- WeierstrassCurve.BSD.fixture32_origin_nonsingular
theorem fixture32_origin_nonsingular : fixture32.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture32_j
@[simp] theorem fixture32_j : fixture32.j = 1728 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_three_two_torsion_roots
example : fixture32.toAffine.Equation (-1) 0 ∧ fixture32.toAffine.Equation 0 0 ∧ fixture32.toAffine.Equation 1 0 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_dyadic_discriminant
example : padicValRat 2 fixture32.Δ = 6 ∧ fixture32.c₄ = 48 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_real_components
example : 0 < fixture32.Δ := by sorry

-- RankZeroOneBSD:BSD.9/point-32
def point32 : fixture32.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture32_origin_nonsingular

-- WeierstrassCurve.BSD.point32_coordinates
theorem point32_coordinates : point32 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture32_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point32_nonzero
theorem point32_nonzero : point32 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-32-order
-- WeierstrassCurve.BSD.point32_order
theorem point32_order : addOrderOf point32 = 2 := by sorry

-- WeierstrassCurve.BSD.point32_test_double_zero
example : (2 : ℕ) • point32 = 0 := by sorry
-- WeierstrassCurve.BSD.point32_test_three_distinct_points
example : ∃ (hq : fixture32.toAffine.Nonsingular 1 0)
    (hr : fixture32.toAffine.Nonsingular (-1) 0),
    let Q : fixture32.toAffine.Point := WeierstrassCurve.Affine.Point.some 1 0 hq
    let R : fixture32.toAffine.Point := WeierstrassCurve.Affine.Point.some (-1) 0 hr
    Q ≠ 0 ∧ R ≠ 0 ∧ Q ≠ R ∧ Q ≠ point32 ∧ R ≠ point32 ∧
      (2 : ℕ) • Q = 0 ∧ (2 : ℕ) • R = 0 := by sorry
-- WeierstrassCurve.BSD.point32_test_sum_two_other_points
example : ∃ (hq : fixture32.toAffine.Nonsingular 1 0)
    (hr : fixture32.toAffine.Nonsingular (-1) 0),
    (WeierstrassCurve.Affine.Point.some 1 0 hq : fixture32.toAffine.Point) +
      WeierstrassCurve.Affine.Point.some (-1) 0 hr = point32 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-good-five (finite-field portion).
example : ((Finset.univ : Finset (ZMod 5 × ZMod 5)).filter
    (fun xy => xy.2 ^ 2 + xy.2 = xy.1 ^ 3 - xy.1 ^ 2)).card = 4 := by sorry

end
end WeierstrassCurve.BSD

/-
Arithmetic signature omissions, tracked by node id.
RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs — Keller–Yin cyclotomic input transfer.
These require actual provider APIs absent at the pinned baseline. This is an
inventory of omitted signatures, not declarations with invented arithmetic
hypotheses. In particular no main-conjecture condition is represented by an
arbitrary Prop and no Sha cardinality by a predicted natural number.
The fixture discriminant-sign examples above are the available portion of the
full real-component tests; cInfinity and Reg_BSD tests require GZ.0/BSD.5.
RankZeroOneBSD:BSD.8/prime-support — Prime support of a rational number
RankZeroOneBSD:BSD.8/finite-prime-certificate — Finite certificate of rational prime-valuation vanishing
RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion — Ordinarity and local invariants at a good Eisenstein prime
RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization — Ordinary, Greenberg and unramified Eisenstein Selmer comparisons
RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison — Primitive and imprimitive Euler factors
RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison — CGLS residual extension and algebraic Iwasawa invariants
RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence — Kriz congruence and analytic Iwasawa invariants
RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants — CGLS equality of anticyclotomic Iwasawa invariants
RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound — Uniform near-trivial Kolyvagin bound
RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility — Heegner divisibility including augmentation
RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison — Heegner index and BDP ideal comparison
RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture — CGS anticyclotomic Greenberg main conjecture
RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality — CGS Heegner index-square equality
RankZeroOneBSD:BSD.7a/ky-local-character-corrections — Keller–Yin local character cohomology
RankZeroOneBSD:BSD.7a/ky-ribet-lattice — Keller–Yin nonsplit residual lattice
RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture — Keller–Yin trivial-character augmentation correction
RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison — Keller–Yin imprimitive residual Selmer comparison
RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison — Keller–Yin finite Euler comparison
RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda — Keller–Yin residual extension and corrected lambda formula
RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants — Keller–Yin equality of analytic and algebraic invariants
RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound — Keller–Yin integral Kolyvagin divisibility and lattice transfer
RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality — Keller–Yin anticyclotomic Greenberg main conjecture
RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality — Keller–Yin Heegner index-square equality
RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input — Distinguished Wüthrich lattice and integral Kato input adapter
RankZeroOneBSD:BSD.7a/integral-two-variable-functions — Integral Rankin functions and specialization normalization
RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity — Beilinson–Flach class and two integral reciprocity laws
EisensteinBF.class — omitted with its actual arithmetic provider interface.
EisensteinBF.ordinary_local — omitted with its actual arithmetic provider interface.
EisensteinBF.coleman_PR — omitted with its actual arithmetic provider interface.
EisensteinBF.coleman_Gr — omitted with its actual arithmetic provider interface.
EisensteinBF.twist_congruence — omitted with its actual arithmetic provider interface.
EisensteinBF.test_PR_projection — omitted with its actual arithmetic provider interface.
EisensteinBF.test_Gr_projection — omitted with its actual arithmetic provider interface.
EisensteinBF.test_zero_image — omitted with its actual arithmetic provider interface.
EisensteinBF.test_lattice_rescaling — omitted with its actual arithmetic provider interface.
RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison — Beilinson–Flach divisibility comparison
RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound — Nontrivial-twist rational Beilinson–Flach bound
RankZeroOneBSD:BSD.7a/congruent-characteristic-series — Congruent twists and integral characteristic series
RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison — Twisted control and augmentation comparison
RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality — Integral twisted cyclotomic equality
RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture — CGS integral cyclotomic main conjecture
RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture — Keller–Yin integral cyclotomic main conjecture
RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture — CGLS anticyclotomic prototype
RankZeroOneBSD:BSD.7/cgls-torsion-free-control — CGLS rank-one anticyclotomic control
RankZeroOneBSD:BSD.7/ky-torsion-control — Keller–Yin control with rational torsion
RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype — Greenberg–Vatsal rank-zero prototype
RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect — Rank-zero defect from integral cyclotomic equality
RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison — Rank-one twist comparison with torsion
RankZeroOneBSD:BSD.7/cgls-rank-one-prototype — CGLS rank-one Eisenstein BSD prototype
RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd — CGS good Eisenstein prime-part BSD
RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd — Keller–Yin good Eisenstein prime-part BSD
RankZeroOneBSD:BSD.8/selmer-cardinality-adapter — Finite Selmer cardinality and Sha torsion
RankZeroOneBSD:BSD.8/sha-annihilator-adapter — Certified Sha annihilator and finite descent
RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter — Certified free lattice and saturation index
RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter — Local Tamagawa certificate adapter
RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter — Exact local isogeny comparison
RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter — Exceptional-prime leading-term certificate adapter
RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch — Source-qualified fixed-prime dispatch
RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions — Individual full BSD from a finite exceptional set
RankZeroOneBSD:BSD.8/family-full-bsd-from-certificates — Full BSD for an explicitly certified family
RankZeroOneBSD:BSD.9/fixture-32-cm-additive — CM and additive dyadic fixture
RankZeroOneBSD:BSD.9/fixture-period-height-comparisons — Fixture periods, heights and regulator conventions
RankZeroOneBSD:BSD.9/mellin-central-tail-bounds — Central Mellin formulas with explicit tails
RankZeroOneBSD:BSD.9/analytic-fixture-enclosures — Certified central values for the three fixtures
RankZeroOneBSD:BSD.9/fixture-finite-arithmetic — Finite descent and saturation for the three fixtures
RankZeroOneBSD:BSD.9/fixture-11-isogeny-period — Five-isogeny and torsion-square comparison
RankZeroOneBSD:BSD.9/rank-equality-example — Rank equality comparison example
RankZeroOneBSD:BSD.9/whole-sha-finiteness-example — Whole Sha finiteness comparison example
RankZeroOneBSD:BSD.9/fixed-prime-example — Fixed prime BSD comparison example
RankZeroOneBSD:BSD.9/full-bsd-example — Full BSD certificate comparison examples
RankZeroOneBSD:BSD.9/missing-exception-fixture — Missing exceptional prime regression
RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound — Keller–Yin uniform near-trivial bound
RankZeroOneBSD:BSD.7a/bf-pr-reciprocity — EisensteinBF.coleman_PR
RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity — EisensteinBF.coleman_Gr
-/
