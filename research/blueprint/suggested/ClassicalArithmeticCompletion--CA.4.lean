import Mathlib.Algebra.Group.Subgroup.Lattice
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Int.Sqrt
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.Set.Card
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Zsqrtd.Basic
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Topology.Algebra.InfiniteSum.Basic

/-!
# Classical Diophantine equations, CA.4 follow-up part: suggested Lean

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ClassicalArithmeticCompletion--CA.4.md` is definitive; the statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Light definitions have real bodies; every proof is `sorry`. Nothing here is implemented.

The part covers: the Markoff–Hurwitz varieties and their moves (Gamburd–Magee–Ronan), the
coefficient-one Markoff level surfaces of Ghosh–Sarnak and Chen's trace-coordinate surface,
the Δ-function, class numbers and fundamental sets, local solubility and Hasse failures, the
negative-Pell radicands of Koymans–Pagano, and the formal Jacobi triple product with its
specialisations. The first-pass carriers it builds on (`markoffSet`, `markoffVieta`,
`positiveMarkoffTriples`, `pellNormSet`) are restated verbatim from the first-pass suggested file
so that this part elaborates on its own; the assembly keeps one copy.
-/

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open scoped BigOperators

namespace TauCeti.ClassicalArithmetic

/-! ## First-pass carriers used here (verbatim from the first-pass suggested file) -/

/-- The Markoff surface `X(R)`: x₀² + x₁² + x₂² = 3x₀x₁x₂ (CA.4/markoff-triples). -/
def markoffSet (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  {x | x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = 3 * x 0 * x 1 * x 2}

/-- The Vieta move `R_i` of the coefficient-three surface (CA.4/markoff-vieta-involution). -/
def markoffVieta {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) : Fin 3 → R :=
  Function.update x i (3 * x (i + 1) * x (i + 2) - x i)

/-- The positive Markoff triples `M` (CA.4/positive-markoff-triples). -/
def positiveMarkoffTriples : Set (Fin 3 → ℤ) :=
  {x | x ∈ markoffSet ℤ ∧ ∀ i, 0 < x i}

/-- The solutions of x² − dy² = n, as elements of `ℤ√d` of norm `n`
(CA.4/generalised-pell-solution-set). -/
def pellNormSet (d n : ℤ) : Set (ℤ√d) :=
  {z | Zsqrtd.norm z = n}

/-! ## Markoff–Hurwitz varieties (`CA.4/markoff-hurwitz-variety`) -/

section MarkoffHurwitz

variable {R S : Type*} [CommRing R] [CommRing S]

/-- `V_{n,a,k}(R)`: the solutions of x₁² + ⋯ + x_n² = a·x₁⋯x_n + k. -/
def markoffHurwitzSet (n : ℕ) (a k : R) : Set (Fin n → R) :=
  {x | ∑ i, x i ^ 2 = a * ∏ i, x i + k}

theorem markoffHurwitzSet.mem_iff {n : ℕ} {a k : R} {x : Fin n → R} :
    x ∈ markoffHurwitzSet n a k ↔ ∑ i, x i ^ 2 = a * ∏ i, x i + k := Iff.rfl

theorem markoffHurwitzSet.map_mem (f : R →+* S) {n : ℕ} {a k : R} {x : Fin n → R}
    (hx : x ∈ markoffHurwitzSet n a k) : f ∘ x ∈ markoffHurwitzSet n (f a) (f k) := by sorry

theorem markoffHurwitzSet.comp_perm_mem_iff {n : ℕ} {a k : R} (σ : Equiv.Perm (Fin n))
    (x : Fin n → R) : x ∘ σ ∈ markoffHurwitzSet n a k ↔ x ∈ markoffHurwitzSet n a k := by sorry

theorem markoffHurwitzSet.signChange_mem_iff {n : ℕ} {a k : R} (ε : Fin n → ℤˣ)
    (hε : ∏ i, ε i = 1) (x : Fin n → R) :
    (fun i => ((ε i : ℤ) : R) * x i) ∈ markoffHurwitzSet n a k ↔ x ∈ markoffHurwitzSet n a k := by
  sorry

/-- `V_{n,a,k}(ℤ₊)`, the positive Markoff–Hurwitz tuples. -/
def markoffHurwitzPositive (n : ℕ) (a k : ℤ) : Set (Fin n → ℤ) :=
  {x | x ∈ markoffHurwitzSet n a k ∧ ∀ i, 0 < x i}

theorem markoffHurwitzSet_three_three_zero :
    markoffHurwitzSet 3 (3 : R) 0 = markoffSet R := by sorry

example : (![1, 1, 1, 1] : Fin 4 → ℤ) ∈ markoffHurwitzSet 4 4 0 ∧
    (![3, 1, 1, 1] : Fin 4 → ℤ) ∈ markoffHurwitzSet 4 4 0 := by sorry -- markoffHurwitzSet_four_ones

example : (![2, 3, 5] : Fin 3 → ℤ) ∈ markoffHurwitzSet 3 1 8 := by
  sorry -- markoffHurwitzSet_two_three_five

theorem zero_mem_markoffHurwitzSet_iff {n : ℕ} (hn : 1 ≤ n) {a k : R} :
    (0 : Fin n → R) ∈ markoffHurwitzSet n a k ↔ k = 0 := by sorry

example : (![1, 1, 1] : Fin 3 → ℤ) ∈ markoffHurwitzSet 3 3 0 := by
  sorry -- markoffHurwitzSet_three_three_zero_ones

example : (![1, 1, 2] : Fin 3 → ℤ) ∈ markoffHurwitzSet 3 3 0 ∧
    (![-1, 1, 2] : Fin 3 → ℤ) ∉ markoffHurwitzSet 3 3 0 := by sorry -- neg_one_one_two_not_mem

end MarkoffHurwitz

/-! ## Moves and the group `Γ_{n,a}` (`CA.4/markoff-hurwitz-moves`) -/

section Moves

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The move `m_j`: replace `x j` by `a·∏_{i≠j} x i − x j`. -/
def markoffHurwitzMove {n : ℕ} (a : R) (j : Fin n) (x : Fin n → R) : Fin n → R :=
  Function.update x j (a * ∏ i ∈ Finset.univ.erase j, x i - x j)

@[simp] theorem markoffHurwitzMove_apply_self {n : ℕ} (a : R) (j : Fin n) (x : Fin n → R) :
    markoffHurwitzMove a j x j = a * ∏ i ∈ Finset.univ.erase j, x i - x j := by sorry

@[simp] theorem markoffHurwitzMove_apply_of_ne {n : ℕ} (a : R) {i j : Fin n} (h : i ≠ j)
    (x : Fin n → R) : markoffHurwitzMove a j x i = x i := by sorry

theorem markoffHurwitzMove_involutive {n : ℕ} (a : R) (j : Fin n) :
    Function.Involutive (markoffHurwitzMove a j) := by sorry

theorem markoffHurwitzMove_mem {n : ℕ} {a k : R} (j : Fin n) {x : Fin n → R}
    (hx : x ∈ markoffHurwitzSet n a k) : markoffHurwitzMove a j x ∈ markoffHurwitzSet n a k := by
  sorry

theorem markoffHurwitzMove_map (f : R →+* S) {n : ℕ} (a : R) (j : Fin n) (x : Fin n → R) :
    f ∘ markoffHurwitzMove a j x = markoffHurwitzMove (f a) j (f ∘ x) := by sorry

/-- The move as a permutation of `Fin n → R`. -/
def markoffHurwitzMovePerm {n : ℕ} (a : R) (j : Fin n) : Equiv.Perm (Fin n → R) :=
  (markoffHurwitzMove_involutive a j).toPerm _

/-- The coordinate permutation `x ↦ x ∘ σ⁻¹`. -/
def coordPerm {n : ℕ} (σ : Equiv.Perm (Fin n)) : Equiv.Perm (Fin n → R) :=
  Equiv.arrowCongr σ (Equiv.refl R)

theorem signChange_involutive {n : ℕ} (ε : Fin n → ℤˣ) :
    Function.Involutive (fun (x : Fin n → R) i => ((ε i : ℤ) : R) * x i) := by sorry

/-- The sign change `x ↦ (ε i x i)_i` as a permutation. -/
def signChangePerm {n : ℕ} (ε : Fin n → ℤˣ) : Equiv.Perm (Fin n → R) :=
  (signChange_involutive (R := R) ε).toPerm _

/-- `Γ_{n,a}(R)`: generated by the moves, the permutations and the even sign changes. -/
def markoffHurwitzGroup (n : ℕ) (a : R) : Subgroup (Equiv.Perm (Fin n → R)) :=
  Subgroup.closure ({g | ∃ j, g = markoffHurwitzMovePerm a j} ∪ {g | ∃ σ, g = coordPerm σ} ∪
    {g | ∃ ε : Fin n → ℤˣ, ∏ i, ε i = 1 ∧ g = signChangePerm ε})

/-- The narrow subgroup, generated by the permutations and even sign changes. -/
def markoffHurwitzNarrowGroup (n : ℕ) (R : Type*) [CommRing R] :
    Subgroup (Equiv.Perm (Fin n → R)) :=
  Subgroup.closure ({g | ∃ σ, g = coordPerm σ} ∪
    {g | ∃ ε : Fin n → ℤˣ, ∏ i, ε i = 1 ∧ g = signChangePerm ε})

theorem markoffHurwitzGroup.apply_mem {n : ℕ} {a k : R} {g : Equiv.Perm (Fin n → R)}
    (hg : g ∈ markoffHurwitzGroup n a) {x : Fin n → R} (hx : x ∈ markoffHurwitzSet n a k) :
    g x ∈ markoffHurwitzSet n a k := by sorry

theorem markoffHurwitzMove_three_one (j : Fin 3) (x : Fin 3 → R) :
    markoffHurwitzMove (1 : R) j x = Function.update x j (x (j + 1) * x (j + 2) - x j) := by sorry

theorem markoffHurwitzMove_three_three (j : Fin 3) (x : Fin 3 → R) :
    markoffHurwitzMove (3 : R) j x = markoffVieta j x := by sorry

example : markoffHurwitzMove (1 : ℤ) 2 ![3, 3, 3] = ![3, 3, 6] := by
  sorry -- markoffHurwitzMove_three_three_three

example : markoffHurwitzMove (4 : ℤ) 0 ![1, 1, 1, 1] = ![3, 1, 1, 1] := by
  sorry -- markoffHurwitzMove_four_ones

theorem markoffHurwitzMove_zero {n : ℕ} (hn : 2 ≤ n) (a : R) (j : Fin n) :
    markoffHurwitzMove a j 0 = 0 := by sorry

example : markoffHurwitzMove (3 : ℤ) 2 ![1, 1, 1] = ![1, 1, 2] ∧
    markoffHurwitzMove (3 : ℤ) 2 ![1, 1, 1] = markoffVieta 2 ![1, 1, 1] := by
  sorry -- markoffHurwitzMove_eq_markoffVieta

example : (![1, 1, 1] : Fin 3 → ℤ) ∈ markoffHurwitzSet 3 1 2 ∧
    (![-1, 1, 1] : Fin 3 → ℤ) ∉ markoffHurwitzSet 3 1 2 := by
  sorry -- single_sign_change_not_preserving

example : Nat.card (markoffHurwitzNarrowGroup 3 ℤ) = 24 := by
  sorry -- card_markoffHurwitzNarrow_three

end Moves

/-! ## Markoff level surfaces (`CA.4/markoff-level-surface`) -/

section LevelSurface

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The Markoff cubic `M(x) = x₁² + x₂² + x₃² − x₁x₂x₃`. -/
def markoffPoly (x : Fin 3 → R) : R :=
  x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 - x 0 * x 1 * x 2

/-- `V_k(R) = {M = k}`. -/
def markoffLevelSet (R : Type*) [CommRing R] (k : R) : Set (Fin 3 → R) :=
  {x | markoffPoly x = k}

/-- Chen's trace-coordinate Markoff surface `X(R) = V₀(R)`. -/
def markoffTraceSurface (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  markoffLevelSet R 0

/-- `X*(R) = X(R) ∖ {0}`. -/
def markoffTraceSurfaceNonzero (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  markoffTraceSurface R \ {0}

theorem markoffLevelSet.mem_iff {k : R} {x : Fin 3 → R} :
    x ∈ markoffLevelSet R k ↔ x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 - x 0 * x 1 * x 2 = k := Iff.rfl

theorem markoffLevelSet.map_mem (f : R →+* S) {k : R} {x : Fin 3 → R}
    (hx : x ∈ markoffLevelSet R k) : f ∘ x ∈ markoffLevelSet S (f k) := by sorry

theorem markoffLevelSet.comp_perm_mem_iff {k : R} (σ : Equiv.Perm (Fin 3)) (x : Fin 3 → R) :
    x ∘ σ ∈ markoffLevelSet R k ↔ x ∈ markoffLevelSet R k := by sorry

theorem markoffLevelSet.doubleNeg_mem_iff {k : R} (x : Fin 3 → R) :
    (![-x 0, -x 1, x 2] : Fin 3 → R) ∈ markoffLevelSet R k ↔ x ∈ markoffLevelSet R k := by sorry

theorem markoffLevelSet.neg_one_mem_iff {k : R} (x : Fin 3 → R) :
    (![-x 0, x 1, x 2] : Fin 3 → R) ∈ markoffLevelSet R k ↔
      x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 + x 0 * x 1 * x 2 = k := by sorry

theorem markoffLevelSet_eq_markoffHurwitzSet (k : R) :
    markoffLevelSet R k = markoffHurwitzSet 3 1 k := by sorry

theorem markoffHurwitzSet_three_one (k : R) :
    markoffHurwitzSet 3 (1 : R) k = markoffLevelSet R k :=
  (markoffLevelSet_eq_markoffHurwitzSet k).symm

example : (![3, 3, 3] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 0 ∧
    (![0, 1, 2] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 5 ∧
    (![3, 3, 4] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ (-2) := by sorry -- markoffLevelSet_int_examples

example : (![1, 1, 1] : Fin 3 → ℤ) ∉ markoffTraceSurface ℤ ∧
    (![1, 1, 1] : Fin 3 → ℤ) ∈ markoffSet ℤ := by sorry -- ones_not_mem_markoffTraceSurface

theorem zero_mem_markoffLevelSet_iff (k : R) :
    (0 : Fin 3 → R) ∈ markoffLevelSet R k ↔ k = 0 := by sorry

example : markoffTraceSurface (ZMod 3) = {0} := by sorry -- markoffTraceSurface_zmod_three

example : markoffLevelSet (ZMod 4) 3 = ∅ := by sorry -- markoffLevelSet_zmod_four_three

example : markoffLevelSet ℤ 8 = markoffHurwitzSet 3 1 8 ∧
    (![2, 3, 5] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 8 := by
  sorry -- markoffLevelSet_eq_markoffHurwitzSet_ex

end LevelSurface

/-! ## The twist `ξ(y) = 3y` (`CA.4/markoff-coefficient-three-twist`) -/

section Twist

variable {R : Type*} [CommRing R]

/-- `ξ(y) = 3 • y`. -/
def markoffTwist (y : Fin 3 → R) : Fin 3 → R := (3 : R) • y

theorem markoffTwist_mem {y : Fin 3 → R} (hy : y ∈ markoffSet R) :
    markoffTwist y ∈ markoffLevelSet R 0 := by sorry

theorem markoffTwist_markoffVieta (j : Fin 3) (y : Fin 3 → R) :
    markoffTwist (markoffVieta j y) = markoffHurwitzMove (1 : R) j (markoffTwist y) := by sorry

theorem markoffTwist_comp_perm (σ : Equiv.Perm (Fin 3)) (y : Fin 3 → R) :
    markoffTwist (y ∘ σ) = markoffTwist y ∘ σ := by sorry

theorem markoffTwist_signChange (ε : Fin 3 → ℤˣ) (y : Fin 3 → R) :
    markoffTwist (fun i => ((ε i : ℤ) : R) * y i) = fun i => ((ε i : ℤ) : R) * markoffTwist y i := by
  sorry

/-- Over a ring in which 3 is a unit, `ξ` identifies the two surfaces. -/
noncomputable def markoffTwistEquiv (h : IsUnit (3 : R)) : markoffSet R ≃ markoffLevelSet R 0 where
  toFun y := ⟨markoffTwist y.1, markoffTwist_mem y.2⟩
  invFun x := ⟨(h.unit⁻¹ : Rˣ) • x.1, by sorry⟩
  left_inv y := by sorry
  right_inv x := by sorry

theorem markoffTwist_bijOn_int :
    Set.BijOn markoffTwist (markoffSet ℤ) (markoffLevelSet ℤ 0) := by sorry

example : markoffTwist (![1, 1, 1] : Fin 3 → ℤ) = ![3, 3, 3] ∧
    markoffTwist (![2, 5, 29] : Fin 3 → ℤ) = ![6, 15, 87] ∧
    (![6, 15, 87] : Fin 3 → ℤ) ∈ markoffTraceSurface ℤ := by sorry -- markoffTwist_examples

example : (∀ y : Fin 3 → ZMod 3, markoffTwist y = 0) ∧ markoffTraceSurface (ZMod 3) = {0} ∧
    Nat.card (markoffSet (ZMod 3)) = 9 := by sorry -- markoffTwist_zmod_three

theorem markoffTwist_zero : markoffTwist (0 : Fin 3 → R) = 0 := by sorry

example : Nat.card (markoffSet (ZMod 5)) = 41 ∧ Nat.card (markoffLevelSet (ZMod 5) 0) = 41 := by
  sorry -- markoffTwistEquiv_zmod_five

example : markoffTwist (markoffVieta 2 (![1, 1, 1] : Fin 3 → ℤ)) = ![3, 3, 6] ∧
    markoffHurwitzMove (1 : ℤ) 2 ![3, 3, 3] = ![3, 3, 6] := by sorry -- markoffTwist_vieta_example

/-- CA.4/markoff-positive-zero-orbit (Chen, Theorem 1.2.1): the positive points of `X(ℤ)` are
the words in the coefficient-one moves applied to `(3, 3, 3)`. -/
theorem markoff_positive_zero_orbit (x : Fin 3 → ℤ) :
    (x ∈ markoffTraceSurface ℤ ∧ ∀ i, 0 < x i) ↔
      ∃ l : List (Fin 3), x = l.foldr (fun j y => markoffHurwitzMove (1 : ℤ) j y) ![3, 3, 3] := by
  sorry

end Twist

/-! ## Ghosh–Sarnak's Δ-function (`CA.4/markoff-delta`, `CA.4/markoff-delta-differences`) -/

section Delta

variable {R : Type*} [CommRing R]

/-- `Δ(x) = (1 + x₂² − x₁² − x₃²)² − 4(x₁x₃ − x₂)²`. -/
def markoffDelta (x : Fin 3 → R) : R :=
  (1 + x 1 ^ 2 - x 0 ^ 2 - x 2 ^ 2) ^ 2 - 4 * (x 0 * x 2 - x 1) ^ 2

theorem markoffDelta_eq_prod (x : Fin 3 → R) :
    markoffDelta x = (1 + x 0 + x 1 + x 2) * (1 + x 1 - x 0 - x 2) * (1 + x 2 - x 0 - x 1) *
      (1 + x 0 - x 1 - x 2) := by sorry

/-- The coefficients `(A_i, B_i, C_i)` of the Bhargava form
`Q_i = (x_j x_l − x_i)u² + (1 + x_i² − x_j² − x_l²)uv + (x_j x_l − x_i)v²`. -/
def markoffBhargavaForm (i : Fin 3) (x : Fin 3 → R) : R × R × R :=
  (x (i + 1) * x (i + 2) - x i, 1 + x i ^ 2 - x (i + 1) ^ 2 - x (i + 2) ^ 2,
    x (i + 1) * x (i + 2) - x i)

theorem markoffBhargavaForm_discr (i : Fin 3) (x : Fin 3 → R) :
    (markoffBhargavaForm i x).2.1 ^ 2 - 4 * (markoffBhargavaForm i x).1 *
      (markoffBhargavaForm i x).2.2 = markoffDelta x := by sorry

@[simp] theorem markoffDelta_comp_perm (σ : Equiv.Perm (Fin 3)) (x : Fin 3 → R) :
    markoffDelta (x ∘ σ) = markoffDelta x := by sorry

@[simp] theorem markoffDelta_doubleNeg (x : Fin 3 → R) :
    markoffDelta (![-x 0, -x 1, x 2] : Fin 3 → R) = markoffDelta x := by sorry

theorem markoffDelta_emod_four (x : Fin 3 → ℤ) :
    markoffDelta x % 4 = if (x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) % 2 = 1 then 0 else 1 := by sorry

theorem markoffDelta_neg_iff {x : Fin 3 → ℤ} (h0 : 2 ≤ x 0) (h1 : x 0 ≤ x 1) (h2 : x 1 ≤ x 2) :
    markoffDelta x < 0 ↔ x 1 ≤ x 2 ∧ x 2 ≤ x 0 + x 1 - 2 := by sorry

example : markoffDelta (0 : Fin 3 → ℤ) = 1 := by sorry -- markoffDelta_zero

example : markoffDelta (![3, 3, 3] : Fin 3 → ℤ) = -80 := by sorry -- markoffDelta_three_three_three

example (a : ℤ) : markoffDelta (![2, a, a] : Fin 3 → ℤ) = 9 - 4 * a ^ 2 ∧
    markoffDelta (![-1, 1, 1] : Fin 3 → ℤ) = -16 := by sorry -- markoffDelta_cayley

example : markoffDelta (![1, 1, 1] : Fin 3 → ℤ) = 0 ∧
    markoffDelta (![-1, 1, 1] : Fin 3 → ℤ) = -16 := by sorry -- markoffDelta_single_sign_change

example : markoffDelta (![3, 3, 6] : Fin 3 → ℤ) = 325 ∧
    markoffDelta (![3, 3, 6] : Fin 3 → ℤ) ≠ markoffDelta (![3, 3, 3] : Fin 3 → ℤ) := by
  sorry -- markoffDelta_not_vieta_invariant

example (i : Fin 3) : markoffBhargavaForm i (![3, 3, 3] : Fin 3 → ℤ) = (6, -8, 6) := by
  sorry -- markoffBhargavaForm_discr_example

/-- CA.4/markoff-delta-differences (1): the identity behind (8.2). -/
theorem markoff_sq_sub_four_mul (k : R) {x : Fin 3 → R} (hx : x ∈ markoffLevelSet R k) :
    (x 0 ^ 2 - 4) * (x 1 ^ 2 - 4) = (2 * x 2 - x 0 * x 1) ^ 2 - 4 * (k - 4) := by sorry

/-- CA.4/markoff-delta-differences (2): Ghosh–Sarnak (4.1), for the move in the last coordinate
(the other two follow by permuting). -/
theorem markoffDelta_move_sub (k : R) {x : Fin 3 → R} (hx : x ∈ markoffLevelSet R k) :
    markoffDelta (markoffHurwitzMove (1 : R) 2 x) - markoffDelta x =
      x 0 * x 1 * (x 0 * x 1 - 2 * x 2) * (2 * (k - 5) + (x 0 ^ 2 - 4) * (x 1 ^ 2 - 4)) := by
  sorry

/-- CA.4/markoff-delta-differences: positivity of the bracket. -/
theorem markoffDelta_bracket_pos {k : ℤ} {x : Fin 3 → ℤ} (hx : x ∈ markoffLevelSet ℤ k)
    (h : k < 0 ∨ (5 ≤ k ∧ 3 ≤ |x 0| ∧ 3 ≤ |x 1|)) :
    0 < 2 * (k - 5) + (x 0 ^ 2 - 4) * (x 1 ^ 2 - 4) := by sorry

end Delta

/-! ## Levels, class numbers and fundamental sets (`CA.4/markoff-level-classification`,
`CA.4/markoff-class-number`, `CA.4/markoff-delta-zero-level` and the descent nodes) -/

section Levels

/-- Admissible levels: `k ≢ 3 (mod 4)` and `k ≢ ±3 (mod 9)`. -/
def MarkoffAdmissible (k : ℤ) : Prop := k % 4 ≠ 3 ∧ k % 9 ≠ 3 ∧ k % 9 ≠ 6

instance MarkoffAdmissible.decidable (k : ℤ) : Decidable (MarkoffAdmissible k) := by
  unfold MarkoffAdmissible; infer_instance

/-- Exceptional levels: an integral point with a coordinate of absolute value at most 2. -/
def MarkoffExceptional (k : ℤ) : Prop := ∃ x ∈ markoffLevelSet ℤ k, ∃ i, |x i| ≤ 2

/-- Generic levels. -/
def MarkoffGeneric (k : ℤ) : Prop := MarkoffAdmissible k ∧ ¬ MarkoffExceptional k

/-- Hasse failures: admissible levels with no integral point. -/
def MarkoffHasseFailure (k : ℤ) : Prop := MarkoffAdmissible k ∧ markoffLevelSet ℤ k = ∅

theorem markoffExceptional_iff (k : ℤ) :
    MarkoffExceptional k ↔ (∃ u v : ℤ, k = u ^ 2 + v ^ 2) ∨
      (∃ u v : ℤ, 4 * (k - 1) = u ^ 2 + 3 * v ^ 2) ∨ (∃ u : ℤ, k - 4 = u ^ 2) := by sorry

theorem MarkoffExceptional.not_hasseFailure {k : ℤ} (h : MarkoffExceptional k) :
    ¬ MarkoffHasseFailure k := by sorry

theorem markoffGeneric_of_neg {k : ℤ} (hk : k < 0) (ha : MarkoffAdmissible k) :
    MarkoffGeneric k := by sorry

example : MarkoffGeneric 46 := by sorry -- markoffGeneric_forty_six

example : MarkoffExceptional 5 := ⟨![0, 1, 2], by sorry, 0, by sorry⟩ -- markoffExceptional_five

example : ¬ MarkoffAdmissible 3 ∧ ¬ MarkoffAdmissible 6 := by
  unfold MarkoffAdmissible; decide -- not_markoffAdmissible_three_six

example : MarkoffGeneric (-4) := by sorry -- markoffGeneric_neg_four

example : MarkoffExceptional 13 := by sorry -- markoffExceptional_thirteen

example : MarkoffExceptional 14 ∧ (4 : ℤ) * (14 - 1) = 2 ^ 2 + 3 * 4 ^ 2 ∧
    (![1, 3, 4] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 14 := by sorry -- markoffExceptional_iff_fourteen

/-- The group `Γ = Γ_{3,1}(ℤ)` acting on `ℤ³`. -/
abbrev markoffGamma : Subgroup (Equiv.Perm (Fin 3 → ℤ)) := markoffHurwitzGroup 3 (1 : ℤ)

/-- The Γ-orbits of points of `V_k(ℤ)`. -/
def markoffOrbits (k : ℤ) : Set (MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ)) :=
  (fun x => (Quotient.mk'' x : MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ))) ''
    markoffLevelSet ℤ k

/-- The class number `h_M(k)` (zero for the infinite orbit set at `k = 4`, by convention). -/
noncomputable def markoffClassNumber (k : ℤ) : ℕ := Nat.card (markoffOrbits k)

/-- `F⁺_k(ℤ) = {3 ≤ u₁ ≤ u₂ ≤ u₃, u₁² + u₂² + u₃² + u₁u₂u₃ = k}`. -/
def markoffFundamentalPlus (k : ℤ) : Set (Fin 3 → ℤ) :=
  {u | 3 ≤ u 0 ∧ u 0 ≤ u 1 ∧ u 1 ≤ u 2 ∧ u 0 ^ 2 + u 1 ^ 2 + u 2 ^ 2 + u 0 * u 1 * u 2 = k}

/-- `F⁻_k(ℤ) = {3 ≤ u₁ ≤ u₂ ≤ u₃ ≤ u₁u₂/2, M(u) = k}`. -/
def markoffFundamentalMinus (k : ℤ) : Set (Fin 3 → ℤ) :=
  {u | 3 ≤ u 0 ∧ u 0 ≤ u 1 ∧ u 1 ≤ u 2 ∧ 2 * u 2 ≤ u 0 * u 1 ∧ markoffPoly u = k}

theorem markoffFundamentalPlus_finite (k : ℤ) : (markoffFundamentalPlus k).Finite := by sorry

theorem markoffFundamentalMinus_finite (k : ℤ) : (markoffFundamentalMinus k).Finite := by sorry

theorem markoffFundamentalPlus_eq_empty_of_lt {k : ℤ} (hk : k < 54) :
    markoffFundamentalPlus k = ∅ := by sorry

theorem markoffClassNumber_eq_zero_iff {k : ℤ} (hk : k ≠ 4) :
    markoffClassNumber k = 0 ↔ markoffLevelSet ℤ k = ∅ := by sorry

/-- Narrow equivalence: related by a permutation and a double sign change. -/
def MarkoffNarrowEquiv (x y : Fin 3 → ℤ) : Prop := ∃ g ∈ markoffHurwitzNarrowGroup 3 ℤ, g x = y

/-- CA.4/markoff-delta-zero-level: on `V₀(ℤ)`, Δ is negative exactly at the narrow class of
`(3, 3, 3)`, and nonnegative elsewhere. -/
theorem markoffDelta_zero_level_neg_iff {x : Fin 3 → ℤ} (hx : x ∈ markoffLevelSet ℤ 0) :
    markoffDelta x < 0 ↔ MarkoffNarrowEquiv ![3, 3, 3] x := by sorry

example : markoffClassNumber 0 = 2 := by sorry -- markoffClassNumber_zero

example : markoffFundamentalPlus 54 = {![3, 3, 3]} := by sorry -- markoffFundamentalPlus_fifty_four

example : Nat.card (markoffFundamentalPlus 3685) = 6 := by
  sorry -- card_markoffFundamentalPlus_3685

example : Nat.card (markoffFundamentalMinus (-3691)) = 9 := by
  sorry -- card_markoffFundamentalMinus_neg_3691

example : markoffFundamentalPlus 5 = ∅ ∧ (![0, 1, 2] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 5 ∧
    markoffClassNumber 5 ≠ Nat.card (markoffFundamentalPlus 5) := by
  sorry -- markoffFundamentalPlus_five

example : markoffClassNumber 3 = 0 := by sorry -- markoffClassNumber_three

/-- CA.4/markoff-descent-positive-level (a): the descent inequality, for every `k ≥ 1`. -/
theorem markoff_descent_inequality {k : ℤ} (hk : 1 ≤ k) {x : Fin 3 → ℤ}
    (hx : x ∈ markoffLevelSet ℤ k) (h0 : 3 ≤ x 0) (h1 : x 0 ≤ x 1) (h2 : x 1 ≤ x 2) :
    x 0 * x 1 - x 2 < x 1 := by sorry

/-- CA.4/markoff-descent-positive-level (b): Ghosh–Sarnak, Lemma 2.1, with the small-coordinate
branch kept explicit. -/
theorem markoff_descent_positive_level {k : ℤ} (hk : 5 ≤ k) {x : Fin 3 → ℤ}
    (hx : x ∈ markoffLevelSet ℤ k) :
    ∃ g ∈ markoffGamma, (∃ i, |g x i| ≤ 2) ∨
      ∃ u ∈ markoffFundamentalPlus k, g x = ![-u 0, u 1, u 2] := by sorry

/-- CA.4/markoff-levels-one-to-three: `V₃(ℤ) = ∅`, `V₂(ℤ)` and `V₁(ℤ)` are single finite orbits. -/
theorem markoff_levels_one_to_three :
    markoffLevelSet ℤ 3 = ∅ ∧
    (markoffLevelSet ℤ 2).ncard = 16 ∧ markoffOrbits 2 = {Quotient.mk'' ![0, 1, 1]} ∧
    (markoffLevelSet ℤ 1).ncard = 6 ∧ markoffOrbits 1 = {Quotient.mk'' ![0, 0, 1]} := by sorry

/-- CA.4/markoff-descent-negative-level: Ghosh–Sarnak, Lemma 2.2. -/
theorem markoff_descent_negative_level {k : ℤ} (hk : k < 0) {x : Fin 3 → ℤ}
    (hx : x ∈ markoffLevelSet ℤ k) :
    (∀ i, 3 ≤ |x i|) ∧ (∃ g ∈ markoffGamma, g x ∈ markoffFundamentalMinus k) ∧
    ∀ u ∈ markoffFundamentalMinus k, (u 1 : ℝ) ≤ Real.sqrt (|k| + 9) ∧
      2 * u 2 ≤ |k| + 9 := by sorry

/-- CA.4/markoff-fundamental-sets (i): Ghosh–Sarnak, Theorem 1.1, for non-exceptional `k ≥ 5`. -/
theorem markoff_fundamental_sets_pos {k : ℤ} (hk : 5 ≤ k) (hgen : ¬ MarkoffExceptional k) :
    Set.BijOn (fun u : Fin 3 → ℤ =>
        (Quotient.mk'' ![-u 0, u 1, u 2] : MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ)))
      (markoffFundamentalPlus k) (markoffOrbits k) := by sorry

/-- CA.4/markoff-fundamental-sets (ii): Ghosh–Sarnak, Theorem 1.1, for `k < 0`. -/
theorem markoff_fundamental_sets_neg {k : ℤ} (hk : k < 0) :
    Set.BijOn (fun u : Fin 3 → ℤ =>
        (Quotient.mk'' u : MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ)))
      (markoffFundamentalMinus k) (markoffOrbits k) := by sorry

/-- CA.4/markoff-class-number-finite. -/
theorem markoffOrbits_finite {k : ℤ} (hk : k ≠ 4) : (markoffOrbits k).Finite := by sorry

/-- CA.4/markoff-cayley-cubic-orbits: one orbit for each `(2, a, a)`, `a ≥ 0`. -/
theorem markoff_cayley_cubic_orbits :
    Set.BijOn (fun a : ℕ =>
        (Quotient.mk'' ![2, (a : ℤ), a] : MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ)))
      Set.univ (markoffOrbits 4) := by sorry

/-- CA.4/markoff-first-hasse-failures (a): 46 is the smallest positive Hasse failure. -/
theorem markoff_first_positive_hasse_failure :
    MarkoffHasseFailure 46 ∧ ∀ k, 0 ≤ k → k < 46 → ¬ MarkoffHasseFailure k := by sorry

/-- CA.4/markoff-first-hasse-failures (b). -/
theorem markoff_first_negative_hasse_failure :
    markoffClassNumber (-2) = 1 ∧ markoffOrbits (-2) = {Quotient.mk'' ![3, 3, 4]} ∧
      MarkoffHasseFailure (-4) ∧ ∀ k, -4 < k → k < 0 → ¬ MarkoffHasseFailure k := by sorry

/-- CA.4/markoff-class-number-upper-bound (a): the trivial bounds. -/
theorem card_markoffFundamentalPlus_le {k : ℤ} (hk : 5 ≤ k) :
    ((markoffFundamentalPlus k).ncard : ℝ) ≤ 2 * (k : ℝ) ^ ((2 : ℝ) / 3) := by sorry

theorem card_markoffFundamentalMinus_le {k : ℤ} (hk : k < 0) :
    ((markoffFundamentalMinus k).ncard : ℤ) ≤ 2 * (|k| + 9) := by sorry

/-- CA.4/markoff-class-number-upper-bound (b), at non-exceptional levels. Its input, the
unit-class count for `X² − (a² − 4)Y² = 4N`, is a recorded gap. -/
theorem markoffClassNumber_isBigO (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ k : ℤ, ((5 ≤ k ∧ ¬ MarkoffExceptional k) ∨ k < 0) →
      (markoffClassNumber k : ℝ) ≤ C * |(k : ℝ)| ^ ((1 : ℝ) / 3 + ε) := by sorry

end Levels

/-! ## Parametric solutions (`CA.4/markoff-parametric-degree-descent`, `-families`) -/

section Parametric

open Polynomial

/-- The Markoff-type polynomial `M*` of Ghosh–Sarnak (5.1), with `ε = ±1`. -/
noncomputable def markoffStarPoly (α β : Fin 3 → ℤ) (ε : ℤˣ) (x : Fin 3 → ℤ[X]) : ℤ[X] :=
  ∑ j, C (α j) * x j + (C (β 0) * x 1 * x 2 + C (β 1) * x 0 * x 2 + C (β 2) * x 0 * x 1) +
    x 0 ^ 2 + x 1 ^ 2 + C ((ε : ℤ)) * x 2 ^ 2 - x 0 * x 1 * x 2

/-- CA.4/markoff-parametric-degree-descent: Ghosh–Sarnak, Lemma 5.1. -/
theorem markoff_parametric_degree_descent (α β : Fin 3 → ℤ) (ε : ℤˣ) (k : ℤ) (P : Fin 3 → ℤ[X])
    (hP : ∀ j, 0 < (P j).natDegree) (h : markoffStarPoly α β ε P = C k) :
    ∃ Q : Fin 3 → ℤ[X], markoffStarPoly α β ε Q = C k ∧
      ∃ j, (Q j).natDegree = 0 ∧ ∀ i, i ≠ j → 0 < (Q i).natDegree := by sorry

/-- CA.4/markoff-parametric-degree-descent: no parametric solution has exactly two constant
coordinates. -/
theorem markoff_parametric_two_constants (α β : Fin 3 → ℤ) (ε : ℤˣ) (k : ℤ) (P : Fin 3 → ℤ[X])
    (j : Fin 3) (hj : 0 < (P j).natDegree) (hc : ∀ i, i ≠ j → (P i).natDegree = 0) :
    markoffStarPoly α β ε P ≠ C k := by sorry

/-- CA.4/markoff-parametric-families (1). -/
theorem markoff_parametric_families (k : ℤ) :
    (∃ P : Fin 3 → ℤ[X], (∃ j, 0 < (P j).natDegree) ∧
      ∀ t : ℤ, (fun j => (P j).eval t) ∈ markoffLevelSet ℤ k) ↔ IsSquare (k - 4) := by sorry

/-- CA.4/markoff-parametric-families (2): the companion surface `x₁² + x₂² − x₃² − x₁x₂x₃ = k`. -/
theorem markoff_companion_parametric_families (k : ℤ) :
    (∃ P : Fin 3 → ℤ[X], (∃ j, 0 < (P j).natDegree) ∧ ∀ t : ℤ,
      (P 0).eval t ^ 2 + (P 1).eval t ^ 2 - (P 2).eval t ^ 2 -
        (P 0).eval t * (P 1).eval t * (P 2).eval t = k) ↔ IsSquare (k + 4) ∨ k = 0 := by sorry

end Parametric

/-! ## Certified enumeration (`CA.4/markoff-class-number-enumeration`) -/

section Enumeration

/-- Search for `F⁺_k` (`k ≥ 5`) or `F⁻_k` (`k < 0`) in the explicit boxes. -/
def markoffFundamentalSearch (k : ℤ) : Finset (Fin 3 → ℤ) :=
  if 5 ≤ k then
    ((Finset.Icc (3 : ℤ) (Int.sqrt k + 1)) ×ˢ (Finset.Icc (3 : ℤ) (Int.sqrt k + 1))).biUnion
      (fun p => ((Finset.Icc p.2 (k + 1)).filter fun c =>
        3 ≤ p.1 ∧ p.1 ≤ p.2 ∧ p.1 ^ 2 + p.2 ^ 2 + c ^ 2 + p.1 * p.2 * c = k).image
          fun c => ![p.1, p.2, c])
  else if k < 0 then
    ((Finset.Icc (3 : ℤ) (Int.sqrt (|k| + 9))) ×ˢ (Finset.Icc (3 : ℤ) (Int.sqrt (|k| + 9)))).biUnion
      (fun p => ((Finset.Icc p.2 (p.1 * p.2)).filter fun c =>
        p.1 ≤ p.2 ∧ 2 * c ≤ p.1 * p.2 ∧ p.1 ^ 2 + p.2 ^ 2 + c ^ 2 - p.1 * p.2 * c = k).image
          fun c => ![p.1, p.2, c])
  else ∅

/-- Bounded search for the three binary equations of `markoffExceptional_iff`. -/
def markoffExceptionalTest (k : ℤ) : Bool :=
  let B := Int.sqrt (4 * |k| + 4) + 2
  decide (∃ u ∈ Finset.Icc (-B) B, ∃ v ∈ Finset.Icc (-B) B,
    k = u ^ 2 + v ^ 2 ∨ 4 * (k - 1) = u ^ 2 + 3 * v ^ 2 ∨ k - 4 = u ^ 2)

theorem markoffFundamentalSearch_eq_plus {k : ℤ} (hk : 5 ≤ k) :
    (↑(markoffFundamentalSearch k) : Set (Fin 3 → ℤ)) = markoffFundamentalPlus k := by sorry

theorem markoffFundamentalSearch_eq_minus {k : ℤ} (hk : k < 0) :
    (↑(markoffFundamentalSearch k) : Set (Fin 3 → ℤ)) = markoffFundamentalMinus k := by sorry

theorem markoffExceptionalTest_iff (k : ℤ) :
    markoffExceptionalTest k = true ↔ MarkoffExceptional k := by sorry

theorem markoffHasseFailure_iff_search {k : ℤ} (hk : 5 ≤ k ∨ k < 0) :
    MarkoffHasseFailure k ↔ MarkoffAdmissible k ∧ markoffExceptionalTest k = false ∧
      markoffFundamentalSearch k = ∅ := by sorry

theorem markoffClassNumber_eq_card_search {k : ℤ} (hk : 5 ≤ k ∨ k < 0)
    (hgen : ¬ MarkoffExceptional k) :
    markoffClassNumber k = (markoffFundamentalSearch k).card := by sorry

example : (markoffFundamentalSearch 3685).card = 6 := by sorry -- markoffFundamentalSearch_3685

example : (markoffFundamentalSearch (-3691)).card = 9 := by
  sorry -- markoffFundamentalSearch_neg_3691

example : markoffFundamentalSearch 46 = ∅ ∧ markoffExceptionalTest 46 = false := by
  sorry -- markoffFundamentalSearch_forty_six

example : markoffFundamentalSearch 5 = ∅ ∧ markoffExceptionalTest 5 = true := by
  sorry -- markoffFundamentalSearch_five

example (k : ℤ) (h₁ : 5 ≤ k) (h₂ : k < 54) : markoffFundamentalSearch k = ∅ := by
  sorry -- markoffFundamentalSearch_lt

example : (markoffFundamentalSearch 9454).card = 11 ∧ ![3, 7, 87] ∈ markoffFundamentalSearch 9454 ∧
    ![17, 17, 28] ∈ markoffFundamentalSearch 9454 := by sorry -- markoffFundamentalSearch_9454

end Enumeration

/-! ## Typed signatures for the first-pass Markoff comparison nodes -/

section FirstPassSignatures

/-- CA.4/markoff-coefficient-one-zero-orbits (first pass): every integral point of `X` is
divisible by 3, `ξ` is a bijection on integral points, and `V₀(ℤ)` has the two orbits of `0`
and `(3, 3, 3)`. -/
theorem markoff_coefficient_one_zero_orbits :
    (∀ x ∈ markoffTraceSurface ℤ, ∀ i, (3 : ℤ) ∣ x i) ∧
    markoffOrbits 0 = {Quotient.mk'' 0, Quotient.mk'' ![3, 3, 3]} := by sorry

/-- CA.4/markoff-positive-root-orbits (first pass): for every `k ≥ 5` the map from `F⁺_k(ℤ)`
to orbits is injective, and its orbits consist of points with all coordinates of absolute value
at least 3. -/
theorem markoff_positive_root_orbits {k : ℤ} (hk : 5 ≤ k) :
    Set.InjOn (fun u : Fin 3 → ℤ =>
        (Quotient.mk'' ![-u 0, u 1, u 2] : MulAction.orbitRel.Quotient markoffGamma (Fin 3 → ℤ)))
      (markoffFundamentalPlus k) ∧
    ∀ u ∈ markoffFundamentalPlus k, ∀ g ∈ markoffGamma, ∀ i, 3 ≤ |g ![-u 0, u 1, u 2] i| := by sorry

/-- CA.4/markoff-exceptional-class-number-lower-bound (first pass). -/
theorem markoff_exceptional_class_number_lower_bound {k : ℤ} (hk : 5 ≤ k)
    (hexc : MarkoffExceptional k) :
    (markoffFundamentalPlus k).ncard + 1 ≤ markoffClassNumber k := by sorry

end FirstPassSignatures

/-! ## Local points and local solubility -/

section Local

/-- CA.4/markoff-explicit-local-points: Ghosh–Sarnak, Corollary 6.3, over any ring in which
2 and 3 are units. -/
theorem markoff_explicit_local_point {R : Type*} [CommRing R] (h2 : IsUnit (2 : R))
    (h3 : IsUnit (3 : R)) (k : R) :
    let e : R := 2
    let f : R := ((h2.unit⁻¹ : Rˣ) : R)
    let c : R := ((((h3.unit * h2.unit⁻¹ : Rˣ) ^ 2)⁻¹ : Rˣ) : R)
    (![2 - (k - 4) * c, e + f, e - f + f * (2 - (k - 4) * c)] : Fin 3 → R) ∈ markoffLevelSet R k := by
  sorry

theorem markoffLevelSet_zmod_nonempty {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p) (n : ℕ) (k : ℤ) :
    (markoffLevelSet (ZMod (p ^ n)) (k : ZMod (p ^ n))).Nonempty := by sorry

end Local

/-! ### `CA.4/quadratic-gauss-sum-normalisation` and `CA.4/markoff-type-point-count-mod-p` -/

section GaussSums

variable (p : ℕ) [Fact p.Prime]

/-- The quadratic character of `𝔽_p` with complex values. -/
noncomputable def quadraticCharC : MulChar (ZMod p) ℂ :=
  (quadraticChar (ZMod p)).ringHomComp (Int.castRingHom ℂ)

/-- `S_p(a) = Σ_u e_p(a u²)`. -/
noncomputable def quadraticExpSum (a : ZMod p) : ℂ :=
  ∑ u : ZMod p, ZMod.stdAddChar (a * u ^ 2)

theorem quadraticExpSum_zero : quadraticExpSum p 0 = p := by sorry

theorem quadraticExpSum_eq_char_mul (hp : p ≠ 2) {a : ZMod p} (ha : a ≠ 0) :
    quadraticExpSum p a = quadraticCharC p a * quadraticExpSum p 1 := by sorry

theorem quadraticExpSum_one_eq_gaussSum (hp : p ≠ 2) :
    quadraticExpSum p 1 = gaussSum (quadraticCharC p) ZMod.stdAddChar := by sorry

theorem quadraticExpSum_one_sq (hp : p ≠ 2) :
    quadraticExpSum p 1 ^ 2 = quadraticCharC p (-1) * p := by sorry

theorem sum_char_mul_stdAddChar (hp : p ≠ 2) (b : ZMod p) :
    ∑ a : ZMod p, quadraticCharC p a * ZMod.stdAddChar (a * b) =
      quadraticCharC p b * quadraticExpSum p 1 := by sorry

theorem sum_quadraticChar_sub_sq (hp : p ≠ 2) {c : ZMod p} (hc : c ≠ 0) :
    ∑ x : ZMod p, quadraticChar (ZMod p) (c - x ^ 2) = -quadraticChar (ZMod p) (-1) := by sorry

example : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    quadraticExpSum 3 1 ^ 2 = -3 := by sorry -- quadraticExpSum_three_sq

example : haveI : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
    quadraticExpSum 5 2 = -quadraticExpSum 5 1 := by sorry -- quadraticExpSum_five_two

example (hp : p ≠ 2) : quadraticExpSum p 0 = p := by sorry -- quadraticExpSum_zero_eq

example : haveI : Fact (Nat.Prime 7) := ⟨by decide⟩
    quadraticExpSum 7 1 = gaussSum (quadraticCharC 7) ZMod.stdAddChar ∧
      quadraticExpSum 7 1 ^ 2 = -7 := by sorry -- quadraticExpSum_one_eq_gaussSum_seven

example (hp : p ≠ 2) :
    ∑ x : ZMod p, quadraticChar (ZMod p) (-x ^ 2) = (p - 1) * quadraticChar (ZMod p) (-1) := by
  sorry -- sum_quadraticChar_sub_sq_zero

/-- CA.4/markoff-type-point-count-mod-p: Ghosh–Sarnak, Lemma 6.4. -/
theorem markoff_type_point_count (hp : p ≠ 2) (α β : ZMod p) :
    (Nat.card {x : Fin 3 → ZMod p // x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 - α * x 0 * x 1 * x 2 = β} : ℤ) =
      if α = 0 then (p : ℤ) ^ 2 + p * quadraticChar (ZMod p) (-β)
      else (p : ℤ) ^ 2 + 1 + p * quadraticChar (ZMod p) (α ^ 2 * β - 4) *
        (3 + quadraticChar (ZMod p) β) := by sorry

theorem card_markoffTraceSurfaceNonzero (hp : p ≠ 2) :
    (Nat.card (markoffTraceSurfaceNonzero (ZMod p)) : ℤ) =
      (p : ℤ) ^ 2 + 3 * p * quadraticChar (ZMod p) (-1) := by sorry

end GaussSums

section LocalSolubility

/-- CA.4/markoff-local-solubility: Ghosh–Sarnak, Proposition 6.1, with the corrected lifts at
`p = 2, 3`. -/
theorem markoff_local_solubility (k : ℤ) :
    (∀ (p : ℕ) [Fact p.Prime], (markoffLevelSet ℤ_[p] (k : ℤ_[p])).Nonempty) ↔
      MarkoffAdmissible k := by sorry

theorem markoff_local_solubility_mod (k : ℤ) :
    (∀ m : ℕ, 0 < m → (markoffLevelSet (ZMod m) (k : ZMod m)).Nonempty) ↔ MarkoffAdmissible k := by
  sorry

theorem markoff_padic_nonempty_of_five_le {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p) (k : ℤ) :
    (markoffLevelSet ℤ_[p] (k : ℤ_[p])).Nonempty := by sorry

end LocalSolubility

/-! ## Hasse failures (`CA.4/markoff-reciprocity-obstruction`, `-hasse-failures-*`) -/

section HasseFailures

/-- CA.4/markoff-reciprocity-obstruction, prime-factor form. -/
theorem markoff_reciprocity_obstruction {d : ℤ} (hd : d ≠ 0) {x : Fin 3 → ℤ}
    (hx : x ∈ markoffLevelSet ℤ (4 + d)) {q : ℕ} [Fact q.Prime] (hq2 : q ≠ 2)
    (hqd : ¬ (q : ℤ) ∣ d) (hqx : (q : ℤ) ∣ x 0 ^ 2 - 4) :
    legendreSym q d = 1 := by sorry

/-- CA.4/markoff-hasse-failures-two-nu-squared (i). -/
theorem markoff_hasse_failure_neg_family {ν : ℕ} (hν : 3 ≤ ν) (hodd : Odd ν)
    (hprime : ∀ q ∈ ν.primeFactors, q % 8 = 1 ∨ q % 8 = 3) :
    MarkoffHasseFailure (4 - 2 * (ν : ℤ) ^ 2) := by sorry

/-- CA.4/markoff-hasse-failures-two-nu-squared (ii). -/
theorem markoff_hasse_failure_pos_family {ν : ℕ} (hν : 1 ≤ ν)
    (hprime : ∀ q ∈ ν.primeFactors, q % 8 = 1 ∨ q % 8 = 7) (h9 : ν % 9 = 4 ∨ ν % 9 = 5) :
    MarkoffHasseFailure (4 + 2 * (ν : ℤ) ^ 2) := by sorry

/-- CA.4/markoff-hasse-failures-prime-family: Proposition 8.1 (iii). -/
theorem markoff_hasse_failure_prime_family {ℓ : ℕ} (hℓ : ℓ.Prime) (h13 : 13 ≤ ℓ)
    (h9 : ℓ % 9 = 4 ∨ ℓ % 9 = 5) :
    MarkoffGeneric (4 + 2 * (ℓ : ℤ) ^ 2) ∧ MarkoffHasseFailure (4 + 2 * (ℓ : ℤ) ^ 2) := by sorry

/-- CA.4/markoff-hasse-failures-twelve-nu-squared: Proposition 8.2. -/
theorem markoff_hasse_failure_twelve {ν : ℕ} (h32 : ν ^ 2 % 32 = 25)
    (hprime : ∀ q ∈ ν.primeFactors, q % 12 = 1 ∨ q % 12 = 11) :
    MarkoffHasseFailure (4 + 12 * (ν : ℤ) ^ 2) := by sorry

/-- CA.4/markoff-hasse-failures-twenty-nu-squared: Proposition 8.3. -/
theorem markoff_hasse_failure_twenty {ν : ℕ} (h9 : ν % 9 = 4 ∨ ν % 9 = 5)
    (hprime : ∀ q ∈ ν.primeFactors, q % 20 = 1 ∨ q % 20 = 19) :
    MarkoffHasseFailure (4 + 20 * (ν : ℤ) ^ 2) := by sorry

example : MarkoffHasseFailure 342 ∧ MarkoffHasseFailure 1456 ∧ MarkoffHasseFailure 33624 ∧
    MarkoffHasseFailure (-14) := by sorry

/-- CA.4/markoff-infinitely-many-hasse-failures. -/
theorem markoff_infinitely_many_hasse_failures :
    {k : ℤ | 0 < k ∧ MarkoffHasseFailure k}.Infinite ∧
      {k : ℤ | k < 0 ∧ MarkoffHasseFailure k}.Infinite := by sorry

open Classical in
/-- CA.4/markoff-hasse-failure-count-lower-bound: its analytic input (the Landau–Wirsing count)
is a recorded gap. -/
theorem markoff_hasse_failure_count_lower_bound :
    ∃ c > (0 : ℝ), ∀ᶠ K : ℕ in Filter.atTop,
      c * Real.sqrt K / Real.sqrt (Real.log K) ≤
        (((Finset.Icc (1 : ℤ) K).filter fun k => MarkoffHasseFailure k).card : ℝ) ∧
      c * Real.sqrt K / Real.sqrt (Real.log K) ≤
        (((Finset.Icc (-(K : ℤ)) (-1)).filter fun k => MarkoffHasseFailure k).card : ℝ) := by
  sorry

end HasseFailures

/-! ## Exceptional Markoff–Hurwitz tuples and the descent (Gamburd–Magee–Ronan;
`CA.4/markoff-hurwitz-exceptional`, `-signed-to-positive`, `-moves-outside-compact`,
`-infinite-descent`) -/

section HurwitzDescent

/-- Fundamental exceptional points (Gamburd–Magee–Ronan, Definition 15), stated on the sorted
tuple `List.mergeSort` of the coordinates: for `a = 1`, `n − 3` ones followed by a `2`; for
`a = 2`, `n − 2` ones. -/
def MarkoffHurwitzFundamentalExceptional (n : ℕ) (a k : ℤ) (x : Fin n → ℤ) : Prop :=
  x ∈ markoffHurwitzPositive n a k ∧
    let s := (List.ofFn x).mergeSort (fun u v => decide (u ≤ v))
    (a = 1 ∧ s.take (n - 2) = List.replicate (n - 3) 1 ++ [2]) ∨
      (a = 2 ∧ s.take (n - 2) = List.replicate (n - 2) 1)

/-- The exceptional set `E`: the Γ-orbits of the fundamental exceptional points. -/
def markoffHurwitzExceptional (n : ℕ) (a k : ℤ) : Set (Fin n → ℤ) :=
  {x | ∃ y, MarkoffHurwitzFundamentalExceptional n a k y ∧ ∃ g ∈ markoffHurwitzGroup n a, g y = x}

theorem markoffHurwitzExceptional_smul {n : ℕ} {a k : ℤ} {g : Equiv.Perm (Fin n → ℤ)}
    (hg : g ∈ markoffHurwitzGroup n a) (x : Fin n → ℤ) :
    g x ∈ markoffHurwitzExceptional n a k ↔ x ∈ markoffHurwitzExceptional n a k := by sorry

theorem markoffHurwitzFundamentalExceptional_iff_one {n : ℕ} (hn : 3 ≤ n) {k : ℤ}
    (x : Fin n → ℤ) (hsort : Monotone x) (hpos : ∀ i, 0 < x i)
    (hone : ∀ i : Fin n, (i : ℕ) < n - 3 → x i = 1) (htwo : x ⟨n - 3, by omega⟩ = 2) :
    x ∈ markoffHurwitzSet n 1 k ↔
      (x ⟨n - 2, by omega⟩ - x ⟨n - 1, by omega⟩) ^ 2 = k - n - 1 := by sorry

theorem markoffHurwitzFundamentalExceptional_iff_two {n : ℕ} (hn : 3 ≤ n) {k : ℤ}
    (x : Fin n → ℤ) (hsort : Monotone x) (hpos : ∀ i, 0 < x i)
    (hone : ∀ i : Fin n, (i : ℕ) < n - 2 → x i = 1) :
    x ∈ markoffHurwitzSet n 2 k ↔
      (x ⟨n - 2, by omega⟩ - x ⟨n - 1, by omega⟩) ^ 2 = k - n + 2 := by sorry

theorem markoffHurwitzExceptional_nonempty_iff {n : ℕ} (hn : 3 ≤ n) {a k : ℤ} (ha : 1 ≤ a) :
    (markoffHurwitzExceptional n a k).Nonempty ↔
      (a = 1 ∧ IsSquare (k - n - 1)) ∨ (a = 2 ∧ IsSquare (k - n + 2)) := by sorry

theorem markoffHurwitzExceptional_eq_empty_of_three_le {n : ℕ} {a k : ℤ} (ha : 3 ≤ a) :
    markoffHurwitzExceptional n a k = ∅ := by sorry

example : MarkoffHurwitzFundamentalExceptional 3 1 8 ![2, 3, 5] := by
  sorry -- markoffHurwitzFundamentalExceptional_eight

example : markoffHurwitzExceptional 3 1 14 = ∅ ∧ (![1, 3, 4] : Fin 3 → ℤ) ∈ markoffLevelSet ℤ 14 := by
  sorry -- markoffHurwitzExceptional_fourteen

example : markoffHurwitzExceptional 3 3 0 = ∅ := by sorry -- markoffHurwitzExceptional_markoff

example : MarkoffHurwitzFundamentalExceptional 4 2 2 ![1, 1, 5, 5] := by
  sorry -- markoffHurwitzFundamentalExceptional_four_two

example (k : ℤ) (h : (markoffHurwitzExceptional 3 1 k).Nonempty) :
    MarkoffExceptional k ∧ IsSquare (k - 4) := by sorry -- markoffHurwitzExceptional_compat_gs

/-- CA.4/markoff-hurwitz-signed-to-positive: the bounded error in passing to positive tuples. -/
theorem markoff_hurwitz_signed_to_positive {n : ℕ} (hn : 3 ≤ n) {a : ℤ} (ha : 1 ≤ a) (k : ℤ) :
    ∃ C : ℕ, ∀ R : ℕ,
      ({x | x ∈ markoffHurwitzSet n a k ∧ x ∉ markoffHurwitzExceptional n a k ∧
          ∀ i, |x i| ≤ R} : Set (Fin n → ℤ)).ncard ≤
        2 ^ (n - 1) * ({x | x ∈ markoffHurwitzPositive n a k ∧
          x ∉ markoffHurwitzExceptional n a k ∧ ∀ i, x i ≤ R} : Set (Fin n → ℤ)).ncard + C ∧
      2 ^ (n - 1) * ({x | x ∈ markoffHurwitzPositive n a k ∧
          x ∉ markoffHurwitzExceptional n a k ∧ ∀ i, x i ≤ R} : Set (Fin n → ℤ)).ncard ≤
        ({x | x ∈ markoffHurwitzSet n a k ∧ x ∉ markoffHurwitzExceptional n a k ∧
          ∀ i, |x i| ≤ R} : Set (Fin n → ℤ)).ncard := by sorry

/-- CA.4/markoff-hurwitz-moves-outside-compact: Gamburd–Magee–Ronan, Proposition 16, parts (1),
(2), (3) and (5) (part (3) only outside the ball). -/
theorem markoff_hurwitz_moves_outside_compact {n : ℕ} (hn : 3 ≤ n) {a : ℤ} (ha : 1 ≤ a) (k : ℤ) :
    ∃ R₀ : ℕ, ∀ x ∈ markoffHurwitzPositive n a k, x ∉ markoffHurwitzExceptional n a k →
      (∃ i, R₀ < x i) →
      ∃ j, (∀ i, i ≠ j → x i < x j) ∧ (∀ i, markoffHurwitzMove a j x i < x j) ∧
        (∀ i, i ≠ j → ∀ l, l ≠ i → markoffHurwitzMove a i x l < markoffHurwitzMove a i x i) ∧
        ∀ i, markoffHurwitzMove a i x ∈ markoffHurwitzPositive n a k := by sorry

/-- CA.4/markoff-hurwitz-infinite-descent: Gamburd–Magee–Ronan, Corollary 17. The list can be
taken to consist of moves at the strict maximum, each lowering it (by
`markoff_hurwitz_moves_outside_compact`); the statement records only the outcome. -/
theorem markoff_hurwitz_infinite_descent {n : ℕ} (hn : 3 ≤ n) {a : ℤ} (ha : 1 ≤ a) (k : ℤ) :
    ∃ R₀ : ℕ, ∀ x ∈ markoffHurwitzPositive n a k, x ∉ markoffHurwitzExceptional n a k →
      ∃ l : List (Fin n), (∀ i, l.foldr (fun j y => markoffHurwitzMove a j y) x i ≤ R₀) ∧
        l.foldr (fun j y => markoffHurwitzMove a j y) x ∈ markoffHurwitzPositive n a k := by
  sorry

end HurwitzDescent

/-! ## Negative Pell radicands (`CA.4/negative-pell-radicand-sets`,
`CA.4/negative-pell-rational-solubility`, `CA.4/negative-pell-prime-one-mod-four`) -/

section NegativePell

/-- `𝒟⁻`: squarefree `d > 0` with `x² − dy² = −1` soluble in integers. -/
def negPellRadicands : Set ℕ :=
  {d | 0 < d ∧ Squarefree d ∧ ∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1}

/-- `𝒟`: squarefree `d > 0` all of whose prime factors are `2` or `≡ 1 (mod 4)`. -/
def pellFamily : Set ℕ :=
  {d | 0 < d ∧ Squarefree d ∧ ∀ p, p.Prime → p ∣ d → p % 4 = 1 ∨ p = 2}

/-- `𝒟⁻(X)` for natural `X`. -/
noncomputable def negPellRadicandsBelow (X : ℕ) : Finset ℕ := by
  classical exact (Finset.range X).filter (· ∈ negPellRadicands)

/-- `𝒟(X)` for natural `X`. -/
noncomputable def pellFamilyBelow (X : ℕ) : Finset ℕ := by
  classical exact (Finset.range X).filter (· ∈ pellFamily)

theorem mem_negPellRadicands_iff (d : ℕ) :
    d ∈ negPellRadicands ↔ 0 < d ∧ Squarefree d ∧ (pellNormSet d (-1)).Nonempty := by sorry

theorem negPellRadicands_subset_pellFamily : negPellRadicands ⊆ pellFamily := by sorry

@[simp] theorem one_mem_negPellRadicands : 1 ∈ negPellRadicands := by sorry

example : negPellRadicandsBelow 11 = {1, 2, 5, 10} := by sorry -- negPellRadicandsBelow_eleven

example : 34 ∈ pellFamily ∧ 34 ∉ negPellRadicands := by
  sorry -- thirty_four_mem_pellFamily_not_negPell

example : 1 ∈ negPellRadicands :=
  ⟨by norm_num, squarefree_one, 0, 1, by norm_num⟩ -- one_mem_negPellRadicands_ex

example : 3 ∉ pellFamily ∧ 3 ∉ negPellRadicands := by sorry -- three_not_mem_pellFamily

example : 13 ∈ negPellRadicands ∧ (⟨18, 5⟩ : ℤ√13) ∈ pellNormSet 13 (-1) := by
  sorry -- mem_negPellRadicands_thirteen

/-- CA.4/negative-pell-rational-solubility. -/
theorem negPell_rat_soluble_iff {d : ℕ} (hd : 0 < d) (hsq : Squarefree d) :
    (∃ x y : ℚ, x ^ 2 - d * y ^ 2 = -1) ↔ d ∈ pellFamily := by sorry

theorem negPell_rat_soluble_iff_sum_two_sq {d : ℕ} (hd : 0 < d) (hsq : Squarefree d) :
    (∃ x y : ℚ, x ^ 2 - d * y ^ 2 = -1) ↔ ∃ u v : ℕ, d = u ^ 2 + v ^ 2 := by sorry

example : ((5 : ℚ) / 3) ^ 2 - 34 * (1 / 3) ^ 2 = -1 ∧ 34 ∉ negPellRadicands := by sorry

/-- CA.4/negative-pell-prime-one-mod-four: Dirichlet's theorem. -/
theorem prime_mem_negPellRadicands {p : ℕ} (hp : p.Prime) (h4 : p % 4 = 1) :
    p ∈ negPellRadicands := by sorry

theorem negPellRadicands_infinite : negPellRadicands.Infinite := by sorry

end NegativePell

/-! ## The triple product and its specialisations (`CA.4/jacobi-triple-product`, ...) -/

section TripleProduct

open PowerSeries PowerSeries.WithPiTopology

/-- CA.4/power-series-product-specialisation. -/
theorem coeff_prod_map_eventually_eq {A B ι : Type*} [CommRing A] [CommRing B] (φ : A →+* B)
    (f : ι → PowerSeries A) (g : PowerSeries A)
    (h : ∀ m : ℕ, ∀ᶠ s in Filter.atTop, coeff m (∏ i ∈ s, f i) = coeff m g) (m : ℕ) :
    ∀ᶠ s in Filter.atTop, coeff m (∏ i ∈ s, map φ (f i)) = coeff m (map φ g) := by sorry

theorem hasProd_map_of_coeff_eventually_eq {A B ι : Type*} [CommRing A] [CommRing B]
    [TopologicalSpace B] (φ : A →+* B) (f : ι → PowerSeries A) (g : PowerSeries A)
    (h : ∀ m : ℕ, ∀ᶠ s in Filter.atTop, coeff m (∏ i ∈ s, f i) = coeff m g) :
    HasProd (fun i => map φ (f i)) (map φ g) := by sorry

/-- CA.4/jacobi-triple-product (a), for every Hausdorff topological commutative ring and unit `a`
(the coefficient form, without topology, is `coeff_prod_map_eventually_eq`'s hypothesis). -/
theorem jacobi_triple_product {R : Type*} [CommRing R] [TopologicalSpace R] [T2Space R]
    (a : Rˣ) :
    HasProd (fun n : ℕ => (1 - X ^ (2 * n + 2)) * (1 + C (a : R) * X ^ (2 * n + 1)) *
        (1 + C ((a⁻¹ : Rˣ) : R) * X ^ (2 * n + 1)))
      (∑' n : ℤ, C (((a ^ n : Rˣ)) : R) * X ^ (n.natAbs ^ 2)) ∧
    Summable (fun n : ℤ => C (((a ^ n : Rˣ)) : R) * X ^ (n.natAbs ^ 2) : ℤ → PowerSeries R) := by
  sorry

/-- CA.4/jacobi-triple-product (b): the form with `t^{k(k+1)/2}`. -/
theorem jacobi_triple_product' {R : Type*} [CommRing R] [TopologicalSpace R] [T2Space R]
    (s : Rˣ) :
    HasProd (fun i : ℕ => (1 - X ^ (i + 1)) * (1 + C (s : R) * X ^ (i + 1)) *
        (1 + C ((s⁻¹ : Rˣ) : R) * X ^ i))
      (∑' k : ℤ, C (((s ^ k : Rˣ)) : R) * X ^ ((k * (k + 1) / 2).toNat)) := by sorry

/-- CA.4/jacobi-cube-identity. -/
theorem jacobi_cube_identity {R : Type*} [CommRing R] [TopologicalSpace R] [T2Space R] :
    HasProd (fun n : ℕ => (1 - X ^ (n + 1) : PowerSeries R) ^ 3)
      (∑' n : ℕ, C ((-1 : R) ^ n * (2 * n + 1)) * X ^ (n * (n + 1) / 2)) := by sorry

/-- CA.4/theta-product-specialisations (ii), (iii), (iv) and Euler's identity; (iii) is stated
in the equivalent form ∏(1 + x^{2n})²(1 − x^{2n}) = Σ_{r ≥ 0} x^{r(r+1)}, valid over every ring
(twice it is Σ_{r ∈ ℤ} x^{r² + r}). -/
theorem theta_product_specialisations {R : Type*} [CommRing R] [TopologicalSpace R]
    [T2Space R] :
    HasProd (fun n : ℕ => (1 + X ^ (2 * n + 1) : PowerSeries R) ^ 2 * (1 - X ^ (2 * n + 2)))
        (∑' n : ℤ, X ^ (n.natAbs ^ 2)) ∧
    HasProd (fun n : ℕ => (1 + X ^ (2 * n + 2) : PowerSeries R) ^ 2 * (1 - X ^ (2 * n + 2)))
        (∑' r : ℕ, X ^ (r * (r + 1))) ∧
    (∏' n : ℕ, (1 - X ^ (n + 1) : PowerSeries R)) =
        (∏' n : ℕ, (1 + X ^ (n + 1) : PowerSeries R)) * ∑' n : ℤ, C ((-1 : R) ^ n.natAbs) * X ^ (n.natAbs ^ 2) ∧
    (∏' n : ℕ, (1 + X ^ (n + 1) : PowerSeries R)) * (∏' n : ℕ, (1 - X ^ (2 * n + 1))) = 1 := by
  sorry

/-- CA.4/theta-product-specialisations (iii) in the form with the factor 2 and the sum over ℤ. -/
theorem theta_two_product_int {R : Type*} [CommRing R] [TopologicalSpace R] [T2Space R] :
    (2 : PowerSeries R) * ∏' n : ℕ, (1 + X ^ (2 * n + 2) : PowerSeries R) ^ 2 * (1 - X ^ (2 * n + 2)) =
      ∑' r : ℤ, X ^ ((r * (r + 1)).toNat) := by sorry

end TripleProduct

end TauCeti.ClassicalArithmetic
