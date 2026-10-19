import Mathlib.RepresentationTheory.Intertwining
import Mathlib.Basic.Complex.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Fin

/-!
# Gan–Gross–Prasad: suggested signatures

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GanGrossPrasadConjecturesForClassicalGroups.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. No implementation is claimed.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

Only two light definitions over existing carriers are given: character equivariance of an
algebraic linear functional, and a finite graph sum. The former does not impose continuity;
the latter becomes a definite Shimura period only after the geometric comparison in GGP.8.

Relevant spaces over local fields, pure inner twisting, continuous Bessel models, automorphic
packets, analytic periods, local factors, distinguished tempered spectra, automorphic families,
and Shimura varieties do not have the required carriers at these pins. Their full statements,
APIs, hypotheses and discriminating checks are targets of the reader document. They are not
represented here by proxy types, assumed propositions or data definitions with missing bodies.
-/

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.GanGrossPrasadConjecturesForClassicalGroups

section AlgebraicFunctional

variable {R V : Type*} [Monoid R] [AddCommGroup V] [Module ℂ V]

/-- GGP.0: the algebraic equivariance condition, without a topology assertion. -/
def IsBesselFunctional (ρ : Representation ℂ R V) (χ : R →* ℂ) (L : V →ₗ[ℂ] ℂ) : Prop :=
  ∀ r v, L (ρ r v) = χ r * L v

variable (ρ : Representation ℂ R V) (χ : R →* ℂ)

 theorem IsBesselFunctional.zero : IsBesselFunctional ρ χ (0 : V →ₗ[ℂ] ℂ) := by
  sorry

 theorem IsBesselFunctional.smul (L : V →ₗ[ℂ] ℂ) (hL : IsBesselFunctional ρ χ L)
    (c : ℂ) : IsBesselFunctional ρ χ (c • L) := by
  sorry

 theorem IsBesselFunctional.trivial_iff (L : V →ₗ[ℂ] ℂ) :
    IsBesselFunctional ρ (1 : R →* ℂ) L ↔ ∀ r v, L (ρ r v) = L v := by
  sorry

 theorem IsBesselFunctional.trivialCharacter_ne :
    IsBesselFunctional (Representation.trivial ℂ R ℂ) χ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) ↔
      χ = 1 := by
  sorry

-- The zero map cannot witness a nonzero Bessel model.
example : IsBesselFunctional ρ χ (0 : V →ₗ[ℂ] ℂ) := by
  sorry

example : IsBesselFunctional (Representation.trivial ℂ R ℂ) (1 : R →* ℂ)
    (LinearMap.id : ℂ →ₗ[ℂ] ℂ) := by
  sorry

example (hχ : χ ≠ 1) :
    ¬ IsBesselFunctional (Representation.trivial ℂ R ℂ) χ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) := by
  sorry

end AlgebraicFunctional

section FiniteGraphPeriod

/-- GGP.8: the finite graph sum on existing finite carriers. -/
def diagonalPeriod {S T A : Type*} [Fintype S] [AddCommMonoid A]
    (ι : S → T) (f : S × T → A) : A :=
  ∑ s, f (s, ι s)

variable {S T : Type*} [Fintype S]

 theorem diagonalPeriod_add (ι : S → T) (f g : S × T → ℂ) :
    diagonalPeriod ι (f + g) = diagonalPeriod ι f + diagonalPeriod ι g := by
  sorry

 theorem diagonalPeriod_smul (ι : S → T) (f : S × T → ℂ) (c : ℂ) :
    diagonalPeriod ι (c • f) = c • diagonalPeriod ι f := by
  sorry

 theorem diagonalPeriod_reindex {S' : Type*} [Fintype S']
    (e : S' ≃ S) (ι : S → T) (f : S × T → ℂ) :
    diagonalPeriod (ι ∘ e) (fun p => f (e p.1, p.2)) = diagonalPeriod ι f := by
  sorry

 theorem diagonalPeriod_one (ι : S → T) :
    diagonalPeriod ι (fun _ => (1 : ℂ)) = Fintype.card S := by
  sorry

 theorem diagonalPeriod_indicator [DecidableEq S] [DecidableEq T]
    (ι : S → T) (s₀ : S) (t₀ : T) :
    diagonalPeriod ι (fun p => if p = (s₀, t₀) then (1 : ℂ) else 0) =
      if ι s₀ = t₀ then 1 else 0 := by
  sorry

example (ι : Fin 0 → T) (f : Fin 0 × T → ℂ) : diagonalPeriod ι f = 0 := by
  sorry

example : diagonalPeriod (id : Fin 2 → Fin 2)
    (fun p => if p.1 = p.2 then (1 : ℂ) else 0) = 2 := by
  sorry

example : diagonalPeriod (id : Fin 2 → Fin 2)
    (fun p => if p.1 ≠ p.2 then (1 : ℂ) else 0) = 0 := by
  sorry

end FiniteGraphPeriod

end TauCetiRoadmap.GanGrossPrasadConjecturesForClassicalGroups
