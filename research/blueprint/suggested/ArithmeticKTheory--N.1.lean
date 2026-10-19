/-
Independent fix review REV-FIX-RT-AREA-ktheory-1~2, Codex codex-WBAmLh, 2026-10-19.
This companion states a small selection of targets over pinned library carriers.
The full roadmap, API obligations, source locators and worked checks remain in
`research/blueprint/readmes/ArithmeticKTheory--N.1.md` and its packet. Unsupported carriers and
constructions are reader targets; none is replaced here by admitted data.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Theorem proofs marked `sorry` are proposed work, not a formalization.
-/

import Mathlib.GroupTheory.Torsion
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Localization.AsSubring

noncomputable section

open scoped nonZeroDivisors

universe u v

namespace TauCeti.ArithmeticK

open IsDedekindDomain NumberField

section Localisation

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (S : Set (HeightOneSpectrum R))
  (K : Type v) [Field K] [Algebra R K] [IsFractionRing R K]

/-- The submonoid `M_S ⊆ R` of the elements whose image in `O_S = S.integer K` is a unit (the
preimage of Mathlib's `IsUnit.submonoid`). -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer K)).comap (algebraMap R (S.integer K))

/-- **`ArithmeticKTheory:N.1/S-integers-as-a-localisation`.** For a submonoid `M ⊆ R`, `O_S` is
the localisation of `R` at `M` exactly when `M ⊆ M_S` and every prime of `S` meets `M`. No
finiteness of `S` is needed. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer K) ↔
      M ≤ sUnitSubmonoid S K ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

-- acceptance (`S = ∅`): `M = {1}` presents `O_∅ = R` (Mathlib's `IsDedekindDomain.integer_empty`).
example : IsLocalization (⊥ : Submonoid R) ((∅ : Set (HeightOneSpectrum R)).integer K) := by
  sorry

-- acceptance (`S` all primes): `M = R⁰` presents `O_S = K` (Mathlib's `integer_univ`).
example : IsLocalization R⁰ ((Set.univ : Set (HeightOneSpectrum R)).integer K) := by
  sorry

/-- **`ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`.** If `Cl(R)` is a
torsion group, `M_S` meets every prime of `S`, so `O_S` is the localisation of `R` at `M_S`, for
every set `S`. -/
theorem integer_isLocalization_of_isMulTorsion (h : IsMulTorsion (ClassGroup R)) :
    IsLocalization (sUnitSubmonoid S K) (S.integer K) := by
  sorry

end Localisation

/-- `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group` for a number field:
the class group of `𝓞 F` is finite (Mathlib's `NumberField.RingOfIntegers.instFintypeClassGroup`),
so `O_{F,S}` is the localisation of `𝓞 F` at `M_S` for every `S`. -/
theorem integer_isLocalization_ringOfIntegers (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

section IntExamples

/-- The height-one prime `(p)` of `ℤ` (test notation). -/
def intPrime (p : ℕ) [hp : Fact p.Prime] : HeightOneSpectrum ℤ where
  asIdeal := Ideal.span {(p : ℤ)}
  isPrime := (Ideal.span_singleton_prime (by exact_mod_cast hp.out.ne_zero)).2
    (Nat.prime_iff_prime_int.1 hp.out)
  ne_bot := by simpa using hp.out.ne_zero

-- acceptance (the S-integers of `ℚ` at `{2}` are `ℤ[1/2]`): the powers of `2` present them.
example : IsLocalization (Submonoid.powers (2 : ℤ))
    (({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ) := by
  sorry

-- acceptance (the same ring as a subalgebra of `ℚ`): `O_{ℚ,{2}} = ℤ[1/2]`.
example :
    ({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ = Algebra.adjoin ℤ {(1 / 2 : ℚ)} := by
  sorry

-- acceptance (non-example): `M = {1}` does not present `O_{ℚ,{2}}`.
example : ¬ IsLocalization (⊥ : Submonoid ℤ)
    (({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ) := by
  sorry

end IntExamples

section Ranks

variable (F : Type u) [Field F] [NumberField F]

/-- The Borel rank `ρ(n)` for `n ≥ 2`: `r₁ + r₂`, `r₂` or `0` according as `n ≡ 1 (mod 4)`,
`n ≡ 3 (mod 4)` or `n` is even (`ArithmeticKTheory:N.3:ranks/borel-rank-theorem`). At `n = 1` it
is not the rank of `K₁(O_{F,S})`, which is `r₁ + r₂ + |S| − 1`. -/
def borelRank (n : ℕ) : ℕ :=
  if n % 4 = 1 then InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F
  else if n % 4 = 3 then InfinitePlace.nrComplexPlaces F else 0

-- acceptance (`borel-rank-theorem`): `K₃(ℤ)`, `K₇(ℤ)` have rank `0`, `K₅(ℤ)`, `K₉(ℤ)` rank `1`.
example : borelRank ℚ 3 = 0 ∧ borelRank ℚ 7 = 0 ∧ borelRank ℚ 5 = 1 ∧ borelRank ℚ 9 = 1 := by
  sorry

-- acceptance (`borel-rank-theorem`): the even groups have rank `0`.
example (j : ℕ) : borelRank F (2 * j) = 0 := by
  simp only [borelRank]
  split_ifs <;> omega

-- acceptance (`borel-rank-theorem`, degree one excluded): for `ℤ` the period-four value at `n = 1`
-- is `1`, while `K₁(ℤ) = {±1}` has rank `0`.
example : borelRank ℚ 1 = 1 := by
  sorry

end Ranks

end TauCeti.ArithmeticK
