import Mathlib.Algebra.Polynomial.Degree.Defs
import Mathlib.Data.Nat.Totient
import Mathlib.Tactic.ComputeDegree
import Mathlib.Tactic.NormNum.GCD

/-!
# Suggested Lean forms: PotentialModularityAndCompatibleSystems, part R24.3 (R24.3–R24.6)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`PotentialModularityAndCompatibleSystems--R24.3`) is definitive. Galois representations, deformation
rings and compatible systems are not in the pinned libraries, so the statements below are comments;
the checked examples test the finite arithmetic of the lift types and of the Brauer argument.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R24.3/finite-presentation-complete-intersection (Böckle, Lemma 2)
theorem finite_presentation_ci {𝒪 : Type*} [CommRing 𝒪] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    (R : Type*) [CommRing R] [Algebra 𝒪 R] [IsLocalRing R] [Module.Finite 𝒪 R] {n m : ℕ} (hmn : m ≤ n)
    (f : Fin m → MvPowerSeries (Fin n) 𝒪) (e : R ≃ₐ[𝒪] MvPowerSeries (Fin n) 𝒪 ⧸ Ideal.span (Set.range f)) :
    m = n ∧ Module.Flat 𝒪 R ∧ IsCompleteIntersection R
-- R24.3/required-lift-types
structure RequiredLiftType (ρ̄ : GaloisRep ℚ 𝔽 2) where
  case : Fin 4
  aux : AuxData case         -- (q, χ′) in cases (3), (4)
  ψ : GaloisCharacter ℚ 𝒪
def RequiredLiftType.ring (t : RequiredLiftType ρ̄) : CNLAlgebra 𝒪 := R̄ψ_S t.localConditions
theorem RequiredLiftType.points_iff (t) (𝒪′) : (t.ring →ₐ 𝒪′) ≃ {ρ // IsLiftOfType t ρ}
-- R24.5/compatible-system
structure CompatibleSystem (F E : Type*) [Field F] [NumberField F] [Field E] [NumberField E] where
  rep : ∀ (ℓ : ℕ) [Fact ℓ.Prime] (ι : E →+* ℚ̄_[ℓ]), GaloisRep F ℚ̄_[ℓ] 2
  wd : ∀ 𝔮 : HeightOneSpectrum (𝓞 F), WeilDeligneRep 𝔮 E 2
  weights : ℤ × ℤ
def CompatibleSystem.IsAlmostStrict (S : CompatibleSystem F E) : Prop := …
-- R24.5/kw-theorem-5-1-systems
theorem kw_theorem_5_1 (ρ̄ : GaloisRep ℚ 𝔽 2) (h : KWHyp ρ̄) (t : RequiredLiftType ρ̄) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (S : CompatibleSystem ℚ E),
      S.IsAlmostStrict ∧ S.IsOdd ∧ S.IsIrreducible ∧ S.Lifts ρ̄ ∧ IsLiftOfType t (S.rep p ι_p)
```
-/

namespace TauCeti.CompatibleSystems.SuggestedTest

/-- `R24.3/required-lift-types`, type (4) at `p = 2`: level-two characters of 2-power order exist at
`q` iff `v₂(q + 1) ≥ 2`; `q = 7` qualifies (`8 = 2³`), `q = 5` does not (`2 ∣ 6`, `4 ∤ 6`). -/
example : 7 + 1 = 2 ^ 3 ∧ 2 ∣ 5 + 1 ∧ ¬ 4 ∣ 5 + 1 := by norm_num

/-- Type (3) at `p = 2`, `q = 5`: `ω₅` has order `4/gcd(4, 1) = 4` (odd `i` excluded), `ω₅²` has order
`4/gcd(4, 2) = 2`. Type (3) needs `p ∣ q − 1`: it is unavailable for `p = 3`, `q = 5`. -/
example : 4 / Nat.gcd 4 1 = 4 ∧ 4 / Nat.gcd 4 2 = 2 ∧ ¬ 3 ∣ 5 - 1 := by norm_num

/-- `R24.5/kw-theorem-5-1-systems`, Diamond's list at `p = 3`, `q = 5`: `r = v₃(6) = 1`, `m = 1`,
`j = m(q + 1)/p^r − 1 = 1`, `i = q − 1 − j = 3`, and `i ≠ j + 1`. -/
example : 1 * (5 + 1) / 3 ^ 1 - 1 = 1 ∧ 5 - 1 - 1 = 3 ∧ 3 ≠ 1 + 1 := by norm_num

/-- `R24.5/brauer-induction-system` on `ℤ/2`: the regular character `(2, 0)` minus the sign character
`(1, −1)` is the trivial character `(1, 1)`; the virtual character `3·1 − ε` has values `(2, 4)`, and
`4 > 2` shows it is not a character although its degree is `2`. -/
example : ((2 : ℤ) - 1, (0 : ℤ) - (-1)) = (1, 1) ∧ ((3 : ℤ) - 1, (3 : ℤ) - (-1)) = (2, 4) ∧ (2 : ℤ) < 4 := by
  norm_num

/-- `R24.3/finite-presentation-complete-intersection`: `𝒪⟦x⟧/(x² − π)` is finite free of rank 2 —
the relation is a monic polynomial of degree 2 (here with `π = 3` over `ℤ`). -/
example : (Polynomial.X ^ 2 - Polynomial.C (3 : ℤ)).natDegree = 2 := by
  compute_degree!

/-- `R24.3/modern-prescribed-type-lifts`: Snowden's (A2) is automatic over `ℚ`, since
`[ℚ(ζ₅) : ℚ] = φ(5) = 4`. -/
example : Nat.totient 5 = 4 := by decide

/-- `R24.5/compatible-system`: `Δ` gives Hodge–Tate weights `(11, 0)`, weight `a + 1 = 12`, regular. -/
example : (11 : ℕ) + 1 = 12 ∧ (11 : ℤ) ≠ 0 := by norm_num

end TauCeti.CompatibleSystems.SuggestedTest
