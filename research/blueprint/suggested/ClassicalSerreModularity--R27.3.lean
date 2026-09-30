import Mathlib.Algebra.Ring.Parity
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.NormNum.GCD
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring

/-!
# Suggested Lean forms: ClassicalSerreModularity, part R27.3 (R27.3–R27.6, R33.1–R33.4)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ClassicalSerreModularity--R27.3`) is definitive. Galois representations, Serre weights, compatible
systems and modular forms are not in the pinned libraries, so the statements below are comments, and
the checked examples test the arithmetic of the Khare–Wintenberger and Dieulefait–Pacetti arguments.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX pending.
No compilation was performed: no existing build was found at the pins. Historical compilation
in reviewHistory is not a check of this revision. Supplier signature sketches below are comments.
Lemma 8.2 imports the early R01.3/R01.4 definitions/classification; no level-one theorem or R15.6.
Its stage-component promotion is still a maintainer gap, not an implemented stage split.

```
-- R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes  (𝔽_p coefficients, not 𝔽̄_p)
theorem lemma_8_2 {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1) (ρ̄ : GaloisRep ℚ (ZMod p) 2)
    (hS : IsSType ρ̄) (hns : ¬ IsSolvable (image ρ̄)) :
    ∃ Q : Set ℕ, 0 < dirichletDensity Q ∧ ∀ q ∈ Q, q.Prime ∧ IsUnramifiedAt ρ̄ q ∧
      ProjFrobConjComplexConj ρ̄ q ∧ (∀ ℓ, ℓ.Prime → ℓ ≤ p - 1 → q % ℓ = 1) ∧ q % 8 = 1 ∧ q % p = p - 1
-- R27.3/double-induction-assembly and R27.3/d0-from-all-lr
theorem hypL_all : ∀ r ≥ 1, HypL r
theorem hypD_zero : HypD 0
-- R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice
theorem raising_levels (r : ℕ) (hD : HypD r) (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄)
    (hN : ¬ 2 ^ (r + 1) ∣ serreLevel ρ̄) (hk : ringChar 𝔽 = 2 → r = 0 → serreWeight ρ̄ = 2) : IsModular ρ̄
-- R27.4/strong-form-by-minimal-lifts
theorem arises_of_modular (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄) (hmod : IsModular ρ̄)
    (hk : ringChar 𝔽 = 2 → serreWeight ρ̄ = 2) :
    ArisesFrom ρ̄ (CuspForms (Γ₁ (serreLevel ρ̄)) (serreWeight ρ̄))
-- R27.5/hypothesis-H-and-theorem-9-1
-- Import the dyadic theorem R22.6/hypothesis-h, including the Breuil–Kisin comparison.
theorem serre_of_hypH (hH2 : HypothesisH2) (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄) : IsModular ρ̄
-- R27.6/full-classical-serre-theorem
theorem serre_strong (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄) :
    ∃ (f : Newform (serreLevel ρ̄) (serreWeight ρ̄)) (λ : Ideal f.coeffRing), λ.LiesOver p ∧
      Nonempty (residualRep f λ ≃ ρ̄) ∧ det ρ̄ = f.character.reduce λ * cyclotomic p ^ (serreWeight ρ̄ - 1)
-- R27.6/odd-artin-weight-one-modularity: explicit Corollary 10.2(ii) export for ML.1.
-- The early Gross/Coleman–Voloch/Khare descent input is an open proof contract.
-- Do not import all of ML.1 in reverse, and do not treat weight >= 2 as weight-one modularity.
theorem odd_artin_weight_one (ρ : ComplexArtinRep ℚ 2) (hodd : IsOdd ρ)
    (hirr : IsIrreducible ρ) : ∃ f : WeightOneCuspidalNewform, Nonempty (deligneSerreRep f ≃ ρ)
-- R33.2/dp-lift-existence-and-good-dihedral-insertion is ONLY Paso 2:
-- apply R24.3's general Theorem 1.9(4), after the Paso 1 weight-two system and
-- Lemma 1.15 prime-field conditions select its crystalline-at-q alternative.
theorem paso_two_insertion (d : WeightTwoSystemAtSplitPrime q) (hN : Lemma115Conditions d N)
    (localType : DihedralInertialType q N) : Nonempty (PasoTwoCompatibleSystem d N localType)
-- R33.2/dihedral-local-type-at-n
def levelTwoCharacter (q N : ℕ) (hq : q ∣ N + 1) : (Gal ℚ_[N]² →* (ℤ̄_[q])ˣ) := …
-- normalised to be trivial on the Frobenius attached to N, so that the image of the induction is
-- dihedral of order 2q (without it the image has order 2q²; review of 2026-09-29)
theorem levelTwoCharacter_artin (q N : ℕ) (hq : q ∣ N + 1) : levelTwoCharacter q N hq (artin N) = 1
def dihedralType (q N : ℕ) (hq : q ∣ N + 1) : GaloisRep ℚ_[N] ℤ̄_[q] 2 := induced (levelTwoCharacter q N hq)
-- R33.4/dp-odd-characteristic-assembly
theorem serre_weak_odd {p : ℕ} (hp : p ≠ 2) (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄)
    (hirr : IsIrreducible ρ̄) : IsModular ρ̄
```
-/

namespace TauCeti.SerreConjecture.SuggestedTest

/-- `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`: for `p = 5` the prime `q = 409`
satisfies the three congruences (`409 ≡ 1 mod 8`, `≡ 1 mod 3`, `≡ −1 mod 5`). -/
example : Nat.Prime 409 ∧ 409 % 8 = 1 ∧ 409 % 3 = 1 ∧ 409 % 5 = 5 - 1 := by norm_num

/-- `R27.1/good-dihedral-prime-insertion` and `R33.2/dp-lift-existence-and-good-dihedral-insertion`:
for `p′ = q = 13` the prime `406561` is `1` modulo `8, 3, 5, 7, 11` and `−1` modulo `13`, and
`13 ∣ 406561 + 1`, `13 ∤ 406561 − 1`, so the inserted character has level 2. -/
example : Nat.Prime 406561 ∧ 406561 % 8 = 1 ∧ 406561 % 3 = 1 ∧ 406561 % 5 = 1 ∧ 406561 % 7 = 1 ∧
    406561 % 11 = 1 ∧ 406561 % 13 = 12 ∧ 13 ∣ 406561 + 1 ∧ ¬ 13 ∣ 406561 - 1 := by norm_num

/-- Paso 2's residual weight is two. At q = 13, the weight-q+1 Steinberg branch is different. -/
example : (2 : ℕ) ≠ 13 + 1 := by norm_num

/-- Lemma 8.2 uses that `−1` is a square modulo `p ≡ 1 mod 4`: `2² ≡ −1 mod 5`, `5² ≡ −1 mod 13`. -/
example : (2 ^ 2 + 1) % 5 = 0 ∧ (5 ^ 2 + 1) % 13 = 0 := by norm_num

/-- `R27.3/d0-from-all-lr`: `N = 6` satisfies `(D_1)(c)` (`4 ∤ 6`) but not `(D_0)(c)` (`2 ∣ 6`). -/
example : 2 ^ (0 + 1) ∣ 6 ∧ ¬ 2 ^ (1 + 1) ∣ 6 := by norm_num

/-- `R27.4/auxiliary-characteristic-choice`: a prime `p′ > 5` is at least 7, so the inertia orders
`p′ − 1` and `p′ + 1` are at least 6, with equality at `p′ = 7`. -/
example (p : ℕ) (hp : 7 ≤ p) : 6 ≤ p - 1 ∧ 6 ≤ p + 1 := by omega

example : 7 - 1 = 6 := by norm_num

/-- `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`: for `p′ = 13` the characteristic
`s` in which `(D_r)` is applied is `11`, the largest prime below `13`. -/
example : Nat.Prime 11 ∧ ¬ Nat.Prime 12 := by norm_num

/-- `R27.5/d1-by-the-prime-three` and `R33.3/dp-dyadic-transition-and-the-order-three-type`: an
order-3 character of `I₂` has level 2, since `3 ∣ 2 + 1`, `|𝔽₄^×| = 3` and `|𝔽₂^×| = 1`. -/
example : 3 ∣ 2 + 1 ∧ 2 ^ 2 - 1 = 3 ∧ 2 - 1 = 1 := by norm_num

/-- `R33.2/dihedral-local-type-at-n`: `q = 7, N = 13` gives level 2 (`7 ∣ 14`, `7 ∤ 12`), while
`q = 3, N = 7` is a non-example (`3 ∣ 6 = N − 1`). -/
example : 7 ∣ 13 + 1 ∧ ¬ 7 ∣ 13 - 1 ∧ 3 ∣ 7 - 1 := by norm_num

/-- Source issue `E4`: the unit group of `𝔽_{N²}` has order `N² − 1 = (N − 1)(N + 1)`; the field has
`N²` elements (`25 ≠ 24` at `N = 5`). -/
example (N : ℤ) : N ^ 2 - 1 = (N - 1) * (N + 1) := by ring

example : (5 : ℕ) ^ 2 - 1 = (5 - 1) * (5 + 1) ∧ (5 : ℕ) ^ 2 ≠ (5 - 1) * (5 + 1) := by norm_num

/-- `R27.5/dyadic-weight-two-claim`, `R33.3/remark-6-weight-two-after-type-change` and source issue
`E6`: an odd valuation stays odd in an extension of odd ramification index (so a très ramifiée class
never becomes a unit times a square there), and becomes even in index 2. -/
example (e v : ℕ) (he : Odd e) (hv : Odd v) : Odd (e * v) := he.mul hv

example (v : ℕ) : Even (2 * v) := even_two_mul v

/-- `R33.1/fontaine-laffaille-member-not-bad-dihedral`: `p > 2k` excludes both `p = 2k − 1` and
`p = 2k − 3` of Lemma 1.14. -/
example (p k : ℕ) (hk : 2 ≤ k) (hp : 2 * k < p) : p ≠ 2 * k - 1 ∧ p ≠ 2 * k - 3 := by omega

/-- The niveau-2 case of Lemma 1.14 is attained at `p = 7, k = 5`: the projective order of inertia is
`(p + 1)/gcd(p + 1, k − 1) = 8/4 = 2` and `p = 2k − 3`. -/
example : Nat.gcd (7 + 1) (5 - 1) = 4 ∧ (7 + 1) / 4 = 2 ∧ 7 = 2 * 5 - 3 := by norm_num

/-- `R33.3/paso-5-killing-the-good-dihedral-prime` (Remark 5): at level one a bad-dihedral
representation has `p = 2k − 1` with `k` even, so `p ≡ 3 mod 4`; `N ≡ 1 mod 8` and `p = 5` are not. -/
example (m : ℕ) (hm : 1 ≤ m) : (2 * (2 * m) - 1) % 4 = 3 := by omega

example (N : ℕ) (hN : N % 8 = 1) : N % 4 ≠ 3 := by omega

example : 5 % 4 ≠ 3 := by norm_num

/-- `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`: the even weights in `[2, 6]`
are `2, 4, 6`, and `4 = 3 + 1` is the weight Berger–Li–Zhu needs at `p = 3`. -/
example : (Finset.Icc 2 6).filter (fun k => k % 2 = 0) = {2, 4, 6} ∧ 4 = 3 + 1 := by decide

end TauCeti.SerreConjecture.SuggestedTest
