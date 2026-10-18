/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic

/-!
# StableReductionPartII, MC.4: available-carrier statements

This file is not the roadmap and is not exhaustive. The accompanying reader is
definitive; these statements suggest Lean forms and names for contributors and reviewers.
Proofs are intentionally omitted. See the reader for geometric targets, exact hypotheses,
source locators, API tests and outstanding supplier contracts.

No stack, relative Jacobian or cohomology carrier is fabricated here. The first two
statements prototype the A3 Serre-rigidity supplier request on the existing abelian
endomorphism ring; they are not new curve-owned definitions. The matrix statement is
the arithmetic check for the boundary monodromy adapter. These declarations alone do
not prove representability, connectedness or projectivity of moduli.
-/

namespace TauCeti.ModuliCurves.MC4Suggested

open TauCeti.AlgebraicGeometry

/-- Serre's appendix, pp.17-18--17-20: finite-order endomorphisms congruent to
one modulo N >= 3 are the identity. Divisibility is in the endomorphism ring,
so the condition concerns the torsion kernel as a group scheme. -/
theorem serre_level_rigidity {K : Type*} [Field K]
    (A : AbelianVariety K) (N : ℕ) (hN : 3 ≤ N)
    (u : AbelianVariety.End A) (hu : IsOfFinOrder u)
    (hlevel : ∃ v : AbelianVariety.End A, u - 1 = (N : AbelianVariety.End A) * v) :
    u = 1 := by
  sorry

/-- Level two yields an involution, rather than identity. -/
theorem serre_level_two {K : Type*} [Field K]
    (A : AbelianVariety K) (u : AbelianVariety.End A) (hu : IsOfFinOrder u)
    (hlevel : ∃ v : AbelianVariety.End A, u - 1 = (2 : AbelianVariety.End A) * v) :
    u ^ 2 = 1 := by
  sorry

/-- A primitive Picard--Lefschetz transvection has exact order N modulo N.
This does not assert that the whole level deck group has order invertible on the base. -/
theorem boundary_transvection_order (N : ℕ) (hN : 2 ≤ N) :
    orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod N)) = N := by
  sorry

example : orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) = 3 := by
  sorry

example : orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 4)) = 4 := by
  sorry

/-- The level-two involution is already visible on an integral rank-one module. -/
example : (-1 : ℤ) ≠ 1 ∧ (-1 : ℤ) ^ 2 = 1 ∧ ∃ v : ℤ, -1 - 1 = 2 * v := by
  sorry

end TauCeti.ModuliCurves.MC4Suggested
