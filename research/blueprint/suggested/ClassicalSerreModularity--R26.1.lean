import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-!
# Suggested Lean forms: ClassicalSerreModularity, part R26.1 (R26.1–R26.6, R27.1–R27.2)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ClassicalSerreModularity--R26.1`) is definitive. Galois representations, Serre weights and
modular forms are not in the pinned libraries, so the statements below are comments, and the
checked examples test the arithmetic of the level-one proof (Khare §§4, 6).

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R26.1/level-one-theorem-and-the-meaning-of-arises-from
theorem level_one (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄)
    (hN : conductor ρ̄ = 1) : ArisesFrom ρ̄ (CuspForms (SL(2, ℤ)) (serreWeight ρ̄))
-- R26.3/level-one-induction-scheme
def S (B : ℕ) : Prop := ∀ ℓ ρ̄, IsOdd ρ̄ → IsAbsIrreducible ρ̄ → conductor ρ̄ = 1 → serreWeight ρ̄ ≤ B → IsModular ρ̄
theorem S_step (pn P : ℕ) (hpn : 31 ≤ pn) (hP : nextKharePrime pn = P) : S (pn + 1) → S (P + 1)
-- R27.1/good-dihedral-prime-definition
def IsGoodDihedralPrime (ρ̄ : GaloisRep ℚ (F̄ p) 2) (q : ℕ) : Prop := …
```
-/

namespace TauCeti.SerreConjecture.SuggestedTest

/-- `R26.3/weight-interval-containment`: both endpoint bounds are
`(m + 1)(P − 1) + 2(2m + 1) = (P + 1)(2m + 1) − m(P − 1) = (m + 1)P + 3m + 1`,
so each is at most `(p_n + 1)(2m + 1)` exactly when `(m + 1)P ≤ (2m + 1)p_n − m`, which is (1). -/
example (m P pn : ℚ) (h : (m + 1) * P ≤ (2 * m + 1) * pn - m) :
    (m + 1) * (P - 1) + 2 * (2 * m + 1) ≤ (pn + 1) * (2 * m + 1) ∧
      (P + 1) * (2 * m + 1) - m * (P - 1) ≤ (pn + 1) * (2 * m + 1) := by
  constructor <;> nlinarith [h]

/-- `R26.5/small-weights-table`: the new weights `j + 2` and `P + 1 − j` of each row. -/
example : (2 + 2, 7 + 1 - 2) = (4, 6) ∧ (4 + 2, 11 + 1 - 4) = (6, 8) ∧ (8 + 2, 19 + 1 - 8) = (10, 12) ∧
    (16 + 2, 29 + 1 - 16) = (18, 14) ∧ (14 + 2, 29 + 1 - 14) = (16, 16) ∧
    (18 + 2, 31 + 1 - 18) = (20, 14) := by
  decide

/-- The foils: `ℓ^r ∥ P − 1` in each row (`6 = 2·3`, `10 = 2·5`, `18 = 2·9`, `28 = 4·7`, `30 = 6·5`). -/
example : 7 - 1 = 2 * 3 ∧ 11 - 1 = 2 * 5 ∧ 19 - 1 = 2 * 9 ∧ 29 - 1 = 4 * 7 ∧ 31 - 1 = 6 * 5 := by decide

/-- Nebentype cosets: at `P = 29`, `ℓ = 7`, the allowed `j` satisfy `j ≡ k − 2 (mod 4)`:
`k = 24, 28` give `22 ≡ 26 ≡ 14`, and `k = 22, 26, 30` give `20 ≡ 24 ≡ 28 ≡ 16`. -/
example : 22 % 4 = 14 % 4 ∧ 26 % 4 = 14 % 4 ∧ 20 % 4 = 16 % 4 ∧ 24 % 4 = 16 % 4 ∧ 28 % 4 = 16 % 4 := by
  decide

/-- Source issue `E2`: at `P = 31` with foil `5` the nebentype exponent must be a multiple of
`30/5 = 6` (the lift is semistable at 31); `16` is not, `18` is, and `18` lies in the interval
`(12, 18]` of §6.2 with `m = 2`. -/
example : ¬ (6 ∣ 16) ∧ 6 ∣ 18 ∧ 2 * 30 < 18 * 5 ∧ 18 * 5 ≤ 3 * 30 := by decide

/-- `R27.1/good-dihedral-prime-definition`: condition (ii) fails for `q = 13` (`13 ≢ 1 mod 8`),
and for `q = 13`, `t = 7`: `t ∣ q + 1`, `t ∤ q − 1`, as `gcd(q + 1, q − 1) = 2`. -/
example : 13 % 8 ≠ 1 ∧ 7 ∣ 13 + 1 ∧ ¬ 7 ∣ 13 - 1 ∧ Nat.gcd (13 + 1) (13 - 1) = 2 := by decide

/-- `R26.3/chebyshev-next-prime`: after `p_n = 251` the next prime `257` is a Fermat prime
(`2^8 + 1`), so `P = 263` is used; `263/251 ≤ 3/2 − 1/30`. -/
example : 257 = 2 ^ 8 + 1 ∧ (263 : ℚ) / 251 ≤ 3 / 2 - 1 / 30 := by norm_num

end TauCeti.SerreConjecture.SuggestedTest
