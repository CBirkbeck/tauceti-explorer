import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Topology.UnitInterval
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm
import TauCeti.Topology.Algebra.QuadraticForm.SpecialOrthogonal

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Every proposed declaration is unimplemented.

The LieGroups layer-9 retraction is an input, not a definition in this file.
The parent packet owns circleEval, stabilization, the Spin coordinate formula,
and the no-SO-contraction theorem. The final signature takes their exact outputs
as explicit hypotheses on B; it does not redefine the parent circle ring or K₁.
-/

noncomputable section

namespace TauCeti.KTheory

-- These local notations abbreviate existing library carriers, not new objects.
local notation "Mat" n:max => Matrix (Fin n) (Fin n) ℝ
local notation "SL" n:max => Matrix.SpecialLinearGroup (Fin n) ℝ
local notation "SO" n:max =>
  TauCeti.QuadraticMap.specialOrthogonalGroup (TauCeti.realCliffordForm n 0)
local notation "coord" n:max =>
  TauCeti.QuadraticMap.specialOrthogonalToGeneralLinear
    (TauCeti.realCliffordForm n 0)

variable {n : ℕ}

/-- `KTheoryLowDegrees:U.3/so-homotopy-transfer`.
Bundle a determinant-one matrix homotopy in the existing SL subtype and
postcompose with the supplied continuous retraction. -/
def soHomotopyTransfer (r : C(SL n, SO n))
    (H : C(unitInterval × Circle, Mat n))
    (hdet : ∀ p, (H p).det = 1) : C(unitInterval × Circle, SO n) := by
  sorry

/-- Promoted evaluation API: `U.3/so-homotopy-transfer-apply`. -/
theorem soHomotopyTransfer_apply (r : C(SL n, SO n))
    (H : C(unitInterval × Circle, Mat n))
    (hdet : ∀ p, (H p).det = 1) (p : unitInterval × Circle) :
    soHomotopyTransfer r H hdet p = r ⟨H p, hdet p⟩ := by
  sorry

/-- Promoted initial-boundary API: `U.3/so-homotopy-transfer-zero`. -/
theorem soHomotopyTransfer_zero (r : C(SL n, SO n)) (hr1 : r 1 = 1)
    (H : C(unitInterval × Circle, Mat n)) (hdet : ∀ p, (H p).det = 1)
    (hzero : ∀ z : Circle, H (0, z) = 1) (z : Circle) :
    soHomotopyTransfer r H hdet (0, z) = 1 := by
  sorry

/-- Promoted final-boundary API: `U.3/so-homotopy-transfer-one`.
Only a pointwise SO witness is needed; no choice of a continuous angle occurs. -/
theorem soHomotopyTransfer_one (r : C(SL n, SO n))
    (hfix : ∀ (a : SL n) (g : SO n),
      ((coord n) g : Mat n) = (a : Mat n) → r a = g)
    (H : C(unitInterval × Circle, Mat n)) (hdet : ∀ p, (H p).det = 1)
    (z : Circle) (g : SO n) (hg : ((coord n) g : Mat n) = H (1, z)) :
    soHomotopyTransfer r H hdet (1, z) = g := by
  sorry

/-- Promoted based-boundary API: `U.3/so-homotopy-transfer-basepoint`. -/
theorem soHomotopyTransfer_basepoint (r : C(SL n, SO n)) (hr1 : r 1 = 1)
    (H : C(unitInterval × Circle, Mat n)) (hdet : ∀ p, (H p).det = 1)
    (hbase : ∀ t : unitInterval, H (t, 1) = 1) (t : unitInterval) :
    soHomotopyTransfer r H hdet (t, 1) = 1 := by
  sorry

-- Standard extensionality API; no subsequent node uses it as a prerequisite.
theorem soHomotopyTransfer_congr (r : C(SL n, SO n))
    (H H' : C(unitInterval × Circle, Mat n))
    (hdet : ∀ p, (H p).det = 1) (hdet' : ∀ p, (H' p).det = 1)
    (h : ∀ p, H p = H' p) :
    soHomotopyTransfer r H hdet = soHomotopyTransfer r H' hdet' := by
  sorry

-- Test TauCeti.KTheory.soHomotopyTransfer_identity_test (degenerate).
example (r : C(SL n, SO n)) (hr1 : r 1 = 1) :
    soHomotopyTransfer r (ContinuousMap.const _ (1 : Mat n)) (by sorry) =
      ContinuousMap.const _ (1 : SO n) := by
  sorry

-- Test TauCeti.KTheory.soHomotopyTransfer_quarter_turn_test (computation).
-- The supplied g is in the native carrier and its positive column rotation
-- matrix is exactly the one used by the parent's circle-spin-coordinates.
example (r : C(SL 2, SO 2))
    (hfix : ∀ (a : SL 2) (g : SO 2),
      ((coord 2) g : Mat 2) = (a : Mat 2) → r a = g)
    (g : SO 2) (hg : ((coord 2) g : Mat 2) = !![0, -1; 1, 0]) :
    soHomotopyTransfer r (ContinuousMap.const _ !![(0 : ℝ), -1; 1, 0])
      (by sorry) = ContinuousMap.const _ g := by
  sorry

-- Test TauCeti.KTheory.soHomotopyTransfer_diagonal_nonexample_test (non-example).
-- A determinant-one matrix need not preserve the positive quadratic form.
example (r : C(SL 2, SO 2)) (p : unitInterval × Circle) :
    ((coord 2) (soHomotopyTransfer r
      (ContinuousMap.const _ !![(2 : ℝ), 0; 0, 1 / 2]) (by sorry) p) : Mat 2) ≠
        !![(2 : ℝ), 0; 0, 1 / 2] := by
  sorry

/-- `KTheoryLowDegrees:U.3/circle-no-sl-contraction-via-retraction`.

For specialization to the parent, B z is the circleEval image of the stabilized
positive rotation. The hypothesis hcoords is supplied by circle-spin-coordinates;
hSO is precisely circle-no-so-contraction. These hypotheses have explicit
mathematical content and are not placeholder predicates. -/
theorem circle_no_sl_contraction_via_retraction (n : ℕ) (hn : 2 ≤ n)
    (r : C(SL n, SO n)) (hr1 : r 1 = 1)
    (hfix : ∀ (a : SL n) (g : SO n),
      ((coord n) g : Mat n) = (a : Mat n) → r a = g)
    (B : Circle → Mat n)
    (hcoords : ∀ θ : ℝ, ∃ g : SO n,
      ((coord n) g : Mat n) = B (Circle.exp (2 * θ)))
    (hSO : ¬ ∃ K : C(unitInterval × Circle, SO n),
      (∀ z : Circle, K (0, z) = 1) ∧
      (∀ z : Circle, ((coord n) (K (1, z)) : Mat n) = B z) ∧
      (∀ t : unitInterval, K (t, 1) = 1)) :
    ¬ ∃ H : C(unitInterval × Circle, Mat n),
      (∀ p, (H p).det = 1) ∧
      (∀ z : Circle, H (0, z) = 1) ∧
      (∀ z : Circle, H (1, z) = B z) ∧
      (∀ t : unitInterval, H (t, 1) = 1) := by
  sorry

end TauCeti.KTheory
