import Mathlib.Algebra.Field.Rat
import Mathlib.Data.Nat.Factorial.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.6.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. They claim no implementation; every node is unchecked.

The compact shape prescribed by WORKERS.md (2026-10-12) keeps only light,
real-bodied definitions on carriers at the pins. There is no pinned carrier for
actual higher scheme K-theory, motivic cohomology or the supported relative
universal character. Their mathematical statements, API and tests are in the
reader. This file neither invents carriers for them nor assumes their
construction as a parameter.

README target catalogue, all with prefix MotivicEtaleKTheory:M.6/:
* universal-motivic-chern: motivicChern, motivicChern_degreeZero,
  motivicChern_pullback, motivicChern_add_positive, motivicChern_units,
  motivicChern_relative. Tests: chern_line, chern_trivial, chern_unit,
  chern_symbol_sign, chern_not_additive_zero.
* higher-chern-normalization: motivicChernCharacter,
  motivicChernCharacter_positive, motivicChernCharacter_zero,
  motivicChernCharacter_finite, higherChernCoefficient and
  higherChernCoefficient_cancel. Tests: coefficient_small, character_rank,
  character_line, character_symbol_three, character_units,
  character_no_integral_division. Only its scalar arithmetic is typed below.
* higher-character-structure: products, pullback and Adams compatibility.
* gamma-homotopy-coniveau-comparison: equality of rational filtrations.
* relative-cycle-normalization: the actual composite ch after cyc is identity.
* chern-character-edge-comparison: universal, edge and S.7 gamma maps agree.
* chern-localization-residue: localization and the codimension-one weight shift.

The tower, layers, convergence, operations and rational splitting are imported
from the accepted M.5d packet, with their existing IDs. No duplicate spectrum,
exact couple or eigenspace interface is introduced here. G1--G3 remain genuine
supplier gaps. Elaboration of the scalar does not discharge any of them.
-/

namespace TauCeti.MotivicKTheory

/-- Positive K-degree normalization scalar. The zero clause encodes vanishing
of weight zero in positive K-degree; it does not encode the K₀ rank map. -/
def higherChernCoefficient (j : ℕ) : ℚ :=
  if j = 0 then 0 else (-1 : ℚ) ^ (j - 1) / (Nat.factorial (j - 1) : ℚ)

/-- Cancel the signed factorial in the Milnor-diagonal Chern formula. -/
theorem higherChernCoefficient_cancel (j : ℕ) (hj : 1 ≤ j) :
    higherChernCoefficient j *
      ((-1 : ℚ) ^ (j - 1) * (Nat.factorial (j - 1) : ℚ)) = 1 := by
  sorry

/-- Factorial recurrence; the weight must be positive. -/
theorem higherChernCoefficient_recurrence (j : ℕ) (hj : 1 ≤ j) :
    (j : ℚ) * higherChernCoefficient (j + 1) = -higherChernCoefficient j := by
  sorry

-- coefficient_small: degenerate value and the first four positive weights.
example : higherChernCoefficient 0 = 0 := by sorry
example : higherChernCoefficient 1 = 1 := by sorry
example : higherChernCoefficient 2 = -1 := by sorry
example : higherChernCoefficient 3 = (1 : ℚ) / 2 := by sorry
example : higherChernCoefficient 4 = -(1 : ℚ) / 6 := by sorry

-- character_symbol_three: the +2 Chern coefficient cancels, giving +1.
example : higherChernCoefficient 3 * 2 = 1 := by sorry

-- character_no_integral_division: the scalar is genuinely rational.
example : higherChernCoefficient 3 ≠ 1 := by sorry

end TauCeti.MotivicKTheory
