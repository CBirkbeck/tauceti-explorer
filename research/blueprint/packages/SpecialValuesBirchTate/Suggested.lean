import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Estimates

/-!
# SpecialValuesBirchTate: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the definitions and theorem
signatures of the roadmap that can be stated against the pinned Mathlib and Tau Ceti, together
with two proved `example` checks for each retained definition. The README also
records the independent Pfister-symbol target (§0.1), the normalized integral lattice comparison
(§8.2), and the open supplier premise (V). No retained signature uses that premise; the continued
values and their arithmetic descendants remain README targets with their stated hypotheses.
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

/-- The prime `5`, for the field `ZMod 5` of §3.2. -/
local instance : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/- ## Layer 2: sign, rationality, integrality and primewise reconstruction -/

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

end Archimedean

section Positivity

variable (F : Type*) [Field F] [NumberField F]

/-- §2.2. On the real half-line `σ > 1` Mathlib's Dedekind zeta function is a real number at
least one: every term of its L-series is a nonnegative real and the unit ideal contributes `1`. -/
theorem one_le_dedekindZeta_ofReal {σ : ℝ} (hσ : 1 < σ) :
    ∃ x : ℝ, 1 ≤ x ∧ dedekindZeta F σ = x := by sorry

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

end Valuations

/- ## Layer 3: independent examples over ℚ and ℚ(√5) -/

section Examples

/-- §3.2. The quadratic character modulo `5`, the character of `ℚ(√5)`: Mathlib's quadratic
character of the field `ZMod 5`, with values cast to `ℂ`. -/
def chiFive : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-- §3.2. The value `L(-1, χ₅) = -2/5 = -B_{2,χ₅}/2`, from the even Hurwitz decomposition and
`ζ(x, -1) = -B₂(x)/2`. -/
theorem LFunction_chiFive_neg_one : DirichletCharacter.LFunction chiFive (-1) = -2 / 5 := by
  sorry

/-- Check (§3.2): zero and the inert residue `2` distinguish the character from the constant-one
function and from the principal character. These proofs use the library quadratic character. -/
example : chiFive 0 = 0 ∧ chiFive 2 = -1 := by
  constructor
  · exact chiFive.map_zero
  · change (legendreSym 5 2 : ℂ) = -1
    rw [legendreSym.at_two (by decide), ZMod.χ₈_nat_eq_if_mod_eight]
    norm_num

/-- Check (§3.2): the character is one on `1` and `-1`; the latter rejects an odd character. -/
example : chiFive 1 = 1 ∧ chiFive (-1) = 1 := by
  constructor
  · exact chiFive.map_one
  · change (legendreSym 5 (-1) : ℂ) = 1
    rw [legendreSym.at_neg_one (by decide), ZMod.χ₄_nat_eq_if_mod_four]
    norm_num

end Examples

/- ## Layer 4: S-integers, Euler factors and naturality -/

section EulerFactors

variable (F : Type*) [Field F] [NumberField F]

/-- §4.1. The Euler factor of a finite set `S` of finite primes,
`∏ v ∈ S, (1 - N v ^ (-s))`: the factor by which deleting the primes of `S` multiplies the Dedekind
zeta function (the product of Tau Ceti's `LSeries_ofBadPrimes`). -/
def sEulerFactor (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) (s : ℂ) : ℂ :=
  ∏ v ∈ S, (1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (-s))

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

/-- Check (§4.1): a singleton at `-1` is the deleted Euler factor, rather than its inverse. -/
example (v : IsDedekindDomain.HeightOneSpectrum (𝓞 F)) :
    sEulerFactor F {v} (-1) = 1 - (Ideal.absNorm v.asIdeal : ℂ) := by
  simp [sEulerFactor]

/-- Check (§4.1): at `s = 0` a nonempty set makes the factor vanish, so the nonvanishing
milestone requires `n ≥ 2`. -/
example (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) (hS : S.Nonempty) :
    sEulerFactor F S 0 = 0 := by
  obtain ⟨v, hv⟩ := hS
  exact Finset.prod_eq_zero hv (by simp)

end EulerFactors

end TauCetiRoadmap.SpecialValuesBirchTate
