import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.ZMod.Basic

/-!
# GL₂ modularity transfer: convention checks

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/GL2ModularityLifting--R32.6.md`. These statements suggest
Lean forms for statable acceptance examples; discharging them does not complete a layer.

The arithmetic targets are the seven imported R32.6 nodes in part R32.3 and the new
`directed-polynomial-family-transfer` application. All eight remain README targets:
the pinned libraries lack the combined geometric p-adic representation, residual,
de Rham and attached-newform interfaces needed for their signatures. No surrogate
modularity predicate, compatible-system carrier or proposition-valued placeholder
is introduced. There are no new definitions or API obligations in this part.

The four examples below check the determinant sign lost at two, the inverse-square
factor in rank-two twisting, and the nontrivial residue character value at three.
They are convention checks, not elaborations of the arithmetic transfer theorem.
The underlying determinant formulas are already Mathlib's `Matrix.det_fin_two`
and `Matrix.det_smul`, read in the pinned source.
-/

namespace TauCetiRoadmap.GL2ModularityLifting.R32_6

/-- Characteristic-zero oddness has determinant minus one. -/
example : Matrix.det !![(1 : ℤ), 0; 0, -1] = -1 := by
  sorry

/-- The same sign reduces to one at two; residual determinant cannot certify oddness. -/
example : Matrix.det !![(1 : ZMod 2), 0; 0, -1] = 1 := by
  sorry

/-- Twisting a rank-two action by an inverse character changes determinant by its square. -/
example {R : Type*} [CommRing R] (a : Rˣ) (M : Matrix (Fin 2) (Fin 2) R) :
    Matrix.det ((↑(a⁻¹) : R) • M) = (↑(a⁻¹) : R) ^ 2 * Matrix.det M := by
  sorry

/-- The ordinary-three residual ratio is nontrivial; its inverse has the same value. -/
example : (1 : ZMod 3) ≠ -1 ∧ (-1 : ZMod 3) * (-1) = 1 := by
  sorry

end TauCetiRoadmap.GL2ModularityLifting.R32_6
