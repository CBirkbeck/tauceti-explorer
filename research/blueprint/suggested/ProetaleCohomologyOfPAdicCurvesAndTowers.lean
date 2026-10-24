import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Instances.Discrete
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.Algebra.Module.Submodule.Ker

/-!
# Pro-étale cohomology of p-adic curves and towers

This file suggests forms for declarations; it is not an exhaustive checklist.
The reader document is the specification. Contributors should use and extend the
existing Mathlib and Tau Ceti APIs, choosing names appropriate to the library.

Only the algebraic boundary-mass interface of H0 is statable at the pinned
baseline without developing new theory. The rigid Stein, period-sheaf, tower,
solid-support and representation carriers required by the other layers are
specified in the reader document. No placeholder carriers stand for them here.
The dual below is the existing algebraic Module.Dual; it is not a continuous
dual, a space of bounded measures, or a substitute for the analytic Steinberg
realizations. The finite-boundary examples test the algebraic interface.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

namespace TauCeti.BoundaryDistribution

variable (R X : Type*) [CommRing R] [TopologicalSpace X]

/-- Total mass is evaluation on the constant one test function. -/
def totalMass : Module.Dual R (LocallyConstant X R) →ₗ[R] R where
  toFun μ := μ (LocallyConstant.const X 1)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The mass-zero part of the algebraic dual of locally constant functions. -/
def massZero : Submodule R (Module.Dual R (LocallyConstant X R)) :=
  LinearMap.ker (totalMass R X)

/-- H0 milestone: mass zero is the annihilator of the existing constants map. -/
theorem massZero_eq_dualAnnihilator :
    massZero R X =
      (LinearMap.range (LocallyConstant.constₗ R (X := X) (Y := R))).dualAnnihilator := by
  sorry

/-- API: vanishing mass is equivalent to vanishing on every constant. -/
theorem mem_massZero_iff_constants (μ : Module.Dual R (LocallyConstant X R)) :
    μ ∈ massZero R X ↔ ∀ r : R, μ (LocallyConstant.const X r) = 0 := by
  sorry

/-- API: the difference of two point evaluations has zero mass. -/
theorem diracDifference_mem (a b : X) :
    LocallyConstant.evalₗ R a - LocallyConstant.evalₗ R b ∈ massZero R X := by
  sorry

-- A one-point boundary has no nonzero mass-zero functional.
example (μ : Module.Dual ℤ (LocallyConstant Unit ℤ)) :
    μ ∈ massZero ℤ Unit ↔ μ = 0 := by
  sorry

-- A single Dirac has mass one, so it is excluded from the kernel.
example : LocallyConstant.evalₗ ℤ true ∉ massZero ℤ Bool := by
  sorry

-- The two-point Dirac difference is a nonzero member, detecting a wrong kernel.
example :
    LocallyConstant.evalₗ ℤ true - LocallyConstant.evalₗ ℤ false ∈ massZero ℤ Bool ∧
      LocallyConstant.evalₗ ℤ (Y := ℤ) true - LocallyConstant.evalₗ ℤ false ≠ 0 := by
  sorry

-- Combining child weights 2 and -1 gives parent weight 1.
example :
    totalMass ℤ Bool
      ((2 : ℤ) • LocallyConstant.evalₗ ℤ true - LocallyConstant.evalₗ ℤ false) = 1 := by
  sorry

end TauCeti.BoundaryDistribution
