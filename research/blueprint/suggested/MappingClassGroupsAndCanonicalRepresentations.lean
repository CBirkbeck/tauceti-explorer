/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Set.Finite.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`MappingClassGroupsAndCanonicalRepresentations.md` is definitive. These statements
suggest Lean forms so contributors and reviewers can converge on names and signatures.

The pins do not supply the surface/mapping-class, pointed-moduli, analytic-sheaf,
Artinian-family or integral-variation carriers used by most targets. Those targets,
their full APIs and their discriminating tests are in the reader. They are not
replaced here by assumed predicates or mock structures. The only new definition
below has a real body on existing group carriers. It is the finite-conjugacy-orbit
core of C.0; no action of a surface mapping-class group is postulated.

The free-group end theorem can already be stated at the pins. Using Aut rather
than Out gives the same finite-conjugacy-orbit property because inner automorphisms
act by conjugation of the representation. Nothing in this file implements its proof.
-/

namespace TauCeti.SurfaceRepresentation

universe u v w

/-- Finitely many actual conjugacy classes among all automorphic pullbacks.
A finite set of representatives is used, with no semisimplification or GIT quotient. -/
def HasFiniteConjugacyOrbitUnder {A : Type u} {G : Type v} {H : Type w}
    [Group A] [Group G] [Group H] (α : A →* MulAut G) (ρ : G →* H) : Prop :=
  ∃ s : Set (G →* H), s.Finite ∧
    ∀ a : A, ∃ σ ∈ s, ∃ h : H, ∀ g : G, ρ (α a g) = h * σ g * h⁻¹

section Core

variable {A : Type u} {G : Type v} {H : Type w}
  [Group A] [Group G] [Group H]
  (α : A →* MulAut G) (ρ σ : G →* H)

/-- C.0 compatibility with actual conjugation. -/
theorem finiteConjugacyOrbitUnder_conjugate
    (h : ∃ c : H, ∀ g : G, σ g = c * ρ g * c⁻¹) :
    HasFiniteConjugacyOrbitUnder α ρ ↔ HasFiniteConjugacyOrbitUnder α σ := by
  sorry

/-- Restrict the acting group without changing the represented group. -/
theorem finiteConjugacyOrbitUnder_restrict {B : Type*} [Group B]
    (β : B →* A) (h : HasFiniteConjugacyOrbitUnder α ρ) :
    HasFiniteConjugacyOrbitUnder (α.comp β) ρ := by
  sorry

/-- A finite acting group gives a finite orbit, even if the image of ρ is infinite. -/
theorem finiteConjugacyOrbitUnder_of_finite [Finite A] :
    HasFiniteConjugacyOrbitUnder α ρ := by
  sorry

/-- Inner precomposition is actual conjugation, also for nonsplit representations. -/
theorem inner_precompose_conjugate (x : G) (g : G) :
    ρ (x * g * x⁻¹) = ρ x * ρ g * (ρ x)⁻¹ := by
  sorry

/-- Degenerate test: the trivial representation has a singleton orbit. -/
example : HasFiniteConjugacyOrbitUnder α (1 : G →* H) := by
  sorry

/-- Compatibility test: an inner action has a single actual conjugacy class. -/
example (hinner : ∀ a : A, ∃ x : G, ∀ g : G, α a g = x * g * x⁻¹) :
    HasFiniteConjugacyOrbitUnder α ρ := by
  sorry

/-- Characterisation test: the trivial action has a singleton conjugacy orbit. -/
example (htrivial : ∀ a : A, ∀ g : G, α a g = g) :
    HasFiniteConjugacyOrbitUnder α ρ := by
  sorry

/-- Non-example: a finite conjugacy orbit under a trivial action does not imply finite image. -/
example [Infinite G] :
    HasFiniteConjugacyOrbitUnder (1 : G →* MulAut G) (MonoidHom.id G) ∧
      ¬ (Set.range (MonoidHom.id G)).Finite := by
  sorry

end Core

/-- C.6, Landesman–Litt Corollary 1.6.1, p.5 of arXiv:2205.15352v4.
The proof uses the surface theorem after choosing a one- or two-punctured surface. -/
theorem freeGroup_finite_image (N g r : ℕ) (hN : N = 2 * g ∨ N = 2 * g + 1)
    (ρ : FreeGroup (Fin N) →* Matrix.GeneralLinearGroup (Fin r) ℂ)
    (horbit : HasFiniteConjugacyOrbitUnder
      (MonoidHom.id (MulAut (FreeGroup (Fin N)))) ρ)
    (hrank : r * r < g + 1) :
    (Set.range ρ).Finite := by
  sorry

/-- C.6 degenerate check: the rank-zero bound includes F₀. -/
example (ρ : FreeGroup (Fin 0) →* Matrix.GeneralLinearGroup (Fin 0) ℂ)
    (horbit : HasFiniteConjugacyOrbitUnder
      (MonoidHom.id (MulAut (FreeGroup (Fin 0)))) ρ) :
    (Set.range ρ).Finite := by
  sorry

end TauCeti.SurfaceRepresentation
