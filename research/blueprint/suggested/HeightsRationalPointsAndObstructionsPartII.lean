import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.LinearAlgebra.Span.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.NormNum

/-!
# Heights, rational points and obstructions, Part II: uniform Bogomolov and uniform Mordell–Lang

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. It
records the few statements of the roadmap that are statable against the pinned Mathlib and
Tau Ceti, so that contributors and reviewers converge on names and signatures. Restricted
Hilbert schemes, Betti forms, adelic line bundles, heights of subvarieties, Néron–Tate heights
of abelian varieties and the uniform theorems themselves have no carriers at the pins; they are
README targets (layers UB.0–UB.12), not Lean declarations.

What is statable is the Euclidean geometry behind Rémond's counting (ball packing, the cone
covering, the packing-to-count step of Gao–Ge–Kühne Appendix A) and the linear-algebra core of
Xie–Yuan's descent of fields of definition (Lemma 3.4).
-/

noncomputable section

namespace TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII

open Metric

/-! ## Layer UB.0 / UB.5: packing in the Néron–Tate Euclidean space -/

section Packing

variable {ρ : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin ρ)

/-- Rémond's ball packing (GGK Appendix A.5; DGH proof of Proposition 8.1): every subset of a
closed ball of radius `R` in a `ρ`-dimensional Euclidean space is covered by at most
`(1 + 2R/r)^ρ` closed balls of radius `r ≤ R` centred at points of the subset. -/
theorem exists_finset_cover_closedBall {R r : ℝ} (hr : 0 < r) (hrR : r ≤ R) (x₀ : E) (S : Set E)
    (hS : S ⊆ closedBall x₀ R) :
    ∃ T : Finset E, (T : Set E) ⊆ S ∧ S ⊆ ⋃ t ∈ T, closedBall t r ∧
      (T.card : ℝ) ≤ (1 + 2 * R / r) ^ ρ := by
  sorry

/-- Points of a set all of whose `r`-balls are sparse: if every closed ball of radius `r`
centred at a point of a finite `S ⊆ closedBall Q R` contains at most `c` points of `S`, then
`#S ≤ c (1 + 2R/r)^ρ`. This is Step 4 of the proof of GGK Theorem 7.1, with `c = c₀^{rk Γ + 1}`
from the packing hypothesis. -/
theorem card_le_of_sparse_balls {R r : ℝ} (hr : 0 < r) (hrR : r ≤ R) (Q : E) (S : Finset E)
    (hS : (S : Set E) ⊆ closedBall Q R) (c : ℕ)
    (hc : ∀ P ∈ S, (S.filter fun x => dist x P ≤ r).card ≤ c) :
    (S.card : ℝ) ≤ c * (1 + 2 * R / r) ^ ρ := by
  sorry

/-- The cone covering of GGK Appendix A.5, Step 1: for `c ≥ 1` the Euclidean space is the union
of at most `(1 + √(8c))^ρ` sets on each of which `⟪P, Q⟫ ≥ (1 − 1/c)‖P‖‖Q‖`. -/
theorem exists_cone_cover {c : ℝ} (hc : 1 ≤ c) :
    ∃ C : Finset (Set E), (C.card : ℝ) ≤ (1 + Real.sqrt (8 * c)) ^ ρ ∧
      (⋃ D ∈ C, D) = Set.univ ∧
      ∀ D ∈ C, ∀ P ∈ D, ∀ Q ∈ D, (1 - 1 / c) * ‖P‖ * ‖Q‖ ≤ inner ℝ P Q := by
  sorry

end Packing

/-- Rank zero: one ball suffices, since the space is a point. -/
example (S : Set (EuclideanSpace ℝ (Fin 0))) (hS : S.Nonempty) :
    ∃ t ∈ S, S ⊆ closedBall t 1 := by
  sorry

/-- The bound `(1 + 2R/r)^ρ` for `ρ = 1`, `R = r`: three intervals of radius `r` centred in a
subset of `[−r, r]` suffice. -/
example : (1 + 2 * (1 : ℝ) / 1) ^ 1 = 3 := by norm_num

/-- The cone count of GGK for `c = 2` in rank one is `⌊1 + √16⌋ = 5`. -/
example : (1 + Real.sqrt (8 * 2)) ^ 1 = (5 : ℝ) := by
  rw [show (8 : ℝ) * 2 = 4 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]
  norm_num

/-! ## Layer UB.9: fields of definition of linear subspaces (Xie–Yuan Lemma 3.4) -/

section FieldOfDefinition

variable {k K : Type*} [Field k] [Field K] [Algebra k K] {n : Type*} [Fintype n]

/-- A `K`-subspace of `Kⁿ` is defined over an intermediate field `F` when it is spanned by its
vectors with all coordinates in `F`. -/
def SubspaceDefinedOver (F : IntermediateField k K) (W : Submodule K (n → K)) : Prop :=
  W = Submodule.span K {v : n → K | v ∈ W ∧ ∀ i, v i ∈ F}

/-- The linear core of Xie–Yuan Lemma 3.4: a subspace defined over two intermediate fields is
defined over their intersection (uniqueness of the reduced row echelon basis). -/
theorem SubspaceDefinedOver.inf {k₁ k₂ : IntermediateField k K} {W : Submodule K (n → K)}
    (h₁ : SubspaceDefinedOver k₁ W) (h₂ : SubspaceDefinedOver k₂ W) :
    SubspaceDefinedOver (k₁ ⊓ k₂) W := by
  sorry

/-- Every subspace is defined over `K` itself. -/
theorem subspaceDefinedOver_top (W : Submodule K (n → K)) :
    SubspaceDefinedOver (⊤ : IntermediateField k K) W := by
  sorry

/-- The zero subspace and the whole space are defined over the base field. -/
example : SubspaceDefinedOver (⊥ : IntermediateField k K) (⊥ : Submodule K (n → K)) := by
  sorry

example : SubspaceDefinedOver (⊥ : IntermediateField k K) (⊤ : Submodule K (n → K)) := by
  sorry

/-- A line spanned by `(1, a)` with `a ∉ k` is not defined over `k`. -/
example (a : K) (ha : a ∉ (⊥ : IntermediateField k K)) :
    ¬ SubspaceDefinedOver (⊥ : IntermediateField k K)
      (Submodule.span K {![1, a]} : Submodule K (Fin 2 → K)) := by
  sorry

end FieldOfDefinition

/-! ## Normalizations recorded in the README

* Degrees for the level-4 universal family: `deg_{𝔏_g^{⊗4}|A} X = 8^r deg_L X` (GGK (4.10));
  heights: `ĥ_{𝔏_g^{⊗4}|A} = 4 ĥ_{L ⊗ [−1]^*L}` (GGK (4.12)).
* The Néron–Tate height of a curve is half the canonical height of the twice-theta bundle
  (Yuan §4.3.1).
* Function-field heights keep the constant field `k` fixed and weight a place `v` by
  `[k(v) : k]` (Yuan §4.3.1).
-/

example (r d : ℕ) (h : r = 1) (hd : d = 2) : 8 ^ r * d = 16 := by subst h hd; norm_num

end TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII
