import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.MvPolynomial.Monad

/-!
This file is not the roadmap and is not exhaustive. The reader document
`research/blueprint/readmes/EndoscopicTransferAndUnitaryTraceComparisonPartII.md`
is definitive. These statements suggest Lean forms so that contributors and
reviewers can converge on names and signatures.

The 2026-10-12 WORKERS shape permits only light definitions over existing
carriers, available-carrier milestones and a few examples. The two definitions
below are the standard-Gram coordinate cases of FJ.0/contractions. Mathlib
already owns Hermitian matrices, adjoints and characteristic polynomials.

General Hermitian adjoints, p-adic test spaces, relative endoscopic data,
quotient orbital integrals, Hironaka's transform and the Jacquet–Rallis/Weil
interfaces are README targets. No replacement carriers or assumed transfer
predicates are introduced here. In particular the unit theorem cannot honestly
be stated in this file at the pins. All planned mathematics remains unchecked.
-/

set_option autoImplicit false

namespace TauCeti.UnitaryFJ

section MatrixCoordinates

variable {R : Type*} [CommRing R] [StarRing R]
variable {m n : Type*}

/-- The signed left contraction in standard Hermitian coordinates. -/
def leftContraction [Fintype n] (X : Matrix m n R) : Matrix m m R :=
  -(X * X.conjTranspose)

/-- The signed right contraction in standard Hermitian coordinates. -/
def rightContraction [Fintype m] (X : Matrix m n R) : Matrix n n R :=
  -(X.conjTranspose * X)

-- FJ.0/contractions: these refine the existing Matrix.IsHermitian predicate.
theorem leftContraction_isHermitian [Fintype n] (X : Matrix m n R) :
    (leftContraction X).IsHermitian := by
  sorry

theorem rightContraction_isHermitian [Fintype m] (X : Matrix m n R) :
    (rightContraction X).IsHermitian := by
  sorry

theorem contraction_swap [Fintype m] (X : Matrix m n R) :
    rightContraction X = leftContraction X.conjTranspose := by
  sorry

-- This is the standard-coordinate form of the unitary equivariance law.
theorem leftContraction_equivariant [Fintype m] [Fintype n] [DecidableEq n]
    (U : Matrix m m R) (V : Matrix n n R) (X : Matrix m n R)
    (hV : V.conjTranspose * V = 1) :
    leftContraction (U * X * V.conjTranspose) =
      U * leftContraction X * U.conjTranspose := by
  sorry

-- A specialization of Matrix.charpoly_mul_comm, not a new general AB/BA theorem.
theorem contractions_charpoly [Fintype n] [DecidableEq n] (X : Matrix n n R) :
    (leftContraction X).charpoly = (rightContraction X).charpoly := by
  sorry

-- The sign, star and zero conventions are discriminating coordinate checks.
example [Fintype n] :
    leftContraction (0 : Matrix m n R) = 0 := by
  sorry

example [Fintype n] [DecidableEq n] :
    leftContraction (1 : Matrix n n R) = -1 := by
  sorry

example (z : R) :
    leftContraction (fun _ _ : Fin 1 => z) 0 0 = -(z * star z) := by
  sorry

example [Fintype n] [DecidableEq n] (z : n → R) :
    leftContraction (Matrix.diagonal z) =
      Matrix.diagonal (fun i => -(z i * star (z i))) := by
  sorry

end MatrixCoordinates

section SatakeCoordinateChecks

open MvPolynomial

-- SR.4 owns the Levi map. This checks its imported a=b=1 normalization:
-- q*(Z1+Z2) becomes X1+X2 after scaling both variables by q^(-1).
example (q : ℚ) (hq : q ≠ 0) :
    bind₁ (fun i : Fin 2 => C q⁻¹ * X i)
      (C q * (X 0 + X 1) : MvPolynomial (Fin 2) ℚ) = X 0 + X 1 := by
  sorry

-- On a central rank-two monomial the twist contributes q^(-2).
example (q : ℚ) :
    bind₁ (fun i : Fin 2 => C q⁻¹ * X i)
      (X 0 * X 1 : MvPolynomial (Fin 2) ℚ) =
      C (q⁻¹ ^ 2) * (X 0 * X 1) := by
  sorry

-- FJ.2/base-change-compatibility in the equal-block coordinate case.
-- The symbolic scalar s is the F-Levi scaling; its square is the E scaling.
example (s : ℚ) (p : MvPolynomial (Fin 2) ℚ) :
    bind₁ (fun i : Fin 2 => (X i : MvPolynomial (Fin 2) ℚ) ^ 2)
      (bind₁ (fun i => C (s ^ 2) * X i) p) =
    bind₁ (fun i : Fin 2 => C s * X i)
      (bind₁ (fun i => (X i : MvPolynomial (Fin 2) ℚ) ^ 2) p) := by
  sorry

end SatakeCoordinateChecks

end TauCeti.UnitaryFJ
