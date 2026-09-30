import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.NormNum

/-!
# Suggested Lean forms: ClassicalSerreModularity, part R33.5 (R33.5–R33.6)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ClassicalSerreModularity--R33.5`) is definitive. Residual Galois representations of G_ℚ and the
Serre-modularity interface are not in the pinned libraries. Modular-form and newform carriers ARE
available: Mathlib's `ModularForm`/`CuspForm` and Tau Ceti's `HeckeRing.GL2.Newform`, to be reused
when that interface is built. The proposed signatures below remain comments because the Galois,
coefficient-place and residual-isomorphism interfaces are missing; the examples test only the finite
arithmetic of Dieulefait–Pacetti §3. This fix was not compiled at the pinned baseline.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

```
-- R33.5/auxiliary-odd-prime-for-the-dyadic-system:
-- choose the system from R24.5/kw-theorem-5-1-systems, type (1) for dyadic k=2,
-- type (2) for k=4. Its every characteristic-zero member is odd and irreducible.
-- KW's almost-strict clause gives crystallinity at each odd unramified p>3.
-- The residual member may be reducible; preserve both branches. No arbitrary-system
-- cross-characteristic Brauer-Nesbitt assertion or rank-one companion axiom is used.
-- R33.5/qualitative-serre-theorem
theorem serre_weak (p : ℕ) [Fact p.Prime] (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄)
    (hirr : IsIrreducible ρ̄) : IsModularDP ρ̄
-- R33.6/modern-and-classical-modularity-agree
theorem isModularDP_iff (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsIrreducible ρ̄) :
    IsModularDP ρ̄ ↔ IsModular ρ̄
-- R33.6/strong-form-by-the-modern-route: the statement of R27.6, a second proof
theorem serre_strong' : StrongSerre
-- R33.6/elliptic-curve-export-via-either-route: conditional for this rho-bar.
-- ArisesFrom and the invariants belong to R15.6/s-type-arises-from-and-modular.
-- CoefficientPlace and nebentypusMod are proposed Galois/coefficient interfaces,
-- not pinned definitions. The pinned Newform has level and weight parameters;
-- its character is a field χ, not a third type parameter.
theorem finiteFlatExport_of_strong (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p)
    (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄)
    (hfl : IsFiniteAt ρ̄ p) (hdet : det ρ̄ = cyclotomic p)
    (hstrong : ∃ (f : HeckeRing.GL2.Newform (serreLevel ρ̄) (serreWeight ρ̄))
      (λ : CoefficientPlace f p), ArisesFrom ρ̄ f λ ∧
        nebentypusMod f λ = serreCharacter ρ̄) :
    ∃ (g : HeckeRing.GL2.Newform (serreLevel ρ̄) 2) (λ : CoefficientPlace g p),
      g.χ = 1 ∧ ArisesFrom ρ̄ g λ
-- Proof: R15.4/weight-two-iff-finite-flat-at-p gives k=2 (with its coefficient
-- hypotheses); R15.6's determinant formula gives eps=1. Apply hstrong, then
-- R20.4/nebentypus-congruent-character at p>=5, retaining the residual isomorphism.
-- Specialize the single owned StrongSerre statement using serre_strong' to obtain
-- hstrong. Neither R27.6's classical proof nor its unconditional export is imported.
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
