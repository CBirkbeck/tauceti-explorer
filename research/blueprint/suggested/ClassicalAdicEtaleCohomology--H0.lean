/-
Suggested Lean forms for BP-ClassicalAdicEtaleCohomology--H0 (roadmap
`ClassicalAdicEtaleCohomology`,
"The classical analytic cohomology inputs to diamonds", layers H0–H3). This file is not the roadmap
and is not exhaustive: the roadmap document is definitive. See the module documentation after the
imports.
-/
import Mathlib.Algebra.Category.Grp.AB
import Mathlib.Algebra.Category.Grp.Colimits
import Mathlib.Algebra.Category.ModuleCat.AB
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Abelian
import Mathlib.Algebra.CharP.Defs
import Mathlib.Algebra.Colimit.Ring
import Mathlib.Algebra.GroupWithZero.Range
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Basic
import Mathlib.Algebra.Homology.DerivedCategory.RightDerivedFunctorPlus
import Mathlib.Algebra.Homology.HomotopyCategory.KInjective
import Mathlib.Algebra.Order.Hom.Monoid
import Mathlib.Algebra.Order.Monoid.Prod
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Integral
import Mathlib.AlgebraicGeometry.Morphisms.LocalIso
import Mathlib.AlgebraicGeometry.Morphisms.UnderlyingMap
import Mathlib.AlgebraicGeometry.Morphisms.UniversallyInjective
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Ring.Lemmas
import Mathlib.Basic.NNReal.Defs
import Mathlib.CategoryTheory.Abelian.GrothendieckAxioms.Sheaf
import Mathlib.CategoryTheory.Abelian.GrothendieckAxioms.SheafOfModules
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.EnoughInjectives
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.HasExt
import Mathlib.CategoryTheory.Abelian.RightDerived
import Mathlib.CategoryTheory.Sites.Abelian
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.CategoryTheory.Sites.CoversTop.Basic
import Mathlib.CategoryTheory.Sites.DenseSubsite.Basic
import Mathlib.CategoryTheory.Sites.Over
import Mathlib.CategoryTheory.Sites.Point.Comap
import Mathlib.CategoryTheory.Sites.Point.Conservative
import Mathlib.CategoryTheory.Sites.Point.Over
import Mathlib.CategoryTheory.Sites.Pullback
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Sites.SheafCohomology.Cech
import Mathlib.CategoryTheory.Sites.Spaces
import Mathlib.CategoryTheory.Sites.Whiskering
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.Normal.Defs
import Mathlib.FieldTheory.PurelyInseparable.Basic
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.GroupTheory.PGroup
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Functoriality
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Polynomial.GaussNorm
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.RingHom.Etale
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.Spectrum.Maximal.Defs
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Valuation.RamificationGroup
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.Topology.Algebra.TopologicallyNilpotent
import Mathlib.Topology.Algebra.UniformRing
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.Topology.Constructible
import Mathlib.Topology.Inseparable
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.LocallyClosed
import Mathlib.Topology.LocallyFinite
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Topology.NoetherianSpace
import Mathlib.Topology.QuasiSeparated
import Mathlib.Topology.Sheaves.Stalks
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Spectral.Hom
import Mathlib.Topology.Spectral.Prespectral
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Spectral
import TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Basic
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Restriction
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.TopologicallyFiniteType
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.PairOfDefinition
import TauCeti.RingTheory.Valuation.Microbial
import TauCeti.Topology.Spectral.ProConstructible

/-!
# Suggested Lean forms for ClassicalAdicEtaleCohomology (layers H0–H3)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`ClassicalAdicEtaleCohomology--H0` ("The classical analytic cohomology inputs to diamonds", layers
H0, H1:henselian, H1:formal-adic-comparison, H1:valuation-nearby-cycles, H1:valuation-exports, H1,
H2, H3) is definitive. The statements below suggest Lean forms, so that contributors and reviewers
converge on names and signatures. Every proof is `sorry`; a data definition either has a body built
from library material or is `sorry`, and a `Prop`-valued definition always has a real body. Nothing
here claims to be formalised, and every node keeps `implementationStatus = "unchecked"`.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The file elaborates with `lake env lean` against a
project at exactly these commits, and its only warnings are `declaration uses 'sorry'`.

## Layout

A section of stand-ins comes first (see below). Then one section per layer, in the order H0,
H1:henselian, H1:formal-adic-comparison, H1:valuation-nearby-cycles, H1:valuation-exports, H1 (the
umbrella, after the four layers it re-exports), H2, H3, and inside a layer one subsection per
packet node, in packet order, headed `ClassicalAdicEtaleCohomology:<node id> (<kind>)`. Every
declaration's docstring names its node. A unit test is an `example` preceded by the line
`-- test <name> (<kind>) [<node id>]`.

## Conventions

* **Names.** Every declaration lives in the namespace `TauCeti`: the packet name `N` is the Lean
  name `TauCeti.N`. Étale sheaf theory of analytic adic spaces is in `TauCeti.AdicSpace`, formal
  schemes in `TauCeti.FormalScheme`, ring-level statements (henselian f-adic rings,
  henselisations, valuation rings) in `TauCeti.Huber`, and scheme-level nearby cycles over
  valuation bases in `TauCeti.AlgebraicGeometry`.
* **Carriers.** Henselian pairs are Mathlib's `HenselianRing`; Huber rings and pairs, rings of
  definition, `Spa` and rational subsets are Tau Ceti's; schemes, their étale morphisms, the small
  étale site `AlgebraicGeometry.Scheme.smallEtaleTopology`, sheaf cohomology
  `CategoryTheory.Sheaf.H`
  and derived categories are Mathlib's. A strictly henselian local ring is written as
  `HenselianLocalRing` together with a separably closed residue field.

## Stand-ins

The first section restates, in the shape of AdicSpacesPartII's suggested file, the carriers of
AdicSpacesPartII R0 that some statements need and that neither pinned library has: adic ring maps
`Huber.IsAdicHom`, completed tensor products `Huber.CompletedTensor` and
`Huber.Pair.completedTensor`, the spectral topology and uniformisation, and finite morphisms of
Huber pairs. They are replaced by imports once their owner lands.

## What is not stated

The anchor's category of adic spaces (Tau Ceti roadmap AdicSpaces, Layer 5), AdicEtaleGeometry A1's
étale sites of analytic adic spaces, pseudo-adic spaces, formal schemes, Huber's tilde-limits of
adic spaces, strict henselisations of schemes and étale pullback and pushforward along morphisms of
schemes are not in the pinned libraries. Every packet item that needs one of these carriers — in
particular the étale sheaves, derived images, stalks and supports on adic spaces, the specialisation
morphism, nearby cycles as sheaves, proper-support direct images and curve duality — is a comment of
the form

`-- <name>: not stated here; needs <missing carrier> (supplier: <stage or node id>)`

placed under the node's header, so that every packet name still appears; a unit test in this form
ends with `[<kind> test]`. Where such a node has a ring-level, affinoid, topological, site-level or
scheme-level core that the pinned libraries can state, the core is stated under the packet name
with a suffix (`…_affinoid`, `…_core`, `…_ring`, `…_scheme`) and the comment says so. A few
`Prop`-valued instances carry `sorry` proofs because statements below use them (for instance the
additivity of pushforward of sheaves of modules along a morphism of small sites).
-/

/-! # Stand-ins from other roadmaps

The declarations of this section are not packet items of ClassicalAdicEtaleCohomology. They
restate, in
the shape of the suggested file of their own roadmap, the carriers from AdicSpacesPartII R0
(adic ring maps, completed tensor products of Huber pairs, the spectral topology and the
uniformisation) that the statements below need and that neither pinned library has. Each
docstring names the node that owns the declaration; the owning roadmap is
definitive, and these copies are replaced by imports once the owners land. -/

noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter

namespace Huber

/-! ## Stand-in: adic ring homomorphisms (AdicSpacesPartII:R0/adic-ring-homomorphism) -/

section AdicHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]

/-- **Stand-in for AdicSpacesPartII:R0/adic-ring-homomorphism.** `φ : A → B` is *adic* if there
are pairs of definition `(A₀, I)` of `A` and `(B₀, J)` of `B` with `φ(A₀) ⊆ B₀` and
`J = φ(I)·B₀` (Huber 1994 §3, Wedhorn Definition 6.23). -/
class IsAdicHom (φ : A →+* B) : Prop where
  /-- Pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀`. -/
  exists_pairOfDefinition : ∃ (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition),
    Q.idealOfDefinition = P.idealOfDefinition.map (φ.restrict _ _ h)

/-- Stand-in (AdicSpacesPartII:R0/adic-ring-homomorphism): an adic homomorphism is continuous. -/
theorem IsAdicHom.continuous (φ : A →+* B) [IsAdicHom φ] : Continuous φ := sorry

end AdicHom

/-! ## Stand-in: the completed tensor product (AdicSpacesPartII:R0/completed-tensor-product) -/

section CompletedTensor

variable (A B C : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [Algebra A B] [Algebra A C]

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): the group topology on `B ⊗[A] C`
with fundamental system of neighbourhoods `{Iⁿ·F}`, `F` the image of `B₀ ⊗_{A₀} C₀`. -/
@[instance_reducible]
def tensorTopology : TopologicalSpace (B ⊗[A] C) := sorry

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): `tensorTopology` is a ring
topology. -/
theorem isTopologicalRing_tensorTopology :
    @IsTopologicalRing (B ⊗[A] C) (tensorTopology A B C) _ := sorry

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): the canonical uniformity of
`tensorTopology`. -/
@[instance_reducible]
def tensorUniformSpace : UniformSpace (B ⊗[A] C) :=
  letI := tensorTopology A B C
  haveI := isTopologicalRing_tensorTopology A B C
  IsTopologicalAddGroup.rightUniformSpace (B ⊗[A] C)

/-- **Stand-in for AdicSpacesPartII:R0/completed-tensor-product.** The carrier `B ⊗̂_A C`, the
Hausdorff completion of `B ⊗[A] C` for `tensorTopology`. -/
def CompletedTensor : Type _ :=
  @Completion (B ⊗[A] C) (tensorUniformSpace A B C)

instance : UniformSpace (CompletedTensor A B C) :=
  @Completion.uniformSpace (B ⊗[A] C) (tensorUniformSpace A B C)

instance : CommRing (CompletedTensor A B C) :=
  letI := tensorUniformSpace A B C
  haveI : IsTopologicalRing (B ⊗[A] C) := isTopologicalRing_tensorTopology A B C
  haveI : IsUniformAddGroup (B ⊗[A] C) := isUniformAddGroup_of_addCommGroup
  Completion.commRing (B ⊗[A] C)

instance : IsUniformAddGroup (CompletedTensor A B C) := sorry

instance : IsTopologicalRing (CompletedTensor A B C) := sorry

instance : CompleteSpace (CompletedTensor A B C) :=
  @Completion.completeSpace (B ⊗[A] C) (tensorUniformSpace A B C)

instance : T2Space (CompletedTensor A B C) :=
  letI := tensorUniformSpace A B C
  inferInstanceAs (T2Space (Completion (B ⊗[A] C)))

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): `B ⊗[A] C → B ⊗̂_A C`. -/
def Pair.completedTensor.tmul : B ⊗[A] C →+* CompletedTensor A B C := sorry

instance : Algebra A (CompletedTensor A B C) :=
  ((Pair.completedTensor.tmul A B C).comp (algebraMap A (B ⊗[A] C))).toAlgebra

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): the pair of definition of
`B ⊗̂_A C` for adic structure maps. -/
def Pair.completedTensor.pairOfDefinition [IsAdicHom (algebraMap A B)]
    [IsAdicHom (algebraMap A C)] : PairOfDefinition (CompletedTensor A B C) := sorry

instance [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] :
    IsHuberRing (CompletedTensor A B C) :=
  ⟨⟨Pair.completedTensor.pairOfDefinition A B C⟩⟩

variable {A B C} [IsHuberRing A] [IsHuberRing B] [IsHuberRing C] [IsAdicHom (algebraMap A B)]
  [IsAdicHom (algebraMap A C)]

/-- **Stand-in for AdicSpacesPartII:R0/completed-tensor-product** (constructor): the completed
tensor product of Huber pairs along adic structure maps; its plus ring is the closure of the image
of the integral closure of the subring generated by `B⁺ ⊗ 1` and `1 ⊗ C⁺`. -/
def Pair.completedTensor (S : Pair A) (T : Pair B) (U : Pair C)
    (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus) (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus) :
    Pair (CompletedTensor A B C) where
  plus := ((integralClosure
      ↥(T.plus.map (Algebra.TensorProduct.includeLeftRingHom (R := A) (B := C)) ⊔
        U.plus.map (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom :
          Subring (B ⊗[A] C))
      (B ⊗[A] C)).toSubring.map (Pair.completedTensor.tmul A B C)).topologicalClosure
  isRingOfIntegralElements := sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): `inl : (B, B⁺) → B ⊗̂_A C`. -/
def Pair.completedTensor.inl : Pair.Hom T (Pair.completedTensor S T U hT hU) where
  toRingHom := (Pair.completedTensor.tmul A B C).comp Algebra.TensorProduct.includeLeftRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- Stand-in (AdicSpacesPartII:R0/completed-tensor-product): `inr : (C, C⁺) → B ⊗̂_A C`. -/
def Pair.completedTensor.inr : Pair.Hom U (Pair.completedTensor S T U hT hU) where
  toRingHom := (Pair.completedTensor.tmul A B C).comp
    (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

end CompletedTensor

/-! ## Stand-in: the spectral topology and uniformisation (AdicSpacesPartII:R0/spectral-topology,
AdicSpacesPartII:R0/uniformization, AdicSpacesPartII:R0/uniform-completed-tensor-product) -/

/-- Stand-in (AdicSpacesPartII:R0/spectral-topology): the type synonym `A_sp` of a Tate ring,
carrying the spectral topology, whose neighbourhoods of `0` are the `ϖⁿ·A°°`. -/
def SpectralTop (A : Type*) : Type _ := A

section Uniformization

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

instance : CommRing (SpectralTop A) := inferInstanceAs (CommRing A)

/-- Stand-in (AdicSpacesPartII:R0/spectral-topology): the uniformity of the spectral topology. -/
instance : UniformSpace (SpectralTop A) := sorry

instance : IsUniformAddGroup (SpectralTop A) := sorry

instance : IsTopologicalRing (SpectralTop A) := sorry

/-- Stand-in (AdicSpacesPartII:R0/spectral-topology): the identity `A ≃+* A_sp`. -/
def toSpectralTop : A ≃+* SpectralTop A := RingEquiv.refl A

/-- Stand-in (AdicSpacesPartII:R0/spectral-topology): `A_sp` is a Tate ring. -/
instance SpectralTop.isTateRing : IsTateRing (SpectralTop A) := sorry

variable (A) in
/-- **Stand-in for AdicSpacesPartII:R0/uniformization.** The uniformisation `Aᵘ` of a Tate ring,
the completion of `A_sp`. -/
abbrev Uniformization : Type _ := Completion (SpectralTop A)

/-- Stand-in (AdicSpacesPartII:R0/uniformization): the Huber pair `(Aᵘ, Aᵘ⁺)`, `Aᵘ⁺` the closure
of the image of `A⁺` (Kedlaya–Liu Definition 2.8.13). -/
def Pair.uniformization (S : Pair A) : Pair (Uniformization A) where
  plus := ((S.plus.map (toSpectralTop : A ≃+* SpectralTop A).toRingHom).map
    (Completion.coeRingHom : SpectralTop A →+* Completion (SpectralTop A))).topologicalClosure
  isRingOfIntegralElements := sorry

/-- Stand-in (AdicSpacesPartII:R0/uniformization): `ι : (A, A⁺) → (Aᵘ, Aᵘ⁺)`. -/
def Pair.toUniformization (S : Pair A) : Pair.Hom S S.uniformization where
  toRingHom := (Completion.coeRingHom : SpectralTop A →+* Completion (SpectralTop A)).comp
    (toSpectralTop : A ≃+* SpectralTop A).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

end Uniformization

section UniformCompletedTensor

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]

/-- Stand-in (AdicSpacesPartII:R0/uniform-completed-tensor-product): over a Tate ring,
`B ⊗̂_A C` is a Tate ring. -/
instance Pair.completedTensor.instIsTateRing : IsTateRing (CompletedTensor A B C) := sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- **Stand-in for AdicSpacesPartII:R0/uniform-completed-tensor-product.** `B ⊗̂ᵘ_A C`, the
uniformisation of `B ⊗̂_A C`. -/
def Pair.uniformCompletedTensor : Pair (Uniformization (CompletedTensor A B C)) :=
  (Pair.completedTensor S T U hT hU).uniformization

/-- Stand-in (AdicSpacesPartII:R0/uniform-completed-tensor-product): `inlᵘ = ι ∘ inl`. -/
def Pair.uniformCompletedTensor.inl : Pair.Hom T (Pair.uniformCompletedTensor S T U hT hU) :=
  (Pair.toUniformization _).comp (Pair.completedTensor.inl S T U hT hU)

/-- Stand-in (AdicSpacesPartII:R0/uniform-completed-tensor-product): `inrᵘ = ι ∘ inr`. -/
def Pair.uniformCompletedTensor.inr : Pair.Hom U (Pair.uniformCompletedTensor S T U hT hU) :=
  (Pair.toUniformization _).comp (Pair.completedTensor.inr S T U hT hU)

end UniformCompletedTensor

/-! ## Stand-in: finite morphisms of Huber pairs (AdicSpacesPartII:R0/finite-huber-pair-hom) -/

section HomIsFinite

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- **Stand-in for AdicSpacesPartII:R0/finite-huber-pair-hom.** A morphism of Huber pairs is
*finite* (Huber 1996, (1.4.2)) if it is topologically of finite type and both `A → B` and
`A⁺ → B⁺` are integral. -/
structure Pair.Hom.IsFinite {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop where
  /-- `φ` is topologically of finite type. -/
  isTopologicallyFiniteType : IsTopologicallyFiniteType φ.toRingHom
  /-- The ring map `A → B` is integral. -/
  isIntegral : φ.toRingHom.IsIntegral
  /-- The ring map `A⁺ → B⁺` is integral. -/
  isIntegral_plus : (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).IsIntegral

end HomIsFinite

end Huber

end TauCeti

end

/-! # Stage H0. Classical étale sheaves, stalks, direct image and tilde-limits

Every object of this stage lives on an analytic adic space: étale and pro-étale sheaves need the
anchor's category of adic spaces (AdicSpaces Layer 5) and the sites of AdicEtaleGeometry A1
(`AdicSpace.smallEtale`, `AdicSpace.smallEtaleTopology`, geometric points, strict localisations,
pro-étale sites), none of which Mathlib or Tau Ceti has at the pin. Every `AdicSpace.*` packet
item is therefore a comment `-- <name>: not stated here; needs … (supplier: …)` under its node.

What the libraries support is stated under suffixed names, in two families.

* **Site-level cores** (`…_core`). What H0 does formally in the site is stated for a small site
  `(C, J)` and sheaves of modules `Sheaf J (ModuleCat Λ)`: Mathlib's sheafification, pushforward
  and pullback of sheaves (`Functor.sheafPushforwardContinuous`, `Functor.sheafPullback`), slice
  sites (`GrothendieckTopology.over`), points of sites (`GrothendieckTopology.Point`,
  `Point.sheafFiber`, conservative families), the bounded-below derived category
  (`DerivedCategory.Plus`, `Functor.rightDerivedFunctorPlus`), right derived functors,
  `Abelian.Ext`, `Sheaf.H`, `SheafOfModules` and `cechComplexFunctor`. `AdicSpace.EtaleSheaf X Λ`
  is the case where `C` is a small model of `X_ét` (H0/affinoid-etale-basis-essentially-small); a
  morphism `g : X′ → X` enters through its base-change functor `X_ét ⥤ X′_ét`, an étale map
  `U → X` through the slice site `(C/U, J/U)`, and a geometric point through its point of the site.
* **Ring-level cores** (`…_affinoid`, `…_ring`). Huber's tilde-limits are stated for affinoid
  systems: a directed system of Tau Ceti Huber pairs `(Aᵢ, Aᵢ⁺)` with transition morphisms and a
  compatible family of morphisms to `(B, B⁺)`, the adic spectra `ValuationSpectrum.spa` and the
  maps `Huber.Pair.Hom.spaComap`; the limit of the spectra is the space of compatible families.
  Kummer theory is stated for Mathlib's étale algebras.

No stand-in is introduced for adic spaces, their sites or their points.
-/

noncomputable section

namespace TauCeti

open CategoryTheory CategoryTheory.Limits Opposite

universe u

namespace AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small (lemma) -/

-- AdicSpace.essentiallySmall_smallEtaleAff: not stated here; needs the affinoid étale basis
--   `X_ét^aff` (supplier: AdicEtaleGeometry:A1/basis-comparison)
-- AdicSpace.isGrothendieckAbelian_etaleSheaf: not stated here; needs
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.isGrothendieckAbelian_etaleSheaf_core`
-- AdicSpace.essentiallySmall_proEtaleSite: not stated here; needs the κ-small pro-étale sites
--   `X_proét,κ` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-- H0/affinoid-etale-basis-essentially-small (site-level core of (b)): on an essentially small
site, as `X_ét` is by (a), sheaves of `Λ`-modules form a Grothendieck abelian category (Mathlib
`Sheaf.isGrothendieckAbelian_of_essentiallySmall`), which has enough injectives (Kedlaya–Liu,
*Relative p-adic Hodge theory: foundations*, §8.2 before Proposition 8.2.20; Scholze, *Étale
cohomology of diamonds*, proof of Lemma 7.18). -/
theorem isGrothendieckAbelian_etaleSheaf_core {C : Type (u + 1)} [Category.{u} C]
    [EssentiallySmall.{u} C] (J : GrothendieckTopology C) (Λ : Type u) [CommRing Λ]
    [HasSheafify J (ModuleCat.{u} Λ)] :
    IsGrothendieckAbelian.{u} (Sheaf J (ModuleCat.{u} Λ)) ∧
      EnoughInjectives (Sheaf J (ModuleCat.{u} Λ)) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules (construction) -/

-- AdicSpace.EtaleSheaf: not stated here; needs `AdicSpace.smallEtaleTopology` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.EtaleSheaf_core`
-- AdicSpace.EtaleSheaf.isGrothendieckAbelian: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.isGrothendieckAbelian_core`
-- AdicSpace.EtaleSheaf.enoughInjectives: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.enoughInjectives_core`
-- AdicSpace.EtaleSheaf.equivSheafOfModules: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.equivSheafOfModules_core`
-- AdicSpace.EtaleSheaf.sections: not stated here; needs the objects of `AdicSpace.smallEtale`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.sections_core`
-- AdicSpace.EtaleSheaf.const: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.EtaleSheaf.const_core`
-- AdicSpace.EtaleSheaf.const_sections: not stated here; needs the underlying spaces `|U|` of
--   the objects of `AdicSpace.smallEtale` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.EtaleSheaf.pushforward: not stated here; needs the base-change functor
--   `AdicSpace.smallEtale.map` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.pushforward_core`
-- AdicSpace.EtaleSheaf.pullback: not stated here; needs `AdicSpace.smallEtale.map` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.EtaleSheaf.pullback_core`
-- AdicSpace.EtaleSheaf.restrict: not stated here; needs the slice-site identification
--   `U_ét ≃ X_ét/U` (supplier: AdicEtaleGeometry:A1/slice-site); site-level core
--   `AdicSpace.EtaleSheaf.restrict_core`
-- AdicSpace.EtaleSheaf.stalk: not stated here; needs geometric points and their points of
--   `AdicSpace.smallEtaleTopology` (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points); site-level core
--   `AdicSpace.EtaleSheaf.stalk_core`
-- AdicSpace.EtaleSheaf.stalk_pullback: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points); site-level core
--   `AdicSpace.EtaleSheaf.stalk_pullback_core`
-- AdicSpace.EtaleSheaf.isIso_iff_stalk: not stated here; needs the conservativity of geometric
--   points (supplier: AdicEtaleGeometry:A1/etale-enough-points); site-level core
--   `AdicSpace.EtaleSheaf.isIso_iff_stalk_core`
-- AdicSpace.EtaleSheaf.restrictScalars: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.restrictScalars_core`
-- AdicSpace.ProEtaleSheaf: not stated here; needs the κ-small pro-étale sites `X_proét,κ`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected); on a small model it is
--   `AdicSpace.EtaleSheaf_core` of that site
-- AdicSpace.ProEtaleSheaf.nuPullback: not stated here; needs `ν : X_proét → X_ét` (supplier:
--   AdicEtaleGeometry:A1/proetale-projection-nu); site-level core
--   `AdicSpace.EtaleSheaf.pullback_core` of the functor `X_ét ⥤ X_proét,κ`
-- EtaleSheaf.test_const_sections_connected: not stated here; needs the underlying spaces `|U|`
--   of étale objects (supplier: AdicEtaleGeometry:A1/etale-site) [computation test]
-- EtaleSheaf.test_galois_point: not stated here; needs `Spa(K, O_K)` as an adic space and its
--   étale site (supplier: AdicEtaleGeometry:A1/etale-site) [characterisation test]
-- EtaleSheaf.test_rank_one_points_insufficient: not stated here; needs `Spa(C, C⁺)` as an adic
--   space and its geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points) [non-example test]

section SiteCore

variable {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
  {D : Type u} [SmallCategory D] (K : GrothendieckTopology D) (Λ : Type u) [CommRing Λ]

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf`): sheaves of
`Λ`-modules on a small site `(C, J)`; for `C` a small model of `X_ét`
(H0/affinoid-etale-basis-essentially-small) this is `Sh(X_ét, Λ)` (Huber, *Étale cohomology of
rigid analytic varieties and adic spaces*, §2.1; de Jong–van der Put, *Étale cohomology of rigid
analytic spaces*, §3.2). -/
abbrev EtaleSheaf_core : Type (u + 1) :=
  Sheaf J (ModuleCat.{u} Λ)

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.sections`): the
sections functor `Γ(U, −) : F ↦ F(U)`, additive and left exact. -/
abbrev EtaleSheaf.sections_core (U : C) : EtaleSheaf_core J Λ ⥤ ModuleCat.{u} Λ :=
  sheafToPresheaf J (ModuleCat.{u} Λ) ⋙ (evaluation Cᵒᵖ (ModuleCat.{u} Λ)).obj (op U)

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.pushforward`): for a
continuous functor `G : (C, J) → (D, K)` (for `g : X′ → X`, the base change `U ↦ U ×_X X′`), the
direct image `G_* F = F ∘ G` (Mathlib `Functor.sheafPushforwardContinuous`). -/
abbrev EtaleSheaf.pushforward_core (G : C ⥤ D) [G.IsContinuous J K] :
    EtaleSheaf_core K Λ ⥤ EtaleSheaf_core J Λ :=
  G.sheafPushforwardContinuous (ModuleCat.{u} Λ) J K

/-- H0/etale-sheaves-of-modules (supporting): the direct image of sheaves with values in a
preadditive category is additive, being computed on sections (Mathlib has no such instance). -/
instance EtaleSheaf.pushforward_core_additive {A : Type*} [Category* A] [Preadditive A]
    (G : C ⥤ D) [G.IsContinuous J K] : (G.sheafPushforwardContinuous A J K).Additive := sorry

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.restrict`): the
restriction `F ↦ F|_U` to the slice site `(C/U, J/U)` (Mathlib
`GrothendieckTopology.overPullback`), the site-level form of `U_ét ≃ X_ét/U`. -/
abbrev EtaleSheaf.restrict_core (U : C) : EtaleSheaf_core J Λ ⥤ EtaleSheaf_core (J.over U) Λ :=
  J.overPullback (ModuleCat.{u} Λ) U

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.stalk`): the stalk
`F ↦ F_Φ` at a point `Φ` of the site (Mathlib `GrothendieckTopology.Point.sheafFiber`), exact and
colimit preserving; a geometric point of `X` gives such a point of `X_ét` (de Jong–van der Put,
§3.3). -/
abbrev EtaleSheaf.stalk_core (Φ : GrothendieckTopology.Point.{u} J) :
    EtaleSheaf_core J Λ ⥤ ModuleCat.{u} Λ :=
  Φ.sheafFiber

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.restrictScalars`):
change of coefficients along `φ : Λ →+* Λ'` by restriction of scalars. -/
abbrev EtaleSheaf.restrictScalars_core {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ')
    [J.HasSheafCompose (ModuleCat.restrictScalars.{u} φ)] :
    EtaleSheaf_core J Λ' ⥤ EtaleSheaf_core J Λ :=
  sheafCompose J (ModuleCat.restrictScalars.{u} φ)

/- From here on the sites carry sheafification of `Λ`-modules; Mathlib does not infer it for an
arbitrary small site. -/
variable [HasSheafify J (ModuleCat.{u} Λ)] [HasSheafify K (ModuleCat.{u} Λ)]

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.isGrothendieckAbelian`):
`Sh(C, Λ)` is a Grothendieck abelian category. -/
theorem EtaleSheaf.isGrothendieckAbelian_core :
    IsGrothendieckAbelian.{u} (EtaleSheaf_core J Λ) := sorry

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.enoughInjectives`):
`Sh(C, Λ)` has enough injectives. -/
theorem EtaleSheaf.enoughInjectives_core : EnoughInjectives (EtaleSheaf_core J Λ) := sorry

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.equivSheafOfModules`):
sheaves of `Λ`-modules are the sheaves of modules (Mathlib `SheafOfModules`) over the constant
sheaf of rings `Λ_C`, by the identity on underlying presheaves of abelian groups. -/
def EtaleSheaf.equivSheafOfModules_core [HasWeakSheafify J RingCat.{u}] :
    EtaleSheaf_core J Λ ≌ SheafOfModules.{u} ((constantSheaf J RingCat.{u}).obj (RingCat.of Λ)) :=
  sorry

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.const`): the constant
sheaf `M_C` (Mathlib `constantSheaf`); for a terminal object `T`, Mathlib's `constantSheafAdj`
gives `Hom(M_C, F) ≃ Hom_Λ(M, F(T))` (de Jong–van der Put, §3.2). -/
abbrev EtaleSheaf.const_core : ModuleCat.{u} Λ ⥤ EtaleSheaf_core J Λ :=
  constantSheaf J (ModuleCat.{u} Λ)

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.pullback`): the inverse
image `G⁻¹`, left adjoint to `G_*` (Mathlib `Functor.sheafPullback`). -/
abbrev EtaleSheaf.pullback_core (G : C ⥤ D) [G.IsContinuous J K]
    [(G.sheafPushforwardContinuous (ModuleCat.{u} Λ) J K).IsRightAdjoint] :
    EtaleSheaf_core J Λ ⥤ EtaleSheaf_core K Λ :=
  G.sheafPullback (ModuleCat.{u} Λ) J K

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.stalk_pullback`):
`(G⁻¹F)_Φ ≅ F_{Φ ∘ G}` for a point `Φ` of `(D, K)` and a representably flat cover-preserving `G`
(Mathlib `GrothendieckTopology.Point.sheafFiberComapIso`). -/
def EtaleSheaf.stalk_pullback_core (G : C ⥤ D) [G.IsContinuous J K]
    [(G.sheafPushforwardContinuous (ModuleCat.{u} Λ) J K).IsRightAdjoint] [RepresentablyFlat G]
    (hG : CoverPreserving J K G) (Φ : GrothendieckTopology.Point.{u} K)
    [InitiallySmall.{u} (G ⋙ Φ.fiber).Elements] :
    EtaleSheaf.pullback_core J K Λ G ⋙ EtaleSheaf.stalk_core K Λ Φ ≅
      EtaleSheaf.stalk_core J Λ (Φ.comap G hG) :=
  (Φ.sheafFiberComapIso G hG (ModuleCat.{u} Λ)).symm

/-- H0/etale-sheaves-of-modules (site-level core of `AdicSpace.EtaleSheaf.isIso_iff_stalk`): for
a conservative family of points (Mathlib `ObjectProperty.IsConservativeFamilyOfPoints`; for `X_ét`
the geometric points, AdicEtaleGeometry:A1/etale-enough-points), a morphism is an isomorphism iff
it is one on every stalk. -/
theorem EtaleSheaf.isIso_iff_stalk_core
    {P : ObjectProperty (GrothendieckTopology.Point.{u} J)} (hP : P.IsConservativeFamilyOfPoints)
    {F G : EtaleSheaf_core J Λ} (φ : F ⟶ G) :
    IsIso φ ↔ ∀ Φ : P.FullSubcategory, IsIso ((EtaleSheaf.stalk_core J Λ Φ.obj).map φ) := sorry

/- Site-level core of `X = ∅`: when every object is covered by the empty sieve, every sheaf is a
zero object. -/
-- test EtaleSheaf.test_empty (degenerate) [H0/etale-sheaves-of-modules]
example (h : ∀ U : C, (⊥ : Sieve U) ∈ J U) (F : EtaleSheaf_core J Λ) : IsZero F := sorry

/- Site-level core of the comparison with Mathlib's abelian sheaves, on which `Sheaf.H` is
defined: sheaves of `ℤ`-modules are abelian sheaves. -/
-- test EtaleSheaf.test_int_compat (compatibility) [H0/etale-sheaves-of-modules]
example : Nonempty (Sheaf J (ModuleCat.{u} ℤ) ≌ Sheaf J AddCommGrpCat.{u}) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives (lemma) -/

-- AdicSpace.EtaleSheaf.injective_restrict: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.injective_restrict_core`
-- AdicSpace.EtaleSheaf.injective_pushforward: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.injective_pushforward_core`
-- (c), `H^n(U, F) ≅ H^n(U_ét, F|_U)`, is `AdicSpace.etaleCohomology_restrict_core`
--   (H0/derived-direct-image); (d) needs the pro-étale slices (supplier:
--   AdicEtaleGeometry:A1/proetale-slice)

/-- H0/etale-restriction-preserves-injectives (site-level core of (a)): the restriction to a
slice site has the exact left adjoint `u_!` (H0/supports-and-extension-by-zero), so it preserves
injective objects (Stacks Project, Tag 03SH; Scholze, *p-adic Hodge theory for rigid-analytic
varieties*, proof of Lemma 3.16). -/
theorem EtaleSheaf.injective_restrict_core (U : C) (I : EtaleSheaf_core J Λ) [Injective I] :
    Injective ((EtaleSheaf.restrict_core J Λ U).obj I) := sorry

/-- H0/etale-restriction-preserves-injectives (site-level core of (b)): a direct image whose
inverse image is exact preserves injective objects. -/
theorem EtaleSheaf.injective_pushforward_core (G : C ⥤ D) [G.IsContinuous J K]
    [(G.sheafPushforwardContinuous (ModuleCat.{u} Λ) J K).IsRightAdjoint]
    [PreservesFiniteLimits (EtaleSheaf.pullback_core J K Λ G)] (I : EtaleSheaf_core K Λ)
    [Injective I] : Injective ((EtaleSheaf.pushforward_core J K Λ G).obj I) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification (lemma) -/

-- AdicSpace.RNu_iso_sheafify: not stated here; needs `ν : X_proét → X_ét` (supplier:
--   AdicEtaleGeometry:A1/proetale-projection-nu); site-level core
--   `AdicSpace.higherDirectImage_iso_sheafify_core` for the constant-pro-object functor

/-- H0/higher-direct-image-sheafification (site-level core): for a continuous functor
`G : (C, J) → (D, K)` and an abelian sheaf `F` on `D`, `R^q G_* F` is the sheafification of the
presheaf `U ↦ H^q(G(U), F)` (Mathlib `Sheaf.cohomologyPresheaf`). For `G` the base change along
`g : X′ → X` this is `R^q g_* F`; for the constant-pro-object functor `X_ét ⥤ X_proét` it is
`R^q ν_* F` (Scholze, *p-adic Hodge theory for rigid-analytic varieties*, proof of Corollary
3.17). -/
def higherDirectImage_iso_sheafify_core (G : C ⥤ D) [G.IsContinuous J K]
    (F : Sheaf K AddCommGrpCat.{u}) (q : ℕ) :
    ((G.sheafPushforwardContinuous AddCommGrpCat.{u} J K).rightDerived q).obj F ≅
      (presheafToSheaf J AddCommGrpCat.{u}).obj (G.op ⋙ F.cohomologyPresheaf q) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/module-and-abelian-cohomology-agree (lemma) -/

-- AdicSpace.moduleCohomology_iso_abelian: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.moduleCohomology_iso_abelian_core`

/-- H0/module-and-abelian-cohomology-agree (site-level core of (b)): for a sheaf of rings `R` and
an `R`-module `F`, the right derived functors of `Γ(U, −)` on `R`-modules compute the cohomology
`H^n(U, F)` of the underlying abelian sheaf (Mathlib `Sheaf.H'`) (Scholze, *p-adic Hodge theory
for rigid-analytic varieties*, proof of Lemma 3.16; Berkovich, *Étale cohomology for
non-Archimedean analytic spaces*, §4.2). -/
theorem moduleCohomology_iso_abelian_core (R : Sheaf J RingCat.{u}) (F : SheafOfModules.{u} R)
    (U : C) (n : ℕ) :
    Nonempty (((SheafOfModules.toSheaf R ⋙ sheafToPresheaf J AddCommGrpCat.{u} ⋙
      (evaluation Cᵒᵖ AddCommGrpCat.{u}).obj (op U)).rightDerived n).obj F ≅
        ((SheafOfModules.toSheaf R).obj F).H' n U) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/derived-direct-image (construction) -/

-- AdicSpace.EtaleDPlus: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.EtaleDPlus_core`
-- AdicSpace.RGamma: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.RGamma_core`
-- AdicSpace.RGamma.isIso_unit_of_injective: not stated here; needs `AdicSpace.RGamma`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.RGamma.isIso_unit_of_injective_core`
-- AdicSpace.etaleCohomology: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.etaleCohomology_core`
-- AdicSpace.etaleCohomology_zero: not stated here; needs `AdicSpace.etaleCohomology` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.etaleCohomology_zero_core`
-- AdicSpace.etaleCohomology.δ: not stated here; needs `AdicSpace.etaleCohomology` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.etaleCohomology.δ_core`
-- AdicSpace.etaleCohomology_iso_ext: not stated here; needs `AdicSpace.etaleCohomology`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.etaleCohomology_iso_ext_core`
-- AdicSpace.etaleCohomology_iso_sheafH: not stated here; needs `AdicSpace.etaleCohomology`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.etaleCohomology_iso_sheafH_core`
-- AdicSpace.etaleCohomology_restrict: not stated here; needs `AdicSpace.etaleCohomology` and
--   the slice sites (supplier: AdicEtaleGeometry:A1/slice-site); site-level core
--   `AdicSpace.etaleCohomology_restrict_core`
-- AdicSpace.Rpushforward: not stated here; needs `AdicSpace.EtaleSheaf.pushforward` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.Rpushforward_core`
-- AdicSpace.higherDirectImage: not stated here; needs `AdicSpace.EtaleSheaf.pushforward`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.higherDirectImage_core`
-- AdicSpace.higherDirectImage_iso_sheafify: not stated here; needs
--   `AdicSpace.higherDirectImage` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.higherDirectImage_iso_sheafify_core` (H0/higher-direct-image-sheafification)
-- AdicSpace.Rpushforward_comp: not stated here; needs composition of base-change functors
--   `AdicSpace.smallEtale.mapComp` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.Rpushforward_comp_core`
-- AdicSpace.RNu: not stated here; needs `ν : X_proét → X_ét` (supplier:
--   AdicEtaleGeometry:A1/proetale-projection-nu); site-level core `AdicSpace.Rpushforward_core`
--   of the constant-pro-object functor
-- AdicSpace.RGamma_Rpushforward: not stated here; needs `AdicSpace.Rpushforward` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.RGamma_Rpushforward_core`
-- etaleCohomology_test_galois: not stated here; needs `Spa(K, O_K)` as an adic space and its
--   étale site (supplier: AdicEtaleGeometry:A1/etale-site) [computation test]
-- etaleCohomology_test_not_coherent: not stated here; needs `Spa(ℚ_p, ℤ_p)` as an adic space
--   and `𝒪_{X_ét}` (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf) [non-example test]

/-- H0/derived-direct-image (site-level core of `AdicSpace.EtaleDPlus`): `D⁺(C, Λ)`, the full
subcategory of cohomologically bounded below objects of the derived category of `Sh(C, Λ)`
(Mathlib `DerivedCategory.Plus`) (Scholze, *Étale cohomology of diamonds*, §14 before
Proposition 14.10). -/
abbrev EtaleDPlus_core [HasDerivedCategory (EtaleSheaf_core J Λ)] : Type _ :=
  DerivedCategory.Plus (EtaleSheaf_core J Λ)

/-- H0/derived-direct-image (site-level core of `AdicSpace.RGamma`): `RΓ(U, −)`, the right derived
functor of `Γ(U, −)` on bounded below derived categories (Mathlib
`Functor.rightDerivedFunctorPlus`). -/
def RGamma_core [HasDerivedCategory (EtaleSheaf_core J Λ)] [HasDerivedCategory (ModuleCat.{u} Λ)]
    (U : C) : EtaleDPlus_core J Λ ⥤ DerivedCategory.Plus (ModuleCat.{u} Λ) :=
  (EtaleSheaf.sections_core J Λ U).rightDerivedFunctorPlus

/-- H0/derived-direct-image (site-level core of `AdicSpace.RGamma.isIso_unit_of_injective`): on a
bounded below complex of injective sheaves the unit `Γ(U, I^•) → RΓ(U, I^•)` is an isomorphism. -/
theorem RGamma.isIso_unit_of_injective_core [HasDerivedCategory (EtaleSheaf_core J Λ)]
    [HasDerivedCategory (ModuleCat.{u} Λ)] (U : C)
    (I : HomotopyCategory.Plus (InjectiveObject (EtaleSheaf_core J Λ))) :
    IsIso ((EtaleSheaf.sections_core J Λ U).rightDerivedFunctorPlusUnit.app
      ((InjectiveObject.ι _).mapHomotopyCategoryPlus.obj I)) := sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology`):
`H^n(U, F) = R^nΓ(U, −)(F)` (Mathlib `Functor.rightDerived`), computed by injective resolutions
(Huber, §3.5, Corollary 3.5.11). -/
abbrev etaleCohomology_core (U : C) (n : ℕ) : EtaleSheaf_core J Λ ⥤ ModuleCat.{u} Λ :=
  (EtaleSheaf.sections_core J Λ U).rightDerived n

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology_zero`):
`H^0(U, F) ≅ F(U)`, naturally in `F` (Mathlib `Functor.rightDerivedZeroIsoSelf`). -/
def etaleCohomology_zero_core (U : C) :
    etaleCohomology_core J Λ U 0 ≅ EtaleSheaf.sections_core J Λ U :=
  (EtaleSheaf.sections_core J Λ U).rightDerivedZeroIsoSelf

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology.δ`): the connecting
map `H^n(U, F″) → H^{n+1}(U, F′)` of a short exact sequence `0 → F′ → F → F″ → 0`. -/
def etaleCohomology.δ_core (U : C) {S : ShortComplex (EtaleSheaf_core J Λ)} (hS : S.ShortExact)
    (n : ℕ) :
    (etaleCohomology_core J Λ U n).obj S.X₃ ⟶ (etaleCohomology_core J Λ U (n + 1)).obj S.X₁ :=
  sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology_iso_ext`): for a
terminal object `T` (the space `X` in `X_ét`), `H^n(T, F) ≅ Ext^n(Λ_C, F)` (Mathlib
`Abelian.Ext`). -/
def etaleCohomology_iso_ext_core {T : C} (hT : IsTerminal T) (F : EtaleSheaf_core J Λ) (n : ℕ) :
    (etaleCohomology_core J Λ T n).obj F ≃+
      Abelian.Ext.{u} ((EtaleSheaf.const_core J Λ).obj (ModuleCat.of Λ Λ)) F n := sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology_iso_sheafH`): for
abelian sheaves (`Λ = ℤ`), the derived functors of `Γ(T, −)` at a terminal object are Mathlib's
`Sheaf.H F n`. -/
def etaleCohomology_iso_sheafH_core {T : C} (hT : IsTerminal T) (F : Sheaf J AddCommGrpCat.{u})
    (n : ℕ) :
    ((sheafToPresheaf J AddCommGrpCat.{u} ⋙
      (evaluation Cᵒᵖ AddCommGrpCat.{u}).obj (op T)).rightDerived n).obj F ≃+ Sheaf.H F n :=
  sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.etaleCohomology_restrict`):
`H^n(U, F) ≅ H^n(U_ét, F|_U)`, computed on the slice site with its terminal object `𝟙 U`
(H0/etale-restriction-preserves-injectives). -/
def etaleCohomology_restrict_core (U : C) [HasSheafify (J.over U) (ModuleCat.{u} Λ)] (n : ℕ) :
    etaleCohomology_core J Λ U n ≅
      EtaleSheaf.restrict_core J Λ U ⋙ etaleCohomology_core (J.over U) Λ (Over.mk (𝟙 U)) n :=
  sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.Rpushforward`): `RG_*`, the right
derived functor of `G_*` on bounded below derived categories. -/
def Rpushforward_core [HasDerivedCategory (EtaleSheaf_core J Λ)]
    [HasDerivedCategory (EtaleSheaf_core K Λ)] (G : C ⥤ D) [G.IsContinuous J K] :
    EtaleDPlus_core K Λ ⥤ EtaleDPlus_core J Λ :=
  (EtaleSheaf.pushforward_core J K Λ G).rightDerivedFunctorPlus

/-- H0/derived-direct-image (site-level core of `AdicSpace.higherDirectImage`):
`R^q G_* F = (G_*).rightDerived q F`, with `R^0 G_* = G_*`. -/
abbrev higherDirectImage_core (G : C ⥤ D) [G.IsContinuous J K] (q : ℕ) :
    EtaleSheaf_core K Λ ⥤ EtaleSheaf_core J Λ :=
  (EtaleSheaf.pushforward_core J K Λ G).rightDerived q

/-- H0/derived-direct-image (site-level core of `AdicSpace.Rpushforward_comp`):
`R(G ⋙ G′)_* ≅ RG_* ∘ RG′_*`, as direct images compose contravariantly in the functors of sites
(H0/leray-spectral-sequence). -/
def Rpushforward_comp_core {E : Type u} [SmallCategory E] (L : GrothendieckTopology E)
    [HasSheafify L (ModuleCat.{u} Λ)] [HasDerivedCategory (EtaleSheaf_core J Λ)]
    [HasDerivedCategory (EtaleSheaf_core K Λ)] [HasDerivedCategory (EtaleSheaf_core L Λ)]
    (G : C ⥤ D) (G' : D ⥤ E) [G.IsContinuous J K]
    [G'.IsContinuous K L] [(G ⋙ G').IsContinuous J L] :
    Rpushforward_core J L Λ (G ⋙ G') ≅
      Rpushforward_core K L Λ G' ⋙ Rpushforward_core J K Λ G := sorry

/-- H0/derived-direct-image (site-level core of `AdicSpace.RGamma_Rpushforward`):
`RΓ(U, RG_* K) ≅ RΓ(G(U), K)`, naturally in `K ∈ D⁺(D, Λ)`. -/
def RGamma_Rpushforward_core [HasDerivedCategory (EtaleSheaf_core J Λ)]
    [HasDerivedCategory (EtaleSheaf_core K Λ)] [HasDerivedCategory (ModuleCat.{u} Λ)]
    (G : C ⥤ D) [G.IsContinuous J K] (U : C) :
    Rpushforward_core J K Λ G ⋙ RGamma_core J Λ U ≅ RGamma_core K Λ (G.obj U) := sorry

-- test etaleCohomology_test_injective (degenerate) [H0/derived-direct-image]
example (U : C) (I : EtaleSheaf_core J Λ) [Injective I] (n : ℕ) :
    IsZero ((etaleCohomology_core J Λ U (n + 1)).obj I) := sorry

/- Site-level core: for abelian sheaves the cohomology of the terminal object is Mathlib's
`Sheaf.H`, and in degree `0` it is the global sections (`Sheaf.H.equiv₀`). -/
-- test etaleCohomology_test_sheafH (compatibility) [H0/derived-direct-image]
example {T : C} (hT : IsTerminal T) (F : Sheaf J AddCommGrpCat.{u}) (n : ℕ) :
    Nonempty (((sheafToPresheaf J AddCommGrpCat.{u} ⋙
      (evaluation Cᵒᵖ AddCommGrpCat.{u}).obj (op T)).rightDerived n).obj F ≃+ Sheaf.H F n) ∧
      Nonempty (Sheaf.H F 0 ≃+ F.obj.obj (op T)) := sorry

-- test RGamma_test_injective_complex (characterisation) [H0/derived-direct-image]
example [HasDerivedCategory (EtaleSheaf_core J Λ)] [HasDerivedCategory (ModuleCat.{u} Λ)]
    (U : C) (I : HomotopyCategory.Plus (InjectiveObject (EtaleSheaf_core J Λ))) :
    IsIso ((EtaleSheaf.sections_core J Λ U).rightDerivedFunctorPlusUnit.app
      ((InjectiveObject.ι _).mapHomotopyCategoryPlus.obj I)) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site (construction) -/

-- AdicSpace.PseudoAdicSite: not stated here; needs `AdicSpace.smallEtale` and the underlying
--   spaces of its objects (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.PseudoAdicSite.topology: not stated here; needs the maps `|U| → |X|` of étale
--   objects (supplier: AdicEtaleGeometry:A1/etale-site); the topology `J_S` is Mathlib's
--   `GrothendieckTopology` on `AdicSpace.smallEtale X`
-- AdicSpace.PseudoAdicSite.mem_topology_iff: not stated here; needs
--   `AdicSpace.PseudoAdicSite.topology` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.PseudoAdicSite.le_topology: not stated here; needs
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.PseudoAdicSite.incl: not stated here; needs `AdicSpace.PseudoAdicSite.topology`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.PseudoAdicSite.point: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points); the point is Mathlib's
--   `GrothendieckTopology.Point`
-- AdicSpace.PseudoAdicSite.isConservativeFamily: not stated here; needs geometric points
--   (supplier: AdicEtaleGeometry:A1/etale-enough-points)
-- AdicSpace.PseudoAdicSite.stalk_incl: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.PseudoAdicSite.equivOpen: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.PseudoAdicSite.map: not stated here; needs `AdicSpace.smallEtale.map` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.PseudoAdicSite.IsPseudoAdic: not stated here; needs the underlying spaces of adic
--   spaces (supplier: AdicSpaces Layer 5); topological core
--   `AdicSpace.PseudoAdicSite.IsPseudoAdic_core`
-- PseudoAdicSite.test_univ: not stated here; needs `AdicSpace.PseudoAdicSite.topology`
--   (supplier: AdicEtaleGeometry:A1/etale-site) [degenerate test]
-- PseudoAdicSite.test_open: not stated here; needs open subspaces of adic spaces (supplier:
--   AdicSpaces Layer 5) [compatibility test]
-- PseudoAdicSite.test_closed_point: not stated here; needs `Spa(C, C⁺)` as an adic space
--   (supplier: AdicSpaces Layer 5) [computation test]
-- PseudoAdicSite.test_not_adic: not stated here; needs the closed unit disc as an adic space
--   (supplier: AdicSpaces Layer 5) [non-example test]

/-- H0/pseudo-adic-etale-site (topological core of `AdicSpace.PseudoAdicSite.IsPseudoAdic`):
Huber's conditions on a subset `S` of the underlying space of an adic space: `S` is convex (it
contains every point specialising between two of its points) and locally pro-constructible (every
point has an open neighbourhood `U` in which `U ∩ S` is closed for Mathlib's
`constructibleTopology` of `U`) (Huber, §3.5, (3.5.3); Scholze, *Étale cohomology of diamonds*,
Remark 19.3). -/
structure PseudoAdicSite.IsPseudoAdic_core {X : Type u} [TopologicalSpace X] (S : Set X) :
    Prop where
  /-- `S` contains every point specialising between two of its points. -/
  convex : ∀ ⦃x y z : X⦄, x ∈ S → z ∈ S → x ⤳ y → y ⤳ z → y ∈ S
  /-- `S` is locally pro-constructible. -/
  locallyProConstructible : ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
    @IsClosed U (constructibleTopology U) (Subtype.val ⁻¹' S)

/-! ## ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs (theorem) -/

-- AdicSpace.sections_eq_stalk_fieldPair: not stated here; needs `Spa(C, C⁺)` as an adic space
--   and its geometric points (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points);
--   site-level core `AdicSpace.sections_eq_stalk_fieldPair_core`
-- AdicSpace.etaleCohomology_fieldPair_eq_zero: not stated here; needs `Spa(C, C⁺)` as an adic
--   space (supplier: AdicSpaces Layer 5); site-level core
--   `AdicSpace.etaleCohomology_fieldPair_eq_zero_core`
-- AdicSpace.etaleSheafEquivOpens_fieldPair, AdicSpace.stalk_iso_sections_pullback: not stated
--   here; need the underlying space of `Spa(C, C⁺)` and geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points)

/-- H0/geometric-stalks-at-field-pairs (site-level core of (a)): if every covering sieve of `T`
is maximal, as for `T = Spa(C, C⁺)` whose étale covers split, then `Γ(T, −)` is exact and
commutes with all colimits, so it is a point (Scholze, *Étale cohomology of diamonds*, proof of
Proposition 14.3). -/
theorem sections_eq_stalk_fieldPair_core (T : C) (hT : ∀ R ∈ J T, R = ⊤) :
    PreservesFiniteLimits (EtaleSheaf.sections_core J Λ T) ∧
      PreservesColimitsOfSize.{u, u} (EtaleSheaf.sections_core J Λ T) := sorry

/-- H0/geometric-stalks-at-field-pairs (site-level core of (b)): if every covering sieve of `T` is
maximal, then `H^n(T, F) = 0` for `n > 0` (Scholze, *Étale cohomology of diamonds*, proof of
Proposition 14.3). -/
theorem etaleCohomology_fieldPair_eq_zero_core (T : C) (hT : ∀ R ∈ J T, R = ⊤)
    (F : EtaleSheaf_core J Λ) (n : ℕ) : IsZero ((etaleCohomology_core J Λ T (n + 1)).obj F) :=
  sorry

/-! ## ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero (construction) -/

-- AdicSpace.EtaleSheaf.extendByZero: not stated here; needs the slice-site identification
--   `U_ét ≃ X_ét/U` (supplier: AdicEtaleGeometry:A1/slice-site); site-level core
--   `AdicSpace.EtaleSheaf.extendByZero_core`
-- AdicSpace.EtaleSheaf.extendByZeroAdj: not stated here; needs
--   `AdicSpace.EtaleSheaf.extendByZero` (supplier: AdicEtaleGeometry:A1/slice-site); site-level
--   core `AdicSpace.EtaleSheaf.extendByZeroAdj_core`
-- AdicSpace.EtaleSheaf.extendByZero_exact: not stated here; needs
--   `AdicSpace.EtaleSheaf.extendByZero` (supplier: AdicEtaleGeometry:A1/slice-site); site-level
--   core `AdicSpace.EtaleSheaf.extendByZero_exact_core`
-- AdicSpace.EtaleSheaf.stalk_extendByZero: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points); site-level core
--   `AdicSpace.EtaleSheaf.stalk_extendByZero_core`
-- AdicSpace.EtaleSheaf.extendByZero_iso_pushforward_of_finiteEtale: not stated here; needs
--   finite étale morphisms of adic spaces (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.EtaleSheaf.restrict_extendByZero: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5); site-level core
--   `AdicSpace.EtaleSheaf.restrict_extendByZero_core`
-- AdicSpace.EtaleSheaf.closedRestrict: not stated here; needs the pseudo-adic site of the closed
--   complement (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.sectionsWithSupport: not stated here; needs open subspaces of adic spaces
--   and their closed complements (supplier: AdicSpaces Layer 5)
-- AdicSpace.cohomologyWithSupport: not stated here; needs
--   `AdicSpace.EtaleSheaf.sectionsWithSupport` (supplier: AdicSpaces Layer 5)
-- AdicSpace.EtaleSheaf.extendByZeroLocallyClosed: not stated here; needs the pseudo-adic sites of
--   locally closed subsets (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.closedRestrict_extendByZero: not stated here; needs
--   `AdicSpace.EtaleSheaf.closedRestrict` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- extendByZero_test_disc: not stated here; needs the closed unit disc over `ℚ_p` as an adic
--   space (supplier: AdicSpaces Layer 5) [computation test]
-- extendByZero_test_stalk_boundary: not stated here; needs the closed unit disc and its rank-two
--   points (supplier: AdicSpaces Layer 5) [non-example test]

section ExtendByZero

variable (U : C)
  [((Over.forget U).sheafPushforwardContinuous (ModuleCat.{u} Λ) (J.over U) J).IsRightAdjoint]

/-- H0/supports-and-extension-by-zero (site-level core of `AdicSpace.EtaleSheaf.extendByZero`):
the extension by zero `u_!` from the slice site `(C/U, J/U)`, the pullback along the forgetful
functor `C/U ⥤ C` (Mathlib `Functor.sheafPullback`), that is the sheafification of the left Kan
extension (Stacks Project, Tag 03SH). -/
abbrev EtaleSheaf.extendByZero_core :
    EtaleSheaf_core (J.over U) Λ ⥤ EtaleSheaf_core J Λ :=
  (Over.forget U).sheafPullback (ModuleCat.{u} Λ) (J.over U) J

/-- H0/supports-and-extension-by-zero (site-level core of `AdicSpace.EtaleSheaf.extendByZeroAdj`):
`u_! ⊣ u⁻¹` (Mathlib `Functor.sheafAdjunctionContinuous`). -/
def EtaleSheaf.extendByZeroAdj_core :
    EtaleSheaf.extendByZero_core J Λ U ⊣ EtaleSheaf.restrict_core J Λ U :=
  (Over.forget U).sheafAdjunctionContinuous (ModuleCat.{u} Λ) (J.over U) J

/-- H0/supports-and-extension-by-zero (site-level core of
`AdicSpace.EtaleSheaf.extendByZero_exact`): `u_!` is exact (Berkovich, §5.2, proof of Proposition
5.2.6). -/
theorem EtaleSheaf.extendByZero_exact_core :
    PreservesFiniteLimits (EtaleSheaf.extendByZero_core J Λ U) := sorry

/-- H0/supports-and-extension-by-zero (site-level core of
`AdicSpace.EtaleSheaf.stalk_extendByZero`): `(u_!G)_Φ ≅ ⊕ G_{Φ/x}`, the sum over the lifts
`x ∈ Φ(U)` of the point `Φ` to the slice site (Mathlib `GrothendieckTopology.Point.over`). -/
def EtaleSheaf.stalk_extendByZero_core (Φ : GrothendieckTopology.Point.{u} J)
    (G : EtaleSheaf_core (J.over U) Λ) :
    (EtaleSheaf.stalk_core J Λ Φ).obj ((EtaleSheaf.extendByZero_core J Λ U).obj G) ≅
      ∐ fun x : Φ.fiber.obj U => (EtaleSheaf.stalk_core (J.over U) Λ (Φ.over x)).obj G := sorry

/-- H0/supports-and-extension-by-zero (site-level core of
`AdicSpace.EtaleSheaf.restrict_extendByZero`): for `U → T` a monomorphism to the terminal object
(an open subspace `U ⊆ X`), `j⁻¹ j_! ≅ id`. -/
def EtaleSheaf.restrict_extendByZero_core {T : C} (hT : IsTerminal T) [Mono (hT.from U)] :
    EtaleSheaf.extendByZero_core J Λ U ⋙ EtaleSheaf.restrict_core J Λ U ≅ 𝟭 _ := sorry

/- Site-level core of `j = id_X`: restriction to the slice over a terminal object is an
equivalence, so `j_! = j⁻¹ = id`. -/
-- test extendByZero_test_univ (degenerate) [H0/supports-and-extension-by-zero]
example {T : C} (hT : IsTerminal T) : (EtaleSheaf.restrict_core J Λ T).IsEquivalence := sorry

-- test extendByZero_test_sheafPullback (compatibility) [H0/supports-and-extension-by-zero]
example :
    EtaleSheaf.extendByZero_core J Λ U =
      (Over.forget U).sheafPullback (ModuleCat.{u} Λ) (J.over U) J := rfl

-- test extendByZero_test_adjunction (characterisation) [H0/supports-and-extension-by-zero]
example : EtaleSheaf.extendByZero_core J Λ U ⊣ EtaleSheaf.restrict_core J Λ U :=
  EtaleSheaf.extendByZeroAdj_core J Λ U

end ExtendByZero

/-! ## ClassicalAdicEtaleCohomology:H0/ordinary-vs-enhanced-ext-comparison (comparison) -/

-- AdicSpace.ext_iso_enhanced: not stated here; needs E1's enhanced derived category (supplier:
--   EnhancedDerivedSheaves:E1/enhanced-derived-category); its ordinary half is
--   `AdicSpace.ext_iso_enhanced_core`
-- AdicSpace.RGamma_eq_enhanced: not stated here; needs E1's K-injective replacements (supplier:
--   EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements); its input, that a bounded
--   below complex of injective sheaves is K-injective, is Mathlib's
--   `CochainComplex.isKInjective_of_injective`

/-- H0/ordinary-vs-enhanced-ext-comparison (site-level core of (a), ordinary half):
`Ext^n(F, G) ≅ Hom_{D(C, Λ)}(F, G[n])` (Mathlib `Abelian.Ext.homEquiv`) (Scholze, *Étale
cohomology of diamonds*, proof of Lemma 17.1). -/
theorem ext_iso_enhanced_core [HasDerivedCategory (EtaleSheaf_core J Λ)]
    (F G : EtaleSheaf_core J Λ) (n : ℕ) :
    Nonempty (Abelian.Ext.{u} F G n ≃ ShiftedHom ((DerivedCategory.singleFunctor _ 0).obj F)
      ((DerivedCategory.singleFunctor _ 0).obj G) (n : ℤ)) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence (theorem) -/

-- AdicSpace.leraySpectralSequence: not stated here; needs `AdicSpace.higherDirectImage`
--   (supplier: AdicEtaleGeometry:A1/etale-site) and convergent Grothendieck spectral sequences
--   of composite functors (supplier: DiamondsAndVStacks:D0/cech-to-derived-comparison)
-- (a) at site level: `AdicSpace.EtaleSheaf.injective_pushforward_core`,
--   `AdicSpace.Rpushforward_comp_core` and `AdicSpace.RGamma_Rpushforward_core`

/-! ## ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison (theorem) -/

-- AdicSpace.cechToDerived: not stated here; needs coverings in `AdicSpace.smallEtale` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core of the Leray acyclicity in (a)
--   `AdicSpace.cechToDerived_core`
-- AdicSpace.cechToDerived_spectralSequence: not stated here; needs convergent Čech-to-derived
--   spectral sequences (supplier: DiamondsAndVStacks:D0/cech-to-derived-comparison)
-- AdicSpace.cechToDerived_affinoidBasis: not stated here; needs the stable affinoid basis and the
--   reduction of étale coverings (supplier: AdicEtaleGeometry:A1/etale-covering-reduction)

/-- H0/cech-to-derived-comparison (site-level core of Leray acyclicity in (a)): if a family
`U : ι → C` covers the terminal object `T` and `F` has no higher cohomology on the finite products
`U_{i₀} × ⋯ × U_{i_p}` (fibre products over `T`), the Čech complex (Mathlib `cechComplexFunctor`)
computes `H^*(T, F)` (de Jong–van der Put, proof of Proposition 2.5.4; Kedlaya–Liu, Proposition
8.2.21). -/
theorem cechToDerived_core [HasFiniteProducts C] {T : C} (hT : IsTerminal T) {ι : Type u}
    (U : ι → C) (hU : J.CoversTop U) (F : EtaleSheaf_core J Λ)
    (hacyc : ∀ (n : ℕ) (x : Fin (n + 1) → ι) (q : ℕ),
      IsZero ((etaleCohomology_core J Λ (∏ᶜ fun k => U (x k)) (q + 1)).obj F)) (p : ℕ) :
    Nonempty (((cechComplexFunctor U).obj F.obj).homology p ≅
      (etaleCohomology_core J Λ T p).obj F) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology (lemma) -/

-- ProfiniteGSet.cohomology_pt_iso_continuous: not stated here; needs the site of profinite
--   `G`-sets with the corrected coverings (supplier: AdicEtaleGeometry:A1/profinite-g-sets-site);
--   the target is Mathlib's `continuousCohomology`

/-! ## ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity (lemma) -/

-- AdicSpace.proEtaleCohomology_limit: not stated here; needs quasi-compact quasi-separated
--   objects of `X_proét` and their presentations (supplier:
--   AdicEtaleGeometry:A1/proetale-coherence)

/-! ## ClassicalAdicEtaleCohomology:H0/cartan-leray-spectral-sequence (theorem) -/

-- AdicSpace.cartanLeray_finiteEtale: not stated here; needs finite étale Galois coverings of
--   adic spaces (supplier: AdicEtaleGeometry:A1/finite-etale-site) and convergent spectral
--   sequences (supplier: DiamondsAndVStacks:D0/cech-to-derived-comparison)
-- AdicSpace.cartanLeray_proFiniteEtale: not stated here; needs pro-finite-étale torsors in
--   `X_proét` (supplier: AdicEtaleGeometry:A1/profinite-galois-cover-is-covering); the `E₂`
--   term is Mathlib's `continuousCohomology`

/-! ## ClassicalAdicEtaleCohomology:H0/proetale-etale-comparison (theorem) -/

-- AdicSpace.isIso_unit_RNu: not stated here; needs `ν : X_proét → X_ét` (supplier:
--   AdicEtaleGeometry:A1/proetale-projection-nu)
-- AdicSpace.nu_Rpushforward_baseChange: not stated here; needs the pro-étale direct images of
--   morphisms of adic spaces (supplier: AdicEtaleGeometry:A1/proetale-projection-nu)

/-! ## ClassicalAdicEtaleCohomology:H0/affine-local-description (theorem) -/

-- AdicSpace.etaleSheafEquivAffinoid: not stated here; needs the affinoid étale basis as a dense
--   subsite (supplier: AdicEtaleGeometry:A1/basis-comparison); site-level core
--   `AdicSpace.etaleSheafEquivAffinoid_core`
-- AdicSpace.Rpushforward_restrict: not stated here; needs the base change `X′ ×_X V` of étale
--   objects (supplier: AdicEtaleGeometry:A1/etale-site)

/-- H0/affine-local-description (site-level core of (i)): for a dense subsite `G : (C, J) → (D, K)`
(the affinoid étale basis in `X_ét`), restriction is an equivalence of sheaf categories (Mathlib
`Functor.IsDenseSubsite.sheafEquiv`) (Kedlaya–Liu, §8.2 before Proposition 8.2.20; de Jong–van der
Put, Proposition 3.2.2). -/
def etaleSheafEquivAffinoid_core (G : C ⥤ D) [Functor.IsDenseSubsite J K G] :
    EtaleSheaf_core J Λ ≌ EtaleSheaf_core K Λ := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles (theorem) -/

-- AdicSpace.etaleAcyclic_finiteProjective: not stated here; needs strongly sheafy Huber pairs
--   (supplier: AdicEtaleGeometry:A1/strongly-sheafy-huber-pair) and the étale site of
--   `Spa(A, A⁺)` (supplier: AdicEtaleGeometry:A1/etale-site); its finite étale descent step is
--   the affinoid core `Huber.Pair.finiteEtale.equalizer_ring` of
--   AdicEtaleGeometry:A1/etale-structure-sheaf

/-! ## ClassicalAdicEtaleCohomology:H0/localisation-sequence (lemma) -/

-- AdicSpace.localisationSequence_exact: not stated here; needs the closed restriction `i⁻¹`
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.cohomologyWithSupport_longExact: not stated here; needs
--   `AdicSpace.cohomologyWithSupport` (supplier: AdicSpaces Layer 5)
-- AdicSpace.localisationSequence_surjective: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5); site-level core
--   `AdicSpace.localisationSequence_surjective_core`

/-- H0/localisation-sequence (site-level core of (d)): for a monomorphism `f : U ⟶ T` (an open
subspace `U ⊆ X`) and an injective sheaf `I`, the restriction `I(T) → I(U)` is surjective
(Berkovich, §5.2, proof of Proposition 5.2.6). -/
theorem localisationSequence_surjective_core {U T : C} (f : U ⟶ T) [Mono f]
    (I : EtaleSheaf_core J Λ) [Injective I] : Function.Surjective (I.obj.map f.op).hom := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/torsion-local-systems (definition) -/

-- AdicSpace.EtaleSheaf.IsLocallyConstant: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.IsLocallyConstant_core`
-- AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType: not stated here; needs
--   `AdicSpace.EtaleSheaf` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType_core`
-- AdicSpace.TorsionLocalSystem: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site); site-level core `AdicSpace.TorsionLocalSystem_core`
-- AdicSpace.EtaleSheaf.isLocallyConstant_const: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.isLocallyConstant_const_core`
-- AdicSpace.EtaleSheaf.IsLocallyConstant.pullback: not stated here; needs
--   `AdicSpace.smallEtale.map` (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.IsLocallyConstant.pullback_core`
-- AdicSpace.EtaleSheaf.IsLocallyConstant.restrict: not stated here; needs the slice sites
--   (supplier: AdicEtaleGeometry:A1/slice-site); site-level core
--   `AdicSpace.EtaleSheaf.IsLocallyConstant.restrict_core`
-- AdicSpace.EtaleSheaf.IsLocallyConstant.kernel: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site); site-level core
--   `AdicSpace.EtaleSheaf.IsLocallyConstant.kernel_core`
-- AdicSpace.EtaleSheaf.IsLocallyConstant.tensor: not stated here; needs `AdicSpace.EtaleSheaf`
--   (supplier: AdicEtaleGeometry:A1/etale-site) and the tensor product of sheaves of modules
-- AdicSpace.EtaleSheaf.IsLocallyConstant.stalk_iso: not stated here; needs geometric points and
--   the connectedness of `|X|` (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.EtaleSheaf.IsLocallyConstant.equivFiniteEtale: not stated here; needs finite étale
--   `X`-spaces (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.EtaleSheaf.IsLocallyConstant.equivPiOneModules: not stated here; needs the étale
--   fundamental group (supplier: AdicEtaleGeometry:A1/finite-etale-galois-category)
-- AdicSpace.LisseSheaf: not stated here; needs `AdicSpace.EtaleSheaf` (supplier:
--   AdicEtaleGeometry:A1/etale-site) and, for lisse `ℤ̂_ℓ`-sheaves, `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected)
-- IsLocallyConstant.test_galois_point: not stated here; needs `Spa(K, O_K)` as an adic space
--   (supplier: AdicEtaleGeometry:A1/etale-site) [computation test]
-- IsLocallyConstant.test_analytification: not stated here; needs the analytification morphism
--   of étale sites (supplier: AdicSpacesPartII:R4/analytification-etale-site) [compatibility test]
-- IsLocallyConstant.test_extendByZero: not stated here; needs the closed unit disc as an adic
--   space (supplier: AdicSpaces Layer 5) [non-example test]
-- IsLocallyConstant.test_representable: not stated here; needs finite étale `X`-spaces
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site) [characterisation test]

/-- H0/torsion-local-systems (site-level core of `AdicSpace.EtaleSheaf.IsLocallyConstant`): `F` is
locally constant if a family of objects `Uᵢ` covering the site (Mathlib
`GrothendieckTopology.CoversTop`) has `F|_{Uᵢ} ≅ (Mᵢ)_C|_{Uᵢ}` for `Λ`-modules `Mᵢ` (Scholze,
*p-adic Hodge theory for rigid-analytic varieties*, Definition 8.1; Berkovich, §4.4). -/
def EtaleSheaf.IsLocallyConstant_core (F : EtaleSheaf_core J Λ) : Prop :=
  ∃ (ι : Type u) (U : ι → C) (M : ι → ModuleCat.{u} Λ), J.CoversTop U ∧
    ∀ i, Nonempty ((EtaleSheaf.restrict_core J Λ (U i)).obj F ≅
      (EtaleSheaf.restrict_core J Λ (U i)).obj ((EtaleSheaf.const_core J Λ).obj (M i)))

/-- H0/torsion-local-systems (site-level core of
`AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType`): locally constant with finitely generated
local values. -/
def EtaleSheaf.IsLocallyConstant.ofFiniteType_core (F : EtaleSheaf_core J Λ) : Prop :=
  ∃ (ι : Type u) (U : ι → C) (M : ι → ModuleCat.{u} Λ), J.CoversTop U ∧
    (∀ i, Module.Finite Λ (M i)) ∧ ∀ i, Nonempty ((EtaleSheaf.restrict_core J Λ (U i)).obj F ≅
      (EtaleSheaf.restrict_core J Λ (U i)).obj ((EtaleSheaf.const_core J Λ).obj (M i)))

/-- H0/torsion-local-systems (site-level core of `AdicSpace.TorsionLocalSystem`): for a
coefficient ring `Λ` of characteristic `n ≠ 0` (so `nΛ = 0`), the torsion local systems of rank
`r`: sheaves locally isomorphic to the constant sheaf `(Λ^r)_U` (Scholze, *p-adic Hodge theory for
rigid-analytic varieties*, Definition 8.1). -/
def TorsionLocalSystem_core (n : ℕ) [NeZero n] [CharP Λ n] (r : ℕ) :
    ObjectProperty (EtaleSheaf_core J Λ) :=
  fun F => ∃ (ι : Type u) (U : ι → C), J.CoversTop U ∧
    ∀ i, Nonempty ((EtaleSheaf.restrict_core J Λ (U i)).obj F ≅
      (EtaleSheaf.restrict_core J Λ (U i)).obj
        ((EtaleSheaf.const_core J Λ).obj (ModuleCat.of Λ (Fin r → Λ))))

/-- H0/torsion-local-systems (site-level core of `AdicSpace.EtaleSheaf.isLocallyConstant_const`):
constant sheaves are locally constant. -/
theorem EtaleSheaf.isLocallyConstant_const_core (M : ModuleCat.{u} Λ) :
    EtaleSheaf.IsLocallyConstant_core J Λ ((EtaleSheaf.const_core J Λ).obj M) := sorry

/-- H0/torsion-local-systems (site-level core of
`AdicSpace.EtaleSheaf.IsLocallyConstant.pullback`): the inverse image along a morphism of sites
(a representably flat cover-preserving `G`) preserves local constancy. -/
theorem EtaleSheaf.IsLocallyConstant.pullback_core (G : C ⥤ D) [G.IsContinuous J K]
    [(G.sheafPushforwardContinuous (ModuleCat.{u} Λ) J K).IsRightAdjoint] [RepresentablyFlat G]
    (hG : CoverPreserving J K G) {F : EtaleSheaf_core J Λ}
    (hF : EtaleSheaf.IsLocallyConstant_core J Λ F) :
    EtaleSheaf.IsLocallyConstant_core K Λ ((EtaleSheaf.pullback_core J K Λ G).obj F) := sorry

/-- H0/torsion-local-systems (site-level core of
`AdicSpace.EtaleSheaf.IsLocallyConstant.restrict`): restriction to a slice site preserves local
constancy. -/
theorem EtaleSheaf.IsLocallyConstant.restrict_core (U : C)
    [HasSheafify (J.over U) (ModuleCat.{u} Λ)] {F : EtaleSheaf_core J Λ}
    (hF : EtaleSheaf.IsLocallyConstant_core J Λ F) :
    EtaleSheaf.IsLocallyConstant_core (J.over U) Λ ((EtaleSheaf.restrict_core J Λ U).obj F) :=
  sorry

/-- H0/torsion-local-systems (site-level core of `AdicSpace.EtaleSheaf.IsLocallyConstant.kernel`):
over a noetherian `Λ`, kernels of maps of locally constant sheaves of finite type are locally
constant of finite type (Berkovich, §4.4). -/
theorem EtaleSheaf.IsLocallyConstant.kernel_core [IsNoetherianRing Λ] {F G : EtaleSheaf_core J Λ}
    (φ : F ⟶ G) (hF : EtaleSheaf.IsLocallyConstant.ofFiniteType_core J Λ F)
    (hG : EtaleSheaf.IsLocallyConstant.ofFiniteType_core J Λ G) :
    EtaleSheaf.IsLocallyConstant.ofFiniteType_core J Λ (kernel φ) := sorry

/- Site-level core of `Spa(C, C⁺)`: if every covering sieve of the terminal object is maximal,
every locally constant sheaf is constant, with value its global sections. -/
-- test IsLocallyConstant.test_field_pair_constant (degenerate) [H0/torsion-local-systems]
example {T : C} (hT : IsTerminal T) (hloc : ∀ R ∈ J T, R = ⊤) (F : EtaleSheaf_core J Λ)
    (hF : EtaleSheaf.IsLocallyConstant_core J Λ F) :
    Nonempty (F ≅ (EtaleSheaf.const_core J Λ).obj ((EtaleSheaf.sections_core J Λ T).obj F)) :=
  sorry

/-! ## ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers (lemma) -/

-- AdicSpace.isLocallyConstant_iff_representable: not stated here; needs finite étale `X`-spaces
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.H1_equiv_torsors: not stated here; needs finite étale `G`-torsors over adic spaces
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site)

/-! ## ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves (definition) -/

-- AdicSpace.IsConstructibleSubset: not stated here; needs the underlying spaces of adic spaces
--   (supplier: AdicSpaces Layer 5); topological core `AdicSpace.IsConstructibleSubset_core`
-- AdicSpace.EtaleSheaf.IsConstructible: not stated here; needs the pseudo-adic sites of the
--   strata (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.ofIsLocallyConstant: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.refine: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.kernel: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.pullback: not stated here; needs qcqs morphisms of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.EtaleSheaf.IsConstructible.extendByZero: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.pushforward_finiteEtale: not stated here; needs finite
--   étale morphisms of adic spaces (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.EtaleSheaf.IsConstructible.stalk_fg: not stated here; needs geometric points
--   (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.EtaleSheaf.IsConstructible.colimit: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.DbConstructible: not stated here; needs `AdicSpace.EtaleSheaf.IsConstructible`
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- IsConstructible.test_localSystem: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site) [computation test]
-- IsConstructible.test_zero: not stated here; needs `AdicSpace.EtaleSheaf.IsConstructible`
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site) [degenerate test]
-- IsConstructible.test_extendByZero_disc: not stated here; needs the discs of radius `1/2` and
--   `1` as adic spaces (supplier: AdicSpaces Layer 5) [compatibility test]
-- IsConstructible.test_skyscraper: not stated here; needs the closed unit disc over `ℂ_p` as an
--   adic space (supplier: AdicSpaces Layer 5) [non-example test]
-- IsConstructible.test_filtered_colimit: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site) [characterisation test]

/-- H0/classical-constructible-sheaves (topological core of `AdicSpace.IsConstructibleSubset`):
the finite Boolean combinations of quasi-compact open subsets (Scholze, *Étale cohomology of
diamonds*, §20; Berkovich, Definition 4.4.2). -/
def IsConstructibleSubset_core {X : Type u} [TopologicalSpace X] (S : Set X) : Prop :=
  S ∈ BooleanSubalgebra.closure {U : Set X | IsOpen U ∧ IsCompact U}

/-- H0/classical-constructible-sheaves (supporting): on a spectral space, as `|X|` is for `X`
quasi-compact and quasi-separated, `AdicSpace.IsConstructibleSubset_core` is Mathlib's
`Topology.IsConstructible` (quasi-compact opens are the retrocompact ones). -/
theorem IsConstructibleSubset_core_iff {X : Type u} [TopologicalSpace X] [SpectralSpace X]
    (S : Set X) : IsConstructibleSubset_core S ↔ Topology.IsConstructible S := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability (lemma) -/

-- AdicSpace.EtaleSheaf.IsConstructible.tensor: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- The API items `.kernel`, `.pullback`, `.extendByZero`, `.pushforward_finiteEtale` and
--   `.stalk_fg` of H0/classical-constructible-sheaves are the content of this lemma.

/-! ## ClassicalAdicEtaleCohomology:H0/torsion-sheaf-colimit-of-constructible (lemma) -/

-- AdicSpace.etaleCohomology_filteredColimit: not stated here; needs
--   `AdicSpace.EtaleSheaf.IsConstructible` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site); the colimit statement is the API
--   item `AdicSpace.EtaleSheaf.IsConstructible.colimit`

/-! ## ClassicalAdicEtaleCohomology:H0/kummer-sequence (lemma) -/

-- AdicSpace.kummerSequence_exact: not stated here; needs `𝔾_m` on `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf); ring-level core
--   `AdicSpace.kummerSequence_exact_ring`
-- AdicSpace.hilbert90: not stated here; needs line bundles on adic spaces (supplier: AdicSpaces
--   Layer 5)

/-- H0/kummer-sequence (ring-level core of (a)): for `n` invertible in a ring `B` and a unit `b`,
`B[T]/(Tⁿ − b)` is étale over `B`, so `x ↦ xⁿ` on `𝔾_m` is surjective étale-locally (de Jong–van
der Put, §3.2, examples of sheaves, item 6; Berkovich, Proposition 4.1.7 (i)). -/
theorem kummerSequence_exact_ring (B : Type u) [CommRing B] (n : ℕ) (hn : IsUnit (n : B))
    (b : Bˣ) : Algebra.Etale B (AdjoinRoot (Polynomial.X ^ n - Polynomial.C (b : B))) := sorry

/-! ## ClassicalAdicEtaleCohomology:H0/tate-twists (construction) -/

-- AdicSpace.muN: not stated here; needs `𝔾_m` on `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf); site-level core `AdicSpace.muN_core`
-- AdicSpace.muN_apply: not stated here; needs `AdicSpace.muN` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf); site-level core `AdicSpace.muN_apply_core`
-- AdicSpace.muN.isLocallyConstant: not stated here; needs `AdicSpace.muN` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.muN.equivOfPrimitiveRoot: not stated here; needs `AdicSpace.muN` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.EtaleSheaf.twist: not stated here; needs `AdicSpace.muN` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf) and the tensor product of sheaves of modules
-- AdicSpace.EtaleSheaf.twistAdd: not stated here; needs `AdicSpace.EtaleSheaf.twist` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.EtaleSheaf.twist_pullback: not stated here; needs `AdicSpace.EtaleSheaf.twist`
--   (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.EtaleSheaf.twist_Rpushforward: not stated here; needs `AdicSpace.EtaleSheaf.twist`
--   (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.EtaleSheaf.stalk_muN: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.ZellOne: not stated here; needs `AdicSpace.LisseSheaf` and, for `ℤ̂_ℓ(1)`, `X_proét`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)
-- AdicSpace.muN_analytification: not stated here; needs the analytification morphism of étale
--   sites (supplier: AdicSpacesPartII:R4/analytification-etale-site)
-- muN_test_stalk: not stated here; needs geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points) [computation test]
-- twist_test_zero: not stated here; needs `AdicSpace.EtaleSheaf.twist` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf) [degenerate test]
-- twist_test_add: not stated here; needs `AdicSpace.EtaleSheaf.twist` (supplier:
--   AdicEtaleGeometry:A1/etale-structure-sheaf) [characterisation test]

/-- H0/tate-twists (site-level core of `AdicSpace.muN`): for a sheaf of commutative rings `𝒪` on a
site, the abelian sheaf `μ_n : U ↦ μ_n(𝒪(U))` (Mathlib `rootsOfUnity`, written additively), the
kernel of `x ↦ xⁿ` on `𝒪^×` (Scholze, *p-adic Hodge theory for rigid-analytic varieties*,
Proposition 6.7; de Jong–van der Put, §3.2, item 6). -/
def muN_core (O : Sheaf J CommRingCat.{u}) (n : ℕ) : Sheaf J AddCommGrpCat.{u} where
  obj :=
    { obj := fun U => AddCommGrpCat.of (Additive (rootsOfUnity n (O.obj.obj U)))
      map := fun f => AddCommGrpCat.ofHom
        (MonoidHom.toAdditive (restrictRootsOfUnity (O.obj.map f).hom n))
      map_id := sorry
      map_comp := sorry }
  property := sorry

/-- H0/tate-twists (site-level core of `AdicSpace.muN_apply`): `μ_n(U) = rootsOfUnity n (𝒪(U))`. -/
theorem muN_apply_core (O : Sheaf J CommRingCat.{u}) (n : ℕ) (U : C) :
    ((muN_core J O n).obj.obj (op U) : Type u) = Additive (rootsOfUnity n (O.obj.obj (op U))) :=
  sorry

-- test muN_test_rootsOfUnity (compatibility) [H0/tate-twists]
example (O : Sheaf J CommRingCat.{u}) (n : ℕ) (U : C) :
    ((muN_core J O n).obj.obj (op U) : Type u) = Additive (rootsOfUnity n (O.obj.obj (op U))) :=
  muN_apply_core J O n U

/- Ring-level core: in characteristic `p` the Kummer algebra `K[T]/(Tᵖ − a)` is never étale, so
`x ↦ xᵖ` on `𝔾_m` is not surjective étale-locally. -/
-- test kummer_test_char_p (non-example) [H0/tate-twists]
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p] (a : k) :
    ¬ Algebra.Etale k (AdjoinRoot (Polynomial.X ^ p - Polynomial.C a)) := sorry

end SiteCore

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H0/huber-tilde-limit (definition) -/

-- AdicSpace.IsTildeLimit: not stated here; needs cofiltered diagrams of analytic adic spaces
--   (supplier: AdicSpaces Layer 5); affinoid core `AdicSpace.IsTildeLimit_affinoid`
-- AdicSpace.IsTildeLimit.Homeomorph: not stated here; needs the underlying spaces of adic
--   spaces (supplier: AdicSpaces Layer 5); affinoid core
--   `AdicSpace.IsTildeLimit.Homeomorph_affinoid`
-- AdicSpace.IsTildeLimit.Dense: not stated here; needs the structure presheaf on affinoid opens
--   (supplier: AdicSpaces Layer 3); affinoid core (global density)
--   `AdicSpace.IsTildeLimit.Dense_affinoid`
-- AdicSpace.IsTildeLimit.homeomorph: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5); affinoid core the projection `AdicSpace.IsTildeLimit_affinoid.homeomorph`
-- AdicSpace.IsTildeLimit.dense: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5); affinoid core the projection `AdicSpace.IsTildeLimit_affinoid.dense`
-- AdicSpace.IsTildeLimit.mk: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5); affinoid core the constructor `AdicSpace.IsTildeLimit_affinoid.mk`
-- AdicSpace.IsTildeLimit.ofIso: not stated here; needs isomorphisms of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsTildeLimit.reindex: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5); affinoid core `AdicSpace.IsTildeLimit_affinoid.reindex`
-- AdicSpace.IsTildeLimit.const: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5); affinoid core `AdicSpace.IsTildeLimit_affinoid.const`
-- AdicSpace.IsTildeLimit.spectralSpace: not stated here; needs `AdicSpace.IsTildeLimit`
--   (supplier: AdicSpaces Layer 5); on affinoids `ValuationSpectrum.spa` is spectral by Tau
--   Ceti's instance
-- AdicSpace.IsTildeLimit.restrictRational: not stated here; needs rational open subspaces of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsTildeLimit.ofCompletedColimit: not stated here; needs `Spa` of sheafy pairs as adic
--   spaces (supplier: AdicSpaces Layer 4); affinoid core
--   `AdicSpace.isTildeLimit_of_completedColimit_affinoid`
-- PseudoAdicSpace.IsTildeLimit: not stated here; needs pseudo-adic spaces (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- IsTildeLimit.test_completed_colimit: not stated here; needs the Tate algebras `K⟨T^{1/pⁿ}⟩`
--   with their transition maps as Huber pairs (supplier: AdicSpaces Layer 5); its affinoid form
--   is an instance of `AdicSpace.isTildeLimit_of_completedColimit_affinoid` [computation test]
-- IsTildeLimit.test_not_categorical: not stated here; needs `K[ε]/(ε²)` as a Huber pair and
--   isomorphisms of adic spaces (supplier: AdicSpaces Layer 5) [non-example test]
-- IsTildeLimit.test_density_needed: not stated here; needs `ℂ_p` as a Tau Ceti Huber ring
--   (supplier: AdicSpaces Layer 5) [non-example test]
-- IsTildeLimit.test_topology_needed: not stated here; needs the closed unit disc and disjoint
--   unions of adic spaces (supplier: AdicSpaces Layer 5) [non-example test]
-- IsTildeLimit.test_huber_compat: not stated here; needs pseudo-adic spaces (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site) [compatibility test]

section AffinoidSystem

variable {ι : Type u} [Preorder ι] {A : ι → Type u} [∀ i, CommRing (A i)]
  [∀ i, TopologicalSpace (A i)] [∀ i, IsTopologicalRing (A i)] [∀ i, Huber.IsHuberRing (A i)]
  (S : ∀ i, Huber.Pair (A i)) (f : ∀ i j, i ≤ j → Huber.Pair.Hom (S i) (S j))
  {B : Type u} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Huber.IsHuberRing B]
  (T : Huber.Pair B) (g : ∀ i, Huber.Pair.Hom (S i) T)

namespace AdicSpace

/-- H0/huber-tilde-limit (affinoid core of `AdicSpace.IsTildeLimit.Homeomorph`, condition (a)):
for a directed system of Huber pairs `(Aᵢ, Aᵢ⁺)` with transition morphisms `f` and morphisms
`g i : (Aᵢ, Aᵢ⁺) → (B, B⁺)`, the map `v ↦ (Spa(g i) v)ᵢ` is a topological embedding of
`Spa(B, B⁺)` into `∏ᵢ Spa(Aᵢ, Aᵢ⁺)` onto the compatible families; that is,
`Spa(B, B⁺) → lim Spa(Aᵢ, Aᵢ⁺)` is a homeomorphism (Huber, Definition 2.4.2 (a);
Scholze–Weinstein, *Moduli of p-divisible groups*, Definition 2.4.1). -/
def IsTildeLimit.Homeomorph_affinoid : Prop :=
  Topology.IsEmbedding (fun (v : ValuationSpectrum.spa T.plus) (i : ι) => (g i).spaComap v) ∧
    Set.range (fun (v : ValuationSpectrum.spa T.plus) (i : ι) => (g i).spaComap v) =
      {x | ∀ i j (h : i ≤ j), (f i j h).spaComap (x j) = x i}

/-- H0/huber-tilde-limit (affinoid core of `AdicSpace.IsTildeLimit.Dense`, condition (b) with
`U = Spa(B, B⁺)`): the union of the images of the `Aᵢ` is dense in `B` (Huber, Definition 2.4.2
(b)). -/
def IsTildeLimit.Dense_affinoid : Prop :=
  Dense (⋃ i, Set.range (g i).toRingHom)

/-- H0/huber-tilde-limit (affinoid core of `AdicSpace.IsTildeLimit`): `Spa(B, B⁺)` is a
tilde-limit of the `Spa(Aᵢ, Aᵢ⁺)` with density holding globally; the topological and the density
conditions are independent and both required, and a tilde-limit is not a categorical limit
(Huber, Definition 2.4.2; Scholze–Weinstein, Definition 2.4.1 and §2.4). -/
structure IsTildeLimit_affinoid : Prop where
  /-- Condition (a): `Spa(B, B⁺) → lim Spa(Aᵢ, Aᵢ⁺)` is a homeomorphism. -/
  homeomorph : IsTildeLimit.Homeomorph_affinoid S f T g
  /-- Condition (b), globally: `⋃ᵢ gᵢ(Aᵢ)` is dense in `B`. -/
  dense : IsTildeLimit.Dense_affinoid S T g

/-- H0/huber-tilde-limit (affinoid core of `AdicSpace.IsTildeLimit.reindex`): a tilde-limit of a
directed system is a tilde-limit of every cofinal subsystem. -/
theorem IsTildeLimit_affinoid.reindex [IsDirected ι (· ≤ ·)]
    (hf : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
      (f j k hjk).comp (f i j hij) = f i k (hij.trans hjk))
    (hg : ∀ i j (h : i ≤ j), (g j).comp (f i j h) = g i)
    {κ : Type u} [Preorder κ] (φ : κ → ι) (hφ : Monotone φ) (hcof : ∀ i, ∃ k, i ≤ φ k)
    (h : IsTildeLimit_affinoid S f T g) :
    IsTildeLimit_affinoid (fun k => S (φ k)) (fun k l hkl => f (φ k) (φ l) (hφ hkl)) T
      (fun k => g (φ k)) := sorry

/-- H0/huber-tilde-limit (affinoid core of `AdicSpace.IsTildeLimit.const`): `Spa(B, B⁺)` is a
tilde-limit of the one-object system on itself. -/
theorem IsTildeLimit_affinoid.const :
    IsTildeLimit_affinoid (ι := PUnit.{u + 1}) (fun _ => T) (fun _ _ _ => Huber.Pair.Hom.id T) T
      (fun _ => Huber.Pair.Hom.id T) := sorry

end AdicSpace

-- test IsTildeLimit.test_const (degenerate) [H0/huber-tilde-limit]
example :
    AdicSpace.IsTildeLimit_affinoid (ι := PUnit.{u + 1}) (fun _ => T)
      (fun _ _ _ => Huber.Pair.Hom.id T) T (fun _ => Huber.Pair.Hom.id T) :=
  AdicSpace.IsTildeLimit_affinoid.const T

/-! ## ClassicalAdicEtaleCohomology:H0/spa-of-colimit-huber-pair (lemma) -/

namespace AdicSpace

/-- H0/spa-of-colimit-huber-pair (supporting): `(B, B⁺)` is the colimit of the directed system
`(Aᵢ, Aᵢ⁺)` with the colimit topology: `B = colim Aᵢ`, `B⁺ = colim Aᵢ⁺`, and `colim A_{i,0}` is
a ring of definition of `B` whose ideal of definition is generated by each `Iᵢ` (the transition
maps are adic) (Scholze–Weinstein, Proposition 2.4.2). -/
structure IsTildeLimit.IsColimitPair : Prop where
  /-- The transition morphisms compose. -/
  map_comp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
    (f j k hjk).comp (f i j hij) = f i k (hij.trans hjk)
  /-- The morphisms `g i` are compatible. -/
  comp_eq : ∀ i j (h : i ≤ j), (g j).comp (f i j h) = g i
  /-- `colim Aᵢ → B` is surjective. -/
  exists_eq : ∀ b : B, ∃ i, ∃ a : A i, (g i).toRingHom a = b
  /-- `colim Aᵢ → B` is injective. -/
  exists_map_eq_zero : ∀ i (a : A i), (g i).toRingHom a = 0 →
    ∃ j, ∃ h : i ≤ j, (f i j h).toRingHom a = 0
  /-- `B⁺ = colim Aᵢ⁺`. -/
  exists_plus : ∀ b ∈ T.plus, ∃ i, ∃ a ∈ (S i).plus, (g i).toRingHom a = b
  /-- `B₀ = colim A_{i,0}` is a ring of definition with ideal of definition `Iᵢ B₀`. -/
  exists_pairOfDefinition : ∃ (P : ∀ i, Huber.PairOfDefinition (A i))
    (Q : Huber.PairOfDefinition B)
    (hPQ : ∀ i, ∀ a ∈ (P i).ringOfDefinition, (g i).toRingHom a ∈ Q.ringOfDefinition),
    (∀ b ∈ Q.ringOfDefinition, ∃ i, ∃ a ∈ (P i).ringOfDefinition, (g i).toRingHom a = b) ∧
      ∀ i, Q.idealOfDefinition = (P i).idealOfDefinition.map
        ((g i).toRingHom.restrict (P i).ringOfDefinition Q.ringOfDefinition (hPQ i))

end AdicSpace

/-- H0/spa-of-colimit-huber-pair ((ii)–(iii)): for the colimit `(B, B⁺)` of a directed system of
Huber pairs with the colimit topology, `Spa(B, B⁺) → lim Spa(Aᵢ, Aᵢ⁺)` is a homeomorphism, and
every rational subset of `Spa(B, B⁺)` is the preimage of a rational subset of some
`Spa(Aᵢ, Aᵢ⁺)` (Scholze–Weinstein, Proposition 2.4.2 and its proof; Wedhorn, *Adic spaces*,
Theorem 7.10). -/
theorem Huber.Pair.spaColimit_homeomorph [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (h : AdicSpace.IsTildeLimit.IsColimitPair S f T g) :
    AdicSpace.IsTildeLimit.Homeomorph_affinoid S f T g ∧
      ∀ (T' : Finset B) (s : B), ∃ i, ∃ (Ti : Finset (A i)) (si : A i),
        ∀ v : ValuationSpectrum.spa T.plus,
          ((g i).spaComap v).1 ∈ ValuationSpectrum.rationalSubset (S i).plus Ti si ↔
            v.1 ∈ ValuationSpectrum.rationalSubset T.plus T' s := sorry

end AffinoidSystem

-- Huber.Pair.spa_completion_homeomorph: not stated here; needs the completed Huber pair
--   `(Â, Â⁺)` of a Huber pair (Tau Ceti has the completed Huber ring `IsHuberRing.completion` but
--   no completion of pairs) (supplier: AdicSpaces Layer 5); (iv)–(v) for a completed colimit are
--   contained in `AdicSpace.isTildeLimit_of_completedColimit_affinoid`
-- Huber.Pair.spa_tate_retopologise: not stated here; needs the `ϖ`-adically retopologised Huber
--   ring `A′` as a second topology on `A`, which Tau Ceti's instance-based Huber rings carry only
--   on a type synonym (supplier: AdicSpaces Layer 5); (vii) is the Tate criterion
--   `AdicSpace.isTildeLimit_of_colimitPresented_affinoid`

/-! ## ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion (theorem) -/

-- AdicSpace.isTildeLimit_of_completedColimit: not stated here; needs `Spa` of sheafy pairs as
--   adic spaces (supplier: AdicSpaces Layer 4); affinoid core
--   `AdicSpace.isTildeLimit_of_completedColimit_affinoid`
-- AdicSpace.isTildeLimit_of_colimitPresented: not stated here; needs `Spa` of sheafy pairs as
--   adic spaces (supplier: AdicSpaces Layer 4); affinoid core
--   `AdicSpace.isTildeLimit_of_colimitPresented_affinoid`
-- (3), the non-example showing that (T), resp. (P2), cannot be weakened to density and a
--   plus-ring condition, needs specific Huber pairs not in the libraries.

section CompleteAffinoidSystem

variable {ι : Type u} [Preorder ι] {A : ι → Type u} [∀ i, CommRing (A i)]
  [∀ i, TopologicalSpace (A i)] [∀ i, IsTopologicalRing (A i)] [∀ i, Huber.IsHuberRing (A i)]
  (S : ∀ i, Huber.Pair (A i)) (f : ∀ i j, i ≤ j → Huber.Pair.Hom (S i) (S j))
  {B : Type u} [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
  [Huber.IsHuberRing B] [CompleteSpace B] [T2Space B]
  (T : Huber.Pair B) (g : ∀ i, Huber.Pair.Hom (S i) T)

namespace AdicSpace

/-- H0/huber-tilde-limit-affinoid-criterion (supporting, conditions (T), (D), (P) of (1)): the
complete Huber pair `(B, B⁺)` is the completed colimit of the directed system `(Aᵢ, Aᵢ⁺)`: the
`Aᵢ` have dense image, `B⁺` is the closure of the image of `colim Aᵢ⁺`, and the closure of the
image of `colim A_{i,0}` is a ring of definition with ideal of definition generated by each `Iᵢ`
(Scholze–Weinstein, Proposition 2.4.2). -/
structure IsTildeLimit.IsCompletedColimit : Prop where
  /-- The transition morphisms compose. -/
  map_comp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
    (f j k hjk).comp (f i j hij) = f i k (hij.trans hjk)
  /-- The morphisms `g i` are compatible. -/
  comp_eq : ∀ i j (h : i ≤ j), (g j).comp (f i j h) = g i
  /-- (D): `colim Aᵢ → B` has dense image. -/
  dense : Dense (⋃ i, Set.range (g i).toRingHom)
  /-- (P): `B⁺` is the closure of the image of `colim Aᵢ⁺`. -/
  plus_eq_closure : (T.plus : Set B) = closure (⋃ i, (g i).toRingHom '' (S i).plus)
  /-- (T): the closure of the image of `colim A_{i,0}` is a ring of definition with ideal of
  definition generated by the image of each `Iᵢ`. -/
  exists_pairOfDefinition : ∃ (P : ∀ i, Huber.PairOfDefinition (A i))
    (Q : Huber.PairOfDefinition B)
    (hPQ : ∀ i, ∀ a ∈ (P i).ringOfDefinition, (g i).toRingHom a ∈ Q.ringOfDefinition),
    (Q.ringOfDefinition : Set B) = closure (⋃ i, (g i).toRingHom '' (P i).ringOfDefinition) ∧
      ∀ i, Q.idealOfDefinition = (P i).idealOfDefinition.map
        ((g i).toRingHom.restrict (P i).ringOfDefinition Q.ringOfDefinition (hPQ i))

/-- H0/huber-tilde-limit-affinoid-criterion (supporting, condition (P2) of (2)): `Spa(B, B⁺)` is
colimit-presented by the Tate system `(Aᵢ, Aᵢ⁺)` with compatible pseudouniformisers `ϖᵢ ↦ ϖ`:
`L⁺/ϖⁿL⁺ → B⁺/ϖⁿB⁺` is bijective for every `n`, where `L⁺ = colim Aᵢ⁺` (Scholze–Weinstein,
§2.4). -/
structure IsTildeLimit.IsColimitPresented (ϖ : ∀ i, A i) (ϖB : B) : Prop where
  /-- The transition morphisms compose. -/
  map_comp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
    (f j k hjk).comp (f i j hij) = f i k (hij.trans hjk)
  /-- The morphisms `g i` are compatible. -/
  comp_eq : ∀ i j (h : i ≤ j), (g j).comp (f i j h) = g i
  /-- Each `ϖᵢ` is a pseudouniformiser, so each `Aᵢ` is Tate. -/
  isPseudoUniformizer : ∀ i, Huber.IsPseudoUniformizer (ϖ i)
  /-- The pseudouniformisers are compatible with the transition morphisms. -/
  map_pseudoUniformizer : ∀ i j (h : i ≤ j), (f i j h).toRingHom (ϖ i) = ϖ j
  /-- The pseudouniformisers map to `ϖ` in `B`. -/
  map_pseudoUniformizer_eq : ∀ i, (g i).toRingHom (ϖ i) = ϖB
  /-- `L⁺/ϖⁿL⁺ → B⁺/ϖⁿB⁺` is surjective. -/
  exists_add_mul : ∀ (n : ℕ), ∀ b ∈ T.plus, ∃ i, ∃ a ∈ (S i).plus, ∃ c ∈ T.plus,
    b = (g i).toRingHom a + ϖB ^ n * c
  /-- `L⁺/ϖⁿL⁺ → B⁺/ϖⁿB⁺` is injective. -/
  exists_eq_mul : ∀ (n : ℕ) (i : ι), ∀ a ∈ (S i).plus,
    (∃ c ∈ T.plus, (g i).toRingHom a = ϖB ^ n * c) →
      ∃ j, ∃ h : i ≤ j, ∃ a' ∈ (S j).plus, (f i j h).toRingHom a = ϖ j ^ n * a'

/-- H0/huber-tilde-limit-affinoid-criterion (affinoid core of (1)): the completed colimit of a
directed system of Huber pairs is a tilde-limit of it, with density holding globally
(Scholze–Weinstein, Proposition 2.4.2; Huber, Definition 2.4.2). -/
theorem isTildeLimit_of_completedColimit_affinoid [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (h : IsTildeLimit.IsCompletedColimit S f T g) : IsTildeLimit_affinoid S f T g := sorry

/-- H0/huber-tilde-limit-affinoid-criterion (affinoid core of (2)): a complete Tate pair that is
colimit-presented by a directed Tate system is a tilde-limit of it, with density holding
globally (Scholze–Weinstein, §2.4). -/
theorem isTildeLimit_of_colimitPresented_affinoid [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (ϖ : ∀ i, A i) (ϖB : B) (h : IsTildeLimit.IsColimitPresented S f T g ϖ ϖB) :
    IsTildeLimit_affinoid S f T g := sorry

end AdicSpace

end CompleteAffinoidSystem

/-! ## ClassicalAdicEtaleCohomology:H0/tilde-limit-density-rational-restriction (lemma) -/

-- AdicSpace.dense_rationalRestriction: not stated here; needs the structure presheaf on
--   rational subsets of adic spaces (supplier: AdicSpaces Layer 3)
-- AdicSpace.IsTildeLimit.restrictRational_affinoid: not stated here; needs the rational
--   localisations `A⟨T/s⟩` of a directed system as a directed system of Huber pairs (supplier:
--   AdicSpaces Layer 3)

/-! ## ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit (lemma) -/

-- AdicSpace.strictLocalization_isTildeLimit: not stated here; needs geometric points and strict
--   localisations (supplier: AdicEtaleGeometry:A1/strict-localisation); the affinoid form is an
--   instance of `AdicSpace.isTildeLimit_of_colimitPresented_affinoid`

/-! ## ClassicalAdicEtaleCohomology:H0/tilde-limit-base-change (lemma) -/

-- AdicSpace.IsColimitPresented.baseChange: not stated here; needs the directed system of
--   completed tensor products `B ⊗̂_{A_{i₀}} Aᵢ` (supplier:
--   AdicSpacesPartII:R0/completed-tensor-product) and fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit (lemma) -/

-- AdicSpace.etaleSite_tildeLimit_colimit: not stated here; needs the sites of quasi-compact
--   quasi-separated étale `X`-spaces (supplier: AdicEtaleGeometry:A1/etale-site)

/-! ## ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity (theorem) -/

-- AdicSpace.cohomology_tildeLimit: not stated here; needs `AdicSpace.IsTildeLimit` (supplier:
--   AdicSpaces Layer 5) and `AdicSpace.etaleCohomology` (supplier:
--   AdicEtaleGeometry:A1/etale-site)

/-! ## ClassicalAdicEtaleCohomology:H0/stalk-of-higher-direct-image-as-colimit (lemma) -/

-- AdicSpace.stalk_higherDirectImage_colimit: not stated here; needs geometric points and their
--   étale neighbourhoods (supplier: AdicEtaleGeometry:A1/strict-localisation); site-level core
--   `AdicSpace.stalk_higherDirectImage_colimit_core`

namespace AdicSpace

section SiteCoreStalk

variable {C : Type u} [SmallCategory C] (J : GrothendieckTopology C)
  {D : Type u} [SmallCategory D] (K : GrothendieckTopology D)

/-- H0/stalk-of-higher-direct-image-as-colimit (site-level core): for a continuous functor `G` and
a point `Φ` of `(C, J)`, the stalk of `R^q G_* F` at `Φ` is the colimit over the neighbourhoods of
`Φ` (Mathlib `GrothendieckTopology.Point.presheafFiber`, a colimit over `Φ.fiber.Elementsᵒᵖ`) of
`H^q(G(U), F)` (de Jong–van der Put, Theorem 3.7.3; Scholze, *p-adic Hodge theory for
rigid-analytic varieties*, proof of Corollary 3.17). -/
def stalk_higherDirectImage_colimit_core (G : C ⥤ D) [G.IsContinuous J K]
    (Φ : GrothendieckTopology.Point.{u} J) (F : Sheaf K AddCommGrpCat.{u}) (q : ℕ) :
    Φ.sheafFiber.obj (((G.sheafPushforwardContinuous AddCommGrpCat.{u} J K).rightDerived q).obj F) ≅
      Φ.presheafFiber.obj (G.op ⋙ F.cohomologyPresheaf q) := sorry

end SiteCoreStalk

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation (theorem) -/

-- AdicSpace.stalkFormula: not stated here; needs strict localisations and fibre products of adic
--   spaces (supplier: ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit,
--   AdicSpacesPartII:R0/fibre-products-existence)

end TauCeti

end

/-! # Stage H1h. Henselian pairs, henselian f-adic rings, henselisations and Huber's §3.2
comparisons

The ring-level part of the stage is stated with library carriers: henselian pairs are Mathlib's
`HenselianRing A I`; Huber rings, pairs of definition, Huber pairs, `A°`, `A°°`, `Spa` and
rational subsets are Tau Ceti's. The henselisation of a Huber ring (`Huber.Henselization`), of
a rational localisation (`Huber.Pair.rationalHenselization`) and along a pro-special subset
(`Huber.Pair.proSpecialHenselization`) have `sorry` carriers and real universal properties.
Pseudo-adic spaces over schemes, the comparison morphism `γ` of Huber 1996, 3.2.12 and the
cohomological comparison theorems live on the anchor's adic spaces and on
ClassicalAdicEtaleCohomology:H0's pseudo-adic étale sites, and are not-stated comments naming
their supplier; their scheme-level and ring-level cores are stated under suffixed names. -/

noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter

universe u

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations (lemma) -/

namespace HenselianRing

section Characterisations

variable {A : Type u} [CommRing A]

/-- H1:henselian/henselian-pair-characterisations (supporting): the reduction `e ↦ e mod IB` of
idempotents of an `A`-algebra `B`, whose bijectivity is characterisations (4) and (5) of Stacks
Tag 09XI (Lemma 15.11.6). -/
def idempotentReduction (I : Ideal A) (B : Type*) [CommRing B] [Algebra A B] :
    {e : B // IsIdempotentElem e} → {e : B ⧸ I.map (algebraMap A B) // IsIdempotentElem e} :=
  fun e ↦ ⟨Ideal.Quotient.mk _ e.1, e.2.map (Ideal.Quotient.mk (I.map (algebraMap A B)))⟩

/-- H1:henselian/henselian-pair-characterisations: the equivalent characterisations of a
henselian pair `(A, I)` (Stacks Tag 09XI, Lemma 15.11.6, and Definition 15.11.1): (1) Mathlib's
`HenselianRing A I`; (2) `I ⊆ rad A` and coprime monic factorisations modulo `I` lift; (3)
sections over `A ⧸ I` of étale `A`-algebras lift; (4) for finite and (5) for integral
`A`-algebras `B`, `B → B ⧸ IB` is bijective on idempotents; (6) Gabber's criterion: `I ⊆ rad A`
and every `Tⁿ(T - 1) + aₙTⁿ + ⋯ + a₀` with all `aᵢ ∈ I`, `n ≥ 1`, has a unique root in `1 + I`. -/
theorem tfae (I : Ideal A) : List.TFAE
    [HenselianRing A I,
      I ≤ (⊥ : Ideal A).jacobson ∧ ∀ f : Polynomial A, f.Monic → ∀ g₀ h₀ : Polynomial (A ⧸ I),
        g₀.Monic → h₀.Monic → IsCoprime g₀ h₀ → f.map (Ideal.Quotient.mk I) = g₀ * h₀ →
        ∃ g h : Polynomial A, g.Monic ∧ h.Monic ∧ f = g * h ∧
          g.map (Ideal.Quotient.mk I) = g₀ ∧ h.map (Ideal.Quotient.mk I) = h₀,
      ∀ (A' : Type u) [CommRing A'] [Algebra A A'] [Algebra.Etale A A']
        (σ : A' →ₐ[A] A ⧸ I), ∃ τ : A' →ₐ[A] A, (Ideal.Quotient.mkₐ A I).comp τ = σ,
      ∀ (B : Type u) [CommRing B] [Algebra A B] [Module.Finite A B],
        Function.Bijective (idempotentReduction I B),
      ∀ (B : Type u) [CommRing B] [Algebra A B] [Algebra.IsIntegral A B],
        Function.Bijective (idempotentReduction I B),
      I ≤ (⊥ : Ideal A).jacobson ∧ ∀ (n : ℕ) (a : Fin (n + 1) → A), 1 ≤ n → (∀ i, a i ∈ I) →
        ∃! α : A, α - 1 ∈ I ∧ α ^ n * (α - 1) + ∑ i, a i * α ^ (i : ℕ) = 0] := sorry

/-- H1:henselian/henselian-pair-characterisations (direction (1) ⇒ (3), Stacks Tag 09XI): along
a henselian pair, `A ⧸ I`-points of étale `A`-algebras lift to `A`-points. -/
theorem lift_of_etale (I : Ideal A) [HenselianRing A I] (A' : Type*) [CommRing A']
    [Algebra A A'] [Algebra.Etale A A'] (σ : A' →ₐ[A] A ⧸ I) :
    ∃ τ : A' →ₐ[A] A, (Ideal.Quotient.mkₐ A I).comp τ = σ := sorry

/-- H1:henselian/henselian-pair-characterisations (direction (1) ⇒ (4), Stacks Tag 09XI): along
a henselian pair, reduction is bijective on idempotents of every finite `A`-algebra. -/
theorem idempotent_bijective_of_finite (I : Ideal A) [HenselianRing A I] (B : Type*)
    [CommRing B] [Algebra A B] [Module.Finite A B] :
    Function.Bijective (idempotentReduction I B) := sorry

/-- H1:henselian/henselian-pair-characterisations (direction (6) ⇒ (1), Gabber; Stacks Tag
09XI): Gabber's criterion, with existence of the roots only, makes `(A, I)` henselian. -/
theorem of_gabber (I : Ideal A) (hI : I ≤ (⊥ : Ideal A).jacobson)
    (h : ∀ (n : ℕ) (a : Fin (n + 1) → A), 1 ≤ n → (∀ i, a i ∈ I) →
      ∃ α : A, α - 1 ∈ I ∧ α ^ n * (α - 1) + ∑ i, a i * α ^ (i : ℕ) = 0) :
    HenselianRing A I := sorry

end Characterisations

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-radical-invariance (lemma) -/

/-- H1:henselian/henselian-pair-radical-invariance: whether `(A, I)` is henselian depends only on
the radical of `I`, that is on `V(I)` (Stacks Tag 09XJ, Lemma 15.11.7). -/
theorem iff_of_radical_eq {A : Type u} [CommRing A] {I J : Ideal A}
    (h : I.radical = J.radical) : HenselianRing A I ↔ HenselianRing A J := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-shared-ideal-invariance (lemma) -/

/-- H1:henselian/henselian-pair-shared-ideal-invariance: whether `(A, I)` is henselian depends
only on `I` as a non-unital ring: a ring map `φ` restricting to a bijection `I → I'` gives
`HenselianRing A I ↔ HenselianRing A' I'` (Gabber–Ramero, Remark 5.1.9(ii); Bhatt, proof of
Lemma 7.2.3). -/
theorem iff_of_bijOn_ideal {A A' : Type u} [CommRing A] [CommRing A'] (φ : A →+* A')
    (I : Ideal A) (I' : Ideal A') (h : Set.BijOn φ (I : Set A) (I' : Set A')) :
    HenselianRing A I ↔ HenselianRing A' I' := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-universal-homeomorphism-invariance (lemma) -/

/-- H1:henselian/henselian-pair-universal-homeomorphism-invariance: if `Spec φ` is a universal
homeomorphism (integral, universally injective and surjective, Stacks Tag 04DF), then
`HenselianRing B I ↔ HenselianRing R (I·R)` (Bhatt, proof of Lemma 7.2.3(3); topological
invariance of the étale site, Stacks Tag 04DZ). -/
theorem iff_of_isUniversalHomeomorph {B R : Type u} [CommRing B] [CommRing R] (φ : B →+* R)
    (hint : AlgebraicGeometry.IsIntegralHom
      (AlgebraicGeometry.Spec.map (CommRingCat.ofHom φ)))
    (hinj : AlgebraicGeometry.UniversallyInjective
      (AlgebraicGeometry.Spec.map (CommRingCat.ofHom φ)))
    (hsurj : AlgebraicGeometry.Surjective (AlgebraicGeometry.Spec.map (CommRingCat.ofHom φ)))
    (I : Ideal B) : HenselianRing B I ↔ HenselianRing R (I.map φ) := sorry

end HenselianRing

namespace Huber

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring-independence (lemma) -/

section Independence

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-ring-independence (supporting): a *henselian datum* of a Huber
ring `A` (Huber 1996, Lemma 3.1.1): an open subring `B ⊆ A°` together with an ideal `I` of `B`
that is open in `A` and consists of topologically nilpotent elements (`I ⊆ A°°`). -/
structure IsHenselian.Datum where
  /-- The open subring `B ⊆ A°`. -/
  B : Subring A
  /-- `B` is open in `A`. -/
  isOpen_B : IsOpen (B : Set A)
  /-- `B` consists of power-bounded elements. -/
  le_powerBoundedSubring : B ≤ powerBoundedSubring A
  /-- The ideal `I` of `B`. -/
  I : Ideal B
  /-- `I` is open in `A`. -/
  isOpen_I : IsOpen (Subtype.val '' (I : Set B))
  /-- `I ⊆ A°°`. -/
  isTopologicallyNilpotent : ∀ x ∈ I, IsTopologicallyNilpotent (x : A)

variable {A}

/-- H1:henselian/henselian-f-adic-ring-independence (a): for a henselian datum `(B, I)`,
`HenselianRing B I ↔ HenselianRing B (B ∩ A°°)` (Huber 1996, Lemma 3.1.1; the radicals of the two
ideals agree, H1:henselian/henselian-pair-radical-invariance). -/
theorem henselianRing_iff_comap_topologicallyNilpotentIdeal (d : IsHenselian.Datum A) :
    HenselianRing d.B d.I ↔ HenselianRing d.B
      ((topologicallyNilpotentIdeal A).comap (Subring.inclusion d.le_powerBoundedSubring)) :=
  sorry

/-- H1:henselian/henselian-f-adic-ring-independence: whether a henselian datum of a Huber ring is
a henselian pair does not depend on the datum (Huber 1996, Lemma 3.1.1, equivalence of
(i)–(iv)); no completeness, noetherian or Tate hypothesis enters. -/
theorem henselianRing_iff_of_isOpen (d d' : IsHenselian.Datum A) :
    HenselianRing d.B d.I ↔ HenselianRing d'.B d'.I := sorry

end Independence

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/ring-of-definition-adically-complete (lemma) -/

section Complete

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [CompleteSpace A] [T2Space A]

/-- H1:henselian/ring-of-definition-adically-complete: a ring of definition `A₀` of a complete
Hausdorff Huber ring is `J`-adically complete in Mathlib's algebraic sense, for its ideal of
definition `J` (Wedhorn, proof of Lemma 7.45; Bhatt, Lemma 7.2.3(4)). -/
theorem PairOfDefinition.isAdicComplete (P : PairOfDefinition A) :
    IsAdicComplete P.idealOfDefinition P.ringOfDefinition := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian (theorem) -/

variable [IsHuberRing A]

/-- H1:henselian/complete-f-adic-ring-is-henselian: every henselian datum `(B, I)` of a complete
Hausdorff Huber ring is a henselian pair (Bhatt, proof of Lemma 7.2.3(5); Stacks Tag 0ALJ for the
adically complete rings of definition, H1:henselian/ring-of-definition-adically-complete). -/
theorem henselianRing_of_completeSpace (d : IsHenselian.Datum A) : HenselianRing d.B d.I :=
  sorry

/-- H1:henselian/complete-f-adic-ring-is-henselian (plus rings): for a complete Huber pair,
`(A⁺, A⁺ ∩ A°°)` is a henselian pair. -/
theorem henselianRing_plus_of_completeSpace (P : Pair A) :
    HenselianRing P.plus ((topologicallyNilpotentIdeal A).comap
      (Subring.inclusion P.isRingOfIntegralElements.le_powerBoundedSubring)) := sorry

end Complete

section CompleteTate

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [CompleteSpace A] [T2Space A] [IsTateRing A]

/-- H1:henselian/complete-f-adic-ring-is-henselian (Tate case): for a complete Tate ring and a
pseudo-uniformiser `ϖ`, `(A°, ϖA°)` is a henselian pair (Bhatt, Lemma 7.2.3). -/
theorem henselianRing_span_of_isPseudoUniformizer {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) (hmem : ϖ ∈ powerBoundedSubring A) :
    HenselianRing (powerBoundedSubring A) (Ideal.span {⟨ϖ, hmem⟩}) := sorry

end CompleteTate

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring (definition) -/

section Definition

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-ring (structure): a Huber ring `A` is *henselian* if `(A°, A°°)`
is a henselian pair (Huber 1996, Definition 3.1.2); by
H1:henselian/henselian-f-adic-ring-independence equivalently some, or every, henselian datum is a
henselian pair. Completeness is not assumed. -/
class IsHenselian : Prop where
  /-- `(A°, A°°)` is a henselian pair. -/
  henselianRing_powerBoundedSubring :
    HenselianRing (powerBoundedSubring A) (topologicallyNilpotentIdeal A)

variable {A}

/-- H1:henselian/henselian-f-adic-ring (characterisation): in a henselian Huber ring every
henselian datum `(B, I)` is a henselian pair (Huber 1996, 3.1.1–3.1.2). -/
theorem IsHenselian.henselianRing [IsHenselian A] (d : IsHenselian.Datum A) :
    HenselianRing d.B d.I := sorry

/-- H1:henselian/henselian-f-adic-ring (constructor): one henselian datum that is a henselian pair
makes `A` henselian (Huber 1996, Lemma 3.1.1). -/
theorem IsHenselian.of_henselianRing (d : IsHenselian.Datum A) (h : HenselianRing d.B d.I) :
    IsHenselian A := sorry

/-- H1:henselian/henselian-f-adic-ring (instance): a discrete ring is henselian: `A° = A` (Tau
Ceti `powerBoundedSubring_eq_top`) and `A°°` is the nilradical (Stacks Tag 0ALI). -/
instance (priority := 100) IsHenselian.of_discreteTopology [DiscreteTopology A] :
    IsHenselian A := sorry

/-- H1:henselian/henselian-f-adic-ring (functoriality): an open subring of a henselian Huber ring,
with the subspace topology, is henselian. -/
theorem IsHenselian.of_isOpen_subring [IsHenselian A] (C : Subring A) (_hC : IsOpen (C : Set A))
    [IsHuberRing C] : IsHenselian C := sorry

/-- H1:henselian/henselian-f-adic-ring (functoriality): henselianity transports along ring
isomorphisms that are homeomorphisms (Tau Ceti `powerBoundedSubringEquiv`). -/
theorem IsHenselian.of_ringEquiv {B : Type*} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsHuberRing B] (e : A ≃+* B) (he : Continuous e)
    (he' : Continuous e.symm) [IsHenselian A] : IsHenselian B := sorry

/-- H1:henselian/henselian-f-adic-ring (structure): a Huber pair `(A, A⁺)` is *henselian* if its
underlying Huber ring is (Huber 1996, Definition 3.1.2); the plus ring plays no role. -/
class Pair.IsHenselian (P : Pair A) : Prop where
  /-- The underlying Huber ring is henselian. -/
  isHenselian : Huber.IsHenselian A

/-- H1:henselian/henselian-f-adic-ring (supporting): for a henselian Huber pair,
`(A⁺, A⁺ ∩ A°°)` is a henselian pair. -/
theorem Pair.IsHenselian.henselianRing_plus (P : Pair A) [P.IsHenselian] :
    HenselianRing P.plus ((topologicallyNilpotentIdeal A).comap
      (Subring.inclusion P.isRingOfIntegralElements.le_powerBoundedSubring)) := sorry

end Definition

/-- H1:henselian/henselian-f-adic-ring (compatibility): for a Tate ring, `IsHenselian` is
PerfectoidSpaces:P3's `Huber.IsTopologicallyHenselian` (henselian-pairs-colimits-and-completions
(c), Bhatt Lemma 7.2.3), whose body is the right-hand side: `(A₀, ϖA₀)` is a henselian pair for
every ring of definition `A₀` and pseudo-uniformiser `ϖ ∈ A₀`. -/
theorem IsHenselian.iff_isTopologicallyHenselian {A : Type u} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] :
    IsHenselian A ↔ ∀ (D : PairOfDefinition A) (ϖ : A) (h : ϖ ∈ D.ringOfDefinition),
      IsPseudoUniformizer ϖ → HenselianRing D.ringOfDefinition (Ideal.span {⟨ϖ, h⟩}) := sorry

/-- H1:henselian/henselian-f-adic-ring (instance): a complete Hausdorff Huber ring is henselian
(H1:henselian/complete-f-adic-ring-is-henselian). -/
instance (priority := 100) IsHenselian.of_completeSpace {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] :
    IsHenselian A := sorry

-- test IsHenselian_test_padic (computation) [H1:henselian/henselian-f-adic-ring]
example (p : ℕ) [Fact p.Prime] :
    IsHenselian ℚ_[p] ∧ IsHenselian (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
      HenselianRing (powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
        (Ideal.span {(p : powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))}) :=
  sorry

-- test IsHenselian_test_discrete (degenerate) [H1:henselian/henselian-f-adic-ring]
example {A : Type u} [CommRing A] [TopologicalSpace A] [DiscreteTopology A]
    [IsTopologicalRing A] : IsHenselian A ∧ powerBoundedSubring A = ⊤ := sorry

/- `ℚ` with the `3`-adic topology: `ℚ° = ℤ_(3)`, `ℚ°° = 3ℤ_(3)`, and `X² - 7` has the simple
root `1` modulo `3` but no root in `ℤ_(3)`. -/
-- test IsHenselian_test_rational_three_adic (non-example) [H1:henselian/henselian-f-adic-ring]
example [Fact (Nat.Prime 3)] :
    letI : TopologicalSpace ℚ := TopologicalSpace.induced ((↑) : ℚ → ℚ_[3]) inferInstance
    ∃ (_ : IsTopologicalRing ℚ) (_ : IsHuberRing ℚ), ¬ IsHenselian ℚ := sorry

/- The algebraic `p`-adic numbers `ℚ_p ∩ ℚ̄`, the relative algebraic closure of `ℚ` in `ℚ_p`
with the subspace topology: henselian but not complete. -/
-- test IsHenselian_test_algebraic_padic (characterisation) [H1:henselian/henselian-f-adic-ring]
example (p : ℕ) [Fact p.Prime] :
    ∃ _ : IsHuberRing (integralClosure ℚ ℚ_[p]).toSubring,
      IsHenselian (integralClosure ℚ ℚ_[p]).toSubring ∧
        ¬ CompleteSpace (integralClosure ℚ ℚ_[p]).toSubring := sorry

-- test IsHenselian_test_tate_compat (compatibility) [H1:henselian/henselian-f-adic-ring]
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A] :
    IsHenselian A ↔ ∀ (D : PairOfDefinition A) (ϖ : A) (h : ϖ ∈ D.ringOfDefinition),
      IsPseudoUniformizer ϖ → HenselianRing D.ringOfDefinition (Ideal.span {⟨ϖ, h⟩}) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-affinoid-unit-criterion (lemma) -/

section UnitCriterion

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [IsHenselian A]

/-- H1:henselian/henselian-affinoid-unit-criterion (a): in a henselian Huber ring `1 + A°° ⊆ A^×`
(Huber 1996, 3.1; `A°°` lies in the Jacobson radical of `A°`). -/
theorem IsHenselian.isUnit_one_add {a : A} (ha : IsTopologicallyNilpotent a) :
    IsUnit (1 + a) := sorry

/-- H1:henselian/henselian-affinoid-unit-criterion (a): the unit group of a henselian Huber ring
is open. -/
theorem IsHenselian.isOpen_setOf_isUnit : IsOpen {a : A | IsUnit a} := sorry

/-- H1:henselian/henselian-affinoid-unit-criterion (b): every maximal ideal of a henselian Huber
ring is closed. -/
theorem IsHenselian.isClosed_of_isMaximal (m : Ideal A) [m.IsMaximal] : IsClosed (m : Set A) :=
  sorry

/-- H1:henselian/henselian-affinoid-unit-criterion (c): every proper ideal of a henselian Huber
ring lies in the support of a point of `Spa(A, A⁺)` (Huber 1996, 3.1; completeness is not
assumed). -/
theorem IsHenselian.exists_mem_spa_le_supp (P : Pair A) {J : Ideal A} (hJ : J ≠ ⊤) :
    ∃ v ∈ ValuationSpectrum.spa P.plus, J ≤ v.supp := sorry

/-- H1:henselian/henselian-affinoid-unit-criterion (c): in a henselian Huber ring, `f` is a unit
iff it lies in the support of no point of `Spa(A, A⁺)`. -/
theorem IsHenselian.isUnit_iff_forall_mem_spa_notMem_supp (P : Pair A) (f : A) :
    IsUnit f ↔ ∀ v ∈ ValuationSpectrum.spa P.plus, f ∉ v.supp := sorry

end UnitCriterion

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization (construction) -/

/-- H1:henselian/henselian-f-adic-rings-and-henselization (constructor): the *henselization*
`A^h := A ⊗_D D^h` of a Huber ring `A` (Huber 1996, Lemma 3.1.3), for a pair of definition
`(D, I)` and the henselization `(D^h, ID^h)` of the pair `(D, I)`
(PerfectoidSpaces:P3/henselisation-of-pairs), topologised so that the image of `D^h` is a ring of
definition with ideal of definition `I·D^h`. By `Henselization.lift` and `Henselization.hom_ext`
it does not depend on `(D, I)` up to unique isomorphism. No noetherian or completeness
hypothesis. -/
def Henselization (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [IsHuberRing A] : Type u := sorry

namespace Henselization

section Basic

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): the ring `A^h`. -/
instance instCommRing : CommRing (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): the canonical uniformity
of the Huber topology of `A^h`, with neighbourhood basis `{IⁿD^h}` of `0`. -/
instance instUniformSpace : UniformSpace (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `A^h` is a uniform
additive group. -/
instance instIsUniformAddGroup : IsUniformAddGroup (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `A^h` is a topological
ring. -/
instance instIsTopologicalRing : IsTopologicalRing (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (instance): `A^h` is a Huber ring, with
ring of definition the image of `D^h` and ideal of definition `I·D^h` (Huber 1996, 3.1.3(i)). -/
instance isHuberRing : IsHuberRing (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (instance): `A^h` is henselian (Huber
1996, 3.1.3(i)). -/
instance isHenselian : IsHenselian (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (data): the canonical map
`ι : A → A^h`. -/
def of : A →+* Henselization A := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `ι` is continuous. -/
theorem continuous_of : Continuous (of A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `ι` is adic (the
AdicSpacesPartII:R0 stand-in `IsAdicHom`). -/
instance isAdicHom_of : IsAdicHom (of A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (characterisation): `ι` is bijective
iff `A` is henselian (Huber 1996, 3.1.3(iv)). -/
theorem of_bijective_iff : Function.Bijective (of A) ↔ IsHenselian A := sorry

end Basic

section Lift

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [IsHenselian B]

/-- H1:henselian/henselian-f-adic-rings-and-henselization (universal-property): a continuous
`φ : A → B` into a henselian Huber ring extends to `ψ : A^h → B` (Huber 1996, 3.1.3(ii)). -/
def lift (φ : A →+* B) (_hφ : Continuous φ) : Henselization A →+* B := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `lift φ` is
continuous. -/
theorem continuous_lift (φ : A →+* B) (hφ : Continuous φ) : Continuous (lift φ hφ) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (universal-property):
`lift φ ∘ ι = φ`. -/
theorem lift_comp_of (φ : A →+* B) (hφ : Continuous φ) : (lift φ hφ).comp (of A) = φ := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (extensionality): two continuous maps
`A^h → B` into a henselian Huber ring agreeing on `A` are equal (Huber 1996, 3.1.3(ii)). -/
theorem hom_ext {ψ₁ ψ₂ : Henselization A →+* B} (h₁ : Continuous ψ₁) (h₂ : Continuous ψ₂)
    (h : ψ₁.comp (of A) = ψ₂.comp (of A)) : ψ₁ = ψ₂ := sorry

end Lift

section Map

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  {A' A'' : Type*} [CommRing A'] [TopologicalSpace A'] [IsTopologicalRing A'] [IsHuberRing A']
  [CommRing A''] [TopologicalSpace A''] [IsTopologicalRing A''] [IsHuberRing A'']

/-- H1:henselian/henselian-f-adic-rings-and-henselization (functoriality): a continuous
`f : A → A'` induces `A^h → A'^h`, the lift of `ι' ∘ f`. -/
def map (f : A →+* A') (hf : Continuous f) : Henselization A →+* Henselization A' :=
  lift ((of A').comp f) ((continuous_of A').comp hf)

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `map` commutes with
`ι`. -/
theorem map_comp_of (f : A →+* A') (hf : Continuous f) :
    (map f hf).comp (of A) = (of A').comp f := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `map id = id`. -/
theorem map_id : map (RingHom.id A) continuous_id = RingHom.id (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `map` is compatible with
composition. -/
theorem map_comp (f : A →+* A') (hf : Continuous f) (g : A' →+* A'') (hg : Continuous g) :
    map (g.comp f) (hg.comp hf) = (map g hg).comp (map f hf) := sorry

end Map

section RingOfDefinition

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): the pair of definition
`(D^h, I·D^h)` of `A^h` induced by a pair of definition `(D, I)` of `A`: the image of the
henselization of the pair `(D, I)` (Huber 1996, 3.1.3). -/
def pairOfDefinition (_D : PairOfDefinition A) : PairOfDefinition (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `ι` maps `D` into
`D^h`, and `(D^h, I·D^h)` is a henselian pair. -/
theorem henselianRing_pairOfDefinition (D : PairOfDefinition A) :
    HenselianRing (pairOfDefinition A D).ringOfDefinition
      (pairOfDefinition A D).idealOfDefinition := sorry

-- Huber.Henselization.ringOfDefinitionEquiv: not stated here; needs the henselization of a pair
--   `Ring.henselization D I` (supplier: PerfectoidSpaces:P3/henselisation-of-pairs). Its core,
--   `D/Iⁿ ≅ D^h/IⁿD^h` (Huber 1996, 3.1.3(iii)), is stated as
--   `Huber.Henselization.ringOfDefinitionEquiv_core` below, and the henselian property of the
--   ring of definition as `Huber.Henselization.henselianRing_pairOfDefinition`.

/-- H1:henselian/henselian-f-adic-rings-and-henselization (compatibility, core of
`ringOfDefinitionEquiv`): `ι` induces `D/Iⁿ ≅ D^h/IⁿD^h` for every `n` (Huber 1996,
3.1.3(iii)). -/
def ringOfDefinitionEquiv_core (D : PairOfDefinition A) (n : ℕ) :
    D.ringOfDefinition ⧸ D.idealOfDefinition ^ n ≃+*
      (pairOfDefinition A D).ringOfDefinition ⧸ (pairOfDefinition A D).idealOfDefinition ^ n :=
  sorry

end RingOfDefinition

section Completion

variable (A : Type u) [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-rings-and-henselization (compatibility): the completion of `ι`
is an isomorphism `Â ≃ (A^h)^` (Huber 1996, 3.1.3(iii)). -/
def completionEquiv : Completion A ≃+* Completion (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `completionEquiv` is a
homeomorphism. -/
theorem isHomeomorph_completionEquiv : IsHomeomorph (completionEquiv A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `completionEquiv` is the
completion of `ι`. -/
theorem completionEquiv_coe (a : A) :
    completionEquiv A (a : Completion A) = ((of A a : Henselization A) : Completion _) := sorry

end Completion

end Henselization

section PairHenselization

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselian-f-adic-rings-and-henselization (constructor): the henselization
`(A, A⁺)^h = (A^h, (A⁺)^h)` of a Huber pair (Huber 1996, 3.1.3), a henselian Huber pair. -/
def Pair.henselization (_P : Pair A) : Pair (Henselization A) := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): the morphism of Huber
pairs `ι : (A, A⁺) → (A, A⁺)^h`. -/
def Pair.henselization.hom (P : Pair A) : Pair.Hom P P.henselization where
  toRingHom := Henselization.of A
  continuous_toRingHom := Henselization.continuous_of A
  map_mem_plus := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): `(A, A⁺)^h` is a
henselian Huber pair. -/
instance Pair.henselization.isHenselian (P : Pair A) : P.henselization.IsHenselian := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (supporting): the universal property
of `(A, A⁺)^h` among morphisms of Huber pairs into henselian Huber rings (Huber 1996, 3.1.3). -/
theorem Pair.henselization.existsUnique_lift (P : Pair A) {B : Type*} [CommRing B]
    [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B] [Huber.IsHenselian B] {Q : Pair B}
    (f : Pair.Hom P Q) :
    ∃! g : Pair.Hom P.henselization Q, g.comp (Pair.henselization.hom P) = f := sorry

/-- H1:henselian/henselian-f-adic-rings-and-henselization (characterisation): for a ring of
definition `D ⊆ A⁺`, `(A^h)⁺ = (A⁺)^h` is the integral closure in `A^h` of the image of
`A⁺ ⊗_D D^h`, that is of the subring generated by `ι(A⁺)` and `D^h` (Huber 1996, 3.1.3). -/
theorem Pair.henselization_plus (P : Pair A) (D : PairOfDefinition A)
    (hD : D.ringOfDefinition ≤ P.plus) :
    P.henselization.plus = (integralClosure
      ↥(P.plus.map (Henselization.of A) ⊔ (Henselization.pairOfDefinition A D).ringOfDefinition)
      (Henselization A)).toSubring := sorry

end PairHenselization

-- test Huber.henselization_test_complete (degenerate)
--   [H1:henselian/henselian-f-adic-rings-and-henselization]
example {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsHuberRing A] [CompleteSpace A] [T2Space A] : IsHomeomorph (Henselization.of A) := sorry

/- `ℚ` with the `p`-adic topology: `ℚ^h = ℚ_p ∩ ℚ̄`, the relative algebraic closure of `ℚ` in
`ℚ_p`. -/
-- test Huber.henselization_test_Zp (computation)
--   [H1:henselian/henselian-f-adic-rings-and-henselization]
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace ℚ := TopologicalSpace.induced ((↑) : ℚ → ℚ_[p]) inferInstance
    ∃ (_ : IsTopologicalRing ℚ) (_ : IsHuberRing ℚ),
      Nonempty (Henselization ℚ ≃+* integralClosure ℚ ℚ_[p]) := sorry

/- The completion isomorphism carries Tau Ceti's completed ring of definition `D̂` onto that of
`(D^h, ID^h)`. -/
-- test Huber.henselization_test_completion (compatibility)
--   [H1:henselian/henselian-f-adic-rings-and-henselization]
example {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsHuberRing A] (D : PairOfDefinition A) :
    D.completion.ringOfDefinition.map (Henselization.completionEquiv A).toRingHom =
      (Henselization.pairOfDefinition A D).completion.ringOfDefinition := sorry

/- `ℤ[T]` with the `(p, T)`-adic topology: the inclusion into `ℤ_p⟦T⟧` factors uniquely through
`ℤ[T]^h`. -/
-- test Huber.henselization_test_lift (characterisation)
--   [H1:henselian/henselian-f-adic-rings-and-henselization]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (Polynomial ℤ) := ⟨Ideal.span {Polynomial.C (p : ℤ), Polynomial.X}⟩
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ∃ (_ : IsHuberRing (Polynomial ℤ)) (_ : IsHuberRing (PowerSeries ℤ_[p]))
      (_ : IsHenselian (PowerSeries ℤ_[p])),
      Continuous ((Polynomial.coeToPowerSeries.ringHom).comp
          (Polynomial.mapRingHom (Int.castRingHom ℤ_[p]))) ∧
        ∃! ψ : Henselization (Polynomial ℤ) →+* PowerSeries ℤ_[p], Continuous ψ ∧
          ψ.comp (Henselization.of (Polynomial ℤ)) = (Polynomial.coeToPowerSeries.ringHom).comp
            (Polynomial.mapRingHom (Int.castRingHom ℤ_[p])) := sorry

/- `A^h ≠ Â`: for `ℚ` with the `p`-adic topology, `ℚ^h = ℚ_p ∩ ℚ̄` is countable. -/
-- test Huber.henselization_test_not_completion (non-example)
--   [H1:henselian/henselian-f-adic-rings-and-henselization]
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace ℚ := TopologicalSpace.induced ((↑) : ℚ → ℚ_[p]) inferInstance
    ∃ (_ : IsTopologicalRing ℚ) (_ : IsHuberRing ℚ),
      Countable (Henselization ℚ) ∧ ¬ Countable ℚ_[p] := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/rational-henselization (construction) -/

section RationalHenselization

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/rational-henselization (constructor): the ring of `G_A(U)` for a rational subset
`U = R(T/s)` of `Spa(A, A⁺)` (`T·A` open): the henselization (Huber 1996, 3.1.3) of the
uncompleted rational localisation `A(T/s)`, the localisation `A_s` with Tau Ceti's Huber topology
`PairOfDefinition.locTopology` (Huber 1996, Lemma 3.1.4). Its ring is `A(U)`, the henselization of
`A` along `U`. -/
def Pair.rationalHenselization (_P : Pair A) (T : Finset A) (_s : A)
    (_hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) : Type u := sorry

namespace Pair.rationalHenselization

variable (P : Pair A) (T : Finset A) (s : A)
  (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A))

/-- H1:henselian/rational-henselization (supporting): the ring structure of `G_A(U)`. -/
instance instCommRing : CommRing (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): the canonical uniformity of the Huber
topology of `G_A(U)`. -/
instance instUniformSpace : UniformSpace (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): `G_A(U)` is a uniform additive group. -/
instance instIsUniformAddGroup : IsUniformAddGroup (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): `G_A(U)` is a topological ring. -/
instance instIsTopologicalRing : IsTopologicalRing (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): `G_A(U)` is a Huber ring. -/
instance instIsHuberRing : IsHuberRing (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): the plus ring of `G_A(U)`, the
henselization of the integral closure of `A⁺[t/s : t ∈ T]` (Huber 1996, 3.1.4). -/
def pair : Pair (P.rationalHenselization T s hT) := sorry

/-- H1:henselian/rational-henselization (data): the morphism of Huber pairs
`h : (A, A⁺) → G_A(U)`. -/
def toHom : Pair.Hom P (pair P T s hT) := sorry

/-- H1:henselian/rational-henselization (instance): `G_A(U)` is a henselian Huber pair (Huber
1996, 3.1.4(i)). -/
instance isHenselian : (pair P T s hT).IsHenselian := sorry

/-- H1:henselian/rational-henselization (characterisation): `Spa(h)` is a homeomorphism of
`Spa G_A(U)` onto `U` (Huber 1996, 3.1.4(i)). -/
def spaHomeomorph :
    ValuationSpectrum.spa (pair P T s hT).plus ≃ₜ ValuationSpectrum.rationalSubset P.plus T s :=
  sorry

/-- H1:henselian/rational-henselization (supporting): `spaHomeomorph` is `Spa(h)`. -/
theorem spaHomeomorph_apply (v : ValuationSpectrum.spa (pair P T s hT).plus) :
    (spaHomeomorph P T s hT v : Spv A) = ((toHom P T s hT).spaComap v : Spv A) := sorry

/-- H1:henselian/rational-henselization (supporting): `Spa(h)` carries rational subsets of
`Spa G_A(U)` to rational subsets of `Spa(A, A⁺)` (Huber 1996, 3.1.4(i)). -/
theorem image_rationalSubset (T' : Finset (P.rationalHenselization T s hT))
    (s' : P.rationalHenselization T s hT) :
    ∃ (T'' : Finset A) (s'' : A),
      (fun v ↦ (spaHomeomorph P T s hT v : Spv A)) ''
          {v | (v : Spv _) ∈ ValuationSpectrum.rationalSubset (pair P T s hT).plus T' s'} =
        ValuationSpectrum.rationalSubset P.plus T'' s'' := sorry

section Lift

variable {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [Huber.IsHenselian B] {Q : Pair B}

/-- H1:henselian/rational-henselization (universal-property): a morphism of Huber pairs
`f : (A, A⁺) → (B, B⁺)` with `B` henselian and `Spa(f)` landing in `U` factors through `h`
(Huber 1996, 3.1.4(ii)). -/
def lift (f : Pair.Hom P Q)
    (_hf : ∀ v, (f.spaComap v : Spv A) ∈ ValuationSpectrum.rationalSubset P.plus T s) :
    Pair.Hom (pair P T s hT) Q := sorry

/-- H1:henselian/rational-henselization (supporting): `lift f ∘ h = f`. -/
theorem lift_comp_toHom (f : Pair.Hom P Q)
    (hf : ∀ v, (f.spaComap v : Spv A) ∈ ValuationSpectrum.rationalSubset P.plus T s) :
    (lift P T s hT f hf).comp (toHom P T s hT) = f := sorry

/-- H1:henselian/rational-henselization (extensionality): two morphisms out of `G_A(U)` into a
henselian Huber pair agreeing after composition with `h` are equal (Huber 1996, 3.1.4(ii)). -/
theorem hom_ext {g₁ g₂ : Pair.Hom (pair P T s hT) Q}
    (h : g₁.comp (toHom P T s hT) = g₂.comp (toHom P T s hT)) : g₁ = g₂ := sorry

end Lift

/-- H1:henselian/rational-henselization (other): two presentations of the same rational subset
give uniquely isomorphic henselizations; `G_A(U)` depends only on `U` (Huber 1996, 3.1.4(ii)). -/
def equivOfEq (T' : Finset A) (s' : A)
    (hT' : IsOpen ((Ideal.span (T' : Set A) : Ideal A) : Set A))
    (_h : ValuationSpectrum.rationalSubset P.plus T s =
      ValuationSpectrum.rationalSubset P.plus T' s') :
    P.rationalHenselization T s hT ≃+* P.rationalHenselization T' s' hT' := sorry

/-- H1:henselian/rational-henselization (functoriality): the restriction `G_A(U) → G_A(V)` for
rational `V ⊆ U`, by the universal property (Huber 1996, (3.1.5)). -/
def restrict (T' : Finset A) (s' : A)
    (hT' : IsOpen ((Ideal.span (T' : Set A) : Ideal A) : Set A))
    (_h : ValuationSpectrum.rationalSubset P.plus T' s' ⊆
      ValuationSpectrum.rationalSubset P.plus T s) :
    Pair.Hom (pair P T s hT) (pair P T' s' hT') := sorry

/-- H1:henselian/rational-henselization (supporting): restriction to `U` itself is the
identity. -/
theorem restrict_id :
    restrict P T s hT T s hT (Set.Subset.refl _) = Pair.Hom.id (pair P T s hT) := sorry

/-- H1:henselian/rational-henselization (supporting): restrictions compose, making `U ↦ A(U)` a
presheaf of rings on the rational subsets (Huber 1996, (3.1.5)). -/
theorem restrict_comp (T' T'' : Finset A) (s' s'' : A)
    (hT' : IsOpen ((Ideal.span (T' : Set A) : Ideal A) : Set A))
    (hT'' : IsOpen ((Ideal.span (T'' : Set A) : Ideal A) : Set A))
    (h₁ : ValuationSpectrum.rationalSubset P.plus T' s' ⊆
      ValuationSpectrum.rationalSubset P.plus T s)
    (h₂ : ValuationSpectrum.rationalSubset P.plus T'' s'' ⊆
      ValuationSpectrum.rationalSubset P.plus T' s') :
    (restrict P T' s' hT' T'' s'' hT'' h₂).comp (restrict P T s hT T' s' hT' h₁) =
      restrict P T s hT T'' s'' hT'' (h₂.trans h₁) := sorry

/-- H1:henselian/rational-henselization (compatibility): the completion of `G_A(U)` is Tau Ceti's
completed rational localisation `A⟨T/s⟩` (`PairOfDefinition.completionLocalization`), for any
pair of definition `D` and any presentation `S` of `A_s` (Huber 1996, 3.1.4(iii)). -/
def completionEquiv (D : PairOfDefinition A) (S : Type u) [CommRing S] [Algebra A S]
    [IsLocalization.Away s S] (hden : D.HasDenominatorPower T s S) :
    letI := D.locUniformSpace T s S hden
    letI := D.isUniformAddGroup_locUniformSpace T s S hden
    letI := D.isTopologicalRing_locUniformSpace T s S hden
    Completion (P.rationalHenselization T s hT) ≃+* Completion S := sorry

end Pair.rationalHenselization

end RationalHenselization

-- test Huber.Pair.rationalHenselization_test_whole (degenerate)
--   [H1:henselian/rational-henselization]
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (P : Pair A) (hT : IsOpen ((Ideal.span ((({1} : Finset A)) : Set A) : Ideal A) : Set A)) :
    Nonempty (P.rationalHenselization {1} 1 hT ≃+* Henselization A) := sorry

/- `A = ℚ_p⟨T⟩` with `A⁺ = A°` and `U = R((T, p)/p)`: the completion of `G_A(U)` is
`ℚ_p⟨T/p⟩ ≅ ℚ_p⟨S⟩`. -/
open scoped Classical in
-- test Huber.Pair.rationalHenselization_test_disc (computation)
--   [H1:henselian/rational-henselization]
example (p : ℕ) [Fact p.Prime] (X : restrictedMvPowerSeriesCompletion 1 ℚ_[p])
    (hX : X = ((weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) isWeightFamily_one_weight 0 :
      weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) isWeightFamily_one_weight) :
        restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (P : Pair (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (hP : P.plus = powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (T : Finset (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (hTX : T = {X, (p : restrictedMvPowerSeriesCompletion 1 ℚ_[p])})
    (hT : IsOpen ((Ideal.span (T : Set (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
      Ideal (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
        Set (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))) :
    Nonempty (Completion (P.rationalHenselization T p hT) ≃+*
      restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

/- The completion map `A → A⟨T/s⟩` factors through `h`, and the factorisation is the completion
map of `G_A(U)`: `completionEquiv ∘ (h^)` is the completion map on `A`. -/
-- test Huber.Pair.rationalHenselization_test_lift (characterisation)
--   [H1:henselian/rational-henselization]
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (P : Pair A) (T : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) (D : PairOfDefinition A)
    (S : Type u) [CommRing S] [Algebra A S] [IsLocalization.Away s S]
    (hden : D.HasDenominatorPower T s S) (a : A) :
    letI := D.locUniformSpace T s S hden
    letI := D.isUniformAddGroup_locUniformSpace T s S hden
    letI := D.isTopologicalRing_locUniformSpace T s S hden
    Pair.rationalHenselization.completionEquiv P T s hT D S hden
        (((Pair.rationalHenselization.toHom P T s hT).toRingHom a :
          P.rationalHenselization T s hT) : Completion (P.rationalHenselization T s hT)) =
      ((algebraMap A S a : S) : Completion S) := sorry

/- For `R(T'/s) ⊆ R(T/s)` with `T ⊆ T'`, the restriction `A(U) → A(V)` completes to Tau Ceti's
`PairOfDefinition.restrictionRingHomOfSubset`. -/
-- test Huber.Pair.rationalHenselization_test_restriction (compatibility)
--   [H1:henselian/rational-henselization]
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (P : Pair A) (T T' : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A))
    (hT' : IsOpen ((Ideal.span (T' : Set A) : Ideal A) : Set A)) (hTT' : ∀ u ∈ T, u ∈ T')
    (h : ValuationSpectrum.rationalSubset P.plus T' s ⊆ ValuationSpectrum.rationalSubset P.plus T s)
    (D : PairOfDefinition A) (S S' : Type u) [CommRing S] [Algebra A S] [IsLocalization.Away s S]
    [CommRing S'] [Algebra A S'] [IsLocalization.Away s S'] (hden : D.HasDenominatorPower T s S)
    (hden' : D.HasDenominatorPower T' s S') (x : P.rationalHenselization T s hT) :
    letI := D.locUniformSpace T s S hden
    letI := D.isUniformAddGroup_locUniformSpace T s S hden
    letI := D.isTopologicalRing_locUniformSpace T s S hden
    letI := D.locUniformSpace T' s S' hden'
    letI := D.isUniformAddGroup_locUniformSpace T' s S' hden'
    letI := D.isTopologicalRing_locUniformSpace T' s S' hden'
    Pair.rationalHenselization.completionEquiv P T' s hT' D S' hden'
        (((Pair.rationalHenselization.restrict P T s hT T' s hT' h).toRingHom x :
          P.rationalHenselization T' s hT') : Completion (P.rationalHenselization T' s hT')) =
      D.restrictionRingHomOfSubset T s S hden T' S' hden' hTT'
        (Pair.rationalHenselization.completionEquiv P T s hT D S hden
          (x : Completion (P.rationalHenselization T s hT))) := sorry

/- `(A, A⁺) = (ℚ_p[T], ℤ_p[T])` with the `p`-adic topology and `U = Spa(A, A⁺) = R({1}/1)`:
`A(U) = ℤ_p[T]^h[1/p]` is algebraic over `ℚ_p[T]`, hence not complete (`exp(p²T) ∈ ℤ_p⟨T⟩` is
transcendental over `ℚ_p(T)`). -/
-- test Huber.Pair.rationalHenselization_test_not_complete (non-example)
--   [H1:henselian/rational-henselization]
example (p : ℕ) [Fact p.Prime] [TopologicalSpace (Polynomial ℚ_[p])]
    [IsTopologicalRing (Polynomial ℚ_[p])] [IsHuberRing (Polynomial ℚ_[p])]
    (D : PairOfDefinition (Polynomial ℚ_[p]))
    (hD : D.ringOfDefinition = (Polynomial.mapRingHom (algebraMap ℤ_[p] ℚ_[p])).range)
    (hI : ∀ x : D.ringOfDefinition, x ∈ D.idealOfDefinition ↔
      ∃ y : D.ringOfDefinition, (x : Polynomial ℚ_[p]) = (p : Polynomial ℚ_[p]) * y)
    (P : Pair (Polynomial ℚ_[p])) (hP : P.plus = D.ringOfDefinition)
    (hT : IsOpen ((Ideal.span ((({1} : Finset (Polynomial ℚ_[p]))) : Set (Polynomial ℚ_[p])) :
      Ideal (Polynomial ℚ_[p])) : Set (Polynomial ℚ_[p]))) :
    letI : Algebra (Polynomial ℚ_[p]) (P.rationalHenselization {1} 1 hT) :=
      (Pair.rationalHenselization.toHom P {1} 1 hT).toRingHom.toAlgebra
    (∀ x : P.rationalHenselization {1} 1 hT, IsAlgebraic (Polynomial ℚ_[p]) x) ∧
      ¬ CompleteSpace (P.rationalHenselization {1} 1 hT) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets (definition) -/

section Special

variable {A : Type u} [CommRing A] [TopologicalSpace A] (Aplus : Subring A)

/-- H1:henselian/special-and-pro-special-subsets (constructor): the subset
`S(D|E / t) = {x ∈ Spa(A, A⁺) : |d(x)| ≤ |t(x)| ≠ 0 (d ∈ D), |e(x)| < |t(x)| (e ∈ E)}` (Huber
1996, Definition 3.1.6); the openness of `(D ∪ E ∪ {t})·A` is part of `IsSpecialSubset`. -/
def specialSubset (D E : Finset A) (t : A) : Set (Spv A) :=
  ValuationSpectrum.spa Aplus ∩ {v | (∀ d ∈ D, v.toValuativeRel.vle d t) ∧
    ¬ v.toValuativeRel.vle t 0 ∧ ∀ e ∈ E, ¬ v.toValuativeRel.vle t e}

/-- H1:henselian/special-and-pro-special-subsets (structure): `U` is *special*, of the form
`S(D|E / t)` with `(D ∪ E ∪ {t})·A` open (Huber 1996, Definition 3.1.6). -/
def IsSpecialSubset (U : Set (Spv A)) : Prop :=
  ∃ (D E : Finset A) (t : A),
    IsOpen ((Ideal.span ((D : Set A) ∪ (E : Set A) ∪ {t}) : Ideal A) : Set A) ∧
      U = specialSubset Aplus D E t

/-- H1:henselian/special-and-pro-special-subsets (structure): `U` is *pro-special*, an
intersection of special subsets of `Spa(A, A⁺)` (Huber 1996, Definition 3.1.6). -/
def IsProSpecialSubset (U : Set (Spv A)) : Prop :=
  ∃ 𝒮 : Set (Set (Spv A)), (∀ S ∈ 𝒮, IsSpecialSubset Aplus S) ∧
    U = ValuationSpectrum.spa Aplus ∩ ⋂₀ 𝒮

variable {Aplus}

/-- H1:henselian/special-and-pro-special-subsets (relation): special subsets are
pro-special. -/
theorem IsSpecialSubset.isProSpecialSubset {U : Set (Spv A)} (h : IsSpecialSubset Aplus U) :
    IsProSpecialSubset Aplus U := sorry

variable (Aplus)

/-- H1:henselian/special-and-pro-special-subsets (example): `R(T/s) = S(T|∅ / s)` is special when
`T·A` is open. -/
theorem isSpecialSubset_rationalSubset (T : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    IsSpecialSubset Aplus (ValuationSpectrum.rationalSubset Aplus T s) := sorry

/-- H1:henselian/special-and-pro-special-subsets (structure): arbitrary intersections of
pro-special subsets are pro-special. -/
theorem IsProSpecialSubset.iInter {ι : Sort*} {U : ι → Set (Spv A)}
    (h : ∀ i, IsProSpecialSubset Aplus (U i)) :
    IsProSpecialSubset Aplus (ValuationSpectrum.spa Aplus ∩ ⋂ i, U i) := sorry

/-- H1:henselian/special-and-pro-special-subsets (characterisation):
`S(D|E / t) = R ∖ ⋃_{e ∈ E} R_e` for `R = R((D ∪ E ∪ {t})/t)` and
`R_e = {x ∈ R : |t(x)| ≤ |e(x)|}` (Huber 1996, proof of Corollary 3.1.8). -/
theorem specialSubset_eq_diff [DecidableEq A] (D E : Finset A) (t : A) :
    specialSubset Aplus D E t = ValuationSpectrum.rationalSubset Aplus (D ∪ E ∪ {t}) t \
      ⋃ e ∈ E, {v : Spv A | v.toValuativeRel.vle t e} := sorry

end Special

section SpecialFunctoriality

variable {A B : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- H1:henselian/special-and-pro-special-subsets (functoriality): for an adic morphism of Huber
pairs `f`, `Spa(f)⁻¹(S(D|E / t)) = S(f(D)|f(E) / f(t))` is special (Huber 1996, 3.1.9). -/
theorem IsSpecialSubset.preimage {S : Pair A} {T : Pair B} (f : Pair.Hom S T)
    [IsAdicHom f.toRingHom] {U : Set (Spv A)} (hU : IsSpecialSubset S.plus U) :
    IsSpecialSubset T.plus
      (ValuationSpectrum.spa T.plus ∩ ValuationSpectrum.comap f.toRingHom ⁻¹' U) := sorry

/-- H1:henselian/special-and-pro-special-subsets (supporting): preimages of pro-special subsets
under `Spa(f)` for adic `f` are pro-special (Huber 1996, 3.1.9). -/
theorem IsProSpecialSubset.preimage {S : Pair A} {T : Pair B} (f : Pair.Hom S T)
    [IsAdicHom f.toRingHom] {U : Set (Spv A)} (hU : IsProSpecialSubset S.plus U) :
    IsProSpecialSubset T.plus
      (ValuationSpectrum.spa T.plus ∩ ValuationSpectrum.comap f.toRingHom ⁻¹' U) := sorry

end SpecialFunctoriality

/-- H1:henselian/special-and-pro-special-subsets (compatibility): special subsets of `Spa A` and
of `Spa Â` correspond under `Spa Â ≅ Spa A`, with `Â⁺` the closure of the image of `A⁺` (Huber
1996, 3.1.9). -/
theorem IsSpecialSubset.completion {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] (Aplus : Subring A)
    {U : Set (Spv A)} (hU : U ⊆ ValuationSpectrum.spa Aplus) :
    IsSpecialSubset Aplus U ↔
      IsSpecialSubset (Aplus.map (Completion.coeRingHom : A →+* Completion A)).topologicalClosure
        (ValuationSpectrum.spa
            (Aplus.map (Completion.coeRingHom : A →+* Completion A)).topologicalClosure ∩
          ValuationSpectrum.comap (Completion.coeRingHom : A →+* Completion A) ⁻¹' U) := sorry

-- test Huber.isSpecialSubset_rationalSubset (compatibility)
--   [H1:henselian/special-and-pro-special-subsets]
example {A : Type u} [CommRing A] [TopologicalSpace A] (Aplus : Subring A) (T : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    ValuationSpectrum.rationalSubset Aplus T s = specialSubset Aplus T ∅ s ∧
      IsSpecialSubset Aplus (ValuationSpectrum.rationalSubset Aplus T s) := sorry

-- test Huber.isSpecialSubset_univ (degenerate) [H1:henselian/special-and-pro-special-subsets]
example {A : Type u} [CommRing A] [TopologicalSpace A] (Aplus : Subring A) :
    specialSubset Aplus ∅ ∅ 1 = ValuationSpectrum.spa Aplus ∧
      IsSpecialSubset Aplus (ValuationSpectrum.spa Aplus) := sorry

/- In `Spa(ℤ_p[T], ℤ_p[T])` with the `p`-adic topology, `S(∅|{T}/1) = {x : |T(x)| < 1}`; the
ideal `({T, 1})` is the unit ideal, hence open. -/
-- test Huber.specialSubset_test_tube (computation)
--   [H1:henselian/special-and-pro-special-subsets]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (Polynomial ℤ_[p]) := ⟨Ideal.span {Polynomial.C (p : ℤ_[p])}⟩
    specialSubset (⊤ : Subring (Polynomial ℤ_[p])) ∅ {Polynomial.X} 1 =
        ValuationSpectrum.spa ⊤ ∩ {v | ¬ v.toValuativeRel.vle 1 Polynomial.X} ∧
      IsSpecialSubset (⊤ : Subring (Polynomial ℤ_[p]))
        (specialSubset ⊤ ∅ {Polynomial.X} 1) := sorry

/- `S(∅|{T}/1)` is closed in `Spa(ℤ_p[T], ℤ_p[T])` (its complement is `R({1}/T)`) and not open
(`Spa` is connected, `ℤ_p⟨T⟩` having no non-trivial idempotents): special subsets need not be
rational. -/
-- test Huber.specialSubset_test_not_open (non-example)
--   [H1:henselian/special-and-pro-special-subsets]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (Polynomial ℤ_[p]) := ⟨Ideal.span {Polynomial.C (p : ℤ_[p])}⟩
    IsClosed ((Subtype.val : ValuationSpectrum.spa (⊤ : Subring (Polynomial ℤ_[p])) →
        Spv (Polynomial ℤ_[p])) ⁻¹' specialSubset ⊤ ∅ {Polynomial.X} 1) ∧
      ¬ IsOpen ((Subtype.val : ValuationSpectrum.spa (⊤ : Subring (Polynomial ℤ_[p])) →
        Spv (Polynomial ℤ_[p])) ⁻¹' specialSubset ⊤ ∅ {Polynomial.X} 1) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/special-subsets-locally-closed-constructible (lemma) -/

section LocallyClosed

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  (P : Pair A) {U : Set (Spv A)}

/-- H1:henselian/special-subsets-locally-closed-constructible: a special subset is locally closed
in the spectral space `Spa(A, A⁺)` (Huber 1996, Corollary 3.1.8). -/
theorem IsSpecialSubset.isLocallyClosed (h : IsSpecialSubset P.plus U) :
    IsLocallyClosed ((Subtype.val : ValuationSpectrum.spa P.plus → Spv A) ⁻¹' U) := sorry

/-- H1:henselian/special-subsets-locally-closed-constructible: a special subset is constructible
(Mathlib `Topology.IsConstructible`; Huber 1996, Corollary 3.1.8). -/
theorem IsSpecialSubset.isConstructible (h : IsSpecialSubset P.plus U) :
    Topology.IsConstructible ((Subtype.val : ValuationSpectrum.spa P.plus → Spv A) ⁻¹' U) :=
  sorry

/-- H1:henselian/special-subsets-locally-closed-constructible: a pro-special subset is
pro-constructible (Tau Ceti `IsProConstructible`), hence quasi-compact (Huber 1996,
Corollary 3.1.8). -/
theorem IsProSpecialSubset.isProConstructible (h : IsProSpecialSubset P.plus U) :
    IsProConstructible ((Subtype.val : ValuationSpectrum.spa P.plus → Spv A) ⁻¹' U) := sorry

/-- H1:henselian/special-subsets-locally-closed-constructible: a pro-special subset is convex: if
`x, z ∈ U` and `x ⤳ y ⤳ z`, then `y ∈ U` (Huber 1996, Corollary 3.1.8). -/
theorem IsProSpecialSubset.isConvex (h : IsProSpecialSubset P.plus U)
    {x y z : ValuationSpectrum.spa P.plus} (hx : (x : Spv A) ∈ U) (hz : (z : Spv A) ∈ U)
    (hxy : x ⤳ y) (hyz : y ⤳ z) : (y : Spv A) ∈ U := sorry

end LocallyClosed

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset (construction) -/

/-- H1:henselian/henselization-along-pro-special-subset (structure): a *triple* `(K, L, M)`: a
ring `K`, a subring `L ⊆ K` and an ideal `M` of `L` (Huber 1996, 3.1.11). -/
structure Triple where
  /-- The ring `K`. -/
  K : Type u
  /-- The ring structure of `K`. -/
  [instCommRing : CommRing K]
  /-- The subring `L ⊆ K`. -/
  L : Subring K
  /-- The ideal `M` of `L`. -/
  M : Ideal L

attribute [instance] Triple.instCommRing

/-- H1:henselian/henselization-along-pro-special-subset (supporting): a triple is *henselian* if
`(L, M)` is a henselian pair (Huber 1996, 3.1.11). -/
class Triple.IsHenselian (X : Triple.{u}) : Prop where
  /-- `(L, M)` is a henselian pair. -/
  henselianRing : HenselianRing X.L X.M

/-- H1:henselian/henselization-along-pro-special-subset (constructor): the henselization
`(K ⊗_L L^h, L^h, ML^h)` of a triple, for the henselization `(L^h, ML^h)` of the pair `(L, M)`
(PerfectoidSpaces:P3/henselisation-of-pairs; Huber 1996, 3.1.11). -/
def Triple.henselization (_X : Triple.{u}) : Triple.{u} := sorry

/-- H1:henselian/henselization-along-pro-special-subset (constructor): the saturation
`(K, L^c, √(M L^c))` of a triple, `L^c` the integral closure of `L` in `K` (Huber 1996,
3.1.11). -/
def Triple.saturation (X : Triple.{u}) : Triple.{u} where
  K := X.K
  L := (integralClosure X.L X.K).toSubring
  M := (X.M.map (algebraMap X.L (integralClosure X.L X.K))).radical

section ProSpecial

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- H1:henselian/henselization-along-pro-special-subset (supporting): the pro-special subset
`U = ⋂ᵢ S(Dᵢ|Eᵢ / tᵢ)` of `Spa(A, A⁺)` presented by `(Dᵢ, Eᵢ, tᵢ)_{i ∈ ι}`. -/
def Pair.proSpecialHenselization.presentedSet (S : Pair A) {ι : Type*} (D E : ι → Finset A)
    (t : ι → A) : Set (Spv A) :=
  ValuationSpectrum.spa S.plus ∩ ⋂ i, specialSubset S.plus (D i) (E i) (t i)

/-- H1:henselian/henselization-along-pro-special-subset (supporting): a sub-presentation presents
a larger subset. -/
theorem Pair.proSpecialHenselization.presentedSet_subset (S : Pair A) {ι κ : Type*}
    (D E : ι → Finset A) (t : ι → A) (g : κ → ι) :
    presentedSet S D E t ⊆ presentedSet S (D ∘ g) (E ∘ g) (t ∘ g) := sorry

/-- H1:henselian/henselization-along-pro-special-subset (supporting): `a / tᵢ` in
`F = A[1/tᵢ : i ∈ ι]`. -/
def Pair.proSpecialHenselization.frac {ι : Type*} (t : ι → A) (i : ι) (a : A) :
    Localization (Submonoid.closure (Set.range t)) :=
  Localization.mk a ⟨t i, Submonoid.subset_closure (Set.mem_range_self i)⟩

/-- H1:henselian/henselization-along-pro-special-subset (supporting): the triple `(F, G, J)` of
Huber 1996, 3.1.12, for the pair `(B, P) = (A⁺, A⁺ ∩ A°°)`: `F = A[1/tᵢ]`,
`G = B[d/tᵢ, e/tᵢ : d ∈ Dᵢ, e ∈ Eᵢ] ⊆ F` and `J = (P ∪ {e/tᵢ})·G`. -/
def Pair.proSpecialHenselization.triple (S : Pair A) {ι : Type*} (D E : ι → Finset A)
    (t : ι → A) : Triple.{u} where
  K := Localization (Submonoid.closure (Set.range t))
  L := Subring.closure
    (algebraMap A (Localization (Submonoid.closure (Set.range t))) '' (S.plus : Set A) ∪
      ⋃ i, frac t i '' ((D i : Set A) ∪ (E i : Set A)))
  M := Ideal.span {x | (x : Localization (Submonoid.closure (Set.range t))) ∈
    algebraMap A (Localization (Submonoid.closure (Set.range t))) ''
        {a | a ∈ S.plus ∧ IsTopologicallyNilpotent a} ∪
      ⋃ i, frac t i '' (E i : Set A)}

/-- H1:henselian/henselization-along-pro-special-subset (constructor): the *henselization of `A`
along the presented pro-special subset `U`*, `A(U) = F^h` for the henselization `(F^h, G^h, J^h)`
of the triple `(F, G, J)` (Huber 1996, 3.1.12), a ring without topology. -/
def Pair.proSpecialHenselization (S : Pair A) {ι : Type*} (D E : ι → Finset A) (t : ι → A) :
    Type u :=
  (Pair.proSpecialHenselization.triple S D E t).henselization.K

namespace Pair.proSpecialHenselization

variable (S : Pair A) {ι : Type*} (D E : ι → Finset A) (t : ι → A)

/-- H1:henselian/henselization-along-pro-special-subset (supporting): the ring `A(U)`. -/
instance instCommRing : CommRing (S.proSpecialHenselization D E t) :=
  inferInstanceAs (CommRing (triple S D E t).henselization.K)

/-- H1:henselian/henselization-along-pro-special-subset (supporting): the canonical map
`A → F → A(U)`. -/
def toRingHom : A →+* S.proSpecialHenselization D E t := sorry

/-- H1:henselian/henselization-along-pro-special-subset (other): `A(U)` does not depend on the
presentation of `U` (nor on `(B, P)`) up to unique isomorphism (Huber 1996, 3.1.12(i)). -/
def equivOfPresentation {κ : Type*} (D' E' : κ → Finset A) (t' : κ → A)
    (_hopen : ∀ i, IsOpen ((Ideal.span ((D i : Set A) ∪ (E i : Set A) ∪ {t i}) : Ideal A) :
      Set A))
    (_hopen' : ∀ j, IsOpen ((Ideal.span ((D' j : Set A) ∪ (E' j : Set A) ∪ {t' j}) : Ideal A) :
      Set A))
    (_h : presentedSet S D E t = presentedSet S D' E' t') :
    S.proSpecialHenselization D E t ≃+* S.proSpecialHenselization D' E' t' := sorry

/-- H1:henselian/henselization-along-pro-special-subset (functoriality): the restriction
`A(U) → A(U')` for pro-special `U' ⊆ U` (Huber 1996, 3.1.12(ii)). -/
def restrict {κ : Type*} (D' E' : κ → Finset A) (t' : κ → A)
    (_h : presentedSet S D' E' t' ⊆ presentedSet S D E t) :
    S.proSpecialHenselization D E t →+* S.proSpecialHenselization D' E' t' := sorry

/-- H1:henselian/henselization-along-pro-special-subset (supporting): restriction to `U` itself
is the identity. -/
theorem restrict_id :
    restrict S D E t D E t (Set.Subset.refl _) = RingHom.id (S.proSpecialHenselization D E t) :=
  sorry

/-- H1:henselian/henselization-along-pro-special-subset (supporting): restrictions compose,
making `U ↦ A(U)` a presheaf of rings on the pro-special subsets (Huber 1996, 3.1.12(ii)). -/
theorem restrict_comp {κ μ : Type*} (D' E' : κ → Finset A) (t' : κ → A) (D'' E'' : μ → Finset A)
    (t'' : μ → A) (h₁ : presentedSet S D' E' t' ⊆ presentedSet S D E t)
    (h₂ : presentedSet S D'' E'' t'' ⊆ presentedSet S D' E' t') :
    (restrict S D' E' t' D'' E'' t'' h₂).comp (restrict S D E t D' E' t' h₁) =
      restrict S D E t D'' E'' t'' (h₂.trans h₁) := sorry

/-- H1:henselian/henselization-along-pro-special-subset (functoriality): a morphism of Huber pairs
`f` and pro-special `U`, `U'` with `Spa(f)(U') ⊆ U` induce `A(U) → A'(U')` (Huber 1996,
3.1.12(iii)). -/
def map {A' : Type*} [CommRing A'] [TopologicalSpace A'] [IsTopologicalRing A'] [IsHuberRing A']
    {S' : Pair A'} (f : Pair.Hom S S') {κ : Type*} (D' E' : κ → Finset A') (t' : κ → A')
    (_h : ∀ v ∈ presentedSet S' D' E' t',
      ValuationSpectrum.comap f.toRingHom v ∈ presentedSet S D E t) :
    S.proSpecialHenselization D E t →+* S'.proSpecialHenselization D' E' t' := sorry

/-- H1:henselian/henselization-along-pro-special-subset (instance): the saturated triple
`(A(U), (G^h)^c, (J^h)^c)` is henselian (Huber 1996, 3.1.12). -/
instance isHenselian : (triple S D E t).henselization.saturation.IsHenselian := sorry

/-- H1:henselian/henselization-along-pro-special-subset (compatibility): for a rational
`U = R(T/s) = S(T|∅ / s)`, `A(U)` is the ring of H1:henselian/rational-henselization's
`G_A(U)`. -/
def rationalEquiv (T : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    S.proSpecialHenselization (fun _ : Unit ↦ T) (fun _ ↦ ∅) (fun _ ↦ s) ≃+*
      S.rationalHenselization T s hT := sorry

/-- H1:henselian/henselization-along-pro-special-subset (example): Huber 1996, 3.1.13(i): for
`A` with an `I`-adic topology, `I` finitely generated, the henselization of `A` along
`Spa(A, A⁺) = S(∅|∅ / 1)` is the henselization of `A` along `I`, which is `A^h` (`D = A`). -/
def adicEquiv (I : Ideal A) (_hI : IsAdic I) (_hfg : I.FG) :
    S.proSpecialHenselization (fun _ : Unit ↦ (∅ : Finset A)) (fun _ ↦ ∅) (fun _ ↦ 1) ≃+*
      Henselization A := sorry

-- Huber.Pair.proSpecialHenselization.formalGenericFibreEquiv: not stated here; needs the
--   specialisation map `λ : Spa((A, A)(1/s)) → Spec` of the formal generic fibre and
--   `λ⁻¹(P)` (supplier: AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus). The
--   statement (Huber 1996, 3.1.13(iii)): `(A^h)_s` is the henselization of `(A, A)(1/s)` along
--   the pro-special subset `λ⁻¹(P)`.

end Pair.proSpecialHenselization

end ProSpecial

-- test Huber.Pair.proSpecialHenselization_test_rational (compatibility)
--   [H1:henselian/henselization-along-pro-special-subset]
example {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (S : Pair A) (T : Finset A) (s : A)
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    Nonempty (S.proSpecialHenselization (fun _ : Unit ↦ T) (fun _ ↦ ∅) (fun _ ↦ s) ≃+*
      S.rationalHenselization T s hT) := sorry

-- test Huber.Pair.proSpecialHenselization_test_complete (degenerate)
--   [H1:henselian/henselization-along-pro-special-subset]
example {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsHuberRing A] [CompleteSpace A] [T2Space A] (S : Pair A) :
    Nonempty (S.proSpecialHenselization (fun _ : Unit ↦ (∅ : Finset A)) (fun _ ↦ ∅)
      (fun _ ↦ 1) ≃+* A) := sorry

/- `(ℤ_p[T], ℤ_p[T])` with the `p`-adic topology and `U = S(∅|{T}/1)`: `A(U)` is the
henselization of the pair `(ℤ_p[T], (p, T))`, stated by its universal property. -/
-- test Huber.Pair.proSpecialHenselization_test_tube (computation)
--   [H1:henselian/henselization-along-pro-special-subset]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (Polynomial ℤ_[p]) := ⟨Ideal.span {Polynomial.C (p : ℤ_[p])}⟩
    ∃ _ : IsHuberRing (Polynomial ℤ_[p]), ∀ S : Pair (Polynomial ℤ_[p]), S.plus = ⊤ →
      HenselianRing (S.proSpecialHenselization (fun _ : Unit ↦ ∅) (fun _ ↦ {Polynomial.X})
          (fun _ ↦ 1))
        ((Ideal.span {Polynomial.C (p : ℤ_[p]), Polynomial.X}).map
          (Pair.proSpecialHenselization.toRingHom S (fun _ : Unit ↦ ∅)
            (fun _ ↦ {Polynomial.X}) (fun _ ↦ 1))) ∧
      ∀ (C : Type) [CommRing C] (J : Ideal C) [HenselianRing C J]
        (ψ : Polynomial ℤ_[p] →+* C),
        (Ideal.span {Polynomial.C (p : ℤ_[p]), Polynomial.X}).map ψ ≤ J →
          ∃! χ : S.proSpecialHenselization (fun _ : Unit ↦ ∅) (fun _ ↦ {Polynomial.X})
              (fun _ ↦ 1) →+* C,
            χ.comp (Pair.proSpecialHenselization.toRingHom S (fun _ : Unit ↦ ∅)
              (fun _ ↦ {Polynomial.X}) (fun _ ↦ 1)) = ψ := sorry

-- Huber.Pair.proSpecialHenselization_test_affinoid_field: not stated here; needs the
--   henselization of the valued field `K` with respect to its valuation ring `K⁺`, that is of
--   the local ring `K⁺` (supplier: PerfectoidSpaces:P3/henselisation-of-pairs). The statement:
--   for an affinoid field `(K, K⁺)` and `U` its closed point, `A(U)` is that henselization
--   [characterisation test]

-- Huber.Pair.proSpecialHenselization_test_not_germs: not stated here; needs the ring of germs
--   `Γ(U, O|_U)` of the structure presheaf along `U` (supplier: AdicSpaces Layer 3). The
--   statement: for `U = S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T])`, `exp(p²T)` defines a germ along `U`
--   but is transcendental over `ℚ_p(T)`, whereas `A(U)` is ind-étale over `ℤ_p[T]`
--   [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/pro-special-henselization-continuity (lemma) -/

/-- H1:henselian/pro-special-henselization-continuity: `A(U)` is the filtered colimit of the
`A(U_{Λ₀})` over the finite sub-presentations `Λ₀ ⊆ Λ` of `U = ⋂_{i ∈ Λ} S(Dᵢ|Eᵢ / tᵢ)` (Huber
1996, 3.1.12; the cofiltered-intersection form follows by reindexing). -/
def Pair.proSpecialHenselization.colimitEquiv {A : Type u} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] (S : Pair A) {ι : Type*} (D E : ι → Finset A)
    (t : ι → A) :
    Ring.DirectLimit
        (fun Λ₀ : Finset ι ↦ S.proSpecialHenselization (fun i : Λ₀ ↦ D i) (fun i : Λ₀ ↦ E i)
          (fun i : Λ₀ ↦ t i))
        (fun Λ₀ Λ₁ h ↦ Pair.proSpecialHenselization.restrict S (fun i : Λ₀ ↦ D i)
          (fun i : Λ₀ ↦ E i) (fun i : Λ₀ ↦ t i) (fun i : Λ₁ ↦ D i) (fun i : Λ₁ ↦ E i)
          (fun i : Λ₁ ↦ t i)
          (Pair.proSpecialHenselization.presentedSet_subset S (fun i : Λ₁ ↦ D i)
            (fun i : Λ₁ ↦ E i) (fun i : Λ₁ ↦ t i)
            (fun i : Λ₀ ↦ ⟨i.1, Finset.mem_of_subset h i.2⟩))) ≃+*
      S.proSpecialHenselization D E t := sorry

end Huber

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product (construction) -/

-- AdicSpace.PseudoAdic.schemeFibreProduct: not stated here; needs pseudo-adic spaces `(X, Σ)`
--   over the anchor's adic spaces, their underlying locally ringed spaces `ℓ(𝒮)` and étale sites
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site, AdicSpaces Layer 5). The
--   statement (Huber 1996, 3.2.7): `𝒮 ×_Y Z` for `g : ℓ(𝒮) → Y` and `Z` locally of finite type
--   over the scheme `Y`.
-- AdicSpace.PseudoAdic.schemeFibreProduct.fst: not stated here; needs pseudo-adic spaces and
--   their morphisms (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). The
--   projection `p : 𝒮 ×_Y Z → 𝒮`, locally of finite type.
-- AdicSpace.PseudoAdic.schemeFibreProduct.snd: not stated here; needs `ℓ(𝒮 ×_Y Z)` as a locally
--   ringed space (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). The
--   morphism `q : ℓ(𝒮 ×_Y Z) → Z` over `Y`.
-- AdicSpace.PseudoAdic.schemeFibreProduct.lift: not stated here; needs pseudo-adic spaces and
--   their morphisms (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). The
--   universal property among compatible `𝒯 → 𝒮` and `ℓ(𝒯) → Z`, with `lift_fst`, `lift_snd`.
-- AdicSpace.PseudoAdic.schemeFibreProduct.surjective_points: not stated here; needs the points
--   of pseudo-adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site).
--   Every `(s, z) ∈ Σ × Z` with `g(s) = f(z)` is `(p, q)(r)` for a point `r`.
-- AdicSpace.PseudoAdic.schemeFibreProduct.isEtale_fst: not stated here; needs étale morphisms of
--   pseudo-adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). If
--   `Z → Y` is étale then so is `p`.
-- AdicSpace.PseudoAdic.etaleSitePullback: not stated here; needs the étale site of a
--   pseudo-adic space (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). The
--   morphism of sites `g⁻¹ : Et/Y ⥤ Et/𝒮`, `Z ↦ 𝒮 ×_Y Z` (Huber 1996, 3.2.8), from Mathlib's
--   `Scheme.smallEtaleTopology`.
-- AdicSpace.PseudoAdic.etaleSitePullback_comp: not stated here; needs the étale site of a
--   pseudo-adic space (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site).
--   Compatibility of `g⁻¹` with composition on both sides.
-- AdicSpace.PseudoAdic.etaleCohomologyPullback: not stated here; needs étale cohomology of
--   pseudo-adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image). The maps
--   `Hⁿ(Y_et, F) → Hⁿ(𝒮_et, g^*F)`, natural in `F`.
-- AdicSpace.PseudoAdic.schemeFibreProduct_test_identity: not stated here; needs pseudo-adic
--   spaces (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For `Z = Y`,
--   `𝒮 ×_Y Y = 𝒮` [degenerate test]
-- AdicSpace.PseudoAdic.schemeFibreProduct_test_line: not stated here; needs the relative
--   analytic affine line over `Spa(A, A⁺)` (supplier: AdicSpaces Layer 5). For `A` Tate and
--   `Z = A¹_{Spec A}`, the fibre product is the increasing union of the relative discs of radius
--   `|ϖ|⁻ⁿ` [computation test]
-- AdicSpace.PseudoAdic.schemeFibreProduct_test_points_not_injective: not stated here; needs the
--   analytic affine line over `Spa(ℚ_p, ℤ_p)` (supplier: AdicSpaces Layer 5). Its non-classical
--   points lie over the generic point of `A¹_{ℚ_p}`: the map to the set-theoretic fibre product
--   is surjective, not injective [non-example test]
-- AdicSpace.PseudoAdic.schemeFibreProduct_test_analytification: not stated here; needs the
--   analytification `Z^ad` (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification).
--   For `𝒮 = Spa(K, K°)` and `Y = Spec K`, `𝒮 ×_Y Z = Z^ad` [compatibility test]
-- AdicSpace.PseudoAdic.etaleSitePullback_test_hansen: not stated here; needs the étale site of
--   `Spa(A, A°)` and Hansen's `µ_X` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For a `K`-affinoid `A`, `g⁻¹` for
--   `Spa(A, A°) → Spec A` is `µ_X` [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12 (construction) -/

-- AdicSpace.henselianComparison: not stated here; needs the pseudo-adic space
--   `𝒰 = (Spa(Â, Â⁺), U)`, its étale topos and the fibre products `X′ = 𝒰 ×_{Spec A} X` of
--   H1:henselian/pseudo-adic-scheme-fibre-product (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site, AdicSpaces Layer 5). The morphism of
--   topoi `γ_X : (X′_et)~ → (X″_et)~` of Huber 1996, 3.2.12, `X″ = Spec A(U) ×_{Spec A} X`, with
--   `A(U)` the ring `Huber.Pair.proSpecialHenselization` above.
-- AdicSpace.henselianComparison.snd_comp: not stated here; needs `γ_X` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). `p″ ∘ γ_X ≅ p′`.
-- AdicSpace.henselianComparison.triangle: not stated here; needs `γ` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For `X = Spec A`: `j ∘ γ ≅ i`.
-- AdicSpace.henselianComparison.of_complete: not stated here; needs `γ` and `i⁻¹` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For complete `A` and
--   `U = Spa(A, A⁺)`, `γ` is the morphism of topoi of `i⁻¹`.
-- AdicSpace.henselianComparison.naturality: not stated here; needs `γ_X` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Naturality in `X` over `Spec A`.
-- AdicSpace.henselianComparison.restrict: not stated here; needs `γ` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Compatibility with shrinking `U` to
--   a pro-special `U₁ ⊆ U` and with `Pair.proSpecialHenselization.restrict`.
-- AdicSpace.henselianComparison.cohomologyMap: not stated here; needs étale cohomology of
--   pseudo-adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image). The maps
--   `γ^* : Hⁿ(X″_et, F″) → Hⁿ(X′_et, F′)`, natural in `F`.
-- AdicSpace.henselianComparison_test_complete: not stated here; needs `γ` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For complete `A`,
--   `U = Spa(A, A⁺)`: `γ = i^*` [degenerate test]
-- AdicSpace.henselianComparison_test_triangle: not stated here; needs `γ` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). `j ∘ γ ≅ i`, hence
--   `γ^*(j^*F) ≅ i^*F` [characterisation test]
-- AdicSpace.henselianComparison_test_etale_base_change: not stated here; needs `γ_X` (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For `X₁ → X` étale, `γ_{X₁}` is the
--   restriction of `γ_X` [compatibility test]
-- AdicSpace.henselianComparison_test_not_i: not stated here; needs étale cohomology of
--   `Spa(ℚ_p, ℤ_p)` (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image). For `ℚ` with
--   the `p`-adic topology, `H¹(-, ℤ/n)` of `Spec ℚ` and of `Spa(ℚ_p, ℤ_p)` differ, while through
--   `Y = Spec(ℚ_p ∩ ℚ̄)` they agree [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/strict-localisation-stalk-formula (lemma) -/

-- AdicSpace.PseudoAdic.stalk_higherDirectImage: not stated here; needs higher direct images along
--   `g : ℓ(𝒮) → Y` for pseudo-adic spaces and Huber's tilde-limits `𝒮(ȳ)` (supplier:
--   ClassicalAdicEtaleCohomology:H0/stalk-of-higher-direct-image-as-colimit,
--   ClassicalAdicEtaleCohomology:H0/huber-tilde-limit). The statement:
--   `(R^q g_*F)_ȳ ≅ colim_{(V, v̄)} H^q((𝒮 ×_Y V)_et, F)` over the étale neighbourhoods of `ȳ`
--   (the stalk at Mathlib's `pointSmallEtale`), and `= H^q(𝒮(ȳ)_et, F|)` for qcqs `𝒮`.

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/comparison-continuity-under-limits (lemma) -/

-- AdicSpace.henselianComparison_colimit: not stated here; needs étale cohomology of pseudo-adic
--   spaces and `γ` (supplier: ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity,
--   H1:henselian/comparison-morphism-3-2-12). The statement: for a cofiltered intersection
--   `U = ⋂ U_λ` of pro-special subsets, `colim_λ Hⁿ(Spec A(U_λ), j_λ^*F) ≅ Hⁿ(Spec A(U), j^*F)`
--   and `colim_λ Hⁿ(𝒰_λ, i_λ^*F) ≅ Hⁿ(𝒰, i^*F)`, compatibly with `γ^*`; the ring-level input is
--   `Huber.Pair.proSpecialHenselization.colimitEquiv`.

namespace HenselianRing

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5 (theorem) -/

-- HenselianRing.etaleCohomology_restrict_bijective: not stated here; needs the restriction
--   `i^*` of abelian sheaves on Mathlib's `Scheme.smallEtaleTopology` along the closed immersion
--   `Spec(A/I) → Spec A` and torsion étale sheaves (supplier: SchemeAndStackFoundations:SF.2).
--   The statement (Gabber; Huber 1993, Theorem 0.1; Huber 1996, Lemma 3.2.5):
--   `Hⁿ(Spec A_et, F) → Hⁿ(Spec(A/I)_et, i^*F)` is bijective for every torsion `F` and `n ≥ 0`.
--   Its degree `≤ 1` core with finite coefficients, the lifting of finite étale algebras, is
--   `HenselianRing.etaleCohomology_restrict_bijective_core`.

/-- H1:henselian/affine-henselian-comparison-3-2-5 (core, degree `≤ 1`): along a henselian pair
every finite étale `A ⧸ I`-algebra lifts to a finite étale `A`-algebra (Gabber; Stacks Tag
09ZL), the finite-coefficient `H¹` part of Huber 1996, Lemma 3.2.5. -/
theorem etaleCohomology_restrict_bijective_core {A : Type u} [CommRing A] (I : Ideal A)
    [HenselianRing A I] (B' : Type u) [CommRing B'] [Algebra (A ⧸ I) B']
    [Algebra.Etale (A ⧸ I) B'] [Module.Finite (A ⧸ I) B'] :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B), Algebra.Etale A B ∧ Module.Finite A B ∧
      Nonempty ((A ⧸ I) ⊗[A] B ≃ₐ[A ⧸ I] B') := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/henselian-comparison-separably-closed-points (lemma) -/

-- HenselianRing.etaleCohomology_pushforward_sepClosed_eq_zero: not stated here; needs the
--   push-forward `t_*` of étale sheaves along `Spec K → Spec A` and their restriction to the
--   closed subscheme `Spec(A/J)` (supplier: SchemeAndStackFoundations:SF.2). The statement
--   (Huber 1993, statements A_i): `Hⁱ((Spec A/J)_et, (t_*G)|) = 0` for `i ≥ 1`, `K` separably
--   closed and `G` abelian torsion.

end HenselianRing

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-space-as-limit (lemma) -/

/-- H1:henselian/zariski-riemann-space-as-limit (supporting): the subspace
`{V ∈ Spv K : E ⊆ V, F ⊆ 𝔪_V}` of the Zariski–Riemann space of a field, `Spv K` with its
valuation-spectrum topology (the sets `{V : a ∈ V}` generate it on a field). -/
def ValuationSpectrum.zariskiRiemannSubset {K : Type u} [Field K] (E F : Set K) : Set (Spv K) :=
  {v | (∀ e ∈ E, v.toValuativeRel.vle e 1) ∧ ∀ f ∈ F, ¬ v.toValuativeRel.vle 1 f}

-- ValuationSpectrum.zariskiRiemannHomeomorphLimit: not stated here; needs the cofiltered
--   category of projective integral models `(X, f, g)` of `Spec K` over `Spec A` and the limit
--   of their underlying spaces (supplier: SchemeAndStackFoundations:SF.2). The statement (Huber
--   1993, Lemma 2.1): the centre maps give `{V : s(A) ⊆ V} ≃ₜ lim |X|`. Its core, that this
--   subspace is spectral, is `ValuationSpectrum.zariskiRiemannHomeomorphLimit_core`.

/-- H1:henselian/zariski-riemann-space-as-limit (core): the Zariski–Riemann subspace
`{V ∈ Spv K : s(A) ⊆ V}` is a spectral space, as a limit of spectral spaces along spectral maps
(Huber 1993, Lemma 2.1). -/
theorem ValuationSpectrum.zariskiRiemannHomeomorphLimit_core {A K : Type u} [CommRing A]
    [Field K] (s : A →+* K) : SpectralSpace (zariskiRiemannSubset (Set.range s) ∅) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/etale-over-normal-separably-closed-local-isomorphism (lemma) -/

/-- H1:henselian/etale-over-normal-separably-closed-local-isomorphism: an étale morphism to a
closed subscheme of a normal integral scheme with separably closed function field is a local
isomorphism (Huber 1993, Lemma 2.4); normality is `IsIntegrallyClosed` of every stalk. -/
theorem AlgebraicGeometry.isLocalIso_of_etale_of_isSepClosed_functionField
    {X Y Z : AlgebraicGeometry.Scheme.{u}} [AlgebraicGeometry.IsIntegral X]
    (hX : ∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)) [IsSepClosed X.functionField]
    (i : Y ⟶ X) [AlgebraicGeometry.IsClosedImmersion i] (f : Z ⟶ Y)
    [AlgebraicGeometry.Etale f] : AlgebraicGeometry.IsLocalIso f := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-cohomology-vanishing (theorem) -/

open CategoryTheory in
/-- H1:henselian/zariski-riemann-cohomology-vanishing (a): for a separably closed field `K`,
`Hⁿ(Y, G) = 0` for `n ≥ 1`, every abelian torsion group `G` and
`Y = {V ∈ Spv K : E ⊆ V, F ⊆ 𝔪_V}` (sheaf cohomology of the constant sheaf, Mathlib's
`Sheaf.H`; Huber 1993, Theorem 0.2 and Proposition 4.1). Part (b), triviality of `H¹(Y, G)` for
ind-finite `G`, needs non-abelian `H¹`, which no library has. -/
theorem ValuationSpectrum.zariskiRiemann_cohomology_eq_zero {K : Type u} [Field K]
    [IsSepClosed K] (E F : Set K) (G : Type u) [AddCommGroup G] (hG : ∀ g : G, IsOfFinAddOrder g)
    [HasExt.{u} (Sheaf (Opens.grothendieckTopology ↥(zariskiRiemannSubset E F))
      AddCommGrpCat.{u})] (n : ℕ) (hn : 1 ≤ n) :
    Subsingleton (Sheaf.H ((constantSheaf (Opens.grothendieckTopology ↥(zariskiRiemannSubset E F))
      AddCommGrpCat.{u}).obj (AddCommGrpCat.of G)) n) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12 (theorem) -/

-- AdicSpace.henselianComparison_bijective: not stated here; needs `γ_X` and étale cohomology of
--   pseudo-adic spaces (supplier: H1:henselian/comparison-morphism-3-2-12,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). The statement (Huber 1996, Theorem
--   3.2.10 with 3.2.12): under Huber's standing condition, for `f : X → Spec A` locally of finite
--   type and proper over the non-open primes near `i(U)`, `γ_X^*` is bijective on `Hⁿ` for `n = 0`
--   (sets), `n ≤ 1` (ind-finite groups), all `n` (abelian torsion sheaves).

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/sheaf-comparison-3-2-9 (theorem) -/

-- AdicSpace.henselianComparison_bijective_of_spec: not stated here; needs `γ`, `i^*`, `j^*` and
--   étale cohomology of pseudo-adic spaces (supplier: H1:henselian/comparison-morphism-3-2-12,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). The statement (Huber 1996, Theorem
--   3.2.9): `γ^* : Hⁿ(Y_et, j^*F) → Hⁿ(𝒰_et, i^*F)` is bijective for sheaves `F` on
--   `(Spec A)_et` (sets: `n = 0`; ind-finite groups: `n ≤ 1`; abelian torsion: all `n`).

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1 (theorem) -/

-- AdicSpace.henselianComparison_constant_bijective: not stated here; needs `γ` and étale
--   cohomology of pseudo-adic spaces (supplier: H1:henselian/comparison-morphism-3-2-12,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). The statement (Huber 1996, Theorem
--   3.2.1): for pro-special `U` and constant coefficients `G`, `γ^* : Hⁿ(Spec A(U)_et, G) →
--   Hⁿ(𝒰_et, G)` is bijective (sets: `n = 0`; ind-finite groups: `n ≤ 1`; abelian torsion: all
--   `n`).

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/complete-affinoid-comparison-3-2-2 (theorem) -/

-- AdicSpace.spec_spa_etaleCohomology_bijective: not stated here; needs étale cohomology of the
--   adic space `Spa(A, A⁺)` and the morphism of sites `i⁻¹` (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image, AdicSpaces Layer 5). The statement
--   (Huber 1996, Corollary 3.2.2): for a complete Huber pair under Huber's standing condition,
--   `Hⁿ((Spec A)_et, G) → Hⁿ(Spa(A, A⁺)_et, G)` is bijective (sets: `n = 0`; ind-finite
--   groups: `n ≤ 1`; abelian torsion: all `n`).

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/affinoid-algebra-comparison-3-2-3 (theorem) -/

-- AdicSpace.tateAlgebra_spec_spa_etaleCohomology_bijective: not stated here; needs étale
--   cohomology of `Spa(A, A°)` (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   AdicSpaces Layer 5). The statement (Huber 1996, Corollary 3.2.3): for `A` topologically of
--   finite type over a complete nonarchimedean field (Tau Ceti `IsTopologicallyFiniteType`),
--   `Hⁿ((Spec A)_et, G) → Hⁿ(Spa(A, A°)_et, G)` is bijective in the same ranges.

/-! ## ClassicalAdicEtaleCohomology:H1:henselian/fujiwara-comparison-3-2-11 (application) -/

-- AdicSpace.fujiwara_comparison: not stated here; needs étale cohomology of the analytic locus
--   `Spa(A, A)_a` (supplier: AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). The statement (Huber 1996, Example
--   3.2.11): for a noetherian ring `A` henselian along `I` (`HenselianRing A I`) and
--   `X → Spec A ∖ V(I)` proper, `Hⁿ(X_et, F) ≅ Hⁿ((X ×_{Spec A} Spa(A, A))_et, F′)` for abelian
--   torsion `F`.

end TauCeti

end

/-! # Stage H1:formal-adic-comparison. The specialisation morphism, pseudo-adic supports, stalk
formulas and the comparison `i^* R⁺j_* K ≅ R⁺b_* a^* K`

This stage follows Huber 1996 §3.5–3.6 and Berkovich 1994 §§2–5. Its carriers are formal schemes
of type (S) with their étale sites, generic fibres `d(X)` and specialisation maps `λ_X`
(AdicSpacesPartII F0/R2), adic spaces with their étale sites and geometric points (the anchor's
Layer 5, AdicEtaleGeometry A1), and pseudo-adic spaces with their étale sites, derived direct
images, extension by zero and tilde-limits (ClassicalAdicEtaleCohomology H0). None of these is in
the pinned libraries, so every item that lives on them is a comment naming its supplier.

What is stated, under suffixed names:
* ring-level cores: étale adic ring maps `FormalScheme.Hom.IsEtale_ring` (the affine form of
  `FormalScheme.Hom.IsEtale`), lifting of étale algebras along `A → A ⧸ J` and noetherianity of
  completed étale algebras, point lifting through valuation rings (Lemma 3.5.1(i)), and strict
  henselianity of `B ⧸ q` for a valuation ring `B` of an algebraically closed field;
* scheme-level cores: the equivalence of the small étale sites of `Spec (A ⧸ J)` and
  `Spec (A ⧸ √J)` (Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`), the scheme data of the
  completion comparison `FormalScheme.CompletionData_scheme` with the scheme side `i^* R^q j_* K`
  of the comparison map and its cohomology `H^p(Y, i^* R^q j_* K)` (Mathlib
  `CategoryTheory.Sheaf.H`), and the microbial base `FormalScheme.MicrobialBase` itself, which is
  scheme-level data (a microbial valuation ring via Mathlib `ValuationRing`, `IsAdic` and Tau
  Ceti's `Valuation.IsMicrobial`, and a scheme locally of finite type over it). -/

noncomputable section

namespace TauCeti

open _root_.CategoryTheory Limits _root_.AlgebraicGeometry

namespace FormalScheme

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism (definition) -/

section EtaleRing

/-- H1:formal-adic-comparison/formal-etale-morphism (definition): ring-level core of
`FormalScheme.Hom.IsEtale` for a morphism `Spf B → Spf A` of affine formal schemes (Berkovich 1994
§2, before Lemma 2.1; Huber 1996 §3.5, p. 201). For an ideal of definition `J` of `A`, the ring
map `f : A → B` is étale if it is adic (the topology of `B` is the `J·B`-adic one) and every
reduction `A ⧸ J ^ (n + 1) → B ⧸ J ^ (n + 1)·B` is an étale ring map (Mathlib `RingHom.Etale`).
The test is made at every level `n`, never only modulo `J` or on the reduced rings. -/
structure Hom.IsEtale_ring {A B : Type*} [CommRing A] [CommRing B] [TopologicalSpace B]
    (f : A →+* B) (J : Ideal A) : Prop where
  /-- `f` is adic: `J·B` is an ideal of definition of `B`. -/
  isAdic_map : IsAdic (J.map f)
  /-- Every reduction `A ⧸ J ^ (n + 1) → B ⧸ J ^ (n + 1)·B` is étale. -/
  etale_quotientMap : ∀ n : ℕ,
    (Ideal.quotientMap ((J ^ (n + 1)).map f) f Ideal.le_comap_map).Etale

/-- H1:formal-adic-comparison/formal-etale-morphism (definition): ring-level core of
`FormalScheme.Hom.IsEtale.comp` (Huber 1996 §3.5): a composite of étale adic ring maps is
étale. -/
theorem Hom.IsEtale_ring.comp {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]
    [TopologicalSpace B] [TopologicalSpace C] {f : A →+* B} {g : B →+* C} {J : Ideal A}
    (hf : Hom.IsEtale_ring f J) (hg : Hom.IsEtale_ring g (J.map f)) :
    Hom.IsEtale_ring (g.comp f) J := sorry

/-- H1:formal-adic-comparison/formal-etale-morphism (definition): ring-level core of
`FormalScheme.Hom.isEtale_ofScheme_iff` (Huber 1996 §3.5): for a discrete ring `B` and the ideal
of definition `0` the test is Mathlib's étaleness of ring maps, the affine case of
`AlgebraicGeometry.Etale`. -/
theorem Hom.isEtale_ofScheme_iff_ring {A B : Type*} [CommRing A] [CommRing B]
    [TopologicalSpace B] [DiscreteTopology B] (f : A →+* B) :
    Hom.IsEtale_ring f ⊥ ↔ f.Etale := sorry

end EtaleRing

-- FormalScheme.Hom.IsEtale: not stated here; needs formal schemes of type (S) with their reductions
--   X_n = (X, O_X/J^{n+1}) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type); its ring-level core is
--   `FormalScheme.Hom.IsEtale_ring`. f: Y → X between type-(S) formal schemes is étale: adic, and
--   every reduction f⁻¹(U) ×_U (U, O_U/𝒥) → (U, O_U/𝒥) (U open, 𝒥 an ideal of definition) is an
--   étale morphism of schemes.
-- FormalScheme.Hom.isEtale_iff_forall_thickening: not stated here; needs formal schemes of type (S)
--   with their reductions X_n = (X, O_X/J^{n+1}) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). For an ideal of definition 𝒥 of
--   finite type on X with thickenings X_n = (X, O_X/𝒥^{n+1}): IsEtale f ↔ f adic ∧ ∀ n, Y ×_X X_n →
--   X_n is étale.
-- FormalScheme.Hom.IsEtale.comp: not stated here; needs formal schemes of type (S) with their
--   reductions X_n = (X, O_X/J^{n+1}) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type); its ring-level core is
--   `FormalScheme.Hom.IsEtale_ring.comp`. Composites of étale morphisms are étale; identities are
--   étale.
-- FormalScheme.Hom.IsEtale.of_isOpenImmersion: not stated here; needs formal schemes of type (S)
--   with their reductions X_n = (X, O_X/J^{n+1}) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). Open immersions of type-(S) formal
--   schemes are étale.
-- FormalScheme.Hom.IsEtale.baseChange: not stated here; needs formal schemes of type (S) with their
--   reductions X_n = (X, O_X/J^{n+1}) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). For f: Y → X étale and any morphism
--   g: X' → X of type-(S) formal schemes, X' ×_X Y is of type (S) and the projection X' ×_X Y → X'
--   is étale.
-- FormalScheme.Hom.IsEtale.of_comp: not stated here; needs formal schemes of type (S) with their
--   reductions X_n = (X, O_X/J^{n+1}) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). If g ∘ f and g are étale then f is
--   étale; in particular every X-morphism between objects étale over X is étale.
-- FormalScheme.Hom.IsEtale.reduction: not stated here; needs formal schemes of type (S) with their
--   reductions X_n = (X, O_X/J^{n+1}) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). If f is étale then Y ×_X X_red =
--   Y_red and Y_red → X_red is an étale morphism of schemes (X_red as in node
--   reduced-special-scheme-equivalence).
-- FormalScheme.Hom.isEtale_ofScheme_iff: not stated here; needs formal schemes of type (S) with
--   their reductions X_n = (X, O_X/J^{n+1}) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type); its ring-level core is
--   `FormalScheme.Hom.isEtale_ofScheme_iff_ring`. For a morphism of locally noetherian schemes,
--   viewed as formal schemes with the discrete topology: IsEtale ↔ AlgebraicGeometry.Etale.
-- FormalScheme.Hom.isEtale_iff_smoothFormal: not stated here; needs formal schemes locally of
--   finite type over O_K and their smoothness (supplier: AdicSpacesPartII:R2/smooth-formal-scheme).
--   For formal O_K-schemes locally of tf presentation (K complete of rank one), IsEtale agrees with
--   étaleness in AdicSpacesPartII:R2/smooth-formal-scheme.

/- Ring-level core: `ℤ_p → 𝔽_p` (`p`-adic, resp. discrete topology) is an isomorphism modulo
`p`, but it is not étale: modulo `p²` it is the non-flat map `ℤ/p² → 𝔽_p`. -/
-- test FormalScheme.isEtale_test_reductionOnly (non-example)
--   [H1:formal-adic-comparison/formal-etale-morphism]
example (p : ℕ) [Fact p.Prime] :
    Function.Bijective (Ideal.quotientMap ((Ideal.span {(p : PadicInt p)}).map PadicInt.toZMod)
      PadicInt.toZMod Ideal.le_comap_map) ∧
    ¬ Hom.IsEtale_ring (PadicInt.toZMod : PadicInt p →+* ZMod p) (Ideal.span {(p : PadicInt p)}) :=
  sorry

/- Ring-level core: `ℤ_p → ℤ_p⟦T⟧` with the `(p, T)`-adic topology on the target is not adic
(`p·ℤ_p⟦T⟧` is not an ideal of definition), hence not étale. -/
-- test FormalScheme.isEtale_test_notAdic (non-example)
--   [H1:formal-adic-comparison/formal-etale-morphism]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries (PadicInt p)) :=
      ⟨Ideal.span {PowerSeries.C (p : PadicInt p), PowerSeries.X}⟩
    ¬ Hom.IsEtale_ring (PowerSeries.C : PadicInt p →+* PowerSeries (PadicInt p))
      (Ideal.span {(p : PadicInt p)}) := sorry

/- Ring-level core of the identity case: the identity of an adic ring is étale. (The completed
localisation `Spf A_{f} → Spf A` needs AdicSpacesPartII:F0/completed-localization.) -/
-- test FormalScheme.isEtale_test_openImmersion (degenerate)
--   [H1:formal-adic-comparison/formal-etale-morphism]
example {A : Type*} [CommRing A] [TopologicalSpace A] (J : Ideal A) (hJ : IsAdic J) :
    Hom.IsEtale_ring (RingHom.id A) J := sorry

/- Ring-level core: for noetherian rings with the discrete topology (ideal of definition `0`) the
test is Mathlib's étaleness of ring maps. -/
-- test FormalScheme.isEtale_test_scheme (compatibility)
--   [H1:formal-adic-comparison/formal-etale-morphism]
example {A B : Type*} [CommRing A] [CommRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [TopologicalSpace B] [DiscreteTopology B] (f : A →+* B) :
    Hom.IsEtale_ring f ⊥ ↔ f.Etale := sorry

-- FormalScheme.isEtale_test_unramifiedExtension: not stated here; needs the formal spectra Spf
--   W(F_{p^n}), Spf Z_p[√p] and Spf Z_p (supplier: AdicSpacesPartII:F0/formal-spectrum). Spf
--   W(F_{p^n}) → Spf Z_p is IsEtale for every n ≥ 1, while Spf Z_p[√p] → Spf Z_p (p odd, p-adic
--   topologies) is adic and not IsEtale because Spec F_p[x]/(x²) → Spec F_p is not étale.
--   [computation test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme (definition) -/

-- FormalScheme.SmallEtale: not stated here; needs the étale morphisms of formal schemes of type (S)
--   and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). The category Et/X of type-(S) formal schemes étale
--   over X, with all X-morphisms.
-- FormalScheme.SmallEtale.hasFiniteLimits: not stated here; needs the étale morphisms of formal
--   schemes of type (S) and formal fibre products (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). Et/X
--   has a final object (X) and fibre products, hence all finite limits.
-- FormalScheme.smallEtalePretopology: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). The pretopology of jointly surjective families on
--   Et/X.
-- FormalScheme.smallEtaleTopology: not stated here; needs the étale morphisms of formal schemes of
--   type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). The Grothendieck topology on Et/X generated by
--   smallEtalePretopology.
-- FormalScheme.ofArrows_mem_smallEtaleTopology_iff: not stated here; needs the étale morphisms of
--   formal schemes of type (S) and formal fibre products (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). A
--   family (g_i: Y_i → Y) generates a covering sieve iff |Y| = ∪ g_i(|Y_i|).
-- FormalScheme.SmallEtale.map: not stated here; needs the étale morphisms of formal schemes of type
--   (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). A morphism h: X' → X of type-(S) formal schemes
--   gives the continuous finite-limit-preserving functor Y ↦ X' ×_X Y, with map_id and map_comp
--   isomorphisms.
-- FormalScheme.etaleSheafPushforward: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). h_{et,*}: Sheaf(X'_et) ⥤ Sheaf(X_et), (h_*F)(Y) =
--   F(X' ×_X Y).
-- FormalScheme.etaleSheafPullback: not stated here; needs the étale morphisms of formal schemes of
--   type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). h_et^*, left adjoint to h_{et,*} (Mathlib
--   sheafPullback and sheafAdjunctionContinuous).
-- FormalScheme.SmallEtale.ofOpens: not stated here; needs the étale morphisms of formal schemes of
--   type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). The Zariski site of X embeds into Et/X (U ↦ U),
--   continuously; used for Huber's Remark 3.5.2.
-- FormalScheme.smallEtaleTopology_eq_formalEtaleSiteInvariance: not stated here; needs the étale
--   site of AdicSpacesPartII R2 (supplier: AdicSpacesPartII:R2/formal-etale-site-invariance). For X
--   locally tfp over O_K, X_et is the étale site of
--   AdicSpacesPartII:R2/formal-etale-site-invariance.

-- FormalScheme.smallEtale_test_Spf_Zp: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For X = Spf Z_p, SmallEtale X is equivalent to the
--   category of étale F_p-schemes; {Spf W(F_{p²}) → Spf Z_p} is a covering and Sheaf(X_et, Type) is
--   equivalent to continuous Ẑ-sets. [computation test]
-- FormalScheme.smallEtale_test_field: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For X = Spec k with k a field and the discrete
--   topology, X_et is the small étale site of Spec k; for X = ∅ the site is trivial and its topos
--   is the one-point topos of the empty covering (every sheaf is terminal). [degenerate test]
-- FormalScheme.smallEtale_test_missesClosedPoint: not stated here; needs the étale morphisms of
--   formal schemes of type (S) and formal fibre products (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). For X
--   = Spf Z_p[[T]] with the p-adic topology (X_red = Spec F_p[[T]]), the open immersion {Spf
--   Z_p[[T]]{T} → X} is not a covering: it misses the closed point T = 0 of X_red although it
--   contains the generic point. [non-example test]
-- FormalScheme.smallEtale_test_scheme: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For a locally noetherian scheme X with the discrete
--   topology, FormalScheme.smallEtaleTopology X is Mathlib's
--   AlgebraicGeometry.Scheme.smallEtaleTopology X under the equivalence of categories given by
--   FormalScheme.Hom.isEtale_ofScheme_iff. [compatibility test]
-- FormalScheme.smallEtale_test_slice: not stated here; needs the étale morphisms of formal schemes
--   of type (S) and formal fibre products (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For Y ∈ Et/X the site Y_et is the slice site X_et/Y.
--   [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre (lemma) -/

section EtaleLifting

universe u

/-- H1:formal-adic-comparison/etale-lifting-along-special-fibre (lemma): ring-level core of the
essential surjectivity in part (i) (Berkovich 1994 Lemma 2.1; Stacks Tag 039R): every étale
algebra `B₀` over `A ⧸ J` is the reduction `B ⧸ J·B` of an étale `A`-algebra `B`, compatibly with
the structure maps. -/
theorem exists_etale_lift_ring {A : Type u} [CommRing A] (J : Ideal A) (B₀ : Type u)
    [CommRing B₀] [Algebra (A ⧸ J) B₀] [Algebra.Etale (A ⧸ J) B₀] :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B), Algebra.Etale A B ∧
      ∃ e : B ⧸ J.map (algebraMap A B) ≃+* B₀,
        e.toRingHom.comp (Ideal.quotientMap (J.map (algebraMap A B)) (algebraMap A B)
          Ideal.le_comap_map) = algebraMap (A ⧸ J) B₀ := sorry

/-- H1:formal-adic-comparison/etale-lifting-along-special-fibre (lemma): ring-level core of part
(ii) in case (a) of type (S) (Huber 1996 §3.5; Berkovich 1994 Lemma 2.1): over a noetherian ring
`A`, the `J`-adic completion `B^` of an étale `A`-algebra `B` is noetherian, so `Spf B^` is of
type (S). -/
theorem isNoetherianRing_adicCompletion_of_etale_ring {A B : Type*} [CommRing A] [CommRing B]
    [Algebra A B] [Algebra.Etale A B] [IsNoetherianRing A] (J : Ideal A) :
    IsNoetherianRing (AdicCompletion (J.map (algebraMap A B)) B) := sorry

end EtaleLifting

-- FormalScheme.smallEtaleEquivThickening: not stated here; needs formal schemes of type (S) and
--   adic systems of étale lifts (supplier:
--   AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type); its ring-level cores are
--   `FormalScheme.exists_etale_lift_ring` and
--   `FormalScheme.isNoetherianRing_adicCompletion_of_etale_ring`. Statement
--   (H1:formal-adic-comparison/etale-lifting-along-special-fibre): Let X be a formal scheme of type
--   (S), 𝒥 ⊆ O_X an ideal of definition of finite type and X_n = (X, O_X/𝒥^{n+1}). (i) The functor
--   Et/X → Et/X_0 (Mathlib `AlgebraicGeometry.Scheme.Etale X_0`), Y ↦ Y_0 := Y ×_X X_0, is an
--   equivalence of categories; a quasi-inverse sends an étale X_0-scheme V to the formal scheme
--   attached to the adic system (V_n)_n of its unique étale lifts V_n → X_n. (ii) If X = Spf A with
--   A as in (S), J ⊆ A the corresponding finitely generated ideal of definition, and B an étale
--   A-algebra with J-adic completion B^, then Spf B^ → Spf A is étale and Spf B^ is of type (S) (A
--   noetherian ⇒ B^ noetherian; in case (b), B^(1/s) is topologically of finite type over A(1/s),
--   hence strongly noetherian); every object of Et/Spf A is covered by open formal subschemes of
--   this form, and B may be taken standard étale.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence (comparison) -/

section ReducedSpecial

universe u

/-- H1:formal-adic-comparison/reduced-special-scheme-equivalence (comparison): scheme-level core
for `X = Spf A` (Huber 1996 §3.5, p. 201; Stacks Tag 04DZ). The closed immersion
`Spec (A ⧸ √J) → Spec (A ⧸ J)` is a universal homeomorphism, so the categories of schemes étale
over the reduction `X_J = Spec (A ⧸ J)` and over `X_red = Spec (A ⧸ √J)` are equivalent (Mathlib
`AlgebraicGeometry.Scheme.Etale`). -/
theorem smallEtaleEquivRed_ring {A : Type u} [CommRing A] (J : Ideal A) :
    Nonempty ((Spec (CommRingCat.of (A ⧸ J))).Etale ≌
      (Spec (CommRingCat.of (A ⧸ J.radical))).Etale) := sorry

/-- H1:formal-adic-comparison/reduced-special-scheme-equivalence (comparison): scheme-level core
of the equivalence of topoi `X~ ≃ (X_red)~` for `X = Spf A` (Huber 1996 §3.5, p. 201; Stacks Tag
04DZ): the sheaves of sets on the small étale sites (Mathlib
`AlgebraicGeometry.Scheme.smallEtaleTopology`) of `Spec (A ⧸ J)` and of `Spec (A ⧸ √J)` form
equivalent categories. -/
theorem etaleToposEquivRed_ring {A : Type u} [CommRing A] (J : Ideal A) :
    Nonempty (Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of (A ⧸ J)))) (Type u) ≌
      Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of (A ⧸ J.radical)))) (Type u)) :=
  sorry

end ReducedSpecial

-- FormalScheme.smallEtaleEquivRed: not stated here; needs the reduced special scheme X_red of a
--   formal scheme of type (S) (supplier: AdicSpacesPartII:F0/ideal-of-definition); its scheme-level
--   core for X = Spf A is `FormalScheme.smallEtaleEquivRed_ring`. Statement
--   (H1:formal-adic-comparison/reduced-special-scheme-equivalence): Let X be a formal scheme of
--   type (S) and 𝒯 ⊆ O_X the ideal of sections vanishing at every point (affine-locally the ideal
--   √J of topologically nilpotent elements of A, J an ideal of definition). Then X_red := (|X|,
--   O_X/𝒯) is a reduced scheme with underlying space |X|; for every ideal of definition 𝒥 one has 𝒥
--   ⊆ 𝒯 and X_red → X_𝒥 = (X, O_X/𝒥) is a closed immersion which is a homeomorphism, hence a
--   universal homeomorphism. The functor ρ_X: Et/X → Et/X_red, Y ↦ Y ×_X X_red (= Y_red), is an
--   equivalence of categories which preserves finite limits and preserves and reflects coverings;
--   hence ρ_X is an equivalence of sites X_et ≃ (X_red)_et and induces an equivalence of topoi X~ ≃
--   (X_red)~. It is natural in X: for a morphism h: X' → X of type-(S) formal schemes, ρ_{X'} ∘ (X'
--   ×_X −) ≅ (X'_red ×_{X_red} −) ∘ ρ_X. In general 𝒯 is not an ideal of definition (for X = Spf
--   O_{C_p}, 𝒯 = m and m² = m), so X_red need not be any thickening X_𝒥.
-- FormalScheme.etaleToposEquivRed: not stated here; needs the reduced special scheme X_red of a
--   formal scheme of type (S) (supplier: AdicSpacesPartII:F0/ideal-of-definition); its scheme-level
--   core for X = Spf A is `FormalScheme.etaleToposEquivRed_ring`. Statement
--   (H1:formal-adic-comparison/reduced-special-scheme-equivalence): Let X be a formal scheme of
--   type (S) and 𝒯 ⊆ O_X the ideal of sections vanishing at every point (affine-locally the ideal
--   √J of topologically nilpotent elements of A, J an ideal of definition). Then X_red := (|X|,
--   O_X/𝒯) is a reduced scheme with underlying space |X|; for every ideal of definition 𝒥 one has 𝒥
--   ⊆ 𝒯 and X_red → X_𝒥 = (X, O_X/𝒥) is a closed immersion which is a homeomorphism, hence a
--   universal homeomorphism. The functor ρ_X: Et/X → Et/X_red, Y ↦ Y ×_X X_red (= Y_red), is an
--   equivalence of categories which preserves finite limits and preserves and reflects coverings;
--   hence ρ_X is an equivalence of sites X_et ≃ (X_red)_et and induces an equivalence of topoi X~ ≃
--   (X_red)~. It is natural in X: for a morphism h: X' → X of type-(S) formal schemes, ρ_{X'} ∘ (X'
--   ×_X −) ≅ (X'_red ×_{X_red} −) ∘ ρ_X. In general 𝒯 is not an ideal of definition (for X = Spf
--   O_{C_p}, 𝒯 = m and m² = m), so X_red need not be any thickening X_𝒥.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-of-etale-morphism (lemma) -/

-- FormalScheme.Hom.IsEtale.genericFibre: not stated here; needs the generic fibre d(X) as an adic
--   space and étale morphisms of adic spaces (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d,
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale). Statement
--   (H1:formal-adic-comparison/generic-fibre-of-etale-morphism): Let f: Y → X be an étale morphism
--   of formal schemes of type (S) (node formal-etale-morphism). (i) d(f): d(Y) → d(X) is an étale
--   morphism of adic spaces (Huber's sense,
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale; equivalently AdicEtaleGeometry A1's,
--   AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison, since d(X) is analytic
--   and locally noetherian), and λ_X ∘ d(f) = f ∘ λ_Y. (ii) If X = Spf A with A as in (S), J ⊆ A
--   the ideal of definition and Y = Spf B^ for an étale A-algebra B, then the comparison morphism
--   φ: d(Spf B^) → Spec B ×_{Spec A} d(Spf A) of Huber (1.9.5)
--   (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison, with Spec B ×_{Spec A} d(Spf
--   A) the fibre product of AdicSpacesPartII:R1/scheme-fibre-product-analytification) is an open
--   embedding. (iii) For an étale Y → X and an adic morphism g: X' → X of type-(S) formal schemes,
--   the natural morphism d(X' ×_X Y) → d(X') ×_{d(X)} d(Y) is an isomorphism; in particular d(Y ×_X
--   Y') ≅ d(Y) ×_{d(X)} d(Y') for Y, Y' ∈ Et/X, and d sends open immersions to open immersions.
-- FormalScheme.genericFibre_pullback_iso_of_isEtale: not stated here; needs fibre products of adic
--   spaces and the generic fibre functor d (supplier:
--   AdicSpacesPartII:R2/generic-fibre-fibre-products). Statement
--   (H1:formal-adic-comparison/generic-fibre-of-etale-morphism): Let f: Y → X be an étale morphism
--   of formal schemes of type (S) (node formal-etale-morphism). (i) d(f): d(Y) → d(X) is an étale
--   morphism of adic spaces (Huber's sense,
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale; equivalently AdicEtaleGeometry A1's,
--   AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison, since d(X) is analytic
--   and locally noetherian), and λ_X ∘ d(f) = f ∘ λ_Y. (ii) If X = Spf A with A as in (S), J ⊆ A
--   the ideal of definition and Y = Spf B^ for an étale A-algebra B, then the comparison morphism
--   φ: d(Spf B^) → Spec B ×_{Spec A} d(Spf A) of Huber (1.9.5)
--   (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison, with Spec B ×_{Spec A} d(Spf
--   A) the fibre product of AdicSpacesPartII:R1/scheme-fibre-product-analytification) is an open
--   embedding. (iii) For an étale Y → X and an adic morphism g: X' → X of type-(S) formal schemes,
--   the natural morphism d(X' ×_X Y) → d(X') ×_{d(X)} d(Y) is an isomorphism; in particular d(Y ×_X
--   Y') ≅ d(Y) ×_{d(X)} d(Y') for Y, Y' ∈ Et/X, and d sends open immersions to open immersions.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-point-lifting (lemma) -/

section PointLifting

universe u

/-- H1:formal-adic-comparison/specialization-point-lifting (lemma): ring-level core of Huber 1996
Lemma 3.5.1(i), second part (proof of Lemma 3.5.1, p. 202): let `A → B` be étale, `V` a valuation
ring of a field `K` with a ring map `φ : A → V`, and `y` a prime of `B` over the centre
`φ⁻¹(𝔪_V)`. Then there are a field extension `ι : K → L`, a valuation ring `W` of `L` with
`W ∩ K = V`, and a ring map `ψ : B → W` extending `φ` whose centre `ψ⁻¹(𝔪_W)` is `y`. (Going-down
for the flat map `V → B ⊗_A V` and domination of valuation rings.) -/
theorem exists_valuationSubring_lift_of_etale {A B K : Type u} [CommRing A] [CommRing B]
    [Field K] [Algebra A B] [Algebra.Etale A B] (V : ValuationSubring K) (φ : A →+* V)
    (y : Ideal B) [y.IsPrime]
    (hy : y.comap (algebraMap A B) = (IsLocalRing.maximalIdeal V).comap φ) :
    ∃ (L : Type u) (_ : Field L) (ι : K →+* L) (W : ValuationSubring L) (ψ : B →+* W),
      W.comap ι = V ∧
      W.subtype.comp (ψ.comp (algebraMap A B)) = ι.comp (V.subtype.comp φ) ∧
      (IsLocalRing.maximalIdeal W).comap ψ = y := sorry

end PointLifting

-- FormalScheme.Hom.IsEtale.exists_specialisation_lift: not stated here; needs the generic fibre
--   d(X) and the specialisation map λ_X (supplier: AdicSpacesPartII:R2/specialisation-map); its
--   ring-level core is `FormalScheme.exists_valuationSubring_lift_of_etale`. Statement
--   (H1:formal-adic-comparison/specialization-point-lifting): Let f: Y → X be an étale morphism of
--   formal schemes of type (S). For every y ∈ |Y| and every s ∈ d(X) with f(y) = λ_X(s) there is t
--   ∈ d(Y) with λ_Y(t) = y and d(f)(t) = s. Consequently, if a family (g_i: Y_i → Y) in Et/X is
--   jointly surjective on |Y|, then (d(g_i): d(Y_i) → d(Y)) is jointly surjective on d(Y).

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda (construction) -/

-- FormalScheme.specialisationFunctor: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). u_X: FormalScheme.SmallEtale X ⥤
--   AdicSpace.smallEtale (d X), Y ↦ d(Y).
-- FormalScheme.specialisationFunctor.isContinuous: not stated here; needs the generic fibre d(X) as
--   an adic space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). u_X is continuous for smallEtaleTopology
--   and AdicSpace.smallEtaleTopology and preserves finite limits.
-- FormalScheme.specialisationPushforward: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). λ_{X*}: Sheaf(d(X)_et) ⥤ Sheaf(X_et),
--   (λ_*F)(Y) = F(d(Y)).
-- FormalScheme.specialisationPullback: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). λ_X^*: Sheaf(X_et) ⥤ Sheaf(d(X)_et),
--   exact.
-- FormalScheme.specialisationAdjunction: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). λ_X^* ⊣ λ_{X*}.
-- FormalScheme.specialisationFunctor_opens: not stated here; needs the generic fibre d(X) as an
--   adic space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). u_X(U) = d(U) = λ_X⁻¹(U) for Zariski
--   opens U (Remark 3.5.2).
-- FormalScheme.specialisationFunctor_map: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). For adic g: X' → X, u_{X'}(X' ×_X Y) ≅
--   d(X') ×_{d(X)} u_X(Y) naturally in Y; hence g_et ∘ λ_{X'} ≅ λ_X ∘ d(g)_et.
-- FormalScheme.specialisationRed: not stated here; needs the generic fibre d(X) as an adic space,
--   its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). The composite of λ_X with X_et ≃
--   (X_red)_et; its inverse image sends an étale X_red-scheme V to d of the étale lift of V.
-- FormalScheme.specialisation_stalk: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). For a geometric point ξ of d(X):
--   (λ_X^*F)_ξ ≅ F_{λ_X(ξ)}, the stalk at the composite point.
-- FormalScheme.specialisationPushforward_sections: not stated here; needs the generic fibre d(X) as
--   an adic space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). Γ(X_et, λ_{X*}F) = Γ(d(X)_et, F).

-- FormalScheme.specialisation_test_Spf_OK: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). For X = Spf O_K (K complete, rank one,
--   residue field k), u_X sends Spf O_L (L/K finite unramified) to Spa(L, O_L); λ_{X*} of the sheaf
--   given by a continuous Gal(K^sep/K)-set M is the Gal(k^sep/k)-set M^{I_K}. [computation test]
-- FormalScheme.specialisation_test_zariski: not stated here; needs the generic fibre d(X) as an
--   adic space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). For an open U ⊆ X, u_X(U) = d(U) is the
--   open subspace λ_X⁻¹(U) of AdicSpacesPartII:R2/specialisation-map. [compatibility test]
-- FormalScheme.specialisation_test_notEssSurj: not stated here; needs the generic fibre d(X) as an
--   adic space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). For X = Spf Z_p, the finite étale cover
--   Spa(Q_p(√p)) → Spa(Q_p, Z_p) is not isomorphic to u_X(Y) for any Y ∈ Et/X: λ_X is a morphism of
--   sites, not an equivalence. [non-example test]
-- FormalScheme.specialisation_test_cover: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). u_X sends the covering {Spf W(F_{p²}) →
--   Spf Z_p} to the covering {Spa(Q_{p²}) → Spa(Q_p)}. [characterisation test]
-- FormalScheme.specialisation_test_empty: not stated here; needs the generic fibre d(X) as an adic
--   space, its étale site and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/specialisation-map,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). If X is a scheme with the discrete
--   topology (ideal of definition 0), d(X) = ∅, λ_{X*}F = * (the terminal sheaf) for every F.
--   [degenerate test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda (lemma) -/

-- FormalScheme.higherDirectImage_specialisation_iso_sheafify: not stated here; needs derived direct
--   images for the specialisation morphism of sites λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). Statement
--   (H1:formal-adic-comparison/higher-direct-images-of-lambda): Let X be a formal scheme of type
--   (S), E a ring and F a sheaf of E-modules on d(X)_et. (i) R^nλ_{X*}F is the sheaf on X_et
--   associated with the presheaf Y ↦ H^n(d(Y), F|_{d(Y)}). (ii) For a geometric point ȳ of X_red (a
--   point of X~ via node reduced-special-scheme-equivalence), (R^nλ_{X*}F)_ȳ = colim H^n(d(Y), F),
--   the colimit over the cofiltered category of étale neighbourhoods (Y, u) of ȳ in X_et. (iii) For
--   K ∈ D⁺(d(X)_et, E) there is a natural isomorphism R⁺Γ(d(X), K) ≅ R⁺Γ(X_red, R⁺λ_{X*}K) and a
--   spectral sequence E_2^{pq} = H^p(X_red, R^qλ_{X*}K) ⇒ H^{p+q}(d(X), K).

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports (construction) -/

-- FormalScheme.Pair: not stated here; needs formal schemes of type (S) and their morphisms
--   (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0). A pair (X, L): X
--   a formal scheme of type (S), L ⊆ |X|.
-- FormalScheme.Pair.Hom: not stated here; needs formal schemes of type (S) and their morphisms
--   (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0). Morphisms of
--   pairs f: (X', L') → (X, L), f(L') ⊆ L; identities and composition make pairs a category.
-- FormalScheme.Pair.supportSpace: not stated here; needs pseudo-adic spaces with their étale sites
--   and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). d(X, L) = (d(X), λ_X⁻¹(L)), a prepseudo-adic space.
-- FormalScheme.Pair.isPseudoAdic_supportSpace: not stated here; needs pseudo-adic spaces with their
--   étale sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). If L is convex and locally pro-constructible (in
--   particular locally closed) then d(X, L) is a pseudo-adic space.
-- FormalScheme.Pair.supportSpace_map: not stated here; needs pseudo-adic spaces with their étale
--   sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). An adic morphism of pairs f induces d(f): d(X', L') →
--   d(X, L), with d(id) = id and d(g ∘ f) = d(g) ∘ d(f).
-- FormalScheme.Pair.supportSpace_univ: not stated here; needs pseudo-adic spaces with their étale
--   sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). d(X, |X|) = d(X).
-- FormalScheme.Pair.supportSpace_mono: not stated here; needs pseudo-adic spaces with their étale
--   sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). For L' ⊆ L the identity of X is a morphism of pairs i:
--   (X, L') → (X, L) and d(i) is the inclusion of supports λ_X⁻¹(L') ⊆ λ_X⁻¹(L).
-- FormalScheme.Pair.supportSpace_isOpen: not stated here; needs pseudo-adic spaces with their étale
--   sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). For L = U open, d(X, U) = d(U) (the open subspace
--   λ_X⁻¹(U)).
-- FormalScheme.Pair.supportSpace_isClosed: not stated here; needs pseudo-adic spaces and tubes
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site, AdicSpacesPartII:R2/tube).
--   For L closed, the support λ_X⁻¹(L) is closed in d(X) and contains the tube ]L[ as its interior
--   (AdicSpacesPartII:R2/tube).

-- FormalScheme.Pair.supportSpace_test_closedPoint: not stated here; needs pseudo-adic spaces with
--   their étale sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). X = Spf Z_p⟨T⟩, L = {(p, T)}: the support of d(X, L)
--   is {x : |T(x)| < 1}, closed and not open in d(X), and it contains the rank-two point η_{1⁻}.
--   [computation test]
-- FormalScheme.Pair.supportSpace_test_notTube: not stated here; needs pseudo-adic spaces and tubes
--   (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site, AdicSpacesPartII:R2/tube).
--   In the previous example the support λ_X⁻¹(L) is strictly larger than the tube ]L[ of
--   AdicSpacesPartII:R2/tube (it contains η_{1⁻}); a definition by tubes gives a different
--   pseudo-adic space. [non-example test]
-- FormalScheme.Pair.supportSpace_test_univ: not stated here; needs pseudo-adic spaces with their
--   étale sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). d(X, |X|) = d(X) and d(X, ∅) is the empty pseudo-adic
--   space. [degenerate test]
-- FormalScheme.Pair.supportSpace_test_open: not stated here; needs pseudo-adic spaces with their
--   étale sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). For X = Spf A and L = D(f) open, d(X, L) = d(Spf
--   A_{f}), the rational subset {|f| ≥ 1} = {|f| = 1} of d(X) with its full support.
--   [compatibility test]
-- FormalScheme.Pair.supportSpace_test_microbialRankTwo: not stated here; needs pseudo-adic spaces
--   with their étale sites and the specialisation map λ_X (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   AdicSpacesPartII:R2/specialisation-map). For A a microbial valuation ring of rank two with
--   fraction field K and X = Spf A, d(X) = Spa(K, A) has two points (A and its rank-one
--   generization K°); for L the closed point of X, the support of d(X, L) is the closed point of
--   Spa(K, A) only. [computation test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site (construction) -/

-- FormalScheme.Pair.SmallEtale: not stated here; needs the étale site of a pair (X, L), built on
--   formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). The category of pairs (Y, S), Y ∈ Et/X, S open in
--   g⁻¹(L).
-- FormalScheme.Pair.smallEtaleTopology: not stated here; needs the étale site of a pair (X, L),
--   built on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). Coverings: (h_i: (Y_i, S_i) → (Y, S)) with S = ∪
--   h_i(S_i).
-- FormalScheme.Pair.SmallEtale.hasFiniteLimits: not stated here; needs the étale site of a pair (X,
--   L), built on formal schemes of type (S) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). Final
--   object (X, L) and fibre products (Y_1 ×_Y Y_2, pr_1⁻¹S_1 ∩ pr_2⁻¹S_2).
-- FormalScheme.Pair.SmallEtale.map: not stated here; needs the étale site of a pair (X, L), built
--   on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). A morphism of pairs f: (X', L') → (X, L) gives the
--   continuous finite-limit-preserving functor (Y, S) ↦ (X' ×_X Y, pr⁻¹S ∩ q⁻¹L'), with map_id and
--   map_comp.
-- FormalScheme.Pair.toposUnivEquiv: not stated here; needs the étale site of a pair (X, L), built
--   on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). X~ ≃ (X, |X|)~ induced by Y ↦ (Y, |Y|).
-- FormalScheme.Pair.restrictSupport: not stated here; needs the étale site of a pair (X, L), built
--   on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For L' ⊆ L, the morphism of sites i: (X, L')_et →
--   (X, L)_et, with i^*(Y, S) = (Y, S ∩ g⁻¹L').
-- FormalScheme.Pair.extendByZero: not stated here; needs the étale site of a pair (X, L) and
--   sheaves of modules on it (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). For L' open in L, i_!: left
--   adjoint of i^* on sheaves of E-modules, exact, with i^* i_! ≅ id and i''^* i_! = 0 for the
--   closed complement L'' = L − L'.
-- FormalScheme.Pair.ofArrows_mem_smallEtaleTopology_iff: not stated here; needs the étale site of a
--   pair (X, L), built on formal schemes of type (S) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). A
--   family generates a covering sieve iff the images of the supports cover S.

-- FormalScheme.Pair.smallEtale_test_univ: not stated here; needs the étale site of a pair (X, L),
--   built on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). (X, |X|)~ ≃ X~, and (X, ∅)~ is the one-point topos:
--   every object (Y, ∅) is covered by the empty family. [degenerate test]
-- FormalScheme.Pair.smallEtale_test_closedPoint: not stated here; needs the étale site of a pair
--   (X, L), built on formal schemes of type (S) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). For X
--   = Spf Z_p⟨T⟩ and L the closed point (p, T), (X, L)~ is equivalent to the category of continuous
--   Gal(F̄_p/F_p)-sets. [computation test]
-- FormalScheme.Pair.smallEtale_test_neighbourhood: not stated here; needs the étale site of a pair
--   (X, L), built on formal schemes of type (S) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). For an
--   open neighbourhood U of L, the one-element family {(U, L) → (X, L)} is a covering of (X, L)
--   although U → X is not surjective: the site only sees L. [characterisation test]
-- FormalScheme.Pair.smallEtale_test_notPointwise: not stated here; needs the étale site of a pair
--   (X, L), built on formal schemes of type (S) (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:F0/formal-fibre-product). For L
--   ≠ ∅, the one-element family {(X, ∅) → (X, L)} given by the identity of X with empty support is
--   not a covering of (X, L), although its underlying morphism of formal schemes is an isomorphism;
--   a definition testing coverings on Y instead of on the supports S would accept it.
--   [non-example test]
-- FormalScheme.Pair.smallEtale_test_scheme: not stated here; needs the étale site of a pair (X, L),
--   built on formal schemes of type (S) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   AdicSpacesPartII:F0/formal-fibre-product). For X a locally noetherian scheme with the discrete
--   topology and L locally closed, (X, L)~ is the étale topos of the reduced subscheme L_red (node
--   pair-topos-reduced-subscheme-3-5-5). [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism (construction) -/

-- FormalScheme.Pair.specialisationFunctor: not stated here; needs étale sites of pseudo-adic spaces
--   and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). u_(X,L): (Y, S) ↦ d(Y, S) = (d(Y),
--   λ_Y⁻¹(S)).
-- FormalScheme.Pair.specialisationFunctor.isContinuous: not stated here; needs étale sites of
--   pseudo-adic spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). u_(X,L) is continuous and preserves
--   finite limits.
-- FormalScheme.Pair.specialisationPushforward: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). λ_*: Sheaf(d(X, L)_et) ⥤ Sheaf((X,
--   L)_et), (λ_*F)(Y, S) = F(d(Y, S)).
-- FormalScheme.Pair.specialisationPullback: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). λ^*, exact, left adjoint to λ_*.
-- FormalScheme.Pair.specialisationAdjunction: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). λ^* ⊣ λ_*.
-- FormalScheme.Pair.derivedSpecialisationPushforward: not stated here; needs étale sites of
--   pseudo-adic spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). R⁺λ_*: D⁺(d(X, L)_et, E) ⥤ D⁺((X, L)_et,
--   E) for every ring E.
-- FormalScheme.Pair.specialisation_univ: not stated here; needs étale sites of pseudo-adic spaces
--   and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). λ_(X,|X|) = λ_X under (X, |X|)~ ≃ X~ and
--   d(X, |X|) = d(X).
-- FormalScheme.Pair.specialisation_restrict: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). For L' ⊆ L: i ∘ λ_(X,L') ≅ λ_(X,L) ∘
--   d(i) (the square of node pair-specialization-functoriality-3-5-4 for the identity of X).

-- FormalScheme.Pair.specialisation_test_univ: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). For L = |X|, λ_(X,|X|) is λ_X under (X,
--   |X|)~ ≃ X~; for L = ∅ both topoi are trivial. [degenerate test]
-- FormalScheme.Pair.specialisation_test_OK: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). X = Spf O_K, L the closed point: λ_*
--   sends a continuous Gal(K^sep/K)-set M to M^{I_K}. [computation test]
-- FormalScheme.Pair.specialisation_test_cover: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). For X = Spf Z_p⟨T⟩ and L = |X|, the
--   Zariski covering {(X{T}, ·), (X{T−1}, ·)} (D(T) ∪ D(T−1) = A^1_{F_p}) is sent to the covering
--   {|T| = 1} ∪ {|T − 1| = 1} of the closed unit disc: every point has |T| = 1 or |T − 1| = 1.
--   [characterisation test]
-- FormalScheme.Pair.specialisation_test_tube: not stated here; needs étale sites of pseudo-adic
--   spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Replacing λ_Y⁻¹(S) by the tube ]S[ does
--   not give a functor to d(X, L)_et preserving coverings: for L closed, the point η_{1⁻} ∈
--   λ_X⁻¹(L) is not in ]L[. [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4 (lemma) -/

-- FormalScheme.Pair.specialisationSquare: not stated here; needs étale sites of pseudo-adic spaces
--   and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4): Let f: (X', L') → (X, L)
--   be an adic morphism of pairs with L, L' convex and locally pro-constructible. Then the square
--   of morphisms of sites formed by λ_(X',L'), λ_(X,L), d(f)_et: d(X', L')_et → d(X, L)_et and
--   f_et: (X', L')_et → (X, L)_et commutes up to a canonical isomorphism: for (Y, S) ∈ (X, L)_et,
--   d(X' ×_X Y, S') ≅ d(X', L') ×_{d(X,L)} d(Y, S) with S' = pr⁻¹(S) ∩ q⁻¹(L'), naturally in (Y,
--   S). Consequently f^* ∘ λ_* ⟶ λ'_* ∘ d(f)^* and, for every ring E, the base-change
--   transformation f^* ∘ R⁺λ_(X,L)* ⟶ R⁺λ_(X',L')* ∘ d(f)^* on D⁺(d(X, L)_et, E) are defined.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5 (comparison) -/

-- FormalScheme.Pair.toposEquivRed: not stated here; needs the étale site of a pair (X, L) and the
--   reduced subscheme L_red of X_red (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S,
--   SchemeAndStackFoundations:SF.2). Statement
--   (H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5): Let (X, L) be a pair with L
--   locally closed in |X| or L = {y} a single point, and let L_red be the reduced locally closed
--   subscheme of X_red with underlying space L (for L = {y}: Spec κ(y)). The functor φ⁻¹: (X, L)_et
--   → Et/L_red, (Y, S) ↦ the open subscheme of L_red ×_{X_red} Y_red with underlying set S (S is
--   open in g⁻¹(L) = |L_red ×_{X_red} Y_red|), is continuous and preserves finite limits, so it
--   defines a morphism of sites φ: (L_red)_et → (X, L)_et, and the induced morphism of topoi φ~:
--   (L_red)~ → (X, L)~ is an equivalence. Henceforth (X, L)~ is identified with (L_red)~; for L =
--   |X| this is node reduced-special-scheme-equivalence.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-over-microbial-valuation-ring (lemma) -/

section MicrobialSpecialisation

universe u

/-- H1:formal-adic-comparison/specialization-over-microbial-valuation-ring (lemma): ring-level
core of part (ii) (Wedhorn Definition 5.46, Example 7.17): for a valuation ring `B` of an
algebraically closed field `C` and a prime `q` of `B` (for `q = √(sB)`, the height-one prime of a
microbial `B`, `Spec (B ⧸ q)` is `X_red` for `X = Spf B`), the quotient `B ⧸ q` is a henselian
valuation ring whose residue field (that of `B`) is algebraically closed, hence a strictly
henselian local ring: étale morphisms into `X_red` have sections through the closed point. -/
theorem valuationRing_henselianLocalRing_quotient_ring {C : Type u} [Field C] [IsAlgClosed C]
    (B : ValuationSubring C) (q : Ideal B) [q.IsPrime] :
    ValuationRing (B ⧸ q) ∧ HenselianLocalRing (B ⧸ q) ∧
      IsAlgClosed (IsLocalRing.ResidueField B) := sorry

end MicrobialSpecialisation

-- FormalScheme.specialisation_homeomorph_of_microbial: not stated here; needs the generic fibre
--   d(Spf B) = Spa(C, B) and the specialisation map λ_X (supplier:
--   AdicSpacesPartII:R2/specialisation-map, AdicEtaleGeometry:A1/geometric-point-etale-split); its
--   ring-level core is `FormalScheme.valuationRing_henselianLocalRing_quotient_ring`. Statement
--   (H1:formal-adic-comparison/specialization-over-microbial-valuation-ring): Let B be a complete
--   microbial valuation ring (Wedhorn Definition 5.46) with algebraically closed fraction field C,
--   and X = Spf B with the valuation topology (of type (S):
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, API spf_microbial). Then (i) d(X) = Spa(C, B) and
--   λ_X: d(X) → |X| is a homeomorphism: both are the chain of valuation rings V with B ⊆ V ⊆ C° ↔
--   primes p of B containing the height-one prime q = √(sB) (V = B_p); (ii) X_red = Spec(B/q) with
--   B/q a valuation ring whose fraction field is algebraically closed, hence a strictly henselian
--   local ring, and every étale morphism into X_red, into X, or into d(X) has, through every point
--   over the closed point, a section which is an open immersion
--   (AdicEtaleGeometry:A1/geometric-point-etale-split for d(X)); (iii) consequently, for sheaves F
--   on X_et and G on d(X)_et, the stalk of F at the closed point is F(X), the stalk of G at the
--   closed point of Spa(C, B) is G(d(X)), and (λ_X^*F)_{closed} ≅ F(X).

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/constructibility-and-stalks-of-lambda-pullback (lemma) -/

-- FormalScheme.Pair.specialisationPullback_stalkIso: not stated here; needs geometric points of
--   adic spaces and étale sites of pseudo-adic spaces (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Statement
--   (H1:formal-adic-comparison/constructibility-and-stalks-of-lambda-pullback): Let X be a formal
--   scheme of type (S), L ⊆ |X| locally closed and λ = λ_(X,L). Let x ∈ |d(X, L)| = λ_X⁻¹(L), y :=
--   λ_X(x) ∈ L, and let x̄: Spa(C, C⁺) → d(X) be a geometric point with support x
--   (AdicEtaleGeometry:A1/etale-site-and-geometric-points; C complete algebraically closed, C⁺ an
--   open bounded valuation ring of any rank). The composite point λ(x̄) of (X, L)~ ≃ (L_red)~ is
--   the geometric point ȳ: Spec k_{C⁺} → L_red over y given by the residue field k_{C⁺} of C⁺
--   (algebraically closed, and κ(y) → k_{C⁺} because y is the centre of x). For every sheaf F on
--   (X, L)_et there is a natural isomorphism of stalks (λ^*F)_x̄ ≅ F_ȳ. In particular λ^* creates
--   no cohomology: all cohomology of the comparison comes from R⁺λ_*.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/lambda-pullback-constructible-3-5-6-i (lemma) -/

-- FormalScheme.Pair.isConstructible_specialisationPullback: not stated here; needs constructible
--   sheaves on pseudo-adic spaces and on schemes (supplier:
--   ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves,
--   SchemeAndStackFoundations:SF.2). Statement
--   (H1:formal-adic-comparison/lambda-pullback-constructible-3-5-6-i): Let X be a formal scheme of
--   type (S), L ⊆ |X| locally closed, Λ a noetherian ring and λ = λ_(X,L). If F is a constructible
--   sheaf of Λ-modules on (X, L)_et ≃ (L_red)_et (constructible in the sense of schemes: locally on
--   L_red there is a finite partition into locally closed constructible subsets on whose reduced
--   subschemes F is locally constant with finitely generated stalks), then λ^*F is a constructible
--   sheaf of Λ-modules on the pseudo-adic space d(X, L) in the classical analytic sense of
--   ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves (locally a finite partition
--   into locally closed, locally constructible subsets on which the sheaf is locally constant of
--   finite type).

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7 (construction) -/

-- FormalScheme.StrictLocalisationSystem: not stated here; needs strict localisations of schemes and
--   formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). The data (U = Spf A, B, J, y, ȳ, I, (Y_i, u_i)) of
--   (3.5.7).
-- FormalScheme.StrictLocalisationSystem.isCofiltered: not stated here; needs strict localisations
--   of schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). The index category I is cofiltered and essentially
--   small.
-- FormalScheme.StrictLocalisationSystem.completion: not stated here; needs strict localisations of
--   schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). i ↦ Y_i^ ∈ Et/X with f_i: Y_i^ → X and the points z_i;
--   transition maps adic.
-- FormalScheme.StrictLocalisationSystem.completionInfty: not stated here; needs strict
--   localisations of schemes and formal completions of type (S) (supplier:
--   SchemeAndStackFoundations:SF.2, AdicSpacesPartII:F0/formal-completion). Y_∞^ = Spf
--   (O^sh_{Y,ȳ})^_J, f: Y_∞^ → X, and its closed point z.
-- FormalScheme.StrictLocalisationSystem.limit_iso: not stated here; needs strict localisations of
--   schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). lim_I Y_i ≅ Spec O^sh_{Y,ȳ} (strict localisation).
-- FormalScheme.StrictLocalisationSystem.completion_isEtale: not stated here; needs strict
--   localisations of schemes and formal completions of type (S) (supplier:
--   SchemeAndStackFoundations:SF.2, AdicSpacesPartII:F0/formal-completion). Each Y_i^ → U is étale
--   and Y_i^ is of type (S).
-- FormalScheme.StrictLocalisationSystem.cofinal: not stated here; needs strict localisations of
--   schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). The (Y_i^, u_i) are cofinal among étale neighbourhoods
--   of x̄ in X_et.
-- FormalScheme.StrictLocalisationSystem.isTypeS_infty_of_isNoetherian: not stated here; needs
--   strict localisations of schemes and formal completions of type (S) (supplier:
--   SchemeAndStackFoundations:SF.2, AdicSpacesPartII:F0/formal-completion). If A is noetherian,
--   Y_∞^ is of type (S).
-- FormalScheme.StrictLocalisationSystem.tildeLimit: not stated here; needs Huber's tilde-limits of
--   pseudo-adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/huber-tilde-limit). If Y_∞^ is of
--   type (S): d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L)) and d(Y_∞^, {z}) ~ lim_I d(Y_i^, {z_i})
--   (Huber tilde-limits).

-- FormalScheme.strictLocalisationSystem_test_OK: not stated here; needs strict localisations of
--   schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). For X = Spf O_K (K complete discretely valued) and x
--   the closed point, Y_∞ = Spec O_K^sh and Y_∞^ = Spf O_{K̆}; d(Y_∞^) is the single point Spa(K̆,
--   O_{K̆}). [computation test]
-- FormalScheme.strictLocalisationSystem_test_zariski: not stated here; needs strict localisations
--   of schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). Replacing I by Zariski neighbourhoods of y gives Y_∞ =
--   Spec B_y (for X = Spf Z_p: Spec Z_p, not strictly henselian); the resulting 'stalk' of
--   R^1λ_*Z/ℓ would be H^1(Q_p, Z/ℓ) instead of H^1(Q_p^nr, Z/ℓ), so the pointed étale
--   neighbourhoods are essential. [non-example test]
-- FormalScheme.strictLocalisationSystem_test_noetherian: not stated here; needs strict
--   localisations of schemes and formal completions of type (S) (supplier:
--   SchemeAndStackFoundations:SF.2, AdicSpacesPartII:F0/formal-completion). If A is noetherian then
--   Y_∞^ is of type (S) via (a), so Theorem 3.5.8 applies (node
--   stalks-of-higher-direct-images-lambda). [compatibility test]
-- FormalScheme.strictLocalisationSystem_test_cofinal: not stated here; needs strict localisations
--   of schemes and formal completions of type (S) (supplier: SchemeAndStackFoundations:SF.2,
--   AdicSpacesPartII:F0/formal-completion). The pointed completions (Y_i^, u_i) are cofinal among
--   étale neighbourhoods of x̄ in X_et, so (R^nλ_*F)_x̄ = colim_I H^n(d(Y_i^, f_i⁻¹(L)), F) (node
--   higher-direct-images-of-lambda (ii)). [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalks-of-higher-direct-images-lambda (theorem) -/

-- FormalScheme.stalk_higherDirectImage_eq_completion: not stated here; needs the étale sites of
--   pseudo-adic spaces d(Y^, L), their cohomology and the strict-localisation system of node
--   formal-strict-localisation-system-3-5-7 (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image, SchemeAndStackFoundations:SF.2).
--   Statement (H1:formal-adic-comparison/stalks-of-higher-direct-images-lambda): In the situation
--   of node formal-strict-localisation-system-3-5-7, let F be an abelian sheaf on d(X, L)_et, λ =
--   λ_(X,L), and assume that the formal scheme Y_∞^ is of type (S). Put F'_∞ := d(f)^*F on d(Y_∞^,
--   f⁻¹(L)). Then for every n ≥ 0 there is a natural isomorphism (R^nλ_*F)_x̄ ≅ H^n(d(Y_∞^,
--   f⁻¹(L)), F'_∞). The type-(S) hypothesis on Y_∞^ is part of the statement; without it the
--   filtered formula of node stalk-formula-filtered-3-5-9 is used instead, and no analytic
--   strict-localisation space is asserted to exist.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-comparison-3-6-1 (theorem) -/

-- AdicSpace.henselianTube_cohomology_iso: not stated here; needs Huber's fibre products of schemes
--   with pseudo-adic spaces and their étale cohomology (supplier:
--   ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/henselian-tube-comparison-3-6-1): Let A be an affinoid ring (not
--   necessarily complete), J ⊆ I ideals of A⁺ such that A⁺/J is henselian along I/J, and let T :=
--   {x ∈ Spa A : |i(x)| < 1 for all i ∈ I} ⊆ U := {x ∈ Spa A : |j(x)| < 1 for all j ∈ J}, closed
--   subsets of Spa A regarded as pseudo-adic subspaces. Let f: X → Spec A^▷ be a morphism of
--   schemes satisfying conditions (a) and (b) of Theorem 3.2.10, or with A^▷ discrete, and X_T := X
--   ×_{Spec A^▷} T → X_U := X ×_{Spec A^▷} U the induced morphism of pseudo-adic spaces (Huber's
--   fibre products (3.2.7),
--   ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12). Let F be an
--   abelian torsion sheaf on (X_U)_et and F' its preimage on (X_T)_et. Then the restriction map
--   H^n(X_U, F) → H^n(X_T, F') is bijective for every n ≥ 0.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3 (theorem) -/

-- AdicSpace.henselianTube_closedSubset_iso: not stated here; needs Spa A as an adic space and
--   pseudo-adic spaces (Spa A, S) with their étale cohomology (supplier: AdicSpaces Layer 5,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Statement
--   (H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3): Let A be an affinoid
--   ring with A⁺ henselian along an ideal I ⊆ A⁺, let W ⊆ Spa A be a Zariski-open subset containing
--   all analytic points of Spa A, and T := {w ∈ W : |i(w)| < 1 for all i ∈ I}. (3.6.2) For every
--   abelian torsion sheaf F on W_et with preimage F' on the pseudo-adic space (Spa A, T), H^n(W, F)
--   → H^n(T, F') is bijective for all n. (3.6.3) More generally, for a closed subset S ⊆ W (so that
--   (Spa A, S) and (Spa A, S ∩ T) are pseudo-adic spaces) and a torsion sheaf F on (Spa A, S)_et
--   with preimage F' on (Spa A, S ∩ T), H^n(S, F) → H^n(S ∩ T, F') is bijective for all n. (3.6.2)
--   is the case S = W.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-closed-point-3-5-8-ii (theorem) -/

-- FormalScheme.stalk_higherDirectImage_eq_closedPoint: not stated here; needs the étale sites of
--   pseudo-adic spaces d(Y^, L), their cohomology and the strict-localisation system of node
--   formal-strict-localisation-system-3-5-7 (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image, SchemeAndStackFoundations:SF.2).
--   Statement (H1:formal-adic-comparison/stalk-formula-closed-point-3-5-8-ii): In the situation of
--   node stalks-of-higher-direct-images-lambda (Y_∞^ of type (S)), assume moreover that F is a
--   torsion sheaf. Let z be the closed point of Y_∞^ and F_∞ the preimage of F'_∞ on d(Y_∞^, {z}) ⊆
--   d(Y_∞^, f⁻¹(L)). Then (R^nλ_*F)_x̄ ≅ H^n(d(Y_∞^, {z}), F_∞) for every n ≥ 0: only the analytic
--   points specialising to the closed point contribute.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-filtered-3-5-9 (theorem) -/

-- FormalScheme.stalk_higherDirectImage_eq_colimit: not stated here; needs the étale sites of
--   pseudo-adic spaces d(Y^, L), their cohomology and the strict-localisation system of node
--   formal-strict-localisation-system-3-5-7 (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image, SchemeAndStackFoundations:SF.2).
--   Statement (H1:formal-adic-comparison/stalk-formula-filtered-3-5-9): In the situation of node
--   formal-strict-localisation-system-3-5-7, without assuming that Y_∞^ is of type (S), let F be a
--   torsion sheaf on d(X, L)_et and F_i its preimage on d(Y_i^, {z_i}) (z_i = u_i(ȳ)). Then for
--   every n ≥ 0: (R^nλ_*F)_x̄ ≅ colim_{i∈I} H^n(d(Y_i^, {z_i}), F_i). This is the formula to use
--   when the completed strict localisation is not of type (S); it involves only the type-(S) formal
--   schemes Y_i^ and no analytic space attached to Y_∞^.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-constant-coefficients-3-5-10 (theorem) -/

-- FormalScheme.stalk_higherDirectImage_pullback_eq_genericLocus: not stated here; needs the étale
--   sites of pseudo-adic spaces d(Y^, L), their cohomology and the strict-localisation system of
--   node formal-strict-localisation-system-3-5-7 (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image, SchemeAndStackFoundations:SF.2).
--   Statement (H1:formal-adic-comparison/stalk-formula-constant-coefficients-3-5-10): In the
--   situation of node formal-strict-localisation-system-3-5-7, let G be a torsion sheaf on (X,
--   L)_et and F = λ^*G. Let V := Y_∞ − (Y_∞ ×_Y Spec B/J), the open complement of V(J) in the
--   strict localisation (V = Spec O^sh_{Y,ȳ}[1/s] when J = sB), and M the constant sheaf on V_et
--   with value G_x̄. Then (R^nλ_*F)_x̄ ≅ H^n(V, M) for every n ≥ 0. No type-(S) hypothesis on Y_∞^
--   and no completion appears on the right-hand side; the torsion of G may be divisible by the
--   residue characteristic.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11 (theorem) -/

-- FormalScheme.Pair.restrict_derivedSpecialisation_iso: not stated here; needs étale sites of
--   pseudo-adic spaces and their derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11): Let X be a formal scheme
--   of type (S), L' ⊆ L locally closed subsets of |X|, i: (X, L') → (X, L) the morphism of pairs
--   given by the identity of X, d(i): d(X, L') → d(X, L) the inclusion of supports, λ = λ_(X,L), λ'
--   = λ_(X,L') and E a torsion ring. Then the base-change morphism of functors D⁺(d(X, L)_et, E) →
--   D⁺((X, L')_et, E), i^* ∘ R⁺λ_* ⟶ R⁺λ'_* ∘ d(i)^* (node
--   pair-specialization-functoriality-3-5-4), is an isomorphism.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/extension-by-zero-compatibility-3-5-11-ii (theorem) -/

-- FormalScheme.Pair.extendByZero_derivedSpecialisation_iso: not stated here; needs extension by
--   zero on pseudo-adic spaces and derived direct images (supplier:
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/extension-by-zero-compatibility-3-5-11-ii): In the situation of node
--   restriction-and-extension-by-zero-3-5-11, assume L' open in L, and let i_! and d(i)_! be the
--   extensions by zero along the open inclusions of supports (node pair-etale-site,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). Then the natural morphism of
--   functors D⁺(d(X, L')_et, E) → D⁺((X, L)_et, E), i_! ∘ R⁺λ'_* ⟶ R⁺λ_* ∘ d(i)_!, is an
--   isomorphism for every torsion ring E. The source writes the same morphism i (with lower shriek)
--   in (ii), not a separately named open immersion.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12 (construction) -/

section CompletionDataScheme

universe u

/-- H1:formal-adic-comparison/completion-comparison-data-3-5-12 (construction): scheme-level core
of `FormalScheme.CompletionData` (Huber 1996 (3.5.12), p. 207): a scheme `X`, a closed immersion
`i : Y → X` locally of finite presentation (so its ideal `𝓘` is quasi-coherent of finite type,
`Y = V(𝓘)`) and an open immersion `j : U → X` onto the complement `X − Y`. Hypothesis (α) is the
separate instance `[IsLocallyNoetherian D.X]`; the alternative (β) (`𝓘` locally principal and the
completion `X^` of type (S)) needs formal schemes of type (S) and is not recorded here, nor are
the maps `a`, `b` out of the adic space `d(X^)`. -/
structure CompletionData_scheme where
  /-- The ambient scheme `X`. -/
  X : Scheme.{u}
  /-- The closed subscheme `Y = V(𝓘)`. -/
  Y : Scheme.{u}
  /-- The open complement `U = X − Y`. -/
  U : Scheme.{u}
  /-- The closed immersion `i : Y → X`. -/
  i : Y ⟶ X
  /-- The open immersion `j : U → X`. -/
  j : U ⟶ X
  [isClosedImmersion : IsClosedImmersion i]
  [locallyOfFinitePresentation : LocallyOfFinitePresentation i]
  [isOpenImmersion : IsOpenImmersion j]
  /-- `U` is the complement of `Y`. -/
  range_j : Set.range j = (Set.range i)ᶜ

end CompletionDataScheme

-- FormalScheme.CompletionData: not stated here; needs formal schemes of type (S) for the hypothesis
--   (β) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S); its scheme-level core (data (X,
--   𝓘) and hypothesis (α) as `[IsLocallyNoetherian D.X]`) is `FormalScheme.CompletionData_scheme`.
--   (X, 𝓘) with 𝓘 quasi-coherent of finite type and hypothesis (α) ∨ (β) of (3.5.12).
-- FormalScheme.CompletionData.completion: not stated here; needs the formal completion X^ as a
--   formal scheme of type (S) (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-schemes-of-type-S). X^ with its type-(S) instance.
-- FormalScheme.CompletionData.isTypeS_of_isLocallyNoetherian: not stated here; needs the formal
--   completion X^ as a formal scheme of type (S) (supplier:
--   AdicSpacesPartII:F0/adic-completion-noetherian, AdicSpacesPartII:R2/formal-schemes-of-type-S).
--   Under (α), X^ is locally noetherian, hence of type (S).
-- FormalScheme.CompletionData.sigma_mem_open: not stated here; needs the formal completion X^ and
--   the adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). σ_{X^}(d(X^)) ⊆ U = X − Y.
-- FormalScheme.CompletionData.specialMap: not stated here; needs the formal completion X^ and the
--   adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). b: d(X^)_et → Y_et, λ_{X^} composed with
--   (X^)_et ≃ Y_et.
-- FormalScheme.CompletionData.genericMap: not stated here; needs the formal completion X^ and the
--   adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). a: d(X^)_et → U_et with a⁻¹(Z) = Z ×_X
--   d(X^).
-- FormalScheme.CompletionData.restrict: not stated here; needs the formal completion X^ as a formal
--   scheme of type (S) (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-schemes-of-type-S). For Z étale over X, (Z, 𝓘O_Z) is again
--   completion data of the same type, Z^ ∈ Et/X^, and a, b, i, j restrict compatibly.
-- FormalScheme.CompletionData.genericMap_goodReduction: not stated here; needs the good-reduction
--   locus and analytification of schemes (supplier: AdicSpacesPartII:R2/good-reduction-locus,
--   AdicSpacesPartII:R1/scheme-fibre-product-analytification). For X locally of finite type over
--   O_K and 𝓘 = (ϖ), a is the restriction of the analytification morphism of sites X_K^{ad}_et →
--   (X_K)_et to the good-reduction locus d(X^) (AdicSpacesPartII:R2/good-reduction-locus).

/- Scheme-level core: for `𝓘 = 𝒪_X` one has `Y = ∅`, and then `U = X`, i.e. `j` is an
isomorphism. -/
-- test FormalScheme.completionData_test_unit (degenerate)
--   [H1:formal-adic-comparison/completion-comparison-data-3-5-12]
example (D : CompletionData_scheme.{0}) [IsEmpty D.Y] : IsIso D.j := sorry

-- FormalScheme.completionData_test_trait: not stated here; needs the formal completion X^ and the
--   adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). X = Spec O_K (K complete discretely
--   valued), 𝓘 = (ϖ): Y = Spec k, U = Spec K, d(X^) = Spa(K, O_K), a: Spa(K)_et → (Spec K)_et is an
--   equivalence and b = λ_{Spf O_K}. [computation test]
-- FormalScheme.completionData_test_notTypeS: not stated here; needs the formal completion X^ and
--   the adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). X = Spec O_C[T] (C = C_p) with 𝓘 = (p,
--   T): X is not locally noetherian, 𝓘 is not locally principal, and X^ = Spf O_C[[T]] with the
--   (p,T)-adic topology is not of type (S); the data are not defined and no comparison is claimed.
--   [non-example test]
-- FormalScheme.completionData_test_disc: not stated here; needs the formal completion X^ and the
--   adic space d(X^) with its étale site (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). X = Spec O_C[T], 𝓘 = (p) (case (β)): X^
--   = Spf O_C⟨T⟩, d(X^) is the closed unit disc over C, and a is the inclusion of the disc into the
--   analytified affine line composed with the analytification morphism of sites
--   (AdicSpacesPartII:R2/good-reduction-locus). [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction) -/

section SchemeSide

universe u

/-- H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction), supporting the
scheme side of the comparison: abelian sheaves on the small étale site of a scheme form a
Grothendieck abelian category (Mathlib `Sheaf.isGrothendieckAbelian_of_essentiallySmall`, as for
the pro-étale site in `Mathlib.AlgebraicGeometry.Sites.ElladicCohomology`). This supplies the
`Ext` groups behind Mathlib's `CategoryTheory.Sheaf.H` on `Scheme.smallEtaleTopology`. -/
instance isGrothendieckAbelian_smallEtale_H1f (X : Scheme.{u}) :
    IsGrothendieckAbelian.{u + 1} (Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u + 1}) :=
  sorry

/-- H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction), supporting: the
direct image `f_*` of abelian étale sheaves along a morphism of schemes, `(f_* F)(V) = F(X ×_Y V)`
(Huber 1996 §2.3; intended value: Mathlib's `Functor.sheafPushforwardContinuous` of the
base-change functor `MorphismProperty.Over.pullback`). -/
def etaleDirectImage_H1f {X Y : Scheme.{u}} (f : X ⟶ Y) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u + 1} ⥤
      Sheaf (Scheme.smallEtaleTopology Y) AddCommGrpCat.{u + 1} := sorry

/-- H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction), supporting: the
higher direct image `R^q f_*` of abelian étale sheaves, the `q`-th right derived functor of
`etaleDirectImage_H1f f`; `R^q f_* F` is the sheaf associated with `V ↦ H^q(X ×_Y V, F)`
(Huber 1996 §2.3). -/
def etaleHigherDirectImage_H1f {X Y : Scheme.{u}} (f : X ⟶ Y) (q : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u + 1} ⥤
      Sheaf (Scheme.smallEtaleTopology Y) AddCommGrpCat.{u + 1} := sorry

/-- H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction), supporting: the
inverse image `f^*` of abelian étale sheaves, left adjoint of `etaleDirectImage_H1f f` (intended
value: Mathlib's `Functor.sheafPullback` of the base-change functor). -/
def etaleInverseImage_H1f {X Y : Scheme.{u}} (f : X ⟶ Y) :
    Sheaf (Scheme.smallEtaleTopology Y) AddCommGrpCat.{u + 1} ⥤
      Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u + 1} := sorry

/-- H1:formal-adic-comparison/completion-comparison-map-3-5-13-i (construction): the scheme side of
the comparison `(*)` of Huber 1996 Theorem 3.5.13(i) in degree `q`, the étale sheaf
`i^* R^q j_* K` on `Y` (the cohomology sheaves of `i^* R⁺j_* K`, the source of
`FormalScheme.CompletionData.derivedComparison`). -/
def CompletionData_scheme.nearbyCycles (D : CompletionData_scheme.{u}) (q : ℕ)
    (K : Sheaf (Scheme.smallEtaleTopology D.U) AddCommGrpCat.{u + 1}) :
    Sheaf (Scheme.smallEtaleTopology D.Y) AddCommGrpCat.{u + 1} :=
  (etaleInverseImage_H1f D.i).obj ((etaleHigherDirectImage_H1f D.j q).obj K)

end SchemeSide

-- FormalScheme.CompletionData.phi: not stated here; needs the maps a, b out of the étale site of
--   d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). φ_Z: d(Z^) → Z ×_X d(X^), natural in Z ∈
--   Et/X.
-- FormalScheme.CompletionData.comparisonInverseImage: not stated here; needs the maps a, b out of
--   the étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). The natural transformation b⁻¹i⁻¹ ⟶
--   a⁻¹j⁻¹ of functors Et/X → Et/d(X^).
-- FormalScheme.CompletionData.psi: not stated here; needs the maps a, b out of the étale site of
--   d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); its source `i^* j_* K` is
--   `FormalScheme.CompletionData_scheme.nearbyCycles` in degree 0. ψ: i^* ∘ j_* ⟶ b_* ∘ a^* on
--   sheaves of E-modules on U_et.
-- FormalScheme.CompletionData.derivedComparison: not stated here; needs the maps a, b out of the
--   étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); its source in degree q, `i^* R^q j_* K`,
--   is `FormalScheme.CompletionData_scheme.nearbyCycles`. (*): i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^* on
--   D⁺(U_et, E), for every ring E.
-- FormalScheme.CompletionData.derivedComparison_H0: not stated here; needs the maps a, b out of the
--   étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). H⁰ of (*) on a sheaf in degree 0 is ψ.
-- FormalScheme.CompletionData.psi_stalk: not stated here; needs the maps a, b out of the étale site
--   of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). At a geometric point ȳ of Y, ψ_ȳ is the
--   colimit over ȳ-pointed étale neighbourhoods (Z, u) of the restriction maps K(U ×_X Z) →
--   (a^*K)(d(Z^)) along φ_Z.
-- FormalScheme.CompletionData.derivedComparison_natural: not stated here; needs the maps a, b out
--   of the étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). (*) is natural for étale Z → X
--   (restriction of completion data), for isomorphisms of completion data (in particular for
--   automorphisms of X over a base), and for change of coefficient ring E → E'.
-- FormalScheme.CompletionData.globalComparison: not stated here; needs the maps a, b out of the
--   étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Applying R⁺Γ(Y, −) and the Leray
--   isomorphism R⁺Γ(Y, R⁺b_*−) ≅ R⁺Γ(d(X^), −) gives R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(d(X^), a^*K).

/- Scheme side: if `Y = ∅` or `U = ∅`, the sheaves `i^* R^q j_* K` vanish. -/
-- test FormalScheme.comparisonMap_test_empty (degenerate)
--   [H1:formal-adic-comparison/completion-comparison-map-3-5-13-i]
example (D : CompletionData_scheme.{0}) (hD : IsEmpty D.Y ∨ IsEmpty D.U) (q : ℕ)
    (K : Sheaf (Scheme.smallEtaleTopology D.U) AddCommGrpCat.{1}) :
    IsZero (D.nearbyCycles q K) := sorry

/- Scheme half of the non-example: `H¹(Spec ℚ, ℤ/ℓ)` is infinite (Mathlib's `Sheaf.H` on the small
étale site), whereas `H¹(Spa ℚ_p, ℤ/ℓ)` is finite; so a comparison with target `R⁺Γ(U, −)` cannot
be an isomorphism. The finiteness half needs `AdicSpace.etaleCohomology` (supplier:
ClassicalAdicEtaleCohomology:H0/derived-direct-image). -/
-- test FormalScheme.comparisonMap_test_local (non-example)
--   [H1:formal-adic-comparison/completion-comparison-map-3-5-13-i]
example (ℓ : ℕ) [Fact ℓ.Prime] :
    Infinite (((constantSheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of ℚ)))
      AddCommGrpCat.{1}).obj (AddCommGrpCat.of (ULift (ZMod ℓ)))).H 1 : Type 1) := sorry

-- FormalScheme.comparisonMap_test_trait: not stated here; needs the maps a, b out of the étale site
--   of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). For X = Spec O_K with O_K a henselian
--   DVR and 𝓘 = (ϖ), ψ on the sheaf of a Gal(K^sep/K)-module M is M^{I_K} → M^{I_{K^}}, an
--   isomorphism. [computation test]
-- FormalScheme.comparisonMap_test_H0: not stated here; needs the maps a, b out of the étale site of
--   d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). On a sheaf K in degree 0, H⁰ of (*) is
--   ψ_K: i^*j_*K → b_*a^*K. [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselised-generic-locus-cohomology (lemma) -/

-- FormalScheme.CompletionData.henselisedGenericLocus_cohomology_iso: not stated here; needs
--   henselisations of pairs, the generic fibre d(Z^) and its étale cohomology (supplier:
--   ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization,
--   AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/henselised-generic-locus-cohomology): Let (X, 𝓘) be completion data
--   with X = Spec A affine, J = 𝓘(X), and Z = Spec B affine étale over X, Z^h = Spec B^h for the
--   henselisation (B^h, J^h) of the pair (B, JB), and Z^ = Spf B^ (J-adic completion). The
--   composite d(Z^) → Spec B^ − V(JB^) → Spec B^h − V(JB^h) = U ×_X Z^h induces, for every torsion
--   sheaf K on U_et, isomorphisms H^n(U ×_X Z^h, K) ≅ H^n(d(Z^), a^*K), n ≥ 0. Case (α): d(Z^) =
--   Spa(B, B)_a with B carrying the JB-adic topology, and the statement is Theorem 3.2.10 for the
--   pro-special subset Spa(B, B) and the scheme Spec B − V(JB). Case (β) (J = sA): d(Z^) =
--   Spa(B(1/s), C) with C the integral closure of B in B(1/s), U ×_X Z^h is the spectrum of the
--   henselisation of the affinoid ring (B(1/s), C) along Spa(B(1/s), C), and the statement is
--   Theorem 3.2.9.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13 (theorem) -/

-- FormalScheme.CompletionData.isIso_derivedComparison: not stated here; needs the maps a, b out of
--   the étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); its scheme side in degree q is
--   `FormalScheme.CompletionData_scheme.nearbyCycles`. Statement
--   (H1:formal-adic-comparison/scheme-completion-comparison-3-5-13): Let (X, 𝓘) be completion data
--   (node completion-comparison-data-3-5-12): X a scheme, Y = V(𝓘) for a quasi-coherent ideal 𝓘 of
--   finite type, U = X − Y, X^ the completion along Y, and either (α) X locally noetherian or (β) 𝓘
--   locally principal and X^ of type (S) — exactly as in (3.5.12). Let E be a torsion ring. Then
--   the natural transformation (*) i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^* of node
--   completion-comparison-map-3-5-13-i is an isomorphism of functors D⁺(U_et, E) → D⁺(Y_et, E). The
--   torsion scope is the source's: every torsion ring, with no prime-to-residue-characteristic
--   hypothesis; that narrower restriction belongs to the valuation-base-change theorem
--   (ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles), not to this comparison.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14 (theorem) -/

section SchemeSideCohomology

universe u

/-- H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14 (theorem): the scheme side of
Huber 1996 Corollary 3.5.14, the `E₂`-term `H^p(Y, i^* R^q j_* K)` of the spectral sequence
`H^p(Y, i^* R^q j_* K) ⇒ H^{p+q}(d(X^), a^* K)`, as Mathlib's sheaf cohomology `Sheaf.H` on the
small étale site of `Y`. -/
abbrev CompletionData_scheme.nearbyCyclesCohomology (D : CompletionData_scheme.{u})
    (K : Sheaf (Scheme.smallEtaleTopology D.U) AddCommGrpCat.{u + 1}) (p q : ℕ) : Type (u + 1) :=
  (D.nearbyCycles q K).H p

end SchemeSideCohomology

-- FormalScheme.CompletionData.derivedGlobalSections_genericFibre_iso: not stated here; needs the
--   maps a, b out of the étale site of d(X^) and derived direct images on it (supplier:
--   AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); the E₂-terms of its scheme side are
--   `FormalScheme.CompletionData_scheme.nearbyCyclesCohomology`. Statement
--   (H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14): Let (X, 𝓘) be completion data
--   (hypothesis (α) or (β) of (3.5.12)), E a torsion ring and K ∈ D⁺(U_et, E). Then R⁺Γ(d(X^),
--   a^*K) ≅ R⁺Γ(Y, i^*R⁺j_*K) naturally in K, the isomorphism being the inverse of the global
--   comparison R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(Y, R⁺b_*a^*K) ≅ R⁺Γ(d(X^), a^*K). In particular there is a
--   spectral sequence H^p(Y, i^*R^q j_*K) ⇒ H^{p+q}(d(X^), a^*K) for arbitrary (not necessarily
--   proper) X.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/tube-cohomology-3-5-15 (theorem) -/

-- FormalScheme.CompletionData.derivedGlobalSections_support_iso: not stated here; needs pseudo-adic
--   spaces d(X^, L) and derived global sections on them (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement
--   (H1:formal-adic-comparison/tube-cohomology-3-5-15): Let (X, 𝓘) be completion data, E a torsion
--   ring, K ∈ D⁺(U_et, E) and L ⊆ |Y| = |X^| locally closed. Let K' be the restriction of a^*K to
--   the pseudo-adic space d(X^, L) = (d(X^), λ_{X^}⁻¹(L)) and K'' the restriction of i^*R⁺j_*K to
--   (L_red)_et ≃ (X^, L)_et. Then R⁺Γ(d(X^, L), K') ≅ R⁺Γ(L, K'') naturally in K.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/microbial-closed-fibre-support (construction) -/

section Microbial

universe u

/-- H1:formal-adic-comparison/microbial-closed-fibre-support (construction): the data `(A, I, X)`
of Huber 1996 Corollary 3.5.16 (p. 210): a microbial valuation ring `A` (Wedhorn Definition 5.46;
Tau Ceti's `Valuation.IsMicrobial` of its valuation) with its valuation topology, a finitely
generated ideal of definition `I`, and a scheme `X` locally of finite type over `A`. The valuation
topology is the `I`-adic topology for a nonzero `I` contained in every nonzero prime: then `√I` is
the height-one prime (which exists because `A` is microbial) and `I = sA` for a nonzero
topologically nilpotent `s`. The base need not be discrete, noetherian or of rank one. -/
structure MicrobialBase where
  /-- The valuation ring `A`. -/
  A : Type u
  [commRing : CommRing A]
  [isDomain : IsDomain A]
  [valuationRing : ValuationRing A]
  [topologicalSpace : TopologicalSpace A]
  /-- `A` is microbial (Wedhorn Definition 5.46(v)). -/
  isMicrobial : (ValuationRing.valuation A (FractionRing A)).IsMicrobial
  /-- The ideal of definition `I`. -/
  I : Ideal A
  fg : I.FG
  ne_bot : I ≠ ⊥
  /-- `I` lies in every nonzero prime, so `√I` is the height-one prime. -/
  le_of_isPrime : ∀ p : Ideal A, p.IsPrime → p ≠ ⊥ → I ≤ p
  /-- The topology of `A` is the `I`-adic (valuation) topology. -/
  isAdic : IsAdic I
  /-- The scheme `X` over `Spec A`. -/
  X : Scheme.{u}
  /-- The structure morphism `X → Spec A`. -/
  f : X ⟶ Spec (CommRingCat.of A)
  [locallyOfFiniteType : LocallyOfFiniteType f]

/-- H1:formal-adic-comparison/microbial-closed-fibre-support (construction): scheme-level core of
`FormalScheme.MicrobialBase.completionData` (Huber 1996, proof of Corollary 3.5.16): the scheme
data `(X, I·𝒪_X)`, with `Y = X ×_A Spec (A ⧸ I)` and `U = X_η` (the only prime of `A` not
containing `s` is `(0)`); it is of type (β), a condition recorded only in
`FormalScheme.MicrobialBase.completionData`. -/
def MicrobialBase.completionData_scheme (M : MicrobialBase.{u}) : CompletionData_scheme.{u} :=
  sorry

end Microbial

-- FormalScheme.MicrobialBase.completion_isTypeS: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). X^ (completion along X ×_A Spec A/I)
--   is of type (S).
-- FormalScheme.MicrobialBase.completion_indep: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). X^ does not depend on I.
-- FormalScheme.MicrobialBase.completionData: not stated here; needs formal schemes of type (S) for
--   the hypothesis (β) (supplier: AdicSpacesPartII:R2/formal-schemes-of-type-S); its scheme-level
--   core is `FormalScheme.MicrobialBase.completionData_scheme`. (X, I·O_X) is completion data of
--   type (β) with U = X_η and Y = X ×_A Spec A/I.
-- FormalScheme.MicrobialBase.genericFibre_spf: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). d(Spf A) = Spa(K^, A^) with points the
--   valuation rings between A^ and K^°, and closed point c_A.
-- FormalScheme.MicrobialBase.closedFibreSupport: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Z = (d(X^), T) = d(X^, X_{s_0}), a
--   pseudo-adic space.
-- FormalScheme.MicrobialBase.mem_closedFibreSupport_iff: not stated here; needs the completion X^
--   of type (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). t ∈ T ↔ t maps to c_A ↔ λ_{X^}(t) ∈
--   X_{s_0}.
-- FormalScheme.MicrobialBase.closedFibreSupport_eq_of_rankOne: not stated here; needs the
--   completion X^ of type (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). If A has rank one then Z = d(X^).
-- FormalScheme.MicrobialBase.genericFibreMap: not stated here; needs the completion X^ of type (S),
--   its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). c: Z_et → (X_η)_et, the restriction of
--   a to Z.

-- FormalScheme.microbialBase_test_rankOne: not stated here; needs the completion X^ of type (S),
--   its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For A = O_K of rank one, d(Spf A) =
--   Spa(K^, O_K^) is a point, T = d(X^) and Z = d(X^). [degenerate test]
-- FormalScheme.microbialBase_test_rankTwo: not stated here; needs the completion X^ of type (S),
--   its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). Let K be the completion of Q_p(t) for
--   the Gauss norm (residue field F_p(t)) and A = {a ∈ O_K : ā ∈ F_p[t]_(t)}, a microbial valuation
--   ring of rank two. For X = Spec A, d(X^) = Spa(K, A) has two points v_2 (valuation ring A) and
--   v_1 (valuation ring O_K); T = {v_2}, and λ(v_1) is the height-one prime, which lies in V(I) but
--   not in X_{s_0}. [computation test]
-- FormalScheme.microbialBase_test_nondiscrete: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). For A = O_C (C = C_p), X = Spec
--   O_C[T]: X^ = Spf O_C⟨T⟩ and Z is the closed unit disc over C; the construction does not use
--   discreteness of the valuation. [compatibility test]
-- FormalScheme.microbialBase_test_notAdicSpace: not stated here; needs the completion X^ of type
--   (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site). In the rank-two example, T = {v_2} is
--   closed and not open in d(X^), so Z is not an open adic subspace: replacing Z by an adic space
--   (e.g. the interior of T) loses the point v_2. [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16 (theorem) -/

-- FormalScheme.MicrobialBase.cohomology_closedFibreSupport_iso: not stated here; needs the
--   completion X^ of type (S), its generic fibre d(X^) and pseudo-adic spaces (supplier:
--   AdicSpacesPartII:R2/formal-schemes-of-type-S, AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site); the scheme side uses
--   `FormalScheme.MicrobialBase.completionData_scheme` and
--   `FormalScheme.CompletionData_scheme.nearbyCycles`. Statement
--   (H1:formal-adic-comparison/valuation-ring-base-3-5-16): In the situation of node
--   microbial-closed-fibre-support (A a microbial valuation ring with its valuation topology, I a
--   finitely generated ideal of definition, X locally of finite type over A, j: X_η → X, i: X_{s_0}
--   → X, Z = (d(X^), T) = d(X^, X_{s_0}), c: Z → X_η), for every torsion ring E and every K ∈
--   D⁺((X_η)_et, E) there is a natural isomorphism R⁺Γ(Z, c^*K) ≅ R⁺Γ(X_{s_0}, i^*R⁺j_*K). The base
--   need not be a discrete valuation ring, need not be noetherian, and may have any rank; the
--   coefficients may be any torsion ring.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles (comparison) -/

-- FormalScheme.huberVanishingCycles_eq_nearbyCycles: not stated here; needs the nearby-cycle
--   complex RΨ_η of a henselian trait and topological invariance of étale sites (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle,
--   SchemeAndStackFoundations:SF.2); Huber's side ī^* R^q j̄_*(K|X_η̄) is the scheme-level
--   `FormalScheme.CompletionData_scheme.nearbyCycles` of the completion data (X̄, π·O_X̄).
--   Statement (H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles): Let A be a
--   henselian discrete valuation ring with separably closed residue field (a strictly henselian
--   trait S = Spec A with generic point η and closed point s), k = Frac A, k̄ an algebraic closure,
--   Ā the integral closure of A in k̄ (a henselian valuation ring of rank one, not discrete, with
--   residue field purely inseparable over k(s)), S̄ = Spec Ā = {s̄, η̄}, X locally of finite type
--   over A, X̄ = X ×_A Ā with ī: X_s̄ → X̄ and j̄: X_η̄ → X̄. For a torsion ring E and K ∈
--   D⁺((X_η)_et, E), Huber's complex RΨ_η(K) ∈ D⁺((X_s)_et, E) of Corollary 3.5.17 is ī^*
--   R⁺j̄_*(K|_{X_η̄}), transported to (X_s)_et along the universal homeomorphism X_s̄ → X_s
--   (topological invariance). With the action of Gal(k̄/k) = I (the inertia group, the residue
--   field being separably closed) induced by its action on X̄ over X, this is the object RΨ_η(K) =
--   (RΨ(K))_η of LefschetzPencilsAndVanishingCycles:LPV.0 (SGA 7 XIII 2.1.2.3, S̄ the normalisation
--   of S in k(η̄)) in D⁺(X_s ×_s η, E): the nearby-cycle complex. It is not the vanishing-cycle
--   cone RΦ(K), which for K on X sits in the distinguished triangle sp^*i^*K → RΨ_η(K_η) → RΦ(K) →
--   of LPV.0. Huber's statement only uses the underlying complex; the Galois action is added here
--   and is used in node formal-nearby-cycles-comparison.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison (theorem) -/

-- FormalScheme.nearbyCycles_iso_formalNearbyCycles: not stated here; needs the nearby-cycle complex
--   RΨ_η of a henselian trait and topological invariance of étale sites, and the generic fibre of
--   the completion with its Galois action (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle,
--   SchemeAndStackFoundations:SF.2, AdicSpacesPartII:R2/generic-fibre-functor-d). Statement
--   (H1:formal-adic-comparison/formal-nearby-cycles-comparison): In the situation of node
--   huber-vanishing-cycles-are-nearby-cycles, let π be a uniformiser of A, X̄^ the π-adic
--   completion of X̄ = X ×_A Ā along X_s̄, λ̄: d(X̄^)_et → (X̄^)_et ≃ (X_s̄)_et ≃ (X_s)_et the
--   specialization morphism (node specialization-morphism-of-sites-lambda) and c: d(X̄^)_et →
--   (X_η)_et the composite of the morphism a of the completion data (X̄, π·O_X̄) with X_η̄ → X_η.
--   Then: (i) (X̄, π·O_X̄) is completion data of type (β), and d(X̄^) ≅ d(X^) ×_{Spa(k^, A^)}
--   Spa(k̄^, O_{k̄^}) = Ȳ, the base change of the generic fibre of X^ to the completed algebraic
--   closure; (ii) for every torsion ring E and K ∈ D⁺((X_η)_et, E), the comparison (*) of node
--   completion-comparison-map-3-5-13-i for (X̄, π·O_X̄) is an isomorphism RΨ_η(K) =
--   ī^*R⁺j̄_*(K|_{X_η̄}) ≅ R⁺λ̄_*(c^*K) in D⁺((X_s)_et, E); (iii) this isomorphism is
--   Gal(k̄/k)-equivariant for the action on RΨ_η(K) (node huber-vanishing-cycles-are-nearby-cycles)
--   and the action on R⁺λ̄_*(c^*K) induced by the continuous action of Gal(k̄/k) on k̄^, hence on
--   X̄^ and d(X̄^) over X^ and d(X^); in particular the inertia actions on R^qΨ_η(K) and on the
--   formal nearby-cycle sheaves R^qλ̄_*(c^*K) agree, and the latter action is continuous.

/-! ## ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17 (comparison) -/

-- FormalScheme.cohomology_geometricGenericFibre_iso_nearbyCycles: not stated here; needs rigid
--   étale topoi and the nearby-cycle complex RΨ_η (supplier:
--   AdicSpacesPartII:R4/etale-site-and-rigid-comparison,
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle).
--   Statement (H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17): Let A be a henselian
--   discrete valuation ring (of rank one) with separably closed residue field, k its fraction field
--   with the valuation topology, k^ its completion, k̄^ the completion of an algebraic closure k̄,
--   η and s the generic and closed points of Spec A, X a scheme locally of finite type over A, E a
--   torsion ring, K ∈ D⁺((X_η)_et, E), and RΨ_η(K) ∈ D⁺((X_s)_et, E) Huber's 'complex of vanishing
--   cycles of K', i.e. the nearby-cycle complex of LefschetzPencilsAndVanishingCycles:LPV.0 (node
--   huber-vanishing-cycles-are-nearby-cycles; not RΦ). Let Y be the rigid analytic variety over k^
--   attached to the completion X^ of X along X_s (so r(Y) = d(X^),
--   AdicSpacesPartII:R2/raynaud-generic-fibre), Ȳ := Y ⊗̂_{k^} k̄^, and c: Ȳ_et → (X_η)_et the
--   natural morphism. Then R⁺Γ(Ȳ, c^*K) ≅ R⁺Γ(X_s, RΨ_η K), with X_s the closed fibre itself (its
--   residue field is separably closed), and the isomorphism is Gal(k̄/k)-equivariant. No properness
--   is assumed.

end FormalScheme

end TauCeti

end

/-! # Stage H1v. Nearby cycles over valuation bases

Scheme-level stage, stated on Mathlib's schemes. The quadruples `(X, S, η, s)` over the spectrum
`S = Spec V` of a valuation ring, their morphisms (with the Cartesian and dominance conditions),
the Gauss valuation rings `V(T)`, and ring-level or finite-group cores of the valuation-theoretic
lemmas (strict henselization via inertia, tame quotient, prime-to-`p` cohomology, radicial
extensions) are stated. Mathlib has the small étale site `Scheme.smallEtaleTopology`, its
Grothendieck abelian sheaf categories, `DerivedCategory.Plus` and
`Functor.rightDerivedFunctorPlus`, but neither the strict henselization of a local ring nor the
pullback and derived push-forward of étale sheaves along morphisms of schemes; so the nearby-cycle
functor `RΨ_L = i^* Rj_* j^*`, its Galois action, its base-change maps and every statement about
them are comments naming their supplier (`SchemeAndStackFoundations:SF.2`, EtaleBaseChange 3–8
and ConstructibleEtale 7–9). -/

noncomputable section

namespace TauCeti

open _root_.AlgebraicGeometry _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u

namespace AlgebraicGeometry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple (definition) -/

/-- H1:valuation-nearby-cycles/valuation-base-quadruple (definition): a valuation-base quadruple
`(X, S, η, s)` (Huber 1996 §4.2, as restated in Orgogozo, *Modifications et cycles proches*,
Introduction and Remarque 4.4): a valuation ring `V` with `S = Spec V`, two points `η ⤳ s` of `S`
(so `𝔭_η ⊆ 𝔭_s`), and a morphism of schemes `f : X → S`, such that `O_{S,s} = V_{𝔭_s}` is strictly
henselian (henselian local with separably closed residue field `k(s)`). The case `η = s` is
allowed; no rank, discreteness or noetherianity of `V` is assumed. -/
structure ValuationQuadruple where
  /-- The valuation ring `V`; the base is `S = Spec V`. -/
  V : Type u
  [commRing : CommRing V]
  [isDomain : IsDomain V]
  [valuationRing : ValuationRing V]
  /-- The point `η ∈ S`, the prime `𝔭_η` of `V`. -/
  η : PrimeSpectrum V
  /-- The point `s ∈ S`, the prime `𝔭_s` of `V`. -/
  s : PrimeSpectrum V
  /-- `η` is a generization of `s`: `η ⤳ s`, i.e. `𝔭_η ⊆ 𝔭_s`. -/
  specializes : η ⤳ s
  /-- The scheme `X`. -/
  X : Scheme.{u}
  /-- The structure morphism `f : X → S`. -/
  f : X ⟶ Spec (.of V)
  /-- `O_{S,s} = V_{𝔭_s}` is a henselian local ring. -/
  henselianLocalRing_special : HenselianLocalRing (Localization.AtPrime s.asIdeal)
  /-- The residue field `k(s)` of `O_{S,s}` is separably closed. -/
  isSepClosed_special : IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s.asIdeal))

attribute [instance] ValuationQuadruple.commRing ValuationQuadruple.isDomain
  ValuationQuadruple.valuationRing ValuationQuadruple.henselianLocalRing_special
  ValuationQuadruple.isSepClosed_special

namespace ValuationQuadruple

variable (Q : ValuationQuadruple.{u})

/-- H1:valuation-nearby-cycles/valuation-base-quadruple (supporting): `k(η)`, the residue field of
the local ring `O_{S,η} = V_{𝔭_η}`. -/
abbrev residueFieldEta : Type u := IsLocalRing.ResidueField (Localization.AtPrime Q.η.asIdeal)

/-- H1:valuation-nearby-cycles/valuation-base-quadruple (supporting): `k(s)`, the residue field of
the strictly henselian local ring `O_{S,s} = V_{𝔭_s}`. -/
abbrev residueFieldSpecial : Type u :=
  IsLocalRing.ResidueField (Localization.AtPrime Q.s.asIdeal)

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: `O_{S,η} = V_{𝔭_η}` is a valuation ring
(of the fraction field `K` of `V`). -/
instance valuationRing_localizationAtEta : ValuationRing (Localization.AtPrime Q.η.asIdeal) :=
  sorry

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: `i : X_s → X`, the canonical morphism from
the fibre `X_s = X ×_S Spec k(s)` (Mathlib's `Scheme.Hom.fiber`). -/
def specialFiberι : Q.f.fiber Q.s ⟶ Q.X :=
  Q.f.fiberι Q.s

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: `p_s`, the characteristic exponent of
`k(s)`; an integer `n` is prime to the residue characteristic iff it is prime to `p_s`. -/
def residueCharExp : ℕ :=
  ringExpChar Q.residueFieldSpecial

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: the localization of the base at `s`, the
quadruple `(X ×_S Spec O_{S,s}, Spec O_{S,s}, η, s)`; its special fibre is `X_s`. -/
def localize : ValuationQuadruple.{u} where
  V := Localization.AtPrime Q.s.asIdeal
  valuationRing := sorry
  η := ⟨Q.η.asIdeal.map (algebraMap Q.V (Localization.AtPrime Q.s.asIdeal)), sorry⟩
  s := IsLocalRing.closedPoint (Localization.AtPrime Q.s.asIdeal)
  specializes := sorry
  X := pullback Q.f
    (Spec.map (CommRingCat.ofHom (algebraMap Q.V (Localization.AtPrime Q.s.asIdeal))))
  f := pullback.snd _ _
  henselianLocalRing_special := sorry
  isSepClosed_special := sorry

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: the quadruple `(X, S, s, s)` with `η = s`
(the case `η = s` is allowed). -/
def ofEq : ValuationQuadruple.{u} :=
  { Q with η := Q.s, specializes := specializes_rfl }

/-- H1:valuation-nearby-cycles/valuation-base-quadruple (supporting): if `η = s` already, `ofEq`
returns the quadruple itself. -/
theorem ofEq_eq_self (h : Q.η = Q.s) : Q.ofEq = Q := sorry

/-- H1:valuation-nearby-cycles/valuation-base-quadruple: base change along `h : S' = Spec V' → S`,
the quadruple `(X ×_S S', S', η', s')` for points `η' ⤳ s'` of `S'` with `O_{S',s'}` strictly
henselian. The images `h(η') = η`, `h(s') = s` enter the morphism `Hom.ofBaseChange`. -/
def baseChange (V' : Type u) [CommRing V'] [IsDomain V'] [ValuationRing V'] (h : Q.V →+* V')
    (η' s' : PrimeSpectrum V') (hsp : η' ⤳ s')
    [HenselianLocalRing (Localization.AtPrime s'.asIdeal)]
    [IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s'.asIdeal))] :
    ValuationQuadruple.{u} where
  V := V'
  η := η'
  s := s'
  specializes := hsp
  X := pullback Q.f (Spec.map (CommRingCat.ofHom h))
  f := pullback.snd _ _
  henselianLocalRing_special := inferInstance
  isSepClosed_special := inferInstance

-- test ValuationQuadruple.ofSepClosedField (degenerate)
--   [H1:valuation-nearby-cycles/valuation-base-quadruple]
example (k : Type u) [Field k] [IsSepClosed k] (X : Scheme.{u}) (f : X ⟶ Spec (.of k)) :
    ∃ Q : ValuationQuadruple.{u}, Nonempty (Q.V ≃+* k) ∧ Q.X = X ∧ Q.η = Q.s ∧
      IsIso Q.specialFiberι := sorry

/- A strictly henselian valuation ring with value group `ℤ ×ₗ ℤ` has exactly three primes
`0 ⊊ 𝔭 ⊊ 𝔪`, and `V_{𝔭_s}` is strictly henselian exactly for `s = 𝔪`; every `η` is admissible. -/
-- test ValuationQuadruple.admissible_pairs_rank_two (computation)
--   [H1:valuation-nearby-cycles/valuation-base-quadruple]
example (V K : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [HenselianLocalRing V]
    [IsSepClosed (IsLocalRing.ResidueField V)] [Field K] [Algebra V K] [IsFractionRing V K]
    (e : ValuationRing.ValueGroup V K ≃*o WithZero (Multiplicative (ℤ ×ₗ ℤ))) :
    Nat.card (PrimeSpectrum V) = 3 ∧
      ∀ s : PrimeSpectrum V,
        (HenselianLocalRing (Localization.AtPrime s.asIdeal) ∧
          IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s.asIdeal))) ↔
        s = IsLocalRing.closedPoint V := sorry

/- `ℤ_(p)` (any nonzero prime `P = (p)` of `ℤ`) is a valuation ring, but it is not henselian and
its residue field is not separably closed, so `(Spec ℤ_(p), Spec ℤ_(p), (0), (p))` is no
quadruple. -/
-- test ValuationQuadruple.not_of_Zp (non-example)
--   [H1:valuation-nearby-cycles/valuation-base-quadruple]
example (P : Ideal ℤ) [P.IsPrime] (hP : P ≠ ⊥) :
    ValuationRing (Localization.AtPrime P) ∧ ¬ HenselianLocalRing (Localization.AtPrime P) ∧
      ¬ IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime P)) := sorry

-- ValuationQuadruple.trait_compat: not stated here; needs the henselian-trait datum of LPV.0
--   (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [compatibility test]

end ValuationQuadruple

end AlgebraicGeometry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring (lemma) -/

namespace ValuationRing

-- ValuationRing.valuationRing_strictHenselization: not stated here; needs the strict
--   henselization `A^sh` of a local ring at a separable closure of its residue field (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8); the valuation-theoretic core of (a)–(b)
--   is `ValuationRing.valuationRing_strictHenselization_core`
-- ValuationRing.strictHenselizationAutEquiv: not stated here; needs `A^sh` and its universal
--   property (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)

/-- H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring ((a)–(b), valuation-theoretic
core; Gabber–Ramero, *Almost ring theory*, Lemma 6.2.5 and its proof): let `L` be a separable
closure of `K`, `B` a valuation ring of `L` and `A = B ∩ K`, and let `F = L^I` be the fixed field
of the inertia group `I` of `B` in `Gal(L/K)`. Then `B ∩ F` (which is the strict henselization
`A^sh = (Y^I)_{𝔮 ∩ Y^I}` of (b)) is a henselian valuation ring with separably closed residue field,
and its value group is isomorphic to the value group of `A`. -/
theorem valuationRing_strictHenselization_core (K L : Type u) [Field K] [Field L] [Algebra K L]
    [IsSepClosure K L] (B : ValuationSubring L) (F : IntermediateField K L)
    (hF : F = IntermediateField.fixedField
      ((B.inertiaSubgroup K).map (B.decompositionSubgroup K).subtype)) :
    HenselianLocalRing (B.comap (algebraMap F L)) ∧
      IsSepClosed (IsLocalRing.ResidueField (B.comap (algebraMap F L))) ∧
      Nonempty ((B.comap (algebraMap K L)).ValueGroup ≃*o (B.comap (algebraMap F L)).ValueGroup) :=
  sorry

end ValuationRing

namespace AlgebraicGeometry

namespace ValuationQuadruple

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples (definition) -/

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples (supporting): the residue map
`k(η) → k(η')` of a ring map `h : V → V'` with `h⁻¹(𝔭_η') = 𝔭_η`. -/
def residueFieldEtaMap {Q Q' : ValuationQuadruple.{u}} (h : Q.V →+* Q'.V)
    (hη : Q.η.asIdeal = Q'.η.asIdeal.comap h) : Q.residueFieldEta →+* Q'.residueFieldEta :=
  IsLocalRing.ResidueField.map (Localization.localRingHom Q.η.asIdeal Q'.η.asIdeal h hη)

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples (definition): a morphism
`φ = (g, h, ι) : (X', S', η', s', L') → (X, S, η, s, L)` of quadruples with chosen separable
closures `L` of `k(η)` and `L'` of `k(η')` (Illusie, *Around the Thom–Sebastiani theorem* /
vanishing cycles over general bases §2.4(b)): a ring map `h : V → V'` (i.e. `h : S' → S`) with
`h(η') = η` and `h(s') = s`, a morphism `g : X' → X` with `f ∘ g = h ∘ f'`, and a
`k(η)`-embedding `ι : L → L'` extending the residue map `k(η) → k(η')`. -/
structure Hom (Q' : ValuationQuadruple.{u}) (L' : Type u) [Field L']
    [Algebra Q'.residueFieldEta L'] (Q : ValuationQuadruple.{u}) (L : Type u) [Field L]
    [Algebra Q.residueFieldEta L] where
  /-- The ring map `h : V → V'`, i.e. the morphism of bases `S' → S`. -/
  h : Q.V →+* Q'.V
  /-- The morphism `g : X' → X`. -/
  g : Q'.X ⟶ Q.X
  /-- The square commutes: `f ∘ g = h ∘ f'`. -/
  comm : g ≫ Q.f = Q'.f ≫ Spec.map (CommRingCat.ofHom h)
  /-- `h(η') = η`. -/
  map_η : Q.η.asIdeal = Q'.η.asIdeal.comap h
  /-- `h(s') = s`. -/
  map_s : Q.s.asIdeal = Q'.s.asIdeal.comap h
  /-- The embedding `ι : L → L'`. -/
  ι : L →+* L'
  /-- `ι` extends the residue map `k(η) → k(η')`. -/
  ι_comp : ι.comp (algebraMap Q.residueFieldEta L) =
    (algebraMap Q'.residueFieldEta L').comp (residueFieldEtaMap h map_η)

namespace Hom

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: the identity `(id, id, id_L)`. -/
def id (Q : ValuationQuadruple.{u}) (L : Type u) [Field L] [Algebra Q.residueFieldEta L] :
    Hom Q L Q L where
  h := RingHom.id Q.V
  g := 𝟙 Q.X
  comm := sorry
  map_η := sorry
  map_s := sorry
  ι := RingHom.id L
  ι_comp := sorry

variable {Q'' Q' Q : ValuationQuadruple.{u}} {L'' L' L : Type u} [Field L''] [Field L'] [Field L]
  [Algebra Q''.residueFieldEta L''] [Algebra Q'.residueFieldEta L'] [Algebra Q.residueFieldEta L]

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: componentwise composition,
`(g, h, ι) ∘ (g₁, h₁, ι₁) = (g ∘ g₁, h ∘ h₁, ι₁ ∘ ι)`. -/
def comp (ψ : Hom Q'' L'' Q' L') (φ : Hom Q' L' Q L) : Hom Q'' L'' Q L where
  h := ψ.h.comp φ.h
  g := ψ.g ≫ φ.g
  comm := sorry
  map_η := sorry
  map_s := sorry
  ι := ψ.ι.comp φ.ι
  ι_comp := sorry

-- AlgebraicGeometry.ValuationQuadruple.Hom.strictLocalizationMap: not stated here; needs the strict
--   localizations `S(η̄) = Spec (O_{S,η})^sh` and the universal property of strict henselization
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples:
`φ_# : Gal(L'/k(η')) → Gal(L/k(η))`, `σ' ↦ ι⁻¹ ∘ σ' ∘ ι`; well defined because `ι(L)` is the
separable closure of `k(η)` in `L'`, which every `σ'` preserves. -/
def galoisRestrict [IsSepClosure Q.residueFieldEta L] (φ : Hom Q' L' Q L) :
    (L' ≃ₐ[Q'.residueFieldEta] L') →* (L ≃ₐ[Q.residueFieldEta] L) :=
  sorry

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: `φ` is Cartesian, i.e. the square
`(g, f', f, h)` is a pullback square of schemes, `X' ≅ X ×_S S'`. -/
def IsCartesian (φ : Hom Q' L' Q L) : Prop :=
  IsPullback φ.g Q'.f Q.f (Spec.map (CommRingCat.ofHom φ.h))

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: `φ` is dominant, i.e. the local
homomorphism `O_{S,s} → O_{S',s'}` induced by `h` is injective. -/
def IsDominant (φ : Hom Q' L' Q L) : Prop :=
  Function.Injective (Localization.localRingHom Q.s.asIdeal Q'.s.asIdeal φ.h φ.map_s)

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: `g_s : X'_{s'} → X_s`, the induced
morphism of special fibres (characterised by `specialFiberMap_specialFiberι`). -/
def specialFiberMap (φ : Hom Q' L' Q L) : Q'.f.fiber Q'.s ⟶ Q.f.fiber Q.s :=
  sorry

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples (supporting): `i ∘ g_s = g ∘ i'`;
this determines `g_s`, as `i : X_s → X` is a monomorphism. -/
theorem specialFiberMap_specialFiberι (φ : Hom Q' L' Q L) :
    φ.specialFiberMap ≫ Q.specialFiberι = Q'.specialFiberι ≫ φ.g := sorry

/-- H1:valuation-nearby-cycles/morphism-of-valuation-quadruples: for `h : S' = Spec V' → S`, points
`η' ↦ η`, `s' ↦ s` and an embedding `ι : L → L'` over the residue map, the Cartesian morphism
`Q.baseChange … → Q` with `g` the first projection of `X ×_S S'`. -/
def ofBaseChange (Q : ValuationQuadruple.{u}) (V' : Type u) [CommRing V'] [IsDomain V']
    [ValuationRing V'] (h : Q.V →+* V') (η' s' : PrimeSpectrum V') (hsp : η' ⤳ s')
    [HenselianLocalRing (Localization.AtPrime s'.asIdeal)]
    [IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s'.asIdeal))]
    (hη : Q.η.asIdeal = η'.asIdeal.comap h) (hs : Q.s.asIdeal = s'.asIdeal.comap h)
    (L : Type u) [Field L] [Algebra Q.residueFieldEta L] (L' : Type u) [Field L']
    [Algebra (Q.baseChange V' h η' s' hsp).residueFieldEta L'] (ι : L →+* L')
    (hι : ι.comp (algebraMap Q.residueFieldEta L) =
      (algebraMap (Q.baseChange V' h η' s' hsp).residueFieldEta L').comp
        (residueFieldEtaMap (Q' := Q.baseChange V' h η' s' hsp) h hη)) :
    Hom (Q.baseChange V' h η' s' hsp) L' Q L where
  h := h
  g := pullback.fst _ _
  comm := sorry
  map_η := hη
  map_s := hs
  ι := ι
  ι_comp := hι

-- test ValuationQuadruple.Hom.id_galoisRestrict (degenerate)
--   [H1:valuation-nearby-cycles/morphism-of-valuation-quadruples]
example (Q : ValuationQuadruple.{u}) (L : Type u) [Field L] [Algebra Q.residueFieldEta L]
    [IsSepClosure Q.residueFieldEta L] :
    (Hom.id Q L).galoisRestrict = MonoidHom.id _ := sorry

/- Stated for every `φ` with `k(η')` finite separable over `k(η)`: then `φ_#` is injective with
image of index `[k(η') : k(η)]`. The integral closure `V'` of a strictly henselian discrete
valuation ring `V` in a finite separable `K'/K`, with `η, η'` generic, is the case of the packet. -/
-- test ValuationQuadruple.Hom.galoisRestrict_finiteExtension (computation)
--   [H1:valuation-nearby-cycles/morphism-of-valuation-quadruples]
example [IsSepClosure Q'.residueFieldEta L'] [IsSepClosure Q.residueFieldEta L]
    (φ : Hom Q' L' Q L) :
    letI := (residueFieldEtaMap φ.h φ.map_η).toAlgebra
    FiniteDimensional Q.residueFieldEta Q'.residueFieldEta →
      Algebra.IsSeparable Q.residueFieldEta Q'.residueFieldEta →
      Function.Injective φ.galoisRestrict ∧
        φ.galoisRestrict.range.index = Module.finrank Q.residueFieldEta Q'.residueFieldEta :=
  sorry

/- If `V'` is a field and `h : V → V'` is injective (e.g. `Spec K → Spec V`), then `h(s') = s`
forces `𝔭_s = 0`: no morphism of quadruples lies over the generic point with `s` non-generic. -/
-- test ValuationQuadruple.Hom.not_of_generization (non-example)
--   [H1:valuation-nearby-cycles/morphism-of-valuation-quadruples]
example (hV' : IsField Q'.V) (hs : Q.s.asIdeal ≠ ⊥) :
    IsEmpty {φ : Hom Q' L' Q L // Function.Injective φ.h} := sorry

/- `Hom.ofBaseChange` is Cartesian, and every Cartesian morphism with base `h` has
`X' ≅ X ×_S S'`. -/
-- test ValuationQuadruple.Hom.isCartesian_baseChange (characterisation)
--   [H1:valuation-nearby-cycles/morphism-of-valuation-quadruples]
example (Q : ValuationQuadruple.{u}) (V' : Type u) [CommRing V'] [IsDomain V']
    [ValuationRing V'] (h : Q.V →+* V') (η' s' : PrimeSpectrum V') (hsp : η' ⤳ s')
    [HenselianLocalRing (Localization.AtPrime s'.asIdeal)]
    [IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s'.asIdeal))]
    (hη : Q.η.asIdeal = η'.asIdeal.comap h) (hs : Q.s.asIdeal = s'.asIdeal.comap h)
    (L : Type u) [Field L] [Algebra Q.residueFieldEta L] (L' : Type u) [Field L']
    [Algebra (Q.baseChange V' h η' s' hsp).residueFieldEta L'] (ι : L →+* L')
    (hι : ι.comp (algebraMap Q.residueFieldEta L) =
      (algebraMap (Q.baseChange V' h η' s' hsp).residueFieldEta L').comp
        (residueFieldEtaMap (Q' := Q.baseChange V' h η' s' hsp) h hη)) :
    (ofBaseChange Q V' h η' s' hsp hη hs L L' ι hι).IsCartesian ∧
      ∀ (Q₁ : ValuationQuadruple.{u}) (L₁ : Type u) [Field L₁] [Algebra Q₁.residueFieldEta L₁]
        (φ : Hom Q₁ L₁ Q L), φ.IsCartesian →
          Nonempty (Q₁.X ≅ pullback Q.f (Spec.map (CommRingCat.ofHom φ.h))) := sorry

end Hom

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base (construction) -/

-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles: not stated here; needs the pullbacks `i^*`,
--   `j^*` and the derived push-forward `Rj_*` of étale sheaves of `Λ`-modules along morphisms of
--   schemes (Mathlib has `Scheme.smallEtaleTopology`, `DerivedCategory.Plus` and
--   `Functor.rightDerivedFunctorPlus`, not the functoriality of the small étale site) and the tube
--   `X ×_S S(η̄)` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_def: not stated here; needs `nearbyCycles`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.tube: not stated here; needs the strict localization
--   `S(η̄) = Spec (O_{S,η})^sh` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.specialization: not stated here; needs the unit of
--   `j^* ⊣ Rj_*` on étale sheaves (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesGeo: not stated here; needs `nearbyCycles` and
--   the geometric fibre `X ×_S η̄ → X ×_S S(η̄)` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_ofEq: not stated here; needs `nearbyCycles`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and continuity along the
--   pro-open immersion `X ×_S Spec O_{S,s} → X` (supplier: AdicCoefficientsAndComparisons:L2)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_generic: not stated here; needs
--   `nearbyCyclesGeo` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_stalk: not stated here; needs strict
--   localizations `X_(x̄)` of schemes and the stalk formula for `Rj_*` at the points
--   `Scheme.pointSmallEtale` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8;
--   AdicCoefficientsAndComparisons:L2)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_restrictScalars: not stated here; needs
--   `nearbyCycles` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCycles_trait: not stated here; needs `nearbyCycles`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and LPV.0's `RΨ_η`
--   (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
-- ValuationQuadruple.nearbyCycles_ofEq_sheaf: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [degenerate test]
-- ValuationQuadruple.nearbyCycles_base: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [computation test]
-- ValuationQuadruple.nearbyCycles_kummer: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [computation test]
-- ValuationQuadruple.nearbyCycles_ne_nonGeometric: not stated here; needs `Rj_*` along
--   `X_η → X` and continuous Galois cohomology (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8; ArithmeticGaloisDuality:R02.1)
--   [non-example test]
-- ValuationQuadruple.nearbyCycles_trait_compat: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and LPV.0's `RΨ_η` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles (construction) -/

-- AlgebraicGeometry.ValuationQuadruple.galoisAction: not stated here; needs `nearbyCycles` and the
--   `Gal(L/k(η))`-action on the strict localization `S(η̄)` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.galoisAction_mul: not stated here; needs `galoisAction`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.galoisAction_one: not stated here; needs `galoisAction`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.galoisAction_natural: not stated here; needs `galoisAction`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.isDiscrete_stalk_cohomology: not stated here; needs the
--   stalks of `R^qΨ_L` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and discrete
--   modules over a profinite group (supplier:
--   tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections)
-- AlgebraicGeometry.ValuationQuadruple.specialization_galoisInvariant: not stated here; needs
--   `specialization` and `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.galoisAction_eq_inertia: not stated here; needs
--   `galoisAction` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8); its ring-level
--   core is `galoisAction_eq_inertia_ring` below
-- AlgebraicGeometry.ValuationQuadruple.galoisAction_trait: not stated here; needs `galoisAction`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and LPV.0's inertia action
--   (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)

/-- H1:valuation-nearby-cycles/galois-action-on-nearby-cycles (`galoisAction_eq_inertia`, ring-level
core; Gabber–Ramero, *Almost ring theory*, (6.2.10)): if `B` is a valuation ring of a separable
closure `L` of `K` whose restriction `A = B ∩ K` is henselian with separably closed residue field,
then the decomposition group and the inertia group of `B` are all of `Gal(L/K)`; this is the case
`η` generic, `V = O_{S,s}` strictly henselian. -/
theorem galoisAction_eq_inertia_ring (K L : Type u) [Field K] [Field L] [Algebra K L]
    [IsSepClosure K L] (B : ValuationSubring L)
    [HenselianLocalRing (B.comap (algebraMap K L))]
    [IsSepClosed (IsLocalRing.ResidueField (B.comap (algebraMap K L)))] :
    B.decompositionSubgroup K = ⊤ ∧ B.inertiaSubgroup K = ⊤ := sorry

-- ValuationQuadruple.galoisAction_ofEq: not stated here; needs `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [degenerate test]
-- ValuationQuadruple.galoisAction_kummer: not stated here; needs `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [computation test]
-- ValuationQuadruple.galoisAction_nontrivial: not stated here; needs `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [non-example test]
-- ValuationQuadruple.galoisAction_specialization: not stated here; needs `specialization` and
--   `galoisAction` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
--   [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula (lemma) -/

-- ValuationQuadruple.nearbyCycles_stalk_milnorTube: not stated here; the natural isomorphism
--   `(RΨ_L F)_x̄ ≅ RΓ(X_(x̄) ×_S S(η̄), F)` (API item `nearbyCycles_stalk` above) needs strict
--   localizations `X_(x̄)` of schemes and the stalk formula for `Rj_*` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8; AdicCoefficientsAndComparisons:L2)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map (construction) -/

-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange: not stated here; needs
--   `nearbyCycles`, `Hom.strictLocalizationMap` and the base-change morphism
--   `g^* Rj_* → Rj'_* g̃^*` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_id: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_comp: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_equivariant: not stated here; needs
--   `nearbyCyclesBaseChange` and `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_specialization: not stated here;
--   needs `nearbyCyclesBaseChange` and `specialization` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_stalk: not stated here; needs
--   `nearbyCyclesBaseChange` and strict localizations of schemes (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
-- AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_isIso: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8); its
--   hypotheses `Hom.IsCartesian`, `Hom.IsDominant` and `residueCharExp` are stated above
-- ValuationQuadruple.nearbyCyclesBaseChange_id_example: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
--   [degenerate test]
-- ValuationQuadruple.nearbyCyclesBaseChange_localize: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
--   [computation test]
-- ValuationQuadruple.nearbyCyclesBaseChange_not_iso_nonCartesian: not stated here; needs
--   `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)
--   [non-example test]
-- ValuationQuadruple.nearbyCyclesBaseChange_equivariant_example: not stated here; needs
--   `nearbyCyclesBaseChange` and `galoisAction` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-equivariant-transport (lemma) -/

-- ValuationQuadruple.nearbyCyclesTransport: not stated here; the isomorphism
--   `RΨ_{L₁} ≅ RΨ_{L₂}` of a `k(η)`-isomorphism `τ : L₁ ≅ L₂`, and `nearbyCycles_localize_iso`,
--   need `nearbyCyclesBaseChange` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8;
--   AdicCoefficientsAndComparisons:L2)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward (lemma) -/

-- ValuationQuadruple.nearbyCycles_etaleRestrict_iso,
--   ValuationQuadruple.nearbyCycles_properPushforward_iso and
--   ValuationQuadruple.nearbyCycles_projectiveReduction: not stated here; need
--   `nearbyCyclesBaseChange`, proper base change and extension by zero of étale sheaves (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/radicial-invariance-of-nearby-cycles (lemma) -/

-- ValuationQuadruple.nearbyCyclesBaseChange_isIso_of_purelyInseparable: not stated here; (iii)–(iv)
--   need `nearbyCyclesBaseChange` and topological invariance of the small étale site (Stacks 04DZ)
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8); the valuation-theoretic core of
--   (i) is `ValuationRing.existsUnique_comap_eq_of_isPurelyInseparable`

end ValuationQuadruple

end AlgebraicGeometry

namespace ValuationRing

/-- H1:valuation-nearby-cycles/radicial-invariance-of-nearby-cycles ((i), valuation-theoretic core;
Gabber–Ramero, *Almost ring theory*, Example 6.1.4(ii)): along a purely inseparable algebraic
extension `K'/K`, a valuation ring `V` of `K` has exactly one extension to `K'` (namely the
integral closure of `V` in `K'`). -/
theorem existsUnique_comap_eq_of_isPurelyInseparable {K K' : Type u} [Field K] [Field K']
    [Algebra K K'] [IsPurelyInseparable K K'] (V : ValuationSubring K) :
    ∃! A : ValuationSubring K', A.comap (algebraMap K K') = V := sorry

end ValuationRing

namespace AlgebraicGeometry

namespace ValuationQuadruple

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits (lemma) -/

-- ValuationQuadruple.nearbyCycles_colim_iso: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8), continuity of étale cohomology along
--   limits (supplier: AdicCoefficientsAndComparisons:L2) and constructible sheaves (supplier:
--   SchemeAndStackFoundations:SF.2:ConstructibleEtale:7-9)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point (theorem) -/

-- ValuationQuadruple.nearbyCycles_toGeo_isIso: not stated here; needs `nearbyCycles` and
--   `nearbyCyclesGeo` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-cohomological-amplitude (lemma) -/

-- ValuationQuadruple.nearbyCycles_homology_eq_zero_of_lt: not stated here; needs `nearbyCycles`
--   (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and the étale cohomological
--   dimension bound over separably closed fields (supplier:
--   SchemeAndStackFoundations:SF.2:ConstructibleEtale:7-9)

end ValuationQuadruple

end AlgebraicGeometry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field (lemma) -/

namespace ValuationRing

-- ValuationRing.tameGaloisEquiv, ValuationRing.wildInertia_isSylow: not stated here; the
--   profinite statements (i) and (iii) need the maximal tame extension and profinite Sylow theory
--   (supplier: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory); their
--   finite-level core is `ValuationRing.exists_normal_isPGroup_of_isGalois`

/-- H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field ((ii)–(iii), finite-level
core; Gabber–Ramero, *Almost ring theory*, Proposition 6.2.12 and (6.2.17)): let `V` be a henselian
valuation ring of `K` with separably closed residue field of characteristic exponent `p`. For every
finite Galois extension `E/K`, `Gal(E/K)` has a normal `p`-subgroup `P` of index prime to `p` (the
wild inertia, a `p`-Sylow subgroup) with abelian quotient `Gal(E/K)/P ↪ Hom(Γ_E/Γ, μ(κ))`. -/
theorem exists_normal_isPGroup_of_isGalois (K : Type u) [Field K] (V : ValuationSubring K)
    [HenselianLocalRing V] [IsSepClosed (IsLocalRing.ResidueField V)] (E : Type u) [Field E]
    [Algebra K E] [FiniteDimensional K E] [IsGalois K E] :
    ∃ P : Subgroup (E ≃ₐ[K] E), P.Normal ∧
      IsPGroup (ringExpChar (IsLocalRing.ResidueField V)) P ∧
      Nat.Coprime (ringExpChar (IsLocalRing.ResidueField V)) P.index ∧
      ∀ σ τ : E ≃ₐ[K] E, σ * τ * σ⁻¹ * τ⁻¹ ∈ P := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient (lemma) -/

-- ValuationRing.inflation_bijective_wildInertia: not stated here; the profinite statement needs
--   continuous cohomology of discrete modules in all degrees and the Hochschild–Serre spectral
--   sequence (supplier: ArithmeticGaloisDuality:R02.1, ArithmeticGaloisDuality:R02.2;
--   tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees); its
--   finite-group core is `ValuationRing.inflation_isIso_of_isPGroup`

/-- H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient ((i)–(ii), finite-group
core; Scholze, *Étale cohomology of diamonds*, proof of Proposition 21.16): for a finite group
`G`, a normal `p`-subgroup `P` and a representation `A` over a ring `k` in which `p` is invertible,
`H^q(P, A) = 0` for `q > 0` and inflation `H^n(G/P, A^P) → H^n(G, A)` is an isomorphism for all
`n`. -/
theorem inflation_isIso_of_isPGroup {k G : Type u} [CommRing k] [Group G] [Finite G] (p : ℕ)
    (P : Subgroup G) [P.Normal] (hP : IsPGroup p P) (hp : IsUnit (p : k)) (A : Rep k G) :
    (∀ q : ℕ, 0 < q → Limits.IsZero (groupCohomology (Rep.res P.subtype A) q)) ∧
      ∀ n : ℕ, IsIso ((groupCohomology.infNatTrans k P n).app A) := sorry

end ValuationRing

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-valuation (construction) -/

namespace Valuation

open Polynomial

variable {K Γ₀ : Type*} [Field K] [LinearOrderedCommGroupWithZero Γ₀]

/-- H1:valuation-nearby-cycles/gauss-valuation (construction): the Gauss valuation (centre `0`,
radius `1`) on `K[T]`, `|a₀ + a₁T + ⋯ + a_mT^m|_G = maxᵢ |aᵢ|` (Gabber–Ramero, *Almost ring
theory*, Example 6.1.4(iii)). -/
def gaussPoly (v : Valuation K Γ₀) : Valuation K[X] Γ₀ where
  toFun p := p.support.sup fun i ↦ v (p.coeff i)
  map_zero' := sorry
  map_one' := sorry
  map_mul' := sorry
  map_add_le_max' := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: the extension `|p/q|_G = |p|_G / |q|_G` of
`gaussPoly` to `K(T)`, a valuation with values in `Γ₀`. -/
def gauss (v : Valuation K Γ₀) : Valuation (RatFunc K) Γ₀ where
  toFun r := gaussPoly v r.num / gaussPoly v r.denom
  map_zero' := sorry
  map_one' := sorry
  map_mul' := sorry
  map_add_le_max' := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: `|a|_G = |a|` for constants `a ∈ K`. -/
@[simp]
theorem gauss_C (v : Valuation K Γ₀) (a : K) : gauss v (RatFunc.C a) = v a := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: `|T|_G = 1`. -/
@[simp]
theorem gauss_X (v : Valuation K Γ₀) : gauss v RatFunc.X = 1 := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: Gauss's lemma, `|fg|_G = |f|_G |g|_G`. -/
theorem gaussPoly_mul (v : Valuation K Γ₀) (p q : K[X]) :
    gaussPoly v (p * q) = gaussPoly v p * gaussPoly v q := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: the value group of `|·|_G` equals the value group
of `|·|` (in particular `V(T)` has the rank of `V`). -/
theorem gauss_valueGroup (v : Valuation K Γ₀) :
    MonoidWithZeroHom.valueGroup (.ofClass (gauss v)) =
      MonoidWithZeroHom.valueGroup (.ofClass v) := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: for a rank-one valuation realised by an absolute
value `w : K → ℝ`, the Gauss valuation is Mathlib's `Polynomial.gaussNorm w 1`. -/
theorem gauss_eq_gaussNorm (v : Valuation K NNReal) (w : AbsoluteValue K ℝ)
    (hw : ∀ a, (v a : ℝ) = w a) (p : K[X]) : (gaussPoly v p : ℝ) = p.gaussNorm w 1 := sorry

end Valuation

namespace ValuationRing

open Polynomial

/-- H1:valuation-nearby-cycles/gauss-valuation: the Gauss valuation ring
`V(T) = {h ∈ K(T) : |h|_G ≤ 1}` of a valuation ring `V` of `K`. -/
def gaussRing (K : Type*) [Field K] (V : ValuationSubring K) : ValuationSubring (RatFunc K) :=
  (Valuation.gauss V.valuation).valuationSubring

/-- H1:valuation-nearby-cycles/gauss-valuation: `V(T) = V[T]_{𝔪V[T]}` inside `K(T)`: its elements
are the quotients `p/q` with `p, q ∈ V[T]` and `q ∉ 𝔪V[T]`. -/
theorem gaussRing_eq_localization (K : Type*) [Field K] (V : ValuationSubring K) (h : RatFunc K) :
    h ∈ gaussRing K V ↔ ∃ p q : V[X], q ∉ Ideal.map Polynomial.C (IsLocalRing.maximalIdeal V) ∧
      h = algebraMap K[X] (RatFunc K) (p.map (algebraMap V K)) /
        algebraMap K[X] (RatFunc K) (q.map (algebraMap V K)) := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: the residue field of `V(T)` is `κ(T)`. -/
def gaussRing_residueFieldEquiv (K : Type*) [Field K] (V : ValuationSubring K) :
    IsLocalRing.ResidueField (gaussRing K V) ≃+* RatFunc (IsLocalRing.ResidueField V) :=
  sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: `V(T) ∩ K = V`, and `V → V(T)` is local:
`x ∈ K` is a non-unit of `V` iff it is a non-unit of `V(T)`. -/
theorem gaussRing_inf_K (K : Type*) [Field K] (V : ValuationSubring K) :
    (gaussRing K V).comap (algebraMap K (RatFunc K)) = V ∧
      ∀ x : K, x ∈ V.nonunits ↔ algebraMap K (RatFunc K) x ∈ (gaussRing K V).nonunits := sorry

/-- H1:valuation-nearby-cycles/gauss-valuation: the Gauss valuation ring `V(T₁, …, T_d)` of
`|Σ a_α T^α|_G = max |a_α|` on `K(T₁, …, T_d)`. -/
def gaussRingMv (K : Type*) [Field K] (V : ValuationSubring K) (d : ℕ) :
    ValuationSubring (FractionRing (MvPolynomial (Fin d) K)) :=
  sorry

end ValuationRing

namespace Valuation

open Polynomial

/- `V = ℤ_(p)`, the valuation ring of the `p`-adic valuation on `ℚ`. -/
-- test Valuation.gauss_example_Zp (computation) [H1:valuation-nearby-cycles/gauss-valuation]
example (p : ℕ) [Fact p.Prime] :
    gauss (Rat.padicValuation p) (RatFunc.C (p : ℚ) + RatFunc.X) = 1 ∧
      gauss (Rat.padicValuation p) (RatFunc.C (p : ℚ) * RatFunc.X ^ 2 + RatFunc.C ((p : ℚ) ^ 2)) =
        Rat.padicValuation p p ∧
      (RatFunc.C (p : ℚ) + RatFunc.X)⁻¹ ∈
        ValuationRing.gaussRing ℚ (Rat.padicValuation p).valuationSubring ∧
      (RatFunc.C (p : ℚ) + RatFunc.X) / RatFunc.C (p : ℚ) ∉
        ValuationRing.gaussRing ℚ (Rat.padicValuation p).valuationSubring := sorry

-- test Valuation.gauss_trivial (degenerate) [H1:valuation-nearby-cycles/gauss-valuation]
example (K : Type*) [Field K] [DecidableEq K] (Γ₀ : Type*) [LinearOrderedCommGroupWithZero Γ₀] :
    (∀ h : RatFunc K, h ≠ 0 → gauss (1 : Valuation K Γ₀) h = 1) ∧
      ValuationRing.gaussRing K ⊤ = ⊤ := sorry

-- test Valuation.gauss_eq_gaussNorm_example (compatibility)
--   [H1:valuation-nearby-cycles/gauss-valuation]
example (K : Type*) [Field K] (v : Valuation K NNReal) (w : AbsoluteValue K ℝ)
    (hw : ∀ a, (v a : ℝ) = w a) (a b : K) :
    (gaussPoly v (C a * X + C b) : ℝ) = (C a * X + C b).gaussNorm w 1 ∧
      (gaussPoly v (C a * X + C b) : ℝ) = max (w a) (w b) := sorry

/- The local ring `V[T]_{(𝔪, T)}` at the origin of the special fibre is not a valuation ring
(neither `π ∣ T` nor `T ∣ π`), so it is not `V(T)`. -/
-- test Valuation.gaussRing_ne_localization_at_origin (non-example)
--   [H1:valuation-nearby-cycles/gauss-valuation]
example (K : Type*) [Field K] (V : ValuationSubring K) (π : V) (hπ0 : π ≠ 0)
    (hπ : π ∈ IsLocalRing.maximalIdeal V) (Q : Ideal V[X]) [Q.IsPrime]
    (hQ : Q = Ideal.map C (IsLocalRing.maximalIdeal V) ⊔ Ideal.span {X}) :
    ¬ ValuationRing (Localization.AtPrime Q) := sorry

-- test Valuation.gaussRing_residueField (characterisation)
--   [H1:valuation-nearby-cycles/gauss-valuation]
example (K : Type*) [Field K] (V : ValuationSubring K) :
    Nonempty (IsLocalRing.ResidueField (ValuationRing.gaussRing K V) ≃+*
        RatFunc (IsLocalRing.ResidueField V)) ∧
      (ValuationRing.gaussRing K V).comap (algebraMap K (RatFunc K)) = V := sorry

end Valuation

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-extension-tame-inertia-comparison (lemma) -/

-- ValuationRing.gaussTameRestrict_bijective: not stated here; needs the strict henselization of
--   `V(T₁, …, T_d)` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8), the maximal
--   tame extension (supplier:
--   tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory)
--   and continuous Galois cohomology (supplier: ArithmeticGaloisDuality:R02.2)

namespace AlgebraicGeometry

namespace ValuationQuadruple

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles (theorem) -/

-- The statement of this theorem is the API item `nearbyCyclesBaseChange_isIso` of
--   nearby-cycles-base-change-map, not stated there; it needs `nearbyCyclesBaseChange` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and the prime-to-`p` Galois cohomology of
--   ArithmeticGaloisDuality:R02.1–R02.2

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/noetherian-coefficient-change-for-constructibility (lemma) -/

-- ValuationQuadruple.isConstructible_nearbyCycles_of_noetherian: not stated here; needs
--   `nearbyCycles` (supplier: SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and constructible
--   sheaves of `B`-modules with `D^b_c` (supplier:
--   SchemeAndStackFoundations:SF.2:ConstructibleEtale:7-9)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles (theorem) -/

-- ValuationQuadruple.isConstructible_nearbyCycles: not stated here; needs `nearbyCycles` (supplier:
--   SchemeAndStackFoundations:SF.2:EtaleBaseChange:3-8) and constructible sheaves of `B`-modules on
--   qcqs schemes (supplier: SchemeAndStackFoundations:SF.2:ConstructibleEtale:7-9)

end ValuationQuadruple

end AlgebraicGeometry

end TauCeti

end

/-! # Stage H1:valuation-exports. Interfaces for analytic invariance and support

The ring-level statements of this stage (surjective maps of valuation spectra, strict
henselianity of valuation rings with algebraically closed fraction field, the topology of the
special locus of `Spec A`, the finite-type reduction) are stated on Mathlib's `ValuationRing`,
`ValuationSubring`, `IsLocalHom`, `Module.FaithfullyFlat`, `HenselianLocalRing` and schemes, and
on Tau Ceti's Huber pairs and `Pair.Hom.spaComap`. The cohomological statements need the
valuation-base quadruples, the nearby-cycle functor `RΨ = i^*Rj_*` and its base-change map of
ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles, bounded-below derived categories of étale
sheaves on schemes with `RΓ`, `Rj_*`, `i^*` and compact supports (SchemeAndStackFoundations:SF.2),
and, for the comparison with tubes, the pseudo-adic spaces and the isomorphisms of
ClassicalAdicEtaleCohomology:H1:formal-adic-comparison. None of these is in the libraries, so those
items are comments naming their supplier; ring-level cores of their unit tests are stated where
they exist. -/

noncomputable section

universe u

namespace TauCeti

namespace Huber

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change (definition) -/

section SurjectiveValuationMap

variable {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]

/-- H1:valuation-exports/surjective-valuation-base-change (definition; Scholze, *Étale cohomology
of diamonds*, Lemma 16.3): a ring homomorphism `φ : A → B` is a *surjective map of valuation
spectra* if `Spec(φ) : Spec B → Spec A`, `𝔮 ↦ φ⁻¹(𝔮)`, is surjective. The predicate involves no
topology; it is used for valuation rings of every rank, rank `0` (fields) included. -/
def IsSurjectiveValuationMap (φ : A →+* B) : Prop :=
  Function.Surjective (PrimeSpectrum.comap φ)

/-- H1:valuation-exports/surjective-valuation-base-change, (i) ⇔ (ii): for valuation rings `A`,
`B`, `Spec(φ)` is surjective if and only if `φ` is injective and local, `φ⁻¹(𝔪_B) = 𝔪_A`. -/
theorem isSurjectiveValuationMap_iff_injective_and_isLocalHom [IsDomain A] [ValuationRing A]
    [IsDomain B] [ValuationRing B] (φ : A →+* B) :
    IsSurjectiveValuationMap φ ↔ Function.Injective φ ∧ IsLocalHom φ := sorry

/-- H1:valuation-exports/surjective-valuation-base-change, (i) ⇔ (iii): for valuation rings `A`,
`B` and an `A`-algebra structure on `B`, `Spec B → Spec A` is surjective if and only if `B` is a
faithfully flat `A`-module. -/
theorem isSurjectiveValuationMap_iff_faithfullyFlat [IsDomain A] [ValuationRing A] [IsDomain B]
    [ValuationRing B] [Algebra A B] :
    IsSurjectiveValuationMap (algebraMap A B) ↔ Module.FaithfullyFlat A B := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: a surjective map of valuation spectra
out of a domain is injective, since the zero ideal of `A` is a contracted prime. -/
theorem IsSurjectiveValuationMap.injective [IsDomain A] {φ : A →+* B}
    (h : IsSurjectiveValuationMap φ) : Function.Injective φ := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: a surjective map of valuation spectra
is a local homomorphism. -/
theorem IsSurjectiveValuationMap.isLocalHom {φ : A →+* B} (h : IsSurjectiveValuationMap φ) :
    IsLocalHom φ := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: the identity is a surjective map of
valuation spectra. -/
theorem IsSurjectiveValuationMap.id : IsSurjectiveValuationMap (RingHom.id A) := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: surjective maps of valuation spectra
compose, as `Spec(ψ ∘ φ) = Spec(φ) ∘ Spec(ψ)` (`PrimeSpectrum.comap_comp`). -/
theorem IsSurjectiveValuationMap.comp {φ : A →+* B} {ψ : B →+* C}
    (hφ : IsSurjectiveValuationMap φ) (hψ : IsSurjectiveValuationMap ψ) :
    IsSurjectiveValuationMap (ψ.comp φ) := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: every ring homomorphism of fields is a
surjective map of valuation spectra (rank `0`, where `η = s`). -/
theorem IsSurjectiveValuationMap.of_field {K L : Type*} [Field K] [Field L] (φ : K →+* L) :
    IsSurjectiveValuationMap φ := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: for local domains, `Spec(φ)` of a
surjective map of valuation spectra sends the closed point to the closed point and the generic
point to the generic point. -/
theorem IsSurjectiveValuationMap.comap_closedPoint [IsDomain A] [IsLocalRing A] [IsDomain B]
    [IsLocalRing B] {φ : A →+* B} (h : IsSurjectiveValuationMap φ) :
    PrimeSpectrum.comap φ (IsLocalRing.closedPoint B) = IsLocalRing.closedPoint A ∧
      PrimeSpectrum.comap φ ⟨⊥, Ideal.isPrime_bot⟩ = ⟨⊥, Ideal.isPrime_bot⟩ := sorry

/-- H1:valuation-exports/surjective-valuation-base-change, continuity clause (Kato 2021 §3.2,
after Huber 1996 Definition 1.1.4): let `A`, `B` be microbial valuation rings with height-one
primes `𝔭_A`, `𝔭_B`; the inclusion `φ(𝔭_A) ⊆ 𝔭_B` is the continuity of `φ` for the valuation
topologies. A continuous surjective map of valuation spectra satisfies `φ⁻¹(𝔭_B) = 𝔭_A`. -/
theorem IsSurjectiveValuationMap.comap_heightOnePrime [IsDomain A] [ValuationRing A] [IsDomain B]
    [ValuationRing B] {φ : A →+* B} (h : IsSurjectiveValuationMap φ) (pA : Ideal A)
    (pB : Ideal B) [pA.IsPrime] [pB.IsPrime] (hpA : pA.height = 1) (hpB : pB.height = 1)
    (hφ : pA.map φ ≤ pB) : pB.comap φ = pA := sorry

/-- H1:valuation-exports/surjective-valuation-base-change: for valuation subrings `V ⊆ K` and
`W ⊆ L` of fields `K ⊆ L` with `V ⊆ W`, the inclusion `V → W` is a surjective map of valuation
spectra if and only if `W ∩ K = V`. -/
theorem isSurjectiveValuationMap_iff_inter_eq {K L : Type*} [Field K] [Field L] [Algebra K L]
    (V : ValuationSubring K) (W : ValuationSubring L) (h : ∀ x ∈ V, algebraMap K L x ∈ W) :
    IsSurjectiveValuationMap ((algebraMap K L).restrict V W h) ↔
      W.comap (algebraMap K L) = V := sorry

section Spa

variable {C₃ C₁ : Type*} [NontriviallyNormedField C₃] [IsUltrametricDist C₃] [CompleteSpace C₃]
  [IsAlgClosed C₃] [IsTateRing C₃] [NontriviallyNormedField C₁] [IsUltrametricDist C₁]
  [CompleteSpace C₁] [IsAlgClosed C₁] [IsTateRing C₁]

/-- H1:valuation-exports/surjective-valuation-base-change, Spa clause (Scholze, *Étale cohomology
of diamonds*, Lemma 16.3): let `φ : C₃ → C₁` be a continuous extension of algebraically closed
nonarchimedean fields and `C₃⁺`, `C₁⁺` plus rings that are valuation subrings (open and bounded,
as plus rings), with `φ(C₃⁺) ⊆ C₁⁺`. Then `Spa(C₁, C₁⁺) → Spa(C₃, C₃⁺)` is surjective if and only
if `C₃⁺ → C₁⁺` is a surjective map of valuation spectra. -/
theorem IsSurjectiveValuationMap.spa_surjective_iff (S₃ : Pair C₃) (S₁ : Pair C₁)
    (hS₃ : ∀ x : C₃, x ∈ S₃.plus ∨ x⁻¹ ∈ S₃.plus) (hS₁ : ∀ x : C₁, x ∈ S₁.plus ∨ x⁻¹ ∈ S₁.plus)
    (φ : Pair.Hom S₃ S₁) :
    Function.Surjective φ.spaComap ↔
      IsSurjectiveValuationMap (φ.toRingHom.restrict S₃.plus S₁.plus φ.map_mem_plus) := sorry

end Spa

/- `C ⊆ C'` complete algebraically closed nonarchimedean fields: `Spec 𝒪_{C'} = {0, 𝔪'}` maps onto
`Spec 𝒪_C = {0, 𝔪}`, with `𝒪_C = C°` the power-bounded subring. -/
-- test isSurjectiveValuationMap_test_rankOne (computation)
--   [H1:valuation-exports/surjective-valuation-base-change]
example {C C' : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [IsTateRing C] [NontriviallyNormedField C'] [IsUltrametricDist C']
    [CompleteSpace C'] [IsAlgClosed C'] [IsTateRing C'] [NormedAlgebra C C']
    (h : ∀ x ∈ powerBoundedSubring C, algebraMap C C' x ∈ powerBoundedSubring C') :
    IsSurjectiveValuationMap
      ((algebraMap C C').restrict (powerBoundedSubring C) (powerBoundedSubring C') h) := sorry

/- A rank-two valuation subring `C⁺ ⊊ 𝒪_C`: the closed point of `Spec 𝒪_C` maps to the height-one
prime of `C⁺`, so the injective inclusion `C⁺ → 𝒪_C` is not a surjective map of valuation
spectra; a definition by injectivity alone fails this test. -/
-- test isSurjectiveValuationMap_test_rankTwoToRankOne (non-example)
--   [H1:valuation-exports/surjective-valuation-base-change]
example {C : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [IsTateRing C] (V W : ValuationSubring C)
    (hW : W.toSubring = powerBoundedSubring C) (hV : ringKrullDim V = 2) (hVW : V ≤ W) :
    ¬ IsSurjectiveValuationMap (ValuationSubring.inclusion V W hVW) := sorry

/- A rank-two valuation ring `A` with height-one prime `𝔭`: the local surjection `A → A/𝔭` misses
the generic point of `Spec A`; a definition by locality alone fails this test. -/
-- test isSurjectiveValuationMap_test_quotient (non-example)
--   [H1:valuation-exports/surjective-valuation-base-change]
example {A : Type*} [CommRing A] [IsDomain A] [ValuationRing A] (hA : ringKrullDim A = 2)
    (p : Ideal A) [p.IsPrime] (hp : p.height = 1) :
    ¬ IsSurjectiveValuationMap (Ideal.Quotient.mk p) := sorry

/- Fields: `η = s`. -/
-- test isSurjectiveValuationMap_test_field (degenerate)
--   [H1:valuation-exports/surjective-valuation-base-change]
example {K L : Type*} [Field K] [Field L] (φ : K →+* L) : IsSurjectiveValuationMap φ := sorry

/- `ℤ_(p) = ℚ ∩ ℤ_p → ℤ_p`: a surjective map of valuation spectra, and `ℤ_p` is faithfully flat
over `ℤ_(p)`. -/
-- test isSurjectiveValuationMap_test_faithfullyFlat (compatibility)
--   [H1:valuation-exports/surjective-valuation-base-change]
example (p : ℕ) [Fact p.Prime] (Z : Subring ℚ)
    (hZ : Z = (PadicInt.subring p).comap (Rat.castHom ℚ_[p]))
    (h : ∀ x ∈ Z, Rat.castHom ℚ_[p] x ∈ PadicInt.subring p) :
    IsSurjectiveValuationMap ((Rat.castHom ℚ_[p]).restrict Z (PadicInt.subring p) h) ∧
      letI := ((Rat.castHom ℚ_[p]).restrict Z (PadicInt.subring p) h).toAlgebra
      Module.FaithfullyFlat Z (PadicInt.subring p) := sorry

/- A rank-two plus ring `C⁺ ⊊ 𝒪_C`: `Spa(C, 𝒪_C) → Spa(C, C⁺)` is not surjective, matching the
failure of `IsSurjectiveValuationMap` for `C⁺ → 𝒪_C` and `𝒪_C ∩ C = 𝒪_C ≠ C⁺`. -/
-- test isSurjectiveValuationMap_test_spa (characterisation)
--   [H1:valuation-exports/surjective-valuation-base-change]
example {C : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [IsTateRing C] (S T : Pair C) (hS : ∀ x : C, x ∈ S.plus ∨ x⁻¹ ∈ S.plus)
    (hS₂ : ringKrullDim S.plus = 2) (hT : T.plus = powerBoundedSubring C)
    (hST : S.plus ≤ T.plus) :
    ¬ Function.Surjective
        (Pair.Hom.spaComap (⟨RingHom.id C, continuous_id, fun _ ha => hST ha⟩ : Pair.Hom S T)) ∧
      ¬ IsSurjectiveValuationMap (Subring.inclusion hST) := sorry

end SurjectiveValuationMap

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian (lemma) -/

/-- H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian (Stacks Tag 0DCQ):
a valuation ring `V` whose fraction field `K` is algebraically closed is absolutely integrally
closed: every monic polynomial of positive degree over `V` has a root in `V`, so every monic
polynomial over `V` is a product of linear factors over `V`. -/
theorem ValuationRing.exists_isRoot_of_isAlgClosed (V K : Type*) [CommRing V] [IsDomain V]
    [ValuationRing V] [Field K] [Algebra V K] [IsFractionRing V K] [IsAlgClosed K]
    (f : Polynomial V) (hf : f.Monic) (hdeg : 0 < f.natDegree) : ∃ a : V, f.IsRoot a := sorry

/-- H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian (Stacks Tags 0DCQ
and 0DCS): a valuation ring whose fraction field is algebraically closed is a henselian local
ring. With `isAlgClosed_residueField_of_isAlgClosed` it is strictly henselian; this covers every
open and bounded valuation subring `C⁺` of an algebraically closed nonarchimedean field `C`. -/
theorem ValuationRing.henselianLocalRing_of_isAlgClosed (V K : Type*) [CommRing V] [IsDomain V]
    [ValuationRing V] [Field K] [Algebra V K] [IsFractionRing V K] [IsAlgClosed K] :
    HenselianLocalRing V := sorry

/-- H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian (Stacks Tag 0DCS):
the residue field of a valuation ring whose fraction field is algebraically closed is
algebraically closed. -/
theorem ValuationRing.isAlgClosed_residueField_of_isAlgClosed (V K : Type*) [CommRing V]
    [IsDomain V] [ValuationRing V] [Field K] [Algebra V K] [IsFractionRing V K]
    [IsAlgClosed K] :
    IsAlgClosed (IsLocalRing.ResidueField V) := sorry

-- ValuationRing.valuationBaseQuadruple_of_isAlgClosed (for every `C⁺`-scheme `X`,
--   `(X, Spec C⁺, η, s)` is a valuation-base quadruple whose strict localisation at `η` is `η`):
--   not stated here; needs the valuation-base quadruple and its strict localisation (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple and
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/
--   strict-localisation-of-a-valuation-ring)

end Huber

namespace AdicSpace.ValuationBase

open Huber

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/invariance-comparison-map (construction) -/

-- Setting (Hansen–Zavyalov 2023 Lemma A.4.3; Illusie 2006 §1.1 (b); Berkovich 1994 §4): `φ : A → B`
-- a surjective map of valuation spectra (`Huber.IsSurjectiveValuationMap`) between strictly
-- henselian valuation rings with separably closed fraction fields, `f : X → Spec A` quasi-compact
-- and quasi-separated, `X' = X ×_S S'`, `Λ` torsion, `F ∈ D⁺((X_η)_et, Λ)`. Every item of this
-- node needs the nearby-cycle functor `RΨ = i^*Rj_*` of a valuation-base quadruple and its
-- base-change map `bc_φ` (suppliers:
-- ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base,
-- ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map) and `D⁺`
-- of étale sheaves of `Λ`-modules on schemes with `RΓ` and pullback (supplier:
-- SchemeAndStackFoundations:SF.2). The ring-level input `g(η') = η`, `g(s') = s` is
-- `Huber.IsSurjectiveValuationMap.comap_closedPoint`.
-- AdicSpace.ValuationBase.invarianceMap: not stated here; needs `RΨ`, `bc_φ` and `RΓ` on `D⁺` of
--   étale sheaves on schemes (suppliers: H1:valuation-nearby-cycles,
--   SchemeAndStackFoundations:SF.2)
-- AdicSpace.ValuationBase.invarianceMap_eq_comp_baseChange: not stated here; needs
--   `invarianceMap`, `bc_φ` and pullback along `g_s` (suppliers: as for `invarianceMap`)
-- AdicSpace.ValuationBase.invarianceMap_id: not stated here; needs `invarianceMap` (suppliers: as
--   for `invarianceMap`)
-- AdicSpace.ValuationBase.invarianceMap_comp: not stated here; needs `invarianceMap` and the
--   transitivity of `bc` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map)
-- AdicSpace.ValuationBase.invarianceMap_natural: not stated here; needs `invarianceMap` as a
--   natural transformation of triangulated functors `D⁺((X_η)_et, Λ) → D⁺(Λ-Mod)` (supplier:
--   SchemeAndStackFoundations:SF.2)
-- AdicSpace.ValuationBase.invarianceMap_restrict: not stated here; needs `invarianceMap` and
--   restriction along étale `S`-morphisms on étale cohomology of schemes (supplier:
--   SchemeAndStackFoundations:SF.2)
-- AdicSpace.ValuationBase.invarianceMap_of_isField: not stated here; needs `invarianceMap` and
--   pullback of étale cohomology along `X ⊗_K L → X` (supplier: SchemeAndStackFoundations:SF.2)
-- AdicSpace.ValuationBase.invarianceMap_proper: not stated here; needs `invarianceMap` and the
--   isomorphisms of H1:valuation-exports/proper-nearby-cycle-cohomology (suppliers: as for
--   `invarianceMap`)
-- AdicSpace.ValuationBase.invarianceMap_tube: not stated here; needs `invarianceMap` and the tube
--   comparison of 3.5.16 (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16)

-- invarianceMap_test_point: not stated here; needs `RΨΛ` over `Spec A` and `H^n` of étale sheaves
--   on schemes (suppliers: as for `invarianceMap`) [computation test]
-- invarianceMap_test_field: not stated here; needs `invarianceMap` and pullback of étale
--   cohomology of schemes (supplier: SchemeAndStackFoundations:SF.2) [degenerate test]

/- Ring-level core: for a rank-two `C⁺ ⊊ 𝒪_C`, `Spec(C⁺ → 𝒪_C)` sends the closed point of
`Spec 𝒪_C` to the height-one prime of `C⁺`, not to the closed point, so
`(X ⊗ 𝒪_C, Spec 𝒪_C, η, s') → (X, Spec C⁺, η, s)` is not a morphism of quadruples and the
invariance map is not defined. -/
-- test invarianceMap_test_nonlocal (non-example) [H1:valuation-exports/invariance-comparison-map]
example {C : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [IsTateRing C] (V W : ValuationSubring C)
    (hW : W.toSubring = powerBoundedSubring C) (hV : ringKrullDim V = 2) (hVW : V ≤ W) :
    (PrimeSpectrum.comap (ValuationSubring.inclusion V W hVW)
        (IsLocalRing.closedPoint W)).asIdeal.height = 1 ∧
      PrimeSpectrum.comap (ValuationSubring.inclusion V W hVW) (IsLocalRing.closedPoint W) ≠
        IsLocalRing.closedPoint V := sorry

-- invarianceMap_test_trait: not stated here; needs `RΨ` over the integral closure of a strictly
--   henselian trait and the SGA 7 XIII change-of-trait isomorphism (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0) [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/finite-rank-finite-type-reduction (lemma) -/

open _root_.AlgebraicGeometry _root_.CategoryTheory in
/-- H1:valuation-exports/finite-rank-finite-type-reduction (Orgogozo 2006, Remarque 4.5, after
Gabber): let `A` be a valuation ring whose spectrum is a noetherian topological space (for
instance `A` of finite rank) and `f : X → Spec A` of finite type with `X` affine. Then `X` is a
surjective closed subscheme of a `Spec A`-scheme `Y` of finite presentation, so the closed
immersion `X → Y` identifies `X_red` with `Y_red` over `Spec A`. -/
theorem exists_finitePresentation_red_eq (A : Type u) [CommRing A] [IsDomain A]
    [ValuationRing A] [TopologicalSpace.NoetherianSpace (PrimeSpectrum A)] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of A)) [LocallyOfFiniteType f] [IsAffine X] :
    ∃ (Y : Scheme.{u}) (g : Y ⟶ Spec (.of A)) (ι : X ⟶ Y), LocallyOfFinitePresentation g ∧
      IsClosedImmersion ι ∧ Surjective ι ∧ ι ≫ g = f := sorry

-- exists_finitePresentation_red_eq, étale part (the universal homeomorphisms `X_red → X` and
--   `X_red → Y` give equivalences of étale sites `X_et ≃ Y_et` compatible with fibres and base
--   change, hence with `i^*`, `Rj_*`, `RΨ`, `bc` and `invarianceMap`): not stated here; needs the
--   functoriality of small étale sites along morphisms of schemes and Stacks Tag 04DY (supplier:
--   SchemeAndStackFoundations:SF.2)

/- A valuation ring with a strictly increasing chain of primes `𝔭₁ ⊊ 𝔭₂ ⊊ ⋯`: the closed sets
`V(𝔭ₙ)` strictly decrease, so `Spec A` is not noetherian and the lemma does not apply. -/
-- test finiteTypeReduction_test_nonNoetherianSpec (non-example)
--   [H1:valuation-exports/finite-rank-finite-type-reduction]
example (A : Type*) [CommRing A] [IsDomain A] [ValuationRing A] (P : ℕ → Ideal A)
    (hP : ∀ n, (P n).IsPrime) (hmono : StrictMono P) :
    ¬ TopologicalSpace.NoetherianSpace (PrimeSpectrum A) := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/special-locus-support-triangle (theorem) -/

-- supportTriangle: not stated here; needs `D⁺(X_et, Λ)` of étale sheaves on schemes with
--   `i_{0*}`, `RH_{X₀}`, `Rj_{U*}`, `RΓ_{X₀}` and distinguished triangles (supplier:
--   SchemeAndStackFoundations:SF.2)
-- restrictionToGeneric_isIso_iff (`c_U : i^*Rj_{U*}j_U^*E → RΨ_S(j^*E)` is an isomorphism for
--   every `E` when `U_S = {η}`, and the triangle `i^*i_{0*}RH_{X₀}(E) → i^*E → RΨ_S(j^*E) →`):
--   not stated here; needs `c_U` on étale sheaves on schemes (supplier:
--   SchemeAndStackFoundations:SF.2) and `RΨ` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base);
--   its topological core is `compl_specialLocus_eq_generic_iff` below

/-- H1:valuation-exports/special-locus-support-triangle, topological core of (b) (Kato 2021 §3.2
and Construction 4.2): for a closed subset `S₀ ⊆ Spec A` of the spectrum of a valuation ring
containing the closed point `s` but not the generic point `η`, the complement `U_S = Spec A ∖ S₀`
is `{η}` if and only if `A` is microbial and `S₀ = V(𝔭_A)` for its height-one prime `𝔭_A`. -/
theorem compl_specialLocus_eq_generic_iff (A : Type*) [CommRing A] [IsDomain A]
    [ValuationRing A] (S₀ : Set (PrimeSpectrum A)) (hS₀ : IsClosed S₀)
    (hs : IsLocalRing.closedPoint A ∈ S₀) (hη : (⟨⊥, Ideal.isPrime_bot⟩ : PrimeSpectrum A) ∉ S₀) :
    S₀ᶜ = {⟨⊥, Ideal.isPrime_bot⟩} ↔
      ∃ p : Ideal A, p.IsPrime ∧ p.height = 1 ∧ S₀ = PrimeSpectrum.zeroLocus (p : Set A) :=
  sorry

-- supportTriangle_test_rankOne: not stated here; needs étale cohomology with supports
--   `H^n_s(Spec 𝒪_C, Λ)` of schemes (supplier: SchemeAndStackFoundations:SF.2) [computation test]

/- Topological core: for `A` of rank two and `S₀ = {s}`, the complement `U_S` contains the
height-one prime besides `η`, so `U_S ≠ {η}`. The failure of `c_U` itself
(`(i^*Rj_{U*}j_U^*E)_s = Λ` while `RΨ_S(j^*E) = 0`) needs étale sheaves on schemes (supplier:
SchemeAndStackFoundations:SF.2). -/
-- test supportTriangle_test_rankTwo (non-example)
--   [H1:valuation-exports/special-locus-support-triangle]
example {A : Type*} [CommRing A] [IsDomain A] [ValuationRing A] (hA : ringKrullDim A = 2) :
    ({IsLocalRing.closedPoint A}ᶜ : Set (PrimeSpectrum A)) ≠ {⟨⊥, Ideal.isPrime_bot⟩} := sorry

/- Topological core: for `A` of rank two with height-one prime `𝔭_A` and `S₀ = V(𝔭_A)`,
`U_S = {η}`, the case in which `c_U` is an isomorphism for every `E`; the isomorphism itself
needs étale sheaves on schemes (supplier: SchemeAndStackFoundations:SF.2). -/
-- test supportTriangle_test_microbial (characterisation)
--   [H1:valuation-exports/special-locus-support-triangle]
example {A : Type*} [CommRing A] [IsDomain A] [ValuationRing A] (hA : ringKrullDim A = 2)
    (p : Ideal A) [p.IsPrime] (hp : p.height = 1) :
    (PrimeSpectrum.zeroLocus (p : Set A))ᶜ = {⟨⊥, Ideal.isPrime_bot⟩} := sorry

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology (theorem) -/

-- restrict_closedFibre_isIso_of_isProper ((a), proper base change over a strictly henselian
--   valuation ring, Stacks Tag 095T): not stated here; needs `RΓ` and `i^*` on `D⁺` of étale
--   sheaves on schemes (supplier: SchemeAndStackFoundations:SF.2)
-- nearbyCycles_cohomology_iso_of_isProper ((b), `RΓ(X_η, F) ≅ RΓ(X_s, RΨF)`, Illusie 2006
--   (1.1.4)): not stated here; needs `RΨ` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base) and
--   `RΓ`, `Rj_*` on étale sheaves on schemes (supplier: SchemeAndStackFoundations:SF.2)
-- localCohomology_iso_vanishingCycles ((c), `H^n_{X₀}(X, E) ≅ H^{n−1}(X_s, RΦ(E))` for microbial
--   `A`): not stated here; needs `RΨ`, the cone `RΦ` and cohomology with supports on schemes
--   (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)

-- properNearbyCycles_test_nonproper: not stated here; needs `RΓ(X_s, RΨΛ)` and `RΓ(X_η, Λ)` for
--   `X = Spec K ⊆ Spec A` (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)
--   [non-example test]
-- properNearbyCycles_test_pTorsion: not stated here; needs `H^n(ℙ¹_k, RΨ ℤ/p)` and
--   `H^n(ℙ¹_C, ℤ/p)` (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)
--   [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change (theorem) -/

-- baseChange_isIso_of_isSurjectiveValuationMap ((i), Orgogozo 2006 Remarques 4.4–4.5, Lu–Zheng
--   2019 Example 4.26 (2): `bc_φ(F)` is an isomorphism for `Huber.IsSurjectiveValuationMap φ`,
--   `m` invertible in `A`, `mΛ = 0`, `f` of finite presentation or of finite type with
--   `NoetherianSpace (PrimeSpectrum A)`): not stated here; needs `bc_φ` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map)
-- invarianceMap_isIso ((ii)): not stated here; needs `invarianceMap` of
--   H1:valuation-exports/invariance-comparison-map (suppliers: H1:valuation-nearby-cycles,
--   SchemeAndStackFoundations:SF.2)
-- invarianceMap_isIso_of_isProper ((iii), every torsion `Λ`, `RΓ(X_η, F) ≅ RΓ(X'_{η'}, F')`,
--   Stacks Tag 0DDG): not stated here; needs `invarianceMap` and `RΓ` on étale sheaves on schemes
--   (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)

-- nearbyCycles_invariance_test_nonsurjective: not stated here; needs `H^0(S, j_!Λ)` of étale
--   sheaves on schemes (supplier: SchemeAndStackFoundations:SF.2); its ring-level half is the test
--   `isSurjectiveValuationMap_test_rankTwoToRankOne` [non-example test]

/- Ring-level core: `H¹(𝔸¹_K, ℤ/p) ≅ K[x]/{g^p − g}` (Artin–Schreier), and for `c ∈ L ∖ K` the
class of `c·x` is not in the image of `K[x]/{g^p − g} → L[x]/{g^p − g}`. The identification with
étale cohomology needs étale cohomology of schemes (supplier: SchemeAndStackFoundations:SF.2);
here `m = p` is not invertible, so (i)–(ii) are not asserted, and (iii) does not apply. -/
-- test nearbyCycles_invariance_test_artinSchreier (non-example)
--   [H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change]
example (p : ℕ) [Fact p.Prime] {K L : Type*} [Field K] [Field L] [CharP K p] [CharP L p]
    [IsAlgClosed K] [IsAlgClosed L] [Algebra K L] (c : L) (hc : c ∉ Set.range (algebraMap K L))
    (f : Polynomial K) (g : Polynomial L) :
    f.map (algebraMap K L) + (g ^ p - g) ≠ Polynomial.C c * Polynomial.X := sorry

-- nearbyCycles_invariance_test_properPTorsion: not stated here; needs `H^n(ℙ¹_K, ℤ/p)` of étale
--   cohomology of schemes (supplier: SchemeAndStackFoundations:SF.2) [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/compact-support-nearby-cycle-cohomology (theorem) -/

-- compactSupport_iso_nearbyCycles_compactification ((a), Kato 2021 Construction 4.3:
--   `RΓ_c(X_η, F) ≅ RΓ(X̄_s, RΨ_{X̄}(j_{X,η!}F))` for a compactification `X ⊆ X̄` over `Spec A`):
--   not stated here; needs `RΨ` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base),
--   compactifications and `j_!`, `RΓ_c` on étale sheaves on schemes (supplier:
--   SchemeAndStackFoundations:SF.2)
-- compactSupport_triangle ((b), the triangle
--   `RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F) → RΓ(∂_s, RΨ_{X̄}(j_{X,η!}F)|_{∂_s}) →`): not stated here;
--   needs distinguished triangles in `D⁺(Λ-Mod)` built from the same carriers (suppliers:
--   H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)

-- compactSupportNearbyCycles_test_boundary: not stated here; needs `RΓ_c` and `RΨ` over
--   `Spec 𝒪_C` (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)
--   [non-example test]
-- compactSupportNearbyCycles_test_proper: not stated here; needs `compactSupport_triangle` and
--   `nearbyCycles_cohomology_iso_of_isProper` (suppliers: as above) [degenerate test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-cohomology-finiteness (theorem) -/

-- nearbyCycles_constructible_amplitude ((i), Illusie 2006 §1.1 (b), Orgogozo 2006 §6:
--   `RΨF ∈ D^b_c((X_s)_et, Λ)` with `R^nΨF = 0` for `n ∉ [a, b + 2N]`): not stated here; needs
--   `RΨ` and constructibility (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles)
-- nearbyCycles_cohomology_fg_of_proper ((ii), (iv): `H^n(L, RΨF|_L)` finitely generated for
--   `L ⊆ X_s` closed and proper over `k(s)`): not stated here; needs `RΨ` and finiteness of étale
--   cohomology of proper schemes (suppliers: H1:valuation-nearby-cycles,
--   SchemeAndStackFoundations:SF.2)
-- nearbyCycles_compactSupport_fg ((iii), (iv): `H^n_c(L, RΨF|_L)` finitely generated for
--   `L ⊆ X_s` locally closed): not stated here; needs `RΨ` and `RΓ_c` on étale sheaves on schemes
--   (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)

/- Ring-level core: for an algebraically closed field `K` of characteristic `p`,
`H¹(𝔸¹_K, ℤ/p) ≅ K[x]/{g^p − g}` (Artin–Schreier) is infinite, so ordinary cohomology of a
non-proper scheme with `p`-torsion coefficients is not finite. The identification with étale
cohomology needs étale cohomology of schemes (supplier: SchemeAndStackFoundations:SF.2). -/
-- test nearbyCyclesFiniteness_test_artinSchreierNonproper (non-example)
--   [H1:valuation-exports/nearby-cycle-cohomology-finiteness]
example (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [CharP K p] [IsAlgClosed K] :
    Infinite (Polynomial K ⧸
      AddSubgroup.closure (Set.range fun g : Polynomial K => g ^ p - g)) := sorry

-- nearbyCyclesFiniteness_test_amplitude: not stated here; needs `RΨΛ` over `𝔸^N_A` and local
--   acyclicity of smooth morphisms (suppliers: H1:valuation-nearby-cycles,
--   SchemeAndStackFoundations:SF.2) [computation test]

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/formal-adic-compatibility (comparison) -/

-- tubeComparison_eq_nearbyCycles ((i), Kato 2021 Construction 4.2: the isomorphism
--   `κ_X : RΓ(Z, c^*F) ≅ RΓ(X_s, RΨF)` of 3.5.16 has target nearby-cycle cohomology): not stated
--   here; needs the tube `Z ⊆ d(X^)` over the closed point of `d(Spf A)` and `κ_X` (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16) and `RΨ`
--   (supplier: ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/
--   nearby-cycles-over-valuation-base)
-- tubeComparison_support ((ii), `RΓ(d(X^, L), c_L^*F) ≅ RΓ(L, RΨF|_L)` for constructible closed
--   `L ⊆ X₀ ∩ X_s`): not stated here; needs the pseudo-adic spaces `d(X^, L)` (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports) and
--   3.5.13, 3.5.11 (suppliers:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13,
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/
--   restriction-and-extension-by-zero-3-5-11)
-- tubeComparison_baseChange ((iii), pullback of tube cohomology along `d(X_B^) → d(X^)` for a
--   continuous `Huber.IsSurjectiveValuationMap φ` corresponds to `invarianceMap φ F`): not stated
--   here; needs `κ_X`, `κ_{X_B}` (supplier: H1:formal-adic-comparison) and `invarianceMap`
--   (suppliers: H1:valuation-nearby-cycles, SchemeAndStackFoundations:SF.2)
-- tubeComparison_rankOne ((iv), Hansen–Zavyalov 2023 Theorem A.4.4, Berkovich 1994 §4: for
--   `A = 𝒪_C` of rank one, `κ_X` is `RΓ(X_s, −)` of `i^*Rj_*F ≅ Rb_*a^*F`): not stated here; needs
--   the isomorphism 3.5.13 (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13)

/-! ## ClassicalAdicEtaleCohomology:H1:valuation-exports/tube-cohomology-invariance-export (application) -/

section TubeExport

variable {C₃ C₁ : Type*} [NontriviallyNormedField C₃] [IsUltrametricDist C₃] [CompleteSpace C₃]
  [IsAlgClosed C₃] [IsTateRing C₃] [NontriviallyNormedField C₁] [IsUltrametricDist C₁]
  [CompleteSpace C₁] [IsAlgClosed C₁] [IsTateRing C₁]

/-- H1:valuation-exports/tube-cohomology-invariance-export, the hypothesis of the export
(Scholze, *Étale cohomology of diamonds*, Lemma 16.3): for a continuous extension `C₃ → C₁` of
algebraically closed nonarchimedean fields with plus rings `C₃⁺`, `C₁⁺` that are valuation
subrings, `Spa(C₁, C₁⁺) → Spa(C₃, C₃⁺)` is surjective if and only if `C₁⁺ ∩ C₃ = C₃⁺`. -/
theorem spaComap_surjective_iff_comap_plus_eq (S₃ : Pair C₃) (S₁ : Pair C₁)
    (hS₃ : ∀ x : C₃, x ∈ S₃.plus ∨ x⁻¹ ∈ S₃.plus) (hS₁ : ∀ x : C₁, x ∈ S₁.plus ∨ x⁻¹ ∈ S₁.plus)
    (φ : Pair.Hom S₃ S₁) :
    Function.Surjective φ.spaComap ↔ S₁.plus.comap φ.toRingHom = S₃.plus := sorry

end TubeExport

-- tubeCohomology_invariance (Scholze, *Étale cohomology of diamonds*, Lemma 16.3 via Huber 1996
--   Theorem 4.1.1 (c): for `Spa(C₁, C₁⁺) → Spa(C₃, C₃⁺)` surjective, `X` of finite presentation
--   over `C₃⁺`, `n` prime to `p`, `nΛ = 0` and `F ∈ D⁺((X_{C₃})_et, Λ)`, pullback
--   `RΓ(Z₃, c₃^*F) → RΓ(Z₁, c₁^*F₁)` is an isomorphism): not stated here; needs the tubes `Z_i`
--   and `c_i` (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16), étale
--   cohomology of pseudo-adic spaces (supplier:
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site) and the invariance theorem
--   H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change; its ring-level
--   hypothesis is `spaComap_surjective_iff_comap_plus_eq`

end AdicSpace.ValuationBase

end TauCeti

end

/-! # Stage H1u. The umbrella stage ClassicalAdicEtaleCohomology:H1

H1 constructs no object. Its nodes re-export the declarations of the four sub-stages
(H1:henselian, H1:formal-adic-comparison, H1:valuation-nearby-cycles, H1:valuation-exports) and
compare Huber's trait nearby cycles with those of LefschetzPencilsAndVanishingCycles LPV.0. The
objects compared (derived categories of étale sheaves on schemes with their derived direct images,
LPV.0's `RΨ_η`, `RΦ` and variation, H0's étale cohomology of adic and pseudo-adic spaces, the
generic fibre `d` of AdicSpacesPartII R2) are in neither pinned library; Mathlib has the small
étale site `AlgebraicGeometry.Scheme.smallEtaleTopology` but no `D⁺` with derived pushforwards.
Those items are comments naming their supplier; the ring-level cores of the trait setting (a
strictly henselian discrete valuation ring `A`, `k = Frac A`, `k ⊆ kˢᵉᵖ ⊆ k̄`) are stated. -/

noncomputable section

namespace TauCeti

namespace AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H1/henselian-substage-export (comparison) -/

/- H1/henselian-substage-export (Hub96 §§3.1–3.2). H1 re-exports the declarations of
ClassicalAdicEtaleCohomology:H1:henselian under their own names and with their exact hypotheses.
In this single suggested file those declarations already live in `TauCeti` under exactly those
names (stage H1h); the re-export is the import of the H1 umbrella module, so no alias is declared
here (an alias under the same name would clash, and the acceptance check `@a = @d := rfl` is
`rfl` on one constant). The re-exported families, by supplier node of H1:henselian:
* (i) Hub96 3.1.1–3.1.3: `Huber.IsHenselian`, `Huber.Pair.IsHenselian`, `Huber.Henselization`
  (`.of`, `.lift`, `.completionEquiv`, …), `Huber.Pair.henselization`,
  `Huber.Pair.henselization_plus` (H1:henselian/henselian-f-adic-ring,
  H1:henselian/henselian-f-adic-rings-and-henselization), and
  `Huber.IsHenselian.of_completeSpace` (H1:henselian/complete-f-adic-ring-is-henselian); the
  henselian pairs `(B, I)` are Mathlib's `HenselianRing B I`, H1 adds no henselian carrier;
* (ii) Hub96 3.1.6–3.1.12: `Huber.IsSpecialSubset`, `Huber.IsProSpecialSubset`,
  `Huber.Pair.proSpecialHenselization` (H1:henselian/special-and-pro-special-subsets,
  H1:henselian/henselization-along-pro-special-subset);
* (iii) Hub96 3.2.1 for `A` not necessarily complete, with its three coefficient scopes (sets in
  degree 0, ind-finite groups in degrees ≤ 1, abelian torsion groups in all degrees), and 3.2.2
  for complete `A` (H1:henselian/pro-special-comparison-theorem-3-2-1,
  H1:henselian/complete-affinoid-comparison-3-2-2);
* (iv) Gabber's affine analogue of proper base change, Hub96 3.2.5, for abelian torsion sheaves
  (H1:henselian/affine-henselian-comparison-3-2-5);
* (v) Hub96 3.2.9–3.2.12 over schemes locally of finite type over `Spec A^▷`,
  `AdicSpace.henselianComparison` (H1:henselian/relative-comparison-3-2-9-3-2-12,
  H1:henselian/comparison-morphism-3-2-12).
The analytic side of (iii)–(v) is H0's cohomology of the étale site of the pseudo-adic space
(supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site,
ClassicalAdicEtaleCohomology:H0/derived-direct-image); the algebraic side is étale cohomology of
schemes on the carriers of LefschetzPencilsAndVanishingCycles:LPV.0. -/

/-! ## ClassicalAdicEtaleCohomology:H1/formal-adic-substage-export (comparison) -/

/- H1/formal-adic-substage-export (Hub96 §3.5). H1 re-exports the declarations of
ClassicalAdicEtaleCohomology:H1:formal-adic-comparison under their own names (stage H1f; no alias
is declared, as for H1/henselian-substage-export) and constructs no specialization morphism, tube
or nearby-cycle object. The re-exported families, by supplier node of H1:formal-adic-comparison
(written H1f/<slug>):
* (i) Hub96 3.5.1: `FormalScheme.SmallEtale`, `FormalScheme.smallEtaleTopology`,
  `FormalScheme.specialisationFunctor`, `FormalScheme.specialisationPushforward`,
  `FormalScheme.specialisationPullback` (H1f/etale-site-of-type-S-formal-scheme,
  H1f/specialization-morphism-of-sites-lambda; formal schemes of type (S) and `d` from
  AdicSpacesPartII:R2/formal-schemes-of-type-S and AdicSpacesPartII:R2/generic-fibre-functor-d);
* (ii) Hub96 3.5.3–3.5.6: `FormalScheme.Pair`, `FormalScheme.Pair.supportSpace`,
  `FormalScheme.Pair.specialisationFunctor` (H1f/pairs-and-pseudo-adic-supports,
  H1f/constructibility-and-stalks-of-lambda-pullback);
* (iii) Hub96 3.5.8 (with its type-(S) assumption on `Y_∞^`), 3.5.9 and 3.5.10
  (H1f/stalks-of-higher-direct-images-lambda, H1f/henselian-tube-comparison-3-6-1);
* (iv) Hub96 3.5.11 (H1f/restriction-and-extension-by-zero-3-5-11);
* (v) Hub96 3.5.13–3.5.15 under either hypothesis of (3.5.12), `FormalScheme.CompletionData`,
  `FormalScheme.CompletionData.derivedComparison` (H1f/scheme-completion-comparison-3-5-13);
* (vi) Hub96 3.5.16 over a microbial valuation ring (H1f/valuation-ring-base-3-5-16);
* (vii) Hub96 3.5.17 (H1f/vanishing-cycles-comparison-3-5-17).
Scope: the coefficients of (v)–(vii) are an arbitrary torsion ring `E`, `p`-torsion included; no
H1 declaration restates 3.5.13 with a prime-to-`p` hypothesis, and none extends Hub96 4.2.4
(H1/valuation-nearby-cycles-substage-export) or LPV.0's prime-to-`p` setting (SGA 7 XIII 2.1.1)
to `p`-torsion. -/

section TraitSetting

universe u

open _root_.AlgebraicGeometry

/- The trait setting shared by the remaining nodes: `A` a strictly henselian discrete valuation
ring (henselian, separably closed residue field), `k = Frac A`, `kSep` a separable closure and
`kBar` an algebraic closure of `k` with `kSep ⊆ kBar`. The inertia group is
`I = Gal(kSep/k) = kSep ≃ₐ[k] kSep`; `A^sep`, `Ā` are Mathlib's `integralClosure A kSep`,
`integralClosure A kBar`. -/
variable (A : Type u) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [HenselianLocalRing A]
  [IsSepClosed (IsLocalRing.ResidueField A)]
  (k : Type u) [Field k] [Algebra A k] [IsFractionRing A k]
  (kSep : Type u) [Field kSep] [Algebra k kSep] [IsSepClosure k kSep]
  (kBar : Type u) [Field kBar] [Algebra k kBar] [IsAlgClosure k kBar]
  [Algebra kSep kBar] [IsScalarTower k kSep kBar]

/-! ## ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree (lemma) -/

-- AdicSpace.huberVanishingCyclesIsoRPsi: not stated here; needs `D⁺((X_s)_et, E)` with derived
--   direct images of étale sheaves on schemes and LPV.0's `RΨ_η` on `X_s ×_s η` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle,
--   LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S), and Huber's complex
--   `i'^*Rj'_*(K|X_k̄)` on `X ×_A Ā` (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17).
--   Ring-level cores: `AdicSpace.huberVanishingCyclesIsoRPsi_ring`,
--   `AdicSpace.huberVanishingCyclesIsoRPsi_core`.
-- AdicSpace.huberVanishingCyclesIsoRPsi_equivariant: not stated here; needs the inertia actions
--   on LPV.0's `RΨ_η` by transport of structure and on Huber's complex through `Aut(k̄/k)`
--   (supplier: LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities,
--   LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves)
-- AdicSpace.valuationNearbyCyclesIsoRPsi: not stated here; needs `RΨ_L` of the quadruple
--   `(X, S, η, s)` with its Galois action (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base)
--   and LPV.0's `RΨ_η` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)

/-- H1/trait-nearby-cycles-agree (lemma), ring-level core: restriction
`Aut(k̄/k) → Gal(kˢᵉᵖ/k) = I` is a group isomorphism, because `k̄/kˢᵉᵖ` is purely inseparable.
Through it the action of `Aut(k̄/k)` on Huber's complex of vanishing cycles (Hub96 proof of
3.5.17, formed on `X ×_A Ā`) is an action of the inertia group `I` of SGA 7 XIII 1.3.2.2. -/
theorem huberVanishingCyclesIsoRPsi_ring :
    Function.Bijective
      (AlgEquiv.restrictNormalHom kSep : (kBar ≃ₐ[k] kBar) →* (kSep ≃ₐ[k] kSep)) := sorry

/-- H1/trait-nearby-cycles-agree (lemma), ring-level core of step (a) ≅ (b): the restriction
`A^sep → Ā` of `kˢᵉᵖ → k̄` to the integral closures of `A` induces a universal homeomorphism
`Spec Ā → Spec A^sep` (integral, universally injective, surjective: both are valuation rings of
the unique extensions of the valuation of the henselian field `k`, and `k̄/kˢᵉᵖ` and the residue
extension are purely inseparable). Base change along `X` gives the universal homeomorphism
`X ×_A Ā → X ×_A A^sep` identifying the étale topoi (Stacks 04DZ). -/
theorem huberVanishingCyclesIsoRPsi_core [Algebra A kSep] [IsScalarTower A k kSep]
    [Algebra A kBar] [IsScalarTower A k kBar] :
    ∃ f : integralClosure A kSep →+* integralClosure A kBar,
      (∀ x : integralClosure A kSep, (f x : kBar) = algebraMap kSep kBar x) ∧
      IsIntegralHom (Spec.map (CommRingCat.ofHom f)) ∧
      UniversallyInjective (Spec.map (CommRingCat.ofHom f)) ∧
      AlgebraicGeometry.Surjective (Spec.map (CommRingCat.ofHom f)) := sorry

-- traitNearbyCycles_test_point: not stated here; needs LPV.0's `RΨ_η` of an `E[I]`-module on
--   `η` for `X = S` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [computation test]
-- traitNearbyCycles_test_eta_eq_s: not stated here; needs `RΨ_L` of the degenerate quadruple
--   `(X, S, s, s)` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base)
--   and LPV.0's `RΨ(F)_s = i^*F` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [degenerate test]
-- traitNearbyCycles_test_smooth_constant: not stated here; needs LPV.0's `RΨ_η` and its local
--   acyclicity for `X = A¹_S` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [compatibility test]
-- traitNearbyCycles_nonexample_rPhi: not stated here; needs LPV.0's `RΦ` and `RΨ_η` for
--   `X = S` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1/valuation-nearby-cycles-substage-export (comparison) -/

/- H1/valuation-nearby-cycles-substage-export (Hub96 4.2.1–4.2.5, 4.2.10). H1 re-exports the
declarations of ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles under their own names
(stage H1v; no alias is declared, as for H1/henselian-substage-export), by supplier node
(written H1v/<slug>): `AlgebraicGeometry.ValuationQuadruple` (a valuation ring of arbitrary rank,
`η = s` allowed) and its morphisms, `AlgebraicGeometry.ValuationQuadruple.nearbyCycles`
(`RΨ_L = i^*Rj_*j^*`), `.galoisAction`, `.nearbyCyclesBaseChange` (H1v/valuation-base-quadruple,
H1v/nearby-cycles-over-valuation-base, H1v/galois-action-on-nearby-cycles,
H1v/nearby-cycles-base-change-map), Hub96 4.2.3 (H1v/comparison-with-geometric-generic-point),
4.2.4 for torsion prime to the residue characteristic exponent at `s`
(H1v/valuative-base-change-for-nearby-cycles) and 4.2.5 with `B` annihilated by an integer
invertible in `k(s)` (H1v/constructibility-of-nearby-cycles); both hypotheses are copied, and no
base-change claim is made for torsion divisible by the residue characteristic. On a strictly
henselian discrete valuation ring with `η` generic, `RΨ_L` is LPV.0's `RΨ_η`
(H1/trait-nearby-cycles-agree), so H1 carries no second trait `RΨ`. -/

/-! ## ClassicalAdicEtaleCohomology:H1/valuation-exports-substage-export (comparison) -/

/- H1/valuation-exports-substage-export (Hub96 4.2.6–4.2.9). H1 re-exports the declarations of
ClassicalAdicEtaleCohomology:H1:valuation-exports under their own names (stage H1x; no alias is
declared), by supplier node (written H1x/<slug>): `Huber.IsSurjectiveValuationMap` and
`AdicSpace.ValuationBase.invarianceMap` (H1x/surjective-valuation-base-change,
H1x/invariance-comparison-map), the support triangle 4.2.6 (H1x/special-locus-support-triangle),
invariance 4.2.7 under a surjective map of valuation spectra
(H1x/nearby-cycle-invariance-under-surjective-base-change; surjectivity is a hypothesis),
constructibility and finiteness 4.2.8–4.2.9 with their alternatives
(H1x/nearby-cycle-cohomology-finiteness), and their compatibility with the maps of
H1/formal-adic-substage-export (H1x/formal-adic-compatibility). No invariance is exported for a
non-surjective map, and no base-change isomorphism for torsion divisible by the residue
characteristic. -/

/-! ## ClassicalAdicEtaleCohomology:H1/formal-nearby-cycle-comparison-inertia-equivariance (lemma) -/

-- AdicSpace.huberComparison3517_equivariant: not stated here; needs the generic fibre `d` of
--   the completion `X̂` and its completed base change `Ȳ` to `Spa(k̄^, Ā^)` (supplier:
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicSpacesPartII:R2/generic-fibre-fibre-products),
--   H0's `R⁺Γ(Ȳ, c^*K)` (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image) and the
--   isomorphism of Hub96 3.5.17 (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17).
--   Ring-level core: `AdicSpace.huberComparison3517_equivariant_ring`.

/-- H1/formal-nearby-cycle-comparison-inertia-equivariance (lemma), ring-level core: the
valuation of the henselian field `k = Frac A` extends uniquely to `k̄`, i.e. `Ā` is the only
valuation subring of `k̄` lying over `A`. Hence every `σ ∈ Aut(k̄/k)` preserves `Ā` and extends
uniquely to an isometric automorphism of `k̄^`, through which it acts on `Ȳ` over `Y`
(Hub96 proof of 3.5.17). -/
theorem huberComparison3517_equivariant_ring [Algebra A kBar] [IsScalarTower A k kBar] :
    ∃ V : ValuationSubring kBar, (V : Set kBar) = integralClosure A kBar ∧
      (V.comap (algebraMap k kBar) : Set k) = Set.range (algebraMap A k) ∧
      ∀ W : ValuationSubring kBar,
        (W.comap (algebraMap k kBar) : Set k) = Set.range (algebraMap A k) → W = V := sorry

/-! ## ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison (comparison) -/

-- AdicSpace.formalNearbyCyclesComparison: not stated here; needs H0's `R⁺Γ(Ȳ, c^*K)` on the
--   analytic geometric generic fibre (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   AdicSpacesPartII:R2/generic-fibre-functor-d) and `R⁺Γ(X_s, RΨ_η K)` for LPV.0's nearby
--   cycles (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle);
--   `E` prime to `p`, `X → S` locally of finite type
-- AdicSpace.formalNearbyCyclesComparison_equivariant: not stated here; needs the same carriers
--   with the `I`-actions of LPV.0 and of `k̄^` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities)

-- formalNearbyCyclesComparison_test_point: not stated here; needs `R⁺Γ(Spa(k̄^, Ā^), c^*K)`
--   (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image) and LPV.0's `RΨ_η(K)_s`
--   (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [degenerate test]
-- formalNearbyCyclesComparison_test_closed_disc: not stated here; needs the étale cohomology of
--   the closed unit disc over `k̄^` (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   AdicSpaces Layer 5) [computation test]
-- formalNearbyCyclesComparison_test_proper: not stated here; needs LPV.0's proper
--   specialization isomorphism (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence)
--   and the proper comparison of Hub96 3.7.2 (supplier:
--   ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2) [compatibility test]
-- formalNearbyCyclesComparison_nonexample_rPhi: not stated here; needs LPV.0's `RΦ` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   and H0's cohomology of the closed unit disc (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image) [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1/change-of-trait-compatibility (comparison) -/

-- AdicSpace.valuationBaseChange_eq_changeOfTrait: not stated here; needs the base-change map of
--   `RΨ_L` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map) and
--   LPV.0's change-of-trait morphism `g^*RΨ → RΨg^*` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities,
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence).
--   Ring-level core: `AdicSpace.valuationBaseChange_eq_changeOfTrait_ring`.

/-- H1/change-of-trait-compatibility (comparison), ring-level core: an injective local
homomorphism `A → A'` of discrete valuation rings induces a surjective morphism of traits
`Spec A' → Spec A` (a surjective change of traits, SGA 7 XIII 1.2.7), the setting of the
base-change map of Hub96 4.2.4 and of SGA 7 XIII 1.3.10. -/
theorem valuationBaseChange_eq_changeOfTrait_ring (A' : Type u) [CommRing A'] [IsDomain A']
    [IsDiscreteValuationRing A'] (f : A →+* A') [IsLocalHom f] (hf : Function.Injective f) :
    AlgebraicGeometry.Surjective (Spec.map (CommRingCat.ofHom f)) := sorry

-- changeOfTrait_test_tame_extension: not stated here; needs the base-change maps of `RΨ_L` and
--   of LPV.0's `RΨ` for `A' = A[π^{1/e}]` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map,
--   LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities)
--   [computation test]
-- changeOfTrait_test_identity: not stated here; needs the base-change map of `RΨ_L` (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map)
--   [degenerate test]
-- changeOfTrait_test_finite_all_torsion: not stated here; needs the base-change map of `RΨ_L`
--   for arbitrary torsion coefficients (supplier:
--   ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map)
--   [compatibility test]

/-! ## ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles (comparison) -/

-- AdicSpace.analyticSpecializationTriangle: not stated here; needs LPV.0's triangle
--   `sp^*i^*K' → RΨ_η K → RΦ K' →` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   and H0's `R⁺Γ(Ȳ, c^*K)` (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.analyticSpecializationTriangle_first: not stated here; needs the specialization
--   morphism `λ` and the transformation `τ` of Hub96 3.5.13(i) (supplier:
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda
--   and ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13)

-- analyticSpecializationTriangle_test_smooth_disc: not stated here; needs LPV.0's `RΦ` and H0's
--   cohomology of the closed unit disc (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image) [computation test]
-- analyticSpecializationTriangle_test_nodal_annulus: not stated here; needs LPV.0's `RΦ` at an
--   ordinary quadratic point (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2) and
--   H0's cohomology of the closed annulus (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image) [computation test]
-- analyticSpecializationTriangle_test_point: not stated here; needs LPV.0's triangle for
--   `X = S` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle)
--   [degenerate test]
-- analyticSpecializationTriangle_nonexample_rPhi_ne_rPsi: not stated here; needs LPV.0's `RΦ`
--   and H0's cohomology of the closed unit disc (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image) [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology (comparison) -/

-- AdicSpace.analyticVariation_sub_one: not stated here; needs LPV.0's variation
--   `Var(σ) : RΦ(K') → RΨ_η(K)` (supplier:
--   LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism) transported to `Hⁿ(Ȳ, c^*K)`
--   along the isomorphism of H1/lpv-trait-comparison (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); LPV.1's monodromy operator is
--   transported, not rebuilt (supplier: LefschetzPencilsAndVanishingCycles:LPV.1)

-- analyticVariation_test_smooth_trivial: not stated here; needs the inertia action on H0's
--   `Hⁿ(Ȳ, ℤ/ℓ)` for the closed unit disc (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism) [degenerate test]
-- analyticVariation_test_cocycle: not stated here; needs LPV.0's variation and the second map
--   `q` of its triangle (supplier: LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism)
--   [characterisation test]

end TraitSetting

end AdicSpace

end TauCeti

end

/-! # Stage H2. Invariance under extension of an algebraically closed complete field;
geometric connectedness

Geometric field pairs `(C, C⁺)` (ECD Lemma 16.3, Lemma 14.6) are stated as a structure
`AdicSpace.GeometricFieldPair` over Mathlib's `NontriviallyNormedField`, `IsUltrametricDist`,
`CompleteSpace`, `IsAlgClosed` and `ValuationSubring`; their extensions are Tau Ceti morphisms of
Huber pairs, and the surjectivity condition is surjectivity of Tau Ceti's
`Huber.Pair.Hom.spaComap` on the spectral spaces `ValuationSpectrum.spa`.

`Spa(C, C⁺)` as an adic space, the étale sites and cohomology of adic and perfectoid spaces,
fibre products of adic spaces, affinoid perfectoid spaces and tilde-limits are not in the pinned
libraries: the statements that need them are comments naming their supplier, and their
topological, affinoid or ring-level cores are stated under suffixed names (`…_core`,
`…_affinoid`, `…_ring`). -/

noncomputable section

namespace TauCeti

open Topology _root_.CategoryTheory

universe u v w

namespace AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension (definition) -/

/-- H2/geometric-field-pair-extension (structure): a *geometric field pair* `(C, C⁺)`
(ECD Lemma 16.3, Lemma 14.6): a field `C`, algebraically closed and complete for a nontrivial
nonarchimedean absolute value, with an open and bounded valuation subring `C⁺`. Then
`C°° ⊆ C⁺ ⊆ O_C = C°` and `C⁺` may have any rank `≥ 1` (rank one exactly when `C⁺ = O_C`);
`C` may have characteristic `0` or `p`. -/
structure GeometricFieldPair where
  /-- The field `C`. -/
  C : Type u
  /-- `C` is a nontrivially normed field. -/
  [instNontriviallyNormedField : NontriviallyNormedField C]
  /-- The absolute value of `C` is nonarchimedean. -/
  [instIsUltrametricDist : IsUltrametricDist C]
  /-- `C` is complete. -/
  [instCompleteSpace : CompleteSpace C]
  /-- `C` is algebraically closed. -/
  [instIsAlgClosed : IsAlgClosed C]
  /-- The valuation subring `C⁺`. -/
  plus : ValuationSubring C
  /-- `C⁺` is open in `C`. -/
  isOpen_plus : IsOpen (plus : Set C)
  /-- `C⁺` is bounded in `C`. -/
  isBounded_plus : Huber.IsBounded (plus : Set C)

namespace GeometricFieldPair

attribute [instance] instNontriviallyNormedField instIsUltrametricDist instCompleteSpace
  instIsAlgClosed

/-- H2/geometric-field-pair-extension (instance): `C` is a Tate ring, with ring of definition
`O_C` and pseudo-uniformiser any `ϖ` with `0 < ‖ϖ‖ < 1`; this makes `(C, C⁺)` a Huber pair. -/
instance instIsTateRing (K : GeometricFieldPair.{u}) : Huber.IsTateRing K.C := sorry

/-- H2/geometric-field-pair-extension (supporting): `O_C = C°`, the closed unit ball of `C`, as
a valuation subring (the valuation subring of Mathlib's `NormedField.valuation`). -/
def powerBounded (K : GeometricFieldPair.{u}) : ValuationSubring K.C :=
  (NormedField.valuation (K := K.C)).valuationSubring

/-- H2/geometric-field-pair-extension (supporting): `O_C` is Tau Ceti's power-bounded subring
`C°`. -/
theorem powerBounded_toSubring (K : GeometricFieldPair.{u}) :
    K.powerBounded.toSubring = Huber.powerBoundedSubring K.C := sorry

/-- H2/geometric-field-pair-extension (supporting): `C⁺ ⊆ O_C`, since `C⁺` is bounded. -/
theorem plus_le_powerBounded (K : GeometricFieldPair.{u}) : K.plus ≤ K.powerBounded := sorry

/-- H2/geometric-field-pair-extension (coercion): the Tau Ceti Huber pair `(C, C⁺)`; `C⁺` is a
ring of integral elements, being open, bounded and integrally closed (a valuation ring). -/
def toPair (K : GeometricFieldPair.{u}) : Huber.Pair K.C where
  plus := K.plus.toSubring
  isRingOfIntegralElements := sorry

-- AdicSpace.GeometricFieldPair.spa: not stated here; needs `Spa(C, C⁺)` as an object of the
--   anchor's category of adic spaces (supplier: AdicSpaces Layer 5). Its underlying spectral
--   space is `AdicSpace.GeometricFieldPair.spa_core`, with closed point `closedPoint` (valuation
--   ring `C⁺`) and generic point `genericPoint` (valuation ring `O_C`).

/-- H2/geometric-field-pair-extension (topological core of `AdicSpace.GeometricFieldPair.spa`):
the underlying space `|Spa(C, C⁺)|`, Tau Ceti's `ValuationSpectrum.spa` of the pair. -/
abbrev spa_core (K : GeometricFieldPair.{u}) : Type u :=
  ↥(ValuationSpectrum.spa K.toPair.plus)

/-- H2/geometric-field-pair-extension (supporting): the valuation ring `{c | |c(x)| ≤ 1}` of a
point `x` of `Spa(C, C⁺)`. -/
def valuationRing (K : GeometricFieldPair.{u}) (x : K.spa_core) : ValuationSubring K.C :=
  x.1.valuation.valuationSubring

/-- H2/geometric-field-pair-extension (supporting): the closed point `s` of `Spa(C, C⁺)`, the
valuation of `C⁺`. -/
def closedPoint (K : GeometricFieldPair.{u}) : K.spa_core :=
  ⟨ValuationSpectrum.ofValuation K.plus.valuation, sorry⟩

/-- H2/geometric-field-pair-extension (supporting): the generic point `η` of `Spa(C, C⁺)`, the
valuation `‖·‖` of `C` with valuation ring `O_C`. -/
def genericPoint (K : GeometricFieldPair.{u}) : K.spa_core :=
  ⟨ValuationSpectrum.ofValuation (NormedField.valuation (K := K.C)), sorry⟩

/-- H2/geometric-field-pair-extension (structure): an *extension* `ι : (C, C⁺) → (C', C'⁺)` of
geometric field pairs (ECD Lemma 16.3, Lemma 14.6): a morphism of Tau Ceti Huber pairs, that is
a continuous ring homomorphism with `ι(C⁺) ⊆ C'⁺`. It is injective, `ι⁻¹(O_{C'}) = O_C`
(`Hom.comap_powerBounded`); no condition relates the ranks of `C⁺` and `C'⁺`, and `C'/C` need
not be algebraic. -/
structure Hom (K : GeometricFieldPair.{u}) (K' : GeometricFieldPair.{v}) extends
    Huber.Pair.Hom K.toPair K'.toPair

variable {K : GeometricFieldPair.{u}} {K' : GeometricFieldPair.{v}}
  {K'' : GeometricFieldPair.{w}}

/-- H2/geometric-field-pair-extension (functoriality): the identity extension. -/
def Hom.id (K : GeometricFieldPair.{u}) : Hom K K :=
  { toHom := Huber.Pair.Hom.id K.toPair }

/-- H2/geometric-field-pair-extension (functoriality): the composite `κ ∘ ι` of extensions. -/
def Hom.comp (κ : Hom K' K'') (ι : Hom K K') : Hom K K'' :=
  { toHom := κ.toHom.comp ι.toHom }

-- AdicSpace.GeometricFieldPair.Hom.spaMap: not stated here; needs morphisms of adic spaces
--   `Spa(C', C'⁺) → Spa(C, C⁺)` (supplier: AdicSpaces Layer 5). Its underlying continuous map is
--   `AdicSpace.GeometricFieldPair.Hom.spaMap_core` (Tau Ceti's `Huber.Pair.Hom.spaComap`), with
--   `spaMap_core_id`, `spaMap_core_comp` and `valuationRing_spaMap_core`.

/-- H2/geometric-field-pair-extension (topological core of
`AdicSpace.GeometricFieldPair.Hom.spaMap`): the continuous map
`g_ι : |Spa(C', C'⁺)| → |Spa(C, C⁺)|`, Tau Ceti's `Huber.Pair.Hom.spaComap`. -/
def Hom.spaMap_core (ι : Hom K K') : C(K'.spa_core, K.spa_core) :=
  ⟨ι.toHom.spaComap, ι.toHom.continuous_spaComap⟩

/-- H2/geometric-field-pair-extension (functoriality): `g_id = id`. -/
theorem Hom.spaMap_core_id (K : GeometricFieldPair.{u}) :
    (Hom.id K).spaMap_core = ContinuousMap.id K.spa_core := sorry

/-- H2/geometric-field-pair-extension (functoriality): `g_{κ ∘ ι} = g_ι ∘ g_κ`. -/
theorem Hom.spaMap_core_comp (κ : Hom K' K'') (ι : Hom K K') :
    (κ.comp ι).spaMap_core = ι.spaMap_core.comp κ.spaMap_core := sorry

/-- H2/geometric-field-pair-extension (functoriality): `g_ι` sends the point with valuation ring
`V'` (`C'⁺ ⊆ V' ⊆ O_{C'}`) to the point with valuation ring `ι⁻¹(V')`. -/
theorem Hom.valuationRing_spaMap_core (ι : Hom K K') (x : K'.spa_core) :
    K.valuationRing (ι.spaMap_core x) = (K'.valuationRing x).comap ι.toRingHom := sorry

/-- H2/geometric-field-pair-extension (relation): `ι⁻¹(O_{C'}) = O_C` and `C⁺ ⊆ ι⁻¹(C'⁺)`. -/
theorem Hom.comap_powerBounded (ι : Hom K K') :
    K'.powerBounded.comap ι.toRingHom = K.powerBounded ∧
      K.plus ≤ K'.plus.comap ι.toRingHom := sorry

/-- H2/geometric-field-pair-extension (other): the extension `ι` is *surjective* if
`g_ι : Spa(C', C'⁺) → Spa(C, C⁺)` is surjective on points: the condition "`X₁ → X₃` surjective"
of ECD Lemma 16.3. It is not the condition `ι(C⁺) ⊆ C'⁺`, which every extension satisfies. -/
def Hom.IsSurjective (ι : Hom K K') : Prop :=
  Function.Surjective ι.spaMap_core

/-- H2/geometric-field-pair-extension (characterisation): `ι` is surjective iff
`ι⁻¹(C'⁺) = C⁺` (H2/surjectivity-criterion-for-field-pair-extensions (iv); the third equivalent
form `g_ι(s') = s` is `Hom.isSurjective_iff_spaMap_core_closedPoint`). -/
theorem Hom.isSurjective_iff_comap_eq (ι : Hom K K') :
    ι.IsSurjective ↔ K'.plus.comap ι.toRingHom = K.plus := sorry

/-- H2/geometric-field-pair-extension (characterisation): the image of `g_ι` is the set of
generalisations of `g_ι(s')`, that is the points whose valuation ring contains `ι⁻¹(C'⁺)`
(H2/surjectivity-criterion-for-field-pair-extensions (iii); ECD proof of Lemma 14.5(ii)). -/
theorem Hom.range_spaMap (ι : Hom K K') :
    Set.range ι.spaMap_core = {x | x ⤳ ι.spaMap_core K'.closedPoint} := sorry

/-- H2/geometric-field-pair-extension (example): if `C⁺ = O_C`, every extension of `(C, C⁺)` is
surjective (`Spa(C, O_C)` is one point). -/
theorem Hom.isSurjective_of_rankOne (ι : Hom K K') (h : K.plus = K.powerBounded) :
    ι.IsSurjective := sorry

/-- H2/geometric-field-pair-extension (functoriality): a composite of surjective extensions is
surjective. -/
theorem Hom.IsSurjective.comp {ι : Hom K K'} {κ : Hom K' K''} (hι : ι.IsSurjective)
    (hκ : κ.IsSurjective) : (κ.comp ι).IsSurjective := sorry

/-- H2/geometric-field-pair-extension (constructor): for a valuation ring `V` of `C` with
`C⁺ ⊆ V ⊆ O_C`, the geometric field pair `(C, V)`; the extension `(C, C⁺) → (C, V)` is
`Hom.ofEqPlus`. -/
def ofEqPlus (K : GeometricFieldPair.{u}) (V : ValuationSubring K.C) (hV : K.plus ≤ V)
    (hV' : V ≤ K.powerBounded) : GeometricFieldPair.{u} where
  C := K.C
  plus := V
  isOpen_plus := sorry
  isBounded_plus := sorry

/-- H2/geometric-field-pair-extension (constructor, supporting `ofEqPlus`): the extension
`(C, C⁺) → (C, V)` given by the identity of `C`. -/
def Hom.ofEqPlus (K : GeometricFieldPair.{u}) (V : ValuationSubring K.C) (hV : K.plus ≤ V)
    (hV' : V ≤ K.powerBounded) : Hom K (K.ofEqPlus V hV hV') where
  toRingHom := RingHom.id K.C
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- H2/geometric-field-pair-extension (constructor, supporting `ofEqPlus`): the image of
`Spa(C, V) → Spa(C, C⁺)` is the set of generalisations of the point `V`; for `V = O_C` it is
the generic point, the embedding `Spa(C, O_C) ⊆ Spa(C, C⁺)`. -/
theorem Hom.range_spaMap_core_ofEqPlus (K : GeometricFieldPair.{u}) (V : ValuationSubring K.C)
    (hV : K.plus ≤ V) (hV' : V ≤ K.powerBounded) :
    Set.range (Hom.ofEqPlus K V hV hV').spaMap_core = {x | V ≤ K.valuationRing x} := sorry

-- AdicSpace.GeometricFieldPair.Hom.toGeometricPoint: not stated here; needs
--   `AdicSpace.GeometricPoint`, morphisms `Spa(C', C'⁺) → X` of adic spaces (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points). Its support is the point
--   `ι.spaMap_core K'.closedPoint`.

-- test GeometricFieldPair.Hom.isSurjective_id (degenerate) [H2/geometric-field-pair-extension]
example (K : GeometricFieldPair.{u}) : (Hom.id K).IsSurjective := sorry

/- The identity of `C` is a morphism of Huber pairs `(C, C⁺) → (C, O_C)`; if `C⁺ ⊊ O_C` its image
is the generic point only. A definition of surjectivity as `ι(C⁺) ⊆ C'⁺` would accept it. -/
-- test GeometricFieldPair.Hom.not_isSurjective_toRankOne (non-example)
--   [H2/geometric-field-pair-extension]
example (K : GeometricFieldPair.{u}) (h : K.plus ≠ K.powerBounded) :
    ¬ (Hom.ofEqPlus K K.powerBounded K.plus_le_powerBounded le_rfl).IsSurjective := sorry

/- For `C⁺ = O_C` the space `Spa(C, O_C)` is one point, so every extension of `(C, O_C)` is
surjective (e.g. `C` the completed algebraic closure of `𝔽_p((t))`, `C'` the completed algebraic
closure of the `t`-adic completion of `C(u)`, any open bounded `C'⁺`). -/
-- test GeometricFieldPair.Hom.isSurjective_of_plus_eq_powerBounded (computation)
--   [H2/geometric-field-pair-extension]
example (ι : Hom K K') (h : K.plus = K.powerBounded) :
    Subsingleton K.spa_core ∧ ι.IsSurjective := sorry

-- GeometricFieldPair.Hom.toGeometricPoint_support: not stated here; needs
--   `AdicSpace.GeometricPoint` (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points).
--   Its topological core is `Hom.isSurjective_iff_spaMap_core_closedPoint` together with
--   `Hom.valuationRing_spaMap_core_closedPoint` [compatibility test]

-- test GeometricFieldPair.Hom.isSurjective_comp (characterisation)
--   [H2/geometric-field-pair-extension]
example (ι : Hom K K') (κ : Hom K' K'') :
    (ι.IsSurjective → κ.IsSurjective → (κ.comp ι).IsSurjective) ∧
      ((κ.comp ι).IsSurjective → ι.IsSurjective) := sorry

/-! ## ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions (lemma) -/

/-- H2/surjectivity-criterion-for-field-pair-extensions ((i), data): the points of `Spa(C, C⁺)`
are the valuation subrings `V` of `C` with `C⁺ ⊆ V ⊆ O_C`, through their valuation rings
(Scholze–Weinstein, Berkeley Lectures, Proposition 4.2.5). -/
def valuationRingEquiv (K : GeometricFieldPair.{u}) :
    K.spa_core ≃ {V : ValuationSubring K.C // K.plus ≤ V ∧ V ≤ K.powerBounded} where
  toFun x := ⟨K.valuationRing x, sorry⟩
  invFun V := ⟨ValuationSpectrum.ofValuation V.1.valuation, sorry⟩
  left_inv := sorry
  right_inv := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (i): `y` is a specialisation of `x` iff
the valuation ring of `y` is contained in that of `x`. -/
theorem specializes_iff_valuationRing_le (K : GeometricFieldPair.{u}) (x y : K.spa_core) :
    x ⤳ y ↔ K.valuationRing y ≤ K.valuationRing x := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (i): the points of `Spa(C, C⁺)` form a
chain under specialisation (ECD proof of Lemma 14.5(ii)). -/
theorem specializes_or_specializes (K : GeometricFieldPair.{u}) (x y : K.spa_core) :
    x ⤳ y ∨ y ⤳ x := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (i): the closed point has valuation ring
`C⁺`. -/
theorem valuationRing_closedPoint (K : GeometricFieldPair.{u}) :
    K.valuationRing K.closedPoint = K.plus := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (i): the generic point has valuation ring
`O_C`. -/
theorem valuationRing_genericPoint (K : GeometricFieldPair.{u}) :
    K.valuationRing K.genericPoint = K.powerBounded := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (i): every point is a generalisation of
the closed point `s` and a specialisation of the generic point `η`. -/
theorem specializes_closedPoint (K : GeometricFieldPair.{u}) (x : K.spa_core) :
    x ⤳ K.closedPoint ∧ K.genericPoint ⤳ x := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (ii): `g_ι(s')` is the point with
valuation ring `W = ι⁻¹(C'⁺) ⊇ C⁺`. -/
theorem Hom.valuationRing_spaMap_core_closedPoint (ι : Hom K K') :
    K.valuationRing (ι.spaMap_core K'.closedPoint) = K'.plus.comap ι.toRingHom := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (iii): `g_ι` is generalising. -/
theorem Hom.generalizingMap_spaMap_core (ι : Hom K K') : GeneralizingMap ι.spaMap_core := sorry

/-- H2/surjectivity-criterion-for-field-pair-extensions (iv): `ι` is surjective iff
`g_ι(s') = s` (ECD Lemma 16.3's condition). -/
theorem Hom.isSurjective_iff_spaMap_core_closedPoint (ι : Hom K K') :
    ι.IsSurjective ↔ ι.spaMap_core K'.closedPoint = K.closedPoint := sorry

/-! ## ClassicalAdicEtaleCohomology:H2/cohomology-over-geometric-field-pairs (lemma) -/

-- AdicSpace.GeometricFieldPair.etaleCohomology_eq_zero: not stated here; needs the étale site
--   of `Spa(C, C⁺)` and étale cohomology of abelian sheaves (supplier:
--   AdicEtaleGeometry:A1/etale-site, ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules).
--   Statement (ECD proof of Proposition 14.3): every étale `V → S` is locally an open immersion,
--   `S_ét` is equivalent to sheaves on `|S|`, and `Γ(S_ét, −)` is the stalk at `s`, so
--   `H⁰(S_ét, G) = G_s` and `Hⁱ(S_ét, G) = 0` for `i > 0`. Its topological core is
--   `eq_univ_of_isOpen_of_closedPoint_mem` and `isIso_Γgerm_closedPoint`.
-- AdicSpace.GeometricFieldPair.globalSectionsIsoStalk: not stated here; needs the étale site of
--   `Spa(C, C⁺)` and its geometric point at `s` (supplier: AdicEtaleGeometry:A1/etale-site,
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.GeometricFieldPair.etaleCohomology_iso_stalk_higherDirectImage: not stated here;
--   needs locally strongly sheafy analytic adic spaces `f : Y → S`, étale cohomology and higher
--   direct images (supplier: AdicSpaces Layer 5,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement (ii):
--   `Hⁱ(Y_ét, F) ≅ (Rⁱf_*F)_s`, naturally in `F`.
-- AdicSpace.GeometricFieldPair.pullback_eq_baseChange: not stated here; needs fibre products
--   `Y ×_S S'` and base-change maps of higher direct images (supplier:
--   AdicSpacesPartII:R0/affinoid-fibre-product,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image). Statement (iii): `g_Y^*` on `Hⁱ` is the
--   base-change map at `g_ι(s')` precomposed with specialisation `(Rⁱf_*F)_s → (Rⁱf_*F)_{g(s')}`,
--   which is the identity when `ι` is surjective.

/-- H2/cohomology-over-geometric-field-pairs ((i), topological core): `Spa(C, C⁺)` is the only
open subset containing the closed point `s`, as every point specialises to `s`. -/
theorem eq_univ_of_isOpen_of_closedPoint_mem (K : GeometricFieldPair.{u})
    {U : Set K.spa_core} (hU : IsOpen U) (hs : K.closedPoint ∈ U) : U = Set.univ := sorry

/-- H2/cohomology-over-geometric-field-pairs ((i), topological core): for every presheaf `F` of
abelian groups on `|Spa(C, C⁺)|`, the germ `F(S) → F_s` at the closed point is an isomorphism;
so global sections are the stalk functor at `s`, which is exact on sheaves (ECD proof of
Proposition 14.3). -/
theorem isIso_Γgerm_closedPoint (K : GeometricFieldPair.{u})
    (F : TopCat.Presheaf AddCommGrpCat.{u} (TopCat.of K.spa_core)) :
    IsIso (F.Γgerm K.closedPoint) := sorry

end GeometricFieldPair

/-! ## ClassicalAdicEtaleCohomology:H2/invariance-for-affinoids-of-finite-type (theorem) -/

-- AdicSpace.invariance_extensionByZero_of_topologicallyFiniteType: not stated here; needs the
--   étale site and cohomology of affinoid adic spaces, extension by zero along a quasicompact
--   open, and the fibre product `Y ×_S S'` (supplier: AdicEtaleGeometry:A1/etale-site,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero,
--   AdicSpacesPartII:R0/affinoid-fibre-product). Statement (Hub96 Theorem 4.1.1(c) in the form of
--   ECD Lemma 16.3): for a surjective extension `ι : (C, C⁺) → (C', C'⁺)`
--   (`GeometricFieldPair.Hom.IsSurjective`), `n` prime to the residue characteristic exponent,
--   a `ℤ/n`-module `M`, a complete pair `(R, R⁺)` over `(C, C⁺)` with `R` topologically of finite
--   type over `C` (`Huber.IsTopologicallyFiniteType`), `Y = Spa(R, R⁺)`,
--   `Y' = Spa(R ⊗̂_C C', (R ⊗̂_C C')⁺)` (`Huber.Pair.completedTensor`) and a quasicompact open
--   `j : U → Y` with preimage `j' : U' → Y'`, the pullback `Hⁱ(Y_ét, j_!M) → Hⁱ(Y'_ét, j'_!M)` is
--   bijective for every `i ≥ 0`

/-! ## ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids (construction) -/

-- AdicSpace.FiniteTypeApprox: not stated here; needs affinoid perfectoid spaces `X = Spa(R, R⁺)`
--   over `Spa(C, C⁺)` (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space) and the
--   evaluation map `C⟨T_i : i ∈ I⟩ → R`, `T_i ↦ i`, whose image `S_I` carries the quotient
--   topology (Scholze 2012, proof of Lemma 6.13(i))
-- AdicSpace.FiniteTypeApprox.isTopologicallyFiniteType: not stated here; needs
--   `AdicSpace.FiniteTypeApprox` (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space); the
--   predicate is Tau Ceti's `Huber.IsTopologicallyFiniteType`
-- AdicSpace.FiniteTypeApprox.space: not stated here; needs `Spa(S_I, S_I⁺)` as an adic space
--   over `S` (supplier: AdicSpaces Layer 5)
-- AdicSpace.FiniteTypeApprox.map: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.FiniteTypeApprox.proj: not stated here; needs morphisms from a perfectoid space to
--   adic spaces (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space, AdicSpaces Layer 5)
-- AdicSpace.FiniteTypeApprox.iUnion_eq: not stated here; needs `AdicSpace.FiniteTypeApprox`
--   (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space)
-- AdicSpace.FiniteTypeApprox.homeomorph: not stated here; needs the underlying spaces of the
--   adic spaces `Y_I` and of the perfectoid space `X` (supplier: AdicSpaces Layer 5,
--   PerfectoidSpaces:P5/spa-of-filtered-colimit-of-tate-pairs)
-- AdicSpace.FiniteTypeApprox.exists_isQuasiCompactOpen_preimage: not stated here; needs
--   `AdicSpace.FiniteTypeApprox.homeomorph` (supplier:
--   PerfectoidSpaces:P5/quasicompact-opens-in-limits-of-spectral-spaces)
-- AdicSpace.FiniteTypeApprox.isTildeLimit: not stated here; needs `PerfectoidSpace.IsTildeLimit`
--   and `PerfectoidSpace.IsResidueFieldTildeLimit` (supplier:
--   PerfectoidSpaces:P7/perfectoid-tilde-limit, PerfectoidSpaces:P7/residue-field-tilde-limit)
-- AdicSpace.FiniteTypeApprox.perf: not stated here; needs perfectoid spaces and their étale sites
--   (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space,
--   PerfectoidSpaces:P3/etale-site-of-perfectoid-space)
-- AdicSpace.FiniteTypeApprox.restrict: not stated here; needs rational subsets of the adic spaces
--   `Y_I` and `AdicSpace.FiniteTypeApprox.isTildeLimit` (supplier: AdicSpaces Layer 5,
--   PerfectoidSpaces:P7/perfectoid-tilde-limit)
-- AdicSpace.FiniteTypeApprox.plus_eq_powerBounded: not stated here; needs
--   `AdicSpace.FiniteTypeApprox` (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space); the
--   conclusion `S_I⁺ = S_I°` is Tau Ceti's `Huber.powerBoundedSubring`
-- FiniteTypeApprox.test_point: not stated here; needs `AdicSpace.FiniteTypeApprox.space`
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- FiniteTypeApprox.test_disc: not stated here; needs the perfectoid closed unit disc
--   (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space) [computation test]
-- FiniteTypeApprox.not_isPerfectoid: not stated here; needs perfectoid spaces (supplier:
--   PerfectoidSpaces:P2/affinoid-perfectoid-space) [non-example test]
-- FiniteTypeApprox.plus_eq_powerBounded_of_rankOne: not stated here; needs
--   `AdicSpace.FiniteTypeApprox` and the p-finite system (supplier:
--   PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids) [compatibility test]
-- FiniteTypeApprox.homeomorph_test: not stated here; needs
--   `AdicSpace.FiniteTypeApprox.homeomorph` and the perfectoid disc (supplier:
--   PerfectoidSpaces:P2/affinoid-perfectoid-space) [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H2/field-extension-of-finite-type-approximations (lemma) -/

-- AdicSpace.FiniteTypeApprox.baseChange_isTildeLimit: not stated here; needs
--   `AdicSpace.FiniteTypeApprox`, fibre products of adic spaces and tilde-limits (supplier:
--   AdicSpacesPartII:R0/affinoid-fibre-product, PerfectoidSpaces:P7/perfectoid-tilde-limit).
--   Statement: for any extension `ι` (not necessarily surjective), `X' = X ×_S S'` is affinoid
--   perfectoid, `Y_I' = Y_I ×_S S'` is noetherian of topologically finite type over `S'`, and
--   `X' ~ lim_I Y_I'` with `|X'| ≅ lim_I |Y_I'|`; preimages of quasicompact opens are compatible

/-! ## ClassicalAdicEtaleCohomology:H2/invariance-for-perfectoid-affinoids (theorem) -/

-- AdicSpace.invariance_extensionByZero_of_isAffinoidPerfectoid: not stated here; needs affinoid
--   perfectoid spaces, their étale sites and étale cohomology with extension by zero (supplier:
--   PerfectoidSpaces:P2/affinoid-perfectoid-space,
--   PerfectoidSpaces:P3/etale-site-of-perfectoid-space,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). Statement (ECD proof of
--   Lemma 16.3): for a surjective extension `ι`, `n` prime to `p`, an affinoid perfectoid `X`
--   over `S` and a quasicompact open `U ⊆ X`, `Hⁱ(X_ét, j_!M) → Hⁱ(X'_ét, j'_!M)` is bijective

/-! ## ClassicalAdicEtaleCohomology:H2/extension-by-zero-over-geometric-field-pairs (lemma) -/

-- AdicSpace.etaleCohomology_extensionByZero_fibreProduct: not stated here; needs the affinoid
--   perfectoid space `W = X₁ ×_{X₃} X₂` and its étale cohomology with extension by zero
--   (supplier: PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property,
--   PerfectoidSpaces:P3/etale-site-of-perfectoid-space,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). Statement (ECD Lemma 16.3):
--   for extensions `ι₁ : K₃ → K₁` (surjective) and `ι₂ : K₃ → K₂`, a quasicompact open
--   `U₂ ⊆ Spa(C₂, C₂⁺)` and `M` killed by `n` prime to `p`, `Hⁱ(W_ét, j₂!M) = 0` unless
--   `U₂ = X₂` and `i = 0`, and then pullback from `X₂` gives `H⁰(W_ét, j₂!M) = M`

/-! ## ClassicalAdicEtaleCohomology:H2/connectedness-via-maximal-generalisations (lemma) -/

-- AdicSpace.connectedSpace_iff_connectedSpace_genericFibre: not stated here; needs
--   quasicompact quasiseparated analytic adic spaces `Z` over `S` and the fibre product
--   `Z ×_S Spa(C, O_C)` (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/affinoid-fibre-product). Its affinoid core is
--   `AdicSpace.connectedSpace_iff_connectedSpace_genericFibre_affinoid`, with
--   `AdicSpace.isEmbedding_genericFibre_affinoid` and
--   `AdicSpace.existsUnique_maximal_generalization_affinoid`.

section GenericFibre

open ValuationSpectrum

variable (K : GeometricFieldPair.{u}) {A : Type v} [CommRing A] [TopologicalSpace A]
  [IsTopologicalRing A] [Huber.IsHuberRing A] (P : Huber.Pair A)
  (φ : Huber.Pair.Hom K.toPair P)

/-- H2/connectedness-via-maximal-generalisations ((i), affinoid, supporting): for
`Z = Spa(A, A⁺)` over `Spa(C, C⁺)` through `φ`, the pair `(A, A°⁺)` of
`Z° = Z ×_S Spa(C, O_C)`: `A°⁺` is the closure of the integral closure of `A⁺ · φ(O_C)`. -/
def GeometricFieldPair.genericFibrePair : Huber.Pair A where
  plus := (integralClosure ↥(P.plus ⊔ K.powerBounded.toSubring.map φ.toRingHom)
    A).toSubring.topologicalClosure
  isRingOfIntegralElements := sorry

/-- H2/connectedness-via-maximal-generalisations ((i), affinoid, supporting): the projection
`Z° → Z`, induced by the identity of `A`. -/
def GeometricFieldPair.genericFibreHom : Huber.Pair.Hom P (K.genericFibrePair P φ) where
  toRingHom := RingHom.id A
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- H2/connectedness-via-maximal-generalisations ((i), affinoid core): `Z° → Z` is a topological
embedding onto the fibre `h⁻¹(η)` over the generic point, which is the set of points `z` with
`|φ(c)(z)| ≤ 1` for every `c ∈ O_C`. -/
theorem isEmbedding_genericFibre_affinoid :
    IsEmbedding (K.genericFibreHom P φ).spaComap ∧
      Set.range (K.genericFibreHom P φ).spaComap = φ.spaComap ⁻¹' {K.genericPoint} ∧
      φ.spaComap ⁻¹' {K.genericPoint} =
        {z | ∀ c ∈ K.powerBounded, z.1.toValuativeRel.vle (φ.toRingHom c) 1} := sorry

/-- H2/connectedness-via-maximal-generalisations ((ii), affinoid core): every point `z` of
`Z = Spa(A, A⁺)` has a unique maximal generalisation, and it lies over the generic point `η`
(Scholze–Weinstein, Berkeley Lectures, Proposition 4.2.5; ECD proof of Lemma 14.6). -/
theorem existsUnique_maximal_generalization_affinoid (z : spa P.plus) :
    (∃! w : spa P.plus, w ⤳ z ∧ ∀ w' : spa P.plus, w' ⤳ w → w' = w) ∧
      ∀ w : spa P.plus, w ⤳ z → (∀ w' : spa P.plus, w' ⤳ w → w' = w) →
        φ.spaComap w = K.genericPoint := sorry

/-- H2/connectedness-via-maximal-generalisations ((iii), affinoid core): `Z = Spa(A, A⁺)` is
connected iff `Z° = Spa(A, A°⁺)` is: a disconnection of `Z°` extends to `Z` by closures
(ECD proof of Lemma 14.6). -/
theorem connectedSpace_iff_connectedSpace_genericFibre_affinoid :
    ConnectedSpace (spa P.plus) ↔ ConnectedSpace (spa (K.genericFibrePair P φ).plus) := sorry

end GenericFibre

/-! ## ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-finite-type-spaces (theorem) -/

-- AdicSpace.connectedSpace_baseChange_iff_of_locallyFiniteType: not stated here; needs
--   quasi-separated adic spaces locally of finite type over `Spa(C, O_C)` and their base change
--   to `Spa(C', O_{C'})` (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/affinoid-fibre-product). Its ring-level core, the affinoid case
--   `Y = Spa(A, A°)`, is `AdicSpace.connectedSpace_baseChange_iff_of_locallyFiniteType_ring`.

/-- H2/geometric-connectedness-of-finite-type-spaces (ring-level core, the affinoid case
`Y = Spa(A, A°)`): for a `C`-affinoid algebra `A` over an algebraically closed complete
nonarchimedean field `C` and a complete nonarchimedean extension `C'/C` (not necessarily
algebraically closed), `A` has no idempotents other than `0` and `1` iff `A ⊗̂_C C'` has none
(Conrad 1999, Theorem 3.2.1; ECD proof of Lemma 14.6). -/
theorem connectedSpace_baseChange_iff_of_locallyFiniteType_ring {C C' A : Type*}
    [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C] [IsAlgClosed C]
    [Huber.IsTateRing C] [NontriviallyNormedField C'] [IsUltrametricDist C'] [CompleteSpace C']
    [NormedAlgebra C C'] [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [CompleteSpace A] [T2Space A] [Algebra C A]
    (hA : Huber.IsTopologicallyFiniteType (algebraMap C A)) :
    (∀ e : A, IsIdempotentElem e → e = 0 ∨ e = 1) ↔
      ∀ e : Huber.CompletedTensor C A C', IsIdempotentElem e → e = 0 ∨ e = 1 := sorry

/-! ## ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-perfectoid-base-change (theorem) -/

-- AdicSpace.connectedSpace_baseChange_of_isAffinoidPerfectoid: not stated here; needs affinoid
--   perfectoid spaces `Z` over `Spa(C, C⁺)` and the fibre product `Z ×_X Spa(C', C'⁺)`
--   (supplier: PerfectoidSpaces:P2/affinoid-perfectoid-space,
--   PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property). Statement (ECD
--   Lemma 14.6): for a connected affinoid perfectoid `Z` over `Spa(C, C⁺)` and any extension
--   `ι : (C, C⁺) → (C', C'⁺)` (`GeometricFieldPair.Hom`, not necessarily surjective),
--   `Z ×_X Spa(C', C'⁺)` is connected and nonempty

end AdicSpace

end TauCeti

end

/-! # Stage H3. Proper-support direct images, base change, dimension bound, curve trace and
Poincaré duality

Huber's proper-support direct image `R⁺f_!` for compactifiable morphisms of locally noetherian
analytic adic spaces, its independence of the compactification, base change, composition and
cohomological dimension, and the trace and Poincaré duality for smooth adic curves over
`Spa(C, C⁺)` (Huber 1996 Chapters 5 and 7, Berkovich 1993 Chapters 5–7, in the form used by
Scholze's *Étale cohomology of diamonds* §§18–24 and Zavyalov §9).

**What is stated.** The topological layer of H3.1 is stated against Mathlib: taut spaces and taut
spectral maps (`AdicSpace.IsTaut`, `AdicSpace.IsTautMap`, over Mathlib's `QuasiSeparatedSpace`,
`PrespectralSpace` and `IsSpectralMap`), and the support condition of a pseudo-adic space
(`AdicSpace.PseudoAdic_core`: convex for specialisation and locally pro-constructible, with Tau
Ceti's `IsProConstructible`). Ring-level cores are stated for the affinoid charts of the universal
compactification (`AdicSpace.compactification_affinoid` and its two morphisms of Huber pairs), for
the henselian comparison in degree zero over finite algebras
(`AlgebraicGeometry.henselian_proper_restrict_iso_finite_core`) and for the multiplicities in the
stalk formula of the flat quasi-finite trace (`AdicSpace.quasiFiniteTrace_stalk_ring`).

**What is not stated.** Everything else lives on the anchor's adic spaces (AdicSpaces Layer 5),
on AdicSpacesPartII R0's morphism classes and fibre products, on the étale sites of
AdicEtaleGeometry A1 and on the étale sheaves, derived categories, extension by zero and Tate
twists of ClassicalAdicEtaleCohomology H0; each such item is a comment
`-- <name>: not stated here; needs … (supplier: …)` under its node's header. No stand-in is
introduced for any geometric category. -/

noncomputable section

namespace TauCeti

open Topology TopologicalSpace ValuationSpectrum Huber

/-! ## ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms (definition) -/

namespace AdicSpace

section Taut

/-- H3/taut-spaces-and-morphisms (structure; Kedlaya–Liu Definition 8.1.10, Huber 1996 §5.1):
a topological space `T` is *taut* if it is quasi-separated and the closure of every quasi-compact
open subset is quasi-compact. The node applies it to locally spectral spaces (the underlying
spaces of adic spaces); the predicate needs no hypothesis on `T`, and an adic space is taut when
its underlying space is. -/
structure IsTaut (T : Type*) [TopologicalSpace T] : Prop where
  /-- `T` is quasi-separated: the intersection of two quasi-compact opens is quasi-compact. -/
  quasiSeparatedSpace : QuasiSeparatedSpace T
  /-- The closure of every quasi-compact open subset is quasi-compact. -/
  isCompact_closure_of_isOpen : ∀ U : Set T, IsOpen U → IsCompact U → IsCompact (closure U)

variable {T : Type*} [TopologicalSpace T]

/-- H3/taut-spaces-and-morphisms (characterisation; Kedlaya–Liu Definition 8.1.10): in a taut
space whose quasi-compact opens form a basis (Mathlib's `PrespectralSpace`, e.g. a locally
spectral space), the closure of every quasi-compact subset is quasi-compact. -/
theorem IsTaut.isCompact_closure [PrespectralSpace T] (h : IsTaut T) {A : Set T}
    (hA : IsCompact A) : IsCompact (closure A) := sorry

/-- H3/taut-spaces-and-morphisms (instance; Kedlaya–Liu Definition 8.1.10): a quasi-compact
quasi-separated space is taut. -/
theorem IsTaut.of_compactSpace [CompactSpace T] [QuasiSeparatedSpace T] : IsTaut T := sorry

/-- H3/taut-spaces-and-morphisms (Kedlaya–Liu Definition 8.1.10 and the properties of Huber 1996
Lemma 5.1.3 it cites): a quasi-separated space with a locally finite covering by quasi-compact
open subsets is taut. -/
theorem IsTaut.of_locallyFinite [QuasiSeparatedSpace T] {ι : Type*} (U : ι → Set T)
    (hU : ∀ i, IsOpen (U i) ∧ IsCompact (U i)) (hcov : ⋃ i, U i = Set.univ)
    (hlf : LocallyFinite U) : IsTaut T := sorry

-- AdicSpace.IsTaut.isOpen_subset: not stated here; needs adic spaces over an analytic field,
--   their open subspaces and the partially proper open subsets of Kedlaya–Liu (supplier:
--   AdicSpaces Layer 5). Its topological core is `AdicSpace.IsTaut.isOpen_subset_core`.

/-- H3/taut-spaces-and-morphisms (topological core of `AdicSpace.IsTaut.isOpen_subset`;
Kedlaya–Liu Lemma 8.2.12(c)): an open subset `U` of a taut space such that the closure of every
quasi-compact open `V ⊆ U` stays inside `U` is taut. A partially proper open subset in the sense
of Kedlaya–Liu (the inverse image of an open subset of the maximal Hausdorff quotient) has this
property: the image of `V` in that quotient is compact, hence closed. -/
theorem IsTaut.isOpen_subset_core (hT : IsTaut T) {U : Set T} (hU : IsOpen U)
    (hcl : ∀ V ⊆ U, IsOpen V → IsCompact V → closure V ⊆ U) : IsTaut U := sorry

/-- H3/taut-spaces-and-morphisms (structure; Kedlaya–Liu Definition 8.1.10): a spectral map
`g : T' → T` is *taut* if the inverse image of every taut open subset of `T` is taut. -/
structure IsTautMap {T' T : Type*} [TopologicalSpace T'] [TopologicalSpace T] (g : T' → T) :
    Prop where
  /-- `g` is spectral: continuous, with quasi-compact inverse images of quasi-compact opens. -/
  isSpectralMap : IsSpectralMap g
  /-- The inverse image of every taut open subset is taut. -/
  isTaut_preimage : ∀ W : Set T, IsOpen W → IsTaut W → IsTaut (g ⁻¹' W)

/-- H3/taut-spaces-and-morphisms (instance; Kedlaya–Liu Definition 8.1.10, "any qcqs morphism
is taut"): a spectral map to a space whose quasi-compact opens form a basis is taut as soon as it
is quasi-separated, i.e. the inverse image of every quasi-compact quasi-separated open is
quasi-separated. -/
theorem IsTautMap.of_qcqs {T' T : Type*} [TopologicalSpace T'] [TopologicalSpace T]
    [PrespectralSpace T] {g : T' → T} (hg : IsSpectralMap g)
    (hqs : ∀ W : Set T, IsOpen W → IsCompact W → QuasiSeparatedSpace W →
      QuasiSeparatedSpace (g ⁻¹' W)) : IsTautMap g := sorry

/-- H3/taut-spaces-and-morphisms (functoriality; Huber 1996 Lemma 5.1.3, as cited by
Kedlaya–Liu Definition 8.1.10): the composite of taut maps is taut. -/
theorem IsTautMap.comp {T'' T' T : Type*} [TopologicalSpace T''] [TopologicalSpace T']
    [TopologicalSpace T] {g : T' → T} {h : T'' → T'} (hg : IsTautMap g) (hh : IsTautMap h) :
    IsTautMap (g ∘ h) := sorry

/-- H3/taut-spaces-and-morphisms (compatibility; Huber 1996 Lemma 5.1.3): the source of a taut
map to a taut space is taut. -/
theorem IsTaut.of_isTautMap {T' : Type*} [TopologicalSpace T'] {g : T' → T} (hg : IsTautMap g)
    (hT : IsTaut T) : IsTaut T' := sorry

-- AdicSpace.IsTaut.of_partiallyProper: not stated here; needs partially proper morphisms of
--   adic spaces (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/partially-proper-closure-quasi-compact)

end Taut

section TautTests

/- Affinoid core: the closed unit disc `Spa(K⟨T⟩, K°⟨T⟩)` (Tau Ceti's `spa` of the power-bounded
subring of `restrictedMvPowerSeriesCompletion 1 K`) is taut; it is a spectral space (Wedhorn
Theorem 7.35), hence quasi-compact and quasi-separated. -/
-- test isTaut_closedDisc (computation) [H3/taut-spaces-and-morphisms]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] :
    IsTaut (spa (powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 K))) := sorry

-- isTaut_affineLine: not stated here; needs the adic affine line `A^{1,ad}_K`, a union of
--   increasing closed discs glued along rational subsets (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R1/scheme-fibre-product-analytification) [computation test]
-- not_isTaut_doubledDisc: not stated here; needs the gluing of two closed discs along the
--   complement of the origin as an adic space (supplier: AdicSpaces Layer 5) [non-example test]

-- test isTaut_iff_isCompact_closure_isCompact (characterisation) [H3/taut-spaces-and-morphisms]
example (T : Type*) [TopologicalSpace T] [QuasiSeparatedSpace T] [PrespectralSpace T] :
    IsTaut T ↔ ∀ A : Set T, IsCompact A → IsCompact (closure A) := sorry

/- The identity is a quasi-compact quasi-separated spectral map, hence taut. -/
-- test isTautMap_of_qcqs (degenerate) [H3/taut-spaces-and-morphisms]
example (T : Type*) [TopologicalSpace T] : IsTautMap (id : T → T) := sorry

end TautTests

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H3/compactifiable-morphism (definition) -/

-- AdicSpace.IsCompactifiable: not stated here; needs morphisms of locally noetherian analytic
--   adic spaces, separated morphisms and morphisms locally of +weakly finite type (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/separated-morphism,
--   AdicSpacesPartII:R0/plus-weakly-finite-type). Its tautness clause is
--   `AdicSpace.IsTautMap` of the underlying map.
-- AdicSpace.IsCompactifiable.comp: not stated here; needs `AdicSpace.IsCompactifiable`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCompactifiable.of_isProper: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.IsCompactifiable.of_isOpenImmersion: not stated here; needs open immersions of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCompactifiable.of_etale: not stated here; needs étale morphisms of adic spaces
--   (supplier: AdicEtaleGeometry:A1/etale-site; Huber 1996 Lemma 5.1.3(iv))
-- AdicSpace.IsCompactifiable.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsCompactifiable.restrict: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCompactifiable.locallyOfPlusWeaklyFiniteType: not stated here; needs morphisms
--   locally of +weakly finite type (supplier: AdicSpacesPartII:R0/plus-weakly-finite-type)

-- isCompactifiable_relBall: not stated here; needs the relative closed ball `B_S → S` over
--   `S = Spa(C, C⁺)` as a morphism of adic spaces (supplier:
--   AdicEtaleGeometry:A2/relative-closed-polydisc) [computation test]
-- isCompactifiable_openDisc: not stated here; needs the open unit disc as a non-quasi-compact
--   adic space over `Spa(C, O_C)` (supplier: AdicSpaces Layer 5) [computation test]
-- not_isCompactifiable_doubledDisc: not stated here; needs the doubled closed disc as an adic
--   space (supplier: AdicSpaces Layer 5) [non-example test]
-- isCompactifiable_of_isProper: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism) [compatibility test]
-- isCompactifiable_id: not stated here; needs identities of locally noetherian analytic adic
--   spaces (supplier: AdicSpacesPartII:R0/locally-noetherian-adic-space) [degenerate test]

/-! ## ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space (definition) -/

namespace AdicSpace

-- AdicSpace.PseudoAdic: not stated here; needs the anchor's locally noetherian analytic adic
--   spaces (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/locally-noetherian-adic-space).
--   The condition on the support set is the topological core `AdicSpace.PseudoAdic_core`.

/-- H3/pseudo-adic-support-space (topological core of `AdicSpace.PseudoAdic`; Huber 1996
(1.10.3)): a subset `S` of a topological space is the support of a pseudo-adic space if it is
convex for specialisation (`s ⤳ x ⤳ s'` with `s, s' ∈ S` forces `x ∈ S`) and locally
pro-constructible: every point has an open spectral neighbourhood `U` in which `S ∩ U` is
pro-constructible (Tau Ceti's `IsProConstructible`, closed for the constructible topology). -/
structure PseudoAdic_core {T : Type*} [TopologicalSpace T] (S : Set T) : Prop where
  /-- `S` is convex: a point lying between two points of `S` for specialisation is in `S`. -/
  convex : ∀ ⦃s x s' : T⦄, s ∈ S → s' ∈ S → s ⤳ x → x ⤳ s' → x ∈ S
  /-- `S` is locally pro-constructible. -/
  locallyProConstructible : ∀ x : T, ∃ U : Set T, IsOpen U ∧ x ∈ U ∧ SpectralSpace U ∧
    IsProConstructible (Subtype.val ⁻¹' S : Set U)

-- AdicSpace.PseudoAdic.site: not stated here; needs the étale site `Et/X` of an adic space
--   (supplier: AdicEtaleGeometry:A1/etale-site,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.PseudoAdic.restrict: not stated here; needs étale sheaves of `Λ`-modules on adic
--   spaces and sheafification for the `S`-topology (supplier:
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.PseudoAdic.pushforward: not stated here; needs étale sheaves of `Λ`-modules on adic
--   spaces (supplier: ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.PseudoAdic.ofClosed: not stated here; needs the anchor's adic spaces (supplier:
--   AdicSpaces Layer 5). Its topological core is `AdicSpace.PseudoAdic.ofClosed_core`.

/-- H3/pseudo-adic-support-space (topological core of `AdicSpace.PseudoAdic.ofClosed`; Huber
1996 (1.10.3), node convention (ii)): in a locally spectral space every closed subset is convex
and locally pro-constructible. -/
theorem PseudoAdic.ofClosed_core {T : Type*} [TopologicalSpace T]
    (hT : ∀ x : T, ∃ U : Set T, IsOpen U ∧ x ∈ U ∧ SpectralSpace U) {Z : Set T}
    (hZ : IsClosed Z) : PseudoAdic_core Z := sorry

-- AdicSpace.PseudoAdic.ofOpen: not stated here; needs open adic subspaces `(U, |U|)` (supplier:
--   AdicSpaces Layer 5). An open subset `U ⊆ |X|` is in general not locally pro-constructible in
--   `X`, so `(X, U)` is not the pseudo-adic space attached to `U`.
-- AdicSpace.PseudoAdic.stalk: not stated here; needs geometric points and stalks of étale
--   sheaves on adic spaces (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points,
--   ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
-- AdicSpace.PseudoAdic.recollement: not stated here; needs extension by zero and the derived
--   categories of étale sheaves (supplier:
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.PseudoAdic.comap: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5). Its topological core is `AdicSpace.PseudoAdic.comap_core`.

/-- H3/pseudo-adic-support-space (topological core of `AdicSpace.PseudoAdic.comap`; node clause
(iv)): the inverse image of a pseudo-adic support under a spectral map of spectral spaces is a
pseudo-adic support. -/
theorem PseudoAdic.comap_core {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] {f : X → Y} (hf : IsSpectralMap f) {S : Set Y}
    (hS : PseudoAdic_core S) : PseudoAdic_core (f ⁻¹' S) := sorry

-- AdicSpace.PseudoAdic.closedFibre: not stated here; needs morphisms `X → Spa(C, C⁺)` of adic
--   spaces (supplier: AdicSpaces Layer 5); its support `f⁻¹(s)` is the inverse image of the
--   closed point, covered by `AdicSpace.PseudoAdic.ofClosed_core`.

section PseudoAdicTests

/- Topological core: in a locally spectral space the whole space is a pseudo-adic support, so
`(X, |X|)` is a pseudo-adic space. -/
-- test pseudoAdic_univ (degenerate) [H3/pseudo-adic-support-space]
example (T : Type*) [TopologicalSpace T]
    (hT : ∀ x : T, ∃ U : Set T, IsOpen U ∧ x ∈ U ∧ SpectralSpace U) :
    PseudoAdic_core (Set.univ : Set T) := sorry

end PseudoAdicTests

-- pseudoAdic_closedPoint: not stated here; needs étale sheaves on the pseudo-adic space
--   `(Spa(C, C⁺), {s})` (supplier: ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)
--   [computation test]
-- boundaryPoint_not_isOpen: not stated here; needs the universal compactification as an adic
--   space (supplier: AdicSpaces Layer 5); its affinoid core is the test
--   `compactification_closedDisc` of H3/universal-compactification [non-example test]
-- pseudoAdic_recollement: not stated here; needs the derived categories of étale sheaves and
--   extension by zero (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
--   [compatibility test]
-- pseudoAdic_open: not stated here; needs the étale site of an open adic subspace (supplier:
--   AdicEtaleGeometry:A1/etale-site) [characterisation test]

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H3/universal-compactification (construction) -/

namespace AdicSpace

-- AdicSpace.compactification: not stated here; needs the anchor's adic spaces and compactifiable
--   morphisms (supplier: AdicSpaces Layer 5, H3/compactifiable-morphism). Its affinoid core is
--   `AdicSpace.compactification_affinoid`.
-- AdicSpace.compactification.ι: not stated here; needs open immersions of adic spaces (supplier:
--   AdicSpaces Layer 5). Its affinoid core is `AdicSpace.compactification.ι_affinoid`.
-- AdicSpace.compactification.proj: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5). Its affinoid core is `AdicSpace.compactification.proj_affinoid`.
-- AdicSpace.compactification.isPartiallyProper: not stated here; needs partially proper
--   morphisms (supplier: AdicSpacesPartII:R0/partially-proper-morphism)
-- AdicSpace.compactification.lift: not stated here; needs partially proper morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/partially-proper-morphism)
-- AdicSpace.compactification.lift_comp_ι: not stated here; needs
--   `AdicSpace.compactification.lift` (supplier: AdicSpacesPartII:R0/partially-proper-morphism)
-- AdicSpace.compactification.hom_ext: not stated here; needs morphisms of adic spaces over `Y`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.compactification.affinoid: not stated here; needs `Spa` of a Huber pair as an adic
--   space (supplier: AdicSpaces Layer 5); the chart it identifies is
--   `Spa(B, B'⁺)` with `B'⁺ = (AdicSpace.compactification_affinoid f).plus`
-- AdicSpace.compactification.rankOne_points: not stated here; needs points of rank one of adic
--   spaces (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.compactification.rankOne_points_affinoid`.
-- AdicSpace.compactification.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.compactification.map: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5)

section CompactificationAffinoid

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B] {S : Pair A}
  {T : Pair B}

/-- H3/universal-compactification (affinoid core of `AdicSpace.compactification`; Huber 1996
Theorem 5.1.5, as used in Zavyalov Lemma 9.1 Step 1 and Scholze ECD §18): for a morphism of Huber
pairs `f : (A, A⁺) → (B, B⁺)`, the Huber pair `(B, B'⁺)` whose plus ring `B'⁺` is the integral
closure in `B` of the subring generated by `f(A⁺)` and the topologically nilpotent elements
`B°°`. When `B` is topologically of finite type over `A`, `Spa(B, B'⁺)` is the universal
compactification of `Spa(B, B⁺) → Spa(A, A⁺)`. -/
def compactification_affinoid (f : Pair.Hom S T) : Pair B where
  plus := (integralClosure ↥(Subring.closure (f.toRingHom '' (S.plus : Set A) ∪
    {b : B | IsTopologicallyNilpotent b})) B).toSubring
  isRingOfIntegralElements := sorry

/-- H3/universal-compactification (affinoid core of `AdicSpace.compactification.ι`): the
identity of `B` as a morphism of Huber pairs `(B, B'⁺) → (B, B⁺)`; its `spaComap` is the
embedding `j : Spa(B, B⁺) → Spa(B, B'⁺)`. -/
def compactification.ι_affinoid (f : Pair.Hom S T) :
    Pair.Hom (compactification_affinoid f) T where
  toRingHom := RingHom.id B
  continuous_toRingHom := continuous_id
  map_mem_plus := sorry

/-- H3/universal-compactification (affinoid core of `AdicSpace.compactification.proj`): `f` as a
morphism of Huber pairs `(A, A⁺) → (B, B'⁺)`; its `spaComap` is `f̄ : Spa(B, B'⁺) → Spa(A, A⁺)`.
-/
def compactification.proj_affinoid (f : Pair.Hom S T) :
    Pair.Hom S (compactification_affinoid f) where
  toRingHom := f.toRingHom
  continuous_toRingHom := f.continuous_toRingHom
  map_mem_plus := sorry

/-- H3/universal-compactification (affinoid core of the factorisation `f = f̄ ∘ j`): on Huber
pairs, `f` is `(B, B'⁺) → (B, B⁺)` after `(A, A⁺) → (B, B'⁺)`. -/
theorem compactification.ι_comp_proj_affinoid (f : Pair.Hom S T) :
    (compactification.ι_affinoid f).comp (compactification.proj_affinoid f) = f := sorry

end CompactificationAffinoid

section CompactificationAffinoidTate

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsTateRing B] {S : Pair A}
  {T : Pair B}

/-- H3/universal-compactification (affinoid core of `AdicSpace.compactification.rankOne_points`;
Scholze ECD §18 before Proposition 18.6): for a Tate ring `B`, `Spa(B, B⁺) ⊆ Spa(B, B'⁺)` and
every point of `Spa(B, B'⁺)` is a specialisation of a point of `Spa(B, B⁺)` (its rank-one
generalisation), so the two spaces have the same rank-one points. -/
theorem compactification.rankOne_points_affinoid (f : Pair.Hom S T) :
    spa T.plus ⊆ spa (compactification_affinoid f).plus ∧
      ∀ v ∈ spa (compactification_affinoid f).plus, ∃ w ∈ spa T.plus, w ⤳ v := sorry

end CompactificationAffinoidTate

section CompactificationTests

/- Affinoid core: for the closed unit disc over `(K, K°)`, `Spa(K⟨T⟩, B'⁺)` has exactly one point
outside `Spa(K⟨T⟩, K⟨T⟩°)` (the point `x_∞` with `|T|` infinitesimally larger than `1`), and it is
closed. -/
-- test compactification_closedDisc (computation) [H3/universal-compactification]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (f : Pair.Hom (Pair.powerBounded K)
      (Pair.powerBounded (restrictedMvPowerSeriesCompletion 1 K)))
    (hf : f.toRingHom = algebraMap K (restrictedMvPowerSeriesCompletion 1 K)) :
    ∃ x, spa (compactification_affinoid f).plus \
        spa (powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 K)) = {x} ∧
      IsClosed (Subtype.val ⁻¹' {x} : Set (spa (compactification_affinoid f).plus)) := sorry

end CompactificationTests

-- compactification_of_isProper: not stated here; needs proper morphisms and isomorphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
--   [degenerate test]
-- compactification_openDisc: not stated here; needs the open unit disc as an adic space
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- compactification_not_smooth: not stated here; needs smooth morphisms of adic spaces (supplier:
--   AdicSpacesPartII:R0/smooth-morphism) [non-example test]
-- compactification_lift_comp: not stated here; needs `P¹` over `Spa(C, O_C)` as an adic space
--   (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification) [characterisation test]

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation (lemma) -/

-- AdicSpace.compactification.isProper_of_quasiCompact (H3/compactification-proper-factorisation;
--   Huber 1996 Corollaries 5.1.6 and 5.1.14 via Zavyalov): not stated here; needs proper and
--   quasi-compact morphisms of adic spaces and relative dimension (supplier:
--   AdicSpacesPartII:R0/universally-closed-and-proper-morphism,
--   AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres)

/-! ## ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek (construction) -/

-- AdicSpace.properSupportSections: not stated here; needs étale sheaves of `Λ`-modules on adic
--   spaces and partially proper morphisms (supplier:
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules,
--   AdicSpacesPartII:R0/partially-proper-morphism)
-- AdicSpace.properSupportSections.le_pushforward: not stated here; needs the étale pushforward
--   `f_*` (supplier: ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.properSupportSections.eq_of_isProper: not stated here; needs proper morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.properSupportSections.colim: not stated here; needs extension by zero along
--   quasi-compact opens (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
-- AdicSpace.properSupportSections.leftExact: not stated here; needs
--   `AdicSpace.properSupportSections` (supplier:
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.properSupportSections.preservesFilteredColimits: not stated here; needs
--   `AdicSpace.properSupportSections` (supplier:
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.properSupportSections.stalk: not stated here; needs geometric points and fibres of
--   adic spaces (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points,
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.properSupportSections.comp: not stated here; needs composition of partially proper
--   morphisms (supplier: AdicSpacesPartII:R0/partially-proper-morphism)
-- AdicSpace.RProperSupportSections: not stated here; needs `D⁺(X_ét, Λ)` and right derived
--   functors (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)

-- partiallyProperLowerShriek_openDisc: not stated here; needs the open unit disc and constant
--   étale sheaves (supplier: AdicSpaces Layer 5,
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules) [computation test]
-- partiallyProperLowerShriek_eq_pushforward_of_isProper: not stated here; needs
--   `AdicSpace.properSupportSections` (supplier:
--   ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules) [compatibility test]
-- partiallyProperLowerShriek_id: not stated here; needs `AdicSpace.properSupportSections`
--   (supplier: ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules) [degenerate test]
-- partiallyProperLowerShriek_ne_pushforward: not stated here; needs the open unit disc and
--   constant étale sheaves (supplier: AdicSpaces Layer 5) [non-example test]
-- partiallyProperLowerShriek_colim: not stated here; needs extension by zero (supplier:
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero) [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H3/proper-support-direct-image (construction) -/

-- AdicSpace.lowerShriek: not stated here; needs `D⁺(X_ét, Λ)` on adic spaces, extension by zero
--   and the universal compactification (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, AdicSpaces Layer 5)
-- AdicSpace.lowerShriek_def: not stated here; needs `AdicSpace.lowerShriek` (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.lowerShriek_of_isCompact: not stated here; needs the derived pushforward `Rf̄_*`
--   (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.lowerShriekToPushforward: not stated here; needs `AdicSpace.lowerShriek` and `Rf_*`
--   (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.lowerShriekToPushforward_isIso_of_isProper: not stated here; needs proper morphisms
--   of adic spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.compactCohomology: not stated here; needs hypercohomology on the étale site of an
--   adic space (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.lowerShriek_shift: not stated here; needs `AdicSpace.lowerShriek` (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)
-- AdicSpace.lowerShriekUnbounded: not stated here; needs the unbounded derived category of
--   étale sheaves and K-injective replacements (supplier:
--   EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements)
-- AdicSpace.lowerShriek.map_comp: not stated here; needs `AdicSpace.lowerShriek` (supplier:
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image); it is H3/lower-shriek-composition

-- lowerShriek_relBall: not stated here; needs the relative ball and `μ_n` as an étale sheaf
--   (supplier: AdicEtaleGeometry:A2/relative-closed-polydisc,
--   ClassicalAdicEtaleCohomology:H0/tate-twists) [computation test]
-- lowerShriek_eq_pushforward_of_isProper: not stated here; needs `AdicSpace.lowerShriek`
--   (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image) [compatibility test]
-- lowerShriek_openImmersion: not stated here; needs extension by zero along open immersions of
--   adic spaces (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
--   [degenerate test]
-- lowerShriek_ne_pushforward_closedDisc: not stated here; needs compactly supported cohomology
--   of the closed disc (supplier: ClassicalAdicEtaleCohomology:H0/derived-direct-image)
--   [non-example test]
-- lowerShriek_ne_berkovich: not stated here; needs Berkovich spaces and their compactly supported
--   cohomology (supplier: TropicalAndBerkovichArithmetic:TB.0) [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change (lemma) -/

namespace AlgebraicGeometry

-- AlgebraicGeometry.henselian_proper_restrict_iso (H3/henselian-proper-base-change; Huber 1996
--   Lemma 3.2.5): not stated here; needs étale cohomology of schemes with restriction along the
--   closed immersion `𝒫 ⊗ A/I → 𝒫` (Mathlib has the small étale site `smallEtaleTopology`, not
--   pullback of étale sheaves along scheme morphisms) and proper base change over affine bases
--   (supplier: UPSTREAM:ECD:SCH_BC,
--   ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5). Its
--   degree-zero finite core is
--   `AlgebraicGeometry.henselian_proper_restrict_iso_finite_core`.

/-- H3/henselian-proper-base-change (degree-zero core for finite `π`; Huber 1996 Lemma 3.2.5,
Stacks Tag 09XI): for `A` henselian along `I` and a finite `A`-algebra `B`, reduction modulo `IB`
is a bijection on idempotents. These are the clopen subsets of `Spec B` and of
`Spec (B/IB)`, so this is the restriction isomorphism `H⁰(Spec B, Λ) ≅ H⁰(Spec(B/IB), Λ)` for
constant `Λ` and the finite, hence proper, morphism `Spec B → Spec A`. -/
theorem henselian_proper_restrict_iso_finite_core {A : Type*} [CommRing A] (I : Ideal A)
    [HenselianRing A I] (B : Type*) [CommRing B] [Algebra A B] [Module.Finite A B] :
    Set.BijOn (Ideal.Quotient.mk (I.map (algebraMap A B))) {e : B | IsIdempotentElem e}
      {e : B ⧸ I.map (algebraMap A B) | IsIdempotentElem e} := sorry

end AlgebraicGeometry

/-! ## ClassicalAdicEtaleCohomology:H3/formal-model-transfer (comparison) -/

-- AdicSpace.formalModelTransfer (H3/formal-model-transfer; Huber 1996 Corollary 3.5.11 and
--   Theorem 3.5.13): not stated here; needs formal schemes of type (S), their generic fibre and
--   the specialisation morphism of sites `λ`, adic spaces and compactly supported pushforward of
--   schemes (supplier: AdicSpacesPartII:R2/generic-fibre-functor-d,
--   ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda,
--   UPSTREAM:ECD:SCH_SUPPORT_NOETH)
-- AdicSpace.formalModelTransfer_smooth (the smooth clause): not stated here; needs the same
--   carriers and locally constant constructible sheaves on schemes (supplier:
--   UPSTREAM:ECD:SCH_BC)

/-! ## ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing (lemma) -/

-- AdicSpace.proper_closedFibre_restrict_iso (H3/proper-closed-fibre-vanishing; Zavyalov
--   Proposition 9.3 Part (1), Scholze ECD Lemma 19.4): not stated here; needs proper morphisms to
--   `Spa(C, C⁺)`, the pseudo-adic closed fibre and `RΓ` on étale sites of adic spaces (supplier:
--   AdicSpacesPartII:R0/universally-closed-and-proper-morphism, H3/pseudo-adic-support-space,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero (theorem) -/

-- AdicSpace.properBaseChangeExtendByZero (H3/proper-base-change-extension-by-zero; Zavyalov
--   Proposition 9.3(1), Scholze ECD Theorem 19.2): not stated here; needs proper and étale
--   morphisms, fibre products, extension by zero and `Rf_*` on adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence (theorem) -/

-- AdicSpace.lowerShriekIsoOfFactorisation (H3/lower-shriek-factorisation-independence; Huber
--   1996 Theorem 5.1.5 via Zavyalov Theorem 9.4 Step 5, Scholze ECD Definition 22.4): not stated
--   here; needs `AdicSpace.lowerShriek`, open immersions and proper morphisms of adic spaces
--   (supplier: H3/proper-support-direct-image, AdicSpaces Layer 5)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion (lemma) -/

-- AdicSpace.lowerShriek_colim_quasiCompactOpens (H3/lower-shriek-quasi-compact-exhaustion;
--   Berkovich 1993 Proposition 5.2.8): not stated here; needs `AdicSpace.lowerShriek` and
--   extension by zero along quasi-compact opens (supplier: H3/proper-support-direct-image,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-composition (theorem) -/

-- AdicSpace.lowerShriekComp (H3/lower-shriek-composition; Scholze ECD Proposition 22.9): not
--   stated here; needs `AdicSpace.lowerShriek` (supplier: H3/proper-support-direct-image,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases (lemma) -/

-- AdicSpace.lowerShriekIsoPushforward, AdicSpace.lowerShriekIsoRProperSupport,
--   AdicSpace.lowerShriekIsoExtendByZero, AdicSpace.lowerShriekIsoEtaleShriek
--   (H3/lower-shriek-proper-and-etale-cases, clauses (a)–(d); Scholze ECD Proposition 22.10):
--   not stated here; need `AdicSpace.lowerShriek`, `Rf_*`, extension by zero and the étale
--   `f_!` (supplier: H3/proper-support-direct-image,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)

/-! ## ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change (theorem) -/

-- AdicSpace.properPushforward_baseChange_isIso (H3/proper-pushforward-base-change; Zavyalov
--   Lemma 9.1(3), Berkovich 1993 Theorem 7.7.1): not stated here; needs fibre products of adic
--   spaces, `g^*` and `Rf_*` on étale sheaves (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change (theorem) -/

-- AdicSpace.lowerShriekBaseChange (H3/lower-shriek-base-change; Scholze ECD Proposition 22.8):
--   not stated here; needs `AdicSpace.lowerShriek` and fibre products of adic spaces (supplier:
--   H3/proper-support-direct-image, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle (lemma) -/

-- AdicSpace.lowerShriek_openClosed_triangle (H3/lower-shriek-open-closed-triangle; Berkovich
--   1993 Proposition 5.2.6(ii)): not stated here; needs `AdicSpace.lowerShriek`, the pseudo-adic
--   closed complement and the triangulated structure of `D⁺(X_ét, Λ)` (supplier:
--   H3/proper-support-direct-image, ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site)

/-! ## ClassicalAdicEtaleCohomology:H3/smooth-adic-curve (definition) -/

-- AdicSpace.IsSmoothCurve: not stated here; needs smooth and separated morphisms of adic spaces
--   and relative pure dimension (supplier: AdicSpacesPartII:R0/smooth-morphism,
--   AdicSpacesPartII:R0/separated-morphism, AdicEtaleGeometry:A2/dimension-of-adic-spaces). Its
--   tautness clause is `AdicSpace.IsTautMap` of the underlying map.
-- AdicSpace.IsSmoothCurve.isCompactifiable: not stated here; needs `AdicSpace.IsCompactifiable`
--   (supplier: H3/compactifiable-morphism, AdicSpaces Layer 5)
-- AdicSpace.IsSmoothCurve.of_etale: not stated here; needs étale morphisms of adic spaces
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.IsSmoothCurve.restrict: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsSmoothCurve.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsSmoothCurve.relBall: not stated here; needs the relative closed ball as an adic
--   space over `S` (supplier: AdicEtaleGeometry:A2/relative-closed-polydisc)
-- AdicSpace.IsSmoothCurve.projectiveLine: not stated here; needs `P¹_S` as an adic space
--   (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification)
-- AdicSpace.IsSmoothCurve.genericFibre: not stated here; needs open subspaces and fibre products
--   of adic spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsSmoothCurve.relDim_eq_one: not stated here; needs the sheaf of relative
--   differentials `Ω_{X/S}` (supplier: AdicSpacesPartII:R0/smooth-differentials-locally-free)

-- isSmoothCurve_relBall: not stated here; needs `Ω_{B_S/S}` (supplier:
--   AdicSpacesPartII:R0/smooth-differentials-locally-free) [computation test]
-- isSmoothCurve_projectiveLine: not stated here; needs `P¹_S` and proper morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification)
--   [compatibility test]
-- not_isSmoothCurve_compactification: not stated here; needs the universal compactification as
--   an adic space (supplier: AdicSpaces Layer 5) [non-example test]
-- not_isSmoothCurve_etale: not stated here; needs étale and smooth morphisms of adic spaces
--   (supplier: AdicEtaleGeometry:A1/etale-site, AdicSpacesPartII:R0/smooth-morphism)
--   [degenerate test]
-- isSmoothCurve_genericFibre: not stated here; needs the generic fibre as an open subspace
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence) [characterisation test]

/-! ## ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support (theorem) -/

-- AdicSpace.relBall_lowerShriek_mu (H3/relative-ball-compact-support; Scholze ECD proof of
--   Theorem 24.1, Huber 1996 Theorem 7.2.2): not stated here; needs `AdicSpace.lowerShriek`, the
--   relative ball and `μ_n` (supplier: H3/proper-support-direct-image,
--   AdicEtaleGeometry:A2/relative-closed-polydisc, ClassicalAdicEtaleCohomology:H0/tate-twists,
--   EtaleDualityAndPerverseSheaves:EDC.2:trace-purity)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension (theorem) -/

-- AdicSpace.lowerShriek_vanishing (H3/lower-shriek-cohomological-dimension; Huber 1996
--   Proposition 5.5.8, Berkovich 1993 Corollary 5.3.8): not stated here; needs
--   `AdicSpace.lowerShriek` and relative dimension of morphisms of adic spaces (supplier:
--   H3/proper-support-direct-image, AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums (lemma) -/

-- AdicSpace.lowerShriekUnbounded_preservesCoproducts (H3/lower-shriek-direct-sums; Zavyalov
--   Lemma 9.1(2)): not stated here; needs `AdicSpace.lowerShriekUnbounded` (supplier:
--   H3/proper-support-direct-image, EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements)

/-! ## ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula (lemma) -/

-- AdicSpace.lowerShriekProjection (H3/lower-shriek-projection-formula; Zavyalov Proposition
--   9.3(2), Berkovich 1993 Theorem 5.3.9, Scholze ECD Proposition 22.23): not stated here; needs
--   `AdicSpace.lowerShriekUnbounded` and the derived tensor product of étale sheaves (supplier:
--   H3/proper-support-direct-image, EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements)

/-! ## ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace (construction) -/

namespace AdicSpace

-- AdicSpace.quasiFiniteTrace: not stated here; needs flat, separated, locally quasi-finite
--   morphisms of adic spaces and the étale `φ_!`, `φ^*` (supplier:
--   AdicSpacesPartII:R0/flat-morphism, AdicSpacesPartII:R0/quasi-finite-morphism,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
-- AdicSpace.quasiFiniteTrace_naturality: not stated here; needs `AdicSpace.quasiFiniteTrace`
--   (supplier: ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)
-- AdicSpace.quasiFiniteTrace_baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.quasiFiniteTrace_comp: not stated here; needs `AdicSpace.quasiFiniteTrace`
--   (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
-- AdicSpace.quasiFiniteTrace_unit_eq_mul: not stated here; needs finite locally free morphisms
--   of adic spaces (supplier: AdicSpacesPartII:R3/finite-locally-free-morphism); the multiplicity
--   identity at geometric points is `AdicSpace.quasiFiniteTrace_stalk_ring`
-- AdicSpace.quasiFiniteTrace_etale: not stated here; needs the adjunction `φ_! ⊣ φ^*` (supplier:
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
-- AdicSpace.quasiFiniteTrace_stalk: not stated here; needs geometric points of rank one and
--   stalks of étale sheaves (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points).
--   Its ring-level core is `AdicSpace.quasiFiniteTrace_stalk_ring`.
-- AdicSpace.quasiFiniteTrace_unique: not stated here; needs `AdicSpace.quasiFiniteTrace`
--   (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
-- AdicSpace.quasiFiniteTrace_compactCohomology: not stated here; needs compactly supported
--   cohomology (supplier: H3/proper-support-direct-image)

/-- H3/flat-quasi-finite-trace (ring-level core of `AdicSpace.quasiFiniteTrace_stalk`; Berkovich
1993 Theorem 5.4.1): at a geometric point `Spa(K, K°)` of rank one (`K` algebraically closed) the
fibre of `φ` is `Spa` of a finite `K`-algebra `B`, the product of the local Artinian rings
`B_m`, and the weights `length(B_m)` of the stalk formula `Tr((a_m)) = Σ length(B_m) a_m` add up
to `[B : K]`; this is clause (d) at geometric points. -/
theorem quasiFiniteTrace_stalk_ring (K : Type*) [Field K] [IsAlgClosed K] (B : Type*)
    [CommRing B] [Algebra K B] [Module.Finite K B] :
    (Module.finrank K B : ℕ∞) = ∑ᶠ m : MaximalSpectrum B,
      Module.length (Localization.AtPrime m.asIdeal) (Localization.AtPrime m.asIdeal) := sorry

-- quasiFiniteTrace_etale: not stated here; needs étale morphisms of adic spaces and the counit
--   of `φ_! ⊣ φ^*` (supplier: ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)
--   [degenerate test]

/- Ring-level core: for a finite `K`-algebra of degree `d` over an algebraically closed `K`, the
multiplicities of the stalk formula add up to `d`, so `Tr ∘ unit` is multiplication by `d`. -/
-- test quasiFiniteTrace_degree (computation) [H3/flat-quasi-finite-trace]
example (K : Type*) [Field K] [IsAlgClosed K] (B : Type*) [CommRing B] [Algebra K B]
    [Module.Finite K B] (d : ℕ) (hd : Module.finrank K B = d) :
    ∑ᶠ m : MaximalSpectrum B,
      Module.length (Localization.AtPrime m.asIdeal) (Localization.AtPrime m.asIdeal) = d :=
  sorry

/- Ring-level core: over `T ↦ T²` the fibre of the origin is `Spa(K[T]/(T²))`, a single point of
length `2`, so the stalk of the trace at `0` is multiplication by `2`, not by the number of
geometric points of the fibre. -/
-- test quasiFiniteTrace_ramified (non-example) [H3/flat-quasi-finite-trace]
example (K : Type*) [Field K] [IsAlgClosed K] :
    Subsingleton (MaximalSpectrum (AdjoinRoot (Polynomial.X ^ 2 : Polynomial K))) ∧
      Module.length (AdjoinRoot (Polynomial.X ^ 2 : Polynomial K))
        (AdjoinRoot (Polynomial.X ^ 2 : Polynomial K)) = 2 := sorry

-- quasiFiniteTrace_comp: not stated here; needs `AdicSpace.quasiFiniteTrace` (supplier:
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero) [characterisation test]
-- quasiFiniteTrace_baseChange: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence) [compatibility test]

end AdicSpace

/-! ## ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (comparison) -/

-- AdicSpace.berkovichEquiv (H3/berkovich-taut-comparison; Scholze 2012 Theorem 2.24, Huber 1996
--   Proposition 8.3.1): not stated here; needs Berkovich spaces and taut adic spaces locally of
--   finite type over `Spa(k, k°)` (supplier: TropicalAndBerkovichArithmetic:TB.0, AdicSpaces
--   Layer 5). The tautness condition is `AdicSpace.IsTaut` of the underlying space.

/-! ## ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula (lemma) -/

-- AdicSpace.residue_kummer_eq_neg_deg (H3/local-residue-degree-formula; Berkovich 1993 Lemmas
--   6.2.2–6.2.5): not stated here; needs circles and discs in `P¹_C` as adic spaces, the Kummer
--   map and the recollement triangle on étale sites (supplier: AdicSpaces Layer 5,
--   ClassicalAdicEtaleCohomology:H0/kummer-sequence, H3/pseudo-adic-support-space)

/-! ## ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison (comparison) -/

-- AdicSpace.algebraicCurveCompactSupportIso (H3/algebraic-curve-comparison; Berkovich 1993
--   Theorem 7.1.1, Huber 1996 Theorem 3.7.2): not stated here; needs the analytification
--   `W ×_{Spec C} S`, compactly supported étale cohomology of schemes and
--   `AdicSpace.lowerShriek` (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification,
--   UPSTREAM:ECD:SCH_SUPPORT_NOETH, H3/proper-support-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-trace (construction) -/

-- AdicSpace.curveTrace: not stated here; needs smooth adic curves, `R²f_!μ_n` and constant étale
--   sheaves on `Spa(C, C⁺)` (supplier: H3/smooth-adic-curve, H3/proper-support-direct-image,
--   ClassicalAdicEtaleCohomology:H0/tate-twists)
-- AdicSpace.curveTrace': not stated here; needs `AdicSpace.lowerShriekUnbounded` and Tate twists
--   (supplier: H3/proper-support-direct-image, ClassicalAdicEtaleCohomology:H0/tate-twists)
-- AdicSpace.curveTrace_comp_quasiFiniteTrace: not stated here; needs `AdicSpace.curveTrace` and
--   `AdicSpace.quasiFiniteTrace` (supplier: H3/flat-quasi-finite-trace)
-- AdicSpace.curveTrace_projectiveLine: not stated here; needs `P¹_S` and the degree on
--   `H²(P¹, μ_n)` (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification,
--   H3/algebraic-curve-comparison)
-- AdicSpace.curveTrace_generic: not stated here; needs the generic fibre over
--   `Spa(C, O_C)` (supplier: H3/smooth-adic-curve)
-- AdicSpace.curveTrace_surjective: not stated here; needs `AdicSpace.curveTrace` (supplier:
--   H3/smooth-adic-curve)
-- AdicSpace.curveTrace_unique: not stated here; needs families of traces over all smooth adic
--   curves (supplier: H3/smooth-adic-curve)
-- AdicSpace.curveTrace_baseChange: not stated here; needs base change of `R²f_!` (supplier:
--   H3/lower-shriek-base-change)
-- AdicSpace.curveTrace_isIso: not stated here; needs connected adic spaces and constancy of
--   `R²f_!μ_n` (supplier: H3/curve-trace-iso-connected)

-- curveTrace_relBall: not stated here; needs the relative ball and `AdicSpace.curveTrace`
--   (supplier: AdicEtaleGeometry:A2/relative-closed-polydisc) [computation test]
-- curveTrace_projectiveLine: not stated here; needs the first Chern class of `O(1)` on `P¹_S`
--   (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification)
--   [characterisation test]
-- curveTrace_kummerCover: not stated here; needs the Kummer covering of the unit circle as a
--   finite étale morphism of adic spaces (supplier: AdicEtaleGeometry:A1/etale-site)
--   [compatibility test]
-- curveTrace_empty: not stated here; needs the empty adic space over `S` (supplier: AdicSpaces
--   Layer 5) [degenerate test]
-- curveTrace_generic: not stated here; needs the generic fibre over `Spa(C, O_C)` (supplier:
--   H3/smooth-adic-curve) [characterisation test]
-- curveTrace_not_pTorsion: not stated here; needs `H²_c` of the open unit disc with `μ_p`
--   coefficients (supplier: H3/proper-support-direct-image) [non-example test]

/-! ## ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility (lemma) -/

-- AdicSpace.curveTrace_finiteEtale, AdicSpace.curveTrace_restrict
--   (H3/curve-trace-flat-quasi-finite-compatibility; Berkovich 1993 Theorems 6.2.1(a) and
--   5.4.1(d)): not stated here; need `AdicSpace.curveTrace` and finite étale morphisms of adic
--   spaces (supplier: H3/curve-trace, AdicEtaleGeometry:A1/etale-site)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-trace-base-change (lemma) -/

-- AdicSpace.curveTrace_baseChange' (H3/curve-trace-base-change; Berkovich 1993 Theorem 6.2.1,
--   Scholze ECD proof of Theorem 24.1): not stated here; needs `AdicSpace.curveTrace` and the
--   base change isomorphism for `R²f_!` (supplier: H3/curve-trace, H3/lower-shriek-base-change)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected (lemma) -/

-- AdicSpace.curveTrace_isIso_of_connected (H3/curve-trace-iso-connected; Berkovich 1993 Theorem
--   6.2.1): not stated here; needs `AdicSpace.curveTrace` and connected adic spaces (supplier:
--   H3/curve-trace, AdicSpaces Layer 5)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison (lemma) -/

-- AdicSpace.curveTrace_algebraic (H3/curve-trace-algebraic-comparison; Berkovich 1993 Corollary
--   6.2.9): not stated here; needs `AdicSpace.curveTrace` and the scheme trace of smooth curves
--   (supplier: H3/curve-trace, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity)

/-! ## ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit (lemma) -/

-- AdicSpace.unit_isIso_of_connectedFibres (H3/smooth-curve-connected-fibres-unit; Berkovich
--   1993 Proposition 7.3.2): not stated here; needs smooth morphisms of adic spaces, geometric
--   fibres and the unit `F → f_*f^*F` of étale sheaves (supplier:
--   AdicSpacesPartII:R0/smooth-morphism, ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma (lemma) -/

-- AdicSpace.curve_effacement (H3/curve-fundamental-lemma; Berkovich 1993 Fundamental Lemma
--   7.3.4): not stated here; needs smooth adic curves over `Spa(C, O_C)`, separated étale
--   morphisms and `R¹f_!μ_n` (supplier: H3/smooth-adic-curve, H3/proper-support-direct-image)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-poincare-duality (theorem) -/

-- AdicSpace.dualityMorphism, AdicSpace.dualityMorphism_isIso (H3/curve-poincare-duality;
--   Berkovich 1993 Theorem 7.3.1, Huber 1996 Theorem 7.5.3): not stated here; need `RHom` in
--   `D(S_ét, ℤ/n)`, `Rf_*`, `Rf_!` and the curve trace (supplier: H3/curve-trace,
--   ClassicalAdicEtaleCohomology:H0/derived-direct-image,
--   EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements)

/-! ## ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility (lemma) -/

-- AdicSpace.curveTrace_extendByZero (H3/duality-open-extension-compatibility; Scholze ECD
--   Proposition 23.10(iii)): not stated here; needs quasi-compact opens of `Spa(C, C⁺)`,
--   extension by zero and the curve trace (supplier: H3/curve-trace,
--   ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness (lemma) -/

-- AdicSpace.curve_cohomology_finite (H3/curve-cohomology-finiteness; Berkovich 1993 Theorem
--   6.4.1 and Corollary 7.4.4, Zavyalov Lemma 10.3): not stated here; needs étale cohomology of
--   smooth adic curves with locally constant constructible coefficients (supplier:
--   H3/smooth-adic-curve, ClassicalAdicEtaleCohomology:H0/torsion-local-systems)

/-! ## ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing (theorem) -/

-- AdicSpace.curve_pairing_perfect (H3/curve-duality-perfect-pairing; Berkovich 1993 Theorem
--   7.4.3): not stated here; needs the cup-product pairing on étale cohomology of adic spaces and
--   the curve trace (supplier: H3/curve-trace, H3/curve-poincare-duality,
--   EtaleDualityAndPerverseSheaves:EDC.2:pairings)

end TauCeti

end
