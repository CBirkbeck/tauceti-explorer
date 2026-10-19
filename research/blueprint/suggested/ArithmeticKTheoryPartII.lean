import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Module.LinearMap.Prod
import Mathlib.Data.ZMod.Basic

/-!
# Arithmetic K-theory, Part II: suggested statements

The reader document is definitive and contains every target, hypothesis,
API, source locator and Check. This file is not the roadmap or an exhaustive
checklist; it suggests names and signatures for contributors and reviewers.
It uses the carriers present at Mathlib 082e2d3 and Tau Ceti f790474.
The two definitions are real-bodied formulas on existing linear maps.
Missing KSp, spectra, CM moduli and relative homology carriers remain reader targets.

The formulas below pin the left-coefficient cocycle convention used in AK2.5
and the factor two in the hyperbolic normalization of AK2.1/AK2.6. Admitted
proofs are suggested work, not implementation claims.
-/

namespace ArithmeticKTheoryPartIISuggested

universe u v w x

variable {R : Type u} [CommRing R]
variable {G : Type v} [Group G]
variable {M : Type w} [AddCommGroup M] [Module R M]
variable {V : Type x} [AddCommGroup V] [Module R V]

/-- AK2.5: the defect of a supplied linear section under the two actions. -/
def sectionDefect (ρ : Representation R G M) (σ : Representation R G V)
    (s : M →ₗ[R] V) (g : G) : M →ₗ[R] V :=
  (σ g).comp s - s.comp (ρ g)

/-- AK2.5: relative cocycles with trivial action on their target module. -/
def IsRelativeCocycle (H : Subgroup G) (ρ : Representation R G M)
    (α : G → M →ₗ[R] V) : Prop :=
  (∀ h : H, α h = 0) ∧
    ∀ g g' : G, α (g * g') = (α g).comp (ρ g') + α g'

/-- A defect is in the kernel of the equivariant projection. -/
theorem sectionDefect_mem_ker (ρ : Representation R G M) (σ : Representation R G V)
    (π : V →ₗ[R] M) (s : M →ₗ[R] V)
    (hπ : ∀ g, π.comp (σ g) = (ρ g).comp π)
    (hs : π.comp s = LinearMap.id) (g : G) (m : M) :
    sectionDefect ρ σ s g m ∈ LinearMap.ker π := by
  sorry

/-- Trivial kernel action gives the relative cocycle identity, with the action
on m on the first term. The section equation is π ∘ s = id. -/
theorem sectionDefect_isRelativeCocycle
    (H : Subgroup G) (ρ : Representation R G M) (σ : Representation R G V)
    (π : V →ₗ[R] M) (s : M →ₗ[R] V)
    (hπ : ∀ g, π.comp (σ g) = (ρ g).comp π)
    (hs : π.comp s = LinearMap.id)
    (hfixed : ∀ g v, π v = 0 → σ g v = v)
    (hH : ∀ h : H, (σ h).comp s = s.comp (ρ h)) :
    IsRelativeCocycle H ρ (sectionDefect ρ σ s) := by
  sorry

/-- With H=G there are no nonzero relative cocycles. -/
theorem isRelativeCocycle_top_iff (ρ : Representation R G M)
    (α : G → M →ₗ[R] V) :
    IsRelativeCocycle (⊤ : Subgroup G) ρ α ↔ ∀ g, α g = 0 := by
  sorry

/-- The zero cocycle is valid for every subgroup and every source action. -/
example (H : Subgroup G) (ρ : Representation R G M) :
    IsRelativeCocycle H ρ (fun _ => (0 : M →ₗ[R] V)) := by
  sorry

/-- A genuinely equivariant section has zero defect. -/
example (ρ : Representation R G M) (g : G) :
    sectionDefect ρ ρ (LinearMap.id : M →ₗ[R] M) g = 0 := by
  sorry

/-- For a trivial action of the infinite cyclic group the cocycle records its
integer generator. This detects swapping a relative cocycle for a zero map. -/
example : IsRelativeCocycle (⊥ : Subgroup (Multiplicative ℤ))
    (Representation.trivial ℤ (Multiplicative ℤ) ℤ)
    (fun g => g.toAdd • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := by
  sorry

/-- AK2.1: two remains different from one when two is inverted. -/
example : (2 : ℚ) ≠ 1 := by
  sorry

/-- AK2.6: the unscaled factor-two map has retraction scaled by one half. -/
example (x : ℚ) : (1 / 2 : ℚ) * (2 * x) = x := by
  sorry

/-- AK2.3: a one-pair change of type at q=5 has a unit Hodge difference. -/
example : IsUnit (((1 + 2 : ZMod 5) - ((-1) + 2 : ZMod 5))) := by
  sorry

/-- AK2.5: a C₃ action by 2 has inverse action by 4 over F₇. Its two
degree-one boundaries differ, so a sign C₂ example alone misses this issue. -/
example : ((2 : ZMod 7) * 4 = 1) ∧
    ((2 : ZMod 7) - 1 ≠ (4 : ZMod 7) - 1) := by
  decide

/-- AK2.7: the nonzero relative sign cocycle gives an involution on the
universal middle module; the same formula survives coefficient reduction. -/
example (m t : ZMod 5) : (-(-m), (t + m) + (-m)) = (m, t) := by
  simp

end ArithmeticKTheoryPartIISuggested
