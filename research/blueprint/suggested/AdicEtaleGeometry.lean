/-
Suggested Lean forms for BP-AdicEtaleGeometry (roadmap `AdicEtaleGeometry`, "Analytic adic
geometry required for diamonds", stages A0–A4). This file is not the roadmap and is not
exhaustive: the roadmap document is definitive. See the module documentation after the imports.
-/
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.Algebra.Colimit.Ring
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.Analysis.Normed.Ring.Lemmas
import Mathlib.CategoryTheory.Action.Continuous
import Mathlib.CategoryTheory.Comma.StructuredArrow.Basic
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.CategoryTheory.Limits.Preserves.Finite
import Mathlib.CategoryTheory.MorphismProperty.Limits
import Mathlib.CategoryTheory.MorphismProperty.TransfiniteComposition
import Mathlib.CategoryTheory.Sites.Coverage
import Mathlib.CategoryTheory.Sites.LeftExact
import Mathlib.CategoryTheory.Sites.Limits
import Mathlib.CategoryTheory.Sites.Point.Conservative
import Mathlib.CategoryTheory.Sites.Pretopology
import Mathlib.CategoryTheory.Sites.Sheafification
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.Perfect
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Order.KrullDimension
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.Invariant.Defs
import Mathlib.RingTheory.IsGaloisGroup.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.MvPowerSeries.Derivative
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Spectrum.Maximal.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.TensorProduct.Finite
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.TotallySplit
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.Topology.Algebra.ProperAction.Basic
import Mathlib.Topology.Algebra.Ring.Ideal
import Mathlib.Topology.Algebra.UniformRing
import Mathlib.Topology.Category.FinTopCat
import Mathlib.Topology.Category.Profinite.Basic
import Mathlib.Topology.Category.Profinite.Limits
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Sober
import Mathlib.Topology.Specialization
import Mathlib.Topology.Spectral.Hom
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Plus
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.Restricted.PowerSeries
import TauCeti.RingTheory.Huber.StronglyNoetherian
import TauCeti.RingTheory.Huber.TopologicallyFiniteType
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Iterate
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.PairOfDefinition

/-!
# Suggested Lean forms for AdicEtaleGeometry

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`AdicEtaleGeometry` ("Analytic adic geometry required for diamonds", stages A0–A4) is definitive.
The statements below suggest Lean forms, so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; a data definition either has a body built from library material
or is `sorry`, and a `Prop`-valued definition always has a real body. Nothing here claims to be
formalised, and every node keeps `implementationStatus = "unchecked"`.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The file elaborates with `lake env lean` against a
project at exactly these commits, and its only warnings are `declaration uses 'sorry'`.

## Layout

A section of stand-ins comes first (see below). Then one section per stage (`# Stage …`) in the
order A0, A1 (in two parts), A2, A3, A4, and inside a stage one subsection per packet node, in
packet order, headed `AdicEtaleGeometry:<node id> (<kind>)`. Every declaration's docstring names
its node. A unit test is an `example` preceded by the line `-- test <name> (<kind>) [<node id>]`.
Definitions, constructions and their API items carry the packet's names; theorems and lemmas of
the stages are stated under the names the stage proposals suggest. A few declarations that are not
packet names support the statements; their docstrings say which node they serve.

## Conventions

* **Names.** Every declaration lives in the namespace `TauCeti`: the packet name `N` is the Lean
  name `TauCeti.N` (`Huber.Pair.finiteEtale` is `TauCeti.Huber.Pair.finiteEtale`,
  `Module.IsPseudoCoherent` is `TauCeti.Module.IsPseudoCoherent`). Ring-level objects are in
  `TauCeti.Huber`, adic-space geometry in `TauCeti.AdicSpace` (all of it a comment, see below).
* **Huber rings and pairs** are Tau Ceti's: a Huber ring is
  `[CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]`; a Huber pair is
  `TauCeti.Huber.Pair A`, whose only datum is the ring of integral elements `S.plus`; a morphism
  of Huber pairs is `Pair.Hom S T`. Adic spectra, rational subsets and analytic loci are Tau Ceti's
  `ValuationSpectrum.spa`, `rationalSubset`, `spaAnalytic` and `Pair.Hom.spaComap`, and rational
  localisations `A⟨T/s⟩` are Tau Ceti's completions of `Localization.Away s` for
  `PairOfDefinition.locUniformSpace`.
* **Completeness.** A complete Huber ring carries Mathlib's uniform structure:
  `[UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A]
  [T2Space A]` ("complete" always includes Hausdorff, as in Huber). A complete Tate ring has
  `[IsTateRing A]` in place of `[IsHuberRing A]`.
* **Finite algebras** carry their natural topology in Mathlib's mixin form
  `[TopologicalSpace B] [IsModuleTopology A B]`; finite étale means Mathlib's
  `[Module.Finite A B] [Algebra.Etale A B]`.
* **Tate algebras** `A⟨X₁,…,X_k⟩` are Tau Ceti's `restrictedMvPowerSeriesCompletion k A`.
* **Rational localisations.** `A⟨T/s⟩` is Tau Ceti's completion of `Localization.Away s` for
  `PairOfDefinition.locUniformSpace`, packaged for A3 as the supporting definition
  `Huber.ratLoc P T s hden`; in the category `CAff` of complete Hausdorff Huber pairs (A1) a
  rational localisation is characterised by its universal property (`CAff.IsRationalLocalization`).
* **Nonarchimedean fields** are `[NontriviallyNormedField K] [IsUltrametricDist K]
  [CompleteSpace K]`; where a statement needs Tau Ceti's Huber API it also assumes
  `[IsTateRing K]` (the pinned Tau Ceti has this instance only for `ℚ_p`).
* **Sites and topoi** are Mathlib's: `GrothendieckTopology`, `Sheaf`, points and
  `HasEnoughPoints`; profinite `G`-sets are `ContAction Profinite G`; the rational site is
  `CAffᵒᵖ` with the topology generated by rational coverings, and Yoneda-adic spaces are a full
  subcategory of its sheaves of sets.
* **Finite étale torsors and split rings** (A4) are stated against Mathlib's `Algebra.Etale`,
  `Module.FaithfullyFlat`, `MulSemiringAction` and `Algebra.IsFiniteSplit`.
* **Dimension** of adic spaces is measured on underlying spaces by Mathlib's
  `topologicalKrullDim`.

## Stand-ins

The first section restates, in the shape of the suggested files of the owning roadmaps, the
carriers from other roadmaps that the statements need and that neither pinned library has:
AdicSpacesPartII R0's adic ring homomorphisms `Huber.IsAdicHom`, completed tensor products
`Huber.CompletedTensor` and `Huber.Pair.completedTensor`, the spectral topology and uniformisation
`Huber.SpectralTop`, `Huber.Uniformization`, `Huber.Pair.uniformization`, the uniform completed
tensor product `Huber.Pair.uniformCompletedTensor` and finite morphisms of Huber pairs
`Huber.Pair.Hom.IsFinite`; AdicSpacesPartII R5's sousperfectoid rings `Huber.PerfectoidFrame`,
`Huber.IsSousperfectoid`; and, as in the suggested files for PerfectoidSpaces P8 and
AdicSpacesPartII, `Perfectoid.IsPerfectoidTateRing`, a `structure` with real fields standing for
PerfectoidSpaces P1's definition of a perfectoid Tate ring. They are replaced by imports once
their owners land.

## What is not stated

The anchor's category of adic spaces (Tau Ceti roadmap AdicSpaces, Layer 5) and its sheaf theory
(the structure presheaf and the sheafiness of Huber pairs, Layers 3–4) are not in Tau Ceti at the
pin, and neither library has fibre products of adic spaces (AdicSpacesPartII R0), perfectoid
spaces (PerfectoidSpaces P2), diamonds or v-sheaves (DiamondsAndVStacks) or sheaves of modules
on any of these. Every packet item that needs one of these carriers — in particular every
`AdicSpace.*` item of this roadmap (the étale, finite étale and pro-étale sites of adic spaces,
geometric points, strict localisations, relative polydiscs and tori, smooth morphisms, dimension,
pseudocoherent sheaves), strong sheafiness `Huber.IsStronglySheafy`, and every statement whose
hypotheses include sheafiness of a Huber pair — is a comment of the form

`-- <name>: not stated here; needs <missing carrier> (supplier: <stage or node id>)`

placed under its node's header, so that every packet name still appears; a unit test in this form
ends with `[<kind> test]`. The supplier is the node of this roadmap that builds the carrier, or the
stage of another roadmap that does ("AdicSpaces Layer 5" is Tau Ceti's
`AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`, similarly for Layers 3–4). No stand-in is
introduced for any geometric category or for sheafiness. Where such a node has a ring-level,
affinoid or topological core that the pinned libraries can state, the core is stated under the
packet name with a suffix (`…_affinoid`, `…_ring`, `…_core`) and the comment says so; statements
of A3 whose source needs a sheafy base are stated over sousperfectoid bases (which are sheafy)
under names ending in `_sousperfectoid`. The A3 items `Module.IsPseudoCoherent.tensorProduct` and
`Module.IsPseudoCoherent.baseChange_of_isPseudoCoherent_algebra` concern the underived tensor
product and carry the flatness and finiteness hypotheses it needs; their docstrings give the
counterexamples without them.
-/

set_option autoImplicit false

/-! # Stand-ins from other roadmaps

The declarations of this section are not packet items of AdicEtaleGeometry. They restate, in
the shape of the suggested files of their own roadmaps, the few carriers from AdicSpacesPartII R0
and R5 and from PerfectoidSpaces P1 that the statements below need and that neither pinned
library has. Each docstring names the node that owns the declaration; the owning roadmap is
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

/-! ## Stand-in: perfectoid Tate rings (PerfectoidSpaces P1) -/

namespace Perfectoid

open Huber

/-- **Stand-in for PerfectoidSpaces P1's perfectoid Tate ring** (the stand-in of the suggested
files for PerfectoidSpaces P8 and AdicSpacesPartII, with the same fields). A topological ring `A`
is a perfectoid Tate ring for the prime `p` if it is complete and Hausdorff, Tate, uniform (`A°`
bounded), has a pseudouniformizer `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`, and Frobenius is surjective
on `A° / p`. Completeness is for the canonical uniformity of the additive group. -/
structure IsPerfectoidTateRing (p : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] : Prop where
  /-- `A` is complete for its canonical uniformity. -/
  completeSpace : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)
  /-- `A` is Hausdorff. -/
  t2Space : T2Space A
  /-- `A` is a Tate ring. -/
  isTateRing : IsTateRing A
  /-- `A` is uniform: the power-bounded subring `A°` is bounded. -/
  isBounded_powerBoundedSubring :
    haveI := isTateRing
    IsBounded (powerBoundedSubring A : Set A)
  /-- There is a pseudouniformizer `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`. -/
  exists_isPseudoUniformizer_pow_dvd :
    haveI := isTateRing
    ∃ ϖ : powerBoundedSubring A, IsPseudoUniformizer (ϖ : A) ∧ ϖ ^ p ∣ (p : powerBoundedSubring A)
  /-- Frobenius `x ↦ x ^ p` is surjective on `A° / p`. -/
  surjective_frobenius :
    haveI := isTateRing
    Function.Surjective fun x : powerBoundedSubring A ⧸ Ideal.span {(p : powerBoundedSubring A)} ↦
      x ^ p

end Perfectoid

/-! ## Stand-in: sousperfectoid rings (AdicSpacesPartII:R5/sousperfectoid-ring) -/

namespace Huber

open Perfectoid

universe u

variable (p : ℕ) (R : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Stand-in (AdicSpacesPartII:R5/sousperfectoid-ring): a *perfectoid frame* `(R̃, ι, σ)` for `R`
(Hansen–Kedlaya Definition 7.1): a perfectoid Tate ring `R̃`, a continuous ring homomorphism
`ι : R → R̃` and a continuous `R`-linear retraction `σ : R̃ → R` of `ι`. -/
structure PerfectoidFrame where
  /-- The perfectoid Tate ring `R̃`. -/
  Rt : Type u
  /-- The ring structure of `R̃`. -/
  [commRing : CommRing Rt]
  /-- The topology of `R̃`. -/
  [topologicalSpace : TopologicalSpace Rt]
  /-- `R̃` is a topological ring. -/
  [isTopologicalRing : IsTopologicalRing Rt]
  /-- `R̃` is a perfectoid Tate ring. -/
  isPerfectoidTateRing : IsPerfectoidTateRing p Rt
  /-- The embedding `ι : R → R̃`. -/
  ι : R →+* Rt
  /-- `ι` is continuous. -/
  continuous_ι : Continuous ι
  /-- The retraction `σ : R̃ → R`, as an additive map. -/
  σ : Rt →+ R
  /-- `σ` is continuous. -/
  continuous_σ : Continuous σ
  /-- `σ` is `R`-linear for the module structure of `R̃` through `ι`. -/
  σ_mul : ∀ (r : R) (x : Rt), σ (ι r * x) = r * σ x
  /-- `σ ∘ ι = id`. -/
  σ_ι : ∀ r : R, σ (ι r) = r

attribute [instance] PerfectoidFrame.commRing PerfectoidFrame.topologicalSpace
  PerfectoidFrame.isTopologicalRing

/-- **Stand-in for AdicSpacesPartII:R5/sousperfectoid-ring.** `R` is *sousperfectoid* (for the
prime `p`) if it is a Tate ring admitting a perfectoid frame. -/
class IsSousperfectoid : Prop where
  /-- `R` is a Tate ring. -/
  isTateRing : IsTateRing R
  /-- `R` admits a perfectoid frame. -/
  nonempty_perfectoidFrame : Nonempty (PerfectoidFrame p R)

end Huber

end TauCeti

end

/-! # Stage A0. Supplier contract for completed tensor products and analytic pullbacks -/

noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter ValuationSpectrum

namespace Huber

/-! ## AdicEtaleGeometry:A0/supplier-contract-fibre-products (comparison) -/

section Pushout

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C]
  [CompleteSpace C] [T2Space C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
  (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- A0/supplier-contract-fibre-products (the structure map `f`): the morphism of Huber pairs
`(A, A⁺) → (B, B⁺)` whose ring homomorphism is the adic `algebraMap A B`. Supporting declaration of
the contract. -/
def Pair.completedTensor.structureHomLeft : Pair.Hom S T :=
  ⟨algebraMap A B, IsAdicHom.continuous (algebraMap A B), hT⟩

/-- A0/supplier-contract-fibre-products (the structure map `g`): the morphism of Huber pairs
`(A, A⁺) → (C, C⁺)` whose ring homomorphism is the adic `algebraMap A C`. Supporting
declaration of the contract. -/
def Pair.completedTensor.structureHomRight : Pair.Hom S U :=
  ⟨algebraMap A C, IsAdicHom.continuous (algebraMap A C), hU⟩

/-- A0/supplier-contract-fibre-products, clause (iii) (Huber 1996 Proposition 1.2.2; Huber 1994,
proof of Lemma 3.9(i); Kedlaya–Liu I §2.4 before Definition 2.4.3): the completed tensor product
`D = B ⊗̂_A C` of AdicSpacesPartII:R0/completed-tensor-product, with `inl` and `inr`, is a pushout
of `f` and `g` among complete Hausdorff Huber pairs: for every complete Hausdorff Huber pair
`(R, R⁺)` and morphisms `φ : (B, B⁺) → (R, R⁺)`, `ψ : (C, C⁺) → (R, R⁺)` with `φ ∘ f = ψ ∘ g`
(neither needs to be adic) there is exactly one `χ : D → (R, R⁺)` with `χ ∘ inl = φ` and
`χ ∘ inr = ψ`. Mathlib's `CategoryTheory.IsPushout` form needs the category of complete Hausdorff
Huber pairs, which neither library has; this is its elementwise content. -/
theorem Pair.completedTensor.isPushout {R : Type*} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsHuberRing R] [CompleteSpace R] [T2Space R]
    (V : Pair R) (φ : Pair.Hom T V) (ψ : Pair.Hom U V)
    (h : φ.comp (Pair.completedTensor.structureHomLeft S T hT) =
      ψ.comp (Pair.completedTensor.structureHomRight S U hU)) :
    ∃! χ : Pair.Hom (Pair.completedTensor S T U hT hU) V,
      χ.comp (Pair.completedTensor.inl S T U hT hU) = φ ∧
        χ.comp (Pair.completedTensor.inr S T U hT hU) = ψ := sorry

/-- A0/supplier-contract-fibre-products, clause (i): the square commutes, `inl ∘ f = inr ∘ g`. -/
theorem Pair.completedTensor.inl_comp_structureHomLeft :
    (Pair.completedTensor.inl S T U hT hU).comp (Pair.completedTensor.structureHomLeft S T hT) =
      (Pair.completedTensor.inr S T U hT hU).comp
        (Pair.completedTensor.structureHomRight S U hU) := sorry

/-- A0/supplier-contract-fibre-products, clause (i): `B ⊗[A] C → B ⊗̂_A C` has dense image, so
`D` is the Hausdorff completion of `B ⊗[A] C` for the tensor topology `{Iⁿ·F}`. -/
theorem Pair.completedTensor.denseRange_tmul_contract :
    DenseRange (Pair.completedTensor.tmul A B C) := sorry

/-- A0/supplier-contract-fibre-products, clause (ii) (Kedlaya–Liu I §2.4 before Definition 2.4.3;
Scholze 2012, proof of Proposition 6.18): the plus ring `D⁺` is also the closure in `D` of the
integral closure, taken in `D`, of the subring `R` generated by `inl(B⁺) ∪ inr(C⁺)` (the elements
integral over `R`). -/
theorem Pair.completedTensor.plus_eq_closure_integralClosure :
    let R : Subring (CompletedTensor A B C) :=
      T.plus.map (Pair.completedTensor.inl S T U hT hU).toRingHom ⊔
        U.plus.map (Pair.completedTensor.inr S T U hT hU).toRingHom
    ((Pair.completedTensor S T U hT hU).plus : Set (CompletedTensor A B C)) =
      closure {x : CompletedTensor A B C | R.subtype.IsIntegralElem x} := sorry

end Pushout

-- Huber.Pair.completedTensor.isPushout, clause (iv) (Spa D is the fibre product
--   Spa B ×_{Spa A} Spa C for sheafy pairs): not stated here; needs the anchor's category of
--   adic spaces and sheafiness of Huber pairs (supplier:
--   AdicSpacesPartII:R0/affinoid-fibre-product, AdicSpaces Layer 5). Its topological core,
--   `Spa(inl)` and `Spa(inr)`, is Tau Ceti's `Huber.Pair.Hom.spaComap`.

/-! ## AdicEtaleGeometry:A0/uniformization-contract (comparison) -/

section UniformPushout

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C]
  [CompleteSpace C] [T2Space C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
  (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- A0/uniformization-contract (Kedlaya–Liu I Definition 2.8.13 and Remark 2.8.5): over a Tate
base, the uniform completed tensor product `B ⊗̂ᵘ_A C = (B ⊗̂_A C)ᵘ` of
AdicSpacesPartII:R0/uniform-completed-tensor-product, with `inlᵘ = ι ∘ inl` and `inrᵘ = ι ∘ inr`,
is a pushout of `f` and `g` among complete Hausdorff Huber pairs `(R, R⁺)` with `R` a uniform Tate
ring (`R°` bounded). The rest of the contract (`ι` is the unit of the uniformisation adjunction,
`Spa(ι)` is a homeomorphism identifying rational subsets, `ι` is an isomorphism exactly when
`B ⊗̂_A C` is uniform) is AdicSpacesPartII:R0/uniformization and
AdicSpacesPartII:R0/uniform-completed-tensor-product, on the same carriers. -/
theorem Pair.uniformCompletedTensor.isPushout {R : Type*} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    (hR : IsBounded (powerBoundedSubring R : Set R)) (V : Pair R) (φ : Pair.Hom T V)
    (ψ : Pair.Hom U V)
    (h : φ.comp (Pair.completedTensor.structureHomLeft S T hT) =
      ψ.comp (Pair.completedTensor.structureHomRight S U hU)) :
    ∃! χ : Pair.Hom (Pair.uniformCompletedTensor S T U hT hU) V,
      χ.comp (Pair.uniformCompletedTensor.inl S T U hT hU) = φ ∧
        χ.comp (Pair.uniformCompletedTensor.inr S T U hT hU) = ψ := sorry

/-- A0/uniformization-contract: `B ⊗̂ᵘ_A C` lies in the subcategory, that is, its ring is uniform
(the ring is complete and Hausdorff as a Mathlib `Completion`). -/
theorem Pair.uniformCompletedTensor.isBounded_contract :
    IsBounded (powerBoundedSubring (Uniformization (CompletedTensor A B C)) :
      Set (Uniformization (CompletedTensor A B C))) := sorry

end UniformPushout

/- `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is a complete separated tensor product that is not uniform, so the completed
tensor product of A0/supplier-contract-fibre-products is not uniformised in general. -/
-- Huber.Pair.completedTensor.not_isBounded_padicComplex: not stated here; needs `ℂ_p` as a Huber
--   ring with an adic structure map from `ℚ_p` (Mathlib's `PadicComplex` carries a norm, not
--   Tau Ceti's `IsHuberRing` instance; supplier:
--   AdicSpacesPartII:R0/uniform-completed-tensor-product)

/-! ## AdicEtaleGeometry:A0/definition-data-and-plus-ring-tracking (lemma) -/

section PlusTracking

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C]
  [CompleteSpace C] [T2Space C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
  (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- A0/definition-data-and-plus-ring-tracking (a) (Huber 1994, proof of Lemma 3.9(i)): a
pseudouniformiser of `B` maps to a pseudouniformiser of `D = B ⊗̂_A C` (similarly for `A` and
`C`); `D` and `inl`, `inr` depend only on the topological rings and the ring maps. -/
theorem Pair.completedTensor.isPseudoUniformizer_inl {ϖ : B} (hϖ : IsPseudoUniformizer ϖ) :
    IsPseudoUniformizer ((Pair.completedTensor.inl S T U hT hU).toRingHom ϖ) := sorry

/-- A0/definition-data-and-plus-ring-tracking (b): `D⁺` does not depend on `A⁺`: replacing `A⁺`
by another ring of integral elements `A'⁺` with `f(A'⁺) ⊆ B⁺`, `g(A'⁺) ⊆ C⁺` gives the same
plus ring. -/
theorem Pair.completedTensor.plus_eq_of_basePair (S' : Pair A)
    (hT' : ∀ a ∈ S'.plus, algebraMap A B a ∈ T.plus)
    (hU' : ∀ a ∈ S'.plus, algebraMap A C a ∈ U.plus) :
    (Pair.completedTensor S' T U hT' hU').plus = (Pair.completedTensor S T U hT hU).plus := sorry

variable (T' : Pair B) (U' : Pair C) (hTT' : T.plus ≤ T'.plus) (hUU' : U.plus ≤ U'.plus)
  (hT₁ : ∀ a ∈ S.plus, algebraMap A B a ∈ T'.plus) (hU₁ : ∀ a ∈ S.plus, algebraMap A C a ∈ U'.plus)

include hTT' hUU' in
/-- A0/definition-data-and-plus-ring-tracking (c): enlarging `B⁺ ⊆ B'⁺`, `C⁺ ⊆ C'⁺` enlarges
`D⁺ ⊆ D'⁺`, so the identity of `D` is a morphism `(D, D⁺) → (D, D'⁺)`. -/
theorem Pair.completedTensor.plus_mono :
    (Pair.completedTensor S T U hT hU).plus ≤ (Pair.completedTensor S T' U' hT₁ hU₁).plus :=
  sorry

include hTT' hUU' in
/-- A0/definition-data-and-plus-ring-tracking (c) (Hübner 2024, proof of Theorem 9.2): inside
`Spa(D, D⁺)`, `Spa(D, D'⁺) = Spa(inl)⁻¹(Spa(B, B'⁺)) ∩ Spa(inr)⁻¹(Spa(C, C'⁺))`. For sheafy pairs
this is the open subspace `Spa(B, B'⁺) ×_{Spa(A, A⁺)} Spa(C, C'⁺)` (a statement on adic spaces,
AdicSpaces Layer 5). -/
theorem Pair.completedTensor.spa_plus_eq_inter_preimage :
    spa (Pair.completedTensor S T' U' hT₁ hU₁).plus =
      spa (Pair.completedTensor S T U hT hU).plus ∩
        comap (Pair.completedTensor.inl S T U hT hU).toRingHom ⁻¹' spa T'.plus ∩
          comap (Pair.completedTensor.inr S T U hT hU).toRingHom ⁻¹' spa U'.plus := sorry

end PlusTracking

/-! ## AdicEtaleGeometry:A0/rational-pullback-comparison (comparison) -/

-- AdicSpace.isPullback_preimage_opens (clause (a): `g⁻¹(U)` is the fibre product `Y ×_X U` for an
--   open subspace `U`): not stated here; needs the anchor's category of adic spaces and its open
--   subspaces (supplier: AdicSpaces Layer 5)

section RationalPullback

variable {A B : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B] [Algebra A B] [IsAdicHom (algebraMap A B)]

open PairOfDefinition Classical in
/-- A0/rational-pullback-comparison (b) (Wedhorn Lemma 7.46(3); Kedlaya–Liu I after
Definition 2.4.12): for an
adic `φ = algebraMap A B`, `T ⊆ A` finite and `s ∈ A`, the completed tensor product
`B ⊗̂_A A⟨T/s⟩` is `B⟨φ(T)/φ(s)⟩`. The rational localisations are Tau Ceti's completions
`A⟨T/s⟩ = Completion (Localization.Away s)` for `locUniformSpace` (anchor Layer 3.1); the
equivalence is the one induced by `B → B⟨φ(T)/φ(s)⟩` and `A⟨T/s⟩ → B⟨φ(T)/φ(s)⟩`. The preimage
statement `Spa(φ)⁻¹(R(T/s)) = R(φ(T)/φ(s))` is Tau Ceti's
`Pair.Hom.spaComap_preimage_rationalSubset`. -/
def Pair.completedTensor.rationalLocalizationIso (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (T : Finset A) (s : A) (hden : HasDenominatorPower P T s (Localization.Away s))
    (hden' : HasDenominatorPower Q (T.image (algebraMap A B)) (algebraMap A B s)
      (Localization.Away (algebraMap A B s))) :
    letI := locUniformSpace P T s (Localization.Away s) hden
    letI := isUniformAddGroup_locUniformSpace P T s (Localization.Away s) hden
    letI := isTopologicalRing_locUniformSpace P T s (Localization.Away s) hden
    letI : Algebra A (Completion (Localization.Away s)) :=
      (toCompletionLoc P T s (Localization.Away s) hden).toAlgebra
    letI := locUniformSpace Q (T.image (algebraMap A B)) (algebraMap A B s)
      (Localization.Away (algebraMap A B s)) hden'
    CompletedTensor A B (Completion (Localization.Away s)) ≃+*
      Completion (Localization.Away (algebraMap A B s)) := sorry

open PairOfDefinition Classical in
/-- A0/rational-pullback-comparison (b): `rationalLocalizationIso` is a homeomorphism. -/
theorem Pair.completedTensor.isHomeomorph_rationalLocalizationIso (P : PairOfDefinition A)
    (Q : PairOfDefinition B) (T : Finset A) (s : A)
    (hden : HasDenominatorPower P T s (Localization.Away s))
    (hden' : HasDenominatorPower Q (T.image (algebraMap A B)) (algebraMap A B s)
      (Localization.Away (algebraMap A B s))) :
    letI := locUniformSpace P T s (Localization.Away s) hden
    letI := isUniformAddGroup_locUniformSpace P T s (Localization.Away s) hden
    letI := isTopologicalRing_locUniformSpace P T s (Localization.Away s) hden
    letI : Algebra A (Completion (Localization.Away s)) :=
      (toCompletionLoc P T s (Localization.Away s) hden).toAlgebra
    letI := locUniformSpace Q (T.image (algebraMap A B)) (algebraMap A B s)
      (Localization.Away (algebraMap A B s)) hden'
    IsHomeomorph (Pair.completedTensor.rationalLocalizationIso P Q T s hden hden') := sorry

end RationalPullback

-- Huber.Pair.completedTensor.rationalLocalizationIso, clause (c) (the pair is sheafy, inherited
--   from `Spa(B, B⁺)`): not stated here; needs the anchor's sheafiness of Huber pairs
--   (supplier: AdicSpaces Layer 4)

/- Clause (d): without adicness (b) fails. `ℤ_p → ℤ_p⟦X⟧` (`(p, X)`-adic) is continuous and not
adic; the preimage of `R(p/p)` is the open unit disc over `ℚ_p`, not quasi-compact. -/
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    Continuous (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) ∧
      ¬ IsAdicHom (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) := sorry

/-! ## AdicEtaleGeometry:A0/finite-etale-pullback-comparison (comparison) -/

section FiniteEtalePullback

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B] [Algebra A B]
  [IsModuleTopology A B] [Module.Finite A B] [Algebra.Etale A B] [IsAdicHom (algebraMap A B)]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C]
  [CompleteSpace C] [T2Space C] [Algebra A C] [IsAdicHom (algebraMap A C)]

/-- A0/finite-etale-pullback-comparison (i) (Kedlaya–Liu I Definition 8.2.16 and Remark 8.2.18): for
`B` finite étale over the complete Tate ring `A`, with its natural `A`-module topology, the
canonical map `B ⊗[A] C → B ⊗̂_A C` is bijective: no completion is needed. (`B` is a finite
projective `A`-module by Mathlib's `Module.Flat.projective_of_finitePresentation`.) -/
def Pair.completedTensor.finiteEtaleEquivTensor : B ⊗[A] C ≃+* CompletedTensor A B C :=
  RingEquiv.ofBijective (Pair.completedTensor.tmul A B C) sorry

attribute [local instance] Algebra.TensorProduct.rightAlgebra in
/-- A0/finite-etale-pullback-comparison (i): `finiteEtaleEquivTensor` is a homeomorphism when
`B ⊗[A] C` carries its natural `C`-module topology. -/
theorem Pair.completedTensor.isHomeomorph_finiteEtaleEquivTensor :
    @IsHomeomorph (B ⊗[A] C) (CompletedTensor A B C) (moduleTopology C (B ⊗[A] C)) _
      (Pair.completedTensor.finiteEtaleEquivTensor (A := A) (B := B) (C := C)) := sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- A0/finite-etale-pullback-comparison (ii): the plus ring of `B ⊗̂_A C` is the integral closure
of the image of `C⁺`, transported along the isomorphism of (i). -/
theorem Pair.completedTensor.plus_eq_integralClosure_of_finiteEtale
    (hTplus : T.plus = (integralClosure (S.plus.map (algebraMap A B)) B).toSubring) :
    (Pair.completedTensor S T U hT hU).plus =
      ((integralClosure
        (U.plus.map (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom)
          (B ⊗[A] C)).toSubring).map (Pair.completedTensor.tmul A B C) := sorry

/-- A0/finite-etale-pullback-comparison (iii): `(C, C⁺) → B ⊗̂_A C` is a finite morphism of
complete Tate Huber pairs (AdicSpacesPartII:R0/finite-huber-pair-hom); its ring map is finite étale
by Mathlib's `Algebra.Etale.baseChange`. -/
theorem Pair.completedTensor.inr_isFinite_of_finiteEtale :
    (Pair.completedTensor.inr S T U hT hU).IsFinite := sorry

open Classical in
/-- A0/finite-etale-pullback-comparison (v): for `f₁, …, fₙ, g ∈ A` generating the unit ideal,
`Spa(φ)⁻¹(R(f/g)) = R(φ(f)/φ(g))` (Tau Ceti `Pair.Hom.spaComap_preimage_rationalSubset`) with
coordinate ring the algebraic tensor product `B ⊗_A A⟨f/g⟩`: for `A⟨f/g⟩ = A⟨T/s⟩` this is the
bijectivity of `tmul`, as in (i). -/
theorem Pair.completedTensor.finiteEtale_rationalLocalization (φ : Pair.Hom S T)
    (hφ : φ.toRingHom = algebraMap A B) (T' : Finset A) (s : A)
    (hunit : Ideal.span (insert s (T' : Set A)) = ⊤) :
    φ.spaComap ⁻¹' (Subtype.val ⁻¹' rationalSubset S.plus T' s) =
      Subtype.val ⁻¹' rationalSubset T.plus (T'.image φ.toRingHom) (φ.toRingHom s) := sorry

end FiniteEtalePullback

-- Huber.Pair.completedTensor.finiteEtaleEquivTensor, clause (iv) (`Spa(B ⊗_A C)` is the fibre
--   product for sheafy base change): not stated here; needs the anchor's category of adic spaces
--   and sheafiness (supplier: AdicSpacesPartII:R0/affinoid-fibre-product, AdicSpaces Layer 4)

/-! ## AdicEtaleGeometry:A0/fibre-product-affinoid-chart-comparison (comparison) -/

-- AdicSpace.pullbackAffinoidChartIso: not stated here; needs the anchor's category of adic spaces,
--   open affinoids and the fibre products of AdicSpacesPartII:R0/fibre-products-existence
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence). The chart ring
--   is `Huber.CompletedTensor A C B`, and its compatibility with rational subsets is
--   AdicSpacesPartII:R0/completed-tensor-rational-localisation.

/-! ## AdicEtaleGeometry:A0/fibre-product-associativity-and-unit (comparison) -/

section Assoc

variable {A B C E : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]
  [CommRing E] [TopologicalSpace E] [IsTopologicalRing E] [Algebra A B] [Algebra A C] [Algebra A E]

/-- A0/fibre-product-associativity-and-unit (Huber 1994 Proposition 3.7; Mathlib
`IsPushout.paste_horiz` for the pasting): the ring isomorphism
`(C ⊗̂_A B) ⊗̂_A E ≅ C ⊗̂_A (B ⊗̂_A E)` whose `Spa` is the associativity isomorphism of fibre
products on affinoid charts. -/
def Pair.completedTensor.assoc :
    CompletedTensor A (CompletedTensor A C B) E ≃+* CompletedTensor A C (CompletedTensor A B E) :=
  sorry

/-- A0/fibre-product-associativity-and-unit: `assoc` is a homeomorphism. -/
theorem Pair.completedTensor.isHomeomorph_assoc :
    IsHomeomorph (Pair.completedTensor.assoc (A := A) (B := B) (C := C) (E := E)) := sorry

/-- A0/fibre-product-associativity-and-unit: `assoc` is compatible with the three coprojections:
on elementary tensors, `(c ⊗ b) ⊗ e ↦ c ⊗ (b ⊗ e)`. -/
theorem Pair.completedTensor.assoc_tmul (c : C) (b : B) (e : E) :
    Pair.completedTensor.assoc (Pair.completedTensor.tmul A (CompletedTensor A C B) E
        (Pair.completedTensor.tmul A C B (c ⊗ₜ b) ⊗ₜ e)) =
      Pair.completedTensor.tmul A C (CompletedTensor A B E)
        (c ⊗ₜ Pair.completedTensor.tmul A B E (b ⊗ₜ e)) := sorry

end Assoc

-- AdicSpace.pullbackAssoc_affinoid (the geometric side: Mathlib's `pullbackAssoc`,
--   `pullbackSymmetry` and `IsPullback.of_id_snd` in adic spaces are Spa of `assoc`,
--   `Huber.Pair.completedTensor.comm` and the unit `B ⊗̂_A A ≅ B`): not stated here; needs the
--   anchor's category of adic spaces with its fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

end Huber

/-! ## AdicEtaleGeometry:A0/analytic-locus-restriction (construction) -/

-- AdicSpace.analyticLocus: not stated here; needs the anchor's category of adic spaces and its open
--   subspaces (supplier: AdicSpaces Layer 5). Its affinoid core is Tau Ceti's
--   `ValuationSpectrum.spaAnalytic`.
-- AdicSpace.analyticLocus.ι: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.mem_analyticLocus_iff: not stated here; needs the anchor's structure sheaf `𝒪_X`
--   (supplier: AdicSpaces Layer 5). Its affinoid core is Tau Ceti's
--   `ValuationSpectrum.isAnalyticPoint_def` (the support is not open).
-- AdicSpace.IsAnalytic: not stated here; needs the anchor's category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsAnalytic.isIso_ι: not stated here; needs isomorphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analyticLocus_inf_open: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analyticLocus_spa: not stated here; needs `Spa` as an adic space (supplier: AdicSpaces
--   Layer 5); on underlying sets it is the definition of Tau Ceti's `spaAnalytic`
-- AdicSpace.analyticLocus_spa_eq_iUnion_tateCharts: not stated here; needs `Spa` as an adic space
--   (supplier: AdicSpaces Layer 5). Its affinoid core is Tau Ceti's
--   `ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`.
-- AdicSpace.analyticLocus_eq_top_of_isTateRing: not stated here; needs `Spa` as an adic space
--   (supplier: AdicSpaces Layer 5). Its affinoid core is Tau Ceti's
--   `ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`.
-- AdicSpace.analyticLocus_spa_eq_bot_iff: not stated here; needs `Spa` as an adic space
--   (supplier: AdicSpaces Layer 5). Its affinoid core is Tau Ceti's
--   `ValuationSpectrum.spaAnalytic_eq_empty_iff_discrete_separationQuotient`.
-- AdicSpace.IsAdic.analyticLocusMap: not stated here; needs morphisms of adic spaces and
--   AdicSpacesPartII's `AdicSpace.IsAdic` (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/adic-morphism)
-- AdicSpace.analyticLocus.lift: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/adic-morphism)
-- AdicSpace.isAdic_iff_image_analyticLocus: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/adic-iff-analytic-locus)
-- AdicSpace.analyticLocus_pullback: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.analyticLocus_isAnalytic: not stated here; needs the anchor's category of adic spaces
--   (supplier: AdicSpaces Layer 5)

section AnalyticLocusTests

variable (p : ℕ) [Fact p.Prime]

open scoped Classical in
/- Affinoid core: on `Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧)` with the `(p, T)`-adic topology the analytic locus is
`R((p, T)/p) ∪ R((p, T)/T)`, and it contains a point of characteristic `p` (the `T`-adic valuation
of `𝔽_p((T))`), whose support contains `p`. -/
-- test analyticLocus_test_powerSeries (computation) [A0/analytic-locus-restriction]
example :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    spaAnalytic (⊤ : Subring (PowerSeries ℤ_[p])) =
        rationalSubset ⊤ {PowerSeries.C (p : ℤ_[p]), PowerSeries.X} (PowerSeries.C (p : ℤ_[p])) ∪
          rationalSubset ⊤ {PowerSeries.C (p : ℤ_[p]), PowerSeries.X} PowerSeries.X ∧
      ∃ v ∈ spaAnalytic (⊤ : Subring (PowerSeries ℤ_[p])), PowerSeries.C (p : ℤ_[p]) ∈ v.supp :=
  sorry

open scoped Classical in
/- Affinoid core: for a perfect field `k`, `Spa(W(k), W(k))` with the `p`-adic topology has
analytic locus `R(p/p) = Spa(W(k)[1/p], W(k))`, a single point. -/
-- test analyticLocus_test_witt (computation) [A0/analytic-locus-restriction]
example (k : Type*) [Field k] [CharP k p] [PerfectRing k p] :
    letI : WithIdeal (WittVector p k) := ⟨Ideal.span {(p : WittVector p k)}⟩
    spaAnalytic (⊤ : Subring (WittVector p k)) = rationalSubset ⊤ {(p : WittVector p k)} p ∧
      ∃ v, spaAnalytic (⊤ : Subring (WittVector p k)) = {v} := sorry

/- A discrete ring has empty analytic locus; over a Tate ring the analytic locus is everything
(Tau Ceti `spaAnalytic_eq_spa_of_isTateRing`). -/
-- test analyticLocus_test_discrete (degenerate) [A0/analytic-locus-restriction]
example (R : Type*) [CommRing R] [TopologicalSpace R] [DiscreteTopology R] :
    spaAnalytic (⊤ : Subring R) = ∅ := sorry

/- Affinoid core: `ℤ_p → ℤ_p⟦T⟧` (`p`-adic, resp. `(p, T)`-adic) pulls an analytic point of
`Spa ℤ_p⟦T⟧` (the `T`-adic valuation of `𝔽_p((T))`) back to a non-analytic point of `Spa ℤ_p`, so
it does not restrict to analytic loci. -/
-- test analyticLocus_test_nonAdic (non-example) [A0/analytic-locus-restriction]
example :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ∃ v ∈ spaAnalytic (⊤ : Subring (PowerSeries ℤ_[p])),
      ¬ IsAnalyticPoint (comap (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) v) := sorry

-- analyticLocus_test_spaAnalytic: not stated here; needs `Spa(A, A⁺)` as an adic space and its
--   analytic locus as an adic space (supplier: AdicSpaces Layer 5) [compatibility test]

open scoped Classical in
/- Affinoid core: for a perfect ring `O` of characteristic `p` (for `A_inf`, `O = O_F`) with
`ϖ ∈ O` and `W(O)` with the `(p, [ϖ])`-adic topology, the analytic locus is
`D(p) ∪ D([ϖ]) = R((p, [ϖ])/p) ∪ R((p, [ϖ])/[ϖ])`, and it is not `𝒴 = D(p) ∩ D([ϖ])`. -/
-- test analyticLocus_test_ainf (characterisation) [A0/analytic-locus-restriction]
example (O : Type*) [CommRing O] [IsDomain O] [CharP O p] [PerfectRing O p] (ϖ : O)
    (hϖ : ϖ ≠ 0) (hϖ' : ¬ IsUnit ϖ) :
    letI : WithIdeal (WittVector p O) :=
      ⟨Ideal.span {(p : WittVector p O), WittVector.teichmuller p ϖ}⟩
    spaAnalytic (⊤ : Subring (WittVector p O)) =
        rationalSubset ⊤ {(p : WittVector p O), WittVector.teichmuller p ϖ} p ∪
          rationalSubset ⊤ {(p : WittVector p O), WittVector.teichmuller p ϖ}
            (WittVector.teichmuller p ϖ) ∧
      spaAnalytic (⊤ : Subring (WittVector p O)) ≠
        rationalSubset ⊤ {(p : WittVector p O), WittVector.teichmuller p ϖ} p ∩
          rationalSubset ⊤ {(p : WittVector p O), WittVector.teichmuller p ϖ}
            (WittVector.teichmuller p ϖ) := sorry

end AnalyticLocusTests

end TauCeti

end

/-! # Stage A1 (part a). Finite étale and étale morphisms, the étale and finite étale sites -/

noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter CategoryTheory ValuationSpectrum

/-! ## AdicEtaleGeometry:A1/strongly-sheafy-huber-pair (definition) -/

/- Strong sheafiness (Hansen–Kedlaya Definition 4.1: every `A⟨T₁, …, Tₙ⟩` is sheafy) is defined
in terms of the anchor's sheafiness predicate `Huber.IsSheafyRing` (Wedhorn Definition 8.26),
which is in neither pinned library. So the class and its API are not stated. Its ring-level
inputs are in Tau Ceti already: the iteration `A⟨S⟩⟨T⟩ ≅ A⟨S, T⟩` behind clause (a) is
`TauCeti.Huber.iterateRingEquiv`, and the transfer of strong noetherianity to Tate algebras behind
`Huber.IsStronglySheafy.of_isStronglyNoetherian` is the instance
`TauCeti.Huber.IsStronglyNoetherian.restrictedMvPowerSeriesCompletion`. -/

-- Huber.IsStronglySheafy: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyRing` on the Tate algebras `A⟨T₁, …, Tₙ⟩` (supplier: AdicSpaces Layer 4)
-- Huber.IsStronglySheafy.isSheafyRing: not stated here; needs `Huber.IsSheafyRing`
--   (supplier: AdicSpaces Layer 4)
-- Huber.IsStronglySheafy.restrictedMvPowerSeries: not stated here; needs `Huber.IsSheafyRing`
--   (supplier: AdicSpaces Layer 4); its ring-level input is Tau Ceti's `iterateRingEquiv`
-- Huber.IsStronglySheafy.rationalLocalization: not stated here; needs `Huber.IsSheafyRing` and
--   the rational localisations `O(U)` as complete Tate rings (supplier: AdicSpaces Layer 3)
-- Huber.IsStronglySheafy.of_rationalCover: not stated here; needs `Huber.IsSheafyRing` and finite
--   rational coverings with their localisations (supplier: AdicSpaces Layers 3–4)
-- Huber.IsStronglySheafy.of_isStronglyNoetherian: not stated here; needs `Huber.IsSheafyRing`
--   (supplier: AdicSpaces Layer 4, Tate acyclicity for strongly noetherian rings); its ring-level
--   input is Tau Ceti's `IsStronglyNoetherian.restrictedMvPowerSeriesCompletion`
-- Huber.IsStronglySheafy.of_isStablySheafyRing: not stated here; needs the anchor's
--   `Huber.IsStablySheafyRing` (supplier: AdicSpaces Layer 4)
-- AdicSpace.IsLocallyStronglySheafy: not stated here; needs the category of adic spaces with
--   open affinoid subspaces and analytic points (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyStronglySheafy.isStronglySheafy_of_isAffinoidOpen: not stated here; needs
--   adic spaces and `Huber.IsSheafyRing` (supplier: AdicSpaces Layers 4–5)
-- AdicSpace.IsLocallyStronglySheafy.restrict: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyStronglySheafy.of_isLocallyNoetherian: not stated here; needs adic spaces
--   and locally noetherian adic spaces (supplier:
--   AdicSpacesPartII:R0/locally-noetherian-adic-space)
-- Huber.IsStronglySheafy.test_tateAlgebra: not stated here; needs `Huber.IsSheafyRing`
--   (supplier: AdicSpaces Layer 4) [computation test]
-- Huber.IsStronglySheafy.test_field: not stated here; needs `Huber.IsSheafyRing` and adic spaces
--   `Spa(K, K⁺)` (supplier: AdicSpaces Layers 4–5) [degenerate test]
-- Huber.IsStronglySheafy.test_not_of_uniform: not stated here; needs `Huber.IsSheafyRing` and the
--   Buzzard–Verberkmoes ring (supplier: AdicSpaces Layer 4) [non-example test]
-- Huber.IsStronglySheafy.test_of_isStablySheafyRing: not stated here; needs the anchor's
--   `Huber.IsStablySheafyRing` (supplier: AdicSpaces Layer 4) [compatibility test]

namespace Huber

/-! ## AdicEtaleGeometry:A1/finite-etale-affinoid-algebra (construction) -/

/-- A1/finite-etale-affinoid-algebra (data): the type synonym of a finite étale `A`-algebra `B`
on which the construction puts its natural topology, the `A`-module topology (Mathlib
`moduleTopology A B`; Kedlaya–Liu Lemma 2.2.12). -/
def FiniteEtale (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] : Type _ := B

section FiniteEtaleCarrier

variable (A : Type*) [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  (B : Type*) [CommRing B] [Algebra A B]

instance : CommRing (FiniteEtale A B) := inferInstanceAs (CommRing B)

instance : Algebra A (FiniteEtale A B) := inferInstanceAs (Algebra A B)

instance [Module.Finite A B] : Module.Finite A (FiniteEtale A B) :=
  inferInstanceAs (Module.Finite A B)

instance [Algebra.Etale A B] : Algebra.Etale A (FiniteEtale A B) :=
  inferInstanceAs (Algebra.Etale A B)

/-- A1/finite-etale-affinoid-algebra (data): the identification of `B` with its topologised
synonym, as `A`-algebras. -/
def FiniteEtale.algEquiv : B ≃ₐ[A] FiniteEtale A B := AlgEquiv.refl

/-- A1/finite-etale-affinoid-algebra (data): the natural topology, `moduleTopology A B`. -/
instance : TopologicalSpace (FiniteEtale A B) := moduleTopology A (FiniteEtale A B)

/-- A1/finite-etale-affinoid-algebra (instance, (i)): the topology on `B` is the `A`-module
topology; for a finite `A`-algebra it is a ring topology, and with the instances below `B` is a
complete Hausdorff Tate ring (Kedlaya–Liu Lemma 2.2.12). -/
instance FiniteEtale.isModuleTopology : IsModuleTopology A (FiniteEtale A B) := sorry

variable [Module.Finite A B]

/-- A1/finite-etale-affinoid-algebra (instance, (i)): a finite algebra with its natural topology is
a topological ring (Mathlib `IsModuleTopology.isTopologicalRing`). -/
instance FiniteEtale.isTopologicalRing : IsTopologicalRing (FiniteEtale A B) := sorry

/-- A1/finite-etale-affinoid-algebra (data): the canonical uniformity of the additive group. -/
instance : UniformSpace (FiniteEtale A B) :=
  IsTopologicalAddGroup.rightUniformSpace (FiniteEtale A B)

instance : IsUniformAddGroup (FiniteEtale A B) := isUniformAddGroup_of_addCommGroup

/-- A1/finite-etale-affinoid-algebra (instance, (i)): over a Tate ring, `B` is a Tate ring: for
generators `b₁, …, b_m`, a ring of definition `A₀ ⊆ A⁺` and a pseudouniformiser `ϖ`,
`A₀[ϖᴺ b₁, …, ϖᴺ b_m]` is a ring of definition for `N ≫ 0`, and `ϖ` stays a pseudouniformiser. -/
instance FiniteEtale.isTateRing [IsTateRing A] : IsTateRing (FiniteEtale A B) := sorry

/-- A1/finite-etale-affinoid-algebra (instance, (i)): over a complete Hausdorff ring, a finite
étale (hence finite projective) algebra is complete: its topology is the subspace topology of
`Aⁿ` for a presentation `B ⊕ Q ≅ Aⁿ`. -/
instance FiniteEtale.completeSpace [CompleteSpace A] [T2Space A] [Algebra.Etale A B] :
    CompleteSpace (FiniteEtale A B) := sorry

/-- A1/finite-etale-affinoid-algebra (instance, (i)): over a Hausdorff ring, a finite étale
algebra is Hausdorff (a direct summand of `Aⁿ`). -/
instance FiniteEtale.t2Space [T2Space A] [Algebra.Etale A B] : T2Space (FiniteEtale A B) := sorry

end FiniteEtaleCarrier

section FiniteEtalePair

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (S : Pair A)
  (B : Type*) [CommRing B] [Algebra A B] [Module.Finite A B] [Algebra.Etale A B]

/-- A1/finite-etale-affinoid-algebra (constructor): for a complete Tate pair `(A, A⁺)` and a finite
étale `A`-algebra `B`, the complete Tate pair `(B, B⁺)`: `B` with its natural topology and `B⁺`
the integral closure of the image of `A⁺` (never `B°`; Kedlaya–Liu Lemma 2.2.12, Definition
8.2.16). -/
def Pair.finiteEtale : Pair (FiniteEtale A B) where
  plus := (integralClosure ↥(S.plus.map (algebraMap A (FiniteEtale A B)))
    (FiniteEtale A B)).toSubring
  isRingOfIntegralElements := sorry

/-- A1/finite-etale-affinoid-algebra (simp, (ii)): the plus ring of `finiteEtale` is the integral
closure of the image of `A⁺`. -/
@[simp]
theorem Pair.finiteEtale_plus :
    (S.finiteEtale B).plus =
      (integralClosure ↥(S.plus.map (algebraMap A (FiniteEtale A B)))
        (FiniteEtale A B)).toSubring := sorry

/-- A1/finite-etale-affinoid-algebra (data): the morphism of Huber pairs
`ι : (A, A⁺) → (B, B⁺)`, with underlying map `algebraMap A B`. -/
def Pair.finiteEtale.hom : Pair.Hom S (S.finiteEtale B) where
  toRingHom := algebraMap A (FiniteEtale A B)
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- A1/finite-etale-affinoid-algebra (compatibility, (iii)): `ι` is a finite morphism of Huber
pairs in the sense of AdicSpacesPartII:R0/finite-huber-pair-hom. -/
theorem Pair.finiteEtale.hom_isFinite : (Pair.finiteEtale.hom S B).IsFinite := sorry

/-- A1/finite-etale-affinoid-algebra (universal-property, (iv)): for a complete Huber pair
`(D, D⁺)` under `(A, A⁺)` (through `χ`, whose ring map is `algebraMap A D`), morphisms of Huber
pairs `(B, B⁺) → (D, D⁺)` under `(A, A⁺)` are exactly the `A`-algebra homomorphisms `B → D`:
every `A`-linear map out of `B` is continuous, and `B⁺` lands in `D⁺` because `D⁺` is integrally
closed and contains the image of `A⁺`. -/
def Pair.finiteEtale.homEquiv {D : Type*} [CommRing D] [UniformSpace D] [IsUniformAddGroup D]
    [IsTopologicalRing D] [IsHuberRing D] [CompleteSpace D] [T2Space D] [Algebra A D]
    {U : Pair D} (χ : Pair.Hom S U) (hχ : χ.toRingHom = algebraMap A D) :
    {ψ : Pair.Hom (S.finiteEtale B) U // ψ.comp (Pair.finiteEtale.hom S B) = χ} ≃
      (B →ₐ[A] D) := sorry

/-- A1/finite-etale-affinoid-algebra (functoriality, core of `Huber.Pair.finiteEtaleFunctor`):
an `A`-algebra homomorphism of finite étale algebras is a morphism of the associated Huber pairs.
Full faithfulness of the functor is `Huber.Pair.finiteEtale.homEquiv`. -/
def Pair.finiteEtaleFunctor_core {B' : Type*} [CommRing B'] [Algebra A B'] [Module.Finite A B']
    [Algebra.Etale A B'] (f : B →ₐ[A] B') :
    Pair.Hom (S.finiteEtale B) (S.finiteEtale B') where
  toRingHom := (f : B →+* B')
  continuous_toRingHom := sorry
  map_mem_plus := sorry

-- Huber.Pair.finiteEtaleFunctor: not stated here; needs a category of complete Huber pairs
--   under `(A, A⁺)` (supplier: AdicEtaleGeometry:A1/huber-pair-rational-site, whose `CAff` is
--   the opposite of complete Huber pairs); its action on morphisms is
--   `Huber.Pair.finiteEtaleFunctor_core` and its full faithfulness
--   `Huber.Pair.finiteEtale.homEquiv`

section BaseChange

variable {C : Type*} [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
  [IsTateRing C] [CompleteSpace C] [T2Space C] [Algebra A C] (U : Pair C)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)
  [IsAdicHom (algebraMap A C)] [IsAdicHom (algebraMap A (FiniteEtale A B))]

/-- A1/finite-etale-affinoid-algebra (compatibility, (v)): for a morphism of complete Tate pairs
`(A, A⁺) → (C, C⁺)`, the finite étale `C`-algebra `C ⊗_A B` with its natural topology is the
completed tensor product `C ⊗̂_A B` (AdicSpacesPartII:R0/completed-tensor-product): the canonical
map `C ⊗_A B → C ⊗̂_A B` is an isomorphism of topological rings, compatible with the plus rings
(`Huber.Pair.finiteEtale.baseChangeIso_spec`). -/
def Pair.finiteEtale.baseChangeIso :
    FiniteEtale C (C ⊗[A] B) ≃+* CompletedTensor A C (FiniteEtale A B) := sorry

/-- A1/finite-etale-affinoid-algebra ((v), supporting `Huber.Pair.finiteEtale.baseChangeIso`):
the isomorphism is a homeomorphism, is `c ⊗ b ↦ c ⊗ b`, and carries the plus ring of
`finiteEtale C⁺ (C ⊗_A B)` onto the plus ring of the completed tensor product of pairs. -/
theorem Pair.finiteEtale.baseChangeIso_spec :
    IsHomeomorph (Pair.finiteEtale.baseChangeIso (A := A) B (C := C)) ∧
      (∀ (c : C) (b : B), Pair.finiteEtale.baseChangeIso (A := A) B (C := C) (c ⊗ₜ b) =
        Pair.completedTensor.tmul A C (FiniteEtale A B) (c ⊗ₜ (FiniteEtale.algEquiv A B b))) ∧
      (U.finiteEtale (C ⊗[A] B)).plus.map
          (Pair.finiteEtale.baseChangeIso (A := A) B (C := C)).toRingHom =
        (Pair.completedTensor S U (S.finiteEtale B) hU
          (Pair.finiteEtale.hom S B).map_mem_plus).plus := sorry

end BaseChange

open scoped Classical in
/-- A1/finite-etale-affinoid-algebra (compatibility, (v)): `Spa(ι)⁻¹ R(f/g) = R(ι f/ι g)`. -/
theorem Pair.finiteEtale.spaComap_preimage_rationalSubset (T : Finset A) (s : A) :
    (Pair.finiteEtale.hom S B).spaComap ⁻¹' (Subtype.val ⁻¹' rationalSubset S.plus T s) =
      Subtype.val ⁻¹' rationalSubset (S.finiteEtale B).plus
        (T.image (algebraMap A (FiniteEtale A B))) (algebraMap A (FiniteEtale A B) s) := sorry

-- Huber.Pair.finiteEtale.rationalLocalizationIso: not stated here; needs the rational
--   localisations `O(R(f/g))` and `B⟨ι f/ι g⟩` as complete Tate pairs with their plus rings
--   (supplier: AdicSpaces Layer 3)

/-- A1/finite-etale-affinoid-algebra (other, (iii)): if `B` is faithfully flat over `A`,
`Spa(ι) : Spa(B, B⁺) → Spa(A, A⁺)` is surjective. -/
theorem Pair.finiteEtale.spaComap_surjective [Module.FaithfullyFlat A B] :
    Function.Surjective (Pair.finiteEtale.hom S B).spaComap := sorry

/-- A1/finite-etale-affinoid-algebra ((iii); core of `AdicSpace.IsFiniteEtale.surjective_iff` and
of `AdicSpace.smallFiniteEtale.test_cover_iff`): `Spa(ι)` is surjective iff `B` is faithfully flat
over `A`, i.e. iff the degree of `B` is everywhere positive (Kedlaya–Liu Lemma 8.2.17). -/
theorem Pair.finiteEtale.spaComap_surjective_iff :
    Function.Surjective (Pair.finiteEtale.hom S B).spaComap ↔ Module.FaithfullyFlat A B := sorry

-- Huber.Pair.finiteEtale.eq_finiteAlgebra: not stated here; needs AdicSpacesPartII R0's pair
--   `Huber.Pair.finiteAlgebra` (supplier: AdicSpacesPartII:R0/finite-algebra-over-affinoid)

end FiniteEtalePair

/- `B = A × A`: the plus ring is `A⁺ × A⁺`. -/
-- test Huber.Pair.finiteEtale_test_split (degenerate) [A1/finite-etale-affinoid-algebra]
example {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (S : Pair A) [Algebra.Etale A (A × A)] :
    ((S.finiteEtale (A × A)).plus : Set (FiniteEtale A (A × A))) =
      FiniteEtale.algEquiv A (A × A) '' ((S.plus : Set A) ×ˢ (S.plus : Set A)) := sorry

/- For a nonarchimedean field with `K⁺ ≠ K°` (e.g. of rank 2) and `B = K × K`, the plus ring
`K⁺ × K⁺` is not `B° = O_K × O_K`. -/
-- test Huber.Pair.finiteEtale_test_plus_not_powerBounded (non-example)
--   [A1/finite-etale-affinoid-algebra]
example {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (S : Pair K) (hS : S.plus ≠ powerBoundedSubring K) [Algebra.Etale K (K × K)] :
    (S.finiteEtale (K × K)).plus ≠ powerBoundedSubring (FiniteEtale K (K × K)) := sorry

-- Huber.Pair.finiteEtale_test_kummer_annulus: not stated here; needs the Laurent Tate algebra
--   `K⟨T, T⁻¹⟩` and its rational localisation `A⟨(T − 1)/p⟩` as complete Tate rings (supplier:
--   AdicSpaces Layer 3) [computation test]
-- Huber.Pair.finiteEtale_test_eq_finiteAlgebra: not stated here; needs AdicSpacesPartII R0's
--   `Huber.Pair.finiteAlgebra` (supplier: AdicSpacesPartII:R0/finite-algebra-over-affinoid)
--   [compatibility test]

/- A non-closed ideal `J` of a complete Tate ring: `A ⧸ J` is not étale, and its natural topology is
not Hausdorff. -/
-- test Huber.Pair.finiteEtale_test_quotient_not_projective (non-example)
--   [A1/finite-etale-affinoid-algebra]
example {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (J : Ideal A) (hJ : ¬ IsClosed (J : Set A)) :
    ¬ Algebra.Etale A (A ⧸ J) ∧ ¬ @T2Space (A ⧸ J) (moduleTopology A (A ⧸ J)) := sorry

/-! ## AdicEtaleGeometry:A1/finite-etale-strongly-sheafy (theorem) -/

section FiniteEtaleSheafy

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]
  (B : Type*) [CommRing B] [Algebra A B] [Module.Finite A B] [Algebra.Etale A B]

-- Huber.IsStronglySheafy.finiteEtale: not stated here; needs `Huber.IsStronglySheafy`, that is
--   the anchor's `Huber.IsSheafyRing` (supplier: AdicSpaces Layer 4) (Hansen–Kedlaya Cor. 4.7)
-- Huber.FiniteEtale.exists_rationalCover_monogenic: not stated here; needs the rational
--   localisations `O(U_k)` of a finite rational covering as complete Tate rings (supplier:
--   AdicSpaces Layer 3)

/-- A1/finite-etale-strongly-sheafy (special case, core): if `A` is strongly noetherian, so is `B`:
`B⟨T₁, …, Tₙ⟩ = B ⊗_A A⟨T₁, …, Tₙ⟩` is finite over a noetherian ring. -/
instance FiniteEtale.isStronglyNoetherian [IsStronglyNoetherian A] :
    IsStronglyNoetherian (FiniteEtale A B) := sorry

/-- A1/finite-etale-strongly-sheafy (special case, core): if `A` has a noetherian ring of
definition, so has `B`: the ring `B₀ = A₀[ϖᴺ b₁, …, ϖᴺ b_m]` of
AdicEtaleGeometry:A1/finite-etale-affinoid-algebra (i), finite over `A₀`. -/
theorem FiniteEtale.exists_pairOfDefinition_isNoetherianRing (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] :
    ∃ Q : PairOfDefinition (FiniteEtale A B), IsNoetherianRing Q.ringOfDefinition := sorry

end FiniteEtaleSheafy

/-! ## AdicEtaleGeometry:A1/finite-etale-rational-descent (lemma) -/

-- Huber.finiteEtaleDescentEquiv: not stated here; needs the anchor's rational coverings with
--   their rational localisations `A_i`, `A_ij`, `A_ijk` as complete Tate rings (supplier:
--   AdicSpaces Layer 3); the statement is Kedlaya–Liu Theorem 2.6.9, an equivalence of
--   `CommAlgCat.FiniteEtale A` with the category of descent data for `A → ∏ A_i`

/-! ## AdicEtaleGeometry:A1/affinoid-system-approximation (lemma) -/

section AffinoidSystem

universe u

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A1/affinoid-system-approximation (structure): an *affinoid system* with completed direct limit
`(A, A⁺)` (Kedlaya–Liu Definition 2.6.1, Lemma 2.6.2): a directed system of complete strongly
noetherian Tate pairs `(A_α, A_α⁺)` with pairs of definition respected by the transition maps and
compatible morphisms to `(A, A⁺)`, such that the images are dense, `A⁺` is the closure of the
images of the `A_α⁺`, and the closure of the images of the rings of definition is a ring of
definition of `A`; that is, `(A, A⁺)` is the completion of `colim_α (A_α, A_α⁺)`. -/
structure AffinoidSystem (S : Pair A) where
  /-- The directed index set. -/
  ι : Type u
  /-- The order of the index set. -/
  [preorder : Preorder ι]
  /-- The index set is directed. -/
  [isDirected : IsDirectedOrder ι]
  /-- The index set is nonempty. -/
  [nonempty : Nonempty ι]
  /-- The rings `A_α`. -/
  R : ι → Type u
  /-- The ring structures. -/
  [commRing : ∀ i, CommRing (R i)]
  /-- The uniform structures. -/
  [uniformSpace : ∀ i, UniformSpace (R i)]
  /-- Uniform additive groups. -/
  [isUniformAddGroup : ∀ i, IsUniformAddGroup (R i)]
  /-- Topological rings. -/
  [isTopologicalRing : ∀ i, IsTopologicalRing (R i)]
  /-- Tate rings. -/
  [isTateRing : ∀ i, IsTateRing (R i)]
  /-- Complete. -/
  [completeSpace : ∀ i, CompleteSpace (R i)]
  /-- Hausdorff. -/
  [t2Space : ∀ i, T2Space (R i)]
  /-- Each `A_α` is strongly noetherian. -/
  isStronglyNoetherian : ∀ i, IsStronglyNoetherian (R i)
  /-- The pairs `(A_α, A_α⁺)`. -/
  pair : ∀ i, Pair (R i)
  /-- Pairs of definition of the `A_α`. -/
  pairOfDefinition : ∀ i, PairOfDefinition (R i)
  /-- The transition morphisms. -/
  transition : ∀ {i j : ι}, i ≤ j → Pair.Hom (pair i) (pair j)
  /-- Transition morphisms compose. -/
  transition_comp : ∀ {i j k : ι} (hij : i ≤ j) (hjk : j ≤ k),
    (transition hjk).comp (transition hij) = transition (hij.trans hjk)
  /-- Transition morphisms respect the rings of definition. -/
  transition_mem_ringOfDefinition : ∀ {i j : ι} (hij : i ≤ j),
    ∀ x ∈ (pairOfDefinition i).ringOfDefinition,
      (transition hij).toRingHom x ∈ (pairOfDefinition j).ringOfDefinition
  /-- The morphisms to `(A, A⁺)`. -/
  toPair : ∀ i, Pair.Hom (pair i) S
  /-- The morphisms to `(A, A⁺)` are compatible. -/
  toPair_comp : ∀ {i j : ι} (hij : i ≤ j), (toPair j).comp (transition hij) = toPair i
  /-- The images of the `A_α` are dense in `A`. -/
  dense_iUnion_range : Dense (⋃ i, Set.range (toPair i).toRingHom)
  /-- `A⁺` is the closure of the images of the `A_α⁺`. -/
  plus_eq_closure : (S.plus : Set A) = closure (⋃ i, (toPair i).toRingHom '' (pair i).plus)
  /-- The closure of the images of the rings of definition is a ring of definition of `A`. -/
  exists_pairOfDefinition_closure : ∃ P : PairOfDefinition A,
    (P.ringOfDefinition : Set A) =
      closure (⋃ i, (toPair i).toRingHom '' (pairOfDefinition i).ringOfDefinition)

attribute [instance] AffinoidSystem.preorder AffinoidSystem.isDirected AffinoidSystem.nonempty
  AffinoidSystem.commRing AffinoidSystem.uniformSpace AffinoidSystem.isUniformAddGroup
  AffinoidSystem.isTopologicalRing AffinoidSystem.isTateRing AffinoidSystem.completeSpace
  AffinoidSystem.t2Space

variable (S : Pair A)

/-- A1/affinoid-system-approximation: every complete Tate pair is the completed direct limit of an
affinoid system of quotients of Tate algebras `ℤ((z))⟨S₁, …, S_m⟩` (`z ↦ ϖ`), indexed by finite
subsets of `A⁺` (Kedlaya–Liu Lemma 2.6.2). -/
def AffinoidSystem.canonical : AffinoidSystem S := sorry

/-- A1/affinoid-system-approximation (a): `Spa(A, A⁺) → lim_α Spa(A_α, A_α⁺)` is a homeomorphism:
the map to the product is an embedding with image the compatible families (Kedlaya–Liu Remark
2.6.3, Lemma 2.6.5). -/
theorem AffinoidSystem.spa_homeomorph_limit (𝒜 : AffinoidSystem S) :
    IsEmbedding (fun v : spa S.plus ↦ fun i ↦ (𝒜.toPair i).spaComap v) ∧
      Set.range (fun v : spa S.plus ↦ fun i ↦ (𝒜.toPair i).spaComap v) =
        {x | ∀ {i j : 𝒜.ι} (hij : i ≤ j), (𝒜.transition hij).spaComap (x j) = x i} := sorry

/-- A1/affinoid-system-approximation (a): every rational subset of `Spa(A, A⁺)` is the preimage of
a rational subset of some `Spa(A_α, A_α⁺)` (Kedlaya–Liu Remark 2.6.7). -/
theorem AffinoidSystem.exists_rationalSubset_stage (𝒜 : AffinoidSystem S) (T : Finset A) (s : A)
    (hT : IsOpen (Ideal.span (T : Set A) : Set A)) :
    ∃ (i : 𝒜.ι) (T' : Finset (𝒜.R i)) (s' : 𝒜.R i),
      IsOpen (Ideal.span (T' : Set (𝒜.R i)) : Set (𝒜.R i)) ∧
        (𝒜.toPair i).spaComap ⁻¹' (Subtype.val ⁻¹' rationalSubset (𝒜.pair i).plus T' s') =
          Subtype.val ⁻¹' rationalSubset S.plus T s := sorry

/-! ## AdicEtaleGeometry:A1/finite-etale-approximation (theorem) -/

-- Huber.AffinoidSystem.finiteEtaleEquiv: not stated here; needs the 2-colimit of the categories
--   `CommAlgCat.FiniteEtale A_α` along base change (no Mathlib API); its essential-surjectivity
--   half is `Huber.AffinoidSystem.exists_finiteEtale_stage`

/-- A1/finite-etale-approximation (core): every finite étale `A`-algebra is defined at a finite
stage: `B ≅ A ⊗_{A_α} B_α` for some `α` and `B_α ∈ FÉt(A_α)` (Kedlaya–Liu Proposition 2.6.8). -/
theorem AffinoidSystem.exists_finiteEtale_stage (𝒜 : AffinoidSystem S) (B : Type u) [CommRing B]
    [Algebra A B] [Module.Finite A B] [Algebra.Etale A B] :
    ∃ (i : 𝒜.ι) (Bi : CommAlgCat.FiniteEtale.{u} (𝒜.R i)),
      letI := (𝒜.toPair i).toRingHom.toAlgebra
      Nonempty (A ⊗[𝒜.R i] Bi ≃ₐ[A] B) := sorry

end AffinoidSystem

/-! ## AdicEtaleGeometry:A1/finite-etale-morphism (definition) -/

-- AdicSpace.IsFiniteEtale: not stated here; needs the category of analytic adic spaces with open
--   affinoid subspaces and `Spa` of sheafy pairs (supplier: AdicSpaces Layer 5); the affinoid
--   model is `Huber.Pair.finiteEtale`
-- AdicSpace.IsFiniteEtale.spa: not stated here; needs `Spa` of a sheafy pair as an adic space
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteEtale.id: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteEtale.of_openCover: not stated here; needs open covers of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteEtale.isAffinoid_preimage: not stated here; needs adic spaces and
--   `Huber.IsStronglySheafy` (supplier: AdicSpaces Layers 4–5)
-- AdicSpace.IsFiniteEtale.isFinite: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism); affinoid core
--   `Huber.Pair.finiteEtale.hom_isFinite`
-- AdicSpace.IsFiniteEtale.isEtaleLocalDescription: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsFiniteEtale.comp: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteEtale.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsFiniteEtale.of_comp: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.IsFiniteEtale.surjective_iff: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5); affinoid core `Huber.Pair.finiteEtale.spaComap_surjective_iff`
-- AdicSpace.IsFiniteEtale.iff_isFinite_and_etale: not stated here; needs Huber's finite and étale
--   morphisms of adic spaces (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale)
-- AdicSpace.IsFiniteEtale.test_fold: not stated here; needs adic spaces and their disjoint unions
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.IsFiniteEtale.test_rational_inclusion: not stated here; needs adic spaces and open
--   immersions (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.IsFiniteEtale.test_squaring: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism) [non-example test]
-- AdicSpace.IsFiniteEtale.test_plus_ring: not stated here; needs `Spa` of pairs as adic spaces
--   (supplier: AdicSpaces Layer 5); its affinoid core is
--   `Huber.Pair.finiteEtale_test_plus_not_powerBounded` [non-example test]
-- AdicSpace.IsFiniteEtale.test_huber: not stated here; needs Huber's finite and étale morphisms
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale) [compatibility test]

/-! ## AdicEtaleGeometry:A1/finite-etale-local-to-global (theorem) -/

-- AdicSpace.IsFiniteEtale.isAffinoid_preimage (statement (a)), AdicSpace.finiteEtaleAffinoidEquiv
--   (statement (c)), AdicSpace.IsFiniteEtale.surjective_iff (statement (d)): not stated here;
--   need adic spaces, their open affinoids and `Huber.IsStronglySheafy` (supplier: AdicSpaces
--   Layers 4–5); the affinoid cores are `Huber.Pair.finiteEtale.homEquiv` and
--   `Huber.Pair.finiteEtale.spaComap_surjective_iff`

/-! ## AdicEtaleGeometry:A1/etale-morphism (definition) -/

-- AdicSpace.IsEtaleLocalDescription: not stated here; needs analytic adic spaces, open immersions
--   and `AdicSpace.IsFiniteEtale` (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.of_isOpenImmersion: not stated here; needs open immersions of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.exists_standardAffinoid: not stated here; needs adic spaces
--   and `Spa` of rational localisations (supplier: AdicSpaces Layers 3–5)
-- AdicSpace.IsEtaleLocalDescription.of_openCover_source: not stated here; needs open covers of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.of_openCover_target: not stated here; needs open covers of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.comp: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.baseChange: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsEtaleLocalDescription.of_comp: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.isOpenMap: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsEtaleLocalDescription.isOpenImmersion_diagonal: not stated here; needs fibre
--   products and open immersions of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsEtaleLocalDescription.iff_etale: not stated here; needs Huber's étale morphisms
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale)
-- AdicSpace.IsEtaleLocalDescription.test_openImmersion: not stated here; needs open immersions
--   of adic spaces (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.IsEtaleLocalDescription.test_origin: not stated here; needs closed immersions and
--   unramified morphisms of adic spaces (supplier: AdicSpacesPartII:R0/differentials-unramified-
--   smooth-etale) [non-example test]
-- AdicSpace.IsEtaleLocalDescription.test_nonseparated: not stated here; needs gluing of adic
--   spaces (supplier: AdicSpaces Layer 5) [characterisation test]
-- AdicSpace.IsEtaleLocalDescription.test_huber: not stated here; needs Huber's étale morphisms
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale) [compatibility test]

/-! ## AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison (comparison) -/

-- AdicSpace.IsFiniteEtale.iff_isFinite_and_etale, AdicSpace.IsEtaleLocalDescription.iff_etale,
--   AdicSpace.IsEtaleLocalDescription.isLocallyNoetherian: not stated here; need locally
--   noetherian analytic adic spaces and Huber's finite and étale morphisms (supplier:
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale, AdicSpacesPartII:R0/finite-morphism)

/-! ## AdicEtaleGeometry:A1/etale-base-change (lemma) -/

-- AdicSpace.IsEtaleLocalDescription.hasPullback, AdicSpace.IsEtaleLocalDescription.baseChange,
--   AdicSpace.IsFiniteEtale.baseChange,
--   AdicSpace.IsEtaleLocalDescription.surjective_pullback_points:
--   not stated here; need fibre products of adic spaces (supplier: AdicSpacesPartII:R0/fibre-
--   products-existence); the affinoid formula is `Huber.Pair.finiteEtale.baseChangeIso`

/-! ## AdicEtaleGeometry:A1/etale-composition (lemma) -/

-- AdicSpace.IsFiniteEtale.comp, AdicSpace.IsEtaleLocalDescription.comp,
--   AdicSpace.IsEtaleLocalDescription.isLocallyStronglySheafy: not stated here; need adic spaces
--   and `AdicSpace.IsLocallyStronglySheafy` (supplier: AdicSpaces Layers 4–5)

/-! ## AdicEtaleGeometry:A1/etale-diagonal (lemma) -/

-- AdicSpace.IsEtaleLocalDescription.isOpenImmersion_diagonal,
--   AdicSpace.IsFiniteEtale.isClosedMap_diagonal,
--   AdicSpace.IsEtaleLocalDescription.isOpenImmersion_of_section: not stated here; need fibre
--   products and open immersions of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicEtaleGeometry:A1/etale-cancellation (lemma) -/

-- AdicSpace.IsEtaleLocalDescription.of_comp, AdicSpace.IsFiniteEtale.of_comp: not stated here;
--   need adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicEtaleGeometry:A1/etale-open-map (lemma) -/

-- AdicSpace.IsEtaleLocalDescription.isOpenMap,
--   AdicSpace.IsEtaleLocalDescription.exists_factor_surjective_openImmersion: not stated here;
--   need adic spaces and open subspaces (supplier: AdicSpaces Layer 5)

/-! ## AdicEtaleGeometry:A1/etale-site (construction) -/

-- AdicSpace.smallEtale: not stated here; needs the category of adic spaces, to form Mathlib's
--   `MorphismProperty.Over` of `AdicSpace.IsEtaleLocalDescription` (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallEtale.mk: not stated here; needs `AdicSpace.smallEtale` (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.smallEtale.forget: not stated here; needs `AdicSpace.smallEtale` (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.smallEtale.hasFiniteLimits: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.smallEtalePretopology: not stated here; needs `AdicSpace.smallEtale` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.smallEtaleTopology: not stated here; needs `AdicSpace.smallEtale` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.ofArrows_mem_smallEtaleTopology_iff: not stated here; needs `AdicSpace.smallEtale`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallEtale.map: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.etaleSheafPushforward: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.etaleSheafPullback: not stated here; needs `AdicSpace.smallEtaleTopology` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.smallEtale.mapComp: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.opensToSmallEtale: not stated here; needs open subspaces of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.smallEtaleTopology_eq_huber: not stated here; needs Huber's étale site (supplier:
--   AdicSpacesPartII:R4)
-- AdicSpace.structureSheafEtale: not stated here; needs the structure sheaf of adic spaces
--   (supplier: AdicSpaces Layer 5); its affinoid core is `Huber.Pair.finiteEtale.equalizer_ring`
--   (node AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.smallEtaleTopology.test_kummer_cover: not stated here; needs `AdicSpace.smallEtale`
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.smallEtaleTopology.test_rank_one_not_enough: not stated here; needs
--   `AdicSpace.smallEtale` (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.smallEtaleTopology.test_geometric_point: not stated here; needs `AdicSpace.smallEtale`
--   (supplier: AdicSpaces Layer 5); affinoid core `Huber.Pair.finiteEtale_isAlgClosed_split`
--   [degenerate test]
-- AdicSpace.smallEtaleTopology.test_huber: not stated here; needs Huber's étale site (supplier:
--   AdicSpacesPartII:R4) [compatibility test]
-- AdicSpace.smallEtaleTopology.test_opens: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5) [characterisation test]

/-! ## AdicEtaleGeometry:A1/finite-etale-site (construction) -/

-- AdicSpace.smallFiniteEtale: not stated here; needs the category of adic spaces, to form
--   `MorphismProperty.Over` of `AdicSpace.IsFiniteEtale` (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallFiniteEtaleTopology: not stated here; needs `AdicSpace.smallFiniteEtale`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.ofArrows_mem_smallFiniteEtaleTopology_iff: not stated here; needs
--   `AdicSpace.smallFiniteEtale` (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallFiniteEtale.hasFiniteLimits: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.smallFiniteEtale.toSmallEtale: not stated here; needs `AdicSpace.smallEtale`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallFiniteEtale.affinoidEquiv: not stated here; needs `Spa` of pairs as adic spaces
--   (supplier: AdicSpaces Layer 5); its affinoid core is `Huber.Pair.finiteEtale.homEquiv`
-- AdicSpace.smallFiniteEtale.map: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.smallFiniteEtale.fiberFunctor: not stated here; needs geometric points of adic spaces
--   (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.smallFiniteEtale.galoisCategory: not stated here; needs `AdicSpace.smallFiniteEtale`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.smallFiniteEtale.test_field: not stated here; needs `Spa(K, K⁺)` as an adic space
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.smallFiniteEtale.test_algClosed: not stated here; needs `Spa(C, C⁺)` as an adic space
--   (supplier: AdicSpaces Layer 5); affinoid core `Huber.Pair.finiteEtale_isAlgClosed_split`
--   [degenerate test]
-- AdicSpace.smallFiniteEtale.test_open_not_object: not stated here; needs open immersions of adic
--   spaces (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.smallFiniteEtale.test_affinoid_equiv: not stated here; needs `Spa` of pairs as adic
--   spaces (supplier: AdicSpaces Layer 5) [compatibility test]
-- AdicSpace.smallFiniteEtale.test_cover_iff: not stated here; needs `AdicSpace.smallFiniteEtale`
--   (supplier: AdicSpaces Layer 5); affinoid core `Huber.Pair.finiteEtale.spaComap_surjective_iff`
--   [characterisation test]

/-! ## AdicEtaleGeometry:A1/geometric-point-etale-split (lemma) -/

-- AdicSpace.spa_algClosed_exists_section: not stated here; needs `Spa(C, C⁺)` as an adic space
--   and étale morphisms into it (supplier: AdicSpaces Layer 5); the affinoid core of clause (ii)
--   is `Huber.Pair.finiteEtale_isAlgClosed_split`

/-- A1/geometric-point-etale-split ((ii), affinoid core): over an algebraically closed complete
nonarchimedean field `C` with an open bounded valuation subring `C⁺`, every finite étale
`C`-algebra with its pair is `(Cⁿ, (C⁺)ⁿ)`. -/
theorem Pair.finiteEtale_isAlgClosed_split {C : Type*} [NontriviallyNormedField C]
    [IsUltrametricDist C] [CompleteSpace C] [IsAlgClosed C] [IsTateRing C] (S : Pair C)
    (B : Type*) [CommRing B] [Algebra C B] [Module.Finite C B] [Algebra.Etale C B] :
    ∃ (n : ℕ) (e : FiniteEtale C B ≃ₐ[C] (Fin n → C)),
      e '' (S.finiteEtale B).plus = Set.pi Set.univ fun _ ↦ (S.plus : Set C) := sorry

/-! ## AdicEtaleGeometry:A1/etale-site-and-geometric-points (construction) -/

-- AdicSpace.GeometricPoint: not stated here; needs morphisms `Spa(C, C⁺) → X` of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.GeometricPoint.support: not stated here; needs `AdicSpace.GeometricPoint` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.GeometricPoint.ofPoint: not stated here; needs completed residue fields of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.GeometricPoint.comp: not stated here; needs `AdicSpace.GeometricPoint` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.GeometricPoint.fiber: not stated here; needs `AdicSpace.smallEtale` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.point: not stated here; needs `AdicSpace.smallEtaleTopology` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.stalk: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.fiber_comp_iso: not stated here; needs `AdicSpace.smallEtale.map`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.stalk_pullback_iso: not stated here; needs
--   `AdicSpace.etaleSheafPullback`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.range_subset_generizations: not stated here; needs
--   `AdicSpace.GeometricPoint` (supplier: AdicSpaces Layer 5)
-- AdicSpace.isConservativeFamilyOfPoints_geometricPoint: not stated here; needs
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.strictLocalization: not stated here; needs `AdicSpace.smallEtale`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.GeometricPoint.test_field_rank_two: not stated here; needs `Spa(K, K⁺)` as an adic
--   space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.GeometricPoint.test_rank_one_not_conservative: not stated here; needs sheaves on
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site) [non-example test]
-- AdicSpace.GeometricPoint.test_identity: not stated here; needs `AdicSpace.GeometricPoint.point`
--   (supplier: AdicEtaleGeometry:A1/etale-site) [degenerate test]
-- AdicSpace.GeometricPoint.test_fet_fiber: not stated here; needs `AdicSpace.smallFiniteEtale`
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site); the ring-level fibre functor is Mathlib's
--   `CommAlgCat.FiniteEtale.fiber` [compatibility test]
-- AdicSpace.GeometricPoint.test_image_generizations: not stated here; needs
--   `AdicSpace.GeometricPoint` (supplier: AdicSpaces Layer 5) [characterisation test]

/-! ## AdicEtaleGeometry:A1/etale-enough-points (theorem) -/

-- AdicSpace.isConservativeFamilyOfPoints_geometricPoint, and the instance
--   `(AdicSpace.smallEtaleTopology X).HasEnoughPoints`: not stated here; need
--   `AdicSpace.smallEtaleTopology` and geometric points (supplier: AdicEtaleGeometry:A1/etale-site)

/-! ## AdicEtaleGeometry:A1/finite-etale-galois-category (theorem) -/

-- AdicSpace.smallFiniteEtale.galoisCategory, AdicSpace.GeometricPoint.fiberFunctor_isFiberFunctor,
--   AdicSpace.etaleFundamentalGroup: not stated here; need `AdicSpace.smallFiniteEtale` and
--   geometric points (supplier: AdicEtaleGeometry:A1/finite-etale-site); the ring-level fibre
--   functor at a geometric point `Ω` is Mathlib's `CommAlgCat.FiniteEtale.fiber`

/-! ## AdicEtaleGeometry:A1/basis-comparison (lemma) -/

-- AdicSpace.smallEtale.IsBasic, and the dense-subsite instance for the affinoid étale basis: not
--   stated here; need `AdicSpace.smallEtale` (supplier: AdicEtaleGeometry:A1/etale-site)

/-! ## AdicEtaleGeometry:A1/etale-covering-reduction (lemma) -/

-- AdicSpace.isSheaf_smallEtale_iff: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicEtaleGeometry:A1/etale-site)

/-! ## AdicEtaleGeometry:A1/etale-structure-sheaf (lemma) -/

-- AdicSpace.structureSheafEtale, AdicSpace.structureSheafEtalePlus,
--   AdicSpace.structureSheafEtale_obj_opens: not stated here; need `AdicSpace.smallEtaleTopology`
--   and the structure sheaf of adic spaces (supplier: AdicEtaleGeometry:A1/etale-site, AdicSpaces
--   Layer 5); the affinoid core of the finite étale equaliser is
--   `Huber.Pair.finiteEtale.equalizer_ring`

section EtaleStructureSheaf

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]
  (B : Type*) [CommRing B] [Algebra A B] [Module.Finite A B] [Algebra.Etale A B]

/-- A1/etale-structure-sheaf (affinoid core): for a surjective finite étale
`Spa(B, B⁺) → Spa(A, A⁺)`, that is `B` faithfully flat over `A`, the sequence
`A → B ⇉ B ⊗_A B` is an equaliser of topological rings: `A → B` is a closed embedding with
image `{b | b ⊗ 1 = 1 ⊗ b}`. -/
theorem Pair.finiteEtale.equalizer_ring [Module.FaithfullyFlat A B] :
    IsClosedEmbedding (algebraMap A (FiniteEtale A B)) ∧
      Set.range (algebraMap A B) = {b : B | b ⊗ₜ[A] (1 : B) = (1 : B) ⊗ₜ[A] b} := sorry

end EtaleStructureSheaf

/-! ## AdicEtaleGeometry:A1/slice-site (lemma) -/

-- AdicSpace.smallEtaleSliceEquiv, AdicSpace.smallEtaleSliceEquiv_topology: not stated here; need
--   `AdicSpace.smallEtale` (supplier: AdicEtaleGeometry:A1/etale-site)

/-! ## AdicEtaleGeometry:A1/strict-localisation (construction) -/

-- AdicSpace.GeometricPoint.Neighbourhood: not stated here; needs `AdicSpace.GeometricPoint.fiber`
--   (supplier: AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.GeometricPoint.isCofiltered_neighbourhood: not stated here; needs
--   `AdicSpace.GeometricPoint.fiber` (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points)
-- AdicSpace.strictLocalization: not stated here; needs `AdicSpace.smallEtale` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.strictLocalization.eval: not stated here; needs presheaves on `AdicSpace.smallEtale`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.strictLocalization.eval_iso_sheafFiber: not stated here; needs sheaves on
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.strictLocalization.openNeighbourhood_final: not stated here; needs open subspaces of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.GeometricPoint.localRing: not stated here; needs `AdicSpace.structureSheafEtale`
--   (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.GeometricPoint.localRing_toField: not stated here; needs
--   `AdicSpace.GeometricPoint.localRing` (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf)
-- AdicSpace.strictLocalization.space: not stated here; needs underlying spaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.strictLocalization.map: not stated here; needs `AdicSpace.smallEtale.map` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.strictLocalization.test_algClosed: not stated here; needs
--   `AdicSpace.strictLocalization`
--   (supplier: AdicEtaleGeometry:A1/etale-site) [degenerate test]
-- AdicSpace.strictLocalization.test_field: not stated here; needs
--   `AdicSpace.GeometricPoint.localRing`
--   (supplier: AdicEtaleGeometry:A1/etale-structure-sheaf) [computation test]
-- AdicSpace.strictLocalization.test_constant_stalk: not stated here; needs sheaves on
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site) [computation test]
-- AdicSpace.strictLocalization.test_higher_rank_point: not stated here; needs
--   `AdicSpace.strictLocalization.space` (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.strictLocalization.test_stalk_eq_sheafFiber: not stated here; needs sheaves on
--   `AdicSpace.smallEtaleTopology` (supplier: AdicEtaleGeometry:A1/etale-site) [compatibility test]

/-! ## AdicEtaleGeometry:A1/strict-localisation-analytic (theorem) -/

-- AdicSpace.GeometricPoint.localRing_henselian, AdicSpace.GeometricPoint.residueField_isSepClosed,
--   AdicSpace.strictLocalization.space_homeomorph: not stated here; need
--   `AdicSpace.GeometricPoint.localRing` and `AdicSpace.strictLocalization.space` (supplier:
--   AdicEtaleGeometry:A1/strict-localisation)

/-! ## AdicEtaleGeometry:A1/etale-site-generalized (construction) -/

-- YonedaAdicSpace.IsFiniteEtale: not stated here; needs the category `YonedaAdicSpace` with its
--   open immersions and `Spa^Y` (supplier: AdicEtaleGeometry:A1/generalized-adic-presentation,
--   later in packet order)
-- YonedaAdicSpace.IsEtaleLocalDescription: not stated here; needs `YonedaAdicSpace` (supplier:
--   AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.smallEtale: not stated here; needs `YonedaAdicSpace` (supplier:
--   AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.smallEtaleTopology: not stated here; needs `YonedaAdicSpace` (supplier:
--   AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.smallFiniteEtale: not stated here; needs `YonedaAdicSpace` (supplier:
--   AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.finiteEtaleEquiv: not stated here; needs `YonedaAdicSpace` and `Spa^Y`
--   (supplier: AdicEtaleGeometry:A1/generalized-adic-presentation); its ring-level core is
--   `Huber.Pair.finiteEtale.homEquiv`
-- YonedaAdicSpace.IsEtaleLocalDescription.baseChange: not stated here; needs fibre products of
--   Yoneda-adic spaces (supplier: AdicEtaleGeometry:A1/yoneda-adic-fibre-products)
-- YonedaAdicSpace.IsEtaleLocalDescription.comp: not stated here; needs `YonedaAdicSpace`
--   (supplier: AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.smallEtale_equiv_of_isLocallyStronglySheafy: not stated here; needs
--   `AdicSpace.smallEtale` and `YonedaAdicSpace` (supplier: AdicEtaleGeometry:A1/etale-site,
--   AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces)
-- YonedaAdicSpace.hasEnoughPoints_smallEtaleTopology: not stated here; needs `YonedaAdicSpace`
--   (supplier: AdicEtaleGeometry:A1/generalized-adic-presentation)
-- YonedaAdicSpace.smallFiniteEtale.test_affinoid: not stated here; needs `YonedaAdicSpace` and
--   `Spa^Y` (supplier: AdicEtaleGeometry:A1/generalized-adic-presentation) [characterisation test]
-- YonedaAdicSpace.smallEtale.test_eq_adic: not stated here; needs `AdicSpace.smallEtale` and
--   `YonedaAdicSpace` (supplier: AdicEtaleGeometry:A1/etale-site) [compatibility test]
-- YonedaAdicSpace.smallEtale.test_opens: not stated here; needs `YonedaAdicSpace` (supplier:
--   AdicEtaleGeometry:A1/generalized-adic-presentation) [degenerate test]
-- YonedaAdicSpace.smallEtale.test_adic_objects_insufficient: not stated here; needs
--   `YonedaAdicSpace` and `Huber.IsSheafyRing` (supplier: AdicEtaleGeometry:A1/generalized-adic-
--   presentation, AdicSpaces Layer 4) [non-example test]

end Huber

end TauCeti

end

/-! # Stage A1 (part b). The pro-étale site, profinite G-sets and Yoneda-adic presentations -/

noncomputable section

namespace TauCeti

open CategoryTheory Limits Topology Opposite

/-! ## AdicEtaleGeometry:A1/pro-etale-morphism (definition) -/

/- A1/pro-etale-morphism (Scholze 2013, Definition 3.9 and Proposition 3.2): the category
`pro-X_ét` of a locally noetherian analytic adic space `X` and its étale, finite étale, surjective
and pro-étale morphisms. Everything here needs the anchor's category of adic spaces and the small
étale site `X_ét` of AdicEtaleGeometry:A1/etale-site; the pro-category is `(Ind Cᵒᵖ)ᵒᵖ` over
Mathlib's `CategoryTheory.Ind` (DiamondsAndVStacks:D0 names it `CategoryTheory.Pro`). -/

-- AdicSpace.ProEtale.ProEt: not stated here; needs the anchor's category of adic spaces and the
--   small étale site `X_ét` (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.ProEt.const: not stated here; needs the small étale site `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.ProEt.hom_const_equiv: not stated here; needs the small étale site `X_ét`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.ProEt.space: not stated here; needs the underlying spaces of objects of
--   `X_ét` (supplier: AdicSpaces Layer 5)
-- AdicSpace.ProEtale.IsEtale: not stated here; needs the small étale site `X_ét` and its fibre
--   products (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.IsFiniteEtale: not stated here; needs finite étale morphisms of adic spaces
--   (supplier: AdicEtaleGeometry:A1/finite-etale-morphism)
-- AdicSpace.ProEtale.IsProEtale: not stated here; needs the small étale site `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.IsEtale.isProEtale: not stated here; needs the small étale site `X_ét`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.isEtale_const: not stated here; needs the small étale site `X_ét`
--   (supplier: AdicEtaleGeometry:A1/etale-site)
-- AdicSpace.ProEtale.IsSurjective: not stated here; needs the underlying spaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- ProEtale.test_const_etale: not stated here; needs the small étale site `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-site) [degenerate test]
-- ProEtale.test_kummer_tower: not stated here; needs the anchor's adic spaces
--   `Spa(K⟨T^{±1/p^n}⟩)` and their étale site (supplier: AdicSpaces Layer 5) [computation test]
-- ProEtale.test_kummer_not_etale: not stated here; needs the anchor's adic spaces and their étale
--   site (supplier: AdicSpaces Layer 5) [non-example test]
-- ProEtale.test_hom_const: not stated here; needs the small étale site `X_ét` (supplier:
--   AdicEtaleGeometry:A1/etale-site) [characterisation test]

/-! ## AdicEtaleGeometry:A1/finite-etale-tower (definition) -/

/- A1/finite-etale-tower (Scholze 2013 erratum, item (1); Mathlib
`MorphismProperty.transfiniteCompositions`): finite-étale towers in `pro-X_ét`. Their profinite
shadow — transfinite compositions of pullbacks of surjections of finite sets — is stated in
A1/transfinite-tower-splitting (`TauCeti.Profinite.finiteSurjPullbacks`) and, equivariantly, in
A1/profinite-g-sets-site (`TauCeti.ProfiniteGSet.IsGTower`). -/

-- AdicSpace.ProEtale.FetTower: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.FetTower.comp: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.IsFetTower: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.IsFetTower.of_finiteEtale_surjective: not stated here; needs `pro-X_ét`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.IsFetTower.comp: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.IsFetTower.baseChange: not stated here; needs `pro-X_ét` and its fibre
--   products (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.IsFetTower.surjective: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.isFetTower_iff_transfiniteCompositions: not stated here; needs `pro-X_ét`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism); the same shape for profinite sets is the
--   hypothesis of `TauCeti.Profinite.exists_section_of_transfiniteTower`
-- AdicSpace.ProEtale.IsFetTower.isProEtale: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.isFetTower_of_countable: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- FetTower.test_kummer: not stated here; needs the anchor's adic spaces and `pro-X_ét`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism) [computation test]
-- FetTower.test_length_le_one: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism) [degenerate test]
-- FetTower.test_open_immersion: not stated here; needs `pro-X_ét` and open subspaces of adic
--   spaces (supplier: AdicEtaleGeometry:A1/pro-etale-morphism) [non-example test]
-- FetTower.test_nonsplit_surjection: not stated here; needs `pro-X_ét` over `Spa(C, O_C)`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism); its profinite core is
--   `TauCeti.Profinite.exists_isOpenMap_surjective_not_split` with
--   `TauCeti.Profinite.exists_section_of_transfiniteTower` [non-example test]
-- FetTower.test_mathlib_shape: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism) [compatibility test]

/-! ## AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale (lemma) -/

-- AdicSpace.ProEtale.IsFetTower.exists_finite_presentation (A1/finite-etale-tower-is-pro-etale,
--   parts (a), (b)): not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtale.isFetTower_of_countable (A1/finite-etale-tower-is-pro-etale, part (c)): not
--   stated here; needs `pro-X_ét` (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/transfinite-tower-splitting (lemma) -/

namespace Profinite

/-- A1/transfinite-tower-splitting (supporting): the continuous maps `S₁ → S` of profinite sets
that are the pullback of a surjection `A → B` of finite sets along a continuous map `S → B`. -/
def finiteSurjPullbacks : MorphismProperty Profinite.{0} := fun S₁ S f ↦
  ∃ (A B : Profinite.{0}) (_ : Finite A) (_ : Finite B) (g : A ⟶ B) (h : S ⟶ B) (k : S₁ ⟶ A),
    Function.Surjective g ∧ IsPullback k f g h

/-- A1/transfinite-tower-splitting (Scholze 2013 erratum, replacing Proposition 3.7(i)): a
continuous map `f : S → S'` of profinite sets which is a transfinite tower
`S = lim_{μ<λ} S_μ`, `S_0 = S'`, each `S_μ → lim_{μ'<μ} S_{μ'}` a pullback of a surjection of
finite sets, has a continuous section. Towers are limits, so they are transfinite compositions
in `Profiniteᵒᵖ` (Mathlib `MorphismProperty.transfiniteCompositions`). -/
theorem exists_section_of_transfiniteTower {S S' : Profinite.{0}} (f : S ⟶ S')
    (hf : MorphismProperty.transfiniteCompositions.{0} finiteSurjPullbacks.op f.op) :
    ∃ σ : S' ⟶ S, σ ≫ f = 𝟙 S' := sorry

/-- A1/transfinite-tower-splitting (the printed Proposition 3.7(i) is false; Ribes–Zalesskii,
Example 5.6.9, cited in the erratum): an open continuous surjection of profinite sets need not
have a continuous section. -/
theorem exists_isOpenMap_surjective_not_split :
    ∃ (S S' : Profinite.{0}) (f : S ⟶ S'), IsOpenMap f ∧ Function.Surjective f ∧
      ¬ ∃ σ : S' ⟶ S, σ ≫ f = 𝟙 S' := sorry

end Profinite

-- AdicSpace.ProEtale.IsFetTower.exists_section_of_point (A1/transfinite-tower-splitting,
--   consequence over `Spa(C, O_C)`): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/profinite-group-tower (lemma) -/

/-- A1/profinite-group-tower (a): a profinite group `G` is a transfinite tower of finite
extensions: there are a well-ordered `J` and a decreasing family of closed normal subgroups `N_j`
with `N_⊥ = G`, `⋂ N_j = 1` and `N_{<j} / N_j` finite, where `N_{<j} = ⋂_{i<j} N_i`. Parts (b),
(c) are `TauCeti.ProfiniteGSet.isGTower_quotientMap` under A1/profinite-g-sets-site. -/
theorem ProfiniteGrp.exists_transfiniteFiltration (G : ProfiniteGrp.{0}) :
    ∃ (J : Type) (_ : LinearOrder J) (_ : OrderBot J) (_ : WellFoundedLT J) (N : J → Subgroup G),
      Antitone N ∧ N ⊥ = ⊤ ∧ (∀ j, (N j).Normal ∧ IsClosed (N j : Set G)) ∧ (⨅ j, N j) = ⊥ ∧
        ∀ j, (N j).relIndex (⨅ i ∈ Set.Iio j, N i) ≠ 0 := sorry

/-! ## AdicEtaleGeometry:A1/pro-etale-base-change (lemma) -/

-- AdicSpace.ProEtale.IsProEtale.baseChange, AdicSpace.ProEtale.IsEtale.baseChange,
--   AdicSpace.ProEtale.surjective_space_pullback (A1/pro-etale-base-change, Scholze 2013
--   Lemma 3.10(i)): not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/pro-etale-etale-composition (lemma) -/

-- AdicSpace.ProEtale.IsEtale.comp, AdicSpace.ProEtale.IsFiniteEtale.comp
--   (A1/pro-etale-etale-composition, Scholze 2013 Lemma 3.10(ii)): not stated here; needs
--   `pro-X_ét` (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/pro-etale-quasicompact-opens (lemma) -/

-- AdicSpace.ProEtale.exists_isEtale_range_space_eq,
--   AdicSpace.ProEtaleSite.factors_through_openSubobject_iff (A1/pro-etale-quasicompact-opens,
--   Scholze 2013 Lemma 3.10(iii)): not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/pro-etale-maps-open (lemma) -/

-- AdicSpace.ProEtale.IsProEtale.isOpenMap (A1/pro-etale-maps-open, Scholze 2013
--   Lemma 3.10(iv)): not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/pro-etale-surjective-etale-descent (lemma) -/

-- AdicSpace.ProEtale.IsEtale.exists_const_of_surjective (A1/pro-etale-surjective-etale-descent,
--   Scholze 2013 Lemma 3.10(v)): not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/pro-etale-composition (lemma) -/

-- AdicSpace.ProEtale.IsProEtale.comp, AdicSpace.ProEtale.IsProEtale.exists_etale_comp_limit
--   (A1/pro-etale-composition, Scholze 2013 Lemma 3.10(vi)): not stated here; needs `pro-X_ét`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/etale-locally-finitely-many-components (lemma) -/

-- AdicSpace.EtaleSite.finite_connectedComponents_of_affinoid
--   (A1/etale-locally-finitely-many-components): not stated here; needs the anchor's adic
--   spaces and `X_ét` (supplier: AdicEtaleGeometry:A1/etale-site). Its affinoid core is
--   `TauCeti.Huber.finite_connectedComponents_spa` and
--   `TauCeti.Huber.isClopen_spa_iff_exists_isIdempotentElem` below.

namespace Huber

section Components

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] [IsStronglyNoetherian A]

/-- A1/etale-locally-finitely-many-components (affinoid core): for a complete strongly noetherian
Tate pair `(B, B⁺)`, `Spa(B, B⁺)` has finitely many connected components. -/
theorem finite_connectedComponents_spa (S : Pair A) :
    Finite (ConnectedComponents (ValuationSpectrum.spa S.plus)) := sorry

/-- A1/etale-locally-finitely-many-components (affinoid core): for a complete strongly noetherian
Tate pair, the open and closed subsets of `Spa(B, B⁺)` are the loci `{v | v(e) ≠ 0}` of the
idempotents `e` of `B`. -/
theorem isClopen_spa_iff_exists_isIdempotentElem (S : Pair A)
    (U : Set (ValuationSpectrum.spa S.plus)) :
    IsClopen U ↔ ∃ e : A, IsIdempotentElem e ∧ U = {v | ¬ v.1.toValuativeRel.vle e 0} := sorry

end Components

end Huber

/-! ## AdicEtaleGeometry:A1/pro-etale-finite-limits (lemma) -/

-- AdicSpace.ProEtaleSite.hasEqualizers, AdicSpace.ProEtaleSite.hasPullbacks
--   (A1/pro-etale-finite-limits, Scholze 2013 Lemma 3.10(vii)): not stated here; needs
--   `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/etale-over-tower-swap (lemma) -/

-- AdicSpace.ProEtale.IsFetTower.exists_swap_etale (A1/etale-over-tower-swap): not stated here;
--   needs `pro-X_ét` (supplier: AdicEtaleGeometry:A1/pro-etale-morphism)

/-! ## AdicEtaleGeometry:A1/corrected-covers-pretopology (lemma) -/

-- AdicSpace.ProEtaleSite.coveringPretopology (A1/corrected-covers-pretopology, Scholze 2013
--   erratum): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected). Its equivariant profinite counterpart is
--   `TauCeti.ProfiniteGSet.pretopology`.

/-! ## AdicEtaleGeometry:A1/pro-etale-site-corrected (construction) -/

/- A1/pro-etale-site-corrected (Scholze 2013, Definition 3.9 with the erratum's corrected
coverings): the full subcategory of `pro-X_ét` on objects pro-étale over `X`, with the
Grothendieck topology `Pretopology.toGrothendieck` of the corrected coverings. -/

-- AdicSpace.ProEtaleSite: not stated here; needs `pro-X_ét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtaleSite.topology: not stated here; needs `X_proét` and its fibre products
--   (supplier: AdicEtaleGeometry:A1/pro-etale-finite-limits)
-- AdicSpace.ProEtaleSite.mem_topology_iff: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtaleSite.isCovering_of_etale: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtaleSite.isCovering_of_isFetTower: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-tower)
-- AdicSpace.ProEtaleSite.isCovering_of_countable: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale)
-- AdicSpace.ProEtaleSite.topology_le_printed: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism)
-- AdicSpace.ProEtaleSite.hasFiniteLimits: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-finite-limits)
-- AdicSpace.ProEtaleSite.space: not stated here; needs the underlying spaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.ProEtaleSite.isOpenMap_of_mem_covering: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-maps-open)
-- AdicSpace.ProEtaleSite.ne_scheme_proetale: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism); a documentation item: no identification with
--   Mathlib's `AlgebraicGeometry.Scheme.proetaleTopology` (schemes weakly étale over a base, fpqc
--   covers) is asserted
-- ProEtaleSite.test_point: not stated here; needs `X_proét` over `Spa(C, O_C)` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism); its profinite counterpart is the test
--   ProfiniteGSet.test_trivial_group [computation test]
-- ProEtaleSite.test_nonsplit_not_cover: not stated here; needs `X_proét` over `Spa(C, O_C)`
--   (supplier: AdicEtaleGeometry:A1/pro-etale-morphism); its profinite counterpart is the test
--   ProfiniteGSet.test_nonsplit [non-example test]
-- ProEtaleSite.test_countable_unchanged: not stated here; needs the anchor's adic spaces and
--   `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-morphism) [compatibility test]
-- ProEtaleSite.test_etale_cover: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-morphism) [degenerate test]
-- ProEtaleSite.test_geometric_stalk_not_conservative: not stated here; needs `X_proét` over
--   `Spa(C, O_C)` (supplier: AdicEtaleGeometry:A1/pro-etale-morphism) [non-example test]

/-! ## AdicEtaleGeometry:A1/proetale-projection-nu (lemma) -/

-- AdicSpace.ProEtaleSite.const, AdicSpace.ProEtaleSite.const_isContinuous,
--   AdicSpace.ProEtaleSite.nuPullback (A1/proetale-projection-nu): not stated here; needs `X_ét`
--   and `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/nu-pullback-sections-qcqs (lemma) -/

-- AdicSpace.ProEtaleSite.nuPullback_obj_eq_colimit,
--   AdicSpace.ProEtaleSite.nuPullback_fullyFaithful (A1/nu-pullback-sections-qcqs, Scholze 2013
--   Lemma 3.16 in degree 0): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/profinite-g-sets-site (construction) -/

/-- A1/profinite-g-sets-site (Scholze 2013, Definition 3.4 with the erratum): the category
`G-pfsets` of profinite sets with a continuous action of the topological group `G` and
continuous `G`-maps, as Mathlib's `ContAction Profinite G`. It is used for profinite `G`. -/
abbrev ProfiniteGSet (G : Type) [Group G] [TopologicalSpace G] : Type 1 :=
  ContAction Profinite.{0} G

namespace ProfiniteGSet

section Basic

variable {G : Type} [Group G] [TopologicalSpace G]

/-- A1/profinite-g-sets-site (supporting): the underlying topological space of a profinite
`G`-set, with its `G`-action (`Action`'s `MulAction` on the image in `TopCat`). -/
abbrev carrier (S : ProfiniteGSet G) : TopCat := (forget₂ _ TopCat).obj S.obj

/-- A1/profinite-g-sets-site (supporting): the continuous map underlying a `G`-map. -/
abbrev carrierMap {S T : ProfiniteGSet G} (f : S ⟶ T) : carrier S ⟶ carrier T :=
  (forget₂ _ TopCat).map f.hom

variable (G)

/-- A1/profinite-g-sets-site (supporting): the `G`-maps `S₁ → S` that are the pullback of a
surjection `A → B` of finite `G`-sets along a `G`-map `S → B`. -/
def surjPullbacks : MorphismProperty (ProfiniteGSet G) := fun S₁ S f ↦
  ∃ (A B : ProfiniteGSet G) (_ : Finite (carrier A)) (_ : Finite (carrier B)) (g : A ⟶ B)
    (h : S ⟶ B) (k : S₁ ⟶ A), Function.Surjective (carrierMap g) ∧ IsPullback k f g h

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.IsGEtale`): `S₁ → S` is *`G`-étale* if it is the
pullback of a map of finite `G`-sets along a `G`-map `S → B` with `B` finite. -/
def IsGEtale : MorphismProperty (ProfiniteGSet G) := fun S₁ S f ↦
  ∃ (A B : ProfiniteGSet G) (_ : Finite (carrier A)) (_ : Finite (carrier B)) (g : A ⟶ B)
    (h : S ⟶ B) (k : S₁ ⟶ A), IsPullback k f g h

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.IsGTower`): `S₁ → S` is a *`G`-tower* if
`S₁ = lim_{μ<λ} S_μ` with `S_0 = S` and every `S_μ → lim_{μ'<μ} S_{μ'}` a pullback of a
surjection of finite `G`-sets, i.e. its opposite is a transfinite composition of opposites of
`surjPullbacks` (the erratum's corrected covering condition). -/
def IsGTower : MorphismProperty (ProfiniteGSet G) := fun _ _ f ↦
  MorphismProperty.transfiniteCompositions.{0} (surjPullbacks G).op f.op

/-- A1/profinite-g-sets-site (instance): `G-pfsets` has fibre products, computed on underlying
profinite sets. -/
instance hasPullbacks : HasPullbacks (ProfiniteGSet G) := sorry

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.pretopology`): the corrected coverings: a family
`{f_i : S_i → S}` covers if the `f_i` are jointly surjective and each `f_i` is a `G`-tower followed
by a `G`-étale map. They form a pretopology (the printed Definition 3.4, all families of open
maps, is replaced). -/
def pretopology : Pretopology (ProfiniteGSet G) where
  coverings S := {R | (∀ s : carrier S, ∃ (Y : ProfiniteGSet G) (f : Y ⟶ S), R f ∧
      s ∈ Set.range (carrierMap f)) ∧
    ∀ ⦃Y : ProfiniteGSet G⦄ (f : Y ⟶ S), R f → ∃ (W : ProfiniteGSet G) (t : Y ⟶ W) (e : W ⟶ S),
      IsGTower G t ∧ IsGEtale G e ∧ t ≫ e = f}
  has_isos := sorry
  pullbacks := sorry
  transitive := sorry

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.sheafF`): for a topological `G`-module `M`, the
sheaf of abelian groups `F_M(S) = Hom_{cont, G}(S, M)` on `G-pfsets` (Scholze 2013, after
Definition 3.4); its values are `ProfiniteGSet.sheafF_apply`. -/
def sheafF (M : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DistribMulAction G M] [ContinuousSMul G M] :
    Sheaf (pretopology G).toGrothendieck AddCommGrpCat.{0} := sorry

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.sheafF_apply`): `F_M(S)` is the group of
continuous `G`-equivariant maps `S → M`. -/
def sheafF_apply (M : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [DistribMulAction G M] [ContinuousSMul G M] (S : ProfiniteGSet G) :
    ((sheafF G M).obj.obj (op S)) ≃ {f : C(carrier S, M) // ∀ (g : G) (s : carrier S),
      f (g • s) = g • f s} := sorry

end Basic

open scoped FintypeCatDiscrete in
/-- A1/profinite-g-sets-site (api `ProfiniteGSet.equivPro`): every profinite `G`-set is the
cofiltered limit of its finite quotients, and `G-pfsets ≃ Pro(G-fsets)`, with
`Pro(C) = (Ind Cᵒᵖ)ᵒᵖ` over Mathlib's `Ind`. -/
def equivPro (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] :
    ProfiniteGSet G ≌ (Ind (ContAction FintypeCat.{0} G)ᵒᵖ)ᵒᵖ := sorry

/-- A1/profinite-g-sets-site (api `ProfiniteGSet.forgetTrivial`): for the trivial group the
underlying category is `Profinite`. -/
def forgetTrivial : ProfiniteGSet PUnit ≌ Profinite.{0} := sorry

section Quotient

variable (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G]

/-- A1/profinite-group-tower (supporting instance): the quotient of a profinite group by a closed
subgroup is totally disconnected. -/
instance totallyDisconnectedSpace_quotient (H : Subgroup G) [IsClosed (H : Set G)] :
    TotallyDisconnectedSpace (G ⧸ H) := sorry

/-- A1/profinite-group-tower (supporting): the profinite `G`-set `G/H` of a closed subgroup `H`,
with `G` acting by left translation. -/
def quotient (H : Subgroup G) [IsClosed (H : Set G)] : ProfiniteGSet G :=
  ⟨{ V := Profinite.of (G ⧸ H)
     ρ := { toFun := fun g ↦ CompHausLike.ofHom _ ⟨fun x ↦ g • x, continuous_const_smul g⟩
            map_one' := sorry
            map_mul' := sorry } }, sorry⟩

/-- A1/profinite-group-tower (supporting): the `G`-map `G/H → G/K`, `gH ↦ gK`, for closed
subgroups `H ≤ K`. -/
def quotientMap {H K : Subgroup G} [IsClosed (H : Set G)] [IsClosed (K : Set G)] (h : H ≤ K) :
    quotient G H ⟶ quotient G K :=
  ObjectProperty.homMk
    { hom := CompHausLike.ofHom _ ⟨Subgroup.quotientMapOfLE h, sorry⟩
      comm := sorry }

/-- A1/profinite-group-tower (supporting): the closed subgroup `⊤`. -/
instance isClosed_top : IsClosed ((⊤ : Subgroup G) : Set G) := sorry

/-- A1/profinite-group-tower (supporting): the closed subgroup `⊥`. -/
instance isClosed_bot : IsClosed ((⊥ : Subgroup G) : Set G) := sorry

/-- A1/profinite-g-sets-site (supporting): the one-point `G`-set `G/G`. -/
abbrev pt : ProfiniteGSet G := quotient G ⊤

/-- A1/profinite-g-sets-site (supporting): `G` acting on itself by left translation, as `G/1`. -/
abbrev regular : ProfiniteGSet G := quotient G ⊥

/-- A1/profinite-g-sets-site (supporting): the `G`-map `G → pt`. -/
abbrev toPt : regular G ⟶ pt G := quotientMap G bot_le

/-- A1/profinite-group-tower (b), (c): for closed subgroups `H ≤ K` of a profinite group, the
`G`-map `G/H → G/K` is a `G`-tower (for `H` of finite index in `K` a single pullback of a
surjection of finite `G`-sets); for `H = 1` this is `G → G/K`, and `{G → pt}` is a covering of
`G-pfsets`. -/
theorem isGTower_quotientMap {H K : Subgroup G} [IsClosed (H : Set G)] [IsClosed (K : Set G)]
    (h : H ≤ K) : IsGTower G (quotientMap G h) := sorry

/-- A1/profinite-group-tower (c): `{G → pt}` is a covering of `G-pfsets`. -/
theorem singleton_toPt_mem_pretopology :
    Presieve.singleton (toPt G) ∈ pretopology G (pt G) := sorry

end Quotient

end ProfiniteGSet

namespace FiniteGSet

open scoped FintypeCatDiscrete

variable (G : Type) [Group G] [TopologicalSpace G]

/-- A1/profinite-g-sets-site (api `FiniteGSet.site`): the site `G-fsets` of finite discrete sets
with continuous `G`-action (Mathlib `ContAction FintypeCat G`), whose coverings are the jointly
surjective families. -/
def site : GrothendieckTopology (ContAction FintypeCat.{0} G) :=
  Coverage.toGrothendieck
    { coverings := fun X ↦ {R | ∀ x : (forget₂ _ TopCat).obj X.obj, ∃ (Y : ContAction FintypeCat G)
        (f : Y ⟶ X), R f ∧ x ∈ Set.range ((forget₂ _ TopCat).map f.hom)}
      pullback := sorry }

/-- A1/profinite-g-sets-site (supporting): the inclusion `G-fsets ⥤ G-pfsets` (finite discrete
sets are profinite). -/
def toProfiniteGSet : ContAction FintypeCat.{0} G ⥤ ProfiniteGSet G := sorry

/-- A1/profinite-g-sets-site (api `FiniteGSet.site`, second half): the inclusion of `G-fsets`
into `G-pfsets` preserves coverings: jointly surjective families of maps of finite `G`-sets are
corrected coverings (a surjection of finite `G`-sets is a `G`-tower of length one). -/
theorem site_le_pretopology {X : ContAction FintypeCat.{0} G} (R : Presieve X)
    (hR : Sieve.generate R ∈ site G X) :
    Sieve.generate (R.map (toProfiniteGSet G)) ∈
      (ProfiniteGSet.pretopology G).toGrothendieck ((toProfiniteGSet G).obj X) := sorry

end FiniteGSet

section ProfiniteGSetTests

open ProfiniteGSet

variable (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G] (M : Type) [AddCommGroup M] [TopologicalSpace M]
  [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]

-- test ProfiniteGSet.test_FM_on_G (computation) [A1/profinite-g-sets-site]
example : Nonempty ((sheafF G M).obj.obj (op (regular G)) ≃ C(G, M)) ∧
    Nonempty ((sheafF G M).obj.obj (op (pt G)) ≃ {m : M // ∀ g : G, g • m = m}) := sorry

/- `G = 1`: the summand inclusions of `S₁ ⊔ S₂` cover it, and the empty family covers an empty
profinite set. -/
-- test ProfiniteGSet.test_summands (degenerate) [A1/profinite-g-sets-site]
example (S₁ S₂ : ProfiniteGSet PUnit) [HasBinaryCoproduct S₁ S₂] :
    (Presieve.singleton (coprod.inl : S₁ ⟶ S₁ ⨿ S₂) ⊔ Presieve.singleton coprod.inr) ∈
        pretopology PUnit (S₁ ⨿ S₂) ∧
      ∀ S : ProfiniteGSet PUnit, IsEmpty (carrier S) → (⊥ : Presieve S) ∈ pretopology PUnit S :=
  sorry

/- `G = 1`: the category is `Profinite`, and a covering family has continuous sections locally on
a finite clopen partition of the target. -/
-- test ProfiniteGSet.test_trivial_group (compatibility) [A1/profinite-g-sets-site]
example : Nonempty (ProfiniteGSet PUnit ≌ Profinite.{0}) ∧
    ∀ (S : ProfiniteGSet PUnit) (R : Presieve S), R ∈ pretopology PUnit S →
      ∃ (n : ℕ) (U : Fin n → Set (carrier S)), (∀ i, IsClopen (U i)) ∧ (⋃ i, U i) = Set.univ ∧
        ∀ i, ∃ (Y : ProfiniteGSet PUnit) (f : Y ⟶ S) (σ : C(U i, carrier Y)), R f ∧
          ∀ x, carrierMap f (σ x) = x := sorry

/- `G = 1`: an open continuous surjection of profinite sets without continuous section
(Ribes–Zalesskii, Example 5.6.9) is not a covering, although it was one for the printed
Definition 3.4. -/
-- test ProfiniteGSet.test_nonsplit (non-example) [A1/profinite-g-sets-site]
example : ∃ (S S' : ProfiniteGSet PUnit) (f : S ⟶ S'), IsOpenMap (carrierMap f) ∧
    Function.Surjective (carrierMap f) ∧ Presieve.singleton f ∉ pretopology PUnit S' := sorry

/- `{G → pt}` is a covering; for a nontrivial finite discrete group (e.g. `ℤ/2` acting on itself)
it has no `G`-equivariant section, so coverings of `G-pfsets` need not split equivariantly. -/
-- test ProfiniteGSet.test_G_to_pt (characterisation) [A1/profinite-g-sets-site]
example : Presieve.singleton (toPt G) ∈ pretopology G (pt G) ∧
    ([Finite G] → [DiscreteTopology G] → [Nontrivial G] →
      ¬ ∃ σ : pt G ⟶ regular G, σ ≫ toPt G = 𝟙 _) := sorry

end ProfiniteGSetTests

/-! ## AdicEtaleGeometry:A1/open-surjection-profinite-structure (lemma) -/

namespace ProfiniteGSet

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [TotallyDisconnectedSpace G]

/-- A1/open-surjection-profinite-structure (Scholze 2013, Lemma 3.6): an open surjective map
`S → S'` of profinite `G`-sets is a cofiltered limit, over `S'`, of pullbacks
`T_i = A_i ×_{B_i} S'` of surjections of finite `G`-sets (`surjPullbacks`); it need not be a
`G`-tower (A1/transfinite-tower-splitting). -/
theorem exists_limit_of_isOpenMap_surjective {S S' : ProfiniteGSet G} (f : S ⟶ S')
    (hopen : IsOpenMap (carrierMap f)) (hsurj : Function.Surjective (carrierMap f)) :
    ∃ (I : Type) (_ : SmallCategory I) (_ : IsCofiltered I) (T : I ⥤ Over S') (c : Cone T),
      (∀ i, surjPullbacks G (T.obj i).hom) ∧ Nonempty (IsLimit c) ∧
        Nonempty (c.pt ≅ Over.mk f) := sorry

/-! ## AdicEtaleGeometry:A1/free-g-profinite-sections-exact (lemma) -/

/-- A1/free-g-profinite-sections-exact (Scholze 2013, Proposition 3.7(ii), first half): a
profinite `G`-set with free action is `T × G`, `T = S/G` with trivial action. -/
theorem prodEquiv_of_free (S : ProfiniteGSet G)
    (hfree : ∀ (g : G) (s : carrier S), g • s = s → g = 1) :
    ∃ (T : Type) (_ : TopologicalSpace T) (_ : CompactSpace T) (_ : T2Space T)
      (_ : TotallyDisconnectedSpace T) (e : carrier S ≃ₜ T × G),
      ∀ (g : G) (s : carrier S), e (g • s) = ((e s).1, g * (e s).2) := sorry

/-- A1/free-g-profinite-sections-exact (Scholze 2013, Proposition 3.7(ii), with corrected
coverings): for `S` with free action, `F ↦ F(S)` is exact on abelian sheaves on `G-pfsets`. -/
theorem sections_exact_of_free (S : ProfiniteGSet G)
    (hfree : ∀ (g : G) (s : carrier S), g • s = s → g = 1) :
    PreservesFiniteLimits (sheafToPresheaf (pretopology G).toGrothendieck AddCommGrpCat.{0} ⋙
        (evaluation _ _).obj (op S)) ∧
      PreservesFiniteColimits (sheafToPresheaf (pretopology G).toGrothendieck AddCommGrpCat.{0} ⋙
        (evaluation _ _).obj (op S)) := sorry

end ProfiniteGSet

/-! ## AdicEtaleGeometry:A1/pro-finite-etale-site-corrected (construction) -/

/- A1/pro-finite-etale-site-corrected (Scholze 2013, Definition 3.3 with the erratum): the site
`X_profét = Pro(X_fét)` with the corrected coverings. It needs A1's finite étale site of an adic
space; its Galois-theoretic model is `TauCeti.ProfiniteGSet` (A1/profinite-etale-galois-sets). -/

-- AdicSpace.ProFetSite: not stated here; needs the finite étale site `X_fét` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.ProFetSite.topology: not stated here; needs the finite étale site `X_fét`
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.ProFetSite.toProEtaleSite: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected)
-- AdicSpace.ProFetSite.isCovering_of_isFetTower: not stated here; needs the finite étale site
--   `X_fét` (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.ProFetSite.isCovering_summands: not stated here; needs the finite étale site
--   `X_fét` (supplier: AdicEtaleGeometry:A1/finite-etale-site)
-- AdicSpace.ProFetSite.space: not stated here; needs the underlying spaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.ProFetSite.const: not stated here; needs the finite étale site `X_fét` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-site)
-- ProFetSite.test_field: not stated here; needs the finite étale site of `Spa(ℚ_p, ℤ_p)`
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site) [computation test]
-- ProFetSite.test_alg_closed: not stated here; needs the finite étale site of `Spa(C, C⁺)`
--   (supplier: AdicEtaleGeometry:A1/finite-etale-site) [degenerate test]
-- ProFetSite.test_summands: not stated here; needs the finite étale site `X_fét` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-site); its profinite counterpart is the test
--   ProfiniteGSet.test_summands [non-example test]
-- ProFetSite.test_inclusion: not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected) [compatibility test]

/-! ## AdicEtaleGeometry:A1/profinite-etale-galois-sets (theorem) -/

-- AdicSpace.ProFetSite.equivProfiniteGSet (A1/profinite-etale-galois-sets, Scholze 2013
--   Proposition 3.5): not stated here; needs `X_profét` and `π₁(X, x̄)` (supplier:
--   AdicEtaleGeometry:A1/finite-etale-galois-category); the target is
--   `TauCeti.ProfiniteGSet (π₁(X, x̄))` with `TauCeti.ProfiniteGSet.pretopology`

/-! ## AdicEtaleGeometry:A1/proetale-profinite-etale-morphism-of-sites (lemma) -/

-- AdicSpace.ProFetSite.isProEtale_iff_isOpenMap,
--   AdicSpace.ProFetSite.toProEtaleSite_isContinuous
--   (A1/proetale-profinite-etale-morphism-of-sites, Scholze 2013 Lemma 3.11): not stated here;
--   needs `X_profét` and `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/proetale-coherence (lemma) -/

-- AdicSpace.ProEtaleSite.isQuasicompact_of_affinoid, AdicSpace.ProEtaleSite.isAlgebraic
--   (A1/proetale-coherence, Scholze 2013 Proposition 3.12(i)–(iii)): not stated here; needs
--   `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected) and algebraic topoi
--   (supplier: DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos)

/-! ## AdicEtaleGeometry:A1/proetale-quasicompactness-detection (lemma) -/

-- AdicSpace.ProEtaleSite.isQuasicompact_iff, AdicSpace.ProEtaleSite.isQuasiseparated_iff
--   (A1/proetale-quasicompactness-detection, Scholze 2013 Proposition 3.12(iv)–(vii)): not
--   stated here; needs `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/proetale-fibre-morphism-of-topoi (lemma) -/

-- AdicSpace.ProEtaleSite.geometricFibre, AdicSpace.ProEtaleSite.pointPullback
--   (A1/proetale-fibre-morphism-of-topoi, Scholze 2013 Proposition 3.13, first sentence): not
--   stated here; needs `X_proét` and geometric points (supplier:
--   AdicEtaleGeometry:A1/etale-site-and-geometric-points); the target site is
--   `TauCeti.ProfiniteGSet G_x` with `TauCeti.ProfiniteGSet.pretopology`

/-! ## AdicEtaleGeometry:A1/proetale-fibre-conservativity (lemma) -/

-- AdicSpace.ProEtaleSite.eq_zero_of_forall_pointPullback_eq_zero
--   (A1/proetale-fibre-conservativity, Scholze 2013 Proposition 3.13, second sentence): not
--   stated here; needs `X_proét` (supplier: AdicEtaleGeometry:A1/proetale-fibre-morphism-of-topoi)

/-! ## AdicEtaleGeometry:A1/proetale-topos-enough-points (lemma) -/

-- AdicSpace.ProEtaleSite.hasEnoughPoints (A1/proetale-topos-enough-points, erratum item (2);
--   Mathlib `GrothendieckTopology.HasEnoughPoints`): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected). Its `G-pfsets` counterpart is stated below.

/-- A1/proetale-topos-enough-points (the same for `G-pfsets`): the site of profinite `G`-sets with
corrected coverings has enough points (Deligne, SGA 4 VI 9.0; the points are not identified). -/
theorem ProfiniteGSet.hasEnoughPoints (G : Type) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G] :
    GrothendieckTopology.HasEnoughPoints.{0} (ProfiniteGSet.pretopology G).toGrothendieck := sorry

/-! ## AdicEtaleGeometry:A1/proetale-slice (lemma) -/

-- AdicSpace.ProEtaleSite.overEquiv (A1/proetale-slice; Mathlib `GrothendieckTopology.over`):
--   not stated here; needs `X_proét` (supplier: AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/etale-descent-along-algebraic-extension (lemma) -/

-- AdicSpace.EtaleSite.fieldColimitEquiv (A1/etale-descent-along-algebraic-extension): not
--   stated here; needs the anchor's adic spaces locally of finite type over `Spa(K, K⁺)`, their
--   fibre products and étale sites (supplier: AdicSpaces Layer 5)

/-! ## AdicEtaleGeometry:A1/proetale-field-extension-slice (theorem) -/

-- AdicSpace.ProEtaleSite.fieldExtensionOverEquiv (A1/proetale-field-extension-slice, Scholze
--   2013 Proposition 3.15): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected)

/-! ## AdicEtaleGeometry:A1/profinite-set-objects (lemma) -/

-- AdicSpace.ProEtaleSite.prodProfinite, AdicSpace.ProEtaleSite.homProdProfiniteEquiv
--   (A1/profinite-set-objects): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected). Part (d) rests on
--   `TauCeti.Profinite.exists_isOpenMap_surjective_not_split`.

/-! ## AdicEtaleGeometry:A1/profinite-galois-cover-is-covering (lemma) -/

-- AdicSpace.ProEtaleSite.isFetTower_of_galois, AdicSpace.ProEtaleSite.sections_eq_invariants
--   (A1/profinite-galois-cover-is-covering): not stated here; needs `X_proét` (supplier:
--   AdicEtaleGeometry:A1/pro-etale-site-corrected). The group-theoretic input is
--   `TauCeti.ProfiniteGrp.exists_transfiniteFiltration`.

/-! ## AdicEtaleGeometry:A1/huber-pair-rational-site (construction) -/

open Huber in
/-- A1/huber-pair-rational-site (api `CAff`): the category of complete Hausdorff Huber pairs
`(A, A⁺)` (Tau Ceti `Huber.Pair` on a complete Hausdorff Huber ring) with the morphisms of Huber
pairs `Huber.Pair.Hom`. Rings live in `Type`, so `CAff : Type 1` with morphisms in `Type`. -/
structure CAff where
  /-- The complete Hausdorff Huber ring `A`. -/
  A : Type
  /-- The ring structure. -/
  [commRing : CommRing A]
  /-- The uniform structure. -/
  [uniformSpace : UniformSpace A]
  /-- `A` is a uniform additive group. -/
  [isUniformAddGroup : IsUniformAddGroup A]
  /-- `A` is a topological ring. -/
  [isTopologicalRing : IsTopologicalRing A]
  /-- `A` is a Huber ring. -/
  [isHuberRing : IsHuberRing A]
  /-- `A` is complete. -/
  [completeSpace : CompleteSpace A]
  /-- `A` is Hausdorff. -/
  [t2Space : T2Space A]
  /-- The ring of integral elements `A⁺`. -/
  P : Pair A

attribute [instance] CAff.commRing CAff.uniformSpace CAff.isUniformAddGroup
  CAff.isTopologicalRing CAff.isHuberRing CAff.completeSpace CAff.t2Space

namespace CAff

open Huber ValuationSpectrum

/-- A1/huber-pair-rational-site (instance): morphisms of `CAff` are morphisms of Huber pairs. -/
instance category : Category CAff where
  Hom R S := Pair.Hom R.P S.P
  id R := Pair.Hom.id R.P
  comp f g := Pair.Hom.comp g f
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- A1/huber-pair-rational-site (supporting): the object of `CAff` given by a complete Hausdorff
Huber pair. -/
abbrev of {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsHuberRing A] [CompleteSpace A] [T2Space A] (P : Pair A) : CAff :=
  { A := A, P := P }

/-- A1/huber-pair-rational-site (supporting): a morphism of Huber pairs as a morphism of `CAff`. -/
abbrev ofHom {A B : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [CommRing B]
    [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B]
    [T2Space B] {P : Pair A} {Q : Pair B} (f : Pair.Hom P Q) : of P ⟶ of Q := f

/-- A1/huber-pair-rational-site (supporting): the ring homomorphism underlying a morphism. -/
abbrev toRingHom {R S : CAff} (f : R ⟶ S) : R.A →+* S.A :=
  Pair.Hom.toRingHom (show Pair.Hom R.P S.P from f)

/-- A1/huber-pair-rational-site (supporting): `Spa(f) : Spa(S, S⁺) → Spa(R, R⁺)` (Tau Ceti
`Huber.Pair.Hom.spaComap`). -/
abbrev spaMap {R S : CAff} (f : R ⟶ S) : spa S.P.plus → spa R.P.plus :=
  Pair.Hom.spaComap (show Pair.Hom R.P S.P from f)

/-- A1/huber-pair-rational-site (supporting): `φ : (A, A⁺) → (B, B⁺)` is a *rational
localisation* of `(A, A⁺)` at `R(T/s)` (anchor Layer 3.1; Huber 1994 §1, Wedhorn Proposition
8.2): `Spa(φ)` lands in `R(T/s)`, and every morphism of complete Huber pairs out of `(A, A⁺)` whose
`Spa` lands in `R(T/s)` factors uniquely through `φ`. This characterises `(O(U), O⁺(U))`, the
completed `A⟨T/s⟩` with the integral closure of the image of `A⁺[T/s]`, up to unique isomorphism. -/
def IsRationalLocalization {R R' : CAff} (φ : R ⟶ R') (T : Finset R.A) (s : R.A) : Prop :=
  Set.range (Subtype.val ∘ spaMap φ) ⊆ rationalSubset R.P.plus T s ∧
    ∀ (S : CAff) (ψ : R ⟶ S), Set.range (Subtype.val ∘ spaMap ψ) ⊆ rationalSubset R.P.plus T s →
      ∃! χ : R' ⟶ S, φ ≫ χ = ψ

/-- A1/huber-pair-rational-site (supporting): rational data `(T_k, s_k)_{k<n}` define rational
subsets `R(T_k/s_k)` (each `T_k·A` open) covering `Spa(A, A⁺)`. -/
def IsRationalCovering (R : CAff) {n : ℕ} (T : Fin n → Finset R.A) (s : Fin n → R.A) : Prop :=
  (∀ k, IsOpen ((Ideal.span (T k : Set R.A) : Ideal R.A) : Set R.A)) ∧
    spa R.P.plus ⊆ ⋃ k, rationalSubset R.P.plus (T k) (s k)

/-- A1/huber-pair-rational-site (api `CAff.rationalCover`): the presieve on `(A, A⁺)ᵒᵖ` in `CAffᵒᵖ`
of the rational localisations `(A, A⁺) → (O(U_k), O⁺(U_k))` at the rational subsets
`U_k = R(T_k/s_k)`. It is a rational covering family when `IsRationalCovering R T s`; `n = 0` is a
covering exactly when `A = 0`. -/
def rationalCover (R : CAff) {n : ℕ} (T : Fin n → Finset R.A) (s : Fin n → R.A) :
    Presieve (op R) :=
  fun _ f ↦ ∃ k, IsRationalLocalization f.unop (T k) (s k)

/-- A1/huber-pair-rational-site (api `CAff.rationalCoverage`): the rational covering families form
a coverage on `CAffᵒᵖ` (Mathlib `CategoryTheory.Coverage`). -/
def rationalCoverage : Coverage CAffᵒᵖ where
  coverings X := {S | ∃ (n : ℕ) (T : Fin n → Finset X.unop.A) (s : Fin n → X.unop.A),
    IsRationalCovering X.unop T s ∧ S = rationalCover X.unop T s}
  pullback := sorry

/-- A1/huber-pair-rational-site (api `CAff.ratTopology`): the rational topology
`J_rat := rationalCoverage.toGrothendieck` on `CAffᵒᵖ`. -/
def ratTopology : GrothendieckTopology CAffᵒᵖ := rationalCoverage.toGrothendieck

/-- A1/huber-pair-rational-site (api `CAff.isSheaf_iff`; Mathlib `Presieve.isSheaf_coverage`): a
presheaf on `CAffᵒᵖ` is a `J_rat`-sheaf iff it satisfies the sheaf condition for all rational
covering families. -/
theorem isSheaf_iff (P : CAffᵒᵖᵒᵖ ⥤ Type*) :
    Presieve.IsSheaf ratTopology P ↔ ∀ (R : CAff) (n : ℕ) (T : Fin n → Finset R.A)
      (s : Fin n → R.A), IsRationalCovering R T s → Presieve.IsSheafFor P (rationalCover R T s) :=
  sorry

open scoped Classical in
/-- A1/huber-pair-rational-site (api `CAff.rationalCover_pullback`): for `φ : (A, A⁺) → (B, B⁺)`,
the preimages `R(φ(T_k)/φ(s_k))` of a rational covering of `Spa(A, A⁺)` form a rational covering
of `Spa(B, B⁺)` (Tau Ceti `Huber.Pair.Hom.spaComap_preimage_rationalSubset`), which refines the
pullback of the family. -/
theorem rationalCover_pullback {R R' : CAff} (φ : R ⟶ R') {n : ℕ} (T : Fin n → Finset R.A)
    (s : Fin n → R.A) (h : IsRationalCovering R T s) :
    IsRationalCovering R' (fun k ↦ (T k).image (toRingHom φ)) (fun k ↦ toRingHom φ (s k)) :=
  sorry

/-- A1/huber-pair-rational-site (api `CAff.spa`): `(A, A⁺) ↦ Spa(A, A⁺)` as a functor
`CAffᵒᵖ ⥤ TopCat`, through `Huber.Pair.Hom.spaComap`. -/
def spa : CAffᵒᵖ ⥤ TopCat where
  obj R := TopCat.of (ValuationSpectrum.spa R.unop.P.plus)
  map f := TopCat.ofHom ⟨spaMap f.unop, sorry⟩
  map_id := sorry
  map_comp := sorry

/-- A1/huber-pair-rational-site (api `CAff.O`): the presheaf `𝒪 : (A, A⁺) ↦ A` on `CAffᵒᵖ`; it is
represented by `(ℤ[T], ℤ)` (`CAff.O_iso_yoneda`). -/
def O : CAffᵒᵖᵒᵖ ⥤ Type where
  obj R := R.unop.unop.A
  map f := TypeCat.ofHom fun a ↦ toRingHom f.unop.unop a
  map_id := sorry
  map_comp := sorry

/-- A1/huber-pair-rational-site (supporting): `ℤ[T]`, carrying the discrete uniformity. -/
def AffineLineRing : Type := Polynomial ℤ

instance : CommRing AffineLineRing := inferInstanceAs (CommRing (Polynomial ℤ))

instance : UniformSpace AffineLineRing := ⊥

/-- A1/huber-pair-rational-site (supporting instance): `ℤ[T]` is discrete. -/
instance : DiscreteTopology AffineLineRing := sorry

/-- A1/huber-pair-rational-site (supporting instance). -/
instance : IsUniformAddGroup AffineLineRing := sorry

/-- A1/huber-pair-rational-site (supporting instance). -/
instance : IsTopologicalRing AffineLineRing := sorry

/-- A1/huber-pair-rational-site (supporting instance). -/
instance : CompleteSpace AffineLineRing := sorry

/-- A1/huber-pair-rational-site (supporting instance). -/
instance : T2Space AffineLineRing := sorry

/-- A1/huber-pair-rational-site (supporting): the complete Huber pair `(ℤ[T], ℤ)`, discrete, which
represents `𝒪`. -/
def affineLine : CAff where
  A := AffineLineRing
  P := { plus := ⊥, isRingOfIntegralElements := sorry }

/-- A1/huber-pair-rational-site (api `CAff.O`, representability): `𝒪 ≅ Hom((ℤ[T], ℤ), −)`. -/
theorem O_iso_yoneda : Nonempty (O ≅ yoneda.obj (op affineLine)) := sorry

-- CAff.isSheafAt_O_iff_isSheafyPair: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` of complete Tate pairs (supplier: AdicSpaces Layer 4). The sheaf
--   condition of `𝒪` at the rational coverings of `(A, A⁺)` is stated in the tests
--   CAff.test_O_sheafy and CAff.test_rost with `Presieve.IsSheafFor CAff.O`.

end CAff

section CAffTests

open Huber CAff

/- The Laurent covering `{|f| ≤ |ϖ|}, {|ϖ| ≤ |f|}` of a complete Tate pair is a rational covering;
for `(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `f = T`, `ϖ = p`. The identification `O(U_1) = ℚ_p⟨T/p⟩`,
`O(U_2) = ℚ_p⟨T, p/T⟩`, `O(U_1 ∩ U_2) = ℚ_p⟨T/p, p/T⟩` needs the anchor's rational localisations
as Huber pairs (AdicSpaces Layer 3). -/
open scoped Classical in
-- test CAff.test_laurent_cover (computation) [A1/huber-pair-rational-site]
example (R : CAff) [IsTateRing R.A] (f ϖ : R.A) (hϖ : IsPseudoUniformizer ϖ) :
    IsRationalCovering R ![{f, ϖ}, {ϖ, f}] ![ϖ, f] := sorry

-- test CAff.test_empty_cover (degenerate) [A1/huber-pair-rational-site]
example (R : CAff) : IsRationalCovering R (n := 0) ![] ![] ↔ Subsingleton R.A := sorry

/- For a complete strongly noetherian Tate pair, `𝒪` satisfies the sheaf condition for every
rational covering family (Huber's theorem, anchor Layer 4); the quantifier over `R` includes all
rational localisations. -/
-- test CAff.test_O_sheafy (compatibility) [A1/huber-pair-rational-site]
example (R : CAff) [IsTateRing R.A] [IsStronglyNoetherian R.A] (n : ℕ) (T : Fin n → Finset R.A)
    (s : Fin n → R.A) (h : IsRationalCovering R T s) :
    Presieve.IsSheafFor O (rationalCover R T s) := sorry

/- Rost's complete Tate pair (Hansen–Kedlaya, Example 6.28): `𝒪` fails the sheaf condition for a
rational covering, so representable presheaves are not `J_rat`-sheaves in general. -/
-- test CAff.test_rost (non-example) [A1/huber-pair-rational-site]
example : ∃ (R : CAff) (n : ℕ) (T : Fin n → Finset R.A) (s : Fin n → R.A),
    IsTateRing R.A ∧ IsRationalCovering R T s ∧ ¬ Presieve.IsSheafFor O (rationalCover R T s) :=
  sorry

/- The equalizer form of the sheaf condition: `G(A) → ∏_k G(O(U_k)) ⇉ ∏_{k,l} G(O(U_k ∩ U_l))`,
the two maps being tested on every pair of morphisms out of `O(U_k)`, `O(U_l)` that agree on
`(A, A⁺)` (these factor through `O(U_k ∩ U_l)`). -/
-- test CAff.test_isSheaf_iff (characterisation) [A1/huber-pair-rational-site]
example (P : CAffᵒᵖᵒᵖ ⥤ Type) :
    Presieve.IsSheaf ratTopology P ↔
      ∀ (R : CAff) (n : ℕ) (T : Fin n → Finset R.A) (s : Fin n → R.A) (R' : Fin n → CAff)
        (φ : ∀ k, R ⟶ R' k), IsRationalCovering R T s →
        (∀ k, IsRationalLocalization (φ k) (T k) (s k)) →
        ∀ x : ∀ k, P.obj (op (op (R' k))),
          (∀ (k l : Fin n) (W : CAff) (gk : R' k ⟶ W) (gl : R' l ⟶ W), φ k ≫ gk = φ l ≫ gl →
            P.map gk.op.op (x k) = P.map gl.op.op (x l)) →
          ∃! t : P.obj (op (op R)), ∀ k, P.map (φ k).op.op t = x k := sorry

end CAffTests

/-! ## AdicEtaleGeometry:A1/generalized-adic-presentation (construction) -/

namespace YonedaAdicSpace

open CAff

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.spaYFunctor`): `(A, A⁺) ↦ Spa^Y(A, A⁺)`,
the `J_rat`-sheafification (Mathlib `presheafToSheaf`) of the representable presheaf
`Hom_CAff((A, A⁺), −)` on `CAffᵒᵖ`, as a functor `CAffᵒᵖ ⥤ Sh(CAffᵒᵖ, J_rat)`. Since `CAff` is
large, sheaves take values in `Type 1` (the representables are lifted by `uliftFunctor`). -/
def spaYFunctor : CAffᵒᵖ ⥤ Sheaf ratTopology (Type 1) :=
  yoneda ⋙ (Functor.whiskeringRight _ _ _).obj uliftFunctor.{1} ⋙
    presheafToSheaf ratTopology (Type 1)

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.spaY`): `Spa^Y(A, A⁺)`, the
`J_rat`-sheafification of `h_{(A, A⁺)} = Hom_CAff((A, A⁺), −)` (Scholze–Weinstein 2013,
Definition 2.1.5; Berkeley Lectures, Definition 3.4.1). -/
def spaY (R : CAff) : Sheaf ratTopology (Type 1) := spaYFunctor.obj (op R)

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.homSpaYEquiv`): Yoneda for `Spa^Y`:
`Hom(Spa^Y(A, A⁺), G) ≃ G(A, A⁺)` for every `J_rat`-sheaf `G`. -/
def homSpaYEquiv (R : CAff) (G : Sheaf ratTopology (Type 1)) :
    (spaY R ⟶ G) ≃ G.obj.obj (op (op R)) := sorry

/-- A1/generalized-adic-presentation (supporting): the section of `Spa^Y(A, A⁺)` over `(B, B⁺)`
given by a morphism `φ : (A, A⁺) → (B, B⁺)` (the image of `φ ∈ h_{(A, A⁺)}(B, B⁺)` under the unit
of sheafification). -/
def spaYSection {R S : CAff} (φ : R ⟶ S) : (spaY R).obj.obj (op (op S)) :=
  (toSheafify ratTopology (yoneda.obj (op R) ⋙ uliftFunctor.{1})).app (op (op S)) (ULift.up φ.op)

/-- A1/generalized-adic-presentation (supporting): `f : F → Spa^Y(A, A⁺)` is the open subsheaf of
the open `U ⊆ Spa(A, A⁺)`: `f` is a monomorphism and a section of `Spa^Y(A, A⁺)` given by
`φ : (A, A⁺) → (B, B⁺)` lies in `F` iff `Spa(φ)` lands in `U` (a subsheaf is determined by the
representable sections it contains). -/
def IsOpenSubsheaf {F : Sheaf ratTopology (Type 1)} {R : CAff} (f : F ⟶ spaY R)
    (U : Set (ValuationSpectrum.spa R.P.plus)) : Prop :=
  Mono f ∧ ∀ (S : CAff) (φ : R ⟶ S),
    (∃ y : F.obj.obj (op (op S)), f.hom.app (op (op S)) y = spaYSection φ) ↔
      Set.range (spaMap φ) ⊆ U

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.IsOpenImmersion`): open immersions of
`J_rat`-sheaves (Berkeley Lectures, Definition 3.4.1): `f : F → G` is an open immersion if its
base change along every `Spa^Y(A, A⁺) → G` is the open subsheaf of an open of `Spa(A, A⁺)`. -/
def IsOpenImmersion : MorphismProperty (Sheaf ratTopology (Type 1)) := fun _ G f ↦
  ∀ (R : CAff) (g : spaY R ⟶ G), ∃ U : Set (ValuationSpectrum.spa R.P.plus),
    IsOpen U ∧ IsOpenSubsheaf (pullback.snd f g) U

/-- A1/generalized-adic-presentation (supporting): the affinoid open immersions
`Spa^Y(A, A⁺) → F`, as a full subcategory of `CostructuredArrow spaYFunctor F`. -/
abbrev AffinoidOpens (F : Sheaf ratTopology (Type 1)) : Type 1 :=
  ObjectProperty.FullSubcategory fun X : CostructuredArrow spaYFunctor F ↦ IsOpenImmersion X.hom

/-- A1/generalized-adic-presentation (supporting): the cocone of the affinoid open immersions
into `F`, with vertex `F`. -/
def affinoidCocone (F : Sheaf ratTopology (Type 1)) :
    Cocone (ObjectProperty.ι _ ⋙ CostructuredArrow.proj spaYFunctor F ⋙ spaYFunctor :
      AffinoidOpens F ⥤ Sheaf ratTopology (Type 1)) where
  pt := F
  ι := { app := fun X ↦ X.obj.hom
         naturality := sorry }

/-- A1/generalized-adic-presentation (supporting): a `J_rat`-sheaf is *Yoneda-adic* if it is the
colimit of its affinoid open immersions `Spa^Y(A, A⁺) → F`. -/
def IsYonedaAdic (F : Sheaf ratTopology (Type 1)) : Prop :=
  Nonempty (IsColimit (affinoidCocone F))

end YonedaAdicSpace

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace`): the category `YAdic` of Yoneda-adic
spaces, the full subcategory of `Sh(CAffᵒᵖ, J_rat)` on the Yoneda-adic sheaves (the adic spaces of
Scholze–Weinstein 2013, Definition 2.1.5, the pre-adic spaces of the Berkeley Lectures and the
preadic spaces of Kedlaya–Liu, Definition 8.2.3). -/
abbrev YonedaAdicSpace : Type 2 := ObjectProperty.FullSubcategory YonedaAdicSpace.IsYonedaAdic

namespace YonedaAdicSpace

open CAff

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.isColimit_affinoids`): a `J_rat`-sheaf
is Yoneda-adic iff it has a jointly epimorphic family of affinoid open immersions. -/
theorem isColimit_affinoids (F : Sheaf ratTopology (Type 1)) :
    IsYonedaAdic F ↔ ∃ (ι : Type 1) (R : ι → CAff) (f : ∀ i, spaY (R i) ⟶ F),
      (∀ i, IsOpenImmersion (f i)) ∧ ∀ (G : Sheaf ratTopology (Type 1)) (a b : F ⟶ G),
        (∀ i, f i ≫ a = f i ≫ b) → a = b := sorry

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.spaY_isInitial_iff`): `Spa^Y(A, A⁺)` is
initial iff `A = 0`. -/
theorem spaY_isInitial_iff (R : CAff) : Nonempty (IsInitial (spaY R)) ↔ Subsingleton R.A := sorry

/-- A1/generalized-adic-presentation (supporting): `Spa^Y(A, A⁺)` is a Yoneda-adic space. -/
theorem isYonedaAdic_spaY (R : CAff) : IsYonedaAdic (spaY R) := sorry

/-- A1/generalized-adic-presentation (supporting): `Spa^Y(A, A⁺)` as an object of `YAdic`. -/
abbrev ofSpaY (R : CAff) : YonedaAdicSpace := ⟨spaY R, isYonedaAdic_spaY R⟩

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.globalFunctions`): the global functions
`Γ(F) := Hom(F, Spa^Y(ℤ[T], ℤ))` (a ring); for `F = Spa^Y(A, A⁺)` this is the sheafified value of
`𝒪` at `(A, A⁺)`, equal to `A` when `(A, A⁺)` and its rational localisations are sheafy. -/
def globalFunctions (F : YonedaAdicSpace) : Type 1 := F.obj ⟶ spaY affineLine

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.space`): the underlying topological
space `|F|` (A1/yoneda-adic-ind-ringed-description), functorial in `F`. -/
def space : YonedaAdicSpace ⥤ TopCat.{1} := sorry

/-- A1/generalized-adic-presentation (api `YonedaAdicSpace.space`):
`|Spa^Y(A, A⁺)| = Spa(A, A⁺)`. -/
theorem space_ofSpaY (R : CAff) :
    Nonempty (space.obj (ofSpaY R) ≃ₜ ULift.{1} (ValuationSpectrum.spa R.P.plus)) := sorry

-- YonedaAdicSpace.ofAdicSpace: not stated here; needs the anchor's category of adic spaces
--   (supplier: AdicSpaces Layer 5)

end YonedaAdicSpace

section YonedaAdicSpaceTests

open CAff YonedaAdicSpace

-- test YonedaAdicSpace.test_zero_pair (degenerate) [A1/generalized-adic-presentation]
example : (∀ R : CAff, Subsingleton R.A → Nonempty (IsInitial (spaY R))) ∧
    ∀ F : Sheaf ratTopology (Type 1), Nonempty (IsInitial F) → IsYonedaAdic F := sorry

-- YonedaAdicSpace.test_open_disc: not stated here; needs the rational localisations
--   `ℚ_p⟨T, Tⁿ/p⟩` as complete Huber pairs (supplier: AdicSpaces Layer 3) [computation test]

/- `Hom(F, Spa^Y(ℤ[T], ℤ))` is the sheafified `𝒪` evaluated on `F`. -/
-- test YonedaAdicSpace.test_affine_line (characterisation) [A1/generalized-adic-presentation]
example (F : YonedaAdicSpace) : Nonempty (globalFunctions F ≃
    (F.obj ⟶ (presheafToSheaf ratTopology (Type 1)).obj (O ⋙ uliftFunctor.{1}))) := sorry

/- Rost's complete Tate pair (Hansen–Kedlaya, Example 6.28): `T ↦ X_3` and `T ↦ 0` give distinct
morphisms `(ℤ[T], ℤ) → (A, A⁺)` inducing the same morphism `Spa^Y(A, A⁺) → Spa^Y(ℤ[T], ℤ)`. -/
-- test YonedaAdicSpace.test_rost_not_faithful (non-example) [A1/generalized-adic-presentation]
example : ∃ (R : CAff) (φ ψ : affineLine ⟶ R), Huber.IsTateRing R.A ∧ φ ≠ ψ ∧
    spaYFunctor.map φ.op = spaYFunctor.map ψ.op := sorry

-- YonedaAdicSpace.test_sheafy: not stated here; needs the anchor's adic space
--   `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and `YonedaAdicSpace.ofAdicSpace` (supplier: AdicSpaces Layer 5)
--   [compatibility test]

end YonedaAdicSpaceTests

/-! ## AdicEtaleGeometry:A1/yoneda-adic-open-immersions (lemma) -/

namespace YonedaAdicSpace

open CAff

/-- A1/yoneda-adic-open-immersions (a): the morphism `Spa^Y(O(U), O⁺(U)) → Spa^Y(A, A⁺)` of a
rational localisation is an open immersion, the open subsheaf of `U = R(T/s)`. -/
theorem isOpenImmersion_spaY_rational {R R' : CAff} (φ : R ⟶ R') (T : Finset R.A) (s : R.A)
    (hT : IsOpen ((Ideal.span (T : Set R.A) : Ideal R.A) : Set R.A))
    (hφ : IsRationalLocalization φ T s) :
    IsOpenImmersion (spaYFunctor.map φ.op) ∧
      IsOpenSubsheaf (spaYFunctor.map φ.op)
        (Subtype.val ⁻¹' ValuationSpectrum.rationalSubset R.P.plus T s) := sorry

/-- A1/yoneda-adic-open-immersions (b): every open `U ⊆ Spa(A, A⁺)` has an open subsheaf. -/
theorem openImmersionsEquivOpens (R : CAff) (U : Set (ValuationSpectrum.spa R.P.plus))
    (hU : IsOpen U) : ∃ (F : Sheaf ratTopology (Type 1)) (f : F ⟶ spaY R), IsOpenSubsheaf f U :=
  sorry

/-- A1/yoneda-adic-open-immersions (b): the open subsheaf of `U` is unique up to unique
isomorphism over `Spa^Y(A, A⁺)`. -/
theorem isOpenSubsheaf_unique {R : CAff} {F G : Sheaf ratTopology (Type 1)} (f : F ⟶ spaY R)
    (g : G ⟶ spaY R) (U : Set (ValuationSpectrum.spa R.P.plus)) (hf : IsOpenSubsheaf f U)
    (hg : IsOpenSubsheaf g U) : ∃ e : F ≅ G, e.hom ≫ g = f := sorry

/-- A1/yoneda-adic-open-immersions (d): open immersions are monomorphisms. -/
theorem IsOpenImmersion.le_monomorphisms :
    IsOpenImmersion ≤ MorphismProperty.monomorphisms (Sheaf ratTopology (Type 1)) := sorry

/-- A1/yoneda-adic-open-immersions (d): open immersions are stable under base change. -/
instance IsOpenImmersion.isStableUnderBaseChange : IsOpenImmersion.IsStableUnderBaseChange :=
  sorry

/-- A1/yoneda-adic-open-immersions (d): open immersions are stable under composition. -/
instance IsOpenImmersion.isStableUnderComposition : IsOpenImmersion.IsStableUnderComposition :=
  sorry

end YonedaAdicSpace

/-! ## AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description (theorem) -/

-- YonedaAdicSpace.equivIndRinged (A1/yoneda-adic-ind-ringed-description, Berkeley Lectures
--   Proposition 3.5.3): not stated here; needs the category `(V)_ind` of spaces with a sheaf of
--   ind-topological rings and valuations, in no library (supplier:
--   AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description). Its consequence
--   `|Spa^Y(A, A⁺)| = Spa(A, A⁺)` is `TauCeti.YonedaAdicSpace.space_ofSpaY`.

/-! ## AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids (lemma) -/

-- YonedaAdicSpace.homOfAdicSpaceSpaYEquiv (A1/maps-from-adic-spaces-to-yoneda-affinoids,
--   Kedlaya–Liu Lemma 8.2.9): not stated here; needs the anchor's category of adic spaces
--   (supplier: AdicSpaces Layer 5). On `Spa^Y` of a pair it is
--   `TauCeti.YonedaAdicSpace.homSpaYEquiv`.

/-! ## AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces (theorem) -/

-- YonedaAdicSpace.ofAdicSpace_fullyFaithful, YonedaAdicSpace.ofAdicSpace_spa
--   (A1/adic-spaces-in-yoneda-adic-spaces): not stated here; needs the anchor's category of adic
--   spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicEtaleGeometry:A1/yoneda-adic-analytic-tate-local (lemma) -/

namespace YonedaAdicSpace

open CAff Huber

/-- A1/yoneda-adic-analytic-tate-local (b): every morphism of Huber pairs out of a complete Tate
pair is adic (Wedhorn Proposition 6.25). -/
theorem isAdicHom_of_isTateRing {R S : CAff} [IsTateRing R.A] (φ : R ⟶ S) :
    IsAdicHom (toRingHom φ) := sorry

/-- A1/yoneda-adic-analytic-tate-local (a), affinoid core: the analytic locus of `Spa(A, A⁺)` is a
finite union of rational subsets whose rational localisations are Tate (Tau Ceti
`ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`). -/
theorem exists_tate_cover_spaAnalytic (R : CAff) :
    ∃ (n : ℕ) (T : Fin n → Finset R.A) (s : Fin n → R.A),
      (∀ k, IsOpen ((Ideal.span (T k : Set R.A) : Ideal R.A) : Set R.A)) ∧
      ValuationSpectrum.spaAnalytic R.P.plus =
        ⋃ k, ValuationSpectrum.rationalSubset R.P.plus (T k) (s k) ∧
      ∀ (k : Fin n) (R' : CAff) (φ : R ⟶ R'), IsRationalLocalization φ (T k) (s k) →
        IsTateRing R'.A := sorry

-- YonedaAdicSpace.IsAnalytic.exists_tate_cover, YonedaAdicSpace.restrictTate_fullyFaithful
--   (A1/yoneda-adic-analytic-tate-local (a), (c)): not stated here; need the points `|F|` of a
--   Yoneda-adic space (supplier: AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description)

end YonedaAdicSpace

/-! ## AdicEtaleGeometry:A1/yoneda-adic-fibre-products (lemma) -/

namespace YonedaAdicSpace

open CAff Huber

/-- A1/yoneda-adic-fibre-products (affinoid case): for adic maps of complete pairs over a complete
Tate pair `(A, A⁺)`, `Spa^Y(B) ×_{Spa^Y(A)} Spa^Y(C) ≅ Spa^Y(B ⊗̂_A C)` for the completed tensor
product of AdicSpacesPartII:R0/completed-tensor-product (the prelude's
`Huber.Pair.completedTensor`), with no sheafiness assumption. -/
theorem spaYPullbackIso {A B C : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] [CommRing B]
    [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B]
    [T2Space B] [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] [Algebra A B] [Algebra A C]
    [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] (S : Pair A) (T : Pair B)
    (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
    (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus) :
    Nonempty (pullback
        (spaYFunctor.map (ofHom (⟨algebraMap A B, IsAdicHom.continuous _, hT⟩ :
          Pair.Hom S T)).op)
        (spaYFunctor.map (ofHom (⟨algebraMap A C, IsAdicHom.continuous _, hU⟩ :
          Pair.Hom S U)).op) ≅
      spaY (of (Pair.completedTensor S T U hT hU))) := sorry

-- YonedaAdicSpace.hasPullbacks_analytic (A1/yoneda-adic-fibre-products, analytic Yoneda-adic
--   spaces): not stated here; needs the points `|F|` of a Yoneda-adic space (supplier:
--   AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description)

end YonedaAdicSpace

end TauCeti

end

/-! # Stage A2. Supplier contract for separated, proper and smooth geometry; relative polydiscs,
tori, ball charts and dimension -/

noncomputable section

namespace TauCeti

open Topology UniformSpace TensorProduct ValuationSpectrum Huber

/-! ## AdicEtaleGeometry:A2/supplier-contract-separated-proper-smooth (comparison) -/

-- AdicSpace.IsProper.iff_quasiCompact_and_existsUnique_centre: not stated here; needs the
--   category of adic spaces with fibre products and diagonals (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence), Huber's proper morphisms
--   (AdicSpacesPartII:R0/separated-proper-morphisms) and valuation rings with their centres
--   (supplier: AdicSpacesPartII:R0/adic-valuation-rings-and-centres). A2/supplier-contract-
--   separated-proper-smooth identifies these, clause by clause, as the only separated, proper
--   and partially proper morphisms AdicEtaleGeometry uses (Huber 1996, 1.3.1–1.3.10).

/-! ## AdicEtaleGeometry:A2/relative-closed-polydisc (construction) -/

namespace Huber

section PolydiscVar

variable (n : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]

/-- A2/relative-closed-polydisc (data): the coordinate `Tᵢ` of the Tate algebra
`A⟨T₁, …, Tₙ⟩` (Tau Ceti `restrictedMvPowerSeriesCompletion n A`). -/
abbrev polydiscVar (i : Fin n) : restrictedMvPowerSeriesCompletion n A :=
  ((weightedX (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight i :
    weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight) :
      restrictedMvPowerSeriesCompletion n A)

end PolydiscVar

section PolydiscPlus

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- A2/relative-closed-polydisc (data): the ring `A⁺⟨T₁, …, Tₙ⟩` of restricted power series with
all coefficients in `A⁺`, as the closure in `A⟨T⟩` of the subring generated by the image of `A⁺`
and the coordinates `Tᵢ`. It is the plus ring of the chart of the relative polydisc (clause (a)),
not the power-bounded subring `A⟨T⟩°`. -/
def polydiscPlus (S : Pair A) (n : ℕ) : Subring (restrictedMvPowerSeriesCompletion n A) :=
  (Subring.closure (algebraMap A (restrictedMvPowerSeriesCompletion n A) '' S.plus ∪
    Set.range (polydiscVar n A))).topologicalClosure

variable [CompleteSpace A] [T2Space A]

/-- A2/relative-closed-polydisc (API `Huber.restrictedPowerSeries_plus_isIntegrallyClosed`): for a
complete Huber pair `(A, A⁺)`, `A⁺⟨T₁, …, Tₙ⟩` is a ring of integral elements of `A⟨T₁, …, Tₙ⟩`
(open, integrally closed, power-bounded), and it is the set of `h` with `v(h) ≤ 1` for every
`v ∈ Spa(A⟨T⟩, A⁺⟨T⟩)`; so it is Huber's plus ring of the chart and ECD's `B^n_Y`. -/
theorem restrictedPowerSeries_plus_isIntegrallyClosed (S : Pair A) (n : ℕ) :
    IsRingOfIntegralElements (polydiscPlus S n) ∧
      (polydiscPlus S n : Set (restrictedMvPowerSeriesCompletion n A)) =
        {h | ∀ v ∈ spa (polydiscPlus S n), v.toValuativeRel.vle h 1} := sorry

end PolydiscPlus

end Huber

namespace AdicSpace

section PolydiscAffinoid

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]

-- AdicSpace.relativePolydisc: not stated here; needs the category of adic spaces and its fibre
--   products over `Spa(ℤ, ℤ)` (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence). Its affinoid core (clause (a)) is
--   `AdicSpace.relativePolydisc_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc`, clause (a)): over
an open affinoid `Spa(A, A⁺)` the relative closed unit polydisc is `Spa(A⟨T⟩, A⁺⟨T⟩)`; this is
its complete Huber pair, with plus ring `A⁺⟨T⟩` (`Huber.polydiscPlus`). -/
def relativePolydisc_affinoid (S : Pair A) (n : ℕ) :
    Pair (restrictedMvPowerSeriesCompletion n A) where
  plus := polydiscPlus S n
  isRingOfIntegralElements := (restrictedPowerSeries_plus_isIntegrallyClosed S n).1

-- AdicSpace.relativePolydisc.proj: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5). Its affinoid core is `AdicSpace.relativePolydisc.proj_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.proj`): the
structure morphism `(A, A⁺) → (A⟨T⟩, A⁺⟨T⟩)`, whose `Spa` is the projection `π`. -/
def relativePolydisc.proj_affinoid (S : Pair A) (n : ℕ) :
    Pair.Hom S (relativePolydisc_affinoid S n) where
  toRingHom := algebraMap A (restrictedMvPowerSeriesCompletion n A)
  continuous_toRingHom := continuous_algebraMap_restrictedMvPowerSeriesCompletion n A
  map_mem_plus a ha :=
    Subring.le_topologicalClosure _ (Subring.subset_closure (Or.inl ⟨a, ha, rfl⟩))

-- AdicSpace.relativePolydisc.coord: not stated here; needs the sheaf `𝒪⁺` of an adic space
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativePolydisc.coord_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.coord`): the
coordinate `Tᵢ` lies in the plus ring `A⁺⟨T⟩` of the chart. -/
def relativePolydisc.coord_affinoid (S : Pair A) (n : ℕ) (i : Fin n) :
    (relativePolydisc_affinoid S n).plus :=
  ⟨polydiscVar n A i, Subring.le_topologicalClosure _ (Subring.subset_closure (Or.inr ⟨i, rfl⟩))⟩

-- AdicSpace.relativePolydisc.homEquiv: not stated here; needs morphisms of adic spaces over `X`
--   and `𝒪⁺_Z(Z)` (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativePolydisc.homEquiv_affinoid`.

section HomEquiv

variable {C : Type*} [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
  [IsHuberRing C] [CompleteSpace C] [T2Space C] {S : Pair A} {U : Pair C}

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.homEquiv`, clause
(b)): for a complete Huber pair `(C, C⁺)` over `(A, A⁺)` through `z`, morphisms of Huber pairs
`(A⟨T⟩, A⁺⟨T⟩) → (C, C⁺)` under `(A, A⁺)` are the `n`-tuples of elements of `C⁺`, by
`h ↦ (h(Tᵢ))ᵢ` (the universal property of the Tate algebra). -/
def relativePolydisc.homEquiv_affinoid (z : Pair.Hom S U) (n : ℕ) :
    {h : Pair.Hom (relativePolydisc_affinoid S n) U //
        h.comp (relativePolydisc.proj_affinoid S n) = z} ≃ (Fin n → U.plus) := sorry

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.homEquiv`): the
equivalence evaluates at the coordinates. -/
theorem relativePolydisc.homEquiv_affinoid_apply (z : Pair.Hom S U) (n : ℕ)
    (h : {h : Pair.Hom (relativePolydisc_affinoid S n) U //
      h.comp (relativePolydisc.proj_affinoid S n) = z}) (i : Fin n) :
    ((relativePolydisc.homEquiv_affinoid z n h i : U.plus) : C) =
      h.1.toRingHom (polydiscVar n A i) := sorry

end HomEquiv

-- AdicSpace.relativePolydisc.affinoidChart: not stated here; needs `Spa` of a sheafy pair as an
--   adic space and open subspaces (supplier: AdicSpaces Layer 5); the chart it identifies is
--   `AdicSpace.relativePolydisc_affinoid`, with coordinates
--   `AdicSpace.relativePolydisc.coord_affinoid`.

-- AdicSpace.relativePolydisc.baseChangeIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence). Its affinoid core is
--   `AdicSpace.relativePolydisc.baseChangeIso_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.baseChangeIso`,
clause (c)): for a continuous `A → A'` of complete Huber rings, `A' ⊗̂_A A⟨T⟩ ≅ A'⟨T⟩` as
topological rings, compatibly with the coordinates. The completed tensor product is the
stand-in `Huber.CompletedTensor` of AdicSpacesPartII:R0/completed-tensor-product. -/
theorem relativePolydisc.baseChangeIso_affinoid {A' : Type*} [CommRing A'] [UniformSpace A']
    [IsUniformAddGroup A'] [IsTopologicalRing A'] [IsHuberRing A'] [CompleteSpace A']
    [T2Space A'] [Algebra A A'] (hφ : Continuous (algebraMap A A')) (n : ℕ) :
    ∃ e : CompletedTensor A A' (restrictedMvPowerSeriesCompletion n A) ≃+*
        restrictedMvPowerSeriesCompletion n A',
      Continuous e ∧ Continuous e.symm ∧
        ∀ i, e (Pair.completedTensor.tmul A A' _ (1 ⊗ₜ polydiscVar n A i)) =
          polydiscVar n A' i := sorry

-- AdicSpace.relativePolydisc.addIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence). Its affinoid core is
--   `AdicSpace.relativePolydisc.addIso_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.addIso`, clause
(c)): `A⟨T₁, …, T_m⟩ ⊗̂_A A⟨T'₁, …, T'_n⟩ ≅ A⟨T₁, …, T_{m+n}⟩` as topological rings, the
coordinates going to the first `m`, resp. the last `n`, coordinates. -/
theorem relativePolydisc.addIso_affinoid (m n : ℕ) :
    ∃ e : CompletedTensor A (restrictedMvPowerSeriesCompletion m A)
        (restrictedMvPowerSeriesCompletion n A) ≃+* restrictedMvPowerSeriesCompletion (m + n) A,
      Continuous e ∧ Continuous e.symm ∧
        (∀ i, e (Pair.completedTensor.tmul A _ _ (polydiscVar m A i ⊗ₜ 1)) =
          polydiscVar (m + n) A (Fin.castAdd n i)) ∧
        ∀ j, e (Pair.completedTensor.tmul A _ _ (1 ⊗ₜ polydiscVar n A j)) =
          polydiscVar (m + n) A (Fin.natAdd m j) := sorry

-- AdicSpace.relativePolydisc.smooth: not stated here; needs Huber's smooth morphisms of adic
--   spaces and continuous differentials (supplier: AdicSpacesPartII:R0/smooth-morphism,
--   AdicSpacesPartII:R0/restricted-power-series-smooth)
-- AdicSpace.relativePolydisc.quasiCompact_proj: not stated here; needs quasi-compact and
--   separated morphisms of adic spaces (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/separated-proper-morphisms)
-- AdicSpace.relativePolydisc.isLocallyNoetherian: not stated here; needs locally noetherian adic
--   spaces (supplier: AdicSpacesPartII:R0/locally-noetherian-adic-space). Its affinoid core is
--   Tau Ceti's instance `Huber.IsStronglyNoetherian.restrictedMvPowerSeriesCompletion`.
-- AdicSpace.relativePolydisc.isAnalytic: not stated here; needs analytic adic spaces (supplier:
--   AdicEtaleGeometry:A0/analytic-locus-restriction). Its affinoid core is Tau Ceti's instance
--   `IsTateRing (restrictedMvPowerSeriesCompletion n A)` for a Tate ring `A`.
-- AdicSpace.relativePolydisc.isOpenImmersion_affineSpace: not stated here; needs the relative
--   analytification `A^n_ℤ ×_{Spec ℤ} X` (supplier:
--   AdicSpacesPartII:R1/scheme-fibre-product-analytification)
-- AdicSpace.relativePolydisc_spa_field: not stated here; needs `Spa` of a field as an adic
--   space (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativePolydisc_spa_field_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc_spa_field`): over
`Spa(K, K°)` for a complete nonarchimedean field `K`, the points of the chart
`Spa(K⟨T⟩, K°⟨T⟩)` are, through the completion map, exactly Tau Ceti's `closedPolydisc n K`
(since `K°⟨T⟩ = K⟨T⟩°` for a rank-one field). -/
theorem relativePolydisc_spa_field_affinoid (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsTateRing K] (n : ℕ) :
    ValuationSpectrum.comap (Completion.coeRingHom :
        weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set K)) isWeightFamily_one_weight →+*
          restrictedMvPowerSeriesCompletion n K) '' spa (polydiscPlus (Pair.powerBounded K) n) =
      closedPolydisc n K := sorry

-- AdicSpace.relativePolydisc.zeroIso: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5). Its affinoid core is `AdicSpace.relativePolydisc.zeroIso_affinoid`.

/-- A2/relative-closed-polydisc (affinoid core of `AdicSpace.relativePolydisc.zeroIso`): for a
complete Huber pair, `A → A⟨⟩` is a homeomorphic ring isomorphism carrying `A⁺` onto
`A⁺⟨⟩`. -/
theorem relativePolydisc.zeroIso_affinoid (S : Pair A) :
    IsHomeomorph (algebraMap A (restrictedMvPowerSeriesCompletion 0 A)) ∧
      polydiscPlus S 0 = S.plus.map (algebraMap A (restrictedMvPowerSeriesCompletion 0 A)) :=
  sorry

/- `B¹` over `Spa(ℚ_p, ℤ_p)`: the plus ring is `ℤ_p⟨T⟩ = ℚ_p⟨T⟩°`, and the `(ℚ_p, ℤ_p)`-points of
the chart are `ℤ_p`. -/
-- test relativePolydisc_test_Qp (computation) [A2/relative-closed-polydisc]
example (p : ℕ) [Fact p.Prime] :
    polydiscPlus (Pair.powerBounded ℚ_[p]) 1 =
        powerBoundedSubring (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
      Nonempty ({h : Pair.Hom (relativePolydisc_affinoid (Pair.powerBounded ℚ_[p]) 1)
          (Pair.powerBounded ℚ_[p]) //
          h.comp (relativePolydisc.proj_affinoid (Pair.powerBounded ℚ_[p]) 1) = Pair.Hom.id _} ≃
        powerBoundedSubring ℚ_[p]) := sorry

-- test relativePolydisc_test_zero (degenerate) [A2/relative-closed-polydisc]
example (S : Pair A) :
    polydiscPlus S 0 = S.plus.map (algebraMap A (restrictedMvPowerSeriesCompletion 0 A)) :=
  sorry

-- relativePolydisc_test_notAffineLine: not stated here; needs the adic affine line
--   `Spa(ℤ[T], ℤ) ×_{Spa ℤ} Spa K`, a non-quasi-compact adic space (supplier: AdicSpaces
--   Layer 5, AdicSpacesPartII:R1/analytification-functor) [non-example test]

/- For `K⁺ ⊊ K°` the chart `Spa(K⟨T⟩, K⁺⟨T⟩)` strictly contains `Spa(K⟨T⟩, K°⟨T⟩)`. -/
-- test relativePolydisc_test_rankTwoPlus (non-example) [A2/relative-closed-polydisc]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (S : Pair K) (h : S.plus < powerBoundedSubring K) :
    spa (polydiscPlus (Pair.powerBounded K) 1) ⊂ spa (polydiscPlus S 1) := sorry

-- test relativePolydisc_test_closedPolydisc (compatibility) [A2/relative-closed-polydisc]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (n : ℕ) :
    ValuationSpectrum.comap (Completion.coeRingHom :
        weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set K)) isWeightFamily_one_weight →+*
          restrictedMvPowerSeriesCompletion n K) '' spa (polydiscPlus (Pair.powerBounded K) n) =
      closedPolydisc n K := sorry

/- For `Z = X`, the zero section corresponds to `(0, …, 0)`: it sends every `Tᵢ` to `0`. -/
-- test relativePolydisc_test_homEquiv (characterisation) [A2/relative-closed-polydisc]
example (S : Pair A) (n : ℕ) (i : Fin n) :
    ((relativePolydisc.homEquiv_affinoid (Pair.Hom.id S) n).symm 0).1.toRingHom
      (polydiscVar n A i) = 0 := sorry

end PolydiscAffinoid

/-! ## AdicEtaleGeometry:A2/relative-torus (construction) -/

section TorusAffinoid

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]

-- AdicSpace.relativeTorus: not stated here; needs open subspaces of adic spaces (supplier:
--   AdicSpaces Layer 5). Its affinoid core is `AdicSpace.relativeTorus_affinoid`.

/-- A2/relative-torus (affinoid core of `AdicSpace.relativeTorus`): over `Spa(A, A⁺)` the relative
torus is the rational subset `R(1/(T₁ ⋯ Tₙ)) = {|T₁ ⋯ Tₙ| ≥ 1} = {|T₁| = ⋯ = |Tₙ| = 1}` of the
chart `Spa(A⟨T⟩, A⁺⟨T⟩)`, with coordinate ring `A⟨T^{±1}⟩`. -/
def relativeTorus_affinoid (S : Pair A) (n : ℕ) :
    Set (ValuationSpectrum (restrictedMvPowerSeriesCompletion n A)) :=
  rationalSubset (polydiscPlus S n) {1} (∏ i, polydiscVar n A i)

-- AdicSpace.relativeTorus.ι: not stated here; needs open immersions of adic spaces (supplier:
--   AdicSpaces Layer 5); over an affinoid it is the inclusion of the rational subset
--   `AdicSpace.relativeTorus_affinoid`, open by Tau Ceti's
--   `ValuationSpectrum.isOpen_val_preimage_rationalSubset`.
-- AdicSpace.relativeTorus.homEquiv: not stated here; needs morphisms of adic spaces over `X`
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativeTorus.homEquiv_affinoid`.

/-- A2/relative-torus (affinoid core of `AdicSpace.relativeTorus.homEquiv`, clause (a)): a point
`h : (A⟨T⟩, A⁺⟨T⟩) → (C, C⁺)` of the polydisc with values in a complete pair factors through the
torus exactly when every `h(Tᵢ)` is a unit of `C` whose inverse lies in `C⁺`. -/
theorem relativeTorus.homEquiv_affinoid {C : Type*} [CommRing C] [UniformSpace C]
    [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C]
    {S : Pair A} {U : Pair C} (n : ℕ) (h : Pair.Hom (relativePolydisc_affinoid S n) U) :
    (∀ v : spa U.plus, (h.spaComap v).1 ∈ relativeTorus_affinoid S n) ↔
      ∀ i, ∃ u : Cˣ, (u : C) = h.toRingHom (polydiscVar n A i) ∧ ((u⁻¹ : Cˣ) : C) ∈ U.plus :=
  sorry

-- AdicSpace.relativeTorus.affinoidChart: not stated here; needs `Spa` of a sheafy pair as an
--   adic space (supplier: AdicSpaces Layer 5); the chart is the rational subset
--   `AdicSpace.relativeTorus_affinoid`, with coordinate ring the rational localisation
--   `A⟨T⟩⟨1/(T₁ ⋯ Tₙ)⟩ = A⟨T^{±1}⟩` (Tau Ceti `PairOfDefinition.completionLocalization`).
-- AdicSpace.relativeTorus.baseChangeIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.relativeTorus.smooth: not stated here; needs Huber's smooth morphisms (supplier:
--   AdicSpacesPartII:R0/smooth-morphism)
-- AdicSpace.relativeTorus.mul: not stated here; needs group objects in adic spaces over `X`,
--   hence fibre products (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.relativeTorus.polydiscEmbedding: not stated here; needs open immersions of adic
--   spaces (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativeTorus.polydiscEmbedding_affinoid`.

open Classical in
/-- A2/relative-torus (affinoid core of `AdicSpace.relativeTorus.polydiscEmbedding`, clause (d);
Scholze 2013, proof of Lemma 5.2): for a pseudouniformiser `ϖ` of `A`, the continuous
`A`-endomorphism `σ` of `A⟨T⟩` with `σ(Tᵢ) = 1 + ϖTᵢ` maps `Spa(A⟨T⟩, A⁺⟨T⟩)` onto the rational
subset `{|Tᵢ − 1| ≤ |ϖ|}`, which lies in the torus. -/
theorem relativeTorus.polydiscEmbedding_affinoid (S : Pair A) (n : ℕ) {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) :
    ∃ σ : restrictedMvPowerSeriesCompletion n A →+* restrictedMvPowerSeriesCompletion n A,
      Continuous σ ∧
        σ.comp (algebraMap A _) = algebraMap A (restrictedMvPowerSeriesCompletion n A) ∧
        (∀ i, σ (polydiscVar n A i) =
          1 + algebraMap A (restrictedMvPowerSeriesCompletion n A) ϖ * polydiscVar n A i) ∧
        ValuationSpectrum.comap σ '' spa (polydiscPlus S n) =
          rationalSubset (polydiscPlus S n) (Finset.univ.image fun i ↦ polydiscVar n A i - 1)
            (algebraMap A (restrictedMvPowerSeriesCompletion n A) ϖ) ∧
        rationalSubset (polydiscPlus S n) (Finset.univ.image fun i ↦ polydiscVar n A i - 1)
            (algebraMap A (restrictedMvPowerSeriesCompletion n A) ϖ) ⊆
          relativeTorus_affinoid S n := sorry

-- AdicSpace.relativeTorus.iSup_translate_eq_polydisc: not stated here; needs open subspaces of
--   adic spaces and the translation `T ↦ T + 1` (supplier: AdicSpaces Layer 5). Its affinoid
--   core is `AdicSpace.relativeTorus.iSup_translate_eq_polydisc_affinoid`.

/-- A2/relative-torus (affinoid core of `AdicSpace.relativeTorus.iSup_translate_eq_polydisc`,
clause (e); ECD, proof of Proposition 24.4): the chart of `B¹` is covered by the torus
`{|T| = 1}` and its translate `{|T − 1| = 1}`. -/
theorem relativeTorus.iSup_translate_eq_polydisc_affinoid (S : Pair A) :
    spa (polydiscPlus S 1) = relativeTorus_affinoid S 1 ∪
      rationalSubset (polydiscPlus S 1) {1} (polydiscVar 1 A 0 - 1) := sorry

-- AdicSpace.relativeTorus_spa_field: not stated here; needs `Spa` of a field as an adic space
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.relativeTorus_spa_field_affinoid`.

/-- A2/relative-torus (affinoid core of `AdicSpace.relativeTorus_spa_field`, clause (c)): over
`Spa(K, K°)` the torus is Scholze's `Tⁿ`, the points of `Spa(K⟨T⟩, K⟨T⟩°)` with `|Tᵢ| = 1`. -/
theorem relativeTorus_spa_field_affinoid (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsTateRing K] (n : ℕ) :
    relativeTorus_affinoid (Pair.powerBounded K) n =
      {v | v ∈ spa (powerBoundedSubring (restrictedMvPowerSeriesCompletion n K)) ∧
        ∀ i, v.toValuativeRel.vle 1 (polydiscVar n K i)} := sorry

/- Over `K`, a `(K, K°)`-point `T ↦ c` of the disc lies on `T¹` iff `|c| = 1`: the points of `T¹`
with values in `(K, K°)` are `K°ˣ`. -/
-- test relativeTorus_test_field (computation) [A2/relative-torus]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K]
    (h : Pair.Hom (relativePolydisc_affinoid (Pair.powerBounded K) 1) (Pair.powerBounded K)) :
    (∀ v : spa (Pair.powerBounded K).plus,
        (h.spaComap v).1 ∈ relativeTorus_affinoid (Pair.powerBounded K) 1) ↔
      ‖h.toRingHom (polydiscVar 1 K 0)‖ = 1 := sorry

-- test relativeTorus_test_zero (degenerate) [A2/relative-torus]
example (S : Pair A) : relativeTorus_affinoid S 0 = spa (polydiscPlus S 0) := sorry

-- relativeTorus_test_notGm: not stated here; needs the analytification `(G_m)^{ad}` of a scheme,
--   a non-quasi-compact adic space (supplier: AdicSpacesPartII:R1/analytification-functor)
--   [non-example test]

/- Over `ℚ_p`, `T ↦ 1 + pT` identifies `B¹` with the rational subset `{|T − 1| ≤ |p|}` of `T¹`. -/
-- test relativeTorus_test_ballEmbedding (characterisation) [A2/relative-torus]
example (p : ℕ) [Fact p.Prime] :
    ∃ σ : restrictedMvPowerSeriesCompletion 1 ℚ_[p] →+* restrictedMvPowerSeriesCompletion 1 ℚ_[p],
      Continuous σ ∧
        σ (polydiscVar 1 ℚ_[p] 0) =
          1 + (p : restrictedMvPowerSeriesCompletion 1 ℚ_[p]) * polydiscVar 1 ℚ_[p] 0 ∧
        ValuationSpectrum.comap σ '' spa (polydiscPlus (Pair.powerBounded ℚ_[p]) 1) =
          rationalSubset (polydiscPlus (Pair.powerBounded ℚ_[p]) 1)
            {polydiscVar 1 ℚ_[p] 0 - 1} (p : restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
        rationalSubset (polydiscPlus (Pair.powerBounded ℚ_[p]) 1)
            {polydiscVar 1 ℚ_[p] 0 - 1} (p : restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ⊆
          relativeTorus_affinoid (Pair.powerBounded ℚ_[p]) 1 := sorry

-- test relativeTorus_test_annulusCover (computation) [A2/relative-torus]
example (S : Pair A) :
    spa (polydiscPlus S 1) = relativeTorus_affinoid S 1 ∪
      rationalSubset (polydiscPlus S 1) {1} (polydiscVar 1 A 0 - 1) := sorry

/- The torus chart is the rational subset `R(1/(T₁ ⋯ Tₙ))`, open in the polydisc chart. -/
-- test relativeTorus_test_openImmersion (compatibility) [A2/relative-torus]
example (S : Pair A) (n : ℕ) :
    IsOpen (Subtype.val ⁻¹' relativeTorus_affinoid S n : Set (spa (polydiscPlus S n))) := sorry

end TorusAffinoid

/-! ## AdicEtaleGeometry:A2/smooth-morphism-ball-charts (definition) -/

-- AdicSpace.IsLocallyEtaleOverPolydisc: not stated here; needs morphisms of adic spaces, the
--   relative polydisc `AdicSpace.relativePolydisc` and A1's étale morphisms (supplier:
--   AdicSpaces Layer 5, AdicEtaleGeometry:A1/etale-morphism)
-- AdicSpace.IsLocallyEtaleOverPolydisc.exists_chart: not stated here; needs the same carriers
--   (supplier: AdicEtaleGeometry:A1/etale-morphism)
-- AdicSpace.IsLocallyEtaleOverPolydisc.of_isEtale: not stated here; needs A1's étale morphisms
--   (supplier: AdicEtaleGeometry:A1/etale-morphism)
-- AdicSpace.IsLocallyEtaleOverPolydisc.relativePolydisc: not stated here; needs the relative
--   polydisc and torus as adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyEtaleOverPolydisc.comp: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsLocallyEtaleOverPolydisc.baseChange: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsLocallyEtaleOverPolydisc.of_isOpenImmersion_comp: not stated here; needs open
--   covers of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth: not stated here; needs Huber's smooth
--   morphisms (supplier: AdicSpacesPartII:R0/smooth-morphism); it is the declaration of node
--   A2/smooth-local-ball-charts below.
-- isLocallyEtaleOverPolydisc_test_polydisc: not stated here; needs the relative polydisc and
--   torus as adic spaces (supplier: AdicSpaces Layer 5) [computation test]
-- isLocallyEtaleOverPolydisc_test_etale: not stated here; needs A1's étale morphisms (supplier:
--   AdicEtaleGeometry:A1/etale-morphism) [degenerate test]
-- isLocallyEtaleOverPolydisc_test_origin: not stated here; needs closed embeddings of adic
--   spaces (supplier: AdicSpaces Layer 5) [non-example test]
-- isLocallyEtaleOverPolydisc_test_huber: not stated here; needs Huber's smooth morphisms
--   (supplier: AdicSpacesPartII:R0/smooth-morphism) [compatibility test]
-- isLocallyEtaleOverPolydisc_test_perfectoidBase: not stated here; needs affinoid perfectoid
--   spaces (supplier: PerfectoidSpaces:P2) [characterisation test]

/-! ## AdicEtaleGeometry:A2/smooth-local-ball-charts (comparison) -/

-- AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth (A2/smooth-local-ball-charts): not stated
--   here; needs Huber's smooth morphisms of locally noetherian analytic adic spaces and the rank
--   of `Ω_{X/S}` (supplier: AdicSpacesPartII:R0/smooth-morphism,
--   AdicSpacesPartII:R0/smooth-differentials-locally-free) together with the ball charts of
--   A2/smooth-morphism-ball-charts. Its refinement, with `n = rank Ω_{X/S}` at `x` and `U` inside
--   a given neighbourhood, is `AdicSpace.Smooth.exists_ballChart_rank` (same carriers).

/-! ## AdicEtaleGeometry:A2/relative-toric-charts (lemma) -/

-- AdicSpace.Smooth.exists_relativeToricChart (A2/relative-toric-charts): not stated here; needs
--   smooth morphisms of adic spaces smooth over `Spa(K, K°)`, the relative torus and composites of
--   rational embeddings and finite étale maps (supplier: AdicSpacesPartII:R0/smooth-toric-chart,
--   AdicEtaleGeometry:A1/finite-etale-morphism)

/-! ## AdicEtaleGeometry:A2/dimension-of-adic-spaces (definition) -/

-- AdicSpace.dim: not stated here; needs the underlying space of an adic space (supplier:
--   AdicSpaces Layer 5). It is `topologicalKrullDim |X|`; its affinoid core is
--   `AdicSpace.dim_affinoid`.

/-- A2/dimension-of-adic-spaces (affinoid core of `AdicSpace.dim`; Huber 1996, Definition 1.8.1):
the dimension of `Spa(A, A⁺)` is Mathlib's `topologicalKrullDim` of Tau Ceti's `spa A⁺` with the
subspace topology, not the Krull dimension of a ring of functions. -/
def dim_affinoid {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [IsHuberRing A] (S : Pair A) : WithBot ℕ∞ :=
  topologicalKrullDim (spa S.plus)

-- AdicSpace.dim_eq_iSup_specializationChain: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5); their underlying spaces are sober and T0, and the statement is the
--   topological core `AdicSpace.dim_eq_iSup_specializationChain_core`.

/-- A2/dimension-of-adic-spaces (topological core of
`AdicSpace.dim_eq_iSup_specializationChain`; Huber 1996, 1.8.1, as stated in Zavyalov,
Definition 3.1): for a quasi-sober T0 space, `topologicalKrullDim` is the supremum of the lengths
of chains of proper specializations of points. -/
theorem dim_eq_iSup_specializationChain_core (X : Type*) [TopologicalSpace X] [QuasiSober X]
    [T0Space X] : topologicalKrullDim X = Order.krullDim (Specialization X) := sorry

-- AdicSpace.IsPureDim: not stated here; needs adic spaces and their open subspaces (supplier:
--   AdicSpaces Layer 5). Its topological core is `AdicSpace.IsPureDim_core`.

/-- A2/dimension-of-adic-spaces (topological core of `AdicSpace.IsPureDim`): a space is of pure
dimension `d` if every nonempty open subset has dimension `d`. -/
def IsPureDim_core (X : Type*) [TopologicalSpace X] (d : ℕ) : Prop :=
  ∀ U : Set X, IsOpen U → U.Nonempty → topologicalKrullDim U = (d : WithBot ℕ∞)

-- AdicSpace.relDim: not stated here; needs morphisms of adic spaces (supplier: AdicSpaces
--   Layer 5). Its topological core is `AdicSpace.relDim_core`.

/-- A2/dimension-of-adic-spaces (topological core of `AdicSpace.relDim`): the relative dimension
`sup_y dim f⁻¹(y)` of a map, the fibres carrying the subspace topology. -/
def relDim_core {X Y : Type*} [TopologicalSpace X] (f : X → Y) : WithBot ℕ∞ :=
  ⨆ y, topologicalKrullDim (f ⁻¹' {y})

-- AdicSpace.IsPureRelDim: not stated here; needs morphisms of adic spaces (supplier: AdicSpaces
--   Layer 5). Its topological core is `AdicSpace.IsPureRelDim_core`.

/-- A2/dimension-of-adic-spaces (topological core of `AdicSpace.IsPureRelDim`): every nonempty
fibre is of pure dimension `d`. -/
def IsPureRelDim_core {X Y : Type*} [TopologicalSpace X] (f : X → Y) (d : ℕ) : Prop :=
  ∀ y, (f ⁻¹' {y}).Nonempty → IsPureDim_core (f ⁻¹' {y}) d

-- AdicSpace.dim_le_of_isOpenImmersion: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5). Its topological core is Mathlib's
--   `Topology.IsInducing.topologicalKrullDim_le`.
-- AdicSpace.dim_eq_iSup_of_openCover: not stated here; needs open covers of adic spaces
--   (supplier: AdicSpaces Layer 5). Its topological core is
--   `AdicSpace.dim_eq_iSup_of_openCover_core`.

/-- A2/dimension-of-adic-spaces (topological core of `AdicSpace.dim_eq_iSup_of_openCover`): the
dimension of a space is the supremum of the dimensions of the members of an open cover. -/
theorem dim_eq_iSup_of_openCover_core {X : Type*} [TopologicalSpace X] {ι : Type*}
    (U : ι → Set X) (hU : ∀ i, IsOpen (U i)) (hcov : ⋃ i, U i = Set.univ) :
    topologicalKrullDim X = ⨆ i, topologicalKrullDim (U i) := sorry

-- AdicSpace.dim_spa_field: not stated here; needs `Spa` of a field as an adic space (supplier:
--   AdicSpaces Layer 5). Its affinoid core is `AdicSpace.dim_spa_field_affinoid`.

/-- A2/dimension-of-adic-spaces (affinoid core of `AdicSpace.dim_spa_field`): for a complete
rank-one field `K` and a ring of integral elements `K⁺` (a valuation ring of rank `r`),
`dim Spa(K, K⁺) = r − 1`, written `dim + 1 = r`. -/
theorem dim_spa_field_affinoid (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [IsTateRing K] (S : Pair K) :
    dim_affinoid S + 1 = ringKrullDim S.plus := sorry

-- AdicSpace.dim_congr_homeomorph: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5). Its topological core is Mathlib's `IsHomeomorph.topologicalKrullDim_eq`.
-- AdicSpace.IsPureDim.iff_localRing_dim: not stated here; needs adic spaces locally of finite
--   type over `Spa(K, K°)`, their classical points and stalks (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space). Its affinoid core is
--   `AdicSpace.IsPureDim.iff_localRing_dim_affinoid`.

/-- A2/dimension-of-adic-spaces (affinoid core of `AdicSpace.IsPureDim.iff_localRing_dim`;
Zavyalov, Lemma 3.3): for a `K`-affinoid algebra `B` (topologically of finite type over a complete
rank-one field `K`), `Spa(B, B°)` is of pure dimension `d` iff every localisation of `B` at a
maximal ideal (a classical point) has Krull dimension `d`. -/
theorem IsPureDim.iff_localRing_dim_affinoid (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsTateRing K] {B : Type*} [CommRing B]
    [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
    [CompleteSpace B] [T2Space B] [Algebra K B] (hB : IsTopologicallyFiniteType (algebraMap K B))
    (d : ℕ) :
    IsPureDim_core (spa (powerBoundedSubring B)) d ↔
      ∀ m : MaximalSpectrum B,
        ringKrullDim (Localization.AtPrime m.asIdeal) = (d : WithBot ℕ∞) := sorry

-- test dim_test_field (computation) [A2/dimension-of-adic-spaces]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (S : Pair K) (h2 : ringKrullDim S.plus = 2) :
    dim_affinoid (Pair.powerBounded K) = 0 ∧ dim_affinoid S = 1 := sorry

-- test dim_test_disc (computation) [A2/dimension-of-adic-spaces]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] :
    dim_affinoid (relativePolydisc_affinoid (Pair.powerBounded K) 1) = 1 ∧
      IsPureDim_core (spa (polydiscPlus (Pair.powerBounded K) 1)) 1 := sorry

-- test dim_test_empty (degenerate) [A2/dimension-of-adic-spaces]
example : topologicalKrullDim Empty = ⊥ ∧ ∀ d : ℕ, IsPureDim_core Empty d := sorry

/- For `K⁺` of rank two, `dim Spa(K, K⁺) = 1`, while the Krull dimension of `K` is `0`. -/
-- test dim_test_notRingDim (non-example) [A2/dimension-of-adic-spaces]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] (S : Pair K) (h2 : ringKrullDim S.plus = 2) :
    dim_affinoid S = 1 ∧ dim_affinoid S ≠ ringKrullDim K := sorry

-- test dim_test_topologicalKrullDim (compatibility) [A2/dimension-of-adic-spaces]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (S : Pair A) :
    dim_affinoid S = topologicalKrullDim (spa S.plus) ∧
      ∀ U : Set (spa S.plus), IsOpen U → topologicalKrullDim U ≤ dim_affinoid S := sorry

/-! ## AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres (lemma) -/

-- AdicSpace.isPureRelDim_iff_rankOneFibres (A2/relative-dimension-rank-one-fibres): not stated
--   here; needs fibre products of adic spaces and the completed residue fields
--   `Spa(K(s), K(s)°) → S` of rank-one points (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence, AdicSpaces Layer 5)

/-! ## AdicEtaleGeometry:A2/smooth-pure-relative-dimension (lemma) -/

-- AdicSpace.Smooth.isPureRelDim (A2/smooth-pure-relative-dimension): not stated here; needs
--   Huber's smooth morphisms and the rank of `Ω_{X/S}` (supplier:
--   AdicSpacesPartII:R0/smooth-morphism, AdicSpacesPartII:R0/smooth-differentials-locally-free).
--   Its affinoid core over a field is `AdicSpace.Smooth.isPureRelDim_affinoid`.

/-- A2/smooth-pure-relative-dimension (affinoid core of `AdicSpace.Smooth.isPureRelDim` for
`B^n_K → Spa K`): over a complete rank-one field `K`, the closed polydisc
`Spa(K⟨T₁, …, Tₙ⟩, K°⟨T₁, …, Tₙ⟩)` is of pure dimension `n`. -/
theorem Smooth.isPureRelDim_affinoid (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsTateRing K] (n : ℕ) :
    IsPureDim_core (spa (polydiscPlus (Pair.powerBounded K) n)) n := sorry

/-! ## AdicEtaleGeometry:A2/weakly-finite-type-finite-dimension (lemma) -/

-- AdicSpace.relDim_lt_top_of_isWeaklyFiniteType (A2/weakly-finite-type-finite-dimension): not
--   stated here; needs morphisms of weakly finite type between locally noetherian analytic adic
--   spaces (supplier: AdicSpacesPartII:R0/finite-type-morphism-classes). Its affinoid core is
--   `AdicSpace.relDim_lt_top_of_isWeaklyFiniteType_affinoid`.

/-- A2/weakly-finite-type-finite-dimension (affinoid core of
`AdicSpace.relDim_lt_top_of_isWeaklyFiniteType`): for a morphism of complete Huber pairs
`f : (A, A⁺) → (B, B⁺)` topologically of finite type with `A` a strongly noetherian Tate ring,
the fibres of `Spa(f)` have bounded dimension. -/
theorem relDim_lt_top_of_isWeaklyFiniteType_affinoid {A B : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [IsStronglyNoetherian A]
    [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] {S : Pair A}
    {T : Pair B} (f : Pair.Hom S T) (hf : IsTopologicallyFiniteType f.toRingHom) :
    relDim_core f.spaComap < ⊤ := sorry

/-! ## AdicEtaleGeometry:A2/analytification-relative-polydisc-comparison (comparison) -/

-- AdicSpace.relativePolydiscIsoAnalyticAffineSpaceChart
--   (A2/analytification-relative-polydisc-comparison): not stated here; needs the relative
--   analytification `A^n_A ×_{Spec A} Spa(A, A⁺)` as an adic space and its rational open
--   subspaces (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification). On charts it
--   identifies `AdicSpace.relativePolydisc_affinoid` with the rational subset
--   `{|T₁|, …, |Tₙ| ≤ 1}` of each `Spa(A⟨ϖᵏT⟩, A⁺⟨ϖᵏT⟩)`.

/-! ## AdicEtaleGeometry:A2/smooth-etale-site-compatibility (comparison) -/

-- AdicSpace.Smooth.ballCharts_mem_etaleTopology (A2/smooth-etale-site-compatibility): not stated
--   here; needs the small étale site of an adic space and Huber's smooth morphisms (supplier:
--   AdicEtaleGeometry:A1/etale-site, AdicSpacesPartII:R0/smooth-morphism)

/-! ## AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus (comparison) -/

-- FormalScheme.genericFibreIsoAnalyticLocus (A2/formal-generic-fibre-analytic-locus): not stated
--   here; needs locally noetherian formal schemes, Huber's functors `t` and `d` and the analytic
--   locus of an adic space (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/generic-fibre-functor-d, AdicEtaleGeometry:A0/analytic-locus-restriction).
--   On `Spf A` its content `d(Spf A) = Spa(A, A)_a`, covered by the Tate charts `R(G/g)`, is Tau
--   Ceti's `ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`.

end AdicSpace

end TauCeti

end

/-! # Stage A3. The nonnoetherian affinoid étale approximation -/

noncomputable section

namespace TauCeti

open TensorProduct Topology Filter

namespace Module

/-! ## AdicEtaleGeometry:A3/pseudocoherent-module (definition) -/

section PseudoCoherent

variable (R : Type*) (M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- A3/pseudocoherent-module (structure): `M` is *`m`-pseudocoherent* over `R`, for `m : ℕ∞`
(Kedlaya–Liu II, Definition 1.1.1; the pseudo-coherence of SGA 6, Stacks Tag 064N): it has a
resolution `⋯ → P₁ → P₀ → M → 0` by projective modules with `Pᵢ` finitely generated for `i ≤ m`.
Stated with finite free terms `Fᵢ = R^{nᵢ}`, which is equivalent: maps `dᵢ : F_{i+1} → Fᵢ` and
`ε : F₀ → M` with `ε` surjective, exactness at `F₀` when `1 ≤ m`, and exactness at `F_{i+1}` when
`i + 2 ≤ m`. So `0`-pseudocoherent is `Module.Finite`, `1`-pseudocoherent is
`Module.FinitePresentation`, and pseudocoherent (`m = ⊤`) asks for an infinite resolution by
finite free modules. No topology is involved. -/
def IsPseudoCoherent (m : ℕ∞) : Prop :=
  ∃ (n : ℕ → ℕ) (d : ∀ i, (Fin (n (i + 1)) → R) →ₗ[R] (Fin (n i) → R))
    (ε : (Fin (n 0) → R) →ₗ[R] M),
    Function.Surjective ε ∧ (1 ≤ m → Function.Exact (d 0) ε) ∧
      ∀ i : ℕ, ((i + 2 : ℕ) : ℕ∞) ≤ m → Function.Exact (d (i + 1)) (d i)

/-- A3/pseudocoherent-module (structure): `M` is *`m`-fpd* over `R` (Kedlaya–Liu II,
Definition 1.1.1): it has a resolution `0 → P_m → ⋯ → P₀ → M → 0` by finitely generated
projective modules. Stated equivalently (Schanuel's lemma): `M` has a resolution by finite free
modules `Fᵢ = R^{nᵢ}` whose `m`-th syzygy — `M` itself for `m = 0`, the image of `d_{m-1}`
otherwise — is projective; that syzygy is finitely generated, as the image of `F_m`, and
truncating there gives the finite projective resolution of length `m`. -/
def IsFPD (m : ℕ) : Prop :=
  ∃ (n : ℕ → ℕ) (d : ∀ i, (Fin (n (i + 1)) → R) →ₗ[R] (Fin (n i) → R))
    (ε : (Fin (n 0) → R) →ₗ[R] M),
    Function.Surjective ε ∧ Function.Exact (d 0) ε ∧ (∀ i, Function.Exact (d (i + 1)) (d i)) ∧
      (m = 0 → Module.Projective R M) ∧
      ∀ k : ℕ, m = k + 1 → Module.Projective R (LinearMap.range (d k))

variable {R M}

/-- A3/pseudocoherent-module (characterisation): `0`-pseudocoherent means finitely generated. -/
theorem IsPseudoCoherent.zero_iff : IsPseudoCoherent R M 0 ↔ Module.Finite R M := sorry

/-- A3/pseudocoherent-module (characterisation): `1`-pseudocoherent means finitely presented. -/
theorem IsPseudoCoherent.one_iff :
    IsPseudoCoherent R M 1 ↔ Module.FinitePresentation R M := sorry

/-- A3/pseudocoherent-module (instance): a finitely generated projective module is
`m`-pseudocoherent for every `m` and `0`-fpd. -/
theorem IsPseudoCoherent.of_projective [Module.Finite R M] [Module.Projective R M] (m : ℕ∞) :
    IsPseudoCoherent R M m ∧ IsFPD R M 0 := sorry

/-- A3/pseudocoherent-module (relation): an fpd module is pseudocoherent. -/
theorem IsFPD.isPseudoCoherent {m : ℕ} (h : IsFPD R M m) : IsPseudoCoherent R M ⊤ := sorry

/-- A3/pseudocoherent-module (relation): `m`-pseudocoherent implies `m'`-pseudocoherent for
`m' ≤ m`. -/
theorem IsPseudoCoherent.mono {m m' : ℕ∞} (h : IsPseudoCoherent R M m) (hm : m' ≤ m) :
    IsPseudoCoherent R M m' := sorry

/-- A3/pseudocoherent-module (functoriality): tensor products (Kedlaya–Liu II, Remark 1.1.3:
totalise the tensor product of resolutions). The totalisation resolves `M ⊗[R] N` only when the
higher `Tor` of `M` and `N` vanish, which is why `M` is assumed flat here: without such a
hypothesis the claim fails (for `f`, `g` in a non-coherent domain with `fR ∩ gR` not finitely
generated, `R ⧸ (f) ⊗ R ⧸ (g) = R ⧸ (f, g)` is not `2`-pseudocoherent although both factors are
`1`-fpd). With `M` flat, an `m`-fpd `M` and an `n`-fpd `N` give an `(m + n)`-fpd product. -/
theorem IsPseudoCoherent.tensorProduct {N : Type*} [AddCommGroup N] [Module R N]
    [Module.Flat R M] {m : ℕ∞} (hM : IsPseudoCoherent R M m) (hN : IsPseudoCoherent R N m) :
    IsPseudoCoherent R (M ⊗[R] N) m ∧
      ∀ a b : ℕ, IsFPD R M a → IsFPD R N b → IsFPD R (M ⊗[R] N) (a + b) := sorry

/-- A3/pseudocoherent-module (functoriality): along a flat ring map `R → S`, base change takes
`m`-pseudocoherent (resp. `m`-fpd) modules to `m`-pseudocoherent (resp. `m`-fpd) `S`-modules. -/
theorem IsPseudoCoherent.baseChange_of_flat (S : Type*) [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    (∀ m : ℕ∞, IsPseudoCoherent R M m → IsPseudoCoherent S (S ⊗[R] M) m) ∧
      ∀ m : ℕ, IsFPD R M m → IsFPD S (S ⊗[R] M) m := sorry

/-- A3/pseudocoherent-module (relation): if `S` is a finite `R`-algebra which is pseudocoherent
as an `R`-module, an `S`-module is pseudocoherent over `S` iff it is pseudocoherent over `R`
(Stacks Tag 064Z). Base change `S ⊗[R] M` of a pseudocoherent `R`-module needs the vanishing of
`Tor^R_{>0}(S, M)` (for `S` flat it is `baseChange_of_flat`); without it `S = R ⧸ (g)`,
`M = R ⧸ (f)` in a non-coherent domain is a counterexample. -/
theorem IsPseudoCoherent.baseChange_of_isPseudoCoherent_algebra (S : Type*) [CommRing S]
    [Algebra R S] [Module.Finite R S] (hS : IsPseudoCoherent R S ⊤) (N : Type*)
    [AddCommGroup N] [Module S N] [Module R N] [IsScalarTower R S N] :
    IsPseudoCoherent S N ⊤ ↔ IsPseudoCoherent R N ⊤ := sorry

/-- A3/pseudocoherent-module (instance): over a noetherian ring every finitely generated module
is pseudocoherent. -/
theorem IsPseudoCoherent.of_isNoetherianRing [IsNoetherianRing R] [Module.Finite R M] :
    IsPseudoCoherent R M ⊤ := sorry

end PseudoCoherent

/- `0 → R →(×f) R → R ⧸ fR → 0` for a non-zero-divisor `f`. -/
-- test Module.IsPseudoCoherent.test_quotient_nonZeroDivisor (computation)
--   [A3/pseudocoherent-module]
example {R : Type*} [CommRing R] (f : R) (hf : IsSMulRegular R f) :
    IsFPD R (R ⧸ Ideal.span {f}) 1 ∧ IsPseudoCoherent R (R ⧸ Ideal.span {f}) ⊤ := sorry

-- test Module.IsPseudoCoherent.test_finiteProjective (degenerate) [A3/pseudocoherent-module]
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] :
    IsFPD R M 0 ∧ IsPseudoCoherent R M ⊤ ∧ IsFPD R (Fin 0 → R) 0 := sorry

/- `R = k[x, y₁, y₂, …] ⧸ (x yᵢ)`: `R ⧸ xR` is finitely presented, but the kernel `xR ≅ R ⧸ Ann x`
of `R → R ⧸ xR` is not finitely presented, since `Ann x = (y₁, y₂, …)` is not finitely
generated. -/
-- test Module.IsPseudoCoherent.test_not_two (non-example) [A3/pseudocoherent-module]
example (k : Type*) [Field k] :
    let J : Ideal (MvPolynomial (Option ℕ) k) :=
      Ideal.span (Set.range fun i : ℕ ↦ MvPolynomial.X none * MvPolynomial.X (some i))
    let x : MvPolynomial (Option ℕ) k ⧸ J := Ideal.Quotient.mk J (MvPolynomial.X none)
    Module.FinitePresentation (MvPolynomial (Option ℕ) k ⧸ J)
        ((MvPolynomial (Option ℕ) k ⧸ J) ⧸ Ideal.span {x}) ∧
      ¬ IsPseudoCoherent (MvPolynomial (Option ℕ) k ⧸ J)
        ((MvPolynomial (Option ℕ) k ⧸ J) ⧸ Ideal.span {x}) 2 := sorry

-- test Module.IsPseudoCoherent.test_noetherian (compatibility) [A3/pseudocoherent-module]
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [IsNoetherianRing R] :
    IsPseudoCoherent R M ⊤ ↔ Module.Finite R M := sorry

/-! ## AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three (lemma) -/

section TwoOutOfThree

variable {R M₁ M M₂ : Type*} [CommRing R] [AddCommGroup M₁] [Module R M₁] [AddCommGroup M]
  [Module R M] [AddCommGroup M₂] [Module R M₂]

/-- A3/pseudocoherent-two-out-of-three: for a short exact sequence `0 → M₁ → M → M₂ → 0`,
(a) `M₁`, `M₂` `m`-pseudocoherent ⇒ `M` is; (b) `M₁` `(m - 1)`-pseudocoherent and `M`
`m`-pseudocoherent ⇒ `M₂` is; (c) `M` `m`-pseudocoherent and `M₂` `(m + 1)`-pseudocoherent ⇒ `M₁`
is `m`-pseudocoherent (Kedlaya–Liu II, Lemma 1.1.5). -/
theorem IsPseudoCoherent.of_exact {f : M₁ →ₗ[R] M} {g : M →ₗ[R] M₂}
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g) (m : ℕ) :
    (IsPseudoCoherent R M₁ m → IsPseudoCoherent R M₂ m → IsPseudoCoherent R M m) ∧
      (IsPseudoCoherent R M₁ (m - 1 : ℕ) → IsPseudoCoherent R M m → IsPseudoCoherent R M₂ m) ∧
      (IsPseudoCoherent R M m → IsPseudoCoherent R M₂ (m + 1 : ℕ) → IsPseudoCoherent R M₁ m) :=
  sorry

/-- A3/pseudocoherent-two-out-of-three: the fpd analogue, clauses (d)–(f) of Kedlaya–Liu II,
Lemma 1.1.5: `M₁`, `M₂` `m`-fpd ⇒ `M` is; `M₁` `m`-fpd and `M` `(m + 1)`-fpd ⇒ `M₂` is
`(m + 1)`-fpd; `M` `m`-fpd and `M₂` `(m + 1)`-fpd ⇒ `M₁` is `m`-fpd. -/
theorem IsFPD.of_exact {f : M₁ →ₗ[R] M} {g : M →ₗ[R] M₂}
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g) (m : ℕ) :
    (IsFPD R M₁ m → IsFPD R M₂ m → IsFPD R M m) ∧
      (IsFPD R M₁ m → IsFPD R M (m + 1) → IsFPD R M₂ (m + 1)) ∧
      (IsFPD R M m → IsFPD R M₂ (m + 1) → IsFPD R M₁ m) := sorry

end TwoOutOfThree

/-! ## AdicEtaleGeometry:A3/koszul-regular-sequence-fpd (lemma) -/

/-- A3/koszul-regular-sequence-fpd: for a weakly regular sequence `f₁, …, f_r` on `R` (Mathlib
`RingTheory.Sequence.IsWeaklyRegular`), the Koszul complex resolves `R ⧸ (f)`, so `R ⧸ (f)` is
`r`-fpd and pseudocoherent, the ideal `(f)` is `(r - 1)`-fpd for `r ≥ 1`, and the conormal module
`(f) ⧸ (f)²` is free over `R ⧸ (f)` (with basis the classes of the `fᵢ`). -/
theorem IsFPD.quotient_of_isWeaklyRegular {R : Type*} [CommRing R] (f : List R)
    (hf : RingTheory.Sequence.IsWeaklyRegular R f) :
    IsFPD R (R ⧸ Ideal.ofList f) f.length ∧ IsPseudoCoherent R (R ⧸ Ideal.ofList f) ⊤ ∧
      (1 ≤ f.length → IsFPD R (Ideal.ofList f) (f.length - 1)) ∧
      Module.Free (R ⧸ Ideal.ofList f) (Ideal.ofList f).Cotangent := sorry

/-- A3/koszul-regular-sequence-fpd: weak regularity survives flat base change. -/
theorem isWeaklyRegular_map_of_flat {R R' : Type*} [CommRing R] [CommRing R'] [Algebra R R']
    [Module.Flat R R'] (f : List R) (hf : RingTheory.Sequence.IsWeaklyRegular R f) :
    RingTheory.Sequence.IsWeaklyRegular R' (f.map (algebraMap R R')) := sorry

end Module

namespace Huber

/-! ## AdicEtaleGeometry:A3/natural-topology-strict-exactness (lemma) -/

section NaturalTopology

/-- A3/natural-topology-strict-exactness (supporting): the `B`-module `N` is complete and
Hausdorff for its natural topology, Mathlib's `moduleTopology B N` with the canonical uniformity
of the topological additive group. For a finitely generated `N` this is the quotient topology of
any surjection `Bⁿ → N` (Kedlaya–Liu II, §1.2). -/
def IsNaturallyComplete (B : Type*) (N : Type*) [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [AddCommGroup N] [Module B N] : Prop :=
  letI := moduleTopology B N
  haveI : IsModuleTopology B N := ⟨rfl⟩
  letI : UniformSpace N :=
    @IsTopologicalAddGroup.rightUniformSpace N _ _ (IsModuleTopology.isTopologicalAddGroup B N)
  CompleteSpace N ∧ T2Space N

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A3/natural-topology-strict-exactness (d): over a complete Tate ring, a finitely generated
submodule of a module complete for its natural topology is closed and complete (Kedlaya–Liu II,
Corollary 1.2.11). Clause (a) is Mathlib's `IsModuleTopology` (every linear map out of `M` is
continuous, `IsModuleTopology.continuous_of_linearMap`); clause (b) is the open mapping theorem
of Tau Ceti's `TauCeti.Topology.Algebra.OpenMapping` modules; clause (f) is
AdicSpacesPartII:R0/strict-complex-completion-exact. -/
theorem finite_submodule_isClosed {M : Type*} [AddCommGroup M] [Module A M] [TopologicalSpace M]
    [IsModuleTopology A M] (hM : IsNaturallyComplete A M) (N : Submodule A M) (hN : N.FG) :
    IsClosed (N : Set M) ∧ IsNaturallyComplete A N := sorry

/-- A3/natural-topology-strict-exactness (c): a finitely generated module Hausdorff for its
natural topology is complete for it. -/
theorem isNaturallyComplete_of_t2 {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
    (h : @T2Space M (moduleTopology A M)) : IsNaturallyComplete A M := sorry

/-- A3/natural-topology-strict-exactness (c): if `M` is finitely generated and Hausdorff for its
natural topology, the kernel of every surjection `Aⁿ → M` is closed. -/
theorem isClosed_ker_of_t2 {M : Type*} [AddCommGroup M] [Module A M] [TopologicalSpace M]
    [IsModuleTopology A M] [T2Space M] {n : ℕ} (q : (Fin n → A) →ₗ[A] M)
    (hq : Function.Surjective q) : IsClosed (LinearMap.ker q : Set (Fin n → A)) := sorry

/-- A3/natural-topology-strict-exactness (e): finite projective modules are complete for their
natural topology. -/
theorem isNaturallyComplete_of_projective {M : Type*} [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] : IsNaturallyComplete A M := sorry

end NaturalTopology

/-! ## AdicEtaleGeometry:A3/stably-pseudocoherent-module (definition) -/

section RatLoc

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (P : PairOfDefinition A) (T : Finset A) (s : A)
  (hden : P.HasDenominatorPower T s (Localization.Away s))

/-- A3/stably-pseudocoherent-module (supporting): the completed rational localisation
`A⟨T/s⟩` of Tau Ceti (`PairOfDefinition.locUniformSpace`, `toCompletionLoc`,
`completionLocalization`): the separated completion of `A[1/s]` for Wedhorn's localisation
topology. When `T` generates an open ideal it is the ring `𝒪(R(T/s))` of the anchor's structure
presheaf (AdicSpaces Layer 3); it does not depend on the ring of integral elements. -/
def ratLoc : Type _ :=
  @UniformSpace.Completion (Localization.Away s) (P.locUniformSpace T s _ hden)

instance : UniformSpace (ratLoc P T s hden) :=
  @UniformSpace.Completion.uniformSpace _ (P.locUniformSpace T s _ hden)

set_option warn.classDefReducibility false in
/-- A3/stably-pseudocoherent-module (supporting): the ring structure of `A⟨T/s⟩`, that of the
completion. A plain definition, so that instance search treats it as an atom. -/
def ratLocCommRing : CommRing (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  UniformSpace.Completion.commRing (Localization.Away s)

instance : CommRing (ratLoc P T s hden) := ratLocCommRing P T s hden

instance : IsUniformAddGroup (ratLoc P T s hden) := sorry

instance : IsTopologicalRing (ratLoc P T s hden) := sorry

instance : CompleteSpace (ratLoc P T s hden) :=
  @UniformSpace.Completion.completeSpace _ (P.locUniformSpace T s _ hden)

instance : T2Space (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  inferInstanceAs (T2Space (UniformSpace.Completion (Localization.Away s)))

instance : Algebra A (ratLoc P T s hden) :=
  letI := P.locUniformSpace T s (Localization.Away s) hden
  haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
  haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
  (P.toCompletionLoc T s (Localization.Away s) hden).toAlgebra

instance : IsHuberRing (ratLoc P T s hden) := sorry

instance [IsTateRing A] : IsTateRing (ratLoc P T s hden) := sorry

/-- A3/stably-pseudocoherent-module (supporting): the rational localisation as a Huber pair,
with Tau Ceti's plus ring `PairOfDefinition.completedPlusSubring`. -/
def ratLocPair [IsHuberRing A] (Aplus : Pair A) : Pair (ratLoc P T s hden) where
  plus := P.completedPlusSubring Aplus.plus T s (Localization.Away s) hden
  isRingOfIntegralElements := sorry

end RatLoc

section StablyPseudoCoherent

universe u

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (M : Type*) [AddCommGroup M] [Module A M]

/-- A3/stably-pseudocoherent-module (structure): `M` is *strictly `m`-pseudocoherent*: it is
`m`-pseudocoherent and complete Hausdorff for its natural topology (Kedlaya–Liu II,
Definition 1.2.13). -/
def IsStrictlyPseudoCoherent (m : ℕ∞) : Prop :=
  Module.IsPseudoCoherent A M m ∧ IsNaturallyComplete A M

/-- A3/stably-pseudocoherent-module (structure): `M` is *stably `m`-pseudocoherent* over the
complete Tate ring `A` (Kedlaya–Liu II, Definition 2.4.1): it is `m`-pseudocoherent and, for every
rational localisation `B = A⟨T/s⟩` (`T` generating an open ideal; `ratLoc`), the algebraic tensor
product `B ⊗[A] M` is complete for its natural topology as a `B`-module. The identity
localisation is included, so stably implies strictly. The rings `A⟨T/s⟩` do not depend on the
plus ring, so no plus ring is an argument; no sheafiness is assumed. -/
def IsStablyPseudoCoherent (m : ℕ∞) : Prop :=
  Module.IsPseudoCoherent A M m ∧
    ∀ (P : PairOfDefinition A) (T : Finset A) (s : A)
      (hden : P.HasDenominatorPower T s (Localization.Away s)),
      IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A) →
        IsNaturallyComplete (ratLoc P T s hden) (ratLoc P T s hden ⊗[A] M)

/-- A3/stably-pseudocoherent-module (structure): the fpd analogue, stably `m`-fpd. -/
def IsStablyFPD (m : ℕ) : Prop :=
  Module.IsFPD A M m ∧
    ∀ (P : PairOfDefinition A) (T : Finset A) (s : A)
      (hden : P.HasDenominatorPower T s (Localization.Away s)),
      IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A) →
        IsNaturallyComplete (ratLoc P T s hden) (ratLoc P T s hden ⊗[A] M)

variable {A M}

/-- A3/stably-pseudocoherent-module (relation): stably implies strictly (identity
localisation). -/
theorem IsStablyPseudoCoherent.isStrictlyPseudoCoherent {m : ℕ∞}
    (h : IsStablyPseudoCoherent A M m) : IsStrictlyPseudoCoherent A M m := sorry

/-- A3/stably-pseudocoherent-module (relation): stably fpd implies stably pseudocoherent. -/
theorem IsStablyFPD.isStablyPseudoCoherent {m : ℕ} (h : IsStablyFPD A M m) :
    IsStablyPseudoCoherent A M ⊤ := sorry

/-- A3/stably-pseudocoherent-module (projection): a stably (or strictly) pseudocoherent module is
complete Hausdorff for its natural topology. -/
theorem IsStablyPseudoCoherent.completeSpace {m : ℕ∞} (h : IsStablyPseudoCoherent A M m) :
    IsNaturallyComplete A M := sorry

end StablyPseudoCoherent

section StablyPseudoCoherentComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] {M : Type*} [AddCommGroup M] [Module A M]

/-- A3/stably-pseudocoherent-module (instance): finite projective modules over a complete Tate
ring are stably pseudocoherent and stably `0`-fpd. -/
theorem IsStablyPseudoCoherent.of_projective [Module.Finite A M] [Module.Projective A M] :
    IsStablyPseudoCoherent A M ⊤ ∧ IsStablyFPD A M 0 := sorry

/-- A3/stably-pseudocoherent-module (instance): over a strongly noetherian complete Tate ring
(Tau Ceti `IsStronglyNoetherian`), finitely generated modules are stably pseudocoherent. -/
theorem IsStablyPseudoCoherent.of_isStronglyNoetherian [IsStronglyNoetherian A]
    [Module.Finite A M] : IsStablyPseudoCoherent A M ⊤ := sorry

end StablyPseudoCoherentComplete

-- Huber.IsStablyPseudoCoherent.baseChange: not stated here; needs the anchor's sheafiness
--   predicate `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4). Its ring-level core, base
--   change along a `2`-pseudoflat rational localisation, is
--   `Huber.IsPseudoFlat.baseChange_isStablyPseudoCoherent`; the sousperfectoid case is
--   `Huber.isPseudoFlat_ratLoc_sousperfectoid`.
-- Huber.IsStablyPseudoCoherent.of_exact: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4). Its ring-level inputs are
--   `Module.IsPseudoCoherent.of_exact` and `Huber.exact_tensor_ratLoc_sousperfectoid`.

section StablyTests

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

-- test Huber.IsStablyPseudoCoherent.test_finiteProjective (degenerate)
--   [A3/stably-pseudocoherent-module]
example {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M] :
    IsStablyPseudoCoherent A M ⊤ ∧ IsStablyFPD A M 0 ∧
      ∀ (P : PairOfDefinition A) (T : Finset A) (s : A)
        (hden : P.HasDenominatorPower T s (Localization.Away s)),
        Module.Projective (ratLoc P T s hden) (ratLoc P T s hden ⊗[A] M) := sorry

-- test Huber.IsStablyPseudoCoherent.test_strongly_noetherian (compatibility)
--   [A3/stably-pseudocoherent-module]
example [IsStronglyNoetherian A] {M : Type*} [AddCommGroup M] [Module A M] :
    IsStablyPseudoCoherent A M ⊤ ↔ Module.Finite A M := sorry

end StablyTests

/-! ## AdicEtaleGeometry:A3/pseudoflat-module (definition) -/

section PseudoFlat

universe u

variable (A : Type u) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- A3/pseudoflat-module (structure): the `A`-module `B` is *`m`-pseudoflat* (Kedlaya–Liu II,
Definition 2.4.4): `Tor₁^A(Q, B) = 0` for every stably `m`-pseudocoherent `A`-module `Q`. Every
finitely generated `Q` is a quotient `Aⁿ ⧸ K`, and since `Aⁿ` is flat,
`Tor₁^A(Aⁿ ⧸ K, B) = ker (K ⊗ B → Aⁿ ⊗ B)`; so the definition asks that `K ⊗ B → Aⁿ ⊗ B` be
injective whenever `Aⁿ ⧸ K` is stably `m`-pseudocoherent. `Tor` is algebraic. -/
def IsPseudoFlat (B : Type*) [AddCommGroup B] [Module A B] (m : ℕ∞) : Prop :=
  ∀ (n : ℕ) (K : Submodule A (Fin n → A)),
    IsStablyPseudoCoherent A ((Fin n → A) ⧸ K) m → Function.Injective (K.subtype.rTensor B)

/-- A3/pseudoflat-module (structure): `B` is *pro-projective* (Kedlaya–Liu II, Definition 2.4.6):
it carries a directed family of continuous `A`-linear projectors `πₖ` with finite projective
images and `πₖ v → v` for every `v`. -/
def IsProProjective (B : Type*) [AddCommGroup B] [Module A B] [TopologicalSpace B] : Prop :=
  ∃ (ι : Type u) (_ : SemilatticeSup ι) (_ : Nonempty ι) (π : ι → B →ₗ[A] B),
    (∀ k, Continuous (π k)) ∧ (∀ k, (π k).comp (π k) = π k) ∧
      (∀ k, Module.Finite A (LinearMap.range (π k)) ∧
        Module.Projective A (LinearMap.range (π k))) ∧
      ∀ v, Tendsto (fun k ↦ π k v) atTop (𝓝 v)

variable {A} {B : Type*} [AddCommGroup B] [Module A B]

/-- A3/pseudoflat-module (relation): flat modules are `m`-pseudoflat for every `m`. -/
theorem IsPseudoFlat.of_flat [Module.Flat A B] (m : ℕ∞) : IsPseudoFlat A B m := sorry

/-- A3/pseudoflat-module (relation): pro-projective modules are `2`-pseudoflat
(A3/restricted-power-series-pro-projective (b)). -/
theorem IsPseudoFlat.of_isProProjective [TopologicalSpace B] (h : IsProProjective A B) :
    IsPseudoFlat A B 2 := sorry

/-- A3/pseudoflat-module (characterisation): Kedlaya–Liu II, Remark 2.4.5(c): `B` is
`m`-pseudoflat iff `K ⊗ B → N ⊗ B` is injective for every short exact sequence
`0 → K → N → Q → 0` with `N` finite projective and `Q` stably `m`-pseudocoherent. -/
theorem IsPseudoFlat.iff_injective_rTensor (m : ℕ∞) :
    IsPseudoFlat A B m ↔
      ∀ (K N Q : Type u) [AddCommGroup K] [Module A K] [AddCommGroup N] [Module A N]
        [AddCommGroup Q] [Module A Q] [Module.Finite A N] [Module.Projective A N]
        (i : K →ₗ[A] N) (q : N →ₗ[A] Q), Function.Injective i → Function.Exact i q →
          Function.Surjective q → IsStablyPseudoCoherent A Q m →
            Function.Injective (i.rTensor B) := sorry

/-- A3/pseudoflat-module (relation): `m`-pseudoflat implies `m'`-pseudoflat for `m ≤ m'`; in
particular `2`-pseudoflat implies pseudoflat. -/
theorem IsPseudoFlat.mono {m m' : ℕ∞} (h : IsPseudoFlat A B m) (hm : m ≤ m') :
    IsPseudoFlat A B m' := sorry

/-- A3/pseudoflat-module (functoriality): a `2`-pseudoflat rational localisation `A → A⟨T/s⟩`
followed by a `2`-pseudoflat `A⟨T/s⟩`-algebra is `2`-pseudoflat over `A`. -/
theorem IsPseudoFlat.comp (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hden : P.HasDenominatorPower T s (Localization.Away s)) {D : Type*} [CommRing D]
    [Algebra (ratLoc P T s hden) D] [Algebra A D] [IsScalarTower A (ratLoc P T s hden) D]
    (hU : IsPseudoFlat A (ratLoc P T s hden) 2) (hD : IsPseudoFlat (ratLoc P T s hden) D 2) :
    IsPseudoFlat A D 2 := sorry

/-- A3/pseudoflat-module (functoriality): along a `2`-pseudoflat rational localisation
`A → B = A⟨T/s⟩`, `M ↦ B ⊗[A] M` takes stably pseudocoherent `A`-modules to stably pseudocoherent
`B`-modules. -/
theorem IsPseudoFlat.baseChange_isStablyPseudoCoherent (P : PairOfDefinition A) (T : Finset A)
    (s : A) (hden : P.HasDenominatorPower T s (Localization.Away s)) {M : Type*}
    [AddCommGroup M] [Module A M] (hU : IsPseudoFlat A (ratLoc P T s hden) 2)
    (hM : IsStablyPseudoCoherent A M ⊤) :
    IsStablyPseudoCoherent (ratLoc P T s hden) (ratLoc P T s hden ⊗[A] M) ⊤ := sorry

end PseudoFlat

section TateCoord

variable (n : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]

/-- A3/pseudoflat-module (supporting): the coordinate `Tᵢ` of the Tate algebra
`A⟨T₁, …, T_n⟩ = restrictedMvPowerSeriesCompletion n A` (Tau Ceti `weightedX` at the trivial
weights, read in the completion). -/
def tateCoord (i : Fin n) : restrictedMvPowerSeriesCompletion n A :=
  ((weightedX (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight i :
    weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight) :
      UniformSpace.Completion _)

/-- A3/pseudoflat-module (supporting): the restricted Laurent series ring `A⟨T^{±1}⟩`, presented
as `A⟨T, S⟩ ⧸ (T S - 1)` with the quotient topology. -/
abbrev restrictedLaurentSeries : Type _ :=
  restrictedMvPowerSeriesCompletion 2 A ⧸
    Ideal.span {tateCoord 2 A 0 * tateCoord 2 A 1 - 1}

end TateCoord

section PseudoFlatTests

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

-- test Huber.IsPseudoFlat.test_flat (compatibility) [A3/pseudoflat-module]
example {B : Type*} [AddCommGroup B] [Module A B] [Module.Flat A B] :
    ∀ m : ℕ∞, IsPseudoFlat A B m := sorry

-- test Huber.IsPseudoFlat.test_restrictedPowerSeries (computation) [A3/pseudoflat-module]
example :
    IsProProjective A (restrictedMvPowerSeriesCompletion 1 A) ∧
      IsPseudoFlat A (restrictedMvPowerSeriesCompletion 1 A) 2 ∧
      IsProProjective A (restrictedLaurentSeries A) ∧
      IsPseudoFlat A (restrictedLaurentSeries A) 2 := sorry

-- test Huber.IsPseudoFlat.test_iff_injective (characterisation) [A3/pseudoflat-module]
example {B : Type*} [AddCommGroup B] [Module A B] (m : ℕ∞) :
    IsPseudoFlat A B m ↔
      ∀ (n : ℕ) (K : Submodule A (Fin n → A)),
        IsStablyPseudoCoherent A ((Fin n → A) ⧸ K) m → Function.Injective (K.subtype.rTensor B) :=
  sorry

end PseudoFlatTests

section PadicTests

variable (p : ℕ) [Fact p.Prime]

/- `ℚ_p⟨T⟩ ⧸ (T)` is stably `1`-fpd and its base change to every rational localisation `B` is
`B ⧸ T B`. -/
-- test Huber.IsStablyPseudoCoherent.test_tateAlgebra_quotient (computation)
--   [A3/stably-pseudocoherent-module]
example :
    IsStablyFPD (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (restrictedMvPowerSeriesCompletion 1 ℚ_[p] ⧸
          Ideal.span {tateCoord 1 ℚ_[p] 0}) 1 ∧
      ∀ (P : PairOfDefinition (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
        (T : Finset (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
        (s : restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (hden : P.HasDenominatorPower T s (Localization.Away s)),
        Nonempty (ratLoc P T s hden ⊗[restrictedMvPowerSeriesCompletion 1 ℚ_[p]]
            (restrictedMvPowerSeriesCompletion 1 ℚ_[p] ⧸ Ideal.span {tateCoord 1 ℚ_[p] 0}) ≃ₗ[
              ratLoc P T s hden]
          (ratLoc P T s hden ⧸
            Ideal.span {algebraMap _ (ratLoc P T s hden) (tateCoord 1 ℚ_[p] 0)})) :=
  sorry

/- `Tor₁(A ⧸ T A, A ⧸ T A) ≅ A ⧸ T A ≠ 0` for `A = ℚ_p⟨T⟩`. -/
-- test Huber.IsPseudoFlat.test_quotient_not (non-example) [A3/pseudoflat-module]
example :
    ¬ IsPseudoFlat (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p] ⧸ Ideal.span {tateCoord 1 ℚ_[p] 0}) 1 := sorry

/- Kedlaya–Liu II, Example 2.4.2: a perfectoid `A` and a non-zero-divisor `f` with `f A` closed
but `f B` not closed for some rational localisation `B`. -/
-- test Huber.IsStablyPseudoCoherent.test_not_stably (non-example)
--   [A3/stably-pseudocoherent-module]
example :
    ∃ (A : Type) (_ : CommRing A) (_ : UniformSpace A) (_ : IsUniformAddGroup A)
      (_ : IsTopologicalRing A) (f : A),
      Perfectoid.IsPerfectoidTateRing p A ∧ IsSMulRegular A f ∧
        IsClosed ((Ideal.span {f} : Ideal A) : Set A) ∧
        IsStrictlyPseudoCoherent A (A ⧸ Ideal.span {f}) ⊤ ∧
        ¬ IsStablyPseudoCoherent A (A ⧸ Ideal.span {f}) ⊤ := sorry

end PadicTests

/-! ## AdicEtaleGeometry:A3/restricted-power-series-pro-projective (lemma) -/

section ProProjective

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A3/restricted-power-series-pro-projective (a): `A⟨T₁, …, T_n⟩` is pro-projective, through the
truncation projectors (Kedlaya–Liu II, Lemma 2.4.7). -/
theorem isProProjective_restrictedMvPowerSeriesCompletion (n : ℕ) :
    IsProProjective A (restrictedMvPowerSeriesCompletion n A) := sorry

/-- A3/restricted-power-series-pro-projective (a): `A⟨T^{±1}⟩` is pro-projective. -/
theorem isProProjective_restrictedLaurentSeries :
    IsProProjective A (restrictedLaurentSeries A) := sorry

/-- A3/restricted-power-series-pro-projective (supporting): the `A`-module `M⟨T⟩` of null
sequences in a topological `A`-module `M`. -/
def nullSequences (M : Type*) [AddCommGroup M] [Module A M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [ContinuousSMul A M] : Submodule A (ℕ → M) where
  carrier := {f | Tendsto f atTop (𝓝 0)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- A3/restricted-power-series-pro-projective (c): for `M` finitely presented and complete for
its natural topology, `M ⊗[A] A⟨T⟩ ≅ M⟨T⟩`, the module of null sequences (Kedlaya–Liu II,
Corollary 2.4.9). -/
theorem tensor_restrictedPowerSeries_equiv {M : Type*} [AddCommGroup M] [Module A M]
    [TopologicalSpace M] [IsModuleTopology A M] [IsTopologicalAddGroup M] [ContinuousSMul A M]
    [Module.FinitePresentation A M] (hM : IsNaturallyComplete A M) :
    Nonempty (restrictedMvPowerSeriesCompletion 1 A ⊗[A] M ≃ₗ[A] nullSequences (A := A) M) :=
  sorry

end ProProjective

/-! ## AdicEtaleGeometry:A3/simple-laurent-strict-multiplication (lemma) -/

-- Huber.isStrictMap_mul_X_sub: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4). The sousperfectoid case (sousperfectoid
--   rings are sheafy, AdicSpacesPartII:R5/sousperfectoid-sheafy), which is the one A3 uses, is
--   `Huber.isStrictMap_mul_X_sub_sousperfectoid`.

section SimpleLaurent

variable (p : ℕ) {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A3/simple-laurent-strict-multiplication (core): for a complete sousperfectoid Tate ring `A`
and `f ∈ A`, multiplication by `T - f` and by `1 - f T` on `A⟨T⟩` are strict injections with
closed image (Kedlaya–Liu II, Lemma 2.4.10, for a sheafy base). -/
theorem isStrictMap_mul_X_sub_sousperfectoid [IsSousperfectoid p A] (f : A) :
    IsClosedEmbedding (fun x : restrictedMvPowerSeriesCompletion 1 A ↦
        (tateCoord 1 A 0 - algebraMap A _ f) * x) ∧
      IsClosedEmbedding (fun x : restrictedMvPowerSeriesCompletion 1 A ↦
        (1 - algebraMap A _ f * tateCoord 1 A 0) * x) := sorry

variable (A)

/-- A3/simple-laurent-strict-multiplication (supporting): `B₁ = A⟨T⟩ ⧸ (T - f)`, the ring of
`{v(f) ≤ 1}`. -/
abbrev simpleLaurentLe (f : A) : Type _ :=
  restrictedMvPowerSeriesCompletion 1 A ⧸ Ideal.span {tateCoord 1 A 0 - algebraMap A _ f}

/-- A3/simple-laurent-strict-multiplication (supporting): `B₂ = A⟨T⟩ ⧸ (1 - f T)`, the ring of
`{v(f) ≥ 1}`. -/
abbrev simpleLaurentGe (f : A) : Type _ :=
  restrictedMvPowerSeriesCompletion 1 A ⧸ Ideal.span {1 - algebraMap A _ f * tateCoord 1 A 0}

/-- A3/simple-laurent-strict-multiplication (supporting): `B₁₂ = A⟨T^{±1}⟩ ⧸ (T - f)`, the ring
of `{v(f) = 1}`. -/
abbrev simpleLaurentEq (f : A) : Type _ :=
  restrictedLaurentSeries A ⧸
    Ideal.span {Ideal.Quotient.mk _ (tateCoord 2 A 0) - algebraMap A (restrictedLaurentSeries A) f}

end SimpleLaurent

/-! ## AdicEtaleGeometry:A3/simple-laurent-pseudoflat (lemma) -/

-- Huber.isPseudoFlat_simpleLaurent: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4); the sousperfectoid case is
--   `Huber.isPseudoFlat_simpleLaurent_sousperfectoid`.

/-- A3/simple-laurent-pseudoflat (core): over a complete sousperfectoid Tate ring, the three
rings `B₁`, `B₂`, `B₁₂` of a simple Laurent covering are `2`-pseudoflat (Kedlaya–Liu II,
Lemmas 2.4.12–2.4.13, for a sheafy base). -/
theorem isPseudoFlat_simpleLaurent_sousperfectoid (p : ℕ) {A : Type*} [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A]
    [T2Space A] [IsSousperfectoid p A] (f : A) :
    IsPseudoFlat A (simpleLaurentLe A f) 2 ∧ IsPseudoFlat A (simpleLaurentGe A f) 2 ∧
      IsPseudoFlat A (simpleLaurentEq A f) 2 := sorry

end Huber

/-! ## AdicEtaleGeometry:A3/rational-inclusion-reduction (lemma) -/

open ValuationSpectrum in
/-- A3/rational-inclusion-reduction: Kedlaya–Liu I, Proposition 2.4.24. A property `Q` of
inclusions `V ⊆ U` of rational subsets of `Spa(A, A⁺)`, transitive and true for the two members
`U ∩ {v(t) ≤ v(sⁿ)}` and `U ∩ {v(sⁿ) ≤ v(t)}` of every simple Laurent covering of `U = R(T/s)` by
a function `t / sⁿ ∈ 𝒪(U)`, holds for every inclusion of rational subsets. (Every `h ∈ 𝒪(U)` may
be replaced by such a `t / sⁿ` without changing the Laurent pieces, since `A[1/s]` is dense in
`𝒪(U)`.) -/
theorem ValuationSpectrum.rationalInclusion_induction {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsTateRing A] [DecidableEq A]
    (Aplus : Subring A)
    (Q : Set (ValuationSpectrum A) → Set (ValuationSpectrum A) → Prop)
    (htrans : ∀ U V W, Q V U → Q W V → Q W U)
    (hlaurent : ∀ (T : Finset A) (s t : A) (n : ℕ),
      IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A) →
        Q (rationalSubset Aplus T s ∩ rationalSubset Aplus {t, s ^ n} (s ^ n))
            (rationalSubset Aplus T s) ∧
          Q (rationalSubset Aplus T s ∩ rationalSubset Aplus {s ^ n, t} t)
            (rationalSubset Aplus T s))
    (T T' : Finset A) (s s' : A) (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A))
    (hT' : IsOpen ((Ideal.span (T' : Set A) : Ideal A) : Set A))
    (h : rationalSubset Aplus T' s' ⊆ rationalSubset Aplus T s) :
    Q (rationalSubset Aplus T' s') (rationalSubset Aplus T s) := sorry

namespace Huber

section SheafyCores

variable (p : ℕ) {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]

/-! ## AdicEtaleGeometry:A3/rational-localisation-pseudoflat (theorem) -/

-- Huber.isPseudoFlat_ratLoc: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4); the sousperfectoid case is
--   `Huber.isPseudoFlat_ratLoc_sousperfectoid`.

/-- A3/rational-localisation-pseudoflat (core): Kedlaya–Liu II, Theorem 2.4.15, for a complete
sousperfectoid Tate ring (sousperfectoid rings are sheafy): every rational localisation
`A → A⟨T/s⟩` is `2`-pseudoflat. With `IsPseudoFlat.baseChange_isStablyPseudoCoherent` this
gives the base change of stably pseudocoherent modules. -/
theorem isPseudoFlat_ratLoc_sousperfectoid [IsSousperfectoid p A] (P : PairOfDefinition A)
    (T : Finset A) (s : A) (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) :
    IsPseudoFlat A (ratLoc P T s hden) 2 := sorry

/-! ## AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity (theorem) -/

-- Huber.cech_exact_of_isStablyPseudoCoherent: not stated here; needs the anchor's sheafiness
--   predicate `Huber.IsSheafyPair` and the structure presheaf on the finite intersections of a
--   rational covering (supplier: AdicSpaces Layers 3–4). Its degree-zero part over a
--   sousperfectoid base is `Huber.cech_injective_of_isStablyPseudoCoherent_sousperfectoid`.

/-- A3/pseudocoherent-tate-acyclicity (core, degree zero): Kedlaya–Liu II, Theorem 2.5.1. For a
complete sousperfectoid Tate pair `(A, A⁺)`, a finite covering of `Spa(A, A⁺)` by rational
subsets `R(Tᵢ/sᵢ)` and a stably pseudocoherent `M`, the augmentation `M → ∏ᵢ A⟨Tᵢ/sᵢ⟩ ⊗[A] M` of
the Čech complex is injective. -/
theorem cech_injective_of_isStablyPseudoCoherent_sousperfectoid [IsSousperfectoid p A]
    (Aplus : Pair A) {r : ℕ} (P : PairOfDefinition A) (T : Fin r → Finset A) (s : Fin r → A)
    (hden : ∀ i, P.HasDenominatorPower (T i) (s i) (Localization.Away (s i)))
    (hT : ∀ i, IsOpen ((Ideal.span (T i : Set A) : Ideal A) : Set A))
    (hcov : ValuationSpectrum.spa Aplus.plus ⊆
      ⋃ i, ValuationSpectrum.rationalSubset Aplus.plus (T i) (s i))
    {M : Type*} [AddCommGroup M] [Module A M] (hM : IsStablyPseudoCoherent A M ⊤) :
    Function.Injective fun x : M ↦ fun i ↦ (1 : ratLoc P (T i) (s i) (hden i)) ⊗ₜ[A] x := sorry

/-! ## AdicEtaleGeometry:A3/fpd-local-to-global (lemma) -/

-- Huber.IsStablyPseudoCoherent.isFPD_of_cover: not stated here; needs the anchor's sheafiness
--   predicate `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 4); the sousperfectoid case is
--   `Huber.IsStablyPseudoCoherent.isFPD_of_cover_sousperfectoid`.

/-- A3/fpd-local-to-global (core): Kedlaya–Liu II, Corollary 2.5.2, over a complete
sousperfectoid Tate pair: a stably pseudocoherent `M` whose base changes to the members of a
finite rational covering are `m`-fpd is `m`-fpd; for `m = 0`, local finite projectivity is
global. -/
theorem IsStablyPseudoCoherent.isFPD_of_cover_sousperfectoid [IsSousperfectoid p A]
    (Aplus : Pair A) {r : ℕ} (P : PairOfDefinition A) (T : Fin r → Finset A) (s : Fin r → A)
    (hden : ∀ i, P.HasDenominatorPower (T i) (s i) (Localization.Away (s i)))
    (hT : ∀ i, IsOpen ((Ideal.span (T i : Set A) : Ideal A) : Set A))
    (hcov : ValuationSpectrum.spa Aplus.plus ⊆
      ⋃ i, ValuationSpectrum.rationalSubset Aplus.plus (T i) (s i))
    {M : Type*} [AddCommGroup M] [Module A M] (hM : IsStablyPseudoCoherent A M ⊤) (m : ℕ)
    (h : ∀ i, Module.IsFPD (ratLoc P (T i) (s i) (hden i))
      (ratLoc P (T i) (s i) (hden i) ⊗[A] M) m) :
    Module.IsFPD A M m := sorry

end SheafyCores

/-! ## AdicEtaleGeometry:A3/pseudocoherent-sheaf (definition) -/

-- AdicSpace.IsPseudoCoherentSheaf: not stated here; needs the anchor's adic spaces and their
--   sheaves of `𝒪_X`-modules (supplier: AdicSpaces Layer 5). Its affinoid input is
--   `Huber.IsStablyPseudoCoherent`.
-- AdicSpace.IsFPDSheaf: not stated here; needs the anchor's adic spaces and their sheaves of
--   `𝒪_X`-modules (supplier: AdicSpaces Layer 5). Its affinoid input is `Huber.IsStablyFPD`.
-- AdicSpace.IsPseudoCoherentSheaf.of_module: not stated here; needs `𝒪_X`-modules `M̃` on
--   `Spa(A, A⁺)` and sheafiness (supplier: AdicSpaces Layers 4–5). Ring-level core:
--   `Huber.IsPseudoFlat.baseChange_isStablyPseudoCoherent`.
-- AdicSpace.IsPseudoCoherentSheaf.restrict: not stated here; needs open subspaces of adic spaces
--   and restriction of `𝒪_X`-modules (supplier: AdicSpaces Layer 5).
-- AdicSpace.IsPseudoCoherentSheaf.ker_of_surjective: not stated here; needs the abelian category
--   of `𝒪_X`-modules on an adic space (supplier: AdicSpaces Layer 5). Ring-level core:
--   `Module.IsPseudoCoherent.of_exact`.
-- AdicSpace.IsPseudoCoherentSheaf.coker_of_injective: not stated here; needs the abelian category
--   of `𝒪_X`-modules on an adic space (supplier: AdicSpaces Layer 5). Ring-level core:
--   `Module.IsPseudoCoherent.of_exact`.
-- AdicSpace.IsPseudoCoherentSheaf.isStablyPseudoCoherent_sections: not stated here; needs global
--   sections of `𝒪_X`-modules on `Spa(A, A⁺)` (supplier: AdicSpaces Layer 5); see
--   AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing.
-- AdicSpace.IsPseudoCoherentSheaf.equivModule: not stated here; needs the category of
--   `𝒪_X`-modules on `Spa(A, A⁺)` and sheafiness (supplier: AdicSpaces Layers 4–5); see
--   AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing.
-- AdicSpace.IsFPDSheaf.isPseudoCoherentSheaf: not stated here; needs the anchor's `𝒪_X`-modules
--   (supplier: AdicSpaces Layer 5). Ring-level core: `Huber.IsStablyFPD.isStablyPseudoCoherent`.
-- AdicSpace.IsPseudoCoherentSheaf.test_structureSheaf: not stated here; needs the structure sheaf
--   of `Spa(A, A⁺)` as an `𝒪_X`-module (supplier: AdicSpaces Layers 4–5); ring-level core
--   `Huber.IsStablyPseudoCoherent.of_projective` [degenerate test]
-- AdicSpace.IsPseudoCoherentSheaf.test_vectorBundle: not stated here; needs vector bundles on adic
--   spaces (supplier: AdicSpacesPartII:R3/locally-free-sheaf) [compatibility test]
-- AdicSpace.IsPseudoCoherentSheaf.test_tateAlgebra_ideal: not stated here; needs `𝒪_X`-modules on
--   `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` (supplier: AdicSpaces Layer 5); ring-level core
--   `Huber.IsStablyPseudoCoherent.test_tateAlgebra_quotient` [computation test]
-- AdicSpace.IsPseudoCoherentSheaf.test_pushforward_not: not stated here; needs pushforward of
--   `𝒪_U` along a rational open immersion (supplier: AdicSpaces Layer 5) [non-example test]

/-! ## AdicEtaleGeometry:A3/simple-laurent-pseudocoherent-descent (lemma) -/

-- Huber.effectiveDescent_simpleLaurent: not stated here; needs the anchor's sheafiness predicate
--   `Huber.IsSheafyPair` and the restriction maps `Bᵢ → B₁₂` of the structure presheaf on a
--   simple Laurent covering (supplier: AdicSpaces Layers 3–4). Ring-level inputs:
--   `Huber.isPseudoFlat_simpleLaurent_sousperfectoid`, `Module.IsPseudoCoherent.of_exact`.

/-! ## AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing (theorem) -/

-- AdicSpace.pseudoCoherentEquiv: not stated here; needs pseudocoherent sheaves of `𝒪_X`-modules
--   on `Spa(A, A⁺)` and sheafiness (supplier: AdicSpaces Layers 4–5). Clause (b), exactness of
--   base extension to a rational localisation, is stated over a sousperfectoid base as
--   `Huber.exact_tensor_ratLoc_sousperfectoid`.

/-- A3/pseudocoherent-kiehl-gluing (core, (b)): Kedlaya–Liu II, Theorem 2.5.5(b), over a complete
sousperfectoid Tate ring: base extension to a rational localisation `B = A⟨T/s⟩` is exact on
short exact sequences `0 → M₁ → M → M₂ → 0` with `M₂` stably pseudocoherent. -/
theorem exact_tensor_ratLoc_sousperfectoid (p : ℕ) {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    [IsSousperfectoid p A] (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set A) : Ideal A) : Set A)) {M₁ M M₂ : Type*}
    [AddCommGroup M₁] [Module A M₁] [AddCommGroup M] [Module A M] [AddCommGroup M₂] [Module A M₂]
    {f : M₁ →ₗ[A] M} {g : M →ₗ[A] M₂} (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g) (hM₂ : IsStablyPseudoCoherent A M₂ ⊤) :
    Function.Injective (f.lTensor (ratLoc P T s hden)) ∧
      Function.Exact (f.lTensor (ratLoc P T s hden)) (g.lTensor (ratLoc P T s hden)) ∧
      Function.Surjective (g.lTensor (ratLoc P T s hden)) := sorry

/-! ## AdicEtaleGeometry:A3/restricted-power-series-newton (lemma) -/

section Newton

variable {C : Type*} [CommRing C] [TopologicalSpace C]

/-- A3/restricted-power-series-newton (supporting): the value `f(t) = ∑_ν a_ν t^ν` of a power
series at a point, as a sum in the topological ring; for restricted `f` and power-bounded `t` the
sum converges. -/
def mvPowerSeriesEvalAt {N : ℕ} (f : MvPowerSeries (Fin N) C) (t : Fin N → C) : C :=
  ∑' ν : Fin N →₀ ℕ, MvPowerSeries.coeff ν f * ν.prod fun i e ↦ t i ^ e

/-- A3/restricted-power-series-newton (supporting): the Jacobian matrix `(∂Fᵢ/∂T_j (t))ᵢⱼ`, with
Mathlib's termwise `MvPowerSeries.pderiv`. -/
def mvPowerSeriesJacobianAt {N : ℕ} (F : Fin N → MvPowerSeries (Fin N) C) (t : Fin N → C) :
    Matrix (Fin N) (Fin N) C :=
  Matrix.of fun i j ↦ mvPowerSeriesEvalAt (MvPowerSeries.pderiv C j (F i)) t

end Newton

/-- A3/restricted-power-series-newton: the multivariable Newton–Hensel lemma. Let `C` be a
complete Tate ring with a ring of definition `C₀` containing a pseudouniformiser `ϖ`,
`F ∈ C₀⟨T₁, …, T_N⟩^N` restricted, `t ∈ C₀^N`, and `M` with `M J(t) = J(t) M = ϖᵏ` where `J(t)` is
the Jacobian. If `F(t) ∈ ϖ^{2k+1} C₀^N`, there is exactly one `t* ∈ t + ϖ^{k+1} C₀^N` with
`F(t*) = 0`. -/
theorem exists_unique_zero_restrictedPowerSeries {C : Type*} [CommRing C] [UniformSpace C]
    [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C] [CompleteSpace C] [T2Space C]
    (P : PairOfDefinition C) {ϖ : C} (hϖ : IsPseudoUniformizer ϖ) (hϖP : ϖ ∈ P.ringOfDefinition)
    {N k : ℕ} (F : Fin N → MvPowerSeries (Fin N) P.ringOfDefinition)
    (hF : ∀ i, IsRestricted (F i)) (t : Fin N → P.ringOfDefinition)
    (M : Matrix (Fin N) (Fin N) P.ringOfDefinition)
    (hM : M * mvPowerSeriesJacobianAt F t = (⟨ϖ, hϖP⟩ : P.ringOfDefinition) ^ k • 1 ∧
      mvPowerSeriesJacobianAt F t * M = (⟨ϖ, hϖP⟩ : P.ringOfDefinition) ^ k • 1)
    (hFt : ∀ i, mvPowerSeriesEvalAt (F i) t ∈
      Ideal.span {(⟨ϖ, hϖP⟩ : P.ringOfDefinition) ^ (2 * k + 1)}) :
    ∃! s : Fin N → P.ringOfDefinition,
      (∀ i, s i - t i ∈ Ideal.span {(⟨ϖ, hϖP⟩ : P.ringOfDefinition) ^ (k + 1)}) ∧
        ∀ i, mvPowerSeriesEvalAt (F i) s = 0 := sorry

/-! ## AdicEtaleGeometry:A3/perturbation-of-generators (lemma) -/

/-- A3/perturbation-of-generators (a): for `ε ∈ ϖ·A°⟨X⟩^n`, the continuous `A`-algebra
endomorphism `θ_ε` of `A⟨X₁, …, X_n⟩` with `θ_ε(X) = X + ε` is an automorphism (point (3) of
Huber's proof of Proposition 1.7.1, without the noetherian hypothesis). Clause (b), transport of
a quotient mapping `π` to `π ∘ θ_ε` with `ker (π ∘ θ_ε) = θ_ε⁻¹(ker π)`, is formal once `θ_ε` is
an automorphism. -/
theorem bijective_perturbX {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] {n : ℕ} {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) (ε : Fin n → restrictedMvPowerSeriesCompletion n A)
    (hε : ∀ i, ∃ e ∈ powerBoundedSubring (restrictedMvPowerSeriesCompletion n A),
      ε i = algebraMap A _ ϖ * e) :
    ∃ θ : restrictedMvPowerSeriesCompletion n A →ₐ[A] restrictedMvPowerSeriesCompletion n A,
      Continuous θ ∧ (∀ i, θ (tateCoord n A i) = tateCoord n A i + ε i) ∧
        Function.Bijective θ := sorry

/-! ## AdicEtaleGeometry:A3/standard-etale-presentation (definition) -/

section TateSeries

variable (N : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]

/-- A3/standard-etale-presentation (supporting): the ring `A⟨T₁, …, T_N⟩` of restricted power
series, as Tau Ceti's subring `weightedRestrictedSubring` of `MvPowerSeries (Fin N) A` at the
trivial weights. For complete Hausdorff `A` it is the Tate algebra
`restrictedMvPowerSeriesCompletion N A` (Tau Ceti `restrictedMvPowerSeriesCompletionEquiv`); as a
ring of series it carries the termwise partial derivatives. -/
abbrev tateSeries : Type _ :=
  weightedRestrictedSubring (fun _ : Fin N ↦ ({1} : Set A)) isWeightFamily_one_weight

/-- A3/standard-etale-presentation (supporting): the variable `Tᵢ ∈ A⟨T⟩`. -/
def tateSeries.X (i : Fin N) : tateSeries N A :=
  weightedX (fun _ : Fin N ↦ ({1} : Set A)) isWeightFamily_one_weight i

/-- A3/standard-etale-presentation (supporting): `A⁺⟨T⟩`, the restricted series with coefficients
in `A⁺`. -/
def tateSeriesPlus (Aplus : Subring A) : Subring (tateSeries N A) where
  carrier := {f | ∀ ν, MvPowerSeries.coeff ν (f : MvPowerSeries (Fin N) A) ∈ Aplus}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- A3/standard-etale-presentation (supporting): the Jacobian `det(∂Fᵢ/∂T_j)` of
`F ∈ A⟨T₁, …, T_N⟩^N`, with Mathlib's termwise `MvPowerSeries.pderiv` (which preserves restricted
series). -/
def tateSeriesJacobian {N : ℕ} (F : Fin N → tateSeries N A) : tateSeries N A :=
  ⟨(Matrix.of fun i j ↦ MvPowerSeries.pderiv A j (F i : MvPowerSeries (Fin N) A)).det, sorry⟩

end TateSeries

section TateSeriesPair

variable (N : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- A3/standard-etale-presentation (supporting): the Huber pair `(A⟨T⟩, A⁺⟨T⟩)`, the ring of the
relative closed ball `B^N_X`. -/
def tateSeriesPair (Aplus : Pair A) : Pair (tateSeries N A) where
  plus := tateSeriesPlus N A Aplus.plus
  isRingOfIntegralElements := sorry

/-- A3/tubular-neighbourhood (supporting): the tube
`W = {|Fᵢ| ≤ |ϖ^m| for all i} ∩ {|ϖᵏ| ≤ |J_F|}` of `F` in `B^N_X = Spa(A⟨T⟩, A⁺⟨T⟩)`, a rational
subset. -/
def tubeSet (Aplus : Subring A) (ϖ : A) {N : ℕ} (F : Fin N → tateSeries N A) (k m : ℕ) :
    Set (ValuationSpectrum (tateSeries N A)) :=
  letI := Classical.decEq (tateSeries N A)
  ValuationSpectrum.rationalSubset (tateSeriesPlus N A Aplus)
      (insert (algebraMap A _ (ϖ ^ m)) (Finset.univ.image F)) (algebraMap A _ (ϖ ^ m)) ∩
    ValuationSpectrum.rationalSubset (tateSeriesPlus N A Aplus)
      {algebraMap A _ (ϖ ^ k), tateSeriesJacobian A F} (tateSeriesJacobian A F)

end TateSeriesPair

/-- A3/standard-etale-presentation (structure): a *standard étale presentation* `(N, F, k, π)`
of the complete Huber pair `(C, C⁺)` over the complete Tate pair `(A, A⁺)` with pseudouniformiser
`ϖ`: equations `F ∈ A⁺⟨T₁, …, T_N⟩^N` and a quotient mapping `π : A⟨T⟩ → C` over `A` with
(i) `ker π` the closure of `(F₁, …, F_N)`, `C` carrying the quotient topology and `C⁺` the integral
closure of `π(A⁺⟨T⟩)` — so `(C, C⁺)` is the quotient pair `A⟨T⟩ ⧸ closure (F)` (Tau Ceti
`Pair.quotient`); (ii) the Jacobian `J_F = det(∂Fᵢ/∂T_j)` maps to a unit of `C` with
`ϖᵏ π(J_F)⁻¹ ∈ C⁺`. The number of equations equals the number of variables; no sheafiness is
part of the definition. -/
structure StandardEtalePresentation {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] (Aplus : Pair A) (ϖ : A) {C : Type*} [CommRing C]
    [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C] [Algebra A C] (Cplus : Pair C) where
  /-- The number of variables and of equations. -/
  N : ℕ
  /-- The equations `F₁, …, F_N`. -/
  F : Fin N → tateSeries N A
  /-- The equations have coefficients in `A⁺`. -/
  F_mem_plus : ∀ i, F i ∈ tateSeriesPlus N A Aplus.plus
  /-- The exponent bounding the inverse of the Jacobian. -/
  k : ℕ
  /-- The quotient map `π : A⟨T⟩ → C` over `A`. -/
  π : tateSeries N A →ₐ[A] C
  /-- `π` is a quotient map: surjective, and `C` carries the quotient topology. -/
  isQuotientMap_π : IsQuotientMap π
  /-- `ker π` is the closure of the ideal `(F₁, …, F_N)`. -/
  ker_π : RingHom.ker π = (Ideal.span (Set.range F)).closure
  /-- `C⁺` is the integral closure of `π(A⁺⟨T⟩)`. -/
  mem_plus_iff : ∀ c : C, c ∈ Cplus.plus ↔
    ((tateSeriesPlus N A Aplus.plus).map (π : tateSeries N A →+* C)).subtype.IsIntegralElem c
  /-- `π(J_F)` is a unit of `C` with `ϖᵏ π(J_F)⁻¹ ∈ C⁺`. -/
  exists_unit_jacobian : ∃ u : Cˣ, (u : C) = π (tateSeriesJacobian A F) ∧
    algebraMap A C (ϖ ^ k) * ↑u⁻¹ ∈ Cplus.plus

namespace StandardEtalePresentation

section Basic

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  {Aplus : Pair A} {ϖ : A} {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]
  [IsHuberRing C] [Algebra A C] {Cplus : Pair C} (P : StandardEtalePresentation Aplus ϖ Cplus)

/-- A3/standard-etale-presentation (data): the Jacobian `J_F = det(∂Fᵢ/∂T_j) ∈ A⁺⟨T⟩`. -/
def jacobian : tateSeries P.N A := tateSeriesJacobian A P.F

/-- A3/standard-etale-presentation (projection): `π(J_F)` is a unit of `C` and
`ϖᵏ π(J_F)⁻¹ ∈ C⁺`. -/
theorem isUnit_jacobian :
    IsUnit (P.π P.jacobian) ∧ ∀ u : Cˣ, (u : C) = P.π P.jacobian →
      algebraMap A C (ϖ ^ P.k) * ↑u⁻¹ ∈ Cplus.plus := sorry

/-- A3/standard-etale-presentation (equivalence): `C ≅ A⟨T⟩ ⧸ closure (F)` as `A`-algebras; with
`quotientEquiv_plus` it identifies `(C, C⁺)` with the quotient pair (Tau Ceti `Pair.quotient`). -/
def quotientEquiv :
    (tateSeries P.N A ⧸ (Ideal.span (Set.range P.F)).closure) ≃ₐ[A] C :=
  (Ideal.quotientEquivAlgOfEq A P.ker_π.symm).trans
    (Ideal.quotientKerAlgEquivOfSurjective P.isQuotientMap_π.surjective)

/-- A3/standard-etale-presentation (equivalence): `quotientEquiv` carries the plus ring of the
quotient pair onto `C⁺`. -/
theorem quotientEquiv_plus :
    ((tateSeriesPair P.N A Aplus).quotient (Ideal.span (Set.range P.F)).closure).plus.map
      (P.quotientEquiv : _ →+* C) = Cplus.plus := sorry

/-- A3/standard-etale-presentation (constructor): the explicit-inverse form
`(N + 1, (F, S·J_F − ϖᵏ), 2k, ·)` of the same pair. -/
def withInverse (P : StandardEtalePresentation Aplus ϖ Cplus) :
    StandardEtalePresentation Aplus ϖ Cplus := sorry

/-- A3/standard-etale-presentation (data): the tube `W ⊆ B^N_X` of `F` with Jacobian exponent
`k` and radius `|ϖ|^m` (A3/tubular-neighbourhood). -/
def tube (m : ℕ) : Set (ValuationSpectrum (tateSeries P.N A)) :=
  tubeSet A Aplus.plus ϖ P.F P.k m

/-- A3/standard-etale-presentation (constructor): the composite of `P` with a presentation
`Q` of `(D, D⁺)` over `(C, C⁺)`, in `N + M` variables with Jacobian `J_F·J_{G̃}`
(A3/standard-presentation-basic-pieces (c)). -/
def comp (P : StandardEtalePresentation Aplus ϖ Cplus) {D : Type*} [CommRing D]
    [TopologicalSpace D] [IsTopologicalRing D] [IsHuberRing D] [Algebra C D] [Algebra A D]
    [IsScalarTower A C D] {Dplus : Pair D}
    (Q : StandardEtalePresentation Cplus (algebraMap A C ϖ) Dplus) :
    StandardEtalePresentation Aplus ϖ Dplus := sorry

end Basic

section Complete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] {Aplus : Pair A} {ϖ : A}

/-- A3/standard-etale-presentation (constructor): the presentation `(n, (t Tᵢ − sᵢ), c n,
Tᵢ ↦ sᵢ/t)` of the rational localisation `A⟨s/t⟩` for `s₁, …, s_n, t ∈ A⁺` with `ϖ^c` among the
`sᵢ` (A3/standard-presentation-basic-pieces (a)). -/
def ofRational [DecidableEq A] {n : ℕ} (s : Fin n → A) (t : A) (c : ℕ)
    (hs : ∀ i, s i ∈ Aplus.plus) (ht : t ∈ Aplus.plus) (hc : ∃ i, s i = ϖ ^ c)
    (P₀ : PairOfDefinition A)
    (hden : P₀.HasDenominatorPower (Finset.univ.image s) t (Localization.Away t)) :
    StandardEtalePresentation Aplus ϖ (ratLocPair P₀ (Finset.univ.image s) t hden Aplus) := sorry

/-- A3/standard-etale-presentation (constructor): the presentation of a finite étale `A`-algebra
`S` with its natural topology and `S⁺` the integral closure of `A⁺`, from a relative dimension
zero submersive presentation rescaled into `A⁺` (A3/standard-presentation-basic-pieces (b)). -/
def ofFiniteEtale {S : Type*} [CommRing S] [Algebra A S] [Module.Finite A S] [Algebra.Etale A S]
    [TopologicalSpace S] [IsModuleTopology A S] [IsTopologicalRing S] [IsHuberRing S]
    (Splus : Pair S)
    (hplus : ∀ x, x ∈ Splus.plus ↔ (Aplus.plus.map (algebraMap A S)).subtype.IsIntegralElem x) :
    StandardEtalePresentation Aplus ϖ Splus := sorry

/-- A3/standard-etale-presentation (functoriality): for a morphism of complete Tate pairs
`(A, A⁺) → (A', A'⁺)`, the image of `F` presents `C ⊗̂_A A'`
(AdicSpacesPartII:R0/completed-tensor-restricted-power-series (c); the completed tensor product is
the prelude's stand-in). -/
def baseChange {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]
    [IsHuberRing C] [Algebra A C] {Cplus : Pair C} (_P : StandardEtalePresentation Aplus ϖ Cplus)
    {A' : Type*} [CommRing A'] [TopologicalSpace A'] [IsTopologicalRing A'] [IsHuberRing A']
    [Algebra A A'] (A'plus : Pair A') [IsAdicHom (algebraMap A C)] [IsAdicHom (algebraMap A A')]
    (hC : ∀ a ∈ Aplus.plus, algebraMap A C a ∈ Cplus.plus)
    (hA' : ∀ a ∈ Aplus.plus, algebraMap A A' a ∈ A'plus.plus) :
    letI : Algebra A' (CompletedTensor A C A') :=
      (Pair.completedTensor.inr Aplus Cplus A'plus hC hA').toRingHom.toAlgebra
    StandardEtalePresentation A'plus (algebraMap A A' ϖ)
      (Pair.completedTensor Aplus Cplus A'plus hC hA') := sorry

variable {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
  [Algebra A C] {Cplus : Pair C} (P : StandardEtalePresentation Aplus ϖ Cplus)

/-- A3/standard-etale-presentation (equivalence): the isomorphism `α_{F,G}` attached to
equations `G` close to those of the explicit-inverse form `P.withInverse` (exponent `k = P.k`,
Jacobian exponent `2k`): if `G − F ∈ ϖ^{4k+2} A⁺⟨T⟩^{N+1}`, then `C ≅ A⟨T⟩ ⧸ closure (G)`, over a
base whose Tate algebras have uniform rational localisations (here: sousperfectoid;
A3/standard-presentation-perturbation). -/
def perturb (p : ℕ) [IsSousperfectoid p A]
    (G : Fin P.withInverse.N → tateSeries P.withInverse.N A)
    (hG : ∀ i, G i ∈ tateSeriesPlus P.withInverse.N A Aplus.plus)
    (hGF : ∀ i, ∃ w ∈ tateSeriesPlus P.withInverse.N A Aplus.plus,
      G i - P.withInverse.F i = algebraMap A _ (ϖ ^ (4 * P.k + 2)) * w) :
    C ≃ₐ[A] (tateSeries P.withInverse.N A ⧸ (Ideal.span (Set.range G)).closure) := sorry

end Complete

end StandardEtalePresentation

-- Huber.StandardEtalePresentation.kaehler_eq_zero: not stated here; needs the continuous Kähler
--   differentials `Ω^c_{C/A}` of complete Huber rings (supplier:
--   AdicSpacesPartII:R0/continuous-differentials). Its algebraic input is the invertibility of
--   the Jacobian, `Huber.StandardEtalePresentation.isUnit_jacobian`.

section StandardTests

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] {Aplus : Pair A} {ϖ : A}

-- test Huber.StandardEtalePresentation.test_rational (computation)
--   [A3/standard-etale-presentation]
example [DecidableEq A] (hϖ : IsPseudoUniformizer ϖ) {n : ℕ} (s : Fin n → A) (t : A) (c : ℕ)
    (hs : ∀ i, s i ∈ Aplus.plus) (ht : t ∈ Aplus.plus) (hc : ∃ i, s i = ϖ ^ c)
    (P₀ : PairOfDefinition A)
    (hden : P₀.HasDenominatorPower (Finset.univ.image s) t (Localization.Away t)) :
    ∃ Q : StandardEtalePresentation Aplus ϖ (ratLocPair P₀ (Finset.univ.image s) t hden Aplus),
      ∃ h : Q.N = n, Q.k = c * n ∧ ∀ i : Fin n,
        (Q.F (Fin.cast h.symm i) : MvPowerSeries (Fin Q.N) A) =
          MvPowerSeries.C t * MvPowerSeries.X (Fin.cast h.symm i) - MvPowerSeries.C (s i) := sorry

-- test Huber.StandardEtalePresentation.test_zero (degenerate) [A3/standard-etale-presentation]
example (hϖ : IsPseudoUniformizer ϖ) :
    ∃ Q : StandardEtalePresentation Aplus ϖ Aplus, Q.N = 0 ∧ Q.k = 0 := sorry

/- In characteristic `p` the Jacobian of `T^p − a` is `p T^{p−1} = 0`, which is a unit only in the
zero ring. -/
-- test Huber.StandardEtalePresentation.test_frobenius_not (non-example)
--   [A3/standard-etale-presentation]
example (p : ℕ) [Fact p.Prime] [CharP A p] {C : Type*} [CommRing C] [TopologicalSpace C]
    [IsTopologicalRing C] [IsHuberRing C] [Algebra A C] [Nontrivial C] {Cplus : Pair C} (a : A)
    (Q : StandardEtalePresentation Aplus ϖ Cplus) (i : Fin Q.N) (h : Q.N = 1) :
    (Q.F i : MvPowerSeries (Fin Q.N) A) ≠ MvPowerSeries.X i ^ p - MvPowerSeries.C a := sorry

-- test Huber.StandardEtalePresentation.test_finiteEtale (compatibility)
--   [A3/standard-etale-presentation]
example {S : Type*} [CommRing S] [Algebra A S] [Module.Finite A S] [Algebra.Etale A S]
    [TopologicalSpace S] [IsModuleTopology A S] [IsTopologicalRing S] [IsHuberRing S]
    (Splus : Pair S)
    (hplus : ∀ x, x ∈ Splus.plus ↔ (Aplus.plus.map (algebraMap A S)).subtype.IsIntegralElem x) :
    Nonempty (StandardEtalePresentation Aplus ϖ Splus) := sorry

end StandardTests

/-! ## AdicEtaleGeometry:A3/standard-presentation-basic-pieces (lemma) -/

/-- A3/standard-presentation-basic-pieces (c), (d): composites of pairs with standard étale
presentations have standard étale presentations; with `ofRational` and `ofFiniteEtale` this
covers every composite of rational localisations and finite étale maps. -/
theorem StandardEtalePresentation.nonempty_ofComposite {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    {Aplus : Pair A} {ϖ : A} {C : Type*} [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]
    [IsHuberRing C] [Algebra A C] {Cplus : Pair C} {D : Type*} [CommRing D] [TopologicalSpace D]
    [IsTopologicalRing D] [IsHuberRing D] [Algebra C D] [Algebra A D] [IsScalarTower A C D]
    {Dplus : Pair D} (hC : Nonempty (StandardEtalePresentation Aplus ϖ Cplus))
    (hD : Nonempty (StandardEtalePresentation Cplus (algebraMap A C ϖ) Dplus)) :
    Nonempty (StandardEtalePresentation Aplus ϖ Dplus) := sorry

section TubeCores

variable (p : ℕ) {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] [IsSousperfectoid p A]
  (Aplus : Pair A) {ϖ : A} {N : ℕ} (F : Fin N → tateSeries N A)

/-! ## AdicEtaleGeometry:A3/tubular-neighbourhood (theorem) -/

-- Huber.tubeEquiv: not stated here; needs the Tate algebra `C⟨u₁, …, u_N⟩` over the quotient
--   Huber pair `𝒪(W) ⧸ (e)`, whose nonarchimedean ring structure no library provides for quotient
--   rings, and the plus rings `𝒪⁺(W)` of rational subsets of `B^N_X` as a Huber-pair isomorphism
--   (supplier: AdicSpaces Layer 3). The ring section of (a) is
--   `Huber.exists_section_tube_sousperfectoid`.

/-- A3/tubular-neighbourhood (core, (a)): over a complete sousperfectoid Tate pair (whose Tate
algebras have uniform rational localisations), for `F ∈ A⁺⟨T⟩^N`, `m ≥ 2k + 1` and a rational
subset `W' = R(T'/s')` of the tube of `F`, the quotient map `q : 𝒪(W') → 𝒪(W') ⧸ closure (F)` has
a continuous ring section `ρ` with `ρ(q(Tᵢ)) − Tᵢ ∈ ϖ^{m−k} 𝒪⁺(W')`. -/
theorem exists_section_tube_sousperfectoid (hϖ : IsPseudoUniformizer ϖ)
    (hF : ∀ i, F i ∈ tateSeriesPlus N A Aplus.plus) (k m : ℕ) (hm : 2 * k + 1 ≤ m)
    (P : PairOfDefinition (tateSeries N A)) (T : Finset (tateSeries N A)) (s : tateSeries N A)
    (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set (tateSeries N A)) : Ideal _) : Set (tateSeries N A)))
    (hW : ValuationSpectrum.rationalSubset (tateSeriesPlus N A Aplus.plus) T s ⊆
      tubeSet A Aplus.plus ϖ F k m) :
    ∃ ρ : (ratLoc P T s hden ⧸ (Ideal.span (Set.range fun i ↦
        algebraMap (tateSeries N A) (ratLoc P T s hden) (F i))).closure) →+* ratLoc P T s hden,
      Continuous ρ ∧ (Ideal.Quotient.mk _).comp ρ = RingHom.id _ ∧
        ∀ i, ∃ w ∈ (ratLocPair P T s hden (tateSeriesPair N A Aplus)).plus,
          ρ (Ideal.Quotient.mk _ (algebraMap (tateSeries N A) _ (tateSeries.X N A i))) -
              algebraMap (tateSeries N A) _ (tateSeries.X N A i) =
            algebraMap (tateSeries N A) (ratLoc P T s hden) (algebraMap A _ (ϖ ^ (m - k))) * w :=
  sorry

/-! ## AdicEtaleGeometry:A3/standard-presentation-perturbation (theorem) -/

/-- A3/standard-presentation-perturbation: let `Q = P.withInverse` be the explicit-inverse form
(exponent `k = P.k`, Jacobian exponent `2k`) of a presentation over a sousperfectoid base, and
`G ∈ A⁺⟨T⟩^{N+1}` with `G − F_Q ∈ ϖ^{4k+2} A⁺⟨T⟩`. Then the quotient pair `A⟨T⟩ ⧸ closure (G)` has
a standard étale presentation, and the isomorphism `α_{F,G} = P.perturb` satisfies
`α(π_Q(T)) − π_G(T) ∈ ϖ^{2k+2}·C_G⁺` (a nonnoetherian replacement of Huber 1.7.2). -/
theorem StandardEtalePresentation.perturb_spec_sousperfectoid {C : Type*} [CommRing C]
    [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C] [Algebra A C] {Cplus : Pair C}
    (P : StandardEtalePresentation Aplus ϖ Cplus)
    (G : Fin P.withInverse.N → tateSeries P.withInverse.N A)
    (hG : ∀ i, G i ∈ tateSeriesPlus P.withInverse.N A Aplus.plus)
    (hGF : ∀ i, ∃ w ∈ tateSeriesPlus P.withInverse.N A Aplus.plus,
      G i - P.withInverse.F i = algebraMap A _ (ϖ ^ (4 * P.k + 2)) * w) :
    Nonempty (StandardEtalePresentation Aplus ϖ
        ((tateSeriesPair P.withInverse.N A Aplus).quotient (Ideal.span (Set.range G)).closure)) ∧
      ∀ i, ∃ w ∈ ((tateSeriesPair P.withInverse.N A Aplus).quotient
          (Ideal.span (Set.range G)).closure).plus,
        P.perturb p G hG hGF (P.withInverse.π (tateSeries.X P.withInverse.N A i)) -
            Ideal.Quotient.mk _ (tateSeries.X P.withInverse.N A i) =
          algebraMap A _ (ϖ ^ (2 * P.k + 2)) * w := sorry

/-! ## AdicEtaleGeometry:A3/standard-etale-locus-sousperfectoid (lemma) -/

/-- A3/standard-etale-locus-sousperfectoid: over a complete sousperfectoid Tate pair, the ring of
a standard étale locus is sousperfectoid, with the perfectoid frame `(P̃, ι ∘ ρ, q ∘ σ)` built from
the tube (the étale case of Fargues–Scholze IV.4.17). -/
theorem StandardEtalePresentation.isSousperfectoid {C : Type*} [CommRing C] [TopologicalSpace C]
    [IsTopologicalRing C] [IsHuberRing C] [Algebra A C] {Cplus : Pair C}
    (_P : StandardEtalePresentation Aplus ϖ Cplus) : IsSousperfectoid p C := sorry

/-! ## AdicEtaleGeometry:A3/fs-iv-4-13-regular-sequence (lemma) -/

/-- A3/fs-iv-4-13-regular-sequence: on every rational subset `W' = R(T'/s')` of the tube of
`F ∈ A⁺⟨T⟩^N` (radius `|ϖ|^m`, `m ≥ 2k + 1`) over a complete sousperfectoid Tate pair, the images
of `F₁, …, F_N` form a weakly regular sequence on `𝒪(W')` generating a closed ideal `I`, `I ⧸ I²`
is free over `𝒪(W') ⧸ I`, and `𝒪(W') ⧸ I` is a stably `N`-fpd `𝒪(W')`-module (the étale case of
Fargues–Scholze, Lemma IV.4.13, without spreading out). -/
theorem isWeaklyRegular_tube_sousperfectoid (hϖ : IsPseudoUniformizer ϖ)
    (hF : ∀ i, F i ∈ tateSeriesPlus N A Aplus.plus) (k m : ℕ) (hm : 2 * k + 1 ≤ m)
    (P : PairOfDefinition (tateSeries N A)) (T : Finset (tateSeries N A)) (s : tateSeries N A)
    (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set (tateSeries N A)) : Ideal _) : Set (tateSeries N A)))
    (hW : ValuationSpectrum.rationalSubset (tateSeriesPlus N A Aplus.plus) T s ⊆
      tubeSet A Aplus.plus ϖ F k m) :
    RingTheory.Sequence.IsWeaklyRegular (ratLoc P T s hden)
        (List.ofFn fun i ↦ algebraMap (tateSeries N A) (ratLoc P T s hden) (F i)) ∧
      IsClosed ((Ideal.ofList (List.ofFn fun i ↦
        algebraMap (tateSeries N A) (ratLoc P T s hden) (F i)) : Ideal (ratLoc P T s hden)) :
          Set (ratLoc P T s hden)) ∧
      Module.Free (ratLoc P T s hden ⧸ Ideal.ofList (List.ofFn fun i ↦
          algebraMap (tateSeries N A) (ratLoc P T s hden) (F i)))
        (Ideal.ofList (List.ofFn fun i ↦
          algebraMap (tateSeries N A) (ratLoc P T s hden) (F i))).Cotangent ∧
      IsStablyFPD (ratLoc P T s hden) (ratLoc P T s hden ⧸ Ideal.ofList (List.ofFn fun i ↦
          algebraMap (tateSeries N A) (ratLoc P T s hden) (F i))) N := sorry

end TubeCores

/-! ## AdicEtaleGeometry:A3/char-p-perfectoid-base-field (lemma) -/

-- PerfectoidSpace.baseFieldHom: not stated here; needs the perfectoid field
--   `F_p((t^{1/p^∞}))^∧` (supplier: PerfectoidSpaces:P1/perfectoid-field-definition). Its
--   ring-level input, the compatible `pⁿ`-th roots of a pseudouniformiser that
--   `t^{1/pⁿ} ↦ ϖ^{1/pⁿ}` uses, is `Huber.exists_pow_roots_pseudoUniformizer_charP`.
-- PerfectoidSpace.baseFieldHom_injective: not stated here; needs the perfectoid field
--   `F_p((t^{1/p^∞}))^∧` (supplier: PerfectoidSpaces:P1/perfectoid-field-definition).
-- PerfectoidSpace.exists_pFinite_approximation: not stated here; needs p-finite perfectoid
--   affinoid algebras over a perfectoid field and completed filtered colimits of them (supplier:
--   PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids).

/-- A3/char-p-perfectoid-base-field (core, (a)): in a perfectoid Tate ring of characteristic `p`
a pseudouniformiser `ϖ` has a compatible system of `pⁿ`-th roots `ϖ^{1/pⁿ}`, each again a
pseudouniformiser; these are the images of `t^{1/pⁿ}` under `F_p((t^{1/p^∞}))^∧ → R`. -/
theorem exists_pow_roots_pseudoUniformizer_charP (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R]
    [TopologicalSpace R] [IsTopologicalRing R] [CharP R p]
    (hR : Perfectoid.IsPerfectoidTateRing p R) {ϖ : R} (hϖ : IsPseudoUniformizer ϖ) :
    ∃ r : ℕ → R, r 0 = ϖ ∧ (∀ n, r (n + 1) ^ p = r n) ∧ ∀ n, IsPseudoUniformizer (r n) := sorry

/-! ## AdicEtaleGeometry:A3/jacobian-criterion-char-p (theorem) -/

-- PerfectoidSpace.isEtale_standardEtaleLocus: not stated here; needs étale morphisms of analytic
--   adic spaces in the local-description sense (supplier: AdicEtaleGeometry:A1/etale-morphism)
--   and of affinoid perfectoid spaces (supplier: PerfectoidSpaces:P3). Clause (b)'s ring-level
--   core is `Huber.StandardEtalePresentation.isPerfectoidTateRing_charP`.

/-- A3/jacobian-criterion-char-p (core, (b)): over a perfectoid Tate pair of characteristic `p`,
the ring `C` of a standard étale presentation is perfect, hence a perfectoid Tate ring
(Fargues–Scholze IV.4.17, characteristic-`p` étale case, without diamonds). -/
theorem StandardEtalePresentation.isPerfectoidTateRing_charP (p : ℕ) [Fact p.Prime] {A : Type*}
    [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A] [CharP A p]
    (hA : Perfectoid.IsPerfectoidTateRing p A) {Aplus : Pair A} {ϖ : A} {C : Type*} [CommRing C]
    [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C] [Algebra A C] {Cplus : Pair C}
    (_P : StandardEtalePresentation Aplus ϖ Cplus) :
    PerfectRing C p ∧ Perfectoid.IsPerfectoidTateRing p C := sorry

/-! ## AdicEtaleGeometry:A3/integral-cutoff-graph-presentation (lemma) -/

/-- A3/integral-cutoff-graph-presentation (supporting): a morphism of Huber pairs is a *quotient
mapping* if it is surjective and the target plus ring is the integral closure of the image of the
source plus ring (ECD, proof of 6.4(iv); Fargues–Scholze Definition IV.4.20, affinoid form). -/
def Pair.Hom.IsQuotientMapping {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (f : Pair.Hom S T) : Prop :=
  Function.Surjective f.toRingHom ∧
    ∀ x, x ∈ T.plus ↔ (S.plus.map f.toRingHom).subtype.IsIntegralElem x

-- Huber.isQuotientMapping_cutoff: not stated here; needs the plus rings `𝒪⁺(R)` of rational
--   subsets of `B^N_X` with their restriction maps and morphisms `Spa(C, C⁺) → R` over `X`
--   (supplier: AdicSpaces Layers 3 and 5). The ring-level notion is
--   `Huber.Pair.Hom.IsQuotientMapping`; clause (e) needs pseudocoherent sheaves
--   (`AdicSpace.IsPseudoCoherentSheaf`, AdicSpaces Layer 5).

/-! ## AdicEtaleGeometry:A3/fs-iv-4-19-zariski-closed-char-p (theorem) -/

-- AdicSpace.isZariskiClosedImmersion_iff_forall: not stated here; needs morphisms of adic spaces
--   `Y → Y' ⊆ B^N_X`, their affinoid open preimages and étale affinoid perfectoid spaces
--   (supplier: AdicSpaces Layer 5, PerfectoidSpaces:P3). The affinoid condition in (i) and (ii)
--   is `Huber.Pair.Hom.IsQuotientMapping`.

/-! ## AdicEtaleGeometry:A3/etale-standard-piece-cover (lemma) -/

-- PerfectoidSpace.exists_standardPieceCover: not stated here; needs étale morphisms of affinoid
--   perfectoid spaces in the sense of ECD Definition 6.2 (supplier: PerfectoidSpaces:P3). Each
--   piece's presentation is `Huber.StandardEtalePresentation.ofRational`,
--   `…ofFiniteEtale` and `…comp`.

/-! ## AdicEtaleGeometry:A3/integral-approximation-of-generators (lemma) -/

/-- A3/integral-approximation-of-generators: over a complete sousperfectoid (hence stably
uniform) Tate pair `(B, B⁺)` with pseudouniformiser `ϖ`, for `σ₁, …, σ_m` generating the unit
ideal, `V = Y(σ/σ_j)` and `u ∈ 𝒪⁺(V)`, every `M` admits `β₁, …, β_r ∈ B⁺`, `z ∈ 𝒪⁺(V)` with
`z − u ∈ ϖ^M 𝒪⁺(V)`, a monic `P` with `P(z) = 0` whose coefficients are polynomials over
`ℤ[β]` in the ratios `σᵢ/σ_j`, and `b ∈ B`, `s ≥ 0` with `b/σ_j^s − z ∈ ϖ^M 𝒪⁺(V)`. -/
theorem exists_integral_approx (p : ℕ) {B : Type*} [CommRing B] [UniformSpace B]
    [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B]
    [IsSousperfectoid p B] (Bplus : Pair B) {ϖ : B} (hϖ : IsPseudoUniformizer ϖ)
    (P₀ : PairOfDefinition B) (σ : Finset B) (hσ : Ideal.span (σ : Set B) = ⊤) (j : B)
    (hj : j ∈ σ) (hden : P₀.HasDenominatorPower σ j (Localization.Away j))
    (u : ratLoc P₀ σ j hden) (hu : u ∈ (ratLocPair P₀ σ j hden Bplus).plus) (M : ℕ) :
    ∃ (β : Finset B) (z : ratLoc P₀ σ j hden) (Q : Polynomial (ratLoc P₀ σ j hden)) (b : B)
      (e : ℕ), (∀ x ∈ β, x ∈ Bplus.plus) ∧ z ∈ (ratLocPair P₀ σ j hden Bplus).plus ∧
      (∃ w ∈ (ratLocPair P₀ σ j hden Bplus).plus,
        z - u = algebraMap B (ratLoc P₀ σ j hden) (ϖ ^ M) * w) ∧
      Q.Monic ∧ Q.eval z = 0 ∧
      (∀ d, Q.coeff d ∈ Algebra.adjoin ℤ ((algebraMap B (ratLoc P₀ σ j hden) '' (β : Set B)) ∪
        (fun x ↦ algebraMap B (ratLoc P₀ σ j hden) x *
          Ring.inverse (algebraMap B (ratLoc P₀ σ j hden) j)) '' (σ : Set B))) ∧
      ∃ w ∈ (ratLocPair P₀ σ j hden Bplus).plus,
        algebraMap B (ratLoc P₀ σ j hden) b *
            Ring.inverse (algebraMap B (ratLoc P₀ σ j hden) j) ^ e - z =
          algebraMap B (ratLoc P₀ σ j hden) (ϖ ^ M) * w := sorry

/-! ## AdicEtaleGeometry:A3/affinoid-etale-zariski-closed-embedding (theorem) -/

-- PerfectoidSpace.exists_quotientMapping_restrictedPowerSeries: not stated here; needs étale
--   morphisms of affinoid perfectoid spaces (supplier: PerfectoidSpaces:P3) and pseudocoherent
--   ideal sheaves on `B^N_X` (AdicSpaces Layer 5). Given a standard étale presentation (which
--   AdicEtaleGeometry:A3/global-standard-etale-presentation supplies), the ring-level core is
--   `Huber.StandardEtalePresentation.isStablyPseudoCoherent_ker_sousperfectoid`.

/-- A3/affinoid-etale-zariski-closed-embedding (core): for a standard étale presentation over a
complete sousperfectoid Tate pair, the kernel of `π : A⟨T⟩ → C` is a stably pseudocoherent
`A⟨T⟩`-module, and `π` is a quotient mapping of Huber pairs onto `(C, C⁺)`. -/
theorem StandardEtalePresentation.isStablyPseudoCoherent_ker_sousperfectoid (p : ℕ) {A : Type*}
    [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A]
    [CompleteSpace A] [T2Space A] [IsSousperfectoid p A] {Aplus : Pair A} {ϖ : A} {C : Type*}
    [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C] [Algebra A C]
    {Cplus : Pair C} (P : StandardEtalePresentation Aplus ϖ Cplus) :
    IsStablyPseudoCoherent (tateSeries P.N A) (RingHom.ker (P.π : tateSeries P.N A →+* C)) ⊤ :=
  sorry

/-! ## AdicEtaleGeometry:A3/conormal-description (lemma) -/

-- PerfectoidSpace.conormal_equiv: not stated here; needs Zariski closed immersions of affinoid
--   étale perfectoid spaces into `B^N_X` and the continuous derivations `∂/∂Tᵢ` on rational
--   localisations of `A⟨T⟩` (supplier: PerfectoidSpaces:P3, AdicSpacesPartII:R0/continuous-
--   differentials). On the tube the freeness of `I ⧸ I²` is
--   `Huber.isWeaklyRegular_tube_sousperfectoid`.

/-! ## AdicEtaleGeometry:A3/local-equations-near-closed-subspace (lemma) -/

-- PerfectoidSpace.exists_local_equations: not stated here; needs Zariski closed immersions of
--   affinoid étale perfectoid spaces into `B^N_X` (supplier: PerfectoidSpaces:P3, AdicSpaces
--   Layer 5). The tube it produces is `Huber.tubeSet` with `k = 0`.

/-! ## AdicEtaleGeometry:A3/global-standard-etale-presentation (theorem) -/

-- PerfectoidSpace.nonempty_standardEtalePresentation: not stated here; needs étale morphisms of
--   affinoid perfectoid spaces (supplier: PerfectoidSpaces:P3). The presentation it yields is a
--   `Huber.StandardEtalePresentation`.
-- PerfectoidSpace.isEtale_iff_nonempty_standardEtalePresentation: not stated here; needs étale
--   morphisms of affinoid perfectoid spaces (supplier: PerfectoidSpaces:P3). The converse
--   direction's ring-level core is `Huber.StandardEtalePresentation.isPerfectoidTateRing_charP`.

/-! ## AdicEtaleGeometry:A3/tilting-affinoid-etale-and-limits (lemma) -/

-- PerfectoidSpace.tiltCofilteredLimitIso: not stated here; needs affinoid perfectoid spaces,
--   tilting and cofiltered limits of them (supplier: PerfectoidSpaces:P1, PerfectoidSpaces:P5).
-- PerfectoidSpace.tiltEtaleAffEquiv: not stated here; needs the categories `X_{ét,aff}` of affinoid
--   perfectoid spaces étale over `X` and the tilting equivalence (supplier: PerfectoidSpaces:P3).

/-! ## AdicEtaleGeometry:A3/cofiltered-limit-presentation-approximation (lemma) -/

/-- A3/cofiltered-limit-presentation-approximation (core, (a)): for a pseudouniformiser `ϖ`, if
`R⁺` is approximated modulo every `ϖ^M` by the images of the `R_i⁺` of a directed system (as for
the `ϖ`-adic completion of `colim R_i⁺`), then every finite family of elements of
`R⁺⟨T₁, …, T_N⟩` is congruent modulo `ϖ^M R⁺⟨T⟩`, coefficientwise, to the image of a family of
polynomials with coefficients in some `R_i⁺`. -/
theorem exists_approx_restrictedPowerSeries {R : Type*} [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] [IsHuberRing R] (Rplus : Pair R) {ϖ : R} (hϖ : IsPseudoUniformizer ϖ)
    {ι : Type*} [Preorder ι]
    [IsDirected ι (· ≤ ·)] [Nonempty ι] (Ri : ι → Type*) [∀ i, CommRing (Ri i)]
    (φ : ∀ i, Ri i →+* R) (plus : ∀ i, Subring (Ri i))
    (hplus : ∀ i x, x ∈ plus i → φ i x ∈ Rplus.plus)
    (happrox : ∀ (M : ℕ) (x : R), x ∈ Rplus.plus →
      ∃ i, ∃ y ∈ plus i, ∃ w ∈ Rplus.plus, φ i y - x = ϖ ^ M * w)
    {N r : ℕ} (F : Fin r → tateSeries N R) (hF : ∀ l, F l ∈ tateSeriesPlus N R Rplus.plus)
    (M : ℕ) :
    ∃ i, ∃ Fi : Fin r → MvPolynomial (Fin N) (Ri i),
      (∀ l ν, (Fi l).coeff ν ∈ plus i) ∧
        ∀ l ν, ∃ w ∈ Rplus.plus,
          φ i ((Fi l).coeff ν) - MvPowerSeries.coeff ν (F l : MvPowerSeries (Fin N) R) =
            ϖ ^ M * w := sorry

-- PerfectoidSpace.baseChange_standardEtalePresentation: not stated here; needs affinoid
--   perfectoid spaces and their fibre products (supplier: PerfectoidSpaces:P2). Its ring-level
--   form is `Huber.StandardEtalePresentation.baseChange`.

/-! ## AdicEtaleGeometry:A3/finite-stage-approximation-char-p (theorem) -/

-- PerfectoidSpace.exists_affinoidEtale_model: not stated here; needs cofiltered limits of affinoid
--   perfectoid spaces and their affinoid étale objects (supplier: PerfectoidSpaces:P5,
--   PerfectoidSpaces:P3). Ring-level inputs: `Huber.exists_approx_restrictedPowerSeries`,
--   `Huber.StandardEtalePresentation.perturb_spec_sousperfectoid`,
--   `Huber.StandardEtalePresentation.isPerfectoidTateRing_charP`.

/-! ## AdicEtaleGeometry:A3/independence-of-presentations (lemma) -/

-- PerfectoidSpace.affinoidEtale_model_unique: not stated here; needs affinoid étale objects over
--   a cofiltered system of affinoid perfectoid spaces and 2-colimits of categories (supplier:
--   PerfectoidSpaces:P5; 2-colimits of categories are in no library).

/-! ## AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv (theorem) -/

-- PerfectoidSpace.affinoidEtale_colimit_equivalence: not stated here; needs affinoid perfectoid
--   spaces, their categories `X_{ét,aff}` and 2-colimits of categories (supplier:
--   PerfectoidSpaces:P3, PerfectoidSpaces:P5; 2-colimits of categories are in no library).

/-! ## AdicEtaleGeometry:A3/etale-descent-to-finite-stage-6-4 (comparison) -/

-- PerfectoidSpace.etaleDescent_6_4: not stated here; needs the categories `X_{fét}`,
--   `X_{ét,aff}`, `X_{ét,qc,sep}`, `X_{ét,qcqs}` of perfectoid spaces and their 2-colimits
--   (supplier: PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces,
--   PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects). Part (iv) is
--   AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv.

/-! ## AdicEtaleGeometry:A3/zariski-closed-immersion-ecd-comparison (comparison) -/

-- PerfectoidSpace.isStronglyZariskiClosed_perfectoidBall: not stated here; needs the perfectoid
--   Tate algebra `A⟨T^{1/p^∞}⟩` and ECD's strongly Zariski closed immersions (supplier:
--   PerfectoidSpaces:P1, PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-
--   closed). The affinoid condition is `Huber.Pair.Hom.IsQuotientMapping`.

end Huber

end TauCeti

end

/-! # Stage A4. Analytic adic presentations for diamondification -/

noncomputable section

namespace TauCeti

universe u v

open TensorProduct Topology UniformSpace Polynomial

/-! ## AdicEtaleGeometry:A4/finite-etale-split-ring (definition) -/

namespace Algebra

/-- A4/finite-etale-split-ring (structure): a finite étale `R`-algebra `T` is *totally split* if
`T ≃ₐ[R] ∏_{j < m} R ⧸ (1 - e_j)` for finitely many idempotents `e_j` of `R` (repetitions and
`0` allowed; `m = 0` is the zero algebra), as in the proof of ECD Lemma 15.3. Over a connected
ring this is Mathlib's `Algebra.IsFiniteSplit` (`T ≃ₐ[R] Fin n → R`); over a disconnected ring it
is weaker, which is what the tower construction needs. -/
def IsTotallySplit (R T : Type*) [CommRing R] [CommRing T] [_root_.Algebra R T] : Prop :=
  ∃ (m : ℕ) (e : Fin m → R), (∀ j, IsIdempotentElem (e j)) ∧
    Nonempty (T ≃ₐ[R] ((j : Fin m) → R ⧸ Ideal.span {1 - e j}))

/-- A4/finite-etale-split-ring (relation): a quotient `T ⧸ (1 - e)` of a totally split algebra by
an idempotent of `T` is totally split. -/
theorem IsTotallySplit.quotient_idempotent {R T : Type*} [CommRing R] [CommRing T]
    [_root_.Algebra R T] (h : IsTotallySplit R T) {e : T} (he : IsIdempotentElem e) :
    IsTotallySplit R (T ⧸ Ideal.span {1 - e}) := sorry

/-- A4/finite-etale-split-ring (compatibility): Mathlib's finite split algebras
(`T ≃ₐ[R] Fin n → R`) are totally split, with all idempotents `e_j = 1`. -/
theorem IsTotallySplit.of_isFiniteSplit {R T : Type*} [CommRing R] [CommRing T]
    [_root_.Algebra R T] [_root_.Algebra.IsFiniteSplit R T] : IsTotallySplit R T := sorry

end Algebra

/-- A4/finite-etale-split-ring (structure): a commutative ring `R` *has no nonsplit finite étale
covers* if every finite étale `R`-algebra is totally split (ECD proof of Lemma 15.3). No topology
is involved. -/
class IsFiniteEtaleSplit (R : Type u) [CommRing R] : Prop where
  /-- Every finite étale `R`-algebra is totally split. -/
  isTotallySplit : ∀ (T : Type u) [CommRing T] [_root_.Algebra R T] [_root_.Algebra.Etale R T]
    [Module.Finite R T], Algebra.IsTotallySplit R T

/-- A4/finite-etale-split-ring (characterisation): `R` has no nonsplit finite étale covers iff every
finite étale, faithfully flat `R`-algebra has an `R`-algebra section. -/
theorem isFiniteEtaleSplit_iff_exists_section (R : Type u) [CommRing R] :
    IsFiniteEtaleSplit R ↔ ∀ (T : Type u) [CommRing T] [_root_.Algebra R T]
      [_root_.Algebra.Etale R T] [Module.Finite R T] [Module.FaithfullyFlat R T],
      Nonempty (T →ₐ[R] R) := sorry

/-- A4/finite-etale-split-ring (relation): over a ring without nonsplit finite étale covers, a
monic polynomial of positive degree whose derivative is a unit modulo `P` (a standard étale pair
`(P, 1)`) has a root. -/
theorem IsFiniteEtaleSplit.exists_root {R : Type u} [CommRing R] [IsFiniteEtaleSplit R]
    {P : R[X]} (hP : P.Monic) (hd : 0 < P.natDegree)
    (hu : IsUnit (AdjoinRoot.mk P (derivative P))) : ∃ r : R, P.IsRoot r := sorry

/-- A4/finite-etale-split-ring (compatibility): a field has no nonsplit finite étale covers iff it
is separably closed (Mathlib `IsSepClosed`). -/
theorem isFiniteEtaleSplit_iff_isSepClosed (K : Type u) [Field K] :
    IsFiniteEtaleSplit K ↔ IsSepClosed K := sorry

/-- A4/finite-etale-split-ring (relation): if base change along `R → R'` is essentially surjective
and fully faithful on finite étale algebras, then `R` has no nonsplit finite étale covers iff `R'`
has none. -/
theorem IsFiniteEtaleSplit.of_baseChange_equivalence {R R' : Type u} [CommRing R] [CommRing R']
    [_root_.Algebra R R']
    (hess : ∀ (T' : Type u) [CommRing T'] [_root_.Algebra R' T'] [_root_.Algebra.Etale R' T']
      [Module.Finite R' T'], ∃ (T : Type u) (_ : CommRing T) (_ : _root_.Algebra R T),
        _root_.Algebra.Etale R T ∧ Module.Finite R T ∧ Nonempty ((R' ⊗[R] T) ≃ₐ[R'] T'))
    (hff : ∀ (S T : Type u) [CommRing S] [CommRing T] [_root_.Algebra R S] [_root_.Algebra R T]
      [_root_.Algebra.Etale R S] [Module.Finite R S] [_root_.Algebra.Etale R T]
      [Module.Finite R T], Function.Bijective
        (fun f : S →ₐ[R] T ↦ _root_.Algebra.TensorProduct.map (AlgHom.id R' R') f)) :
    IsFiniteEtaleSplit R ↔ IsFiniteEtaleSplit R' := sorry

/-- A4/finite-etale-split-ring (instance): a finite product of rings without nonsplit finite étale
covers has none. -/
instance IsFiniteEtaleSplit.pi {ι : Type u} [Finite ι] (R : ι → Type u) [∀ i, CommRing (R i)]
    [∀ i, IsFiniteEtaleSplit (R i)] : IsFiniteEtaleSplit ((i : ι) → R i) := sorry

/-- A4/finite-etale-split-ring (instance): the zero ring has no nonsplit finite étale covers. -/
instance IsFiniteEtaleSplit.of_subsingleton (R : Type u) [CommRing R] [Subsingleton R] :
    IsFiniteEtaleSplit R := sorry

-- test IsFiniteEtaleSplit.test_isSepClosed (compatibility) [A4/finite-etale-split-ring]
example (K : Type) [Field K] : IsFiniteEtaleSplit K ↔ IsSepClosed K := sorry

-- test IsFiniteEtaleSplit.test_zero (degenerate) [A4/finite-etale-split-ring]
example : IsFiniteEtaleSplit PUnit.{1} := sorry

/- `ℚ[X]/(X² - 2)` is finite étale and faithfully flat over `ℚ` with no `ℚ`-algebra map to `ℚ`. -/
-- test IsFiniteEtaleSplit.test_not_rat (non-example) [A4/finite-etale-split-ring]
example : ¬ IsFiniteEtaleSplit ℚ := sorry

/- The section criterion must be restricted to faithfully flat algebras: the zero algebra is
finite étale and totally split, with no section. -/
-- test IsFiniteEtaleSplit.test_zero_algebra_has_no_section (non-example)
--   [A4/finite-etale-split-ring]
example (R : Type) [CommRing R] [Nontrivial R] [IsFiniteEtaleSplit R] :
    Algebra.IsTotallySplit R PUnit.{1} ∧ IsEmpty (PUnit.{1} →ₐ[R] R) := sorry

-- test IsFiniteEtaleSplit.test_pi (computation) [A4/finite-etale-split-ring]
example (K₁ K₂ : Type) [Field K₁] [Field K₂] [IsSepClosed K₁] [IsSepClosed K₂] :
    IsFiniteEtaleSplit (K₁ × K₂) := sorry

-- test IsFiniteEtaleSplit.test_exists_root (characterisation) [A4/finite-etale-split-ring]
example (R : Type) [CommRing R] [IsFiniteEtaleSplit R] (P : R[X]) (hP : P.Monic)
    (hd : 0 < P.natDegree) (hu : IsUnit (AdjoinRoot.mk P (derivative P))) :
    ∃ r, P.IsRoot r := sorry

/-! ## AdicEtaleGeometry:A4/finite-etale-galois-torsor (definition) -/

namespace Algebra

section Torsor

variable (G A B : Type*) [Group G] [CommRing A] [CommRing B] [_root_.Algebra A B]
  [MulSemiringAction G B] [SMulCommClass G A B]

/-- A4/finite-etale-galois-torsor (data): the Galois map `γ : B ⊗[A] B → Map(G, B)`,
`b ⊗ b' ↦ (g ↦ b * g • b')`, a `B`-algebra map for the left factor. -/
def galoisTensorMap : B ⊗[A] B →ₐ[B] (G → B) :=
  _root_.Algebra.TensorProduct.lift (_root_.Algebra.ofId B (G → B))
    (AlgHom.pi fun g ↦ MulSemiringAction.toAlgHom A B g) fun _ _ ↦ Commute.all _ _

/-- A4/finite-etale-galois-torsor (structure): `B` is a *finite étale `G`-torsor* over `A` if it is
finite étale and faithfully flat over `A` and the Galois map `B ⊗[A] B → Map(G, B)` is bijective
(Spec `B` → Spec `A` is a torsor under the constant group scheme `G`). -/
class IsFiniteEtaleTorsor [Finite G] : Prop where
  /-- `B` is étale over `A`. -/
  etale : _root_.Algebra.Etale A B
  /-- `B` is finite over `A`. -/
  finite : Module.Finite A B
  /-- `B` is faithfully flat over `A`. -/
  faithfullyFlat : Module.FaithfullyFlat A B
  /-- The Galois map is bijective. -/
  bijective_galoisTensorMap : Function.Bijective (galoisTensorMap G A B)

variable {G A B} [Finite G]

/-- A4/finite-etale-galois-torsor (data): the `B`-algebra isomorphism
`γ : B ⊗[A] B ≃ₐ[B] (G → B)`, `b ⊗ b' ↦ (g ↦ b * g • b')`. -/
def IsFiniteEtaleTorsor.galoisMap [h : IsFiniteEtaleTorsor G A B] : B ⊗[A] B ≃ₐ[B] (G → B) :=
  AlgEquiv.ofBijective (galoisTensorMap G A B) h.bijective_galoisTensorMap

/-- A4/finite-etale-galois-torsor (data): the isomorphism `B^{⊗(k+1)} ≃ₐ[A] Map(Gᵏ, B)` obtained by
iterating the Galois map, compatible with the face maps. -/
def IsFiniteEtaleTorsor.iterGaloisMap [IsFiniteEtaleTorsor G A B] (k : ℕ) :
    (⨂[A] _ : Fin (k + 1), B) ≃ₐ[A] ((Fin k → G) → B) := sorry

/-- A4/finite-etale-galois-torsor (constructor): the trivial torsor `Map(G, A)` with
`(h • f) g = f (g * h)`, for any `A`-algebra `C` identified with it equivariantly. -/
theorem IsFiniteEtaleTorsor.trivial (C : Type*) [CommRing C] [_root_.Algebra A C]
    [MulSemiringAction G C] [SMulCommClass G A C] (e : C ≃ₐ[A] (G → A))
    (he : ∀ (h : G) (c : C) (g : G), e (h • c) g = e c (g * h)) :
    IsFiniteEtaleTorsor G A C := sorry

/-- A4/finite-etale-galois-torsor (constructor): the tensor product of a `G`-torsor and a
`G'`-torsor is a `(G × G')`-torsor, for the factorwise action. -/
theorem IsFiniteEtaleTorsor.tensor {G' B' : Type*} [Group G'] [Finite G'] [CommRing B']
    [_root_.Algebra A B'] [MulSemiringAction G' B'] [SMulCommClass G' A B']
    [MulSemiringAction (G × G') (B ⊗[A] B')] [SMulCommClass (G × G') A (B ⊗[A] B')]
    (hact : ∀ (g : G × G') (b : B) (b' : B'), g • (b ⊗ₜ[A] b') = (g.1 • b) ⊗ₜ (g.2 • b'))
    [IsFiniteEtaleTorsor G A B] [IsFiniteEtaleTorsor G' A B'] :
    IsFiniteEtaleTorsor (G × G') A (B ⊗[A] B') := sorry

/-- A4/finite-etale-galois-torsor (functoriality): base change along any `A → A'` preserves
torsors, for the action on the right factor. -/
theorem IsFiniteEtaleTorsor.baseChange (A' : Type*) [CommRing A'] [_root_.Algebra A A']
    [MulSemiringAction G (A' ⊗[A] B)] [SMulCommClass G A' (A' ⊗[A] B)]
    (hact : ∀ (g : G) (a : A') (b : B), g • (a ⊗ₜ[A] b) = a ⊗ₜ (g • b))
    [IsFiniteEtaleTorsor G A B] : IsFiniteEtaleTorsor G A' (A' ⊗[A] B) := sorry

/-- A4/finite-etale-galois-torsor (compatibility): a torsor satisfies Mathlib's
`Algebra.IsInvariant A B G`, that is, `B^G = A`. -/
theorem IsFiniteEtaleTorsor.isInvariant [IsFiniteEtaleTorsor G A B] :
    _root_.Algebra.IsInvariant A B G := sorry

/-- A4/finite-etale-galois-torsor (compatibility): over a nonzero ring, a torsor satisfies
Mathlib's `IsGaloisGroup G A B` (faithful action with invariants `A`). -/
theorem IsFiniteEtaleTorsor.isGaloisGroup [Nontrivial A] [IsFiniteEtaleTorsor G A B] :
    IsGaloisGroup G A B := sorry

/-- A4/finite-etale-galois-torsor (other): `B` is finite projective over `A` of constant rank
`|G|`. -/
theorem IsFiniteEtaleTorsor.rankAtStalk_eq_card [Fintype G] [IsFiniteEtaleTorsor G A B]
    (p : PrimeSpectrum A) : Module.Projective A B ∧ Module.rankAtStalk B p = Fintype.card G :=
  sorry

/-- A4/finite-etale-galois-torsor (relation): for `π : G' ↠ G` and an equivariant `A`-algebra map
`ι : B → B'` from a `G`-torsor to a `G'`-torsor (`g' • ι b = ι (π g' • b)`), `B'` is a
`(ker π)`-torsor over `B`; in particular `ι` is injective and faithfully flat. -/
theorem IsFiniteEtaleTorsor.of_surjective {G' B' : Type*} [Group G'] [Finite G'] [CommRing B']
    [_root_.Algebra A B'] [MulSemiringAction G' B'] [SMulCommClass G' A B']
    [IsFiniteEtaleTorsor G A B] [IsFiniteEtaleTorsor G' A B'] (π : G' →* G)
    (hπ : Function.Surjective π) (ι : B →ₐ[A] B') (hι : ∀ (g : G') (b : B), ι (π g • b) = g • ι b) :
    Function.Injective ι ∧
      @Module.FaithfullyFlat B B' _ _ ι.toRingHom.toAlgebra.toModule := sorry

/-- A4/finite-etale-galois-torsor (compatibility): for fields `K ⊆ L`, `L` is a `G`-torsor over
`K` iff `L/K` is Galois and `G → Gal(L/K)` is an isomorphism. -/
theorem IsFiniteEtaleTorsor.iff_isGalois {K L : Type*} [Field K] [Field L] [_root_.Algebra K L]
    [MulSemiringAction G L] [SMulCommClass G K L] :
    IsFiniteEtaleTorsor G K L ↔
      IsGalois K L ∧ Function.Bijective (MulSemiringAction.toAlgAut G K L) := sorry

end Torsor

end Algebra

section TorsorTests

/- `ℤ[1/2][i]` over `ℤ[1/2]`, with complex conjugation. -/
-- test IsFiniteEtaleTorsor.test_gaussian_half (computation) [A4/finite-etale-galois-torsor]
example [_root_.Algebra (Localization.Away (2 : ℤ)) (Localization.Away (2 : GaussianInt))]
    (halg : ∀ n : ℤ, algebraMap (Localization.Away (2 : ℤ)) (Localization.Away (2 : GaussianInt))
      (algebraMap ℤ _ n) = algebraMap GaussianInt _ n)
    [MulSemiringAction (Multiplicative (ZMod 2)) (Localization.Away (2 : GaussianInt))]
    [SMulCommClass (Multiplicative (ZMod 2)) (Localization.Away (2 : ℤ))
      (Localization.Away (2 : GaussianInt))]
    (hconj : ∀ z : GaussianInt, Multiplicative.ofAdd (1 : ZMod 2) •
      algebraMap GaussianInt (Localization.Away (2 : GaussianInt)) z =
        algebraMap GaussianInt _ (star z)) :
    Algebra.IsFiniteEtaleTorsor (Multiplicative (ZMod 2)) (Localization.Away (2 : ℤ))
      (Localization.Away (2 : GaussianInt)) := sorry

/- Over `ℤ`, the Galois map `ℤ[i] ⊗ ℤ[i] → ℤ[i] × ℤ[i]` of conjugation is not surjective. -/
-- test IsFiniteEtaleTorsor.test_not_gaussian (non-example) [A4/finite-etale-galois-torsor]
example [MulSemiringAction (Multiplicative (ZMod 2)) GaussianInt]
    [SMulCommClass (Multiplicative (ZMod 2)) ℤ GaussianInt]
    (hconj : ∀ z : GaussianInt, Multiplicative.ofAdd (1 : ZMod 2) • z = star z) :
    ¬ Algebra.IsFiniteEtaleTorsor (Multiplicative (ZMod 2)) ℤ GaussianInt := sorry

/- The trivial action of `ℤ/2` on `A × A`: the image of the Galois map lies in the diagonal. -/
-- test IsFiniteEtaleTorsor.test_trivial_action (non-example) [A4/finite-etale-galois-torsor]
example (A : Type) [CommRing A] [Nontrivial A] [MulSemiringAction (Multiplicative (ZMod 2)) (A × A)]
    [SMulCommClass (Multiplicative (ZMod 2)) A (A × A)]
    (htriv : ∀ (g : Multiplicative (ZMod 2)) (x : A × A), g • x = x) :
    ¬ Algebra.IsFiniteEtaleTorsor (Multiplicative (ZMod 2)) A (A × A) := sorry

-- test IsFiniteEtaleTorsor.test_trivial_group (degenerate) [A4/finite-etale-galois-torsor]
example (G A B : Type) [Group G] [Finite G] [Subsingleton G] [CommRing A] [CommRing B]
    [_root_.Algebra A B] [MulSemiringAction G B] [SMulCommClass G A B] :
    Algebra.IsFiniteEtaleTorsor G A B ↔ Function.Bijective (algebraMap A B) := sorry

-- test IsFiniteEtaleTorsor.test_isGalois (compatibility) [A4/finite-etale-galois-torsor]
example (K L : Type) [Field K] [Field L] [_root_.Algebra K L] [FiniteDimensional K L]
    [IsGalois K L] :
    Algebra.IsFiniteEtaleTorsor (L ≃ₐ[K] L) K L ∧ IsGaloisGroup (L ≃ₐ[K] L) K L := sorry

end TorsorTests

/-! ## AdicEtaleGeometry:A4/henselian-pairs-filtered-colimit (lemma) -/

/-- A4/henselian-pairs-filtered-colimit: a filtered colimit of henselian pairs `(R_i, I_i)` is
henselian along the ideal generated by the images of the `I_i` (Stacks 0FWT, used in the proof of
ECD Lemma 15.3). -/
theorem Ring.DirectLimit.henselianRing {ι : Type*} [Preorder ι] [IsDirectedOrder ι] [Nonempty ι]
    (R : ι → Type*) [∀ i, CommRing (R i)] (f : ∀ i j, i ≤ j → R i →+* R j)
    [DirectedSystem R fun i j h ↦ f i j h] (I : ∀ i, Ideal (R i))
    (hI : ∀ i j (h : i ≤ j), (I i).map (f i j h) ≤ I j) [∀ i, HenselianRing (R i) (I i)] :
    HenselianRing (_root_.Ring.DirectLimit R fun i j h ↦ f i j h)
      (⨆ i, (I i).map (_root_.Ring.DirectLimit.of R (fun i j h ↦ f i j h) i)) := sorry

/-! ## AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit (lemma) -/

/-- A4/finite-etale-algebras-filtered-colimit (a): every finite étale algebra over a filtered
colimit `R = colim R_i` is the base change of a finite étale `R_i`-algebra for some `i`
(Stacks 07RP, the essential surjectivity of `2-colim FÉt(R_i) → FÉt(R)`). -/
theorem Ring.DirectLimit.finiteEtaleEquivalence {ι : Type u} [Preorder ι] [IsDirectedOrder ι]
    [Nonempty ι] (R : ι → Type u) [∀ i, CommRing (R i)] (f : ∀ i j, i ≤ j → R i →+* R j)
    [DirectedSystem R fun i j h ↦ f i j h] (S : Type u) [CommRing S]
    [_root_.Algebra (_root_.Ring.DirectLimit R fun i j h ↦ f i j h) S]
    [_root_.Algebra.Etale (_root_.Ring.DirectLimit R fun i j h ↦ f i j h) S]
    [Module.Finite (_root_.Ring.DirectLimit R fun i j h ↦ f i j h) S] :
    ∃ (i : ι) (Si : Type u) (_ : CommRing Si) (_ : _root_.Algebra (R i) Si),
      _root_.Algebra.Etale (R i) Si ∧ Module.Finite (R i) Si ∧
      letI := (_root_.Ring.DirectLimit.of R (fun i j h ↦ f i j h) i).toAlgebra
      Nonempty (((_root_.Ring.DirectLimit R fun i j h ↦ f i j h) ⊗[R i] Si) ≃ₐ[
        _root_.Ring.DirectLimit R fun i j h ↦ f i j h] S) := sorry

/-! ## AdicEtaleGeometry:A4/splitting-torsor-of-finite-etale-algebra (lemma) -/

/-- A4/splitting-torsor-of-finite-etale-algebra: every finite étale `A`-algebra `S` is totally
split after base change to a finite étale torsor `A → P` under a finite group (take `G = S_n`
permuting the factors of `ε · S'^{⊗n}`, `S'` the constant-rank padding of `S`; compare Mathlib's
`Algebra.IsFiniteSplit.exists_tensorProduct_of_etale` for constant rank). -/
theorem Algebra.exists_isFiniteEtaleTorsor_isTotallySplit (A S : Type u) [CommRing A]
    [CommRing S] [_root_.Algebra A S] [_root_.Algebra.Etale A S] [Module.Finite A S] :
    ∃ (G : Type u) (_ : Group G) (_ : Finite G) (P : Type u) (_ : CommRing P)
      (_ : _root_.Algebra A P) (_ : MulSemiringAction G P) (_ : SMulCommClass G A P),
      Algebra.IsFiniteEtaleTorsor G A P ∧ Algebra.IsTotallySplit P (P ⊗[A] S) := sorry

/-! ## AdicEtaleGeometry:A4/finite-etale-torsor-tower (construction) -/

/-- A4/finite-etale-torsor-tower (structure): a *finite étale torsor tower* over `A` (ECD proof of
Lemma 15.3): a directed set `ι`, finite groups `G i`, `A`-algebras `level i` that are finite étale
`G i`-torsors, surjections `π : G j → G i` and equivariant `A`-algebra maps
`transition : level i → level j` for `i ≤ j`, functorial, such that the direct limit has no
nonsplit finite étale covers. -/
structure FiniteEtaleTorsorTower (A : Type u) [CommRing A] where
  /-- The directed index set. -/
  ι : Type u
  /-- The order on the index set. -/
  [preorder : Preorder ι]
  /-- The index set is directed. -/
  [directed : IsDirectedOrder ι]
  /-- The index set is nonempty. -/
  [nonempty : Nonempty ι]
  /-- The finite groups `G_i`. -/
  G : ι → Type u
  /-- The group structures. -/
  [instGroup : ∀ i, Group (G i)]
  /-- The groups are finite. -/
  [finite : ∀ i, Finite (G i)]
  /-- The surjections `π_{ij} : G_j → G_i`. -/
  π : ∀ ⦃i j : ι⦄, i ≤ j → G j →* G i
  /-- The `π_{ij}` are surjective. -/
  π_surjective : ∀ ⦃i j : ι⦄ (h : i ≤ j), Function.Surjective (π h)
  /-- `π_{ii} = id`. -/
  π_id : ∀ i (g : G i), π (le_refl i) g = g
  /-- `π_{ik} = π_{ij} ∘ π_{jk}`. -/
  π_comp : ∀ ⦃i j k : ι⦄ (hij : i ≤ j) (hjk : j ≤ k) (g : G k),
    π hij (π hjk g) = π (hij.trans hjk) g
  /-- The levels `A_i`. -/
  level : ι → Type u
  /-- The ring structures of the levels. -/
  [commRing : ∀ i, CommRing (level i)]
  /-- The `A`-algebra structures of the levels. -/
  [algebra : ∀ i, _root_.Algebra A (level i)]
  /-- The actions of `G_i` on `A_i`. -/
  [action : ∀ i, MulSemiringAction (G i) (level i)]
  /-- `G_i` acts by `A`-algebra automorphisms. -/
  [smulCommClass : ∀ i, SMulCommClass (G i) A (level i)]
  /-- Each `A_i` is a finite étale `G_i`-torsor over `A`. -/
  isTorsor : ∀ i, Algebra.IsFiniteEtaleTorsor (G i) A (level i)
  /-- The transition maps `ι_{ij} : A_i → A_j`. -/
  transition : ∀ ⦃i j : ι⦄, i ≤ j → level i →ₐ[A] level j
  /-- `ι_{ij} (π_{ij} g • a) = g • ι_{ij} a`. -/
  transition_smul : ∀ ⦃i j : ι⦄ (h : i ≤ j) (g : G j) (a : level i),
    transition h (π h g • a) = g • transition h a
  /-- `ι_{ii} = id`. -/
  transition_id : ∀ i (a : level i), transition (le_refl i) a = a
  /-- `ι_{ik} = ι_{jk} ∘ ι_{ij}`. -/
  transition_comp : ∀ ⦃i j k : ι⦄ (hij : i ≤ j) (hjk : j ≤ k) (a : level i),
    transition hjk (transition hij a) = transition (hij.trans hjk) a
  /-- The direct limit `A_∞` has no nonsplit finite étale covers. -/
  split : IsFiniteEtaleSplit (_root_.Ring.DirectLimit level fun _ _ h ↦ transition h)

namespace FiniteEtaleTorsorTower

attribute [instance] preorder directed nonempty instGroup finite commRing algebra action
  smulCommClass

section Algebraic

variable {A : Type u} [CommRing A] (T : FiniteEtaleTorsorTower A)

instance (i : T.ι) : _root_.Algebra.Etale A (T.level i) := (T.isTorsor i).etale

instance (i : T.ι) : Module.Finite A (T.level i) := (T.isTorsor i).finite

/-- A4/finite-etale-torsor-tower (data): the direct limit `A_∞ = colim_i A_i`. -/
def colim : Type u := _root_.Ring.DirectLimit T.level fun _ _ h ↦ T.transition h

instance : CommRing T.colim :=
  inferInstanceAs (CommRing (_root_.Ring.DirectLimit T.level fun _ _ h ↦ T.transition h))

/-- A4/finite-etale-torsor-tower (data): the canonical maps `A_i → A_∞`. -/
def toColimRingHom (i : T.ι) : T.level i →+* T.colim :=
  _root_.Ring.DirectLimit.of T.level (fun _ _ h ↦ T.transition h) i

instance : _root_.Algebra A T.colim :=
  ((T.toColimRingHom (Classical.arbitrary T.ι)).comp
    (algebraMap A (T.level (Classical.arbitrary T.ι)))).toAlgebra

/-- A4/finite-etale-torsor-tower (data): the canonical maps `A_i →ₐ[A] A_∞`. -/
def toColim (i : T.ι) : T.level i →ₐ[A] T.colim where
  toRingHom := T.toColimRingHom i
  commutes' := sorry

/-- A4/finite-etale-torsor-tower (instance): `A_∞` has no nonsplit finite étale covers (the
defining axiom). -/
instance isFiniteEtaleSplit_colim : IsFiniteEtaleSplit T.colim := T.split

/-- A4/finite-etale-torsor-tower (data): the profinite group `G = lim_i G_i`. -/
def group (T : FiniteEtaleTorsorTower A) : ProfiniteGrp.{u} := sorry

/-- A4/finite-etale-torsor-tower (data): the projections `G → G_i`. -/
def toLevelGroup (i : T.ι) : T.group →* T.G i := sorry

/-- A4/finite-etale-torsor-tower (other): the projections `G → G_i` are surjective and compatible
with the `π_{ij}`. -/
theorem toLevelGroup_surjective (i : T.ι) : Function.Surjective (T.toLevelGroup i) := sorry

/-- A4/finite-etale-torsor-tower (data): the action of `G` on `A_∞`, with `toColim i` equivariant
along `G → G_i`. -/
instance colimAction : MulSemiringAction T.group T.colim := sorry

/-- A4/finite-etale-torsor-tower (other): `G` acts by `A`-algebra automorphisms, `toColim i` is
equivariant along `G → G_i`, and every element of `A_∞` has an open stabiliser. -/
theorem colimAction_spec :
    SMulCommClass T.group A T.colim ∧
      (∀ (i : T.ι) (g : T.group) (a : T.level i),
        T.toColim i (T.toLevelGroup i g • a) = g • T.toColim i a) ∧
      ∀ x : T.colim, IsOpen (MulAction.stabilizer T.group x : Set T.group) := sorry

instance : SMulCommClass T.group A T.colim := T.colimAction_spec.1

/-- A4/finite-etale-torsor-tower (characterisation): every finite étale `A`-algebra becomes
totally split over some level. -/
theorem exists_level_totallySplit (S : Type u) [CommRing S] [_root_.Algebra A S]
    [_root_.Algebra.Etale A S] [Module.Finite A S] :
    ∃ i, Algebra.IsTotallySplit (T.level i) (T.level i ⊗[A] S) := sorry

/-- A4/finite-etale-torsor-tower (relation): for `i ≤ j`, `A_j` is a `(ker π_{ij})`-torsor over
`A_i`; in particular the transition maps are injective and faithfully flat. -/
theorem transition_isFiniteEtaleTorsor ⦃i j : T.ι⦄ (h : i ≤ j) :
    Function.Injective (T.transition h) ∧
      @Module.FaithfullyFlat (T.level i) (T.level j) _ _
        (T.transition h).toRingHom.toAlgebra.toModule := sorry

/-- A4/finite-etale-torsor-tower (compatibility): `(A_∞)^G = A` (Mathlib
`Algebra.IsInvariant`), and `G` is a Galois group of `A_∞/A` when `A` is nonzero. -/
theorem colim_isInvariant :
    _root_.Algebra.IsInvariant A T.colim T.group ∧
      (Nontrivial A → IsGaloisGroup T.group A T.colim) := sorry

/-- A4/finite-etale-torsor-tower (data): `A_∞ ⊗[A] A_∞ ≃ₐ[A] LC(G, A_∞)`,
`a ⊗ b ↦ (g ↦ a * g • b)` (`colimTensorEquiv_tmul`). -/
def colimTensorEquiv : T.colim ⊗[A] T.colim ≃ₐ[A] LocallyConstant T.group T.colim := sorry

/-- A4/finite-etale-torsor-tower (characterisation): the formula for `colimTensorEquiv`. -/
theorem colimTensorEquiv_tmul (a b : T.colim) (g : T.group) :
    T.colimTensorEquiv (a ⊗ₜ b) g = a * g • b := sorry

/-- A4/finite-etale-torsor-tower (other): `A_∞` is a faithfully flat `A`-algebra (it is
ind-étale). -/
theorem faithfullyFlat_colim : Module.FaithfullyFlat A T.colim := sorry

/-- A4/finite-etale-torsor-tower (functoriality): for `A → A'`, each `A' ⊗[A] A_i` is a finite
étale `G_i`-torsor over `A'` (the base-changed system need not be a tower; `canonical A'` refines
it). -/
theorem baseChange (A' : Type u) [CommRing A'] [_root_.Algebra A A'] (i : T.ι)
    [MulSemiringAction (T.G i) (A' ⊗[A] T.level i)] [SMulCommClass (T.G i) A' (A' ⊗[A] T.level i)]
    (hact : ∀ (g : T.G i) (a : A') (b : T.level i), g • (a ⊗ₜ[A] b) = a ⊗ₜ (g • b)) :
    Algebra.IsFiniteEtaleTorsor (T.G i) A' (A' ⊗[A] T.level i) := sorry

end Algebraic

/-- A4/finite-etale-torsor-tower (constructor): every commutative ring has a finite étale torsor
tower: splitting torsors indexed by the finite sets of isomorphism classes of finite étale
algebras. -/
def canonical (A : Type u) [CommRing A] : FiniteEtaleTorsorTower A := sorry

-- test FiniteEtaleTorsorTower.test_finiteField (computation) [A4/finite-etale-torsor-tower]
example (p : ℕ) [Fact p.Prime] : ∃ T : FiniteEtaleTorsorTower (ZMod p),
    Nonempty (T.colim ≃+* AlgebraicClosure (ZMod p)) := sorry

-- test FiniteEtaleTorsorTower.test_trivial (degenerate) [A4/finite-etale-torsor-tower]
example (A : Type) [CommRing A] [IsFiniteEtaleSplit A] :
    ∃ T : FiniteEtaleTorsorTower A, Nonempty (T.colim ≃ₐ[A] A) := sorry

/- The cyclotomic system `ℚ_p(μ_{p^n})` is not a tower: its colimit `ℚ_p(μ_{p^∞})` has the
nonsplit finite étale cover given by the unramified quadratic extension. -/
-- test FiniteEtaleTorsorTower.test_not_cyclotomic (non-example) [A4/finite-etale-torsor-tower]
example (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [_root_.Algebra ℚ_[p] L]
    [IsCyclotomicExtension {n | ∃ k : ℕ, n = p ^ k} ℚ_[p] L] : ¬ IsFiniteEtaleSplit L := sorry

-- test FiniteEtaleTorsorTower.test_field_residue (compatibility) [A4/finite-etale-torsor-tower]
example (K : Type) [Field K] (T : FiniteEtaleTorsorTower K) (q : Ideal T.colim) [q.IsPrime] :
    letI : _root_.Algebra K q.ResidueField :=
      ((algebraMap T.colim q.ResidueField).comp (algebraMap K T.colim)).toAlgebra
    IsSepClosure K q.ResidueField := sorry

-- test FiniteEtaleTorsorTower.test_exists_level_split (characterisation)
--   [A4/finite-etale-torsor-tower]
example (A : Type) [CommRing A] (T : FiniteEtaleTorsorTower A) (S : Type) [CommRing S]
    [_root_.Algebra A S] [_root_.Algebra.Etale A S] [Module.Finite A S] :
    ∃ i, Algebra.IsTotallySplit (T.level i) (T.level i ⊗[A] S) := sorry

end FiniteEtaleTorsorTower

/-! ## AdicEtaleGeometry:A4/uniform-completion-etale-comparison (theorem) -/

namespace Huber

section UniformCompletionEtale

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A4/uniform-completion-etale-comparison (ii): for a complete Tate ring `A`, base change along
the uniformization `ι : A → Aᵘ` (AdicSpacesPartII:R0/uniformization) is an equivalence
`FÉt(A) → FÉt(Aᵘ)`: essentially surjective and fully faithful. -/
theorem Pair.uniformization.baseChange_finiteEtale_equivalence (S : Pair A) :
    letI := S.toUniformization.toRingHom.toAlgebra
    (∀ (T' : Type u) [CommRing T'] [_root_.Algebra (Uniformization A) T']
      [_root_.Algebra.Etale (Uniformization A) T'] [Module.Finite (Uniformization A) T'],
      ∃ (T : Type u) (_ : CommRing T) (_ : _root_.Algebra A T), _root_.Algebra.Etale A T ∧
        Module.Finite A T ∧ Nonempty ((Uniformization A ⊗[A] T) ≃ₐ[Uniformization A] T')) ∧
    ∀ (T₁ T₂ : Type u) [CommRing T₁] [CommRing T₂] [_root_.Algebra A T₁] [_root_.Algebra A T₂]
      [_root_.Algebra.Etale A T₁] [Module.Finite A T₁] [_root_.Algebra.Etale A T₂]
      [Module.Finite A T₂], Function.Bijective fun f : T₁ →ₐ[A] T₂ ↦
        _root_.Algebra.TensorProduct.map (AlgHom.id (Uniformization A) (Uniformization A)) f :=
  sorry

/-- A4/uniform-completion-etale-comparison (iii), ring-level core: for a finite étale `A`-algebra
`B` with its natural topology (a Tate ring, AdicEtaleGeometry:A1/finite-etale-affinoid-algebra),
`Aᵘ ⊗[A] B` is the uniformization of `B`, compatibly with `ι_B`. -/
theorem Pair.uniformization.finiteEtale_uniformization (S : Pair A) (B : Type u) [CommRing B]
    [_root_.Algebra A B] [_root_.Algebra.Etale A B] [Module.Finite A B] [TopologicalSpace B]
    [IsModuleTopology A B] [IsTopologicalRing B] [IsTateRing B] (T : Pair B) :
    letI := S.toUniformization.toRingHom.toAlgebra
    ∃ e : (Uniformization A ⊗[A] B) ≃+* Uniformization B,
      ∀ b : B, e (1 ⊗ₜ b) = T.toUniformization.toRingHom b := sorry

/-- A4/uniform-completion-etale-comparison (iv): a complete Tate ring has no nonsplit finite étale
covers iff its uniformization has none. -/
theorem Pair.uniformization.isFiniteEtaleSplit_iff :
    IsFiniteEtaleSplit A ↔ IsFiniteEtaleSplit (Uniformization A) := sorry

-- Huber.Pair.uniformization.spaComap_homeomorph (clause (i)): the homeomorphism
--   `Spa(Aᵘ, Aᵘ⁺) ≅ Spa(A, A⁺)` matching rational subsets is clause (d) of
--   AdicSpacesPartII:R0/uniformization and is stated there; it is not restated here.

end UniformCompletionEtale

end Huber

/-! ## AdicEtaleGeometry:A4/completed-tower-pair (construction) -/

namespace FiniteEtaleTorsorTower

open Huber

section CompletedTower

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (T : FiniteEtaleTorsorTower A)

/-- A4/completed-tower-pair (data): the natural topology of the level `A_i`, a finite projective
`A`-module. -/
instance levelTopology (i : T.ι) : TopologicalSpace (T.level i) := moduleTopology A (T.level i)

instance (i : T.ι) : IsModuleTopology A (T.level i) := ⟨rfl⟩

instance (i : T.ι) : IsTopologicalRing (T.level i) := IsModuleTopology.isTopologicalRing A _

/-- A4/completed-tower-pair (instance): each level is a Tate ring
(AdicEtaleGeometry:A1/finite-etale-affinoid-algebra). -/
instance level_isTateRing (i : T.ι) : IsTateRing (T.level i) := sorry

/-- A4/completed-tower-pair (constructor): the Huber pair `(A_i, A_i⁺)` of level `i`, `A_i⁺` the
integral closure of the image of `A⁺`. -/
def levelPair (P : Pair A) (i : T.ι) : Pair (T.level i) where
  plus := (integralClosure (P.plus.map (algebraMap A (T.level i))) (T.level i)).toSubring
  isRingOfIntegralElements := sorry

/-- A4/completed-tower-pair (data): the transition maps as morphisms of Huber pairs. -/
def levelPairTransition (P : Pair A) ⦃i j : T.ι⦄ (h : i ≤ j) :
    Pair.Hom (T.levelPair P i) (T.levelPair P j) where
  toRingHom := (T.transition h).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- A4/completed-tower-pair (data): the colimit topology on `A_∞`, in which `colim_i A_i°` is an
open subring carrying its `ϖ`-adic topology (Berkeley lectures; not the colimit of chosen rings of
definition). -/
instance colimTopology : TopologicalSpace T.colim := sorry

instance : IsTopologicalRing T.colim := sorry

/-- A4/completed-tower-pair (instance): `A_∞` is a Tate ring. -/
instance colim_isTateRing : IsTateRing T.colim := sorry

/-- A4/completed-tower-pair (data): `colim_i A_i⁺ ⊆ A_∞`. -/
def colimPlus (P : Pair A) : Subring T.colim :=
  ⨆ i, (T.levelPair P i).plus.map (T.toColim i).toRingHom

/-- A4/completed-tower-pair (constructor): the Tate Huber pair `(A_∞, colim_i A_i⁺)`. -/
def colimPair (P : Pair A) : Pair T.colim where
  plus := T.colimPlus P
  isRingOfIntegralElements := sorry

/-- A4/completed-tower-pair (other): `A_∞° ⊆ ϖ⁻¹ · colim_i A_i°` for every pseudouniformizer `ϖ` of
`A`; in particular `A_∞` is uniform. -/
theorem colimPair_isUniform :
    (∀ ϖ : A, IsPseudoUniformizer ϖ → ∀ x ∈ powerBoundedSubring T.colim,
      algebraMap A T.colim ϖ * x ∈ ⨆ i, (powerBoundedSubring (T.level i)).map
        (T.toColim i).toRingHom) ∧
    IsBounded (powerBoundedSubring T.colim : Set T.colim) := sorry

/-- A4/completed-tower-pair (constructor): the completed tower pair `(Â_∞, Â_∞⁺)`, the
uniformization of `(A_∞, A_∞⁺)` (AdicSpacesPartII:R0/uniformization). -/
def completion (P : Pair A) : Pair (Uniformization T.colim) :=
  (T.colimPair P).uniformization

/-- A4/completed-tower-pair (compatibility): since `A_∞` is uniform, its uniformization is its
Hausdorff completion. -/
theorem completion_eq_completion (P : Pair A) :
    letI := IsTopologicalAddGroup.rightUniformSpace T.colim
    haveI : IsUniformAddGroup T.colim := isUniformAddGroup_of_addCommGroup
    ∃ e : Uniformization T.colim ≃+* Completion T.colim, IsHomeomorph e ∧
      ∀ x : T.colim, e ((T.colimPair P).toUniformization.toRingHom x) = (x : Completion T.colim) :=
  sorry

/-- A4/completed-tower-pair (characterisation): `Â_∞⁺` is the closure of the image of
`colim_i A_i⁺`. -/
theorem completion_plus_eq_closure (P : Pair A) :
    ((T.completion P).plus : Set (Uniformization T.colim)) =
      closure ((T.colimPair P).toUniformization.toRingHom '' (T.colimPlus P : Set T.colim)) :=
  sorry

/-- A4/completed-tower-pair (data): `(A_i, A_i⁺) → (A_∞, A_∞⁺)` as morphisms of Huber pairs. -/
def toColimPair (P : Pair A) (i : T.ι) : Pair.Hom (T.levelPair P i) (T.colimPair P) where
  toRingHom := (T.toColim i).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- A4/completed-tower-pair (data): the morphisms `(A_i, A_i⁺) → (Â_∞, Â_∞⁺)`, compatible with the
transitions. -/
def toCompletion (P : Pair A) (i : T.ι) : Pair.Hom (T.levelPair P i) (T.completion P) :=
  (T.colimPair P).toUniformization.comp (T.toColimPair P i)

/-- A4/completed-tower-pair (data): the structure morphism `(A, A⁺) → (Â_∞, Â_∞⁺)`. -/
def completionStructureHom (P : Pair A) : Pair.Hom P (T.completion P) := sorry

/-- A4/completed-tower-pair (data): the action of `G` on `Â_∞` extending its action on `A_∞`. -/
instance completionAction : MulSemiringAction T.group (Uniformization T.colim) := sorry

/-- A4/completed-tower-pair (other): `G` acts on `(Â_∞, Â_∞⁺)` by automorphisms of Huber pairs
over `(A, A⁺)`, with continuous action map `G × Â_∞ → Â_∞`. -/
theorem completionAction_spec (P : Pair A) :
    letI := T.completionAction
    Continuous (fun x : T.group × Uniformization T.colim ↦ x.1 • x.2) ∧
      (∀ (g : T.group) (x : Uniformization T.colim), x ∈ (T.completion P).plus →
        g • x ∈ (T.completion P).plus) ∧
      ∀ (g : T.group) (a : A), g • (T.completionStructureHom P).toRingHom a =
        (T.completionStructureHom P).toRingHom a := sorry

/-- A4/completed-tower-pair (universal-property): a family of morphisms `(A_i, A_i⁺) → (B, B⁺)`
into a complete Hausdorff pair with `B°` bounded, compatible with the transitions, lifts to
`(Â_∞, Â_∞⁺)`. -/
def completion.lift (P : Pair A) {B : Type v} [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] {Q : Pair B}
    (hB : IsBounded (powerBoundedSubring B : Set B)) (f : ∀ i, Pair.Hom (T.levelPair P i) Q)
    (hf : ∀ ⦃i j : T.ι⦄ (h : i ≤ j), (f j).toRingHom.comp (T.transition h).toRingHom =
      (f i).toRingHom) :
    Pair.Hom (T.completion P) Q := sorry

/-- A4/completed-tower-pair (universal-property): `lift f ∘ toCompletion i = f i`. -/
theorem completion.lift_comp_toCompletion (P : Pair A) {B : Type v} [CommRing B] [UniformSpace B]
    [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
    {Q : Pair B} (hB : IsBounded (powerBoundedSubring B : Set B))
    (f : ∀ i, Pair.Hom (T.levelPair P i) Q)
    (hf : ∀ ⦃i j : T.ι⦄ (h : i ≤ j), (f j).toRingHom.comp (T.transition h).toRingHom =
      (f i).toRingHom) (i : T.ι) :
    (completion.lift T P hB f hf).comp (T.toCompletion P i) = f i := sorry

/-- A4/completed-tower-pair (extensionality): morphisms out of `(Â_∞, Â_∞⁺)` into a Hausdorff pair
agreeing after every `toCompletion i` are equal. -/
theorem completion.hom_ext (P : Pair A) {B : Type v} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsHuberRing B] [T2Space B] {Q : Pair B}
    {φ ψ : Pair.Hom (T.completion P) Q}
    (h : ∀ i, φ.comp (T.toCompletion P i) = ψ.comp (T.toCompletion P i)) : φ = ψ := sorry

/-- A4/completed-tower-pair (instance): `Â_∞` is a complete Hausdorff uniform Tate ring (the Tate
structure is Tau Ceti's `IsTateRing.completion`); its ring of definition is the `ϖ`-adic
completion of `colim_i A_i°`. -/
theorem completion_isTateRing :
    IsTateRing (Uniformization T.colim) ∧
      IsBounded (powerBoundedSubring (Uniformization T.colim) : Set (Uniformization T.colim)) :=
  sorry

end CompletedTower

section CompletedTowerTests

variable (p : ℕ) [Fact p.Prime]

/- For a tower of finite Galois field extensions of `ℚ_p` (exhausting `ℚ̄_p`, as every tower of
fields does), `(Â_∞, Â_∞⁺) ≅ (ℂ_p, 𝒪_{ℂ_p})`. -/
-- test FiniteEtaleTorsorTower.completion_test_Qp (computation) [A4/completed-tower-pair]
example (T : FiniteEtaleTorsorTower ℚ_[p]) (hT : ∀ i, IsField (T.level i)) :
    ∃ e : Uniformization T.colim ≃+* ℂ_[p], IsHomeomorph e ∧
      e '' ((T.completion (Pair.powerBounded ℚ_[p])).plus : Set (Uniformization T.colim)) =
        Metric.closedBall (0 : ℂ_[p]) 1 := sorry

/- For the one-point tower (trivial groups) over a complete uniform pair, the completion is
`(A, A⁺)`. -/
-- test FiniteEtaleTorsorTower.completion_test_trivial (degenerate) [A4/completed-tower-pair]
example {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (P : Pair A)
    (hu : IsBounded (powerBoundedSubring A : Set A)) (T : FiniteEtaleTorsorTower A)
    (hG : ∀ i, Subsingleton (T.G i)) :
    IsHomeomorph (T.completionStructureHom P).toRingHom ∧
      (T.completion P).plus = P.plus.map (T.completionStructureHom P).toRingHom := sorry

/- For a tower of fields over `ℚ_p`, `A_∞ = ℚ̄_p` is not complete and `𝒪_{ℚ̄_p}` is not closed in
`ℂ_p`: the completion step cannot be omitted. -/
-- test FiniteEtaleTorsorTower.completion_test_not_colim (non-example) [A4/completed-tower-pair]
example (T : FiniteEtaleTorsorTower ℚ_[p]) (hT : ∀ i, IsField (T.level i)) :
    ¬ Function.Surjective
        (T.colimPair (Pair.powerBounded ℚ_[p])).toUniformization.toRingHom ∧
      ¬ IsClosed ((T.colimPair (Pair.powerBounded ℚ_[p])).toUniformization.toRingHom ''
        (T.colimPlus (Pair.powerBounded ℚ_[p]) : Set T.colim)) := sorry

/- For a complete non-uniform `A` (e.g. `ℚ_p⟨T⟩[ε]/(ε²)`), the completed tower only sees the
uniformization: nilpotents of `A` vanish in `Â_∞`. -/
-- test FiniteEtaleTorsorTower.completion_test_uniformization (compatibility)
--   [A4/completed-tower-pair]
example {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (P : Pair A) (T : FiniteEtaleTorsorTower A)
    (a : A) (ha : IsNilpotent a) : (T.completionStructureHom P).toRingHom a = 0 := sorry

/- Morphisms `(Â_∞, Â_∞⁺) → (ℂ_p, 𝒪_{ℂ_p})` correspond to compatible families of morphisms
`(A_i, A_i⁺) → (ℂ_p, 𝒪_{ℂ_p})`. -/
-- test FiniteEtaleTorsorTower.completion_test_lift (characterisation) [A4/completed-tower-pair]
example [IsTateRing ℂ_[p]] (T : FiniteEtaleTorsorTower ℚ_[p]) :
    Set.BijOn (fun φ : Pair.Hom (T.completion (Pair.powerBounded ℚ_[p])) (Pair.powerBounded ℂ_[p])
        ↦ fun i ↦ φ.comp (T.toCompletion (Pair.powerBounded ℚ_[p]) i)) Set.univ
      {F | ∀ ⦃i j : T.ι⦄ (h : i ≤ j), (F j).toRingHom.comp (T.transition h).toRingHom =
        (F i).toRingHom} := sorry

end CompletedTowerTests

/-! ## AdicEtaleGeometry:A4/finite-etale-invariance-along-tower (lemma) -/

section Invariance

open Huber

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (T : FiniteEtaleTorsorTower A)

/-- A4/finite-etale-invariance-along-tower (i): base change `FÉt(A_∞) → FÉt(Â_∞)` along the
completion map is an equivalence (essentially surjective and fully faithful); with
`Ring.DirectLimit.finiteEtaleEquivalence` this gives `2-colim FÉt(A_i) ≅ FÉt(Â_∞)`. The proof uses
that `colim_i A_i°` is henselian along `ϖ`. -/
theorem completion_finiteEtale_equivalence (P : Pair A) :
    letI := (T.colimPair P).toUniformization.toRingHom.toAlgebra
    (∀ (T' : Type u) [CommRing T'] [_root_.Algebra (Uniformization T.colim) T']
      [_root_.Algebra.Etale (Uniformization T.colim) T']
      [Module.Finite (Uniformization T.colim) T'],
      ∃ (S : Type u) (_ : CommRing S) (_ : _root_.Algebra T.colim S),
        _root_.Algebra.Etale T.colim S ∧ Module.Finite T.colim S ∧
        Nonempty ((Uniformization T.colim ⊗[T.colim] S) ≃ₐ[Uniformization T.colim] T')) ∧
    ∀ (S₁ S₂ : Type u) [CommRing S₁] [CommRing S₂] [_root_.Algebra T.colim S₁]
      [_root_.Algebra T.colim S₂] [_root_.Algebra.Etale T.colim S₁] [Module.Finite T.colim S₁]
      [_root_.Algebra.Etale T.colim S₂] [Module.Finite T.colim S₂], Function.Bijective
        fun f : S₁ →ₐ[T.colim] S₂ ↦ _root_.Algebra.TensorProduct.map
          (AlgHom.id (Uniformization T.colim) (Uniformization T.colim)) f := sorry

/-- A4/finite-etale-invariance-along-tower (data): `LC(Gᵏ, A_∞) → C⁰(Gᵏ, Â_∞)`, `f ↦ ι ∘ f`. -/
def locallyConstantToContinuousMap (k : ℕ) :
    LocallyConstant (Fin k → T.group) T.colim →+* C(Fin k → T.group, Uniformization T.colim) :=
  sorry

/-- A4/finite-etale-invariance-along-tower (ii): for `k = 1, 2`, every finite étale algebra over
`C⁰(Gᵏ, Â_∞)` is the base change of a finite étale algebra over `LC(Gᵏ, A_∞)`. -/
theorem completion_finiteEtale_equivalence_continuousMap (k : ℕ) (hk : k ≤ 2)
    (T' : Type u) [CommRing T'] [_root_.Algebra C(Fin k → T.group, Uniformization T.colim) T']
    [_root_.Algebra.Etale C(Fin k → T.group, Uniformization T.colim) T']
    [Module.Finite C(Fin k → T.group, Uniformization T.colim) T'] :
    letI := (T.locallyConstantToContinuousMap k).toAlgebra
    ∃ (S : Type u) (_ : CommRing S)
      (_ : _root_.Algebra (LocallyConstant (Fin k → T.group) T.colim) S),
      _root_.Algebra.Etale (LocallyConstant (Fin k → T.group) T.colim) S ∧
      Module.Finite (LocallyConstant (Fin k → T.group) T.colim) S ∧
      Nonempty ((C(Fin k → T.group, Uniformization T.colim) ⊗[
        LocallyConstant (Fin k → T.group) T.colim] S) ≃ₐ[
          C(Fin k → T.group, Uniformization T.colim)] T') := sorry

/-- A4/finite-etale-invariance-along-tower (iii): `Â_∞` has no nonsplit finite étale covers. -/
theorem completion_isFiniteEtaleSplit : IsFiniteEtaleSplit (Uniformization T.colim) := sorry

end Invariance

/-! ## AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower (lemma) -/

section Descent

open Huber

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (T : FiniteEtaleTorsorTower A)

/-- A4/finite-etale-effective-descent-along-tower (essential surjectivity of
`FÉt(A) → FÉt(Â_∞)` with descent data): a finite étale `Â_∞`-algebra `B̂` with a semilinear action
of `G` (extending the action on `Â_∞`, continuous for the natural topology of `B̂`) is
`Â_∞ ⊗[A] B` for a finite étale `A`-algebra `B`, equivariantly. -/
theorem completion_finiteEtale_descent (P : Pair A) (Bh : Type u) [CommRing Bh]
    [_root_.Algebra (Uniformization T.colim) Bh] [_root_.Algebra.Etale (Uniformization T.colim) Bh]
    [Module.Finite (Uniformization T.colim) Bh] [MulSemiringAction T.group Bh] :
    letI := T.completionAction
    letI : _root_.Algebra A (Uniformization T.colim) :=
      (T.completionStructureHom P).toRingHom.toAlgebra
    (∀ (g : T.group) (x : Uniformization T.colim) (b : Bh), g • (x • b) = (g • x) • (g • b)) →
    (letI := moduleTopology (Uniformization T.colim) Bh;
      Continuous fun q : T.group × Bh ↦ q.1 • q.2) →
    ∃ (B : Type u) (_ : CommRing B) (_ : _root_.Algebra A B), _root_.Algebra.Etale A B ∧
      Module.Finite A B ∧ ∃ e : (Uniformization T.colim ⊗[A] B) ≃ₐ[Uniformization T.colim] Bh,
        ∀ (g : T.group) (x : Uniformization T.colim) (b : B), e ((g • x) ⊗ₜ b) = g • e (x ⊗ₜ b) :=
  sorry

end Descent

end FiniteEtaleTorsorTower

/-! ## AdicEtaleGeometry:A4/root-of-monic-in-split-tate-ring (lemma) -/

namespace Huber

section SplitTate

variable {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R] [IsFiniteEtaleSplit R]

/-- A4/root-of-monic-in-split-tate-ring: over a complete Tate ring without nonsplit finite étale
covers, a monic `P ∈ R°[X]` of positive degree with `P'(x) = u (1 - τ)` in `R[X]/(P)`, `u` a unit
of `R` and `τ` topologically nilpotent for the natural topology, has a root in `R`, and every root
of `P` lies in `R°` (ECD proof of Lemma 15.3). -/
theorem exists_root_of_derivative_eq_unit_mul_one_sub {P : R[X]} (hP : P.Monic)
    (hd : 0 < P.natDegree) (hcoeff : ∀ n, P.coeff n ∈ powerBoundedSubring R) (u : Rˣ)
    (τ : AdjoinRoot P)
    (hτ : letI := moduleTopology R (AdjoinRoot P); IsTopologicallyNilpotent τ)
    (hder : AdjoinRoot.mk P (derivative P) = algebraMap R (AdjoinRoot P) (u : R) * (1 - τ)) :
    (∃ r : R, P.IsRoot r) ∧ ∀ r : R, P.IsRoot r → r ∈ powerBoundedSubring R := sorry

/-! ## AdicEtaleGeometry:A4/pseudouniformizer-dividing-p (lemma) -/

/-- A4/pseudouniformizer-dividing-p: if `p` is topologically nilpotent in a complete Tate ring
without nonsplit finite étale covers, there is a pseudouniformizer `ϖ ∈ R°` with `ϖ ^ p ∣ p` in
`R°` and `p / ϖ ^ p` topologically nilpotent (a root of `X^{p^n} - ϖ₀ X - ϖ₀`). -/
theorem exists_isPseudoUniformizer_pow_dvd_p (p : ℕ) [Fact p.Prime]
    (hp : IsTopologicallyNilpotent (p : R)) :
    ∃ ϖ : R, IsPseudoUniformizer ϖ ∧ ϖ ∈ powerBoundedSubring R ∧
      ∃ y ∈ powerBoundedSubring R, (p : R) = ϖ ^ p * y ∧ IsTopologicallyNilpotent y := sorry

/-! ## AdicEtaleGeometry:A4/frobenius-surjective-for-split-tate-ring (lemma) -/

/-- A4/frobenius-surjective-for-split-tate-ring: with `ϖ` as above, every `f ∈ R°` is
`x ^ p - ϖ ^ p * x` for some `x ∈ R°`; hence Frobenius `R°/ϖ → R°/ϖ^p` is surjective. -/
theorem frobenius_surjective_of_isFiniteEtaleSplit (p : ℕ) [Fact p.Prime] {ϖ y : R}
    (hϖ : IsPseudoUniformizer ϖ) (hy : y ∈ powerBoundedSubring R) (hpy : (p : R) = ϖ ^ p * y)
    (hyn : IsTopologicallyNilpotent y) (f : R) (hf : f ∈ powerBoundedSubring R) :
    ∃ x ∈ powerBoundedSubring R, x ^ p - ϖ ^ p * x = f := sorry

/-! ## AdicEtaleGeometry:A4/split-tate-ring-is-perfectoid (lemma) -/

/-- A4/split-tate-ring-is-perfectoid: a complete uniform Tate ring in which `p` is topologically
nilpotent and which has no nonsplit finite étale covers is a perfectoid Tate ring (ECD Definition
3.1; the prelude's stand-in `Perfectoid.IsPerfectoidTateRing` for PerfectoidSpaces P1). -/
theorem isPerfectoid_of_isFiniteEtaleSplit (p : ℕ) [Fact p.Prime]
    (hp : IsTopologicallyNilpotent (p : R)) (hu : IsBounded (powerBoundedSubring R : Set R)) :
    Perfectoid.IsPerfectoidTateRing p R := sorry

end SplitTate

end Huber

/-! ## AdicEtaleGeometry:A4/perfectoid-uniform-completion (theorem) -/

namespace FiniteEtaleTorsorTower

open Huber

/-- A4/perfectoid-uniform-completion: for a complete Tate ring `A` in which `p` is topologically
nilpotent and a finite étale torsor tower over `A`, `Â_∞` is a perfectoid Tate ring (ECD Lemma
15.3, with completeness of `A` added: sourceIssues AdicEtaleGeometry/E401). -/
theorem completion_isPerfectoid {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    (T : FiniteEtaleTorsorTower A) (p : ℕ) [Fact p.Prime] (hp : IsTopologicallyNilpotent (p : A)) :
    Perfectoid.IsPerfectoidTateRing p (Uniformization T.colim) := sorry

end FiniteEtaleTorsorTower

/-! ## AdicEtaleGeometry:A4/torsor-spa-orbits (lemma) -/

namespace ValuationSpectrum

open Huber

/-- A4/torsor-spa-orbits: for a finite étale `G`-torsor `A → B` over a complete Tate ring, with
`B` carrying its natural topology and `B⁺` the integral closure of `A⁺`, the map
`q : Spa(B, B⁺) → Spa(A, A⁺)` is surjective, open and spectral, its fibres are the `G`-orbits
(`(g • y)(b) = y(g⁻¹ b)`), and preimages of rational subsets are rational; hence
`|Spa(B, B⁺)| / G ≅ |Spa(A, A⁺)|`. -/
theorem spaComap_quotientHomeomorph_of_isFiniteEtaleTorsor {G A B : Type u} [Group G] [Finite G]
    [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A]
    [CompleteSpace A] [T2Space A] [CommRing B] [_root_.Algebra A B] [MulSemiringAction G B]
    [SMulCommClass G A B] [Algebra.IsFiniteEtaleTorsor G A B] [TopologicalSpace B]
    [IsModuleTopology A B] [IsTopologicalRing B] [IsTateRing B] (S : Pair A) (T : Pair B)
    (hT : T.plus = (integralClosure (S.plus.map (algebraMap A B)) B).toSubring)
    (q : Pair.Hom S T) (hq : q.toRingHom = algebraMap A B) :
    Function.Surjective q.spaComap ∧ IsOpenMap q.spaComap ∧ IsSpectralMap q.spaComap ∧
      ∀ x y : spa T.plus, q.spaComap x = q.spaComap y ↔
        ∃ g : G, (y : Spv B) = comap (MulSemiringAction.toRingHom G B g⁻¹) x := sorry

end ValuationSpectrum

/-! ## AdicEtaleGeometry:A4/spa-of-completed-tower (lemma) -/

namespace FiniteEtaleTorsorTower

open Huber ValuationSpectrum

section SpaTower

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (T : FiniteEtaleTorsorTower A) (P : Pair A)

/-- A4/spa-of-completed-tower (i): `|Spa(Â_∞, Â_∞⁺)| ≅ lim_i |Spa(A_i, A_i⁺)|`: the maps to the
levels form an embedding onto the compatible families. -/
theorem spa_completion_homeomorph_limit :
    Topology.IsEmbedding (fun x : spa (T.completion P).plus ↦
        fun i ↦ (T.toCompletion P i).spaComap x) ∧
      Set.range (fun x : spa (T.completion P).plus ↦ fun i ↦ (T.toCompletion P i).spaComap x) =
        {y | ∀ ⦃i j : T.ι⦄ (h : i ≤ j), (T.levelPairTransition P h).spaComap (y j) = y i} :=
  sorry

/-- A4/spa-of-completed-tower (ii): `q_∞ : Spa(Â_∞, Â_∞⁺) → Spa(A, A⁺)` is surjective, open and
spectral with fibres the `G`-orbits, so `|Spa(Â_∞, Â_∞⁺)| / G ≅ |Spa(A, A⁺)|`. -/
theorem spa_completion_quotientHomeomorph :
    letI := T.completionAction
    Function.Surjective (T.completionStructureHom P).spaComap ∧
      IsOpenMap (T.completionStructureHom P).spaComap ∧
      IsSpectralMap (T.completionStructureHom P).spaComap ∧
      ∀ x y : spa (T.completion P).plus,
        (T.completionStructureHom P).spaComap x = (T.completionStructureHom P).spaComap y ↔
          ∃ g : T.group, (y : Spv (Uniformization T.colim)) =
            comap (MulSemiringAction.toRingHom T.group (Uniformization T.colim) g⁻¹) x := sorry

end SpaTower

/-! ## AdicEtaleGeometry:A4/completed-tower-self-product (lemma) -/

section SelfProduct

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] (T : FiniteEtaleTorsorTower A) (P : Pair A)

/-- A4/completed-tower-self-product (data): `Â_∞` as an `A`-algebra through the structure
morphism. -/
@[instance_reducible]
def completionAlgebra : _root_.Algebra A (Uniformization T.colim) :=
  (T.completionStructureHom P).toRingHom.toAlgebra

/-- A4/completed-tower-self-product (i): the uniform completed tensor square
`Â_∞ ⊗̂ᵘ_A Â_∞` (AdicSpacesPartII:R0/uniform-completed-tensor-product) is
`(C⁰(G, Â_∞), C⁰(G, Â_∞⁺))`, with `inlᵘ b ↦ (g ↦ b)` and `inrᵘ b ↦ (g ↦ g • b)`. -/
theorem uniformCompletedTensor_completion_equiv
    (hadic : letI := T.completionAlgebra P
      IsAdicHom (algebraMap A (Uniformization T.colim)))
    (hplus : ∀ a ∈ P.plus, (T.completionStructureHom P).toRingHom a ∈ (T.completion P).plus) :
    letI := T.completionAlgebra P
    haveI := hadic
    letI := T.completionAction
    ∃ e : Uniformization (CompletedTensor A (Uniformization T.colim) (Uniformization T.colim)) ≃+*
        C(T.group, Uniformization T.colim), IsHomeomorph e ∧
      (∀ b, e ((Pair.uniformCompletedTensor.inl P (T.completion P) (T.completion P) hplus
        hplus).toRingHom b) = ContinuousMap.const _ b) ∧
      (∀ b g, e ((Pair.uniformCompletedTensor.inr P (T.completion P) (T.completion P) hplus
        hplus).toRingHom b) g = g • b) ∧
      e '' ((Pair.uniformCompletedTensor P (T.completion P) (T.completion P) hplus hplus).plus :
        Set (Uniformization (CompletedTensor A (Uniformization T.colim)
          (Uniformization T.colim)))) =
        {f : C(T.group, Uniformization T.colim) | ∀ g, f g ∈ (T.completion P).plus} := sorry

/-- A4/completed-tower-self-product (ii): if `p` is topologically nilpotent in `A`, each
`C⁰(Gᵏ, Â_∞)` is a perfectoid Tate ring. -/
theorem continuousMap_isPerfectoid (p : ℕ) [Fact p.Prime] (hp : IsTopologicallyNilpotent (p : A))
    (k : ℕ) : Perfectoid.IsPerfectoidTateRing p C(Fin k → T.group, Uniformization T.colim) :=
  sorry

end SelfProduct

end FiniteEtaleTorsorTower

/-! ## AdicEtaleGeometry:A4/perfectoid-cover-presentation (construction) -/

namespace Huber

section Presentation

variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A]

/-- A4/perfectoid-cover-presentation (structure): a *perfectoid torsor presentation* of a complete
Tate pair `(A, A⁺)` (ECD §15): a profinite group `G`, a complete perfectoid Tate pair `(Ã, Ã⁺)`
(stand-in `Perfectoid.IsPerfectoidTateRing` for PerfectoidSpaces P1) with a continuous action of
`G` by pair automorphisms over `(A, A⁺)`, such that (a) `Ã ⊗̂ᵘ_A Ã ≅ (C⁰(G, Ã), C⁰(G, Ã⁺))`,
`b ⊗ b' ↦ (g ↦ b * g • b')` (stand-in `Huber.Pair.uniformCompletedTensor` for
AdicSpacesPartII:R0/uniform-completed-tensor-product), and (b) `Spa(q)` is spectral, surjective
and open with fibres the `G`-orbits. -/
structure PerfectoidTorsorPresentation (p : ℕ) (P : Pair A) where
  /-- The profinite group `G`. -/
  G : ProfiniteGrp.{u}
  /-- The perfectoid ring `Ã`. -/
  Rt : Type u
  /-- The ring structure of `Ã`. -/
  [commRing : CommRing Rt]
  /-- The uniformity of `Ã`. -/
  [uniformSpace : UniformSpace Rt]
  /-- `Ã` is a uniform additive group. -/
  [isUniformAddGroup : IsUniformAddGroup Rt]
  /-- `Ã` is a topological ring. -/
  [isTopologicalRing : IsTopologicalRing Rt]
  /-- `Ã` is a Tate ring. -/
  [isTateRing : IsTateRing Rt]
  /-- `Ã` is complete. -/
  [completeSpace : CompleteSpace Rt]
  /-- `Ã` is Hausdorff. -/
  [t2Space : T2Space Rt]
  /-- The structure map `q : A → Ã`. -/
  [algebra : _root_.Algebra A Rt]
  /-- `q` is adic. -/
  [isAdicHom : IsAdicHom (algebraMap A Rt)]
  /-- `Ã` is a perfectoid Tate ring. -/
  isPerfectoidTateRing : Perfectoid.IsPerfectoidTateRing p Rt
  /-- The plus ring `Ã⁺`. -/
  plus : Pair Rt
  /-- `q` carries `A⁺` into `Ã⁺`. -/
  map_mem_plus : ∀ a ∈ P.plus, algebraMap A Rt a ∈ plus.plus
  /-- The action of `G` on `Ã`. -/
  [action : MulSemiringAction G Rt]
  /-- The action map `G × Ã → Ã` is continuous. -/
  continuous_smul : Continuous fun x : G × Rt ↦ x.1 • x.2
  /-- `G` preserves `Ã⁺`. -/
  smul_mem_plus : ∀ (g : G) (a : Rt), a ∈ plus.plus → g • a ∈ plus.plus
  /-- `q` is `G`-invariant. -/
  smul_algebraMap : ∀ (g : G) (a : A), g • algebraMap A Rt a = algebraMap A Rt a
  /-- (a) The isomorphism `Ã ⊗̂ᵘ_A Ã ≃ C⁰(G, Ã)`. -/
  tensorEquiv : Uniformization (CompletedTensor A Rt Rt) ≃+* C(G, Rt)
  /-- (a) It is a homeomorphism. -/
  isHomeomorph_tensorEquiv : IsHomeomorph tensorEquiv
  /-- (a) `inlᵘ b ↦ (g ↦ b)`. -/
  tensorEquiv_inl : ∀ b : Rt, tensorEquiv
    ((Pair.uniformCompletedTensor.inl P plus plus map_mem_plus map_mem_plus).toRingHom b) =
      ContinuousMap.const G b
  /-- (a) `inrᵘ b ↦ (g ↦ g • b)`. -/
  tensorEquiv_inr : ∀ (b : Rt) (g : G), tensorEquiv
    ((Pair.uniformCompletedTensor.inr P plus plus map_mem_plus map_mem_plus).toRingHom b) g =
      g • b
  /-- (a) The plus rings correspond: `Ã ⊗̂ᵘ_A Ã⁺ ↦ C⁰(G, Ã⁺)`. -/
  tensorEquiv_plus : tensorEquiv ''
    ((Pair.uniformCompletedTensor P plus plus map_mem_plus map_mem_plus).plus :
      Set (Uniformization (CompletedTensor A Rt Rt))) = {f : C(G, Rt) | ∀ g, f g ∈ plus.plus}
  /-- (b) `Spa(q)` is spectral. -/
  isSpectralMap_spaComap : IsSpectralMap
    (⟨algebraMap A Rt, IsAdicHom.continuous _, map_mem_plus⟩ : Pair.Hom P plus).spaComap
  /-- (b) `Spa(q)` is surjective. -/
  surjective_spaComap : Function.Surjective
    (⟨algebraMap A Rt, IsAdicHom.continuous _, map_mem_plus⟩ : Pair.Hom P plus).spaComap
  /-- (b) `Spa(q)` is open. -/
  isOpenMap_spaComap : IsOpenMap
    (⟨algebraMap A Rt, IsAdicHom.continuous _, map_mem_plus⟩ : Pair.Hom P plus).spaComap
  /-- (b) The fibres of `Spa(q)` are the `G`-orbits. -/
  spaComap_eq_iff : ∀ x y : ValuationSpectrum.spa plus.plus,
    (⟨algebraMap A Rt, IsAdicHom.continuous _, map_mem_plus⟩ : Pair.Hom P plus).spaComap x =
      (⟨algebraMap A Rt, IsAdicHom.continuous _, map_mem_plus⟩ : Pair.Hom P plus).spaComap y ↔
      ∃ g : G, (y : Spv Rt) =
        ValuationSpectrum.comap (MulSemiringAction.toRingHom G Rt g⁻¹) x

namespace PerfectoidTorsorPresentation

attribute [instance] commRing uniformSpace isUniformAddGroup isTopologicalRing isTateRing
  completeSpace t2Space algebra isAdicHom action

variable {p : ℕ} {P : Pair A}

/-- A4/perfectoid-cover-presentation (data): the morphism of Huber pairs `q : (A, A⁺) → (Ã, Ã⁺)`. -/
def q (X : PerfectoidTorsorPresentation p P) : Pair.Hom P X.plus :=
  ⟨algebraMap A X.Rt, IsAdicHom.continuous _, X.map_mem_plus⟩

/-- A4/perfectoid-cover-presentation (constructor): the presentation `(lim G_i, Â_∞, Â_∞⁺)` of a
finite étale torsor tower over a complete Tate `ℤ_p`-algebra. -/
def ofTower (T : FiniteEtaleTorsorTower A) (hp : IsTopologicallyNilpotent (p : A)) :
    PerfectoidTorsorPresentation p P := sorry

/-- A4/perfectoid-cover-presentation (other): every complete Tate `ℤ_p`-pair has a perfectoid
torsor presentation (`ofTower` of the canonical tower). -/
theorem «exists» [Fact p.Prime] (hp : IsTopologicallyNilpotent (p : A)) :
    Nonempty (PerfectoidTorsorPresentation p P) := sorry

/-- A4/perfectoid-cover-presentation (instance): `C⁰(G, Ã)` is a Tate ring. -/
instance relation_isTateRing (X : PerfectoidTorsorPresentation p P) :
    IsTateRing C(X.G, X.Rt) := sorry

/-- A4/perfectoid-cover-presentation (constructor): the pair `(C⁰(G, Ã), C⁰(G, Ã⁺))` of the induced
perfectoid equivalence relation `R̃ ⇉ X̃`. -/
def relation (X : PerfectoidTorsorPresentation p P) : Pair C(X.G, X.Rt) := sorry

/-- A4/perfectoid-cover-presentation (data): the source map `s(b) = (g ↦ b)`. -/
def relation.source (X : PerfectoidTorsorPresentation p P) : Pair.Hom X.plus X.relation := sorry

/-- A4/perfectoid-cover-presentation (data): the target map `t(b) = (g ↦ g • b)`. -/
def relation.target (X : PerfectoidTorsorPresentation p P) : Pair.Hom X.plus X.relation := sorry

/-- A4/perfectoid-cover-presentation (other): `C⁰(Gᵏ, Ã)` is perfectoid for every `k`. -/
theorem relation_isPerfectoid (X : PerfectoidTorsorPresentation p P) (k : ℕ) :
    Perfectoid.IsPerfectoidTateRing p C(Fin k → X.G, X.Rt) := sorry

/-- A4/perfectoid-cover-presentation (data): axiom (a), `Ã ⊗̂ᵘ_A Ã ≃ C⁰(G, Ã)`. -/
def uniformCompletedTensorEquiv (X : PerfectoidTorsorPresentation p P) :
    Uniformization (CompletedTensor A X.Rt X.Rt) ≃+* C(X.G, X.Rt) :=
  X.tensorEquiv

/-- A4/perfectoid-cover-presentation (data): `|Spa(Ã, Ã⁺)| / G ≃ₜ |Spa(A, A⁺)|`, the quotient
being by the fibres of `Spa(q)`, which are the `G`-orbits. -/
def spaQuotientHomeomorph (X : PerfectoidTorsorPresentation p P) :
    Quotient (Setoid.ker X.q.spaComap) ≃ₜ ValuationSpectrum.spa P.plus := sorry

/-- A4/perfectoid-cover-presentation (data): `|Spa(C⁰(G, Ã), C⁰(G, Ã⁺))| ≃ₜ G × |Spa(Ã, Ã⁺)|`,
under which `s` and `t` become `(g, x) ↦ x` and `(g, x) ↦ g⁻¹ • x`. -/
def spa_relation_homeomorph (X : PerfectoidTorsorPresentation p P) :
    ValuationSpectrum.spa X.relation.plus ≃ₜ X.G × ValuationSpectrum.spa X.plus.plus := sorry

omit [IsUniformAddGroup A] [CompleteSpace A] [T2Space A] in
/-- A4/perfectoid-cover-presentation (other): `Spa(q)` is a spectral (quasi-compact) map. -/
theorem isSpectralMap_spa (X : PerfectoidTorsorPresentation p P) : IsSpectralMap X.q.spaComap :=
  X.isSpectralMap_spaComap

open scoped Classical in
/-- A4/perfectoid-cover-presentation (compatibility): `Spa(q)⁻¹ R(T/s) = R(q(T)/q(s))`. -/
theorem preimage_rationalSubset (X : PerfectoidTorsorPresentation p P) (T : Finset A) (s : A) :
    X.q.spaComap ⁻¹' (Subtype.val ⁻¹' ValuationSpectrum.rationalSubset P.plus T s) =
      Subtype.val ⁻¹' ValuationSpectrum.rationalSubset X.plus.plus
        (T.image (algebraMap A X.Rt)) (algebraMap A X.Rt s) := sorry

/-- A4/perfectoid-cover-presentation (relation): for `ofTower T`, a finite étale `Ã`-algebra with
a continuous semilinear `G`-action descends to a finite étale `A`-algebra
(AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower). -/
theorem ofTower_finiteEtaleDescent (T : FiniteEtaleTorsorTower A)
    (hp : IsTopologicallyNilpotent (p : A)) (X : PerfectoidTorsorPresentation p P)
    (hX : X = ofTower T hp) (Bh : Type u) [CommRing Bh] [_root_.Algebra X.Rt Bh]
    [_root_.Algebra.Etale X.Rt Bh] [Module.Finite X.Rt Bh] [MulSemiringAction X.G Bh]
    (hsemi : ∀ (g : X.G) (x : X.Rt) (b : Bh), g • (x • b) = (g • x) • (g • b))
    (hcont : letI := moduleTopology X.Rt Bh; Continuous fun q : X.G × Bh ↦ q.1 • q.2) :
    ∃ (B : Type u) (_ : CommRing B) (_ : _root_.Algebra A B), _root_.Algebra.Etale A B ∧
      Module.Finite A B ∧ ∃ e : (X.Rt ⊗[A] B) ≃ₐ[X.Rt] Bh,
        ∀ (g : X.G) (x : X.Rt) (b : B), e ((g • x) ⊗ₜ b) = g • e (x ⊗ₜ b) := sorry

/-- A4/perfectoid-cover-presentation (constructor): the trivial presentation (`G = 1`,
`(Ã, Ã⁺) = (A, A⁺)`) of a perfectoid pair. -/
def ofPerfectoid (hA : Perfectoid.IsPerfectoidTateRing p A) : PerfectoidTorsorPresentation p P :=
  sorry

end PerfectoidTorsorPresentation

end Presentation

section PresentationTests

open PerfectoidTorsorPresentation

variable (p : ℕ) [Fact p.Prime]

/- `(ℚ_p, ℤ_p)` has the presentation `G = Gal(ℚ̄_p/ℚ_p)`, `(Ã, Ã⁺) = (ℂ_p, 𝒪_{ℂ_p})`. -/
-- test PerfectoidTorsorPresentation.test_Qp (computation) [A4/perfectoid-cover-presentation]
example : ∃ X : PerfectoidTorsorPresentation p (Pair.powerBounded ℚ_[p]),
    ∃ e : X.Rt ≃+* ℂ_[p], IsHomeomorph e := sorry

-- test PerfectoidTorsorPresentation.test_perfectoid (degenerate)
--   [A4/perfectoid-cover-presentation]
example {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (P : Pair A)
    (hA : Perfectoid.IsPerfectoidTateRing p A) :
    ∃ X : PerfectoidTorsorPresentation p P, Subsingleton X.G ∧
      Function.Bijective (algebraMap A X.Rt) := sorry

/- For `(ℚ_p, ℤ_p)` with `Ã = ℂ_p`, `|R̃| = G × |X̃| → |X̃| × |X̃|` (a point) is not injective:
`R̃ ⇉ X̃` is not an equivalence relation on underlying sets. -/
-- test PerfectoidTorsorPresentation.test_relation_not_injective (non-example)
--   [A4/perfectoid-cover-presentation]
example (X : PerfectoidTorsorPresentation p (Pair.powerBounded ℚ_[p]))
    (hX : ∃ e : X.Rt ≃+* ℂ_[p], IsHomeomorph e) (hG : Nontrivial X.G) :
    ¬ Function.Injective fun r : ValuationSpectrum.spa X.relation.plus ↦
      ((relation.source X).spaComap r, (relation.target X).spaComap r) := sorry

-- PerfectoidTorsorPresentation.test_pointwise_cover: not stated here; needs disjoint unions of
--   affinoid adic spaces `⊔_x Spa(K(x), K(x)⁺)` (supplier: AdicSpaces Layer 5) and the v-sheaf
--   surjectivity it is contrasted with (supplier: DiamondsAndVStacks:D6) [non-example test]

/- For the completed tower, `Spa(Â_∞) → Spa(A_i)` identifies `|Spa(A_i, A_i⁺)|` with the quotient
of `|X̃|` by `ker(G → G_i)`: its fibres are the orbits of that subgroup. -/
-- test PerfectoidTorsorPresentation.test_finite_level (compatibility)
--   [A4/perfectoid-cover-presentation]
example {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (P : Pair A) (T : FiniteEtaleTorsorTower A)
    (i : T.ι) (x y : ValuationSpectrum.spa (T.completion P).plus) :
    letI := T.completionAction
    (T.toCompletion P i).spaComap x = (T.toCompletion P i).spaComap y ↔
      ∃ g ∈ (T.toLevelGroup i).ker, (y : Spv (Uniformization T.colim)) =
        ValuationSpectrum.comap
          (MulSemiringAction.toRingHom T.group (Uniformization T.colim) g⁻¹) x := sorry

/- A pair and its uniformization have the same presentations. -/
-- test PerfectoidTorsorPresentation.test_nonuniform (compatibility)
--   [A4/perfectoid-cover-presentation]
example {A : Type} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] (P : Pair A) :
    Nonempty (PerfectoidTorsorPresentation p P) ↔
      Nonempty (PerfectoidTorsorPresentation p P.uniformization) := sorry

end PresentationTests

end Huber

/-! ## AdicEtaleGeometry:A4/spd-of-tate-huber-pair-and-perfectoid-torsor (comparison) -/

/-- A4/spd-of-tate-huber-pair-and-perfectoid-torsor: A4's part of ECD Lemmas 15.1–15.3 and
Proposition 15.4: every complete Tate `ℤ_p`-pair has a perfectoid torsor presentation (re-exporting
`Huber.PerfectoidTorsorPresentation.exists`). -/
theorem Huber.Pair.exists_perfectoidTorsorPresentation {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [Huber.IsTateRing A] [CompleteSpace A] [T2Space A]
    (P : Huber.Pair A) (p : ℕ) [Fact p.Prime] (hp : IsTopologicallyNilpotent (p : A)) :
    Nonempty (Huber.PerfectoidTorsorPresentation p P) := sorry

-- Spd(A, A⁺) is a spatial diamond, Spd(Â_∞, Â_∞⁺) → Spd(A, A⁺) is a G-torsor and
--   |Spd(A, A⁺)| = |Spa(A, A⁺)| (ECD Lemmas 15.1–15.2, Proposition 15.4): not stated here; needs
--   v-sheaves, diamonds and Spd (supplier: DiamondsAndVStacks:D6/spd-of-a-tate-pair,
--   DiamondsAndVStacks:D6/spd-is-a-spatial-diamond).

/-! ## AdicEtaleGeometry:A4/diamond-of-analytic-adic-space-and-etale-site-15-6 (comparison) -/

-- Huber.PerfectoidTorsorPresentation.finiteEtaleSiteInput: not stated here; needs the diamond
--   Y^♢ and the finite étale and étale sites of the generalized adic space Spa(A, A⁺) (supplier:
--   DiamondsAndVStacks:D6/etale-site-comparison, AdicEtaleGeometry:A1/finite-etale-site,
--   AdicEtaleGeometry:A1/etale-site). Its analytic inputs (a)–(c) for the affinoid case of ECD
--   Lemma 15.6 are stated above: `Huber.PerfectoidTorsorPresentation.spaQuotientHomeomorph` and
--   `FiniteEtaleTorsorTower.spa_completion_quotientHomeomorph` (a),
--   `FiniteEtaleTorsorTower.completion_finiteEtale_equivalence` and its `_continuousMap` form (b),
--   `FiniteEtaleTorsorTower.completion_finiteEtale_descent` (c).

end TauCeti

end
