import Mathlib.NumberTheory.DirichletCharacter.Bounds
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

/-! This file is not the roadmap and is not exhaustive; the roadmap document
is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures for the ES.0 small-conductor checkpoint.
All new declarations are planning obligations, not implementations.
Existing DirichletCharacter, periodicity, finite intervals and Möbius are reused. -/
noncomputable section
open scoped BigOperators
namespace TauCeti.ExponentialSumsPlan

/-- ES.0/periodic-interval-remainder. Natural subtraction handles B < A. -/
theorem periodic_interval_remainder (f : ℕ → ℂ) (q : ℕ) (hq : 0 < q)
    (hp : Function.Periodic f q) (hz : ∑ j ∈ Finset.range q, f j = 0)
    (A B : ℕ) :
    ∑ m ∈ Finset.Ioc A B, f m =
      ∑ j ∈ Finset.range ((B - A) % q), f (A + j + 1) := by sorry

/-- ES.0/periodic-interval-norm. -/
theorem periodic_interval_norm (f : ℕ → ℂ) (q : ℕ) (hq : 0 < q)
    (hp : Function.Periodic f q) (hz : ∑ j ∈ Finset.range q, f j = 0)
    (hb : ∀ j, ‖f j‖ ≤ 1) (A B : ℕ) :
    ‖∑ m ∈ Finset.Ioc A B, f m‖ ≤ ((B - A) % q : ℕ) := by sorry

/-- ES.0/character-interval-bound. Primitivity and quadraticity are unnecessary. -/
theorem character_interval_bound {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1) (A B : ℕ) :
    ‖∑ m ∈ Finset.Ioc A B, χ m‖ ≤ (q : ℝ) := by sorry

/-- ES.0/divisible-interval-reindex. Division is natural floor division. -/
theorem divisible_interval_reindex (f : ℕ → ℂ) (A B d : ℕ) (hd : 0 < d) :
    ∑ m ∈ (Finset.Ioc A B).filter (fun m => d ∣ m), f m =
      ∑ n ∈ Finset.Ioc (A / d) (B / d), f (d * n) := by sorry

/-- ES.0/coprime-moebius-expansion. M = 0 is excluded. -/
theorem coprime_moebius_expansion (f : ℕ → ℂ) (A B M : ℕ) (hM : 0 < M) :
    (∑ m ∈ Finset.Ioc A B, if Nat.Coprime m M then f m else 0) =
      ∑ d ∈ M.divisors, (ArithmeticFunction.moebius d : ℂ) *
        ∑ m ∈ (Finset.Ioc A B).filter (fun m => d ∣ m), f m := by sorry

/-- ES.0/character-exclusion-expansion. No squarefree/coprime restriction on M. -/
theorem character_exclusion_expansion {q : ℕ}
    (χ : DirichletCharacter ℂ q) (A B M : ℕ) (hM : 0 < M) :
    (∑ m ∈ Finset.Ioc A B, if Nat.Coprime m M then χ m else 0) =
      ∑ d ∈ M.divisors, (ArithmeticFunction.moebius d : ℂ) * χ d *
        ∑ n ∈ Finset.Ioc (A / d) (B / d), χ n := by sorry

/-- ES.0/character-exclusion-bound. -/
theorem character_exclusion_bound {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (A B M : ℕ) (hM : 0 < M) :
    ‖∑ m ∈ Finset.Ioc A B, if Nat.Coprime m M then χ m else 0‖ ≤
      (M.divisors.card : ℝ) * q := by sorry

/-- ES.0/exclusion-complete-period. q*M is a period, not a claimed conductor. -/
theorem exclusion_complete_period {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (M : ℕ) (hM : 0 < M) :
    (∑ m ∈ Finset.Ioc 0 (q * M), if Nat.Coprime m M then χ m else 0) = 0 := by sorry

/-- ES.0/exclusion-direct-period-bound. -/
theorem exclusion_direct_period_bound {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (A B M : ℕ) (hM : 0 < M) :
    ‖∑ m ∈ Finset.Ioc A B, if Nat.Coprime m M then χ m else 0‖ ≤
      (q : ℝ) * M := by sorry

/-- ES.0/small-conductor-power-saving. The divisor input belongs to AN.5. -/
theorem small_conductor_power_saving (c C : ℝ) (hc : 0 < c) (hC : 1 ≤ C)
    (hτ : ∀ M : ℕ, 0 < M →
      (M.divisors.card : ℝ) ≤ C * Real.rpow M ((64 * c)⁻¹))
    (k : ℕ) (hk : 1 ≤ k) (hlarge : 8 * C ≤ Real.rpow k (17 / 64 : ℝ))
    {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (M : ℕ) (hM : 0 < M)
    (hq : (q : ℝ) ≤ 8 * Real.rpow k (7 / 32 : ℝ))
    (hsize : (M : ℝ) ≤ Real.rpow k c) :
    ‖∑ m ∈ Finset.Ioc (k / 2) k, if Nat.Coprime m M then χ m else 0‖ ≤
      Real.rpow k (1 / 2 : ℝ) := by sorry

/-- ES.0/character-exclusion-explicit-subpower-bound.
The divisor theorem is imported from AN.5, not rebuilt here. -/
theorem character_exclusion_explicit_subpower_bound
    (ε : ℝ) (hε : 0 < ε) (B : ℕ)
    (hB : Real.exp (1 / ε) ≤ (B : ℝ))
    {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (A Z M : ℕ) (hM : 0 < M) :
    ‖∑ m ∈ Finset.Ioc A Z, if Nat.Coprime m M then χ m else 0‖ ≤
      (max 1 (ε * Real.log 2)⁻¹) ^ B * (q : ℝ) * Real.rpow M ε := by sorry

/-- ES.0/small-conductor-explicit-threshold. No unspecified divisor constant. -/
theorem small_conductor_explicit_threshold
    (c : ℝ) (hc : 0 < c) (B : ℕ) (hB : Real.exp (64 * c) ≤ (B : ℝ))
    (k : ℕ) (hk : 1 ≤ k)
    (hlarge : Real.rpow (8 * (max 1 ((64 * c)⁻¹ * Real.log 2)⁻¹) ^ B)
      (64 / 17 : ℝ) ≤ (k : ℝ))
    {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ ≠ 1)
    (M : ℕ) (hM : 0 < M)
    (hq : (q : ℝ) ≤ 8 * Real.rpow k (7 / 32 : ℝ))
    (hsize : (M : ℝ) ≤ Real.rpow k c) :
    ‖∑ m ∈ Finset.Ioc (k / 2) k, if Nat.Coprime m M then χ m else 0‖ ≤
      Real.rpow k (1 / 2 : ℝ) := by sorry

/-- ES.0/eventual-small-conductor-power-saving.
The same K works for every allowed character, modulus and exclusion modulus. -/
theorem eventual_small_conductor_power_saving (c : ℝ) (hc : 0 < c) :
    ∃ K : ℕ, 1 ≤ K ∧ ∀ k : ℕ, K ≤ k →
      ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 →
      ∀ M : ℕ, 0 < M →
        (q : ℝ) ≤ 8 * Real.rpow k (7 / 32 : ℝ) →
        (M : ℝ) ≤ Real.rpow k c →
        ‖∑ m ∈ Finset.Ioc (k / 2) k, if Nat.Coprime m M then χ m else 0‖ ≤
          Real.rpow k (1 / 2 : ℝ) := by sorry

section ContractTests
/-- Contract test: character_three_complete. -/
example : (∑ n ∈ Finset.Ioc 0 2, if n % 3 = 1 then (1 : ℤ)
    else if n % 3 = 2 then -1 else 0) = 0 := by sorry
/-- Contract test: character_three_singleton. -/
example : (∑ n ∈ Finset.Ioc 1 2, if n % 3 = 1 then (1 : ℤ)
    else if n % 3 = 2 then -1 else 0) = -1 := by sorry
/-- Contract test: reversed_interval. -/
example : (∑ n ∈ Finset.Ioc 5 4, (n : ℤ)) = 0 := by sorry
/-- Contract test: constant_nonexample. -/
example : (∑ _n ∈ Finset.Ioc 0 12, (1 : ℤ)) = 12 := by sorry
/-- Contract test: divisible_sum_floor. -/
example : (∑ n ∈ (Finset.Ioc (2 : ℕ) 7).filter (fun n => 3 ∣ n), (n : ℂ)) = 9 := by sorry
/-- Contract test: divisible_sum_open_left. -/
example : (∑ n ∈ (Finset.Ioc (3 : ℕ) 6).filter (fun n => 3 ∣ n), (n : ℂ)) = 6 := by sorry
/-- Contract test: divisible_sum_empty. -/
example : (∑ n ∈ (Finset.Ioc (1 : ℕ) 2).filter (fun n => 3 ∣ n), (n : ℂ)) = 0 := by sorry
/-- Contract test: moebius_one. -/
example : (∑ d ∈ (1 : ℕ).divisors, ArithmeticFunction.moebius d) = 1 := by sorry
/-- Contract test: moebius_six. -/
example : (∑ d ∈ (6 : ℕ).divisors, ArithmeticFunction.moebius d) = 0 := by sorry
/-- Contract test: moebius_four. -/
example : (∑ d ∈ (4 : ℕ).divisors, ArithmeticFunction.moebius d) = 0 := by sorry
/-- Contract test: moebius_square. -/
example : ArithmeticFunction.moebius 4 = 0 := by sorry
/-- Contract test: divisor_count_six. -/
example : (6 : ℕ).divisors.card = 4 := by sorry
/-- Contract test: divisor_count_one. -/
example : (1 : ℕ).divisors.card = 1 := by sorry
/-- Contract test: divisor_count_counterexample. -/
example : (120 : ℕ).divisors.card = 16 := by sorry
/-- Contract test: odd_half_endpoint. -/
example : (7 : ℕ) / 2 = 3 := by sorry
/-- Contract test: saving_exponents. -/
example : (7 / 32 : ℝ) + 1 / 64 + 17 / 64 = 1 / 2 := by sorry
/-- Contract test: excluded_complete_period. -/
example : (∑ n ∈ Finset.Ioc 0 6,
    if Nat.Coprime n 2 then
      (if n % 3 = 1 then (1 : ℤ) else if n % 3 = 2 then -1 else 0)
    else 0) = 0 := by sorry
/-- Contract test: nonsquarefree_mask. -/
example : (∑ n ∈ Finset.Ioc 0 6,
    if Nat.Coprime n 2 then
      (if n % 3 = 1 then (1 : ℤ) else if n % 3 = 2 then -1 else 0)
    else 0) = (∑ n ∈ Finset.Ioc 0 6,
    if Nat.Coprime n 4 then
      (if n % 3 = 1 then (1 : ℤ) else if n % 3 = 2 then -1 else 0)
    else 0) := by sorry
/-- Contract test: threshold_reciprocal_exponents. -/
example : (64 / 17 : ℝ) * (17 / 64) = 1 := by sorry
/-- Contract test: threshold_equality. -/
example (C : ℝ) (hC : 1 ≤ C) :
    Real.rpow (Real.rpow (8 * C) (64 / 17 : ℝ)) (17 / 64 : ℝ) = 8 * C := by sorry
/-- Contract test: threshold_one_rejected. -/
example (C : ℝ) (hC : 1 ≤ C) : ¬ 8 * C ≤ Real.rpow 1 (17 / 64 : ℝ) := by sorry
/-- Contract test: one_small_conductor_exponent. -/
example : (1 / (64 * (1 / 64 : ℝ))) = 1 := by sorry
/-- Contract test: divisor_supplier_exponent. -/
example (c : ℝ) (hc : 0 < c) : 1 / ((64 * c)⁻¹) = 64 * c := by sorry
/-- Contract test: explicit_constant_one_exponent. -/
example (ε : ℝ) (hε : 0 < ε) (B : ℕ) :
    1 ≤ (max 1 (ε * Real.log 2)⁻¹) ^ B := by sorry
end ContractTests
end TauCeti.ExponentialSumsPlan
