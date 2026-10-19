import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Rayleigh
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula
import TauCeti.Algebra.AlgebraicGroup.Symplectic.Smooth

/-!
# Level-one automorphic forms for classical groups: suggested signatures

This file is not the roadmap and is not exhaustive. The definitive roadmap is
`research/blueprint/readmes/LevelOneAutomorphicFormsForClassicalGroups.md`.
These signatures suggest names and formulations on which contributors and reviewers
can converge. They claim no implementation: every theorem and test uses `sorry`.

The current WORKERS compact-file rule applies. Native automorphic representations,
Arthur packets, Siegel forms and higher theta kernels are absent at the pins, so
their exact specifications remain in the reader. There are no proposition-field
substitutes for those objects here. Definitions below are light specializations
of existing integer, finite-function and matrix carriers. Matrix and cone operations
remain the existing Mathlib operations.

The six definitions illustrate LO.1/weight-space, LO.2/admissible-quadratic-data,
LO.2/two-coordinate-criterion, LO.2/compressed-negativity and the two pieces of
LO.4/so3-worked-example. The examples discriminate normalizations rather than
claiming any formal verification of the companion archive.
-/

noncomputable section

open scoped BigOperators Matrix MatrixGroups

namespace TauCeti.LevelOne.Suggested

/-! ## LO.1: corrected regular doubled weights -/

/-- Doubled coordinates for a regular vector in `W_m`, including its type-D exception.
Indices are zero based: the exceptional pair is `(m / 2 - 1, m / 2)`. -/
def regularDoubledWeight {m : ℕ} (w : Fin m → ℤ) : Prop :=
  Antitone w ∧
    (∀ i, w i = -w i.rev) ∧
    (∀ i j, Even (w i - w j)) ∧
    ∀ i j, i < j →
      w i ≠ w j ∨
        (m % 4 = 0 ∧ i.val + 1 = m / 2 ∧ j.val = m / 2 ∧ w i = 0 ∧ w j = 0)

theorem regularDoubledWeight_antitone {m : ℕ} {w : Fin m → ℤ}
    (hw : regularDoubledWeight w) : Antitone w := by
  sorry

theorem regularDoubledWeight_symmetric {m : ℕ} {w : Fin m → ℤ}
    (hw : regularDoubledWeight w) (i : Fin m) : w i = -w i.rev := by
  sorry

theorem regularDoubledWeight_equal_coordinates {m : ℕ} {w : Fin m → ℤ}
    (hw : regularDoubledWeight w) {i j : Fin m} (hij : i < j) (h : w i = w j) :
    m % 4 = 0 ∧ i.val + 1 = m / 2 ∧ j.val = m / 2 ∧ w i = 0 ∧ w j = 0 := by
  sorry

-- Positive: the central double zero must survive the corrected ordered-index test.
example : regularDoubledWeight ![(2 : ℤ), 0, 0, -2] := by
  sorry

-- Negative: symmetric coordinates with a noncentral repetition are excluded.
example : ¬ regularDoubledWeight ![(2 : ℤ), 2, -2, -2] := by
  sorry

-- Negative: half-integral and integral coordinates cannot be mixed in W_m.
example : ¬ regularDoubledWeight ![(1 : ℤ), 0, -1] := by
  sorry

-- Dimension two has no type-D double-zero exception.
example : ¬ regularDoubledWeight ![(0 : ℤ), 0] := by
  sorry

/-! ## LO.2: the nonnegative cone, not all signed vectors -/

/-- The cone on which the automorphic explicit-formula inequality holds. -/
def nonnegativeCone (ι : Type*) : Set (ι → ℝ) := {t | ∀ i, 0 ≤ t i}

theorem nonnegativeCone_zero (ι : Type*) : (0 : ι → ℝ) ∈ nonnegativeCone ι := by
  sorry

theorem nonnegativeCone_add {ι : Type*} {x y : ι → ℝ}
    (hx : x ∈ nonnegativeCone ι) (hy : y ∈ nonnegativeCone ι) :
    x + y ∈ nonnegativeCone ι := by
  sorry

theorem nonnegativeCone_smul {ι : Type*} {a : ℝ} (ha : 0 ≤ a)
    {x : ι → ℝ} (hx : x ∈ nonnegativeCone ι) : a • x ∈ nonnegativeCone ι := by
  sorry

example : ![(1 : ℝ), 0] ∈ nonnegativeCone (Fin 2) := by
  sorry

example : ![(0 : ℝ), 1] ∈ nonnegativeCone (Fin 2) := by
  sorry

example : ![(1 : ℝ), -1] ∉ nonnegativeCone (Fin 2) := by
  sorry

/-- The exact quadratic form of a symmetric two-coordinate Gram matrix. -/
def twoCoordinateQuadratic (a b c x y : ℝ) : ℝ := a * x ^ 2 + 2 * b * x * y + c * y ^ 2

theorem twoCoordinateQuadratic_axis (a b c x : ℝ) :
    twoCoordinateQuadratic a b c x 0 = a * x ^ 2 := by
  sorry

theorem twoCoordinateQuadratic_homogeneous (a b c x y s : ℝ) :
    twoCoordinateQuadratic a b c (s * x) (s * y) =
      s ^ 2 * twoCoordinateQuadratic a b c x y := by
  sorry

theorem twoCoordinateQuadratic_negative_iff {a b c : ℝ} (ha : 0 ≤ a) (hc : 0 ≤ c) :
    (∃ x y : ℝ, 0 ≤ x ∧ 0 ≤ y ∧ (x ≠ 0 ∨ y ≠ 0) ∧
      twoCoordinateQuadratic a b c x y < 0) ↔ b < 0 ∧ a * c < b ^ 2 := by
  sorry

example : twoCoordinateQuadratic 1 (-2) 1 1 1 = -2 := by
  sorry

-- The same negative determinant with the other off-diagonal sign is insufficient.
example (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
    0 ≤ twoCoordinateQuadratic 1 2 1 x y := by
  sorry

-- A zero boundary value is not a strict exclusion certificate.
example : twoCoordinateQuadratic 1 (-1) 1 1 1 = 0 := by
  sorry

-- A zero diagonal is permitted; it must not be divided by in the proof.
example : twoCoordinateQuadratic 0 (-1) 1 1 1 < 0 := by
  sorry

/-! ## LO.2: averaging multiplicity blocks -/

/-- CN's average lift specialized to finite block coordinates. The denominator is
`m i`, rather than its square root; positivity of every `m i` is a theorem hypothesis. -/
def averageCoordinates {r : ℕ} (m : Fin r → ℕ) (t : Fin r → ℝ) :
    ((i : Fin r) × Fin (m i)) → ℝ := fun p => t p.1 / (m p.1 : ℝ)

theorem averageCoordinates_block_sum {r : ℕ} (m : Fin r → ℕ)
    (hm : ∀ i, 0 < m i) (t : Fin r → ℝ) (i : Fin r) :
    ∑ j : Fin (m i), averageCoordinates m t ⟨i, j⟩ = t i := by
  sorry

theorem averageCoordinates_nonnegative {r : ℕ} (m : Fin r → ℕ)
    (hm : ∀ i, 0 < m i) {t : Fin r → ℝ} (ht : t ∈ nonnegativeCone (Fin r)) :
    averageCoordinates m t ∈ nonnegativeCone ((i : Fin r) × Fin (m i)) := by
  sorry

theorem averageCoordinates_quadratic {r : ℕ} (m : Fin r → ℕ)
    (hm : ∀ i, 0 < m i) (t : Fin r → ℝ) (A : ℝ) (K : Matrix (Fin r) (Fin r) ℝ) :
    A * (∑ p : (i : Fin r) × Fin (m i), (averageCoordinates m t p) ^ 2) -
      (∑ p : (i : Fin r) × Fin (m i), ∑ q : (i : Fin r) × Fin (m i),
        K p.1 q.1 * averageCoordinates m t p * averageCoordinates m t q) =
      (∑ i, A / (m i : ℝ) * (t i) ^ 2) - ∑ i, ∑ j, K i j * t i * t j := by
  sorry

example : averageCoordinates (fun _ : Fin 1 => 2) (fun _ => 1) ⟨0, 0⟩ = 1 / 2 := by
  sorry

example : (∑ j : Fin 2,
    averageCoordinates (fun _ : Fin 1 => 2) (fun _ => 3) ⟨0, j⟩) = 3 := by
  sorry

-- Expanded and compressed unit-sphere minima need not coincide.
example : twoCoordinateQuadratic 0 (-1) 0 (Real.sqrt 2 / 2) (Real.sqrt 2 / 2) = -1 ∧
    (1 / 2 - 1 : ℝ) = -1 / 2 := by
  sorry

/-! ## LO.2: the extra conclusion beyond Mathlib's local-extremum eigenvector -/

theorem localRayleigh_minimum_is_least {n : ℕ}
    (T : EuclideanSpace ℝ (Fin (n + 1)) →L[ℝ] EuclideanSpace ℝ (Fin (n + 1)))
    (hT : IsSelfAdjoint T) {x : EuclideanSpace ℝ (Fin (n + 1))} (hx : ‖x‖ = 1)
    (hmin : IsLocalMinOn T.reApplyInnerSelf (Metric.sphere 0 1) x) :
    T x = T.rayleighQuotient x • x ∧
      ∀ y : EuclideanSpace ℝ (Fin (n + 1)), y ≠ 0 →
        T.rayleighQuotient x ≤ T.rayleighQuotient y := by
  sorry

/-! ## LO.4: the SO₃ normalization -/

/-- Rows are highest weights 0 through 4; columns are torsion orders 1,2,3,4,6. -/
def so3TraceMatrix : Matrix (Fin 5) (Fin 5) ℚ :=
  !![1, 1, 1, 1, 1;
     3, -1, 0, 1, 2;
     5, 1, -1, -1, 1;
     7, -1, 1, -1, -1;
     9, 1, 0, 1, -2]

theorem so3TraceMatrix_trivial (j : Fin 5) : so3TraceMatrix 0 j = 1 := by
  sorry

theorem so3TraceMatrix_identity_column (k : Fin 5) :
    so3TraceMatrix k 0 = 2 * (k.val : ℚ) + 1 := by
  sorry

theorem so3TraceMatrix_det : so3TraceMatrix.det = 288 := by
  sorry

example : so3TraceMatrix 0 3 = 1 := by
  sorry

example : so3TraceMatrix 1 1 = -1 := by
  sorry

example : so3TraceMatrix 4 4 = -2 := by
  sorry

/-- The signed rational mass solution, not a positive measure on the five classes. -/
def so3MassVector : Fin 5 → ℚ := ![-1 / 12, 1 / 4, 1 / 3, 0, 0]

theorem so3MassVector_equations :
    so3TraceMatrix.mulVec so3MassVector = ![1 / 2, -1 / 2, -1 / 2, -1 / 2, -1 / 2] := by
  sorry

theorem so3MassVector_unique (v : Fin 5 → ℚ)
    (hv : so3TraceMatrix.mulVec v = ![1 / 2, -1 / 2, -1 / 2, -1 / 2, -1 / 2]) :
    v = so3MassVector := by
  sorry

theorem so3MassVector_identity_negative : so3MassVector 0 < 0 := by
  sorry

example : so3MassVector 1 = 1 / 4 := by
  sorry

example : so3MassVector 3 = 0 ∧ so3MassVector 4 = 0 := by
  sorry

example : ¬ (∀ i, 0 ≤ so3MassVector i) := by
  sorry

/-! ## Existing native carriers: compatibility checks, not replacement definitions -/

example (m : ℕ) : Algebra.Smooth ℤ (TauCeti.Symplectic.coordinateHopfAlgebra ℤ m) := by
  sorry

example : Module.rank ℂ (CuspForm 𝒮ℒ 24) = 2 := by
  sorry

example : Module.rank ℂ (CuspForm 𝒮ℒ 23) = 0 := by
  sorry

-- E22: the full known classical set can have more than one eigenclass.
example : Module.rank ℂ (CuspForm 𝒮ℒ 54) = 4 := by
  sorry

-- The compact rank-sixteen parameter includes two additional trivial strings.
example : (2 * 4 + 7 + 1 : ℕ) = 16 := by
  sorry

end TauCeti.LevelOne.Suggested
