import Mathlib.Algebra.Lie.Killing
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Sl2
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Basic.Real.Basic
import TauCeti.Algebra.Lie.Sl2.Spectrum
import TauCeti.Algebra.Lie.Sl2.WeightMultiplicity

/-!
# Nilpotent orbits and weight patterns: selected target signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/LieHighestWeightPartII.md`. These are proposed signatures,
not proofs; `sorry` is permitted in this human-owned roadmap. Discharging the statements
here does not finish any layer.

Following WORKERS.md's compact shape, only light definitions over pinned native carriers,
end theorems or layer milestones expressible on them, and a few examples occur here.
The adjoint-group orbit category, exceptional finite certificates, half-spin comparisons,
and algebraic representation-indexed geometric patterns are README targets: their
required group/category interfaces are not provided at the pins. No dummy carriers or
sorry'd data stand in for those constructions.

Triple order is (h,e,f). Filtrations increase, and the raising operator has degree +2.
The packet records the exact pinned declarations used, including their field hypotheses.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeightPartII

universe u v w

section Triples

variable {K : Type u} [Field K] [CharZero K]
variable {L : Type v} [LieRing L] [LieAlgebra K L]

/-- N0: include the zero triple without changing Mathlib's nonzero structure. -/
def IsSl2TripleOrZero (h e f : L) : Prop :=
  (h = 0 ∧ e = 0 ∧ f = 0) ∨ IsSl2Triple h e f

/-- The defining equations characterize the adapter in characteristic zero. -/
theorem isSl2TripleOrZero_iff_relations (h e f : L) :
    IsSl2TripleOrZero h e f ↔
      ⁅e, f⁆ = h ∧ ⁅h, e⁆ = (2 : K) • e ∧ ⁅h, f⁆ = (-2 : K) • f := by
  sorry

/-- The native nonzero branch is retained exactly. -/
theorem isSl2TripleOrZero_iff_of_ne_zero {h e f : L} (hh : h ≠ 0) :
    IsSl2TripleOrZero h e f ↔ IsSl2Triple h e f := by
  sorry

/-- N0 milestone: Jacobson–Morozov, with the zero nilpotent included. -/
theorem exists_isSl2TripleOrZero [IsAlgClosed K] [FiniteDimensional K L]
    [LieAlgebra.IsKilling K L] {e : L} (he : IsNilpotent (LieAlgebra.ad K L e)) :
    ∃ h f : L, IsSl2TripleOrZero h e f := by
  sorry

/-- N0 converse: a triple supplies nilpotent raising and lowering adjoint actions. -/
theorem isNilpotent_ad_of_isSl2TripleOrZero [IsAlgClosed K] [FiniteDimensional K L]
    {h e f : L} (t : IsSl2TripleOrZero h e f) :
    IsNilpotent (LieAlgebra.ad K L e) ∧ IsNilpotent (LieAlgebra.ad K L f) := by
  sorry

example : IsSl2TripleOrZero (0 : L) 0 0 := by
  exact Or.inl ⟨rfl, rfl, rfl⟩

example {h e f : L} (t : IsSl2Triple h e f) : IsSl2TripleOrZero h e f := by
  exact Or.inr t

example : ¬ IsSl2Triple (0 : L) 0 0 := by
  sorry

end Triples

section Filtrations

variable {K : Type u} [Field K] [CharZero K]
variable {L : Type v} [LieRing L] [LieAlgebra K L]
variable (M : Type w) [AddCommGroup M] [Module K M]
variable [LieRingModule L M] [LieModule K L M]

/-- N1: a light sum of native eigenspaces. Boundedness requires the triple hypothesis. -/
noncomputable def weightFiltration (h : L) (i : ℤ) : Submodule K M :=
  ⨆ (j : ℤ) (_ : j ≤ i), (LieModule.toEnd K L M h).eigenspace (j : K)

/-- Native eigenspace dimension, before any table convention or subtraction. -/
noncomputable def weightMultiplicity (h : L) (i : ℤ) : ℕ :=
  Module.finrank K ((LieModule.toEnd K L M h).eigenspace (i : K))

/-- N1 milestone: finite spectrum makes this an increasing bounded exhaustive filtration. -/
theorem weightFiltration_bounded [IsAlgClosed K] [FiniteDimensional K M]
    {h e f : L} (t : IsSl2TripleOrZero h e f) :
    Monotone (weightFiltration (K := K) M h) ∧
      ∃ a b : ℤ, (∀ i < a, weightFiltration (K := K) M h i = ⊥) ∧
        (∀ i, b ≤ i → weightFiltration (K := K) M h i = ⊤) := by
  sorry

/-- N1 milestone: cumulative dimensions differ by the graded multiplicity. -/
theorem weightFiltration_finrank_step [IsAlgClosed K] [FiniteDimensional K M]
    {h e f : L} (t : IsSl2TripleOrZero h e f) (i : ℤ) :
    Module.finrank K (weightFiltration (K := K) M h i) =
      Module.finrank K (weightFiltration (K := K) M h (i - 1)) + weightMultiplicity (K := K) M h i := by
  sorry

/-- N1 milestone used by N3's necessary-diagram certificate. -/
theorem weightMultiplicity_sl2_inequality [IsAlgClosed K] [FiniteDimensional K M]
    {h e f : L} (t : IsSl2TripleOrZero h e f) (n : ℕ) :
    weightMultiplicity (K := K) M h ((n : ℤ) + 2) ≤ weightMultiplicity (K := K) M h (n : ℤ) := by
  sorry

/-- N1 milestone: adjacent cumulative differences recover all weight dimensions. -/
theorem filtration_dimensions_iff_weight_dimensions [IsAlgClosed K] [FiniteDimensional K M]
    {h e f h' e' f' : L} (t : IsSl2TripleOrZero h e f)
    (t' : IsSl2TripleOrZero h' e' f') :
    (∀ i, Module.finrank K (weightFiltration (K := K) M h i) =
      Module.finrank K (weightFiltration (K := K) M h' i)) ↔
      ∀ i, weightMultiplicity (K := K) M h i = weightMultiplicity (K := K) M h' i := by
  sorry

example : weightFiltration (K := K) M (0 : L) (-1) = ⊥ := by
  sorry

example : weightFiltration (K := K) M (0 : L) 0 = ⊤ := by
  sorry

end Filtrations

section RootCoset

variable {X : Type u} [AddCommGroup X]

/-- N5 milestone: half-integrality is constant along a root-lattice coset.
The roots are an abstract generating set S; its actual weight-lattice interpretation
belongs to the reader's highest-weight target. -/
theorem half_integral_iff_of_sub_mem_root_span
    (ν : X →+ ℝ) (S : Set X) (lam mu : X)
    (hroots : ∀ α ∈ S, ∃ z : ℤ, 2 * ν α = (z : ℝ))
    (hcoset : mu - lam ∈ AddSubgroup.closure S) :
    (∃ z : ℤ, 2 * ν mu = (z : ℝ)) ↔ ∃ z : ℤ, 2 * ν lam = (z : ℝ) := by
  sorry

end RootCoset

end TauCetiRoadmap.RepresentationTheory.LieHighestWeightPartII
