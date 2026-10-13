import Mathlib.NumberTheory.Height.NumberField
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.NumberTheory.Padics.PadicNorm

/-!
# Quantitative logarithmic forms

These are suggested forms, not an exhaustive checklist. The reader document is
the mathematical specification. This file keeps only light definitions on
existing carriers and end milestones expressible at the pinned libraries.
The Laurent Hilbert theory, invariant jets, interpolation matrices, normal
functions and Kummer constructions are targets in the reader document.

Theorems below are signatures, not implementation claims. In particular the
numerical Yu target retains the explicit proof gaps recorded in the reader.
-/

open scoped BigOperators
set_option linter.unusedVariables false

noncomputable section

namespace LogarithmicForms

/-- The unshifted rational rising factorial, with the factorial denominator. -/
def risingFactorial (k : ℕ) : Polynomial ℚ :=
  (k.factorial : ℚ)⁻¹ •
    ∏ j ∈ Finset.range k, (Polynomial.X + Polynomial.C (j : ℚ))

example : risingFactorial 0 = 1 := by
  sorry

example : risingFactorial 2 =
    (1 / 2 : ℚ) • (Polynomial.X * (Polynomial.X + 1)) := by
  sorry

/-- Waldschmidt's block version; its API assumes `0 < b`. -/
def deltaPoly (b a : ℕ) : Polynomial ℚ :=
  risingFactorial b ^ (a / b) * risingFactorial (a % b)

example (b : ℕ) (hb : 0 < b) : deltaPoly b 0 = 1 := by
  sorry

example : deltaPoly 2 3 =
    (1 / 2 : ℚ) • (Polynomial.X ^ 2 * (Polynomial.X + 1)) := by
  sorry

/-- Yu's convention starts with `X + 1`. -/
def yuDelta (k : ℕ) : Polynomial ℚ :=
  (k.factorial : ℚ)⁻¹ •
    ∏ j ∈ Finset.range k, (Polynomial.X + Polynomial.C ((j + 1 : ℕ) : ℚ))

example : Polynomial.eval 0 (yuDelta 2) = 1 := by
  sorry

example : Polynomial.eval 0 (risingFactorial 2) = 0 := by
  sorry

/-- Pointwise version with the explicit normalization cost in its constant.
This is the general-coefficient branch; the integer-coefficient branch is
specified in the reader. `D` is the degree of the field containing all data. -/
theorem waldschmidt_conservative
    {K : Type*} [Field K] [NumberField K]
    {m : ℕ} (hm : 1 ≤ m) (σ : K →+* ℂ)
    (α : Fin m → K) (ell : Fin m → ℂ)
    (hexp : ∀ j, Complex.exp (ell j) = σ (α j))
    (hind : LinearIndependent ℚ ell)
    (β : Fin (m + 1) → K) (hβ : β ≠ 0)
    (B E EStar : ℝ) (A : Fin m → ℝ)
    (hB : Real.exp 1 ≤ B) (hE : Real.exp 1 ≤ E)
    (hEStar : Real.exp 1 ≤ EStar)
    (hA : ∀ j, 1 < A j)
    (hheight : ∀ j, NumberField.absLogHeight₁ (α j) ≤ Real.log (A j))
    (hsize : ∀ j, E * ‖ell j‖ / (Module.finrank ℚ K : ℝ) ≤ Real.log (A j))
    (hmin : ∀ j, Real.log E / (Module.finrank ℚ K : ℝ) ≤ Real.log (A j))
    (hEStar₁ : Real.log E / (Module.finrank ℚ K : ℝ) ≤ Real.log EStar)
    (hEStar₂ : Real.log ((Module.finrank ℚ K : ℝ) / Real.log E) ≤ Real.log EStar)
    (hBE : EStar ≤ B)
    (hBsize : ∀ j, (Module.finrank ℚ K : ℝ) * Real.log (A j) / Real.log E ≤ B)
    (hBheight : ∀ j, NumberField.absLogHeight₁ (β j) ≤ Real.log B) :
    let Λ := σ (β 0) + ∑ j : Fin m, σ (β j.succ) * ell j
    Λ ≠ 0 ∧
      -(2 ^ (m + 25) * (m : ℝ) ^ (4 * m + 10)) *
        (Module.finrank ℚ K : ℝ) ^ (m + 2) * Real.log B *
        (∏ j, Real.log (A j)) * Real.log EStar / Real.log E ^ (m + 1)
        < Real.log ‖Λ‖ := by
  sorry

/-- Fixed chosen logarithms, general algebraic coefficients and an inhomogeneous
term. The constant depends only on the fixed logarithms and degree bound. -/
theorem baker_fixed_logs {m : ℕ} (ell : Fin m → ℂ)
    (hell : ∀ j, IsIntegral ℚ (Complex.exp (ell j)))
    (D₀ : ℕ) (hD₀ : 0 < D₀) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (γ : ℂ) (β : Fin m → ℂ) (B : ℝ),
        IsIntegral ℚ γ → (∀ j, IsIntegral ℚ (β j)) →
        (minpoly ℚ γ).natDegree ≤ D₀ →
        (∀ j, (minpoly ℚ (β j)).natDegree ≤ D₀) →
        1 ≤ B → NumberField.absMulHeight₁ γ ≤ B →
        (∀ j, NumberField.absMulHeight₁ (β j) ≤ B) →
        γ + ∑ j, β j * ell j ≠ 0 →
        Real.rpow (Real.exp 1 * B) (-C) ≤ ‖γ + ∑ j, β j * ell j‖ := by
  sorry

/-- The complex product-of-powers consumer includes arbitrary complex inputs.
The proof uses a bounded `2πi` correction to the chosen logarithm. -/
theorem baker_product {m : ℕ} (α : Fin m → ℂ)
    (hα : ∀ j, IsIntegral ℚ (α j)) (hα₀ : ∀ j, α j ≠ 0) :
    ∃ C : ℝ, 0 < C ∧ ∀ (b : Fin m → ℤ) (B : ℝ),
      1 ≤ B → (∀ j, (|b j| : ℝ) ≤ B) →
      (∏ j, α j ^ b j) ≠ 1 →
      Real.rpow (Real.exp 1 * B) (-C)
        ≤ ‖(∏ j, α j ^ b j) - 1‖ := by
  sorry

/-- Rational consumer of the numerical Yu target. Nonunits and zero individual
coefficients are allowed; the multiplicative product must differ from `1`.
The generated-field Phi comparison and descent budgets remain proof targets. -/
theorem yu_rational_fixed_inputs (p : ℕ) [Fact p.Prime]
    {n : ℕ} (α : Fin n → ℚ) (hα : ∀ j, α j ≠ 0) :
    ∃ C : ℝ, 0 < C ∧ ∀ (b : Fin n → ℤ) (B : ℝ),
      1 ≤ B → (∀ j, (|b j| : ℝ) ≤ B) →
      (∏ j, α j ^ b j) ≠ 1 →
      Real.rpow (Real.exp 1 * B) (-C)
        ≤ padicNorm p ((∏ j, α j ^ b j) - 1) := by
  sorry

end LogarithmicForms
