import Mathlib.RingTheory.Binomial
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Data.Fintype.Perm
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Int.GCD
import Mathlib.Data.Int.ModEq
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RingTheory.Multiplicity
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.ZetaValues
import Mathlib.NumberTheory.Bernoulli
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.NumberTheory.EllipticDivisibilitySequence
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Complex.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.ZSMul
import TauCeti.NumberTheory.EllipticDivisibilitySequence.Complement
import TauCeti.NumberTheory.EllipticDivisibilitySequence.NormEDS

/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ClassicalArithmeticCompletion--CA.2.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation: every proof is admitted.

Scope: the CA.2 follow-up (sequences and generating functions) of the roadmap "Classical
arithmetic, sequences, polynomials and reciprocity". It adds Eulerian numbers and the
Lawrence–Sawin inequalities, generalised binomial divisibility, the p-free factorial with its
binomial factorisations and the Luo–Zhu congruence, the curve attached to a normalised elliptic
divisibility sequence with Ward's strong divisibility theorem, and three suppliers for steps of
the earlier CA.2 targets (formal sine and cosine, and the divergence of the Bernoulli and
tangent series on the boundary of their discs). The earlier CA.2 declarations live in
`research/blueprint/suggested/ClassicalArithmeticCompletion.lean` and are not repeated here.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

noncomputable section

open scoped Nat

namespace TauCeti.ClassicalArithmetic

section CA2

/-! ### Eulerian numbers (Stanley EC1 §1.4; Lawrence–Sawin, Appendix C) -/

/-- The number of descents of a permutation `σ` of `Fin n`: the positions `i` with `i + 1 < n`
and `σ (i + 1) < σ i`. -/
def descentCount {n : ℕ} (σ : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter fun i : Fin n => ∃ h : i.1 + 1 < n, σ ⟨i.1 + 1, h⟩ < σ i).card

/-- The number of ascents of a permutation `σ` of `Fin n`: the positions `i` with `i + 1 < n`
and `σ i < σ (i + 1)`. -/
def ascentCount {n : ℕ} (σ : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter fun i : Fin n => ∃ h : i.1 + 1 < n, σ i < σ ⟨i.1 + 1, h⟩).card

/-- CA.2/eulerian-numbers: the Eulerian number `A(n, q)`, the number of permutations of
`{1, …, n}` with exactly `q` descents. The empty permutation has no descent, so
`A(0, 0) = 1`; for `n ≥ 1` it vanishes from `q = n` on. -/
def eulerian (n q : ℕ) : ℕ :=
  (Finset.univ.filter fun σ : Equiv.Perm (Fin n) => descentCount σ = q).card

theorem eulerian_zero_zero : eulerian 0 0 = 1 := by sorry

theorem eulerian_zero_right (n : ℕ) : eulerian n 0 = 1 := by sorry

theorem eulerian_eq_zero_of_le {n q : ℕ} (hn : 1 ≤ n) (hq : n ≤ q) : eulerian n q = 0 := by
  sorry

theorem eulerian_one_right (n : ℕ) : eulerian n 1 = 2 ^ n - n - 1 := by sorry

theorem card_ascentCount_eq_eulerian (n q : ℕ) :
    (Finset.univ.filter fun σ : Equiv.Perm (Fin n) => ascentCount σ = q).card = eulerian n q := by
  sorry

/-- CA.2/eulerian-basic-identities. -/
theorem sum_eulerian (n : ℕ) : ∑ q ∈ Finset.range (n + 1), eulerian n q = n ! := by sorry

theorem eulerian_symm {n q : ℕ} (hq : q < n) : eulerian n q = eulerian n (n - 1 - q) := by sorry

theorem eulerian_succ_succ (n q : ℕ) :
    eulerian (n + 1) (q + 1) = (q + 2) * eulerian n (q + 1) + (n - q) * eulerian n q := by sorry

/-- Worpitzky's identity, the coefficient form of Stanley's `∑ mⁿxᵐ = Aₙ(x)/(1 - x)ⁿ⁺¹`. -/
theorem worpitzky (n q : ℕ) :
    (q + 1) ^ n = ∑ j ∈ Finset.range (q + 1), eulerian n j * (n + q - j).choose n := by sorry

/-- Unit test `eulerian_three_one`. -/
example : eulerian 3 1 = 4 := by sorry

/-- Unit test `eulerian_four_row`: the row `1, 11, 11, 1`. -/
example : eulerian 4 0 = 1 ∧ eulerian 4 1 = 11 ∧ eulerian 4 2 = 11 ∧ eulerian 4 3 = 1 := by sorry

/-- Unit test `eulerian_two_row`. -/
example : eulerian 2 0 = 1 ∧ eulerian 2 1 = 1 := by sorry

/-- Unit test `sum_eulerian_zero`: the empty permutation counts once, so the row sum at `n = 0` is `0! = 1`. -/
example : ∑ q ∈ Finset.range 1, eulerian 0 q = 0 ! := by sorry

/-- Unit test `sum_eulerian_five`. -/
example : ∑ q ∈ Finset.range 6, eulerian 5 q = 120 := by sorry

/-- Unit test `eulerian_ne_zigzag`: `A(3, 1) = 4` while the Euler zigzag number `E₃` is `2`. -/
example : eulerian 3 1 ≠ 2 := by sorry

/-- CA.2/eulerian-unimodal: the rows rise up to the middle. -/
theorem eulerian_le_eulerian_succ {n q : ℕ} (hq : 2 * (q + 1) ≤ n - 1) :
    eulerian n q ≤ eulerian n (q + 1) := by sorry

/-- CA.2/eulerian-power-bounds (Lawrence–Sawin, Lemma C.1, upper half). -/
theorem eulerian_le_pow (n q : ℕ) : eulerian n q ≤ (q + 1) ^ n := by sorry

/-- CA.2/eulerian-power-bounds (Lawrence–Sawin, Lemma C.1, lower half). -/
theorem pow_sub_le_eulerian {n : ℕ} (hn : 1 ≤ n) (q : ℕ) :
    ((q + 1 : ℕ) : ℤ) ^ n - (n + 1) * (q : ℤ) ^ n ≤ eulerian n q := by sorry

/-- CA.2/eulerian-power-bounds (Lawrence–Sawin, Lemma C.2). -/
theorem eulerian_le_factorial (n q : ℕ) : eulerian n q ≤ n ! := by sorry

/-- CA.2/eulerian-small-descent-bounds (Lawrence–Sawin, Lemma C.3). -/
theorem one_sub_exp_neg_one_mul_le_eulerian {n q : ℕ} (hn : 2 ≤ n)
    (hq : (q : ℝ) < n / (Real.log (n + 1) + 1) - 1) :
    (1 - Real.exp (-1)) * ((q : ℝ) + 1) ^ n ≤ eulerian n q := by sorry

/-- CA.2/eulerian-square-separation (Lawrence–Sawin, Lemma C.4). -/
theorem two_mul_eulerian_lt {n r : ℕ} (hr : 3 ≤ r) (hrn : r ≤ n - 2) :
    2 * eulerian n (3 * r - 2) < eulerian n (r - 1) * (eulerian n (r - 1) - 1) := by sorry

/-- CA.2/eulerian-ratio-bound (Lawrence–Sawin, Lemma C.5). -/
theorem twentySeven_mul_eulerian_two_lt {n : ℕ} (hn : 11 ≤ n) :
    27 * eulerian n 2 < eulerian n 1 ^ 2 := by sorry

/-- Acceptance: the threshold `11` of Lemma C.5 is sharp (`A(10, 1) = 1013`,
`A(10, 2) = 47840`). -/
example : ¬ 27 * eulerian 10 2 < eulerian 10 1 ^ 2 := by sorry

/-! ### Generalised binomial coefficients and the p-free factorial (Yu §7.2.2; Luo–Zhu) -/

/-- The absorption identity for Mathlib's generalised binomial coefficients over `ℤ`. -/
theorem succ_mul_ringChoose_succ (n : ℤ) (m : ℕ) :
    ((m + 1 : ℕ) : ℤ) * Ring.choose n (m + 1) = n * Ring.choose (n - 1) m := by sorry

/-- CA.2/generalized-binomial-divisibility (Yu, Lemme 7.2.2): `n / gcd(n, m)` divides the
generalised binomial coefficient `C(n, m)`, negative `n` included. -/
theorem div_gcd_dvd_ringChoose {n : ℤ} (hn : n ≠ 0) {m : ℕ} (hm : 1 ≤ m) :
    n / (Int.gcd n m : ℤ) ∣ Ring.choose n m := by sorry

/-- Unit test `ringChoose_neg_two_two`. -/
example : Ring.choose (-2 : ℤ) 2 = 3 := by sorry

/-- Unit test `div_gcd_dvd_ringChoose_neg_four_two`: `-2 ∣ C(-4, 2) = 10`. -/
example : (-4 : ℤ) / (Int.gcd (-4) 2 : ℤ) ∣ Ring.choose (-4 : ℤ) 2 := by sorry

/-- Unit test `not_dvd_ringChoose_four_two`: the gcd cannot be dropped, `4 ∤ C(4, 2) = 6`. -/
example : ¬ (4 : ℤ) ∣ Ring.choose (4 : ℤ) 2 := by sorry

/-- CA.2/p-free-factorial: `f_p(N)`, the product of the integers `1 ≤ i ≤ N` prime to `p`;
`f_p(0) = 1`. -/
def pFreeFactorial (p N : ℕ) : ℕ :=
  ∏ i ∈ (Finset.Icc 1 N).filter (fun i => ¬ p ∣ i), i

theorem pFreeFactorial_zero (p : ℕ) : pFreeFactorial p 0 = 1 := by sorry

theorem pFreeFactorial_succ (p N : ℕ) :
    pFreeFactorial p (N + 1) = pFreeFactorial p N * if p ∣ N + 1 then 1 else N + 1 := by sorry

/-- The factorial split `N! = p^⌊N/p⌋ ⌊N/p⌋! f_p(N)`. -/
theorem factorial_eq_mul_pFreeFactorial (p N : ℕ) :
    N ! = p ^ (N / p) * (N / p) ! * pFreeFactorial p N := by sorry

/-- `f_p(N)` is a `p`-adic unit. -/
theorem not_dvd_pFreeFactorial {p : ℕ} (hp : p.Prime) (N : ℕ) : ¬ p ∣ pFreeFactorial p N := by
  sorry

theorem pFreeFactorial_prime {p : ℕ} (hp : p.Prime) : pFreeFactorial p p = (p - 1) ! := by sorry

/-- Unit test `pFreeFactorial_three_six`: `1 · 2 · 4 · 5 = 40`. -/
example : pFreeFactorial 3 6 = 40 := by sorry

/-- Unit test `pFreeFactorial_two_four`. -/
example : pFreeFactorial 2 4 = 3 := by sorry

/-- Unit test `pFreeFactorial_ne_ordCompl`: `f₂(6) = 15` while the prime-to-2 part of `6!` is
`45`. -/
example : pFreeFactorial 2 6 ≠ 6 ! / 2 ^ (6 !).factorization 2 := by sorry

/-- Unit test `factorial_six_eq_mul_pFreeFactorial`: `6! = 3² · 2! · f₃(6)`. -/
example : 6 ! = 3 ^ (6 / 3) * (6 / 3) ! * pFreeFactorial 3 6 := by sorry

/-- CA.2/p-free-factorial-binomial-factorisation, nonnegative upper entry. -/
theorem choose_mul_mul_pFreeFactorial {p : ℕ} (hp : p.Prime) {m n : ℕ} (hmn : m ≤ n) :
    (n * p).choose (m * p) * (pFreeFactorial p (m * p) * pFreeFactorial p ((n - m) * p)) =
      n.choose m * pFreeFactorial p (n * p) := by sorry

/-- CA.2/p-free-factorial-binomial-factorisation, negative upper entry, with the sign
`(-1)^(m(p-1))`. -/
theorem ringChoose_neg_mul_pFreeFactorial {p : ℕ} (hp : p.Prime) {n : ℕ} (hn : 1 ≤ n) (m : ℕ) :
    Ring.choose (-((n * p : ℕ) : ℤ)) (m * p) *
        ((pFreeFactorial p (m * p) * pFreeFactorial p (n * p) : ℕ) : ℤ) =
      (-1) ^ (m * (p - 1)) * Ring.choose (-(n : ℤ)) m *
        (pFreeFactorial p (n * p + m * p) : ℕ) := by sorry

/-- Unit test `ringChoose_neg_two_two_factorisation`: `p = 2`, `n = m = 1`, both sides `3`. -/
example : Ring.choose (-2 : ℤ) 2 * ((pFreeFactorial 2 2 * pFreeFactorial 2 2 : ℕ) : ℤ) =
    (-1) ^ (1 * (2 - 1)) * Ring.choose (-1 : ℤ) 1 * (pFreeFactorial 2 4 : ℕ) := by sorry

/-- CA.2/luo-zhu-congruence: `f_p(p^α N) ≡ f_p(p^α)^N (mod p^(2α))` for `p` odd and `α ≥ 1`,
or `p = 2` and `α ≥ 2`. -/
theorem pFreeFactorial_pow_mul_modEq {p : ℕ} (hp : p.Prime) {α : ℕ} (hα : 1 ≤ α)
    (h2 : p ≠ 2 ∨ 2 ≤ α) (N : ℕ) :
    (pFreeFactorial p (p ^ α * N) : ℤ) ≡ (pFreeFactorial p (p ^ α) : ℤ) ^ N
      [ZMOD (p : ℤ) ^ (2 * α)] := by sorry

/-- The exceptional case `p = 2`, `α = 1`: `f₂(2N) ≡ (-1)^⌊N/2⌋ (mod 4)`. -/
theorem pFreeFactorial_two_two_mul_modEq (N : ℕ) :
    (pFreeFactorial 2 (2 * N) : ℤ) ≡ (-1) ^ (N / 2) [ZMOD 4] := by sorry

/-- Unit test `luoZhu_fails_two_one`: the congruence fails for `p = 2`, `α = 1`, `N = 2`
(`f₂(4) = 3`, `f₂(2)² = 1`). -/
example : ¬ ((pFreeFactorial 2 (2 ^ 1 * 2) : ℤ) ≡ (pFreeFactorial 2 (2 ^ 1) : ℤ) ^ 2
    [ZMOD (2 : ℤ) ^ (2 * 1)]) := by sorry

/-- Unit test `luoZhu_three_one_two`: `f₃(6) = 40 ≡ 4 = f₃(3)² (mod 9)`. -/
example : (pFreeFactorial 3 (3 ^ 1 * 2) : ℤ) ≡ (pFreeFactorial 3 (3 ^ 1) : ℤ) ^ 2
    [ZMOD (3 : ℤ) ^ (2 * 1)] := by sorry

/-! ### The curve of a normalised elliptic divisibility sequence and Ward's theorem -/

section EDS

variable {K : Type*} [Field K] [DecidableEq K]

/-- CA.2/eds-attached-curve: the Weierstrass curve
`y² + ((d + b⁴)/(bc)) xy + b y = x³ + (c/b²) x²` attached to the parameters `b, c, d` of
`normEDS`; the point `(0, 0)` carries the sequence. -/
def edsCurve (b c d : K) : WeierstrassCurve K where
  a₁ := (d + b ^ 4) / (b * c)
  a₂ := c / b ^ 2
  a₃ := b
  a₄ := 0
  a₆ := 0

theorem edsCurve_nonsingular {b : K} (hb : b ≠ 0) (c d : K) :
    (edsCurve b c d).toAffine.Nonsingular 0 0 := by sorry

theorem evalEval_ψ₂_edsCurve (b c d : K) : (edsCurve b c d).ψ₂.evalEval 0 0 = b := by sorry

theorem eval_Ψ₃_edsCurve {b : K} (hb : b ≠ 0) (c d : K) : (edsCurve b c d).Ψ₃.eval 0 = c := by
  sorry

theorem eval_preΨ₄_edsCurve {b c : K} (hb : b ≠ 0) (hc : c ≠ 0) (d : K) :
    (edsCurve b c d).preΨ₄.eval 0 = d := by sorry

/-- The point `(0, 0)` of `edsCurve b c d` carries `normEDS b c d`. -/
theorem evalEval_ψ_edsCurve {b c : K} (hb : b ≠ 0) (hc : c ≠ 0) (d : K) (n : ℤ) :
    ((edsCurve b c d).ψ n).evalEval 0 0 = normEDS b c d n := by sorry

/-- The discriminant: `Δ = -D(b, c, d)/(b⁴c³)` with Ward's polynomial `D` (Silverman–Stephens,
Appendix A, (31), up to the factor `2⁸3¹²b⁸c⁹`). -/
theorem Δ_edsCurve {b c : K} (hb : b ≠ 0) (hc : c ≠ 0) (d : K) :
    (edsCurve b c d).Δ = -(d * b ^ 12 + (3 * d ^ 2 - c ^ 3) * b ^ 8 +
      (3 * d ^ 3 - 20 * c ^ 3 * d) * b ^ 4 + 16 * c ^ 6 + 8 * c ^ 3 * d ^ 2 + d ^ 4) /
        (b ^ 4 * c ^ 3) := by sorry

theorem map_edsCurve {L : Type*} [Field L] (f : K →+* L) (b c d : K) :
    (edsCurve b c d).map f = edsCurve (f b) (f c) (f d) := by sorry

/-- Unit test `Δ_edsCurve_two_three_two`: the identity sequence `normEDS 2 3 2` comes from a
cuspidal cubic. -/
example : (edsCurve (2 : ℚ) 3 2).Δ = 0 := by sorry

/-- Unit test `Δ_edsCurve_one_neg_one_one`: the sequence `1, 1, -1, 1, 2, …` comes from the curve
`y² + y = x³ - x` of conductor `37` (substitute `y ↦ y + x`). -/
example : (edsCurve (1 : ℚ) (-1) 1).Δ = 37 := by sorry

/-- Unit test `edsCurve_one_neg_one_one_coeffs`. -/
example : (edsCurve (1 : ℚ) (-1) 1).a₁ = -2 ∧ (edsCurve (1 : ℚ) (-1) 1).a₂ = -1 := by sorry

/-- Unit test `evalEval_ψ_edsCurve_two_three_two`: the division polynomials of the cusp curve at
`(0, 0)` are `n`. -/
example (n : ℤ) : ((edsCurve (2 : ℚ) 3 2).ψ n).evalEval 0 0 = n := by sorry

/-- CA.2/division-polynomials-at-a-nonsingular-point: on any Weierstrass curve over a field,
`ψₙ` vanishes at a nonsingular point exactly when `n` kills it. -/
theorem evalEval_ψ_eq_zero_iff {W : WeierstrassCurve K} {x y : K}
    (h : W.toAffine.Nonsingular x y) (n : ℤ) :
    (W.ψ n).evalEval x y = 0 ↔ n • (WeierstrassCurve.Affine.Point.some x y h) = 0 := by sorry

/-- Ayad's coprimality: `φₙ` and `ψₙ` do not vanish together at a nonsingular point. -/
theorem evalEval_φ_ne_zero_or_evalEval_ψ_ne_zero {W : WeierstrassCurve K} {x y : K}
    (h : W.toAffine.Nonsingular x y) (n : ℤ) :
    (W.φ n).evalEval x y ≠ 0 ∨ (W.ψ n).evalEval x y ≠ 0 := by sorry

/-- Part (c): where `ψₙ` does not vanish, `n • (x, y)` is the affine point `(φₙ/ψₙ², ωₙ/ψₙ³)`. -/
theorem zsmul_some_eq_some_of_evalEval_ψ_ne_zero {W : WeierstrassCurve K} {x y : K}
    (h : W.toAffine.Nonsingular x y) {n : ℤ} (hψ : (W.ψ n).evalEval x y ≠ 0) :
    ∃ h' : W.toAffine.Nonsingular ((W.φ n).evalEval x y / (W.ψ n).evalEval x y ^ 2)
        ((W.ω n).evalEval x y / (W.ψ n).evalEval x y ^ 3),
      n • WeierstrassCurve.Affine.Point.some x y h = WeierstrassCurve.Affine.Point.some _ _ h' := by
  sorry

/-- CA.2/eds-zero-set-is-a-subgroup: over a field, with `b, c ≠ 0`, the zeros of `normEDS b c d`
are the multiples of the order of `(0, 0)` on `edsCurve b c d`. -/
theorem normEDS_eq_zero_iff {b c : K} (hb : b ≠ 0) (hc : c ≠ 0) (d : K) (n : ℤ) :
    normEDS b c d n = 0 ↔
      (addOrderOf (WeierstrassCurve.Affine.Point.some 0 0 (edsCurve_nonsingular hb c d)) : ℤ) ∣
        n := by sorry

/-- Unit test `normEDS_zmod_two_zeros`: the sequence `1, 1, -1, 1, 2, …` read in `𝔽₂` vanishes at
`5` and not at `3`. -/
example : normEDS (1 : ZMod 2) (-1) 1 5 = 0 ∧ normEDS (1 : ZMod 2) (-1) 1 3 ≠ 0 := by sorry

end EDS

open Classical in
/-- CA.2/reduction-filtration-of-an-integral-weierstrass-equation: for an elliptic curve given
by any (not necessarily minimal) Weierstrass equation over `ℤ_p` and `k ≥ 1`, the points with
`‖x‖ ≥ p^(2k)`, together with `0`, form a subgroup. -/
theorem exists_addSubgroup_filtration (p : ℕ) [Fact p.Prime] (W : WeierstrassCurve ℤ_[p])
    (hΔ : W.Δ ≠ 0) {k : ℕ} (hk : 1 ≤ k) :
    ∃ H : AddSubgroup (W.baseChange ℚ_[p]).toAffine.Point, ∀ P, P ∈ H ↔
      (P = 0 ∨ ∃ (x y : ℚ_[p]) (h : (W.baseChange ℚ_[p]).toAffine.Nonsingular x y),
        P = WeierstrassCurve.Affine.Point.some x y h ∧ (p : ℝ) ^ (2 * k) ≤ ‖x‖) := by sorry

/-- CA.2/eds-strong-divisibility-at-good-primes: at a prime `p ∤ bc`, when the attached curve is
nonsingular, the indices `n` with `p^V ∣ Wₙ` form a subgroup of `ℤ` for every `V`. -/
theorem normEDS_dvd_iff_mem_addSubgroup (b c d : ℤ) {p : ℕ} (hp : p.Prime)
    (hpb : ¬ (p : ℤ) ∣ b) (hpc : ¬ (p : ℤ) ∣ c) (hΔ : (edsCurve (b : ℚ) c d).Δ ≠ 0) (V : ℕ) :
    ∃ H : AddSubgroup ℤ, ∀ n, n ∈ H ↔ (p : ℤ) ^ V ∣ normEDS b c d n := by sorry

theorem emultiplicity_normEDS_gcd (b c d : ℤ) {p : ℕ} (hp : p.Prime)
    (hpb : ¬ (p : ℤ) ∣ b) (hpc : ¬ (p : ℤ) ∣ c) (hΔ : (edsCurve (b : ℚ) c d).Δ ≠ 0) (m n : ℤ) :
    emultiplicity (p : ℤ) (normEDS b c d (Int.gcd m n)) =
      min (emultiplicity (p : ℤ) (normEDS b c d m)) (emultiplicity (p : ℤ) (normEDS b c d n)) := by
  sorry

/-- CA.2/ward-strong-divisibility: a nondegenerate normalised integral EDS with
`gcd(W₃, W₄) = 1` is a strong divisibility sequence. -/
theorem ward_strong_divisibility {b c d : ℤ} (hb : b ≠ 0) (hc : c ≠ 0)
    (hcop : IsCoprime c (d * b)) (m n : ℤ) :
    Int.gcd (normEDS b c d m) (normEDS b c d n) = (normEDS b c d (Int.gcd m n)).natAbs := by sorry

/-- The coprimality hypothesis is necessary: strong divisibility at `(3, 4)` is
`gcd(W₃, W₄) = |W₁| = 1`. -/
theorem isCoprime_of_strong_divisibility {b c d : ℤ}
    (h : ∀ m n : ℤ, Int.gcd (normEDS b c d m) (normEDS b c d n) =
      (normEDS b c d (Int.gcd m n)).natAbs) : IsCoprime c (d * b) := by sorry

/-- Ward's theorem read in Mathlib's `Nat.IsStrongDvdSequence`. -/
theorem isStrongDvdSequence_natAbs_normEDS {b c d : ℤ} (hb : b ≠ 0) (hc : c ≠ 0)
    (hcop : IsCoprime c (d * b)) :
    Nat.IsStrongDvdSequence fun n : ℕ => (normEDS b c d n).natAbs := by sorry

/-- Unit test `normEDS_one_neg_six_neg_six`: `0, 1, 1, -6, -6, 210, …` has `gcd(W₃, W₄) = 6`,
so strong divisibility fails at `(3, 4)`. -/
example : Int.gcd (normEDS 1 (-6) (-6) 3) (normEDS 1 (-6) (-6) 4) = 6 := by sorry

/-- Unit test `ward_identity_sequence`: for `normEDS 2 3 2 = id` the theorem is
`gcd(m, n) = gcd(m, n)`. -/
example (m n : ℤ) : Int.gcd (normEDS (2 : ℤ) 3 2 m) (normEDS (2 : ℤ) 3 2 n) =
    (normEDS (2 : ℤ) 3 2 (Int.gcd m n)).natAbs := by sorry

/-- Unit test `normEDS_one_neg_one_one_values`: Silverman's sequence for `y² + y = x³ - x`. -/
example : (List.range 11).map (fun n : ℕ => normEDS (1 : ℤ) (-1) 1 n) =
    [0, 1, 1, -1, 1, 2, -1, -3, -5, 7, -4] := by sorry

/-! ### Suppliers for steps of the earlier CA.2 targets -/

section Suppliers

open PowerSeries

/-- CA.2/formal-sine-cosine-identities: the formal derivative of `sin` is `cos`. -/
theorem derivative_sin (A : Type*) [CommRing A] [Algebra ℚ A] :
    PowerSeries.derivative A (PowerSeries.sin A) = PowerSeries.cos A := by sorry

theorem derivative_cos (A : Type*) [CommRing A] [Algebra ℚ A] :
    PowerSeries.derivative A (PowerSeries.cos A) = -PowerSeries.sin A := by sorry

theorem sin_sq_add_cos_sq (A : Type*) [CommRing A] [Algebra ℚ A] :
    PowerSeries.sin A ^ 2 + PowerSeries.cos A ^ 2 = 1 := by sorry

/-- Unit test `coeff_two_cos`. -/
example : PowerSeries.coeff 2 (PowerSeries.cos ℚ) = -1 / 2 := by sorry

/-- CA.2/bernoulli-coefficients-do-not-decay: `|B₂ₖ| (2π)^(2k) / (2k)! = 2 ζ(2k) ≥ 2`. -/
theorem two_le_abs_bernoulli_mul_div {k : ℕ} (hk : k ≠ 0) :
    2 ≤ |(bernoulli (2 * k) : ℝ)| * (2 * Real.pi) ^ (2 * k) / (2 * k) ! := by sorry

/-- The Bernoulli series `∑ Bₙ zⁿ / n!` diverges on and beyond the circle `|z| = 2π`. -/
theorem not_summable_bernoulli_mul_pow_of_le {z : ℂ} (hz : 2 * Real.pi ≤ ‖z‖) :
    ¬ Summable fun n : ℕ => (bernoulli n : ℂ) * z ^ n / n ! := by sorry

/-- CA.2/tangent-coefficients-do-not-decay: a sequence whose odd terms are the tangent numbers,
given by their Bernoulli closed form, has `∑ eₙ zⁿ / n!` divergent on and beyond `|z| = π/2`. -/
theorem not_summable_mul_pow_of_tangent_closed_form (e : ℕ → ℚ)
    (he : ∀ n : ℕ, e (2 * n + 1) = (-1) ^ n * 2 ^ (2 * n + 2) * (2 ^ (2 * n + 2) - 1) *
      bernoulli (2 * n + 2) / (2 * n + 2))
    {z : ℂ} (hz : Real.pi / 2 ≤ ‖z‖) :
    ¬ Summable fun n : ℕ => (e n : ℂ) * z ^ n / n ! := by sorry

/-- Unit test `tangent_closed_form_three`: the closed form gives `E₃ = 2` from `B₄ = -1/30`. -/
example : ((-1) ^ 1 * 2 ^ (2 * 1 + 2) * (2 ^ (2 * 1 + 2) - 1) * bernoulli (2 * 1 + 2) /
    (2 * 1 + 2) : ℚ) = 2 := by sorry

end Suppliers

end CA2

end TauCeti.ClassicalArithmetic
