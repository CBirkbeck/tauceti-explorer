import Mathlib.AlgebraicTopology.SingularSet
import Mathlib.CategoryTheory.Functor.Currying
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Analysis.Complex.Basic

/-!
# Étale homotopy types and pro-spaces: suggested signatures

This file is a roadmap, not an implementation. The reader document contains
all targets, hypotheses, APIs, sources and tests. Definitions requiring
unavailable carriers remain there. In particular this file does not assume
an étale-type, pro-model, p-completion or analytification implementation.

The declarations below use only carriers present at Mathlib 082e2d3 and
Tau Ceti f790474. The Betti diagonal is a light specialization of native
functors to a supplied simplicial topological space. Applying it to a
scheme requires the shared analytification input described in EH.5/G6.
-/

open CategoryTheory CategoryTheory.Functor Convexity

universe u

namespace EtaleHomotopyTypesSuggested

/-- EH.5/betti-diagonal on an already supplied simplicial topological space. -/
noncomputable def bettiDiagonal (X : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) : SSet.{u} :=
  Functor.diag (SimplexCategoryᵒᵖ) ⋙ Functor.uncurry.obj (X ⋙ TopCat.toSSet)

/-- The map induced by a map of the supplied topological diagrams. -/
noncomputable def bettiDiagonalMap {X Y : SimplexCategoryᵒᵖ ⥤ TopCat.{u}}
    (f : X ⟶ Y) : bettiDiagonal X ⟶ bettiDiagonal Y :=
  whiskerLeft (Functor.diag (SimplexCategoryᵒᵖ))
    (Functor.uncurry.map (whiskerRight f TopCat.toSSet))

/-- EH.5: the constant-diagram comparison uses the native singular functor. -/
theorem bettiDiagonal_constant (X : TopCat.{u}) :
    Nonempty (bettiDiagonal ((Functor.const (SimplexCategoryᵒᵖ)).obj X) ≅
      TopCat.toSSet.obj X) := by
  sorry

/-- EH.5: both simplex directions use the same index. -/
theorem bettiDiagonal_simplices (X : SimplexCategoryᵒᵖ ⥤ TopCat.{u})
    (n : SimplexCategoryᵒᵖ) :
    Nonempty ((bettiDiagonal X).obj n ≃
      C(StdSimplex ℝ (Fin (n.unop.len + 1)), X.obj n)) := by
  sorry

/-- EH.5 evaluation compatibility, on the existing continuous-function algebra. -/
theorem evaluation_precompose {T U : Type u} [TopologicalSpace T]
    [TopologicalSpace U] (f : C(T, U)) (t : T) :
    (ContinuousMap.evalAlgHom ℂ ℂ t).comp
      (ContinuousMap.compRightAlgHom ℂ ℂ f) =
      ContinuousMap.evalAlgHom ℂ ℂ (f t) := by
  sorry

/-- A zero-dimensional singular-simplex check on the supplied diagonal. -/
example (X : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) :
    Nonempty ((bettiDiagonal X).obj (Opposite.op (SimplexCategory.mk 0)) ≃
      C(StdSimplex ℝ (Fin 1), X.obj (Opposite.op (SimplexCategory.mk 0)))) := by
  sorry

/-- Evaluation at a point preserves the multiplicative unit. -/
example {T : Type u} [TopologicalSpace T] (t : T) :
    ContinuousMap.evalAlgHom ℂ ℂ t (1 : C(T, ℂ)) = 1 := by
  sorry

/-- A nonconstant coordinate distinguishes evaluation from an arbitrary point map. -/
example (z : ℂ) :
    ContinuousMap.evalAlgHom ℂ ℂ z (ContinuousMap.id ℂ) = z := by
  sorry

end EtaleHomotopyTypesSuggested
