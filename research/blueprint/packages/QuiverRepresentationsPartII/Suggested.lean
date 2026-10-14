import Mathlib
import TauCeti.LinearAlgebra.Graded.LinearMap

/-!
# QuiverRepresentationsPartII: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs, and is not exhaustive. Intervals
are nonempty and integral; multisegments retain occurrence multiplicities.
Coordinates allow repeated grades, shifts add to the degree labels, and the
polynomial topology is supplied explicitly rather than using Complex's usual
topology. Interval classification, generic-type constructions, and the actual
smooth-representation comparison are specified in the README.
-/

noncomputable section
attribute [local instance] Classical.propDecidable
open scoped BigOperators

namespace TauCetiRoadmap.QuiverRepresentationsPartII

/-! ## Layer 0: integer multisegments and maximal peeling -/

/-- A nonempty closed interval with integer endpoints. -/
structure Interval where
  left : ℤ
  right : ℤ
  nonempty : left ≤ right
  deriving DecidableEq

/-- The interval `[a,a+k]`, where k is its length minus one. -/
def intSeg (a : ℤ) (k : ℕ) : Interval :=
  ⟨a, a + k, by omega⟩

/-- Inclusive membership in an integral interval. -/
def Interval.contains (s : Interval) (a : ℤ) : Prop :=
  s.left ≤ a ∧ a ≤ s.right

/-- Inclusion of the first interval in the second. -/
def Interval.included (s t : Interval) : Prop :=
  t.left ≤ s.left ∧ s.right ≤ t.right

/-- The positive number of integer grades in an interval. -/
def Interval.length (s : Interval) : ℕ :=
  (s.right - s.left + 1).toNat

/-- Translation adds c to both endpoints, matching the shift of grade labels. -/
def Interval.shift (s : Interval) (c : ℤ) : Interval :=
  ⟨s.left + c, s.right + c, by have := s.nonempty; omega⟩

/-- Right shortening deletes a singleton rather than retaining an empty interval. -/
def Interval.shorten (s : Interval) : Option Interval :=
  if h : s.left < s.right then some ⟨s.left, s.right - 1, by omega⟩ else none

example : (intSeg 0 2).contains 2 ∧ ¬ (intSeg 0 2).contains 3 := by sorry
example : (intSeg 1 0).included (intSeg 0 2) := by sorry
example : ¬ (intSeg 0 2).included (intSeg 1 0) := by sorry
example : (intSeg 3 0).length = 1 ∧ (intSeg 0 2).length = 3 := by sorry
example : (intSeg 2 2).shift (-1) = intSeg 1 2 := by sorry
example : (intSeg 3 0).shorten = none := by sorry
example : (intSeg 3 1).shorten = some (intSeg 3 0) := by sorry

/-- A finite multiset of intervals; equal intervals remain different occurrences. -/
abbrev Multisegment := Multiset Interval

/-- Shorten every occurrence and delete exactly the singleton occurrences. -/
def rightTruncate (m : Multisegment) : Multisegment :=
  m.bind fun s => match s.shorten with
    | none => 0
    | some t => {t}

/-- Translate every occurrence, without merging copies. -/
def shiftMultisegment (m : Multisegment) (c : ℤ) : Multisegment :=
  m.map (·.shift c)

/-- The dimension at grade a, computed with full multiplicities. -/
def degreeDimension (m : Multisegment) (a : ℤ) : ℕ :=
  (m.filter fun s => s.contains a).card

/-- Total dimension, as the sum of the lengths of all interval occurrences. -/
def totalLength (m : Multisegment) : ℕ :=
  (m.map Interval.length).sum

/-- Occurrence labels obtained from one representative list of the multiset. -/
def occurrenceInterval (m : Multisegment) (i : Fin m.card) : Interval :=
  m.toList[i.val]'(by simp)

/-- One copy of each distinct inclusion-maximal interval. -/
def maximalPart (m : Multisegment) : Multisegment :=
  (m.toFinset.filter fun s => ∀ t ∈ m.toFinset, s.included t → s = t).val

/-- Subtract the one-copy maximal part, retaining every other occurrence. -/
def remainder (m : Multisegment) : Multisegment :=
  m - maximalPart m

/-- The canonical maximal part and its remainder recover the original multiset. -/
theorem maximalPart_add_remainder (m : Multisegment) :
    maximalPart m + remainder m = m := by sorry

/-- Right truncation decreases total length by the number of interval occurrences. -/
theorem totalLength_rightTruncate (m : Multisegment) :
    totalLength (rightTruncate m) + m.card = totalLength m := by sorry

example : rightTruncate ({intSeg 1 1, intSeg 1 1} : Multisegment) =
    {intSeg 1 0, intSeg 1 0} := by sorry
example : rightTruncate ({intSeg 0 0, intSeg 1 2} : Multisegment) =
    {intSeg 1 1} := by sorry
example : shiftMultisegment ({intSeg 2 2, intSeg 2 2} : Multisegment) (-1) =
    {intSeg 1 2, intSeg 1 2} := by sorry
example : degreeDimension ({intSeg 0 2, intSeg 1 0} : Multisegment) 1 = 2 := by sorry
example : totalLength ({intSeg 0 2, intSeg 1 0} : Multisegment) = 4 := by sorry
example : occurrenceInterval ({intSeg 0 1, intSeg 0 1} : Multisegment)
    ⟨0, by simp⟩ =
    intSeg 0 1 := by sorry
example : maximalPart ({intSeg 0 2, intSeg 0 2} : Multisegment) =
    {intSeg 0 2} := by sorry
example : remainder ({intSeg 0 2, intSeg 1 0} : Multisegment) =
    {intSeg 1 0} := by sorry
example : maximalPart ({intSeg 0 0, intSeg 2 0} : Multisegment) =
    {intSeg 0 0, intSeg 2 0} := by sorry

/-! ## Layer 1: graded operators, shifts, and actual images -/

/-- A finite coordinate space with an arbitrary integer degree at every basis index. -/
structure Space where
  n : ℕ
  degree : Fin n → ℤ

/-- The complex coordinate vector space of a graded presentation. -/
abbrev Space.Carrier (S : Space) := Fin S.n → ℂ

/-- The submodule of vectors supported on basis indices of degree a. -/
def Space.grade (S : Space) (a : ℤ) : Submodule ℂ S.Carrier where
  carrier := {v | ∀ i, S.degree i ≠ a → v i = 0}
  zero_mem' := by simp
  add_mem' := by intro x y hx hy i hi; simp [hx i hi, hy i hi]
  smul_mem' := by intro c v hv i hi; simp [hv i hi]

/-- Dimension of the actual grade submodule. -/
def Space.dimension (S : Space) (a : ℤ) : ℕ :=
  Module.finrank ℂ (S.grade a)

/-- Place n basis vectors in the same degree. -/
def constantSpace (n : ℕ) (a : ℤ) : Space := ⟨n, fun _ => a⟩

/-- The two allowed nonzero degree steps. -/
inductive Direction | up | down deriving DecidableEq

/-- The integer degree change of an up or down operator. -/
def Direction.step : Direction → ℤ
  | .up => 1
  | .down => -1

/-- Reverse the degree direction. -/
def Direction.opposite : Direction → Direction
  | .up => .down
  | .down => .up

/-- Tau Ceti homogeneity specialized to the coordinate grading. -/
abbrev Homogeneous (S : Space) (T : Module.End ℂ S.Carrier) (c : ℤ) : Prop :=
  TauCeti.LinearMap.IsHomogeneous T S.grade S.grade c

/-- A VN or WL pair with an actual endomorphism and its degree condition. -/
structure Pair (S : Space) (d : Direction) where
  operator : Module.End ℂ S.Carrier
  homogeneous : Homogeneous S operator d.step

/-- A grade-preserving linear equivalence intertwining two operators. -/
structure PairIso {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) where
  equiv : S.Carrier ≃ₗ[ℂ] R.Carrier
  graded : ∀ a v, v ∈ S.grade a ↔ equiv v ∈ R.grade a
  intertwine : ∀ v, equiv (P.operator v) = Q.operator (equiv v)

/-- Graded isomorphism includes the operator intertwining equation. -/
def Pair.Isomorphic {S R : Space} {d : Direction} (P : Pair S d) (Q : Pair R d) : Prop :=
  Nonempty (PairIso P Q)

/-- The zero operator on any finite grading in either direction. -/
def zeroPair (S : Space) (d : Direction) : Pair S d :=
  ⟨0, by intro a v hv; simp [Space.grade]⟩

/-- Shifting by c adds c to every basis degree: V(c)_a = V_(a-c). -/
def shiftSpace (S : Space) (c : ℤ) : Space :=
  ⟨S.n, fun i => S.degree i + c⟩

/-- The grading is an internal direct sum, including the zero presentation. -/
theorem Space.internal (S : Space) : DirectSum.IsInternal S.grade := by sorry

/-- Every up or down pair is nilpotent because the grading has finite support. -/
theorem Pair.nilpotent {S : Space} {d : Direction} (P : Pair S d) :
    ∃ k : ℕ, P.operator ^ k = 0 := by sorry

example : (constantSpace 2 3).dimension 3 = 2 := by sorry
example : (constantSpace 2 3).dimension 4 = 0 := by sorry
example : (constantSpace 0 0).grade 0 = ⊥ := by sorry
example : Direction.down.step = -1 ∧ Direction.up.opposite = Direction.down := by sorry
example (S : Space) : (zeroPair S .up).operator = 0 := by sorry
example (S : Space) : (zeroPair S .up).Isomorphic (zeroPair S .up) := by sorry
example : ¬ (zeroPair (constantSpace 1 0) .up).Isomorphic
    (zeroPair (constantSpace 1 1) .up) := by sorry
example : (shiftSpace (constantSpace 1 2) (-1)).degree ⟨0, by decide⟩ = 1 := by sorry
example : Homogeneous (constantSpace 2 0) (0 : Module.End ℂ _) (-1) := by sorry
example : ¬ Homogeneous (constantSpace 1 0) (LinearMap.id : Module.End ℂ _) 1 := by sorry

/-- A concrete up-arrow matrix on two coordinates, used to distinguish degree signs. -/
def upArrow : Module.End ℂ (Fin 2 → ℂ) :=
  Matrix.mulVecLin (fun i j : Fin 2 => if i = 1 ∧ j = 0 then (1 : ℂ) else 0)

example : upArrow ![1, 0] = ![0, 1] := by sorry
example : Homogeneous (⟨2, fun i => (i.val : ℤ)⟩ : Space) upArrow 1 ∧
    ¬ Homogeneous (⟨2, fun i => (i.val : ℤ)⟩ : Space) upArrow (-1) := by sorry

/-! ## Layer 2: centralizers and generic multisegment duality -/

/-- The allowed descending block from the source interval to the target interval. -/
def Precedes (target source : Interval) : Prop :=
  target.left < source.left ∧ source.left ≤ target.right + 1 ∧
    target.right < source.right

/-- Opposite-degree endomorphisms commuting with the pair's operator. -/
def centralizer {S : Space} {d : Direction} (P : Pair S d) :
    Submodule ℂ (Module.End ℂ S.Carrier) where
  carrier := {T | Homogeneous S T d.opposite.step ∧
    T.comp P.operator = P.operator.comp T}
  zero_mem' := by
    constructor
    · intro a v hv
      simp
    · simp
  add_mem' := by
    intro T U hT hU
    constructor
    · intro a v hv
      exact (S.grade _).add_mem (hT.1 hv) (hU.1 hv)
    · apply LinearMap.ext
      intro v
      have ht := LinearMap.congr_fun hT.2 v
      have hu := LinearMap.congr_fun hU.2 v
      simpa using congrArg₂ (· + ·) ht hu
  smul_mem' := by
    intro c T hT
    constructor
    · intro a v hv
      exact (S.grade _).smul_mem c (hT.1 hv)
    · apply LinearMap.ext
      intro v
      have ht := LinearMap.congr_fun hT.2 v
      simpa using congrArg (c • ·) ht

/-- Polynomial nonvanishing sets generate the complex-point Zariski topology. -/
@[instance_reducible] def polynomialTopology (n : ℕ) : TopologicalSpace (Fin n → ℂ) :=
  TopologicalSpace.generateFrom {U | ∃ p : MvPolynomial (Fin n) ℂ,
    U = {x | MvPolynomial.eval x p ≠ 0}}

/-- Finite complex affine coordinate space is irreducible for its polynomial topology. -/
theorem polynomial_irreducible (n : ℕ) :
    @IsIrreducible _ (polynomialTopology n) Set.univ := by sorry

example : Precedes (intSeg 0 0) (intSeg 1 0) := by sorry
example : ¬ Precedes (intSeg 0 2) (intSeg 0 2) := by sorry
example : ¬ Precedes (intSeg 0 0) (intSeg 2 0) := by sorry
example (S : Space) : (0 : Module.End ℂ S.Carrier) ∈ centralizer (zeroPair S .up) := by sorry
example : Module.finrank ℂ (centralizer (zeroPair
    (⟨2, fun i => (i.val : ℤ)⟩ : Space) .up)) = 1 := by sorry
example : @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ | x 0 ≠ 0} ∧
    @Dense _ (polynomialTopology 1) {x : Fin 1 → ℂ | x 0 ≠ 0} := by sorry
example : ¬ @IsOpen _ (polynomialTopology 1) {x : Fin 1 → ℂ | ‖x 0‖ < 1} := by sorry

/-! ## Layer 3: admissible images and ramified truncation -/

/-- Commutativity makes the actual image of N stable under L. -/
theorem commuting_range_stable {S : Space} (N L : Module.End ℂ S.Carrier)
    (h : L.comp N = N.comp L) :
    ∀ v ∈ LinearMap.range N, L v ∈ LinearMap.range N := by sorry

example : LinearMap.range (0 : Module.End ℂ (Fin 0 → ℂ)) = ⊥ := by sorry

/-! ## Layer 4: weighted chains and adjacent generic ranks -/

/-- Retain all occurrences meeting at least one of the two adjacent grades. -/
def cutPart (m : Multisegment) (a : ℤ) : Multisegment :=
  m.filter fun s => s.contains a ∨ s.contains (a + 1)

/-- A finite set of distinct intervals is pairwise comparable by inclusion. -/
def IsInclusionChain (A : Finset Interval) : Prop :=
  ∀ s ∈ A, ∀ t ∈ A, s.included t ∨ t.included s

/-- Maximum inclusion-chain weight, counting all copies at the adjacent cut. -/
def chainWeight (m : Multisegment) (a : ℤ) : ℕ :=
  (((cutPart m a).toFinset.powerset.filter IsInclusionChain).sup
    fun A => ∑ s ∈ A, (cutPart m a).count s)

/-- Both endpoints must strictly increase; duplicate occurrences are incomparable. -/
def endpointBefore (m : Multisegment) (i j : Fin m.card) : Prop :=
  (occurrenceInterval m i).left < (occurrenceInterval m j).left ∧
    (occurrenceInterval m i).right < (occurrenceInterval m j).right

/-- An antichain has no strict endpoint-order edge between any of its labels. -/
def IsEndpointAntichain (m : Multisegment) (A : Finset (Fin m.card)) : Prop :=
  ∀ i ∈ A, ∀ j ∈ A, ¬ endpointBefore m i j

/-- A split-graph matching has endpoint edges and injective projections in both roles. -/
def IsEndpointMatching (m : Multisegment) (E : Finset (Fin m.card × Fin m.card)) : Prop :=
  (∀ e ∈ E, endpointBefore m e.1 e.2) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.1 = f.1 → e = f) ∧
    (∀ e ∈ E, ∀ f ∈ E, e.2 = f.2 → e = f)

/-- Maximum number of edges in an occurrence endpoint matching. -/
def matchingNumber (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card × Fin m.card)).powerset.filter
    (IsEndpointMatching m)).sup Finset.card

/-- Maximum number of labels in an occurrence endpoint antichain. -/
def antichainWidth (m : Multisegment) : ℕ :=
  ((Finset.univ : Finset (Fin m.card)).powerset.filter
    (IsEndpointAntichain m)).sup Finset.card

/-- Finite Dilworth expressed through occurrence split-graph matching. -/
theorem weighted_dilworth (m : Multisegment) :
    matchingNumber m + antichainWidth m = m.card := by sorry

/-- At an adjacent cut, endpoint antichains are full weighted inclusion chains. -/
theorem cut_antichain_width (m : Multisegment) (a : ℤ) :
    antichainWidth (cutPart m a) = chainWeight m a := by sorry

example : (cutPart ({intSeg 0 0, intSeg 1 0} : Multisegment) 0).card = 2 := by sorry
example : IsInclusionChain {intSeg 0 2, intSeg 1 0} := by sorry
example : ¬ IsInclusionChain {intSeg 0 0, intSeg 1 0} := by sorry
example : chainWeight ({intSeg 0 1, intSeg 0 1, intSeg 1 0} : Multisegment) 0 = 3 := by sorry
example : chainWeight ({intSeg 0 0, intSeg 1 0} : Multisegment) 0 = 1 := by sorry
example : ¬ endpointBefore ({intSeg 0 1, intSeg 0 1} : Multisegment)
    ⟨0, by simp⟩ ⟨1, by simp⟩ := by sorry
example : IsEndpointAntichain ({intSeg 0 1, intSeg 0 1} : Multisegment) Finset.univ := by sorry
example : IsEndpointMatching (0 : Multisegment) ∅ := by sorry
example : ¬ IsEndpointMatching ({intSeg 0 1, intSeg 0 1} : Multisegment)
    {(⟨0, by simp⟩, ⟨1, by simp⟩)} := by sorry
example (m : Multisegment) (i j k : Fin m.card)
    (hij : endpointBefore m i j) (hik : endpointBefore m i k) (hjk : j ≠ k) :
    ¬ IsEndpointMatching m {(i, j), (i, k)} := by sorry
example (m : Multisegment) (i j k : Fin m.card)
    (hik : endpointBefore m i k) (hjk : endpointBefore m j k) (hij : i ≠ j) :
    ¬ IsEndpointMatching m {(i, k), (j, k)} := by sorry
example : antichainWidth ({intSeg 0 1, intSeg 0 1} : Multisegment) = 2 ∧
    matchingNumber ({intSeg 0 1, intSeg 0 1} : Multisegment) = 0 := by sorry
example : antichainWidth ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1 ∧
    matchingNumber ({intSeg 0 0, intSeg 1 0} : Multisegment) = 1 := by sorry
example : antichainWidth ({intSeg 0 2, intSeg 1 0} : Multisegment) = 2 ∧
    matchingNumber ({intSeg 0 2, intSeg 1 0} : Multisegment) = 0 := by sorry

/-- A monotone r-step path from the invalid initial vertex to the terminal vertex. -/
structure GridPath (r a : ℕ) where
  vertex : Fin (r + 1) → ℤ × ℤ
  start : vertex 0 = ((a : ℤ) + 1, (a : ℤ))
  finish : vertex (Fin.last r) = (1, (r : ℤ))
  steps : ∀ k : Fin r,
    vertex k.succ = ((vertex k.castSucc).1 - 1, (vertex k.castSucc).2) ∨
    vertex k.succ = ((vertex k.castSucc).1, (vertex k.castSucc).2 + 1)

/-- An invalid endpoint pair has weight zero; a valid pair has its full multiplicity. -/
def intervalWeight (m : Multisegment) (i j : ℤ) : ℕ :=
  if h : i ≤ j then m.count ⟨i, j, h⟩ else 0

/-- Sum the multiplicity weights over every vertex of the path. -/
def GridPath.weight {r a : ℕ} (p : GridPath r a) (m : Multisegment) : ℕ :=
  ∑ k : Fin (r + 1), intervalWeight m (p.vertex k).1 (p.vertex k).2

/-- Every occurrence lies in the finite interval `[1,r]`. -/
def InWindow (m : Multisegment) (r : ℕ) : Prop :=
  ∀ s ∈ m, 1 ≤ s.left ∧ s.right ≤ r

/-- Path weights are bounded by the weighted chain maximum in an interior support window. -/
theorem GridPath.weight_bound {r a : ℕ} (p : GridPath r a) (m : Multisegment)
    (ha : 1 ≤ a) (har : a < r) (hm : InWindow m r) :
    p.weight m ≤ chainWeight m a := by sorry

/-- Some path realizes the weighted chain maximum; paths and chains need not be bijective. -/
theorem grid_path_chain_max (m : Multisegment) {r a : ℕ}
    (ha : 1 ≤ a) (har : a < r) (hm : InWindow m r) :
    ∃ p : GridPath r a, p.weight m = chainWeight m a := by sorry

example (p : GridPath 3 1) : p.vertex (Fin.last 3) = (1, 3) := by sorry
example : intervalWeight ({intSeg 1 2} : Multisegment) 2 1 = 0 := by sorry
example : intervalWeight ({intSeg 1 2, intSeg 1 2} : Multisegment) 1 3 = 2 := by sorry
example (p : GridPath 3 1) : p.weight (0 : Multisegment) = 0 := by sorry
example (p : GridPath 3 1) : p.weight ({intSeg 1 2, intSeg 1 2} : Multisegment) = 2 :=
  by sorry
example : InWindow ({intSeg 1 2} : Multisegment) 3 := by sorry
example : ¬ InWindow ({intSeg 0 1} : Multisegment) 3 := by sorry

/-! ## Layer 5: the canonical ramified split and representation interfaces -/

/-- Truncation preserves the distinct one-copy maximal part. -/
theorem truncate_maximalPart (m : Multisegment) :
    maximalPart (rightTruncate m) = rightTruncate (maximalPart m) := by sorry

/-- Truncation preserves the multiplicity-sensitive remainder. -/
theorem truncate_remainder (m : Multisegment) :
    remainder (rightTruncate m) = rightTruncate (remainder m) := by sorry

/-- A nonempty cut loses precisely one unit of chain weight under maximal peeling. -/
theorem chainWeight_peeling (m : Multisegment) (a : ℤ) (h : cutPart m a ≠ 0) :
    chainWeight m a = chainWeight (remainder m) a + 1 ∧
      chainWeight (maximalPart m) a = 1 := by sorry

/-- For an empty cut all three chain weights are zero, with no spurious increment. -/
theorem chainWeight_peeling_empty (m : Multisegment) (a : ℤ) (h : cutPart m a = 0) :
    chainWeight m a = 0 ∧ chainWeight (remainder m) a = 0 ∧
      chainWeight (maximalPart m) a = 0 := by sorry

example : chainWeight (0 : Multisegment) 0 = 0 := by sorry
example : ¬ chainWeight (0 : Multisegment) 0 = chainWeight (remainder 0) 0 + 1 := by sorry

/-- The seven-interval newform example of AKY section 2.5, of total length seventeen. -/
def newformExample : Multisegment :=
  {intSeg 5 1, intSeg 3 4, intSeg 3 1, intSeg 2 3, intSeg 3 0,
    intSeg 1 1, intSeg 0 0}

example : newformExample.card = 7 ∧ totalLength newformExample = 17 := by sorry
example : degreeDimension newformExample 3 = 4 := by sorry

/-
README constructions and targets not declared here:
VN, WL, standardSpace, standardPair, standardVector, standardBasis, pairType,
shiftPair, ImageModel, imagePair, iteratedImage, oppositePair, restrictCentralizer,
centralizerTopology, ZariskiOpenDense, genericType, genericLocus,
genericType_shift, genericLocus_shift, dual_shift, ram_shift,
commutingIncidence and its orbit conormal comparisons, dual, Admissible,
onOppositeImage, imageAdmissibleLocus, simultaneousRestrictions, ram,
adjacentDualCount, adjacent_generic_rank, adjacent_chain_formula,
ram_truncate_commute, ram_maximal_split, integralSegmentAdapter, mwLabel,
representation_duality_comparison, newform_example_ram.
The comparison inputs mwLabel_generic, mwLabel_representation,
mw_singleton_extract, mw_involution_embedding, mw_right_singleton_candidates,
and mw_algorithm_reinsertion are also specified in the README.
-/

end TauCetiRoadmap.QuiverRepresentationsPartII
