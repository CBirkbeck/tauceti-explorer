import Mathlib

/-!
# K2SymbolsBrauerPartII: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs; it is not exhaustive. The total conic symbol
uses arbitrary field elements, including zero, while its norm interpretation
uses units and excludes characteristic two. Its real criterion uses weak
inequalities for that reason. The rational counterexample distinguishes local
Hilbert bilinearity from a conic-solubility test over a general field.
-/

namespace TauCetiRoadmap.K2SymbolsBrauerPartII

/-! ## Layer 3: local norm-residue and conic symbols -/

/-- The total conic-solubility sign: one exactly when `r * x² + s * y² = 1`
has a solution. This definition also applies when a coefficient is zero. -/
noncomputable def conicSymbol (F : Type*) [Field F] (r s : F) : ℤˣ := by
  classical
  exact if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/-- Over the reals, failure of solubility is equivalent to both coefficients
being nonpositive. On units this specializes to the usual negative quadrant. -/
theorem conicSymbol_real_eq_neg_one_iff (r s : ℝ) :
    conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0 := by
  sorry

/-- For nonzero coefficients in characteristic different from two, the conic
criterion agrees with membership in the quadratic norm group; it also covers
the split quadratic algebra when `r` is a square. -/
theorem conicSymbol_eq_one_iff_norm {F : Type*} [Field F]
    (h2 : (2 : F) ≠ 0) (r s : Fˣ) :
    conicSymbol F (r : F) (s : F) = 1 ↔
      ∃ x y : F, (s : F) = x ^ 2 - (r : F) * y ^ 2 := by
  sorry

/-- The total sign over the rationals is not multiplicative: each of the
conics with first coefficient `3`, `7`, or `21` and second coefficient `-1`
is insoluble. This is the negative control for the local-only bilinear law. -/
theorem conicSymbol_rat_not_multiplicative :
    conicSymbol ℚ 21 (-1) ≠
      conicSymbol ℚ 3 (-1) * conicSymbol ℚ 7 (-1) := by
  sorry

/-- Zero coefficients test totality and the weak real inequalities. -/
example : conicSymbol ℝ 0 0 = -1 := by
  simp [conicSymbol]

/-- A square first coefficient yields a point regardless of the other one. -/
example (F : Type*) [Field F] (s : F) : conicSymbol F 1 s = 1 := by
  classical
  have h : ∃ x y : F, x ^ 2 + s * y ^ 2 = 1 := ⟨1, 0, by simp⟩
  simp [conicSymbol, h]

/-
The remaining definitions and milestones are stated in README.md:

Layer 1: `galoisSymbol_eq_explicitCup11`, `rootTwistTrivialization`,
`rootCupContraction`, `brauerSymbol`, their root-change and field-naturality
maps, and `galoisSymbol_residue`.

Layer 2: `cyclicSymbolAlgebra`, its basis, splitting representation,
proper-degree matrix-corner comparison, and `cyclicSymbolAlgebra_brauerClass`.

Layer 3: `normResidueK2`, `normResidueK2_splitSurjective`, `hilbertK2`,
the `hilbertK2_real` conic comparison for the supplied real sign map,
and `normResidueK2_eq_neg_invariant`.

Layer 4: `placeNormResidueK2`, `placeNormResidueK2_finiteSupport`,
`normResidueK2_product_formula`, and `brauerSymbol_sum_invariant`.

Layer 5: `tateLocal_symbolDictionary`, `tateGlobal_symbolDictionary`,
`tateGlobal_adicDictionary`, `tateSInteger_dictionary`,
`finiteK2_bockstein_exact`, and
`etaleChern_productNormalized` with its raw-Hurewicz counterpart.

These statements require classical K₂, Tate-twisted continuous cohomology,
symbol-algebra or K-spectrum/coefficient carriers not provided at the pins.
-/

end TauCetiRoadmap.K2SymbolsBrauerPartII
