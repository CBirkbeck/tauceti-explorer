/-
Suggested Lean file for the roadmap "Diophantine approximation and transcendence"
(`DiophantineApproximationAndTranscendence`), Layer DT.0 continued
(job BP-DiophantineApproximationAndTranscendence--DT.0).

This file is not the roadmap and is not exhaustive: the roadmap document
(`research/blueprint/readmes/DiophantineApproximationAndTranscendence--DT.0.md`) is definitive. The
statements below suggest Lean forms, so that contributors and reviewers converge on names and
signatures. Every API lemma, unit test and named theorem is proved by `sorry`; nothing here is an
implementation claim. It imports only Mathlib (082e2d3): no Tau Ceti declaration at f790474 is used.

The rest of Layer DT.0 is in the base suggested file
`research/blueprint/suggested/DiophantineApproximationAndTranscendence.lean`. One of its definitions,
`BadlyApproximable`, is repeated here verbatim so that this file elaborates on its own. The covering
radius and successive minima of GeometryOfNumbersAndQuadraticArithmetic are not at the pins, so the
covering bound is stated through distances to lattice points.
-/

import Mathlib.Algebra.ContinuedFractions.Computation.Approximations
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Polynomial.MahlerMeasure
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.NumberTheory.DiophantineApproximation.ContinuedFractions
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.NumberTheory.NumberField.House
import Mathlib.NumberTheory.Real.GoldenRatio
import Mathlib.NumberTheory.Transcendental.Liouville.LiouvilleNumber

open NumberField Polynomial

noncomputable section

namespace DiophantineApproximation

/-! ## The covering bound from a polar lattice (DT.0/polar-lattice-covering-bound) -/

section Covering

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- DT.0/polar-lattice-covering-bound, Euclidean form (Evertse, Corollary 2.21, with the constant
`n = finrank ℝ E` coming from GN.4's covering transference `μ(L)·λ₁(L*) ≤ n`). -/
theorem exists_mem_norm_sub_le_of_polar (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {R : ℝ} (hR : 0 < R)
    (hpolar : ∀ y ∈ LinearMap.BilinForm.dualSubmodule (innerₗ E) L, y ≠ 0 → R ≤ ‖y‖) (b : E) :
    ∃ x ∈ L, ‖x - b‖ ≤ Module.finrank ℝ E / R := by
  sorry

/-- DT.0/polar-lattice-covering-bound, coordinate form: `L = Bℤⁿ`, `L* = (Bᵀ)⁻¹ℤⁿ`, and the norm on
`Fin n → ℝ` is the maximum norm. This is the statement the base suggested file imports as
`Imported.exists_lattice_point_near_of_polar_long`, with the constant `n`. -/
theorem exists_lattice_point_near_of_polar_long {n : ℕ} (B : Matrix (Fin n) (Fin n) ℝ)
    (hB : B.det ≠ 0) {R : ℝ} (hR : 0 < R)
    (hpolar : ∀ y : Fin n → ℤ, y ≠ 0 → R ≤ ‖(B.transpose)⁻¹.mulVec (fun i => (y i : ℝ))‖)
    (b : Fin n → ℝ) :
    ∃ z : Fin n → ℤ, ‖B.mulVec (fun i => (z i : ℝ)) - b‖ ≤ n / R := by
  sorry

/-- The existential form used by the base file's proof of Kronecker's theorem follows with
`C = n + 1`. -/
example {n : ℕ} : ∃ C : ℝ, 0 < C ∧ ∀ (B : Matrix (Fin n) (Fin n) ℝ), B.det ≠ 0 → ∀ R : ℝ, 0 < R →
    (∀ y : Fin n → ℤ, y ≠ 0 → R ≤ ‖(B.transpose)⁻¹.mulVec (fun i => (y i : ℝ))‖) →
    ∀ b : Fin n → ℝ, ∃ z : Fin n → ℤ, ‖B.mulVec (fun i => (z i : ℝ)) - b‖ ≤ C / R := by
  refine ⟨n + 1, by positivity, fun B hB R hR hpolar b => ?_⟩
  obtain ⟨z, hz⟩ := exists_lattice_point_near_of_polar_long B hB hR hpolar b
  exact ⟨z, hz.trans (by gcongr; linarith)⟩

/-- Check: `L = ℤ` in `ℝ` (`B = 1`, `R = 1`) gives a lattice point within `1` of every point. -/
example (b : Fin 1 → ℝ) :
    ∃ z : Fin 1 → ℤ, ‖(1 : Matrix (Fin 1) (Fin 1) ℝ).mulVec (fun i => (z i : ℝ)) - b‖ ≤ 1 := by
  sorry

/-- Check: the hypothesis cannot be put on `L` instead of `L*`. In `ℝ²` the lattice `ℤ × kℤ`
(`k ≥ 2`) has no nonzero vector shorter than `1`, yet the point `(0, k/2)` is at distance `k/2`. -/
example : ¬ ∀ (L : Submodule ℤ (EuclideanSpace ℝ (Fin 2))) [DiscreteTopology L] [IsZLattice ℝ L],
    (∀ x ∈ L, x ≠ 0 → 1 ≤ ‖x‖) → ∀ b, ∃ x ∈ L, ‖x - b‖ ≤ 2 := by
  sorry

end Covering

/-! ## Siegel's lemma in product form (DT.0/siegel-lemma-number-field-product) -/

section Siegel

variable {K : Type*} [Field K] [NumberField K]

/-- DT.0/siegel-lemma-number-field-product (Berrevoets, Lemma 3.2): every row nonzero, `N > dM`,
and the bound through the product over rows and embeddings of the embedding maxima. -/
theorem exists_ne_zero_int_vec_abs_le_of_prod_embeddings {M N : ℕ} (a : Fin M → Fin N → 𝓞 K)
    (hMN : Module.finrank ℚ K * M < N) (hrow : ∀ i, ∃ j, a i j ≠ 0) :
    ∃ x : Fin N → ℤ, x ≠ 0 ∧ (∀ i, ∑ j, (x j : 𝓞 K) * a i j = 0) ∧
      ∀ j, (|x j| : ℝ) ≤ ((2 * Real.sqrt 2 * N) ^ (Module.finrank ℚ K * M) *
        ∏ i, ∏ σ : K →+* ℂ, ⨆ j, ‖σ (a i j : K)‖) ^
          ((1 : ℝ) / ((N : ℝ) - (Module.finrank ℚ K * M : ℕ))) := by
  sorry

/-- Check: the product of the embedding maxima of a row of house at most `A` is at most `A ^ d`,
which turns the product form into the house form of DT.0/siegel-lemma-number-field. -/
example {N : ℕ} (a : Fin N → 𝓞 K) {A : ℝ} (hA : 0 ≤ A)
    (ha : ∀ j, NumberField.house (a j : K) ≤ A) :
    ∏ σ : K →+* ℂ, ⨆ j, ‖σ (a j : K)‖ ≤ A ^ Module.finrank ℚ K := by
  sorry

/-- Check: a zero row makes the bound `0`, so the nonzero-row hypothesis cannot be dropped. -/
example {N : ℕ} : ∏ σ : ℚ →+* ℂ, ⨆ j : Fin N, ‖σ ((0 : 𝓞 ℚ) : ℚ)‖ = 0 := by
  sorry

end Siegel

/-! ## Badly approximable numbers and partial quotients
(DT.0/badly-approximable-iff-bounded-partial-quotients) -/

section BadlyApproximable

/-- Repeated verbatim from the base suggested file (DT.0/badly-approximable): an irrational `ξ` with
`q‖qξ‖ ≥ c > 0` for all `q ≥ 1`. -/
def BadlyApproximable (ξ : ℝ) : Prop :=
  Irrational ξ ∧ ∃ c : ℝ, 0 < c ∧ ∀ q : ℕ, 0 < q → c ≤ q * |q * ξ - round (q * ξ)|

/-- DT.0/badly-approximable-iff-bounded-partial-quotients (a): partial quotients at most `B` give
`q‖qξ‖ > 1/(B + 2)`. -/
theorem one_div_add_two_lt_mul_abs_sub_round {ξ : ℝ} (hξ : Irrational ξ) {B : ℝ}
    (hB : ∀ n b, (GenContFract.of ξ).partDens.get? n = some b → b ≤ B) {q : ℕ} (hq : 0 < q) :
    1 / (B + 2) < q * |q * ξ - round (q * ξ)| := by
  sorry

/-- DT.0/badly-approximable-iff-bounded-partial-quotients (b): `q‖qξ‖ ≥ c > 0` for all `q ≥ 1`
bounds every partial quotient by `1/c`. -/
theorem partDen_le_one_div_of_le_mul_abs_sub_round {ξ c : ℝ} (hc : 0 < c)
    (h : ∀ q : ℕ, 0 < q → c ≤ q * |q * ξ - round (q * ξ)|) {n : ℕ} {b : ℝ}
    (hb : (GenContFract.of ξ).partDens.get? n = some b) : b ≤ 1 / c := by
  sorry

/-- DT.0/badly-approximable-iff-bounded-partial-quotients (Pottmeyer, Proposition 1.3.21). -/
theorem badlyApproximable_iff_bddAbove_partDens {ξ : ℝ} (hξ : Irrational ξ) :
    BadlyApproximable ξ ↔
      ∃ B : ℝ, ∀ n b, (GenContFract.of ξ).partDens.get? n = some b → b ≤ B := by
  sorry

/-- Check: the golden ratio, with all partial quotients `1`. -/
example {q : ℕ} (hq : 0 < q) :
    1 / 3 < q * |q * Real.goldenRatio - round (q * Real.goldenRatio)| := by
  sorry

/-- Check: `1/2` has bounded partial quotients but is not badly approximable; irrationality is
needed. -/
example : (∃ B : ℝ, ∀ n b, (GenContFract.of (1 / 2 : ℝ)).partDens.get? n = some b → b ≤ B) ∧
    ¬ BadlyApproximable (1 / 2) := by
  sorry

/-- Check: the partial quotients of `liouvilleNumber 10` are unbounded. -/
example : ¬ ∃ B : ℝ, ∀ n b, (GenContFract.of (liouvilleNumber 10)).partDens.get? n = some b →
    b ≤ B := by
  sorry

end BadlyApproximable

/-! ## The maximum height of a tuple (DT.0/max-absolute-height-of-tuple) -/

section MaxHeight

variable {F : Type*} [Field F] [CharZero F] {ι : Type*}

/-- `h_max(y)`: the largest absolute logarithmic Weil height of the coordinates of a finite tuple,
`0` for the empty tuple (Binyamini, §1.1.4). -/
def maxAbsLogHeight [Finite ι] (y : ι → F) : ℝ :=
  ⨆ i, NumberField.absLogHeight₁ (y i)

/-- `H_max(y) = exp h_max(y)`. -/
def maxAbsMulHeight [Finite ι] (y : ι → F) : ℝ :=
  Real.exp (maxAbsLogHeight y)

@[simp]
theorem maxAbsLogHeight_of_isEmpty [Finite ι] [IsEmpty ι] (y : ι → F) : maxAbsLogHeight y = 0 := by
  sorry

@[simp]
theorem maxAbsLogHeight_unique [Unique ι] (y : ι → F) :
    maxAbsLogHeight y = NumberField.absLogHeight₁ (y default) := by
  sorry

theorem absLogHeight₁_le_maxAbsLogHeight [Finite ι] (y : ι → F) (i : ι) :
    NumberField.absLogHeight₁ (y i) ≤ maxAbsLogHeight y := by
  sorry

theorem maxAbsLogHeight_le_iff [Finite ι] (y : ι → F) {t : ℝ} (ht : 0 ≤ t) :
    maxAbsLogHeight y ≤ t ↔ ∀ i, NumberField.absLogHeight₁ (y i) ≤ t := by
  sorry

theorem absLogHeight₁_nonneg (x : F) : 0 ≤ NumberField.absLogHeight₁ x := by
  sorry

theorem maxAbsLogHeight_nonneg [Finite ι] (y : ι → F) : 0 ≤ maxAbsLogHeight y := by
  sorry

theorem maxAbsLogHeight_comp_equiv [Finite ι] {κ : Type*} [Finite κ] (y : ι → F) (e : κ ≃ ι) :
    maxAbsLogHeight (y ∘ e) = maxAbsLogHeight y := by
  sorry

theorem maxAbsLogHeight_map [Finite ι] {F' : Type*} [Field F'] [CharZero F'] (f : F →+* F')
    (y : ι → F) : maxAbsLogHeight (f ∘ y) = maxAbsLogHeight y := by
  sorry

/-- Binyamini's formula (1): `d·h(x) = log M(P)` for the primitive integer polynomial `P` of `x`
(either sign), `M(P) = |a₀|·∏ max(1, |xᵢ|)` its Mahler measure. -/
theorem absLogHeight₁_eq_log_mahlerMeasure_div {x : F} {P : ℤ[X]} (hP0 : P ≠ 0)
    (hP : P.IsPrimitive) (hx : aeval x P = 0) (hdeg : P.natDegree = (minpoly ℚ x).natDegree) :
    NumberField.absLogHeight₁ x =
      Real.log (P.map (Int.castRingHom ℂ)).mahlerMeasure / P.natDegree := by
  sorry

theorem maxAbsMulHeight_eq_max_one_iSup [Finite ι] (y : ι → F) :
    maxAbsMulHeight y = max 1 (⨆ i, NumberField.absMulHeight₁ (y i)) := by
  sorry

/-- Northcott for tuples of bounded degree. -/
theorem finite_setOf_maxAbsLogHeight_le (m D : ℕ) (T : ℝ) :
    {y : Fin m → ℂ | (∀ i, IsAlgebraic ℚ (y i) ∧ (minpoly ℚ (y i)).natDegree ≤ D) ∧
      maxAbsLogHeight y ≤ T}.Finite := by
  sorry

/-- Test `test_maxAbsLogHeight_empty` (degenerate). -/
example (y : Fin 0 → ℚ) : maxAbsLogHeight y = 0 := by
  sorry

/-- Test `test_maxAbsLogHeight_pair` (computation). -/
example : maxAbsLogHeight ![(2 : ℚ), 1 / 3] = Real.log 3 := by
  sorry

/-- Test `test_maxAbsLogHeight_sqrtTwo` (computation): the `1/[ℚ(√2):ℚ]` normalisation. -/
example : maxAbsLogHeight ![Real.sqrt 2] = Real.log 2 / 2 := by
  sorry

/-- Test `test_maxAbsLogHeight_rootsOfUnity` (computation). -/
example : maxAbsLogHeight ![Complex.I, -1] = 0 := by
  sorry

/-- Test `test_maxAbsLogHeight_ne_projective` (non-example): not the height of `[1 : y₁ : ⋯ : yₘ]`. -/
example : maxAbsLogHeight ![(2 : ℚ), 1 / 2] = Real.log 2 ∧
    Height.logHeight ![(2 : ℚ), 4, 1] = Real.log 4 := by
  sorry

end MaxHeight

end DiophantineApproximation
