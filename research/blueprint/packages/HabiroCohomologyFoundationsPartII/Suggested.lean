import Mathlib

/-!
# HabiroCohomologyFoundationsPartII: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib; it is not exhaustive. Trace inputs,
trace q-Hodge pairs, their Habiro descent, the framed and canonical comparisons and the
genuine-fixed-point realisation of the Habiro ring of a number field live on spectral and
filtered enhanced carriers that are not at the pins, so they are README targets only.

Design choices made explicit here:
* the exponent conditions for spherical quotient lifts are stated prime by prime, with the
  evenness condition at `2` built in, so that `α = 2` is admissible at odd primes only;
* the numerator of the q-divided power on the diagonal is a polynomial in the variables
  `(x, y, q)`, in this order, and the q-shift acts on `x`;
* the trace inversion condition is a condition on the chosen integer `Δ`, not on the ring
  `𝓞 F[1/Δ]`, and keeps `0 < Δ`, `6 ∣ Δ` and `discr F ∣ Δ` as separate conjuncts.
-/

namespace TauCetiRoadmap.HabiroCohomologyFoundationsPartII

/-! ## Layer 2: Quasi-regular quotients -/

section QuotientExponents

/-- `E1QuotientExponent p α`: the range in which Burklund's quotient towers give an
`E₁`-algebra structure on `T/y^α` for a `p`-complete connective `E∞`-ring `T` and
`y ∈ π₀ T`: `α ≥ 2` at odd primes, `α` even and at least `4` at `2`
(QH Remark 4.23, p.63; KU Examples 6.8–6.9, pp.82–83; Burklund Theorem 1.4 and Remark 5.5).
Belongs to Layer 2, §2.1 (`quotientLift`). -/
def E1QuotientExponent (p α : ℕ) : Prop :=
  if p = 2 then Even α ∧ 4 ≤ α else 2 ≤ α

/-- `E2QuotientExponent p α`: the corresponding `E₂` range, `α ≥ 3` at odd primes and `α`
even and at least `6` at `2` (KU Example 6.8, p.82; TC Remark 3.6, p.31). -/
def E2QuotientExponent (p α : ℕ) : Prop :=
  if p = 2 then Even α ∧ 6 ≤ α else 3 ≤ α

-- At `2` the square and the fifth power are outside the range and the fourth power is
-- inside; at `3` the square suffices.
example :
    ¬ E1QuotientExponent 2 2 ∧ ¬ E1QuotientExponent 2 5 ∧ E1QuotientExponent 2 4 ∧
      E1QuotientExponent 3 2 := by
  unfold E1QuotientExponent
  decide

-- Every `E₂` exponent is an `E₁` exponent.
example (p α : ℕ) (h : E2QuotientExponent p α) : E1QuotientExponent p α := by
  unfold E2QuotientExponent at h
  unfold E1QuotientExponent
  split_ifs at h ⊢
  · exact ⟨h.1, by omega⟩
  · omega

end QuotientExponents

/-! ## Layer 3: Framed smooth algebras -/

section DiagonalDividedPowers

open MvPolynomial

/-- The numerator `(x − y)(x − q y) ⋯ (x − q^{d−1} y)` of the q-divided power
`δ^{(d)}_q(x, y)` on the diagonal, in `ℤ[x, y, q]` with variables `0 = x`, `1 = y`, `2 = q`.
Dividing by `[d]_q!` gives the generators of the q-PD envelope of `(x − y)`
(KU Lemma 6.11, p.84; README §3.2). -/
noncomputable def diagonalNumerator (d : ℕ) : MvPolynomial (Fin 3) ℤ :=
  ∏ i ∈ Finset.range d, (X 0 - X 2 ^ i * X 1)

/-- The q-shift identity behind `∇_{q,x} δ^{(d+1)}_q(x, y) = δ^{(d)}_q(x, y)`:
replacing `x` by `q x` changes the numerator by `(q^{d+1} − 1) · x` times the previous one.
Dividing by `(q − 1) · x · [d+1]_q!` gives the q-derivative formula of README §3.2,
which fixes the normalisation by `[d]_q!` rather than by the q-Pochhammer symbol. -/
theorem diagonalNumerator_shift (d : ℕ) :
    aeval ![X 2 * X 0, X 1, X 2] (diagonalNumerator (d + 1)) - diagonalNumerator (d + 1) =
      (X 2 ^ (d + 1) - 1) * X 0 * diagonalNumerator d := by
  have hterm : ∀ k : ℕ, aeval (![X 2 * X 0, X 1, X 2] : Fin 3 → MvPolynomial (Fin 3) ℤ)
      (X 0 - X 2 ^ (k + 1) * X 1 : MvPolynomial (Fin 3) ℤ) = X 2 * (X 0 - X 2 ^ k * X 1) := by
    intro k
    simp
    ring
  have h0 : aeval (![X 2 * X 0, X 1, X 2] : Fin 3 → MvPolynomial (Fin 3) ℤ)
      (X 0 - X 2 ^ 0 * X 1 : MvPolynomial (Fin 3) ℤ) = X 2 * X 0 - X 1 := by
    simp
  simp only [diagonalNumerator, map_prod]
  rw [Finset.prod_range_succ', Finset.prod_range_succ]
  simp only [hterm, h0, Finset.prod_mul_distrib, Finset.prod_const, Finset.card_range]
  ring

-- The two-term witness: `(q x − y)(q x − q y) − (x − y)(x − q y) = (q² − 1) x (x − y)`.
example :
    aeval ![X 2 * X 0, X 1, X 2] (diagonalNumerator 2) - diagonalNumerator 2 =
      (X 2 ^ 2 - 1) * X 0 * diagonalNumerator 1 := by
  simp [diagonalNumerator, Finset.prod_range_succ]
  ring

/-- At `q = 1` the numerator is `(x − y)^d`, the numerator of the ordinary divided power
`(x − y)^d / d!`. -/
theorem diagonalNumerator_one (d : ℕ) :
    aeval ![X 0, X 1, (1 : MvPolynomial (Fin 3) ℤ)] (diagonalNumerator d) = (X 0 - X 1) ^ d := by
  simp [diagonalNumerator, map_prod]

end DiagonalDividedPowers

/-! ## Layer 4: Number-field trace specialisations -/

section TraceInversion

open NumberField

/-- `TraceInversion F Δ`: the hypothesis of the genuine-fixed-point realisation of the
Habiro ring of `𝓞 F[1/Δ]` (KU Corollary 6.15, p.86): `Δ` is positive, divisible by `6`
and divisible by the discriminant of `F`. The coefficient ring itself needs only the last
condition (HabiroRings, number-field coefficients); README §4.1. -/
def TraceInversion (F : Type*) [Field F] [NumberField F] (Δ : ℤ) : Prop :=
  0 < Δ ∧ (6 : ℤ) ∣ Δ ∧ discr F ∣ Δ

-- `Δ = 6` is admissible for `ℚ`; `Δ = 1` is not, although `discr ℚ = 1` divides it.
example : TraceInversion ℚ 6 ∧ ¬ TraceInversion ℚ 1 := by
  refine ⟨⟨by norm_num, dvd_refl _, by simp⟩, ?_⟩
  rintro ⟨-, h, -⟩
  omega

/-- Under the trace inversion condition, `2` and `3` are units of `𝓞 F[1/Δ]`: the integer `Δ`
becomes a unit, `6` divides it, and a product of commuting elements is a unit exactly when
both factors are. This is the extra inversion of KU Theorem 5.63 used by Corollary 6.15. -/
theorem TraceInversion.isUnit_two_three {F : Type*} [Field F] [NumberField F] {Δ : ℤ}
    (h : TraceInversion F Δ) :
    IsUnit (2 : Localization.Away (Δ : 𝓞 F)) ∧ IsUnit (3 : Localization.Away (Δ : 𝓞 F)) := by
  obtain ⟨-, h6, -⟩ := h
  have hΔ : IsUnit (algebraMap (𝓞 F) (Localization.Away (Δ : 𝓞 F)) (Δ : 𝓞 F)) :=
    IsLocalization.Away.algebraMap_isUnit _
  have hd : (6 : Localization.Away (Δ : 𝓞 F)) ∣
      algebraMap (𝓞 F) (Localization.Away (Δ : 𝓞 F)) (Δ : 𝓞 F) := by
    have h := map_dvd (algebraMap (𝓞 F) (Localization.Away (Δ : 𝓞 F)))
      (map_dvd (Int.castRingHom (𝓞 F)) h6)
    rwa [eq_intCast, eq_intCast, Int.cast_ofNat, map_ofNat] at h
  have hu := isUnit_of_dvd_unit hd hΔ
  rw [show (6 : Localization.Away (Δ : 𝓞 F)) = 2 * 3 by norm_num] at hu
  exact (Commute.all _ _).isUnit_mul_iff.mp hu

end TraceInversion

/-!
The following README targets are not stated here, because their carriers (spectra with
circle and genuine cyclic actions, filtered enhanced modules, chosen q-Hodge pairs and
Habiro-complete objects) are not at the pins: `TraceInput` and its constructors (§1.1),
`tracePair` (§1.2), `traceHabiro` and its interface (§1.3), `quotientLift` and its
consequences (§2.1), `perfectedLiftNaive` and `perfectedLiftNaive_qReg` (§2.2),
`tracePair_quasiRegular` (§2.3), `framedTrace` and `framedTrace_einfty` (§3.1),
`qPDDiagonal` and `framedCech` (§3.2), `canonicalFramedTrace` (§3.3),
`genuineRealisation` (§4.1) and `numberFieldTraceExports` (§4.2).
-/

end TauCetiRoadmap.HabiroCohomologyFoundationsPartII
