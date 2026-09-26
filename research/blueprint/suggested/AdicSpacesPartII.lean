/-
Suggested Lean forms for BP-AdicSpacesPartII (roadmap `AdicSpacesPartII`, "Foundations of adic
spaces, Part II: analytic and formal geometry", layers R0–R5, F0, F1). This file is not the
roadmap and is not exhaustive: the roadmap document is definitive. See the module documentation
after the imports.
-/
import Mathlib.Algebra.Category.Grp.Abelian
import Mathlib.Algebra.Category.Grp.Limits
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Sheaf
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.ShortComplex.Abelian
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.Algebra.MvPolynomial.Supported
import Mathlib.Algebra.Polynomial.Basis
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.IdealSheaf.Basic
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Proper
import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.Analysis.Normed.Ring.Lemmas
import Mathlib.Analysis.Normed.Unbundled.SmoothingSeminorm
import Mathlib.Analysis.Normed.Unbundled.SpectralNorm
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.CategoryTheory.Limits.Lattice
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Sites.SheafCohomology.Cech
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.Contraction
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdicCompletion.Functoriality
import Mathlib.RingTheory.AdicCompletion.Topology
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.FinitePresentation
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Ideal.Over
import Mathlib.RingTheory.Idempotents
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.Jacobson.Ring
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.BaseChange
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Derivative
import Mathlib.RingTheory.MvPowerSeries.GaussNorm
import Mathlib.RingTheory.MvPowerSeries.PiTopology
import Mathlib.RingTheory.MvPowerSeries.Restricted
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Polynomial.ContentIdeal
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.ReesAlgebra
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.RingHom.Etale
import Mathlib.RingTheory.RingHom.FaithfullyFlat
import Mathlib.RingTheory.RingHom.Finite
import Mathlib.RingTheory.RingHom.Flat
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Smooth.StandardSmooth
import Mathlib.RingTheory.Spectrum.Maximal.Basic
import Mathlib.RingTheory.Spectrum.Maximal.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.UniqueFactorizationDomain.Basic
import Mathlib.RingTheory.Unramified.Basic
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.Topology.Algebra.Algebra.Equiv
import Mathlib.Topology.Algebra.GroupCompletion
import Mathlib.Topology.Algebra.LinearTopology
import Mathlib.Topology.Algebra.Module.Complement
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.Topology.Algebra.Nonarchimedean.Basic
import Mathlib.Topology.Algebra.Ring.Ideal
import Mathlib.Topology.Algebra.UniformRing
import Mathlib.Topology.Instances.TrivSqZeroExt
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Maps.Strict.Basic
import Mathlib.Topology.MetricSpace.Ultra.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.ResidueField
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basis
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Basic
import TauCeti.RingTheory.Huber.LocalizationTopology.CompleteSeparated.Basic
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.Padic.Basic
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.StronglyNoetherian
import TauCeti.RingTheory.Huber.TopologicallyFiniteType
import TauCeti.RingTheory.Huber.WeightedEval.Basic
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Complete
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.PairOfDefinition

/-!
# Suggested Lean forms for AdicSpacesPartII

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`AdicSpacesPartII` ("Foundations of adic spaces, Part II: analytic and formal geometry", layers
R0–R5, F0, F1) is definitive. The statements below suggest Lean forms, so that contributors and
reviewers converge on names and signatures. Every proof is `sorry`; a data definition either has a
body built from library material or is `sorry`, and a `Prop`-valued definition always has a real
body. Nothing here claims to be formalised, and every node keeps
`implementationStatus = "unchecked"`.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The file elaborates with `lake env lean` against a
project at exactly these commits, and its only warnings are `declaration uses 'sorry'`.

## Layout

One section per layer (`# Layer …`) in the order R0, R1, F0, R2, R3, R4, R5, F1 (F0 depends on
nothing in this roadmap; R0 and R2 use it), and inside a layer one subsection per packet node, headed
`AdicSpacesPartII:<node id> (<kind>)`. Every declaration's docstring names its node. A unit test
is an `example` preceded by the line `-- test <name> (<kind>) [<node id>]`. Theorems and lemmas of
the layers are stated under the names the roadmap suggests; a few declarations that are not packet
names (a carrier's instances, the bundled base hypothesis `Huber.IsCompleteRankOneBase` of R2,
the affine smoothness hypothesis `FormalScheme.IsSmoothGeomIrredAffine`, the associated points
`IsAssociatedPoint` and the ring-level Fitting ideal `Module.fittingIdeal` of R2's flattening
nodes, `IsCechAcyclic` of R3) support the statements. `Module.fittingIdeal` stands for the Fitting
ideal of the Tau Ceti roadmap StableReduction, Layer 0, which is not in the pinned trees.

## Conventions

* **Names.** Every declaration lives in the namespace `TauCeti`: the packet name `N` is the Lean
  name `TauCeti.N` (`Huber.Pair.completedTensor` is `TauCeti.Huber.Pair.completedTensor`,
  `LinearMap.projectiveTrace` is `TauCeti.LinearMap.projectiveTrace`). Ring-level objects are in
  `TauCeti.Huber`, adic-space geometry in `TauCeti.AdicSpace`, formal geometry in
  `TauCeti.FormalScheme`, adic rings in `TauCeti.IsAdicRing` / `TauCeti.AdicRing`, dagger algebras
  in `TauCeti.Dagger` and dagger spaces in `TauCeti.DaggerSpace`.
* **Huber rings and pairs** are Tau Ceti's: a Huber ring is
  `[CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]` (a Huber ring is
  nonarchimedean by the instance `IsHuberRing.toNonarchimedeanRing`); a Huber pair is
  `TauCeti.Huber.Pair A`, whose only datum is the ring of integral elements `S.plus`; a morphism
  of Huber pairs is `Pair.Hom S T` (a continuous ring map carrying `A⁺` into `B⁺`). Pairs of
  definition are `TauCeti.Huber.PairOfDefinition A` (data, not a proposition).
* **Completeness.** A complete Huber ring carries Mathlib's uniform structure:
  `[UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A]
  [T2Space A]` ("complete" always includes Hausdorff, as in Huber). Where a ring carries only a
  topology (a quotient, an algebraic tensor product with its tensor topology), completeness is for
  the canonical uniformity of the additive group, `IsTopologicalAddGroup.rightUniformSpace`.
* **Completed tensor products.** `B ⊗̂_A C` is `TauCeti.Huber.CompletedTensor A B C`, the
  separated completion of `B ⊗[A] C` for the tensor topology `{Iⁿ·F}`; the Huber pair is
  `Huber.Pair.completedTensor S T U hT hU` for adic structure maps
  (`Huber.IsAdicHom`, a `Prop`-valued class on ring homomorphisms).
* **Tate algebras** `A⟨X₁,…,X_k⟩` are Tau Ceti's `restrictedMvPowerSeriesCompletion k A`;
  "topologically of finite type" is Tau Ceti's `IsTopologicallyFiniteType`; strongly noetherian
  is Tau Ceti's `IsStronglyNoetherian`.
* **Nonarchimedean fields.** A complete nonarchimedean field is
  `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]`, together with
  `[NonarchimedeanRing K]` where a statement needs Tau Ceti's Huber API (Mathlib has no instance
  `IsUltrametricDist K → NonarchimedeanRing K` at the pin).
* **Classical affinoid algebras** (R0, R1). A `K`-affinoid algebra is a commutative `K`-algebra
  `A` with a complete Hausdorff nonarchimedean ring topology for which `algebraMap K A` is
  strictly topologically of finite type (Tau Ceti `IsStrictlyTopologicallyFiniteType`: an open
  continuous surjection `K⟨X₁,…,Xₙ⟩ → A`); `Max A` is Mathlib's `MaximalSpectrum A`, and `|f(x)|`
  is `Huber.Affinoid.evalNorm`, Mathlib's `spectralNorm` on the finite extension `A/x` of `K`.
* **Formal models** (R2) live over `O = O_K`, the valuation ring of a complete rank-one field with
  its `ϖ`-adic topology, bundled as `Huber.IsCompleteRankOneBase O ϖ` together with
  `[IsDomain O] [ValuationRing O] [NonarchimedeanRing O]`.
* **Adic rings** (F0) are `TauCeti.IsAdicRing A`: a topological ring with a finitely generated
  ideal of definition `I` (`IsAdic I`) for which `A` is `I`-adically complete (`IsAdicComplete`).
* **Perfectoid Tate rings.** PerfectoidSpaces P1 is not in either library. As in the suggested file
  for PerfectoidSpaces P8, the one stand-in is `TauCeti.Perfectoid.IsPerfectoidTateRing`, a
  `structure` with real fields (complete, Hausdorff, Tate, uniform, a pseudouniformiser `ϖ` with
  `ϖ ^ p ∣ p` in `A°`, Frobenius surjective on `A° / p`), standing for P1's definition.

## What is not stated

The anchor's category of adic spaces (Tau Ceti roadmap AdicSpaces, Layer 5) and its sheaf theory
(the structure presheaf and sheafiness, Layers 3–4) are not in Tau Ceti at the pin; neither
library has rigid analytic spaces with Tate's G-topology, dagger spaces, formal schemes (Mathlib
has schemes but no formal schemes and no `Spf`), étale or pro-étale sites of adic spaces
(AdicEtaleGeometry A1), perfectoid spaces (PerfectoidSpaces P2), or coherent sheaves and their
cohomology on any of these. Every packet item that needs one of these carriers is a comment of the
form

`-- <name>: not stated here; needs <missing carrier> (supplier: <stage or node id>)`

placed under its node's header, so that every packet name still appears; a unit test in this form
ends with `[<kind> test]`. The supplier is the node of this roadmap that builds the carrier
(e.g. `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`,
`AdicSpacesPartII:R1/rigid-analytic-space`, `AdicSpacesPartII:F1/dagger-space`), or the stage of
another roadmap that does ("AdicSpaces Layer 5" is Tau Ceti's
`AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`, similarly for Layers 0–4). No stand-in
is introduced for any geometric category. Where such a node has a ring-level, affinoid or
scheme-level core that the pinned libraries can state, the core is stated under the packet name
with a suffix (`…_affinoid`, `…_affine`, `…_algebraic`, `…_scheme`, `…_core`) and the comment
says so.
-/

set_option autoImplicit false

/-! # Layer R0. Morphisms and admissible affinoid products -/

noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter

/-! # R0 (part a): Huber rings of noetherian type, adic homomorphisms, completed tensor products
and the affinoid core of fibre products -/

namespace Huber

/-! ## AdicSpacesPartII:R0/noetherian-type-huber-ring (definition) -/

section NoetherianType

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- R0/noetherian-type-huber-ring (structure): a Huber ring is *of noetherian type* if it has a
pair of definition whose ring of definition is noetherian, or it is a strongly noetherian Tate
ring (Huber 1994, hypothesis of Theorem 2.2 and Propositions 3.6–3.8). No completeness and no plus
ring is part of the predicate. -/
class IsNoetherianType : Prop where
  /-- Huber's disjunction: a noetherian ring of definition, or a strongly noetherian Tate ring. -/
  out : (∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) ∨
    (IsTateRing A ∧ IsStronglyNoetherian A)

variable {A}

/-- R0/noetherian-type-huber-ring (constructor): a noetherian ring of definition gives noetherian
type. -/
theorem IsNoetherianType.of_pairOfDefinition (P : PairOfDefinition A)
    (hP : IsNoetherianRing P.ringOfDefinition) : IsNoetherianType A := sorry

/-- R0/noetherian-type-huber-ring (instance): every discrete ring is of noetherian type, through
its prime subring with ideal of definition `0`. -/
instance IsNoetherianType.of_discreteTopology [DiscreteTopology A] : IsNoetherianType A := sorry

/-- R0/noetherian-type-huber-ring (other): invariance under a ring isomorphism that is a
homeomorphism. -/
theorem IsNoetherianType.of_ringEquiv {B : Type*} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsHuberRing B] [IsNoetherianType A] (e : A ≃+* B) (he : Continuous e)
    (he' : Continuous e.symm) : IsNoetherianType B := sorry

end NoetherianType

section NoetherianTypeTate

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- R0/noetherian-type-huber-ring (constructor): a strongly noetherian Tate ring is of noetherian
type. -/
theorem IsNoetherianType.of_isStronglyNoetherian [IsStronglyNoetherian A] :
    IsNoetherianType A := sorry

/-- R0/noetherian-type-huber-ring (characterisation): for a Tate ring, noetherian type is strong
noetherianness (Wedhorn Remark 6.37(3) for `→`). -/
theorem IsNoetherianType.isStronglyNoetherian : IsNoetherianType A ↔ IsStronglyNoetherian A :=
  sorry

end NoetherianTypeTate

section NoetherianTypeComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]

/-- R0/noetherian-type-huber-ring (projection): a complete Hausdorff Tate ring of noetherian type
is a noetherian ring (Tau Ceti `isNoetherianRing_of_isStronglyNoetherian`). -/
theorem IsNoetherianType.isNoetherianRing_of_isTateRing [CompleteSpace A] [T2Space A]
    [IsTateRing A] [IsNoetherianType A] : IsNoetherianRing A := sorry

variable [IsHuberRing A]

/-- R0/noetherian-type-huber-ring (instance): the Hausdorff completion of a ring of noetherian
type is of noetherian type (clause (i) by R0/noetherian-adic-completion, clause (ii) by the
anchor's Layer 4.1 completion invariance of strong noetherianness). -/
instance IsNoetherianType.completion [IsNoetherianType A] :
    IsNoetherianType (Completion A) := sorry

end NoetherianTypeComplete

-- Huber.IsNoetherianType.isStablySheafyRing: not stated here; needs the anchor's structure
--   presheaf on rational subsets and its predicate `Huber.IsStablySheafyRing` (supplier:
--   AdicSpaces Layer 4). Node AdicSpacesPartII:R0/noetherian-type-stably-sheafy below.

-- test isNoetherianType_discrete_polynomial (non-example) [R0/noetherian-type-huber-ring]
example :
    letI : TopologicalSpace (MvPolynomial ℕ ℤ) := ⊥
    haveI : DiscreteTopology (MvPolynomial ℕ ℤ) := ⟨rfl⟩
    ∃ _ : IsHuberRing (MvPolynomial ℕ ℤ),
      IsNoetherianType (MvPolynomial ℕ ℤ) ∧ ¬ IsNoetherianRing (MvPolynomial ℕ ℤ) := sorry

/- `ℤ_p⟦T⟧` with the `(p, T)`-adic topology (Mathlib's `WithIdeal`). -/
-- test isNoetherianType_padicPowerSeries (computation) [R0/noetherian-type-huber-ring]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ∃ _ : IsHuberRing (PowerSeries ℤ_[p]),
      IsNoetherianType (PowerSeries ℤ_[p]) ∧ ¬ ∃ a : PowerSeries ℤ_[p], IsPseudoUniformizer a :=
  sorry

-- not_isNoetherianType_perfectoidDisc: not stated here; needs perfectoid fields `K` and the
--   perfectoid Tate algebra `K⟨T^{1/p^∞}⟩` (supplier: PerfectoidSpaces:P1) [non-example test]

-- test isNoetherianType_iff_isStronglyNoetherian_of_isTateRing (compatibility)
--   [R0/noetherian-type-huber-ring]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A] :
    IsNoetherianType A ↔ IsStronglyNoetherian A := sorry

-- test isNoetherianType_of_subsingleton (degenerate) [R0/noetherian-type-huber-ring]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    [Subsingleton A] : IsNoetherianType A := sorry

/-! ## AdicSpacesPartII:R0/noetherian-adic-completion (lemma) -/

section AdicCompletion

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsNoetherianRing R] {I : Ideal R}

/-- R0/noetherian-adic-completion: the Hausdorff completion of a noetherian ring for an `I`-adic
topology is noetherian (EGA 0_I (7.3.1)). -/
theorem isNoetherianRing_completion_of_isAdic (hI : IsAdic I) :
    IsNoetherianRing (Completion R) := sorry

/-- R0/noetherian-adic-completion: the completion `R̂` is `I·R̂`-adically complete. -/
theorem isAdicComplete_completion_of_isAdic (hI : IsAdic I) :
    IsAdicComplete (I.map (Completion.coeRingHom : R →+* Completion R)) (Completion R) := sorry

end AdicCompletion

/-- R0/noetherian-adic-completion: for a pair of definition `(A₀, I)` with `A₀` noetherian, the
ring of definition `Â₀` of the completion (Tau Ceti `PairOfDefinition.completion`) is
noetherian. -/
theorem PairOfDefinition.isNoetherianRing_completion {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] :
    IsNoetherianRing P.completion.ringOfDefinition := sorry

/-! ## AdicSpacesPartII:R0/adic-ring-homomorphism (definition) -/

section AdicHom

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]

/-- R0/adic-ring-homomorphism (structure): `φ : A → B` is *adic* if there are pairs of definition
`(A₀, I)` of `A` and `(B₀, J)` of `B` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀` (Huber 1994 §3,
Wedhorn Definition 6.23). A class on the ring homomorphism, like Mathlib's `IsLocalHom`. -/
class IsAdicHom (φ : A →+* B) : Prop where
  /-- Pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀`. -/
  exists_pairOfDefinition : ∃ (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition),
    Q.idealOfDefinition = P.idealOfDefinition.map (φ.restrict _ _ h)

/-- R0/adic-ring-homomorphism (projection): an adic homomorphism is continuous. -/
theorem IsAdicHom.continuous (φ : A →+* B) [IsAdicHom φ] : Continuous φ := sorry

/-- R0/adic-ring-homomorphism (functoriality): composites of adic homomorphisms are adic
(Wedhorn 6.26(1)). -/
instance IsAdicHom.comp (φ : A →+* B) (ψ : B →+* C) [IsAdicHom φ] [IsAdicHom ψ] :
    IsAdicHom (ψ.comp φ) := sorry

/-- R0/adic-ring-homomorphism (relation): if `φ`, `ψ` are continuous and `ψ ∘ φ` is adic, then
`ψ` is adic (Wedhorn 6.26(2)). -/
theorem IsAdicHom.of_comp [IsHuberRing A] [IsHuberRing B] [IsHuberRing C] {φ : A →+* B}
    {ψ : B →+* C} (hφ : Continuous φ) (hψ : Continuous ψ) [IsAdicHom (ψ.comp φ)] :
    IsAdicHom ψ := sorry

/-- R0/adic-ring-homomorphism (functoriality): the identity of a Huber ring is adic. -/
instance IsAdicHom.id [IsHuberRing A] : IsAdicHom (RingHom.id A) := sorry

/-- R0/adic-ring-homomorphism (instance): a continuous homomorphism from a Tate ring to a Huber
ring is adic, and its target is Tate (Wedhorn Proposition 6.25). -/
theorem IsAdicHom.of_isTateRing [IsTateRing A] [IsHuberRing B] {φ : A →+* B}
    (hφ : Continuous φ) : IsAdicHom φ ∧ IsTateRing B := sorry

/-- R0/adic-ring-homomorphism (characterisation): pairs of definition `(A₀, I)`, `(B₀, J)` with
`φ(A₀) ⊆ B₀`, `φ(I) ⊆ J` and `√(φ(I)B₀) = √J` witness adicness. -/
theorem IsAdicHom.of_radical_eq {φ : A →+* B} (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h₀ : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition)
    (hI : P.idealOfDefinition.map (φ.restrict _ _ h₀) ≤ Q.idealOfDefinition)
    (hr : (P.idealOfDefinition.map (φ.restrict _ _ h₀)).radical = Q.idealOfDefinition.radical) :
    IsAdicHom φ := sorry

/-- R0/adic-ring-homomorphism (characterisation): out of a discrete ring, a homomorphism to a
Huber ring is adic iff the target is discrete (Wedhorn Example 6.24). -/
theorem IsAdicHom.of_discrete_iff [DiscreteTopology A] [IsHuberRing B] (φ : A →+* B) :
    IsAdicHom φ ↔ DiscreteTopology B := sorry

/-- R0/adic-ring-homomorphism (relation): if `φ` is adic and `π : B → C` is a continuous open
surjection, then `π ∘ φ` is adic. -/
theorem IsAdicHom.comp_isOpenQuotientMap (φ : A →+* B) [IsAdicHom φ] {π : B →+* C}
    (hπ : IsOpenQuotientMap π) : IsAdicHom (π.comp φ) := sorry

/-- R0/adic-ring-homomorphism (example): the structure map `A → A⟨X⟩_T` into a weighted
restricted power-series ring is adic (Tau Ceti `PairOfDefinition.weighted`). -/
theorem isAdicHom_algebraMap_weightedRestrictedSubring [IsHuberRing A] {k : ℕ}
    {T : Fin k → Set A} (hT : IsWeightFamily T) :
    IsAdicHom (algebraMap A (weightedRestrictedSubring T hT)) := sorry

end AdicHom

/-- R0/adic-ring-homomorphism (compatibility): the completion map `A → Â` of a Huber ring is adic
(Tau Ceti `PairOfDefinition.completion`). -/
theorem isAdicHom_completion_coe {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsHuberRing A] :
    IsAdicHom (Completion.coeRingHom : A →+* Completion A) := sorry

/-! ## AdicSpacesPartII:R0/topologically-finite-type-is-adic (lemma) -/

/-- R0/topologically-finite-type-is-adic: a homomorphism topologically of finite type from a
Huber ring to a complete Hausdorff Huber ring is adic (for every pair of definition `(A₀, I)` of
`A`, `π(closure of A₀⟨X⟩_T)` is a ring of definition of `B` with ideal of definition
`φ(I)·B₀`). -/
theorem IsTopologicallyFiniteType.isAdicHom {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsAdicHom φ := sorry

-- test isAdicHom_padicInt_padic (computation) [R0/adic-ring-homomorphism]
example (p : ℕ) [Fact p.Prime] : IsAdicHom (algebraMap ℤ_[p] ℚ_[p]) := sorry

/- The inclusion `ℤ_p → ℤ_p⟦T⟧`, `p`-adic on the source and `(p, T)`-adic on the target, is
continuous and not adic. -/
-- test not_isAdicHom_padicInt_powerSeries (non-example) [R0/adic-ring-homomorphism]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    Continuous (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) ∧
      ¬ IsAdicHom (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) := sorry

/- `ℤ` is discrete and `ℤ_p` is not, so `ℤ → ℤ_p` is continuous and not adic. -/
-- test isAdicHom_of_discrete_iff (characterisation) [R0/adic-ring-homomorphism]
example (p : ℕ) [Fact p.Prime] :
    Continuous (algebraMap ℤ ℤ_[p]) ∧ ¬ IsAdicHom (algebraMap ℤ ℤ_[p]) := sorry

/- Adicness of `A → Â` is witnessed by any pair of definition `P` of `A` together with Tau Ceti's
`P.completion`: `Â₀` contains the image of `A₀` and `Î` is generated by the image of `I`. -/
-- test isAdicHom_completion_coe (compatibility) [R0/adic-ring-homomorphism]
example {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    (P : PairOfDefinition A) :
    ∃ h : ∀ a ∈ P.ringOfDefinition,
        (Completion.coeRingHom : A →+* Completion A) a ∈ P.completion.ringOfDefinition,
      P.completion.idealOfDefinition =
        P.idealOfDefinition.map ((Completion.coeRingHom : A →+* Completion A).restrict _ _ h) :=
  sorry

-- test isAdicHom_id (degenerate) [R0/adic-ring-homomorphism]
example (p : ℕ) [Fact p.Prime] : IsAdicHom (RingHom.id ℚ_[p]) := sorry

/-! ## AdicSpacesPartII:R0/topologically-finite-type-noetherian-type (lemma) -/

section NoetherianTypeTFT

variable {A B : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B]

/-- R0/topologically-finite-type-noetherian-type: a complete Hausdorff Huber ring topologically of
finite type over a complete Hausdorff ring of noetherian type is of noetherian type (Huber 1994
Corollary 3.4(ii),(iii); Wedhorn Proposition 6.35, Remark 6.37(1)). -/
theorem IsNoetherianType.of_isTopologicallyFiniteType [IsNoetherianType A] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsNoetherianType B := sorry

/-! ## AdicSpacesPartII:R0/noetherian-type-ideals-closed (lemma) -/

/-- R0/noetherian-type-ideals-closed: every ideal of a complete Hausdorff ring of noetherian type is
closed. -/
theorem IsNoetherianType.isClosed_ideal [IsNoetherianType A] (J : Ideal A) :
    IsClosed (J : Set A) := sorry

/-- R0/noetherian-type-ideals-closed: the quotient `A ⧸ J` (quotient topology) is of noetherian
type. -/
theorem IsNoetherianType.quotient [IsNoetherianType A] (J : Ideal A) :
    IsNoetherianType (A ⧸ J) := sorry

/-- R0/noetherian-type-ideals-closed: the quotient `A ⧸ J` is Hausdorff and complete for its
canonical uniformity, so the quotient pair `Pair.quotient S J` is a complete Huber pair. -/
theorem IsNoetherianType.completeSpace_quotient [IsNoetherianType A] (J : Ideal A) :
    T2Space (A ⧸ J) ∧
      letI := IsTopologicalAddGroup.rightUniformSpace (A ⧸ J)
      CompleteSpace (A ⧸ J) := sorry

end NoetherianTypeTFT

end Huber

/-! ## AdicSpacesPartII:R0/localization-cech-complex-exact (lemma) -/

section CechLocalization

variable {R : Type*} [CommRing R] {n : ℕ}

/-- R0/localization-cech-complex-exact: the degree-`p` term
`∏_{i₀ < ⋯ < i_p} M_{f_{i₀} ⋯ f_{i_p}}` of the extended alternating Čech complex of the
localisations of `M` at `f₁, …, fₙ`. -/
abbrev cechLocalizationTerm (f : Fin n → R) (M : Type*) [AddCommGroup M] [Module R M]
    (p : ℕ) : Type _ :=
  ∀ i : {i : Fin (p + 1) → Fin n // StrictMono i},
    LocalizedModule (Submonoid.powers (∏ k, f (i.1 k))) M

/-- R0/localization-cech-complex-exact: the augmentation `M → ∏ᵢ M_{fᵢ}`, `m ↦ (m / 1)ᵢ`. -/
def cechLocalizationAugmentation (f : Fin n → R) (M : Type*) [AddCommGroup M] [Module R M] :
    M →ₗ[R] cechLocalizationTerm f M 0 :=
  LinearMap.pi fun i ↦ LocalizedModule.mkLinearMap (Submonoid.powers (∏ k, f (i.1 k))) M

/-- R0/localization-cech-complex-exact: the alternating Čech differential,
`(d s)_{i₀ < ⋯ < i_{p+1}} = ∑ₖ (-1)ᵏ s_{i₀ < ⋯ î_k ⋯ < i_{p+1}}`, each term restricted along the
localisation map `M_{∏_{l ≠ k} f_{i_l}} → M_{∏_l f_{i_l}}`. -/
def cechLocalizationDifferential (f : Fin n → R) (M : Type*) [AddCommGroup M] [Module R M]
    (p : ℕ) : cechLocalizationTerm f M p →ₗ[R] cechLocalizationTerm f M (p + 1) :=
  sorry

/-- R0/localization-cech-complex-exact: if `f₁, …, fₙ` generate the unit ideal, the extended
alternating Čech complex `0 → M → ∏ M_{f_{i₀}} → ∏ M_{f_{i₀} f_{i₁}} → ⋯` is exact. -/
theorem cechComplexLocalization_exact (f : Fin n → R) (M : Type*) [AddCommGroup M]
    [Module R M] (hf : Ideal.span (Set.range f) = ⊤) :
    Function.Injective (cechLocalizationAugmentation f M) ∧
      Function.Exact (cechLocalizationAugmentation f M) (cechLocalizationDifferential f M 0) ∧
      ∀ p, Function.Exact (cechLocalizationDifferential f M p)
        (cechLocalizationDifferential f M (p + 1)) :=
  sorry

end CechLocalization

/-! ## AdicSpacesPartII:R0/strict-complex-completion-exact (lemma) -/

namespace StrictComplex

/-- R0/strict-complex-completion-exact: let `C⁰ → C¹ → ⋯` be a complex of Hausdorff
nonarchimedean abelian groups whose topologies have countable bases of open subgroups, with
continuous differentials. If it is exact and every differential is strict, then the completed
complex `Ĉ⁰ → Ĉ¹ → ⋯` is exact with strict differentials (and injectivity of `d⁰` passes to
the completion). -/
theorem completion_exact {C : ℕ → Type*} [∀ i, AddCommGroup (C i)] [∀ i, UniformSpace (C i)]
    [∀ i, IsUniformAddGroup (C i)] [∀ i, NonarchimedeanAddGroup (C i)] [∀ i, T2Space (C i)]
    [∀ i, (𝓝 (0 : C i)).IsCountablyGenerated] (d : ∀ i, C i →+ C (i + 1))
    (hd : ∀ i, Continuous (d i)) (hexact : ∀ i, Function.Exact (d i) (d (i + 1)))
    (hstrict : ∀ i, IsStrictMap (d i)) :
    (∀ i, Function.Exact ((d i).completion (hd i)) ((d (i + 1)).completion (hd (i + 1)))) ∧
      (∀ i, IsStrictMap ((d i).completion (hd i))) ∧
      (Function.Injective (d 0) → Function.Injective ((d 0).completion (hd 0))) :=
  sorry

end StrictComplex

namespace Huber

/-! ## AdicSpacesPartII:R0/noetherian-rod-module-topology-strict (lemma) -/

section NoetherianRodModule

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- R0/noetherian-rod-module-topology-strict (Huber 1994 Lemma 2.3(i)): over a Huber ring with a
noetherian ring of definition, every `A`-linear map between finitely generated modules with their
natural (module) topologies is strict. Completeness is not assumed. -/
theorem PairOfDefinition.isStrictMap_of_isNoetherianRing (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] {M N : Type*} [AddCommGroup M] [Module A M]
    [Module.Finite A M] [TopologicalSpace M] [IsModuleTopology A M] [AddCommGroup N] [Module A N]
    [Module.Finite A N] [TopologicalSpace N] [IsModuleTopology A N] (u : M →ₗ[A] N) :
    IsStrictMap u := sorry

/-- R0/noetherian-rod-module-topology-strict: for a finitely generated `A₀`-submodule `M₀`
generating `M`, the subgroups `Iⁿ M₀` form a fundamental system of neighbourhoods of `0` for the
module topology. -/
theorem PairOfDefinition.hasBasis_nhds_zero_of_isNoetherianRing (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] {M : Type*} [AddCommGroup M] [Module A M]
    [Module.Finite A M] [TopologicalSpace M] [IsModuleTopology A M]
    (M₀ : Submodule P.ringOfDefinition M) (hfg : M₀.FG)
    (hspan : Submodule.span A (M₀ : Set M) = ⊤) :
    (𝓝 (0 : M)).HasBasis (fun _ : ℕ ↦ True)
      fun n ↦ ((P.idealOfDefinition ^ n • M₀ : Submodule P.ringOfDefinition M) : Set M) :=
  sorry

end NoetherianRodModule

/-! ## AdicSpacesPartII:R0/noetherian-rod-module-complete (lemma) -/

section NoetherianRodModuleComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [UniformSpace M]
  [IsUniformAddGroup M] [IsModuleTopology A M]

/-- R0/noetherian-rod-module-complete (Huber 1994 Lemma 2.3(ii)): over a complete Hausdorff Huber
ring with a noetherian ring of definition, a finitely generated module is complete and Hausdorff
for its natural topology, and all its submodules are closed. -/
theorem PairOfDefinition.completeSpace_isClosed_of_isNoetherianRing (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] [CompleteSpace A] [T2Space A] :
    CompleteSpace M ∧ T2Space M ∧ ∀ M' : Submodule A M, IsClosed (M' : Set M) :=
  sorry

/-- R0/noetherian-rod-module-complete: a finitely generated `A₀`-submodule `M₀` generating `M` is
open and `I`-adically complete. -/
theorem PairOfDefinition.isOpen_isAdicComplete_of_isNoetherianRing (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] [CompleteSpace A] [T2Space A] (M₀ : Submodule P.ringOfDefinition M) (hfg : M₀.FG)
    (hspan : Submodule.span A (M₀ : Set M) = ⊤) :
    IsOpen (M₀ : Set M) ∧ IsAdicComplete P.idealOfDefinition M₀ := sorry

/-! ## AdicSpacesPartII:R0/noetherian-rod-module-completion-tensor (lemma) -/

variable (M) in
/-- R0/noetherian-rod-module-completion-tensor (Huber 1994 Lemma 2.3(iii)): the canonical map
`M ⊗_A Â → M̂` is an isomorphism (of topological modules, for the natural topology of the
source); stated here as an `A`-linear equivalence, pinned down by
`PairOfDefinition.completionTensorEquiv_tmul_one`. -/
def PairOfDefinition.completionTensorEquiv (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] [UniformContinuousConstSMul A M] :
    M ⊗[A] Completion A ≃ₗ[A] Completion M := sorry

/-- R0/noetherian-rod-module-completion-tensor: `completionTensorEquiv (m ⊗ 1) = m`. -/
theorem PairOfDefinition.completionTensorEquiv_tmul_one (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] [UniformContinuousConstSMul A M] (m : M) :
    P.completionTensorEquiv M (m ⊗ₜ 1) = (m : Completion M) := sorry

end NoetherianRodModuleComplete

/-! ## AdicSpacesPartII:R0/open-subring-spec-isomorphism (lemma) -/

section OpenSubring

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  (B : Subring A) (hB : IsOpen (B : Set A))

include hB in
/-- R0/open-subring-spec-isomorphism (Huber 1993 Lemma 3.7), ring-level core: for an open
subring `B` and topologically nilpotent `s ∈ B`, the map `B_s → A_s` is bijective. -/
theorem bijective_localizationAway_of_isOpen (s : B) (hs : IsTopologicallyNilpotent (s : A)) :
    Function.Bijective (IsLocalization.Away.map (Localization.Away s)
      (Localization.Away (B.subtype s)) B.subtype s) := sorry

include hB in
/-- R0/open-subring-spec-isomorphism: a prime of `A` is open iff its contraction to `B` is. -/
theorem isOpen_comap_subtype_iff (p : PrimeSpectrum A) :
    IsOpen ((p.asIdeal.comap B.subtype : Ideal B) : Set B) ↔ IsOpen (p.asIdeal : Set A) := sorry

include hB in
/-- R0/open-subring-spec-isomorphism: the sets `D(s)`, `s ∈ B` topologically nilpotent, cover
the non-open primes of `B`. -/
theorem exists_isTopologicallyNilpotent_notMem_of_not_isOpen (q : PrimeSpectrum B)
    (hq : ¬ IsOpen (q.asIdeal : Set B)) :
    ∃ s : B, IsTopologicallyNilpotent (s : A) ∧ s ∉ q.asIdeal := sorry

end OpenSubring

end Huber

/-! ## AdicSpacesPartII:R0/submodule-blow-up (construction) -/

namespace AlgebraicGeometry

open _root_.AlgebraicGeometry CategoryTheory

universe u

section SubmoduleBlowup

variable (C : Type u) {B : Type u} [CommRing C] [CommRing B] [Algebra C B] (F : Finset B)

/-- R0/submodule-blow-up (data): the ring `R(J) = ⊕ₙ Jⁿ Tⁿ ⊆ B[T]`, generated over the image of
`C` by the `f T`, `f ∈ F`. -/
def submoduleBlowup.reesRing : Subalgebra C (Polynomial B) :=
  Algebra.adjoin C ((fun f ↦ Polynomial.monomial 1 f) '' (F : Set B))

/-- R0/submodule-blow-up (data): the grading `R(J)ₙ = Jⁿ Tⁿ`, `J` the `C`-submodule spanned by
`F` and `J⁰` the image of `C`. -/
def submoduleBlowup.gradedRing (n : ℕ) : Submodule C (submoduleBlowup.reesRing C F) :=
  ((Submodule.span C (F : Set B) ^ n).map
    ((Polynomial.monomial n : B →ₗ[B] Polynomial B).restrictScalars C)).comap
      (submoduleBlowup.reesRing C F).val.toLinearMap

/-- R0/submodule-blow-up (instance): `GradedRing (submoduleBlowup.gradedRing C F)`. -/
instance : GradedRing (submoduleBlowup.gradedRing C F) := sorry

/-- R0/submodule-blow-up (constructor): `Y = Proj R(J)` (Huber 1994 (1.1)). -/
def submoduleBlowup : Scheme := Proj (submoduleBlowup.gradedRing C F)

/-- R0/submodule-blow-up (projection): `g : Y → Spec C`. -/
def submoduleBlowup.toSpec : submoduleBlowup C F ⟶ Spec (CommRingCat.of C) := sorry

variable {F}

/-- R0/submodule-blow-up (projection): `s : Spec B → Y`, from `Proj.fromOfGlobalSections` for the
evaluation `T ↦ 1`. -/
def submoduleBlowup.fromSpec (hF : Ideal.span (F : Set B) = ⊤) : Spec (CommRingCat.of B) ⟶ submoduleBlowup C F := sorry

/-- R0/submodule-blow-up (compatibility): `s ≫ g = Spec φ`. -/
theorem submoduleBlowup.fromSpec_toSpec (hF : Ideal.span (F : Set B) = ⊤) :
    submoduleBlowup.fromSpec C hF ≫ submoduleBlowup.toSpec C F =
      Spec.map (CommRingCat.ofHom (algebraMap C B)) := sorry

/-- R0/submodule-blow-up (characterisation): `s⁻¹(D₊(f T)) = D(f)` for `f ∈ F`. -/
theorem submoduleBlowup.fromSpec_preimage_basicOpen (hF : Ideal.span (F : Set B) = ⊤) (f : B)
    (hf : f ∈ F) :
    submoduleBlowup.fromSpec C hF ⁻¹ᵁ Proj.basicOpen (submoduleBlowup.gradedRing C F)
        ⟨Polynomial.monomial 1 f, Algebra.subset_adjoin ⟨f, hf, rfl⟩⟩ =
      (Spec (CommRingCat.of B)).basicOpen ((Scheme.ΓSpecIso (CommRingCat.of B)).inv f) := sorry

/-- R0/submodule-blow-up (instance): `s` is affine (Huber 1994 (1.2)(i)). -/
instance submoduleBlowup.isAffineHom_fromSpec (hF : Ideal.span (F : Set B) = ⊤) :
    IsAffineHom (submoduleBlowup.fromSpec C hF) := sorry

variable (F)

/-- R0/submodule-blow-up (relation): the `D₊(f T)`, `f ∈ F`, cover `Y`. -/
theorem submoduleBlowup.iSup_basicOpen_eq_top :
    ⨆ f : F, Proj.basicOpen (submoduleBlowup.gradedRing C F)
      ⟨Polynomial.monomial 1 (f : B), Algebra.subset_adjoin ⟨f, f.2, rfl⟩⟩ = ⊤ := sorry

/-- R0/submodule-blow-up (characterisation, Huber 1994 (1.2)(ii)): for nonempty `S ⊆ F` with
product `t`, `D₊(t T^{|S|}) ≅ Spec C[f/f' : f ∈ F, f' ∈ S]`, the subring of `B_t`. -/
def submoduleBlowup.basicOpenIsoSpec (S : Finset B) (hS : S ⊆ F) (hne : S.Nonempty) :
    (Proj.basicOpen (submoduleBlowup.gradedRing C F)
        (∏ g ∈ S.attach, ⟨Polynomial.monomial 1 (g : B),
          Algebra.subset_adjoin ⟨g, hS g.2, rfl⟩⟩)).toScheme ≅
      Spec (CommRingCat.of (Algebra.adjoin C
        ((fun q : B × B ↦ algebraMap B (Localization.Away (∏ g ∈ S, g)) q.1 *
          Ring.inverse (algebraMap B (Localization.Away (∏ g ∈ S, g)) q.2)) ''
            ((F : Set B) ×ˢ (S : Set B))))) := sorry

/-- R0/submodule-blow-up (instance): `g` is proper (indeed projective). -/
instance submoduleBlowup.isProper_toSpec : IsProper (submoduleBlowup.toSpec C F) := sorry

/-- R0/submodule-blow-up: `Y` is noetherian when `C` is. -/
theorem submoduleBlowup.isNoetherian [IsNoetherianRing C] :
    _root_.AlgebraicGeometry.IsNoetherian (submoduleBlowup C F) := sorry

end SubmoduleBlowup

/-- R0/submodule-blow-up (compatibility): for `B = C` and `F` spanning an ideal `𝔞`, `R(J)` is
Mathlib's `reesAlgebra 𝔞`. -/
theorem submoduleBlowup.gradedRing_eq_reesAlgebra {C : Type u} [CommRing C] (F : Finset C) :
    submoduleBlowup.reesRing C F = reesAlgebra (Ideal.span (F : Set C)) := sorry

-- test submoduleBlowup_test_unit (degenerate) [R0/submodule-blow-up]
example {C B : Type u} [CommRing C] [CommRing B] [Algebra C B] :
    IsClosedImmersion (submoduleBlowup.toSpec C ({1} : Finset B)) ∧
      Nonempty (submoduleBlowup C ({1} : Finset B) ≅
        Spec (CommRingCat.of (algebraMap C B).range)) := sorry

-- submoduleBlowup_test_padicLaurent: not stated here; needs `ℤ_p⟨T⟩ ⊆ ℚ_p⟨T⟩` as an algebra
--   between Tau Ceti's completed restricted power-series rings, which no library provides
--   (supplier: AdicSpaces Layer 0) [computation test]

-- test submoduleBlowup_reesAlgebra_compat (compatibility) [R0/submodule-blow-up]
example {C : Type u} [CommRing C] (F : Finset C) :
    submoduleBlowup.reesRing C F = reesAlgebra (Ideal.span (F : Set C)) := sorry

-- test submoduleBlowup_fromSpec_preimage (characterisation) [R0/submodule-blow-up]
example {C B : Type u} [CommRing C] [CommRing B] [Algebra C B] {F : Finset B}
    (hF : Ideal.span (F : Set B) = ⊤) (f : B) (hf : f ∈ F) :
    submoduleBlowup.fromSpec C hF ⁻¹ᵁ Proj.basicOpen (submoduleBlowup.gradedRing C F)
        ⟨Polynomial.monomial 1 f, Algebra.subset_adjoin ⟨f, hf, rfl⟩⟩ =
      (Spec (CommRingCat.of B)).basicOpen ((Scheme.ΓSpecIso (CommRingCat.of B)).inv f) := sorry

/- If `F` does not generate the unit ideal (for `ℤ_p⟨T⟩` and `F = {p, T}`, the prime `(p, T)`
lies in no `D(f)`), no `s` with `s⁻¹(D₊(f T)) = D(f)` exists. -/
-- test submoduleBlowup_test_not_unit_ideal (non-example) [R0/submodule-blow-up]
example {C : Type u} [CommRing C] (F : Finset C) (hF : Ideal.span (F : Set C) ≠ ⊤) :
    ¬ ∃ s : Spec (CommRingCat.of C) ⟶ submoduleBlowup C F, ∀ (f : C) (hf : f ∈ F),
      s ⁻¹ᵁ Proj.basicOpen (submoduleBlowup.gradedRing C F)
          ⟨Polynomial.monomial 1 f, Algebra.subset_adjoin ⟨f, hf, rfl⟩⟩ =
        (Spec (CommRingCat.of C)).basicOpen ((Scheme.ΓSpecIso (CommRingCat.of C)).inv f) :=
  sorry

/-! ## AdicSpacesPartII:R0/submodule-blow-up-isomorphism-away (lemma) -/

/-- R0/submodule-blow-up-isomorphism-away (Huber 1994 (1.2)(iii)): if `Spec φ` is an isomorphism
over `Spec C ∖ V(H)`, so is `g`. -/
theorem submoduleBlowup.isIso_toSpec_restrict {C B : Type u} [CommRing C] [CommRing B]
    [Algebra C B] (F : Finset B) (H : Ideal C)
    (hH : IsIso (Spec.map (CommRingCat.ofHom (algebraMap C B)) ∣_
      ⟨(PrimeSpectrum.zeroLocus (H : Set C))ᶜ,
        (PrimeSpectrum.isClosed_zeroLocus (H : Set C)).isOpen_compl⟩)) :
    IsIso (submoduleBlowup.toSpec C F ∣_
      ⟨(PrimeSpectrum.zeroLocus (H : Set C))ᶜ,
        (PrimeSpectrum.isClosed_zeroLocus (H : Set C)).isOpen_compl⟩) := sorry

end AlgebraicGeometry

namespace Huber

/-! ## AdicSpacesPartII:R0/blow-up-cech-artin-rees (lemma) -/

section NoetherianCech

variable {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  (P : PairOfDefinition B) {n : ℕ} (f : Fin n → B) {M : Type*} [AddCommGroup M] [Module B M]
  (N : Finset M)

/-- R0/blow-up-cech-artin-rees (data): the term `K_i^p ⊆ ∏ M_{f_{i₀}⋯f_{i_p}}` of the Čech
complex of `Iⁱ𝒢` on `submoduleBlowup` (for `i ≥ 1`), computed on the affine opens
`D₊(t T^{p+1})`: at the face with product `t`, the additive span of `a·r·(m/1)` with `a ∈ Iⁱ`,
`r ∈ C[F/S] ⊆ B_t` and `m ∈ N`. -/
def NoetherianCech.filtration (i p : ℕ) : AddSubgroup (cechLocalizationTerm f M p) :=
  AddSubgroup.pi Set.univ fun S ↦ AddSubgroup.closure
    {x | ∃ a ∈ P.idealOfDefinition ^ i,
      ∃ r ∈ Subring.closure
        (algebraMap B (Localization.Away (∏ k, f (S.1 k))) '' (P.ringOfDefinition : Set B) ∪
          Set.range fun q : Fin n × Fin (p + 1) ↦
            algebraMap B (Localization.Away (∏ k, f (S.1 k))) (f q.1) *
              Ring.inverse (algebraMap B (Localization.Away (∏ k, f (S.1 k))) (f (S.1 q.2)))),
      ∃ m ∈ N, x = r • (a : B) • LocalizedModule.mk m 1}

/-- R0/blow-up-cech-artin-rees (Huber 1994 (1.3.1)(i)): for a noetherian ring of definition `C`,
`f` generating the unit ideal and `N` a finite set of generators of the finite `B`-module `M`,
for all `p` and `u ≥ 1` there is `v ≥ u` with `ker(d_v^{p+1}) ⊆ d^p(K_u^p)`. (In degree `-1`
the statement is automatic.) -/
theorem NoetherianCech.ker_le_range [IsNoetherianRing P.ringOfDefinition] [Module.Finite B M]
    (hf : Ideal.span (Set.range f) = ⊤) (hN : Submodule.span B (N : Set M) = ⊤) (p u : ℕ)
    (hu : 1 ≤ u) :
    ∃ v ≥ u, ∀ x ∈ NoetherianCech.filtration P f N v (p + 1),
      cechLocalizationDifferential f M (p + 1) x = 0 →
        ∃ y ∈ NoetherianCech.filtration P f N u p, cechLocalizationDifferential f M p y = x :=
  sorry

end NoetherianCech

/-! ## AdicSpacesPartII:R0/blow-up-cech-filtration-neighbourhoods (lemma) -/

-- Huber.NoetherianCech.hasBasis_nhds_zero: not stated here; needs the natural module topology
--   on `M ⊗_B B(F/S)` over the uncompleted rational localisations `B(F/S)` as Huber rings
--   (supplier: AdicSpaces Layer 3). The filtration is `Huber.NoetherianCech.filtration`.

/-! ## AdicSpacesPartII:R0/noetherian-rod-laurent-cech-strict (lemma) -/

-- Huber.laurentCech_exact_isStrict: not stated here; needs the completed rational localisations
--   `𝒪(U_{i₀…i_p})` of the standard rational covering with their restriction maps (Tau Ceti's
--   `completionLocObj` has none) and the natural topology on `P ⊗_B 𝒪(U)` (supplier: AdicSpaces
--   Layer 3)

/-! ## AdicSpacesPartII:R0/noetherian-rod-sheafy (theorem) -/

-- Huber.isSheafyPair_of_noetherianRingOfDefinition: not stated here; needs the anchor's
--   structure presheaf and `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 3). Clause (a) is
--   `Huber.isSheafyPair_of_noetherianRingOfDefinition_loc`.

/-- R0/noetherian-rod-sheafy, clause (a): if `A` has a noetherian ring of definition, so does
every completed rational localisation `A⟨T/s⟩` (Tau Ceti `completionLocObj`). -/
theorem isSheafyPair_of_noetherianRingOfDefinition_loc {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (P : PairOfDefinition A)
    [IsNoetherianRing P.ringOfDefinition] (T : Finset A) (s : A) (S : Type*) [CommRing S]
    [Algebra A S] [IsLocalization.Away s S] (hden : P.HasDenominatorPower T s S) :
    ∃ Q : PairOfDefinition (P.completionLocObj T s S hden), IsNoetherianRing Q.ringOfDefinition :=
  sorry

/-! ## AdicSpacesPartII:R0/discrete-huber-pair-sheafy (lemma) -/

-- Huber.isSheafyPair_of_discreteTopology: not stated here; needs the anchor's structure presheaf
--   and `Huber.IsSheafyPair` (supplier: AdicSpaces Layer 3). The ring-level core of clause (b) is
--   `Huber.isSheafyPair_of_discreteTopology_span` with R0/localization-cech-complex-exact.

open ValuationSpectrum in
/-- R0/discrete-huber-pair-sheafy, core of clause (b): for a discrete ring, if rational subsets
`R(T_j/s_j)` cover `R(T/s)`, then the `s_j` generate the unit ideal of `A_s` (the trivial
valuations with support `𝔭 ∌ s` lie in `R(T/s)`), so the Čech complex of the `M_s`-localisations
is exact by `cechComplexLocalization_exact`. -/
theorem isSheafyPair_of_discreteTopology_span {A : Type*} [CommRing A] [TopologicalSpace A]
    [DiscreteTopology A] (Aplus : Subring A) (T : Finset A) (s : A) {m : ℕ}
    (Tj : Fin m → Finset A) (sj : Fin m → A)
    (hcov : rationalSubset Aplus T s ⊆ ⋃ j, rationalSubset Aplus (Tj j) (sj j)) :
    Ideal.span (Set.range fun j ↦ algebraMap A (Localization.Away s) (sj j)) = ⊤ := sorry


/-! ## AdicSpacesPartII:R0/noetherian-type-stably-sheafy (lemma) -/

-- Huber.IsNoetherianType.isStablySheafyRing (R0/noetherian-type-stably-sheafy): not stated
--   here; needs the anchor's structure presheaf `𝒪` on `Spa(B, B⁺)` and `IsStablySheafyRing`
--   (supplier: AdicSpaces Layer 4). Its ring-level input, that every complete `B` topologically
--   of finite type over `A` is again of noetherian type, is
--   `Huber.IsNoetherianType.of_isTopologicallyFiniteType`.

/-! ## AdicSpacesPartII:R0/completed-tensor-product (construction) -/

section CompletedTensor

variable (A B C : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [Algebra A B] [Algebra A C]

/-- R0/completed-tensor-product (data): the group topology on `B ⊗[A] C` for which `{Iⁿ·F}` is a
fundamental system of neighbourhoods of `0`, `F` the image of `B₀ ⊗_{A₀} C₀` and `(A₀, I)` a pair
of definition of `A` with `algebraMap` adic into rings of definition `B₀`, `C₀`. It does not
depend on these choices when both structure maps are adic; the construction is only used then. -/
@[instance_reducible]
def tensorTopology : TopologicalSpace (B ⊗[A] C) := sorry

/-- R0/completed-tensor-product: `tensorTopology` is a ring topology. -/
theorem isTopologicalRing_tensorTopology :
    @IsTopologicalRing (B ⊗[A] C) (tensorTopology A B C) _ := sorry

/-- R0/completed-tensor-product: the canonical uniformity of `tensorTopology`. -/
@[instance_reducible]
def tensorUniformSpace : UniformSpace (B ⊗[A] C) :=
  letI := tensorTopology A B C
  haveI := isTopologicalRing_tensorTopology A B C
  IsTopologicalAddGroup.rightUniformSpace (B ⊗[A] C)

/-- R0/completed-tensor-product (data): the carrier `B ⊗̂_A C`, the Hausdorff completion of
`B ⊗[A] C` for `tensorTopology`. -/
def CompletedTensor : Type _ :=
  @Completion (B ⊗[A] C) (tensorUniformSpace A B C)

/-- R0/completed-tensor-product (instance): `UniformSpace (CompletedTensor A B C)`. -/
instance : UniformSpace (CompletedTensor A B C) :=
  @Completion.uniformSpace (B ⊗[A] C) (tensorUniformSpace A B C)

/-- R0/completed-tensor-product (instance): `CommRing (CompletedTensor A B C)`. -/
instance : CommRing (CompletedTensor A B C) :=
  letI := tensorUniformSpace A B C
  haveI : IsTopologicalRing (B ⊗[A] C) := isTopologicalRing_tensorTopology A B C
  haveI : IsUniformAddGroup (B ⊗[A] C) := isUniformAddGroup_of_addCommGroup
  Completion.commRing (B ⊗[A] C)

/-- R0/completed-tensor-product (instance): `IsUniformAddGroup (CompletedTensor A B C)`. -/
instance : IsUniformAddGroup (CompletedTensor A B C) := sorry

/-- R0/completed-tensor-product (instance): `IsTopologicalRing (CompletedTensor A B C)`. -/
instance : IsTopologicalRing (CompletedTensor A B C) := sorry

/-- R0/completed-tensor-product (instance): `CompleteSpace (CompletedTensor A B C)`. -/
instance : CompleteSpace (CompletedTensor A B C) :=
  @Completion.completeSpace (B ⊗[A] C) (tensorUniformSpace A B C)

/-- R0/completed-tensor-product (instance): `T2Space (CompletedTensor A B C)`. -/
instance : T2Space (CompletedTensor A B C) :=
  letI := tensorUniformSpace A B C
  inferInstanceAs (T2Space (Completion (B ⊗[A] C)))

/-- R0/completed-tensor-product (data): the ring homomorphism `B ⊗[A] C → B ⊗̂_A C` out of
Mathlib's algebraic tensor product. -/
def Pair.completedTensor.tmul : B ⊗[A] C →+* CompletedTensor A B C := sorry

/-- R0/completed-tensor-product (instance): `Algebra A (CompletedTensor A B C)`. -/
instance : Algebra A (CompletedTensor A B C) :=
  ((Pair.completedTensor.tmul A B C).comp (algebraMap A (B ⊗[A] C))).toAlgebra

/-- R0/completed-tensor-product (characterisation): `tmul` has dense range, and its kernel is the
closure of `0` in `B ⊗[A] C`. -/
theorem Pair.completedTensor.denseRange_tmul :
    DenseRange (Pair.completedTensor.tmul A B C) ∧
      (RingHom.ker (Pair.completedTensor.tmul A B C) : Set (B ⊗[A] C)) =
        @closure _ (tensorTopology A B C) {0} := sorry

/-- R0/completed-tensor-product (structure): when both structure maps are adic, the pair of
definition of `B ⊗̂_A C`: the closure of the image of `B₀ ⊗ C₀`, with the ideal generated by the
image of `I`. -/
def Pair.completedTensor.pairOfDefinition [IsAdicHom (algebraMap A B)]
    [IsAdicHom (algebraMap A C)] : PairOfDefinition (CompletedTensor A B C) := sorry

/-- R0/completed-tensor-product (instance): `IsHuberRing (CompletedTensor A B C)`. -/
instance [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] :
    IsHuberRing (CompletedTensor A B C) :=
  ⟨⟨Pair.completedTensor.pairOfDefinition A B C⟩⟩

variable {A B C} [IsHuberRing A] [IsHuberRing B] [IsHuberRing C] [IsAdicHom (algebraMap A B)]
  [IsAdicHom (algebraMap A C)]

/-- R0/completed-tensor-product (constructor): the completed tensor product of Huber pairs
`B ⊗̂_A C` along adic morphisms of Huber pairs `(A, A⁺) → (B, B⁺)`, `(A, A⁺) → (C, C⁺)` (the
`algebraMap`s, carrying `A⁺` into `B⁺` and `C⁺`). Its plus ring is the closure of the image of the
integral closure of the subring generated by `B⁺ ⊗ 1` and `1 ⊗ C⁺` (Huber 1994, proof of
Lemma 3.9(i)); no uniformisation is performed. -/
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

/-- R0/completed-tensor-product (projection): the morphism of Huber pairs `(B, B⁺) → B ⊗̂_A C`,
`b ↦ b ⊗ 1`. -/
def Pair.completedTensor.inl : Pair.Hom T (Pair.completedTensor S T U hT hU) where
  toRingHom := (Pair.completedTensor.tmul A B C).comp Algebra.TensorProduct.includeLeftRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- R0/completed-tensor-product (projection): the morphism of Huber pairs `(C, C⁺) → B ⊗̂_A C`,
`c ↦ 1 ⊗ c`. -/
def Pair.completedTensor.inr : Pair.Hom U (Pair.completedTensor S T U hT hU) where
  toRingHom := (Pair.completedTensor.tmul A B C).comp
    (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- R0/completed-tensor-product (data): `tmul (b ⊗ₜ c) = inl b * inr c`. -/
@[simp]
theorem Pair.completedTensor.tmul_tmul (b : B) (c : C) :
    Pair.completedTensor.tmul A B C (b ⊗ₜ c) =
      (Pair.completedTensor.inl S T U hT hU).toRingHom b *
        (Pair.completedTensor.inr S T U hT hU).toRingHom c := sorry

/-- R0/completed-tensor-product (relation): `inl ∘ f = inr ∘ g` as morphisms of Huber pairs, `f`
and `g` being the structure maps. -/
theorem Pair.completedTensor.inl_comp :
    (Pair.completedTensor.inl S T U hT hU).comp
        ⟨algebraMap A B, IsAdicHom.continuous (algebraMap A B), hT⟩ =
      (Pair.completedTensor.inr S T U hT hU).comp
        ⟨algebraMap A C, IsAdicHom.continuous (algebraMap A C), hU⟩ := sorry

/-- R0/completed-tensor-product (other): `inl` and `inr` are adic. -/
theorem Pair.completedTensor.isAdicHom_inl :
    IsAdicHom (Pair.completedTensor.inl S T U hT hU).toRingHom ∧
      IsAdicHom (Pair.completedTensor.inr S T U hT hU).toRingHom := sorry

/-- R0/completed-tensor-product (characterisation): the plus ring is the closure of the image of
the integral closure of the image of `B⁺ ⊗_{A⁺} C⁺`; it contains every `inl b * inr c` with
`b ∈ B⁺`, `c ∈ C⁺`. -/
theorem Pair.completedTensor.plus_eq :
    (Pair.completedTensor S T U hT hU).plus =
      ((integralClosure
          ↥(T.plus.map (Algebra.TensorProduct.includeLeftRingHom (R := A) (B := C)) ⊔
            U.plus.map (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom :
              Subring (B ⊗[A] C))
          (B ⊗[A] C)).toSubring.map (Pair.completedTensor.tmul A B C)).topologicalClosure :=
  sorry

/-- R0/completed-tensor-product (instance): `B ⊗̂_A C` is Tate if `B` or `C` is. -/
theorem Pair.completedTensor.isTateRing (h : IsTateRing B ∨ IsTateRing C) :
    IsTateRing (CompletedTensor A B C) := sorry

section Lift

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [NonarchimedeanRing R]
  [CompleteSpace R] [T2Space R]

/-- R0/completed-tensor-product (universal-property): the continuous homomorphism
`B ⊗̂_A C → R` induced by continuous `φ : B → R`, `ψ : C → R` with `φ ∘ f = ψ ∘ g`, into a
complete Hausdorff nonarchimedean ring (R0/completed-tensor-product-universal-property). -/
def Pair.completedTensor.lift (φ : B →+* R) (ψ : C →+* R) (hφ : Continuous φ)
    (hψ : Continuous ψ) (h : φ.comp (algebraMap A B) = ψ.comp (algebraMap A C)) :
    CompletedTensor A B C →+* R := sorry

/-- R0/completed-tensor-product (universal-property): `lift φ ψ ∘ inl = φ` and
`lift φ ψ ∘ inr = ψ`. -/
theorem Pair.completedTensor.lift_comp_inl (φ : B →+* R) (ψ : C →+* R) (hφ : Continuous φ)
    (hψ : Continuous ψ) (h : φ.comp (algebraMap A B) = ψ.comp (algebraMap A C)) :
    (Pair.completedTensor.lift φ ψ hφ hψ h).comp (Pair.completedTensor.inl S T U hT hU).toRingHom =
        φ ∧
      (Pair.completedTensor.lift φ ψ hφ hψ h).comp
          (Pair.completedTensor.inr S T U hT hU).toRingHom = ψ := sorry

/-- R0/completed-tensor-product (universal-property): `lift` is continuous. -/
theorem Pair.completedTensor.continuous_lift (φ : B →+* R) (ψ : C →+* R) (hφ : Continuous φ)
    (hψ : Continuous ψ) (h : φ.comp (algebraMap A B) = ψ.comp (algebraMap A C)) :
    Continuous (Pair.completedTensor.lift φ ψ hφ hψ h) := sorry

end Lift

/-- R0/completed-tensor-product (extensionality): two continuous homomorphisms out of `B ⊗̂_A C`
into a Hausdorff ring agreeing after `inl` and after `inr` are equal. -/
theorem Pair.completedTensor.hom_ext {R : Type*} [CommRing R] [TopologicalSpace R] [T2Space R]
    {χ₁ χ₂ : CompletedTensor A B C →+* R} (h₁ : Continuous χ₁) (h₂ : Continuous χ₂)
    (hl : χ₁.comp (Pair.completedTensor.inl S T U hT hU).toRingHom =
      χ₂.comp (Pair.completedTensor.inl S T U hT hU).toRingHom)
    (hr : χ₁.comp (Pair.completedTensor.inr S T U hT hU).toRingHom =
      χ₂.comp (Pair.completedTensor.inr S T U hT hU).toRingHom) : χ₁ = χ₂ := sorry

variable {S T U hT hU} in
/-- R0/completed-tensor-product (functoriality): morphisms of pairs `(B, B⁺) → (B', B'⁺)` and
`(C, C⁺) → (C', C'⁺)` over `(A, A⁺) → (A', A'⁺)`, all structure maps adic, induce
`B ⊗̂_A C → B' ⊗̂_{A'} C'`. -/
def Pair.completedTensor.map {A' B' C' : Type*} [CommRing A'] [TopologicalSpace A']
    [IsTopologicalRing A'] [IsHuberRing A'] [CommRing B'] [TopologicalSpace B']
    [IsTopologicalRing B'] [IsHuberRing B'] [CommRing C'] [TopologicalSpace C']
    [IsTopologicalRing C'] [IsHuberRing C'] [Algebra A' B'] [Algebra A' C']
    [IsAdicHom (algebraMap A' B')] [IsAdicHom (algebraMap A' C')] {S' : Pair A'} {T' : Pair B'}
    {U' : Pair C'} (hT' : ∀ a ∈ S'.plus, algebraMap A' B' a ∈ T'.plus)
    (hU' : ∀ a ∈ S'.plus, algebraMap A' C' a ∈ U'.plus) (e : Pair.Hom S S') (f : Pair.Hom T T')
    (g : Pair.Hom U U')
    (hf : f.toRingHom.comp (algebraMap A B) = (algebraMap A' B').comp e.toRingHom)
    (hg : g.toRingHom.comp (algebraMap A C) = (algebraMap A' C').comp e.toRingHom) :
    Pair.Hom (Pair.completedTensor S T U hT hU) (Pair.completedTensor S' T' U' hT' hU') := sorry

variable (A B C) in
/-- R0/completed-tensor-product (equivalence): `B ⊗̂_A C ≅ C ⊗̂_A B`, exchanging `inl` and
`inr`. -/
def Pair.completedTensor.comm : CompletedTensor A B C ≃A[A] CompletedTensor A C B := sorry

variable (B) in
/-- R0/completed-tensor-product (equivalence): transitivity of base change, for adic
`A → C → C'`: `(B ⊗̂_A C) ⊗̂_C C' ≅ B ⊗̂_A C'`, where `B ⊗̂_A C` is a `C`-algebra through `inr`. -/
def Pair.completedTensor.cancelBaseChange (C' : Type*) [CommRing C'] [TopologicalSpace C']
    [IsTopologicalRing C'] [Algebra C C'] [Algebra A C'] [IsScalarTower A C C']
    [IsAdicHom (algebraMap C C')] :
    letI : Algebra C (CompletedTensor A B C) := ((Pair.completedTensor.tmul A B C).comp
      (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom).toAlgebra
    CompletedTensor C (CompletedTensor A B C) C' ≃+* CompletedTensor A B C' := sorry

end CompletedTensor

/- `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ ≅ ℚ_p⟨T, S⟩`. -/
-- test completedTensor_test_polydisc (computation) [R0/completed-tensor-product]
example (p : ℕ) [Fact p.Prime] :
    Nonempty (CompletedTensor ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ≃A[ℚ_[p]]
        restrictedMvPowerSeriesCompletion 2 ℚ_[p]) := sorry

-- completedTensor_test_plus_not_image: not stated here; needs `ℚ_p(√p)` with its ring of
--   integers as a complete Huber pair, which no library packages (supplier: AdicSpaces Layer 0)
--   [non-example test]

/- For `A = ℤ_p`, `B = ℤ_p⟦X⟧` (`(p, X)`-adic) and `C = ℚ_p`, `A → B` is not adic, and no
Huber-ring topology on `B ⊗_A C` makes both maps continuous with `B` open in it. -/
-- test completedTensor_test_not_adic (non-example) [R0/completed-tensor-product]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ¬ IsAdicHom (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) ∧
      ¬ ∃ (t : TopologicalSpace (PowerSeries ℤ_[p] ⊗[ℤ_[p]] ℚ_[p]))
          (ht : @IsTopologicalRing _ t _), @IsHuberRing _ _ t ht ∧
        Continuous[_, t] (Algebra.TensorProduct.includeLeftRingHom (R := ℤ_[p]) (B := ℚ_[p])) ∧
        Continuous[_, t] (Algebra.TensorProduct.includeRight (R := ℤ_[p])
          (A := PowerSeries ℤ_[p])) ∧
        IsOpen[t] (Set.range (Algebra.TensorProduct.includeLeftRingHom (R := ℤ_[p])
          (B := ℚ_[p]))) := sorry

-- test completedTensor_test_unit (degenerate) [R0/completed-tensor-product]
example {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
    [CompleteSpace B] [T2Space B] [Algebra A B] [IsAdicHom (algebraMap A B)] :
    Nonempty (CompletedTensor A B A ≃A[A] B) := sorry

-- completedTensor_test_banach: not stated here; needs the product seminorm on `B ⊗_A C` of
--   Banach rings (Kedlaya–Liu Definition 2.1.10), in no library (supplier:
--   AdicSpacesPartII:R0/completed-tensor-product) [compatibility test]

-- test completedTensor_test_algebraic (compatibility) [R0/completed-tensor-product]
example {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
    [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
    [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] :
    DenseRange (Pair.completedTensor.tmul A B C) ∧
      (RingHom.ker (Pair.completedTensor.tmul A B C) : Set (B ⊗[A] C)) =
        @closure _ (tensorTopology A B C) {0} := sorry

-- Huber.Pair.completedTensor_adicRing: not stated here; the completed tensor product of adic
--   rings is F0's (AdicSpacesPartII:F0/completed-tensor-product-adic), declared later in this
--   file. The statement is a ring isomorphism `Huber.CompletedTensor A B C ≃+* B ⊗̂[A] C` over
--   `B` and `C` for adic rings A, B, C with adic structure maps, identifying the plus rings with
--   the whole rings (supplier: AdicSpacesPartII:F0/completed-tensor-product-adic).

/-! ## AdicSpacesPartII:R0/completed-tensor-product-universal-property (theorem) -/

section UniversalProperty

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
  (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- R0/completed-tensor-product-universal-property: for a complete Hausdorff nonarchimedean ring
`R` with a closed subring `R⁺` integrally closed in `R`, and continuous `φ : B → R`, `ψ : C → R`
with `φ(B⁺) ⊆ R⁺`, `ψ(C⁺) ⊆ R⁺`, `φ ∘ f = ψ ∘ g`, there is exactly one continuous `χ` on
`B ⊗̂_A C` with `χ(D⁺) ⊆ R⁺`, `χ ∘ inl = φ`, `χ ∘ inr = ψ`. No adicness of `φ`, `ψ` is needed. -/
theorem Pair.completedTensor.existsUnique_lift {R : Type*} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [NonarchimedeanRing R] [CompleteSpace R] [T2Space R] (Rplus : Subring R)
    (hRc : IsClosed (Rplus : Set R)) [IsIntegrallyClosedIn Rplus R] (φ : B →+* R) (ψ : C →+* R)
    (hφ : Continuous φ) (hψ : Continuous ψ) (hφp : ∀ b ∈ T.plus, φ b ∈ Rplus)
    (hψp : ∀ c ∈ U.plus, ψ c ∈ Rplus) (h : φ.comp (algebraMap A B) = ψ.comp (algebraMap A C)) :
    ∃! χ : CompletedTensor A B C →+* R, Continuous χ ∧
      (∀ d ∈ (Pair.completedTensor S T U hT hU).plus, χ d ∈ Rplus) ∧
      χ.comp (Pair.completedTensor.inl S T U hT hU).toRingHom = φ ∧
      χ.comp (Pair.completedTensor.inr S T U hT hU).toRingHom = ψ := sorry

/-- R0/completed-tensor-product-universal-property: if moreover `R` is a Huber ring and `φ` is
adic, the induced homomorphism is adic. -/
theorem Pair.completedTensor.isAdicHom_lift {R : Type*} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsHuberRing R] [CompleteSpace R] [T2Space R] (φ : B →+* R) (ψ : C →+* R)
    (hφ : Continuous φ) (hψ : Continuous ψ) (h : φ.comp (algebraMap A B) = ψ.comp (algebraMap A C))
    [IsAdicHom φ] : IsAdicHom (Pair.completedTensor.lift φ ψ hφ hψ h) := sorry

end UniversalProperty

/-! ## AdicSpacesPartII:R0/completed-tensor-restricted-power-series (lemma) -/

section RestrictedPowerSeries

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B] [Algebra A B]
  [IsAdicHom (algebraMap A B)]

/-- R0/completed-tensor-restricted-power-series (a): along an adic homomorphism, the image of a
weight family of finite sets is a weight family. -/
theorem IsAdicHom.isWeightFamily_image {n : ℕ} {M : Fin n → Set A} (hMf : ∀ i, (M i).Finite)
    (hM : IsWeightFamily M) : IsWeightFamily fun i ↦ algebraMap A B '' M i := sorry

/-- R0/completed-tensor-restricted-power-series (b): `A⟨X⟩_M ⊗̂_A B ≅ B⟨X⟩_{λ(M)}`, induced by
`X_i ↦ X_i` and the structure map of `B` (Huber 1994 Lemma 3.5). -/
def Pair.completedTensorRestrictedEquiv {n : ℕ} (M : Fin n → Set A) (hMf : ∀ i, (M i).Finite)
    (hM : IsWeightFamily M) :
    CompletedTensor A (Completion (weightedRestrictedSubring M hM)) B ≃+*
      Completion (weightedRestrictedSubring (fun i ↦ algebraMap A B '' M i)
        (IsAdicHom.isWeightFamily_image hMf hM)) := sorry

/-- R0/completed-tensor-restricted-power-series (consequence of (c)): if `A → C` is topologically
of finite type into a complete Hausdorff Huber ring, then `B → C ⊗̂_A B` is topologically of finite
type. -/
theorem Pair.completedTensor.isTopologicallyFiniteType_inr {C : Type*} [CommRing C]
    [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C]
    [T2Space C] [Algebra A C] (hC : IsTopologicallyFiniteType (algebraMap A C)) :
    IsTopologicallyFiniteType ((Pair.completedTensor.tmul A C B).comp
      (Algebra.TensorProduct.includeRight (R := A) (A := C)).toRingHom) := sorry

end RestrictedPowerSeries

/-! ## AdicSpacesPartII:R0/completed-tensor-noetherian-stability (lemma) -/

/-- R0/completed-tensor-noetherian-stability: for complete Hausdorff `A`, `B`, `C`, `A → B` adic,
`A → C` topologically of finite type and `B` of noetherian type, `inl : B → B ⊗̂_A C` is
topologically of finite type and `B ⊗̂_A C` is of noetherian type (hence stably sheafy by
R0/noetherian-type-stably-sheafy, which needs the anchor's Layer 4). -/
theorem Pair.completedTensor.isNoetherianType {A B C : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A]
    [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
    [CompleteSpace B] [T2Space B] [CommRing C] [UniformSpace C] [IsUniformAddGroup C]
    [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C] [Algebra A B]
    [Algebra A C] [IsAdicHom (algebraMap A B)] [IsNoetherianType B]
    (hμ : IsTopologicallyFiniteType (algebraMap A C)) :
    haveI : IsAdicHom (algebraMap A C) := IsTopologicallyFiniteType.isAdicHom hμ
    IsTopologicallyFiniteType
        ((Pair.completedTensor.tmul A B C).comp Algebra.TensorProduct.includeLeftRingHom) ∧
      IsNoetherianType (CompletedTensor A B C) := sorry

/-! ## AdicSpacesPartII:R0/completed-tensor-rational-localisation (lemma) -/

section RationalLocalisation

open ValuationSpectrum

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
  [CompleteSpace B] [T2Space B] [CommRing C] [UniformSpace C] [IsUniformAddGroup C]
  [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C] [Algebra A B]
  [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]

open scoped Classical in
/-- R0/completed-tensor-rational-localisation, part (1): for rational subsets `R(T₁/s₁)` of
`Spa B` and `R(T₂/s₂)` of `Spa C` (`T_i` generating open ideals), the intersection of their
preimages in `Spa(B ⊗̂_A C)` is the rational subset
`R(inl(T₁ ∪ {s₁})·inr(T₂ ∪ {s₂}) / inl(s₁)·inr(s₂))`. -/
theorem Pair.completedTensorRationalEquiv_preimage (S : Pair A) (T : Pair B) (U : Pair C)
    (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus) (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)
    (T₁ : Finset B) (s₁ : B) (T₂ : Finset C) (s₂ : C)
    (hT₁ : IsOpen (Ideal.span (T₁ : Set B) : Set B))
    (hT₂ : IsOpen (Ideal.span (T₂ : Set C) : Set C)) :
    (Pair.completedTensor.inl S T U hT hU).spaComap ⁻¹'
          (Subtype.val ⁻¹' rationalSubset T.plus T₁ s₁) ∩
        (Pair.completedTensor.inr S T U hT hU).spaComap ⁻¹'
          (Subtype.val ⁻¹' rationalSubset U.plus T₂ s₂) =
      Subtype.val ⁻¹' rationalSubset (Pair.completedTensor S T U hT hU).plus
        (Finset.image₂ (· * ·)
          ((insert s₁ T₁).image (Pair.completedTensor.inl S T U hT hU).toRingHom)
          ((insert s₂ T₂).image (Pair.completedTensor.inr S T U hT hU).toRingHom))
        ((Pair.completedTensor.inl S T U hT hU).toRingHom s₁ *
          (Pair.completedTensor.inr S T U hT hU).toRingHom s₂) := sorry

end RationalLocalisation

-- Huber.Pair.completedTensorRationalEquiv: not stated here; needs the rational localisations
--   `O(U) = B⟨T/s⟩` as complete Huber pairs with their plus rings and the maps `O(W) → O(U)`
--   (supplier: AdicSpaces Layer 3). Its set-level part (1) is
--   `Huber.Pair.completedTensorRationalEquiv_preimage`.

/-! ## AdicSpacesPartII:R0/tate-ring-norm (definition) -/

section TateNorm

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- R0/tate-ring-norm (structure): a norm datum `d = (A₀, ϖ, r)` on a Tate ring: a pair of
definition with ring of definition `A₀`, a pseudouniformiser `ϖ ∈ A₀` and `0 < r < 1`. (A norm
datum exists exactly when `A` is Tate.) -/
structure TateNormDatum where
  /-- The pair of definition whose ring of definition is `A₀`. -/
  pair : PairOfDefinition A
  /-- The pseudouniformiser `ϖ`, a unit of `A`. -/
  ϖ : Aˣ
  /-- `ϖ` is a topologically nilpotent unit. -/
  isPseudoUniformizer : IsPseudoUniformizer (ϖ : A)
  /-- `ϖ ∈ A₀`. -/
  mem_ringOfDefinition : (ϖ : A) ∈ pair.ringOfDefinition
  /-- The base `r` of the norm. -/
  r : ℝ
  /-- `0 < r`. -/
  r_pos : 0 < r
  /-- `r < 1`. -/
  r_lt_one : r < 1

variable {A} (d : TateNormDatum A)

/-- R0/tate-ring-norm (constructor): the nonarchimedean ring seminorm
`α_d x = inf {rⁿ : n ∈ ℤ, ϖ⁻ⁿ x ∈ A₀}` (Kedlaya–Liu Remark 2.4.4). -/
def tateNorm : RingSeminorm A where
  toFun x := sInf ((fun n : ℤ ↦ d.r ^ n) ''
    {n : ℤ | ((d.ϖ ^ (-n) : Aˣ) : A) * x ∈ d.pair.ringOfDefinition})
  map_zero' := sorry
  add_le' := sorry
  neg' := sorry
  mul_le' := sorry

/-- R0/tate-ring-norm (characterisation): the defining formula. -/
theorem tateNorm_apply (x : A) : tateNorm d x =
    sInf ((fun n : ℤ ↦ d.r ^ n) ''
      {n : ℤ | ((d.ϖ ^ (-n) : Aˣ) : A) * x ∈ d.pair.ringOfDefinition}) := sorry

/-- R0/tate-ring-norm (structure): `α_d` is nonarchimedean. -/
theorem isNonarchimedean_tateNorm : IsNonarchimedean (tateNorm d) := sorry

/-- R0/tate-ring-norm (simp): `α_d 1 ≤ 1`. -/
theorem tateNorm_one_le : tateNorm d 1 ≤ 1 := sorry

/-- R0/tate-ring-norm (simp): `α_d (ϖ x) = r α_d x` and `α_d (ϖ⁻¹ x) = r⁻¹ α_d x`. -/
theorem tateNorm_pseudoUniformizer_mul (x : A) :
    tateNorm d ((d.ϖ : A) * x) = d.r * tateNorm d x ∧
      tateNorm d (((d.ϖ⁻¹ : Aˣ) : A) * x) = d.r⁻¹ * tateNorm d x := sorry

/-- R0/tate-ring-norm (characterisation): `α_d x ≤ rⁿ ↔ x ∈ ϖⁿ A₀`. -/
theorem tateNorm_le_zpow_iff (n : ℤ) (x : A) :
    tateNorm d x ≤ d.r ^ n ↔ ((d.ϖ ^ (-n) : Aˣ) : A) * x ∈ d.pair.ringOfDefinition := sorry

/-- R0/tate-ring-norm (compatibility): `α_d` defines the topology of `A`. -/
theorem tateNorm_hasBasis_nhds_zero :
    (𝓝 (0 : A)).HasBasis (fun ε : ℝ ↦ 0 < ε) fun ε ↦ {x | tateNorm d x < ε} := sorry

/-- R0/tate-ring-norm (characterisation): `α_d x = 0` iff `x ∈ closure {0}`. -/
theorem tateNorm_eq_zero_iff (x : A) : tateNorm d x = 0 ↔ x ∈ closure ({0} : Set A) := sorry

/-- R0/tate-ring-norm (equivalence): data differing only in the ring of definition give
equivalent norms. -/
theorem tateNorm_equiv_of_ringOfDefinition (d' : TateNormDatum A) (hϖ : d.ϖ = d'.ϖ)
    (hr : d.r = d'.r) :
    ∃ k : ℕ, ∀ x, tateNorm d' x ≤ d.r ^ (-(k : ℤ)) * tateNorm d x ∧
      tateNorm d x ≤ d.r ^ (-(k : ℤ)) * tateNorm d' x := sorry

/-- R0/tate-ring-norm (relation): changing `r` to `r'` raises `α_d` to the power
`log r' / log r`. -/
theorem tateNorm_rpow (d' : TateNormDatum A) (hP : d.pair = d'.pair) (hϖ : d.ϖ = d'.ϖ) (x : A) :
    tateNorm d' x = tateNorm d x ^ (Real.log d'.r / Real.log d.r) := sorry

/-- R0/tate-ring-norm (functoriality): a continuous homomorphism with `φ(A₀) ⊆ B₀` and the data
`(B₀, φ(ϖ), r)` on `B` does not increase the norm. -/
theorem tateNorm_map_le {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    (d' : TateNormDatum B) (φ : A →+* B) (hφ : Continuous φ) (hϖ : (d'.ϖ : B) = φ d.ϖ)
    (hr : d'.r = d.r) (h₀ : ∀ a ∈ d.pair.ringOfDefinition, φ a ∈ d'.pair.ringOfDefinition)
    (x : A) : tateNorm d' (φ x) ≤ tateNorm d x := sorry

end TateNorm

/- `ℚ_p` with `A₀ = ℤ_p`, `ϖ = p`, `r = 1/p`: `α_d` is the `p`-adic norm. -/
-- test tateNorm_padic (computation) [R0/tate-ring-norm]
example (p : ℕ) [Fact p.Prime] (d : TateNormDatum ℚ_[p])
    (h₀ : (d.pair.ringOfDefinition : Set ℚ_[p]) = {x | ‖x‖ ≤ 1}) (hϖ : (d.ϖ : ℚ_[p]) = p)
    (hr : d.r = (p : ℝ)⁻¹) (x : ℚ_[p]) : tateNorm d x = ‖x‖ := sorry

/- `ℚ_p` with `A₀ = ℤ_p`, `ϖ = p²`, `r = 1/p`: `α_d(p) = 1`, `α_d(p²) = 1/p`. -/
-- test tateNorm_not_multiplicative (non-example) [R0/tate-ring-norm]
example (p : ℕ) [Fact p.Prime] (d : TateNormDatum ℚ_[p])
    (h₀ : (d.pair.ringOfDefinition : Set ℚ_[p]) = {x | ‖x‖ ≤ 1}) (hϖ : (d.ϖ : ℚ_[p]) = p ^ 2)
    (hr : d.r = (p : ℝ)⁻¹) :
    tateNorm d (p : ℚ_[p]) = 1 ∧ tateNorm d ((p : ℚ_[p]) ^ 2) = (p : ℝ)⁻¹ := sorry

-- test tateNorm_zero_ring (degenerate) [R0/tate-ring-norm]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [Subsingleton A]
    (d : TateNormDatum A) (x : A) : tateNorm d x = 0 := sorry

-- test tateNorm_banachAlgebra (compatibility) [R0/tate-ring-norm]
example {K A : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] (d : TateNormDatum A) (ϖ : K)
    (hϖ : (d.ϖ : A) = algebraMap K A ϖ)
    (h₀ : (d.pair.ringOfDefinition : Set A) = Metric.closedBall 0 1) (hr : d.r = ‖ϖ‖) (x : A)
    (hx : x ≠ 0) : ‖x‖ ≤ tateNorm d x ∧ tateNorm d x < d.r⁻¹ * ‖x‖ := sorry

/- `ℚ_p⟨T⟩` (Tau Ceti's restricted power series, `ℚ_p` being complete) with
`A₀ = ℤ_p⟨T⟩`, `ϖ ∈ ℤ_p`, `r = |ϖ|`. -/
-- test tateNorm_le_pow_iff_tateAlgebra (characterisation) [R0/tate-ring-norm]
example (p : ℕ) [Fact p.Prime]
    (d : TateNormDatum (weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight)) (ϖ : ℚ_[p])
    (hϖ : (d.ϖ : weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight) = algebraMap ℚ_[p] _ ϖ)
    (h₀ : ∀ f, f ∈ d.pair.ringOfDefinition ↔
      ∀ m, ‖MvPowerSeries.coeff m (f : MvPowerSeries (Fin 1) ℚ_[p])‖ ≤ 1)
    (hr : d.r = ‖ϖ‖) (n : ℕ) (f) :
    tateNorm d f ≤ d.r ^ (n : ℤ) ↔
      ∀ m, ‖MvPowerSeries.coeff m (f : MvPowerSeries (Fin 1) ℚ_[p])‖ ≤ ‖ϖ‖ ^ n := sorry

/-! ## AdicSpacesPartII:R0/spectral-seminorm (definition) -/

section SpectralSeminorm

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (d : TateNormDatum A)

/-- R0/spectral-seminorm (constructor): `|x|_sp = lim α_d(xⁿ)^{1/n}`, Mathlib's
`smoothingSeminorm` of `α_d` (Kedlaya–Liu Definition 2.1.9). -/
def spectralSeminorm : RingSeminorm A :=
  smoothingSeminorm (tateNorm d) (tateNorm_one_le d) (isNonarchimedean_tateNorm d)

/-- R0/spectral-seminorm (characterisation): `|x|_sp = lim α_d(xⁿ)^{1/n}`. -/
theorem spectralSeminorm_apply (x : A) :
    Tendsto (fun n : ℕ ↦ tateNorm d (x ^ n) ^ (1 / (n : ℝ))) atTop (𝓝 (spectralSeminorm d x)) :=
  sorry

/-- R0/spectral-seminorm (compatibility): the definition through Mathlib's `smoothingSeminorm`. -/
theorem spectralSeminorm_eq_smoothingSeminorm :
    spectralSeminorm d =
      smoothingSeminorm (tateNorm d) (tateNorm_one_le d) (isNonarchimedean_tateNorm d) := sorry

/-- R0/spectral-seminorm (structure): `|·|_sp` is power-multiplicative. -/
theorem isPowMul_spectralSeminorm : IsPowMul (spectralSeminorm d) := sorry

/-- R0/spectral-seminorm (relation): `|x|_sp ≤ α_d x`. -/
theorem spectralSeminorm_le_tateNorm (x : A) : spectralSeminorm d x ≤ tateNorm d x := sorry

/-- R0/spectral-seminorm (equivalence): independent of the ring of definition. -/
theorem spectralSeminorm_eq_of_ringOfDefinition (d' : TateNormDatum A) (hϖ : d.ϖ = d'.ϖ)
    (hr : d.r = d'.r) : spectralSeminorm d = spectralSeminorm d' := sorry

/-- R0/spectral-seminorm (relation): changing `r` to `r'` raises `|·|_sp` to the power
`log r' / log r`. -/
theorem spectralSeminorm_rpow (d' : TateNormDatum A) (hP : d.pair = d'.pair) (hϖ : d.ϖ = d'.ϖ)
    (x : A) : spectralSeminorm d' x = spectralSeminorm d x ^ (Real.log d'.r / Real.log d.r) :=
  sorry

/-- R0/spectral-seminorm (characterisation): `|x|_sp < 1` iff `x` is topologically nilpotent. -/
theorem spectralSeminorm_lt_one_iff (x : A) :
    spectralSeminorm d x < 1 ↔ IsTopologicallyNilpotent x := sorry

/-- R0/spectral-seminorm (relation): power-bounded elements have `|x|_sp ≤ 1`. -/
theorem spectralSeminorm_le_one_of_isPowerBounded {x : A}
    (hx : IsPowerBounded x) : spectralSeminorm d x ≤ 1 := sorry

/-- R0/spectral-seminorm (characterisation): `|x|_sp = 0` iff every `ϖ⁻ⁿ x` is topologically
nilpotent. -/
theorem spectralSeminorm_eq_zero_iff (x : A) : spectralSeminorm d x = 0 ↔
    ∀ n : ℕ, IsTopologicallyNilpotent (((d.ϖ ^ (-(n : ℤ)) : Aˣ) : A) * x) := sorry

/-- R0/spectral-seminorm (simp): `|1|_sp = 1` on a Hausdorff nonzero ring. -/
theorem spectralSeminorm_one [T2Space A] [Nontrivial A] : spectralSeminorm d 1 = 1 := sorry

/-- R0/spectral-seminorm (functoriality): `|φ x|_sp ≤ |x|_sp` for the data `(B₀, φ(ϖ), r)`. -/
theorem spectralSeminorm_map_le {B : Type*} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] (d' : TateNormDatum B) (φ : A →+* B) (hφ : Continuous φ)
    (hϖ : (d'.ϖ : B) = φ d.ϖ) (hr : d'.r = d.r)
    (h₀ : ∀ a ∈ d.pair.ringOfDefinition, φ a ∈ d'.pair.ringOfDefinition) (x : A) :
    spectralSeminorm d' (φ x) ≤ spectralSeminorm d x := sorry

end SpectralSeminorm

/-- R0/spectral-seminorm (compatibility): on a finite extension `L` of a complete nonarchimedean
field `K`, for the unit-ball datum with `ϖ ∈ K` and `r = |ϖ|`, `|·|_sp` is Mathlib's
`spectralNorm K L`. -/
theorem spectralSeminorm_eq_spectralNorm {K L : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [NormedField L] [NormedAlgebra K L]
    [FiniteDimensional K L] (d : TateNormDatum L) (ϖ : K) (hϖ : (d.ϖ : L) = algebraMap K L ϖ)
    (h₀ : (d.pair.ringOfDefinition : Set L) = Metric.closedBall 0 1) (hr : d.r = ‖ϖ‖) (x : L) :
    spectralSeminorm d x = spectralNorm K L x := sorry

/- `ℚ_p⟨T⟩` with `A₀ = ℤ_p⟨T⟩`, `ϖ ∈ ℤ_p`, `r = |ϖ|`: the spectral seminorm is the Gauss norm. -/
-- test spectralSeminorm_tateAlgebra (computation) [R0/spectral-seminorm]
example (p : ℕ) [Fact p.Prime]
    (d : TateNormDatum (weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight)) (ϖ : ℚ_[p])
    (hϖ : (d.ϖ : weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight) = algebraMap ℚ_[p] _ ϖ)
    (h₀ : ∀ f, f ∈ d.pair.ringOfDefinition ↔
      ∀ m, ‖MvPowerSeries.coeff m (f : MvPowerSeries (Fin 1) ℚ_[p])‖ ≤ 1)
    (hr : d.r = ‖ϖ‖) (f) :
    spectralSeminorm d f = ⨆ m, ‖MvPowerSeries.coeff m (f : MvPowerSeries (Fin 1) ℚ_[p])‖ :=
  sorry

/- `ℚ_p[ε]/(ε²)` (Mathlib's `DualNumber`) with `A₀ = ℤ_p ⊕ ℤ_p ε`: `|ε|_sp = 0` but
`α_d(ε) = 1`. -/
-- test spectralSeminorm_dualNumbers (non-example) [R0/spectral-seminorm]
example (p : ℕ) [Fact p.Prime] (d : TateNormDatum (DualNumber ℚ_[p]))
    (h₀ : (d.pair.ringOfDefinition : Set (DualNumber ℚ_[p])) =
      {x | ‖TrivSqZeroExt.fst x‖ ≤ 1 ∧ ‖TrivSqZeroExt.snd x‖ ≤ 1})
    (hϖ : (d.ϖ : DualNumber ℚ_[p]) = TrivSqZeroExt.inl (p : ℚ_[p])) (hr : d.r = (p : ℝ)⁻¹) :
    spectralSeminorm d DualNumber.eps = 0 ∧ tateNorm d DualNumber.eps = 1 := sorry

-- test spectralSeminorm_eq_spectralNorm (compatibility) [R0/spectral-seminorm]
example {K L : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedField L] [NormedAlgebra K L] [FiniteDimensional K L] (d : TateNormDatum L) (ϖ : K)
    (hϖ : (d.ϖ : L) = algebraMap K L ϖ)
    (h₀ : (d.pair.ringOfDefinition : Set L) = Metric.closedBall 0 1) (hr : d.r = ‖ϖ‖) :
    ⇑(spectralSeminorm d) = spectralNorm K L := sorry

/- In `ℚ_p⟨T⟩`: `|pT|_sp < 1` and `pT` is topologically nilpotent, while `|T|_sp = 1` and `T` is
power-bounded and not topologically nilpotent. -/
-- test spectralSeminorm_lt_one_iff_test (characterisation) [R0/spectral-seminorm]
example (p : ℕ) [Fact p.Prime]
    (d : TateNormDatum (weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight)) :
    let X := weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) isWeightFamily_one_weight 0
    spectralSeminorm d ((p : _) * X) < 1 ∧ IsTopologicallyNilpotent ((p : _) * X) ∧
      spectralSeminorm d X = 1 ∧ IsPowerBounded X ∧ ¬ IsTopologicallyNilpotent X := sorry

-- test spectralSeminorm_zero_ring (degenerate) [R0/spectral-seminorm]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [Subsingleton A]
    (d : TateNormDatum A) (x : A) : spectralSeminorm d x = 0 := sorry

/-! ## AdicSpacesPartII:R0/spectral-topology (definition) -/

/-- R0/spectral-topology (constructor): the type synonym `A_sp` of `A`, carrying the topology of
the spectral seminorm, whose neighbourhoods of `0` are the `ϖⁿ·A°°`. -/
def SpectralTop (A : Type*) : Type _ := A

section SpectralTop

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- R0/spectral-topology (instance): `CommRing (SpectralTop A)`. -/
instance : CommRing (SpectralTop A) := inferInstanceAs (CommRing A)

/-- R0/spectral-topology (data): the canonical uniformity of the spectral topology. -/
instance : UniformSpace (SpectralTop A) := sorry

/-- R0/spectral-topology (instance): `IsUniformAddGroup (SpectralTop A)`. -/
instance : IsUniformAddGroup (SpectralTop A) := sorry

/-- R0/spectral-topology (instance): `IsTopologicalRing (SpectralTop A)`. -/
instance : IsTopologicalRing (SpectralTop A) := sorry

/-- R0/spectral-topology: the identity `A ≃+* A_sp`. -/
def toSpectralTop : A ≃+* SpectralTop A := RingEquiv.refl A

/-- R0/spectral-topology (characterisation): for a pseudouniformiser `ϖ`, the `ϖⁿ A°°` form a
basis of neighbourhoods of `0` in `A_sp`. -/
theorem SpectralTop.hasBasis_nhds_zero {ϖ : A} (hϖ : IsPseudoUniformizer ϖ) :
    (𝓝 (0 : SpectralTop A)).HasBasis (fun _ : ℕ ↦ True)
      fun n ↦ toSpectralTop '' ((fun x ↦ ϖ ^ n * x) '' {x : A | IsTopologicallyNilpotent x}) :=
  sorry

/-- R0/spectral-topology (compatibility): the topology of `A_sp` is that of `spectralSeminorm d`,
for every norm datum `d`. -/
theorem SpectralTop.nhds_zero_eq_seminorm (d : TateNormDatum A) :
    (𝓝 (0 : SpectralTop A)).HasBasis (fun ε : ℝ ↦ 0 < ε)
      fun ε ↦ toSpectralTop '' {x | spectralSeminorm d x < ε} := sorry

/-- R0/spectral-topology (projection): `A → A_sp` is continuous. -/
theorem SpectralTop.continuous_toSpectralTop :
    Continuous (toSpectralTop : A ≃+* SpectralTop A) := sorry

/-- R0/spectral-topology (instance): `A_sp` is a Tate ring. -/
instance SpectralTop.isTateRing : IsTateRing (SpectralTop A) := sorry

/-- R0/spectral-topology (structure): the pair of definition `({|x|_sp ≤ 1}, ϖ·{|x|_sp ≤ 1})`. -/
def SpectralTop.pairOfDefinition (d : TateNormDatum A) : PairOfDefinition (SpectralTop A) := sorry

/-- R0/spectral-topology (simp): topologically nilpotent elements agree. -/
@[simp]
theorem SpectralTop.isTopologicallyNilpotent_iff (x : A) :
    IsTopologicallyNilpotent (toSpectralTop x) ↔ IsTopologicallyNilpotent x := sorry

/-- R0/spectral-topology (characterisation): `(A_sp)° = {|x|_sp ≤ 1}`. -/
theorem SpectralTop.powerBoundedSubring_eq (d : TateNormDatum A) :
    (powerBoundedSubring (SpectralTop A) : Set (SpectralTop A)) =
      toSpectralTop '' {x | spectralSeminorm d x ≤ 1} := sorry

/-- R0/spectral-topology (instance): `(A_sp)°` is bounded, that is, `A_sp` is uniform. -/
theorem SpectralTop.isBounded_powerBoundedSubring :
    IsBounded (powerBoundedSubring (SpectralTop A) : Set (SpectralTop A)) := sorry

/-- R0/spectral-topology (constructor): `(A, A⁺)` gives the Huber pair `(A_sp, A⁺)`. -/
def SpectralTop.pair (S : Pair A) : Pair (SpectralTop A) := sorry

/-- R0/spectral-topology: the morphism of Huber pairs `(A, A⁺) → (A_sp, A⁺)`. -/
def SpectralTop.toPairHom (S : Pair A) : Pair.Hom S (SpectralTop.pair S) := sorry

/-- R0/spectral-topology (functoriality): a continuous homomorphism of Tate rings is continuous
on spectral topologies. -/
def SpectralTop.map {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsTateRing B] (φ : A →+* B) (hφ : Continuous φ) : SpectralTop A →+* SpectralTop B := sorry

/-- R0/spectral-topology (functoriality): `SpectralTop.map` is continuous. -/
theorem SpectralTop.continuous_map {B : Type*} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsTateRing B] (φ : A →+* B) (hφ : Continuous φ) :
    Continuous (SpectralTop.map φ hφ) := sorry

/-- R0/spectral-topology (equivalence): `A → A_sp` is a homeomorphism iff `A°` is bounded. -/
theorem SpectralTop.homeomorph_of_isBounded :
    IsBounded (powerBoundedSubring A : Set A) ↔
      IsHomeomorph (toSpectralTop : A ≃+* SpectralTop A) := sorry

/-! ## AdicSpacesPartII:R0/spectral-topology-cont-eq (lemma) -/

/-- R0/spectral-topology-cont-eq: a valuation is continuous for the topology of `A` iff it is
continuous for the spectral topology. -/
theorem SpectralTop.cont_eq :
    ValuationSpectrum.comap (toSpectralTop : A ≃+* SpectralTop A).symm.toRingHom ⁻¹'
      ValuationSpectrum.cont (SpectralTop A) = ValuationSpectrum.cont A := sorry

/-- R0/spectral-topology-cont-eq: consequently `Spa(A_sp, A⁺) = Spa(A, A⁺)`. -/
theorem SpectralTop.spa_eq (Aplus : Subring A) :
    ValuationSpectrum.comap (toSpectralTop : A ≃+* SpectralTop A).symm.toRingHom ⁻¹'
      ValuationSpectrum.spa (Aplus.map (toSpectralTop : A ≃+* SpectralTop A).toRingHom) =
        ValuationSpectrum.spa Aplus := sorry

end SpectralTop

/- For `ℚ_p⟨T⟩`, `A°` is bounded, so `A → A_sp` is a homeomorphism. -/
-- test spectralTop_uniform_tateAlgebra (degenerate) [R0/spectral-topology]
example (p : ℕ) [Fact p.Prime] :
    IsHomeomorph (toSpectralTop : weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
      isWeightFamily_one_weight ≃+* SpectralTop _) := sorry

/- `ℚ_p[ε]/(ε²)` (with the product topology, a Tate ring): the closure of `{0}` in `A_sp` is
`ℚ_p ε`. -/
-- test spectralTop_dualNumbers (computation) [R0/spectral-topology]
example (p : ℕ) [Fact p.Prime] [IsTateRing (DualNumber ℚ_[p])] :
    closure ({0} : Set (SpectralTop (DualNumber ℚ_[p]))) =
      toSpectralTop '' Set.range fun c : ℚ_[p] ↦ c • (DualNumber.eps : DualNumber ℚ_[p]) := sorry

-- spectralTop_weightedSeries: not stated here; needs the Banach algebra
--   `{∑ aₙTⁿ : |aₙ|(n+1) → 0}` with the norm `sup |aₙ|(n+1)`, in no library (supplier:
--   AdicSpacesPartII:R0/spectral-topology) [non-example test]

-- test spectralTop_isUniform (characterisation) [R0/spectral-topology]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A] :
    IsBounded (powerBoundedSubring (SpectralTop A) : Set (SpectralTop A)) := sorry

/-! ## AdicSpacesPartII:R0/uniformization (construction) -/

/-- R0/uniformization: the ring `Aᵘ`, the completion of `A_sp`. -/
abbrev Uniformization (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [IsTateRing A] : Type _ :=
  Completion (SpectralTop A)

section Uniformization

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- R0/uniformization (constructor): the complete Hausdorff Huber pair `(Aᵘ, Aᵘ⁺)`, `Aᵘ⁺` the
closure of the image of `A⁺` (Kedlaya–Liu Definition 2.8.13). -/
def Pair.uniformization (S : Pair A) : Pair (Uniformization A) where
  plus := ((S.plus.map (toSpectralTop : A ≃+* SpectralTop A).toRingHom).map
    (Completion.coeRingHom : SpectralTop A →+* Completion (SpectralTop A))).topologicalClosure
  isRingOfIntegralElements := sorry

/-- R0/uniformization (projection): `ι : (A, A⁺) → (Aᵘ, Aᵘ⁺)`. -/
def Pair.toUniformization (S : Pair A) : Pair.Hom S S.uniformization where
  toRingHom := (Completion.coeRingHom : SpectralTop A →+* Completion (SpectralTop A)).comp
    (toSpectralTop : A ≃+* SpectralTop A).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

/-- R0/uniformization (instance): `Aᵘ` is a complete Hausdorff Tate ring. -/
theorem Pair.uniformization.isTateRing : IsTateRing (Uniformization A) := sorry

/-- R0/uniformization (instance): `Aᵘ` is uniform. -/
theorem Pair.uniformization.isBounded_powerBoundedSubring :
    IsBounded (powerBoundedSubring (Uniformization A) : Set (Uniformization A)) := sorry

/-- R0/uniformization (characterisation): `ι` has dense range and kills exactly `{|x|_sp = 0}`. -/
theorem Pair.uniformization.denseRange_toUniformization (S : Pair A) (d : TateNormDatum A) :
    DenseRange S.toUniformization.toRingHom ∧
      ∀ x, S.toUniformization.toRingHom x = 0 ↔ spectralSeminorm d x = 0 := sorry

/-- R0/uniformization (characterisation): `Aᵘ⁺` is the closure of `ι(A⁺)`. -/
theorem Pair.uniformization.plus_eq_closure (S : Pair A) :
    (S.uniformization.plus : Set (Uniformization A)) =
      closure (S.toUniformization.toRingHom '' S.plus) := sorry

/-- R0/uniformization (relation): `|·|_sp` extends to a power-multiplicative norm on `Aᵘ` defining
its topology. -/
theorem Pair.uniformization.extendSpectralSeminorm (S : Pair A) (d : TateNormDatum A) :
    ∃ N : RingNorm (Uniformization A), IsPowMul N ∧
      (∀ x, N (S.toUniformization.toRingHom x) = spectralSeminorm d x) ∧
      (𝓝 (0 : Uniformization A)).HasBasis (fun ε : ℝ ↦ 0 < ε) fun ε ↦ {y | N y < ε} := sorry

/-- R0/uniformization (equivalence): `Spa(ι)` is a homeomorphism. -/
theorem Pair.uniformization.spaComap_homeomorph (S : Pair A) :
    IsHomeomorph S.toUniformization.spaComap := sorry

open ValuationSpectrum in
/-- R0/uniformization (compatibility): `Spa(ι)` matches rational subsets: preimages of rational
subsets are rational, and every rational subset of `Spa(Aᵘ, Aᵘ⁺)` is such a preimage. -/
theorem Pair.uniformization.spaComap_preimage_rationalSubset (S : Pair A) (T' : Finset A)
    (s : A) :
    S.toUniformization.spaComap ⁻¹' (Subtype.val ⁻¹' rationalSubset S.plus T' s) =
        Subtype.val ⁻¹' rationalSubset S.uniformization.plus
          (by classical exact T'.image S.toUniformization.toRingHom)
          (S.toUniformization.toRingHom s) ∧
      ∀ (T'' : Finset (Uniformization A)) (s'' : Uniformization A),
        IsOpen (Ideal.span (T'' : Set (Uniformization A)) : Set (Uniformization A)) →
        ∃ (T₀ : Finset A) (s₀ : A),
          Subtype.val ⁻¹' rationalSubset S.uniformization.plus T'' s'' =
            S.toUniformization.spaComap ⁻¹' (Subtype.val ⁻¹' rationalSubset S.plus T₀ s₀) :=
  sorry

/-- R0/uniformization (functoriality): a morphism of Tate Huber pairs induces a morphism of
uniformizations commuting with `ι`. -/
def Pair.uniformization.map {B : Type*} [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsTateRing B] {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) :
    Pair.Hom S.uniformization T.uniformization := sorry

/-- R0/uniformization (compatibility): if `A` is complete, Hausdorff and uniform, `ι` is an
isomorphism of Huber pairs. -/
theorem Pair.uniformization.isIso_of_isUniform (S : Pair A) [T2Space A]
    (hc : letI := IsTopologicalAddGroup.rightUniformSpace A; CompleteSpace A)
    (hb : IsBounded (powerBoundedSubring A : Set A)) :
    ∃ e : Pair.Hom S.uniformization S,
      e.comp S.toUniformization = Pair.Hom.id S ∧
        S.toUniformization.comp e = Pair.Hom.id S.uniformization := sorry

variable {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
  [IsHuberRing B] [CompleteSpace B] [T2Space B]

/-- R0/uniformization (universal-property): a morphism into a complete Hausdorff pair with `B°`
bounded factors through `ι`. -/
def Pair.uniformization.lift {S : Pair A} {T : Pair B}
    (hB : IsBounded (powerBoundedSubring B : Set B)) (φ : Pair.Hom S T) :
    Pair.Hom S.uniformization T := sorry

/-- R0/uniformization (universal-property): `lift φ ∘ ι = φ`. -/
theorem Pair.uniformization.lift_comp_toUniformization {S : Pair A} {T : Pair B}
    (hB : IsBounded (powerBoundedSubring B : Set B)) (φ : Pair.Hom S T) :
    (Pair.uniformization.lift hB φ).comp S.toUniformization = φ := sorry

/-- R0/uniformization (extensionality): morphisms out of `(Aᵘ, Aᵘ⁺)` agreeing after `ι` are
equal. -/
theorem Pair.uniformization.hom_ext {S : Pair A} {T : Pair B}
    {ψ₁ ψ₂ : Pair.Hom S.uniformization T}
    (h : ψ₁.comp S.toUniformization = ψ₂.comp S.toUniformization) : ψ₁ = ψ₂ := sorry

end Uniformization

/- `(ℚ_p[ε]/(ε²), ℤ_p + ℚ_p ε)ᵘ ≅ ℚ_p`, with `ι(a + bε) = a`. -/
-- test uniformization_dualNumbers (computation) [R0/uniformization]
example (p : ℕ) [Fact p.Prime] [IsTateRing (DualNumber ℚ_[p])] (S : Pair (DualNumber ℚ_[p]))
    (hS : (S.plus : Set (DualNumber ℚ_[p])) = {x | ‖TrivSqZeroExt.fst x‖ ≤ 1}) :
    ∃ e : Uniformization (DualNumber ℚ_[p]) ≃+* ℚ_[p],
      ∀ x, e (S.toUniformization.toRingHom x) = TrivSqZeroExt.fst x := sorry

-- uniformization_weightedSeries: not stated here; needs the Banach algebra
--   `{∑ aₙTⁿ : |aₙ|(n+1) → 0}`, in no library (supplier: AdicSpacesPartII:R0/spectral-topology)
--   [non-example test]

/- `(ℚ_p⟨T⟩, ℚ_p⟨T⟩°)ᵘ = (ℚ_p⟨T⟩, ℚ_p⟨T⟩°)`: `ι` is bijective. -/
-- test uniformization_tateAlgebra (degenerate) [R0/uniformization]
example (p : ℕ) [Fact p.Prime] :
    Function.Bijective (Pair.toUniformization
      (Pair.powerBounded (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))).toRingHom := sorry

/- Every morphism from `(ℚ_p[ε]/(ε²), ℤ_p + ℚ_p ε)` to a complete Hausdorff pair with bounded
power-bounded subring kills `ε`. -/
-- test uniformization_lift_dualNumbers (characterisation) [R0/uniformization]
example (p : ℕ) [Fact p.Prime] [IsTateRing (DualNumber ℚ_[p])] (S : Pair (DualNumber ℚ_[p]))
    {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
    [IsHuberRing B] [CompleteSpace B] [T2Space B] (T : Pair B)
    (hB : IsBounded (powerBoundedSubring B : Set B)) (φ : Pair.Hom S T) :
    φ.toRingHom DualNumber.eps = 0 := sorry

-- uniformization_banach: not stated here; needs Kedlaya–Liu's separated completion of a Banach
--   ring for its spectral seminorm, in no library (supplier: AdicSpacesPartII:R0/uniformization)
--   [compatibility test]

/-! ## AdicSpacesPartII:R0/uniform-completed-tensor-product (construction) -/

section UniformCompletedTensor

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]

/-- R0/uniform-completed-tensor-product: over a Tate ring `A`, `B ⊗̂_A C` is a Tate ring
(`B` and `C` are Tate by Wedhorn Proposition 6.25). -/
instance Pair.completedTensor.instIsTateRing : IsTateRing (CompletedTensor A B C) := sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- R0/uniform-completed-tensor-product (constructor): `B ⊗̂ᵘ_A C = (B ⊗̂_A C)ᵘ`, a complete
Hausdorff uniform Tate Huber pair. (Completeness of `B`, `C` is not used by the construction.) -/
def Pair.uniformCompletedTensor : Pair (Uniformization (CompletedTensor A B C)) :=
  (Pair.completedTensor S T U hT hU).uniformization

/-- R0/uniform-completed-tensor-product (projection): `inlᵘ = ι ∘ inl`. -/
def Pair.uniformCompletedTensor.inl : Pair.Hom T (Pair.uniformCompletedTensor S T U hT hU) :=
  (Pair.toUniformization _).comp (Pair.completedTensor.inl S T U hT hU)

/-- R0/uniform-completed-tensor-product (projection): `inrᵘ = ι ∘ inr`. -/
def Pair.uniformCompletedTensor.inr : Pair.Hom U (Pair.uniformCompletedTensor S T U hT hU) :=
  (Pair.toUniformization _).comp (Pair.completedTensor.inr S T U hT hU)

/-- R0/uniform-completed-tensor-product (relation): `inlᵘ ∘ f = inrᵘ ∘ g`. -/
theorem Pair.uniformCompletedTensor.inl_comp :
    (Pair.uniformCompletedTensor.inl S T U hT hU).comp
        ⟨algebraMap A B, IsAdicHom.continuous (algebraMap A B), hT⟩ =
      (Pair.uniformCompletedTensor.inr S T U hT hU).comp
        ⟨algebraMap A C, IsAdicHom.continuous (algebraMap A C), hU⟩ := sorry

/-- R0/uniform-completed-tensor-product (instance): `B ⊗̂ᵘ_A C` is uniform. -/
theorem Pair.uniformCompletedTensor.isBounded_powerBoundedSubring :
    IsBounded (powerBoundedSubring (Uniformization (CompletedTensor A B C)) :
      Set (Uniformization (CompletedTensor A B C))) := sorry

/-- R0/uniform-completed-tensor-product (compatibility): the canonical morphism
`ι : B ⊗̂_A C → B ⊗̂ᵘ_A C`. -/
def Pair.uniformCompletedTensor.fromCompletedTensor :
    Pair.Hom (Pair.completedTensor S T U hT hU) (Pair.uniformCompletedTensor S T U hT hU) :=
  Pair.toUniformization _

/-- R0/uniform-completed-tensor-product (compatibility): `ι` is an isomorphism iff `B ⊗̂_A C` is
uniform. -/
theorem Pair.uniformCompletedTensor.fromCompletedTensor_isIso_iff :
    IsHomeomorph (Pair.uniformCompletedTensor.fromCompletedTensor S T U hT hU).toRingHom ↔
      IsBounded (powerBoundedSubring (CompletedTensor A B C) : Set (CompletedTensor A B C)) :=
  sorry

/-- R0/uniform-completed-tensor-product (equivalence): `Spa(B ⊗̂ᵘ_A C) ≅ Spa(B ⊗̂_A C)`,
identifying rational subsets. -/
theorem Pair.uniformCompletedTensor.spaHomeomorph :
    IsHomeomorph (Pair.uniformCompletedTensor.fromCompletedTensor S T U hT hU).spaComap := sorry

variable {S T U hT hU} in
/-- R0/uniform-completed-tensor-product (functoriality): morphisms of the diagrams induce
morphisms of uniform completed tensor products. -/
def Pair.uniformCompletedTensor.map {A' B' C' : Type*} [CommRing A'] [TopologicalSpace A']
    [IsTopologicalRing A'] [IsTateRing A'] [CommRing B'] [TopologicalSpace B']
    [IsTopologicalRing B'] [IsHuberRing B'] [CommRing C'] [TopologicalSpace C']
    [IsTopologicalRing C'] [IsHuberRing C'] [Algebra A' B'] [Algebra A' C']
    [IsAdicHom (algebraMap A' B')] [IsAdicHom (algebraMap A' C')] {S' : Pair A'} {T' : Pair B'}
    {U' : Pair C'} (hT' : ∀ a ∈ S'.plus, algebraMap A' B' a ∈ T'.plus)
    (hU' : ∀ a ∈ S'.plus, algebraMap A' C' a ∈ U'.plus) (e : Pair.Hom S S') (f : Pair.Hom T T')
    (g : Pair.Hom U U')
    (hf : f.toRingHom.comp (algebraMap A B) = (algebraMap A' B').comp e.toRingHom)
    (hg : g.toRingHom.comp (algebraMap A C) = (algebraMap A' C').comp e.toRingHom) :
    Pair.Hom (Pair.uniformCompletedTensor S T U hT hU)
      (Pair.uniformCompletedTensor S' T' U' hT' hU') :=
  Pair.uniformization.map (Pair.completedTensor.map hT' hU' e f g hf hg)

variable (A B C) in
/-- R0/uniform-completed-tensor-product (equivalence): `B ⊗̂ᵘ_A C ≅ C ⊗̂ᵘ_A B`, exchanging `inlᵘ`
and `inrᵘ` (a homeomorphism). -/
def Pair.uniformCompletedTensor.comm :
    Uniformization (CompletedTensor A B C) ≃+* Uniformization (CompletedTensor A C B) := sorry


section Lift

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsHuberRing R] [CompleteSpace R] [T2Space R] {V : Pair R}

/-- R0/uniform-completed-tensor-product (universal-property): for a complete Hausdorff uniform
`(R, R⁺)` and `φ`, `ψ` with `φ ∘ f = ψ ∘ g`, the morphism `B ⊗̂ᵘ_A C → (R, R⁺)`. -/
def Pair.uniformCompletedTensor.lift (hR : IsBounded (powerBoundedSubring R : Set R))
    (φ : Pair.Hom T V) (ψ : Pair.Hom U V)
    (h : φ.toRingHom.comp (algebraMap A B) = ψ.toRingHom.comp (algebraMap A C)) :
    Pair.Hom (Pair.uniformCompletedTensor S T U hT hU) V := sorry

/-- R0/uniform-completed-tensor-product (universal-property): `lift ∘ inlᵘ = φ`,
`lift ∘ inrᵘ = ψ`. -/
theorem Pair.uniformCompletedTensor.lift_comp_inl (hR : IsBounded (powerBoundedSubring R : Set R))
    (φ : Pair.Hom T V) (ψ : Pair.Hom U V)
    (h : φ.toRingHom.comp (algebraMap A B) = ψ.toRingHom.comp (algebraMap A C)) :
    (Pair.uniformCompletedTensor.lift S T U hT hU hR φ ψ h).comp
        (Pair.uniformCompletedTensor.inl S T U hT hU) = φ ∧
      (Pair.uniformCompletedTensor.lift S T U hT hU hR φ ψ h).comp
        (Pair.uniformCompletedTensor.inr S T U hT hU) = ψ := sorry

/-- R0/uniform-completed-tensor-product (extensionality): morphisms agreeing after `inlᵘ` and
`inrᵘ` are equal. -/
theorem Pair.uniformCompletedTensor.hom_ext
    {χ₁ χ₂ : Pair.Hom (Pair.uniformCompletedTensor S T U hT hU) V}
    (hl : χ₁.comp (Pair.uniformCompletedTensor.inl S T U hT hU) =
      χ₂.comp (Pair.uniformCompletedTensor.inl S T U hT hU))
    (hr : χ₁.comp (Pair.uniformCompletedTensor.inr S T U hT hU) =
      χ₂.comp (Pair.uniformCompletedTensor.inr S T U hT hU)) : χ₁ = χ₂ := sorry

end Lift

end UniformCompletedTensor

/-- R0/uniform-completed-tensor-product (other): `B ⊗̂ᵘ_A A ≅ Bᵘ` (a homeomorphism). -/
def Pair.uniformCompletedTensor.unitIso (A B : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsTateRing B] [Algebra A B] [IsAdicHom (algebraMap A B)] :
    Uniformization (CompletedTensor A B A) ≃+* Uniformization B := sorry

/- `ℚ_p⟨T⟩ ⊗̂ᵘ ℚ_p⟨S⟩ ≅ ℚ_p⟨T, S⟩`, and `ι` from the completed tensor product is an
isomorphism. -/
-- test uniformCompletedTensor_polydisc (computation) [R0/uniform-completed-tensor-product]
example (p : ℕ) [Fact p.Prime]
    [IsAdicHom (algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))] :
    Nonempty (Uniformization (CompletedTensor ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) ≃+*
      restrictedMvPowerSeriesCompletion 2 ℚ_[p]) ∧
    IsHomeomorph (Pair.toUniformization (Pair.powerBounded (CompletedTensor ℚ_[p]
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p])))).toRingHom := sorry

/- `ℂ_p ⊗̂_{ℚ_p} ℂ_p → ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p` is not an isomorphism. -/
-- test uniformCompletedTensor_Cp (non-example) [R0/uniform-completed-tensor-product]
example (p : ℕ) [Fact p.Prime] [IsTateRing ℂ_[p]] [IsAdicHom (algebraMap ℚ_[p] ℂ_[p])] :
    ¬ IsHomeomorph (Pair.toUniformization
      (Pair.powerBounded (CompletedTensor ℚ_[p] ℂ_[p] ℂ_[p]))).toRingHom := sorry

-- test uniformCompletedTensor_unit (degenerate) [R0/uniform-completed-tensor-product]
example {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
    [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsTateRing B] [Algebra A B]
    [IsAdicHom (algebraMap A B)] :
    Nonempty (Uniformization (CompletedTensor A B A) ≃+* Uniformization B) := sorry

/- For a finite Galois extension `L/K` of complete nonarchimedean fields,
`L ⊗̂ᵘ_K L ≅ ∏_{σ ∈ Gal(L/K)} L`. -/
-- test uniformCompletedTensor_galois (characterisation) [R0/uniform-completed-tensor-product]
example {K L : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedField L] [NormedAlgebra K L] [FiniteDimensional K L] [IsGalois K L] [IsTateRing K]
    [IsTateRing L] [IsAdicHom (algebraMap K L)] :
    Nonempty (Uniformization (CompletedTensor K L L) ≃+* ((L ≃ₐ[K] L) → L)) := sorry

-- test uniformCompletedTensor_of_isUniform (compatibility) [R0/uniform-completed-tensor-product]
example {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
    [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
    [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
    [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
    (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
    (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)
    (h : IsBounded (powerBoundedSubring (CompletedTensor A B C) : Set (CompletedTensor A B C))) :
    IsHomeomorph (Pair.uniformCompletedTensor.fromCompletedTensor S T U hT hU).toRingHom := sorry

/-! ## AdicSpacesPartII:R0/completed-tensor-banach-module (construction) -/

section BanachCompletedTensor

open Pointwise

/-- R0/completed-tensor-banach-module (structure): `V` is a Banach module over the complete Tate
ring `A`: a complete Hausdorff topological `A`-module whose topology is defined by an additive
subgroup `V₀`, stable under the ring of definition `A₀` of a norm datum `d = (A₀, ϖ, r)`
(R0/tate-ring-norm), with `V = ⋃ₙ ϖ⁻ⁿ V₀` and the `ϖⁿ V₀` a basis of neighbourhoods of `0`
(equivalently a module complete for a norm with `|a v| ≤ c · α_d(a) · |v|`, Kedlaya–Liu
Definition 2.2.7). -/
def IsBanachModule (A V : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [AddCommGroup V] [Module A V] [UniformSpace V] : Prop :=
  ContinuousSMul A V ∧ CompleteSpace V ∧ T2Space V ∧
    ∃ (d : TateNormDatum A) (V₀ : AddSubgroup V),
      (∀ a ∈ d.pair.ringOfDefinition, ∀ v ∈ V₀, a • v ∈ V₀) ∧
      (∀ v : V, ∃ n : ℕ, ((d.ϖ ^ n : Aˣ) : A) • v ∈ V₀) ∧
      (𝓝 (0 : V)).HasBasis (fun _ : ℕ ↦ True) fun n ↦ ((d.ϖ ^ n : Aˣ) : A) • (V₀ : Set V)

variable (A V W : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [AddCommGroup V] [Module A V] [TopologicalSpace V]
  [AddCommGroup W] [Module A W] [TopologicalSpace W]

/-- R0/completed-tensor-banach-module (data): the tensor topology on `V ⊗[A] W`, in which the
images of `ϖⁿ · (V₀ ⊗_{A₀} W₀)` form a basis of neighbourhoods of `0` for lattices `V₀`, `W₀` as
in `IsBanachModule`; equivalently the topology of the product seminorm
`|x| = inf max_i |v_i| |w_i|` (Kedlaya–Liu Definition 2.1.10). It does not depend on the
lattices; the construction is only used for Banach modules over a complete Tate ring. -/
@[instance_reducible]
def banachTensorTopology : TopologicalSpace (V ⊗[A] W) := sorry

/-- R0/completed-tensor-banach-module: `banachTensorTopology` is a group topology. -/
theorem isTopologicalAddGroup_banachTensorTopology :
    @IsTopologicalAddGroup (V ⊗[A] W) (banachTensorTopology A V W) _ := sorry

/-- R0/completed-tensor-banach-module: the canonical uniformity of `banachTensorTopology`. -/
@[instance_reducible]
def banachTensorUniformSpace : UniformSpace (V ⊗[A] W) :=
  letI := banachTensorTopology A V W
  haveI := isTopologicalAddGroup_banachTensorTopology A V W
  IsTopologicalAddGroup.rightUniformSpace (V ⊗[A] W)

namespace BanachModule

/-- R0/completed-tensor-banach-module (constructor): the completed tensor product `V ⊗̂_A W` of
Banach `A`-modules, the Hausdorff completion of `V ⊗[A] W` for `banachTensorTopology`; a Banach
`A`-module whose lattice is the closure of the image of `V₀ ⊗ W₀`. -/
def CompletedTensor : Type _ :=
  @Completion (V ⊗[A] W) (banachTensorUniformSpace A V W)

/-- R0/completed-tensor-banach-module (instance): the uniform structure of `V ⊗̂_A W`. -/
instance : UniformSpace (CompletedTensor A V W) :=
  @Completion.uniformSpace (V ⊗[A] W) (banachTensorUniformSpace A V W)

/-- R0/completed-tensor-banach-module (instance): the additive group of `V ⊗̂_A W`. -/
instance : AddCommGroup (CompletedTensor A V W) :=
  letI := banachTensorUniformSpace A V W
  haveI : IsTopologicalAddGroup (V ⊗[A] W) := isTopologicalAddGroup_banachTensorTopology A V W
  haveI : IsUniformAddGroup (V ⊗[A] W) := isUniformAddGroup_of_addCommGroup
  Completion.instAddCommGroup

/-- R0/completed-tensor-banach-module (instance): the `A`-module structure extended by
continuity. -/
instance : Module A (CompletedTensor A V W) := sorry

/-- R0/completed-tensor-banach-module (instance): `V ⊗̂_A W` is complete. -/
instance : CompleteSpace (CompletedTensor A V W) :=
  @Completion.completeSpace (V ⊗[A] W) (banachTensorUniformSpace A V W)

/-- R0/completed-tensor-banach-module (instance): `V ⊗̂_A W` is Hausdorff. -/
instance : T2Space (CompletedTensor A V W) :=
  letI := banachTensorUniformSpace A V W
  inferInstanceAs (T2Space (Completion (V ⊗[A] W)))

/-- R0/completed-tensor-banach-module (instance): the uniform structure is that of the additive
group. -/
instance : IsUniformAddGroup (CompletedTensor A V W) := sorry

/-- R0/completed-tensor-banach-module (instance): the scalar action is continuous. -/
instance : ContinuousSMul A (CompletedTensor A V W) := sorry

/-- R0/completed-tensor-banach-module (data): the continuous `A`-bilinear map
`(v, w) ↦ v ⊗ w` into `V ⊗̂_A W`. -/
def CompletedTensor.tmul : V →ₗ[A] W →ₗ[A] CompletedTensor A V W := sorry

/-- R0/completed-tensor-banach-module (data): `tmul` is jointly continuous and its image spans a
dense submodule. -/
theorem CompletedTensor.continuous_tmul :
    (Continuous fun p : V × W ↦ CompletedTensor.tmul A V W p.1 p.2) ∧
      Dense (Submodule.span A (Set.range fun p : V × W ↦ CompletedTensor.tmul A V W p.1 p.2) :
        Set (CompletedTensor A V W)) := sorry

variable {A V W}

section Lift

variable {M : Type*} [AddCommGroup M] [Module A M] [UniformSpace M] [IsUniformAddGroup M]
  [CompleteSpace M] [T2Space M]

/-- R0/completed-tensor-banach-module (universal-property): a continuous (equivalently bounded,
`β(V₀ × W₀) ⊆ ϖ⁻ᵏ M₀`) `A`-bilinear map into a complete Hausdorff topological `A`-module factors
through `V ⊗̂_A W` as a continuous `A`-linear map. -/
def CompletedTensor.lift (β : V →ₗ[A] W →ₗ[A] M) (hβ : Continuous fun p : V × W ↦ β p.1 p.2) :
    CompletedTensor A V W →ₗ[A] M := sorry

/-- R0/completed-tensor-banach-module (simp): `lift β (v ⊗ w) = β v w`. -/
@[simp]
theorem CompletedTensor.lift_tmul (β : V →ₗ[A] W →ₗ[A] M)
    (hβ : Continuous fun p : V × W ↦ β p.1 p.2) (v : V) (w : W) :
    CompletedTensor.lift β hβ (CompletedTensor.tmul A V W v w) = β v w := sorry

/-- R0/completed-tensor-banach-module (universal-property): `lift β` is continuous. -/
theorem CompletedTensor.continuous_lift (β : V →ₗ[A] W →ₗ[A] M)
    (hβ : Continuous fun p : V × W ↦ β p.1 p.2) : Continuous (CompletedTensor.lift β hβ) :=
  sorry

end Lift

/-- R0/completed-tensor-banach-module (extensionality): continuous `A`-linear maps out of
`V ⊗̂_A W` into a Hausdorff module agreeing on every `v ⊗ w` are equal. -/
theorem CompletedTensor.ext {M : Type*} [AddCommGroup M] [Module A M] [TopologicalSpace M]
    [T2Space M] {φ ψ : CompletedTensor A V W →ₗ[A] M} (hφ : Continuous φ) (hψ : Continuous ψ)
    (h : ∀ v w, φ (CompletedTensor.tmul A V W v w) = ψ (CompletedTensor.tmul A V W v w)) :
    φ = ψ := sorry

/-- R0/completed-tensor-banach-module (functoriality): continuous `A`-linear `f : V → V'`,
`g : W → W'` induce `f ⊗̂ g : V ⊗̂_A W → V' ⊗̂_A W'`, with `map_id` and `map_comp`. -/
def CompletedTensor.map {V' W' : Type*} [AddCommGroup V'] [Module A V'] [TopologicalSpace V']
    [AddCommGroup W'] [Module A W'] [TopologicalSpace W'] (f : V →L[A] V') (g : W →L[A] W') :
    CompletedTensor A V W →L[A] CompletedTensor A V' W' := sorry

/-- R0/completed-tensor-banach-module (other): `- ⊗̂_A W` carries a topologically split short
exact sequence `0 → V' → V → V'' → 0` (continuous `f`, `g`, a continuous retraction `r` of `f` and
a continuous section `s` of `g` with `f ∘ r + s ∘ g = id`) to a split short exact sequence. -/
theorem CompletedTensor.exact_of_split {V' V'' : Type*} [AddCommGroup V'] [Module A V']
    [TopologicalSpace V'] [AddCommGroup V''] [Module A V''] [TopologicalSpace V'']
    [IsTopologicalAddGroup V] (f : V' →L[A] V) (g : V →L[A] V'') (r : V →L[A] V') (s : V'' →L[A] V)
    (hrf : r.comp f = ContinuousLinearMap.id A V') (hgs : g.comp s = ContinuousLinearMap.id A V'')
    (hsum : f.comp r + s.comp g = ContinuousLinearMap.id A V) :
    Function.Exact (CompletedTensor.map f (ContinuousLinearMap.id A W))
        (CompletedTensor.map g (ContinuousLinearMap.id A W)) ∧
      Function.Injective (CompletedTensor.map f (ContinuousLinearMap.id A W)) ∧
      Function.Surjective (CompletedTensor.map g (ContinuousLinearMap.id A W)) := sorry

/-- R0/completed-tensor-banach-module (compatibility): for a finite projective `A`-module `P`
with its natural topology, `P ⊗[A] W → P ⊗̂_A W` is an isomorphism (no completion is needed). -/
def CompletedTensor.finiteProjectiveEquiv {P W : Type*} [AddCommGroup P] [Module A P]
    [TopologicalSpace P] [IsModuleTopology A P] [Module.Finite A P] [Module.Projective A P]
    [AddCommGroup W] [Module A W] [UniformSpace W] [IsUniformAddGroup W] [CompleteSpace W]
    [T2Space W] [ContinuousSMul A W] [IsTateRing A] :
    P ⊗[A] W ≃ₗ[A] CompletedTensor A P W := sorry

variable (A V) in
/-- R0/completed-tensor-banach-module (equivalence): `A ⊗̂_A V ≅ V` for a Banach `A`-module `V`,
`a ⊗ v ↦ a v`. -/
def CompletedTensor.lid {V : Type*} [AddCommGroup V] [Module A V] [UniformSpace V]
    [IsUniformAddGroup V] [CompleteSpace V] [T2Space V] [ContinuousSMul A V] [IsTateRing A] :
    CompletedTensor A A V ≃L[A] V := sorry

/-- R0/completed-tensor-banach-module (compatibility): for complete Huber `A`-algebras `B`, `C`
over a Tate ring `A` (structure maps adic), the Banach-module completed tensor product is the
completed tensor product of R0/completed-tensor-product, as topological `A`-modules. -/
def CompletedTensor.equivCompletedTensor (A B C : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]
    [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] :
    CompletedTensor A B C ≃ₗ[A] Huber.CompletedTensor A B C := sorry

section Field

variable {L V W X : Type*} [NontriviallyNormedField L] [IsUltrametricDist L] [CompleteSpace L]
  [NormedAddCommGroup V] [NormedSpace L V] [IsUltrametricDist V] [CompleteSpace V]
  [NormedAddCommGroup W] [NormedSpace L W] [IsUltrametricDist W] [CompleteSpace W]
  [NormedAddCommGroup X] [NormedSpace L X] [IsUltrametricDist X] [CompleteSpace X]

/-- R0/completed-tensor-banach-module (compatibility): over a complete nonarchimedean field,
`V ⊗_L W → V ⊗̂_L W` is injective (Kedlaya–Liu Lemma 2.2.9(a)). -/
theorem CompletedTensor.injective_tensorProduct_of_field :
    Function.Injective (TensorProduct.lift (CompletedTensor.tmul L V W)) := sorry

/-- R0/completed-tensor-banach-module (relation): over a complete nonarchimedean field, for a
continuous `f : V → W`, `ker f ⊗̂ X → ker (f ⊗̂ X)` is bijective, and `f ⊗̂ X` is strict when `f`
is (Kedlaya–Liu Lemma 2.2.9(b), (c)). -/
theorem CompletedTensor.ker_map_of_field (f : V →L[L] W) :
    LinearMap.ker (CompletedTensor.map f (ContinuousLinearMap.id L X) :
        CompletedTensor L V X →ₗ[L] CompletedTensor L W X) =
      LinearMap.range
        (CompletedTensor.map (LinearMap.ker (f : V →ₗ[L] W)).subtypeL
          (ContinuousLinearMap.id L X) :
            CompletedTensor L (LinearMap.ker (f : V →ₗ[L] W)) X →ₗ[L] CompletedTensor L V X) :=
  sorry

/-- R0/completed-tensor-banach-module (characterisation): if `(e i)` is an orthonormal basis of
`V` (`‖Σ cᵢ eᵢ‖ = max ‖cᵢ‖`, dense span), then `E ⊗̂_L V` is the Banach module `C₀(ι, E)` of
null families in `E` with the supremum norm, `x ⊗ Σ cᵢ eᵢ ↦ (cᵢ x)ᵢ`; the map is isometric for
the product norm. -/
def CompletedTensor.orthonormalEquiv {ι : Type*} [TopologicalSpace ι] [DiscreteTopology ι]
    (e : ι → V)
    (he : ∀ c : ι →₀ L, ‖Finsupp.linearCombination L e c‖₊ = c.support.sup fun i ↦ ‖c i‖₊)
    (hd : Dense (Submodule.span L (Set.range e) : Set V)) :
    CompletedTensor L X V ≃L[L] ZeroAtInftyContinuousMap ι X := sorry

/-- R0/completed-tensor-banach-module (characterisation): for a `t`-orthogonal basis
(`t · max ‖cᵢ‖ ≤ ‖Σ cᵢ eᵢ‖ ≤ max ‖cᵢ‖`, `0 < t ≤ 1`), the same map is a topological isomorphism
with `t · ‖·‖_sup ≤ ‖·‖ ≤ ‖·‖_sup`. -/
def CompletedTensor.orthogonalEquiv {ι : Type*} [TopologicalSpace ι] [DiscreteTopology ι]
    (e : ι → V) (t : ℝ) (ht : 0 < t)
    (he : ∀ c : ι →₀ L, t * ((c.support.sup fun i ↦ ‖c i‖₊ : NNReal) : ℝ) ≤
        ‖Finsupp.linearCombination L e c‖ ∧
      ‖Finsupp.linearCombination L e c‖ ≤ ((c.support.sup fun i ↦ ‖c i‖₊ : NNReal) : ℝ))
    (hd : Dense (Submodule.span L (Set.range e) : Set V)) :
    CompletedTensor L X V ≃L[L] ZeroAtInftyContinuousMap ι X := sorry

end Field

/-- R0/completed-tensor-banach-module (functoriality): for a continuous homomorphism `A → A'` of
complete Tate rings, the `A'`-module structure on `A' ⊗̂_A V` (a Banach `A'`-module); for a
rational localisation `A → A⟨T/s⟩` this is `M ⊗̂_A A⟨T/s⟩`. -/
@[instance_reducible]
def CompletedTensor.baseChange (A A' V : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [CommRing A'] [TopologicalSpace A'] [IsTopologicalRing A']
    [Algebra A A'] [AddCommGroup V] [Module A V] [TopologicalSpace V] :
    Module A' (CompletedTensor A A' V) := sorry

/-- R0/completed-tensor-banach-module (equivalence): transitivity of completed base change
along `A → A' → A''`: `A'' ⊗̂_{A'} (A' ⊗̂_A V) ≅ A'' ⊗̂_A V`, an `A''`-linear homeomorphism
(stated here as an additive equivalence). -/
def CompletedTensor.cancelBaseChange (A A' A'' V : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [CommRing A'] [TopologicalSpace A'] [IsTopologicalRing A']
    [CommRing A''] [TopologicalSpace A''] [IsTopologicalRing A''] [Algebra A A'] [Algebra A' A'']
    [Algebra A A''] [IsScalarTower A A' A''] [AddCommGroup V] [Module A V] [TopologicalSpace V] :
    letI : Module A' (CompletedTensor A A' V) := CompletedTensor.baseChange A A' V
    CompletedTensor A' A'' (CompletedTensor A A' V) ≃+ CompletedTensor A A'' V := sorry

end BanachModule

end BanachCompletedTensor

/- `ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ ≅ ℚ_p⟨T, S⟩` as Banach modules (orthonormal bases of monomials). -/
-- test banachCompletedTensor_test_tateAlgebra (computation) [R0/completed-tensor-banach-module]
example (p : ℕ) [Fact p.Prime] :
    Nonempty (BanachModule.CompletedTensor ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ≃ₗ[ℚ_[p]]
        restrictedMvPowerSeriesCompletion 2 ℚ_[p]) := sorry

/- `Σ pⁿ Tⁿ Sⁿ` is not in the image of the algebraic tensor product (its coefficient matrix has
infinite rank): the uncompleted tensor product is the wrong object. -/
-- test banachCompletedTensor_test_notAlgebraic (non-example) [R0/completed-tensor-banach-module]
example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (TensorProduct.lift (BanachModule.CompletedTensor.tmul ℚ_[p]
      (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))) :=
  sorry

-- test banachCompletedTensor_test_unit (degenerate) [R0/completed-tensor-banach-module]
example {A V : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
    [AddCommGroup V] [Module A V] [UniformSpace V] [IsUniformAddGroup V] [CompleteSpace V]
    [T2Space V] [ContinuousSMul A V] :
    Nonempty (BanachModule.CompletedTensor A A V ≃L[A] V) := sorry

/- With the orthonormal basis of `c₀(ℕ, ℚ_p)`, `ℂ_p ⊗̂_{ℚ_p} c₀(ℕ, ℚ_p)` is the space of null
sequences in `ℂ_p`; the bounded sequence `(1, 1, …)` is not one (unlike the mixed completed tensor
product of R5 with `∏_ℕ ℤ_p`). -/
-- test banachCompletedTensor_test_nullSequences (characterisation) [R0/completed-tensor-banach-module]
example (p : ℕ) [Fact p.Prime] :
    Nonempty (BanachModule.CompletedTensor ℚ_[p] ℂ_[p] (ZeroAtInftyContinuousMap ℕ ℚ_[p]) ≃L[ℚ_[p]]
      ZeroAtInftyContinuousMap ℕ ℂ_[p]) ∧
    ¬ ∃ f : ZeroAtInftyContinuousMap ℕ ℂ_[p], ∀ n, f n = 1 := sorry

/- For a finite extension `L/K`, `L ⊗_K V → L ⊗̂_K V` is an isomorphism. -/
-- test banachCompletedTensor_test_finiteExtension (compatibility) [R0/completed-tensor-banach-module]
example {K L V : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsTateRing K] [NormedField L] [NormedAlgebra K L] [FiniteDimensional K L]
    [NormedAddCommGroup V] [NormedSpace K V] [CompleteSpace V] :
    Nonempty (L ⊗[K] V ≃ₗ[K] BanachModule.CompletedTensor K L V) := sorry


end Huber

/-! ## AdicSpacesPartII:R0/valuation-amalgamation (lemma) -/

namespace ValuationSpectrum

/-- R0/valuation-amalgamation: valuations on `B` and `C` with the same pullback to `A` are the
pullbacks of one valuation on `B ⊗[A] C`. -/
theorem exists_amalgamation {A B C : Type*} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]
    [Algebra A C] (y : ValuationSpectrum B) (x : ValuationSpectrum C)
    (h : comap (algebraMap A B) y = comap (algebraMap A C) x) :
    ∃ v : ValuationSpectrum (B ⊗[A] C),
      comap Algebra.TensorProduct.includeLeftRingHom v = y ∧
        comap (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom v = x := sorry

end ValuationSpectrum

/-! # R0 (part a): geometric nodes. The anchor's category of adic spaces (AdicSpaces Layer 5) is
not in the pinned libraries; its items are comments, with the ring-level cores stated. -/

namespace AdicSpace

open Huber ValuationSpectrum

/-! ## AdicSpacesPartII:R0/affinoid-fibre-product (theorem) -/

-- AdicSpace.isPullback_spa_completedTensor: not stated here; needs the category of adic spaces
--   and `Spa` of sheafy complete Huber pairs (supplier: AdicSpaces Layer 5). Its ring-level core
--   is `Huber.Pair.completedTensor.existsUnique_lift`.

/-! ## AdicSpacesPartII:R0/fibre-product-along-finite-type (lemma) -/

-- AdicSpace.isPullback_iUnion_finiteTypeCharts: not stated here; needs the category of adic
--   spaces with open immersions and gluing (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/fibre-products-existence (theorem) -/

-- AdicSpace.hasPullback_of_locallyOfFiniteType: not stated here; needs the category of adic
--   spaces and the anchor's `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5)
-- AdicSpace.hasPullback_of_locallyOfWeaklyFiniteType_of_isAdic: not stated here; needs the
--   category of adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/fibre-product-points (lemma) -/

-- AdicSpace.exists_pullback_point: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.exists_pullback_point_affinoid`.

/-- R0/fibre-product-points, affinoid core: for complete Huber pairs and adic `A → B`, `A → C`,
every pair of points of `Spa B`, `Spa C` over the same point of `Spa A` comes from a point of
`Spa(B ⊗̂_A C)` (via R0/valuation-amalgamation). -/
theorem exists_pullback_point_affinoid {A B C : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A]
    [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B]
    [CompleteSpace B] [T2Space B] [CommRing C] [UniformSpace C] [IsUniformAddGroup C]
    [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C] [Algebra A B]
    [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] (S : Pair A)
    (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
    (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus) (y : spa T.plus) (x : spa U.plus)
    (h : comap (algebraMap A B) y.1 = comap (algebraMap A C) x.1) :
    ∃ z : spa (Pair.completedTensor S T U hT hU).plus,
      (Pair.completedTensor.inl S T U hT hU).spaComap z = y ∧
        (Pair.completedTensor.inr S T U hT hU).spaComap z = x := sorry

/-! ## AdicSpacesPartII:R0/base-change-stability (lemma) -/

-- AdicSpace.LocallyOfFiniteType.isStableUnderBaseChange: not stated here; needs fibre products of
--   adic spaces and the anchor's `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5). The other
--   clauses of R0/base-change-stability are the `isStableUnderBaseChange` items of the definitions
--   below.

/-! ## AdicSpacesPartII:R0/adic-morphism (definition) -/

-- AdicSpace.IsAdic: not stated here; needs the category of adic spaces with the rings
--   `O_X(U)` of open affinoids (supplier: AdicSpaces Layer 5). Its ring-level input is
--   `Huber.IsAdicHom`.
-- AdicSpace.isAdic_iff_image_analytic: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsAdic.isAdicHom_app: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.image_nonanalytic_subset: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.image_nonanalytic_subset_affinoid`.
-- AdicSpace.IsAdic.of_isAnalytic: not stated here; needs analytic adic spaces (supplier:
--   AdicSpaces Layer 5). Its ring-level core is `Huber.IsAdicHom.of_isTateRing`.
-- AdicSpace.IsAdic.comp: not stated here; needs the category of adic spaces (supplier:
--   AdicSpaces Layer 5). Its ring-level core is `Huber.IsAdicHom.comp`.
-- AdicSpace.IsAdic.of_comp: not stated here; needs the category of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsAdic.of_isOpenImmersion: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsAdic.spa_iff: not stated here; needs `Spa` as a functor to adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.isAdic: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `Huber.IsTopologicallyFiniteType.isAdicHom`.
-- AdicSpace.IsAdic.isStableUnderBaseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- isAdic_test_disc: not stated here; needs the morphism of adic spaces `Spa(ℚ_p⟨T⟩) → Spa(ℚ_p)`
--   (supplier: AdicSpaces Layer 5) [computation test]
-- not_isAdic_test_powerSeries: not stated here; needs the category of adic spaces (supplier:
--   AdicSpaces Layer 5); its ring-level core is the test not_isAdicHom_padicInt_powerSeries
--   [non-example test]
-- isAdic_of_isAnalytic_test: not stated here; needs analytic adic spaces (supplier: AdicSpaces
--   Layer 5) [characterisation test]
-- isAdic_spa_iff: not stated here; needs `Spa` of sheafy pairs as adic spaces (supplier:
--   AdicSpaces Layer 5) [compatibility test]
-- isAdic_id_test: not stated here; needs identities and open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5) [degenerate test]

/-! ## AdicSpacesPartII:R0/adic-iff-analytic-locus (lemma) -/

/-- R0/adic-iff-analytic-locus (iii), affinoid core: a morphism of Huber pairs maps non-analytic
points of `Spa B` to non-analytic points of `Spa A` (the support of the pullback is the preimage
of an open ideal). -/
theorem image_nonanalytic_subset_affinoid {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (f : Pair.Hom S T) (v : spa T.plus)
    (hv : ¬ IsAnalyticPoint v.1) : ¬ IsAnalyticPoint (f.spaComap v).1 := sorry

/-! ## AdicSpacesPartII:R0/finite-type-morphism-classes (definition) -/

-- AdicSpace.LocallyOfWeaklyFiniteType: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5). Its ring-level condition is Tau Ceti's
--   `Huber.IsTopologicallyFiniteType`.
-- AdicSpace.IsWeaklyFiniteType: not stated here; needs quasi-compact morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.isAdic: listed under R0/adic-morphism above.
-- AdicSpace.LocallyOfFiniteType.locallyOfWeaklyFiniteType: not stated here; needs the anchor's
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfPlusWeaklyFiniteType.locallyOfWeaklyFiniteType: not stated here; needs the
--   category of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.comp: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.of_comp: not stated here; needs the category of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.restrict: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfWeaklyFiniteType.of_isOpenImmersion: not stated here; needs open
--   immersions of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.locallyOfWeaklyFiniteType_spa_iff: not stated here; needs `Spa` of discrete pairs
--   as adic spaces (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `AdicSpace.locallyOfWeaklyFiniteType_spa_iff_ring`.
-- AdicSpace.LocallyOfWeaklyFiniteType.isStableUnderBaseChange: not stated here; needs fibre
--   products of adic spaces (supplier: AdicSpaces Layer 5)

/-- R0/finite-type-morphism-classes, ring-level core of `locallyOfWeaklyFiniteType_spa_iff`:
between discrete rings, topologically of finite type is of finite type (Wedhorn
Example 6.32(1)). -/
theorem locallyOfWeaklyFiniteType_spa_iff_ring {A B : Type*} [CommRing A] [TopologicalSpace A]
    [DiscreteTopology A] [NonarchimedeanRing A] [CommRing B] [TopologicalSpace B]
    [DiscreteTopology B] (φ : A →+* B) : IsTopologicallyFiniteType φ ↔ φ.FiniteType := sorry

/- Ring-level core: `ℚ_p → ℚ_p⟨T⟩` is topologically of finite type. The geometric statement needs
the category of adic spaces (supplier: AdicSpaces Layer 5). -/
-- test locallyOfFiniteType_test_disc (computation) [R0/finite-type-morphism-classes]
example (p : ℕ) [Fact p.Prime] :
    IsTopologicallyFiniteType (algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :=
  sorry

-- plusWeaklyFiniteType_not_finiteType_test: not stated here; needs the anchor's pair-level
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5) [non-example test]

/- Ring-level core; the geometric statement (matching Mathlib's
`AlgebraicGeometry.LocallyOfFiniteType` for `Spec B → Spec A`) needs adic spaces (supplier:
AdicSpaces Layer 5). -/
-- test locallyOfWeaklyFiniteType_discrete_iff (compatibility) [R0/finite-type-morphism-classes]
example {A B : Type*} [CommRing A] [TopologicalSpace A] [DiscreteTopology A]
    [NonarchimedeanRing A] [CommRing B] [TopologicalSpace B] [DiscreteTopology B]
    (φ : A →+* B) : IsTopologicallyFiniteType φ ↔ φ.FiniteType := sorry

-- locallyOfWeaklyFiniteType_id: not stated here; needs identities and open immersions of adic
--   spaces (supplier: AdicSpaces Layer 5) [degenerate test]

/- Ring-level core: `ℤ_p → ℤ_p⟦T⟧` (`(p, T)`-adic) is not topologically of finite type, not being
adic. -/
-- test not_locallyOfWeaklyFiniteType_test (non-example) [R0/finite-type-morphism-classes]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ¬ IsTopologicallyFiniteType (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) := sorry

/-! ## AdicSpacesPartII:R0/plus-weakly-finite-type (definition) -/

/-- R0/plus-weakly-finite-type, affinoid core of `LocallyOfPlusWeaklyFiniteType`: a morphism of
Huber pairs `f : (A, A⁺) → (B, B⁺)` is of +weakly finite type if `f` is topologically of finite
type and `B⁺` is the integral closure of the subring generated by `f(A⁺)`, a finite set `E` and
`B°°`. -/
def LocallyOfPlusWeaklyFiniteType_affinoid {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (f : Pair.Hom S T) : Prop :=
  IsTopologicallyFiniteType f.toRingHom ∧
    ∃ E : Finset B, T.plus = (integralClosure
      (Subring.closure (f.toRingHom '' S.plus ∪ ↑E ∪ {b : B | IsTopologicallyNilpotent b})) B).toSubring

-- AdicSpace.LocallyOfPlusWeaklyFiniteType: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5). Its affinoid core is
--   `AdicSpace.LocallyOfPlusWeaklyFiniteType_affinoid`.
-- AdicSpace.IsPlusWeaklyFiniteType: not stated here; needs quasi-compact morphisms of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType: not stated here; needs the
--   anchor's `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfPlusWeaklyFiniteType.locallyOfWeaklyFiniteType: listed under
--   R0/finite-type-morphism-classes above.
-- AdicSpace.LocallyOfPlusWeaklyFiniteType.comp: not stated here; needs the category of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfPlusWeaklyFiniteType.restrict: not stated here; needs open subspaces of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfPlusWeaklyFiniteType.isStableUnderBaseChange: not stated here; needs fibre
--   products of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsPlusWeaklyFiniteType.isWeaklyFiniteType: not stated here; needs quasi-compact
--   morphisms of adic spaces (supplier: AdicSpaces Layer 5)

/- Ring-level core: `(ℚ_p, ℤ_p) → (ℚ_p⟨T⟩, ℚ_p⟨T⟩°)` is of +weakly finite type (`E = {T}`). -/
-- test plusWeaklyFiniteType_test_disc (computation) [R0/plus-weakly-finite-type]
example (p : ℕ) [Fact p.Prime] (f : Pair.Hom (Pair.powerBounded ℚ_[p])
    (Pair.powerBounded (restrictedMvPowerSeriesCompletion 1 ℚ_[p])))
    (hf : f.toRingHom = algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    LocallyOfPlusWeaklyFiniteType_affinoid f := sorry

-- plusWeaklyFiniteType_not_finiteType: not stated here; needs the anchor's pair-level
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5) [non-example test]
-- plusWeaklyFiniteType_iff_finiteType_over_field: not stated here; needs the anchor's pair-level
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5) [characterisation test]

/- Ring-level core: the identity of a Huber pair is of +weakly finite type (`E = ∅`). -/
-- test plusWeaklyFiniteType_id (degenerate) [R0/plus-weakly-finite-type]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (S : Pair A) : LocallyOfPlusWeaklyFiniteType_affinoid (Pair.Hom.id S) := sorry

/-! ## AdicSpacesPartII:R0/locally-finite-presentation (definition) -/

-- AdicSpace.LocallyOfFinitePresentation: not stated here; needs the category of adic spaces and
--   the anchor's pair-level topologically-finite-type morphisms (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfFinitePresentation.locallyOfFiniteType: not stated here; needs the anchor's
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5)
-- AdicSpace.locallyOfFinitePresentation_iff_of_isAnalytic: not stated here; needs analytic adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.locallyOfFinitePresentation_iff_of_discrete_noetherian: not stated here; needs the
--   category of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfFinitePresentation.comp: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfFinitePresentation.restrict: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.LocallyOfFinitePresentation.of_isOpenImmersion: not stated here; needs open
--   immersions of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.locallyOfFinitePresentation_spa_iff: not stated here; needs `Spa` of discrete pairs
--   as adic spaces (supplier: AdicSpaces Layer 5); on rings it is Mathlib's
--   `RingHom.FinitePresentation`
-- AdicSpace.LocallyOfFinitePresentation.isStableUnderBaseChange: not stated here; needs fibre
--   products of adic spaces (supplier: AdicSpaces Layer 5)
-- locallyOfFinitePresentation_test_hypersurface: not stated here; needs the adic space
--   `Spa(ℚ_p⟨T, S⟩/(TS − p))` (supplier: AdicSpaces Layer 5) [computation test]
-- locallyOfFinitePresentation_discrete_iff: not stated here; needs `Spa` of discrete pairs as
--   adic spaces (supplier: AdicSpaces Layer 5) [compatibility test]

/- Ring-level core: `ℤ[T₁, T₂, …] → ℤ[T₁, T₂, …]/(T₁, T₂, …)` is of finite type and not finitely
presented. -/
-- test locallyOfFiniteType_not_finitePresentation_discrete (non-example)
--   [R0/locally-finite-presentation]
example :
    (Ideal.Quotient.mk (Ideal.span (Set.range (MvPolynomial.X : ℕ → MvPolynomial ℕ ℤ)))).FiniteType ∧
      ¬ (Ideal.Quotient.mk
        (Ideal.span (Set.range (MvPolynomial.X : ℕ → MvPolynomial ℕ ℤ)))).FinitePresentation :=
  sorry

-- locallyOfFinitePresentation_iff_of_isAnalytic: not stated here; needs analytic adic spaces
--   (supplier: AdicSpaces Layer 5) [characterisation test]
-- locallyOfFinitePresentation_id: not stated here; needs identities and open immersions of adic
--   spaces (supplier: AdicSpaces Layer 5) [degenerate test]

/-! ## AdicSpacesPartII:R0/locally-noetherian-adic-space (definition) -/

-- AdicSpace.IsLocallyNoetherian: not stated here; needs adic spaces with their open affinoids
--   (supplier: AdicSpaces Layer 5). Its local condition is `Huber.IsNoetherianType`.
-- AdicSpace.IsLocallyNoetherian.exists_affinoid: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsLocallyNoetherian.spa: not stated here; needs `Spa` of sheafy pairs as adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyNoetherian.affinoid_basis: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsLocallyNoetherian.of_isOpenImmersion: not stated here; needs open immersions of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyNoetherian.of_locallyOfWeaklyFiniteType: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `Huber.IsNoetherianType.of_isTopologicallyFiniteType`.
-- AdicSpace.IsLocallyNoetherian.of_isClosedImmersion: not stated here; needs closed immersions
--   of adic spaces (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `Huber.IsNoetherianType.quotient`.
-- AdicSpace.IsLocallyNoetherian.isStablySheafy: not stated here; needs the anchor's
--   `IsStablySheafyRing` (supplier: AdicSpaces Layer 4)
-- AdicSpace.isLocallyNoetherian_iff_of_isAnalytic: not stated here; needs analytic adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyNoetherian.pullback: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `Huber.Pair.completedTensor.isNoetherianType`.

/- Ring-level core: `ℚ_p⟨T⟩` is of noetherian type. -/
-- test isLocallyNoetherian_test_disc (computation) [R0/locally-noetherian-adic-space]
example (p : ℕ) [Fact p.Prime] :
    IsNoetherianType (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

-- isLocallyNoetherian_test_formal: not stated here; needs the adic space `Spa(ℤ_p⟦T⟧)`
--   (supplier: AdicSpaces Layer 5); its ring-level core is the test
--   isNoetherianType_padicPowerSeries [computation test]
-- not_isLocallyNoetherian_test_perfectoid: not stated here; needs perfectoid fields and
--   `K⟨T^{1/p^∞}⟩` (supplier: PerfectoidSpaces:P1) [non-example test]

/- Ring-level core: every discrete ring, such as `ℤ[T₁, T₂, …]`, is of noetherian type. -/
-- test isLocallyNoetherian_test_discrete (degenerate) [R0/locally-noetherian-adic-space]
example :
    letI : TopologicalSpace (MvPolynomial ℕ ℤ) := ⊥
    haveI : DiscreteTopology (MvPolynomial ℕ ℤ) := ⟨rfl⟩
    ∃ _ : IsHuberRing (MvPolynomial ℕ ℤ), IsNoetherianType (MvPolynomial ℕ ℤ) := sorry

-- isLocallyNoetherian_iff_of_isAnalytic: not stated here; needs analytic adic spaces (supplier:
--   AdicSpaces Layer 5) [characterisation test]

/-! ## AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings (definition) -/

-- AdicSpace.closedSubspace: not stated here; needs adic spaces and admissible ideal sheaves on
--   them (supplier: AdicSpaces Layer 5). Its affinoid model is Tau Ceti's `Huber.Pair.quotient`.
-- AdicSpace.closedSubspace.ι: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.closedSubspace.range_ι: not stated here; needs adic spaces and stalks (supplier:
--   AdicSpaces Layer 5); affinoid-locally it is Tau Ceti's `Pair.Hom.range_spaComap_quotientHom`
-- AdicSpace.closedSubspace.affinoidIso: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.closedSubspace.lift: not stated here; needs adic spaces and ideal sheaves (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.closedSubspace.isClosedImmersion_ι: not stated here; needs the anchor's closed
--   immersions (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsClosedImmersion.isoClosedSubspace: not stated here; needs the anchor's closed
--   immersions (supplier: AdicSpaces Layer 5)
-- AdicSpace.closedSubspace.pullback: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyClosedImmersion: not stated here; needs open and closed immersions of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyClosedImmersion.of_isOpenImmersion: not stated here; needs open immersions
--   of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsLocallyClosedImmersion.comp: not stated here; needs the category of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.closedSubspace.isLocallyNoetherian: not stated here; needs adic spaces (supplier:
--   AdicSpaces Layer 5); ring-level core `Huber.IsNoetherianType.quotient`
-- AdicSpace.closedSubspace.locallyOfFiniteType_ι: not stated here; needs the anchor's
--   `LocallyOfFiniteType` (supplier: AdicSpaces Layer 5)
-- closedSubspace_test_origin: not stated here; needs the closed subspace `V(T)` of the adic disc
--   (supplier: AdicSpaces Layer 5) [computation test]
-- closedSubspace_test_nonreduced: not stated here; needs closed subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5) [non-example test]
-- closedSubspace_test_not_closed_ideal: not stated here; needs admissible ideal sheaves on adic
--   spaces (supplier: AdicSpaces Layer 5) [non-example test]

/- Affinoid core: the image of `Spa` of the quotient pair is `{v : J ⊆ supp v}`. -/
-- test closedSubspace_affinoid_compat (compatibility) [R0/closed-adic-subspaces-and-embeddings]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (S : Pair A) (J : Ideal A) :
    Set.range (S.quotientHom J).spaComap = Subtype.val ⁻¹' {v : ValuationSpectrum A | J ≤ v.supp} :=
  sorry

/- Affinoid core: `V(0) = X`, that is, `Spa(A/0) → Spa A` is surjective. -/
-- test closedSubspace_test_zero (degenerate) [R0/closed-adic-subspaces-and-embeddings]
example {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
    (S : Pair A) : Function.Surjective (S.quotientHom ⊥).spaComap := sorry

/-! ## AdicSpacesPartII:R0/diagonal-locally-closed (lemma) -/

-- AdicSpace.isLocallyClosedImmersion_diagonal: not stated here; needs fibre products and
--   locally closed immersions of adic spaces (supplier: AdicSpaces Layer 5)

end AdicSpace

end TauCeti

end

noncomputable section

namespace TauCeti


/-! ## AdicSpacesPartII:R0/separated-morphism (definition)

Separated morphism of adic spaces. -/

-- AdicSpace.IsSeparated: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.IsSeparated.isClosed_range_diagonal: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [projection]
-- AdicSpace.IsSeparated.iff_isClosedImmersion_diagonal: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [characterisation]
-- AdicSpace.IsSeparated.of_isAffinoid: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [example]
-- AdicSpace.IsSeparated.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsSeparated.of_comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [other]
-- AdicSpace.IsSeparated.baseChange: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsSeparated.of_isOpenImmersion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [instance]
-- AdicSpace.IsSeparated.isAffinoid_inter: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [other]
-- AdicSpace.IsSeparated.iff_valuativeCriterion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- IsSeparated_test_closedDisc: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation test]
-- IsSeparated_test_doubledOrigin: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- IsSeparated_test_id: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [degenerate test]
-- IsSeparated_test_diagonal_closedImmersion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [compatibility test]

/-! ## AdicSpacesPartII:R0/universally-closed-morphism (definition)

Universally closed morphism of adic spaces. -/

-- AdicSpace.UniversallyClosed: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.UniversallyClosed.isClosedMap: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [projection]
-- AdicSpace.UniversallyClosed.baseChange: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [functoriality]
-- AdicSpace.UniversallyClosed.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.UniversallyClosed.universallySpecializing: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.UniversallyClosed.of_universallySpecializing_of_quasiCompact: not stated here; needs
--   adic spaces and their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.UniversallyClosed.of_isClosedImmersion: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [instance]
-- UniversallyClosed_test_id: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [degenerate
--   test]
-- UniversallyClosed_test_closedDisc: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- UniversallyClosed_test_specializing: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [compatibility
--   test]

/-! ## AdicSpacesPartII:R0/universally-closed-and-proper-morphism (definition)

Proper morphism of adic spaces. -/

-- AdicSpace.IsProper: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.IsProper.toIsSeparated: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- AdicSpace.IsProper.toUniversallyClosed: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [projection]
-- AdicSpace.IsProper.quasiCompact: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- AdicSpace.IsProper.comp: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsProper.baseChange: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsProper.iff_isPartiallyProper_and_quasiCompact: not stated here; needs adic spaces
--   and their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [characterisation]
-- AdicSpace.IsProper.iff_valuativeCriterion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.IsFinite.isProper: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [instance]
-- AdicSpace.IsProper.isFinite_of_locallyQuasiFinite: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [relation]
-- AdicSpace.IsProper.isClosedMap: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- IsProper_test_closedDisc: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example test]
-- IsProper_test_projectiveLine: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [computation
--   test]
-- IsProper_test_openDisc: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example test]
-- IsProper_test_finite: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [degenerate test]
-- IsProper_test_mathlib_shape: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [compatibility
--   test]

/-! ## AdicSpacesPartII:R0/universally-specializing-morphism (definition)

Universally specializing morphism of adic spaces. -/

-- AdicSpace.SpecializingAt: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.UniversallySpecializingAt: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.UniversallySpecializing: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.specializingAt_forall_iff: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.UniversallySpecializing.baseChange: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [functoriality]
-- AdicSpace.UniversallySpecializing.comp: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [functoriality]
-- AdicSpace.UniversallyClosed.universallySpecializing: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.UniversallySpecializingAt.iff_valuativeCriterion: not stated here; needs adic spaces
--   and their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [characterisation]
-- UniversallySpecializing_test_closedEmbedding: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [degenerate test]
-- UniversallySpecializing_test_discInP1: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [non-example test]
-- UniversallySpecializing_test_specializingMap: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [compatibility test]
-- UniversallySpecializing_test_openDisc: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [computation test]

/-! ## AdicSpacesPartII:R0/partially-proper-morphism (definition)

Partially proper morphism of adic spaces. -/

-- AdicSpace.IsPartiallyProper: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.IsPartiallyProper.toIsSeparated: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [projection]
-- AdicSpace.IsPartiallyProper.universallySpecializing: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- AdicSpace.IsPartiallyProper.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsPartiallyProper.baseChange: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [functoriality]
-- AdicSpace.IsProper.isPartiallyProper: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [relation]
-- AdicSpace.IsPartiallyProper.isProper_of_quasiCompact: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.IsPartiallyProper.iff_valuativeCriterion: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.IsPartiallyProper.isCompact_closure: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [other]
-- IsPartiallyProper_test_openDisc: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [computation
--   test]
-- IsPartiallyProper_test_closedDisc: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- IsPartiallyProper_test_id: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [degenerate
--   test]
-- IsPartiallyProper_test_proper: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [compatibility
--   test]

/-! ## AdicSpacesPartII:R0/adic-valuation-rings-and-centres (definition)

Valuation rings of an analytic adic space and their centres. -/

/- The affinoid, ring-level core of `AdicSpace.ValuationRing`: for `X = Spa(A, A⁺)` the residue
field `k(x)` is replaced by `Frac(A ⧸ supp x)` (Tau Ceti `ValuationSpectrum.residueFieldValuation`),
which has the same valuation ring residue field, so that the pairs `(x, V)` are the same. -/
namespace AdicSpace

open TauCeti.Huber TauCeti.ValuationSpectrum

/-- R0/adic-valuation-rings-and-centres (affinoid core of `AdicSpace.ValuationRing`): for a Huber
pair `(A, A⁺)`, a pair `(x, V)` of a point `x ∈ Spa(A, A⁺)` and a valuation ring `V` of the
residue field `k(x) = Frac(A ⧸ supp x)` contained in the valuation ring `k(x)⁺` of `v_x`
(Huber 1996, 1.3.5). The geometric `AdicSpace.ValuationRing X` glues these. -/
structure ValuationRing_affinoid {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] (S : Pair A) where
  /-- R0/adic-valuation-rings-and-centres: the point `x ∈ Spa(A, A⁺)`. -/
  pt : spa S.plus
  /-- R0/adic-valuation-rings-and-centres: the valuation ring `V` of `k(x)`. -/
  ring : ValuationSubring (pt.1.supp.ResidueField)
  /-- R0/adic-valuation-rings-and-centres: `V ⊆ k(x)⁺`, so `(x, V)` describes specialisations. -/
  le_plus : ring ≤ (residueFieldValuation pt.1).valuationSubring

end AdicSpace

-- AdicSpace.ValuationRing: not stated here; needs adic spaces with the residue affinoid fields
--   κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5); the affinoid core is
--   `AdicSpace.ValuationRing_affinoid` [structure]
-- AdicSpace.ValuationRing.affinoidField: not stated here; needs adic spaces with the residue
--   affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [constructor]
-- AdicSpace.ValuationRing.IsCentre: not stated here; needs adic spaces with the residue affinoid
--   fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [relation]
-- AdicSpace.ValuationRing.IsCentre.specializes: not stated here; needs adic spaces with the
--   residue affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [other]
-- AdicSpace.ValuationRing.isCentre_iff_of_isAffinoid: not stated here; needs adic spaces with the
--   residue affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5)
--   [characterisation]
-- AdicSpace.ValuationRing.map: not stated here; needs adic spaces with the residue affinoid fields
--   κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.ValuationRing.self_isCentre: not stated here; needs adic spaces with the residue
--   affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [simp]
-- AdicSpace.ValuationRing.instTopologicalSpace: not stated here; needs adic spaces with the
--   residue affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [instance]
-- AdicSpace.ValuationRing.continuous_fst: not stated here; needs adic spaces with the residue
--   affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [projection]
-- ValuationRing_test_trivial: not stated here; needs adic spaces with the residue affinoid fields
--   κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [degenerate test]
-- ValuationRing_test_gaussPoint: not stated here; needs adic spaces with the residue affinoid
--   fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [computation test]
-- ValuationRing_test_notGeneralisation: not stated here; needs adic spaces with the residue
--   affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [non-example test]
-- ValuationRing_test_affinoidCentre: not stated here; needs adic spaces with the residue affinoid
--   fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5) [characterisation test]

/-! ## AdicSpacesPartII:R0/valuative-criterion-separated (lemma)

Valuative criterion for separatedness (Huber 1.3.7). -/

-- AdicSpace.IsSeparated.iff_valuativeCriterion: not stated here; needs adic spaces, their fibre
--   products and the residue affinoid fields κ(x) (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/valuative-criterion-specializing (lemma)

Valuative criterion for universal specialization (Huber 1.3.8). -/

-- AdicSpace.UniversallySpecializingAt.iff_valuativeCriterion: not stated here; needs adic spaces,
--   their fibre products and the residue affinoid fields κ(x) (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/separated-proper-partially-proper (theorem)

Valuative criterion for partial properness and properness of analytic adic spaces (Huber 1.3.9). -/

-- AdicSpace.IsPartiallyProper.iff_valuativeCriterion: not stated here; needs adic spaces, their
--   fibre products and the residue affinoid fields κ(x) (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsProper.iff_valuativeCriterion: not stated here; needs adic spaces, their fibre
--   products and the residue affinoid fields κ(x) (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/proper-iff-partially-proper-quasi-compact (lemma)

Proper equals partially proper and quasi-compact (Huber 1.3.4). -/

-- AdicSpace.IsProper.iff_isPartiallyProper_and_quasiCompact: not stated here; needs adic spaces
--   and their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/valuation-ring-space-spectral (lemma)

The space of valuation rings of a qcqs analytic adic space is spectral (Huber 1.3.12). -/

-- AdicSpace.ValuationRing.spectralSpace: not stated here; needs adic spaces with the residue
--   affinoid fields κ(x) and ι_x : Spa κ(x) → X (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/partially-proper-closure-quasi-compact (lemma)

Closures of quasi-compact sets under partially proper morphisms (Huber 1.3.13). -/

-- AdicSpace.IsPartiallyProper.isCompact_closure: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/separated-diagonal-closed-embedding (lemma)

The diagonal of a separated morphism is a closed embedding. -/

-- AdicSpace.IsSeparated.iff_isClosedImmersion_diagonal: not stated here; needs adic spaces, their
--   fibre products and closed embeddings (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.IsClosedImmersion.of_isLocallyClosedImmersion_of_isClosed_range: not stated here;
--   needs adic spaces, their fibre products and closed embeddings (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)

/-! ## AdicSpacesPartII:R0/closed-embedding-proper (lemma)

Closed embeddings are proper. -/

-- AdicSpace.IsProper.of_isClosedImmersion: not stated here; needs adic spaces, their fibre
--   products and closed embeddings (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)

/-! ## AdicSpacesPartII:R0/proper-base-change (lemma)

Universally closed, separated and proper morphisms are stable under adic base change. -/

-- AdicSpace.IsProper.baseChange: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.UniversallyClosed.baseChange: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsSeparated.baseChange: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/proper-comp (lemma)

Composites of universally closed, separated and proper morphisms. -/

-- AdicSpace.IsProper.comp: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.UniversallyClosed.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsSeparated.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/proper-of-comp-separated (lemma)

Cancellation: g ∘ h proper and g separated imply h proper. -/

-- AdicSpace.IsProper.of_comp: not stated here; needs adic spaces, their fibre products and closed
--   embeddings (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.UniversallyClosed.of_comp: not stated here; needs adic spaces, their fibre products
--   and closed embeddings (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)

/-! ## AdicSpacesPartII:R0/universally-closed-of-surjective (lemma)

Universal closedness descends along surjections. -/

-- AdicSpace.UniversallyClosed.of_surjective_of_comp: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsProper.of_surjective_of_comp: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/finite-huber-pair-hom (definition)

Finite morphism of complete Huber pairs. -/

namespace Huber

section FiniteHom

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]

/-- R0/finite-huber-pair-hom (structure): a morphism `φ : (A, A⁺) → (B, B⁺)` of Huber pairs is
*finite* (Huber 1996, (1.4.2)) if it is topologically of finite type (Tau Ceti
`IsTopologicallyFiniteType`, Wedhorn 6.29) and both `A → B` and `A⁺ → B⁺` are integral. The
notion is used for complete Huber pairs; it is stated for all Huber pairs so that it applies to
`Pair.quotientHom`. The plus condition of Huber's "topologically of finite type" for affinoid
rings follows from the integrality of `A⁺ → B⁺` (`Pair.Hom.IsFinite.plus_eq_integralClosure`). -/
structure Pair.Hom.IsFinite {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop where
  /-- R0/finite-huber-pair-hom (projection): `φ` is topologically of finite type. -/
  isTopologicallyFiniteType : IsTopologicallyFiniteType φ.toRingHom
  /-- R0/finite-huber-pair-hom: the ring map `A → B` is integral. -/
  isIntegral : φ.toRingHom.IsIntegral
  /-- R0/finite-huber-pair-hom (projection `Huber.Pair.Hom.IsFinite.isIntegral_plus`): the ring map
  `A⁺ → B⁺` is integral. -/
  isIntegral_plus : (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).IsIntegral

variable {S : Pair A} {T : Pair B} {U : Pair C}

/-- R0/finite-huber-pair-hom (characterisation): for a finite morphism, `B⁺` is the integral
closure of `φ(A⁺)` in `B`. -/
theorem Pair.Hom.IsFinite.plus_eq_integralClosure {φ : Pair.Hom S T} (hφ : φ.IsFinite) :
    T.plus = (integralClosure (S.plus.map φ.toRingHom) B).toSubring := sorry

/-- R0/finite-huber-pair-hom (example): the quotient morphism `S → S.quotient J`
(Tau Ceti `Pair.quotientHom`) is finite for a closed ideal `J` of a complete Huber ring; the
completeness of `A` is the hypothesis `hA`, for the canonical uniformity. -/
theorem Pair.Hom.IsFinite.quotientHom
    (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A)) [T2Space A]
    (S : Pair A) (J : Ideal A) (hJ : IsClosed (J : Set A)) :
    (Pair.quotientHom S J).IsFinite := sorry

/- `(K, K⁺) → (K, K°)` for `K⁺ ⊊ K°`: the ring map is the identity, but `K°` is not integral over
the integrally closed `K⁺`. Stated for every Huber ring and every strict inclusion of plus rings;
the spectral picture is the open, non-closed embedding `Spa(K, K°) → Spa(K, K⁺)`. -/
-- test Pair.Hom.IsFinite_test_plusNotIntegral (non-example) [R0/finite-huber-pair-hom]
example {S S' : Pair A} (hSS' : S.plus < S'.plus) (φ : Pair.Hom S S')
    (hφ : φ.toRingHom = RingHom.id A) : ¬ φ.IsFinite := sorry

end FiniteHom

section FiniteHomComplete

variable {A B C : Type*}
  [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [CompleteSpace A]
  [T2Space A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [CompleteSpace B]
  [T2Space B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [CompleteSpace C]
  [T2Space C]

section Huber

variable [IsHuberRing A] [IsHuberRing B] [IsHuberRing C] {S : Pair A} {T : Pair B} {U : Pair C}

/-- R0/finite-huber-pair-hom (projection): the target of a finite morphism of complete Huber
pairs is a finite module over the source (Huber 1996, (1.4.2)). -/
theorem Pair.Hom.IsFinite.finite {φ : Pair.Hom S T} (hφ : φ.IsFinite) : φ.toRingHom.Finite :=
  sorry

/-- R0/finite-huber-pair-hom (instance): the identity of a complete Huber pair is finite
(completeness is needed: Tau Ceti's `IsTopologicallyFiniteType` presents the target as a quotient
of a completed ring). -/
theorem Pair.Hom.IsFinite.id (S : Pair A) : (Pair.Hom.id S).IsFinite := sorry

/-- R0/finite-huber-pair-hom (functoriality): composites of finite morphisms are finite. -/
theorem Pair.Hom.IsFinite.comp {φ : Pair.Hom S T} {ψ : Pair.Hom T U} (hψ : ψ.IsFinite)
    (hφ : φ.IsFinite) : (ψ.comp φ).IsFinite := sorry

-- test Pair.Hom.IsFinite_test_quotient (degenerate) [R0/finite-huber-pair-hom]
example (S : Pair A) (J : Ideal A) (hJ : IsClosed (J : Set A)) :
    (Pair.quotientHom S J).IsFinite ∧ (Pair.Hom.id S).IsFinite := sorry

end Huber

/-- R0/finite-huber-pair-hom (characterisation): if `A` is Tate, the topology of the target of a
finite morphism of complete pairs is the natural `A`-module topology (Mathlib
`IsModuleTopology`). -/
theorem Pair.Hom.IsFinite.isModuleTopology [IsTateRing A] [IsHuberRing B] {S : Pair A}
    {T : Pair B} {φ : Pair.Hom S T} (hφ : φ.IsFinite) :
    letI := φ.toRingHom.toAlgebra
    IsModuleTopology A B := sorry

section Tate

variable [IsTateRing A] [IsTateRing B] {S : Pair A} {T : Pair B}

/-- R0/finite-huber-pair-hom (characterisation): for complete Tate pairs, `φ` is finite if and
only if `A → B` is module-finite and `A⁺ → B⁺` is integral (Zavyalov, B.2.8–B.2.9). -/
theorem Pair.Hom.isFinite_iff_finite_and_isIntegral (φ : Pair.Hom S T) :
    φ.IsFinite ↔ φ.toRingHom.Finite ∧
      (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).IsIntegral := sorry

/-- R0/finite-huber-pair-hom (other): a finite morphism of complete Tate pairs that is bijective
on rings is an isomorphism of Huber pairs (Zavyalov, B.2.11). -/
theorem Pair.Hom.IsFinite.isIso_of_bijective {φ : Pair.Hom S T} (hφ : φ.IsFinite)
    (hbij : Function.Bijective φ.toRingHom) :
    ∃ ψ : Pair.Hom T S, ψ.comp φ = Pair.Hom.id S ∧ φ.comp ψ = Pair.Hom.id T := sorry

-- test Pair.Hom.IsFinite_test_mathlib (compatibility) [R0/finite-huber-pair-hom]
example (φ : Pair.Hom S T) :
    letI : Algebra S.plus T.plus := (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).toAlgebra
    φ.IsFinite ↔ φ.toRingHom.Finite ∧ Algebra.IsIntegral S.plus T.plus := sorry

end Tate

end FiniteHomComplete

/- `(ℚ_p, ℤ_p) → (ℚ_p(√p), ℤ_p[√p])`: the target is described by its properties — a degree-two
field extension `L` of `ℚ_p` with its natural topology, containing `π` with `π² = p`, with plus
ring generated by `ℤ_p` and `π`. -/
-- test Pair.Hom.IsFinite_test_ramified (computation) [R0/finite-huber-pair-hom]
example (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [Algebra ℚ_[p] L] [UniformSpace L]
    [IsUniformAddGroup L] [IsTopologicalRing L] [IsHuberRing L] [CompleteSpace L] [T2Space L]
    [IsModuleTopology ℚ_[p] L] (hL : Module.finrank ℚ_[p] L = 2) (π : L)
    (hπ : π ^ 2 = algebraMap ℚ_[p] L p) (T' : Pair L)
    (hT' : T'.plus = Subring.closure
      (algebraMap ℚ_[p] L '' (Pair.powerBounded ℚ_[p]).plus ∪ {π}))
    (φ : Pair.Hom (Pair.powerBounded ℚ_[p]) T') (hφ : φ.toRingHom = algebraMap ℚ_[p] L) :
    φ.IsFinite := sorry

/- `(K, K°) → (K⟨T⟩, K°⟨T⟩)` for `K = ℚ_p`: topologically of finite type, not finite. -/
-- test Pair.Hom.IsFinite_test_tateAlgebra (non-example) [R0/finite-huber-pair-hom]
example (p : ℕ) [Fact p.Prime] (T' : Pair (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (φ : Pair.Hom (Pair.powerBounded ℚ_[p]) T')
    (hφ : φ.toRingHom = algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    IsTopologicallyFiniteType φ.toRingHom ∧ ¬ φ.IsFinite := sorry

end Huber

/-! ## AdicSpacesPartII:R0/finite-morphism (definition)

Finite morphism of adic spaces. -/

-- AdicSpace.IsFinite: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence); the affinoid core is
--   `Huber.Pair.Hom.IsFinite` (R0/finite-huber-pair-hom) [structure]
-- AdicSpace.IsFinite.of_spa: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [constructor]
-- AdicSpace.IsFinite.isAffinoid_preimage: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.IsFinite.quasiCompact: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- AdicSpace.IsFinite.comp: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsFinite.baseChange: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.IsFinite.of_isClosedImmersion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [instance]
-- AdicSpace.IsFinite.isProper: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.IsFinite.iff_isProper_and_quasiFinite: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.IsFinite.locallyQuasiFinite: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [relation]
-- AdicSpace.IsFinite.of_faithfullyFlat_baseChange: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [other]
-- IsFinite_test_squaring: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [computation test]
-- IsFinite_test_rationalEmbedding: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- IsFinite_test_genericPoint: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- IsFinite_test_closedImmersion: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [degenerate
--   test]
-- IsFinite_test_affinoid: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [compatibility test]

/-! ## AdicSpacesPartII:R0/finite-algebra-over-affinoid (construction)

The Huber pair of a finite algebra over a noetherian affinoid ring. -/

namespace Huber

section FiniteAlgebra

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A]
  (C : Type*) [CommRing C] [Algebra A C] [Module.Finite A C] [TopologicalSpace C]
  [IsModuleTopology A C] [IsTopologicalRing C] [IsHuberRing C]

/- Throughout, `C` is a finite `A`-algebra carrying its natural topology, in Mathlib's mixin form
`[TopologicalSpace C] [IsModuleTopology A C]`. Such a `C` is a topological ring
(`IsModuleTopology.isTopologicalRing`) and, under the noetherian hypothesis `hA` of the
construction, a Huber ring (`Pair.finiteAlgebra.isHuberRing`); these two facts are carried as the
instance arguments `[IsTopologicalRing C] [IsHuberRing C]`. The noetherian hypothesis is the
explicit disjunction `hA`: `A` is a noetherian Tate ring, or `A` has a noetherian ring of
definition. -/

omit [IsTopologicalRing C] [IsHuberRing C] in
/-- R0/finite-algebra-over-affinoid (i): a finite algebra `C` with its natural topology over a
complete Huber ring `A` satisfying the noetherian hypothesis is a Huber ring. -/
theorem Pair.finiteAlgebra.isHuberRing
    (hA : (IsTateRing A ∧ IsNoetherianRing A) ∨
      ∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) :
    haveI := IsModuleTopology.isTopologicalRing A C
    IsHuberRing C := sorry

/-- R0/finite-algebra-over-affinoid (constructor): the Huber pair `(C, C⁺)` on a finite algebra
`C` over a complete Huber pair `(A, A⁺)` satisfying the noetherian hypothesis: natural topology,
and `C⁺` the integral closure of the image of `A⁺` (`Pair.finiteAlgebra_plus`). -/
def Pair.finiteAlgebra (S : Pair A)
    (hA : (IsTateRing A ∧ IsNoetherianRing A) ∨
      ∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) : Pair C := sorry

omit [IsHuberRing A] [IsHuberRing C] in
/-- R0/finite-algebra-over-affinoid (instance): `C` is Tate if `A` is. -/
theorem Pair.finiteAlgebra.isTateRing [IsTateRing A] : IsTateRing C := sorry

/-- R0/finite-algebra-over-affinoid (instance, (v)): `C` is strongly noetherian if `A` is a
strongly noetherian Tate ring. -/
theorem Pair.finiteAlgebra.isStronglyNoetherian (hTate : IsTateRing A) [IsStronglyNoetherian A] :
    IsStronglyNoetherian C := sorry

variable (S : Pair A) (hA : (IsTateRing A ∧ IsNoetherianRing A) ∨
  ∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition)

/-- R0/finite-algebra-over-affinoid (projection): `C⁺` is the integral closure of `ψ(A⁺)`. -/
theorem Pair.finiteAlgebra_plus :
    (Pair.finiteAlgebra C S hA).plus =
      (integralClosure (S.plus.map (algebraMap A C)) C).toSubring := sorry

omit [Module.Finite A C] [TopologicalSpace C] [IsModuleTopology A C] [IsTopologicalRing C]
  [IsHuberRing C] in
/-- R0/finite-algebra-over-affinoid (instance): the natural topology of the construction is
Mathlib's `moduleTopology A C`, which is a module topology in Mathlib's sense. -/
theorem Pair.finiteAlgebra.isModuleTopology :
    @IsModuleTopology A _ C _ _ (moduleTopology A C) := sorry

include hA in
/-- R0/finite-algebra-over-affinoid (instance): under the noetherian hypothesis, `C` is complete
and Hausdorff for its canonical uniformity. -/
theorem Pair.finiteAlgebra.completeSpace :
    @CompleteSpace C (IsTopologicalAddGroup.rightUniformSpace C) ∧ T2Space C := sorry

omit [IsTopologicalRing C] [IsHuberRing C] in
include hA in
/-- R0/finite-algebra-over-affinoid (other): under the noetherian hypothesis, every
`A`-submodule of `C` is closed. -/
theorem Pair.finiteAlgebra.isClosed_submodule (N : Submodule A C) : IsClosed (N : Set C) := sorry

/-- R0/finite-algebra-over-affinoid: the structure morphism `(A, A⁺) → (C, C⁺)` of Huber pairs,
with underlying map `algebraMap A C`. -/
def Pair.finiteAlgebra.algebraHom : Pair.Hom S (Pair.finiteAlgebra C S hA) := sorry

/-- R0/finite-algebra-over-affinoid (relation, (iii)): `(A, A⁺) → (C, C⁺)` is finite in the sense
of R0/finite-huber-pair-hom. -/
theorem Pair.finiteAlgebra.algebraMap_isFinite :
    (Pair.finiteAlgebra.algebraHom C S hA).IsFinite := sorry

/-- R0/finite-algebra-over-affinoid (universal property, (iv)): for a complete Huber pair
`(D, D⁺)` under `(A, A⁺)` (a structure morphism `χ` with underlying map `algebraMap A D`),
morphisms of Huber pairs `(C, C⁺) → (D, D⁺)` under `(A, A⁺)` are the `A`-algebra maps `C → D`. -/
def Pair.finiteAlgebra.homEquiv {D : Type*} [CommRing D] [UniformSpace D] [IsUniformAddGroup D]
    [IsTopologicalRing D] [IsHuberRing D] [CompleteSpace D] [T2Space D] [Algebra A D]
    (V : Pair D) (χ : Pair.Hom S V) (hχ : χ.toRingHom = algebraMap A D) :
    {g : Pair.Hom (Pair.finiteAlgebra C S hA) V //
      g.toRingHom.comp (algebraMap A C) = algebraMap A D} ≃ (C →ₐ[A] D) := sorry

variable {C} in
/-- R0/finite-algebra-over-affinoid (functoriality): an `A`-algebra map `C → C'` of finite
`A`-algebras is a morphism of the Huber pairs; `map` preserves identities and composition. -/
def Pair.finiteAlgebra.map {C' : Type*} [CommRing C'] [Algebra A C'] [Module.Finite A C']
    [TopologicalSpace C'] [IsModuleTopology A C'] [IsTopologicalRing C'] [IsHuberRing C']
    (f : C →ₐ[A] C') : Pair.Hom (Pair.finiteAlgebra C S hA) (Pair.finiteAlgebra C' S hA) := sorry

omit [TopologicalSpace C] [IsModuleTopology A C] [IsTopologicalRing C] [IsHuberRing C]
  [Module.Finite A C] in
/-- R0/finite-algebra-over-affinoid (compatibility): for an ideal `J` of `A` (closed, by the
noetherian hypothesis), the construction on `A ⧸ J` is Tau Ceti's quotient pair
`Pair.quotient S J`. -/
theorem Pair.finiteAlgebra_quotient (J : Ideal A) :
    Pair.finiteAlgebra (A ⧸ J) S hA = S.quotient J := sorry

omit [TopologicalSpace C] [IsModuleTopology A C] [IsTopologicalRing C] [IsHuberRing C]
  [Module.Finite A C] in
-- test finiteAlgebra_test_self (degenerate) [R0/finite-algebra-over-affinoid]
example : Pair.finiteAlgebra A S hA = S := sorry

omit [TopologicalSpace C] [IsModuleTopology A C] [IsTopologicalRing C] [IsHuberRing C]
  [Module.Finite A C] in
/- The ring `K⟨X₁, X₂, …⟩` of restricted power series in countably many variables is not in the
pinned libraries; the test states the mechanism it exhibits: for an ideal that is not closed, the
natural (quotient) topology of the finite algebra `A ⧸ J` is not Hausdorff, so no complete Huber
pair structure exists on it and the noetherian hypothesis cannot be dropped. -/
-- test finiteAlgebra_test_nonClosedIdeal (non-example) [R0/finite-algebra-over-affinoid]
example (J : Ideal A) (hJ : ¬ IsClosed (J : Set A)) : ¬ T2Space (A ⧸ J) := sorry

omit [TopologicalSpace C] [IsModuleTopology A C] [IsTopologicalRing C] [IsHuberRing C]
  [Module.Finite A C] in
-- test finiteAlgebra_test_quotient (compatibility) [R0/finite-algebra-over-affinoid]
example (J : Ideal A) :
    (Pair.finiteAlgebra (A ⧸ J) S hA).plus = (S.quotient J).plus ∧
      (Pair.finiteAlgebra (A ⧸ J) S hA).plus =
        (integralClosure (S.plus.map (Ideal.Quotient.mk J)) (A ⧸ J)).toSubring := sorry

-- test finiteAlgebra_test_homEquiv (characterisation) [R0/finite-algebra-over-affinoid]
example {D : Type*} [CommRing D] [UniformSpace D] [IsUniformAddGroup D] [IsTopologicalRing D]
    [IsHuberRing D] [CompleteSpace D] [T2Space D] [Algebra A D] (V : Pair D)
    (hV : ∀ a ∈ S.plus, algebraMap A D a ∈ V.plus) (hcont : Continuous (algebraMap A D)) :
    Nonempty ({g : Pair.Hom (Pair.finiteAlgebra C S hA) V //
      g.toRingHom.comp (algebraMap A C) = algebraMap A D} ≃ (C →ₐ[A] D)) := sorry

end FiniteAlgebra

end Huber

/- `A = ℚ_p⟨T⟩`, `C = A[U]/(U² − T) ≅ ℚ_p⟨U⟩` with `T ↦ U²`: `C` is described by a basis
`1, u` over `A` with `u² = T`. -/
-- test finiteAlgebra_test_squareRoot (computation) [R0/finite-algebra-over-affinoid]
example (p : ℕ) [Fact p.Prime] (C : Type) [CommRing C]
    [Algebra (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) C]
    [Module.Finite (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) C] [TopologicalSpace C]
    [IsModuleTopology (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) C] [IsTopologicalRing C]
    [Huber.IsHuberRing C] (u : C)
    (hu : u ^ 2 = algebraMap _ C
      ((Huber.weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) Huber.isWeightFamily_one_weight 0 :
        Huber.weightedRestrictedSubring _ _) : Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (b : Module.Basis (Fin 2) (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) C)
    (hb0 : b 0 = 1) (hb1 : b 1 = u)
    (S : Huber.Pair (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (hS : S.plus = Huber.powerBoundedSubring (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (hA : (Huber.IsTateRing (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
      IsNoetherianRing (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p])) ∨
      ∃ P : Huber.PairOfDefinition (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]),
        IsNoetherianRing P.ringOfDefinition) :
    ∃ e : C ≃+* Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p], Continuous e ∧ Continuous e.symm ∧
      e u = ((Huber.weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p]))
        Huber.isWeightFamily_one_weight 0 : Huber.weightedRestrictedSubring _ _) :
          Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
      (Huber.Pair.finiteAlgebra C S hA).plus.map e.toRingHom =
        Huber.powerBoundedSubring (Huber.restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

-- AdicSpace.IsFinite.exists_finiteAlgebra: not stated here; needs adic spaces and their affinoid
--   opens (supplier: AdicSpaces Layer 5); the ring side is `Huber.Pair.finiteAlgebra`
--   [equivalence]

/-! ## AdicSpacesPartII:R0/finiteness-criterion-monic-relations (lemma)

Finiteness from monic relations with topologically nilpotent values (Huber 1.4.3). -/

namespace Huber

/-- R0/finiteness-criterion-monic-relations (Huber 1996, 1.4.3): let `φ : (A, A⁺) → (B, B⁺)` be a
morphism of complete Tate pairs presented by a quotient mapping `π : A⟨T₁, …, Tₙ⟩ → B` over `A`,
with `B⁺` the integral closure of `π(A⁺⟨T⟩)`, the closure of `φ(A⁺)[t₁, …, tₙ]`, `tᵢ = π(Tᵢ)`.
Then `φ` is finite if and only if each `tᵢ` satisfies a monic polynomial over `A⁺` whose value
is topologically nilpotent. -/
theorem Pair.Hom.isFinite_iff_monic_topologicallyNilpotent {A B : Type*} [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A]
    [T2Space A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
    [IsTateRing B] [CompleteSpace B] [T2Space B] {S : Pair A} {T : Pair B} (φ : Pair.Hom S T)
    {n : ℕ} (π : restrictedMvPowerSeriesCompletion n A →+* B) (hπ : IsOpenQuotientMap π)
    (hcomp : π.comp (algebraMap A (restrictedMvPowerSeriesCompletion n A)) = φ.toRingHom)
    (hplus : T.plus = (integralClosure (Subring.closure (φ.toRingHom '' S.plus ∪
      Set.range fun i ↦ π ((weightedX (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight i :
        weightedRestrictedSubring _ _) : restrictedMvPowerSeriesCompletion n A))).topologicalClosure
      B).toSubring) :
    φ.IsFinite ↔ ∀ i : Fin n, ∃ q : Polynomial S.plus, q.Monic ∧
      IsTopologicallyNilpotent (q.eval₂ (φ.toRingHom.comp S.plus.subtype)
        (π ((weightedX (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight i :
          weightedRestrictedSubring _ _) : restrictedMvPowerSeriesCompletion n A))) := sorry

end Huber

/-! ## AdicSpacesPartII:R0/finite-morphisms (theorem)

Finite morphisms are proper (Huber 1.4.5(ii)). -/

-- AdicSpace.IsFinite.isProper: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/closed-embedding-finite (lemma)

Closed embeddings are finite (Huber 1.4.5(iii)). -/

-- AdicSpace.IsFinite.of_isClosedImmersion: not stated here; needs adic spaces and their closed
--   embeddings (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)

/-! ## AdicSpacesPartII:R0/fibre-nilpotence-spreading (lemma)

Topological nilpotence in a fibre spreads to a rational neighbourhood (Huber 1.4.8). -/

-- AdicSpace.exists_rational_isTopologicallyNilpotent_of_fibre: not stated here; needs affinoid
--   adic spaces, their rational subsets and the fibres X ×_Y Spa κ(y) (supplier: AdicSpaces Layer
--   5, AdicSpacesPartII:R0/affinoid-fibre-product)

/-! ## AdicSpacesPartII:R0/finite-from-proper-fibre (lemma)

Finiteness near a point with proper fibre (Huber 1.4.6-1.4.7). -/

-- AdicSpace.IsFinite.exists_nhds_of_isProper_fibre: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsProper.isFinite_of_isAffinoid: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/finiteness-faithfully-flat-descent (lemma)

Finiteness descends along finite faithfully flat affinoid covers (Huber 1.4.9). -/

-- AdicSpace.IsFinite.of_faithfullyFlat_baseChange: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/finite-algebra-tensor-complete (lemma)

Base change of a finite algebra over a complete Tate ring needs no completion. -/

namespace Huber

open scoped TensorProduct

section FiniteTensor

variable {A B C : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
  [IsTopologicalRing B] [CompleteSpace B] [T2Space B] [CommRing C] [UniformSpace C]
  [IsUniformAddGroup C] [IsTopologicalRing C] [CompleteSpace C] [T2Space C]
  [Algebra A B] [Algebra A C]

/-- R0/finite-algebra-tensor-complete (i): for a finite morphism `φ : (A, A⁺) → (B, B⁺)` of
complete Tate pairs with underlying map `algebraMap A B` and a continuous `A → C` to a complete
Tate ring, the tensor-product topology (`tensorTopology` of R0/completed-tensor-product) on the
finite `C`-module `C ⊗_A B` is its natural `C`-module topology. -/
theorem Pair.Hom.IsFinite.isModuleTopology_tensorTopology [IsTateRing A] [IsTateRing B]
    [IsTateRing C] {S : Pair A} {T : Pair B} {φ : Pair.Hom S T} (hφ : φ.IsFinite)
    (hφA : φ.toRingHom = algebraMap A B) (hC : Continuous (algebraMap A C)) :
    @IsModuleTopology C _ (C ⊗[A] B) _ _ (tensorTopology A C B) := sorry

/-- R0/finite-algebra-tensor-complete (ii): if `A` and `C` are noetherian, or `B` is a finite
projective `A`-module, then `C ⊗_A B` is Hausdorff and complete for the tensor-product topology,
so the canonical map to the completed tensor product `CompletedTensor A C B` is bijective (an
isomorphism of topological rings), and `(C, C⁺) → (C ⊗_A B, C⁺ ⊗ B⁺ integrally closed)` is a
finite morphism of complete Huber pairs. -/
theorem Pair.Hom.IsFinite.bijective_completedTensor_tmul [IsTateRing A] [IsTateRing B]
    [IsTateRing C] {S : Pair A} {T : Pair B} {φ : Pair.Hom S T} (hφ : φ.IsFinite)
    (hφA : φ.toRingHom = algebraMap A B) (hC : Continuous (algebraMap A C))
    (h : (IsNoetherianRing A ∧ IsNoetherianRing C) ∨ Module.Projective A B) :
    @T2Space _ (tensorTopology A C B) ∧ @CompleteSpace _ (tensorUniformSpace A C B) ∧
      Function.Bijective (Pair.completedTensor.tmul A C B) := sorry

end FiniteTensor

end Huber

-- Huber.Pair.Hom.IsFinite.tensor_rationalLocalization (part (iii)): not stated here; needs the
--   completed rational localisations A⟨f/g⟩, B⟨φ(f)/φ(g)⟩ as complete Huber rings (supplier:
--   AdicSpaces Layer 3, AdicSpacesPartII:R0/completed-tensor-rational-localisation)

/-! ## AdicSpacesPartII:R0/quasi-finite-morphism (definition)

Locally quasi-finite and quasi-finite morphisms of adic spaces. -/

-- AdicSpace.LocallyQuasiFinite: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.QuasiFinite: not stated here; needs adic spaces and their fibre products (supplier:
--   AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [structure]
-- AdicSpace.LocallyQuasiFinite.isDiscrete_preimage_singleton: not stated here; needs adic spaces
--   and their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence) [projection]
-- AdicSpace.QuasiFinite.finite_preimage_singleton: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.LocallyQuasiFinite.comp: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [functoriality]
-- AdicSpace.LocallyQuasiFinite.baseChange: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [functoriality]
-- AdicSpace.IsFinite.quasiFinite: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [relation]
-- AdicSpace.LocallyQuasiFinite.of_isOpenImmersion: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [instance]
-- AdicSpace.LocallyQuasiFinite.iff_finite_stalk: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [characterisation]
-- AdicSpace.IsFinite.iff_isProper_and_quasiFinite: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [relation]
-- AdicSpace.Unramified.locallyQuasiFinite: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [relation]
-- LocallyQuasiFinite_test_squaring: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [computation
--   test]
-- LocallyQuasiFinite_test_projection: not stated here; needs adic spaces and their fibre products
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence) [non-example
--   test]
-- LocallyQuasiFinite_test_infiniteDisjointUnion: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [non-example test]
-- LocallyQuasiFinite_test_openImmersion: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [degenerate test]
-- LocallyQuasiFinite_test_finiteAlgebra: not stated here; needs adic spaces and their fibre
--   products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
--   [compatibility test]

/-! ## AdicSpacesPartII:R0/quasi-finite-fibre-criteria (lemma)

Fibre criteria for quasi-finiteness (Huber 1.5.2). -/

-- AdicSpace.QuasiFinite.iff_finite_preimage_singleton: not stated here; needs adic spaces and
--   their fibre products (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/quasi-finite-stalk-criterion (lemma)

Stalk criterion for local quasi-finiteness (Huber 1.5.4). -/

-- AdicSpace.LocallyQuasiFinite.iff_finite_stalk: not stated here; needs adic spaces and the stalks
--   of O_X (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/quasi-finite-and-finiteness-criteria (theorem)

Quasi-finite and proper equals finite (Huber 1.5.5). -/

-- AdicSpace.IsFinite.iff_isProper_and_quasiFinite: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/partially-proper-quasi-finite-local-finiteness (lemma)

Partially proper locally quasi-finite morphisms are finite near closures of points (Huber 1.5.6). -/

-- AdicSpace.IsPartiallyProper.locallyQuasiFinite_iff: not stated here; needs adic spaces and their
--   fibre products (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R0/continuous-differentials (construction)

Module of continuous differentials of a topologically finite type map. -/

namespace Huber

section ContinuousKaehler

open scoped TensorProduct

universe u v

/-- R0/continuous-differentials (constructor): the module of continuous differentials
`Ωᶜ[B⁄A] = I / I²`, where `I` is the kernel of the continuous extension
`B ⊗̂_A B → B` of the multiplication to the completed tensor product of
R0/completed-tensor-product (Huber 1996, (1.6.2)). It is a `B`-module through
`(B ⊗̂_A B) ⧸ I ≅ B` and carries the natural `B`-module topology
(`ContinuousKaehlerDifferential.instTopologicalSpace`). It is meant for `A → B` topologically of
finite type between complete Huber rings, the hypothesis of every result below; the carrier is
left as `sorry` because the completed tensor product is built in R0 part a. -/
def ContinuousKaehlerDifferential (A : Type u) (B : Type v) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] [Algebra A B] : Type v := sorry

variable (A : Type u) (B : Type v) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [Algebra A B]

/-- R0/continuous-differentials: the additive group structure of `Ωᶜ[B⁄A]`. -/
instance ContinuousKaehlerDifferential.instAddCommGroup :
    AddCommGroup (ContinuousKaehlerDifferential A B) := sorry

/-- R0/continuous-differentials: the `B`-module structure of `Ωᶜ[B⁄A]`. -/
instance ContinuousKaehlerDifferential.instModule :
    Module B (ContinuousKaehlerDifferential A B) := sorry

/-- R0/continuous-differentials: the `A`-module structure of `Ωᶜ[B⁄A]`, restricted along
`A → B`. -/
instance ContinuousKaehlerDifferential.instModuleBase :
    Module A (ContinuousKaehlerDifferential A B) := sorry

/-- R0/continuous-differentials: the two module structures are compatible. -/
instance ContinuousKaehlerDifferential.instIsScalarTower :
    IsScalarTower A B (ContinuousKaehlerDifferential A B) := sorry

/-- R0/continuous-differentials: the natural `B`-module topology on `Ωᶜ[B⁄A]`
(Mathlib `moduleTopology`). -/
instance ContinuousKaehlerDifferential.instTopologicalSpace :
    TopologicalSpace (ContinuousKaehlerDifferential A B) := moduleTopology B _

/-- R0/continuous-differentials (data): the derivation `d : B → Ωᶜ[B⁄A]`,
`b ↦ [1 ⊗ b − b ⊗ 1]`. -/
def ContinuousKaehlerDifferential.D : Derivation A B (ContinuousKaehlerDifferential A B) := sorry

/-- R0/continuous-differentials (other): `d` is continuous for the natural topology. -/
theorem ContinuousKaehlerDifferential.continuous_D :
    Continuous (ContinuousKaehlerDifferential.D A B) := sorry

/-- R0/continuous-differentials (compatibility): the `B`-linear map `Ω[B⁄A] → Ωᶜ[B⁄A]` from
Mathlib's Kähler differentials induced by the derivation `d`; it is surjective when `A → B` is
topologically of finite type. -/
def ContinuousKaehlerDifferential.fromKaehler :
    Ω[B⁄A] →ₗ[B] ContinuousKaehlerDifferential A B :=
  (ContinuousKaehlerDifferential.D A B).liftKaehlerDifferential

/-- R0/continuous-differentials (functoriality): a commutative square of continuous maps
`A → B`, `A' → B'` (`A → A'`, `B → B'`) induces the `B'`-linear map
`B' ⊗_B Ωᶜ[B⁄A] → Ωᶜ[B'⁄A']`, `b' ⊗ d b ↦ b' · d b`; it preserves identities and composition. -/
def ContinuousKaehlerDifferential.map (A' B' : Type*) [CommRing A'] [TopologicalSpace A']
    [IsTopologicalRing A'] [IsHuberRing A'] [CommRing B'] [TopologicalSpace B']
    [IsTopologicalRing B'] [IsHuberRing B'] [Algebra A' B'] [Algebra A A'] [Algebra B B']
    [Algebra A B'] [IsScalarTower A A' B'] [IsScalarTower A B B']
    (hA' : Continuous (algebraMap A A')) (hB' : Continuous (algebraMap B B')) :
    B' ⊗[B] ContinuousKaehlerDifferential A B →ₗ[B'] ContinuousKaehlerDifferential A' B' := sorry

end ContinuousKaehler

section ContinuousKaehlerComplete

open scoped TensorProduct

variable {A B : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B]
  [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
  [Algebra A B]

variable (A B) in
/-- R0/continuous-differentials (universal property): for `A → B` topologically of finite type,
a complete Hausdorff topological `B`-module `M` and a continuous `A`-derivation `D' : B → M`, the
continuous `B`-linear map `u : Ωᶜ[B⁄A] → M` with `u ∘ d = D'`
(`ContinuousKaehlerDifferential.lift_comp_D`). -/
def ContinuousKaehlerDifferential.lift (h : IsTopologicallyFiniteType (algebraMap A B))
    {M : Type*} [AddCommGroup M] [Module A M] [Module B M] [IsScalarTower A B M] [UniformSpace M]
    [IsUniformAddGroup M] [ContinuousSMul B M] [CompleteSpace M] [T2Space M]
    (D' : Derivation A B M) (hD' : Continuous D') :
    ContinuousKaehlerDifferential A B →L[B] M := sorry

/-- R0/continuous-differentials (simp): `lift D' ∘ d = D'`. -/
theorem ContinuousKaehlerDifferential.lift_comp_D (h : IsTopologicallyFiniteType (algebraMap A B))
    {M : Type*} [AddCommGroup M] [Module A M] [Module B M] [IsScalarTower A B M] [UniformSpace M]
    [IsUniformAddGroup M] [ContinuousSMul B M] [CompleteSpace M] [T2Space M]
    (D' : Derivation A B M) (hD' : Continuous D') (b : B) :
    ContinuousKaehlerDifferential.lift A B h D' hD' (ContinuousKaehlerDifferential.D A B b) =
      D' b := sorry

/-- R0/continuous-differentials (extensionality): two continuous `B`-linear maps out of
`Ωᶜ[B⁄A]` that agree on `d(B)` are equal. -/
theorem ContinuousKaehlerDifferential.hom_ext (h : IsTopologicallyFiniteType (algebraMap A B))
    {M : Type*} [AddCommGroup M] [Module B M] [TopologicalSpace M]
    {f g : ContinuousKaehlerDifferential A B →L[B] M}
    (hfg : ∀ b, f (ContinuousKaehlerDifferential.D A B b) =
      g (ContinuousKaehlerDifferential.D A B b)) :
    f = g := sorry

/-- R0/continuous-differentials (other, (a)): if `N ⊆ B` is finite and `A[N]` is dense in `B`,
the `d n` (`n ∈ N`) generate `Ωᶜ[B⁄A]`; in particular `Ωᶜ[B⁄A]` is a finitely generated
`B`-module. -/
theorem ContinuousKaehlerDifferential.fg (h : IsTopologicallyFiniteType (algebraMap A B))
    (N : Finset B) (hN : Dense (Algebra.adjoin A (N : Set B) : Set B)) :
    Submodule.span B (ContinuousKaehlerDifferential.D A B '' (N : Set B)) = ⊤ := sorry

variable (A) in
/-- R0/continuous-differentials (example, (c)): the basis `(d Xᵢ)` of `Ωᶜ[A⟨X⟩_M⁄A]` for the
completed restricted power series `A⟨X₁, …, Xₙ⟩_M` with weights `M` (Tau Ceti
`weightedRestrictedSubring`); its value on `i` is `ContinuousKaehlerDifferential.D` of the
variable `Xᵢ`. -/
def ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis {n : ℕ} (M : Fin n → Set A)
    (hM : IsWeightFamily M) :
    Module.Basis (Fin n) (UniformSpace.Completion (weightedRestrictedSubring M hM))
      (ContinuousKaehlerDifferential A
        (UniformSpace.Completion (weightedRestrictedSubring M hM))) := sorry

variable (A) in
/-- R0/continuous-differentials: the basis vectors are the differentials `d Xᵢ`. -/
theorem ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis_apply {n : ℕ}
    (M : Fin n → Set A) (hM : IsWeightFamily M) (i : Fin n) :
    ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis A M hM i =
      ContinuousKaehlerDifferential.D A _
        ((weightedX M hM i : weightedRestrictedSubring M hM) :
          UniformSpace.Completion (weightedRestrictedSubring M hM)) := sorry

/-- R0/continuous-differentials (characterisation, (c)): for a quotient mapping
`π : A⟨X⟩_M → B` over `A` with kernel `𝔞`,
`Ωᶜ[B⁄A] ≅ (⊕ᵢ B dXᵢ) ⧸ ⟨∑ᵢ π(∂P/∂Xᵢ) dXᵢ : P ∈ 𝔞⟩`; the partial derivatives are the
coordinates of `d P` in `restrictedMvPowerSeriesBasis`. -/
def ContinuousKaehlerDifferential.presentationEquiv {n : ℕ} (M : Fin n → Set A)
    (hMfin : ∀ i, (M i).Finite) (hM : IsWeightFamily M)
    (π : UniformSpace.Completion (weightedRestrictedSubring M hM) →+* B) (hπ : IsOpenQuotientMap π)
    (hπA : π.comp (algebraMap A _) = algebraMap A B) :
    ContinuousKaehlerDifferential A B ≃ₗ[B] (Fin n → B) ⧸ Submodule.span B
      (Set.range fun P : RingHom.ker π ↦ fun i ↦ π
        ((ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis A M hM).repr
          (ContinuousKaehlerDifferential.D A _ (P : UniformSpace.Completion _)) i)) := sorry

/-- R0/continuous-differentials (compatibility, (d)): if `A → B` is topologically of finite type
and `B` is a finite `A`-module,
`Ω[B⁄A] → Ωᶜ[B⁄A]` is bijective (Huber 1996, (1.6.2)(iii)). -/
theorem ContinuousKaehlerDifferential.fromKaehler_bijective_of_finite [Module.Finite A B]
    (h : IsTopologicallyFiniteType (algebraMap A B)) :
    Function.Bijective (ContinuousKaehlerDifferential.fromKaehler A B) := sorry

/-- R0/continuous-differentials (instance): if `B` is noetherian, `Ωᶜ[B⁄A]` is Hausdorff and
complete for its canonical uniformity. -/
theorem ContinuousKaehlerDifferential.t2Space_of_isNoetherianRing
    (h : IsTopologicallyFiniteType (algebraMap A B)) [IsNoetherianRing B] :
    T2Space (ContinuousKaehlerDifferential A B) ∧
      ∃ _ : IsTopologicalAddGroup (ContinuousKaehlerDifferential A B),
        @CompleteSpace _ (IsTopologicalAddGroup.rightUniformSpace
          (ContinuousKaehlerDifferential A B)) := sorry

/-- R0/continuous-differentials (compatibility): for `A → A'` adic and `A → B` topologically of
finite type, `Ωᶜ[(B ⊗̂_A A')⁄A'] ≅ (B ⊗̂_A A') ⊗_B Ωᶜ[B⁄A]` (Huber 1996, 1.6.3), with the
completed tensor product `CompletedTensor A B A'` of R0/completed-tensor-product and its structure
maps from `A'` and `B`. -/
def ContinuousKaehlerDifferential.baseChangeEquiv (A' : Type*) [CommRing A'] [TopologicalSpace A']
    [IsTopologicalRing A'] [IsHuberRing A'] [Algebra A A'] [IsAdicHom (algebraMap A A')]
    [IsAdicHom (algebraMap A B)] (h : IsTopologicallyFiniteType (algebraMap A B)) :
    letI : Algebra A' (CompletedTensor A B A') := ((Pair.completedTensor.tmul A B A').comp
      Algebra.TensorProduct.includeRight.toRingHom).toAlgebra
    letI : Algebra B (CompletedTensor A B A') := ((Pair.completedTensor.tmul A B A').comp
      Algebra.TensorProduct.includeLeftRingHom).toAlgebra
    ContinuousKaehlerDifferential A' (CompletedTensor A B A') ≃ₗ[CompletedTensor A B A']
      CompletedTensor A B A' ⊗[B] ContinuousKaehlerDifferential A B := sorry

-- test ContinuousKaehlerDifferential_test_surjective (degenerate) [R0/continuous-differentials]
example (hs : Function.Surjective (algebraMap A B)) (ho : IsOpenMap (algebraMap A B)) :
    Subsingleton (ContinuousKaehlerDifferential A B) ∧
      Subsingleton (ContinuousKaehlerDifferential A A) := sorry

end ContinuousKaehlerComplete

section ContinuousKaehlerTests

open UniformSpace

-- test ContinuousKaehlerDifferential_test_tateAlgebra (computation) [R0/continuous-differentials]
example (p : ℕ) [Fact p.Prime] :
    Module.Free (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (ContinuousKaehlerDifferential ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) ∧
      Module.finrank (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (ContinuousKaehlerDifferential ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) = 1 :=
  sorry

-- test ContinuousKaehlerDifferential_test_notAlgebraic (non-example) [R0/continuous-differentials]
example (p : ℕ) [Fact p.Prime] :
    ¬ Module.Finite (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        Ω[restrictedMvPowerSeriesCompletion 1 ℚ_[p]⁄ℚ_[p]] ∧
      Nonempty (ContinuousKaehlerDifferential ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        ≃ₗ[restrictedMvPowerSeriesCompletion 1 ℚ_[p]] restrictedMvPowerSeriesCompletion 1 ℚ_[p]) :=
  sorry

/- `A = ℚ_p⟨S⟩ → B = ℚ_p⟨T⟩`, `S ↦ T²`: `B` is described as a complete Huber `A`-algebra with an
`A`-basis `1, t` and `t² = S`. -/
-- test ContinuousKaehlerDifferential_test_finite (compatibility) [R0/continuous-differentials]
example (p : ℕ) [Fact p.Prime] (B : Type) [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
    [Algebra (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) B]
    (hc : Continuous (algebraMap (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) B))
    (X : restrictedMvPowerSeriesCompletion 1 ℚ_[p])
    (hX : X = ((weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) isWeightFamily_one_weight 0 :
      weightedRestrictedSubring _ _) : restrictedMvPowerSeriesCompletion 1 ℚ_[p])) (t : B)
    (ht : algebraMap _ B X = t ^ 2)
    (b : Module.Basis (Fin 2) (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) B) (hb0 : b 0 = 1)
    (hb1 : b 1 = t) :
    Function.Bijective
        (ContinuousKaehlerDifferential.fromKaehler (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) B) ∧
      Nonempty (ContinuousKaehlerDifferential (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) B ≃ₗ[B]
        B ⧸ Ideal.span {2 * t}) := sorry

/- Continuous `ℚ_p`-derivations of `ℚ_p⟨T⟩` are the `g · d/dT`: a continuous derivation is
determined by its value at `T`, and every value occurs. -/
-- test ContinuousKaehlerDifferential_test_derivations (characterisation)
--   [R0/continuous-differentials]
example (p : ℕ) [Fact p.Prime] (X : restrictedMvPowerSeriesCompletion 1 ℚ_[p])
    (hX : X = ((weightedX (fun _ : Fin 1 ↦ ({1} : Set ℚ_[p])) isWeightFamily_one_weight 0 :
      weightedRestrictedSubring _ _) : restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    Function.Bijective fun D : {D : Derivation ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])
        (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) // Continuous D} ↦ D.1 X := sorry

end ContinuousKaehlerTests

end Huber

-- Huber.ContinuousKaehlerDifferential.localizationEquiv: not stated here; needs the completed
--   rational localisation B⟨T/s⟩ as a complete Huber ring; Tau Ceti's
--   PairOfDefinition.completionLocObj carries no Huber-ring instance (supplier: AdicSpaces Layer
--   3) [compatibility]

/-! ## AdicSpacesPartII:R0/first-fundamental-sequence (lemma)

First fundamental exact sequence of continuous differentials (Huber 1.6.3). -/

namespace Huber

open scoped TensorProduct

/-- R0/first-fundamental-sequence (Huber 1996, 1.6.3): for `A → B → C` topologically of finite
type between complete Huber rings, `C ⊗_B Ωᶜ[B⁄A] → Ωᶜ[C⁄A] → Ωᶜ[C⁄B] → 0` is exact. The maps
are `ContinuousKaehlerDifferential.map`; the continuity hypotheses `hAA`, `hCC` of the identity
squares hold trivially. -/
theorem ContinuousKaehlerDifferential.exact_mapBaseChange_map (A B C : Type*) [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A]
    [T2Space A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
    [IsHuberRing B] [CompleteSpace B] [T2Space B] [CommRing C] [UniformSpace C]
    [IsUniformAddGroup C] [IsTopologicalRing C] [IsHuberRing C] [CompleteSpace C] [T2Space C]
    [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C]
    (hB : IsTopologicallyFiniteType (algebraMap A B))
    (hC : IsTopologicallyFiniteType (algebraMap B C))
    (hAB : Continuous (algebraMap A B)) (hBC : Continuous (algebraMap B C))
    (hAA : Continuous (algebraMap A A)) (hCC : Continuous (algebraMap C C)) :
    Function.Exact (ContinuousKaehlerDifferential.map A B A C hAA hBC)
        (ContinuousKaehlerDifferential.map A C B C hAB hCC ∘ₗ
          (TensorProduct.lid C (ContinuousKaehlerDifferential A C)).symm.toLinearMap) ∧
      Function.Surjective (ContinuousKaehlerDifferential.map A C B C hAB hCC ∘ₗ
          (TensorProduct.lid C (ContinuousKaehlerDifferential A C)).symm.toLinearMap) := sorry

end Huber

/-! ## AdicSpacesPartII:R0/conormal-sequence (lemma)

Conormal exact sequence for quotient mappings (Huber 1.6.3). -/

namespace Huber

open scoped TensorProduct

/-- R0/conormal-sequence (Huber 1996, 1.6.3): for `A → B` topologically of finite type between
complete Huber rings and a closed ideal `J ⊆ B`, `C = B ⧸ J`, the sequence
`J/J² → C ⊗_B Ωᶜ[B⁄A] → Ωᶜ[C⁄A] → 0`, with first map `j ↦ 1 ⊗ d j`, is exact. -/
theorem ContinuousKaehlerDifferential.exact_kerCotangentToTensor_mapBaseChange (A B : Type*)
    [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A]
    [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] [Algebra A B]
    (h : IsTopologicallyFiniteType (algebraMap A B)) (J : Ideal B) (hJ : IsClosed (J : Set B))
    (hA : Continuous (algebraMap A A)) (hq : Continuous (algebraMap B (B ⧸ J))) :
    ∃ δ : J.Cotangent →ₗ[B ⧸ J] (B ⧸ J) ⊗[B] ContinuousKaehlerDifferential A B,
      (∀ j : J, δ (J.toCotangent j) = 1 ⊗ₜ ContinuousKaehlerDifferential.D A B j) ∧
      Function.Exact δ (ContinuousKaehlerDifferential.map A B A (B ⧸ J) hA hq) ∧
      Function.Surjective (ContinuousKaehlerDifferential.map A B A (B ⧸ J) hA hq) := sorry

end Huber

/-! ## AdicSpacesPartII:R0/quasi-finite-stalk-differentials (lemma)

Stalks of continuous differentials of locally quasi-finite morphisms (Huber 1.6.4(i)). -/

-- AdicSpace.LocallyQuasiFinite.stalkKaehlerEquiv: not stated here; needs adic spaces, the stalks
--   of O_X and the sheaf Ω_{X/Y} (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R3/sheaf-of-continuous-differentials)

/-! ## AdicSpacesPartII:R0/flat-morphism (definition)

Flat morphism of adic spaces. -/

-- AdicSpace.Flat: not stated here; needs adic spaces and the stalks of O_X (supplier: AdicSpaces
--   Layer 5) [structure]
-- AdicSpace.Flat.flat_stalkMap: not stated here; needs adic spaces and the stalks of O_X
--   (supplier: AdicSpaces Layer 5) [projection]
-- AdicSpace.Flat.comp: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Flat.of_isOpenImmersion: not stated here; needs adic spaces and the stalks of O_X
--   (supplier: AdicSpaces Layer 5) [instance]
-- AdicSpace.Flat.flat_appTop_of_isStronglyNoetherian: not stated here; needs adic spaces and the
--   stalks of O_X (supplier: AdicSpaces Layer 5) [compatibility]
-- AdicSpace.Flat.of_flat_of_tateAlgebra: not stated here; needs adic spaces and the stalks of O_X
--   (supplier: AdicSpaces Layer 5) [compatibility]
-- AdicSpace.Flat.baseChange_of_locallyQuasiFinite: not stated here; needs adic spaces and the
--   stalks of O_X (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Etale.flat: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [relation]
-- AdicSpace.Smooth.flat: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [relation]
-- Flat_test_openImmersion: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- Flat_test_origin: not stated here; needs adic spaces and the stalks of O_X (supplier: AdicSpaces
--   Layer 5) [non-example test]
-- Flat_test_squaring: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [computation test]
-- Flat_test_ringLevel: not stated here; needs adic spaces and the stalks of O_X (supplier:
--   AdicSpaces Layer 5) [compatibility test]

/-! ## AdicSpacesPartII:R0/unramified-morphism (definition)

Unramified morphism of adic spaces. -/

/- The ring-level core of `AdicSpace.Unramified`, `AdicSpace.Smooth` and `AdicSpace.Etale` for
affinoid source and target: the infinitesimal lifting condition along the square-zero
thickenings `Spa(C ⧸ I) → Spa(C)` of complete Huber pairs `(C, C⁺)`, `I` closed with `I² = 0`.
A morphism `Spa(C, C⁺) → Spa(B, B⁺)` of affinoids is a morphism `(B, B⁺) → (C, C⁺)` of Huber
pairs, and restriction to `Spa(C ⧸ I)` is composition with `Pair.quotientHom`. The finiteness
conditions of the three classes ("locally of finite type", "locally of finite presentation")
belong to R0/finite-type-morphism-classes and R0/locally-finite-presentation and are not part of
these cores. The test pairs range over one universe `w`. -/
namespace AdicSpace

open TauCeti.Huber

section InfinitesimalLifting

universe w u₁ u₂

variable {A : Type u₁} {B : Type u₂} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B]
  [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
  {S : Pair A} {T : Pair B}

/-- R0/unramified-morphism (affinoid ring-level core of `AdicSpace.Unramified`): two morphisms
`g₁, g₂ : (B, B⁺) → (C, C⁺)` under `(A, A⁺)` that agree modulo a closed square-zero ideal `I`
of a complete Huber pair `(C, C⁺)` are equal. -/
def Unramified_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ g₁ g₂ : Pair.Hom T U, g₁.comp φ = g₂.comp φ →
      (Pair.quotientHom U I).comp g₁ = (Pair.quotientHom U I).comp g₂ → g₁ = g₂

/-- R0/smooth-morphism (affinoid ring-level core of `AdicSpace.Smooth`): every morphism
`(B, B⁺) → (C ⧸ I, (C ⧸ I)⁺)` under `(A, A⁺)`, for a closed square-zero ideal `I` of a complete
Huber pair `(C, C⁺)`, lifts to a morphism `(B, B⁺) → (C, C⁺)` under `(A, A⁺)`. -/
def Smooth_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃ g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- R0/differentials-unramified-smooth-etale (affinoid ring-level core of `AdicSpace.Etale`):
the lift of `AdicSpace.Smooth_affinoid` exists and is unique. -/
def Etale_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃! g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- R0/differentials-unramified-smooth-etale (affinoid core of
`AdicSpace.Etale.iff_smooth_and_unramified`). -/
theorem Etale.iff_smooth_and_unramified_affinoid (φ : Pair.Hom S T) :
    Etale_affinoid.{w} φ ↔ Smooth_affinoid.{w} φ ∧ Unramified_affinoid.{w} φ := sorry

/-- R0/unramified-morphism (affinoid core of
`AdicSpace.Unramified.iff_formallyUnramified_of_finite`): for a finite morphism of complete
Huber pairs with `A` a noetherian Tate ring, the lifting condition is Mathlib's formal
unramifiedness of `A → B`. -/
theorem Unramified.iff_formallyUnramified_of_finite_affinoid (hTate : IsTateRing A)
    [IsNoetherianRing A] (φ : Pair.Hom S T) (hφ : φ.IsFinite) :
    letI := φ.toRingHom.toAlgebra
    Unramified_affinoid.{max u₁ u₂} φ ↔ Algebra.FormallyUnramified A B := sorry

end InfinitesimalLifting

end AdicSpace

-- AdicSpace.Unramified: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5); the affinoid core is
--   `AdicSpace.Unramified_affinoid` [structure]
-- AdicSpace.Unramified.hom_ext: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [extensionality]
-- AdicSpace.Unramified.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Unramified.of_comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [other]
-- AdicSpace.Unramified.baseChange: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I)
--   → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [functoriality]
-- AdicSpace.Unramified.of_isImmersion: not stated here; needs adic spaces and the morphisms Spa(C
--   ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [instance]
-- AdicSpace.Unramified.iff_differentials_eq_zero: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5) [characterisation]
-- AdicSpace.Unramified.isOpenImmersion_diagonal: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5) [characterisation]
-- AdicSpace.Unramified.locallyQuasiFinite: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [relation]
-- AdicSpace.Unramified.iff_formallyUnramified_of_finite: not stated here; needs adic spaces and
--   the morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier:
--   AdicSpaces Layer 5); the affinoid core is
--   `AdicSpace.Unramified.iff_formallyUnramified_of_finite_affinoid` [compatibility]
-- Unramified_test_origin: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [non-example test]
-- Unramified_test_squaring: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [computation
--   test]
-- Unramified_test_id: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of
--   complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [degenerate test]
-- Unramified_test_finiteAlgebra: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [compatibility
--   test]

/-! ## AdicSpacesPartII:R0/smooth-morphism (definition)

Smooth morphism of adic spaces. -/

-- AdicSpace.Smooth: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of
--   complete Huber pairs as test objects (supplier: AdicSpaces Layer 5); the affinoid core is
--   `AdicSpace.Smooth_affinoid` [structure]
-- AdicSpace.Smooth.exists_lift: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [universal-property]
-- AdicSpace.Smooth.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Smooth.baseChange: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Smooth.restrictedPowerSeries: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [example]
-- AdicSpace.Smooth.differentials_locallyFree: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [other]
-- AdicSpace.Smooth.relativeDimension: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [data]
-- AdicSpace.Smooth.exists_etale_polydisc: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [characterisation]
-- AdicSpace.Smooth.isOpenMap: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [other]
-- AdicSpace.Smooth.flat: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [relation]
-- Smooth_test_polydisc: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [computation test]
-- Smooth_test_node: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of
--   complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [non-example test]
-- Smooth_test_notAlgebraSmooth: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [non-example
--   test]
-- Smooth_test_openImmersion: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [degenerate
--   test]
-- Smooth_test_discrete: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [compatibility test]

/-! ## AdicSpacesPartII:R0/differentials-unramified-smooth-etale (definition)

Étale morphism of adic spaces. -/

-- AdicSpace.Etale: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of
--   complete Huber pairs as test objects (supplier: AdicSpaces Layer 5); the affinoid core is
--   `AdicSpace.Etale_affinoid` [structure]
-- AdicSpace.Etale.iff_smooth_and_unramified: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5);
--   the affinoid core is `AdicSpace.Etale.iff_smooth_and_unramified_affinoid` [characterisation]
-- AdicSpace.Etale.lift: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [universal-property]
-- AdicSpace.Etale.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Etale.baseChange: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [functoriality]
-- AdicSpace.Etale.of_comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [other]
-- AdicSpace.Etale.of_isOpenImmersion: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [instance]
-- AdicSpace.Etale.exists_standardPresentation: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5) [characterisation]
-- AdicSpace.Etale.iff_flat_and_unramified: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
--   [characterisation]
-- AdicSpace.Etale.locallyQuasiFinite: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [relation]
-- AdicSpace.Etale.isOpenMap: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [other]
-- AdicSpace.Etale.exists_openImmersion_finiteEtale: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5) [characterisation]
-- AdicSpace.Etale.finiteEtaleEquiv: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5); the ring
--   side is `Huber.Pair.finiteAlgebra` [equivalence]
-- Etale_test_kummer: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of
--   complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [computation test]
-- Etale_test_rationalEmbedding: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [non-example
--   test]
-- Etale_test_frobenius: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [non-example test]
-- Etale_test_openImmersion: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [degenerate
--   test]
-- Etale_test_finiteEtaleAlgebra: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5) [compatibility
--   test]

/-! ## AdicSpacesPartII:R0/open-embedding-etale (lemma)

Open embeddings are étale (Huber 1.6.7). -/

-- AdicSpace.Etale.of_isOpenImmersion: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/immersion-unramified (lemma)

Locally closed embeddings are unramified (Huber 1.6.7). -/

-- AdicSpace.Unramified.of_mono: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Unramified.of_isImmersion: not stated here; needs adic spaces and the morphisms Spa(C
--   ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/restricted-power-series-smooth (lemma)

Relative polydiscs are smooth (Huber 1.6.7). -/

-- AdicSpace.Smooth.restrictedPowerSeries: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-smooth-composition (lemma)

Composites of unramified, smooth and étale morphisms (Huber 1.6.7). -/

-- AdicSpace.Etale.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Smooth.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C)
--   of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Unramified.comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-smooth-cancellation (lemma)

Cancellation for unramified, smooth and étale morphisms (Huber 1.6.7). -/

-- AdicSpace.Unramified.of_comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Etale.of_comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Smooth.of_comp: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-smooth-locality (lemma)

Unramified, smooth and étale are local on the source (Huber 1.6.7). -/

-- AdicSpace.Etale.of_openCover: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Unramified.of_openCover: not stated here; needs adic spaces and the morphisms Spa(C ⧸
--   I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Smooth.of_openCover: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/smooth-etale-base-change (lemma)

Base change of unramified, smooth and étale morphisms along any morphism for which the fibre product
exists (Huber 1996 (1.6.7); Kedlaya–Liu Lemma 8.2.17(c)). -/

-- AdicSpace.Unramified.baseChange, AdicSpace.Smooth.baseChange, AdicSpace.Etale.baseChange (the
--   statements of this node, listed with R0/unramified-morphism, R0/smooth-morphism and
--   R0/differentials-unramified-smooth-etale): not stated here; need adic spaces, their fibre
--   products and the test objects Spa(C ⧸ I) → Spa(C) of complete Huber pairs (supplier: AdicSpaces
--   Layer 5, AdicSpacesPartII:R0/fibre-products-existence). The chart-level input, the universal
--   property of `B ⊗̂_A C` against complete Huber pairs, is
--   `Huber.Pair.completedTensor.existsUnique_lift`.

/-! ## AdicSpacesPartII:R0/unramified-locally-quasi-finite (lemma)

Unramified morphisms are locally quasi-finite (Huber 1.7.4). -/

-- AdicSpace.Unramified.locallyQuasiFinite: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/infinitesimal-criteria (lemma)

Characterisations of unramified morphisms (Huber 1.6.8). -/

-- AdicSpace.Unramified.tfae: not stated here; needs adic spaces and the sheaf Ω_{X/Y} glued from
--   continuous differentials (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R3/sheaf-of-continuous-differentials)

/-! ## AdicSpacesPartII:R0/smooth-differentials-locally-free (lemma)

Continuous differentials of a smooth morphism are locally free (Huber 1.6.9(i)). -/

-- AdicSpace.Smooth.differentials_locallyFree: not stated here; needs adic spaces and the sheaf
--   Ω_{X/Y} glued from continuous differentials (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R3/sheaf-of-continuous-differentials)

/-! ## AdicSpacesPartII:R0/jacobian-criterion-closed-subspace (lemma)

Jacobian criterion for closed subspaces of smooth spaces (Huber 1.6.9(ii)). -/

-- AdicSpace.Etale.iff_exists_generators_basis: not stated here; needs adic spaces and the sheaf
--   Ω_{X/Y} glued from continuous differentials (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R3/sheaf-of-continuous-differentials)

/-! ## AdicSpacesPartII:R0/differential-criterion-morphism (lemma)

Differential criterion for étale and smooth morphisms between smooth spaces (Huber 1.6.9(iii)). -/

-- AdicSpace.Etale.iff_bijective_pullbackDifferentials: not stated here; needs adic spaces and the
--   sheaf Ω_{X/Y} glued from continuous differentials (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R3/sheaf-of-continuous-differentials)

/-! ## AdicSpacesPartII:R0/finite-etale-algebra-comparison (comparison)

Finite étale adic spaces over a noetherian affinoid are finite étale algebras (Huber 1.6.6(ii)). -/

-- AdicSpace.finiteEtaleEquiv: not stated here; needs adic spaces finite étale over Spa(A, A⁺) and
--   their category (supplier: AdicSpaces Layer 5); the ring side is `Huber.Pair.finiteAlgebra`

/-! ## AdicSpacesPartII:R0/algebraically-finite-type-ring-map (definition)

Morphisms of Huber pairs of algebraically finite type. -/

namespace Huber

section AlgebraicFiniteType

variable {A B C : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsHuberRing C]

/-- R0/algebraically-finite-type-ring-map: the polynomial ring `A[X₁, …, Xₙ]_M` with the subspace
topology of `A⟨X⟩_M` (Tau Ceti `weightedPolynomials`, the copy of `MvPolynomial (Fin n) A` inside
`weightedRestrictedSubring M hM`) is a Huber ring (Huber 1994, §3). -/
instance Pair.polynomialWeighted.isHuberRing {n : ℕ} (M : Fin n → Set A) (hM : IsWeightFamily M) :
    IsHuberRing (weightedPolynomials M hM) := sorry

/-- R0/algebraically-finite-type-ring-map (constructor): the Huber pair `A[X₁, …, Xₙ]_M` with the
topology induced from `A⟨X⟩_M` and plus ring the integral closure of `A⁺[m · Xᵢ : m ∈ Mᵢ]`. -/
def Pair.polynomialWeighted (S : Pair A) {n : ℕ} (M : Fin n → Set A) (hM : IsWeightFamily M) :
    Pair (weightedPolynomials M hM) where
  plus := (integralClosure (Subring.closure ((weightedPolynomialsEquiv hM).toRingHom ''
    (MvPolynomial.C '' (S.plus : Set A) ∪
      ⋃ i, (fun m ↦ MvPolynomial.C m * MvPolynomial.X i) '' M i))) _).toSubring
  isRingOfIntegralElements := sorry

/-- R0/algebraically-finite-type-ring-map (structure): a morphism `φ : (A, A⁺) → (B, B⁺)` of Huber
pairs is *of algebraically finite type* if it factors through a quotient mapping
`π : A[X₁, …, Xₙ]_M → B` — surjective, continuous, open, with `B⁺` the integral closure of the
image of the plus ring — for a finite weight family `M` (Huber 1996, 1.7.3(iii), Remark 1.2.6).
Completeness is not required. -/
def Pair.Hom.IsAlgebraicallyFiniteType {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop :=
  ∃ (n : ℕ) (M : Fin n → Set A) (_ : ∀ i, (M i).Finite) (hM : IsWeightFamily M)
    (π : Pair.Hom (S.polynomialWeighted M hM) T),
    Function.Surjective π.toRingHom ∧ IsOpenMap π.toRingHom ∧
      T.plus = (integralClosure ((S.polynomialWeighted M hM).plus.map π.toRingHom) B).toSubring ∧
      π.toRingHom.comp ((weightedPolynomialsEquiv hM).toRingHom.comp MvPolynomial.C) = φ.toRingHom

variable {S : Pair A} {T : Pair B} {U : Pair C}

/-- R0/algebraically-finite-type-ring-map (projection): the underlying ring map is of finite type
(Mathlib `RingHom.FiniteType`). -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.finiteType {φ : Pair.Hom S T}
    (hφ : φ.IsAlgebraicallyFiniteType) : φ.toRingHom.FiniteType := sorry

/-- R0/algebraically-finite-type-ring-map (characterisation): `B⁺` is the integral closure in `B`
of a finitely generated `A⁺`-subalgebra `B₁⁺` with `A · B₁⁺ = B` (Huber 1996, Remark 1.2.6(iii),
in the form used by Scholze 2013, Lemma 6.12). -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.exists_fg_plus {φ : Pair.Hom S T}
    (hφ : φ.IsAlgebraicallyFiniteType) :
    ∃ s : Finset B,
      T.plus = (integralClosure (Subring.closure (φ.toRingHom '' S.plus ∪ s)) B).toSubring ∧
        letI := φ.toRingHom.toAlgebra
        Submodule.span A (Subring.closure (φ.toRingHom '' S.plus ∪ s) : Set B) = ⊤ := sorry

/-- R0/algebraically-finite-type-ring-map (functoriality): composites of morphisms of
algebraically finite type are of algebraically finite type. -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.comp {φ : Pair.Hom S T} {ψ : Pair.Hom T U}
    (hψ : ψ.IsAlgebraicallyFiniteType) (hφ : φ.IsAlgebraicallyFiniteType) :
    (ψ.comp φ).IsAlgebraicallyFiniteType := sorry

/-- R0/algebraically-finite-type-ring-map (instance): the identity is of algebraically finite
type. -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.id (S : Pair A) :
    (Pair.Hom.id S).IsAlgebraicallyFiniteType := sorry

/-- R0/algebraically-finite-type-ring-map (example): for `g ∈ A` and finite `M ⊆ A` for which
the rational localisation topology on `L = A[1/g]` exists (Tau Ceti
`PairOfDefinition.locTopology`, hypothesis `hden`), the morphism `(A, A⁺) → (L, L⁺)` with
`L⁺` the integral closure of `A⁺[m/g : m ∈ M]` is of algebraically finite type (used to invert a
Jacobian). -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.localizationAway (P : PairOfDefinition A)
    (M : Finset A) (g : A) (L : Type*) [CommRing L] [Algebra A L] [IsLocalization.Away g L]
    (hden : PairOfDefinition.HasDenominatorPower P M g L) :
    letI := PairOfDefinition.locTopology P M g L hden
    haveI := PairOfDefinition.isTopologicalRing_locTopology P M g L hden
    haveI := PairOfDefinition.isHuberRing_locTopology P M g L hden
    ∀ (V : Pair L) (φ : Pair.Hom S V), φ.toRingHom = algebraMap A L →
      V.plus = (integralClosure (Subring.closure (algebraMap A L '' S.plus ∪
        (fun m ↦ IsLocalization.mk' L m (⟨g, Submonoid.mem_powers g⟩ : Submonoid.powers g)) '' M))
        L).toSubring →
      φ.IsAlgebraicallyFiniteType := sorry

-- test IsAlgebraicallyFiniteType_test_id (degenerate) [R0/algebraically-finite-type-ring-map]
example (S : Pair A) (J : Ideal A) :
    (Pair.Hom.id S).IsAlgebraicallyFiniteType ∧
      (Pair.quotientHom S J).IsAlgebraicallyFiniteType := sorry

end AlgebraicFiniteType

section AlgebraicFiniteTypeComplete

variable {A B : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
  [IsHuberRing B] {S : Pair A} {T : Pair B}

/-- R0/algebraically-finite-type-ring-map (compatibility): the completion `Â → B̂` of a morphism
of algebraically finite type is topologically of finite type (Tau Ceti
`IsTopologicallyFiniteType`); `Spa B = Spa B̂` is the anchor's comparison of an affinoid with its
completion. -/
theorem Pair.Hom.IsAlgebraicallyFiniteType.completion {φ : Pair.Hom S T}
    (hφ : φ.IsAlgebraicallyFiniteType) :
    IsTopologicallyFiniteType
      (UniformSpace.Completion.mapRingHom φ.toRingHom φ.continuous_toRingHom) := sorry

-- test IsAlgebraicallyFiniteType_test_finiteType (compatibility)
--   [R0/algebraically-finite-type-ring-map]
example (φ : Pair.Hom S T) (hφ : φ.IsAlgebraicallyFiniteType) :
    φ.toRingHom.FiniteType ∧
      IsTopologicallyFiniteType
        (UniformSpace.Completion.mapRingHom φ.toRingHom φ.continuous_toRingHom) := sorry

end AlgebraicFiniteTypeComplete

/- `(ℚ_p, ℤ_p) → (ℚ_p⟨T⟩, ℤ_p⟨T⟩)`: topologically of finite type, not of algebraically finite
type (`ℚ_p⟨T⟩` is not a finitely generated `ℚ_p`-algebra). -/
-- test IsAlgebraicallyFiniteType_test_tateAlgebra (non-example)
--   [R0/algebraically-finite-type-ring-map]
example (p : ℕ) [Fact p.Prime] (T' : Pair (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))
    (φ : Pair.Hom (Pair.powerBounded ℚ_[p]) T')
    (hφ : φ.toRingHom = algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    IsTopologicallyFiniteType φ.toRingHom ∧ ¬ φ.IsAlgebraicallyFiniteType := sorry

/- The torus over `(W(κ)[1/p], W(κ))` for `κ = 𝔽_p`, i.e. over `(ℚ_p, ℤ_p)`: the quotient of
`ℚ_p[X, Y]` (weights `{1}`) by `XY − 1`, with the quotient plus ring. Its completion is
`(ℚ_p⟨T^{±1}⟩, ℤ_p⟨T^{±1}⟩)`. -/
-- test IsAlgebraicallyFiniteType_test_torus (computation) [R0/algebraically-finite-type-ring-map]
example (p : ℕ) [Fact p.Prime]
    (φ : Pair.Hom (Pair.powerBounded ℚ_[p])
      (((Pair.powerBounded ℚ_[p]).polynomialWeighted (fun _ : Fin 2 ↦ ({1} : Set ℚ_[p]))
        isWeightFamily_one_weight).quotient (Ideal.span
          {weightedPolynomialsEquiv isWeightFamily_one_weight
            (MvPolynomial.X 0 * MvPolynomial.X 1 - 1)})))
    (hφ : φ.toRingHom = (Ideal.Quotient.mk _).comp
      ((weightedPolynomialsEquiv isWeightFamily_one_weight).toRingHom.comp MvPolynomial.C)) :
    φ.IsAlgebraicallyFiniteType := sorry

end Huber

/-! ## AdicSpacesPartII:R0/etale-local-structure (theorem)

Standard étale presentation of étale affinoid maps (Huber 1.7.1). -/

-- AdicSpace.Etale.iff_exists_standardPresentation: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5)

/-! ## AdicSpacesPartII:R0/etale-presentation-perturbation (lemma)

Stability of standard étale presentations under perturbation (Huber 1.7.2). -/

namespace AdicSpace

open TauCeti.Huber Topology

/-- R0/etale-presentation-perturbation, ring-level core of `AdicSpace.standardPresentation_perturb`
(Huber 1996, 1.7.2): for `B = A⟨X₁, …, Xₙ⟩_M` and `f₁, …, fₙ ∈ B` whose Jacobian
`det (∂fᵢ/∂Xⱼ)` is a unit in `B ⧸ (f)`, the same holds for every `g` close enough to `f`. The
partial derivatives are the coordinates of `d fᵢ` in
`ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis`. `A` is complete here; a Huber pair
and its completion have the same `A⟨X⟩_M` and the same adic spectrum. -/
theorem standardPresentation_perturb_affinoid {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A]
    {n : ℕ} (M : Fin n → Set A) (hMfin : ∀ i, (M i).Finite) (hM : IsWeightFamily M)
    (f : Fin n → UniformSpace.Completion (weightedRestrictedSubring M hM))
    (hf : IsUnit (Ideal.Quotient.mk (Ideal.span (Set.range f)) (Matrix.det fun i j ↦
      (ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis A M hM).repr
        (ContinuousKaehlerDifferential.D A _ (f i)) j))) :
    ∃ V ∈ 𝓝 (0 : UniformSpace.Completion (weightedRestrictedSubring M hM)),
      ∀ g : Fin n → UniformSpace.Completion (weightedRestrictedSubring M hM),
        (∀ i, g i - f i ∈ V) →
          IsUnit (Ideal.Quotient.mk (Ideal.span (Set.range g)) (Matrix.det fun i j ↦
            (ContinuousKaehlerDifferential.restrictedMvPowerSeriesBasis A M hM).repr
              (ContinuousKaehlerDifferential.D A _ (g i)) j)) := sorry

end AdicSpace

-- AdicSpace.standardPresentation_perturb (the Spa(A)-isomorphism Spa(B/(g)) ≅ Spa(B/(f))): not
--   stated here; needs adic spaces and the morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs
--   as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-algebraic-model (lemma)

Algebraic models of affinoid étale maps (Huber 1.7.3(iii)). -/

-- AdicSpace.Etale.iff_exists_algebraicModel: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/smooth-local-structure (theorem)

Smooth morphisms are locally étale over relative polydiscs (Huber 1.6.10). -/

-- AdicSpace.Smooth.iff_exists_etale_polydisc: not stated here; needs adic spaces and the morphisms
--   Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)
-- AdicSpace.Smooth.exists_etale_polydisc_of_isTate: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5)

/-! ## AdicSpacesPartII:R0/etale-affinoid-finite-etale-embedding (lemma)

Étale morphisms of affinoids over a field embed locally into finite étale covers (de Jong–van der
Put 3.1.4). -/

-- AdicSpace.Etale.exists_rational_openImmersion_finiteEtale: not stated here; needs K-affinoid
--   adic spaces, their rational subsets and finite étale covers (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/finite-etale-algebra-comparison)

/-! ## AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation (lemma)

Étale maps are locally open embeddings into finite étale covers (Huber 2.2.8). -/

-- AdicSpace.Etale.iff_exists_openImmersion_finiteEtale: not stated here; needs adic spaces and the
--   morphisms Spa(C ⧸ I) → Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces
--   Layer 5)

/-! ## AdicSpacesPartII:R0/smooth-toric-chart (lemma)

Étale toric charts on smooth affinoids (Scholze 2013, Lemma 5.2). -/

-- AdicSpace.Smooth.exists_toricChart: not stated here; needs affinoid adic spaces, their rational
--   subsets and the torus Spa(K⟨T^{±1}⟩) (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-flat-unramified (theorem)

Étale equals flat and unramified for analytic adic spaces (Huber 1.7.5). -/

-- AdicSpace.Etale.iff_flat_and_unramified: not stated here; needs adic spaces and the stalks of
--   O_X (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/etale-ring-flatness (lemma)

Flatness of the ring map of an étale affinoid morphism (Huber 1.7.6). -/

-- AdicSpace.Etale.flat_appTop: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R0/smooth-morphism-open (lemma)

Smooth and étale morphisms are open (Huber 1.7.7-1.7.9). -/

-- AdicSpace.Smooth.isOpenMap: not stated here; needs adic spaces and the morphisms Spa(C ⧸ I) →
--   Spa(C) of complete Huber pairs as test objects (supplier: AdicSpaces Layer 5)

end TauCeti

end

noncomputable section

namespace TauCeti

universe u

/-! ## K-affinoid algebras (AdicSpacesPartII:R0, classical affinoid algebras)

A complete rank-one field is `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
[NonarchimedeanRing K]`. A `K`-affinoid algebra is a commutative `K`-algebra `A` with a complete
Hausdorff nonarchimedean ring topology (`[UniformSpace A] [IsUniformAddGroup A]
[NonarchimedeanRing A] [CompleteSpace A] [T2Space A]`) such that `K → A` is strictly
topologically of finite type (`hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)`: a
continuous open surjection `K⟨X₁,…,Xₙ⟩ → A` compatible with `K`). The first countability in the
packet's definition follows from that surjection and is not carried. `Max A` is Mathlib's
`MaximalSpectrum A`; `|f(x)|` is `Huber.Affinoid.evalNorm`, the spectral norm of `f mod x` in the
finite extension `A/x` of `K` (Mathlib `spectralNorm`, the unique extension of `‖·‖`). -/

section Affinoid

open Huber Filter Topology

/-- R0/tate-algebra-maximal-ideals-polynomial (notation): the inclusion
`A[X₁,…,Xₙ] → A⟨X₁,…,Xₙ⟩` into Tau Ceti's completed restricted power-series ring. -/
def Huber.TateAlgebra.ofMvPolynomial (A : Type*) [CommRing A] [TopologicalSpace A]
    [NonarchimedeanRing A] (n : ℕ) :
    MvPolynomial (Fin n) A →+* restrictedMvPowerSeriesCompletion n A :=
  (UniformSpace.Completion.coeRingHom).comp
    (weightedPolynomialHom (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight)

/-- R0/affinoid-supremum-seminorm (notation): `|f(x)|` for `x ∈ Max A`, the spectral norm of the
residue class of `f` in the finite extension `A/x` of `K`. -/
def Huber.Affinoid.evalNorm (K : Type*) [NormedField K] {A : Type*} [CommRing A] [Algebra K A]
    (f : A) (x : MaximalSpectrum A) : NNReal :=
  haveI := x.isMaximal
  letI := Ideal.Quotient.field x.asIdeal
  ⟨spectralNorm K (A ⧸ x.asIdeal) (Ideal.Quotient.mk x.asIdeal f), spectralNorm_nonneg _⟩

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]

/-- R0/affinoid-supremum-seminorm (notation): the Gauss norm `max_ν |a_ν|` of an element of the
Tate algebra `K⟨X₁,…,Xₙ⟩`, read through Tau Ceti's identification of `K⟨X⟩` with the restricted
power series (`restrictedMvPowerSeriesCompletionEquiv`) and Mathlib's `MvPowerSeries.gaussNorm`
with all radii `1`. -/
def Huber.TateAlgebra.gaussNorm {n : ℕ} (g : restrictedMvPowerSeriesCompletion n K) : ℝ :=
  MvPowerSeries.gaussNorm (‖·‖) 1
    ((restrictedMvPowerSeriesCompletionEquiv n K g : MvPowerSeries (Fin n) K))

/-- R0/affinoid-supremum-seminorm: the supremum seminorm `|f|_sup = sup_{x ∈ Max A} |f(x)|`
(`0` when `A = 0`, the supremum over the empty set in `ℝ≥0`). -/
def Huber.Affinoid.supNorm {A : Type*} [CommRing A] [Algebra K A] (f : A) : NNReal :=
  ⨆ x : MaximalSpectrum A, Affinoid.evalNorm K f x

/-- R0/affinoid-supremum-seminorm (notation): the residue norm
`|f|_π = inf {‖g‖ : π g = f}` of a presentation `π : K⟨X⟩ → A`, for the Gauss norm. -/
def Huber.Affinoid.residueNorm {A : Type*} [CommRing A] [Algebra K A] {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n K →ₐ[K] A) (f : A) : ℝ :=
  ⨅ g : {g // π g = f}, TateAlgebra.gaussNorm K (g : restrictedMvPowerSeriesCompletion n K)

variable {A : Type u} [CommRing A] [Algebra K A] [UniformSpace A] [IsUniformAddGroup A]
  [NonarchimedeanRing A] [CompleteSpace A] [T2Space A]
  {B : Type u} [CommRing B] [Algebra K B] [UniformSpace B] [IsUniformAddGroup B]
  [NonarchimedeanRing B] [CompleteSpace B] [T2Space B]

/-! ### AdicSpacesPartII:R0/affinoid-noether-normalisation (lemma) -/

/-- R0/affinoid-noether-normalisation: a nonzero `K`-affinoid algebra is finite over a Tate
algebra `K⟨T₁,…,T_d⟩` embedded into it. -/
theorem Huber.Affinoid.exists_finite_injective_tateAlgebra [Nontrivial A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) :
    ∃ (d : ℕ) (ι : restrictedMvPowerSeriesCompletion d K →ₐ[K] A),
      Function.Injective ι ∧ ι.Finite := sorry

/-- R0/affinoid-noether-normalisation: every finite injective `ι : K⟨T₁,…,T_d⟩ → A` is continuous
and strict, a homeomorphism onto its closed image. -/
theorem Huber.Affinoid.isClosedEmbedding_of_finite_injective
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {d : ℕ}
    (ι : restrictedMvPowerSeriesCompletion d K →ₐ[K] A) (hι : Function.Injective ι)
    (hfin : ι.Finite) : IsClosedEmbedding ι := sorry

/-! ### AdicSpacesPartII:R0/affinoid-residue-fields-finite (lemma) -/

/-- R0/affinoid-residue-fields-finite: the residue field `A/m` at a maximal ideal is a finite
extension of `K`. -/
theorem Huber.Affinoid.finiteDimensional_residueField
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (m : Ideal A) [m.IsMaximal] :
    FiniteDimensional K (A ⧸ m) := sorry

/-- R0/affinoid-residue-fields-finite: maximal ideals of a `K`-affinoid algebra are closed. -/
theorem Huber.Affinoid.isClosed_of_isMaximal
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (m : Ideal A) [m.IsMaximal] :
    IsClosed (m : Set A) := sorry

/-- R0/affinoid-residue-fields-finite: the preimage of a maximal ideal under a `K`-algebra map of
`K`-affinoid algebras is maximal, so `φ` induces `Max(φ) : Max B → Max A`. -/
theorem Huber.Affinoid.isMaximal_comap
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B)) (φ : A →ₐ[K] B) (n : Ideal B)
    [n.IsMaximal] : (n.comap φ).IsMaximal := sorry

/-! ### AdicSpacesPartII:R0/affinoid-jacobson (lemma) -/

/-- R0/affinoid-jacobson: a `K`-affinoid algebra is a Jacobson ring. -/
theorem Huber.Affinoid.isJacobsonRing
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) : IsJacobsonRing A := sorry

/-! ### AdicSpacesPartII:R0/tate-algebra-maximal-ideals-polynomial (lemma) -/

/-- R0/tate-algebra-maximal-ideals-polynomial: a maximal ideal `m` of `K⟨X₁,…,Xₙ⟩` contracts to a
maximal ideal `m₀` of `K[X]` with `K[X]/m₀ ≅ K⟨X⟩/m` and `m = m₀·K⟨X⟩`; more precisely
`m = (p₁,…,pₙ)` with `pᵢ ∈ K[X₁,…,Xᵢ]` monic in `Xᵢ`. -/
theorem Huber.TateAlgebra.exists_monic_generators_of_isMaximal {n : ℕ}
    (m : Ideal (restrictedMvPowerSeriesCompletion n K)) [m.IsMaximal] :
    (m.comap (TateAlgebra.ofMvPolynomial K n)).IsMaximal ∧
      Function.Bijective (Ideal.quotientMap m (TateAlgebra.ofMvPolynomial K n) le_rfl) ∧
      m = (m.comap (TateAlgebra.ofMvPolynomial K n)).map (TateAlgebra.ofMvPolynomial K n) ∧
      ∃ p : Fin n → MvPolynomial (Fin n) K,
        (∀ i, p i ∈ MvPolynomial.supported K {j | j ≤ i} ∧
          ∃ d : ℕ, 0 < d ∧ MvPolynomial.degreeOf i (p i - MvPolynomial.X i ^ d) < d) ∧
        m = Ideal.span (Set.range fun i ↦ TateAlgebra.ofMvPolynomial K n (p i)) := sorry

/-! ### AdicSpacesPartII:R0/affinoid-supremum-seminorm (definition)

The definition is `Huber.Affinoid.supNorm` above, with `Huber.Affinoid.evalNorm` and
`Huber.Affinoid.residueNorm`. -/

/-- R0/affinoid-supremum-seminorm: `|f|_sup ≤ |f|_π` for every presentation `π`. -/
theorem Huber.Affinoid.supNorm_le_residueNorm
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n K →ₐ[K] A) (hπ : IsOpenQuotientMap π) (f : A) :
    (Affinoid.supNorm K f : ℝ) ≤ Affinoid.residueNorm K π f := sorry

/-- R0/affinoid-supremum-seminorm: `|f + g|_sup ≤ max(|f|_sup, |g|_sup)`. -/
theorem Huber.Affinoid.supNorm_add_le
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f g : A) :
    Affinoid.supNorm K (f + g) ≤ max (Affinoid.supNorm K f) (Affinoid.supNorm K g) := sorry

/-- R0/affinoid-supremum-seminorm: `|fg|_sup ≤ |f|_sup |g|_sup`. -/
theorem Huber.Affinoid.supNorm_mul_le
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f g : A) :
    Affinoid.supNorm K (f * g) ≤ Affinoid.supNorm K f * Affinoid.supNorm K g := sorry

/-- R0/affinoid-supremum-seminorm: `|fⁿ|_sup = |f|_supⁿ` for `n ≥ 1` (power-multiplicativity). -/
theorem Huber.Affinoid.supNorm_pow
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) {n : ℕ} (hn : 1 ≤ n) :
    Affinoid.supNorm K (f ^ n) = Affinoid.supNorm K f ^ n := sorry

/-- R0/affinoid-supremum-seminorm: `|λ|_sup = |λ|` for `λ ∈ K` when `A ≠ 0`. -/
theorem Huber.Affinoid.supNorm_algebraMap [Nontrivial A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (c : K) :
    Affinoid.supNorm K (algebraMap K A c) = ‖c‖₊ := sorry

/-- R0/affinoid-supremum-seminorm: a `K`-algebra map of `K`-affinoid algebras contracts `|·|_sup`,
with equality when it is surjective with nilpotent kernel. -/
theorem Huber.Affinoid.supNorm_map_le
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B)) (φ : A →ₐ[K] B) (f : A) :
    Affinoid.supNorm K (φ f) ≤ Affinoid.supNorm K f ∧
      (Function.Surjective φ → (∀ a ∈ RingHom.ker φ, IsNilpotent a) →
        Affinoid.supNorm K (φ f) = Affinoid.supNorm K f) := sorry

/-- R0/affinoid-supremum-seminorm: `|f|_sup = 0` iff `f` is nilpotent (via
R0/affinoid-jacobson); so `|·|_sup` is a norm iff `A` is reduced. -/
theorem Huber.Affinoid.supNorm_eq_zero_iff
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) :
    Affinoid.supNorm K f = 0 ↔ IsNilpotent f := sorry

/-- R0/affinoid-supremum-seminorm: on the Tate algebra `K⟨X₁,…,Xₙ⟩` the supremum seminorm is the
Gauss norm. -/
theorem Huber.Affinoid.supNorm_tateAlgebra {n : ℕ} (g : restrictedMvPowerSeriesCompletion n K) :
    (Affinoid.supNorm K g : ℝ) = TateAlgebra.gaussNorm K g := sorry

/-- R0/affinoid-supremum-seminorm: `|f|_sup = lim |fᵏ|_π^{1/k}` for every presentation `π`: the
supremum seminorm is the spectral seminorm (Kedlaya–Liu Definition 2.1.9). -/
theorem Huber.Affinoid.supNorm_eq_spectralSeminorm
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n K →ₐ[K] A) (hπ : IsOpenQuotientMap π) (f : A) :
    Tendsto (fun k : ℕ ↦ Affinoid.residueNorm K π (f ^ k) ^ (1 / (k : ℝ))) atTop
      (𝓝 (Affinoid.supNorm K f : ℝ)) := sorry

/- `K⟨T⟩/(T²)`: `|T|_sup = 0` although `T ≠ 0` and its residue norm is positive. -/
-- test supNorm_test_dualNumbers (non-example) [R0/affinoid-supremum-seminorm]
example :
    let T := TateAlgebra.ofMvPolynomial K 1 (MvPolynomial.X 0)
    let I : Ideal (restrictedMvPowerSeriesCompletion 1 K) := Ideal.span {T ^ 2}
    Affinoid.supNorm K (Ideal.Quotient.mk I T) = 0 ∧ Ideal.Quotient.mk I T ≠ 0 ∧
      0 < Affinoid.residueNorm K (Ideal.Quotient.mkₐ K I) (Ideal.Quotient.mk I T) := sorry

/- On `K⟨T⟩`, `|Σ aₙ Tⁿ|_sup = maxₙ |aₙ|`. -/
-- test supNorm_test_gauss (compatibility) [R0/affinoid-supremum-seminorm]
example (g : restrictedMvPowerSeriesCompletion 1 K) :
    (Affinoid.supNorm K g : ℝ) = ⨆ ν : Fin 1 →₀ ℕ,
      ‖MvPowerSeries.coeff ν (restrictedMvPowerSeriesCompletionEquiv 1 K g :
        MvPowerSeries (Fin 1) K)‖ := sorry

-- test supNorm_test_zero (degenerate) [R0/affinoid-supremum-seminorm]
example (c : K) :
    Affinoid.supNorm K (0 : PUnit) = 0 ∧ Affinoid.supNorm K c = ‖c‖₊ := sorry

/- `ℚ_p⟨T⟩/(T² − p)`: `|T|_sup = |p|^{1/2}`, which is not a norm of an element of `ℚ_p`. -/
-- test supNorm_test_sqrt (computation) [R0/affinoid-supremum-seminorm]
example (p : ℕ) [Fact p.Prime] :
    let T := TateAlgebra.ofMvPolynomial ℚ_[p] 1 (MvPolynomial.X 0)
    let I : Ideal (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := Ideal.span {T ^ 2 - (p : _)}
    (Affinoid.supNorm ℚ_[p] (Ideal.Quotient.mk I T) : ℝ) = Real.sqrt ‖(p : ℚ_[p])‖ ∧
      ∀ c : ℚ_[p], ‖c‖ ≠ Real.sqrt ‖(p : ℚ_[p])‖ := sorry

/-! ### AdicSpacesPartII:R0/affinoid-maximum-modulus (lemma) -/

/-- R0/affinoid-maximum-modulus: the supremum seminorm is attained at a point of `Max A`. -/
theorem Huber.Affinoid.exists_supNorm_eq [Nontrivial A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) :
    ∃ x : MaximalSpectrum A, Affinoid.evalNorm K f x = Affinoid.supNorm K f := sorry

/-- R0/affinoid-maximum-modulus: `|f|_sup ∈ √|K^×| ∪ {0}`: some power of it is a norm from `K`. -/
theorem Huber.Affinoid.exists_pow_supNorm_eq_nnnorm
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) :
    ∃ (k : ℕ) (c : K), 0 < k ∧ Affinoid.supNorm K f ^ k = ‖c‖₊ := sorry

/-- R0/affinoid-maximum-modulus: for a unit `u`, `min_{x ∈ Max A} |u(x)| = |u⁻¹|_sup⁻¹ > 0`. -/
theorem Huber.Affinoid.exists_evalNorm_eq_inv_supNorm_inv [Nontrivial A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (u : Aˣ) :
    0 < Affinoid.supNorm K (↑u⁻¹ : A) ∧
      (∃ x, Affinoid.evalNorm K (u : A) x = (Affinoid.supNorm K (↑u⁻¹ : A))⁻¹) ∧
      ∀ y, (Affinoid.supNorm K (↑u⁻¹ : A))⁻¹ ≤ Affinoid.evalNorm K (u : A) y := sorry

/-! ### AdicSpacesPartII:R0/affinoid-power-bounded-iff-sup (lemma) -/

/-- R0/affinoid-power-bounded-iff-sup: `A° = {|f|_sup ≤ 1}`. -/
theorem Huber.Affinoid.mem_powerBoundedSubring_iff_supNorm_le_one
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) :
    f ∈ powerBoundedSubring A ↔ Affinoid.supNorm K f ≤ 1 := sorry

/-- R0/affinoid-power-bounded-iff-sup: `A°° = {|f|_sup < 1}`. -/
theorem Huber.Affinoid.isTopologicallyNilpotent_iff_supNorm_lt_one
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f : A) :
    IsTopologicallyNilpotent f ↔ Affinoid.supNorm K f < 1 := sorry

/-! ### AdicSpacesPartII:R0/reduced-affinoid-supremum-norm (lemma) -/

/-- R0/reduced-affinoid-supremum-norm: on a reduced `K`-affinoid algebra the supremum norm is
equivalent to the residue norm of every presentation. -/
theorem Huber.Affinoid.supNorm_equivalent_of_isReduced [IsReduced A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n K →ₐ[K] A) (hπ : IsOpenQuotientMap π) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A, (Affinoid.supNorm K f : ℝ) ≤ Affinoid.residueNorm K π f ∧
      Affinoid.residueNorm K π f ≤ C * Affinoid.supNorm K f := sorry

/-- R0/reduced-affinoid-supremum-norm: a `K`-affinoid algebra is reduced iff `A°` is bounded
(uniform). -/
theorem Huber.Affinoid.isReduced_iff_isBounded_powerBoundedSubring
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) :
    IsReduced A ↔ Huber.IsBounded (powerBoundedSubring A : Set A) := sorry

/-! ### AdicSpacesPartII:R0/affinoid-homomorphism-continuous (lemma) -/

/-- R0/affinoid-homomorphism-continuous: every `K`-algebra map of `K`-affinoid algebras is
continuous. -/
theorem Huber.Affinoid.continuous_of_algHom
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B)) (φ : A →ₐ[K] B) :
    Continuous φ := sorry

/-! ### AdicSpacesPartII:R0/affinoid-power-bounded-integral (lemma) -/

/-- R0/affinoid-power-bounded-integral: for a continuous surjection `π : K⟨X⟩ → A`,
`π(K°⟨X⟩) ⊆ A°` and `A°` is the integral closure of `π(K°⟨X⟩)` in `A`. Here `K°⟨X⟩` is the
power-bounded subring of `K⟨X⟩`, the series of Gauss norm at most `1`
(`Huber.Affinoid.supNorm_tateAlgebra`, `Huber.Affinoid.mem_powerBoundedSubring_iff_supNorm_le_one`). -/
theorem Huber.Affinoid.powerBoundedSubring_eq_integralClosure
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n K →ₐ[K] A) (hπc : Continuous π)
    (hπs : Function.Surjective π) :
    (powerBoundedSubring (restrictedMvPowerSeriesCompletion n K)).map π.toRingHom ≤
        powerBoundedSubring A ∧
      powerBoundedSubring A = (integralClosure
        ((powerBoundedSubring (restrictedMvPowerSeriesCompletion n K)).map π.toRingHom)
          A).toSubring := sorry

/-! ### AdicSpacesPartII:R0/affinoid-reduction-finite (lemma) -/

/-- R0/affinoid-reduction-finite: a finite map `φ` of `K`-affinoid algebras maps `A°` into `B°` and
`A°°` into `B°°`, and the induced map of reductions `A°/A°° → B°/B°°` is finite (Tau Ceti
`topologicallyNilpotentIdeal` is `A°°`). -/
theorem Huber.Affinoid.reduction_finite_of_finite
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B)) (φ : A →ₐ[K] B) (hφ : φ.Finite) :
    ∃ (h₁ : ∀ a ∈ powerBoundedSubring A, φ a ∈ powerBoundedSubring B)
      (h₂ : topologicallyNilpotentIdeal A ≤ (topologicallyNilpotentIdeal B).comap
        (φ.toRingHom.restrict (powerBoundedSubring A) (powerBoundedSubring B) h₁)),
      (Ideal.quotientMap (topologicallyNilpotentIdeal B)
        (φ.toRingHom.restrict (powerBoundedSubring A) (powerBoundedSubring B) h₁) h₂).Finite :=
  sorry

end Affinoid

/-! ## AdicSpacesPartII:R0/reduced-reduction-ring-of-definition (lemma) -/

/-- R0/reduced-reduction-ring-of-definition: in a Tate ring, a ring of definition `A₀` containing a
pseudouniformizer `ϖ` with `A₀/ϖA₀` reduced is the power-bounded subring. -/
theorem Huber.PairOfDefinition.ringOfDefinition_eq_powerBoundedSubring_of_isReduced {A : Type*}
    [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsTateRing A]
    (P : Huber.PairOfDefinition A) {ϖ : A} (hϖ : Huber.IsPseudoUniformizer ϖ)
    (hϖP : ϖ ∈ P.ringOfDefinition)
    (hred : IsReduced (P.ringOfDefinition ⧸ Ideal.span {(⟨ϖ, hϖP⟩ : P.ringOfDefinition)})) :
    P.ringOfDefinition = Huber.powerBoundedSubring A := sorry

end TauCeti

end

/-! # Layer R1. Analytification and algebraic correspondences -/

/-! # Stage R1: analytification and algebraic correspondences

Almost every item of R1 is geometric: it needs the anchor's category of adic spaces (AdicSpaces
Layer 5), sheaves of modules on them, or Tate's rigid-analytic spaces, and none of these is in the
pinned libraries. Such items are the comments `-- <name>: not stated here; needs …`. What is
stated is the ring-level core of the charts: the weighted restricted series ring
`A⟨T⟩_{E(k)}` and its quotient `A_k`, the fact that every tuple of elements lands in some chart,
the flatness of a chart over the polynomial ring, the entire power series of `A^{n,ad}`, the
uniqueness of the plus ring of a `K`-affinoid algebra, and the ring-level theory of affinoid
subdomains of `Max A` (their universal property, coordinate rings, flatness, Gerritzen–Grauert,
Tate acyclicity in degrees `0` and `1`), which uses the supremum seminorm of stage R0o
(`Huber.Affinoid.evalNorm`) through a stub.

A complete rank-one nonarchimedean field is `[NontriviallyNormedField K] [IsUltrametricDist K]
[CompleteSpace K]`. Mathlib has no instance `IsUltrametricDist K → NonarchimedeanRing K` at the
pin, so `[NonarchimedeanRing K]` is carried as a further (implied) hypothesis. -/

noncomputable section

namespace TauCeti

universe u


/-! ## AdicSpacesPartII:R1/affine-chart-analytification (lemma) -/

section AffineChart

open Huber UniformSpace Pointwise

variable (A : Type*) [CommRing A] [TopologicalSpace A] [NonarchimedeanRing A]

/-- R1/affine-chart-analytification (ring-level core): the chart ring before the quotient,
`A(k) = A⟨T₁,…,Tₙ⟩_{E(k),…,E(k)}`, Huber's weighted restricted power-series ring with weight
`E(k) = E ^ k` in every variable, completed (Tau Ceti `weightedRestrictedSubring`, completed as in
`restrictedMvPowerSeriesCompletion`). For `A = K` and `E = {ϖ}` it is `K⟨ϖ^k T⟩`, the functions
on the closed polydisc of radius `|ϖ|^{-k}`. -/
abbrev Huber.chartSeries (n k : ℕ) (E : Finset A)
    (hE : IsWeightFamily (fun _ : Fin n ↦ (E : Set A) ^ k)) : Type _ :=
  Completion (weightedRestrictedSubring (fun _ : Fin n ↦ (E : Set A) ^ k) hE)

/-- R1/affine-chart-analytification (ring-level core): the polynomial ring `A[T₁,…,Tₙ]` maps into
the chart ring `A(k)`, `Tᵢ ↦ Tᵢ` (Tau Ceti `weightedPolynomialHom`, then the completion map). -/
def Huber.chartSeries.ofPolynomial (n k : ℕ) (E : Finset A)
    (hE : IsWeightFamily (fun _ : Fin n ↦ (E : Set A) ^ k)) :
    MvPolynomial (Fin n) A →+* chartSeries A n k E hE :=
  (Completion.coeRingHom).comp (weightedPolynomialHom _ hE)

variable {A}

/-- R1/affine-chart-analytification (ring-level core): the weight family `E(k)` of the chart,
`E(k) = E ^ k = {e₁ ⋯ e_k : eᵢ ∈ E}` in every variable, is a weight family as soon as `E`
contains a unit. (For `E = {ϖ}` with `ϖ` a pseudouniformizer this is the chart family of the
analytification; Huber's general hypothesis "`E · A` open" gives a weight family only through an
open mapping theorem, so the chart ring below takes the weight-family proof as an argument.) -/
theorem Huber.isWeightFamily_chartWeights {E : Finset A} (hE : ∃ e ∈ E, IsUnit e) (n k : ℕ) :
    IsWeightFamily (fun _ : Fin n ↦ (E : Set A) ^ k) := sorry

/-- R1/affine-chart-analytification (ring-level core): for a pseudouniformizer `ϖ`, the family
`{ϖ} ^ k = {ϖ ^ k}` is a weight family. -/
theorem Huber.IsPseudoUniformizer.isWeightFamily_singleton_pow {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) (n k : ℕ) :
    IsWeightFamily (fun _ : Fin n ↦ (({ϖ} : Finset A) : Set A) ^ k) := sorry

/-- R1/affine-chart-analytification (ring-level core): `λ_k : B[T] → A(k)`, extending
`λ : B → A` by `Tᵢ ↦ Tᵢ`. -/
def Huber.chartSeries.baseMap {B : Type*} [CommRing B] (lam : B →+* A) (n k : ℕ) (E : Finset A)
    (hE : IsWeightFamily (fun _ : Fin n ↦ (E : Set A) ^ k)) :
    MvPolynomial (Fin n) B →+* chartSeries A n k E hE :=
  (chartSeries.ofPolynomial A n k E hE).comp (MvPolynomial.map lam)

/-- R1/affine-chart-analytification (ring-level core): the chart ring
`A_k = A(k) / λ_k(I)·A(k)` of `C = B[T₁,…,Tₙ]/I`, with the quotient topology (Mathlib's
topology on `R ⧸ I`). Its plus ring `A_k⁺`, the integral closure of the image of `A(k)⁺`, and the
affinoid `R_k = Spa(A_k, A_k⁺)` are the geometric part of the node. -/
abbrev Huber.chartRing {B : Type*} [CommRing B] (lam : B →+* A) (n k : ℕ) (E : Finset A)
    (hE : IsWeightFamily (fun _ : Fin n ↦ (E : Set A) ^ k)) (I : Ideal (MvPolynomial (Fin n) B)) :
    Type _ :=
  chartSeries A n k E hE ⧸ I.map (chartSeries.baseMap lam n k E hE)

/-- R1/affine-chart-analytification (ring-level core of (iii)): every tuple `x ∈ Dⁿ` of a Huber
pair `(D, D⁺)` over `A` lies in some chart. For a finite set `E` of topologically nilpotent
elements of `A` and a continuous `μ : A → D`, there is `k` with `μ(e) · xᵢ ∈ D⁺` for all
`e ∈ E(k)` and all `i`; so the weighted evaluation `A(k) → D`, `Tᵢ ↦ xᵢ` (Tau Ceti
`existsUnique_continuous_ringHom_weightedRestrictedSubring`), carries the plus ring of `A(k)` into
`D⁺`. This is why the union `⋃_k R_k`, and not a single chart, has the universal property. -/
theorem AdicSpace.chart_exists_index_affinoid {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] {D : Type*} [CommRing D] [TopologicalSpace D] [IsTopologicalRing D] [IsHuberRing D]
    (Q : Pair D) {E : Finset A} (hE : ∀ e ∈ E, IsTopologicallyNilpotent e) (μ : A →+* D)
    (hμ : Continuous μ) {n : ℕ} (x : Fin n → D) :
    ∃ k : ℕ, ∀ e ∈ (E : Set A) ^ k, ∀ i, μ e * x i ∈ Q.plus := sorry

-- AdicSpace.chart_isRationalSubset: not stated here; needs affinoid adic spaces Spa(A_k, A_k⁺)
--   and open embeddings of adic spaces (supplier: AdicSpaces Layer 5). For k ≤ h it identifies
--   R_k with the rational subset {|e·Tᵢ| ≤ 1 : e ∈ E(k)} of R_h (Tau Ceti `rationalSubset`).
-- AdicSpace.chart_homEquiv: not stated here; needs morphisms of adic spaces over Spa(A, A⁺)
--   (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `AdicSpace.chart_exists_index_affinoid` with Tau Ceti's weighted evaluation.

end AffineChart

/-! ## AdicSpacesPartII:R1/scheme-fibre-product-analytification (construction)

Every item needs the category of adic spaces with its forgetful functor to locally ringed spaces
(AdicSpaces Layer 5); the affine charts are `Huber.chartRing`
(`AdicSpacesPartII:R1/affine-chart-analytification`). -/

-- AdicSpace.schemePullback: not stated here; needs adic spaces with underlying locally ringed
--   spaces and Huber's condition (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/locally-noetherian-adic-space)
-- AdicSpace.schemePullback.fst: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.snd: not stated here; needs the locally ringed space S_ of an adic
--   space (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.condition: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.schemePullback.lift: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.lift_fst: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.lift_snd: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.hom_ext: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.map: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.locallyOfFiniteType_fst: not stated here; needs morphisms locally of
--   finite type of adic spaces (supplier: AdicSpacesPartII:R0/finite-type-morphism-classes)
-- AdicSpace.schemePullback.isLocallyNoetherian: not stated here; needs Huber's condition on adic
--   spaces (supplier: AdicSpacesPartII:R0/locally-noetherian-adic-space)
-- AdicSpace.schemePullback.isoOpenSubscheme: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.schemePullback.trans: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.schemePullback.baseChangeIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.schemePullback.affineChart: not stated here; needs unions of affinoid adic spaces
--   (supplier: AdicSpaces Layer 5). Its charts are the rings `Huber.chartRing`.
-- schemePullback_test_affineLine: not stated here; needs morphisms Spa(D, D⁺) → X ×_Y S
--   (supplier: AdicSpaces Layer 5) [computation test]
-- schemePullback_test_id: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
--   [degenerate test]
-- schemePullback_test_empty: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
--   [degenerate test]
-- schemePullback_test_not_unit_disc: not stated here; needs morphisms of adic spaces into
--   Spa(K⟨T⟩, K°⟨T⟩) (supplier: AdicSpaces Layer 5) [non-example test]
-- schemePullback_test_finite: not stated here; needs the affinoid Spa(C ⊗_B A, …) of a finite
--   algebra over an affinoid (supplier: AdicSpacesPartII:R0/finite-algebra-over-affinoid)
--   [compatibility test]

/-! ## AdicSpacesPartII:R1/tft-plus-ring-power-bounded (lemma) -/

section TftPlus

open Huber

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- R1/tft-plus-ring-power-bounded: on a `K`-affinoid algebra `A` (presented by a continuous open
surjection `g : K⟨T⟩ → A`), a ring of integral elements `A⁺` makes `(K, K°) → (A, A⁺)`
topologically of finite type (some continuous open surjection `g' : K⟨T⟩ → A` with `A⁺` the
integral closure of `g'(K°⟨T⟩)`, `K°⟨T⟩` the power-bounded subring of `K⟨T⟩`) if and only if
`A⁺ = A°`. The equivalent ring statement, `A° = integral closure of g(K°⟨T⟩)`, is
`Huber.Affinoid.powerBoundedSubring_eq_integralClosure` (AdicSpacesPartII:R0/affinoid-power-bounded-integral). -/
theorem Huber.Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType {n : ℕ}
    (g : restrictedMvPowerSeriesCompletion n K →+* A) (hg : IsOpenQuotientMap g) (P : Pair A) :
    (∃ (m : ℕ) (g' : restrictedMvPowerSeriesCompletion m K →+* A), IsOpenQuotientMap g' ∧
        P.plus = (integralClosure
          ((powerBoundedSubring (restrictedMvPowerSeriesCompletion m K)).map g') A).toSubring) ↔
      P = Pair.powerBounded A := sorry

end TftPlus

/-! ## AdicSpacesPartII:R1/analytification-functor (construction)

Every item needs adic spaces over `Spa(K, K°)` (AdicSpaces Layer 5). The chart ring
`K⟨ϖ^k T⟩ / I` of `X = Spec K[T]/I` is stated as `AdicSpace.analytification.affineChart_ring`. -/

section AnalytificationChart

open Huber

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]

/-- R1/analytification-functor (ring-level core of `AdicSpace.analytification.affineChart`): the
chart ring `A_k = K⟨ϖ^k T₁,…,ϖ^k Tₙ⟩ / I·K⟨ϖ^k T⟩` of `X = Spec K[T₁,…,Tₙ]/I`, the functions on
the closed polydisc of radius `|ϖ|^{-k}` modulo `I`. Its plus ring is its power-bounded subring
(`Huber.Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType`). -/
abbrev AdicSpace.analytification.affineChart_ring {ϖ : K} (hϖ : IsPseudoUniformizer ϖ)
    (n k : ℕ) (I : Ideal (MvPolynomial (Fin n) K)) : Type _ :=
  chartRing (RingHom.id K) n k {ϖ} (hϖ.isWeightFamily_singleton_pow n k) I

end AnalytificationChart

-- AdicSpace.analytification: not stated here; needs adic spaces and the scheme pullback X ×_K Spa K
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R1/scheme-fibre-product-analytification)
-- AdicSpace.analytification.toScheme: not stated here; needs the locally ringed space of an adic
--   space (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.structureMorphism: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.locallyOfFiniteType: not stated here; needs morphisms locally of
--   finite type (supplier: AdicSpacesPartII:R0/finite-type-morphism-classes)
-- AdicSpace.analytificationFunctor: not stated here; needs the category Adic^lft_K
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/finite-type-morphism-classes)
-- AdicSpace.analytification.toScheme_naturality: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.homEquiv: not stated here; needs morphisms of adic spaces over Spa K
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.affineChart: not stated here; needs unions of affinoid adic spaces
--   (supplier: AdicSpaces Layer 5). Its ring-level core is
--   `AdicSpace.analytification.affineChart_ring`.
-- AdicSpace.analytification.isoOfPresentation: not stated here; needs isomorphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationSpecIso: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.analytification.isoOpenSubscheme: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.baseFieldIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.analytification.isLocallyNoetherian: not stated here; needs Huber's condition on adic
--   spaces (supplier: AdicSpacesPartII:R0/locally-noetherian-adic-space)
-- analytification_spec_field: not stated here; needs adic spaces (supplier: AdicSpaces Layer 5)
--   [degenerate test]
-- analytification_test_finiteExtension: not stated here; needs adic spaces and residue fields of
--   their points (supplier: AdicSpaces Layer 5) [computation test]
-- analytification_test_not_unitDisc: not stated here; needs affinoid adic spaces
--   (supplier: AdicSpaces Layer 5) [non-example test]
-- analytification_test_chart_polydisc: not stated here; needs the analytification
--   (supplier: AdicSpaces Layer 5) [compatibility test]. Its ring-level core, that the chart
--   `k = 0` is the Tate algebra `K⟨T₁,…,Tₙ⟩`, is the example below.
-- analytification_test_points_finiteAlgebra: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5) [characterisation test]

-- test analytification_test_chart_polydisc_core (compatibility) [R1/analytification-functor]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] {ϖ : K} (hϖ : Huber.IsPseudoUniformizer ϖ) (n : ℕ) :
    Nonempty (Huber.chartSeries K n 0 {ϖ} (hϖ.isWeightFamily_singleton_pow n 0) ≃+*
      Huber.restrictedMvPowerSeriesCompletion n K) := sorry

/-! ## AdicSpacesPartII:R1/analytification-universal-property (theorem) -/

-- AdicSpace.analytification_homEquiv_bijective: not stated here; needs adic spaces over Spa K
--   and their locally ringed spaces (supplier: AdicSpaces Layer 5). Node
--   AdicSpacesPartII:R1/analytification-universal-property; its affinoid ring-level core is
--   `AdicSpace.chart_exists_index_affinoid`.

/-! ## AdicSpacesPartII:R1/analytic-affine-space (lemma) -/

section AffineSpace

open Filter Topology

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] {n : ℕ}

-- AdicSpace.analyticAffineSpace_not_isCompact: not stated here; needs the adic space A^{n,ad}
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analyticAffineSpace_eq_iUnion_polydisc: not stated here; needs the adic space
--   A^{n,ad} and Tau Ceti's polydiscs as open subspaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analyticAffineSpace_globalSections: not stated here; needs global sections of the
--   structure sheaf of A^{n,ad} (supplier: AdicSpaces Layer 3, Layer 5). Its ring-level core,
--   `O(A^{n,ad}) = ⋂_k K⟨ϖ^k T⟩` inside `K⟦T⟧` is the ring of entire series, is
--   `AdicSpace.analyticAffineSpace_globalSections_series`.

/-- R1/analytic-affine-space (ring-level core of (iii)): a power series over `K` is restricted for
every chart weight `{ϖ^k}` (that is, lies in every `K⟨ϖ^k T⟩`) if and only if it is entire:
`|a_ν| r^{|ν|} → 0` for every real `r > 0`. -/
theorem AdicSpace.analyticAffineSpace_globalSections_series {ϖ : K} (hϖ0 : ϖ ≠ 0)
    (hϖ1 : ‖ϖ‖ < 1) (f : MvPowerSeries (Fin n) K) :
    (∀ k : ℕ, Huber.IsWeightedRestricted (fun _ : Fin n ↦ ({ϖ ^ k} : Set K)) f) ↔
      ∀ r : ℝ, 0 < r →
        Tendsto (fun ν : Fin n →₀ ℕ ↦ ‖MvPowerSeries.coeff ν f‖ * r ^ ν.degree) cofinite (𝓝 0) :=
  sorry

/-- R1/analytic-affine-space (ring-level core of (iii)): for `n ≥ 1` the entire series are more
than the polynomials, so `K[T₁,…,Tₙ]` is a proper subring of `O(A^{n,ad})`. -/
theorem AdicSpace.analyticAffineSpace_globalSections_ne_polynomial {ϖ : K} (hϖ0 : ϖ ≠ 0)
    (hϖ1 : ‖ϖ‖ < 1) (hn : 1 ≤ n) :
    ∃ f : MvPowerSeries (Fin n) K,
      (∀ k : ℕ, Huber.IsWeightedRestricted (fun _ : Fin n ↦ ({ϖ ^ k} : Set K)) f) ∧
        ∀ p : MvPolynomial (Fin n) K, (p : MvPowerSeries (Fin n) K) ≠ f := sorry

end AffineSpace

/-! ## AdicSpacesPartII:R1/analytification-immersions (lemma) -/

-- AdicSpace.analytification_isOpenEmbedding: not stated here; needs open embeddings of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification_isClosedEmbedding: not stated here; needs closed embeddings of adic
--   spaces (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.analytification_range_closedImmersion: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5). On a chart the closed piece is Spa(A_k/J'A_k, …), whose ring is
--   `Huber.chartRing` for the ideal `J + J'`.

/-! ## AdicSpacesPartII:R1/analytification-points (lemma) -/

-- AdicSpace.schemePullback.exists_preimage: not stated here; needs the points of X ×_Y S
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.toScheme_surjective: not stated here; needs X^ad
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.bijOn_classicalPoints_closedPoints: not stated here; needs residue
--   fields of points of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.toScheme_not_injective: not stated here; needs X^ad
--   (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R1/analytification-surjective (lemma) -/

-- AdicSpace.analytification_surjective_iff: not stated here; needs morphisms of adic spaces
--   (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R1/analytification-fibre-products (lemma) -/

-- AdicSpace.analytificationPullbackIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.analytificationFunctor.preservesFiniteProducts: not stated here; needs the category
--   Adic^lft_K (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R1/analytification-finite (lemma) -/

-- AdicSpace.analytification_isFinite: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism). The ring-level content, that `C ⊗_B A` is a
--   finite (projective of rank d) `A`-module, is Mathlib's base change (`Module.Finite.base_change`,
--   `Module.Projective.tensorProduct`, `Module.rankAtStalk_baseChange`).
-- AdicSpace.analytification_finiteProjective: not stated here; needs sections of O over affinoid
--   opens of adic spaces (supplier: AdicSpaces Layer 3, Layer 5)

/-! ## AdicSpacesPartII:R1/affinoid-subdomain (definition) -/

section AffinoidSubdomain

open Huber

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]

/-- R1/affinoid-subdomain (notation): the rational subdomain
`X(f₁,…,fₙ/f₀) = {x ∈ Max A : |f_j(x)| ≤ |f₀(x)| for all j}`. -/
def RigidSpace.rationalDomain {A : Type*} [CommRing A] [Algebra K A] {n : ℕ} (f₀ : A)
    (f : Fin n → A) : Set (MaximalSpectrum A) :=
  {x | ∀ j, Affinoid.evalNorm K (f j) x ≤ Affinoid.evalNorm K f₀ x}

open RigidSpace

variable {A : Type u} [CommRing A] [Algebra K A] [UniformSpace A] [IsUniformAddGroup A]
  [NonarchimedeanRing A] [CompleteSpace A] [T2Space A]

/-- R1/affinoid-subdomain: `U ⊆ Max A` is an affinoid subdomain if some `K`-affinoid `A`-algebra
`A_U` has `Max A_U → Max A` landing in `U` and represents the `K`-affinoid `A`-algebras `B` with
`Max B → Max A` landing in `U`: there is exactly one `A`-algebra map `A_U → B`. -/
def RigidSpace.IsAffinoidSubdomain (U : Set (MaximalSpectrum A)) : Prop :=
  ∃ (AU : Type u) (_ : CommRing AU) (_ : Algebra K AU) (_ : Algebra A AU)
    (_ : IsScalarTower K A AU) (_ : UniformSpace AU) (_ : IsUniformAddGroup AU)
    (_ : NonarchimedeanRing AU) (_ : CompleteSpace AU) (_ : T2Space AU),
    IsStrictlyTopologicallyFiniteType (algebraMap K AU) ∧
    (∀ y : MaximalSpectrum AU, y.asIdeal.comap (algebraMap A AU) ∈ MaximalSpectrum.asIdeal '' U) ∧
    ∀ (B : Type u) [CommRing B] [Algebra K B] [Algebra A B] [IsScalarTower K A B]
      [UniformSpace B] [IsUniformAddGroup B] [NonarchimedeanRing B] [CompleteSpace B]
      [T2Space B], IsStrictlyTopologicallyFiniteType (algebraMap K B) →
      (∀ y : MaximalSpectrum B, y.asIdeal.comap (algebraMap A B) ∈ MaximalSpectrum.asIdeal '' U) →
      Nonempty (Unique (AU →ₐ[A] B))

variable {K} {U V W : Set (MaximalSpectrum A)}

/-- R1/affinoid-subdomain: the coordinate ring `A_U`, a `K`-affinoid `A`-algebra, unique up to
unique `A`-isomorphism (a choice of the witness of `RigidSpace.IsAffinoidSubdomain`). -/
def RigidSpace.IsAffinoidSubdomain.coordRing (_h : IsAffinoidSubdomain K U) : Type u := sorry

/-- R1/affinoid-subdomain: the ring structure of the coordinate ring. -/
instance RigidSpace.IsAffinoidSubdomain.instCommRing (h : IsAffinoidSubdomain K U) :
    CommRing h.coordRing := sorry
/-- R1/affinoid-subdomain: the `K`-algebra structure of the coordinate ring. -/
instance RigidSpace.IsAffinoidSubdomain.instAlgebraField (h : IsAffinoidSubdomain K U) :
    Algebra K h.coordRing := sorry
/-- R1/affinoid-subdomain: the `A`-algebra structure `i : A → A_U` of the coordinate ring. -/
instance RigidSpace.IsAffinoidSubdomain.instAlgebra (h : IsAffinoidSubdomain K U) :
    Algebra A h.coordRing := sorry
/-- R1/affinoid-subdomain: `K → A → A_U` is a scalar tower. -/
instance RigidSpace.IsAffinoidSubdomain.instIsScalarTower (h : IsAffinoidSubdomain K U) :
    IsScalarTower K A h.coordRing := sorry
/-- R1/affinoid-subdomain: the uniform structure of the coordinate ring. -/
instance RigidSpace.IsAffinoidSubdomain.instUniformSpace (h : IsAffinoidSubdomain K U) :
    UniformSpace h.coordRing := sorry
/-- R1/affinoid-subdomain: the coordinate ring is a uniform additive group. -/
instance RigidSpace.IsAffinoidSubdomain.instIsUniformAddGroup (h : IsAffinoidSubdomain K U) :
    IsUniformAddGroup h.coordRing := sorry
/-- R1/affinoid-subdomain: the coordinate ring is a nonarchimedean ring. -/
instance RigidSpace.IsAffinoidSubdomain.instNonarchimedeanRing (h : IsAffinoidSubdomain K U) :
    NonarchimedeanRing h.coordRing := sorry
/-- R1/affinoid-subdomain: the coordinate ring is complete. -/
instance RigidSpace.IsAffinoidSubdomain.instCompleteSpace (h : IsAffinoidSubdomain K U) :
    CompleteSpace h.coordRing := sorry
/-- R1/affinoid-subdomain: the coordinate ring is Hausdorff. -/
instance RigidSpace.IsAffinoidSubdomain.instT2Space (h : IsAffinoidSubdomain K U) :
    T2Space h.coordRing := sorry

/-- R1/affinoid-subdomain: the coordinate ring is `K`-affinoid. -/
theorem RigidSpace.IsAffinoidSubdomain.isStrictlyTopologicallyFiniteType
    (h : IsAffinoidSubdomain K U) :
    IsStrictlyTopologicallyFiniteType (algebraMap K h.coordRing) := sorry

/-- R1/affinoid-subdomain (universal property): for a `K`-affinoid `A`-algebra `B` with
`Max B → Max A` landing in `U`, the unique `A`-algebra map `A_U → B` (unique by
`RigidSpace.IsAffinoidSubdomain.hom_ext`). -/
def RigidSpace.IsAffinoidSubdomain.lift (h : IsAffinoidSubdomain K U) (B : Type u) [CommRing B]
    [Algebra K B] [Algebra A B] [IsScalarTower K A B] [UniformSpace B] [IsUniformAddGroup B]
    [NonarchimedeanRing B] [CompleteSpace B] [T2Space B]
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B))
    (hBU : ∀ y : MaximalSpectrum B, y.asIdeal.comap (algebraMap A B) ∈ MaximalSpectrum.asIdeal '' U) :
    h.coordRing →ₐ[A] B := sorry

/-- R1/affinoid-subdomain (universal property): `A`-algebra maps out of `A_U` into such `B` are
unique. -/
theorem RigidSpace.IsAffinoidSubdomain.hom_ext (h : IsAffinoidSubdomain K U) {B : Type u}
    [CommRing B] [Algebra K B] [Algebra A B] [IsScalarTower K A B] [UniformSpace B]
    [IsUniformAddGroup B] [NonarchimedeanRing B] [CompleteSpace B] [T2Space B]
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B))
    (hBU : ∀ y : MaximalSpectrum B, y.asIdeal.comap (algebraMap A B) ∈ MaximalSpectrum.asIdeal '' U)
    (ψ₁ ψ₂ : h.coordRing →ₐ[A] B) : ψ₁ = ψ₂ := sorry

/-- R1/affinoid-subdomain: `Max(i) : Max A_U → U` is a bijection. -/
def RigidSpace.IsAffinoidSubdomain.maxSpectrumEquiv (h : IsAffinoidSubdomain K U) :
    MaximalSpectrum h.coordRing ≃ U := sorry

/-- R1/affinoid-subdomain: `Max(i)` is contraction of ideals, and it induces isomorphisms of residue
fields `A/(y ∩ A) ≅ A_U/y`. -/
theorem RigidSpace.IsAffinoidSubdomain.maxSpectrumEquiv_spec (h : IsAffinoidSubdomain K U)
    (y : MaximalSpectrum h.coordRing) :
    ((h.maxSpectrumEquiv y : MaximalSpectrum A)).asIdeal =
        y.asIdeal.comap (algebraMap A h.coordRing) ∧
      Function.Bijective (Ideal.quotientMap y.asIdeal (algebraMap A h.coordRing) le_rfl) := sorry

/-- R1/affinoid-subdomain: the restriction `ρ^U_V : A_U → A_V` for affinoid subdomains `V ⊆ U`. -/
def RigidSpace.IsAffinoidSubdomain.restrict (hU : IsAffinoidSubdomain K U)
    (hV : IsAffinoidSubdomain K V) (_hVU : V ⊆ U) : hU.coordRing →ₐ[A] hV.coordRing := sorry

/-- R1/affinoid-subdomain: `ρ^U_U = id` and `ρ^V_W ∘ ρ^U_V = ρ^U_W`. -/
theorem RigidSpace.IsAffinoidSubdomain.restrict_comp (hU : IsAffinoidSubdomain K U)
    (hV : IsAffinoidSubdomain K V) (hW : IsAffinoidSubdomain K W) (hVU : V ⊆ U) (hWV : W ⊆ V) :
    hU.restrict hU le_rfl = AlgHom.id A hU.coordRing ∧
      (hV.restrict hW hWV).comp (hU.restrict hV hVU) = hU.restrict hW (hWV.trans hVU) := sorry

/-- R1/affinoid-subdomain: a rational subdomain `X(f/f₀)` (the `fⱼ` and `f₀` without common zero)
is an affinoid subdomain with coordinate ring `A⟨f/f₀⟩ = A⟨T₁,…,Tₙ⟩/(f₀Tⱼ − fⱼ)`. -/
theorem RigidSpace.IsAffinoidSubdomain.rational
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ} (f₀ : A) (f : Fin n → A)
    (hf : Ideal.span (insert f₀ (Set.range f)) = ⊤) :
    ∃ h : IsAffinoidSubdomain K (rationalDomain K f₀ f),
      Nonempty (h.coordRing ≃ₐ[A] (restrictedMvPowerSeriesCompletion n A ⧸
        Ideal.span (Set.range fun j ↦ TateAlgebra.ofMvPolynomial A n
          (MvPolynomial.C f₀ * MvPolynomial.X j - MvPolynomial.C (f j))))) := sorry

/-- R1/affinoid-subdomain: `U ∩ U'` is an affinoid subdomain (with coordinate ring
`A_U ⊗̂_A A_{U'}`, the completed tensor product of AdicSpacesPartII:R0/completed-tensor-product). -/
theorem RigidSpace.IsAffinoidSubdomain.inter (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (hV : IsAffinoidSubdomain K V) :
    IsAffinoidSubdomain K (U ∩ V) := sorry

/-- R1/affinoid-subdomain: for `A → B`, `Max(φ)⁻¹(U)` is an affinoid subdomain of `Max B` (with
coordinate ring `A_U ⊗̂_A B`). -/
theorem RigidSpace.IsAffinoidSubdomain.preimage (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {B : Type u} [CommRing B]
    [Algebra K B] [Algebra A B] [IsScalarTower K A B] [UniformSpace B] [IsUniformAddGroup B]
    [NonarchimedeanRing B] [CompleteSpace B] [T2Space B]
    (hB : IsStrictlyTopologicallyFiniteType (algebraMap K B)) :
    IsAffinoidSubdomain K
      {y : MaximalSpectrum B | y.asIdeal.comap (algebraMap A B) ∈ MaximalSpectrum.asIdeal '' U} :=
  sorry

/-- R1/affinoid-subdomain: a subset of `U = Max A_U` is an affinoid subdomain of `Max A_U` iff its
image is an affinoid subdomain of `Max A`. -/
theorem RigidSpace.IsAffinoidSubdomain.trans (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (V' : Set (MaximalSpectrum hU.coordRing)) :
    IsAffinoidSubdomain K V' ↔
      IsAffinoidSubdomain K (Subtype.val '' (hU.maxSpectrumEquiv '' V')) := sorry

/-- R1/affinoid-subdomain: for `x ∈ U` with maximal ideal `m` and `k ≥ 1`, `A/mᵏ → A_U/mᵏA_U` is an
isomorphism (BGR 7.2.2/1). -/
theorem RigidSpace.IsAffinoidSubdomain.quotient_pow_equiv (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {x : MaximalSpectrum A}
    (hx : x ∈ U) {k : ℕ} (hk : 1 ≤ k) :
    Function.Bijective (Ideal.quotientMap ((x.asIdeal ^ k).map (algebraMap A hU.coordRing))
      (algebraMap A hU.coordRing) Ideal.le_comap_map) := sorry

/-- R1/affinoid-subdomain: for a rational subdomain, `Spa(A_U, A_U°) → Spa(A, A°)` has image the
anchor's rational subset `R(f/f₀)` (Tau Ceti `ValuationSpectrum.rationalSubset`). -/
theorem RigidSpace.IsAffinoidSubdomain.spa_compat [DecidableEq A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {n : ℕ} (f₀ : A) (f : Fin n → A)
    (hf : Ideal.span (insert f₀ (Set.range f)) = ⊤)
    (h : IsAffinoidSubdomain K (rationalDomain K f₀ f)) :
    ValuationSpectrum.comap (algebraMap A h.coordRing) ''
        ValuationSpectrum.spa (powerBoundedSubring h.coordRing) =
      ValuationSpectrum.rationalSubset (powerBoundedSubring A) (Finset.univ.image f) f₀ := sorry

-- RigidSpace.IsAffinoidSubdomain.flat: stated under AdicSpacesPartII:R1/affinoid-subdomain-flat.

/- In `Max K⟨T⟩`, `{|T| ≤ |c|}` is a Weierstrass domain with coordinate ring `K⟨S⟩`, `T ↦ cS`. -/
-- test isAffinoidSubdomain_test_disc (computation) [R1/affinoid-subdomain]
example {c : K} (hc0 : 0 < ‖c‖) (hc1 : ‖c‖ ≤ 1) :
    let T := TateAlgebra.ofMvPolynomial K 1 (MvPolynomial.X 0)
    ∃ h : IsAffinoidSubdomain K
        {x : MaximalSpectrum (restrictedMvPowerSeriesCompletion 1 K) |
          Affinoid.evalNorm K T x ≤ ‖c‖₊},
      ∃ e : h.coordRing ≃ₐ[K] restrictedMvPowerSeriesCompletion 1 K,
        e (algebraMap (restrictedMvPowerSeriesCompletion 1 K) h.coordRing T) = c • T := sorry

/- The open unit disc is not an affinoid subdomain of `Max K⟨T⟩`. -/
-- test isAffinoidSubdomain_test_openDisc (non-example) [R1/affinoid-subdomain]
example :
    ¬ IsAffinoidSubdomain K
      {x : MaximalSpectrum (restrictedMvPowerSeriesCompletion 1 K) |
        Affinoid.evalNorm K (TateAlgebra.ofMvPolynomial K 1 (MvPolynomial.X 0)) x < 1} := sorry

-- test isAffinoidSubdomain_test_univ (degenerate) [R1/affinoid-subdomain]
example (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) :
    (∃ h : IsAffinoidSubdomain K (Set.univ : Set (MaximalSpectrum A)),
        Function.Bijective (algebraMap A h.coordRing)) ∧
      ∃ h : IsAffinoidSubdomain K (∅ : Set (MaximalSpectrum A)), Subsingleton h.coordRing :=
  sorry

/- The coordinate ring of `X(f/f₀)` is Tau Ceti's completed rational localisation `A⟨f/f₀⟩` of the
anchor, as a topological ring. -/
-- test isAffinoidSubdomain_test_rational_compat (compatibility) [R1/affinoid-subdomain]
example [DecidableEq A] (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (P : PairOfDefinition A)
    {n : ℕ} (f₀ : A) (f : Fin n → A) (hf : Ideal.span (insert f₀ (Set.range f)) = ⊤)
    (hden : PairOfDefinition.HasDenominatorPower P (Finset.univ.image f) f₀
      (Localization.Away f₀))
    (h : IsAffinoidSubdomain K (rationalDomain K f₀ f)) :
    letI := PairOfDefinition.locUniformSpace P (Finset.univ.image f) f₀ (Localization.Away f₀) hden
    ∃ e : h.coordRing ≃+* UniformSpace.Completion (Localization.Away f₀),
      Continuous e ∧ Continuous e.symm := sorry

/-! ## AdicSpacesPartII:R1/affinoid-subdomain-flat (lemma) -/

/-- R1/affinoid-subdomain-flat: `A → A_U` is flat. -/
theorem RigidSpace.IsAffinoidSubdomain.flat (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) : Module.Flat A hU.coordRing :=
  sorry

/-- R1/affinoid-subdomain-flat: for a finite covering of `Max A` by affinoid subdomains,
`A → ∏ᵢ A_{Uᵢ}` is faithfully flat. -/
theorem RigidSpace.faithfullyFlat_pi_coordRing
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {ι : Type} [Fintype ι]
    {U : ι → Set (MaximalSpectrum A)} (hU : ∀ i, IsAffinoidSubdomain K (U i))
    (hcov : (⋃ i, U i) = Set.univ) :
    Module.FaithfullyFlat A ((i : ι) → (hU i).coordRing) := sorry

/-! ## AdicSpacesPartII:R1/gerritzen-grauert (theorem) -/

/-- R1/gerritzen-grauert: for an affinoid subdomain `U`, there is a finite covering of `Max A` by
rational subdomains `Vᵢ` such that each `U ∩ Vᵢ` is a rational subdomain of `Max A_{Vᵢ}`. -/
theorem RigidSpace.IsAffinoidSubdomain.exists_rationalCover (hU : IsAffinoidSubdomain K U)
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) :
    ∃ (m : ℕ) (V : Fin m → Set (MaximalSpectrum A)) (hV : ∀ i, IsAffinoidSubdomain K (V i)),
      (∀ i, ∃ (p : ℕ) (g₀ : A) (g : Fin p → A),
        Ideal.span (insert g₀ (Set.range g)) = ⊤ ∧ V i = rationalDomain K g₀ g) ∧
      (⋃ i, V i) = Set.univ ∧
      ∀ i, ∃ (p : ℕ) (g₀ : (hV i).coordRing) (g : Fin p → (hV i).coordRing),
        Ideal.span (insert g₀ (Set.range g)) = ⊤ ∧
          U ∩ V i = Subtype.val '' ((hV i).maxSpectrumEquiv '' rationalDomain K g₀ g) := sorry

/-- R1/gerritzen-grauert: in particular an affinoid subdomain is a finite union of rational
subdomains of `Max A`. -/
theorem RigidSpace.IsAffinoidSubdomain.exists_eq_iUnion_rationalDomain
    (hU : IsAffinoidSubdomain K U) (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) :
    ∃ (m : ℕ) (p : Fin m → ℕ) (g₀ : Fin m → A) (g : (i : Fin m) → Fin (p i) → A),
      (∀ i, Ideal.span (insert (g₀ i) (Set.range (g i))) = ⊤) ∧
        U = ⋃ i, rationalDomain K (g₀ i) (g i) := sorry

/-! ## AdicSpacesPartII:R1/affinoid-covering-tate-acyclicity (theorem) -/

/-- R1/affinoid-covering-tate-acyclicity, degrees `0` and `1`: for a finite covering of `Max A` by
affinoid subdomains and any `A`-module `M`, `M → ∏ M ⊗ A_{Uᵢ}` is injective and its image is the
set of families agreeing in every `M ⊗ A_{Uᵢ ∩ Uⱼ}`. The vanishing of the higher Čech cohomology is
not stated here; it needs the Čech complex of a finite covering (supplier: AdicSpaces Layer 4). -/
theorem RigidSpace.cech_exact_of_affinoidCover
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {ι : Type} [Fintype ι]
    {U : ι → Set (MaximalSpectrum A)} (hU : ∀ i, IsAffinoidSubdomain K (U i))
    (hcov : (⋃ i, U i) = Set.univ) (M : Type u) [AddCommGroup M] [Module A M] :
    Function.Injective (fun m : M ↦ fun i ↦ (1 : (hU i).coordRing) ⊗ₜ[A] m) ∧
      ∀ s : (i : ι) → TensorProduct A (hU i).coordRing M,
        (∀ i j, LinearMap.rTensor M ((hU i).restrict ((hU i).inter hA (hU j))
            Set.inter_subset_left).toLinearMap (s i) =
          LinearMap.rTensor M ((hU j).restrict ((hU i).inter hA (hU j))
            Set.inter_subset_right).toLinearMap (s j)) →
        ∃ m : M, ∀ i, s i = (1 : (hU i).coordRing) ⊗ₜ[A] m := sorry

/-! ## AdicSpacesPartII:R1/rigid-local-ring-completion (lemma) -/

-- RigidSpace.stalk_completion_equiv: not stated here; needs the stalk O_x = colim_{U ∋ x} A_U of
--   Tate's structure sheaf on Sp A (supplier: AdicSpacesPartII:R1/rigid-analytic-space). Its
--   ring-level core, `A/mᵏ ≅ A_U/mᵏA_U` for every affinoid subdomain U ∋ x, is
--   `RigidSpace.IsAffinoidSubdomain.quotient_pow_equiv`.

end AffinoidSubdomain

/-! ## AdicSpacesPartII:R1/rigid-analytic-space (definition)

Rigid-analytic spaces are locally G-ringed `K`-spaces with an admissible covering by affinoid
spaces `Sp A`. No library has G-topologized ringed spaces, and the affinoid subdomains of `Max A`
need rational localisation of affinoid algebras (AdicSpaces Layer 3), so every item is a
comment. The points of `Sp A` are Mathlib's `MaximalSpectrum A`; that ring-level core is used in
the test examples below. -/

-- RigidSpace: not stated here; needs locally G-ringed K-spaces with Tate's G-topology on Max A,
--   which no library has (supplier: AdicSpacesPartII:R1/rigid-analytic-space, over AdicSpaces
--   Layer 3 for affinoid subdomains)
-- RigidSpace.Sp: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space). Its set of points is `MaximalSpectrum A`.
-- RigidSpace.Sp.map: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.homSpEquiv: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.IsAdmissibleOpen: not stated here; needs Tate's G-topology (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 3)
-- RigidSpace.IsAdmissibleCover: not stated here; needs Tate's G-topology (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 3)
-- RigidSpace.restrict: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.glue: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.IsSeparated: not stated here; needs closed immersions of rigid spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.IsQuasiSeparated: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.IsProper: not stated here; needs relative compactness in rigid spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.pullback: not stated here; needs rigid-analytic spaces and completed tensor products
--   of affinoid algebras (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/completed-tensor-product)
-- RigidSpace.test_sp_point: not stated here; needs Sp K (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]. Its ring-level core (Max K is one
--   point, Max 0 is empty) is the example below.
-- RigidSpace.test_sp_homEquiv: not stated here; needs morphisms of rigid spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [characterisation test]
-- RigidSpace.test_nonadmissible_cover: not stated here; needs admissible coverings (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [non-example test]
-- RigidSpace.test_global_sections: not stated here; needs O(Sp A) (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [computation test]. Its ring-level core,
--   `K⟨T⟩/(T² − T) ≅ K × K` with two maximal ideals, is the example below.

-- test RigidSpace.test_sp_point_core (degenerate) [R1/rigid-analytic-space]
example (K : Type*) [Field K] :
    Nat.card (MaximalSpectrum K) = 1 ∧ IsEmpty (MaximalSpectrum PUnit) := sorry

-- test RigidSpace.test_global_sections_core (computation) [R1/rigid-analytic-space]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] :
    let T : Huber.restrictedMvPowerSeriesCompletion 1 K :=
      (Huber.weightedPolynomialHom (fun _ : Fin 1 ↦ ({1} : Set K)) Huber.isWeightFamily_one_weight
        (MvPolynomial.X 0) : Huber.restrictedMvPowerSeriesCompletion 1 K)
    Nonempty ((Huber.restrictedMvPowerSeriesCompletion 1 K ⧸ Ideal.span {T ^ 2 - T}) ≃+* K × K) ∧
      Nat.card (MaximalSpectrum (Huber.restrictedMvPowerSeriesCompletion 1 K ⧸
        Ideal.span {T ^ 2 - T})) = 2 := sorry

/-! ## AdicSpacesPartII:R1/affinoid-domain-equidimensional (lemma) -/

section Equidimensional

open Huber

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A : Type u} [CommRing A] [Algebra K A] [UniformSpace A] [IsUniformAddGroup A]
  [NonarchimedeanRing A] [CompleteSpace A] [T2Space A]

/-- R1/affinoid-domain-equidimensional: in a `K`-affinoid integral domain every maximal ideal has
height `dim A` (Conrad, Irreducible components of rigid spaces, Lemma 2.1.5). -/
theorem RigidSpace.height_eq_ringKrullDim_of_isDomain [IsDomain A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (m : Ideal A) [m.IsMaximal] :
    (m.height : WithBot ℕ∞) = ringKrullDim A := sorry

/-- R1/affinoid-domain-equidimensional: a finite injective `K⟨T₁,…,T_e⟩ → A` into a `K`-affinoid
integral domain has `e = dim A`. -/
theorem RigidSpace.eq_ringKrullDim_of_finite_injective [IsDomain A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {e : ℕ}
    (ι : restrictedMvPowerSeriesCompletion e K →ₐ[K] A) (hι : Function.Injective ι)
    (hfin : ι.Finite) : ((e : ℕ∞) : WithBot ℕ∞) = ringKrullDim A := sorry

end Equidimensional

/-! ## AdicSpacesPartII:R1/rigid-identity-principle (lemma) -/

-- RigidSpace.identity_principle: not stated here; needs connected normal rigid-analytic spaces,
--   coherent ideal sheaves and their analytic subsets (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space). Its affinoid core for (iii), that a function on an
--   integral `K`-affinoid space vanishing on a nonempty affinoid subdomain is zero, is
--   `RigidSpace.injective_algebraMap_coordRing_of_isDomain`.

section IdentityPrinciple

open Huber

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A : Type u} [CommRing A] [Algebra K A] [UniformSpace A] [IsUniformAddGroup A]
  [NonarchimedeanRing A] [CompleteSpace A] [T2Space A]

/-- R1/rigid-identity-principle (affinoid core of (iii)): for a `K`-affinoid integral domain `A`
and a nonempty affinoid subdomain `U ⊆ Max A`, restriction `A → A_U` is injective. -/
theorem RigidSpace.injective_algebraMap_coordRing_of_isDomain [IsDomain A]
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) {U : Set (MaximalSpectrum A)}
    (hU : RigidSpace.IsAffinoidSubdomain K U) (hne : U.Nonempty) :
    Function.Injective (algebraMap A hU.coordRing) := sorry

end IdentityPrinciple

/-! ## AdicSpacesPartII:R1/rigid-adic-comparison-functor (construction) -/

-- AdicSpace.rigidToAdic: not stated here; needs rigid-analytic spaces and adic spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 5)
-- AdicSpace.rigidToAdic_Sp: not stated here; needs rigid and adic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 5)
-- AdicSpace.rigidToAdic_isAdmissibleCover_iff: not stated here; needs admissible coverings
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- AdicSpace.rigidToAdic.preservesPullbacks: not stated here; needs fibre products of rigid and
--   adic spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.rigidToAdic.rho: not stated here; needs morphisms of ringed sites from adic spaces to
--   rigid spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 5)
-- AdicSpace.rigidToAdic.lift: not stated here; needs adic spaces locally of finite type over
--   Spa K and locally coherent morphisms of ringed sites (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- AdicSpace.rigidToAdic.isOpenImmersion_map: not stated here; needs open immersions of rigid and
--   adic spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 5)
-- AdicSpace.rigidToAdic.classicalPointsEquiv: not stated here; needs classical points of adic
--   spaces (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R1/rigid-analytic-space)
-- AdicSpace.rigidToAdic.locallyOfFiniteType: not stated here; needs morphisms locally of finite
--   type of adic spaces (supplier: AdicSpacesPartII:R0/finite-type-morphism-classes)
-- rigidToAdic_test_point: not stated here; needs r_K (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]
-- rigidToAdic_test_gaussPoint: not stated here; needs the underlying space of r_K(Sp K⟨T⟩)
--   (supplier: AdicSpaces Layer 5) [non-example test]
-- rigidToAdic_test_nonadmissible_cover: not stated here; needs admissible coverings and r_K
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [characterisation test]
-- rigidToAdic_test_Sp_compat: not stated here; needs r_K (supplier: AdicSpaces Layer 5); its
--   target is Tau Ceti's `ValuationSpectrum.spa` of `Huber.Pair.powerBounded (K⟨T⟩)`
--   [compatibility test]
-- rigidToAdic_test_bidisc: not stated here; needs fibre products of rigid and adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence) [computation test]

/-! ## AdicSpacesPartII:R1/rigid-adic-etale-comparison (comparison) -/

-- AdicSpacesPartII:R1/rigid-adic-etale-comparison: not stated here; needs rigid analytic spaces
--   with their local rings and adic spaces locally of finite type over `Spa K` (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space, anchor Layer 5). For a morphism `f` of rigid spaces,
--   `r_K(f)` is étale (unramified, smooth) in Huber's sense iff `f` is étale (unramified, smooth) in
--   the rigid sense (Huber 1996, 1.7.10–1.7.11; de Jong–van der Put, Observations 3.1.1–3.1.2).

/-! ## AdicSpacesPartII:R1/analytification-completed-local-rings (lemma) -/

-- AdicSpace.analytification.completedStalkIso: not stated here; needs stalks of the structure
--   sheaf of X^ad and classical points (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.cotangentSpaceEquiv: not stated here; needs stalks of X^ad
--   (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R1/analytification-map-flat (lemma) -/

section Flat

open Huber

-- AdicSpace.analytification.flat_stalkMap: not stated here; needs stalks of X^ad and the map
--   q_X (supplier: AdicSpaces Layer 5). Its ring-level core on charts is
--   `AdicSpace.analytification.flat_chart_affinoid` (and
--   `AdicSpace.analytification.flat_chart_affinoid_of_isNoetherianRing` relatively).

/-- R1/analytification-map-flat (ring-level core, absolute case): for a complete rank-one field
`K` with pseudouniformizer `ϖ`, each chart ring `K⟨ϖ^k T₁,…,ϖ^k Tₙ⟩` is flat over the polynomial
ring `K[T₁,…,Tₙ]`; base change along `K[T] → K[T]/I` gives the flatness of the chart `A_k` over
`C = K[T]/I`, from which the flatness of the stalk maps of `q_X` follows. -/
theorem AdicSpace.analytification.flat_chart_affinoid (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [NonarchimedeanRing K] {ϖ : K}
    (hϖ : IsPseudoUniformizer ϖ) (n k : ℕ) :
    (chartSeries.ofPolynomial K n k {ϖ} (hϖ.isWeightFamily_singleton_pow n k)).Flat := sorry

/-- R1/analytification-map-flat (ring-level core, relative case with a noetherian ring of
definition): for a complete Tate ring `A` with pseudouniformizer `ϖ` and a pair of definition
whose ring of definition is noetherian, each chart ring `A⟨ϖ^k T₁,…,ϖ^k Tₙ⟩` is flat over
`A[T₁,…,Tₙ]` (it is the localisation at `ϖ` of the adic completion of a noetherian ring). The
node's relative statement for an arbitrary strongly noetherian Tate affinoid (Zavyalov
Lemma 6.7) is about stalks of `X ×_{Spec A} Spa(A, A⁺)` and is not stated here. -/
theorem AdicSpace.analytification.flat_chart_affinoid_of_isNoetherianRing {A : Type*} [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A]
    [T2Space A] (P : PairOfDefinition A) (hP : IsNoetherianRing P.ringOfDefinition) {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) (n k : ℕ) :
    (chartSeries.ofPolynomial A n k {ϖ} (hϖ.isWeightFamily_singleton_pow n k)).Flat := sorry

end Flat

/-! ## AdicSpacesPartII:R1/analytification-of-modules (construction) -/

-- AdicSpace.analytificationModule: not stated here; needs the structure sheaf of X^ad as a sheaf
--   of rings and sheaves of modules on it (supplier: AdicSpaces Layer 3, Layer 5)
-- AdicSpace.analytificationModule.map: not stated here; needs sheaves of modules on X^ad
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.exact: not stated here; needs sheaves of modules on X^ad
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.unitIso: not stated here; needs O_{X^ad} (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.tensorIso: not stated here; needs sheaves of modules on X^ad
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.pullbackIso: not stated here; needs pullback of modules along
--   morphisms of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.ideal_injective: not stated here; needs ideal sheaves on X^ad
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.idealSheaf_closedImmersion: not stated here; needs closed
--   embeddings of adic spaces (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.analytificationModule.stalkIso: not stated here; needs stalks on X^ad (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.analytificationModule.chartSections: not stated here; needs sections over affinoid
--   opens of X^ad (supplier: AdicSpaces Layer 3, Layer 5). The sections are the module
--   `M ⊗[C] A_k` over the chart ring `Huber.chartRing`.
-- analytification_modules_test_structureSheaf: not stated here; needs O_{X^ad} (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- analytification_modules_test_skyscraper: not stated here; needs skyscraper sheaves on A^{1,ad}
--   (supplier: AdicSpaces Layer 5) [computation test]
-- analytification_modules_test_ideal: not stated here; needs ideal sheaves on X^ad (supplier:
--   AdicSpaces Layer 5) [characterisation test]
-- analytification_modules_test_exact: not stated here; needs sheaves of modules on A^{1,ad}
--   (supplier: AdicSpaces Layer 5) [compatibility test]. Its ring-level core, that `T` is a
--   nonzerodivisor on every chart `K⟨ϖ^k T⟩`, is the example below.
-- analytification_modules_test_affine_tilde: not stated here; needs sections of (M̃)^ad over
--   charts (supplier: AdicSpaces Layer 3, Layer 5) [compatibility test]

-- test analytification_modules_test_exact_core (compatibility) [R1/analytification-of-modules]
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] {ϖ : K} (hϖ : Huber.IsPseudoUniformizer ϖ) (k : ℕ) :
    Huber.chartSeries.ofPolynomial K 1 k {ϖ} (hϖ.isWeightFamily_singleton_pow 1 k)
      (MvPolynomial.X 0) ∈ nonZeroDivisors _ := sorry

/-! ## AdicSpacesPartII:R1/analytic-kahler-differentials (lemma) -/

-- AdicSpace.analytificationKaehlerIso: not stated here; needs the sheaf of continuous
--   differentials of a morphism of adic spaces (supplier:
--   AdicSpacesPartII:R0/continuous-differentials, AdicSpaces Layer 5). On charts it is the
--   isomorphism `A_k ⊗[C] Ω[C⁄B'] ≅ Ω^cont_{A_k/A'}` of R0's continuous differentials.

/-! ## AdicSpacesPartII:R1/analytification-etale-smooth (lemma) -/

-- AdicSpace.analytification_isEtale: not stated here; needs étale morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale)
-- AdicSpace.analytification_isSmooth: not stated here; needs smooth morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/smooth-morphism)
-- AdicSpace.analytification_isUnramified: not stated here; needs unramified morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/unramified-morphism)

/-! ## AdicSpacesPartII:R1/rigid-analytification (construction) -/

-- RigidSpace.analytification: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.analytification.toScheme: not stated here; needs morphisms of locally G-ringed
--   spaces to schemes (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.analytification.homEquiv: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.analytificationFunctor: not stated here; needs the category of rigid spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.analytification.bijective_closedPoints: not stated here; needs rigid-analytic spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- RigidSpace.analytification.pullbackIso: not stated here; needs fibre products of rigid spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- rigidAnalytification_test_point: not stated here; needs rigid-analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]
-- rigidAnalytification_test_affineLine_hom: not stated here; needs morphisms of rigid spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [characterisation test]
-- rigidAnalytification_test_closedPoints: not stated here; needs rigid-analytic spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [computation test]. Its scheme-level
--   core, that the closed points of A¹_K are the monic irreducible polynomials (and `K` itself
--   when `K` is algebraically closed), is the example below.
-- rigidAnalytification_test_not_qc: not stated here; needs quasi-compactness of rigid spaces
--   (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [non-example test]

-- test rigidAnalytification_test_closedPoints_core (computation) [R1/rigid-analytification]
example (K : Type*) [Field K] :
    Nonempty (MaximalSpectrum (Polynomial K) ≃
      {p : Polynomial K // p.Monic ∧ Irreducible p}) ∧
      (IsAlgClosed K → Nonempty (MaximalSpectrum (Polynomial K) ≃ K)) := sorry

/-! ## AdicSpacesPartII:R1/rigid-adic-quasi-separated-equivalence (theorem) -/

-- AdicSpace.rigidToAdic.full: not stated here; needs the functor r_K (supplier:
--   AdicSpacesPartII:R1/rigid-adic-comparison-functor)
-- AdicSpace.rigidToAdic.faithful: not stated here; needs the functor r_K (supplier:
--   AdicSpacesPartII:R1/rigid-adic-comparison-functor)
-- AdicSpace.rigidToAdic.quasiSeparatedEquivalence: not stated here; needs quasi-separated rigid
--   and adic spaces (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor,
--   AdicSpacesPartII:R0/separated-morphism)
-- AdicSpace.rigidToAdic_isAffinoid_iff: not stated here; needs affinoid rigid and adic spaces
--   (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor)

/-! ## AdicSpacesPartII:R1/rigid-adic-topos-equivalence (theorem) -/

-- AdicSpace.rigidToAdic.toposEquivalence: not stated here; needs sheaves on rigid spaces and on
--   adic spaces (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R1/rigid-analytification-comparison (comparison) -/

-- AdicSpace.rigidToAdic_analytificationIso: not stated here; needs r_K, X^an and X^ad (supplier:
--   AdicSpacesPartII:R1/rigid-adic-comparison-functor, AdicSpacesPartII:R1/rigid-analytification)

/-! ## AdicSpacesPartII:R1/proper-separated-comparisons (comparison) -/

-- AdicSpace.rigidToAdic_isSeparated_iff: not stated here; needs separated morphisms of rigid and
--   adic spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/separated-morphism)
-- AdicSpace.rigidToAdic_isProper_of_isProper: not stated here; needs proper morphisms of rigid
--   and adic spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.rigidToAdic_isProper_iff_of_discrete: not stated here; needs proper morphisms of rigid
--   and adic spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/universally-closed-and-proper-morphism)

/-! ## AdicSpacesPartII:R1/analytification-constructible-closure (lemma) -/

-- AdicSpace.analytification.preimage_closure: not stated here; needs the topological space of
--   X^ad and q_X (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytification.isClosed_iff: not stated here; needs X^ad (supplier: AdicSpaces
--   Layer 5)

/-! ## AdicSpacesPartII:R1/analytification-connected (lemma) -/

-- AdicSpace.analytification_connectedSpace_iff: not stated here; needs X^ad (supplier:
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R1/analytic-projective-space-proper (lemma) -/

-- AdicSpace.analyticProjectiveSpace_isProper: not stated here; needs proper morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)

/-! ## AdicSpacesPartII:R1/analytification-separated-proper (theorem) -/

-- AdicSpace.analytification_isSeparated_iff: not stated here; needs separated morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/separated-morphism)
-- AdicSpace.analytification_isProper: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.isProper_of_analytification: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.schemePullback_isProper: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)

/-! ## AdicSpacesPartII:R1/analytification-reflects-finite-closed-immersion (theorem) -/

-- AdicSpace.analytification_isFinite_iff: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism)
-- AdicSpace.analytification_isClosedImmersion_iff: not stated here; needs closed embeddings of
--   adic spaces (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)

/-! ## AdicSpacesPartII:R1/analytification-reflects-etale-smooth (theorem) -/

-- AdicSpace.analytification_etale_iff: not stated here; needs étale morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale)
-- AdicSpace.analytification_smooth_iff: not stated here; needs smooth morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/smooth-morphism)

/-! ## AdicSpacesPartII:R1/analytification-group-objects (construction) -/

-- AdicSpace.analytificationFunctor.monoidal: not stated here; needs the cartesian monoidal
--   category Adic^lft_K (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.analytificationGrp: not stated here; needs group objects in Adic^lft_K (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.mul_def: not stated here; needs group objects in Adic^lft_K
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.one_def: not stated here; needs group objects in Adic^lft_K
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.inv_def: not stated here; needs group objects in Adic^lft_K
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.map: not stated here; needs group objects in Adic^lft_K
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.pointsMulEquiv: not stated here; needs morphisms from affinoid
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationCommGrp: not stated here; needs commutative group objects in
--   Adic^lft_K (supplier: AdicSpaces Layer 5)
-- AdicSpace.analytificationGrp.relative: not stated here; needs group objects over an adic space
--   (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification)
-- AdicSpace.analytificationGrp.isFinite_of_finiteLocallyFree: not stated here; needs finite
--   morphisms of adic spaces (supplier: AdicSpacesPartII:R0/finite-morphism)
-- AdicSpace.analytificationGrp.abelianVariety_isProper: not stated here; needs proper morphisms
--   of adic spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.analytificationGrp.abelianVariety_smooth: not stated here; needs smooth morphisms of
--   adic spaces (supplier: AdicSpacesPartII:R0/smooth-morphism)
-- AdicSpace.analytificationGrp.isogeny_isFinite: not stated here; needs finite morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/finite-morphism)
-- AdicSpace.analytificationGrp.kernelIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- analytificationGrp_test_trivial: not stated here; needs group objects in Adic^lft_K (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- analytificationGrp_test_Ga_points: not stated here; needs morphisms from affinoid adic spaces
--   (supplier: AdicSpaces Layer 5) [computation test]
-- analytificationGrp_test_unitCircle: not stated here; needs open subgroups of G_m^ad (supplier:
--   AdicSpaces Layer 5) [non-example test]
-- analytificationGrp_test_alphaP: not stated here; needs finite analytic groups (supplier:
--   AdicSpaces Layer 5) [compatibility test]
-- analytificationGrp_test_abelianVariety: not stated here; needs proper smooth morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism,
--   AdicSpacesPartII:R0/smooth-morphism) [characterisation test]

/-! ## AdicSpacesPartII:R1/finite-locally-free-quotient (lemma) -/

-- AdicSpace.isCoequalizer_of_finiteLocallyFree_surjective: not stated here; needs coequalizers in
--   Adic^lft_K (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/finite-morphism)

/-! ## AdicSpacesPartII:R1/analytification-finite-quotient (theorem) -/

-- AdicSpace.analytification_isQuotient: not stated here; needs group objects in Adic^lft_K and
--   their quotients (supplier: AdicSpacesPartII:R1/analytification-group-objects)
-- AdicSpace.analytification_torsorIso: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R1/analytic-invariant-differentials (lemma) -/

-- AdicSpace.analytificationInvariantDifferentialIso: not stated here; needs continuous
--   differentials on adic spaces (supplier: AdicSpacesPartII:R0/continuous-differentials,
--   AdicSpaces Layer 5)
-- AdicSpace.analytificationInvariantDifferential_abelianVariety: not stated here; needs ω of
--   A^ad (supplier: AdicSpacesPartII:R0/continuous-differentials, AdicSpaces Layer 5)
-- AdicSpace.analytificationInvariantDifferential_affine: not stated here; needs ω of an
--   analytified affine group (supplier: AdicSpacesPartII:R0/continuous-differentials,
--   AdicSpaces Layer 5)

end TauCeti

end

/-! # Layer F0. Noetherian formal geometry -/

noncomputable section

namespace TauCeti

open TensorProduct

/-! ## AdicSpacesPartII:F0/adic-ring (definition) -/

/-- F0/adic-ring: a commutative topological ring `A` is an *adic ring of finite ideal type*
(EGA 0, 7.1.9) when its topology is the `I`-adic topology of a finitely generated ideal `I`
(Mathlib `IsAdic I`) and `A` is `I`-adically separated and complete (`IsAdicComplete I A`). The
topology is part of the data; morphisms of adic rings are continuous ring homomorphisms. An
*adic noetherian ring* is an adic ring with `IsNoetherianRing A`. -/
class IsAdicRing (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] : Prop where
  /-- F0/adic-ring (projection): there is a finitely generated ideal of definition for which `A`
  is adically complete. -/
  exists_isAdic : ∃ I : Ideal A, I.FG ∧ IsAdic I ∧ IsAdicComplete I A

namespace IsAdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- F0/adic-ring: a chosen finitely generated ideal of definition of an adic ring. Every
construction of this file that uses it is independent of the choice
(`IsAdicRing.isAdic_iff_of_isAdic`, `IsAdicRing.isAdicComplete_of_isAdic`). -/
def ideal [IsAdicRing A] : Ideal A :=
  Classical.choose (IsAdicRing.exists_isAdic (A := A))

variable {A}

/-- F0/adic-ring (characterisation): if `I` is an ideal of definition then an ideal `J` is one
iff it is open and some power of `J` lies in `I` (EGA 0, 7.1.4(i)). -/
theorem isAdic_iff_of_isAdic {I : Ideal A} (hI : IsAdic I) (J : Ideal A) :
    IsAdic J ↔ IsOpen (J : Set A) ∧ ∃ n : ℕ, J ^ n ≤ I := sorry

/-- F0/adic-ring (compatibility): completeness does not depend on the ideal of definition: an
adic ring is `J`-adically complete for every finitely generated ideal of definition `J`. -/
theorem isAdicComplete_of_isAdic [IsAdicRing A] {J : Ideal A} (hJ : IsAdic J) (hfg : J.FG) :
    IsAdicComplete J A := sorry

/-- F0/adic-ring (relation): an ideal of definition of an adic ring lies in the Jacobson radical;
so `a` is a unit iff its image in `A ⧸ J` is (EGA 0, 7.1.10–7.1.12). -/
theorem le_jacobson_of_isAdic [IsAdicRing A] {J : Ideal A} (hJ : IsAdic J) :
    J ≤ (⊥ : Ideal A).jacobson := sorry

/-- F0/adic-ring (characterisation): for an ideal of definition `I`, an element is topologically
nilpotent iff it is nilpotent modulo `I` (EGA 0, 7.1.3). -/
theorem isTopologicallyNilpotent_iff {I : Ideal A} (hI : IsAdic I) (a : A) :
    IsTopologicallyNilpotent a ↔ IsNilpotent (Ideal.Quotient.mk I a) := sorry

/-- F0/adic-ring (constructor): in an adic noetherian ring the radical of an ideal of definition
is the largest ideal of definition (EGA 0, 7.1.6–7.1.7). -/
theorem radical_isAdic [IsAdicRing A] [IsNoetherianRing A] {I : Ideal A} (hI : IsAdic I) :
    IsAdic I.radical ∧ ∀ J : Ideal A, IsAdic J → J ≤ I.radical := sorry

/-- F0/adic-ring (characterisation): automatic continuity. For adic rings with ideals of
definition `I`, `J`, a ring homomorphism is continuous iff it maps `I` into `√J`, iff it maps
every element of `I` to a topologically nilpotent element. -/
theorem continuous_iff_map_le_radical [IsAdicRing A] {B : Type*} [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsAdicRing B] {I : Ideal A} {J : Ideal B} (hI : IsAdic I)
    (hJ : IsAdic J) (φ : A →+* B) :
    (Continuous φ ↔ I.map φ ≤ J.radical) ∧
      (Continuous φ ↔ ∀ a ∈ I, IsTopologicallyNilpotent (φ a)) := sorry

/-- F0/adic-ring (instance): a quotient of an adic noetherian ring by any ideal, with the quotient
topology, is an adic noetherian ring with ideal of definition `I·(A ⧸ 𝔞)` (EGA 0, 7.3.5). -/
instance quotient [IsAdicRing A] [IsNoetherianRing A] (𝔞 : Ideal A) : IsAdicRing (A ⧸ 𝔞) := sorry

/-- F0/adic-ring, the rest of `IsAdicRing.quotient` (EGA 0, 7.3.5): the image of an ideal of
definition is an ideal of definition of the quotient, and every ideal of an adic noetherian ring
is closed. -/
theorem isAdic_map_quotient [IsAdicRing A] [IsNoetherianRing A] (𝔞 : Ideal A) :
    IsAdic ((IsAdicRing.ideal A).map (Ideal.Quotient.mk 𝔞)) ∧ IsClosed (𝔞 : Set A) := sorry

/-- F0/adic-ring (compatibility): an adic ring is a Tau Ceti Huber ring, with the pair of
definition `(A, I)` (ring of definition `⊤`). -/
instance (priority := 100) isHuberRing [IsAdicRing A] : Huber.IsHuberRing A := sorry

/-- F0/adic-ring (instance): a complete noetherian local ring with its `𝔪`-adic topology is an
adic noetherian ring. -/
theorem of_isLocalRing [IsLocalRing A] [IsNoetherianRing A]
    (h : IsAdic (IsLocalRing.maximalIdeal A)) [IsAdicComplete (IsLocalRing.maximalIdeal A) A] :
    IsAdicRing A := sorry

/-- F0/adic-ring (constructor): for a noetherian ring `R` and an ideal `I`, the adic completion
`AdicCompletion I R` with the adic topology of `I·R̂` (Mathlib `WithIdeal`) is an adic noetherian
ring. This is F0/adic-completion-noetherian. -/
theorem adicCompletion {R : Type*} [CommRing R] [IsNoetherianRing R] (I : Ideal R) :
    letI : WithIdeal (AdicCompletion I R) := ⟨I.map (algebraMap R (AdicCompletion I R))⟩
    IsAdicRing (AdicCompletion I R) ∧ IsNoetherianRing (AdicCompletion I R) := sorry

end IsAdicRing

-- test IsAdicRing.padicInt (computation) [F0/adic-ring]
example (p : ℕ) [Fact p.Prime] :
    IsAdicRing ℤ_[p] ∧ IsNoetherianRing ℤ_[p] ∧ IsAdic (Ideal.span {(p : ℤ_[p])}) := sorry

-- test IsAdicRing.of_discreteTopology (degenerate) [F0/adic-ring]
example (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [DiscreteTopology R] :
    IsAdicRing R ∧ IsAdic (⊥ : Ideal R) := sorry

/- The tempting wrong definition "complete topological ring with an open ideal" accepts `ℚ_[p]`,
since `ℚ_[p]` is an open ideal of itself. -/
-- test not_isAdicRing_padic (non-example) [F0/adic-ring]
example (p : ℕ) [Fact p.Prime] : ¬ IsAdicRing ℚ_[p] := sorry

/- `k[X]` with its `(X)`-adic topology is not complete; `k⟦X⟧` with its `(X)`-adic topology is an
adic ring. -/
-- test not_isAdicRing_polynomial_adic (non-example) [F0/adic-ring]
example (k : Type*) [Field k] :
    (letI : WithIdeal (Polynomial k) := ⟨Ideal.span {Polynomial.X}⟩;
      ¬ IsAdicRing (Polynomial k)) ∧
    (letI : WithIdeal (PowerSeries k) := ⟨Ideal.span {PowerSeries.X}⟩;
      IsAdicRing (PowerSeries k)) := sorry

-- test IsAdicRing.isHuberRing_test (compatibility) [F0/adic-ring]
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A] :
    ∃ P : Huber.PairOfDefinition A, P.ringOfDefinition = ⊤ := sorry

/-! ## AdicSpacesPartII:F0/adic-completion-noetherian (lemma) -/

/-- F0/adic-completion-noetherian (i): a ring that is adically complete for a finitely generated
ideal `I` with `R ⧸ I` noetherian is noetherian (EGA 0, 7.2.12). -/
theorem isNoetherianRing_of_isAdicComplete_of_fg {R : Type*} [CommRing R] (I : Ideal R)
    (hI : I.FG) [IsAdicComplete I R] [IsNoetherianRing (R ⧸ I)] : IsNoetherianRing R := sorry

/-- F0/adic-completion-noetherian (ii): the adic completion of a noetherian ring is noetherian
(EGA 0, 7.3.1). -/
instance AdicCompletion.isNoetherianRing {R : Type*} [CommRing R] (I : Ideal R)
    [IsNoetherianRing R] : IsNoetherianRing (AdicCompletion I R) := sorry

/-- F0/adic-completion-noetherian (ii): for noetherian `R`, the completion `R̂` is
`I·R̂`-adically separated and complete, and `R̂ ⧸ Iⁿ·R̂ ≅ R ⧸ Iⁿ` (EGA 0, 7.2.6). -/
theorem AdicCompletion.isAdicComplete_map {R : Type*} [CommRing R] (I : Ideal R)
    [IsNoetherianRing R] :
    IsAdicComplete (I.map (algebraMap R (AdicCompletion I R))) (AdicCompletion I R) ∧
      ∀ n : ℕ, Nonempty ((AdicCompletion I R ⧸ (I ^ n).map (algebraMap R (AdicCompletion I R)))
        ≃ₐ[R] R ⧸ I ^ n) := sorry

/-! ## AdicSpacesPartII:F0/completed-localization (construction) -/

namespace AdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]

/-- F0/completed-localization (data): the completed localisation `A_{f}` of an adic ring
(EGA 0, 7.6.15): the adic completion of `A_f = Localization.Away f` along `I·A_f`, where `I` is
an ideal of definition of `A`. It carries the adic topology of `I·A_{f}` (a `WithIdeal`
instance); it is an adic ring, noetherian when `A` is, and independent of the choice of `I`. -/
def CompletedAway (f : A) : Type _ :=
  AdicCompletion ((IsAdicRing.ideal A).map (algebraMap A (Localization.Away f)))
    (Localization.Away f)

namespace CompletedAway

variable (f : A)

/-- F0/completed-localization: the ring structure of `A_{f}`. -/
instance : CommRing (CompletedAway A f) :=
  inferInstanceAs (CommRing (AdicCompletion _ (Localization.Away f)))

/-- F0/completed-localization: the `A`-algebra structure of `A_{f}`. -/
instance : Algebra A (CompletedAway A f) :=
  inferInstanceAs (Algebra A (AdicCompletion _ (Localization.Away f)))

/-- F0/completed-localization: `A_{f}` carries the `I·A_{f}`-adic topology. -/
instance : WithIdeal (CompletedAway A f) :=
  ⟨(IsAdicRing.ideal A).map (algebraMap A (CompletedAway A f))⟩

/-- F0/completed-localization (data): `A_{f}` is an adic ring. -/
instance isAdicRing : IsAdicRing (CompletedAway A f) := sorry

/-- F0/completed-localization (data): `A_{f}` is noetherian when `A` is (EGA 0, 7.6.11). -/
instance isNoetherianRing [IsNoetherianRing A] : IsNoetherianRing (CompletedAway A f) := sorry

/-- F0/completed-localization (projection): `A → A_{f}` is continuous and sends `f` to a unit. -/
theorem algebraMap_continuous :
    Continuous (algebraMap A (CompletedAway A f)) ∧
      IsUnit (algebraMap A (CompletedAway A f) f) := sorry

section Lift

variable {A f} {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
  [IsTopologicalRing B] [IsLinearTopology B B] [CompleteSpace B] [T2Space B]

/-- F0/completed-localization (universal property): a continuous `u : A → B` into a complete
separated linearly topologised ring with `u f` a unit factors through `A_{f}` (EGA 0, 7.6.6). -/
def lift (u : A →+* B) (hu : Continuous u) (hf : IsUnit (u f)) : CompletedAway A f →+* B := sorry

/-- F0/completed-localization (universal property): the factorisation is continuous. -/
theorem continuous_lift (u : A →+* B) (hu : Continuous u) (hf : IsUnit (u f)) :
    Continuous (lift u hu hf) := sorry

/-- F0/completed-localization (universal property): `lift u ∘ algebraMap = u`. -/
theorem lift_comp_algebraMap (u : A →+* B) (hu : Continuous u) (hf : IsUnit (u f)) :
    (lift u hu hf).comp (algebraMap A (CompletedAway A f)) = u := sorry

/-- F0/completed-localization (extensionality): continuous maps out of `A_{f}` into a Hausdorff
ring are determined on the image of `A`. -/
theorem hom_ext {g h : CompletedAway A f →+* B} (hg : Continuous g) (hh : Continuous h)
    (e : g.comp (algebraMap A (CompletedAway A f)) = h.comp (algebraMap A (CompletedAway A f))) :
    g = h := sorry

end Lift

/-- F0/completed-localization (equivalence): `A_{f} ⧸ I^{n+1}A_{f} ≅ (A ⧸ I^{n+1})_f`
(EGA 0, 7.6.2). -/
def quotientEquiv (n : ℕ) :
    (CompletedAway A f ⧸ ((IsAdicRing.ideal A) ^ (n + 1)).map (algebraMap A (CompletedAway A f)))
      ≃ₐ[A] Localization.Away (Ideal.Quotient.mk ((IsAdicRing.ideal A) ^ (n + 1)) f) := sorry

/-- F0/completed-localization (functoriality): if `g` lies in the radical of `f·A + I`, there is a
unique continuous `A`-algebra map `A_{f} → A_{g}` (it satisfies `map_id` and `map_comp`). -/
def map {f g : A} (h : g ∈ (Ideal.span {f} ⊔ IsAdicRing.ideal A).radical) :
    CompletedAway A f →ₐ[A] CompletedAway A g := sorry

/-- F0/completed-localization (instance): `A_{f}` is flat over an adic noetherian `A`
(EGA 0, 7.6.13). -/
instance flat [IsNoetherianRing A] : Module.Flat A (CompletedAway A f) := sorry

-- AdicRing.CompletedAway.isLocalRing_colim: not stated here; needs the stalk of O_{Spf A} at an
--   open prime, i.e. the filtered colimit of the `A_{f}`, `f ∉ p`, along
--   `AdicRing.CompletedAway.map` (supplier: AdicSpacesPartII:F0/formal-spectrum)

end CompletedAway

end AdicRing

-- test completedAway_one (degenerate) [F0/completed-localization]
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A] :
    ∃ e : AdicRing.CompletedAway A 1 ≃ₐ[A] A, Continuous e ∧ Continuous e.symm := sorry

-- test completedAway_eq_zero_iff (characterisation) [F0/completed-localization]
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    (f : A) :
    Subsingleton (AdicRing.CompletedAway A f) ↔
      IsNilpotent (Ideal.Quotient.mk (IsAdicRing.ideal A) f) := sorry

-- test completedAway_quotient (compatibility) [F0/completed-localization]
example (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    (f : A) (n : ℕ) :
    Nonempty ((AdicRing.CompletedAway A f ⧸
        ((IsAdicRing.ideal A) ^ (n + 1)).map (algebraMap A (AdicRing.CompletedAway A f))) ≃ₐ[A]
      Localization.Away (Ideal.Quotient.mk ((IsAdicRing.ideal A) ^ (n + 1)) f)) := sorry

/- `A = k[X]⟦T⟧` with its `T`-adic topology, an adic ring, and `f = X`. -/
-- test completedAway_powerSeries_X (computation) [F0/completed-localization]
example (k : Type*) [Field k] :
    letI : WithIdeal (PowerSeries (Polynomial k)) := ⟨Ideal.span {PowerSeries.X}⟩
    IsAdicRing (PowerSeries (Polynomial k)) ∧ ∀ [IsAdicRing (PowerSeries (Polynomial k))],
      Nonempty (AdicRing.CompletedAway (PowerSeries (Polynomial k))
          (PowerSeries.C Polynomial.X) ≃+*
        PowerSeries (Localization.Away (Polynomial.X : Polynomial k))) := sorry

/- `A = ℤ_[p]⟦T⟧` with its `(p, T)`-adic topology and `f = T`: the completed localisation vanishes
while the ordinary localisation does not. -/
-- test not_completedAway_eq_localization (non-example) [F0/completed-localization]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    IsAdicRing (PowerSeries ℤ_[p]) ∧ ∀ [IsAdicRing (PowerSeries ℤ_[p])],
      Subsingleton (AdicRing.CompletedAway (PowerSeries ℤ_[p]) PowerSeries.X) ∧
        Nontrivial (Localization.Away (PowerSeries.X : PowerSeries ℤ_[p])) := sorry

/-! ## AdicSpacesPartII:F0/restricted-power-series-adic (lemma) -/

namespace IsAdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]

/-- F0/restricted-power-series-adic: the variable `Tᵢ` of `A{T₁,…,T_r}`, Tau Ceti's
`Huber.restrictedMvPowerSeriesCompletion r A`. -/
abbrev restrictedVar (r : ℕ) (i : Fin r) : Huber.restrictedMvPowerSeriesCompletion r A :=
  ((Huber.weightedX (fun _ : Fin r ↦ ({1} : Set A)) Huber.isWeightFamily_one_weight i :
    Huber.weightedRestrictedSubring (fun _ : Fin r ↦ ({1} : Set A))
      Huber.isWeightFamily_one_weight) : Huber.restrictedMvPowerSeriesCompletion r A)

/-- F0/restricted-power-series-adic (i): over an adic ring, the restricted power-series ring
`A{T₁,…,T_r}` (Tau Ceti `Huber.restrictedMvPowerSeriesCompletion r A`) is an adic ring, with
ideal of definition `I·A{T}` (EGA 0, 7.5.1). -/
instance restrictedMvPowerSeriesCompletion (r : ℕ) :
    IsAdicRing (Huber.restrictedMvPowerSeriesCompletion r A) := sorry

/-- F0/restricted-power-series-adic (i): `I·A{T}` is an ideal of definition of `A{T}`, and
`A{T} ⧸ I^{n+1}A{T} ≅ (A ⧸ I^{n+1})[T₁,…,T_r]` (EGA 0, 7.5.1). -/
theorem restrictedMvPowerSeriesCompletion_isAdic (r : ℕ) :
    IsAdic ((IsAdicRing.ideal A).map
        (algebraMap A (Huber.restrictedMvPowerSeriesCompletion r A))) ∧
      ∀ n : ℕ, Nonempty ((Huber.restrictedMvPowerSeriesCompletion r A ⧸
          ((IsAdicRing.ideal A) ^ (n + 1)).map
            (algebraMap A (Huber.restrictedMvPowerSeriesCompletion r A))) ≃+*
        MvPolynomial (Fin r) (A ⧸ (IsAdicRing.ideal A) ^ (n + 1))) := sorry

/-- F0/restricted-power-series-adic (ii): over an adic noetherian ring, `A{T₁,…,T_r}` is
noetherian (EGA 0, 7.5.2). -/
instance isNoetherianRing_restrictedMvPowerSeriesCompletion [IsNoetherianRing A] (r : ℕ) :
    IsNoetherianRing (Huber.restrictedMvPowerSeriesCompletion r A) := sorry

/-- F0/restricted-power-series-adic (iii): universal property (EGA 0, 7.5.3): for a complete
separated linearly topologised `A`-algebra `B` with continuous structure map and arbitrary
`b₁,…,b_r ∈ B` there is a unique continuous `A`-algebra map `A{T} → B` with `Tᵢ ↦ bᵢ`. No
power-boundedness of the `bᵢ` is needed. -/
theorem restrictedMvPowerSeriesCompletion_existsUnique_lift {B : Type*} [CommRing B]
    [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsLinearTopology B B]
    [CompleteSpace B] [T2Space B] [Algebra A B] (hc : Continuous (algebraMap A B)) (r : ℕ)
    (b : Fin r → B) :
    ∃! ψ : Huber.restrictedMvPowerSeriesCompletion r A →+* B, Continuous ψ ∧
      ψ.comp (algebraMap A _) = algebraMap A B ∧ ∀ i, ψ (restrictedVar A r i) = b i := sorry

end IsAdicRing

/-! ## AdicSpacesPartII:F0/topologically-finite-type-criterion (lemma) -/

/-- F0/topologically-finite-type-criterion (EGA 0, 7.5.5): for an adic noetherian ring `A` with
ideal of definition `I` and a complete separated linearly topologised `A`-algebra `B` with
continuous structure map, the following are equivalent: (a) `B` is noetherian, `I·B`-adic and
`I·B`-adically complete, and `B ⧸ I·B` is of finite type over `A ⧸ I`; (b) `B` is `I·B`-adic and
complete and `B ⧸ I²B` is of finite type over `A ⧸ I²`; (c) `B` is a topological quotient of some
`A{T₁,…,T_r}` as an `A`-algebra. Stated as (a) ↔ (c) and (b) ↔ (c). -/
theorem IsAdicRing.tft_iff (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [IsAdicRing A] [IsNoetherianRing A] (B : Type*) [CommRing B] [UniformSpace B]
    [IsUniformAddGroup B] [IsTopologicalRing B] [IsLinearTopology B B] [CompleteSpace B]
    [T2Space B] [Algebra A B] (hc : Continuous (algebraMap A B)) :
    let I := IsAdicRing.ideal A
    let quotientPresentation : Prop := ∃ (r : ℕ)
      (π : Huber.restrictedMvPowerSeriesCompletion r A →+* B),
      IsOpenQuotientMap π ∧ π.comp (algebraMap A _) = algebraMap A B
    ((IsNoetherianRing B ∧ IsAdic (I.map (algebraMap A B)) ∧
        IsAdicComplete (I.map (algebraMap A B)) B ∧
        Algebra.FiniteType (A ⧸ I) (B ⧸ I.map (algebraMap A B))) ↔ quotientPresentation) ∧
      ((IsAdic (I.map (algebraMap A B)) ∧ IsAdicComplete (I.map (algebraMap A B)) B ∧
        Algebra.FiniteType (A ⧸ I ^ 2) (B ⧸ (I ^ 2).map (algebraMap A B))) ↔
          quotientPresentation) := sorry

/-! ## AdicSpacesPartII:F0/completed-tensor-product-adic (construction) -/

namespace AdicRing

section CompletedTensorProduct

variable (A B C : Type*) [CommRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [IsAdicRing B] [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsAdicRing C]
  [Algebra A B] [Algebra A C]

/-- F0/completed-tensor-product-adic: the ideal `J ⊆ B ⊗[A] C` generated by `I_B ⊗ 1` and
`1 ⊗ I_C` for ideals of definition `I_B`, `I_C`. -/
def CompletedTensorProduct.tensorIdeal : Ideal (B ⊗[A] C) :=
  (IsAdicRing.ideal B).map Algebra.TensorProduct.includeLeftRingHom ⊔
    (IsAdicRing.ideal C).map (Algebra.TensorProduct.includeRight : C →ₐ[A] B ⊗[A] C).toRingHom

/-- F0/completed-tensor-product-adic (data): the completed tensor product
`B ⊗̂[A] C := AdicCompletion J (B ⊗[A] C)` of adic rings (EGA 0, 7.7), with the `J`-adic topology
(a `WithIdeal` instance). It is an adic ring, independent of the ideals of definition chosen. -/
def CompletedTensorProduct : Type _ :=
  AdicCompletion (CompletedTensorProduct.tensorIdeal A B C) (B ⊗[A] C)

namespace CompletedTensorProduct

/-- F0/completed-tensor-product-adic: the ring structure of `B ⊗̂[A] C`. -/
instance : CommRing (CompletedTensorProduct A B C) :=
  inferInstanceAs (CommRing (AdicCompletion _ (B ⊗[A] C)))

/-- F0/completed-tensor-product-adic: the `A`-algebra structure of `B ⊗̂[A] C`. -/
instance : Algebra A (CompletedTensorProduct A B C) :=
  inferInstanceAs (Algebra A (AdicCompletion _ (B ⊗[A] C)))

/-- F0/completed-tensor-product-adic: the completion map `B ⊗[A] C → B ⊗̂[A] C`. -/
instance : Algebra (B ⊗[A] C) (CompletedTensorProduct A B C) :=
  inferInstanceAs (Algebra (B ⊗[A] C) (AdicCompletion _ (B ⊗[A] C)))

/-- F0/completed-tensor-product-adic: compatibility of the two algebra structures. -/
instance : IsScalarTower A (B ⊗[A] C) (CompletedTensorProduct A B C) :=
  inferInstanceAs (IsScalarTower A (B ⊗[A] C) (AdicCompletion _ (B ⊗[A] C)))

/-- F0/completed-tensor-product-adic: `B ⊗̂[A] C` carries the `J`-adic topology. -/
instance : WithIdeal (CompletedTensorProduct A B C) :=
  ⟨(tensorIdeal A B C).map (algebraMap (B ⊗[A] C) (CompletedTensorProduct A B C))⟩

/-- F0/completed-tensor-product-adic (data): `B ⊗̂[A] C` is an adic ring (EGA 0, 7.7.1). -/
instance isAdicRing : IsAdicRing (CompletedTensorProduct A B C) := sorry

/-- F0/completed-tensor-product-adic (projection): the continuous `A`-algebra map
`B → B ⊗̂[A] C`, `b ↦ b ⊗ 1`. -/
def inl : B →ₐ[A] CompletedTensorProduct A B C :=
  (IsScalarTower.toAlgHom A (B ⊗[A] C) (CompletedTensorProduct A B C)).comp
    Algebra.TensorProduct.includeLeft

/-- F0/completed-tensor-product-adic (projection): the continuous `A`-algebra map
`C → B ⊗̂[A] C`, `c ↦ 1 ⊗ c`. -/
def inr : C →ₐ[A] CompletedTensorProduct A B C :=
  (IsScalarTower.toAlgHom A (B ⊗[A] C) (CompletedTensorProduct A B C)).comp
    Algebra.TensorProduct.includeRight

/-- F0/completed-tensor-product-adic (projection): `inl` and `inr` are continuous. -/
theorem continuous_inl_inr : Continuous (inl A B C) ∧ Continuous (inr A B C) := sorry

section Lift

variable {A B C} {D : Type*} [CommRing D] [UniformSpace D] [IsUniformAddGroup D]
  [IsTopologicalRing D] [IsLinearTopology D D] [CompleteSpace D] [T2Space D] [Algebra A D]

/-- F0/completed-tensor-product-adic (universal property): continuous `A`-algebra maps
`β : B → D`, `γ : C → D` into a complete separated linearly topologised `A`-algebra induce a
continuous `lift β γ : B ⊗̂[A] C → D` (EGA 0, 7.7.6). -/
def lift (β : B →ₐ[A] D) (γ : C →ₐ[A] D) (hβ : Continuous β) (hγ : Continuous γ) :
    CompletedTensorProduct A B C →ₐ[A] D := sorry

/-- F0/completed-tensor-product-adic (universal property): the lift is continuous. -/
theorem continuous_lift (β : B →ₐ[A] D) (γ : C →ₐ[A] D) (hβ : Continuous β)
    (hγ : Continuous γ) : Continuous (lift β γ hβ hγ) := sorry

/-- F0/completed-tensor-product-adic (universal property): `lift β γ ∘ inl = β` and
`lift β γ ∘ inr = γ`. -/
theorem lift_comp_inl (β : B →ₐ[A] D) (γ : C →ₐ[A] D) (hβ : Continuous β)
    (hγ : Continuous γ) :
    (lift β γ hβ hγ).comp (inl A B C) = β ∧ (lift β γ hβ hγ).comp (inr A B C) = γ := sorry

/-- F0/completed-tensor-product-adic (extensionality): continuous maps out of `B ⊗̂[A] C` into a
Hausdorff ring agreeing after `inl` and after `inr` are equal. -/
theorem hom_ext {f g : CompletedTensorProduct A B C →ₐ[A] D} (hf : Continuous f)
    (hg : Continuous g) (hl : f.comp (inl A B C) = g.comp (inl A B C))
    (hr : f.comp (inr A B C) = g.comp (inr A B C)) : f = g := sorry

end Lift

/-- F0/completed-tensor-product-adic (equivalence):
`(B ⊗̂[A] C) ⧸ J^{n+1} ≅ (B ⊗[A] C) ⧸ J^{n+1}`. -/
def quotientEquiv (n : ℕ) :
    (CompletedTensorProduct A B C ⧸
      ((tensorIdeal A B C) ^ (n + 1)).map
        (algebraMap (B ⊗[A] C) (CompletedTensorProduct A B C))) ≃ₐ[A]
      (B ⊗[A] C) ⧸ (tensorIdeal A B C) ^ (n + 1) := sorry

/-- F0/completed-tensor-product-adic (functoriality): continuous maps `B → B′`, `C → C′` over a
ring map `A → A′` induce a continuous map `B ⊗̂[A] C → B′ ⊗̂[A′] C′` (satisfying `map_id` and
`map_comp`). -/
def map {A' B' C' : Type*} [CommRing A'] [CommRing B'] [TopologicalSpace B'] [IsTopologicalRing B']
    [IsAdicRing B'] [CommRing C'] [TopologicalSpace C'] [IsTopologicalRing C'] [IsAdicRing C']
    [Algebra A' B'] [Algebra A' C'] (fA : A →+* A') (fB : B →+* B') (fC : C →+* C')
    (hfB : Continuous fB) (hfC : Continuous fC)
    (hB : fB.comp (algebraMap A B) = (algebraMap A' B').comp fA)
    (hC : fC.comp (algebraMap A C) = (algebraMap A' C').comp fA) :
    CompletedTensorProduct A B C →+* CompletedTensorProduct A' B' C' := sorry

/-- F0/completed-tensor-product-adic (instance): if `A` is adic noetherian, `B` is topologically
of finite type over `A` (a topological quotient of some `A{T}`,
F0/topologically-finite-type-criterion) and `C` is noetherian, then `B ⊗̂[A] C` is noetherian
(EGA I, 10.13.5). Without the finite-type hypothesis this fails (EGA I, 10.7.4). -/
theorem isNoetherianRing [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    [IsNoetherianRing A] [IsNoetherianRing C] (hC : Continuous (algebraMap A C))
    (hB : ∃ (r : ℕ) (π : Huber.restrictedMvPowerSeriesCompletion r A →+* B),
      IsOpenQuotientMap π ∧ π.comp (algebraMap A _) = algebraMap A B) :
    IsNoetherianRing (CompletedTensorProduct A B C) := sorry

/-- F0/completed-tensor-product-adic (example): `A{S₁,…,S_m} ⊗̂[A] C ≅ C{S₁,…,S_m}`. -/
def restrictedEquiv [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A] (m : ℕ)
    (hC : Continuous (algebraMap A C)) :
    CompletedTensorProduct A (Huber.restrictedMvPowerSeriesCompletion m A) C ≃+*
      Huber.restrictedMvPowerSeriesCompletion m C := sorry

end CompletedTensorProduct

end CompletedTensorProduct

end AdicRing

/- `ℤ_[p]⟦S⟧ ⊗̂_{ℤ_[p]} ℤ_[p]⟦T⟧ ≅ ℤ_[p]⟦S, T⟧`, both factors with their `(p, X)`-adic topology (the
test assumes their `IsAdicRing` instance). -/
-- test completedTensor_powerSeries (computation) [F0/completed-tensor-product-adic]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    IsAdicRing (PowerSeries ℤ_[p]) ∧ ∀ [IsAdicRing (PowerSeries ℤ_[p])],
      Nonempty (AdicRing.CompletedTensorProduct ℤ_[p] (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p])
        ≃ₐ[ℤ_[p]] MvPowerSeries (Fin 2) ℤ_[p]) := sorry

-- test completedTensor_self_left (degenerate) [F0/completed-tensor-product-adic]
example (A C : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsAdicRing C] [Algebra A C]
    (hC : Continuous (algebraMap A C)) :
    ∃ e : AdicRing.CompletedTensorProduct A A C ≃ₐ[A] C, Continuous e ∧ Continuous e.symm :=
  sorry

-- test completedTensor_discrete (compatibility) [F0/completed-tensor-product-adic]
example (A B C : Type*) [CommRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [DiscreteTopology B] [IsAdicRing B] [CommRing C] [TopologicalSpace C] [IsTopologicalRing C]
    [DiscreteTopology C] [IsAdicRing C] [Algebra A B] [Algebra A C] :
    Nonempty (AdicRing.CompletedTensorProduct A B C ≃ₐ[A] B ⊗[A] C) := sorry

/- The map `ℤ_[p]⟦S, T⟧ → ℤ_[p]`, `S ↦ 0`, `T ↦ p` is the unique continuous one with these values
(`(p, S, T)`-adic topology on the source). -/
-- test completedTensor_lift_unique (characterisation) [F0/completed-tensor-product-adic]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (MvPowerSeries (Fin 2) ℤ_[p]) :=
      ⟨Ideal.span {MvPowerSeries.C (p : ℤ_[p]), MvPowerSeries.X 0, MvPowerSeries.X 1}⟩
    ∃! ψ : MvPowerSeries (Fin 2) ℤ_[p] →ₐ[ℤ_[p]] ℤ_[p], Continuous ψ ∧
      ψ (MvPowerSeries.X 0) = 0 ∧ ψ (MvPowerSeries.X 1) = p := sorry

/- The uncompleted tensor product `ℤ_[p]⟦S⟧ ⊗_{ℤ_[p]} ℤ_[p]⟦T⟧` is not complete for `J = (p, S, T)`
(`∑ Sⁿ Tⁿ` is not in the image of the canonical map to `ℤ_[p]⟦S, T⟧`). -/
-- test completedTensor_not_tensor (non-example) [F0/completed-tensor-product-adic]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    IsAdicRing (PowerSeries ℤ_[p]) ∧ ∀ [IsAdicRing (PowerSeries ℤ_[p])],
      ¬ IsAdicComplete (AdicRing.CompletedTensorProduct.tensorIdeal ℤ_[p] (PowerSeries ℤ_[p])
        (PowerSeries ℤ_[p])) (PowerSeries ℤ_[p] ⊗[ℤ_[p]] PowerSeries ℤ_[p]) := sorry

/-! ## AdicSpacesPartII:F0/mittag-leffler-exactness (lemma) -/

namespace MittagLeffler

open CategoryTheory CategoryTheory.Limits

variable {A B C : ℕᵒᵖ ⥤ AddCommGrpCat.{0}} (f : A ⟶ B) (g : B ⟶ C)

/-- F0/mittag-leffler-exactness (i) (EGA 0_III, 13.2.1): in a short exact sequence of inverse
systems of abelian groups, a quotient of a Mittag-Leffler system is Mittag-Leffler. -/
theorem isMittagLeffler_of_surjective (hg : ∀ n, Function.Surjective (g.app n).hom)
    (hB : (B ⋙ forget AddCommGrpCat).IsMittagLeffler) :
    (C ⋙ forget AddCommGrpCat).IsMittagLeffler := sorry

/-- F0/mittag-leffler-exactness (i) (EGA 0_III, 13.2.1): an extension of Mittag-Leffler systems
is Mittag-Leffler. -/
theorem isMittagLeffler_of_shortExact (hf : ∀ n, Function.Injective (f.app n).hom)
    (hfg : ∀ n, Function.Exact (f.app n).hom (g.app n).hom)
    (hg : ∀ n, Function.Surjective (g.app n).hom)
    (hA : (A ⋙ forget AddCommGrpCat).IsMittagLeffler)
    (hC : (C ⋙ forget AddCommGrpCat).IsMittagLeffler) :
    (B ⋙ forget AddCommGrpCat).IsMittagLeffler := sorry

/-- F0/mittag-leffler-exactness (ii) (EGA 0_III, 13.2.2): if the kernel system is
Mittag-Leffler, the inverse limit of a short exact sequence of inverse systems is short exact. -/
theorem lim_exact (hf : ∀ n, Function.Injective (f.app n).hom)
    (hfg : ∀ n, Function.Exact (f.app n).hom (g.app n).hom)
    (hg : ∀ n, Function.Surjective (g.app n).hom)
    (hA : (A ⋙ forget AddCommGrpCat).IsMittagLeffler) :
    Function.Injective (limMap f).hom ∧ Function.Exact (limMap f).hom (limMap g).hom ∧
      Function.Surjective (limMap g).hom := sorry

/-- F0/mittag-leffler-exactness (iii) (EGA 0_III, 13.1.2): an inverse system of artinian modules
is Mittag-Leffler. (A system with surjective transition maps is Mittag-Leffler by Mathlib's
`CategoryTheory.Functor.isMittagLeffler_of_surjective`.) -/
theorem isMittagLeffler_of_isArtinian {R : Type} [Ring R] (M : ℕᵒᵖ ⥤ ModuleCat.{0} R)
    (hM : ∀ n, IsArtinian R (M.obj n)) : (M ⋙ forget (ModuleCat R)).IsMittagLeffler := sorry

end MittagLeffler

/-! ## AdicSpacesPartII:F0/formal-spectrum (construction) -/

namespace FormalScheme.Spf

/-- F0/formal-spectrum, point-set core of `FormalScheme.Spf.mem_iff`: for an ideal of definition
`I`, a prime of `A` is open iff it contains `I`, so the points of `Spf A` are the open primes,
`PrimeSpectrum.zeroLocus I` (EGA I, 10.1.1). -/
theorem mem_iff_primeSpectrum {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    {I : Ideal A} (hI : IsAdic I) (p : PrimeSpectrum A) :
    IsOpen (p.asIdeal : Set A) ↔ p ∈ PrimeSpectrum.zeroLocus (I : Set A) := sorry

/-- F0/formal-spectrum, point-set core of `FormalScheme.Spf.homeomorphSpecQuotient`: the closed
subspace `V(I)` of `Spec A` is homeomorphic to `Spec (A ⧸ I^{n+1})` for every `n`
(EGA I, 10.1.2). -/
def homeomorphSpecQuotient_primeSpectrum {A : Type*} [CommRing A] (I : Ideal A) (n : ℕ) :
    PrimeSpectrum.zeroLocus (I : Set A) ≃ₜ PrimeSpectrum (A ⧸ I ^ (n + 1)) := sorry

/-- F0/formal-spectrum, point-set core of `FormalScheme.Spf.basicOpen`: the basic open
`D(f) ∩ V(I)` of `Spf A`, for any ideal of definition `I`. -/
def basicOpen_primeSpectrum (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    [IsAdicRing A] (f : A) : Set (PrimeSpectrum A) :=
  (PrimeSpectrum.basicOpen f : Set (PrimeSpectrum A)) ∩
    PrimeSpectrum.zeroLocus (IsAdicRing.ideal A : Set A)

end FormalScheme.Spf

-- FormalScheme.Spf: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.mem_iff: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its point-set core is
--   `FormalScheme.Spf.mem_iff_primeSpectrum`
-- FormalScheme.Spf.homeomorphSpecQuotient: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum); its point-set core is
--   `FormalScheme.Spf.homeomorphSpecQuotient_primeSpectrum`
-- FormalScheme.Spf.globalSectionsIso: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.basicOpen: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its point-set core is
--   `FormalScheme.Spf.basicOpen_primeSpectrum`
-- FormalScheme.Spf.basicOpenSectionsIso: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum); the ring it identifies is
--   `AdicRing.CompletedAway A f`
-- FormalScheme.Spf.restrictBasicOpenIso: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.stalk_isLocalRing: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.stalk_isNoetherianRing: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.map: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.fromSpecQuotient: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf.sectionsTopology: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- Spf_padicInt_points: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its point-set core is the example below [computation
--   test]
example (p : ℕ) [Fact p.Prime] (q : PrimeSpectrum ℤ_[p]) :
    IsOpen (q.asIdeal : Set ℤ_[p]) ↔ q.asIdeal = IsLocalRing.maximalIdeal ℤ_[p] := sorry

-- Spf_discrete_eq_Spec: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [compatibility test]
-- Spf_globalSections: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [characterisation test]
-- Spf_padicInt_ne_Spec: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its point-set core is the example below [non-example
--   test]
example (p : ℕ) [Fact p.Prime] :
    Nat.card (PrimeSpectrum ℤ_[p]) = 2 ∧
      ∃ q : PrimeSpectrum ℤ_[p], ¬ IsOpen (q.asIdeal : Set ℤ_[p]) := sorry

-- Spf_basicOpen_eq_empty: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its ring-level core is the example below [degenerate
--   test]
example (p : ℕ) [Fact p.Prime] :
    IsAdicRing ℤ_[p] ∧ ∀ [IsAdicRing ℤ_[p]],
      FormalScheme.Spf.basicOpen_primeSpectrum ℤ_[p] (p : ℤ_[p]) = ∅ ∧
        Subsingleton (AdicRing.CompletedAway ℤ_[p] (p : ℤ_[p])) := sorry

-- Spf_powerSeries_polynomial_sections: not stated here; needs the locally ringed space Spf A
--   (supplier: AdicSpacesPartII:F0/formal-spectrum) [computation test]

/-! ## AdicSpacesPartII:F0/spf-ideal-independence (lemma) -/

-- FormalScheme.SpfOfIdeal.iso: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)

/-! ## AdicSpacesPartII:F0/spf-morphism-correspondence (theorem) -/

-- FormalScheme.homSpfEquiv: not stated here; needs the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Spf.homEquiv: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); its automatic-continuity core is
--   `IsAdicRing.continuous_iff_map_le_radical`

/-! ## AdicSpacesPartII:F0/locally-noetherian-formal-scheme (definition) -/

-- FormalScheme: not stated here; needs the category of formal schemes, built by this node over the
--   locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.instCategory: not stated here; needs the category of formal schemes, built by this
--   node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.IsLocallyNoetherian: not stated here; needs the category of formal schemes, built by
--   this node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.IsNoetherian: not stated here; needs the category of formal schemes, built by this
--   node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.isLocallyNoetherian_iff_forall_affineOpens: not stated here; needs the category of
--   formal schemes, built by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.Spf_isNoetherian_iff: not stated here; needs the category of formal schemes, built
--   by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.isBasis_affineOpens: not stated here; needs the category of formal schemes, built by
--   this node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.restrict: not stated here; needs the category of formal schemes, built by this node
--   over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.IsAffineOpen.isoSpf: not stated here; needs the category of formal schemes, built by
--   this node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.sectionsTopology_eq_adic: not stated here; needs the category of formal schemes,
--   built by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.ofScheme: not stated here; needs the category of formal schemes, built by this node
--   over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.stalk_isNoetherianRing: not stated here; needs the category of formal schemes, built
--   by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum)
-- FormalScheme.ofScheme_Spec: not stated here; needs the category of formal schemes, built by this
--   node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum)
--   [compatibility test]
-- FormalScheme.Spf_padicInt_isNoetherian: not stated here; needs the category of formal schemes,
--   built by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [computation test]
-- FormalScheme.not_isLocallyNoetherian_Spf_OC: not stated here; needs the category of formal
--   schemes, built by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [non-example test]
-- FormalScheme.Spf_restrict_basicOpen: not stated here; needs the category of formal schemes, built
--   by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [characterisation test]
-- FormalScheme.Hom_Spf_powerSeries: not stated here; needs the category of formal schemes, built by
--   this node over the locally ringed space Spf A (supplier: AdicSpacesPartII:F0/formal-spectrum);
--   its ring-level core is the example below [computation test]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    ∃ e : {φ : PowerSeries ℤ_[p] →ₐ[ℤ_[p]] PowerSeries ℤ_[p] // Continuous φ} ≃
        (Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X} : Ideal (PowerSeries ℤ_[p])),
      ∀ φ, (e φ : PowerSeries ℤ_[p]) = φ.1 PowerSeries.X := sorry

-- FormalScheme.formalTorus_baseChange: not stated here; needs the category of formal schemes, built
--   by this node over the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum) [compatibility test]

/-! ## AdicSpacesPartII:F0/formal-scheme-gluing (construction) -/

-- FormalScheme.GlueData: not stated here; needs glue data of formal schemes, built by this node
--   over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.glued: not stated here; needs glue data of formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.ι: not stated here; needs glue data of formal schemes, built by this node
--   over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.glue_condition: not stated here; needs glue data of formal schemes, built
--   by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.desc: not stated here; needs glue data of formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.ι_desc: not stated here; needs glue data of formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.isLocallyNoetherian: not stated here; needs glue data of formal schemes,
--   built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.ofScheme: not stated here; needs glue data of formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.GlueData.projectiveLine_globalSections: not stated here; needs glue data of formal
--   schemes, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- FormalScheme.GlueData.single: not stated here; needs glue data of formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- FormalScheme.GlueData.ofScheme_glued: not stated here; needs glue data of formal schemes, built
--   by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- FormalScheme.GlueData.projectiveLine_not_affine: not stated here; needs glue data of formal
--   schemes, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]

/-! ## AdicSpacesPartII:F0/ideal-of-definition (definition) -/

-- FormalScheme.IdealSheafData: not stated here; needs ideals of definition of formal schemes and
--   the thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.IdealSheafData.IsIdealOfDefinition: not stated here; needs ideals of definition of
--   formal schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.IdealSheafData.isIdealOfDefinition_of_cover: not stated here; needs ideals of
--   definition of formal schemes and the thickenings X_n, built by this node over the category of
--   formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.thickening: not stated here; needs ideals of definition of formal schemes and the
--   thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.thickeningι: not stated here; needs ideals of definition of formal schemes and the
--   thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.thickeningMap: not stated here; needs ideals of definition of formal schemes and the
--   thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.structureSheafIsoLimit: not stated here; needs ideals of definition of formal
--   schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.IdealSheafData.isIdealOfDefinition_pow: not stated here; needs ideals of definition
--   of formal schemes and the thickenings X_n, built by this node over the category of formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.largestIdealOfDefinition: not stated here; needs ideals of definition of formal
--   schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.reduction: not stated here; needs ideals of definition of formal schemes and the
--   thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.IdealSheafData.isIdealOfDefinition_Spf: not stated here; needs ideals of definition
--   of formal schemes and the thickenings X_n, built by this node over the category of formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation
--   test]
-- FormalScheme.thickening_Spf: not stated here; needs ideals of definition of formal schemes and
--   the thickenings X_n, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- FormalScheme.largestIdealOfDefinition_powerSeries: not stated here; needs ideals of definition of
--   formal schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- FormalScheme.ofScheme_idealOfDefinition: not stated here; needs ideals of definition of formal
--   schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- FormalScheme.not_idealOfDefinition_maximal_OC: not stated here; needs ideals of definition of
--   formal schemes and the thickenings X_n, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]

/-! ## AdicSpacesPartII:F0/colimit-of-thickenings (construction) -/

-- FormalScheme.ThickeningSystem: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings: not stated here; needs adic thickening systems of schemes and their
--   colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.ι: not stated here; needs adic thickening systems of schemes and their
--   colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.idealOfDefinition: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.thickeningIso: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.isLocallyNoetherian: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.desc: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings.map: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.ofThickenings_padic: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- FormalScheme.ofThickenings_const: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- FormalScheme.ofThickenings_thickening: not stated here; needs adic thickening systems of schemes
--   and their colimit formal scheme, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- FormalScheme.ofThickenings_affine: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation test]
-- FormalScheme.ofThickenings_nonadic_excluded: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme, built by this node over the category of formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]

/-! ## AdicSpacesPartII:F0/formal-scheme-as-colimit (theorem) -/

-- FormalScheme.isColimitThickenings: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.ofThickeningsIso: not stated here; needs adic thickening systems of schemes and
--   their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)

/-! ## AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type (lemma) -/

-- FormalScheme.IdealSheafData.IsOfFiniteType: not stated here; needs ideals of definition of finite
--   type of formal schemes and the thickenings X_n (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.IdealSheafData.isIdealOfDefinition_pow_of_isOfFiniteType: not stated here; needs
--   ideals of definition of finite type of formal schemes and the thickenings X_n (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.isColimitThickeningsOfFiniteType: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
--   and ideals of definition of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)

/-! ## AdicSpacesPartII:F0/morphisms-as-compatible-systems (theorem) -/

-- FormalScheme.homEquivLimit: not stated here; needs ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)

/-! ## AdicSpacesPartII:F0/morphisms-as-compatible-systems-finite-ideal-type (theorem) -/

-- FormalScheme.homEquivLimitOfFiniteType: not stated here; needs ideals of definition of finite
--   type of formal schemes and the thickenings X_n (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.homOverEquivLimitOfFiniteType: not stated here; needs ideals of definition of finite
--   type of formal schemes and the thickenings X_n (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)

/-! ## AdicSpacesPartII:F0/formal-fibre-product (theorem) -/

-- FormalScheme.hasPullbacks: not stated here; needs the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Spf.pullbackIso: not stated here; needs the locally ringed space Spf A (supplier:
--   AdicSpacesPartII:F0/formal-spectrum); the ring it identifies is
--   `AdicRing.CompletedTensorProduct A B C`

/-! ## AdicSpacesPartII:F0/adic-morphism-of-formal-schemes (definition) -/

-- FormalScheme.Hom.IsAdic: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsAdic.forall: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsAdic.comp: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsAdic.of_comp: not stated here; needs adic morphisms of formal schemes and
--   their reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.isAdic_iff_isPullback: not stated here; needs adic morphisms of formal schemes
--   and their reductions f_n, built by this node over ideals of definition of formal schemes and
--   the thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.reduction: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsAdic.baseChange: not stated here; needs adic morphisms of formal schemes and
--   their reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.isAdic_ofScheme: not stated here; needs adic morphisms of formal schemes and
--   their reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.isAdic_Spf_restricted: not stated here; needs adic morphisms of formal schemes
--   and their reductions f_n, built by this node over ideals of definition of formal schemes and
--   the thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition); its ring-level core is
--   the example below [computation test]
example (p : ℕ) [Fact p.Prime] :
    IsAdicRing ℤ_[p] ∧ ∀ [IsAdicRing ℤ_[p]],
      IsAdic ((Ideal.span {(p : ℤ_[p])}).map
        (algebraMap ℤ_[p] (Huber.restrictedMvPowerSeriesCompletion 1 ℤ_[p]))) := sorry

-- FormalScheme.Hom.not_isAdic_Spf_powerSeries: not stated here; needs adic morphisms of formal
--   schemes and their reductions f_n, built by this node over ideals of definition of formal
--   schemes and the thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition); its
--   ring-level core is the example below [non-example test]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    Continuous (algebraMap ℤ_[p] (PowerSeries ℤ_[p])) ∧
      ¬ IsAdic ((Ideal.span {(p : ℤ_[p])}).map (algebraMap ℤ_[p] (PowerSeries ℤ_[p]))) := sorry

-- FormalScheme.Hom.isAdic_id: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition) [degenerate test]
-- FormalScheme.Hom.isAdic_Spf_iff: not stated here; needs adic morphisms of formal schemes and
--   their reductions f_n, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition) [characterisation test]

/-! ## AdicSpacesPartII:F0/adic-systems-equivalence (theorem) -/

-- FormalScheme.adicSystemsEquiv: not stated here; needs adic morphisms of formal schemes and their
--   reductions f_n (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)

/-! ## AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type (theorem) -/

-- FormalScheme.adicSystemsEquivOfFiniteType: not stated here; needs adic thickening systems of
--   schemes and their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
--   and ideals of definition of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.ofThickenings_isAdic_of_adicSystem: not stated here; needs adic thickening systems
--   of schemes and their colimit formal scheme (supplier:
--   AdicSpacesPartII:F0/colimit-of-thickenings) and ideals of definition of finite type of formal
--   schemes (supplier: AdicSpacesPartII:F0/ideal-of-definition)

/-! ## AdicSpacesPartII:F0/formal-morphism-finite-type (definition) -/

-- FormalScheme.Hom.FiniteType: not stated here; needs morphisms of finite type of formal schemes,
--   built by this node over adic morphisms of formal schemes and their reductions f_n (supplier:
--   AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.finiteType_iff_reduction: not stated here; needs morphisms of finite type of
--   formal schemes, built by this node over adic morphisms of formal schemes and their reductions
--   f_n (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.finiteType_Spf_iff: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes); its ring-level core is
--   `IsAdicRing.tft_iff`
-- FormalScheme.Hom.FiniteType.comp: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.FiniteType.baseChange: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.FiniteType.isNoetherian: not stated here; needs morphisms of finite type of
--   formal schemes, built by this node over adic morphisms of formal schemes and their reductions
--   f_n (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.LocallyOfFiniteType: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.FiniteType.completion: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)
-- FormalScheme.Hom.finiteType_restricted: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes) [computation test]
-- FormalScheme.Hom.not_finiteType_powerSeries: not stated here; needs morphisms of finite type of
--   formal schemes, built by this node over adic morphisms of formal schemes and their reductions
--   f_n (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes); its ring-level core is the
--   example below [non-example test]
example (p : ℕ) [Fact p.Prime] :
    letI : WithIdeal (PowerSeries ℤ_[p]) :=
      ⟨Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}⟩
    IsAdicRing ℤ_[p] ∧ ∀ [IsAdicRing ℤ_[p]],
      ¬ ∃ (r : ℕ) (π : Huber.restrictedMvPowerSeriesCompletion r ℤ_[p] →+* PowerSeries ℤ_[p]),
        IsOpenQuotientMap π ∧
          π.comp (algebraMap ℤ_[p] _) = algebraMap ℤ_[p] (PowerSeries ℤ_[p]) := sorry

-- FormalScheme.Hom.finiteType_ofScheme: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes) [compatibility test]
-- FormalScheme.Hom.finiteType_id: not stated here; needs morphisms of finite type of formal
--   schemes, built by this node over adic morphisms of formal schemes and their reductions f_n
--   (supplier: AdicSpacesPartII:F0/adic-morphism-of-formal-schemes) [degenerate test]

/-! ## AdicSpacesPartII:F0/proper-formal-morphism (definition) -/

-- FormalScheme.Hom.IsProper: not stated here; needs proper morphisms of formal schemes, built by
--   this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.isProper_iff_reduction: not stated here; needs proper morphisms of formal
--   schemes, built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.IsProper.comp: not stated here; needs proper morphisms of formal schemes, built
--   by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.IsProper.baseChange: not stated here; needs proper morphisms of formal schemes,
--   built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.IsProper.completion: not stated here; needs proper morphisms of formal schemes,
--   built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.IsProperSupport: not stated here; needs proper morphisms of formal schemes, built by
--   this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.IsProper.isClosedMap: not stated here; needs proper morphisms of formal schemes,
--   built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type)
-- FormalScheme.Hom.isProper_completion_projectiveLine: not stated here; needs proper morphisms of
--   formal schemes, built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type) [computation test]
-- FormalScheme.Hom.not_isProper_restricted: not stated here; needs proper morphisms of formal
--   schemes, built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type) [non-example test]
-- FormalScheme.Hom.isProper_ofScheme: not stated here; needs proper morphisms of formal schemes,
--   built by this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type) [compatibility test]
-- FormalScheme.Hom.isProper_id: not stated here; needs proper morphisms of formal schemes, built by
--   this node over morphisms of finite type of formal schemes (supplier:
--   AdicSpacesPartII:F0/formal-morphism-finite-type) [degenerate test]

/-! ## AdicSpacesPartII:F0/thickening-invariance (lemma) -/

namespace FormalScheme

open _root_.AlgebraicGeometry CategoryTheory CategoryTheory.Limits

/-- F0/thickening-invariance (Stacks 0BPG): let `i : Y ⟶ Y'` be a thickening (a closed immersion
that is a homeomorphism), `f' : X' ⟶ Y'`, and `f : Y ×_{Y'} X' ⟶ Y` its base change, both locally
of finite type. Then `f'` is proper iff `f` is. -/
theorem isProper_iff_of_thickening {X' Y' Y : Scheme} (i : Y ⟶ Y') [IsClosedImmersion i]
    (hi : IsHomeomorph i) (f' : X' ⟶ Y') [LocallyOfFiniteType f']
    [LocallyOfFiniteType (pullback.snd f' i)] :
    IsProper f' ↔ IsProper (pullback.snd f' i) := sorry

/-- F0/thickening-invariance (Stacks 0BPG): the same for finite morphisms. -/
theorem isFinite_iff_of_thickening {X' Y' Y : Scheme} (i : Y ⟶ Y') [IsClosedImmersion i]
    (hi : IsHomeomorph i) (f' : X' ⟶ Y') [LocallyOfFiniteType f']
    [LocallyOfFiniteType (pullback.snd f' i)] :
    IsFinite f' ↔ IsFinite (pullback.snd f' i) := sorry

/-- F0/thickening-invariance (Stacks 0BPG): the same for closed immersions. -/
theorem isClosedImmersion_iff_of_thickening {X' Y' Y : Scheme} (i : Y ⟶ Y')
    [IsClosedImmersion i] (hi : IsHomeomorph i) (f' : X' ⟶ Y') [LocallyOfFiniteType f']
    [LocallyOfFiniteType (pullback.snd f' i)] :
    IsClosedImmersion f' ↔ IsClosedImmersion (pullback.snd f' i) := sorry

end FormalScheme

/-! ## AdicSpacesPartII:F0/closed-formal-subscheme (construction) -/

-- FormalScheme.subscheme: not stated here; needs closed formal subschemes and coherent ideals of
--   O_X, built by this node over ideals of definition of formal schemes and the thickenings X_n
--   (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.subschemeι: not stated here; needs closed formal subschemes and coherent ideals of
--   O_X, built by this node over ideals of definition of formal schemes and the thickenings X_n
--   (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsClosedImmersion: not stated here; needs closed formal subschemes and coherent
--   ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsClosedImmersion.ker: not stated here; needs closed formal subschemes and
--   coherent ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsClosedImmersion.comp: not stated here; needs closed formal subschemes and
--   coherent ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.Hom.IsClosedImmersion.finiteType: not stated here; needs closed formal subschemes
--   and coherent ideals of O_X, built by this node over ideals of definition of formal schemes and
--   the thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.subscheme_Spf: not stated here; needs closed formal subschemes and coherent ideals
--   of O_X, built by this node over ideals of definition of formal schemes and the thickenings X_n
--   (supplier: AdicSpacesPartII:F0/ideal-of-definition); its ring-level core is
--   `IsAdicRing.quotient`
-- FormalScheme.completion_subscheme: not stated here; needs closed formal subschemes and coherent
--   ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition)
-- FormalScheme.subscheme_Spf_quotient_example: not stated here; needs closed formal subschemes and
--   coherent ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition); its ring-level core is
--   `IsAdicRing.quotient` [computation test]
-- FormalScheme.subscheme_zero: not stated here; needs closed formal subschemes and coherent ideals
--   of O_X, built by this node over ideals of definition of formal schemes and the thickenings X_n
--   (supplier: AdicSpacesPartII:F0/ideal-of-definition) [degenerate test]
-- FormalScheme.subscheme_idealOfDefinition: not stated here; needs closed formal subschemes and
--   coherent ideals of O_X, built by this node over ideals of definition of formal schemes and the
--   thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition) [compatibility test]
-- FormalScheme.IsClosedImmersion.not_of_homeomorph: not stated here; needs closed formal subschemes
--   and coherent ideals of O_X, built by this node over ideals of definition of formal schemes and
--   the thickenings X_n (supplier: AdicSpacesPartII:F0/ideal-of-definition) [non-example test]

/-! ## AdicSpacesPartII:F0/formal-closed-immersion-criterion (lemma) -/

-- FormalScheme.Hom.isClosedImmersion_iff_reduction: not stated here; needs adic morphisms of formal
--   schemes and their reductions f_n (supplier:
--   AdicSpacesPartII:F0/adic-morphism-of-formal-schemes)

/-! ## AdicSpacesPartII:F0/finite-module-inverse-limit (lemma) -/

namespace IsAdicRing

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
  [IsNoetherianRing A]

/-- F0/finite-module-inverse-limit (i): a finite module over an adic noetherian ring is
`I`-adically separated and complete (EGA 0, 7.3.6). -/
theorem isAdicComplete_of_finite (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] :
    IsAdicComplete (IsAdicRing.ideal A) M := sorry

/-- F0/finite-module-inverse-limit (ii) (EGA 0, 7.2.9): let `(M n)` be finite `A`-modules killed
by `I^{n+1}`, with surjective transition maps `t n : M (n+1) → M n` of kernel `I^{n+1} M (n+1)`.
Then the inverse limit `L` (the compatible families in `∀ n, M n`) is a finite `A`-module and
`L ⧸ I^{n+1} L ≅ M n`. -/
theorem finite_limit (M : ℕ → Type*) [∀ n, AddCommGroup (M n)] [∀ n, Module A (M n)]
    [∀ n, Module.Finite A (M n)] (t : ∀ n, M (n + 1) →ₗ[A] M n)
    (ht : ∀ n, Function.Surjective (t n))
    (hann : ∀ n, (IsAdicRing.ideal A ^ (n + 1)) • (⊤ : Submodule A (M n)) = ⊥)
    (hker : ∀ n, LinearMap.ker (t n) = (IsAdicRing.ideal A ^ (n + 1)) • ⊤) :
    let L : Submodule A (∀ n, M n) :=
      ⨅ n, LinearMap.ker (LinearMap.proj n - (t n).comp (LinearMap.proj (n + 1)))
    Module.Finite A L ∧
      ∀ n, Nonempty ((L ⧸ (IsAdicRing.ideal A ^ (n + 1)) • (⊤ : Submodule A L)) ≃ₗ[A] M n) :=
  sorry

end IsAdicRing

/-! ## AdicSpacesPartII:F0/formal-completion (construction) -/

-- FormalScheme.completion: not stated here; needs the formal completion X̂ of a scheme along a
--   closed subset, built by this node over adic thickening systems of schemes and their colimit
--   formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.ofIdeal: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.toScheme: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.idealOfDefinition: not stated here; needs the formal completion X̂ of a
--   scheme along a closed subset, built by this node over adic thickening systems of schemes and
--   their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.specIso: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings); the ring it
--   identifies is `AdicCompletion I A`, an adic ring by `IsAdicRing.adicCompletion`
-- FormalScheme.completion.restrict: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.isNoetherian_iff: not stated here; needs the formal completion X̂ of a
--   scheme along a closed subset, built by this node over adic thickening systems of schemes and
--   their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.reduction: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.self: not stated here; needs the formal completion X̂ of a scheme along a
--   closed subset, built by this node over adic thickening systems of schemes and their colimit
--   formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion.flat: not stated here; needs the formal completion X̂ of a scheme along a
--   closed subset, built by this node over adic thickening systems of schemes and their colimit
--   formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
-- FormalScheme.completion_Spec_padic: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings) [computation test]
-- FormalScheme.completion_affine: not stated here; needs the formal completion X̂ of a scheme along
--   a closed subset, built by this node over adic thickening systems of schemes and their colimit
--   formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings); the ring it identifies is
--   `AdicCompletion I A`, an adic ring by `IsAdicRing.adicCompletion` [characterisation test]
-- FormalScheme.completion_self: not stated here; needs the formal completion X̂ of a scheme along a
--   closed subset, built by this node over adic thickening systems of schemes and their colimit
--   formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings) [degenerate test]
-- FormalScheme.completion_not_scheme: not stated here; needs the formal completion X̂ of a scheme
--   along a closed subset, built by this node over adic thickening systems of schemes and their
--   colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings) [non-example test]
-- FormalScheme.completion_ideal_independent: not stated here; needs the formal completion X̂ of a
--   scheme along a closed subset, built by this node over adic thickening systems of schemes and
--   their colimit formal scheme (supplier: AdicSpacesPartII:F0/colimit-of-thickenings)
--   [compatibility test]

/-! ## AdicSpacesPartII:F0/completion-of-morphism (construction) -/

-- FormalScheme.completion.map: not stated here; needs completions of morphisms of schemes, built by
--   this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_toScheme: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_unique: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_id: not stated here; needs completions of morphisms of schemes, built
--   by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_comp: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.pullbackIso: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_isAdic: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.prodIso: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completion.map_id_example: not stated here; needs completions of morphisms of
--   schemes, built by this node over the formal completion X̂ of a scheme along a closed subset
--   (supplier: AdicSpacesPartII:F0/formal-completion) [degenerate test]
-- FormalScheme.completion.map_comp_example: not stated here; needs completions of morphisms of
--   schemes, built by this node over the formal completion X̂ of a scheme along a closed subset
--   (supplier: AdicSpacesPartII:F0/formal-completion) [characterisation test]
-- FormalScheme.completion.map_Spec: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion) [computation test]
-- FormalScheme.completion.map_toScheme_example: not stated here; needs completions of morphisms of
--   schemes, built by this node over the formal completion X̂ of a scheme along a closed subset
--   (supplier: AdicSpacesPartII:F0/formal-completion) [compatibility test]
-- FormalScheme.completion.map_not_adic: not stated here; needs completions of morphisms of schemes,
--   built by this node over the formal completion X̂ of a scheme along a closed subset (supplier:
--   AdicSpacesPartII:F0/formal-completion) [non-example test]

/-! ## AdicSpacesPartII:F0/completion-morphism-germ (lemma) -/

-- FormalScheme.completion.map_eq_map_iff: not stated here; needs completions of morphisms of
--   schemes (supplier: AdicSpacesPartII:F0/completion-of-morphism)

/-! ## AdicSpacesPartII:F0/completion-of-coherent-sheaf (construction) -/

-- FormalScheme.completeModule: not stated here; needs the completion functor Coh(X) ⥤ Coh(X̂) of
--   coherent sheaves, built by this node over the formal completion X̂ of a scheme along a closed
--   subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.sectionsIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.specIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion); its module-level core,
--   `AdicCompletion I M ≃ M ⊗[A] AdicCompletion I A` for finite `M` over noetherian `A`, is
--   Mathlib's `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`
-- FormalScheme.completeModule.pullbackIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.tensorIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.homIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.pullbackCompletionIso: not stated here; needs the completion functor
--   Coh(X) ⥤ Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a
--   scheme along a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.support: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule.reductionIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion)
-- FormalScheme.completeModule_structureSheaf: not stated here; needs the completion functor Coh(X)
--   ⥤ Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme
--   along a closed subset (supplier: AdicSpacesPartII:F0/formal-completion) [degenerate test]
-- FormalScheme.completeModule_Spec: not stated here; needs the completion functor Coh(X) ⥤ Coh(X̂)
--   of coherent sheaves, built by this node over the formal completion X̂ of a scheme along a
--   closed subset (supplier: AdicSpacesPartII:F0/formal-completion) [computation test]
-- FormalScheme.completeModule_self: not stated here; needs the completion functor Coh(X) ⥤ Coh(X̂)
--   of coherent sheaves, built by this node over the formal completion X̂ of a scheme along a
--   closed subset (supplier: AdicSpacesPartII:F0/formal-completion) [compatibility test]
-- FormalScheme.completeModule_supportDisjoint: not stated here; needs the completion functor Coh(X)
--   ⥤ Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme
--   along a closed subset (supplier: AdicSpacesPartII:F0/formal-completion) [characterisation test]
-- FormalScheme.completeModule_torsion: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves, built by this node over the formal completion X̂ of a scheme along
--   a closed subset (supplier: AdicSpacesPartII:F0/formal-completion); its module-level core is the
--   example below [non-example test]
example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (h : ℓ ≠ p) :
    Nontrivial (ZMod ℓ) ∧ Subsingleton (AdicCompletion (Ideal.span {(p : ℤ)}) (ZMod ℓ)) := sorry


/-! ## AdicSpacesPartII:F0/completion-exact (lemma) -/

-- FormalScheme.completeModule.preservesFiniteLimits: not stated here; needs the completion functor
--   Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf); its ring-level core, flatness of
--   `AdicCompletion I A` over noetherian `A`, is Mathlib's `AdicCompletion.flat_of_isNoetherian`
-- FormalScheme.completeModule.preservesFiniteColimits: not stated here; needs the completion
--   functor Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)
-- FormalScheme.completeModule.pullbackIso: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/completion-detects-near-closed (lemma) -/

-- FormalScheme.completeModule.map_eq_zero_iff: not stated here; needs the completion functor Coh(X)
--   ⥤ Coh(X̂) of coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/coherent-formal-module (definition) -/

namespace FormalScheme

universe u

/-- F0/coherent-formal-module, affine ring-level core of `FormalScheme.Coh`: on the affine formal
scheme `Spf A` of an adic noetherian ring `A`, every coherent module is `M^Δ` for a finite
`A`-module `M` (F0/associated-formal-module), so coherent modules on `Spf A` are the full
subcategory of `ModuleCat A` on the finite modules. -/
abbrev Coh_affine (A : Type u) [CommRing A] : Type (u + 1) :=
  CategoryTheory.ObjectProperty.FullSubcategory fun M : ModuleCat.{u} A ↦ Module.Finite A M

/-- F0/coherent-formal-module, affine core of `FormalScheme.Coh.ker_mem`: over a noetherian ring
the finite modules form an abelian category (kernels and cokernels of maps of finite modules are
finite). -/
instance Coh_affine.abelian (A : Type u) [CommRing A] [IsNoetherianRing A] :
    CategoryTheory.Abelian (Coh_affine A) := sorry

end FormalScheme

-- FormalScheme.Coh: not stated here; needs coherent modules on formal schemes, built by this node
--   over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme); its affine core is
--   `FormalScheme.Coh_affine`, with `Coh_affine.abelian`, `IsAdicRing.isAdicComplete_of_finite`
--   and `IsAdicRing.finite_limit` (F0/finite-module-inverse-limit)
-- FormalScheme.isCoherentRing_structureSheaf: not stated here; needs coherent modules on formal
--   schemes, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.ker_mem: not stated here; needs coherent modules on formal schemes, built by
--   this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.tensor: not stated here; needs coherent modules on formal schemes, built by this
--   node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.pullback: not stated here; needs coherent modules on formal schemes, built by
--   this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.reduction: not stated here; needs coherent modules on formal schemes, built by
--   this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.sectionsTopology: not stated here; needs coherent modules on formal schemes,
--   built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.isIdealOfDefinition_coherent: not stated here; needs coherent modules on formal
--   schemes, built by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
-- FormalScheme.Coh.structureSheaf: not stated here; needs coherent modules on formal schemes, built
--   by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- FormalScheme.Coh.Spf_equiv: not stated here; needs coherent modules on formal schemes, built by
--   this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- FormalScheme.Coh.not_rationals: not stated here; needs coherent modules on formal schemes, built
--   by this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme); its module-level core is the example
--   below [non-example test]
example (p : ℕ) [Fact p.Prime] : ¬ Module.Finite ℤ_[p] ℚ_[p] := sorry

-- FormalScheme.Coh.ofScheme: not stated here; needs coherent modules on formal schemes, built by
--   this node over the category of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]

/-! ## AdicSpacesPartII:F0/associated-formal-module (construction) -/

-- FormalScheme.Spf.completedTilde: not stated here; needs the coherent module M^Δ on Spf A, built
--   by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.map: not stated here; needs the coherent module M^Δ on Spf A,
--   built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.basicOpenIso: not stated here; needs the coherent module M^Δ on
--   Spf A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.globalSectionsIso: not stated here; needs the coherent module M^Δ
--   on Spf A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.completionIso: not stated here; needs the coherent module M^Δ on
--   Spf A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.pullbackIso: not stated here; needs the coherent module M^Δ on
--   Spf A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde.ideal_map: not stated here; needs the coherent module M^Δ on Spf
--   A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module)
-- FormalScheme.Spf.completedTilde_self: not stated here; needs the coherent module M^Δ on Spf A,
--   built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) [degenerate test]
-- FormalScheme.Spf.completedTilde_discrete: not stated here; needs the coherent module M^Δ on Spf
--   A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) [compatibility test]
-- FormalScheme.Spf.completedTilde_basicOpen: not stated here; needs the coherent module M^Δ on Spf
--   A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) [computation test]
-- FormalScheme.Spf.completedTilde_padic_torsion: not stated here; needs the coherent module M^Δ on
--   Spf A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) [computation test]
-- FormalScheme.Spf.completedTilde_ne_tilde: not stated here; needs the coherent module M^Δ on Spf
--   A, built by this node over coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) [non-example test]

/-! ## AdicSpacesPartII:F0/affine-coherent-equivalence (theorem) -/

-- FormalScheme.Spf.cohEquiv: not stated here; needs the coherent module M^Δ on Spf A (supplier:
--   AdicSpacesPartII:F0/associated-formal-module)

/-! ## AdicSpacesPartII:F0/coherent-as-inverse-system (theorem) -/

-- FormalScheme.cohEquivSystems: not stated here; needs coherent modules on formal schemes
--   (supplier: AdicSpacesPartII:F0/coherent-formal-module); its affine core is
--   `IsAdicRing.finite_limit`

/-! ## AdicSpacesPartII:F0/graded-cohomology-finiteness (lemma) -/

-- FormalScheme.graded_cohomology_finite: not stated here; needs coherent cohomology H^i(X, F) of
--   coherent sheaves on schemes and higher direct images R^i f_* and ample invertible sheaves and
--   projective bundles over a noetherian base (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.1) (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2)

/-! ## AdicSpacesPartII:F0/formal-functions-affine (lemma) -/

-- FormalScheme.formalFunctions_mittagLeffler: not stated here; needs coherent cohomology H^i(X, F)
--   of coherent sheaves on schemes and higher direct images R^i f_* (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2)

/-! ## AdicSpacesPartII:F0/theorem-on-formal-functions (theorem) -/

-- FormalScheme.theoremOnFormalFunctions: not stated here; needs coherent cohomology H^i(X, F) of
--   coherent sheaves on schemes and higher direct images R^i f_* (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2)

/-! ## AdicSpacesPartII:F0/formal-functions-at-point (lemma) -/

-- FormalScheme.formalFunctions_stalk: not stated here; needs coherent cohomology H^i(X, F) of
--   coherent sheaves on schemes and higher direct images R^i f_* and flat base change for higher
--   direct images (supplier: tauceti:TauCetiRoadmap/JacobianChallenge#layer-c) (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2)

/-! ## AdicSpacesPartII:F0/cohomology-of-mittag-leffler-limit (lemma) -/

-- Topology.sheafH_lim_surjective: not stated here; needs cohomology H^i(U, F|_U) of restrictions of
--   sheaves of abelian groups to opens, with restriction maps (supplier:
--   SchemeAndStackFoundations:SF.2)

/-! ## AdicSpacesPartII:F0/formal-direct-image-comparison (theorem) -/

-- FormalScheme.formalCohomologyIso: not stated here; needs coherent cohomology H^i(X, F) of
--   coherent sheaves on schemes and higher direct images R^i f_* and vanishing of higher cohomology
--   of quasi-coherent sheaves on affine schemes (supplier:
--   tauceti:TauCetiRoadmap/JacobianChallenge#layer-b) and the completion functor Coh(X) ⥤ Coh(X̂)
--   of coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf) (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2)

/-! ## AdicSpacesPartII:F0/closed-fibre-neighbourhood (lemma) -/

/-- F0/closed-fibre-neighbourhood (EGA III, 5.1.3.1): over an adic noetherian ring `A`, if the
underlying map of `f : X ⟶ Spec A` is closed (for instance `f` proper), every open subset of `X`
containing the closed fibre `f⁻¹(V(I))` is all of `X`. -/
theorem FormalScheme.eq_top_of_closedFibre_subset {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsAdicRing A] [IsNoetherianRing A] {X : _root_.AlgebraicGeometry.Scheme}
    (f : X ⟶ _root_.AlgebraicGeometry.Spec (CommRingCat.of A)) (hf : IsClosedMap f) (U : X.Opens)
    (hU : f ⁻¹' (PrimeSpectrum.zeroLocus (IsAdicRing.ideal A : Set A) :
      Set (PrimeSpectrum A)) ⊆ U) : U = ⊤ := sorry

/-! ## AdicSpacesPartII:F0/existence-fully-faithful (lemma) -/

-- FormalScheme.completeModule.fullyFaithful_of_isProper: not stated here; needs the completion
--   functor Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/formal-serre-vanishing (lemma) -/

-- FormalScheme.formalSerreVanishing: not stated here; needs ample invertible sheaves and projective
--   bundles over a noetherian base and coherent modules on formal schemes (supplier:
--   AdicSpacesPartII:F0/coherent-formal-module) (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.1)

/-! ## AdicSpacesPartII:F0/existence-projective-case (lemma) -/

-- FormalScheme.completeModule.isEquivalence_of_ample: not stated here; needs ample invertible
--   sheaves and projective bundles over a noetherian base and the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf)
--   (supplier: AlgebraicModuliForArithmeticGeometry:R09.1)

/-! ## AdicSpacesPartII:F0/existence-modification (lemma) -/

-- FormalScheme.exists_map_completion_pushforward: not stated here; needs the completion functor
--   Coh(X) ⥤ Coh(X̂) of coherent sheaves and coherent cohomology H^i(X, F) of coherent sheaves on
--   schemes and higher direct images R^i f_* (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2) (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/bounded-torsion-algebraization (lemma) -/

-- FormalScheme.exists_algebraization_of_boundedTorsion: not stated here; needs the completion
--   functor Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/existence-devissage (lemma) -/

-- FormalScheme.essImage_of_devissage: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/existence-proper-support-reduction (lemma) -/

-- FormalScheme.exists_properSubscheme_support: not stated here; needs the completion functor Coh(X)
--   ⥤ Coh(X̂) of coherent sheaves and Chow's lemma over a noetherian base (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.2) and coherent cohomology H^i(X, F) of coherent
--   sheaves on schemes and higher direct images R^i f_* (supplier:
--   tauceti:TauCetiRoadmap/StableReduction#layer-2) (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/grothendieck-existence (theorem) -/

-- FormalScheme.grothendieckExistence: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves and Chow's lemma over a noetherian base (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.2) (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)
-- FormalScheme.grothendieckExistence_proper: not stated here; needs the completion functor Coh(X) ⥤
--   Coh(X̂) of coherent sheaves and Chow's lemma over a noetherian base (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.2) (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf)

/-! ## AdicSpacesPartII:F0/closed-subscheme-algebraization (lemma) -/

-- FormalScheme.closedSubschemeEquiv: not stated here; needs closed formal subschemes and coherent
--   ideals of O_X and the completion functor Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf) (supplier:
--   AdicSpacesPartII:F0/closed-formal-subscheme)

/-! ## AdicSpacesPartII:F0/completion-detects-isomorphism (lemma) -/

-- FormalScheme.completion.map_isIso_iff: not stated here; needs completions of morphisms of schemes
--   (supplier: AdicSpacesPartII:F0/completion-of-morphism)

/-! ## AdicSpacesPartII:F0/formal-morphism-full-faithfulness (theorem) -/

-- FormalScheme.completion.homEquiv: not stated here; needs completions of morphisms of schemes and
--   the completion functor Coh(X) ⥤ Coh(X̂) of coherent sheaves (supplier:
--   AdicSpacesPartII:F0/completion-of-coherent-sheaf) (supplier:
--   AdicSpacesPartII:F0/completion-of-morphism)

/-! ## AdicSpacesPartII:F0/grothendieck-algebraization (theorem) -/

-- FormalScheme.grothendieckAlgebraization: not stated here; needs ample invertible sheaves and
--   projective bundles over a noetherian base and the completion functor Coh(X) ⥤ Coh(X̂) of
--   coherent sheaves (supplier: AdicSpacesPartII:F0/completion-of-coherent-sheaf) (supplier:
--   AlgebraicModuliForArithmeticGeometry:R09.1)

end TauCeti

end

/-! # Layer R2. Formal schemes of finite type over O_K, generic fibres and Hasse domains -/

noncomputable section

namespace TauCeti


/-! ## AdicSpacesPartII:R2/topologically-finitely-presented-algebra (definition)

Conventions of this stage. The base `O` is `O_K`, the valuation ring of a field complete for a
nontrivial rank-one nonarchimedean absolute value (not assumed discretely valued), with
`ϖ ∈ O` a pseudouniformiser; `O` carries its `ϖ`-adic topology, never the `𝔪_K`-adic one. These
standing hypotheses are bundled in `Huber.IsCompleteRankOneBase O ϖ`, together with the instance
arguments `[IsDomain O] [ValuationRing O] [NonarchimedeanRing O]`. The restricted power-series
ring `O⟨ξ₁, …, ξₙ⟩` is Tau Ceti's `restrictedMvPowerSeriesCompletion n O`. An `O`-algebra `A` is
*tft* when some `O⟨ξ⟩ →ₐ[O] A` is surjective (no packet name; written out where needed), *tfp*
(`Huber.IsTopologicallyFinitePresentation`) when moreover the kernel is finitely generated, and
*admissible* (`Huber.IsAdmissibleAlgebra`) when tfp without `ϖ`-torsion. No topology on `A` is
part of these definitions: `A` carries the `ϖ`-adic topology, and every statement that needs it
assumes `IsAdic (Ideal.span {algebraMap O A ϖ})`. The generic fibre `A_K = A[1/ϖ]` is
`Localization.Away (algebraMap O A ϖ)`, with the topology
`IsTopologicallyFinitePresentation.genericFibre`.
-/

namespace Huber

/-- R2/topologically-finitely-presented-algebra, standing data: `O` is the valuation ring of a
field complete for a nontrivial rank-one nonarchimedean absolute value, `ϖ ∈ O` is a
pseudouniformiser (nonzero, not a unit), and the topology of `O` is the `ϖ`-adic one, for which
`O` is complete and separated. `O` being a valuation ring is the instance argument
`[ValuationRing O]` of the statements that use this class. -/
class IsCompleteRankOneBase (O : Type*) [CommRing O] [TopologicalSpace O] (ϖ : O) : Prop where
  /-- The valuation has rank one: `O` has Krull dimension one. -/
  ringKrullDim_eq_one : ringKrullDim O = 1
  /-- `ϖ ≠ 0`. -/
  ne_zero : ϖ ≠ 0
  /-- `ϖ` is not a unit, so `0 < |ϖ| < 1`. -/
  not_isUnit : ¬ IsUnit ϖ
  /-- The topology of `O` is the `ϖ`-adic topology. -/
  isAdic : IsAdic (Ideal.span {ϖ})
  /-- `O` is `ϖ`-adically complete and separated. -/
  isAdicComplete : IsAdicComplete (Ideal.span {ϖ}) O

/-- R2/topologically-finitely-presented-algebra: an `O`-algebra `A` is *topologically of finite
presentation* (tfp) if there are `n` and a surjection of `O`-algebras
`O⟨ξ₁, …, ξₙ⟩ → A` with finitely generated kernel, that is
`A ≅ O⟨ξ⟩ ⧸ (f₁, …, f_m)` (Bosch–Lütkebohmert I §1). The definition makes sense over any
nonarchimedean `O`; the theory assumes `IsCompleteRankOneBase O ϖ`. -/
def IsTopologicallyFinitePresentation (O : Type*) [CommRing O] [TopologicalSpace O]
    [NonarchimedeanRing O] (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  ∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A),
    Function.Surjective π ∧ (RingHom.ker π).FG

/-- R2/topologically-finitely-presented-algebra: `A` is an *admissible* `O`-algebra
(Bosch–Lütkebohmert's word, not EGA's admissible topological rings): tfp and without
`ϖ`-torsion. -/
def IsAdmissibleAlgebra {O : Type*} [CommRing O] [TopologicalSpace O] [NonarchimedeanRing O]
    (ϖ : O) (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  IsTopologicallyFinitePresentation O A ∧ Submodule.torsionBy O A ϖ = ⊥

section TFP

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] {A : Type*} [CommRing A] [Algebra O A]

/-- R2/topologically-finitely-presented-algebra (constructor): `O⟨ξ⟩ ⧸ (f₁, …, f_m)` is tfp. -/
theorem IsTopologicallyFinitePresentation.of_presentation {n : ℕ}
    (s : Finset (restrictedMvPowerSeriesCompletion n O)) :
    IsTopologicallyFinitePresentation O
      (restrictedMvPowerSeriesCompletion n O ⧸
        Ideal.span (s : Set (restrictedMvPowerSeriesCompletion n O))) := sorry

/-- R2/topologically-finitely-presented-algebra (compatibility): with the `ϖ`-adic topology on `A`,
the structure map of a tfp algebra is topologically of finite type in Tau Ceti's sense (trivial
weights `Tᵢ = {1}`). -/
theorem IsTopologicallyFinitePresentation.isTopologicallyFiniteType {ϖ : O}
    [IsCompleteRankOneBase O ϖ] [TopologicalSpace A]
    (htop : IsAdic (Ideal.span {algebraMap O A ϖ})) (hA : IsTopologicallyFinitePresentation O A) :
    IsTopologicallyFiniteType (algebraMap O A) := sorry

/-- R2/topologically-finitely-presented-algebra (characterisation): a tfp algebra is
`ϖ`-adically complete and separated (Bosch–Lütkebohmert I 1.1(b)). -/
theorem IsTopologicallyFinitePresentation.isAdicComplete {ϖ : O} [IsCompleteRankOneBase O ϖ]
    (hA : IsTopologicallyFinitePresentation O A) : IsAdicComplete (Ideal.span {ϖ}) A := sorry

/-- R2/topologically-finitely-presented-algebra (characterisation): tfp does not depend on the
presentation: for any surjection `O⟨η⟩ → A`, `A` is tfp iff its kernel is finitely generated. -/
theorem IsTopologicallyFinitePresentation.iff_of_surjective (ϖ : O) [IsCompleteRankOneBase O ϖ]
    {n : ℕ} (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A) (hπ : Function.Surjective π) :
    IsTopologicallyFinitePresentation O A ↔ (RingHom.ker π).FG := sorry

/-- R2/topologically-finitely-presented-algebra (constructor): the completed localisation
`A_{f}`, the `ϖ`-adic completion of `A[1/f]` (the tfp case of F0's `AdicRing.CompletedAway`),
is tfp; it is `A⟨ζ⟩ ⧸ (1 - fζ)`, and depends only on the open set `{f ≠ 0}` of
`Spec (A ⧸ ϖ)`. -/
theorem IsTopologicallyFinitePresentation.completeLocalization {ϖ : O}
    [IsCompleteRankOneBase O ϖ] (hA : IsTopologicallyFinitePresentation O A) (f : A) :
    IsTopologicallyFinitePresentation O
      (AdicCompletion (Ideal.span {algebraMap O (Localization.Away f) ϖ}) (Localization.Away f)) :=
  sorry

/-- R2/topologically-finitely-presented-algebra (compatibility): a tfp algebra with its
`ϖ`-adic topology is an adic ring of finite ideal type (F0/adic-ring), with ideal of definition
`ϖA`. -/
theorem IsTopologicallyFinitePresentation.isAdicRing {ϖ : O} [IsCompleteRankOneBase O ϖ]
    [TopologicalSpace A] [IsTopologicalRing A] (htop : IsAdic (Ideal.span {algebraMap O A ϖ}))
    (hA : IsTopologicallyFinitePresentation O A) : IsAdicRing A := sorry

/-- R2/topologically-finitely-presented-algebra (constructor): if `A` is tfp and `b ⊆ A` is
finitely generated, then `A ⧸ b` and `A⟨η₁, …, η_r⟩` (for the `ϖ`-adic topology of `A`) are
tfp. -/
theorem IsTopologicallyFinitePresentation.quotient {ϖ : O} [IsCompleteRankOneBase O ϖ]
    (hA : IsTopologicallyFinitePresentation O A) (b : Ideal A) (hb : b.FG)
    [TopologicalSpace A] [NonarchimedeanRing A] (htop : IsAdic (Ideal.span {algebraMap O A ϖ}))
    (r : ℕ) :
    IsTopologicallyFinitePresentation O (A ⧸ b) ∧
      letI : Algebra O (restrictedMvPowerSeriesCompletion r A) :=
        ((algebraMap A (restrictedMvPowerSeriesCompletion r A)).comp (algebraMap O A)).toAlgebra
      IsTopologicallyFinitePresentation O (restrictedMvPowerSeriesCompletion r A) := sorry

/-- R2/topologically-finitely-presented-algebra (characterisation): a `ϖ`-adically complete and
separated `O`-algebra is tft iff `A ⧸ ϖA` is of finite type over `O ⧸ ϖ` (Bosch–Lütkebohmert I
Lemma 1.5); a tfp algebra is finitely presented modulo every `ϖ ^ m`. -/
theorem IsTopologicallyFinitePresentation.iff_mod {ϖ : O} [IsCompleteRankOneBase O ϖ]
    [IsAdicComplete (Ideal.span {ϖ}) A] :
    ((∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A), Function.Surjective π) ↔
      Algebra.FiniteType (O ⧸ Ideal.span {ϖ}) (A ⧸ (Ideal.span {ϖ}).map (algebraMap O A))) ∧
    (IsTopologicallyFinitePresentation O A → ∀ m : ℕ,
      Algebra.FinitePresentation (O ⧸ Ideal.span {ϖ ^ m})
        (A ⧸ (Ideal.span {ϖ ^ m}).map (algebraMap O A))) := sorry

/-- R2/topologically-finitely-presented-algebra (data): the topology of the generic fibre
`A_K = A ⊗_O K = A[1/ϖ]` of a tfp algebra, for which the image of `A`, with its `ϖ`-adic
topology, is an open ring of definition (Tau Ceti's `PairOfDefinition.locTopology` for `T = {1}`,
`s = ϖ`). With it `A_K` is a `K`-affinoid algebra, a quotient of `K⟨ξ⟩`
(`IsTopologicallyFinitePresentation.isTateRing_genericFibre`). -/
@[instance_reducible]
def IsTopologicallyFinitePresentation.genericFibre (hA : IsTopologicallyFinitePresentation O A)
    (ϖ : O) : TopologicalSpace (Localization.Away (algebraMap O A ϖ)) := sorry

/-- R2/topologically-finitely-presented-algebra: the topology `genericFibre` is a
nonarchimedean ring topology. -/
theorem IsTopologicallyFinitePresentation.nonarchimedeanRing_genericFibre
    (hA : IsTopologicallyFinitePresentation O A) (ϖ : O) :
    @NonarchimedeanRing (Localization.Away (algebraMap O A ϖ)) _ (hA.genericFibre ϖ) := sorry

/-- R2/topologically-finitely-presented-algebra: the generic fibre of a tfp algebra is a Tate
ring (pseudouniformiser `ϖ`) and strongly noetherian (the anchor's Layer 0.5). -/
theorem IsTopologicallyFinitePresentation.isTateRing_genericFibre {ϖ : O}
    [IsCompleteRankOneBase O ϖ] (hA : IsTopologicallyFinitePresentation O A) :
    letI := hA.genericFibre ϖ
    letI := hA.nonarchimedeanRing_genericFibre ϖ
    IsTateRing (Localization.Away (algebraMap O A ϖ)) ∧
      IsStronglyNoetherian (Localization.Away (algebraMap O A ϖ)) := sorry

/-- R2/topologically-finitely-presented-algebra (characterisation): a tfp algebra is admissible
iff it is flat over `O` (`O` being a valuation ring, flat means torsion-free). -/
theorem isAdmissibleAlgebra_iff_flat {ϖ : O} [IsCompleteRankOneBase O ϖ]
    (hA : IsTopologicallyFinitePresentation O A) : IsAdmissibleAlgebra ϖ A ↔ Module.Flat O A :=
  sorry

/-- R2/topologically-finitely-presented-algebra: for admissible `A` the map `A → A[1/ϖ]` is
injective, so `A` is an `O`-lattice in the affinoid algebra `A_K`. -/
theorem IsAdmissibleAlgebra.injective_toGenericFibre {ϖ : O} (hA : IsAdmissibleAlgebra ϖ A) :
    Function.Injective (algebraMap A (Localization.Away (algebraMap O A ϖ))) := sorry

/-- R2/topologically-finitely-presented-algebra (constructor): for tfp `A` the `ϖ`-power torsion
ideal `A[ϖ^∞]`, the kernel of `A → A[1/ϖ]`, is finitely generated, and `A ⧸ A[ϖ^∞]` is
admissible. -/
theorem IsTopologicallyFinitePresentation.torsionQuotient {ϖ : O} [IsCompleteRankOneBase O ϖ]
    (hA : IsTopologicallyFinitePresentation O A) :
    (RingHom.ker (algebraMap A (Localization.Away (algebraMap O A ϖ)))).FG ∧
      IsAdmissibleAlgebra ϖ
        (A ⧸ RingHom.ker (algebraMap A (Localization.Away (algebraMap O A ϖ)))) := sorry

end TFP

section Tests

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O]

/- `O⟨T⟩` is admissible; its generic fibre `O⟨T⟩[1/ϖ]` is `K⟨T⟩`. -/
-- test topologicallyFinitePresentation_test_restricted (computation)
--   [R2/topologically-finitely-presented-algebra]
example {ϖ : O} [IsCompleteRankOneBase O ϖ] :
    IsAdmissibleAlgebra ϖ (restrictedMvPowerSeriesCompletion 1 O) := sorry

/- `O⟨T⟩ ⧸ (ϖT)` is tfp and not admissible, and its torsion-free quotient is `O`. -/
-- test topologicallyFinitePresentation_test_torsion (non-example)
--   [R2/topologically-finitely-presented-algebra]
example {ϖ : O} [IsCompleteRankOneBase O ϖ] :
    let P := restrictedMvPowerSeriesCompletion 1 O
    let T : P := ((weightedX (fun _ : Fin 1 ↦ ({1} : Set O)) isWeightFamily_one_weight 0 :
      weightedRestrictedSubring _ _) : P)
    let B := P ⧸ Ideal.span {algebraMap O P ϖ * T}
    IsTopologicallyFinitePresentation O B ∧ ¬ IsAdmissibleAlgebra ϖ B ∧
      Nonempty ((B ⧸ RingHom.ker (algebraMap B (Localization.Away (algebraMap O B ϖ)))) ≃ₐ[O] O) :=
  sorry

/- If `𝔪² = 𝔪` (for instance `K = ℂ_p`), the `𝔪`-adic completion of `O[T]` is `k[T]`: the
`𝔪`-adic topology would give a different, wrong ring. -/
-- test topologicallyFinitePresentation_test_madic (non-example)
--   [R2/topologically-finitely-presented-algebra]
example (hm : IsLocalRing.maximalIdeal O ^ 2 = IsLocalRing.maximalIdeal O) :
    Nonempty (AdicCompletion ((IsLocalRing.maximalIdeal O).map Polynomial.C) (Polynomial O) ≃+*
      Polynomial (IsLocalRing.ResidueField O)) := sorry

/- With no variables: `O` is admissible, and `O ⧸ ϖ ^ m` (`m ≥ 1`) is tfp but not admissible. -/
-- test topologicallyFinitePresentation_test_zeroVars (degenerate)
--   [R2/topologically-finitely-presented-algebra]
example {ϖ : O} [IsCompleteRankOneBase O ϖ] :
    IsAdmissibleAlgebra ϖ O ∧ ∀ m : ℕ, 1 ≤ m →
      IsTopologicallyFinitePresentation O (O ⧸ Ideal.span {ϖ ^ m}) ∧
        ¬ IsAdmissibleAlgebra ϖ (O ⧸ Ideal.span {ϖ ^ m}) := sorry

/- Discretely valued `K` (`O` noetherian): tft implies tfp, and admissible means noetherian,
`ϖ`-adically complete, flat and tft. -/
-- test topologicallyFinitePresentation_test_discrete (compatibility)
--   [R2/topologically-finitely-presented-algebra]
example {ϖ : O} [IsCompleteRankOneBase O ϖ] [IsNoetherianRing O] {A : Type*} [CommRing A]
    [Algebra O A] :
    ((∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A), Function.Surjective π) →
      IsTopologicallyFinitePresentation O A) ∧
    (IsAdmissibleAlgebra ϖ A ↔ IsNoetherianRing A ∧ IsAdicComplete (Ideal.span {ϖ}) A ∧
      Module.Flat O A ∧
      ∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A), Function.Surjective π) :=
  sorry

end Tests

/-! ## AdicSpacesPartII:R2/saturated-submodule-finitely-generated (lemma) -/

section Saturated

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] {A : Type*} [CommRing A] [Algebra O A]

/-- R2/saturated-submodule-finitely-generated: over a tft `O`-algebra `A`, a `ϖ`-saturated
submodule of a finite free module `A ^ r` is finitely generated (Bosch–Lütkebohmert I 1.2). -/
theorem submodule_fg_of_saturated {ϖ : O} [IsCompleteRankOneBase O ϖ] {n : ℕ}
    {π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A} (hπ : Function.Surjective π) {r : ℕ}
    (M : Submodule A (Fin r → A))
    (hM : ∀ (x : Fin r → A) (m : ℕ), algebraMap O A ϖ ^ m • x ∈ M → x ∈ M) : M.FG := sorry

/-- R2/saturated-submodule-finitely-generated, equivalent form: for a finitely generated module
`N` over a tft algebra, the `ϖ`-power torsion `N[ϖ^∞]` is finitely generated and
`N ⧸ N[ϖ^∞]` is finitely presented (`(A, ϖA)` is adhesive, Fujiwara–Kato). -/
theorem torsion_fg_of_fg {ϖ : O} [IsCompleteRankOneBase O ϖ] {n : ℕ}
    {π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A} (hπ : Function.Surjective π)
    {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N] :
    (Submodule.torsion' A N (Submonoid.powers (algebraMap O A ϖ))).FG ∧
      Module.FinitePresentation A
        (N ⧸ Submodule.torsion' A N (Submonoid.powers (algebraMap O A ϖ))) := sorry

end Saturated

/-! ## AdicSpacesPartII:R2/flat-tft-is-tfp (lemma) -/

section FlatTFT

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] {A : Type*} [CommRing A] [Algebra O A]

/-- R2/flat-tft-is-tfp (a): a tft `O`-algebra is `ϖ`-adically complete. -/
theorem isPrecomplete_of_surjective {ϖ : O} [IsCompleteRankOneBase O ϖ] {n : ℕ}
    {π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A} (hπ : Function.Surjective π) :
    IsPrecomplete (Ideal.span {ϖ}) A := sorry

/-- R2/flat-tft-is-tfp (c): a tft `O`-algebra without `ϖ`-torsion (equivalently, flat over `O`)
is tfp, hence admissible (Bosch–Lütkebohmert I Corollary 1.4). -/
theorem isAdmissibleAlgebra_of_torsionBy_eq_bot {ϖ : O} [IsCompleteRankOneBase O ϖ] {n : ℕ}
    {π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A} (hπ : Function.Surjective π)
    (htors : Submodule.torsionBy O A ϖ = ⊥) : IsAdmissibleAlgebra ϖ A := sorry

end FlatTFT

/-! ## AdicSpacesPartII:R2/tfp-algebra-coherent (lemma) -/

section Coherent

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] {A : Type*} [CommRing A] [Algebra O A]

/-- R2/tfp-algebra-coherent (a): a tfp algebra is a coherent ring: every finitely generated ideal
is finitely presented. -/
theorem IsTopologicallyFinitePresentation.finitePresentation_of_fg (ϖ : O)
    [IsCompleteRankOneBase O ϖ] (hA : IsTopologicallyFinitePresentation O A) (I : Ideal A)
    (hI : I.FG) : Module.FinitePresentation A I := sorry

/-- R2/tfp-algebra-coherent (b): for a coherent (finitely presented) module `M` over a tfp algebra
and a finitely generated ideal `b`, the `ϖ`-power torsion `M[ϖ^∞]`, the annihilator `Ann_A(M)`
and `Ann_M(b)` are finitely generated. -/
theorem IsTopologicallyFinitePresentation.fg_torsion_annihilator {ϖ : O}
    [IsCompleteRankOneBase O ϖ] (hA : IsTopologicallyFinitePresentation O A) {M : Type*}
    [AddCommGroup M] [Module A M] [Module.FinitePresentation A M] (b : Ideal A) (hb : b.FG) :
    (Submodule.torsion' A M (Submonoid.powers (algebraMap O A ϖ))).FG ∧
      (Module.annihilator A M).FG ∧ (Submodule.torsionBySet A M b).FG := sorry

end Coherent

/-! ## AdicSpacesPartII:R2/tfp-locality (lemma) -/

section Locality

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] {A : Type*} [CommRing A] [Algebra O A]

/-- R2/tfp-locality: for a `ϖ`-adically complete and separated `A` and `f₁, …, f_k` generating the
unit ideal (the affine open cover of `Spf A` by the `Spf A⟨fᵢ⁻¹⟩`), `A` is tfp (resp. admissible)
iff every completed localisation `A⟨fᵢ⁻¹⟩` is. -/
theorem isTopologicallyFinitePresentation_iff_of_span_eq_top {ϖ : O} [IsCompleteRankOneBase O ϖ]
    [IsAdicComplete (Ideal.span {ϖ}) A] {ι : Type*} [Finite ι] (f : ι → A)
    (hf : Ideal.span (Set.range f) = ⊤) :
    (IsTopologicallyFinitePresentation O A ↔ ∀ i, IsTopologicallyFinitePresentation O
        (AdicCompletion (Ideal.span {algebraMap O (Localization.Away (f i)) ϖ})
          (Localization.Away (f i)))) ∧
      (IsAdmissibleAlgebra ϖ A ↔ ∀ i, IsAdmissibleAlgebra ϖ
        (AdicCompletion (Ideal.span {algebraMap O (Localization.Away (f i)) ϖ})
          (Localization.Away (f i)))) := sorry

/-- R2/tfp-locality: for tfp `A` and `f ∈ A`, the map `A → A⟨f⁻¹⟩` is flat. -/
theorem IsTopologicallyFinitePresentation.flat_completeLocalization {ϖ : O}
    [IsCompleteRankOneBase O ϖ] (hA : IsTopologicallyFinitePresentation O A) (f : A) :
    Module.Flat A
      (AdicCompletion (Ideal.span {algebraMap O (Localization.Away f) ϖ}) (Localization.Away f)) :=
  sorry

/-- R2/tfp-locality, flatness criterion (Bosch–Lütkebohmert I 1.6): for tfp `A → B` and a
coherent `B`-module `M`, `M` is flat (resp. faithfully flat) over `A` iff every
`M ⧸ ϖ ^ m M` is flat (resp. faithfully flat) over `A ⧸ ϖ ^ m A`. -/
theorem IsTopologicallyFinitePresentation.flat_iff_forall_flat_quotient {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {B : Type*} [CommRing B] [Algebra O B] [Algebra A B]
    [IsScalarTower O A B] (hA : IsTopologicallyFinitePresentation O A)
    (hB : IsTopologicallyFinitePresentation O B) {M : Type*} [AddCommGroup M] [Module A M]
    [Module B M] [IsScalarTower A B M] [Module.FinitePresentation B M] :
    (Module.Flat A M ↔ ∀ m : ℕ, 1 ≤ m →
      Module.Flat (A ⧸ (Ideal.span {ϖ ^ m}).map (algebraMap O A))
        (M ⧸ (Ideal.span {ϖ ^ m}).map (algebraMap O A) • (⊤ : Submodule A M))) ∧
    (Module.FaithfullyFlat A M ↔ ∀ m : ℕ, 1 ≤ m →
      Module.FaithfullyFlat (A ⧸ (Ideal.span {ϖ ^ m}).map (algebraMap O A))
        (M ⧸ (Ideal.span {ϖ ^ m}).map (algebraMap O A) • (⊤ : Submodule A M))) := sorry

end Locality

end Huber

/-! ## AdicSpacesPartII:R2/admissible-formal-scheme (definition)

Every item needs formal schemes; the ring-level core is `Huber.IsAdmissibleAlgebra`. -/

-- FormalScheme.IsLocallyTFP: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsAdmissible: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.isAdmissible_spf_iff: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core:
--   `Huber.IsAdmissibleAlgebra` [characterisation]
-- FormalScheme.isAdmissible_iff_affineOpens: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core:
--   `Huber.isTopologicallyFinitePresentation_iff_of_span_eq_top` [characterisation]
-- FormalScheme.isAdmissible_iff_flat_stalks: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation]
-- FormalScheme.IsAdmissible.ofIsOpenImmersion: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- FormalScheme.specialFibre: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.admissiblePullback: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [universal-property]
-- FormalScheme.torsionFreeQuotient: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [universal-property]
-- FormalScheme.CoherentOpenIdeal: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsAdmissible.completion: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.IsAdmissible.iff_of_discreteValuation: not stated here; needs formal schemes over
--   Spf O_K (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.IsAdmissible.isTypeS: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.CoherentModule: not stated here; needs formal schemes over Spf O_K and sheaves of
--   modules on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level
--   core: a finitely presented module over a tfp algebra, `Module.FinitePresentation A M` with
--   `Huber.IsTopologicallyFinitePresentation O A` (node R2/tfp-algebra-coherent) [structure]
-- admissible_test_formalAffineLine: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- admissible_test_torsion: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- admissible_test_powerSeries: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- admissible_test_completion_projectiveLine: not stated here; needs formal schemes over Spf O_K
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- admissible_test_formalTorus: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- admissible_test_base: not stated here; needs formal schemes over Spf O_K (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]

/-! ## AdicSpacesPartII:R2/formal-schemes-of-type-S (definition)

Every item needs formal schemes. The affine condition — `A` adic with a finitely generated ideal
of definition (F0's `IsAdicRing`), and `A` noetherian or `A(1/s)` strongly noetherian for some
`s` generating an ideal of definition — needs the topology of `A(1/s)` whose ring of definition is
the image of `A`, which is F0/completed-localization's; it is not stated separately. -/

-- FormalScheme.IsTypeS: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsTypeS.of_isLocallyNoetherian: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- FormalScheme.IsTypeS.of_isLocallyTFP: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- FormalScheme.IsTypeS.of_mem_FSC: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme); also Conrad's category FS_C
--   (AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base) [relation]
-- FormalScheme.IsTypeS.ofIsOpenImmersion: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- FormalScheme.IsTypeS.idealOfDefinition_fg: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsTypeS.completion: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsTypeS.spf_microbial: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [example]
-- FormalScheme.not_isTypeS_powerSeries_of_not_discrete: not stated here; needs formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [example]
-- typeS_test_admissible_not_noetherian: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation test]
-- typeS_test_powerSeries_nondiscrete: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- typeS_test_dvr_powerSeries: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- typeS_test_microbial: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- typeS_test_discrete: not stated here; needs formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]

/-! ## AdicSpacesPartII:R2/noetherian-formal-scheme-as-adic-space (construction) -/

-- FormalScheme.toAdicSpace: not stated here; needs locally noetherian formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [constructor]
-- FormalScheme.toAdicSpace_spf: not stated here; needs locally noetherian formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [simp]
-- FormalScheme.centerMap: not stated here; needs locally noetherian formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [projection]
-- FormalScheme.centerMap_spf_apply: not stated here; needs locally noetherian formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5). Ring-level core: `FormalScheme.centerMap_spf_apply_affine` [simp]
-- FormalScheme.toAdicSpace.lift: not stated here; needs locally noetherian formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [universal-property]
-- FormalScheme.toAdicSpace.lift_comp_centerMap: not stated here; needs locally noetherian formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [universal-property]
-- FormalScheme.toAdicSpace.map_id: not stated here; needs locally noetherian formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [functoriality]
-- FormalScheme.toAdicSpace.fullyFaithful: not stated here; needs locally noetherian formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [functoriality]
-- FormalScheme.toAdicSpace_isAdic_iff: not stated here; needs locally noetherian formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility]
-- FormalScheme.toAdicSpace_locallyOfFiniteType_iff: not stated here; needs locally noetherian
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [compatibility]
-- FormalScheme.trivialValuationSection: not stated here; needs locally noetherian formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [data]
-- toAdicSpace_test_spf_Zp: not stated here; needs locally noetherian formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [computation test]
-- toAdicSpace_test_ZpT: not stated here; needs locally noetherian formal schemes and adic spaces
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [computation test]
-- toAdicSpace_test_discrete: not stated here; needs locally noetherian formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [degenerate test]
-- toAdicSpace_test_notEssentiallySurjective: not stated here; needs locally noetherian formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [non-example test]
-- toAdicSpace_test_fullyFaithful: not stated here; needs locally noetherian formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [characterisation test]

namespace FormalScheme

open ValuationSpectrum

/-- R2/noetherian-formal-scheme-as-adic-space, ring-level core of
`FormalScheme.centerMap_spf_apply`: for a point `v` of `Spa(A, A)` of a Huber ring, the centre
`{a ∈ A : v(a) < 1}` is an open prime ideal of `A`; it is `π(v)` in `Spf A`. -/
theorem centerMap_spf_apply_affine {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [Huber.IsHuberRing A] (v : Spv A) (hv : v ∈ spa (⊤ : Subring A)) :
    ∃ P : PrimeSpectrum A, IsOpen (P.asIdeal : Set A) ∧
      ∀ a : A, a ∈ P.asIdeal ↔ ¬ v.toValuativeRel.vle 1 a := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/generic-fibre-functor-d (construction) -/

-- FormalScheme.genericFibre: not stated here; needs formal schemes of type (S) and adic spaces
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [constructor]
-- FormalScheme.genericFibre.lift: not stated here; needs formal schemes of type (S) and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [universal-property]
-- FormalScheme.genericFibre.lift_unique: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [universal-property]
-- FormalScheme.genericFibre.map: not stated here; needs formal schemes of type (S) and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [functoriality]
-- FormalScheme.genericFibre_spf_of_typeSb: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [simp]
-- FormalScheme.genericFibre_spf_of_isNoetherian: not stated here; needs formal schemes of type
--   (S) and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility]
-- FormalScheme.genericFibre_ofIsOpenImmersion: not stated here; needs formal schemes of type (S)
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility]
-- FormalScheme.genericFibre_torsionFreeQuotient: not stated here; needs formal schemes of type
--   (S) and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [simp]
-- FormalScheme.genericFibre_isAnalytic: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [instance]
-- FormalScheme.genericFibre_spectralSpace: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [instance]
-- FormalScheme.genericFibre_quasiCompact: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [other]
-- FormalScheme.genericFibre_spf_microbial: not stated here; needs formal schemes of type (S) and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [example]
-- genericFibre_test_formalAffineLine: not stated here; needs formal schemes of type (S) and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [computation test]
-- genericFibre_test_powerSeries_dvr: not stated here; needs formal schemes of type (S) and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [computation test]
-- genericFibre_test_torsion: not stated here; needs formal schemes of type (S) and adic spaces
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [degenerate test]
-- genericFibre_test_plusRing: not stated here; needs formal schemes of type (S) and adic spaces
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [non-example test]
-- genericFibre_test_noetherian: not stated here; needs formal schemes of type (S) and adic spaces
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [compatibility test]

/-! ## AdicSpacesPartII:R2/raynaud-generic-fibre (comparison) -/

-- FormalScheme.genericFibreIsoRigid: not stated here; needs formal schemes, adic spaces and
--   rigid analytic spaces with Huber's functor r (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5,
--   AdicSpacesPartII:R1/rigid-analytic-space). Its affine core (i) is
--   `Huber.IsTopologicallyFinitePresentation.integralClosure_eq_powerBoundedSubring`.

namespace Huber

/-- R2/raynaud-generic-fibre (i), ring-level core: for tfp `A`, the integral closure of the image
of `A` in `A_K = A[1/ϖ]` is the power-bounded subring `A_K°`, so
`d(Spf A) = Spa(A_K, A_K°)`. -/
theorem IsTopologicallyFinitePresentation.integralClosure_eq_powerBoundedSubring {O : Type*}
    [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O]
    {ϖ : O} [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A] [Algebra O A]
    (hA : IsTopologicallyFinitePresentation O A) :
    letI := hA.genericFibre ϖ
    letI := hA.nonarchimedeanRing_genericFibre ϖ
    (integralClosure (algebraMap A (Localization.Away (algebraMap O A ϖ))).range
        (Localization.Away (algebraMap O A ϖ))).toSubring =
      powerBoundedSubring (Localization.Away (algebraMap O A ϖ)) := sorry

end Huber

/-! ## AdicSpacesPartII:R2/generic-fibre-fibre-products (lemma) -/

-- FormalScheme.genericFibre_pullback: not stated here; needs formal schemes, their fibre products
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/specialisation-map (construction) -/

-- FormalScheme.specialisation: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [data]
-- FormalScheme.specialisation_spf_apply: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5). Ring-level core:
--   `FormalScheme.specialisation_spf_apply_affine` [simp]
-- FormalScheme.specialisation_eq_center: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5). Ring-level core:
--   `FormalScheme.specialisation_spf_apply_affine` [characterisation]
-- FormalScheme.continuous_specialisation: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [other]
-- FormalScheme.specialisation_preimage_basicOpen: not stated here; needs the generic fibre d(X),
--   i.e. formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5). Ring-level core:
--   `FormalScheme.specialisation_preimage_basicOpen_affine` [characterisation]
-- FormalScheme.specialisation_naturality: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [functoriality]
-- FormalScheme.specialisation_classical_isClosed: not stated here; needs the generic fibre d(X),
--   i.e. formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [relation]
-- FormalScheme.exists_classical_specialisation_eq: not stated here; needs the generic fibre d(X),
--   i.e. formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [relation]
-- FormalScheme.specialisation_blowUp: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility]
-- FormalScheme.rigidSpecialisation: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5); also rigid analytic spaces (AdicSpacesPartII:R1/rigid-analytic-space)
--   [compatibility]
-- FormalScheme.specialisationLimitHomeomorph: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [equivalence]
-- specialisation_test_closedDisc: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [computation test]
-- specialisation_test_Spf_OK: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [degenerate test]
-- specialisation_test_preimage_closed: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [non-example test]
-- specialisation_test_blowUp: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility test]
-- specialisation_test_surjective_closed: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation
--   test]

namespace FormalScheme

open ValuationSpectrum

/-- R2/specialisation-map, ring-level core of `FormalScheme.specialisation_spf_apply` and
`FormalScheme.specialisation_eq_center`: for `φ : A → B` with `φ(A) ⊆ B⁺` and `v ∈ Spa(B, B⁺)`
(for `d(Spf A)`: `B = A(1/s)` and `B⁺` the integral closure of `A`), `λ(v) = {a ∈ A : v(φ a) < 1}`
is a prime ideal of `A`. -/
theorem specialisation_spf_apply_affine {A B : Type*} [CommRing A] [CommRing B]
    [TopologicalSpace B] (φ : A →+* B) (Bplus : Subring B) (hφ : ∀ a, φ a ∈ Bplus) (v : Spv B)
    (hv : v ∈ spa Bplus) :
    ∃ P : PrimeSpectrum A, ∀ a : A, a ∈ P.asIdeal ↔ ¬ v.toValuativeRel.vle 1 (φ a) := sorry

/-- R2/specialisation-map, ring-level core of `FormalScheme.specialisation_preimage_basicOpen`:
`λ⁻¹(D(s)) = {v : |s(v)| ≥ 1}` is the rational subset `R(1/s)`. -/
theorem specialisation_preimage_basicOpen_affine {B : Type*} [CommRing B] [TopologicalSpace B]
    (Bplus : Subring B) (s : B) :
    {v : Spv B | v.toValuativeRel.vle 1 s} ∩ spa Bplus = rationalSubset Bplus {1} s := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/tube (construction) -/

-- FormalScheme.tube: not stated here; needs the generic fibre d(X), i.e. formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [constructor]
-- FormalScheme.tube_of_isOpen: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [simp]
-- FormalScheme.tube_spf_of_isClosed: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5). Ring-level core: a union over m of ValuationSpectrum.fracPowLE sets
--   [characterisation]
-- FormalScheme.tube_eq_interior_preimage: not stated here; needs the generic fibre d(X), i.e.
--   formal schemes and adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation]
-- FormalScheme.isOpen_tube: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [other]
-- FormalScheme.tube_inter: not stated here; needs the generic fibre d(X), i.e. formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [relation]
-- FormalScheme.tube_preimage: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [functoriality]
-- FormalScheme.tube_classicalPoints: not stated here; needs the generic fibre d(X), i.e. formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5); also rigid analytic spaces (AdicSpacesPartII:R1/rigid-analytic-space)
--   [compatibility]
-- FormalScheme.closedTube: not stated here; needs the generic fibre d(X), i.e. formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.tube_blowUp: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility]
-- tube_test_origin_disc: not stated here; needs the generic fibre d(X), i.e. formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [computation test]
-- tube_test_preimage_not_open: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [non-example test]
-- tube_test_classical: not stated here; needs the generic fibre d(X), i.e. formal schemes and
--   adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility test]
-- tube_test_open_complement: not stated here; needs the generic fibre d(X), i.e. formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [characterisation test]
-- tube_test_whole: not stated here; needs the generic fibre d(X), i.e. formal schemes and adic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [degenerate test]

/-! ## AdicSpacesPartII:R2/rig-point (definition) -/

-- FormalScheme.RigPoint: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.RigPoint.residueField: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.RigPoint.integralClosure_eq_valuationRing: not stated here; needs admissible
--   formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level
--   core: `FormalScheme.RigPoint.integralClosure_eq_valuationRing_affine` [characterisation]
-- FormalScheme.RigPoint.map: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.RigPoint.equivOfBlowUp: not stated here; needs admissible formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [equivalence]
-- FormalScheme.RigPoint.equivMaxSpec: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core:
--   `FormalScheme.RigPoint.equivMaxSpec_affine` [equivalence]
-- FormalScheme.RigPoint.exists_of_isClosedPoint: not stated here; needs admissible formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.RigPoint.equivClassicalPoints: not stated here; needs admissible formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.RigPoint.specialPoint: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [projection]
-- rigPoint_test_disc: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- rigPoint_test_notDim1: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- rigPoint_test_blowUp: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- rigPoint_test_base: not stated here; needs admissible formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]

namespace FormalScheme

open Huber

/-- R2/rig-point, ring-level core of `FormalScheme.RigPoint.equivMaxSpec`: for tfp `A`, the primes
`𝔭` with `ϖ ∉ 𝔭` and `dim A ⧸ 𝔭 = 1` correspond to the maximal ideals of `A_K = A[1/ϖ]`. -/
def RigPoint.equivMaxSpec_affine {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O]
    [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O} [IsCompleteRankOneBase O ϖ] {A : Type*}
    [CommRing A] [Algebra O A] (hA : IsTopologicallyFinitePresentation O A) :
    {P : PrimeSpectrum A // algebraMap O A ϖ ∉ P.asIdeal ∧ ringKrullDim (A ⧸ P.asIdeal) = 1} ≃
      MaximalSpectrum (Localization.Away (algebraMap O A ϖ)) := sorry

/-- R2/rig-point, ring-level core of `FormalScheme.RigPoint.integralClosure_eq_valuationRing`:
for an admissible local domain `B` of dimension one, `B` is finite over `O` and its integral
closure in `Frac B` is a valuation ring. -/
theorem RigPoint.integralClosure_eq_valuationRing_affine {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {B : Type*} [CommRing B] [IsDomain B] [IsLocalRing B]
    [Algebra O B] (hB : IsAdmissibleAlgebra ϖ B) (hdim : ringKrullDim B = 1) :
    ValuationRing (integralClosure B (FractionRing B)) ∧ Module.Finite O B := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/admissible-blow-up (construction) -/

-- FormalScheme.admissibleBlowUp: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [constructor]
-- FormalScheme.admissibleBlowUp.π: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [projection]
-- FormalScheme.admissibleBlowUp.isAdmissible: not stated here; needs admissible formal schemes
--   and their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [instance]
-- FormalScheme.admissibleBlowUp.isInvertible: not stated here; needs admissible formal schemes
--   and their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [other]
-- FormalScheme.admissibleBlowUp.lift: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [universal-property]
-- FormalScheme.admissibleBlowUp.lift_comp_π: not stated here; needs admissible formal schemes and
--   their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [universal-property]
-- FormalScheme.admissibleBlowUp.chart: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level
--   core: `Huber.IsTopologicallyFinitePresentation.quotient` [data]
-- FormalScheme.admissibleBlowUp.isIso_of_disjoint: not stated here; needs admissible formal
--   schemes and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.admissibleBlowUp.baseChange: not stated here; needs admissible formal schemes and
--   their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [compatibility]
-- FormalScheme.admissibleBlowUp.isProper_surjective_specialFibre: not stated here; needs
--   admissible formal schemes and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.admissibleBlowUp.mul: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.admissibleBlowUp.comp: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.admissibleBlowUp.extend: not stated here; needs admissible formal schemes and
--   their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [other]
-- FormalScheme.admissibleBlowUp.dominate: not stated here; needs admissible formal schemes and
--   their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [relation]
-- FormalScheme.strictTransform: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [constructor]
-- FormalScheme.strictTransformBaseChange: not stated here; needs admissible formal schemes, their
--   fibre products and coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme; `FormalScheme.CoherentModule` is
--   node R2/admissible-formal-scheme). The strict transform of Raynaud–Gruson I 5.1.1(ii), the
--   pull-back modulo its sections killed by a power of `𝒜`, used by the flattening theorem
--   (node R2/module-flattening-by-blow-up) [constructor]
-- FormalScheme.strictTransformBaseChange_comp: not stated here; needs admissible formal schemes
--   and their coherent modules (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme);
--   Raynaud–Gruson I 5.3.2 [relation]
-- FormalScheme.admissibleBlowUp.comp_of_disjoint: not stated here; needs admissible formal schemes
--   and their coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme);
--   Raynaud–Gruson I 5.1.4 (`U`-admissible blow-ups) [relation]
-- admissibleBlowUp_test_disc_origin: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation
--   test]
-- admissibleBlowUp_test_unit: not stated here; needs admissible formal schemes and their coherent
--   ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- admissibleBlowUp_test_nonOpenCentre: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example
--   test]
-- admissibleBlowUp_test_universal: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [characterisation test]
-- admissibleBlowUp_test_scheme: not stated here; needs admissible formal schemes and their
--   coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [compatibility test]
-- strictTransform_test_annulus: not stated here; needs admissible formal schemes, their
--   admissible blow-ups and strict transforms (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]

/-! ## AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups (lemma) -/

-- FormalScheme.isIso_genericFibre_admissibleBlowUp: not stated here; needs admissible formal
--   schemes and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5). Its affine input is the standard rational cover
--   `TauCeti.ValuationSpectrum.spa_eq_biUnion_rationalSubset_of_span_eq_top`.

/-! ## AdicSpacesPartII:R2/bounded-functions-blow-up (lemma) -/

-- FormalScheme.admissibleBlowUp_of_adjoin_powerBounded: not stated here; needs admissible formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Its ring-level
--   part is `Huber.IsAdmissibleAlgebra.adjoin_powerBounded`.

namespace Huber

/-- R2/bounded-functions-blow-up, ring-level part: adjoining finitely many power-bounded elements
`f₁, …, f_n ∈ A_K°` to an admissible `A` gives an admissible `O`-algebra `B = A[f₁, …, f_n]`,
finite over `A`. -/
theorem IsAdmissibleAlgebra.adjoin_powerBounded {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A] [Algebra O A]
    (hA : IsAdmissibleAlgebra ϖ A) (s : Finset (Localization.Away (algebraMap O A ϖ)))
    (hs : letI := hA.1.genericFibre ϖ
      letI := hA.1.nonarchimedeanRing_genericFibre ϖ
      ∀ x ∈ s, x ∈ powerBoundedSubring (Localization.Away (algebraMap O A ϖ))) :
    Module.Finite A (Algebra.adjoin A (s : Set (Localization.Away (algebraMap O A ϖ)))) ∧
      IsAdmissibleAlgebra ϖ (Algebra.adjoin A (s : Set (Localization.Away (algebraMap O A ϖ)))) :=
  sorry

end Huber

/-! ## AdicSpacesPartII:R2/quasi-compact-opens-from-blow-ups (lemma) -/

-- FormalScheme.exists_admissibleBlowUp_opens: not stated here; needs admissible formal schemes
--   and adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/affinoid-admissible-model (lemma) -/

namespace Huber

/-- R2/affinoid-admissible-model, ring-level part: for an ideal `b` of the Tate algebra
`K⟨ξ⟩ = O⟨ξ⟩[1/ϖ]`, the algebra `O⟨ξ⟩ ⧸ (b ∩ O⟨ξ⟩)` is admissible and maps injectively to
`K⟨ξ⟩ ⧸ b`. The identification `d(Spf A) = Spa(B, B°)` needs adic spaces. -/
theorem isAdmissibleAlgebra_quotient_comap {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {n : ℕ}
    (b : Ideal (Localization.Away (algebraMap O (restrictedMvPowerSeriesCompletion n O) ϖ))) :
    IsAdmissibleAlgebra ϖ (restrictedMvPowerSeriesCompletion n O ⧸
        b.comap (algebraMap (restrictedMvPowerSeriesCompletion n O)
          (Localization.Away (algebraMap O (restrictedMvPowerSeriesCompletion n O) ϖ)))) ∧
      Function.Injective (Ideal.quotientMap b (algebraMap (restrictedMvPowerSeriesCompletion n O)
          (Localization.Away (algebraMap O (restrictedMvPowerSeriesCompletion n O) ϖ))) le_rfl) :=
  sorry

end Huber

/-! ## AdicSpacesPartII:R2/raynaud-theorem (theorem) -/

-- FormalScheme.raynaud: not stated here; needs quasi-compact admissible formal schemes with the
--   class of admissible blow-ups, and quasi-compact quasi-separated adic spaces locally of finite
--   type over Spa(K, O_K) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/formal-model-separatedness (lemma) -/

-- FormalScheme.isSeparated_iff_genericFibre: not stated here; needs admissible formal schemes and
--   separated morphisms of adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/formal-rigid-properness-comparison (comparison) -/

-- FormalScheme.isProper_iff_genericFibre: not stated here; needs admissible formal schemes and
--   proper morphisms of adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/topological-generation-mod-definition-ideal (lemma)

Conventions of the flattening nodes, from R2/topological-generation-mod-definition-ideal to
R2/strict-transform-generically-torsion-quotient (Bosch–Lütkebohmert II, Raynaud–Gruson I).
Formal schemes are formal `O_K`-schemes locally of tf presentation (node
R2/admissible-formal-scheme), `X_λ = X ⊗ O_K/ϖ^{λ+1}`, and `X_0` has the underlying space of `X`;
neither library has them, nor their coherent modules, stalks, rig-points or admissible blow-ups,
so every statement about them is a comment. Where a node's affine case is a statement about
rings and modules, it is stated with explicit hypotheses: a smooth formal morphism
`Spf B → Spf A` whose reduction has geometrically irreducible fibres of dimension `m` is
`FormalScheme.IsSmoothGeomIrredAffine (algebraMap O A ϖ) m` (node
R2/smooth-geometrically-irreducible-topological-basis), and the ring-level Fitting ideal is
`Module.fittingIdeal` (node R2/formal-fitting-ideal). The statements of Raynaud–Gruson about
schemes use Mathlib's schemes.
-/

open scoped TensorProduct

-- FormalScheme.topologicallyGenerates_of_generates_mod: not stated here; needs coherent modules
--   on formal schemes locally of tf presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Its affine form is
--   `FormalScheme.surjective_adicCompletion_linearCombination_of_mod`.

namespace FormalScheme

/-- R2/topological-generation-mod-definition-ideal, affine form (Bosch–Lütkebohmert II
Lemma 1.3(a)): if `M` is `ϖ`-adically complete and separated and the family `e : E → M`, possibly
infinite, generates `M` modulo `ϖM`, then `e` generates `M` topologically: the map from the
`ϖ`-adic completion of the free module `A^{(E)}` to `M̂ = M` is surjective, that is every `m ∈ M`
is a convergent sum `Σ aₑ e` with `aₑ → 0`. -/
theorem surjective_adicCompletion_linearCombination_of_mod {A M E : Type*} [CommRing A]
    [AddCommGroup M] [Module A M] (ϖ : A) [IsAdicComplete (Ideal.span {ϖ}) M] (e : E → M)
    (he : Submodule.span A (Set.range e) ⊔ Ideal.span {ϖ} • (⊤ : Submodule A M) = ⊤) :
    Function.Surjective (AdicCompletion.map (Ideal.span {ϖ}) (Finsupp.linearCombination A e)) :=
  sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/topological-basis-lifting (lemma) -/

-- FormalScheme.isTopologicalBasis_of_basis_mod: not stated here; needs coherent modules on formal
--   schemes locally of tf presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Its affine form is
--   `FormalScheme.bijective_adicCompletion_linearCombination_of_basis_mod`.

namespace FormalScheme

/-- R2/topological-basis-lifting, affine form (Bosch–Lütkebohmert II Lemma 1.3(b)): if moreover
`M` is flat over the `ϖ`-adically complete ring `A` and the images of `e` form a basis of
`M ⧸ ϖM` over `A ⧸ ϖ`, then `e` is a topological basis: the map `Â^{(E)} → M̂ = M` is
bijective, so every `m ∈ M` has a unique expansion `Σ aₑ e` with `aₑ → 0`. -/
theorem bijective_adicCompletion_linearCombination_of_basis_mod {A M E : Type*} [CommRing A]
    [AddCommGroup M] [Module A M] (ϖ : A) [IsAdicComplete (Ideal.span {ϖ}) A]
    [IsAdicComplete (Ideal.span {ϖ}) M] [Module.Flat A M] (e : E → M)
    (hli : LinearIndependent (A ⧸ Ideal.span {ϖ})
      (fun i ↦ Submodule.Quotient.mk (e i) : E → M ⧸ Ideal.span {ϖ} • (⊤ : Submodule A M)))
    (he : Submodule.span A (Set.range e) ⊔ Ideal.span {ϖ} • (⊤ : Submodule A M) = ⊤) :
    Function.Bijective (AdicCompletion.map (Ideal.span {ϖ}) (Finsupp.linearCombination A e)) :=
  sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/smooth-lifting-from-level-zero (lemma) -/

-- FormalScheme.exists_smooth_lift: not stated here; needs formal schemes locally of tf
--   presentation and smooth formal morphisms (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Its algebraic core is `FormalScheme.exists_smooth_lift_algebraic`; the formal lift is the
--   `ϖ`-adic completion of the algebraic one.

namespace FormalScheme

universe u in
/-- R2/smooth-lifting-from-level-zero, algebraic core (Bosch–Lütkebohmert II Lemma 1.4(a)): a
standard smooth `A ⧸ I`-algebra of relative dimension `r` (locally, every smooth algebra is one)
is the reduction of a standard smooth `A`-algebra of relative dimension `r`: lift the equations
`f̄ᵢ` and localise at a lift of the Jacobian minor. -/
theorem exists_smooth_lift_algebraic {A : Type u} [CommRing A] (I : Ideal A) (r : ℕ)
    (B₀ : Type u) [CommRing B₀] [Algebra (A ⧸ I) B₀]
    [Algebra.IsStandardSmoothOfRelativeDimension r (A ⧸ I) B₀] :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra A B),
      Algebra.IsStandardSmoothOfRelativeDimension r A B ∧
        Nonempty ((A ⧸ I) ⊗[A] B ≃ₐ[A ⧸ I] B₀) := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/smooth-lifting-of-diagrams (lemma) -/

-- FormalScheme.exists_lift_through_smooth: not stated here; needs formal schemes locally of tf
--   presentation and smooth formal morphisms (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Affine input: the existence of the lift `g` is Mathlib's
--   `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` (for the smooth algebraic model
--   of the lift and `C` complete for `ϖC`); uniqueness in the étale case is
--   `FormalScheme.exists_unique_lift_through_etale_affine`.

namespace FormalScheme

/-- R2/smooth-lifting-of-diagrams, affine form of the étale case (Bosch–Lütkebohmert II
Lemma 1.4(b)): for `P` formally étale over `A` and `C` an `I`-adically complete `A`-algebra,
every `A`-algebra map `P → C ⧸ I` lifts uniquely to `P → C`. -/
theorem exists_unique_lift_through_etale_affine {A P C : Type*} [CommRing A] [CommRing P]
    [CommRing C] [Algebra A P] [Algebra A C] [Algebra.FormallyEtale A P] (I : Ideal C)
    [IsAdicComplete I C] (g₀ : P →ₐ[A] C ⧸ I) :
    ∃! g : P →ₐ[A] C, (Ideal.Quotient.mkₐ A I).comp g = g₀ := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/formal-stalk-generization-flat (lemma) -/

-- FormalScheme.flat_stalkSpecializes: not stated here; needs formal schemes locally of tf
--   presentation and their stalks (colimits of `Γ(U, O_X)` without completion) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Affine input: the flatness of
--   `A → A⟨f⁻¹⟩`, `Huber.IsTopologicallyFinitePresentation.flat_completeLocalization`
--   (node R2/tfp-locality).

/-! ## AdicSpacesPartII:R2/rg-etale-neighbourhood-irreducible (lemma) -/

namespace AlgebraicGeometry

open _root_.AlgebraicGeometry CategoryTheory CategoryTheory.Limits

universe u

/-- R2/rg-etale-neighbourhood-irreducible (Raynaud–Gruson I, Lemme 1.1.2): let `Z` be a
geometrically normal `k`-scheme of finite type and `z ∈ Z` a point whose closure is geometrically
irreducible (its preimage in every base change `Z ×_k K` is irreducible). A connected elementary
étale neighbourhood `(T, t) → (Z, z)` (étale, `u t = z`, `k(z) → k(t)` bijective) is geometrically
irreducible over `k`. Geometric normality is written out with Mathlib's `geometrically`: every
base change to a field has integrally closed local domains as stalks. -/
theorem geometricallyIrreducible_of_elementaryEtale {k : Type u} [Field k] {Z T : Scheme.{u}}
    (hZ : Z ⟶ Spec (.of k)) [LocallyOfFiniteType hZ] [QuasiCompact hZ]
    (hnorm : geometrically (fun W : Scheme.{u} ↦ ∀ w : W,
      IsDomain (W.presheaf.stalk w) ∧ IsIntegrallyClosed (W.presheaf.stalk w)) hZ)
    (z : Z)
    (hcl : ∀ ⦃K : Type u⦄ [Field K] (y : Spec (.of K) ⟶ Spec (.of k)) ⦃W : Scheme.{u}⦄
      (fst : W ⟶ Z) (snd : W ⟶ Spec (.of K)), IsPullback fst snd hZ y →
        IsIrreducible (fst ⁻¹' closure {z}))
    (u : T ⟶ Z) [Etale u] [ConnectedSpace T] (t : T) (ht : u t = z)
    (hres : Function.Bijective (u.residueFieldMap t).hom) :
    GeometricallyIrreducible (u ≫ hZ) := sorry

/-! ## AdicSpacesPartII:R2/rg-geometrically-integral-fibres-etale-locally (lemma) -/

/-- R2/rg-geometrically-integral-fibres-etale-locally (Raynaud–Gruson I, Lemme 1.1.3): if
`p : T → S` is smooth and the fibre `T ⊗ k(s)` is geometrically integral of dimension `n`, there
are an elementary étale neighbourhood `(S', s') → (S, s)` and an open `U' ⊆ T ×_S S'` containing
the fibre over `s'` all of whose fibres over `S'` are geometrically integral (in particular
nonempty) of dimension `n`. -/
theorem exists_elementaryEtale_geometricallyIntegral_fibres {S T : Scheme.{u}} (p : T ⟶ S)
    [Smooth p] (s : S) [GeometricallyIntegral (p.fiberToSpecResidueField s)] (n : ℕ)
    (hn : topologicalKrullDim (p.fiber s) = n) :
    ∃ (S' : Scheme.{u}) (v : S' ⟶ S) (s' : S'), Etale v ∧ v s' = s ∧
      Function.Bijective (v.residueFieldMap s').hom ∧
      ∃ U : (pullback p v).Opens, (pullback.snd p v) ⁻¹' {s'} ⊆ U ∧
        ∀ y : S', GeometricallyIntegral ((U.ι ≫ pullback.snd p v).fiberToSpecResidueField y) ∧
          topologicalKrullDim ((U.ι ≫ pullback.snd p v).fiber y) = n := sorry

/-! ## AdicSpacesPartII:R2/rg-zariski-local-structure (theorem) -/

/-- R2/rg-zariski-local-structure (Raynaud–Gruson I, Théorème 1.1.1; no noetherian hypothesis):
for `f : X → S` locally of finite type, `x ∈ X` and `n = dim_x(X ⊗ k(f x))` (the infimum of the
dimensions of the open neighbourhoods of `x` in the fibre), there are affine `Y`, `T`, `S'`,
elementary étale neighbourhoods `(Y, y) → (X, x)` and `(S', h (g y)) → (S, f x)`, a smooth
`h : T → S'` of relative dimension `n` with geometrically integral fibres, and a finite
`g : Y → T` with `y` the only point over `g y`, such that the square commutes. -/
theorem exists_localStructure {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFiniteType f] (x : X)
    (n : ℕ)
    (hn : ⨅ (U : (f.fiber (f x)).Opens) (_ : f.asFiber x ∈ U), topologicalKrullDim U = n) :
    ∃ (Y T S' : Scheme.{u}) (u : Y ⟶ X) (g : Y ⟶ T) (h : T ⟶ S') (v : S' ⟶ S) (y : Y),
      IsAffine Y ∧ IsAffine T ∧ IsAffine S' ∧
      Etale u ∧ u y = x ∧ Function.Bijective (u.residueFieldMap y).hom ∧
      Etale v ∧ v (h (g y)) = f x ∧ Function.Bijective (v.residueFieldMap (h (g y))).hom ∧
      SmoothOfRelativeDimension n h ∧ GeometricallyIntegral h ∧
      IsFinite g ∧ g ⁻¹' {g y} = {y} ∧ g ≫ h ≫ v = u ≫ f := sorry

end AlgebraicGeometry

/-! ## AdicSpacesPartII:R2/formal-zariski-local-structure (theorem) -/

-- FormalScheme.exists_localStructure: not stated here; needs formal schemes locally of tf
--   presentation, their étale, finite and smooth morphisms and elementary étale neighbourhoods
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). The special fibre is
--   `AlgebraicGeometry.exists_localStructure` (node R2/rg-zariski-local-structure), lifted by
--   nodes R2/smooth-lifting-from-level-zero and R2/smooth-lifting-of-diagrams.

/-! ## AdicSpacesPartII:R2/rg-smooth-geometrically-integral-projective (lemma) -/

open _root_.AlgebraicGeometry CategoryTheory in
universe u in
/-- R2/rg-smooth-geometrically-integral-projective (Raynaud–Gruson I, Proposition 3.3.1): a smooth
`A`-algebra `B` all of whose fibres `B ⊗_A k(𝔭)` are geometrically integral (in particular
nonempty) is a projective `A`-module; `A` is arbitrary. -/
theorem Module.projective_of_smooth_of_geometricallyIntegral {A B : Type u} [CommRing A]
    [CommRing B] [Algebra A B] [Algebra.Smooth A B]
    [GeometricallyIntegral (Spec.map (CommRingCat.ofHom (algebraMap A B)))] :
    Module.Projective A B := sorry

/-! ## AdicSpacesPartII:R2/smooth-geometrically-irreducible-topological-basis (lemma) -/

-- FormalScheme.exists_topologicalBasis: not stated here; needs formal schemes locally of tf
--   presentation, smooth formal morphisms and completed localisations of `Spf A` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Affine inputs: `Module.projective_of_smooth_of_geometricallyIntegral` modulo `ϖ` (node
--   R2/rg-smooth-geometrically-integral-projective) and
--   `FormalScheme.bijective_adicCompletion_linearCombination_of_basis_mod` (node
--   R2/topological-basis-lifting).

namespace FormalScheme

open _root_.AlgebraicGeometry CategoryTheory

universe u in
/-- R2/smooth-geometrically-irreducible-topological-basis, affine form of the standing hypothesis
of Bosch–Lütkebohmert II §2–§4: `Spf B → Spf A` is smooth (every reduction
`A ⧸ ϖ^{m+1} → B ⧸ ϖ^{m+1}B` is smooth) and its reduction `Spec B₀ → Spec A₀` is smooth of
relative dimension `n` with geometrically irreducible fibres; in particular it is surjective. -/
def IsSmoothGeomIrredAffine {A B : Type u} [CommRing A] [CommRing B] [Algebra A B] (ϖ : A)
    (n : ℕ) : Prop :=
  (∀ m : ℕ, Algebra.Smooth (A ⧸ Ideal.span {ϖ ^ (m + 1)})
      (B ⧸ (Ideal.span {ϖ ^ (m + 1)}).map (algebraMap A B))) ∧
    SmoothOfRelativeDimension n (Spec.map (CommRingCat.ofHom
      (algebraMap (A ⧸ Ideal.span {ϖ}) (B ⧸ (Ideal.span {ϖ}).map (algebraMap A B))))) ∧
    GeometricallyIrreducible (Spec.map (CommRingCat.ofHom
      (algebraMap (A ⧸ Ideal.span {ϖ}) (B ⧸ (Ideal.span {ϖ}).map (algebraMap A B)))))

end FormalScheme

/-! ## AdicSpacesPartII:R2/ideal-of-coefficients (definition)

The notion is for coherent ideals on formal schemes locally of tf presentation. Its algebraic
analogue for `Spec B → Spec A`, in which conditions (i) and (ii) of Bosch–Lütkebohmert II
Definition 2.1 quantify over all ring maps `A → A'`, is
`FormalScheme.IsIdealOfCoefficients_algebraic`; the formal notion quantifies over formal schemes
locally of tf presentation, with completed base changes. -/

-- FormalScheme.IsIdealOfCoefficients: not stated here; needs formal schemes locally of tf
--   presentation and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Algebraic analogue:
--   `FormalScheme.IsIdealOfCoefficients_algebraic` [structure]
-- FormalScheme.IsIdealOfCoefficients.unique: not stated here; needs formal schemes locally of tf
--   presentation and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [extensionality]
-- FormalScheme.IsIdealOfCoefficients.le_map: not stated here; needs formal schemes locally of tf
--   presentation and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation]
-- FormalScheme.IsIdealOfCoefficients.baseChange: not stated here; needs formal schemes locally of
--   tf presentation, their fibre products and coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.IsIdealOfCoefficients.restrict: not stated here; needs formal schemes locally of
--   tf presentation and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.IsIdealOfCoefficients.glue: not stated here; needs formal schemes locally of tf
--   presentation and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsIdealOfCoefficients.mem_zeroLocus_iff: not stated here; needs formal schemes
--   locally of tf presentation, their fibres and rig-points (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/rig-point)
--   [characterisation]
-- FormalScheme.IsIdealOfCoefficients.isOpen: not stated here; needs formal schemes locally of tf
--   presentation and their open coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.isIdealOfCoefficients_of_topologicalBasis: not stated here; needs formal schemes
--   and topological bases (node R2/topological-basis-lifting) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Algebraic core, for a basis:
--   `FormalScheme.isIdealOfCoefficients_of_topologicalBasis_algebraic` [constructor]
-- FormalScheme.content: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Algebraic core:
--   `FormalScheme.content_algebraic` [data]
-- FormalScheme.content_polynomial: not stated here; needs `FormalScheme.content` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Algebraic core:
--   `FormalScheme.content_polynomial_algebraic` [example]

namespace FormalScheme

universe u v in
/-- R2/ideal-of-coefficients, algebraic analogue of Bosch–Lütkebohmert II Definition 2.1 for
`Spec B → Spec A`: `c ⊆ A` is an ideal of coefficients of `J ⊆ B` if for every base change
`A → A'` and every ideal `c' ⊆ A'`, `J (A' ⊗_A B) ⊆ c' (A' ⊗_A B)` iff `c A' ⊆ c'`. With
`A' = A` this says `J ⊆ cB` and `c` is the smallest such ideal; the quantifier over `A'` is
condition (ii) and the compatibility with base change. -/
def IsIdealOfCoefficients_algebraic {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    [Algebra A B] (J : Ideal B) (c : Ideal A) : Prop :=
  ∀ (A' : Type u) [CommRing A'] [Algebra A A'] (c' : Ideal A'),
    J.map (Algebra.TensorProduct.includeRight : B →ₐ[A] A' ⊗[A] B) ≤
        c'.map (Algebra.TensorProduct.includeLeft : A' →ₐ[A] A' ⊗[A] B) ↔
      c.map (algebraMap A A') ≤ c'

/-- R2/ideal-of-coefficients, algebraic core of `FormalScheme.content`: the smallest ideal
`c ⊆ A` with `f ∈ cB` (the infimum; it has this property when `B` is free over `A`). -/
def content_algebraic {A B : Type*} [CommRing A] [CommRing B] [Algebra A B] (f : B) : Ideal A :=
  sInf {c : Ideal A | f ∈ c.map (algebraMap A B)}

/-- R2/ideal-of-coefficients, algebraic core of
`FormalScheme.isIdealOfCoefficients_of_topologicalBasis`: if `B` is free over `A` with basis `e`,
the ideal generated by the coordinates `e.repr f i` of the elements `f ∈ J` is an ideal of
coefficients of `J`. -/
theorem isIdealOfCoefficients_of_topologicalBasis_algebraic {A B E : Type*} [CommRing A]
    [CommRing B] [Algebra A B] (e : Module.Basis E A B) (J : Ideal B) :
    IsIdealOfCoefficients_algebraic J (Ideal.span {a | ∃ f ∈ J, ∃ i, a = e.repr f i}) := sorry

/-- R2/ideal-of-coefficients, algebraic core of `FormalScheme.content_polynomial`: the content of
a polynomial `f = Σ aᵢ ξ^i ∈ A[ξ]` is Mathlib's `Polynomial.contentIdeal`, `(a₀, …, a_n)`. -/
theorem content_polynomial_algebraic {A : Type*} [CommRing A] (f : Polynomial A) :
    content_algebraic f = f.contentIdeal := sorry

end FormalScheme

-- idealOfCoefficients_test_polynomial: not stated here; needs `FormalScheme.content` on
--   `Spf O_K⟨ξ⟩ → Spf O_K` (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [computation test]. Its algebraic core, the content of `ϖ² + ϖξ + ϖ³ξ²` in `O[ξ]`, is the
--   example below.
-- idealOfCoefficients_test_unit: not stated here; needs formal schemes and their coherent ideals
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]. Its
--   algebraic core is the example below.
-- idealOfCoefficients_test_baseChange: not stated here; needs formal schemes, their fibre
--   products and coherent ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [compatibility test]
-- idealOfCoefficients_test_notZeroLocus: not stated here; needs formal schemes and their coherent
--   ideals (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test].
--   Its algebraic core, for `A = O[a]` and `B = A[ζ]`, is the example below.

-- test idealOfCoefficients_test_polynomial_core (computation) [R2/ideal-of-coefficients]
example {O : Type*} [CommRing O] (ϖ : O) :
    FormalScheme.content_algebraic (A := O) (Polynomial.C (ϖ ^ 2) + Polynomial.C ϖ * Polynomial.X +
      Polynomial.C (ϖ ^ 3) * Polynomial.X ^ 2) = Ideal.span {ϖ} := sorry

-- test idealOfCoefficients_test_unit_core (degenerate) [R2/ideal-of-coefficients]
universe u in
example {A B : Type u} [CommRing A] [CommRing B] [Algebra A B] :
    (Function.Surjective (PrimeSpectrum.comap (algebraMap A B)) →
      FormalScheme.IsIdealOfCoefficients_algebraic (⊤ : Ideal B) (⊤ : Ideal A)) ∧
    (Module.FaithfullyFlat A B → ∀ a : Ideal A,
      FormalScheme.IsIdealOfCoefficients_algebraic (a.map (algebraMap A B)) a) := sorry

-- test idealOfCoefficients_test_notZeroLocus_core (non-example) [R2/ideal-of-coefficients]
example {O : Type*} [CommRing O] (ϖ : O) (hϖ : ¬ IsUnit ϖ) :
    let a : Polynomial O := Polynomial.X
    let ζ : Polynomial (Polynomial O) := Polynomial.X
    let J : Ideal (Polynomial (Polynomial O)) :=
      Ideal.span {Polynomial.C (a ^ 2) * ζ, Polynomial.C (Polynomial.C ϖ)}
    FormalScheme.IsIdealOfCoefficients_algebraic J (Ideal.span {a ^ 2, Polynomial.C ϖ}) ∧
      ¬ FormalScheme.IsIdealOfCoefficients_algebraic J (Ideal.span {a, Polynomial.C ϖ}) ∧
      (Ideal.span {a ^ 2, Polynomial.C ϖ}).radical = (Ideal.span {a, Polynomial.C ϖ}).radical :=
  sorry

/-! ## AdicSpacesPartII:R2/ideal-of-coefficients-existence (lemma) -/

-- FormalScheme.exists_isIdealOfCoefficients_of_isOpen: not stated here; needs formal schemes
--   locally of tf presentation, smooth formal morphisms and open coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Algebraic core of part (b): `FormalScheme.content_isPrincipal_algebraic`.

namespace FormalScheme

/-- R2/ideal-of-coefficients-existence (b), algebraic core: over a valuation ring `R`, if `B` is
free over `R`, every content `c(f)` is principal, generated by the coordinate of largest
absolute value. -/
theorem content_isPrincipal_algebraic {R B : Type*} [CommRing R] [IsDomain R] [ValuationRing R]
    [CommRing B] [Algebra R B] [Module.Free R B] (f : B) :
    (content_algebraic (A := R) f).IsPrincipal := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/rig-ideal-of-coefficients-existence (lemma) -/

-- FormalScheme.exists_isIdealOfCoefficients_rig: not stated here; needs admissible formal
--   schemes, their generic fibres and rig-points (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/rig-point)
-- FormalScheme.IsIdealOfCoefficients.isOpen_of_rig_eq_top: not stated here; needs admissible
--   formal schemes and their coherent ideals (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme)

/-! ## AdicSpacesPartII:R2/nonvanishing-on-fibres-nonzerodivisor-levels (lemma) -/

-- FormalScheme.isSMulRegular_reduction_of_ne_zero_on_fibres: not stated here; needs smooth formal
--   morphisms of formal schemes locally of tf presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Each level `B_λ` over `A_λ` is the algebraic statement
--   `FormalScheme.isSMulRegular_of_ne_zero_on_fibres_algebraic`.

namespace FormalScheme

open _root_.AlgebraicGeometry CategoryTheory

universe u in
/-- R2/nonvanishing-on-fibres-nonzerodivisor-levels, algebraic core (Bosch–Lütkebohmert II
Lemma 2.5(a), applied to `A_λ → B_λ`): if `B` is smooth over `A` with geometrically irreducible
fibres, an element `f ∈ B` that is nonzero in every fibre `k(𝔭) ⊗_A B` is a non-zero-divisor
of `B`. -/
theorem isSMulRegular_of_ne_zero_on_fibres_algebraic {A B : Type u} [CommRing A] [CommRing B]
    [Algebra A B] [Algebra.Smooth A B]
    [GeometricallyIrreducible (Spec.map (CommRingCat.ofHom (algebraMap A B)))] (f : B)
    (hf : ∀ p : PrimeSpectrum A, (1 : p.asIdeal.ResidueField) ⊗ₜ[A] f ≠ 0) :
    IsSMulRegular B f := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/nonvanishing-on-fibres-nonzerodivisor (lemma) -/

-- FormalScheme.isSMulRegular_of_ne_zero_on_fibres: not stated here; needs smooth formal morphisms
--   of formal schemes locally of tf presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme).
--   Affine form: `FormalScheme.isSMulRegular_of_ne_zero_on_fibres_affine`.

namespace FormalScheme

universe u in
/-- R2/nonvanishing-on-fibres-nonzerodivisor, affine form (Bosch–Lütkebohmert II Lemma 2.5(b)):
for `Spf B → Spf A` smooth with geometrically irreducible fibres of dimension `n` and `B`
`ϖ`-adically separated, an element `f ∈ B` vanishing identically on no fibre of
`Spec B₀ → Spec A₀` is a non-zero-divisor of `B`. -/
theorem isSMulRegular_of_ne_zero_on_fibres_affine {A B : Type u} [CommRing A] [CommRing B]
    [Algebra A B] (ϖ : A) (n : ℕ) [IsHausdorff (Ideal.span {algebraMap A B ϖ}) B]
    (h : IsSmoothGeomIrredAffine (B := B) ϖ n) (f : B)
    (hf : ∀ p : PrimeSpectrum A, ϖ ∈ p.asIdeal → (1 : p.asIdeal.ResidueField) ⊗ₜ[A] f ≠ 0) :
    IsSMulRegular B f := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/smooth-geometrically-irreducible-extension (lemma) -/

-- FormalScheme.restrict_bijective_of_relDim_lt: not stated here; needs smooth formal morphisms of
--   formal schemes locally of tf presentation and the relative dimension of closed subschemes of
--   their special fibres (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme)

/-! ## AdicSpacesPartII:R2/content-ideal-smul (lemma) -/

-- FormalScheme.content_smul: not stated here; needs `FormalScheme.content` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Algebraic core:
--   `FormalScheme.content_smul_algebraic`.

namespace FormalScheme

/-- R2/content-ideal-smul, algebraic core (Bosch–Lütkebohmert II Lemma 2.6(a)): for `B` free
over `R`, `c(af) = a·c(f)`. -/
theorem content_smul_algebraic {R B : Type*} [CommRing R] [CommRing B] [Algebra R B]
    [Module.Free R B] (a : R) (f : B) :
    content_algebraic (a • f) = Ideal.span {a} * content_algebraic (A := R) f := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/content-ideal-nonvanishing-factor (lemma) -/

-- FormalScheme.content_mul_of_ne_zero_on_fibres: not stated here; needs `FormalScheme.content`
--   and smooth formal morphisms (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). Algebraic core:
--   `FormalScheme.content_mul_of_ne_zero_on_fibres_algebraic`.

namespace FormalScheme

open _root_.AlgebraicGeometry CategoryTheory

universe u in
/-- R2/content-ideal-nonvanishing-factor, algebraic core (Bosch–Lütkebohmert II Lemma 2.6(b)):
for `B` smooth over a valuation ring `R` with geometrically irreducible fibres and `f ∈ B`
nonzero on the closed fibre, `c(fg) = c(g)` for every `g ∈ B`. -/
theorem content_mul_of_ne_zero_on_fibres_algebraic {R B : Type u} [CommRing R] [IsDomain R]
    [ValuationRing R] [CommRing B] [Algebra R B] [Algebra.Smooth R B]
    [GeometricallyIrreducible (Spec.map (CommRingCat.ofHom (algebraMap R B)))] (f : B)
    (hf : (1 : IsLocalRing.ResidueField R) ⊗ₜ[R] f ≠ 0) (g : B) :
    content_algebraic (A := R) (f * g) = content_algebraic g := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/content-ideal-product (lemma) -/

-- FormalScheme.content_mul: not stated here; needs `FormalScheme.content` and smooth formal
--   morphisms (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). Algebraic core:
--   `FormalScheme.content_mul_algebraic`.

namespace FormalScheme

open _root_.AlgebraicGeometry CategoryTheory

universe u in
/-- R2/content-ideal-product, algebraic core (Bosch–Lütkebohmert II Lemma 2.6(c)): in the
setting of `FormalScheme.content_mul_of_ne_zero_on_fibres_algebraic`, if `c(f₁)` is principal
then `c(f₁ f₂) = c(f₁)·c(f₂)`. -/
theorem content_mul_algebraic {R B : Type u} [CommRing R] [IsDomain R]
    [ValuationRing R] [CommRing B] [Algebra R B] [Algebra.Smooth R B]
    [GeometricallyIrreducible (Spec.map (CommRingCat.ofHom (algebraMap R B)))] (f₁ f₂ : B)
    (h : (content_algebraic (A := R) f₁).IsPrincipal) :
    content_algebraic (A := R) (f₁ * f₂) = content_algebraic f₁ * content_algebraic f₂ := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/smooth-geometrically-irreducible-generic-fibres-integral (lemma) -/

-- FormalScheme.isPrime_map_of_notMem: not stated here; needs smooth formal morphisms of
--   admissible formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). Affine form:
--   `FormalScheme.isPrime_map_of_notMem_affine`.

namespace FormalScheme

open Huber

universe u in
/-- R2/smooth-geometrically-irreducible-generic-fibres-integral, affine form
(Bosch–Lütkebohmert II Proposition 2.4(a)): for admissible `A`, `B` and `Spf B → Spf A` smooth
with geometrically irreducible fibres of dimension `n`, and a prime `𝔭 ⊆ A` with `ϖ ∉ 𝔭`,
the ideal `𝔭B` is prime and lies over `𝔭`, and the fibre `k(𝔭) ⊗_A B` is an integral domain. -/
theorem isPrime_map_of_notMem_affine {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O]
    [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O} [IsCompleteRankOneBase O ϖ]
    {A B : Type u} [CommRing A] [CommRing B] [Algebra O A] [Algebra O B] [Algebra A B]
    [IsScalarTower O A B] (hA : IsAdmissibleAlgebra ϖ A) (hB : IsAdmissibleAlgebra ϖ B) {n : ℕ}
    (h : IsSmoothGeomIrredAffine (B := B) (algebraMap O A ϖ) n) (p : Ideal A) [p.IsPrime]
    (hp : algebraMap O A ϖ ∉ p) :
    (p.map (algebraMap A B)).IsPrime ∧ (p.map (algebraMap A B)).comap (algebraMap A B) = p ∧
      IsDomain (p.ResidueField ⊗[A] B) := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/smooth-geometrically-irreducible-associated-primes (lemma) -/

-- FormalScheme.exists_eq_map_of_isAssociatedPoint: not stated here; needs smooth formal morphisms
--   of admissible formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). Affine form:
--   `FormalScheme.exists_eq_map_of_isAssociatedPoint_affine`.

/-- R2/smooth-geometrically-irreducible-associated-primes, R2/fitting-ideal-invertible-locally-free:
a prime `𝔭` of `A` is an *associated point* in the sense of Raynaud–Gruson I 3.2.1 if `𝔭A_𝔭` is
the radical of the annihilator of an element of `A_𝔭`. For noetherian `A` these are the
associated primes (Mathlib's `associatedPrimes`, where `𝔭` is itself an annihilator). -/
def IsAssociatedPoint {A : Type*} [CommRing A] (p : Ideal A) [p.IsPrime] : Prop :=
  ∃ x : Localization.AtPrime p,
    (Submodule.span (Localization.AtPrime p) {x}).annihilator.radical =
      IsLocalRing.maximalIdeal (Localization.AtPrime p)

namespace FormalScheme

open Huber

universe u in
/-- R2/smooth-geometrically-irreducible-associated-primes, affine form (Bosch–Lütkebohmert II
Proposition 2.4(b)): in the setting of `FormalScheme.isPrime_map_of_notMem_affine` with `A`
admissible and `B` tfp, every associated point of `B` is `𝔭B` for an associated point `𝔭` of
`A` with `ϖ ∉ 𝔭`, and `B` has no `ϖ`-torsion. -/
theorem exists_eq_map_of_isAssociatedPoint_affine {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {A B : Type u} [CommRing A] [CommRing B] [Algebra O A]
    [Algebra O B] [Algebra A B] [IsScalarTower O A B] (hA : IsAdmissibleAlgebra ϖ A)
    (hB : IsTopologicallyFinitePresentation O B) {n : ℕ}
    (h : IsSmoothGeomIrredAffine (B := B) (algebraMap O A ϖ) n) :
    (∀ Q : PrimeSpectrum B, IsAssociatedPoint Q.asIdeal →
      ∃ P : PrimeSpectrum A, IsAssociatedPoint P.asIdeal ∧ algebraMap O A ϖ ∉ P.asIdeal ∧
        Q.asIdeal = P.asIdeal.map (algebraMap A B)) ∧
      Submodule.torsionBy O B ϖ = ⊥ := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/formal-devissage-step (definition)

A dévissage step bundles a closed immersion, a finite and a smooth formal morphism and a map of
coherent modules on formal schemes; none of these is in either library. -/

-- FormalScheme.DevissageStep: not stated here; needs formal schemes locally of tf presentation,
--   closed immersions, finite and smooth formal morphisms and coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/smooth-formal-scheme)
--   [structure]
-- FormalScheme.DevissageStep.pushforward: not stated here; needs coherent modules on formal
--   schemes and their direct images (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.DevissageStep.cokernel: not stated here; needs coherent modules on formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.DevissageStep.surjective_generic: not stated here; needs coherent modules on formal
--   schemes and their stalks (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [other]
-- FormalScheme.DevissageStep.dim_cokernel_le: not stated here; needs coherent modules on formal
--   schemes and fibre dimensions (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [other]
-- FormalScheme.DevissageStep.exists_closedSubscheme_cokernel: not stated here; needs closed formal
--   subschemes of finite presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.DevissageStep.dim_le: not stated here; needs coherent modules on formal schemes and
--   fibre dimensions (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.DevissageStep.baseChange: not stated here; needs fibre products of formal schemes
--   and pull-backs of coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.DevissageStep.reduction: not stated here; needs formal schemes and the
--   Raynaud–Gruson dévissages of their reductions (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- devissageStep_test_free: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- devissageStep_test_dimZero: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- devissageStep_test_notFlat: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- devissageStep_test_reduction: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]

/-! ## AdicSpacesPartII:R2/formal-devissage (definition) -/

-- FormalScheme.Devissage: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, node R2/formal-devissage-step)
--   [structure]
-- FormalScheme.Devissage.IsComplete: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.Devissage.length: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.Devissage.dim: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.Devissage.truncate: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [constructor]
-- FormalScheme.Devissage.baseChange: not stated here; needs fibre products of formal schemes and
--   pull-backs of coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.Devissage.cons: not stated here; needs `FormalScheme.DevissageStep` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [constructor]
-- FormalScheme.Devissage.reduction: not stated here; needs formal schemes and the Raynaud–Gruson
--   dévissages of their reductions (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- devissage_test_complete_free: not stated here; needs `FormalScheme.Devissage` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- devissage_test_lengthTwo: not stated here; needs `FormalScheme.Devissage` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- devissage_test_single: not stated here; needs `FormalScheme.Devissage` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- devissage_test_truncation: not stated here; needs `FormalScheme.Devissage` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]

/-! ## AdicSpacesPartII:R2/formal-devissage-existence (lemma) -/

-- FormalScheme.exists_complete_devissage: not stated here; needs `FormalScheme.Devissage` and
--   elementary étale neighbourhoods of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, node R2/formal-devissage)

/-! ## AdicSpacesPartII:R2/devissage-generic-bijectivity-criterion (lemma) -/

-- FormalScheme.DevissageStep.tfae_generic: not stated here; needs coherent modules on formal
--   schemes, their stalks at points of `Z_0` (colimits over formal opens, not algebraic
--   localisations) and smooth formal morphisms (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/smooth-formal-scheme)

/-! ## AdicSpacesPartII:R2/devissage-flatness-criterion (lemma) -/

-- FormalScheme.Devissage.flat_tfae: not stated here; needs `FormalScheme.Devissage` and stalks of
--   formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, node
--   R2/formal-devissage)

/-! ## AdicSpacesPartII:R2/flat-in-dimension (definition)

Flatness is stalkwise over the base, for the stalks of formal schemes, and dimensions are those
of the fibres `X ⊗ k(t)`; every item needs formal schemes and their coherent modules. -/

-- FormalScheme.flatLocus: not stated here; needs formal schemes locally of tf presentation, their
--   stalks and coherent modules (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [data]
-- FormalScheme.mem_flatLocus_iff: not stated here; needs stalks of formal schemes and of coherent
--   modules (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation]
-- FormalScheme.IsFlatInDimAt: not stated here; needs `FormalScheme.flatLocus` and fibres of formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsFlatInDim: not stated here; needs `FormalScheme.flatLocus` and fibres of formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsFlatInDim.mono: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.isFlatInDim_of_relDim_le: not stated here; needs `FormalScheme.IsFlatInDim` and
--   relative dimensions of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsFlatInDim.of_flat: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.flatLocus_etale: not stated here; needs étale morphisms of formal schemes (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/smooth-formal-scheme)
--   [compatibility]
-- FormalScheme.flatLocus_pushforward_finite: not stated here; needs finite formal morphisms and
--   direct images of coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- flatInDim_test_annulusModel: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- flatInDim_test_zero: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]
-- flatInDim_test_relDim: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation test]
-- flatInDim_test_fibreNotTotal: not stated here; needs `FormalScheme.IsFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]

/-! ## AdicSpacesPartII:R2/formal-flat-locus-open (lemma) -/

-- FormalScheme.isOpen_flatLocus: not stated here; needs `FormalScheme.flatLocus` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, node R2/flat-in-dimension)

/-! ## AdicSpacesPartII:R2/devissage-flat-in-dimension-criterion (lemma) -/

-- FormalScheme.Devissage.flatInDim_tfae: not stated here; needs `FormalScheme.Devissage` and
--   `FormalScheme.IsFlatInDimAt` (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   nodes R2/formal-devissage, R2/flat-in-dimension)

/-! ## AdicSpacesPartII:R2/rig-flat-in-dimension (definition)

Rig-flatness at a rig-point is, on affine charts, flatness over `A` of an algebraic localisation
(Bosch–Lütkebohmert I 5.3(a)); that chart condition is `FormalScheme.IsRigFlatAt_affine`. The
chart independence, the relative rig-dimension and rig-flatness in dimension `≥ n` need formal
schemes and their rig-points. -/

-- FormalScheme.IsRigFlatAt: not stated here; needs admissible formal schemes, coherent modules
--   and rig-points (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/rig-point). Chart condition: `FormalScheme.IsRigFlatAt_affine`
--   [structure]
-- FormalScheme.isRigFlatAt_iff_localization: not stated here; needs `FormalScheme.IsRigFlatAt`
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/rig-point);
--   it identifies `FormalScheme.IsRigFlatAt` with `FormalScheme.IsRigFlatAt_affine` on charts
--   [characterisation]
-- FormalScheme.IsRigFlatAt.admissibleBlowUp: not stated here; needs admissible blow-ups (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up)
--   [compatibility]
-- FormalScheme.rigRelDim: not stated here; needs rig-points of formal schemes and their rigid
--   fibres (supplier: AdicSpacesPartII:R2/rig-point) [data]
-- FormalScheme.IsRigFlatInDim: not stated here; needs closed formal subschemes of finite
--   presentation and rig-points (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/rig-point) [structure]
-- FormalScheme.IsRigFlatInDim.mono: not stated here; needs `FormalScheme.IsRigFlatInDim`
--   (supplier: AdicSpacesPartII:R2/rig-point) [relation]
-- FormalScheme.isRigFlatInDim_of_rigRelDim_le: not stated here; needs `FormalScheme.IsRigFlatInDim`
--   and `FormalScheme.rigRelDim` (supplier: AdicSpacesPartII:R2/rig-point) [other]
-- FormalScheme.IsRigFlatInDim.pushforward_finite: not stated here; needs finite formal morphisms
--   and direct images of coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.IsRigFlatInDim.torsionQuotient: not stated here; needs coherent modules on formal
--   schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsRigFlatInDim.baseChange: not stated here; needs étale morphisms, admissible
--   blow-ups and strict transforms (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/admissible-blow-up) [functoriality]
-- FormalScheme.isRigFlatAt_iff_genericFibre_flat: not stated here; needs the generic fibre functor
--   and local rings of rigid spaces (supplier: AdicSpacesPartII:R2/generic-fibre-functor-d,
--   AdicSpacesPartII:R1/rigid-local-ring-completion) [compatibility]
-- rigFlat_test_annulusModel: not stated here; needs `FormalScheme.IsRigFlatAt` (supplier:
--   AdicSpacesPartII:R2/rig-point) [computation test]
-- rigFlat_test_torsion: not stated here; needs `FormalScheme.IsRigFlatInDim` (supplier:
--   AdicSpacesPartII:R2/rig-point) [degenerate test]. Its chart form, that `C ⧸ ϖC` is rig-flat
--   at every prime not containing `ϖ`, is the example below.
-- rigFlat_test_closedPoint: not stated here; needs `FormalScheme.IsRigFlatInDim` and
--   `FormalScheme.rigRelDim` (supplier: AdicSpacesPartII:R2/rig-point) [non-example test]
-- rigFlat_test_affinoid: not stated here; needs rig-points and flat morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R2/rig-point, AdicSpaces Layer 5) [compatibility test]

namespace FormalScheme

/-- R2/rig-flat-in-dimension (i), chart condition (Bosch–Lütkebohmert I Proposition 5.3(a)): for
formal affine opens `Spf C → Spf A`, a `C`-module `M` and a prime `x ⊆ C` (a rig-point when
`ϖ ∉ x` and `dim C ⧸ x = 1`), `M` is rig-flat over `A` at `x` if `M_x` is a flat `A`-module. -/
def IsRigFlatAt_affine {A C M : Type*} [CommRing A] [CommRing C] [Algebra A C] [AddCommGroup M]
    [Module C M] [Module A M] [IsScalarTower A C M] (x : Ideal C) [x.IsPrime] : Prop :=
  Module.Flat A (LocalizedModule x.primeCompl M)

end FormalScheme

-- test rigFlat_test_torsion_core (degenerate) [R2/rig-flat-in-dimension]
example {A C : Type*} [CommRing A] [CommRing C] [Algebra A C] (ϖ : A) (x : Ideal C) [x.IsPrime]
    (hx : algebraMap A C ϖ ∉ x) :
    FormalScheme.IsRigFlatAt_affine (A := A) (M := C ⧸ Ideal.span {algebraMap A C ϖ}) x := sorry

/-! ## AdicSpacesPartII:R2/rig-flatness-generic-point-criterion (lemma) -/

-- FormalScheme.rigFlat_tfae_generic: not stated here; needs `FormalScheme.IsRigFlatInDim` and
--   dévissages (supplier: AdicSpacesPartII:R2/rig-point, node R2/formal-devissage-step). The
--   equivalence of its conditions (c) and (d) is the ring-level
--   `FormalScheme.flat_iff_free_localization_generic_affine`.

namespace FormalScheme

open Huber

universe u in
/-- R2/rig-flatness-generic-point-criterion, conditions (c) ⟺ (d) (Bosch–Lütkebohmert II
Proposition 3.12): for admissible `A`, `B` with `Spf B → Spf A` smooth with geometrically
irreducible fibres of dimension `m`, a prime `t ⊆ A` with `ϖ ∉ t` and `ζ = tB` (prime by node
R2/smooth-geometrically-irreducible-generic-fibres-integral), a finitely presented `B`-module `N`
has `N_ζ` flat over `A` (equivalently over `A_t`) iff `N_ζ` is free over `B_ζ`. -/
theorem flat_iff_free_localization_generic_affine {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {A B : Type u} [CommRing A] [CommRing B] [Algebra O A]
    [Algebra O B] [Algebra A B] [IsScalarTower O A B] (hA : IsAdmissibleAlgebra ϖ A)
    (hB : IsAdmissibleAlgebra ϖ B) {m : ℕ}
    (h : IsSmoothGeomIrredAffine (B := B) (algebraMap O A ϖ) m) (t : Ideal A) [t.IsPrime]
    (ht : algebraMap O A ϖ ∉ t) [(t.map (algebraMap A B)).IsPrime] {N : Type*} [AddCommGroup N]
    [Module B N] [Module A N] [IsScalarTower A B N] [Module.FinitePresentation B N] :
    Module.Flat A (LocalizedModule (t.map (algebraMap A B)).primeCompl N) ↔
      Module.Free (Localization.AtPrime (t.map (algebraMap A B)))
        (LocalizedModule (t.map (algebraMap A B)).primeCompl N) := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/formal-fitting-ideal (construction)

The ring-level Fitting ideal of a finitely presented module is owned by the Tau Ceti roadmap
StableReduction, Layer 0, which is not in the pinned trees. `Module.fittingIdeal` below stands for
it, so that nodes R2/rg-fitting-ideal-principal-generators and
R2/fitting-ideal-invertible-locally-free can be stated; the sheaf `F_r(ℳ)` on a formal scheme
needs coherent modules. -/

-- FormalScheme.fittingIdeal: not stated here; needs coherent modules and coherent ideals on formal
--   schemes locally of tf presentation (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core: `Module.fittingIdeal`
--   [constructor]
-- FormalScheme.fittingIdeal_spf: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [characterisation]
-- FormalScheme.fittingIdeal_mono: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core:
--   `Module.fittingIdeal_mono` [relation]
-- FormalScheme.fittingIdeal_pullback: not stated here; needs `FormalScheme.fittingIdeal` and
--   pull-backs of coherent modules (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme).
--   Ring-level core: `Module.fittingIdeal_baseChange` [functoriality]
-- FormalScheme.fittingIdeal_restrict: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.fittingIdeal_eq_top_iff: not stated here; needs `FormalScheme.fittingIdeal` and
--   stalks of coherent modules (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme).
--   Ring-level core, over a local ring: `Module.fittingIdeal_eq_top_iff` [characterisation]
-- FormalScheme.fittingIdeal_of_locallyFree: not stated here; needs `FormalScheme.fittingIdeal`
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level core:
--   `Module.fittingIdeal_of_free` [example]
-- FormalScheme.fittingIdeal_isCoherent: not stated here; needs coherent ideals on formal schemes
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- fittingIdeal_test_cyclic: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]. Its ring-level
--   core is the example below.
-- fittingIdeal_test_diagonal: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]. The statement is
--   about a module `M` over a ring; its core is the example below: `F_{n−v}(M)` is
--   generated by the products of `v` of the `aᵢ`, which is `(a₁ ⋯ a_v)` when
--   `a₁ ∣ a₂ ∣ ⋯ ∣ a_t`.
-- fittingIdeal_test_zero: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]. Its ring-level core
--   is the example below.
-- fittingIdeal_test_baseChange: not stated here; needs `FormalScheme.fittingIdeal` and open
--   immersions of formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [compatibility test]
-- fittingIdeal_test_notAnnihilator: not stated here; needs `FormalScheme.fittingIdeal` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]. Its ring-level core
--   is the example below.

/-- R2/formal-fitting-ideal, ring-level Fitting ideal (standing for the Fitting ideal of Tau Ceti
roadmap StableReduction, Layer 0; Raynaud–Gruson I 5.4.1): for a finite `A`-module `M` with
chosen generators `x₁, …, x_n`, `F_r(M)` is generated by the `(n - r) × (n - r)` minors of all
matrices whose columns are relations among the `xᵢ`; `F_r(M) = A` when `n ≤ r`. It does not
depend on the generators. -/
def Module.fittingIdeal (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] (r : ℕ) : Ideal A :=
  let n := (Module.Finite.exists_fin (R := A) (M := M)).choose
  let x : Fin n → M := (Module.Finite.exists_fin (R := A) (M := M)).choose_spec.choose
  Ideal.span {a | ∃ φ : Matrix (Fin n) (Fin (n - r)) A, (∀ j, ∑ i, φ i j • x i = 0) ∧
    ∃ f : Fin (n - r) → Fin n, a = (φ.submatrix f id).det}

/-- R2/formal-fitting-ideal, ring-level core of `FormalScheme.fittingIdeal_mono`:
`F_r(M) ⊆ F_{r+1}(M)`. -/
theorem Module.fittingIdeal_mono (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] (r : ℕ) : Module.fittingIdeal A M r ≤ Module.fittingIdeal A M (r + 1) :=
  sorry

/-- R2/formal-fitting-ideal, ring-level core of `FormalScheme.fittingIdeal_pullback`: Fitting
ideals commute with base change, `F_r(A' ⊗_A M) = F_r(M) A'`. -/
theorem Module.fittingIdeal_baseChange (A M A' : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] [CommRing A'] [Algebra A A'] (r : ℕ) :
    Module.fittingIdeal A' (A' ⊗[A] M) r = (Module.fittingIdeal A M r).map (algebraMap A A') :=
  sorry

/-- R2/formal-fitting-ideal, ring-level core of `FormalScheme.fittingIdeal_eq_top_iff`: over a
local ring, `F_r(M) = A` iff `M` is generated by `r` elements. -/
theorem Module.fittingIdeal_eq_top_iff (A M : Type*) [CommRing A] [IsLocalRing A]
    [AddCommGroup M] [Module A M] [Module.Finite A M] (r : ℕ) :
    Module.fittingIdeal A M r = ⊤ ↔ ∃ s : Fin r → M, Submodule.span A (Set.range s) = ⊤ := sorry

/-- R2/formal-fitting-ideal, ring-level core of `FormalScheme.fittingIdeal_of_locallyFree`: for
`M` free of rank `r`, `F_r(M) = A` and `F_s(M) = 0` for `s < r`. -/
theorem Module.fittingIdeal_of_free (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Free A M] {r : ℕ} (hr : Module.finrank A M = r) :
    Module.fittingIdeal A M r = ⊤ ∧ ∀ s < r, Module.fittingIdeal A M s = ⊥ := sorry

-- test fittingIdeal_test_cyclic_core (computation) [R2/formal-fitting-ideal]
example {A : Type*} [CommRing A] (J : Ideal A) :
    Module.fittingIdeal A (A ⧸ J) 0 = J ∧ Module.fittingIdeal A (A ⧸ J) 1 = ⊤ := sorry

-- test fittingIdeal_test_diagonal_core (computation) [R2/formal-fitting-ideal]
example {A : Type*} [CommRing A] {m n t : ℕ} (a : Fin t → A) (htm : t ≤ m) (htn : t ≤ n)
    (v : ℕ) (hv : v ≤ n) :
    let φ : Matrix (Fin n) (Fin m) A := fun i j ↦
      if h : (i : ℕ) = j ∧ (i : ℕ) < t then a ⟨i, h.2⟩ else 0
    Module.fittingIdeal A ((Fin n → A) ⧸ LinearMap.range (Matrix.mulVecLin φ)) (n - v) =
      Ideal.span ((fun s : Finset (Fin t) ↦ ∏ i ∈ s, a i) '' {s | s.card = v}) := sorry

-- test fittingIdeal_test_zero_core (degenerate) [R2/formal-fitting-ideal]
example {A : Type*} [CommRing A] (r : ℕ) : Module.fittingIdeal A PUnit r = ⊤ := sorry

-- test fittingIdeal_test_notAnnihilator_core (non-example) [R2/formal-fitting-ideal]
example {A : Type*} [CommRing A] (ϖ : A) :
    Module.annihilator A ((Fin 2 → A) ⧸ Ideal.span {ϖ} • (⊤ : Submodule A (Fin 2 → A))) =
        Ideal.span {ϖ} ∧
      Module.fittingIdeal A ((Fin 2 → A) ⧸ Ideal.span {ϖ} • (⊤ : Submodule A (Fin 2 → A))) 0 =
        Ideal.span {ϖ ^ 2} := sorry

/-! ## AdicSpacesPartII:R2/rg-fitting-ideal-principal-generators (lemma) -/

/-- R2/rg-fitting-ideal-principal-generators (Raynaud–Gruson I, Lemme 5.4.2): if the Fitting
ideal `F_r(M)` of a finitely presented module is locally principal, then
`M ⧸ Ann_M(F_r(M))` is locally generated by `r` elements (`Ann_M(I) = {m : I m = 0}`, Mathlib's
`Submodule.torsionBySet`). Both conditions are stated at the local rings `A_𝔭`. -/
theorem generators_quotient_annihilator_of_fitting_isPrincipal {A M : Type*} [CommRing A]
    [AddCommGroup M] [Module A M] [Module.FinitePresentation A M] (r : ℕ)
    (hF : ∀ (p : Ideal A) [p.IsPrime],
      ((Module.fittingIdeal A M r).map (algebraMap A (Localization.AtPrime p))).IsPrincipal)
    (p : Ideal A) [p.IsPrime] :
    ∃ s : Fin r → LocalizedModule p.primeCompl
        (M ⧸ Submodule.torsionBySet A M (Module.fittingIdeal A M r)),
      Submodule.span (Localization.AtPrime p) (Set.range s) = ⊤ := sorry

/-! ## AdicSpacesPartII:R2/fitting-ideal-invertible-locally-free (lemma) -/

/-- R2/fitting-ideal-invertible-locally-free (Bosch–Lütkebohmert II Lemma 3.14 = Raynaud–Gruson I,
Lemme 5.4.3): if the finitely presented module `M` is free of rank `r` at every associated point
of `A` (`IsAssociatedPoint`) and `F_r(M)` is an invertible ideal (an invertible `A`-module, that is
locally generated by one non-zero-divisor), then `M ⧸ Ann_M(F_r(M))` is locally free of
rank `r`. -/
theorem locallyFree_quotient_annihilator_fittingIdeal {A M : Type*} [CommRing A]
    [AddCommGroup M] [Module A M] [Module.FinitePresentation A M] (r : ℕ)
    (hinv : Module.Invertible A (Module.fittingIdeal A M r))
    (hfree : ∀ (p : Ideal A) [p.IsPrime], IsAssociatedPoint p →
      Module.Free (Localization.AtPrime p) (LocalizedModule p.primeCompl M) ∧
        Module.finrank (Localization.AtPrime p) (LocalizedModule p.primeCompl M) = r)
    (p : Ideal A) [p.IsPrime] :
    Module.Free (Localization.AtPrime p) (LocalizedModule p.primeCompl
        (M ⧸ Submodule.torsionBySet A M (Module.fittingIdeal A M r))) ∧
      Module.finrank (Localization.AtPrime p) (LocalizedModule p.primeCompl
        (M ⧸ Submodule.torsionBySet A M (Module.fittingIdeal A M r))) = r := sorry

/-! ## AdicSpacesPartII:R2/partition-by-admissible-blow-up (lemma) -/

-- FormalScheme.exists_admissibleBlowUp_partition: not stated here; needs admissible blow-ups of
--   admissible formal schemes (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/admissible-blow-up). Its ring-level part, the centre, is
--   `FormalScheme.exists_admissibleBlowUp_partition_affine`.

namespace FormalScheme

open Huber

/-- R2/partition-by-admissible-blow-up, ring-level part (formal form of Raynaud–Gruson I,
Lemme 5.1.5): for admissible `A` and complete orthogonal idempotents `e₁, …, e_k` of
`A_K = A[1/ϖ]`, the ideals `𝒥ᵢ = {a ∈ A : a (1 - eᵢ) = 0 in A_K}` are finitely generated with
`𝒥ᵢ 𝒥ₗ = 0` for `i ≠ l`, their sum `𝒥` is open (contains a power of `ϖ`), and if `a ∉ t` and
`eᵢ = 1` in `A_K[1/a]` then `𝒥 ⊄ t`. The blow-up of `𝒥` splits along the `𝒥ᵢ`. -/
theorem exists_admissibleBlowUp_partition_affine {O : Type*} [CommRing O] [IsDomain O]
    [ValuationRing O] [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O}
    [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A] [Algebra O A]
    (hA : IsAdmissibleAlgebra ϖ A) {k : ℕ} (e : Fin k → Localization.Away (algebraMap O A ϖ))
    (he : CompleteOrthogonalIdempotents e) :
    let J : Fin k → Ideal A := fun i ↦
      (Submodule.span (Localization.Away (algebraMap O A ϖ)) {1 - e i}).annihilator.comap
        (algebraMap A (Localization.Away (algebraMap O A ϖ)))
    (∀ i, (J i).FG) ∧ (∀ i l, i ≠ l → J i * J l = ⊥) ∧
      (∃ N : ℕ, algebraMap O A ϖ ^ N ∈ ⨆ i, J i) ∧
      ∀ (t : Ideal A) [t.IsPrime] (a : A), a ∉ t →
        (∃ i, algebraMap (Localization.Away (algebraMap O A ϖ))
          (Localization.Away (algebraMap A (Localization.Away (algebraMap O A ϖ)) a)) (e i) = 1) →
        ¬ (⨆ i, J i) ≤ t := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/flattening-smooth-special-case (lemma) -/

-- FormalScheme.exists_blowUp_flatInDim_smooth: not stated here; needs admissible blow-ups, strict
--   transforms, `FormalScheme.IsFlatInDim` and `FormalScheme.IsRigFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up,
--   nodes R2/flat-in-dimension, R2/rig-flat-in-dimension)

/-! ## AdicSpacesPartII:R2/devissage-torsion-lemma (lemma) -/

-- FormalScheme.torsion_map_bijective: not stated here; needs coherent modules on formal schemes
--   and smooth formal morphisms (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R2/smooth-formal-scheme). Affine form:
--   `FormalScheme.torsion_map_bijective_affine`.

namespace FormalScheme

open Huber

universe u in
/-- R2/devissage-torsion-lemma, affine form (Bosch–Lütkebohmert II Lemma 4.5): for admissible
`A`, tfp `B` with `Spf B → Spf A` smooth with geometrically irreducible fibres of dimension `m`,
and an exact sequence `0 → L → N → P → 0` of finite `B`-modules with `L` free and the fibres of
`Supp P ∩ Spec B₀` over `Spec A₀` of dimension `< m`, write `𝒯(-)` for `ϖ`-power torsion. Then
(a) `L ∩ 𝒯(N) = 0`, (b) `𝒯(N) → 𝒯(P)` is bijective, and (c) `0 → L → N/𝒯(N) → P/𝒯(P) → 0` is
exact (in the middle: the preimage of `𝒯(P)` is `𝒯(N) + L`). -/
theorem torsion_map_bijective_affine {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O]
    [TopologicalSpace O] [NonarchimedeanRing O] {ϖ : O} [IsCompleteRankOneBase O ϖ]
    {A B : Type u} [CommRing A] [CommRing B] [Algebra O A] [Algebra O B] [Algebra A B]
    [IsScalarTower O A B] (hA : IsAdmissibleAlgebra ϖ A)
    (hB : IsTopologicallyFinitePresentation O B) {m : ℕ}
    (h : IsSmoothGeomIrredAffine (B := B) (algebraMap O A ϖ) m) {L N P : Type*}
    [AddCommGroup L] [Module B L] [AddCommGroup N] [Module B N] [AddCommGroup P] [Module B P]
    [Module.Free B L] [Module.Finite B L] [Module.FinitePresentation B N]
    (f : L →ₗ[B] N) (g : N →ₗ[B] P) (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g)
    (hdim : ∀ t : PrimeSpectrum A, algebraMap O A ϖ ∈ t.asIdeal →
      ringKrullDim (t.asIdeal.ResidueField ⊗[A] (B ⧸ Module.annihilator B P)) < m) :
    LinearMap.range f ⊓ Submodule.torsion' B N (Submonoid.powers (algebraMap O B ϖ)) = ⊥ ∧
      Set.BijOn g (Submodule.torsion' B N (Submonoid.powers (algebraMap O B ϖ)))
        (Submodule.torsion' B P (Submonoid.powers (algebraMap O B ϖ))) ∧
      (Submodule.torsion' B P (Submonoid.powers (algebraMap O B ϖ))).comap g =
        Submodule.torsion' B N (Submonoid.powers (algebraMap O B ϖ)) ⊔ LinearMap.range f :=
  sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/devissage-injectivity-and-rig-flatness (lemma) -/

-- FormalScheme.Devissage.universallyInjective_and_rigFlat: not stated here; needs
--   `FormalScheme.Devissage`, `FormalScheme.IsFlatInDim` and `FormalScheme.IsRigFlatInDim`
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, nodes R2/formal-devissage,
--   R2/flat-in-dimension, R2/rig-flat-in-dimension)

/-! ## AdicSpacesPartII:R2/flattening-local-step (lemma) -/

-- FormalScheme.exists_blowUp_enlarge_flatLocus: not stated here; needs admissible blow-ups, strict
--   transforms and `FormalScheme.IsFlatInDim` over opens of `T_0` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up,
--   node R2/flat-in-dimension)

/-! ## AdicSpacesPartII:R2/flattening-induction-step (lemma) -/

-- FormalScheme.exists_blowUp_flatInDim_step: not stated here; needs admissible blow-ups, strict
--   transforms, `FormalScheme.IsFlatInDim` and `FormalScheme.IsRigFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up,
--   nodes R2/flat-in-dimension, R2/rig-flat-in-dimension)

/-! ## AdicSpacesPartII:R2/module-flattening-by-blow-up (theorem) -/

-- FormalScheme.exists_blowUp_flatInDim: not stated here; needs quasi-compact admissible formal
--   schemes, admissible blow-ups, `FormalScheme.strictTransformBaseChange`,
--   `FormalScheme.IsFlatInDim` and `FormalScheme.IsRigFlatInDim` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up,
--   nodes R2/flat-in-dimension, R2/rig-flat-in-dimension)

/-! ## AdicSpacesPartII:R2/strict-transform-generically-torsion-quotient (lemma) -/

-- FormalScheme.strictTransform_eq_torsionQuotient_on_flatLocus: not stated here; needs admissible
--   blow-ups, strict transforms and relative dimensions of closed subsets of `X'_0` (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/admissible-blow-up)

/-! ## AdicSpacesPartII:R2/flattening-by-blow-up (theorem) -/

-- FormalScheme.exists_admissibleBlowUp_flat: not stated here; needs admissible formal schemes,
--   strict transforms and flat morphisms of adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/quasi-finite-formal-model (lemma) -/

-- FormalScheme.exists_admissibleBlowUp_quasiFinite: not stated here; needs admissible formal
--   schemes and quasi-finite morphisms of adic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison (comparison) -/

-- FormalScheme.completionComparison: not stated here; needs formal completions of schemes, their
--   generic fibres and analytification (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/good-reduction-locus (theorem) -/

-- FormalScheme.isOpenEmbedding_goodReduction: not stated here; needs generic fibres of formal
--   completions and analytification (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/good-reduction-locus-properness-converse (lemma) -/

-- FormalScheme.isProper_of_goodReduction_surjective: not stated here; needs generic fibres of
--   formal completions and analytification (supplier: AdicSpacesPartII:F0/formal-completion,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base (construction) -/

-- FormalScheme.FSC: not stated here; needs locally noetherian formal schemes and rigid analytic
--   spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [structure]
-- FormalScheme.rigOfFSC: not stated here; needs locally noetherian formal schemes and rigid
--   analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [constructor]
-- FormalScheme.rigOfFSC.homEquiv: not stated here; needs locally noetherian formal schemes and
--   rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [universal-property]
-- FormalScheme.rigOfFSC_isOpenImmersion: not stated here; needs locally noetherian formal schemes
--   and rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [functoriality]
-- FormalScheme.rigOfFSC_pullback: not stated here; needs locally noetherian formal schemes and
--   rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility]
-- FormalScheme.rigOfFSC_baseChangeField: not stated here; needs locally noetherian formal schemes
--   and rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility]
-- FormalScheme.rigOfFSC_changeCoefficients: not stated here; needs locally noetherian formal
--   schemes and rigid analytic spaces (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility]
-- FormalScheme.rigOfFSC_isSeparated: not stated here; needs locally noetherian formal schemes and
--   rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [other]
-- FormalScheme.rigOfFSC_quasiCompact: not stated here; needs locally noetherian formal schemes
--   and rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [other]
-- FormalScheme.rigOfFSC_powerSeries: not stated here; needs locally noetherian formal schemes and
--   rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [example]
-- FormalScheme.rigOfFSC_preserves: not stated here; needs locally noetherian formal schemes and
--   rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [other]
-- FormalScheme.rigOfFSC_eq_genericFibre: not stated here; needs locally noetherian formal schemes
--   and rigid analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility]
-- rigOfFSC_test_powerSeries: not stated here; needs locally noetherian formal schemes and rigid
--   analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [computation test]
-- rigOfFSC_test_nondiscrete: not stated here; needs locally noetherian formal schemes and rigid
--   analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [non-example test]
-- rigOfFSC_test_restricted: not stated here; needs locally noetherian formal schemes and rigid
--   analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]
-- rigOfFSC_test_point: not stated here; needs locally noetherian formal schemes and rigid
--   analytic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]

/-! ## AdicSpacesPartII:R2/fibral-finiteness-scheme-lemma (lemma) -/

namespace AlgebraicGeometry

open _root_.AlgebraicGeometry CategoryTheory

/-- R2/fibral-finiteness-scheme-lemma (Conrad, Lemma A.1.4): a flat morphism of schemes locally of
finite presentation is finite iff it is separated with finite fibres and its fibre rank
`y ↦ dim_{κ(y)} Γ(X_y, 𝒪)` is locally constant. No quasi-compactness or noetherian hypothesis. -/
theorem isFinite_iff_of_flat {X Y : Scheme} (f : X ⟶ Y) [Flat f] [LocallyOfFinitePresentation f] :
    IsFinite f ↔ IsSeparated f ∧ (∀ y : Y, (f ⁻¹' {y}).Finite) ∧
      IsLocallyConstant fun y : Y ↦
        letI : Algebra (Y.residueField y) Γ(f.fiber y, ⊤) :=
          ((Scheme.ΓSpecIso (Y.residueField y)).inv ≫
            (f.fiberToSpecResidueField y).appTop).hom.toAlgebra
        Module.finrank (Y.residueField y) Γ(f.fiber y, ⊤) := sorry

end AlgebraicGeometry

/-! ## AdicSpacesPartII:R2/fibral-finiteness-criterion (theorem) -/

-- AdicSpace.isFinite_iff_of_flat: not stated here; needs flat, finite and separated morphisms of
--   adic spaces (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/finite-morphism)

/-! ## AdicSpacesPartII:R2/topological-invariance-of-affinoid (theorem) -/

-- AdicSpace.isAffinoid_iff_reduced: not stated here; needs rigid analytic spaces and their
--   reductions (supplier: AdicSpacesPartII:R1/rigid-analytic-space, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/smooth-formal-scheme (definition) -/

-- FormalScheme.IsSmoothAt: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.IsSmooth: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [structure]
-- FormalScheme.isSmoothAt_iff_flat_specialFibre: not stated here; needs formal schemes locally of
--   tf presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [characterisation]
-- FormalScheme.isSmooth_iff_forall_level: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [characterisation]
-- FormalScheme.IsSmooth.exists_etale_affineSpace: not stated here; needs formal schemes locally
--   of tf presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [characterisation]
-- FormalScheme.kaehler: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [data]
-- FormalScheme.IsSmooth.kaehler_locallyFree: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.IsSmooth.isAdmissible: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [instance]
-- FormalScheme.IsSmooth.comp: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [functoriality]
-- FormalScheme.IsSmooth.of_isEtale: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [relation]
-- FormalScheme.IsSmooth.genericFibre: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme); also adic
--   spaces (AdicSpaces Layer 5) [compatibility]
-- FormalScheme.IsEtale.lift_unique: not stated here; needs formal schemes locally of tf
--   presentation (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme). Ring-level
--   core: Mathlib's Algebra.FormallyEtale on each level [universal-property]
-- FormalScheme.IsElementaryEtaleNbhd: not stated here; needs formal schemes locally of tf
--   presentation and their étale morphisms (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme). The scheme-level notion (an étale
--   pointed morphism with bijective residue field map) is written out in
--   `AlgebraicGeometry.exists_localStructure` (node R2/rg-zariski-local-structure) [structure]
-- smoothFormal_test_affineSpace: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- smoothFormal_test_torus: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [computation test]
-- smoothFormal_test_semistable: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [non-example test]
-- smoothFormal_test_levels: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility test]
-- smoothFormal_test_identity: not stated here; needs formal schemes locally of tf presentation
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [degenerate test]

/-! ## AdicSpacesPartII:R2/formal-etale-site-invariance (comparison) -/

-- FormalScheme.etaleSiteEquiv: not stated here; needs formal schemes and their étale sites
--   (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicEtaleGeometry:A1)

/-! ## AdicSpacesPartII:R2/frobenius-lift-etale-over-torus (lemma) -/

namespace FormalScheme

/-- R2/frobenius-lift-etale-over-torus, general form: if `A → R` is a map of `p`-adically complete
rings that is étale modulo every `p ^ (m + 1)`, a Frobenius lift `φ_A` of `A` extends uniquely to a
Frobenius lift of `R`. -/
theorem exists_unique_frobeniusLift_of_etale (p : ℕ) [Fact p.Prime] {A R : Type*} [CommRing A]
    [CommRing R] [Algebra A R] [IsAdicComplete (Ideal.span {(p : A)}) A]
    [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hét : ∀ m : ℕ, Algebra.Etale (A ⧸ Ideal.span {(p : A) ^ (m + 1)})
      (R ⧸ (Ideal.span {(p : A) ^ (m + 1)}).map (algebraMap A R)))
    (φA : A →+* A) (hφA : ∀ a, φA a - a ^ p ∈ Ideal.span {(p : A)}) :
    ∃! φR : R →+* R, φR.comp (algebraMap A R) = (algebraMap A R).comp φA ∧
      ∀ r, φR r - r ^ p ∈ Ideal.span {(p : R)} := sorry

/-- R2/frobenius-lift-etale-over-torus: for `κ` perfect of characteristic `p` and
`R` `p`-adically complete and étale (modulo every `p ^ (m + 1)`) over the torus
`W(κ)[T₁^{±1}, …, T_d^{±1}]`, there is a unique ring endomorphism of `R` that is
Witt-Frobenius-semilinear, sends `Tᵢ ↦ Tᵢ ^ p`, and lifts Frobenius modulo `p`. -/
theorem exists_unique_frobeniusLift (p : ℕ) [Fact p.Prime] {κ : Type*} [Field κ] [CharP κ p]
    [PerfectRing κ p] {d : ℕ} {R : Type*} [CommRing R]
    [Algebra (Localization.Away (∏ i, MvPolynomial.X i : MvPolynomial (Fin d) (WittVector p κ))) R]
    [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hét : ∀ m : ℕ, Algebra.Etale
      (Localization.Away (∏ i, MvPolynomial.X i : MvPolynomial (Fin d) (WittVector p κ)) ⧸
        Ideal.span {(p : Localization.Away
          (∏ i, MvPolynomial.X i : MvPolynomial (Fin d) (WittVector p κ))) ^ (m + 1)})
      (R ⧸ (Ideal.span {(p : Localization.Away
          (∏ i, MvPolynomial.X i : MvPolynomial (Fin d) (WittVector p κ))) ^ (m + 1)}).map
        (algebraMap _ R))) :
    let ι : MvPolynomial (Fin d) (WittVector p κ) →+* R :=
      (algebraMap (Localization.Away
          (∏ i, MvPolynomial.X i : MvPolynomial (Fin d) (WittVector p κ))) R).comp
        (algebraMap _ _)
    ∃! φ : R →+* R, (∀ i, φ (ι (MvPolynomial.X i)) = ι (MvPolynomial.X i) ^ p) ∧
      (∀ a : WittVector p κ,
        φ (ι (MvPolynomial.C a)) = ι (MvPolynomial.C (WittVector.frobenius a))) ∧
      ∀ r, φ r - r ^ p ∈ Ideal.span {(p : R)} := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/residue-disc (lemma) -/

-- FormalScheme.residueDiscIso: not stated here; needs smooth formal schemes, tubes and the open
--   unit polydisc as adic spaces (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/fractional-valuation-bound (definition) -/

namespace ValuationSpectrum

section FracPow

variable {A : Type*} [CommRing A]

/-- R2/fractional-valuation-bound: `fracPowLE f g q = {v ∈ Spv A : |f(v)| ≤ |g(v)| ^ q}`, read as
`v(f ^ b) ≤ v(g ^ a)` for `q = a / b` in lowest terms; no element `g ^ q` is used. -/
def fracPowLE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (f ^ q.den) (g ^ q.num)}

/-- R2/fractional-valuation-bound: `fracPowGE f g q = {v ∈ Spv A : |f(v)| ≥ |g(v)| ^ q}`, read as
`v(f ^ b) ≥ v(g ^ a)` for `q = a / b` in lowest terms. -/
def fracPowGE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (g ^ q.num) (f ^ q.den)}

/-- R2/fractional-valuation-bound (characterisation): any representative `q = a / b`, `b > 0`,
may be used. -/
theorem mem_fracPowLE_iff {f g : A} {q : ℚ≥0} {a b : ℕ} (hb : 0 < b) (hq : q = a / b)
    {v : Spv A} : v ∈ fracPowLE f g q ↔ v.toValuativeRel.vle (f ^ b) (g ^ a) := sorry

/-- R2/fractional-valuation-bound: at a natural number `n`,
`fracPowLE f g n = {v(f) ≤ v(g ^ n)}`. -/
@[simp]
theorem fracPowLE_natCast (f g : A) (n : ℕ) :
    fracPowLE f g n = {v : Spv A | v.toValuativeRel.vle f (g ^ n)} := sorry

/-- R2/fractional-valuation-bound (compatibility): for a unit `g`,
`fracPowLE f g q ∩ Spa(A, A⁺) = R({f ^ b, g ^ a} / g ^ a)`. -/
theorem fracPowLE_inter_spa [TopologicalSpace A] [DecidableEq A] (Aplus : Subring A)
    (f : A) {g : A} (hg : IsUnit g) (q : ℚ≥0) :
    fracPowLE f g q ∩ spa Aplus = rationalSubset Aplus {f ^ q.den, g ^ q.num} (g ^ q.num) := sorry

/-- R2/fractional-valuation-bound (compatibility): for a unit `g`,
`fracPowGE f g q ∩ Spa(A, A⁺) = R({g ^ a, f ^ b} / f ^ b)`. -/
theorem fracPowGE_inter_spa [TopologicalSpace A] [DecidableEq A] (Aplus : Subring A)
    (f : A) {g : A} (hg : IsUnit g) (q : ℚ≥0) :
    fracPowGE f g q ∩ spa Aplus = rationalSubset Aplus {g ^ q.num, f ^ q.den} (f ^ q.den) := sorry

/-- R2/fractional-valuation-bound (relation): on `{v(g) ≤ 1}`, `fracPowLE f g ·` decreases and
`fracPowGE f g ·` increases with `q`. -/
theorem fracPowLE_mono (f g : A) {q q' : ℚ≥0} (h : q ≤ q') :
    fracPowLE f g q' ∩ {v | v.toValuativeRel.vle g 1} ⊆ fracPowLE f g q ∧
      fracPowGE f g q ∩ {v | v.toValuativeRel.vle g 1} ⊆ fracPowGE f g q' := sorry

/-- R2/fractional-valuation-bound (functoriality): preimages under `Spv φ`. -/
theorem comap_fracPowLE {B : Type*} [CommRing B] (φ : A →+* B) (f g : A) (q : ℚ≥0) :
    comap φ ⁻¹' fracPowLE f g q = fracPowLE (φ f) (φ g) q := sorry

/-- R2/fractional-valuation-bound (compatibility), the second convention: if `c ^ b = g ^ a u` with
`u, u⁻¹ ∈ A⁺` and `q = a / b`, then on `Spa(A, A⁺)`, `|f| ≤ |g| ^ q` iff `|f| ≤ |c|`. -/
theorem fracPowLE_iff_of_pow_eq [TopologicalSpace A] {Aplus : Subring A} {f g c : A} {u : Aˣ}
    (hu : (u : A) ∈ Aplus) (hu' : ((u⁻¹ : Aˣ) : A) ∈ Aplus) {q : ℚ≥0} {a b : ℕ} (hb : 0 < b)
    (hq : q = a / b) (hc : c ^ b = g ^ a * u) {v : Spv A} (hv : v ∈ spa Aplus) :
    v ∈ fracPowLE f g q ↔ v.toValuativeRel.vle f c := sorry

/-- R2/fractional-valuation-bound (relation): multiplying `f` by a unit of `A⁺` does not change
the bounds on `Spa(A, A⁺)`. -/
theorem fracPowGE_mul_unit [TopologicalSpace A] {Aplus : Subring A} {u : Aˣ}
    (hu : (u : A) ∈ Aplus) (hu' : ((u⁻¹ : Aˣ) : A) ∈ Aplus) (f g : A) (q : ℚ≥0) :
    fracPowGE (u * f) g q ∩ spa Aplus = fracPowGE f g q ∩ spa Aplus ∧
      fracPowLE (u * f) g q ∩ spa Aplus = fracPowLE f g q ∩ spa Aplus := sorry

/-- R2/fractional-valuation-bound (relation): `|f ^ n| ≤ |g| ^ (n q)` iff `|f| ≤ |g| ^ q`. -/
theorem fracPowLE_pow (f g : A) (q : ℚ≥0) {n : ℕ} (hn : 0 < n) :
    fracPowLE (f ^ n) g (n * q) = fracPowLE f g q := sorry

/-- R2/fractional-valuation-bound (relation): the bounds multiply. -/
theorem fracPowLE_mul (f f' g : A) (q q' : ℚ≥0) :
    fracPowLE f g q ∩ fracPowLE f' g q' ⊆ fracPowLE (f * f') g (q + q') := sorry

end FracPow

/- On `ℚ_p[T] ⊆ ℚ_p⟨T⟩` (pull back along the inclusion with `comap_fracPowLE`): the half disc is
`{v(T²) ≤ v(p)}`; the classical point `T = p` lies in it, `T = 1` does not, and a `ℚ_p`-point
`T = c` lies in it iff `|c| ≤ p⁻¹`, so it has no `ℚ_p`-point with `|T| = p ^ (-1/2)`. -/
-- test fracPowLE_test_halfDisc (computation) [R2/fractional-valuation-bound]
example (p : ℕ) [Fact p.Prime] :
    let pt : ℚ_[p] → Spv (Polynomial ℚ_[p]) := fun c ↦
      ofValuation (Padic.mulValuation.comap (Polynomial.evalRingHom c))
    let D := fracPowLE (Polynomial.X : Polynomial ℚ_[p]) (Polynomial.C (p : ℚ_[p])) (1 / 2)
    D = {v | v.toValuativeRel.vle (Polynomial.X ^ 2) (Polynomial.C (p : ℚ_[p]))} ∧
      pt p ∈ D ∧ pt 1 ∉ D ∧ ∀ c : ℚ_[p], pt c ∈ D ↔ ‖c‖ ≤ (p : ℝ)⁻¹ := sorry

/- The representative `2/4` of `1/2` gives the same set. -/
-- test fracPowLE_test_representative (characterisation) [R2/fractional-valuation-bound]
example {A : Type*} [CommRing A] (f g : A) (v : Spv A) :
    (v ∈ fracPowLE f g (1 / 2) ↔ v.toValuativeRel.vle (f ^ 4) (g ^ 2)) ∧
      (v ∈ fracPowLE f g (1 / 2) ↔ v.toValuativeRel.vle (f ^ 2) g) := sorry

/- Rounding the exponent `1/2` down to `0` gives a different set: the unit disc. -/
-- test fracPowLE_test_rounding (non-example) [R2/fractional-valuation-bound]
example (p : ℕ) [Fact p.Prime] :
    fracPowLE (Polynomial.X : Polynomial ℚ_[p]) (Polynomial.C (p : ℚ_[p])) 0 ≠
      fracPowLE (Polynomial.X : Polynomial ℚ_[p]) (Polynomial.C (p : ℚ_[p])) (1 / 2) := sorry

/- After adjoining `c` with `c² = g u` (`u, u⁻¹ ∈ B⁺`; for `L = ℚ_p(√p)`, `c = √p`, `g = p`), the
preimage of the half disc is `{v(f) ≤ v(c)}`. -/
-- test fracPowLE_test_root (compatibility) [R2/fractional-valuation-bound]
example {A B : Type*} [CommRing A] [CommRing B] [TopologicalSpace B] (φ : A →+* B)
    (Bplus : Subring B) (f g : A) (c : B) (u : Bˣ) (hu : (u : B) ∈ Bplus)
    (hu' : ((u⁻¹ : Bˣ) : B) ∈ Bplus) (hc : c ^ 2 = φ g * u) :
    comap φ ⁻¹' fracPowLE f g (1 / 2) ∩ spa Bplus =
      {v | v.toValuativeRel.vle (φ f) c} ∩ spa Bplus := sorry

/- At `q = 0` the bounds are `|f| ≤ 1` and `|f| ≥ 1`. -/
-- test fracPowLE_test_zero (degenerate) [R2/fractional-valuation-bound]
example {A : Type*} [CommRing A] (f g : A) :
    fracPowLE f g 0 = {v | v.toValuativeRel.vle f 1} ∧
      fracPowGE f g 0 = {v | v.toValuativeRel.vle 1 f} := sorry

end ValuationSpectrum

/-! ## AdicSpacesPartII:R2/section-valuation-domain (construction) -/

-- FormalScheme.sectionDomainGE: not stated here; needs invertible sheaves on formal schemes and
--   the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.sectionDomainLE: not stated here; needs invertible sheaves on formal schemes and
--   the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.sectionDomainGE_of_trivialization: not stated here; needs invertible sheaves on
--   formal schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5). Ring-level core:
--   `ValuationSpectrum.fracPowGE_inter_spa` [simp]
-- FormalScheme.sectionDomainGE_indep_generator: not stated here; needs invertible sheaves on
--   formal schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation]
-- FormalScheme.isOpen_sectionDomainGE: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [other]
-- FormalScheme.sectionDomainGE_preimage: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [functoriality]
-- FormalScheme.sectionDomainGE_congr: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5). Ring-level core: `FormalScheme.sectionDomainGE_congr_affine`
--   [characterisation]
-- FormalScheme.sectionDomainGE_ofMod: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.sectionDomainGE_mono: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [relation]
-- FormalScheme.sectionDomainGE_zero: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [example]
-- FormalScheme.sectionDomainGE_pow: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [relation]
-- FormalScheme.sectionDomainGE_tensor: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [relation]
-- sectionDomain_test_projectiveLine: not stated here; needs invertible sheaves on formal schemes
--   and the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [computation test]
-- sectionDomain_test_generatorIndependence: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation
--   test]
-- sectionDomain_test_liftIndependence: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation
--   test]
-- sectionDomain_test_integralStructure: not stated here; needs invertible sheaves on formal
--   schemes and the generic fibre d(X) (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [non-example test]
-- sectionDomain_test_degenerate: not stated here; needs invertible sheaves on formal schemes and
--   the generic fibre d(X) (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [degenerate test]

namespace FormalScheme

open ValuationSpectrum

/-- R2/section-valuation-domain, ring-level core of `FormalScheme.sectionDomainGE_congr`: on
`Spa(A, A⁺)` with a pseudouniformiser `ϖ ∈ A⁺`, changing `s` by `ϖ ^ c t` with `t ∈ A⁺` and
`c > q` does not change `{|s| ≥ |ϖ| ^ q}`. -/
theorem sectionDomainGE_congr_affine {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (Aplus : Subring A) {ϖ s t : A} (hϖ : Huber.IsPseudoUniformizer ϖ)
    (hϖA : ϖ ∈ Aplus) (ht : t ∈ Aplus) {c : ℕ} {q : ℚ≥0} (hqc : q < c) :
    fracPowGE (s + ϖ ^ c * t) ϖ q ∩ spa Aplus = fracPowGE s ϖ q ∩ spa Aplus := sorry

end FormalScheme

/-! ## AdicSpacesPartII:R2/section-domain-formal-model (construction) -/

-- FormalScheme.sectionDomainModel: not stated here; needs admissible formal schemes and their
--   admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [constructor]
-- FormalScheme.sectionDomainModel.toBlowUp: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [structure]
-- FormalScheme.sectionDomainModel_affine: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [simp]
-- FormalScheme.sectionDomainModel.homEquiv: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [universal-property]
-- FormalScheme.sectionDomainModel.u_mul_s: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [data]
-- FormalScheme.sectionDomainModel_genericFibre: not stated here; needs admissible formal schemes
--   and their admissible blow-ups (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [compatibility]
-- FormalScheme.sectionDomainModel_isoOfLift: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [equivalence]
-- FormalScheme.sectionDomainModel_isoOfAssociated: not stated here; needs admissible formal
--   schemes and their admissible blow-ups (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [equivalence]
-- FormalScheme.sectionDomainModel_flat_of_isRegular: not stated here; needs admissible formal
--   schemes and their admissible blow-ups (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme) [other]
-- FormalScheme.sectionDomainModel_mapOfDvd: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [functoriality]
-- sectionDomainModel_test_annulus: not stated here; needs admissible formal schemes and their
--   admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [computation test]
-- sectionDomainModel_test_torsion: not stated here; needs admissible formal schemes and their
--   admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [non-example test]
-- sectionDomainModel_test_points: not stated here; needs admissible formal schemes and their
--   admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [characterisation test]
-- sectionDomainModel_test_unitThreshold: not stated here; needs admissible formal schemes and
--   their admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [degenerate test]
-- sectionDomainModel_test_scholze: not stated here; needs admissible formal schemes and their
--   admissible blow-ups (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme)
--   [compatibility test]

/-! ## AdicSpacesPartII:R2/hasse-domain (construction) -/

-- FormalScheme.hasseDomain: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.hasseDomain_eq_sectionDomainGE: not stated here; needs formal schemes, their
--   generic fibres and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [characterisation]
-- FormalScheme.hasseDomain_indep_lift: not stated here; needs formal schemes, their generic
--   fibres and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5). Ring-level core:
--   `FormalScheme.sectionDomainGE_congr_affine (with ϖ := p, c := 1)` [characterisation]
-- FormalScheme.hasseDomainModel: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [constructor]
-- FormalScheme.hasseDomainModel.homEquiv: not stated here; needs formal schemes, their generic
--   fibres and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5)
--   [universal-property]
-- FormalScheme.hasseDomainModel_genericFibre: not stated here; needs formal schemes, their
--   generic fibres and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [compatibility]
-- FormalScheme.hasseDomainModel_isoOfLift: not stated here; needs formal schemes, their generic
--   fibres and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [equivalence]
-- FormalScheme.hasseDomain_zero: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [example]
-- FormalScheme.hasseDomain_mono: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [relation]
-- FormalScheme.hasseDomain_preimage: not stated here; needs formal schemes, their generic fibres
--   and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [functoriality]
-- FormalScheme.hasseDomainModel_flat: not stated here; needs formal schemes, their generic fibres
--   and invertible sheaves on them (supplier:
--   AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpaces Layer 5) [other]
-- hasseDomain_test_toy: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [computation test]
-- hasseDomain_test_liftAtOne: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [non-example test]
-- hasseDomain_test_ordinary: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [degenerate test]
-- hasseDomain_test_scholze: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [compatibility test]
-- hasseDomain_test_noRoot: not stated here; needs formal schemes, their generic fibres and
--   invertible sheaves on them (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5) [non-example test]

/-! ## AdicSpacesPartII:R2/hasse-domain-transition-maps (lemma) -/

-- FormalScheme.hasseDomainModel.transition: not stated here; needs formal schemes and the Hasse
--   domain models (supplier: AdicSpacesPartII:F0/locally-noetherian-formal-scheme,
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R2/hasse-loci-admissible-opens (construction) -/

-- AdicSpace.hasseInvariantValue: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [data]
-- AdicSpace.hasseLocusGT: not stated here; needs generalized elliptic curves over adic spaces
--   (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [constructor]
-- AdicSpace.hasseLocusGE: not stated here; needs generalized elliptic curves over adic spaces
--   (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [constructor]
-- AdicSpace.isOpen_hasseLocusGE: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [other]
-- AdicSpace.hasseLocusGE_quasiCompact: not stated here; needs generalized elliptic curves over
--   adic spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [other]
-- AdicSpace.hasseLocus_baseChange: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [compatibility]
-- AdicSpace.hasseLocus_extendScalars: not stated here; needs generalized elliptic curves over
--   adic spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [compatibility]
-- AdicSpace.iUnion_hasseLocusGE: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [relation]
-- AdicSpace.hasseLocusGE_local: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [characterisation]
-- AdicSpace.hasseLocusGE_eq_hasseDomain: not stated here; needs generalized elliptic curves over
--   adic spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [compatibility]
-- hasseLocus_test_ordinary: not stated here; needs generalized elliptic curves over adic spaces
--   (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [computation test]
-- hasseLocus_test_floor: not stated here; needs generalized elliptic curves over adic spaces
--   (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [degenerate test]
-- hasseLocus_test_withoutMax: not stated here; needs generalized elliptic curves over adic spaces
--   (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [non-example test]
-- hasseLocus_test_hasseDomain: not stated here; needs generalized elliptic curves over adic
--   spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [compatibility test]
-- hasseLocus_test_fractionalThreshold: not stated here; needs generalized elliptic curves over
--   adic spaces (supplier: ModularCurvesPartII:R13.1, AdicSpaces Layer 5) [characterisation test]

end TauCeti

end

/-! # Layer R3. Coherent sheaves, vector bundles, proper direct images, GAGA and traces -/

noncomputable section

namespace TauCeti

open Filter Topology TensorProduct Huber

/-! # AdicSpacesPartII R3: coherent sheaves, vector bundles, proper direct images, GAGA, traces

Everything about sheaves on adic spaces needs the anchor's category of adic spaces (AdicSpaces
Layer 5) and is a comment. The ring-level cores (Čech complexes of localisations, completion of
strict complexes, glueing squares, completely continuous maps, uniform rings, finite projective
traces) and the scheme-level trace are stated. -/

/-! ## AdicSpacesPartII:R3/associated-module-sheaf (construction) -/

-- AdicSpace.tilde: not stated here; needs presheaves of topological 𝒪_X-modules on
--   Spa(A, A⁺) and the structure presheaf on rational subsets (supplier: AdicSpaces Layer 3).
--   Its value on a rational subset is `M ⊗[A] A⟨T/s⟩` with `A⟨T/s⟩` Tau Ceti's
--   `Huber.PairOfDefinition.completionLocObj`.
-- AdicSpace.tilde_obj_rationalSubset: not stated here; needs `AdicSpace.tilde`, that is the
--   structure presheaf on rational subsets (supplier: AdicSpaces Layer 3)
-- AdicSpace.tilde_map: not stated here; needs `AdicSpace.tilde` (supplier: AdicSpaces Layer 3)
-- AdicSpace.tildeRestrictIso: not stated here; needs restriction of presheaves to rational
--   subsets and `Spa` of the coordinate pair (supplier: AdicSpaces Layer 3)
-- AdicSpace.tildeSelfIso: not stated here; needs the structure presheaf 𝒪_X as a presheaf of
--   topological modules (supplier: AdicSpaces Layer 3)
-- AdicSpace.tildeTensorIso: not stated here; needs `AdicSpace.tilde` (supplier: AdicSpaces
--   Layer 3)
-- AdicSpace.tilde_exact: not stated here; needs `AdicSpace.tilde` (supplier: AdicSpaces Layer 3).
--   Its ring-level core is Tau Ceti's `Huber.PairOfDefinition.flat_toCompletionLoc` (the map
--   `A → A⟨T/s⟩` is flat for a complete strongly noetherian Tate ring), used as it stands.
-- AdicSpace.completeSpace_tilde_obj: not stated here; needs `AdicSpace.tilde` (supplier:
--   AdicSpaces Layer 3). Its strictness half is Tau Ceti's `Huber.isStrictMap_of_module_finite`.
-- AdicSpace.tilde_obj_top: not stated here; needs `AdicSpace.tilde` and `𝒪_X(X) = A`
--   (supplier: AdicSpaces Layer 3)
-- AdicSpace.tilde_test_quotient: not stated here; needs `AdicSpace.tilde` on `Spa(K⟨T⟩)`
--   (supplier: AdicSpaces Layer 3) [computation test]
-- AdicSpace.tilde_test_zero_and_self: not stated here; needs `AdicSpace.tilde` and 𝒪_X
--   (supplier: AdicSpaces Layer 3) [degenerate test]
-- AdicSpace.tilde_test_not_algebraic_localisation: not stated here; needs the Laurent Tate
--   algebra `ℚ_p⟨T, T⁻¹⟩` as a rational localisation of `ℚ_p⟨T⟩` (supplier: AdicSpaces
--   Layer 3) [non-example test]
-- AdicSpace.tilde_test_completed_tensor: not stated here; needs completed tensor products of
--   topological modules over Huber rings (supplier: AdicSpacesPartII:R0/completed-tensor-product)
--   [compatibility test]

namespace AdicSpace

/-! ## AdicSpacesPartII:R3/tate-acyclicity-finite-modules (theorem) -/

-- AdicSpace.tilde_isAcyclic: not stated here; needs `AdicSpace.tilde` as a sheaf of topological
--   𝒪_X-modules and its sheaf cohomology on rational subsets (supplier: AdicSpaces Layer 4)

/-! ## AdicSpacesPartII:R3/noetherian-rod-acyclicity-finite-modules (theorem) -/

-- AdicSpace.tilde_isAcyclic_of_noetherianRingOfDefinition: not stated here; needs
--   `AdicSpace.tilde` and sheaf cohomology on rational subsets (supplier: AdicSpaces Layer 4)

/-! ## AdicSpacesPartII:R3/rational-covering-reduction (lemma) -/

section RationalCovering

open ValuationSpectrum

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- R3/rational-covering-reduction (Kedlaya–Liu Proposition 2.4.20): let `(A, A⁺)` be a Tate
Huber pair and `P U 𝔘` a property of finite coverings `𝔘` of rational subsets `U` of
`Spa(A, A⁺)` by rational subsets. If `P` is local (it passes from a refinement to the covering),
transitive (it passes to composite coverings) and holds for every simple Laurent covering
`{U ∩ {v(f) ≤ 1}, U ∩ {v(f) ≥ 1}}`, then it holds for every finite rational covering of every
rational subset. Rational subsets are Tau Ceti's `spaRationalFamily`; the Laurent pieces are
`R({f, 1}/1)` and `R({1}/f)`. -/
theorem rationalCovering_induction [DecidableEq A] (S : Huber.Pair A)
    (P : Set (spa S.plus) → Set (Set (spa S.plus)) → Prop)
    (hlocal : ∀ U (𝔘 𝔙 : Set (Set (spa S.plus))), 𝔘.Finite → 𝔙.Finite →
      (∀ V ∈ 𝔘, V ∈ spaRationalFamily S.plus) → (∀ V ∈ 𝔙, V ∈ spaRationalFamily S.plus) →
      ⋃₀ 𝔘 = U → ⋃₀ 𝔙 = U → (∀ V ∈ 𝔙, ∃ W ∈ 𝔘, V ⊆ W) → P U 𝔙 → P U 𝔘)
    (htrans : ∀ U (𝔘 : Set (Set (spa S.plus))) (𝔚 : Set (spa S.plus) → Set (Set (spa S.plus))),
      𝔘.Finite → (∀ V ∈ 𝔘, V ∈ spaRationalFamily S.plus) → ⋃₀ 𝔘 = U → P U 𝔘 →
      (∀ V ∈ 𝔘, (𝔚 V).Finite ∧ (∀ W ∈ 𝔚 V, W ∈ spaRationalFamily S.plus) ∧
        ⋃₀ 𝔚 V = V ∧ P V (𝔚 V)) →
      P U (⋃ V ∈ 𝔘, 𝔚 V))
    (hlaurent : ∀ U ∈ spaRationalFamily S.plus, ∀ f : A,
      P U {U ∩ Subtype.val ⁻¹' rationalSubset S.plus {f, 1} 1,
        U ∩ Subtype.val ⁻¹' rationalSubset S.plus {1} f})
    (U : Set (spa S.plus)) (hU : U ∈ spaRationalFamily S.plus) (𝔘 : Set (Set (spa S.plus)))
    (h𝔘 : 𝔘.Finite) (h𝔘r : ∀ V ∈ 𝔘, V ∈ spaRationalFamily S.plus) (hcov : ⋃₀ 𝔘 = U) :
    P U 𝔘 :=
  sorry

end RationalCovering

/-! ## AdicSpacesPartII:R3/cech-acyclicity-simple-laurent-reduction (lemma) -/

-- AdicSpace.cechAcyclic_of_simpleLaurent: not stated here; needs the structure presheaf `𝒪_X`
--   on rational subsets (the functions `f ∈ 𝒪_X(U)` defining the simple Laurent coverings of a
--   rational `U`) and presheaves on the rational subsets of `Spa(A, A⁺)` (supplier: AdicSpaces
--   Layer 3). Its combinatorial engine is `AdicSpace.rationalCovering_induction` together with
--   `cechHomology_iso_of_refinement`.

/-! ## AdicSpacesPartII:R3/sheafy-cech-acyclicity (theorem) -/

-- AdicSpace.sheafy_cechAcyclic: not stated here; needs the structure presheaf `𝒪_X` of
--   `Spa(A, A⁺)` and the sheafiness predicate `Huber.IsSheafyPair` (supplier: AdicSpaces
--   Layers 3–4) and sheaf cohomology on rational subsets (supplier: AdicSpaces Layer 4). Part (1)
--   is `IsCechAcyclic` for the structure presheaf on every finite rational covering.

end AdicSpace

/-! ## AdicSpacesPartII:R3/simple-laurent-difference-surjective (lemma) -/

-- Huber.simpleLaurent_difference_surjective: not stated here; needs the restriction maps
--   `A⟨f⟩ → A⟨f, 1/f⟩ ← A⟨1/f⟩` between the rational localisations of `R({f, 1}/1)`,
--   `R({1, f}/f)` and `R({1, f, f²}/f)` (Tau Ceti `PairOfDefinition.completionLocObj` gives the
--   rings; the restriction maps are anchor Layer 3). The conclusion is the surjectivity field
--   `Huber.GlueingSquare.surjective_sub` for that square.

/-! ## AdicSpacesPartII:R3/cech-double-complex-comparison (lemma) -/

section DoubleComplex

/-- R3/cech-double-complex-comparison (Stacks Tag 00M1, cohomological form): let `K^{p,q}` be a
first-quadrant double complex of abelian groups with commuting differentials `d₁ = d′`,
`d₂ = d″`, and let `C^•`, `R^•` be complexes with augmentations `ε₁ : C^p → K^{p,0}` (commuting
with `d′`) and `ε₂ : R^q → K^{0,q}` (commuting with `d″`) such that every augmented column
`0 → C^p → K^{p,0} → K^{p,1} → ⋯` and every augmented row `0 → R^q → K^{0,q} → K^{1,q} → ⋯` is
exact. Then `Hⁿ(C^•) ≅ Hⁿ(R^•)` for every `n` (both are quasi-isomorphic to `Tot(K)`); here
`H⁰ = ker d⁰` and `Hⁿ⁺¹ = ker dⁿ⁺¹ / im dⁿ`. -/
theorem doubleComplex_edges_homology_equiv {K : ℕ → ℕ → Type*} [∀ p q, AddCommGroup (K p q)]
    (d₁ : ∀ p q, K p q →+ K (p + 1) q) (d₂ : ∀ p q, K p q →+ K p (q + 1))
    (hd₁ : ∀ p q, (d₁ (p + 1) q).comp (d₁ p q) = 0)
    (hd₂ : ∀ p q, (d₂ p (q + 1)).comp (d₂ p q) = 0)
    (hcomm : ∀ p q, (d₂ (p + 1) q).comp (d₁ p q) = (d₁ p (q + 1)).comp (d₂ p q))
    {C R : ℕ → Type*} [∀ n, AddCommGroup (C n)] [∀ n, AddCommGroup (R n)]
    (dC : ∀ n, C n →+ C (n + 1)) (dR : ∀ n, R n →+ R (n + 1))
    (hdC : ∀ n, (dC (n + 1)).comp (dC n) = 0) (hdR : ∀ n, (dR (n + 1)).comp (dR n) = 0)
    (ε₁ : ∀ p, C p →+ K p 0) (ε₂ : ∀ q, R q →+ K 0 q)
    (hε₁ : ∀ p, (d₁ p 0).comp (ε₁ p) = (ε₁ (p + 1)).comp (dC p))
    (hε₂ : ∀ q, (d₂ 0 q).comp (ε₂ q) = (ε₂ (q + 1)).comp (dR q))
    (hcol : ∀ p, Function.Injective (ε₁ p) ∧ Function.Exact (ε₁ p) (d₂ p 0) ∧
      ∀ q, Function.Exact (d₂ p q) (d₂ p (q + 1)))
    (hrow : ∀ q, Function.Injective (ε₂ q) ∧ Function.Exact (ε₂ q) (d₁ 0 q) ∧
      ∀ p, Function.Exact (d₁ p q) (d₁ (p + 1) q)) :
    Nonempty ((dC 0).ker ≃+ (dR 0).ker) ∧
      ∀ n, Nonempty ((dC (n + 1)).ker ⧸ (dC n).range.addSubgroupOf (dC (n + 1)).ker ≃+
        (dR (n + 1)).ker ⧸ (dR n).range.addSubgroupOf (dR (n + 1)).ker) :=
  sorry

end DoubleComplex

/-! ## AdicSpacesPartII:R3/cech-acyclicity-refinement (lemma) -/

section CechRefinement

open CategoryTheory Limits Opposite _root_.TopologicalSpace

universe u

variable {X : Type u} [TopologicalSpace X] (F : (Opens X)ᵒᵖ ⥤ AddCommGrpCat.{u})

/-- R3/cech-acyclicity-refinement: a family `V` of opens contained in `U` is `F`-acyclic if the
augmented Čech complex `0 → F(U) → C⁰ → C¹ → ⋯` is exact, where `C^•` is Mathlib's Čech complex
`cechComplexFunctor V` (indexed by all tuples; it has the cohomology of the alternating one) and
the augmentation is restriction. A presheaf on a basis `ℬ` closed under finite intersections is
the restriction of its right Kan extension to all opens, so nothing is lost by taking `F` on
`Opens X`. -/
def IsCechAcyclic {ι : Type u} (U : Opens X) (V : ι → Opens X) (hV : ∀ i, V i ≤ U) : Prop :=
  let C := (cechComplexFunctor V).obj F
  let ε : F.obj (op U) ⟶ C.X 0 :=
    Pi.lift fun i ↦ F.map (Pi.π (fun a ↦ V (i a)) 0 ≫ homOfLE (hV (i 0))).op
  Function.Injective ε.hom ∧ (∀ x, (C.d 0 1).hom x = 0 ↔ ∃ s, ε.hom s = x) ∧
    ∀ n, C.ExactAt (n + 1)

/-- R3/cech-acyclicity-refinement: let `𝔙 = (Vᵢ)` and `𝔚 = (W_j)` be finite coverings of `U`
with `𝔚` refining `𝔙`. If for every tuple `i₀, …, i_p` the covering `𝔚 ∩ V_{i₀…i_p}` of
`V_{i₀…i_p}` is `F`-acyclic, then `Ȟⁿ(U, F; 𝔙) ≅ Ȟⁿ(U, F; 𝔚)` for every `n`, and `𝔙` is
`F`-acyclic if and only if `𝔚` is. -/
theorem cechHomology_iso_of_refinement {ι κ : Type u} [Finite ι] [Finite κ] (U : Opens X)
    (V : ι → Opens X) (W : κ → Opens X) (hV : ∀ i, V i ≤ U) (hW : ∀ j, W j ≤ U)
    (hVU : U ≤ ⨆ i, V i) (hWU : U ≤ ⨆ j, W j) (hWV : ∀ j, ∃ i, W j ≤ V i)
    (hacyc : ∀ (p : ℕ) (i : Fin (p + 1) → ι),
      IsCechAcyclic F (⨅ a, V (i a)) (fun j ↦ W j ⊓ ⨅ a, V (i a)) fun _ ↦ inf_le_right) :
    (∀ n, Nonempty (((cechComplexFunctor V).obj F).homology n ≅
      ((cechComplexFunctor W).obj F).homology n)) ∧
      (IsCechAcyclic F U V hV ↔ IsCechAcyclic F U W hW) :=
  sorry

end CechRefinement

/-! ## AdicSpacesPartII:R3/glueing-square (definition) -/

namespace Huber

section GlueingSquare

variable (R R₁ R₂ R₁₂ : Type*) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]
  [UniformSpace R₁] [IsUniformAddGroup R₁] [IsTopologicalRing R₁] [IsTateRing R₁]
  [CompleteSpace R₁] [T2Space R₁]
  [UniformSpace R₂] [IsUniformAddGroup R₂] [IsTopologicalRing R₂] [IsTateRing R₂]
  [CompleteSpace R₂] [T2Space R₂]
  [UniformSpace R₁₂] [IsUniformAddGroup R₁₂] [IsTopologicalRing R₁₂] [IsTateRing R₁₂]
  [CompleteSpace R₁₂] [T2Space R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] [Algebra R R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]

/-- R3/glueing-square: a *glueing square* (Kedlaya–Liu Definition 2.7.3) is a commutative square
of complete Hausdorff Tate rings `R → R₁, R₂ → R₁₂` (the scalar towers make it commute) with
continuous maps such that (a) `0 → R → R₁ × R₂ → R₁₂ → 0`, `(r₁, r₂) ↦ r₁ − r₂`, is exact and
strict, (b) `R₂ → R₁₂` has dense range, and (c) every maximal ideal of `R` is the contraction of
a prime ideal of `R₁ × R₂`. -/
structure GlueingSquare : Prop where
  /-- `R → R₁` is continuous. -/
  continuous_algebraMap₁ : Continuous (algebraMap R R₁)
  /-- `R → R₂` is continuous. -/
  continuous_algebraMap₂ : Continuous (algebraMap R R₂)
  /-- `R₁ → R₁₂` is continuous. -/
  continuous_algebraMap₁₂ : Continuous (algebraMap R₁ R₁₂)
  /-- `R₂ → R₁₂` is continuous. -/
  continuous_algebraMap₂₁₂ : Continuous (algebraMap R₂ R₁₂)
  /-- `R → R₁ × R₂` is injective. -/
  injective : Function.Injective fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  /-- R3/glueing-square (`Huber.GlueingSquare.exact_sub`): (a) exactness at `R₁ × R₂`. -/
  exact_sub : Function.Exact (fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r))
    fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  /-- (a) `R₁ × R₂ → R₁₂` is surjective. -/
  surjective_sub : Function.Surjective fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  /-- (a) `R` carries the subspace topology of `R₁ × R₂`. -/
  isInducing : IsInducing fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  /-- R3/glueing-square (`Huber.GlueingSquare.isStrictMap_sub`): (a) `R₁ × R₂ → R₁₂` is strict
  (with surjectivity: open). -/
  isStrictMap_sub : IsStrictMap fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  /-- R3/glueing-square (`Huber.GlueingSquare.denseRange`): (b) `R₂ → R₁₂` has dense range. -/
  denseRange : DenseRange (algebraMap R₂ R₁₂)
  /-- R3/glueing-square (`Huber.GlueingSquare.exists_prime_comap_eq`): (c) every maximal ideal of
  `R` is the contraction of a prime ideal of `R₁ × R₂`. -/
  exists_prime_comap_eq : ∀ m : Ideal R, m.IsMaximal → ∃ p : Ideal (R₁ × R₂), p.IsPrime ∧
    p.comap ((algebraMap R R₁).prod (algebraMap R R₂)) = m

variable {R R₁ R₂ R₁₂} in
/-- R3/glueing-square: swapping `R₁` and `R₂` gives a glueing square when `R₁ → R₁₂` also has
dense range. -/
theorem GlueingSquare.symm (h : GlueingSquare R R₁ R₂ R₁₂)
    (hdense : DenseRange (algebraMap R₁ R₁₂)) : GlueingSquare R R₂ R₁ R₁₂ :=
  sorry

end GlueingSquare

section GlueingDatum

variable (R₁ R₂ R₁₂ : Type*) [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  (M₁ M₂ M₁₂ : Type*) [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

/-- R3/glueing-square: a *glueing datum* `(M₁, M₂, M₁₂, ψ₁, ψ₂)` on a glueing square: modules
over `R₁`, `R₂`, `R₁₂` with isomorphisms `ψᵢ : R₁₂ ⊗_{Rᵢ} Mᵢ ≅ M₁₂`. It is finite (resp. finite
projective) when the three modules are (`Module.Finite`, `Module.Projective`). -/
structure GlueingDatum where
  /-- `ψ₁ : R₁₂ ⊗_{R₁} M₁ ≅ M₁₂`. -/
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  /-- `ψ₂ : R₁₂ ⊗_{R₂} M₂ ≅ M₁₂`. -/
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

variable {R₁ R₂ R₁₂ M₁ M₂ M₁₂}

/-- R3/glueing-square: the module of sections `M = ker(ψ₁ − ψ₂ : M₁ × M₂ → M₁₂)` of a glueing
datum, an `R`-module through `R → R₁` and `R → R₂`; its maps to `Mᵢ` are the projections. -/
def GlueingDatum.sections (R : Type*) [CommRing R] [Algebra R R₁] [Algebra R R₂]
    [Algebra R R₁₂] [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂] [Module R M₁]
    [Module R M₂] [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Submodule R (M₁ × M₂) where
  carrier := {x | D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

variable (R₁ R₂ R₁₂) in
/-- R3/glueing-square: an `R`-module `N` gives the glueing datum
`(R₁ ⊗_R N, R₂ ⊗_R N, R₁₂ ⊗_R N)` with the canonical isomorphisms
`R₁₂ ⊗_{Rᵢ} (Rᵢ ⊗_R N) ≅ R₁₂ ⊗_R N`. -/
def GlueingDatum.ofModule (R : Type*) [CommRing R] [Algebra R R₁] [Algebra R R₂]
    [Algebra R R₁₂] [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
    (N : Type*) [AddCommGroup N] [Module R N] :
    GlueingDatum R₁ R₂ R₁₂ (R₁ ⊗[R] N) (R₂ ⊗[R] N) (R₁₂ ⊗[R] N) where
  ψ₁ := AlgebraTensorModule.cancelBaseChange R R₁ R₁₂ R₁₂ N
  ψ₂ := AlgebraTensorModule.cancelBaseChange R R₂ R₁₂ R₁₂ N

end GlueingDatum

section GlueingTests

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

-- Huber.GlueingSquare.test_laurent: not stated here; needs the Laurent algebras
--   `ℚ_p⟨T⁻¹⟩` and `ℚ_p⟨T, T⁻¹⟩` as rational localisations of `ℚ_p⟨T⟩` with their algebra
--   maps (supplier: AdicSpaces Layer 3) [computation test]

/- The degenerate square `R₁ = R`, `R₂ = R₁₂ = 0`. -/
-- test Huber.GlueingSquare.test_trivial (degenerate) [R3/glueing-square]
example (Z : Type*) [CommRing Z] [Subsingleton Z] [UniformSpace Z] [IsUniformAddGroup Z]
    [IsTopologicalRing Z] [IsTateRing Z] [CompleteSpace Z] [T2Space Z] [Algebra R Z] :
    GlueingSquare R R Z Z :=
  sorry

/- `R₁ = R₂ = R`, `R₁₂ = R × R` with the diagonal maps: `(a, b) ↦ (a − b, a − b)` is not
surjective, so condition (a) fails. -/
-- test Huber.GlueingSquare.test_not_dense (non-example) [R3/glueing-square]
example [Nontrivial R] : ¬ GlueingSquare R R R (R × R) :=
  sorry

-- Huber.GlueingSquare.test_compat_KL: not stated here; needs the Kedlaya–Liu norm
--   `|x| = inf {cⁿ : ϖ⁻ⁿ x ∈ R₀}` on a Tate ring as a Mathlib norm (supplier: AdicSpaces
--   Layer 0) [compatibility test]

end GlueingTests

/-! ## AdicSpacesPartII:R3/matrix-factorisation-strict-surjection (lemma) -/

/-- R3/matrix-factorisation-strict-surjection (Kedlaya–Liu Lemma 2.7.2): let `φ₁ : R₁ → S` and
`φ₂ : R₂ → S` be bounded homomorphisms of Banach rings such that `(x, y) ↦ φ₁ x + φ₂ y` is a
strict surjection. Then there is `c > 0` such that every invertible `U ∈ GLₙ(S)` with
`|U − 1| < c` (maximum of the entries) factors as `U = φ₁(U₁) φ₂(U₂)` with `Uᵢ ∈ GLₙ(Rᵢ)`. -/
theorem exists_mul_eq_of_norm_sub_one_lt {R₁ R₂ S : Type*} [NormedCommRing R₁]
    [NormedCommRing R₂] [NormedCommRing S] [CompleteSpace R₁] [CompleteSpace R₂]
    [CompleteSpace S] (φ₁ : R₁ →+* S) (φ₂ : R₂ →+* S)
    (hφ₁ : ∃ C, ∀ x, ‖φ₁ x‖ ≤ C * ‖x‖) (hφ₂ : ∃ C, ∀ x, ‖φ₂ x‖ ≤ C * ‖x‖)
    (hsurj : Function.Surjective fun x : R₁ × R₂ ↦ φ₁ x.1 + φ₂ x.2)
    (hopen : IsOpenMap fun x : R₁ × R₂ ↦ φ₁ x.1 + φ₂ x.2) :
    ∃ c > 0, ∀ (n : ℕ) (U : Matrix (Fin n) (Fin n) S), IsUnit U →
      (∀ i j, ‖(U - 1) i j‖ < c) →
      ∃ (U₁ : Matrix (Fin n) (Fin n) R₁) (U₂ : Matrix (Fin n) (Fin n) R₂),
        IsUnit U₁ ∧ IsUnit U₂ ∧ U = U₁.map φ₁ * U₂.map φ₂ :=
  sorry

/-! ## AdicSpacesPartII:R3/glueing-square-finite-surjectivity (lemma) -/

section GlueingModules

variable {R R₁ R₂ R₁₂ : Type*} [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]
  [UniformSpace R₁] [IsUniformAddGroup R₁] [IsTopologicalRing R₁] [IsTateRing R₁]
  [CompleteSpace R₁] [T2Space R₁]
  [UniformSpace R₂] [IsUniformAddGroup R₂] [IsTopologicalRing R₂] [IsTateRing R₂]
  [CompleteSpace R₂] [T2Space R₂]
  [UniformSpace R₁₂] [IsUniformAddGroup R₁₂] [IsTopologicalRing R₁₂] [IsTateRing R₁₂]
  [CompleteSpace R₁₂] [T2Space R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] [Algebra R R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
  {M₁ M₂ M₁₂ : Type*} [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂] [Module R M₁] [IsScalarTower R R₁ M₁]
  [Module R M₂] [IsScalarTower R R₂ M₂]

/-- R3/glueing-square-finite-surjectivity (Kedlaya–Liu Lemma 2.7.4): for a finite glueing
datum on a glueing square with module of sections `M`, (a) `Rᵢ ⊗_R M → Mᵢ` is surjective,
(b) `ψ₁ − ψ₂ : M₁ × M₂ → M₁₂` is surjective, and (c) some finitely generated `M₀ ⊆ M` already has
`Rᵢ ⊗_R M₀ → Mᵢ` surjective for `i = 1, 2`. -/
theorem GlueingDatum.surjective_baseChange_sections (h : GlueingSquare R R₁ R₂ R₁₂)
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) [Module.Finite R₁ M₁] [Module.Finite R₂ M₂]
    [Module.Finite R₁₂ M₁₂] :
    Function.Surjective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Surjective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Surjective (fun x : M₁ × M₂ ↦ D.ψ₁ (1 ⊗ₜ x.1) - D.ψ₂ (1 ⊗ₜ x.2)) ∧
      ∃ M₀ : Submodule R (D.sections R), M₀.FG ∧
        Function.Surjective (LinearMap.liftBaseChange R₁
          ((LinearMap.fst R M₁ M₂).comp ((D.sections R).subtype.comp M₀.subtype))) ∧
        Function.Surjective (LinearMap.liftBaseChange R₂
          ((LinearMap.snd R M₁ M₂).comp ((D.sections R).subtype.comp M₀.subtype))) :=
  sorry

/-! ## AdicSpacesPartII:R3/glueing-square-finite-projective-descent (lemma) -/

/-- R3/glueing-square-finite-projective-descent (Kedlaya–Liu Proposition 2.7.5): for a finite
projective glueing datum on a glueing square, the module of sections `M` is a finite projective
`R`-module and the natural maps `Rᵢ ⊗_R M → Mᵢ` are isomorphisms. -/
theorem GlueingDatum.projective_sections (h : GlueingSquare R R₁ R₂ R₁₂)
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂] [Module.Finite R₁₂ M₁₂]
    [Module.Projective R₁₂ M₁₂] :
    Module.Finite R (D.sections R) ∧ Module.Projective R (D.sections R) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) :=
  sorry

end GlueingModules

end Huber

/-! ## AdicSpacesPartII:R3/simple-laurent-glueing-square (lemma) -/

-- Huber.GlueingSquare.laurent: not stated here; needs the sheafiness predicate for Huber pairs
--   (supplier: AdicSpaces Layer 4) and the rational localisations `A⟨f⟩ → A⟨f, 1/f⟩ ← A⟨1/f⟩`
--   with their restriction maps as algebras (supplier: AdicSpaces Layer 3). Once these exist the
--   conclusion is `Huber.GlueingSquare A A⟨f⟩ A⟨1/f⟩ A⟨f, 1/f⟩`.

/-! ## AdicSpacesPartII:R3/strongly-noetherian-laurent-gluing (lemma) -/

-- AdicSpace.laurent_glueing_effective: not stated here; needs the simple Laurent glueing square
--   of `f` as rings (supplier: AdicSpaces Layer 3). Its conclusion is the effectivity of
--   `Huber.GlueingDatum`s on that square (`Huber.GlueingDatum.sections` is the module `M`).

/-! ## AdicSpacesPartII:R3/coherent-sheaf (definition) -/

-- AdicSpace.IsCoherent: not stated here; needs locally noetherian adic spaces with their
--   sheaves of 𝒪_X-modules (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/locally-noetherian-adic-space)
-- AdicSpace.Coh: not stated here; needs `AdicSpace.IsCoherent` (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCoherent.of_iso: not stated here; needs 𝒪_X-modules on adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.isCoherent_tilde: not stated here; needs `AdicSpace.tilde` as a sheaf (supplier:
--   AdicSpaces Layer 4)
-- AdicSpace.IsCoherent.restrict: not stated here; needs open subspaces of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.isCoherent_structureSheaf: not stated here; needs the structure sheaf of an adic
--   space (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCoherent.isFiniteType: not stated here; needs 𝒪_X-modules on adic spaces
--   (supplier: AdicSpaces Layer 5); the target is Mathlib's `SheafOfModules.IsFiniteType`
-- AdicSpace.isCoherent_iff_isFinitePresentation: not stated here; needs 𝒪_X-modules on adic
--   spaces (supplier: AdicSpaces Layer 5); the target is `SheafOfModules.IsFinitePresentation`
-- AdicSpace.IsCoherent.obj_affinoid: not stated here; needs affinoid open subspaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCoherent.stalk_finite: not stated here; needs stalks 𝒪_{X,x} of adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsCoherent.test_ideal: not stated here; needs the closed disc `Spa(K⟨T⟩, K°⟨T⟩)` as
--   an adic space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.IsCoherent.test_point: not stated here; needs `Spa(K, K°)` as an adic space
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.IsCoherent.test_extension_by_zero: not stated here; needs extension by zero of
--   𝒪_X-modules (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.IsCoherent.test_finitePresentation: not stated here; needs 𝒪_X-modules on adic
--   spaces (supplier: AdicSpaces Layer 5) [compatibility test]

/-! ## AdicSpacesPartII:R3/tate-kiehl-affinoid (theorem) -/

-- AdicSpace.kiehlEquiv: not stated here; needs `AdicSpace.Coh` on `Spa(A, A⁺)` (supplier:
--   AdicSpaces Layer 5) and, for the descent form (iii), the rational localisations of a finite
--   rational covering and of their intersections as `A`-algebras (supplier: AdicSpaces Layer 3)

/-! ## AdicSpacesPartII:R3/surjection-small-perturbation (lemma) -/

section Perturbation

/-- R3/surjection-small-perturbation: a continuous surjective `B`-linear map `f : M → N` of
Banach modules over a complete normed Tate ring `B` stays surjective under small perturbations:
there is `c > 0` such that `f − ε` is surjective whenever `‖ε x‖ ≤ c' ‖x‖` for some `c' < c`. -/
theorem surjective_sub_of_norm_lt {B M N : Type*} [NormedCommRing B] [CompleteSpace B]
    [IsTateRing B] [NormedAddCommGroup M] [Module B M] [IsBoundedSMul B M] [CompleteSpace M]
    [NormedAddCommGroup N] [Module B N] [IsBoundedSMul B N] [CompleteSpace N]
    (f : M →L[B] N) (hf : Function.Surjective f) :
    ∃ c > 0, ∀ ε : M →L[B] N, (∃ c' < c, ∀ x, ‖ε x‖ ≤ c' * ‖x‖) →
      Function.Surjective (f - ε) :=
  sorry

/-- R3/surjection-small-perturbation, generator form: if `m₁, …, m_r` generate a finite module
`N` (with its module topology, complete and Hausdorff) over a complete Hausdorff Tate ring `B`,
then every family sufficiently close to `(mⱼ)` generates `N`. -/
theorem eventually_span_range_eq_top {B N : Type*} [CommRing B] [UniformSpace B]
    [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B]
    [AddCommGroup N] [Module B N] [UniformSpace N] [IsUniformAddGroup N] [IsModuleTopology B N]
    [CompleteSpace N] [T2Space N] {r : ℕ} (m : Fin r → N)
    (hm : Submodule.span B (Set.range m) = ⊤) :
    ∀ᶠ m' in 𝓝 m, Submodule.span B (Set.range m') = ⊤ :=
  sorry

end Perturbation

namespace AdicSpace

/-! ## AdicSpacesPartII:R3/coherent-sheaf-operations (construction) -/

-- AdicSpace.Coh.instAbelian: not stated here; needs `AdicSpace.Coh` (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.Coh.tensorObj: not stated here; needs tensor products of 𝒪_X-modules on adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.Coh.internalHom: not stated here; needs internal Hom of 𝒪_X-modules on adic spaces
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.Coh.instMonoidal: not stated here; needs `AdicSpace.Coh` (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.Coh.pullback: not stated here; needs morphisms of adic spaces and pullback of
--   𝒪_X-modules (supplier: AdicSpaces Layer 5)
-- AdicSpace.Coh.pullback_tilde: not stated here; needs `AdicSpace.Coh.pullback` and
--   `AdicSpace.tilde` (supplier: AdicSpaces Layer 5)
-- AdicSpace.Coh.pullbackTensorIso: not stated here; needs `AdicSpace.Coh.pullback` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.Coh.pullback_rightExact: not stated here; needs `AdicSpace.Coh.pullback` and flat
--   morphisms (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/flat-morphism)
-- AdicSpace.Coh.baseChange: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.Coh.support_isClosed: not stated here; needs `AdicSpace.Coh` (supplier: AdicSpaces
--   Layer 5)
-- AdicSpace.Coh.test_cokernel_skyscraper: not stated here; needs the closed disc as an adic
--   space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.Coh.test_point: not stated here; needs `Spa(K, K°)` as an adic space (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.Coh.test_pullback_not_left_exact: not stated here; needs the origin of the disc as a
--   morphism of adic spaces (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.Coh.test_rigid: not stated here; needs rigid analytic spaces and Kiehl's coherent
--   sheaves (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]

/-! ## AdicSpacesPartII:R3/coherent-ideal-closed-subspace (theorem) -/

-- AdicSpace.coherentIdealEquivClosedSubspace: not stated here; needs closed adic subspaces
--   (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings) and `AdicSpace.Coh`
--   (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/finite-morphism-coherent-algebra-equivalence (theorem) -/

-- AdicSpace.finiteEquivCoherentAlgebra: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism) and sheaves of 𝒪_X-algebras (supplier:
--   AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/quasi-stein-space (definition) -/

-- AdicSpace.IsQuasiStein: not stated here; needs adic spaces locally of finite type over
--   `Spa(K, K°)` with their affinoid open subspaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsQuasiStein.exhaustion: not stated here; needs `AdicSpace.IsQuasiStein` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.IsQuasiStein.of_isAffinoid: not stated here; needs affinoid adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.isQuasiStein_openPolydisc: not stated here; needs the open polydisc as an adic space
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.isQuasiStein_analyticAffineSpace: not stated here; needs the analytic affine space
--   (supplier: AdicSpacesPartII:R1/analytic-affine-space)
-- AdicSpace.IsQuasiStein.of_isClosedImmersion: not stated here; needs closed immersions of adic
--   spaces (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.IsQuasiStein.prod: not stated here; needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsQuasiStein.isStein_iff: not stated here; needs Weierstrass subdomains of adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsQuasiStein.test_openDisc: not stated here; needs the open disc as an adic space
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.IsQuasiStein.test_affinoid: not stated here; needs affinoid adic spaces (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.IsQuasiStein.test_projectiveLine: not stated here; needs the analytic projective
--   line and coherent cohomology (supplier: AdicSpacesPartII:R1/analytification-functor)
--   [non-example test]
-- AdicSpace.IsQuasiStein.test_affineLine: not stated here; needs the analytic affine line
--   (supplier: AdicSpacesPartII:R1/analytic-affine-space) [compatibility test]

/-! ## AdicSpacesPartII:R3/quasi-stein-dense-restriction (lemma) -/

-- AdicSpace.IsQuasiStein.denseRange_restrict: not stated here; needs `AdicSpace.IsQuasiStein`
--   and `AdicSpace.Coh` (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/quasi-stein-theorems-a-b (theorem) -/

-- AdicSpace.IsQuasiStein.cohomology_eq_zero: not stated here; needs sheaf cohomology of
--   coherent sheaves on adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/quasi-stein-theorem-a (lemma) -/

-- AdicSpace.IsQuasiStein.globalSections_generate: not stated here; needs `AdicSpace.Coh` and
--   stalks (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/open-polydisc-coherent-acyclicity (lemma) -/

-- AdicSpace.openPolydisc_cohomology_eq_zero: not stated here; needs the open polydisc as an
--   adic space and coherent cohomology (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/quasi-stein-direct-image-acyclicity (lemma) -/

-- AdicSpace.higherDirectImage_eq_zero_of_isQuasiStein: not stated here; needs open immersions of
--   adic spaces and higher direct images (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/locally-free-sheaf (definition) -/

-- AdicSpace.VectorBundle: not stated here; needs 𝒪_X-modules on adic spaces (supplier:
--   AdicSpaces Layer 5); the condition is Mathlib's `SheafOfModules.IsLocallyFree` with local
--   bases of finite type
-- AdicSpace.VectorBundle.rank: not stated here; needs `AdicSpace.VectorBundle` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.tensor: not stated here; needs `AdicSpace.VectorBundle` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.pullback: not stated here; needs morphisms of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.isCoherent: not stated here; needs `AdicSpace.IsCoherent` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.iff_isLocallyFree: not stated here; needs `AdicSpace.VectorBundle`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.dualDualIso: not stated here; needs `AdicSpace.VectorBundle`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.stalk_free: not stated here; needs stalks of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.ofFiniteProjective: not stated here; needs sheafy Tate affinoids as
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.VectorBundle.test_disconnected: not stated here; needs `Spa(A₁ × A₂)` as an adic
--   space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.VectorBundle.test_rank_zero: not stated here; needs `AdicSpace.VectorBundle`
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.VectorBundle.test_skyscraper: not stated here; needs the closed disc as an adic
--   space (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.VectorBundle.test_mathlib: not stated here; needs 𝒪_X-modules on adic spaces
--   (supplier: AdicSpaces Layer 5) [compatibility test]

/-! ## AdicSpacesPartII:R3/sheaf-of-continuous-differentials (construction) -/

-- AdicSpace.relativeDifferentials: not stated here; needs 𝒪_X-modules on adic spaces and morphisms
--   locally of finite type (supplier: AdicSpaces Layer 5); the object is a Mathlib
--   `SheafOfModules` over 𝒪_X glued from `Huber.ContinuousKaehlerDifferential`
-- AdicSpace.relativeDifferentials.d: not stated here; needs `AdicSpace.relativeDifferentials`
--   (supplier: AdicSpaces Layer 5); on affinoid charts it is `Huber.ContinuousKaehlerDifferential.D`
-- AdicSpace.relativeDifferentials.isCoherent: not stated here; needs `AdicSpace.IsCoherent`
--   (supplier: AdicSpacesPartII:R3/coherent-sheaf, on AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.affinoidIso: not stated here; needs the sheaves `M̃` on
--   `Spa(B, B⁺)` (supplier: AdicSpacesPartII:R3/associated-module-sheaf, on AdicSpaces Layer 3)
-- AdicSpace.relativeDifferentials.homEquiv: not stated here; needs 𝒪_X-modules and continuous
--   derivations of sheaves of topological rings (supplier: AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.map: not stated here; needs pullback of 𝒪_X-modules along
--   morphisms of adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.exact_firstFundamental: not stated here; needs
--   `AdicSpace.relativeDifferentials` (supplier: AdicSpaces Layer 5); its ring-level core is the
--   first fundamental sequence of AdicSpacesPartII:R0/first-fundamental-sequence
-- AdicSpace.relativeDifferentials.exact_conormal: not stated here; needs closed adic subspaces
--   and their ideal sheaves (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.relativeDifferentials.eq_zero_iff_unramified: not stated here; needs
--   `AdicSpace.Unramified` (supplier: AdicSpacesPartII:R0/unramified-morphism, on AdicSpaces
--   Layer 5)
-- AdicSpace.relativeDifferentials.isVectorBundle_of_smooth: not stated here; needs
--   `AdicSpace.VectorBundle` and `AdicSpace.Smooth` (supplier: AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.pullbackEtaleIso: not stated here; needs `AdicSpace.Etale`
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale, on AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.baseChangeIso: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.relativeDifferentials.analytificationIso: not stated here; needs the analytification
--   functor (supplier: AdicSpacesPartII:R1/analytification-functor)
-- AdicSpace.relativeDifferentials.exteriorPower: not stated here; needs
--   `AdicSpace.relativeDifferentials` (supplier: AdicSpaces Layer 5); its affinoid core is
--   `AdicSpace.relativeDifferentials.exteriorPower_affinoid`
-- AdicSpace.relativeDifferentials.deRhamComplex: not stated here; needs sheaves of abelian groups
--   on adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.relativeDifferentials.test_disc: not stated here; needs the closed disc as an adic
--   space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.relativeDifferentials.test_openEmbedding: not stated here; needs open subspaces of
--   adic spaces (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.relativeDifferentials.test_notAlgebraic: not stated here; needs presheaves of
--   modules on the disc (supplier: AdicSpaces Layer 5); its ring-level core is the R0 test
--   `ContinuousKaehlerDifferential_test_notAlgebraic` [non-example test]
-- AdicSpace.relativeDifferentials.test_analytification: not stated here; needs the
--   analytification functor (supplier: AdicSpacesPartII:R1/analytification-functor)
--   [compatibility test]
-- AdicSpace.relativeDifferentials.test_derivations: not stated here; needs
--   `AdicSpace.relativeDifferentials` (supplier: AdicSpaces Layer 5) [characterisation test]

/-- R3/sheaf-of-continuous-differentials, affinoid core of
`AdicSpace.relativeDifferentials.exteriorPower`: over an affinoid chart `Spa B → Spa A` with `A → B` topologically of finite type, the sections of
`Ωⁱ_{X/Y}` are the exterior power `⋀ⁱ_B Ωᶜ[B⁄A]` of the continuous differentials. -/
abbrev relativeDifferentials.exteriorPower_affinoid (A B : Type*) [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B]
    [IsTopologicalRing B] [IsHuberRing B] [Algebra A B] (i : ℕ) :
    Submodule B (ExteriorAlgebra B (Huber.ContinuousKaehlerDifferential A B)) :=
  ⋀[B]^i (Huber.ContinuousKaehlerDifferential A B)

/-! ## AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing (theorem) -/

-- AdicSpace.finiteProjectiveEquivVectorBundle: not stated here; needs sheafiness of Huber pairs
--   (supplier: AdicSpaces Layer 4) and `AdicSpace.VectorBundle` (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/finite-projective-module-acyclicity (lemma) -/

-- AdicSpace.tildeProjective_isAcyclic: not stated here; needs sheafiness of Huber pairs and
--   sheaf cohomology on rational subsets (supplier: AdicSpaces Layer 4)

/-! ## AdicSpacesPartII:R3/vector-bundle-global-generation (lemma) -/

-- AdicSpace.VectorBundle.globallyGenerated_of_affinoid: not stated here; needs
--   `AdicSpace.VectorBundle` (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/finite-projective-etale-descent (lemma) -/

-- AdicSpace.finiteProjective_etaleDescent: not stated here; needs sheafiness of Huber pairs
--   (supplier: AdicSpaces Layer 4) and the stack of vector bundles (supplier:
--   AdicSpacesPartII:R3/locally-free-sheaf); its module-level content is faithfully flat descent
--   of finite projective modules along `A → B`

end AdicSpace

/-! ## AdicSpacesPartII:R3/uniform-iff-power-bound (lemma) -/

namespace Huber

open ValuationSpectrum

/-- R3/uniform-iff-power-bound (i) (Kedlaya–Liu Definition 2.8.1 as corrected in Kedlaya–Liu II,
Appendix A; Hansen–Kedlaya Definition 2.10): for a complete Tate ring whose topology is given by a
submultiplicative norm, the following are equivalent: (a) the norm is equivalent to a
power-multiplicative ring seminorm; (b) the norm is equivalent to the spectral seminorm
`x ↦ lim ‖xⁿ‖^{1/n}` (Mathlib's `smoothingFun`); (c) there is `c > 0` with `c ‖x‖² ≤ ‖x²‖`.
Boundedness of `A°` is not among them: it follows from them
(`isBounded_powerBoundedSubring_of_sq_bound`) and implies them only under the hypothesis of
`sq_bound_of_isBounded_powerBoundedSubring`. -/
theorem isUniform_tfae {A : Type*} [NormedCommRing A] [CompleteSpace A] [IsTateRing A] :
    List.TFAE
      [∃ ν : RingSeminorm A, IsPowMul ν ∧ ∃ c > 0, ∃ C > 0, ∀ x, c * ‖x‖ ≤ ν x ∧ ν x ≤ C * ‖x‖,
        ∃ c > 0, ∀ x, c * ‖x‖ ≤ smoothingFun (normRingSeminorm A) x,
        ∃ c > 0, ∀ x : A, c * ‖x‖ ^ 2 ≤ ‖x ^ 2‖] :=
  sorry

/-- R3/uniform-iff-power-bound (ii): the equivalent conditions of `isUniform_tfae` imply that the
power-bounded subring `A°` is bounded. -/
theorem isBounded_powerBoundedSubring_of_sq_bound {A : Type*} [NormedCommRing A] [CompleteSpace A]
    [IsTateRing A] (h : ∃ c > 0, ∀ x : A, c * ‖x‖ ^ 2 ≤ ‖x ^ 2‖) :
    IsBounded (powerBoundedSubring A : Set A) :=
  sorry

/-- R3/uniform-iff-power-bound (iii): if `A` contains a topologically nilpotent unit `z` with
`‖z‖ · ‖z⁻¹‖ = 1` (as the pseudouniformiser does for the norms `α_d` of R0/tate-ring-norm),
boundedness of `A°` implies the conditions of `isUniform_tfae`. Without such a `z` it does not:
on a nonarchimedean field the norm `|x|` for `|x| ≤ 1`, `|x| (1 + log |x|)` for `|x| > 1` has
bounded unit ball and is not equivalent to its spectral norm (Kedlaya–Liu II, Appendix A). -/
theorem sq_bound_of_isBounded_powerBoundedSubring {A : Type*} [NormedCommRing A]
    [CompleteSpace A] [IsTateRing A] (z : Aˣ) (hz : IsTopologicallyNilpotent (z : A))
    (hzz : ‖(z : A)‖ * ‖((z⁻¹ : Aˣ) : A)‖ = 1) (h : IsBounded (powerBoundedSubring A : Set A)) :
    ∃ c > 0, ∀ x : A, c * ‖x‖ ^ 2 ≤ ‖x ^ 2‖ :=
  sorry

/-! ## AdicSpacesPartII:R3/stably-uniform-sheafy (lemma) -/

-- Huber.IsStablyUniform.of_split: not stated here; needs the anchor's stable uniformity (every
--   rational localisation uniform) and sheafiness of Huber pairs (supplier: AdicSpaces Layer 4).
--   Its uniform core, for the ring itself, is `Huber.isBounded_powerBoundedSubring_of_split`.

/-- R3/stably-uniform-sheafy, uniform core: if `A → B` is a continuous map of complete Tate rings
with a continuous `A`-linear retraction and `B` is uniform (`B°` bounded), then `A` is uniform. -/
theorem isBounded_powerBoundedSubring_of_split {A B : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B]
    [CompleteSpace B] [T2Space B] [Algebra A B] (hφ : Continuous (algebraMap A B))
    (s : B →ₗ[A] A) (hs : Continuous s) (hsφ : ∀ a, s (algebraMap A B a) = a)
    (hB : IsBounded (powerBoundedSubring B : Set B)) :
    IsBounded (powerBoundedSubring A : Set A) :=
  sorry

/-! ## AdicSpacesPartII:R3/uniform-spectral-seminorm (lemma) -/

-- Huber.spectralNorm_map_eq_of_surjective: not stated here; needs the Gel'fand spectrum `M(A)`
--   of bounded multiplicative seminorms (supplier: TropicalAndBerkovichArithmetic:TB.0). Its
--   submetric half is `Huber.spectralNorm_map_le`.

/-- R3/uniform-spectral-seminorm, submetric half: a bounded homomorphism of normed rings does not
increase spectral seminorms (Mathlib's `smoothingFun` of the norm). -/
theorem spectralNorm_map_le {A B : Type*} [NormedCommRing A] [NormedCommRing B]
    (φ : A →+* B) (hφ : ∃ C, ∀ y, ‖φ y‖ ≤ C * ‖y‖) (x : A) :
    smoothingFun (normRingSeminorm B) (φ x) ≤ smoothingFun (normRingSeminorm A) x :=
  sorry

/-! ## AdicSpacesPartII:R3/completely-continuous-map (definition) -/

section CompletelyContinuous

variable {A M N : Type*} [NormedCommRing A] [NormedAddCommGroup M] [Module A M]
  [IsBoundedSMul A M] [NormedAddCommGroup N] [Module A N] [IsBoundedSMul A N]

/-- R3/completely-continuous-map: a continuous `A`-linear map of Banach `A`-modules is
*completely continuous* if it is a limit, for the operator norm, of continuous `A`-linear maps
with finitely generated image. -/
def IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∀ ε > 0, ∃ g : M →L[A] N, (LinearMap.range (g : M →ₗ[A] N)).FG ∧ ∀ x, ‖f x - g x‖ ≤ ε * ‖x‖

variable (K : Type*) [NormedField K] [Algebra K A] (A₀ : Subring A) in
/-- R3/completely-continuous-map: Kiehl's *strictly* completely continuous maps
("streng vollständig stetig"): there are continuous `A`-linear maps `gᵢ → f` in the operator
norm and one scalar `a ∈ K° ∖ {0}`, independent of `i`, such that each `a · gᵢ(M₀)` lies in a
finitely generated `A₀`-submodule of `N₀` (so each `gᵢ` has finite rank). Here `M₀`, `N₀` are the
closed unit balls and `A₀` is the chosen ring of definition. -/
def IsStrictlyCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∃ a : K, a ≠ 0 ∧ ‖a‖ ≤ 1 ∧ ∃ g : ℕ → M →L[A] N,
    (∀ ε > 0, ∀ᶠ i in atTop, ∀ x, ‖f x - g i x‖ ≤ ε * ‖x‖) ∧
    ∀ i, ∃ s : Finset N, (∀ n ∈ s, ‖n‖ ≤ 1) ∧ ∀ x, ‖x‖ ≤ 1 →
      ∃ c : N → A, (∀ n, c n ∈ A₀) ∧ algebraMap K A a • g i x = ∑ n ∈ s, c n • n

/-- R3/completely-continuous-map: strictly completely continuous maps are completely
continuous. -/
theorem IsStrictlyCompletelyContinuous.isCompletelyContinuous {K : Type*} [NormedField K]
    [Algebra K A] {A₀ : Subring A} {f : M →L[A] N} (hf : IsStrictlyCompletelyContinuous K A₀ f) : IsCompletelyContinuous f :=
  sorry

/-- R3/completely-continuous-map: a continuous `A`-linear map with finitely generated image is
completely continuous. -/
theorem IsCompletelyContinuous.of_finiteRank {f : M →L[A] N}
    (hf : (LinearMap.range (f : M →ₗ[A] N)).FG) : IsCompletelyContinuous f :=
  sorry

/-- R3/completely-continuous-map: `u ∘ f` and `f ∘ v` are completely continuous when `f` is and
`u`, `v` are continuous `A`-linear maps between Banach modules over a normed `K`-algebra. -/
theorem IsCompletelyContinuous.comp_left {K : Type*} [NontriviallyNormedField K]
    [NormedAlgebra K A] {L P : Type*}
    [NormedAddCommGroup L] [Module A L] [IsBoundedSMul A L] [NormedSpace K L]
    [IsScalarTower K A L] [NormedAddCommGroup P] [Module A P] [IsBoundedSMul A P]
    [NormedSpace K M] [IsScalarTower K A M] [NormedSpace K N] [IsScalarTower K A N]
    {f : M →L[A] N} (hf : IsCompletelyContinuous f) (u : N →L[A] P) (v : L →L[A] M) :
    IsCompletelyContinuous (u.comp f) ∧ IsCompletelyContinuous (f.comp v) :=
  sorry

/-- R3/completely-continuous-map: completely continuous maps form an `A`-submodule of the
continuous `A`-linear maps. -/
theorem IsCompletelyContinuous.add {f g : M →L[A] N} (hf : IsCompletelyContinuous f)
    (hg : IsCompletelyContinuous g) :
    IsCompletelyContinuous (f + g) ∧ ∀ a : A, IsCompletelyContinuous (a • f) :=
  sorry

/-- R3/completely-continuous-map: the completely continuous maps are closed for the operator
norm: an operator-norm limit of completely continuous maps is completely continuous. -/
theorem isClosed_setOf_isCompletelyContinuous {f : M →L[A] N}
    (hf : ∀ ε > 0, ∃ g : M →L[A] N, IsCompletelyContinuous g ∧ ∀ x, ‖f x - g x‖ ≤ ε * ‖x‖) :
    IsCompletelyContinuous f :=
  sorry

/-- R3/completely-continuous-map (Kiehl's example): if `f = ∑ᵢ vᵢ(·) nᵢ` with `(vᵢ)` uniformly
bounded continuous linear forms and `nᵢ → 0` in `N`, then `f` is strictly completely
continuous (for an open ring of definition `A₀`). -/
theorem isStrictlyCompletelyContinuous_tsum (K : Type*) [NormedField K] [Algebra K A]
    {A₀ : Subring A} {f : M →L[A] N} (v : ℕ → M →L[A] A) (n : ℕ → N)
    (hv : ∃ C, ∀ i x, ‖v i x‖ ≤ C * ‖x‖) (hn : Tendsto n atTop (𝓝 0))
    (hf : ∀ x, HasSum (fun i ↦ v i x • n i) (f x)) (hA₀ : IsOpen (A₀ : Set A)) :
    IsStrictlyCompletelyContinuous K A₀ f :=
  sorry

end CompletelyContinuous

section CompletelyContinuousTests

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {M N : Type*} [NormedAddCommGroup M] [NormedSpace K M] [CompleteSpace M]
  [NormedAddCommGroup N] [NormedSpace K N] [CompleteSpace N]

-- Huber.IsCompletelyContinuous.test_restriction: not stated here; needs the Tate algebras
--   `K⟨T⟩ → K⟨T/ϖ⟩` as Banach `K`-algebras with their Gauss norms (supplier: AdicSpaces Layer 0)
--   [computation test]

-- test Huber.IsCompletelyContinuous.test_finite (degenerate) [R3/completely-continuous-map]
example (f : M →L[K] N) [FiniteDimensional K N] :
    IsCompletelyContinuous (0 : M →L[K] N) ∧ IsCompletelyContinuous f :=
  sorry

/- The identity of an infinite-dimensional Banach space (for instance `K⟨T⟩`) is not completely
continuous. -/
-- test Huber.IsCompletelyContinuous.test_identity (non-example) [R3/completely-continuous-map]
example (h : ¬ FiniteDimensional K M) :
    ¬ IsCompletelyContinuous (ContinuousLinearMap.id K M) :=
  sorry

/- Over a locally compact `K` (a finite extension of `ℚ_p`), completely continuous maps are
compact operators; over `ℂ_p` the identity of `K` is completely continuous but not compact, so
the two notions differ in general. -/
-- test Huber.IsCompletelyContinuous.test_compactOperator (compatibility)
--   [R3/completely-continuous-map]
example [LocallyCompactSpace K] (f : M →L[K] N) (hf : IsCompletelyContinuous f) :
    IsCompactOperator f :=
  sorry

end CompletelyContinuousTests

/-! ## AdicSpacesPartII:R3/completely-continuous-finite-cokernel (lemma) -/

section Schwartz

variable {K A M N : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [IsTateRing K] [NormedCommRing A] [NormedAlgebra K A] [CompleteSpace A] [IsTateRing A]
  [NormedAddCommGroup M] [Module A M] [IsBoundedSMul A M] [NormedSpace K M]
  [IsScalarTower K A M] [CompleteSpace M]
  [NormedAddCommGroup N] [Module A N] [IsBoundedSMul A N] [NormedSpace K N]
  [IsScalarTower K A N] [CompleteSpace N]

/-- R3/completely-continuous-finite-cokernel (Kiehl Satz 1.2, Schwartz): over an affinoid
`K`-algebra `A` (a quotient of some `K⟨X₁, …, Xₙ⟩`, Tau Ceti's
`IsStrictlyTopologicallyFiniteType`), if `f : M → N` is a continuous surjection of Banach
`A`-modules and `g` is completely continuous, then `(f + g)(M)` is closed and `N / (f + g)(M)` is
a finitely generated `A`-module. -/
theorem IsCompletelyContinuous.finite_coker_add
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (f g : M →L[A] N)
    (hf : Function.Surjective f) (hg : IsCompletelyContinuous g) :
    IsClosed (LinearMap.range ((f + g : M →L[A] N) : M →ₗ[A] N) : Set N) ∧
      Module.Finite A (N ⧸ LinearMap.range ((f + g : M →L[A] N) : M →ₗ[A] N)) :=
  sorry

/-! ## AdicSpacesPartII:R3/strictly-completely-continuous-closed-target (lemma) -/

/-- R3/strictly-completely-continuous-closed-target (Kiehl Hilfssatz 1.4): let `G ⊆ N` be a
closed submodule of a Banach `A`-module and `f : M → G` `A`-linear with `j ∘ f : M → N` strictly
completely continuous (`j` the inclusion). If `M` is topologically free (`M ≅ c₀(I, A)`, the
completed direct sum of copies of `A`: a family `e : I → M` whose `A`-span is dense and on whose
finite combinations the norm is the maximum of the coefficients), then `f : M → G` is strictly
completely continuous. -/
theorem IsStrictlyCompletelyContinuous.codRestrict
    (hA : IsStrictlyTopologicallyFiniteType (algebraMap K A)) (A₀ : Subring A)
    (G : Submodule A N) (hG : IsClosed (G : Set N)) (f : M →L[A] G)
    {I : Type*} (e : I → M) (he : ∀ c : I →₀ A, ‖c.sum fun i a ↦ a • e i‖ = ⨆ i, ‖c i‖)
    (hdense : Dense (Submodule.span A (Set.range e) : Set M))
    (hf : IsStrictlyCompletelyContinuous K A₀ (G.subtypeL.comp f)) :
    IsStrictlyCompletelyContinuous K A₀ f :=
  sorry

end Schwartz

end Huber

namespace AdicSpace

/-! ## AdicSpacesPartII:R3/relatively-compact-affinoid (definition) -/

-- AdicSpace.RelativelyCompact: not stated here; needs affinoid adic spaces over `Spa(A, A°)`,
--   closed immersions into `Dⁿ_A` and affinoid open subspaces (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings)
-- AdicSpace.RelativelyCompact.mono: not stated here; needs `AdicSpace.RelativelyCompact`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.RelativelyCompact.inter: not stated here; needs `AdicSpace.RelativelyCompact` and
--   separated morphisms (supplier: AdicSpacesPartII:R0/separated-morphism)
-- AdicSpace.RelativelyCompact.prod: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.relativelyCompact_self_of_finite: not stated here; needs `AdicSpace.RelativelyCompact`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.RelativelyCompact.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.RelativelyCompact.of_isRational: not stated here; needs `AdicSpace.RelativelyCompact`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.RelativelyCompact.strictlyCompletelyContinuous: not stated here; needs the sections
--   `𝒪(V) → 𝒪(U)` of affinoid adic spaces (supplier: AdicSpaces Layer 5); the target predicate
--   is `Huber.IsStrictlyCompletelyContinuous`
-- AdicSpace.RelativelyCompact.test_disc: not stated here; needs the closed disc as an adic space
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.RelativelyCompact.test_finite: not stated here; needs `AdicSpace.RelativelyCompact`
--   (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.RelativelyCompact.test_unit_disc_not_self: not stated here; needs the closed unit
--   disc as an adic space (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.RelativelyCompact.test_rigid: not stated here; needs rigid analytic spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]

/-! ## AdicSpacesPartII:R3/proper-relatively-compact-covers (lemma) -/

-- AdicSpace.IsProper.exists_relativelyCompact_covers: not stated here; needs proper morphisms of
--   adic spaces (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)

/-! ## AdicSpacesPartII:R3/restriction-strictly-completely-continuous (lemma) -/

-- AdicSpace.RelativelyCompact.restrict_isStrictlyCompletelyContinuous: not stated here; needs
--   `AdicSpace.RelativelyCompact` and coherent sheaves (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/proper-affinoid-cohomology-finite (lemma) -/

-- AdicSpace.IsProper.cohomology_finite: not stated here; needs proper morphisms (supplier:
--   AdicSpacesPartII:R0/universally-closed-and-proper-morphism) and coherent cohomology on adic
--   spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/proper-cohomology-adic-completion (lemma) -/

-- AdicSpace.IsProper.cohomology_adicCompletion: not stated here; needs coherent cohomology on
--   adic spaces (supplier: AdicSpaces Layer 5); the completion is Mathlib's `AdicCompletion`

/-! ## AdicSpacesPartII:R3/proper-cohomology-affinoid-subdomain (lemma) -/

-- AdicSpace.IsProper.cohomology_baseChange_affinoidSubdomain: not stated here; needs coherent
--   cohomology on adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/kiehl-proper-mapping-theorem (theorem) -/

-- AdicSpace.IsProper.isCoherent_higherDirectImage: not stated here; needs proper morphisms
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism) and higher direct
--   images of 𝒪_X-modules on adic spaces (supplier: AdicSpaces Layer 5)

end AdicSpace

/-! ## AdicSpacesPartII:R3/countable-type-closed-subspace-section (lemma) -/

/-- R3/countable-type-closed-subspace-section (Bosch–Güntzer–Remmert 2.7.2/3): over a complete
nontrivially valued nonarchimedean field `K`, a closed subspace `F` of a Banach space `E` of
countable type (a countable set spans a dense subspace) is closed-complemented, that is,
`E → E/F` has a continuous `K`-linear section. -/
theorem CountableType.exists_continuousLinear_section {K E : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [NormedAddCommGroup E] [IsUltrametricDist E]
    [NormedSpace K E] [CompleteSpace E]
    (hE : ∃ s : Set E, s.Countable ∧ Dense (Submodule.span K s : Set E)) (F : Submodule K E)
    (hF : IsClosed (F : Set E)) : F.ClosedComplemented :=
  sorry

namespace AdicSpace

/-! ## AdicSpacesPartII:R3/affinoid-completed-field-extension (lemma) -/

-- AdicSpace.completedFieldExtension_faithfullyFlat: not stated here; needs the completed tensor
--   product `K' ⊗̂_K A` of Huber rings (supplier: AdicSpacesPartII:R0/completed-tensor-product)

/-! ## AdicSpacesPartII:R3/proper-coherent-cohomology-field-extension (lemma) -/

-- AdicSpace.IsProper.cohomology_completedFieldExtension: not stated here; needs coherent
--   cohomology on adic spaces (supplier: AdicSpaces Layer 5) and `X ⊗̂_K K'` (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence)

/-! ## AdicSpacesPartII:R3/proper-cohomology-finite-flat-base-change (lemma) -/

-- AdicSpace.IsProper.cohomology_baseChange_finiteFlat: not stated here; needs fibre products
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence) and coherent cohomology on adic
--   spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/proper-coherent-base-change (theorem) -/

-- AdicSpace.IsProper.cohomology_baseChange_etale: not stated here; needs étale morphisms of
--   adic spaces (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale) and
--   coherent cohomology on adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/analytification-coherent (lemma) -/

-- AdicSpace.isCoherent_analytification: not stated here; needs the analytification of schemes
--   and of 𝒪_X-modules (supplier: AdicSpacesPartII:R1/analytification-of-modules)

/-! ## AdicSpacesPartII:R3/gaga-comparison-map (construction) -/

-- AdicSpace.cohomologyComparison: not stated here; needs `X^an` with `ι_X : X^an → X` (supplier:
--   AdicSpacesPartII:R1/scheme-fibre-product-analytification) and sheaf cohomology on adic
--   spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.cohomologyComparison_naturality: not stated here; needs
--   `AdicSpace.cohomologyComparison` (supplier: AdicSpacesPartII:R1/analytification-of-modules)
-- AdicSpace.cohomologyComparison_δ: not stated here; needs `AdicSpace.cohomologyComparison`
--   (supplier: AdicSpacesPartII:R1/analytification-of-modules)
-- AdicSpace.cohomologyComparison_zero: not stated here; needs `AdicSpace.cohomologyComparison`
--   (supplier: AdicSpacesPartII:R1/analytification-of-modules)
-- AdicSpace.directImageComparison: not stated here; needs higher direct images on adic spaces
--   (supplier: AdicSpaces Layer 5) and `f^an` (supplier: AdicSpacesPartII:R1/analytification-functor)
-- AdicSpace.directImageComparison_comp: not stated here; needs `AdicSpace.directImageComparison`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.directImageComparison_global: not stated here; needs
--   `AdicSpace.directImageComparison` (supplier: AdicSpaces Layer 5)
-- AdicSpace.cohomologyComparison_baseChange: not stated here; needs
--   `AdicSpace.cohomologyComparison` (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification)
-- AdicSpace.cohomologyComparison_test_affineLine: not stated here; needs the analytic affine line
--   (supplier: AdicSpacesPartII:R1/analytic-affine-space) [non-example test]
-- AdicSpace.cohomologyComparison_test_point: not stated here; needs `(Spec K)^an` (supplier:
--   AdicSpacesPartII:R1/analytification-functor) [degenerate test]
-- AdicSpace.cohomologyComparison_test_skyscraper: not stated here; needs the analytic affine line
--   (supplier: AdicSpacesPartII:R1/analytic-affine-space) [computation test]
-- AdicSpace.cohomologyComparison_test_rigid: not stated here; needs rigid analytic spaces and
--   Köpf's comparison (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]

/-! ## AdicSpacesPartII:R3/analytic-projective-space-cohomology (lemma) -/

-- AdicSpace.projectiveSpace_cohomologyComparison_bijective: not stated here; needs
--   `AdicSpace.cohomologyComparison` and `(Pⁿ_A)^an` (supplier:
--   AdicSpacesPartII:R1/scheme-fibre-product-analytification)

/-! ## AdicSpacesPartII:R3/proper-gaga (theorem) -/

-- AdicSpace.gaga_directImage: not stated here; needs `AdicSpace.directImageComparison` (supplier:
--   AdicSpacesPartII:R1/analytification-of-modules, AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/proper-gaga-coherent-equivalence (theorem) -/

-- AdicSpace.gagaEquiv: not stated here; needs `AdicSpace.Coh` of `X^an` (supplier: AdicSpaces
--   Layer 5, AdicSpacesPartII:R1/analytification-of-modules)

/-! ## AdicSpacesPartII:R3/gaga-finite-covers (lemma) -/

-- AdicSpace.gaga_finite: not stated here; needs finite morphisms of adic spaces (supplier:
--   AdicSpacesPartII:R0/finite-morphism) and `X^an` (supplier:
--   AdicSpacesPartII:R1/analytification-functor)

end AdicSpace

/-! ## AdicSpacesPartII:R3/projective-module-trace (construction) -/

namespace LinearMap

section ProjectiveTrace

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
  [Module.Projective R M]

/-- R3/projective-module-trace: the trace `End_R(M) → R` of a finite projective module,
`contractLeft ∘ (dualTensorHomEquiv R M M)⁻¹`. Mathlib's `LinearMap.trace` agrees with it for
free `M` and is `0` when `M` has no finite basis. -/
def projectiveTrace : (M →ₗ[R] M) →ₗ[R] R :=
  contractLeft R M ∘ₗ (dualTensorHomEquiv R M M).symm.toLinearMap

variable {R M} {N : Type*} [AddCommGroup N] [Module R N] [Module.Finite R N]
  [Module.Projective R N]

/-- R3/projective-module-trace: `projectiveTrace (dualTensorHom (φ ⊗ m)) = φ m`. -/
theorem projectiveTrace_dualTensorHom (φ : Module.Dual R M) (m : M) :
    projectiveTrace R M (dualTensorHom R M M (φ ⊗ₜ m)) = φ m :=
  sorry

/-- R3/projective-module-trace: for free `M` the projective trace is Mathlib's trace. -/
theorem projectiveTrace_eq_trace [Module.Free R M] :
    projectiveTrace R M = _root_.LinearMap.trace R M :=
  sorry

/-- R3/projective-module-trace: `tr_M (g ∘ f) = tr_N (f ∘ g)`. -/
theorem projectiveTrace_comp_comm (f : M →ₗ[R] N) (g : N →ₗ[R] M) :
    projectiveTrace R M (g ∘ₗ f) = projectiveTrace R N (f ∘ₗ g) :=
  sorry

/-- R3/projective-module-trace: base change along `R → R'`. -/
theorem projectiveTrace_baseChange (R' : Type*) [CommRing R'] [Algebra R R'] (f : M →ₗ[R] M) :
    projectiveTrace R' (R' ⊗[R] M) (f.baseChange R') = algebraMap R R' (projectiveTrace R M f) :=
  sorry

/-- R3/projective-module-trace: `tr_{M × N} (f × g) = tr_M f + tr_N g`. -/
theorem projectiveTrace_prodMap (f : M →ₗ[R] M) (g : N →ₗ[R] N) :
    projectiveTrace R (M × N) (f.prodMap g) = projectiveTrace R M f + projectiveTrace R N g :=
  sorry

/-- R3/projective-module-trace: invariance under conjugation by a linear equivalence. -/
theorem projectiveTrace_conj (e : M ≃ₗ[R] N) (f : M →ₗ[R] M) :
    projectiveTrace R N (e.conj f) = projectiveTrace R M f :=
  sorry

/-- R3/projective-module-trace: the image of `tr_M (id)` in `R_𝔭` is the rank of `M` at `𝔭`. -/
theorem projectiveTrace_one_localization (p : PrimeSpectrum R) :
    algebraMap R (Localization.AtPrime p.asIdeal) (projectiveTrace R M _root_.LinearMap.id) =
      (Module.rankAtStalk (R := R) M p : Localization.AtPrime p.asIdeal) :=
  sorry

/-- R3/projective-module-trace: the trace of a nilpotent endomorphism is nilpotent. -/
theorem projectiveTrace_isNilpotent {f : M →ₗ[R] M} (hf : IsNilpotent f) :
    IsNilpotent (projectiveTrace R M f) :=
  sorry

end ProjectiveTrace

section ProjectiveTraceTests

/- `ℚ × 0 ⊆ ℚ × ℚ` is projective and not free: its projective trace of the identity is `(1, 0)`,
while Mathlib's `LinearMap.trace` is `0`. -/
-- test LinearMap.projectiveTrace_test_nonfree (non-example) [R3/projective-module-trace]
example [Module.Finite (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})]
    [Module.Projective (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})] :
    projectiveTrace (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))}) _root_.LinearMap.id = (1, 0) ∧
      _root_.LinearMap.trace (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})
        _root_.LinearMap.id = 0 :=
  sorry

-- test LinearMap.projectiveTrace_test_matrix (computation) [R3/projective-module-trace]
example {R : Type*} [CommRing R] (a b c d : R) :
    projectiveTrace R (Fin 2 → R) (Matrix.toLin' !![a, b; c, d]) = a + d :=
  sorry

-- test LinearMap.projectiveTrace_test_zero_self (degenerate) [R3/projective-module-trace]
example {R : Type*} [CommRing R] (f : R →ₗ[R] R) (g : PUnit →ₗ[R] PUnit) :
    projectiveTrace R R f = f 1 ∧ projectiveTrace R PUnit g = 0 :=
  sorry

-- test LinearMap.projectiveTrace_test_free (compatibility) [R3/projective-module-trace]
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Free R M] (f : M →ₗ[R] M) :
    projectiveTrace R M f = _root_.LinearMap.trace R M f :=
  sorry

end ProjectiveTraceTests

end LinearMap

/-! ## AdicSpacesPartII:R3/finite-locally-free-algebra-trace (construction) -/

namespace Algebra

section AlgebraTrace

variable (R B : Type*) [CommRing R] [CommRing B] [Algebra R B] [Module.Finite R B]
  [Module.Projective R B]

/-- R3/finite-locally-free-algebra-trace: the trace `Tr_{B/R} : B → R` of a finite projective
(finite locally free) `R`-algebra, `b ↦ tr_B(m_b)`. -/
def projectiveTrace : B →ₗ[R] R :=
  LinearMap.projectiveTrace R B ∘ₗ (_root_.Algebra.lmul R B).toLinearMap

variable {R B}

/-- R3/finite-locally-free-algebra-trace: unfolding the definition. -/
theorem projectiveTrace_apply (b : B) :
    projectiveTrace R B b = LinearMap.projectiveTrace R B (_root_.Algebra.lmul R B b) :=
  sorry

/-- R3/finite-locally-free-algebra-trace: for free `B` this is Mathlib's `Algebra.trace`. -/
theorem projectiveTrace_eq_trace [Module.Free R B] :
    projectiveTrace R B = _root_.Algebra.trace R B :=
  sorry

/-- R3/finite-locally-free-algebra-trace: `Tr(algebraMap r) = r · Tr(1)`, and the image of
`Tr(1)` in `R_𝔭` is the rank of `B` at `𝔭`. -/
theorem projectiveTrace_algebraMap (r : R) :
    projectiveTrace R B (algebraMap R B r) = r * projectiveTrace R B 1 ∧
      ∀ p : PrimeSpectrum R, algebraMap R (Localization.AtPrime p.asIdeal)
        (projectiveTrace R B 1) = (Module.rankAtStalk (R := R) B p :
          Localization.AtPrime p.asIdeal) :=
  sorry

/-- R3/finite-locally-free-algebra-trace: `Tr_{B × C / R}(b, c) = Tr_{B/R} b + Tr_{C/R} c`. -/
theorem projectiveTrace_prod {C : Type*} [CommRing C] [Algebra R C] [Module.Finite R C]
    [Module.Projective R C] (x : B × C) :
    projectiveTrace R (B × C) x = projectiveTrace R B x.1 + projectiveTrace R C x.2 :=
  sorry

variable (R B) in
/-- R3/finite-locally-free-algebra-trace: the trace form `(x, y) ↦ Tr_{B/R}(x y)`. -/
def projectiveTraceForm : LinearMap.BilinForm R B :=
  (_root_.Algebra.lmul R B).toLinearMap.compr₂ (projectiveTrace R B)

/-- R3/finite-locally-free-algebra-trace: the trace form is symmetric. -/
theorem projectiveTraceForm_isSymm : (projectiveTraceForm R B).IsSymm :=
  sorry

/-- R3/finite-locally-free-algebra-trace: for `B = Rⁿ`, `Tr(b) = ∑ bᵢ`. -/
theorem projectiveTrace_pi {n : ℕ} (b : Fin n → R) :
    projectiveTrace R (Fin n → R) b = ∑ i, b i :=
  sorry

/-- R3/finite-locally-free-algebra-trace: compatibility with localisation at a multiplicative
set `S ⊆ R`. -/
theorem projectiveTrace_localization (S : Submonoid R)
    [Module.Finite (Localization S) (Localization (_root_.Algebra.algebraMapSubmonoid B S))]
    [Module.Projective (Localization S) (Localization (_root_.Algebra.algebraMapSubmonoid B S))]
    (b : B) :
    projectiveTrace (Localization S) (Localization (_root_.Algebra.algebraMapSubmonoid B S))
      (algebraMap B _ b) = algebraMap R _ (projectiveTrace R B b) :=
  sorry

end AlgebraTrace

section AlgebraTraceTests

/- `k[x]/(x²)` (Mathlib's dual numbers) has trace `Tr(1) = 2` and one geometric point. -/
-- test Algebra.projectiveTrace_test_ramified (non-example) [R3/finite-locally-free-algebra-trace]
example (k : Type*) [Field k] [Module.Finite k (DualNumber k)]
    [Module.Projective k (DualNumber k)] :
    projectiveTrace k (DualNumber k) 1 = 2 :=
  sorry

/- `R = ℚ × ℚ`, `B = ℚ × (ℚ × ℚ)` via `(a, b) ↦ (a, (b, b))`: rank `(1, 2)`, so
`Tr(1) = (1, 2)`, while Mathlib's `Algebra.trace` gives `0` (no finite basis). -/
-- test Algebra.projectiveTrace_test_nonconstant_rank (non-example)
--   [R3/finite-locally-free-algebra-trace]
example :
    letI : _root_.Algebra (ℚ × ℚ) (ℚ × (ℚ × ℚ)) :=
      ((RingHom.fst ℚ ℚ).prod ((RingHom.snd ℚ ℚ).prod (RingHom.snd ℚ ℚ))).toAlgebra
    ∀ [Module.Finite (ℚ × ℚ) (ℚ × (ℚ × ℚ))] [Module.Projective (ℚ × ℚ) (ℚ × (ℚ × ℚ))],
      projectiveTrace (ℚ × ℚ) (ℚ × (ℚ × ℚ)) 1 = (1, 2) ∧
        _root_.Algebra.trace (ℚ × ℚ) (ℚ × (ℚ × ℚ)) 1 = 0 :=
  sorry

-- test Algebra.projectiveTrace_test_quadratic (computation) [R3/finite-locally-free-algebra-trace]
example {R : Type*} [CommRing R] (d a b : R)
    [Module.Finite R (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C d))]
    [Module.Projective R (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C d))] :
    projectiveTrace R (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C d))
        (algebraMap R _ a + algebraMap R _ b * AdjoinRoot.root _) = 2 * a ∧
      projectiveTrace R (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C d))
        (AdjoinRoot.root _ ^ 2) = 2 * d :=
  sorry

-- test Algebra.projectiveTrace_test_self (degenerate) [R3/finite-locally-free-algebra-trace]
example {R : Type*} [CommRing R] :
    projectiveTrace R R = _root_.LinearMap.id ∧ projectiveTrace R PUnit = 0 :=
  sorry

-- test Algebra.projectiveTrace_test_free (compatibility) [R3/finite-locally-free-algebra-trace]
example {R B : Type*} [CommRing R] [CommRing B] [_root_.Algebra R B] [Module.Finite R B]
    [Module.Free R B] (b : B) :
    projectiveTrace R B b = _root_.Algebra.trace R B b :=
  sorry

end AlgebraTraceTests

/-! ## AdicSpacesPartII:R3/algebra-trace-base-change (lemma) -/

/-- R3/algebra-trace-base-change: `Tr_{R' ⊗_R B / R'}(1 ⊗ b)` is the image of `Tr_{B/R}(b)`.
The module half is `LinearMap.projectiveTrace_baseChange`. -/
theorem projectiveTrace_baseChange {R B : Type*} [CommRing R] [CommRing B] [_root_.Algebra R B]
    [Module.Finite R B] [Module.Projective R B] (R' : Type*) [CommRing R'] [_root_.Algebra R R']
    (b : B) :
    projectiveTrace R' (R' ⊗[R] B) (1 ⊗ₜ b) = algebraMap R R' (projectiveTrace R B b) :=
  sorry

/-! ## AdicSpacesPartII:R3/algebra-trace-transitivity (lemma) -/

/-- R3/algebra-trace-transitivity: in a tower `R → B → C` of finite projective algebras,
`C` is finite projective over `R` and `Tr_{C/R} = Tr_{B/R} ∘ Tr_{C/B}`. -/
theorem projectiveTrace_trans {R B C : Type*} [CommRing R] [CommRing B] [CommRing C]
    [_root_.Algebra R B] [_root_.Algebra B C] [_root_.Algebra R C] [IsScalarTower R B C]
    [Module.Finite R B] [Module.Projective R B] [Module.Finite B C] [Module.Projective B C] :
    ∃ (_ : Module.Finite R C) (_ : Module.Projective R C), ∀ c : C,
      projectiveTrace R C c = projectiveTrace R B (projectiveTrace B C c) :=
  sorry

/-- R3/algebra-trace-transitivity, module form: for a finite projective `B`-module `M` and
`φ ∈ End_B(M)`, `M` is finite projective over `R` and `tr_{M/R}(φ) = Tr_{B/R}(tr_{M/B}(φ))`. -/
theorem projectiveTrace_trans_module {R B M : Type*} [CommRing R] [CommRing B]
    [_root_.Algebra R B] [Module.Finite R B] [Module.Projective R B] [AddCommGroup M]
    [Module B M] [Module R M] [IsScalarTower R B M] [Module.Finite B M] [Module.Projective B M] :
    ∃ (_ : Module.Finite R M) (_ : Module.Projective R M), ∀ φ : M →ₗ[B] M,
      LinearMap.projectiveTrace R M (φ.restrictScalars R) =
        projectiveTrace R B (LinearMap.projectiveTrace B M φ) :=
  sorry

/-! ## AdicSpacesPartII:R3/etale-iff-trace-pairing-perfect (lemma) -/

/-- R3/etale-iff-trace-pairing-perfect: a finite projective `R`-algebra `S` is étale if and only if
its trace pairing `S → Hom_R(S, R)`, `x ↦ (y ↦ Tr_{S/R}(x y))`, is bijective. -/
theorem etale_iff_projectiveTraceForm_perfect {R S : Type*} [CommRing R] [CommRing S]
    [_root_.Algebra R S] [Module.Finite R S] [Module.Projective R S] :
    _root_.Algebra.Etale R S ↔ Function.Bijective (projectiveTraceForm R S) :=
  sorry

/-! ## AdicSpacesPartII:R3/trace-geometric-point-formula (lemma) -/

/-- R3/trace-geometric-point-formula: for a finite étale algebra `B` over a field `k` and an
algebraically closed `Ω ⊇ k`, `Hom_k(B, Ω)` has `dim_k B` elements and
`Tr_{B/k}(b) = ∑_{σ : B → Ω} σ(b)`. -/
theorem projectiveTrace_eq_sum_algHom {k B Ω : Type*} [Field k] [CommRing B] [_root_.Algebra k B]
    [_root_.Algebra.Etale k B] [Module.Finite k B] [Field Ω] [_root_.Algebra k Ω] [IsAlgClosed Ω]
    [Module.Projective k B] :
    Nat.card (B →ₐ[k] Ω) = Module.finrank k B ∧
      ∀ b : B, algebraMap k Ω (projectiveTrace k B b) = ∑ᶠ σ : B →ₐ[k] Ω, σ b :=
  sorry

end Algebra

/-! ## AdicSpacesPartII:R3/scheme-trace-finite-locally-free (construction) -/

namespace AlgebraicGeometry.Scheme.Hom

open _root_.AlgebraicGeometry CategoryTheory

universe u

variable {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] [LocallyOfFinitePresentation π]

/-- R3/scheme-trace-finite-locally-free: the trace `Tr_π : π_* 𝒪_X → 𝒪_Y` of a finite locally
free morphism of schemes, glued from `Algebra.projectiveTrace` on affine opens. -/
def finiteTrace :
    (Scheme.Modules.pushforward π).obj (SheafOfModules.unit X.ringCatSheaf) ⟶
      SheafOfModules.unit Y.ringCatSheaf :=
  sorry

/-- R3/scheme-trace-finite-locally-free: on an affine open `V ⊆ Y`, with `π⁻¹V = Spec B`, the
trace is `Algebra.projectiveTrace Γ(Y, V) Γ(X, π⁻¹V)`. -/
theorem finiteTrace_app_affine (V : Y.Opens) (hV : IsAffineOpen V) :
    letI := (π.app V).hom.toAlgebra
    ∀ [Module.Finite Γ(Y, V) Γ(X, π ⁻¹ᵁ V)] [Module.Projective Γ(Y, V) Γ(X, π ⁻¹ᵁ V)]
      (b : Γ(X, π ⁻¹ᵁ V)),
      ((finiteTrace π).app V).hom b = Algebra.projectiveTrace Γ(Y, V) Γ(X, π ⁻¹ᵁ V) b :=
  sorry

/-- R3/scheme-trace-finite-locally-free: `Tr_π ∘ π^♯` is multiplication by the locally constant
degree `d` of `π`, a global section of `𝒪_Y` whose germs are natural numbers. -/
theorem finiteTrace_comp_unit :
    ∃ d : Γ(Y, ⊤), (∀ y : Y, ∃ n : ℕ, (Y.presheaf.germ ⊤ y trivial).hom d = n) ∧
      ∀ (V : Y.Opens) (a : Γ(Y, V)),
        ((finiteTrace π).app V).hom ((π.app V).hom a) =
          (Y.presheaf.map (homOfLE le_top).op).hom d * a :=
  sorry

-- AlgebraicGeometry.Scheme.Hom.finiteTrace_baseChange: not stated here; needs the base-change
--   isomorphism `g^* π_* 𝒪_X ≅ π'_* 𝒪_{X'}` of quasi-coherent modules along an affine morphism,
--   which Mathlib lacks at the pin (supplier: AdicSpacesPartII:R3/scheme-trace-finite-locally-free);
--   its affine content is `Algebra.projectiveTrace_baseChange`

/-- R3/scheme-trace-finite-locally-free: `Tr_{π' ≫ π} = Tr_π ∘ π_*(Tr_{π'})`. -/
theorem finiteTrace_comp {X' : Scheme.{u}} (π' : X' ⟶ X) [IsFinite π'] [Flat π']
    [LocallyOfFinitePresentation π'] [IsFinite (π' ≫ π)] [Flat (π' ≫ π)]
    [LocallyOfFinitePresentation (π' ≫ π)] :
    finiteTrace (π' ≫ π) =
      (Scheme.Modules.pushforwardComp π' π).inv.app (SheafOfModules.unit X'.ringCatSheaf) ≫
        (Scheme.Modules.pushforward π).map (finiteTrace π') ≫ finiteTrace π :=
  sorry

/-- R3/scheme-trace-finite-locally-free: for the trivial `d`-sheeted cover `∐_{i < d} Y → Y` the
trace is the sum of the restrictions along the `d` coprojections. -/
theorem finiteTrace_coprod {d : ℕ} [IsFinite (Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y)]
    [Flat (Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y)]
    [LocallyOfFinitePresentation (Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y)] (V : Y.Opens)
    (h : ∀ i, V ≤ (Limits.Sigma.ι (fun _ : Fin d ↦ Y) i) ⁻¹ᵁ
      ((Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y) ⁻¹ᵁ V))
    (s : Γ(∐ fun _ : Fin d ↦ Y, (Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y) ⁻¹ᵁ V)) :
    ((finiteTrace (Limits.Sigma.desc fun _ : Fin d ↦ 𝟙 Y)).app V).hom s =
      ∑ i, ((Limits.Sigma.ι (fun _ : Fin d ↦ Y) i).appLE _ V (h i)).hom s :=
  sorry

/-- R3/scheme-trace-finite-locally-free: the trace pairing `(f, g) ↦ Tr_π(f g)` on the sections
of `π_* 𝒪_X` over an open `V ⊆ Y`. -/
def traceForm (V : Y.Opens) :
    letI := (π.app V).hom.toAlgebra
    LinearMap.BilinForm Γ(Y, V) Γ(X, π ⁻¹ᵁ V) :=
  sorry

/-- R3/scheme-trace-finite-locally-free: `π` is étale if and only if its trace pairing is perfect
on every affine open (the discriminant is empty); the affine case is
`Algebra.etale_iff_projectiveTraceForm_perfect`. -/
theorem etale_iff_traceForm_perfect :
    Etale π ↔ ∀ V : Y.Opens, IsAffineOpen V → Function.Bijective (traceForm π V) :=
  sorry

end AlgebraicGeometry.Scheme.Hom

section SchemeTraceTests

open _root_.AlgebraicGeometry CategoryTheory _root_.TauCeti.AlgebraicGeometry.Scheme.Hom

/- `π : Spec k[t][x]/(x² − t) → Spec k[t]`: `Γ(Tr_π)(a + b x) = 2a`. -/
-- test AlgebraicGeometry.Scheme.Hom.finiteTrace_test_double_cover (computation)
--   [R3/scheme-trace-finite-locally-free]
example (k : Type) [Field k]
    (π : Spec (CommRingCat.of (AdjoinRoot (Polynomial.X ^ 2 -
      Polynomial.C (Polynomial.X : Polynomial k)))) ⟶ Spec (CommRingCat.of (Polynomial k)))
    (hπ : π = Spec.map (CommRingCat.ofHom (algebraMap _ _))) [IsFinite π] [Flat π]
    [LocallyOfFinitePresentation π] (a b : Polynomial k) :
    (Scheme.ΓSpecIso (CommRingCat.of (Polynomial k))).hom.hom (((finiteTrace π).app ⊤).hom
      ((Scheme.ΓSpecIso (CommRingCat.of (AdjoinRoot (Polynomial.X ^ 2 -
        Polynomial.C (Polynomial.X : Polynomial k))))).inv.hom
          (algebraMap _ _ a + algebraMap _ _ b * AdjoinRoot.root _))) = 2 * a :=
  sorry

/- For the same double cover in characteristic `≠ 2` the fibre over `t = 0` has one geometric
point, but `Tr_π(1) = 2` everywhere, including at `t = 0`. -/
-- test AlgebraicGeometry.Scheme.Hom.finiteTrace_test_ramified (non-example)
--   [R3/scheme-trace-finite-locally-free]
example (k : Type) [Field k] [NeZero (2 : k)]
    (π : Spec (CommRingCat.of (AdjoinRoot (Polynomial.X ^ 2 -
      Polynomial.C (Polynomial.X : Polynomial k)))) ⟶ Spec (CommRingCat.of (Polynomial k)))
    (hπ : π = Spec.map (CommRingCat.ofHom (algebraMap _ _))) [IsFinite π] [Flat π]
    [LocallyOfFinitePresentation π] :
    (Scheme.ΓSpecIso (CommRingCat.of (Polynomial k))).hom.hom
      (((finiteTrace π).app ⊤).hom ((π.app ⊤).hom 1)) = 2 :=
  sorry

-- test AlgebraicGeometry.Scheme.Hom.finiteTrace_test_id (degenerate)
--   [R3/scheme-trace-finite-locally-free]
example (Y : Scheme) : finiteTrace (𝟙 Y) = 𝟙 _ :=
  sorry

/- If `Γ(X, π⁻¹V)` is free over `Γ(Y, V)` on an affine open `V` (for instance `Y = Spec A`,
`X = Spec B`, `B` free over `A`, `V = ⊤`), the trace is Mathlib's `Algebra.trace`. -/
-- test AlgebraicGeometry.Scheme.Hom.finiteTrace_test_affine_free (compatibility)
--   [R3/scheme-trace-finite-locally-free]
example {X Y : Scheme} (π : X ⟶ Y) [IsFinite π] [Flat π] [LocallyOfFinitePresentation π]
    (V : Y.Opens) (hV : IsAffineOpen V) :
    letI := (π.app V).hom.toAlgebra
    ∀ [Module.Free Γ(Y, V) Γ(X, π ⁻¹ᵁ V)] [Module.Finite Γ(Y, V) Γ(X, π ⁻¹ᵁ V)]
      (b : Γ(X, π ⁻¹ᵁ V)), ((finiteTrace π).app V).hom b = Algebra.trace Γ(Y, V) Γ(X, π ⁻¹ᵁ V) b :=
  sorry

end SchemeTraceTests

namespace AdicSpace

/-! ## AdicSpacesPartII:R3/finite-locally-free-morphism (definition) -/

-- AdicSpace.IsFiniteLocallyFree: not stated here; needs finite morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/finite-morphism) and `AdicSpace.VectorBundle` (supplier:
--   AdicSpaces Layer 5). Its affinoid core is a finite projective algebra, the setting of
--   `Algebra.projectiveTrace`.
-- AdicSpace.IsFiniteLocallyFree.degree: not stated here; needs `AdicSpace.IsFiniteLocallyFree`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteLocallyFree.comp: not stated here; needs `AdicSpace.IsFiniteLocallyFree`
--   (supplier: AdicSpaces Layer 5)
-- AdicSpace.IsFiniteLocallyFree.baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.IsFiniteLocallyFree.of_finite_etale: not stated here; needs étale morphisms of adic
--   spaces (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale)
-- AdicSpace.isFiniteLocallyFree_affinoid_iff: not stated here; needs sheafy Tate affinoid adic
--   spaces (supplier: AdicSpaces Layer 4)
-- AdicSpace.IsFiniteLocallyFree.analytification: not stated here; needs the analytification
--   functor (supplier: AdicSpacesPartII:R1/analytification-functor)
-- AdicSpace.IsFiniteLocallyFree.isProper: not stated here; needs proper morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/universally-closed-and-proper-morphism)
-- AdicSpace.IsFiniteLocallyFree.test_power_map: not stated here; needs the closed disc as an
--   adic space (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.IsFiniteLocallyFree.test_closed_point: not stated here; needs the origin of the disc
--   as a closed immersion of adic spaces (supplier:
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings) [non-example test]
-- AdicSpace.IsFiniteLocallyFree.test_id_empty: not stated here; needs the category of adic
--   spaces (supplier: AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.IsFiniteLocallyFree.test_analytification: not stated here; needs the analytification
--   functor (supplier: AdicSpacesPartII:R1/analytification-functor) [compatibility test]

/-! ## AdicSpacesPartII:R3/finite-locally-free-projection-formula (lemma) -/

-- AdicSpace.IsFiniteLocallyFree.projectionFormula: not stated here; needs pushforward, pullback
--   and tensor products of 𝒪_X-modules on adic spaces (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/analytic-trace-finite-locally-free (construction) -/

-- AdicSpace.finiteTrace: not stated here; needs `AdicSpace.IsFiniteLocallyFree` and
--   pushforward of 𝒪_X-modules on adic spaces (supplier: AdicSpaces Layer 5). Its scheme
--   analogue is `AlgebraicGeometry.Scheme.Hom.finiteTrace` and its affinoid value is
--   `Algebra.projectiveTrace`.
-- AdicSpace.VectorBundle.trace: not stated here; needs `AdicSpace.VectorBundle` (supplier:
--   AdicSpaces Layer 5); its value on a free piece is `LinearMap.projectiveTrace`
-- AdicSpace.finiteTrace_app_affinoid: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTrace_comp_unit: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTrace_linear: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTrace_baseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.finiteTrace_comp: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTraceForm: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTrace_coprod: not stated here; needs disjoint unions of adic spaces (supplier:
--   AdicSpaces Layer 5)
-- AdicSpace.finiteTrace_test_power_map: not stated here; needs the closed disc as an adic space
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.finiteTrace_test_ramified: not stated here; needs the closed disc as an adic space
--   (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.finiteTrace_test_id: not stated here; needs `AdicSpace.finiteTrace` (supplier:
--   AdicSpaces Layer 5) [degenerate test]
-- AdicSpace.finiteTrace_test_split: not stated here; needs disjoint unions of adic spaces
--   (supplier: AdicSpaces Layer 5) [characterisation test]
-- AdicSpace.finiteTrace_test_algebraic: not stated here; needs the analytification functor
--   (supplier: AdicSpacesPartII:R1/analytification-functor) [compatibility test]

/-! ## AdicSpacesPartII:R3/trace-base-change-composition (lemma) -/

-- AdicSpace.finiteTrace_baseChange: not stated here (the statement of this node is the api item
--   of the same name above); needs fibre products of adic spaces (supplier:
--   AdicSpacesPartII:R0/fibre-products-existence). Part (b) is `AdicSpace.finiteTrace_comp`.

/-! ## AdicSpacesPartII:R3/finite-etale-trace-pairing (lemma) -/

-- AdicSpace.finiteTraceForm_perfect_of_etale: not stated here; needs `AdicSpace.finiteTraceForm`
--   and étale morphisms of adic spaces (supplier:
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale). Its affinoid core is
--   `Algebra.etale_iff_projectiveTraceForm_perfect` and `Algebra.projectiveTrace_eq_sum_algHom`.

/-! ## AdicSpacesPartII:R3/analytic-algebraic-trace-compatibility (lemma) -/

-- AdicSpace.finiteTrace_analytification: not stated here; needs the relative analytification
--   (supplier: AdicSpacesPartII:R1/scheme-fibre-product-analytification) and
--   `AdicSpace.finiteTrace` (supplier: AdicSpaces Layer 5)

/-! ## AdicSpacesPartII:R3/pull-identify-trace (construction) -/

-- AdicSpace.Correspondence: not stated here; needs morphisms of adic spaces and
--   `AdicSpace.IsFiniteLocallyFree` (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.pullIdentifyTrace: not stated here; needs sheaf cohomology of
--   𝒪_X-modules on adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.pullIdentifyTrace_id: not stated here; needs
--   `AdicSpace.Correspondence.pullIdentifyTrace` (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.pullIdentifyTrace_comp: not stated here; needs fibre products of adic
--   spaces (supplier: AdicSpacesPartII:R0/fibre-products-existence)
-- AdicSpace.Correspondence.pullIdentifyTrace_add: not stated here; needs
--   `AdicSpace.Correspondence.pullIdentifyTrace` (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.pullIdentifyTrace_one: not stated here; needs
--   `AdicSpace.Correspondence.pullIdentifyTrace` (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.pullIdentifyTrace_analytification: not stated here; needs the
--   analytification functor and the GAGA comparison maps (supplier:
--   AdicSpacesPartII:R1/analytification-functor)
-- AdicSpace.Correspondence.pullIdentifyTrace_restrict: not stated here; needs open subspaces of
--   adic spaces (supplier: AdicSpaces Layer 5)
-- AdicSpace.Correspondence.test_split: not stated here; needs disjoint unions of adic spaces
--   (supplier: AdicSpaces Layer 5) [computation test]
-- AdicSpace.Correspondence.test_identity: not stated here; needs
--   `AdicSpace.Correspondence.pullIdentifyTrace` (supplier: AdicSpaces Layer 5)
--   [degenerate test]
-- AdicSpace.Correspondence.test_ramified_count: not stated here; needs the closed disc as an adic
--   space (supplier: AdicSpaces Layer 5) [non-example test]
-- AdicSpace.Correspondence.test_algebraic: not stated here; needs the analytification functor
--   (supplier: AdicSpacesPartII:R1/analytification-functor) [compatibility test]

end AdicSpace

end TauCeti

end

/-! # Layer R4. The étale and pro-étale sites on these carriers -/

noncomputable section

namespace TauCeti

/-! # R4: the étale and pro-étale sites on the carriers of R0 and R1

Every object of this stage lives on the anchor's category of adic spaces (AdicSpaces Layer 5),
on R0's étale morphisms `AdicSpace.Etale` and on the sites of AdicEtaleGeometry A1; none of these
is in the pinned libraries, so the site-theoretic items are comments. Their intended shape follows
Mathlib's small étale site of a scheme: `AlgebraicGeometry.Scheme.Etale`,
`AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.MorphismProperty.Over`,
`CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.Functor.IsContinuous`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.Functor.sheafPullback`,
`CategoryTheory.Functor.IsDenseSubsite`, `CategoryTheory.GrothendieckTopology.Point` and
`CategoryTheory.Ind` (pro-objects as `(Ind Cᵒᵖ)ᵒᵖ`). The category of adic spaces étale over `X`
is called `AdicSpace.SmallEtale X` below, so that it does not collide with R0's morphism class
`AdicSpace.Etale`.

What is stated: the algebraic (scheme-level) core of a smooth pair, that is, strict normal
crossings charts of an ideal in a `K`-algebra and strict normal crossings pairs on smooth
`K`-schemes (the input of `R4/analytification-of-smooth-pair`), and the spa-level core of the
punctured-disc test. -/

/-! ## AdicSpacesPartII:R4/etale-site-on-analytic-carriers (comparison) -/

-- AdicSpace.SmallEtale: not stated here; needs the category of adic spaces and R0's étale
--   morphisms (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/differentials-unramified-smooth-etale).
--   Intended form: `MorphismProperty.Over @AdicSpace.Etale ⊤ X`, as `Scheme.Etale`.
-- AdicSpace.etale_iff_isEtaleLocalDescription: not stated here; needs adic spaces and A1's
--   local description of étale morphisms (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.smallEtalePretopology: not stated here; needs adic spaces étale over a locally
--   noetherian analytic adic space (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/locally-noetherian-adic-space). Coverings: jointly surjective families.
-- AdicSpace.smallEtaleTopology: not stated here; needs `AdicSpace.SmallEtale`
--   (supplier: AdicSpaces Layer 5). Intended value: `(smallEtalePretopology X).toGrothendieck`.
-- AdicSpace.ofArrows_mem_smallEtaleTopology_iff: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.smallEtaleTopology_eq_A1: not stated here; needs A1's étale site
--   (supplier: AdicEtaleGeometry:A1).

/-! ## AdicSpacesPartII:R4/etale-site-functoriality (lemma) -/

-- AdicSpace.etaleBaseChange: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence).
-- AdicSpace.etaleBaseChange.isContinuous: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicSpaces Layer 5). Intended form: an instance of `Functor.IsContinuous`.
-- AdicSpace.etalePushforward: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicSpaces Layer 5). Intended value:
--   `(etaleBaseChange f).sheafPushforwardContinuous A _ _`; the inverse image is
--   `Functor.sheafPullback`.
-- AdicSpace.etaleBaseChangeComp: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5).

/-! ## AdicSpacesPartII:R4/etale-site-and-rigid-comparison (comparison) -/

-- RigidSpace.smallEtaleTopology: not stated here; needs rigid analytic spaces and their étale
--   morphisms (supplier: AdicSpacesPartII:R1/rigid-analytic-space).
-- RigidSpace.rEtale: not stated here; needs rigid spaces and Huber's functor `r`
--   (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor).
-- RigidSpace.rEtale.isDenseSubsite: not stated here; needs rigid spaces and adic spaces
--   (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor).
-- AdicSpace.rigidEtaleSheafEquiv: not stated here; needs rigid spaces, adic spaces and their
--   étale sites (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor, AdicSpaces Layer 5).

/-! ## AdicSpacesPartII:R4/rigid-strongly-surjective-covers (lemma) -/

-- RigidSpace.IsStronglySurjective: not stated here; needs rigid analytic spaces with admissible
--   opens (supplier: AdicSpacesPartII:R1/rigid-analytic-space).
-- RigidSpace.isStronglySurjective_iff: not stated here; needs rigid spaces and Huber's functor
--   `r` (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor).

/-! ## AdicSpacesPartII:R4/analytification-etale-site (comparison) -/

-- AdicSpace.analytificationEtale: not stated here; needs adic spaces and the analytification
--   functor (supplier: AdicSpacesPartII:R1/analytification-functor). Its source is Mathlib's
--   `AlgebraicGeometry.Scheme.Etale X` with `AlgebraicGeometry.Scheme.smallEtaleTopology X`.
-- AdicSpace.analytificationEtale.isContinuous: not stated here; needs adic spaces
--   (supplier: AdicSpacesPartII:R1/analytification-functor).
-- AdicSpace.analytificationEtale_naturality: not stated here; needs adic spaces
--   (supplier: AdicSpacesPartII:R1/analytification-functor).

/-! ## AdicSpacesPartII:R4/proetale-site-on-analytic-carriers (comparison) -/

-- AdicSpace.ProEtale: not stated here; needs `AdicSpace.SmallEtale` (supplier: AdicSpaces
--   Layer 5) and A1's corrected pro-étale site (supplier: AdicEtaleGeometry:A1). Intended form:
--   a full subcategory of `(Ind (AdicSpace.SmallEtale X)ᵒᵖ)ᵒᵖ`.
-- AdicSpace.proetaleTopology: not stated here; needs `AdicSpace.ProEtale`
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.nu: not stated here; needs `AdicSpace.ProEtale` (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.nu.isContinuous: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.nu.fullyFaithful: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.countable_presentation_mem_proetaleTopology: not stated here; needs the corrected
--   pro-étale coverings (supplier: AdicEtaleGeometry:A1).

/-! ## AdicSpacesPartII:R4/proetale-site-functoriality (lemma) -/

-- AdicSpace.proetaleBaseChange: not stated here; needs the pro-étale site and fibre products of
--   adic spaces (supplier: AdicEtaleGeometry:A1, AdicSpaces Layer 5).
-- AdicSpace.nu_comp_proetaleBaseChange: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1).

/-! ## AdicSpacesPartII:R4/etale-slice-site (lemma) -/

-- AdicSpace.etaleSliceEquiv: not stated here; needs `AdicSpace.SmallEtale`
--   (supplier: AdicSpaces Layer 5). Intended form: `AdicSpace.SmallEtale U.left ≌ Over U`.
-- AdicSpace.etaleSliceEquiv_topology: not stated here; needs `AdicSpace.smallEtaleTopology`
--   (supplier: AdicSpaces Layer 5). The target topology is Mathlib's
--   `GrothendieckTopology.over`.

/-! ## AdicSpacesPartII:R4/proetale-slice-open-subspace (lemma) -/

-- AdicSpace.proetaleSliceEquiv: not stated here; needs the pro-étale site and open subspaces of
--   adic spaces (supplier: AdicEtaleGeometry:A1, AdicSpaces Layer 5).

/-! ## AdicSpacesPartII:R4/smooth-pair (definition) -/

-- AdicSpace.SmoothPair: not stated here; needs adic spaces smooth over `Spa(K, K°)` and closed
--   adic subspaces (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/smooth-morphism,
--   AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings). Its scheme-level core is
--   `AdicSpace.SmoothPair_scheme` below.
-- AdicSpace.SmoothPair.Chart: not stated here; needs open subspaces of adic spaces and étale
--   morphisms to the polydisc (supplier: AdicSpaces Layer 5,
--   AdicSpacesPartII:R0/differentials-unramified-smooth-etale). Its algebraic core is
--   `AdicSpace.SmoothPair.Chart_algebraic` below.
-- AdicSpace.SmoothPair.complement: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.j: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.isOpenImmersion_j: not stated here; needs open immersions of adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.mem_complement_iff: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.trivial: not stated here; needs smooth adic spaces
--   (supplier: AdicSpacesPartII:R0/smooth-morphism). Its scheme-level core is the example
--   `SmoothPair.test_empty_boundary_scheme` below.
-- AdicSpace.SmoothPair.model: not stated here; needs the closed polydisc as an adic space
--   (supplier: AdicSpaces Layer 5). Its algebraic core is `AdicSpace.SmoothPair.model_algebraic`.
-- AdicSpace.SmoothPair.restrict: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.pullbackEtale: not stated here; needs étale morphisms of adic spaces
--   (supplier: AdicSpacesPartII:R0/differentials-unramified-smooth-etale).
-- AdicSpace.SmoothPair.isCartier_D: not stated here; needs ideal sheaves on adic spaces
--   (supplier: AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings). Its algebraic core is
--   `AdicSpace.SmoothPair.isCartier_D_algebraic`.
-- AdicSpace.SmoothPair.analytification: not stated here; needs the analytification functor
--   (supplier: AdicSpacesPartII:R1/analytification-functor). Its input is
--   `AdicSpace.SmoothPair_scheme`.
-- AdicSpace.SmoothPair.isNormalCrossings_DLLZ: not stated here; needs adic spaces, their étale
--   site and log structures (supplier: AdicSpaces Layer 5, AdicEtaleGeometry:A1).

namespace AdicSpace

namespace SmoothPair

variable (K : Type*) [Field K]

/-- R4/smooth-pair, algebraic core of `AdicSpace.SmoothPair.Chart`: a *strict normal crossings
chart* of an ideal `I` of a ring `R` over `σ : K →+* R`. It consists of integers `r ≤ n` and a
ring map `coord : K[T₁, …, Tₙ] → R` over `σ` that is étale, such that `I` is generated by
`coord (T₁ ⋯ T_r)`. For `r = 0` the ideal is `⊤`, that is, the divisor is empty. -/
structure Chart_algebraic {R : Type*} [CommRing R] (σ : K →+* R) (I : Ideal R) where
  /-- The dimension of the target affine space. -/
  n : ℕ
  /-- The number of coordinates cutting out the divisor. -/
  r : ℕ
  /-- `r ≤ n`. -/
  le : r ≤ n
  /-- The coordinates `T₁, …, Tₙ ↦ coord Tᵢ`. -/
  coord : MvPolynomial (Fin n) K →+* R
  /-- The coordinate map is a map over `K`. -/
  coord_comp_C : coord.comp MvPolynomial.C = σ
  /-- The coordinate map is étale. -/
  etale : coord.Etale
  /-- The ideal is generated by the product of the first `r` coordinates. -/
  ideal_eq : I = Ideal.span {coord (∏ i : Fin r, MvPolynomial.X (Fin.castLE le i))}

/-- R4/smooth-pair, algebraic core of `AdicSpace.SmoothPair.model`: the identity chart of
`K[T₁, …, Tₙ]` for the ideal `(T₁ ⋯ T_r)`. -/
def model_algebraic (n r : ℕ) (hr : r ≤ n) :
    Chart_algebraic K (MvPolynomial.C : K →+* MvPolynomial (Fin n) K)
      (Ideal.span {∏ i : Fin r, MvPolynomial.X (Fin.castLE hr i)}) := sorry

/-- R4/smooth-pair, algebraic core of `AdicSpace.SmoothPair.isCartier_D`: in a strict normal
crossings chart the generator `coord (T₁ ⋯ T_r)` is a non-zero-divisor (an étale map is flat)
and the ideal is radical (étale over the reduced ring `K[T]/(T₁ ⋯ T_r)`), so the divisor is an
effective Cartier divisor and is reduced. -/
theorem isCartier_D_algebraic {R : Type*} [CommRing R] {σ : K →+* R} {I : Ideal R}
    (c : Chart_algebraic K σ I) :
    c.coord (∏ i : Fin c.r, MvPolynomial.X (Fin.castLE c.le i)) ∈ nonZeroDivisors R ∧
      I.IsRadical := sorry

end SmoothPair

open _root_.AlgebraicGeometry CategoryTheory

universe u

/-- R4/smooth-pair, scheme-level core of `AdicSpace.SmoothPair`: an *algebraic strict normal
crossings pair* over a field `K`, the input of `AdicSpace.SmoothPair.analytification` and of
R4/analytification-of-smooth-pair. It is a scheme `X` smooth over `Spec K` with an ideal sheaf
`D` such that every point has an affine open neighbourhood `U` on which `D` has a strict normal
crossings chart (`AdicSpace.SmoothPair.Chart_algebraic`) over the `K`-algebra structure of
`Γ(X, U)`. -/
structure SmoothPair_scheme (K : Type u) [Field K] where
  /-- The underlying scheme. -/
  X : Scheme.{u}
  /-- The structure morphism to `Spec K`. -/
  toSpec : X ⟶ Spec (CommRingCat.of K)
  /-- `X` is smooth over `K`. -/
  smooth : Smooth toSpec
  /-- The ideal sheaf of the divisor `D`. -/
  D : X.IdealSheafData
  /-- Every point has a strict normal crossings chart on an affine open neighbourhood. -/
  exists_chart : ∀ x : X, ∃ U : X.affineOpens, x ∈ U.1 ∧
    Nonempty (SmoothPair.Chart_algebraic K
      ((Scheme.ΓSpecIso (CommRingCat.of K)).inv ≫ toSpec.appLE ⊤ U.1 (by simp)).hom
      (D.ideal U))

end AdicSpace

namespace AdicSpace.SmoothPair

open _root_.AlgebraicGeometry CategoryTheory MvPolynomial

universe u

-- SmoothPair.test_punctured_disc: not stated here; needs the closed disc as an adic space and
--   its open subspaces (supplier: AdicSpaces Layer 5) [computation test]. Its spa-level core is
--   the next example.
/- The spa-level core of `SmoothPair.test_punctured_disc`: in the closed unit disc
`Spa(K⟨T⟩, K⟨T⟩°)` over a complete Tate field `K`, the complement `{v | v(T) ≠ 0}` of the origin is
not quasi-compact (it is the increasing union of the rational subsets `{|ϖⁿ| ≤ |T|}`). -/
-- test SmoothPair.test_punctured_disc_spa (computation) [R4/smooth-pair]
example (K : Type*) [Field K] [UniformSpace K] [IsUniformAddGroup K] [IsTopologicalRing K]
    [Huber.IsTateRing K] [CompleteSpace K] [T2Space K] :
    ¬ IsCompact {v | v ∈ ValuationSpectrum.closedPolydisc 1 K ∧
      Huber.weightedX (fun _ : Fin 1 ↦ ({1} : Set K)) Huber.isWeightFamily_one_weight 0 ∉
        v.supp} := sorry

-- SmoothPair.test_empty_boundary: not stated here; needs smooth adic spaces
--   (supplier: AdicSpacesPartII:R0/smooth-morphism) [degenerate test]. Its scheme-level core
--   is the next example.
/- The scheme-level core of `SmoothPair.test_empty_boundary`: on a smooth `K`-scheme every point
has an affine neighbourhood with a strict normal crossings chart of the unit ideal (`r = 0`),
so `(X, ∅)` is an algebraic strict normal crossings pair. -/
-- test SmoothPair.test_empty_boundary_scheme (degenerate) [R4/smooth-pair]
example (K : Type u) [Field K] (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of K)) [Smooth f] :
    ∀ x : X, ∃ U : X.affineOpens, x ∈ U.1 ∧
      Nonempty (Chart_algebraic K
        ((Scheme.ΓSpecIso (CommRingCat.of K)).inv ≫ f.appLE ⊤ U.1 (by simp)).hom ⊤) := sorry

-- SmoothPair.test_three_lines_not_pair: not stated here; needs the polydisc `B²_K` as an adic
--   space (supplier: AdicSpaces Layer 5) [non-example test]. Its algebraic core is the next
--   example.
/- The algebraic core of `SmoothPair.test_three_lines_not_pair`: no Zariski neighbourhood
`D(g)` of the origin of `𝔸²_K` carries a strict normal crossings chart of `(T₁ T₂ (T₁ - T₂))`. -/
-- test SmoothPair.test_three_lines_not_pair_algebraic (non-example) [R4/smooth-pair]
example (K : Type*) [Field K] (g : MvPolynomial (Fin 2) K) (hg : eval 0 g ≠ 0) :
    IsEmpty (Chart_algebraic K (algebraMap K (Localization.Away g))
      (Ideal.span {algebraMap (MvPolynomial (Fin 2) K) (Localization.Away g)
        (X 0 * X 1 * (X 0 - X 1))})) := sorry

-- SmoothPair.test_nonstrict_conjugate_lines: not stated here; needs the polydisc `B²` over `ℚ_p`
--   as an adic space and Diao–Lan–Liu–Zhu normal crossings divisors (supplier: AdicSpaces
--   Layer 5) [non-example test]. Its algebraic core is the next example.
/- The algebraic core of `SmoothPair.test_nonstrict_conjugate_lines`: over `ℚ_p`, no Zariski
neighbourhood `D(g)` of the origin of `𝔸²` carries a strict normal crossings chart of
`(T₁² - p T₂²)`, whose germ at the origin is irreducible over `ℚ_p`. -/
-- test SmoothPair.test_nonstrict_conjugate_lines_algebraic (non-example) [R4/smooth-pair]
example (p : ℕ) [Fact p.Prime] (g : MvPolynomial (Fin 2) ℚ_[p]) (hg : eval 0 g ≠ 0) :
    IsEmpty (Chart_algebraic ℚ_[p] (algebraMap ℚ_[p] (Localization.Away g))
      (Ideal.span {algebraMap (MvPolynomial (Fin 2) ℚ_[p]) (Localization.Away g)
        (X 0 ^ 2 - C (p : ℚ_[p]) * X 1 ^ 2)})) := sorry

-- SmoothPair.test_log_structure_trivial_on_complement: not stated here; needs the étale site of
--   an adic space and log structures on it (supplier: AdicEtaleGeometry:A1, AdicSpaces Layer 5)
--   [compatibility test].

end AdicSpace.SmoothPair

/-! ## AdicSpacesPartII:R4/analytification-of-smooth-pair (lemma) -/

-- AdicSpace.SmoothPair.analytification_complement: not stated here; needs the analytification
--   functor and adic smooth pairs (supplier: AdicSpacesPartII:R1/analytification-functor,
--   AdicSpaces Layer 5). Its hypothesis is an `AdicSpace.SmoothPair_scheme`.

/-! ## AdicSpacesPartII:R4/boundary-complement-restriction (construction) -/

-- AdicSpace.SmoothPair.complementEtale: not stated here; needs `AdicSpace.SmallEtale`
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.SmoothPair.etaleSiteComplementEquiv: not stated here; needs the étale sites of adic
--   spaces (supplier: AdicSpaces Layer 5, AdicEtaleGeometry:A1). Intended target:
--   `Over P.complementEtale` with Mathlib's `GrothendieckTopology.over`.
-- AdicSpace.SmoothPair.jEtale: not stated here; needs the étale sites of adic spaces
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jInv: not stated here; needs sheaves on the étale site of an adic space
--   (supplier: AdicEtaleGeometry:A1). Intended value: Mathlib's
--   `GrothendieckTopology.overPullback` transported along `etaleSiteComplementEquiv`.
-- AdicSpace.SmoothPair.jInv_obj_apply: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jPush: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jShriek: not stated here; needs abelian sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jAdjunction: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jShriekAdjunction: not stated here; needs abelian sheaves on the étale
--   site (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jInv_jPush_iso: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.jInv_jShriek_iso: not stated here; needs abelian sheaves on the étale
--   site (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.proetaleSiteComplementEquiv: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1).
-- AdicSpace.SmoothPair.nu_comp_jProet: not stated here; needs the pro-étale site
--   (supplier: AdicEtaleGeometry:A1).
-- SmoothPair.test_restriction_empty_boundary: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1) [degenerate test].
-- SmoothPair.test_jShriek_global_sections_disc: not stated here; needs abelian sheaves on the
--   étale site of the disc (supplier: AdicEtaleGeometry:A1) [computation test].
-- SmoothPair.test_j_not_quasicompact: not stated here; needs quasi-compact morphisms of adic
--   spaces (supplier: AdicSpaces Layer 5) [non-example test]. Its spa-level core is
--   `SmoothPair.test_punctured_disc_spa`.
-- SmoothPair.test_slice_topology_is_mathlib_over: not stated here; needs the étale site of an
--   adic space (supplier: AdicEtaleGeometry:A1) [compatibility test].
-- SmoothPair.test_jInv_jPush: not stated here; needs sheaves on the étale site
--   (supplier: AdicEtaleGeometry:A1) [characterisation test].

/-! ## AdicSpacesPartII:R4/geometric-points-pullback (comparison) -/

-- AdicSpace.GeometricPoint: not stated here; needs adic spaces and `Spa(C, C⁺)` as an adic
--   space (supplier: AdicSpaces Layer 5, AdicEtaleGeometry:A1).
-- AdicSpace.GeometricPoint.toPoint: not stated here; needs the étale site of an adic space
--   (supplier: AdicEtaleGeometry:A1). Intended target: Mathlib's `GrothendieckTopology.Point`.
-- AdicSpace.GeometricPoint.fiberComp: not stated here; needs the étale site and
--   `AdicSpace.etaleBaseChange` (supplier: AdicEtaleGeometry:A1, AdicSpaces Layer 5).

end TauCeti

end

/-! # Layer R5. Sousperfectoid spaces and families -/

noncomputable section

namespace TauCeti


universe u v w

open Topology UniformSpace TensorProduct

/-! ## Stand-in: perfectoid Tate rings (PerfectoidSpaces P1)

The stand-in of `research/blueprint/suggested/PerfectoidSpaces--P8.lean`, with the same fields.
-/

namespace Perfectoid

open Huber

/-- **Stand-in for PerfectoidSpaces P1's perfectoid Tate ring**, used by R5/sousperfectoid-ring
(ECD Definition 3.1, in the form the sources of R5 use), local to this file until P1 lands. A
topological ring `A` is a perfectoid Tate ring for the prime `p` if it is complete and Hausdorff,
Tate, uniform (`A°` bounded), has a pseudouniformizer `ϖ ∈ A°` with `ϖ ^ p ∣ p` in `A°`, and
Frobenius is surjective on `A° / p`. Completeness is for the canonical uniformity of the additive
group. -/
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

namespace Huber

open Perfectoid

/-! ## AdicSpacesPartII:R5/sousperfectoid-ring (definition) -/

section SousperfectoidRing

variable (p : ℕ) (R : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- R5/sousperfectoid-ring: a *perfectoid frame* `(R̃, ι, σ)` for a topological ring `R`
(Hansen–Kedlaya Definition 7.1, Scholze–Weinstein Berkeley Definition 6.3.1): a perfectoid Tate
ring `R̃` for the prime `p`, a continuous ring homomorphism `ι : R → R̃` and a continuous map
`σ : R̃ → R` that is `R`-linear for the `R`-module structure of `R̃` through `ι` (additive, with
`σ (ι r * x) = r * σ x`) and satisfies `σ ∘ ι = id`. The map `σ` need not be multiplicative and
need not respect any ring of integral elements. -/
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

/-- R5/sousperfectoid-ring: a topological ring `R` is *sousperfectoid* (for the prime `p`) if it
is a Tate ring admitting a perfectoid frame. Completeness, the Hausdorff property and the
topological nilpotence of `p` in `R` are consequences: `ι` identifies `R` with the closed subring
`ker (id - ι ∘ σ)` of the complete Hausdorff ring `R̃`, in which `p` is topologically nilpotent. -/
class IsSousperfectoid : Prop where
  /-- `R` is a Tate ring. -/
  isTateRing : IsTateRing R
  /-- `R` admits a perfectoid frame. -/
  nonempty_perfectoidFrame : Nonempty (PerfectoidFrame p R)

variable {p R}

/-- R5/sousperfectoid-ring (constructor): a perfectoid frame of a Tate ring makes it
sousperfectoid. -/
theorem IsSousperfectoid.of_frame [IsTateRing R] (F : PerfectoidFrame p R) :
    IsSousperfectoid p R := sorry

/-- R5/sousperfectoid-ring (constructor): a perfectoid Tate ring is sousperfectoid, through the
identity frame. -/
theorem IsSousperfectoid.of_isPerfectoidTateRing (h : IsPerfectoidTateRing p R) :
    IsSousperfectoid p R := sorry

/-- R5/sousperfectoid-ring (characterisation): `ι` is a closed embedding, onto the closed subring
`ker (id - ι ∘ σ)`; in particular it is injective and strict. -/
theorem PerfectoidFrame.isClosedEmbedding_ι (F : PerfectoidFrame p R) :
    IsClosedEmbedding F.ι := sorry

/-- R5/sousperfectoid-ring (characterisation): power-boundedness in a Tate ring is detected in a
perfectoid frame: `a ∈ R°` if and only if `ι a ∈ R̃°`. -/
theorem PerfectoidFrame.isPowerBounded_iff [IsTateRing R] (F : PerfectoidFrame p R) (a : R) :
    IsPowerBounded a ↔ IsPowerBounded (F.ι a) := sorry

/-- R5/sousperfectoid-ring (relation; the statement of R5/sousperfectoid-uniform): a
sousperfectoid ring is uniform, that is, `R°` is bounded (Hansen–Kedlaya Definition 2.3). -/
theorem IsSousperfectoid.isUniform [IsTateRing R] [IsSousperfectoid p R] :
    IsBounded (powerBoundedSubring R : Set R) := sorry

/-- R5/sousperfectoid-ring (relation): a sousperfectoid ring is reduced, since uniform Tate rings
are reduced. -/
theorem IsSousperfectoid.isReduced [IsSousperfectoid p R] : IsReduced R := sorry

/-- R5/sousperfectoid-ring (other): the sousperfectoid property is invariant under isomorphisms of
topological rings. -/
theorem IsSousperfectoid.of_ringEquiv {S : Type u} [CommRing S] [TopologicalSpace S]
    [IsTopologicalRing S] [IsSousperfectoid p R] (e : R ≃+* S) (he : Continuous e)
    (he' : Continuous e.symm) : IsSousperfectoid p S := sorry

/-- R5/sousperfectoid-ring (functoriality; R5/split-injection-completed-base-change): base change
of a perfectoid frame along a continuous map `R → S` of Tate rings whose completed tensor product
`R̃ ⊗̂_R S` (AdicSpacesPartII:R0/completed-tensor-product, `Huber.CompletedTensor`) is perfectoid.
The new frame has carrier `R̃ ⊗̂_R S`, embedding `s ↦ 1 ⊗ s` and retraction `σ ⊗̂ id`. -/
def PerfectoidFrame.baseChange [IsTateRing R] (F : PerfectoidFrame p R) {S : Type u} [CommRing S]
    [TopologicalSpace S] [IsTopologicalRing S] [IsTateRing S] [Algebra R S]
    (hf : Continuous (algebraMap R S))
    (hperf : letI := F.ι.toAlgebra; IsPerfectoidTateRing p (CompletedTensor R F.Rt S)) :
    PerfectoidFrame p S := sorry

end SousperfectoidRing

/-- R5/sousperfectoid-ring (instance; the statement of R5/sousperfectoid-rings): for a complete
sousperfectoid Tate ring `R`, the Tate algebra `R⟨T₁, …, Tₙ⟩` is sousperfectoid, with frame
`R̃⟨T₁^{1/p^∞}, …, Tₙ^{1/p^∞}⟩`. -/
instance IsSousperfectoid.restrictedMvPowerSeries {p : ℕ} (n : ℕ) (R : Type u) [CommRing R]
    [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R]
    [T2Space R] [IsSousperfectoid p R] :
    IsSousperfectoid p (restrictedMvPowerSeriesCompletion n R) := sorry

-- Huber.IsSousperfectoid.isSheafyPair: not stated here; needs the anchor's sheafiness of Huber
--   pairs, that is, the structure presheaf on Spa(R, R⁺) and its sheaf condition
--   (supplier: AdicSpaces Layer 4). Its ring-level input is
--   `Huber.IsSousperfectoid.isStablyUniform` (R5/sousperfectoid-stably-uniform).

section SousperfectoidTests

variable (p : ℕ) [Fact p.Prime]

-- test IsSousperfectoid.test_padic_tateAlgebra (computation) [R5/sousperfectoid-ring]
example : IsSousperfectoid p (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

-- test IsSousperfectoid.test_padic_tateAlgebra_not_perfectoid (non-example)
--   [R5/sousperfectoid-ring]
example : ¬ IsPerfectoidTateRing p (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

/- `ℚ_p⟨X, Q⟩ / (Q²)` is the ring of dual numbers over `ℚ_p⟨X⟩` with the product topology. It is
strongly noetherian and sheafy but not reduced, hence not sousperfectoid. -/
-- test IsSousperfectoid.test_dualNumbers (non-example) [R5/sousperfectoid-ring]
example : ¬ IsSousperfectoid p (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) := sorry

-- test IsSousperfectoid.test_padic (degenerate) [R5/sousperfectoid-ring]
example : IsSousperfectoid p ℚ_[p] := sorry

-- test IsSousperfectoid.test_of_perfectoid (compatibility) [R5/sousperfectoid-ring]
example (R : Type) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
    (h : IsPerfectoidTateRing p R) : IsSousperfectoid p R := sorry

/- Hansen–Kedlaya Lemma 7.10: for a uniform complete Tate ring of characteristic `p` with finite
Frobenius, sousperfectoid means that Frobenius `A → A` splits as a map of `A`-modules, the target
being an `A`-module through Frobenius. -/
-- test IsSousperfectoid.test_charP_Fsplit (characterisation) [R5/sousperfectoid-ring]
example (A : Type) [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] [CharP A p]
    (hu : IsBounded (powerBoundedSubring A : Set A)) (hF : (frobenius A p).Finite) :
    IsSousperfectoid p A ↔
      ∃ s : A →+ A, (∀ a x : A, s (a ^ p * x) = a * s x) ∧ ∀ a : A, s (a ^ p) = a := sorry

end SousperfectoidTests

/-! ## AdicSpacesPartII:R5/split-injection-completed-base-change (lemma) -/

/-- R5/split-injection-completed-base-change (Hansen–Kedlaya Remark 7.2): let `R → R̃` be a
continuous map of complete Tate rings with a continuous `R`-linear retraction `σ`, and `R → S` a
continuous map of complete Tate rings. Then `ι_S : S → R̃ ⊗̂_R S`, `s ↦ 1 ⊗ s`, has the continuous
`S`-linear retraction `σ ⊗̂ id`, so it is a closed embedding. The completed tensor product is the
one of AdicSpacesPartII:R0/completed-tensor-product, with no uniform completion. -/
theorem exists_retraction_completedTensor {R Rt S : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    [CommRing Rt] [UniformSpace Rt] [IsUniformAddGroup Rt] [IsTopologicalRing Rt] [IsTateRing Rt]
    [CompleteSpace Rt] [T2Space Rt] [CommRing S] [UniformSpace S] [IsUniformAddGroup S]
    [IsTopologicalRing S] [IsTateRing S] [CompleteSpace S] [T2Space S] [Algebra R Rt] [Algebra R S]
    (hι : Continuous (algebraMap R Rt)) (hf : Continuous (algebraMap R S)) (σ : Rt →ₗ[R] R)
    (hσ : Continuous σ) (hσι : ∀ r : R, σ (algebraMap R Rt r) = r) :
    ∃ σS : CompletedTensor R Rt S →+ S, Continuous σS ∧
      (∀ (s : S) (x : CompletedTensor R Rt S),
        σS (Pair.completedTensor.tmul R Rt S (1 ⊗ₜ s) * x) = s * σS x) ∧
      (∀ s : S, σS (Pair.completedTensor.tmul R Rt S (1 ⊗ₜ s)) = s) ∧
      IsClosedEmbedding ((Pair.completedTensor.tmul R Rt S).comp
        (Algebra.TensorProduct.includeRight (R := R) (A := Rt)).toRingHom) := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-uniform (lemma) -/

/-- R5/sousperfectoid-uniform: for a perfectoid frame of a Tate ring, `R° = ι⁻¹(R̃°)`. With
the boundedness of `R̃°` this gives `Huber.IsSousperfectoid.isUniform`, and hence reducedness
(`Huber.IsSousperfectoid.isReduced`). -/
theorem PerfectoidFrame.powerBoundedSubring_eq_comap {p : ℕ} {R : Type u} [CommRing R]
    [TopologicalSpace R] [IsTopologicalRing R] [IsTateRing R] (F : PerfectoidFrame p R) :
    haveI := F.isPerfectoidTateRing.isTateRing
    powerBoundedSubring R = (powerBoundedSubring F.Rt).comap F.ι := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-rational-localisation (lemma) -/

section RationalLocalisation

variable {p : ℕ} {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- R5/sousperfectoid-rational-localisation (the instance `Huber.IsSousperfectoid.
rationalLocalization` of R5/sousperfectoid-ring): for a complete sousperfectoid Tate ring `R` and a
rational subset `R(T/s)` (`T` finite generating the unit ideal), the completed rational
localisation `R⟨T/s⟩` (Tau Ceti `PairOfDefinition.completionLocalization`) is sousperfectoid. -/
theorem IsSousperfectoid.rationalLocalization [IsSousperfectoid p R] (P : PairOfDefinition R)
    (T : Finset R) (s : R) (hT : Ideal.span (T : Set R) = ⊤) (S : Type u) [CommRing S]
    [Algebra R S] [IsLocalization.Away s S] (hden : P.HasDenominatorPower T s S) :
    letI := P.locUniformSpace T s S hden
    letI := P.isUniformAddGroup_locUniformSpace T s S hden
    letI := P.isTopologicalRing_locUniformSpace T s S hden
    IsSousperfectoid p (Completion S) := sorry

open Classical in
/-- R5/sousperfectoid-rational-localisation, explicitly: for a perfectoid frame `(R̃, ι, σ)` of
`R`, the completed rational localisation `R̃⟨ι(T)/ι(s)⟩` is a perfectoid Tate ring, and
`R⟨T/s⟩ → R̃⟨ι(T)/ι(s)⟩` has a continuous `R⟨T/s⟩`-linear retraction (it is `σ ⊗̂ id` under
`R̃ ⊗̂_R R⟨T/s⟩ ≅ R̃⟨ι(T)/ι(s)⟩`). -/
theorem PerfectoidFrame.rationalLocalization (F : PerfectoidFrame p R) (P : PairOfDefinition R)
    (T : Finset R) (s : R) (hT : Ideal.span (T : Set R) = ⊤) (S : Type u) [CommRing S]
    [Algebra R S] [IsLocalization.Away s S] (hden : P.HasDenominatorPower T s S)
    (P' : PairOfDefinition F.Rt) (S' : Type u) [CommRing S'] [Algebra F.Rt S']
    [IsLocalization.Away (F.ι s) S'] (hden' : P'.HasDenominatorPower (T.image F.ι) (F.ι s) S') :
    letI := P.locUniformSpace T s S hden
    letI := P.isUniformAddGroup_locUniformSpace T s S hden
    letI := P.isTopologicalRing_locUniformSpace T s S hden
    letI := P'.locUniformSpace (T.image F.ι) (F.ι s) S' hden'
    letI := P'.isUniformAddGroup_locUniformSpace (T.image F.ι) (F.ι s) S' hden'
    letI := P'.isTopologicalRing_locUniformSpace (T.image F.ι) (F.ι s) S' hden'
    IsPerfectoidTateRing p (Completion S') ∧
      ∃ (j : Completion S →+* Completion S') (τ : Completion S' →+ Completion S),
        Continuous j ∧ Continuous τ ∧ (∀ a x, τ (j a * x) = a * τ x) ∧ ∀ a, τ (j a) = a :=
  sorry

end RationalLocalisation

/-! ## AdicSpacesPartII:R5/sousperfectoid-finite-etale (lemma) -/

/-- R5/sousperfectoid-finite-etale (the instance `Huber.IsSousperfectoid.finiteEtale` of
R5/sousperfectoid-ring): a finite étale algebra `S` over a complete sousperfectoid Tate ring `R`,
with its natural topology as a finite `R`-module, is sousperfectoid, with frame
`S → R̃ ⊗_R S` split by `σ ⊗ id`. -/
theorem IsSousperfectoid.finiteEtale {p : ℕ} {R : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    [IsSousperfectoid p R] (S : Type u) [CommRing S] [Algebra R S] [Algebra.Etale R S]
    [Module.Finite R S] [TopologicalSpace S] [IsModuleTopology R S] :
    haveI := IsModuleTopology.isTopologicalRing R S
    IsSousperfectoid p S := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-finite-etale-descent (lemma) -/

/-- R5/sousperfectoid-finite-etale-descent (Hansen–Kedlaya Lemma 7.5(b)): if `R → S` is finite
étale and faithfully flat, `R` is a complete Tate ring and `S` (with its natural topology) is
sousperfectoid, then `R` is sousperfectoid: compose a frame of `S` with an `R`-linear
retraction `S → R`. -/
theorem IsSousperfectoid.of_faithfullyFlat_finite_etale {p : ℕ} {R : Type u} [CommRing R]
    [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R]
    [T2Space R] (S : Type u) [CommRing S] [Algebra R S] [Algebra.Etale R S] [Module.Finite R S]
    [Module.FaithfullyFlat R S] [TopologicalSpace S] [IsModuleTopology R S]
    (hS : haveI := IsModuleTopology.isTopologicalRing R S; IsSousperfectoid p S) :
    IsSousperfectoid p R := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-rings (theorem)

The statement is the instance `Huber.IsSousperfectoid.restrictedMvPowerSeries` (API of
R5/sousperfectoid-ring, above): Tate algebras `R⟨T₁, …, Tₙ⟩` over a complete sousperfectoid Tate
ring are sousperfectoid. The frame is `R̃⟨T₁^{1/p^∞}, …, Tₙ^{1/p^∞}⟩`, whose carrier (the completion
of `R̃[T^{1/p^∞}]`) has no Lean form in the pinned libraries, so the frame itself is not stated. -/

/-! ## AdicSpacesPartII:R5/sousperfectoid-annulus (lemma) -/

section Annulus

variable {p : ℕ} (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsSousperfectoid p R]

/-- The variable `S` of `R⟨S⟩ = restrictedMvPowerSeriesCompletion 1 R`. -/
local notation "𝕊" => ((weightedX (fun _ : Fin 1 ↦ ({1} : Set R)) isWeightFamily_one_weight 0 :
  weightedRestrictedSubring (fun _ : Fin 1 ↦ ({1} : Set R)) isWeightFamily_one_weight) :
  restrictedMvPowerSeriesCompletion 1 R)

/-- R5/sousperfectoid-annulus: the Laurent algebra `R⟨S^{±1}⟩ = O({|S| = 1})`, the completed
rational localisation of `R⟨S⟩` at `R({1}/S)`, is sousperfectoid. -/
theorem IsSousperfectoid.laurent (P : PairOfDefinition (restrictedMvPowerSeriesCompletion 1 R))
    (L : Type u) [CommRing L] [Algebra (restrictedMvPowerSeriesCompletion 1 R) L]
    [IsLocalization.Away 𝕊 L] (hden : P.HasDenominatorPower {1} 𝕊 L) :
    letI := P.locUniformSpace {1} 𝕊 L hden
    letI := P.isUniformAddGroup_locUniformSpace {1} 𝕊 L hden
    letI := P.isTopologicalRing_locUniformSpace {1} 𝕊 L hden
    IsSousperfectoid p (Completion L) := sorry

/-- R5/sousperfectoid-annulus: for a pseudouniformizer `ϖ` and integers `a ≤ b`, the annulus ring
`R⟨T/ϖ^a, ϖ^b/T⟩ = O(W)` with `W = {|ϖ^b| ≤ |T| ≤ |ϖ^a|}` and `T = ϖ^a S` is sousperfectoid. In
`Spa R⟨S⟩` the subset `W` is the rational subset `R({ϖ^(b-a)}/S)`, since `|S| ≤ 1` there. -/
theorem IsSousperfectoid.annulus (ϖ : R) (hϖ : IsPseudoUniformizer ϖ) (a b : ℤ) (hab : a ≤ b)
    (P : PairOfDefinition (restrictedMvPowerSeriesCompletion 1 R)) (L : Type u) [CommRing L]
    [Algebra (restrictedMvPowerSeriesCompletion 1 R) L] [IsLocalization.Away 𝕊 L]
    (hden : P.HasDenominatorPower {algebraMap R _ (ϖ ^ (b - a).toNat)} 𝕊 L) :
    letI := P.locUniformSpace {algebraMap R _ (ϖ ^ (b - a).toNat)} 𝕊 L hden
    letI := P.isUniformAddGroup_locUniformSpace {algebraMap R _ (ϖ ^ (b - a).toNat)} 𝕊 L hden
    letI := P.isTopologicalRing_locUniformSpace {algebraMap R _ (ϖ ^ (b - a).toNat)} 𝕊 L hden
    IsSousperfectoid p (Completion L) := sorry

end Annulus

/-! ## AdicSpacesPartII:R5/sousperfectoid-p-adic-field (lemma) -/

/-- R5/sousperfectoid-p-adic-field: a finite extension `K` of `ℚ_p`, with its natural topology,
is sousperfectoid: `K → K^cycl` has a continuous `K`-linear retraction. By
`Huber.IsSousperfectoid.restrictedMvPowerSeries`, `Huber.IsSousperfectoid.rationalLocalization`
and `Huber.IsSousperfectoid.finiteEtale`, so are `K⟨T₁, …, Tₙ⟩`, its rational localisations and
their finite étale algebras. -/
theorem IsSousperfectoid.of_finite_padic (p : ℕ) [Fact p.Prime] (K : Type) [Field K]
    [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [TopologicalSpace K] [IsModuleTopology ℚ_[p] K] :
    haveI := IsModuleTopology.isTopologicalRing ℚ_[p] K
    IsSousperfectoid p K := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-stably-uniform (theorem) -/

/-- R5/sousperfectoid-stably-uniform (the relation `Huber.IsSousperfectoid.isStablyUniform` of
R5/sousperfectoid-ring; Berkeley Proposition 6.3.4): a complete sousperfectoid Tate ring is
stably uniform: every completed rational localisation `R⟨T/s⟩` is uniform. The ring `R⟨T/s⟩` does
not depend on the ring of integral elements `R⁺`, so this holds for every Huber pair `(R, R⁺)`. -/
theorem IsSousperfectoid.isStablyUniform {p : ℕ} {R : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    [IsSousperfectoid p R] (P : PairOfDefinition R) (T : Finset R) (s : R)
    (hT : Ideal.span (T : Set R) = ⊤) (S : Type u) [CommRing S] [Algebra R S]
    [IsLocalization.Away s S] (hden : P.HasDenominatorPower T s S) :
    letI := P.locUniformSpace T s S hden
    letI := P.isUniformAddGroup_locUniformSpace T s S hden
    letI := P.isTopologicalRing_locUniformSpace T s S hden
    haveI : IsHuberRing (Completion S) := ⟨⟨P.completionLocalization T s S hden⟩⟩
    IsBounded (powerBoundedSubring (Completion S) : Set (Completion S)) := sorry

/-! ## AdicSpacesPartII:R5/sousperfectoid-sheafy (lemma) -/

-- Huber.IsSousperfectoid.isSheafyPair' (sheafy), Huber.IsSousperfectoid.isStronglySheafy
--   (every R⟨T₁, …, Tₙ⟩ sheafy) and the vanishing of H^i(Spa(R, R⁺), O) for i > 0: not stated
--   here; need the structure presheaf on Spa(R, R⁺), its sheaf condition and its cohomology
--   (supplier: AdicSpaces Layer 4). The ring-level input is
--   `Huber.IsSousperfectoid.isStablyUniform` with `Huber.IsSousperfectoid.restrictedMvPowerSeries`.

/-! ## AdicSpacesPartII:R5/sousperfectoid-adic-space (definition)

Every item needs the category of adic spaces. The ring-level core of the definition is
`Huber.IsSousperfectoid`; the chart statements reduce to the ring-level API above. -/

-- AdicSpace.IsSousperfectoid: not stated here; needs adic spaces with open affinoid covers
--   (supplier: AdicSpaces Layer 5). Its ring-level core is `Huber.IsSousperfectoid`.
-- AdicSpace.IsSousperfectoid.spa: not stated here; needs Spa(R, R⁺) as an adic space
--   (supplier: AdicSpaces Layer 5). Ring-level core: `Huber.IsSousperfectoid`.
-- AdicSpace.IsSousperfectoid.of_perfectoidSpace: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2). Ring-level core:
--   `Huber.IsSousperfectoid.of_isPerfectoidTateRing`.
-- AdicSpace.IsSousperfectoid.restrict: not stated here; needs open subspaces of adic spaces
--   (supplier: AdicSpaces Layer 5). Ring-level core:
--   `Huber.IsSousperfectoid.rationalLocalization`.
-- AdicSpace.IsSousperfectoid.exists_basis: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.IsSousperfectoid.isAnalytic: not stated here; needs adic spaces and analytic points
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.IsSousperfectoid.isReduced_sections: not stated here; needs the structure sheaf of an
--   adic space (supplier: AdicSpaces Layer 5). Ring-level core:
--   `Huber.IsSousperfectoid.isReduced`.
-- AdicSpace.IsSousperfectoid.of_etale: not stated here; needs étale morphisms of adic spaces in the
--   local-description sense (supplier: AdicEtaleGeometry:A1). Node
--   R5/sousperfectoid-etale-stability.
-- AdicSpace.IsSousperfectoid.relativePolydisc: not stated here; needs fibre products of adic
--   spaces over Spa ℤ_p (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/fibre-products-existence).
--   Ring-level core: `Huber.IsSousperfectoid.restrictedMvPowerSeries`.
-- AdicSpace.IsSousperfectoid.isStablyAdic: not stated here; needs the étale site and Kedlaya–Liu
--   stable bases (supplier: AdicEtaleGeometry:A1). Node R5/sousperfectoid-stably-adic.
-- AdicSpace.IsSousperfectoid.fibreProduct_etale: not stated here; needs fibre products of adic
--   spaces and étale morphisms (supplier: AdicSpaces Layer 5, AdicEtaleGeometry:A1). Node
--   R5/sousperfectoid-etale-base-change.
-- AdicSpace.IsSousperfectoid.test_closedDisc_Qp: not stated here; needs Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) as an
--   adic space (supplier: AdicSpaces Layer 5). Ring-level form:
--   test IsSousperfectoid.test_padic_tateAlgebra. [computation test]
-- AdicSpace.IsSousperfectoid.test_perfectoid: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2). [compatibility test]
-- AdicSpace.IsSousperfectoid.test_dualNumbers: not stated here; needs Spa(ℚ_p⟨X, Q⟩/(Q²)) as an
--   adic space (supplier: AdicSpaces Layer 5). Ring-level form:
--   test IsSousperfectoid.test_dualNumbers. [non-example test]
-- AdicSpace.IsSousperfectoid.test_empty_and_point: not stated here; needs the empty adic space and
--   Spa(ℚ_p, ℤ_p) (supplier: AdicSpaces Layer 5). Ring-level form:
--   test IsSousperfectoid.test_padic. [degenerate test]
-- AdicSpace.IsSousperfectoid.test_smooth_over_perfectoid_field: not stated here; needs rigid spaces
--   smooth over a perfectoid field (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
--   AdicSpacesPartII:R0/smooth-morphism). [characterisation test]

/-! ## AdicSpacesPartII:R5/sousperfectoid-etale-stability (lemma) -/

-- AdicSpace.IsSousperfectoid.of_isEtaleLocalDescription: not stated here; needs étale morphisms
--   of adic spaces in the local-description sense (supplier: AdicEtaleGeometry:A1). Its
--   ring-level core, that a composite of rational localisations and finite étale maps out of a
--   sousperfectoid ring has sousperfectoid target, is the iteration of
--   `Huber.IsSousperfectoid.rationalLocalization` and `Huber.IsSousperfectoid.finiteEtale`.

/-! ## AdicSpacesPartII:R5/sousperfectoid-stably-adic (lemma) -/

-- AdicSpace.IsSousperfectoid.isStablyAdic': not stated here; needs the étale site X_ét and
--   Kedlaya–Liu stable bases (supplier: AdicEtaleGeometry:A1) and finite locally free
--   O_{X_ét}-modules (supplier: AdicSpacesPartII:R3).

/-! ## AdicSpacesPartII:R5/sousperfectoid-etale-base-change (lemma) -/

/-- R5/sousperfectoid-etale-base-change, affinoid ring-level core: for `A → B` finite étale and
a sousperfectoid complete Tate `A`-algebra `C`, the finite étale `C`-algebra `C ⊗_A B`, with its
natural topology, is sousperfectoid (the ring of `Spa(C) ×_{Spa A} Spa(B)`). The fibre product of
adic spaces itself is not stated here: it needs the category of adic spaces (supplier:
AdicSpaces Layer 5) and étale morphisms (supplier: AdicEtaleGeometry:A1). -/
theorem IsSousperfectoid.tensor_finite_etale {p : ℕ} {A B : Type u} (C : Type u) [CommRing A]
    [CommRing B] [CommRing C] [Algebra A B] [Algebra A C] [Algebra.Etale A B] [Module.Finite A B]
    [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C] [CompleteSpace C]
    [T2Space C] [IsSousperfectoid p C] [TopologicalSpace (C ⊗[A] B)]
    [IsModuleTopology C (C ⊗[A] B)] :
    haveI := IsModuleTopology.isTopologicalRing C (C ⊗[A] B)
    IsSousperfectoid p (C ⊗[A] B) := sorry

/-! ## AdicSpacesPartII:R5/perfectoid-times-polydisc (lemma) -/

/-- R5/perfectoid-times-polydisc, ring-level core: for a nonzero perfectoid Tate ring `S` and
`n ≥ 1`, the Tate algebra `S⟨T₁, …, Tₙ⟩` is not perfectoid (it is sousperfectoid by
`Huber.IsSousperfectoid.restrictedMvPowerSeries`). The identification of
`Spa(S, S⁺) ×_L B^n_L` with `Spa(S⟨T⟩, S⁺⟨T⟩)` needs fibre products of adic spaces
(supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/affinoid-fibre-product). -/
theorem not_isPerfectoidTateRing_restrictedMvPowerSeries {p : ℕ} (S : Type u) [CommRing S]
    [TopologicalSpace S] [IsTopologicalRing S] [Nontrivial S]
    (hS : IsPerfectoidTateRing p S) (n : ℕ) (hn : 0 < n) :
    haveI := hS.isTateRing
    ¬ IsPerfectoidTateRing p (restrictedMvPowerSeriesCompletion n S) := sorry

-- AdicSpace.perfectoidTimesPolydisc: not stated here; needs fibre products of adic spaces
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R0/affinoid-fibre-product).

/-! ## AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product (construction)

Every item needs perfectoid spaces, rigid spaces and fibre products of adic spaces. -/

-- AdicSpace.perfectoidTimesSmooth: not stated here; needs perfectoid spaces over a perfectoid
--   field (supplier: PerfectoidSpaces:P2), smooth rigid spaces (supplier:
--   AdicSpacesPartII:R1/rigid-analytic-space, AdicSpacesPartII:R0/smooth-morphism) and adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.perfectoidTimesSmooth.fst: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5, PerfectoidSpaces:P2).
-- AdicSpace.perfectoidTimesSmooth.snd: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5, AdicSpacesPartII:R1/rigid-analytic-space).
-- AdicSpace.perfectoidTimesSmooth.isPullback: not stated here; needs pullbacks of adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.perfectoidTimesSmooth.lift: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.perfectoidTimesSmooth.isSousperfectoid: not stated here; needs sousperfectoid adic
--   spaces (supplier: AdicSpaces Layer 5; node R5/sousperfectoid-adic-space).
-- AdicSpace.perfectoidTimesSmooth.baseChangeIso: not stated here; needs perfectoid spaces and
--   their base change (supplier: PerfectoidSpaces:P2).
-- AdicSpace.perfectoidTimesSmooth.polydiscChart: not stated here; needs étale charts over
--   polydiscs (supplier: AdicSpacesPartII:R0/smooth-morphism, AdicSpaces Layer 5). Its ring-level
--   pieces are `Huber.IsSousperfectoid.restrictedMvPowerSeries` and
--   `Huber.IsSousperfectoid.tensor_finite_etale`.
-- AdicSpace.perfectoidTimesSmooth.map: not stated here; needs adic spaces
--   (supplier: AdicSpaces Layer 5).
-- AdicSpace.perfectoidTimesSmooth.restrictIso: not stated here; needs open subspaces of adic
--   spaces (supplier: AdicSpaces Layer 5).
-- AdicSpace.perfectoidTimesSmooth.sections_affinoid: not stated here; needs the structure sheaf of
--   adic spaces (supplier: AdicSpaces Layer 5); the ring it computes is the completed tensor
--   product of AdicSpacesPartII:R0/completed-tensor-product.
-- perfectoidTimesSmooth_test_point: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2). [degenerate test]
-- perfectoidTimesSmooth_test_polydisc: not stated here; needs adic spaces (supplier: AdicSpaces
--   Layer 5). Ring-level form: `Huber.IsSousperfectoid.restrictedMvPowerSeries`.
--   [computation test]
-- perfectoidTimesSmooth_test_not_perfectoid: not stated here; needs perfectoid spaces
--   (supplier: PerfectoidSpaces:P2). Ring-level form:
--   `Huber.not_isPerfectoidTateRing_restrictedMvPowerSeries`. [non-example test]
-- perfectoidTimesSmooth_test_points: not stated here; needs points of adic spaces with values in
--   affinoid fields (supplier: AdicSpaces Layer 5). [characterisation test]
-- perfectoidTimesSmooth_test_affinoid_sections: not stated here; needs the structure sheaf of adic
--   spaces (supplier: AdicSpaces Layer 5). [compatibility test]

/-! ## AdicSpacesPartII:R5/perfectoid-times-smooth-tilde-limit (lemma) -/

-- AdicSpace.perfectoidTimesSmooth.tildeLimit: not stated here; needs tilde-limits of adic spaces
--   (supplier: ClassicalAdicEtaleCohomology:H0) and the product of
--   R5/perfectoid-times-smooth-fibre-product (supplier: AdicSpaces Layer 5, PerfectoidSpaces:P2).

/-! ## AdicSpacesPartII:R5/profinite-flat-module (definition)

The coefficient ring `O = O_E` of the source (`E/ℚ_p` finite) is a discrete valuation ring with a
compact Hausdorff ring topology; such a topology is the `𝔪`-adic one, and compactness gives the
finite residue field and completeness. -/

section ProfiniteFlat

variable (O : Type u) (M : Type v) [CommRing O] [AddCommGroup M] [Module O M] [TopologicalSpace M]

/-- R5/profinite-flat-module (CHJ Definition 6.1): a topological `O`-module `M` is *profinite
flat* if it is flat, a topological additive group whose topology is linear (`0` has a basis of
neighbourhoods consisting of `O`-submodules), and compact Hausdorff. -/
class IsProfiniteFlat : Prop where
  /-- `M` is flat over `O` (for a discrete valuation ring: `ϖ`-torsion-free). -/
  flat : Module.Flat O M
  /-- `M` is a topological additive group. -/
  isTopologicalAddGroup : IsTopologicalAddGroup M
  /-- The topology of `M` is `O`-linear. -/
  isLinearTopology : IsLinearTopology O M
  /-- `M` is compact. -/
  compactSpace : CompactSpace M
  /-- `M` is Hausdorff. -/
  t2Space : T2Space M

end ProfiniteFlat

section ProfiniteFlatAPI

variable {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [TopologicalSpace O]
  [IsTopologicalRing O] [CompactSpace O] [T2Space O]
  {M : Type v} [AddCommGroup M] [Module O M] [TopologicalSpace M]

/-- R5/profinite-flat-module (instance): `∏_{i ∈ I} O` with the product topology is profinite
flat. -/
instance IsProfiniteFlat.pi (I : Type v) : IsProfiniteFlat O (I → O) := sorry

/-- R5/profinite-flat-module (characterisation; the statement of R5/profinite-flat-pseudobasis in
one direction): every profinite flat module is isomorphic, as a topological `O`-module, to
`∏_{i ∈ I} O` for some `I`. -/
theorem IsProfiniteFlat.pseudobasis [IsProfiniteFlat O M] :
    ∃ I : Type v, Nonempty (M ≃L[O] (I → O)) := sorry

/-- R5/profinite-flat-module (characterisation): open submodules of a profinite flat module have
finite index. -/
theorem IsProfiniteFlat.finite_quotient [IsProfiniteFlat O M] (N : Submodule O M)
    (hN : IsOpen (N : Set M)) : Finite (M ⧸ N) := sorry

/-- R5/profinite-flat-module (relation): a profinite flat module is `ϖ`-adically complete and
separated. -/
instance IsProfiniteFlat.isAdicComplete [IsProfiniteFlat O M] :
    IsAdicComplete (IsLocalRing.maximalIdeal O) M := sorry

/-- R5/profinite-flat-module (instance): a closed submodule of a profinite flat module is profinite
flat. -/
theorem IsProfiniteFlat.closedSubmodule [IsProfiniteFlat O M] (N : Submodule O M)
    (hN : IsClosed (N : Set M)) : IsProfiniteFlat O N := sorry

-- test IsProfiniteFlat.test_zero_and_O (degenerate) [R5/profinite-flat-module]
example : IsProfiniteFlat O PUnit ∧ IsProfiniteFlat O O := sorry

/- `O/ϖ` is compact and linear-topological but not flat; `O` with the discrete topology is flat
but not compact. -/
-- test IsProfiniteFlat.test_torsion (non-example) [R5/profinite-flat-module]
example : ¬ IsProfiniteFlat O (O ⧸ IsLocalRing.maximalIdeal O) ∧
    ¬ @IsProfiniteFlat O O _ _ _ ⊥ := sorry

end ProfiniteFlatAPI

section ProfiniteFlatTests

variable (p : ℕ) [Fact p.Prime]

/- `ℤ_p⟦T₁, …, T_d⟧` with the product topology on coefficients, which is the
`(p, T₁, …, T_d)`-adic topology. -/
-- test IsProfiniteFlat.test_powerSeries (computation) [R5/profinite-flat-module]
example (d : ℕ) :
    letI := MvPowerSeries.WithPiTopology.instTopologicalSpace (σ := Fin d) ℤ_[p]
    IsProfiniteFlat ℤ_[p] (MvPowerSeries (Fin d) ℤ_[p]) := sorry

-- test IsProfiniteFlat.test_E_not (non-example) [R5/profinite-flat-module]
example : ¬ IsProfiniteFlat ℤ_[p] ℚ_[p] := sorry

end ProfiniteFlatTests

/-! ## AdicSpacesPartII:R5/profinite-flat-pseudobasis (lemma) -/

/-- R5/profinite-flat-pseudobasis (CHJ Proposition 6.2): a topological `O`-module is profinite
flat if and only if it is isomorphic, as a topological `O`-module, to `∏_{i ∈ I} O` with the
product topology. The image of the standard vectors is a pseudobasis. -/
theorem IsProfiniteFlat.iff_exists_pseudobasis {O : Type u} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O]
    [T2Space O] (M : Type v) [AddCommGroup M] [Module O M] [TopologicalSpace M] :
    IsProfiniteFlat O M ↔ ∃ I : Type v, Nonempty (M ≃L[O] (I → O)) := sorry

/-! ## AdicSpacesPartII:R5/small-coefficient-algebra (definition) -/

section Small

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra ℤ_[p] R]

/-- R5/small-coefficient-algebra (CHJ §1.4): a `ℤ_p`-algebra `R` is *small* if it is reduced,
`p`-torsion-free and finite over `ℤ_p⟦X₁, …, X_d⟧` for some `d`. -/
class IsSmallZpAlgebra : Prop where
  /-- `R` is reduced. -/
  isReduced : IsReduced R
  /-- `R` is `p`-torsion-free. -/
  isSMulRegular_p : IsSMulRegular R (p : R)
  /-- `R` is finite over some `ℤ_p⟦X₁, …, X_d⟧`. -/
  exists_finite : ∃ (d : ℕ) (φ : MvPowerSeries (Fin d) ℤ_[p] →ₐ[ℤ_[p]] R), φ.toRingHom.Finite

/-- R5/small-coefficient-algebra (data): the canonical adic profinite topology of a small
`ℤ_p`-algebra, the adic topology of its Jacobson radical (an ideal of definition; the topology
does not depend on the choice of ideal of definition). -/
@[instance_reducible]
def IsSmallZpAlgebra.topology [IsSmallZpAlgebra p R] : TopologicalSpace R :=
  (⊥ : Ideal R).jacobson.adicTopology

/-- R5/small-coefficient-algebra (instance): a small `ℤ_p`-algebra is noetherian. -/
theorem IsSmallZpAlgebra.isNoetherianRing [IsSmallZpAlgebra p R] : IsNoetherianRing R := sorry

/-- R5/small-coefficient-algebra (instance): a small `ℤ_p`-algebra with its canonical topology is
a profinite flat `ℤ_p`-module. -/
theorem IsSmallZpAlgebra.isProfiniteFlat [IsSmallZpAlgebra p R] :
    letI := IsSmallZpAlgebra.topology p R
    IsProfiniteFlat ℤ_[p] R := sorry

/-- R5/profinite-flat-module (instance `Huber.IsProfiniteFlat.ofSmall`): small `ℤ_p`-algebras are
profinite flat `ℤ_p`-modules; the statement of `Huber.IsSmallZpAlgebra.isProfiniteFlat`. -/
theorem IsProfiniteFlat.ofSmall [IsSmallZpAlgebra p R] :
    letI := IsSmallZpAlgebra.topology p R
    IsProfiniteFlat ℤ_[p] R :=
  IsSmallZpAlgebra.isProfiniteFlat p R

/-- R5/small-coefficient-algebra (constructor): a quotient `R ⧸ I` of a small algebra that is
reduced and `p`-torsion-free (e.g. `I` prime with `p ∉ I`) is small. -/
theorem IsSmallZpAlgebra.quotient [IsSmallZpAlgebra p R] (I : Ideal R) (hred : IsReduced (R ⧸ I))
    (htf : IsSMulRegular (R ⧸ I) (p : R ⧸ I)) : IsSmallZpAlgebra p (R ⧸ I) := sorry

/-- R5/small-coefficient-algebra (relation): a small `ℤ_p`-algebra is `p`-adically complete. -/
theorem IsSmallZpAlgebra.isAdicComplete_p [IsSmallZpAlgebra p R] :
    IsAdicComplete (Ideal.span {(p : R)}) R := sorry

end Small

section SmallTests

variable (p : ℕ) [Fact p.Prime]

/- The completed group ring `ℤ_p⟦ℤ_p^×⟧` is not in Mathlib. For odd `p`, `ℤ_p^× = μ_{p-1} × (1 + pℤ_p)`
with `μ_{p-1} ⊂ ℤ_p`, so `ℤ_p⟦ℤ_p^×⟧ ≅ ℤ_p[μ_{p-1}] ⊗ ℤ_p⟦T⟧ ≅ ∏_{p-1} ℤ_p⟦T⟧` as rings; the test is
stated for that product. -/
-- test IsSmallZpAlgebra.test_iwasawa (computation) [R5/small-coefficient-algebra]
example : IsSmallZpAlgebra p (Fin (p - 1) → PowerSeries ℤ_[p]) := sorry

-- test IsSmallZpAlgebra.test_Zp (degenerate) [R5/small-coefficient-algebra]
example : IsSmallZpAlgebra p ℤ_[p] := sorry

-- test IsSmallZpAlgebra.test_nonreduced (non-example) [R5/small-coefficient-algebra]
example : ¬ IsSmallZpAlgebra p (PowerSeries ℤ_[p] ⧸ Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2}) := sorry

-- test IsSmallZpAlgebra.test_Fp (non-example) [R5/small-coefficient-algebra]
example :
    letI : Algebra ℤ_[p] (PowerSeries (ZMod p)) :=
      ((PowerSeries.C (R := ZMod p)).comp (PadicInt.toZMod (p := p))).toAlgebra
    ¬ IsSmallZpAlgebra p (PowerSeries (ZMod p)) := sorry

end SmallTests

/-! ## AdicSpacesPartII:R5/mixed-completed-tensor (construction)

`O` is a commutative ring with a chosen element `ϖ` (the uniformizer of `O_E`); `E = O[1/ϖ]`.
An "`E`-Banach space" is an `O`-module `V` on which `ϖ` acts bijectively, with an open bounded
`O`-lattice that is `ϖ`-adically complete and separated. -/

section MixedTensor

variable (O : Type u) [CommRing O]

/-- R5/mixed-completed-tensor: `V₀ ⊆ V` is an *open bounded lattice* for `ϖ`: it is open, bounded
(every neighbourhood of `0` contains `ϖ ^ n • V₀` for some `n`) and a lattice
(`V₀[1/ϖ] = V`). -/
def IsOpenBoundedLattice {V : Type v} [AddCommGroup V] [Module O V] [TopologicalSpace V] (ϖ : O)
    (V₀ : Submodule O V) : Prop :=
  IsOpen (V₀ : Set V) ∧ (∀ U ∈ 𝓝 (0 : V), ∃ n : ℕ, ∀ v ∈ V₀, ϖ ^ n • v ∈ U) ∧
    ∀ v : V, ∃ n : ℕ, ϖ ^ n • v ∈ V₀

/-- R5/mixed-completed-tensor (CHJ Definition 6.3): `X ⊗̂ M := lim_N X ⊗_O M/N`, the limit over the
open submodules `N` of `M`, as the submodule of compatible families in `∏_N X ⊗_O M/N`. For a
profinite flat `M` any cofinal system of open submodules gives the same limit. -/
def mixedTensorInt (X : Type v) [AddCommGroup X] [Module O X] (M : Type w) [AddCommGroup M]
    [Module O M] [TopologicalSpace M] :
    Submodule O ((N : {N : Submodule O M // IsOpen (N : Set M)}) → X ⊗[O] (M ⧸ N.1)) where
  carrier := {f | ∀ (N N' : {N : Submodule O M // IsOpen (N : Set M)}) (h : N'.1 ≤ N.1),
    (Submodule.factor h).lTensor X (f N') = f N}
  add_mem' {f g} hf hg N N' h := by
    simp only [Pi.add_apply, map_add, hf N N' h, hg N N' h]
  zero_mem' N N' h := by simp
  smul_mem' c f hf N N' h := by
    simp only [Pi.smul_apply, map_smul, hf N N' h]

/-- R5/mixed-completed-tensor (CHJ Definition 6.6): `V ⊗̂ M := (V₀ ⊗̂ M)[1/ϖ]` for an `O`-lattice
`V₀ ⊆ V`. -/
abbrev mixedTensorOfLattice (ϖ : O) {V : Type v} [AddCommGroup V] [Module O V] (V₀ : Submodule O V)
    (M : Type w) [AddCommGroup M] [Module O M] [TopologicalSpace M] :=
  LocalizedModule (Submonoid.powers ϖ) (mixedTensorInt O V₀ M)

/-- R5/mixed-completed-tensor: `V ⊗̂ M` for an `E`-Banach space `V`, computed with an open bounded
lattice (a chosen one; the result does not depend on it, `Huber.mixedTensor.latticeIndep`). -/
abbrev mixedTensor (ϖ : O) (V : Type v) [AddCommGroup V] [Module O V] [TopologicalSpace V]
    (M : Type w) [AddCommGroup M] [Module O M] [TopologicalSpace M] :=
  mixedTensorOfLattice O ϖ (Classical.epsilon (IsOpenBoundedLattice O ϖ (V := V))) M

/-- R5/mixed-completed-tensor-exactness: the map `X ⊗̂ M → Y ⊗̂ M` induced by `f : X → Y`. -/
def mixedTensorInt.map {X Y : Type v} [AddCommGroup X] [Module O X] [AddCommGroup Y] [Module O Y]
    (f : X →ₗ[O] Y) (M : Type w) [AddCommGroup M] [Module O M] [TopologicalSpace M] :
    mixedTensorInt O X M →ₗ[O] mixedTensorInt O Y M := sorry

variable {O} (ϖ : O) {V : Type v} [AddCommGroup V] [Module O V] [TopologicalSpace V]
  {M : Type w} [AddCommGroup M] [Module O M] [TopologicalSpace M]

/-- R5/mixed-completed-tensor (equivalence): two open bounded lattices give canonically isomorphic
`V ⊗̂ M` (both lattices are commensurable). -/
def mixedTensor.latticeIndep [IsProfiniteFlat O M] (V₀ V₁ : Submodule O V)
    (h₀ : IsOpenBoundedLattice O ϖ V₀) (h₁ : IsOpenBoundedLattice O ϖ V₁) :
    mixedTensorOfLattice O ϖ V₀ M ≃ₗ[O] mixedTensorOfLattice O ϖ V₁ M := sorry

/-- R5/mixed-completed-tensor (instance): for an `O`-algebra `V` and an `O`-algebra `M` (a small
algebra, whose open ideals are cofinal among its open submodules), `V ⊗̂ M` is a commutative ring,
with the additive group of the construction. -/
instance mixedTensor.instCommRing (V : Type v) [CommRing V] [Algebra O V] [TopologicalSpace V]
    (M : Type w) [CommRing M] [Algebra O M] [TopologicalSpace M] :
    CommRing (mixedTensor O ϖ V M) where
  __ := (inferInstance : AddCommGroup (mixedTensor O ϖ V M))
  mul := sorry
  one := sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
  mul_comm := sorry

/-- R5/mixed-completed-tensor (instance): the Banach topology of `V ⊗̂ M`, whose unit ball is the
image of `V₀ ⊗̂ M`. -/
instance mixedTensor.banach : TopologicalSpace (mixedTensor O ϖ V M) := sorry

variable [TopologicalSpace O]

/-- R5/mixed-completed-tensor (characterisation; R5/mixed-completed-tensor-product-formula): a
pseudobasis `M ≅ ∏_I O` identifies `V ⊗̂ M` with the bounded `I`-indexed families in `V` (those
with `ϖ ^ n • f i ∈ V₀` for one `n` and all `i`), for an `E`-Banach space `V` with lattice `V₀`. -/
def mixedTensor.piEquiv (V₀ : Submodule O V) (hV₀ : IsOpenBoundedLattice O ϖ V₀)
    [IsAdicComplete (Ideal.span {ϖ}) V₀] (hϖ : Function.Bijective fun v : V ↦ ϖ • v) {I : Type w}
    (e : M ≃L[O] (I → O)) :
    mixedTensor O ϖ V M ≃ₗ[O]
      ({ carrier := {f : I → V | ∃ n : ℕ, ∀ i, ϖ ^ n • f i ∈ V₀}
         add_mem' := sorry
         zero_mem' := sorry
         smul_mem' := sorry } : Submodule O (I → V)) := sorry

/-- R5/mixed-completed-tensor (functoriality): `V ⊗̂ M → W ⊗̂ N` for a continuous `O`-linear map of
Banach spaces and a continuous `O`-linear map of profinite flat modules. -/
def mixedTensor.map {W : Type v} [AddCommGroup W] [Module O W] [TopologicalSpace W]
    {N : Type w} [AddCommGroup N] [Module O N] [TopologicalSpace N] (f : V →ₗ[O] W)
    (hf : Continuous f) (g : M →ₗ[O] N) (hg : Continuous g) :
    mixedTensor O ϖ V M →ₗ[O] mixedTensor O ϖ W N := sorry

/-- R5/mixed-completed-tensor (constructor): the canonical bilinear map `(v, m) ↦ v ⊗ m`; its
linearisation `V ⊗_O M → V ⊗̂ M` has dense image. -/
def mixedTensor.tmul : V →ₗ[O] M →ₗ[O] mixedTensor O ϖ V M := sorry

/-- R5/mixed-completed-tensor (simp): `V ⊗̂ O ≅ V` for an `E`-Banach space `V`. -/
def mixedTensor.oneEquiv (V₀ : Submodule O V) (hV₀ : IsOpenBoundedLattice O ϖ V₀)
    [IsAdicComplete (Ideal.span {ϖ}) V₀] (hϖ : Function.Bijective fun v : V ↦ ϖ • v) :
    mixedTensor O ϖ V O ≃ₗ[O] V := sorry

-- test mixedTensor_test_one (degenerate) [R5/mixed-completed-tensor]
example (V₀ : Submodule O V) (hV₀ : IsOpenBoundedLattice O ϖ V₀)
    [IsAdicComplete (Ideal.span {ϖ}) V₀] (hϖ : Function.Bijective fun v : V ↦ ϖ • v) :
    Nonempty (mixedTensor O ϖ V O ≃ₗ[O] V) := sorry

-- test mixedTensor_test_finite_free (compatibility) [R5/mixed-completed-tensor]
example (V₀ : Submodule O V) (hV₀ : IsOpenBoundedLattice O ϖ V₀)
    [IsAdicComplete (Ideal.span {ϖ}) V₀] (hϖ : Function.Bijective fun v : V ↦ ϖ • v) (n : ℕ) :
    Nonempty (mixedTensor O ϖ V (Fin n → O) ≃ₗ[O] V ⊗[O] (Fin n → O)) := sorry

end MixedTensor

section MixedTensorTests

variable (p : ℕ) [Fact p.Prime]

/- With `V = ℚ_p⟨X⟩` and its lattice `V₀ = ℤ_p⟨X⟩`, `ℚ_p⟨X⟩ ⊗̂ ℤ_p⟦T⟧ = (ℤ_p⟨X⟩ ⊗̂ ℤ_p⟦T⟧)[1/p]`, which
is `(ℤ_p⟨X⟩⟦T⟧)[1/p]`: power series in `T` with uniformly bounded coefficients in `ℚ_p⟨X⟩`. The
lattice is `⊤ ⊆ ℤ_p⟨X⟩`. -/
-- test mixedTensor_test_tateAlgebra_powerSeries (computation) [R5/mixed-completed-tensor]
example :
    letI := MvPowerSeries.WithPiTopology.instTopologicalSpace (σ := Unit) ℤ_[p]
    Nonempty (mixedTensorOfLattice ℤ_[p] (p : ℤ_[p])
        (⊤ : Submodule ℤ_[p] (restrictedMvPowerSeriesCompletion 1 ℤ_[p])) (PowerSeries ℤ_[p]) ≃ₗ[ℤ_[p]]
      LocalizedModule (Submonoid.powers (p : ℤ_[p]))
        (PowerSeries (restrictedMvPowerSeriesCompletion 1 ℤ_[p]))) := sorry

/- The algebraic tensor product `ℚ_p⟨X⟩ ⊗_{ℤ_p} ℤ_p⟦T⟧ = (ℤ_p⟨X⟩ ⊗_{ℤ_p} ℤ_p⟦T⟧)[1/p]` does not
surject onto `ℚ_p⟨X⟩ ⊗̂ ℤ_p⟦T⟧`: some element (e.g. `∑ Xⁿ Tⁿ`) has no multiple `pᵏ • y` in the image
of `ℤ_p⟨X⟩ ⊗ ℤ_p⟦T⟧`. -/
-- test mixedTensor_test_not_algebraic (non-example) [R5/mixed-completed-tensor]
example :
    letI := MvPowerSeries.WithPiTopology.instTopologicalSpace (σ := Unit) ℤ_[p]
    ¬ ∀ y : mixedTensor ℤ_[p] (p : ℤ_[p]) (restrictedMvPowerSeriesCompletion 1 ℤ_[p])
        (PowerSeries ℤ_[p]), ∃ (k : ℕ) (x : restrictedMvPowerSeriesCompletion 1 ℤ_[p] ⊗[ℤ_[p]]
          PowerSeries ℤ_[p]),
        TensorProduct.lift (mixedTensor.tmul (p : ℤ_[p])) x = (p : ℤ_[p]) ^ k • y := sorry

/- For `V = ℚ_p⟨X, Q⟩/(Q²)` (dual numbers over `ℚ_p⟨X⟩`), a `ℤ_p`-module through `ℚ_p`, the lattice
of power-bounded elements `V° = ℤ_p⟨X⟩ + ℚ_p⟨X⟩Q` is not bounded, and `(V° ⊗̂ ℤ_p)[1/p]` is `ℚ_p⟨X⟩`,
not `V`: the `p`-adic completion kills the `Q`-part. -/
-- test mixedTensor_test_unbounded_lattice (non-example) [R5/mixed-completed-tensor]
example (hna : NonarchimedeanRing (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))) :
    letI : Module ℤ_[p] (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :=
      Module.compHom _ (algebraMap ℤ_[p] ℚ_[p])
    letI : Module ℤ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) :=
      Module.compHom _ (algebraMap ℤ_[p] ℚ_[p])
    Nonempty (mixedTensorOfLattice ℤ_[p] (p : ℤ_[p])
        ({ carrier := (powerBoundedSubring (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
              Set (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p])))
           add_mem' := sorry
           zero_mem' := sorry
           smul_mem' := sorry } :
          Submodule ℤ_[p] (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p]))) ℤ_[p] ≃ₗ[ℤ_[p]]
      restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

end MixedTensorTests

/-! ## AdicSpacesPartII:R5/mixed-completed-tensor-product-formula (lemma) -/

/-- R5/mixed-completed-tensor-product-formula (CHJ Proposition 6.4): a pseudobasis
`M ≅ ∏_{i ∈ I} O` identifies `X ⊗̂ M` with `∏_{i ∈ I} X̂`, `X̂` the `ϖ`-adic completion of `X`,
naturally in `X`. The Banach form (bounded families) is `Huber.mixedTensor.piEquiv`. -/
def mixedTensorInt.piEquiv {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O] (X : Type v)
    [AddCommGroup X] [Module O X] {M : Type w} [AddCommGroup M] [Module O M] [TopologicalSpace M]
    {I : Type w} (e : M ≃L[O] (I → O)) :
    mixedTensorInt O X M ≃ₗ[O] (I → AdicCompletion (IsLocalRing.maximalIdeal O) X) := sorry

/-! ## AdicSpacesPartII:R5/mixed-completed-tensor-exactness (lemma) -/

section Exactness

variable {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [TopologicalSpace O]
  [IsTopologicalRing O] [CompactSpace O] [T2Space O] {X Y Z : Type v} [AddCommGroup X]
  [Module O X] [AddCommGroup Y] [Module O Y] [AddCommGroup Z] [Module O Z]
  (M : Type w) [AddCommGroup M] [Module O M] [TopologicalSpace M] [IsProfiniteFlat O M]

/-- R5/mixed-completed-tensor-exactness (1) (CHJ Corollary 6.5(1)): `- ⊗̂ M` is exact on short
exact sequences of `ϖ`-adically complete and separated `O`-modules. -/
theorem mixedTensorInt.exact_of_isAdicComplete (f : X →ₗ[O] Y) (g : Y →ₗ[O] Z)
    (hfg : Function.Exact f g) (hf : Function.Injective f) (hg : Function.Surjective g)
    [IsAdicComplete (IsLocalRing.maximalIdeal O) X] [IsAdicComplete (IsLocalRing.maximalIdeal O) Y]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) Z] :
    Function.Exact (mixedTensorInt.map O f M) (mixedTensorInt.map O g M) ∧
      Function.Injective (mixedTensorInt.map O f M) ∧
      Function.Surjective (mixedTensorInt.map O g M) := sorry

/-- R5/mixed-completed-tensor-exactness (2) (CHJ Corollary 6.5(2)): if `0 → X → Y → Z → 0` is
exact, `X` is `ϖ`-adically complete and `ϖ ^ N` kills `Z`, then `Y` is `ϖ`-adically complete and
`(X ⊗̂ M)[1/ϖ] → (Y ⊗̂ M)[1/ϖ]` is an isomorphism. -/
theorem mixedTensorInt.localization_bijective_of_torsion_quotient (ϖ : O) (hϖ : Irreducible ϖ)
    (f : X →ₗ[O] Y) (g : Y →ₗ[O] Z) (hfg : Function.Exact f g) (hf : Function.Injective f)
    (hg : Function.Surjective g) [IsAdicComplete (IsLocalRing.maximalIdeal O) X] (N : ℕ)
    (hZ : ∀ z : Z, ϖ ^ N • z = 0) :
    IsAdicComplete (IsLocalRing.maximalIdeal O) Y ∧
      Function.Bijective (IsLocalizedModule.map (Submonoid.powers ϖ)
        (LocalizedModule.mkLinearMap (Submonoid.powers ϖ) (mixedTensorInt O X M))
        (LocalizedModule.mkLinearMap (Submonoid.powers ϖ) (mixedTensorInt O Y M))
        (mixedTensorInt.map O f M)) := sorry

end Exactness

/-! ## AdicSpacesPartII:R5/rational-integral-compatibility (lemma) -/

/-- R5/rational-integral-compatibility, ring-level core: for a uniform Tate ring `V` over `ℤ_p`
(the ring `O_X(U)` of a rational subset of a reduced affinoid rigid space), `V°` is an open bounded
`ℤ_p`-lattice and `(V° ⊗̂ M)[1/p] ≅ V ⊗̂ M`. The sheaf property of `U ↦ O_X⁺(U) ⊗̂ M` on rational
subsets is not stated here: it needs the structure presheaf on the rational subsets of
`Spa(A, A°)` (supplier: AdicSpaces Layer 3). -/
def mixedTensor.integralEquiv (p : ℕ) [Fact p.Prime] (V : Type v) [CommRing V] [TopologicalSpace V]
    [IsTopologicalRing V] [IsTateRing V] [Algebra ℤ_[p] V] (hc : Continuous (algebraMap ℤ_[p] V))
    (hu : IsBounded (powerBoundedSubring V : Set V)) (M : Type w) [AddCommGroup M]
    [Module ℤ_[p] M] [TopologicalSpace M] [IsProfiniteFlat ℤ_[p] M] :
    mixedTensorOfLattice ℤ_[p] (p : ℤ_[p])
        ({ carrier := (powerBoundedSubring V : Set V)
           add_mem' := sorry
           zero_mem' := sorry
           smul_mem' := sorry } : Submodule ℤ_[p] V) M ≃ₗ[ℤ_[p]]
      mixedTensor ℤ_[p] (p : ℤ_[p]) V M := sorry

/-! ## AdicSpacesPartII:R5/mixed-tensor-finite-projective-base-change (lemma) -/

section BaseChange

variable {O : Type u} [CommRing O] (ϖ : O) {M : Type w} [AddCommGroup M] [Module O M]
  [TopologicalSpace M] (S : Type v) [CommRing S] [Algebra O S] {U : Type v} [AddCommGroup U]
  [Module S U] [Module O U] [IsScalarTower O S U] [TopologicalSpace U]

/-- R5/mixed-tensor-finite-projective-base-change: the `S`-module structure of `U ⊗̂ M` for an
`S`-module `U`, by functoriality of `- ⊗̂ M` in `U`. -/
@[instance_reducible]
def mixedTensor.module : Module S (mixedTensor O ϖ U M) := sorry

/-- R5/mixed-tensor-finite-projective-base-change (the compatibility `Huber.mixedTensor.baseChange`
of R5/mixed-completed-tensor; CHJ Lemma 6.7): for a finite projective `S`-module `V`, the natural
map `V ⊗_S (U ⊗̂ M) → (V ⊗_S U) ⊗̂ M` is an isomorphism. `V ⊗_S U` carries its natural topology,
the coarsest for which every `V ⊗_S U → U`, `v ⊗ u ↦ φ(v) u` with `φ ∈ V*`, is continuous. When
`V`, `U` are Banach `S`-algebras and `M` is a small algebra it is a ring isomorphism. -/
def mixedTensor.baseChange (V : Type v) [AddCommGroup V] [Module S V] [Module.Finite S V]
    [Module.Projective S V] [Module O V] [IsScalarTower O S V] :
    letI := mixedTensor.module ϖ S (U := U) (M := M)
    letI : TopologicalSpace (V ⊗[S] U) := ⨅ φ : V →ₗ[S] S,
      TopologicalSpace.induced (TensorProduct.lid S U ∘ φ.rTensor U) inferInstance
    (V ⊗[S] mixedTensor O ϖ U M) ≃ₗ[O] mixedTensor O ϖ (V ⊗[S] U) M := sorry

end BaseChange

/-! ## AdicSpacesPartII:R5/completed-coefficient-sheaf (construction)

Every item lives on the site of rational subsets of an affinoid rigid space, which needs the
structure presheaf `U ↦ O_X(U)` on rational subsets (supplier: AdicSpaces Layer 3) and affinoid
rigid spaces (supplier: AdicSpacesPartII:R1/rigid-analytic-space). The value on one rational subset
is the ring `Huber.mixedTensor ℤ_[p] p (O_X(U)) R`, with ring structure
`Huber.mixedTensor.instCommRing`, Banach topology `Huber.mixedTensor.banach` and pseudobasis
description `Huber.mixedTensor.piEquiv`. -/

-- AdicSpace.coefficientSheaf: not stated here; needs the rational site of an affinoid rigid space
--   with its structure presheaf (supplier: AdicSpaces Layer 3,
--   AdicSpacesPartII:R1/rigid-analytic-space). Value on U: `Huber.mixedTensor`.
-- AdicSpace.coefficientSheaf.isSheaf: not stated here; needs sheaves on the rational site
--   (supplier: AdicSpaces Layer 3). Node R5/coefficient-sheaf-tate-acyclicity.
-- AdicSpace.coefficientSheaf.obj_eq: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.coefficientSheaf.banach: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.banach`.
-- AdicSpace.coefficientSheaf.unitBall: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.integralEquiv`.
-- AdicSpace.coefficientSheaf.map: not stated here; needs the rational site and morphisms of
--   affinoid rigid spaces (supplier: AdicSpaces Layer 3, AdicSpacesPartII:R1/rigid-analytic-space).
--   Ring-level core: `Huber.mixedTensor.map`.
-- AdicSpace.coefficientSheaf.ofStructureSheaf: not stated here; needs the structure presheaf
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.tmul`.
-- AdicSpace.coefficientSheaf.piEquiv: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.piEquiv`.
-- AdicSpace.coefficientSheaf.isNoetherian: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.isNoetherianRing`.
-- AdicSpace.coefficientSheaf.flat_restriction: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level core: `Huber.mixedTensor.flat_completionLocalization`.
-- coefficientSheaf_test_Zp: not stated here; needs the structure presheaf on rational subsets
--   (supplier: AdicSpaces Layer 3). Ring-level form: test mixedTensor_test_one. [degenerate test]
-- coefficientSheaf_test_disc_powerSeries: not stated here; needs the closed disc as an affinoid
--   rigid space with its rational site (supplier: AdicSpaces Layer 3). Ring-level form: test
--   mixedTensor_test_tateAlgebra_powerSeries. [computation test]
-- coefficientSheaf_test_not_structure_sheaf_of_product: not stated here; needs the rational site
--   (supplier: AdicSpaces Layer 3). Ring-level form: test mixedTensor_test_not_algebraic.
--   [non-example test]
-- coefficientSheaf_test_affinoid_weight: not stated here; needs products of affinoid rigid spaces
--   (supplier: AdicSpacesPartII:R0/affinoid-fibre-product, AdicSpaces Layer 5). Node
--   R5/affinoid-weight-coefficient-sheaf. [compatibility test]

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-noetherian (lemma) -/

/-- R5/coefficient-sheaf-noetherian (CHJ Lemma 6.13(1)): for a discretely valued complete field
`K ⊇ ℚ_p`, an affinoid `K`-algebra `A` (topologically of finite type over `K`; every `O_X(U)` is
one) and a small `ℤ_p`-algebra `R`, the ring `A ⊗̂ R` is noetherian. -/
theorem mixedTensor.isNoetherianRing (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [UniformSpace K] [IsUniformAddGroup K] [IsTopologicalRing K] [IsTateRing K] [CompleteSpace K]
    [T2Space K] [Algebra ℚ_[p] K] [IsDiscreteValuationRing (powerBoundedSubring K)]
    (hK : Continuous (algebraMap ℚ_[p] K)) (A : Type u) [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [CompleteSpace A] [T2Space A] [Algebra K A]
    [Algebra ℚ_[p] A] [IsScalarTower ℚ_[p] K A] [Algebra ℤ_[p] A] [IsScalarTower ℤ_[p] ℚ_[p] A]
    (hA : IsTopologicallyFiniteType (algebraMap K A)) (R : Type u) [CommRing R] [Algebra ℤ_[p] R]
    [IsSmallZpAlgebra p R] :
    letI := IsSmallZpAlgebra.topology p R
    IsNoetherianRing (mixedTensor ℤ_[p] (p : ℤ_[p]) A R) := sorry

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-flat-restriction (lemma) -/

/-- R5/coefficient-sheaf-flat-restriction (CHJ Lemma 6.13(2)): for `K`, `A`, `R` as in
`Huber.mixedTensor.isNoetherianRing` and a rational subset `U = R(T/s)` of `Spa(A, A°)`, the
restriction `A ⊗̂ R → A⟨T/s⟩ ⊗̂ R` (the map induced by `A → A⟨T/s⟩`) is flat. Since `A⟨T/s⟩` is
again affinoid, this covers every pair of rational subsets `V ⊆ U`. -/
theorem mixedTensor.flat_completionLocalization (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [UniformSpace K] [IsUniformAddGroup K] [IsTopologicalRing K] [IsTateRing K] [CompleteSpace K]
    [T2Space K] [Algebra ℚ_[p] K] [IsDiscreteValuationRing (powerBoundedSubring K)]
    (hK : Continuous (algebraMap ℚ_[p] K)) (A : Type u) [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [CompleteSpace A] [T2Space A] [Algebra K A]
    [Algebra ℚ_[p] A] [IsScalarTower ℚ_[p] K A] [Algebra ℤ_[p] A] [IsScalarTower ℤ_[p] ℚ_[p] A]
    (hA : IsTopologicallyFiniteType (algebraMap K A)) (R : Type u) [CommRing R] [Algebra ℤ_[p] R]
    [IsSmallZpAlgebra p R] (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hT : Ideal.span (T : Set A) = ⊤) (S : Type u) [CommRing S] [Algebra A S]
    [IsLocalization.Away s S] (hden : P.HasDenominatorPower T s S) :
    letI := IsSmallZpAlgebra.topology p R
    letI := P.locUniformSpace T s S hden
    letI := P.isUniformAddGroup_locUniformSpace T s S hden
    letI := P.isTopologicalRing_locUniformSpace T s S hden
    letI : Algebra ℤ_[p] (Completion S) :=
      (Completion.coeRingHom.comp ((algebraMap A S).comp (algebraMap ℤ_[p] A))).toAlgebra
    ∃ φ : mixedTensor ℤ_[p] (p : ℤ_[p]) A R →+* mixedTensor ℤ_[p] (p : ℤ_[p]) (Completion S) R,
      (∀ (a : A) (r : R), φ (mixedTensor.tmul (p : ℤ_[p]) a r) =
        mixedTensor.tmul (p : ℤ_[p]) (Completion.coeRingHom (algebraMap A S a)) r) ∧
      φ.Flat := sorry

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-faithfully-flat-cover (lemma) -/

-- Huber.mixedTensor.faithfullyFlat_pi_cover: not stated here; needs finite rational covers of
--   Spa(A, A°) with the rings of their members as a presheaf on the rational site (supplier:
--   AdicSpaces Layer 3). Its single-member case is `Huber.mixedTensor.flat_completionLocalization`.

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-tate-acyclicity (theorem) -/

-- Huber.mixedTensor.cech_exact: not stated here; needs the augmented Čech complex of a finite
--   rational cover, built from the structure presheaf on rational subsets and its restriction maps
--   (supplier: AdicSpaces Layer 3, Layer 4).

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-local-equalizer (lemma) -/

-- Huber.mixedTensor.equalizer: not stated here; needs the rings of the intersections U_i ∩ U_j
--   of a finite rational cover and the restriction maps between them, that is, the structure
--   presheaf on rational subsets (supplier: AdicSpaces Layer 3).

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-loc (construction)

Every item is a presheaf or sheaf of modules on the rational site of an affinoid rigid space. -/

-- AdicSpace.Loc: not stated here; needs presheaves of modules on the rational site over the
--   coefficient sheaf (supplier: AdicSpaces Layer 3; node R5/completed-coefficient-sheaf).
-- AdicSpace.Loc.obj_apply: not stated here; needs the rational site (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.isSheaf: not stated here; needs sheaves on the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.functor: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.full_faithful: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.exact: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.globalSections: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3).
-- AdicSpace.Loc.restrict: not stated here; needs restriction of sheaves on the rational site
--   (supplier: AdicSpaces Layer 3).
-- Loc_test_free: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3). [degenerate test]
-- Loc_test_quotient_T: not stated here; needs the structure sheaf on the rational site
--   (supplier: AdicSpaces Layer 3). [computation test]
-- Loc_test_fully_faithful: not stated here; needs sheaves of modules on the rational site
--   (supplier: AdicSpaces Layer 3). [characterisation test]
-- Loc_test_Zp_is_associated_sheaf: not stated here; needs the associated module sheaf
--   (supplier: AdicSpacesPartII:R3/associated-module-sheaf). [compatibility test]

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-coherent-module (definition)

Every item is a property of sheaves of modules on the rational site. -/

-- AdicSpace.IsCoherentCoefficient: not stated here; needs sheaves of modules over the coefficient
--   sheaf on the rational site (supplier: AdicSpaces Layer 3; node R5/coefficient-sheaf-loc).
-- AdicSpace.IsCoherentCoefficient.of_Loc: not stated here; needs Loc (supplier: AdicSpaces Layer 3).
-- AdicSpace.IsCoherentCoefficient.kernel: not stated here; needs kernels of sheaves of modules on
--   the rational site (supplier: AdicSpaces Layer 3).
-- AdicSpace.IsCoherentCoefficient.restrict: not stated here; needs restriction of sheaves on the
--   rational site (supplier: AdicSpaces Layer 3).
-- AdicSpace.IsLocallyProjectiveCoefficient: not stated here; needs Loc (supplier: AdicSpaces
--   Layer 3).
-- AdicSpace.IsCoherentCoefficient.eq_Loc: not stated here; needs Loc (supplier: AdicSpaces
--   Layer 3). Node R5/coefficient-sheaf-kiehl.
-- IsCoherentCoefficient.test_Loc: not stated here; needs Loc (supplier: AdicSpaces Layer 3).
--   [degenerate test]
-- IsCoherentCoefficient.test_glued_line_bundle: not stated here; needs gluing of sheaves of
--   modules on the rational site (supplier: AdicSpaces Layer 3). [computation test]
-- IsCoherentCoefficient.test_not_coherent: not stated here; needs sheafification on the rational
--   site (supplier: AdicSpaces Layer 3). [non-example test]

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-dense-restriction (lemma) -/

-- Huber.mixedTensor.denseRange_laurent: not stated here; needs the restriction map
--   O_X(X(1/f)) → O_X(X(f, 1/f)) between the rings of two rational subsets (supplier: AdicSpaces
--   Layer 3). With that map `ρ`, the statement is `DenseRange (Huber.mixedTensor.map p ρ _ id _)`.

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-kiehl (theorem) -/

-- AdicSpace.coefficientSheaf.kiehl: not stated here; needs coherent sheaves of modules over the
--   coefficient sheaf (supplier: AdicSpaces Layer 3; node R5/coefficient-sheaf-coherent-module).

/-! ## AdicSpacesPartII:R5/coefficient-sheaf-base-change (lemma) -/

-- Huber.mixedTensor.baseChange_completion: not stated here; needs the base change X_C of an
--   affinoid rigid space and the pullback f⁻¹ of sheaves on the rational site (supplier: AdicSpaces
--   Layer 3, Layer 5). Its ring is `Huber.mixedTensor ℤ_[p] p (Huber.CompletedTensor K A C) R`, with
--   `Huber.CompletedTensor` of AdicSpacesPartII:R0/completed-tensor-product.

/-! ## AdicSpacesPartII:R5/affinoid-weight-coefficient-sheaf (lemma) -/

/-- R5/affinoid-weight-coefficient-sheaf, ring-level core: for an affinoid `K`-algebra `A` over
`K ⊇ ℚ_p` and a reduced affinoid `ℚ_p`-algebra `S`, the completed tensor product `A ⊗̂_{ℚ_p} S`
(AdicSpacesPartII:R0/completed-tensor-product) is topologically of finite type over `K`: it is the
ring of the affinoid rigid space `Spa A ×_{ℚ_p} Spa S`. The identification of
`U ↦ O_X(U) ⊗̂_{ℚ_p} S` with the structure presheaf of `X ×_{ℚ_p} Spa S` on product rational subsets
needs rigid spaces and their products (supplier: AdicSpacesPartII:R1/rigid-analytic-space,
AdicSpacesPartII:R0/affinoid-fibre-product). -/
theorem completedTensor_affinoid (p : ℕ) [Fact p.Prime] (K : Type) [Field K] [UniformSpace K]
    [IsUniformAddGroup K] [IsTopologicalRing K] [IsTateRing K] [CompleteSpace K] [T2Space K]
    [Algebra ℚ_[p] K] (hK : Continuous (algebraMap ℚ_[p] K)) (A : Type) [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [CompleteSpace A] [T2Space A]
    [Algebra K A] [Algebra ℚ_[p] A] [IsScalarTower ℚ_[p] K A]
    (hA : IsTopologicallyFiniteType (algebraMap K A)) (S : Type) [CommRing S] [UniformSpace S]
    [IsUniformAddGroup S] [IsTopologicalRing S] [CompleteSpace S] [T2Space S] [Algebra ℚ_[p] S]
    [IsReduced S] (hS : IsTopologicallyFiniteType (algebraMap ℚ_[p] S)) :
    IsTopologicallyFiniteType (((Pair.completedTensor.tmul ℚ_[p] A S).comp
      Algebra.TensorProduct.includeLeftRingHom).comp (algebraMap K A)) := sorry

end Huber

end TauCeti

end

/-! # Layer F1. Dagger geometry and overconvergent de Rham complexes -/

noncomputable section

namespace TauCeti

namespace Dagger

open Filter Topology

/-! ## AdicSpacesPartII:F1/radius-tate-algebra-affinoid (lemma) -/

section Radius

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- F1/radius-tate-algebra-affinoid: the Tate algebra `T_n(ρ) = K⟨ρ⁻¹X₁, …, ρ⁻¹Xₙ⟩` of the
closed polydisc of radius `ρ`: Mathlib's restricted subring `MvPowerSeries.IsRestricted.subring`
at the constant tuple `ρ`, as a `K`-subalgebra of `K⟦X₁, …, Xₙ⟧`. -/
def radiusTate (ρ : ℝ) : Subalgebra K (MvPowerSeries (Fin n) K) :=
  { MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ ρ) with
    algebraMap_mem' := fun _ ↦ sorry }

/-- F1/radius-tate-algebra-affinoid: `Γ* = √|K^×|`, the divisible hull of the value group of `K`
inside `ℝ_{>0}`. -/
def gammaStar : Set ℝ :=
  {ρ | 0 < ρ ∧ ∃ (c : K) (s : ℕ), c ≠ 0 ∧ 0 < s ∧ ρ ^ s = ‖c‖}

/-- F1/radius-tate-algebra-affinoid: the `ρ`-Gauss norm `|f|_ρ = max_ν |a_ν| ρ^{|ν|}` of a power
series (Mathlib's `MvPowerSeries.gaussNorm` for the norm of `K` and the constant tuple `ρ`). -/
def radiusGaussNorm (ρ : ℝ) (f : MvPowerSeries (Fin n) K) : ℝ :=
  MvPowerSeries.gaussNorm (fun a : K ↦ ‖a‖) (fun _ : Fin n ↦ ρ) f

/-- F1/radius-tate-algebra-affinoid: the Banach topology of `T_n(ρ)`, generated by the open balls
of the `ρ`-Gauss norm. -/
abbrev radiusTate.topology (ρ : ℝ) : TopologicalSpace (radiusTate n K ρ) :=
  TopologicalSpace.generateFrom
    {U | ∃ (f : radiusTate n K ρ) (ε : ℝ), 0 < ε ∧
      U = {g : radiusTate n K ρ | radiusGaussNorm n K ρ ((g : MvPowerSeries (Fin n) K) - f) < ε}}

variable {n K}

/-- F1/radius-tate-algebra-affinoid (a): for `ρ > 0` the `ρ`-Gauss norm is multiplicative on
`T_n(ρ)`. -/
theorem radiusGaussNorm_mul {ρ : ℝ} (hρ : 0 < ρ) {f g : MvPowerSeries (Fin n) K}
    (hf : f ∈ radiusTate n K ρ) (hg : g ∈ radiusTate n K ρ) :
    radiusGaussNorm n K ρ (f * g) = radiusGaussNorm n K ρ f * radiusGaussNorm n K ρ g := sorry

/-- F1/radius-tate-algebra-affinoid (a): `T_n(ρ)` is complete for the `ρ`-Gauss norm: every
Gauss-norm Cauchy sequence of `T_n(ρ)` converges in `T_n(ρ)`. -/
theorem radiusTate_complete [CompleteSpace K] {ρ : ℝ} (hρ : 0 < ρ) (u : ℕ → radiusTate n K ρ)
    (hu : ∀ ε > 0, ∃ N, ∀ i ≥ N, ∀ j ≥ N,
      radiusGaussNorm n K ρ ((u i : MvPowerSeries (Fin n) K) - u j) < ε) :
    ∃ f : radiusTate n K ρ,
      Tendsto (fun i ↦ radiusGaussNorm n K ρ ((u i : MvPowerSeries (Fin n) K) - f)) atTop
        (𝓝 0) := sorry

/-- F1/radius-tate-algebra-affinoid (b): for `ρ ∈ Γ*`, `T_n(ρ)` with its Gauss-norm topology is a
`K`-affinoid algebra: `K → T_n(ρ)` is strictly topologically of finite type in Tau Ceti's sense. -/
theorem radiusTate_isStrictlyTopologicallyFiniteType [CompleteSpace K] [NonarchimedeanRing K]
    {ρ : ℝ} (hρ : ρ ∈ gammaStar K) :
    letI := radiusTate.topology n K ρ
    Huber.IsStrictlyTopologicallyFiniteType (algebraMap K (radiusTate n K ρ)) := sorry

/-- F1/radius-tate-algebra-affinoid (b): for `ρ ∈ Γ*`, `T_n(ρ)` is a noetherian ring. -/
theorem radiusTate_isNoetherianRing [CompleteSpace K] {ρ : ℝ} (hρ : ρ ∈ gammaStar K) :
    IsNoetherianRing (radiusTate n K ρ) := sorry

/-- F1/radius-tate-algebra-affinoid (c): for `0 < ρ ≤ ρ'` the inclusion `T_n(ρ') ⊆ T_n(ρ)` does
not increase Gauss norms, `|f|_ρ ≤ |f|_{ρ'}`, and has dense image: polynomials are dense in every
`T_n(ρ)`. -/
theorem radiusGaussNorm_le_and_dense {ρ ρ' : ℝ} (hρ : 0 < ρ) (h : ρ ≤ ρ') :
    (∀ f ∈ radiusTate n K ρ', radiusGaussNorm n K ρ f ≤ radiusGaussNorm n K ρ' f) ∧
      ∀ f ∈ radiusTate n K ρ, ∀ ε > 0, ∃ P : MvPolynomial (Fin n) K,
        radiusGaussNorm n K ρ (f - (P : MvPowerSeries (Fin n) K)) < ε := sorry

end Radius

/-! ## AdicSpacesPartII:F1/overconvergent-tate-algebra (construction) -/

section Washnitzer

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- F1/overconvergent-tate-algebra: the Monsky–Washnitzer algebra
`W_n = K⟨X₁, …, Xₙ⟩† = ⋃_{ρ > 1} T_n(ρ)` of overconvergent power series, a `K`-subalgebra of
`K⟦X₁, …, Xₙ⟧` (the union is directed, so it is the supremum). -/
def washnitzerAlgebra : Subalgebra K (MvPowerSeries (Fin n) K) :=
  ⨆ ρ : {ρ : ℝ // 1 < ρ}, radiusTate n K ρ

/-- F1/overconvergent-tate-algebra (constructor): the variable `Xᵢ ∈ W_n`. The polynomials lie in
`W_n` (`washnitzerAlgebra_test_zero`), and they are dense for the Gauss norm. -/
def washnitzerAlgebra.X (i : Fin n) : washnitzerAlgebra n K :=
  ⟨MvPowerSeries.X i, sorry⟩

/-- F1/overconvergent-tate-algebra: the Gauss norm `|f| = max_ν |a_ν|` (radius one). -/
abbrev unitGaussNorm (f : MvPowerSeries (Fin n) K) : ℝ :=
  radiusGaussNorm n K 1 f

variable {n K}

/-- F1/overconvergent-tate-algebra (characterisation): `f ∈ W_n` iff `f` is restricted at some
radius `ρ > 1`. -/
theorem mem_washnitzerAlgebra_iff {f : MvPowerSeries (Fin n) K} :
    f ∈ washnitzerAlgebra n K ↔
      ∃ ρ > (1 : ℝ), MvPowerSeries.IsRestricted (fun _ : Fin n ↦ ρ) f := sorry

/-- F1/overconvergent-tate-algebra (characterisation): `f ∈ W_n` iff `|a_ν| ≤ C ρ^{-|ν|}` for some
`ρ > 1` and `C`. -/
theorem mem_washnitzerAlgebra_iff_exists_bound {f : MvPowerSeries (Fin n) K} :
    f ∈ washnitzerAlgebra n K ↔
      ∃ ρ > (1 : ℝ), ∃ C : ℝ, ∀ ν : Fin n →₀ ℕ,
        ‖MvPowerSeries.coeff ν f‖ ≤ C * (ρ ^ Finsupp.degree ν)⁻¹ := sorry

/-- F1/overconvergent-tate-algebra (characterisation): the radii may be taken in
`Γ* = √|K^×|` (but not in `|K^×|`, `washnitzerAlgebra_test_radii_in_gamma`). -/
theorem mem_washnitzerAlgebra_iff_exists_mem_gamma {f : MvPowerSeries (Fin n) K} :
    f ∈ washnitzerAlgebra n K ↔
      ∃ ρ ∈ gammaStar K, 1 < ρ ∧ MvPowerSeries.IsRestricted (fun _ : Fin n ↦ ρ) f := sorry

/-- F1/overconvergent-tate-algebra (relation): `ρ ↦ T_n(ρ)` is antitone on `ρ ≥ 0`; in particular
`T_n(ρ) ≤ W_n ≤ T_n(1)` for `ρ > 1`. -/
theorem restrictedSubring_antitone {ρ ρ' : ℝ} (hρ : 0 ≤ ρ) (h : ρ ≤ ρ') :
    radiusTate n K ρ' ≤ radiusTate n K ρ := sorry

/-- F1/overconvergent-tate-algebra: `T_n(ρ) ≤ W_n` for `ρ > 1`. -/
theorem radiusTate_le_washnitzerAlgebra {ρ : ℝ} (hρ : 1 < ρ) :
    radiusTate n K ρ ≤ washnitzerAlgebra n K := sorry

/-- F1/overconvergent-tate-algebra: `W_n ≤ T_n(1) = T_n`. -/
theorem washnitzerAlgebra_le_radiusTate_one : washnitzerAlgebra n K ≤ radiusTate n K 1 := sorry

/-- F1/overconvergent-tate-algebra (compatibility): `W_n` lies in Tau Ceti's Tate algebra
`K⟨X₁, …, Xₙ⟩ = TauCeti.Huber.restrictedMvPowerSeriesSubring n K`. -/
theorem washnitzerAlgebra_le_restrictedMvPowerSeriesSubring [NonarchimedeanRing K] :
    (washnitzerAlgebra n K).toSubring ≤ Huber.restrictedMvPowerSeriesSubring n K := sorry

/-- F1/overconvergent-tate-algebra: `W_n` lies in the weighted restricted subring at the trivial
weights `Tᵢ = {1}`, whose completion is Tau Ceti's `restrictedMvPowerSeriesCompletion n K`. -/
theorem washnitzerAlgebra_le_weightedRestrictedSubring [NonarchimedeanRing K] :
    (washnitzerAlgebra n K).toSubring ≤
      Huber.weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set K))
        Huber.isWeightFamily_one_weight := sorry

variable (n K) in
/-- F1/overconvergent-tate-algebra: the map `W_n → T_n` into Tau Ceti's completed Tate algebra
`K⟨X₁, …, Xₙ⟩ = restrictedMvPowerSeriesCompletion n K`. -/
def washnitzerAlgebra.toTate [NonarchimedeanRing K] :
    washnitzerAlgebra n K →+* Huber.restrictedMvPowerSeriesCompletion n K :=
  UniformSpace.Completion.coeRingHom.comp
    (Subring.inclusion (washnitzerAlgebra_le_weightedRestrictedSubring (n := n) (K := K)))

/-- F1/overconvergent-tate-algebra (relation): `W_n` is dense in `T_n = T_n(1)` for the Gauss norm,
and `W_n ≠ T_n` for `n ≥ 1`, so `W_n` is not complete. -/
theorem dense_washnitzerAlgebra :
    (∀ f ∈ radiusTate n K 1, ∀ ε > 0, ∃ g ∈ washnitzerAlgebra n K, unitGaussNorm n K (f - g) < ε) ∧
      (1 ≤ n → washnitzerAlgebra n K ≠ radiusTate n K 1) := sorry

/-- F1/overconvergent-tate-algebra (simp): the Gauss norm is multiplicative on `W_n`. -/
theorem gaussNorm_mul_washnitzerAlgebra {f g : MvPowerSeries (Fin n) K}
    (hf : f ∈ washnitzerAlgebra n K) (hg : g ∈ washnitzerAlgebra n K) :
    unitGaussNorm n K (f * g) = unitGaussNorm n K f * unitGaussNorm n K g := sorry

/-- F1/overconvergent-tate-algebra (example): `W_0 = K`. -/
theorem washnitzerAlgebra_zero : washnitzerAlgebra 0 K = ⊤ := sorry

/-- F1/overconvergent-tate-algebra (characterisation): `f ∈ W_n` is a unit of `W_n` iff it is a
unit of `T_n`, iff `|f − f(0)| < |f(0)|`. -/
theorem isUnit_washnitzerAlgebra_iff (f : washnitzerAlgebra n K) :
    (IsUnit f ↔ IsUnit (Subalgebra.inclusion washnitzerAlgebra_le_radiusTate_one f)) ∧
      (IsUnit f ↔
        unitGaussNorm n K ((f : MvPowerSeries (Fin n) K) -
            MvPowerSeries.C (MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K))) <
          ‖MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K)‖) := sorry

/-- F1/overconvergent-tate-algebra (other): `∂/∂Xᵢ` maps `W_n` to `W_n` (Cauchy estimate
`|(1/j!) ∂ᵢ^j f|_ρ ≤ ρ^{-j} |f|_ρ`). -/
theorem pderiv_mem_washnitzerAlgebra (i : Fin n) {f : MvPowerSeries (Fin n) K}
    (hf : f ∈ washnitzerAlgebra n K) :
    MvPowerSeries.pderiv K i f ∈ washnitzerAlgebra n K := sorry

/-- F1/overconvergent-tate-algebra (other): in characteristic zero the termwise primitive
`∑ a_ν X^ν ↦ ∑ a_ν X^{ν + eᵢ} / (νᵢ + 1)` maps `W_n` to `W_n`. -/
theorem primitive_mem_washnitzerAlgebra [CharZero K] (i : Fin n) {f : MvPowerSeries (Fin n) K}
    (hf : f ∈ washnitzerAlgebra n K) :
    (fun μ : Fin n →₀ ℕ ↦ if μ i = 0 then (0 : K) else
        MvPowerSeries.coeff (μ - Finsupp.single i 1) f / (μ i : K) :
        MvPowerSeries (Fin n) K) ∈ washnitzerAlgebra n K := sorry

-- test washnitzerAlgebra_test_geometric (computation) [F1/overconvergent-tate-algebra]
example (p : ℕ) [Fact p.Prime] :
    (fun ν : Fin 1 →₀ ℕ ↦ (p : ℚ_[p]) ^ ν 0 : MvPowerSeries (Fin 1) ℚ_[p]) ∈
        washnitzerAlgebra 1 ℚ_[p] ∧
      ∀ ρ : ℝ, 0 < ρ → ρ < p →
        MvPowerSeries.IsRestricted (fun _ : Fin 1 ↦ ρ)
          (fun ν : Fin 1 →₀ ℕ ↦ (p : ℚ_[p]) ^ ν 0 : MvPowerSeries (Fin 1) ℚ_[p]) := sorry

/- `g = ∑ₘ pᵐ X^{pᵐ}`: its coefficient at `X^k` is `pᵐ` if `k = pᵐ`, else `0`. -/
-- test washnitzerAlgebra_test_not_mem_lacunary (non-example) [F1/overconvergent-tate-algebra]
example (p : ℕ) [Fact p.Prime] :
    let g : MvPowerSeries (Fin 1) ℚ_[p] := fun ν ↦
      if p ^ Nat.log p (ν 0) = ν 0 then (p : ℚ_[p]) ^ Nat.log p (ν 0) else 0
    g ∈ radiusTate 1 ℚ_[p] 1 ∧ g ∉ washnitzerAlgebra 1 ℚ_[p] := sorry

/- `h = ∑ₘ pᵐ X^{2m}` is overconvergent, but lies in no `T_1(pᵏ)`, `k ≥ 1`. -/
-- test washnitzerAlgebra_test_radii_in_gamma (characterisation) [F1/overconvergent-tate-algebra]
example (p : ℕ) [Fact p.Prime] :
    let h : MvPowerSeries (Fin 1) ℚ_[p] := fun ν ↦
      if Even (ν 0) then (p : ℚ_[p]) ^ (ν 0 / 2) else 0
    h ∈ washnitzerAlgebra 1 ℚ_[p] ∧ ∀ k : ℕ, 1 ≤ k → h ∉ radiusTate 1 ℚ_[p] ((p : ℝ) ^ k) := sorry

-- test washnitzerAlgebra_test_zero (degenerate) [F1/overconvergent-tate-algebra]
example : washnitzerAlgebra 0 K = ⊤ ∧
    ∀ P : MvPolynomial (Fin n) K, (P : MvPowerSeries (Fin n) K) ∈ washnitzerAlgebra n K := sorry

-- test washnitzerAlgebra_test_tate (compatibility) [F1/overconvergent-tate-algebra]
example [NonarchimedeanRing K] :
    (washnitzerAlgebra n K).toSubring = Huber.restrictedMvPowerSeriesSubring n K ↔ n = 0 := sorry

end Washnitzer

/-! ## AdicSpacesPartII:F1/overconvergent-weierstrass-division (lemma) -/

section Weierstrass

variable {n : ℕ} {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

variable (K) in
/-- F1/overconvergent-weierstrass-division: the coefficient `g_m ∈ K⟦X₁, …, Xₙ⟧` of `Y^m` in
`g ∈ K⟦Y, X₁, …, Xₙ⟧`, where the distinguished variable `Y` is the variable `0` of `Fin (n + 1)`
(the node's `Yₙ`, moved to the front for `Finsupp.cons`). -/
def distinguishedCoeff (g : MvPowerSeries (Fin (n + 1)) K) (m : ℕ) : MvPowerSeries (Fin n) K :=
  fun ν ↦ MvPowerSeries.coeff (Finsupp.cons m ν) g

/-- F1/overconvergent-weierstrass-division: `g ∈ W_{n+1}` is `Y`-distinguished of degree `s`:
`g_s` is a unit of `W_n` and `|g| = |g_s| > |g_m|` for all `m > s` (Gauss norms). -/
def IsDistinguished (s : ℕ) (g : MvPowerSeries (Fin (n + 1)) K) : Prop :=
  (∃ u : (washnitzerAlgebra n K)ˣ, ((u : washnitzerAlgebra n K) : MvPowerSeries (Fin n) K) =
      distinguishedCoeff K g s) ∧
    unitGaussNorm (n + 1) K g = unitGaussNorm n K (distinguishedCoeff K g s) ∧
    ∀ m > s, unitGaussNorm n K (distinguishedCoeff K g m) <
      unitGaussNorm n K (distinguishedCoeff K g s)

/-- F1/overconvergent-weierstrass-division (i), division: if `g ∈ W_{n+1}` is `Y`-distinguished of
degree `s`, every `f ∈ W_{n+1}` is uniquely `f = g q + r` with `q ∈ W_{n+1}` and `r ∈ W_n[Y]` of
degree `< s`. -/
theorem weierstrassDivision {s : ℕ} {g f : MvPowerSeries (Fin (n + 1)) K}
    (hgW : g ∈ washnitzerAlgebra (n + 1) K) (hg : IsDistinguished s g)
    (hf : f ∈ washnitzerAlgebra (n + 1) K) :
    ∃! qr : MvPowerSeries (Fin (n + 1)) K × MvPowerSeries (Fin (n + 1)) K,
      qr.1 ∈ washnitzerAlgebra (n + 1) K ∧
        (∀ m, distinguishedCoeff K qr.2 m ∈ washnitzerAlgebra n K) ∧
        (∀ m, s ≤ m → distinguishedCoeff K qr.2 m = 0) ∧ f = g * qr.1 + qr.2 := sorry

/-- F1/overconvergent-weierstrass-division (ii), preparation: a `Y`-distinguished `g` of degree `s`
is uniquely `e ω` with `e` a unit of `W_{n+1}` and `ω ∈ W_n[Y]` a Weierstrass polynomial of degree
`s` (monic with `|ω| = 1`). -/
theorem weierstrassPreparation {s : ℕ} {g : MvPowerSeries (Fin (n + 1)) K}
    (hgW : g ∈ washnitzerAlgebra (n + 1) K) (hg : IsDistinguished s g) :
    ∃! eω : MvPowerSeries (Fin (n + 1)) K × MvPowerSeries (Fin (n + 1)) K,
      (∃ u : (washnitzerAlgebra (n + 1) K)ˣ,
          ((u : washnitzerAlgebra (n + 1) K) : MvPowerSeries (Fin (n + 1)) K) = eω.1) ∧
        (∀ m, distinguishedCoeff K eω.2 m ∈ washnitzerAlgebra n K) ∧
        distinguishedCoeff K eω.2 s = 1 ∧ (∀ m, s < m → distinguishedCoeff K eω.2 m = 0) ∧
        unitGaussNorm (n + 1) K eω.2 = 1 ∧ g = eω.1 * eω.2 := sorry

/-- F1/overconvergent-weierstrass-division (iii): every `f ≠ 0` in `W_{n+1}` becomes
`Y`-distinguished after a `K`-algebra automorphism `Xᵢ ↦ Xᵢ + Y^{cᵢ}`, `Y ↦ Y`. -/
theorem exists_algEquiv_isDistinguished (f : washnitzerAlgebra (n + 1) K) (hf : f ≠ 0) :
    ∃ (σ : washnitzerAlgebra (n + 1) K ≃ₐ[K] washnitzerAlgebra (n + 1) K) (c : Fin n → ℕ) (s : ℕ),
      σ (washnitzerAlgebra.X (n + 1) K 0) = washnitzerAlgebra.X (n + 1) K 0 ∧
        (∀ i : Fin n, σ (washnitzerAlgebra.X (n + 1) K i.succ) =
          washnitzerAlgebra.X (n + 1) K i.succ + washnitzerAlgebra.X (n + 1) K 0 ^ c i) ∧
        IsDistinguished s ((σ f : washnitzerAlgebra (n + 1) K) : MvPowerSeries (Fin (n + 1)) K) :=
  sorry

end Weierstrass

/-! ## AdicSpacesPartII:F1/overconvergent-tate-algebra-properties (lemma) -/

section Properties

variable {n : ℕ} {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- F1/overconvergent-tate-algebra-properties: `W_n` is an integral domain. -/
instance washnitzerAlgebra.isDomain : IsDomain (washnitzerAlgebra n K) := sorry

/-- F1/overconvergent-tate-algebra-properties (1): `W_n` is noetherian. -/
instance washnitzerAlgebra.isNoetherianRing : IsNoetherianRing (washnitzerAlgebra n K) := sorry

/-- F1/overconvergent-tate-algebra-properties (1): `W_n` is a unique factorisation domain. -/
instance washnitzerAlgebra.uniqueFactorizationMonoid :
    UniqueFactorizationMonoid (washnitzerAlgebra n K) := sorry

/-- F1/overconvergent-tate-algebra-properties (1): `W_n` is a Jacobson ring. -/
instance washnitzerAlgebra.isJacobsonRing : IsJacobsonRing (washnitzerAlgebra n K) := sorry

/-- F1/overconvergent-tate-algebra-properties (2): every ideal of `W_n` is strictly closed for the
Gauss norm: it is closed, and the distance `inf_{g ∈ I} |f − g|` is attained. -/
theorem washnitzerAlgebra.isStrictlyClosed (I : Ideal (washnitzerAlgebra n K)) :
    (∀ f : washnitzerAlgebra n K,
        (∀ ε > 0, ∃ g ∈ I, unitGaussNorm n K ((f : MvPowerSeries (Fin n) K) - g) < ε) → f ∈ I) ∧
      ∀ f : washnitzerAlgebra n K, ∃ g ∈ I, ∀ h ∈ I,
        unitGaussNorm n K ((f : MvPowerSeries (Fin n) K) - g) ≤
          unitGaussNorm n K ((f : MvPowerSeries (Fin n) K) - h) := sorry

end Properties

/-! ## AdicSpacesPartII:F1/overconvergent-faithful-flatness (lemma) -/

section FaithfulFlatness

variable {n : ℕ} {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]

/-- F1/overconvergent-faithful-flatness (a): `W_n → T_n` is faithfully flat. -/
theorem washnitzerAlgebra.faithfullyFlat :
    letI := (washnitzerAlgebra.toTate n K).toAlgebra
    Module.FaithfullyFlat (washnitzerAlgebra n K) (Huber.restrictedMvPowerSeriesCompletion n K) :=
  sorry

/-- F1/overconvergent-faithful-flatness (b): for a maximal ideal `m` of `T_n`, `m ∩ W_n` is maximal
and `W_n/(m ∩ W_n) → T_n/m` is bijective. -/
theorem washnitzerAlgebra.isMaximal_comap_toTate
    (m : Ideal (Huber.restrictedMvPowerSeriesCompletion n K))
    [m.IsMaximal] :
    (m.comap (washnitzerAlgebra.toTate n K)).IsMaximal ∧
      Function.Bijective (Ideal.quotientMap m (washnitzerAlgebra.toTate n K) le_rfl) := sorry

/-- F1/overconvergent-faithful-flatness (b): `m ↦ m ∩ W_n` is a bijection `Max(T_n) → Max(W_n)`. -/
theorem washnitzerAlgebra.existsUnique_isMaximal_comap (m' : Ideal (washnitzerAlgebra n K))
    (hm' : m'.IsMaximal) :
    ∃! m : Ideal (Huber.restrictedMvPowerSeriesCompletion n K),
      m.IsMaximal ∧ m.comap (washnitzerAlgebra.toTate n K) = m' := sorry

/-- F1/overconvergent-faithful-flatness (d): `W_n` is a regular ring. -/
instance washnitzerAlgebra.isRegularRing : IsRegularRing (washnitzerAlgebra n K) := sorry

/-- F1/overconvergent-faithful-flatness (d): `W_n` has Krull dimension `n`. -/
theorem washnitzerAlgebra.ringKrullDim : ringKrullDim (washnitzerAlgebra n K) = n := sorry

end FaithfulFlatness

/-! ## AdicSpacesPartII:F1/dagger-algebra (definition) -/

section DaggerAlgebra

/-- F1/dagger-algebra: a `K`-dagger algebra is a commutative `K`-algebra `A` admitting a surjective
`K`-algebra map `W_n → A` for some `n` (equivalently `A ≅ W_n / I`). Morphisms of dagger algebras
are `K`-algebra maps; their continuity is automatic (`continuous_algHom`). -/
class IsDaggerAlgebra (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (A : Type*)
    [CommRing A] [Algebra K A] : Prop where
  exists_surjective : ∃ (n : ℕ) (φ : washnitzerAlgebra n K →ₐ[K] A), Function.Surjective φ

section DaggerInstances

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  {A : Type*} [CommRing A] [Algebra K A]

/-- F1/dagger-algebra (instance): `W_n` is a dagger algebra (identity presentation). -/
instance IsDaggerAlgebra.washnitzerAlgebra (n : ℕ) :
    IsDaggerAlgebra K (Dagger.washnitzerAlgebra n K) :=
  sorry

/-- F1/dagger-algebra: `K = W_0` is a dagger algebra. -/
instance IsDaggerAlgebra.self : IsDaggerAlgebra K K := sorry

/-- F1/dagger-algebra (constructor): a quotient of a dagger algebra is a dagger algebra. -/
instance IsDaggerAlgebra.quotient [IsDaggerAlgebra K A] (J : Ideal A) : IsDaggerAlgebra K (A ⧸ J) :=
  sorry

end DaggerInstances

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-algebra: the number of variables of the chosen presentation `W_n ↠ A`. -/
def presentationDim : ℕ :=
  (IsDaggerAlgebra.exists_surjective (K := K) (A := A)).choose

/-- F1/dagger-algebra: the chosen presentation `W_n ↠ A`. -/
def presentation : washnitzerAlgebra (presentationDim K A) K →ₐ[K] A :=
  (IsDaggerAlgebra.exists_surjective (K := K) (A := A)).choose_spec.choose

/-- F1/dagger-algebra: the chosen presentation is surjective. -/
theorem presentation_surjective : Function.Surjective (presentation K A) :=
  (IsDaggerAlgebra.exists_surjective (K := K) (A := A)).choose_spec.choose_spec

variable {K A} in
/-- F1/dagger-norm-and-continuity: the residue norm `|a| = inf {|f| : f ∈ W_n, φ f = a}` of a
presentation `φ : W_n ↠ A` (Gauss norm on `W_n`). -/
def residueNorm {n : ℕ} (φ : washnitzerAlgebra n K →ₐ[K] A) (a : A) : ℝ :=
  ⨅ f : {f : washnitzerAlgebra n K // φ f = a}, unitGaussNorm n K (f.1 : MvPowerSeries (Fin n) K)

/-- F1/dagger-norm-and-continuity: the affinoid topology of `A`: the topology of the residue norm
of the chosen presentation (independent of the presentation, `residueNorm_equiv`). -/
abbrev affinoidTopology : TopologicalSpace A :=
  TopologicalSpace.generateFrom
    {U | ∃ (a : A) (ε : ℝ), 0 < ε ∧ U = {b | residueNorm (presentation K A) (b - a) < ε}}

/-- F1/dagger-algebra: the absolute value `|a(x)|` of `a ∈ A` at a point `x ∈ Sp(A)`: the spectral
norm of `a mod x` in the finite extension `A/x` of `K`. -/
def pointNorm (x : MaximalSpectrum A) (a : A) : ℝ :=
  letI := Ideal.Quotient.field x.asIdeal
  spectralNorm K (A ⧸ x.asIdeal) (Ideal.Quotient.mk x.asIdeal a)

/-- F1/dagger-algebra: the supremum seminorm `|a|_sup = max_{x ∈ Sp(A)} |a(x)|`. -/
def supNorm (a : A) : ℝ :=
  ⨆ x : MaximalSpectrum A, pointNorm K A x a

variable [NonarchimedeanRing K]

/-- F1/dagger-algebra (data): the completion `Â = T_n / I T_n` of `A = W_n / I` (chosen
presentation), with `T_n` Tau Ceti's `restrictedMvPowerSeriesCompletion n K`. It is a `K`-affinoid
algebra (`completion_isStrictlyTopologicallyFiniteType`) and does not depend on the presentation up
to unique isomorphism under `A` (F1/dagger-completion-comparison). -/
abbrev completion : Type _ :=
  Huber.restrictedMvPowerSeriesCompletion (presentationDim K A) K ⧸
    Ideal.map (washnitzerAlgebra.toTate (presentationDim K A) K) (RingHom.ker (presentation K A))

/-- F1/dagger-algebra: the completion map `τ : A → Â`, induced by `W_n → T_n`. -/
def toCompletion : A →+* completion K A :=
  (Ideal.quotientMap _ (washnitzerAlgebra.toTate (presentationDim K A) K) Ideal.le_comap_map).comp
    ((Ideal.quotientKerAlgEquivOfSurjective (presentation_surjective K A)).symm : A →+* _)

/-- F1/dagger-algebra (data): the integral subring `A^int = τ⁻¹(Â°)`, the elements whose image in
the completion is power-bounded. -/
def intSubring : Subring A where
  carrier := {a | Huber.IsPowerBounded (toCompletion K A a)}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

variable {K A}

/-- F1/dagger-algebra: `K → Â` is strictly topologically of finite type (`Â` is `K`-affinoid). -/
theorem completion_isStrictlyTopologicallyFiniteType [CompleteSpace K] :
    Huber.IsStrictlyTopologicallyFiniteType (algebraMap K (completion K A)) := sorry

/-- F1/dagger-algebra (characterisation): `a ∈ A^int` iff `a` is power-bounded for the affinoid
topology, iff `|a|_sup ≤ 1`. -/
theorem mem_intSubring_iff_isPowerBounded [CompleteSpace K] (a : A) :
    (a ∈ intSubring K A ↔ (letI := affinoidTopology K A; Huber.IsPowerBounded a)) ∧
      (a ∈ intSubring K A ↔ supNorm K A a ≤ 1) := sorry

/-- F1/dagger-algebra (characterisation): `a` is a unit of `A` iff `τ a` is a unit of `Â`. -/
theorem isUnit_iff_isUnit_completion [CompleteSpace K] (a : A) :
    IsUnit a ↔ IsUnit (toCompletion K A a) := sorry

/-- F1/dagger-algebra (compatibility): with its affinoid topology `A` is a Tate ring and
`(A, A^int)` is a Huber pair. -/
theorem toHuberPair [CompleteSpace K] :
    letI := affinoidTopology K A
    ∃ (_ : IsTopologicalRing A) (_ : Huber.IsTateRing A) (S : Huber.Pair A),
      S.plus = intSubring K A := sorry

/-- F1/dagger-algebra (relation): `|a|_sup ≤ |a|` for the residue norm of every presentation; if `A`
is reduced, the residue norm is bounded by a multiple of `|·|_sup` (they are equivalent). -/
theorem supNorm_le [CompleteSpace K] :
    (∀ {m : ℕ} (φ : washnitzerAlgebra m K →ₐ[K] A), Function.Surjective φ →
        ∀ a, supNorm K A a ≤ residueNorm φ a) ∧
      (IsReduced A → ∃ C > (0 : ℝ), ∀ a, residueNorm (presentation K A) a ≤ C * supNorm K A a) :=
  sorry

/-- F1/dagger-algebra (example): the completion of `W_n` is `T_n`, compatibly with `W_n → T_n`. -/
theorem completion_washnitzerAlgebra [CompleteSpace K] (n : ℕ) :
    ∃ e : completion K (washnitzerAlgebra n K) ≃+* Huber.restrictedMvPowerSeriesCompletion n K,
      ∀ f, e (toCompletion K (washnitzerAlgebra n K) f) = washnitzerAlgebra.toTate n K f := sorry

end DaggerAlgebra

section DaggerAlgebraAPI

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A]

/-- F1/dagger-algebra (instance): a dagger algebra is noetherian. -/
theorem IsDaggerAlgebra.isNoetherianRing [IsDaggerAlgebra K A] : IsNoetherianRing A := sorry

/-- F1/dagger-algebra (instance): a dagger algebra is a Jacobson ring. -/
theorem IsDaggerAlgebra.isJacobsonRing [IsDaggerAlgebra K A] : IsJacobsonRing A := sorry

/-- F1/dagger-algebra (characterisation): every residue field `A/m` is a finite extension of `K`. -/
theorem IsDaggerAlgebra.finite_residueField [IsDaggerAlgebra K A] (m : Ideal A) (hm : m.IsMaximal) :
    Module.Finite K (A ⧸ m) := sorry

-- test IsDaggerAlgebra_test_laurent (computation) [F1/dagger-algebra]
example :
    IsDaggerAlgebra K (washnitzerAlgebra 2 K ⧸ Ideal.span
        {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1}) ∧
      ∀ a : K, ‖a‖ < 1 →
        IsUnit (Ideal.Quotient.mk (Ideal.span
          {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1})
          (washnitzerAlgebra.X 2 K 0 - algebraMap K _ a)) := sorry

-- test IsDaggerAlgebra_test_trivial (degenerate) [F1/dagger-algebra]
example : IsDaggerAlgebra K K ∧
    IsDaggerAlgebra K (washnitzerAlgebra 0 K ⧸ (⊤ : Ideal (washnitzerAlgebra 0 K))) := sorry

/- `K[X]` has `|X|_sup = ∞`; a definition "finitely generated `K`-subalgebra of `T_n`" would admit
it. -/
-- test IsDaggerAlgebra_test_polynomial (non-example) [F1/dagger-algebra]
example : ¬ IsDaggerAlgebra K (Polynomial K) := sorry

/- Over `ℚ_p`, the partial sums of `∑ pᵐ X^{pᵐ}` are Gauss-norm Cauchy in `W_1` with no limit in
`W_1`: a dagger algebra need not be complete. -/
-- test IsDaggerAlgebra_test_not_complete (non-example) [F1/dagger-algebra]
example (p : ℕ) [Fact p.Prime] :
    let u : ℕ → washnitzerAlgebra 1 ℚ_[p] := fun N ↦
      ∑ m ∈ Finset.range (N + 1), (p : washnitzerAlgebra 1 ℚ_[p]) ^ m *
        washnitzerAlgebra.X 1 ℚ_[p] 0 ^ (p ^ m)
    (∀ ε > 0, ∃ N, ∀ i ≥ N, ∀ j ≥ N,
        unitGaussNorm 1 ℚ_[p] ((u i : MvPowerSeries (Fin 1) ℚ_[p]) - u j) < ε) ∧
      ¬ ∃ f : washnitzerAlgebra 1 ℚ_[p],
        Tendsto (fun N ↦ unitGaussNorm 1 ℚ_[p] ((u N : MvPowerSeries (Fin 1) ℚ_[p]) - f)) atTop
          (𝓝 0) := sorry

-- test IsDaggerAlgebra_test_int (characterisation) [F1/dagger-algebra]
example [NonarchimedeanRing K] (n : ℕ) :
    ∀ f : washnitzerAlgebra n K, f ∈ intSubring K (washnitzerAlgebra n K) ↔
      ∀ ν, ‖MvPowerSeries.coeff ν (f : MvPowerSeries (Fin n) K)‖ ≤ 1 := sorry

-- test IsDaggerAlgebra_test_completion (compatibility) [F1/dagger-algebra]
example [NonarchimedeanRing K] (n : ℕ) :
    ∃ e : completion K (washnitzerAlgebra n K) ≃+* Huber.restrictedMvPowerSeriesCompletion n K,
      ∀ P : MvPolynomial (Fin n) K,
        e (toCompletion K (washnitzerAlgebra n K)
            (MvPolynomial.aeval (washnitzerAlgebra.X n K) P)) =
          washnitzerAlgebra.toTate n K (MvPolynomial.aeval (washnitzerAlgebra.X n K) P) := sorry

end DaggerAlgebraAPI

/-! ## AdicSpacesPartII:F1/dagger-noether-normalisation (lemma) -/

section NoetherNormalisation

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-noether-normalisation (a): there is an injective finite `K`-algebra map `W_d → A`. -/
theorem exists_finite_injective_washnitzer :
    ∃ (d : ℕ) (φ : washnitzerAlgebra d K →ₐ[K] A), Function.Injective φ ∧ φ.toRingHom.Finite :=
  sorry

/-- F1/dagger-noether-normalisation (b): if `√q` is maximal then `A/q` is finite over `K`; in
particular every residue field of `A` is finite over `K`. Part (c), the finiteness step for a
Weierstrass polynomial in the kernel, is the induction step of the proof. -/
theorem finite_quotient_of_isMaximal_radical (q : Ideal A) (hq : q.radical.IsMaximal) :
    Module.Finite K (A ⧸ q) := sorry

end NoetherNormalisation

/-! ## AdicSpacesPartII:F1/dagger-norm-and-continuity (lemma) -/

section NormContinuity

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A B : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]
  [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]

/-- F1/dagger-norm-and-continuity (1): the residue norm of a presentation is a `K`-algebra norm:
submultiplicative, ultrametric, definite and `K`-homogeneous. -/
theorem residueNorm_isNorm {n : ℕ} (φ : washnitzerAlgebra n K →ₐ[K] A)
    (hφ : Function.Surjective φ) :
    (∀ a b, residueNorm φ (a * b) ≤ residueNorm φ a * residueNorm φ b) ∧
      (∀ a b, residueNorm φ (a + b) ≤ max (residueNorm φ a) (residueNorm φ b)) ∧
      (∀ a, residueNorm φ a = 0 ↔ a = 0) ∧
      ∀ (c : K) a, residueNorm φ (algebraMap K A c * a) = ‖c‖ * residueNorm φ a := sorry

/-- F1/dagger-norm-and-continuity: the residue norms of two presentations are equivalent. -/
theorem residueNorm_equiv {n m : ℕ} (φ : washnitzerAlgebra n K →ₐ[K] A)
    (ψ : washnitzerAlgebra m K →ₐ[K] A) (hφ : Function.Surjective φ)
    (hψ : Function.Surjective ψ) :
    ∃ C > (0 : ℝ), ∀ a, residueNorm φ a ≤ C * residueNorm ψ a := sorry

/-- F1/dagger-norm-and-continuity (2): every `K`-algebra map of dagger algebras is continuous for
the affinoid topologies. -/
theorem continuous_algHom (φ : A →ₐ[K] B) :
    @Continuous A B (affinoidTopology K A) (affinoidTopology K B) φ := sorry

end NormContinuity

/-! ## AdicSpacesPartII:F1/dagger-completion-comparison (theorem) -/

section CompletionComparison

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A B C : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]
  [CommRing B] [Algebra K B] [IsDaggerAlgebra K B] [CommRing C] [Algebra K C] [IsDaggerAlgebra K C]

/-- F1/dagger-completion-comparison (1): `τ : A → Â` is faithfully flat. -/
theorem faithfullyFlat_completion :
    letI := (toCompletion K A).toAlgebra
    Module.FaithfullyFlat A (completion K A) := sorry

/-- F1/dagger-completion-comparison (1): `m ↦ τ⁻¹ m` is a bijection `Max(Â) → Max(A)` with
isomorphic residue fields. -/
theorem isMaximal_comap_toCompletion (m : Ideal (completion K A)) [m.IsMaximal] :
    (m.comap (toCompletion K A)).IsMaximal ∧
      Function.Bijective (Ideal.quotientMap m (toCompletion K A) le_rfl) := sorry

/-- F1/dagger-completion-comparison (1): every maximal ideal of `A` is `τ⁻¹ m` for a unique maximal
ideal `m` of `Â`. -/
theorem existsUnique_isMaximal_comap_toCompletion (m' : Ideal A) (hm' : m'.IsMaximal) :
    ∃! m : Ideal (completion K A), m.IsMaximal ∧ m.comap (toCompletion K A) = m' := sorry

/-- F1/dagger-completion-comparison (3): `A` is reduced iff `Â` is. -/
theorem isReduced_iff_completion : IsReduced A ↔ IsReduced (completion K A) := sorry

/-- F1/dagger-completion-comparison (3): `A` is regular iff `Â` is. -/
theorem isRegularRing_iff_completion : IsRegularRing A ↔ IsRegularRing (completion K A) := sorry

/-- F1/dagger-completion-comparison: the completion of a morphism, `φ̂ : Â → B̂`. -/
def completionMap {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] {A B : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]
    [CommRing B] [Algebra K B] [IsDaggerAlgebra K B] (φ : A →ₐ[K] B) :
    completion K A →+* completion K B := sorry

/-- F1/dagger-completion-comparison: `φ̂` is the unique continuous extension of `φ`. -/
theorem completionMap_spec (φ : A →ₐ[K] B) :
    Continuous (completionMap φ) ∧
      (completionMap φ).comp (toCompletion K A) = (toCompletion K B).comp (φ : A →+* B) ∧
      ∀ ψ : completion K A →+* completion K B, Continuous ψ →
        ψ.comp (toCompletion K A) = (toCompletion K B).comp (φ : A →+* B) → ψ = completionMap φ :=
  sorry

/-- F1/dagger-completion-comparison: completion is a functor. -/
theorem completionMap_comp (φ : A →ₐ[K] B) (ψ : B →ₐ[K] C) :
    completionMap (ψ.comp φ) = (completionMap ψ).comp (completionMap φ) := sorry

end CompletionComparison

/-! ## AdicSpacesPartII:F1/dagger-weak-completeness (lemma) -/

section WeakCompleteness

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-weak-completeness (a): `A` is weakly complete: for `x₁, …, xₙ ∈ A^int` the map
`K[X] → A`, `Xᵢ ↦ xᵢ`, extends uniquely to a continuous `K`-algebra map `W_n → A`. -/
theorem weaklyComplete {n : ℕ} (x : Fin n → A) (hx : ∀ i, x i ∈ intSubring K A) :
    ∃! φ : washnitzerAlgebra n K →ₐ[K] A,
      @Continuous _ _ (affinoidTopology K (washnitzerAlgebra n K)) (affinoidTopology K A) φ ∧
        ∀ i, φ (washnitzerAlgebra.X n K i) = x i := sorry

/-- F1/dagger-weak-completeness (b): if `|a|_sup < 1` then `1 − a` is a unit. -/
theorem isUnit_one_sub_of_supNorm_lt_one {a : A} (ha : supNorm K A a < 1) : IsUnit (1 - a) :=
  sorry

end WeakCompleteness

/-! ## AdicSpacesPartII:F1/dagger-finite-extension (lemma) -/

section FiniteExtension

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-finite-extension (API `Dagger.IsDaggerAlgebra.of_finite` of F1/dagger-algebra): a
finite algebra over a dagger algebra is a dagger algebra. -/
theorem IsDaggerAlgebra.of_finite {B : Type*} [CommRing B] [Algebra K B] [Algebra A B]
    [IsScalarTower K A B] [Module.Finite A B] : IsDaggerAlgebra K B := sorry

end FiniteExtension

/-! ## AdicSpacesPartII:F1/dagger-finite-morphism-comparison (theorem) -/

section FiniteMorphism

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A B : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]
  [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]

/-- F1/dagger-finite-morphism-comparison (b): `φ` is finite iff `φ̂` is. -/
theorem finite_iff_finite_completion (φ : A →ₐ[K] B) :
    φ.toRingHom.Finite ↔ (completionMap φ).Finite := sorry

/-- F1/dagger-finite-morphism-comparison (a): `φ` is surjective iff `φ̂` is. -/
theorem surjective_iff_completion (φ : A →ₐ[K] B) :
    Function.Surjective φ ↔ Function.Surjective (completionMap φ) := sorry

/-- F1/dagger-finite-morphism-comparison (c): for finite `φ`, `φ` is injective iff `φ̂` is. -/
theorem injective_iff_completion_of_finite (φ : A →ₐ[K] B) (hφ : φ.toRingHom.Finite) :
    Function.Injective φ ↔ Function.Injective (completionMap φ) := sorry

end FiniteMorphism

/-! ## AdicSpacesPartII:F1/dagger-approximation (theorem) -/

section Approximation

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K]
  {A B : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]
  [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]

/-- F1/dagger-approximation (2), consequence: two dagger algebras with isomorphic completions are
isomorphic (non-canonically). -/
theorem exists_algEquiv_of_completion_algEquiv (e : completion K A ≃ₐ[K] completion K B) :
    Nonempty (A ≃ₐ[K] B) := sorry

end Approximation

/-! ## AdicSpacesPartII:F1/dagger-domain-and-integral-closure (lemma) -/

section DomainIntegralClosure

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-domain-and-integral-closure (1): a reduced dagger algebra is integrally closed in its
completion. -/
theorem isIntegrallyClosedIn_completion [IsReduced A] :
    letI := (toCompletion K A).toAlgebra
    IsIntegrallyClosedIn A (completion K A) := sorry

/-- F1/dagger-domain-and-integral-closure (2): `A` is a domain iff `Â` is. -/
theorem isDomain_iff_completion : IsDomain A ↔ IsDomain (completion K A) := sorry

end DomainIntegralClosure

/-! ## AdicSpacesPartII:F1/fringe-presentation (construction) -/

section Fringe

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
  (A : Type*) [CommRing A] [Algebra K A]

/-- F1/fringe-presentation (structure): a fringe presentation of `A`: `n`, a radius `ρ₀ ∈ Γ*` with
`ρ₀ > 1`, series `f₁, …, f_r ∈ T_n(ρ₀)` and a `K`-algebra isomorphism `W_n / (f) W_n ≅ A`. -/
structure FringePresentation where
  /-- The number of variables. -/
  n : ℕ
  /-- The outer radius `ρ₀`. -/
  ρ₀ : ℝ
  /-- `ρ₀ > 1`. -/
  one_lt : 1 < ρ₀
  /-- `ρ₀ ∈ Γ*`. -/
  mem_gammaStar : ρ₀ ∈ gammaStar K
  /-- The number of relations. -/
  r : ℕ
  /-- The relations `f₁, …, f_r`. -/
  f : Fin r → MvPowerSeries (Fin n) K
  /-- The relations converge on the polydisc of radius `ρ₀`. -/
  f_mem : ∀ i, f i ∈ radiusTate n K ρ₀
  /-- The presentation `W_n / (f) ≅ A`. -/
  equiv : (washnitzerAlgebra n K ⧸
    Ideal.span {g : washnitzerAlgebra n K | ∃ i, (g : MvPowerSeries (Fin n) K) = f i}) ≃ₐ[K] A

variable {K A}

namespace FringePresentation

variable (P : FringePresentation K A)

/-- F1/fringe-presentation: the admissible radii `ρ ∈ Γ* ∩ (1, ρ₀]`. -/
def Radius : Type := {ρ : ℝ // 1 < ρ ∧ ρ ≤ P.ρ₀ ∧ ρ ∈ gammaStar K}

/-- F1/fringe-presentation (data): the stage `A_ρ = T_n(ρ) / (f) T_n(ρ)`, a `K`-affinoid algebra. -/
abbrev stage (ρ : P.Radius) : Type _ :=
  radiusTate P.n K ρ.1 ⧸
    Ideal.span {g : radiusTate P.n K ρ.1 | ∃ i, (g : MvPowerSeries (Fin P.n) K) = P.f i}

/-- F1/fringe-presentation: the Banach topology of the stage `A_ρ`, the quotient of the Gauss-norm
topology of `T_n(ρ)`. -/
abbrev stageTopology (ρ : P.Radius) : TopologicalSpace (P.stage ρ) :=
  (radiusTate.topology P.n K ρ.1).coinduced (Ideal.Quotient.mk _)

/-- F1/fringe-presentation (functoriality): the transition map `A_{ρ'} → A_ρ` for `ρ ≤ ρ'`, induced
by `T_n(ρ') ⊆ T_n(ρ)`. -/
def transition (ρ ρ' : P.Radius) (h : ρ.1 ≤ ρ'.1) : P.stage ρ' →ₐ[K] P.stage ρ := sorry

/-- F1/fringe-presentation: the transitions compose. -/
theorem transition_comp (ρ ρ' ρ'' : P.Radius) (h : ρ.1 ≤ ρ'.1) (h' : ρ'.1 ≤ ρ''.1) :
    (P.transition ρ ρ' h).comp (P.transition ρ' ρ'' h') = P.transition ρ ρ'' (h.trans h') := sorry

/-- F1/fringe-presentation (projection): the map `A_ρ → A`. -/
def toDagger (ρ : P.Radius) : P.stage ρ →ₐ[K] A := sorry

/-- F1/fringe-presentation: the maps `A_ρ → A` are compatible with the transitions. -/
theorem toDagger_comp_transition (ρ ρ' : P.Radius) (h : ρ.1 ≤ ρ'.1) :
    (P.toDagger ρ).comp (P.transition ρ ρ' h) = P.toDagger ρ' := sorry

/-- F1/fringe-presentation (universal property): `A = colim_{ρ → 1⁺} A_ρ` as `K`-algebras. -/
theorem isColimit {C : Type*} [CommRing C] [Algebra K C] (u : ∀ ρ : P.Radius, P.stage ρ →ₐ[K] C)
    (hu : ∀ (ρ ρ' : P.Radius) (h : ρ.1 ≤ ρ'.1), (u ρ).comp (P.transition ρ ρ' h) = u ρ') :
    ∃! v : A →ₐ[K] C, ∀ ρ, v.comp (P.toDagger ρ) = u ρ := sorry

/-- F1/fringe-presentation (data): the fringe algebra `B_ρ ⊆ A`, the image of `A_ρ`. -/
def fringeAlgebra (ρ : P.Radius) : Subalgebra K A := (P.toDagger ρ).range

/-- F1/fringe-presentation (compatibility): the stage at radius one, `T_n / (f) T_n`, is the
completion `Â`. -/
theorem stage_one_eq_completion [CompleteSpace K] [NonarchimedeanRing K] [IsDaggerAlgebra K A] :
    Nonempty ((radiusTate P.n K 1 ⧸
      Ideal.span {g : radiusTate P.n K 1 | ∃ i, (g : MvPowerSeries (Fin P.n) K) = P.f i}) ≃ₐ[K]
        completion K A) := sorry

-- Dagger.FringePresentation.isWeierstrassDomain: not stated here; needs the stages `A_ρ` as Tau
--   Ceti Huber pairs `(A_ρ, A_ρ°)` with their rational localisations (the stages carry only their
--   Gauss-norm topology here) (supplier: AdicSpacesPartII:F1/radius-tate-algebra-affinoid)

/-- F1/fringe-presentation (compatibility): for reduced `A`, `A⁺ = colim_ρ (A_ρ)°` makes
`(A, A⁺)` a Huber pair for the affinoid topology. -/
theorem plusColimit [CompleteSpace K] [IsDaggerAlgebra K A] [IsReduced A] :
    letI := affinoidTopology K A
    ∃ (_ : IsTopologicalRing A) (_ : Huber.IsHuberRing A) (S : Huber.Pair A),
      (S.plus : Set A) = ⋃ ρ : P.Radius,
        P.toDagger ρ '' {x | letI := P.stageTopology ρ; Huber.IsPowerBounded x} := sorry

/-- F1/fringe-presentation (equivalence): two fringe presentations of `A` give cofinal
ind-systems: every stage of one maps to a stage of the other over `A`. -/
theorem cofinal (Q : FringePresentation K A) (ρ : P.Radius) :
    ∃ (ρ' : Q.Radius) (ψ : P.stage ρ →ₐ[K] Q.stage ρ'), (Q.toDagger ρ').comp ψ = P.toDagger ρ :=
  sorry

end FringePresentation

/-- F1/fringe-presentation (constructor): every dagger algebra has a fringe presentation. -/
theorem FringePresentation.exists [CompleteSpace K] [IsDaggerAlgebra K A] :
    Nonempty (FringePresentation K A) := sorry

-- test FringePresentation_test_washnitzer (computation) [F1/fringe-presentation]
example (n : ℕ) (P : FringePresentation K (washnitzerAlgebra n K)) (hP : P.n = n) (hr : P.r = 0)
    (ρ : P.Radius) : Nonempty (P.stage ρ ≃ₐ[K] radiusTate n K ρ.1) := sorry

-- test FringePresentation_test_field (degenerate) [F1/fringe-presentation]
example (P : FringePresentation K K) (hP : P.n = 0) (ρ : P.Radius) :
    Function.Bijective (P.toDagger ρ) := sorry

/- `A = W_1`, presented by `W_2 → W_1`, `X₁ ↦ X`, `X₂ ↦ g`, `g = ∑ πᵐ X^{2m} = 1/(1 − πX²)`
(relation `(1 − πX₁²)X₂ − 1`): at a radius `ρ ∈ (|π|^{-1/2}, |π|^{-1})` its fringe algebra
contains `g`, which is not in `T_1(ρ)`, the fringe algebra of the identity presentation. -/
-- test FringePresentation_test_dependence (non-example) [F1/fringe-presentation]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) (g : washnitzerAlgebra 1 K)
    (hg : (g : MvPowerSeries (Fin 1) K) = fun ν ↦ if Even (ν 0) then π ^ (ν 0 / 2) else 0) :
    ∃ P : FringePresentation K (washnitzerAlgebra 1 K), P.n = 2 ∧
      ∀ ρ : P.Radius, Real.sqrt ‖π‖⁻¹ < ρ.1 → ρ.1 < ‖π‖⁻¹ →
        g ∈ P.fringeAlgebra ρ ∧ (g : MvPowerSeries (Fin 1) K) ∉ radiusTate 1 K ρ.1 := sorry

-- test FringePresentation_test_completion (compatibility) [F1/fringe-presentation]
example [CompleteSpace K] [NonarchimedeanRing K] [IsDaggerAlgebra K A]
    (P : FringePresentation K A) :
    Nonempty ((radiusTate P.n K 1 ⧸
      Ideal.span {g : radiusTate P.n K 1 | ∃ i, (g : MvPowerSeries (Fin P.n) K) = P.f i}) ≃ₐ[K]
        completion K A) := sorry

/- For `A = W_2/(X₁X₂ − 1)` presented by the relation `X₁X₂ − 1` itself, the stage `A_ρ` is
`T_2(ρ)/(X₁X₂ − 1)`, the ring of the annulus `ρ⁻¹ ≤ |X| ≤ ρ`. -/
-- test FringePresentation_test_annulus (computation) [F1/fringe-presentation]
example : ∃ P : FringePresentation K
      (washnitzerAlgebra 2 K ⧸
        Ideal.span {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1}),
    ∃ h : P.n = 2, ∀ ρ : P.Radius, Nonempty (P.stage ρ ≃ₐ[K] (radiusTate 2 K ρ.1 ⧸
      Ideal.span {g : radiusTate 2 K ρ.1 | (g : MvPowerSeries (Fin 2) K) =
        MvPowerSeries.X 0 * MvPowerSeries.X 1 - 1})) := sorry

end Fringe

/-! ## AdicSpacesPartII:F1/fringe-morphism-factorisation (lemma) -/

section FringeMorphism

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  {A B : Type*} [CommRing A] [Algebra K A] [CommRing B] [Algebra K B]

/-- F1/fringe-morphism-factorisation (API `Dagger.FringePresentation.exists_le_map` of
F1/fringe-presentation): for `φ : A → B` and fringe presentations of `A` and `B`, every composite
`A_ρ → A → B` factors through some stage `B_{ρ'} → B`. -/
theorem FringePresentation.exists_le_map (P : FringePresentation K A) (Q : FringePresentation K B)
    (φ : A →ₐ[K] B) (ρ : P.Radius) :
    ∃ (ρ' : Q.Radius) (ψ : P.stage ρ →ₐ[K] Q.stage ρ'),
      (Q.toDagger ρ').comp ψ = φ.comp (P.toDagger ρ) := sorry

/-- F1/fringe-morphism-factorisation: every fringe algebra of `A` maps into a fringe algebra of
`B`. -/
theorem FringePresentation.exists_map_fringeAlgebra_le (P : FringePresentation K A)
    (Q : FringePresentation K B) (φ : A →ₐ[K] B) (ρ : P.Radius) :
    ∃ ρ' : Q.Radius, (P.fringeAlgebra ρ).map φ ≤ Q.fringeAlgebra ρ' := sorry

end FringeMorphism

/-! ## AdicSpacesPartII:F1/fringe-topology (construction) -/

section FringeTopology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/fringe-topology: the fringe topology of a fringe presentation `P`: the finest locally
`K`-convex topology on `A` making every `A_ρ → A` continuous. -/
abbrev FringePresentation.topology (P : FringePresentation K A) : TopologicalSpace A := sorry

/-- F1/fringe-topology (data): the fringe topology of `A`, that of a chosen fringe presentation
(independent of it, `fringeTopology_independent`). -/
abbrev fringeTopology : TopologicalSpace A :=
  (Classical.choice (FringePresentation.exists (K := K) (A := A))).topology

/-- F1/fringe-topology (data): the fringe topology on a finite `A`-module, the quotient topology of
`A^r ↠ M`; independent of the surjection. -/
abbrev moduleFringeTopology (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] : TopologicalSpace M := sorry

variable {K A}

/-- F1/fringe-topology (characterisation): the fringe topologies of two fringe presentations
coincide. -/
theorem fringeTopology_independent (P Q : FringePresentation K A) : P.topology = Q.topology :=
  sorry

/-- F1/fringe-topology (functoriality): every `K`-algebra map of dagger algebras is continuous for
the fringe topologies. -/
theorem continuous_of_fringe {B : Type*} [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]
    (φ : A →ₐ[K] B) : @Continuous A B (fringeTopology K A) (fringeTopology K B) φ := sorry

/-- F1/fringe-topology (relation): the fringe topology is Hausdorff and finer than the affinoid
topology. -/
theorem fringeTopology_le_affinoid :
    fringeTopology K A ≤ affinoidTopology K A ∧ @T2Space A (fringeTopology K A) := sorry

/-- F1/fringe-topology (instance): `A` with the fringe topology is a topological ring. -/
theorem fringeTopology.isTopologicalRing : @IsTopologicalRing A (fringeTopology K A) _ := sorry

/-- F1/fringe-topology (instance): over a spherically complete `K` (every decreasing sequence of
closed balls has nonempty intersection), `A` is complete for the fringe topology. -/
theorem fringeTopology.completeSpace
    (hK : ∀ (c : ℕ → K) (r : ℕ → ℝ), Antitone (fun i ↦ Metric.closedBall (c i) (r i)) →
      (⋂ i, Metric.closedBall (c i) (r i)).Nonempty) :
    letI := fringeTopology K A
    haveI : IsTopologicalRing A := fringeTopology.isTopologicalRing
    @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A) := sorry

/-- F1/fringe-topology (projection): each stage map `A_ρ → A` is continuous for the fringe
topology. -/
theorem fringeTopology.continuous_stage (P : FringePresentation K A) (ρ : P.Radius) :
    @Continuous _ _ (P.stageTopology ρ) (fringeTopology K A) (P.toDagger ρ) := sorry

-- test fringeTopology_test_field (degenerate) [F1/fringe-topology]
example : fringeTopology K K = (inferInstance : TopologicalSpace K) := sorry

/- Over `ℚ_p` the partial sums of `∑ pᵐ X^{pᵐ}` are Gauss-norm Cauchy in `W_1` but not Cauchy for
the fringe topology. -/
-- test fringeTopology_test_not_affinoid (non-example) [F1/fringe-topology]
example (p : ℕ) [Fact p.Prime] :
    let u : ℕ → washnitzerAlgebra 1 ℚ_[p] := fun N ↦
      ∑ m ∈ Finset.range (N + 1), (p : washnitzerAlgebra 1 ℚ_[p]) ^ m *
        washnitzerAlgebra.X 1 ℚ_[p] 0 ^ (p ^ m)
    (∀ ε > 0, ∃ N, ∀ i ≥ N, ∀ j ≥ N,
        unitGaussNorm 1 ℚ_[p] ((u i : MvPowerSeries (Fin 1) ℚ_[p]) - u j) < ε) ∧
      letI := fringeTopology ℚ_[p] (washnitzerAlgebra 1 ℚ_[p])
      haveI : IsTopologicalRing (washnitzerAlgebra 1 ℚ_[p]) := fringeTopology.isTopologicalRing
      ¬ @Cauchy _ (IsTopologicalAddGroup.rightUniformSpace (washnitzerAlgebra 1 ℚ_[p]))
        (atTop.map u) := sorry

/- For `f ∈ T_1(ρ)`, `ρ > 1`, the truncations of `f` converge to `f` in the fringe topology of
`W_1`. -/
-- test fringeTopology_test_restriction (computation) [F1/fringe-topology]
example {ρ : ℝ} (hρ : 1 < ρ) (f : washnitzerAlgebra 1 K)
    (hf : (f : MvPowerSeries (Fin 1) K) ∈ radiusTate 1 K ρ) :
    @Tendsto ℕ _ (fun N ↦ MvPolynomial.aeval (washnitzerAlgebra.X 1 K)
        (MvPowerSeries.trunc K (Finsupp.single 0 N) (f : MvPowerSeries (Fin 1) K))) atTop
      (@nhds _ (fringeTopology K (washnitzerAlgebra 1 K)) f) := sorry

-- test fringeTopology_test_compat (compatibility) [F1/fringe-topology]
example (n : ℕ) {ρ : ℝ} (hρ : 1 < ρ) :
    @Continuous _ _ (radiusTate.topology n K ρ) (fringeTopology K (washnitzerAlgebra n K))
      (Subalgebra.inclusion (radiusTate_le_washnitzerAlgebra hρ)) ∧
    @Continuous _ _ (fringeTopology K (washnitzerAlgebra n K)) (radiusTate.topology n K 1)
      (Subalgebra.inclusion (washnitzerAlgebra_le_radiusTate_one (n := n) (K := K))) := sorry

end FringeTopology

/-! ## AdicSpacesPartII:F1/fringe-module-descent (lemma) -/

section FringeModuleDescent

open TensorProduct

universe u

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type u} [CommRing A] [Algebra K A]

/-- F1/fringe-module-descent (1): every finite `A`-module descends to a finite module over some
stage `A_ρ` of a fringe presentation: `M ≅ A ⊗_{A_ρ} M_ρ`. -/
theorem FringePresentation.exists_module_descent (P : FringePresentation K A) (M : Type u)
    [AddCommGroup M] [Module A M] [Module.Finite A M] :
    ∃ (ρ : P.Radius) (Mρ : Type u) (_ : AddCommGroup Mρ) (_ : Module (P.stage ρ) Mρ),
      Module.Finite (P.stage ρ) Mρ ∧
        letI : Algebra (P.stage ρ) A := RingHom.toAlgebra (P.toDagger ρ)
        Nonempty ((A ⊗[P.stage ρ] Mρ) ≃ₗ[A] M) := sorry

end FringeModuleDescent

/-! ## AdicSpacesPartII:F1/dagger-tensor-product (construction) -/

section Tensor

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  {B A₁ A₂ : Type*} [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]
  [CommRing A₁] [Algebra K A₁] [IsDaggerAlgebra K A₁]
  [CommRing A₂] [Algebra K A₂] [IsDaggerAlgebra K A₂]

/-- F1/dagger-tensor-product: the ideal of `W_{n₁+n₂} = K⟨X, Y⟩†` (chosen presentations
`W_{nᵢ} ↠ Aᵢ`) that is the kernel of `W_{n₁+n₂} → Â₁ ⊗̂_{B̂} Â₂`, `Xᵢ ↦ Xᵢ ⊗ 1`, `Yⱼ ↦ 1 ⊗ Yⱼ`;
equivalently the ideal generated by the two presentation ideals and the relations
`α₁(b) ⊗ 1 = 1 ⊗ α₂(b)`. -/
def tensorIdeal (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) :
    Ideal (washnitzerAlgebra (presentationDim K A₁ + presentationDim K A₂) K) := sorry

/-- F1/dagger-tensor-product (data): the dagger tensor product `A₁ ⊗†_B A₂`, the image of
`W_{n₁+n₂}` in `Â₁ ⊗̂_{B̂} Â₂`, a dagger algebra (a quotient of `W_{n₁+n₂}`). -/
def tensor (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : Type _ :=
  washnitzerAlgebra (presentationDim K A₁ + presentationDim K A₂) K ⧸ tensorIdeal α₁ α₂

/-- F1/dagger-tensor-product (instance): `CommRing (tensor α₁ α₂)`. -/
instance (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : CommRing (tensor α₁ α₂) :=
  inferInstanceAs (CommRing (washnitzerAlgebra _ K ⧸ tensorIdeal α₁ α₂))

/-- F1/dagger-tensor-product (instance): `Algebra K (tensor α₁ α₂)`. -/
instance (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : Algebra K (tensor α₁ α₂) :=
  inferInstanceAs (Algebra K (washnitzerAlgebra _ K ⧸ tensorIdeal α₁ α₂))

/-- F1/dagger-tensor-product (instance): `IsDaggerAlgebra K (tensor α₁ α₂)`. -/
instance (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : IsDaggerAlgebra K (tensor α₁ α₂) :=
  inferInstanceAs (IsDaggerAlgebra K (washnitzerAlgebra _ K ⧸ tensorIdeal α₁ α₂))

/-- F1/dagger-tensor-product: the first inclusion `ι₁ : A₁ → A₁ ⊗†_B A₂`. -/
def tensor.inl (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : A₁ →ₐ[K] tensor α₁ α₂ := sorry

/-- F1/dagger-tensor-product: the second inclusion `ι₂ : A₂ → A₁ ⊗†_B A₂`. -/
def tensor.inr (α₁ : B →ₐ[K] A₁) (α₂ : B →ₐ[K] A₂) : A₂ →ₐ[K] tensor α₁ α₂ := sorry

variable {α₁ : B →ₐ[K] A₁} {α₂ : B →ₐ[K] A₂}

/-- F1/dagger-tensor-product (universal property): the pushout property in dagger algebras: maps
`uᵢ : Aᵢ → C` with `u₁ α₁ = u₂ α₂` induce `A₁ ⊗†_B A₂ → C`. -/
def tensor.lift {C : Type*} [CommRing C] [Algebra K C] [IsDaggerAlgebra K C] (u₁ : A₁ →ₐ[K] C)
    (u₂ : A₂ →ₐ[K] C) (h : u₁.comp α₁ = u₂.comp α₂) : tensor α₁ α₂ →ₐ[K] C := sorry

/-- F1/dagger-tensor-product (universal property): `lift u₁ u₂ ∘ ι₁ = u₁` and
`lift u₁ u₂ ∘ ι₂ = u₂`. -/
theorem tensor.lift_comp_inl {C : Type*} [CommRing C] [Algebra K C] [IsDaggerAlgebra K C]
    (u₁ : A₁ →ₐ[K] C) (u₂ : A₂ →ₐ[K] C) (h : u₁.comp α₁ = u₂.comp α₂) :
    (tensor.lift u₁ u₂ h).comp (tensor.inl α₁ α₂) = u₁ ∧
      (tensor.lift u₁ u₂ h).comp (tensor.inr α₁ α₂) = u₂ := sorry

/-- F1/dagger-tensor-product (extensionality): maps out of `A₁ ⊗†_B A₂` agreeing on `ι₁` and `ι₂`
are equal. -/
theorem tensor.hom_ext {C : Type*} [CommRing C] [Algebra K C] {f g : tensor α₁ α₂ →ₐ[K] C}
    (h₁ : f.comp (tensor.inl α₁ α₂) = g.comp (tensor.inl α₁ α₂))
    (h₂ : f.comp (tensor.inr α₁ α₂) = g.comp (tensor.inr α₁ α₂)) : f = g := sorry

-- Dagger.tensor.completion: not stated here; needs the completed tensor product `Â₁ ⊗̂_{B̂} Â₂` of
--   affinoid algebras (supplier: AdicSpacesPartII:R0/completed-tensor-product)

/-- F1/dagger-tensor-product (compatibility): if `A₂` is finite over `B`, then
`A₁ ⊗†_B A₂ = A₁ ⊗_B A₂`. -/
theorem tensor.eq_tensorProduct_of_finite (hfin : α₂.toRingHom.Finite) :
    letI := α₁.toRingHom.toAlgebra
    letI := α₂.toRingHom.toAlgebra
    Nonempty (tensor α₁ α₂ ≃+* TensorProduct B A₁ A₂) := sorry

-- Dagger.tensor.eq_colim_fringe: not stated here; needs the completed tensor products
--   `B₁ ⊗̂_K B₂` of the fringe algebras (supplier: AdicSpacesPartII:R0/completed-tensor-product)

/-- F1/dagger-tensor-product (example): `W_n ⊗†_K W_m ≅ W_{n+m}`. -/
theorem tensor.washnitzer [CompleteSpace K] (n m : ℕ) :
    Nonempty (tensor (Algebra.ofId K (washnitzerAlgebra n K))
      (Algebra.ofId K (washnitzerAlgebra m K))
      ≃ₐ[K] washnitzerAlgebra (n + m) K) := sorry

/-- F1/dagger-tensor-product (functoriality): a morphism of diagrams `(B → Aᵢ) → (B' → A'ᵢ)`
induces `A₁ ⊗†_B A₂ → A'₁ ⊗†_{B'} A'₂`. -/
def tensor.map {B' A₁' A₂' : Type*} [CommRing B'] [Algebra K B'] [IsDaggerAlgebra K B']
    [CommRing A₁'] [Algebra K A₁'] [IsDaggerAlgebra K A₁']
    [CommRing A₂'] [Algebra K A₂'] [IsDaggerAlgebra K A₂']
    {α₁' : B' →ₐ[K] A₁'} {α₂' : B' →ₐ[K] A₂'} (β : B →ₐ[K] B') (γ₁ : A₁ →ₐ[K] A₁')
    (γ₂ : A₂ →ₐ[K] A₂') (h₁ : γ₁.comp α₁ = α₁'.comp β) (h₂ : γ₂.comp α₂ = α₂'.comp β) :
    tensor α₁ α₂ →ₐ[K] tensor α₁' α₂' := sorry

end Tensor

section RelTate

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- F1/dagger-tensor-product: `K⟨r⁻¹Z₁, …, r⁻¹Z_m⟩† = ⋃_{ρ > r} T_m(ρ)`, the overconvergent
functions on the closed polydisc of radius `r`. -/
def overconvergentDisc (m : ℕ) (r : ℝ) : Subalgebra K (MvPowerSeries (Fin m) K) :=
  ⨆ ρ : {ρ : ℝ // r < ρ}, radiusTate m K ρ

/-- F1/dagger-tensor-product: the variable `Zᵢ ∈ K⟨r⁻¹Z⟩†`. -/
def overconvergentDisc.Z {m : ℕ} {r : ℝ} (i : Fin m) : overconvergentDisc K m r :=
  ⟨MvPowerSeries.X i, sorry⟩

variable {K}

/-- F1/dagger-tensor-product: `1 ∈ Γ*`. -/
theorem one_mem_gammaStar : (1 : ℝ) ∈ gammaStar K := sorry

/-- F1/dagger-tensor-product (instance): `1 ∈ gammaStar K`, as a `Fact`. -/
instance : Fact ((1 : ℝ) ∈ gammaStar K) := ⟨one_mem_gammaStar⟩

/-- F1/dagger-tensor-product: for `r ∈ Γ*`, `K⟨r⁻¹Z⟩†` is a dagger algebra. -/
instance isDaggerAlgebra_overconvergentDisc {m : ℕ} {r : ℝ} [Fact (r ∈ gammaStar K)] :
    IsDaggerAlgebra K (overconvergentDisc K m r) := sorry

variable (K) (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-tensor-product (data): the relative overconvergent polydisc algebra
`A⟨r⁻¹Z₁, …, r⁻¹Z_m⟩† = A ⊗†_K K⟨r⁻¹Z⟩†`, `r ∈ Γ*`. -/
abbrev relTate (m : ℕ) (r : ℝ) [Fact (r ∈ gammaStar K)] : Type _ :=
  tensor (Algebra.ofId K A) (Algebra.ofId K (overconvergentDisc K m r))

/-- F1/dagger-tensor-product: `A → A⟨Z⟩†`. -/
abbrev relTate.inl (m : ℕ) : A →ₐ[K] relTate K A m 1 :=
  tensor.inl _ _

/-- F1/dagger-tensor-product: the variable `Zᵢ ∈ A⟨Z⟩†`. -/
abbrev relTate.Z {m : ℕ} (i : Fin m) : relTate K A m 1 :=
  tensor.inr (Algebra.ofId K A) (Algebra.ofId K (overconvergentDisc K m 1))
    (overconvergentDisc.Z K i)

end RelTate

section TensorTests

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

-- test tensor_test_washnitzer (computation) [F1/dagger-tensor-product]
example : ∃ e : tensor (Algebra.ofId K (washnitzerAlgebra 1 K))
      (Algebra.ofId K (washnitzerAlgebra 1 K))
      ≃ₐ[K] washnitzerAlgebra 2 K,
    e (tensor.inl _ _ (washnitzerAlgebra.X 1 K 0)) = washnitzerAlgebra.X 2 K 0 ∧
      e (tensor.inr _ _ (washnitzerAlgebra.X 1 K 0)) = washnitzerAlgebra.X 2 K 1 := sorry

-- test tensor_test_base (degenerate) [F1/dagger-tensor-product]
example : Nonempty (tensor (AlgHom.id K A) (AlgHom.id K A) ≃ₐ[K] A) ∧
    Nonempty (tensor (Algebra.ofId K A) (Algebra.ofId K K) ≃ₐ[K] A) := sorry

/- `f = ∑_ν π^ν X^{ν²} Z^ν`: each coefficient `a_ν = π^ν X^{ν²} ∈ W_1` has `|a_ν| ρ^ν → 0` for
`ρ < |π|⁻¹`, but `f ∉ K⟨X, Z⟩† = W_1⟨Z⟩†`; so "`A⟨Z⟩†` = series with `|a_ν| ρ^ν → 0` for some
`ρ > 1`" is the wrong definition. -/
-- test tensor_test_not_naive (non-example) [F1/dagger-tensor-product]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    (fun ν : Fin 2 →₀ ℕ ↦ if ν 0 = ν 1 ^ 2 then π ^ ν 1 else 0 : MvPowerSeries (Fin 2) K) ∉
        washnitzerAlgebra 2 K ∧
      ∀ ρ : ℝ, 0 < ρ → ρ < ‖π‖⁻¹ → Tendsto (fun k : ℕ ↦
        unitGaussNorm 1 K (fun μ ↦ if μ 0 = k ^ 2 then π ^ k else 0) * ρ ^ k) atTop (𝓝 0) := sorry

-- test tensor_test_completion (compatibility) [F1/dagger-tensor-product]
example [NonarchimedeanRing K] :
    Nonempty (completion K (tensor (Algebra.ofId K (washnitzerAlgebra 1 K))
      (Algebra.ofId K (washnitzerAlgebra 1 K))) ≃ₐ[K]
        Huber.restrictedMvPowerSeriesCompletion 2 K) :=
  sorry

-- test tensor_test_finite (characterisation) [F1/dagger-tensor-product]
example (n : ℕ) (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L] [IsDaggerAlgebra K L] :
    Nonempty (tensor (Algebra.ofId K (washnitzerAlgebra n K)) (Algebra.ofId K L) ≃ₐ[K]
      TensorProduct K (washnitzerAlgebra n K) L) := sorry

end TensorTests

/-! ## AdicSpacesPartII:F1/dagger-rational-localisation (construction) -/

section Rational

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-rational-localisation: the ideal `(g Zᵢ − fᵢ)ᵢ` of `A⟨Z₁, …, Z_m⟩†`. -/
def rationalIdeal {m : ℕ} (f : Fin m → A) (g : A) : Ideal (relTate K A m 1) :=
  Ideal.span (Set.range fun i ↦ relTate.inl K A m g * relTate.Z K A i - relTate.inl K A m (f i))

/-- F1/dagger-rational-localisation (data): `A⟨f/g⟩† = A⟨Z₁, …, Z_m⟩† / (g Zᵢ − fᵢ)`; it is the
rational localisation when `g, f₁, …, f_m` generate the unit ideal. -/
def rationalLocalization {m : ℕ} (f : Fin m → A) (g : A) : Type _ :=
  relTate K A m 1 ⧸ rationalIdeal K A f g

/-- F1/dagger-rational-localisation (instance): `CommRing (rationalLocalization K A f g)`. -/
instance {m : ℕ} (f : Fin m → A) (g : A) : CommRing (rationalLocalization K A f g) :=
  inferInstanceAs (CommRing (relTate K A m 1 ⧸ rationalIdeal K A f g))

/-- F1/dagger-rational-localisation (instance): `Algebra K (rationalLocalization K A f g)`. -/
instance {m : ℕ} (f : Fin m → A) (g : A) : Algebra K (rationalLocalization K A f g) :=
  inferInstanceAs (Algebra K (relTate K A m 1 ⧸ rationalIdeal K A f g))

/-- F1/dagger-rational-localisation (instance):
`IsDaggerAlgebra K (rationalLocalization K A f g)`. -/
instance {m : ℕ} (f : Fin m → A) (g : A) : IsDaggerAlgebra K (rationalLocalization K A f g) :=
  inferInstanceAs (IsDaggerAlgebra K (relTate K A m 1 ⧸ rationalIdeal K A f g))

/-- F1/dagger-rational-localisation: the ideal `(f Z − 1)` of `A⟨Z⟩†`. -/
def laurentIdeal (f : A) : Ideal (relTate K A 1 1) :=
  Ideal.span {relTate.inl K A 1 f * relTate.Z K A 0 - 1}

/-- F1/dagger-rational-localisation (example): the Laurent localisation
`A⟨f⁻¹⟩† = A⟨Z⟩† / (f Z − 1)`. -/
def laurentLocalization (f : A) : Type _ :=
  relTate K A 1 1 ⧸ laurentIdeal K A f

/-- F1/dagger-rational-localisation (instance): `CommRing (laurentLocalization K A f)`. -/
instance (f : A) : CommRing (laurentLocalization K A f) :=
  inferInstanceAs (CommRing (relTate K A 1 1 ⧸ laurentIdeal K A f))

/-- F1/dagger-rational-localisation (instance): `Algebra K (laurentLocalization K A f)`. -/
instance (f : A) : Algebra K (laurentLocalization K A f) :=
  inferInstanceAs (Algebra K (relTate K A 1 1 ⧸ laurentIdeal K A f))

/-- F1/dagger-rational-localisation (instance): `IsDaggerAlgebra K (laurentLocalization K A f)`. -/
instance (f : A) : IsDaggerAlgebra K (laurentLocalization K A f) :=
  inferInstanceAs (IsDaggerAlgebra K (relTate K A 1 1 ⧸ laurentIdeal K A f))

/-- F1/dagger-rational-localisation: the structure map `A → A⟨f⁻¹⟩†`. -/
def laurentLocalization.algebraMap (f : A) : A →ₐ[K] laurentLocalization K A f :=
  (Ideal.Quotient.mkₐ K (laurentIdeal K A f)).comp (relTate.inl K A 1)

/-- F1/dagger-rational-localisation (projection): the structure map `A → A⟨f/g⟩†`; `g` becomes a
unit and `fᵢ/g ↦ Zᵢ`. -/
def rationalLocalization.algebraMap {m : ℕ} (f : Fin m → A) (g : A) :
    A →ₐ[K] rationalLocalization K A f g :=
  (Ideal.Quotient.mkₐ K (rationalIdeal K A f g)).comp (relTate.inl K A m)

variable {K A}

/-- F1/dagger-rational-localisation: the rational subdomain
`R(f/g) = {x ∈ Sp A : |fᵢ(x)| ≤ |g(x)| for all i}`. -/
def rationalDomain (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [Algebra K A]
    {m : ℕ} (f : Fin m → A) (g : A) : Set (MaximalSpectrum A) :=
  {x | ∀ i, pointNorm K A x (f i) ≤ pointNorm K A x g}

/-- F1/dagger-rational-localisation (universal property): a morphism `φ : A → C` of dagger algebras
with `Sp(φ) ⊆ R(f/g)` factors through `A⟨f/g⟩†`. -/
def rationalLocalization.lift {m : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) {C : Type*} [CommRing C] [Algebra K C]
    [IsDaggerAlgebra K C] (φ : A →ₐ[K] C)
    (hφ : ∀ y : MaximalSpectrum C, ∀ i, pointNorm K C y (φ (f i)) ≤ pointNorm K C y (φ g)) :
    rationalLocalization K A f g →ₐ[K] C := sorry

/-- F1/dagger-rational-localisation (universal property): `lift φ ∘ algebraMap = φ`, and the lift
is unique. -/
theorem rationalLocalization.lift_comp_algebraMap {m : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) {C : Type*} [CommRing C] [Algebra K C]
    [IsDaggerAlgebra K C] (φ : A →ₐ[K] C)
    (hφ : ∀ y : MaximalSpectrum C, ∀ i, pointNorm K C y (φ (f i)) ≤ pointNorm K C y (φ g)) :
    (rationalLocalization.lift hfg φ hφ).comp (rationalLocalization.algebraMap K A f g) = φ ∧
      ∀ ψ : rationalLocalization K A f g →ₐ[K] C,
        ψ.comp (rationalLocalization.algebraMap K A f g) = φ →
          ψ = rationalLocalization.lift hfg φ hφ :=
  sorry

open scoped Classical in
/-- F1/dagger-rational-localisation (compatibility): the completion of `A⟨f/g⟩†` is the Tau Ceti
rational localisation `Â⟨f/g⟩` (`TauCeti.Huber.PairOfDefinition.completionLocalization`, with
`T = {fᵢ}`, `s = g`). -/
theorem rationalLocalization.completion [CompleteSpace K] [NonarchimedeanRing K] {m : ℕ}
    {f : Fin m → A} {g : A} (hfg : Ideal.span (insert g (Set.range f)) = ⊤) :
    ∃ (P : Huber.PairOfDefinition (completion K A))
      (hden : P.HasDenominatorPower (Finset.univ.image fun i ↦ toCompletion K A (f i))
        (toCompletion K A g) (Localization.Away (toCompletion K A g))),
      Nonempty (completion K (rationalLocalization K A f g) ≃+*
        (letI := Huber.PairOfDefinition.locUniformSpace P _ _ _ hden
        UniformSpace.Completion (Localization.Away (toCompletion K A g)))) := sorry

/-- F1/dagger-rational-localisation (characterisation): `Sp(A⟨f/g⟩†) → Sp(A)` is a bijection onto
`R(f/g)`. -/
theorem rationalLocalization.maximalSpectrum [CompleteSpace K] {m : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) :
    (∀ M : Ideal (rationalLocalization K A f g), M.IsMaximal →
        ∃ x ∈ rationalDomain K f g, x.asIdeal = M.comap (rationalLocalization.algebraMap K A f g)) ∧
      ∀ x ∈ rationalDomain K f g, ∃! M : Ideal (rationalLocalization K A f g),
        M.IsMaximal ∧ M.comap (rationalLocalization.algebraMap K A f g) = x.asIdeal := sorry

/-- F1/dagger-rational-localisation (equivalence): `A⟨f/g⟩†` depends only on `R(f/g)`. -/
theorem rationalLocalization.congr [CompleteSpace K] {m m' : ℕ} {f : Fin m → A} {g : A}
    {f' : Fin m' → A} {g' : A} (hfg : Ideal.span (insert g (Set.range f)) = ⊤)
    (hfg' : Ideal.span (insert g' (Set.range f')) = ⊤)
    (h : rationalDomain K f g = rationalDomain K f' g') :
    ∃ e : rationalLocalization K A f g ≃ₐ[K] rationalLocalization K A f' g',
      (e : rationalLocalization K A f g →ₐ[K] _).comp (rationalLocalization.algebraMap K A f g) =
        rationalLocalization.algebraMap K A f' g' := sorry

/-- F1/dagger-rational-localisation (other): `A → A⟨f/g⟩†` is flat. -/
theorem rationalLocalization.flat [CompleteSpace K] {m : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) :
    letI := (rationalLocalization.algebraMap K A f g).toRingHom.toAlgebra
    Module.Flat A (rationalLocalization K A f g) := sorry

/-- F1/dagger-rational-localisation (functoriality): a rational subdomain of a rational subdomain is
rational: `A⟨f/g⟩†⟨f'/g'⟩† ≅ A⟨f''/g''⟩†` under `A`. -/
theorem rationalLocalization.trans [CompleteSpace K] {m m' : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) {f' : Fin m' → rationalLocalization K A f g}
    {g' : rationalLocalization K A f g} (hfg' : Ideal.span (insert g' (Set.range f')) = ⊤) :
    ∃ (m'' : ℕ) (f'' : Fin m'' → A) (g'' : A) (_ : Ideal.span (insert g'' (Set.range f'')) = ⊤)
      (e : rationalLocalization K (rationalLocalization K A f g) f' g' ≃ₐ[K]
        rationalLocalization K A f'' g''),
      (e : _ →ₐ[K] _).comp ((rationalLocalization.algebraMap K _ f' g').comp
          (rationalLocalization.algebraMap K A f g)) =
        rationalLocalization.algebraMap K A f'' g'' :=
  sorry

-- test rationalLocalization_test_annulus (computation) [F1/dagger-rational-localisation]
example [CompleteSpace K] :
    Nonempty (laurentLocalization K (washnitzerAlgebra 1 K) (washnitzerAlgebra.X 1 K 0) ≃ₐ[K]
      (washnitzerAlgebra 2 K ⧸
        Ideal.span {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1})) := sorry

-- test rationalLocalization_test_trivial (degenerate) [F1/dagger-rational-localisation]
example [CompleteSpace K] :
    Function.Bijective (rationalLocalization.algebraMap K A (fun _ : Fin 1 ↦ (1 : A)) 1) := sorry

/- For `0 < |a| < 1`, `X − a` is a unit of `W_1⟨X⁻¹⟩†` (`1/(X − a) = ∑ aᵏ X^{-k-1}`) but not of
the algebraic localisation `W_1[1/X]`. -/
-- test rationalLocalization_test_not_algebraic (non-example) [F1/dagger-rational-localisation]
example [CompleteSpace K] (a : K) (ha : 0 < ‖a‖ ∧ ‖a‖ < 1) :
    IsUnit (laurentLocalization.algebraMap K (washnitzerAlgebra 1 K) (washnitzerAlgebra.X 1 K 0)
        (washnitzerAlgebra.X 1 K 0 - algebraMap K _ a)) ∧
      ¬ IsUnit (algebraMap (washnitzerAlgebra 1 K)
        (Localization.Away (washnitzerAlgebra.X 1 K 0))
        (washnitzerAlgebra.X 1 K 0 - algebraMap K _ a)) :=
  sorry

open scoped Classical in
-- test rationalLocalization_test_completion (compatibility) [F1/dagger-rational-localisation]
example [CompleteSpace K] [NonarchimedeanRing K] :
    ∃ (P : Huber.PairOfDefinition (completion K (washnitzerAlgebra 1 K)))
      (hden : P.HasDenominatorPower {1} (toCompletion K _ (washnitzerAlgebra.X 1 K 0))
        (Localization.Away (toCompletion K _ (washnitzerAlgebra.X 1 K 0)))),
      Nonempty (completion K
          (laurentLocalization K (washnitzerAlgebra 1 K) (washnitzerAlgebra.X 1 K 0))
        ≃+* (letI := Huber.PairOfDefinition.locUniformSpace P _ _ _ hden
          UniformSpace.Completion
            (Localization.Away (toCompletion K _ (washnitzerAlgebra.X 1 K 0))))) :=
  sorry

-- test rationalLocalization_test_points (characterisation) [F1/dagger-rational-localisation]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    rationalDomain K (fun _ : Fin 1 ↦ washnitzerAlgebra.X 1 K 0) (algebraMap K _ π) =
      {x | pointNorm K _ x (washnitzerAlgebra.X 1 K 0) ≤ ‖π‖} := sorry

end Rational

/-! ## AdicSpacesPartII:F1/integral-overconvergent-tate-algebra (construction) -/

section IntegralWashnitzer

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- F1/integral-overconvergent-tate-algebra: `O_K = {x ∈ K : |x| ≤ 1}`. -/
def integerRing (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] : Subring K where
  carrier := {x | ‖x‖ ≤ 1}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- F1/integral-overconvergent-tate-algebra: `O_K⟦X₁, …, Xₙ⟧ ⊆ K⟦X₁, …, Xₙ⟧`, the series with all
coefficients of norm `≤ 1`. -/
def intPowerSeries (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (n : ℕ) :
    Subring (MvPowerSeries (Fin n) K) where
  carrier := {f | ∀ ν, ‖MvPowerSeries.coeff ν f‖ ≤ 1}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- F1/integral-overconvergent-tate-algebra (data): `O_K⟨X₁, …, Xₙ⟩† = W_n ∩ O_K⟦X⟧`. -/
def intWashnitzerAlgebra (n : ℕ) : Subring (MvPowerSeries (Fin n) K) :=
  (washnitzerAlgebra n K).toSubring ⊓ intPowerSeries K n

variable {K} {n : ℕ}

/-- F1/integral-overconvergent-tate-algebra (characterisation): membership. -/
theorem mem_intWashnitzerAlgebra_iff {f : MvPowerSeries (Fin n) K} :
    f ∈ intWashnitzerAlgebra K n ↔
      f ∈ washnitzerAlgebra n K ∧ ∀ ν, ‖MvPowerSeries.coeff ν f‖ ≤ 1 := sorry

/-- F1/integral-overconvergent-tate-algebra (characterisation): for `K` discretely valued with
uniformiser `π`, `f ∈ O_K⟨X⟩†` iff `f = ∑_j π^j P_j` with `P_j ∈ O_K[X]` of total degree
`≤ c (j + 1)` for some `c` (Monsky–Washnitzer growth condition). -/
theorem mem_intWashnitzerAlgebra_iff_degree [CompleteSpace K] (π : K)
    (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k)
    {f : MvPowerSeries (Fin n) K} :
    f ∈ intWashnitzerAlgebra K n ↔
      ∃ (c : ℕ) (P : ℕ → MvPolynomial (Fin n) K),
        (∀ j ν, ‖(P j).coeff ν‖ ≤ 1) ∧ (∀ j, (P j).totalDegree ≤ c * (j + 1)) ∧
          ∀ ν, HasSum (fun j ↦ π ^ j * (P j).coeff ν) (MvPowerSeries.coeff ν f) := sorry

/-- F1/integral-overconvergent-tate-algebra (compatibility): `O_K⟨X⟩† = W_n^int`. -/
theorem intWashnitzerAlgebra_eq_intSubring [CompleteSpace K] [NonarchimedeanRing K] :
    (intWashnitzerAlgebra K n : Set (MvPowerSeries (Fin n) K)) =
      Subtype.val '' (intSubring K (washnitzerAlgebra n K) : Set (washnitzerAlgebra n K)) := sorry

/-- F1/integral-overconvergent-tate-algebra (relation): for `K` discretely valued with uniformiser
`π`, `O_K⟨X⟩† / πᵐ ≅ (O_K / πᵐ)[X]`. -/
theorem intWashnitzerAlgebra.quotient_pow [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k) (πI : intWashnitzerAlgebra K n)
    (hπI : (πI : MvPowerSeries (Fin n) K) = MvPowerSeries.C π) (πO : integerRing K)
    (hπO : (πO : K) = π) (m : ℕ) :
    Nonempty ((intWashnitzerAlgebra K n ⧸ Ideal.span {πI ^ m}) ≃+*
      MvPolynomial (Fin n) (integerRing K ⧸ Ideal.span {πO ^ m})) := sorry

/-- F1/integral-overconvergent-tate-algebra (compatibility): the `π`-adic completion of
`O_K⟨X⟩†` is `O_K⟨X⟩ = T_n ∩ O_K⟦X⟧`. -/
theorem intWashnitzerAlgebra.adicCompletion [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (πI : intWashnitzerAlgebra K n) (hπI : (πI : MvPowerSeries (Fin n) K) = MvPowerSeries.C π) :
    Nonempty (AdicCompletion (Ideal.span {πI}) (intWashnitzerAlgebra K n) ≃+*
      ((radiusTate n K 1).toSubring ⊓ intPowerSeries K n : Subring (MvPowerSeries (Fin n) K))) :=
  sorry

/-- F1/integral-overconvergent-tate-algebra (instance): for `K` discretely valued, `O_K⟨X⟩†` is
noetherian. -/
theorem intWashnitzerAlgebra.isNoetherianRing [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k) :
    IsNoetherianRing (intWashnitzerAlgebra K n) := sorry

/-- F1/integral-overconvergent-tate-algebra (other): `1 + π f` is a unit of `O_K⟨X⟩†`, so `π` lies
in the Jacobson radical. -/
theorem intWashnitzerAlgebra.isUnit_one_add [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (πI : intWashnitzerAlgebra K n) (hπI : (πI : MvPowerSeries (Fin n) K) = MvPowerSeries.C π)
    (f : intWashnitzerAlgebra K n) : IsUnit (1 + πI * f) := sorry

/-- F1/integral-overconvergent-tate-algebra (equivalence): `O_K⟨X⟩†[1/π] = W_n`. -/
theorem intWashnitzerAlgebra.tensor_fraction [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (πI : intWashnitzerAlgebra K n) (hπI : (πI : MvPowerSeries (Fin n) K) = MvPowerSeries.C π) :
    Nonempty (Localization.Away πI ≃+* washnitzerAlgebra n K) := sorry

-- test intWashnitzerAlgebra_test_geometric (computation) [F1/integral-overconvergent-tate-algebra]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    (fun ν : Fin 1 →₀ ℕ ↦ π ^ ν 0 : MvPowerSeries (Fin 1) K) ∈ intWashnitzerAlgebra K 1 := sorry

-- test intWashnitzerAlgebra_test_zero (degenerate) [F1/integral-overconvergent-tate-algebra]
example : (intWashnitzerAlgebra K 0 : Set (MvPowerSeries (Fin 0) K)) =
    {f | ‖MvPowerSeries.constantCoeff f‖ ≤ 1} := sorry

/- `∑ π^j X^{j²}` is in `T_1 ∩ O_K⟦X⟧` (the `π`-adic completion) but not in `O_K⟨X⟩†`. -/
-- test intWashnitzerAlgebra_test_not_mem (non-example) [F1/integral-overconvergent-tate-algebra]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    let g : MvPowerSeries (Fin 1) K := fun ν ↦
      if (Nat.sqrt (ν 0)) ^ 2 = ν 0 then π ^ Nat.sqrt (ν 0) else 0
    g ∈ radiusTate 1 K 1 ∧ g ∈ intPowerSeries K 1 ∧ g ∉ intWashnitzerAlgebra K 1 := sorry

-- test intWashnitzerAlgebra_test_fraction (compatibility) [F1/integral-overconvergent-tate-algebra]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) (f : MvPowerSeries (Fin n) K) :
    f ∈ washnitzerAlgebra n K ↔ ∃ k : ℕ, MvPowerSeries.C π ^ k * f ∈ intWashnitzerAlgebra K n :=
  sorry

end IntegralWashnitzer

/-! ## AdicSpacesPartII:F1/weak-completion (construction) -/

section WeakCompletion

open TensorProduct

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O]

variable (π : O) (S : Type*) [CommRing S] [Algebra O S]

/-- F1/weak-completion: the `π`-adic completion `Ŝ = lim_m S/πᵐS`. -/
abbrev piAdicCompletion : Type _ := AdicCompletion (Ideal.span {algebraMap O S π}) S

variable {S} in
/-- F1/weak-completion: for a family `x : ι → S`, the elements `z = ∑_j π^j P_j(x)` of `Ŝ` with
`P_j ∈ O_K[X]` of total degree `≤ c (j + 1)` for some `c`, the sum read modulo every `πᵏ`. -/
def weakCompletionSet {ι : Type*} [Fintype ι] (x : ι → S) : Set (piAdicCompletion π S) :=
  {z | ∃ (c : ℕ) (P : ℕ → MvPolynomial ι O), (∀ j, (P j).totalDegree ≤ c * (j + 1)) ∧
    ∀ k : ℕ, AdicCompletion.eval _ S k z = Submodule.Quotient.mk
      (∑ j ∈ Finset.range k, algebraMap O S π ^ j * MvPolynomial.aeval x (P j))}

/-- F1/weak-completion (data): the Monsky–Washnitzer weak completion `S† ⊆ Ŝ` of a finitely
generated `O_K`-algebra, `weakCompletionSet` for a chosen finite generating set (independent of it,
`weakCompletion_independent`). -/
def weakCompletion [Algebra.FiniteType O S] : Subalgebra O (piAdicCompletion π S) where
  carrier := weakCompletionSet π
    (fun x : ((Algebra.FiniteType.out (R := O) (A := S)).choose : Set S) ↦ (x : S))
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  algebraMap_mem' := sorry

/-- F1/weak-completion (constructor): the `O_K`-algebra map `S → S†` (through `Ŝ`); it is injective
iff `⋂ πᵐ S = 0`. -/
def weakCompletion.of [Algebra.FiniteType O S] : S →ₐ[O] weakCompletion π S := sorry

variable {S}

/-- F1/weak-completion (functoriality): `S → T` induces `S† → T†`. -/
def weakCompletion.map {T : Type*} [CommRing T] [Algebra O T] [Algebra.FiniteType O S]
    [Algebra.FiniteType O T] (f : S →ₐ[O] T) : weakCompletion π S →ₐ[O] weakCompletion π T :=
  sorry

/-- F1/weak-completion (characterisation): membership in `S†` through any finite generating family.
-/
theorem mem_weakCompletion_iff [Algebra.FiniteType O S] {n : ℕ} (x : Fin n → S)
    (hx : Algebra.adjoin O (Set.range x) = ⊤) (z : piAdicCompletion π S) :
    z ∈ weakCompletion π S ↔ z ∈ weakCompletionSet π x := sorry

/-- F1/weak-completion (characterisation): `S†` is the image of `O_K[X]† → Ŝ`, `Xᵢ ↦ xᵢ`, for any
finite generating family `x`. -/
theorem weakCompletion_eq_range [Algebra.FiniteType O S] {n : ℕ} (x : Fin n → S)
    (hx : Algebra.adjoin O (Set.range x) = ⊤) :
    ((weakCompletion π S : Set (piAdicCompletion π S))) =
      Subtype.val '' Set.range (weakCompletion.map π (MvPolynomial.aeval (R := O) x)) := sorry

/-- F1/weak-completion (characterisation): `S†` does not depend on the generating family. -/
theorem weakCompletion_independent {n m : ℕ} (x : Fin n → S) (y : Fin m → S)
    (hx : Algebra.adjoin O (Set.range x) = ⊤) (hy : Algebra.adjoin O (Set.range y) = ⊤) :
    weakCompletionSet π x = weakCompletionSet π y := sorry

variable (S) in
/-- F1/weak-completion (data): the generic fibre `A† = S† ⊗_{O_K} K` (written `K ⊗ S†`). -/
abbrev weakCompletion.genericFibre [Algebra.FiniteType O S] (K : Type*) [Field K] [Algebra O K] :
    Type _ :=
  K ⊗[O] weakCompletion π S

/-- F1/weak-completion (example): evaluation at `T = a` retracts `S† → (S[T])†`; with `a = 0, 1`
these are the evaluations of `(S[T])† ≅ S†⟨T⟩†`. -/
theorem weakCompletion.polynomial [Algebra.FiniteType O S] [Algebra.FiniteType O (Polynomial S)]
    (a : S) :
    (weakCompletion.map π ((Polynomial.aeval a).restrictScalars O)).comp
        (weakCompletion.map π ((Algebra.ofId S (Polynomial S)).restrictScalars O)) =
      AlgHom.id O (weakCompletion π S) := sorry

/-- F1/weak-completion (example): `O_K[X₁, …, Xₙ]† = O_K⟨X₁, …, Xₙ⟩†`, for `K` a nonarchimedean
field whose unit ball is `O_K`. -/
theorem weakCompletion_polynomialRing (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [Algebra O K] (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (n : ℕ) :
    Nonempty (weakCompletion π (MvPolynomial (Fin n) O) ≃+* intWashnitzerAlgebra K n) := sorry

-- test weakCompletion_test_laurent (computation) [F1/weak-completion]
example [Algebra.FiniteType O (MvPolynomial (Fin 2) O ⧸
      Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) O)})] :
    Nonempty (weakCompletion π (MvPolynomial (Fin 2) O ⧸
        Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) O)}) ≃ₐ[O]
      (weakCompletion π (MvPolynomial (Fin 2) O) ⧸ Ideal.span
        {weakCompletion.of π (MvPolynomial (Fin 2) O)
          (MvPolynomial.X 0 * MvPolynomial.X 1 - 1)})) :=
  sorry

-- test weakCompletion_test_finite (degenerate) [F1/weak-completion]
example [Algebra.FiniteType O S] [Module.Finite O S] : weakCompletion π S = ⊤ := sorry

/- The witness is `∑ π^j X^{j²} ∈ Ŝ` for `S = O_K[X]`. -/
-- test weakCompletion_test_not_completion (non-example) [F1/weak-completion]
example : ∃ z : piAdicCompletion π (MvPolynomial (Fin 1) O),
    z ∉ weakCompletion π (MvPolynomial (Fin 1) O) := sorry

-- test weakCompletion_test_generic_fibre (compatibility) [F1/weak-completion]
example [Algebra.FiniteType O S] (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [Algebra O K] (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) :
    IsDaggerAlgebra K (weakCompletion.genericFibre π S K) := sorry

-- test weakCompletion_test_mod_pi (characterisation) [F1/weak-completion]
example [Algebra.FiniteType O S] :
    Nonempty ((weakCompletion π S ⧸ Ideal.span {algebraMap O (weakCompletion π S) π}) ≃ₐ[O]
      (S ⧸ Ideal.span {algebraMap O S π})) := sorry

end WeakCompletion

/-! ## AdicSpacesPartII:F1/weak-completion-presentation (lemma) -/

section WeakCompletionPresentation

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O) (hπ : Irreducible π)
  {S : Type*} [CommRing S] [Algebra O S] [Algebra.FiniteType O S]

include hπ in
/-- F1/weak-completion-presentation (b) (API `Dagger.weakCompletion.isNoetherianRing` of
F1/weak-completion): `S†` is noetherian. -/
theorem weakCompletion.isNoetherianRing : IsNoetherianRing (weakCompletion π S) := sorry

include hπ in
/-- F1/weak-completion-presentation (c) (API `Dagger.weakCompletion.quotient_pow` of
F1/weak-completion): `S†/πᵐS† ≅ S/πᵐS`. -/
theorem weakCompletion.quotient_pow (m : ℕ) :
    Nonempty ((weakCompletion π S ⧸ Ideal.span {algebraMap O (weakCompletion π S) π ^ m}) ≃ₐ[O]
      (S ⧸ Ideal.span {algebraMap O S π ^ m})) := sorry

include hπ in
/-- F1/weak-completion-presentation (d): `π` lies in the Jacobson radical of `S†`. -/
theorem weakCompletion.mem_jacobson :
    algebraMap O (weakCompletion π S) π ∈ Ideal.jacobson ⊥ := sorry

end WeakCompletionPresentation

/-! ## AdicSpacesPartII:F1/weak-completion-universal-property (lemma) -/

section WeakCompletionUniversal

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)

/-- F1/weak-completion-universal-property: `B` is weakly complete finitely generated:
`B ≅ O_K⟨Y₁, …, Y_m⟩† / J`. -/
def IsWeaklyCompleteFG (B : Type*) [CommRing B] [Algebra O B] : Prop :=
  ∃ (m : ℕ) (J : Ideal (weakCompletion π (MvPolynomial (Fin m) O))),
    Nonempty (B ≃ₐ[O] (weakCompletion π (MvPolynomial (Fin m) O) ⧸ J))

/-- F1/weak-completion-universal-property (b) (API `Dagger.weakCompletion.lift` of
F1/weak-completion): an `O_K`-algebra map `S → B` into a weakly complete finitely generated `B`
extends uniquely to `S† → B`. -/
theorem weakCompletion.lift {S : Type*} [CommRing S] [Algebra O S] [Algebra.FiniteType O S]
    {B : Type*} [CommRing B] [Algebra O B] (hB : IsWeaklyCompleteFG π B) (φ : S →ₐ[O] B) :
    ∃! φ' : weakCompletion π S →ₐ[O] B, φ'.comp (weakCompletion.of π S) = φ := sorry

/-- F1/weak-completion-universal-property (a): `S†` is weakly complete finitely generated. -/
theorem weakCompletion.isWeaklyCompleteFG {S : Type*} [CommRing S] [Algebra O S]
    [Algebra.FiniteType O S] : IsWeaklyCompleteFG π (weakCompletion π S) := sorry

end WeakCompletionUniversal

/-! ## AdicSpacesPartII:F1/weak-completion-generic-fibre (lemma) -/

section WeakCompletionGenericFibre

open TensorProduct

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)
  (S : Type*) [CommRing S] [Algebra O S] [Algebra.FiniteType O S]
  (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [Algebra O K]

/-- F1/weak-completion-generic-fibre (a): `S† ⊗ K` is a `K`-dagger algebra, for `K` with unit ball
`O_K`. -/
theorem weakCompletion.isDaggerAlgebra_genericFibre
    (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) :
    IsDaggerAlgebra K (weakCompletion.genericFibre π S K) := sorry

/-- F1/weak-completion-generic-fibre (c): if `S` is flat over `O_K` and `S/πS` is reduced, then
`S†` is exactly the integral subring `(S† ⊗ K)^int`. -/
theorem weakCompletion.intSubring_eq [NonarchimedeanRing K]
    (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) [Module.Flat O S]
    (hred : IsReduced (S ⧸ Ideal.span {algebraMap O S π})) :
    haveI := weakCompletion.isDaggerAlgebra_genericFibre π S K hO
    (intSubring K (weakCompletion.genericFibre π S K) : Set (weakCompletion.genericFibre π S K)) =
      Set.range fun z : weakCompletion π S ↦ (1 : K) ⊗ₜ[O] z := sorry

end WeakCompletionGenericFibre

/-! ## AdicSpacesPartII:F1/dagger-differentials (construction) -/

section Differentials

open TensorProduct

variable (K : Type*) [CommRing K] (A : Type*) [CommRing A] [Algebra K A]

/-- F1/dagger-differentials (data): `Ω¹_{A/K}`, the quotient of Mathlib's `KaehlerDifferential K A`
by the intersection of its submodules with finite quotient (the universally finite module of
differentials; for a dagger algebra it is finite). -/
abbrev Omega : Type _ :=
  KaehlerDifferential K A ⧸
    ⨅ N : {N : Submodule A (KaehlerDifferential K A) //
      Module.Finite A (KaehlerDifferential K A ⧸ N)}, N.1

/-- F1/dagger-differentials (data): the universal derivation `d : A → Ω¹_A`. -/
def Omega.d : Derivation K A (Omega K A) :=
  (Submodule.mkQ _).compDer (KaehlerDifferential.D K A)

/-- F1/dagger-differentials (compatibility): the canonical surjection `Ω[A⁄K] → Ω¹_A`, an
isomorphism when `A` is finite over `K`. -/
def Omega.ofKaehler : KaehlerDifferential K A →ₗ[A] Omega K A := Submodule.mkQ _

variable {K A}

end Differentials

section DaggerDifferentials

open TensorProduct

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-differentials (instance): `Ω¹_A` is a finite `A`-module. -/
instance Omega.finite : Module.Finite A (Omega K A) := sorry

/-- F1/dagger-differentials (functoriality): a morphism `φ : A → B` of dagger algebras induces
`Ω¹_A → Ω¹_B`, `da ↦ dφ(a)`. -/
def Omega.map {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] {B : Type*} [CommRing B]
    [Algebra K B] [IsDaggerAlgebra K B] (φ : A →ₐ[K] B) : Omega K A →+ Omega K B := sorry

/-- F1/dagger-differentials: `Omega.map φ (d a) = d (φ a)`. -/
theorem Omega.map_d {B : Type*} [CommRing B] [Algebra K B] [IsDaggerAlgebra K B] (φ : A →ₐ[K] B)
    (a : A) : Omega.map φ (Omega.d K A a) = Omega.d K B (φ a) := sorry

/-- F1/dagger-differentials (universal property): a `K`-derivation `D : A → M` into a finite
`A`-module factors uniquely through `d`. -/
def Omega.lift {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] {M : Type*} [AddCommGroup M]
    [Module A M] [Module K M] [IsScalarTower K A M] [Module.Finite A M] (D : Derivation K A M) :
    Omega K A →ₗ[A] M := sorry

/-- F1/dagger-differentials (universal property): `lift D (d a) = D a`. -/
theorem Omega.lift_comp_d {M : Type*} [AddCommGroup M] [Module A M] [Module K M]
    [IsScalarTower K A M] [Module.Finite A M] (D : Derivation K A M) (a : A) :
    Omega.lift D (Omega.d K A a) = D a := sorry

/-- F1/dagger-differentials (extensionality): `A`-linear maps out of `Ω¹_A` agreeing on all `d a`
are equal. -/
theorem Omega.hom_ext {M : Type*} [AddCommGroup M] [Module A M] {f g : Omega K A →ₗ[A] M}
    (h : ∀ a, f (Omega.d K A a) = g (Omega.d K A a)) : f = g := sorry

/-- F1/dagger-differentials (example): `Ω¹_{W_n}` is free on `dX₁, …, dXₙ`, and
`d g = ∑ᵢ ∂g/∂Xᵢ dXᵢ`. -/
theorem Omega.washnitzerBasis (n : ℕ) :
    (∃ b : Module.Basis (Fin n) (washnitzerAlgebra n K) (Omega K (washnitzerAlgebra n K)),
      ∀ i, b i = Omega.d K _ (washnitzerAlgebra.X n K i)) ∧
    ∀ g : washnitzerAlgebra n K, Omega.d K _ g = ∑ i : Fin n,
      (⟨MvPowerSeries.pderiv K i g, pderiv_mem_washnitzerAlgebra i g.2⟩ : washnitzerAlgebra n K) •
        Omega.d K _ (washnitzerAlgebra.X n K i) := sorry

/-- F1/dagger-differentials (characterisation): for `A = W_n / I`, `Ω¹_A` is generated by the
`dXᵢ`, subject to the relations `∑ᵢ ∂f/∂Xᵢ dXᵢ = 0`, `f ∈ I`. -/
theorem Omega.quotient {n : ℕ} (I : Ideal (washnitzerAlgebra n K)) :
    Submodule.span (washnitzerAlgebra n K ⧸ I) (Set.range fun i ↦
        Omega.d K (washnitzerAlgebra n K ⧸ I)
          (Ideal.Quotient.mk I (washnitzerAlgebra.X n K i))) = ⊤ ∧
      ∀ f ∈ I, ∑ i : Fin n, Ideal.Quotient.mk I
          (⟨MvPowerSeries.pderiv K i f, pderiv_mem_washnitzerAlgebra i f.2⟩ :
            washnitzerAlgebra n K) •
        Omega.d K (washnitzerAlgebra n K ⧸ I)
          (Ideal.Quotient.mk I (washnitzerAlgebra.X n K i)) = 0 :=
  sorry

/-- F1/dagger-differentials (instance): for regular `A`, `Ω¹_A` is finite projective. -/
theorem Omega.projective_of_isRegularRing [IsRegularRing A] : Module.Projective A (Omega K A) :=
  sorry

/-- F1/dagger-differentials: `Omega.ofKaehler` is bijective when `A` is finite over `K`. -/
theorem Omega.ofKaehler_bijective_of_finite [Module.Finite K A] :
    Function.Bijective (Omega.ofKaehler K A) := sorry

/-- F1/dagger-differentials (compatibility): `Ω¹_A ⊗_A Â ≅ Ω¹_Â`, the universally finite
differentials of the affinoid algebra `Â`, which are its continuous differentials
(AdicSpacesPartII:R0/continuous-differentials). -/
theorem Omega.completion [NonarchimedeanRing K] :
    letI := (toCompletion K A).toAlgebra
    Nonempty ((completion K A ⊗[A] Omega K A) ≃ₗ[completion K A] Omega K (completion K A)) := sorry

/-- F1/dagger-differentials (compatibility): `Ω¹_{A⟨f/g⟩†} ≅ A⟨f/g⟩† ⊗_A Ω¹_A`. -/
theorem Omega.rationalLocalization {m : ℕ} (f : Fin m → A) (g : A)
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) :
    letI := (rationalLocalization.algebraMap K A f g).toRingHom.toAlgebra
    Nonempty (Omega K (Dagger.rationalLocalization K A f g) ≃ₗ[Dagger.rationalLocalization K A f g]
      (Dagger.rationalLocalization K A f g ⊗[A] Omega K A)) := sorry

/-- F1/dagger-differentials (relation): `Ω¹_{A⟨T⟩†} ≅ (A⟨T⟩† ⊗_A Ω¹_A) ⊕ A⟨T⟩† dT`. -/
theorem Omega.relTate :
    letI := (relTate.inl K A 1).toRingHom.toAlgebra
    Nonempty (Omega K (Dagger.relTate K A 1 1) ≃ₗ[Dagger.relTate K A 1 1]
      ((Dagger.relTate K A 1 1 ⊗[A] Omega K A) × Dagger.relTate K A 1 1)) := sorry

/-- F1/dagger-differentials (simp): `d` extends to `Ω^•_A = ⋀^• Ω¹_A` with `d ∘ d = 0`, and in
degree `0` it is `d`. -/
theorem Omega.dComp :
    ∃ dq : ∀ q : ℕ, ⋀[A]^q (Omega K A) →+ ⋀[A]^(q + 1) (Omega K A),
      (∀ q, (dq (q + 1)).comp (dq q) = 0) ∧
        ∀ a : A, dq 0 (a • exteriorPower.ιMulti A 0 ![]) =
          exteriorPower.ιMulti A 1 ![Omega.d K A a] := sorry

/- `A = K⟨X, X⁻¹⟩† = W_2/(X₁X₂ − 1)`: `Ω¹_A` is free on `dX`, and `d(X⁻¹) = −X⁻² dX`. -/
-- test Omega_test_annulus (computation) [F1/dagger-differentials]
example :
    let I := Ideal.span {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1}
    let x := Ideal.Quotient.mk I (washnitzerAlgebra.X 2 K 0)
    let y := Ideal.Quotient.mk I (washnitzerAlgebra.X 2 K 1)
    (∃ b : Module.Basis (Fin 1) (washnitzerAlgebra 2 K ⧸ I) (Omega K (washnitzerAlgebra 2 K ⧸ I)),
      b 0 = Omega.d K _ x) ∧ Omega.d K _ y = -(y ^ 2) • Omega.d K _ x := sorry

-- test Omega_test_field (degenerate) [F1/dagger-differentials]
example (L : Type*) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L] :
    Subsingleton (Omega K K) ∧ Subsingleton (Omega K L) := sorry

/- In characteristic `0` with residue characteristic `p`, `Ω[W_1⁄K]` is not a finite `W_1`-module
(the series `exp(λᵢ X)` are algebraically independent), while `Ω¹_{W_1} = W_1 dX`. -/
-- test Omega_test_not_kaehler (non-example) [F1/dagger-differentials]
example [CharZero K] (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) :
    ¬ Module.Finite (washnitzerAlgebra 1 K) (KaehlerDifferential K (washnitzerAlgebra 1 K)) := sorry

-- test Omega_test_completion (compatibility) [F1/dagger-differentials]
example [NonarchimedeanRing K] (n : ℕ) :
    letI := (toCompletion K (washnitzerAlgebra n K)).toAlgebra
    Nonempty ((completion K (washnitzerAlgebra n K) ⊗[washnitzerAlgebra n K]
        Omega K (washnitzerAlgebra n K)) ≃ₗ[completion K (washnitzerAlgebra n K)]
      (Fin n → completion K (washnitzerAlgebra n K))) := sorry

/- `A = W_2/(Y² − X³ − 1)`, `char K ≠ 2, 3`: `2Y dY = 3X² dX` and `Ω¹_A` is projective. -/
-- test Omega_test_derivation (characterisation) [F1/dagger-differentials]
example (h2 : (2 : K) ≠ 0) (h3 : (3 : K) ≠ 0) :
    let I := Ideal.span {washnitzerAlgebra.X 2 K 1 ^ 2 - washnitzerAlgebra.X 2 K 0 ^ 3 - 1}
    let x := Ideal.Quotient.mk I (washnitzerAlgebra.X 2 K 0)
    let y := Ideal.Quotient.mk I (washnitzerAlgebra.X 2 K 1)
    (2 * y) • Omega.d K _ y = (3 * x ^ 2) • Omega.d K _ x ∧
      Module.Projective (washnitzerAlgebra 2 K ⧸ I) (Omega K (washnitzerAlgebra 2 K ⧸ I)) := sorry

end DaggerDifferentials

/-! ## AdicSpacesPartII:F1/mw-type-dagger-algebra (definition) -/

section MWType

open TensorProduct

variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [Algebra O K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] [Algebra O A] [IsScalarTower O K A]

/-- F1/mw-type-dagger-algebra: `A^int` as an `O_K`-subalgebra of `A` (for `O_K → K` landing in the
unit ball). -/
def intSubalgebra (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) : Subalgebra O A :=
  { intSubring K A with algebraMap_mem' := fun _ ↦ sorry }

/-- F1/mw-type-dagger-algebra (structure): `A` is of Monsky–Washnitzer type: `A` is regular and
the reduction `A^int / π A^int = k ⊗_{O_K} A^int` is a smooth `k`-algebra, `k` the residue field.
Regularity is part of the definition. -/
def IsMWType (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) : Prop :=
  IsRegularRing A ∧
    Algebra.Smooth (IsLocalRing.ResidueField O)
      (IsLocalRing.ResidueField O ⊗[O] intSubalgebra O K A hO)

/-- F1/mw-type-dagger-algebra (data): the reduction `A^int / π A^int = k ⊗_{O_K} A^int`. -/
abbrev IsMWType.reduction (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) : Type _ :=
  IsLocalRing.ResidueField O ⊗[O] intSubalgebra O K A hO

variable {O K A}

/-- F1/mw-type-dagger-algebra (compatibility): for `A` of MW-type the reduction is
`A^int / {|·|_sup < 1}`. -/
theorem IsMWType.reduction_eq {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1} (h : IsMWType O K A hO) :
    Nonempty (IsMWType.reduction O K A hO ≃ₐ[O]
      (intSubalgebra O K A hO ⧸
        Ideal.span {a : intSubalgebra O K A hO | supNorm K A (a : A) < 1})) := sorry

/-- F1/mw-type-dagger-algebra (instance): an algebra of MW-type is reduced. -/
theorem IsMWType.isReduced {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1} (h : IsMWType O K A hO) :
    IsReduced A := sorry

/-- F1/mw-type-dagger-algebra (other): for `A` of MW-type, `Ω¹_{A/K}` is finite projective. -/
theorem IsMWType.projective_differentials {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1}
    (h : IsMWType O K A hO) : Module.Projective A (Omega K A) := sorry

/-- F1/mw-type-dagger-algebra (constructor): if `f ∈ A^int` has non-nilpotent reduction, then
`A⟨f⁻¹⟩†` is of MW-type. -/
theorem IsMWType.laurent {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1} (h : IsMWType O K A hO)
    (f : intSubalgebra O K A hO)
    (hf : ¬ IsNilpotent ((1 : IsLocalRing.ResidueField O) ⊗ₜ[O] f)) :
    letI : Algebra O (laurentLocalization K A (f : A)) :=
      ((algebraMap K (laurentLocalization K A (f : A))).comp (algebraMap O K)).toAlgebra
    haveI : IsScalarTower O K (laurentLocalization K A (f : A)) :=
      IsScalarTower.of_algebraMap_eq' rfl
    IsMWType O K (laurentLocalization K A (f : A)) hO := sorry

variable (O K) in
/-- F1/mw-type-dagger-algebra (example): `W_n` is of MW-type, with reduction `k[X₁, …, Xₙ]`. -/
theorem IsMWType.washnitzer (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) (n : ℕ) :
    IsMWType O K (washnitzerAlgebra n K) hO := sorry

/-- F1/mw-type-dagger-algebra (constructor): for a smooth finitely generated `O_K`-algebra `S`,
`S† ⊗ K` is of MW-type. -/
theorem IsMWType.of_smooth [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)
    (hπ : Irreducible π) (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (S : Type*) [CommRing S] [Algebra O S] [Algebra.FiniteType O S] [Algebra.Smooth O S] :
    haveI := weakCompletion.isDaggerAlgebra_genericFibre π S K hO
    IsMWType O K (weakCompletion.genericFibre π S K) (fun a ↦ (hO _).2 ⟨a, rfl⟩) := sorry

/-- F1/mw-type-dagger-algebra (characterisation): `A` is of MW-type iff `A ≅ S† ⊗ K` for a smooth
finitely generated `O_K`-algebra `S` (F1/mw-lift-existence-uniqueness). -/
theorem isMWType_iff [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O) (hπ : Irreducible π)
    (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) :
    IsMWType O K A (fun a ↦ (hO _).2 ⟨a, rfl⟩) ↔
      ∃ (S : Type*) (_ : CommRing S) (_ : Algebra O S) (_ : Algebra.FiniteType O S)
        (_ : Algebra.Smooth O S), Nonempty (A ≃ₐ[K] weakCompletion.genericFibre π S K) := sorry

variable (O K) in
-- test IsMWType_test_washnitzer (computation) [F1/mw-type-dagger-algebra]
example (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) (n : ℕ) :
    IsMWType O K (washnitzerAlgebra n K) hO ∧
      Nonempty (IsMWType.reduction O K (washnitzerAlgebra n K) hO ≃ₐ[IsLocalRing.ResidueField O]
        MvPolynomial (Fin n) (IsLocalRing.ResidueField O)) := sorry

variable (O K) in
-- test IsMWType_test_field (degenerate) [F1/mw-type-dagger-algebra]
example (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) :
    IsMWType O K K hO ∧
      Nonempty (IsMWType.reduction O K K hO ≃ₐ[IsLocalRing.ResidueField O]
        IsLocalRing.ResidueField O) := sorry

variable (O K) in
/- `A = W_1/(X²)`: `X` is nilpotent, so `A^int/πA^int = k` is smooth, but `A` is not regular; the
regularity clause excludes it. -/
-- test IsMWType_test_not_regular (non-example) [F1/mw-type-dagger-algebra]
example (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) :
    ¬ IsRegularRing (washnitzerAlgebra 1 K ⧸ Ideal.span {washnitzerAlgebra.X 1 K 0 ^ 2}) ∧
      ¬ IsMWType O K (washnitzerAlgebra 1 K ⧸ Ideal.span {washnitzerAlgebra.X 1 K 0 ^ 2}) hO :=
        sorry

variable (O K) in
/- `A = W_1[Y]/(Y² − π) = W_2/(X₂² − π)` (`p ≠ 2`) is regular but its reduction `k[ε, X]/(ε²)`
is not reduced. -/
-- test IsMWType_test_ramified (non-example) [F1/mw-type-dagger-algebra]
example (hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1) (π : O) (hπ : Irreducible π) (h2 : (2 : K) ≠ 0) :
    IsRegularRing (washnitzerAlgebra 2 K ⧸
        Ideal.span {washnitzerAlgebra.X 2 K 1 ^ 2 - algebraMap K _ (algebraMap O K π)}) ∧
      ¬ IsMWType O K (washnitzerAlgebra 2 K ⧸
        Ideal.span {washnitzerAlgebra.X 2 K 1 ^ 2 - algebraMap K _ (algebraMap O K π)}) hO := sorry

-- test IsMWType_test_projective (compatibility) [F1/mw-type-dagger-algebra]
example {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1} (h : IsMWType O K A hO) :
    Module.Projective A (Omega K A) := sorry

end MWType

section TensorFlat

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [Algebra O K]
  {A₁ A₂ : Type*} [CommRing A₁] [Algebra K A₁] [IsDaggerAlgebra K A₁] [Algebra O A₁]
  [IsScalarTower O K A₁] [CommRing A₂] [Algebra K A₂] [IsDaggerAlgebra K A₂] [Algebra O A₂]
  [IsScalarTower O K A₂]

/-- F1/dagger-tensor-product (other): for `A₁, A₂` of MW-type, `A₁ → A₁ ⊗†_K A₂` is flat. -/
theorem tensor.flat_inl {hO : ∀ a : O, ‖algebraMap O K a‖ ≤ 1} (h₁ : IsMWType O K A₁ hO)
    (h₂ : IsMWType O K A₂ hO) :
    letI := (tensor.inl (Algebra.ofId K A₁) (Algebra.ofId K A₂)).toRingHom.toAlgebra
    Module.Flat A₁ (tensor (Algebra.ofId K A₁) (Algebra.ofId K A₂)) := sorry

end TensorFlat

section WashnitzerSucc

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- F1/overconvergent-tate-algebra (equivalence): `W_{n+1} ≅ W_n⟨X_{n+1}⟩† = W_n ⊗†_K W_1`
(F1/dagger-tensor-product). -/
theorem washnitzerAlgebra_succ (n : ℕ) :
    Nonempty (washnitzerAlgebra (n + 1) K ≃ₐ[K] relTate K (washnitzerAlgebra n K) 1 1) := sorry

end WashnitzerSucc

/-! ## AdicSpacesPartII:F1/mw-morphism-lifting (theorem) -/

section MWLifting

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)

/-- F1/mw-morphism-lifting: `A` is a lift of the `k`-algebra `A₀`: weakly complete finitely
generated, flat over `O_K`, with `A/πA ≅ A₀`. -/
def IsLift (A₀ : Type*) [CommRing A₀] (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  IsWeaklyCompleteFG π A ∧ Module.Flat O A ∧
    Nonempty ((A ⧸ Ideal.span {algebraMap O A π}) ≃+* A₀)

/-- F1/mw-morphism-lifting (van der Put 2.4.4 (ii)): for lifts `A`, `C` of smooth finitely
generated `k`-algebras `A₀`, `C₀`, every `k`-algebra map `A₀ → C₀` lifts to `A → C`. -/
theorem exists_lift_of_smooth_reduction (hπ : Irreducible π)
    {A₀ C₀ : Type*} [CommRing A₀] [CommRing C₀] [Algebra (IsLocalRing.ResidueField O) A₀]
    [Algebra (IsLocalRing.ResidueField O) C₀] [Algebra.Smooth (IsLocalRing.ResidueField O) A₀]
    [Algebra.Smooth (IsLocalRing.ResidueField O) C₀]
    {A C : Type*} [CommRing A] [Algebra O A] [CommRing C] [Algebra O C]
    (eA : (A ⧸ Ideal.span {algebraMap O A π}) ≃+* A₀)
    (eC : (C ⧸ Ideal.span {algebraMap O C π}) ≃+* C₀)
    (hA : IsWeaklyCompleteFG π A ∧ Module.Flat O A) (hC : IsWeaklyCompleteFG π C ∧ Module.Flat O C)
    (f : A₀ →ₐ[IsLocalRing.ResidueField O] C₀) :
    ∃ F : A →ₐ[O] C, ∀ a : A, eC (Ideal.Quotient.mk _ (F a)) = f (eA (Ideal.Quotient.mk _ a)) :=
  sorry

end MWLifting

/-! ## AdicSpacesPartII:F1/mw-lift-existence-uniqueness (theorem) -/

section MWLiftExistence

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O)

/-- F1/mw-lift-existence-uniqueness (a) (Elkik): a smooth finitely generated `k`-algebra lifts to a
smooth finitely generated `O_K`-algebra. -/
theorem exists_smooth_lift (hπ : Irreducible π) (A₀ : Type*) [CommRing A₀]
    [Algebra (IsLocalRing.ResidueField O) A₀] [Algebra.Smooth (IsLocalRing.ResidueField O) A₀] :
    ∃ (B : Type*) (_ : CommRing B) (_ : Algebra O B), Algebra.FiniteType O B ∧ Algebra.Smooth O B ∧
      Nonempty ((B ⧸ Ideal.span {algebraMap O B π}) ≃+* A₀) := sorry

/-- F1/mw-lift-existence-uniqueness (c): any two lifts of `A₀` are isomorphic. -/
theorem lift_unique (hπ : Irreducible π) {A₀ : Type*} [CommRing A₀]
    [Algebra (IsLocalRing.ResidueField O) A₀] [Algebra.Smooth (IsLocalRing.ResidueField O) A₀]
    {A B : Type*} [CommRing A] [Algebra O A] [CommRing B] [Algebra O B]
    (hA : IsLift π A₀ A) (hB : IsLift π A₀ B) : Nonempty (A ≃ₐ[O] B) := sorry

end MWLiftExistence

/-! ## AdicSpacesPartII:F1/dagger-affinoid-subdomain (definition) -/

section AffinoidSubdomain

universe u

variable (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type u} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-affinoid-subdomain (structure): `U ⊆ Sp(A)` is an affinoid subdomain: there is a
morphism `φ : A → B` of dagger algebras with `Sp(φ) ⊆ U` through which every morphism `A → D` with
`Sp(D) → Sp(A)` landing in `U` factors uniquely. -/
def IsAffinoidSubdomain (U : Set (MaximalSpectrum A)) : Prop :=
  ∃ (B : Type u) (_ : CommRing B) (_ : Algebra K B) (_ : IsDaggerAlgebra K B) (φ : A →ₐ[K] B),
    (∀ M : Ideal B, M.IsMaximal → ∃ x ∈ U, x.asIdeal = M.comap φ) ∧
    ∀ (D : Type u) [CommRing D] [Algebra K D] [IsDaggerAlgebra K D] (f : A →ₐ[K] D),
      (∀ M : Ideal D, M.IsMaximal → ∃ x ∈ U, x.asIdeal = M.comap f) →
        ∃! g : B →ₐ[K] D, g.comp φ = f

variable {K}

/-- F1/dagger-affinoid-subdomain (data): the representing dagger algebra `O_X(U)`. -/
def IsAffinoidSubdomain.algebra {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) :
    Type u :=
  hU.choose

/-- F1/dagger-affinoid-subdomain (instance): `CommRing hU.algebra`. -/
instance {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) : CommRing hU.algebra :=
  hU.choose_spec.choose

/-- F1/dagger-affinoid-subdomain (instance): `Algebra K hU.algebra`. -/
instance {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) : Algebra K hU.algebra :=
  hU.choose_spec.choose_spec.choose

/-- F1/dagger-affinoid-subdomain (instance): `IsDaggerAlgebra K hU.algebra`. -/
instance {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) :
    IsDaggerAlgebra K hU.algebra :=
  hU.choose_spec.choose_spec.choose_spec.choose

/-- F1/dagger-affinoid-subdomain (data): the restriction map `π_U : A → O_X(U)`. -/
def IsAffinoidSubdomain.restrict {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) :
    A →ₐ[K] hU.algebra :=
  hU.choose_spec.choose_spec.choose_spec.choose_spec.choose

/-- F1/dagger-affinoid-subdomain: `O_X(U)` as an `A`-algebra through `π_U`. -/
instance IsAffinoidSubdomain.instAlgebra {U : Set (MaximalSpectrum A)}
    (hU : IsAffinoidSubdomain K U) : Algebra A hU.algebra :=
  hU.restrict.toRingHom.toAlgebra

/-- F1/dagger-affinoid-subdomain (universal property): for `f : A → D` with `Sp(f)` landing in `U`,
the unique `g : O_X(U) → D` with `g ∘ π_U = f`. -/
def IsAffinoidSubdomain.lift {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U)
    {D : Type u} [CommRing D] [Algebra K D] [IsDaggerAlgebra K D] (f : A →ₐ[K] D)
    (hf : ∀ M : Ideal D, M.IsMaximal → ∃ x ∈ U, x.asIdeal = M.comap f) :
    hU.algebra →ₐ[K] D := sorry

/-- F1/dagger-affinoid-subdomain: restriction `O_X(U) → O_X(V)` for affinoid subdomains `V ⊆ U`,
an `A`-algebra map. -/
def IsAffinoidSubdomain.restrictTo {U V : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U)
    (hV : IsAffinoidSubdomain K V) (h : V ⊆ U) : hU.algebra →ₐ[A] hV.algebra := sorry

/-- F1/dagger-affinoid-subdomain (characterisation): `Sp(π_U) : Sp(O_X(U)) → U` is a bijection. -/
theorem IsAffinoidSubdomain.maximalSpectrum_equiv {U : Set (MaximalSpectrum A)}
    (hU : IsAffinoidSubdomain K U) :
    (∀ M : Ideal hU.algebra, M.IsMaximal → ∃ x ∈ U, x.asIdeal = M.comap hU.restrict) ∧
      ∀ x ∈ U, ∃! M : Ideal hU.algebra, M.IsMaximal ∧ M.comap hU.restrict = x.asIdeal := sorry

/-- F1/dagger-affinoid-subdomain (constructor): `R(f/g)` is an affinoid subdomain, with algebra
`A⟨f/g⟩†`. -/
theorem isAffinoidSubdomain_rational {m : ℕ} {f : Fin m → A} {g : A}
    (hfg : Ideal.span (insert g (Set.range f)) = ⊤) :
    ∃ h : IsAffinoidSubdomain K (rationalDomain K f g),
      Nonempty (h.algebra ≃ₐ[K] rationalLocalization K A f g) := sorry

/-- F1/dagger-affinoid-subdomain (functoriality): an affinoid subdomain of an affinoid subdomain is
an affinoid subdomain. -/
theorem IsAffinoidSubdomain.trans {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U)
    {V : Set (MaximalSpectrum hU.algebra)} (hV : IsAffinoidSubdomain K V) :
    IsAffinoidSubdomain K
      {x : MaximalSpectrum A | ∃ y ∈ V, y.asIdeal.comap hU.restrict = x.asIdeal} :=
  sorry

/-- F1/dagger-affinoid-subdomain (relation): `U ∩ V` is an affinoid subdomain, with algebra
`O(U) ⊗†_A O(V)`. -/
theorem IsAffinoidSubdomain.inter {U V : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U)
    (hV : IsAffinoidSubdomain K V) :
    ∃ h : IsAffinoidSubdomain K (U ∩ V),
      Nonempty (h.algebra ≃ₐ[K] tensor hU.restrict hV.restrict) := sorry

/-- F1/dagger-affinoid-subdomain (functoriality): preimages of affinoid subdomains under `Sp(φ)` are
affinoid subdomains. -/
theorem IsAffinoidSubdomain.preimage {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U)
    {D : Type u} [CommRing D] [Algebra K D] [IsDaggerAlgebra K D] (φ : A →ₐ[K] D) :
    IsAffinoidSubdomain K {y : MaximalSpectrum D | ∃ x ∈ U, x.asIdeal = y.asIdeal.comap φ} := sorry

-- Dagger.IsAffinoidSubdomain.completion: not stated here; needs affinoid subdomains of the rigid
--   space Sp(Â) (supplier: AdicSpacesPartII:R1/rigid-analytic-space). Node
--   AdicSpacesPartII:F1/dagger-affinoid-subdomain-completion.

/-- F1/dagger-affinoid-subdomain (other): `π_U : A → O_X(U)` is flat. -/
theorem IsAffinoidSubdomain.flat {U : Set (MaximalSpectrum A)} (hU : IsAffinoidSubdomain K U) :
    Module.Flat A hU.algebra := sorry

-- test IsAffinoidSubdomain_test_weierstrass (computation) [F1/dagger-affinoid-subdomain]
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    IsAffinoidSubdomain K
        (rationalDomain K (fun _ : Fin 1 ↦ washnitzerAlgebra.X 1 K 0) (algebraMap K _ π)) ∧
      Nonempty (rationalLocalization K (washnitzerAlgebra 1 K)
        (fun _ : Fin 1 ↦ washnitzerAlgebra.X 1 K 0) (algebraMap K _ π) ≃ₐ[K]
          washnitzerAlgebra 1 K) :=
  sorry

-- test IsAffinoidSubdomain_test_whole (degenerate) [F1/dagger-affinoid-subdomain]
example : IsAffinoidSubdomain K (Set.univ : Set (MaximalSpectrum A)) ∧
    IsAffinoidSubdomain K (∅ : Set (MaximalSpectrum A)) := sorry

/- The open unit disc is not an affinoid subdomain of `Sp(W_1)` (maximum modulus principle). -/
-- test IsAffinoidSubdomain_test_open_disc (non-example) [F1/dagger-affinoid-subdomain]
example : ¬ IsAffinoidSubdomain K
    {x : MaximalSpectrum (washnitzerAlgebra 1 K) |
      pointNorm K _ x (washnitzerAlgebra.X 1 K 0) < 1} :=
  sorry

-- IsAffinoidSubdomain_test_rational: not stated here; needs the embedding of the classical points
--   Sp(Â) into Spa(Â, Â°) (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]

/- A morphism `φ : A → B` inducing a bijection `Sp(B) ≅ U` that is universal for the quotients
`A / m^(k+1)`, `m ∈ U`, makes `U` an affinoid subdomain. -/
-- test IsAffinoidSubdomain_test_points (characterisation) [F1/dagger-affinoid-subdomain]
example (U : Set (MaximalSpectrum A)) {B : Type u} [CommRing B] [Algebra K B] [IsDaggerAlgebra K B]
    (φ : A →ₐ[K] B)
    (hφ : (∀ M : Ideal B, M.IsMaximal → ∃ x ∈ U, x.asIdeal = M.comap φ) ∧
      ∀ x ∈ U, ∃! M : Ideal B, M.IsMaximal ∧ M.comap φ = x.asIdeal)
    (huniv : ∀ x ∈ U, ∀ k : ℕ,
      ∃! g : B →ₐ[K] A ⧸ x.asIdeal ^ (k + 1), g.comp φ = Ideal.Quotient.mkₐ K _) :
    IsAffinoidSubdomain K U := sorry

end AffinoidSubdomain

/-! ## AdicSpacesPartII:F1/dagger-affinoid-subdomain-completion (lemma) -/

-- Dagger.IsAffinoidSubdomain.completion: not stated here; needs affinoid subdomains, stalks and
--   Runge immersions of the rigid space Sp(Â) (supplier: AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/dagger-tate-acyclicity (theorem) -/

section TateAcyclicity

open TensorProduct

universe u

variable {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type u} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-tate-acyclicity, in degrees `0` and `1`: for a finite covering of `Sp(A)` by affinoid
subdomains and any `A`-module `M`, `M → ∏ᵢ O(Uᵢ) ⊗ M → ∏ᵢⱼ O(Uᵢ ∩ Uⱼ) ⊗ M` is exact. -/
theorem cech_exact {ι : Type} [Fintype ι] (U : ι → Set (MaximalSpectrum A))
    (hU : ∀ i, IsAffinoidSubdomain K (U i)) (hcov : ⋃ i, U i = Set.univ)
    (hUU : ∀ i j, IsAffinoidSubdomain K (U i ∩ U j)) (M : Type u) [AddCommGroup M] [Module A M] :
    Function.Injective (fun m : M ↦ fun i ↦ (1 : (hU i).algebra) ⊗ₜ[A] m) ∧
      ∀ s : ∀ i, (hU i).algebra ⊗[A] M,
        (∀ i j, LinearMap.rTensor M
            ((hU i).restrictTo (hUU i j) Set.inter_subset_left).toLinearMap (s i) =
          LinearMap.rTensor M
            ((hU j).restrictTo (hUU i j) Set.inter_subset_right).toLinearMap (s j)) →
        ∃ m : M, ∀ i, s i = (1 : (hU i).algebra) ⊗ₜ[A] m := sorry

end TateAcyclicity

/-! ## AdicSpacesPartII:F1/dagger-g-topology (lemma) -/

-- Dagger.isAffinoidSubdomain_iff_completion: not stated here; needs the G-topology of the rigid
--   space Sp(Â) (supplier: AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/dagger-strict-differentials (lemma) -/

section StrictDifferentials

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- F1/dagger-strict-differentials, affinoid case in degree `0`: for `K` discretely valued of
characteristic `0` and `A` regular (`Sp A` smooth), `d : A → Ω¹_A` has closed image for the fringe
topology. The Stein case needs dagger spaces (AdicSpacesPartII:F1/dagger-space). -/
theorem deRham_d_isClosed_range [CharZero K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k) [IsRegularRing A] :
    @IsClosed (Omega K A) (moduleFringeTopology K A (Omega K A)) (Set.range (Omega.d K A)) := sorry

end StrictDifferentials

end Dagger

/-! # Items that need dagger spaces or rigid-analytic spaces

Dagger spaces, rigid-analytic spaces, their sheaves, morphisms and cohomology are in neither pinned
library, so these items are comments; ring-level cores are stated where they exist. -/

namespace DaggerSpace

open Dagger

/-! ## AdicSpacesPartII:F1/dagger-space (definition) -/
-- DaggerSpace: not stated here; needs rigid-analytic spaces with their G-topology and structure
--   sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.Hom: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.Sp: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.Sp_fullyFaithful: not stated here; needs rigid-analytic spaces with their
--   G-topology and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.sections_rational: not stated here; needs rigid-analytic spaces with their
--   G-topology and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.restrict: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.fibreProduct: not stated here; needs rigid-analytic spaces with their G-topology
--   and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.baseChange: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.equivAdic: not stated here; needs adic spaces locally of finite type over Spa(K,
--   O_K) and dagger spaces (supplier:
--   tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry,
--   AdicSpacesPartII:R1/rigid-adic-comparison-functor)
-- DaggerSpace.disc: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.stalk_iso: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace_test_disc: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [computation test]
-- DaggerSpace_test_point: not stated here; needs rigid-analytic spaces with their G-topology and
--   structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]
-- DaggerSpace_test_not_full_sheaf: not stated here; needs rigid-analytic spaces with their
--   G-topology and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
--   [non-example test]
-- DaggerSpace_test_underlying: not stated here; needs rigid-analytic spaces with their G-topology
--   and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [compatibility test]
-- DaggerSpace_test_morphisms: not stated here; needs rigid-analytic spaces with their G-topology
--   and structure sheaf (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [characterisation
--   test]

/-! ## AdicSpacesPartII:F1/dagger-coherent-module (definition) -/
-- Its ring-level core, finite modules over a dagger algebra and their descent to fringe stages,
--   is `Dagger.FringePresentation.exists_module_descent`.
-- DaggerSpace.tilde: not stated here; needs sheaves of modules on dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsCoherent: not stated here; needs sheaves of modules on dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsCoherent.tilde: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsCoherent.kernel: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsCoherent.pullback: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.coherentIdeal_closedImmersion: not stated here; needs sheaves of modules on dagger
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsCoherent.toRigid: not stated here; needs coherent sheaves on dagger and rigid
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R3/coherent-sheaf)
-- DaggerSpace.IsLocallyFree: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- IsCoherent_test_skyscraper: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- IsCoherent_test_zero: not stated here; needs sheaves of modules on dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- IsCoherent_test_not_coherent: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- IsCoherent_test_rigid: not stated here; needs sheaves of modules on dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [compatibility test]

/-! ## AdicSpacesPartII:F1/dagger-coherent-affinoid-kiehl (theorem) -/
-- Its ring-level core is `Dagger.FringePresentation.exists_module_descent`.
-- DaggerSpace.coherent_affinoid_equiv: not stated here; needs sheaves of modules on dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-coherent-theorem-b (theorem) -/
-- Its ring-level core in degree one is `Dagger.cech_exact` (F1/dagger-tate-acyclicity).
-- DaggerSpace.affinoid_cohomology_vanishing: not stated here; needs dagger spaces and sheaf
--   cohomology on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/strict-neighbourhood (definition) -/
-- DaggerSpace.IsStrictNeighbourhood: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.isStrictNeighbourhood_iff_closure: not stated here; needs rigid-analytic spaces and
--   their admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.IsStrictNeighbourhood.inter: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.IsStrictNeighbourhood.mono: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.IsStrictNeighbourhood.trans: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.IsStrictNeighbourhood.preimage: not stated here; needs rigid-analytic spaces and
--   their admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.isStrictNeighbourhood_fringe: not stated here; needs rigid-analytic spaces and
--   their admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.IsStrictNeighbourhood.sections: not stated here; needs rigid-analytic spaces and
--   their admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.daggerIncl: not stated here; needs rigid-analytic spaces and their admissible
--   coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space)
-- IsStrictNeighbourhood_test_discs: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [computation test]
-- IsStrictNeighbourhood_test_whole: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]
-- IsStrictNeighbourhood_test_self: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [non-example test]
-- IsStrictNeighbourhood_test_closure: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [compatibility
--   test]
-- IsStrictNeighbourhood_test_cofinal: not stated here; needs rigid-analytic spaces and their
--   admissible coverings (supplier: AdicSpacesPartII:R1/rigid-analytic-space) [characterisation
--   test]

/-! ## AdicSpacesPartII:F1/overconvergent-sections-formula (lemma) -/
-- Its ring-level core, `A = colim_ρ A_ρ`, is `Dagger.FringePresentation.isColimit`.
-- DaggerSpace.sections_eq_colim_strictNbhd: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-partially-proper (definition) -/
-- DaggerSpace.RelCompact: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsPartiallyProper: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsProper: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsStein: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.isPartiallyProper_iff_toRigid: not stated here; needs morphisms of dagger spaces
--   and partially proper morphisms of adic spaces (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R0/partially-proper-morphism)
-- DaggerSpace.IsPartiallyProper.comp: not stated here; needs morphisms of dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsStein.isPartiallyProper: not stated here; needs morphisms of dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsStein.interior: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- IsStein_test_open_disc: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [computation test]
-- IsPartiallyProper_test_point: not stated here; needs morphisms of dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- IsPartiallyProper_test_closed_disc: not stated here; needs morphisms of dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- IsPartiallyProper_test_analytification: not stated here; needs morphisms of dagger spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility test]

/-! ## AdicSpacesPartII:F1/dagger-to-rigid-functor (construction) -/
-- DaggerSpace.toRigidFunctor: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigidFunctor.faithful: not stated here; needs dagger spaces and rigid-analytic
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid_Sp: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid.structureInclusion: not stated here; needs dagger spaces and rigid-analytic
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid_isClosedImmersion_iff: not stated here; needs dagger spaces and
--   rigid-analytic spaces (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid_isConnected_iff: not stated here; needs dagger spaces and rigid-analytic
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.toRigid_isFinite: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.exists_daggerModel_of_quasialgebraic: not stated here; needs dagger spaces and
--   rigid-analytic spaces (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R1/rigid-analytic-space)
-- DaggerSpace.coherentToRigid: not stated here; needs coherent sheaves on dagger and rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R3/coherent-sheaf)
-- DaggerSpace.toRigid_rigidToAdic_Sp: not stated here; needs the comparison of rigid and adic
--   spaces and dagger spaces (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor,
--   AdicSpacesPartII:F1/dagger-space)
-- toRigid_test_disc: not stated here; needs dagger spaces and rigid-analytic spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space) [computation
--   test]
-- toRigid_test_not_full: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)
--   [non-example test]
-- toRigid_test_point: not stated here; needs dagger spaces and rigid-analytic spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space) [degenerate test]
-- toRigid_test_rigidToAdic: not stated here; needs the comparison of rigid and adic spaces and
--   dagger spaces (supplier: AdicSpacesPartII:R1/rigid-adic-comparison-functor,
--   AdicSpacesPartII:F1/dagger-space) [compatibility test]
-- toRigid_test_stalk: not stated here; needs dagger spaces and rigid-analytic spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space) [characterisation
--   test]

/-! ## AdicSpacesPartII:F1/partially-proper-coherent-equivalence (theorem) -/
-- DaggerSpace.coherentEquiv_of_isPartiallyProper: not stated here; needs dagger spaces and
--   rigid-analytic spaces (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/partially-proper-dagger-rigid-equivalence (theorem) -/
-- DaggerSpace.partiallyProperEquiv: not stated here; needs dagger spaces and rigid-analytic
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/dagger-coherent-cohomology-comparison (theorem) -/
-- DaggerSpace.cohomology_toRigid: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/dagger-analytification (construction) -/
-- DaggerSpace.analytification: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification_toRigid: not stated here; needs dagger spaces and rigid
--   analytification (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R1/rigid-analytification)
-- DaggerSpace.analytification.map: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification.isPartiallyProper: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification_affineSpace: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification.fibreProduct: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification.openImmersion: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.analytification.gaga: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- analytification_test_line: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [computation test]
-- analytification_test_point: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- analytification_test_not_affinoid: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [non-example test]
-- analytification_test_rigid: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [compatibility test]
-- analytification_test_gaga: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [characterisation test]

/-! ## AdicSpacesPartII:F1/dagger-identity-principle (lemma) -/
-- DaggerSpace.eq_zero_of_eqOn_open: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-smooth-space (definition) -/
-- DaggerSpace.IsSmooth: not stated here; needs dagger spaces and smooth morphisms of adic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R0/smooth-morphism)
-- DaggerSpace.isSmooth_iff_affinoid: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsSmooth.locallyEtale: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsSmooth.omega_locallyFree: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsSmooth.open: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsSmooth.analytification: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IsSmooth.weakCompletion: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.pureDimension: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space)
-- IsSmooth_test_polydisc: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [computation test]
-- IsSmooth_test_point: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- IsSmooth_test_node: not stated here; needs dagger spaces (supplier:
--   AdicSpacesPartII:F1/dagger-space) [non-example test]
-- IsSmooth_test_rigid: not stated here; needs dagger spaces and smooth morphisms of adic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R0/smooth-morphism)
--   [compatibility test]

/-! ## AdicSpacesPartII:F1/dagger-de-rham-complex (construction) -/
-- Its ring-level core for `X = Sp A` is `DaggerSpace.deRhamComplex_affinoid` below.
-- DaggerSpace.deRhamComplex: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IntegrableConnection: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IntegrableConnection.deRhamComplex: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRham: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRham_affinoid: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamComplex.d_comp_d: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRham.pullback: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRham.toRigid: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRham_zero: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.IntegrableConnection.tensor: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- deRham_test_disc: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- deRham_test_point: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- deRham_test_rigid_disc: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- deRham_test_annulus: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- deRham_test_mw: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility test]

section DeRhamCore

open CategoryTheory

universe u

/-- F1/dagger-de-rham-complex, ring-level core of `DaggerSpace.deRhamComplex` on `X = Sp A`: the
overconvergent de Rham complex `Ω^•_A = ⋀^•_A Ω¹_A` of a dagger algebra, with the differential of
`Dagger.Omega.dComp`, as a cochain complex of `K`-vector spaces. -/
def deRhamComplex_affinoid (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (A : Type u) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] :
    CochainComplex (ModuleCat.{u} K) ℕ := sorry

end DeRhamCore

/-! ## AdicSpacesPartII:F1/dagger-polyannulus-de-rham-cohomology (lemma) -/

section Polydisc

open CategoryTheory

universe u

variable {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- F1/dagger-polyannulus-de-rham-cohomology (a), the closed dagger polydisc (`r = 0`): in
characteristic zero `H^q_dR(Sp W_n) = 0` for `q > 0`. The polyannuli with `r > 0`, the Künneth
formula and the open version need dagger spaces (AdicSpacesPartII:F1/dagger-space). -/
theorem _root_.TauCeti.Dagger.deRham_polydisc [CharZero K] (n q : ℕ) (hq : 0 < q) :
    Limits.IsZero ((deRhamComplex_affinoid K (washnitzerAlgebra n K)).homology q) := sorry

/-- F1/dagger-polyannulus-de-rham-cohomology (a): `H^0_dR(Sp W_n) = K`. -/
theorem _root_.TauCeti.Dagger.deRham_polydisc_zero [CharZero K] (n : ℕ) :
    Nonempty ((deRhamComplex_affinoid K (washnitzerAlgebra n K)).homology 0 ≅ ModuleCat.of K K) :=
  sorry

end Polydisc

/-! ## AdicSpacesPartII:F1/dagger-rigid-de-rham-comparison (theorem) -/
-- DaggerSpace.deRham_toRigid_iso: not stated here; needs dagger spaces and rigid-analytic spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/dagger-de-rham-rigid-invariance (theorem) -/
-- DaggerSpace.deRham_congr_of_rigid_iso: not stated here; needs dagger spaces and rigid-analytic
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R1/rigid-analytic-space)

/-! ## AdicSpacesPartII:F1/de-rham-cohomology-with-supports (construction) -/
-- DaggerSpace.deRhamSupport: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport.triangle: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport.excision: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport.mayerVietoris: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport.nested: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport.pullback: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.deRhamSupport_empty: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- deRhamSupport_test_disc: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- deRhamSupport_test_empty: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- deRhamSupport_test_not_cohomology_of_Y: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
--   [non-example test]
-- deRhamSupport_test_coherent: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility
--   test]

/-! ## AdicSpacesPartII:F1/dagger-local-cohomology-comparison (lemma) -/
-- DaggerSpace.gysin: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-resolution-lemma (lemma) -/
-- DaggerSpace.exists_resolution: not stated here; needs dagger spaces, proper morphisms and
--   normal crossings divisors (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-finite-etale-trace (lemma) -/
-- DaggerSpace.deRhamTrace: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-proper-modification-sequence (lemma) -/
-- DaggerSpace.properModification_exact: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-semistable-tube-invariance (theorem) -/
-- DaggerSpace.semistableTube_restrict_bijective: not stated here; needs strictly semistable
--   formal schemes, their tubes and dagger spaces (supplier: AdicSpacesPartII:R2/tube,
--   AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-semistable-tube-finiteness (theorem) -/
-- DaggerSpace.semistableTube_finiteDimensional: not stated here; needs strictly semistable formal
--   schemes, their tubes and dagger spaces (supplier: AdicSpacesPartII:R2/tube,
--   AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-de-rham-finite-field-extension (lemma) -/
-- DaggerSpace.deRham_baseChange: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/quasi-algebraic-affinoid-finiteness (lemma) -/
-- DaggerSpace.hdR_finite: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-de-rham-finiteness-and-base-change (theorem) -/
-- DaggerSpace.deRham_finiteDimensional: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-de-rham-kunneth (theorem) -/
-- DaggerSpace.kunneth: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/compact-support-de-rham (construction) -/
-- DaggerSpace.compactSupport: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupportDeRham: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport_independent: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport.longExact: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport.extensionByZero: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport.vanishing: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport.module: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactSupport_top_polydisc: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- compactSupport_test_disc: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- compactSupport_test_point: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- compactSupport_test_not_ordinary: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- compactSupport_test_rd4: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility test]
-- compactSupport_test_serre: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [characterisation
--   test]

/-! ## AdicSpacesPartII:F1/dagger-serre-duality (theorem) -/
-- DaggerSpace.serreDuality: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-poincare-duality (theorem) -/
-- DaggerSpace.poincareDuality: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

/-! ## AdicSpacesPartII:F1/dagger-snc-divisor (definition) -/
-- DaggerSpace.IsSNCDivisor: not stated here; needs dagger spaces and smooth pairs of rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.isSNCDivisor_iff_toRigid: not stated here; needs dagger spaces and smooth pairs
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.exists_coordinates: not stated here; needs dagger spaces and smooth
--   pairs of rigid spaces (supplier: AdicSpacesPartII:F1/dagger-space,
--   AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.components: not stated here; needs dagger spaces and smooth pairs of
--   rigid spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.inter: not stated here; needs dagger spaces and smooth pairs of rigid
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.ideal: not stated here; needs dagger spaces and smooth pairs of rigid
--   spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.complement: not stated here; needs dagger spaces and smooth pairs of
--   rigid spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.analytification: not stated here; needs dagger spaces and smooth pairs
--   of rigid spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- DaggerSpace.IsSNCDivisor.restrict: not stated here; needs dagger spaces and smooth pairs of
--   rigid spaces (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair)
-- IsSNCDivisor_test_axes: not stated here; needs dagger spaces and smooth pairs of rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair) [computation
--   test]
-- IsSNCDivisor_test_empty: not stated here; needs dagger spaces and smooth pairs of rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair) [degenerate
--   test]
-- IsSNCDivisor_test_cusp: not stated here; needs dagger spaces and smooth pairs of rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair) [non-example
--   test]
-- IsSNCDivisor_test_rigid: not stated here; needs dagger spaces and smooth pairs of rigid spaces
--   (supplier: AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:R4/smooth-pair) [compatibility
--   test]

/-! ## AdicSpacesPartII:F1/log-de-rham-complex (construction) -/
-- DaggerSpace.logOmega: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logOmega_basis: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.incl: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.residue: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.residue_exact: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.wedge: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.pullback: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex.toRigid: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRham: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.logDeRhamComplex_empty: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- logDeRham_test_polydisc: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- logDeRham_test_empty: not stated here; needs dagger spaces with hypercohomology of complexes of
--   sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- logDeRham_test_not_meromorphic: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- logDeRham_test_gk_monodromy: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility
--   test]
-- logDeRham_test_residue: not stated here; needs dagger spaces with hypercohomology of complexes
--   of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [characterisation test]

/-! ## AdicSpacesPartII:F1/compact-support-log-complex (construction) -/
-- DaggerSpace.compactLogDeRhamComplex: not stated here; needs dagger spaces with hypercohomology
--   of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex_le: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRham: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex_restrict: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex_coordinates: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex.pullback: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex.connection: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- DaggerSpace.compactLogDeRhamComplex_empty: not stated here; needs dagger spaces with
--   hypercohomology of complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)
-- compactLogDeRham_test_P1: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [computation test]
-- compactLogDeRham_test_empty: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [degenerate test]
-- compactLogDeRham_test_naive_twist: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [non-example test]
-- compactLogDeRham_test_restrict: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space) [compatibility
--   test]

/-! ## AdicSpacesPartII:F1/compact-support-localisation-maps (lemma) -/
-- DaggerSpace.compactLog_shortExact: not stated here; needs dagger spaces with hypercohomology of
--   complexes of sheaves on them (supplier: AdicSpacesPartII:F1/dagger-space)

end DaggerSpace

end TauCeti

end
