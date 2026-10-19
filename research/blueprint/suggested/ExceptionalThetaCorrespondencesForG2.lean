import TauCeti.Algebra.Octonion.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Span.Basic

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures; they do not claim implementations.

The pinned libraries already supply the split octonions, their trace, norm and imaginary
submodule. The two predicates below are light definitions on those existing carriers.
The algebraic groups, minimal representations, smooth theta modules and global kernels
need carriers supplied by earlier roadmap targets; their full statements belong in the
reader document. They are not represented here by assumed structures or data definitions.

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
Sources: Gan–Savin, arXiv:2102.00372v1, §§2.1–2.4, pp. 6–8;
Savin's appendix to Harris–Khare–Thorne, arXiv:1909.05933, A.1, pp. 22–24.
-/

namespace TauCeti.ExceptionalThetaSuggested

open TauCeti

variable (F : Type*) [Field F] [CharZero F]

/-- The automorphism condition on an existing linear equivalence, without using the
associative-algebra `AlgEquiv` carrier for the nonassociative octonions. -/
def IsOctonionAutomorphism (g : Octonion F ≃ₗ[F] Octonion F) : Prop :=
  g 1 = 1 ∧ ∀ x y, g (x * y) = g x * g y

/-- Multiplication vanishes on the entire subspace, which is stronger than every
individual element being isotropic for the norm. -/
def IsNullSubspace (W : Submodule F (Octonion F)) : Prop :=
  W ≤ Octonion.imaginary F ∧ ∀ x ∈ W, ∀ y ∈ W, x * y = 0

variable {F}

-- API milestones for EX.0/octonion-group.
theorem automorphism_preserves_trace (g : Octonion F ≃ₗ[F] Octonion F)
    (hg : IsOctonionAutomorphism F g) (x : Octonion F) :
    Octonion.trace (g x) = Octonion.trace x := by
  sorry

theorem automorphism_preserves_norm (g : Octonion F ≃ₗ[F] Octonion F)
    (hg : IsOctonionAutomorphism F g) (x : Octonion F) :
    Octonion.norm (g x) = Octonion.norm x := by
  sorry

theorem automorphism_preserves_imaginary (g : Octonion F ≃ₗ[F] Octonion F)
    (hg : IsOctonionAutomorphism F g) :
    Submodule.map (g : Octonion F →ₗ[F] Octonion F) (Octonion.imaginary F) =
      Octonion.imaginary F := by
  sorry

-- Three discriminating examples for the automorphism condition.
example : IsOctonionAutomorphism F (LinearEquiv.refl F (Octonion F)) := by
  sorry

-- Conjugation fixes the unit and preserves the norm, but reverses products.
example : ∃ c : Octonion F ≃ₗ[F] Octonion F,
    (c : Octonion F →ₗ[F] Octonion F) = Octonion.conj ∧
      ¬ IsOctonionAutomorphism F c := by
  sorry

-- A diagonal element of the long-root SL₃ rescales a null vector.
example : ∃ g : Octonion F ≃ₗ[F] Octonion F,
    IsOctonionAutomorphism F g ∧
      g (⟨0, 0, ![1, 0, 0], 0⟩ : Octonion F) =
        (⟨0, 0, ![2, 0, 0], 0⟩ : Octonion F) := by
  sorry

-- API and layer milestones for EX.0/null-subspaces.
theorem null_le_imaginary {W : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) : W ≤ Octonion.imaginary F := by
  sorry

theorem null_mul_eq_zero {W : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) {x y : Octonion F} (hx : x ∈ W) (hy : y ∈ W) :
    x * y = 0 := by
  sorry

theorem null_norm_eq_zero {W : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) {x : Octonion F} (hx : x ∈ W) :
    Octonion.norm x = 0 := by
  sorry

theorem null_finrank_le_two {W : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) : Module.finrank F W ≤ 2 := by
  sorry

theorem null_map_automorphism {W : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) (g : Octonion F ≃ₗ[F] Octonion F)
    (hg : IsOctonionAutomorphism F g) :
    IsNullSubspace F (Submodule.map (g : Octonion F →ₗ[F] Octonion F) W) := by
  sorry

/-- The transitivity needed for the two maximal parabolics, before constructing
those algebraic stabilizer groups in the definitive roadmap. -/
theorem null_subspace_transitive {W W' : Submodule F (Octonion F)}
    (hW : IsNullSubspace F W) (hW' : IsNullSubspace F W')
    (hdim : Module.finrank F W = Module.finrank F W')
    (hne : 0 < Module.finrank F W) :
    ∃ g : Octonion F ≃ₗ[F] Octonion F,
      IsOctonionAutomorphism F g ∧
        Submodule.map (g : Octonion F →ₗ[F] Octonion F) W = W' := by
  sorry

-- The zero, line, plane and nonexample tests distinguish multiplication-nullity
-- from a dimension condition or a condition on the quadratic form alone.
example : IsNullSubspace F (⊥ : Submodule F (Octonion F)) := by
  sorry

example : IsNullSubspace F
    (Submodule.span F ({(⟨0, 0, ![1, 0, 0], 0⟩ : Octonion F)} : Set (Octonion F))) := by
  sorry

example : IsNullSubspace F
    (Submodule.span F
      ({(⟨0, 0, ![1, 0, 0], 0⟩ : Octonion F),
        (⟨0, 0, 0, ![0, 1, 0]⟩ : Octonion F)} : Set (Octonion F))) := by
  sorry

example : ¬ IsNullSubspace F
    (Submodule.span F ({(1 : Octonion F)} : Set (Octonion F))) := by
  sorry

-- Every vector of the following line has norm zero, but its generator has trace 1.
example : (∀ x ∈ Submodule.span F
      ({(⟨1, 0, 0, 0⟩ : Octonion F)} : Set (Octonion F)), Octonion.norm x = 0) ∧
    ¬ IsNullSubspace F (Submodule.span F
      ({(⟨1, 0, 0, 0⟩ : Octonion F)} : Set (Octonion F))) := by
  sorry

end TauCeti.ExceptionalThetaSuggested
