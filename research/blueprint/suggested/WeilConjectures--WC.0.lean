/-
This file is not the roadmap and is not exhaustive. The document
`research/blueprint/readmes/WeilConjectures--WC.0.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures.

Partial checkpoint: the independent finite-spectrum child includes the formal
PowerSeries/RatFunc comparison through the existing LaurentSeries embeddings.
The seven geometric stages are not asserted here. Every proof is deliberately
admitted; elaboration is not implementation. There are no substitute geometric
carriers or proposition-valued stand-ins.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.PowerSeries.WellKnown

noncomputable section
open scoped BigOperators RatFunc
open Polynomial

namespace TauCeti.FiniteSpectrum

universe u

/-- Node recover-consecutive-moments. Rows of V are roots, columns are exponents. -/
theorem recover_consecutive_moments {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (n : ℕ) (k : Fin d) :
    c k * β k ^ n =
      ∑ j : Fin d, ((Matrix.vandermonde β)⁻¹) j k *
        (∑ i : Fin d, c i * β i ^ (n + (j : ℕ))) := by
  sorry

/-- Node consecutive-moment-bound; no division by R or a coefficient. -/
theorem consecutive_moment_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N n : ℕ) (hn : N ≤ n)
    (hbound : ∀ m : ℕ, N ≤ m → ‖∑ i : Fin d, c i * β i ^ m‖ ≤ C * R ^ m)
    (k : Fin d) :
    ‖c k‖ * ‖β k‖ ^ n ≤
      C * R ^ n * ∑ j : Fin d, ‖((Matrix.vandermonde β)⁻¹) j k‖ * R ^ (j : ℕ) := by
  sorry

/-- Node distinct-spectrum-bound. -/
theorem norm_le_of_distinct_moment_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, c i * β i ^ n‖ ≤ C * R ^ n)
    (k : Fin d) (hc : c k ≠ 0) : ‖β k‖ ≤ R := by
  sorry

/-- Node grouped-spectrum-bound. It is the whole fibre weight that must be nonzero. -/
theorem norm_le_of_grouped_moment_bound {K : Type u} [NormedField K]
    [DecidableEq K] {d : ℕ} (α w : Fin d → K)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, w i * α i ^ n‖ ≤ C * R ^ n)
    (j : Fin d)
    (hw : (∑ i ∈ Finset.univ.filter (fun i : Fin d => α i = α j), w i) ≠ 0) :
    ‖α j‖ ≤ R := by
  sorry

/-- Node power-sum-converse. Characteristic zero prevents vanishing multiplicities. -/
theorem norm_le_of_power_sum_bound {K : Type u} [NormedField K] [CharZero K]
    {d : ℕ} (α : Fin d → K) (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) :
    ∀ i : Fin d, ‖α i‖ ≤ R := by
  sorry

/-- Node power-sum-bound-iff. In the right-to-left direction take C=d. -/
theorem power_sum_bound_iff {K : Type u} [NormedField K] [CharZero K]
    {d : ℕ} (α : Fin d → K) (R : ℝ) (hR : 0 ≤ R) :
    (∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, 1 ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) ↔
      (∀ i : Fin d, ‖α i‖ ≤ R) := by
  sorry

/-- Node reciprocal-moments-escape-unit-ball. No valuation-ring substitute is defined. -/
theorem reciprocal_moments_escape {K : Type u} [NormedField K] {d : ℕ}
    (hd : 0 < d) (γ c : Fin d → K) (hγ : Function.Injective γ)
    (hsmall : ∀ i : Fin d, 0 < ‖γ i‖ ∧ ‖γ i‖ < 1)
    (hc : ∀ i : Fin d, c i ≠ 0) (N : ℕ) :
    ∃ n : ℕ, max N 1 ≤ n ∧ 1 < ‖∑ i : Fin d, c i * (γ i)⁻¹ ^ n‖ := by
  sorry

/-- Node power-sum-generating-series. Index n represents the positive exponent n+1. -/
theorem hasSum_power_sum_generating {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (z : K) (hz : ∀ i : Fin d, ‖β i * z‖ < 1) :
    HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n + 1)) * z ^ (n + 1))
      (∑ i : Fin d, c i * β i * z / (1 - β i * z)) := by
  sorry

/-- Node generating-numerator-denominator. Polynomial carriers are the existing ones. -/
theorem generating_common_denominator {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    D.eval 0 = 1 ∧ ∀ z : K, (∀ i : Fin d, 1 - β i * z ≠ 0) →
      P.eval z / D.eval z = ∑ i : Fin d, c i * β i * z / (1 - β i * z) := by
  sorry

/-- Node formal-power-sum-product. No norm, distinctness or characteristic restriction. -/
theorem formal_power_sum_product {K : Type u} [CommRing K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    let G : PowerSeries K := PowerSeries.mk
      (fun n : ℕ => if n = 0 then 0 else ∑ i : Fin d, c i * β i ^ n)
    (D : PowerSeries K) * G = (P : PowerSeries K) := by
  sorry

/-- Node formal-rational-comparison. Equality lives in the existing Laurent series field. -/
theorem formal_power_sum_eq_ratFunc {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    let G : PowerSeries K := PowerSeries.mk
      (fun n : ℕ => if n = 0 then 0 else ∑ i : Fin d, c i * β i ^ n)
    (G : LaurentSeries K) =
      algebraMap (RatFunc K) (LaurentSeries K)
        (algebraMap (Polynomial K) (RatFunc K) P /
          algebraMap (Polynomial K) (RatFunc K) D) := by
  sorry

/-- Node pole-cancellation-criterion. N and D cannot share this root when c_k is nonzero. -/
theorem generating_pole_cancellation_iff {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (k : Fin d) (hk : β k ≠ 0) :
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    P.eval ((β k)⁻¹) = 0 ↔ c k = 0 := by
  sorry

/-- Node no-pole-in-bounded-disc. Retain nonzero grouped weights. -/
theorem no_pole_of_power_sum_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (hc : ∀ i : Fin d, c i ≠ 0)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, c i * β i ^ n‖ ≤ C * R ^ n)
    (z : K) (hz : R * ‖z‖ < 1) :
    (∀ i : Fin d, 1 - β i * z ≠ 0) ∧
      HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n + 1)) * z ^ (n + 1))
        (∑ i : Fin d, c i * β i * z / (1 - β i * z)) := by
  sorry

/-- Node reciprocal-pairing-forces-equality. Geometry must supply the actual pairing. -/
theorem norm_eq_of_reciprocal_pairing {d : ℕ}
    (α : Fin d → ℂ) (τ : Equiv.Perm (Fin d))
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 < R) (N : ℕ)
    (hpair : ∀ i : Fin d, α i * α (τ i) = ((R ^ 2 : ℝ) : ℂ))
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) :
    ∀ i : Fin d, ‖α i‖ = R := by
  sorry

/-! ## Acceptance examples. These are elaborated specifications, not proved tests. -/

-- test empty_family
example (n : ℕ) : (∑ i : Fin 0, (0 : ℂ) ^ n) = 0 := by
  sorry

-- test repeated_root_multiplicity
example (n : ℕ) : (∑ _i : Fin 2, (2 : ℂ) ^ n) = 2 * (2 : ℂ) ^ n := by
  sorry

-- test first_moment_cancellation
example : (2 : ℂ) + (-2) = 0 := by
  sorry

-- test second_moment_detection
example : (2 : ℂ) ^ 2 + (-2) ^ 2 = 8 := by
  sorry

-- test invisible_grouped_root
example (n : ℕ) : (100 : ℂ) ^ n - (100 : ℂ) ^ n = 0 := by
  sorry

-- test positive_characteristic_multiplicity
example (n : ℕ) : (∑ _i : Fin 2, (1 : ZMod 2) ^ n) = 0 := by
  sorry

-- test four_equal_modulus_roots
example : (1 : ℂ) + Complex.I + (-1) + (-Complex.I) = 0 ∧
    (1 : ℂ)^2 + Complex.I^2 + (-1)^2 + (-Complex.I)^2 = 0 ∧
    (1 : ℂ)^3 + Complex.I^3 + (-1)^3 + (-Complex.I)^3 = 0 ∧
    (1 : ℂ)^4 + Complex.I^4 + (-1)^4 + (-Complex.I)^4 = 4 := by
  sorry

-- test transpose_orientation
example (c₀ c₁ : ℂ) (n : ℕ) :
    c₀ * 2 ^ n = (c₀ * 2 ^ n + c₁ * (-2) ^ n) / 2 +
      (c₀ * 2 ^ (n+1) + c₁ * (-2) ^ (n+1)) / 4 := by
  sorry

-- test zero_radius_tail
example {d : ℕ} (α : Fin d → ℂ) (N : ℕ)
    (h : ∀ n : ℕ, max N 1 ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ 0) :
    ∀ i : Fin d, α i = 0 := by
  sorry

-- test zero_at_origin
example {d : ℕ} (β c : Fin d → ℂ) :
    HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n+1)) * (0 : ℂ) ^ (n+1)) 0 := by
  sorry

-- test one_root_generating_function
example (b c z : ℂ) (h : ‖b * z‖ < 1) :
    HasSum (fun n : ℕ => c * b ^ (n+1) * z ^ (n+1)) (c * b * z / (1-b*z)) := by
  sorry

-- test repeated_denominator_requires_grouping
example (b : ℂ) (hb : b ≠ 0) :
    (2 * b * b⁻¹ * (1-b*b⁻¹) : ℂ) = 0 := by
  sorry

-- test zero_root_no_finite_pole
example (z c : ℂ) : c * 0 * z / (1 - 0 * z) = 0 := by
  sorry

-- test reciprocal_pair
example : (3 + 4 * Complex.I) * (3 - 4 * Complex.I) = (25 : ℂ) ∧
    ‖3 + 4 * Complex.I‖ = (5 : ℝ) ∧ ‖3 - 4 * Complex.I‖ = (5 : ℝ) := by
  sorry

-- test positive_exponents_only
example : ((2 : ℂ) * 0 / (1 - 2 * 0)) = 0 ∧ (1 : ℂ) / (1 - 2 * 0) = 1 := by
  sorry

-- test formal_positive_coefficients
example {K : Type u} [CommRing K] {d : ℕ} (β c : Fin d → K) (n : ℕ) :
    let G : PowerSeries K := PowerSeries.mk
      (fun m : ℕ => if m = 0 then 0 else ∑ i : Fin d, c i * β i ^ m)
    PowerSeries.coeff 0 G = 0 ∧
      PowerSeries.coeff (n + 1) G = ∑ i : Fin d, c i * β i ^ (n + 1) := by
  sorry

-- test formal_single_root_laurent
example (b c : ℚ) :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else c * b ^ n) :
      PowerSeries ℚ) : LaurentSeries ℚ) =
      algebraMap (RatFunc ℚ) (LaurentSeries ℚ)
        ((algebraMap (Polynomial ℚ) (RatFunc ℚ) (C (c * b) * X)) /
          algebraMap (Polynomial ℚ) (RatFunc ℚ) (1 - C b * X)) := by
  sorry

-- test formal_empty_spectrum
example :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else
      ∑ _i : Fin 0, (1 : ℚ) ^ n) : PowerSeries ℚ) : LaurentSeries ℚ) = 0 := by
  sorry

-- test formal_characteristic_two_cancellation
example :
    (PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else
      ∑ _i : Fin 2, (1 : ZMod 2) ^ n) : PowerSeries (ZMod 2)) = 0 := by
  sorry

-- test formal_zero_root_zeroth_power
example :
    (PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else (0 : ℚ) ^ n) :
      PowerSeries ℚ) = 0 := by
  sorry

end TauCeti.FiniteSpectrum
