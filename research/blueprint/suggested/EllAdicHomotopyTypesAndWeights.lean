import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import TauCeti.Algebra.Homology.DG.Algebra.Cohomology

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures.

Only light definitions on carriers present at the pins are included. Sullivan
models, relative simplex-form algebras, geometric weight comparisons, the
proalgebraic descent, and the étale Lie comparison remain mathematical targets
in the reader document. No data-valued construction is supplied by an axiom.

The polynomial below is a rational coordinate element, not a replacement for
Mathlib's integral divided-power algebra. The diagonal-cycle statement is the
linear-algebra step in Weil II 5.3.7, not a formalization of variety formality.
-/

noncomputable section

namespace TauCeti.EllAdicHomotopy

open Polynomial

/-- The rational image of the integral divided-power coordinate γ_n. -/
def dividedPowerPolynomial (n : ℕ) : ℚ[X] :=
  C ((n.factorial : ℚ)⁻¹) * X ^ n

theorem dividedPowerPolynomial_zero : dividedPowerPolynomial 0 = 1 := by
  sorry

theorem dividedPowerPolynomial_mul (m n : ℕ) :
    dividedPowerPolynomial m * dividedPowerPolynomial n =
      C (((m + n).choose m : ℕ) : ℚ) * dividedPowerPolynomial (m + n) := by
  sorry

theorem dividedPowerPolynomial_t_mul (n : ℕ) :
    X * dividedPowerPolynomial n =
      C ((n + 1 : ℕ) : ℚ) * dividedPowerPolynomial (n + 1) := by
  sorry

theorem dividedPowerPolynomial_derivative (n : ℕ) :
    derivative (dividedPowerPolynomial (n + 1)) = dividedPowerPolynomial n := by
  sorry

example : dividedPowerPolynomial 1 = X := by
  sorry

example : dividedPowerPolynomial 2 = C (1 / 2 : ℚ) * X ^ 2 := by
  sorry

example : dividedPowerPolynomial 1 * dividedPowerPolynomial 1 =
    C 2 * dividedPowerPolynomial 2 := by
  sorry

-- These tests use the existing integral carrier, without defining another one.
example : DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) *
    DividedPowerAlgebra.dp ℤ 1 (1 : ℤ) =
    2 • DividedPowerAlgebra.dp ℤ 2 (1 : ℤ) := by
  sorry

example : DividedPowerAlgebra.dp (ZMod 2) 1 (1 : ZMod 2) *
    DividedPowerAlgebra.dp (ZMod 2) 1 (1 : ZMod 2) = 0 := by
  sorry

section GradedCommutativity

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]

/-- The extra nonnegative, alternating Koszul conditions on an existing
internally graded DG carrier. The differential is the existing `IsDGAlgebra` one. -/
def commutative_dg_refinement (G : ℤ → Submodule R A) : Prop :=
  (∀ p : ℤ, p < 0 → G p = ⊥) ∧
  (∀ (p q : ℤ) (x y : A), x ∈ G p → y ∈ G q →
    x * y = (p * q).negOnePow • (y * x)) ∧
  (∀ (p : ℤ) (x : A), Odd p → x ∈ G p → x * x = 0)

theorem commutative_dg_refinement_odd_sq {G : ℤ → Submodule R A}
    (h : commutative_dg_refinement G) {p : ℤ} (hp : Odd p)
    {x : A} (hx : x ∈ G p) : x * x = 0 := by
  sorry

theorem commutative_dg_refinement_koszul {G : ℤ → Submodule R A}
    (h : commutative_dg_refinement G) {p q : ℤ} {x y : A}
    (hx : x ∈ G p) (hy : y ∈ G q) :
    x * y = (p * q).negOnePow • (y * x) := by
  sorry

example (G : ℤ → Submodule R A) (h : commutative_dg_refinement G)
    (x : A) (hx : x ∈ G 1) : x * x = 0 := by
  sorry

example (G : ℤ → Submodule R A) (h : commutative_dg_refinement G) :
    G (-1) = ⊥ := by
  sorry

example (G : ℤ → Submodule R A) (h : commutative_dg_refinement G)
    (x y : A) (hx : x ∈ G 1) (hy : y ∈ G 2) : x * y = y * x := by
  sorry

end GradedCommutativity

section WeightDiagonal

variable {K A : Type*} [Field K] [Ring A] [Algebra K A]

/-- The simultaneous cochain-degree n and weight-n subspace. -/
def diagonalPiece (G W : ℤ → Submodule K A) (n : ℤ) : Submodule K A :=
  G n ⊓ W n

theorem diagonalPiece_d_eq_zero (G W : ℤ → Submodule K A)
    [GradedAlgebra G] (d : A →ₗ[K] A) (hDG : IsDGAlgebra G d)
    (hWeight : ∀ (w : ℤ) (x : A), x ∈ W w → d x ∈ W w)
    (hBound : ∀ (p w : ℤ), w < p → G p ⊓ W w = ⊥)
    (n : ℤ) (x : A) (hx : x ∈ diagonalPiece G W n) : d x = 0 := by
  sorry

example (G W : ℤ → Submodule K A) (n : ℤ) (x : A) :
    x ∈ diagonalPiece G W n ↔ x ∈ G n ∧ x ∈ W n := by
  sorry

example (G : ℤ → Submodule K A) (n : ℤ) :
    diagonalPiece G (fun _ => ⊤) n = G n := by
  sorry

example (G : ℤ → Submodule K A) (n : ℤ) :
    diagonalPiece G (fun _ => ⊥) n = ⊥ := by
  sorry

end WeightDiagonal

end TauCeti.EllAdicHomotopy
