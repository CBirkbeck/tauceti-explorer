import TauCeti.Algebra.AlgebraicGroup.Hopf.Conjugation
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.GroupTheory.GroupAction.Quotient

/-!
# Reductive algebraic groups, Part III

The README is the definitive specification. These are suggested forms, not an exhaustive
checklist. Heavy scheme, torus and Hodge constructions are README targets: their carriers
and comparison interfaces must be built before their statements can be expressed here.
This sketch uses existing pinned carriers, one real-bodied light definition, end statements
and examples. It develops no new algebraic-group theory.
-/

open TensorProduct WithConv

namespace TauCetiRoadmap.ReductiveGroupsPartIII

universe u v w

section ClassFunctions

variable (R : Type u) (H : Type v) [CommSemiring R] [CommSemiring H]
variable [HopfAlgebra R H]

/-- RG3.0: the conjugator is in the first tensor factor, so invariance compares
with the second-factor inclusion. -/
noncomputable def classFunctionSubalgebra : Subalgebra R H :=
  AlgHom.equalizer (TauCeti.HopfAlgebra.conjugationAlgHom (R := R) (H := H))
    Algebra.TensorProduct.includeRight

variable {R H}

/-- The coordinate characterization of a regular class function. -/
theorem classFunctionSubalgebra_mem_iff (h : H) :
    h ∈ classFunctionSubalgebra R H ↔
      TauCeti.HopfAlgebra.conjugationAlgHom (R := R) h =
        Algebra.TensorProduct.includeRight h := by
  sorry

/-- Invariance is tested on every algebra of points, including nonreduced algebras. -/
theorem classFunctionSubalgebra_eval_conj
    {A : Type w} [CommSemiring A] [Algebra R A]
    (h : H) (hh : h ∈ classFunctionSubalgebra R H)
    (g x : WithConv (H →ₐ[R] A)) :
    (g * x * g⁻¹).ofConv h = x.ofConv h := by
  sorry

/-- Scalars are regular class functions. -/
theorem classFunctionSubalgebra_algebraMap_mem (r : R) :
    algebraMap R H r ∈ classFunctionSubalgebra R H := by
  sorry

/-- Pullback along the corresponding group morphism preserves regular class functions. -/
theorem classFunctionSubalgebra_map_mem
    {K : Type w} [CommSemiring K] [HopfAlgebra R K]
    (f : H →ₐc[R] K) (h : H) (hh : h ∈ classFunctionSubalgebra R H) :
    f h ∈ classFunctionSubalgebra R K := by
  sorry

/-- A coordinate algebra with trivial conjugation has every regular function invariant. -/
theorem classFunctionSubalgebra_eq_top
    (hc : TauCeti.HopfAlgebra.conjugationAlgHom (R := R) (H := H) =
      Algebra.TensorProduct.includeRight) :
    classFunctionSubalgebra R H = ⊤ := by
  sorry

/-- Scalar example, including zero. -/
example : (0 : H) ∈ classFunctionSubalgebra R H := by
  sorry

/-- Multiplication belongs to the actual subalgebra API. -/
example (h k : H) (hh : h ∈ classFunctionSubalgebra R H)
    (hk : k ∈ classFunctionSubalgebra R H) :
    h * k ∈ classFunctionSubalgebra R H := by
  sorry

/-- The trivial-conjugation case keeps all coordinate functions, not only scalars. -/
example (hc : TauCeti.HopfAlgebra.conjugationAlgHom (R := R) (H := H) =
    Algebra.TensorProduct.includeRight) (h : H) :
    h ∈ classFunctionSubalgebra R H := by
  sorry

end ClassFunctions

section FiniteConjugacy

/-- RG3.1, Jordan's criterion: no proper subgroup meets every conjugacy class.
The proof target uses Burnside counting on the coset action. -/
theorem subgroup_eq_top_of_meets_every_conjugacy_class
    {Γ : Type u} [Group Γ] [Finite Γ] (Δ : Subgroup Γ)
    (hmeets : ∀ g : Γ, ∃ d ∈ Δ, IsConj g d) : Δ = ⊤ := by
  sorry

/-- A proper subgroup has an omitted conjugacy class. -/
example {Γ : Type u} [Group Γ] [Finite Γ] (Δ : Subgroup Γ) (hΔ : Δ ≠ ⊤) :
    ∃ g : Γ, ∀ d ∈ Δ, ¬ IsConj g d := by
  sorry

end FiniteConjugacy

end TauCetiRoadmap.ReductiveGroupsPartIII
