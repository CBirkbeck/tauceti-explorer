import Mathlib.Algebra.CharP.Defs
import Mathlib.Algebra.Group.AddChar
import Mathlib.Algebra.GroupWithZero.Units.Fintype
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases

/-!
# Kloosterman sheaves and Bessel F-isocrystals: suggested signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/KloostermanSheavesAndBesselIsocrystals.md`.
The declarations suggest names and signatures so contributors and reviewers can
converge on interfaces; they claim no implementation of the roadmap.

WORKERS.md's compact-file rule puts the full group-valued coefficient categories,
Hecke functors, oper localization, analytic comparison and slope filtration in
the README, together with every target's hypotheses, API and tests. These need
carriers absent at the pins. Here there are only light matrix/coefficient
formulas, directly statable milestones and finite-sum end theorems. In particular,
there is no replacement isocrystal structure and no second scalar Kloosterman
carrier: the sums below are written on Mathlib's existing finite fields.

Conventions: raw sums have no sign or weight factor; the normalized rank-r trace
is (-1)^(r-1) q^(-(r-1)/2) times the raw sum. Matrices use column connections.
The rank-three lowest-root matrix has both coefficients 2. The signed appendix
series is written in its x ↦ -x coordinate; its maximal quotient is dual to the
solution line in the column cyclic convention, with multiplier q^n/f.
-/

noncomputable section

open scoped BigOperators Matrix

namespace TauCeti.Bessel

/-- KB.8: the standard odd-orthogonal nilpotent in rank three. -/
def oddNilpotentThree {R : Type*} [CommRing R] : Matrix (Fin 3) (Fin 3) R :=
  !![0, 1, 0; 0, 0, 1; 0, 0, 0]

/-- KB.8: the lowest-root coefficient, with its normalization retained. -/
def oddAffineThree {R : Type*} [CommRing R] : Matrix (Fin 3) (Fin 3) R :=
  !![0, 0, 0; 2, 0, 0; 0, 2, 0]

/-- Both coefficients preserve the same split symmetric form. -/
theorem oddThree_preserves_form {R : Type*} [CommRing R] (t : R) :
    let A := oddNilpotentThree (R := R) + t • oddAffineThree (R := R)
    A.transpose * !![0, 0, -1; 0, 1, 0; -1, 0, 0] +
      !![0, 0, -1; 0, 1, 0; -1, 0, 0] * A = 0 := by
  sorry

/-- KB.4: residue compatibility in the column F*→object convention.
The diagonal is the inverse grading representative; its semisimple class is the
usual principal grading class after the Weyl involution. -/
theorem zero_frobenius_rank_two {K : Type*} [Field K] (t : K) (ht : t ≠ 0) :
    (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) K) * !![t⁻¹, 0; 0, t] =
      t ^ 2 • (!![t⁻¹, 0; 0, t] * !![0, 1; 0, 0]) := by
  sorry

/-- KB.10: the signed coefficient of the appendix's scalar solution series. -/
def signedCoefficient (n j : ℕ) : ℚ :=
  (-2 : ℚ) ^ ((2 * n + 1) * j) / (Nat.factorial j : ℚ) ^ (2 * n + 1)

/-- The nilpotent has the required nonzero second power in rank three. -/
example : ((oddNilpotentThree : Matrix (Fin 3) (Fin 3) ℚ) ^ 2) 0 2 = 1 := by
  norm_num [oddNilpotentThree, pow_two, Matrix.mul_apply, Fin.sum_univ_succ]
  rfl

/-- The lowest-root coefficient is 2, rather than 1. -/
example : (oddAffineThree : Matrix (Fin 3) (Fin 3) ℚ) 1 0 = 2 := by
  rfl

/-- The rank-six even-orthogonal matrix kills the difference of its middle vectors. -/
example :
    (!![0,1,0,0,0,0; 0,0,1,1,0,0; 0,0,0,0,1,0;
        0,0,0,0,1,0; 0,0,0,0,0,1; 0,0,0,0,0,0] :
        Matrix (Fin 6) (Fin 6) ℚ) *ᵥ ![0,0,1,-1,0,0] = 0 := by
  ext i
  fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_succ]

/-- The exceptional signed congruence is visible already at this coefficient ratio. -/
example : signedCoefficient 1 4 / signedCoefficient 1 2 = (1 : ℚ) / 27 := by
  norm_num [signedCoefficient, Nat.factorial]

/-- KB.11: Carlitz's raw characteristic-two identity, with no extra q factor. -/
theorem carlitz_char_two {F : Type*} [Field F] [Fintype F] [DecidableEq F] [CharP F 2]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (a : Fˣ) :
    (∑ u : Fˣ, ψ ((u : F) + (a : F) / (u : F))) ^ 2 -
        (Fintype.card F : ℂ) =
      ∑ u : Fˣ, ∑ v : Fˣ,
        ψ ((u : F) + (v : F) + (a : F) / ((u : F) * (v : F))) := by
  sorry

/-- KB.11: higher raw orthogonal identity. Here U_(n+1) has 2n+2 coordinates;
the right side is the raw rank-(2n+3) scalar sum. The generic sum's carrier
continues to belong to KloostermanMomentsAndPotentialAutomorphy. -/
theorem orthogonal_raw_char_two {F : Type*} [Field F] [Fintype F] [DecidableEq F] [CharP F 2]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (n : ℕ) (hn : 1 ≤ n) (a : Fˣ) :
    (∑ u : Fˣ, ∑ v : Fˣ, ∑ y : Fin (2 * n) → Fˣ,
      ψ ((u : F) + (v : F) + (∑ i, (y i : F)) +
        (a : F) * ((u : F) + (v : F)) /
          ((u : F) * (v : F) * ∏ i, (y i : F)))) - (Fintype.card F : ℂ) =
      ∑ z : Fin (2 * n + 2) → Fˣ,
        ψ ((∑ i, (z i : F)) + (a : F) / ∏ i, (z i : F)) := by
  sorry

/-- The smallest-field value distinguishes the raw and normalized identities. -/
example : (1 : ℤ) ^ 2 - 2 = -1 := by norm_num

end TauCeti.Bessel
