import Mathlib.Algebra.Polynomial.Eval.Defs

/-!
# Stable reduction, Part II: the unpointed Deligne–Mumford construction

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/StableReductionPartII--MC.1.md`. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.
Discharging them does not finish MC.1.

At Mathlib 082e2d3 and Tau Ceti f790474, the relative Hilbert scheme, dualizing
family, projective-frame torsor, coherent Ext and algebraic-stack carriers needed
for the geometric targets are not available with the required interfaces. Their
statements, APIs and tests are in the document and packet. The 2026-10-12 roadmap
shape keeps that theory in the document and permits only light definitions over
existing carriers here. This file therefore records the genuine numerical
profile, with integer subtraction and the doubled graph polynomial. It introduces
no replacement carriers for the geometric targets.
-/

namespace TauCetiRoadmap.StableReductionPartII.MC1

open Polynomial

/-- Numerical profile of the complete tricanonical embedding; its geometric use has g ≥ 2. -/
noncomputable def tricanonicalHilbertPolynomial (g : ℕ) : Polynomial ℤ :=
  C ((g : ℤ) - 1) * (6 * X - 1)

namespace tricanonicalHilbertPolynomial

theorem eval (g : ℕ) (a : ℤ) :
    (tricanonicalHilbertPolynomial g).eval a = ((g : ℤ) - 1) * (6 * a - 1) := by
  sorry

theorem coeff_one (g : ℕ) :
    (tricanonicalHilbertPolynomial g).coeff 1 = 6 * ((g : ℤ) - 1) := by
  sorry

theorem eval_zero (g : ℕ) :
    (tricanonicalHilbertPolynomial g).eval 0 = 1 - (g : ℤ) := by
  sorry

theorem eval_one (g : ℕ) :
    (tricanonicalHilbertPolynomial g).eval 1 = 5 * ((g : ℤ) - 1) := by
  sorry

theorem eval_two_mul (g : ℕ) (a : ℤ) :
    (tricanonicalHilbertPolynomial g).eval (2 * a) =
      ((g : ℤ) - 1) * (12 * a - 1) := by
  sorry

end tricanonicalHilbertPolynomial

-- tricanonicalHilbertPolynomial.genus_two
example : tricanonicalHilbertPolynomial 2 = 6 * X - 1 ∧
    (tricanonicalHilbertPolynomial 2).eval 1 = 5 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_three
example : tricanonicalHilbertPolynomial 3 = 12 * X - 2 ∧
    (tricanonicalHilbertPolynomial 3).eval 1 = 10 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_one
example : tricanonicalHilbertPolynomial 1 = 0 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_zero: subtraction is in ℤ.
example : tricanonicalHilbertPolynomial 0 = 1 - 6 * X := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC1
