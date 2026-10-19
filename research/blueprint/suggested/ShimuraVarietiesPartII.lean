import Mathlib.Algebra.Ring.Basic
import Mathlib.Data.Rat.Defs

/-!
These prototypes are aids, not the specification: the reader document is definitive,
and this file suggests forms rather than an exhaustive declaration checklist.
The geometric carriers for SV2.0–SV2.7 are absent at the pins. They are README targets,
with no stand-in assumption records here. The following light calculation specializes
SV2.5/matched-multiplier-datum to existing product carriers.

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
-/

namespace TauCetiRoadmap.ShimuraVarietiesPartII

/-- A specified operator scales a specified form by the specified multiplier.
In the geometric application the form is nondegenerate alternating and the operator
is invertible. This elementary predicate alone asserts neither property. -/
def HasMultiplier {R M : Type*} [Mul R]
    (ψ : M → M → R) (g : M → M) (c : R) : Prop :=
  ∀ x y, ψ (g x) (g y) = c * ψ x y

theorem HasMultiplier.identity {R M : Type*} [Monoid R] (ψ : M → M → R) :
    HasMultiplier ψ id 1 := sorry

theorem HasMultiplier.comp {R M : Type*} [Monoid R]
    {ψ : M → M → R} {g h : M → M} {c d : R}
    (_hg : HasMultiplier ψ g c) (_hh : HasMultiplier ψ h d) :
    HasMultiplier ψ (g ∘ h) (c * d) := sorry

theorem HasMultiplier.unique {R M : Type*} [CommRing R] [IsDomain R]
    {ψ : M → M → R} {g : M → M} {c d : R}
    (_hc : HasMultiplier ψ g c) (_hd : HasMultiplier ψ g d)
    (_hn : ∃ x y, ψ x y ≠ 0) : c = d := sorry

/-- The block operator has a common multiplier precisely when both blocks do.
The zero conditions are stated, so restriction to a summand is justified. -/
theorem block_hasMultiplier_iff {R M N : Type*} [CommRing R] [Zero M] [Zero N]
    (ψ₁ : M → M → R) (ψ₂ : N → N → R) (g₁ : M → M) (g₂ : N → N) (c : R)
    (_hψ₁ : ψ₁ 0 0 = 0) (_hψ₂ : ψ₂ 0 0 = 0)
    (_hg₁ : g₁ 0 = 0) (_hg₂ : g₂ 0 = 0) :
    HasMultiplier (fun x y : M × N => ψ₁ x.1 y.1 + ψ₂ x.2 y.2)
      (fun x => (g₁ x.1, g₂ x.2)) c ↔
      HasMultiplier ψ₁ g₁ c ∧ HasMultiplier ψ₂ g₂ c := sorry

-- Check HasMultiplier.identityPlane: the standard symplectic plane has multiplier one.
example : HasMultiplier (fun x y : ℚ × ℚ => x.1 * y.2 - x.2 * y.1) id 1 := sorry

-- Check HasMultiplier.diagonalTwo: diag(2,1) has multiplier two, not four or one.
example : HasMultiplier (fun x y : ℚ × ℚ => x.1 * y.2 - x.2 * y.1)
    (fun x => (2 * x.1, x.2)) 2 := sorry

-- Check HasMultiplier.unequalBlocks: multipliers two and three cannot be matched.
example : ¬ ∃ c : ℚ,
    HasMultiplier
      (fun x y : (ℚ × ℚ) × (ℚ × ℚ) =>
        (x.1.1 * y.1.2 - x.1.2 * y.1.1) + (x.2.1 * y.2.2 - x.2.2 * y.2.1))
      (fun x => ((2 * x.1.1, x.1.2), (3 * x.2.1, x.2.2))) c := sorry

end TauCetiRoadmap.ShimuraVarietiesPartII
