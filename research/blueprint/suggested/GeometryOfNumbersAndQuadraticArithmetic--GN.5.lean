import Mathlib.Analysis.InnerProductSpace.GramSchmidtOrtho
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Analysis.Matrix.LDL
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Algebra.Order.Round
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.Convex.Body
import Mathlib.Analysis.Convex.Gauge
import Mathlib.Analysis.SpecialFunctions.Log.PosLog
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.NumberTheory.NumberField.CanonicalEmbedding.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.House
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.Order.WellFoundedSet
import TauCeti.LinearAlgebra.IntegralLattice.Gram
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.Matrix.Cholesky.Basic
import TauCeti.Algebra.Module.Primitive

/-!
# Geometry of numbers, GN.5: certified reductions and applications (suggested Lean)

This file is not the roadmap and is not exhaustive; the roadmap document
(`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.5.md`) is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is an implementation claim.

The part continues the parent packet's GN.5 nodes (`lllCoefficient`, `IsLLLReduced`,
`UnimodularBasisCertificate`, …). Those parent signatures, and the AdelicAlgebraicGroups
supplier `RealSiegel.IsReduced`, are restated verbatim in the first section only so that this
file elaborates on its own; the assembled roadmap keeps one copy of each.

Conventions: zero-based indices; `δ = 3/4` with a strict Lovász test; nearest integers are
Mathlib's `round` (`⌊t + 1/2⌋`); number fields use Mathlib's Euclidean mixed space, which counts
each complex place once; Siegel domains follow AdelicAlgebraicGroups AA.3 (left `GL_n(ℤ)`
action, coordinates `v · diag(a) · k`).
-/

noncomputable section

open scoped BigOperators Matrix
open InnerProductSpace

namespace TauCeti.GeometryOfNumbersPlan

/-! ## Restated parent and supplier signatures (for elaboration only) -/

section Restated
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- Parent GN.5/lll-coefficient, restated. -/
def lllCoefficient (b : Fin n → E) (i j : Fin n) : ℝ :=
  inner ℝ (b i) (gramSchmidt ℝ b j) / ‖gramSchmidt ℝ b j‖ ^ 2

/-- Parent GN.5/lll-reduced, restated. -/
def IsLLLReduced (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j, j < i → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j : Fin n, j.val + 1 = i.val →
    (3/4 - (lllCoefficient b i j) ^ 2) * ‖gramSchmidt ℝ b j‖ ^ 2 ≤ ‖gramSchmidt ℝ b i‖ ^ 2)

/-- Parent GN.5/unimodular-basis-certificate, restated. -/
structure UnimodularBasisCertificate (b c : Fin n → E) where
  matrix : Matrix (Fin n) (Fin n) ℤ
  inverse : Matrix (Fin n) (Fin n) ℤ
  rightInverse : matrix * inverse = 1
  leftInverse : inverse * matrix = 1
  coordinates : ∀ i, c i = ∑ j, matrix j i • b j

end Restated

/-- AdelicAlgebraicGroups AA.3 (`RealSiegel.IsReduced` of the upstream roadmap), restated:
`b` is `C`-reduced in the standard basis. -/
def RealSiegel.IsReduced {n : ℕ} (C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  (∀ i j, |b i j| < C * b i i) ∧ (∀ i j, i < j → b i i < C * b j j) ∧ (∏ i, b i i < C * b.det)

/-- AdelicAlgebraicGroups AA.3, the standard real Siegel domain `Σ_n(u,t)`, restated from the
upstream README: `v · diag(a) · k` with `v` upper unitriangular, `|v_ij| ≤ u`, `a_i > 0`,
`a_i / a_{i+1} ≥ t` and `k` orthogonal. -/
def standardSiegelDomain (n : ℕ) (u t : ℝ) : Set (Matrix (Fin n) (Fin n) ℝ) :=
  {g | ∃ (v : Matrix (Fin n) (Fin n) ℝ) (a : Fin n → ℝ) (k : Matrix.orthogonalGroup (Fin n) ℝ),
    (∀ i j, j < i → v i j = 0) ∧ (∀ i, v i i = 1) ∧ (∀ i j, i < j → |v i j| ≤ u) ∧
    (∀ i, 0 < a i) ∧ (∀ i j : Fin n, i.val + 1 = j.val → t ≤ a i / a j) ∧
    g = v * Matrix.diagonal a * (k : Matrix (Fin n) (Fin n) ℝ)}

/-! ## The step relation (GN.5/lll-step-relation) -/

section Step
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- A state of LLL reduction: a cursor and a family. -/
structure LLLState (E : Type*) (n : ℕ) where
  cursor : ℕ
  family : Fin n → E

/-- Replace row `k` by `b_k − Σ_{l<k} r_l b_l`. -/
def sizeMove (b : Fin n → E) (k : Fin n) (r : Fin n → ℤ) : Fin n → E :=
  Function.update b k (b k - ∑ l ∈ Finset.univ.filter (· < k), (r l : ℝ) • b l)

/-- The predecessor index `k − 1` of a positive index. -/
def predIdx (k : Fin n) : Fin n := ⟨k.val - 1, lt_of_le_of_lt (Nat.sub_le _ _) k.isLt⟩

/-- The strict Lovász failure at `k` (Case 1, LLL (1.19)). -/
def LovaszFails (b : Fin n → E) (k : Fin n) : Prop :=
  ‖gramSchmidt ℝ b k‖ ^ 2 <
    (3/4 - (lllCoefficient b k (predIdx k)) ^ 2) * ‖gramSchmidt ℝ b (predIdx k)‖ ^ 2

/-- **The LLL step relation** at `δ = 3/4`: a size move making `|μ_{k,k−1}| ≤ 1/2`, then either
the adjacent swap (Case 1) or further shears of row `k` making all `|μ_{k,l}| ≤ 1/2` (Case 2). -/
def LLLStep (s t : LLLState E n) : Prop :=
  ∃ (k : Fin n) (r : Fin n → ℤ), s.cursor = k.val ∧ 1 ≤ k.val ∧
    |lllCoefficient (sizeMove s.family k r) k (predIdx k)| ≤ 1/2 ∧
    ((LovaszFails (sizeMove s.family k r) k ∧
        t.family = sizeMove s.family k r ∘ Equiv.swap (predIdx k) k ∧
        t.cursor = max 1 (k.val - 1)) ∨
     (¬ LovaszFails (sizeMove s.family k r) k ∧
        (∃ r' : Fin n → ℤ, t.family = sizeMove (sizeMove s.family k r) k r') ∧
        (∀ l : Fin n, l < k → |lllCoefficient t.family k l| ≤ 1/2) ∧
        t.cursor = k.val + 1))

/-- Prefix Gram determinant `d_k = det Gram(b_0, …, b_{k−1})`. -/
def prefixGramDet (b : Fin n → E) (k : ℕ) : ℝ :=
  (Matrix.gram ℝ (fun i : {i : Fin n // i.val < k} => b i)).det

/-- The potential `D = ∏_{1 ≤ k < n} d_k` of a family. -/
def lllPotential (b : Fin n → E) : ℝ :=
  ∏ k ∈ Finset.Ico 1 n, prefixGramDet b k

theorem LLLStep.certificate {s t : LLLState E n} (h : LLLStep s t) :
    Nonempty (UnimodularBasisCertificate s.family t.family) := by sorry

theorem LLLStep.span_eq {s t : LLLState E n} (h : LLLStep s t) :
    Submodule.span ℤ (Set.range s.family) = Submodule.span ℤ (Set.range t.family) := by sorry

theorem LLLStep.cursor_eq {s t : LLLState E n} (h : LLLStep s t) :
    t.cursor = s.cursor + 1 ∨ t.cursor = max 1 (s.cursor - 1) := by sorry

theorem LLLStep.gramSchmidt_eq_of_case2 {s t : LLLState E n} (h : LLLStep s t)
    (h2 : t.cursor = s.cursor + 1) : gramSchmidt ℝ t.family = gramSchmidt ℝ s.family := by sorry

theorem LLLStep.potential_of_case1 {s t : LLLState E n} (h : LLLStep s t)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (s.family i) (s.family j) = (z : ℝ))
    (h1 : t.cursor ≠ s.cursor + 1) :
    0 < lllPotential t.family ∧ 4 * lllPotential t.family < 3 * lllPotential s.family := by sorry

/-- The invariant (1.16)–(1.17) at cursor `k`. -/
def LLLInvariant (k : ℕ) (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j : Fin n, j < i → i.val < k → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j : Fin n, j.val + 1 = i.val → i.val < k →
    (3/4 - (lllCoefficient b i j) ^ 2) * ‖gramSchmidt ℝ b j‖ ^ 2 ≤ ‖gramSchmidt ℝ b i‖ ^ 2)

/-- GN.5/lll-step-invariant. -/
theorem lllStep_invariant {s t : LLLState E n} (h : LLLStep s t)
    (hs : LLLInvariant s.cursor s.family) : LLLInvariant t.cursor t.family := by sorry

theorem lllInvariant_one (b : Fin n → E) (hb : LinearIndependent ℝ b) : LLLInvariant 1 b := by
  sorry

theorem isLLLReduced_of_invariant (b : Fin n → E) (h : LLLInvariant n b) : IsLLLReduced b := by
  sorry

/-- Remark (1.37): the first time the cursor reaches `m`, the first `m` vectors form an
LLL-reduced basis of the lattice spanned by the first `m` input vectors. -/
theorem lllStep_prefix_reduced (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (f : ℕ → LLLState E n) (M : ℕ) (hf0 : f 0 = ⟨1, b⟩) (hstep : ∀ i < M, LLLStep (f i) (f (i + 1)))
    (m : ℕ) (hm : 1 ≤ m) (hmn : m ≤ n) (hfirst : (f M).cursor = m ∧ ∀ i < M, (f i).cursor < m) :
    IsLLLReduced (fun i : Fin m => (f M).family ⟨i.val, lt_of_lt_of_le i.isLt hmn⟩) ∧
      Submodule.span ℤ ((f M).family '' {i | i.val < m}) =
        Submodule.span ℤ (b '' {i | i.val < m}) := by
  sorry

/-- GN.5/lll-step-termination (a): swap count and finiteness for integral Gram data. -/
theorem lllStep_swap_count (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ))
    (f : ℕ → LLLState E n) (M : ℕ) (hf0 : f 0 = ⟨1, b⟩)
    (hstep : ∀ i < M, LLLStep (f i) (f (i + 1))) :
    (((Finset.range M).filter (fun i => (f (i + 1)).cursor ≠ (f i).cursor + 1)).card : ℝ) ≤
        Real.logb (4/3) (lllPotential b) ∧
      (M : ℝ) ≤ (n - 1 : ℝ) + 2 * Real.logb (4/3) (lllPotential b) := by sorry

theorem lllPotential_le_pow (b : Fin n → E) (B : ℝ) (hB : 1 ≤ B) (hb : ∀ i, ‖b i‖ ^ 2 ≤ B) :
    lllPotential b ≤ B ^ (n * (n - 1) / 2) := by sorry

/-- GN.5/lll-step-termination (b): every chain is finite for an arbitrary real lattice. -/
theorem lllStep_wellFounded_real (b : Fin n → E) (hb : LinearIndependent ℝ b) :
    ¬ ∃ f : ℕ → LLLState E n, f 0 = ⟨1, b⟩ ∧ ∀ m, LLLStep (f m) (f (m + 1)) := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll_step_swap_example: from cursor 1 on ((2,0),(0,1)) the
-- unique successor is the swap ((0,1),(2,0)) with cursor 1.
example (t : LLLState (EuclideanSpace ℝ (Fin 2)) 2)
    (h : LLLStep ⟨1, ![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![0, 1]]⟩ t) :
    t = ⟨1, ![WithLp.toLp 2 ![0, 1], WithLp.toLp 2 ![2, 0]]⟩ := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll_step_orthonormal: on the standard basis the only step
-- reaches the terminal cursor with the family unchanged.
example (t : LLLState (EuclideanSpace ℝ (Fin 2)) 2)
    (h : LLLStep ⟨1, ![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![0, 1]]⟩ t) :
    t = ⟨2, ![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![0, 1]]⟩ := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll_step_equality_no_swap: Lovász with equality is not a
-- strict failure, so no swap step exists (Gram matrix [[1,1/2],[1/2,3/4]]).
example : ¬ LovaszFails
    (![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![1/2, Real.sqrt 2 / 2]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) 1 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll_step_exactLLL: the native full-row move (descending
-- nearest-integer reduction of row k, then the test) is a step of the relation.
example (b : Fin n → E) (hb : LinearIndependent ℝ b) (k : Fin n) (hk : 1 ≤ k.val)
    (r : Fin n → ℤ) (hr : ∀ l : Fin n, l < k → |lllCoefficient (sizeMove b k r) k l| ≤ 1/2) :
    ∃ t, LLLStep ⟨k.val, b⟩ t := by sorry

end Step

/-! ## Algorithm (1.15) and its reconciliation with the native variant -/

section Source
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- The exact state of Fig. 1: cursor, family, coefficients `μ_ij` and `B_i = ‖b*_i‖²`. -/
structure LLL115.State (E : Type*) (n : ℕ) where
  cursor : ℕ
  family : Fin n → E
  mu : Fin n → Fin n → ℝ
  normSq : Fin n → ℝ

/-- The initial state: cursor 1 and the Gram–Schmidt data of the input. -/
def LLL115.init (b : Fin n → E) : LLL115.State E n :=
  ⟨1, b, lllCoefficient b, fun i => ‖gramSchmidt ℝ b i‖ ^ 2⟩

/-- One step of Fig. 1 (LLL 1982, Algorithm (1.15)). -/
def LLL115.step (s : LLL115.State E n) : LLL115.State E n := by sorry

theorem LLL115.step_isStep (s : LLL115.State E n) (hs : 1 ≤ s.cursor) (hn : s.cursor < n) :
    LLLStep ⟨s.cursor, s.family⟩ ⟨(LLL115.step s).cursor, (LLL115.step s).family⟩ := by sorry

theorem LLL115.data_spec (s : LLL115.State E n)
    (hs : ∀ i j, s.mu i j = lllCoefficient s.family i j)
    (hB : ∀ i, s.normSq i = ‖gramSchmidt ℝ s.family i‖ ^ 2) :
    (∀ i j, (LLL115.step s).mu i j = lllCoefficient (LLL115.step s).family i j) ∧
    (∀ i, (LLL115.step s).normSq i = ‖gramSchmidt ℝ (LLL115.step s).family i‖ ^ 2) := by
  sorry

/-- The output of a run: final family, certificate and number of swaps. -/
structure LLL115.Output (b : Fin n → E) where
  family : Fin n → E
  certificate : UnimodularBasisCertificate b family
  swaps : ℕ

/-- The run from cursor 1 to cursor `n`, for integral Gram data. -/
def LLL115.run (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) : LLL115.Output b := by sorry

theorem LLL115.run_reduced (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    IsLLLReduced (LLL115.run b hb hgram).family := by sorry

theorem LLL115.run_certificate (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    Submodule.span ℤ (Set.range b) = Submodule.span ℤ (Set.range (LLL115.run b hb hgram).family) :=
  by sorry

theorem LLL115.run_swaps_le (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    ((LLL115.run b hb hgram).swaps : ℝ) ≤ Real.logb (4/3) (lllPotential b) := by sorry

/-- GN.5/lll-variant-reconciliation (b): two families related by an integer upper
unitriangular matrix have the same Gram–Schmidt vectors. -/
theorem gramSchmidt_eq_of_upperUnitriangular (b b' : Fin n → E)
    (h : ∀ i, b' i - b i ∈ Submodule.span ℤ (b '' {j | j < i})) :
    gramSchmidt ℝ b' = gramSchmidt ℝ b := by sorry

/-- GN.5/lll-variant-reconciliation (b): away from ties the two runs are in lockstep. -/
theorem lll_variant_lockstep (s s' t : LLLState E n)
    (hrel : s'.cursor = s.cursor ∧
      ∀ i, s'.family i - s.family i ∈ Submodule.span ℤ (s.family '' {j | j < i}))
    (ht : LLLStep s t)
    (hnotie : ∀ (k : Fin n) (m : ℤ), s.cursor = k.val →
      lllCoefficient s.family k (predIdx k) ≠ (m : ℝ) + 1/2) :
    ∃ t', LLLStep s' t' ∧ t'.cursor = t.cursor ∧ gramSchmidt ℝ t'.family = gramSchmidt ℝ t.family :=
  by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll115_swap_example: one swap on ((2,0),(0,1)), with
-- certificate [[0,1],[1,0]] of determinant −1.
example (hb : LinearIndependent ℝ
      (![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![0, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)))
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ
      ((![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![0, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) i)
      ((![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![0, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) j) =
        (z : ℝ)) :
    (LLL115.run _ hb hgram).family = ![WithLp.toLp 2 ![0, 1], WithLp.toLp 2 ![2, 0]] ∧
      (LLL115.run _ hb hgram).swaps = 1 ∧
      (LLL115.run _ hb hgram).certificate.matrix.det = -1 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll115_shear_example: on ((1,0),(1,1)) the run returns
-- ((1,0),(0,1)) with certificate [[1,−1],[0,1]] and no swap.
example (hb : LinearIndependent ℝ
      (![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![1, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)))
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ
      ((![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![1, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) i)
      ((![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![1, 1]] : Fin 2 → EuclideanSpace ℝ (Fin 2)) j) =
        (z : ℝ)) :
    (LLL115.run _ hb hgram).family = ![WithLp.toLp 2 ![1, 0], WithLp.toLp 2 ![0, 1]] ∧
      (LLL115.run _ hb hgram).swaps = 0 ∧
      (LLL115.run _ hb hgram).certificate.matrix = !![1, -1; 0, 1] := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll115_rank_one: in rank one the run returns its input.
example (b : Fin 1 → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    (LLL115.run b hb hgram).family = b ∧ (LLL115.run b hb hgram).swaps = 0 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.lll115_tie_untouched: on ((2,0),(1,5)), μ₁₀ = 1/2 is left
-- alone; the native variant's (−1,5) differs, and both families are LLL-reduced.
example : IsLLLReduced (![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![1, 5]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) ∧
    IsLLLReduced (![WithLp.toLp 2 ![2, 0], WithLp.toLp 2 ![-1, 5]] :
      Fin 2 → EuclideanSpace ℝ (Fin 2)) := by sorry

end Source

/-! ## Complexity: Proposition (1.26) -/

section Complexity
variable {n : ℕ}

/-- GN.5/lll-denominator-integrality, (1.27)–(1.29) in zero-based form. -/
theorem lll_denominator_integrality {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (hgram : ∀ i j, ∃ z : ℤ, inner ℝ (b i) (b j) = (z : ℝ)) :
    (∀ i : Fin n, ‖gramSchmidt ℝ b i‖ ^ 2 = prefixGramDet b (i.val + 1) / prefixGramDet b i.val) ∧
    (∀ i : Fin n, prefixGramDet b i.val • gramSchmidt ℝ b i ∈
      (Submodule.span ℤ (b '' {j | j ≤ i}) : Set E)) ∧
    (∀ i j : Fin n, j < i → ∃ z : ℤ, prefixGramDet b (j.val + 1) * lllCoefficient b i j = z) := by
  sorry

/-- GN.5/lll-intermediate-size-bounds: the global bounds along a run of Algorithm (1.15) on
integer vectors with `‖b_i‖² ≤ B`, `B ≥ 2`. -/
theorem lll_intermediate_size_bounds (b : Fin n → EuclideanSpace ℝ (Fin n))
    (hint : ∀ i j, ∃ z : ℤ, b i j = z) (hb : LinearIndependent ℝ b) (B : ℝ) (hB : 2 ≤ B)
    (hbB : ∀ i, ‖b i‖ ^ 2 ≤ B) (s : LLL115.State (EuclideanSpace ℝ (Fin n)) n)
    (hs : Relation.ReflTransGen (fun s t => t = LLL115.step s) (LLL115.init b) s) :
    (∀ i : ℕ, i ≤ n → prefixGramDet s.family i ≤ B ^ i) ∧
    (∀ i, ‖gramSchmidt ℝ s.family i‖ ^ 2 ≤ B) ∧
    (∀ i j, j < i → |lllCoefficient s.family i j| ≤ 2 ^ (n - 1) * Real.sqrt (n * B ^ (n - 1))) ∧
    (∀ i, ‖s.family i‖ ^ 2 ≤ (n : ℝ) ^ 2 * (4 * B) ^ n) := by sorry

/-- A cost-instrumented integral run: final state and number of integer operations charged. -/
def lllCostedRun (b : Fin n → Fin n → ℤ) (hb : (Matrix.of b).det ≠ 0) : ℕ × ℕ := by sorry

/-- GN.5/lll-arithmetic-complexity (Proposition (1.26)). -/
theorem lll_arithmetic_complexity :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (b : Fin n → Fin n → ℤ) (hb : (Matrix.of b).det ≠ 0) (B : ℝ),
      2 ≤ B → (∀ i, ((∑ j, (b i j) ^ 2 : ℤ) : ℝ) ≤ B) →
      ((lllCostedRun b hb).2 : ℝ) ≤ C * n ^ 4 * Real.log B := by sorry

end Complexity

/-! ## Bounds for reduced bases: (1.7)–(1.14) -/

section Bounds
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- GN.5/lll-basis-length-growth, (1.7). -/
theorem lll_basis_length_growth (b : Fin n → E) (h : IsLLLReduced b) (j i : Fin n) (hji : j ≤ i) :
    ‖b j‖ ^ 2 ≤ (2 : ℝ) ^ i.val * ‖gramSchmidt ℝ b i‖ ^ 2 := by sorry

/-- GN.5/lll-orthogonality-defect, (1.8) and (1.10). -/
theorem lll_orthogonality_defect (b : Fin n → E) (h : IsLLLReduced b) :
    Real.sqrt (prefixGramDet b n) ≤ ∏ i, ‖b i‖ ∧
      ∏ i, ‖b i‖ ≤ (2 : ℝ) ^ (((n : ℝ) * ((n : ℝ) - 1)) / 4) * Real.sqrt (prefixGramDet b n) := by sorry

/-- GN.5/lll-first-vector-covolume, (1.9). -/
theorem lll_first_vector_covolume (b : Fin n → E) (h : IsLLLReduced b) (hn : 0 < n) :
    ‖b ⟨0, hn⟩‖ ≤ (2 : ℝ) ^ (((n : ℝ) - 1) / 4) * (Real.sqrt (prefixGramDet b n)) ^ ((1 : ℝ) / n) :=
  by sorry

/-- GN.5/lll-independent-family-bound, (1.12). -/
theorem lll_independent_family_bound (b : Fin n → E) (h : IsLLLReduced b) {t : ℕ}
    (x : Fin t → E) (hx : ∀ l, x l ∈ Submodule.span ℤ (Set.range b)) (hli : LinearIndependent ℝ x)
    (j : Fin n) (hj : j.val < t) (M : ℝ) (hM : ∀ l, ‖x l‖ ^ 2 ≤ M) :
    ‖b j‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * M := by sorry

/-- The successive minimum of a lattice for the closed unit ball (GN.1/successive-minimum,
zero-based), with the parent's defining formula. -/
def ballMinimum (L : Submodule ℤ E) (i : ℕ) : ℝ :=
  sInf {r : ℝ | 0 ≤ r ∧ i + 1 ≤ Module.finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ ‖x‖ ≤ r})}

/-- GN.5/lll-successive-minima-bounds. -/
theorem lll_successive_minima_bounds [FiniteDimensional ℝ E] (b : Fin n → E) (h : IsLLLReduced b)
    (hn : Module.finrank ℝ E = n) (i : Fin n) :
    (2 : ℝ) ^ (-(i.val : ℤ)) * ballMinimum (Submodule.span ℤ (Set.range b)) i ^ 2 ≤ ‖b i‖ ^ 2 ∧
      ‖b i‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * ballMinimum (Submodule.span ℤ (Set.range b)) i ^ 2 := by
  sorry

end Bounds

/-! ## The routed primitive-prefix basis (BSTTTZ §3) -/

section PrimitivePrefix
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The constants `c_0 = A`, `c_i = 1 + (1/2) Σ_{j<i} c_j`. -/
def primitivePrefixConst (A : ℝ) (i : ℕ) : ℝ :=
  if i = 0 then A else (3/2 : ℝ) ^ (i - 1) * (1 + A / 2)

theorem primitivePrefixConst_succ (A : ℝ) (i : ℕ) :
    primitivePrefixConst A (i + 1) = 1 + (1/2) * ∑ j ∈ Finset.range (i + 1), primitivePrefixConst A j :=
  by sorry

/-- GN.5/primitive-prefix-reduced-basis. -/
theorem primitive_prefix_reduced_basis (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (A : ℝ) (hA : 1 ≤ A) (u : L) (hu : TauCeti.IsPrimitive u)
    (hshort : ∀ w : L, w ≠ 0 → ‖(u : E)‖ ≤ A * ‖(w : E)‖) :
    ∃ b : Module.Basis (Fin (Module.finrank ℝ E)) ℤ L,
      (∀ h : 0 < Module.finrank ℝ E, b ⟨0, h⟩ = u) ∧
      ∀ (i : Fin (Module.finrank ℝ E)) (w : L),
        (w : E) ∉ Submodule.span ℝ ((fun j => (b j : E)) '' {j | j < i}) →
        ‖(b i : E)‖ ≤ primitivePrefixConst A i * ‖(w : E)‖ := by sorry

theorem primitivePrefixConst_one (i : ℕ) : primitivePrefixConst 1 i = (3/2 : ℝ) ^ i := by sorry

/-- GN.5/primitive-prefix-basis-product. -/
theorem primitive_prefix_basis_product (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    [MeasurableSpace E] [BorelSpace E] (A : ℝ) (hA : 1 ≤ A)
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℤ L)
    (hb : ∀ (i : Fin (Module.finrank ℝ E)) (w : L),
        (w : E) ∉ Submodule.span ℝ ((fun j => (b j : E)) '' {j | j < i}) →
        ‖(b i : E)‖ ≤ primitivePrefixConst A i * ‖(w : E)‖) :
    ZLattice.covolume L ≤ ∏ i, ‖(b i : E)‖ ∧
      ∏ i, ‖(b i : E)‖ ≤ (∏ i : Fin (Module.finrank ℝ E), primitivePrefixConst A i) *
        (2 ^ Module.finrank ℝ E / (MeasureTheory.volume (Metric.closedBall (0 : E) 1)).toReal) *
        ZLattice.covolume L := by sorry

end PrimitivePrefix

/-! ## Quadratic completion and Fincke–Pohst enumeration -/

section Enumeration
variable {n : ℕ}

/-- Pivots and multipliers of a symmetric rational matrix (`none` when a pivot vanishes). -/
def quadraticCompletion (G : Matrix (Fin n) (Fin n) ℚ) :
    Option ((Fin n → ℚ) × Matrix (Fin n) (Fin n) ℚ) := by sorry

theorem quadraticCompletion_spec (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.IsSymm)
    (q : Fin n → ℚ) (U : Matrix (Fin n) (Fin n) ℚ) (h : quadraticCompletion G = some (q, U))
    (x : Fin n → ℚ) :
    x ⬝ᵥ G *ᵥ x = ∑ i, q i * (x i + ∑ j ∈ Finset.univ.filter (i < ·), U i j * x j) ^ 2 := by sorry

theorem quadraticCompletion_pivots_pos_iff (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.IsSymm) :
    (∃ q U, quadraticCompletion G = some (q, U) ∧ ∀ i, 0 < q i) ↔ G.PosDef := by sorry

theorem quadraticCompletion_det (G : Matrix (Fin n) (Fin n) ℚ) (q : Fin n → ℚ)
    (U : Matrix (Fin n) (Fin n) ℚ) (h : quadraticCompletion G = some (q, U)) :
    G.det = ∏ i, q i := by sorry

theorem quadraticCompletion_cast_eq_LDL (G : Matrix (Fin n) (Fin n) ℚ)
    (hG : (G.map (fun x : ℚ => (x : ℝ))).PosDef) (q : Fin n → ℚ) (U : Matrix (Fin n) (Fin n) ℚ)
    (h : quadraticCompletion G = some (q, U)) :
    (∀ i, (q i : ℝ) = LDL.diagEntries hG i) ∧
      ∀ i j, j < i → (U j i : ℝ) = LDL.lower hG i j := by sorry

/-- A positive definite real form is LLL-reduced (δ = 3/4) in its coordinate basis. -/
def IsLLLReducedGram (A : Matrix (Fin n) (Fin n) ℝ) (hA : A.PosDef) : Prop :=
  (∀ i j : Fin n, j < i → |LDL.lower hA i j| ≤ 1/2) ∧
  (∀ i j : Fin n, j.val + 1 = i.val →
    (3/4 - (LDL.lower hA i j) ^ 2) * LDL.diagEntries hA j ≤ LDL.diagEntries hA i)

-- Test TauCeti.GeometryOfNumbersPlan.quadraticCompletion_hexagonal.
example : quadraticCompletion (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℚ) =
    some (![2, 3/2], !![1, 1/2; 0, 1]) := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.quadraticCompletion_identity.
example : quadraticCompletion (1 : Matrix (Fin 3) (Fin 3) ℚ) = some (fun _ => 1, 1) := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.quadraticCompletion_indefinite.
example : ¬ (!![1, 2; 2, 1] : Matrix (Fin 2) (Fin 2) ℚ).PosDef := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.quadraticCompletion_LDL_compat.
example (h : (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℝ).PosDef) :
    LDL.diagEntries h = ![2, 3/2] ∧ LDL.lower h 1 0 = 1/2 := by sorry

/-- GN.5/quadratic-completion-gram-schmidt. -/
theorem quadraticCompletion_gram {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (b : Fin n → E) (hb : LinearIndependent ℝ b) (hG : (Matrix.gram ℝ b).PosDef) :
    (∀ i, LDL.diagEntries hG i = ‖gramSchmidt ℝ b i‖ ^ 2) ∧
      ∀ i j, j < i → LDL.lower hG i j = lllCoefficient b i j := by sorry

theorem isLLLReducedGram_iff {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (b : Fin n → E) (hb : LinearIndependent ℝ b) (hG : (Matrix.gram ℝ b).PosDef) :
    IsLLLReducedGram (Matrix.gram ℝ b) hG ↔ IsLLLReduced b := by sorry

/-- The Fincke–Pohst enumeration `fpEnumeration G t R` (de Weger §3.6, Figure 2). -/
def fpEnumeration (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) (R : ℚ) :
    Finset (Fin n → ℤ) := by sorry

theorem fpEnumeration_of_neg (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) {R : ℚ} (hR : R < 0) :
    fpEnumeration G t R = ∅ := by sorry

theorem fpEnumeration_neg (G : Matrix (Fin n) (Fin n) ℚ) (R : ℚ) (x : Fin n → ℤ)
    (hx : x ∈ fpEnumeration G 0 R) : -x ∈ fpEnumeration G 0 R := by sorry

theorem fpEnumeration_mono (G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) {R R' : ℚ}
    (h : R ≤ R') : fpEnumeration G t R ⊆ fpEnumeration G t R' := by sorry

theorem fpEnumeration_unimodular (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef)
    (U : Matrix.GeneralLinearGroup (Fin n) ℤ) (t : Fin n → ℚ) (R : ℚ) (x : Fin n → ℤ) :
    x ∈ fpEnumeration ((U.1.map (Int.cast : ℤ → ℚ))ᵀ * G * U.1.map (Int.cast : ℤ → ℚ))
        ((U⁻¹ : Matrix.GeneralLinearGroup (Fin n) ℤ).1.map (Int.cast : ℤ → ℚ) *ᵥ t) R ↔
      U.1 *ᵥ x ∈ fpEnumeration G t R := by sorry

theorem fpEnumeration_zero_mem (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef) {R : ℚ}
    (hR : 0 ≤ R) : 0 ∈ fpEnumeration G 0 R := by sorry

/-- GN.5/fincke-pohst-complete. -/
theorem fpEnumeration_mem_iff (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef) (t : Fin n → ℚ)
    (R : ℚ) (x : Fin n → ℤ) :
    x ∈ fpEnumeration G t R ↔
      (fun i => (x i : ℚ) - t i) ⬝ᵥ G *ᵥ (fun i => (x i : ℚ) - t i) ≤ R := by sorry

theorem fpEnumeration_lattice {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (b : Fin n → E) (G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef)
    (hGram : ∀ i j, (G i j : ℝ) = inner ℝ (b i) (b j)) (t : Fin n → ℚ) (R : ℚ) (v : E) :
    (v ∈ Submodule.span ℤ (Set.range b) ∧ ‖v - ∑ i, (t i : ℝ) • b i‖ ^ 2 ≤ R) ↔
      ∃ x ∈ fpEnumeration G t R, v = ∑ i, (x i : ℝ) • b i := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.fpEnumeration_identity.
example : (fpEnumeration (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1).card = 5 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.fpEnumeration_hexagonal.
example : fpEnumeration (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℚ) 0 2 =
    {![0, 0], ![1, 0], ![-1, 0], ![0, 1], ![0, -1], ![1, -1], ![-1, 1]} := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.fpEnumeration_centre_half.
example : fpEnumeration (1 : Matrix (Fin 1) (Fin 1) ℚ) (fun _ => 1/2) (1/4) = {![0], ![1]} := by
  sorry

-- Test TauCeti.GeometryOfNumbersPlan.fpEnumeration_negative_bound.
example (G : Matrix (Fin 2) (Fin 2) ℚ) (t : Fin 2 → ℚ) : fpEnumeration G t (-1) = ∅ := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.fpEnumeration_box_non_example.
example : ![1, 1] ∉ fpEnumeration (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℚ) 0 2 := by sorry

/-- GN.5/ellipsoid-point-count. -/
theorem ellipsoid_point_count (G : Matrix (Fin n) (Fin n) ℚ) (q : Fin n → ℚ)
    (U : Matrix (Fin n) (Fin n) ℚ) (h : quadraticCompletion G = some (q, U)) (hq : ∀ i, 0 < q i)
    (t : Fin n → ℚ) (R : ℚ) (hR : 0 ≤ R) :
    ((fpEnumeration G t R).card : ℝ) ≤ ∏ i, (1 + 2 * Real.sqrt ((R : ℝ) / q i)) := by sorry

theorem lll_ball_count {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (b : Fin n → E) (h : IsLLLReduced b) (hn : 0 < n) (y : E) (R : ℝ) (hR : 0 ≤ R)
    (S : Finset E) (hS : ∀ v ∈ S, v ∈ Submodule.span ℤ (Set.range b) ∧ ‖v - y‖ ^ 2 ≤ R) :
    (S.card : ℝ) ≤ ∏ i : Fin n, (1 + (2 : ℝ) ^ (1 + (i.val : ℝ) / 2) * Real.sqrt R / ‖b ⟨0, hn⟩‖) :=
  by sorry

/-- GN.5/certified-representation-number. -/
theorem certified_representation_number {V : Type*} [AddCommGroup V] [Module ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (e : Module.Basis (Fin n) ℤ L)
    (m : ℤ) :
    {v : L | L.norm (v : V) = (m : ℚ)}.ncard =
      ((fpEnumeration ((L.gramMatrix e).map (Int.cast : ℤ → ℚ)) 0 m).filter
        (fun x => ∑ i, ∑ j, (x i : ℚ) * (L.gramMatrix e i j : ℚ) * x j = m)).card := by
  sorry

end Enumeration

/-! ## Certified comparison with a rational model -/

section Comparison
variable {n : ℕ}

/-- **Two-sided Loewner comparison** `(1 − ε) G̃ ≤ G ≤ (1 + ε) G̃` of a real Gram matrix with
a rational model. -/
def GramComparison (G : Matrix (Fin n) (Fin n) ℝ) (Gt : Matrix (Fin n) (Fin n) ℚ) (ε : ℚ) : Prop :=
  0 ≤ ε ∧ ε < 1 ∧ ∀ x : Fin n → ℝ,
    (1 - (ε : ℝ)) * (x ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ x) ≤ x ⬝ᵥ G *ᵥ x ∧
      x ⬝ᵥ G *ᵥ x ≤ (1 + (ε : ℝ)) * (x ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ x)

theorem GramComparison.lower {G : Matrix (Fin n) (Fin n) ℝ} {Gt : Matrix (Fin n) (Fin n) ℚ}
    {ε : ℚ} (h : GramComparison G Gt ε) (x : Fin n → ℝ) :
    (1 - (ε : ℝ)) * (x ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ x) ≤ x ⬝ᵥ G *ᵥ x := (h.2.2 x).1

theorem GramComparison.upper {G : Matrix (Fin n) (Fin n) ℝ} {Gt : Matrix (Fin n) (Fin n) ℚ}
    {ε : ℚ} (h : GramComparison G Gt ε) (x : Fin n → ℝ) :
    x ⬝ᵥ G *ᵥ x ≤ (1 + (ε : ℝ)) * (x ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ x) := (h.2.2 x).2

theorem GramComparison.posDef_iff {G : Matrix (Fin n) (Fin n) ℝ} {Gt : Matrix (Fin n) (Fin n) ℚ}
    {ε : ℚ} (h : GramComparison G Gt ε) (hG : G.IsHermitian) (hGt : Gt.IsSymm) :
    G.PosDef ↔ Gt.PosDef := by sorry

theorem GramComparison.congr {G : Matrix (Fin n) (Fin n) ℝ} {Gt : Matrix (Fin n) (Fin n) ℚ}
    {ε : ℚ} (h : GramComparison G Gt ε) (U : Matrix (Fin n) (Fin n) ℚ) :
    GramComparison ((U.map (fun r : ℚ => (r : ℝ)))ᵀ * G * U.map (fun r : ℚ => (r : ℝ)))
      (Uᵀ * Gt * U) ε := by sorry

theorem GramComparison.bilinear {G : Matrix (Fin n) (Fin n) ℝ} {Gt : Matrix (Fin n) (Fin n) ℚ}
    {ε : ℚ} (h : GramComparison G Gt ε) (hG : G.IsHermitian) (hGt : Gt.IsSymm)
    (x y : Fin n → ℝ) :
    |x ⬝ᵥ (G - Gt.map (fun r : ℚ => (r : ℝ))) *ᵥ y| ≤
      (ε : ℝ) * Real.sqrt (x ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ x) *
        Real.sqrt (y ⬝ᵥ Gt.map (fun r : ℚ => (r : ℝ)) *ᵥ y) := by sorry

theorem GramComparison.refl (Gt : Matrix (Fin n) (Fin n) ℚ) :
    GramComparison (Gt.map (fun r : ℚ => (r : ℝ))) Gt 0 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.gramComparison_refl.
example : GramComparison (1 : Matrix (Fin 2) (Fin 2) ℝ) 1 0 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.gramComparison_diag.
example : GramComparison (Matrix.diagonal ![1, 11/10]) (1 : Matrix (Fin 2) (Fin 2) ℚ) (1/10) ∧
    ¬ GramComparison (Matrix.diagonal ![1, 11/10]) (1 : Matrix (Fin 2) (Fin 2) ℚ) (1/20) := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.gramComparison_non_example.
example (ε : ℚ) : ¬ GramComparison (Matrix.diagonal ![1, 2]) (1 : Matrix (Fin 2) (Fin 2) ℚ) ε := by
  sorry

-- Test TauCeti.GeometryOfNumbersPlan.gramComparison_swap.
example : GramComparison (Matrix.diagonal ![11/10, 1]) (1 : Matrix (Fin 2) (Fin 2) ℚ) (1/10) := by
  sorry

/-- GN.5/entrywise-enclosure-comparison. -/
theorem entrywise_enclosure_comparison (G : Matrix (Fin n) (Fin n) ℝ) (Gt : Matrix (Fin n) (Fin n) ℚ)
    (hG : G.IsHermitian) (hGt : Gt.IsSymm) (η ε : ℚ) (hη : 0 ≤ η) (hε : 0 < ε) (hε1 : ε < 1)
    (hencl : ∀ i j, |G i j - (Gt i j : ℝ)| ≤ η)
    (hpos : (Gt - ((n : ℚ) * η / ε) • (1 : Matrix (Fin n) (Fin n) ℚ)).PosDef) :
    GramComparison G Gt ε := by sorry

/-- GN.5/loewner-det-monotone. -/
theorem loewner_det_monotone (A B : Matrix (Fin n) (Fin n) ℝ) (hA : A.PosDef) (hB : B.PosSemidef)
    (h : ∀ x : Fin n → ℝ, x ⬝ᵥ B *ᵥ x ≤ x ⬝ᵥ A *ᵥ x) : B.det ≤ A.det := by sorry

/-- GN.5/reduction-transfer-under-comparison. -/
theorem reduction_transfer_under_comparison {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] (b : Fin n → E) (hb : LinearIndependent ℝ b)
    (Gt : Matrix (Fin n) (Fin n) ℚ) (ε : ℚ)
    (hcmp : GramComparison (Matrix.gram ℝ b) Gt ε) (U : Matrix.GeneralLinearGroup (Fin n) ℤ)
    (hUpos : ((U.1.map (Int.cast : ℤ → ℝ))ᵀ * Gt.map (fun r : ℚ => (r : ℝ)) *
      U.1.map (Int.cast : ℤ → ℝ)).PosDef)
    (hred : IsLLLReducedGram _ hUpos) (hn : 0 < n) :
    ∀ x ∈ Submodule.span ℤ (Set.range b), x ≠ 0 →
      ‖∑ j, (U.1 j ⟨0, hn⟩ : ℝ) • b j‖ ^ 2 ≤
        ((1 + (ε : ℝ)) / (1 - ε)) * (2 : ℝ) ^ (n - 1) * ‖x‖ ^ 2 := by sorry

theorem enumeration_cover_under_comparison {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] (b : Fin n → E) (Gt : Matrix (Fin n) (Fin n) ℚ) (hGt : Gt.PosDef)
    (ε : ℚ) (hcmp : GramComparison (Matrix.gram ℝ b) Gt ε) (t : Fin n → ℚ) (R : ℚ) (hR : 0 ≤ R)
    (x : Fin n → ℤ) (hx : ‖∑ i, ((x i : ℝ) - t i) • b i‖ ^ 2 ≤ R) :
    x ∈ fpEnumeration Gt t (R / (1 - ε)) := by sorry

end Comparison

/-! ## Number-field adapters -/

section NumberFieldAdapters
open NumberField NumberField.InfinitePlace NumberField.mixedEmbedding
open scoped nonZeroDivisors Classical

variable (K : Type*) [Field K] [NumberField K]

/-- The Euclidean embedding `ι = (toMixed)⁻¹ ∘ mixedEmbedding` of `K`. -/
def euclideanEmbedding (a : K) : euclidean.mixedSpace K :=
  (euclidean.toMixed K).symm (mixedEmbedding K a)

/-- **The Euclidean lattice of a fractional ideal.** -/
def euclideanIdealLattice (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Submodule ℤ (euclidean.mixedSpace K) :=
  ZLattice.comap ℝ (mixedEmbedding.idealLattice K I) (euclidean.toMixed K).toLinearMap

instance euclideanIdealLattice.instDiscreteTopology (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    DiscreteTopology (euclideanIdealLattice K I) := by sorry

instance euclideanIdealLattice.instIsZLattice (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    IsZLattice ℝ (euclideanIdealLattice K I) := by sorry

theorem mem_euclideanIdealLattice (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (x : euclidean.mixedSpace K) :
    x ∈ euclideanIdealLattice K I ↔
      ∃ a ∈ ((I : FractionalIdeal (𝓞 K)⁰ K) : Set K), euclideanEmbedding K a = x := by sorry

theorem norm_sq_euclideanEmbedding (a : K) :
    ‖euclideanEmbedding K a‖ ^ 2 =
      ∑ w : {w : InfinitePlace K // IsReal w}, w.1 a ^ 2 +
        ∑ w : {w : InfinitePlace K // IsComplex w}, w.1 a ^ 2 := by sorry

theorem covolume_euclideanIdealLattice (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    ZLattice.covolume (euclideanIdealLattice K I) =
      (FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℝ) *
        (2⁻¹) ^ nrComplexPlaces K * Real.sqrt |(discr K : ℝ)| := by sorry

theorem euclideanIdealLattice_one :
    euclideanIdealLattice K 1 = euclidean.integerLattice K := by sorry

/-- GN.5/euclidean-house-norm-bounds. -/
theorem house_le_norm_euclideanEmbedding (a : K) : house a ≤ ‖euclideanEmbedding K a‖ := by sorry

theorem abs_norm_rpow_le_euclidean (a : K) :
    (|(Algebra.norm ℚ a : ℝ)|) ^ ((2 : ℝ) / Module.finrank ℚ K) ≤
      (2 / Module.finrank ℚ K) * ‖euclideanEmbedding K a‖ ^ 2 := by sorry

theorem abs_norm_rpow_le_euclidean_of_totallyReal (a : K) (hK : ∀ w : InfinitePlace K, IsReal w) :
    (|(Algebra.norm ℚ a : ℝ)|) ^ ((2 : ℝ) / Module.finrank ℚ K) ≤
      (1 / Module.finrank ℚ K) * ‖euclideanEmbedding K a‖ ^ 2 := by sorry

/-- GN.5/integral-log-height-le-house (moved down from DT.4). -/
theorem integral_logHeight_le_house (a : 𝓞 K) :
    Height.logHeight₁ (a : K) ≤ Module.finrank ℚ K * Real.posLog (house (a : K)) ∧
      Module.finrank ℚ K * Real.posLog (house (a : K)) ≤
        (Module.finrank ℚ K / 2) * Real.posLog (‖euclideanEmbedding K (a : K)‖ ^ 2) := by sorry

/-- GN.5/ideal-short-element. -/
theorem ideal_short_element {n : ℕ} (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (β : Fin n → K) (hβ : Module.finrank ℚ K = n)
    (hbasis : Submodule.span ℤ (Set.range β) =
      (((I : FractionalIdeal (𝓞 K)⁰ K) : Submodule (𝓞 K) K).restrictScalars ℤ))
    (Gt : Matrix (Fin n) (Fin n) ℚ) (ε : ℚ)
    (hcmp : GramComparison (Matrix.gram ℝ (fun i => euclideanEmbedding K (β i))) Gt ε)
    (U : Matrix.GeneralLinearGroup (Fin n) ℤ)
    (hUpos : ((U.1.map (Int.cast : ℤ → ℝ))ᵀ * Gt.map (fun r : ℚ => (r : ℝ)) *
      U.1.map (Int.cast : ℤ → ℝ)).PosDef)
    (hred : IsLLLReducedGram _ hUpos) (hn : 0 < n) :
    let α := ∑ j, (U.1 j ⟨0, hn⟩ : K) * β j
    α ∈ ((I : FractionalIdeal (𝓞 K)⁰ K) : Set K) ∧ α ≠ 0 ∧
      ‖euclideanEmbedding K α‖ ^ 2 ≤ ((1 + (ε : ℝ)) / (1 - ε)) * (2 : ℝ) ^ (((n : ℝ) - 1) / 2) *
        ((FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℝ) *
          (2⁻¹) ^ nrComplexPlaces K * Real.sqrt |(discr K : ℝ)|) ^ ((2 : ℝ) / n) := by sorry

/-- GN.5/ideal-class-small-representative. -/
theorem ideal_class_small_representative (I : Ideal (𝓞 K)) (hI : I ≠ ⊥) (ε : ℚ)
    (hε : 0 ≤ ε ∧ ε < 1) (α : 𝓞 K) (hα : α ∈ I) (hα0 : α ≠ 0)
    (hsmall : (|(Algebra.norm ℚ (α : K) : ℝ)|) ≤
      (2 * ((1 + (ε : ℝ)) / (1 - ε)) / Module.finrank ℚ K) ^ ((Module.finrank ℚ K : ℝ) / 2) *
        (2 : ℝ) ^ (((Module.finrank ℚ K : ℝ) * (Module.finrank ℚ K - 1)) / 4) *
        (2⁻¹) ^ nrComplexPlaces K * Real.sqrt |(discr K : ℝ)| * (Ideal.absNorm I : ℝ)) :
    ∃ J : Ideal (𝓞 K), J ≠ ⊥ ∧ J * I = Ideal.span {α} ∧
      (Ideal.absNorm J : ℝ) ≤
        (2 * ((1 + (ε : ℝ)) / (1 - ε)) / Module.finrank ℚ K) ^ ((Module.finrank ℚ K : ℝ) / 2) *
          (2 : ℝ) ^ (((Module.finrank ℚ K : ℝ) * (Module.finrank ℚ K - 1)) / 4) *
          (2⁻¹) ^ nrComplexPlaces K * Real.sqrt |(discr K : ℝ)| := by sorry

end NumberFieldAdapters

section NumberFieldTests
open NumberField NumberField.mixedEmbedding

-- Test TauCeti.GeometryOfNumbersPlan.euclideanIdealLattice_gaussian: for ℚ(i), 𝓞_K has
-- Euclidean covolume `2⁻¹ · √4 = 1`.
example : (2⁻¹ : ℝ) ^ 1 * Real.sqrt |(-4 : ℝ)| = 1 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.euclideanIdealLattice_rat: for ℚ and I = (2) the covolume is 2.
example : (2 : ℝ) * (2⁻¹) ^ 0 * Real.sqrt |(1 : ℝ)| = 2 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.euclideanIdealLattice_not_trace: in ℚ(i) the Euclidean
-- length of `i` is 1 while `Σ_σ |σ i|² = 2`.
example : Complex.normSq Complex.I = 1 ∧
    Complex.normSq Complex.I + Complex.normSq (starRingEnd ℂ Complex.I) = 2 := by sorry

-- Test TauCeti.GeometryOfNumbersPlan.euclideanIdealLattice_totally_real: in ℚ(√2),
-- `‖ι(√2)‖² = 2 + 2 = 4 = Tr(√2 · √2)`.
example : (Real.sqrt 2) ^ 2 + (-Real.sqrt 2) ^ 2 = 4 := by sorry

end NumberFieldTests

/-! ## Simultaneous approximation (1.39) -/

/-- GN.5/lll-simultaneous-approximation. -/
theorem lll_simultaneous_approximation (n : ℕ) (hn : 1 ≤ n) (α : Fin n → ℚ) (ε : ℚ)
    (hε : 0 < ε) (hε1 : ε < 1) :
    ∃ (p : Fin n → ℤ) (q : ℤ), 1 ≤ q ∧ (q : ℝ) ≤ (2 : ℝ) ^ (((n : ℝ) * (n + 1)) / 4) * (ε : ℝ) ^ (-(n : ℝ)) ∧
      ∀ i, |(p i : ℚ) - q * α i| ≤ ε := by sorry

/-! ## Arithmetic-group adapters -/

section Siegel
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- GN.5/lll-reduced-is-siegel-reduced. -/
theorem lll_reduced_gram_bounds (b : Fin n → E) (h : IsLLLReduced b) :
    (∀ i j, |Matrix.gram ℝ b i j| ≤ (2 : ℝ) ^ (i.val + 1) * Matrix.gram ℝ b i i) ∧
    (∀ i j, i < j → Matrix.gram ℝ b i i ≤ (2 : ℝ) ^ (n - 1) * Matrix.gram ℝ b j j) ∧
    (∏ i, Matrix.gram ℝ b i i ≤ (2 : ℝ) ^ (n * (n - 1) / 2) * (Matrix.gram ℝ b).det) := by sorry

theorem lll_reduced_isReduced (b : Fin n → E) (h : IsLLLReduced b) :
    RealSiegel.IsReduced ((2 : ℝ) ^ (n * (n - 1) / 2) + 2 ^ n) (Matrix.gram ℝ b) := by sorry

/-- GN.5/lll-siegel-domain-certificate: the Siegel parameter `u_n`. -/
def siegelU (n : ℕ) : ℝ := (1/2) * (3/2 : ℝ) ^ (n - 2)

theorem inv_unitriangular_bound (N : Matrix (Fin n) (Fin n) ℝ)
    (hN : ∀ i j, j < i → N i j = 0) (hN1 : ∀ i, N i i = 1) (hNu : ∀ i j, i < j → |N i j| ≤ 1/2)
    (i j : Fin n) (hij : i < j) :
    |N⁻¹ i j| ≤ (1/2) * (3/2 : ℝ) ^ (j.val - i.val - 1) := by sorry

theorem lll_siegel_domain_certificate (g : Matrix.GeneralLinearGroup (Fin n) ℝ)
    (U : Matrix.GeneralLinearGroup (Fin n) ℤ)
    (hred : IsLLLReduced (fun i : Fin n =>
      WithLp.toLp 2 (fun r : Fin n => ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) ℝ).1 *
        U.1.map (Int.cast : ℤ → ℝ)) r i))) :
    ((U⁻¹ : Matrix.GeneralLinearGroup (Fin n) ℤ).1.map (Int.cast : ℤ → ℝ)) * g.1 ∈
      standardSiegelDomain n (siegelU n) (1 / Real.sqrt 2) := by sorry

end Siegel

end TauCeti.GeometryOfNumbersPlan
