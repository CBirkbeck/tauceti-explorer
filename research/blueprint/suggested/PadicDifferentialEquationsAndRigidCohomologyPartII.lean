import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Topology.MetricSpace.Bounded

/-!
This file is not the roadmap and is not an exhaustive checklist. The accompanying
Markdown is definitive; these declarations suggest forms for targets whose
carriers already exist at the pinned libraries. Heavy analytic rings, PBQ
objects, saturation, isocrystal categories and dagger hulls remain README targets.
No theorem about those missing carriers is encoded by an arbitrary proposition.

The first block checks the quotient/image convention used in MS.3 and MS.5.
The second gives the finite averaging interface used by MS.6, reusing Mathlib's
average rather than defining another Reynolds operator. The final block states
the concrete coefficient tests of MS.0 and the coefficient-projector test of MS.6.
-/

namespace TauCeti.RigidCohomology.MinimalSlope.Suggested

section Images

variable {K V W : Type*} [Field K] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W]

-- The real image quotient is already supplied by Mathlib.
example (f : V →ₗ[K] W) (v : V) :
    (f.quotKerEquivRange (Submodule.Quotient.mk v) : W) = f v := by
  rfl

-- Saturation must remove the kernel: the elementary split test has rank one.
example : LinearMap.ker (LinearMap.fst ℚ ℚ ℚ) ≠ ⊥ := by
  sorry

example : LinearMap.range (LinearMap.fst ℚ ℚ ℚ) = ⊤ := by
  sorry

example : LinearMap.ker (0 : ℚ →ₗ[ℚ] ℚ) = ⊤ := by
  simp

end Images

section Averaging

variable {K G V W : Type*} [Field K] [Group G] [Fintype G]
  [Invertible (Fintype.card G : K)]
  [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]

-- The invariant image and identity laws are baseline declarations.
example (ρ : Representation K G V) (v : V) :
    ρ.averageMap v ∈ ρ.invariants :=
  ρ.averageMap_invariant v

example (ρ : Representation K G V) (v : V) (hv : v ∈ ρ.invariants) :
    ρ.averageMap v = v :=
  ρ.averageMap_id v hv

-- A quotient map constant on the orbit keeps the prescribed value after averaging.
-- This is a milestone on existing linear carriers; descent of isocrystal maps is
-- still the mathematical target MS.6/projected-trace in the README.
theorem average_preserves_quotient (ρ : Representation K G V)
    (π : V →ₗ[K] W) (v : V) (h : ∀ g : G, π (ρ g v) = π v) :
    π (ρ.averageMap v) = π v := by
  sorry

example (ρ : Representation K G V) (v : V) :
    ρ.averageMap (ρ.averageMap v) = ρ.averageMap v := by
  exact ρ.averageMap_id _ (ρ.averageMap_invariant v)

end Averaging

section Coefficients

variable (p : ℕ) [Fact p.Prime]

-- Coefficients of log(1+u) are unbounded along n=p^r. This checks the
-- solvable/bounded distinction without introducing a private analytic carrier.
example (r : ℕ) :
    ‖((p : ℚ_[p]) ^ r)⁻¹‖ = (p : ℝ) ^ r := by
  sorry

theorem logarithm_coefficients_unbounded :
    ¬ Bornology.IsBounded (Set.range (fun n : ℕ => ((n + 1 : ℕ) : ℚ_[p])⁻¹)) := by
  sorry

-- Growth at most one uses the real index, independently of p-adic norm.
theorem logarithm_coefficients_growth (n : ℕ) :
    ‖((n + 1 : ℕ) : ℚ_[p])⁻¹‖ ≤ (n : ℝ) + 1 := by
  sorry

-- Multiplication by the chosen primitive coefficient idempotent.
noncomputable def firstCoefficientProjector :
    (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ) where
  toFun v := fun i => if i = 0 then v i else 0
  map_add' v w := by
    funext i
    split <;> simp_all
  map_smul' a v := by
    funext i
    split <;> simp_all

example : LinearMap.trace ℚ (Fin 2 → ℚ) firstCoefficientProjector = 1 := by
  sorry

example : LinearMap.trace ℚ (Fin 2 → ℚ) LinearMap.id = 2 := by
  sorry

example (v : Fin 2 → ℚ) :
    firstCoefficientProjector (firstCoefficientProjector v) = firstCoefficientProjector v := by
  funext i
  simp only [firstCoefficientProjector, LinearMap.coe_mk, AddHom.coe_mk]
  split <;> simp_all

end Coefficients

end TauCeti.RigidCohomology.MinimalSlope.Suggested
