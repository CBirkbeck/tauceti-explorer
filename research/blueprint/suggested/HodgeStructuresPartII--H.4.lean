import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin

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
The few packet API items and tests that cannot be typed without those carriers have no
declaration; the inventory names each of them.
No unavailable geometric hypothesis, VMHS, versality or unitarity is replaced by an
opaque proposition. Every other packet API/test name has a declaration or labelled example;
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
example (F : WeightedFlag (Fin 0 → ℂ)) :
    F.length = 0 ∧ (∑ i ∈ Finset.range F.length, F.gradedRank i) = 0 ∧
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
    (∃ k, (WeightedFlag.residueFlag n eigen heigen).flag k =
      WeightedFlag.coordinateThreshold n eigen a) ∧
    ∀ k < (WeightedFlag.residueFlag n eigen heigen).length,
      (∃ i, (WeightedFlag.residueFlag n eigen heigen).weight k = eigen i) ∧
      (WeightedFlag.residueFlag n eigen heigen).flag k =
        WeightedFlag.coordinateThreshold n eigen
          ((WeightedFlag.residueFlag n eigen heigen).weight k) := by
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
example (h : ∀ i, 0 ≤ (![0, 1/3] : Fin 2 → ℝ) i ∧ (![0, 1/3] : Fin 2 → ℝ) i < 1) :
    (WeightedFlag.residueFlag 2 ![0, 1/3] h).weight 0 = 0 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).weight 1 = 1/3 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).flag 1 = ℂ ∙ (Pi.single 1 1 : Fin 2 → ℂ) ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).gradedRank 0 = 1 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).gradedRank 1 = 1 := by
  sorry
/-- Local monodromy of flat sections along a positively oriented loop, for residue `α`
(the sign of HodgeStructuresPartII:H.2/residue-monodromy). -/
def residueMonodromy (α : ℝ) : ℂ := Complex.exp (-2 * Real.pi * Complex.I * α)

-- TauCeti.ParabolicBounds.ParabolicBundle.residue_sign
example : residueMonodromy (1/3) ≠ Complex.exp (2 * Real.pi * Complex.I * (1/3 : ℂ)) := by
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

def ParabolicBundle.twist (P : ParabolicBundle J) (d : ℤ) : ParabolicBundle J :=
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
example :
    ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).flag 0 =
        (((inducedSubbundle.twoMarked 0).markedFlag ()).flag 1).map
          ((coordinateQuotient 0).fibreMap ()) ∧
      ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).flag 1 =
        (((inducedSubbundle.twoMarked 0).markedFlag ()).flag 2).map
          ((coordinateQuotient 0).fibreMap ()) := by
  sorry
end inducedQuotient

namespace parabolicDegree

theorem trivial (r : ℕ) (d : ℤ) :
    parabolicDegree (ParabolicBundle.trivial J r d) = d := by
  sorry

theorem bounds (P : ParabolicBundle J) (hr : 0 < P.rank) :
    (P.ordinaryDegree : ℝ) ≤ parabolicDegree P ∧
      (0 < Fintype.card J → parabolicDegree P <
        P.ordinaryDegree + (Fintype.card J : ℝ) * P.rank) ∧
      (Fintype.card J = 0 → parabolicDegree P = P.ordinaryDegree) := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) :
    parabolicDegree (ParabolicBundle.twist P d) = parabolicDegree P + P.rank * (d : ℝ) := by
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
    parabolicSlope (ParabolicBundle.twist P d) = parabolicSlope P + d := by
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
end parabolicSlope

/-- Semistability relative to the supplied catalogue `S`, which must be the set of all saturated
global subbundles (G4); for an arbitrary catalogue, e.g. `∅`, the predicate is not
semistability. -/
def IsParabolicallySemistable (P : ParabolicBundle J) (S : Set (SubbundleData P)) : Prop :=
  ∀ F ∈ S, 0 < F.rank → F.rank < P.rank →
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P

namespace IsParabolicallySemistable

theorem rank_one (P : ParabolicBundle J) (S : Set (SubbundleData P))
    (hr : P.rank = 1) : IsParabolicallySemistable P S := by
  sorry

theorem quotient_iff (P : ParabolicBundle J) (F : SubbundleData P) (Q : QuotientData P)
    (hdeg : P.ordinaryDegree = F.ordinaryDegree + Q.ordinaryDegree)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j))
    (hrank : P.rank = F.rank + Q.rank) (hF : 0 < F.rank) (hQ : 0 < Q.rank) :
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P ↔
      parabolicSlope P ≤ parabolicSlope (inducedQuotient P Q) := by
  sorry
-- Geometry supplies the correspondence between the catalogue and the quotients.

theorem trivial_iff (r : ℕ) (d : ℤ)
    (S : Set (SubbundleData (ParabolicBundle.trivial J r d)))
    (hweights : ∀ F ∈ S, ∀ j i, ((inducedSubbundle _ F).markedFlag j).weight i = 0)
    (hdegree : ∀ F ∈ S, (inducedSubbundle _ F).ordinaryDegree = F.ordinaryDegree)
    (hrank : ∀ F ∈ S, (inducedSubbundle _ F).rank = F.rank) :
    IsParabolicallySemistable (ParabolicBundle.trivial J r d) S ↔
      ∀ F ∈ S, 0 < F.rank → F.rank < r →
        (F.ordinaryDegree : ℝ) / F.rank ≤ (d : ℝ) / r := by
  sorry

theorem iso (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (e : J → (Fin P.rank → ℂ) ≃ₗ[ℂ] (Fin Q.rank → ℂ))
    (he : ∀ j, Q.markedFlag j = (P.markedFlag j).transport (e j))
    (S : Set (SubbundleData P)) (T : Set (SubbundleData Q))
    (hST : ∀ G ∈ T, ∃ F ∈ S, F.rank = G.rank ∧ F.ordinaryDegree = G.ordinaryDegree ∧
      ∀ j, LinearMap.range ((e j).toLinearMap ∘ₗ F.fibreMap j) = LinearMap.range (G.fibreMap j)) :
    IsParabolicallySemistable P S → IsParabolicallySemistable Q T := by
  sorry
-- The fibre equivalences stand for a bundle isomorphism; the bundle itself is omitted (G4).

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

-- TauCeti.ParabolicBounds.parabolicSlope.coparabolic_distinct
example : parabolicSlope (parabolicDegree.line 0 0 (by norm_num)) = 0 ∧
    coparabolicOrdinaryDegree (parabolicDegree.line 0 0 (by norm_num)) = -1 := by
  sorry

namespace coparabolicZero

theorem mem_local (P : ParabolicBundle J) (j : J) (s : Fin P.rank → Disc) :
    s ∈ coparabolicZero P j ↔ constantVector s ∈ zeroWeightStep P j := by
  sorry

theorem rank (P : ParabolicBundle J) (j : J) :
    finrank Disc (coparabolicZero P j) = P.rank := by
  sorry

theorem degree (P : ParabolicBundle J) :
    coparabolicOrdinaryDegree P = P.ordinaryDegree - ∑ j,
      ((Module.length Disc ((Fin P.rank → Disc) ⧸ coparabolicZero P j)).toNat : ℤ) := by
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
example :
    finrank Disc (coparabolicZero (ParabolicBundle.trivial Unit 1 0) ()) = 1 ∧
      (∀ s ∈ coparabolicZero (ParabolicBundle.trivial Unit 1 0) (), constantVector s = 0) ∧
      coparabolicZero (ParabolicBundle.trivial Unit 1 0) () ≠ ⊤ := by
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
      ((parabolicDual (parabolicDegree.line d 0 (by norm_num))).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.positive_line
example (d : ℤ) :
    (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))).ordinaryDegree = -d-1 ∧
      ((parabolicDual (parabolicDegree.line d (1/4) (by norm_num))).markedFlag ()).weight 0
        = 3/4 := by
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

-- The trace pairing B_E is owned by HodgeStructuresPartII:H.3/trace-multiplication
-- (packet name TauCeti.Hodge.PeriodGeometry.PeriodTrace.multiply; its signature is omitted in the
-- H.3 suggested file). Fibrewise it
-- is the evaluation pairing `LinearMap.applyₗ`, which the coordinate tests below use.

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
example : finrank ℂ (LinearMap.range
    (traceSectionMap (LinearMap.applyₗ : ℂ →ₗ[ℂ] (ℂ →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ) 1)) = 1 := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.kernel_model
example : finrank ℂ
    (LinearMap.ker (traceSectionMap
      (LinearMap.applyₗ : (Fin 2 → ℂ) →ₗ[ℂ] ((Fin 2 → ℂ) →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ)
      (Pi.single 0 1))) = 1 := by
  sorry
end traceSectionMap
end Sections


/-! ### Parabolic structure of a logarithmic connection (fibre portion)

The curve, the bundle and the connection are omitted (G4); only the residue endomorphism of
each marked fibre is recorded. The analytic Deligne extension is HodgeStructuresPartII:H.2. -/

/-- Residue data of a logarithmic connection at the marks, with the ordinary degree. -/
structure LogConnectionData (J : Type*) where
  rank : ℕ
  ordinaryDegree : ℤ
  residue : J → Module.End ℂ (Fin rank → ℂ)

/-- The normalized weight of a residue eigenvalue: the fractional part of its real part. -/
def residueWeight (η : ℂ) : ℝ := Int.fract η.re

/-- The flag step of weight `a`: the sum of the generalized eigenspaces whose eigenvalue has
normalized weight at least `a`. -/
def residueStep {W : Type*} [AddCommGroup W] [Module ℂ W] (A : Module.End ℂ W) (a : ℝ) :
    Submodule ℂ W :=
  ⨆ (η : ℂ) (_ : a ≤ residueWeight η), A.maxGenEigenspace η

/-- The weighted flag of a residue endomorphism: the distinct normalized weights of its
eigenvalues, increasing, with flag steps `residueStep`. -/
def WeightedFlag.ofResidue {r : ℕ} (A : Module.End ℂ (Fin r → ℂ)) :
    WeightedFlag (Fin r → ℂ) := by
  sorry

/-- `ParabolicBundle.ofLogConnection`: the residue flags on the marked fibres. -/
def ParabolicBundle.ofLogConnection (L : LogConnectionData J) : ParabolicBundle J where
  rank := L.rank
  ordinaryDegree := L.ordinaryDegree
  markedFlag j := WeightedFlag.ofResidue (L.residue j)

namespace ParabolicBundle.ofLogConnection

theorem weight_eq (L : LogConnectionData J) (j : J) (a : ℝ) :
    (∃ i, i < ((ofLogConnection L).markedFlag j).length ∧
        ((ofLogConnection L).markedFlag j).weight i = a) ↔
      ∃ η : ℂ, (L.residue j).HasEigenvalue η ∧ residueWeight η = a := by
  sorry

theorem flag_eq (L : LogConnectionData J) (j : J) (i : ℕ)
    (hi : i < ((ofLogConnection L).markedFlag j).length) :
    ((ofLogConnection L).markedFlag j).flag i =
      residueStep (L.residue j) (((ofLogConnection L).markedFlag j).weight i) := by
  sorry

theorem gradedRank_eq (L : LogConnectionData J) (j : J) (i : ℕ)
    (hi : i < ((ofLogConnection L).markedFlag j).length) :
    ((ofLogConnection L).markedFlag j).gradedRank i =
      finrank ℂ ↥(⨆ (η : ℂ) (_ : residueWeight η = ((ofLogConnection L).markedFlag j).weight i),
        (L.residue j).maxGenEigenspace η) := by
  sorry

theorem unitary_weights (L : LogConnectionData J) (j : J)
    (hcan : ∀ η : ℂ, (L.residue j).HasEigenvalue η → 0 ≤ η.re ∧ η.re < 1)
    (hunit : ∀ η : ℂ, (L.residue j).HasEigenvalue η →
      ‖Complex.exp (-2 * Real.pi * Complex.I * η)‖ = 1)
    (η : ℂ) (hη : (L.residue j).HasEigenvalue η) :
    η.im = 0 ∧ residueWeight η = η.re ∧
      Complex.exp (-2 * Real.pi * Complex.I * η) =
        ParabolicBundle.residueMonodromy (residueWeight η) := by
  sorry

theorem directSum {W₁ W₂ : Type*} [AddCommGroup W₁] [Module ℂ W₁] [AddCommGroup W₂]
    [Module ℂ W₂] (A : Module.End ℂ W₁) (B : Module.End ℂ W₂) (a : ℝ) :
    residueStep (A.prodMap B) a = (residueStep A a).prod (residueStep B a) := by
  sorry

theorem trivial (r : ℕ) (d : ℤ) :
    ofLogConnection (⟨r, d, fun _ => 0⟩ : LogConnectionData J) = ParabolicBundle.trivial J r d := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.trivial_connection
example (j : J) :
    ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).length = 1 ∧
      ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).weight 0 = 0 ∧
      ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).gradedRank 0
        = 1 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.two_eigenvalues
example :
    ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).flag 1 = ℂ ∙ (Pi.single 1 1 : Fin 2 → ℂ) ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 0 = 0 ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 1 = 1/3 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.nilpotent_residue
example :
    ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' !![(0 : ℂ), 1; 0, 0]⟩ :
        LogConnectionData Unit)).markedFlag ()).length = 1 ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' !![(0 : ℂ), 1; 0, 0]⟩ :
        LogConnectionData Unit)).markedFlag ()).gradedRank 0 = 2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.fractional_part
example :
    residueWeight (4/3 : ℂ) = 1/3 ∧
      ((ofLogConnection (⟨1, 0, fun _ => (4/3 : ℂ) • LinearMap.id⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 0 = 1/3 := by
  sorry
end ParabolicBundle.ofLogConnection

/-- Degree portion of `unitaryParabolicSemistable`: with the residue theorem
`deg E = −Σ tr Res` as hypothesis, the canonical-extension parabolic degree vanishes.
Semistability needs the global saturated subbundles and the Mehta–Seshadri/Simpson
comparison (G4, G6) and is omitted. -/
theorem unitaryParabolicSemistable (L : LogConnectionData J)
    (hcan : ∀ j (η : ℂ), (L.residue j).HasEigenvalue η → 0 ≤ η.re ∧ η.re < 1)
    (hres : (L.ordinaryDegree : ℂ) =
      -∑ j, LinearMap.trace ℂ (Fin L.rank → ℂ) (L.residue j)) :
    parabolicDegree (ParabolicBundle.ofLogConnection L) = 0 := by
  sorry

/-! ### Twist by an ordinary line bundle (numerical and fibre portion)

`ParabolicBundle.twist P d` twists by a line bundle of degree `d` with the trivial parabolic
structure: flags and weights are kept (after trivializing the fibre of the line). -/

/-- The twist of a supplied subbundle datum. -/
def SubbundleData.twist {P : ParabolicBundle J} (F : SubbundleData P) (d : ℤ) :
    SubbundleData (P.twist d) where
  rank := F.rank
  ordinaryDegree := F.ordinaryDegree + (F.rank : ℤ) * d
  fibreMap := F.fibreMap
  injective := F.injective
  rank_le := F.rank_le

namespace ParabolicBundle

theorem twist_rank (P : ParabolicBundle J) (d : ℤ) :
    (P.twist d).rank = P.rank ∧ (P.twist d).markedFlag = P.markedFlag := by
  sorry

theorem twist_zero (P : ParabolicBundle J) : P.twist 0 = P := by
  sorry

theorem twist_twist (P : ParabolicBundle J) (d d' : ℤ) :
    (P.twist d).twist d' = P.twist (d + d') := by
  sorry

theorem coparabolicZero_twist (P : ParabolicBundle J) (d : ℤ) :
    coparabolicOrdinaryDegree (P.twist d) = coparabolicOrdinaryDegree P + (P.rank : ℤ) * d ∧
      ∀ j, coparabolicZero (P.twist d) j = coparabolicZero P j := by
  sorry

theorem twist_inducedSubbundle (P : ParabolicBundle J) (F : SubbundleData P) (d : ℤ) :
    inducedSubbundle (P.twist d) (F.twist d) = (inducedSubbundle P F).twist d ∧
      ∀ S : Set (SubbundleData P),
        IsParabolicallySemistable (P.twist d) ((fun G => G.twist d) '' S) ↔
          IsParabolicallySemistable P S := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.twist_line_quarter
example (d : ℤ) :
    ((parabolicDegree.line d (1/4) (by norm_num)).twist 1).ordinaryDegree = d + 1 ∧
      (((parabolicDegree.line d (1/4) (by norm_num)).twist 1).markedFlag ()).weight 0 = 1/4 ∧
      parabolicDegree ((parabolicDegree.line d (1/4) (by norm_num)).twist 1) = d + 5/4 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_rank_two
example :
    parabolicDegree
      (ParabolicBundle.twist
        (⟨2, 0, fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)⟩ :
          ParabolicBundle Unit) 3) = 13/2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_trivial_KD
example (g : ℕ) :
    coparabolicOrdinaryDegree
      ((ParabolicBundle.trivial J 1 0).twist (2 * (g : ℤ) - 2 + Fintype.card J)) =
        2 * (g : ℤ) - 2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_by_trivial
example (P : ParabolicBundle J) :
    (P.twist 0).ordinaryDegree = P.ordinaryDegree ∧ (P.twist 0).markedFlag = P.markedFlag := by
  sorry
end ParabolicBundle

/-! ### Thresholds, morphisms, sums, shifts, filtrations and further tests

Numerical, fibre and formal-disc portions only; the omitted global signatures are listed in the
inventory at the end of the file. -/

namespace WeightedFlag

/-- The part of weight at least `a`: the supremum of the flag steps whose weight is `≥ a`,
which is the step `F_β` with `β` least such that `α_β ≥ a`, or `⊥` if no weight is `≥ a`. -/
def threshold (F : WeightedFlag V) (a : ℝ) : Submodule ℂ V :=
  ⨆ (i : ℕ) (_ : i < F.length ∧ a ≤ F.weight i), F.flag i

theorem threshold_antitone (F : WeightedFlag V) :
    (∀ a b : ℝ, a ≤ b → F.threshold b ≤ F.threshold a) ∧ F.threshold 0 = ⊤ := by
  sorry

theorem contribution_le (F : WeightedFlag V) (a : ℝ)
    (ha : ∀ i, i < F.length → F.weight i ≤ a) :
    F.contribution ≤ a * finrank ℂ V ∧
      (0 < finrank ℂ V → F.contribution < finrank ℂ V) := by
  sorry

-- TauCeti.ParabolicBounds.WeightedFlag.two_step_contribution
example : (twoStep (1/4) (1/2) (by norm_num)).gradedRank 0 = 1 ∧
    (twoStep (1/4) (1/2) (by norm_num)).gradedRank 1 = 1 ∧
    (twoStep (1/4) (1/2) (by norm_num)).contribution = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.multiplicity
example : (trivial (Fin 2 → ℂ) (1/3) (by norm_num)).gradedRank 0 = 2 ∧
    (trivial (Fin 2 → ℂ) (1/3) (by norm_num)).contribution = 2/3 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.not_increasing
example : ¬ ∃ F : WeightedFlag (Fin 2 → ℂ), F.length = 2 ∧ F.weight 0 = 1/2 ∧ F.weight 1 = 0 := by
  sorry

-- Auxiliary three-step coordinate flag ℂ³ ⊋ ⟨e₂, e₃⟩ ⊋ ⟨e₃⟩ ⊋ 0.
def threeStep (a b c : ℝ) (h : 0 ≤ a ∧ a < b ∧ b < c ∧ c < 1) :
    WeightedFlag (Fin 3 → ℂ) where
  length := 3
  flag i := if i = 0 then ⊤
    else if i = 1 then Submodule.span ℂ {Pi.single 1 1, Pi.single 2 1}
    else if i = 2 then ℂ ∙ (Pi.single 2 1) else ⊥
  weight i := if i = 0 then a else if i = 1 then b else if i = 2 then c else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

/-- Direct sum of coordinate flags: the weight-`λ` graded pieces add. -/
def sum {m n : ℕ} (F : WeightedFlag (Fin m → ℂ)) (G : WeightedFlag (Fin n → ℂ)) :
    WeightedFlag (Fin (m + n) → ℂ) := by
  sorry

/-- Fibre flag of the shift `E[ε]`: weights `≥ ε` drop by `ε`, weights `< ε` become `α + 1 − ε`
on the modified lattice. -/
def shift (F : WeightedFlag V) (ε : ℝ) : WeightedFlag V := by
  sorry
end WeightedFlag

namespace ParabolicBundle

/-- Fibre portion of a parabolic morphism: fibre maps preserving every threshold step. The
global bundle map is omitted (G4). -/
structure Hom (P Q : ParabolicBundle J) where
  fibreMap : J → (Fin P.rank → ℂ) →ₗ[ℂ] (Fin Q.rank → ℂ)
  preserves : ∀ j (a : ℝ), 0 ≤ a → a < 1 →
    (P.markedFlag j).threshold a ≤ ((Q.markedFlag j).threshold a).comap (fibreMap j)

def Hom.id (P : ParabolicBundle J) : P.Hom P where
  fibreMap _ := LinearMap.id
  preserves := by sorry

def Hom.comp {P Q R : ParabolicBundle J} (g : Q.Hom R) (f : P.Hom Q) : P.Hom R where
  fibreMap j := (g.fibreMap j).comp (f.fibreMap j)
  preserves := by sorry

theorem Hom.ofTrivial (r : ℕ) (d : ℤ) (Q : ParabolicBundle J)
    (f : J → (Fin r → ℂ) →ₗ[ℂ] (Fin Q.rank → ℂ)) :
    ∃ φ : (ParabolicBundle.trivial J r d).Hom Q, φ.fibreMap = f := by
  sorry

def directSum (P Q : ParabolicBundle J) : ParabolicBundle J where
  rank := P.rank + Q.rank
  ordinaryDegree := P.ordinaryDegree + Q.ordinaryDegree
  markedFlag j := (P.markedFlag j).sum (Q.markedFlag j)

/-- The shift `E[ε]`, `E[ε]_α = E_{α+ε}`: its underlying lattice `E_ε` loses the graded
pieces of weight `< ε`. -/
def shift (P : ParabolicBundle J) (ε : ℝ) : ParabolicBundle J where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree - ∑ j, ∑ i ∈ Finset.range (P.markedFlag j).length,
      if (P.markedFlag j).weight i < ε then ((P.markedFlag j).gradedRank i : ℤ) else 0
  markedFlag j := (P.markedFlag j).shift ε
end ParabolicBundle

namespace inducedSubbundle

theorem rank (P : ParabolicBundle J) (F : SubbundleData P) :
    (inducedSubbundle P F).rank = F.rank ∧
      ∃ φ : (inducedSubbundle P F).Hom P, φ.fibreMap = F.fibreMap := by
  sorry

def threeMarked : ParabolicBundle Unit :=
  ⟨3, 0, fun _ => WeightedFlag.threeStep 0 (1/3) (2/3) (by norm_num)⟩

/-- The plane `⟨e₁ + e₂, e₃⟩`. -/
def planeData : SubbundleData threeMarked where
  rank := 2
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 2 → ℂ) (i : Fin 3) => if i = 2 then v 1 else v 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.inducedSubbundle.induced_two_dim
example : ((inducedSubbundle threeMarked planeData).markedFlag ()).length = 2 ∧
    ((inducedSubbundle threeMarked planeData).markedFlag ()).weight 0 = 0 ∧
    ((inducedSubbundle threeMarked planeData).markedFlag ()).weight 1 = 2/3 := by
  sorry
end inducedSubbundle

namespace inducedQuotient

theorem rank_add [Nonempty J] (P : ParabolicBundle J) (F : SubbundleData P)
    (Q : QuotientData P)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j)) :
    P.rank = F.rank + Q.rank := by
  sorry

/-- The quotient by `⟨e₁ + e₂, e₃⟩`, `v ↦ v₀ − v₁`. -/
def planeQuotient : QuotientData inducedSubbundle.threeMarked where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 3 → ℂ) (_ : Fin 1) => v 0 - v 1
    map_add' := by sorry
    map_smul' := by sorry }
  surjective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.inducedQuotient.induced_two_dim
example : ((inducedQuotient _ planeQuotient).markedFlag ()).weight 0 = 1/3 ∧
    ((inducedSubbundle _ inducedSubbundle.planeData).markedFlag ()).contribution +
        ((inducedQuotient _ planeQuotient).markedFlag ()).contribution =
      (inducedSubbundle.threeMarked.markedFlag ()).contribution := by
  sorry
end inducedQuotient

namespace parabolicDegree

theorem eq_deg_add_contribution (P : ParabolicBundle J) :
    parabolicDegree P = P.ordinaryDegree + ∑ j, (P.markedFlag j).contribution := by
  sorry

theorem directSum (P Q : ParabolicBundle J) :
    parabolicDegree (P.directSum Q) = parabolicDegree P + parabolicDegree Q := by
  sorry

theorem shift (P : ParabolicBundle J) (ε : ℝ) (hε : 0 < ε ∧ ε < 1) :
    parabolicDegree (P.shift ε) = parabolicDegree P - ε * Fintype.card J * P.rank := by
  sorry

-- TauCeti.ParabolicBounds.parabolicDegree.rank_two_multiplicity
example : parabolicDegree
    (⟨2, 0, fun _ => WeightedFlag.trivial (Fin 2 → ℂ) (1/3) (by norm_num)⟩ :
      ParabolicBundle Unit) = 2/3 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.two_weights
example : parabolicDegree
    (⟨2, 0, fun _ => WeightedFlag.twoStep (1/4) (1/2) (by norm_num)⟩ :
      ParabolicBundle Unit) = 3/4 := by
  sorry
end parabolicDegree

/-- The coparabolic degree: by definition the parabolic degree of the antecedent
(LL22 Definition 2.2.9), not the degree of `coparabolicZero`. -/
def coparabolicDegree (P : ParabolicBundle J) : ℝ := parabolicDegree P

-- TauCeti.ParabolicBounds.parabolicDegree.coparabolic_not_zero_lattice
example (r : ℕ) (d : ℤ) :
    coparabolicDegree (ParabolicBundle.trivial J r d) = d ∧
      coparabolicOrdinaryDegree (ParabolicBundle.trivial J r d) =
        d - (Fintype.card J : ℤ) * r := by
  sorry

namespace parabolicSlope

theorem dual (P : ParabolicBundle J) (hr : 0 < P.rank) :
    parabolicSlope (parabolicDual P) = -parabolicSlope P := by
  sorry

theorem shift (P : ParabolicBundle J) (ε : ℝ) (hε : 0 < ε ∧ ε < 1) (hr : 0 < P.rank) :
    parabolicSlope (P.shift ε) = parabolicSlope P - Fintype.card J * ε := by
  sorry

theorem sub_ordinary_lt (P : ParabolicBundle J) (hr : 0 < P.rank) :
    0 ≤ parabolicSlope P - P.ordinaryDegree / P.rank ∧
      (0 < Fintype.card J →
        parabolicSlope P - P.ordinaryDegree / P.rank < Fintype.card J) := by
  sorry

-- TauCeti.ParabolicBounds.parabolicSlope.dual_twist_canonical
example (g : ℕ) :
    parabolicSlope (⟨1, -1, fun _ => WeightedFlag.trivial (Fin 1 → ℂ) (1/2) (by norm_num)⟩ :
      ParabolicBundle (Fin 2)) = 0 ∧
    parabolicSlope ((parabolicDual
      (⟨1, -1, fun _ => WeightedFlag.trivial (Fin 1 → ℂ) (1/2) (by norm_num)⟩ :
        ParabolicBundle (Fin 2))).twist (2 * (g : ℤ))) = 2 * (g : ℝ) := by
  sorry
end parabolicSlope

namespace IsParabolicallySemistable

theorem slope_le {P : ParabolicBundle J} {S : Set (SubbundleData P)}
    (h : IsParabolicallySemistable P S) {F : SubbundleData P} (hF : F ∈ S)
    (h0 : 0 < F.rank) (h1 : F.rank < P.rank) :
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P := by
  sorry

def halfMarked : ParabolicBundle Unit :=
  ⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/2) (by norm_num)⟩

/-- The constant line `O · e₂` of `halfMarked`. -/
def halfLine : SubbundleData halfMarked where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = 1 then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.weight_destabilises
example : parabolicSlope (inducedSubbundle halfMarked halfLine) = 1/2 ∧
    parabolicSlope halfMarked = 1/4 ∧ ¬ IsParabolicallySemistable halfMarked {halfLine} := by
  sorry

def thirdMarked : ParabolicBundle (Fin 3) :=
  ⟨2, -1, fun _ => WeightedFlag.twoStep 0 (1/3) (by norm_num)⟩

/-- `O ⊕ 0` and `0 ⊕ O(−1)` of `thirdMarked`; the deep flag step is the fibre of `O(−1)`. -/
def thirdLine (k : Fin 2) (d : ℤ) : SubbundleData thirdMarked where
  rank := 1
  ordinaryDegree := d
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = k then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.weights_stabilise
example : parabolicSlope thirdMarked = 0 ∧
    parabolicSlope (inducedSubbundle thirdMarked (thirdLine 0 0)) = 0 ∧
    parabolicSlope (inducedSubbundle thirdMarked (thirdLine 1 (-1))) = 0 ∧
    IsParabolicallySemistable thirdMarked {thirdLine 0 0, thirdLine 1 (-1)} ∧
    (thirdMarked.ordinaryDegree : ℝ) / thirdMarked.rank <
      ((thirdLine 0 0).ordinaryDegree : ℝ) / (thirdLine 0 0).rank := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.small_sub_allowed
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = -1) :
    IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} := by
  sorry
end IsParabolicallySemistable

/-- Coparabolic semistability is semistability of the antecedent parabolic bundle
(LL22 Definition 2.4.2). -/
def IsCoparabolicallySemistable (P : ParabolicBundle J) (S : Set (SubbundleData P)) : Prop :=
  IsParabolicallySemistable P S

/-- The formal-disc lattice of sections whose constant term lies in `W`. -/
def localLattice {r : ℕ} (W : Submodule ℂ (Fin r → ℂ)) : Submodule Disc (Fin r → Disc) where
  carrier := {s | constantVector s ∈ W}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Formal-disc model at the mark `j` of the filtration `E_α` for `α ≥ 0`:
`E_α = t^⌊α⌋ · {s : s(0) ∈ threshold (fract α)}`. Negative indices need the meromorphic
ambient and are omitted (G4). -/
def ParabolicBundle.filtration (P : ParabolicBundle J) (j : J) (α : ℝ) :
    Submodule Disc (Fin P.rank → Disc) :=
  (localLattice ((P.markedFlag j).threshold (Int.fract α))).map
    (((PowerSeries.X : Disc) ^ (⌊α⌋.toNat)) • LinearMap.id)

namespace ParabolicBundle

theorem filtration_zero (P : ParabolicBundle J) (j : J) : P.filtration j 0 = ⊤ := by
  sorry

theorem filtration_add_one (P : ParabolicBundle J) (j : J) (α : ℝ) (hα : 0 ≤ α) :
    P.filtration j (α + 1) =
      (P.filtration j α).map ((PowerSeries.X : Disc) • LinearMap.id) := by
  sorry

theorem filtration_antitone (P : ParabolicBundle J) (j : J) {α β : ℝ} (hα : 0 ≤ α)
    (hαβ : α ≤ β) : P.filtration j β ≤ P.filtration j α := by
  sorry

theorem filtration_mem (P : ParabolicBundle J) (j : J) (α : ℝ) (h0 : 0 ≤ α) (h1 : α ≤ 1)
    (s : Fin P.rank → Disc) :
    s ∈ P.filtration j α ↔ constantVector s ∈ (P.markedFlag j).threshold α := by
  sorry

theorem ext_filtration (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (h : ∀ j (α : ℝ), 0 ≤ α → HEq (P.filtration j α) (Q.filtration j α)) : P = Q := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.trivial_filtration
example (r : ℕ) (d : ℤ) (j : J) (α : ℝ) (hα : 0 ≤ α) :
    (ParabolicBundle.trivial J r d).filtration j α =
      (⊤ : Submodule Disc (Fin r → Disc)).map
        (((PowerSeries.X : Disc) ^ (⌈α⌉.toNat)) • LinearMap.id) := by
  sorry
end ParabolicBundle

namespace coparabolicZero

theorem eq_filtration (P : ParabolicBundle J) (j : J) :
    ∃ ε₀ : ℝ, 0 < ε₀ ∧ ∀ ε, 0 < ε → ε ≤ ε₀ → coparabolicZero P j = P.filtration j ε := by
  sorry

theorem bounds (P : ParabolicBundle J) (j : J) :
    (⊤ : Submodule Disc (Fin P.rank → Disc)).map ((PowerSeries.X : Disc) • LinearMap.id) ≤
        coparabolicZero P j ∧
      Module.length Disc ((Fin P.rank → Disc) ⧸ coparabolicZero P j) =
        if (P.markedFlag j).weight 0 = 0 then ((P.markedFlag j).gradedRank 0 : ℕ∞) else 0 := by
  sorry

-- TauCeti.ParabolicBounds.coparabolicZero.three_step
example : coparabolicOrdinaryDegree inducedSubbundle.threeMarked = -1 ∧
    ∀ s : Fin 3 → Disc,
      s ∈ coparabolicZero inducedSubbundle.threeMarked () ↔ PowerSeries.coeff 0 (s 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.eq_shift_example
example :
    (∀ ε : ℝ, 0 < ε → ε ≤ 1/4 →
      coparabolicZero (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
          ParabolicBundle Unit) () =
        (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
          ParabolicBundle Unit).filtration () ε) ∧
    coparabolicZero (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit) () ≠
      (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit).filtration () 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.dual_twist_line
example (d : ℤ) (g : ℕ) :
    coparabolicOrdinaryDegree
      ((parabolicDual (parabolicDegree.line d 0 (by norm_num))).twist (2 * (g : ℤ) - 2 + 1)) =
        -d + 2 * (g : ℤ) - 2 := by
  sorry
end coparabolicZero

namespace parabolicDual

/-- The underlying bundle of the dual is `(Ê₀)∨(−D)`: degree `−deg Ê₀ − n · rank`. -/
theorem underlying (P : ParabolicBundle J) :
    (parabolicDual P).ordinaryDegree =
      -coparabolicOrdinaryDegree P - (P.rank : ℤ) * Fintype.card J := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) :
    parabolicDual (P.twist d) = (parabolicDual P).twist (-d) := by
  sorry

theorem coparabolicZero (P : ParabolicBundle J) :
    coparabolicOrdinaryDegree (parabolicDual P) =
      -P.ordinaryDegree - (P.rank : ℤ) * Fintype.card J := by
  sorry

-- TauCeti.ParabolicBounds.parabolicDual.mixed_rank_two
example :
    (parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).ordinaryDegree = -1 ∧
      ((parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).markedFlag ()).weight 0 = 0 ∧
      ((parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).markedFlag ()).weight 1 = 3/4 ∧
      parabolicDegree (parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4)
        (by norm_num)⟩ : ParabolicBundle Unit)) = -1/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.trivial
example (r : ℕ) (d : ℤ) :
    parabolicDual (ParabolicBundle.trivial J r d) = ParabolicBundle.trivial J r (-d) := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.coparabolic_zero_line
example (d : ℤ) :
    coparabolicOrdinaryDegree (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))) =
        -d - 1 ∧
      coparabolicOrdinaryDegree (parabolicDual (parabolicDegree.line d 0 (by norm_num))) =
        -d - 1 := by
  sorry
end parabolicDual

theorem traceSectionMap.rank_eq_deficit {U W : Type*} [AddCommGroup U] [Module ℂ U]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ U] [FiniteDimensional ℂ W]
    (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) :
    finrank ℂ (LinearMap.range (traceSectionMap B v)) =
      finrank ℂ U - finrank ℂ (LinearMap.ker (traceSectionMap B v)) := by
  sorry

/-! Named theorem prototypes: explicit portions, not opaque substitutes for geometry. -/

-- The limiting real inequality in the coparabolic quotient proof.
theorem ordinaryQuotientSlope (P : ParabolicBundle J) (μquot : ℝ)
    (hshift : ∀ ε : ℝ, 0 < ε → parabolicSlope P - Fintype.card J - ε ≤ μquot) :
    parabolicSlope P - Fintype.card J ≤ μquot := by
  sorry

-- The numerical degree/slope portion; actual dual/twist semistability is omitted.
theorem dualTwistSemistable (P : ParabolicBundle J) (d : ℤ) (hr : 0 < P.rank) :
    parabolicSlope (ParabolicBundle.twist (parabolicDual P) d) = -parabolicSlope P + d := by
  sorry

-- Determinant-degree consequence of the global isomorphism. Signed integer genus arithmetic.
theorem coparabolicDualTwist (P : ParabolicBundle J) (g : ℕ) :
    coparabolicOrdinaryDegree
      (ParabolicBundle.twist (parabolicDual P) (2 * (g : ℤ) - 2 + Fintype.card J)) =
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
  global subbundles; quotient_iff is stated for one induced sequence, and the ℙ¹ tests
  (split_unstable, strict_not_needed, weight_destabilises, weights_stabilise,
  small_sub_allowed) check the named subbundles, not the completeness of the catalogue.
* coparabolicZero: actual formal-disc kernel; glue local lattices, compare to sheaf
  kernel, identify finite length with degree loss and compute fibres (SF.3).
* parabolicDual: filtered internal Hom, the fibre description at mixed marks and the
  line-modification comparison with the ordinary dual sheaf are omitted. Degree shifts,
  weights, the twist compatibility and the coparabolic degree of the dual are retained.
* ParabolicBundle.filtration, coparabolicZero.eq_filtration/bounds: formal-disc model at one
  mark for α ≥ 0; negative indices need the meromorphic ambient, and gluing is SF.3.
* ParabolicBundle.Hom: fibre maps preserving the threshold steps; the global bundle map is
  omitted. ParabolicBundle.directSum and ParabolicBundle.shift keep the numerical/fibre data.
* ParabolicBundle.ofLogConnection: residue endomorphisms of the marked fibres only; the
  logarithmic connection and the canonical extension are H.2.
* unitaryParabolicSemistable: the degree identity from the residue theorem only;
  semistability needs the global saturated subbundles and gap G6.
* ParabolicBundle.twist: twist by a line bundle of degree d with the fibre of the line
  trivialized; the global line bundle is omitted.
* Packet names without a declaration here (global carriers needed): ParabolicBundle.toBundle,
  ParabolicBundle.exists_adapted_frame, inducedSubbundle.filtration_eq_inf,
  inducedQuotient.filtration_eq_map, IsParabolicallySemistable.dual_iff,
  IsParabolicallySemistable.directSum, parabolicDual.filtration, parabolicDual.fibre,
  parabolicDual.map, parabolicDual.induced_exact, traceSectionMap.eq_traceMultiplication,
  traceSectionMap.sheafMap, traceSectionMap.sheafKernel_corank_one, and the global-section
  tests traceSectionMap.trivial_bundle_rank, traceSectionMap.split_kernel and
  traceSectionMap.rank_zero_possible.
* The trace pairing itself is HodgeStructuresPartII:H.3/trace-multiplication; this file uses
  only its fibrewise model `LinearMap.applyₗ`.
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
Every other packet declaration, API and test name occurs above; implementation remains
unchecked.
-/
