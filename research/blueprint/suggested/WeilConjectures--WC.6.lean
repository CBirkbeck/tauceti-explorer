/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures.

The actual adic cohomology, mixed-sheaf and Frobenius carriers required for
`exists_unique_integral_degree_factors_of_smooth_proper` and
`reciprocal_divisor_weight_le` are missing at the pins. Their signatures are
omitted, as recorded in the packet gap; they are not replaced by an assumed
cohomology structure or proposition fields. The following are convention
tests on existing carriers, not geometric realizations or new owned objects.
-/
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

noncomputable section

open Polynomial

namespace TauCetiRoadmap.WeilConjectures.WC6

-- Empty cohomology: normalized factor is one.
example : (0 : Matrix (Fin 0) (Fin 0) ℚ).charpolyRev = 1 := by
  sorry

-- P^1 over F_4: the linear q-Frobenius on the Tate line is 4, not 2.
example : (Matrix.diagonal (fun _ : Fin 1 => (4 : ℚ))).charpolyRev =
    1 - C 4 * X := by
  sorry

-- A length-two Frobenius orbit has factor 1-T^2, not (1-T)^2.
example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    1 - X ^ 2 := by
  sorry

-- The rank-two unipotent Jordan block has the same factor as its semisimplification.
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    (1 - X) ^ 2 := by
  sorry

-- The elliptic companion matrix tests det(1-TF), not det(T-F).
example (q a : ℚ) :
    (!![0, -q; 1, a] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
      1 - C a * X + C q * X ^ 2 := by
  sorry

-- Algebraic substitution in Z(P^2/F_2,T): the sign is negative.
-- Here t is the existing transcendental rational function, so no denominator vanishes.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    ((1 - (4 * t)⁻¹) * (1 - 2 * (4 * t)⁻¹) *
      (1 - 4 * (4 * t)⁻¹))⁻¹ =
        -8 * t ^ 3 * ((1 - t) * (1 - 2 * t) * (1 - 4 * t))⁻¹ := by
  sorry

-- Reciprocal genus-two numerator, q=2: chi=-2 needs integer powers.
-- This is a polynomial identity test; no curve realization of this numerator is asserted.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    (1 + 4 * ((2 * t)⁻¹) ^ 4) /
        ((1 - (2 * t)⁻¹) * (1 - 2 * (2 * t)⁻¹)) =
      (2 : RatFunc ℚ)⁻¹ * t ^ (-2 : ℤ) *
        ((1 + 4 * t ^ 4) / ((1 - t) * (1 - 2 * t))) := by
  sorry

-- G_m: compact-support factorization, not the ordinary-cohomology quotient.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    (1 - t) / (1 - 2 * t) =
      (1 - 2 * t)⁻¹ / (1 - t)⁻¹ := by
  sorry

end TauCetiRoadmap.WeilConjectures.WC6
