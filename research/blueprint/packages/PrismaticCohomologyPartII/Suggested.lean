import Mathlib

/-!
# Prismatic cohomology, Part II: representative target signatures

The roadmap is README.md. This file records lightweight definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. The q-integer is a polynomial,
including at q = 1; the examples fix the Sen, cochain sign and derivative-thickening
conventions. The complete Nygaard, stack and q-PD constructions are README targets.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartII

open scoped BigOperators

/-! ## Layer 4: Absolute prismatic cohomology and Cartier–Witt geometry -/

/-- At p=2 an arbitrary endomorphism can fail the Sen essential-image condition:
this matrix has Θ²−Θ=id, so that polynomial is not locally nilpotent. -/
example :
    (!![0, 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 2 - !![0, 1; 1, 1] = 1 := by
  decide

/-- A weight-one operator is allowed: its reduction satisfies Θ²−Θ=0 at p=2. -/
example : (1 : ZMod 2) ^ 2 - 1 = 0 := by norm_num

/-! ## Layer 5: q-crystalline and q-de Rham theory -/

namespace QCrys

variable {R : Type*} [CommRing R]

/-- The general q-integer is a polynomial evaluation, defined even at q=1 and n=0. -/
def qInteger (n : ℕ) (q : R) : R := ∑ i ∈ Finset.range n, q ^ i

/-- The prism's distinguished cyclotomic value is the prime q-integer. -/
def pAnalog (p : ℕ) (q : R) : R := qInteger p q

-- The geometric-sum identity is supplied by Mathlib.
#check geom_sum_mul

/-- Evaluation at q=1 agrees with the integer n, without a 0/0 quotient. -/
theorem qInteger_one (n : ℕ) : qInteger n (1 : R) = n := by
  sorry

/-- The distinguished generator specializes to p. -/
example (p : ℕ) : pAnalog p (1 : ℤ) = p := by
  simpa [pAnalog] using (qInteger_one (R := ℤ) p)

/-- The empty sum is zero, including at q=0. -/
example (q : R) : qInteger 0 q = 0 := by simp [qInteger]

/-- At q=0 the nonempty polynomial sum still has its constant term. -/
example : qInteger 1 (0 : ℤ) = 1 := by simp [qInteger]

/-- The supplied geometric-sum identity works without cancelling q−1. -/
example (n : ℕ) (q : R) : qInteger n q * (q - 1) = q ^ n - 1 := by
  exact geom_sum_mul q n

/-- A dyadic q-integer has two terms, not one. -/
example (q : R) : pAnalog 2 q = 1 + q := by
  simp [pAnalog, qInteger, Finset.sum_range_succ]

/-- A nontrivial specialization distinguishes the polynomial from the constant n. -/
example : qInteger 3 (2 : ℤ) = 7 := by
  norm_num [qInteger, Finset.sum_range_succ]

/-- For p=3 the invariant cyclotomic generator is 1+q+q⁻¹, rather than [3]_q;
multiplying by the unit q identifies their ideals (Layer 4.26). -/
example (q : Rˣ) :
    (q : R) * (1 + (q : R) + ((q⁻¹ : Rˣ) : R)) = pAnalog 3 (q : R) := by
  simp [pAnalog, qInteger, Finset.sum_range_succ, mul_add]
  ring

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

/-- The same thickening at p=3 retains the quadratic term in q−1. -/
example (t x e : R) (he : e ^ 2 = t * x * e) :
    (x + e) ^ 3 = x ^ 3 + (3 + 3 * t + t ^ 2) * x ^ 2 * e := by
  linear_combination (3 * x + e + t * x) * he

end QCrys

/-
Layer 3's filtered Nygaard objects, good filtrations, transversal ideals, Breuil–Kisin
twists, divided Frobenius and Nygaard completion are specified in README.md.
Layer 4's formal QCoh, absolute site, generalized Cartier and Cartier–Witt divisors,
quotient stack, G_m^♯, Hodge–Tate divisor, Sen functor, prismatic sheaf, diffracted
Hodge complex and absolute Nygaard filtration are specified there as well.
Layer 5's framed algebras and data, q-derivatives, q-PD pairs and envelopes,
q-crystalline site, skew q-de Rham algebra, derivative thickening and AΩ comparison
maps require those carriers and remain README targets.
-/

end TauCetiRoadmap.PrismaticCohomologyPartII
