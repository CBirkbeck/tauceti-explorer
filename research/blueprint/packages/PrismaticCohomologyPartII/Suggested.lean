import Mathlib

/-!
# Prismatic cohomology, Part II

The q-integer is evaluated as a polynomial, including at q = 1. These signatures and
examples fix the coefficient, cochain sign and derivative-thickening conventions of
Layers 3–5; the complete Nygaard, stack and q-PD constructions are specified in README.md.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartII

open scoped BigOperators

namespace QCrys

variable {R : Type*} [CommRing R]

/-- The general q-integer is a polynomial evaluation, defined even at q=1 and n=0. -/
def qInteger (n : ℕ) (q : R) : R := ∑ i ∈ Finset.range n, q ^ i

/-- The prism's distinguished cyclotomic value is the prime q-integer. -/
def pAnalog (p : ℕ) (q : R) : R := qInteger p q

/-- The denominator-free geometric-series identity includes q=1. -/
theorem qInteger_mul_sub_one (n : ℕ) (q : R) :
    qInteger n q * (q - 1) = q ^ n - 1 := by
  sorry

/-- Evaluation at q=1 agrees with the integer n, without a 0/0 quotient. -/
theorem qInteger_one (n : ℕ) : qInteger n (1 : R) = n := by
  sorry

/-- The distinguished generator specializes to p. -/
example (p : ℕ) : pAnalog p (1 : ℤ) = p := by
  sorry

/-- The empty sum is zero, including at q=0. -/
example (q : R) : qInteger 0 q = 0 := by simp [qInteger]

/-- A dyadic q-integer has two terms, not one. -/
example (q : R) : pAnalog 2 q = 1 + q := by
  simp [pAnalog, qInteger, Finset.sum_range_succ]

/-- A nontrivial specialization distinguishes the polynomial from the constant n. -/
example : qInteger 3 (2 : ℤ) = 7 := by
  norm_num [qInteger, Finset.sum_range_succ]

/-- The two-endomorphism cochain Koszul convention `d⁰ m = (D₁ m, D₂ m)`,
`d¹ (a, b) = D₂ a - D₁ b`: commuting operators give `d¹ ∘ d⁰ = 0`. -/
example {M : Type*} [AddCommGroup M] [Module R M] (D₁ D₂ : M →ₗ[R] M)
    (h : D₁ ∘ₗ D₂ = D₂ ∘ₗ D₁) (m : M) : D₂ (D₁ m) - D₁ (D₂ m) = 0 := by
  rw [← LinearMap.comp_apply, ← h, LinearMap.comp_apply, sub_self]

/-- Replacing subtraction by addition fails already at the integer unit. -/
example : 3 * (2 * (1 : ℤ)) + 2 * (3 * 1) = 12 := by norm_num

/-- In the dyadic derivative thickening, the epsilon-square term changes the coefficient.
This pins the Frobenius formula without cancelling the coordinate. -/
example (t x e : R) (he : e ^ 2 = t * x * e) :
    (x + e) ^ 2 = x ^ 2 + (2 + t) * x * e := by
  calc
    (x + e) ^ 2 = x ^ 2 + 2 * x * e + e ^ 2 := by ring
    _ = x ^ 2 + (2 + t) * x * e := by rw [he]; ring

end QCrys

end TauCetiRoadmap.PrismaticCohomologyPartII
