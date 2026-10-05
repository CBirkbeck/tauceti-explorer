/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex (codex-a71f92), Codex (codex-hjdg0j), Claude Code (cc-39fac3)
-/
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.NumberTheory.AlmostPrime
import Mathlib.Data.Finset.Sort
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
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.NumberTheory.Primorial
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Nat.Nth
import Mathlib.Data.Fin.Tuple.NatAntidiagonal
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Calculus.ContDiff.Defs
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.MeasureTheory.Function.LpSeminorm.Defs

/-!
# Suggested finite sieve, Gram-row and taper signatures

This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive; these statements suggest Lean names and signatures for contributors
and reviewers. Proof placeholders are not implementation evidence.

Reuse the pinned BoundingSieve and SelbergSieve carriers, their weighted sums,
multiplicative density and remainder. No competing sieve or bound predicate is defined.
The finite Gram results reuse the existing inner-product and matrix APIs; the
inner product is conjugate-linear in its first argument. No completeness is assumed.
The final namespaces SieveDistribution (SV.3), SieveSelberg (SV.1) and SieveMaynard (SV.4)
follow Maynard's *Small gaps between primes*: level of distribution, admissible tuples,
multidimensional sieve weights, the variational quantity `M_k` and the bounded-gap theorems.
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
namespace SieveCharacters

attribute [local instance] Classical.propDecidable
open scoped BigOperators

-- Display abbreviations only; no competing character, norm or bound predicate.
set_option quotPrecheck false
local notation "twist" => (fun {q H : ℕ} (M : ℤ) (a : Fin H → ℂ)
  (χ : DirichletCharacter ℂ q) =>
    ∑ j, a j * χ ((M + j.val + 1 : ℤ) : ZMod q))
local notation "energy" => (fun {H : ℕ} (a : Fin H → ℂ) => ∑ j, ‖a j‖^2)
local notation "band" => (fun (P Q : ℕ)
  (F : (q : Fin Q) → DirichletCharacter ℂ (q.val+1) → ℝ) =>
    ∑ q : Fin Q, if P < q.val+1 then
      (1 / ((q.val+1).totient : ℝ)) *
        ∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ (q.val+1))).filter
          DirichletCharacter.IsPrimitive, F q χ else 0)
set_option quotPrecheck true

/-- SV.2/dyadic-primitive-energy. Lower endpoint excluded, upper endpoint retained. -/
theorem dyadic_primitive_energy (P H : ℕ) (hP : 0 < P)
    (M : ℤ) (a : Fin H → ℂ) :
    band P (2*P) (fun _ χ => ‖twist M a χ‖^2) ≤
      (((H : ℝ) + 8*(P : ℝ)^2) / P) * energy a := by sorry

/-- SV.2/dyadic-primitive-bilinear. Weighted Cauchy--Schwarz at a common modulus. -/
theorem dyadic_primitive_bilinear (P H K : ℕ) (hP : 0 < P)
    (M N : ℤ) (a : Fin H → ℂ) (b : Fin K → ℂ) :
    band P (2*P) (fun _ χ => ‖twist M a χ‖ * ‖twist N b χ‖) ≤
      (Real.sqrt ((H : ℝ)+8*(P : ℝ)^2) *
        Real.sqrt ((K : ℝ)+8*(P : ℝ)^2) / P) *
      Real.sqrt (energy a) * Real.sqrt (energy b) := by sorry

/-- SV.2/dyadic-modulus-partition. This finite identity does not assume a sign on c. -/
theorem dyadic_modulus_partition (R J : ℕ) (c : ℕ → ℝ) :
    (∑ q ∈ Finset.Ioc R (R*2^J), c q) =
      ∑ i ∈ Finset.range J,
        ∑ q ∈ Finset.Ioc (R*2^i) (2*(R*2^i)), c q := by sorry

/-- SV.2/dyadic-bilinear-kernel. J is retained on the scale-independent terms. -/
theorem dyadic_bilinear_kernel (R : ℝ) (hR : 0 < R) (J : ℕ)
    (H K : ℝ) (hH : 0 ≤ H) (hK : 0 ≤ K) :
    (∑ i ∈ Finset.range J,
      Real.sqrt (H+8*(R*2^i)^2) * Real.sqrt (K+8*(R*2^i)^2) / (R*2^i)) ≤
      9*R*(2^J-1) + 3*(J : ℝ)*(Real.sqrt H+Real.sqrt K) +
        (2/R)*(1-(1/2 : ℝ)^J)*Real.sqrt H*Real.sqrt K := by sorry

/-- SV.2/primitive-bilinear-dyadic-tail. Both translations and empty intervals are allowed. -/
theorem primitive_bilinear_dyadic_tail (R J H K : ℕ) (hR : 0 < R)
    (M N : ℤ) (a : Fin H → ℂ) (b : Fin K → ℂ) :
    band R (R*2^J) (fun _ χ => ‖twist M a χ‖ * ‖twist N b χ‖) ≤
      (9*(R : ℝ)*((2 : ℝ)^J-1) +
        3*(J : ℝ)*(Real.sqrt H+Real.sqrt K) +
        (2/(R : ℝ))*(1-(1/2 : ℝ)^J)*Real.sqrt H*Real.sqrt K) *
      Real.sqrt (energy a) * Real.sqrt (energy b) := by sorry

/-- SV.2/primitive-bilinear-cutoff. The final partial dyadic band is bounded, not discarded. -/
theorem primitive_bilinear_cutoff (R Q J H K : ℕ) (hR : 0 < R)
    (hcover : Q ≤ R*2^J) (hsize : R*2^J ≤ 2*Q)
    (M N : ℤ) (a : Fin H → ℂ) (b : Fin K → ℂ) :
    band R Q (fun _ χ => ‖twist M a χ‖ * ‖twist N b χ‖) ≤
      (18*(Q : ℝ) + 3*(J : ℝ)*(Real.sqrt H+Real.sqrt K) +
        (2/(R : ℝ))*Real.sqrt H*Real.sqrt K) *
      Real.sqrt (energy a) * Real.sqrt (energy b) := by sorry

/-- dyadic_boundary_once: q=4 is assigned to the first band, not the next. -/
example : (∑ i ∈ Finset.range 2,
    ∑ q ∈ Finset.Ioc (2*2^i) (2*(2*2^i)), if q=4 then (1 : ℝ) else 0) = 1 := by sorry
/-- dyadic_excluded_lower: q=R does not enter the tail. -/
example : (∑ q ∈ Finset.Ioc 2 (2*2^3), if q=2 then (1 : ℝ) else 0) = 0 := by sorry
/-- dyadic_last_endpoint: q=R*2^J is retained. -/
example : (∑ i ∈ Finset.range 3,
    ∑ q ∈ Finset.Ioc (2*2^i) (2*(2*2^i)), if q=16 then (1 : ℝ) else 0) = 1 := by sorry
/-- dyadic_empty_scales -/
example (R : ℕ) (c : ℕ → ℝ) : (∑ q ∈ Finset.Ioc R (R*2^0), c q) = 0 := by sorry
/-- dyadic_zero_support -/
example (P : ℕ) (M : ℤ) (a : Fin 0 → ℂ) :
    band P (2*P) (fun _ χ => ‖twist M a χ‖^2) = 0 := by sorry
/-- dyadic_scale_loss: the scale-independent term sums to J, not to one. -/
example : (∑ _i ∈ Finset.range 4, (1 : ℝ)) = 4 := by sorry
/-- dyadic_zero_kernel: fixes the factor eight inherited from Q=2P. -/
example : (∑ i ∈ Finset.range 3,
    Real.sqrt (8*((2 : ℝ)*2^i)^2) *
      Real.sqrt (8*((2 : ℝ)*2^i)^2) / (2*2^i)) = 112 := by sorry
/-- dyadic_cutoff_not_power: Q=5 requires the band (4,8], not just (2,4]. -/
example : 5 ≤ 2*2^2 ∧ 2*2^2 ≤ 2*5 ∧ ¬5 ≤ 2*2^1 := by sorry

end SieveCharacters

/-!
## SV.1, SV.3 and SV.4: Maynard's multidimensional sieve

Checkpoint by Claude Code (cc-39fac3), following Maynard, *Small gaps between primes*,
Ann. of Math. 181 (2015), 383–413 (arXiv:1311.4600v3), Goldston–Graham–Pintz–Yıldırım,
arXiv:math/0609615v1, Lemmas 3–4, and Kedlaya's Chapter 18, Theorem 18.4. Error terms are
stated with explicit constants `C` and thresholds `N₀`; the source's implied constants may
depend on `k`, the tuple, `θ` and `δ`, but not on `N`, `y` or `F`.
-/

namespace SieveDistribution

open Filter Asymptotics

/-- SV.3/level-of-distribution, data: `π(x; q, a)`, the number of primes `p ≤ x` with
`p ≡ a (mod q)`. -/
def primeCountAP (x : ℝ) (q a : ℕ) : ℕ :=
  ((Finset.range (⌊x⌋₊ + 1)).filter (fun p => p.Prime ∧ p ≡ a [MOD q])).card

/-- SV.3/level-of-distribution, data: `max_{(a,q)=1} |π(x;q,a) − π(x)/φ(q)|`. -/
def discrepancy (x : ℝ) (q : ℕ) : ℝ :=
  ⨆ a : {a : Fin q // Nat.Coprime a q},
    |(primeCountAP x q a.1 : ℝ) - (Nat.primeCounting ⌊x⌋₊ : ℝ) / (q.totient : ℝ)|

/-- SV.3/level-of-distribution. Maynard (1.3): the primes have level of distribution `θ`. -/
def PrimesHaveLevel (θ : ℝ) : Prop :=
  ∀ A : ℝ, 0 < A →
    (fun x : ℝ => ∑ q ∈ Finset.Icc 1 ⌊x ^ θ⌋₊, discrepancy x q) =O[atTop]
      fun x : ℝ => x / Real.log x ^ A

/-- SV.3/level-of-distribution, API: the Elliott–Halberstam conjecture, a named hypothesis. -/
def ElliottHalberstam : Prop :=
  ∀ θ : ℝ, θ < 1 → PrimesHaveLevel θ

/-- SV.3/level-of-distribution, API: Maynard's window error `E(N, q)` of (5.16). -/
def windowError (N q : ℕ) : ℝ :=
  1 + ⨆ a : {a : Fin q // Nat.Coprime a q},
    |(((Finset.Ico N (2 * N)).filter (fun n => n.Prime ∧ n ≡ a.1 [MOD q])).card : ℝ) -
      (((Finset.Ico N (2 * N)).filter Nat.Prime).card : ℝ) / (q.totient : ℝ)|

/-- SV.3/level-of-distribution, API: the modulus one contributes nothing. -/
theorem discrepancy_one (x : ℝ) : discrepancy x 1 = 0 := by
  sorry

/-- SV.3/level-of-distribution, API: a smaller level is implied. -/
theorem PrimesHaveLevel.mono {θ θ' : ℝ} (h : θ' ≤ θ) (hθ : PrimesHaveLevel θ) :
    PrimesHaveLevel θ' := by
  sorry

/-- SV.3/level-of-distribution, API: nonpositive levels hold trivially. -/
theorem primesHaveLevel_of_nonpos {θ : ℝ} (hθ : θ ≤ 0) : PrimesHaveLevel θ := by
  sorry

/-- SV.3/level-of-distribution, API: the window form used in Maynard (5.20). -/
theorem PrimesHaveLevel.sum_windowError {θ θ' : ℝ} (hθ : PrimesHaveLevel θ) (h' : θ' < θ)
    (h1 : θ < 1) (A : ℝ) (hA : 0 < A) :
    (fun N : ℕ => ∑ q ∈ Finset.Icc 1 ⌊(N : ℝ) ^ θ'⌋₊, windowError N q) =O[atTop]
      fun N : ℕ => (N : ℝ) / Real.log N ^ A := by
  sorry

example : discrepancy 10 3 = 1 := by
  sorry

example : PrimesHaveLevel 0 := by
  sorry

example {θ : ℝ} (hθ : 1 < θ) : ¬ PrimesHaveLevel θ := by
  sorry

example (x : ℝ) : primeCountAP x 1 0 = Nat.primeCounting ⌊x⌋₊ := by
  sorry

/-- SV.3/bombieri-vinogradov-level. Bombieri–Vinogradov: every level `θ < 1/2` holds. -/
theorem primesHaveLevel_of_lt_half {θ : ℝ} (hθ : θ < 1 / 2) : PrimesHaveLevel θ := by
  sorry

end SieveDistribution

namespace SieveSelberg

open Filter Topology

/-- SV.1/selberg-diagonal-sum-dimension-one. GGPY Lemma 3 with `κ = 1`: under `(Ω₁)` and
`(Ω₂(1, L))`, `∑_{d<z} μ²(d) g(d) = c_γ log z (1 + O(L / log z))`, where
`g(d) = ∏_{p ∣ d} γ(p)/(p − γ(p))` and `c_γ = ∏_p (1 − γ(p)/p)⁻¹ (1 − 1/p)`. The constant
`C` depends only on `A₁` and `A₂`. -/
theorem abs_sum_squarefree_diagonal_sub_le (A₁ A₂ : ℝ) (hA₁ : 1 < A₁) (hA₂ : 0 ≤ A₂) :
    ∃ C : ℝ, ∀ (γ : ℕ → ℝ) (L : ℝ), 1 ≤ L →
      (∀ p : ℕ, p.Prime → 0 ≤ γ p / p ∧ γ p / p ≤ 1 - 1 / A₁) →
      (∀ w z : ℝ, 2 ≤ w → w ≤ z →
        -L ≤ (∑ p ∈ (Finset.Ico ⌈w⌉₊ ⌈z⌉₊).filter Nat.Prime, γ p * Real.log p / p) -
            Real.log (z / w) ∧
          (∑ p ∈ (Finset.Ico ⌈w⌉₊ ⌈z⌉₊).filter Nat.Prime, γ p * Real.log p / p) -
            Real.log (z / w) ≤ A₂) →
      ∃ c : ℝ, Tendsto (fun y : ℕ => ∏ p ∈ Nat.primesBelow y, (1 - γ p / p)⁻¹ * (1 - 1 / (p : ℝ)))
          atTop (𝓝 c) ∧
        ∀ z : ℝ, 2 ≤ z →
          |(∑ d ∈ (Finset.range ⌈z⌉₊).filter Squarefree,
              ∏ p ∈ d.primeFactors, γ p / ((p : ℝ) - γ p)) - c * Real.log z| ≤ C * c * L := by
  sorry

/-- SV.1/selberg-smooth-diagonal-sum. GGPY Lemma 4 with `κ = 1` (Maynard Lemma 6.1): the
same sum weighted by `G(log d / log z)` for a `C¹` function `G`, with
`G_max = sup (|G| + |G'|)` on `[0, 1]`. -/
theorem abs_sum_squarefree_diagonal_smooth_sub_le (A₁ A₂ : ℝ) (hA₁ : 1 < A₁) (hA₂ : 0 ≤ A₂) :
    ∃ C : ℝ, ∀ (γ : ℕ → ℝ) (L : ℝ), 1 ≤ L →
      (∀ p : ℕ, p.Prime → 0 ≤ γ p / p ∧ γ p / p ≤ 1 - 1 / A₁) →
      (∀ w z : ℝ, 2 ≤ w → w ≤ z →
        -L ≤ (∑ p ∈ (Finset.Ico ⌈w⌉₊ ⌈z⌉₊).filter Nat.Prime, γ p * Real.log p / p) -
            Real.log (z / w) ∧
          (∑ p ∈ (Finset.Ico ⌈w⌉₊ ⌈z⌉₊).filter Nat.Prime, γ p * Real.log p / p) -
            Real.log (z / w) ≤ A₂) →
      ∀ (G : ℝ → ℝ) (Gmax : ℝ), ContDiff ℝ 1 G →
        (∀ t ∈ Set.Icc (0 : ℝ) 1, |G t| + |deriv G t| ≤ Gmax) →
        ∃ c : ℝ, Tendsto (fun y : ℕ => ∏ p ∈ Nat.primesBelow y, (1 - γ p / p)⁻¹ * (1 - 1 / (p : ℝ)))
            atTop (𝓝 c) ∧
          ∀ z : ℝ, 2 ≤ z →
            |(∑ d ∈ (Finset.range ⌈z⌉₊).filter Squarefree,
                (∏ p ∈ d.primeFactors, γ p / ((p : ℝ) - γ p)) * G (Real.log d / Real.log z)) -
              c * Real.log z * ∫ x in (0 : ℝ)..1, G x| ≤ C * c * L * Gmax := by
  sorry

end SieveSelberg

namespace SieveMaynard

open Filter Topology MeasureTheory SieveDistribution
open scoped ArithmeticFunction.Moebius

/-! ### Admissible tuples and the prime k-tuples conjecture -/

/-- SV.4/admissible-tuple. `H` misses a residue class modulo every prime. -/
def IsAdmissible (H : Finset ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → ∃ a : ℕ, ∀ h ∈ H, ¬ h ≡ a [MOD p]

/-- SV.4/admissible-tuple, API: only primes `p ≤ #H` need checking. -/
theorem isAdmissible_iff_card_image_lt (H : Finset ℕ) :
    IsAdmissible H ↔ ∀ p : ℕ, p.Prime → p ≤ H.card → (H.image (· % p)).card < p := by
  sorry

/-- SV.4/admissible-tuple, API: subsets of admissible sets are admissible. -/
theorem IsAdmissible.mono {H H' : Finset ℕ} (hH : IsAdmissible H) (h : H' ⊆ H) :
    IsAdmissible H' := by
  sorry

/-- SV.4/admissible-tuple, API: admissibility is invariant under translation. -/
theorem IsAdmissible.map_add {H : Finset ℕ} (hH : IsAdmissible H) (c : ℕ) :
    IsAdmissible (H.map (addRightEmbedding c)) := by
  sorry

/-- SV.4/admissible-tuple, API: no element divisible by a prime `p ≤ #H` suffices. -/
theorem isAdmissible_of_forall_not_dvd (H : Finset ℕ)
    (hH : ∀ h ∈ H, ∀ p : ℕ, p.Prime → p ≤ H.card → ¬ p ∣ h) : IsAdmissible H := by
  sorry

example : IsAdmissible {0, 2} := by
  sorry

example : ¬ IsAdmissible {0, 2, 4} := by
  sorry

example : IsAdmissible {0, 2, 6, 8, 12} := by
  sorry

example : IsAdmissible ∅ := by
  sorry

example : ¬ IsAdmissible {0, 1} := by
  sorry

/-- SV.4/prime-tuples-conjecture, data: the `n` for which every `n + h` is prime. -/
def primeTranslates (H : Finset ℕ) : Set ℕ :=
  {n | ∀ h ∈ H, (n + h).Prime}

/-- SV.4/prime-tuples-conjecture. Every admissible `H` has infinitely many prime translates.
A named statement, never assumed. -/
def PrimeTuplesConjecture : Prop :=
  ∀ H : Finset ℕ, IsAdmissible H → (primeTranslates H).Infinite

/-- SV.4/prime-tuples-conjecture, API: admissibility is necessary. -/
theorem isAdmissible_of_infinite_primeTranslates {H : Finset ℕ}
    (h : (primeTranslates H).Infinite) : IsAdmissible H := by
  sorry

/-- SV.4/prime-tuples-conjecture, API: the singleton case is the set of primes. -/
theorem primeTranslates_singleton_zero : primeTranslates {0} = {p | p.Prime} := by
  sorry

/-- SV.4/prime-tuples-conjecture, API: the conjecture implies the twin prime conjecture. -/
theorem PrimeTuplesConjecture.infinite_twin (h : PrimeTuplesConjecture) :
    {p : ℕ | p.Prime ∧ (p + 2).Prime}.Infinite := by
  sorry

example : (primeTranslates {0}).Infinite := by
  sorry

example : primeTranslates {0, 1} = {2} := by
  sorry

example : primeTranslates {0, 2, 4} = {3} := by
  sorry

example : primeTranslates ∅ = Set.univ := by
  sorry

/-! ### The W-trick -/

/-- SV.4/w-trick-residue, data: `W = ∏_{p ≤ D₀} p`. -/
def wModulus (D₀ : ℝ) : ℕ :=
  primorial ⌊D₀⌋₊

/-- SV.4/w-trick-residue. The least `v₀ < W` with every `v₀ + h` coprime to `W`, or `0`
when none exists. -/
def wResidue (H : Finset ℕ) (D₀ : ℝ) : ℕ := by
  classical
  exact if h : ∃ v, v < wModulus D₀ ∧ ∀ x ∈ H, Nat.Coprime (v + x) (wModulus D₀) then
    Nat.find h else 0

/-- SV.4/w-trick-residue, API: for admissible `H` every shifted residue is coprime to `W`. -/
theorem wResidue_coprime {H : Finset ℕ} (hH : IsAdmissible H) (D₀ : ℝ) :
    ∀ h ∈ H, Nat.Coprime (wResidue H D₀ + h) (wModulus D₀) := by
  sorry

/-- SV.4/w-trick-residue, API: the residue is reduced modulo `W`. -/
theorem wResidue_lt (H : Finset ℕ) (D₀ : ℝ) : wResidue H D₀ < wModulus D₀ := by
  sorry

/-- SV.4/w-trick-residue, API: `W ≤ 4 ^ D₀`. -/
theorem wModulus_le (D₀ : ℝ) (h : 0 ≤ D₀) : (wModulus D₀ : ℝ) ≤ 4 ^ D₀ := by
  sorry

/-- SV.4/w-trick-residue, API: with `D₀ = log log log N`, `W ≤ (log log N)²` eventually. -/
theorem eventually_wModulus_le :
    ∀ᶠ N : ℝ in atTop,
      (wModulus (Real.log (Real.log (Real.log N))) : ℝ) ≤ Real.log (Real.log N) ^ 2 := by
  sorry

example : wModulus 3 = 6 := by
  sorry

example : wResidue {0, 2} 3 = 5 := by
  sorry

example : wModulus 1 = 1 := by
  sorry

example : ¬ ∃ v : ℕ, ∀ x ∈ ({0, 1} : Finset ℕ), Nat.Coprime (v + x) (wModulus 2) := by
  sorry

/-! ### Maynard's sieve weights -/

/-- SV.4/maynard-sieve-weights, data: the support condition of (5.7): `∏ rᵢ` squarefree,
coprime to `W` and less than `R`. -/
def IsMaynardSupport (k W : ℕ) (R : ℝ) (r : Fin k → ℕ) : Prop :=
  Squarefree (∏ i, r i) ∧ Nat.Coprime (∏ i, r i) W ∧ ((∏ i, r i : ℕ) : ℝ) < R

/-- SV.4/maynard-sieve-weights, data: the smooth choice (6.3) of `y`. -/
def maynardY (k W : ℕ) (R : ℝ) (F : (Fin k → ℝ) → ℝ) (r : Fin k → ℕ) : ℝ := by
  classical
  exact if IsMaynardSupport k W R r then F (fun i => Real.log (r i) / Real.log R) else 0

/-- SV.4/maynard-sieve-weights, data: the inverse change of variables (5.8),
`λ_d = ∏ μ(dᵢ) dᵢ · ∑_{dᵢ ∣ rᵢ} y_r / ∏ φ(rᵢ)`. -/
def maynardLambdaOfY (k : ℕ) (R : ℝ) (y : (Fin k → ℕ) → ℝ) (d : Fin k → ℕ) : ℝ :=
  (∏ i, (μ (d i) : ℝ) * d i) *
    ∑ r ∈ Fintype.piFinset (fun i => (Finset.range ⌈R⌉₊).filter (d i ∣ ·)),
      y r / ∏ i, ((r i).totient : ℝ)

/-- SV.4/maynard-sieve-weights. The weights of Proposition 4.1 attached to `F`. -/
def maynardLambda (k W : ℕ) (R : ℝ) (F : (Fin k → ℝ) → ℝ) : (Fin k → ℕ) → ℝ :=
  maynardLambdaOfY k R (maynardY k W R F)

/-- SV.4/maynard-sieve-weights, data: the weight `w_n = (∑_{dᵢ ∣ n + hᵢ} λ_d)²` of (2.4). -/
def maynardWeight (k : ℕ) (lam : (Fin k → ℕ) → ℝ) (h : Fin k → ℕ) (n : ℕ) : ℝ :=
  (∑ d ∈ Fintype.piFinset (fun i => (n + h i).divisors), lam d) ^ 2

/-- SV.4/maynard-sieve-weights, data: `S₁` of (4.2). -/
def sieveSumS1 (k W v₀ : ℕ) (lam : (Fin k → ℕ) → ℝ) (h : Fin k → ℕ) (N : ℕ) : ℝ :=
  ∑ n ∈ (Finset.Ico N (2 * N)).filter (· ≡ v₀ [MOD W]), maynardWeight k lam h n

/-- SV.4/maynard-sieve-weights, data: `S₂⁽ᵐ⁾` of (5.14); `S₂ = ∑ₘ S₂⁽ᵐ⁾`. -/
def sieveSumS2 (k W v₀ : ℕ) (m : Fin k) (lam : (Fin k → ℕ) → ℝ) (h : Fin k → ℕ)
    (N : ℕ) : ℝ :=
  ∑ n ∈ (Finset.Ico N (2 * N)).filter (· ≡ v₀ [MOD W]),
    (if (n + h m).Prime then (1 : ℝ) else 0) * maynardWeight k lam h n

/-- SV.4/maynard-sieve-weights, data: the totally multiplicative `g` with `g(p) = p − 2`. -/
def maynardG (n : ℕ) : ℝ :=
  ∏ p ∈ n.primeFactors, ((p : ℝ) - 2) ^ n.factorization p

/-- SV.4/maynard-sieve-weights, data: `y⁽ᵐ⁾` of (5.23). -/
def maynardYm (k : ℕ) (m : Fin k) (R : ℝ) (lam : (Fin k → ℕ) → ℝ) (r : Fin k → ℕ) : ℝ :=
  (∏ i, (μ (r i) : ℝ) * maynardG (r i)) *
    ∑ d ∈ (Fintype.piFinset (fun i => (Finset.range ⌈R⌉₊).filter (r i ∣ ·))).filter
        (fun d => d m = 1),
      lam d / ∏ i, ((d i).totient : ℝ)

/-- SV.4/maynard-sieve-weights, API: `λ_d = 0` off the support. -/
theorem maynardLambdaOfY_eq_zero {k W : ℕ} {R : ℝ} {y : (Fin k → ℕ) → ℝ}
    (hy : ∀ r, ¬ IsMaynardSupport k W R r → y r = 0) {d : Fin k → ℕ}
    (hd : ¬ IsMaynardSupport k W R d) : maynardLambdaOfY k R y d = 0 := by
  sorry

/-- SV.4/maynard-sieve-weights, API: the change of variables (5.7) inverts (5.8). -/
theorem maynardY_eq_sum_lambda {k W : ℕ} {R : ℝ} {y : (Fin k → ℕ) → ℝ}
    (hy : ∀ r, ¬ IsMaynardSupport k W R r → y r = 0) {r : Fin k → ℕ}
    (hr : IsMaynardSupport k W R r) :
    y r = (∏ i, (μ (r i) : ℝ) * (r i).totient) *
      ∑ d ∈ Fintype.piFinset (fun i => (Finset.range ⌈R⌉₊).filter (r i ∣ ·)),
        maynardLambdaOfY k R y d / ∏ i, (d i : ℝ) := by
  sorry

/-- SV.4/maynard-sieve-weights, API: the weights are nonnegative. -/
theorem maynardWeight_nonneg (k : ℕ) (lam : (Fin k → ℕ) → ℝ) (h : Fin k → ℕ) (n : ℕ) :
    0 ≤ maynardWeight k lam h n := by
  sorry

/-- SV.4/maynard-sieve-weights, API: in dimension one the weight is Mathlib's `Λ²` sieve. -/
theorem maynardWeight_one_eq_sum_lambdaSquared (lam : (Fin 1 → ℕ) → ℝ) (h : Fin 1 → ℕ)
    (n : ℕ) (hn : n + h 0 ≠ 0) :
    maynardWeight 1 lam h n =
      ∑ e ∈ (n + h 0).divisors, BoundingSieve.lambdaSquared (fun d => lam (fun _ => d)) e := by
  sorry

example (k W : ℕ) (R : ℝ) (d : Fin k → ℕ) : maynardLambda k W R (fun _ => 0) d = 0 := by
  sorry

example (k W : ℕ) (F : (Fin k → ℝ) → ℝ) (h : Fin k → ℕ) (n : ℕ)
    (hn : ∀ i, n + h i ≠ 0) :
    maynardWeight k (maynardLambda k W 2 F) h n = F 0 ^ 2 := by
  sorry

example (W : ℕ) (R : ℝ) (F : (Fin 2 → ℝ) → ℝ) :
    maynardLambda 2 W R F ![2, 2] = 0 := by
  sorry

/-! ### Maynard's variational problem -/

/-- SV.4/maynard-functionals, data: the simplex `ℛ_k`. -/
def maynardSimplex (k : ℕ) : Set (Fin k → ℝ) :=
  {t | (∀ i, 0 ≤ t i) ∧ ∑ i, t i ≤ 1}

/-- SV.4/maynard-functionals, data: `I_k(F) = ∫_{[0,1]^k} F²`. -/
def maynardI (k : ℕ) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  ∫ t in Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1), F t ^ 2

/-- SV.4/maynard-functionals, data: `J_k⁽ᵐ⁾(F) = ∫ (∫₀¹ F dtₘ)²`; the outer integral runs over
the cube, on which the integrand does not depend on `tₘ`. -/
def maynardJ (k : ℕ) (m : Fin k) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  ∫ t in Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1),
    (∫ s in (0 : ℝ)..1, F (Function.update t m s)) ^ 2

/-- SV.4/maynard-functionals, data: the class `𝒮_k`, with square integrability in place of
Riemann integrability (the supremum is unchanged, by SV.4/ratio-smooth-approximation). -/
def IsMaynardAdmissible (k : ℕ) (F : (Fin k → ℝ) → ℝ) : Prop :=
  (∀ t, t ∉ maynardSimplex k → F t = 0) ∧
    MemLp F 2 (volume.restrict (Set.univ.pi fun _ : Fin k => Set.Icc (0 : ℝ) 1)) ∧
    maynardI k F ≠ 0 ∧ ∀ m, maynardJ k m F ≠ 0

/-- SV.4/maynard-functionals, data: the ratio `∑ₘ J_k⁽ᵐ⁾(F) / I_k(F)`. -/
def maynardRatio (k : ℕ) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  (∑ m, maynardJ k m F) / maynardI k F

/-- SV.4/maynard-functionals. `M_k = sup_{F ∈ 𝒮_k} ∑ₘ J_k⁽ᵐ⁾(F) / I_k(F)`. -/
def maynardM (k : ℕ) : ℝ :=
  sSup {r | ∃ F, IsMaynardAdmissible k F ∧ r = maynardRatio k F}

/-- SV.4/maynard-functionals, data: `G_{b,j}(x)` of Lemma 8.1, with the `r = 0` term
(`G_{0,j} = 1`) that the printed formula omits (finding E31). -/
def simplexG (b j x : ℕ) : ℚ :=
  (b.factorial : ℚ) * ∑ r ∈ Finset.range (b + 1), (x.choose r : ℚ) *
    ∑ c ∈ (Finset.Nat.antidiagonalTuple r b).filter (fun c => ∀ i, 1 ≤ c i),
      ∏ i, ((j * c i).factorial : ℚ) / (c i).factorial

/-- SV.4/maynard-functionals, API: the ratio is unchanged by a nonzero scalar. -/
theorem maynardRatio_smul (k : ℕ) (F : (Fin k → ℝ) → ℝ) {c : ℝ} (hc : c ≠ 0) :
    maynardRatio k (c • F) = maynardRatio k F := by
  sorry

/-- SV.4/maynard-functionals, API: for symmetric `F`, `J_k⁽ᵐ⁾` does not depend on `m`. -/
theorem maynardJ_eq_of_symmetric (k : ℕ) (F : (Fin k → ℝ) → ℝ)
    (hF : ∀ σ : Equiv.Perm (Fin k), ∀ t, F (t ∘ σ) = F t) (m m' : Fin k) :
    maynardJ k m F = maynardJ k m' F := by
  sorry

/-- SV.4/maynard-functionals, API: Cauchy–Schwarz gives `J_k⁽ᵐ⁾ ≤ I_k`, hence `M_k ≤ k`. -/
theorem maynardM_le (k : ℕ) : maynardM k ≤ k := by
  sorry

/-- SV.4/maynard-functionals, API: every admissible ratio is at most `M_k`. -/
theorem maynardRatio_le_maynardM {k : ℕ} {F : (Fin k → ℝ) → ℝ}
    (hF : IsMaynardAdmissible k F) : maynardRatio k F ≤ maynardM k := by
  sorry

/-- SV.4/maynard-functionals, API: the radial case recovers the GPY integrals (Maynard,
remark after Lemma 6.3). -/
theorem maynardI_J_radial (k : ℕ) (hk : 2 ≤ k) (G : ℝ → ℝ) (hG : Continuous G) (m : Fin k) :
    maynardI k ((maynardSimplex k).indicator fun t => G (∑ i, t i)) =
        (∫ t in (0 : ℝ)..1, G t ^ 2 * t ^ (k - 1)) / (k - 1).factorial ∧
      maynardJ k m ((maynardSimplex k).indicator fun t => G (∑ i, t i)) =
        (∫ t in (0 : ℝ)..1, (∫ v in t..1, G v) ^ 2 * t ^ (k - 2)) / (k - 2).factorial := by
  sorry

example : maynardM 1 = 1 := by
  sorry

example :
    maynardI 2 ((maynardSimplex 2).indicator 1) = 1 / 2 ∧
      maynardJ 2 0 ((maynardSimplex 2).indicator 1) = 1 / 3 := by
  sorry

example (k : ℕ) : ¬ IsMaynardAdmissible k (fun _ => 0) := by
  sorry

example :
    ¬ IsMaynardAdmissible 2 (fun _ => 1) ∧ maynardRatio 2 (fun _ => 1) = 2 := by
  sorry

example : simplexG 0 2 5 = 1 := by
  sorry

/-- SV.4/ratio-smooth-approximation. A smooth function supported in `ℛ_k` comes within `δ`
of any admissible ratio. -/
theorem exists_smooth_maynardRatio_gt {k : ℕ} {F : (Fin k → ℝ) → ℝ}
    (hF : IsMaynardAdmissible k F) {δ : ℝ} (hδ : 0 < δ) :
    ∃ F₁ : (Fin k → ℝ) → ℝ, ContDiff ℝ ⊤ F₁ ∧ IsMaynardAdmissible k F₁ ∧
      0 < maynardI k F₁ ∧ maynardRatio k F - δ < maynardRatio k F₁ := by
  sorry

/-! ### Selberg sieve manipulations (Section 5) -/

/-- SV.4/gpy-positivity-criterion. If `∑ₙ (#{i : n + hᵢ prime} − ρ) wₙ > 0` with `wₙ ≥ 0`,
some `n ∈ [N, 2N)` has more than `ρ` of the `n + hᵢ` prime. -/
theorem exists_card_prime_gt_of_sum_pos (H : Finset ℕ) (N : ℕ) (w : ℕ → ℝ)
    (hw : ∀ n, 0 ≤ w n) (ρ : ℝ)
    (hpos : 0 < ∑ n ∈ Finset.Ico N (2 * N),
      (((H.filter fun h => (n + h).Prime).card : ℝ) - ρ) * w n) :
    ∃ n ∈ Finset.Ico N (2 * N), ρ < ((H.filter fun h => (n + h).Prime).card : ℝ) := by
  sorry

/-- SV.4/lambda-max-bound. Maynard (5.9): `λ_max ≤ y_max ∑_{u<R} μ²(u) τ_k(u)/φ(u)`. -/
theorem abs_maynardLambdaOfY_le {k W : ℕ} {R : ℝ} {y : (Fin k → ℕ) → ℝ}
    (hy : ∀ r, ¬ IsMaynardSupport k W R r → y r = 0) (ymax : ℝ) (hmax : ∀ r, |y r| ≤ ymax)
    (d : Fin k → ℕ) :
    |maynardLambdaOfY k R y d| ≤
      ymax * ∑ u ∈ (Finset.range ⌈R⌉₊).filter Squarefree,
        ((Fintype.piFinset fun _ : Fin k => u.divisors).filter
          (fun c => ∏ i, c i = u)).card / (u.totient : ℝ) := by
  sorry

/-- SV.4/s1-diagonalization. Maynard Lemma 5.1. -/
theorem sieveSumS1_diagonal (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) :
    ∃ C N₀ : ℝ, ∀ N : ℕ, N₀ ≤ N → ∀ (D₀ R : ℝ) (W v₀ : ℕ),
      D₀ = Real.log (Real.log (Real.log N)) → W = wModulus D₀ →
      v₀ = wResidue (Finset.univ.image h) D₀ → R = (N : ℝ) ^ (θ / 2 - δ) →
      ∀ (y : (Fin k → ℕ) → ℝ) (ymax : ℝ), (∀ r, ¬ IsMaynardSupport k W R r → y r = 0) →
        (∀ r, |y r| ≤ ymax) →
        |sieveSumS1 k W v₀ (maynardLambdaOfY k R y) h N -
            N / W * ∑ r ∈ Fintype.piFinset (fun _ : Fin k => Finset.range ⌈R⌉₊),
              y r ^ 2 / ∏ i, ((r i).totient : ℝ)| ≤
          C * ymax ^ 2 * (W.totient : ℝ) ^ k * N * Real.log R ^ k / (W ^ (k + 1) * D₀) := by
  sorry

/-- SV.4/s2-diagonalization. Maynard Lemma 5.2; the only place the level of distribution
enters. -/
theorem sieveSumS2_diagonal (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) (hk : 2 ≤ k) (hlevel : PrimesHaveLevel θ) (m : Fin k) (A : ℝ) (hA : 0 < A) :
    ∃ C N₀ : ℝ, ∀ N : ℕ, N₀ ≤ N → ∀ (D₀ R : ℝ) (W v₀ : ℕ),
      D₀ = Real.log (Real.log (Real.log N)) → W = wModulus D₀ →
      v₀ = wResidue (Finset.univ.image h) D₀ → R = (N : ℝ) ^ (θ / 2 - δ) →
      ∀ (y : (Fin k → ℕ) → ℝ) (ymax ymmax : ℝ),
        (∀ r, ¬ IsMaynardSupport k W R r → y r = 0) → (∀ r, |y r| ≤ ymax) →
        (∀ r, |maynardYm k m R (maynardLambdaOfY k R y) r| ≤ ymmax) →
        |sieveSumS2 k W v₀ m (maynardLambdaOfY k R y) h N -
            N / (W.totient * Real.log N) *
              ∑ r ∈ Fintype.piFinset (fun _ : Fin k => Finset.range ⌈R⌉₊),
                maynardYm k m R (maynardLambdaOfY k R y) r ^ 2 / ∏ i, maynardG (r i)| ≤
          C * (ymmax ^ 2 * (W.totient : ℝ) ^ (k - 2) * N * Real.log N ^ (k - 2) /
              (W ^ (k - 1) * D₀) + ymax ^ 2 * N / Real.log N ^ A) := by
  sorry

/-- SV.4/y-m-relation. Maynard Lemma 5.3: if `rₘ = 1`,
`y⁽ᵐ⁾_r = ∑_{aₘ} y_{r[m ↦ aₘ]}/φ(aₘ) + O(y_max φ(W) log R/(W D₀))`. -/
theorem maynardYm_sub_sum_le (k : ℕ) (m : Fin k) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) :
    ∃ C N₀ : ℝ, ∀ N : ℕ, N₀ ≤ N → ∀ (D₀ R : ℝ) (W : ℕ),
      D₀ = Real.log (Real.log (Real.log N)) → W = wModulus D₀ → R = (N : ℝ) ^ (θ / 2 - δ) →
      ∀ (y : (Fin k → ℕ) → ℝ) (ymax : ℝ), (∀ r, ¬ IsMaynardSupport k W R r → y r = 0) →
        (∀ r, |y r| ≤ ymax) → ∀ r : Fin k → ℕ, r m = 1 →
        |maynardYm k m R (maynardLambdaOfY k R y) r -
            ∑ a ∈ Finset.range ⌈R⌉₊, y (Function.update r m a) / (a.totient : ℝ)| ≤
          C * ymax * W.totient * Real.log R / (W * D₀) := by
  sorry

/-! ### Smooth choice of `y` (Section 6) -/

/-- SV.4/s1-asymptotic. Maynard Lemma 6.2. -/
theorem sieveSumS1_smooth (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) :
    ∃ C N₀ : ℝ, ∀ N : ℕ, N₀ ≤ N → ∀ (D₀ R : ℝ) (W v₀ : ℕ),
      D₀ = Real.log (Real.log (Real.log N)) → W = wModulus D₀ →
      v₀ = wResidue (Finset.univ.image h) D₀ → R = (N : ℝ) ^ (θ / 2 - δ) →
      ∀ (F : (Fin k → ℝ) → ℝ) (Fmax : ℝ), ContDiff ℝ 1 F →
        (∀ t, t ∉ maynardSimplex k → F t = 0) →
        (∀ t ∈ Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1),
          |F t| + ∑ i, |fderiv ℝ F t (Pi.single i 1)| ≤ Fmax) →
        |sieveSumS1 k W v₀ (maynardLambda k W R F) h N -
            (W.totient : ℝ) ^ k * N * Real.log R ^ k / W ^ (k + 1) * maynardI k F| ≤
          C * Fmax ^ 2 * (W.totient : ℝ) ^ k * N * Real.log R ^ k / (W ^ (k + 1) * D₀) := by
  sorry

/-- SV.4/s2-asymptotic. Maynard Lemma 6.3. -/
theorem sieveSumS2_smooth (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) (hlevel : PrimesHaveLevel θ) (m : Fin k) :
    ∃ C N₀ : ℝ, ∀ N : ℕ, N₀ ≤ N → ∀ (D₀ R : ℝ) (W v₀ : ℕ),
      D₀ = Real.log (Real.log (Real.log N)) → W = wModulus D₀ →
      v₀ = wResidue (Finset.univ.image h) D₀ → R = (N : ℝ) ^ (θ / 2 - δ) →
      ∀ (F : (Fin k → ℝ) → ℝ) (Fmax : ℝ), ContDiff ℝ 1 F →
        (∀ t, t ∉ maynardSimplex k → F t = 0) →
        (∀ t ∈ Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1),
          |F t| + ∑ i, |fderiv ℝ F t (Pi.single i 1)| ≤ Fmax) →
        |sieveSumS2 k W v₀ m (maynardLambda k W R F) h N -
            (W.totient : ℝ) ^ k * N * Real.log R ^ (k + 1) / (W ^ (k + 1) * Real.log N) *
              maynardJ k m F| ≤
          C * Fmax ^ 2 * (W.totient : ℝ) ^ k * N * Real.log R ^ k / (W ^ (k + 1) * D₀) := by
  sorry

/-- SV.4/maynard-sum-asymptotics. Maynard Proposition 4.1. -/
theorem tendsto_sieveSums (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) (θ δ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hδ : 0 < δ) (hlevel : PrimesHaveLevel θ) (F : (Fin k → ℝ) → ℝ) (hF : ContDiff ℝ ⊤ F)
    (hsupp : ∀ t, t ∉ maynardSimplex k → F t = 0) (hI : maynardI k F ≠ 0)
    (hJ : ∀ m, maynardJ k m F ≠ 0) (W v₀ : ℕ → ℕ) (R : ℕ → ℝ)
    (hW : ∀ N : ℕ, W N = wModulus (Real.log (Real.log (Real.log N))))
    (hv : ∀ N : ℕ, v₀ N = wResidue (Finset.univ.image h) (Real.log (Real.log (Real.log N))))
    (hR : ∀ N : ℕ, R N = (N : ℝ) ^ (θ / 2 - δ)) :
    Tendsto (fun N : ℕ => sieveSumS1 k (W N) (v₀ N) (maynardLambda k (W N) (R N) F) h N /
        ((W N).totient ^ k * N * Real.log (R N) ^ k / (W N) ^ (k + 1) * maynardI k F))
        atTop (𝓝 1) ∧
      ∀ m : Fin k, Tendsto (fun N : ℕ =>
        sieveSumS2 k (W N) (v₀ N) m (maynardLambda k (W N) (R N) F) h N /
          ((W N).totient ^ k * N * Real.log (R N) ^ (k + 1) /
            ((W N) ^ (k + 1) * Real.log N) * maynardJ k m F)) atTop (𝓝 1) := by
  sorry

/-- SV.4/maynard-many-primes. Maynard Proposition 4.2: at least `⌈θ M_k / 2⌉` of the
`n + hᵢ` are prime for infinitely many `n`. -/
theorem infinite_many_primes_of_level (θ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hlevel : PrimesHaveLevel θ) (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) :
    {n : ℕ | ⌈θ * maynardM k / 2⌉ ≤
      ((Finset.univ.filter fun i => (n + h i).Prime).card : ℤ)}.Infinite := by
  sorry

/-- SV.4/clustered-primes-to-gaps. Infinitely many `n` with `r` prime `n + h` give
`liminf (p_{n+r-1} − p_n) ≤ max H − min H`. -/
theorem frequently_nth_prime_sub_le (H : Finset ℕ) (hne : H.Nonempty) (r : ℕ) (hr : 1 ≤ r)
    (hinf : {n : ℕ | r ≤ (H.filter fun h => (n + h).Prime).card}.Infinite) :
    ∃ᶠ n in atTop,
      Nat.nth Nat.Prime (n + (r - 1)) - Nat.nth Nat.Prime n ≤ H.max' hne - H.min' hne := by
  sorry

/-! ### Lower bounds for `M_k` (Sections 7 and 8) -/

/-- SV.4/maynard-large-k-lower-bound. Maynard Proposition 4.3(3). -/
theorem eventually_log_sub_lt_maynardM :
    ∀ᶠ k : ℕ in atTop,
      Real.log k - 2 * Real.log (Real.log k) - 2 < maynardM k := by
  sorry

/-- SV.4/simplex-dirichlet-moment. Maynard (8.2) and (8.5): the moments of `1 − P₁` and
`P_j` on `ℛ_k`, in the multinomial form that includes `b = 0`. -/
theorem integral_simplex_moment (k a b j : ℕ) :
    (∫ t in maynardSimplex k, (1 - ∑ i, t i) ^ a * (∑ i, t i ^ j) ^ b) =
      (a.factorial * b.factorial : ℝ) / (k + a + j * b).factorial *
        ∑ c ∈ Finset.Nat.antidiagonalTuple k b,
          ∏ i, ((j * c i).factorial : ℝ) / (c i).factorial := by
  sorry

/-- SV.4/symmetric-polynomial-quadratic-forms. Maynard Lemma 8.2 for
`P = ∑ᵢ aᵢ (1 − P₁)^{bᵢ} P₂^{cᵢ}` on `ℛ_k`, with the corrected `G` (findings E31, E32). -/
theorem maynardI_J_symmetricPoly (k d : ℕ) (hk : 2 ≤ k) (a : Fin d → ℝ) (b c : Fin d → ℕ)
    (m : Fin k) :
    let P : (Fin k → ℝ) → ℝ := (maynardSimplex k).indicator fun t =>
      ∑ i, a i * (1 - ∑ j, t j) ^ b i * (∑ j, t j ^ 2) ^ c i
    maynardI k P = ∑ i, ∑ i', a i * a i' * ((b i + b i').factorial *
        (simplexG (c i + c i') 2 k : ℝ) / (k + b i + b i' + 2 * c i + 2 * c i').factorial) ∧
      maynardJ k m P = ∑ i, ∑ i', a i * a i' *
        ∑ c₁ ∈ Finset.range (c i + 1), ∑ c₂ ∈ Finset.range (c i' + 1),
          ((c i).choose c₁ * (c i').choose c₂ : ℝ) *
            ((b i).factorial * (b i').factorial * (2 * c i - 2 * c₁).factorial *
              (2 * c i' - 2 * c₂).factorial *
              (b i + b i' + 2 * c i + 2 * c i' - 2 * c₁ - 2 * c₂ + 2).factorial /
              ((b i + 2 * c i - 2 * c₁ + 1).factorial * (b i' + 2 * c i' - 2 * c₂ + 1).factorial)) *
            (simplexG (c₁ + c₂) 2 (k - 1) : ℝ) /
              (k + b i + b i' + 2 * c i + 2 * c i' + 1).factorial := by
  sorry

/-- SV.4/m5-lower-bound. Maynard Proposition 4.3(1): (8.16) gives `M₅ ≥ 1417255/708216`. -/
theorem maynardM_five_ge : (1417255 / 708216 : ℝ) ≤ maynardM 5 := by
  sorry

/-- SV.4/m105-lower-bound. Maynard Proposition 4.3(2). -/
theorem four_lt_maynardM_105 : 4 < maynardM 105 := by
  sorry

/-! ### Admissible tuples of small diameter and the main theorems -/

/-- SV.4/engelsma-admissible-105-tuple. Engelsma's tuple, quoted by Maynard (footnote 2). -/
theorem engelsma_tuple_admissible :
    let H : Finset ℕ := {0, 10, 12, 24, 28, 30, 34, 42, 48, 52, 54, 64, 70, 72, 78, 82, 90,
      94, 100, 112, 114, 118, 120, 124, 132, 138, 148, 154, 168, 174, 178, 180, 184, 190, 192,
      202, 204, 208, 220, 222, 232, 234, 250, 252, 258, 262, 264, 268, 280, 288, 294, 300, 310,
      322, 324, 328, 330, 334, 342, 352, 358, 360, 364, 372, 378, 384, 390, 394, 400, 402, 408,
      412, 418, 420, 430, 432, 442, 444, 450, 454, 462, 468, 472, 478, 484, 490, 492, 498, 504,
      510, 528, 532, 534, 538, 544, 558, 562, 570, 574, 580, 582, 588, 594, 598, 600}
    H.card = 105 ∧ IsAdmissible H ∧ 0 ∈ H ∧ 600 ∈ H ∧ ∀ x ∈ H, x ≤ 600 := by
  sorry

/-- SV.4/first-primes-above-k-admissible. The first `k` primes above `k` form an admissible
set whose diameter is `O(k log k)`. -/
theorem firstPrimesAbove_admissible :
    (∀ k : ℕ, IsAdmissible ((Finset.range k).image
      fun i => Nat.nth Nat.Prime (Nat.primeCounting k + i))) ∧
    ∃ C : ℝ, ∀ k : ℕ, 2 ≤ k →
      ((Nat.nth Nat.Prime (Nat.primeCounting k + k - 1) -
        Nat.nth Nat.Prime (Nat.primeCounting k) : ℕ) : ℝ) ≤ C * k * Real.log k := by
  sorry

/-- SV.4/bounded-gaps-600. Maynard Theorem 1.3: `liminf (p_{n+1} − p_n) ≤ 600`. -/
theorem frequently_nth_prime_succ_sub_le_600 :
    ∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 1) - Nat.nth Nat.Prime n ≤ 600 := by
  sorry

/-- SV.4/elliott-halberstam-gaps. Maynard Theorem 1.4. -/
theorem elliottHalberstam_gaps (hEH : ElliottHalberstam) :
    (∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 1) - Nat.nth Nat.Prime n ≤ 12) ∧
      ∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 2) - Nat.nth Nat.Prime n ≤ 600 := by
  sorry

/-- SV.4/m-primes-bounded-intervals. Maynard Theorem 1.1:
`liminf (p_{n+m} − p_n) ≪ m³ e^{4m}`. -/
theorem exists_frequently_nth_prime_sub_le :
    ∃ C : ℝ, ∀ m : ℕ, 1 ≤ m →
      ∃ᶠ n in atTop, ((Nat.nth Nat.Prime (n + m) - Nat.nth Nat.Prime n : ℕ) : ℝ) ≤
        C * m ^ 3 * Real.exp (4 * m) := by
  sorry

/-- SV.4/positive-proportion-prime-tuples. Maynard Theorem 1.2, for sets of natural numbers
(integer sets reduce to this by translation). -/
theorem positive_proportion_prime_tuples (m : ℕ) (hm : 1 ≤ m) :
    ∃ (r₀ : ℕ) (c : ℝ), 0 < c ∧ ∀ A : Finset ℕ, r₀ ≤ A.card →
      c * (A.card.choose m : ℝ) ≤
        (({B | B ∈ A.powersetCard m ∧ (primeTranslates B).Infinite} : Set (Finset ℕ)).ncard : ℝ) := by
  sorry

end SieveMaynard

/-! ## Quantitative sieve and Brun continuation
Concrete predicates are written out; they are not admitted opaque Prop packages.
The generic smooth-number Rankin count is requested from AN.5 and is not redeclared.
-/
namespace SieveQuantitative
open scoped BigOperators
attribute [local instance] Classical.propDecidable

def HasLogSieveDimension (P : Set ℕ) (g : ℕ → ℝ) (κ C : ℝ) : Prop := by
  classical
  exact ∀ z : ℝ, 2 ≤ z →
    (∑ p ∈ (Finset.range (Nat.floor z + 1)).filter (fun p => p.Prime ∧ p ∈ P),
      g p * Real.log p) ≤ κ * Real.log z + C

def HasProductSieveDimension (P : Set ℕ) (g : ℕ → ℝ) (κ K : ℝ) : Prop := by
  classical
  exact ∀ w z : ℝ, 2 ≤ w → w ≤ z →
    (∏ p ∈ (Finset.range (Nat.ceil z)).filter
      (fun p => p.Prime ∧ p ∈ P ∧ w ≤ (p : ℝ)), (1 - g p)⁻¹) ≤
        K * (Real.log z / Real.log w) ^ κ

def remainderMass (s : BoundingSieve) (D : ℝ) : ℝ :=
  ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) < D), |s.rem d|

def HasSieveLevel (F : ℝ → BoundingSieve) (θ : ℝ) : Prop :=
  0 < θ ∧ (∀ x : ℝ, 2 ≤ x → 0 ≤ (F x).totalMass) ∧
    ∀ A : ℝ, 0 < A → ∃ B C x₀ : ℝ,
      0 < B ∧ 0 < C ∧ 2 ≤ x₀ ∧ ∀ x : ℝ, x₀ ≤ x →
        remainderMass (F x) (x ^ θ / (Real.log x) ^ B) ≤
          C * (F x).totalMass / (Real.log x) ^ A

theorem HasLogSieveDimension.mono_constant {P g κ C C' }
    (h : HasLogSieveDimension P g κ C) (hC : C ≤ C') :
    HasLogSieveDimension P g κ C' := by sorry
theorem HasLogSieveDimension.mono_dimension {P g κ κ' C}
    (h : HasLogSieveDimension P g κ C) (hκ : κ ≤ κ') :
    HasLogSieveDimension P g κ' C := by sorry
theorem HasLogSieveDimension.mono_density {P g h κ C}
    (hg : HasLogSieveDimension P g κ C)
    (hcomp : ∀ p : ℕ, p.Prime → p ∈ P → h p ≤ g p) :
    HasLogSieveDimension P h κ C := by sorry
theorem hasLogSieveDimension_empty (g : ℕ → ℝ) {κ C : ℝ}
    (hκ : 0 ≤ κ) (hC : 0 ≤ C) : HasLogSieveDimension ∅ g κ C := by sorry

theorem HasProductSieveDimension.mono_constant {P g κ K K'}
    (h : HasProductSieveDimension P g κ K) (hK : K ≤ K') :
    HasProductSieveDimension P g κ K' := by sorry
theorem HasProductSieveDimension.mono_dimension {P g κ κ' K}
    (h : HasProductSieveDimension P g κ K) (hK : 0 ≤ K) (hκ : κ ≤ κ') :
    HasProductSieveDimension P g κ' K := by sorry
theorem HasProductSieveDimension.interval_bound {P g κ K w z}
    (h : HasProductSieveDimension P g κ K) (hw : 2 ≤ w) (hwz : w ≤ z) :
    (∏ p ∈ (Finset.range (Nat.ceil z)).filter
      (fun p => p.Prime ∧ p ∈ P ∧ w ≤ (p : ℝ)), (1 - g p)⁻¹) ≤
        K * (Real.log z / Real.log w) ^ κ := by
  classical
  sorry
theorem hasProductSieveDimension_zero_density (P : Set ℕ) {κ K : ℝ}
    (hκ : 0 ≤ κ) (hK : 1 ≤ K) :
    HasProductSieveDimension P (fun _ => 0) κ K := by sorry

theorem remainderMass_nonneg (s : BoundingSieve) (D : ℝ) :
    0 ≤ remainderMass s D := by sorry
theorem remainderMass_mono (s : BoundingSieve) {D E : ℝ} (h : D ≤ E) :
    remainderMass s D ≤ remainderMass s E := by sorry
theorem remainderMass_of_le_one (s : BoundingSieve) {D : ℝ} (h : D ≤ 1) :
    remainderMass s D = 0 := by sorry
theorem remainderMass_eq_of_remainders (s t : BoundingSieve) (D : ℝ)
    (hP : s.prodPrimes = t.prodPrimes)
    (hR : ∀ d ∈ s.prodPrimes.divisors, s.rem d = t.rem d) :
    remainderMass s D = remainderMass t D := by sorry
/-- SV.0/coefficient-error-remainder-mass, promoted API. -/
theorem errSum_le_remainderMass (s : BoundingSieve) (c : ℕ → ℝ) {D L : ℝ}
    (hL : 0 ≤ L) (hb : ∀ d ∈ s.prodPrimes.divisors, |c d| ≤ L)
    (hs : ∀ d ∈ s.prodPrimes.divisors, D ≤ (d : ℝ) → c d = 0) :
    s.errSum c ≤ L * remainderMass s D := by sorry

theorem HasSieveLevel.bound {F θ} (h : HasSieveLevel F θ) {A : ℝ} (hA : 0 < A) :
    ∃ B C x₀ : ℝ, 0 < B ∧ 0 < C ∧ 2 ≤ x₀ ∧ ∀ x : ℝ, x₀ ≤ x →
      remainderMass (F x) (x ^ θ / (Real.log x) ^ B) ≤
        C * (F x).totalMass / (Real.log x) ^ A := by sorry
theorem HasSieveLevel.mono {F θ η} (h : HasSieveLevel F θ)
    (hη : 0 < η) (hηθ : η ≤ θ) : HasSieveLevel F η := by sorry
theorem HasSieveLevel.mass_nonneg {F θ} (h : HasSieveLevel F θ) {x : ℝ}
    (hx : 2 ≤ x) : 0 ≤ (F x).totalMass := by sorry
theorem hasSieveLevel_of_zero_remainders (F : ℝ → BoundingSieve) {θ : ℝ}
    (hθ : 0 < θ) (hm : ∀ x : ℝ, 2 ≤ x → 0 ≤ (F x).totalMass)
    (hR : ∀ x : ℝ, 2 ≤ x → ∀ d ∈ (F x).prodPrimes.divisors, (F x).rem d = 0) :
    HasSieveLevel F θ := by sorry

/-- SV.0/density-euler-moment. -/
theorem density_euler_moment (s : BoundingSieve) (a : ℝ) :
    (∑ d ∈ s.prodPrimes.divisors, s.nu d * (d : ℝ) ^ a) =
      ∏ p ∈ s.prodPrimes.primeFactors, (1 + s.nu p * (p : ℝ) ^ a) := by sorry
/-- SV.0/rankin-weighted-prefix. -/
theorem rankin_weighted_prefix (s : BoundingSieve) {x σ : ℝ}
    (hx : 0 < x) (hσ : 0 ≤ σ) :
    (∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) ≤ x), (d : ℝ) * s.nu d) ≤
      x ^ σ * ∏ p ∈ s.prodPrimes.primeFactors,
        (1 + s.nu p * (p : ℝ) ^ (1 - σ)) := by sorry
/-- SV.0/rankin-weighted-tail. -/
theorem rankin_weighted_tail (s : BoundingSieve) {x a : ℝ}
    (hx : 0 < x) (ha : 0 ≤ a) :
    (∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => x < (d : ℝ)), s.nu d) ≤
      x ^ (-a) * ∏ p ∈ s.prodPrimes.primeFactors,
        (1 + s.nu p * (p : ℝ) ^ a) := by sorry
/-- SV.0/log-dimension-euler-bound. -/
theorem log_dimension_euler_bound (P : Set ℕ) (g : ℕ → ℝ) {κ C : ℝ}
    (hκ : 0 < κ) (hC : 0 ≤ C)
    (hg : ∀ p : ℕ, p.Prime → p ∈ P → 0 ≤ g p)
    (hd : HasLogSieveDimension P g κ C) :
    ∃ K z₀ : ℝ, 0 < K ∧ Real.exp 2 ≤ z₀ ∧ ∀ z : ℝ, z₀ ≤ z →
      (∏ p ∈ (Finset.range (Nat.floor z + 1)).filter (fun p => p.Prime ∧ p ∈ P),
        (1 + g p * (p : ℝ) ^ (1 / Real.log z))) ≤ K * (Real.log z) ^ κ := by
  classical
  sorry
/-- SV.0/dimension-divisor-count. -/
theorem dimension_divisor_count (P : Set ℕ) (g : ℕ → ℝ) {κ C : ℝ}
    (hκ : 0 < κ) (hC : 0 ≤ C)
    (hg : ∀ p : ℕ, p.Prime → p ∈ P → 0 ≤ g p)
    (hd : HasLogSieveDimension P g κ C) :
    ∃ K z₀ : ℝ, 0 < K ∧ Real.exp 2 ≤ z₀ ∧ ∀ z : ℝ, z₀ ≤ z →
      ∀ x : ℝ, 0 < x → ∀ s : BoundingSieve,
        (∀ p : ℕ, p ∈ s.prodPrimes.primeFactors ↔ p.Prime ∧ p ∈ P ∧ (p : ℝ) ≤ z) →
        (∀ p ∈ s.prodPrimes.primeFactors, s.nu p = g p) →
          (∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) ≤ x), (d : ℝ) * s.nu d) ≤
            K * x * (Real.log z) ^ κ * Real.exp (-Real.log x / Real.log z) := by sorry
/-- SV.0/dimension-divisor-tail. -/
theorem dimension_divisor_tail (P : Set ℕ) (g : ℕ → ℝ) {κ C : ℝ}
    (hκ : 0 < κ) (hC : 0 ≤ C)
    (hg : ∀ p : ℕ, p.Prime → p ∈ P → 0 ≤ g p)
    (hd : HasLogSieveDimension P g κ C) :
    ∃ K z₀ : ℝ, 0 < K ∧ Real.exp 2 ≤ z₀ ∧ ∀ z : ℝ, z₀ ≤ z →
      ∀ x : ℝ, 0 < x → ∀ s : BoundingSieve,
        (∀ p : ℕ, p ∈ s.prodPrimes.primeFactors ↔ p.Prime ∧ p ∈ P ∧ (p : ℝ) ≤ z) →
        (∀ p ∈ s.prodPrimes.primeFactors, s.nu p = g p) →
          (∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => x < (d : ℝ)), s.nu d) ≤
            K * (Real.log z) ^ κ * Real.exp (-Real.log x / Real.log z) := by sorry
/-- SV.0/eratosthenes-mass-cutoff. -/
theorem eratosthenes_mass_cutoff (s : BoundingSieve) {x c M σ : ℝ}
    (hx : 0 < x) (hc : 0 ≤ c) (hM : 0 ≤ M) (hσ : 0 < σ) (hσ1 : σ < 1)
    (hX : 0 ≤ s.totalMass) (hXm : s.totalMass ≤ M * x)
    (hR : ∀ d ∈ s.prodPrimes.divisors, (d : ℝ) ≤ x → |s.rem d| ≤ c * d * s.nu d)
    (hA : ∀ d ∈ s.prodPrimes.divisors, x < (d : ℝ) → s.multSum d = 0) :
    |s.siftedSum - s.totalMass * (∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p))| ≤
      (c + M) * x ^ σ * ∏ p ∈ s.prodPrimes.primeFactors,
        (1 + s.nu p * (p : ℝ) ^ (1 - σ)) := by sorry

/-! New definition examples; these are typed specifications, not proof receipts. -/
/-- dimension_empty -/
example : HasLogSieveDimension ∅ (fun _ => 0) 0 0 := by sorry
/-- dimension_negative_constant -/
example : ¬ HasLogSieveDimension ∅ (fun _ => 0) 0 (-1) := by sorry
/-- dimension_single_prime -/
example : HasLogSieveDimension {2} (fun _ => 1/2) 0 (Real.log 2 / 2) := by sorry
/-- dimension_single_cutoff_not_uniform -/
example : ¬ HasLogSieveDimension Set.univ (fun p => if p = 3 then 1 else 0) 0 0 := by sorry
/-- product_dimension_zero -/
example : HasProductSieveDimension Set.univ (fun _ => 0) 0 1 := by sorry
/-- product_dimension_diagonal -/
example : ¬ HasProductSieveDimension ∅ (fun _ => 0) 0 (1/2) := by sorry
/-- product_dimension_endpoint -/
example : ((1 - (1/2 : ℝ))⁻¹) = 2 := by sorry
/-- product_dimension_unit_density -/
example : HasProductSieveDimension {2} (fun _ => 1) 0 1 := by sorry
/-- remainder_mass_endpoint -/
example (s : BoundingSieve) (hP : s.prodPrimes = 6)
    (hR : ∀ d ∈ s.prodPrimes.divisors, s.rem d = 1) :
    remainderMass s 6 = 3 ∧ remainderMass s 7 = 4 := by sorry
/-- remainder_mass_signed -/
example (s : BoundingSieve) (hP : s.prodPrimes = 6)
    (h1 : s.rem 1 = 0) (h2 : s.rem 2 = 1) (h3 : s.rem 3 = -1) :
    remainderMass s 4 = 2 := by sorry
/-- remainder_mass_mass_error -/
example (s : BoundingSieve) (hP : s.prodPrimes = 1) :
    remainderMass s 2 = |s.multSum 1 - s.totalMass| := by sorry
/-- remainder_mass_negative_cutoff -/
example (s : BoundingSieve) : remainderMass s (-3) = 0 := by sorry
/-- family_level_exact -/
example (F : ℝ → BoundingSieve) (hm : ∀ x : ℝ, 2 ≤ x → 0 ≤ (F x).totalMass)
    (hR : ∀ x : ℝ, 2 ≤ x → ∀ d ∈ (F x).prodPrimes.divisors, (F x).rem d = 0) :
    HasSieveLevel F 1 := by sorry
/-- family_level_zero -/
example (F : ℝ → BoundingSieve) : ¬ HasSieveLevel F 0 := by sorry
/-- family_level_fixed_mass_error -/
example (F : ℝ → BoundingSieve) (hX : ∀ x : ℝ, 2 ≤ x → (F x).totalMass = 1)
    (hR : ∀ x : ℝ, 2 ≤ x → |(F x).rem 1| = 1) {θ : ℝ} :
    ¬ HasSieveLevel F θ := by sorry
/-- family_level_zero_mass -/
example (F : ℝ → BoundingSieve) (hm : ∀ x : ℝ, 2 ≤ x → (F x).totalMass = 0)
    (hR : ∀ x : ℝ, 2 ≤ x → ∀ d ∈ (F x).prodPrimes.divisors, (F x).rem d = 0) :
    HasSieveLevel F 1 := by sorry
end SieveQuantitative

namespace SieveBrun
open scoped ArithmeticFunction.Moebius BigOperators

def brunCoefficients (P : ℕ) (y β : ℝ) (parity d : ℕ) : ℝ := by
  classical
  let ps := d.primeFactors.sort (· ≥ ·)
  exact if d ∈ P.divisors ∧ ∀ m ∈ Finset.Icc 1 ps.length, m % 2 = parity →
    ((ps.getD (m-1) 0 : ℕ) : ℝ) <
      (y / ((ps.take m).prod : ℝ)) ^ (1/β)
    then (μ d : ℝ) else 0

theorem brunCoefficients_one {P : ℕ} (hP : Squarefree P) {y β : ℝ}
    (hy : 1 < y) (ε : ℕ) : brunCoefficients P y β ε 1 = 1 := by sorry
theorem brunCoefficients_of_not_dvd {P d : ℕ} (h : d ∉ P.divisors)
    (y β : ℝ) (ε : ℕ) : brunCoefficients P y β ε d = 0 := by sorry
theorem abs_brunCoefficients_le_one (P d ε : ℕ) (y β : ℝ) :
    |brunCoefficients P y β ε d| ≤ 1 := by sorry
theorem brunCoefficients_support_lt {P d ε : ℕ} (hP : Squarefree P)
    (hε : ε = 0 ∨ ε = 1) {y z β : ℝ} (hy : 1 < y) (hβ : 1 < β)
    (hz : z ≤ y) (hp : ∀ p ∈ P.primeFactors, (p : ℝ) < z)
    (hd : brunCoefficients P y β ε d ≠ 0) : (d : ℝ) < y := by sorry

theorem brun_divisor_brackets {P r : ℕ} (hP : Squarefree P) (hr : r ∣ P)
    {y β : ℝ} (hy : 1 < y) (hβ : 1 < β) :
    (∑ d ∈ r.divisors, brunCoefficients P y β 0 d) ≤
      (if r = 1 then (1 : ℝ) else 0) ∧
    (if r = 1 then (1 : ℝ) else 0) ≤
      ∑ d ∈ r.divisors, brunCoefficients P y β 1 d := by sorry

theorem brun_main_term_bounds (s : BoundingSieve) {κ K u y z : ℝ}
    (hκ : 0 < κ) (hK : 1 < K) (hu : 9*κ+1 ≤ u) (hy : 1 < y)
    (hz : z = y ^ (1/u)) (hp : ∀ p ∈ s.prodPrimes.primeFactors, (p : ℝ) < z)
    (hd : SieveQuantitative.HasProductSieveDimension
      {p | p ∈ s.prodPrimes.primeFactors} s.nu κ K) :
    let V := ∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p)
    let δ := Real.exp (9*κ+1-u) * K^10
    (1-δ)*V ≤ s.mainSum (brunCoefficients s.prodPrimes y (9*κ+1) 0) ∧
      s.mainSum (brunCoefficients s.prodPrimes y (9*κ+1) 0) ≤ V ∧
      V ≤ s.mainSum (brunCoefficients s.prodPrimes y (9*κ+1) 1) ∧
      s.mainSum (brunCoefficients s.prodPrimes y (9*κ+1) 1) ≤ (1+δ)*V := by
  classical
  sorry

theorem brun_fundamental_estimate (s : BoundingSieve) {κ K u y z : ℝ}
    (hκ : 0 < κ) (hK : 1 < K) (hu : 9*κ+1 ≤ u) (hy : 1 < y)
    (hz : z = y ^ (1/u)) (hp : ∀ p ∈ s.prodPrimes.primeFactors, (p : ℝ) < z)
    (hd : SieveQuantitative.HasProductSieveDimension
      {p | p ∈ s.prodPrimes.primeFactors} s.nu κ K) (hX : 0 ≤ s.totalMass) :
    let V := ∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p)
    let δ := Real.exp (9*κ+1-u) * K^10
    (1-δ)*V*s.totalMass - SieveQuantitative.remainderMass s y ≤ s.siftedSum ∧
      s.siftedSum ≤ (1+δ)*V*s.totalMass + SieveQuantitative.remainderMass s y := by
  classical
  sorry

/-- brun_no_primes -/
example : brunCoefficients 1 2 2 0 1 = 1 ∧ brunCoefficients 1 2 2 1 1 = 1 := by sorry
/-- brun_prefix_retained -/
example : brunCoefficients 6 100 2 0 6 = 1 ∧ brunCoefficients 6 100 2 1 6 = 1 := by sorry
/-- brun_lower_parity -/
example : (∑ d ∈ (6 : ℕ).divisors, brunCoefficients 6 4 2 0 d) = -1 := by sorry
/-- brun_strict_boundary -/
example : brunCoefficients 2 8 2 1 2 = 0 := by sorry
end SieveBrun

namespace SieveAlmostPrime
theorem rough_to_at_most_almost_prime {z n k : ℕ} (hz : 2 ≤ z) (hn : n ≠ 0)
    (hsmall : n < z^(k+1)) (hrough : ∀ p : ℕ, p.Prime → p ∣ n → z ≤ p) :
    Nat.IsAtMostAlmostPrime k n := by sorry
example : Nat.IsAtMostAlmostPrime 0 1 := by sorry
example : ¬ Nat.IsAtMostAlmostPrime 2 8 := by sorry
example : Nat.IsAtMostAlmostPrime 2 25 := by sorry
example : ¬ Nat.IsAtMostAlmostPrime 100 0 := by sorry
end SieveAlmostPrime
