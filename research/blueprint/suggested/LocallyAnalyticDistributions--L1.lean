import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.Topology.Algebra.InfiniteSum.Nonarchimedean
import Mathlib.Analysis.Normed.Group.Ultra

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
reader document is definitive. These statements suggest Lean forms so that
contributors and reviewers can converge on names and signatures.

L1 scalar milestones at the pinned libraries, following WORKERS.md's
12 October 2026 shape. The LF test-function space, its strong dual, the
Gauss Frechet algebra topology, operator transposes and the strict logarithm
quotient are README targets: their carriers are unavailable at these pins.
There are no placeholder data definitions and no substitute distribution
structures. `openDiscMem` is only the actual coefficient condition, and
`normalizedSeriesPrimitive` is only the light native coefficient formula.
The Mahler derivation belongs to PadicMeasuresIwasawaAlgebras; below its
expression is used inline without a competing definition.
-/

noncomputable section

open scoped PowerSeries Topology

namespace TauCeti.AnalyticDistributions

/-- Native coefficient condition; this does not equip its subtype with a topology. -/
def openDiscMem {K : Type*} [NormedRing K] (F : PowerSeries K) : Prop :=
  ∀ r : ℝ, 0 < r → r < 1 → PowerSeries.IsRestricted r F

/-- Light coefficient formula, with an actual body and zero normalization. -/
def normalizedSeriesPrimitive {K : Type*} [Field K] (F : PowerSeries K) :
    PowerSeries K :=
  PowerSeries.mk fun n ↦ match n with
    | 0 => 0
    | n + 1 => F.coeff n / (n + 1 : K)

variable {p : ℕ} [Fact p.Prime]

/-- Native fixed-coefficient integration milestone. -/
theorem normalizedSeriesPrimitive_derivative (F : PowerSeries ℚ_[p]) :
    PowerSeries.derivative ℚ_[p] (normalizedSeriesPrimitive F) = F := by
  sorry

/-- Normalization fixes the ordinary formal primitive. -/
theorem normalizedSeriesPrimitive_unique (F G : PowerSeries ℚ_[p])
    (hD : PowerSeries.derivative ℚ_[p] G = F)
    (h0 : PowerSeries.constantCoeff G = 0) :
    G = normalizedSeriesPrimitive F := by
  sorry

/-- The larger input radius is essential to this continuous R+ integration estimate. -/
theorem normalizedSeriesPrimitive_radius (F : PowerSeries ℚ_[p]) (hF : openDiscMem F) :
    openDiscMem (normalizedSeriesPrimitive F) ∧
      ∀ r s : ℝ, 0 < r → r < s → s < 1 →
        PowerSeries.gaussNorm norm r (normalizedSeriesPrimitive F) ≤
          r * (1 - r / s)⁻¹ ^ 2 * PowerSeries.gaussNorm norm s F := by
  sorry

/-- End estimate for native differentiation and the supplier's Mahler derivation. -/
theorem derivative_gauss_control (F : PowerSeries ℚ_[p]) (hF : openDiscMem F) :
    openDiscMem (PowerSeries.derivative ℚ_[p] F) ∧
    openDiscMem ((1 + PowerSeries.X) * PowerSeries.derivative ℚ_[p] F) ∧
    ∀ r : ℝ, 0 < r → r < 1 →
      PowerSeries.gaussNorm norm r (PowerSeries.derivative ℚ_[p] F) ≤
        r⁻¹ * PowerSeries.gaussNorm norm r F ∧
      PowerSeries.gaussNorm norm r
          ((1 + PowerSeries.X) * PowerSeries.derivative ℚ_[p] F) ≤
        r⁻¹ * PowerSeries.gaussNorm norm r F := by
  sorry

/-- A statable scalar milestone for analytic substitution with nonzero constant. -/
theorem analyticAffineSubstitution_coeff_summable (F : PowerSeries ℚ_[p])
    (hF : openDiscMem F) (a b : ℚ_[p]) (ha : ‖a‖ < 1) (hb : ‖b‖ ≤ 1) (k : ℕ) :
    Summable (fun n : ℕ ↦ F.coeff (n + k) *
      (Nat.choose (n + k) k : ℚ_[p]) * a ^ n * b ^ k) := by
  sorry

/-- The scalar logarithm converges on the whole open disc. -/
theorem log_openDisc : openDiscMem (PowerSeries.log ℚ_[p]) := by
  sorry

/-- Existence of the zero-constant Mahler primitive, with genuine R+ membership. -/
theorem coordinate_division_milestone (F : PowerSeries ℚ_[p]) (hF : openDiscMem F) :
    ∃! G : PowerSeries ℚ_[p], openDiscMem G ∧ PowerSeries.constantCoeff G = 0 ∧
      (1 + PowerSeries.X) * PowerSeries.derivative ℚ_[p] G = F := by
  sorry

/-- Imported scalar evaluation milestone; no total summation is used outside its domain. -/
theorem openDisc_evaluation_summable (F : PowerSeries ℚ_[p])
    (hF : openDiscMem F) (z : ℚ_[p]) (hz : ‖z‖ < 1) :
    Summable (fun n : ℕ ↦ F.coeff n * z ^ n) := by
  sorry

end TauCeti.AnalyticDistributions

namespace L1Tests

open TauCeti.AnalyticDistributions

variable {p : ℕ} [Fact p.Prime]

example : normalizedSeriesPrimitive (1 : PowerSeries ℚ_[p]) = PowerSeries.X := by
  sorry

example : (normalizedSeriesPrimitive (PowerSeries.X : PowerSeries ℚ_[2])).coeff 2 =
    (1 / 2 : ℚ_[2]) := by
  sorry

example : normalizedSeriesPrimitive (0 : PowerSeries ℚ_[p]) = 0 := by
  sorry

example : openDiscMem (PowerSeries.mk fun _ : ℕ ↦ (1 : ℚ_[p])) ∧
    ¬PowerSeries.IsRestricted 1 (PowerSeries.mk fun _ : ℕ ↦ (1 : ℚ_[p])) := by
  sorry

example : ¬openDiscMem (PowerSeries.mk fun n : ℕ ↦ ((p : ℚ_[p])⁻¹) ^ n) := by
  sorry

-- Checks the actual generated additive declaration from the indexed source theorem.
example (f : ℕ → ℚ_[p]) (hf : Filter.Tendsto f Filter.cofinite (𝓝 0)) : Summable f :=
  NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero hf

end L1Tests
