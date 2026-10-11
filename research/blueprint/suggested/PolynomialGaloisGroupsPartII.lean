/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap document is
 definitive. These suggested Lean forms help contributors and reviewers converge on names
 and signatures; they claim no implementation.
-/
import TauCeti.GroupTheory.Perm.Partition
import TauCeti.GroupTheory.Perm.CyclePower
import TauCeti.RingTheory.Polynomial.FactorDegrees
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.FieldTheory.GaloisGroups.FrobeniusOrbits
import TauCeti.FieldTheory.GaloisGroups.MultipleTransitivity
import Mathlib.Combinatorics.Enumerative.Partition.Basic
import Mathlib.GroupTheory.GroupAction.Primitive
import Mathlib.Probability.ProbabilityMassFunction.Basic
import Mathlib.MeasureTheory.Measure.Real
import Mathlib.NumberTheory.Harmonic.Bounds
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.NumberTheory.Cyclotomic.Basic

noncomputable section
open Polynomial MulAction UniqueFactorizationMonoid
open scoped BigOperators
namespace TauCeti.PolynomialGaloisGroupsPartII
open Classical
local instance {α : Type*} : DecidableEq α := Classical.decEq α
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-! PG2.0: bounded equal-part merging. -/
def EqualPartMerging (y : ℝ) (a b : Multiset ℕ) : Prop :=
  ∃ blocks : Multiset (Multiset ℕ), blocks.sum = a ∧ blocks.map Multiset.sum = b ∧
    ∀ B ∈ blocks, 0 < B.card ∧ (B.card : ℝ) ≤ y ∧ ∀ u ∈ B, ∀ v ∈ B, u = v

theorem EqualPartMerging.refl {a : Multiset ℕ} {y : ℝ} (hy : 1 ≤ y) :
    EqualPartMerging y a a := by sorry
theorem EqualPartMerging.mono {a b : Multiset ℕ} {y z : ℝ}
    (h : EqualPartMerging y a b) (hyz : y ≤ z) : EqualPartMerging z a b := by sorry
theorem EqualPartMerging.sum_eq {a b : Multiset ℕ} {y : ℝ}
    (h : EqualPartMerging y a b) : a.sum = b.sum := by sorry
theorem EqualPartMerging.eq_of_lt_two {a b : Multiset ℕ} {y : ℝ}
    (h : EqualPartMerging y a b) (hy : y < 2) : a = b := by sorry
theorem EqualPartMerging.pullback_submultiset {a b : Multiset ℕ} {y : ℝ}
    (h : EqualPartMerging y a b) {v : Multiset ℕ} (hv : v ≤ b) :
    ∃ u ≤ a, u.sum = v.sum := by sorry
-- test merge_two_equal
example : EqualPartMerging 2 {1, 1, 2, 2, 2, 3} {1, 1, 2, 3, 4} := by sorry
-- test merge_rejects_three
example : ¬ EqualPartMerging 2 {1, 1, 2, 2, 2, 3} {2, 3, 6} := by sorry
-- test merge_empty
example : EqualPartMerging 1 0 0 := by sorry
-- test merge_not_transitive
example : EqualPartMerging 2 {1, 1, 2} {2, 2} ∧
    EqualPartMerging 2 {2, 2} {4} ∧ ¬ EqualPartMerging 4 {1, 1, 2} {4} := by sorry

variable {α : Type*} [Fintype α] [DecidableEq α]
def MergePerms {n : ℕ} (y : ℝ) (ρ : Nat.Partition n) : Set (Equiv.Perm α) :=
  {σ | EqualPartMerging y ρ.parts σ.fullCycleType}
theorem mem_mergePerms (y : ℝ) (ρ : Nat.Partition (Fintype.card α)) (σ : Equiv.Perm α) :
    σ ∈ MergePerms y ρ ↔ EqualPartMerging y ρ.parts σ.fullCycleType := by sorry
theorem mergePerms_mono {y z : ℝ} (hyz : y ≤ z) (ρ : Nat.Partition (Fintype.card α)) :
    MergePerms (α := α) y ρ ⊆ MergePerms (α := α) z ρ := by sorry
theorem mergePerms_card {n : ℕ} (y : ℝ) (ρ : Nat.Partition n)
    {σ : Equiv.Perm α} (h : σ ∈ MergePerms y ρ) : n = Fintype.card α := by sorry
theorem mergePerms_conj (y : ℝ) (ρ : Nat.Partition (Fintype.card α)) (g σ : Equiv.Perm α) :
    g * σ * g⁻¹ ∈ MergePerms y ρ ↔ σ ∈ MergePerms y ρ := by sorry
-- test merge_identity_includes_fixed_points
example (ρ : Nat.Partition (Fintype.card α)) :
    (1 : Equiv.Perm α) ∈ MergePerms 1 ρ ↔
      ρ.parts = Multiset.replicate (Fintype.card α) 1 := by sorry
-- test merge_full_cycle
example (σ : Equiv.Perm (Fin 5)) (h : σ.fullCycleType = {5}) :
    σ ∈ MergePerms (α := Fin 5) 1 (Nat.Partition.indiscrete 5) := by sorry
-- test merge_empty_carrier
example (σ : Equiv.Perm (Fin 0)) :
    σ ∈ MergePerms (α := Fin 0) 1 (Nat.Partition.indiscrete 0) := by sorry

def BadTransitive (α : Type*) [Fintype α] [DecidableEq α] : Set (Equiv.Perm α) :=
  {σ | ∃ G : Subgroup (Equiv.Perm α), IsPretransitive G α ∧
    G ≠ alternatingGroup α ∧ G ≠ ⊤ ∧ σ ∈ G}
theorem mem_badTransitive (σ : Equiv.Perm α) : σ ∈ BadTransitive α ↔
    ∃ G : Subgroup (Equiv.Perm α), IsPretransitive G α ∧
      G ≠ alternatingGroup α ∧ G ≠ ⊤ ∧ σ ∈ G := by sorry
theorem badTransitive_conj (g σ : Equiv.Perm α) :
    g * σ * g⁻¹ ∈ BadTransitive α ↔ σ ∈ BadTransitive α := by sorry
theorem badTransitive_witness {G : Subgroup (Equiv.Perm α)}
    (ht : IsPretransitive G α) (ha : G ≠ alternatingGroup α) (hs : G ≠ ⊤)
    {σ : Equiv.Perm α} (hσ : σ ∈ G) : σ ∈ BadTransitive α := by sorry
-- test bad_small_degrees
example (n : ℕ) (hn : n ≤ 3) : BadTransitive (Fin n) = ∅ := by sorry
-- test bad_identity
example : (1 : Equiv.Perm (Fin 5)) ∈ BadTransitive (Fin 5) := by sorry
-- test bad_five_cycle
example (σ : Equiv.Perm (Fin 5)) (h : σ.IsCycle) (hs : σ.support = Finset.univ) :
    σ ∈ BadTransitive (Fin 5) := by sorry

-- A fibre over one point of a bottom d-cycle decomposes into return-map cycles.
theorem equivariant_cycle_fibres {β : Type*} [Fintype β] [DecidableEq β]
    (σ : Equiv.Perm α) (ψ : Equiv.Perm β) (r : α → β)
    (hs : Function.Surjective r) (he : ∀ x, r (σ x) = ψ (r x))
    (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (hp : ψ.fullCycleType = {d}) (hf : ∀ b, Fintype.card {a // r a = b} = m) :
    EqualPartMerging m (Multiset.replicate m d) σ.fullCycleType := by sorry

/-! PG2.1: ramified specialisation. -/
def maxFactorMultiplicity {F : Type*} [Field F] (f : F[X]) : ℕ :=
  (normalizedFactors f).toFinset.sup (fun q => (normalizedFactors f).count q)
theorem maxFactorMultiplicity_unit {F : Type*} [Field F] {f : F[X]} (hf : IsUnit f) :
    maxFactorMultiplicity f = 0 := by sorry
theorem count_le_maxFactorMultiplicity {F : Type*} [Field F] (f q : F[X]) :
    (normalizedFactors f).count q ≤ maxFactorMultiplicity f := by sorry
theorem maxFactorMultiplicity_le_iff {F : Type*} [Field F] (f : F[X]) (m : ℕ) :
    maxFactorMultiplicity f ≤ m ↔ ∀ q ∈ normalizedFactors f,
      (normalizedFactors f).count q ≤ m := by sorry
theorem maxFactorMultiplicity_eq_one_iff {F : Type*} [Field F] {f : F[X]}
    (hf : f ≠ 0) (hu : ¬ IsUnit f) :
    maxFactorMultiplicity f = 1 ↔ Squarefree f := by sorry
-- test multiplicity_unit
example : maxFactorMultiplicity (1 : (ZMod 2)[X]) = 0 := by sorry
-- test multiplicity_cube
example : maxFactorMultiplicity ((X + 1 : (ZMod 2)[X]) ^ 3) = 3 := by sorry
-- test multiplicity_not_degree_multiplicity
example : maxFactorMultiplicity ((X : (ZMod 3)[X]) * (X - 1)) = 1 := by sorry

-- The fibre-cardinality identity is stated abstractly, then applied to integral reduction.
theorem fibre_card_eq_rootMultiplicity {R K : Type*} [CommRing R] [DecidableEq R] [Field K]
    (r : R →+* K) (xs : Finset R) (z : K) :
    ((∏ x ∈ xs, (X - C (r x) : K[X])).rootMultiplicity z) =
      (xs.filter (fun x => r x = z)).card := by sorry
theorem ramified_merging (A : ℤ[X]) (hA : A.Monic)
    (hsep : (A.map (Int.castRingHom ℚ)).Separable)
    (hdeg : 0 < A.natDegree) (p : ℕ) [Fact p.Prime] :
    ∃ σ : (A.map (Int.castRingHom ℚ)).Gal,
      EqualPartMerging
        (maxFactorMultiplicity (A.map (Int.castRingHom (ZMod p))) : ℝ)
        (A.factorDegrees p)
        ((MulAction.toPermHom (A.map (Int.castRingHom ℚ)).Gal
          ((A.map (Int.castRingHom ℚ)).rootSet
            (A.map (Int.castRingHom ℚ)).SplittingField)) σ).fullCycleType := by sorry
-- test ramified_double_factor: discriminant divisible by p is permitted
example : maxFactorMultiplicity ((X ^ 2 - C 2 : ℤ[X]).map
    (Int.castRingHom (ZMod 2))) = 2 := by sorry

/-! PG2.2: ordered roots and higher transitivity. -/
section Higher
variable {F : Type*} [Field F] (f : F[X])
abbrev TupleRootField {j : ℕ} (x : Fin j ↪ f.rootSet f.SplittingField) :=
  IntermediateField.adjoin F (Set.range (fun i => (x i : f.SplittingField)))
def tupleRootQuotient {j : ℕ} (x : Fin j ↪ f.rootSet f.SplittingField) :
    (TupleRootField f x)[X] :=
  (f.map (algebraMap F (TupleRootField f x))) /ₘ
    ∏ i, (X - C (⟨(x i : f.SplittingField),
      IntermediateField.subset_adjoin F _ ⟨i, rfl⟩⟩ : TupleRootField f x))
theorem tupleRootQuotient_factor {j : ℕ} (x : Fin j ↪ f.rootSet f.SplittingField)
    (hs : f.Separable) :
    (tupleRootQuotient f x).map (algebraMap (TupleRootField f x) f.SplittingField) *
      (∏ i, (X - C (x i : f.SplittingField))) =
        f.map (algebraMap F f.SplittingField) := by sorry
theorem tupleRootQuotient_natDegree {j : ℕ} (x : Fin j ↪ f.rootSet f.SplittingField)
    (hs : f.Separable) : (tupleRootQuotient f x).natDegree = f.natDegree - j := by sorry
theorem tupleRootQuotient_separable {j : ℕ} (x : Fin j ↪ f.rootSet f.SplittingField)
    (hs : f.Separable) : (tupleRootQuotient f x).Separable := by sorry
-- test quotient_empty_tuple
example (x : Fin 0 ↪ f.rootSet f.SplittingField) :
    (tupleRootQuotient f x).map (algebraMap (TupleRootField f x) f.SplittingField) =
      f.map (algebraMap F f.SplittingField) := by sorry
-- test quotient_all_roots
example (hf : f.Monic) (hs : f.Separable)
    (x : Fin f.natDegree ↪ f.rootSet f.SplittingField) : tupleRootQuotient f x = 1 := by sorry
-- test quotient_one_root
example (x : Fin 1 ↪ f.rootSet f.SplittingField) :
    tupleRootQuotient f x = (f.map (algebraMap F (TupleRootField f x))) /ₘ
      (X - C (⟨(x 0 : f.SplittingField),
        IntermediateField.subset_adjoin F _ ⟨0, rfl⟩⟩ : TupleRootField f x)) := by sorry

def IsKFoldIrreducible (k : ℕ) : Prop :=
  f.Separable ∧ 0 < f.natDegree ∧ 1 ≤ k ∧ k ≤ f.natDegree ∧
    ∀ j < k, ∀ x : Fin j ↪ f.rootSet f.SplittingField,
      Irreducible (tupleRootQuotient f x)
theorem IsKFoldIrreducible.one_iff (hs : f.Separable) (hd : 0 < f.natDegree) :
    IsKFoldIrreducible f 1 ↔ Irreducible f := by sorry
theorem IsKFoldIrreducible.mono {k l : ℕ} (h : IsKFoldIrreducible f k)
    (hl : 1 ≤ l) (hlk : l ≤ k) : IsKFoldIrreducible f l := by sorry
theorem IsKFoldIrreducible.degree_bound {k : ℕ} (h : IsKFoldIrreducible f k) :
    1 ≤ k ∧ k ≤ f.natDegree := by sorry
-- test kfold_zero
example : ¬ IsKFoldIrreducible f 0 := by sorry
-- test kfold_exceeds_degree
example (k : ℕ) (h : f.natDegree < k) : ¬ IsKFoldIrreducible f k := by sorry
-- test kfold_cyclotomic
example : IsKFoldIrreducible (cyclotomic 11 ℚ) 1 ∧
    ¬ IsKFoldIrreducible (cyclotomic 11 ℚ) 2 := by sorry
-- test kfold_nonseparable
example : ¬ IsKFoldIrreducible ((X ^ 2 - C 2 : ℚ[X]) ^ 2) 1 := by sorry

theorem tuple_stabilizer_eq_fixingSubgroup {j : ℕ}
    (x : Fin j ↪ f.rootSet f.SplittingField) :
    (MulAction.stabilizer f.Gal x) =
      (TupleRootField f x).fixingSubgroup := by sorry

theorem kfold_iff_multiplyPretransitive (k : ℕ) (hs : f.Separable)
    (hd : 0 < f.natDegree) (hk : 1 ≤ k) (hkn : k ≤ f.natDegree) :
    IsKFoldIrreducible f k ↔
      IsMultiplyPretransitive f.Gal (f.rootSet f.SplittingField) k := by sorry

theorem kfold_degree_sub_two (hs : f.Separable) (hd : 3 ≤ f.natDegree) :
    IsKFoldIrreducible f (f.natDegree - 2) ↔
      alternatingGroup (f.rootSet f.SplittingField) ≤
        (MulAction.toPermHom f.Gal (f.rootSet f.SplittingField)).range := by sorry
end Higher

/-! PG2.3: arbitrary laws and anatomy events. -/
local instance partitionMeasurableSpace (n : ℕ) : MeasurableSpace (Nat.Partition n) := ⊤

abbrev harmonicMass (f : ℕ → Bool) (m : ℕ) : ℝ :=
  ∑ k ∈ Finset.Icc 1 m, if f k then (k : ℝ)⁻¹ else 0
-- harmonicMass is only the finite sum notation used in the law's lower-tail field.
structure PartitionLaw (n : ℕ) (ν : MeasureTheory.Measure (Nat.Partition n))
    (C t κ δ : ℝ) : Prop where
  constant : 1 ≤ C
  t_pos : 0 < t
  t_lt_one : t < 1
  kappa_pos : 0 < κ
  kappa_le_one : κ ≤ 1
  delta_pos : 0 < δ
  delta_le : δ ≤ 1 / 10
  pair : ∀ k l : ℕ, 2 ≤ k → 2 ≤ l → (k : ℝ) ≤ n / 4 → (l : ℝ) ≤ n / 4 →
    ν.real {ρ | ({k, l} : Multiset ℕ) ≤ ρ.parts} ≤ C / ((k : ℝ) * l)
  subset : ∀ k : ℕ, (n : ℝ) ^ (1 - δ / 2) ≤ k → (k : ℝ) ≤ n / 2 →
    ν.real {ρ | ∃ u ≤ ρ.parts, u.sum = k} ≤ C * (k : ℝ) ^ (-δ)
  lower : ∀ (f : ℕ → Bool) (m : ℕ), 1 ≤ m → (m : ℝ) ≤ n / Real.log n →
    ν.real {ρ | ((ρ.parts.filter (fun (k : ℕ) => k ≤ m ∧ f k = true)).card : ℝ) ≤
      t * harmonicMass f m} ≤ C * Real.exp (-κ * harmonicMass f m)

theorem PartitionLaw.pair_diagonal {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)}
    {C t κ δ : ℝ} (h : PartitionLaw n ν C t κ δ) (k : ℕ) (hk : 2 ≤ k)
    (hkn : (k : ℝ) ≤ n / 4) :
    ν.real {ρ | 2 ≤ ρ.parts.count k} ≤ C / (k : ℝ) ^ 2 := by sorry
theorem PartitionLaw.enlarge_constant {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)}
    {C D t κ δ : ℝ} (h : PartitionLaw n ν C t κ δ) (hCD : C ≤ D) :
    PartitionLaw n ν D t κ δ := by sorry
theorem PartitionLaw.weaken_kappa {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)}
    {C t κ κ' δ : ℝ} (h : PartitionLaw n ν C t κ δ) (hκ' : 0 < κ') (hle : κ' ≤ κ) :
    PartitionLaw n ν C t κ' δ := by sorry
-- test law_indicator_zero
example {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)} {C t κ δ : ℝ}
    (h : PartitionLaw n ν C t κ δ) (hn : (7 : ℝ) ≤ n / Real.log n) :
    ν.real {ρ | ((ρ.parts.filter (fun k => k ≤ 7 ∧ false = true)).card : ℝ) ≤ 0} ≤ C := by sorry
-- test law_indicator_singleton
example {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)} {C t κ δ : ℝ}
    (h : PartitionLaw n ν C t κ δ) (hn : (4 : ℝ) ≤ n / Real.log n) :
    ν.real {ρ | (ρ.parts.count 2 : ℝ) ≤ t / 2} ≤ C * Real.exp (-κ / 2) := by sorry
-- test law_diagonal_counts_two
example {n : ℕ} {ν : MeasureTheory.Measure (Nat.Partition n)} {C t κ δ : ℝ}
    (h : PartitionLaw n ν C t κ δ) (hn : 8 ≤ n) :
    ν.real {ρ | 2 ≤ ρ.parts.count 2} ≤ C / 4 := by sorry

def GoodEvent (i : Fin 5) (n : ℕ) (t κ δ α : ℝ) : Set (Nat.Partition n) :=
  match i.val with
  | 0 => {ρ | ∀ k l : ℕ, (k : ℝ) ≤ n / 4 → (l : ℝ) ≤ n / 4 →
      ({k, l} : Multiset ℕ) ≤ ρ.parts → (k.gcd l : ℝ) < (n : ℝ) ^ (κ * α)}
  | 1 => {ρ | ∀ r : ℕ, r ∣ n → 2 ≤ r → (r : ℝ) ≤ (n : ℝ) ^ (δ / 2) →
      ∀ j : ℕ, 1 ≤ j → j < r → ∀ u ≤ ρ.parts, (u.sum : ℝ) ≠ n * j / r}
  | 2 => {ρ | (α * t / 2) * Real.log n ≤
      ((ρ.parts.filter (fun (k : ℕ) => (n : ℝ) ^ (1 - α) ≤ k ∧
        (k : ℝ) ≤ n / Real.log n)).card : ℝ)}
  | 3 => {ρ | (t / 4) * Real.log n ≤
      ((ρ.parts.filter (fun (k : ℕ) => (k : ℝ) ≤ Real.sqrt n / 3 ∧
        ∃ p : ℕ, p.Prime ∧ p ∣ k ∧ (n : ℝ) ^ (1 / 8 : ℝ) < p)).card : ℝ)}
  | _ => {ρ | ∀ r : ℕ, 2 ≤ r → 4 ≤
      (ρ.parts.filter (fun (k : ℕ) => (n : ℝ) ^ (1 - 2 * α) ≤ k ∧
        (k : ℝ) ≤ n / Real.log n ∧ ¬ r ∣ k)).card}

theorem goodEvent_one_diagonal {n : ℕ} {t κ δ α : ℝ} {ρ : Nat.Partition n}
    (h : ρ ∈ GoodEvent 0 n t κ δ α) (k : ℕ)
    (hk : (n : ℝ) ^ (κ * α) ≤ k) (hkn : (k : ℝ) ≤ n / 4) :
    ρ.parts.count k ≤ 1 := by sorry
theorem goodEvent_two_complement {n : ℕ} {t κ δ α : ℝ} {ρ : Nat.Partition n}
    (u : Multiset ℕ) (hu : u ≤ ρ.parts) :
    (ρ.parts - u).sum = n - u.sum := by sorry
theorem goodEvent_five_four {n : ℕ} {t κ δ α : ℝ} {ρ : Nat.Partition n}
    (h : ρ ∈ GoodEvent 4 n t κ δ α) (r : ℕ) (hr : 2 ≤ r) :
    4 ≤ (ρ.parts.filter (fun (k : ℕ) => (n : ℝ) ^ (1 - 2 * α) ≤ k ∧
      (k : ℝ) ≤ n / Real.log n ∧ ¬ r ∣ k)).card := by sorry
-- test good_event_repeated_part
example (ρ : Nat.Partition 8) (h : ρ.parts = {2, 2, 4}) :
    ρ ∉ GoodEvent 0 8 1 1 1 0 := by sorry
-- test good_event_boundary_zero
example (ρ : Nat.Partition 1) : ρ ∈ GoodEvent 2 1 1 1 1 0 := by sorry
-- test good_event_four_not_one
example (ρ : Nat.Partition 3) : ρ ∉ GoodEvent 4 3 1 1 1 0 := by sorry
-- test good_event_subsum
example (ρ : Nat.Partition 6) (h : ρ.parts = {3, 3}) :
    ρ ∉ GoodEvent 1 6 1 1 2 0 := by sorry

-- Uniform harmonic masses, inclusive integer endpoints, with one error constant.
theorem anatomy_harmonic_masses (ε : ℝ) (hε : 0 < ε) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N, ∀ α : ℝ,
      ε / 2 ≤ α → α ≤ 1 / 40 →
      |(∑ k ∈ Finset.Icc 1 n,
        if (n : ℝ) ^ (1 - α) ≤ k ∧ (k : ℝ) ≤ n / Real.log n
        then (k : ℝ)⁻¹ else 0) - (α * Real.log n - Real.log (Real.log n))| ≤ B ∧
      ∀ r : ℕ, 2 ≤ r → (r : ℝ) ≤ (n : ℝ) ^ α →
        |(∑ k ∈ Finset.Icc 1 n,
          if (n : ℝ) ^ (1 - 2 * α) ≤ k ∧ (k : ℝ) ≤ n / Real.log n ∧ ¬ r ∣ k
          then (k : ℝ)⁻¹ else 0) -
          (1 - (r : ℝ)⁻¹) * (2 * α * Real.log n - Real.log (Real.log n))| ≤ B := by sorry

theorem nonsmooth_harmonic_mass :
    ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      (Real.log n) / 4 ≤ ∑ k ∈ Finset.Icc 1 n,
        if (k : ℝ) ≤ Real.sqrt n / 3 ∧ ∃ p : ℕ,
          p.Prime ∧ p ∣ k ∧ (n : ℝ) ^ (1 / 8 : ℝ) < p
        then (k : ℝ)⁻¹ else 0 := by sorry

theorem pair_gcd_failure (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real (GoodEvent 0 n t κ δ (δ / 4 - θ / 2))ᶜ ≤ B * ((Real.log n) ^ 2 * (n : ℝ) ^ (-κ * (δ / 4 - θ / 2))) := by sorry

theorem block_subsum_failure (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real (GoodEvent 1 n t κ δ (δ / 4 - θ / 2))ᶜ ≤ B * ((n : ℝ) ^ (-δ / 4)) := by sorry

theorem long_parts_failure (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real (GoodEvent 2 n t κ δ (δ / 4 - θ / 2))ᶜ ≤ B * ((Real.log n) ^ κ * (n : ℝ) ^ (-κ * (δ / 4 - θ / 2))) := by sorry

theorem large_prime_parts_failure (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real (GoodEvent 3 n t κ δ (δ / 4 - θ / 2))ᶜ ≤ B * ((n : ℝ) ^ (-κ / 4)) := by sorry

theorem four_nondivisible_parts_failure (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real (GoodEvent 4 n t κ δ (δ / 4 - θ / 2))ᶜ ≤ B * ((Real.log n) ^ 2 * (n : ℝ) ^ (-κ * (δ / 4 - θ / 2))) := by sorry

/-! PG2.4: primitive minimum degree. -/
def minSupport (G : Subgroup (Equiv.Perm α)) : Option ℕ :=
  if ∃ σ ∈ G, σ ≠ 1 then
    some (sInf {m : ℕ | ∃ σ ∈ G, σ ≠ 1 ∧ σ.support.card = m}) else none

theorem minSupport_eq_none (G : Subgroup (Equiv.Perm α)) :
    minSupport G = none ↔ G = ⊥ := by sorry
theorem minSupport_eq_some (G : Subgroup (Equiv.Perm α)) (m : ℕ) :
    minSupport G = some m ↔
      (∃ σ ∈ G, σ ≠ 1 ∧ σ.support.card = m) ∧
      ∀ σ ∈ G, σ ≠ 1 → m ≤ σ.support.card := by sorry
theorem minSupport_le {G : Subgroup (Equiv.Perm α)} {m : ℕ}
    (hm : minSupport G = some m) {σ : Equiv.Perm α} (hσ : σ ∈ G) (hne : σ ≠ 1) :
    m ≤ σ.support.card := by sorry
-- test minimum_trivial
example : minSupport (⊤ : Subgroup (Equiv.Perm (Fin 0))) = none := by sorry
-- test minimum_symmetric
example : minSupport (⊤ : Subgroup (Equiv.Perm (Fin 2))) = some 2 := by sorry
-- test minimum_alternating
example : minSupport (alternatingGroup (Fin 3)) = some 3 := by sorry

def orbitalDistinguishers (G : Subgroup (Equiv.Perm α)) (x y : α) : Finset α :=
  Finset.univ.filter (fun z => ¬ ∃ g : G, g • x = y ∧ g • z = z)
theorem mem_orbitalDistinguishers (G : Subgroup (Equiv.Perm α)) (x y z : α) :
    z ∈ orbitalDistinguishers G x y ↔
      ¬ MulAction.orbitRel (MulAction.stabilizer G z) α x y := by sorry
theorem orbitalDistinguishers_symm (G : Subgroup (Equiv.Perm α)) (x y : α) :
    orbitalDistinguishers G x y = orbitalDistinguishers G y x := by sorry
theorem orbitalDistinguishers_subset_support (G : Subgroup (Equiv.Perm α))
    (g : G) (x : α) : orbitalDistinguishers G x (g • x) ⊆ (g : Equiv.Perm α).support := by sorry
-- test distinguisher_diagonal
example (G : Subgroup (Equiv.Perm α)) (x : α) : orbitalDistinguishers G x x = ∅ := by sorry
-- test distinguisher_trivial
example (x y : α) (h : x ≠ y) :
    orbitalDistinguishers (⊥ : Subgroup (Equiv.Perm α)) x y = Finset.univ := by sorry
-- test distinguisher_symmetric
example (x y : α) (h : x ≠ y) :
    orbitalDistinguishers (⊤ : Subgroup (Equiv.Perm α)) x y = {x, y} := by sorry

-- No new coherent-configuration carrier: use diagonal pair orbits directly.
theorem orbital_walk_connectivity (G : Subgroup (Equiv.Perm α))
    (hp : IsPreprimitive G α) (x y : α) (hxy : x ≠ y) (a b : α) :
    Relation.ReflTransGen
      (fun u v => MulAction.orbitRel G (α × α) (x, y) (u, v) ∨
        MulAction.orbitRel G (α × α) (x, y) (v, u)) a b := by sorry

theorem babai_distinguishers (G : Subgroup (Equiv.Perm α))
    (hp : IsPreprimitive G α) (h2 : ¬ IsMultiplyPretransitive G α 2)
    (hn : 5 ≤ Fintype.card α) (x y : α) (hxy : x ≠ y) :
    Real.sqrt (Fintype.card α) / 2 ≤ (orbitalDistinguishers G x y).card := by sorry

theorem bochert_minSupport (G : Subgroup (Equiv.Perm α))
    (h2 : IsMultiplyPretransitive G α 2) (ha : ¬ alternatingGroup α ≤ G)
    (hn : 38 ≤ Fintype.card α) {m : ℕ} (hm : minSupport G = some m) :
    (Fintype.card α : ℝ) / 4 ≤ m := by sorry

theorem primitive_minSupport (G : Subgroup (Equiv.Perm α))
    (hp : IsPreprimitive G α) (ha : G ≠ alternatingGroup α) (hs : G ≠ ⊤)
    (hn : 5 ≤ Fintype.card α) {m : ℕ} (hm : minSupport G = some m) :
    (Real.sqrt (Fintype.card α) - 1) / 2 ≤ m := by sorry

/-! PG2.5: blocks and exclusions. -/
-- A σ-equivariant quotient with equal fibre size is the block system needed here.
theorem block_orbit_cycle_divisibility {r s : ℕ} (hr : 0 < r) (hs : 0 < s)
    (σ : Equiv.Perm (Fin (r * s))) (ψ : Equiv.Perm (Fin r))
    (b : Fin (r * s) → Fin r) (hb : ∀ i, Fintype.card {x // b x = i} = s)
    (he : ∀ x, b (σ x) = ψ (b x)) (x : Fin (r * s)) :
    ∃ d e : ℕ, 0 < d ∧ d ≤ r ∧ 0 < e ∧ e ≤ s ∧
      (σ.cycleOf x).support.card + (if σ x = x then 1 else 0) = d * e ∧
      d = Nat.card (MulAction.orbit (Subgroup.zpowers ψ) (b x)) ∧
      (∀ i ∈ MulAction.orbit (Subgroup.zpowers ψ) (b x),
        Nat.card {z // z ∈ MulAction.orbit (Subgroup.zpowers σ) x ∧ b z = i} = e) ∧
      Nat.card {z // MulAction.orbitRel (Subgroup.zpowers ψ) (Fin r) (b x) (b z)} = d * s ∧
      (∀ z, MulAction.orbit (Subgroup.zpowers ψ) (b x) =
          MulAction.orbit (Subgroup.zpowers ψ) (b z) ∨
        Disjoint (MulAction.orbit (Subgroup.zpowers ψ) (b x))
          (MulAction.orbit (Subgroup.zpowers ψ) (b z))) ∧
      (∀ z, MulAction.orbitRel (Subgroup.zpowers ψ) (Fin r) (b x) (b (σ z)) ↔
        MulAction.orbitRel (Subgroup.zpowers ψ) (Fin r) (b x) (b z)) ∧
      ∀ z, MulAction.orbitRel (Subgroup.zpowers ψ) (Fin r) (b x) (b z) →
        d ∣ ((σ.cycleOf z).support.card + (if σ z = z then 1 else 0)) := by sorry

theorem primitive_exclusion (t κ δ ε : ℝ) (ht : 0 < t) (hκ : 0 < κ)
    (hκ1 : κ ≤ 1) (hδ : 0 < δ) (hδ1 : δ ≤ 1 / 10)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N, ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
      ∀ ρ : Nat.Partition n, ρ ∈ GoodEvent 0 n t κ δ (δ / 4 - θ / 2) →
        ρ ∈ GoodEvent 3 n t κ δ (δ / 4 - θ / 2) →
        ∀ G : Subgroup (Equiv.Perm (Fin n)), IsPreprimitive G (Fin n) →
          G ≠ alternatingGroup (Fin n) → G ≠ ⊤ →
          Disjoint (MergePerms (α := Fin n) ((n : ℝ) ^ (1 / 8 : ℝ)) ρ) (G : Set (Equiv.Perm (Fin n))) := by sorry

theorem imprimitive_exclusion (t κ δ ε : ℝ) (ht : 0 < t) (hκ : 0 < κ)
    (hκ1 : κ ≤ 1) (hδ : 0 < δ) (hδ1 : δ ≤ 1 / 10)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N, ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
      ∀ ρ : Nat.Partition n, (∀ i, ρ ∈ GoodEvent i n t κ δ (δ / 4 - θ / 2)) →
        ∀ G : Subgroup (Equiv.Perm (Fin n)), IsPretransitive G (Fin n) →
          ¬ IsPreprimitive G (Fin n) →
          Disjoint (MergePerms (α := Fin n) ((n : ℝ) ^ θ) ρ) (G : Set (Equiv.Perm (Fin n))) := by sorry

/-! PG2.6: the arbitrary-law criterion and its deterministic arithmetic adapter. -/
theorem generalized_luczak_pyber (C t κ δ ε : ℝ)
    (hε : 0 < ε) (hεδ : ε < δ / 2) :
    ∃ B : ℝ, 0 ≤ B ∧ ∃ N : ℕ, 3 ≤ N ∧ ∀ n ≥ N,
      ∀ ν : MeasureTheory.Measure (Nat.Partition n),
        MeasureTheory.IsProbabilityMeasure ν → PartitionLaw n ν C t κ δ →
        ∀ θ : ℝ, 0 ≤ θ → θ ≤ δ / 2 - ε →
          ν.real {ρ | ∃ σ : Equiv.Perm (Fin n),
            σ ∈ MergePerms (α := Fin n) ((n : ℝ) ^ θ) ρ ∧ σ ∈ BadTransitive (Fin n)} ≤
              B * (Real.log n) ^ 2 * (n : ℝ) ^ (-κ * (δ / 4 - θ / 2)) := by sorry

theorem galois_merging_certificate (A : ℤ[X]) (hA : A.Monic)
    (hsep : (A.map (Int.castRingHom ℚ)).Separable)
    (hirr : Irreducible (A.map (Int.castRingHom ℚ))) (p : ℕ) [Fact p.Prime]
    (y : ℝ) (hy : (maxFactorMultiplicity (A.map (Int.castRingHom (ZMod p))) : ℝ) ≤ y)
    (hbad : (MulAction.toPermHom (A.map (Int.castRingHom ℚ)).Gal
      ((A.map (Int.castRingHom ℚ)).rootSet
        (A.map (Int.castRingHom ℚ)).SplittingField)).range ≠
      alternatingGroup ((A.map (Int.castRingHom ℚ)).rootSet
        (A.map (Int.castRingHom ℚ)).SplittingField))
    (hsmall : (MulAction.toPermHom (A.map (Int.castRingHom ℚ)).Gal
      ((A.map (Int.castRingHom ℚ)).rootSet
        (A.map (Int.castRingHom ℚ)).SplittingField)).range ≠ ⊤) :
    ∃ σ : Equiv.Perm ((A.map (Int.castRingHom ℚ)).rootSet
      (A.map (Int.castRingHom ℚ)).SplittingField),
      EqualPartMerging y (A.factorDegrees p) σ.fullCycleType ∧
      σ ∈ BadTransitive ((A.map (Int.castRingHom ℚ)).rootSet
        (A.map (Int.castRingHom ℚ)).SplittingField) := by sorry

end TauCeti.PolynomialGaloisGroupsPartII
