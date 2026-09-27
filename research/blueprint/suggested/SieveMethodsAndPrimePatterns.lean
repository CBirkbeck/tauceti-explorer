/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex (codex-a71f92)
-/
import Mathlib.NumberTheory.SelbergSieve
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Nat.Squarefree
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Data.Int.Interval
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Data.Finset.Lattice.Fold

/-!
# Suggested finite sieve and Gram-row signatures

This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive; these statements suggest Lean names and signatures for contributors
and reviewers. Proof placeholders are not implementation evidence.

Reuse the pinned BoundingSieve and SelbergSieve carriers, their weighted sums,
multiplicative density and remainder. No competing sieve or bound predicate is defined.
The finite Gram results reuse the existing inner-product and matrix APIs; the
inner product is conjugate-linear in its first argument. No completeness is assumed.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

noncomputable section
open scoped BigOperators ArithmeticFunction.Moebius

namespace BoundingSieve

/-- SV.0/weighted-divisor-interchange. Arbitrary real coefficient signs are allowed. -/
theorem sum_multSum_eq_sum_gcd_divisors (s : BoundingSieve) (c : ℕ → ℝ) :
    (∑ d ∈ s.prodPrimes.divisors, c d * s.multSum d) =
      ∑ n ∈ s.support, s.weights n *
        ∑ d ∈ (Nat.gcd s.prodPrimes n).divisors, c d := by
  sorry

/-- SV.0/legendre-identity. Zero may lie in support; prodPrimes is nonzero. -/
theorem siftedSum_eq_moebius_multSum (s : BoundingSieve) :
    s.siftedSum = ∑ d ∈ s.prodPrimes.divisors, (μ d : ℝ) * s.multSum d := by
  sorry

/-- SV.0/legendre-main-remainder. The sign of each remainder is retained. -/
theorem siftedSum_eq_eulerProduct_add_rem (s : BoundingSieve) :
    s.siftedSum =
      s.totalMass * (∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p)) +
        ∑ d ∈ s.prodPrimes.divisors, (μ d : ℝ) * s.rem d := by
  sorry

/-- SV.0/legendre-error. Includes d=1; totalMass need not equal multSum 1. -/
theorem abs_siftedSum_sub_eulerProduct_le (s : BoundingSieve) :
    |s.siftedSum - s.totalMass * (∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p))| ≤
      ∑ d ∈ s.prodPrimes.divisors, |s.rem d| := by
  sorry

/-- SV.0/lower-sieve-sum. Only divisors of this sieve's prime product are tested. -/
theorem sum_multSum_le_siftedSum_of_divisor_lower (s : BoundingSieve) (c : ℕ → ℝ)
    (hc : ∀ r, r ∣ s.prodPrimes → (∑ d ∈ r.divisors, c d) ≤
      if r = 1 then (1 : ℝ) else 0) :
    (∑ d ∈ s.prodPrimes.divisors, c d * s.multSum d) ≤ s.siftedSum := by
  sorry

/-- SV.0/lower-sieve-main-error. No new Prop wrapper for the coefficient inequality. -/
theorem mainSum_sub_errSum_le_siftedSum (s : BoundingSieve) (c : ℕ → ℝ)
    (hc : ∀ r, r ∣ s.prodPrimes → (∑ d ∈ r.divisors, c d) ≤
      if r = 1 then (1 : ℝ) else 0) :
    s.totalMass * s.mainSum c - s.errSum c ≤ s.siftedSum := by
  sorry

/-- SV.0/truncated-coefficient-error. A support parameter alone is not distribution control. -/
theorem errSum_le_truncated_remSum (s : BoundingSieve) (c : ℕ → ℝ) (D : ℕ) (C : ℝ)
    (hC : 0 ≤ C)
    (hsupp : ∀ d ∈ s.prodPrimes.divisors, D < d → c d = 0)
    (hbound : ∀ d ∈ s.prodPrimes.divisors, d ≤ D → |c d| ≤ C) :
    s.errSum c ≤ C * ∑ d ∈ s.prodPrimes.divisors with d ≤ D, |s.rem d| := by
  sorry

/-- SV.0/first-order-lower-sieve. The first Bonferroni bound may be negative. -/
theorem multSum_one_sub_prime_multSum_le_siftedSum (s : BoundingSieve) :
    s.multSum 1 - (∑ p ∈ s.prodPrimes.primeFactors, s.multSum p) ≤ s.siftedSum := by
  sorry

/-! ## Discriminating finite-sieve examples -/

/-- empty_support -/
example (s : BoundingSieve) (h : s.support = ∅) : s.siftedSum = 0 := by
  sorry

/-- no_sifting_primes: includes any weight at zero. -/
example (s : BoundingSieve) (h : s.prodPrimes = 1) :
    s.siftedSum = ∑ n ∈ s.support, s.weights n := by
  sorry

/-- ten_integers_sifted_by_two_and_three -/
example (s : BoundingSieve) (hA : s.support = Finset.Icc 1 10)
    (hP : s.prodPrimes = 6) (hw : ∀ n ∈ s.support, s.weights n = 1) :
    s.siftedSum = 3 := by
  sorry

/-- zero_is_sifted_out: gcd(6,0)=6, not 1. -/
example (s : BoundingSieve) (hA : s.support = {0, 1, 2, 3, 6})
    (hP : s.prodPrimes = 6) (hw : ∀ n ∈ s.support, s.weights n = 1) :
    s.siftedSum = 1 := by
  sorry

/-- two_prime_inclusion_exclusion: the overlap is added back. -/
example (s : BoundingSieve) (hP : s.prodPrimes = 6) :
    s.siftedSum = s.multSum 1 - s.multSum 2 - s.multSum 3 + s.multSum 6 := by
  sorry

/-- mass_normalization_remainder: X is only an approximation. -/
example (s : BoundingSieve) (hX : s.totalMass = 7) (hA : s.multSum 1 = 10) :
    s.rem 1 = 3 := by
  sorry

/-- first_order_can_be_negative: the sample point 6 is excluded twice. -/
example (s : BoundingSieve) (hA : s.support = {6}) (hP : s.prodPrimes = 6)
    (hw : s.weights 6 = 1) :
    s.multSum 1 - (∑ p ∈ s.prodPrimes.primeFactors, s.multSum p) = -1 ∧
      s.siftedSum = 0 := by
  sorry

/-- level_zero_has_no_divisors: every positive-divisor coefficient vanishes. -/
example (s : BoundingSieve) (c : ℕ → ℝ)
    (hc : ∀ d ∈ s.prodPrimes.divisors, c d = 0) : s.errSum c = 0 := by
  sorry

/-- level_one_retains_mass_error -/
example (s : BoundingSieve) :
    s.errSum (fun d => if d = 1 then 1 else 0) = |s.rem 1| := by
  sorry

/-- real_coefficient_signs: the absolute error cannot cancel two remainders. -/
example (s : BoundingSieve) (hP : s.prodPrimes = 6)
    (h2 : s.rem 2 = 1) (h3 : s.rem 3 = 1) :
    s.errSum (fun d => if d = 2 then 1 else if d = 3 then -1 else 0) = 2 := by
  sorry

/-! ## Finite-family and general-residue bridges
These construct the existing carrier, not a new data type. -/

/-- SV.0/finite-family-sieve. Keep the template's prime product, mass and density;
replace its population by weighted fibers of f over A. -/
def ofFiniteFamily {α : Type*} (s : BoundingSieve) (A : Finset α)
    (f : α → ℕ) (w : α → ℝ) (hw : ∀ a ∈ A, 0 ≤ w a) : BoundingSieve := by sorry

section FamilyAPI
variable {α : Type*} (s : BoundingSieve) (A : Finset α)
  (f : α → ℕ) (w : α → ℝ) (hw : ∀ a ∈ A, 0 ≤ w a)

theorem ofFiniteFamily_support : (s.ofFiniteFamily A f w hw).support = A.image f := by sorry
theorem ofFiniteFamily_weights (n : ℕ) :
    (s.ofFiniteFamily A f w hw).weights n = ∑ a ∈ A with f a = n, w a := by sorry
theorem ofFiniteFamily_prodPrimes :
    (s.ofFiniteFamily A f w hw).prodPrimes = s.prodPrimes := by sorry
theorem ofFiniteFamily_totalMass :
    (s.ofFiniteFamily A f w hw).totalMass = s.totalMass := by sorry
theorem ofFiniteFamily_nu : (s.ofFiniteFamily A f w hw).nu = s.nu := by sorry
theorem ofFiniteFamily_weights_of_not_mem (n : ℕ) (hn : n ∉ A.image f) :
    (s.ofFiniteFamily A f w hw).weights n = 0 := by sorry

/-- SV.0/finite-family-multsum. Promoted from the constructor API for downstream use. -/
theorem ofFiniteFamily_multSum (d : ℕ) :
    (s.ofFiniteFamily A f w hw).multSum d = ∑ a ∈ A with d ∣ f a, w a := by sorry
/-- SV.0/finite-family-siftedsum. -/
theorem ofFiniteFamily_siftedSum :
    (s.ofFiniteFamily A f w hw).siftedSum =
      ∑ a ∈ A with Nat.Coprime s.prodPrimes (f a), w a := by sorry
end FamilyAPI

/-- Agreement on the existing observable; off-support weights are not asserted equal. -/
theorem ofFiniteFamily_id_siftedSum (s : BoundingSieve) :
    (s.ofFiniteFamily s.support id s.weights (fun a _ => s.weights_nonneg a)).siftedSum =
      s.siftedSum := by sorry

/-- SV.0/prime-dvd-residue-label. No new definition for this finite prime product. -/
theorem prime_dvd_residueLabel_iff (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (a : ℤ) {p : ℕ} (hp : p ∈ Q) :
    p ∣ (∏ q ∈ Q.filter (fun q => (a : ZMod q) ∈ Ω q), q) ↔
      (a : ZMod p) ∈ Ω p := by sorry

/-- SV.0/divisor-dvd-residue-label. The squarefree-divisor hypothesis is essential. -/
theorem dvd_residueLabel_iff (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (a : ℤ) (d : ℕ)
    (hd : d ∣ ∏ p ∈ Q, p) :
    d ∣ (∏ p ∈ Q.filter (fun p => (a : ZMod p) ∈ Ω p), p) ↔
      ∀ p ∈ d.primeFactors, (a : ZMod p) ∈ Ω p := by sorry

/-- SV.0/residue-label-survival. -/
theorem coprime_residueLabel_iff (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (a : ℤ) :
    Nat.Coprime (∏ p ∈ Q, p)
      (∏ p ∈ Q.filter (fun p => (a : ZMod p) ∈ Ω p), p) ↔
      ∀ p ∈ Q, (a : ZMod p) ∉ Ω p := by sorry

/-- SV.0/residue-class-sieve. Empty local classes are removed before building the
carrier's prime product; full local classes are handled by the obstruction theorem. -/
def ofResidueClasses {α : Type*} (A : Finset α) (x : α → ℤ)
    (w : α → ℝ) (hw : ∀ a ∈ A, 0 ≤ w a)
    (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (hΩ : ∀ p ∈ Q, (Ω p).card < p)
    (X : ℝ) : BoundingSieve := by sorry

section ResidueAPI
variable {α : Type*} (A : Finset α) (x : α → ℤ)
  (w : α → ℝ) (hw : ∀ a ∈ A, 0 ≤ w a)
  (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
  (Ω : (p : ℕ) → Finset (ZMod p)) (hΩ : ∀ p ∈ Q, (Ω p).card < p) (X : ℝ)

theorem ofResidueClasses_prodPrimes :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).prodPrimes =
      ∏ p ∈ Q.filter (fun p => (Ω p).Nonempty), p := by sorry
theorem ofResidueClasses_nu :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).nu =
      ArithmeticFunction.prodPrimeFactors (fun p => ((Ω p).card : ℝ) / p) := by sorry
theorem ofResidueClasses_totalMass :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).totalMass = X := by sorry
theorem ofResidueClasses_support :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).support =
      A.image (fun a => ∏ p ∈ Q.filter (fun p => (x a : ZMod p) ∈ Ω p), p) := by sorry
theorem ofResidueClasses_weights (n : ℕ) :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).weights n =
      ∑ a ∈ A with (∏ p ∈ Q.filter (fun p => (x a : ZMod p) ∈ Ω p), p) = n,
        w a := by sorry
theorem ofResidueClasses_nu_prime (p : ℕ) (hp : p.Prime) :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).nu p = ((Ω p).card : ℝ) / p := by sorry
theorem ofResidueClasses_inactive_prime (p : ℕ) (hp : p ∈ Q) (hempty : Ω p = ∅) :
    ¬ p ∣ (ofResidueClasses A x w hw Q hQ Ω hΩ X).prodPrimes := by sorry

/-- SV.0/residue-class-multsum. Promoted from the constructor API. -/
theorem ofResidueClasses_multSum (d : ℕ)
    (hd : d ∣ (ofResidueClasses A x w hw Q hQ Ω hΩ X).prodPrimes) :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).multSum d =
      ∑ a ∈ A with ∀ p ∈ d.primeFactors, (x a : ZMod p) ∈ Ω p, w a := by sorry
/-- SV.0/residue-class-siftedsum. -/
theorem ofResidueClasses_siftedSum :
    (ofResidueClasses A x w hw Q hQ Ω hΩ X).siftedSum =
      ∑ a ∈ A with ∀ p ∈ Q, (x a : ZMod p) ∉ Ω p, w a := by sorry
/-- SV.0/residue-euler-product. Zero densities contribute factors one. -/
theorem ofResidueClasses_eulerProduct :
    (∏ p ∈ (ofResidueClasses A x w hw Q hQ Ω hΩ X).prodPrimes.primeFactors,
      (1 - (ofResidueClasses A x w hw Q hQ Ω hΩ X).nu p)) =
        ∏ p ∈ Q, (1 - ((Ω p).card : ℝ) / p) := by sorry

/-- SV.0/residue-legendre-error. No analytic size/distribution hypothesis is inferred. -/
theorem residueClass_legendre_error :
    |(∑ a ∈ A with ∀ p ∈ Q, (x a : ZMod p) ∉ Ω p, w a) -
      X * (∏ p ∈ Q, (1 - ((Ω p).card : ℝ) / p))| ≤
        ∑ d ∈ (∏ p ∈ Q.filter (fun p => (Ω p).Nonempty), p).divisors,
          |(∑ a ∈ A with ∀ p ∈ d.primeFactors, (x a : ZMod p) ∈ Ω p, w a) -
            X * (∏ p ∈ d.primeFactors, (((Ω p).card : ℝ) / p))| := by sorry
end ResidueAPI

/-- SV.0/full-residue-obstruction. Weights may have either sign for this zero result. -/
theorem full_residueClass_siftedSum_eq_zero {α : Type*} (A : Finset α) (x : α → ℤ)
    (w : α → ℝ) (Q : Finset ℕ) (hQ : ∀ p ∈ Q, p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (p : ℕ) (hp : p ∈ Q)
    (hfull : (Ω p).card = p) :
    (∑ a ∈ A with ∀ q ∈ Q, (x a : ZMod q) ∉ Ω q, w a) = 0 := by sorry

/-! ## Construction unit tests -/

/-- family_collision_weights -/
example (s : BoundingSieve)
    (hw : ∀ n ∈ ({0,1} : Finset ℕ), 0 ≤ (if n = 0 then (2 : ℝ) else 3)) :
    (s.ofFiniteFamily {0,1} (fun _ => 7) (fun n => if n = 0 then 2 else 3) hw).weights 7 = 5 := by sorry
/-- family_empty_population -/
example (s : BoundingSieve) (f : ℕ → ℕ) (w : ℕ → ℝ)
    (hw : ∀ n ∈ (∅ : Finset ℕ), 0 ≤ w n) :
    (s.ofFiniteFamily ∅ f w hw).siftedSum = 0 := by sorry
/-- family_identity_agreement -/
example (s : BoundingSieve) :
    (s.ofFiniteFamily s.support id s.weights (fun n _ => s.weights_nonneg n)).multSum 1 =
      s.multSum 1 := by sorry
/-- family_polynomial_multiplicity: the image has 4 values but 7 parameters. -/
example (s : BoundingSieve) :
    (s.ofFiniteFamily (Finset.Icc 2 8) (fun n => n * (10 - n)) (fun _ => 1)
      (fun _ _ => zero_le_one)).multSum 1 = 7 ∧
    ((Finset.Icc (2 : ℕ) 8).image (fun n => n * (10 - n))).card = 4 := by sorry

/-- residue_empty_prime_set -/
example (hQ : ∀ p ∈ (∅ : Finset ℕ), p.Prime)
    (Ω : (p : ℕ) → Finset (ZMod p)) (hΩ : ∀ p ∈ (∅ : Finset ℕ), (Ω p).card < p) :
    (ofResidueClasses ({-1,0,1} : Finset ℤ) id (fun _ => 2) (fun _ _ => zero_le_two)
      ∅ hQ Ω hΩ 6).siftedSum = 6 := by sorry
/-- residue_all_zero_densities -/
example (hQ : ∀ p ∈ ({2,3} : Finset ℕ), p.Prime)
    (hΩ : ∀ p ∈ ({2,3} : Finset ℕ), (∅ : Finset (ZMod p)).card < p) :
    (ofResidueClasses ({-1,0,1} : Finset ℤ) id (fun _ => 2) (fun _ _ => zero_le_two)
      {2,3} hQ (fun _ => ∅) hΩ 6).prodPrimes = 1 ∧
    (ofResidueClasses ({-1,0,1} : Finset ℤ) id (fun _ => 2) (fun _ _ => zero_le_two)
      {2,3} hQ (fun _ => ∅) hΩ 6).siftedSum = 6 := by sorry
/-- residue_nonzero_bad_class: zero survives while one is removed. -/
example (hQ : ∀ p ∈ ({2} : Finset ℕ), p.Prime)
    (hw : ∀ a ∈ ({0,1} : Finset ℤ), 0 ≤ (if a = 0 then (2 : ℝ) else 3))
    (hΩ : ∀ p ∈ ({2} : Finset ℕ), ({1} : Finset (ZMod p)).card < p) :
    (ofResidueClasses ({0,1} : Finset ℤ) id (fun a => if a = 0 then 2 else 3) hw
      {2} hQ (fun _ => {1}) hΩ 5).siftedSum = 2 := by sorry
/-- residue_mixed_empty_negative -/
example (hQ : ∀ p ∈ ({2,3} : Finset ℕ), p.Prime)
    (hΩ : ∀ p ∈ ({2,3} : Finset ℕ),
      (if p = 2 then (∅ : Finset (ZMod p)) else {1}).card < p) :
    (ofResidueClasses (Finset.Icc (-2 : ℤ) 3) id (fun _ => 1) (fun _ _ => zero_le_one)
      {2,3} hQ (fun p => if p = 2 then ∅ else {1}) hΩ 6).prodPrimes = 3 ∧
    (ofResidueClasses (Finset.Icc (-2 : ℤ) 3) id (fun _ => 1) (fun _ _ => zero_le_one)
      {2,3} hQ (fun p => if p = 2 then ∅ else {1}) hΩ 6).siftedSum = 4 := by sorry
/-- residue_radical_density: multiplicative, not completely multiplicative. -/
example (hQ : ∀ p ∈ ({2} : Finset ℕ), p.Prime)
    (hΩ : ∀ p ∈ ({2} : Finset ℕ), ({0} : Finset (ZMod p)).card < p) :
    (ofResidueClasses (∅ : Finset ℤ) id (fun _ => 1) (fun _ _ => zero_le_one)
      {2} hQ (fun _ => {0}) hΩ 0).nu 4 = (1 / 2 : ℝ) := by sorry
/-- residue_full_class_obstruction -/
example : (∑ a ∈ (Finset.Icc (-2 : ℤ) 3).filter
    (fun a : ℤ => (a : ZMod 3) ∉ (Finset.univ : Finset (ZMod 3))), (1 : ℝ)) = 0 := by sorry
/-- residue_label_has_no_linear_cutoff -/
example : (∏ p ∈ ({3,5,7,11} : Finset ℕ).filter
    (fun p => (33 : ZMod p) ∈ ({0,-2} : Finset (ZMod p))), p) = 1155 := by sorry

end BoundingSieve

namespace SieveGram

open scoped InnerProductSpace
variable {𝕜 E ι : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
  [InnerProductSpace 𝕜 E] [Fintype ι]

theorem gramRow_eq_zero_iff (y : ι → E) (i : ι) :
    (∑ j, ‖⟪y i, y j⟫_𝕜‖) = 0 ↔ y i = 0 := by sorry

theorem norm_sum_smul_sq_le_gramRows (y : ι → E) (c : ι → 𝕜) :
    ‖∑ i, c i • y i‖ ^ 2 ≤ ∑ i, ‖c i‖ ^ 2 * (∑ j, ‖⟪y i, y j⟫_𝕜‖) := by sorry

theorem selberg_defect_le (y : ι → E) (x : E) :
    ‖x - ∑ i, (⟪y i, x⟫_𝕜 / ((∑ j, ‖⟪y i, y j⟫_𝕜‖ : ℝ) : 𝕜)) • y i‖ ^ 2 ≤
      ‖x‖ ^ 2 - ∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2 / (∑ j, ‖⟪y i, y j⟫_𝕜‖) := by sorry

theorem selberg_weighted_inner (y : ι → E) (x : E) :
    (∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2 / (∑ j, ‖⟪y i, y j⟫_𝕜‖)) ≤ ‖x‖ ^ 2 := by sorry

theorem bombieri_of_gramRow_le (y : ι → E) (x : E) (B : ℝ) (hB : 0 ≤ B)
    (hrow : ∀ i, (∑ j, ‖⟪y i, y j⟫_𝕜‖) ≤ B) :
    (∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2) ≤ ‖x‖ ^ 2 * B := by sorry

theorem bombieri_selberg [Nonempty ι] (y : ι → E) (x : E) :
    (∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2) ≤ ‖x‖ ^ 2 *
      Finset.univ.sup' Finset.univ_nonempty (fun i => ∑ j, ‖⟪y i, y j⟫_𝕜‖) := by sorry

theorem bombieri_diagonal_offDiagonal (y : ι → E) (x : E) (D C : ℝ)
    (hD : 0 ≤ D) (hC : 0 ≤ C) (hdiag : ∀ i, ‖y i‖ ^ 2 ≤ D)
    (hoff : ∀ i j, i ≠ j → ‖⟪y i, y j⟫_𝕜‖ ≤ C) :
    (∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2) ≤
      ‖x‖ ^ 2 * (D + ((Fintype.card ι - 1 : ℕ) : ℝ) * C) := by sorry

/-- gram_empty_weighted -/
example (x : E) : (∑ i : Fin 0, ‖⟪x, (fun _ => (0 : E)) i⟫_𝕜‖ ^ 2 /
    (∑ j : Fin 0, ‖⟪(0 : E), (fun _ => (0 : E)) j⟫_𝕜‖)) = 0 := by sorry

/-- gram_zero_family -/
example (x : E) : (∑ i : Fin 3, ‖⟪x, (fun _ => (0 : E)) i⟫_𝕜‖ ^ 2 /
    (∑ j : Fin 3, ‖⟪(0 : E), (fun _ => (0 : E)) j⟫_𝕜‖)) = 0 := by sorry

/-- gram_singleton_scaled -/
example : ‖⟪(1 : ℝ), (2 : ℝ)⟫_ℝ‖ ^ 2 / ‖⟪(2 : ℝ), (2 : ℝ)⟫_ℝ‖ = 1 := by sorry

/-- gram_repeated_units -/
example : (∑ i : Fin 3, ‖⟪(1 : ℝ), (fun _ => (1 : ℝ)) i⟫_ℝ‖ ^ 2) = 3 ∧
    (∑ j : Fin 3, ‖⟪(1 : ℝ), (fun _ => (1 : ℝ)) j⟫_ℝ‖) = 3 := by sorry

/-- gram_signed_row_fails -/
example : (∑ j : Fin 2, ⟪(1 : ℝ), (![1,-1] : Fin 2 → ℝ) j⟫_ℝ) = 0 ∧
    (∑ j : Fin 2, ‖⟪(1 : ℝ), (![1,-1] : Fin 2 → ℝ) j⟫_ℝ‖) = 2 := by sorry

/-- gram_unequal_rows_weighted -/
example : (∑ i : Fin 2, ‖⟪(1 : ℝ), (![1,2] : Fin 2 → ℝ) i⟫_ℝ‖ ^ 2 /
    (∑ j : Fin 2, ‖⟪(![1,2] : Fin 2 → ℝ) i, (![1,2] : Fin 2 → ℝ) j⟫_ℝ‖)) = 1 := by sorry

/-- gram_squared_denominator_fails -/
example : ‖⟪(1 : ℝ), (1 / 2 : ℝ)⟫_ℝ‖ ^ 2 /
    ‖⟪(1 / 2 : ℝ), (1 / 2 : ℝ)⟫_ℝ‖ ^ 2 = 4 := by sorry

/-- gram_correct_complex_coefficient -/
example : (⟪Complex.I, (1 : ℂ)⟫_ℂ / (1 : ℂ)) • Complex.I = 1 := by sorry

/-- gram_wrong_complex_coefficient -/
example : (⟪(1 : ℂ), Complex.I⟫_ℂ / (1 : ℂ)) • Complex.I = -1 := by sorry

/-- gram_printed_coefficient_defect -/
example : ‖(1 : ℝ) - ((2 : ℝ) / 16) • (2 : ℝ)‖ ^ 2 = 9 / 16 ∧
    ‖(1 : ℝ) - ((2 : ℝ) / 4) • (2 : ℝ)‖ ^ 2 = 0 := by sorry

/-- gram_zero_bound_empty -/
example (x : E) : (∑ i : Fin 0, ‖⟪x, (fun _ => (0 : E)) i⟫_𝕜‖ ^ 2) ≤ ‖x‖ ^ 2 * 0 := by sorry

/-- gram_nonnegative_bound_needed -/
example : ¬ ((∑ i : Fin 0, ‖⟪(1 : ℝ), (fun _ => (0 : ℝ)) i⟫_ℝ‖ ^ 2) ≤
    ‖(1 : ℝ)‖ ^ 2 * (-1)) := by sorry

end SieveGram
