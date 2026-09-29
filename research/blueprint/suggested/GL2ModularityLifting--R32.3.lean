import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.NormNum

/-!
# Suggested Lean forms: GL2ModularityLifting, part R32.3 (R32.3–R32.6)

**Standard note.** This file is not the roadmap and it is not exhaustive; the roadmap document
(`GL2ModularityLifting--R32.3`) is definitive. Galois representations of `G_ℚ` with `p`-adic coefficients,
de Rham representations, modular forms and their Galois representations are not in the pinned libraries, so the
statements below are comments naming the objects they need, and the checked examples test the finite arithmetic
behind the hypotheses. Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R32.3/dyadic-de-rham-modularity-lifting (Tung, Theorem A)
theorem dyadic_deRham_modularity (ρ : GaloisRep ℚ 𝒪 2) (h2 : ringChar k = 2) (hirr : IsIrreducible ρ)
    (hodd : IsOdd ρ) (hram : FinitelyRamified ρ) (hdR : IsDeRhamAt ρ 2) (hHT : DistinctHTWeights ρ 2)
    (hmod : IsModular (residual ρ)) (hns : ¬ IsSolvable (image (residual ρ))) : IsModularUpToTwist ρ
-- R32.4/pan-residually-reducible-fontaine-mazur (Pan, Theorem 1.0.2)
theorem pan_residually_reducible (hp : Odd p) (ρ : GaloisRep ℚ E 2) (hirr : IsIrreducible ρ) (hodd : IsOdd ρ)
    (hram : FinitelyRamified ρ) (hpst : IsPotSemistableAt ρ p) (hHT : DistinctHTWeights ρ p)
    (hred : ∃ χ₁ χ₂, (residual ρ).semisimplification ≅ χ₁ ⊕ χ₂)
    (h3 : p = 3 → (χ₁ * χ₂⁻¹).restrict (G ℚ_[3]) ≠ ω) : IsModularUpToTwist ρ
-- R32.6/transfer-residually-irreducible-odd (Dieulefait–Pacetti, Theorem 1.4 as a transfer)
theorem modular_iff_of_congruent (hp : Odd p) (ρ ρ' : GaloisRep ℚ (ℚ̄_[p]) 2) (hcong : residual ρ ≅ residual ρ')
    (hirr : IsAbsIrreducible ((residual ρ).restrict (G (ℚ(√p*))))) (h : DeRhamDistinctHT ρ ∧ DeRhamDistinctHT ρ') :
    IsModular ρ ↔ IsModular ρ'
```
-/

namespace TauCeti.GL2ModularityLifting.SuggestedTest

/-- `R32.5/p-three-residually-reducible-branch`: the mod-3 cyclotomic character is nontrivial on `G_{ℚ₃}` (it is
ramified at 3; on `ℤ₃^×` it is reduction mod 3, which takes the value `2 ≠ 1`), so Skinner–Wiles' hypothesis
`χ̄₃|_{D₃} ≠ 1` is automatic. -/
example : (2 : ZMod 3) ≠ 1 := by decide

/-- `R32.5/p-three-residually-reducible-branch`: at `p = 3`, `ρ̄^{ss} ≅ 1 ⊕ χ̄₃` is exactly Pan's excluded case
`χ̄₁χ̄₂⁻¹ = ω` (with `χ̄₁ = 1`, `χ̄₂ = ω`, and `1 · ω⁻¹ = ω⁻¹ = ω` since `ω² = 1` for `p = 3`). -/
example : ∀ x : (ZMod 3)ˣ, x⁻¹ = x := by decide

/-- `R32.3/dyadic-de-rham-modularity-lifting`: at `p = 2` the mod-2 cyclotomic character is trivial (`(ℤ/2)^×` is
trivial), which is why Paškūnas' excluded shape `(χ ∗; 0 χ)` includes "extensions of 1 by ω". -/
example : ∀ x : (ZMod 2)ˣ, x = 1 := by decide

/-- `R32.6/transfer-residually-reducible`: Dieulefait–Pacetti's range `p ≥ 5` omits `p = 3`, which Pan covers
outside the `ω` case. -/
example : ¬ (5 ≤ 3) ∧ 3 % 2 = 1 := by norm_num

end TauCeti.GL2ModularityLifting.SuggestedTest
