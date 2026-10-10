import Mathlib.Basic.Complex.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Multiset.Bind
import Mathlib.Data.Finset.Powerset
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.LinearAlgebra.Dimension.Finite
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Topology.Irreducible
import TauCeti.RepresentationTheory.Quiver.Representation.Basic

/-!
# Quiver representations, Part II: multisegment duality

**This file is not the roadmap and is not exhaustive.** The definitive document is
`QuiverRepresentationsPartII.md`. These signatures suggest forms for the targets;
discharging them finishes neither a layer nor the roadmap. `sorry` marks goals,
including constructions, and is not a proof or an implementation claim.

All geometric statements concern finite dimensional complex spaces, equipped with
the polynomial Zariski topology below. Coordinates represent arbitrary finite
support integer graded spaces after a graded choice of basis. ImageModel contains
an actual embedding with exactly the operator's range, not an asserted image type.
The representation comparison requires the supplier's future representation
carrier; its absent signature is an explicit gap recorded at the end of this file.
-/

noncomputable section
attribute [local instance] Classical.propDecidable
open scoped BigOperators
namespace TauCeti.MultisegmentDuality

-- MS.0: integer intervals, with multiplicities.
structure Interval where
  left : ℤ
  right : ℤ
  nonempty : left ≤ right
  deriving DecidableEq

def intSeg (a : ℤ) (lengthMinusOne : ℕ) : Interval :=
  ⟨a, a + lengthMinusOne, by omega⟩

def Interval.contains (s : Interval) (a : ℤ) : Prop := s.left ≤ a ∧ a ≤ s.right
def Interval.included (s t : Interval) : Prop := t.left ≤ s.left ∧ s.right ≤ t.right
def Interval.length (s : Interval) : ℕ := (s.right - s.left + 1).toNat
def Interval.shift (s : Interval) (c : ℤ) : Interval :=
  ⟨s.left + c, s.right + c, by have := s.nonempty; omega⟩
def Interval.shorten (s : Interval) : Option Interval :=
  if h : s.left < s.right then some ⟨s.left, s.right - 1, by omega⟩ else none

theorem Interval.ext_ends {s t : Interval} (hl : s.left = t.left)
    (hr : s.right = t.right) : s = t := by sorry
theorem Interval.contains_shift (s : Interval) (a c : ℤ) :
    (s.shift c).contains (a + c) ↔ s.contains a := by sorry
theorem Interval.shorten_singleton (a : ℤ) : (intSeg a 0).shorten = none := by sorry
theorem Interval.length_positive (s : Interval) : 0 < s.length := by sorry
-- Interval tests: inclusive endpoints, disappearance, shift sign.
-- tests.interval_endpoint
example : (intSeg 0 2).contains 2 := by sorry
-- tests.interval_singleton
example : (intSeg 3 0).shorten = none := by sorry
-- tests.interval_shift
example : (intSeg 2 2).shift (-1) = intSeg 1 2 := by sorry

abbrev Multisegment := Multiset Interval
def occurrenceInterval (m : Multisegment) (i : Fin m.card) : Interval := by sorry
theorem occurrence_count (m : Multisegment) (s : Interval) :
    (Finset.univ.filter fun i : Fin m.card => occurrenceInterval m i = s).card = m.count s := by sorry
def rightTruncate (m : Multisegment) : Multisegment :=
  m.bind fun s => match s.shorten with | none => 0 | some t => {t}
def shiftMultisegment (m : Multisegment) (c : ℤ) : Multisegment := m.map (·.shift c)
def degreeDimension (m : Multisegment) (a : ℤ) : ℕ :=
  (m.filter fun s => s.contains a).card
def totalLength (m : Multisegment) : ℕ := (m.map Interval.length).sum
theorem rightTruncate_add (m n : Multisegment) :
    rightTruncate (m + n) = rightTruncate m + rightTruncate n := by sorry
theorem rightTruncate_shift (m : Multisegment) (c : ℤ) :
    rightTruncate (shiftMultisegment m c) = shiftMultisegment (rightTruncate m) c := by sorry
theorem degreeDimension_add (m n : Multisegment) (a : ℤ) :
    degreeDimension (m + n) a = degreeDimension m a + degreeDimension n a := by sorry
-- Multisegment tests: copies survive, singleton is removed, degree is graded.
-- tests.truncate_repeated
example : rightTruncate ({intSeg 1 1, intSeg 1 1} : Multisegment) =
    {intSeg 1 0, intSeg 1 0} := by sorry
-- tests.truncate_delete
example : rightTruncate ({intSeg 0 0, intSeg 1 2} : Multisegment) = {intSeg 1 1} := by sorry
-- tests.degree_repeated
example : degreeDimension ({intSeg 0 2, intSeg 1 0} : Multisegment) 1 = 2 := by sorry

def maximalPart (m : Multisegment) : Multisegment :=
  (m.toFinset.filter fun s => ∀ t ∈ m.toFinset, s.included t → s = t).val
def remainder (m : Multisegment) : Multisegment := m - maximalPart m
theorem maximalPart_count (m : Multisegment) (s : Interval) :
    (maximalPart m).count s =
      if s ∈ m ∧ (∀ t ∈ m, s.included t → s = t) then 1 else 0 := by sorry
theorem maximalPart_add_remainder (m : Multisegment) : maximalPart m + remainder m = m := by sorry
theorem maximalPart_incomparable (m : Multisegment) {s t : Interval}
    (hs : s ∈ maximalPart m) (ht : t ∈ maximalPart m) (h : s.included t) : s = t := by sorry
-- Maximal peeling takes ONE copy of each maximal interval.
-- tests.maximal_one_copy
example : maximalPart ({intSeg 0 2, intSeg 0 2} : Multisegment) = {intSeg 0 2} := by sorry
-- tests.maximal_nested
example : remainder ({intSeg 0 2, intSeg 1 0} : Multisegment) = {intSeg 1 0} := by sorry
-- tests.maximal_disjoint
example : maximalPart ({intSeg 0 0, intSeg 2 0} : Multisegment) =
    {intSeg 0 0, intSeg 2 0} := by sorry

-- MS.1: coordinates are a model, not a restriction on finite graded spaces.
structure Space where
  n : ℕ
  degree : Fin n → ℤ
abbrev Space.Carrier (S : Space) := Fin S.n → ℂ
def Space.grade (S : Space) (a : ℤ) : Submodule ℂ S.Carrier where
  carrier := {v | ∀ i, S.degree i ≠ a → v i = 0}
  zero_mem' := by simp
  add_mem' := by intro x y hx hy i hi; simp [hx i hi, hy i hi]
  smul_mem' := by intro c v hv i hi; simp [hv i hi]
def Space.dimension (S : Space) (a : ℤ) : ℕ := Module.finrank ℂ (S.grade a)
def constantSpace (n : ℕ) (a : ℤ) : Space := ⟨n, fun _ => a⟩
theorem Space.internal (S : Space) : DirectSum.IsInternal S.grade := by sorry
theorem Space.finite_support (S : Space) : {a | S.grade a ≠ ⊥}.Finite := by sorry
theorem Space.dimension_card (S : Space) (a : ℤ) :
    S.dimension a = (Finset.univ.filter fun i => S.degree i = a).card := by sorry
-- tests.space_repeated_grade
example : (constantSpace 2 3).dimension 3 = 2 := by sorry
-- tests.space_missing_grade
example : (constantSpace 2 3).dimension 4 = 0 := by sorry
-- tests.space_zero
example : (constantSpace 0 0).grade 0 = ⊥ := by sorry

inductive Direction | up | down deriving DecidableEq
def Direction.step : Direction → ℤ | .up => 1 | .down => -1
def Direction.opposite : Direction → Direction | .up => .down | .down => .up
def Homogeneous (S : Space) (T : Module.End ℂ S.Carrier) (c : ℤ) : Prop :=
  ∀ a v, v ∈ S.grade a → T v ∈ S.grade (a + c)
structure Pair (S : Space) (d : Direction) where
  operator : Module.End ℂ S.Carrier
  homogeneous : Homogeneous S operator d.step
abbrev VN (S : Space) := Pair S .up
abbrev WL (S : Space) := Pair S .down
structure PairIso {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) where
  equiv : S.Carrier ≃ₗ[ℂ] R.Carrier
  graded : ∀ a v, v ∈ S.grade a ↔ equiv v ∈ R.grade a
  intertwine : ∀ v, equiv (P.operator v) = Q.operator (equiv v)
def Pair.Isomorphic {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) : Prop :=
  Nonempty (PairIso P Q)
def zeroPair (S : Space) (d : Direction) : Pair S d := ⟨0, by intro a v hv; simp [Space.grade]⟩
theorem Pair.nilpotent {S : Space} {d : Direction} (P : Pair S d) :
    ∃ k : ℕ, P.operator ^ k = 0 := by sorry
theorem Pair.isomorphic_refl {S : Space} {d : Direction} (P : Pair S d) :
    P.Isomorphic P := by sorry
theorem Pair.isomorphic_trans {S R U : Space} {d : Direction}
    {P : Pair S d} {Q : Pair R d} {H : Pair U d}
    (h : P.Isomorphic Q) (h' : Q.Isomorphic H) : P.Isomorphic H := by sorry
example : (zeroPair (constantSpace 2 0) .up).operator = 0 := by sorry
example : Direction.down.step = -1 := by sorry
example (S : Space) : (zeroPair S .down).Isomorphic (zeroPair S .down) := by sorry

def standardSpace (m : Multisegment) : Space := by sorry
def standardPair (m : Multisegment) (d : Direction) : Pair (standardSpace m) d := by sorry
def standardVector (m : Multisegment) (i : Fin m.card) (a : ℤ) : (standardSpace m).Carrier := by sorry
def standardBasis (m : Multisegment) :
    Module.Basis {ia : Fin m.card × ℤ | (occurrenceInterval m ia.1).contains ia.2}
      ℂ (standardSpace m).Carrier := by sorry
def pairType {S : Space} {d : Direction} (P : Pair S d) : Multisegment := by sorry
theorem standardSpace_dimension (m : Multisegment) (a : ℤ) :
    (standardSpace m).dimension a = degreeDimension m a := by sorry
theorem standardSpace_n (m : Multisegment) : (standardSpace m).n = totalLength m := by sorry
theorem pairType_standardPair (m : Multisegment) (d : Direction) :
    pairType (standardPair m d) = m := by sorry
theorem standardPair_apply_up (m : Multisegment) (i : Fin m.card) (a : ℤ) :
    (standardPair m .up).operator (standardVector m i a) =
      if (occurrenceInterval m i).contains a ∧ (occurrenceInterval m i).contains (a + 1)
      then standardVector m i (a + 1) else 0 := by sorry
theorem standardPair_apply_down (m : Multisegment) (i : Fin m.card) (a : ℤ) :
    (standardPair m .down).operator (standardVector m i a) =
      if (occurrenceInterval m i).contains a ∧ (occurrenceInterval m i).contains (a - 1)
      then standardVector m i (a - 1) else 0 := by sorry
theorem standardVector_ne_zero_iff (m : Multisegment) (i : Fin m.card) (a : ℤ) :
    standardVector m i a ≠ 0 ↔ (occurrenceInterval m i).contains a := by sorry
theorem standardVector_eq_basis (m : Multisegment) (i : Fin m.card) (a : ℤ)
    (ha : (occurrenceInterval m i).contains a) :
    standardVector m i a = standardBasis m ⟨(i, a), ha⟩ := by sorry
theorem standardVector_mem_grade (m : Multisegment) (i : Fin m.card) (a : ℤ) :
    standardVector m i a ∈ (standardSpace m).grade a := by sorry
-- Strong pair tests: the interval arrow, grading, and operator degree all matter.
-- tests.pair_interval_arrow
example : (standardPair ({intSeg 0 1} : Multisegment) .up).operator ≠ 0 := by sorry
-- tests.pair_grading_matters
example : ¬ (standardPair ({intSeg 0 0} : Multisegment) .up).Isomorphic
    (standardPair ({intSeg 1 0} : Multisegment) .up) := by sorry
-- tests.pair_degree_matters
example : ¬ Homogeneous (standardSpace ({intSeg 0 1} : Multisegment))
    (standardPair ({intSeg 0 1} : Multisegment) .up).operator (-1) := by sorry
-- tests.standard_length
example : (standardSpace ({intSeg 0 2} : Multisegment)).n = 3 := by sorry
-- tests.standard_repetitions
example : (standardSpace ({intSeg 0 1, intSeg 0 1} : Multisegment)).dimension 0 = 2 := by sorry
-- tests.standard_reverse
example : pairType (standardPair ({intSeg 2 0} : Multisegment) .down) = {intSeg 2 0} := by sorry

theorem pair_classification {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) :
    P.Isomorphic Q ↔ pairType P = pairType Q := by sorry
theorem pairType_dimension {S : Space} {d : Direction} (P : Pair S d) (a : ℤ) :
    degreeDimension (pairType P) a = S.dimension a := by sorry

def shiftSpace (S : Space) (c : ℤ) : Space := ⟨S.n, fun i => S.degree i + c⟩
def shiftPair {S : Space} {d : Direction} (P : Pair S d) (c : ℤ) : Pair (shiftSpace S c) d :=
  ⟨P.operator, by sorry⟩
structure ImageModel {S : Space} {d : Direction} (P : Pair S d) where
  space : Space
  pair : Pair space d
  embed : space.Carrier →ₗ[ℂ] S.Carrier
  injective : Function.Injective embed
  range_eq : LinearMap.range embed = LinearMap.range P.operator
  grade_eq : ∀ a, embed '' (space.grade a : Set space.Carrier) =
    (LinearMap.range P.operator : Set S.Carrier) ∩ (S.grade a : Set S.Carrier)
  intertwine : ∀ v, embed (pair.operator v) = P.operator (embed v)
def imagePair {S : Space} {d : Direction} (P : Pair S d) : ImageModel P := by sorry
def iteratedImage {S : Space} {d : Direction} (P : Pair S d) :
    ℕ → Σ R : Space, Pair R d
  | 0 => ⟨S, P⟩
  | k + 1 => let Q := iteratedImage P k; ⟨(imagePair Q.2).space, (imagePair Q.2).pair⟩
theorem pairType_shift {S : Space} {d : Direction} (P : Pair S d) (c : ℤ) :
    pairType (shiftPair P c) = shiftMultisegment (pairType P) c := by sorry
theorem pairType_image_up {S : Space} (P : VN S) :
    pairType (shiftPair (imagePair P).pair (-1)) = rightTruncate (pairType P) := by sorry
theorem pairType_image_down {S : Space} (P : WL S) :
    pairType (imagePair P).pair = rightTruncate (pairType P) := by sorry
-- Image/shift tests distinguish Im N, Im N(-1), and Im L.
-- tests.image_up_unshifted
example : pairType (imagePair (standardPair ({intSeg 0 2} : Multisegment) .up)).pair =
    {intSeg 1 1} := by sorry
-- tests.image_up_shift
example : pairType (shiftPair (imagePair (standardPair ({intSeg 0 2} : Multisegment) .up)).pair (-1)) =
    {intSeg 0 1} := by sorry
-- tests.image_down
example : pairType (imagePair (standardPair ({intSeg 0 2} : Multisegment) .down)).pair =
    {intSeg 0 1} := by sorry

theorem reconstruct_from_image {S R : Space} (P : VN S) (Q : VN R)
    (hdim : ∀ a, S.dimension a = R.dimension a)
    (himage : (imagePair P).pair.Isomorphic (imagePair Q).pair) : P.Isomorphic Q := by sorry

-- MS.2: opposite-degree centralizers and polynomial geometry.
def centralizer {S : Space} {d : Direction} (P : Pair S d) : Submodule ℂ (Module.End ℂ S.Carrier) :=
  { carrier := {T | Homogeneous S T d.opposite.step ∧ T.comp P.operator = P.operator.comp T}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }
def oppositePair {S : Space} {d : Direction} (P : Pair S d) (T : centralizer P) : Pair S d.opposite :=
  ⟨T.val, T.property.1⟩
def restrictCentralizer {S : Space} {d : Direction} (P : Pair S d) :
    centralizer P →ₗ[ℂ] centralizer (imagePair P).pair := by sorry
theorem oppositePair_operator {S : Space} {d : Direction} (P : Pair S d) (T : centralizer P) :
    (oppositePair P T).operator = T.val := by sorry
theorem centralizer_commute {S : Space} {d : Direction} (P : Pair S d) (T : centralizer P) :
    T.val.comp P.operator = P.operator.comp T.val := by sorry
theorem restrictCentralizer_embed {S : Space} {d : Direction} (P : Pair S d)
    (T : centralizer P) (v : (imagePair P).space.Carrier) :
    (imagePair P).embed ((restrictCentralizer P T).val v) = T.val ((imagePair P).embed v) := by sorry
-- tests.centralizer_zero
example (S : Space) : (0 : Module.End ℂ S.Carrier) ∈ centralizer (zeroPair S .up) := by sorry
-- tests.centralizer_one_chain
example : centralizer (standardPair ({intSeg 0 2} : Multisegment) .up) = ⊥ := by sorry
-- tests.centralizer_adjacent_singletons
example : Module.finrank ℂ (centralizer (standardPair ({intSeg 0 0, intSeg 1 0} : Multisegment) .up)) = 1 := by sorry

def Precedes (target source : Interval) : Prop :=
  target.left < source.left ∧ source.left ≤ target.right + 1 ∧ target.right < source.right
theorem centralizer_block_coordinates (source target : Interval) :
    (∃ T : centralizer (standardPair ({source, target} : Multisegment) .up),
      T.val ≠ 0) ↔ Precedes target source ∨ Precedes source target := by sorry
theorem centralizer_coordinates (m : Multisegment) :
    ∃ e : centralizer (standardPair m .up) ≃ₗ[ℂ]
      ({ij : Fin m.card × Fin m.card |
        Precedes (occurrenceInterval m ij.2) (occurrenceInterval m ij.1)} → ℂ),
      ∀ (T : centralizer (standardPair m .up)) (i : Fin m.card) (a : ℤ),
        (occurrenceInterval m i).contains a →
        T.val (standardVector m i a) =
          ∑ j : Fin m.card, if h : Precedes (occurrenceInterval m j) (occurrenceInterval m i)
            then (e T ⟨(i, j), h⟩) • standardVector m j (a - 1) else 0 := by sorry
theorem centralizer_restrict_up_surjective {S : Space} (P : VN S) :
    Function.Surjective (restrictCentralizer P) := by sorry
theorem centralizer_restrict_down_surjective {S : Space} (P : WL S) :
    Function.Surjective (restrictCentralizer P) := by sorry

-- A concrete polynomial topology, deliberately independent of Complex's usual topology.
@[instance_reducible] def polynomialTopology (n : ℕ) : TopologicalSpace (Fin n → ℂ) :=
  TopologicalSpace.generateFrom {U | ∃ p : MvPolynomial (Fin n) ℂ,
    U = {x | MvPolynomial.eval x p ≠ 0}}
@[instance_reducible] def centralizerTopology {S : Space} {d : Direction} (P : Pair S d) :
    TopologicalSpace (centralizer P) := by
  letI : Module.Free ℂ (centralizer P) := Module.Free.of_divisionRing ℂ (centralizer P)
  exact TopologicalSpace.induced (fun v i => (Module.finBasis ℂ (centralizer P)).repr v i)
    (polynomialTopology (Module.finrank ℂ (centralizer P)))
def ZariskiOpenDense {S : Space} {d : Direction} (P : Pair S d) (U : Set (centralizer P)) : Prop :=
  @IsOpen _ (centralizerTopology P) U ∧ @Dense _ (centralizerTopology P) U
theorem polynomial_principal_open (n : ℕ) (p : MvPolynomial (Fin n) ℂ) :
    @IsOpen _ (polynomialTopology n) {x | MvPolynomial.eval x p ≠ 0} := by sorry
theorem centralizer_irreducible {S : Space} {d : Direction} (P : Pair S d) :
    @IsIrreducible _ (centralizerTopology P) Set.univ := by sorry
theorem zariski_finite_intersection {S : Space} {d : Direction} (P : Pair S d)
    (ι : Type) [Fintype ι] (U : ι → Set (centralizer P))
    (h : ∀ i, ZariskiOpenDense P (U i)) : ZariskiOpenDense P (⋂ i, U i) := by sorry
theorem centralizerTopology_basis_independent {S : Space} {d : Direction} (P : Pair S d)
    (b : Module.Basis (Fin (Module.finrank ℂ (centralizer P))) ℂ (centralizer P)) :
    TopologicalSpace.induced (fun v i => b.repr v i)
      (polynomialTopology (Module.finrank ℂ (centralizer P))) = centralizerTopology P := by sorry
theorem zariski_surjective_preimage {S R : Space} {d e : Direction}
    (P : Pair S d) (Q : Pair R e) (f : centralizer P →ₗ[ℂ] centralizer Q)
    (hf : Function.Surjective f) (U : Set (centralizer Q)) (hU : ZariskiOpenDense Q U) :
    ZariskiOpenDense P (f ⁻¹' U) := by sorry
-- tests.zariski_principal
example : @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ | x 0 ≠ 0} := by sorry
-- tests.zariski_dense
example : @Dense _ (polynomialTopology 1) {x : Fin 1 → ℂ | x 0 ≠ 0} := by sorry
-- tests.zariski_not_euclidean
example : ¬ @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ | ‖x 0‖ < 1} := by sorry

def genericType {S : Space} {d : Direction} (P : Pair S d) : Multisegment := by sorry
def genericLocus {S : Space} {d : Direction} (P : Pair S d) : Set (centralizer P) :=
  {T | pairType (oppositePair P T) = genericType P}
theorem generic_rank_locus {S : Space} {d : Direction} (P : Pair S d) :
    ZariskiOpenDense P (genericLocus P) := by sorry
theorem genericType_iso {S R : Space} {d : Direction} {P : Pair S d} {Q : Pair R d}
    (h : P.Isomorphic Q) : genericType P = genericType Q := by sorry
theorem genericType_unique {S : Space} {d : Direction} (P : Pair S d) (m : Multisegment)
    (h : ZariskiOpenDense P {T | pairType (oppositePair P T) = m}) :
    m = genericType P := by sorry
-- tests.generic_chain, tests.generic_adjacent, tests.generic_separated.
-- tests.generic_chain
example : genericType (standardPair ({intSeg 0 2} : Multisegment) .up) =
    {intSeg 0 0, intSeg 1 0, intSeg 2 0} := by sorry
-- tests.generic_adjacent
example : genericType (standardPair ({intSeg 0 0, intSeg 1 0} : Multisegment) .up) =
    {intSeg 0 1} := by sorry
-- tests.generic_separated
example : genericType (standardPair ({intSeg 0 0, intSeg 2 0} : Multisegment) .up) =
    {intSeg 0 0, intSeg 2 0} := by sorry
theorem conormal_generic_symmetry {S : Space} (P : VN S) (L : centralizer P)
    (h : L ∈ genericLocus P) : genericType (oppositePair P L) = pairType P := by sorry

def dual (m : Multisegment) : Multisegment := genericType (standardPair m .up)
theorem dual_generic_up {S : Space} (P : VN S) : genericType P = dual (pairType P) := by sorry
theorem dual_generic_down {S : Space} (P : WL S) : genericType P = dual (pairType P) := by sorry
theorem dual_dimension (m : Multisegment) (a : ℤ) : degreeDimension (dual m) a = degreeDimension m a := by sorry
-- Generic duality tests: a chain becomes singletons; separated degrees stay separated.
-- tests.dual_chain
example : dual ({intSeg 0 2} : Multisegment) = {intSeg 0 0, intSeg 1 0, intSeg 2 0} := by sorry
-- tests.dual_adjacent
example : dual ({intSeg 0 0, intSeg 1 0} : Multisegment) = {intSeg 0 1} := by sorry
-- tests.dual_separated
example : dual ({intSeg 0 0, intSeg 2 0} : Multisegment) = {intSeg 0 0, intSeg 2 0} := by sorry

theorem dual_involutive (m : Multisegment) : dual (dual m) = m := by sorry

-- MS.3: the second genericity condition is essential.
def Admissible {S : Space} (P : VN S) (L : centralizer P) : Prop :=
  pairType (oppositePair P L) = dual (pairType P)
def onOppositeImage {S : Space} (P : VN S) (L : centralizer P) :
    VN (imagePair (oppositePair P L)).space := by sorry
def imageAdmissibleLocus {S : Space} (P : VN S) : Set (centralizer P) :=
  {L | Admissible P L ∧
    pairType (imagePair (oppositePair P L)).pair = dual (pairType (onOppositeImage P L))}
theorem Admissible_iff_generic {S : Space} (P : VN S) (L : centralizer P) :
    Admissible P L ↔ L ∈ genericLocus P := by sorry
theorem onOppositeImage_embed {S : Space} (P : VN S) (L : centralizer P)
    (v : (imagePair (oppositePair P L)).space.Carrier) :
    (imagePair (oppositePair P L)).embed ((onOppositeImage P L).operator v) =
      P.operator ((imagePair (oppositePair P L)).embed v) := by sorry
theorem imageAdmissible_implies_admissible {S : Space} (P : VN S) {L : centralizer P}
    (h : L ∈ imageAdmissibleLocus P) : Admissible P L := by sorry
-- tests.admissible_empty
example : Admissible (standardPair (0 : Multisegment) .up) (0 : centralizer _) := by sorry
-- tests.admissible_non_generic
example : ¬ Admissible (standardPair ({intSeg 0 0, intSeg 1 0} : Multisegment) .up)
    (0 : centralizer _) := by sorry
-- tests.admissible_chain
example : Admissible (standardPair ({intSeg 0 2} : Multisegment) .up) (0 : centralizer _) := by sorry

theorem image_admissible_open_dense {S : Space} (P : VN S) :
    ZariskiOpenDense P (imageAdmissibleLocus P) := by sorry
-- The final conjunct pins Lk to the restriction of this SAME L.
def simultaneousRestrictions {S : Space} (P : VN S) (L : centralizer P) : Prop :=
  ∀ k : ℕ, ∃ Lk : centralizer (iteratedImage P k).2,
    Lk ∈ genericLocus (iteratedImage P k).2 ∧
    Lk ∈ imageAdmissibleLocus (iteratedImage P k).2 ∧
    ∃ e : (iteratedImage P k).1.Carrier →ₗ[ℂ] S.Carrier,
      Function.Injective e ∧ LinearMap.range e = LinearMap.range (P.operator ^ k) ∧
      (∀ a v, v ∈ (iteratedImage P k).1.grade a ↔ e v ∈ S.grade a) ∧
      (∀ v, e ((iteratedImage P k).2.operator v) = P.operator (e v)) ∧
      (∀ v, e (Lk.val v) = L.val (e v))
theorem simultaneous_genericity {S : Space} (P : VN S) :
    ZariskiOpenDense P {L | L ∈ imageAdmissibleLocus P ∧ simultaneousRestrictions P L} := by sorry

def ram (m : Multisegment) : Multisegment := dual (rightTruncate (dual m))
theorem ram_dual (m : Multisegment) : dual (ram m) = rightTruncate (dual m) := by sorry
theorem ram_vn_image {S : Space} (P : VN S) (L : centralizer P)
    (h : L ∈ imageAdmissibleLocus P) : pairType (onOppositeImage P L) = ram (pairType P) := by sorry
theorem ram_totalLength_le (m : Multisegment) : totalLength (ram m) ≤ totalLength m := by sorry
-- tests.ram_chain
example : ram ({intSeg 0 2} : Multisegment) = 0 := by sorry
-- tests.ram_adjacent
example : ram ({intSeg 0 0, intSeg 1 0} : Multisegment) = {intSeg 0 0} := by sorry
-- tests.ram_separated
example : ram ({intSeg 0 0, intSeg 2 0} : Multisegment) = 0 := by sorry
theorem ram_truncate_commute (m : Multisegment) :
    ram (rightTruncate m) = rightTruncate (ram m) := by sorry

-- MS.4: weighted inclusion chains and the adjacent Knight--Zelevinsky formula.
def cutPart (m : Multisegment) (a : ℤ) : Multisegment :=
  m.filter fun s => s.contains a ∨ s.contains (a + 1)
def IsInclusionChain (A : Finset Interval) : Prop :=
  ∀ s ∈ A, ∀ t ∈ A, s.included t ∨ t.included s
def chainWeight (m : Multisegment) (a : ℤ) : ℕ :=
  (((cutPart m a).toFinset.powerset.filter IsInclusionChain).sup
    fun A => ∑ s ∈ A, (cutPart m a).count s)
def adjacentDualCount (m : Multisegment) (a : ℤ) : ℕ :=
  ((dual m).filter fun s => s.contains a ∧ s.contains (a + 1)).card
theorem cutPart_count (m : Multisegment) (a : ℤ) (s : Interval) :
    (cutPart m a).count s = if s.contains a ∨ s.contains (a + 1) then m.count s else 0 := by sorry
theorem chainWeight_le_card (m : Multisegment) (a : ℤ) : chainWeight m a ≤ (cutPart m a).card := by sorry
theorem chainWeight_zero_iff (m : Multisegment) (a : ℤ) :
    chainWeight m a = 0 ↔ cutPart m a = 0 := by sorry
-- tests.cut_meets_not_contains
example : (cutPart ({intSeg 0 0, intSeg 1 0} : Multisegment) 0).card = 2 := by sorry
-- tests.cut_weighted
example : chainWeight ({intSeg 0 1, intSeg 0 1, intSeg 1 0} : Multisegment) 0 = 3 := by sorry
-- tests.cut_not_all_comparable
example : chainWeight ({intSeg 0 0, intSeg 1 0} : Multisegment) 0 = 1 := by sorry

-- Occurrences, rather than distinct intervals, are the vertices of this poset.
def endpointBefore (m : Multisegment) (i j : Fin m.card) : Prop :=
  (occurrenceInterval m i).left < (occurrenceInterval m j).left ∧
    (occurrenceInterval m i).right < (occurrenceInterval m j).right
def IsEndpointAntichain (m : Multisegment) (A : Finset (Fin m.card)) : Prop :=
  ∀ i ∈ A, ∀ j ∈ A, ¬ endpointBefore m i j
def IsEndpointMatching (m : Multisegment) (E : Finset (Fin m.card × Fin m.card)) : Prop :=
  (∀ e ∈ E, endpointBefore m e.1 e.2) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.1 = f.1 → e = f) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.2 = f.2 → e = f)
def matchingNumber (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card × Fin m.card)).powerset.filter
    (IsEndpointMatching m)).sup Finset.card
def antichainWidth (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card)).powerset.filter
    (IsEndpointAntichain m)).sup Finset.card
theorem endpointBefore_irrefl (m : Multisegment) (i : Fin m.card) : ¬ endpointBefore m i i := by sorry
theorem endpointBefore_trans (m : Multisegment) {i j k : Fin m.card}
    (hij : endpointBefore m i j) (hjk : endpointBefore m j k) : endpointBefore m i k := by sorry
theorem matchingNumber_bound (m : Multisegment) : matchingNumber m ≤ m.card := by sorry
theorem matchingNumber_le_iff (m : Multisegment) (k : ℕ) :
    matchingNumber m ≤ k ↔
      ∀ E : Finset (Fin m.card × Fin m.card), IsEndpointMatching m E → E.card ≤ k := by sorry
theorem antichainWidth_le_iff (m : Multisegment) (k : ℕ) :
    antichainWidth m ≤ k ↔
      ∀ A : Finset (Fin m.card), IsEndpointAntichain m A → A.card ≤ k := by sorry
-- tests.poset_equal_copies, tests.poset_adjacent, tests.poset_contained.
-- tests.poset_equal_copies
example : antichainWidth ({intSeg 0 1, intSeg 0 1} : Multisegment) = 2 ∧
    matchingNumber ({intSeg 0 1, intSeg 0 1} : Multisegment) = 0 := by sorry
-- tests.poset_adjacent
example : antichainWidth ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1 ∧
    matchingNumber ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1 := by sorry
-- tests.poset_contained
example : antichainWidth ({intSeg 0 2, intSeg 1 0} : Multisegment) = 2 ∧
    matchingNumber ({intSeg 0 2, intSeg 1 0} : Multisegment) = 0 := by sorry
theorem weighted_dilworth (m : Multisegment) : matchingNumber m + antichainWidth m = m.card := by sorry
theorem cut_antichain_width (m : Multisegment) (a : ℤ) :
    antichainWidth (cutPart m a) = chainWeight m a := by sorry
theorem adjacent_generic_rank (m : Multisegment) (a : ℤ) :
    adjacentDualCount m a = matchingNumber (cutPart m a) := by sorry

structure GridPath (r a : ℕ) where
  vertex : Fin (r + 1) → ℤ × ℤ
  start : vertex 0 = ((a : ℤ) + 1, (a : ℤ))
  finish : vertex (Fin.last r) = (1, (r : ℤ))
  steps : ∀ k : Fin r,
    vertex k.succ = ((vertex k.castSucc).1 - 1, (vertex k.castSucc).2) ∨
    vertex k.succ = ((vertex k.castSucc).1, (vertex k.castSucc).2 + 1)
def intervalWeight (m : Multisegment) (i j : ℤ) : ℕ :=
  if h : i ≤ j then m.count ⟨i, j, h⟩ else 0
def GridPath.weight {r a : ℕ} (p : GridPath r a) (m : Multisegment) : ℕ :=
  ∑ k : Fin (r + 1), intervalWeight m (p.vertex k).1 (p.vertex k).2
def InWindow (m : Multisegment) (r : ℕ) : Prop := ∀ s ∈ m, 1 ≤ s.left ∧ s.right ≤ r
theorem GridPath.nested {r a : ℕ} (p : GridPath r a) (k l : Fin (r + 1)) (h : k ≤ l) :
    (p.vertex l).1 ≤ (p.vertex k).1 ∧ (p.vertex k).2 ≤ (p.vertex l).2 := by sorry
theorem GridPath.invalid_start_weight (m : Multisegment) (a : ℕ) : intervalWeight m (a + 1) a = 0 := by sorry
theorem GridPath.weight_bound {r a : ℕ} (p : GridPath r a) (m : Multisegment)
    (ha : 1 ≤ a) (har : a < r) (hm : InWindow m r) : p.weight m ≤ chainWeight m a := by sorry
-- Grid tests fix the corrected terminal point and distinguish weights from vertex counts.
-- tests.grid_terminal
example (p : GridPath 3 1) : p.vertex (Fin.last 3) = (1, 3) := by sorry
-- tests.grid_invalid
example : intervalWeight ({intSeg 1 2} : Multisegment) 2 1 = 0 := by sorry
-- tests.grid_multiplicity
example : intervalWeight ({intSeg 1 2, intSeg 1 2} : Multisegment) 1 3 = 2 := by sorry
theorem grid_path_chain_max (m : Multisegment) {r a : ℕ} (ha : 1 ≤ a) (har : a < r)
    (hm : InWindow m r) : ∃ p : GridPath r a, p.weight m = chainWeight m a := by sorry
theorem adjacent_chain_formula (m : Multisegment) (a : ℤ) :
    adjacentDualCount m a + chainWeight m a = (cutPart m a).card := by sorry

-- MS.5: only the canonical maximal split has this ramified additivity.
theorem truncate_maximalPart (m : Multisegment) :
    maximalPart (rightTruncate m) = rightTruncate (maximalPart m) := by sorry
theorem truncate_remainder (m : Multisegment) :
    remainder (rightTruncate m) = rightTruncate (remainder m) := by sorry
theorem chainWeight_peeling (m : Multisegment) (a : ℤ) (h : cutPart m a ≠ 0) :
    chainWeight m a = chainWeight (remainder m) a + 1 ∧
      chainWeight (maximalPart m) a = 1 := by sorry
theorem chainWeight_peeling_empty (m : Multisegment) (a : ℤ) (h : cutPart m a = 0) :
    chainWeight m a = 0 ∧ chainWeight (remainder m) a = 0 ∧
      chainWeight (maximalPart m) a = 0 := by sorry
theorem ram_maximal_split (m : Multisegment) :
    ram m = ram (maximalPart m) + ram (remainder m) := by sorry
example : ram ({intSeg 0 0} + {intSeg 1 0} : Multisegment) ≠
    ram ({intSeg 0 0} : Multisegment) + ram ({intSeg 1 0} : Multisegment) := by sorry
example : ram ({intSeg 0 0, intSeg 1 1, intSeg 1 1, intSeg 2 0} : Multisegment) =
    {intSeg 0 0} := by sorry

def newformExample : Multisegment :=
  {intSeg 5 1, intSeg 3 4, intSeg 3 1, intSeg 2 3, intSeg 3 0, intSeg 1 1, intSeg 0 0}
theorem newform_example_ram : ram newformExample =
    {intSeg 4 0, intSeg 2 3, intSeg 1 1, intSeg 0 0} := by sorry

/-
MS.5 representation_duality_comparison: pending supplier signatures.
For a finite extension F of Q_p and an unramified character chi of F^*,
transport integer intervals to the supplier's chi-cuspidal line. On its actual
smooth irreducible GL_n(F) carrier, L(m) is isomorphic to Z(dual m). This uses
early segment classification from ET.6, reconciled with current upstream
SmoothRepresentationsOfLocalGroups SR.5.3. No second smooth representation
carrier, axiomatic comparison predicate or arbitrary representation-valued
oracle is introduced here. G2 records the missing carrier/normalization adapter
and the reduction of the representation comparison proof in MW II.13 to actual
supplier declarations. The geometric label comparison remains owned here.
-/
end TauCeti.MultisegmentDuality
