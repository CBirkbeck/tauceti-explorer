import Mathlib

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K2SymbolsBrauerPartII.md` is definitive. These
statements suggest Lean forms so contributors and reviewers can converge on
names and signatures.

The finite twists, integral K₂, finite-coefficient higher K-theory and étale
Chern classes needed for the other milestones are not present at the pins.
Their targets, APIs, hypotheses and tests belong to the document. In particular
no replacement cohomology or K-theory carrier is introduced here.

The total conic helper below has an existing carrier. Its comparisons must
distinguish arbitrary field elements from units. The local Hilbert symbol is
imported from QuadraticFormInvariants; this helper does not replace it.
-/

namespace TauCeti.K2SymbolsBrauerPartII

/-- The total conic-solvability sign; bilinearity requires local hypotheses
and nonzero arguments. -/
noncomputable def conicSymbol (F : Type*) [Field F] (r s : F) : ℤˣ := by
  classical
  exact if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/-- The all-real criterion includes zero arguments. -/
theorem conicSymbol_real_eq_neg_one_iff (r s : ℝ) :
    conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0 := by
  sorry

/-- This is the algebraic bridge to the supplier's norm-equation symbol.
No local-field assumption is needed for this bridge. -/
theorem conicSymbol_eq_one_iff_norm {F : Type*} [Field F]
    (h2 : (2 : F) ≠ 0) (r s : Fˣ) :
    conicSymbol F (r : F) (s : F) = 1 ↔
      ∃ x y : F, (s : F) = x ^ 2 - (r : F) * y ^ 2 := by
  sorry

/-- A global field does not inherit the bilinearity of its completions. -/
theorem conicSymbol_rat_not_multiplicative :
    conicSymbol ℚ 21 (-1) ≠
      conicSymbol ℚ 3 (-1) * conicSymbol ℚ 7 (-1) := by
  sorry

example : conicSymbol ℝ 0 0 = -1 := by
  simp [conicSymbol]

example (F : Type*) [Field F] (s : F) : conicSymbol F 1 s = 1 := by
  classical
  have h : ∃ x y : F, x ^ 2 + s * y ^ 2 = 1 :=
    ⟨1, 0, by simp⟩
  simp [conicSymbol, h]

end TauCeti.K2SymbolsBrauerPartII
