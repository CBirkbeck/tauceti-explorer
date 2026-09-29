import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Data.ZMod.Basic

/-!
# Suggested Lean forms: PotentialModularityAndCompatibleSystems, part R23.1 (R23.1–R24.2)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`PotentialModularityAndCompatibleSystems--R23.1`) is definitive. Schemes over rings of S-integers,
Hilbert modular forms and deformation rings are not in the pinned libraries in the needed form, so
the statements are comments; the checked examples test the numerology of Moret-Bailly's curve case and
of KW II's dimension counts.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R23.1/skolem-datum-and-integral-point
structure SkolemDatum (R : Type*) [CommRing R] [IsDedekindDomain R] where
  X : Scheme; f : X ⟶ Spec R; Σ : Finset (Place (FractionRing R))
  L : Σ → FiniteGaloisExtension; Ω : ∀ v : Σ, Set (X.points (L v))   -- open, smooth, Galois-stable
def SkolemDatum.IsComplete (S : SkolemDatum R) : Prop := ∀ v, v ∈ S.Σ ∨ v ∈ MaxSpec R
-- R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points
theorem moretBailly (S : SkolemDatum R) (h : ¬ S.IsComplete) : Nonempty S.IntegralPoint
-- R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring
theorem kw_theorem_10_1 (D : KWDeformationData ℚ ρ̄) : Module.Finite ℤ_[p] D.unframedRing
-- R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type
theorem exists_lift_of_required_type (D : KWDeformationData ℚ ρ̄) :
    ∃ (𝒪′ : Type) (_ : …), Nonempty (D.unframedRing →ₐ[𝒪] 𝒪′)
```
-/

namespace TauCeti.PotentialModularity.SuggestedTest

/-- `R23.1/generalized-picard-functor-and-effective-divisor-fibration`: the fibres of `φ_d` have
dimension `d + 1 − g − z`; for `𝔸¹ ⊂ ℙ¹` (`g = 0`, `z = 1`) this is `d`, the dimension of monic
polynomials of degree `d`; for `G_m ⊂ ℙ¹` (`z = 2`) it is `d − 1`. -/
example (d : ℕ) (hd : 1 ≤ d) : d + 1 - 0 - 1 = d ∧ d + 1 - 0 - 2 = d - 1 := by omega

/-- Lemme 3.6 needs `d ≥ 2g + z − 1`: for `g = 1`, `z = 1` it fails at `d = 1`. -/
example : ¬ (2 * 1 + 1 - 1 ≤ 1) := by norm_num

/-- `R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`: tame inertia of order `3` at `7`
is killed by an abelian extension of `ℚ₇`, since `3 ∣ 7 − 1`. -/
example : 3 ∣ 7 - 1 := by norm_num

/-- `R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`: the framed ring is a power series
ring over `R̄^ψ_S` in `4|S| − 1` variables; for `S = {p, ∞}` that is `7`. -/
example : 4 * 2 - 1 = 7 := by norm_num

/-- `R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` (Proposition 4.5):
`dim R̄^{□,loc} = 1 + 3|S|` and the lower bound `3|S| + 1 + |S| − 1 = 4|S|` for the framed ring, hence
`dim R̄^ψ_S ≥ 4|S| − (4|S| − 1) = 1`. -/
example (s : ℕ) (hs : 1 ≤ s) : 3 * s + 1 + s - 1 = 4 * s ∧ 4 * s - (4 * s - 1) = 1 := by omega

/-! ### Checkpoint 2: Taylor's auxiliary data and Lemma 1.5 -/

/-- `R23.2/taylor-auxiliary-data-p-L-psi-N-M`: `l` never divides `1 − 4l`, so `l` is unramified in
`ℚ(√(1 − 4l))` (at `l = 5`, `N₀ = ℚ(ζ₄, √−19)`). -/
example (l : ℤ) (hl : 2 ≤ l) : ¬ l ∣ (1 - 4 * l) := by
  rintro ⟨c, hc⟩
  have h1 : l * (c + 4) = 1 := by linarith
  have := Int.eq_one_of_mul_eq_one_right (by omega) h1
  omega

example : (1 : ℤ) - 4 * 5 = -19 := by norm_num

/-- Source issue E4 (Taylor 2002, Lemma 1.5): with `χ₁|_{I_x} ∼ ε^{−n}` and `0 ≤ n < l − 1`, the printed
conclusion `χ₁|_{I_x} = ω` means `(l − 1) ∣ (n + 1)`, i.e. `n = l − 2`, not the excluded case `n = 1`. -/
example (l n : ℕ) (hl : 3 ≤ l) (hn : n < l - 1) (h : (l - 1) ∣ (n + 1)) : n = l - 2 := by
  have := Nat.le_of_dvd (by omega) h
  omega

/-- E4, the intended reading: `χ₁|_{I_x} = ω^{−1}` means `(l − 1) ∣ (n − 1)`; with `1 ≤ n < l − 1` this is `n = 1`. -/
example (l n : ℕ) (hn1 : 1 ≤ n) (hn : n < l - 1) (h : (l - 1) ∣ (n - 1)) : n = 1 := by
  rcases Nat.eq_zero_or_pos (n - 1) with h0 | hpos
  · omega
  · have := Nat.le_of_dvd hpos h
    omega

/-! ### Checkpoint 3: Taylor 2006 §5 -/

/-- `R23.3/taylor-2006-lemma-5-3-weight-shift`: the identity
`(aX + cY)^l (bX + dY) − (aX + cY)(bX + dY)^l = (ad − bc)(X^l Y − X Y^l)` over `𝔽_l` rests on `a^l = a`. -/
example : ∀ a : ZMod 5, a ^ 5 = a := by decide

/-- `R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one`: `c` applications of the weight shift by `l + 1`
restore Serre's weight. -/
example (k c l : ℕ) (h : 2 + c * (l + 1) ≤ k) : k - c * (l + 1) + c * (l + 1) = k :=
  Nat.sub_add_cancel (le_trans (Nat.le_add_left _ _) h)

end TauCeti.PotentialModularity.SuggestedTest
