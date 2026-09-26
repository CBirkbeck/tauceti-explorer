/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every new proof is a placeholder; no implementation is claimed.

C6: the arithmetic coefficient argument for Koecher's principle, using the existing
number-field positivity and unit theory. Functions F → R below are coefficient families,
NOT a replacement for a completed toric ring or a Hilbert modular variety.
The actual cusp chart, formal descent, and global geometric theorem have no honest
signature against the current suppliers; the packet records this gap explicitly.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.NumberTheory.NumberField.TotallyPositive

open NumberField NumberField.InfinitePlace
open scoped BigOperators

noncomputable section
namespace TauCeti.HilbertCusp

variable {F : Type*} [Field F] [NumberField F] [IsTotallyReal F]

/-- C6/finite-index-cusp-unit-contraction. InfinitePlace values are ABSOLUTE values. -/
theorem finiteIndex_unit_contracts_away
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F)) (w₀ : InfinitePlace F) :
    ∃ u : U, 1 < w₀ ((u : (𝓞 F)ˣ) : F) ∧
      ∀ w : InfinitePlace F, w ≠ w₀ → w ((u : (𝓞 F)ˣ) : F) < 1 := by
  sorry

/-- C6/negative-cusp-exponent. Zero must be excluded. -/
theorem exists_negative_embedding (ξ : F) (hξ : ξ ≠ 0)
    (hpos : ¬ NumberField.IsTotallyPositive ξ) :
    ∃ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ < 0 := by
  sorry

/-- C6/negative-trace-orbit. y is in the open positive dual cone. -/
theorem negative_trace_orbit_unbounded
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F))
    (ξ : F) (hξ : ξ ≠ 0) (hpos : ¬ NumberField.IsTotallyPositive ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) :
    ∀ B : ℝ, ∃ u : U,
      (∑ w : InfinitePlace F,
        embedding_of_isReal (IsTotallyReal.isReal w)
          ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) * y w) < B := by
  sorry

variable {R : Type*} [CommRing R]

/-- C6/coefficient-unit-orbit. The multipliers are units even over nonreduced R. -/
theorem coefficient_ne_zero_on_unit_orbit
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (u : U) (ξ : F) :
    a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) ≠ 0 ↔ a ξ ≠ 0 := by
  sorry

/-- C6/bounded-cusp-support. This is the coefficient lemma, not geometric Koecher. -/
theorem bounded_cusp_support_is_positive
    (U : Subgroup (𝓞 F)ˣ) [U.FiniteIndex]
    (hd : 1 < Fintype.card (InfinitePlace F))
    (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w)
    (hbound : ∃ B : ℝ, ∀ ξ : F, a ξ ≠ 0 →
      B ≤ ∑ w : InfinitePlace F,
        embedding_of_isReal (IsTotallyReal.isReal w) ξ * y w) :
    ∀ ξ : F, a ξ ≠ 0 → ξ = 0 ∨ NumberField.IsTotallyPositive ξ := by
  sorry

/-- C6/positive-exponents-on-charts. Boundary ray generators are nonzero. -/
theorem positive_exponent_pairs_pos
    (ξ : F) (hξ : NumberField.IsTotallyPositive ξ)
    (v : InfinitePlace F → ℝ) (hv : ∀ w, 0 ≤ v w) (hv0 : v ≠ 0) :
    0 < ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) ξ * v w := by
  sorry

/-- C6/constant-term-covariance. In applications the root-of-unity phase is 1 at ξ=0. -/
theorem constant_coefficient_annihilated
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ) (u : U) :
    ((c u 0 : R) - 1) * a 0 = 0 := by
  sorry

/-- C6/constant-term-vanishing. The annihilator condition cannot be removed. -/
theorem constant_coefficient_eq_zero
    (U : Subgroup (𝓞 F)ˣ) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F),
      a ((((u : (𝓞 F)ˣ) : F) ^ 2) * ξ) = (c u ξ : R) * a ξ)
    (u : U) (hregular : ∀ r : R, ((c u 0 : R) - 1) * r = 0 → r = 0) :
    a 0 = 0 := by
  sorry

/- Acceptance regressions, not additional definitions. -/

-- C6/negative-cusp-exponent: zero has no negative real embedding.
example : ¬ ∃ w : InfinitePlace ℚ,
    embedding_of_isReal (IsTotallyReal.isReal w) (0 : ℚ) < 0 := by
  sorry

-- C6/negative-trace-orbit: the degree-one unit orbit does not escape.
example (u : (𝓞 ℚ)ˣ) : (u : ℚ) ^ 2 * (-1 : ℚ) = -1 := by
  sorry

-- C6/coefficient-unit-orbit: a nonunit can kill a nonzero coefficient.
example : (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) * 2 = 0 := by
  sorry

-- C6/constant-term-vanishing: a nontrivial unit character need not force vanishing.
example : (3 : ZMod 4) ≠ 1 ∧ (3 : ZMod 4) * 2 = 2 ∧ (2 : ZMod 4) ≠ 0 := by
  sorry

-- C6/positive-exponents-on-charts: the zero dual vector gives pairing zero.
example (ξ : F) : (∑ w : InfinitePlace F,
    embedding_of_isReal (IsTotallyReal.isReal w) ξ * (0 : ℝ)) = 0 := by
  sorry

-- C6/bounded-cusp-support: the constant series is allowed, including nonzero constants.
example [DecidableEq F] (ξ : F) (h : (if ξ = 0 then (1 : ℤ) else 0) ≠ 0) :
    ξ = 0 ∨ NumberField.IsTotallyPositive ξ := by
  sorry

-- C6/bounded-cusp-support: a single positive coefficient has nonnegative pairing.
example (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w) :
    0 ≤ ∑ w : InfinitePlace F,
      embedding_of_isReal (IsTotallyReal.isReal w) (1 : F) * y w := by
  sorry

end TauCeti.HilbertCusp

-- Generated additive baseline statement: checked because the text-only index omits it.
#check Finset.sum_pos_iff_of_nonneg
#check NumberField.Units.dirichletUnitTheorem.exists_unit
#check Units.mul_right_eq_zero
