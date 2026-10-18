import Mathlib.RingTheory.LaurentSeries
import Mathlib.Topology.Algebra.FilterBasis
import Mathlib.Topology.Algebra.Nonarchimedean.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All proof holes are planning obligations, not implementations.

The typed frontier is HL.0's equal-characteristic coefficient-box topology.
Auxiliary API and all heavier targets are specified in the reader, not developed here. The remaining
source obligations need the canonical residue-tower, Milnor, wild-coefficient, and scheme
interfaces recorded in the packet's gaps. No True-valued substitute stands for those objects.
The native Laurent-series valued topology is retained explicitly in all comparisons;
higherTopology is a named definition, never a global replacement instance.
-/
noncomputable section
open Filter Set Topology
namespace HigherLaurent
variable (K : Type*) [Field K] [TopologicalSpace K]

/-- HL.0/coefficient-box: all coefficients are constrained; no tail condition here. -/
def coefficientBox (U : ℤ → OpenAddSubgroup K) : AddSubgroup (LaurentSeries K) where
  carrier := {f | ∀ i, f.coeff i ∈ U i}
  zero_mem' := by
    intro i
    simp
  add_mem' := by
    intro f g hf hg i
    rw [HahnSeries.coeff_add]
    exact (U i).add_mem (hf i) (hg i)
  neg_mem' := by
    intro f hf i
    rw [HahnSeries.coeff_neg]
    exact (U i).neg_mem (hf i)

/-- HL.0/coefficient-filter-basis: only eventual positive tails equal to the full field. -/
@[instance_reducible]
def coefficientBasis : AddGroupFilterBasis (LaurentSeries K) :=
  addGroupFilterBasisOfComm
    {S | ∃ U : ℤ → OpenAddSubgroup K,
      (∃ N : ℤ, ∀ i, N ≤ i → U i = ⊤) ∧ S = coefficientBox K U}
    (by
      refine ⟨_, ⟨fun _ => ⊤, ⟨0, fun _ _ => rfl⟩, rfl⟩⟩)
    (by
      rintro _ _ ⟨U, ⟨N, hN⟩, rfl⟩ ⟨V, ⟨M, hM⟩, rfl⟩
      refine ⟨coefficientBox K (fun i => U i ⊓ V i),
        ⟨fun i => U i ⊓ V i, ⟨max N M, ?_⟩, rfl⟩, ?_⟩
      · intro i hi
        change U i ⊓ V i = ⊤
        rw [hN i (le_trans (le_max_left _ _) hi),
          hM i (le_trans (le_max_right _ _) hi), inf_top_eq]
      · intro f hf
        exact ⟨fun i => (hf i).1, fun i => (hf i).2⟩)
    (by
      rintro _ ⟨U, hU, rfl⟩
      exact (coefficientBox K U).zero_mem)
    (by
      rintro _ hU
      rcases hU with ⟨U, hU, rfl⟩
      refine ⟨coefficientBox K U, ⟨U, hU, rfl⟩, ?_⟩
      rintro _ ⟨a, ha, b, hb, rfl⟩
      exact (coefficientBox K U).add_mem ha hb)
    (by
      rintro _ ⟨U, hU, rfl⟩
      refine ⟨coefficientBox K U, ⟨U, hU, rfl⟩, ?_⟩
      intro f hf
      exact (coefficientBox K U).neg_mem hf)
/-- HL.0/equal-characteristic-higher-topology -/
@[instance_reducible]
def higherTopology : TopologicalSpace (LaurentSeries K) :=
  (coefficientBasis K).topology
/-- HL.0/higher-topological-add-group -/
theorem higher_isTopologicalAddGroup :
    @IsTopologicalAddGroup (LaurentSeries K) (higherTopology K) _ := by sorry
variable {K}
variable [NonarchimedeanAddGroup K]
/-- HL.0/higher-coefficient-continuity -/
theorem continuous_coeff (j : ℤ) :
    @Continuous (LaurentSeries K) K (higherTopology K) inferInstance
      (fun f => f.coeff j) := by sorry
/-- HL.0/higher-single-induced-topology -/
theorem induced_single (j : ℤ) :
    TopologicalSpace.induced (fun c : K => (HahnSeries.single j c : LaurentSeries K))
      (higherTopology K) = (inferInstance : TopologicalSpace K) := by sorry
/-- HL.0/higher-hausdorff -/
theorem higher_t2 [T2Space K] : @T2Space (LaurentSeries K) (higherTopology K) := by sorry

/-- HL.0/higher-equals-outer-iff-discrete -/
theorem higherTopology_eq_outer_iff :
    higherTopology K = (inferInstance : TopologicalSpace (LaurentSeries K)) ↔
      DiscreteTopology K := by sorry
/-- higherTopology_discrete_test -/
example [DiscreteTopology K] :
    higherTopology K = (inferInstance : TopologicalSpace (LaurentSeries K)) := by sorry
/-- higherTopology_constant_sequence_test -/
example (s : ℕ → K) (hs : Tendsto s atTop (𝓝 0)) (hne : ∀ n, s n ≠ 0) :
    Tendsto (fun n => (HahnSeries.single 0 (s n) : LaurentSeries K)) atTop
      (@nhds (LaurentSeries K) (higherTopology K) 0) ∧
    ¬ Tendsto (fun n => (HahnSeries.single 0 (s n) : LaurentSeries K)) atTop
      (𝓝 0) := by sorry
/-- higherTopology_outer_ball_test -/
example (hK : ¬ DiscreteTopology K) :
    ¬ (higherTopology K).IsOpen {f : LaurentSeries K | ∀ i, i < 1 → f.coeff i = 0} := by sorry
end HigherLaurent
