import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.NormNum

/-!
# Suggested Lean forms: ClassicalSerreModularity, part R33.5 (R33.5–R33.6)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ClassicalSerreModularity--R33.5`) is definitive. Galois representations and modular forms are not in
the pinned libraries, so the statements below are comments, and the checked examples test the finite
arithmetic of Dieulefait–Pacetti §3.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R33.5/qualitative-serre-theorem
theorem serre_weak (p : ℕ) [Fact p.Prime] (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄)
    (hirr : IsIrreducible ρ̄) : IsModularDP ρ̄
-- R33.6/modern-and-classical-modularity-agree
theorem isModularDP_iff (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsIrreducible ρ̄) :
    IsModularDP ρ̄ ↔ IsModular ρ̄
-- R33.6/strong-form-by-the-modern-route: the statement of R27.6, a second proof
theorem serre_strong' : StrongSerre
-- R33.6/elliptic-curve-export-via-either-route: the export as a function of the statement
theorem finiteFlatExport_of_strong (h : StrongSerre) (p : ℕ) (hp : 5 ≤ p) (ρ̄ : GaloisRep ℚ (F̄ p) 2)
    (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄) (hfl : IsFiniteAt ρ̄ p) (hdet : det ρ̄ = cyclotomic p) :
    ∃ (g : Newform (serreLevel ρ̄) 2 1) (λ : Ideal g.coeffRing), λ.LiesOver p ∧ Nonempty (residualRep g λ ≃ ρ̄)
```
-/

namespace TauCeti.SerreConjecture.SuggestedTest

/-- `R33.5/auxiliary-odd-prime-for-the-dyadic-system`: at Serre weight 2, Lemma 1.14's bad-dihedral
primes are `2·2 − 1 = 3` and `2·2 − 3 = 1`, so any `p > 3` avoids them. -/
example : 2 * 2 - 1 = 3 ∧ 2 * 2 - 3 = 1 := by norm_num

example (p : ℕ) (hp : 3 < p) : p ≠ 2 * 2 - 1 ∧ p ≠ 2 * 2 - 3 := by omega

/-- `R33.5/dp-characteristic-two-closure`, the dyadic Dickson refinement (KW I Lemma 6.1): a unipotent
element in characteristic 2 has order 2, so no element of order 4 exists and `S₄` cannot occur as a
projective image. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) ^ 2 = 1 := by decide

/-- The `A₄` case sits in a Borel subgroup over `𝔽₄`: the upper-triangular group of `PGL₂(𝔽₄)` has
order `4 · 3 = 12 = |A₄|`, while `|PGL₂(𝔽₄)| = 4 · (4² − 1) = 60 = |A₅|`. -/
example : 4 * (4 - 1) = 12 ∧ 4 * (4 ^ 2 - 1) = 60 ∧ Nat.factorial 4 / 2 = 12 ∧ Nat.factorial 5 / 2 = 60 := by
  decide

end TauCeti.SerreConjecture.SuggestedTest
