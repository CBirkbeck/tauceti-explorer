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
  evenness condition at `2` built in, so that `α = 2` is admissible at odd primes only.
  The predicates themselves are total on natural inputs; their spectral application assumes
  that `p` is prime, while the implication between predicates holds for every natural `p`;
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

-- At `2` the sixth power enters the `E₂` range, while the fourth and seventh do not;
-- at `3` the cube enters the range and the square does not.
example :
    ¬ E2QuotientExponent 2 4 ∧ ¬ E2QuotientExponent 2 7 ∧ E2QuotientExponent 2 6 ∧
      ¬ E2QuotientExponent 3 2 ∧ E2QuotientExponent 3 3 := by
  unfold E2QuotientExponent
  decide

end QuotientExponents

/-! ## Layer 4: Number-field trace specialisations -/

section TraceInversion

open NumberField

/-- `TraceInversion F Δ`: the hypothesis of the genuine-fixed-point realisation of the
Habiro ring of `𝓞 F[1/Δ]` (KU Corollary 6.15, p.86): `Δ` is positive, divisible by `6`
and divisible by the discriminant of `F`. The coefficient ring itself needs only the last
condition (HabiroRings, number-field coefficients); README §4.1. -/
def TraceInversion (F : Type*) [Field F] [NumberField F] (Δ : ℤ) : Prop :=
  0 < Δ ∧ (6 : ℤ) ∣ Δ ∧ discr F ∣ Δ

-- `Δ = 6` is admissible for `ℚ`; `1` fails divisibility, while `0` and `−6` fail positivity.
example :
    TraceInversion ℚ 6 ∧ ¬ TraceInversion ℚ 1 ∧
      ¬ TraceInversion ℚ 0 ∧ ¬ TraceInversion ℚ (-6) := by
  refine ⟨⟨by norm_num, dvd_refl _, by simp⟩, ?_, ?_, ?_⟩
  · rintro ⟨-, h, -⟩
    omega
  · rintro ⟨h, -, -⟩
    omega
  · rintro ⟨h, -, -⟩
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

end TauCetiRoadmap.HabiroCohomologyFoundationsPartII
