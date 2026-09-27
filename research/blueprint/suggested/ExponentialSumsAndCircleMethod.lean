import Mathlib.NumberTheory.DirichletCharacter.Bounds
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.Data.Nat.GCD.Prime
import Mathlib.Data.Nat.Squarefree
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Tactic

/-! This file is not the roadmap and is not exhaustive; the roadmap document
is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures for the ES.0 conductor and modulus-packing checkpoints.
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

/-- ES.0/ambient-product-evaluation. Includes nonunits and negative integers. -/
theorem ambient_product_evaluation {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂]
    (χ₁ : DirichletCharacter ℂ N₁) (χ₂ : DirichletCharacter ℂ N₂) (a : ℤ) :
    (χ₁.mul χ₂) a = χ₁ a * χ₂ a := by sorry

/-- ES.0/primitive-exclusion-coprime. No new character or exclusion carrier. -/
theorem primitive_exclusion_coprime {M : ℕ} [NeZero M]
    (σ : DirichletCharacter ℂ M) :
    Nat.Coprime σ.conductor
      (∏ p ∈ M.primeFactors.filter (fun p => ¬ p ∣ σ.conductor), p) := by sorry

/-- ES.0/primitive-exclusion-period-divides. Divisibility, not equality. -/
theorem primitive_exclusion_period_divides {M : ℕ} [NeZero M]
    (σ : DirichletCharacter ℂ M) :
    σ.conductor * (∏ p ∈ M.primeFactors.filter (fun p => ¬ p ∣ σ.conductor), p)
      ∣ M := by sorry

/-- ES.0/primitive-exclusion-evaluation. Valid also for principal characters. -/
theorem primitive_exclusion_evaluation {M : ℕ} [NeZero M]
    (σ : DirichletCharacter ℂ M) (a : ℤ) :
    σ a = if IsCoprime a
      ((∏ p ∈ M.primeFactors.filter (fun p => ¬ p ∣ σ.conductor), p : ℕ) : ℤ)
      then σ.primitiveCharacter a else 0 := by sorry

/-- ES.0/cancelled-prime-common-support. Quadraticity is unnecessary here. -/
theorem cancelled_prime_common_support {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂]
    (χ₁ : DirichletCharacter ℂ N₁) (χ₂ : DirichletCharacter ℂ N₂)
    (hp₁ : χ₁.IsPrimitive) (hp₂ : χ₂.IsPrimitive) :
    (∏ p ∈ (Nat.lcm N₁ N₂).primeFactors.filter
      (fun p => ¬ p ∣ (χ₁.mul χ₂).conductor), p) ∣ Nat.gcd N₁ N₂ := by sorry

/-- ES.0/primitive-product-quadratic. Primitivity of the inputs is unnecessary. -/
theorem primitive_product_quadratic {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂]
    (χ₁ : DirichletCharacter ℂ N₁) (χ₂ : DirichletCharacter ℂ N₂)
    (h₁ : χ₁.IsQuadratic) (h₂ : χ₂.IsQuadratic) :
    (χ₁.primitive_mul χ₂).IsQuadratic := by sorry

/-- ES.0/primitive-product-nonprincipal. Distinct as integer-valued functions;
the moduli may coincide. -/
theorem primitive_product_nonprincipal {N₁ N₂ : ℕ} [NeZero N₁] [NeZero N₂]
    (χ₁ : DirichletCharacter ℂ N₁) (χ₂ : DirichletCharacter ℂ N₂)
    (hp₁ : χ₁.IsPrimitive) (hp₂ : χ₂.IsPrimitive)
    (h₁ : χ₁.IsQuadratic) (h₂ : χ₂.IsQuadratic)
    (hne : ∃ a : ℤ, χ₁ a ≠ χ₂ a) : χ₁.primitive_mul χ₂ ≠ 1 := by sorry

/-- ES.0/small-conductor-product-cancellation. The same K works for both
conductors and all characters; this is not the large-conductor branch. -/
theorem small_conductor_product_cancellation (c : ℝ) (hc : 0 < c) :
    ∃ K : ℕ, 1 ≤ K ∧ ∀ k : ℕ, K ≤ k →
      ∀ (N₁ N₂ : ℕ) [NeZero N₁] [NeZero N₂]
        (χ₁ : DirichletCharacter ℂ N₁) (χ₂ : DirichletCharacter ℂ N₂),
        χ₁.IsPrimitive → χ₂.IsPrimitive → χ₁.IsQuadratic → χ₂.IsQuadratic →
        (∃ a : ℤ, χ₁ a ≠ χ₂ a) →
        (N₁ : ℝ) ≤ Real.rpow k c → (N₂ : ℝ) ≤ Real.rpow k c →
        ((χ₁.mul χ₂).conductor : ℝ) ≤ 8 * Real.rpow k (7 / 32 : ℝ) →
        ‖∑ a ∈ Finset.Ioc (k / 2) k, χ₁ a * χ₂ a‖ ≤
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
/-- Contract test: exclusion_shrink_eight. -/
example : (∏ p ∈ (8 : ℕ).primeFactors.filter (fun p => ¬ p ∣ 4), p) = 1 := by sorry
/-- Contract test: exclusion_mixed_fifteen. -/
example : (∏ p ∈ (15 : ℕ).primeFactors.filter (fun p => ¬ p ∣ 5), p) = 3 := by sorry
/-- Contract test: exclusion_principal_twelve. -/
example : (∏ p ∈ (12 : ℕ).primeFactors.filter (fun p => ¬ p ∣ 1), p) = 6 := by sorry
/-- Contract test: exclusion_modulus_one. -/
example : (∏ p ∈ (1 : ℕ).primeFactors.filter (fun p => ¬ p ∣ 1), p) = 1 := by sorry
/-- Contract test: period_divisibility_not_equality. -/
example : (4 : ℕ) * 1 ∣ 8 ∧ 4 * 1 ≠ 8 := by sorry
/-- Contract test: common_prime_not_coprime_moduli. -/
example : (3 : ℕ) ∣ Nat.gcd 3 15 ∧ ¬ Nat.Coprime 3 15 := by sorry
/-- Contract test: imprimitive_support_obstruction. -/
example : ¬ (2 : ℕ) ∣ Nat.gcd 8 1 := by sorry
/-- Contract test: mask_negative_excluded. -/
example : (if IsCoprime (-3 : ℤ) 3 then (-1 : ℂ) else 0) = 0 := by sorry
/-- Contract test: mask_negative_kept. -/
example : (if IsCoprime (-2 : ℤ) 3 then (-1 : ℂ) else 0) = -1 := by sorry
/-- Contract test: mask_zero_excluded. -/
example : (if IsCoprime (0 : ℤ) 6 then (1 : ℂ) else 0) = 0 := by sorry
/-- Contract test: quadratic_two_adic_cancellation. -/
example (a : ℤ) :
    (if a % 8 = 1 ∨ a % 8 = 7 then (1 : ℤ)
      else if a % 8 = 3 ∨ a % 8 = 5 then -1 else 0) *
    (if a % 8 = 1 ∨ a % 8 = 3 then (1 : ℤ)
      else if a % 8 = 5 ∨ a % 8 = 7 then -1 else 0) =
    (if a % 4 = 1 then (1 : ℤ) else if a % 4 = 3 then -1 else 0) := by sorry
/-- Contract test: diagonal_principal_obstruction. -/
example : (∑ a ∈ Finset.Ioc (0 : ℕ) 3,
    (if a % 3 = 1 then (1 : ℤ) else if a % 3 = 2 then -1 else 0)^2) = 2 := by sorry
end ContractTests

/-! ### Bounded modulus blocks and the large-conductor size envelope
These statements do not assert the character CRT factorization or the quoted
Graham–Ringrose estimate, whose proof remains an explicit source gap. -/

/-- ES.0/smooth-divisor-window. -/
theorem smooth_divisor_window (T : ℝ) (hT : 1 < T) (N : ℕ) (hN : T ≤ (N : ℝ))
    (hsmooth : ∀ p : ℕ, p.Prime → p ∣ N → (p : ℝ) ≤ T ^ 2) :
    ∃ d : ℕ, d ∣ N ∧ T ≤ (d : ℝ) ∧ (d : ℝ) ≤ T ^ 2 := by sorry

/-- ES.0/squarefree-modulus-blocks. -/
theorem squarefree_modulus_blocks (T : ℝ) (hT : 1 < T) (N : ℕ) (hN : Squarefree N)
    (hsmooth : ∀ p : ℕ, p.Prime → p ∣ N → (p : ℝ) ≤ T ^ 2) :
    ∃ B : List ℕ, ∃ r : ℕ, 0 < r ∧ (r : ℝ) < T ∧ r * B.prod = N ∧
      (∀ b ∈ B, T ≤ (b : ℝ) ∧ (b : ℝ) ≤ T ^ 2) ∧
      B.Pairwise Nat.Coprime ∧ r.Coprime B.prod := by sorry

open Classical in
/-- ES.0/bounded-crt-modulus-blocks. Pure modulus packing, not a new CRT
character constructor. Unit factors are discarded, including the R = 1 family. -/
theorem bounded_crt_modulus_blocks (T : ℝ) (hT : 8 ≤ T) (a Q R : ℕ)
    (ha0 : 0 < a) (ha : a ≤ 8) (hQ : Squarefree Q) (hR : Squarefree R)
    (hodd : Odd Q) (hQT : T ≤ (Q : ℝ)) (hQR : Nat.Coprime Q R)
    (haQR : Nat.Coprime a (Q * R))
    (hsmoothQ : ∀ p : ℕ, p.Prime → p ∣ Q → (p : ℝ) ≤ T ^ 2)
    (hsmoothR : ∀ p : ℕ, p.Prime → p ∣ R → (p : ℝ) ≤ T ^ 2) :
    ∃ q : ℕ, ∃ B : List ℕ,
      q ∣ Q ∧ Odd q ∧ Squarefree q ∧ T ≤ (q : ℝ) ∧ (q : ℝ) ≤ T ^ 2 ∧
      (q :: B).prod = a * Q * R ∧ (q :: B).Pairwise Nat.Coprime ∧
      (∀ b ∈ q :: B, 1 < b ∧ (b : ℝ) ≤ T ^ 2) ∧
      (B.filter (fun b => decide ((b : ℝ) < T))).length ≤ 2 := by sorry

/-- ES.0/bounded-factor-count. -/
theorem bounded_factor_count (k c : ℝ) (hk : 1 < k) (hc : 0 < c)
    (r : ℕ) (q : Fin r → ℕ) (bad : Finset (Fin r)) (hbad : bad.card ≤ 2)
    (hq : ∀ i, 1 ≤ q i)
    (hlarge : ∀ i, i ∉ bad → k ^ (7 / 32 : ℝ) ≤ (q i : ℝ))
    (hprod : (∏ i, (q i : ℝ)) ≤ k ^ (2 * c)) : (r : ℝ) < 10 * c + 2 := by sorry

/-- ES.0/graham-ringrose-interval-threshold. -/
theorem graham_ringrose_interval_threshold (k q L : ℝ) (hk : (2 : ℝ) ^ (64 : ℕ) < k)
    (hq : 0 ≤ q) (hqu : q ≤ k ^ (7 / 16 : ℝ)) (hL : L ≤ k ^ (7 / 16 : ℝ)) :
    max L (q ^ (1 / 4 : ℝ)) * q ^ (5 / 4 : ℝ) ≤ k ^ (63 / 64 : ℝ) ∧
      k ^ (63 / 64 : ℝ) < k / 2 := by sorry

/-! Boundary tests for the packing and size estimates. -/

example : (6 : ℕ) ∣ 30 ∧ (3 : ℝ) ≤ 6 ∧ (6 : ℝ) ≤ 3 ^ 2 := by sorry

example : (6 : ℕ) ∣ 6 ∧ (5 : ℝ) ≤ 6 ∧ (6 : ℝ) ≤ 5 ^ 2 := by sorry

example (d : ℕ) (hd : d ≤ 9) : ¬ (d ∣ 11 ∧ 3 ≤ d) := by sorry

example : 2 * ([3,5,7] : List ℕ).prod = 210 ∧
    ([3,5,7] : List ℕ).Pairwise Nat.Coprime ∧ Nat.Coprime 2 ([3,5,7] : List ℕ).prod := by sorry

example : (1 : ℕ) * ([] : List ℕ).prod = 1 ∧ ([] : List ℕ).Pairwise Nat.Coprime := by sorry

example : ([15,7] : List ℕ).prod = 105 ∧ ([15,7] : List ℕ).Pairwise Nat.Coprime := by sorry

example : ((8 * 7 : ℕ) : ℝ) < 8 ^ 2 := by sorry

example : ([11,4,3] : List ℕ).prod = 132 ∧
    ([11,4,3] : List ℕ).Pairwise Nat.Coprime ∧
    (([11,4,3] : List ℕ).filter (fun n => n < 8)).length = 2 := by sorry

example : ¬ ([3,3,4] : List ℕ).Pairwise Nat.Coprime := by sorry

example : (([1,11,1,4,3,1] : List ℕ).filter (· != 1)) = [11,4,3] := by sorry

example : ¬ (3 : ℝ) < 10 * (3 / 64 : ℝ) + 2 := by sorry

example : ((2 : ℝ) ^ (64 : ℕ)) ^ (63 / 64 : ℝ) = 2 ^ (64 : ℕ) / 2 := by sorry
end TauCeti.ExponentialSumsPlan

/-! ## ES.0: numerical large-conductor saving
These signatures only close the divisor/threshold arithmetic.
The analytic character-sum estimate remains an explicit premise.
-/
namespace TauCeti.ExponentialSumsPlan

/-- Node bounded-divisor-power. -/
theorem bounded_divisor_power (q R r : ℕ) (hq : 0 < q) (hR : 1 ≤ R)
    (hr : r ≤ R) (C : ℝ) (hC : 1 ≤ C)
    (hτ : (q.divisors.card : ℝ) ≤ C * Real.rpow q (1/(4*(R : ℝ)^2))) :
    (q.divisors.card : ℝ)^(r^2) ≤ C^(R^2) * Real.rpow q (1/4 : ℝ) := by sorry

/-- Node large-conductor-divisor-saving. -/
theorem large_conductor_divisor_saving (q R r : ℕ) (hq : 1 < q) (hR : 1 ≤ R)
    (hr : r ≤ R) (C : ℝ) (hC : 1 ≤ C)
    (hτ : (q.divisors.card : ℝ) ≤ C * Real.rpow q (1/(4*(R : ℝ)^2)))
    (hlarge : C^(4*R^2) < (q : ℝ)) :
    (q.divisors.card : ℝ)^(r^2) < Real.rpow q (1/2 : ℝ) := by sorry

/-- Node large-conductor-explicit-divisor-threshold.
The AN.5 explicit divisor theorem is consumed, not duplicated. -/
theorem large_conductor_explicit_divisor_threshold (R r B : ℕ)
    (hR : 1 ≤ R) (hr : r ≤ R) (hB : Real.exp (4*(R : ℝ)^2) ≤ B)
    (k : ℝ) (q : ℕ) (hq : 0 < q)
    (hlarge : max 1 (Real.rpow
      (((max 1 (((1/(4*(R : ℝ)^2))*Real.log 2)⁻¹))^B)^(4*R^2))
      (32/7 : ℝ)) < k)
    (hlower : Real.rpow k (7/32 : ℝ) ≤ q) :
    (q.divisors.card : ℝ)^(r^2) < Real.rpow q (1/2 : ℝ) := by sorry

/-- Node large-conductor-eventual-divisor-saving. -/
theorem large_conductor_eventual_divisor_saving (c : ℝ) (hc : 0 < c) :
    ∃ K : ℕ, 2 ≤ K ∧ ∀ k : ℕ, K ≤ k → ∀ q r : ℕ, 0 < q →
      (r : ℝ) < 10*c+2 → Real.rpow k (7/32 : ℝ) ≤ q →
      (q.divisors.card : ℝ)^(r^2) < Real.rpow q (1/2 : ℝ) := by sorry

/-- Node graham-ringrose-saving-kernel; S is a scalar with a stated upper bound. -/
theorem graham_ringrose_saving_kernel (S k q t : ℝ) (r : ℕ)
    (hk : 0 ≤ k) (hq : 0 < q) (ht : 0 ≤ t)
    (hsave : t ≤ Real.rpow q (1/2 : ℝ))
    (hS : S ≤ 2*k*Real.rpow (t/q) (Real.rpow 2 (-(r : ℝ)))) :
    S ≤ 2*k / Real.rpow q (Real.rpow 2 (-(r : ℝ)-1)) := by sorry

/-- Node large-conductor-denominator-conversion. -/
theorem large_conductor_denominator_conversion (S k q : ℝ) (r : ℕ)
    (hk : 0 < k) (hq : Real.rpow k (7/32 : ℝ) ≤ q)
    (hS : S ≤ 2*k / Real.rpow q (Real.rpow 2 (-(r : ℝ)-1))) :
    S ≤ 2*Real.rpow k (1-(7/32 : ℝ)*Real.rpow 2 (-(r : ℝ)-1)) := by sorry

/-- Node large-conductor-exponent-margin. -/
theorem large_conductor_exponent_margin (c : ℝ) (hc : 0 < c) (r : ℕ)
    (hr : (r : ℝ) < 10*c+2) :
    (7/4 : ℝ)*Real.rpow 2 (-10*c-6) <
      (7/32 : ℝ)*Real.rpow 2 (-(r : ℝ)-1) := by sorry

/-- Node large-conductor-constant-absorption. -/
theorem large_conductor_constant_absorption (k S d γ : ℝ) (hk : 1 ≤ k)
    (hγ : 0 < γ) (hd : (7/4 : ℝ)*γ ≤ d)
    (hlarge : Real.rpow 2 (4/(3*γ)) ≤ k)
    (hS : S ≤ 2*Real.rpow k (1-d)) :
    S ≤ Real.rpow k (1-γ) := by sorry

/-- Node large-conductor-numeric-threshold.
This is not a statement that the analytic-size premise holds for characters. -/
theorem large_conductor_numeric_threshold (c : ℝ) (hc : 0 < c) :
    ∃ K : ℕ, 2 ≤ K ∧ ∀ k : ℕ, K ≤ k → ∀ q r : ℕ, 0 < q →
      (r : ℝ) < 10*c+2 → Real.rpow k (7/32 : ℝ) ≤ q →
      ∀ S : ℝ,
        S ≤ 2*(k : ℝ)*Real.rpow ((q.divisors.card : ℝ)^(r^2)/(q : ℝ))
          (Real.rpow 2 (-(r : ℝ))) →
        S ≤ Real.rpow k (1-Real.rpow 2 (-10*c-6)) := by sorry

-- Divisor-saving boundary and exponent contracts.
example (r : ℕ) :
    ¬ ((1 : ℕ).divisors.card : ℝ)^(r^2) < Real.rpow 1 (1/2 : ℝ) := by sorry
example : ((2 : ℕ).divisors.card : ℝ)^2 > 2 := by sorry
example : (32/7 : ℝ)*(7/32) = 1 := by sorry
example : (1/(4*(1 : ℝ)^2)) = 1/4 := by sorry
example : Real.rpow 2 (-(1 : ℝ)-1) = 1/4 := by sorry
example : Real.rpow 2 (-10*(1 : ℝ)-6) = 1/65536 := by sorry
example : (7/32 : ℝ)*Real.rpow 2 (-(11 : ℝ)-1) = 7/131072 := by sorry
example : (7/32 : ℝ)*Real.rpow 2 (-(12 : ℝ)-1) =
    (7/4 : ℝ)*Real.rpow 2 (-10*(1 : ℝ)-6) := by sorry
example : (2 : ℝ)^(4*(1 : ℕ)^2) = 16 := by sorry
example : (4 : ℝ)^(1 : ℕ)^2 = Real.rpow 16 (1/2 : ℝ) := by sorry
example : ¬ (2 : ℝ) ≤ Real.rpow 1 (1-(1/4 : ℝ)) := by sorry
example : Real.rpow (Real.rpow 2 (16/3 : ℝ)) (3/16 : ℝ) = 2 := by sorry
end TauCeti.ExponentialSumsPlan
