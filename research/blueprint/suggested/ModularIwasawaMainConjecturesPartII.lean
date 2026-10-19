import Mathlib.RingTheory.Ideal.Span
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/ModularIwasawaMainConjecturesPartII.md. Suggested
statements help contributors and reviewers agree on names and signatures;
they do not implement the roadmap. Baseline: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

This is an import index: CMAllPrimeMainConjectures owns CZ.0–CZ.6 and
InertAnticyclotomicCMMainConjecture owns IC.0–IC.6. Their packets retain all
90 nodes, 119 API items, 73 definition tests and 51 planets. Their suggested
files retain all statements statable at the pins. There is no new declaration
to prototype here. The missing arithmetic carriers remain reader targets
under those owners, including the all-prime owner's needs_changes review.

The anonymous examples below check acceptance data on existing Mathlib objects.
They do not establish an Iwasawa characteristic ideal, an elliptic-unit
comparison or elaboration of either owner's full suggested file.
-/

namespace ModularIwasawaMainConjecturesPartIIAcceptance

-- CZ.4/CZ.6 versus IC.4: rationalization loses a vertical divisor.
example : Ideal.span ({(5 : ℤ)} : Set ℤ) ≠ ⊤ := by
  simp only [ne_eq, Ideal.span_singleton_eq_top, Int.isUnit_iff]
  norm_num

example : Ideal.span ({(5 : ℚ)} : Set ℚ) = ⊤ := by
  simp [Ideal.span_singleton_eq_top]

-- IC.6: (L_p) ⊆ char(X_str) has the valuation direction shown here.
example : Ideal.span ({(25 : ℤ)} : Set ℤ) ≤ Ideal.span ({(5 : ℤ)} : Set ℤ) := by
  rw [Ideal.span_singleton_le_span_singleton]
  norm_num

example : ¬ Ideal.span ({(5 : ℤ)} : Set ℤ) ≤ Ideal.span ({(25 : ℤ)} : Set ℤ) := by
  rw [Ideal.span_singleton_le_span_singleton]
  norm_num

-- IC.2: a unit change of signed basis preserves the principal ideal.
example : Ideal.span ({(-5 : ℤ)} : Set ℤ) = Ideal.span ({(5 : ℤ)} : Set ℤ) := by
  exact Ideal.span_singleton_mul_left_unit (isUnit_neg_one : IsUnit (-1 : ℤ)) 5

-- IC.1/IC.5: inversion on the Pontryagin dual is visible for order-three scalars.
example : (2 : ZMod 7)⁻¹ = 4 := by
  apply ZMod.inv_eq_of_mul_eq_one 7 2 4
  decide

example : (2 : ZMod 7) ≠ (2 : ZMod 7)⁻¹ := by
  have h : (2 : ZMod 7)⁻¹ = 4 := ZMod.inv_eq_of_mul_eq_one 7 2 4 (by decide)
  rw [h]
  decide

-- IC.5 at p=5, n=1: Φ_5(X) belongs to the minus polynomial.
example : ((Polynomial.X - 1) *
    (Polynomial.X ^ 4 + Polynomial.X ^ 3 + Polynomial.X ^ 2 + Polynomial.X + 1) :
    Polynomial ℤ) = Polynomial.X ^ 5 - 1 := by ring

-- The n=0 plus polynomial is 1, whereas the minus polynomial vanishes at 1.
example : Polynomial.eval (1 : ℤ) (1 : Polynomial ℤ) = 1 := by simp

example : Polynomial.eval (1 : ℤ) (Polynomial.X - 1 : Polynomial ℤ) = 0 := by simp

-- Φ_5(1)=5 is nonzero over ℤ, but both factors vanish at 1 modulo 5.
-- Thus disjoint characteristic-zero roots do not give an integral Bezout unit.
example : Polynomial.eval (1 : ℤ)
    (Polynomial.X ^ 4 + Polynomial.X ^ 3 + Polynomial.X ^ 2 + Polynomial.X + 1) = 5 := by
  norm_num

example : Polynomial.eval (1 : ZMod 5)
    (Polynomial.X ^ 4 + Polynomial.X ^ 3 + Polynomial.X ^ 2 + Polynomial.X + 1) = 0 ∧
    Polynomial.eval (1 : ZMod 5) (Polynomial.X - 1 : Polynomial (ZMod 5)) = 0 := by
  norm_num
  decide

-- IC.2: a coordinate construction detects a nonunit scalar instead of erasing it.
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (b : Module.Basis Unit R M) (a : R) : b.repr (a • b ()) () = a := by simp

end ModularIwasawaMainConjecturesPartIIAcceptance
