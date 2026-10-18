import Mathlib.Algebra.Ring.Pi
import Mathlib.Algebra.DualNumber
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The companion README is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Admissions are specifications,
not implementation claims.

The one definition below is the polynomial coordinate map on actual native
products of function spaces. It is the section coordinate of the split
Abel–Jacobi chart; the chart ALSO retains the root coordinate. In particular,
this function is not asserted to be an isomorphism or a linear map.

Geometric omission ledger (the README gives the complete targets and tests):
* GC.4/family-fibre-presentation: the actual root Picard and section stacks,
  their two-fibre, relative evaluation sequence, scheme open and chart
  transition morphisms are not carriers at the pins.
* GC.4/relative-projective-quotient: the actual quotient stack, scalar
  2-equivariance, projective cover, proper tame DM morphism and its finite
  étale covers are not carriers at the pins.
* GC.4/chart-descent-line: lisse sheaves on those stacks, proper H⁰ base
  change, compatible adic coefficients and their adjunction are not available
  as typed interfaces at the pins.
* GC.4/high-degree-effective-descent: the actual inverse-image functor,
  fully faithful descent and its normalized uniqueness therefore remain
  README targets, as do all eight imported parent GC.4 geometric targets.

No arbitrary carrier or predicate-valued substitute is supplied for them.
-/

namespace TauCeti.RamifiedClassField

universe u v w

variable {A : Type u} {I : Type v} {J : Type w}

/-- Section coordinates after splitting evaluation: `(u, α) ↦ (u, α²)`. -/
def quadraticSection [CommRing A] (v : (I → A) × (J → A)) :
    (I → A) × (J → A) :=
  (v.1, fun j => v.2 j ^ 2)

namespace quadraticSection

variable [CommRing A]

theorem kernelCoordinates (v : (I → A) × (J → A)) :
    (quadraticSection v).1 = v.1 := by
  sorry

theorem rootCoordinates (v : (I → A) × (J → A)) (j : J) :
    (quadraticSection v).2 j = v.2 j ^ 2 := by
  sorry

theorem baseChange {B : Type*} [CommRing B] (f : A →+* B)
    (v : (I → A) × (J → A)) :
    quadraticSection (f ∘ v.1, f ∘ v.2) =
      (f ∘ (quadraticSection v).1, f ∘ (quadraticSection v).2) := by
  sorry

/-- Weight two on the kernel block, weight one on the root block. -/
theorem weighted (c : A) (v : (I → A) × (J → A)) :
    quadraticSection (fun i => c ^ 2 * v.1 i, fun j => c * v.2 j) =
      (fun i => c ^ 2 * (quadraticSection v).1 i,
        fun j => c ^ 2 * (quadraticSection v).2 j) := by
  sorry

/-- Only a reduced coefficient ring allows this test on raw ring-valued points. -/
theorem zero_iff [IsReduced A] (v : (I → A) × (J → A)) :
    quadraticSection v = 0 ↔ v = 0 := by
  sorry

-- test_small: a linear or all-squared coordinate map fails this.
example : quadraticSection ((fun _ : Fin 1 => (2 : ℤ)), fun _ : Fin 1 => (3 : ℤ)) =
    ((fun _ : Fin 1 => (2 : ℤ)), fun _ : Fin 1 => (9 : ℤ)) := by
  sorry

-- test_empty_root: agreement with the identity section coordinate for R empty.
example (u : I → A) (a : Fin 0 → A) : quadraticSection (u, a) = (u, a) := by
  sorry

-- test_not_injective: the full chart must retain α as well as this section.
example : quadraticSection ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (1 : ℤ)) =
      quadraticSection ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (-1 : ℤ)) ∧
    ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (1 : ℤ)) ≠
      ((fun _ : Fin 1 => (0 : ℤ)), fun _ : Fin 1 => (-1 : ℤ)) := by
  sorry

-- test_nilpotent: a nonzero ring-valued tuple can have zero section coordinate.
example :
    quadraticSection
        ((fun _ : Fin 1 => (0 : DualNumber (ZMod 3))),
          fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) = 0 ∧
      ((fun _ : Fin 1 => (0 : DualNumber (ZMod 3))),
        fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) ≠ 0 := by
  sorry

-- test_effective_nilpotent: a unit kernel coordinate retains nilpotent α.
example :
    quadraticSection
        ((fun _ : Fin 1 => (1 : DualNumber (ZMod 3))),
          fun _ : Fin 1 => (DualNumber.eps : DualNumber (ZMod 3))) =
      ((fun _ : Fin 1 => (1 : DualNumber (ZMod 3))),
        fun _ : Fin 1 => (0 : DualNumber (ZMod 3))) := by
  sorry

end quadraticSection

end TauCeti.RamifiedClassField
