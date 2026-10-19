import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.RingTheory.Nilpotent.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Rat.Lemmas
import Mathlib.Data.Fin.VecNotation
import TauCeti.Combinatorics.Young.HookLength.Basic

/-!
# Counting bundles and Hall algebras of curves

This file is not the roadmap and is not exhaustive. It suggests names and
signatures for contributors and reviewers. It contains compact arithmetic
interfaces for CB.2, CB.6 and CB.8–CB.9. The accompanying
reader is the authoritative specification of all targets, hypotheses, sources,
APIs and tests. Sheaves, stacks, Hall algebras and Macdonald functions are
reader targets: this file introduces no substitute carriers for them.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

namespace TauCeti.CurveCounting

/-- Half the dimension of coprime stable canonical Higgs moduli (CB.7, CB.9). -/
def higgsHalfDimension (g r : ℤ) : ℤ := 1 + (g - 1) * r ^ 2

theorem higgsHalfDimension_rank_one (g : ℤ) : higgsHalfDimension g 1 = g := by
  sorry

theorem higgsHalfDimension_genus_one (r : ℤ) : higgsHalfDimension 1 r = 1 := by
  sorry

theorem higgsHalfDimension_positive (g r : ℤ) (hg : 1 ≤ g) :
    1 ≤ higgsHalfDimension g r := by
  sorry

example : higgsHalfDimension 2 2 = 5 := by sorry
example : higgsHalfDimension 0 1 = 0 := by sorry
example : 2 * higgsHalfDimension 3 1 = 6 := by sorry

/-- Riemann–Roch dimension for a strongly generating line of degree `-a`. -/
def frameDimension (g r d a : ℤ) : ℤ := (1 - g + a) * r + d

theorem frameDimension_add_degree (g r d a b : ℤ) :
    frameDimension g r d (a + b) = frameDimension g r d a + b * r := by
  sorry

theorem frameDimension_rank_one (g d a : ℤ) :
    frameDimension g 1 d a = 1 - g + a + d := by
  sorry

theorem frameDimension_coprime (g r d a : ℤ) (h : IsCoprime r d) :
    IsCoprime (frameDimension g r d a) r := by
  sorry

example : frameDimension 2 2 1 3 = 5 := by sorry
example : frameDimension 1 1 0 0 = 0 := by sorry
example : frameDimension 2 2 1 4 - frameDimension 2 2 1 3 = 2 := by sorry

/-- King determinant, with quotient-left Hall and slope conventions (CB.8). -/
def kingWeight (l₁ l₂ a₁ a₂ : ℤ) : ℤ := l₁ * a₂ - l₂ * a₁

theorem kingWeight_add (l₁ l₂ a₁ a₂ b₁ b₂ : ℤ) :
    kingWeight l₁ l₂ (a₁ + b₁) (a₂ + b₂) =
      kingWeight l₁ l₂ a₁ a₂ + kingWeight l₁ l₂ b₁ b₂ := by
  sorry

theorem kingWeight_slope (g r d r' d' a b : ℤ) :
    kingWeight (frameDimension g r d a) (frameDimension g r d b)
      (frameDimension g r' d' a) (frameDimension g r' d' b) =
      (b - a) * (d * r' - r * d') := by
  sorry

theorem kingWeight_nonzero (l₁ l₂ a₁ a₂ : ℕ)
    (hc : l₁.Coprime l₂) (h₁ : 0 < l₁) (h₂ : 0 < l₂)
    (ha₁ : a₁ ≤ l₁) (ha₂ : a₂ ≤ l₂)
    (hn : a₁ ≠ 0 ∨ a₂ ≠ 0) (hp : a₁ ≠ l₁ ∨ a₂ ≠ l₂) :
    kingWeight l₁ l₂ a₁ a₂ ≠ 0 := by
  sorry

example : kingWeight 2 3 1 1 = -1 := by sorry
example : kingWeight 2 3 1 2 = 1 := by sorry
example : kingWeight 2 3 2 3 = 0 := by sorry

/-- Weighted size of a finite Jordan multiplicity sequence (CB.2, CB.5). -/
def jordanSize (m : ℕ →₀ ℕ) : ℕ := m.sum fun i n => i * n

theorem jordanSize_zero : jordanSize 0 = 0 := by
  sorry

theorem jordanSize_single (i n : ℕ) : jordanSize (Finsupp.single i n) = i * n := by
  sorry

theorem jordanSize_add (m n : ℕ →₀ ℕ) : jordanSize (m + n) = jordanSize m + jordanSize n := by
  sorry

example : jordanSize (Finsupp.single 2 1) = 2 := by sorry
example : jordanSize (Finsupp.single 1 2) = 2 := by sorry
example : jordanSize (Finsupp.single 0 3) = 0 := by sorry

/-- Fine–Herstein enumeration, including the zero-by-zero matrix (CB.1).
The existing GL-cardinality theorem supplies only the unit denominator. -/
theorem card_nilpotent_matrix (K : Type*) [Field K] [Fintype K] (n : ℕ) :
    Nat.card {M : Matrix (Fin n) (Fin n) K // IsNilpotent M} =
      Fintype.card K ^ (n * (n - 1)) := by
  sorry

example (K : Type*) [Field K] [Fintype K] :
    Nat.card {M : Matrix (Fin 0) (Fin 0) K // IsNilpotent M} = 1 := by sorry
example (K : Type*) [Field K] [Fintype K] :
    Nat.card {M : Matrix (Fin 1) (Fin 1) K // IsNilpotent M} = 1 := by sorry
example (K : Type*) [Field K] [Fintype K] :
    Nat.card {M : Matrix (Fin 2) (Fin 2) K // IsNilpotent M} = Fintype.card K ^ 2 := by
  sorry

/-- Rank-two rational expression from CB.6, before imposing reciprocal pairs.
Over a field division is total; the geometric target uses regular extension
where a displayed denominator vanishes. -/
def rankTwoFormula {K : Type*} [Field K] {n : ℕ} (q : K) (α : Fin n → K) : K :=
  let P := ∏ i, (1 - α i)
  let U := ∏ i, (1 - q * α i)
  let V := ∏ i, (1 + α i)
  let S := ∑ i, (1 - α i)⁻¹
  P * (U / ((q - 1) * (q ^ 2 - 1)) - V / (4 * (1 + q)) +
    P / (2 * (q - 1)) * (1 / 2 - 1 / (q - 1) - S))

theorem rankTwoFormula_permute {n : ℕ} (q : ℚ) (α : Fin n → ℚ) (σ : Equiv.Perm (Fin n)) :
    rankTwoFormula q (α ∘ σ) = rankTwoFormula q α := by
  sorry

theorem rankTwoFormula_genus_zero (q : ℚ) (h₁ : q ≠ 1) (h₂ : q ≠ -1) :
    rankTwoFormula q (Fin.elim0 : Fin 0 → ℚ) = 0 := by
  sorry

theorem rankTwoFormula_genus_one (a b : ℚ) (h₀ : a * b ≠ 0)
    (h₁ : a * b ≠ 1) (h₂ : a * b ≠ -1) :
    rankTwoFormula (a * b) ![a, b] = (1 - a) * (1 - b) := by
  sorry

example : rankTwoFormula (2 : ℚ) (Fin.elim0 : Fin 0 → ℚ) = 0 := by sorry
example : rankTwoFormula (2 : ℚ) ![(-1 : ℚ), -2] = 6 := by sorry
example : rankTwoFormula (2 : ℚ) ![(-2 : ℚ), -1] = 6 := by sorry

/-- Rank-three origin constant, rather than the full Weil-data count (CB.6). -/
def rankThreeConstant (g : ℕ) : ℕ := 4 * g.choose 2 + g

theorem rankThreeConstant_one : rankThreeConstant 1 = 1 := by sorry

theorem rankThreeConstant_expand (g : ℕ) :
    rankThreeConstant g = 4 * g.choose 2 + g := by sorry

theorem rankThreeConstant_mono {g h : ℕ} (hh : g ≤ h) :
    rankThreeConstant g ≤ rankThreeConstant h := by sorry

example : rankThreeConstant 1 = 1 := by sorry
example : rankThreeConstant 2 = 6 := by sorry
example : rankThreeConstant 3 = 15 := by sorry

/-- Rank-four origin constant (CB.6). -/
def rankFourConstant (g : ℕ) : ℕ := 32 * g.choose 3 + 20 * g.choose 2 + g

theorem rankFourConstant_one : rankFourConstant 1 = 1 := by sorry

theorem rankFourConstant_expand (g : ℕ) :
    rankFourConstant g = 32 * g.choose 3 + 20 * g.choose 2 + g := by sorry

theorem rankFourConstant_mono {g h : ℕ} (hh : g ≤ h) :
    rankFourConstant g ≤ rankFourConstant h := by sorry

example : rankFourConstant 1 = 1 := by sorry
example : rankFourConstant 2 = 22 := by sorry
example : rankFourConstant 3 = 95 := by sorry

/-- Existing arms and legs are imported, with no replacement partition type. -/
example (Y : YoungDiagram) (s : ℕ × ℕ) :
    Y.armLength s = Y.rowLen s.1 - s.2 - 1 := by sorry

example (Y : YoungDiagram) (s : ℕ × ℕ) :
    Y.legLength s = Y.colLen s.2 - s.1 - 1 := by sorry

example (Y : YoungDiagram) (s : ℕ × ℕ) :
    Y.transpose.armLength (s.2, s.1) = Y.legLength s := by sorry

end TauCeti.CurveCounting
