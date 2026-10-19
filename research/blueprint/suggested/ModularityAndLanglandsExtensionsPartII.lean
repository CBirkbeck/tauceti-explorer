import Mathlib.NumberTheory.Multiplicity
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.NumberTheory.Bertrand
import Mathlib.Algebra.Order.Group.Unbundled.Abs

/-!
# Modularity, automorphy and Langlands endpoint extensions, Part II: the proof of symmetric power functoriality

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ModularityAndLanglandsExtensionsPartII.md` is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry` or by a short computation, and nothing here is an
implementation claim.

The carriers of almost every target (eigenvarieties, pseudocharacter spaces, automorphic
representations of definite unitary groups, patched modules) are not in Mathlib or Tau Ceti at the
pinned commits, so those targets are README targets. What is stated here is the elementary layer
the README's checks rest on:

* the symmetric-power refinement parameters and n-regularity (SP.1, parent §1.1);
* the 2-adic weight valuations on the Buzzard–Kilford boundary annulus and the ping-pong index
  (SP.3);
* the Fourier coefficients of the CM form σ₀ of weight 5 and level Γ₁(4) (SP.7);
* the non-regular discriminant for n = 2 (SP.8);
* the numerical side of the seasoned condition (SP.10) and of the Bertrand step of the induction
  on n (SP.13).
-/

namespace TauCeti.SymmetricPowerMethod

/-! ## SP.1: symmetric-power refinement parameters and n-regularity -/

/-- The refinement parameters of `Sym^{n-1}` of a refinement `(α, β)`:
`(α^{n-1}, α^{n-2} β, …, β^{n-1})` (Newton–Thorne I §2.18.1, the map `σ_{n,p}`). -/
def symPowerParameters {M : Type*} [Monoid M] (n : ℕ) (α β : M) : List M :=
  (List.range n).map fun i => α ^ (n - 1 - i) * β ^ i

/-- A ratio `x = α/β` is `n`-regular if `x ^ i ≠ 1` for `1 ≤ i ≤ n - 1`
(Newton–Thorne I Definition 2.23; parent §1.1). -/
def IsNRegular {G : Type*} [Monoid G] (n : ℕ) (x : G) : Prop :=
  ∀ i : ℕ, 1 ≤ i → i ≤ n - 1 → x ^ i ≠ 1

theorem symPowerParameters_length {M : Type*} [Monoid M] (n : ℕ) (α β : M) :
    (symPowerParameters n α β).length = n := by
  simp [symPowerParameters]

/-- The parameters of `Sym^{n-1}` are pairwise distinct exactly when `α/β` is `n`-regular. -/
theorem symPowerParameters_nodup_iff {G : Type*} [CommGroup G] (n : ℕ) (α β : G) :
    (symPowerParameters n α β).Nodup ↔ IsNRegular n (α / β) := by
  sorry

example {M : Type*} [CommMonoid M] (α β : M) :
    symPowerParameters 3 α β = [α ^ 2, α * β, β ^ 2] := by
  simp [symPowerParameters, List.range_succ]

/-- `n = 1`: there is one parameter and the regularity condition is empty. -/
example {G : Type*} [Monoid G] (x : G) : IsNRegular 1 x := by
  intro i h1 h2; omega

/-- A ratio of order two is not 3-regular: `α = 1, β = -1` gives equal first and last
parameters of `Sym²` (the parent's check for §4.3). -/
example : ¬ IsNRegular 3 (-1 : ℚˣ) := by
  intro h
  exact h 2 (by norm_num) (by norm_num) (by norm_num)

/-! ## SP.3: the 2-adic boundary annulus -/

/-- `v₂(5^j - 1) = 2` for odd `j`: classical weights of odd `k` with trivial wild character lie
over the boundary annulus `{|8| < |w| < 1}` with `v₂(w) = 2`. -/
theorem padicValNat_five_pow_sub_one_of_odd {j : ℕ} (hj : Odd j) :
    padicValNat 2 (5 ^ j - 1) = 2 := by
  sorry

/-- `v₂(5^j - 1) = 2 + v₂(j)` for even `j ≠ 0` (lifting the exponent,
`padicValNat.pow_two_sub_one`): even `k` with trivial wild character is outside the annulus. -/
theorem padicValNat_five_pow_sub_one_of_even {j : ℕ} (hj : Even j) (h0 : j ≠ 0) :
    padicValNat 2 (5 ^ j - 1) = 2 + padicValNat 2 j := by
  have h := padicValNat.pow_two_sub_one (x := 5) (n := j) (by norm_num) (by decide) h0 hj
  have h6 : padicValNat 2 (5 + 1) = 1 := by
    rw [show (5 : ℕ) + 1 = 2 * 3 from rfl, padicValNat.mul (by norm_num) (by norm_num),
      padicValNat.self (by norm_num), padicValNat.eq_zero_of_not_dvd (by norm_num)]
  have h4 : padicValNat 2 (5 - 1) = 2 := by
    rw [show (5 : ℕ) - 1 = 2 ^ 2 from rfl, padicValNat.prime_pow]
  omega

example : padicValNat 2 (5 ^ 1 - 1) = 2 := by
  rw [show (5 : ℕ) ^ 1 - 1 = 2 ^ 2 from rfl, padicValNat.prime_pow]

example : padicValNat 2 (5 ^ 2 - 1) = 3 := by
  rw [show (5 : ℕ) ^ 2 - 1 = 2 ^ 3 * 3 from rfl, padicValNat.mul (by norm_num) (by norm_num),
    padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)]

/-- The ping-pong index (Newton–Thorne I Lemma 3.7): for the weight `k' = 2i + 2^{m+1} - 1`,
`v₂(w) = 2` and the twin of a point of `X_i` lies on `X_{i'}` with
`i' = (k' - 1)/2 - i = 2^m - 1`. -/
theorem pingPong_index (i m : ℕ) :
    (2 * i + 2 ^ (m + 1) - 1 - 1) / 2 - i = 2 ^ m - 1 := by
  have h1 : 1 ≤ 2 ^ m := Nat.one_le_two_pow
  rw [pow_succ]
  generalize 2 ^ m = t at *
  omega

/-- The twin relation on an annulus: `i + i' = (k - 1)/v₂(w)` (Lemma 3.3, corrected as E1). -/
example : (3 - 1) / 2 = 1 := by norm_num

/-! ## SP.7: the CM form σ₀ of weight 5 and level Γ₁(4) -/

/-- The value at a Gaussian integer `α` of the Hecke character of `ℚ(i)` of ∞-type `(4, 0)`
attached to σ₀: `(α) ↦ α⁴` (well defined because units have fourth power one). -/
def sigmaZeroCharacter (α : GaussianInt) : GaussianInt := α ^ 4

/-- The Fourier coefficient of `f₀` at a split prime `ℓ = α ᾱ`: `a_ℓ = α⁴ + ᾱ⁴`. -/
def sigmaZeroCoeffSplit (α : GaussianInt) : ℤ :=
  (sigmaZeroCharacter α + sigmaZeroCharacter (star α)).re

/-- `a₅(f₀) = (2 + i)⁴ + (2 - i)⁴ = -14`. -/
example : sigmaZeroCoeffSplit ⟨2, 1⟩ = -14 := by decide

/-- `a₂(f₀) = (1 + i)⁴ = -4` (2 ramifies in `ℚ(i)`, one prime above it). -/
example : sigmaZeroCharacter ⟨1, 1⟩ = ⟨-4, 0⟩ := by decide

/-- `a₁₃(f₀) = (3 + 2i)⁴ + (3 - 2i)⁴`. -/
example : sigmaZeroCoeffSplit ⟨3, 2⟩ = -238 := by decide

/-- The choice of generator does not matter: `i⁴ = 1`. -/
example : sigmaZeroCharacter ⟨0, 1⟩ = 1 := by decide

/-! ## SP.8: the non-regular locus for `n = 2` -/

open Polynomial in
/-- For `n = 2` the non-regular ideal of Lemma 8.4 is generated by the discriminant of the
Frobenius characteristic polynomial `X² - a X + b`. -/
example (a b : ℚ) : (X ^ 2 - C a * X + C b).discr = a ^ 2 - 4 * b := by
  sorry

/-! ## SP.10: the numerical side of the seasoned condition -/

/-- The threshold `max(10, 8 n (n - 1))` for the auxiliary prime `t` in Definition 3.6. -/
def seasonedThreshold (n : ℕ) : ℕ := max 10 (8 * n * (n - 1))

example : seasonedThreshold 3 = 48 := by decide
example : Nat.Prime 53 ∧ seasonedThreshold 3 < 53 := by norm_num [seasonedThreshold]
/-- `q = 211` satisfies `53 ∣ q + 1` and `(q + 1)/53 > 2`. -/
example : 53 ∣ 211 + 1 ∧ 2 < (211 + 1) / 53 := by decide

/-! ## SP.13: the Bertrand step of the induction on `n` -/

/-- For `n > 5` there is a prime `p` with `n = p + r`, `0 < r < p` and `p ≥ 5`, so `SP_n` follows
from `SP_{r-1}, SP_r, SP_{r+1}, SP_{p-r}` (Newton–Thorne 2026 Theorem 6.4). -/
theorem exists_bertrand_split {n : ℕ} (hn : 5 < n) :
    ∃ p r : ℕ, p.Prime ∧ n = p + r ∧ 0 < r ∧ r < p ∧ 5 ≤ p := by
  sorry

example : (7 : ℕ).Prime ∧ 12 = 7 + 5 ∧ 0 < 5 ∧ 5 < 7 := by norm_num

/-- The residual block sizes of `Sym^{p+r-1}` modulo `p`: `2r` and `p - r` add up to `p + r`. -/
example (p r : ℕ) (h : r < p) : 2 * r + (p - r) = p + r := by omega

end TauCeti.SymmetricPowerMethod
