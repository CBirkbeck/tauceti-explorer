import Mathlib.RingTheory.FormalGroup.Basic
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The companion reader document
is definitive. These statements suggest Lean forms so that contributors and
reviewers can converge on names and signatures.

At the pinned libraries, formal group laws and their power-series-valued points
exist. Spectra, homological reflectors, Morava theories and spectral sheaves do
not. Their definitions, APIs, tests and theorems are README targets. This file
therefore contains only a light adapter to existing formal-group points and
the additive and multiplicative calculations used to test CH.1. It introduces
neither a spectral carrier nor a replacement for the LT.0 height invariant.

References: CH.1/geometric-height in the packet; Mathlib's FormalGroup.Point,
FormalGroup.𝔾ₐ and FormalGroup.𝔾ₘ at the recorded baseline.
-/

noncomputable section

namespace Chromatic.geometric_height

variable {R : Type*} [CommRing R] {σ : Type*}

/-- Evaluate integer multiplication on an existing formal-group point.
For prime `p`, this evaluates the p-series on that point. -/
def pSeries (F : FormalGroup R) (r : ℕ) (x : F.Point σ) : MvPowerSeries σ R :=
  (r • x).val

/-- The additive-law multiplication series is ordinary repeated addition. -/
theorem additive_nsmul (r : ℕ) (x : (FormalGroup.𝔾ₐ (R := R)).Point σ) :
    pSeries FormalGroup.𝔾ₐ r x = r • x.val := by
  sorry

/-- The coordinate is chosen so that the law is X + Y + XY. -/
theorem multiplicative_nsmul (r : ℕ) (x : (FormalGroup.𝔾ₘ (R := R)).Point σ) :
    pSeries FormalGroup.𝔾ₘ r x = (1 + x.val) ^ r - 1 := by
  sorry

/-- This is the zero p-series test for the additive law. -/
theorem additive_char_p (p : ℕ) [Fact p.Prime] [CharP R p]
    (x : (FormalGroup.𝔾ₐ (R := R)).Point σ) :
    pSeries FormalGroup.𝔾ₐ p x = 0 := by
  sorry

/-- This is the height-one p-series test for the multiplicative law. -/
theorem multiplicative_char_p (p : ℕ) [Fact p.Prime] [CharP R p]
    (x : (FormalGroup.𝔾ₘ (R := R)).Point σ) :
    pSeries FormalGroup.𝔾ₘ p x = x.val ^ p := by
  sorry

example (F : FormalGroup R) :
    pSeries F 0 (0 : F.Point σ) = 0 := by
  sorry

example (x : (FormalGroup.𝔾ₐ (R := ZMod 2)).Point σ) :
    pSeries FormalGroup.𝔾ₐ 2 x = 0 := by
  sorry

example (x : (FormalGroup.𝔾ₘ (R := ZMod 2)).Point σ) :
    pSeries FormalGroup.𝔾ₘ 2 x = x.val ^ 2 := by
  sorry

example (x : (FormalGroup.𝔾ₘ (R := ZMod 3)).Point σ) :
    pSeries FormalGroup.𝔾ₘ 3 x = x.val ^ 3 := by
  sorry

end Chromatic.geometric_height
