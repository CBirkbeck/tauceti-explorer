/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DiamondSixOperations.md` is definitive. These statements
suggest Lean forms so contributors and reviewers can converge on names and signatures.
They claim no implementation; unfinished constructions and proofs use `sorry`.

Revision 2 removes SupplierContext. Geometry cannot be inferred from arbitrary
categories, unrelated morphism predicates, or an unspecified coefficient object.
The sections below are explicitly labelled formal or algebraic specializations.
Each is valid for its displayed carriers and laws. They are not declarations of
six operations on diamonds. In particular there is no theorem about an arbitrary
object masquerading as Spd Q_p or a geometric point.

The final ledger names every target/API/test still requiring its supplier carrier,
with its exact mathematical statement and the input needed to express it.
Omissions follow PROTOCOL §13 and are not counted as elaborated signatures.
Independent review REV-DiamondSixOperations~2 accepts the target-level plan with
its explicit supplier gaps and signature omissions. This ledger incorporates the
corrected Tate-twist transition and smooth Verdier-pullback coefficient hypothesis.
All implementationStatus fields remain unchecked. Elaboration checks the forms,
not the missing geometric comparisons or the proofs marked sorry.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/
import Mathlib.CategoryTheory.MorphismProperty.Composition
import Mathlib.CategoryTheory.Adjunction.Mates
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Colimits
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.Functor
import Mathlib.Topology.JacobsonSpace
import Mathlib.Topology.Sheaves.Abelian
import Mathlib.Topology.Sheaves.Stalks
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.Constructions
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.Topology.MetricSpace.Ultra.TotallySeparated
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.RingTheory.Valuation.LocalSubring
import Mathlib.RingTheory.Jacobson.Ring
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Lagrange

noncomputable section
open CategoryTheory Limits Opposite Topology
universe u v w
namespace TauCeti.DiamondSixOperations

attribute [local instance] HasDerivedCategory.standard

/-! S0: relative factorization definition; no geometric consequences from names alone. -/
section Factorization
variable {C : Type u} [Category.{v} C] (O P : MorphismProperty C)

def IsCompactifiable {X Y : C} (f : X ⟶ Y) : Prop :=
  ∃ (Z : C) (j : X ⟶ Z) (g : Z ⟶ Y), O j ∧ P g ∧ j ≫ g = f

lemma IsCompactifiable.mk {X Z Y : C} (j : X ⟶ Z) (g : Z ⟶ Y)
    (hj : O j) (hg : P g) : IsCompactifiable O P (j ≫ g) := by sorry

lemma IsCompactifiable.of_isOpenImmersion [P.ContainsIdentities]
    {X Y : C} (f : X ⟶ Y) (hf : O f) : IsCompactifiable O P f := by sorry

lemma IsCompactifiable.of_isPartiallyProper [O.ContainsIdentities]
    {X Y : C} (f : X ⟶ Y) (hf : P f) : IsCompactifiable O P f := by sorry

lemma IsCompactifiable.isSeparated (S : MorphismProperty C)
    [S.IsStableUnderComposition] (hO : O ≤ S) (hP : P ≤ S)
    {X Y : C} (f : X ⟶ Y) (hf : IsCompactifiable O P f) : S f := by sorry

-- Test IsCompactifiable.id: the relative identity case, with actual identity laws.
example [O.ContainsIdentities] [P.ContainsIdentities] (X : C) :
    IsCompactifiable O P (𝟙 X) := by sorry
end Factorization

/-! S3: formal counits and coefficient mates over actual module categories. -/
section Traces
variable {C : Type u} {D : Type v} {E : Type w}
    [Category C] [Category D] [Category E]
    {L : C ⥤ D} {R : D ⥤ C} {L' : D ⥤ E} {R' : E ⥤ D}

def shriekTrace (adj : L ⊣ R) : R ⋙ L ⟶ 𝟭 D := adj.counit

lemma shriekTrace_comp (adj : L ⊣ R) (adj' : L' ⊣ R') (B : E) :
    (shriekTrace (adj.comp adj')).app B =
      L'.map ((shriekTrace adj).app (R'.obj B)) ≫ (shriekTrace adj').app B := by sorry

-- Test twistedPullback_id, trace component: the identity adjunction is specified.
example (B : C) : (shriekTrace (Adjunction.id (C := C))).app B = 𝟙 B := by sorry
end Traces

section Coefficients
variable {Λ Λ' : Type u} [CommRing Λ] [CommRing Λ'] (ρ : Λ →+* Λ')
    (L R : ModuleCat.{u} Λ ⥤ ModuleCat.{u} Λ)
    (L' R' : ModuleCat.{u} Λ' ⥤ ModuleCat.{u} Λ')

/-- Point-module specialization of scalar restriction. The required left-adjoint
comparison is an actual natural isomorphism along the displayed ring map. -/
def upperShriek_restrictScalars (adj : L ⊣ R) (adj' : L' ⊣ R')
    (e : L ⋙ ModuleCat.extendScalars ρ ≅ ModuleCat.extendScalars ρ ⋙ L') :
    R' ⋙ ModuleCat.restrictScalars ρ ≅ ModuleCat.restrictScalars ρ ⋙ R := by sorry
/-- Formal point-module object, with the unit specified, without a smoothness claim. -/
def dualizingComplex : ModuleCat.{u} Λ := R.obj (ModuleCat.of Λ Λ)

/-- Scalar mate evaluated at the actual coefficient module. Identifying its right
side with a tensor of dualizing complexes requires the geometric twisted-pullback
comparison, which is recorded as omitted in the ledger. -/
def dualizingComplex_restrictScalars (adj : L ⊣ R) (adj' : L' ⊣ R')
    (e : L ⋙ ModuleCat.extendScalars ρ ≅ ModuleCat.extendScalars ρ ⋙ L') :
    (ModuleCat.restrictScalars ρ).obj (dualizingComplex R') ≅
      R.obj ((ModuleCat.restrictScalars ρ).obj (ModuleCat.of Λ' Λ')) := by sorry

lemma dualizingComplex_def : dualizingComplex R = R.obj (ModuleCat.of Λ Λ) := by sorry

-- Test dualizingComplex_id in the exact point-module model.
example : dualizingComplex (𝟭 (ModuleCat.{u} Λ)) ≅ ModuleCat.of Λ Λ := by sorry
end Coefficients

/-! S4: exact discrete-component model, using the actual derived category and shifts.
The equivalence with D_et of a union of geometric points is a C0/C2 comparison,
not assumed here. Tensor and étale/v-local APIs require the full supplier. -/
section DiscreteComponents
variable (Λ : Type u) [CommRing Λ]
abbrev PointDerived := DerivedCategory (ModuleCat.{u} Λ)

def pointUnit : PointDerived Λ := (DerivedCategory.singleFunctor (ModuleCat Λ) 0).obj
  (ModuleCat.of Λ Λ)

variable {I : Type u}
def IsInvertibleObject (A : I → PointDerived Λ) : Prop :=
  ∀ i, ∃ n : ℤ, Nonempty (A i ≅ (pointUnit Λ)⟦n⟧)

lemma IsInvertibleObject.const (n : ℤ) :
    IsInvertibleObject Λ (fun _ : I => (pointUnit Λ)⟦n⟧) := by sorry

lemma IsInvertibleObject.shift (A : I → PointDerived Λ)
    (hA : IsInvertibleObject Λ A) (m : ℤ) :
    IsInvertibleObject Λ (fun i => (A i)⟦m⟧) := by sorry

/-- Nonzero coefficients are essential for uniqueness. -/
lemma shiftedUnit_unique [Nontrivial Λ] (m n : ℤ)
    (h : Nonempty ((pointUnit Λ)⟦m⟧ ≅ (pointUnit Λ)⟦n⟧)) : m = n := by sorry

variable [TopologicalSpace I] [DiscreteTopology I]
def IsInvertibleObject.degree [Nontrivial Λ] (A : I → PointDerived Λ)
    (hA : IsInvertibleObject Λ A) : LocallyConstant I ℤ := by sorry

lemma IsInvertibleObject.degree_spec [Nontrivial Λ] (A : I → PointDerived Λ)
    (hA : IsInvertibleObject Λ A) (i : I) :
    Nonempty (A i ≅ (pointUnit Λ)⟦-(IsInvertibleObject.degree Λ A hA i)⟧) := by sorry

-- Test IsInvertibleObject.const_zero in the exact one-point module model.
example : IsInvertibleObject Λ (fun _ : ULift.{u} Unit => pointUnit Λ) := by sorry

-- Test IsInvertibleObject.disjoint_shifts: two actual components, unequal shifts.
example : IsInvertibleObject (ZMod 5)
    (fun i : Bool => if i then (pointUnit (ZMod 5))⟦(1 : ℤ)⟧ else pointUnit (ZMod 5)) ∧
    ¬ ∃ n : ℤ, ∀ i : Bool, Nonempty
      ((if i then (pointUnit (ZMod 5))⟦(1 : ℤ)⟧ else pointUnit (ZMod 5)) ≅
        (pointUnit (ZMod 5))⟦n⟧) := by sorry

-- Test not_isInvertibleObject_sum: a concrete rank-two point object over F_5.
example : ¬ IsInvertibleObject (ZMod 5)
    (fun _ : Unit => (DerivedCategory.singleFunctor (ModuleCat (ZMod 5)) 0).obj
      (ModuleCat.of (ZMod 5) (Fin 2 → ZMod 5))) := by sorry

-- Additional sign check, including a nonzero cohomology assertion.
example : ((pointUnit (ZMod 5))⟦(2 : ℤ)⟧).IsGE (-2) ∧
    ((pointUnit (ZMod 5))⟦(2 : ℤ)⟧).IsLE (-2) ∧
    ¬ IsZero ((DerivedCategory.homologyFunctor (ModuleCat (ZMod 5)) (-2)).obj
      ((pointUnit (ZMod 5))⟦(2 : ℤ)⟧)) := by sorry
end DiscreteComponents

/-- Degree-zero finite-free specialization of the reduction API. The rings are
specifically Z/ell^m and F_ell, and rho is their (necessarily canonical) ring map.
The full unbounded etale statement needs derived reduction and local lifting. -/
lemma IsInvertibleObject.of_reduction (ℓ m : ℕ) [Fact ℓ.Prime] (hm : 0 < m)
    (ρ : ZMod (ℓ ^ m) →+* ZMod ℓ) (M : ModuleCat (ZMod (ℓ ^ m)))
    [Module.Free (ZMod (ℓ ^ m)) M] [Module.Finite (ZMod (ℓ ^ m)) M]
    (hred : Nonempty ((ModuleCat.extendScalars ρ).obj M ≅ ModuleCat.of (ZMod ℓ) (ZMod ℓ))) :
    Nonempty (M ≅ ModuleCat.of (ZMod (ℓ ^ m)) (ZMod (ℓ ^ m))) := by sorry

/-! S5: normalized Haar and finite traces, with actual groups, rings and module actions. -/
def normalizedHaar (K : Type u) [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [CompactSpace K] [TotallyDisconnectedSpace K] [T2Space K] (Λ : Type v) [CommRing Λ]
    [TopologicalSpace Λ] [DiscreteTopology Λ]
    (hunit : ∀ H : OpenSubgroup K, IsUnit ((H : Subgroup K).index : Λ)) :
    LocallyConstant K Λ →ₗ[Λ] Λ := by sorry

section Haar
variable (K : Type u) [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [CompactSpace K] [TotallyDisconnectedSpace K] [T2Space K] (Λ : Type v) [CommRing Λ]
    [TopologicalSpace Λ] [DiscreteTopology Λ]
    (hunit : ∀ H : OpenSubgroup K, IsUnit ((H : Subgroup K).index : Λ))

/-- Arithmetic input to Haar: coprime finite index is a unit in an ell-power
annihilated ring. This derives invertibility instead of assuming the API conclusion. -/
lemma normalizedHaar_index_isUnit (H : OpenSubgroup K) (ℓ m : ℕ) (hm : 0 < m)
    (hΛ : (ℓ : Λ) ^ m = 0) (hcop : Nat.Coprime (H : Subgroup K).index ℓ) :
    IsUnit ((H : Subgroup K).index : Λ) := by sorry

lemma normalizedHaar_one : normalizedHaar K Λ hunit 1 = 1 := by sorry

open Classical in
lemma normalizedHaar_indicator (H : OpenSubgroup K) (g : K) (φ : LocallyConstant K Λ)
    (hφ : ∀ x, φ x = if x ∈ (fun y => g * y) '' (H : Set K) then 1 else 0) :
    normalizedHaar K Λ hunit φ * ((H : Subgroup K).index : Λ) = 1 := by sorry

lemma normalizedHaar_translate (k : K) (φ ψ : LocallyConstant K Λ)
    (h : ∀ x, ψ x = φ (k * x)) :
    normalizedHaar K Λ hunit ψ = normalizedHaar K Λ hunit φ := by sorry

lemma normalizedHaar_translate_right (k : K) (φ ψ : LocallyConstant K Λ)
    (h : ∀ x, ψ x = φ (x * k)) :
    normalizedHaar K Λ hunit ψ = normalizedHaar K Λ hunit φ := by sorry

lemma normalizedHaar_finite [Fintype K] [DiscreteTopology K] (φ : LocallyConstant K Λ) :
    normalizedHaar K Λ hunit φ * (Fintype.card K : Λ) = ∑ k, φ k := by sorry

lemma normalizedHaar_pushforward (L : Type w) [Group L] [TopologicalSpace L]
    [IsTopologicalGroup L] [CompactSpace L] [TotallyDisconnectedSpace L] [T2Space L]
    (π : K →* L) (hπ : Continuous π) (hsurj : Function.Surjective π)
    (hunitL : ∀ H : OpenSubgroup L, IsUnit ((H : Subgroup L).index : Λ))
    (φ : LocallyConstant L Λ) :
    normalizedHaar K Λ hunit (φ.comap ⟨π, hπ⟩) = normalizedHaar L Λ hunitL φ := by sorry

lemma normalizedHaar_unique (ν : LocallyConstant K Λ →ₗ[Λ] Λ) (hone : ν 1 = 1)
    (hinv : ∀ (k : K) (φ ψ : LocallyConstant K Λ),
      (∀ x, ψ x = φ (k * x)) → ν ψ = ν φ) : ν = normalizedHaar K Λ hunit := by sorry

-- Test normalizedHaar_trivial.
example [Subsingleton K] (φ : LocallyConstant K Λ) :
    normalizedHaar K Λ hunit φ = φ 1 := by sorry

/-- Density maps give a specific comparison to distributions; this is not an
assumption that the comparison fails to preserve sums. -/
def densityDistribution (φ : LocallyConstant K Λ) : LocallyConstant K Λ →ₗ[Λ] Λ where
  toFun ψ := normalizedHaar K Λ hunit (φ * ψ)
  map_add' := by sorry
  map_smul' := by sorry

/-- Dirac is evaluation at an actual non-isolated point. -/
theorem dirac_not_density [Nontrivial Λ] (x : K) (hx : ¬ IsOpen ({x} : Set K)) :
    ¬ ∃ φ : LocallyConstant K Λ,
      densityDistribution K Λ hunit φ = LocallyConstant.evalₗ Λ x := by sorry
end Haar

/-- Algebraic finite-fibre sum, prior to any normalization. -/
def finiteTrace (Λ : Type u) [CommRing Λ] (I : Type v) [Fintype I]
    (M : Type w) [AddCommGroup M] [Module Λ M] : (I → M) →ₗ[Λ] M where
  toFun a := ∑ i, a i
  map_add' := by sorry
  map_smul' := by sorry

def normalizedFiniteTrace (Λ : Type u) [CommRing Λ] (I : Type v) [Fintype I]
    (M : Type w) [AddCommGroup M] [Module Λ M]
    (hm : IsUnit (Fintype.card I : Λ)) : (I → M) →ₗ[Λ] M :=
  (↑(hm.unit⁻¹) : Λ) • finiteTrace Λ I M

lemma shriekTrace_finiteEtale (Λ : Type u) [CommRing Λ] (I : Type v) [Fintype I]
    (M : Type w) [AddCommGroup M] [Module Λ M] (a : I → M) :
    finiteTrace Λ I M a = ∑ i, a i := by sorry

-- Test shriekTrace_finiteEtale_degree: trace of the diagonal is degree times identity.
example (Λ : Type u) [CommRing Λ] (I : Type v) [Fintype I]
    (M : Type w) [AddCommGroup M] [Module Λ M] (a : M) :
    finiteTrace Λ I M (fun _ => a) = (Fintype.card I : Λ) • a := by sorry

/-- Finite-fibre mate: diagonal pullback and finite exceptional pullback are the
same functor in this model. Normalized trace has mate m⁻¹ id, not id. -/
def averagingTransformation (Λ : Type u) [CommRing Λ] (I : Type v) [Fintype I]
    (hm : IsUnit (Fintype.card I : Λ)) :
    (Functor.const (Discrete I) : ModuleCat.{u} Λ ⥤ (Discrete I ⥤ ModuleCat.{u} Λ)) ⟶
      Functor.const (Discrete I) := by sorry

lemma averagingTransformation_finite (Λ : Type u) [CommRing Λ] (I : Type v)
    [Fintype I] (hm : IsUnit (Fintype.card I : Λ)) (M : ModuleCat.{u} Λ) (i : I) :
    ((averagingTransformation Λ I hm).app M).app ⟨i⟩ =
      ModuleCat.ofHom ((↑(hm.unit⁻¹) : Λ) • LinearMap.id) := by sorry

lemma averagingTransformation_trace (Λ : Type u) [CommRing Λ] (I : Type v)
    [Fintype I] (hm : IsUnit (Fintype.card I : Λ)) (M : Type w)
    [AddCommGroup M] [Module Λ M] (a : M) :
    normalizedFiniteTrace Λ I M hm (fun _ => a) = a := by sorry

/-- Reindexing is the finite-fibre base-change model. -/
lemma averagingTransformation_baseChange (Λ : Type u) [CommRing Λ]
    (I J : Type v) [Fintype I] [Fintype J] (e : I ≃ J)
    (hi : IsUnit (Fintype.card I : Λ)) (hj : IsUnit (Fintype.card J : Λ))
    (M : Type w) [AddCommGroup M] [Module Λ M] (a : J → M) :
    normalizedFiniteTrace Λ I M hi (a ∘ e) = normalizedFiniteTrace Λ J M hj a := by sorry

/-- Fubini is the finite coset/subgroup model: multiply two normalized indices
once each. No second factor for either index appears. -/
lemma averagingTransformation_restrict_subgroup (Λ : Type u) [CommRing Λ]
    (I J : Type v) [Fintype I] [Fintype J]
    (hi : IsUnit (Fintype.card I : Λ)) (hj : IsUnit (Fintype.card J : Λ))
    (hij : IsUnit (Fintype.card (I × J) : Λ)) (M : Type w)
    [AddCommGroup M] [Module Λ M] (a : I × J → M) :
    normalizedFiniteTrace Λ (I × J) M hij a =
      normalizedFiniteTrace Λ I M hi
        (fun i => normalizedFiniteTrace Λ J M hj (fun j => a (i,j))) := by sorry

-- Test averagingTransformation_trivial_group, exact singleton model.
example (Λ : Type u) [CommRing Λ] (h : IsUnit (Fintype.card Unit : Λ))
    (M : Type w) [AddCommGroup M] [Module Λ M] (a : Unit → M) :
    normalizedFiniteTrace Λ Unit M h a = a () := by sorry

-- Test averagingTransformation_finite_free: F_5 and degree 2 detect normalization.
lemma degreeTwo_unit_F5 : IsUnit (Fintype.card (Fin 2) : ZMod 5) := by sorry

example :
    normalizedFiniteTrace (ZMod 5) (Fin 2) (ZMod 5) degreeTwo_unit_F5 (fun i => if i = 0 then 1 else 0) = 3 ∧
    normalizedFiniteTrace (ZMod 5) (Fin 2) (ZMod 5) degreeTwo_unit_F5 (fun _ => 1) = 1 ∧
    (3 : ZMod 5) ≠ 1 := by sorry

-- Test not_exists_normalizedHaar_proEll: invariance and normalization contradict
-- the finite quotient of order ell; no conclusion-like obstruction is assumed.
example (Λ : Type u) [CommRing Λ] (ℓ : ℕ) [NeZero ℓ] (hℓ : ¬ IsUnit (ℓ : Λ))
    (μ : (ZMod ℓ → Λ) →ₗ[Λ] Λ)
    (hinv : ∀ (a : ZMod ℓ) (φ : ZMod ℓ → Λ), μ (fun x => φ (x + a)) = μ φ)
    (hone : μ (fun _ => 1) = 1) : False := by sorry

/-! Concrete Haar tests on actual groups. The setup lemmas assert arithmetic
facts about open indices, not the outcomes of the integrals under test. -/
section ConcreteHaar
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

lemma finiteCyclic_index_unit_F5 (H : OpenSubgroup (Multiplicative (ZMod 2))) :
    IsUnit ((H : Subgroup (Multiplicative (ZMod 2))).index : ZMod 5) := by sorry

open Classical in
def finiteCyclicIndicator : LocallyConstant (Multiplicative (ZMod 2)) (ZMod 5) where
  toFun x := if x = 1 then 1 else 0
  isLocallyConstant := by sorry

-- Test normalizedHaar_finite_cyclic with actual C_2, F_5: 2 inverse is 3.
example : normalizedHaar (Multiplicative (ZMod 2)) (ZMod 5)
    finiteCyclic_index_unit_F5 finiteCyclicIndicator = 3 := by sorry

lemma padicOpenIndex_unit_F5 (H : OpenSubgroup (Multiplicative ℤ_[2])) :
    IsUnit ((H : Subgroup (Multiplicative ℤ_[2])).index : ZMod 5) := by sorry

open Classical in
def padicIndicator (p : ℕ) [Fact p.Prime] (n : ℕ) :
    LocallyConstant (Multiplicative ℤ_[p]) (ZMod 5) where
  toFun x := if PadicInt.toZModPow n (Multiplicative.toAdd x) = 0 then 1 else 0
  isLocallyConstant := by sorry

-- Test normalizedHaar_Zp: for 2-adic integers, volume of 2^n Z_2 is 2^(-n).
example (n : ℕ) : normalizedHaar (Multiplicative ℤ_[2]) (ZMod 5)
    padicOpenIndex_unit_F5 (padicIndicator 2 n) * (2 : ZMod 5) ^ n = 1 := by sorry

-- Actual infinite group and non-isolated point; no obstruction is a hypothesis.
example : ¬ ∃ φ : LocallyConstant (Multiplicative ℤ_[2]) (ZMod 5),
    densityDistribution (Multiplicative ℤ_[2]) (ZMod 5) padicOpenIndex_unit_F5 φ =
      LocallyConstant.evalₗ (ZMod 5) (1 : Multiplicative ℤ_[2]) := by sorry

-- Test not_exists_normalizedHaar_proEll on actual Z_5, with F_5 coefficients.
example (μ : LocallyConstant (Multiplicative ℤ_[5]) (ZMod 5) →ₗ[ZMod 5] ZMod 5)
    (hinv : ∀ (a : Multiplicative ℤ_[5]) (φ ψ : LocallyConstant (Multiplicative ℤ_[5]) (ZMod 5)),
      (∀ x, ψ x = φ (a * x)) → μ ψ = μ φ) (hone : μ 1 = 1) : False := by sorry
end ConcreteHaar

/-! S6: valuation refinement and the actual topological sheaf vanishing step.
The comparison with compactified perfectoid components remains a C4/C5 input. -/

/-- Algebraic core of Jacobsonity: a finite-type basic open containing V0 contains
an ambient closed valuation specializing V0. Closedness is expressed by the
absence of proper refinements containing the ground field, not assumed. -/
lemma closedValuationRefinement (k K : Type u) [Field k] [Field K] [Algebra k K]
    [IsAlgClosed k] (A : Subalgebra k K) [Algebra.FiniteType k A]
    (V₀ : ValuationSubring K) (hA : ∀ a : A, (a : K) ∈ V₀) :
    ∃ W : ValuationSubring K, W ≤ V₀ ∧ (∀ a : A, (a : K) ∈ W) ∧
      ∀ V : ValuationSubring K, (∀ x : k, algebraMap k K x ∈ V) → V ≤ W → V = W := by sorry

section ClosedPoints
variable (X : TopCat.{u}) [JacobsonSpace X] (Λ : Type u) [CommRing Λ]
    [HasSheafify (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)]

lemma closedPoints_detect_zero (F : X.Sheaf (ModuleCat.{u} Λ))
    (hclosed : ∀ x : X, x ∈ closedPoints X → IsZero (TopCat.Presheaf.stalk F.obj x)) : IsZero F := by sorry

/-- Cochain-complex specialization, with every cohomology sheaf and stalk shown.
It does not infer Jacobsonity from an arbitrary strictly disconnected base. -/
theorem closedPoints_detect_acyclic (A : CochainComplex (X.Sheaf (ModuleCat.{u} Λ)) ℤ)
    (hclosed : ∀ (n : ℤ) (x : X), x ∈ closedPoints X →
      IsZero (TopCat.Presheaf.stalk ((HomologicalComplex.homologyFunctor
        (X.Sheaf (ModuleCat Λ)) (ComplexShape.up ℤ) n).obj A).obj x)) :
    ∀ n : ℤ, IsZero ((HomologicalComplex.homologyFunctor (X.Sheaf (ModuleCat Λ))
      (ComplexShape.up ℤ) n).obj A) := by sorry
end ClosedPoints

-- Test verdierDual_point, degree-zero linear model over F_5.
example : Function.Bijective (Module.Dual.eval (ZMod 5) (ZMod 5)) := by sorry

-- The stalk-of-closed-point support argument is substantive: a nonzero section
-- has nonempty support closed in its domain, hence contains an ambient closed
-- point in a Jacobson space. Vanishing there contradicts that section. Full
-- D_et conservativity also needs the named geometric comparison, the precise
-- Spa(C,O_C) base, open extension by zero and global sections in the ledger.

end TauCeti.DiamondSixOperations

/-! Signature coverage ledger (revision 2).
Entries marked OMITTED are mathematical specifications, not Lean declarations or unit tests.
Entries marked SPECIALIZATION or TYPED name real declarations above. SPECIALIZATION is not
coverage of the full geometric signature. Full statements, hypotheses and supplier types below
remain acceptance requirements. PROTOCOL §13 forbids opaque replacement predicates.
Named tests marked OMITTED are not passed tests. No comment occurrence is counted as a declaration.
The packet and reader carry the same register and all 73 mathematical test specifications. -/

/-
DiamondSixOperations:S0/compactifiable-morphism — Compactifiable morphisms of v-stacks
Target: A morphism f : Y′ → Y of v-stacks is compactifiable if there are a v-stack Z, an open immersion j : Y′ → Z and a partially proper morphism g : Z → Y with f = g ∘ j. Open immersions are those of DiamondsAndVStacks D3 (every pullback to a perfectoid space is representable by an open immersion); partially proper morphisms are those of ECD Definition 18.4 (separated, with unique lifts from Spa(R, R°) to Spa(R, R⁺) for perfectoid Tate R and open integrally closed R⁺), owned by DiamondEtaleCohomology C4. No quasicompactness, representability or dimension condition is part of the definition; those enter only through the eligible classes (S0/eligible-morphism, S0/spatial-eligible-morphism). The factorisation is not part of the data: by S0/compactifiable-iff-separated-open there is a canonical one, through the canonical compactification of C4.
Hypotheses: f a morphism of v-stacks on Perf (characteristic-p perfectoid spaces); no smallness assumption.; Open immersion and partially proper are the supplier notions of DiamondsAndVStacks D3 and DiamondEtaleCohomology C4 (ECD Definitions 10.7 and 18.4), used without change.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable [SPECIALIZATION]: Relative factorization in a Mathlib category with displayed morphism properties O,P; geometric open immersions/partial properness are omitted.
ap IsCompactifiable.mk [SPECIALIZATION]: If j : Y′ → Z is an open immersion and g : Z → Y is partially proper then g ∘ j is compactifiable.
Form: Relative factorization constructor on the displayed O,P.
ap IsCompactifiable.of_isOpenImmersion [SPECIALIZATION]: Every open immersion is compactifiable (take g the identity, which is partially proper).
Form: Relative factorization with P.ContainsIdentities.
ap IsCompactifiable.of_isPartiallyProper [SPECIALIZATION]: Every partially proper morphism, in particular every proper morphism, is compactifiable (take j the identity).
Form: Relative factorization with O.ContainsIdentities.
ap IsCompactifiable.isSeparated [SPECIALIZATION]: A compactifiable morphism is separated.
Form: Relative factorization with O≤S, P≤S and composition stability of S.
ap isCompactifiable_iff [OMITTED]: f is compactifiable iff f is separated and the natural map Y′ → (Y′)‾^{/Y} into the canonical compactification of C4 is an open immersion (S0/compactifiable-iff-separated-open).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCompactifiable.baseChange [OMITTED]: Compactifiability is stable under base change along any map of v-stacks (S0/compactifiable-base-change).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCompactifiable.comp [OMITTED]: A composite of compactifiable morphisms is compactifiable (S0/compactifiable-composition).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCompactifiable.of_separated_etale [OMITTED]: A separated étale morphism (D3) is compactifiable (S0/separated-etale-compactifiable).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsCompactifiable.id [SPECIALIZATION]: For every v-stack Y, the identity of Y is compactifiable.
Form: Relative identity test with both genuine ContainsIdentities laws.
test IsCompactifiable.generic_point_inclusion [OMITTED]: For C complete algebraically closed and C⁺ ⊊ O_C an open bounded valuation subring, j : Spa(C, O_C) → Spa(C, C⁺) is a compactifiable open immersion and its canonical compactification over Spa(C, C⁺) is the identity of Spa(C, C⁺): every map Spa(R, R°) → Spa(C, C⁺) factors through Spa(C, O_C).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isCompactifiable_doubled_origin [OMITTED]: Let B be the perfectoid closed unit ball over Spa(C, O_C) and Y′ = B ⊔_{B∖{0}} B the ball with doubled origin (two copies glued along the open complement of the origin). The map Y′ → B is étale and surjective but not separated, so it is not compactifiable.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsCompactifiable.proper [OMITTED]: A proper map of v-stacks (quasicompact, separated, universally closed; ECD 18.1) is compactifiable with canonical compactification itself.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-iff-separated-open — Compactifiability through the canonical compactification
Target: Let f : Y′ → Y be a morphism of v-stacks, and when f is separated let (Y′)‾^{/Y} → Y be its canonical compactification (DiamondEtaleCohomology C4, ECD Proposition 18.6) with the natural map Y′ → (Y′)‾^{/Y}. Then f is compactifiable if and only if f is separated and Y′ → (Y′)‾^{/Y} is an open immersion. In that case f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} → Y partially proper; this is the canonical factorisation used to define Rf_!.
Hypotheses: f a morphism of v-stacks; the canonical compactification exists for separated f (C4).
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration isCompactifiable_iff_isSeparated_and_isOpenImmersion [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-base-change — Compactifiability is stable under base change
Target: Let f : Y′ → Y and Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ. If f is compactifiable, then f̃ is compactifiable.
Hypotheses: Any morphism Ỹ → Y of v-stacks.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-v-local — Compactifiability is v-local on the target
Target: Let f : Y′ → Y and g : Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ → Ỹ. If f̃ is compactifiable and g is a surjective map of v-stacks, then f is compactifiable.
Hypotheses: g surjective as a map of v-stacks (not merely topologically surjective; D4 separates the two).
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.of_baseChange_of_surjective [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-composition — Composites of compactifiable morphisms
Target: If Y₁ → Y₂ and Y₂ → Y₃ are compactifiable morphisms of v-stacks, then the composite Y₁ → Y₃ is compactifiable.
Hypotheses: Both maps compactifiable; no representability is needed.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-local-on-source — Compactifiability is local on the source for open covers
Target: Let f : Y′ → Y be separated and representable in locally spatial diamonds, and suppose Y′ is covered by open subfunctors V ⊂ Y′ with f|_V : V → Y compactifiable. Then f is compactifiable. Moreover, for every such open V ⊂ Y′ the composite V → Y′ → (Y′)‾^{/Y} is an open immersion.
Hypotheses: f separated and representable in locally spatial diamonds (D5); the cover is by open subfunctors (D4: open subsets of |Y′|).
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.of_openCover [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/separated-etale-compactifiable — Separated étale maps are compactifiable
Target: Every separated étale morphism f : Y′ → Y of v-stacks (étale in the sense of DiamondsAndVStacks D3, hence locally separated and representable after pullback to perfectoid spaces) is compactifiable.
Hypotheses: f separated and étale.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.of_isSeparated_of_isEtale [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/locally-split-map — Maps with local sections after pullback to strictly totally disconnected spaces
Target: A morphism g : Z → Y′ of v-stacks is locally split if it is separated and surjective (as a map of v-stacks) and, for every strictly totally disconnected perfectoid space X with a map X → Y′, every point of |X| has an open neighbourhood U ⊂ X over which Z ×_{Y′} U → U admits a section. The condition is stored as data on each use; it is not implied by universal openness, by being a v-cover, or by ℓ-cohomological smoothness, and ECD records that the source-descent statement fails without it.
Hypotheses: Strictly totally disconnected perfectoid spaces are those of DiamondsAndVStacks D1; surjectivity of maps of v-stacks is that of D4.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsLocallySplit [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.isSeparated [OMITTED]: A locally split map is separated.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.surjective [OMITTED]: A locally split map is a surjection of v-stacks.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.of_section [OMITTED]: A separated map with a global section s (g ∘ s = id) is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.of_clopen_sections [OMITTED]: If for every strictly totally disconnected X → Y′ there is a finite partition of X into open and closed subsets over each of which Z ×_{Y′} X has a section, and g is separated and surjective, then g is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.baseChange [OMITTED]: If g : Z → Y′ is locally split and Y″ → Y′ is any map, then Z ×_{Y′} Y″ → Y″ is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.comp [OMITTED]: A composite of locally split maps is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsLocallySplit.of_separated_etale_surjective [OMITTED]: A separated étale surjection is locally split, because every étale cover of a strictly totally disconnected space splits (D1).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsLocallySplit.id [OMITTED]: The identity of any v-stack is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsLocallySplit.openCover [OMITTED]: For an open cover {Uᵢ} of a v-sheaf Y′, the map ⊔ᵢ Uᵢ → Y′ is locally split (it is separated étale and surjective).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isLocallySplit_field_extension [OMITTED]: For complete algebraically closed C ⊊ C′, the map Spa(C′, O_C′) → Spa(C, O_C) is a separated surjection of v-sheaves without a section over the strictly totally disconnected Spa(C, O_C) (a section would be a continuous C-algebra map C′ → C), so it is not locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsLocallySplit.trivial_torsor [OMITTED]: For a profinite group K and a strictly totally disconnected X, the projection K × X → X is locally split.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-source-descent — Descent of compactifiability along locally split maps
Target: Let f : Y′ → Y be separated and representable in locally spatial diamonds, and let g : Z → Y′ be locally split (S0/locally-split-map) with f ∘ g compactifiable. Then f is compactifiable. Consequently, for separated maps representable in locally spatial diamonds, compactifiability is étale local on the source. Whether the local-splitting hypothesis can be replaced by universal openness of g is open (ECD footnote 5); the older statement without it is false and is not a target.
Hypotheses: f separated, representable in locally spatial diamonds; g locally split (separated, surjective, local sections over strictly totally disconnected spaces).
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.of_comp_of_isLocallySplit [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/compactifiable-cancellation — Cancellation for compactifiable morphisms
Target: Let f : Y′ → Y and g : Y → Z be morphisms of v-stacks with g separated. If g ∘ f is compactifiable, then f is compactifiable.
Hypotheses: g separated; no hypothesis on f beyond the morphism. Representability and dimension hypotheses on f are not produced by this statement and must be supplied separately in S0/eligible-morphism.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsCompactifiable.of_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/eligible-morphism — Eligible morphisms: the domain of the exceptional operations
Target: A morphism f : Y′ → Y of small v-stacks is eligible if (a) f is compactifiable (S0/compactifiable-morphism), (b) f is representable in locally spatial diamonds (DiamondsAndVStacks D5), and (c) locally dim.trg f < ∞ (DiamondEtaleCohomology C8: after pullback to any spatial diamond X → Y, every quasicompact open subspace of Y′ ×_Y X has finite dim.trg over X; the bound depends on the open). These are exactly the hypotheses of ECD Definition 22.18, Theorem 23.1 and Proposition 23.3; with nΛ = 0 for some n prime to p they make Rf_! and Rf^! defined. Local finiteness is not a global bound; the globally finite variant is S0/spatial-eligible-morphism.
Hypotheses: f a morphism of small v-stacks (D4); the three conditions are independent and all three are stored.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsEligible [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.mk [OMITTED]: From IsCompactifiable f, representability of f in locally spatial diamonds and LocallyFiniteDimTrg f.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.isCompactifiable [OMITTED]: An eligible map is compactifiable.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.representable [OMITTED]: An eligible map is representable in locally spatial diamonds.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.locallyFiniteDimTrg [OMITTED]: An eligible map has locally finite dim.trg.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.baseChange [OMITTED]: If f is eligible and Ỹ → Y is any map of small v-stacks, the pullback f̃ is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.comp [OMITTED]: Composites of eligible maps are eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.of_separated_etale [OMITTED]: A separated étale map of small v-stacks is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.of_isSpatialEligible [OMITTED]: A spatial-eligible map (S0/spatial-eligible-morphism) is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsEligible.restrict_open [OMITTED]: If f is eligible and V ⊂ Y′ is open, then f|_V is eligible (open immersions are separated étale; compose).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsEligible.id [OMITTED]: The identity of a small v-stack is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsEligible.ball [OMITTED]: The structure map of the absolute ball B → * (S5/perfectoid-ball) is eligible, with dim.trg equal to 1.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isEligible_infinite_dimTrg [OMITTED]: For complete algebraically closed C ⊂ C′ with tr.c̃(C′/C) = ∞, the map Spa(C′, O_C′) → Spa(C, O_C) is qcqs and representable in spatial diamonds but not eligible, because dim.trg is infinite on its only (quasicompact) open.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsEligible.openDisc [OMITTED]: The open unit disc D ⊂ B over Spa(C, O_C) maps eligibly to Spa(C, O_C), although D is not quasicompact: on each closed subdisc dim.trg is 1.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/spatial-eligible-morphism — Spatial-eligible morphisms: the quasicompact domain of Rf_!
Target: A morphism f : Y′ → Y of small v-stacks is spatial-eligible if it is compactifiable, representable in spatial diamonds (D5: representable in locally spatial diamonds and qcqs) and dim.trg f < ∞ globally (C8: one finite bound over all spatial diamond test objects). These are the hypotheses of ECD Definition 22.4, Theorem 22.5 and Propositions 22.8–22.12. The canonical compactification (Y′)‾^{/Y} of a spatial-eligible map need not be representable in spatial diamonds; the stronger hypothesis that it is enters only in S1/spatial-compactification-cd-bound.
Hypotheses: f a morphism of small v-stacks; the finite bound on dim.trg is global.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsSpatialEligible [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.mk [OMITTED]: From compactifiability, representability in spatial diamonds and a finite dim.trg bound.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.isEligible [OMITTED]: A spatial-eligible map is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.qcqs [OMITTED]: A spatial-eligible map is quasicompact and quasiseparated.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.dimTrg_lt_top [OMITTED]: diamondDimTrg f < ∞.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap isSpatialEligible_iff [OMITTED]: f is spatial-eligible iff f is eligible, qcqs and of globally finite dim.trg.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.baseChange [OMITTED]: Stable under base change along any map of small v-stacks.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.comp [OMITTED]: Stable under composition.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsSpatialEligible.restrict_qc_open [OMITTED]: If f is eligible and V ⊂ Y′ is an open subspace that is quasicompact over a spatial Y, then f|_V is spatial-eligible; this is the input of the left Kan extension in S2.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsSpatialEligible.id [OMITTED]: The identity of a spatial diamond is spatial-eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsSpatialEligible.ball [OMITTED]: B × X → X is spatial-eligible for every affinoid perfectoid X, with dim.trg 1.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isSpatialEligible_openDisc [OMITTED]: The open unit disc D → Spa(C, O_C) is eligible but not spatial-eligible: it is not quasicompact.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsSpatialEligible.qc_open_immersion [OMITTED]: A quasicompact open immersion into a spatial diamond is spatial-eligible with dim.trg 0.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S0/eligible-cancellation — Cancellation in the eligible class, with its extra hypotheses retained
Target: Let f : Y′ → Y and g : Y → Z be morphisms of small v-stacks. If g ∘ f is eligible, g is separated, f is representable in locally spatial diamonds and locally dim.trg f < ∞, then f is eligible. The two last hypotheses are not consequences of the others in this statement and are kept explicit.
Hypotheses: g separated; f representable in locally spatial diamonds with locally dim.trg f < ∞.
Required actual input: Actual small v-stacks and their morphisms; geometric open/partial proper/separated predicates and their stability; locally split covers; C8 dimension with empty value −infinity.
declaration IsEligible.of_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/lower-shriek-quasicompact — The proper pushforward Rf_! = Rf‾_* ∘ j_! of a spatial-eligible map
Target: Let f : Y′ → Y be spatial-eligible (S0/spatial-eligible-morphism) and Λ with nΛ = 0, n prime to p. Write f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} → Y the canonical compactification (S0/compactifiable-iff-separated-open); f‾ is proper because f is quasicompact (C4, ECD Corollary 18.8(vi)). Define Rf_! := Rf‾_* ∘ j_! : D_ét(Y′, Λ) → D_ét(Y, Λ), with j_! the exact left adjoint of j^* for the étale map j (DiamondEtaleCohomology C5, ECD 19.1) and Rf‾_* the right adjoint of f‾^* on the unbounded D_ét (C3, ECD Lemma 17.5). The compactification (Y′)‾^{/Y} is a small v-stack, in general not a spatial diamond; its D_ét and Rf‾_* are the general ones of C2–C3. The construction is first made on stable ∞-categories (C2's enhancement) and then passed to homotopy categories, so that S2 can left Kan extend it.
Hypotheses: f spatial-eligible: compactifiable, representable in spatial diamonds, dim.trg f < ∞.; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_eq [OMITTED]: Rf_! ≅ Rf‾_* ∘ j_! for the canonical factorisation (definitional).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_of_isProper [OMITTED]: If f is proper (so its canonical compactification is f itself), Rf_! ≅ Rf_*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_etale [OMITTED]: If f is quasicompact separated étale, Rf_! agrees with C5's left adjoint of f^* (S1/lower-shriek-etale-agreement-qc).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_factorisation [OMITTED]: For any factorisation f = g ∘ j′ with j′ an open immersion and g proper, Rf_! ≅ Rg_* ∘ j′_! (S1/factorisation-independence).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_amplitude [OMITTED]: Rf_! carries D_ét^{≥0} to D_ét^{≥0} and its cohomology vanishes in degrees > 3 dim.trg f on objects in degree 0 (S1/compactification-cd-bound).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_baseChange [OMITTED]: g^*Rf_! ≅ Rf̃_!g′^* for every map g : Ỹ → Y of small v-stacks (S1/lower-shriek-base-change-qc).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_comp [OMITTED]: R(f ∘ g)_! ≅ Rf_! ∘ Rg_! for composable spatial-eligible maps (S1/lower-shriek-composition-qc).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_projection [OMITTED]: Rf_!B ⊗^L A ≅ Rf_!(B ⊗^L f^*A) (S1/projection-formula-qc).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekQC_sum [OMITTED]: Rf_! commutes with arbitrary direct sums (S1/lower-shriek-direct-sums-qc).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekQC_id [OMITTED]: For f the identity of a spatial diamond, Rf_! ≅ id.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekQC_generic_point [OMITTED]: Assume Λ ≠ 0. For C⁺ ⊂ O_C of rank 2 and j : U = Spa(C, O_C) → Y = Spa(C, C⁺), the canonical compactification of j is Y, Rj_!Λ = j_!Λ, and RΓ(Y, Rj_!Λ) = 0, whereas RΓ(Y, Rj_*Λ) = Λ; so Rf_! is not Rf_* for non-proper f.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekQC_finite_etale [OMITTED]: For a finite étale f, Rf_! ≅ Rf_* ≅ f_! (the pushforward of a finite étale map is exact and equals C5's left adjoint).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekQC_ball_degree_two [OMITTED]: For f : B × Spa(C, O_C) → Spa(C, O_C), R^i f_!Λ = 0 for i ≠ 2 and R²f_!Λ(1) ≅ Λ, compatibly with Huber's ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support under the diamond comparison.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/factorisation-independence — Independence of the factorisation and the canonical comparisons
Target: Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = g ∘ j′ with j′ : Y′ → Z an open immersion and g : Z → Y proper. Then there is a natural equivalence Rg_* ∘ j′_! ≅ Rf_! of functors D_ét(Y′, Λ) → D_ét(Y, Λ), compatible with morphisms of such factorisations and transitive. In particular: (a) if f is proper then Rf_! ≅ Rf_*; (b) if f is a quasicompact open immersion with proper compactification, Rf_! ≅ f_!. This is ECD's Definition 22.4 made independent of the choice of compactification, the diamond counterpart of ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence.
Hypotheses: f spatial-eligible; j′ an open immersion; g proper.; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_factorisation [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/compactification-cd-bound — The 3·dim.trg bound for the canonical compactification
Target: Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = f‾ ∘ j the canonical factorisation. Then Rf‾_* has bounded cohomological dimension: for every A ∈ D_ét((Y′)‾^{/Y}, Λ) concentrated in degree 0, R^i f‾_* A = 0 for i > 3 dim.trg f. Since j_* is exact (C8, ECD Remark 21.14, for the quasicompact separated quasi-pro-étale open inclusion), also R^i f_* A = 0 for A ∈ D_ét(Y′, Λ) in degree 0 and i > 3 dim.trg f. No spatiality of (Y′)‾^{/Y} is assumed; the sharper 2 dim.trg f bound under that extra hypothesis is S1/spatial-compactification-cd-bound.
Hypotheses: f spatial-eligible; d = dim.trg f < ∞.; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).; No assumption that (Y′)‾^{/Y} is a spatial diamond.
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_cd_le_three_mul [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/spatial-compactification-cd-bound — The 2·dim.trg bound when the compactification is spatial
Target: In the situation of S1/compactification-cd-bound assume in addition that (Y′)‾^{/Y} → Y is representable in spatial diamonds. Then R^i f‾_* A = 0 for every A ∈ D_ét((Y′)‾^{/Y}, Λ) in degree 0 and i > 2 dim.trg f. This is a separate declaration from the 3·dim.trg bound, with the extra hypothesis stated.
Hypotheses: f spatial-eligible; the canonical compactification is representable in spatial diamonds (an additional hypothesis).; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_cd_le_two_mul_of_spatial [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/proper-dim-zero-classification — Proper diamonds of dim.trg 0 over a strictly totally disconnected space
Target: Let X be a strictly totally disconnected perfectoid space. The functor T ↦ X ×_{π₀X} T from compact Hausdorff spaces over π₀X to proper diamonds over X is an equivalence onto the proper diamonds f : Y → X with dim.trg f = 0. For X = Spa(C, C⁺) these are exactly the T × Spa(C, C⁺), T compact Hausdorff.
Hypotheses: X strictly totally disconnected (D1); proper as in ECD 18.1 (C4); dim.trg as in C8.
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration properDimTrgZero_equiv_compHaus [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/qcqs-diamond-continuity — Continuity of cohomology along cofiltered limits of qcqs diamonds
Target: Let Y be a small v-sheaf, Λ any ring, C ∈ D⁺_ét(Y, Λ), and Zᵢ → Y a cofiltered inverse system of qcqs diamonds with inverse limit Z. Then RΓ(Z, C) = colimᵢ RΓ(Zᵢ, C). For spatial Zᵢ this is ECD Proposition 14.9 (owned by DiamondEtaleCohomology C0); the qcqs case is the claim in the proof of ECD 22.7.
Hypotheses: Zᵢ qcqs diamonds with qcqs transition maps; C bounded below.
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration qcqsDiamond_cohomology_continuous [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/proper-dim-zero-topological-comparison — Étale sheaves on a proper dim.trg 0 diamond are topological sheaves
Target: Let X be strictly totally disconnected and f : Y → X proper with dim.trg f = 0, so Y = X ×_{π₀X} T (S1/proper-dim-zero-classification). Then pullback along the map of topoi t : Y_v → |Y| induces an equivalence D⁺(|Y|, Λ) ≃ D⁺_ét(Y, Λ), where D⁺(|Y|, Λ) is the derived category of sheaves of Λ-modules on the topological space |Y|.
Hypotheses: X strictly totally disconnected; f proper of dim.trg 0; Λ any ring; bounded-below objects only.
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration properDimTrgZero_topological_equiv [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/lower-shriek-base-change-qc — Base change for Rf_! (spatial-eligible case)
Target: Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and g : Ỹ → Y any map of small v-stacks with pullbacks f̃ : Ỹ′ → Ỹ and g′ : Ỹ′ → Y′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), on all of the unbounded category.
Hypotheses: f spatial-eligible; g arbitrary.; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/lower-shriek-composition-qc — Composition of Rf_! (spatial-eligible case)
Target: Let g : Y″ → Y′ and f : Y′ → Y be spatial-eligible and Λ with nΛ = 0 for n prime to p. There is a natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ).
Hypotheses: f, g spatial-eligible (so f ∘ g is, S0/spatial-eligible-morphism).; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/lower-shriek-etale-agreement-qc — Agreement with the étale left adjoint (quasicompact case)
Target: Let f : Y′ → Y be a quasicompact separated étale map of small v-stacks and Λ with nΛ = 0 for n prime to p. Then C5's f_! (the left adjoint of f^*, ECD Definition 19.1) agrees with Rf_! of S1/lower-shriek-quasicompact, via a natural transformation f_!^ét → Rf_!.
Hypotheses: f quasicompact, separated, étale (so spatial-eligible with dim.trg 0, S0).; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_eq_etaleLowerShriek [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/projection-formula-qc — Projection formula (spatial-eligible case)
Target: Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p. There is an isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A), functorial in B ∈ D_ét(Y′, Λ) (on the source) and A ∈ D_ét(Y, Λ) (on the base). The extension to small v-stacks is part of S2/projection-formula.
Hypotheses: f spatial-eligible between small v-sheaves (as printed).; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_projection [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S1/lower-shriek-direct-sums-qc — Rf_! commutes with direct sums (spatial-eligible case)
Target: Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p. For every family (Aᵢ)_{i∈I} in D_ét(Y′, Λ), the natural map ⊕ᵢ Rf_!Aᵢ → Rf_!(⊕ᵢ Aᵢ) is an isomorphism.
Hypotheses: f spatial-eligible between small v-sheaves.; Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
Required actual input: Actual diamond D_et enhancement, canonical C4 factorization and C5 extension by zero; the canonical compact-Hausdorff functor over pi_0(X), actual bounded-below topological sheaves, canonical qcqs inverse-system maps/cocone; C8 diamond dimension comparisons.
declaration lowerShriekQC_preservesCoproducts [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/proper-support-subcategory — Sheaves with proper support over the base
Target: Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds (S0/eligible-morphism), with canonical factorisation j : Y′ → (Y′)‾^{/Y} and partially proper f‾. D_ét,prop/Y(Y′, Λ) is the full ∞-subcategory of D_ét(Y′, Λ) of objects A with A ≃ j_{V!}j_V^*A for some open subspace j_V : V → Y′ that is quasicompact over Y (V → Y quasicompact). For such A and V, j_!A is supported on the closure of V in (Y′)‾^{/Y}, which is proper over Y. The subcategory is stable under pullback along maps of quasiseparated locally spatial diamonds over Y.
Hypotheses: Y, Y′ quasiseparated locally spatial diamonds; f eligible.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration properSupportSubcategory [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap mem_properSupportSubcategory_iff [OMITTED]: A lies in D_ét,prop/Y(Y′, Λ) iff A ≃ j_{V!}j_V^*A for an open V ⊂ Y′ quasicompact over Y.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap properSupportSubcategory.extendByZero_mem [OMITTED]: For V ⊂ Y′ open and quasicompact over Y and B ∈ D_ét(V, Λ), j_{V!}B lies in the subcategory.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap properSupportSubcategory.colimit_eq [OMITTED]: Every A ∈ D_ét(Y′, Λ) is the filtered colimit of j_{V!}j_V^*A over the opens V quasicompact over Y.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap properSupportSubcategory.pullback_mem [OMITTED]: Pullback along a map Ỹ → Y of quasiseparated locally spatial diamonds carries D_ét,prop/Y(Y′, Λ) into D_ét,prop/Ỹ(Ỹ′, Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap properSupportSubcategory.of_isQuasicompact [OMITTED]: If f is quasicompact (spatial-eligible), the subcategory is all of D_ét(Y′, Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test properSupportSubcategory_of_qc [OMITTED]: If Y′ → Y is quasicompact, every object of D_ét(Y′, Λ) has proper support (take V = Y′).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test properSupportSubcategory_disc [OMITTED]: For the open unit disc D → Spa(C, O_C) and the closed subdisc V of radius |ϖ|, j_{V!}Λ ∈ D_ét,prop(D, Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_mem_properSupportSubcategory_const [OMITTED]: Assume Λ ≠ 0. The constant sheaf Λ on the open unit disc D over Spa(C, O_C) does not have proper support: Λ ≃ j_{V!}j_V^*Λ fails for every quasicompact V ⊊ D, since its stalks off V are nonzero.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-locally-spatial — Rf_! over a quasiseparated locally spatial base, by left Kan extension
Target: Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds and Λ with nΛ = 0, n prime to p. Define Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) as the left Kan extension (EnhancedDerivedSheaves E3, HTT 4.3.2.14, along the full inclusion) of the functor Rf‾_* ∘ j_! : D_ét,prop/Y(Y′, Λ) → D_ét(Y, Λ) (S2/proper-support-subcategory). It is a functor of stable ∞-categories; the left Kan extension is not replaced by a choice of representatives of complexes. On D_ét,prop/Y it is Rf‾_*j_!, and for A_V = j_{V!}j_V^*A one has Rf_!A_V = R(f|_V)_!(j_V^*A) where the terms are computed by S1/lower-shriek-quasicompact after restricting Y to spatial quasicompact opens W: V ×_Y W is quasicompact and the eligible restriction over W has a finite global dimension bound. Relative quasicompactness of V → Y alone does not make f|_V spatial-eligible when Y is not quasicompact. Its left Kan universal property is the equivalence of spaces of natural transformations Nat(Rf_!, H) ≃ Nat(Rf‾_*j_!, H|_{D_ét,prop/Y}) for every functor H on D_ét(Y′, Λ); this specifies the extension and comparison up to contractible choice, not just some extension with the correct objects.
Hypotheses: f eligible between quasiseparated locally spatial diamonds.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekLocSpatial [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_restrict [OMITTED]: On D_ét,prop/Y(Y′, Λ), Rf_! ≅ Rf‾_* ∘ j_! (the unit of the left Kan extension is an equivalence along a full inclusion).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_colim [OMITTED]: Rf_!A ≅ colim_V R(f|_V)_!(j_V^*A) over opens V quasicompact over Y (S2/filtered-support-formula).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_eq_qc [OMITTED]: If f is spatial-eligible, Rf_! agrees with S1/lower-shriek-quasicompact. For a relatively quasicompact eligible f over a non-quasicompact base, this comparison is made after restriction to spatial quasicompact opens of the base; quasicompactness alone supplies no uniform global dim.trg bound.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_preservesColimits [OMITTED]: Rf_! preserves all colimits (S2/lower-shriek-colimits-locally-spatial).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_baseChange [OMITTED]: g^*Rf_! ≃ Rf̃_!g′^* for g : Ỹ → Y a map of quasiseparated locally spatial diamonds (S2/lower-shriek-base-change-locally-spatial).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekLocSpatial_isLeftKanExtension [OMITTED]: Rf_! with the identification on D_ét,prop/Y is a left Kan extension: natural transformations Rf_! → G correspond to transformations Rf‾_*j_! → G|_{D_prop}.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekLocSpatial_qc [OMITTED]: If f is spatial-eligible, the construction agrees with S1/lower-shriek-quasicompact. For a relatively quasicompact eligible f over a non-quasicompact base, the S1 comparison holds on each spatial quasicompact base open.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekLocSpatial_openDisc [OMITTED]: For the open unit disc f : D → Spa(C, O_C), R²f_!Λ(1) ≅ Λ and R^i f_!Λ = 0 for i ≠ 2 (colimit of the closed subdiscs, with isomorphic transition maps).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriekLocSpatial_ne_pushforward [OMITTED]: Assume Λ ≠ 0. For the open unit disc, Rf_*Λ = Λ in degree 0 (D is cohomologically a point, H4) while Rf_!Λ = Λ(−1)[−2]; the left Kan extension is not Rf‾_* applied to j_! of all objects.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/filtered-support-formula — The filtered-support formula for Rf_!
Target: For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and A ∈ D_ét(Y′, Λ), the natural map colim_V R(f|_V)_!(j_V^*A) → Rf_!A, over the filtered poset of opens V ⊂ Y′ quasicompact over Y, is an equivalence, and R(f|_V)_!(j_V^*A) = Rf‾_*j_!(j_{V!}j_V^*A). The terms use S2/lower-shriek-locally-spatial and are identified with S1 locally on spatial quasicompact opens of Y; f|_V need not have a uniform global dim.trg bound.
Hypotheses: f eligible between quasiseparated locally spatial diamonds.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekLocSpatial_colim [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-colimits-locally-spatial — Rf_! preserves colimits over a locally spatial base
Target: For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and Λ with nΛ = 0 (n prime to p), Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) commutes with all direct sums, equivalently (HA 1.4.4.1(2), E3) with all colimits.
Hypotheses: As in S2/lower-shriek-locally-spatial.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekLocSpatial_preservesColimits [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-base-change-locally-spatial — Base change for Rf_! over locally spatial bases
Target: Let f : Y′ → Y be eligible between quasiseparated locally spatial diamonds, Λ with nΛ = 0 (n prime to p), and g : Ỹ → Y a map of quasiseparated locally spatial diamonds with pullbacks f̃, g′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^*. The base Ỹ must be quasiseparated, as the construction of Rf̃_! requires (correction PAPER-SCHOLZE-17/E99 of the printed 'any map of locally spatial diamonds').
Hypotheses: g a map of quasiseparated locally spatial diamonds (corrected hypothesis).; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekLocSpatial_baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/hypercover-support-diagram — The coherent support diagram over a simplicial v-hypercover
Target: Let f : Y′ → Y be an eligible map of small v-stacks, Y• → Y a simplicial v-hypercover with every Yᵢ a quasiseparated locally spatial diamond (EnhancedDerivedSheaves E2), Y′• = Y′ ×_Y Y•, and Λ with nΛ = 0 (n prime to p). Construct: (1) the coCartesian fibrations over Δ classified by i ↦ D_ét(Y′ᵢ, Λ), i ↦ D_ét((Y′ᵢ)‾^{/Yᵢ}, Λ) and i ↦ D_ét(Yᵢ, Λ) with pullback functors (E0, E3; Liu–Zheng's diagrams of ringed topoi, the étale condition passing to full subcategories); (2) the full sub-fibration D_ét,prop/Y•(Y′•, Λ)⁰ with fibres D_ét,prop/Yᵢ(Y′ᵢ, Λ), again coCartesian because pullback preserves proper support (S2/proper-support-subcategory); (3) the fully faithful left adjoint j•! of j•^*, fibrewise jᵢ!, and the right adjoint Rf‾•_* of f‾•^*, fibrewise Rf‾ᵢ_*; (4) Rf•!⁰ : D_ét(Y′•, Λ)⁰ → D_ét(Y•, Λ)⁰, the left Kan extension of Rf‾•_* j•! along D_ét,prop/Y•(Y′•, Λ)⁰ ⊂ D_ét(Y′•, Λ)⁰ (HTT 4.3.2.14). All four are functors over Δ of ∞-categories, not of homotopy categories.
Hypotheses: Y• → Y a simplicial v-hypercover by quasiseparated locally spatial diamonds; f eligible (so each fᵢ is eligible, S0). The hypercover includes an augmentation, face and degeneracy maps satisfying the simplicial identities, with each augmented matching map Y_i → (cosk_{i−1}Y•)_i a v-cover. The support sub-fibration has its displayed proper-support fibres and the pullback coCartesian edges, not merely a predicate on unrelated objects.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration hypercoverSupportDiagram [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration lowerShriekHypercover [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap hypercoverSupportDiagram.fibre [OMITTED]: The fibre of D_ét,prop/Y•(Y′•, Λ)⁰ over [i] is D_ét,prop/Yᵢ(Y′ᵢ, Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap hypercoverSupportDiagram.isCocartesian [OMITTED]: D_ét,prop/Y•(Y′•, Λ)⁰ → Δ is a coCartesian fibration and its inclusion into D_ét(Y′•, Λ)⁰ preserves coCartesian edges.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap hypercoverSupportDiagram.extendByZero_fibre [OMITTED]: j•! is fibrewise jᵢ! and is fully faithful and left adjoint to j•^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap hypercoverSupportDiagram.pushforward_fibre [OMITTED]: Rf‾•_* is fibrewise Rf‾ᵢ_*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekHypercover_fibre [OMITTED]: Over [i], Rf•!⁰ is Rfᵢ! of S2/lower-shriek-locally-spatial (S2/fibrewise-lower-shriek).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekHypercover_cocartesian [OMITTED]: Rf•!⁰ preserves coCartesian edges (S2/cocartesian-preservation).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap hypercoverSupportDiagram.refine [OMITTED]: A map of hypercovers Ỹ• → Y• over Y induces a map of diagrams, compatible with Rf•!⁰ (S2/hypercover-independence).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test hypercoverSupportDiagram_constant [OMITTED]: For the constant hypercover of a quasiseparated locally spatial Y, the ambient coefficient diagram is constant with fibre D_ét(Y′, Λ), its support subdiagram has fibre D_ét,prop/Y(Y′, Λ), and Rf•!⁰ is S2/lower-shriek-locally-spatial. The two fibres coincide if f is quasicompact.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test hypercoverSupportDiagram_qc [OMITTED]: If f is quasicompact, every fibre of the support sub-fibration is the whole fibre, and Rf•!⁰ is fibrewise Rf‾ᵢ_*jᵢ!.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test hypercoverSupportDiagram_homotopy_category_insufficient [OMITTED]: Choosing objects fibrewise in homotopy categories does not define a functor to coCartesian sections: the diagram i ↦ Ho D_ét(Yᵢ, Λ) does not determine D_ét(Y, Λ) (descent fails for homotopy categories), so the construction must be made in Cat_∞.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/fibrewise-lower-shriek — The fibres of the hypercover construction
Target: In the situation of S2/hypercover-support-diagram, the functor Rf•!⁰ is given in the fibre over [i] ∈ Δ by Rfᵢ! : D_ét(Y′ᵢ, Λ) → D_ét(Yᵢ, Λ) of S2/lower-shriek-locally-spatial.
Hypotheses: As in S2/hypercover-support-diagram.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekHypercover_fibre [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/cocartesian-preservation — Rf•!⁰ preserves coCartesian edges
Target: The functor Rf•!⁰ : D_ét(Y′•, Λ)⁰ → D_ét(Y•, Λ)⁰ of S2/hypercover-support-diagram sends coCartesian edges to coCartesian edges; hence it restricts to coCartesian sections, D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ).
Hypotheses: As in S2/hypercover-support-diagram.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriekHypercover_cocartesian [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek — The exceptional direct image Rf_! for eligible maps of small v-stacks
Target: Let f : Y′ → Y be an eligible map of small v-stacks (compactifiable, representable in locally spatial diamonds, locally dim.trg f < ∞) and Λ with nΛ = 0, n prime to p. Choose a simplicial v-hypercover Y• → Y by quasiseparated locally spatial diamonds and define Rf_! as the composite D_ét(Y′, Λ) ≃ D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ) ≃ D_ét(Y, Λ) of hyperdescent (C2, ECD 17.3) and the restriction of Rf•!⁰ to coCartesian sections (S2/cocartesian-preservation); ECD's Rf_! is its homotopy-category functor. It is independent of the hypercover (S2/hypercover-independence) and agrees with S2/lower-shriek-locally-spatial when Y is a quasiseparated locally spatial diamond and with S1/lower-shriek-quasicompact when f is spatial-eligible. The domain is the eligible class; for maps of Artin v-stacks that are not representable in locally spatial diamonds, the operations are VStackSheavesAndLisseCategories VS0's, not this construction.
Hypotheses: f eligible between small v-stacks.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_eq_locSpatial [OMITTED]: If Y is a quasiseparated locally spatial diamond, Rf_! ≅ S2/lower-shriek-locally-spatial.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_eq_qc [OMITTED]: If f is spatial-eligible, Rf_! ≅ Rf‾_* ∘ j_! (S1/lower-shriek-quasicompact).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_hypercover_indep [OMITTED]: Rf_! does not depend on the hypercover, up to a coherent equivalence (S2/hypercover-independence).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_baseChange [OMITTED]: g^*Rf_! ≃ Rf̃_!g′^* for every map g of small v-stacks (S2/lower-shriek-base-change).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_preservesColimits [OMITTED]: Rf_! preserves all colimits (S2/lower-shriek-colimits).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_comp [OMITTED]: R(f ∘ g)_! ≃ Rf_! ∘ Rg_! (S2/lower-shriek-composition).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_id [OMITTED]: R(id)_! ≃ id, compatibly with the composition equivalence.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_etale [OMITTED]: For f separated étale, Rf_! ≅ C5's f_! (S2/lower-shriek-etale-agreement).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriek_projection [OMITTED]: Rf_!B ⊗^L A ≃ Rf_!(B ⊗^L f^*A) (S2/projection-formula).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriek_id_test [OMITTED]: R(id_Y)_! ≅ id for every small v-stack Y.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriek_open_immersion [OMITTED]: For an open immersion j : U → Y of small v-stacks, Rj_! is C5's extension by zero j_!.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriek_classifying_not_eligible [OMITTED]: For a nontrivial profinite group K acting trivially, the map [*/K] → * is not representable in locally spatial diamonds (its fibre over a point is not a diamond), so R(−)_! of this section does not apply; such stacky maps are VS0's.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test lowerShriek_ball_point [OMITTED]: For f : B → *, Rf_!Λ ≅ Λ(−1)[−2] (S5/ball-smooth with Rf_!Rf^!Λ → Λ an isomorphism here).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/hypercover-independence — Independence of the hypercover
Target: The functor Rf_! of S2/lower-shriek does not depend on the choice of the hypercover: for two simplicial v-hypercovers Y• → Y and Ỹ• → Y by quasiseparated locally spatial diamonds there is a natural equivalence between the two functors, obtained through a common refinement, and these equivalences are compatible with further refinement (form a coherent system).
Hypotheses: Y• and Ỹ• hypercovers as in S2/lower-shriek.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_hypercover_indep [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-base-change — Base change for Rf_! (general)
Target: Let f : Y′ → Y be an eligible map of small v-stacks, Λ with nΛ = 0 (n prime to p), and g : Ỹ → Y any map of small v-stacks with pullbacks f̃ : Ỹ′ → Ỹ, g′ : Ỹ′ → Y′. There is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), constructed at the enhanced level.
Hypotheses: f eligible; g arbitrary map of small v-stacks.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-colimits — Rf_! preserves colimits (general)
Target: For f : Y′ → Y eligible between small v-stacks and Λ with nΛ = 0 (n prime to p), Rf_! commutes with all direct sums, equivalently with all colimits.
Hypotheses: As in S2/lower-shriek.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_preservesColimits [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-composition — Composition of Rf_! (general)
Target: Let g : Y″ → Y′ and f : Y′ → Y be eligible maps of small v-stacks and Λ with nΛ = 0 (n prime to p). There is a natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ), coherent with identities and associative for triple composites.
Hypotheses: f, g eligible (so f ∘ g is, S0/eligible-morphism).
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/lower-shriek-etale-agreement — Agreement with the étale left adjoint (general)
Target: For f : Y′ → Y a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), C5's f_! (left adjoint of f^*, ECD 19.1) agrees with Rf_! of S2/lower-shriek.
Hypotheses: f separated étale (eligible by S0/eligible-morphism).
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_eq_etaleLowerShriek [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/projection-formula — Projection formula (general)
Target: Let f : Y′ → Y be an eligible map of small v-stacks and Λ with nΛ = 0 (n prime to p). There is a functorial isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A) for B ∈ D_ét(Y′, Λ) and A ∈ D_ét(Y, Λ), compatible as A varies. ECD prints the statement for small v-sheaves; the extension to small v-stacks is the same argument through a hypercover by quasiseparated locally spatial diamonds and hyperdescent (C2, ECD 17.3), recorded here.
Hypotheses: f eligible between small v-stacks (the v-sheaf restriction of the printed statement is removed by hyperdescent).; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_projection [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S2/exchange-pasting-coherence — Coherence of the exchange equivalences
Target: The base-change equivalences of S2/lower-shriek-base-change, the composition equivalences of S2/lower-shriek-composition and the projection-formula isomorphisms of S2/projection-formula satisfy the pasting identities: (a) base change along a composite Ỹ₂ → Ỹ₁ → Y is the vertical pasting of the two base changes; (b) for composable eligible f, g and any base change, the base change of R(f ∘ g)_! ≃ Rf_!Rg_! is the horizontal pasting of the base changes of Rf_! and Rg_!; (c) the composition equivalences are associative and unital; (d) base change for identities and for an identity base map is the identity. These hold at the enhanced level and are part of the public interface.
Hypotheses: Eligible maps of small v-stacks; Λ with nΛ = 0, n prime to p.
Required actual input: Actual augmented simplicial v-hypercover with matching covers, proper-support fibres, pullback coCartesian edges and relative adjoints; actual stable infinity categories, relative left Kan universal properties, the specified base-change/projection/composition transformations and equalities of their pastings.
declaration lowerShriek_baseChange_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration lowerShriek_comp_assoc [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek — The exceptional inverse image Rf^!
Target: Let f : Y′ → Y be an eligible map of small v-stacks (S0/eligible-morphism) and Λ with nΛ = 0, n prime to p. Rf^! : D_ét(Y, Λ) → D_ét(Y′, Λ) is the right adjoint of Rf_! (S2/lower-shriek), constructed at the level of presentable stable ∞-categories by the adjoint functor theorem (EnhancedDerivedSheaves E3, HTT 5.5.2.9), which applies because Rf_! preserves all colimits (S2/lower-shriek-colimits) and both categories are presentable (C2). It is exact; it is a right adjoint, so it preserves all limits; the adjunction Rf_! ⊣ Rf^! is part of the data. Rf^! is defined only for eligible f: every statement using it carries the eligibility hypotheses of the map whose Rf^! appears.
Hypotheses: f eligible between small v-stacks.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration lowerShriekUpperShriekAdj [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap lowerShriekUpperShriekAdj [OMITTED]: Rf_! ⊣ Rf^!: Hom(Rf_!A, B) ≅ Hom(A, Rf^!B) naturally in A ∈ D_ét(Y′, Λ), B ∈ D_ét(Y, Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_preservesLimits [OMITTED]: Rf^! preserves all limits and is exact.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_id [OMITTED]: R(id)^! ≃ id.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_comp [OMITTED]: R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, compatible with the composition of Rf_! (S3/upper-shriek-composition).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_etale [OMITTED]: For f separated étale, Rf^! ≃ f^* (S3/upper-shriek-etale).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_restrictScalars [SPECIALIZATION]: Rf^! commutes with restriction of scalars along Λ′ → Λ (S3/upper-shriek-change-of-rings).
Form: Right-adjoint mate along an actual ring map and ModuleCat extension/restriction functors. The specified left-adjoint scalar comparison is required.
ap upperShriek_internalHom [OMITTED]: Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B) (S3/upper-shriek-internal-hom).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_pushforward [OMITTED]: For a cartesian square with eligible horizontal g, Rg^!Rf_* ≅ Rf′_*Rg̃^! (S3/upper-shriek-pushforward-exchange).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap dualizingObject [OMITTED]: D_f := Rf^!Λ ∈ D_ét(Y′, Λ), the dualizing complex; it is invertible when f is ℓ-cohomologically smooth (S4/dualizing-complex).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test upperShriek_id_test [OMITTED]: R(id_Y)^! ≃ id.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test upperShriek_openImmersion [OMITTED]: For an open immersion j : U → Y of small v-stacks, Rj^! ≃ j^* (right adjoint of j_!).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test upperShriek_ne_pullback_profinite [OMITTED]: Assume Λ ≠ 0. For q : S × Spa(C, O_C) → Spa(C, O_C) with S an infinite profinite set, Rq^!Λ is the sheaf of Λ-valued distributions T ↦ Hom(C⁰(T, Λ), Λ) and is not q^*Λ (S5/profinite-quotient-upper-shriek).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test upperShriek_ball [OMITTED]: For the ball f : B → *, Rf^!Λ ≅ Λ(1)[2] canonically (S5/ball-smooth).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek-change-of-rings — Rf^! commutes with restriction of scalars
Target: Let f be eligible and g : Λ′ → Λ a map of rings killed by integers prime to p. With res_g : D_ét(−, Λ) → D_ét(−, Λ′) restriction of scalars along g, there is a natural equivalence res_g ∘ Rf^! ≃ Rf^! ∘ res_g of functors D_ét(Y, Λ) → D_ét(Y′, Λ′).
Hypotheses: f eligible; Λ′ → Λ a ring map with both rings killed by integers prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek_restrictScalars [SPECIALIZATION]: Right-adjoint mate along an actual ring map and ModuleCat extension/restriction functors. The specified left-adjoint scalar comparison is required.
-/

/-
DiamondSixOperations:S3/verdier-duality-lower-shriek — Verdier duality for Rf_!
Target: Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A ∈ D_ét(Y′, Λ) and B ∈ D_ét(Y, Λ) there is a natural isomorphism RHom_Λ(Rf_!A, B) ≅ Rf_*RHom_Λ(A, Rf^!B), RHom being C3's internal Hom on D_ét.
Hypotheses: f eligible.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration verdierDuality [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek-internal-hom — Rf^! of an internal Hom
Target: Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A, B ∈ D_ét(Y, Λ) there is a natural isomorphism Rf^!RHom_Λ(A, B) ≅ RHom_Λ(f^*A, Rf^!B).
Hypotheses: f eligible.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek_internalHom [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek-composition — Identity and composition laws for Rf^!
Target: For eligible g : Y″ → Y′ and f : Y′ → Y (Λ with nΛ = 0, n prime to p) there are natural equivalences R(id)^! ≃ id and R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, the mates of R(id)_! ≃ id and of Rf_! ∘ Rg_! ≃ R(f ∘ g)_! (S2/lower-shriek-composition) under the adjunctions of S3/upper-shriek; they are associative and unital, and compatible with the composition of Rf_! through the units and counits.
Hypotheses: f, g eligible.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek_comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek-etale — Rf^! = f^* for separated étale maps
Target: If f : Y′ → Y is a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), then Rf^! ≃ f^* canonically, compatibly with composition.
Hypotheses: f separated étale.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek_etale [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/upper-shriek-pushforward-exchange — The formal exceptional base change Rg^!Rf_* ≃ Rf′_*Rg̃^!
Target: Let Y′ →g̃ Y, X′ →g X, f : Y → X, f′ : Y′ → X′ be a cartesian square of small v-stacks with g eligible (compactifiable, representable in locally spatial diamonds, locally dim.trg g < ∞), and Λ with nΛ = 0 (n prime to p). Then g̃ is eligible (S0/eligible-morphism, base change) and for A ∈ D_ét(Y, Λ) there is a natural isomorphism Rg^!Rf_*A ≅ Rf′_*Rg̃^!A. No eligibility hypothesis on f is needed. This is ECD 23.16(i); it is proved here, before cohomological smoothness, because the proof of ECD 23.4 uses it.
Hypotheses: g eligible; f an arbitrary map of small v-stacks.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration upperShriek_pushforward_exchange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S3/adjunction-calculus — Units, traces, the twisted-pullback transformation and mates
Target: For an eligible f : Y′ → Y and Λ with nΛ = 0 (n prime to p), construct at the enhanced level: (1) the unit A → Rf^!Rf_!A and the counit (trace) tr_f : Rf_!Rf^!B → B of Rf_! ⊣ Rf^!; (2) the twisted-pullback transformation τ_f : Rf^!Λ ⊗^L_Λ f^*(−) → Rf^!(−), adjoint to Rf_!(Rf^!Λ ⊗ f^*B) ≃ Rf_!Rf^!Λ ⊗ B →(tr ⊗ id) B (projection formula S2/projection-formula); (3) evaluation RHom(A, B) ⊗ A → B and coevaluation for invertible objects, and the tensor–Hom adjunction on D_ét (C3); (4) for a cartesian square with f eligible and g arbitrary, the base-change transformation g̃^*Rf^! → Rf′^!g^* (when f is eligible) adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^* (S2/lower-shriek-base-change and tr_f), and the transformation Rf^!Λ ⊗ f^* → Rf^! restricted along open immersions used in ECD 23.4(iii)–(iv); (5) the mates of all exchange equivalences of S2. These are compatible with composition (traces compose: tr_{f∘g} = tr_f ∘ Rf_!(tr_g)Rf^!) and with base change, and they are tested on finite étale maps and open immersions before any smoothness statement uses them.
Hypotheses: f is eligible. In the cartesian square defining (4), the base-change leg g is arbitrary; f′ is the eligible pullback of f.; Λ a commutative ring with nΛ = 0 for some integer n prime to p.
Required actual input: Actual enhanced etale categories and the constructed exceptional adjunction; two coefficient rings, actual ring map and derived scalar functors; tensor/internal-Hom with their unit, specified counit/twisted transformations and commuting diagrams.
declaration shriekTrace [SPECIALIZATION]: Actual counit of a specified ordinary categorical adjunction.
declaration twistedPullbackTransformation [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration upperShriekBaseChangeTransformation [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap shriekTrace [SPECIALIZATION]: tr_f : Rf_!Rf^!B → B, the counit of Rf_! ⊣ Rf^!.
Form: Actual counit of a specified ordinary categorical adjunction.
ap twistedPullbackTransformation [OMITTED]: τ_f : Rf^!Λ ⊗^L f^*B → Rf^!B, adjoint to (tr_f ⊗ id) ∘ (projection formula).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriekBaseChangeTransformation [OMITTED]: For a cartesian square with f eligible and g an arbitrary map of small v-stacks, g̃^*Rf^! → Rf′^!g^*, adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap shriekTrace_comp [SPECIALIZATION]: tr_{f∘g} = tr_f ∘ Rf_!(tr_g)(Rf^!) under the composition equivalences.
Form: The actual counit of the composite specified adjunction, with its equality of components.
ap twistedPullbackTransformation_openImmersion [OMITTED]: For f an open immersion, τ_f is the identity of j^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap twistedPullbackTransformation_etale [OMITTED]: For f separated étale, τ_f is the identity of f^* under Rf^! ≃ f^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap shriekTrace_finiteEtale [SPECIALIZATION]: For f finite étale, tr_f : f_*f^* → id is the classical trace map (summation over fibres).
Form: Algebraic sum on an actual finite fibre, before normalization.
ap twistedPullbackTransformation_baseChange [OMITTED]: τ is compatible with base change along any map of small v-stacks through upperShriekBaseChangeTransformation.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test twistedPullback_id [OMITTED]: For f the identity, τ_f is the identity and tr_f is the identity.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test shriekTrace_openImmersion [OMITTED]: For an open immersion j, tr_j : j_!j^*B → B is the counit of j_! ⊣ j^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test shriekTrace_finiteEtale_degree [SPECIALIZATION]: For f : Y′ → Y finite étale of constant degree d, tr_f ∘ unit : Λ → f_*f^*Λ → Λ is multiplication by d.
Form: Actual finite sum of diagonal elements equals cardinal times the element.
test twistedPullback_not_iso_profinite [OMITTED]: Assume Λ ≠ 0 and take T infinite (for example T = S). For q : S × Spa(C, O_C) → Spa(C, O_C), S an infinite profinite set, τ_q is not an equivalence: on global sections over an open and closed T ⊂ S, Rq^!M is RHom(C⁰(T, Λ), M) while Rq^!Λ ⊗ q^*M is RHom(C⁰(T, Λ), Λ) ⊗ M, and these differ for M = ⊕_ℕ Λ because C⁰(T, Λ) is free of infinite rank; Rq^! does not commute with direct sums, matching criterion (iii) of S4/strictly-local-criteria.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/strictly-local-criteria — Criteria for Rf^! to be a twisted pullback over a strictly totally disconnected base
Target: Let X be a strictly totally disconnected perfectoid space, f : Y → X a compactifiable map from a locally spatial diamond Y with locally dim.trg f < ∞ (so f is eligible), and ℓ ≠ p a prime. The following are equivalent: (i) the twisted-pullback transformation τ_f : Rf^!F_ℓ ⊗_{F_ℓ} f^* → Rf^! of functors D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) (S3/adjunction-calculus) is an equivalence; (ii) Rf^! is equivalent to A ⊗_{F_ℓ} f^* for some A ∈ D_ét(Y, F_ℓ); (iii) Rf^! commutes with arbitrary direct sums, and for every connected component X₀ = Spa(C, C⁺) of X and open j : U ⊂ X₀ with pullbacks f_U : V → U, f₀ : Y₀ → X₀, j′ : V → Y₀, the map j′_!Rf_U^!F_ℓ → Rf₀^!j_!F_ℓ adjoint to Rf₀!j′_!Rf_U^!F_ℓ = j_!Rf_U!Rf_U^!F_ℓ → j_!F_ℓ is an equivalence; (iv) for every affinoid pro-étale g : X′ → X with pullback h : Y′ → Y, f′ : Y′ → X′, the base-change transformation h^*Rf^! → Rf′^!g^* is an equivalence, and for X₀, U as in (iii) the transformation j′_!Rf_U^! → Rf₀^!j_! of functors D_ét(U, F_ℓ) → D_ét(Y₀, F_ℓ) is an equivalence.
Hypotheses: X strictly totally disconnected (D1); Y locally spatial; f compactifiable with locally dim.trg f < ∞; ℓ ≠ p.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration upperShriek_twist_tfae [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/strictly-local-criteria-torsion — The twisted-pullback criterion for ℓ-power-torsion coefficients
Target: Under the equivalent conditions of S4/strictly-local-criteria, for every ℓ-power-torsion ring Λ (ℓ^m Λ = 0 for some m) the transformation τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! of functors D_ét(X, Λ) → D_ét(Y, Λ) is an equivalence.
Hypotheses: As in S4/strictly-local-criteria; Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration upperShriek_twist_of_ellTorsion [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/profinite-projection-pushforward — Pushforward along a profinite projection
Target: Let S be a profinite set, Y a small v-sheaf, h : Y × S → Y the projection, and Λ a ring with nΛ = 0 for some n prime to p. For C ∈ D_ét(Y, Λ) there is a natural isomorphism Rh_*h^*C ≃ C⁰(S, Λ) ⊗_Λ C, with C⁰(S, Λ) the Λ-module of continuous (locally constant) maps S → Λ. ECD states this for any ring Λ, but the printed proof passes through Rh_! and the projection formula, which need nΛ = 0 with n prime to p; the statement is restricted accordingly (PAPER-SCHOLZE-17/E69), which covers its only use (Λ = F_ℓ in S4/strictly-local-criteria).
Hypotheses: S profinite; Y a small v-sheaf; nΛ = 0, n prime to p (corrected hypothesis).
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration profiniteProjection_pushforward_pullback [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/direct-sum-criterion — Rf^! commutes with sums iff Rf_! preserves constructibility
Target: Let X be strictly totally disconnected, f : Y → X a compactifiable map from a spatial diamond Y with dim.trg f < ∞, and ℓ ≠ p. Then Rf^! : D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) commutes with arbitrary direct sums if and only if for every constructible sheaf F of F_ℓ-vector spaces on Y_ét and every i ≥ 0, R^i f_!F is constructible on X_ét.
Hypotheses: X strictly totally disconnected; Y spatial; f compactifiable with dim.trg f < ∞ (spatial-eligible); ℓ ≠ p.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration upperShriek_preservesCoproducts_iff [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/invertible-object — Invertible objects of D_ét
Target: For a locally spatial diamond Y and a ring Λ (in the applications F_ℓ or an ℓ-power-torsion ring), an object D ∈ D_ét(Y, Λ) is invertible if it is locally isomorphic to Λ[n] for some integer n, where locally may be taken equivalently in the v-, the quasi-pro-étale or the étale topology of Y. For Λ ≠ 0, the shift index n is uniquely determined and locally constant on |Y|; its cohomological degree is −n. For the zero ring every shift is zero, so invertibility is meaningful but a unique degree is not. Invertible objects are ⊗-invertible (D ⊗ RHom(D, Λ) ≃ Λ); the converse is not part of the definition.
Hypotheses: Y a locally spatial diamond; the three topologies give the same notion (ECD's 'equivalently').
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsInvertibleObject [SPECIALIZATION]: Discrete families in the actual derived category of modules, each locally a shifted unit. No equivalence with geometric D_et is assumed.
ap IsInvertibleObject.shift [SPECIALIZATION]: If D is invertible then D[m] is invertible for every m ∈ ℤ.
Form: Shift of a discrete derived-module family.
ap IsInvertibleObject.const [SPECIALIZATION]: Λ[n] is invertible.
Form: The specified module unit in a specified shift.
ap IsInvertibleObject.tensor [OMITTED]: Tensor products of invertible objects are invertible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsInvertibleObject.pullback [OMITTED]: Pullback along any map of locally spatial diamonds preserves invertibility.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap isInvertibleObject_iff_etale_local [OMITTED]: D is invertible iff étale locally ≃ Λ[n] iff quasi-pro-étale locally ≃ Λ[n] iff v-locally ≃ Λ[n].
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsInvertibleObject.tensor_dual [OMITTED]: For invertible D, the evaluation D ⊗ RHom(D, Λ) → Λ is an isomorphism and RHom(D, Λ) is invertible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsInvertibleObject.degree [SPECIALIZATION]: Assuming Λ ≠ 0, degree(D) is the uniquely determined locally constant function |Y| → ℤ with value −n at y when D_y ≃ Λ[n]. Thus Λ[n] has cohomological degree −n. Distinct connected components can have different degrees; no global shift index is required.
Form: A genuine LocallyConstant map on a discrete component space, with Nontrivial coefficients and cohomological sign −n; degree_spec states the relation.
ap IsInvertibleObject.of_reduction [SPECIALIZATION]: For Λ = ℤ/ℓ^m with m ≥ 1: if D ⊗^L_{ℤ/ℓ^m} F_ℓ is invertible then D is invertible over ℤ/ℓ^m (ECD proof of 23.12(i)). General ℓ-power-torsion coefficient rings are handled by extension of scalars from ℤ/ℓ^m; there is no assumed map Λ → F_ℓ for an arbitrary such ring.
Form: The degree-zero finite-free module case over the actual rings Z/ell^m and F_ell and their ring map. The full derived/local statement is omitted.
test IsInvertibleObject.const_zero [SPECIALIZATION]: Λ = Λ[0] is invertible, with degree 0. The stated degree is uniquely determined when Λ ≠ 0.
Form: Actual derived ring module, one discrete component.
test IsInvertibleObject.tate_twist [OMITTED]: On Spa(C, O_C), Λ(1)[2] is invertible of degree −2 (μ_n is constant after choosing roots of unity). The stated degree is uniquely determined when Λ ≠ 0.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isInvertibleObject_extensionByZero [OMITTED]: Assume Λ ≠ 0. For C⁺ ≠ O_C and j : Spa(C, O_C) → Spa(C, C⁺), j_!Λ is not invertible: its stalk at the closed point is 0.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isInvertibleObject_sum [SPECIALIZATION]: Assume Λ ≠ 0 and Y is nonempty. Λ ⊕ Λ is not invertible (rank 2 stalks).
Form: Actual degree-zero rank-two F_5 module is not a shifted rank-one module.
test IsInvertibleObject.disjoint_shifts [SPECIALIZATION]: For nonzero Λ and Y the disjoint union of two geometric points, the object restricting to Λ on one point and Λ[1] on the other is invertible. Its degree is 0 on the first component and −1 on the second; a single global shift is not required.
Form: Actual F_5 derived modules on Bool: shifts 0 and 1 are locally invertible with no single global shift.
-/

/-
DiamondSixOperations:S4/cohomologically-smooth — ℓ-cohomologically smooth morphisms
Target: Let f : Y′ → Y be a separated map of small v-stacks that is representable in locally spatial diamonds, and ℓ ≠ p a prime. Then f is ℓ-cohomologically smooth if f is compactifiable, locally dim.trg f < ∞, and for every strictly totally disconnected perfectoid space X with a map X → Y and pullback f_X : Y′ ×_Y X → X, the functor Rf_X^! : D_ét(X, F_ℓ) → D_ét(Y′ ×_Y X, F_ℓ) is equivalent to D_{f_X} ⊗_{F_ℓ} f_X^* for some invertible object D_{f_X} (S4/invertible-object). The equivalence must be natural in the coefficient object, because it is an equivalence of functors. It need not be the canonical twisted-pullback transformation or be chosen compatibly for different base changes; those are conclusions (S4/smooth-twisted-pullback, S4/smooth-upper-shriek-base-change). The printed 'D_{f_X} ⊗ f^*' should read f_X^* (PAPER-SCHOLZE-17/E64). The notion is defined only for separated maps representable in locally spatial diamonds; smoothness of stacky maps (e.g. [*/G] → *) is VStackSheavesAndLisseCategories VS0's.
Hypotheses: f separated and representable in locally spatial diamonds; ℓ ≠ p.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.isEligible [OMITTED]: An ℓ-cohomologically smooth map is eligible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.isSeparated [OMITTED]: An ℓ-cohomologically smooth map is separated.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.twist [OMITTED]: For f smooth, τ_f : Rf^!Λ ⊗ f^* → Rf^! is an equivalence for ℓ-power-torsion Λ, and Rf^!Λ is invertible (S4/smooth-twisted-pullback).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap isCohomologicallySmooth_iff [OMITTED]: For f compactifiable and representable in spatial diamonds: smooth iff dim.trg f_X < ∞ after every strictly totally disconnected base change X → Y, constructibility of R^i f_{X!} on constructibles, the open-immersion condition over geometric points, and invertibility of Rf_X^!F_ℓ (S4/practical-smoothness-criterion).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.baseChange [OMITTED]: Stable under base change along any map of small v-stacks (S4/smooth-stable-under-base-change).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.comp [OMITTED]: Stable under composition (S4/smooth-composition).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.of_baseChange [OMITTED]: v-local on the target, given locally dim.trg f < ∞ (S4/smooth-v-local-on-target).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.isUniversallyOpen [OMITTED]: Smooth maps are universally open (S4/smooth-universally-open).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap IsCohomologicallySmooth.of_separated_etale [OMITTED]: Separated étale maps are smooth with dualizing complex Λ (S4/etale-maps-smooth).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsCohomologicallySmooth.id [OMITTED]: The identity of a small v-stack is ℓ-cohomologically smooth with dualizing complex Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test IsCohomologicallySmooth.ball [OMITTED]: The ball B → * is ℓ-cohomologically smooth for every ℓ ≠ p, with Rf^!Λ ≅ Λ(1)[2] (S5/ball-smooth).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isCohomologicallySmooth_profinite [OMITTED]: Assume X is nonempty. For S an infinite profinite set and X strictly totally disconnected, S × X → X is not ℓ-cohomologically smooth: Rq^!F_ℓ is the sheaf of distributions, not invertible.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test not_isCohomologicallySmooth_origin [OMITTED]: The origin 0 : Spa(C, O_C) → B × Spa(C, O_C) of the perfectoid ball is a closed immersion (proper, hence compactifiable, with dim.trg 0) whose image is not open, so it is not ℓ-cohomologically smooth (S4/smooth-universally-open).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/practical-smoothness-criterion — A practical criterion for ℓ-cohomological smoothness
Target: Let f : Y′ → Y be a compactifiable map of small v-stacks representable in spatial diamonds and ℓ ≠ p. Then f is ℓ-cohomologically smooth iff: (i) for each strictly totally disconnected X → Y, dim.trg f_X < ∞; (ii) for every strictly totally disconnected X → Y and every constructible étale sheaf F of F_ℓ-vector spaces on Y′ ×_Y X, R^i f_{X!}F is constructible on X for all i ≥ 0; (iii) for every X = Spa(C, C⁺) → Y (C algebraically closed, C⁺ open bounded valuation subring) and quasicompact open j : U → X, with f_U, j′ the pullbacks, the map j′_!Rf_U^!F_ℓ → Rf_X^!j_!F_ℓ adjoint to Rf_X!j′_!Rf_U^!F_ℓ = j_!Rf_U!Rf_U^!F_ℓ → j_!F_ℓ is an equivalence; (iv) for every strictly totally disconnected X → Y, Rf_X^!F_ℓ ∈ D_ét(Y′ ×_Y X, F_ℓ) is invertible. Here (i) is local on the target. The printed uniform global bound in ECD 23.10 is too strong over arbitrary non-quasicompact Y (source issue E4); it agrees with the printed condition when Y is spatial. Apply the printed criterion to each spatial base change, and use the definition of smoothness to descend.
Hypotheses: f compactifiable and representable in spatial diamonds; ℓ ≠ p.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration isCohomologicallySmooth_iff_practical [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-universally-open — ℓ-cohomologically smooth maps are universally open
Target: Let f : Y′ → Y be a separated map of small v-stacks, representable in locally spatial diamonds and ℓ-cohomologically smooth for some ℓ ≠ p. Then f is universally open: for every X → Y the map |Y′ ×_Y X| → |X| is open.
Hypotheses: f separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.isUniversallyOpen [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/dualizing-complex — The dualizing complex of an ℓ-cohomologically smooth map
Target: For f : Y′ → Y separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ an ℓ-power-torsion ring, the dualizing complex is D_f := Rf^!Λ ∈ D_ét(Y′, Λ). It is invertible, étale locally isomorphic to Λ[n] with n locally constant, the canonical transformation τ_f : D_f ⊗_Λ f^* → Rf^! is an equivalence, and D_f commutes with every base change: g′^*D_f ≃ D_{f̃}. Its local degree is −2 dim at points where f is a smooth analytic map of relative dimension d in the sense of S5 (D = Λ(d)[2d]).
Hypotheses: f ℓ-cohomologically smooth; Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration dualizingComplex [SPECIALIZATION]: Specified right endofunctor on actual modules evaluated at the ring module. No geometric smoothness or invertibility inferred.
ap dualizingComplex_def [SPECIALIZATION]: D_f = Rf^!Λ.
Form: The displayed point-module definition.
ap dualizingComplex_isInvertible [OMITTED]: D_f is invertible (S4/invertible-object).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap upperShriek_eq_dualizing_tensor_pullback [OMITTED]: Rf^! ≃ D_f ⊗_Λ f^* via τ_f.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap dualizingComplex_baseChange [OMITTED]: g′^*D_f ≃ D_{f̃} for every cartesian square.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap dualizingComplex_comp [OMITTED]: D_{f∘g} ≃ D_g ⊗ g^*D_f for composable smooth maps (S4/smooth-composition).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap dualizingComplex_etale [OMITTED]: For f separated étale, D_f ≃ Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap dualizingComplex_restrictScalars [SPECIALIZATION]: For Λ → Λ′ of ℓ-power-torsion rings, D_f over Λ′ is D_f ⊗_Λ Λ′.
Form: Scalar mate evaluated at the actual coefficient module; the geometric tensor comparison is omitted.
test dualizingComplex_id [SPECIALIZATION]: D_{id} ≅ Λ.
Form: Actual identity endofunctor on modules.
test dualizingComplex_ball [OMITTED]: For the ball B → *, D_f ≅ Λ(1)[2] (S5/ball-smooth).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test dualizingComplex_finiteEtale [OMITTED]: For a finite étale f, D_f ≅ Λ and τ_f is the identification Rf^! = f^*.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test dualizingComplex_not_const_profinite [OMITTED]: Assume S is infinite, X is nonempty and Λ ≠ 0. For the profinite projection q : S × X → X (not smooth), Rq^!Λ is the sheaf of distributions on S, not étale-locally Λ[n].
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-twisted-pullback — Rf^! is a twisted pullback for smooth f
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion. Then τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! is an equivalence of functors D_ét(Y, Λ) → D_ét(Y′, Λ), and Rf^!Λ is invertible, étale locally ≃ Λ[n]. In particular the a priori unspecified equivalence of the definition is the canonical transformation τ_f, and the dualizing object is Rf^!Λ.
Hypotheses: f ℓ-cohomologically smooth; Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.upperShriek_twist [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-perfect-constructible — Quasicompact smooth Rf_! preserves perfect-constructible complexes
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds, ℓ-cohomologically smooth and quasicompact, and Λ ℓ-power torsion. For every perfect-constructible A ∈ D_ét(Y′, Λ), Rf_!A ∈ D_ét(Y, Λ) is perfect-constructible. No such statement is made for an arbitrary proper map.
Hypotheses: f quasicompact and ℓ-cohomologically smooth; Λ ℓ-power torsion; A perfect-constructible (C7).
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.lowerShriek_perfectConstructible [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-upper-shriek-base-change — Rf^! of a smooth map commutes with arbitrary base change
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, Λ ℓ-power torsion, and g : Ỹ → Y any map of small v-stacks (ECD writes v-sheaves), with pullbacks f̃, g′. Then the base-change transformation g′^*Rf^! → Rf̃^!g^* (S3/adjunction-calculus) is an equivalence; in particular g′^*D_f ≃ D_{f̃}.
Hypotheses: f ℓ-cohomologically smooth; g arbitrary; Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.upperShriek_baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-composition — Composites of ℓ-cohomologically smooth maps
Target: Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks, ℓ ≠ p. If f and g are representable in locally spatial diamonds and ℓ-cohomologically smooth, then f ∘ g is representable in locally spatial diamonds and ℓ-cohomologically smooth, with D_{f∘g} ≃ D_g ⊗ g^*D_f.
Hypotheses: f, g separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.comp [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-descent-along-smooth-surjection — Smoothness descends along smooth surjections
Target: Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks and ℓ ≠ p. If g and f ∘ g are representable in locally spatial diamonds and ℓ-cohomologically smooth, g is surjective, and f is representable in diamonds and compactifiable, then f is representable in locally spatial diamonds and ℓ-cohomologically smooth. The hypotheses that f is representable in diamonds and compactifiable and that g is surjective are part of the statement.
Hypotheses: g, f ∘ g representable in locally spatial diamonds and smooth; g surjective; f separated, representable in diamonds and compactifiable.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.of_comp_of_surjective [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/representability-descent — Descent of representability along universally open covers
Target: Let f : Y′ → Y be a separated 0-truncated map of small v-stacks representable in diamonds, and g : Y″ → Y′ a universally open (for example ℓ-cohomologically smooth), separated and surjective map of small v-stacks such that f ∘ g is representable in locally spatial diamonds. Then f is representable in locally spatial diamonds. Moreover, if g is in addition locally split (S0/locally-split-map), the hypothesis that f is compactifiable can be removed from S4/smooth-descent-along-smooth-surjection, by S0/compactifiable-source-descent; without local splitting this is not known, and ℓ-cohomological smoothness of g alone is not used as evidence for it.
Hypotheses: f separated, 0-truncated, representable in diamonds; g universally open, separated, surjective; f ∘ g representable in locally spatial diamonds.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration representableInLocallySpatial_of_universallyOpen_cover [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration IsCohomologicallySmooth.of_comp_of_isLocallySplit [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-stable-under-base-change — ℓ-cohomological smoothness is stable under base change
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and g : Ỹ → Y any map of small v-stacks with pullback f̃. Then f̃ is ℓ-cohomologically smooth.
Hypotheses: f smooth; g arbitrary.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-v-local-on-target — ℓ-cohomological smoothness is v-local on the target, with dim.trg finiteness retained
Target: Let f : Y′ → Y be separated and representable in locally spatial diamonds, g : Ỹ → Y a surjective map of small v-stacks with pullback f̃. If f̃ is ℓ-cohomologically smooth and locally dim.trg f < ∞, then f is ℓ-cohomologically smooth. Local finiteness of dim.trg f is a hypothesis on f itself; ECD does not show that it can be checked v-locally.
Hypotheses: f separated, representable in locally spatial diamonds, locally dim.trg f < ∞ (hypothesis on f); g surjective.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.of_baseChange_of_surjective [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-base-change — Smooth base change
Target: Let Y′ →g̃ Y, f′ : Y′ → X′, f : Y → X, g : X′ → X be a cartesian square of small v-stacks, nΛ = 0 with n prime to p, g separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion. Then for every A ∈ D_ét(Y, Λ) the base-change morphism g^*Rf_*A → Rf′_*g̃^*A is an isomorphism; f is arbitrary.
Hypotheses: g smooth; f arbitrary; Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.pushforward_baseChange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-upper-shriek-exchange — Rf^! commutes with smooth pullback
Target: In the cartesian square of S4/smooth-base-change, assume g separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, Λ ℓ-power torsion, and in addition f compactifiable and representable in locally spatial diamonds with locally dim.trg f < ∞, so that Rf^! and Rf′^! are defined (the hypothesis on f is missing in print, PAPER-SCHOLZE-17/E66). Then for A ∈ D_ét(X, Λ) the map g̃^*Rf^!A → Rf′^!g^*A, adjoint to Rf^!A → Rf^!Rg_*g^*A = Rg̃_*Rf′^!g^*A, is an equivalence.
Hypotheses: g smooth; f eligible (added hypothesis); Λ ℓ-power torsion.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.upperShriek_exchange [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/smooth-pullback-internal-hom — Smooth pullback commutes with internal Hom
Target: Let f : Y → X be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and Λ ℓ-power torsion (the coefficient hypothesis is missing in print, PAPER-SCHOLZE-17/E68). There is a functorial isomorphism f^*RHom(A, B) ≅ RHom(f^*A, f^*B) for A, B ∈ D_ét(X, Λ).
Hypotheses: f smooth; Λ ℓ-power torsion (added).
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.pullback_internalHom [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S4/etale-maps-smooth — Separated étale maps and open immersions are ℓ-cohomologically smooth
Target: Every separated étale map f : Y′ → Y of small v-stacks is ℓ-cohomologically smooth for every ℓ ≠ p, with Rf^! ≃ f^* and D_f ≃ Λ; in particular open immersions are.
Hypotheses: f separated étale.
Required actual input: Actual D_et over connected Spa(C,C+) components, all four local criteria and arbitrary sums; F_ell practical criterion including open-extension comparison; genuine geometric invertible objects, cohomological locally constant degree, derived Z/ell^m reduction, actual twisted-pullback/base-change maps.
declaration IsCohomologicallySmooth.of_separated_etale [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/perfectoid-ball — The absolute perfectoid ball B
Target: B is the v-sheaf on Perf (characteristic-p perfectoid spaces) with B(R, R⁺) = R⁺ for affinoid perfectoid Spa(R, R⁺), extended by gluing; f : B → * is its structure map, * = Spd F_p the final v-sheaf. For an affinoid perfectoid X = Spa(R, R⁺), B × X = Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the perfectoid closed unit ball over X; for X perfectoid it is the diamond of the relative closed unit ball B_X of AdicEtaleGeometry A2 (its perfection). B is not the ordinary analytic unit disc over a mixed-characteristic base; the comparison with B_Y^♢ for analytic Y over ℤ_p goes through S5/analytic-smooth-is-cohomologically-smooth. B → * is separated and compactifiable: its canonical compactification is R ↦ R°, into which B is the open subfunctor {|T| ≤ 1}; it is representable in spatial diamonds with dim.trg 1.
Hypotheses: Perf is the site of characteristic-p perfectoid spaces of D2; the coordinate T ∈ O⁺(B).
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration Ball [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.app [OMITTED]: Maps X → B from an affinoid perfectoid X = Spa(R, R⁺) are the elements of R⁺.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.prod_affinoid [OMITTED]: B × Spa(R, R⁺) ≅ Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the perfectoid closed unit ball.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.diamond_relativeBall [OMITTED]: For a perfectoid space X, B × X ≅ (B_X)^♢ with B_X AdicEtaleGeometry A2's relative closed unit ball.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.isCompactifiable [OMITTED]: B → * is compactifiable, with canonical compactification R ↦ R° and B ⊂ B‾ the open {|T| ≤ 1}.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.isSpatialEligible [OMITTED]: B → * is spatial-eligible with dim.trg 1.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.coordinate [OMITTED]: The coordinate T ∈ O⁺(B)(B), universal element.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap Ball.openDisc [OMITTED]: For a complete algebraically closed perfectoid C of characteristic p, let K = F_p((t^{1/p^∞}))^∧. The punctured open unit disc D_C^× is Spa(K, O_K) × Spa(C, O_C), and is an open subspace of B × Spa(C, O_C) (ECD proof of 24.5).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test Ball.point_C [OMITTED]: B(Spa(C, C⁺)) = C⁺ for a perfectoid field C.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test Ball.compactification_ne [OMITTED]: B → * is not partially proper: the canonical compactification B‾(R, R⁺) = R° differs from B(R, R⁺) = R⁺ whenever R⁺ ≠ R°.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test Ball.dimTrg [OMITTED]: dim.trg(B → *) = 1.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test Ball.prod_point [OMITTED]: B × Spa(C, O_C) is the perfectoid closed unit disc Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) over C.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/tate-twist — Tate twists Λ(d) on small v-stacks
Target: Let n be prime to p and Λ a ring with nΛ = 0. μ_n is the étale sheaf on * = Spd F_p of n-th roots of unity, μ_n(R, R⁺) = {x ∈ R : xⁿ = 1}; it is finite étale over * (n invertible). Λ(1) := Λ ⊗_{ℤ/n} μ_n, Λ(d) := Λ(1)^{⊗d} for d ≥ 0 and Λ(−d) := RHom(Λ(d), Λ); for a small v-stack Y, Λ_Y(d) is the pullback to Y. Λ(d) is invertible and étale locally ≅ Λ; over Spa(C, C⁺) a choice of compatible roots of unity trivialises it. The definition is independent of n with nΛ = 0. It agrees with the classical Λ ⊗ μ_n on analytic adic spaces used in ClassicalAdicEtaleCohomology H3.
Hypotheses: n prime to p, nΛ = 0.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration tateTwist [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_zero [OMITTED]: Λ(0) = Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_add [OMITTED]: Λ(a) ⊗ Λ(b) ≅ Λ(a + b) for a, b ∈ ℤ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_isInvertible [OMITTED]: Λ(d) is invertible, étale locally ≅ Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_pullback [OMITTED]: f^*Λ_Y(d) ≅ Λ_{Y′}(d) for every map f : Y′ → Y.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_trivialise [OMITTED]: Over Spa(C, C⁺) with C algebraically closed, a compatible system of primitive roots of unity gives Λ(d) ≅ Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap tateTwist_classical [OMITTED]: For an analytic adic space Y over ℤ_p, Λ_{Y^♢}(1) corresponds to Huber's Λ ⊗ μ_n under D6's étale-site equivalence.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test tateTwist_zero_test [OMITTED]: Λ(0) ≅ Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test tateTwist_point [OMITTED]: Over Spa(C, O_C) with C algebraically closed, H⁰(Spa(C, O_C), Λ(1)) ≅ Λ, non-canonically. For p odd and Λ = F₂, compare n = 4 with n = 2: the square map μ₄ → μ₂ induces the isomorphism on twists, whereas the inclusion μ₂ → μ₄ induces the zero map after reduction modulo 2.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test tateTwist_not_const_Qp [OMITTED]: Over (Spa ℚ_p)^♢ with ℓ odd and μ_ℓ ⊄ ℚ_p (p ≢ 1 mod ℓ), F_ℓ(1) is not isomorphic to F_ℓ: Gal(ℚ̄_p/ℚ_p) acts on μ_ℓ through a nontrivial character, so H⁰((Spa ℚ_p)^♢, F_ℓ(1)) = 0.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/ball-smooth — The ball is ℓ-cohomologically smooth with dualizing complex Λ(1)[2]
Target: The structure map f : B → * of the absolute perfectoid ball (S5/perfectoid-ball) is ℓ-cohomologically smooth for every prime ℓ ≠ p, and for every ring Λ with nΛ = 0 (n prime to p) there is a canonical isomorphism D_f = Rf^!Λ ≅ Λ(1)[2], adjoint to the trace Rf_!Λ(1) → Λ[−2] obtained from Huber's trace by base change. This concerns the absolute perfectoid ball; ordinary analytic discs over a mixed-characteristic base are S5/analytic-smooth-is-cohomologically-smooth.
Hypotheses: ℓ ≠ p; Λ with nΛ = 0, n prime to p (for the isomorphism, decompose Λ into ℓ-primary parts).; The exact H3 unbounded-open-coefficient-curve-duality and plus-ring-top-trace-constancy contracts are imported with their inherited proof gaps. The maintainer-cleared Hub96 Theorems 7.2.2 and 7.5.3 and Lemma 7.5.4 have now been read at the needed arbitrary-plus-ring scope; this supplies source evidence, not completion of the separate H3 plan.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration Ball.isCohomologicallySmooth [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration Ball.dualizingComplex_iso [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/normalized-haar-measure — The normalised Λ-valued Haar measure of a profinite group of pro-order prime to ℓ
Target: Let K be a profinite group whose supernatural order profiniteOrder K is prime to ℓ (Tau Ceti ProfiniteProPGroups, Layer 1), and Λ an ℓ-power-torsion ring. The normalised Λ-valued Haar measure is the Λ-linear map μ_K : C⁰(K, Λ) → Λ with μ_K(1_{gH}) = [K : H]^{−1} for every open subgroup H and g ∈ K; it is well defined because every [K : H] divides profiniteOrder K (Lagrange) and is therefore a unit in Λ, and it is left and right invariant with total volume μ_K(1) = 1. If Λ ≠ 0 and K has an open subgroup of index divisible by ℓ (in particular if its pro-order is divisible by ℓ), no such measure exists: [K : H] is then divisible by ℓ for some H and cannot be inverted, so prime-to-ℓ averaging is unavailable.
Hypotheses: profiniteOrder K prime to ℓ; ℓ^mΛ = 0.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration normalizedHaar [TYPED-RELATIVE]: Actual compact Hausdorff totally disconnected topological group, discrete commutative coefficient ring and unit open indices. The source prime-to-ell assumption supplies these indices by the cited pinned Lagrange theorem.
ap normalizedHaar_indicator [TYPED-RELATIVE]: μ_K(1_{gH}) = [K : H]^{−1} for H open.
Form: Actual coset indicator volume times index equals one.
ap normalizedHaar_one [TYPED-RELATIVE]: μ_K(1) = 1.
Form: Actual normalized total mass.
ap normalizedHaar_translate [TYPED-RELATIVE]: μ_K(φ(k · −)) = μ_K(φ) = μ_K(φ(− · k)) for k ∈ K.
Form: Actual left translations; normalizedHaar_translate_right gives the right translations.
ap normalizedHaar_index_isUnit [TYPED-RELATIVE]: For H ⊂ K open, the image of [K : H] in Λ is a unit.
Form: Coprime index and ell-power annihilation imply the index is a unit; pro-order-to-coprimality uses the cited pinned Lagrange theorem.
ap normalizedHaar_pushforward [TYPED-RELATIVE]: For a surjection K → K/N with N closed normal, μ_K restricted to functions pulled back from K/N is μ_{K/N}.
Form: Actual continuous surjective group homomorphism and composition of locally constant functions.
ap normalizedHaar_finite [TYPED-RELATIVE]: For K finite of order prime to ℓ, μ_K(φ) = |K|^{−1} Σ_{k∈K} φ(k).
Form: Actual finite group average expressed as volume times cardinal equals the sum.
ap normalizedHaar_unique [TYPED-RELATIVE]: Any Λ-linear functional ν on C⁰(K,Λ) invariant under left translations with ν(1)=1 equals μ_K. Finite coset averages determine all locally constant functions.
Form: Actual invariant normalized linear functional; no conclusion is assumed.
test normalizedHaar_trivial [SPECIALIZATION]: For K trivial, μ_K(φ) = φ(1).
Form: Actual subsingleton group evaluation.
test normalizedHaar_Zp [SPECIALIZATION]: For K = ℤ_p, ℓ ≠ p and Λ = F_ℓ: μ(1_{p^kℤ_p}) = p^{−k} mod ℓ.
Form: Actual multiplicative copy of additive Z_2 and F_5: volume of 2^n Z_2 times 2^n equals one.
test normalizedHaar_finite_cyclic [SPECIALIZATION]: For K = ℤ/m with ℓ ∤ m: μ(1_{0}) = m^{−1}.
Form: Actual multiplicative copy of additive Z/2 and F_5: volume of the identity equals three.
test not_exists_normalizedHaar_proEll [SPECIALIZATION]: For K = ℤ_ℓ and Λ = F_ℓ there is no Λ-linear invariant μ with μ(1) = 1: invariance forces μ(1_{ℓℤ_ℓ}) · ℓ = 1 in F_ℓ, which is impossible; pro-ℓ quotients cannot use prime-to-ℓ averaging.
Form: Actual Z_5/F_5 invariant normalized functional is impossible; also a finite Z/ell quotient obstruction is stated.
-/

/-
DiamondSixOperations:S5/averaging-transformation — The averaging transformation q^* → Rq^! for profinite quotients
Target: Let f : Y′ → Y be eligible (hence separated and representable in locally spatial diamonds), K a profinite group of pro-order prime to ℓ acting on Y′ over Y such that K × Y′ → Y′ ×_Y Y′ is 0-truncated and qcqs (in particular for free actions, where it is an injection), q : Y′ → Y′/K the quotient by the image relation, and Λ ℓ-power torsion. Using the normalised Haar measure (S5/normalized-haar-measure), construct a natural transformation α_q : q^* → Rq^! of functors D_ét(Y′/K, Λ) → D_ét(Y′, Λ), adjoint to a trace Rq_!q^* = Rq_*q^* = q_*q^* → id. For free actions the trace is the colimit over open H ⊂ K of the normalised finite-level traces [K : H]^{−1}tr_{H,K} : q_{H,K*}q_{H,K}^* → id for q_{H,K} : Y′/H → Y′/K; in general it is induced by Rq^!Λ ⊗ q^* → Rq^! and the map Λ → Rq^!Λ adjoint to the integration q_*Λ → Λ over the K-action. The construction uses the quotient-geometric input that q is proper and quasi-pro-étale (for nonfree actions, the precise supplier extension is recorded as a request and gap), so Rq_! = Rq_* = q_* is exact (C8/qpetale-direct-image).
Hypotheses: f eligible; K pro-order prime to ℓ; action 0-truncated and qcqs over Y; Λ ℓ-power torsion.; The image-relation quotient exists and q is proper and quasi-pro-étale; nonfree quotient geometry is a recorded supplier gap. The normalized trace construction itself does not require f cohomologically smooth; that is required by S5/free-quotient-smooth and S5/nonfree-quotient-smooth.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration averagingTransformation [SPECIALIZATION]: Finite-fibre natural endomorphism of the actual diagonal ModuleCat functor; its components are m inverse times identity.
ap averagingTransformation_trace [SPECIALIZATION]: α_q is adjoint to the normalised trace q_*q^* → id.
Form: A normalized finite sum of a constant equals that constant; requires the finite cardinal to be a unit, not an arbitrary eligible map.
ap averagingTransformation_finite [SPECIALIZATION]: For a free action of a finite K of order m prime to ℓ, identify Rq^! ≃ q^* by S3/upper-shriek-etale. Then α_q is multiplication by m^{−1} on q^*, not the canonical identification itself; its adjoint normalized trace is m^{−1} times the sum over the fibre.
Form: The actual finite-fibre natural transformation has m inverse components, rather than identity.
ap averagingTransformation_comp_unit [OMITTED]: The composite F → q_*q^*F → F (unit then trace) is the identity, so R(f/K)_!F is a direct summand of Rf_!q^*F.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap averagingTransformation_baseChange [SPECIALIZATION]: α_q is compatible with base change along Ỹ → Y.
Form: Normalized finite sums are unchanged under the displayed equivalence of finite indexing fibres.
ap averagingTransformation_restrict_subgroup [SPECIALIZATION]: For a free action and an open H ⊂ K, the normalized trace for q : Y′ → Y′/K is the composite of the normalized traces for q_H : Y′ → Y′/H and q_{H,K} : Y′/H → Y′/K. Taking mates gives α_q as q_H^*α_{q_{H,K}} followed by α_{q_H} evaluated at Rq_{H,K}^!; the finite factor [K : H]^{−1} is already in α_{q_{H,K}} and is not applied a second time.
Form: Finite coset/subgroup Fubini model: the product cardinal is inverted exactly once, with its two factors once each.
test averagingTransformation_trivial_group [SPECIALIZATION]: For K trivial, α_q is the identity of id^* = id^!.
Form: Actual singleton finite-fibre normalization.
test averagingTransformation_finite_free [SPECIALIZATION]: For K = ℤ/m (ℓ ∤ m) acting freely, under Rq^! ≃ q^*, α_q is multiplication by m^{−1}; the trace q_*q^*Λ → Λ is m^{−1} times the sum over the fibre. The trace composed with the unit is the identity. Take, for example, Λ = F_5 and m = 2 to distinguish α_q from the canonical identification.
Form: Actual Fin 2/F_5 mean of one indicator equals three, mean of one equals one and three differs from one.
test averagingTransformation_not_iso_profinite [SPECIALIZATION]: Take K = ℤ_r for a prime r ≠ ℓ, Λ = F_ℓ and nonempty X = Spa(C, O_C). For the free translation action on Y′ = K × X over X, q : Y′ → X is proper quasi-pro-étale and α_q : q^* → Rq^! is not an equivalence: Rq^!Λ is the sheaf of distributions (S5/profinite-quotient-upper-shriek). This example concerns the averaging construction for an eligible f; f = q is not ℓ-cohomologically smooth, so the smooth-quotient theorem does not assert an equivalence here.
Form: Actual Z_2/F_5 Dirac distribution at the non-isolated identity is not a locally constant Haar density. The geometric sheaf identification is omitted.
test averagingTransformation_proEll_unavailable [SPECIALIZATION]: Assume Λ ≠ 0. For K = ℤ_ℓ there is no normalised measure, and the construction does not apply (S5/normalized-haar-measure).
Form: Finite quotient of order ell obstruction with an actual linear functional, invariance and total mass, not an assumed failure.
-/

/-
DiamondSixOperations:S5/free-quotient-smooth — Quotients by free actions of profinite groups of pro-order prime to ℓ
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth (ℓ ≠ p), and K a profinite group of pro-order prime to ℓ acting freely on Y′ over Y (K × Y′ → Y′ ×_Y Y′ an injection). Then f/K : Y′/K → Y is separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, and for Λ ℓ-power torsion and the normalised Haar measure there is a natural equivalence Rf^! ≃ q^*R(f/K)^! of functors D_ét(Y, Λ) → D_ét(Y′, Λ), q : Y′ → Y′/K the quotient. The coefficient hypothesis 'Λ ℓ-power torsion' is missing in print (PAPER-SCHOLZE-17/E100). Rq^! itself is not q^* (S5/profinite-quotient-upper-shriek).
Hypotheses: f smooth; K of pro-order prime to ℓ acting freely over Y; Λ ℓ-power torsion (added).
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration IsCohomologicallySmooth.quotient_free [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/profinite-quotient-upper-shriek — Rq^! for a profinite quotient is a sheaf of distributions, not q^*
Target: In the situation of S5/free-quotient-smooth one also has Rf^! = Rq^!R(f/K)^!, but Rq^! ≠ q^* in general. After base change q becomes S × Spa(C, O_C) → Spa(C, O_C) for a profinite set S and algebraically closed C, and then Rq^!Λ is the sheaf on S sending an open and closed T ⊂ S to the distributions Hom_Λ(C⁰(T, Λ), Λ); For a nonzero coefficient ring the infinite case yields the distribution obstruction; a concrete witness is S = ℤ_r, r ≠ ℓ, Λ = F_ℓ, for which the distribution sheaf is not q^*Λ. No non-isomorphism is claimed for Λ = 0. A choice of Haar measure gives a natural map q^* → Rq^! (S5/averaging-transformation), which need not be an isomorphism (and is not one in the concrete infinite example above). Statements must therefore be made after composing with the quotient's structure map, as in S5/free-quotient-smooth.
Hypotheses: S profinite, C algebraically closed; Λ with nΛ = 0, n prime to p.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration profiniteProjection_upperShriek_distributions [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/nonfree-quotient-smooth — Quotients by non-free profinite actions with smooth fibres
Target: Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth, K a profinite group of pro-order prime to ℓ acting on Y′ over Y with K × Y′ → Y′ ×_Y Y′ 0-truncated and qcqs, and Y′/K the quotient by the image equivalence relation. Then f/K : Y′/K → Y is separated and representable in locally spatial diamonds. If moreover for every complete algebraically closed C with open bounded valuation subring C⁺ and every Spa(C, C⁺) → Y the pullback Y′/K ×_Y Spa(C, C⁺) → Spa(C, C⁺) is ℓ-cohomologically smooth, then f/K is ℓ-cohomologically smooth and, for Λ ℓ-power torsion (PAPER-SCHOLZE-17/E100) and the normalised Haar measure, Rf^! ≃ q^*R(f/K)^!.
Hypotheses: As in S5/free-quotient-smooth but the action only 0-truncated and qcqs; fibrewise smoothness of the quotient over geometric points is a hypothesis.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration IsCohomologicallySmooth.quotient_nonfree [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth — Smooth morphisms of analytic adic spaces are ℓ-cohomologically smooth
Target: Let f : Y′ → Y be a separated smooth morphism of analytic adic spaces over Spa ℤ_p, smooth meaning locally on Y′ an étale map Y′ → Bⁿ_Y followed by the projection Bⁿ_Y → Y (AdicEtaleGeometry:A2/smooth-morphism-ball-charts; Bⁿ_Y = Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩) over affinoid Y = Spa(A, A⁺)). Then f^♢ : (Y′)^♢ → Y^♢ is ℓ-cohomologically smooth for every ℓ ≠ p.
Hypotheses: f separated, locally étale over relative balls (A2); Y, Y′ analytic over Spa ℤ_p; ℓ ≠ p.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration IsCohomologicallySmooth.of_adic_smooth [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/spd-qp-smooth — (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth
Target: For every prime ℓ ≠ p, the map (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth.
Hypotheses: ℓ ≠ p.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration SpdQp.isCohomologicallySmooth [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S5/geometric-base-criterion — A smoothness criterion over a general perfectoid base
Target: Let X be a perfectoid space, Y a locally spatial diamond and f : Y → X compactifiable with locally dim.trg f < ∞. Then f is ℓ-cohomologically smooth iff (i) Rf^!F_ℓ is invertible, i.e. étale locally ≅ F_ℓ[d], and (ii) for every X̃ → X that is an open subset of a finite-dimensional ball Bⁿ_X, with pullback f̃ : Ỹ → X̃, the transformation τ_{f̃} : Rf̃^!F_ℓ ⊗ f̃^* → Rf̃^! is an equivalence.
Hypotheses: X perfectoid; Y locally spatial; f compactifiable, locally dim.trg f < ∞.
Required actual input: Actual Perf site with perfectoid pairs and O^+; completed perfectoid Tate algebras, the actual ball and relative ball diamond, mu_n and classical roots-of-unity twist; actual continuous K action and image-relation quotient; actual Spd Q_p/cyclotomic field; every open of every finite-dimensional relative ball.
declaration isCohomologicallySmooth_iff_geometricBase [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/verdier-dual — The Verdier dual and the naive dual over a geometric point
Target: Let C be a complete algebraically closed nonarchimedean field of characteristic p, f : X → Spa(C, O_C) an eligible map from a locally spatial diamond, and Λ with nΛ = 0 (n prime to p). The Verdier dual is 𝔻_X := RHom_Λ(−, Rf^!Λ) : D_ét(X, Λ)^op → D_ét(X, Λ) and the naive dual is RHom_Λ(−, Λ). The biduality maps A → 𝔻_X𝔻_X A and A → RHom(RHom(A, Λ), Λ) are the evaluation maps. When f is ℓ-cohomologically smooth and Λ is ℓ-power torsion, Rf^!Λ is invertible (S4/dualizing-complex), so 𝔻_X = RHom(−, Λ) ⊗ Rf^!Λ and the two biduality maps correspond. On Spa(C, O_C) itself D_ét = D(Λ) and 𝔻 is the linear dual.
Hypotheses: f eligible from a locally spatial diamond to Spa(C, O_C); for the comparison of the two duals f is ℓ-cohomologically smooth and Λ ℓ-power torsion.
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration verdierDual [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration naiveDual [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_apply [OMITTED]: 𝔻_X A = RHom(A, Rf^!Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_const [OMITTED]: 𝔻_X Λ = Rf^!Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_eq_naive_tensor [OMITTED]: For f smooth and Λ ℓ-power torsion, 𝔻_X A ≅ RHom(A, Λ) ⊗ D_f.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap bidualityMap [OMITTED]: The evaluation map A → 𝔻_X𝔻_X A.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_globalSections [OMITTED]: RΓ(X, 𝔻_X A) ≅ RHom(RΓ_c(X, A), Λ).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_extendByZero [OMITTED]: For j : U → X a quasicompact open, 𝔻_X(j_!B) ≅ Rj_*𝔻_U(B) and RHom(j_!Λ, Λ) = Rj_*Λ.
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
ap verdierDual_pullback_smooth [OMITTED]: For g : X′ → X ℓ-cohomologically smooth and Λ ℓ-power torsion, g^*𝔻_X ≅ D_g^{−1} ⊗ 𝔻_{X′}g^* (S4/smooth-pullback-internal-hom and S3/upper-shriek-composition, with the smooth twist of g).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test verdierDual_point [SPECIALIZATION]: For X = Spa(C, O_C), 𝔻 is the linear dual RHom_Λ(−, Λ) on D(Λ).
Form: Actual canonical double-linear-dual map for F_5; the geometric point comparison is omitted.
test verdierDual_ball [OMITTED]: For the ball over Spa(C, O_C), 𝔻(Λ) ≅ Λ(1)[2].
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test naiveDual_extendByZero_valuedPlus [OMITTED]: Over Spa(C, C⁺) with C⁺ ≠ O_C and j : Spa(C, O_C) → Spa(C, C⁺), RHom(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = F_ℓ, so the naive double dual of j_!F_ℓ is F_ℓ ≠ j_!F_ℓ (S6/biduality-counterexample).
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
test verdierDual_contravariant [OMITTED]: 𝔻 is an exact contravariant functor: 𝔻(A[1]) = (𝔻A)[−1].
Form: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/biduality — Biduality for ℓ-cohomologically smooth diamonds over Spa(C, O_C)
Target: Let C be a complete algebraically closed nonarchimedean field of characteristic p with ring of integers O_C, X a locally spatial diamond, separated and ℓ-cohomologically smooth over Spa(C, O_C) for some ℓ ≠ p, and A ∈ D_ét(X, F_ℓ) bounded with constructible cohomology. Then the naive biduality map A → RHom_{F_ℓ}(RHom_{F_ℓ}(A, F_ℓ), F_ℓ) is an equivalence; equivalently (Rf^!F_ℓ being invertible) the Verdier biduality map A → 𝔻_X𝔻_X A is. The base is Spa(C, O_C); over Spa(C, C⁺) with C⁺ ≠ O_C the statement is false (S6/biduality-counterexample).
Hypotheses: C complete algebraically closed of characteristic p; base Spa(C, O_C) (C⁺ = O_C is essential).; X separated, locally spatial, ℓ-cohomologically smooth over Spa(C, O_C); A bounded with constructible cohomology sheaves.; The curve compactification input (H5/geometric-curve-compactification-export, local form (L)) is used with the scope recorded by its owner.
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration biduality [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/finiteness-of-cohomology — Finiteness of cohomology of smooth diamonds over Spa(C, O_C)
Target: In the situation of S6/biduality, if X is quasicompact then Hⁱ(X, A) is a finite-dimensional F_ℓ-vector space for every i ∈ ℤ and every bounded A with constructible cohomology.
Hypotheses: As in S6/biduality, X quasicompact.
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration finite_cohomology_of_smooth [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/biduality-counterexample — Biduality fails over Spa(C, C⁺) with C⁺ ≠ O_C
Target: Let C be complete algebraically closed, C⁺ ⊊ O_C an open bounded valuation subring, X = Spa(C, C⁺) and j : U = Spa(C, O_C) → X the open immersion (the generic point). Then for A = j_!F_ℓ, RHom_{F_ℓ}(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = j_*F_ℓ = F_ℓ, so the double dual of A is F_ℓ ≠ j_!F_ℓ. Hence the hypothesis C⁺ = O_C in S6/biduality is essential, even for X → Spa(C, C⁺) the identity, which is ℓ-cohomologically smooth.
Hypotheses: C⁺ ⊊ O_C.
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration not_biduality_valuedPlus [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/biduality-torsion-coefficients — Biduality and perfectness for ℓ-power-torsion coefficients
Target: In the situation of S6/biduality let Λ be an ℓ-power-torsion ring and A ∈ D_ét(X, Λ) perfect-constructible. Then the biduality map A → RHom_Λ(RHom_Λ(A, Λ), Λ) is an equivalence, and if X is quasicompact, RΓ(X, A) is a perfect complex of Λ-modules (the printed 'A-modules' is PAPER-SCHOLZE-17/E65).
Hypotheses: As in S6/biduality; Λ ℓ-power torsion (ℓ^mΛ = 0); A perfect-constructible (C7).
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration biduality_ellTorsion [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
declaration perfect_globalSections [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/closed-points-detect-vanishing — Closed points detect vanishing on proper perfectoid spaces over Spa(C, O_C)
Target: Let C be complete algebraically closed nonarchimedean of characteristic p, k its residue field, and X an affinoid perfectoid space, proper over Spa(C, O_C) and compactifiable over it, whose connected components are Spa(C′, C′⁺) with C′ complete algebraically closed and C′⁺ ⊂ O_{C′} open and integrally closed. Then |X| is a Jacobson space (Mathlib JacobsonSpace: every nonempty locally closed subset contains a point closed in |X|), and an object A ∈ D(|X|, F_ℓ) whose stalks vanish at all closed points of |X| is zero.
Hypotheses: X as in the proof of ECD Proposition 25.4 (the compactification of a strictly totally disconnected cover).
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration closedPoints_detect_zero [SPECIALIZATION]: Actual topological ModuleCat sheaf vanishing on a Jacobson space, with the genuine sheafification instance. The perfectoid comparison is omitted.
-/

/-
DiamondSixOperations:S6/verdier-conservativity — Conservativity of Verdier duality over Spa(C, O_C)
Target: Let C be an complete algebraically closed nonarchimedean field of characteristic p, X a locally spatial diamond with f : X → Spa(C, O_C) compactifiable with locally dim.trg f < ∞, and A ∈ D_ét(X, F_ℓ) with RHom_{F_ℓ}(A, Rf^!F_ℓ) = 0. Then A = 0. No smoothness or constructibility is assumed; the base Spa(C, O_C) is essential (S6/conservativity-counterexample).
Hypotheses: f compactifiable (hence eligible with the dimension hypothesis); base Spa(C, O_C).
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration verdierDual_conservative [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/conservativity-counterexample — Conservativity fails over Spa(C, C⁺) with C⁺ ≠ O_C
Target: Let X = Spa(C, C⁺) with C⁺ ⊊ O_C, i : {s} → |X| the inclusion of the closed point, and a nonzero Λ with nΛ = 0, n prime to p. Then RHom_Λ(i_*Λ, Λ) = 0 although i_*Λ ≠ 0 (D_ét(X, Λ) = D(|X|, Λ), X being strictly totally disconnected). Hence S6/verdier-conservativity fails over Spa(C, C⁺): f = id is ℓ-cohomologically smooth with Rf^!Λ = Λ.
Hypotheses: C⁺ ⊊ O_C; Λ ≠ 0; nΛ = 0 for n prime to p.
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration not_verdierDual_conservative_valuedPlus [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/

/-
DiamondSixOperations:S6/conservativity-general-coefficients — Conditional conservativity for general coefficient rings
Target: Let Λ be a ring killed by some n prime to p such that for every M ∈ D(Λ), RHom_Λ(M, Λ) = 0 implies M = 0. Then S6/verdier-conservativity holds with Λ in place of F_ℓ: for f : X → Spa(C, O_C) compactifiable with locally dim.trg f < ∞ and A ∈ D_ét(X, Λ), RHom_Λ(A, Rf^!Λ) = 0 implies A = 0. This is a conditional statement, not an unconditional extension: the ring hypothesis fails for Λ = O_K with K spherically complete and non-discretely valued and M = k its residue field (corrected example, PAPER-SCHOLZE-17/E101; such O_K is not killed by any n, so it illustrates only the ring-theoretic condition), and it is not known in which generality (for instance for noetherian Λ) it holds.
Hypotheses: Λ killed by n prime to p, with the stated conservativity of RHom_Λ(−, Λ) on D(Λ) (a hypothesis).
Required actual input: Actual complete algebraically closed characteristic-p C and its ring of integers O_C, the eligible structure map and D_et; actual RHom, duality evaluation/global-sections/open-extension maps; F_ell bounded constructible or general perfect-constructible coefficients as displayed; the imported compactification/valuation-topos comparisons. Strict total disconnection alone is insufficient.
declaration verdierDual_conservative_of_ring [OMITTED]: Requires the displayed actual supplier input; no replacement signature is asserted.
-/
