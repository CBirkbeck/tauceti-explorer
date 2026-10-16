import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
ClassicalSerreModularity--R27.5.md is definitive. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures.

The pinned libraries lack the arithmetic representation, Serre-weight,
compatible-system and residual-modularity interfaces needed to state the three
R27.5 endpoint theorems honestly. Their full statements and hypotheses remain
README targets, as recorded in the packet's suggestedCoverage. No substitute
predicates or new data carriers are introduced here.

These five examples are local algebra acceptance fragments, not assertions of
Serre modularity. The first three model the nontrivial order-three inertia in
characteristic two. The last two retain the actual unipotent extension at
local prime two in coefficient characteristic three.
-/

open scoped Matrix

namespace TauCeti.SerreConjecture.R275

-- Example 1: a nontrivial order-three inertial matrix over F₂.
example :
    let M : Matrix (Fin 2) (Fin 2) (ZMod 2) := !![0, 1; 1, 1]
    M ^ 3 = 1 ∧ M ≠ 1 := by
  sorry

-- Example 2: the determinant of that matrix is one.
example : Matrix.det (!![0, 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 1 := by
  sorry

-- Example 3: this inertial action has no nonzero fixed vector over F₂.
example (v : Fin 2 → ZMod 2)
    (h : (!![0, 1; 1, 1] : Matrix (Fin 2) (Fin 2) (ZMod 2)) *ᵥ v = v) :
    v = 0 := by
  sorry

-- Example 4: D is its own inverse; arithmetic Frobenius at 2 sends U to U².
example :
    let D : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![-1, 0; 0, 1]
    let U : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![1, 1; 0, 1]
    D * D = 1 ∧ D * U * D = U ^ 2 := by
  sorry

-- Example 5: semisimplifying U would lose its nontrivial inertia action.
example :
    let U : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![1, 1; 0, 1]
    U ^ 3 = 1 ∧ U ≠ 1 := by
  sorry

end TauCeti.SerreConjecture.R275
