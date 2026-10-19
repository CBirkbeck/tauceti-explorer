import Mathlib

/-!
# MC.2: realizations and cycle-class compatibility

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.2.md` is definitive.
These suggested forms let contributors and reviewers converge on names and
signatures; they claim no implementation.

The pinned libraries have neither the geometric realization systems nor the
Chow-motive comparison carriers required for the headline statements. Those
statements, their normalization equations, all five definition/construction
APIs and their twenty discriminating tests therefore remain README targets.
No opaque motive/cohomology carrier or admitted data definition is introduced.

The two statements below are the range/kernel parts of the comparison proof,
on existing linear-map carriers. They are not substitutes for the geometric
comparison theorem. In particular `comparison_on_images` should use the existing
`LinearEquiv.ofSubmodules`, `LinearMap.range_comp` and `LinearEquiv.range_comp`,
not introduce a new image construction. No light definition is retained here,
so there are no executable examples of newly defined objects.
-/

namespace TauCeti.Motives.MC2

variable {F : Type*} [Field F]
variable {V V' W W' : Type*}
variable [AddCommGroup V] [Module F V]
variable [AddCommGroup V'] [Module F V']
variable [AddCommGroup W] [Module F W]
variable [AddCommGroup W'] [Module F W']

/-- The zero-action check used when comparing homological kernels: an
intertwining pair of coefficient-space equivalences detects a zero map.
The geometric cycle-class-to-action identification is a separate README target. -/
theorem comparison_kernel_iff
    (a : V →ₗ[F] W) (b : V' →ₗ[F] W')
    (e : V ≃ₗ[F] V') (f : W ≃ₗ[F] W')
    (h : f.toLinearMap.comp a = b.comp e.toLinearMap) :
    a = 0 ↔ b = 0 := by
  sorry

/-- The component of an ambient comparison restricts to the images of
intertwined endomorphisms. In the motivic application these endomorphisms
are projector actions. Idempotence is unnecessary for this restriction step. -/
theorem comparison_on_images
    (e : V ≃ₗ[F] W) (p : V →ₗ[F] V) (q : W →ₗ[F] W)
    (h : e.toLinearMap.comp p = q.comp e.toLinearMap) :
    ∃ e' : LinearMap.range p ≃ₗ[F] LinearMap.range q,
      ∀ v : LinearMap.range p, (e' v : W) = e (v : V) := by
  sorry

end TauCeti.Motives.MC2
