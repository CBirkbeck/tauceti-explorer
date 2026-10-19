import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.List.Basic
import Mathlib.Tactic

/-!
# Global shtukas and Langlands over function fields, Part II: Ramanujan and Arthur weight constraints

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GlobalShtukasAndFunctionFieldLanglandsPartII.md` is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry` or by a short computation, and nothing here is an
implementation claim.

The carriers of almost every target (automorphic representations over function fields, Lafforgue's
parameters, ℓ-adic local systems and their weights, Weil–Deligne parameters, smooth representations
of p-adic groups) are not in Mathlib or Tau Ceti at the pinned commits, so those targets are README
targets. Weil numbers belong to DeligneWeightsAndPurity and the local spherical theory to
SmoothRepresentationsOfLocalGroupsPartII; neither is restated here. What is stated is the
elementary combinatorics this roadmap owns:

* the weight array of a global parameter at a ramified place and Property A
  (RA.8/weight-array, RA.8/property-a), with the example of Ciubotaru–Harris Remark 10.8;
* weight counts of explicit weight lists, and the certificates that exclude extraneous points in
  the proof of Theorem 10.3 for `Sp(6)` (Remark 8.6) and for the `F₄` orbit `B₃`
  (RA.8/extraneous-weight-certificates, with the corrections E3 and E5 of the extraction);
* the test representations of the dual group by Cartan type (RA.5/test-representations).
-/

namespace TauCeti.FunctionFieldRamanujan

open Finset

/-! ## RA.8: weight arrays and Property A -/

/-- A weight array: `a i k` is the multiplicity of Frobenius weight `k` at the ramified place on the
`i`-th graded piece of the global weight filtration. It vanishes outside a finite window and is
symmetric about the diagonal in the second index, `a i (i + j) = a i (i - j)` (Ciubotaru–Harris
(10.4), from purity of the monodromy filtration). -/
structure WeightArray where
  /-- The multiplicities. -/
  a : ℤ → ℤ → ℕ
  /-- A finite window containing the support. -/
  window : Finset ℤ
  zero_outside : ∀ i k, i ∉ window ∨ k ∉ window → a i k = 0
  symm : ∀ i j, a i (i + j) = a i (i - j)

namespace WeightArray

/-- Row sums: the global weight pattern `n_v(i)` (Ciubotaru–Harris (10.5)). -/
def rowSum (A : WeightArray) (i : ℤ) : ℕ := ∑ k ∈ A.window, A.a i k

/-- Column sums: the weight multiplicities `n_u(k)` at the ramified place (Ciubotaru–Harris (10.6)). -/
def colSum (A : WeightArray) (k : ℤ) : ℕ := ∑ i ∈ A.window, A.a i k

/-- The array is diagonal: no monodromy on any graded piece (Ciubotaru–Harris Remark 10.7). -/
def IsDiagonal (A : WeightArray) : Prop := ∀ i k, i ≠ k → A.a i k = 0

/-- Property A (Ciubotaru–Harris §10.2): either the array is diagonal with equal row and column sums,
or at the largest index where they differ the column sum is larger. -/
theorem property_a (A : WeightArray) :
    (A.IsDiagonal ∧ ∀ i, A.rowSum i = A.colSum i) ∨
      ∃ i₀, (∀ i, i₀ < i → A.rowSum i = A.colSum i) ∧ A.rowSum i₀ < A.colSum i₀ := by
  sorry

/-- A diagonal array has equal row and column sums (the first alternative of Property A). -/
theorem rowSum_eq_colSum_of_isDiagonal (A : WeightArray) (h : A.IsDiagonal) (i : ℤ) :
    A.rowSum i = A.colSum i := by
  unfold rowSum colSum
  rw [Finset.sum_eq_single i (fun k _ hk => h i k (Ne.symm hk))
        (fun hi => A.zero_outside i i (Or.inl hi)),
      Finset.sum_eq_single i (fun k _ hk => h k i hk) (fun hi => A.zero_outside i i (Or.inl hi))]

/-- Total multiplicity: row and column sums have the same total, the rank of the local system. -/
theorem sum_rowSum_eq_sum_colSum (A : WeightArray) :
    ∑ i ∈ A.window, A.rowSum i = ∑ k ∈ A.window, A.colSum k := by
  unfold rowSum colSum
  exact Finset.sum_comm

/-- The array of Ciubotaru–Harris Remark 10.8: `a 0 1 = a 0 (-1) = 1`, zero elsewhere. -/
def remark108 : WeightArray where
  a i k := if i = 0 ∧ (k = 1 ∨ k = -1) then 1 else 0
  window := {-1, 0, 1}
  zero_outside := by
    intro i k h
    rcases h with h | h <;> simp only [Finset.mem_insert, Finset.mem_singleton] at h <;>
      split_ifs with h' <;> omega
  symm := by
    intro i j
    split_ifs <;> omega

/-- In Remark 10.8 the row weights are concentrated at `0`... -/
example : remark108.rowSum 0 = 2 := by decide

/-- ...while the column weights sit at `1` and `-1`: symmetry alone does not force equal sums. -/
example : remark108.colSum 1 = 1 ∧ remark108.colSum 0 = 0 ∧ remark108.colSum (-1) = 1 := by decide

/-- The second alternative of Property A holds for Remark 10.8, at `i₀ = 1`. -/
example : remark108.rowSum 1 < remark108.colSum 1 := by decide

/-- Remark 10.8 is not diagonal. -/
example : ¬ remark108.IsDiagonal := by
  intro h
  have := h 0 1 (by decide)
  simp [remark108] at this

end WeightArray

/-! ## RA.8: weight counts of explicit weight lists -/

/-- The Frobenius weight `2⟨μ, x⟩` of the eigenvalue on the weight `μ` at a real Satake part `x`,
computed from the integral coordinates of `μ` and the doubled coordinates `x₂ = 2x`. -/
def frobWeight (μ x₂ : List ℤ) : ℤ := (List.zipWith (· * ·) μ x₂).sum

/-- The weight count `n_x(i)`: the number of weights `μ` (with multiplicity) in the list with
Frobenius weight `i` at the real part `x = x₂/2` (the weight pattern of Ciubotaru–Harris §10.1). -/
def weightCount (ws : List (List ℤ)) (x₂ : List ℤ) (i : ℤ) : ℕ :=
  ws.countP fun μ => frobWeight μ x₂ = i

/-- The weights of the standard representation of `Sp(6)`: `±e₁, ±e₂, ±e₃`. -/
def sp6Standard : List (List ℤ) :=
  [[1, 0, 0], [-1, 0, 0], [0, 1, 0], [0, -1, 0], [0, 0, 1], [0, 0, -1]]

/-- Remark 8.6: for `O^∨ = (2,2,2)` in `Sp(6)` the central point is `½h^∨ = (½, ½, ½)`
(doubled: `(1,1,1)`) and the extraneous point is `(0, ½, 1)` (doubled: `(0,1,2)`). At the top
index `2` the extraneous count is `1` and the central count `0`, contradicting Property A. -/
example : weightCount sp6Standard [0, 1, 2] 2 = 1 ∧ weightCount sp6Standard [1, 1, 1] 2 = 0 := by
  decide

/-- Above the top index both counts vanish, so `2` is the largest index of difference. -/
example : weightCount sp6Standard [0, 1, 2] 3 = 0 ∧ weightCount sp6Standard [1, 1, 1] 3 = 0 := by
  decide

/-- The central point has its weights at `±1`, three each (the `sl₂`-grading of `(2,2,2)`). -/
example : weightCount sp6Standard [1, 1, 1] 1 = 3 ∧ weightCount sp6Standard [1, 1, 1] (-1) = 3 := by
  decide

/-- The coroots of `F₄` in the coordinates of Ciubotaru–Harris (6.21): `±2eᵢ`, `(±1, ±1, ±1, ±1)`
and `±eᵢ ± eⱼ`, together with four zero weights: the weights of the adjoint representation of the
dual group. -/
def f4Adjoint : List (List ℤ) :=
  let e : ℕ → ℤ → List ℤ := fun i s => (List.range 4).map fun k => if k = i then s else 0
  ((List.range 4).flatMap fun i => [e i 2, e i (-2)]) ++
  ([1, -1].flatMap fun a => [1, -1].flatMap fun b => [1, -1].flatMap fun c =>
    [1, -1].map fun d => [a, b, c, d]) ++
  ((List.range 4).flatMap fun i => (List.range 4).flatMap fun j =>
    if i < j then [1, -1].flatMap fun s => [1, -1].map fun t =>
      (List.range 4).map fun k => if k = i then s else if k = j then t else 0
    else []) ++
  List.replicate 4 [0, 0, 0, 0]

example : f4Adjoint.length = 52 := by decide

/-- The `F₄` orbit `B₃`: the central point `½h^∨ = ω₁ + ω₂ = (5/2, ½, ½, ½)` reproduces the row of
Ciubotaru–Harris Table 3 at the top: weights `10, 9, 8` occur `1, 0, 1` times. -/
example : weightCount f4Adjoint [5, 1, 1, 1] 10 = 1 ∧ weightCount f4Adjoint [5, 1, 1, 1] 9 = 0 ∧
    weightCount f4Adjoint [5, 1, 1, 1] 8 = 1 := by
  decide

/-- The corrected extraneous point `ω₁ + ½ω₃ + ½ω₄ = (5/2, 1, ½, 0)` (E5) has counts `1, 0, 2` at
`10, 9, 8`: Property A fails at `i₀ = 8` (the comparison of the proof of Theorem 10.3(3)(a), with
the subscripts corrected by E3). -/
example : weightCount f4Adjoint [5, 2, 1, 0] 10 = 1 ∧ weightCount f4Adjoint [5, 2, 1, 0] 9 = 0 ∧
    weightCount f4Adjoint [5, 2, 1, 0] 8 = 2 := by
  decide

/-- The printed point `ω₁ + ω₂ + ½ω₃ + ½ω₄ = (4, 3/2, 1, ½)` has top adjoint weight `16`, so it is
not the point used in the proof of Theorem 10.3 (E5). -/
example : weightCount f4Adjoint [8, 3, 2, 1] 16 = 1 := by
  decide

/-! ## RA.5: test representations of the dual group -/

/-- Cartan types of absolutely simple groups, indexed as in Ciubotaru–Harris §6 (`A r` has rank `r`). -/
inductive CartanType
  | A (r : ℕ) | B (n : ℕ) | C (n : ℕ) | D (n : ℕ) | E6 | E7 | E8 | F4 | G2
  deriving DecidableEq

/-- The fundamental weights `ω̂ᵢ` of the simply connected dual group whose representations are used
beside the adjoint representation (the table after Ciubotaru–Harris Theorem 5.4). -/
def testWeights : CartanType → List ℕ
  | .A r => if (r + 1) % 2 = 0 then [1] else []
  | .B n => [n]
  | .C _ => [1]
  | .D n => [1, n]
  | .E7 => [7]
  | _ => []

/-- `PGL₂` (type `A₁`, `n = 2` even) uses the standard representation of `SL₂`. -/
example : testWeights (.A 1) = [1] := by decide

/-- `PGL₃` (type `A₂`, `n = 3` odd) needs only the adjoint representation. -/
example : testWeights (.A 2) = [] := by decide

/-- Type `D` needs both a half-spin and the vector representation. -/
example : (testWeights (.D 4)).length = 2 := by decide

/-- `E₈`, `F₄`, `G₂` and `E₆` need only the adjoint representation. -/
example : testWeights .E8 = [] ∧ testWeights .F4 = [] ∧ testWeights .G2 = [] ∧ testWeights .E6 = [] := by
  decide

end TauCeti.FunctionFieldRamanujan
