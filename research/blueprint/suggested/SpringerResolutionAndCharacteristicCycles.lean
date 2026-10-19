import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.Module.Submodule.Ker

/-!
# Suggested statements for Springer resolutions and characteristic cycles

This file is not the roadmap and is not exhaustive. The companion reader document
is definitive. These signatures suggest Lean forms so contributors and reviewers
can converge on names and signatures. The geometric and D-module carriers missing
at the pins remain targets in that document. No implementation is asserted.

Only the cycle-group algebra and the fixed-subspace conventions can be stated
directly here. The two definitions below have real bodies over native Finsupp and
linear maps; their geometric inputs are constructed in the reader's E layer.
-/

noncomputable section

namespace TauCeti.SpringerResolutionAndCharacteristicCycles

/-! ## N/T: the inverse Weyl coordinate and the fixed-space condition -/

section Cartan

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- N/cartan-relation: the first coordinate is obtained by applying `w` to the second.
The geometric theorem supplies this hypothesis on the incidence component. -/
theorem cartan_coordinate_inverse (w : V ≃ₗ[k] V) (z z' : V)
    (h : w z' = z) : z' = w.symm z := by
  sorry

/-- T/tangent-space-bound: simultaneous graph relations constrain the toral tangent.
Here `w * v⁻¹` is written explicitly as composition of the native linear maps. -/
theorem toral_tangent_fixed (w v : V ≃ₗ[k] V) (z z' : V)
    (hw : w z' = z) (hv : v z' = z) :
    z ∈ LinearMap.ker
      (w.toLinearMap.comp v.symm.toLinearMap - LinearMap.id) := by
  sorry

/-- The signed cotangent pair has zero diagonal moment map. -/
example (z : V) : -z + z = 0 := by
  sorry

/-- For the nontrivial reflection in rank one, the fixed toral tangent is zero. -/
example [CharZero k] (z : k) (h : -z = z) : z = 0 := by
  sorry

end Cartan

/-! ## K: the integral basis consequence of Bruhat triangularity -/

/-- K/three-bases: a finite unitriangular integral family is a basis.
The geometric inputs are positivity/support and diagonal multiplicity one.
There is no choice of an order on the coefficient field: coefficients are integers. -/
theorem cycle_basis_of_unitriangular {ι : Type*} [Fintype ι] [PartialOrder ι]
    (b : ι → ι →₀ ℤ)
    (hdiag : ∀ i, b i i = 1)
    (hsupport : ∀ i j, b i j ≠ 0 → j ≤ i) :
    ∃ e : (ι →₀ ℤ) ≃ₗ[ℤ] (ι →₀ ℤ),
      ∀ i, e (Finsupp.single i 1) = b i := by
  sorry

/-! ## E: completion keeps multiplicities and all formal branches -/

variable {ι κ : Type*}

/-- E/completion-cycle-map, after the geometric component images are constructed.
A single global component may map to a sum of formal-branch components. -/
def completionCycleMap (branch : ι → κ →₀ ℤ) :
    (ι →₀ ℤ) →ₗ[ℤ] (κ →₀ ℤ) :=
  Finsupp.linearCombination ℤ branch

/-- CompletedCycle.component on the native component group. -/
theorem completionCycleMap_component (branch : ι → κ →₀ ℤ) (i : ι) :
    completionCycleMap branch (Finsupp.single i 1) = branch i := by
  sorry

/-- CompletedCycle.add. -/
theorem completionCycleMap_add (branch : ι → κ →₀ ℤ) (a b : ι →₀ ℤ) :
    completionCycleMap branch (a + b) =
      completionCycleMap branch a + completionCycleMap branch b := by
  sorry

/-- E/completed-simple-cycles on component coefficients. -/
def completedSimpleCycle (branch : ι → κ →₀ ℤ)
    (simple : ι → ι →₀ ℤ) (w : ι) : κ →₀ ℤ :=
  completionCycleMap branch (simple w)

/-- CompletedSimpleCycle.expansion: the same integral simple coefficients are used. -/
theorem completedSimpleCycle_expansion (branch : ι → κ →₀ ℤ)
    (simple : ι → ι →₀ ℤ) (w : ι) :
    completedSimpleCycle branch simple w =
      (simple w).sum (fun v a => a • branch v) := by
  sorry

/-- E/completed-kl-identity: once geometric completion gives `branch`, the
uncompleted cycle identity transports to the same completed coefficients. -/
theorem completed_kl_cycle_identity (branch : ι → κ →₀ ℤ)
    (simple : ι → ι →₀ ℤ) (multiplicity zeroFibre : ι → ι →₀ ℤ)
    (htransition : ∀ w,
      zeroFibre w = Finsupp.linearCombination ℤ simple (multiplicity w))
    (w : ι) :
    completionCycleMap branch (zeroFibre w) =
      Finsupp.linearCombination ℤ
        (completedSimpleCycle branch simple) (multiplicity w) := by
  sorry

/-- A missing global component contributes zero. -/
example (branch : ι → κ →₀ ℤ) (i : ι) (h : branch i = 0) :
    completionCycleMap branch (Finsupp.single i 1) = 0 := by
  sorry

/-- A global component with two formal branches contributes both branches. -/
example (branch : Unit → Bool →₀ ℤ)
    (h : branch () = Finsupp.single false 1 + Finsupp.single true 1) :
    completionCycleMap branch (Finsupp.single () 1) =
      Finsupp.single false 1 + Finsupp.single true 1 := by
  sorry

/-- Generic multiplicity two stays two under a one-branch completion. -/
example (branch : Unit → Unit →₀ ℤ) (h : branch () = Finsupp.single () 1) :
    completionCycleMap branch (Finsupp.single () 2) = Finsupp.single () 2 := by
  sorry

/-- CompletedSimpleCycle.torus on the sole component. -/
example (branch simple : Unit → Unit →₀ ℤ)
    (hb : branch () = Finsupp.single () 1)
    (hs : simple () = Finsupp.single () 1) :
    completedSimpleCycle branch simple () = Finsupp.single () 1 := by
  sorry

/-- A simple cycle whose only component misses the point vanishes. -/
example (branch : ι → κ →₀ ℤ) (simple : ι → ι →₀ ℤ) (w i : ι)
    (hs : simple w = Finsupp.single i 1) (hb : branch i = 0) :
    completedSimpleCycle branch simple w = 0 := by
  sorry

end TauCeti.SpringerResolutionAndCharacteristicCycles
