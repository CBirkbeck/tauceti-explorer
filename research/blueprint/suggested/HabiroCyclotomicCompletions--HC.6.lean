import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
HabiroCyclotomicCompletions--HC.6.md is definitive. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.
All examples are specifications, proved by `sorry`; nothing is implemented here.

HC.6 imports the three HC.6 nodes of HabiroCyclotomicCompletions.json. It owns
no new definition or theorem. The local notations below spell out the imported
HC.1 factorial polynomials and the finite representatives of the imported
HC.6 examples using existing Mathlib polynomials. They introduce no completion
type. Infinite evaluation, injectivity and component decompositions remain
statements of their HC.1–HC.5 owners, not substitutes defined in this file.
-/

open Polynomial
open scoped BigOperators

namespace HabiroCyclotomicCompletionsAcceptance

section Integer

local notation "P" =>
  (fun N : ℕ => ∏ i ∈ Finset.Icc 1 N, (1 - (X : ℤ[X]) ^ i))
local notation "F" => (fun N : ℕ => ∑ n ∈ Finset.range N, P n)
local notation "U" => (fun N : ℕ => ∑ n ∈ Finset.range N, (X : ℤ[X]) ^ n * P n)

-- Imported HC.1/the-factorial-polynomials; empty precision and sign convention.
example : P 0 = 1 := by sorry
example : F 0 = 0 := by sorry
example : F 1 = 1 := by sorry
example : (P 3).leadingCoeff = -1 := by sorry
example : (P 4).Monic := by sorry

-- Imported HC.2/algorithms-on-expansions: finite quotient compatibility.
example (N M : ℕ) (h : N ≤ M) : P N ∣ F M - F N := by sorry
example (N : ℕ) : (X : ℤ[X]) * U N = 1 - P N := by sorry
example : P 4 ∣ F 4 * U 4 -
    (∑ n ∈ Finset.range 4, C (Int.ofNat (n + 1)) * (X : ℤ[X]) ^ n * P n) := by
  sorry
example : (F 4 ^ 2) %ₘ P 4 =
    (1 + (3 - X) * P 1 + (6 - 3 * X - X ^ 2) * P 2 +
      (7 - 4 * X - 4 * X ^ 2 + 2 * X ^ 3) * P 3) %ₘ P 4 := by
  sorry

-- Imported HC.6/the-acceptance-examples: values in the integral cyclotomic rings.
example : (F 1).eval 1 = 1 := by sorry
example : (F 2).eval (-1) = 3 := by sorry
example : AdjoinRoot.mk (cyclotomic 3 ℤ) (F 3) =
    5 - AdjoinRoot.root (cyclotomic 3 ℤ) := by sorry
example : AdjoinRoot.mk (cyclotomic 4 ℤ) (F 4) =
    8 - 3 * AdjoinRoot.root (cyclotomic 4 ℤ) := by sorry
example : AdjoinRoot.mk (cyclotomic 5 ℤ) (F 5) =
    9 - 5 * AdjoinRoot.root (cyclotomic 5 ℤ) -
      3 * AdjoinRoot.root (cyclotomic 5 ℤ) ^ 2 := by sorry
example : AdjoinRoot.mk (cyclotomic 6 ℤ) (F 6) =
    17 - 13 * AdjoinRoot.root (cyclotomic 6 ℤ) := by sorry

-- Imported HC.3/the-taylor-map: Hasse coefficients, not divided derivatives.
example : (taylor (1 : ℤ) (F 10)).coeff 9 = -31240 := by sorry
example : (taylor (-1 : ℤ) (F 10)).coeff 4 = 7085 := by sorry
example : (F 2).eval 1 = (1 : ℤ[X]).eval 1 ∧
    (taylor (1 : ℤ) (F 2)).coeff 1 = -1 ∧
    (taylor (1 : ℤ) (1 : ℤ[X])).coeff 1 = 0 := by sorry

-- Imported HC.2/invertibility-of-q and HC.6/the-acceptance-examples.
example : ((1 - X : ℤ[X]) * X) = 1 - cyclotomic 6 ℤ := by sorry
example : ¬ IsUnit (1 - X : ℤ[X]) := by sorry
example : (1 - X : ℤ[X]).eval (-1) = 2 := by sorry
example (N : ℕ) : (∑ n ∈ Finset.range N, (X : ℤ[X]) ^ n).eval 1 = (N : ℤ) := by
  sorry

end Integer

section Precision

variable {R : Type*} [CommRing R]
local notation "P" =>
  (fun N : ℕ => ∏ i ∈ Finset.Icc 1 N, (1 - (X : R[X]) ^ i))
local notation "F" => (fun N : ℕ => ∑ n ∈ Finset.range N, P n)

-- The precision condition only needs ζ^d = 1; primitivity gives the exact order
-- in characteristic zero. The positive-order hypothesis excludes d = 0.
example (ζ : R) (d k N : ℕ) (hd : 0 < d) (hζ : ζ ^ d = 1)
    (hN : d * (k + 1) ≤ N) : (X - C ζ) ^ (k + 1) ∣ P N := by
  sorry
example (ζ : R) (d k N M : ℕ) (hd : 0 < d) (hζ : ζ ^ d = 1)
    (hN : d * (k + 1) ≤ N) (hNM : N ≤ M) :
    (taylor ζ (F M)).coeff k = (taylor ζ (F N)).coeff k := by
  sorry

end Precision

section InvertTwo

variable {S : Type*} [CommRing S] [Algebra ℤ S] [IsLocalization.Away (2 : ℤ) S]
local notation "b" => IsLocalization.Away.invSelf (S := S) (2 : ℤ)
local notation "P" =>
  (fun N : ℕ => ∏ i ∈ Finset.Icc 1 N, (1 - (X : S[X]) ^ i))
local notation "e₂" => (C (b ^ 2) * (3 + 2 * X - X ^ 2) : S[X])
local notation "e₃" =>
  (C (b ^ 3) * (7 + 2 * X - X ^ 2 + X ^ 3 - 2 * X ^ 4 + X ^ 5) : S[X])

-- Imported HC.6/inverted-prime-and-rational-examples, in the actual localization.
example : (2 : S) * b = 1 := by sorry
example : P 2 ∣ e₃ - e₂ := by sorry
example : P 3 ∣ e₃ ^ 2 - e₃ := by sorry
example : (X - 1) ^ 3 * cyclotomic 3 S ∣ e₃ - 1 := by sorry
example : cyclotomic 2 S ∣ e₃ := by sorry
example : (1 - e₃).eval (-1) = 1 ∧
    (taylor (1 : S) (1 - e₃)).coeff 0 = 0 ∧
    (taylor (1 : S) (1 - e₃)).coeff 1 = 0 ∧
    (taylor (1 : S) (1 - e₃)).coeff 2 = 0 := by sorry

end InvertTwo

section Rational

local notation "P" =>
  (fun N : ℕ => ∏ i ∈ Finset.Icc 1 N, (1 - (X : ℚ[X]) ^ i))
local notation "e₁" =>
  (C (1 / 72 : ℚ) * (47 + 42 * X + 7 * X ^ 2 - 23 * X ^ 3 -
    18 * X ^ 4 + 17 * X ^ 5) : ℚ[X])
local notation "t" =>
  (C (1 / 12 : ℚ) * (-5 - 2 * X + 3 * X ^ 2 + 5 * X ^ 3 +
    2 * X ^ 4 - 3 * X ^ 5) : ℚ[X])

-- This is the classical completion with coefficients ℚ. HB.6 owns the
-- arithmetic Habiro ring attached to the number field ℚ, with integral coefficients.
example : P 3 ∣ e₁ ^ 2 - e₁ := by sorry
example : P 3 ∣ (X - 1) * e₁ - t := by sorry
example : (taylor (1 : ℚ) t).coeff 0 = 0 ∧
    (taylor (1 : ℚ) t).coeff 1 = 1 ∧
    (taylor (1 : ℚ) t).coeff 2 = 0 := by sorry
example : cyclotomic 2 ℚ * cyclotomic 3 ℚ ∣ t := by sorry
example : ¬ P 3 ∣ t := by sorry

end Rational

section ModTwo

local notation "P" =>
  (fun N : ℕ => ∏ i ∈ Finset.Icc 1 N, (1 - (X : (ZMod 2)[X]) ^ i))
local notation "e" => (X ^ 5 + X + 1 : (ZMod 2)[X])

-- Imported HC.5/the-completed-module and HC.6/inverted-prime-and-rational-examples.
example : P 3 = (X + 1) ^ 4 * cyclotomic 3 (ZMod 2) := by sorry
example : P 3 ∣ e ^ 2 - e := by sorry
example : (X + 1) ^ 4 ∣ e - 1 := by sorry
example : cyclotomic 3 (ZMod 2) ∣ e := by sorry

end ModTwo

end HabiroCyclotomicCompletionsAcceptance
