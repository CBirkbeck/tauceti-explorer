import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Algebra.Group.ForwardDiff
import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.MeasureTheory.Integral.Pi
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.MeasureTheory.Function.LpSeminorm.Defs
import Mathlib.Data.Int.Interval
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.ZMod.QuotientRing
import Mathlib.Algebra.BigOperators.Pi
import Mathlib.Algebra.Group.Pi.Units
import Mathlib.Algebra.Group.Units.Equiv
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
converge on names and signatures for the ES.0–ES.5 planning checkpoints.
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


/-! ## ES.0: CRT character factors
Native CRT and unit-character equivalences are composed. Conductor and
quadratic-conductor suppliers retain their ClassicalArithmeticCompletion owner.
-/
namespace TauCeti.ExponentialSumsPlan
section CRT
variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {C : Type*} [CommMonoidWithZero C]
variable (n : ι → ℕ) (hn : Pairwise (fun i j => Nat.Coprime (n i) (n j)))

/-- ES.0/crt-character-equivalence. No new character carrier. -/
def crtCharacterEquiv (hn : Pairwise (fun i j => Nat.Coprime (n i) (n j))) : DirichletCharacter C (∏ i, n i) ≃*
    (∀ i, DirichletCharacter C (n i)) := by sorry

/-- The forward map restricts the character to one CRT unit coordinate. -/
theorem crtCharacterEquiv_apply_unit
    (χ : DirichletCharacter C (∏ i, n i)) (i : ι) (u : (ZMod (n i))ˣ) :
    (crtCharacterEquiv n hn χ i).toUnitHom u =
      χ.toUnitHom (((Units.mapEquiv (ZMod.prodEquivPi n hn).toMulEquiv).trans
        MulEquiv.piUnits).symm (Pi.mulSingle i u)) := by sorry

/-- Unit evaluation of the inverse, including the empty index type. -/
theorem crtCharacterEquiv_symm_unit (φ : ∀ i, DirichletCharacter C (n i))
    (u : (ZMod (∏ i, n i))ˣ) :
    (crtCharacterEquiv n hn).symm φ u =
      ∏ i, φ i (ZMod.unitsMap (Finset.dvd_prod_of_mem n (Finset.mem_univ i)) u) := by sorry

theorem crtCharacterEquiv_one :
    crtCharacterEquiv (C := C) n hn 1 = 1 := by sorry

theorem crtCharacterEquiv_mul (χ ψ : DirichletCharacter C (∏ i, n i)) :
    crtCharacterEquiv n hn (χ * ψ) =
      crtCharacterEquiv n hn χ * crtCharacterEquiv n hn ψ := by sorry

theorem crtCharacterEquiv_ext (χ ψ : DirichletCharacter C (∏ i, n i)) :
    χ = ψ ↔ ∀ i, crtCharacterEquiv n hn χ i = crtCharacterEquiv n hn ψ i := by sorry

/-- ES.0/crt-inverse-product. Native changeLevel includes nonunit zero extension. -/
theorem crt_inverse_product (φ : ∀ i, DirichletCharacter C (n i)) :
    (crtCharacterEquiv n hn).symm φ =
      ∏ i, DirichletCharacter.changeLevel
        (Finset.dvd_prod_of_mem n (Finset.mem_univ i)) (φ i) := by sorry

/-- ES.0/crt-integer-evaluation. No unit hypothesis on a. -/
theorem crt_integer_evaluation (χ : DirichletCharacter C (∏ i, n i)) (a : ℤ) :
    χ a = ∏ i, crtCharacterEquiv n hn χ i a := by sorry

/-- ES.0/crt-primitive-family. Uses the CA.1 binary primitivity supplier. -/
theorem crt_primitive_family (hpos : ∀ i, 0 < n i)
    (φ : ∀ i, DirichletCharacter C (n i)) (hφ : ∀ i, (φ i).IsPrimitive) :
    ((crtCharacterEquiv n hn).symm φ).IsPrimitive := by sorry

/-- ES.0/crt-product-conductor. -/
theorem crt_product_conductor (hpos : ∀ i, 0 < n i)
    (φ : ∀ i, DirichletCharacter C (n i)) :
    ((crtCharacterEquiv n hn).symm φ).conductor = ∏ i, (φ i).conductor := by sorry

/-- ES.0/crt-component-conductor. -/
theorem crt_component_conductor (hpos : ∀ i, 0 < n i)
    (χ : DirichletCharacter C (∏ i, n i)) (i : ι) :
    (crtCharacterEquiv n hn χ i).conductor = Nat.gcd χ.conductor (n i) := by sorry

/-- ES.0/crt-quadratic-components. Quadraticity is the native predicate. -/
theorem crt_quadratic_components {χ : DirichletCharacter ℂ (∏ i, n i)}
    (hχ : χ.IsQuadratic) (i : ι) :
    (crtCharacterEquiv n hn χ i).IsQuadratic := by sorry
end CRT

/-- ES.0/change-level-exclusion. Valid even if D and R share primes. -/
theorem change_level_exclusion {D : ℕ} (η : DirichletCharacter ℂ D)
    (R : ℕ) (a : ℤ) :
    DirichletCharacter.changeLevel (Nat.dvd_mul_right D R) η a =
      if IsCoprime a (R : ℤ) then η a else 0 := by sorry

open Classical in
/-- ES.0/bounded-crt-character-factors. The source application needs only the
first factor primitive; remaining factors retain their ambient moduli. -/
theorem bounded_crt_character_factors (T : ℝ) (hT : 8 ≤ T) (a Q R : ℕ)
    (ha0 : 0 < a) (ha : a ≤ 8) (hQ : Squarefree Q) (hR : Squarefree R)
    (hodd : Odd Q) (hQT : T ≤ (Q : ℝ)) (hQR : Nat.Coprime Q R)
    (haQR : Nat.Coprime a (Q * R))
    (hsmoothQ : ∀ p : ℕ, p.Prime → p ∣ Q → (p : ℝ) ≤ T ^ 2)
    (hsmoothR : ∀ p : ℕ, p.Prime → p ∣ R → (p : ℝ) ≤ T ^ 2)
    (η : DirichletCharacter ℂ (a * Q)) (hη : η.IsPrimitive) :
    ∃ r : ℕ, ∃ n : Fin (r+1) → ℕ, ∃ φ : ∀ i, DirichletCharacter ℂ (n i),
      Pairwise (fun i j => Nat.Coprime (n i) (n j)) ∧
      (∏ i, n i) = a * Q * R ∧
      n 0 ∣ Q ∧ Odd (n 0) ∧ Squarefree (n 0) ∧ T ≤ (n 0 : ℝ) ∧
      (∀ i, 1 < n i ∧ (n i : ℝ) ≤ T ^ 2) ∧
      (Finset.univ.filter (fun i => i ≠ 0 ∧ (n i : ℝ) < T)).card ≤ 2 ∧
      (φ 0).IsPrimitive ∧
      (∀ i, (φ i).conductor = Nat.gcd (a * Q) (n i)) ∧
      (∀ z : ℤ, (if IsCoprime z (R : ℤ) then η z else 0) = ∏ i, φ i z) := by sorry

open Classical in
/-- ES.0/large-conductor-character-blocks. This supplies factors, not the
Graham–Ringrose character-sum estimate. M is an ambient modulus. -/
theorem large_conductor_character_blocks (c : ℝ) (hc : 0 < c)
    (k : ℕ) (hk : (2 : ℝ)^(64 : ℕ) < k)
    {M : ℕ} [NeZero M] (σ : DirichletCharacter ℂ M) (hσ : σ.IsQuadratic)
    (hsize : (M : ℝ) ≤ Real.rpow k (2*c))
    (hlarge : 8 * Real.rpow k (7/32 : ℝ) ≤ σ.conductor)
    (hsmooth : ∀ p : ℕ, p.Prime → p ∣ M → (p : ℝ) ≤ Real.rpow k (7/16 : ℝ)) :
    ∃ r : ℕ, ∃ n : Fin (r+1) → ℕ, ∃ φ : ∀ i, DirichletCharacter ℂ (n i),
      Pairwise (fun i j => Nat.Coprime (n i) (n j)) ∧
      (∏ i, n i) ∣ M ∧
      (∀ i, 1 < n i ∧ (n i : ℝ) ≤ Real.rpow k (7/16 : ℝ)) ∧
      Odd (n 0) ∧ Squarefree (n 0) ∧ Real.rpow k (7/32 : ℝ) ≤ n 0 ∧
      (φ 0).IsPrimitive ∧ (∀ i, (φ i).IsQuadratic) ∧
      (∀ z : ℤ, σ z = ∏ i, φ i z) ∧
      ((r+1 : ℕ) : ℝ) < 10*c+2 ∧
      (max (((Finset.univ.erase (0 : Fin (r+1))).sup n : ℕ) : ℝ)
        (Real.rpow (n 0) (1/4 : ℝ))) * Real.rpow (n 0) (5/4 : ℝ) < (k : ℝ)/2 := by sorry

section CRTTests
-- Contract test: crt_empty_inverse.
example (a : ℤ) :
    (crtCharacterEquiv (C := ℂ) (fun _ : Fin 0 => 2) (by simp [Pairwise])).symm
      (fun i => Fin.elim0 i) a = 1 := by sorry
-- Contract test: crt_one_zero.
example : crtCharacterEquiv (C := ℂ) (fun _ : Fin 1 => 1)
    (by simp [Pairwise]) 1 0 0 = 1 := by sorry
-- Contract test: crt_singleton.
example (χ : DirichletCharacter ℂ (∏ _ : Fin 1, 7)) (a : ℤ) :
    crtCharacterEquiv (fun _ : Fin 1 => 7) (by simp [Pairwise]) χ 0 a = χ a := by sorry
-- Contract test: crt_principal_nonunit.
example : (crtCharacterEquiv (C := ℂ) ![3,4] (by intro i j h; fin_cases i <;> fin_cases j <;> norm_num at *)).symm 1 (2 : ℤ) = 0 := by sorry
-- Contract test: crt_principal_unit.
example : (crtCharacterEquiv (C := ℂ) ![3,4] (by intro i j h; fin_cases i <;> fin_cases j <;> norm_num at *)).symm 1 (-1 : ℤ) = 1 := by sorry
-- Contract test: crt_principal_conductor.
example : ((crtCharacterEquiv (C := ℂ) ![3,4] (by intro i j h; fin_cases i <;> fin_cases j <;> norm_num at *)).symm 1).conductor = 1 := by sorry
-- Boundary: distinguished conductor uses gcd, not the whole ambient block.
example : Nat.gcd 4 3 = 1 ∧ Nat.gcd 4 4 = 4 := by sorry
-- Empty principal family preserves the primitive character at all integers.
example (D : ℕ) (η : DirichletCharacter ℂ D) (a : ℤ) :
    DirichletCharacter.changeLevel (Nat.dvd_mul_right D 1) η a = η a := by sorry
end CRTTests
end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
/-! Finite complex q–van der Corput checkpoint. All statements are planning signatures. -/

/-- ES.0/interval-correlation. The second factor is conjugated; no cyclic wraparound. -/
def intervalCorrelation (A : ℤ) (N : ℕ) (b : ℤ → ℂ) (t : ℤ) : ℂ := by sorry

theorem intervalCorrelation_empty (A : ℤ) (b : ℤ → ℂ) (t : ℤ) :
    intervalCorrelation A 0 b t = 0 := by sorry

/-- ES.0/interval-correlation-zero. -/
theorem interval_correlation_zero (A : ℤ) (N : ℕ) (b : ℤ → ℂ) :
    intervalCorrelation A N b 0 =
      ((∑ n ∈ Finset.Ioc A (A + N), ‖b n‖ ^ 2 : ℝ) : ℂ) := by sorry

/-- ES.0/interval-correlation-neg. The zero-extension hypothesis is essential. -/
theorem interval_correlation_neg (A : ℤ) (N : ℕ) (b : ℤ → ℂ)
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) (t : ℤ) :
    intervalCorrelation A N b (-t) = star (intervalCorrelation A N b t) := by sorry

/-- ES.0/interval-correlation-vanish. Equality at the support length is included. -/
theorem interval_correlation_vanish (A : ℤ) (N : ℕ) (b : ℤ → ℂ)
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0)
    (t : ℤ) (ht : (N : ℤ) ≤ |t|) :
    intervalCorrelation A N b t = 0 := by sorry

theorem intervalCorrelation_scale (A : ℤ) (N : ℕ) (b : ℤ → ℂ) (t : ℤ) (z : ℂ) :
    intervalCorrelation A N (fun n => z * b n) t =
      (‖z‖ ^ 2 : ℝ) * intervalCorrelation A N b t := by sorry

theorem intervalCorrelation_translate (A : ℤ) (N : ℕ) (b : ℤ → ℂ) (t s : ℤ) :
    intervalCorrelation (A - s) N (fun n => b (n + s)) t =
      intervalCorrelation A N b t := by sorry

/-- correlation_empty -/
example (b : ℤ → ℂ) (t : ℤ) : intervalCorrelation (-3) 0 b t = 0 := by sorry
/-- correlation_complex_diagonal -/
example : intervalCorrelation 0 2 (fun n => if n = 1 then 1 else if n = 2 then Complex.I else 0) 0 = 2 := by sorry
/-- correlation_positive_phase -/
example : intervalCorrelation 0 2 (fun n => if n = 1 then 1 else if n = 2 then Complex.I else 0) 1 = Complex.I := by sorry
/-- correlation_negative_phase -/
example : intervalCorrelation 0 2 (fun n => if n = 1 then 1 else if n = 2 then Complex.I else 0) (-1) = -Complex.I := by sorry
/-- correlation_no_wraparound -/
example : intervalCorrelation 0 2 (fun n => if n = 1 then 1 else if n = 2 then Complex.I else 0) 2 = 0 := by sorry
/-- correlation_negative_interval -/
example : intervalCorrelation (-2) 1 (fun n => if n = -1 then Complex.I else 0) 0 = 1 := by sorry

/-- ES.0/shift-support-envelope. -/
theorem shift_support_envelope (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (b : ℤ → ℂ) (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) :
    (∀ k < H, ∀ n, n ∉ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N) →
      b (n + (k : ℤ) * r) = 0) ∧
    (Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N)).card =
      N + (H - 1) * r := by sorry

/-- ES.0/supported-shift-sum. -/
theorem supported_shift_sum (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (f : ℤ → ℂ) (hf : ∀ n, n ∉ Finset.Ioc A (A + N) → f n = 0)
    (k : ℕ) (hk : k < H) :
    ∑ n ∈ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N), f (n + (k : ℤ) * r) =
      ∑ n ∈ Finset.Ioc A (A + N), f n := by sorry

/-- ES.0/periodic-shift-averaging. -/
theorem periodic_shift_averaging (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (a b : ℤ → ℂ) (ha : Function.Periodic a (r : ℤ))
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) :
    (H : ℂ) * (∑ n ∈ Finset.Ioc A (A + N), a n * b n) =
      ∑ n ∈ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N),
        a n * ∑ k ∈ Finset.range H, b (n + (k : ℤ) * r) := by sorry

/-- ES.0/shift-pair-correlation. Subtraction k-l is in the integers. -/
theorem shift_pair_correlation (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (b : ℤ → ℂ) (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0)
    (k l : ℕ) (hk : k < H) (hl : l < H) :
    (∑ n ∈ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N),
      b (n + (k : ℤ) * r) * star (b (n + (l : ℤ) * r))) =
      intervalCorrelation A N b (((k : ℤ) - l) * r) := by sorry

/-- ES.0/shift-pair-lag-count. Valid also at H=0. -/
theorem shift_pair_lag_count (H : ℕ) (F : ℤ → ℂ) :
    (∑ k ∈ Finset.range H, ∑ l ∈ Finset.range H, F ((k : ℤ) - l)) =
      (H : ℂ) * F 0 +
        ∑ h ∈ Finset.Ico 1 H, ((H - h : ℕ) : ℂ) * (F h + F (-(h : ℤ))) := by sorry

/-- ES.0/shift-energy-expansion. -/
theorem shift_energy_expansion (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (b : ℤ → ℂ) (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) :
    (∑ n ∈ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N),
      ‖∑ k ∈ Finset.range H, b (n + (k : ℤ) * r)‖ ^ 2) =
      (H : ℝ) * (∑ n ∈ Finset.Ioc A (A + N), ‖b n‖ ^ 2) +
        2 * ∑ h ∈ Finset.Ico 1 H, ((H - h : ℕ) : ℝ) *
          (intervalCorrelation A N b ((h : ℤ) * r)).re := by sorry

/-- ES.0/q-vdc-energy-bound. -/
theorem q_vdc_energy_bound (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (a b : ℤ → ℂ) (ha : Function.Periodic a (r : ℤ))
    (haNorm : ∀ n, ‖a n‖ ≤ 1)
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) :
    (H : ℝ) ^ 2 * ‖∑ n ∈ Finset.Ioc A (A + N), a n * b n‖ ^ 2 ≤
      ((N + (H - 1) * r : ℕ) : ℝ) *
        ∑ n ∈ Finset.Ioc (A - ((H - 1 : ℕ) : ℤ) * r) (A + N),
          ‖∑ k ∈ Finset.range H, b (n + (k : ℤ) * r)‖ ^ 2 := by sorry

/-- ES.0/q-vdc-lag-bound. -/
theorem q_vdc_lag_bound (A : ℤ) (N r H : ℕ) (hH : 0 < H)
    (a b : ℤ → ℂ) (ha : Function.Periodic a (r : ℤ))
    (haNorm : ∀ n, ‖a n‖ ≤ 1)
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0) :
    (H : ℝ) ^ 2 * ‖∑ n ∈ Finset.Ioc A (A + N), a n * b n‖ ^ 2 ≤
      ((N + (H - 1) * r : ℕ) : ℝ) *
        ((H : ℝ) * (∑ n ∈ Finset.Ioc A (A + N), ‖b n‖ ^ 2) +
          2 * ∑ h ∈ Finset.Ico 1 H, ((H - h : ℕ) : ℝ) *
            ‖intervalCorrelation A N b ((h : ℤ) * r)‖) := by sorry

/-- ES.0/q-vdc-uniform-correlation. -/
theorem q_vdc_uniform_correlation (A : ℤ) (N r : ℕ) (hr : 1 ≤ r) (hrN : r ≤ N)
    (a b : ℤ → ℂ) (ha : Function.Periodic a (r : ℤ))
    (haNorm : ∀ n, ‖a n‖ ≤ 1)
    (hb : ∀ n, n ∉ Finset.Ioc A (A + N) → b n = 0)
    (hbNorm : ∀ n ∈ Finset.Ioc A (A + N), ‖b n‖ ≤ 1)
    (T : ℝ) (hT : 0 ≤ T)
    (hc : ∀ h ∈ Finset.Ico 1 (N / r),
      ‖intervalCorrelation A N b ((h : ℤ) * r)‖ ≤ T) :
    ‖∑ n ∈ Finset.Ioc A (A + N), a n * b n‖ ^ 2 ≤
      4 * (N : ℝ) * r + 2 * N * T := by sorry

/-- Empty shift-pair square. -/
example (F : ℤ → ℂ) :
    (∑ k ∈ Finset.range 0, ∑ l ∈ Finset.range 0, F ((k : ℤ) - l)) = 0 := by sorry
/-- Lag multiplicities at H=3. -/
example (F : ℤ → ℂ) :
    (∑ k ∈ Finset.range 3, ∑ l ∈ Finset.range 3, F ((k : ℤ) - l)) =
      3 * F 0 + 2 * (F 1 + F (-1)) + F 2 + F (-2) := by sorry
/-- The support envelope includes gaps. -/
example : (Finset.Ioc (-3 : ℤ) 2).card = 5 := by sorry
/-- Constant two-point data retain off-diagonal energy. -/
example :
    (∑ n ∈ Finset.Ioc (-1 : ℤ) 2,
      ‖∑ k ∈ Finset.range 2,
        (if n + (k : ℤ) ∈ Finset.Ioc (0 : ℤ) 2 then (1 : ℂ) else 0)‖ ^ 2) = 6 := by sorry
/-- Alternating two-point data have a negative real correlation. -/
example :
    (∑ n ∈ Finset.Ioc (-1 : ℤ) 2,
      ‖∑ k ∈ Finset.range 2,
        (if n + (k : ℤ) = 1 then (1 : ℂ) else if n + (k : ℤ) = 2 then -1 else 0)‖ ^ 2) = 2 := by sorry
/-- The uniform theorem permits an empty off-diagonal premise at r=N. -/
example (N : ℕ) (hN : 0 < N) : Finset.Ico 1 (N / N) = ∅ := by sorry
end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
open MeasureTheory
open scoped ComplexConjugate

/-- ES.1/weighted-torus-sum. Native torus characters and finite carrier. -/
def weightedTorusSum {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) (α : Fin n → AddCircle (1 : ℝ)) : ℂ :=
  ∑ a ∈ A, w a * ∏ j : Fin n, fourier (Φ a j) (α j)

theorem weightedTorusSum_empty {ι : Type*} (n : ℕ)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) (α : Fin n → AddCircle (1 : ℝ)) :
    weightedTorusSum n ∅ Φ w α = 0 := by sorry
theorem weightedTorusSum_singleton {ι : Type*} [DecidableEq ι] (n : ℕ)
    (a : ι) (Φ : ι → Fin n → ℤ) (w : ι → ℂ) (α : Fin n → AddCircle (1 : ℝ)) :
    weightedTorusSum n {a} Φ w α = w a * ∏ j : Fin n, fourier (Φ a j) (α j) := by sorry
theorem weightedTorusSum_zero {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) :
    weightedTorusSum n A Φ w 0 = ∑ a ∈ A, w a := by sorry
theorem weightedTorusSum_add_weights {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (u v : ι → ℂ) (α : Fin n → AddCircle (1 : ℝ)) :
    weightedTorusSum n A Φ (u + v) α =
      weightedTorusSum n A Φ u α + weightedTorusSum n A Φ v α := by sorry
theorem weightedTorusSum_continuous {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) : Continuous (weightedTorusSum n A Φ w) := by sorry
theorem weightedTorusSum_integer_phase {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) (x : Fin n → ℝ) :
    weightedTorusSum n A Φ w (fun j => (x j : AddCircle (1 : ℝ))) =
      ∑ a ∈ A, w a * Complex.exp (2 * Real.pi * Complex.I *
        (∑ j : Fin n, (Φ a j : ℝ) * x j)) := by sorry
theorem weightedTorusSum_zero_dimension {ι : Type*} (A : Finset ι)
    (Φ : ι → Fin 0 → ℤ) (w : ι → ℂ) (α : Fin 0 → AddCircle (1 : ℝ)) :
    weightedTorusSum 0 A Φ w α = ∑ a ∈ A, w a := by sorry

/-- ES.1/torus-coefficient-extraction. The measure has total mass one. -/
theorem torus_coefficient_extraction {ι : Type*} (n : ℕ) (A : Finset ι)
    (Φ : ι → Fin n → ℤ) (w : ι → ℂ) (b : Fin n → ℤ) :
    (∫ α : Fin n → AddCircle (1 : ℝ),
      weightedTorusSum n A Φ w α * ∏ j : Fin n, fourier (-b j) (α j)
      ∂Measure.pi (fun _ => AddCircle.haarAddCircle)) =
      ∑ a ∈ A, if Φ a = b then w a else 0 := by sorry

/-- ES.1/moment-weyl-sum. Positive interval; coordinate j has degree j+1. -/
def momentWeylSum (n N : ℕ) (α : Fin n → AddCircle (1 : ℝ)) : ℂ :=
  weightedTorusSum n (Finset.Icc 1 N)
    (fun m j => (m : ℤ) ^ (j.val + 1)) (fun _ => 1) α
theorem momentWeylSum_eq_weightedTorusSum (n N : ℕ) (α : Fin n → AddCircle (1 : ℝ)) :
    momentWeylSum n N α = weightedTorusSum n (Finset.Icc 1 N)
      (fun m j => (m : ℤ) ^ (j.val + 1)) (fun _ => 1) α := by sorry
theorem momentWeylSum_zero_cutoff (n : ℕ) (α : Fin n → AddCircle (1 : ℝ)) :
    momentWeylSum n 0 α = 0 := by sorry
theorem momentWeylSum_zero_phase (n N : ℕ) : momentWeylSum n N 0 = N := by sorry
theorem momentWeylSum_zero_dimension (N : ℕ) (α : Fin 0 → AddCircle (1 : ℝ)) :
    momentWeylSum 0 N α = N := by sorry
theorem momentWeylSum_real_lift (n N : ℕ) (x : Fin n → ℝ) :
    momentWeylSum n N (fun j => (x j : AddCircle (1 : ℝ))) =
      ∑ m ∈ Finset.Icc 1 N, Complex.exp (2 * Real.pi * Complex.I *
        (∑ j : Fin n, x j * (m : ℝ) ^ (j.val + 1))) := by sorry

/-- ES.2/vinogradov-mean-value. Ordered pairs, not permutation classes. -/
def vinogradovMeanValue (n s N : ℕ) : ℕ :=
  Fintype.card {xy : (Fin s → Fin N) × (Fin s → Fin N) //
    ∀ j : Fin n, (∑ i : Fin s, ((xy.1 i).val + 1) ^ (j.val + 1)) =
      ∑ i : Fin s, ((xy.2 i).val + 1) ^ (j.val + 1)}
theorem vinogradovMeanValue_source_count (n s N : ℕ) :
    vinogradovMeanValue n s N = Fintype.card
      {xy : (Fin s → Fin N) × (Fin s → Fin N) //
        ∀ j : Fin n, (∑ i : Fin s, ((xy.1 i).val + 1) ^ (j.val + 1)) =
          ∑ i : Fin s, ((xy.2 i).val + 1) ^ (j.val + 1)} := by sorry
theorem vinogradovMeanValue_zero_variables (n N : ℕ) :
    vinogradovMeanValue n 0 N = 1 := by sorry
theorem vinogradovMeanValue_zero_degree (s N : ℕ) :
    vinogradovMeanValue 0 s N = N ^ (2 * s) := by sorry
theorem vinogradovMeanValue_one_variable (n N : ℕ) (hn : 1 ≤ n) :
    vinogradovMeanValue n 1 N = N := by sorry
theorem vinogradovMeanValue_one_cutoff (n s : ℕ) :
    vinogradovMeanValue n s 1 = 1 := by sorry
theorem vinogradovMeanValue_zero_cutoff (n s : ℕ) (hs : 0 < s) :
    vinogradovMeanValue n s 0 = 0 := by sorry
theorem vinogradovMeanValue_mono_degree (n m s N : ℕ) (h : n ≤ m) :
    vinogradovMeanValue m s N ≤ vinogradovMeanValue n s N := by sorry

/-- ES.1/vinogradov-counting-integral. All finite boundary cases are retained. -/
theorem vinogradov_counting_integral (n s N : ℕ) :
    (vinogradovMeanValue n s N : ℝ) =
      ∫ α : Fin n → AddCircle (1 : ℝ), ‖momentWeylSum n N α‖ ^ (2 * s)
        ∂Measure.pi (fun _ => AddCircle.haarAddCircle) := by sorry

/-! weightedTorusSum_empty_test -/
example (n : ℕ) (Φ : ℤ → Fin n → ℤ) (w : ℤ → ℂ)
    (α : Fin n → AddCircle (1 : ℝ)) : weightedTorusSum n ∅ Φ w α = 0 := by sorry
/-! weightedTorusSum_singleton_negative_test -/
example : weightedTorusSum 1 ({0} : Finset ℤ) (fun _ _ => -1) (fun _ => 2)
    (fun _ => ((1 / 4 : ℝ) : AddCircle (1 : ℝ))) = -2 * Complex.I := by sorry
/-! weightedTorusSum_fourier_test -/
example (m : ℤ) (α : Fin 1 → AddCircle (1 : ℝ)) :
    weightedTorusSum 1 ({0} : Finset ℤ) (fun _ _ => m) (fun _ => 1) α =
      fourier m (α 0) := by sorry
/-! weightedTorusSum_zero_dimension_test -/
example (α : Fin 0 → AddCircle (1 : ℝ)) :
    weightedTorusSum 0 ({0, 1} : Finset ℤ) (fun _ _ => 0)
      (fun i => if i = 0 then 2 else -3) α = -1 := by sorry
/-! momentWeylSum_zero_cutoff_test -/
example (n : ℕ) (α : Fin n → AddCircle (1 : ℝ)) : momentWeylSum n 0 α = 0 := by sorry
/-! momentWeylSum_zero_phase_test -/
example : momentWeylSum 2 3 0 = 3 := by sorry
/-! momentWeylSum_linear_test -/
example (α : Fin 1 → AddCircle (1 : ℝ)) :
    momentWeylSum 1 1 α = fourier 1 (α 0) := by sorry
/-! momentWeylSum_signed_value_test -/
example : momentWeylSum 1 2 (fun _ => ((1 / 2 : ℝ) : AddCircle (1 : ℝ))) = 0 := by sorry
/-! vinogradovMeanValue_ordered_test -/
example : vinogradovMeanValue 2 2 2 = 6 := by sorry
/-! vinogradovMeanValue_empty_pair_test -/
example (n : ℕ) : vinogradovMeanValue n 0 0 = 1 := by sorry
/-! vinogradovMeanValue_linear_count_test -/
example (n N : ℕ) (h : 1 ≤ n) :
    vinogradovMeanValue n 1 N = (Finset.Icc 1 N).card := by sorry
/-! vinogradovMeanValue_three_variables_test -/
example : vinogradovMeanValue 2 3 2 = 20 := by sorry

end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
open MeasureTheory

/-- ES.1/reduced-arc-indices. The zero centre has the single representative (0,1). -/
def reducedArcIndices (Q : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range (Q + 1)).product (Finset.range (Q + 1))).filter
    (fun aq => 1 ≤ aq.2 ∧ aq.1 < aq.2 ∧ Nat.Coprime aq.1 aq.2)
theorem mem_reducedArcIndices (Q a q : ℕ) :
    (a,q) ∈ reducedArcIndices Q ↔ 1 ≤ q ∧ q ≤ Q ∧ a < q ∧ Nat.Coprime a q := by sorry
theorem reducedArcIndices_zero : reducedArcIndices 0 = ∅ := by sorry
theorem reducedArcIndices_one : reducedArcIndices 1 = {(0,1)} := by sorry
theorem reducedArcIndices_mono (Q R : ℕ) (h : Q ≤ R) :
    reducedArcIndices Q ⊆ reducedArcIndices R := by sorry

/-- ES.1/major-arc. Native closed torus ball, with wraparound built in. -/
def majorArc (aq : ℕ × ℕ) (η : ℝ) : Set (AddCircle (1 : ℝ)) :=
  Metric.closedBall (((aq.1 : ℝ) / aq.2 : ℝ) : AddCircle (1 : ℝ)) η
theorem mem_majorArc (aq : ℕ × ℕ) (η : ℝ) (α : AddCircle (1 : ℝ)) :
    α ∈ majorArc aq η ↔ dist α (((aq.1 : ℝ) / aq.2 : ℝ) : AddCircle (1 : ℝ)) ≤ η := by sorry
theorem majorArc_lift (aq : ℕ × ℕ) (η x : ℝ) :
    (x : AddCircle (1 : ℝ)) ∈ majorArc aq η ↔
      ∃ z : ℤ, |x - (aq.1 : ℝ) / aq.2 - z| ≤ η := by sorry
theorem majorArc_negative (aq : ℕ × ℕ) (η : ℝ) (h : η < 0) :
    majorArc aq η = ∅ := by sorry
theorem majorArc_centre_mem (aq : ℕ × ℕ) (η : ℝ) (h : 0 ≤ η) :
    (((aq.1 : ℝ) / aq.2 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArc aq η := by sorry
theorem majorArc_measurable (aq : ℕ × ℕ) (η : ℝ) :
    IsClosed (majorArc aq η) ∧ MeasurableSet (majorArc aq η) := by sorry

/-- ES.1/major-arcs. No disjointness is assumed in this definition. -/
def majorArcs (Q : ℕ) (η : ℝ) : Set (AddCircle (1 : ℝ)) :=
  ⋃ aq ∈ reducedArcIndices Q, majorArc aq η
theorem mem_majorArcs (Q : ℕ) (η : ℝ) (α : AddCircle (1 : ℝ)) :
    α ∈ majorArcs Q η ↔ ∃ aq ∈ reducedArcIndices Q, α ∈ majorArc aq η := by sorry
theorem majorArcs_zero (η : ℝ) : majorArcs 0 η = ∅ := by sorry
theorem majorArcs_one (η : ℝ) : majorArcs 1 η = majorArc (0,1) η := by sorry
theorem majorArcs_mono (Q R : ℕ) (η θ : ℝ) (hq : Q ≤ R) (hr : η ≤ θ) :
    majorArcs Q η ⊆ majorArcs R θ := by sorry
theorem majorArcs_measurable (Q : ℕ) (η : ℝ) :
    IsClosed (majorArcs Q η) ∧ MeasurableSet (majorArcs Q η) := by sorry

/-- ES.1/minor-arcs. Closed major boundaries are not minor. -/
def minorArcs (Q : ℕ) (η : ℝ) : Set (AddCircle (1 : ℝ)) := (majorArcs Q η)ᶜ
theorem mem_minorArcs (Q : ℕ) (η : ℝ) (α : AddCircle (1 : ℝ)) :
    α ∈ minorArcs Q η ↔ ∀ aq ∈ reducedArcIndices Q,
      η < dist α (((aq.1 : ℝ) / aq.2 : ℝ) : AddCircle (1 : ℝ)) := by sorry
theorem minorArcs_zero (η : ℝ) : minorArcs 0 η = Set.univ := by sorry
theorem minorArcs_measurable (Q : ℕ) (η : ℝ) :
    IsOpen (minorArcs Q η) ∧ MeasurableSet (minorArcs Q η) := by sorry
theorem minorArcs_antitone (Q R : ℕ) (η θ : ℝ) (hq : Q ≤ R) (hr : η ≤ θ) :
    minorArcs R θ ⊆ minorArcs Q η := by sorry

theorem reduced_centre_separation (Q : ℕ) (u v : ℕ × ℕ)
    (hu : u ∈ reducedArcIndices Q) (hv : v ∈ reducedArcIndices Q) (hne : u ≠ v) :
    1 / ((u.2 : ℝ) * v.2) ≤
      dist (((u.1 : ℝ) / u.2 : ℝ) : AddCircle (1 : ℝ))
        (((v.1 : ℝ) / v.2 : ℝ) : AddCircle (1 : ℝ)) ∧
    1 / (Q : ℝ) ^ 2 ≤
      dist (((u.1 : ℝ) / u.2 : ℝ) : AddCircle (1 : ℝ))
        (((v.1 : ℝ) / v.2 : ℝ) : AddCircle (1 : ℝ)) := by sorry
theorem major_arcs_disjoint (Q : ℕ) (η : ℝ) (hq : 1 ≤ Q) (hη : 0 ≤ η)
    (hsize : 2 * η * (Q : ℝ)^2 < 1) :
    Set.Pairwise (↑(reducedArcIndices Q)) (fun u v => Disjoint (majorArc u η) (majorArc v η)) := by sorry
theorem major_minor_counting_partition (Q : ℕ) (η : ℝ) (hq : 1 ≤ Q)
    (hη : 0 ≤ η) (hsize : 2 * η * (Q : ℝ)^2 < 1)
    (F : AddCircle (1 : ℝ) → ℂ) (hF : Integrable F AddCircle.haarAddCircle) :
    (∫ α, F α ∂AddCircle.haarAddCircle) =
      (∑ aq ∈ reducedArcIndices Q, ∫ α in majorArc aq η, F α ∂AddCircle.haarAddCircle) +
        ∫ α in minorArcs Q η, F α ∂AddCircle.haarAddCircle := by sorry

/-! reducedArcIndices_zero_test -/
example : reducedArcIndices 0 = ∅ := by sorry
/-! reducedArcIndices_one_test -/
example : reducedArcIndices 1 = {(0,1)} := by sorry
/-! reducedArcIndices_three_test -/
example : reducedArcIndices 3 = {(0,1),(1,2),(1,3),(2,3)} := by sorry
/-! reducedArcIndices_nonreduced_test -/
example : (1,2) ∈ reducedArcIndices 4 ∧ (2,4) ∉ reducedArcIndices 4 := by sorry
/-! majorArc_wrap_test -/
example : ((19/20 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArc (0,1) (1/10) := by sorry
/-! majorArc_boundary_test -/
example : ((1/4 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArc (0,1) (1/4) := by sorry
/-! majorArc_negative_test -/
example : majorArc (1,2) (-1) = ∅ := by sorry
/-! majorArc_native_ball_test -/
example (u : ℕ × ℕ) (η : ℝ) : majorArc u η =
    Metric.closedBall (((u.1 : ℝ)/u.2 : ℝ) : AddCircle (1 : ℝ)) η := by sorry
/-! majorArcs_zero_test -/
example : majorArcs 0 1 = ∅ := by sorry
/-! majorArcs_one_test -/
example : ((19/20 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArcs 1 (1/10) := by sorry
/-! majorArcs_half_test -/
example : ((1/2 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArcs 2 0 := by sorry
/-! majorArcs_native_union_test -/
example (η : ℝ) : majorArcs 3 η =
    majorArc (0,1) η ∪ majorArc (1,2) η ∪ majorArc (1,3) η ∪ majorArc (2,3) η := by sorry
/-! minorArcs_zero_test -/
example : (0 : AddCircle (1 : ℝ)) ∈ minorArcs 0 1 := by sorry
/-! minorArcs_centre_test -/
example : (0 : AddCircle (1 : ℝ)) ∉ minorArcs 1 0 := by sorry
/-! minorArcs_interior_test -/
example : ((1/2 : ℝ) : AddCircle (1 : ℝ)) ∈ minorArcs 1 (1/10) := by sorry
/-! minorArcs_boundary_test -/
example : ((1/4 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArcs 1 (1/4) ∧
    ((1/4 : ℝ) : AddCircle (1 : ℝ)) ∉ minorArcs 1 (1/4) := by sorry
example : ((1/4 : ℝ) : AddCircle (1 : ℝ)) ∈ majorArc (0,1) (1/4) ∩
    majorArc (1,2) (1/4) := by sorry

end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
open MeasureTheory
open scoped ENNReal

/-- ES.2/moment-curve. Native Euclidean space, not the Pi sup norm. -/
def momentCurve (n : ℕ) (t : ℝ) : EuclideanSpace ℝ (Fin n) :=
  WithLp.toLp 2 (fun j => t ^ (j.val + 1))
theorem momentCurve_apply (n : ℕ) (t : ℝ) (j : Fin n) :
    momentCurve n t j = t ^ (j.val + 1) := by sorry
theorem momentCurve_zero (n : ℕ) : momentCurve n 0 = 0 := by sorry
theorem momentCurve_continuous (n : ℕ) : Continuous (momentCurve n) := by sorry
theorem momentCurve_first_injective (n : ℕ) (hn : 1 ≤ n) :
    Function.Injective (momentCurve n) := by sorry

/-- ES.2/decoupling-weight. Use withDensity and eLpNorm, not a replacement Lp space. -/
def decouplingWeight (n E : ℕ) (c : EuclideanSpace ℝ (Fin n)) (R : ℝ)
    (x : EuclideanSpace ℝ (Fin n)) : ℝ := ((1 + ‖x - c‖ / R) ^ E)⁻¹
theorem decouplingWeight_centre (n E : ℕ) (c : EuclideanSpace ℝ (Fin n))
    (R : ℝ) : decouplingWeight n E c R c = 1 := by sorry
theorem decouplingWeight_bounds (n E : ℕ) (c : EuclideanSpace ℝ (Fin n))
    (R : ℝ) (hR : 0 < R) (x : EuclideanSpace ℝ (Fin n)) :
    0 < decouplingWeight n E c R x ∧ decouplingWeight n E c R x ≤ 1 := by sorry
theorem decouplingWeight_continuous (n E : ℕ) (c : EuclideanSpace ℝ (Fin n))
    (R : ℝ) (hR : 0 < R) : Continuous (decouplingWeight n E c R) := by sorry
theorem decouplingWeight_translate (n E : ℕ) (c z x : EuclideanSpace ℝ (Fin n))
    (R : ℝ) : decouplingWeight n E (c + z) R (x + z) = decouplingWeight n E c R x := by sorry
theorem decouplingWeight_zero_exponent (n : ℕ) (c : EuclideanSpace ℝ (Fin n))
    (R : ℝ) (x : EuclideanSpace ℝ (Fin n)) : decouplingWeight n 0 c R x = 1 := by sorry

/-- ES.2/moment-extension. Hypotheses prevent junk values of the native Bochner integral. -/
def momentExtension (n : ℕ) (a b : ℝ) (g : ℝ → ℂ)
    (x : EuclideanSpace ℝ (Fin n)) : ℂ :=
  ∫ t in Set.Icc a b, g t * Complex.exp
    ((2 * Real.pi * (∑ j : Fin n, x j * t ^ (j.val + 1)) : ℝ) * Complex.I)
theorem momentExtension_empty (n : ℕ) (a b : ℝ) (h : b < a) (g : ℝ → ℂ) :
    momentExtension n a b g = 0 := by sorry
theorem momentExtension_zero_amplitude (n : ℕ) (a b : ℝ) :
    momentExtension n a b (fun _ => 0) = 0 := by sorry
theorem momentExtension_add (n : ℕ) (a b : ℝ) (g h : ℝ → ℂ)
    (hg : IntegrableOn g (Set.Icc a b)) (hh : IntegrableOn h (Set.Icc a b)) :
    momentExtension n a b (g + h) = momentExtension n a b g + momentExtension n a b h := by sorry
theorem momentExtension_smul (n : ℕ) (a b : ℝ) (g : ℝ → ℂ) (z : ℂ) :
    momentExtension n a b (z • g) = z • momentExtension n a b g := by sorry
theorem momentExtension_zero_spatial (n : ℕ) (a b : ℝ) (g : ℝ → ℂ) :
    momentExtension n a b g 0 = ∫ t in Set.Icc a b, g t := by sorry
theorem momentExtension_norm_bound (n : ℕ) (a b : ℝ) (g : ℝ → ℂ)
    (hg : IntegrableOn g (Set.Icc a b)) (x : EuclideanSpace ℝ (Fin n)) :
    ‖momentExtension n a b g x‖ ≤ ∫ t in Set.Icc a b, ‖g t‖ := by sorry
theorem momentExtension_continuous (n : ℕ) (a b : ℝ) (g : ℝ → ℂ)
    (hg : IntegrableOn g (Set.Icc a b)) : Continuous (momentExtension n a b g) := by sorry
theorem momentExtension_partition (n M : ℕ) (hM : 1 ≤ M) (g : ℝ → ℂ)
    (hg : IntegrableOn g (Set.Icc 0 1)) (x : EuclideanSpace ℝ (Fin n)) :
    momentExtension n 0 1 g x = ∑ i : Fin M,
      momentExtension n ((i.val : ℝ)/M) (((i.val : ℝ)+1)/M) g x := by sorry

/-- ES.2/weighted-extension-finite. Native MemLp; E>n is explicit. -/
theorem weighted_extension_finite (n E : ℕ) (hE : n < E)
    (c : EuclideanSpace ℝ (Fin n)) (R : ℝ) (hR : 0 < R) (p : ℝ) (hp : 1 ≤ p)
    (a b : ℝ) (g : ℝ → ℂ) (hg : IntegrableOn g (Set.Icc a b)) :
    MemLp (momentExtension n a b g) (ENNReal.ofReal p)
      (volume.withDensity (fun x => ENNReal.ofReal (decouplingWeight n E c R x))) := by sorry

/-- ES.2/critical-decoupling. The conclusion is not a field of an assumed record. -/
theorem critical_decoupling (n E : ℕ) (hn : 2 ≤ n) (hE : 100*n ≤ E)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (M : ℕ), 1 ≤ M →
      ∀ (c : EuclideanSpace ℝ (Fin n)) (g : ℝ → ℂ),
      IntegrableOn g (Set.Icc 0 1) →
      eLpNorm (momentExtension n 0 1 g) (n*(n+1) : ℝ≥0∞)
          (volume.withDensity (fun x => ENNReal.ofReal
            (decouplingWeight n E c ((M : ℝ)^n) x))) ≤
        ENNReal.ofReal (C * (M : ℝ)^ε) *
          (∑ i : Fin M, eLpNorm
            (momentExtension n ((i.val : ℝ)/M) (((i.val : ℝ)+1)/M) g)
            (n*(n+1) : ℝ≥0∞)
            (volume.withDensity (fun x => ENNReal.ofReal
              (decouplingWeight n E c ((M : ℝ)^n) x))) ^ (2 : ℕ)) ^ (1/2 : ℝ) := by sorry

/-- ES.2/discrete-restriction. Critical discrete moment with arbitrary complex coefficients. -/
theorem discrete_restriction_critical (n E : ℕ) (hn : 2 ≤ n) (hE : 100*n ≤ E)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (N : ℕ), 1 ≤ N →
      ∀ (t : Fin N → ℝ), (∀ i, (i.val : ℝ)/N < t i ∧ t i ≤ ((i.val : ℝ)+1)/N) →
      ∀ (a : Fin N → ℂ) (c : EuclideanSpace ℝ (Fin n)),
      eLpNorm (fun x : EuclideanSpace ℝ (Fin n) => ∑ i : Fin N,
        a i * Complex.exp ((2 * Real.pi *
          (∑ j : Fin n, x j * t i ^ (j.val + 1)) : ℝ) * Complex.I))
        (n*(n+1) : ℝ≥0∞)
        ((volume (Metric.ball c ((N : ℝ)^n)))⁻¹ •
          volume.withDensity (fun x => ENNReal.ofReal
            (decouplingWeight n E c ((N : ℝ)^n) x))) ≤
        ENNReal.ofReal (C * (N : ℝ)^ε * (∑ i : Fin N, ‖a i‖^2) ^ (1/2 : ℝ)) := by sorry

/-- ES.2/vinogradov-main-bound. Both terms; the constant is uniform in N. -/
theorem vinogradov_main_bound (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 2 ≤ N →
      (vinogradovMeanValue n s N : ℝ) ≤
        C * ((N : ℝ)^((s : ℝ)+ε) +
          (N : ℝ)^(2*(s : ℝ) - (n : ℝ)*(n+1)/2 + ε)) := by sorry

/-- ES.2/linear-mean-bound. Independent elementary degree-one route. -/
theorem linear_mean_bound (s N : ℕ) (hs : 1 ≤ s) :
    vinogradovMeanValue 1 s N ≤ N^(2*s-1) := by sorry

/-! momentCurve_quadratic_test -/
example : momentCurve 2 2 = WithLp.toLp 2 (fun j : Fin 2 => if j = 0 then 2 else 4) := by sorry
/-! momentCurve_zero_dimension_test -/
example : momentCurve 0 3 = 0 := by sorry
/-! momentCurve_linear_test -/
example (t : ℝ) : momentCurve 1 t 0 = t := by sorry
/-! decouplingWeight_value_test -/
example : decouplingWeight 1 2 0 1 (WithLp.toLp 2 (fun _ => 1)) = 1/4 := by sorry
/-! decouplingWeight_scale_test -/
example : decouplingWeight 1 2 0 2 (WithLp.toLp 2 (fun _ => 2)) = 1/4 := by sorry
/-! decouplingWeight_zero_exponent_test -/
example (x : EuclideanSpace ℝ (Fin 2)) : decouplingWeight 2 0 0 1 x = 1 := by sorry
/-! momentExtension_constant_test -/
example : momentExtension 1 0 1 (fun _ => 1) 0 = 1 := by sorry
/-! momentExtension_empty_test -/
example : momentExtension 2 1 0 (fun _ => 1) = 0 := by sorry
/-! momentExtension_negative_test -/
example : momentExtension 1 0 1 (fun _ => -1) 0 = -1 := by sorry
/-! momentExtension_zero_dimension_test -/
example (g : ℝ → ℂ) : momentExtension 0 0 1 g 0 = ∫ t in Set.Icc 0 1, g t := by sorry
example : vinogradovMeanValue 1 2 3 = 19 := by sorry

end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
open MeasureTheory

theorem polynomial_weyl_inequality (d : ℕ) (hd : 2 ≤ d) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (f : Polynomial ℝ), f.natDegree = d →
      ∀ (a : ℤ) (q N : ℕ), 1 ≤ q → 1 ≤ N → Nat.Coprime a.natAbs q →
      |f.leadingCoeff - (a : ℝ)/q| ≤ 1/(q : ℝ)^2 →
      ‖∑ m ∈ Finset.Icc 1 N, Complex.exp ((2 * Real.pi * f.eval (m : ℝ) : ℝ) * Complex.I)‖ ≤
        C * (N : ℝ)^(1+ε) *
          (1/(N : ℝ) + 1/(q : ℝ) + q/(N : ℝ)^d)^(1/((2 : ℝ)^(d-1))) := by sorry
theorem hua_mean_value (d v : ℕ) (hd : 2 ≤ d) (hv : 1 ≤ v) (hvd : v ≤ d)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 1 ≤ N →
      (∫ α : AddCircle (1 : ℝ),
        ‖∑ m ∈ Finset.Icc 1 N, fourier ((m : ℤ)^d) α‖^(2^v)
          ∂AddCircle.haarAddCircle) ≤
        C * (N : ℝ)^(((2^v : ℕ) : ℝ) - v + ε) := by sorry

example (x : ℝ) :
    ([2,3] : List ℝ).foldr (fun h F => fwdDiff h F) (fun y => y^3) x = 36*x+90 := by sorry
example :
    Fintype.card {h : Fin 2 → Fin 3 //
      6 * ∏ i : Fin 2, ((h i).val+1) = 12} = 2 := by sorry
end TauCeti.ExponentialSumsPlan

namespace TauCeti.ExponentialSumsPlan
open MeasureTheory
open scoped ComplexConjugate Topology

/-- ES.0/complete-power-sum. Complete residues, including zero; no character is redefined. -/
def completePowerSum (d q : ℕ) (a : ℤ) : ℂ :=
  ∑ x : Fin q, fourier (a * (x.val : ℤ)^d) (((1 : ℝ)/q : ℝ) : AddCircle (1 : ℝ))
theorem completePowerSum_zero_modulus (d : ℕ) (a : ℤ) : completePowerSum d 0 a = 0 := by sorry
theorem completePowerSum_one_modulus (d : ℕ) (a : ℤ) : completePowerSum d 1 a = 1 := by sorry
theorem completePowerSum_zero_frequency (d q : ℕ) : completePowerSum d q 0 = q := by sorry
theorem completePowerSum_conjugate (d q : ℕ) (a : ℤ) :
    conj (completePowerSum d q a) = completePowerSum d q (-a) := by sorry
theorem completePowerSum_residue_formula (d q : ℕ) (a : ℤ) :
    completePowerSum d q a = ∑ x : Fin q,
      Complex.exp ((2*Real.pi*(a : ℝ)*(x.val : ℝ)^d/q : ℝ)*Complex.I) := by sorry
theorem complete_power_bound (d : ℕ) (hd : 3 ≤ d) :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) (a : ℤ), 1 ≤ q → Nat.Coprime a.natAbs q →
      ‖completePowerSum d q a‖ ≤ C*(q : ℝ)^(1-1/(d : ℝ)) := by sorry

/-- ES.3/waring-series-coefficient. A(0)=0 and A(1)=1. -/
def waringSeriesCoeff (d s m q : ℕ) : ℂ :=
  ∑ a : Fin q, if Nat.Coprime a.val q then
    ((q : ℂ)⁻¹ * completePowerSum d q (a.val : ℤ))^s *
      fourier (-(a.val : ℤ)*(m : ℤ)) (((1 : ℝ)/q : ℝ) : AddCircle (1 : ℝ))
    else 0
theorem waringSeriesCoeff_zero (d s m : ℕ) : waringSeriesCoeff d s m 0 = 0 := by sorry
theorem waringSeriesCoeff_one (d s m : ℕ) : waringSeriesCoeff d s m 1 = 1 := by sorry
theorem waringSeriesCoeff_conjugate (d s m q : ℕ) :
    conj (waringSeriesCoeff d s m q) = waringSeriesCoeff d s m q := by sorry
theorem waringSeriesCoeff_periodic_target (d s m q : ℕ) :
    waringSeriesCoeff d s (m+q) q = waringSeriesCoeff d s m q := by sorry
theorem waring_series_multiplicative (d s m u v : ℕ) (hu : 1 ≤ u) (hv : 1 ≤ v)
    (hcop : Nat.Coprime u v) :
    waringSeriesCoeff d s m (u*v) = waringSeriesCoeff d s m u * waringSeriesCoeff d s m v := by sorry

/-- ES.3/waring-singular-series. Summability is required before interpreting this as an analytic sum. -/
def waringSingularSeries (d s m : ℕ) : ℂ := ∑' q : ℕ, waringSeriesCoeff d s m q
theorem waringSingularSeries_eq_tsum (d s m : ℕ) :
    waringSingularSeries d s m = ∑' q : ℕ, waringSeriesCoeff d s m q := by sorry
theorem waringSingularSeries_hasSum (d s m : ℕ) (h : Summable (waringSeriesCoeff d s m)) :
    HasSum (waringSeriesCoeff d s m) (waringSingularSeries d s m) := by sorry
theorem waringSingularSeries_real (d s m : ℕ) (h : Summable (waringSeriesCoeff d s m)) :
    (waringSingularSeries d s m).im = 0 := by sorry
theorem waring_series_absolute_convergence (d s m : ℕ) (hd : 3 ≤ d) (hs : 2*d+1 ≤ s) :
    Summable (fun q => ‖waringSeriesCoeff d s m q‖) := by sorry

/-- ES.3/waring-singular-integral. Full real frequency integral with the 2π character convention. -/
def waringSingularIntegral (d s : ℕ) : ℂ :=
  ∫ β : ℝ, (∫ t in Set.Icc (0 : ℝ) 1,
    Complex.exp ((2*Real.pi*β*t^d : ℝ)*Complex.I))^s *
      Complex.exp ((-2*Real.pi*β : ℝ)*Complex.I)
theorem waringSingularIntegral_eq_integral (d s : ℕ) :
    waringSingularIntegral d s =
      ∫ β : ℝ, (∫ t in Set.Icc (0 : ℝ) 1,
        Complex.exp ((2*Real.pi*β*t^d : ℝ)*Complex.I))^s *
          Complex.exp ((-2*Real.pi*β : ℝ)*Complex.I) := by sorry
theorem waringSingularIntegral_integrable (d s : ℕ) (hd : 1 ≤ d) (hs : d < s) :
    Integrable (fun β : ℝ => (∫ t in Set.Icc (0 : ℝ) 1,
      Complex.exp ((2*Real.pi*β*t^d : ℝ)*Complex.I))^s *
        Complex.exp ((-2*Real.pi*β : ℝ)*Complex.I)) := by sorry
theorem waring_singular_integral_evaluation (d s : ℕ) (hd : 1 ≤ d) (hs : d < s) :
    waringSingularIntegral d s =
      ((Real.Gamma (1+1/(d : ℝ)))^s/Real.Gamma ((s : ℝ)/d) : ℝ) := by sorry
theorem waringSingularIntegral_positive (d s : ℕ) (hd : 1 ≤ d) (hs : d < s) :
    0 < (waringSingularIntegral d s).re := by sorry

/-- ES.3/waring-congruence-count. Native finite quotient ring, not positive bounded tuples. -/
def waringCongruenceCount (d s m q : ℕ) [NeZero q] : ℕ :=
  Fintype.card {x : Fin s → ZMod q // (∑ i : Fin s, (x i)^d) = (m : ZMod q)}
theorem waringCongruenceCount_one (d s m : ℕ) : waringCongruenceCount d s m 1 = 1 := by sorry
theorem waringCongruenceCount_empty_tuple (d m q : ℕ) [NeZero q] :
    waringCongruenceCount d 0 m q = if (m : ZMod q) = 0 then 1 else 0 := by sorry
theorem waringCongruenceCount_linear_one (m q : ℕ) [NeZero q] :
    waringCongruenceCount 1 1 m q = 1 := by sorry
theorem waringCongruenceCount_periodic_target (d s m q : ℕ) [NeZero q] :
    waringCongruenceCount d s (m+q) q = waringCongruenceCount d s m q := by sorry

/-- ES.3/waring-local-factor. The convergent local series agrees with normalized solution densities. -/
def waringLocalFactor (d s m p : ℕ) : ℂ :=
  ∑' e : ℕ, waringSeriesCoeff d s m (p^e)
theorem waringLocalFactor_eq_tsum (d s m p : ℕ) :
    waringLocalFactor d s m p = ∑' e : ℕ, waringSeriesCoeff d s m (p^e) := by sorry
theorem waringLocalFactor_hasSum (d s m p : ℕ)
    (h : Summable (fun e => waringSeriesCoeff d s m (p^e))) :
    HasSum (fun e => waringSeriesCoeff d s m (p^e)) (waringLocalFactor d s m p) := by sorry
theorem waringLocalFactor_real (d s m p : ℕ)
    (h : Summable (fun e => waringSeriesCoeff d s m (p^e))) :
    (waringLocalFactor d s m p).im = 0 := by sorry
theorem waring_local_density_limit (d s m p : ℕ) [NeZero p]
    (hp : p.Prime) (hd : 3 ≤ d) (hs : 2*d+1 ≤ s) :
    Filter.Tendsto (fun e : ℕ =>
      (waringCongruenceCount d s m (p^e) : ℝ) /
        (p : ℝ)^((e : ℤ)*((s : ℤ)-1)))
      Filter.atTop (nhds (waringLocalFactor d s m p).re) := by sorry
theorem waring_series_euler_product (d s m : ℕ) (hd : 3 ≤ d) (hs : 2*d+1 ≤ s) :
    waringSingularSeries d s m =
      ∏' p : {p : ℕ // p.Prime}, waringLocalFactor d s m p.val := by sorry

/-! completePowerSum_zero_test -/
example : completePowerSum 3 0 1 = 0 := by sorry
/-! completePowerSum_one_test -/
example : completePowerSum 3 1 7 = 1 := by sorry
/-! completePowerSum_linear_test -/
example : completePowerSum 1 2 1 = 0 := by sorry
/-! completePowerSum_quadratic_test -/
example : completePowerSum 2 3 1 = Complex.I * Real.sqrt 3 := by sorry
/-! waringSeriesCoeff_zero_test -/
example : waringSeriesCoeff 3 7 1 0 = 0 := by sorry
/-! waringSeriesCoeff_one_test -/
example : waringSeriesCoeff 3 7 1 1 = 1 := by sorry
/-! waringSeriesCoeff_normalization_test -/
example : waringSeriesCoeff 2 2 1 3 = 1/3 := by sorry
/-! waringSeriesCoeff_negative_test -/
example : waringSeriesCoeff 2 2 0 3 = -2/3 := by sorry
/-! waringSingularSeries_linear_test -/
example (m : ℕ) : waringSingularSeries 1 2 m = 1 := by sorry
/-! waringSingularSeries_native_limit_test -/
example (m : ℕ) (h : Summable (waringSeriesCoeff 3 7 m)) :
    HasSum (waringSeriesCoeff 3 7 m) (waringSingularSeries 3 7 m) := by sorry
/-! waringSingularSeries_real_test -/
example (d s m : ℕ) (h : Summable (waringSeriesCoeff d s m)) :
    (waringSingularSeries d s m).im = 0 := by sorry
/-! waringSingularIntegral_linear_test -/
example : waringSingularIntegral 1 2 = 1 := by sorry
/-! waringSingularIntegral_three_test -/
example : waringSingularIntegral 1 3 = 1/2 := by sorry
/-! waringSingularIntegral_quadratic_test -/
example : waringSingularIntegral 2 3 = Real.pi/4 := by sorry
/-! waringCongruenceCount_one_test -/
example (m : ℕ) : waringCongruenceCount 3 7 m 1 = 1 := by sorry
/-! native_modulus_one_extra -/
example : waringCongruenceCount 3 7 1 1 = 1 := by sorry
/-! waringCongruenceCount_three_test -/
example : waringCongruenceCount 2 2 1 3 = 4 := by sorry
/-! waringCongruenceCount_empty_test -/
example : waringCongruenceCount 3 0 0 2 = 1 ∧ waringCongruenceCount 3 0 1 2 = 0 := by sorry
/-! waringCongruenceCount_native_linear_test -/
example (m q : ℕ) [NeZero q] : waringCongruenceCount 1 1 m q = 1 := by sorry
/-! waringLocalFactor_linear_test -/
example : waringLocalFactor 1 2 1 3 = 1 := by sorry
/-! waringLocalFactor_three_normalization_test -/
example : waringLocalFactor 2 2 1 3 = 4/3 := by sorry
/-! waringLocalFactor_native_limit_test -/
example (d s m : ℕ) (h : Summable (fun e => waringSeriesCoeff d s m (3^e))) :
    HasSum (fun e => waringSeriesCoeff d s m (3^e)) (waringLocalFactor d s m 3) := by sorry
/-! waringLocalFactor_real_test -/
example (d s m p : ℕ) (h : Summable (fun e => waringSeriesCoeff d s m (p^e))) :
    (waringLocalFactor d s m p).im = 0 := by sorry

end TauCeti.ExponentialSumsPlan
namespace TauCeti.ExponentialSumsPlan
open MeasureTheory
open scoped ComplexConjugate Topology

def powerWeylSum (d N : ℕ) (α : AddCircle (1 : ℝ)) : ℂ :=
  ∑ x ∈ Finset.Icc 1 N, fourier ((x : ℤ)^d) α
theorem powerWeylSum_eq_sum (d N : ℕ) (α : AddCircle (1 : ℝ)) :
    powerWeylSum d N α = ∑ x ∈ Finset.Icc 1 N, fourier ((x : ℤ)^d) α := by sorry
theorem powerWeylSum_zero_cutoff (d : ℕ) (α : AddCircle (1 : ℝ)) : powerWeylSum d 0 α = 0 := by sorry
theorem powerWeylSum_zero_phase (d N : ℕ) : powerWeylSum d N 0 = N := by sorry
theorem powerWeylSum_zero_degree (N : ℕ) (α : AddCircle (1 : ℝ)) :
    powerWeylSum 0 N α = (N : ℂ)*fourier 1 α := by sorry
theorem powerWeylSum_conjugate (d N : ℕ) (α : AddCircle (1 : ℝ)) :
    conj (powerWeylSum d N α) = powerWeylSum d N (-α) := by sorry

def waringPositiveCount (d s m : ℕ) : ℕ :=
  Fintype.card {x : Fin s → Fin m // (∑ i : Fin s, ((x i).val+1)^d) = m}
theorem waringPositiveCount_eq_card (d s m : ℕ) :
    waringPositiveCount d s m = Fintype.card
      {x : Fin s → Fin m // (∑ i : Fin s, ((x i).val+1)^d) = m} := by sorry
theorem waringPositiveCount_empty_tuple (d m : ℕ) :
    waringPositiveCount d 0 m = if m=0 then 1 else 0 := by sorry
theorem waringPositiveCount_zero_target (d s : ℕ) (hs : 0 < s) :
    waringPositiveCount d s 0 = 0 := by sorry
theorem waringPositiveCount_one_variable (d m : ℕ) (hd : 1 ≤ d) :
    waringPositiveCount d 1 m =
      @ite ℕ (∃ x : ℕ, 1 ≤ x ∧ x^d=m) (Classical.propDecidable _) 1 0 := by sorry
theorem waringPositiveCount_cutoff (d s m P : ℕ) (hd : 1 ≤ d) (hm : m ≤ P^d) :
    waringPositiveCount d s m = Fintype.card
      {x : Fin s → Fin P // (∑ i : Fin s, ((x i).val+1)^d) = m} := by sorry
theorem waring_counting_integral (d s m P : ℕ) (hd : 1 ≤ d) (hm : m ≤ P^d) :
    (∫ α : AddCircle (1 : ℝ), (powerWeylSum d P α)^s * fourier (-(m : ℤ)) α
      ∂AddCircle.haarAddCircle) = (waringPositiveCount d s m : ℂ) := by sorry

theorem waring_major_arc_approximation (d : ℕ) (hd : 1 ≤ d) :
    ∃ C : ℝ, 0 < C ∧ ∀ (P q : ℕ) (a : ℤ) (β : ℝ), 1 ≤ P → 1 ≤ q →
      ‖powerWeylSum d P ((((a : ℝ)/q+β : ℝ)) : AddCircle (1 : ℝ)) -
        (q : ℂ)⁻¹ * completePowerSum d q a *
          (∫ t in Set.Icc (0 : ℝ) (P : ℝ),
            Complex.exp ((2*Real.pi*β*t^d : ℝ)*Complex.I))‖ ≤
      C*(q : ℝ)*(1 + |β| * (P : ℝ)^d) := by sorry
theorem waring_classical_minor_arcs (d s : ℕ) (hd : 3 ≤ d) (hs : 2^d+1 ≤ s)
    (δ : ℝ) (hδ : 0 < δ) (hsmall : δ < 1/10) :
    ∃ C : ℝ, 0 < C ∧ ∀ P : ℕ, 2 ≤ P →
      (∫ α in minorArcs (Nat.floor ((P : ℝ)^δ)) ((P : ℝ)^(-(d : ℝ)+δ)),
        ‖powerWeylSum d P α‖^s ∂AddCircle.haarAddCircle) ≤
      C*(P : ℝ)^((s : ℝ)-d-δ/(2 : ℝ)^d) := by sorry
theorem waring_primitive_local_positivity (d s m p τ u : ℕ) [NeZero p]
    (hd : 3 ≤ d) (hs : 2*d+1 ≤ s) (hp : p.Prime)
    (hfactor : d=p^τ*u) (hu : Nat.Coprime u p)
    (hsol : ∃ x : Fin s → ZMod (p^(τ+if p=2 then 2 else 1)),
      (∑ i : Fin s, (x i)^d) = (m : ZMod (p^(τ+if p=2 then 2 else 1))) ∧
      ∃ i : Fin s, IsUnit (x i)) :
    (p : ℝ)^(-((τ+if p=2 then 2 else 1 : ℕ) : ℝ)*((s : ℝ)-1)) ≤
      (waringLocalFactor d s m p).re ∧ 0 < (waringLocalFactor d s m p).re := by sorry
theorem waring_uniform_series_positivity (d s : ℕ) (hd : 3 ≤ d) (hs : 2^d+1 ≤ s) :
    ∃ c : ℝ, 0 < c ∧ ∀ m : ℕ, c ≤ (waringSingularSeries d s m).re := by sorry
theorem waring_classical_asymptotic (d s : ℕ) (hd : 3 ≤ d) (hs : 2^d+1 ≤ s) :
    ∃ (σ C : ℝ) (M₀ : ℕ), 0 < σ ∧ 0 < C ∧ ∀ m : ℕ, M₀ ≤ m →
      |(waringPositiveCount d s m : ℝ) -
        (Real.Gamma (1+1/(d : ℝ)))^s/Real.Gamma ((s : ℝ)/d) *
          (waringSingularSeries d s m).re * (m : ℝ)^((s : ℝ)/d-1)| ≤
      C*(m : ℝ)^((s : ℝ)/d-1-σ) := by sorry
theorem waring_eventual_representation (d s : ℕ) (hd : 3 ≤ d) (hs : 2^d+1 ≤ s) :
    ∃ M₀ : ℕ, ∀ m : ℕ, M₀ ≤ m → ∃ x : Fin s → ℕ,
      (∀ i, 1 ≤ x i) ∧ (∑ i : Fin s, (x i)^d) = m := by sorry

/-- powerWeylSum_empty_test -/
example : powerWeylSum 3 0 0 = 0 := by sorry
/-- powerWeylSum_linear_test -/
example : powerWeylSum 1 2 ((1/2 : ℝ) : AddCircle (1 : ℝ)) = 0 := by sorry
/-- powerWeylSum_zero_phase_test -/
example : powerWeylSum 3 4 0 = 4 := by sorry
/-- powerWeylSum_weighted_test -/
example (α : AddCircle (1 : ℝ)) : powerWeylSum 2 3 α =
    weightedTorusSum 1 (Finset.Icc 1 3) (fun x (_ : Fin 1) => (x : ℤ)^2)
      (fun _ => 1) (fun _ => α) := by sorry
/-- waringPositiveCount_linear_test -/
example : waringPositiveCount 1 2 4 = 3 := by sorry
/-- waringPositiveCount_squares_test -/
example : waringPositiveCount 2 2 5 = 2 := by sorry
/-- waringPositiveCount_empty_test -/
example : waringPositiveCount 3 0 0 = 1 ∧ waringPositiveCount 3 0 1 = 0 := by sorry
/-- waringPositiveCount_positive_test -/
example : waringPositiveCount 1 2 2 = 1 := by sorry

end TauCeti.ExponentialSumsPlan
namespace TauCeti.ExponentialSumsPlan
open MvPolynomial

def boundedProjectivePointCount {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (B : Fin n → ℕ) : ℕ :=
  Fintype.card {k : (i : Fin n) → Fin (2*B i+1) //
    MvPolynomial.eval (fun i => ((k i).val : ℤ)-(B i : ℤ)) F=0 ∧
    Finset.univ.gcd (fun i => (((k i).val : ℤ)-(B i : ℤ)).natAbs)=1 ∧
    ∃ i : Fin n, 0 < ((k i).val : ℤ)-(B i : ℤ) ∧
      ∀ j : Fin n, j < i → ((k j).val : ℤ)-(B j : ℤ)=0}
theorem boundedProjectivePointCount_eq_card {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (B : Fin n → ℕ) :
    boundedProjectivePointCount F B = Fintype.card
      {k : (i : Fin n) → Fin (2*B i+1) //
        MvPolynomial.eval (fun i => ((k i).val : ℤ)-(B i : ℤ)) F=0 ∧
        Finset.univ.gcd (fun i => (((k i).val : ℤ)-(B i : ℤ)).natAbs)=1 ∧
        ∃ i : Fin n, 0 < ((k i).val : ℤ)-(B i : ℤ) ∧
          ∀ j : Fin n, j < i → ((k j).val : ℤ)-(B j : ℤ)=0} := by sorry
theorem boundedProjectivePointCount_zero_box {n : ℕ} (F : MvPolynomial (Fin n) ℤ) :
    boundedProjectivePointCount F (fun _ => 0)=0 := by sorry
theorem boundedProjectivePointCount_one_polynomial (n : ℕ) (B : Fin n → ℕ) :
    boundedProjectivePointCount (1 : MvPolynomial (Fin n) ℤ) B=0 := by sorry
theorem boundedProjectivePointCount_scale {n : ℕ} (F : MvPolynomial (Fin n) ℤ)
    (B : Fin n → ℕ) (a : ℤ) (ha : a ≠ 0) :
    boundedProjectivePointCount (MvPolynomial.C a*F) B=boundedProjectivePointCount F B := by sorry
theorem boundedProjectivePointCount_mono {n : ℕ} (F : MvPolynomial (Fin n) ℤ)
    (B R : Fin n → ℕ) (h : ∀ i, B i ≤ R i) :
    boundedProjectivePointCount F B ≤ boundedProjectivePointCount F R := by sorry
theorem ternary_coefficient_height_alternative (d : ℕ) (hd : 1 ≤ d) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : MvPolynomial (Fin 3) ℤ) (B : ℕ), 1 ≤ B →
      F.IsHomogeneous d → Irreducible (MvPolynomial.map (Int.castRingHom ℚ) F) →
      F.support.gcd (fun e => (F.coeff e).natAbs)=1 →
      boundedProjectivePointCount F (fun _ => B) ≤ d^2 ∨
      ((F.support.sup (fun e => (F.coeff e).natAbs) : ℕ) : ℝ) ≤
        C*(B : ℝ)^(d*(d+1)*(d+2)/2) := by sorry
theorem determinant_auxiliary_cover (n d : ℕ) (hn : 3 ≤ n) (hd : 2 ≤ d)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ (C : ℝ) (D : ℕ), 0 < C ∧ ∀ (F : MvPolynomial (Fin n) ℤ) (B : Fin n → ℕ),
      (∀ i, 1 ≤ B i) → F.IsHomogeneous d →
      Irreducible (MvPolynomial.map (Int.castRingHom ℚ) F) →
      2 ≤ F.support.sup (fun e => (F.coeff e).natAbs) →
      ∃ G : Finset (MvPolynomial (Fin n) ℤ),
        (∀ g ∈ G, g.totalDegree ≤ D ∧
          ¬MvPolynomial.map (Int.castRingHom ℚ) F ∣ MvPolynomial.map (Int.castRingHom ℚ) g ∧
          ∃ e : ℕ, g.IsHomogeneous e) ∧
        (∀ x : Fin n → ℤ, (∀ i, (x i).natAbs ≤ B i) → MvPolynomial.eval x F=0 →
          Finset.univ.gcd (fun i => (x i).natAbs)=1 →
          (∃ i : Fin n, 0 < x i ∧ ∀ j : Fin n, j < i → x j=0) →
          ∃ g ∈ G, MvPolynomial.eval x g=0) ∧
        (G.card : ℝ) ≤ C*
          (((∏ i : Fin n, (B i : ℝ))^d) /
            ((F.support.sup (fun e => ∏ i : Fin n, B i^(e i)) : ℕ) : ℝ))^
              ((d : ℝ)^(-((n : ℝ)-1)/((n : ℝ)-2))) *
          (∏ i : Fin n, (B i : ℝ))^ε *
          (Real.log ((F.support.sup (fun e => (F.coeff e).natAbs) : ℕ) : ℝ))^(2*n-3) := by sorry
theorem uniform_ternary_curve_bound (d : ℕ) (hd : 2 ≤ d) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : MvPolynomial (Fin 3) ℤ) (B : Fin 3 → ℕ),
      (∀ i, 1 ≤ B i) → F.IsHomogeneous d →
      Irreducible (MvPolynomial.map (Int.castRingHom ℚ) F) →
      (boundedProjectivePointCount F B : ℝ) ≤
        C*((F.support.sup (fun e => ∏ i : Fin 3, B i^(e i)) : ℕ) : ℝ)^(-1/(d : ℝ)^2)*
          (∏ i : Fin 3, (B i : ℝ))^(1/(d : ℝ)+ε) := by sorry

/-- boundedProjectivePointCount_line_test -/
example : boundedProjectivePointCount (MvPolynomial.X (0 : Fin 3)) (fun _ => 1)=4 := by sorry
/-- boundedProjectivePointCount_zero_box_test -/
example (F : MvPolynomial (Fin 3) ℤ) : boundedProjectivePointCount F (fun _ => 0)=0 := by sorry
/-- boundedProjectivePointCount_conic_test -/
example : boundedProjectivePointCount
    (MvPolynomial.X (0 : Fin 3)*MvPolynomial.X (2 : Fin 3)-(MvPolynomial.X (1 : Fin 3))^2)
      (fun _ => 1)=4 := by sorry
/-- boundedProjectivePointCount_sign_test -/
example : boundedProjectivePointCount (0 : MvPolynomial (Fin 3) ℤ) (fun _ => 1)=13 := by sorry

end TauCeti.ExponentialSumsPlan
