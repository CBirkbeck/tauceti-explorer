/-
This file is not the roadmap and is not exhaustive. The definitive specification is
research/blueprint/readmes/RankOneConverse.md. These suggested forms help contributors
and reviewers converge on names and signatures; no implementation is claimed.

Only light definitions and milestones expressible on pinned carriers appear here.
The arithmetic Selmer groups, anticyclotomic deformation, normalized Heegner point,
and Theorems A, A', B, C, E are README targets: their supplier carriers are not yet
available at the pins. They are not replaced by records of propositions.
-/

import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Prod

namespace RankOneConverse

variable {L S P : Type*} [Field L]
  [AddCommGroup S] [Module L S] [FiniteDimensional L S]
  [AddCommGroup P] [Module L P]

/-- The source is a line and the specified localization is injective (PC.1). -/
def RankOneLocalization (loc : S →ₗ[L] P) : Prop :=
  Module.finrank L S = 1 ∧ Function.Injective loc

theorem RankOneLocalization.finrank {loc : S →ₗ[L] P}
    (h : RankOneLocalization loc) : Module.finrank L S = 1 := by
  sorry

theorem RankOneLocalization.injective {loc : S →ₗ[L] P}
    (h : RankOneLocalization loc) : Function.Injective loc := by
  sorry

theorem rankOneLocalization_iff_ker (loc : S →ₗ[L] P) :
    RankOneLocalization loc ↔ Module.finrank L S = 1 ∧ LinearMap.ker loc = ⊥ := by
  sorry

theorem RankOneLocalization.transport
    {S' P' : Type*} [AddCommGroup S'] [Module L S'] [FiniteDimensional L S']
    [AddCommGroup P'] [Module L P']
    (eS : S ≃ₗ[L] S') (eP : P ≃ₗ[L] P') (loc : S →ₗ[L] P) :
    RankOneLocalization (eP.toLinearMap.comp (loc.comp eS.symm.toLinearMap)) ↔
      RankOneLocalization loc := by
  sorry

-- RankOneLocalization.identity (computation).
example : RankOneLocalization (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by
  sorry

-- RankOneLocalization.zero_map (non-example).
example : ¬ RankOneLocalization (0 : ℚ →ₗ[ℚ] ℚ) := by
  sorry

-- RankOneLocalization.zero_source (degenerate case).
example : ¬ RankOneLocalization (0 : (Fin 0 → ℚ) →ₗ[ℚ] ℚ) := by
  sorry

-- RankOneLocalization.transport_square (compatibility).
example (eS : S ≃ₗ[L] S) (eP : P ≃ₗ[L] P) (loc : S →ₗ[L] P) :
    RankOneLocalization (eP.toLinearMap.comp (loc.comp eS.symm.toLinearMap)) ↔
      RankOneLocalization loc := by
  sorry

section Semilocal

variable {H : Type*} [AddCommGroup H] [Module L H] [FiniteDimensional L H]
  [FiniteDimensional L P]

/-- PC.1's linear algebra milestone (Skinner Lemma 2.3.2).
Here `F` is the local finite line after identifying the two local spaces by
conjugation; `Sfin` is the actual inverse image of the product of those lines.
The symmetry is an equivalence on the global domain, not a claim that a fixed
local prime is preserved by complex conjugation.
-/
theorem strict_kernels_of_finite_image_line
    (loc : H →ₗ[L] P × P) (F : Submodule L P)
    (conj : H ≃ₗ[L] H)
    (hconj : ∀ x, loc (conj x) = ((loc x).2, (loc x).1))
    (hlocal : Module.finrank L P = 2)
    (hfinite : Module.finrank L F = 1)
    (himage : Module.finrank L (LinearMap.range loc) = 2)
    (hfinite_image : Module.finrank L
      (LinearMap.range (loc.comp (Submodule.comap loc (F.prod F)).subtype)) = 1) :
    LinearMap.ker ((LinearMap.fst L P P).comp loc) = LinearMap.ker loc ∧
      LinearMap.ker ((LinearMap.snd L P P).comp loc) = LinearMap.ker loc := by
  sorry

/-- With the rank-one localization criterion, all three rational kernels vanish.
This is a layer milestone over vector spaces; the arithmetic comparison and
identification of the cohomology spaces remain separate README obligations.
-/
theorem strict_kernels_vanish_of_rank_one_localization
    (loc : H →ₗ[L] P × P) (F : Submodule L P)
    (conj : H ≃ₗ[L] H)
    (hconj : ∀ x, loc (conj x) = ((loc x).2, (loc x).1))
    (hlocal : Module.finrank L P = 2)
    (hfinite : Module.finrank L F = 1)
    (himage : Module.finrank L (LinearMap.range loc) = 2)
    (hcriterion : RankOneLocalization
      (loc.comp (Submodule.comap loc (F.prod F)).subtype)) :
    LinearMap.ker ((LinearMap.fst L P P).comp loc) = ⊥ ∧
      LinearMap.ker loc = ⊥ ∧
      LinearMap.ker ((LinearMap.snd L P P).comp loc) = ⊥ := by
  sorry

end Semilocal
end RankOneConverse
