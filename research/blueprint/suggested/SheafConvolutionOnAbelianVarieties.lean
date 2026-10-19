import Mathlib.Data.Finset.Powerset
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Fintype.Fin

/-!
# Sheaf convolution on abelian varieties: suggested targets

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/SheafConvolutionOnAbelianVarieties.md`. These are
suggested signatures for milestones over carriers present at the recorded pins;
discharging them does not finish a layer. `sorry` is allowed in this roadmap
file: the statements are goals, not implementation claims.

The constructible, perverse, microlocal and Tannakian targets need the supplier
interfaces listed in the README. They have no substitute carriers here. The
finite combinatorics below use actual finite subsets and integer weights.

The pair indexed by j is (a(j+1), a(j+2)) in Lawrence--Sawin's one-based
notation. Geometric threefold exceptions start at j = 1, not j = 0.
-/

namespace TauCetiRoadmap.SheafConvolutionOnAbelianVarieties

open scoped BigOperators

/-- Multiplicity of weight t in the k-th exterior power of a diagonal module. -/
def wedgeMultiplicity {m : ℕ} (w : Fin m → ℤ) (k : ℕ) (t : ℤ) : ℕ :=
  ((Finset.univ.powersetCard k).filter fun s => ∑ i ∈ s, w i = t).card

/-- Consecutive positive solutions of the inhomogeneous Pell equation. -/
def exceptionalPair : ℕ → ℕ × ℕ
  | 0 => (1, 5)
  | j + 1 => let p := exceptionalPair j; (p.2, 4 * p.2 + 1 - p.1)

/-- The normalized degree d, rather than the representation dimension 6d. -/
def exceptionalDegree (j : ℕ) : ℕ :=
  Nat.choose ((exceptionalPair j).1 + (exceptionalPair j).2)
    (exceptionalPair j).1 / 6

/-! ## SC.5: the reusable finite counting interface -/

theorem wedgeMultiplicity_zero {m : ℕ} (w : Fin m → ℤ) (t : ℤ) :
    wedgeMultiplicity w 0 t = if t = 0 then 1 else 0 := by
  sorry

theorem wedgeMultiplicity_full {m : ℕ} (w : Fin m → ℤ) (t : ℤ) :
    wedgeMultiplicity w m t = if t = ∑ i, w i then 1 else 0 := by
  sorry

theorem wedgeMultiplicity_above_rank {m : ℕ} (w : Fin m → ℤ) (k : ℕ)
    (h : m < k) (t : ℤ) : wedgeMultiplicity w k t = 0 := by
  sorry

theorem wedgeMultiplicity_complement {m : ℕ} (w : Fin m → ℤ)
    (k : ℕ) (hk : k ≤ m) (t : ℤ) :
    wedgeMultiplicity w (m - k) t = wedgeMultiplicity w k ((∑ i, w i) - t) := by
  sorry

theorem wedgeMultiplicity_translate {m : ℕ} (w : Fin m → ℤ)
    (k : ℕ) (t b : ℤ) :
    wedgeMultiplicity (fun i => w i + b) k (t + (k : ℤ) * b) =
      wedgeMultiplicity w k t := by
  sorry

theorem exceptionalPair_positive (j : ℕ) :
    0 < (exceptionalPair j).1 ∧ (exceptionalPair j).1 < (exceptionalPair j).2 := by
  sorry

theorem exceptionalPair_equation (j : ℕ) :
    ((exceptionalPair j).1 : ℤ) ^ 2 -
      4 * (exceptionalPair j).1 * (exceptionalPair j).2 +
      ((exceptionalPair j).2 : ℤ) ^ 2 =
      (exceptionalPair j).1 + (exceptionalPair j).2 := by
  sorry

/-- Descent classifies all positive solutions; no abstract Pell predicate is assumed. -/
theorem pell_classification (a b : ℕ) (ha : 0 < a) (hab : a ≤ b)
    (h : (a : ℤ) ^ 2 - 4 * a * b + (b : ℤ) ^ 2 = a + b) :
    ∃ j, exceptionalPair j = (a, b) := by
  sorry

theorem exceptionalDegree_exact (j : ℕ) (hj : 1 ≤ j) :
    6 * exceptionalDegree j = Nat.choose
      ((exceptionalPair j).1 + (exceptionalPair j).2) (exceptionalPair j).1 := by
  sorry

/-- The n = 2 counting classification, expressed without an unavailable Eulerian carrier. -/
theorem surface_counting_classification {m k d : ℕ} (w : Fin m → ℤ)
    (s : ℤ) (hd : 0 < d) (hk : 1 < k) (hkm : k < m - 1)
    (hnorm : 2 * k ≤ m)
    (h : ∀ q : ℤ, wedgeMultiplicity w k (s + q) =
      if q = 0 ∨ q = 1 then d else 0) :
    m = 2 * k ∧ d = Nat.choose (2 * k - 1) k := by
  sorry

/-- The n = 3 alternative, with the normalized exterior exponent. -/
theorem threefold_counting_classification {m k d : ℕ} (w : Fin m → ℤ)
    (s : ℤ) (hd : 0 < d) (hk : 1 < k) (hkm : k < m - 1)
    (hnorm : 2 * k ≤ m)
    (h : ∀ q : ℤ, wedgeMultiplicity w k (s + q) =
      if q = 0 ∨ q = 2 then d else if q = 1 then 4 * d else 0) :
    (m = 4 ∧ k = 2 ∧ d = 1) ∨
      ∃ j, 1 ≤ j ∧ m = (exceptionalPair j).1 + (exceptionalPair j).2 ∧
        k = (exceptionalPair j).1 ∧ d = exceptionalDegree j := by
  sorry

/-- The n = 4 row admits no interior exterior-power realization. -/
theorem fourfold_counting_impossible {m k d : ℕ} (w : Fin m → ℤ)
    (s : ℤ) (hd : 0 < d) (hk : 1 < k) (hkm : k < m - 1)
    (h : ∀ q : ℤ, wedgeMultiplicity w k (s + q) =
      if q = 0 ∨ q = 3 then d else if q = 1 ∨ q = 2 then 11 * d else 0) :
    False := by
  sorry

/-! ## Discriminating examples (the README carries tests of the heavier objects) -/

example : wedgeMultiplicity (fun _ : Fin 4 => (0 : ℤ)) 2 0 = 6 := by
  sorry
example : wedgeMultiplicity (fun _ : Fin 4 => (0 : ℤ)) 2 1 = 0 := by
  sorry
example : wedgeMultiplicity (fun i : Fin 2 => (i.val : ℤ)) 3 0 = 0 := by
  sorry
example : wedgeMultiplicity (fun i : Fin 3 => (i.val : ℤ) - 1) 2 0 = 1 := by
  sorry
example : exceptionalPair 0 = (1, 5) := by
  sorry
example : exceptionalPair 1 = (5, 20) := by
  sorry
example : exceptionalPair 2 = (20, 76) := by
  sorry
example : exceptionalDegree 1 = 8855 := by
  sorry
example : 6 * exceptionalDegree 1 = 53130 := by
  sorry
example : exceptionalDegree 0 = 1 := by
  sorry

end TauCetiRoadmap.SheafConvolutionOnAbelianVarieties
