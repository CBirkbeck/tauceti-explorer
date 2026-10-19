import Mathlib.Algebra.Module.Submodule.Lattice
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.Logic.Function.Iterate
import Mathlib.Algebra.Order.Field.Rat

/-!
# Generic crystalline monodromy: signatures available at the pinned libraries

The README is definitive; these suggested forms are aids, not an exhaustive
checklist. The filtered-isocrystal, reductive-group and diamond carriers required
for the other targets belong to its named prerequisite roadmaps. This file
contains only light definitions on existing carriers, their usable signatures,
a finite numerical milestone and examples.

Author: Codex — codex-cp0FrJ. Design issue: #3426.
-/

open scoped BigOperators

namespace TauCetiRoadmap.PadicHodgeTheoryPartII

/-- The integer at which a vector leaves a decreasing filtration.
Existence and uniqueness require hypotheses on the filtration. -/
def DegreeAt {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (F : ℤ → Submodule K V) (v : V) (d : ℤ) : Prop :=
  v ∈ F d ∧ v ∉ F (d + 1)

namespace DegreeAt

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
variable {F : ℤ → Submodule K V} {v : V} {d e : ℤ}

theorem mem (h : DegreeAt F v d) : v ∈ F d := h.1

theorem not_mem_succ (h : DegreeAt F v d) : v ∉ F (d + 1) := h.2

theorem unique (hF : Antitone F) (hd : DegreeAt F v d)
    (he : DegreeAt F v e) : d = e := by
  sorry

theorem exists_of_nonzero (hF : Antitone F)
    (hbounded : ∃ a b : ℤ, F a = ⊤ ∧ F b = ⊥) (hv : v ≠ 0) :
    ∃ d : ℤ, DegreeAt F v d := by
  sorry

theorem smul (c : K) (hc : c ≠ 0) :
    DegreeAt F (c • v) d ↔ DegreeAt F v d := by
  sorry

end DegreeAt

/-- Sum the jumps along a full Frobenius period; no equal-jump assumption. -/
def frobeniusDegreeSum {X : Type*} (degree : X → ℤ) (φ : X → X)
    (s : ℕ) (v : X) : ℤ :=
  ∑ i ∈ Finset.range s, degree ((φ^[i]) v)

variable {X Y : Type*}

theorem frobeniusDegreeSum_zero (degree : X → ℤ) (φ : X → X) (v : X) :
    frobeniusDegreeSum degree φ 0 v = 0 := by
  simp [frobeniusDegreeSum]

theorem frobeniusDegreeSum_one (degree : X → ℤ) (φ : X → X) (v : X) :
    frobeniusDegreeSum degree φ 1 v = degree v := by
  simp [frobeniusDegreeSum]

theorem frobeniusDegreeSum_succ (degree : X → ℤ) (φ : X → X)
    (s : ℕ) (v : X) :
    frobeniusDegreeSum degree φ (s + 1) v =
      frobeniusDegreeSum degree φ s v + degree ((φ^[s]) v) := by
  simp [frobeniusDegreeSum, Finset.sum_range_succ]

theorem frobeniusDegreeSum_map (degreeX : X → ℤ) (degreeY : Y → ℤ)
    (φ : X → X) (ψ : Y → Y) (f : X → Y)
    (hf : ∀ x, f (φ x) = ψ (f x))
    (hd : ∀ x, degreeY (f x) = degreeX x) (s : ℕ) (v : X) :
    frobeniusDegreeSum degreeY ψ s (f v) =
      frobeniusDegreeSum degreeX φ s v := by
  sorry

/-- Finite numerical core of the strict Hodge–Newton coroot argument.
Apply it to the coefficients of μ^diamond − ν and to the pairings of an
antidominant lowest weight with simple coroots. -/
theorem positive_sum_forces_zero {ι : Type*} (A : Finset ι) (c a : ι → ℚ)
    (hc : ∀ i ∈ A, 0 < c i) (ha : ∀ i ∈ A, a i ≤ 0)
    (hsum : 0 ≤ ∑ i ∈ A, c i * a i) :
    ∀ i ∈ A, a i = 0 := by
  sorry

-- A rank-one jump can be an arbitrary integer, including a negative integer.
example (a : ℤ) :
    DegreeAt (fun i : ℤ => if i ≤ a then (⊤ : Submodule ℚ ℚ) else ⊥) 1 a := by
  simp [DegreeAt]

-- No filtration gives the zero vector a degree.
example {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (F : ℤ → Submodule K V) (a : ℤ) : ¬ DegreeAt F 0 a := by
  simp [DegreeAt]

-- For jumps 2 and -1 the mixed vector has the lower jump.
example :
    let F : ℤ → Submodule ℚ (ℚ × ℚ) := fun i =>
      if i ≤ -1 then ⊤ else if i ≤ 2 then LinearMap.ker (LinearMap.snd ℚ ℚ ℚ) else ⊥
    DegreeAt F (1, 1) (-1) ∧ DegreeAt F (1, 0) 2 := by
  simp [DegreeAt, LinearMap.mem_ker]

example (degree : X → ℤ) (s : ℕ) (v : X) :
    frobeniusDegreeSum degree id s v = (s : ℤ) * degree v := by
  simp [frobeniusDegreeSum]

-- Unequal jumps in a Frobenius cycle must be added individually.
example :
    frobeniusDegreeSum (fun b : Bool => if b then 1 else -1) Bool.not 2 true = 0 ∧
      frobeniusDegreeSum (fun b : Bool => if b then 1 else -1) Bool.not 2 false = 0 := by
  decide

example :
    frobeniusDegreeSum (fun b : Bool => if b then 1 else -1) Bool.not 2 true ≠
      2 * (if true then (1 : ℤ) else -1) := by
  decide

/-
README targets requiring supplier carriers include newtonHodgeVectors,
decentCrystallineFibreFunctor, the coefficient-line classification, the
scheme-theoretic stabilizer criterion, ambient crystalline comparison, the
highest-weight estimates, generic admissibility, derived monodromy, generic
classical points, open-image points, central lifting, compact torsor components
and the quasisplit converse. None is replaced here by an opaque surrogate.
-/

end TauCetiRoadmap.PadicHodgeTheoryPartII
