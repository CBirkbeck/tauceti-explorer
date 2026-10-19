import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Estimates

/-!
# SpecialValuesBirchTate: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the roadmap that can be stated against the pinned Mathlib and Tau Ceti, together
with representative `example` checks for signs, twists and normalisations. The README also
records the exact supplier contracts for the independent certificates and the classical comparison.
References §k.n are to the subsections of `README.md`.

Design choices made explicit here:
* Mathlib's `NumberField.dedekindZeta` is an L-series and is used only on `1 < re s`; the
  continued Dedekind zeta function, K₂ of a ring, the invariants `w_n(F)`, étale cohomology and
  Iwasawa modules are not at the pins, so every statement involving them (in particular the
  Birch–Tate predicate and the end theorems) is a README target and is absent from this file.
* Archimedean factors are Mathlib's `Complex.Gammaℝ`, `Complex.Gammaℂ`; Mathlib's `Gamma` is
  totalised, so only regular values (at negative odd and positive even integers) are stated.
* Euler factors are deleted, not inverted: `sEulerFactor F S s = ∏ v ∈ S, (1 - N v ^ (-s))`, the
  same product as Tau Ceti's `LSeries_ofBadPrimes`; at `s = -1` it carries the sign `(-1) ^ #S`.
* The quadratic character modulo 5 is Mathlib's `quadraticChar (ZMod 5)` cast to `ℂ`.
-/

noncomputable section

open Complex NumberField

namespace TauCetiRoadmap.SpecialValuesBirchTate

/-- The prime `5`, for the field `ZMod 5` of §3.2 and the 5-adic checks. -/
local instance : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-! ## Layer 2: sign, rationality, integrality and primewise reconstruction -/

section Archimedean

/-- §2.1. The real archimedean factor at `-1` is the regular value `-2π`. -/
theorem gammaℝ_neg_one : Gammaℝ (-1) = -2 * (Real.pi : ℂ) := by sorry

/-- §2.1. The real archimedean factor at `2` is `1/π`. -/
theorem gammaℝ_two : Gammaℝ 2 = 1 / (Real.pi : ℂ) := by sorry

/-- §2.1. At a negative odd integer `1 - 2k` (`k ≥ 1`) the real archimedean factor is a nonzero
real number of sign `(-1) ^ k`; these points are not poles of `Γ_ℝ`. -/
theorem gammaℝ_one_sub_two_mul (k : ℕ) (hk : 1 ≤ k) :
    ∃ x : ℝ, 0 < x ∧ Gammaℝ (1 - 2 * k) = (-1) ^ k * x := by sorry

/-- §2.1. At a positive even integer the real archimedean factor is a positive real number. -/
theorem gammaℝ_two_mul_pos (k : ℕ) (hk : 1 ≤ k) :
    ∃ x : ℝ, 0 < x ∧ Gammaℝ (2 * k) = x := by sorry

/-- Check (§2.1, non-example): Mathlib's totalised `Γ_ℝ` vanishes at the pole `-2`, so no value of
the zeta function is ever computed by dividing by `Γ_ℝ` at a nonpositive even integer. -/
example : Gammaℝ (-2) = 0 := by
  rw [Complex.Gammaℝ_eq_zero_iff]
  exact ⟨1, by norm_num⟩

end Archimedean

section Positivity

variable (F : Type*) [Field F] [NumberField F]

/-- §2.2. On the real half-line `σ > 1` Mathlib's Dedekind zeta function is a real number at
least one: every term of its L-series is a nonnegative real and the unit ideal contributes `1`. -/
theorem one_le_dedekindZeta_ofReal {σ : ℝ} (hσ : 1 < σ) :
    ∃ x : ℝ, 1 ≤ x ∧ dedekindZeta F σ = x := by sorry

/-- Check (§2.2): over `ℚ` at `σ = 2` the value is `ζ(2) = π²/6 ≥ 1`. -/
example : (1 : ℝ) ≤ Real.pi ^ 2 / 6 := by
  have h := Real.pi_gt_three
  nlinarith

end Positivity

section Valuations

/-- §2.6. A positive rational number is determined by its prime valuations. -/
theorem rat_eq_iff_forall_padicValRat_eq {q r : ℚ} (hq : 0 < q) (hr : 0 < r) :
    q = r ↔ ∀ p : ℕ, p.Prime → padicValRat p q = padicValRat p r := by sorry

/-- §2.6. The primewise form used by §2.7: for `q ≠ 0` and positive `k, w`,
`|q| = k / w` if and only if `v_ℓ(k) = v_ℓ(w) + v_ℓ(|q|)` for every prime `ℓ`. -/
theorem abs_eq_natCast_div_iff_forall_padicVal {q : ℚ} (hq : q ≠ 0) {k w : ℕ} (hk : 0 < k)
    (hw : 0 < w) :
    |q| = (k : ℚ) / w ↔
      ∀ ℓ : ℕ, ℓ.Prime → (padicValNat ℓ k : ℤ) = padicValNat ℓ w + padicValRat ℓ |q| := by
  sorry

/-- Check (§2.6, non-example): positivity is needed, `-1` and `1` have the same valuations. -/
example : (-1 : ℚ) ≠ 1 ∧ ∀ p : ℕ, padicValRat p (-1) = padicValRat p 1 := by
  refine ⟨by norm_num, fun p => ?_⟩
  simp [padicValRat.neg]

/-- Check (§2.6, non-example): `q ≠ 0` is needed; `q = 0`, `k = w = 1` satisfy every valuation
identity (all three valuations are `0`) although `|0| ≠ 1 / 1`. -/
example : |(0 : ℚ)| ≠ (1 : ℕ) / (1 : ℕ) ∧
    ∀ ℓ : ℕ, (padicValNat ℓ 1 : ℤ) = padicValNat ℓ 1 + padicValRat ℓ |(0 : ℚ)| := by
  refine ⟨by norm_num, fun ℓ => ?_⟩
  simp

/-- Check (§2.7): the Birch–Tate valuations over `ℚ`, `|ζ(-1)| = 1/12 = 2/24`, and over
`ℚ(√5)`, `ζ(-1) = 1/30 = 4/120`. -/
example : |(-1 / 12 : ℚ)| = (2 : ℕ) / (24 : ℕ) ∧ |(1 / 30 : ℚ)| = (4 : ℕ) / (120 : ℕ) := by
  norm_num [abs_of_pos]

end Valuations

/-- Check (§2.8): Deligne–Ribet denominators over `ℚ` in weights 2, 4, 6:
`24 ζ(-1) = -2`, `240 ζ(-3) = 2`, `504 ζ(-5) = -2`, and over `ℚ(√5)`, `120 ζ(-1) = 4`. -/
example : (24 : ℚ) * (-1 / 12) = -2 ∧ (240 : ℚ) * (1 / 120) = 2 ∧ (504 : ℚ) * (-1 / 252) = -2 ∧
    (120 : ℚ) * (1 / 30) = 4 := by
  norm_num

/-- Check (§2.8): the smoothing prime `𝔠 = (3)` over `ℚ` at `p = 2`, `n = 2` has
`v₂(3² - 1) = 3 = v₂(24)`. -/
example : padicValNat 2 (3 ^ 2 - 1) = padicValNat 2 24 := by
  rw [show (3 ^ 2 - 1 : ℕ) = 2 ^ 3 by norm_num, show (24 : ℕ) = 2 ^ 3 * 3 by norm_num,
    padicValNat.mul (by norm_num) (by norm_num)]
  simp only [padicValNat.prime_pow]
  simp [padicValNat.eq_zero_of_not_dvd]

/-! ## Layer 3: independent examples over ℚ and ℚ(√5) -/

section Examples

/-- Check (§3.1): the monomial word has square `-I` and fourth power `I` in matrices. Its
nontriviality in the Steinberg kernel is supplied separately by the real sign symbol. -/
example :
    (!![(0 : ℤ), -1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) ^ 2 = -1 ∧
    (!![(0 : ℤ), -1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) ^ 4 = 1 := by
  decide

/-- Check (§3.2): the two selected norm-four minors certify index three; two copies of six
would not certify that index. -/
example : Nat.gcd 6 3 = 3 ∧ Nat.gcd 6 6 ≠ 3 := by decide

/-- Check (§3.2): multiplication by the golden unit on the basis `(1, ε)` has order three
modulo two and order eight modulo three. These are residue fields of orders four and nine. -/
example :
    (!![(0 : ZMod 2), 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 3 = 1 ∧
    (!![(0 : ZMod 2), 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 2 ≠ 1 ∧
    (!![(0 : ZMod 3), 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) ^ 4 = -1 ∧
    (!![(0 : ZMod 3), 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) ^ 8 = 1 := by
  decide

/-- Check (§3.2): the two real sign images are independent in exponent coordinates. -/
example : Matrix.det (!![(1 : ZMod 2), 0; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 1 := by
  decide

/-- Check (§3.1): `ζ(-1) = -1/12` from Mathlib's Bernoulli values. -/
example : riemannZeta (-1) = -1 / 12 := by
  have h := riemannZeta_neg_nat_eq_bernoulli 1
  rw [bernoulli_two] at h
  norm_num at h ⊢
  exact h

/-- Check (§1.1, §3.1): the formula over `ℚ` from its three values, and the three wrong variants
it rejects: dropping the sign, the roots of unity `w₁(ℚ) = 2` in place of `w₂(ℚ) = 24`, and the
field `ℚ` (with `Nat.card` of an infinite type equal to `0`) in place of its ring of integers. -/
example : (-1 / 12 : ℚ) = (-1) ^ 1 * 2 / 24 ∧ (-1 / 12 : ℚ) ≠ 2 / 24 ∧
    (-1 / 12 : ℚ) ≠ (-1) ^ 1 * 2 / 2 ∧ (-1 / 12 : ℚ) ≠ (-1) ^ 1 * 0 / 24 := by
  norm_num

/-- §3.2. The quadratic character modulo `5`, the character of `ℚ(√5)`: Mathlib's quadratic
character of the field `ZMod 5`, with values cast to `ℂ`. -/
def chiFive : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-- §3.2. `χ₅` is the Legendre symbol modulo `5`. -/
theorem chiFive_eq_legendreSym (a : ℤ) : chiFive a = (legendreSym 5 a : ℂ) := by sorry

/-- §3.2. The values at `2` and `3` are `-1`: these primes are inert in `ℚ(√5)`. -/
theorem chiFive_apply_two : chiFive 2 = -1 := by sorry

theorem chiFive_apply_three : chiFive 3 = -1 := by sorry

/-- §3.2. The values at `1` and `4` are `1`. -/
theorem chiFive_apply_four : chiFive 4 = 1 := by sorry

/-- §3.2. `χ₅` is even, `χ₅(-1) = χ₅(4) = 1`; an odd character would have `L(-1, χ) = 0`. -/
theorem chiFive_even : chiFive.Even := by sorry

/-- Check (§3.2): zero and the inert prime `2` distinguish `χ₅` from the constant-one function
and from the principal Dirichlet character. -/
example : chiFive 0 = 0 ∧ chiFive 2 = -1 := by
  exact ⟨chiFive.map_zero, chiFive_apply_two⟩

/-- Check (§3.2): the other inert residue `3` and split residue `4` have different signs. -/
example : chiFive 3 = -1 ∧ chiFive 4 = 1 :=
  ⟨chiFive_apply_three, chiFive_apply_four⟩

/-- §3.2. `χ₅` is not the trivial character modulo `5`. -/
theorem chiFive_ne_one : chiFive ≠ 1 := by sorry

/-- §3.2. The value `L(-1, χ₅) = -2/5 = -B_{2,χ₅}/2`, from the even Hurwitz decomposition and
`ζ(x, -1) = -B₂(x)/2`. -/
theorem LFunction_chiFive_neg_one : DirichletCharacter.LFunction chiFive (-1) = -2 / 5 := by
  sorry

/-- Check (§3.2): the Bernoulli-polynomial sum `Σ χ₅(j) B₂(j/5) = 4/25`, hence
`L(-1, χ₅) = 5 · (-1/2) · 4/25 = -2/5`, and `ζ_{ℚ(√5)}(-1) = (-1/12)(-2/5) = 1/30`. -/
example :
    let B₂ : ℚ → ℚ := fun x => x ^ 2 - x + 1 / 6
    B₂ (1 / 5) - B₂ (2 / 5) - B₂ (3 / 5) + B₂ (4 / 5) = 4 / 25 ∧
      (5 : ℚ) * (-1 / 2) * (4 / 25) = -2 / 5 ∧ (-1 / 12 : ℚ) * (-2 / 5) = 1 / 30 := by
  norm_num

/-- Check (§3.2): `w₂(ℚ(√5)) = 8 · 3 · 5 = 5 · w₂(ℚ)` and the check `1/30 = (-1)² · 4/120`. -/
example : (8 * 3 * 5 : ℕ) = 120 ∧ (120 : ℕ) = 5 * 24 ∧ (1 / 30 : ℚ) = (-1) ^ 2 * 4 / 120 := by
  norm_num

/-- Check (§3.2, ℓ = 5): `5 ∣ w₂` because `Gal(F(μ₅)/F)` has order `2`, and `25 ∤ w₂` because
`Gal(F(μ₂₅)/F)` is cyclic of order `10`, an exponent not dividing `2`. -/
example : (2 : ℕ) ∣ 2 ∧ ¬ (10 : ℕ) ∣ 2 := by decide

end Examples

/-! ## Layer 4: S-integers, Euler factors and naturality -/

section EulerFactors

variable (F : Type*) [Field F] [NumberField F]

/-- §4.1. The Euler factor of a finite set `S` of finite primes,
`∏ v ∈ S, (1 - N v ^ (-s))`: the factor by which deleting the primes of `S` multiplies the Dedekind
zeta function (the product of Tau Ceti's `LSeries_ofBadPrimes`). -/
def sEulerFactor (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) (s : ℂ) : ℂ :=
  ∏ v ∈ S, (1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (-s))

/-- §4.1. The empty set deletes nothing. -/
theorem sEulerFactor_empty (s : ℂ) : sEulerFactor F ∅ s = 1 := by
  simp [sEulerFactor]

/-- §4.1. Adding a prime multiplies by its Euler factor. -/
theorem sEulerFactor_insert [DecidableEq (IsDedekindDomain.HeightOneSpectrum (𝓞 F))]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    {v : IsDedekindDomain.HeightOneSpectrum (𝓞 F)} (hv : v ∉ S) (s : ℂ) :
    sEulerFactor F (insert v S) s =
      sEulerFactor F S s * (1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (-s)) := by sorry

/-- §4.1. Disjoint sets multiply. -/
theorem sEulerFactor_union [DecidableEq (IsDedekindDomain.HeightOneSpectrum (𝓞 F))]
    (S T : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (h : Disjoint S T) (s : ℂ) :
    sEulerFactor F (S ∪ T) s = sEulerFactor F S s * sEulerFactor F T s := by sorry

/-- §4.1. The Euler factor is entire. -/
theorem differentiable_sEulerFactor (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) :
    Differentiable ℂ (sEulerFactor F S) := by sorry

/-- §4.1. At `s = 1 - n` with `n ≥ 1` the factor is `∏ (1 - N v ^ (n - 1))`. -/
theorem sEulerFactor_one_sub_natCast (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (n : ℕ) (hn : 1 ≤ n) :
    sEulerFactor F S (1 - n) = ∏ v ∈ S, (1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (n - 1)) := by
  sorry

/-- §4.1. At `s = -1` the factor is `(-1) ^ #S · ∏ (N v - 1)`: deleting a prime changes the sign
of the special value. -/
theorem sEulerFactor_neg_one (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) :
    sEulerFactor F S (-1) =
      (-1) ^ S.card * ∏ v ∈ S, ((Ideal.absNorm v.asIdeal : ℂ) - 1) := by sorry

/-- §4.1. For `n ≥ 2` the factor does not vanish at `1 - n`, since every `N v ^ (n - 1) ≥ 2`. -/
theorem sEulerFactor_one_sub_ne_zero (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (n : ℕ) (hn : 2 ≤ n) : sEulerFactor F S (1 - n) ≠ 0 := by sorry

/-- Check (§4.1, degenerate): at `s = 0` every factor is `1 - 1 = 0`, so a nonempty `S` makes the
Euler factor vanish; the hypothesis `n ≥ 2` above cannot be weakened to `n ≥ 1`. -/
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) (hS : S.Nonempty) :
    sEulerFactor F S 0 = 0 := by
  obtain ⟨v, hv⟩ := hS
  exact Finset.prod_eq_zero hv (by simp)

/-- Check (§4.1, excluded weight): at `n = 0` the complex exponent is `-1`, while natural
subtraction truncates `0 - 1` to `0`. The formula requires `1 ≤ n`. -/
example : 1 - (2 : ℂ) ^ (-1 : ℂ) = 1 / 2 ∧
    1 - (2 : ℂ) ^ (0 - 1 : ℕ) = 0 := by
  norm_num [Complex.cpow_neg]

end EulerFactors

/-- Check (§4.1, §4.4): deleting `2` and `3` over `ℚ` at `s = -1`: the factors are
`1 - 2 = -1` and `1 - 3 = -2`, deleted rather than inverted, so `ζ_{ℚ,{2}}(-1) = 1/12`,
`ζ_{ℚ,{3}}(-1) = 1/6` (not `1/24`) and `ζ_{ℚ,{2,3}}(-1) = -1/6`. -/
example : (1 - (2 : ℂ) ^ (-(-1 : ℂ))) = -1 ∧ (1 - (3 : ℂ) ^ (-(-1 : ℂ))) = -2 := by
  simp only [neg_neg, Complex.cpow_one]
  norm_num

/-- Check (§4.3, §4.4): the S-integral formula over `ℚ` with `w₂(ℚ) = 24`:
`#K₂(ℤ[1/2]) = 2·1`, `#K₂(ℤ[1/3]) = 2·2`, `#K₂(ℤ[1/6]) = 2·1·2`, and
`1/12 = (+1)·2/24`, `1/6 = (+1)·4/24`, `-1/6 = (-1)³·4/24`; keeping the unmodified sign fails. -/
example : (-1 / 12 : ℚ) * (1 - 2) = (-1) ^ (1 + 1) * (2 * 1) / 24 ∧
    (-1 / 12 : ℚ) * (1 - 3) = (-1) ^ (1 + 1) * (2 * 2) / 24 ∧
    (-1 / 12 : ℚ) * (1 - 2) * (1 - 3) = (-1) ^ (1 + 2) * (2 * 1 * 2) / 24 ∧
    (-1 / 12 : ℚ) * (1 - 2) ≠ (-1) ^ 1 * (2 * 1) / 24 := by
  norm_num

/-- Check (§4.3): the residue factor at a prime above `ℓ` has `N v - 1 = ℓ ^ f - 1` prime to `ℓ`,
so inverting `ℓ` does not change the `ℓ`-part of `K₂`. -/
example (ℓ f : ℕ) (hℓ : 2 ≤ ℓ) (hf : 1 ≤ f) : ¬ ℓ ∣ ℓ ^ f - 1 := by
  intro h
  have h1 : ℓ ∣ ℓ ^ f := dvd_pow_self ℓ (by omega)
  have h2 : 1 ≤ ℓ ^ f := Nat.one_le_pow _ _ (by omega)
  have : ℓ ∣ ℓ ^ f - (ℓ ^ f - 1) := Nat.dvd_sub h1 h
  rw [Nat.sub_sub_self h2] at this
  exact absurd (Nat.le_of_dvd one_pos this) (by omega)

/-- Check (§4.6): in the exponent group `ℤ/3` for `𝔽₇ˣ/(𝔽₇ˣ)³`, the negative Kummer
class of a generator is `2`, whereas its positive class is `1`. -/
example : -(1 : ZMod 3) = 2 ∧ -(1 : ZMod 3) ≠ 1 := by decide

/-! ## Layer 5: the odd-primary theorem -/

/-- Check (§5.1): for the trivial `C₂` action, corestriction multiplies by `2`, and its
normalized inverse to restriction is `(1/2) cor`. This rational calculation is valid in `ℤ₃`. -/
example : (1 / 2 : ℚ) * (2 * 1) = 1 ∧ (2 : ℚ) * 1 ≠ 1 := by norm_num

/-- Check (§5.2, §5.3): the odd valuation identities `v_ℓ(#K₂) + v_ℓ(b) = v_ℓ(w₂) + v_ℓ(a)` for
`|ζ_F(-1)| = a/b`: over `ℚ` at `ℓ = 3` (`|ζ(-1)| = 1/12`, `#K₂ = 2`, `w₂ = 24`) and over `ℚ(√5)`
at `ℓ = 5` (`ζ(-1) = 1/30`, `#K₂ = 4`, `w₂ = 120`). -/
example : padicValNat 3 2 + padicValNat 3 12 = padicValNat 3 24 + padicValNat 3 1 ∧
    padicValNat 5 4 + padicValNat 5 30 = padicValNat 5 120 + padicValNat 5 1 := by
  rw [show (12 : ℕ) = 3 * 4 by norm_num, show (24 : ℕ) = 3 * 8 by norm_num,
    show (30 : ℕ) = 5 * 6 by norm_num, show (120 : ℕ) = 5 * 24 by norm_num,
    padicValNat.mul (by norm_num) (by norm_num), padicValNat.mul (by norm_num) (by norm_num),
    padicValNat.mul (by norm_num) (by norm_num), padicValNat.mul (by norm_num) (by norm_num)]
  simp [padicValNat.eq_zero_of_not_dvd]

/-! ## Layer 6: the 2-part for totally real abelian fields -/

/-- Check (§6.5): in characteristic two a nonzero module can be killed by two. Rationalising
therefore does not by itself determine its integral characteristic-ideal content. -/
example : (2 : PowerSeries (ZMod 2)) = 0 ∧ (1 : PowerSeries (ZMod 2)) ≠ 0 := by
  constructor
  · simpa only [map_ofNat, map_zero] using
      congrArg (fun x : ZMod 2 => PowerSeries.C x) (show (2 : ZMod 2) = 0 by decide)
  · exact one_ne_zero

/-- Check (§6.5): the negative eigenspace in `ℤ/4` for trivial conjugation has the nonzero
element `2`, but its natural image in the minus quotient `ℤ/2` is zero. -/
example : (2 : ZMod 4) ≠ 0 ∧ 2 * (2 : ZMod 4) = 0 ∧ (2 : ZMod 2) = 0 := by decide

/-- Check (§6.4): `u = 1 + 2^e ε` gives `1 - u² = -2^{e+1} ε (1 + 2^{e-1} ε)`, written with
`e = k + 1`; for `e ≥ 2` the last factor is odd, so `u⁻¹ - u ∼₂ 2^{e+1} = w₂^{(2)}(F)`. -/
example (k : ℕ) (ε : ℤ) :
    1 - (1 + 2 ^ (k + 1) * ε) ^ 2 = -(2 ^ (k + 2)) * ε * (1 + 2 ^ k * ε) := by
  ring

/-- Check (§6.1): over `ℚ` with `u = 5`, `G_ℚ(u⁻¹ - 1) = (1/12)(1/5 - 5) = -2/5`, of
2-adic valuation `1 = [ℚ : ℚ]`; over `ℚ(√2)` with `u = 9`,
`v₂((1/12)(1 - 2)(1/9 - 9)) = 2 = [ℚ(√2) : ℚ]`. -/
example : (1 / 12 : ℚ) * (1 / 5 - 5) = -2 / 5 ∧ padicValRat 2 (-2 / 5) = 1 ∧
    (1 / 12 : ℚ) * (1 - 2) * (1 / 9 - 9) = 20 / 27 ∧ padicValRat 2 (20 / 27) = 2 := by
  refine ⟨by norm_num, ?_, by norm_num, ?_⟩
  · rw [show (-2 / 5 : ℚ) = -(((2 : ℕ) : ℚ) / ((5 : ℕ) : ℚ)) by push_cast; ring, padicValRat.neg,
      padicValRat.div (by norm_num) (by norm_num), padicValRat.of_nat, padicValRat.of_nat]
    simp [padicValNat.eq_zero_of_not_dvd (show ¬ 2 ∣ 5 by decide)]
  · rw [show (20 / 27 : ℚ) = (((2 ^ 2 * 5 : ℕ) : ℚ) / ((27 : ℕ) : ℚ)) by push_cast; ring,
      padicValRat.div (by norm_num) (by norm_num), padicValRat.of_nat, padicValRat.of_nat,
      padicValNat.mul (by norm_num) (by norm_num)]
    simp only [padicValNat.prime_pow]
    simp [padicValNat.eq_zero_of_not_dvd]

/-- Check (§6.3): the covariant dual of multiplication by `2` on `ℤ/5` has eigenvalue `2`;
the contragredient dual instead has eigenvalue `3`. -/
example : (2 : ZMod 5) * 1 = 2 ∧ (2 : ZMod 5)⁻¹ * 1 = 3 ∧
    (2 : ZMod 5) ≠ (2 : ZMod 5)⁻¹ := by
  have hi : (2 : ZMod 5)⁻¹ = 3 := inv_eq_of_mul_eq_one_right (by decide)
  rw [hi]
  decide

/-- Check (§6.5): an order-four character distinguishes inverse second-kind twisting. This is
an algebraic coefficient model, without identifying complex and 2-adic L-values. -/
example : Complex.I⁻¹ * 5 - 1 = -1 - 5 * Complex.I ∧
    Complex.I * 5 - 1 ≠ Complex.I⁻¹ * 5 - 1 := by
  norm_num [Complex.inv_def, Complex.ext_iff]

/-! ## Layer 7: the 2-part for every totally real field -/

/-- Check (exact compact-support contract): the real dyadic norm `2` is injective on `ℤ₂`
but is not a unit, so ordinary degree-zero cohomology cannot be identified with Tate degree zero. -/
example : (∀ x : ℤ_[2], 2 * x = 0 ↔ x = 0) ∧ ¬ IsUnit (2 : ℤ_[2]) := by
  constructor
  · intro x
    simp
  · rw [PadicInt.not_isUnit_iff]
    change ‖((2 : ℕ) : ℤ_[2])‖ < 1
    rw [PadicInt.norm_p]
    norm_num

/-- Check (§7.5): the finite order-two error for odd `u` has kernel of order two and image of
order one under `γ-1`. Its cokernel also has order two; the finite Euler contribution is one. -/
example : Fintype.card {x : ZMod 2 // (4 : ZMod 2) * x = 0} = 2 ∧
    Fintype.card {y : ZMod 2 // ∃ x : ZMod 2, (4 : ZMod 2) * x = y} = 1 ∧
    (2 : ℚ) / 2 = 1 := by
  exact ⟨by decide, by decide, by norm_num⟩

/-- Check (§7.5): compact degrees two and three give `2/8`; moving the same denominator
to degree one inverts its Euler contribution. -/
example : (2 : ℚ) / 8 = 1 / 4 ∧ (2 : ℚ) * 8 ≠ 1 / 4 := by norm_num

/-- Check (§7.1, §7.2): over `ℚ` with `u = 5`, `(u² - 1) · ζ_{ℚ,{2}}(-1) = 24 · (1/12) = 2`,
matching `char(X) = (2)` and `#H²(ℤ[1/2], ℤ₂(2)) = 2`; in weight four
`(u⁴ - 1) · ζ(-3)(1 - 2³) = 624 · (-7/120)` has 2-adic valuation `1`. -/
example : ((5 : ℚ) ^ 2 - 1) * ((-1 / 12) * (1 - 2)) = 2 ∧
    ((5 : ℚ) ^ 4 - 1) * ((1 / 120) * (1 - 2 ^ 3)) = -182 / 5 ∧ padicValRat 2 (-182 / 5) = 1 := by
  refine ⟨by norm_num, by norm_num, ?_⟩
  rw [show (-182 / 5 : ℚ) = -(((2 * 91 : ℕ) : ℚ) / ((5 : ℕ) : ℚ)) by push_cast; ring,
    padicValRat.neg, padicValRat.div (by norm_num) (by norm_num), padicValRat.of_nat,
    padicValRat.of_nat, padicValNat.mul (by norm_num) (by norm_num)]
  simp [padicValNat.eq_zero_of_not_dvd]

/-- Check (§7.2, §7.3): the 2-adic Birch–Tate identities `v₂(#K₂) + v₂(b) = v₂(w₂) + v₂(a)` for
`|ζ_F(-1)| = a/b` over `ℚ` (`1 + 2 = 3`), `ℚ(√5)` (`2 + 1 = 3`) and `ℚ(√2)` (`2 + 2 = 4`). -/
example : padicValNat 2 2 + padicValNat 2 12 = padicValNat 2 24 + padicValNat 2 1 ∧
    padicValNat 2 4 + padicValNat 2 30 = padicValNat 2 120 + padicValNat 2 1 ∧
    padicValNat 2 4 + padicValNat 2 12 = padicValNat 2 48 + padicValNat 2 1 := by
  rw [show (4 : ℕ) = 2 ^ 2 by norm_num, show (12 : ℕ) = 2 ^ 2 * 3 by norm_num,
    show (24 : ℕ) = 2 ^ 3 * 3 by norm_num, show (30 : ℕ) = 2 * 15 by norm_num,
    show (120 : ℕ) = 2 ^ 3 * 15 by norm_num, show (48 : ℕ) = 2 ^ 4 * 3 by norm_num,
    padicValNat.mul (by norm_num) (by norm_num), padicValNat.mul (by norm_num) (by norm_num),
    padicValNat.mul (by norm_num) (by norm_num), padicValNat.mul (by norm_num) (by norm_num),
    padicValNat.mul (by norm_num) (by norm_num)]
  simp only [padicValNat.prime_pow]
  simp [padicValNat.eq_zero_of_not_dvd]

/-- Check (§7.5): the involution `γ ↦ uγ⁻¹` contributes the unit `-γ⁻¹` to the pole
factor. For `u = 5`, `γ = 25`, the alternative `u⁻¹γ` gives a different value. -/
example : (5 : ℚ) / 25 - 1 = -(25 : ℚ)⁻¹ * (25 - 5) ∧
    (5 : ℚ) / 25 - 1 ≠ (5 : ℚ)⁻¹ * 25 - 1 := by norm_num

/-! ## Layer 8: higher special values -/

/-- Check (§8.2): a rank-one regulator of determinant `2` has covolume `2`, unchanged by
reversing the basis; its index-two sublattice has covolume `4`. -/
example : |(2 : ℝ)| = 2 ∧ |(-2 : ℝ)| = 2 ∧ |(4 : ℝ)| = 2 * |(2 : ℝ)| ∧
    |(2 : ℝ)| ≠ (2 : ℝ)⁻¹ := by norm_num

/-- Check (§8.6): the plus sign in the relative determinant class cancels inverse
trivialisations; changing that sign gives the nonunit `4`. -/
example : (2 : ℚ) * (1 / 2) = 1 ∧ (2 : ℚ) * (1 / 2)⁻¹ ≠ 1 := by norm_num

/-- Check (§8.2, §8.5): the even-weight formula over `ℚ`,
`ζ(-1) = (-1)·2·2/48`, `ζ(-3) = (+1)·2·1/240`; without `2^{r₁}` the weight-two value would be
`-1/24`, and the K-theoretic formula including the prime 2 without that factor is false. -/
example : (-1 / 12 : ℚ) = (-1) ^ 1 * 2 * 2 / 48 ∧ (1 / 120 : ℚ) = (-1) ^ 2 * 2 * 1 / 240 ∧
    (-1 / 12 : ℚ) ≠ (-1) ^ 1 * 2 / 48 := by
  norm_num

/-- Check (§8.1, §8.3): the cohomological form `|ζ_F(1 - n)| = h_n / w_n` over `ℚ`:
`2/24 = 1/12`, `2/240 = 1/120`, `2/504 = 1/252`. -/
example : (2 : ℚ) / 24 = 1 / 12 ∧ (2 : ℚ) / 240 = 1 / 120 ∧ (2 : ℚ) / 504 = 1 / 252 := by
  norm_num

/-- Check (§8.4): the real-place correction at 2 over `ℚ`: `#H²/#H¹ = 2/8 = 2·2/16` in weight two
and `2/16 = 2·1/16` in weight four, with `#K₃(ℤ){2} = #K₇(ℤ){2} = 16`. -/
example : (2 : ℚ) / 8 = 2 * 2 / 16 ∧ (2 : ℚ) / 16 = 2 * 1 / 16 ∧ (2 : ℚ) / 240 ≠ 2 / 16 := by
  norm_num

#check @TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff
#check @TauCeti.LSeriesSummable_dedekindZetaCoeff_iff

end TauCetiRoadmap.SpecialValuesBirchTate

/-!
## Statements this file does not type

The continued Dedekind zeta function (LFunctions), K₂ of a ring (K2SymbolsBrauer), the invariants
`w_n(F)` (ArithmeticKTheory), étale and motivic cohomology of rings of S-integers
(MotivicEtaleKTheory), Iwasawa modules, characteristic ideals and the Deligne–Ribet series
(IntegralIwasawaTheory, AutomorphicPadicLFunctions) are not at the pinned libraries, so the
following README targets are not typed here: `BirchTateFormula` and its API (§1.1–§1.2); the
vanishing, sign, rationality and Deligne–Ribet integrality of `ζ_F(1 - n)` and the absolute-value
and primewise forms (§2.3–§2.5, §2.7–§2.9); the values `ζ_ℚ(-1)`, `ζ_{ℚ(√5)}(-1)`,
`w₂(ℚ(√5)) = 120` and the two Birch–Tate checks (§3.1–§3.2); `sModifiedZeta` with its values,
leading coefficients and the K₂ order of S-integers, the S-integral formula, enlargement of S and
the naturality of the comparisons (§4.1–§4.6); codescent and the étale special-value formula, and
the odd-primary theorem (§5.1–§5.3); the 2-adic zeta series, `FedererMainConjecture`, Kolster's
sequence, Theorem 1, Lemma 2 and Theorem 5, the auxiliary field, the second-kind twist, the
norm-kernel comparison, Federer's conjecture for abelian fields and Birch–Tate for them
(§6.1–§6.6); Kurihara's characteristic ideal, the 2-adic special values, the 2-part, the end
theorem `birchTateFormula_of_isTotallyReal`, the series dictionary, the comparison theorem and
Federer's conjecture for every totally real field (§7.1–§7.5); `hInvariant`, the motivic regulator,
the Lichtenbaum predicates and their proofs for totally real fields, the real-place correction and
`TateMotiveETNC`, its input data and rationality predicate (§8.1–§8.6).
-/
