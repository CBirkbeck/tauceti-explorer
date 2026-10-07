import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RingTheory.PowerSeries.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. This is a signature prototype; no implementation is claimed.

G4 is the precise global-signature boundary. WeightedFlag, evaluation and section maps
use native modules. CoparabolicZero uses the actual formal-disc lattice, in coordinates.
ParabolicBundle below retains only rank, determinant degree and marked fibre flags:
the underlying curve, locally free sheaf, fibre comparison and degree map are omitted.
SubbundleData/QuotientData are numerical and fibre data supplied by ordinary geometry;
a catalogue is supplied for saturated global subbundles. No assertion makes every such
numerical datum into a global subbundle. In particular arbitrary catalogues do not
certify global semistability. Normalized duals retain their numerical/fibre portion.

The named global theorems have their local, numerical or filtered-representation
portions here. Their omitted hypotheses/carriers are inventoried at the end and in G4.
No unavailable geometric hypothesis, VMHS, versality or unitarity is replaced by an
opaque proposition. Every packet API/test name has a declaration or labelled example;
global comparisons in those tests need the explicit supplier completion in G4.
-/

noncomputable section
namespace TauCeti.ParabolicBounds
open scoped PowerSeries
open Module

variable {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]

structure WeightedFlag (V : Type*) [AddCommGroup V] [Module ℂ V] where
  length : ℕ
  flag : ℕ → Submodule ℂ V
  weight : ℕ → ℝ
  first : flag 0 = ⊤
  tail : ∀ i, length ≤ i → flag i = ⊥
  strict : ∀ i, i < length → flag (i + 1) < flag i
  nonneg : ∀ i, i < length → 0 ≤ weight i
  lt_one : ∀ i, i < length → weight i < 1
  increasing : ∀ i j, i < j → j < length → weight i < weight j
  weight_tail : ∀ i, length ≤ i → weight i = 0

namespace WeightedFlag

def trivial (V : Type*) [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : WeightedFlag V where
  length := if finrank ℂ V = 0 then 0 else 1
  flag i := if i = 0 then ⊤ else ⊥
  weight i := if i = 0 ∧ finrank ℂ V ≠ 0 then a else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

def gradedRank (F : WeightedFlag V) (i : ℕ) : ℕ :=
  finrank ℂ (F.flag i) - finrank ℂ (F.flag (i + 1))

def contribution (F : WeightedFlag V) : ℝ :=
  ∑ i ∈ Finset.range F.length, F.weight i * (F.gradedRank i : ℝ)

theorem gradedRank_sum (F : WeightedFlag V) :
    (∑ i ∈ Finset.range F.length, F.gradedRank i) = finrank ℂ V := by
  sorry

theorem ext (F G : WeightedFlag V) (hm : F.length = G.length)
    (hf : F.flag = G.flag) (hw : F.weight = G.weight) : F = G := by
  sorry

def transport {W : Type*} [AddCommGroup W] [Module ℂ W]
    (e : V ≃ₗ[ℂ] W) (F : WeightedFlag V) : WeightedFlag W := by
  sorry

-- Auxiliary coordinate models, not additional global roadmap objects.
def twoStep (a b : ℝ) (h : 0 ≤ a ∧ a < b ∧ b < 1) :
    WeightedFlag (Fin 2 → ℂ) where
  length := 2
  flag i := if i = 0 then ⊤ else if i = 1 then ℂ ∙ (Pi.single 1 1) else ⊥
  weight i := if i = 0 then a else if i = 1 then b else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

def coordinateThreshold (n : ℕ) (eigen : Fin n → ℝ) (a : ℝ) :
    Submodule ℂ (Fin n → ℂ) where
  carrier := {v | ∀ i, eigen i < a → v i = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

def residueFlag (n : ℕ) (eigen : Fin n → ℝ) (heigen : ∀ i, 0 ≤ eigen i ∧ eigen i < 1) :
    WeightedFlag (Fin n → ℂ) := by
  sorry

-- TauCeti.ParabolicBounds.WeightedFlag.one_step_half
example : (trivial ℂ (1/2) (by norm_num)).gradedRank 0 = 1 ∧
    (trivial ℂ (1/2) (by norm_num)).contribution = 1/2 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.zero_empty
example : (trivial (Fin 0 → ℂ) 0 (by norm_num)).length = 0 ∧
    (trivial (Fin 0 → ℂ) 0 (by norm_num)).contribution = 0 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.weight_one_excluded
example (F : WeightedFlag V) (h : 0 < F.length) : F.weight 0 ≠ 1 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.transport_native
example (F : WeightedFlag V) : transport (LinearEquiv.refl ℂ V) F = F := by
  sorry
end WeightedFlag

structure ParabolicBundle (J : Type*) where
  rank : ℕ
  ordinaryDegree : ℤ
  markedFlag : J → WeightedFlag (Fin rank → ℂ)

variable {J : Type*} [Fintype J]
namespace ParabolicBundle

def trivial (J : Type*) (r : ℕ) (d : ℤ) : ParabolicBundle J where
  rank := r
  ordinaryDegree := d
  markedFlag _ := WeightedFlag.trivial (Fin r → ℂ) 0 (by norm_num)

-- The rank projection is the structure projection ParabolicBundle.rank.

theorem residueWeights (n : ℕ) (eigen : Fin n → ℝ)
    (heigen : ∀ i, 0 ≤ eigen i ∧ eigen i < 1) (a : ℝ) (ha : 0 ≤ a ∧ a < 1) :
    ∃ k, (WeightedFlag.residueFlag n eigen heigen).flag k =
      WeightedFlag.coordinateThreshold n eigen a := by
  sorry

theorem ext (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (hf : HEq P.markedFlag Q.markedFlag) : P = Q := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.no_marks
example (r : ℕ) (d : ℤ) (P : ParabolicBundle Empty)
    (hr : P.rank = r) (hd : P.ordinaryDegree = d) : P = trivial Empty r d := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.trivial_weights
example (r : ℕ) (d : ℤ) (j : J) (i : ℕ) :
    ((trivial J r d).markedFlag j).weight i = 0 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.rank_two_weights
example : (WeightedFlag.twoStep 0 (1/3) (by norm_num)).gradedRank 0 = 1 ∧
    (WeightedFlag.twoStep 0 (1/3) (by norm_num)).gradedRank 1 = 1 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.residue_sign
example : Complex.exp (-2 * Real.pi * Complex.I * (1/3 : ℂ)) ≠
    Complex.exp (2 * Real.pi * Complex.I * (1/3 : ℂ)) := by
  sorry
end ParabolicBundle

-- The following are fibre/degree portions of supplied ordinary subbundles and quotients.
structure SubbundleData (P : ParabolicBundle J) where
  rank : ℕ
  ordinaryDegree : ℤ
  fibreMap : J → (Fin rank → ℂ) →ₗ[ℂ] (Fin P.rank → ℂ)
  injective : ∀ j, Function.Injective (fibreMap j)
  rank_le : rank ≤ P.rank

structure QuotientData (P : ParabolicBundle J) where
  rank : ℕ
  ordinaryDegree : ℤ
  fibreMap : J → (Fin P.rank → ℂ) →ₗ[ℂ] (Fin rank → ℂ)
  surjective : ∀ j, Function.Surjective (fibreMap j)
  rank_le : rank ≤ P.rank

def WeightedFlag.comapInjective {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : W →ₗ[ℂ] V) (hf : Function.Injective f) (F : WeightedFlag V) :
    WeightedFlag W := by
  sorry

def WeightedFlag.mapSurjective {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : V →ₗ[ℂ] W) (hf : Function.Surjective f) (F : WeightedFlag V) :
    WeightedFlag W := by
  sorry

def inducedSubbundle (P : ParabolicBundle J) (F : SubbundleData P) :
    ParabolicBundle J where
  rank := F.rank
  ordinaryDegree := F.ordinaryDegree
  markedFlag j := WeightedFlag.comapInjective (F.fibreMap j) (F.injective j) (P.markedFlag j)

def inducedQuotient (P : ParabolicBundle J) (Q : QuotientData P) :
    ParabolicBundle J where
  rank := Q.rank
  ordinaryDegree := Q.ordinaryDegree
  markedFlag j := WeightedFlag.mapSurjective (Q.fibreMap j) (Q.surjective j) (P.markedFlag j)

-- Helpers express composition of actual native fibre maps.
def SubbundleData.comp {P : ParabolicBundle J} (F : SubbundleData P)
    (G : SubbundleData (inducedSubbundle P F))
    (hr : (inducedSubbundle P F).rank = F.rank) : SubbundleData P := by
  sorry

def QuotientData.comp {P : ParabolicBundle J} (Q : QuotientData P)
    (R : QuotientData (inducedQuotient P Q))
    (hr : (inducedQuotient P Q).rank = Q.rank) : QuotientData P := by
  sorry

def parabolicDegree (P : ParabolicBundle J) : ℝ :=
  (P.ordinaryDegree : ℝ) + ∑ j, (P.markedFlag j).contribution

def parabolicSlope (P : ParabolicBundle J) : ℝ := parabolicDegree P / P.rank

def ordinaryTwist (P : ParabolicBundle J) (d : ℤ) : ParabolicBundle J :=
  { P with ordinaryDegree := P.ordinaryDegree + (P.rank : ℤ) * d }

namespace inducedSubbundle

theorem flag_comap (P : ParabolicBundle J) (F : SubbundleData P)
    (hr : (inducedSubbundle P F).rank = F.rank) (j : J) (i : ℕ) :
    ∃ k, ((inducedSubbundle P F).markedFlag j).flag k =
      ((P.markedFlag j).flag i).comap (F.fibreMap j) := by
  sorry

theorem repeated_max (P : ParabolicBundle J) (F : SubbundleData P) (j : J)
    (i : ℕ) (hi : i < (P.markedFlag j).length)
    (hne : ((P.markedFlag j).flag i).comap (F.fibreMap j) ≠ ⊥)
    (hmax : ∀ k, k < (P.markedFlag j).length →
      ((P.markedFlag j).flag k).comap (F.fibreMap j) =
        ((P.markedFlag j).flag i).comap (F.fibreMap j) →
          (P.markedFlag j).weight k ≤ (P.markedFlag j).weight i) :
    ∃ k, k < ((inducedSubbundle P F).markedFlag j).length ∧
      ((inducedSubbundle P F).markedFlag j).flag k =
        ((P.markedFlag j).flag i).comap (F.fibreMap j) ∧
      ((inducedSubbundle P F).markedFlag j).weight k = (P.markedFlag j).weight i := by
  sorry

def identityData (P : ParabolicBundle J) : SubbundleData P where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree
  fibreMap _ := LinearMap.id
  injective _ := by sorry
  rank_le := by sorry

theorem self (P : ParabolicBundle J) : inducedSubbundle P (identityData P) = P := by
  sorry

theorem trans (P : ParabolicBundle J) (F : SubbundleData P)
    (G : SubbundleData (inducedSubbundle P F))
    (hr : (inducedSubbundle P F).rank = F.rank) :
    inducedSubbundle (inducedSubbundle P F) G =
      inducedSubbundle P (F.comp G hr) := by
  sorry

-- Coordinate line data for discriminating intersection tests.
def twoMarked (d : ℤ) : ParabolicBundle Unit where
  rank := 2
  ordinaryDegree := d
  markedFlag _ := WeightedFlag.twoStep 0 (3/4) (by norm_num)

def coordinateLine (d : ℤ) (k : Fin 2) : SubbundleData (twoMarked d) where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = k then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.zero
example (P : ParabolicBundle J) (F : SubbundleData P) (hr : F.rank = 0)
    (hd : F.ordinaryDegree = 0) :
    (inducedSubbundle P F).rank = 0 ∧ parabolicDegree (inducedSubbundle P F) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.high_weight_line
example : ((inducedSubbundle _ (coordinateLine 0 1)).markedFlag ()).weight 0 = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.low_weight_line
example : ((inducedSubbundle _ (coordinateLine 0 0)).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.identity_native
example (P : ParabolicBundle J) (j : J) (i : ℕ) :
    ((inducedSubbundle P (identityData P)).markedFlag j).flag i =
      (P.markedFlag j).flag i := by
  sorry
end inducedSubbundle

namespace inducedQuotient

theorem flag_map (P : ParabolicBundle J) (Q : QuotientData P)
    (hr : (inducedQuotient P Q).rank = Q.rank) (j : J) (i : ℕ) :
    ∃ k, ((inducedQuotient P Q).markedFlag j).flag k =
      ((P.markedFlag j).flag i).map (Q.fibreMap j) := by
  sorry

theorem degree_add (P : ParabolicBundle J) (F : SubbundleData P) (Q : QuotientData P)
    (hdeg : P.ordinaryDegree = F.ordinaryDegree + Q.ordinaryDegree)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j)) :
    parabolicDegree P = parabolicDegree (inducedSubbundle P F) +
      parabolicDegree (inducedQuotient P Q) := by
  sorry

def identityData (P : ParabolicBundle J) : QuotientData P where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree
  fibreMap _ := LinearMap.id
  surjective _ := by sorry
  rank_le := by sorry

theorem identity (P : ParabolicBundle J) : inducedQuotient P (identityData P) = P := by
  sorry

theorem trans (P : ParabolicBundle J) (Q : QuotientData P)
    (R : QuotientData (inducedQuotient P Q))
    (hr : (inducedQuotient P Q).rank = Q.rank) :
    inducedQuotient (inducedQuotient P Q) R = inducedQuotient P (Q.comp R hr) := by
  sorry

def coordinateQuotient (killed : Fin 2) :
    QuotientData (inducedSubbundle.twoMarked 0) where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 2 → ℂ) (_ : Fin 1) => v (if killed = 0 then (1 : Fin 2) else 0)
    map_add' := by sorry
    map_smul' := by sorry }
  surjective _ := by sorry
  rank_le := by sorry
-- TauCeti.ParabolicBounds.inducedQuotient.zero
example (P : ParabolicBundle J) (Q : QuotientData P) (hr : Q.rank = 0)
    (hd : Q.ordinaryDegree = 0) :
    (inducedQuotient P Q).rank = 0 ∧ parabolicDegree (inducedQuotient P Q) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.kill_high
example : ((inducedQuotient _ (coordinateQuotient 1)).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.kill_low
example : ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).weight 0 = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.native_map
example (P : ParabolicBundle J) (Q : QuotientData P) (j : J) :
    ((P.markedFlag j).flag 0).map (Q.fibreMap j) = ⊤ := by
  sorry
end inducedQuotient

namespace parabolicDegree

theorem trivial (r : ℕ) (d : ℤ) :
    parabolicDegree (ParabolicBundle.trivial J r d) = d := by
  sorry

theorem bounds (P : ParabolicBundle J) (hr : 0 < P.rank) :
    (P.ordinaryDegree : ℝ) ≤ parabolicDegree P ∧
      (0 < Fintype.card J → parabolicDegree P <
        P.ordinaryDegree + (Fintype.card J : ℝ) * P.rank) := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) :
    parabolicDegree (ordinaryTwist P d) = parabolicDegree P + P.rank * (d : ℝ) := by
  sorry

def line (d : ℤ) (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : ParabolicBundle Unit :=
  {rank := 1, ordinaryDegree := d,
    markedFlag := fun _ => WeightedFlag.trivial (Fin 1 → ℂ) a ha}
-- TauCeti.ParabolicBounds.parabolicDegree.line_quarter
example : parabolicDegree (line (-1) (1/4) (by norm_num)) = -3/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.zero
example : parabolicDegree (ParabolicBundle.trivial J 0 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.unmarked
example (P : ParabolicBundle Empty) : parabolicDegree P = P.ordinaryDegree := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.real_weights
example (h : 0 ≤ Real.sqrt 2 / 2 ∧ Real.sqrt 2 / 2 < 1) :
    parabolicDegree (line 0 (Real.sqrt 2 / 2) h) = Real.sqrt 2 / 2 := by
  sorry
end parabolicDegree

namespace parabolicSlope

theorem mul_rank (P : ParabolicBundle J) (hr : 0 < P.rank) :
    parabolicSlope P * P.rank = parabolicDegree P := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) (hr : 0 < P.rank) :
    parabolicSlope (ordinaryTwist P d) = parabolicSlope P + d := by
  sorry

theorem zero (P : ParabolicBundle J) (hr : P.rank = 0) : parabolicSlope P = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.rank_two
example : parabolicSlope
    ({rank := 2, ordinaryDegree := -1,
      markedFlag := fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)} :
      ParabolicBundle Unit) = -1/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.rank_zero
example : parabolicSlope (ParabolicBundle.trivial J 0 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.trivial_native
example (r : ℕ) (d : ℤ) (hr : 0 < r) :
    parabolicSlope (ParabolicBundle.trivial J r d) = (d : ℝ) / r := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.coparabolic_distinct
example : parabolicSlope (parabolicDegree.line 0 0 (by norm_num)) = 0 ∧
    (-1 : ℝ) ≠ parabolicSlope (parabolicDegree.line 0 0 (by norm_num)) := by
  sorry
end parabolicSlope

-- The set S must be supplied as the catalogue of saturated global subbundles.
def IsParabolicallySemistable (P : ParabolicBundle J) (S : Set (SubbundleData P)) : Prop :=
  ∀ F ∈ S, 0 < F.rank → F.rank < P.rank →
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P

namespace IsParabolicallySemistable

theorem rank_one (P : ParabolicBundle J) (S : Set (SubbundleData P))
    (hr : P.rank = 1) : IsParabolicallySemistable P S := by
  sorry

theorem quotient_iff (d dF dQ : ℝ) (r rF rQ : ℕ)
    (hdeg : d = dF + dQ) (hrank : r = rF + rQ)
    (hF : 0 < rF) (hQ : 0 < rQ) :
    dF / rF ≤ d / r ↔ d / r ≤ dQ / rQ := by
  sorry
-- This is the exact arithmetic equivalence; geometry supplies the catalogue correspondence.

theorem trivial_iff (r : ℕ) (d : ℤ)
    (S : Set (SubbundleData (ParabolicBundle.trivial J r d)))
    (hweights : ∀ F ∈ S, ∀ j i, ((inducedSubbundle _ F).markedFlag j).weight i = 0)
    (hdegree : ∀ F ∈ S, (inducedSubbundle _ F).ordinaryDegree = F.ordinaryDegree)
    (hrank : ∀ F ∈ S, (inducedSubbundle _ F).rank = F.rank) :
    IsParabolicallySemistable (ParabolicBundle.trivial J r d) S ↔
      ∀ F ∈ S, 0 < F.rank → F.rank < r →
        (F.ordinaryDegree : ℝ) / F.rank ≤ (d : ℝ) / r := by
  sorry

theorem iso (P Q : ParabolicBundle J) (h : P = Q) (S : Set (SubbundleData P)) :
    IsParabolicallySemistable P S ↔ IsParabolicallySemistable Q (h ▸ S) := by
  sorry
-- Transport along a geometric isomorphism awaits its omitted underlying bundle carrier.

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.zero
example (P : ParabolicBundle J) (S : Set (SubbundleData P)) (hr : P.rank = 0) :
    IsParabolicallySemistable P S := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.line
example (d : ℤ) (a : ℝ) (ha : 0 ≤ a ∧ a < 1)
    (S : Set (SubbundleData (parabolicDegree.line d a ha))) :
    IsParabolicallySemistable (parabolicDegree.line d a ha) S := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.split_unstable
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = 1)
    (hir : (inducedSubbundle _ F).rank = 1)
    (hid : (inducedSubbundle _ F).ordinaryDegree = 1) :
    ¬ IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.strict_not_needed
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = 0)
    (hir : (inducedSubbundle _ F).rank = 1)
    (hid : (inducedSubbundle _ F).ordinaryDegree = 0) :
    IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} ∧
      ¬ (parabolicSlope (inducedSubbundle _ F) <
        parabolicSlope (ParabolicBundle.trivial Empty 2 0)) := by
  sorry
end IsParabolicallySemistable

abbrev Disc := PowerSeries ℂ

def zeroWeightStep (P : ParabolicBundle J) (j : J) :
    Submodule ℂ (Fin P.rank → ℂ) :=
  if (P.markedFlag j).weight 0 = 0 then (P.markedFlag j).flag 1 else ⊤

def constantVector {r : ℕ} (s : Fin r → Disc) : Fin r → ℂ :=
  fun i => PowerSeries.coeff 0 (s i)

-- Genuine local lattice. Geometric sheaf gluing and its determinant degree are omitted.
def coparabolicZero (P : ParabolicBundle J) (j : J) :
    Submodule Disc (Fin P.rank → Disc) where
  carrier := {s | constantVector s ∈ zeroWeightStep P j}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

-- Numerical length-degree portion of the supplied global elementary modification.
def coparabolicOrdinaryDegree (P : ParabolicBundle J) : ℤ :=
  P.ordinaryDegree - ∑ j,
    if (P.markedFlag j).weight 0 = 0
    then ((P.markedFlag j).gradedRank 0 : ℤ) else 0

namespace coparabolicZero

theorem mem_local (P : ParabolicBundle J) (j : J) (s : Fin P.rank → Disc) :
    s ∈ coparabolicZero P j ↔ constantVector s ∈ zeroWeightStep P j := by
  sorry

theorem rank (P : ParabolicBundle J) (j : J) :
    finrank Disc (coparabolicZero P j) = P.rank := by
  sorry

theorem degree (P : ParabolicBundle J) :
    coparabolicOrdinaryDegree P = P.ordinaryDegree - ∑ j,
      if (P.markedFlag j).weight 0 = 0
      then ((P.markedFlag j).gradedRank 0 : ℤ) else 0 := by
  sorry

theorem factor {T : Type*} [AddCommGroup T] [Module Disc T]
    (P : ParabolicBundle J) (j : J) (f : T →ₗ[Disc] (Fin P.rank → Disc)) :
    (∃! l : T →ₗ[Disc] coparabolicZero P j,
      (coparabolicZero P j).subtype.comp l = f) ↔
        ∀ t, constantVector (f t) ∈ zeroWeightStep P j := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.trivial
example (r : ℕ) (d : ℤ) (j : J) (s : Fin r → Disc) :
    s ∈ coparabolicZero (ParabolicBundle.trivial J r d) j ↔
      ∀ i, PowerSeries.coeff 0 (s i) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.positive
example (P : ParabolicBundle J) (j : J) (h : 0 < (P.markedFlag j).weight 0) :
    coparabolicZero P j = ⊤ := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.mixed
example (s : Fin 2 → Disc) :
    s ∈ coparabolicZero
      ({rank := 2, ordinaryDegree := 0,
        markedFlag := fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)} :
        ParabolicBundle Unit) () ↔ PowerSeries.coeff 0 (s 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.not_fibre_injective
example (s : Disc) : PowerSeries.coeff 0 (PowerSeries.X * s) = 0 := by
  sorry
end coparabolicZero

def dualWeight (a : ℝ) : ℝ := if a = 0 then 0 else 1 - a

def WeightedFlag.dual {n : ℕ} (F : WeightedFlag (Fin n → ℂ)) :
    WeightedFlag (Fin n → ℂ) := by
  sorry

-- Coordinate dual flags and actual integer modification lengths. The sheaf is omitted.
def parabolicDual (P : ParabolicBundle J) : ParabolicBundle J where
  rank := P.rank
  ordinaryDegree := -P.ordinaryDegree - ∑ j,
    ∑ i ∈ Finset.range (P.markedFlag j).length,
      if (P.markedFlag j).weight i = 0 then 0 else ((P.markedFlag j).gradedRank i : ℤ)
  markedFlag j := (P.markedFlag j).dual

namespace parabolicDual

theorem rank (P : ParabolicBundle J) : (parabolicDual P).rank = P.rank := by
  sorry

theorem degree (P : ParabolicBundle J) :
    parabolicDegree (parabolicDual P) = -parabolicDegree P := by
  sorry

theorem involutive (P : ParabolicBundle J) : parabolicDual (parabolicDual P) = P := by
  sorry

theorem weight (P : ParabolicBundle J) (j : J) (i : ℕ)
    (hi : i < (P.markedFlag j).length) :
    ∃ k, k < ((parabolicDual P).markedFlag j).length ∧
      ((parabolicDual P).markedFlag j).weight k = dualWeight ((P.markedFlag j).weight i) ∧
      ((parabolicDual P).markedFlag j).gradedRank k = (P.markedFlag j).gradedRank i := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.zero_weight
example (d : ℤ) :
    (parabolicDual (parabolicDegree.line d 0 (by norm_num))).ordinaryDegree = -d ∧
      dualWeight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.positive_line
example (d : ℤ) :
    (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))).ordinaryDegree = -d-1 ∧
      dualWeight (1/4) = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.degree_test
example (d : ℤ) :
    parabolicDegree (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))) =
      -((d : ℝ) + 1/4) := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.no_weight_one
example (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : 0 ≤ dualWeight a ∧ dualWeight a < 1 := by
  sorry
end parabolicDual

-- Local trivialization of the line-valued perfect pairing is native dual evaluation.
def tracePairing (V : Type*) [AddCommGroup V] [Module ℂ V] :
    V →ₗ[ℂ] (V →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ where
  toFun v := {
    toFun := fun f => f v
    map_add' := by sorry
    map_smul' := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

namespace tracePairing

theorem eval (v : V) (f : V →ₗ[ℂ] ℂ) : tracePairing V v f = f v := by
  sorry

def perfect : V ≃ₗ[ℂ] ((V →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ) := Module.evalEquiv ℂ V

theorem natural {W : Type*} [AddCommGroup W] [Module ℂ W]
    (e : V ≃ₗ[ℂ] W) (v : V) (f : W →ₗ[ℂ] ℂ) :
    tracePairing W (e v) f = tracePairing V v (f.comp e.toLinearMap) := by
  sorry
-- TauCeti.ParabolicBounds.tracePairing.rank_one
example : tracePairing ℂ 1 LinearMap.id = 1 := by
  sorry
-- TauCeti.ParabolicBounds.tracePairing.zero
example (f : V →ₗ[ℂ] ℂ) : tracePairing V 0 f = 0 := by
  sorry
-- TauCeti.ParabolicBounds.tracePairing.native_eval
example (v : V) (f : V →ₗ[ℂ] ℂ) : tracePairing V v f = f v := by
  sorry
-- TauCeti.ParabolicBounds.tracePairing.off_diagonal
example : tracePairing (Fin 2 → ℂ) (Pi.single 0 1) (LinearMap.proj 1) = 0 ∧
    tracePairing (Fin 2 → ℂ) (Pi.single 0 1) (LinearMap.proj 0) = 1 := by
  sorry
end tracePairing

section Sections
variable {U W : Type*} [AddCommGroup U] [Module ℂ U] [AddCommGroup W] [Module ℂ W]
  [FiniteDimensional ℂ U] [FiniteDimensional ℂ W]

-- For the global declaration, V,U,W are the actual supplied section modules.
def traceSectionMap (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) : U →ₗ[ℂ] W := B v

namespace traceSectionMap

theorem apply (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (u : U) :
    traceSectionMap B v u = B v u := by
  sorry

theorem linear (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v v' : V) (a : ℂ) :
    traceSectionMap B (v + a • v') = traceSectionMap B v + a • traceSectionMap B v' := by
  sorry

theorem kernel_sections (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (u : U) :
    u ∈ LinearMap.ker (traceSectionMap B v) ↔ B v u = 0 := by
  sorry
-- The identification with H⁰ of the sheaf kernel is an omitted global comparison.
-- TauCeti.ParabolicBounds.traceSectionMap.zero
example (B : V →ₗ[ℂ] U →ₗ[ℂ] W) :
    finrank ℂ (LinearMap.range (traceSectionMap B 0)) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.scalar
example (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (a : ℂ) (ha : a ≠ 0) :
    finrank ℂ (LinearMap.range (traceSectionMap B (a • v))) =
      finrank ℂ (LinearMap.range (traceSectionMap B v)) := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.rank_one_model
example : finrank ℂ (LinearMap.range (traceSectionMap (tracePairing ℂ) 1)) = 1 := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.kernel_model
example : finrank ℂ
    (LinearMap.ker (traceSectionMap (tracePairing (Fin 2 → ℂ)) (Pi.single 0 1))) = 1 := by
  sorry
end traceSectionMap
end Sections

/-! Named theorem prototypes: explicit portions, not opaque substitutes for geometry. -/

-- The limiting real inequality in the coparabolic quotient proof.
theorem ordinaryQuotientSlope (μpar μquot : ℝ) (n : ℕ)
    (hshift : ∀ ε : ℝ, 0 < ε → μpar - n - ε ≤ μquot) : μpar - n ≤ μquot := by
  sorry

-- The numerical degree/slope portion; actual dual/twist semistability is omitted.
theorem dualTwistSemistable (P : ParabolicBundle J) (d : ℤ) (hr : 0 < P.rank) :
    parabolicSlope (ordinaryTwist (parabolicDual P) d) = -parabolicSlope P + d := by
  sorry

-- Determinant-degree consequence of the global isomorphism. Signed integer genus arithmetic.
theorem coparabolicDualTwist (P : ParabolicBundle J) (g : ℕ) :
    coparabolicOrdinaryDegree
      (ordinaryTwist (parabolicDual P) (2 * (g : ℤ) - 2 + Fintype.card J)) =
      -P.ordinaryDegree + (P.rank : ℤ) * (2 * (g : ℤ) - 2) := by
  sorry

-- Riemann–Roch and HN/Clifford numerical inputs: saturation/HN/cohomology omitted.
theorem parabolicCliffordRank (g r u hV hU : ℕ) (dV dU : ℝ)
    (hru : u ≤ r) (hsec : hU ≤ hV)
    (hrr : dV + (1 - (g : ℝ)) * r ≤ hV)
    (hcl : (2 : ℝ) * hU ≤ dU + 2 * u)
    (hu : dU ≤ (2 * (g : ℝ) - 2) * u)
    (hv : (2 * (g : ℝ) - 2) * r ≤ dV) :
    g * (r - u) ≤ r + (hV - hU) ∧
      ((2 * (g : ℝ) - 2) * r < dV → g * (r - u) < r + (hV - hU)) := by
  sorry

-- Corank one and section deficit identified by the supplied sheaf-kernel comparison.
theorem traceRankBound (g rE c δ rμ : ℕ) (hc : c = 1) (hδ : δ = rμ)
    (hcl : g * c ≤ rE + δ) : g ≤ rE + rμ := by
  sorry

-- Linear-factorization portion of the corrected fixed-part argument.
theorem fixedPartVector
    {F L H U Q T : Type*}
    [AddCommGroup F] [Module ℂ F] [FiniteDimensional ℂ F]
    [AddCommGroup L] [Module ℂ L] [FiniteDimensional ℂ L]
    [AddCommGroup H] [Module ℂ H]
    [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    [AddCommGroup Q] [Module ℂ Q] [FiniteDimensional ℂ Q]
    [AddCommGroup T] [Module ℂ T] [FiniteDimensional ℂ T]
    (e : F →ₗ[ℂ] H) (he : Function.Injective e)
    (B : H →ₗ[ℂ] U →ₗ[ℂ] T) (d : F →ₗ[ℂ] U →ₗ[ℂ] Q) (out : Q →ₗ[ℂ] T)
    (hfactor : ∀ x, B (e x) = out.comp (d x))
    (hq : 2 * finrank ℂ Q ≤ finrank ℂ L) (x : F) (hx : x ≠ 0) :
    ∃ v : H, v ≠ 0 ∧ v ∈ LinearMap.range e ∧
      2 * finrank ℂ (LinearMap.range (B v)) ≤ finrank ℂ L := by
  sorry

-- Exact integer rearrangement after the geometric trace/derivative comparisons.
theorem sublocalSystemRank (g rV rL rμ : ℕ)
    (htrace : g ≤ rV + rμ) (hderivative : 2 * rμ ≤ rL) :
    2 * g ≤ rL + 2 * rV := by
  sorry

-- The positive-integer product obstruction used with nonzero U and W.
theorem tensorInvariantRank (g a b : ℕ) (hg : 2 ≤ g) (ha : 0 < a) (hb : 0 < b)
    (hrank : 2 * g ≤ b + 2 * a) : g ≤ a * b := by
  sorry

-- Native invariants along a finite stable filtration. Geometry supplies the m_A-adic
-- filtration and the vanishing of its graded representations via tensorInvariantRank.
theorem artinianVanishing {A Γ M : Type*} [CommRing A] [Group Γ]
    [AddCommGroup M] [Module A M] (ρ : Representation A Γ M)
    (F : ℕ → Subrepresentation ρ) (N : ℕ)
    (hfirst : F 0 = ⊤) (hlast : F N = ⊥)
    (hgraded : ∀ k, k < N → ∀ v, v ∈ F k →
      (∀ γ, ρ γ v - v ∈ F (k + 1)) → v ∈ F (k + 1)) :
    Representation.invariants ρ = ⊥ := by
  sorry

end TauCeti.ParabolicBounds

/-!
## Exact global-signature completion inventory (gap G4)

* WeightedFlag: native finite fibre flag; no omission in its stated algebraic portion.
* ParabolicBundle: attach the actual locally free sheaf E on C and identify coordinate
  flags with E(x). Supply determinant degree; residueWeights is the diagonal spectral
  portion, with canonical logarithmic extension/monodromy omitted (H.2).
* inducedSubbundle/inducedQuotient: identify supplied fibre maps with saturated sheaf
  maps; rank/degree exactness and composition must come from that geometry (SF.3).
* parabolicDegree/parabolicSlope: identify the stored integer with deg det E (SF.3).
* IsParabolicallySemistable: the supplied catalogue must contain exactly saturated
  global subbundles; quotient_iff currently proves the arithmetic equivalence only.
  The split O(±1) and O⊕O tests currently retain their rank/degree obstruction only.
* coparabolicZero: actual formal-disc kernel; glue local lattices, compare to sheaf
  kernel, identify finite length with degree loss and compute fibres (SF.3).
* parabolicDual: filtered internal Hom, dual annihilator flags and the line-modification
  comparison with the ordinary dual sheaf are omitted. Degree shifts are retained.
* tracePairing: actual finite-dimensional evaluation and double-dual equivalence;
  tensor K(D), K and glue the line-valued sheaf pairing (SF.3).
* traceSectionMap: actual bilinear section modules are parameters; identify them with
  coherent H⁰ and identify native kernel with H⁰ of the sheaf kernel (SF.3).
* ordinaryQuotientSlope: shift/limit inequality only; quotient semistability and the
  filtered coparabolic shift construction omitted.
* dualTwistSemistable: slope identity only; global induced subbundle/quotient duality
  and semistability preservation omitted.
* coparabolicDualTwist: determinant-degree identity only; canonical sheaf isomorphism
  and compatibility with its inclusion omitted.
* parabolicCliffordRank: RR/Clifford arithmetic only; saturation, HN existence,
  H¹ vanishing and the strict/equal parabolic slope comparisons omitted (G1, SF.3).
* traceRankBound: corank-one/deficit substitution only; nonzero global section,
  saturated sheaf kernel and degree-zero semistability comparisons omitted.
* fixedPartVector: actual linear image/factorization bound; real VMHS/fixed part,
  conjugation, Hodge-homogeneous evaluation and the original inclusion omitted (H.2).
* sublocalSystemRank: exact numeric consequence only; actual higher direct-image
  monodromy, irreducible subobject, versality, total unitarity and period derivative
  comparisons omitted (H.2/H.3, G3). No arbitrary representation satisfies this bound.
* tensorInvariantRank: positive-integer consequence only; invariant tensor-to-Hom,
  the image sub-local system and application of the rank theorem omitted.
* artinianVanishing: actual representation invariant filtration argument; identify
  the representation with R¹π°_*V, construct the Artinian maximal-ideal filtration,
  and prove graded invariant vanishing using isotypic decomposition (G2, H.2).

These are completion obligations, not weaker versions claimed as global theorems.
All packet declaration, API and test names occur above; implementation remains unchecked.
-/
