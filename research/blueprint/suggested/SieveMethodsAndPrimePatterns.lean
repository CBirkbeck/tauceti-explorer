/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex (codex-a71f92), Codex (codex-hjdg0j)
-/
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.Data.Rat.Lemmas
import Mathlib.NumberTheory.SelbergSieve
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Nat.Squarefree
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
import Mathlib.Data.Int.Interval
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Analysis.Complex.Circle
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Algebra.Field.GeomSum
import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.NumberTheory.ZetaValues
import Mathlib.Algebra.Order.Round

/-!
# Suggested finite sieve, Gram-row and taper signatures

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

namespace SieveTaper

open scoped InnerProductSpace
local notation "phase" => (fun x : ℝ => (Real.fourierChar x : ℂ))
local notation "tri" => (fun M : ℕ => fun n : ℤ => max 0 ((M : ℝ) - |(n : ℝ)|))
local notation "weight" => (fun N L : ℕ => fun n : ℤ =>
  (tri (N+L) n - tri N n) / (L : ℝ))
local notation "freq" => (fun N L : ℕ => fun k : Fin (2*(N+L)+1) =>
  (Fin.val k : ℤ) - (N+L : ℕ))
local notation "kernel" => (fun M : ℕ => fun t : ℝ =>
  ‖∑ k ∈ Finset.range M, phase ((k : ℝ)*t)‖ ^ 2)

/-- SV.2/difference-pair-count. Subtraction on the right is natural subtraction. -/
theorem card_difference_pairs (M : ℕ) (n : ℤ) :
    ((Finset.range M ×ˢ Finset.range M).filter
      (fun ab : ℕ × ℕ => (ab.1 : ℤ) - ab.2 = n)).card = M - n.natAbs := by sorry

/-- SV.2/triangular-fourier. This is the unnormalized finite Fejér expression. -/
theorem triangular_fourier (M : ℕ) (t : ℝ) :
    (∑ n ∈ Finset.Icc (-(M : ℤ)) M,
      (tri M n : ℂ) * phase ((n : ℝ)*t)) = (kernel M t : ℂ) := by sorry

/-- SV.2/geometric-sine-square. The sine denominator is explicitly nonzero. -/
theorem geometric_sine_square (M : ℕ) (t : ℝ) (ht : Real.sin (Real.pi*t) ≠ 0) :
    kernel M t = (Real.sin (Real.pi*(M : ℝ)*t) / Real.sin (Real.pi*t))^2 := by sorry

/-- SV.2/taper-weight. Includes the bounds needed before taking square roots. -/
theorem taper_weight (N L : ℕ) (hL : 0 < L) (n : ℤ) :
    weight N L n =
      (if |(n : ℝ)| ≤ N then 1
       else if |(n : ℝ)| ≤ (N+L : ℕ) then ((N+L : ℕ)-|(n : ℝ)|)/(L : ℝ)
       else 0) ∧ 0 ≤ weight N L n ∧ weight N L n ≤ 1 := by sorry

/-- SV.2/tapered-character. A vector in the existing native Euclidean space. -/
def taperedCharacter (N L : ℕ) (x : ℝ) :
    EuclideanSpace ℂ (Fin (2*(N+L)+1)) := by sorry

/-- SV.2/tapered-coordinate. Promoted constructor API. -/
theorem taperedCharacter_apply (N L : ℕ) (x : ℝ) (k : Fin (2*(N+L)+1)) :
    taperedCharacter N L x k =
      (Real.sqrt (weight N L (freq N L k)) : ℂ) *
        phase (-(freq N L k : ℝ)*x) := by sorry

/-- Constructor boundary API; positive taper is required by the other results. -/
theorem taperedCharacter_zero (N : ℕ) (x : ℝ) :
    taperedCharacter N 0 x = 0 := by sorry

/-- SV.2/tapered-core. Promoted constructor API used by Fourier pairing. -/
theorem taperedCharacter_core (N L : ℕ) (hL : 0 < L) (x : ℝ)
    (k : Fin (2*(N+L)+1)) (hk : |(freq N L k : ℝ)| ≤ N) :
    taperedCharacter N L x k = phase (-(freq N L k : ℝ)*x) := by sorry

/-- SV.2/tapered-gram. Signed kernel difference, not its norm. -/
theorem taperedCharacter_inner (N L : ℕ) (hL : 0 < L) (x y : ℝ) :
    ⟪taperedCharacter N L x, taperedCharacter N L y⟫_ℂ =
      (((kernel (N+L) (x-y) - kernel N (x-y))/(L : ℝ) : ℝ) : ℂ) := by sorry

/-- SV.2/tapered-diagonal. -/
theorem taperedCharacter_norm_sq (N L : ℕ) (hL : 0 < L) (x : ℝ) :
    ‖taperedCharacter N L x‖^2 = 2*(N : ℝ)+L := by sorry

/-- SV.2/tapered-offdiagonal. No spacing theorem is hidden in this bound. -/
theorem taperedCharacter_inner_norm_le (N L : ℕ) (hL : 0 < L) (x y : ℝ)
    (hxy : Real.sin (Real.pi*(x-y)) ≠ 0) :
    ‖⟪taperedCharacter N L x, taperedCharacter N L y⟫_ℂ‖ ≤
      1 / ((L : ℝ)*Real.sin (Real.pi*(x-y))^2) := by sorry

/-- SV.2/tapered-fourier-pairing. f is zero outside the untapered core. -/
theorem taperedCharacter_pairing (N L : ℕ) (hL : 0 < L) (x : ℝ)
    (f : EuclideanSpace ℂ (Fin (2*(N+L)+1)))
    (hf : ∀ k, (N : ℝ) < |(freq N L k : ℝ)| → f k = 0) :
    ⟪taperedCharacter N L x, f⟫_ℂ =
      ∑ k, f k * phase ((freq N L k : ℝ)*x) := by sorry

/-- SV.2/tapered-row-large-sieve. Conditional on an explicit cosecant row bound. -/
theorem largeSieve_of_cosecantRow_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (N L : ℕ) (hL : 0 < L) (x : ι → ℝ) (C : ℝ) (hC : 0 ≤ C)
    (hsep : ∀ i j, i ≠ j → Real.sin (Real.pi*(x i-x j)) ≠ 0)
    (hrow : ∀ i, (∑ j ∈ Finset.univ.erase i,
      1 / Real.sin (Real.pi*(x i-x j))^2) ≤ C)
    (f : EuclideanSpace ℂ (Fin (2*(N+L)+1)))
    (hf : ∀ k, (N : ℝ) < |(freq N L k : ℝ)| → f k = 0) :
    (∑ i, ‖∑ k, f k * phase ((freq N L k : ℝ)*x i)‖^2) ≤
      ‖f‖^2 * (2*(N : ℝ)+L+C/(L : ℝ)) := by sorry

/-- taper_zero_width -/
example (N : ℕ) (x : ℝ) : taperedCharacter N 0 x = 0 := by sorry
/-- taper_unit_core -/
example : taperedCharacter 0 1 0 = !₂[(0 : ℂ),1,0] := by sorry
/-- taper_quarter_phase -/
example : taperedCharacter 1 1 (1/4) (1 : Fin 5) = Complex.I := by sorry
/-- taper_square_root_weight -/
example : ‖taperedCharacter 0 2 0 (1 : Fin 5)‖^2 = (1/2 : ℝ) := by sorry
/-- taper_diagonal_mass -/
example : ‖taperedCharacter 1 2 0‖^2 = 4 := by sorry
/-- difference_pairs_signed -/
example : ((Finset.range 3 ×ˢ Finset.range 3).filter
    (fun ab : ℕ × ℕ => (ab.1 : ℤ)-ab.2 = -1)).card = 2 := by sorry
/-- difference_pairs_boundary -/
example : ((Finset.range 3 ×ˢ Finset.range 3).filter
    (fun ab : ℕ × ℕ => (ab.1 : ℤ)-ab.2 = 3)).card = 0 := by sorry
/-- triangular_kernel_zero_phase -/
example : kernel 3 0 = 9 := by sorry
/-- taper_weight_half -/
example : weight 1 2 2 = (1/2 : ℝ) := by sorry
/-- taper_signed_kernel -/
example : kernel 2 (1/2) - kernel 1 (1/2) = -1 := by sorry
/-- taper_signed_gram -/
example : ⟪taperedCharacter 1 1 0, taperedCharacter 1 1 (1/2)⟫_ℂ = -1 := by sorry
/-- taper_absolute_gram -/
example : ‖⟪taperedCharacter 1 1 0, taperedCharacter 1 1 (1/2)⟫_ℂ‖ = 1 := by sorry
/-- taper_missing_final_bin -/
example : ¬ ∃ m : ℕ, (3/10 : ℚ)*m ≤ 2/5 ∧
    2/5 < (3/10 : ℚ)*(m+1) ∧ (3/10 : ℚ)*(m+1) ≤ 1/2 := by sorry


/-! Circular separation and the original finite integer interval. -/
local notation "dist₁" => (fun t : ℝ => ‖(t : UnitAddCircle)‖)
local notation "offset" => (fun H L : ℕ => L+1-H%2)

/-- SV.2/circular-sine-square. Jordan's inequality on the native circle. -/
theorem four_circle_norm_sq_le_sin_sq (t : ℝ) :
    4 * dist₁ t ^ 2 ≤ Real.sin (Real.pi*t)^2 := by sorry

/-- SV.2/circular-bin-packing. All bins are kept, including the last partial one. -/
theorem circular_bin_card_le_two {ι : Type*} [Fintype ι] [DecidableEq ι]
    (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) (i : ι) (m : ℕ) :
    ((Finset.univ.erase i).filter
      (fun j => Nat.floor (dist₁ (x i-x j) / δ) = m)).card ≤ 2 := by sorry

/-- SV.2/cosecant-row-bound. No unproved row estimate is assumed. -/
theorem cosecantRow_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) (i : ι) :
    (∑ j ∈ Finset.univ.erase i, 1 / Real.sin (Real.pi*(x i-x j))^2) ≤
      Real.pi^2 / (12*δ^2) := by sorry

/-- SV.2/integer-taper-choice. Explicit floor choice, not a claimed source quotation. -/
theorem floor_taper_bound (δ : ℝ) (hδ : 0 < δ) (hδ' : δ ≤ 1/2) :
    0 < Nat.floor (1/δ) ∧
      (Nat.floor (1/δ) : ℝ) +
        (Real.pi^2 / (12*δ^2)) / (Nat.floor (1/δ) : ℝ) ≤ 2/δ := by sorry

/-- SV.2/separated-core. The ambient taper width is the chosen positive integer. -/
theorem largeSieve_centered {ι : Type*} [Fintype ι] [DecidableEq ι]
    (N : ℕ) (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ) (hδ' : δ ≤ 1/2)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j))
    (f : EuclideanSpace ℂ (Fin (2*(N+Nat.floor (1/δ))+1)))
    (hf : ∀ k, (N : ℝ) < |(freq N (Nat.floor (1/δ)) k : ℝ)| → f k = 0) :
    (∑ i, ‖∑ k, f k * phase ((freq N (Nat.floor (1/δ)) k : ℝ)*x i)‖^2) ≤
      ‖f‖^2 * (2*(N : ℝ)+2/δ) := by sorry

/-- SV.2/interval-vector. Zero extension into an existing native Euclidean space. -/
def intervalVector (H L : ℕ) (a : Fin H → ℂ) :
    EuclideanSpace ℂ (Fin (2*(H/2+L)+1)) := by sorry

/-- SV.2/interval-coordinate. Promoted coordinate API. -/
theorem intervalVector_apply (H L : ℕ) (a : Fin H → ℂ)
    (k : Fin (2*(H/2+L)+1)) :
    intervalVector H L a k = ∑ j : Fin H, if k.val = offset H L+j.val then a j else 0 :=
  by sorry

/-- SV.2/interval-support. Both parities fit in the same centered core. -/
theorem intervalVector_support (H L : ℕ) (a : Fin H → ℂ)
    (k : Fin (2*(H/2+L)+1)) (hk : (H/2 : ℕ) < |(freq (H/2) L k : ℝ)|) :
    intervalVector H L a k = 0 := by sorry

/-- SV.2/interval-norm. No coefficient is repeated or lost by padding. -/
theorem intervalVector_norm_sq (H L : ℕ) (a : Fin H → ℂ) :
    ‖intervalVector H L a‖^2 = ∑ j, ‖a j‖^2 := by sorry

/-- SV.2/interval-phase. Original frequencies are M+1 through M+H. -/
theorem intervalVector_fourier (M : ℤ) (H L : ℕ) (a : Fin H → ℂ) (x : ℝ) :
    (∑ j, a j * phase (((M : ℝ)+(j.val : ℝ)+1)*x)) =
      phase (((M : ℝ)+((H+1)/2 : ℕ))*x) *
        ∑ k, intervalVector H L a k * phase ((freq (H/2) L k : ℝ)*x) := by sorry

/-- SV.2/separation-card-small. Separation above the circle diameter is vacuous only for ≤1 point. -/
theorem card_le_one_of_half_lt_separation {ι : Type*} [Fintype ι]
    (x : ι → ℝ) (δ : ℝ) (hδ : 1/2 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) :
    Fintype.card ι ≤ 1 := by sorry

/-- SV.2/additive-large-sieve. Bombieri's length+2/δ bound; not the sharper length−1+1/δ result. -/
theorem additive_largeSieve {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : ℤ) (H : ℕ) (a : Fin H → ℂ) (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) :
    (∑ i, ‖∑ j, a j * phase (((M : ℝ)+(j.val : ℝ)+1)*x i)‖^2) ≤
      ((H : ℝ)+2/δ) * ∑ j, ‖a j‖^2 := by sorry

/-- interval_empty -/
example (L : ℕ) (a : Fin 0 → ℂ) : intervalVector 0 L a = 0 := by sorry
/-- interval_even_padding -/
example (a b : ℂ) : intervalVector 2 1 ![a,b] = !₂[0,0,a,b,0] := by sorry
/-- interval_odd_padding -/
example (a b c : ℂ) : intervalVector 3 1 ![a,b,c] = !₂[0,a,b,c,0] := by sorry
/-- interval_zero_taper -/
example (a b : ℂ) : intervalVector 2 0 ![a,b] = !₂[0,a,b] := by sorry
/-- interval_positive_phase -/
example : (∑ j : Fin 2, (![1,Complex.I] : Fin 2 → ℂ) j *
    phase (((-2 : ℝ)+j.val+1)*(1/4))) = 0 := by sorry
/-- interval_starting_frequency -/
example : (∑ j : Fin 1, (1 : ℂ) * phase (((0 : ℝ)+j.val+1)*(1/4))) =
    Complex.I := by sorry
/-- circular_antipode -/
example : (1/2 : ℝ) - (round (1/2 : ℝ) : ℝ) = -1/2 := by sorry
/-- circular_last_bin -/
example : Nat.floor (dist₁ (2/5) / (3/10)) = 1 := by sorry
/-- circular_antipodal_bin -/
example : Nat.floor (dist₁ (1/2) / (1/4)) = 2 := by sorry
/-- floor_taper_half -/
example : Nat.floor (1/(1/2 : ℝ)) = 2 := by sorry
/-- floor_taper_large_spacing -/
example : Nat.floor (1/(2 : ℝ)) = 0 := by sorry
/-- large_sieve_empty_interval -/
example {ι : Type*} [Fintype ι] (M : ℤ) (a : Fin 0 → ℂ) (x : ι → ℝ) :
    (∑ i, ‖∑ j, a j * phase (((M : ℝ)+(j.val : ℝ)+1)*x i)‖^2) = 0 := by sorry

end SieveTaper


namespace SieveCharacters

attribute [local instance] Classical.propDecidable

open scoped BigOperators
local notation "phase" => (fun t : ℝ => (Real.fourierChar t : ℂ))

/-- SV.2/reduced-fraction-separation. The endpoints are in [0,1). -/
theorem reduced_fraction_separation (Q p q a b : ℕ)
    (hp : 0 < p) (hq : 0 < q) (hpQ : p ≤ Q) (hqQ : q ≤ Q)
    (ha : a < p) (hb : b < q) (hap : a.Coprime p) (hbq : b.Coprime q)
    (hne : a ≠ b ∨ p ≠ q) :
    1 / (Q : ℝ)^2 ≤ ‖((((a : ℝ)/p - (b : ℝ)/q) : ℝ) : UnitAddCircle)‖ := by sorry

/-- SV.2/reduced-fraction-large-sieve. Fin Q indexes moduli 1 through Q. -/
theorem reduced_fraction_largeSieve (Q H : ℕ) (M : ℤ) (a : Fin H → ℂ) :
    (∑ q : Fin Q, ∑ u : (ZMod (q.val+1))ˣ,
      ‖∑ j, a j * phase (((M : ℝ)+j.val+1) *
        (((u : ZMod (q.val+1)).val : ℝ)/(q.val+1 : ℕ)))‖^2) ≤
      ((H : ℝ)+2*(Q : ℝ)^2) * ∑ j, ‖a j‖^2 := by sorry

/-- SV.2/standard-character-phase. Native positive additive phase at every integer. -/
theorem standard_character_phase {q : ℕ} [NeZero q] (u : ZMod q) (n : ℤ) :
    ZMod.stdAddChar (u * (n : ZMod q)) =
      phase ((n : ℝ) * ((u.val : ℝ)/q)) := by sorry

/-- SV.2/primitive-gauss-norm. Includes the primitive character of modulus one. -/
theorem primitive_gauss_norm_sq {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) :
    ‖gaussSum χ ZMod.stdAddChar‖^2 = (q : ℝ) := by sorry

/-- SV.2/finite-gauss-expansion. Multiplying by the Gauss sum avoids premature division. -/
theorem finite_gauss_expansion {q : ℕ} [NeZero q] (H : ℕ) (M : ℤ)
    (a : Fin H → ℂ) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) :
    gaussSum χ⁻¹ ZMod.stdAddChar * (∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod q)) =
      ∑ u : (ZMod q)ˣ, χ⁻¹ (u : ZMod q) *
        ∑ j, a j * phase (((M : ℝ)+j.val+1) * (((u : ZMod q).val : ℝ)/q)) := by sorry

/-- SV.2/character-parseval. All characters, arbitrary data on the unit group. -/
theorem character_parseval {q : ℕ} [NeZero q] (F : (ZMod q)ˣ → ℂ) :
    (∑ χ : DirichletCharacter ℂ q,
      ‖∑ u : (ZMod q)ˣ, χ⁻¹ (u : ZMod q) * F u‖^2) =
        (q.totient : ℝ) * ∑ u, ‖F u‖^2 := by sorry

/-- SV.2/primitive-modulus-energy. Primitivity is imposed before the Gauss identity. -/
theorem primitive_modulus_energy {q : ℕ} [NeZero q] (H : ℕ) (M : ℤ)
    (a : Fin H → ℂ) :
    ((q : ℝ)/q.totient) *
      (∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
        DirichletCharacter.IsPrimitive,
        ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod q)‖^2) ≤
      ∑ u : (ZMod q)ˣ,
        ‖∑ j, a j * phase (((M : ℝ)+j.val+1) * (((u : ZMod q).val : ℝ)/q))‖^2 := by sorry

/-- SV.2/primitive-large-sieve. Bombieri--Davenport reduction with Bombieri's inherited constant. -/
theorem primitive_largeSieve (Q H : ℕ) (M : ℤ) (a : Fin H → ℂ) :
    (∑ q : Fin Q, (((q.val+1 : ℕ) : ℝ)/(q.val+1).totient) *
      ∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ (q.val+1))).filter
        DirichletCharacter.IsPrimitive,
        ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod (q.val+1))‖^2) ≤
      ((H : ℝ)+2*(Q : ℝ)^2) * ∑ j, ‖a j‖^2 := by sorry

/-- gauss_modulus_one: zero is a unit in the trivial residue ring. -/
example : gaussSum (1 : DirichletCharacter ℂ 1) ZMod.stdAddChar = 1 := by sorry
/-- primitive_modulus_one -/
example : (1 : DirichletCharacter ℂ 1).IsPrimitive := by sorry
/-- imprimitive_gauss_norm_fails: principal character modulo four. -/
example : gaussSum (1 : DirichletCharacter ℂ 4) ZMod.stdAddChar = 0 := by sorry
/-- modulus_one_energy: no term is lost at q=1. -/
example (H : ℕ) (M : ℤ) (a : Fin H → ℂ) :
    (∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ 1)).filter
      DirichletCharacter.IsPrimitive,
      ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod 1)‖^2) = ‖∑ j, a j‖^2 := by sorry
/-- character_parseval_totient_factor: q=4 has two characters, not four. -/
example : (∑ χ : DirichletCharacter ℂ 4,
    ‖∑ u : (ZMod 4)ˣ, χ⁻¹ (u : ZMod 4) * (1 : ℂ)‖^2) = 4 := by sorry
/-- reduced_fraction_wraparound: linear distance is three quarters. -/
example : ‖(((0 : ℝ)-3/4 : ℝ) : UnitAddCircle)‖ = (1/4 : ℝ) := by sorry
/-- unreduced_labels_collide -/
example : (1/2 : ℝ) = 2/4 ∧ (1,2) ≠ ((2,4) : ℕ × ℕ) := by sorry
/-- character_negative_phase: n=-1, u=1 modulo four. -/
example : ZMod.stdAddChar ((1 : ZMod 4)*(-1)) = -Complex.I := by sorry
/-- multiplicative_empty_moduli -/
example : (∑ q : Fin 0, ((q.val+1 : ℕ) : ℝ)) = 0 := by sorry
/-- multiplicative_empty_interval -/
example {q : ℕ} [NeZero q] (M : ℤ) (a : Fin 0 → ℂ) :
    (∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
      DirichletCharacter.IsPrimitive,
      ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod q)‖^2) = 0 := by sorry

end SieveCharacters

namespace SieveVaughan
open Finset
open scoped ArithmeticFunction ArithmeticFunction.Moebius ArithmeticFunction.zeta

/-- Native-carrier incomplete logarithm. This is a planned construction. -/
noncomputable def incompleteLog (V : ℕ) : ArithmeticFunction ℝ := by
  sorry

theorem incompleteLog_apply (V n : ℕ) :
    incompleteLog V n = ∑ d ∈ n.divisors with V < d, Λ d := by
  sorry

theorem incompleteLog_eq_sub (V n : ℕ) :
    incompleteLog V n = Real.log n - ∑ d ∈ n.divisors with d ≤ V, Λ d := by
  sorry

theorem incompleteLog_eq_zero_of_le {V n : ℕ} (h : n ≤ V) :
    incompleteLog V n = 0 := by
  sorry

theorem incompleteLog_bounds (V n : ℕ) :
    0 ≤ incompleteLog V n ∧ incompleteLog V n ≤ Real.log n := by
  sorry

theorem incompleteLog_zero_cutoff :
    incompleteLog 0 = ArithmeticFunction.log := by
  sorry

theorem moebius_mul_incompleteLog (V n : ℕ) :
    ((μ : ArithmeticFunction ℝ) * incompleteLog V) n =
      if V < n then Λ n else 0 := by
  sorry

theorem vaughan_identity (U V n : ℕ) :
    Λ n = (if n ≤ V then Λ n else 0) +
      (∑ b ∈ n.divisors with b ≤ U, (μ b : ℝ) * Real.log (n / b : ℕ)) -
      (∑ b ∈ n.divisors with b ≤ U,
        (μ b : ℝ) * ∑ c ∈ (n / b).divisors with c ≤ V, Λ c) +
      (∑ b ∈ n.divisors with U < b,
        (μ b : ℝ) * ∑ c ∈ (n / b).divisors with V < c, Λ c) := by
  sorry

theorem weighted_vaughan_hyperbola (V N : ℕ) (w : ℕ → ℂ) :
    (∑ n ∈ Ioc 0 N, (Λ n : ℂ) * w n) =
      (∑ n ∈ Ioc 0 (min N V), (Λ n : ℂ) * w n) +
      ∑ m ∈ Ioc 0 N, (μ m : ℂ) *
        ∑ l ∈ Ioc 0 (N / m), (incompleteLog V l : ℂ) * w (m * l) := by
  sorry

theorem vaughan_bilinear_support {V N m l : ℕ}
    (h : incompleteLog V l ≠ 0) (hp : m * l ≤ N) :
    V < l ∧ m ≤ N / (V + 1) := by
  sorry

theorem vaughan_typeI_typeII (U V N : ℕ) (w : ℕ → ℂ) :
    (∑ n ∈ Ioc 0 N, (Λ n : ℂ) * w n) =
      (∑ n ∈ Ioc 0 (min N V), (Λ n : ℂ) * w n) +
      (∑ m ∈ Ioc 0 (min U (N / (V + 1))), (μ m : ℂ) *
        ∑ l ∈ Ioc V (N / m), (incompleteLog V l : ℂ) * w (m * l)) +
      ∑ m ∈ Ioc U (N / (V + 1)), (μ m : ℂ) *
        ∑ l ∈ Ioc V (N / m), (incompleteLog V l : ℂ) * w (m * l) := by
  sorry

theorem vaughan_coefficient_energy (V L M : ℕ) (hLM : L ≤ M) :
    (∑ l ∈ Ioc L M, (incompleteLog V l) ^ 2) ≤
        ((M - L : ℕ) : ℝ) * (Real.log M) ^ 2 ∧
      (∑ m ∈ Ioc L M, (μ m : ℝ) ^ 2) ≤ ((M - L : ℕ) : ℝ) := by
  sorry

-- Construction tests: zero, equality endpoint, prime power, composite, compatibility.
example : incompleteLog 2 0 = 0 := by sorry
example : incompleteLog 4 4 = 0 := by sorry
example : incompleteLog 2 4 = Real.log 2 := by sorry
example : incompleteLog 2 12 = Real.log 2 + Real.log 3 := by sorry
example (n : ℕ) : incompleteLog 0 n = Real.log n := by sorry

-- The boundary cannot be dropped at n=V=2.
example : ((μ : ArithmeticFunction ℝ) * incompleteLog 2) 2 = 0 ∧
    Λ 2 = Real.log 2 := by sorry

-- The bilinear cofactor endpoint is inclusive.
example : incompleteLog 2 3 = Real.log 3 ∧
    4 = (12 : ℕ) / (2 + 1) := by sorry

-- Empty Type II range, empty original interval, and the nonsquarefree coefficient.
example : Ioc (5 : ℕ) (12 / (2 + 1)) = ∅ := by sorry
example (w : ℕ → ℂ) : (∑ n ∈ Ioc 0 (0 : ℕ), (Λ n : ℂ) * w n) = 0 := by sorry
example : (μ 4 : ℝ) ^ 2 = 0 := by sorry

end SieveVaughan
