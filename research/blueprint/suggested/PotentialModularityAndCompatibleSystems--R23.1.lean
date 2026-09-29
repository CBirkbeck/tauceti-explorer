import Mathlib.Tactic.NormNum

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

end TauCeti.PotentialModularity.SuggestedTest
