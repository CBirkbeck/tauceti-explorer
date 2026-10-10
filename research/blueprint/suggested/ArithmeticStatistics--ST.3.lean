/-
This file is a nonexhaustive signature prototype. The corrected packet and independent
review record the current statements; the reader requires the reconciliation listed there.
These proposed Lean forms let contributors and reviewers converge on names and signatures.
Proofs and data constructions below are placeholders, not implementations.
Arithmetic signatures whose exact suppliers are missing are explicitly listed at the end;
no placeholder proposition or opaque arithmetic carrier replaces a missing interface.
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.RegularWreathProduct
import Mathlib.GroupTheory.Goursat
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.SpecificGroups.Alternating.KleinFour
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite
import TauCeti.NumberTheory.ClassGroup.ElementaryTwoQuotient
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.RingTheory.ClassGroup.RelNorm

noncomputable section
open scoped BigOperators
open Classical Polynomial Filter Topology
set_option linter.unusedVariables false
namespace FieldStatistics

/-! Prime-power rank: image torsion, not all p-torsion. -/
def powerSubgroup (A : Type*) [CommGroup A] (m : ℕ) : Subgroup A where
  carrier := {a | ∃ b : A, b ^ m = a}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def powerRank (A : Type*) [CommGroup A] [Finite A] (p k : ℕ) : ℕ :=
  Nat.log p (Nat.card {a : powerSubgroup A (p ^ (k - 1)) // a ^ p = 1})

-- The numerator and denominator are adjacent power images.
def adjacentPowerQuotient (A : Type*) [CommGroup A] (p k : ℕ) : Type _ :=
  powerSubgroup A (p ^ (k - 1)) ⧸
    (powerSubgroup A (p ^ k)).comap (powerSubgroup A (p ^ (k - 1))).subtype

lemma powerRank_eq_log_quotient (A : Type*) [CommGroup A] [Finite A]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank A p k = Nat.log p (Nat.card (adjacentPowerQuotient A p k)) := by sorry
lemma powerRank_congr {A B : Type*} [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    (e : A ≃* B) (p k : ℕ) : powerRank A p k = powerRank B p k := by sorry
lemma powerRank_prod (A B : Type*) [CommGroup A] [Finite A] [CommGroup B] [Finite B]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank (A × B) p k = powerRank A p k + powerRank B p k := by sorry
lemma powerRank_antitone (A : Type*) [CommGroup A] [Finite A]
    {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) :
    powerRank A p (k + 1) ≤ powerRank A p k := by sorry
lemma powerRank_one_eq_elementaryTwo (K : Type*) [Field K] [NumberField K] :
    2 ^ powerRank (ClassGroup (NumberField.RingOfIntegers K)) 2 1 =
      Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient (NumberField.RingOfIntegers K)) := by sorry
-- FieldStatistics.powerRank_c2_at_four
example : powerRank (Multiplicative (ZMod 2)) 2 2 = 0 := by sorry
-- FieldStatistics.powerRank_c4_at_four
example : powerRank (Multiplicative (ZMod 4)) 2 2 = 1 := by sorry
-- FieldStatistics.powerRank_c8_at_eight
example : powerRank (Multiplicative (ZMod 8)) 2 3 = 1 ∧
    powerRank (Multiplicative (ZMod 8)) 2 4 = 0 := by sorry
-- FieldStatistics.powerRank_trivial
example {p k : ℕ} (hp : p.Prime) (hk : 1 ≤ k) : powerRank PUnit p k = 0 := by sorry

/-! The ordered FK phase and its nonsymmetric good-plane condition. -/
abbrev FKSpace (k : ℕ) := Fin k → ZMod 2 × ZMod 2

def fkPhase {k : ℕ} (u v : FKSpace k) : ZMod 2 :=
  ∑ j, ((u j).1 + (v j).1) * ((u j).1 + (v j).2)
def fkQuadratic {k : ℕ} (u : FKSpace k) : ZMod 2 :=
  ∑ j, (u j).1 * ((u j).1 + (u j).2)
def fkLinked {k : ℕ} (u v : FKSpace k) : Prop := fkPhase u v + fkPhase v u = 1
lemma fkPhase_diagonal {k : ℕ} (u : FKSpace k) : fkPhase u u = 0 := by sorry
lemma fkPhase_linked_iff {k : ℕ} (u v : FKSpace k) :
    fkPhase u v + fkPhase v u = fkQuadratic (u + v) := by sorry
lemma fkLinked_translate {k : ℕ} (u v c : FKSpace k) :
    fkLinked (u + c) (v + c) ↔ fkLinked u v := by sorry
-- FieldStatistics.fkPhase_zero
example (u v : FKSpace 0) : fkPhase u v = 0 ∧ fkQuadratic u = 0 := by sorry
-- FieldStatistics.fkPhase_asymmetric
example : fkPhase (fun _ : Fin 1 => (1, 0)) 0 = 1 ∧
    fkPhase 0 (fun _ : Fin 1 => (1, 0)) = 0 := by sorry
-- FieldStatistics.fkPhase_diagonal_vector
example : fkPhase (fun _ : Fin 1 => (1, 1)) 0 = 1 ∧
    fkPhase 0 (fun _ : Fin 1 => (1, 1)) = 1 ∧
    ¬ fkLinked (fun _ : Fin 1 => (1, 1)) 0 := by sorry

def fkGoodPlanes (k : ℕ) : Set (Submodule (ZMod 2) (FKSpace k)) :=
  {U | Module.finrank (ZMod 2) U = k ∧
    ∀ u ∈ U, ∀ v ∈ U, (∑ j, (u j).1 * ((v j).1 + (v j).2)) = 0}
theorem fk_good_subspace_bijection (k : ℕ) :
    Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2)) := by sorry
example : (fkGoodPlanes 2).ncard = 5 := by sorry

/-! Regular wreath types are actual embedded subgroups. -/
abbrev CTwo := Multiplicative (ZMod 2)
abbrev QuadraticWreath (G : Type*) [Group G] := RegularWreathProduct G CTwo
def swap (G : Type*) [Group G] : QuadraticWreath G :=
  RegularWreathProduct.inl (Multiplicative.ofAdd (1 : ZMod 2))
def OutsideInvolutions {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) :
    Set (QuadraticWreath G) := {w | w ∈ F ∧ w ^ 2 = 1 ∧ w.right ≠ 1}
def IsAdmissibleType {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) : Prop :=
  swap G ∈ F ∧ (∀ a : G, ∃ w ∈ F, w.right = 1 ∧ w.left 1 = a) ∧
    Subgroup.closure (OutsideInvolutions F) = F
def IsGoodType {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) : Prop :=
  IsAdmissibleType F ∧ ∀ a ∈ OutsideInvolutions F, ∀ b ∈ OutsideInvolutions F,
    ∃ x ∈ F, x * a * x⁻¹ = b

def transportType {G : Type*} [Group G] (a : MulAut G)
    (F : Subgroup (QuadraticWreath G)) : Subgroup (QuadraticWreath G) :=
  F.map (RegularWreathProduct.congr a (MulEquiv.refl CTwo)).toMonoidHom

def typeAutStabilizer {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) :
    Subgroup (MulAut G) where
  carrier := {a | transportType a F = F}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def outsideClassSetoid {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) :
    Setoid (OutsideInvolutions F) where
  r a b := ∃ x ∈ F, x * a.1 * x⁻¹ = b.1
  iseqv := by sorry

def outsideClassCount {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) : ℕ := Nat.card (Quotient (outsideClassSetoid F))
lemma goodType_iff_classCount_one {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) (hF : IsAdmissibleType F) :
    IsGoodType F ↔ outsideClassCount F = 1 := by sorry
lemma transportType_id {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G)) :
    transportType 1 F = F := by sorry
lemma transportType_comp {G : Type*} [Group G] (a b : MulAut G)
    (F : Subgroup (QuadraticWreath G)) :
    transportType (a * b) F = transportType a (transportType b F) := by sorry
lemma transportType_admissible {G : Type*} [Group G] (a : MulAut G)
    (F : Subgroup (QuadraticWreath G)) :
    IsAdmissibleType (transportType a F) ↔ IsAdmissibleType F := by sorry
lemma transportType_good {G : Type*} [Group G] (a : MulAut G)
    (F : Subgroup (QuadraticWreath G)) :
    IsGoodType (transportType a F) ↔ IsGoodType F := by sorry

-- The normality and involutivity hypotheses belong to the construction, not an opaque field.
def quotientGraphType {G : Type*} [Group G] (N : Subgroup G) [N.Normal]
    (a : MulAut (G ⧸ N)) (ha : a * a = 1) : Subgroup (QuadraticWreath G) where
  carrier := {w | a (QuotientGroup.mk (w.left 1)) = QuotientGroup.mk (w.left
    (Multiplicative.ofAdd (1 : ZMod 2)))}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
lemma quotientGraphType_card {G : Type*} [Group G] [Finite G] (N : Subgroup G)
    [N.Normal] (a : MulAut (G ⧸ N)) (ha : a * a = 1) :
    Nat.card (quotientGraphType N a ha) = 2 * Nat.card G * Nat.card N := by sorry
lemma quotientGraphType_outside {G : Type*} [Group G] (N : Subgroup G)
    [N.Normal] (a : MulAut (G ⧸ N)) (ha : a * a = 1) (w : QuadraticWreath G) :
    w ∈ OutsideInvolutions (quotientGraphType N a ha) ↔
      w.right ≠ 1 ∧ w.left (Multiplicative.ofAdd (1 : ZMod 2)) = (w.left 1)⁻¹ ∧
      a (QuotientGroup.mk (w.left 1)) = (QuotientGroup.mk (w.left 1))⁻¹ := by sorry
lemma enumeratedTypes_complete {G : Type*} [Group G] (F : Subgroup (QuadraticWreath G))
    (hF : IsAdmissibleType F) :
    ∃ (N : Subgroup G) (hN : N.Normal),
      ∃ (a : MulAut (G ⧸ N)) (ha : a * a = 1),
        F = @quotientGraphType G _ N hN a ha := by sorry
-- Transport the actual quotient-graph subgroup; no choice of abstract group isomorphism.
lemma enumeratedTypes_transport {G : Type*} [Group G]
    (N N' : Subgroup G) [N.Normal] [N'.Normal]
    (a : MulAut (G ⧸ N)) (ha : a * a = 1) (b : MulAut G)
    (hb : N.map b.toMonoidHom = N')
    (a' : MulAut (G ⧸ N')) (ha' : a' * a' = 1)
    (hconj : ∀ q, a' (QuotientGroup.congr N N' b hb q) =
      QuotientGroup.congr N N' b hb (a q)) :
    transportType b (quotientGraphType N a ha) = quotientGraphType N' a' ha' := by sorry

-- An inverse graph is a subgroup only for commutative G.
def inverseGraphType (G : Type*) [CommGroup G] : Subgroup (QuadraticWreath G) where
  carrier := {w | w.left (Multiplicative.ofAdd (1 : ZMod 2)) = (w.left 1)⁻¹}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
lemma typeAutStabilizer_abelian (G : Type*) [CommGroup G] :
    typeAutStabilizer (inverseGraphType G) = ⊤ := by sorry
-- FieldStatistics.type_c2 / FieldStatistics.catalogue_c2
example : IsAdmissibleType (inverseGraphType CTwo) ∧
    ¬ IsGoodType (inverseGraphType CTwo) ∧ outsideClassCount (inverseGraphType CTwo) = 2 := by sorry
-- FieldStatistics.type_c3 / FieldStatistics.catalogue_c3
example : IsGoodType (inverseGraphType (Multiplicative (ZMod 3))) ∧
    Nat.card (OutsideInvolutions (inverseGraphType (Multiplicative (ZMod 3)))) = 3 ∧
    Nat.card (typeAutStabilizer (inverseGraphType (Multiplicative (ZMod 3)))) = 2 := by sorry
-- FieldStatistics.type_trivial
example : IsGoodType (inverseGraphType PUnit) ∧
    Nat.card (OutsideInvolutions (inverseGraphType PUnit)) = 1 := by sorry
-- FieldStatistics.type_missing_swap
example (G : Type*) [Group G] :
    ¬ IsAdmissibleType (RegularWreathProduct.rightHom (D := G) (Q := CTwo)).ker := by sorry
def swapSubgroup : Subgroup (QuadraticWreath CTwo) := Subgroup.closure {swap CTwo}
def firstBaseInvolution : QuadraticWreath CTwo :=
  ⟨fun q => if q = 1 then Multiplicative.ofAdd (1 : ZMod 2) else 1, 1⟩
def firstBaseSubgroup : Subgroup (QuadraticWreath CTwo) :=
  Subgroup.closure {firstBaseInvolution}
-- FieldStatistics.catalogue_normalizer_not_abstract
example : Nonempty (swapSubgroup ≃* firstBaseSubgroup) ∧
    ¬ ∃ b : MulAut CTwo, transportType b swapSubgroup = firstBaseSubgroup := by sorry

abbrev AFour := alternatingGroup (Fin 4)
abbrev A4Kernel := alternatingGroup.kleinFour (Fin 4)
instance : A4Kernel.Normal := alternatingGroup.normal_kleinFour (by sorry)
-- The quotient is the actual A₄/V₄, not an abstract type supplied as a field.
def a4QuotientInversion : MulAut (AFour ⧸ A4Kernel) where
  toFun q := q⁻¹
  invFun q := q⁻¹
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
lemma a4QuotientInversion_squared : a4QuotientInversion * a4QuotientInversion = 1 := by sorry
-- Representative adapter for the accepted InductionRestrictionPartII:RS.6/order96-type.
-- Its finite cover and multiplier computation remain owned by that supplier.
def a4Type96 : Subgroup (QuadraticWreath AFour) :=
  quotientGraphType A4Kernel a4QuotientInversion a4QuotientInversion_squared
-- The other A₄ type uses conjugation by an odd permutation on A₄.
def a4OddConjugation : MulAut AFour where
  toFun a := ⟨Equiv.swap 0 1 * a.1 * (Equiv.swap 0 1)⁻¹, by sorry⟩
  invFun a := ⟨(Equiv.swap 0 1)⁻¹ * a.1 * Equiv.swap 0 1, by sorry⟩
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
def a4BottomConjugation : MulAut (AFour ⧸ (⊥ : Subgroup AFour)) :=
  QuotientGroup.congr ⊥ ⊥ a4OddConjugation (by sorry)
lemma a4BottomConjugation_squared : a4BottomConjugation * a4BottomConjugation = 1 := by sorry
def a4Type24 : Subgroup (QuadraticWreath AFour) :=
  quotientGraphType ⊥ a4BottomConjugation a4BottomConjugation_squared
-- FieldStatistics.catalogue_a4
example : Nat.card a4Type24 = 24 ∧ Nat.card a4Type96 = 96 ∧
    IsGoodType a4Type24 ∧ IsGoodType a4Type96 ∧
    ¬ ∃ b : MulAut AFour, transportType b a4Type24 = a4Type96 := by sorry

/-! Finite local mass; its global interpretation remains a conjectural arithmetic interface. -/
def tameOutsideLocalMass {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) (p : ℕ) (s : ℝ) : ℝ :=
  letI : Fintype F := Fintype.ofFinite F
  (Nat.card F : ℝ)⁻¹ * ∑ x : F, ∑ y : F,
    if x * y * x⁻¹ = y ^ p ∧ (y = 1 ∨ y.1 ∈ OutsideInvolutions F)
    then if y = 1 then 1 else (p : ℝ) ^ (-s) else 0
lemma tameOutsideLocalMass_eq {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) {p : ℕ} (hp : Odd p) (s : ℝ) :
    tameOutsideLocalMass F p s = 1 + outsideClassCount F * (p : ℝ) ^ (-s) := by sorry
lemma tameOutsideLocalMass_at_zero {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) {p : ℕ} (hp : Odd p) :
    tameOutsideLocalMass F p 0 = 1 + outsideClassCount F := by sorry
def localModelLogExponent {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) : ℕ := outsideClassCount F - 1
lemma localModelLogExponent_good {G : Type*} [Group G] [Finite G]
    (F : Subgroup (QuadraticWreath G)) (hF : IsGoodType F) : localModelLogExponent F = 0 := by sorry
-- FieldStatistics.tame_model_c3
example {p : ℕ} (hp : Odd p) (s : ℝ) :
    tameOutsideLocalMass (inverseGraphType (Multiplicative (ZMod 3))) p s =
      1 + (p : ℝ) ^ (-s) ∧ localModelLogExponent (inverseGraphType (Multiplicative (ZMod 3))) = 0 := by sorry
-- FieldStatistics.tame_model_c2
example {p : ℕ} (hp : Odd p) (s : ℝ) :
    tameOutsideLocalMass (inverseGraphType CTwo) p s = 1 + 2 * (p : ℝ) ^ (-s) ∧
      localModelLogExponent (inverseGraphType CTwo) = 1 := by sorry
-- FieldStatistics.tame_model_trivial
example {p : ℕ} (hp : Odd p) (s : ℝ) :
    tameOutsideLocalMass (inverseGraphType PUnit) p s = 1 + (p : ℝ) ^ (-s) := by sorry

/-! The Pell carrier keeps the unit radicand; field slices exclude it. -/
def pellRadicands : Set ℕ :=
  {d | 0 < d ∧ Squarefree d ∧ ∀ p : ℕ, p.Prime → p ∣ d → p = 2 ∨ p % 4 = 1}
def negativePellRadicands : Set ℕ :=
  {d | d ∈ pellRadicands ∧ ∃ x y : ℤ, x ^ 2 - (d : ℤ) * y ^ 2 = -1}
def pellRadicandsBelow (X : ℕ) : Finset ℕ := (Finset.range X).filter (· ∈ pellRadicands)
def pellDiscriminant (d : ℕ) : ℤ := if d % 4 = 1 then d else 4 * d
lemma pellRadicand_iff_local {d : ℕ} (hd : 1 < d) (hsq : Squarefree d) :
    d ∈ pellRadicands ↔ ∃ x y : ℚ, x ^ 2 - (d : ℚ) * y ^ 2 = -1 := by sorry
-- FieldStatistics.pell_unit_radicand
example : 1 ∈ pellRadicands ∧ 1 ∈ negativePellRadicands := by sorry
-- FieldStatistics.pell_five
example : 5 ∈ negativePellRadicands ∧ (2 : ℤ)^2 - 5 * 1^2 = -1 ∧ pellDiscriminant 5 = 5 := by sorry
-- FieldStatistics.pell_three
example : 3 ∉ pellRadicands := by sorry
-- FieldStatistics.pell_two_height
example : 2 ∈ negativePellRadicands ∧ (1 : ℤ)^2 - 2 * 1^2 = -1 ∧ pellDiscriminant 2 = 8 := by sorry

/-! Embedded fields and rigidity. The discriminant adapter is the accepted ST.0/ST.3
contract, repeated here only to make the native signatures independently elaborable. -/
abbrev EmbeddedField (k : Type*) [Field k] := IntermediateField k (AlgebraicClosure k)
def discrOfCharZeroField (L : Type*) [Field L] [CharZero L] : ℤ :=
  if h : FiniteDimensional ℚ L then @NumberField.discr L _ (@NumberField.mk L _ _ h) else 0

def galPerm (k : Type*) [Field k] (K : EmbeddedField k)
    (σ : AlgebraicClosure k ≃ₐ[k] AlgebraicClosure k) :
    Equiv.Perm (K →ₐ[k] AlgebraicClosure k) where
  toFun f := (σ : AlgebraicClosure k →ₐ[k] AlgebraicClosure k).comp f
  invFun f := (σ.symm : AlgebraicClosure k →ₐ[k] AlgebraicClosure k).comp f
  left_inv := by sorry
  right_inv := by sorry

def labelImage (k : Type*) [Field k] (K : EmbeddedField k) {n : ℕ}
    (e : (K →ₐ[k] AlgebraicClosure k) ≃ Fin n) : Set (Equiv.Perm (Fin n)) :=
  Set.range (fun σ => e.symm.trans ((galPerm k K σ).trans e))

def HasGaloisGroupOver (k : Type*) [Field k] (n : ℕ)
    (G : Subgroup (Equiv.Perm (Fin n))) (K : EmbeddedField k) : Prop :=
  ∃ e : (K →ₐ[k] AlgebraicClosure k) ≃ Fin n, labelImage k K e = G

structure RigidField (k : Type*) [Field k] (n : ℕ) (G : Subgroup (Equiv.Perm (Fin n))) where
  -- The structure generates FieldStatistics.RigidField.field.
  field : EmbeddedField k
  finite : FiniteDimensional k field
  degree : Module.finrank k field = n
  label : (field →ₐ[k] AlgebraicClosure k) ≃ Fin n
  image : labelImage k field label = G

def RigidField.relabel {k : Type*} [Field k] {n : ℕ} {G : Subgroup (Equiv.Perm (Fin n))}
    (R : RigidField k n G) (a : (Subgroup.normalizer (G : Set (Equiv.Perm (Fin n))))) : RigidField k n G where
  field := R.field
  finite := R.finite
  degree := R.degree
  label := R.label.trans a.1
  image := by sorry
lemma RigidField.relabel_id {k : Type*} [Field k] {n : ℕ}
    {G : Subgroup (Equiv.Perm (Fin n))} (R : RigidField k n G) : R.relabel 1 = R := by sorry
lemma RigidField.relabel_comp {k : Type*} [Field k] {n : ℕ}
    {G : Subgroup (Equiv.Perm (Fin n))} (R : RigidField k n G) (a b : (Subgroup.normalizer (G : Set (Equiv.Perm (Fin n))))) :
    (R.relabel a).relabel b = R.relabel (b * a) := by sorry

def rigidFieldCount (k : Type*) [Field k] [NumberField k] (n : ℕ)
    (G : Subgroup (Equiv.Perm (Fin n))) (P : EmbeddedField k → Prop) (X : ℝ) : ℕ :=
  {R : RigidField k n G | |(discrOfCharZeroField R.field : ℝ)| ≤ X ∧ P R.field}.ncard

def embeddedFieldCount (k : Type*) [Field k] [NumberField k] (n : ℕ)
    (G : Subgroup (Equiv.Perm (Fin n))) (P : EmbeddedField k → Prop) (X : ℝ) : ℕ :=
  {K : EmbeddedField k | FiniteDimensional k K ∧ Module.finrank k K = n ∧
    HasGaloisGroupOver k n G K ∧ |(discrOfCharZeroField K : ℝ)| ≤ X ∧ P K}.ncard
lemma rigidFieldCount_eq_normalizer_mul_embedded (k : Type*) [Field k] [NumberField k]
    {n : ℕ} (hn : 1 ≤ n) (G : Subgroup (Equiv.Perm (Fin n)))
    (P : EmbeddedField k → Prop) (X : ℝ) :
    rigidFieldCount k n G P X = Nat.card (Subgroup.normalizer (G : Set (Equiv.Perm (Fin n)))) * embeddedFieldCount k n G P X := by sorry

abbrev FiniteEmbeddedField (k : Type*) [Field k] := {K : EmbeddedField k // FiniteDimensional k K}
def embeddedIsoSetoid (k : Type*) [Field k] : Setoid (FiniteEmbeddedField k) where
  r K L := Nonempty (K.1 ≃ₐ[k] L.1)
  iseqv := by sorry

def isoWeightedRigidCount (k : Type*) [Field k] [NumberField k] (n : ℕ)
    (G : Subgroup (Equiv.Perm (Fin n))) (P : EmbeddedField k → Prop) (X : ℝ) : ℚ :=
  ∑ᶠ c : Quotient (embeddedIsoSetoid k),
    let K := c.out.1
    if Module.finrank k K = n ∧ HasGaloisGroupOver k n G K ∧
      |(discrOfCharZeroField K : ℝ)| ≤ X ∧ P K
    then (Nat.card (Subgroup.normalizer (G : Set (Equiv.Perm (Fin n)))) * n : ℚ) / Nat.card (K ≃ₐ[k] K) else 0
lemma rigidFieldCount_eq_weightedIso (k : Type*) [Field k] [NumberField k]
    {n : ℕ} (hn : 1 ≤ n) (G : Subgroup (Equiv.Perm (Fin n)))
    (P : EmbeddedField k → Prop)
    (hP : ∀ K L : EmbeddedField k, Nonempty (K ≃ₐ[k] L) → (P K ↔ P L)) (X : ℝ) :
    (rigidFieldCount k n G P X : ℚ) = isoWeightedRigidCount k n G P X := by sorry
lemma rigidFieldCount_mono (k : Type*) [Field k] [NumberField k] (n : ℕ)
    (G : Subgroup (Equiv.Perm (Fin n))) {P Q : EmbeddedField k → Prop}
    (hPQ : ∀ K, P K → Q K) {X Y : ℝ} (hXY : X ≤ Y) :
    rigidFieldCount k n G P X ≤ rigidFieldCount k n G Q Y := by sorry
-- FieldStatistics.rigidField_degree_one
example (X : ℝ) : rigidFieldCount ℚ 1 ⊥ (fun _ => True) X = if 1 ≤ X then 1 else 0 := by sorry
-- FieldStatistics.rigidField_quadratic
example (K : EmbeddedField ℚ) (hK : Module.finrank ℚ K = 2) (X : ℝ)
    (hX : |(discrOfCharZeroField K : ℝ)| ≤ X) :
    rigidFieldCount ℚ 2 ⊤ (fun L => L = K) X = 2 := by sorry
-- FieldStatistics.rigidField_s3
example (K : EmbeddedField ℚ) (hK : Module.finrank ℚ K = 3)
    (hG : HasGaloisGroupOver ℚ 3 ⊤ K) (X : ℝ)
    (hX : |(discrOfCharZeroField K : ℝ)| ≤ X) :
    rigidFieldCount ℚ 3 ⊤ (fun L => Nonempty (L ≃ₐ[ℚ] K)) X = 18 := by sorry
-- FieldStatistics.rigidField_below_discriminant
example (K : EmbeddedField ℚ) (X : ℝ) (hX : X < |(discrOfCharZeroField K : ℝ)|) :
    rigidFieldCount ℚ 2 ⊤ (fun L => L = K) X = 0 := by sorry

/-! Native quadratic fields are selected by their degree and field discriminant;
this avoids an unverified quadratic-field wrapper and fixes every conductor convention. -/
def quadraticRankAtDiscriminant (D : ℤ) (k r : ℕ) : Prop :=
  ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L = 2 →
    NumberField.discr L = D → powerRank (NumberField.NarrowClassGroup L) 2 k = r

def IsRankGoverningField (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    (d : ℤ) (k : ℕ) (φ : (M ≃ₐ[ℚ] M) → ℕ) : Prop :=
  1 ≤ k ∧ d % 4 ≠ 2 ∧
    (∀ σ τ, φ (τ * σ * τ⁻¹) = φ σ) ∧
    ∀ (p : ℕ) (Q : Ideal (NumberField.RingOfIntegers M)), p.Prime →
      ∀ [Q.IsPrime], Q.LiesOver (Ideal.span {(p : ℤ)}) → Algebra.IsUnramifiedAt ℤ Q →
      ∀ σ : M ≃ₐ[ℚ] M, IsArithFrobAt ℤ σ Q →
        quadraticRankAtDiscriminant (d * p) k (φ σ)

lemma governing_prime_choice (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    {d : ℤ} {k : ℕ} {φ : (M ≃ₐ[ℚ] M) → ℕ} (h : IsRankGoverningField M d k φ)
    {p : ℕ} (hp : p.Prime) {Q Q' : Ideal (NumberField.RingOfIntegers M)}
    [Q.IsPrime] [Q'.IsPrime]
    (ho : Q.LiesOver (Ideal.span {(p : ℤ)})) (ho' : Q'.LiesOver (Ideal.span {(p : ℤ)}))
    (hu : Algebra.IsUnramifiedAt ℤ Q) (hu' : Algebra.IsUnramifiedAt ℤ Q')
    {σ τ : M ≃ₐ[ℚ] M} (hσ : IsArithFrobAt ℤ σ Q) (hτ : IsArithFrobAt ℤ τ Q') :
    φ σ = φ τ := by sorry
lemma governing_conjugate_class (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    {d : ℤ} {k : ℕ} {φ : (M ≃ₐ[ℚ] M) → ℕ} (h : IsRankGoverningField M d k φ)
    (σ τ : M ≃ₐ[ℚ] M) : φ (τ * σ * τ⁻¹) = φ σ := by sorry
lemma governing_isomorphism (M M' : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    [Field M'] [NumberField M'] [IsGalois ℚ M'] (e : M ≃ₐ[ℚ] M')
    (d : ℤ) (k : ℕ) (φ : (M ≃ₐ[ℚ] M) → ℕ) :
    IsRankGoverningField M' d k (fun σ => φ (AlgEquiv.autCongr e.symm σ)) ↔
      IsRankGoverningField M d k φ := by sorry

-- Restriction itself is a native homomorphism once the normal intermediate field is fixed.
-- This signature fixes that field, so the extension direction cannot be reversed.
def restrictionToNormal (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    (K : IntermediateField ℚ M) [IsGalois ℚ K] : (M ≃ₐ[ℚ] M) →* (K ≃ₐ[ℚ] K) := by sorry
lemma governing_enlarge (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    (K : IntermediateField ℚ M) [NumberField K] [IsGalois ℚ K]
    (d : ℤ) (k : ℕ) (φ : (K ≃ₐ[ℚ] K) → ℕ) (h : IsRankGoverningField K d k φ) :
    IsRankGoverningField M d k (φ ∘ restrictionToNormal M K) := by sorry
-- FieldStatistics.governing_k1_mod4
example {p : ℕ} (hp : p.Prime) (ho : Odd p) (hc : p % 4 = 1)
    (L : Type) [Field L] [NumberField L] (hL : Module.finrank ℚ L = 2)
    (hD : NumberField.discr L = -4 * p) :
    powerRank (NumberField.NarrowClassGroup L) 2 1 = 1 := by sorry
-- FieldStatistics.governing_ramified_excluded
example (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    (Q : Ideal (NumberField.RingOfIntegers M)) [Q.IsPrime] (hQ : ¬ Algebra.IsUnramifiedAt ℤ Q)
    (d : ℤ) (k p : ℕ) (φ : (M ≃ₐ[ℚ] M) → ℕ) :
    ∀ σ, Algebra.IsUnramifiedAt ℤ Q → IsArithFrobAt ℤ σ Q →
      quadraticRankAtDiscriminant (d * p) k (φ σ) := by sorry
-- FieldStatistics.governing_prime_parameter_guard
example (L : Type) [Field L] [NumberField L] (hL : Module.finrank ℚ L = 2) :
    NumberField.discr L ≠ -12 := by sorry
-- FieldStatistics.governing_class_function
example (M : Type) [Field M] [NumberField M] [IsGalois ℚ M]
    (d : ℤ) (k : ℕ) (φ : (M ≃ₐ[ℚ] M) → ℕ)
    (σ τ : M ≃ₐ[ℚ] M) (hφ : φ (τ * σ * τ⁻¹) ≠ φ σ) :
    ¬ IsRankGoverningField M d k φ := by sorry

def pellFourRankSlice (r : ℕ) : Set ℕ :=
  {d | d ∈ pellRadicands ∧ 1 < d ∧ quadraticRankAtDiscriminant (pellDiscriminant d) 2 r}
example (r : ℕ) : 1 ∉ pellFourRankSlice r := by sorry

/-! A finite algebraic backend for the appendix. The nontrivial quotient action is
redundant for the certified arithmetic class-group action, but must be an explicit guard
for arbitrary finite S₃ modules. -/
abbrev SThree := Equiv.Perm (Fin 3)
def eligibleA4Kernel {A : Type*} [CommGroup A] [Finite A]
    (ρ : SThree →* MulAut A) (N : Subgroup A) : Prop :=
  Nat.card (A ⧸ N) = 4 ∧ (∀ q : A ⧸ N, q ^ 2 = 1) ∧
    (∀ s ∈ alternatingGroup (Fin 3), N.map (ρ s).toMonoidHom = N) ∧
    (∃ s ∈ alternatingGroup (Fin 3), ∃ a : A, QuotientGroup.mk (ρ s a) ≠
      (QuotientGroup.mk a : A ⧸ N)) ∧
    ¬ (∀ s : SThree, N.map (ρ s).toMonoidHom = N)
def eligibleA4Kernels {A : Type*} [CommGroup A] [Finite A]
    (ρ : SThree →* MulAut A) : Set (Subgroup A) := {N | eligibleA4Kernel ρ N}
def a4SampleEstimator {ι : Type*} [Fintype ι] {m : ℕ}
    (counts : ι → ℝ) (sample : Fin m → ι) : ℝ :=
  (Fintype.card ι : ℝ) / m * ∑ j, counts (sample j)
-- FieldStatistics.a4_empty_kernel_set
example {A : Type*} [CommGroup A] [Finite A] (ρ : SThree →* MulAut A)
    (hA : Odd (Nat.card A)) : eligibleA4Kernels ρ = ∅ := by sorry
-- FieldStatistics.a4_trivial_c3_action
example {A : Type*} [CommGroup A] [Finite A] (ρ : SThree →* MulAut A)
    (hρ : ∀ s ∈ alternatingGroup (Fin 3), ρ s = 1) : eligibleA4Kernels ρ = ∅ := by sorry

abbrev A4RegressionModule := Multiplicative ((ZMod 2 × ZMod 2) × (ZMod 2 × ZMod 2))
def a4RegressionAction : SThree →* MulAut A4RegressionModule := by sorry
lemma a4RegressionAction_cycle (a : A4RegressionModule) :
    (a4RegressionAction (Equiv.swap 0 1 * Equiv.swap 1 2) a).toAdd =
      (((a.toAdd.1).2, (a.toAdd.1).1 + (a.toAdd.1).2),
       ((a.toAdd.2).2, (a.toAdd.2).1 + (a.toAdd.2).2)) := by sorry
lemma a4RegressionAction_reflection (a : A4RegressionModule) :
    (a4RegressionAction (Equiv.swap 0 1) a).toAdd =
      (((a.toAdd.2).2, (a.toAdd.2).1), ((a.toAdd.1).2, (a.toAdd.1).1)) := by sorry
-- FieldStatistics.a4_s3_module_regression
example : (eligibleA4Kernels a4RegressionAction).ncard = 2 ∧
    24 * (eligibleA4Kernels a4RegressionAction).ncard = 48 := by sorry
-- FieldStatistics.a4_sample_estimator_unbiased
example {ι : Type*} [Fintype ι] [Nonempty ι] {m : ℕ} (hm : 0 < m) (counts : ι → ℝ) :
    (∑ sample : Fin m → ι, a4SampleEstimator counts sample) /
      (Fintype.card (Fin m → ι) : ℝ) = ∑ i, counts i := by sorry

/-! The metric counts a complex conjugate pair once. -/
def upperHalfRoots (g : Polynomial ℝ) : Finset ℂ :=
  ((g.map (algebraMap ℝ ℂ)).roots.toFinset).filter (fun z => 0 ≤ z.im)
def monicOrderGram (g : Polynomial ℝ) (n : ℕ) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j => ∑ z ∈ upperHalfRoots g, (z ^ i.val * star (z ^ j.val)).re

def binaryDehomogenization {n : ℕ} (f : Fin (n + 1) → ℝ) : Polynomial ℝ :=
  ∑ i, Polynomial.C (f i) * Polynomial.X ^ (n - i.val)
def binaryBasisAtBounded {n : ℕ} (f : Fin (n + 1) → ℝ) (z : ℂ) (k : Fin n) : ℂ :=
  if k.val = 0 then 1 else ∑ j : Fin (n + 1),
    if j.val < k.val then (f j : ℂ) * z ^ (k.val - j.val) else 0
def binaryOrderGram {n : ℕ} (f : Fin (n + 1) → ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j => ∑ z ∈ upperHalfRoots (binaryDehomogenization f),
    (binaryBasisAtBounded f z i * star (binaryBasisAtBounded f z j)).re

def gramNorm {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ) (v : Fin n → ℤ) : ℝ :=
  ∑ i, ∑ j, (v i : ℝ) * Q i j * (v j : ℝ)
def changeGram {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ)
    (e : (Fin n → ℤ) ≃ₗ[ℤ] (Fin n → ℤ)) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j => ∑ a, ∑ b, (e (Pi.single i 1) a : ℝ) * Q a b * (e (Pi.single j 1) b : ℝ)
def PositiveGram {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  (∀ i j, Q i j = Q j i) ∧ ∀ v : Fin n → ℝ, v ≠ 0 → 0 < ∑ i, ∑ j, v i * Q i j * v j

def IsMinkowskiReducedGram {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  PositiveGram Q ∧ ∀ i : Fin n, ∀ e : (Fin n → ℤ) ≃ₗ[ℤ] (Fin n → ℤ),
    (∀ j : Fin n, j < i → e (Pi.single j 1) = Pi.single j 1) →
      Q i i ≤ gramNorm Q (e (Pi.single i 1))
def IsStrongReducedGram {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  IsMinkowskiReducedGram Q ∧ ∀ e : (Fin n → ℤ) ≃ₗ[ℤ] (Fin n → ℤ),
    IsMinkowskiReducedGram (changeGram Q e) →
      ∀ j : Fin n, ∃ s : ℤ, (s = 1 ∨ s = -1) ∧ e (Pi.single j 1) = s • Pi.single j 1

def UpperUnitriangular {n : ℕ} (e : (Fin n → ℤ) ≃ₗ[ℤ] (Fin n → ℤ)) : Prop :=
  (∀ j, e (Pi.single j 1) j = 1) ∧ ∀ i j, j < i → e (Pi.single j 1) i = 0

def IsMonicQuasiReduced (g : Polynomial ℝ) : Prop :=
  g.Monic ∧ g.Separable ∧ ∃ e : (Fin g.natDegree → ℤ) ≃ₗ[ℤ] (Fin g.natDegree → ℤ),
    UpperUnitriangular e ∧ IsMinkowskiReducedGram (changeGram (monicOrderGram g g.natDegree) e)
def IsMonicStrongQuasiReduced (g : Polynomial ℝ) : Prop :=
  g.Monic ∧ g.Separable ∧ ∃ e : (Fin g.natDegree → ℤ) ≃ₗ[ℤ] (Fin g.natDegree → ℤ),
    UpperUnitriangular e ∧ IsStrongReducedGram (changeGram (monicOrderGram g g.natDegree) e)

-- Coefficients of f(a x+b y,c x+d y), with f_i the coefficient of x^(n-i)y^i.
def transformBinaryForm {n : ℕ} (A : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (f : Fin (n + 1) → ℝ) : Fin (n + 1) → ℝ := fun j =>
  ∑ i : Fin (n + 1), ∑ k ∈ Finset.range (n - i.val + 1),
    if k ≤ j.val ∧ j.val - k ≤ i.val then
      f i * (Nat.choose (n - i.val) k : ℝ) * (Nat.choose i.val (j.val - k) : ℝ) *
        (A 0 0 : ℝ) ^ (n - i.val - k) * (A 0 1 : ℝ) ^ k *
        (A 1 0 : ℝ) ^ (i.val - (j.val - k)) * (A 1 1 : ℝ) ^ (j.val - k)
    else 0

def IsBinaryQuasiReduced {n : ℕ} (f : Fin (n + 1) → ℝ) : Prop :=
  ∃ A : Matrix.SpecialLinearGroup (Fin 2) ℤ,
    (transformBinaryForm A f) 0 ≠ 0 ∧ (binaryDehomogenization (transformBinaryForm A f)).Separable ∧
    IsMinkowskiReducedGram (binaryOrderGram (transformBinaryForm A f))

lemma monicOrderGram_ring (g : Polynomial ℤ) (hg : g.Monic) (hs : (g.map (Int.castRingHom ℚ)).Separable)
    (i j : Fin g.natDegree) :
    monicOrderGram (g.map (Int.castRingHom ℝ)) g.natDegree i j =
      ∑ᶠ σ : AdjoinRoot g →+* ℂ,
        if 0 ≤ (σ (AdjoinRoot.root g)).im
        then (σ ((AdjoinRoot.root g) ^ i.val) * star (σ ((AdjoinRoot.root g) ^ j.val))).re else 0 := by sorry

def rootDilation (g : Polynomial ℝ) (ρ : ℝ) : Polynomial ℝ :=
  ∑ i ∈ Finset.range (g.natDegree + 1), Polynomial.C (g.coeff i * ρ ^ (g.natDegree - i)) * Polynomial.X ^ i
lemma reduction_root_dilation (g : Polynomial ℝ) {ρ : ℝ} (hρ : 0 < ρ)
    (i j : Fin g.natDegree) :
    monicOrderGram (rootDilation g ρ) g.natDegree i j =
      ρ ^ (i.val + j.val) * monicOrderGram g g.natDegree i j := by sorry
-- FieldStatistics.orderGram_x2_plus_one
example : monicOrderGram ((Polynomial.X : Polynomial ℝ)^2 + 1) 2 =
    Matrix.diagonal (fun _ : Fin 2 => (1 : ℝ)) := by sorry
-- FieldStatistics.orderGram_x2_minus_two
example : monicOrderGram ((Polynomial.X : Polynomial ℝ)^2 - 2) 2 =
    Matrix.diagonal (![2, 4] : Fin 2 → ℝ) := by sorry

def signBasisChange {n : ℕ} (s : Fin n → {a : ℤ // a = 1 ∨ a = -1}) :
    (Fin n → ℤ) ≃ₗ[ℤ] (Fin n → ℤ) where
  toFun v := fun i => (s i).1 * v i
  invFun v := fun i => (s i).1 * v i
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry
-- FieldStatistics.strong_sign_regression
example {n : ℕ} (Q : Matrix (Fin n) (Fin n) ℝ)
    (s : Fin n → {a : ℤ // a = 1 ∨ a = -1}) :
    IsMinkowskiReducedGram (changeGram Q (signBasisChange s)) ↔ IsMinkowskiReducedGram Q := by sorry
-- FieldStatistics.binary_uniform_dilation
example {n : ℕ} (f : Fin (n + 1) → ℝ) (ρ : ℝ) (z : ℂ) (k : Fin n) :
    binaryBasisAtBounded (fun i => ρ * f i) z k =
      if k.val = 0 then 1 else (ρ : ℂ) * binaryBasisAtBounded f z k := by sorry

-- The weak expanding-root theorem does not imply strong uniqueness.
theorem monic_weak_quasi_reduction (g : Polynomial ℝ) (hg : g.Monic) (hs : g.Separable) :
    ∃ ρ₀ : ℝ, 0 < ρ₀ ∧ ∀ ρ, ρ₀ ≤ ρ → IsMonicQuasiReduced (rootDilation g ρ) := by sorry
-- Trace-zero ring fibres: two signed polynomial alternatives under the strong hypothesis.
theorem strong_reduction_ring_fibres (g h : Polynomial ℤ) (hg : g.Monic) (hh : h.Monic)
    (hgirr : Irreducible (g.map (Int.castRingHom ℚ)))
    (hhirr : Irreducible (h.map (Int.castRingHom ℚ)))
    (hdeg : g.natDegree = h.natDegree) (hn : 2 ≤ g.natDegree)
    (htg : g.coeff (g.natDegree - 1) = 0) (hth : h.coeff (h.natDegree - 1) = 0)
    (hgs : IsMonicStrongQuasiReduced (g.map (Int.castRingHom ℝ)))
    (hhs : IsMonicStrongQuasiReduced (h.map (Int.castRingHom ℝ)))
    (he : Nonempty (AdjoinRoot g ≃+* AdjoinRoot h)) :
    h = g ∨ h = Polynomial.C ((-1 : ℤ)^g.natDegree) * g.comp (-Polynomial.X) := by sorry


/-! Target-level signatures which use native fields and finite group data. -/
-- Adapter for the imported absolute-discriminant isomorphism-class count.
def degreeFieldCount (n : ℕ) (X : ℝ) : ℕ :=
  {c : Quotient (embeddedIsoSetoid ℚ) |
    Module.finrank ℚ c.out.1 = n ∧ |(discrOfCharZeroField c.out.1 : ℝ)| ≤ X}.ncard

theorem schmidt_field_count_bound {n : ℕ} (hn : 2 ≤ n) :
    Asymptotics.IsBigO atTop (fun X : ℝ => (degreeFieldCount n X : ℝ))
      (fun X => X ^ (((n : ℝ) + 2) / 4)) := by sorry
theorem lemke_oliver_thorne_field_bound {n : ℕ} (hn : 6 ≤ n) :
    Asymptotics.IsBigO atTop (fun X : ℝ => (degreeFieldCount n X : ℝ))
      (fun X => X ^ ((1564 / 1000 : ℝ) * (Real.log n) ^ 2)) := by sorry
theorem all_fields_degree_at_most_five {n : ℕ} (hn : n ∈ ({2,3,4,5} : Finset ℕ)) :
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℝ => (degreeFieldCount n X : ℝ) / X) atTop (nhds c) := by sorry

def galoisGroupFieldCount (G : Type*) [Group G] [Finite G] (X : ℝ) : ℕ :=
  {c : Quotient (embeddedIsoSetoid ℚ) | IsGalois ℚ c.out.1 ∧
    Nonempty ((c.out.1 ≃ₐ[ℚ] c.out.1) ≃* G) ∧
    |(discrOfCharZeroField c.out.1 : ℝ)| ≤ X}.ncard
theorem galois_field_three_eighths_bound (G : Type*) [Group G] [Finite G]
    (hG : 4 < Nat.card G) {ε : ℝ} (hε : 0 < ε) :
    Asymptotics.IsBigO atTop (fun X : ℝ => (galoisGroupFieldCount G X : ℝ))
      (fun X => X ^ ((3 / 8 : ℝ) + ε)) := by sorry
theorem cyclic_prime_field_count {p : ℕ} [Fact p.Prime] :
    Asymptotics.IsBigO atTop
      (fun X : ℝ => (galoisGroupFieldCount (Multiplicative (ZMod p)) X : ℝ))
      (fun X => X ^ ((p - 1 : ℕ) : ℝ)⁻¹) := by sorry
theorem cyclic_cubic_asymptotic :
    ∃ c : ℝ, 0 < c ∧ Tendsto
      (fun X : ℝ => (galoisGroupFieldCount (Multiplicative (ZMod 3)) X : ℝ) /
        X ^ (1/2 : ℝ)) atTop (nhds c) := by sorry

-- Actual ℓ-torsion of an existing group, including the norm kernel.
def torsionSubgroup (A : Type*) [CommGroup A] (ℓ : ℕ) : Subgroup A where
  carrier := {a | a ^ ℓ = 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
theorem relative_torsion_splitting
    (R S : Type*) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
    [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]
    {ℓ : ℕ} (hℓ : ℓ.Prime) (hd : ¬ ℓ ∣ Module.finrank R S) :
    Nonempty (↥(torsionSubgroup (ClassGroup S) ℓ) ≃*
      (↥(torsionSubgroup (ClassGroup S) ℓ ⊓ (ClassGroup.relNorm (R := R)).ker) ×
        ↥(torsionSubgroup (ClassGroup R) ℓ))) := by sorry

-- The ordinary splitting above reuses the native class-group norm.
-- ArithmeticStatistics:ST.3/relative-torsion-splitting (omitted components)
-- Narrow norm/extension and norm∘extension = power degree need the requested
-- ClassFieldTheory exports on NumberField.NarrowClassGroup. The ordinary and
-- narrow torsion-cardinality factorizations are also omitted signatures.

-- The quartic finite-density regression is independent of the global sieve.
def binaryQuarticDiscriminant (v : Fin 5 → ZMod 9) : ZMod 9 :=
  let a := v 0; let b := v 1; let c := v 2; let d := v 3; let e := v 4
  256*a^3*e^3 - 192*a^2*b*d*e^2 - 128*a^2*c^2*e^2 + 144*a^2*c*d^2*e -
  27*a^2*d^4 + 144*a*b^2*c*e^2 - 6*a*b^2*d^2*e - 80*a*b*c^2*d*e +
  18*a*b*c*d^3 + 16*a*c^4*e - 4*a*c^3*d^2 - 27*b^4*e^2 +
  18*b^3*c*d*e - 4*b^3*d^3 - 4*b^2*c^3*e + b^2*c^2*d^2
example : (Finset.univ.filter (fun v : Fin 5 → ZMod 9 =>
    binaryQuarticDiscriminant v ≠ 0)).card = 42768 := by sorry
example : (42768 / 59049 : ℚ) = 176 / 243 := by sorry

-- The local-density function is numerical. Its equality with the arithmetic
-- density still uses the imported order and finite-ring counting interfaces.
def binarySquarefreeLocalFactor (n p : ℕ) : ℚ :=
  let q := (p : ℚ)⁻¹
  if p = 2 then (if n = 2 then 1/2 else 3/8)
  else if n = 2 then (1-q)*(1+q-q^3)
  else if n = 3 then (1-q)^2*(1+q)^2
  else (1-q)^2*(1+q)*(1+q-q^2)
example : binarySquarefreeLocalFactor 4 3 = 176/243 := by sorry
example : binarySquarefreeLocalFactor 3 2 = 3/8 := by sorry

/-! The finite conclusion uses native abelianization. Arithmetic type generation and
reduced-multiplier assertions still require their named supplier interfaces. -/
theorem good_type_abelianization {G : Type*} [Group G]
    (F : Subgroup (QuadraticWreath G)) (hF : IsGoodType F) :
    Nonempty (Abelianization F ≃* CTwo) := by sorry

theorem squarefree_field_discriminant_sn (K : EmbeddedField ℚ) [NumberField K]
    {n : ℕ} (hn : 2 ≤ n) (hd : Module.finrank ℚ K = n)
    (hsq : Squarefree (NumberField.discr K)) : HasGaloisGroupOver ℚ n ⊤ K := by sorry

theorem small_trace_zero_element {n : ℕ} (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type) [Field K] [NumberField K],
      Module.finrank ℚ K = n → ∃ a : NumberField.RingOfIntegers K,
        a ≠ 0 ∧ Algebra.trace ℚ K (a : K) = 0 ∧
        ∀ σ : K →ₐ[ℚ] ℂ, ‖σ a‖ ≤ C * |(NumberField.discr K : ℝ)| ^
          ((2 * (n : ℝ) - 2)⁻¹) := by sorry

def HasSmallIntegralGenerator (K : FiniteEmbeddedField ℚ) (Y : ℝ) : Prop :=
  letI : FiniteDimensional ℚ K.1 := K.property
  ∃ a : NumberField.RingOfIntegers K.1,
    IntermediateField.adjoin ℚ {(a : K.1)} = ⊤ ∧ ∀ σ : K.1 →ₐ[ℚ] ℂ, ‖σ a‖ ≤ Y
def shortGeneratorFieldCount (n : ℕ) (Y : ℝ) : ℕ :=
  {c : Quotient (embeddedIsoSetoid ℚ) |
    Module.finrank ℚ c.out.1 = n ∧ HasSmallIntegralGenerator c.out Y}.ncard
theorem short_generator_field_upper_bound {n : ℕ} (hn : 2 ≤ n) :
    Asymptotics.IsBigO atTop (fun Y : ℝ => (shortGeneratorFieldCount n Y : ℝ))
      (fun Y => Y ^ (((n : ℝ) - 1) * ((n : ℝ) + 2) / 2)) := by sorry


/-! Exact omitted signatures. Each entry is a gap in the native supplier interface,
not a new opaque arithmetic datatype or a placeholder proposition. The reader
and packet give the precise statement, hypotheses and supplier for every entry. -/

-- ArithmeticStatistics:ST.3/cubic-conductor-discriminant
-- FieldStatistics.cubic_conductor_discriminant
-- Needs the exact Picard conductor sequence, relative class-field character correspondence and wild-prime3 normalization; the native finite-group rank does not replace them.

-- ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound
-- FieldStatistics.quadratic_order_three_torsion_bound
-- Needs the exact Picard conductor sequence and local unit calculation.
-- The bound is 3^(ω(f)+1)h₃(Cl K), sharpening to 3^ω(f) away from3;
-- K=Q(√−39), f=9 rules out the unconditional constant-one exponent.

-- ArithmeticStatistics:ST.3/cubic-large-total-ramification-bound
-- FieldStatistics.cubic_large_total_ramification_bound
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient
-- FieldStatistics.secondary_cubic_lattice_coefficient
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation
-- FieldStatistics.cubic_secondary_local_factor_evaluation
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/cubic-root-weighted-sieve-identity
-- FieldStatistics.cubic_root_weighted_sieve_identity
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/refined-cubic-sieve
-- FieldStatistics.refined_cubic_sieve
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral
-- FieldStatistics.cubic_secondary_orbit_integral
-- Needs the accepted ST.1 local cubic-order and ST.2 orbit-count/Haar/slicing interfaces, with the exact secondary normalization in the packet.

-- ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization
-- FieldStatistics.low_degree_s_integral_parametrization
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/low-degree-maximal-sieve
-- FieldStatistics.low_degree_maximal_sieve
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/low-degree-jacobian-mass
-- FieldStatistics.low_degree_jacobian_mass
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/quartic-quintic-density-constants
-- FieldStatistics.quartic_quintic_density_constants
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre
-- FieldStatistics.quartic_class_group_two_torsion_fibre
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios
-- FieldStatistics.low_degree_class_group_mass_ratios
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula
-- FieldStatistics.quadratic_four_rank_conic_formula
-- Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

-- ArithmeticStatistics:ST.3/quadratic-four-rank-jacobi-expansion
-- FieldStatistics.quadratic_four_rank_jacobi_expansion
-- Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

-- ArithmeticStatistics:ST.3/fk-maximal-unlinked-support
-- FieldStatistics.fk_maximal_unlinked_support
-- Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

-- ArithmeticStatistics:ST.3/fk-main-coefficient
-- FieldStatistics.fk_main_coefficient
-- Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

-- ArithmeticStatistics:ST.3/fk-narrow-wide-moment-comparison
-- FieldStatistics.fk_narrow_wide_moment_comparison
-- Needs the accepted quadratic-discriminant counting family and analytic Jacobi-moment sum interfaces. The ordered phase and good-plane finite comparison above are native.

-- ArithmeticStatistics:ST.3/rank-moments-determine-rank-law
-- FieldStatistics.rank_moments_determine_rank_law
-- Needs ST.5 rank-marginal uniqueness from elementary-abelian test moments,
-- or the recorded DJ geometric-zero growth lemma. Gaussian inversion of rank
-- moments supplies no moments for non-elementary finite p-groups; the existing
-- all-test-p-group uniqueness contract alone does not suffice.

-- ArithmeticStatistics:ST.3/uniform-small-degree-field-bound
-- FieldStatistics.uniform_small_degree_field_bound
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound
-- FieldStatistics.shintani_cubic_order_uniform_bound
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/relative-three-torsion-propagation
-- FieldStatistics.relative_three_torsion_propagation
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound
-- FieldStatistics.relative_three_torsion_piecewise_bound
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail
-- FieldStatistics.quadratic_tower_torsion_tail
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/wreath-transposition-fibre
-- FieldStatistics.wreath_transposition_fibre
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/thin-two-group-torsion
-- FieldStatistics.thin_two_group_torsion
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/quadratic-tower-counting-constants
-- FieldStatistics.quadratic_tower_counting_constants
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/two-extension-three-torsion-means
-- FieldStatistics.two_extension_three_torsion_means
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean
-- FieldStatistics.relative_wreath_three_torsion_mean
-- Needs the accepted relative-discriminant extension family, signature/local specification and tower-field counting exports, with the precise class-group norm and unit normalization in the packet. The native norm torsion split is supplied above.

-- ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface
-- FieldStatistics.rigidQuadraticMoment
-- FieldStatistics.unrigidQuadraticMoment
-- FieldStatistics.rigidMoment_imaginary_eq
-- FieldStatistics.rigidMoment_real_good_eq
-- FieldStatistics.GoodTypeMomentPrediction
-- FieldStatistics.BadTypeMomentPrediction
-- FieldStatistics.rigidMoment_inadmissible
-- FieldStatistics.RefinedGoodTypeMomentPrediction
-- FieldStatistics.liftingInvariant_generator_change
-- FieldStatistics.moment_c3
-- FieldStatistics.moment_c2_bad
-- FieldStatistics.moment_a4_correction
-- FieldStatistics.refined_generator_not_one
-- Needs the native maximal everywhere-unramified, infinity-split Galois group and continuous finite surjections from ClassFieldTheory, plus InductionRestrictionPartII RS.1 reduced covers and IG.4 Hom-valued arithmetic invariants. The exact moment definitions and tests are in the packet; no substitute carrier is introduced.

-- ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization
-- Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/embedded-type-catalogue
-- FieldStatistics.catalogueRow
-- catalogueRow additionally stores the imported reduced-multiplier certificate; RS.6/reduction-certificate has no native exported row type at the pins. The quotient graph, transport and finite subgroup tests above are native.

-- ArithmeticStatistics:ST.3/elementary-two-moment-euler-products
-- FieldStatistics.elementary_two_moment_euler_products
-- Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters.

-- ArithmeticStatistics:ST.3/elementary-two-moment-divergence
-- FieldStatistics.elementary_two_moment_divergence
-- Needs the named ClassFieldTheory, reduced-multiplier and arithmetic lifting suppliers. Finite wreath/group statements above are only their quadratic arithmetic adapters.

-- ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments
-- FieldStatistics.nonabelian_low_degree_known_moments
-- Needs the ST.1 prehomogeneous-order parametrizations, acceptable local families, adelic lattice/Jacobian and ST.2 tail interfaces. Native field discriminants alone do not encode these orbit masses.

-- ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator
-- FieldStatistics.a4KernelFieldCorrespondence
-- FieldStatistics.a4RigidCount_eq_24_mul
-- FieldStatistics.a4RigidCount_eq_48_mul_orbits
-- The missing kernel-to-field correspondence and rigid24/48 counts require equivariant unramified class-field exports. The finite module selector and sample estimator above do not stand for that arithmetic correspondence.

-- ArithmeticStatistics:ST.3/small-trace-zero-element
-- Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/schmidt-field-count-bound
-- Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/mixed-trace-finite-fibres
-- FieldStatistics.mixed_trace_finite_fibres
-- Needs the mixed-trace map and its exact Alexander-Hirschowitz/Bézout finite-fibre export; the generic native field-count bounds above do not construct that map.

-- ArithmeticStatistics:ST.3/galois-field-three-eighths-bound
-- The packet records the full relative-base and field-count supplier contract; the signature here covers its explicitly typed native Q-base specialization. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count
-- FieldStatistics.fixed_resolvent_cubic_count
-- Needs the native quadratic-resolvent map on cubic fields and the anti-invariant conductor-series export of Cohen–Morra §§6–7, with the Tauberian hypotheses. The source result includes a distinct Q(√−3) logarithmic branch.

-- ArithmeticStatistics:ST.3/baily-weighted-quartic-count
-- FieldStatistics.baily_weighted_quartic_count
-- Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

-- ArithmeticStatistics:ST.3/weighted-cubic-partial-summation
-- FieldStatistics.weighted_cubic_partial_summation
-- Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

-- ArithmeticStatistics:ST.3/quartic-torsion-counting-applications
-- FieldStatistics.quartic_torsion_counting_applications
-- Needs the native cubic resolvent-fibre, field weighting and pointwise two-torsion export from EffectiveBounds Part II, with fixed-resolvent constants retained.

-- ArithmeticStatistics:ST.3/eight-rank-governing-field
-- FieldStatistics.eight_rank_governing_field
-- Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

-- ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion
-- FieldStatistics.sixteen_rank_spin_criterion
-- Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

-- ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field
-- FieldStatistics.no_sixteen_rank_governing_field
-- Needs the original selected prime2/order4 spin criterion, native field E, the unit-square-invariant spin and conditional C_n exports. The governing predicate above is native.

-- ArithmeticStatistics:ST.3/negative-pell-historical-bounds
-- FieldStatistics.negative_pell_historical_bounds
-- Needs the original historical Pell estimates with radicand ordering and the native counting comparison; the local Pell carrier above is native.

-- ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction
-- FieldStatistics.binaryOrderGram_ring
-- binaryOrderGram_ring needs the general-degree binary-form associated order and its zeta-basis comparison from ST.1. The explicit real Gram formula is native; it is not a replacement arithmetic order.

-- ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts
-- FieldStatistics.monic_polynomial_sieve_counts
-- Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

-- ArithmeticStatistics:ST.3/strong-reduction-ring-fibres
-- Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve
-- FieldStatistics.trace_restricted_polynomial_sieve
-- Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

-- ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target
-- FieldStatistics.monogenic_field_lower_bound_target
-- Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

-- ArithmeticStatistics:ST.3/monogenic-field-asymptotic-prediction
-- FieldStatistics.monogenic_field_asymptotic_prediction
-- Needs the ST.2 restricted polynomial sieve/height-family exports, and where stated the corrected bounded field multiplicity. The native Gram, dilation and signed ring-fibre statements above do not discharge those gaps.

-- ArithmeticStatistics:ST.3/binary-discriminant-local-factors
-- Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet. The prototype covers only the component explicitly typed above; the reader retains the full relative/arithmetic/local-density statement.

-- ArithmeticStatistics:ST.3/binary-form-sieve-counts
-- FieldStatistics.binary_form_sieve_counts
-- Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

-- ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini
-- FieldStatistics.binary_form_arithmetic_bertini
-- Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

-- ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target
-- FieldStatistics.binary_form_field_lower_bound_target
-- Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

-- ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target
-- FieldStatistics.unramified_alternating_extension_lower_bound_target
-- Needs the ST.1 general binary order and ST.2 corrected restricted tail exports; field-count applications also need the uniform dilation/multiplicity or Nakagawa proof contracts stated in the packet.

-- ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily
-- FieldStatistics.kluners_cyclotomic_subfamily
-- Needs Wright’s original conductor/discriminant series over Q(zeta3), the native fixed-quadratic tower embedding, and its logarithmic coefficient. Malle invariants remain accepted imports.

-- ArithmeticStatistics:ST.3/nonabelian-tame-local-model
-- FieldStatistics.LogarithmicMomentPrediction
-- LogarithmicMomentPrediction uses the missing signed arithmetic moments, their base-field denominator and their asymptotic limit. The finite tame factor is native and does not prove that prediction.

end FieldStatistics
