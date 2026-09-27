import Mathlib.RingTheory.LaurentSeries
import Mathlib.Topology.Algebra.FilterBasis
import Mathlib.Topology.Algebra.Nonarchimedean.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All proof holes are planning obligations, not implementations.

The typed frontier is HL.0's equal-characteristic coefficient-box topology. The remaining
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
def coefficientBox (U : ℤ → OpenAddSubgroup K) : AddSubgroup (LaurentSeries K) := by sorry

variable {K}
/-- HL.0/coefficient-box-membership -/
theorem mem_coefficientBox (U : ℤ → OpenAddSubgroup K) (f : LaurentSeries K) :
    f ∈ coefficientBox K U ↔ ∀ i, f.coeff i ∈ U i := by sorry

/-- HL.0/coefficient-box-single -/
theorem single_mem_coefficientBox (U : ℤ → OpenAddSubgroup K) (j : ℤ) (c : K) :
    HahnSeries.single j c ∈ coefficientBox K U ↔ c ∈ U j := by sorry

/-- HL.0/coefficient-box-intersection -/
theorem coefficientBox_inf (U V : ℤ → OpenAddSubgroup K) :
    coefficientBox K (fun i => U i ⊓ V i) = coefficientBox K U ⊓ coefficientBox K V := by sorry

/-- HL.0/coefficient-box-tail -/
theorem tail_subset_coefficientBox (U : ℤ → OpenAddSubgroup K) (N : ℤ)
    (hN : ∀ i, N ≤ i → U i = ⊤) :
    {f : LaurentSeries K | ∀ i, i < N → f.coeff i = 0} ⊆ coefficientBox K U := by sorry

/-- coefficientBox_top_test -/
example : coefficientBox K (fun _ => ⊤) = ⊤ := by sorry
/-- coefficientBox_single_test -/
example (U : ℤ → OpenAddSubgroup K) (j : ℤ) (c : K) (hc : c ∉ U j) :
    HahnSeries.single j c ∉ coefficientBox K U := by sorry
/-- coefficientBox_intersection_test -/
example (U V : ℤ → OpenAddSubgroup K) (f : LaurentSeries K) :
    f ∈ coefficientBox K (fun i => U i ⊓ V i) ↔
      f ∈ coefficientBox K U ∧ f ∈ coefficientBox K V := by sorry

variable (K)
/-- HL.0/coefficient-filter-basis: only eventual positive tails equal to the full field. -/
@[instance_reducible]
def coefficientBasis : AddGroupFilterBasis (LaurentSeries K) := by sorry
variable {K}
/-- HL.0/coefficient-filter-basis-membership -/
theorem mem_coefficientBasis (S : Set (LaurentSeries K)) :
    S ∈ (coefficientBasis K).sets ↔ ∃ U : ℤ → OpenAddSubgroup K,
      (∃ N : ℤ, ∀ i, N ≤ i → U i = ⊤) ∧ S = coefficientBox K U := by sorry

/-- API introduction form of basis-set membership. -/
theorem coefficientBox_mem_basis (U : ℤ → OpenAddSubgroup K)
    (hU : ∃ N : ℤ, ∀ i, N ≤ i → U i = ⊤) :
    (coefficientBox K U : Set (LaurentSeries K)) ∈ (coefficientBasis K).sets := by sorry

/-- coefficientBasis_top_test -/
example : Set.univ ∈ (coefficientBasis K).sets := by sorry
/-- coefficientBasis_tail_direction_test -/
example (U : ℤ → OpenAddSubgroup K) (h : ∀ i ≥ 0, U i = ⊤) :
    (coefficientBox K U : Set (LaurentSeries K)) ∈ (coefficientBasis K).sets := by sorry
/-- coefficientBasis_uniform_constraint_test -/
example (V : OpenAddSubgroup K) (hV : V ≠ ⊤) :
    (coefficientBox K (fun _ => V) : Set (LaurentSeries K)) ∉
      (coefficientBasis K).sets := by sorry

variable (K)
/-- HL.0/equal-characteristic-higher-topology -/
@[instance_reducible]
def higherTopology : TopologicalSpace (LaurentSeries K) := by sorry
/-- API specifying the topology through the native additive-group basis construction. -/
theorem higherTopology_eq_basis : higherTopology K = (coefficientBasis K).topology := by sorry
/-- HL.0/higher-topological-add-group -/
theorem higher_isTopologicalAddGroup :
    @IsTopologicalAddGroup (LaurentSeries K) (higherTopology K) _ := by sorry
variable {K}
/-- HL.0/higher-neighborhood-basis -/
theorem mem_nhds_zero_iff (S : Set (LaurentSeries K)) :
    S ∈ @nhds (LaurentSeries K) (higherTopology K) 0 ↔
      ∃ U : ℤ → OpenAddSubgroup K,
        (∃ N : ℤ, ∀ i, N ≤ i → U i = ⊤) ∧
          (coefficientBox K U : Set (LaurentSeries K)) ⊆ S := by sorry

variable [NonarchimedeanAddGroup K]
/-- HL.0/open-subgroup-boxes-cofinal -/
theorem subgroup_boxes_cofinal (U : ℤ → Set K) (hU : ∀ i, U i ∈ 𝓝 (0 : K))
    (hN : ∃ N : ℤ, ∀ i, N ≤ i → U i = Set.univ) :
    ∃ V : ℤ → OpenAddSubgroup K,
      (∃ N : ℤ, ∀ i, N ≤ i → V i = ⊤) ∧ ∀ i, (V i : Set K) ⊆ U i := by sorry
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

/-- HL.0/higher-versus-outer-topology: the native outer topology is finer. -/
theorem outerTopology_le_higher :
    (inferInstance : TopologicalSpace (LaurentSeries K)) ≤ higherTopology K := by sorry
/-- HL.0/higher-equals-outer-iff-discrete -/
theorem higherTopology_eq_outer_iff :
    higherTopology K = (inferInstance : TopologicalSpace (LaurentSeries K)) ↔
      DiscreteTopology K := by sorry
/-- HL.0/higher-strictly-coarser -/
theorem outerTopology_lt_higher (hK : ¬ DiscreteTopology K) :
    (inferInstance : TopologicalSpace (LaurentSeries K)) < higherTopology K := by sorry

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
