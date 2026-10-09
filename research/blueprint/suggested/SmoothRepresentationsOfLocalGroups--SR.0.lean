import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.CategoryTheory.Simple
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RepresentationTheory.Stabilizer
import Mathlib.RepresentationTheory.Rep.Res
import Mathlib.RepresentationTheory.Invariants
import Mathlib.CategoryTheory.ObjectProperty.Kernels
import Mathlib.CategoryTheory.ObjectProperty.ColimitsOfShape
import Mathlib.CategoryTheory.Adjunction.Reflective
import Mathlib.CategoryTheory.Center.Linear
import Mathlib.CategoryTheory.Limits.Preserves.Filtered
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.EnoughInjectives
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.HasExt
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Linear
import Mathlib.Algebra.Homology.DerivedCategory.KInjective
import Mathlib.Algebra.Homology.DerivedCategory.RightDerivedFunctorPlus
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Topology.Algebra.Nonarchimedean.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Topology.Instances.ZMod
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.Topology.MetricSpace.Ultra.TotallySeparated
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Sets.Compacts
import Mathlib.Topology.ContinuousMap.CompactlySupported
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Coinduced
import Mathlib.RepresentationTheory.Induced
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.MeasureTheory.Group.ModularCharacter
import TauCeti.NumberTheory.HeckeRing.Associativity
import Mathlib.Algebra.Group.Subgroup.Pointwise
import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Algebra.Algebra.Unitization
import Mathlib.Algebra.Category.ModuleCat.Algebra
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete
import TauCeti.RepresentationTheory.Homological.ContCohomology.Invariants
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.Topology.Algebra.Group.Profinite.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These admitted statements suggest Lean forms so that contributors
and reviewers converge on names and signatures. No implementation is claimed.
The omission ledger at the end names interfaces whose precise source conditions
require supplier types absent at the pinned baseline. They are not represented
by arbitrary proposition fields or by assumed theorem conclusions.

The common universe below can be enlarged by lifting the coefficient ring,
group and modules. The representation carrier is Mathlib's `Rep`; the
topological comparison imports Tau Ceti's existing smooth-discrete carrier.
-/

set_option linter.unusedVariables false
set_option autoImplicit false
noncomputable section
attribute [local instance] Classical.propDecidable
open _root_.CategoryTheory _root_.CategoryTheory.Limits
open scoped BigOperators TensorProduct Pointwise DirectSum
universe u

namespace TauCeti

abbrev CompactOpenSubgroup (G : Type u) [Group G] [TopologicalSpace G] :=
  { U : OpenSubgroup G // IsCompact (U : Set G) }

theorem exists_compactOpenSubgroup_le (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (s : Set G) (hs : s ∈ nhds (1 : G)) :
    ∃ U : CompactOpenSubgroup G, (U.1 : Set G) ⊆ s := by sorry

namespace Representation
variable {A G V W : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
  [AddCommGroup W] [Module A W]

def IsSmooth (ρ : _root_.Representation A G V) : Prop :=
  ∀ v, IsOpen (_root_.Representation.stabilizer ρ v : Set G)

lemma isSmooth_iff_exists_openSubgroup (ρ : _root_.Representation A G V) :
    IsSmooth ρ ↔ ∀ v, ∃ U : OpenSubgroup G,
      ∀ g : U, ρ g v = v := by sorry

lemma IsSmooth.subrepresentation {ρ : _root_.Representation A G V}
    (h : IsSmooth ρ) (S : Subrepresentation ρ) : IsSmooth S.toRepresentation := by sorry

lemma IsSmooth.quotient {ρ : _root_.Representation A G V}
    {σ : _root_.Representation A G W} (h : IsSmooth ρ)
    (f : _root_.Representation.IntertwiningMap ρ σ) (hf : Function.Surjective f) :
    IsSmooth σ := by sorry

lemma IsSmooth.directSum {I : Type u} {M : I → Type u}
    [∀ i, AddCommGroup (M i)] [∀ i, Module A (M i)]
    (ρ : ∀ i, _root_.Representation A G (M i)) (h : ∀ i, IsSmooth (ρ i)) :
    IsSmooth (_root_.Representation.directSum ρ) := by sorry

lemma IsSmooth.tprod {ρ : _root_.Representation A G V}
    {σ : _root_.Representation A G W} (hρ : IsSmooth ρ) (hσ : IsSmooth σ) :
    IsSmooth (ρ.tprod σ) := by sorry

lemma IsSmooth.comp_continuous {H : Type u} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] {ρ : _root_.Representation A G V} (hρ : IsSmooth ρ)
    (f : H →* G) (hf : Continuous f) : IsSmooth (ρ.comp f) := by sorry

lemma isSmooth_ofMulAction_quotient (U : OpenSubgroup G) :
    IsSmooth (_root_.Representation.ofMulAction A G (G ⧸ U.toSubgroup)) := by sorry

-- The dictionary is tested on the very same action, without constructing another TopRep.
lemma isSmooth_iff_isSmoothDiscrete [TopologicalSpace A] [DiscreteTopology A]
    [TopologicalSpace V] [DiscreteTopology V] [DistribMulAction G V]
    [SMulCommClass G A V] [ContinuousSMul A V] :
    IsSmooth (_root_.Representation.ofDistribMulAction A G V) ↔
      TauCeti.IsSmoothDiscrete A (TauCeti.ofDiscreteModule A G V) := by sorry

-- TauCeti.Representation.isSmooth_trivial
example : IsSmooth (_root_.Representation.trivial A G V) := by sorry
-- TauCeti.Representation.not_isSmooth_leftRegular
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmooth (_root_.Representation.ofMulAction ℤ
      (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p])) := by sorry
-- TauCeti.Representation.isSmooth_ofMulAction_zmod
example (p : ℕ) [Fact p.Prime] (U : OpenNormalSubgroup (Multiplicative ℤ_[p])) :
    IsSmooth (_root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p] ⧸ U.toSubgroup)) ∧
    ∀ u : U, ∀ v : MonoidAlgebra ℤ (Multiplicative ℤ_[p] ⧸ U.toSubgroup),
      _root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
        (Multiplicative ℤ_[p] ⧸ U.toSubgroup) u v = v := by sorry
-- TauCeti.Representation.isSmooth_of_discreteTopology
example [DiscreteTopology G] (ρ : _root_.Representation A G V) : IsSmooth ρ := by sorry
-- TauCeti.Representation.isSmooth_iff_isSmoothDiscrete_test
example [TopologicalSpace A] [DiscreteTopology A] [TopologicalSpace V]
    [DiscreteTopology V] [DistribMulAction G V] [SMulCommClass G A V]
    [ContinuousSMul A V] [ContinuousSMul G V] :
    IsSmooth (_root_.Representation.ofDistribMulAction A G V) ∧
      TauCeti.IsSmoothDiscrete A (TauCeti.ofDiscreteModule A G V) := by sorry

def smoothVectors (ρ : _root_.Representation A G V) : Subrepresentation ρ := by sorry
lemma mem_smoothVectors_iff (ρ : _root_.Representation A G V) (v : V) :
    v ∈ smoothVectors ρ ↔ IsOpen (_root_.Representation.stabilizer ρ v : Set G) := by sorry
lemma smoothVectors_isSmooth (ρ : _root_.Representation A G V) :
    IsSmooth (smoothVectors ρ).toRepresentation := by sorry
lemma smoothVectors_eq_top_iff (ρ : _root_.Representation A G V) :
    smoothVectors ρ = ⊤ ↔ IsSmooth ρ := by sorry
-- TauCeti.Representation.smoothVectors_leftRegular_eq_bot
example (p : ℕ) [Fact p.Prime] : smoothVectors
    (_root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p])) = ⊥ := by sorry
-- TauCeti.Representation.smoothVectors_of_discreteTopology
example [DiscreteTopology G] (ρ : _root_.Representation A G V) :
    smoothVectors ρ = ⊤ := by sorry

end Representation

abbrev SmoothRep (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :=
  ObjectProperty.FullSubcategory (fun V : _root_.Rep.{u,u,u} A G ↦
    Representation.IsSmooth V.ρ)

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

abbrev ι : SmoothRep A G ⥤ _root_.Rep A G := ObjectProperty.ι _
def of {M : Type u} [AddCommGroup M] [Module A M]
    (ρ : _root_.Representation A G M) (h : Representation.IsSmooth ρ) :
    SmoothRep A G := ⟨_root_.Rep.of ρ, h⟩
lemma hom_ext {V W : SmoothRep A G} {f g : V ⟶ W}
    (h : f.hom.hom = g.hom.hom) : f = g := by sorry
instance instLinear : Linear A (SmoothRep A G) := by sorry
instance instHasColimits : HasColimits (SmoothRep A G) := by sorry
instance instHasLimits : HasLimits (SmoothRep A G) := by sorry
instance instAbelian : Abelian (SmoothRep A G) where
  toPreadditive := inferInstance
  toIsNormalMonoCategory := by sorry
  toIsNormalEpiCategory := by sorry
  has_finite_products := inferInstance
  has_kernels := inferInstance
  has_cokernels := inferInstance

def smoothPart : _root_.Rep A G ⥤ SmoothRep A G := by sorry
def smoothPartAdjunction : (ι : SmoothRep A G ⥤ _) ⊣ smoothPart := by sorry
instance coreflective : Coreflective (ι : SmoothRep A G ⥤ _) := by sorry
instance smoothPart_preservesLimits : PreservesLimits (smoothPart (A := A) (G := G)) := by sorry

def res {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : H →* G) (hf : Continuous f) : SmoothRep A G ⥤ SmoothRep A H :=
  ObjectProperty.lift _ (ι ⋙ _root_.Rep.resFunctor f) (by
    intro V
    exact Representation.IsSmooth.comp_continuous V.property f hf)
def inflation (N : Subgroup G) [N.Normal] :
    SmoothRep A (G ⧸ N) ⥤ SmoothRep A G := by sorry

def invariants (V : SmoothRep A G) (U : Subgroup G) : Submodule A V.obj :=
  _root_.Representation.invariants (V.obj.ρ.comp U.subtype)
def invariantsMap (U : Subgroup G) {V W : SmoothRep A G} (f : V ⟶ W) :
    invariants V U →ₗ[A] invariants W U := by sorry
lemma invariantsMap_apply (U : Subgroup G) {V W : SmoothRep A G} (f : V ⟶ W)
    (v : invariants V U) : (invariantsMap U f v : W.obj) = f.hom.hom v := by sorry
def invariantsFunctor (U : Subgroup G) : SmoothRep A G ⥤ ModuleCat A where
  obj V := ModuleCat.of A (invariants V U)
  map f := ModuleCat.ofHom (invariantsMap U f)
  map_id := by sorry
  map_comp := by sorry
lemma invariants_antitone (V : SmoothRep A G) {U U' : Subgroup G} (h : U' ≤ U) :
    invariants V U ≤ invariants V U' := by sorry
def invariants_conj (V : SmoothRep A G) (U : Subgroup G) (g : G) :
    invariants V U ≃ₗ[A] invariants V (U.map (MulAut.conj g).toMonoidHom) := by sorry
lemma iSup_invariants_eq_top [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (V : SmoothRep A G) :
    (⨆ U : CompactOpenSubgroup G, invariants V U.1.toSubgroup) = ⊤ := by sorry
lemma directed_invariants (V : SmoothRep A G) :
    Directed (· ≤ ·) (fun U : CompactOpenSubgroup G ↦ invariants V U.1.toSubgroup) := by sorry
instance invariantsFunctor_preservesFiniteLimits (U : Subgroup G) :
    PreservesFiniteLimits (invariantsFunctor (A := A) U) := by sorry

-- TauCeti.SmoothRep.end_trivial
example : Nonempty (End (of (_root_.Representation.trivial A G A) (by sorry)) ≃+* A) := by sorry
-- TauCeti.SmoothRep.equivalence_of_discrete
example [DiscreteTopology G] : Nonempty (SmoothRep A G ≌ _root_.Rep A G) := by sorry
-- TauCeti.SmoothRep.invariants_top_of_trivial
example {M : Type u} [AddCommGroup M] [Module A M] (U : Subgroup G) :
    invariants (of (_root_.Representation.trivial A G M) (by sorry)) U = ⊤ := by sorry

end SmoothRep

def HasUnitProOrder (A U : Type u) [CommRing A] [Group U] [TopologicalSpace U] : Prop :=
  ∀ U' : OpenSubgroup U, IsUnit (U'.toSubgroup.index : A)
def HasCofinalUnitProOrder (A G : Type u) [CommRing A] [Group G]
    [TopologicalSpace G] : Prop :=
  ∀ s ∈ nhds (1 : G), ∃ U : CompactOpenSubgroup G,
    (U.1 : Set G) ⊆ s ∧ HasUnitProOrder A U.1

lemma HasUnitProOrder.map {A B U : Type u} [CommRing A] [CommRing B]
    [Group U] [TopologicalSpace U] (f : A →+* B) (h : HasUnitProOrder A U) :
    HasUnitProOrder B U := by sorry
lemma HasUnitProOrder.of_le {A U : Type u} [CommRing A] [Group U]
    [TopologicalSpace U] [IsTopologicalGroup U] [CompactSpace U] [T2Space U]
    (h : HasUnitProOrder A U) (S : Subgroup U) (hS : IsClosed (S : Set U)) :
    HasUnitProOrder A S := by sorry
lemma HasUnitProOrder.of_isProP {A U : Type u} [CommRing A] [Group U]
    [TopologicalSpace U] [IsTopologicalGroup U] [CompactSpace U] [T2Space U]
    [TotallyDisconnectedSpace U] (p : ℕ) [Fact p.Prime]
    (hU : IsProP p U) (hp : IsUnit (p : A)) : HasUnitProOrder A U := by sorry

-- TauCeti.hasUnitProOrder_padicInt_iff
example (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime] :
    HasUnitProOrder A (Multiplicative ℤ_[p]) ↔ IsUnit (p : A) := by sorry
-- TauCeti.hasUnitProOrder_finite_iff
example (A U : Type u) [CommRing A] [Group U] [TopologicalSpace U]
    [DiscreteTopology U] [Finite U] :
    HasUnitProOrder A U ↔ IsUnit (Nat.card U : A) := by sorry
-- TauCeti.hasUnitProOrder_trivial
example (A : Type u) [CommRing A] : HasUnitProOrder A PUnit := by sorry
-- TauCeti.not_hasUnitProOrder_padicInt_zmod_p
example (p : ℕ) [Fact p.Prime] :
    ¬ HasUnitProOrder (ZMod p) (Multiplicative ℤ_[p]) := by sorry

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
def averaging (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) : V.obj →ₗ[A] V.obj := by sorry
lemma averaging_idem (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) :
    (averaging V U hU).comp (averaging V U hU) = averaging V U hU := by sorry
lemma range_averaging (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) :
    LinearMap.range (averaging V U hU) = invariants V U.1.toSubgroup := by sorry
lemma ker_averaging (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) : LinearMap.ker (averaging V U hU) =
    Submodule.span A { x | ∃ u : U.1, ∃ v : V.obj, x = V.obj.ρ u v - v } := by sorry
lemma averaging_naturality {V W : SmoothRep A G} (f : V ⟶ W)
    (U : CompactOpenSubgroup G) (hU : HasUnitProOrder A U.1) :
    f.hom.hom.toLinearMap.comp (averaging V U hU) =
      (averaging W U hU).comp f.hom.hom.toLinearMap := by sorry
lemma averaging_comp_of_le (V : SmoothRep A G) (U U' : CompactOpenSubgroup G)
    (h : U'.1 ≤ U.1) (hU : HasUnitProOrder A U.1) (hU' : HasUnitProOrder A U'.1) :
    (averaging V U hU).comp (averaging V U' hU') = averaging V U hU ∧
    (averaging V U' hU').comp (averaging V U hU) = averaging V U hU := by sorry
lemma invariantsFunctor_exact (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) (S : ShortComplex (SmoothRep A G))
    (hS : S.ShortExact) : (S.map (invariantsFunctor U.1.toSubgroup)).ShortExact := by sorry
end SmoothRep

namespace Representation
variable {A G V W : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
  [AddCommGroup W] [Module A W]
def IsAdmissible (ρ : _root_.Representation A G V) : Prop :=
  IsSmooth ρ ∧ ∀ U : CompactOpenSubgroup G,
    Module.Finite A (_root_.Representation.invariants (ρ.comp U.1.toSubgroup.subtype))
lemma IsAdmissible.subrepresentation [IsNoetherianRing A]
    {ρ : _root_.Representation A G V} (hρ : IsAdmissible ρ)
    (S : Subrepresentation ρ) : IsAdmissible S.toRepresentation := by sorry
lemma IsAdmissible.quotient {ρ : _root_.Representation A G V}
    {σ : _root_.Representation A G W} (hρ : IsAdmissible ρ)
    (hU : ∀ U : CompactOpenSubgroup G, HasUnitProOrder A U.1)
    (f : _root_.Representation.IntertwiningMap ρ σ) (hf : Function.Surjective f) :
    IsAdmissible σ := by sorry
lemma IsAdmissible.prod {ρ : _root_.Representation A G V}
    {σ : _root_.Representation A G W} (hρ : IsAdmissible ρ) (hσ : IsAdmissible σ) :
    IsAdmissible (_root_.Representation.prod ρ σ) := by sorry
lemma isAdmissible_iff_basis [IsNoetherianRing A]
    (ρ : _root_.Representation A G V) (B : Set (CompactOpenSubgroup G))
    (hB : ∀ U : CompactOpenSubgroup G, ∃ K ∈ B, K.1 ≤ U.1) :
    IsAdmissible ρ ↔ IsSmooth ρ ∧ ∀ K ∈ B,
      Module.Finite A (_root_.Representation.invariants (ρ.comp K.1.toSubgroup.subtype)) := by sorry
lemma isAdmissible_iff_finiteDimensional {k : Type u} [Field k]
    {M : Type u} [AddCommGroup M] [Module k M] (ρ : _root_.Representation k G M) :
    IsAdmissible ρ ↔ IsSmooth ρ ∧ ∀ U : CompactOpenSubgroup G,
      FiniteDimensional k (_root_.Representation.invariants (ρ.comp U.1.toSubgroup.subtype)) := by sorry
lemma isAdmissible_of_finite {k : Type u} [Field k] {M : Type u}
    [AddCommGroup M] [Module k M] [FiniteDimensional k M]
    (ρ : _root_.Representation k G M) (hρ : IsSmooth ρ) : IsAdmissible ρ := by sorry

def cyclic (ρ : _root_.Representation A G V) (v : V) : Subrepresentation ρ :=
  Subrepresentation.ofSubmodule' (Submodule.span (MonoidAlgebra A G)
    {(_root_.Representation.asModuleEquiv ρ).symm v})
def IsLocallyAdmissible (ρ : _root_.Representation A G V) : Prop :=
  IsSmooth ρ ∧ ∀ v, IsAdmissible (cyclic ρ v).toRepresentation
lemma IsAdmissible.isLocallyAdmissible [IsNoetherianRing A]
    {ρ : _root_.Representation A G V} (hρ : IsAdmissible ρ) : IsLocallyAdmissible ρ := by sorry
lemma isAdmissible_of_fg_of_locallyAdmissible [IsNoetherianRing A]
    (ρ : _root_.Representation A G V)
    [Module.Finite (MonoidAlgebra A G) (_root_.Representation.asModule ρ)]
    (hU : ∀ U : CompactOpenSubgroup G, HasUnitProOrder A U.1)
    (hρ : IsLocallyAdmissible ρ) : IsAdmissible ρ := by sorry
lemma IsLocallyAdmissible.subrepresentation [IsNoetherianRing A]
    {ρ : _root_.Representation A G V} (hρ : IsLocallyAdmissible ρ)
    (S : Subrepresentation ρ) : IsLocallyAdmissible S.toRepresentation := by sorry

-- TauCeti.Representation.isAdmissible_zero
example : IsAdmissible (_root_.Representation.trivial A G (Fin 0 → A)) := by sorry
-- TauCeti.Representation.isAdmissible_iff_casselman
example {G M : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [AddCommGroup M] [Module ℂ M] (ρ : _root_.Representation ℂ G M) :
    IsAdmissible ρ ↔ IsSmooth ρ ∧ ∀ U : CompactOpenSubgroup G,
      FiniteDimensional ℂ (_root_.Representation.invariants (ρ.comp U.1.toSubgroup.subtype)) := by sorry
-- TauCeti.Representation.isLocallyAdmissible_trivial
example [IsNoetherianRing A] :
    IsLocallyAdmissible (_root_.Representation.trivial A G A) ∧
      Module.Finite (MonoidAlgebra A G)
        (_root_.Representation.asModule (_root_.Representation.trivial A G A)) := by sorry

end Representation

def IsSmoothCharacter {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    (χ : G →* Aˣ) : Prop := IsOpen (χ.ker : Set G)
lemma IsSmoothCharacter.mul {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {χ ψ : G →* Aˣ}
    (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    IsSmoothCharacter (χ * ψ) := by sorry

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
def characterRepresentation (χ : G →* Aˣ) : _root_.Representation A G A where
  toFun g := LinearMap.lsmul A A (χ g : A)
  map_one' := by sorry
  map_mul' := by sorry
def ofCharacter (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) : SmoothRep A G :=
  of (characterRepresentation χ) (by sorry)
lemma ofCharacter_apply (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) (g : G) (a : A) :
    (ofCharacter χ hχ).obj.ρ g a = (χ g : A) * a := by sorry
def twist (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    SmoothRep A G ≌ SmoothRep A G := by sorry
lemma invariants_twist (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ)
    (V : SmoothRep A G) (U : Subgroup G) (hU : U ≤ χ.ker) :
    Nonempty (invariants ((twist χ hχ).functor.obj V) U ≃ₗ[A] invariants V U) := by sorry
-- TauCeti.SmoothRep.twist_ofCharacter
example (χ ψ : G →* Aˣ) (hχ : IsSmoothCharacter χ) (hψ : IsSmoothCharacter ψ) :
    Nonempty ((twist ψ hψ).functor.obj (ofCharacter χ hχ) ≅
      ofCharacter (χ * ψ) (hχ.mul hψ)) := by sorry

def smoothDual (V : SmoothRep A G) : SmoothRep A G := by
  let S := Representation.smoothVectors (_root_.Representation.dual V.obj.ρ)
  refine ⟨_root_.Rep.of (X := S.toSubmodule) S.toRepresentation, ?_⟩
  exact Representation.smoothVectors_isSmooth (_root_.Representation.dual V.obj.ρ)
def smoothDualFunctor : (SmoothRep A G)ᵒᵖ ⥤ SmoothRep A G := by sorry
instance smoothDualFunctor_additive :
    (smoothDualFunctor (A := A) (G := G)).Additive := by sorry
def homSmoothDualEquiv (V W : SmoothRep A G) :
    (V ⟶ smoothDual W) ≃ₗ[A] (W ⟶ smoothDual V) := by sorry
def toDoubleDual (V : SmoothRep A G) : V ⟶ smoothDual (smoothDual V) := by sorry
def invariants_smoothDual (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) :
    invariants (smoothDual V) U.1.toSubgroup ≃ₗ[A]
      Module.Dual A (invariants V U.1.toSubgroup) := by sorry
lemma toDoubleDual_bijective_iff {k : Type u} [Field k]
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (hG : HasCofinalUnitProOrder k G) (V : SmoothRep k G) :
    Function.Bijective (toDoubleDual V).hom.hom ↔ Representation.IsAdmissible V.obj.ρ := by sorry
lemma smoothDual_exact {k : Type u} [Field k]
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (hG : HasCofinalUnitProOrder k G) (S : ShortComplex (SmoothRep k G))
    (hS : S.ShortExact) :
    (S.op.map smoothDualFunctor).ShortExact := by sorry
def smoothDual_eq_dual [DiscreteTopology G] (V : SmoothRep A G) :
    (smoothDual V).obj ≅ _root_.Rep.of (_root_.Representation.dual V.obj.ρ) := by sorry
-- TauCeti.SmoothRep.smoothDual_character
example (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (smoothDual (ofCharacter χ hχ) ≅ ofCharacter χ⁻¹ (by sorry)) := by sorry
-- TauCeti.SmoothRep.smoothDual_zero
example : IsZero (smoothDual (of (_root_.Representation.trivial A G (Fin 0 → A)) (by sorry))) := by sorry
-- TauCeti.SmoothRep.smoothDual_eq_dual_test
example [DiscreteTopology G] (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty ((smoothDual (ofCharacter χ hχ)).obj ≅
      _root_.Rep.of (_root_.Representation.dual (ofCharacter χ hχ).obj.ρ)) := by sorry

def baseChange {B : Type u} [CommRing B] [Algebra A B] :
    SmoothRep A G ⥤ SmoothRep B G := by sorry
def restrictScalars {B : Type u} [CommRing B] [Algebra A B] :
    SmoothRep B G ⥤ SmoothRep A G := by sorry
def baseChangeAdjunction {B : Type u} [CommRing B] [Algebra A B] :
    (baseChange (A := A) (G := G) (B := B)) ⊣ restrictScalars := by sorry
def baseChangeInvariants {B : Type u} [CommRing B] [Algebra A B]
    (V : SmoothRep A G) (U : Subgroup G) :
    B ⊗[A] invariants V U →ₗ[B]
      invariants ((baseChange (B := B)).obj V) U := by sorry
lemma baseChangeInvariants_bijective_of_flat {B : Type u} [CommRing B]
    [Algebra A B] [Module.Flat A B] (V : SmoothRep A G) (U : CompactOpenSubgroup G) :
    Function.Bijective (baseChangeInvariants (B := B) V U.1.toSubgroup) := by sorry
lemma baseChangeInvariants_bijective_of_unit {B : Type u} [CommRing B]
    [Algebra A B] (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) :
    Function.Bijective (baseChangeInvariants (B := B) V U.1.toSubgroup) := by sorry
def twistRingAut (σ : A ≃+* A) : SmoothRep A G ≌ SmoothRep A G := by sorry
def baseChange_eq_representation_baseChange {B : Type u} [CommRing B] [Algebra A B]
    (V : SmoothRep A G) :
    ((baseChange (B := B)).obj V).obj ≅
      _root_.Rep.of (_root_.Representation.baseChange B V.obj.ρ) := by sorry
-- TauCeti.SmoothRep.baseChange_id
example : Nonempty (baseChange (A := A) (G := G) (B := A) ≅ 𝟭 (SmoothRep A G)) := by sorry
-- TauCeti.SmoothRep.baseChange_compat_test
example {B : Type u} [CommRing B] [Algebra A B] (V : SmoothRep A G) :
    Nonempty (((baseChange (B := B)).obj V).obj ≅
      _root_.Rep.of (_root_.Representation.baseChange B V.obj.ρ)) := by sorry
end SmoothRep

abbrev SmoothCentre (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] := CatCenter (SmoothRep A G)
namespace SmoothCentre
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
def app (z : SmoothCentre A G) (V : SmoothRep A G) : End V := NatTrans.app z V
lemma naturality (z : SmoothCentre A G) {V W : SmoothRep A G} (f : V ⟶ W) :
    app z V ≫ f = f ≫ app z W := by sorry
lemma ext {z z' : SmoothCentre A G} (h : ∀ V, app z V = app z' V) : z = z' := by sorry
def algebraMap : A →+* SmoothCentre A G := Linear.toCatCenter A (SmoothRep A G)
instance instCommRing : CommRing (SmoothCentre A G) := by sorry
-- TauCeti.SmoothCentre.trivialGroup
example (A : Type) [CommRing A] : Nonempty (SmoothCentre A PUnit ≃+* A) := by sorry
-- TauCeti.SmoothCentre.finite_eq_center
example [Finite G] [DiscreteTopology G] :
    Nonempty (SmoothCentre A G ≃+* Subring.center (MonoidAlgebra A G)) := by sorry
-- TauCeti.SmoothCentre.int_discrete
example (A : Type) [CommRing A] :
    Nonempty (SmoothCentre A (Multiplicative ℤ) ≃+* MonoidAlgebra A (Multiplicative ℤ)) := by sorry
end SmoothCentre


-- Concrete test carriers. Multiplicative ℚ_p and ℤ_p denote their additive groups.
def padicIntegerCompactOpen (p : ℕ) [Fact p.Prime] :
    CompactOpenSubgroup (Multiplicative ℚ_[p]) := by sorry
lemma mem_padicIntegerCompactOpen (p : ℕ) [Fact p.Prime]
    (x : Multiplicative ℚ_[p]) :
    x ∈ (padicIntegerCompactOpen p).1 ↔ ‖x.toAdd‖ ≤ 1 := by sorry

def padicCongruence (p n : ℕ) [Fact p.Prime] :
    OpenNormalSubgroup (Multiplicative ℤ_[p]) := by sorry
lemma mem_padicCongruence (p n : ℕ) [Fact p.Prime]
    (x : Multiplicative ℤ_[p]) :
    x ∈ padicCongruence p n ↔ ‖x.toAdd‖ ≤ (p : ℝ) ^ (-(n : ℤ)) := by sorry

namespace Representation
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
def piRepresentation {I : Type u} {M : I → Type u}
    [∀ i, AddCommGroup (M i)] [∀ i, Module A (M i)]
    (ρ : ∀ i, _root_.Representation A G (M i)) :
    _root_.Representation A G (∀ i, M i) := by sorry
lemma piRepresentation_apply {I : Type u} {M : I → Type u}
    [∀ i, AddCommGroup (M i)] [∀ i, Module A (M i)]
    (ρ : ∀ i, _root_.Representation A G (M i)) (g : G) (v : ∀ i, M i) (i : I) :
    piRepresentation ρ g v i = ρ i g (v i) := by sorry

def rightTranslation : _root_.Representation A G (G → A) := by sorry
lemma rightTranslation_apply (g x : G) (f : G → A) :
    rightTranslation g f x = f (x * g) := by sorry
-- TauCeti.Representation.smoothVectors_product_ne_top
example (p : ℕ) [Fact p.Prime] :
    smoothVectors (piRepresentation (fun n : ℕ ↦
      _root_.Representation.ofMulAction ℤ (Multiplicative ℤ_[p])
        (Multiplicative ℤ_[p] ⧸ (padicCongruence p n).toSubgroup))) ≠ ⊤ := by sorry
-- TauCeti.Representation.smoothVectors_functions_eq_locallyConstant
example (p : ℕ) [Fact p.Prime] (f : Multiplicative ℤ_[p] → ℤ) :
    f ∈ smoothVectors rightTranslation ↔ IsLocallyConstant f := by sorry

lemma fg_iff_module_finite [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A G V) (hρ : IsSmooth ρ) :
    Module.Finite (MonoidAlgebra A G) ρ.asModule ↔
      ∃ (n : ℕ) (U : Fin n → CompactOpenSubgroup G)
        (f : _root_.Representation.IntertwiningMap
          (_root_.Representation.directSum (fun i ↦
            _root_.Representation.ofMulAction A G (G ⧸ (U i).1.toSubgroup))) ρ),
        Function.Surjective f := by sorry
-- TauCeti.Representation.fg_iff_quotient_permutation
example [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    {V : Type u} [AddCommGroup V] [Module A V]
    (ρ : _root_.Representation A G V) (hρ : IsSmooth ρ) :
    Module.Finite (MonoidAlgebra A G) ρ.asModule ↔
      ∃ (n : ℕ) (U : Fin n → CompactOpenSubgroup G)
        (f : _root_.Representation.IntertwiningMap
          (_root_.Representation.directSum (fun i ↦
            _root_.Representation.ofMulAction A G (G ⧸ (U i).1.toSubgroup))) ρ),
        Function.Surjective f := by sorry
-- TauCeti.Representation.isAdmissible_quotient_compact
example (p n : ℕ) [Fact p.Prime] :
    IsAdmissible (_root_.Representation.ofMulAction ℚ (Multiplicative ℤ_[p])
      (Multiplicative ℤ_[p] ⧸ (padicCongruence p n).toSubgroup)) ∧
    Module.finrank ℚ (_root_.Representation.invariants
      (_root_.Representation.ofMulAction ℚ (Multiplicative ℤ_[p])
        (Multiplicative ℤ_[p] ⧸ (padicCongruence p n).toSubgroup))) = 1 := by sorry
-- TauCeti.Representation.not_isAdmissible_cInd_qp
example (p : ℕ) [Fact p.Prime] :
    IsSmooth (_root_.Representation.ofMulAction ℚ (Multiplicative ℚ_[p])
      (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup)) ∧
    ¬ IsAdmissible (_root_.Representation.ofMulAction ℚ (Multiplicative ℚ_[p])
      (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup)) := by sorry
-- TauCeti.Representation.fg_not_admissible
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.ofMulAction ℚ (Multiplicative ℚ_[p])
      (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup)
    Module.Finite (MonoidAlgebra ℚ (Multiplicative ℚ_[p])) ρ.asModule ∧
      ¬ IsAdmissible ρ := by sorry

lemma IsAdmissible.baseChange {B V : Type u} [CommRing B] [Algebra A B]
    [AddCommGroup V] [Module A V] (ρ : _root_.Representation A G V)
    (hρ : IsAdmissible ρ) (h : ∀ U : CompactOpenSubgroup G,
      Function.Bijective (SmoothRep.baseChangeInvariants (B := B)
        (SmoothRep.of ρ hρ.1) U.1.toSubgroup)) :
    IsAdmissible ((SmoothRep.baseChange (B := B)).obj (SmoothRep.of ρ hρ.1)).obj.ρ := by sorry
end Representation

lemma hasUnitProOrder_iff_profiniteOrder (A U : Type u) [CommRing A] [Group U]
    [TopologicalSpace U] [IsTopologicalGroup U] [T2Space U] [CompactSpace U]
    [TotallyDisconnectedSpace U] :
    HasUnitProOrder A U ↔ ∀ p : Nat.Primes,
      profiniteOrder U p ≠ 0 → IsUnit (p.1 : A) := by sorry

def padicUnramifiedCharacter (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime]
    (t : Aˣ) : (ℚ_[p])ˣ →* Aˣ := by sorry
lemma padicUnramifiedCharacter_apply (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime]
    (t : Aˣ) (x : (ℚ_[p])ˣ) :
    padicUnramifiedCharacter A p t x = t ^ (x : ℚ_[p]).valuation := by sorry
-- TauCeti.isSmoothCharacter_unramified
example (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime] (t : Aˣ) :
    IsSmoothCharacter (padicUnramifiedCharacter A p t) := by sorry
-- TauCeti.isSmoothCharacter_one
example (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : IsSmoothCharacter (1 : G →* Aˣ) ∧
    Nonempty ((SmoothRep.twist 1 (by sorry)).functor ≅ 𝟭 (SmoothRep A G)) := by sorry
-- TauCeti.not_isSmoothCharacter_padicIdentity
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmoothCharacter (MonoidHom.id (ℚ_[p])ˣ) := by sorry

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
def equivSmoothDiscreteTopRep [TopologicalSpace A] [DiscreteTopology A] :
    SmoothRep A G ≌ TauCeti.SmoothDiscreteTopRep A G := by sorry
-- TauCeti.SmoothRep.not_closed_under_extensions
example (p : ℕ) [Fact p.Prime] :
    ∃ ρ : _root_.Representation ℚ (Multiplicative ℤ_[p]) (ℚ × ℚ),
      ¬ Representation.IsSmooth ρ ∧
      (∀ g x, ρ g (x, 0) = (x, 0)) ∧ (∀ g x y, (ρ g (x,y)).2 = y) := by sorry
-- TauCeti.SmoothRep.invariants_not_exact_fp
example (p : ℕ) [Fact p.Prime] :
    ∀ v : _root_.Representation.invariants
      (_root_.Representation.ofMulAction (ZMod p) (Multiplicative (ZMod p))
        (Multiplicative (ZMod p))),
    ∑ g : Multiplicative (ZMod p), v.1.coeff g = 0 := by sorry
-- TauCeti.SmoothRep.toDoubleDual_not_surjective
example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (toDoubleDual
      (of (_root_.Representation.ofMulAction ℚ (Multiplicative ℚ_[p])
        (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup))
        (by sorry))).hom.hom := by sorry
-- TauCeti.SmoothRep.baseChangeInvariants_permutation
example {B : Type u} [CommRing B] [Algebra A B]
    (U' : OpenSubgroup G) (U : CompactOpenSubgroup G) :
    Function.Bijective (baseChangeInvariants (B := B)
      (of (_root_.Representation.ofMulAction A G (G ⧸ U'.toSubgroup)) (by sorry))
        U.1.toSubgroup) := by sorry

lemma averaging_eq_averageMap [Fintype G] (V : SmoothRep A G)
    (U : CompactOpenSubgroup G) (hU : U.1.toSubgroup = ⊤)
    (h : HasUnitProOrder A U.1) [Invertible (Fintype.card G : A)] :
    averaging V U h = _root_.Representation.averageMap V.obj.ρ := by sorry
-- TauCeti.SmoothRep.averaging_trivial
example (U : CompactOpenSubgroup G) (hU : HasUnitProOrder A U.1) :
    averaging (of (_root_.Representation.trivial A G A) (by sorry)) U hU =
      LinearMap.id := by sorry
-- TauCeti.SmoothRep.averaging_eq_averageMap_test
example [Fintype G] (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : U.1.toSubgroup = ⊤) (h : HasUnitProOrder A U.1)
    [Invertible (Fintype.card G : A)] :
    averaging V U h = _root_.Representation.averageMap V.obj.ρ := by sorry
-- TauCeti.SmoothRep.averaging_requires_unit
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.ofMulAction (ZMod p)
      (Multiplicative (ZMod p)) (Multiplicative (ZMod p))
    ¬ ∃ e : _root_.Representation.IntertwiningMap ρ ρ,
      LinearMap.range e.toLinearMap = _root_.Representation.invariants ρ ∧
        e.toLinearMap.comp e.toLinearMap = e.toLinearMap := by sorry
end SmoothRep


-- SR.1: test functions use the existing locally constant carrier.
def compactSupportSubmodule (A X M : Type u) [CommRing A]
    [TopologicalSpace X] [AddCommGroup M] [Module A M] :
    Submodule A (LocallyConstant X M) := by sorry
lemma mem_compactSupportSubmodule (A X M : Type u) [CommRing A]
    [TopologicalSpace X] [AddCommGroup M] [Module A M] (f : LocallyConstant X M) :
    f ∈ compactSupportSubmodule A X M ↔ HasCompactSupport f := by sorry
abbrev LocallyConstantCompact (A X M : Type u) [CommRing A]
    [TopologicalSpace X] [AddCommGroup M] [Module A M] :=
    ↥(compactSupportSubmodule A X M)

namespace LocallyConstantCompact
variable {A X Y M N : Type u} [CommRing A] [TopologicalSpace X]
  [TopologicalSpace Y] [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
def coeFn (f : LocallyConstantCompact A X M) : X → M := f.1
instance : CoeFun (LocallyConstantCompact A X M) (fun _ ↦ X → M) := ⟨coeFn⟩
lemma ext {f g : LocallyConstantCompact A X M} (h : ∀ x, f x = g x) : f = g := by sorry
lemma hasCompactSupport (f : LocallyConstantCompact A X M) : HasCompactSupport f := by sorry

def indicator (K : TopologicalSpace.CompactOpens X) (m : M) :
    LocallyConstantCompact A X M := by sorry
lemma indicator_apply (K : TopologicalSpace.CompactOpens X) (m : M) (x : X) :
    indicator (A := A) K m x = if x ∈ (K : Set X) then m else 0 := by classical sorry
lemma span_indicator [T2Space X] [LocallyCompactSpace X] [TotallyDisconnectedSpace X] :
    Submodule.span A (Set.range (fun p : TopologicalSpace.CompactOpens X × M ↦
      indicator (A := A) p.1 p.2)) = ⊤ := by sorry
lemma exists_disjoint_presentation [T2Space X] [LocallyCompactSpace X]
    [TotallyDisconnectedSpace X] (f : LocallyConstantCompact A X M) :
    ∃ (n : ℕ) (K : Fin n → TopologicalSpace.CompactOpens X) (m : Fin n → M),
      (∀ i j, i ≠ j → Disjoint (K i : Set X) (K j : Set X)) ∧
      f = ∑ i, indicator (K i) (m i) := by sorry

def map (φ : M →ₗ[A] N) : LocallyConstantCompact A X M →ₗ[A]
    LocallyConstantCompact A X N := by sorry
lemma map_apply (φ : M →ₗ[A] N) (f : LocallyConstantCompact A X M) (x : X) :
    map φ f x = φ (f x) := by sorry

def extensionByZero (U : Set X) (hU : IsOpen U) :
    LocallyConstantCompact A U M →ₗ[A] LocallyConstantCompact A X M := by sorry
lemma extensionByZero_apply (U : Set X) (hU : IsOpen U)
    (f : LocallyConstantCompact A U M) (x : X) :
    extensionByZero U hU f x = if h : x ∈ U then f ⟨x,h⟩ else 0 := by classical sorry

def restrictClosed (Z : Set X) (hZ : IsClosed Z) :
    LocallyConstantCompact A X M →ₗ[A] LocallyConstantCompact A Z M := by sorry
lemma restrictClosed_apply (Z : Set X) (hZ : IsClosed Z)
    (f : LocallyConstantCompact A X M) (x : Z) : restrictClosed Z hZ f x = f x := by sorry
lemma shortExact_open_closed [T2Space X] [LocallyCompactSpace X]
    [TotallyDisconnectedSpace X] (U : Set X) (hU : IsOpen U) :
    Function.Injective (extensionByZero (A := A) (M := M) U hU) ∧
      LinearMap.range (extensionByZero (A := A) (M := M) U hU) =
        LinearMap.ker (restrictClosed (A := A) (M := M) Uᶜ hU.isClosed_compl) ∧
      Function.Surjective (restrictClosed (A := A) (M := M) Uᶜ hU.isClosed_compl) := by sorry

def coverAugmentation {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i)) :
    (⨁ i, LocallyConstantCompact A (U i) M) →ₗ[A] LocallyConstantCompact A X M := by sorry
lemma coverAugmentation_apply {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i))
    (i : I) (f : LocallyConstantCompact A (U i) M) :
    coverAugmentation U hU (DirectSum.of _ i f) = extensionByZero (U i) (hU i) f := by sorry

def coverRelations {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i)) :
    (⨁ ij : I × I, LocallyConstantCompact A ↥(U ij.1 ∩ U ij.2) M) →ₗ[A]
      (⨁ i, LocallyConstantCompact A (U i) M) := by sorry
-- Both inclusions are open embeddings; the two terms carry opposite signs.
def intersectionToLeft {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i))
    (i j : I) : LocallyConstantCompact A ↥(U i ∩ U j) M →ₗ[A]
      LocallyConstantCompact A (U i) M := by sorry
lemma intersectionToLeft_apply {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i))
    (i j : I) (f : LocallyConstantCompact A ↥(U i ∩ U j) M) (x : U i) :
    intersectionToLeft U hU i j f x =
      if h : x.1 ∈ U j then f ⟨x.1, x.2, h⟩ else 0 := by sorry
lemma coverRelations_apply {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i))
    (i j : I) (f : LocallyConstantCompact A ↥(U i ∩ U j) M)
    (f' : LocallyConstantCompact A ↥(U j ∩ U i) M) (hf' : ∀ x (hx : x ∈ U j ∩ U i), f' ⟨x,hx⟩ = f ⟨x,⟨hx.2,hx.1⟩⟩) :
    coverRelations U hU (DirectSum.of _ (i,j) f) =
      DirectSum.of _ i (intersectionToLeft U hU i j f) -
        DirectSum.of _ j (intersectionToLeft U hU j i f') := by sorry

lemma cosheaf [T2Space X] [LocallyCompactSpace X] [TotallyDisconnectedSpace X]
    {I : Type u} (U : I → Set X) (hU : ∀ i, IsOpen (U i)) (hcover : ⋃ i, U i = Set.univ) :
    Function.Surjective (coverAugmentation (A := A) (M := M) U hU) ∧
      LinearMap.range (coverRelations (A := A) (M := M) U hU) =
        LinearMap.ker (coverAugmentation (A := A) (M := M) U hU) := by sorry

def tensorEquiv [T2Space X] [LocallyCompactSpace X] [TotallyDisconnectedSpace X]
    [T2Space Y] [LocallyCompactSpace Y] [TotallyDisconnectedSpace Y] :
    LocallyConstantCompact A (X × Y) A ≃ₗ[A]
      LocallyConstantCompact A X A ⊗[A] LocallyConstantCompact A Y A := by sorry

def equivCompactlySupported [TopologicalSpace A] [DiscreteTopology A]
    [TopologicalSpace M] [DiscreteTopology M] [ContinuousSMul A M] :
    LocallyConstantCompact A X M ≃ₗ[A] CompactlySupportedContinuousMap X M := by sorry

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
def translate : _root_.Representation A G (LocallyConstantCompact A G M) := by sorry
lemma translate_apply (g x : G) (f : LocallyConstantCompact A G M) :
    translate g f x = f (g⁻¹ * x) := by sorry
lemma translate_isSmooth : Representation.IsSmooth
    (translate (A := A) (G := G) (M := M)) := by sorry
lemma exists_rightStable (K : TopologicalSpace.CompactOpens G) :
    ∃ U : CompactOpenSubgroup G, ∀ x : G, ∀ u : U.1,
      x * u ∈ (K : Set G) ↔ x ∈ (K : Set G) := by sorry
lemma exists_biinvariant (f : LocallyConstantCompact A G M) :
    ∃ U : CompactOpenSubgroup G, ∀ x : G, ∀ u : U.1,
      f (u * x) = f x ∧ f (x * u) = f x := by sorry

def rightInvariantSubmodule (U : CompactOpenSubgroup G) :
    Submodule A (LocallyConstantCompact A G M) := by sorry
lemma mem_rightInvariantSubmodule (U : CompactOpenSubgroup G)
    (f : LocallyConstantCompact A G M) :
    f ∈ rightInvariantSubmodule U ↔ ∀ x : G, ∀ u : U.1, f (x * u) = f x := by sorry
def equivFinsuppQuotient (U : CompactOpenSubgroup G) :
    rightInvariantSubmodule (A := A) (M := M) U ≃ₗ[A]
      (G ⧸ U.1.toSubgroup →₀ M) := by sorry
-- TauCeti.LocallyConstantCompact.finite_eq_pi
example : Nonempty (LocallyConstantCompact ℤ (Fin 3) ℤ ≃ₗ[ℤ] (Fin 3 → ℤ)) := by sorry
-- TauCeti.LocallyConstantCompact.empty
example [IsEmpty X] (f : LocallyConstantCompact A X M) : f = 0 := by sorry
-- TauCeti.LocallyConstantCompact.real_eq_zero
example (f : LocallyConstantCompact ℤ ℝ ℤ) : f = 0 := by sorry
-- TauCeti.LocallyConstantCompact.compat_discrete
example (p : ℕ) [Fact p.Prime] :
    Nonempty (LocallyConstantCompact ℤ ℤ_[p] ℤ ≃ₗ[ℤ]
      CompactlySupportedContinuousMap ℤ_[p] ℤ) := by sorry
end LocallyConstantCompact

-- Real conditions, rather than an opaque Haar axiom: finite additivity and left invariance.
def translateCompactOpen {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (g : G) (K : TopologicalSpace.CompactOpens G) :
    TopologicalSpace.CompactOpens G := by sorry
lemma mem_translateCompactOpen {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (g x : G) (K : TopologicalSpace.CompactOpens G) :
    x ∈ (translateCompactOpen g K : Set G) ↔ g⁻¹ * x ∈ (K : Set G) := by sorry

def compactOpenSet {G : Type u} [Group G] [TopologicalSpace G]
    (U : CompactOpenSubgroup G) : TopologicalSpace.CompactOpens G :=
  ⟨⟨(U.1 : Set G), U.2⟩, U.1.isOpen⟩

structure HaarMeasureWithValues (A G : Type u) [CommRing A] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] where
  measure : TopologicalSpace.CompactOpens G → A
  empty : measure ⊥ = 0
  add_union : ∀ (K L : TopologicalSpace.CompactOpens G), Disjoint (K : Set G) (L : Set G) →
    measure (K ⊔ L) = measure K + measure L
  left_invariant : ∀ g K, measure (translateCompactOpen g K) = measure K

namespace HaarMeasureWithValues
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G]
  [TopologicalSpace G] [IsTopologicalGroup G]
instance : CoeFun (HaarMeasureWithValues A G)
    (fun _ ↦ TopologicalSpace.CompactOpens G → A) := ⟨HaarMeasureWithValues.measure⟩
def normalized [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) :
    HaarMeasureWithValues A G := by sorry
lemma normalized_apply [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) :
    normalized U₀ hU₀ (compactOpenSet U₀) = 1 := by sorry
lemma ext [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    {μ ν : HaarMeasureWithValues A G} (U₀ : CompactOpenSubgroup G)
    (hU₀ : HasUnitProOrder A U₀.1) (h : μ (compactOpenSet U₀) = ν (compactOpenSet U₀)) :
    μ = ν := by sorry

def map (φ : A →+* B) (μ : HaarMeasureWithValues A G) : HaarMeasureWithValues B G := by sorry
lemma map_apply (φ : A →+* B) (μ : HaarMeasureWithValues A G)
    (K : TopologicalSpace.CompactOpens G) : map φ μ K = φ (μ K) := by sorry
lemma apply_subgroup [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ U : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) :
    normalized U₀ hU₀ (compactOpenSet U) *
      ((U₀.1.toSubgroup ⊓ U.1.toSubgroup).relIndex U₀.1.toSubgroup : A) =
      ((U₀.1.toSubgroup ⊓ U.1.toSubgroup).relIndex U.1.toSubgroup : A) := by sorry
lemma isUnit_apply_iff [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ U : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) :
    IsUnit (normalized U₀ hU₀ (compactOpenSet U)) ↔ HasUnitProOrder A U.1 := by sorry

def modularCharacter [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) : G →* Aˣ := by sorry
lemma modularCharacter_apply [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) (g : G)
    (K : TopologicalSpace.CompactOpens G) :
    normalized U₀ hU₀ (translateCompactOpen g K) = normalized U₀ hU₀ K := by sorry
-- Right-translation scaling is listed separately from the left-translation defining axiom.
def rightTranslateCompactOpen (g : G) (K : TopologicalSpace.CompactOpens G) :
    TopologicalSpace.CompactOpens G := by sorry
lemma mem_rightTranslateCompactOpen (g x : G) (K : TopologicalSpace.CompactOpens G) :
    x ∈ (rightTranslateCompactOpen g K : Set G) ↔ x * g⁻¹ ∈ (K : Set G) := by sorry
lemma rightTranslate_measure [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) (g : G)
    (K : TopologicalSpace.CompactOpens G) :
    normalized U₀ hU₀ (rightTranslateCompactOpen g⁻¹ K) =
      (modularCharacter U₀ hU₀ g : A) * normalized U₀ hU₀ K := by sorry
-- TauCeti.HaarMeasureWithValues.no_fp_measure
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : HaarMeasureWithValues (ZMod p) (Multiplicative ℤ_[p]),
      μ ⟨⟨Set.univ, isCompact_univ⟩, isOpen_univ⟩ = 1 := by sorry
-- TauCeti.HaarMeasureWithValues.finite_counting
example [Fintype G] [DiscreteTopology G] (μ : HaarMeasureWithValues A G)
    (hμ : μ ⟨⟨{1}, by sorry⟩, by sorry⟩ = 1) (K : TopologicalSpace.CompactOpens G) :
    μ K = (Nat.card K : A) := by sorry
end HaarMeasureWithValues


abbrev ZInvert (p : ℕ) := Localization.Away (p : ℤ)
def padicBallCompactOpen (p : ℕ) [Fact p.Prime] (n : ℤ) :
    CompactOpenSubgroup (Multiplicative ℚ_[p]) := by sorry
lemma mem_padicBallCompactOpen (p : ℕ) [Fact p.Prime] (n : ℤ)
    (x : Multiplicative ℚ_[p]) :
    x ∈ (padicBallCompactOpen p n).1 ↔ ‖x.toAdd‖ ≤ (p : ℝ) ^ (-n) := by sorry

def countingMeasure (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] : HaarMeasureWithValues A G := by sorry
lemma countingMeasure_apply (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] (K : TopologicalSpace.CompactOpens G) :
    countingMeasure A G K = (Nat.card K : A) := by sorry

def padicHaar (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime]
    (hp : IsUnit (p : A)) : HaarMeasureWithValues A (Multiplicative ℚ_[p]) :=
  HaarMeasureWithValues.normalized (padicIntegerCompactOpen p) (by sorry)
lemma padicHaar_normalized (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime]
    (hp : IsUnit (p : A)) :
    padicHaar A p hp (compactOpenSet (padicIntegerCompactOpen p)) = 1 := by sorry
namespace HaarMeasureWithValues
-- TauCeti.HaarMeasureWithValues.padic_apply
example (p : ℕ) [Fact p.Prime] (n : ℤ) :
    padicHaar (ZInvert p) p (by sorry) (compactOpenSet (padicBallCompactOpen p n)) =
      (↑((IsUnit.unit (show IsUnit (p : ZInvert p) from by sorry)) ^ (-n)) : ZInvert p) := by sorry
lemma eq_haarMeasure {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder ℝ U₀.1)
    (K : TopologicalSpace.CompactOpens G) :
    normalized U₀ hU₀ K =
      (MeasureTheory.Measure.haar (G := G) (K : Set G)).toReal /
        (MeasureTheory.Measure.haar (G := G) (U₀.1 : Set G)).toReal := by sorry
-- TauCeti.HaarMeasureWithValues.real_compat
example (p : ℕ) [Fact p.Prime] [MeasurableSpace (Multiplicative ℚ_[p])]
    [BorelSpace (Multiplicative ℚ_[p])] (n : ℤ) :
    padicHaar ℝ p (by sorry) (compactOpenSet (padicBallCompactOpen p n)) =
      (MeasureTheory.Measure.haar (G := Multiplicative ℚ_[p])
        ((padicBallCompactOpen p n).1 : Set (Multiplicative ℚ_[p]))).toReal /
      (MeasureTheory.Measure.haar (G := Multiplicative ℚ_[p])
        ((padicIntegerCompactOpen p).1 : Set (Multiplicative ℚ_[p]))).toReal := by sorry
end HaarMeasureWithValues

namespace LocallyConstantCompact
variable {A G M N : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
  [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
def integral (μ : HaarMeasureWithValues A G) : LocallyConstantCompact A G M →ₗ[A] M := by sorry
lemma integral_indicator (μ : HaarMeasureWithValues A G)
    (K : TopologicalSpace.CompactOpens G) (m : M) :
    integral μ (indicator K m) = μ K • m := by sorry
lemma integral_translate (μ : HaarMeasureWithValues A G)
    (f : LocallyConstantCompact A G M) (g : G) :
    integral μ (translate g f) = integral μ f := by sorry
lemma integral_map (μ : HaarMeasureWithValues A G) (φ : M →ₗ[A] N)
    (f : LocallyConstantCompact A G M) :
    integral μ (map φ f) = φ (integral μ f) := by sorry

def productMeasure (μ : HaarMeasureWithValues A G) : HaarMeasureWithValues A (G × G) := by sorry
lemma productMeasure_prod (μ : HaarMeasureWithValues A G)
    (K L : TopologicalSpace.CompactOpens G) :
    productMeasure μ (K ×ˢ L) = μ K * μ L := by sorry

def integrateFirst (μ : HaarMeasureWithValues A G)
    (f : LocallyConstantCompact A (G × G) M) : LocallyConstantCompact A G M := by sorry
lemma integral_prod (μ : HaarMeasureWithValues A G)
    (f : LocallyConstantCompact A (G × G) M) :
    integral (productMeasure μ) f = integral μ (integrateFirst μ f) := by sorry

def baseChangeFunctions {B : Type u} [CommRing B] [Algebra A B] :
    B ⊗[A] LocallyConstantCompact A G M →ₗ[B]
      LocallyConstantCompact B G (B ⊗[A] M) := by sorry
lemma integral_baseChange {B : Type u} [CommRing B] [Algebra A B]
    (μ : HaarMeasureWithValues A G) (b : B) (f : LocallyConstantCompact A G M) :
    integral (HaarMeasureWithValues.map (algebraMap A B) μ)
      (baseChangeFunctions (b ⊗ₜ[A] f)) = b ⊗ₜ[A] integral μ f := by sorry
-- TauCeti.LocallyConstantCompact.integral_zero
example (μ : HaarMeasureWithValues A G) : integral μ (0 : LocallyConstantCompact A G M) = 0 := by sorry
-- TauCeti.LocallyConstantCompact.integral_finite_sum
example [Fintype G] [DiscreteTopology G] (f : LocallyConstantCompact A G M) :
    integral (countingMeasure A G) f = ∑ g, f g := by sorry
-- TauCeti.LocallyConstantCompact.integral_padic
example (p : ℕ) [Fact p.Prime] (n : ℤ) :
    integral (padicHaar (ZInvert p) p (by sorry))
      (indicator (compactOpenSet (padicBallCompactOpen p n)) (1 : ZInvert p)) =
        (↑((IsUnit.unit (show IsUnit (p : ZInvert p) from by sorry)) ^ (-n)) : ZInvert p) := by sorry
-- The real modular character supplies the precise unimodularity hypothesis.
-- TauCeti.LocallyConstantCompact.integral_right_invariant_unimodular
example (μ : HaarMeasureWithValues A G)
    (hG : MeasureTheory.Measure.modularCharacter (G := G) = 1)
    (f f' : LocallyConstantCompact A G M) (g : G)
    (hf' : ∀ x, f' x = f (x * g)) : integral μ f' = integral μ f := by sorry
end LocallyConstantCompact

-- The measure is part of this type synonym; distinct normalisations have distinct products.
def HeckeAlgebra {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (μ : HaarMeasureWithValues A G) := LocallyConstantCompact A G A
namespace HeckeAlgebra
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
  (μ : HaarMeasureWithValues A G)
instance instNonUnitalRing : NonUnitalRing (HeckeAlgebra μ) := by sorry
instance instModule : Module A (HeckeAlgebra μ) := by sorry
def toTestFunction : HeckeAlgebra μ →ₗ[A] LocallyConstantCompact A G A := by sorry
instance : CoeFun (HeckeAlgebra μ) (fun _ ↦ G → A) := ⟨fun f ↦ toTestFunction μ f⟩
def ofTestFunction : LocallyConstantCompact A G A →ₗ[A] HeckeAlgebra μ := by sorry
lemma of_toTestFunction (f : HeckeAlgebra μ) : ofTestFunction μ (toTestFunction μ f) = f := by sorry
lemma to_ofTestFunction (f : LocallyConstantCompact A G A) : toTestFunction μ (ofTestFunction μ f) = f := by sorry

def convolutionIntegrand (f₁ f₂ : HeckeAlgebra μ) (x : G) :
    LocallyConstantCompact A G A := by sorry
lemma convolutionIntegrand_apply (f₁ f₂ : HeckeAlgebra μ) (x y : G) :
    convolutionIntegrand μ f₁ f₂ x y = f₁ y * f₂ (y⁻¹ * x) := by sorry
lemma mul_apply (f₁ f₂ : HeckeAlgebra μ) (x : G) :
    (f₁ * f₂) x = LocallyConstantCompact.integral μ (convolutionIntegrand μ f₁ f₂ x) := by sorry
lemma support_mul_subset (f₁ f₂ : HeckeAlgebra μ) :
    Function.support (f₁ * f₂) ⊆ Function.support f₁ * Function.support f₂ := by sorry

def indicator (K : TopologicalSpace.CompactOpens G) : HeckeAlgebra μ :=
  ofTestFunction μ (LocallyConstantCompact.indicator K 1)
lemma indicator_mul_indicator (U : CompactOpenSubgroup G) :
    indicator μ (compactOpenSet U) * indicator μ (compactOpenSet U) =
      μ (compactOpenSet U) • indicator μ (compactOpenSet U) := by sorry

def involution (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1)
    (hμ : μ = HaarMeasureWithValues.normalized U₀ hU₀) :
    HeckeAlgebra μ ≃+* (HeckeAlgebra μ)ᵐᵒᵖ := by sorry
lemma involution_apply (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1)
    (hμ : μ = HaarMeasureWithValues.normalized U₀ hU₀) (f : HeckeAlgebra μ) (g : G) :
    MulOpposite.unop (involution μ U₀ hU₀ hμ f) g =
      f g⁻¹ * (HaarMeasureWithValues.modularCharacter U₀ hU₀ g⁻¹ : A) := by sorry

def smul (V : SmoothRep A G) : HeckeAlgebra μ →ₗ[A] V.obj →ₗ[A] V.obj := by sorry
lemma smul_mul (V : SmoothRep A G) (f₁ f₂ : HeckeAlgebra μ) (v : V.obj) :
    smul μ V (f₁ * f₂) v = smul μ V f₁ (smul μ V f₂ v) := by sorry

def baseChangeEquiv [Algebra A B] :
    B ⊗[A] HeckeAlgebra μ ≃ₗ[B]
      HeckeAlgebra (HaarMeasureWithValues.map (algebraMap A B) μ) := by sorry

def equivMonoidAlgebra [Fintype G] [DiscreteTopology G] :
    HeckeAlgebra (countingMeasure A G) ≃+* MonoidAlgebra A G := by sorry
-- TauCeti.HeckeAlgebra.finite_compat
example : Nonempty (HeckeAlgebra (countingMeasure ℤ (Multiplicative (ZMod 3))) ≃+*
    MonoidAlgebra ℤ (Multiplicative (ZMod 3))) := by sorry
-- TauCeti.HeckeAlgebra.trivial_group
example (A : Type) [CommRing A] :
    Nonempty (HeckeAlgebra (countingMeasure A PUnit) ≃+* A) := by sorry
-- TauCeti.HeckeAlgebra.indicator_padic
example (p : ℕ) [Fact p.Prime] :
    let μ := padicHaar (ZInvert p) p (by sorry)
    let f := indicator μ (compactOpenSet (padicBallCompactOpen p 1))
    f * f = (↑((IsUnit.unit (show IsUnit (p : ZInvert p) from by sorry))⁻¹) : ZInvert p) • f := by sorry
-- TauCeti.HeckeAlgebra.no_one
example (p : ℕ) [Fact p.Prime] :
    let μ := padicHaar ℚ p (by sorry)
    ¬ ∃ e : HeckeAlgebra μ, ∀ f : HeckeAlgebra μ, e * f = f ∧ f * e = f := by sorry

def idempotent (U : CompactOpenSubgroup G) (hU : IsUnit (μ (compactOpenSet U))) :
    HeckeAlgebra μ := (↑(hU.unit⁻¹) : A) • indicator μ (compactOpenSet U)
lemma idempotent_mul_self (U : CompactOpenSubgroup G) (hU : IsUnit (μ (compactOpenSet U))) :
    idempotent μ U hU * idempotent μ U hU = idempotent μ U hU := by sorry
lemma idempotent_mul_of_le (U U' : CompactOpenSubgroup G) (h : U'.1 ≤ U.1)
    (hU : IsUnit (μ (compactOpenSet U))) (hU' : IsUnit (μ (compactOpenSet U'))) :
    idempotent μ U hU * idempotent μ U' hU' = idempotent μ U hU ∧
    idempotent μ U' hU' * idempotent μ U hU = idempotent μ U hU := by sorry
lemma idempotent_mul_eq_iff (U : CompactOpenSubgroup G) (hU : IsUnit (μ (compactOpenSet U)))
    (f : HeckeAlgebra μ) :
    (idempotent μ U hU * f = f ↔ ∀ u : U.1, ∀ x, f (u * x) = f x) ∧
    (f * idempotent μ U hU = f ↔ ∀ u : U.1, ∀ x, f (x * u) = f x) := by sorry
lemma idempotent_smul (U₀ U : CompactOpenSubgroup G)
    (hU₀ : HasUnitProOrder A U₀.1) (hU : HasUnitProOrder A U.1)
    (hμ : μ = HaarMeasureWithValues.normalized U₀ hU₀) (V : SmoothRep A G)
    (hv : IsUnit (μ (compactOpenSet U))) :
    smul μ V (idempotent μ U hv) = SmoothRep.averaging V U hU := by sorry
lemma isLocallyUnital (hG : HasCofinalUnitProOrder A G)
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1)
    (hμ : μ = HaarMeasureWithValues.normalized U₀ hU₀) (s : Finset (HeckeAlgebra μ)) :
    ∃ (U : CompactOpenSubgroup G) (hU : IsUnit (μ (compactOpenSet U))),
      ∀ f ∈ s, idempotent μ U hU * f = f ∧ f * idempotent μ U hU = f := by sorry
-- TauCeti.HeckeAlgebra.idempotent_padic
example (p : ℕ) [Fact p.Prime] :
    let μ := padicHaar (ZInvert p) p (by sorry)
    idempotent μ (padicBallCompactOpen p 1) (by sorry) =
      (p : ZInvert p) • indicator μ (compactOpenSet (padicBallCompactOpen p 1)) := by sorry
-- TauCeti.HeckeAlgebra.no_idempotent_fp
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : HaarMeasureWithValues (ZMod p) (Multiplicative ℤ_[p]),
      IsUnit (μ ⟨⟨Set.univ, isCompact_univ⟩, isOpen_univ⟩) := by sorry
end HeckeAlgebra

end TauCeti


namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]

-- Coinduction already has exactly the right-translation convention required here.
def ind (H : Subgroup G) (σ : SmoothRep A H) : SmoothRep A G :=
  smoothPart.obj (_root_.Rep.coind H.subtype σ.obj)
def indFunctor (H : Subgroup G) : SmoothRep A H ⥤ SmoothRep A G :=
  ι ⋙ _root_.Rep.coindFunctor A H.subtype ⋙ smoothPart

def indFunction (H : Subgroup G) (σ : SmoothRep A H) : (ind H σ).obj →ₗ[A] (G → σ.obj) := by sorry
lemma ind_apply_mul (H : Subgroup G) (σ : SmoothRep A H)
    (f : (ind H σ).obj) (h : H) (g g' : G) :
    indFunction H σ f (h * g) = σ.obj.ρ h (indFunction H σ f g) ∧
    indFunction H σ ((ind H σ).obj.ρ g' f) g = indFunction H σ f (g * g') := by sorry

def indEval (H : Subgroup G) (σ : SmoothRep A H) :
    (res H.subtype continuous_subtype_val).obj (ind H σ) ⟶ σ := by sorry
lemma indEval_apply (H : Subgroup G) (σ : SmoothRep A H) (f : (ind H σ).obj) :
    (indEval H σ).hom.hom f = indFunction H σ f 1 := by sorry
lemma indEval_surjective (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : SmoothRep A H) : Function.Surjective (indEval H σ).hom.hom := by sorry
lemma indEval_nonzero_on_subrepresentation (H : Subgroup G) (σ : SmoothRep A H)
    (S : Subrepresentation (ind H σ).obj.ρ) (hS : S ≠ ⊥) :
    ∃ f ∈ S, (indEval H σ).hom.hom f ≠ 0 := by sorry

def ind_eq_smoothVectors_coind (H : Subgroup G) (σ : SmoothRep A H) :
    (ind H σ).obj ≅ _root_.Rep.of (X := (Representation.smoothVectors (_root_.Representation.coind H.subtype σ.obj.ρ)).toSubmodule)
      (Representation.smoothVectors (_root_.Representation.coind H.subtype σ.obj.ρ)).toRepresentation := by sorry

def ind_twist (H : Subgroup G) (σ : SmoothRep A H) (χ : G →* Aˣ)
    (hχ : TauCeti.IsSmoothCharacter χ) :
    ind H ((twist (χ.comp H.subtype) (by sorry)).functor.obj σ) ≅
      (twist χ hχ).functor.obj (ind H σ) := by sorry

-- Inversion sends the left coset Hg to the ordinary quotient coset g⁻¹H.
def projectedSupport {M : Type u} [Zero M] (H : Subgroup G) (f : G → M) : Set (G ⧸ H) :=
  (fun g : G ↦ ((g⁻¹ : G) : G ⧸ H)) '' Function.support f

def cIndSubrepresentation (H : Subgroup G) (σ : SmoothRep A H) :
    Subrepresentation (ind H σ).obj.ρ := by sorry
lemma cInd_mem_iff_support (H : Subgroup G) (σ : SmoothRep A H) (f : (ind H σ).obj) :
    f ∈ cIndSubrepresentation H σ ↔ IsCompact (projectedSupport H (indFunction H σ f)) := by sorry

def cInd (H : Subgroup G) (σ : SmoothRep A H) : SmoothRep A G :=
  of (cIndSubrepresentation H σ).toRepresentation (by sorry)
def cIndFunctor (H : Subgroup G) : SmoothRep A H ⥤ SmoothRep A G := by sorry
instance cIndFunctor_additive (H : Subgroup G) : (cIndFunctor (A := A) H).Additive := by sorry
instance indFunctor_additive (H : Subgroup G) : (indFunctor (A := A) H).Additive := by sorry

def cInd_eq_ind_of_compact (H : Subgroup G) (hH : IsClosed (H : Set G))
    [CompactSpace (G ⧸ H)] : cIndFunctor (A := A) H ≅ indFunctor H := by sorry

def cIndIsoInd (H : OpenSubgroup G) (σ : SmoothRep A H.toSubgroup) :
    (cInd H.toSubgroup σ).obj ≅ _root_.Rep.ind H.toSubgroup.subtype σ.obj := by sorry

def permutation (U : OpenSubgroup G) : SmoothRep A G :=
  of (_root_.Representation.ofMulAction A G (G ⧸ U.toSubgroup))
    (Representation.isSmooth_ofMulAction_quotient U)
def cInd_trivial_eq_permutation (U : OpenSubgroup G) :
    cInd U.toSubgroup (of (_root_.Representation.trivial A U A) (by sorry)) ≅
      permutation U := by sorry

def indResAdjunction (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    res (A := A) H.subtype continuous_subtype_val ⊣ indFunctor H := by sorry
def cIndResAdjunction (H : OpenSubgroup G) :
    cIndFunctor (A := A) H.toSubgroup ⊣ res H.toSubgroup.subtype continuous_subtype_val := by sorry

def hom_permutation_equiv_invariants (U : OpenSubgroup G) (V : SmoothRep A G) :
    (permutation (A := A) U ⟶ V) ≃ₗ[A] invariants V U.toSubgroup := by sorry

lemma cIndFunctor_exact (H : Subgroup G) (hH : IsClosed (H : Set G))
    (S : ShortComplex (SmoothRep A H)) (hS : S.ShortExact) :
    (S.map (cIndFunctor H)).ShortExact := by sorry
lemma ind_exact_of_compact (H : Subgroup G) (hH : IsClosed (H : Set G))
    [CompactSpace (G ⧸ H)] (S : ShortComplex (SmoothRep A H)) (hS : S.ShortExact) :
    (S.map (indFunctor H)).ShortExact := by sorry
lemma ind_exact_of_unit (H : Subgroup G) (hH : IsClosed (H : Set G))
    (hA : ∀ U : CompactOpenSubgroup H, HasUnitProOrder A U.1)
    (S : ShortComplex (SmoothRep A H)) (hS : S.ShortExact) :
    (S.map (indFunctor H)).ShortExact := by sorry

-- TauCeti.SmoothRep.ind_self
example (σ : SmoothRep A (⊤ : Subgroup G)) :
    Nonempty ((res (⊤ : Subgroup G).subtype continuous_subtype_val).obj
      (ind (⊤ : Subgroup G) σ) ≅ σ) := by sorry
-- TauCeti.SmoothRep.ind_bot_padicInt
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((ind (⊥ : Subgroup (Multiplicative ℤ_[p]))
      (of (_root_.Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ) (by sorry))).obj
      ≃ₗ[ℤ] LocallyConstant (Multiplicative ℤ_[p]) ℤ) := by sorry
-- TauCeti.SmoothRep.ind_ne_coind
example (p : ℕ) [Fact p.Prime] :
    ∃ f : _root_.Representation.coindV
      (⊥ : Subgroup (Multiplicative ℤ_[p])).subtype
      (_root_.Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ),
      f ∉ Representation.smoothVectors (_root_.Representation.coind
        (⊥ : Subgroup (Multiplicative ℤ_[p])).subtype
        (_root_.Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℤ_[p])) ℤ)) := by sorry
-- TauCeti.SmoothRep.cInd_padic
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((cInd (padicIntegerCompactOpen p).1.toSubgroup
      (of (_root_.Representation.trivial ℤ (padicIntegerCompactOpen p).1 ℤ) (by sorry))).obj
      ≃ₗ[ℤ] MonoidAlgebra ℤ (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup)) := by sorry
-- TauCeti.SmoothRep.cInd_self
example (σ : SmoothRep A (⊤ : Subgroup G)) :
    Nonempty (cInd (⊤ : Subgroup G) σ ≅ ind (⊤ : Subgroup G) σ) := by sorry
-- TauCeti.SmoothRep.cInd_ne_ind
example (p : ℕ) [Fact p.Prime] :
    ∃ f : (ind (⊥ : Subgroup (Multiplicative ℚ_[p]))
      (of (_root_.Representation.trivial ℤ (⊥ : Subgroup (Multiplicative ℚ_[p])) ℤ) (by sorry))).obj,
      (∀ g, indFunction _ _ f g = (1 : ℤ)) ∧ f ∉ cIndSubrepresentation _ _ := by sorry
-- TauCeti.SmoothRep.cInd_open_compat
example (U : OpenSubgroup (Multiplicative (ZMod 4)))
    (hU : (U : Set (Multiplicative (ZMod 4))) = {Multiplicative.ofAdd (0 : ZMod 4), Multiplicative.ofAdd (2 : ZMod 4)}) (σ : SmoothRep ℤ U.toSubgroup) :
    Nonempty ((cInd U.toSubgroup σ).obj ≅ _root_.Rep.ind U.toSubgroup.subtype σ.obj) := by sorry
end TauCeti.SmoothRep


namespace CategoryTheory.IsGrothendieckAbelian
-- Existence is additional work; Mathlib only supplies the K-injective predicate and its consequences.
theorem exists_kInjective_resolution {C : Type (u+1)} [Category.{u} C] [Abelian C]
    [IsGrothendieckAbelian.{u} C] (X : CochainComplex C ℤ) :
    ∃ (I : CochainComplex C ℤ) (f : X ⟶ I), QuasiIso f ∧ I.IsKInjective := by sorry
end CategoryTheory.IsGrothendieckAbelian

namespace TauCeti

def compactOpenTop (G : Type u) [Group G] [TopologicalSpace G] [CompactSpace G] :
    CompactOpenSubgroup G := ⟨⊤, by sorry⟩

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
instance instIsGrothendieckAbelian : IsGrothendieckAbelian.{u} (SmoothRep A G) := by sorry
-- Use the standard large category explicitly; Ext remains small by the Grothendieck result.
attribute [local instance] HasDerivedCategory.standard
abbrev DerivedCat (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] := DerivedCategory (SmoothRep A G)
abbrev DerivedCatPlus (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] := DerivedCategory.Plus (SmoothRep A G)
abbrev singleFunctor := DerivedCategory.singleFunctor (SmoothRep A G) 0
def singleFunctor_fullyFaithful : (singleFunctor (A := A) (G := G)).FullyFaithful := by sorry
abbrev ext (V W : SmoothRep A G) (n : ℕ) := Abelian.Ext V W n
def ext_zero (V W : SmoothRep A G) : ext V W 0 ≃ₗ[A] (V ⟶ W) :=
  Abelian.Ext.linearEquiv₀

def resDerived (U : OpenSubgroup G) : DerivedCat A G ⥤ DerivedCat A U.toSubgroup := by sorry
def resDerived_single (U : OpenSubgroup G) :
    singleFunctor ⋙ resDerived (A := A) U ≅
      res U.toSubgroup.subtype continuous_subtype_val ⋙ singleFunctor := by sorry

def inflationDerived (N : Subgroup G) [N.Normal] :
    DerivedCat A (G ⧸ N) ⥤ DerivedCat A G := by sorry
def inflationDerived_single (N : Subgroup G) [N.Normal] :
    singleFunctor ⋙ inflationDerived (A := A) N ≅ inflation N ⋙ singleFunctor := by sorry

instance invariantsFunctor_additive (U : Subgroup G) :
    (invariantsFunctor (A := A) U).Additive := by sorry

def derivedInvariants (U : CompactOpenSubgroup G) :
    DerivedCatPlus A G ⥤ DerivedCategory.Plus (ModuleCat.{u} A) :=
  (invariantsFunctor (A := A) U.1.toSubgroup).rightDerivedFunctorPlus

def derivedInvariantsOnHeart (U : CompactOpenSubgroup G) (n : ℤ) :
    SmoothRep A G ⥤ ModuleCat A :=
  DerivedCategory.Plus.singleFunctor _ 0 ⋙ derivedInvariants U ⋙
    DerivedCategory.Plus.homologyFunctor _ n

def rHomPlus (V : SmoothRep A G) :
    DerivedCatPlus A G ⥤ DerivedCategory.Plus (ModuleCat.{u} A) := by sorry

def derivedInvariants_iso_rHom (U : CompactOpenSubgroup G) :
    derivedInvariants (A := A) U ≅ rHomPlus (permutation U.1) := by sorry

def homology_derivedInvariants_iso_continuousCohomology
    [TopologicalSpace A] [DiscreteTopology A] (U : CompactOpenSubgroup G)
    (V : SmoothRep A G) (n : ℕ) :
    (derivedInvariantsOnHeart U n).obj V ≃ₗ[A]
      continuousCohomology n ((equivSmoothDiscreteTopRep (A := A) (G := U.1.toSubgroup)).functor.obj
        ((res U.1.toSubgroup.subtype continuous_subtype_val).obj V)).obj := by sorry

lemma res_preserves_injective (U : CompactOpenSubgroup G) (V : SmoothRep A G)
    [Injective V] : Injective ((res U.1.toSubgroup.subtype continuous_subtype_val).obj V) := by sorry

lemma derivedInvariants_of_unit (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) (n : ℕ) (hn : 0 < n) (V : SmoothRep A G) :
    IsZero ((derivedInvariantsOnHeart U n).obj V) := by sorry

lemma derivedInvariants_filteredColimit (U : CompactOpenSubgroup G) (n : ℕ) :
    PreservesFilteredColimits (derivedInvariantsOnHeart (A := A) U n) := by sorry

def derivedInvariants_zero (U : CompactOpenSubgroup G) :
    derivedInvariantsOnHeart (A := A) U 0 ≅ invariantsFunctor U.1.toSubgroup := by sorry

-- A K-injective replacement stores an actual quasi-isomorphism, not a conclusion as a hypothesis.
structure KInjectiveResolution (X : CochainComplex (SmoothRep A G) ℤ) where
  complex : CochainComplex (SmoothRep A G) ℤ
  arrow : X ⟶ complex
  quasiIso : QuasiIso arrow
  isKInjective : complex.IsKInjective

def kInjectiveResolution (X : CochainComplex (SmoothRep A G) ℤ) : KInjectiveResolution X := by sorry

-- Upgrade Mathlib's abelian-group Hom complex by its existing A-linear differential.
def linearHomComplex (X Y : CochainComplex (SmoothRep A G) ℤ) :
    CochainComplex (ModuleCat A) ℤ := by sorry

def linearHomComplex_forget (X Y : CochainComplex (SmoothRep A G) ℤ) :
    ((forget₂ (ModuleCat A) AddCommGrpCat).mapHomologicalComplex (ComplexShape.up ℤ)).obj
      (linearHomComplex X Y) ≅ CochainComplex.HomComplex X Y := by sorry

def rHom (X Y : CochainComplex (SmoothRep A G) ℤ) : CochainComplex (ModuleCat A) ℤ :=
  linearHomComplex X (kInjectiveResolution Y).complex

def homology_rHom (X Y : CochainComplex (SmoothRep A G) ℤ) (n : ℤ) :
    ((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) n).obj (rHom X Y)) ≃ₗ[A]
      ((DerivedCategory.Q.obj X) ⟶ (DerivedCategory.Q.obj Y)⟦n⟧) := by sorry

def rHom_functorial : (DerivedCat A G)ᵒᵖ ⥤ DerivedCat A G ⥤ DerivedCategory (ModuleCat.{u} A) := by sorry
def rHom_functorial_on_complexes (X Y : CochainComplex (SmoothRep A G) ℤ) :
    ((rHom_functorial (A := A) (G := G)).obj (Opposite.op (DerivedCategory.Q.obj X))).obj
      (DerivedCategory.Q.obj Y) ≅ DerivedCategory.Q.obj (rHom X Y) := by sorry

def derivedInvariantsUnbounded (U : CompactOpenSubgroup G) :
    DerivedCat A G ⥤ DerivedCategory (ModuleCat.{u} A) := by sorry

def rHom_permutation (U : CompactOpenSubgroup G) :
    (rHom_functorial (A := A) (G := G)).obj (Opposite.op (singleFunctor.obj (permutation U.1))) ≅
      derivedInvariantsUnbounded U := by sorry

-- The compact-object statement is expressed by preservation of all small coproducts by Hom(P,-).
lemma isCompact_permutation (U : CompactOpenSubgroup G) (hU : HasUnitProOrder A U.1) :
    Projective (permutation (A := A) U.1) ∧ ∀ J : Type u,
      PreservesColimitsOfShape (Discrete J)
        (preadditiveCoyoneda.obj (Opposite.op (singleFunctor.obj (permutation (A := A) U.1)))) := by sorry

lemma ext_eq_zero_of_centre (z : SmoothCentre A G) (V W : SmoothRep A G)
    (a b : A) (ha : SmoothCentre.app z V = a • 𝟙 V)
    (hb : SmoothCentre.app z W = b • 𝟙 W) (n : ℕ) (ξ : ext V W n) :
    (a - b) • ξ = 0 := by sorry
lemma ext_subsingleton_of_centre (z : SmoothCentre A G) (V W : SmoothRep A G)
    (a b : A) (ha : SmoothCentre.app z V = a • 𝟙 V)
    (hb : SmoothCentre.app z W = b • 𝟙 W) (hab : IsUnit (a - b)) (n : ℕ) :
    Subsingleton (ext V W n) := by sorry

-- Composition α.comp β means β after α: this is the opposite of End(P)'s ring convention.
abbrev derivedHecke (U : CompactOpenSubgroup G) (n : ℕ) :=
  ext (permutation (A := A) U.1) (permutation (A := A) U.1) n
def derivedHeckeMul (U : CompactOpenSubgroup G) {a b : ℕ}
    (α : derivedHecke (A := A) U a) (β : derivedHecke (A := A) U b) :
    derivedHecke (A := A) U (a+b) := α.comp β rfl
instance derivedHeckeZeroRing (U : CompactOpenSubgroup G) :
    Ring (derivedHecke (A := A) U 0) := by sorry
lemma derivedHeckeZero_mul (U : CompactOpenSubgroup G) (α β : derivedHecke (A := A) U 0) :
    α * β = α.comp β (by omega) := by sorry

def derivedHecke_zero (U : CompactOpenSubgroup G) :
    derivedHecke (A := A) U 0 ≃+* (End (permutation (A := A) U.1))ᵐᵒᵖ := by sorry

def derivedHeckeAction (U : CompactOpenSubgroup G) (V : SmoothRep A G) {a b : ℕ}
    (α : derivedHecke (A := A) U a) (β : ext (permutation U.1) V b) :
    ext (permutation U.1) V (a+b) := α.comp β rfl

abbrev derivedBimodule (U₁ U₂ : CompactOpenSubgroup G) (n : ℕ) :=
  ext (permutation (A := A) U₁.1) (permutation (A := A) U₂.1) n
lemma derivedHecke_of_unit (U : CompactOpenSubgroup G) (hU : HasUnitProOrder A U.1)
    (n : ℕ) (hn : 0 < n) : Subsingleton (derivedHecke (A := A) U n) := by sorry

-- TauCeti.SmoothRep.ext_zero_test
example : Nonempty (ext (of (_root_.Representation.trivial A G A) (by sorry))
    (of (_root_.Representation.trivial A G A) (by sorry)) 0 ≃ₗ[A] A) := by sorry
-- TauCeti.SmoothRep.ext_one_padicInt_fp
example (p : ℕ) [Fact p.Prime] :
    let V := of (_root_.Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)) (by sorry)
    Nonempty (ext V V 1 ≃ₗ[ZMod p] ZMod p) := by sorry
-- TauCeti.SmoothRep.ext_pos_padicInt_fl
example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (h : p ≠ ℓ)
    (V W : SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p])) (n : ℕ) (hn : 0 < n) :
    Subsingleton (ext V W n) := by sorry
-- TauCeti.SmoothRep.derived_discrete_compat
example [Fintype G] [DiscreteTopology G] (V W : SmoothRep A G) (n : ℕ) :
    letI : HasExt.{u+1} (_root_.Rep.{u,u,u} A G) := HasExt.standard _
    Nonempty (ext V W n ≃ₗ[A] Abelian.Ext.{u+1} V.obj W.obj n) := by sorry
-- TauCeti.SmoothRep.derivedInvariants_padicInt_fp
example (p : ℕ) [Fact p.Prime] :
    let U := compactOpenTop (Multiplicative ℤ_[p])
    let V := of (_root_.Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)) (by sorry)
    Nonempty ((derivedInvariantsOnHeart U 1).obj V ≃ₗ[ZMod p] ZMod p) ∧
      IsZero ((derivedInvariantsOnHeart U 2).obj V) := by sorry
-- TauCeti.SmoothRep.derivedInvariants_trivial_group
example [DiscreteTopology G] (V : SmoothRep A G) :
    Nonempty ((derivedInvariantsOnHeart (⟨⟨(⊥ : Subgroup G), by sorry⟩, by sorry⟩) 0).obj V ≃ₗ[A] V.obj) ∧
      ∀ n : ℕ, 0 < n → IsZero ((derivedInvariantsOnHeart (⟨⟨(⊥ : Subgroup G), by sorry⟩, by sorry⟩) n).obj V) := by sorry
-- TauCeti.SmoothRep.derivedInvariants_unit_test
example (V : SmoothRep (ZInvert 3) (Multiplicative (ZMod 3))) :
    Nonempty ((derivedInvariantsOnHeart (compactOpenTop (Multiplicative (ZMod 3))) 0).obj V
      ≃ₗ[ZInvert 3] invariants V ⊤) ∧
    ∀ n : ℕ, 0 < n → IsZero ((derivedInvariantsOnHeart
      (compactOpenTop (Multiplicative (ZMod 3))) n).obj V) := by sorry
-- TauCeti.SmoothRep.derivedInvariants_not_exact
example (p : ℕ) [Fact p.Prime] :
    let V := of (_root_.Representation.trivial (ZMod p) (Multiplicative (ZMod p)) (ZMod p)) (by sorry)
    ¬ IsZero ((derivedInvariantsOnHeart (compactOpenTop (Multiplicative (ZMod p))) 1).obj V) := by sorry
-- TauCeti.SmoothRep.homology_rHom_zero
example :
    let V := (CochainComplex.singleFunctor (SmoothRep A G) 0).obj
      (of (_root_.Representation.trivial A G A) (by sorry))
    Nonempty ((HomologicalComplex.homologyFunctor (ModuleCat A) (ComplexShape.up ℤ) 0).obj (rHom V V) ≃ₗ[A] A) := by sorry
-- TauCeti.SmoothRep.rHom_padicInt_fp
example (p : ℕ) [Fact p.Prime] :
    let V := (CochainComplex.singleFunctor (SmoothRep (ZMod p) (Multiplicative ℤ_[p])) 0).obj
      (of (_root_.Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)) (by sorry))
    Nonempty ((HomologicalComplex.homologyFunctor (ModuleCat (ZMod p)) (ComplexShape.up ℤ) 1).obj (rHom V V)
      ≃ₗ[ZMod p] ZMod p) := by sorry
-- TauCeti.SmoothRep.rHom_semisimple
example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (h : p ≠ ℓ)
    (V W : SmoothRep (ZMod ℓ) (Multiplicative ℤ_[p])) (n : ℤ) (hn : n ≠ 0) :
    IsZero ((HomologicalComplex.homologyFunctor (ModuleCat (ZMod ℓ)) (ComplexShape.up ℤ) n).obj
      (rHom ((CochainComplex.singleFunctor _ 0).obj V)
        ((CochainComplex.singleFunctor _ 0).obj W))) := by sorry
-- TauCeti.SmoothRep.derivedHecke_padicInt
example (p : ℕ) [Fact p.Prime] :
    let U := compactOpenTop (Multiplicative ℤ_[p])
    Nonempty (derivedHecke (A := ZMod p) U 1 ≃ₗ[ZMod p] ZMod p) ∧
      ∀ n : ℕ, 2 ≤ n → Subsingleton (derivedHecke (A := ZMod p) U n) := by sorry
-- TauCeti.SmoothRep.derivedHecke_unit_degree_zero
example (U : CompactOpenSubgroup G) (hU : HasUnitProOrder A U.1)
    (n : ℕ) (hn : 0 < n) : Subsingleton (derivedHecke (A := A) U n) := by sorry
end SmoothRep
end TauCeti


namespace TauCeti
variable {A B G S : Type u} [CommRing A] [CommRing B] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
  [MulAction G S]

theorem isHeckeTriple_compactOpen (U₁ U₂ : CompactOpenSubgroup G) :
    IsHeckeTriple (⊤ : Submonoid G) U₁.1.toSubgroup U₂.1.toSubgroup := by sorry
instance heckeTriple_compactOpen (U₁ U₂ : CompactOpenSubgroup G) :
    IsHeckeTriple (⊤ : Submonoid G) U₁.1.toSubgroup U₂.1.toSubgroup :=
  isHeckeTriple_compactOpen U₁ U₂

-- The matrix model carries a concrete orbit-support condition.
structure FunG (A G S : Type u) [CommRing A] [Group G] [MulAction G S] where
  value : S × S → A
  invariant : ∀ (g : G) (x y : S), value (g • x, g • y) = value (x,y)
  orbitSupport : ∃ T : Finset (S × S), ∀ x y, value (x,y) ≠ 0 →
    ∃ z ∈ T, ∃ g : G, (x,y) = (g • z.1, g • z.2)

namespace FunG
instance : CoeFun (FunG A G S) (fun _ ↦ S × S → A) := ⟨FunG.value⟩
variable (hStab : ∀ s : S, IsOpen (MulAction.stabilizer G s : Set G) ∧
  IsCompact (MulAction.stabilizer G s : Set G))
instance instAddCommGroup : AddCommGroup (FunG A G S) := by sorry
instance instModule : Module A (FunG A G S) := by sorry
-- Compact stabilisers have finite orbits on a discrete set with open stabilisers.
include hStab in
lemma column_support_finite (h : FunG A G S) (s : S) :
    {t : S | h (t,s) ≠ 0}.Finite := by sorry
include hStab in
lemma row_support_finite (h : FunG A G S) (s : S) :
    {t : S | h (s,t) ≠ 0}.Finite := by sorry

def matrixMul (hStab : ∀ s : S, IsOpen (MulAction.stabilizer G s : Set G) ∧
    IsCompact (MulAction.stabilizer G s : Set G)) (h₁ h₂ : FunG A G S) : FunG A G S := by sorry
lemma matrixMul_apply (h₁ h₂ : FunG A G S) (x z : S) :
    matrixMul hStab h₁ h₂ (x,z) = ∑ᶠ y : S, h₁ (x,y) * h₂ (y,z) := by sorry

def actPermutation (hStab : ∀ s : S, IsOpen (MulAction.stabilizer G s : Set G) ∧
    IsCompact (MulAction.stabilizer G s : Set G)) (h : FunG A G S) :
    (_root_.Representation.ofMulAction A G S).IntertwiningMap
      (_root_.Representation.ofMulAction A G S) := by sorry
lemma actPermutation_single (h : FunG A G S) (s t : S) :
    (actPermutation hStab h (MonoidAlgebra.single s 1)).coeff t = h (t,s) := by sorry
lemma actPermutation_matrixMul (h₁ h₂ : FunG A G S) :
    (actPermutation hStab (matrixMul hStab h₁ h₂)).toLinearMap =
      (actPermutation hStab h₁).toLinearMap.comp (actPermutation hStab h₂).toLinearMap := by sorry

-- Multiplication is given explicitly, so this prototype cannot silently reverse the convention.
@[instance_reducible]
def instMul : Mul (FunG A G S) := ⟨matrixMul hStab⟩
-- This instance depends on hStab; clients install it locally when using multiplication.
def equivEnd [Finite (Quotient (MulAction.orbitRel G S))] :
    letI : Mul (FunG A G S) := instMul hStab
    FunG A G S ≃+* End (_root_.Rep.of (_root_.Representation.ofMulAction A G S)) := by sorry
lemma equivEnd_smul [Finite (Quotient (MulAction.orbitRel G S))]
    (a : A) (h : FunG A G S) :
    equivEnd hStab (a • h) = a • equivEnd hStab h := by sorry
end FunG

-- Keep the existing Shimura multiplication. The matrix model is a comparison, not a new ring.
abbrev HeckeAlgebraLevel (G : Type u) [Group G] [TopologicalSpace G]
    (U : CompactOpenSubgroup G) (A : Type u) [CommRing A] :=
  HeckeRing (⊤ : Submonoid G) U.1.toSubgroup A

namespace HeckeAlgebraLevel
variable (U : CompactOpenSubgroup G)
def doubleCoset (g : G) : HeckeAlgebraLevel G U A :=
  HeckeCosetModule.single A (HeckeCoset.mk U.1.toSubgroup U.1.toSubgroup ⟨g, by trivial⟩) 1

def basis : Module.Basis (HeckeCoset (⊤ : Submonoid G) U.1.toSubgroup U.1.toSubgroup)
    A (HeckeAlgebraLevel G U A) := by sorry
lemma basis_mk (g : G) :
    basis (A := A) U (HeckeCoset.mk U.1.toSubgroup U.1.toSubgroup ⟨g, by trivial⟩) =
      doubleCoset (A := A) U g := by sorry

def equivHeckeRing : HeckeAlgebraLevel G U A ≃+*
    HeckeRing (⊤ : Submonoid G) U.1.toSubgroup A := RingEquiv.refl _
def equivPermutationEnd : HeckeAlgebraLevel G U A ≃+* End (SmoothRep.permutation (A := A) U.1) := by sorry
lemma equivPermutationEnd_smul (a : A) (h : HeckeAlgebraLevel G U A) :
    equivPermutationEnd U (a • h) = a • equivPermutationEnd U h := by sorry

def opposite : HeckeAlgebraLevel G U A ≃+* (HeckeAlgebraLevel G U A)ᵐᵒᵖ := by sorry
lemma opposite_doubleCoset (g : G) :
    opposite U (doubleCoset (A := A) U g) = MulOpposite.op (doubleCoset (A := A) U g⁻¹) := by sorry

def baseChange [Algebra A B] :
    B ⊗[A] HeckeAlgebraLevel G U A ≃ₗ[B] HeckeAlgebraLevel G U B := by sorry
lemma baseChange_single [Algebra A B] (g : G) (b : B) :
    baseChange U (b ⊗ₜ[A] doubleCoset (A := A) U g) = b • doubleCoset (A := B) U g := by sorry

-- TauCeti.HeckeAlgebraLevel.normal_eq_groupAlgebra
example [U.1.toSubgroup.Normal] :
    Nonempty (HeckeAlgebraLevel G U A ≃+* MonoidAlgebra A (G ⧸ U.1.toSubgroup)) := by sorry
-- TauCeti.HeckeAlgebraLevel.fp_defined
example (p : ℕ) [Fact p.Prime] :
    Nonempty (HeckeAlgebraLevel (Multiplicative ℚ_[p]) (padicIntegerCompactOpen p) (ZMod p)
      ≃+* MonoidAlgebra (ZMod p)
        (Multiplicative ℚ_[p] ⧸ (padicIntegerCompactOpen p).1.toSubgroup)) ∧
    ¬ ∃ μ : HaarMeasureWithValues (ZMod p) (Multiplicative ℚ_[p]),
      μ (compactOpenSet (padicIntegerCompactOpen p)) = 1 := by sorry
end HeckeAlgebraLevel

namespace SmoothRep

def invariantsHeckeModule (U : CompactOpenSubgroup G) (V : SmoothRep A G) :
    HeckeAlgebraLevel G U A →ₗ[A] invariants V U.1.toSubgroup →ₗ[A] invariants V U.1.toSubgroup := by sorry
lemma invariantsHeckeModule_via_hom (U : CompactOpenSubgroup G) (V : SmoothRep A G)
    (h : HeckeAlgebraLevel G U A) (v : invariants V U.1.toSubgroup) :
    hom_permutation_equiv_invariants U.1 V
      ((HeckeAlgebraLevel.equivPermutationEnd U h) ≫
        (hom_permutation_equiv_invariants U.1 V).symm v) = invariantsHeckeModule U V h v := by sorry
lemma invariantsHeckeModule_mul (U : CompactOpenSubgroup G) (V : SmoothRep A G)
    (h₁ h₂ : HeckeAlgebraLevel G U A) (v : invariants V U.1.toSubgroup) :
    invariantsHeckeModule U V (h₁ * h₂) v =
      invariantsHeckeModule U V h₂ (invariantsHeckeModule U V h₁ v) := by sorry
lemma invariantsHeckeModule_natural (U : CompactOpenSubgroup G) {V W : SmoothRep A G}
    (f : V ⟶ W) (h : HeckeAlgebraLevel G U A) (v : invariants V U.1.toSubgroup) :
    f.hom.hom (invariantsHeckeModule U V h v) =
      invariantsHeckeModule U W h (((invariantsFunctor U.1.toSubgroup).map f).hom v) := by sorry

def inclLevel (U U' : CompactOpenSubgroup G) (h : U'.1 ≤ U.1) (V : SmoothRep A G) :
    invariants V U.1.toSubgroup →ₗ[A] invariants V U'.1.toSubgroup := by sorry

def traceLevel (U U' : CompactOpenSubgroup G) (h : U'.1 ≤ U.1) (V : SmoothRep A G) :
    invariants V U'.1.toSubgroup →ₗ[A] invariants V U.1.toSubgroup := by sorry
-- TauCeti.SmoothRep.traceLevel_comp_incl
example (U U' : CompactOpenSubgroup G) (h : U'.1 ≤ U.1) (V : SmoothRep A G) :
    (traceLevel U U' h V).comp (inclLevel U U' h V) =
      (U'.1.toSubgroup.relIndex U.1.toSubgroup : A) • LinearMap.id := by sorry

attribute [local instance] HasDerivedCategory.standard
-- TauCeti.SmoothRep.derivedHecke_zero_compat
example (U : CompactOpenSubgroup G) :
    Nonempty (derivedHecke (A := A) U 0 ≃+* (HeckeAlgebraLevel G U A)ᵐᵒᵖ) := by sorry
end SmoothRep
end TauCeti


namespace TauCeti

class IsIdempotented (H : Type u) [NonUnitalRing H] : Prop where
  exists_localUnit : ∀ s : Finset H, ∃ e : H, e * e = e ∧ ∀ h ∈ s, e * h = h ∧ h * e = h

instance isIdempotented_of_unital (H : Type u) [Ring H] : IsIdempotented H := by sorry

instance unitizationModuleScalars {A H : Type u} [CommRing A] [NonUnitalRing H]
    [Module A H] [IsScalarTower A H H] [SMulCommClass A H H]
    (M : ModuleCat (Unitization A H)) : Module A M :=
  Module.restrictScalars A (Unitization A H) M

-- Unitization supplies the ordinary module carrier; H acts through its canonical nonunital inclusion.
def nondegenerateSubmodule {A H : Type u} [CommRing A] [NonUnitalRing H]
    [Module A H] [IsScalarTower A H H] [SMulCommClass A H H]
    (M : ModuleCat (Unitization A H)) : Submodule (Unitization A H) M :=
  Submodule.span (Unitization A H) {v | ∃ (h : H) (m : M), (Unitization.inr h : Unitization A H) • m = v}

abbrev NondegMod (A H : Type u) [CommRing A] [NonUnitalRing H]
    [Module A H] [IsScalarTower A H H] [SMulCommClass A H H] :=
  ObjectProperty.FullSubcategory (fun M : ModuleCat (Unitization A H) ↦ nondegenerateSubmodule M = ⊤)

namespace NondegMod
variable {A H : Type u} [CommRing A] [NonUnitalRing H]
  [Module A H] [IsScalarTower A H H] [SMulCommClass A H H] [IsIdempotented H]

instance instAbelian : Abelian (NondegMod A H) where
  toPreadditive := inferInstance
  toIsNormalMonoCategory := by sorry
  toIsNormalEpiCategory := by sorry
  has_finite_products := by sorry
  has_kernels := by sorry
  has_cokernels := by sorry
instance instIsGrothendieckAbelian : IsGrothendieckAbelian.{u} (NondegMod A H) := by sorry
instance instLinear : Linear A (NondegMod A H) := by sorry

def ι : NondegMod A H ⥤ ModuleCat (Unitization A H) := ObjectProperty.ι _
def nondegPart : ModuleCat (Unitization A H) ⥤ NondegMod A H := by sorry
lemma nondegPart_carrier (M : ModuleCat (Unitization A H)) :
    Nonempty ((nondegPart.obj M).obj ≃ₗ[Unitization A H] nondegenerateSubmodule M) := by sorry

def nondegPartAdjunction : (ι : NondegMod A H ⥤ _) ⊣ nondegPart := by sorry

def proj (e : H) (he : e * e = e) : NondegMod A H :=
  ⟨ModuleCat.of (Unitization A H)
    (Submodule.span (Unitization A H) {(Unitization.inr e : Unitization A H)}), by sorry⟩

def fixedByIdempotent (e : H) (M : NondegMod A H) : Submodule A M.obj := by sorry
lemma mem_fixedByIdempotent (e : H) (M : NondegMod A H) (m : M.obj) :
    m ∈ fixedByIdempotent e M ↔ (Unitization.inr e : Unitization A H) • m = m := by sorry

def homProjEquiv (e : H) (he : e * e = e) (M : NondegMod A H) :
    (proj e he ⟶ M) ≃ₗ[A] fixedByIdempotent e M := by sorry
lemma proj_projective (e : H) (he : e * e = e) : Projective (proj (A := A) e he) := by sorry

def bimoduleEnd : Subring (Module.End A H) := by sorry
lemma mem_bimoduleEnd (f : Module.End A H) :
    f ∈ bimoduleEnd (A := A) (H := H) ↔
      ∀ h k : H, f (h * k) = h * f k ∧ f (h * k) = f h * k := by sorry

def centreEquiv : CatCenter (NondegMod A H) ≃+* bimoduleEnd (A := A) (H := H) := by sorry

-- These statements quantify over the unital ring structure and its compatible A-algebra directly.
def equivOfUnital (R : Type u) [Ring R] [Algebra A R] :
    NondegMod A R ≌ ModuleCat R := by sorry
-- TauCeti.NondegMod.unital_equiv
example : Nonempty (NondegMod A A ≌ ModuleCat A) := by sorry
-- TauCeti.NondegMod.centre_unital
example : Nonempty (CatCenter (NondegMod A (Matrix (Fin 2) (Fin 2) A)) ≃+* A) := by sorry
end NondegMod



-- Pointwise multiplication is different from the convolution multiplication on MonoidAlgebra.
def PointwiseFiniteSupport (A I : Type u) [CommRing A] := I →₀ A
namespace PointwiseFiniteSupport
variable {A I : Type u} [CommRing A]
instance instNonUnitalRing : NonUnitalRing (PointwiseFiniteSupport A I) := by sorry
instance instModule : Module A (PointwiseFiniteSupport A I) := by sorry
instance instScalarTower : IsScalarTower A (PointwiseFiniteSupport A I) (PointwiseFiniteSupport A I) := by sorry
instance instSmulComm : SMulCommClass A (PointwiseFiniteSupport A I) (PointwiseFiniteSupport A I) := by sorry
def toFinsupp : PointwiseFiniteSupport A I ≃ₗ[A] (I →₀ A) := by sorry
lemma mul_apply (f g : PointwiseFiniteSupport A I) (i : I) :
    toFinsupp (f * g) i = toFinsupp f i * toFinsupp g i := by sorry
end PointwiseFiniteSupport

-- TauCeti.IsIdempotented.directSum
example (A : Type) [CommRing A] [Nontrivial A] :
    IsIdempotented (PointwiseFiniteSupport A ℕ) ∧
    ∀ (M : ModuleCat (Unitization A (PointwiseFiniteSupport A ℕ)))
      (e : M ≃ₗ[A] (ℕ → A)),
      (∀ (h : PointwiseFiniteSupport A ℕ) (m : M) (n : ℕ),
        e ((Unitization.inr h : Unitization A (PointwiseFiniteSupport A ℕ)) • m) n = PointwiseFiniteSupport.toFinsupp h n * e m n) →
      nondegenerateSubmodule M ≠ ⊤ := by sorry
-- TauCeti.IsIdempotented.not_zeroMul
example (H : Type u) [NonUnitalRing H] [Nontrivial H] (hH : ∀ x y : H, x * y = 0) :
    ¬ IsIdempotented H := by sorry

namespace HeckeAlgebra
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
  (μ : HaarMeasureWithValues A G)
instance instScalarTower : IsScalarTower A (HeckeAlgebra μ) (HeckeAlgebra μ) := by sorry
instance instSmulComm : SMulCommClass A (HeckeAlgebra μ) (HeckeAlgebra μ) := by sorry
lemma isIdempotented (hG : HasCofinalUnitProOrder A G)
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1)
    (hμ : μ = HaarMeasureWithValues.normalized U₀ hU₀) : IsIdempotented (HeckeAlgebra μ) := by sorry
end HeckeAlgebra

namespace SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
def equivNondegMod (hG : HasCofinalUnitProOrder A G)
    (U₀ : CompactOpenSubgroup G) (hU₀ : HasUnitProOrder A U₀.1) :
    SmoothRep A G ≌ NondegMod A (HeckeAlgebra (HaarMeasureWithValues.normalized U₀ hU₀)) := by sorry
end SmoothRep
end TauCeti


namespace TauCeti
namespace SmoothRep
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

-- The normal-subgroup construction is independent of Levi and root data.
-- A parabolic Jacquet functor composes restriction, this quotient, and the
-- supplier's identification of P/N with its Levi. No new coinvariant carrier.
def jacquetFunctor (N : Subgroup G) [N.Normal] :
    SmoothRep A G ⥤ SmoothRep A (G ⧸ N) :=
  ObjectProperty.lift _ (ι ⋙ _root_.Rep.quotientToCoinvariantsFunctor A N) (by
    intro V
    sorry)
abbrev jacquet (N : Subgroup G) [N.Normal] (V : SmoothRep A G) :=
  (jacquetFunctor N).obj V

def jacquetMk (N : Subgroup G) [N.Normal] (V : SmoothRep A G) :
    V.obj →ₗ[A] (jacquet N V).obj :=
  _root_.Representation.Coinvariants.mk (V.obj.ρ.comp N.subtype)
lemma jacquet_mk_surjective (N : Subgroup G) [N.Normal] (V : SmoothRep A G) :
    Function.Surjective (jacquetMk N V) ∧ LinearMap.ker (jacquetMk N V) =
      Submodule.span A { x | ∃ n : N, ∃ v : V.obj, x = V.obj.ρ n v - v } := by sorry
lemma jacquetMk_equivariant (N : Subgroup G) [N.Normal] (V : SmoothRep A G)
    (g : G) (v : V.obj) :
    jacquetMk N V (V.obj.ρ g v) =
      (jacquet N V).obj.ρ (QuotientGroup.mk g) (jacquetMk N V v) := by sorry

def jacquet_eq_coinvariants (N : Subgroup G) [N.Normal] (V : SmoothRep A G) :
    (jacquet N V).obj ≃ₗ[A]
      _root_.Representation.Coinvariants (V.obj.ρ.comp N.subtype) := LinearEquiv.refl _ _
def jacquet_lift (N : Subgroup G) [N.Normal] :
    jacquetFunctor (A := A) N ⊣ inflation N := by sorry
instance jacquetFunctor_additive (N : Subgroup G) [N.Normal] :
    (jacquetFunctor (A := A) N).Additive := by sorry
instance jacquetFunctor_preservesColimits (N : Subgroup G) [N.Normal] :
    PreservesColimits (jacquetFunctor (A := A) N) := by sorry

def jacquet_baseChange [Algebra A B] (N : Subgroup G) [N.Normal]
    (V : SmoothRep A G) :
    (jacquet N ((baseChange (B := B)).obj V)).obj ≃ₗ[B]
      B ⊗[A] (jacquet N V).obj := by sorry

-- Exhaustion is stated on N itself: relative compact open subgroups of N need
-- not be open in G. It gives exactness, not an unconditional characteristic-p claim.
lemma jacquetFunctor_exact (N : Subgroup G) [N.Normal]
    (K : ℕ → CompactOpenSubgroup N)
    (hK : Monotone (fun i ↦ (K i).1.toSubgroup))
    (hcover : ∀ n : N, ∃ i, n ∈ (K i).1)
    (hunit : ∀ i, HasUnitProOrder A (K i).1)
    (S : ShortComplex (SmoothRep A G)) (hS : S.ShortExact) :
    (S.map (jacquetFunctor N)).ShortExact := by sorry

-- TauCeti.SmoothRep.jacquet_N_trivial
example (V : SmoothRep A G) :
    Nonempty ((jacquet (⊥ : Subgroup G) V).obj ≃ₗ[A] V.obj) := by sorry
-- TauCeti.SmoothRep.jacquet_eq_coinvariants_test
example [Finite G] [DiscreteTopology G] (N : Subgroup G) [N.Normal]
    (V : SmoothRep A G) :
    Nonempty ((jacquet N V).obj ≃ₗ[A]
      _root_.Representation.Coinvariants (V.obj.ρ.comp N.subtype)) := by sorry

-- This failure is already visible in the finite cyclic quotient of Z_p.
-- Both the augmentation ideal and the ambient coinvariants are explicit.
def cyclicAugmentationIdeal (p : ℕ) [Fact p.Prime] :
    Subrepresentation (_root_.Representation.ofMulAction (ZMod p)
      (Multiplicative (ZMod p)) (Multiplicative (ZMod p))) := by sorry
lemma mem_cyclicAugmentationIdeal (p : ℕ) [Fact p.Prime]
    (v : MonoidAlgebra (ZMod p) (Multiplicative (ZMod p))) :
    v ∈ cyclicAugmentationIdeal p ↔ v.coeff.sum (fun _ a ↦ a) = 0 := by sorry
-- TauCeti.SmoothRep.jacquet_not_left_exact_fp
example (p : ℕ) [Fact p.Prime] :
    let ρ := _root_.Representation.ofMulAction (ZMod p)
      (Multiplicative (ZMod p)) (Multiplicative (ZMod p))
    let I := cyclicAugmentationIdeal p
    let f : _root_.Representation.IntertwiningMap I.toRepresentation ρ := ⟨I.toSubmodule.subtype, by sorry⟩
    ¬ Function.Injective (_root_.Representation.Coinvariants.map I.toRepresentation ρ f) := by sorry

-- No quasi-split or generic-character assertion is needed to construct these
-- general closed-subgroup functors. Nondegeneracy on simple roots is supplied
-- by ReductiveGroupsPartII before the genericity theorems can be stated.
def whittakerFunctionals (U : Subgroup G) (ψ : U →* Aˣ)
    (V : SmoothRep A G) : Submodule A (V.obj →ₗ[A] A) where
  carrier := { l | ∀ u : U, ∀ v : V.obj, l (V.obj.ρ u v) = (ψ u : A) * l v }
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
lemma mem_whittakerFunctionals (U : Subgroup G) (ψ : U →* Aˣ)
    (V : SmoothRep A G) (l : V.obj →ₗ[A] A) :
    l ∈ whittakerFunctionals U ψ V ↔
      ∀ u : U, ∀ v : V.obj, l (V.obj.ρ u v) = (ψ u : A) * l v := Iff.rfl

abbrev twistedJacquet (U : Subgroup G) (ψ : U →* Aˣ) (V : SmoothRep A G) :=
  V.obj ⧸ Submodule.span A { x | ∃ u : U, ∃ v : V.obj,
    x = V.obj.ρ u v - (ψ u : A) • v }
def IsGeneric (U : Subgroup G) (ψ : U →* Aˣ) (V : SmoothRep A G) : Prop :=
  Nontrivial (whittakerFunctionals U ψ V)
def whittakerDualEquiv (U : Subgroup G) (ψ : U →* Aˣ) (V : SmoothRep A G) :
    whittakerFunctionals U ψ V ≃ₗ[A] Module.Dual A (twistedJacquet U ψ V) := by sorry

variable [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]

def whittakerFunctionals_equiv_hom_ind (U : Subgroup G)
    (hU : IsClosed (U : Set G)) (ψ : U →* Aˣ) (hψ : IsSmoothCharacter ψ)
    (V : SmoothRep A G) :
    whittakerFunctionals U ψ V ≃ₗ[A]
      (V ⟶ ind U (ofCharacter ψ hψ)) := by sorry

def gelfandGraev (U : Subgroup G) (ψ : U →* Aˣ)
    (hψ : IsSmoothCharacter ψ) : SmoothRep A G := cInd U (ofCharacter ψ hψ)
-- TauCeti.SmoothRep.whittaker_torus
example (V : SmoothRep A G) :
    Nonempty (whittakerFunctionals (⊥ : Subgroup G) 1 V ≃ₗ[A]
      Module.Dual A V.obj) := by sorry
-- TauCeti.SmoothRep.twistedJacquet_one
example (U : Subgroup G) (V : SmoothRep A G) :
    Nonempty (twistedJacquet U 1 V ≃ₗ[A]
      _root_.Representation.Coinvariants (V.obj.ρ.comp U.subtype)) := by sorry

-- Compactness of a representation is a matrix-coefficient support condition;
-- it does not mean that the ambient group is compact.
def IsCompactRepresentation {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (V : SmoothRep ℂ G) : Prop :=
  ∀ (v : V.obj) (K : CompactOpenSubgroup G) (hK : HasUnitProOrder ℂ K.1),
    IsCompact (Function.support (fun g : G ↦ averaging V K hK (V.obj.ρ g⁻¹ v)))
lemma compact_splits {G : Type} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [SigmaCompactSpace G]
    (hG : MeasureTheory.Measure.modularCharacter (G := G) = 1)
    (V W : SmoothRep ℂ G) (hV : IsCompactRepresentation V) [Simple V]
    (f : V ⟶ W) [Mono f] : ∃ r : W ⟶ V, f ≫ r = 𝟙 V := by sorry

-- Unramified characters make sense for every locally profinite group. The
-- finite-index and torus-rank results require the reductive supplier.
def compactlyGeneratedSubgroup (G : Type u) [Group G] [TopologicalSpace G] :
    Subgroup G := Subgroup.closure
      { g | ∃ K : Subgroup G, IsCompact (K : Set G) ∧ g ∈ K }
instance compactlyGeneratedSubgroup_normal :
    (compactlyGeneratedSubgroup G).Normal := by sorry
abbrev unramifiedCharacters (A G : Type u) [CommRing A] [Group G]
    [TopologicalSpace G] := (G ⧸ compactlyGeneratedSubgroup G) →* Aˣ

def unramifiedToCharacter (χ : unramifiedCharacters A G) : G →* Aˣ :=
  χ.comp (QuotientGroup.mk' (compactlyGeneratedSubgroup G))
lemma unramifiedCharacters_isSmoothCharacter (χ : unramifiedCharacters A G) :
    IsSmoothCharacter (unramifiedToCharacter χ) := by sorry

def twistUnramified
    (χ : unramifiedCharacters A G) : SmoothRep A G ≌ SmoothRep A G :=
  twist (unramifiedToCharacter χ) (unramifiedCharacters_isSmoothCharacter χ)
-- TauCeti.SmoothRep.unramified_eq_isSmoothCharacter_trivial_on
example
    (χ : G →* Aˣ) :
    (∃ ψ : unramifiedCharacters A G, unramifiedToCharacter ψ = χ) ↔
      ∀ g ∈ compactlyGeneratedSubgroup G, χ g = 1 := by sorry
end SmoothRep
end TauCeti


namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]

lemma averaging_apply (V : SmoothRep A G) (U : CompactOpenSubgroup G)
    (hU : HasUnitProOrder A U.1) (N : OpenNormalSubgroup U.1)
    [Fintype (U.1 ⧸ N.toSubgroup)] (v : V.obj)
    (hv : ∀ n : N, V.obj.ρ (n : U.1) v = v)
    (s : U.1 ⧸ N.toSubgroup → U.1)
    (hs : Function.RightInverse s (QuotientGroup.mk' N.toSubgroup))
    (hindex : IsUnit (Fintype.card (U.1 ⧸ N.toSubgroup) : A)) :
    averaging V U hU v = (↑(hindex.unit⁻¹) : A) •
      ∑ q : U.1 ⧸ N.toSubgroup, V.obj.ρ (s q) v := by sorry

def signCharacter (A : Type u) [CommRing A] : Multiplicative (ZMod 2) →* Aˣ := by sorry
lemma signCharacter_apply (A : Type u) [CommRing A] :
    (signCharacter A (Multiplicative.ofAdd 1) : A) = -1 := by sorry
-- TauCeti.SmoothRep.averaging_sign
example :
    let U := compactOpenTop (Multiplicative (ZMod 2))
    let V := ofCharacter (signCharacter (ZInvert 2)) (by sorry)
    averaging V U (by sorry) = 0 := by sorry
-- TauCeti.SmoothRep.baseChangeInvariants_sign_not_surjective
example :
    let U := compactOpenTop (Multiplicative (ZMod 2))
    let V := ofCharacter (signCharacter ℤ) (by sorry)
    ¬ Function.Surjective (baseChangeInvariants (B := ZMod 2) V U.1.toSubgroup) := by sorry

-- The existing FixedPoints interface uses an explicit distributive group action.
-- This dictionary is on the same module and action, not merely an abstract isomorphism.
lemma invariants_eq_fixedPoints {M : Type u} [AddCommGroup M] [Module A M]
    [DistribMulAction G M] [SMulCommClass G A M]
    (h : Representation.IsSmooth (_root_.Representation.ofDistribMulAction A G M))
    (U : Subgroup G) :
    (invariants (of (_root_.Representation.ofDistribMulAction A G M) h) U).toAddSubgroup =
      FixedPoints.addSubgroup U M := by sorry
-- TauCeti.SmoothRep.iSup_invariants_compat_profinite
example (A : Type) [CommRing A] (p : ℕ) [Fact p.Prime] {M : Type}
    [AddCommGroup M] [Module A M] [DistribMulAction (Multiplicative ℤ_[p]) M]
    [SMulCommClass (Multiplicative ℤ_[p]) A M]
    (h : Representation.IsSmooth (_root_.Representation.ofDistribMulAction A
      (Multiplicative ℤ_[p]) M)) :
    (⨆ U : CompactOpenSubgroup (Multiplicative ℤ_[p]),
      (invariants (of (_root_.Representation.ofDistribMulAction A
        (Multiplicative ℤ_[p]) M) h) U.1.toSubgroup).toAddSubgroup) =
      ⨆ U : OpenNormalSubgroup (Multiplicative ℤ_[p]), FixedPoints.addSubgroup U.toSubgroup M := by sorry

-- The self-induction test retains the action by restricting back to the top subgroup.
-- Its carrier-only form above is strengthened by this representation isomorphism.
def indSelfIso (σ : SmoothRep A (⊤ : Subgroup G))
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G] :
    (res (⊤ : Subgroup G).subtype continuous_subtype_val).obj
      (ind (⊤ : Subgroup G) σ) ≅ σ := by sorry

-- The right Hecke action is a left action of the opposite ring, determined by
-- precomposition through the permutation representation.
def invariantsHeckeModuleCat [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (U : CompactOpenSubgroup G) (V : SmoothRep A G) :
    ModuleCat (HeckeAlgebraLevel G U A)ᵐᵒᵖ := by sorry
def invariantsHeckeUnderlying [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (U : CompactOpenSubgroup G) (V : SmoothRep A G) :
    invariantsHeckeModuleCat U V ≃+ invariants V U.1.toSubgroup := by sorry
lemma invariantsHeckeUnderlying_smul [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (U : CompactOpenSubgroup G) (V : SmoothRep A G)
    (h : HeckeAlgebraLevel G U A) (v : invariantsHeckeModuleCat U V) :
    invariantsHeckeUnderlying U V (MulOpposite.op h • v) =
      invariantsHeckeModule U V h (invariantsHeckeUnderlying U V v) := by sorry

-- Irreducibility is detected by all good compact open corners, not by a
-- single invariant space. A module generated by one simple corner can still
-- have an invisible proper submodule.
lemma invariants_simple_iff {k : Type u} [Field k]
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (hG : HasCofinalUnitProOrder k G) (V : SmoothRep k G) (hV : ¬ IsZero V) :
    Simple V ↔ ∀ U : CompactOpenSubgroup G, HasUnitProOrder k U.1 →
      Subsingleton (invariants V U.1.toSubgroup) ∨
        IsSimpleModule (HeckeAlgebraLevel G U k)ᵐᵒᵖ
          (invariantsHeckeModuleCat U V) := by sorry
end TauCeti.SmoothRep

namespace TauCeti.HeckeAlgebra
-- TauCeti.HeckeAlgebra.idempotent_finite
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] [Fintype G]
    (U : CompactOpenSubgroup G) (hU : IsUnit (Nat.card U.1 : A)) :
    idempotent (countingMeasure A G) U (by sorry) =
      (↑(hU.unit⁻¹) : A) • indicator (countingMeasure A G) (compactOpenSet U) := by sorry
-- TauCeti.HeckeAlgebra.idempotent_top
example {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : HasUnitProOrder A G) :
    let U := compactOpenTop G
    let μ := HaarMeasureWithValues.normalized (A := A) U (by sorry)
    idempotent μ U (by sorry) = indicator μ (compactOpenSet U) := by sorry
end TauCeti.HeckeAlgebra


namespace TauCeti
abbrev GoodCompactOpenSubgroup (A G : Type u) [CommRing A] [Group G]
    [TopologicalSpace G] := {K : CompactOpenSubgroup G // HasUnitProOrder A K.1}

namespace SmoothCentre
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]

-- Transition direction: from a smaller subgroup L to a larger subgroup K.
-- Centrality ensures that sandwiching with e_K preserves multiplication.
def cornerCentreTransition (K L : GoodCompactOpenSubgroup A G)
    (h : L.1.1 ≤ K.1.1) :
    Subring.center (HeckeAlgebraLevel G L.1 A) →+*
      Subring.center (HeckeAlgebraLevel G K.1 A) := by sorry
lemma cornerCentreTransition_on_invariants (K L : GoodCompactOpenSubgroup A G)
    (h : L.1.1 ≤ K.1.1) (z : Subring.center (HeckeAlgebraLevel G L.1 A))
    (V : SmoothRep A G) (v : SmoothRep.invariants V K.1.1.toSubgroup) :
    SmoothRep.inclLevel K.1 L.1 h V
      (SmoothRep.invariantsHeckeModule K.1 V (cornerCentreTransition K L h z) v) =
      SmoothRep.invariantsHeckeModule L.1 V z
        (SmoothRep.inclLevel K.1 L.1 h V v) := by sorry

def compatibleCornerCentres : Subring
    (∀ K : GoodCompactOpenSubgroup A G, Subring.center (HeckeAlgebraLevel G K.1 A)) where
  carrier := {z | ∀ (K L : GoodCompactOpenSubgroup A G) (h : L.1.1 ≤ K.1.1),
    cornerCentreTransition K L h (z L) = z K}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

-- This is the ordinary abelian-category centre. The enhanced comparison with
-- pi_0 End(id_D) is a separate packet gap and has no fabricated Lean carrier.
def equivLimCornerCentre (hG : HasCofinalUnitProOrder A G) :
    SmoothCentre A G ≃+* compatibleCornerCentres (A := A) (G := G) := by sorry
lemma app_permutation (hG : HasCofinalUnitProOrder A G)
    (z : SmoothCentre A G) (K : GoodCompactOpenSubgroup A G) :
    app z (SmoothRep.permutation K.1.1) =
      HeckeAlgebraLevel.equivPermutationEnd K.1 ((equivLimCornerCentre hG z).1 K) := by sorry

def coeffChange [Algebra A B] : SmoothCentre A G →+* SmoothCentre B G := by sorry
lemma coeffChange_scalar [Algebra A B] (a : A) :
    coeffChange (B := B) (algebraMap (G := G) a) =
      algebraMap (G := G) (Algebra.algebraMap A B a) := by sorry

-- The commutative case needs no invertibility of the pro-order.
-- It is a compatible family of discrete quotient group rings, not a discrete
-- group ring and not a limit of elements of a fabricated proposition carrier.
def quotientGroupRingTransition (K L : OpenNormalSubgroup G)
    (h : L.toSubgroup ≤ K.toSubgroup) :
    MonoidAlgebra A (G ⧸ L.toSubgroup) →+* MonoidAlgebra A (G ⧸ K.toSubgroup) :=
  MonoidAlgebra.mapDomainRingHom A (QuotientGroup.map L.toSubgroup K.toSubgroup
    (MonoidHom.id G) (by sorry))

def compatibleQuotientGroupRings : Subring
    (∀ K : OpenNormalSubgroup G, MonoidAlgebra A (G ⧸ K.toSubgroup)) where
  carrier := {z | ∀ (K L : OpenNormalSubgroup G) (h : L.toSubgroup ≤ K.toSubgroup),
    quotientGroupRingTransition K L h (z L) = z K}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

def equivLimitOfCommutative [CompactSpace G] (hcomm : ∀ x y : G, x * y = y * x) :
    SmoothCentre A G ≃+* compatibleQuotientGroupRings (A := A) (G := G) := by sorry
def equivLimGroupRing (hcomm : ∀ x y : G, x * y = y * x) :
    SmoothCentre A G ≃+* compatibleQuotientGroupRings (A := A) (G := G) := by sorry
def groupRingToCompatibleQuotients : MonoidAlgebra A G →+*
    compatibleQuotientGroupRings (A := A) (G := G) := by sorry
lemma groupRingToCompatibleQuotients_component (f : MonoidAlgebra A G)
    (K : OpenNormalSubgroup G) :
    (groupRingToCompatibleQuotients f).1 K =
      MonoidAlgebra.mapDomainRingHom A (QuotientGroup.mk' K.toSubgroup) f := by sorry
-- TauCeti.SmoothCentre.padicInt_ne_groupRing
example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (groupRingToCompatibleQuotients
      (A := ℤ) (G := Multiplicative ℤ_[p])) := by sorry

lemma ladic_separated (hG : HasCofinalUnitProOrder A G) (l : ℕ)
    (hA : ∀ a : A, (∀ n : ℕ, ∃ b : A, a = (l : A)^n * b) → a = 0)
    (z : SmoothCentre A G)
    (hz : ∀ n : ℕ, ∃ w : SmoothCentre A G, z = algebraMap (G := G) ((l : A)^n) * w) :
    z = 0 := by sorry
end SmoothCentre
end TauCeti


namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
attribute [local instance] HasDerivedCategory.standard

def tensor (V W : SmoothRep A G) : SmoothRep A G :=
  of (V.obj.ρ.tprod W.obj.ρ) (V.property.tprod W.property)

-- The direct-sum totalisation and differential still require construction.
-- The component signature fixes direct sums, not products, in unbounded degree.
def tensorComplex : CochainComplex (SmoothRep A G) ℤ ⥤
    CochainComplex (SmoothRep A G) ℤ ⥤ CochainComplex (SmoothRep A G) ℤ := by sorry
def tensorComplex_component (X Y : CochainComplex (SmoothRep A G) ℤ) (n : ℤ) :
    (((tensorComplex (A := A) (G := G)).obj X).obj Y).X n ≅
      ∐ (fun pq : {pq : ℤ × ℤ // pq.1 + pq.2 = n} ↦ tensor (X.X pq.1.1) (Y.X pq.1.2)) := by sorry

def IsKFlat (P : CochainComplex (SmoothRep A G) ℤ) : Prop :=
  ∀ X : CochainComplex (SmoothRep A G) ℤ,
    (∀ n : ℤ, IsZero ((HomologicalComplex.homologyFunctor _ _ n).obj X)) →
    ∀ n : ℤ, IsZero ((HomologicalComplex.homologyFunctor _ _ n).obj
      (((tensorComplex (A := A) (G := G)).obj P).obj X))
structure KFlatResolution (X : CochainComplex (SmoothRep A G) ℤ) where
  complex : CochainComplex (SmoothRep A G) ℤ
  arrow : complex ⟶ X
  quasiIso : QuasiIso arrow
  isKFlat : IsKFlat complex

def kFlatResolution (X : CochainComplex (SmoothRep A G) ℤ) : KFlatResolution X := by sorry

def derivedTensor : DerivedCat A G ⥤ DerivedCat A G ⥤ DerivedCat A G := by sorry
def derivedTensor_on_kFlat (P X : CochainComplex (SmoothRep A G) ℤ) (hP : IsKFlat P) :
    (((derivedTensor (A := A) (G := G)).obj (DerivedCategory.Q.obj P)).obj
      (DerivedCategory.Q.obj X)) ≅ DerivedCategory.Q.obj ((tensorComplex.obj P).obj X) := by sorry

-- RHom_G is A-valued; the internal derived Hom retains the smooth G-action.
-- They are distinct carriers and are related by the following adjunction.
def derivedInternalHom : (DerivedCat A G)ᵒᵖ ⥤ DerivedCat A G ⥤ DerivedCat A G := by sorry
def rHom_tensor_adjunction (B V W : DerivedCat A G) :
    ((rHom_functorial (A := A) (G := G)).obj
      (Opposite.op ((derivedTensor.obj B).obj V))).obj W ≅
    (rHom_functorial.obj (Opposite.op B)).obj
      ((derivedInternalHom.obj (Opposite.op V)).obj W) := by sorry

def derivedSmoothDual : (DerivedCat A G)ᵒᵖ ⥤ DerivedCat A G := by sorry
def derivedSmoothDual_eq_internalHom (V : DerivedCat A G) :
    (derivedSmoothDual (A := A) (G := G)).obj (Opposite.op V) ≅
      (derivedInternalHom.obj (Opposite.op V)).obj
        (singleFunctor.obj (of (_root_.Representation.trivial A G A) (by sorry))) := by sorry

def hom_derivedSmoothDual (B V : DerivedCat A G) :
    (B ⟶ (derivedSmoothDual (A := A) (G := G)).obj (Opposite.op V)) ≃ₗ[A]
      (((derivedTensor.obj B).obj V) ⟶
        singleFunctor.obj (of (_root_.Representation.trivial A G A) (by sorry))) := by sorry

-- Perfectness is an actual bounded finite-projective model in D(A).
def IsPerfectScalarComplex (X : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∃ P : CochainComplex (ModuleCat A) ℤ, Nonempty (DerivedCategory.Q.obj P ≅ X) ∧
    (∃ a b : ℤ, ∀ n : ℤ, n < a ∨ b < n → IsZero (P.X n)) ∧
    ∀ n : ℤ, Module.Finite A (P.X n) ∧ Module.Projective A (P.X n)
def IsAdmissibleComplex (V : DerivedCat A G) : Prop :=
  ∀ (K : CompactOpenSubgroup G), HasUnitProOrder A K.1 →
    IsPerfectScalarComplex ((derivedInvariantsUnbounded K).obj V)

def scalarDerivedDual : (DerivedCategory (ModuleCat.{u} A))ᵒᵖ ⥤
    DerivedCategory (ModuleCat.{u} A) := by sorry
def invariants_derivedSmoothDual (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCat A G) (K : CompactOpenSubgroup G) (hK : HasUnitProOrder A K.1) :
    (derivedInvariantsUnbounded K).obj (derivedSmoothDual.obj (Opposite.op V)) ≅
      scalarDerivedDual.obj (Opposite.op ((derivedInvariantsUnbounded K).obj V)) := by sorry

lemma IsAdmissibleComplex.derivedSmoothDual (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCat A G) (hV : IsAdmissibleComplex V) :
    IsAdmissibleComplex (derivedSmoothDual.obj (Opposite.op V)) := by sorry

def derivedToDoubleDual : 𝟭 (DerivedCat A G) ⟶
    (derivedSmoothDual (A := A) (G := G)).rightOp ⋙ derivedSmoothDual := by sorry
lemma toDoubleDual_isIso (hG : HasCofinalUnitProOrder A G)
    (V : DerivedCat A G) (hV : IsAdmissibleComplex V) :
    IsIso ((derivedToDoubleDual (A := A) (G := G)).app V) := by sorry

def derivedSmoothDual_heart {k : Type u} [Field k]
    (hG : HasCofinalUnitProOrder k G) (V : SmoothRep k G)
    (hV : Representation.IsAdmissible V.obj.ρ) :
    (derivedSmoothDual (A := k) (G := G)).obj (Opposite.op (singleFunctor.obj V)) ≅
      singleFunctor.obj (smoothDual V) := by sorry
-- TauCeti.SmoothRep.derivedSmoothDual_character
example (hG : HasCofinalUnitProOrder A G) (χ : G →* Aˣ) (hχ : IsSmoothCharacter χ) :
    Nonempty (derivedSmoothDual.obj (Opposite.op (singleFunctor.obj (ofCharacter χ hχ))) ≅
      singleFunctor.obj (ofCharacter χ⁻¹ (by sorry))) := by sorry
-- TauCeti.SmoothRep.derivedSmoothDual_zero
example : IsZero ((derivedSmoothDual (A := A) (G := G)).obj (Opposite.op (singleFunctor.obj (of (_root_.Representation.trivial A G (Fin 0 → A)) (by sorry))))) := by sorry
-- TauCeti.SmoothRep.not_isAdmissibleComplex_cInd
example (p l : ℕ) [Fact p.Prime] [Fact l.Prime] (hpl : p ≠ l) :
    ¬ IsAdmissibleComplex (singleFunctor.obj
      (permutation (A := ZMod l) (padicIntegerCompactOpen p).1)) := by sorry
-- TauCeti.SmoothRep.derivedSmoothDual_compat_smoothDual
example (p l : ℕ) [Fact p.Prime] [Fact l.Prime] (hpl : p ≠ l)
    (V : SmoothRep (ZMod l) (Multiplicative ℤ_[p])) [Module.Finite (ZMod l) V.obj] :
    Nonempty (derivedSmoothDual.obj (Opposite.op (singleFunctor.obj V)) ≅
      singleFunctor.obj (smoothDual V)) := by sorry

-- A closed normal subgroup quotient retains a quotient-group action before
-- taking invariants. This is not a composition of two scalar-valued functors.
def quotientInvariantsFunctor (N : Subgroup G) [N.Normal] :
    SmoothRep A G ⥤ SmoothRep A (G ⧸ N) :=
  ObjectProperty.lift _ (ι ⋙ _root_.Rep.quotientToInvariantsFunctor A N) (by
    intro V
    sorry)
instance quotientInvariantsFunctor_additive (N : Subgroup G) [N.Normal] :
    (quotientInvariantsFunctor (A := A) N).Additive := by sorry
def derivedQuotientInvariants (N : Subgroup G) [N.Normal] :
    DerivedCatPlus A G ⥤ DerivedCatPlus A (G ⧸ N) :=
  (quotientInvariantsFunctor (A := A) N).rightDerivedFunctorPlus

def derivedInvariants_comp_normal [CompactSpace G] (N : Subgroup G) [N.Normal]
    (hN : IsClosed (N : Set G)) [T2Space (G ⧸ N)] [TotallyDisconnectedSpace (G ⧸ N)] :
    derivedInvariants (A := A) (compactOpenTop G) ≅
      derivedQuotientInvariants N ⋙ derivedInvariants (compactOpenTop (G ⧸ N)) := by sorry
end TauCeti.SmoothRep


namespace TauCeti
-- Concrete reductive theorem prototypes use GL_n(Q_p). General reductive
-- parabolic/root data remain in the supplier omission ledger.
abbrev PadicGL (n p : ℕ) [Fact p.Prime] := (Matrix (Fin n) (Fin n) ℚ_[p])ˣ

namespace SmoothRep
lemma isAdmissible_of_irreducible (n p : ℕ) [Fact p.Prime]
    (V : SmoothRep ℂ (PadicGL n p)) [Simple V] :
    Representation.IsAdmissible V.obj.ρ := by sorry
lemma uniform_admissibility (n p : ℕ) [Fact p.Prime]
    (K : CompactOpenSubgroup (PadicGL n p)) :
    ∃ c : ℕ, ∀ V : SmoothRep ℂ (PadicGL n p), Simple V →
      Module.Finite ℂ (invariants V K.1.toSubgroup) ∧
        Module.finrank ℂ (invariants V K.1.toSubgroup) ≤ c := by sorry
lemma isNoetherian_of_fg (n p : ℕ) [Fact p.Prime]
    (V : SmoothRep ℂ (PadicGL n p))
    [Module.Finite (MonoidAlgebra ℂ (PadicGL n p)) (_root_.Representation.asModule V.obj.ρ)] :
    IsNoetherian (MonoidAlgebra ℂ (PadicGL n p)) (_root_.Representation.asModule V.obj.ρ) := by sorry

-- The centre acts by multiplication; this definition uses the existing ring
-- homomorphism into the Hecke ring and fixes its scalar action explicitly.
@[instance_reducible]
def heckeCentreModule (n p : ℕ) [Fact p.Prime]
    [LocallyCompactSpace (PadicGL n p)] [TotallyDisconnectedSpace (PadicGL n p)]
    (K : CompactOpenSubgroup (PadicGL n p)) :
    Module (Subring.center (HeckeAlgebraLevel (PadicGL n p) K ℂ))
      (HeckeAlgebraLevel (PadicGL n p) K ℂ) :=
  Module.compHom (HeckeAlgebraLevel (PadicGL n p) K ℂ) (Subring.subtype _)
lemma heckeLevel_finite_over_centre (n p : ℕ) [Fact p.Prime]
    [LocallyCompactSpace (PadicGL n p)] [TotallyDisconnectedSpace (PadicGL n p)]
    (K : CompactOpenSubgroup (PadicGL n p)) :
    letI := heckeCentreModule n p K
    Module.Finite (Subring.center (HeckeAlgebraLevel (PadicGL n p) K ℂ))
      (HeckeAlgebraLevel (PadicGL n p) K ℂ) := by sorry
end SmoothRep

lemma finrank_commSubalgebra_le {V : Type} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (R : Subalgebra ℂ (Module.End ℂ V)) (l : ℕ)
    (hcomm : ∀ x y : R, x * y = y * x)
    (hgen : ∃ x : Fin l → Module.End ℂ V, Algebra.adjoin ℂ (Set.range x) = R) :
    (Module.finrank ℂ R : ℝ) ≤
      Real.rpow (Module.finrank ℂ V) (2 - (2 : ℝ) ^ (1 - (l : ℤ))) := by sorry
end TauCeti


namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]

-- All quotient indices use the existing HeckeCoset double-coset carrier.
abbrev InductionDoubleCosets (H : Subgroup G) (K : OpenSubgroup G) :=
  HeckeCoset (⊤ : Submonoid G) H K.toSubgroup

def invariants_ind_equiv (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : SmoothRep A H) (K : CompactOpenSubgroup G)
    (x : InductionDoubleCosets H K.1 → G)
    (hx : ∀ i, HeckeCoset.mk H K.1.toSubgroup ⟨x i, by trivial⟩ = i) :
    invariants (ind H σ) K.1.toSubgroup ≃ₗ[A]
      ∀ i : InductionDoubleCosets H K.1,
        invariants σ ((K.1.toSubgroup.map (MulAut.conj (x i)).toMonoidHom).comap H.subtype) := by sorry

def invariants_cInd_equiv (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : SmoothRep A H) (K : CompactOpenSubgroup G)
    (x : InductionDoubleCosets H K.1 → G)
    (hx : ∀ i, HeckeCoset.mk H K.1.toSubgroup ⟨x i, by trivial⟩ = i) :
    invariants (cInd H σ) K.1.toSubgroup ≃ₗ[A]
      ⨁ i : InductionDoubleCosets H K.1,
        invariants σ ((K.1.toSubgroup.map (MulAut.conj (x i)).toMonoidHom).comap H.subtype) := by sorry

def subgroupTowerEquiv (K H : Subgroup G) (hKH : K ≤ H) :
    K.subgroupOf H ≃ₜ* K := by sorry
lemma subgroupTowerEquiv_apply (K H : Subgroup G) (hKH : K ≤ H)
    (k : K.subgroupOf H) : ((subgroupTowerEquiv K H hKH k : K) : G) = (k : H) := by sorry

def indIndIso (K H : Subgroup G) (hKH : K ≤ H)
    (hK : IsClosed (K : Set G)) (hH : IsClosed (H : Set G)) :
    res (A := A) (subgroupTowerEquiv K H hKH).toMonoidHom (by sorry) ⋙
      indFunctor (K.subgroupOf H) ⋙ indFunctor H ≅ indFunctor K := by sorry

def cIndIndIso (K H : Subgroup G) (hKH : K ≤ H)
    (hK : IsClosed (K : Set G)) (hH : IsClosed (H : Set G)) :
    res (A := A) (subgroupTowerEquiv K H hKH).toMonoidHom (by sorry) ⋙
      cIndFunctor (K.subgroupOf H) ⋙ cIndFunctor H ≅ cIndFunctor K := by sorry

def cIndProjection (H : Subgroup G) (hH : IsClosed (H : Set G))
    (σ : SmoothRep A H) (V : SmoothRep A G) :
    cInd H (tensor σ ((res H.subtype continuous_subtype_val).obj V)) ≅
      tensor (cInd H σ) V := by sorry

-- TauCeti.SmoothRep.res_of_open_equiv
example (U V : OpenSubgroup G) (hVU : V ≤ U)
    (x : HeckeCoset (⊤ : Submonoid G) U.toSubgroup V.toSubgroup → G)
    (hx : ∀ i, HeckeCoset.mk U.toSubgroup V.toSubgroup ⟨x i, by trivial⟩ = i) :
    Nonempty (((res U.toSubgroup.subtype continuous_subtype_val).obj (permutation (A := A) V)).obj ≅
      _root_.Rep.of (_root_.Representation.directSum
        (fun i : HeckeCoset (⊤ : Submonoid G) U.toSubgroup V.toSubgroup ↦
          _root_.Representation.ofMulAction A U.toSubgroup
            (U.toSubgroup ⧸ (V.toSubgroup.map (MulAut.conj (x i)).toMonoidHom).comap U.toSubgroup.subtype)))) := by sorry

-- Trace is an unnormalised finite sum and is available in characteristic p.
lemma traceLevel_apply (U U' : CompactOpenSubgroup G) (h : U'.1 ≤ U.1)
    (V : SmoothRep A G) [Fintype (U.1 ⧸ U'.1.toSubgroup.subgroupOf U.1.toSubgroup)]
    (s : U.1 ⧸ U'.1.toSubgroup.subgroupOf U.1.toSubgroup → U.1)
    (hs : Function.RightInverse s (Quotient.mk''))
    (v : invariants V U'.1.toSubgroup) :
    (traceLevel U U' h V v : V.obj) =
      ∑ q : U.1 ⧸ U'.1.toSubgroup.subgroupOf U.1.toSubgroup, V.obj.ρ (s q) v := by sorry
end TauCeti.SmoothRep

namespace TauCeti
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

def conjugateInNormalizer (N : Subgroup G) (m : Subgroup.normalizer (N : Set G)) : N ≃ₜ* N := by sorry
lemma conjugateInNormalizer_apply (N : Subgroup G) (m : Subgroup.normalizer (N : Set G)) (n : N) :
    (conjugateInNormalizer N m n : G) = m * n * (m : G)⁻¹ := by sorry

def conjugateCompactOpen (N : Subgroup G) (m : Subgroup.normalizer (N : Set G)) (K : CompactOpenSubgroup N) :
    CompactOpenSubgroup N := by sorry
lemma mem_conjugateCompactOpen (N : Subgroup G) (m : Subgroup.normalizer (N : Set G))
    (K : CompactOpenSubgroup N) (n : N) :
    n ∈ (conjugateCompactOpen N m K).1 ↔ (conjugateInNormalizer N m).symm n ∈ K.1 := by sorry

def modulus (N : Subgroup G) [T2Space N] [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] : Subgroup.normalizer (N : Set G) →* ℚˣ := by sorry
lemma modulus_positive (N : Subgroup G) [T2Space N] [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] (m : Subgroup.normalizer (N : Set G)) : 0 < (modulus N m : ℚ) := by sorry
lemma modulus_mul (N : Subgroup G) [T2Space N] [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] (m m' : Subgroup.normalizer (N : Set G)) :
    modulus N (m * m') = modulus N m * modulus N m' := by sorry
lemma modulus_indexRatio (N : Subgroup G) [T2Space N] [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] (m : Subgroup.normalizer (N : Set G)) (K : CompactOpenSubgroup N) :
    (modulus N m : ℚ) =
      (K.1.toSubgroup.relIndex (conjugateCompactOpen N m K).1.toSubgroup : ℚ) /
        ((conjugateCompactOpen N m K).1.toSubgroup.relIndex K.1.toSubgroup : ℚ) := by sorry
lemma modulus_eq_index (N : Subgroup G) [T2Space N] [LocallyCompactSpace N]
    [TotallyDisconnectedSpace N] (m : Subgroup.normalizer (N : Set G)) (K : CompactOpenSubgroup N)
    (hK : K.1 ≤ (conjugateCompactOpen N m K).1) :
    (modulus N m : ℚ) =
      (K.1.toSubgroup.relIndex (conjugateCompactOpen N m K).1.toSubgroup : ℚ) := by sorry
end TauCeti


namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
attribute [local instance] HasDerivedCategory.standard

-- R-linear maps are A-linear via the central A-algebra structure on R.
def moduleRHomOver (R : Type u) [Ring R] [Algebra A R] :
    (DerivedCategory (ModuleCat.{u} R))ᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} R) ⥤
      DerivedCategory (ModuleCat.{u} A) := by sorry

def derivedEquivModuleOfDiscrete [DiscreteTopology G] :
    DerivedCat A G ≌ DerivedCategory (ModuleCat.{u} (MonoidAlgebra A G)) := by sorry
-- TauCeti.SmoothRep.rHom_discrete_compat
example [Finite G] [DiscreteTopology G] (X Y : DerivedCat A G) :
    Nonempty (((rHom_functorial (A := A) (G := G)).obj (Opposite.op X)).obj Y ≅
      ((moduleRHomOver (A := A) (MonoidAlgebra A G)).obj
        (Opposite.op ((derivedEquivModuleOfDiscrete (A := A) (G := G)).functor.obj X))).obj
          ((derivedEquivModuleOfDiscrete (A := A) (G := G)).functor.obj Y)) := by sorry

-- The stabiliser inside U is compact and open there, even when written as
-- an intersection with a conjugate subgroup in G.
def doubleCosetStabilizer (U : CompactOpenSubgroup G) (g : G) :
    CompactOpenSubgroup U.1.toSubgroup := by sorry
lemma mem_doubleCosetStabilizer (U : CompactOpenSubgroup G) (g : G) (u : U.1.toSubgroup) :
    u ∈ (doubleCosetStabilizer U g).1 ↔ g⁻¹ * (u : G) * g ∈ U.1 := by sorry

def doubleCosetCohomology (U : CompactOpenSubgroup G) (g : G) (n : ℕ) :
    ModuleCat.{u} A := by sorry
-- Agreement with continuous cohomology is expressed through derived invariants
-- on the compact group U, so the coefficient topology is always discrete.
def doubleCosetCohomology_eq_derivedInvariants (U : CompactOpenSubgroup G)
    [CompactSpace U.1.toSubgroup] (g : G) (n : ℕ) :
    doubleCosetCohomology (A := A) U g n ≅
      (derivedInvariantsOnHeart (doubleCosetStabilizer U g) n).obj
        (of (_root_.Representation.trivial A U.1.toSubgroup A) (by sorry)) := by sorry

def derivedHecke_equiv_doubleCoset (U : CompactOpenSubgroup G) (n : ℕ)
    (x : HeckeCoset (⊤ : Submonoid G) U.1.toSubgroup U.1.toSubgroup → G)
    (hx : ∀ i, HeckeCoset.mk U.1.toSubgroup U.1.toSubgroup ⟨x i, by trivial⟩ = i) :
    derivedHecke (A := A) U n ≃ₗ[A]
      ⨁ i : HeckeCoset (⊤ : Submonoid G) U.1.toSubgroup U.1.toSubgroup,
        doubleCosetCohomology (A := A) U (x i) n := by sorry

-- A split product gives an honest untwisted test. A general normal subgroup
-- has conjugation and extension cocycles and is not substituted here.
def splitCompactOpen {U D : Type u} [Group U] [TopologicalSpace U]
    [IsTopologicalGroup U] [CompactSpace U] [Group D] [TopologicalSpace D]
    [DiscreteTopology D] : CompactOpenSubgroup (U × D) := by sorry
lemma mem_splitCompactOpen {U D : Type u} [Group U] [TopologicalSpace U]
    [IsTopologicalGroup U] [CompactSpace U] [Group D] [TopologicalSpace D]
    [DiscreteTopology D] (x : U × D) :
    x ∈ (splitCompactOpen (U := U) (D := D)).1 ↔ x.2 = 1 := by sorry
-- TauCeti.SmoothRep.derivedHecke_normal
example (p : ℕ) [Fact p.Prime] (D : Type) [Group D] [TopologicalSpace D]
    [DiscreteTopology D] (n : ℕ) :
    Nonempty (derivedHecke (A := ZMod p)
      (splitCompactOpen (U := Multiplicative ℤ_[p]) (D := D)) n ≃ₗ[ZMod p]
        MonoidAlgebra (ZMod p) D ⊗[ZMod p]
          ext (of (_root_.Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)) (by sorry))
            (of (_root_.Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)) (by sorry)) n) := by sorry
end TauCeti.SmoothRep


namespace TauCeti.Representation
-- Unbounded conductors are essential: infinitely many distinct characters
-- all factoring through one finite quotient would not be admissible.
def exactConductorCharacter (p n : ℕ) [Fact p.Prime] :
    Multiplicative ℤ_[p] →* ℂˣ := by sorry
lemma exactConductorCharacter_ker (p n : ℕ) [Fact p.Prime] :
    (exactConductorCharacter p n).ker = (TauCeti.padicCongruence p (n+1)).toSubgroup := by sorry

def conductorCharacterSum (p : ℕ) [Fact p.Prime] :
    _root_.Representation ℂ (Multiplicative ℤ_[p]) (⨁ _ : ℕ, ℂ) :=
  _root_.Representation.directSum
    (fun n : ℕ ↦ TauCeti.SmoothRep.characterRepresentation (exactConductorCharacter p n))
-- TauCeti.Representation.admissible_not_fg
example (p : ℕ) [Fact p.Prime] :
    IsAdmissible (conductorCharacterSum p) ∧
      ¬ Module.Finite (MonoidAlgebra ℂ (Multiplicative ℤ_[p]))
        (_root_.Representation.asModule (conductorCharacterSum p)) := by sorry
end TauCeti.Representation

namespace TauCeti.HeckeAlgebra
-- Central-character functions have compact support modulo Z; requiring compact
-- support in G itself would give the wrong carrier when Z is noncompact.
def withCentralCharacter {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (Z : Subgroup G) [Z.Normal] (hZ : Z ≤ Subgroup.center G)
    (ω : Z →* Aˣ) (hω : TauCeti.IsSmoothCharacter ω) : Submodule A (LocallyConstant G A) where
  carrier := { f | (∀ z : Z, ∀ g : G, f (z * g) = (↑((ω z)⁻¹) : A) * f g) ∧
    IsCompact (TauCeti.SmoothRep.projectedSupport Z f) }
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
lemma mem_withCentralCharacter {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (Z : Subgroup G) [Z.Normal] (hZ : Z ≤ Subgroup.center G)
    (ω : Z →* Aˣ) (hω : TauCeti.IsSmoothCharacter ω) (f : LocallyConstant G A) :
    f ∈ withCentralCharacter Z hZ ω hω ↔
      (∀ z : Z, ∀ g : G, f (z * g) = (↑((ω z)⁻¹) : A) * f g) ∧
        IsCompact (TauCeti.SmoothRep.projectedSupport Z f) := by sorry
end TauCeti.HeckeAlgebra

namespace TauCeti.SmoothRep
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
attribute [local instance] HasDerivedCategory.standard
-- Fix the meaning of the auxiliary scalar dual against the A-valued derived Hom.
def scalarDerivedDual_eq_rHom (X : DerivedCategory (ModuleCat.{u} A)) :
    (scalarDerivedDual (A := A)).obj (Opposite.op X) ≅
      ((moduleRHomOver (A := A) A).obj (Opposite.op X)).obj
        ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by sorry
end TauCeti.SmoothRep

namespace TauCeti.HeckeAlgebra
variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (μ : TauCeti.HaarMeasureWithValues A G)
lemma baseChangeEquiv_mul_pure (b b' : B) (f f' : TauCeti.HeckeAlgebra μ) :
    baseChangeEquiv μ ((b*b') ⊗ₜ[A] (f*f')) =
      baseChangeEquiv μ (b ⊗ₜ[A] f) * baseChangeEquiv μ (b' ⊗ₜ[A] f') := by sorry
end TauCeti.HeckeAlgebra

namespace TauCeti.HeckeAlgebraLevel
variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] (U : TauCeti.CompactOpenSubgroup G)
lemma baseChange_mul_pure (b b' : B) (f f' : TauCeti.HeckeAlgebraLevel G U A) :
    baseChange U ((b*b') ⊗ₜ[A] (f*f')) =
      baseChange U (b ⊗ₜ[A] f) * baseChange U (b' ⊗ₜ[A] f') := by sorry
end TauCeti.HeckeAlgebraLevel

namespace TauCeti.SmoothRep
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
-- Smooth endomorphisms use the two-sided G × G action on all linear maps,
-- not the scalar ring End_G(V).
def leftRightEndRepresentation (V : SmoothRep ℂ G) :
    _root_.Representation ℂ (G × G) (Module.End ℂ V.obj) := by sorry
lemma leftRightEndRepresentation_apply (V : SmoothRep ℂ G)
    (g : G × G) (T : Module.End ℂ V.obj) (v : V.obj) :
    leftRightEndRepresentation V g T v = V.obj.ρ g.1 (T (V.obj.ρ g.2⁻¹ v)) := by sorry

def regularFourier (V : SmoothRep ℂ G) :
    LocallyConstantCompact ℂ G ℂ →ₗ[ℂ]
      (Representation.smoothVectors (leftRightEndRepresentation V)).toSubmodule := by sorry
def fourierIntegrand (V : SmoothRep ℂ G) (f : LocallyConstantCompact ℂ G ℂ)
    (v : V.obj) : LocallyConstantCompact ℂ G V.obj := by sorry
lemma fourierIntegrand_apply (V : SmoothRep ℂ G) (f : LocallyConstantCompact ℂ G ℂ)
    (v : V.obj) (g : G) : fourierIntegrand V f v g = f g • V.obj.ρ g v := by sorry

lemma regularFourier_apply (V : SmoothRep ℂ G) (f : LocallyConstantCompact ℂ G ℂ)
    (v : V.obj) :
    (regularFourier V f).1 v = LocallyConstantCompact.integral
      (HaarMeasureWithValues.normalized (A := ℂ)
        (Classical.choose (exists_compactOpenSubgroup_le G Set.univ (by sorry))) (by sorry))
      (fourierIntegrand V f v) := by sorry

def smoothEndTensorEquiv (V : SmoothRep ℂ G)
    (hV : Representation.IsAdmissible V.obj.ρ) :
    (Representation.smoothVectors (leftRightEndRepresentation V)).toSubmodule ≃ₗ[ℂ]
      V.obj ⊗[ℂ] (smoothDual V).obj := by sorry
lemma isotypicQuotient_regular (V : SmoothRep ℂ G) [Simple V]
    (hV : Representation.IsAdmissible V.obj.ρ) :
    Function.Surjective (regularFourier V) := by sorry
end TauCeti.SmoothRep

namespace TauCeti.HeckeAlgebra
variable {A G : Type u} [CommRing A] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] [LocallyCompactSpace G] [TotallyDisconnectedSpace G]
    (Z : Subgroup G) [Z.Normal] (hZ : Z ≤ Subgroup.center G)
    (ω : Z →* Aˣ) (hω : TauCeti.IsSmoothCharacter ω)
-- The two central-character factors cancel, so the integrand descends to G/Z.
def centralIntegrand
    (f f' : withCentralCharacter Z hZ ω hω) (g : G) :
    TauCeti.LocallyConstantCompact A (G ⧸ Z) A := by sorry
lemma centralIntegrand_apply (f f' : withCentralCharacter Z hZ ω hω) (g y : G) :
    centralIntegrand Z hZ ω hω f f' g (QuotientGroup.mk y) = f.1 y * f'.1 (y⁻¹*g) := by sorry

def centralConvolution (μ : TauCeti.HaarMeasureWithValues A (G ⧸ Z))
    [T2Space (G ⧸ Z)] [LocallyCompactSpace (G ⧸ Z)] [TotallyDisconnectedSpace (G ⧸ Z)]
    (f f' : withCentralCharacter Z hZ ω hω) : withCentralCharacter Z hZ ω hω := by sorry
lemma centralConvolution_apply (μ : TauCeti.HaarMeasureWithValues A (G ⧸ Z))
    [T2Space (G ⧸ Z)] [LocallyCompactSpace (G ⧸ Z)] [TotallyDisconnectedSpace (G ⧸ Z)]
    (f f' : withCentralCharacter Z hZ ω hω) (g : G) :
    (centralConvolution Z hZ ω hω μ f f').1 g =
      TauCeti.LocallyConstantCompact.integral μ (centralIntegrand Z hZ ω hω f f' g) := by sorry
end TauCeti.HeckeAlgebra

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants
Requires the requested GL₂ Cartan representatives and the compact subgroup GL₂(ℤ_p); no surrogate compact subgroup is assumed.
test: TauCeti.SmoothRep.invariants_permutation_gl2
  For G = GL_2(ℚ_p) and U = GL_2(ℤ_p), the U-invariants of ℤ[G/U] are free on the double cosets of diag(p^a,p^b), a ≥ b.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-hecke-algebra
Requires the named all-degree restriction, conjugation, cup and corestriction maps of ProfiniteCohomology Layers 10 and 12, and the Yoneda comparison. The additive Shapiro signature is already above.
API: TauCeti.SmoothRep.derivedHecke_mul_doubleCoset
  The product in the double-coset model is a sum over double cosets of restriction, conjugation and corestriction (Venkatesh §2.4, (25)).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra
Requires GL₂(ℤ_p), its diag(p,1) double coset and the requested Cartan/coset enumeration.
test: TauCeti.HeckeAlgebraLevel.gl2_tp_card
  For G = GL_2(ℚ_p), U = GL_2(ℤ_p), [U diag(p,1) U] is the sum of p + 1 left cosets.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.HasIwahoriDecomposition
  Let P = M ⋉ N and P̄ = M ⋉ N̄ be closed subgroups of a locally profinite G with P ∩ N̄ = 1 and N̄MN open in G (a parabolic pair, as for opposite parabolic subgroups of a reductive group, supplied by Tau Ceti ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.3). A compact open subgroup U has an Iwahori decomposition with respect to (P, P̄) if multiplication U_{N̄} × U_M × U_N → U is bijective, where U_X = U ∩ X. An element m ∈ M is U-positive if m U_N m⁻¹ ⊆ U_N and m⁻¹ U_{N̄} m ⊆ U_{N̄}; the U-positive elements form a monoid Δ_M⁺ containing U_M, and Δ⁺ := U_N Δ_M⁺ U_{N̄}. A central z ∈ Z(M) ∩ Δ_M⁺ is strongly positive if for all compact open H₁, H₂ ⊆ N there is n ≥ 0 with z^n H₁ z^{−n} ⊆ H₂, and for all compact open K₁, K₂ ⊆ N̄ there is n ≥ 0 with z^{−n} K₁ z^n ⊆ K₂ (so ⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄).
API: TauCeti.positiveMonoid
  Δ_M⁺ := {m ∈ M | m U_N m⁻¹ ⊆ U_N, m⁻¹ U_{N̄} m ⊆ U_{N̄}} as a Submonoid M.
API: TauCeti.IsStronglyPositive
  Central z ∈ Δ_M⁺ contracting N under conjugation by z and N̄ under z⁻¹, in the sense of the statement.
API: TauCeti.HasIwahoriDecomposition.mul_mem_iff
  Every u ∈ U is uniquely ū m n with ū ∈ U_{N̄}, m ∈ U_M, n ∈ U_N, and also uniquely n m ū.
API: TauCeti.positiveMonoid.mul_mem
  Δ_M⁺ is a submonoid containing U_M.
API: TauCeti.IsStronglyPositive.iUnion_conj
  ⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄.
API: TauCeti.HasIwahoriDecomposition.conj
  Conjugation by g ∈ G transports Iwahori decompositions with respect to (P, P̄) to (gPg⁻¹, gP̄g⁻¹).
test: TauCeti.HasIwahoriDecomposition.gl2_iwahori
  The Iwahori subgroup of GL_2(ℚ_p) has an Iwahori decomposition with respect to the upper and lower Borels.
test: TauCeti.not_hasIwahoriDecomposition_gl2_maximal
  GL_2(ℤ_p) has no Iwahori decomposition with respect to (B, B̄).
test: TauCeti.IsStronglyPositive.gl2_diag
  diag(p, 1) is strongly positive for (B, B̄) and the Iwahori subgroup.
test: TauCeti.HasIwahoriDecomposition.trivial_parabolic
  With P = G, every compact open U has an Iwahori decomposition and positiveMonoid = ⊤.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.positiveHeckeHom
  Let U have an Iwahori decomposition with respect to (P, P̄) and let H(Δ_M⁺, U_M) ⊆ H(M, U_M) and H(Δ⁺, U) ⊆ H(G, U) be the ℤ-spans of the double cosets [U_M m U_M] (m ∈ Δ_M⁺) and [U δ U] (δ ∈ Δ⁺). Then: (1) for m, m' ∈ Δ_M⁺, U m U m' U = U m U_M m' U; if m and m' also normalise U_M, this becomes U m m' U and [U m U][U m' U] = [U m m' U] in H(G, U; ℤ); (2) the ℤ-linear map t : H(Δ_M⁺, U_M) → H(Δ⁺, U), [U_M m U_M] ↦ [U m U], is an injective ring homomorphism; (3) with 𝒮 = r_M ∘ r_P the restriction–integration map, t ∘ 𝒮 and 𝒮 ∘ t multiply [U m U], resp. [U_M m U_M], by |δ_P(m)|⁻¹ = #(U_N / m U_N m⁻¹). In particular the span of {[U m U] : m in a commutative submonoid of Δ_M⁺ that normalises U_M} is a commutative subalgebra of H(G, U; ℤ). For M = T a maximal torus of a split group, U = K_p with an Iwahori decomposition relative to (B, B̄) and T⁺ the monoid of t with t U_{K_p} t⁻¹ ⊆ U_{K_p} and t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p}, t ↦ [K_p t K_p] is an algebra homomorphism ℤ[T⁺/T_{K_p}] → H(G, K_p; ℤ). The two contraction conditions are needed: the product decomposition alone does not make t ↦ [K_p t K_p] multiplicative.
API: TauCeti.positiveHeckeHom_injective
  t is injective.
API: TauCeti.doubleCoset_mul_of_positive
  For m,m' ∈ Δ_M⁺ that normalise U_M, [U m U][U m' U] = [U m m' U]. Without the normaliser hypothesis use the Levi structure constants via positiveHeckeHom, not a single-coset formula.
API: TauCeti.positiveHeckeHom_comp_restrict
  t ∘ 𝒮 = |δ_P|⁻¹ · and 𝒮 ∘ t = |δ_P|⁻¹ · on basis elements.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/strongly-positive-localisation
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.positiveHeckeHom_localization
  In the setting of positive-hecke-homomorphism let z ∈ Z(M) be strongly positive. Then [U_M z U_M] is central and invertible in H(M, U_M; ℤ), every [U_M m U_M] times a power of [U_M z U_M] lies in H(Δ_M⁺, U_M), and H(Δ_M⁺, U_M)[[U_M z U_M]⁻¹] = H(M, U_M; ℤ). If R is a ring in which q (the residue cardinality, so that |δ_P|⁻¹ is a power of q) is a unit and [UzU] is invertible in H(G, U) ⊗ R, then t ⊗ R and 𝒮 ⊗ R extend uniquely to algebra isomorphisms between H(M, U_M) ⊗ R and (H(Δ⁺, U) ⊗ R)[[UzU]⁻¹], inverse to each other up to the twist by |δ_P|.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/pro-iwahori-torus
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.proIwahoriTorusHom
  Let G be a split reductive group over the ring of integers O_v of a nonarchimedean local field F_v with residue field k(v) of characteristic p, B = TU a Borel, Iw(v) and Iw₁(v) the preimages of B(k(v)) and U(k(v)) under G(O_v) → G(k(v)), O a ring containing q_v^{1/2}, and H₁ = O[Iw₁(v)\G(F_v)/Iw₁(v)]. For x, y in the positive monoid T(F_v)⁺ = {t : α(t) ∈ O_v for every simple root α}, [Iw₁ x Iw₁][Iw₁ y Iw₁] = [Iw₁ xy Iw₁], and [Iw₁ x Iw₁] is a unit of H₁[1/p] (of H₁ when p is invertible in O). Writing t = x y⁻¹ with x, y positive, t ↦ δ_B^{1/2}(t)[Iw₁ x Iw₁][Iw₁ y Iw₁]⁻¹ is a well-defined homomorphism T(F_v) → (H₁[1/p])ˣ with kernel T(O_v)₁ = ker(T(O_v) → T(k(v))); the Iwahori analogue embeds O[X_*(T)] ⊗ O[1/p] into O[Iw(v)\G(F_v)/Iw(v)][1/p].
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/klingen-positive-hecke
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.klingenPositiveHecke_isPolynomial
  Let ℓ be a prime, J = (0 A; −A 0) with A the 2 × 2 antidiagonal matrix of ones, GSp_4(ℚ_ℓ) = {g ∈ GL_4(ℚ_ℓ) : gᵀ J g = ν(g) J, ν(g) ∈ ℚ_ℓ^×}, and Kli(ℓ) ⊆ GSp_4(ℤ_ℓ) the Klingen parahoric, the elements whose reduction mod ℓ stabilises the line F_ℓ e₁. Let U₀ = [Kli ℓ·1 Kli], U₁ = [Kli diag(ℓ², ℓ, ℓ, 1) Kli] and U₂ = [Kli diag(ℓ, ℓ, 1, 1) Kli] in H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ). Then U₀, U₁, U₂ commute and the ring map ℤ[X₀, X₁, X₂] → H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ), X_i ↦ U_i, is injective: the subring H⁺_Kli they generate is a polynomial ring in U₀, U₁, U₂.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.IwahoriHecke.iwahoriMatsumoto
  Let G be a split connected reductive group over a nonarchimedean local field F with residue cardinality q, I an Iwahori subgroup, and W̃ = N_G(T)(F)/T(O_F) the extended affine Weyl group, W̃ = W_aff ⋊ Ω with W_aff a Coxeter group on the simple affine reflections S_aff and Ω the length-zero elements. Then G = ⊔_{w ∈ W̃} IwI, [IwI : I] = q^{ℓ(w)}, and H(G, I; ℤ) is free over ℤ on T_w = [IwI] (w ∈ W̃) with: T_w T_{w'} = T_{ww'} when ℓ(ww') = ℓ(w) + ℓ(w'); (T_s − q)(T_s + 1) = 0 for s ∈ S_aff; T_ω T_w = T_{ωw} for ω ∈ Ω. These relations (quadratic, braid and length-zero) present H(G, I; ℤ) ≅ ℤ[Ω] ⊗̃ H_aff. Base change gives H(G, I; A) for every A; each T_w is invertible once q ∈ Aˣ; if q = 1 in A then H(G, I; A) ≅ A[W̃].
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.IwahoriHecke.bernsteinPresentation
  In the setting of iwahori-matsumoto let A be a ring containing an inverse square root q^{−1/2} of q. For a dominant cocharacter λ set θ_λ = q^{−ℓ(λ)/2} T_{λ(ϖ)}, and θ_{λ−μ} = θ_λ θ_μ⁻¹ for λ, μ dominant. Then λ ↦ θ_λ is a well-defined injective algebra homomorphism A[X_*(T)] → H(G, I; A); multiplication gives an A-module isomorphism A[X_*(T)] ⊗_A H(K, I; A) ≅ H(G, I; A), where H(K, I; A) is the finite Hecke algebra of K = G(O_F), with basis T_w (w ∈ W); and for a simple reflection s = s_α ∈ W the Bernstein relation T_s θ_λ − θ_{s(λ)} T_s = (q − 1)(θ_λ − θ_{s(λ)})/(1 − θ_{−α^∨}) holds (the right side lies in A[X_*(T)]). The same holds for the generic affine Hecke algebra over ℤ[v, v⁻¹], which specialises to H(G, I; A) by v ↦ q^{1/2}.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.1/iwahori-hecke-centre
Requires the requested parabolic-pair, Iwahori, relative-root and positive-cone carriers of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1/RG2.3/RG2.4. Positivity and the normaliser hypothesis are retained in the mathematical statement.
declaration: TauCeti.IwahoriHecke.center_eq_invariants
  With A ∋ q^{±1/2} a domain (or any ring after base change from ℤ[v, v⁻¹]), the centre of H(G, I; A) is θ(A[X_*(T)])^W = θ(A[X_*(T)]^W), free over A on the orbit sums z_λ = Σ_{μ ∈ Wλ} θ_μ for λ dominant. H(G, I; A) is free of rank |W| over θ(A[X_*(T)]), which is finite over the centre, so H(G, I; A) is a finitely generated module over its centre. For q = 1 in A the centre of A[X_*(T) ⋊ W] is again A[X_*(T)]^W, W acting faithfully on X_*(T). The comparison of this centre with the spherical Hecke algebra (z ↦ e_K z, the Satake isomorphism) is an SR.4 target, not part of this node.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction
Requires the requested Borel subgroup of GL₂ and its flag-variety quotient identification H\G ≅ ℙ¹(ℚ_p).
test: TauCeti.SmoothRep.ind_borel_gl2
  For G = GL_2(ℚ_p) and H = B, Ind_B^G 1 ≅ locally constant functions on ℙ¹(ℚ_p).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model
Requires an actual category of smooth G-equivariant l-sheaves on H\G, with stalks and compactly supported sections. An arbitrary sheaf with an assumed conclusion does not state this condition.
declaration: TauCeti.SmoothRep.indSheaf
  For H closed in G and σ smooth on H, there is a G-equivariant sheaf 𝓕_σ of A-modules on the l-space X = H\G (an l-sheaf: stalk σ at the base point) such that Ind_H^G σ is its space of smooth sections and c-Ind_H^G σ its space of compactly supported sections. For an open G'-stable (for G' ≤ G closed) subset Y ⊆ X with closed complement Z, restriction gives a short exact sequence of G'-representations 0 → Γ_c(Y, 𝓕_σ) → c-Ind_H^G σ → Γ_c(Z, 𝓕_σ) → 0. The functor σ ↦ 𝓕_σ is an equivalence between smooth H-representations and G-equivariant l-sheaves on H\G.
API: TauCeti.SmoothRep.ind_equiv_sections
  Ind_H^G σ ≃ smooth sections, c-Ind_H^G σ ≃ compactly supported sections.
API: TauCeti.SmoothRep.cInd_shortExact_open
  For Y ⊆ H\G open and G'-stable: 0 → Γ_c(Y) → c-Ind → Γ_c(Z) → 0 exact.
API: TauCeti.SmoothRep.indSheafEquiv
  σ ↦ 𝓕_σ is an equivalence SmoothRep A H ≌ G-equivariant l-sheaves on H\G (G countable at infinity).
API: TauCeti.SmoothRep.indSheaf_stalk
  The stalk of 𝓕_σ at the base point is σ.
test: TauCeti.SmoothRep.indSheaf_point
  For H = G, sections over the point are σ.
test: TauCeti.SmoothRep.cInd_shortExact_gl2
  For GL_2(ℚ_p), B and Y = big cell: the kernel term is C_c^∞(ℚ_p, A) twisted by χ, the quotient is one-dimensional.
test: TauCeti.SmoothRep.indSheaf_trivial_subgroup
  For H = ⊥, compactly supported sections are C_c^∞(G, W) of SR.1.
test: TauCeti.SmoothRep.indSheaf_not_open_sections
  Sections over Z = {∞} are not a subrepresentation of i_B χ but a quotient: the sequence does not split as B-representations for χ = δ_B^{1/2}.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/mackey-filtration
Requires the l-sheaf compact-support interface and a finite locally closed orbit filtration with open successive unions, not a direct-sum decomposition for closed subgroups.
declaration: TauCeti.SmoothRep.mackeyFiltration
  Let H, Q be closed subgroups of G such that Q has finitely many orbits on X = H\G, each locally closed, numbered Z₁, …, Z_k so that Y_i = Z₁ ∪ … ∪ Z_i is open. Then the restriction to Q of c-Ind_H^G σ has a Q-stable filtration 0 = F₀ ⊆ F₁ ⊆ … ⊆ F_k with F_i/F_{i−1} ≅ c-Ind_{Q ∩ x_i⁻¹Hx_i}^Q (x_i⁻¹ · σ), x_i ∈ G a representative of Z_i. For H, Q open (in particular G finite) this is the Mackey decomposition, a direct sum (Tau Ceti's Rep.mackeyDecomposition).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/modulus-character
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.modulusCharacter
  For a closed subgroup N of G normalised by m ∈ G, the module mod_N(m) is the factor by which conjugation u ↦ m u m⁻¹ scales a Haar measure of N; for a compact open N₀ ⊆ N it is [mN₀m⁻¹ : mN₀m⁻¹ ∩ N₀]/[N₀ : mN₀m⁻¹ ∩ N₀] ∈ ℚ_{>0}. For a parabolic pair P = M ⋉ N of a reductive group over F with residue cardinality q, δ_P := mod_N : P → q^ℤ ⊆ ℤ[1/q]^×, trivial on N, equals |det(Ad(p)|Lie N)|_F and equals Mathlib's modular character of P (μ(E p⁻¹)/μ(E) for a left Haar measure μ of P). As a smooth character it has values in any A ∋ q⁻¹. A square root δ_P^{1/2} : P → Aˣ is fixed by choosing q^{1/2} ∈ Aˣ, which is a choice of coefficients, not part of the group data.
API: TauCeti.modulusCharacter_eq_modularCharacter
  (δ_P(p) : ℝ) = MeasureTheory.Measure.modularCharacter p for the locally compact group P.
API: TauCeti.sqrtModulusCharacter
  δ_P^{1/2} : P →* Aˣ determined by a chosen q^{1/2} ∈ Aˣ, with (δ_P^{1/2})² = δ_P.
API: TauCeti.modulusCharacter_opposite
  δ_{P̄} = δ_P⁻¹ on M.
test: TauCeti.modulusCharacter_gl2_borel
  For GL_2(ℚ_p) and B upper triangular, δ_B(diag(a,d)) = |a/d|_p.
test: TauCeti.modulusCharacter_trivial_parabolic
  For P = G (N = 1), δ_P = 1.
test: TauCeti.modulusCharacter_eq_modularCharacter_test
  For P = B ⊆ GL_2(ℚ_p), δ_B equals Mathlib's modularCharacter of B (as an ℝ≥0-valued character).
test: TauCeti.modulusCharacter_ne_one_on_center_free
  δ_B is not trivial on T: δ_B(diag(p,1)) ≠ 1, so B is not unimodular.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
API: TauCeti.SmoothRep.normalizedJacquet
  r_P(V) := δ_P^{−1/2} ⊗ V_N.
API: TauCeti.SmoothRep.jacquet_trans
  Transitivity for P₁ ⊆ P₂: (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁}, and r_{P₁∩M₂}^{M₂} ∘ r_{P₂} ≅ r_{P₁}.
API: TauCeti.SmoothRep.jacquet_fg
  If G = P K₀ with K₀ compact, V finitely generated ⇒ V_N finitely generated.
test: TauCeti.SmoothRep.jacquet_trivial_gl2
  For G = GL_2(ℚ_p), the Jacquet module of the trivial representation along N is the trivial character of T.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.parabolicInd
  For a parabolic subgroup P = M ⋉ N of a reductive p-adic group G (or a parabolic pair in a locally profinite G with P\G compact) and A ∋ q^{±1/2}, normalised parabolic induction is i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl_M^P σ), an exact functor SmoothRep A M ⥤ SmoothRep A G (P\G is compact, so Ind = c-Ind). Unnormalised induction Ind_P^G ∘ infl is available over every A. It satisfies transitivity i_P^G ∘ i_{Q ∩ M}^M ≅ i_Q^G for Q ⊆ P, preserves admissibility and finite generation, and is compatible with twisting by unramified characters of M and with base change.
API: TauCeti.SmoothRep.unnormalizedParabolicInd
  Ind_P^G ∘ infl, over any A.
API: TauCeti.SmoothRep.parabolicInd_exact
  i_P^G is exact (any A ∋ q^{±1/2}).
API: TauCeti.SmoothRep.parabolicInd_trans
  i_P^G ∘ i_{Q∩M}^M ≅ i_Q^G for parabolics Q ⊆ P.
API: TauCeti.SmoothRep.parabolicInd_admissible
  i_P^G preserves admissibility and finite generation.
API: TauCeti.SmoothRep.parabolicInd_twist
  i_P^G(σ ⊗ χ|_M) ≅ i_P^G σ ⊗ χ for a smooth character χ of G.
API: TauCeti.SmoothRep.parabolicInd_eq_unnormalized
  i_P^G σ = Ind_P^G(δ_P^{1/2}σ); the two conventions differ by the twist δ_P^{1/2}.
test: TauCeti.SmoothRep.parabolicInd_gl2_apply
  For GL_2(ℚ_p), f ∈ i_B(χ₁ ⊗ χ₂) satisfies f((a b; 0 d)g) = χ₁(a)χ₂(d)|a/d|^{1/2} f(g).
test: TauCeti.SmoothRep.parabolicInd_self
  i_G^G σ ≅ σ.
test: TauCeti.SmoothRep.trivial_sub_parabolicInd
  The trivial representation of GL_2(ℚ_p) embeds in i_B(δ_B^{−1/2}).
test: TauCeti.SmoothRep.parabolicInd_not_unnormalized
  i_B 1 ≠ Ind_B^G 1 for GL_2(ℚ_p): the latter contains the trivial representation, the former does not.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.jacquetParabolicIndAdjunction
  For a parabolic P = M ⋉ N, a smooth G-representation V and a smooth M-representation σ over A: Hom_G(V, Ind_P^G infl σ) ≅ Hom_M(V_N, σ), and in normalised form Hom_G(V, i_P^G σ) ≅ Hom_M(r_P V, σ) (A ∋ q^{±1/2}): the Jacquet functor r_P is left adjoint to i_P^G. Consequently i_P^G preserves injectives when r_P is exact, and r_P preserves projectives when i_P is exact.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/induced-contragredient
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.smoothDual_parabolicInd
  For H closed in a unimodular G, σ smooth on H over a field k in which the compact open subgroups have invertible pro-order (e.g. k = ℂ): (c-Ind_H^G σ)~ ≅ Ind_H^G(σ̃ ⊗ δ_H), δ_H the modulus character of H, via the G-invariant functional on c-Ind_H^G δ_H given by integration over H\G. For a parabolic P = M ⋉ N (P\G compact): (i_P^G σ)~ ≅ i_P^G σ̃ naturally in σ (normalised induction is compatible with smooth duality), and the pairing i_P σ × i_P σ̃ → k is f ⊗ f' ↦ ∮_{P\G} ⟨f, f'⟩.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.geometricLemma
  Let G be a connected reductive group over F, P = MN and Q = LV standard parabolic subgroups, W the Weyl group and W^{M,L} the set of minimal-length representatives of W_L\W/W_M. For every smooth σ of M (complex coefficients, or any A ∋ q^{±1/2} with p ∈ Aˣ), r_Q ∘ i_P (σ) has a filtration, natural in σ, whose graded pieces are F_w(σ) = i^L_{L ∩ wPw⁻¹}(w · r^M_{M ∩ w⁻¹Qw}(σ)), w ∈ W^{M,L}, in an order compatible with the closure order on the double cosets PwQ (open orbits give subfunctors, closed orbits quotients). More generally, for an l-group G with closed subgroups P = MU, Q = NV satisfying Bernstein–Zelevinsky's conditions (finitely many Q-orbits on P\G, U and V unions of compact subgroups, decomposability), r_{V} ∘ i_{U} is glued from functors indexed by the Q-orbits on P\G.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.jacquet_principalSeries
  Let B = TU be a minimal parabolic (Borel, for split G) and χ a smooth character of T over ℂ. Then r_B(i_B χ) has a filtration with graded pieces the Weyl conjugates wχ (w ∈ W), so its semisimplification is ⊕_{w ∈ W} wχ; if χ is regular (wχ ≠ χ for w ≠ 1) the filtration splits. Consequently every irreducible subquotient π of i_B χ has r_B(π) ≠ 0, its semisimplified Jacquet module is a sub-sum of ⊕ wχ, and π embeds in i_B(wχ) for some w; i_B χ has length ≤ |W|.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.casselmanPairing
  Let V be an admissible complex representation of a reductive p-adic G, P = MN a parabolic with opposite P̄ = MN̄. There is a unique bilinear pairing ⟨ , ⟩_N : V_N × (Ṽ)_{N̄} → ℂ such that for v ∈ V, ṽ ∈ Ṽ with images u, ũ there is ε > 0 with ⟨π(a)v, ṽ⟩ = ⟨π_N(a)u, ũ⟩_N for all a in the ε-contracting part A⁻(ε) of the split centre of M. It is M-invariant and nondegenerate, so (V_N)~ ≅ (Ṽ)_{N̄} and, normalised, r_{P̄}(Ṽ) ≅ (r_P V)~. This is the compatibility of Jacquet functors with smooth duality on admissible representations; the extension to all smooth representations is jacquet-duality (SR.2a).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.invariants_jacquet_surjective
  Let K₀ be a compact open subgroup with an Iwahori decomposition K₀ = N̄₀M₀N₀ with respect to (P, P̄), V an admissible representation over ℂ (or over a field with invertible pro-orders). Then: (1) the projection V^{K₀} → (V_N)^{M₀} is surjective; (2) for a ∈ M contracting N (a N₀ a⁻¹ ⊆ N₀, a ∈ A⁻), the Hecke operator [K₀aK₀] on V^{K₀} lifts δ_P(a)⁻¹ π_N(a) on V_N, i.e. projection intertwines [K₀aK₀] with δ_P⁻¹(a) a; (3) for a sufficiently contracting, the subspaces V^{K₀}_a = [K₀aK₀] V^{K₀} are all equal to a space V^{K₀}_{A⁻} on which every [K₀aK₀] (a ∈ A⁻) is invertible, and the projection V^{K₀}_{A⁻} → (V_N)^{M₀} is an isomorphism (its inverse is Casselman's canonical lifting); the kernel of the projection is the generalised null space of [K₀aK₀]. Over a ring R with p ∈ Rˣ the same surjectivity holds for all smooth V once [K₀aK₀] is invertible in H(G, K₀) ⊗ R (Bushnell–Kutzko).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/borel-casselman-invariants
Requires the requested Levi/parabolic pair and its quotient identification P/N ≅ M, modulus square-root choice and relative-root/orbit data. The normal-subgroup coinvariant core is already above.
declaration: TauCeti.SmoothRep.iwahoriInvariants_equiv_jacquet
  Let G be connected reductive over F with minimal parabolic P = MN, B an Iwahori subgroup in good position (B = N̄₀M₀N₀) and V an admissible complex representation. Then the projection V → V_N induces an isomorphism V^B ≅ (V_N)^{M₀}, and for m in the contracting cone M⁻ the operator [BmB] on V^B corresponds to meas(BmB)·π_N(m) = δ_P(m)⁻¹ π_N(m). For split G and the pro-p Iwahori Iw₁ the same holds with (V_N)^{T(O)₁} and the normalised Jacquet module, compatibly with the action of T(F) on H(G, Iw₁)[1/p] (pro-iwahori-torus).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals
Requires the requested Borel, simple relative root subgroups and generic-character condition. The functionals and twisted coinvariants for a specified smooth character are already above.
API: TauCeti.IsGenericCharacter
  ψ : U →* Aˣ smooth, nontrivial on each simple root subgroup, trivial on [U, U].
API: TauCeti.SmoothRep.isGeneric_conj
  Genericity depends only on the T(F)-orbit of ψ.
test: TauCeti.SmoothRep.isGeneric_principalSeries_gl2
  For GL_2(ℚ_p) and any smooth χ, i_B χ is ψ-generic.
test: TauCeti.SmoothRep.not_isGeneric_trivial_gl2
  The trivial representation of GL_2(ℚ_p) is not generic.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.IsQuasiCuspidal
  Let G be the F-points of a connected reductive group over a nonarchimedean local field F (topology from ReductiveGroupsPartII RG2.0) and V a smooth complex representation. V is quasi-cuspidal if r_P(V) = 0 (equivalently V_N = 0) for every proper parabolic subgroup P = MN of G defined over F; it suffices to check maximal standard parabolics. V is cuspidal if it is quasi-cuspidal and finitely generated. For complex coefficients an irreducible cuspidal representation is called supercuspidal; quasi-cuspidal representations are closed under subquotients, direct sums and twists by characters, and V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and all σ.
API: TauCeti.SmoothRep.IsCuspidal
  Quasi-cuspidal and finitely generated.
API: TauCeti.SmoothRep.isQuasiCuspidal_iff_maximal
  It suffices to check maximal standard parabolics.
API: TauCeti.SmoothRep.isQuasiCuspidal_iff_hom
  V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and smooth σ.
API: TauCeti.SmoothRep.IsQuasiCuspidal.quotient
  Closed under subrepresentations, quotients, direct sums and twists.
API: TauCeti.SmoothRep.isQuasiCuspidal_iff_compact_mod_centre
  Matrix-coefficient criterion (harish-chandra-compactness).
test: TauCeti.SmoothRep.isQuasiCuspidal_torus
  Every smooth representation of a torus T(F) is quasi-cuspidal.
test: TauCeti.SmoothRep.not_isQuasiCuspidal_principalSeries
  For GL_2(ℚ_p) and any smooth χ, i_B χ is not quasi-cuspidal.
test: TauCeti.SmoothRep.isCuspidal_depthZero_gl2
  The compact induction from ℚ_p^× GL_2(ℤ_p) of an inflated cuspidal representation of GL_2(F_p) is irreducible and cuspidal.
test: TauCeti.SmoothRep.not_isQuasiCuspidal_trivial
  The trivial representation of GL_2(ℚ_p) is not quasi-cuspidal (its Jacquet module along N is the trivial character).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.isQuasiCuspidal_iff_compact_mod_centre
  For G reductive over F and a smooth complex representation V, the following are equivalent: (1) V is quasi-cuspidal; (2) for every v ∈ V and compact open K, g ↦ e_K π(g⁻¹) v has support compact modulo the centre Z(G); (3) the restriction of V to G° (the subgroup generated by compact subgroups, open with compact centre) is compact. For admissible V this is equivalent to all matrix coefficients being compactly supported modulo Z(G), and to the same property for Ṽ. Consequently every irreducible cuspidal representation is admissible.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3a/jacquet-subrepresentation
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.exists_embedding_parabolicInd_cuspidal
  Every irreducible smooth complex representation V of G embeds into i_P σ for some parabolic P = MN and some irreducible cuspidal representation σ of M. One may take M minimal among standard Levi subgroups with r_P V ≠ 0, and σ any irreducible quotient of r_P V.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3a/hecke-algebra-decomposition
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.heckeAlgebra_decomposition
  Let G be reductive over F, K₀ a special maximal compact subgroup and K ⊆ K₀ a congruence subgroup normal in K₀ with an Iwahori decomposition with respect to every standard parabolic (Bruhat). Let Λ⁺ be the dominant part of the lattice of a maximal split torus (with a finite set of representatives of Λ/Λ⁺-type corrections). Then H(G, K; ℂ) = H₀ · D · C · H₀ where H₀ = H(K₀, K) and D are finite-dimensional subspaces spanned by double-coset elements, and C = span{[KλK] : λ ∈ Λ⁺} is a commutative subalgebra, finitely generated as an algebra. In particular H(G, K) is a finite sum Σ u_i C v_j.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.finite_cuspidal_components_at_level
  Let K be a compact open subgroup of G. There is a subset Ω(G, K) ⊆ G° compact such that every K-bi-invariant matrix coefficient g ↦ e_K π(g⁻¹)ξ of every irreducible cuspidal representation of G° is supported in Ω(G, K). Consequently only finitely many isomorphism classes of irreducible cuspidal representations of G° have nonzero K-fixed vectors, and only finitely many cuspidal components of G (unramified-twist classes of irreducible cuspidals) have K-fixed vectors.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters
Requires the requested rational-point lattice G/G° and explicit GL₁/SL₂ quotient identifications; unramified characters of the actual quotient are already above.
API: TauCeti.SmoothRep.finiteIndex_center_mul
  Z(G)G° has finite index in G.
test: TauCeti.SmoothRep.unramifiedCharacters_gl1
  For G = ℚ_p^×, Ψ(G) ≅ ℂ^× via χ ↦ χ(p).
test: TauCeti.SmoothRep.unramifiedCharacters_sl2
  For SL_2(ℚ_p), G° = G and Ψ(G) is trivial.
test: TauCeti.SmoothRep.not_unramified_ramified
  A character of ℚ_p^× nontrivial on ℤ_p^× is smooth but not unramified.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.cuspidalSupport
  A cuspidal datum of G is a pair (M, σ) of a Levi subgroup M (of a parabolic of G) and an irreducible cuspidal representation σ of M, up to G-conjugacy. Every irreducible V is a subquotient of i_P σ for some cuspidal datum (M, σ) (jacquet-subrepresentation), and the datum is unique up to G-conjugacy: the cuspidal support scs(V). Each cuspidal datum is the support of finitely many irreducibles, namely the irreducible subquotients of i_P σ, independent of the parabolic P with Levi M; every irreducible subquotient of i_P σ embeds into i_P(wσ) for some w ∈ W(M) = N_G(M)/M.
API: TauCeti.SmoothRep.CuspidalDatum
  Pairs (M, σ) with M a Levi and σ irreducible cuspidal, modulo G-conjugacy.
API: TauCeti.SmoothRep.cuspidalSupport_spec
  V is a subquotient of i_P σ iff scs(V) = [M, σ].
API: TauCeti.SmoothRep.cuspidalSupport_unique
  Uniqueness up to G-conjugacy.
API: TauCeti.SmoothRep.cuspidalSupport_fiber_finite
  Each fibre of scs is finite.
API: TauCeti.SmoothRep.embedding_weyl_translate
  Every irreducible subquotient of i_P σ embeds in i_P(wσ) for some w ∈ W(M).
test: TauCeti.SmoothRep.cuspidalSupport_trivial_gl2
  scs(1_{GL_2(ℚ_p)}) = [T, |·|^{−1/2} ⊗ |·|^{1/2}].
test: TauCeti.SmoothRep.cuspidalSupport_supercuspidal
  scs(V) = [G, V] for V irreducible cuspidal.
test: TauCeti.SmoothRep.cuspidalSupport_steinberg_gl2
  The Steinberg representation of GL_2(ℚ_p) has the same cuspidal support as the trivial representation.
test: TauCeti.SmoothRep.cuspidalSupport_ne_twist
  For GL_2(ℚ_p), i_B(1 ⊗ 1) and i_B(|·| ⊗ 1) have different cuspidal supports.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/finite-length
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.finiteLength_parabolicInd
  (1) If σ is an admissible representation of finite length of a Levi M, then i_P σ has finite length; for σ irreducible cuspidal its length is at most |W(M)|. (2) Every finitely generated admissible complex representation of G has finite length (Howe). (3) A smooth V all of whose irreducible subquotients are non-cuspidal has finite length if r_P V has finite length for every maximal standard parabolic P; length(V) ≤ Σ_P length(r_P V).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.parabolicInd_irreducible_generic
  Let σ be an irreducible cuspidal (more generally discrete series) representation of a Levi M and P = MN. For ψ in a nonempty Zariski-open subset of the torus Ψ(M), i_P(ψσ) is irreducible. In particular every element z of the centre acts on i_P(ψσ) by a scalar z(ψσ), and ψ ↦ z(ψσ) is a regular function on Ψ(M).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.InertialClass
  Two cuspidal data (M, σ), (M', σ') are inertially equivalent if there are g ∈ G and ψ ∈ Ψ(M') with gMg⁻¹ = M' and gσ ≅ ψσ'. The inertial classes s = [M, σ]_G form the set B(G). For s = [M, σ] the cuspidal component D = Ψ(M)·σ ⊆ Irr_cusp(M) is a quotient of the torus Ψ(M) by the finite stabiliser of σ, and W_s = W(M, D) = {w ∈ N_G(M)/M : wD = D}. The variety of cuspidal data Ω(G) = ⊔_s D_s/W_s, and the inertial support of an irreducible V is the class of its cuspidal support. The full subcategory Rep_s(G) consists of smooth V all of whose irreducible subquotients have inertial support s.
API: TauCeti.SmoothRep.inertialSupport
  Irr G → B(G), the class of the cuspidal support.
API: TauCeti.SmoothRep.cuspidalComponent
  D_s = Ψ(M)·σ with its structure of a quotient torus.
API: TauCeti.SmoothRep.bernsteinWeylGroup
  W_s = W(M, D), finite.
API: TauCeti.SmoothRep.blockSubcategory
  Rep_s(G): smooth representations whose irreducible subquotients all have inertial support s.
API: TauCeti.SmoothRep.varietyCuspidalData
  Ω(G) = ⊔_s D_s/W_s.
test: TauCeti.SmoothRep.inertialClass_gl1
  For ℚ_p^×, inertial classes correspond to characters of ℤ_p^×.
test: TauCeti.SmoothRep.inertialSupport_trivial_steinberg
  The trivial and Steinberg representations of GL_2(ℚ_p) have the same inertial support [T, 1].
test: TauCeti.SmoothRep.bernsteinWeylGroup_supercuspidal
  For s = [G, σ], W_s is trivial.
test: TauCeti.SmoothRep.inertialSupport_ne_ramified
  i_B(χ ⊗ 1) with χ ramified on ℤ_p^× is not in the unramified block [T, 1].
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.cuspidalComponent_splits
  Each cuspidal component D of G (an unramified-twist class of irreducible cuspidal representations) splits SmoothRep ℂ G, and so does the set of all irreducible cuspidals: SmoothRep ℂ G = M_cusp × M_ind with M_cusp = ∏_D M(D). For D = Ψ(G)ρ, Π(D) = c-Ind_{G°}^G(ρ|_{G°}) ≅ ℂ[Λ(G)] ⊗ ρ is a finitely generated projective generator of M(D), and M(D) is equivalent to modules over End(Π(D))ᵒᵖ, a twisted group algebra of the finite stabiliser of ρ over ℂ[Ψ(G)].
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.bernsteinDecomposition
  SmoothRep ℂ G is the product of the full subcategories Rep_s(G) over the inertial classes s ∈ B(G): every smooth V decomposes uniquely as V = ⊕_s V_s with V_s ∈ Rep_s(G), naturally in V, and Hom between different blocks vanishes. For each compact open K only finitely many s have Rep_s(G)^K ≠ 0. The cuspidal blocks are those of cuspidal-splitting.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.bernsteinCentreEquiv
  The centre Z(G) = CatCenter(SmoothRep ℂ G) of SR.0 is the product over inertial classes of the centres Z_s of the blocks, and Z_s ≅ ℂ[D_s]^{W_s}, the ring of W_s-invariant regular functions on the cuspidal component D_s; hence Z(G) is the ring of regular functions on Ω(G) = ⊔_s D_s/W_s. An element z acts on every i_P(π), π ∈ D_s, by the scalar z(π), and on every irreducible V by z(scs V). The action on every object is the SR.0 action; on the generators ℂ[G/K] it is the SR.1 description Z(G) ≅ lim_K Z(H(G, K)).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/universal-unramified-twist
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.universalUnramifiedTwist
  For a parabolic P = MN and a smooth σ of M, let ℂ[Λ(M)] = ℂ[M/M°] with the tautological unramified character χ_univ : M → ℂ[Λ(M)]^×. The universal twist i_P(σ ⊗ χ_univ) is a smooth (G, ℂ[Λ(M)])-module, and for every ψ ∈ Ψ(M), specialisation at ψ gives i_P(σ ⊗ χ_univ) ⊗_{ℂ[Λ(M)], ψ} ℂ ≅ i_P(σ ⊗ ψ). If σ is admissible, its K-invariants are finitely generated projective ℂ[Λ(M)]-modules (free for the unramified principal series), compatibly with specialisation. For σ cuspidal and P = G this is Π(D) of cuspidal-splitting; for the unramified principal series it is c-Ind_{T(O)N}^G 1.
API: TauCeti.SmoothRep.universalUnramifiedTwist_specialize
  Specialisation at ψ is i_P(σ ⊗ ψ).
API: TauCeti.SmoothRep.universalUnramifiedTwist_invariants_projective
  For σ admissible, K-invariants are finitely generated projective over ℂ[Λ(M)].
API: TauCeti.SmoothRep.universalUnramifiedTwist_principal
  For M = T and σ = 1: i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1.
test: TauCeti.SmoothRep.universalUnramifiedTwist_gl1
  For G = M = ℚ_p^× and σ = 1, the universal twist is ℂ[t^{±1}] with p acting by t.
test: TauCeti.SmoothRep.universalUnramifiedTwist_trivial_levi
  For M = M° (for instance M = G = SL_2(ℚ_p), where Λ(M) = 0), ℂ[Λ(M)] = ℂ and the universal twist is i_P σ itself.
test: TauCeti.SmoothRep.universalUnramifiedTwist_iwahori_free
  For split G, (i_B χ_univ)^I is free of rank one over H(G, I) (Haines–Kottwitz–Prasad Lemma 1.6.1).
test: TauCeti.SmoothRep.universalUnramifiedTwist_special_reducible
  For GL_2, the specialisation at ψ = |·|^{1/2} ⊗ |·|^{−1/2} is reducible.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/centre-compatibilities
The product/block statement requires the inertial-class and affine quotient-variety carriers, in addition to the general conjugation functor.
declaration: TauCeti.SmoothRep.bernsteinCentre_conj_eq_id
  (1) Inner automorphisms act trivially on Z(G): for g ∈ G the autoequivalence V ↦ V^{Int g} is isomorphic to the identity via ρ(g), so the induced automorphism of Z(G) is the identity; an isomorphism of groups G ≅ G' induces Z(G) ≅ Z(G') depending only on its G'(F)-conjugacy class. (2) For G = G₁ × G₂, B(G) = B(G₁) × B(G₂) and Z_{(s₁,s₂)} ≅ Z_{s₁} ⊗ Z_{s₂}, so Z(G) = ∏_{s₁,s₂} Z_{s₁} ⊗ Z_{s₂}; irreducibles of G₁ × G₂ are external tensor products.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered
Requires the central character, quotient Haar measure, normalised Jacquet exponents and relative real chambers from the reductive suppliers; the recorded tempered-classification gap remains separate.
declaration: TauCeti.SmoothRep.IsTempered
  Let V be an admissible complex representation of G with central character ω. V is square-integrable modulo the centre (discrete series) if ω is unitary and every matrix coefficient g ↦ ⟨ṽ, π(g)v⟩ has |c|² integrable on G/Z(G) (with Mathlib's Lp and the quotient Haar measure); V is tempered if ω is unitary and every matrix coefficient lies in L^{2+ε}(G/Z) for all ε > 0. Equivalently (Casselman's criterion) in terms of the exponents: the central characters χ of A_M on the Jacquet modules r_P(V) satisfy |χ(a)| < 1 (resp. ≤ 1) on the strictly negative cone. An irreducible square-integrable V is unitary and has a formal degree.
API: TauCeti.SmoothRep.IsSquareIntegrable
  Unitary central character and matrix coefficients in L²(G/Z).
API: TauCeti.SmoothRep.centralExponents
  The characters of the split centre A_M occurring in r_P(V).
API: TauCeti.SmoothRep.IsSquareIntegrable.isTempered
  Square-integrable ⇒ tempered.
API: TauCeti.SmoothRep.IsSquareIntegrable.unitary
  An irreducible square-integrable representation is unitarisable.
API: TauCeti.SmoothRep.isSquareIntegrable_of_cuspidal
  A cuspidal representation with unitary central character is square-integrable.
test: TauCeti.SmoothRep.isSquareIntegrable_steinberg_gl2
  The Steinberg representation of GL_2(ℚ_p) is square-integrable modulo the centre.
test: TauCeti.SmoothRep.isTempered_unitary_principal
  i_B(χ₁ ⊗ χ₂) with χ_i unitary is tempered.
test: TauCeti.SmoothRep.not_isTempered_trivial
  The trivial representation of GL_2(ℚ_p) is not tempered.
test: TauCeti.SmoothRep.isSquareIntegrable_compact
  For G compact every irreducible representation is square-integrable.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion
Requires the central character, quotient Haar measure, normalised Jacquet exponents and relative real chambers from the reductive suppliers; the recorded tempered-classification gap remains separate.
declaration: TauCeti.SmoothRep.isSquareIntegrable_iff_exponents
  An admissible complex representation V of finite length with unitary central character is square-integrable modulo the centre iff for every standard parabolic P = MN and every central exponent χ of r_P(V) (normalised Jacquet module) one has |χ(a)| < 1 for all a in the strictly negative part of A_M modulo A_G; it is tempered iff |χ(a)| ≤ 1 there. It suffices to check the parabolics associate to the cuspidal support.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification
Requires the central character, quotient Haar measure, normalised Jacquet exponents and relative real chambers from the reductive suppliers; the recorded tempered-classification gap remains separate.
declaration: TauCeti.SmoothRep.langlandsClassification
  (1) Every irreducible tempered representation is a direct summand of i_P σ for a parabolic P = MN and a square-integrable σ of M, unique up to conjugacy. (2) For a standard parabolic P = MN, an irreducible tempered τ of M and ν in the open positive chamber a_P^{*,+} (|χ_ν| = q^{⟨ν, H_M⟩}), the standard module i_P(τ ⊗ χ_ν) has a unique irreducible quotient J_P(τ, ν) (the Langlands quotient). Every irreducible admissible V is isomorphic to some J_P(τ, ν), and the triple (P, τ, ν) is unique up to W-conjugacy. V is tempered iff P = G and ν = 0.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.iwahoriBlockEquiv
  Let G be connected reductive over F (split, or more generally with an Iwahori subgroup I in good position) and complex coefficients. The Iwahori subgroup splits SmoothRep ℂ G: the full subcategory of representations generated by their I-fixed vectors is the block of the unramified principal series [T, 1] (T a minimal Levi), and V ↦ V^I is an equivalence between this block and the category of modules over H(G, I; ℂ). An irreducible V has V^I ≠ 0 iff V is a subquotient (equivalently a subrepresentation) of an unramified principal series i_B χ. For admissible V generated by V^I, V^I is a finite-dimensional H(G, I)-module and the subcategory is closed under subobjects.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.3/steinberg
Requires the requested reductive/Levi carriers and their cuspidal-data, inertial-class, affine-torus or quotient-variety structures. These objects are not replaced by opaque proposition fields.
declaration: TauCeti.SmoothRep.steinberg
  For a split reductive G with Borel B, the Steinberg representation is St_G = C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G), the quotient of the smooth functions on the flag variety by the sum of those pulled back from the partial flag varieties of the parabolics strictly containing B. It is irreducible, square-integrable modulo the centre, its normalised Jacquet module along B is δ_B^{1/2} and its Iwahori invariants are one-dimensional. For GL_2: 0 → 1 → Ind_B^G 1 → St → 0 (unnormalised), i.e. St is the irreducible subrepresentation of i_B(δ_B^{1/2}).
API: TauCeti.SmoothRep.steinberg_irreducible
  St_G is irreducible.
API: TauCeti.SmoothRep.jacquet_steinberg
  r_B(St_G) ≅ δ_B^{1/2}.
API: TauCeti.SmoothRep.steinberg_isSquareIntegrable
  St_G is square-integrable modulo the centre.
API: TauCeti.SmoothRep.steinberg_iwahori
  dim St_G^I = 1 and St_G^{K₀} = 0.
test: TauCeti.SmoothRep.steinberg_gl2_exact
  For GL_2(ℚ_p): 0 → 1 → Ind_B^G 1 → St → 0 is exact.
test: TauCeti.SmoothRep.steinberg_torus
  For G = T a split torus, St_T is the trivial representation.
test: TauCeti.SmoothRep.steinberg_ne_trivial
  For GL_2(ℚ_p), St ≇ 1 (r_B differ).
test: TauCeti.SmoothRep.steinberg_spherical_zero
  St^{GL_2(ℤ_p)} = 0 for GL_2(ℚ_p).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2a/stabilization
Requires the requested opposite-parabolic pair, normalised functors, good-position compact subgroup and strongly positive element, before the stabilisation and adjunction conditions can be typed.
declaration: TauCeti.SmoothRep.stabilization
  Let G be reductive over F, (P, P̄) a parabolic pair with Levi M, K a compact open subgroup in good position (K = K₋K_MK₊ with respect to (P, P̄)) and a ∈ Z(M) strictly dominant with respect to (P, P̄, K); put h = [KaK] ∈ H(G, K; ℂ). Then for every smooth complex representation V (no admissibility assumed) and every n ≥ c(G, K), the uniform-admissibility constant: V^K = ker hⁿ ⊕ im hⁿ, h acts invertibly on V^K_* := im hⁿ, and V^K_0 := ker hⁿ, V^K_* do not depend on n or on a. Moreover V^K_0 = V^K ∩ ker e_C and V^K_* = e_K e_{C̄} V for sufficiently large compact open C ⊆ N, C̄ ⊆ N̄, and the projection V^K → (V_N)^{K_M} has kernel V^K_0 and restricts to an isomorphism V^K_* ≅ (V_N)^{K_M}.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-lemma-smooth
Requires the requested opposite-parabolic pair, normalised functors, good-position compact subgroup and strongly positive element, before the stabilisation and adjunction conditions can be typed.
declaration: TauCeti.SmoothRep.invariants_jacquet_surjective_of_smooth
  For every smooth complex representation V of G and K, P = MN in good position, the projection V^K → (V_N)^{K_M} is surjective, and it has a natural section (Bernstein's canonical lifting) identifying (V_N)^{K_M} with the direct summand V^K_* of V^K, functorially in V. The section is independent of the strictly dominant element used to define it, and compatible with shrinking K.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-duality
Requires the requested opposite-parabolic pair, normalised functors, good-position compact subgroup and strongly positive element, before the stabilisation and adjunction conditions can be typed.
declaration: TauCeti.SmoothRep.jacquet_smoothDual_opposite
  For every smooth complex representation V of G and opposite parabolics P = MN, P̄ = MN̄ there is a unique nondegenerate M-equivariant pairing (Ṽ)_{N̄} × V_N → ℂ such that for ṽ ∈ Ṽ, v ∈ V and a strictly dominant central a, ⟨ṽ, π(aⁱ)v⟩ = ⟨p̄(ṽ), π_N(aⁱ)p(v)⟩ for i ≫ 0. It identifies (Ṽ)_{N̄} with the full smooth contragredient of V_N; with normalised functors (using δ_{P̄} = δ_P⁻¹ on M): r_{P̄}(Ṽ) ≅ (r_P V)~ naturally in V. For admissible V this is Casselman's pairing (casselman-pairing).
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2a/second-adjunction-unit
Requires the requested opposite-parabolic pair, normalised functors, good-position compact subgroup and strongly positive element, before the stabilisation and adjunction conditions can be typed.
declaration: TauCeti.SmoothRep.secondAdjunctionUnit
  For opposite parabolics P = MN and P̄ = MN̄ and complex coefficients, the unit of the second adjunction is the natural embedding η_τ : τ ↪ r_{P̄}(i_P τ) given by the open orbit P·P̄ of P̄ on P\G: functions in i_P τ supported in the big cell P N̄ form the bottom piece of the geometric-lemma filtration of r_{P̄} i_P, isomorphic to τ. The counit ε_π : i_P(r_{P̄} π) → π is the map corresponding, under the Hom isomorphism of second-adjointness, to the identity of r_{P̄} π; explicitly it is described by Bezrukavnikov–Kazhdan's asymptotic (co-specialisation) map. The triangle identities r_{P̄}(ε) ∘ η_{r_{P̄}} = id and ε_{i_P} ∘ i_P(η) = id hold, and the unit agrees with the geometric-lemma map of Bernstein's β.
API: TauCeti.SmoothRep.secondAdjunctionCounit
  ε : r_{P̄} ⋙ i_P ⟶ 𝟭.
API: TauCeti.SmoothRep.secondAdjunction_left_triangle
  r_{P̄}(ε_π) ∘ η_{r_{P̄}π} = id.
API: TauCeti.SmoothRep.secondAdjunction_right_triangle
  ε_{i_P τ} ∘ i_P(η_τ) = id.
API: TauCeti.SmoothRep.secondAdjunctionUnit_eq_geometricLemma
  η is the open-orbit piece of the geometric-lemma filtration of r_{P̄} ∘ i_P.
test: TauCeti.SmoothRep.secondAdjunctionUnit_gl2
  For GL_2 and τ = χ, η_χ identifies χ with the subrepresentation of r_{B̄}(i_B χ) coming from functions supported on B N̄.
test: TauCeti.SmoothRep.secondAdjunctionUnit_trivial_parabolic
  For P = G, η and ε are identities.
test: TauCeti.SmoothRep.secondAdjunctionUnit_injective
  η_τ is injective for every τ.
test: TauCeti.SmoothRep.firstAdjunctionUnit_ne_second
  The unit of the first adjunction r_P ⊣ i_P is π → i_P(r_P π) (closed orbit, a quotient piece), not η: the two adjunctions use opposite parabolics.
-/

/-
Omission ledger — SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness
Requires the requested opposite-parabolic pair, normalised functors, good-position compact subgroup and strongly positive element, before the stabilisation and adjunction conditions can be typed.
declaration: TauCeti.SmoothRep.secondAdjunction
  For a connected reductive group G over a nonarchimedean local field F, opposite parabolics P = MN and P̄ = MN̄, and complex coefficients: normalised parabolic induction i_P is left adjoint to the normalised Jacquet functor r_{P̄} along the opposite parabolic, Hom_G(i_P τ, π) ≅ Hom_M(τ, r_{P̄} π) naturally in τ and π, with unit and counit those of second-adjunction-unit. This is separate from the first adjunction r_P ⊣ i_P. Consequences: r_{P̄} commutes with arbitrary products; i_P preserves projective objects; for admissible π, Hom_G(i_P τ, π̃) ≅ Hom_M(τ, (r_P π)~), compatibly with Casselman's pairing. In unnormalised terms the right adjoint of Ind_P^G ∘ infl is δ_P⁻¹ ⊗ (−)_{N̄}.
-/
