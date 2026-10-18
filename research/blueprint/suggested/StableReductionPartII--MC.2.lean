import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
StableReductionPartII--MC.2.md is definitive. These suggested Lean forms help
contributors and reviewers converge on names and signatures.

Only absolute stable reflexivity is a light definition on carriers available
at the pins. Relative stable reflexivity, complete resolutions, pointed curve
families, stacks, sheaf duals and geometric expansion remain reader targets.
Their signatures require the supplier interfaces listed there. The statements
below use native duals, evaluation, Ext, modules and adic completion; none of
those missing geometric objects is replaced by a stand-in structure.

The Ext vanishing is categorical vanishing of the actual derived functor in
ModuleCat. Elaboration checks these statements, and proves none of the admitted
roadmap results. The general completion statement here concerns absolute stable
reflexivity only; the reader gives the stronger two-base relative theorem.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

namespace StableReductionPartII.MC2

universe u

variable (R : Type u) [CommRing R]
variable (M : Type u) [AddCommGroup M] [Module R M]

/-- Absolute stable reflexivity, using the canonical evaluation and both Ext families. -/
def IsStablyReflexive : Prop :=
  Module.IsReflexive R M ∧
    (∀ n : ℕ,
      IsZero (((_root_.Ext R (ModuleCat R) (n + 1)).obj
        (Opposite.op (ModuleCat.of R M))).obj (ModuleCat.of R R))) ∧
    (∀ n : ℕ,
      IsZero (((_root_.Ext R (ModuleCat R) (n + 1)).obj
        (Opposite.op (ModuleCat.of R (Module.Dual R M)))).obj
          (ModuleCat.of R R)))

/-- Forgetting stable reflexivity retains the existing reflexivity predicate. -/
theorem IsStablyReflexive.isReflexive (h : IsStablyReflexive R M) :
    Module.IsReflexive R M := by
  sorry

/-- The bidual isomorphism is specifically the native evaluation map. -/
theorem IsStablyReflexive.bijective_eval (h : IsStablyReflexive R M) :
    Function.Bijective (Module.Dual.eval R M) := by
  sorry

/-- Finite projective modules satisfy the absolute predicate. -/
theorem isStablyReflexive_of_finite_projective
    [Module.Finite R M] [Module.Projective R M] :
    IsStablyReflexive R M := by
  sorry

/-- Duality preserves the predicate for finite modules over a Noetherian ring. -/
theorem IsStablyReflexive.dual [IsNoetherianRing R] [Module.Finite R M]
    (h : IsStablyReflexive R M) : IsStablyReflexive R (Module.Dual R M) := by
  sorry

/-- Linear equivalences transport stable reflexivity. -/
theorem isStablyReflexive_iff_of_linearEquiv
    {N : Type u} [AddCommGroup N] [Module R N] (e : M ≃ₗ[R] N) :
    IsStablyReflexive R M ↔ IsStablyReflexive R N := by
  sorry

/-- Noetherian completion is faithfully flat when its ideal lies in the Jacobson radical. -/
theorem isStablyReflexive_completion_iff [IsNoetherianRing R]
    [Module.Finite R M] (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R)) :
    IsStablyReflexive (AdicCompletion I R)
      (AdicCompletion I R ⊗[R] M) ↔ IsStablyReflexive R M := by
  sorry

/-- The zero module is included. -/
example : IsStablyReflexive R (Fin 0 → R) := by
  sorry

/-- Finite free modules are included, even over a nonreduced coefficient ring. -/
example : IsStablyReflexive (ZMod 4) (Fin 2 → ZMod 4) := by
  sorry

/-- Torsion over the integers fails already at canonical biduality. -/
example : ¬ IsStablyReflexive ℤ (ZMod 2) := by
  sorry

end StableReductionPartII.MC2
