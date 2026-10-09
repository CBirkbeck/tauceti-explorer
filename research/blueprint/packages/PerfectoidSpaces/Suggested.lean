import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Cont.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.ResidueField
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basis
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Spectral
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.Completion
import TauCeti.RingTheory.Huber.LocalizationTopology.Plus
import TauCeti.RingTheory.Huber.LocalizationTopology.Presentation
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.TopologicallyFiniteType
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.PairOfDefinition
import TauCeti.Topology.Algebra.IsUniformGroup.Subring

/-!
# PerfectoidSpaces: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned Tau Ceti and Mathlib APIs. It is not an
exhaustive list of the results in any layer: each layer keeps its principal objects, its headline
theorems and a few API statements, with unit tests as `example`s.

Design choices made explicit here.

* A perfectoid Tate ring (`Perfectoid.IsPerfectoidTateRing p R`) is ECD Definition 3.1 with real
  fields over Tau Ceti's `IsTateRing`: a complete Hausdorff uniform Tate ring with a
  pseudo-uniformiser `ϖ ∈ R°` such that `ϖ ^ p ∣ p` in `R°` and Frobenius `R°/ϖ → R°/ϖ^p` is
  bijective. No base field is fixed. Tilts are built on Mathlib's `Perfection`, Fontaine's `θ`
  on `WittVector.fontaineTheta`, and the comparisons with Mathlib's `PreTilt` and `PreTilt.untilt`
  are stated.
* Almost mathematics is relative to an explicit basic setup `Almost.BasicSetup V` (an idempotent
  ideal `m` with `m ⊗_V m` flat, GR §2.1), a structure rather than a class. The almost module
  category is Mathlib's Serre-class localisation of `ModuleCat V` at the almost isomorphisms.
* Huber pairs, rational subsets and completed localisation are Tau Ceti's (`Huber.Pair`,
  `ValuationSpectrum.spa`, `rationalSubset`, `PairOfDefinition.completionLocObj`); statements
  about `𝒪_X(U)` are made per presentation.
* The carriers of AdicSpacesPartII Layer 0 that the signatures need (adic ring maps, completed
  tensor products of Huber pairs, the spectral topology and the uniformisation, finite morphisms
  of Huber pairs) are declared first, in the library namespace `TauCeti.Huber`, so that dot
  notation on `Huber.Pair` works; they are the forms that roadmap specifies, so that a port replaces them by imports.
* Perfectoid *spaces* are a full subcategory of adic spaces, which neither pinned library has.
  Statements about spaces are therefore made on their affinoid cores (suffix `_affinoid`) and
  on the pair-level data; the global statements are in `README.md`.
-/

/-! ## Carriers from AdicSpacesPartII Layer 0 -/
noncomputable section

namespace TauCeti

open TensorProduct UniformSpace Topology Filter

namespace Huber

section AdicHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]

/-- `φ : A → B` is *adic* if there
are pairs of definition `(A₀, I)` of `A` and `(B₀, J)` of `B` with `φ(A₀) ⊆ B₀` and
`J = φ(I)·B₀` (Huber 1994 §3, Wedhorn Definition 6.23). -/
class IsAdicHom (φ : A →+* B) : Prop where
  /-- Pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀`. -/
  exists_pairOfDefinition : ∃ (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition),
    Q.idealOfDefinition = P.idealOfDefinition.map (φ.restrict _ _ h)

/-- An adic homomorphism is continuous. -/
theorem IsAdicHom.continuous (φ : A →+* B) [IsAdicHom φ] : Continuous φ := sorry

end AdicHom

section CompletedTensor

variable (A B C : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [Algebra A B] [Algebra A C]

/-- The group topology on `B ⊗[A] C`
with fundamental system of neighbourhoods `{Iⁿ·F}`, `F` the image of `B₀ ⊗_{A₀} C₀`. -/
@[instance_reducible]
def tensorTopology : TopologicalSpace (B ⊗[A] C) := sorry

/-- `tensorTopology` is a ring
topology. -/
theorem isTopologicalRing_tensorTopology :
    @IsTopologicalRing (B ⊗[A] C) (tensorTopology A B C) _ := sorry

/-- The canonical uniformity of
`tensorTopology`. -/
@[instance_reducible]
def tensorUniformSpace : UniformSpace (B ⊗[A] C) :=
  letI := tensorTopology A B C
  haveI := isTopologicalRing_tensorTopology A B C
  IsTopologicalAddGroup.rightUniformSpace (B ⊗[A] C)

/-- The carrier `B ⊗̂_A C`, the
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

/-- `B ⊗[A] C → B ⊗̂_A C`. -/
def Pair.completedTensor.tmul : B ⊗[A] C →+* CompletedTensor A B C := sorry

instance : Algebra A (CompletedTensor A B C) :=
  ((Pair.completedTensor.tmul A B C).comp (algebraMap A (B ⊗[A] C))).toAlgebra

/-- The pair of definition of
`B ⊗̂_A C` for adic structure maps. -/
def Pair.completedTensor.pairOfDefinition [IsAdicHom (algebraMap A B)]
    [IsAdicHom (algebraMap A C)] : PairOfDefinition (CompletedTensor A B C) := sorry

instance [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)] :
    IsHuberRing (CompletedTensor A B C) :=
  ⟨⟨Pair.completedTensor.pairOfDefinition A B C⟩⟩

variable {A B C} [IsHuberRing A] [IsHuberRing B] [IsHuberRing C] [IsAdicHom (algebraMap A B)]
  [IsAdicHom (algebraMap A C)]

/-- The completed
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

/-- `inr : (C, C⁺) → B ⊗̂_A C`. -/
def Pair.completedTensor.inr : Pair.Hom U (Pair.completedTensor S T U hT hU) where
  toRingHom := (Pair.completedTensor.tmul A B C).comp
    (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom
  continuous_toRingHom := sorry
  map_mem_plus := sorry

end CompletedTensor

/-- The type synonym `A_sp` of a Tate ring,
carrying the spectral topology, whose neighbourhoods of `0` are the `ϖⁿ·A°°`. -/
def SpectralTop (A : Type*) : Type _ := A

section Uniformization

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

instance : CommRing (SpectralTop A) := inferInstanceAs (CommRing A)

/-- The uniformity of the spectral topology. -/
instance : UniformSpace (SpectralTop A) := sorry

instance : IsUniformAddGroup (SpectralTop A) := sorry

instance : IsTopologicalRing (SpectralTop A) := sorry

/-- The identity `A ≃+* A_sp`. -/
def toSpectralTop : A ≃+* SpectralTop A := RingEquiv.refl A

/-- `A_sp` is a Tate ring. -/
instance SpectralTop.isTateRing : IsTateRing (SpectralTop A) := sorry

variable (A) in
/-- The uniformisation `Aᵘ` of a Tate ring,
the completion of `A_sp`. -/
abbrev Uniformization : Type _ := Completion (SpectralTop A)

/-- The Huber pair `(Aᵘ, Aᵘ⁺)`, `Aᵘ⁺` the closure
of the image of `A⁺` (Kedlaya–Liu Definition 2.8.13). -/
def Pair.uniformization (S : Pair A) : Pair (Uniformization A) where
  plus := ((S.plus.map (toSpectralTop : A ≃+* SpectralTop A).toRingHom).map
    (Completion.coeRingHom : SpectralTop A →+* Completion (SpectralTop A))).topologicalClosure
  isRingOfIntegralElements := sorry

/-- `ι : (A, A⁺) → (Aᵘ, Aᵘ⁺)`. -/
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

/-- Over a Tate ring,
`B ⊗̂_A C` is a Tate ring. -/
instance Pair.completedTensor.instIsTateRing : IsTateRing (CompletedTensor A B C) := sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- `B ⊗̂ᵘ_A C`, the
uniformisation of `B ⊗̂_A C`. -/
def Pair.uniformCompletedTensor : Pair (Uniformization (CompletedTensor A B C)) :=
  (Pair.completedTensor S T U hT hU).uniformization

/-- `inrᵘ = ι ∘ inr`. -/
def Pair.uniformCompletedTensor.inr : Pair.Hom U (Pair.uniformCompletedTensor S T U hT hU) :=
  (Pair.toUniformization _).comp (Pair.completedTensor.inr S T U hT hU)

end UniformCompletedTensor

section HomIsFinite

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- A morphism of Huber pairs is
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

/-! ## Layer 0: Almost mathematics over a basic setup -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

universe u

open _root_.CategoryTheory Limits MonoidalCategory TensorProduct

namespace Almost

/-- A *basic setup* `(V, m)`: an ideal `m` of `V` with
`m * m = m` (Gabber–Ramero's basic setup, GR (2.1.1)) such that `m̃ = m ⊗_V m` is flat (GR's
standing assumption from (2.5.14) on). Data, not a class: one ring carries several setups. -/
structure BasicSetup (V : Type u) [CommRing V] where
  /-- The ideal `m`. -/
  ideal : Ideal V
  /-- `m * m = m`, in the semiring `Ideal V`. -/
  isIdempotentElem : IsIdempotentElem ideal
  /-- `m̃ = m ⊗_V m` is a flat `V`-module. -/
  flat_tilde : Module.Flat V (ideal ⊗[V] ideal)

namespace BasicSetup

variable {V : Type u} [CommRing V] (S : BasicSetup V)

/-- The `V`-module `m̃ := m ⊗_V m` (GR (2.1.1)). -/
abbrev tilde : Type u := S.ideal ⊗[V] S.ideal

/-- The multiplication map `m̃ → V`, `x ⊗ y ↦ xy`, whose image is
`m · m = m` (GR (2.1.1)). -/
def tildeMul : S.tilde →ₗ[V] V :=
  TensorProduct.lift ((LinearMap.mul V V).compl₁₂ S.ideal.subtype S.ideal.subtype)

/-- `m * m = m` (GR (2.1.1)). -/
@[simp] theorem ideal_mul_self : S.ideal * S.ideal = S.ideal := sorry

/-- A `V`-module `M` is *almost zero* if `m · M = 0`
(GR (2.1.3)). -/
def IsAlmostZero (M : Type*) [AddCommGroup M] [Module V M] : Prop :=
  ∀ ε ∈ S.ideal, ∀ x : M, ε • x = 0

/-- The almost zero `V`-modules, as an object property of
`ModuleCat V` (GR (2.2.2)). -/
def almostZero : ObjectProperty (ModuleCat.{u} V) := fun M ↦ S.IsAlmostZero M

/-- The classical setup `(V, V)`, the "classical limit" of
GR Example 2.1.2(ii). -/
def classical (V : Type u) [CommRing V] : BasicSetup V where
  ideal := ⊤
  isIdempotentElem := sorry
  flat_tilde := sorry

/-- For the classical setup, almost zero means zero
(GR Example 2.1.2(ii)). -/
theorem isAlmostZero_classical_iff (M : Type*) [AddCommGroup M] [Module V M] :
    (classical V).IsAlmostZero M ↔ Subsingleton M := sorry

/-- The base change `(W, m·W)` of a setup along `V → W`
(GR Remark 2.1.4(ii)). -/
def baseChange (W : Type*) [CommRing W] [Algebra V W] : BasicSetup W where
  ideal := S.ideal.map (algebraMap V W)
  isIdempotentElem := sorry
  flat_tilde := sorry

example (M : Type u) [AddCommGroup M] [Module V M] :
    (classical V).ideal = ⊤ ∧ ((classical V).IsAlmostZero M ↔ Subsingleton M) := sorry

example : ∃ S : BasicSetup V, S.ideal = ⊥ ∧
    ∀ (M : Type u) [AddCommGroup M] [Module V M], S.IsAlmostZero M := sorry

example (p : ℕ) [Fact p.Prime] : ¬ IsIdempotentElem (IsLocalRing.maximalIdeal ℤ_[p]) := sorry

/-- The *root setup* of a sequence `ϖ` with
`ϖ (n + 1) ^ p = ϖ n`, `p ≥ 2`: the ideal `m = ⋃ ϖ_n V` (ECD Definition 3.21, Bhatt Example
4.1.3). -/
def ofCompatibleRoots (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V) (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) :
    BasicSetup V where
  ideal := Ideal.span (Set.range ϖ)
  isIdempotentElem := sorry
  flat_tilde := sorry

section roots

open scoped Pointwise

variable (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V) (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n)

/-- The ideal of the root setup (ECD Definition 3.21). -/
@[simp] theorem ofCompatibleRoots_ideal :
    (ofCompatibleRoots p hp ϖ hϖ).ideal = Ideal.span (Set.range ϖ) := rfl

/-- `x ∈ m` iff some `ϖ_n` divides `x`, `m` being
the increasing union of the `ϖ_n V` (Bhatt Example 4.1.3). -/
theorem mem_ofCompatibleRoots_ideal (x : V) :
    x ∈ (ofCompatibleRoots p hp ϖ hϖ).ideal ↔ ∃ n, ϖ n ∣ x := sorry

/-- Every `ϖ_n` lies in the ideal of the root setup. -/
@[simp] theorem ofCompatibleRoots_mem (n : ℕ) : ϖ n ∈ (ofCompatibleRoots p hp ϖ hϖ).ideal :=
  sorry

end roots

example (p : ℕ) (hp : 2 ≤ p) (t : ℕ → V) (ht : ∀ n, t (n + 1) ^ p = t n)
    (hnz : t 1 ∉ Ideal.span {t 0}) :
    ¬ (ofCompatibleRoots p hp t ht).IsAlmostZero (V ⧸ Ideal.span {t 0}) ∧
      (ofCompatibleRoots p hp t ht).IsAlmostZero (V ⧸ (ofCompatibleRoots p hp t ht).ideal) :=
  sorry

example (p : ℕ) (hp : 2 ≤ p) :
    ofCompatibleRoots p hp (fun _ ↦ (1 : V)) (fun _ ↦ one_pow p) = classical V := sorry

example (p : ℕ) [Fact p.Prime] :
    ¬ IsIdempotentElem (Ideal.span {(Polynomial.X : Polynomial (ZMod p))}) := sorry

/-- The setup `(O, 𝔪)` of a valuation domain whose
maximal ideal is not finitely generated (GR Example 2.1.2(i), Sch12 Lemma 4.2, ECD Example
3.22(i)). -/
def ofValuationRing (O : Type u) [CommRing O] [IsDomain O] [ValuationRing O]
    (h : ¬ (IsLocalRing.maximalIdeal O).FG) : BasicSetup O where
  ideal := IsLocalRing.maximalIdeal O
  isIdempotentElem := sorry
  flat_tilde := sorry

/-- Almost zero modules form a Serre class of `ModuleCat V`: they are
closed under submodules, quotients and extensions (Sch12 Lemma 4.2, GR (2.2.2)). -/
instance almostZero_isSerreClass : S.almostZero.IsSerreClass := sorry

/-- Almost zero modules form a tensor ideal (GR (2.2.2)). -/
theorem isAlmostZero_tensor_left (M N : Type*) [AddCommGroup M] [Module V M] [AddCommGroup N]
    [Module V N] (hM : S.IsAlmostZero M) : S.IsAlmostZero (M ⊗[V] N) := sorry

/-- `Hom_V(M, N)` and `Hom_V(N, M)` are almost zero if `M` is
(GR (2.2.2)). -/
theorem isAlmostZero_linearMap (M N : Type*) [AddCommGroup M] [Module V M] [AddCommGroup N]
    [Module V N] (hM : S.IsAlmostZero M) :
    S.IsAlmostZero (M →ₗ[V] N) ∧ S.IsAlmostZero (N →ₗ[V] M) := sorry

/-- The multiplication `m̃ ⊗_V M → M`, `x ⊗ y ⊗ z ↦ (xy) • z`
(Bhatt Construction 4.1.5). -/
def tildeAct (M : Type*) [AddCommGroup M] [Module V M] : S.tilde ⊗[V] M →ₗ[V] M :=
  TensorProduct.lift ((LinearMap.lsmul V M).comp S.tildeMul)

/-- `M` is *firm* if `m̃ ⊗_V M → M` is bijective
(Bhatt Construction 4.1.5). -/
def IsFirm (M : Type*) [AddCommGroup M] [Module V M] : Prop :=
  Function.Bijective (S.tildeAct M)

/-- The firm modules, as an object property of `ModuleCat V`. -/
def isFirm : ObjectProperty (ModuleCat.{u} V) := fun M ↦ S.IsFirm M

/-- The full subcategory of firm `V`-modules
(Bhatt Construction 4.1.5). -/
abbrev Firm : Type (u + 1) := S.isFirm.FullSubcategory

/-- The inclusion `j_! : S.Firm ⥤ ModuleCat V`
(Bhatt Construction 4.1.5). -/
abbrev Firm.ι : S.Firm ⥤ ModuleCat.{u} V := S.isFirm.ι

/-- `j^* : M ↦ m̃ ⊗_V M`, which lands in firm modules since
`m̃ ⊗ m̃ ≅ m̃` (Bhatt Construction 4.1.5). -/
def firm : ModuleCat.{u} V ⥤ S.Firm :=
  S.isFirm.lift (tensorLeft (ModuleCat.of V S.tilde)) (fun _ ↦ sorry)

/-- `j_* : N ↦ Hom_V(m̃, N)` (Bhatt Construction 4.1.5). -/
def closure : S.Firm ⥤ ModuleCat.{u} V :=
  Firm.ι S ⋙ ihom (ModuleCat.of V S.tilde)

/-- `j^* ⊣ j_*` (Bhatt Construction 4.1.5). -/
def firmAdj : S.firm ⊣ S.closure := sorry

/-- `j_*` is fully faithful (Bhatt Proposition 4.1.7(2)). -/
instance : S.closure.Full := sorry

/-- `j_*` is fully faithful (Bhatt Proposition 4.1.7(2)). -/
instance : S.closure.Faithful := sorry

end BasicSetup

variable {V : Type u} [CommRing V] (S : BasicSetup V)

/-- The almost isomorphisms form a monoidal morphism property of
`ModuleCat V` (GR (2.2.5)). -/
instance isoModSerre_isMonoidal : S.almostZero.isoModSerre.IsMonoidal := sorry

namespace Module

/-- `N^a` is *almost finitely generated*: for
every finitely generated `m₀ ⊆ m` there is `φ : Vⁿ → N` whose cokernel is killed by `m₀`
(GR Proposition 2.3.10(i)). For an almost algebra `A`, apply it to `S.baseChange A_*` and `M_*`. -/
def AlmostFG (S : BasicSetup V) (N : Type*) [AddCommGroup N] [_root_.Module V N] : Prop :=
  ∀ m₀ : Ideal V, m₀ ≤ S.ideal → m₀.FG → ∃ (n : ℕ) (φ : (Fin n → V) →ₗ[V] N),
    ∀ ε ∈ m₀, ∀ x : N, ε • x ∈ LinearMap.range φ

/-- *uniformly* almost finitely generated with
bound `n`: one `n` works for every `m₀` (GR Definition 2.3.8(iii), Remark 2.3.9). -/
def UniformlyAlmostFG (S : BasicSetup V) (N : Type*) [AddCommGroup N] [_root_.Module V N]
    (n : ℕ) : Prop :=
  ∀ m₀ : Ideal V, m₀ ≤ S.ideal → m₀.FG → ∃ φ : (Fin n → V) →ₗ[V] N,
    ∀ ε ∈ m₀, ∀ x : N, ε • x ∈ LinearMap.range φ

/-- *almost finitely presented*: for every
finitely generated `m₀ ⊆ m` there is a complex `V^k → Vⁿ → N` with `m₀ · coker φ = 0` and
`m₀ · ker φ ⊆ im ψ` (GR Proposition 2.3.10(ii)(c)). -/
def AlmostFP (S : BasicSetup V) (N : Type*) [AddCommGroup N] [_root_.Module V N] : Prop :=
  ∀ m₀ : Ideal V, m₀ ≤ S.ideal → m₀.FG → ∃ (k n : ℕ) (ψ : (Fin k → V) →ₗ[V] (Fin n → V))
    (φ : (Fin n → V) →ₗ[V] N), φ ∘ₗ ψ = 0 ∧ (∀ ε ∈ m₀, ∀ x : N, ε • x ∈ LinearMap.range φ) ∧
      ∀ ε ∈ m₀, ∀ y ∈ LinearMap.ker φ, ε • y ∈ LinearMap.range ψ

variable {N N' : Type*} [AddCommGroup N] [_root_.Module V N] [AddCommGroup N']
  [_root_.Module V N']

/-- Base change along `V → W`
preserves almost finite generation, almost finite presentation and uniform bounds
(GR Proposition 2.3.10). -/
theorem AlmostFG.baseChange (W : Type*) [CommRing W] [_root_.Algebra V W] :
    (AlmostFG S N → AlmostFG (S.baseChange W) (W ⊗[V] N)) ∧
      (AlmostFP S N → AlmostFP (S.baseChange W) (W ⊗[V] N)) ∧
      ∀ n, UniformlyAlmostFG S N n → UniformlyAlmostFG (S.baseChange W) (W ⊗[V] N) n := sorry

end Module

end Almost

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 1: Perfectoid Tate rings, tilts and untilts -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

universe u

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits
open scoped Pointwise

namespace Perfectoid

open Huber

section Frobenius

variable (p : ℕ) [hp : Fact p.Prime]

/-- For ideals `I, J` of a commutative ring `A`
with `p ∈ J` and `x ^ p ∈ J` for `x ∈ I`, the Frobenius `Φ : A ⧸ I → A ⧸ J`, `[x] ↦ [x ^ p]`
(ECD §3, the notational convention before Definition 3.1). -/
def frobeniusQuot {A : Type*} [CommRing A] (I J : Ideal A) (hpJ : (p : A) ∈ J)
    (hIJ : ∀ x ∈ I, x ^ p ∈ J) : A ⧸ I →+* A ⧸ J :=
  Ideal.Quotient.lift I
    { toFun := fun x ↦ Ideal.Quotient.mk J (x ^ p)
      map_one' := by simp
      map_mul' := fun x y ↦ by simp [mul_pow]
      map_zero' := by simp [zero_pow hp.out.ne_zero]
      map_add' := sorry }
    sorry

/-- `Φ [x] = [x ^ p]` (ECD §3). -/
@[simp] theorem frobeniusQuot_mk {A : Type*} [CommRing A] (I J : Ideal A) (hpJ : (p : A) ∈ J)
    (hIJ : ∀ x ∈ I, x ^ p ∈ J) (x : A) :
    frobeniusQuot p I J hpJ hIJ (Ideal.Quotient.mk I x) = Ideal.Quotient.mk J (x ^ p) := sorry

/-- The Frobenius `Φ : A ⧸ (ϖ) → A ⧸ (ϖ ^ p)` of
`frobeniusQuot` for `ϖ ^ p ∣ p`, the map of ECD Definition 3.1 (b) for `A = R°`. -/
def frobeniusModPow {A : Type*} [CommRing A] (ϖ : A) (h : ϖ ^ p ∣ (p : A)) :
    A ⧸ Ideal.span {ϖ} →+* A ⧸ Ideal.span {ϖ ^ p} :=
  frobeniusQuot p _ _ (Ideal.mem_span_singleton.mpr h) fun _ hx ↦
    Ideal.mem_span_singleton.mpr (pow_dvd_pow_of_dvd (Ideal.mem_span_singleton.mp hx) p)

end Frobenius

section Definition

variable (p : ℕ) [Fact p.Prime]

/-- A complete Hausdorff Tate ring `R` is a
*perfectoid Tate ring* (ECD Definition 3.1) if (a) it is uniform, `R°` bounded, and (b) some
pseudo-uniformizer `ϖ ∈ R°` has `ϖ ^ p ∣ p` in `R°` and a bijective Frobenius
`Φ : R° ⧸ (ϖ) → R° ⧸ (ϖ ^ p)`. No base field is fixed: characteristic `0`, `p` and mixed
characteristic (`p` a nonzero nonunit) are allowed. -/
class IsPerfectoidTateRing (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] : Prop where
  /-- (a) `R` is uniform: the power-bounded subring `R°` is bounded. -/
  isBounded_powerBoundedSubring : IsBounded (powerBoundedSubring R : Set R)
  /-- (b) a pseudo-uniformizer `ϖ ∈ R°` with `ϖ ^ p ∣ p` in `R°` and `Φ` bijective. -/
  exists_pseudoUniformizer : ∃ (ϖ : powerBoundedSubring R)
    (h : ϖ ^ p ∣ (p : powerBoundedSubring R)),
    IsPseudoUniformizer (ϖ : R) ∧ Function.Bijective (frobeniusModPow p ϖ h)

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- A complete Hausdorff uniform Tate ring
with a pseudo-uniformizer `ϖ ∈ R°`, `ϖ ^ p ∣ p` in `R°` and `Φ : R°/ϖ → R°/ϖ^p` surjective is
perfectoid; injectivity is automatic (ECD Remark 3.2). -/
theorem IsPerfectoidTateRing.of_surjective (hb : IsBounded (powerBoundedSubring R : Set R))
    (ϖ : powerBoundedSubring R) (hϖ : IsPseudoUniformizer (ϖ : R))
    (h : ϖ ^ p ∣ (p : powerBoundedSubring R))
    (hs : Function.Surjective (frobeniusModPow p ϖ h)) : IsPerfectoidTateRing p R := sorry

/-- In characteristic `p`, perfectoid
is perfect (ECD Proposition 3.5). -/
theorem IsPerfectoidTateRing.iff_perfectRing [CharP R p] :
    IsPerfectoidTateRing p R ↔ PerfectRing R p := sorry

end Definition

section MapPowerBounded

/-- A continuous ring homomorphism from a Tate ring
into a *uniform* Tate ring carries `A°` into `S°`: for `x ∈ A°` and a pseudo-uniformizer `ϖ`,
`f(ϖ) f(x) ^ N` is topologically nilpotent, so `{f(x) ^ N} ⊆ f(ϖ)⁻¹ S°`, a bounded set. -/
theorem map_mem_powerBoundedSubring {A S : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] [CommRing S] [TopologicalSpace S] [IsTopologicalRing S]
    [IsTateRing S] (hS : IsBounded (powerBoundedSubring S : Set S)) (f : A →+* S)
    (hf : Continuous f) {x : A} (hx : x ∈ powerBoundedSubring A) :
    f x ∈ powerBoundedSubring S := sorry

end MapPowerBounded

/-- A product of Tate rings is a Tate ring,
with pair of definition `(A₀ × B₀, I × J)` and pseudo-uniformizer `(ϖ_A, ϖ_B)`; used for
`IsPerfectoidTateRing.prod`. -/
instance _root_.TauCeti.Huber.IsTateRing.instProd {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsTateRing B] : IsTateRing (A × B) := sorry

/-- A nontrivially normed ultrametric field is a Tate
ring, with ring of definition the closed unit ball and pseudo-uniformizer any `0 < ‖ϖ‖ < 1`; its
power-bounded subring is the closed unit ball and `K°°` the open unit ball. Stated here because
the examples below (`ℂ_p`, `ℚ_p^cycl`) use it. -/
instance _root_.TauCeti.Huber.isTateRing_of_nontriviallyNormedField (K : Type*)
    [NontriviallyNormedField K] [IsUltrametricDist K] : IsTateRing K := sorry

section Prod

variable (p : ℕ) [Fact p.Prime] {R S : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [CommRing S] [UniformSpace S]
  [IsUniformAddGroup S] [IsTopologicalRing S] [IsTateRing S] [CompleteSpace S] [T2Space S]

/-- `R × S` is perfectoid when `R` and `S`
are: `(R × S)° = R° × S°`, and `(ϖ_R, ϖ_S)` is a pseudo-uniformizer with the required properties
(ECD Example 3.4, products such as `K × K♭`). -/
instance IsPerfectoidTateRing.prod [IsPerfectoidTateRing p R] [IsPerfectoidTateRing p S] :
    IsPerfectoidTateRing p (R × S) := sorry

end Prod

section Examples

variable (p : ℕ) [Fact p.Prime]

/-- `ℚ_p^cycl`, the completion of `ℚ_p(μ_{p^∞})`,
realised as the closure in `ℂ_p` of the subfield generated by the `p`-power roots of unity (it
contains `ℚ_p`, the closure of `ℚ`). Declared here because the examples of the tilt use it. -/
def padicCyclotomic : Subfield ℂ_[p] :=
  (Subfield.closure {ζ : ℂ_[p] | ∃ n : ℕ, ζ ^ p ^ n = 1}).topologicalClosure

/-- `ℚ_p^cycl` is complete, being closed in `ℂ_p`. -/
instance padicCyclotomic.instCompleteSpace : CompleteSpace (padicCyclotomic p) :=
  (Subfield.isClosed_topologicalClosure _).completeSpace_coe

/-- The absolute value of `ℚ_p^cycl` is nontrivial
(`‖p‖ = p⁻¹`). -/
instance padicCyclotomic.instNontriviallyNormedField :
    NontriviallyNormedField (padicCyclotomic p) :=
  { (inferInstance : NormedField (padicCyclotomic p)) with non_trivial := sorry }

/-- `ℚ_p^cycl` is a perfectoid Tate ring
(ECD Example 3.4(i); the field statement is `isPerfectoidField_padicCyclotomic`). -/
instance padicCyclotomic.instIsPerfectoidTateRing :
    IsPerfectoidTateRing p (padicCyclotomic p) := sorry

/-- The Tate ring `ℂ_p[ε]/(ε²)` with the product
topology on `ℂ_p ⊕ ℂ_p ε` (ECD Remark 3.3's companion non-example; Tau Ceti has no instance). -/
instance dualNumberPadicComplex.instIsTateRing : IsTateRing (DualNumber ℂ_[p]) := sorry

end Examples

section ExampleTests

variable (p : ℕ) [Fact p.Prime]

example : ¬ IsPerfectoidTateRing p ℚ_[p] ∧
    Function.Surjective fun x : ModP (powerBoundedSubring ℚ_[p]) p ↦ x ^ p := sorry

example : ¬ IsBounded (powerBoundedSubring (DualNumber ℂ_[p]) : Set (DualNumber ℂ_[p])) ∧
    (∃ ϖ : powerBoundedSubring (DualNumber ℂ_[p]), IsPseudoUniformizer (ϖ : DualNumber ℂ_[p]) ∧
      ϖ ^ p ∣ (p : powerBoundedSubring (DualNumber ℂ_[p]))) ∧
    (Function.Surjective fun x : ModP (powerBoundedSubring (DualNumber ℂ_[p])) p ↦ x ^ p) ∧
    ¬ IsPerfectoidTateRing p (DualNumber ℂ_[p]) := sorry

example (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [Subsingleton R] :
    IsPerfectoidTateRing p R := sorry

end ExampleTests

section CharP

variable (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [CharP R p]

/-- In characteristic `p`, a perfectoid Tate ring
has `R°` and every ring of integral elements perfect (ECD Proposition 3.5); the equivalence with
perfectness is `IsPerfectoidTateRing.iff_perfectRing`. -/
theorem IsPerfectoidTateRing.perfectRing_plus [IsPerfectoidTateRing p R] (P : Pair R) :
    PerfectRing P.plus p := sorry

/-- In characteristic `p` every pseudo-uniformizer
`ϖ ∈ R°` of a perfectoid Tate ring satisfies ECD Definition 3.1 (`ϖ ^ p ∣ p = 0` is vacuous). -/
theorem IsPerfectoidTateRing.frobeniusModPow_bijective_of_charP [IsPerfectoidTateRing p R]
    (ϖ : powerBoundedSubring R) (hϖ : IsPseudoUniformizer (ϖ : R)) :
    ∃ h : ϖ ^ p ∣ (p : powerBoundedSubring R), Function.Bijective (frobeniusModPow p ϖ h) :=
  sorry

/-- A perfect complete Hausdorff Tate ring of
characteristic `p` is perfectoid (ECD Proposition 3.5, `←`). -/
theorem IsPerfectoidTateRing.of_perfectRing [PerfectRing R p] : IsPerfectoidTateRing p R :=
  sorry

/-- A perfectoid Tate ring of
characteristic `p` is perfect (ECD Proposition 3.5, `→`). -/
instance IsPerfectoidTateRing.instPerfectRing [IsPerfectoidTateRing p R] : PerfectRing R p :=
  (IsPerfectoidTateRing.iff_perfectRing p).mp inferInstance

end CharP

section Roots

variable (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] [TopologicalSpace R]
  [IsTopologicalRing R] [IsTateRing R]

/-- A *pseudo-uniformizer with compatible
`p`-power roots* `ϖ♭ = (ϖ^{1/pⁿ})ₙ ∈ lim_{x ↦ x^p} R` (Mathlib `Perfection R p`) whose zeroth
coordinate `ϖ` is a pseudo-uniformizer lying in `R°` with `ϖ ^ p ∣ p` in `R°` (ECD Lemma 3.10;
Sch12 Lemma 3.4, Remark 3.5). Defined for any Tate ring, since it is used
on rings not assumed perfectoid. -/
structure PseudoUniformizerRoots where
  /-- The compatible system `(ϖ^{1/pⁿ})ₙ`. -/
  roots : Perfection R p
  /-- `ϖ = ϖ^{1/p⁰}` is power-bounded. -/
  mem_powerBoundedSubring : Perfection.coeffMonoidHom R p 0 roots ∈ powerBoundedSubring R
  /-- `ϖ` is a pseudo-uniformizer. -/
  isPseudoUniformizer : IsPseudoUniformizer (Perfection.coeffMonoidHom R p 0 roots)
  /-- `ϖ ^ p ∣ p` in `R°`. -/
  pow_dvd_p : (⟨_, mem_powerBoundedSubring⟩ : powerBoundedSubring R) ^ p ∣
    (p : powerBoundedSubring R)

namespace PseudoUniformizerRoots

variable {p R} (ϖ : PseudoUniformizerRoots p R)

/-- `root n = ϖ^{1/pⁿ}`, the `n`-th coordinate
(Mathlib `Perfection.coeffMonoidHom R p n`). -/
def root (n : ℕ) : R := Perfection.coeffMonoidHom R p n ϖ.roots

/-- Every `ϖ^{1/pⁿ}` is a
pseudo-uniformizer lying in `R°`. -/
theorem isPseudoUniformizer_root (n : ℕ) :
    IsPseudoUniformizer (ϖ.root n) ∧ ϖ.root n ∈ powerBoundedSubring R := sorry

/-- `ϖ^{1/pⁿ}` as an element of `R°`. -/
def rootPB (n : ℕ) : powerBoundedSubring R := ⟨ϖ.root n, (ϖ.isPseudoUniformizer_root n).2⟩

/-- `ϖ ^ (m / pⁿ)` for `m / pⁿ ∈ ℤ[1/p]`, as a
unit of `R`: `(ϖ^{1/pⁿ}) ^ m`. It depends only on `m / pⁿ` (`zpow_mul_p`); `zpow m n ∈ R°` for
`m ≥ 0`. -/
def zpow (m : ℤ) (n : ℕ) : Rˣ := ((ϖ.isPseudoUniformizer_root n).1.1.unit) ^ m

/-- The spectral gauge
`|x|_ϖ = inf {2^{-q} : q ∈ ℤ[1/p], ϖ^{-q} x ∈ R°}` (normalised by `|ϖ|_ϖ = 1/2`), with
`q = m / pⁿ`. -/
def gauge (x : R) : NNReal :=
  sInf ((fun mn : ℤ × ℕ ↦ (2 : NNReal) ^ (-(mn.1 : ℝ) / (p : ℝ) ^ mn.2)) ''
    {mn | ((ϖ.zpow (-mn.1) mn.2 : Rˣ) : R) * x ∈ powerBoundedSubring R})

end PseudoUniformizerRoots

end Roots

section RootsPerfectoid

variable {p : ℕ} [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

namespace PseudoUniformizerRoots

variable (ϖ : PseudoUniformizerRoots p R)

/-- A perfectoid Tate ring has a
pseudo-uniformizer with compatible roots. -/
instance instNonempty [IsPerfectoidTateRing p R] : Nonempty (PseudoUniformizerRoots p R) :=
  sorry

end PseudoUniformizerRoots

end RootsPerfectoid

section RootsTests

variable (p : ℕ) [Fact p.Prime]

example (ϖ : PseudoUniformizerRoots p ℂ_[p]) (hϖ : ϖ.root 0 = p) (x : ℂ_[p]) (hx : x ≠ 0) :
    (ϖ.gauge x : ℝ) = 2 ^ Real.logb p ‖x‖ := sorry

example : IsEmpty (PseudoUniformizerRoots p ℚ_[p]) := sorry

example (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [CharP R p] [IsPerfectoidTateRing p R] (x : R) :
    Subsingleton {ϖ : PseudoUniformizerRoots p R // ϖ.root 0 = x} := sorry

end RootsTests

section ExistsRoots

variable (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- For `ϖ₁ ∈ R°` a
pseudo-uniformizer with `ϖ₁ ^ p ∣ p`, there is `ϖ♭ ∈ lim_{x ↦ x^p} R°` with
`ϖ = ϖ♭⁽⁰⁾ ≡ ϖ₁ mod ϖ₁ ^ p R°`; then `ϖ R° = ϖ₁ R°` and `ϖ♭` has compatible roots. -/
theorem PseudoUniformizerRoots.exists_root_zero_sub_mem (ϖ₁ : powerBoundedSubring R)
    (hϖ₁ : IsPseudoUniformizer (ϖ₁ : R)) (h : ϖ₁ ^ p ∣ (p : powerBoundedSubring R)) :
    ∃ ϖ : PseudoUniformizerRoots p R, ϖ.rootPB 0 - ϖ₁ ∈ Ideal.span {ϖ₁ ^ p} ∧
      Ideal.span {ϖ.rootPB 0} = Ideal.span {ϖ₁} := sorry

/-- In characteristic `p` every
pseudo-uniformizer has unique compatible roots (`R` is perfect). -/
theorem PseudoUniformizerRoots.existsUnique_of_charP [CharP R p] (ϖ₁ : R)
    (hϖ₁ : IsPseudoUniformizer ϖ₁) (h₁ : ϖ₁ ∈ powerBoundedSubring R) :
    ∃! ϖ : Perfection R p, Perfection.coeffMonoidHom R p 0 ϖ = ϖ₁ := sorry

end ExistsRoots

section TiltDef

variable (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R]

/-- The tilt `R♭ = lim_{x ↦ x^p} R` (ECD Definition
3.9), a type synonym of Mathlib's monoid `Perfection R p` of sequences `(x⁽ⁿ⁾)ₙ` with
`(x⁽ⁿ⁺¹⁾) ^ p = x⁽ⁿ⁾`. For `R` perfectoid it carries the ring structure with pointwise
multiplication and `(x + y)⁽ⁱ⁾ = lim_n (x⁽ⁱ⁺ⁿ⁾ + y⁽ⁱ⁺ⁿ⁾) ^ pⁿ` (ECD Lemma 3.10, AWS Lemma 2.7.1),
and the inverse-limit topology. -/
def tilt : Type _ := Perfection R p

namespace tilt

/-- The inverse-limit uniformity of `R♭`, induced
from `ℕ → R`. -/
instance instUniformSpace [UniformSpace R] : UniformSpace (tilt p R) :=
  inferInstanceAs (UniformSpace {f : ℕ → R // ∀ n, f (n + 1) ^ p = f n})

/-- `R♭` is Hausdorff (a subspace of `ℕ → R`). -/
instance instT2Space [UniformSpace R] [T2Space R] : T2Space (tilt p R) :=
  inferInstanceAs (T2Space {f : ℕ → R // ∀ n, f (n + 1) ^ p = f n})

variable [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]

/-- The ring structure of `R♭`: the multiplication
of `Perfection R p` (`tilt.coeff_mul`) and the limit addition (`tilt.coeff_add`); it does not
depend on choices (ECD Lemma 3.10). -/
instance instCommRing [IsPerfectoidTateRing p R] : CommRing (tilt p R) := sorry

/-- The inverse-limit uniformity is that of the
additive group of `R♭`. -/
instance instIsUniformAddGroup [IsPerfectoidTateRing p R] : IsUniformAddGroup (tilt p R) := sorry

/-- `R♭` is a topological ring. -/
instance instIsTopologicalRing [IsPerfectoidTateRing p R] : IsTopologicalRing (tilt p R) := sorry

/-- `R♭` has characteristic `p`. -/
instance charP [IsPerfectoidTateRing p R] : CharP (tilt p R) p := sorry

/-- `R♭` is perfect. -/
instance perfectRing [IsPerfectoidTateRing p R] : PerfectRing (tilt p R) p := sorry

/-- `R♭` is a Tate ring, with pseudo-uniformizer
`ϖ♭` for any `ϖ♭` with compatible roots. -/
instance instIsTateRing [IsPerfectoidTateRing p R] : IsTateRing (tilt p R) := sorry

/-- `R♭` is complete (a closed subspace of `ℕ → R`
for the limit addition). -/
instance instCompleteSpace [IsPerfectoidTateRing p R] : CompleteSpace (tilt p R) := sorry

/-- `R♭` is a perfectoid Tate ring of characteristic
`p`. -/
instance isPerfectoidTateRing [IsPerfectoidTateRing p R] : IsPerfectoidTateRing p (tilt p R) :=
  sorry

variable {p R} [IsPerfectoidTateRing p R]

/-- The `n`-th coordinate `x ↦ x⁽ⁿ⁾`, the monoid
homomorphism `Perfection.coeffMonoidHom R p n` of Mathlib. -/
def coeff (n : ℕ) : tilt p R →* R where
  toFun x := Perfection.coeffMonoidHom R p n x
  map_one' := sorry
  map_mul' := sorry

/-- `coeff (n + 1) x ^ p = coeff n x`. -/
@[simp] theorem coeff_pow (x : tilt p R) (n : ℕ) : coeff (n + 1) x ^ p = coeff n x := sorry

/-- An element of `R♭` is determined by its
coordinates. -/
theorem ext {x y : tilt p R} : x = y ↔ ∀ n, coeff n x = coeff n y := sorry

/-- In characteristic `p`, `x ↦ x⁽⁰⁾` is a ring
isomorphism `R♭ ≃+* R` (ECD Lemma 3.10). -/
def equivOfCharP [CharP R p] : tilt p R ≃+* R := sorry

end tilt

variable {R} [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- `ϖ♭` as an element of the ring
`R♭`; a pseudo-uniformizer of `R♭` with `ϖ♭♯ = ϖ`. -/
def PseudoUniformizerRoots.toTilt {p} [Fact p.Prime] (ϖ : PseudoUniformizerRoots p R) :
    tilt p R :=
  ϖ.roots

/-- The tilt of a Huber pair `(R, R⁺)` with `R`
perfectoid: `(R♭, R♭⁺)` with `R♭⁺ = lim_{x ↦ x^p} R⁺ = {x : x⁽⁰⁾ ∈ R⁺}` (ECD Lemma 3.11). -/
def Pair.tilt (P : Pair R) : Pair (Perfectoid.tilt p R) where
  plus :=
    { carrier := {x | Perfectoid.tilt.coeff 0 x ∈ P.plus}
      mul_mem' := sorry
      one_mem' := sorry
      add_mem' := sorry
      zero_mem' := sorry
      neg_mem' := sorry }
  isRingOfIntegralElements := sorry

end TiltDef

section TiltTests

variable (p : ℕ) [Fact p.Prime]

example : (∀ x : tilt p (tilt p (padicCyclotomic p)), tilt.equivOfCharP x = tilt.coeff 0 x) ∧
    Continuous (tilt.equivOfCharP : tilt p (tilt p (padicCyclotomic p)) ≃+* _) ∧
    Continuous (tilt.equivOfCharP : tilt p (tilt p (padicCyclotomic p)) ≃+* _).symm := sorry

example : ∃ ε : tilt p (padicCyclotomic p),
    (∀ n, IsPrimitiveRoot (tilt.coeff n ε) (p ^ n)) ∧ ε ≠ 1 := sorry

example (ε : tilt p (padicCyclotomic p)) (hε : ∀ n, IsPrimitiveRoot (tilt.coeff n ε) (p ^ n)) :
    tilt.coeff 0 (ε - 1) ≠ tilt.coeff 0 ε - tilt.coeff 0 (1 : tilt p (padicCyclotomic p)) := sorry

end TiltTests

section TiltPerfectoid

variable (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- `R♭` is a complete Hausdorff uniform perfect Tate ring of
characteristic `p` with pair of definition `(R♭°, ϖ♭ R♭°)`, hence perfectoid (ECD Lemma 3.10, "a
perfectoid `𝔽_p`-algebra"). -/
theorem tilt.isBounded_powerBoundedSubring (ϖ : PseudoUniformizerRoots p R) :
    IsBounded (powerBoundedSubring (tilt p R) : Set (tilt p R)) ∧
      ∃ P : PairOfDefinition (tilt p R),
        P.ringOfDefinition = powerBoundedSubring (tilt p R) ∧
        ∃ h : ϖ.toTilt ∈ P.ringOfDefinition,
          P.idealOfDefinition = Ideal.span {⟨ϖ.toTilt, h⟩} := sorry

/-- `R♭ ≠ 0 ↔ R ≠ 0`. -/
theorem tilt.nontrivial_iff_nontrivial : Nontrivial (tilt p R) ↔ Nontrivial R := sorry

end TiltPerfectoid

section Sharp

variable {p : ℕ} [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

namespace tilt

/-- The sharp map `♯ : R♭ → R`, `x ↦ x⁽⁰⁾` (Mathlib
`Perfection.coeffMonoidHom R p 0`): continuous and multiplicative, not additive. -/
def sharp : tilt p R →* R := coeff 0

end tilt

end Sharp

section Functoriality

variable (p : ℕ) [Fact p.Prime] {R S T : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S] [IsTateRing S]
  [CompleteSpace S] [T2Space S] [IsPerfectoidTateRing p S]
  [CommRing T] [UniformSpace T] [IsUniformAddGroup T] [IsTopologicalRing T] [IsTateRing T]
  [CompleteSpace T] [T2Space T] [IsPerfectoidTateRing p T]

namespace tilt

/-- The tilt `f♭ : R♭ → S♭`, `(x⁽ⁿ⁾) ↦ (f(x⁽ⁿ⁾))`, of a continuous
ring homomorphism (Mathlib `Perfection.mapMonoidHom p f` on the underlying monoids); additivity
uses continuity of `f`. -/
def map (f : R →+* S) (hf : Continuous f) : tilt p R →+* tilt p S where
  toFun x := Perfection.mapMonoidHom p (f : R →* S) x
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

variable {p}

/-- `(f♭ x)⁽ⁿ⁾ = f(x⁽ⁿ⁾)`. -/
@[simp] theorem coeff_map (f : R →+* S) (hf : Continuous f) (x : tilt p R) (n : ℕ) :
    coeff n (map p f hf x) = f (coeff n x) := sorry

/-- `(f♭ x)♯ = f(x♯)`. -/
@[simp] theorem sharp_map (f : R →+* S) (hf : Continuous f) (x : tilt p R) :
    sharp (map p f hf x) = f (sharp x) := sorry

/-- `id♭ = id`. -/
@[simp] theorem map_id : map p (RingHom.id R) continuous_id = RingHom.id (tilt p R) := sorry

/-- `(g ∘ f)♭ = g♭ ∘ f♭`. -/
theorem map_comp (f : R →+* S) (hf : Continuous f) (g : S →+* T) (hg : Continuous g) :
    map p (g.comp f) (hg.comp hf) = (map p g hg).comp (map p f hf) := sorry

/-- `f♭` is continuous. -/
theorem continuous_map (f : R →+* S) (hf : Continuous f) : Continuous (map p f hf) := sorry

/-- `f♭(R♭°) ⊆ S♭°`. -/
theorem map_mem_powerBoundedSubring (f : R →+* S) (hf : Continuous f) {x : tilt p R}
    (hx : x ∈ powerBoundedSubring (tilt p R)) :
    map p f hf x ∈ powerBoundedSubring (tilt p S) := sorry

variable (p)

end tilt

/-- A continuous `f : R → S` restricted to `R° → S°` (`S` is
uniform, `map_mem_powerBoundedSubring`). -/
def powerBoundedMap (f : R →+* S) (hf : Continuous f) :
    powerBoundedSubring R →+* powerBoundedSubring S :=
  f.restrict _ _ fun _ hx ↦
    map_mem_powerBoundedSubring (IsPerfectoidTateRing.isBounded_powerBoundedSubring (p := p)) f hf
      hx

/-- The image `(f(ϖ^{1/pⁿ}))ₙ` of a pseudo-uniformizer with
compatible roots, again one (`f` continuous, `S` uniform). -/
def PseudoUniformizerRoots.map (f : R →+* S) (hf : Continuous f)
    (ϖ : PseudoUniformizerRoots p R) : PseudoUniformizerRoots p S where
  roots := Perfection.mapMonoidHom p (f : R →* S) ϖ.roots
  mem_powerBoundedSubring := sorry
  isPseudoUniformizer := sorry
  pow_dvd_p := sorry

/-- A morphism of perfectoid Huber pairs induces a morphism
of the tilt pairs. -/
def Pair.tiltHom {P : Pair R} {Q : Pair S} (f : Pair.Hom P Q) :
    Pair.Hom (Pair.tilt p P) (Pair.tilt p Q) where
  toRingHom := tilt.map p f.toRingHom f.continuous_toRingHom
  continuous_toRingHom := tilt.continuous_map _ _
  map_mem_plus := sorry

end Functoriality

section UniformTilt

variable (p : ℕ) [Fact p.Prime] (B : Type*) [CommRing B]

namespace uniformTilt

variable [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B]
  [CompleteSpace B] [T2Space B]

variable [Fact (IsBounded (powerBoundedSubring B : Set B))]
  [Fact (IsTopologicallyNilpotent (p : B))]

variable {p B}


end uniformTilt

end UniformTilt

section AlmostSetup

variable (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- The basic setup `(R°, R°°)` of a perfectoid Tate
ring (ECD 3.21–3.23): `R°°` is idempotent with `R°° ⊗ R°°` flat. It depends only on `R`. -/
def almostSetup [IsPerfectoidTateRing p R] : Almost.BasicSetup (powerBoundedSubring R) where
  ideal := topologicallyNilpotentIdeal R
  isIdempotentElem := sorry
  flat_tilde := sorry

variable {R} [IsPerfectoidTateRing p R]

end AlmostSetup

section Field

variable (p : ℕ) [Fact p.Prime] (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
  [CompleteSpace K]

/-- A *perfectoid field* (ECD Definition 3.6) is a
nonarchimedean field — complete for a nontrivial nonarchimedean absolute value defining its
topology — which is a perfectoid Tate ring (for the Tate structure
`Huber.isTateRing_of_nontriviallyNormedField`). Equivalently (ECD Proposition 3.8, Sch12
Definition 3.1): not discretely valued, `‖p‖ < 1`, Frobenius surjective on `K° ⧸ p`
(`IsPerfectoidField.iff`). The parent projection `IsPerfectoidField.toIsPerfectoidTateRing` is the
coercion to perfectoid Tate rings (an instance). -/
class IsPerfectoidField : Prop extends IsPerfectoidTateRing p K

variable {K}

/-- ECD Proposition 3.8: `K` is perfectoid iff
its value group is not discrete (it accumulates at `1`), `‖p‖ < 1`, and Frobenius is surjective
on `K° ⧸ p`. -/
theorem IsPerfectoidField.iff :
    IsPerfectoidField p K ↔ (∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) ∧ ‖(p : K)‖ < 1 ∧
      Function.Surjective fun x : ModP (powerBoundedSubring K) p ↦ x ^ p := sorry

/-- In characteristic `p`, a perfectoid field
is a complete perfect nonarchimedean field. -/
theorem IsPerfectoidField.iff_perfectRing [CharP K p] : IsPerfectoidField p K ↔ PerfectRing K p :=
  sorry

/-- `ℂ_p` is a perfectoid field. -/
instance isPerfectoidField_padicComplex : IsPerfectoidField p ℂ_[p] := sorry

/-- `ℚ_p^cycl` is a perfectoid field; stated here for
the examples of the tilt of a perfectoid field. -/
instance padicCyclotomic.instIsPerfectoidField : IsPerfectoidField p (padicCyclotomic p) := sorry

end Field

section FieldTests

variable (p : ℕ) [Fact p.Prime]

example : ¬ IsPerfectoidField p ℚ_[p] ∧
    Function.Surjective fun x : ModP (powerBoundedSubring ℚ_[p]) p ↦ x ^ p := sorry

example : IsPerfectoidField p ℂ_[p] ∧
    (∀ x : ℂ_[p], x ≠ 0 → ∃ q : ℚ, ‖x‖ = (p : ℝ) ^ (-(q : ℝ))) ∧
    ∀ x ∈ powerBoundedSubring ℂ_[p], ∃ y ∈ powerBoundedSubring ℂ_[p], y ^ p = x := sorry

example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [CharP K p]
    (t : K) (ht : 0 < ‖t‖ ∧ ‖t‖ < 1) (hdisc : ∀ x : K, x ≠ 0 → ∃ n : ℤ, ‖x‖ = ‖t‖ ^ n) :
    ¬ PerfectRing K p ∧ ¬ IsPerfectoidField p K := sorry

end FieldTests

section FieldCharacterisation

variable (p : ℕ) [Fact p.Prime] {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  [CompleteSpace K]

/-- A
nonarchimedean field that is not discretely valued, with `|p| < 1` and Frobenius surjective on
`K° ⧸ p`, is perfectoid. -/
theorem IsPerfectoidField.of_norm (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε)
    (hp : ‖(p : K)‖ < 1)
    (hF : Function.Surjective fun x : ModP (powerBoundedSubring K) p ↦ x ^ p) :
    IsPerfectoidField p K := sorry

/-- Condition (i) cannot be dropped: a discretely valued
field is never perfectoid (`ℚ_p` and its unramified extensions satisfy (ii) and (iii)). -/
theorem not_isPerfectoidField_of_discrete (t : K) (ht : 0 < ‖t‖ ∧ ‖t‖ < 1)
    (hdisc : ∀ x : K, x ≠ 0 → ∃ n : ℤ, ‖x‖ = ‖t‖ ^ n) : ¬ IsPerfectoidField p K := sorry

end FieldCharacterisation

section Primitive

variable {p : ℕ} [Fact p.Prime]

/-- `ξ = Σ pⁿ [ξₙ] ∈ W(S)` is *primitive of degree
one* (distinguished) if its zeroth Witt coordinate is topologically nilpotent and its first is a
unit (AWS Definition 2.3.4, KL II Definition 3.2.3, ECD Definition 3.15). For a perfect `S` the
Witt coordinates are the `pⁿ`-th powers of the Teichmüller coordinates. -/
structure IsPrimitive {S : Type*} [CommRing S] [TopologicalSpace S] (ξ : WittVector p S) :
    Prop where
  /-- `ξ₀` is topologically nilpotent. -/
  isTopologicallyNilpotent_coeff_zero : IsTopologicallyNilpotent (ξ.coeff 0)
  /-- `ξ₁` is a unit. -/
  isUnit_coeff_one : IsUnit (ξ.coeff 1)

/-- An ideal `J ⊆ W(S)` is *primitive of degree one*
if it is principal with a primitive generator (ECD Definition 3.15). -/
def IsPrimitiveIdeal {S : Type*} [CommRing S] [TopologicalSpace S]
    (J : Ideal (WittVector p S)) : Prop :=
  ∃ ξ, IsPrimitive ξ ∧ J = Ideal.span {ξ}

/-- `p` is primitive, with Witt coordinates
`(0, 1, 0, …)` in characteristic `p`. -/
theorem isPrimitive_p {S : Type*} [CommRing S] [TopologicalSpace S] [CharP S p] :
    IsPrimitive (p : WittVector p S) := sorry

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p]
  {P : Pair R}

/-- A morphism of perfectoid pairs of
characteristic `p` carries primitive elements to primitive elements, so `J ↦ J W(R'⁺)` preserves
primitive ideals. -/
theorem IsPrimitive.map {S : Type*} [CommRing S] [UniformSpace S] [IsUniformAddGroup S]
    [IsTopologicalRing S] [IsTateRing S] [CompleteSpace S] [T2Space S]
    [IsPerfectoidTateRing p S] [CharP S p] {Q : Pair S} (f : Pair.Hom P Q)
    {ξ : WittVector p P.plus} (hξ : IsPrimitive ξ) :
    IsPrimitive (WittVector.map (f.toRingHom.restrict _ _ f.map_mem_plus) ξ) := sorry

end Primitive

section PrimitiveTests

variable (p : ℕ) [Fact p.Prime]

example (pflat ε : (Pair.powerBounded (tilt p ℂ_[p])).plus)
    (hp : tilt.sharp (pflat : tilt p ℂ_[p]) = p)
    (hε : ∀ n, IsPrimitiveRoot (tilt.coeff n (ε : tilt p ℂ_[p])) (p ^ (n + 1))) :
    IsPrimitive ((p : WittVector p (Pair.powerBounded (tilt p ℂ_[p])).plus) -
        WittVector.teichmuller p pflat) ∧
      IsPrimitive (∑ i ∈ Finset.range p, WittVector.teichmuller p ε ^ i) := sorry

example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p]
    [Nontrivial R] (P : Pair R) (ϖ : P.plus) :
    ¬ IsPrimitive ((p : WittVector p P.plus) ^ 2) ∧
      ¬ IsPrimitive (WittVector.teichmuller p ϖ) := sorry

example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p]
    (P : Pair R) :
    IsPrimitive (p : WittVector p P.plus) ∧
      IsPrimitiveIdeal (Ideal.span {(p : WittVector p P.plus)}) := sorry

end PrimitiveTests

section Untilt

variable (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- The multiplicative set of `W(R⁺)` generated by the Teichmüller
lifts `[ϖ]` of all pseudo-uniformizers `ϖ ∈ R⁺`; inverting it is inverting one `[ϖ]`, since any
two pseudo-uniformizers divide powers of each other in `R⁺`. -/
def teichmullerPseudoUniformizers (P : Pair R) : Submonoid (WittVector p P.plus) :=
  Submonoid.closure
    {w | ∃ ϖ : P.plus, IsPseudoUniformizer (ϖ : R) ∧ w = WittVector.teichmuller p ϖ}

/-- `W^b(R) = W(R⁺)[1/[ϖ]]`, independent of `ϖ` (and of `R⁺`
up to the evident inclusions). -/
abbrev boundedWitt (P : Pair R) : Type _ := Localization (teichmullerPseudoUniformizers p P)

/-- The untilt `A = W(R⁺)[1/[ϖ]] ⧸ J` of a perfectoid pair
`(R, R⁺)` of characteristic `p` along a primitive ideal `J ⊆ W(R⁺)`: the localisation of
`A⁺ = W(R⁺) ⧸ J` at the images of all `[ϖ]`, so that no choice of `ϖ` enters (ECD proof of
Theorem 3.17; KL II Lemma 3.3.7; AWS Definition 2.3.14). -/
def untilt (P : Pair R) (J : Ideal (WittVector p P.plus)) : Type _ :=
  Localization ((teichmullerPseudoUniformizers p P).map (Ideal.Quotient.mk J))

namespace untilt

variable (P : Pair R) (J : Ideal (WittVector p P.plus))

/-- The ring structure of the untilt (a localisation). -/
instance instCommRing : CommRing (untilt p P J) := inferInstanceAs (CommRing (Localization _))

/-- The untilt is a `W(R⁺) ⧸ J`-algebra. -/
instance instAlgebra : Algebra (WittVector p P.plus ⧸ J) (untilt p P J) :=
  inferInstanceAs (Algebra _ (Localization _))

/-- The untilt is the localisation of `W(R⁺) ⧸ J` at the
Teichmüller lifts of the pseudo-uniformizers. -/
instance instIsLocalization :
    IsLocalization ((teichmullerPseudoUniformizers p P).map (Ideal.Quotient.mk J))
      (untilt p P J) :=
  inferInstanceAs (IsLocalization ((teichmullerPseudoUniformizers p P).map (Ideal.Quotient.mk J))
    (Localization ((teichmullerPseudoUniformizers p P).map (Ideal.Quotient.mk J))))

/-- The topology of the untilt, in which `A⁺` is open with its
`π`-adic (equivalently `(p, [ϖ])`-adic) topology, `π` the image of `[ϖ]`. -/
instance instUniformSpace [IsPerfectoidTateRing p R] [CharP R p] [Fact (IsPrimitiveIdeal J)] :
    UniformSpace (untilt p P J) := sorry

variable [IsPerfectoidTateRing p R] [CharP R p] [Fact (IsPrimitiveIdeal J)]

/-- The uniformity is that of the additive group. -/
instance instIsUniformAddGroup : IsUniformAddGroup (untilt p P J) := sorry

/-- The untilt is a topological ring. -/
instance instIsTopologicalRing : IsTopologicalRing (untilt p P J) := sorry

/-- The untilt is a Tate ring with pair of definition
`(A⁺, π A⁺)` and pseudo-uniformizer `π`, independent of `ϖ`. -/
instance instIsTateRing : IsTateRing (untilt p P J) := sorry

/-- The untilt is complete. -/
instance instCompleteSpace : CompleteSpace (untilt p P J) := sorry

/-- The untilt is Hausdorff. -/
instance instT2Space : T2Space (untilt p P J) := sorry

/-- The untilt is a perfectoid Tate ring
(KL II Theorem 3.3.8, AWS Lemmas 2.6.14 and 2.7.9). -/
instance isPerfectoidTateRing : IsPerfectoidTateRing p (untilt p P J) := sorry

end untilt

/-- The plus ring `A⁺ ⊆ A`, the image of `W(R⁺) ⧸ J`. -/
def untiltPlus (P : Pair R) (J : Ideal (WittVector p P.plus)) : Subring (untilt p P J) :=
  (algebraMap (WittVector p P.plus ⧸ J) (untilt p P J)).range

namespace untilt

variable (P : Pair R) (J : Ideal (WittVector p P.plus))

/-- `θ_J : W^b(R) = W(R⁺)[1/[ϖ]] →+* A`, surjective with
kernel `J · W^b(R)`. -/
def mk : boundedWitt p P →+* untilt p P J :=
  IsLocalization.map (M := teichmullerPseudoUniformizers p P) (untilt p P J) (Ideal.Quotient.mk J)
    (Submonoid.le_comap_map _)

/-- `θ_J` is surjective with kernel `J · W^b(R)`. -/
theorem mk_surjective : Function.Surjective (mk p P J) ∧
    RingHom.ker (mk p P J) = J.map (algebraMap (WittVector p P.plus) (boundedWitt p P)) := sorry

variable [IsPerfectoidTateRing p R] [CharP R p]

/-- `♯_J : R →* A`, `x ↦ θ_J([x])` (extended from `R⁺` by
`♯_J(ϖ⁻¹ x) = ♯_J(ϖ)⁻¹ ♯_J(x)`); continuous and multiplicative, with `♯_J(ϖ)` a
pseudo-uniformizer. -/
def sharp [Fact (IsPrimitiveIdeal J)] : R →* untilt p P J := sorry

/-- A morphism of triples, a morphism `f` of perfectoid
pairs of characteristic `p` with `W(f)(J) ⊆ J'` (then `J' = W(f)(J) W(R'⁺)`), induces a continuous
ring homomorphism of untilts; `map_id`, `map_comp` hold. -/
def map {R' : Type*} [CommRing R'] [UniformSpace R'] [IsUniformAddGroup R'] [IsTopologicalRing R']
    [IsTateRing R'] [CompleteSpace R'] [T2Space R'] [IsPerfectoidTateRing p R'] [CharP R' p]
    {P' : Pair R'} (f : Pair.Hom P P') (J' : Ideal (WittVector p P'.plus))
    (hJ : J.map (WittVector.map (f.toRingHom.restrict _ _ f.map_mem_plus)) ≤ J') :
    untilt p P J →+* untilt p P' J' := sorry

/-- The tilt of the untilt is `R`, identifying the plus
rings. -/
def tiltEquiv [Fact (IsPrimitiveIdeal J)] : tilt p (untilt p P J) ≃+* R := sorry

/-- `(p)` is a primitive ideal. -/
instance fact_isPrimitiveIdeal_span_p :
    Fact (IsPrimitiveIdeal (Ideal.span {(p : WittVector p P.plus)})) := ⟨⟨_, isPrimitive_p, rfl⟩⟩

end untilt

end Untilt

section UntiltTests

variable (p : ℕ) [Fact p.Prime]

example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p]
    (P : Pair R) :
    ∃ e : untilt p P (Ideal.span {(p : WittVector p P.plus)}) ≃+* R,
      Continuous e ∧ Continuous e.symm ∧
      (untiltPlus p P (Ideal.span {(p : WittVector p P.plus)})).map e.toRingHom = P.plus :=
  sorry

example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p]
    (P : Pair R) (t : P.plus) (ht : IsPseudoUniformizer (t : R))
    [Fact (IsPrimitiveIdeal (Ideal.span
      {(p : WittVector p P.plus) - WittVector.teichmuller p t}))] :
    untilt.sharp p P (Ideal.span {(p : WittVector p P.plus) - WittVector.teichmuller p t})
      (t : R) = p := sorry

example (ε : (Pair.powerBounded (tilt p (padicCyclotomic p))).plus)
    (hε : ∀ n, IsPrimitiveRoot (tilt.coeff n (ε : tilt p (padicCyclotomic p))) (p ^ (n + 1)))
    [Fact (IsPrimitiveIdeal (Ideal.span
      {∑ i ∈ Finset.range p, WittVector.teichmuller p ε ^ i}))] :
    Nonempty (untilt p (Pair.powerBounded (tilt p (padicCyclotomic p)))
      (Ideal.span {∑ i ∈ Finset.range p, WittVector.teichmuller p ε ^ i}) ≃+*
        padicCyclotomic p) := sorry

end UntiltTests

section UntiltPair

variable (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  [CharP R p] (P : Pair R) (J : Ideal (WittVector p P.plus)) [Fact (IsPrimitiveIdeal J)]

/-- The perfectoid Huber pair `(A, A⁺)` of the untilt: `A⁺ =
W(R⁺) ⧸ J` is a ring of integral elements (open, integrally closed, in `A°`) (KL II Theorem
3.3.8, AWS Lemmas 2.6.14 and 2.7.9). -/
def untilt.pair : Pair (untilt p P J) where
  plus := untiltPlus p P J
  isRingOfIntegralElements := sorry

end UntiltPair

section Marked

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  [CharP R p]

namespace MarkedUntilt

variable {p} {P : Pair R}

variable (p) (P)

variable {p} {P}


variable (p) (P)

variable {p} {P}

variable (p)

variable (P)

variable {p} {P}

end MarkedUntilt

end Marked


end Perfectoid

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 2: Rational localisation, the sheaf theorem and perfectoid spaces -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

universe u

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits
open Huber ValuationSpectrum

namespace PerfectoidSpace

open Perfectoid

section TiltingMap

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R)

/-- The tilting map `τ_R : Spa(R, R⁺) → Spa(R♭, R♭⁺)`,
`x ↦ x♭`, the class of the valuation `v_x ∘ ♯` of `R♭` (ECD Theorem 3.12; AWS Lemma 2.6.12;
Sch12 proof of Theorem 6.3). It is not `Spa` of a ring map: `♯` is only multiplicative. -/
def spaTilt (x : spa P.plus) : spa (Perfectoid.Pair.tilt p P).plus :=
  ⟨⟨{ vle := fun f g ↦ x.1.toValuativeRel.vle (tilt.sharp f) (tilt.sharp g)
      vle_total := fun f g ↦ x.1.toValuativeRel.vle_total (tilt.sharp f) (tilt.sharp g)
      vle_trans := fun hxy hyz ↦ x.1.toValuativeRel.vle_trans hxy hyz
      vle_add := sorry
      mul_vle_mul_left := sorry
      vle_mul_cancel := sorry
      not_vle_one_zero := sorry
      vle_mul_comm := sorry }⟩, sorry⟩

/-- `|f(x♭)| ≤ |g(x♭)| ↔ |f♯(x)| ≤ |g♯(x)|`
(ECD Theorem 3.12). -/
theorem spaTilt_vle_iff (x : spa P.plus) (f g : tilt p R) :
    (spaTilt p P x).1.toValuativeRel.vle f g ↔
      x.1.toValuativeRel.vle (tilt.sharp f) (tilt.sharp g) := sorry

open scoped Classical in
/-- If some numerator is a unit of `R♭` (for instance
`(ϖ♭)^N`), then `τ_R⁻¹(U(T/s)) = U(T♯/s♯)` (Sch12 proof of Theorem 6.3). -/
theorem spaTilt_preimage_rationalSubset (T : Finset (tilt p R)) (s : tilt p R)
    (hT : ∃ t ∈ T, IsUnit t) :
    spaTilt p P ⁻¹' (Subtype.val ⁻¹' rationalSubset (Perfectoid.Pair.tilt p P).plus T s) =
      Subtype.val ⁻¹' rationalSubset P.plus (T.image (tilt.sharp : tilt p R → R))
        (tilt.sharp s) := sorry

open scoped Classical in
/-- Every rational subset of a Tate Huber pair `(A, A⁺)` has a
presentation `U(T ∪ {ϖ^N} / s)` with `T ⊆ A⁺`, `s ∈ A⁺`, for any pseudo-uniformizer `ϖ` (Sch12
Remark 2.8, used in the proof of Theorem 6.3; Tau Ceti `rationalSubset_insert_of_forall_vle`,
`rationalSubset_image_mul_right`). Applied to `A = R♭` it normalises rational subsets of `X♭`. -/
theorem exists_rationalSubset_eq_insert_pseudoUniformizer_pow {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A] (Q : Pair A) {ϖ : A}
    (hϖ : IsPseudoUniformizer ϖ) {U : Set (spa Q.plus)} (hU : U ∈ spaRationalFamily Q.plus) :
    ∃ (N : ℕ) (T : Finset A) (s : A), (∀ t ∈ T, t ∈ Q.plus) ∧ s ∈ Q.plus ∧
      U = Subtype.val ⁻¹' rationalSubset Q.plus (insert (ϖ ^ N) T) s := sorry

/-- If `pR = 0`, then `x♭` is `x` transported along
`R♭ ≃+* R` (Layer 1, `tilt.equivOfCharP`), i.e. `τ_R = id` (ECD Proposition 3.5). -/
@[simp] theorem spaTilt_eq_id_of_charP [CharP R p] (x : spa P.plus) :
    (spaTilt p P x).1 =
      ValuationSpectrum.comap (tilt.equivOfCharP : tilt p R ≃+* R).toRingHom x.1 := sorry

end TiltingMap

end PerfectoidSpace


namespace Perfectoid

section RationalLocCarrier

variable {R : Type u} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
  {D : PairOfDefinition R}

/-- Supporting data for everything that speaks of `O_X(U)`: the completed rational localisation `R⟨T/s⟩` of one presentation
`𝔭 = (T, s)` (Tau Ceti `PairOfDefinition.Presentation`, with `Rₛ = Localization.Away s`): the
separated completion of `Rₛ` for Tau Ceti's `locUniformSpace`, i.e. the object of
`PairOfDefinition.completionLocObj` (Wedhorn Proposition and Definition 5.51). For `T` generating
the unit ideal it is the anchor's `O_X(U(T/s))` (AdicSpaces Layer 3.1), up to the
presentation-independence isomorphisms that Tau Ceti does not yet construct. -/
def RationalLoc (𝔭 : D.Presentation) : Type u :=
  @UniformSpace.Completion (Localization.Away 𝔭.den)
    (D.locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower)

namespace RationalLoc

variable (𝔭 : D.Presentation)

/-- The uniformity of
`R⟨T/s⟩`. -/
instance instUniformSpace : UniformSpace (RationalLoc 𝔭) :=
  @UniformSpace.Completion.uniformSpace (Localization.Away 𝔭.den)
    (D.locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower)

/-- The ring structure of
`R⟨T/s⟩`. -/
instance instCommRing : CommRing (RationalLoc 𝔭) :=
  @UniformSpace.Completion.commRing (Localization.Away 𝔭.den) _
    (D.locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower)
    (D.isUniformAddGroup_locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den)
      𝔭.hasDenominatorPower)
    (D.isTopologicalRing_locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den)
      𝔭.hasDenominatorPower)

/-- Supporting instance. -/
instance instIsUniformAddGroup : IsUniformAddGroup (RationalLoc 𝔭) := sorry

/-- Supporting instance. -/
instance instIsTopologicalRing : IsTopologicalRing (RationalLoc 𝔭) := sorry

/-- `R⟨T/s⟩` is complete. -/
instance instCompleteSpace : CompleteSpace (RationalLoc 𝔭) :=
  @UniformSpace.Completion.completeSpace (Localization.Away 𝔭.den)
    (D.locUniformSpace 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower)

/-- `R⟨T/s⟩` is Hausdorff. -/
instance instT2Space : T2Space (RationalLoc 𝔭) := sorry

/-- Over a Tate ring,
`R⟨T/s⟩` is a Tate ring (the image of a pseudo-uniformizer of `R` is one; Tau Ceti
`isHuberRing_completion_locTopology`). -/
instance instIsTateRing [IsTateRing R] : IsTateRing (RationalLoc 𝔭) := sorry

/-- The structure map
`R → R⟨T/s⟩` (Tau Ceti `PairOfDefinition.toCompletionLoc`). -/
def toLoc : R →+* RationalLoc 𝔭 :=
  D.toCompletionLoc 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower

/-- The structure map is continuous
(Tau Ceti `continuous_toCompletionLoc`). -/
theorem continuous_toLoc : Continuous (toLoc 𝔭) := sorry

/-- The plus ring `R⟨T/s⟩⁺`, the
integral closure of the image of `R⁺[T/s]` (Tau Ceti `PairOfDefinition.completedPlusSubring`). -/
def plus (Aplus : Subring R) : Subring (RationalLoc 𝔭) :=
  D.completedPlusSubring Aplus 𝔭.num 𝔭.den (Localization.Away 𝔭.den) 𝔭.hasDenominatorPower

/-- The Huber pair
`(R⟨T/s⟩, R⟨T/s⟩⁺)` of a presentation over a Tate Huber pair `(R, R⁺)`. -/
def pair [IsTateRing R] (P : Pair R) : Pair (RationalLoc 𝔭) where
  plus := plus 𝔭 P.plus
  isRingOfIntegralElements := sorry

/-- The structure morphism of Huber
pairs `(R, R⁺) → (R⟨T/s⟩, R⟨T/s⟩⁺)`. -/
def structureMap [IsTateRing R] (P : Pair R) : Pair.Hom P (pair 𝔭 P) where
  toRingHom := toLoc 𝔭
  continuous_toRingHom := continuous_toLoc 𝔭
  map_mem_plus := sorry

end RationalLoc

variable (R) in
/-- The per-presentation core
of the anchor's stable uniformity (HK Definition 3.13; AdicSpaces Layer 4.2): every completed
rational localisation `R⟨T/s⟩` with `T` generating the unit ideal is uniform (`R⟨T/s⟩°`
bounded). It does not involve `R⁺`. -/
def IsStablyUniformPres [IsTateRing R] : Prop :=
  ∀ (D : PairOfDefinition R) (𝔭 : D.Presentation), Ideal.span (𝔭.num : Set R) = ⊤ →
    IsBounded (powerBoundedSubring (RationalLoc 𝔭) : Set (RationalLoc 𝔭))

end RationalLocCarrier

section CharPLocalization

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) {D : PairOfDefinition R} (𝔭 : D.Presentation)

variable (R) in
/-- A perfectoid Tate ring of characteristic `p`
is stably uniform (KL I Proposition 3.1.7), in the per-presentation form
`IsStablyUniformPres`. -/
theorem isStablyUniformPres_of_charP [CharP R p] : IsStablyUniformPres R := sorry

end CharPLocalization

end Perfectoid

namespace Perfectoid

section UntiltedModel

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) (ϖ : PseudoUniformizerRoots p R) {D : PairOfDefinition R}
  {E : PairOfDefinition (tilt p R)}

open scoped Classical in
/-- `𝔭` is the
untilt `U(T♯/g♯)` of a normalised presentation `𝔮 = U(T/g)` of a rational subset of `X♭`:
`T ⊆ R♭⁺`, `g ∈ R♭⁺`, `(ϖ♭)^N ∈ T` (Sch12 Lemma 6.4, statement). -/
structure IsSharpPresentation (𝔮 : E.Presentation) (𝔭 : D.Presentation) : Prop where
  /-- The numerators of `𝔭` are the sharps of those of `𝔮`. -/
  num_eq : 𝔭.num = 𝔮.num.image (tilt.sharp : tilt p R → R)
  /-- The denominator of `𝔭` is the sharp of that of `𝔮`. -/
  den_eq : 𝔭.den = tilt.sharp 𝔮.den
  /-- The numerators of `𝔮` lie in `R♭⁺`. -/
  num_mem : ∀ t ∈ 𝔮.num, t ∈ (Pair.tilt p P).plus
  /-- The denominator of `𝔮` lies in `R♭⁺`. -/
  den_mem : 𝔮.den ∈ (Pair.tilt p P).plus
  /-- Some `(ϖ♭)^N` is a numerator of `𝔮`. -/
  exists_pow_mem : ∃ N : ℕ, ϖ.toTilt ^ N ∈ 𝔮.num

variable (𝔮 : E.Presentation) (𝔭 : D.Presentation)

end UntiltedModel

end Perfectoid


namespace Perfectoid

section Approximation

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) (ϖ : PseudoUniformizerRoots p R)

open scoped Classical in
/-- For `f, h ∈ R` and `c ∈ ℕ` there are `a, b ∈ R♭` with
`U({f, ϖ^c}/h) = U({a♯, ϖ^c}/b♯)` (Sch12 Corollary 6.7(i); Bhatt Proposition 9.2.7(2)). -/
theorem exists_sharp_rationalSubset_eq (f h : R) (c : ℕ) :
    ∃ a b : tilt p R,
      (Subtype.val ⁻¹' rationalSubset P.plus {f, ϖ.root 0 ^ c} h : Set (spa P.plus)) =
        Subtype.val ⁻¹' rationalSubset P.plus {tilt.sharp a, ϖ.root 0 ^ c} (tilt.sharp b) :=
  sorry

end Approximation

end Perfectoid

namespace PerfectoidSpace

open Perfectoid

section Homeomorph

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R)

/-- The tilting map is a homeomorphism
`Spa(R, R⁺) ≃ₜ Spa(R♭, R♭⁺)` (ECD Theorem 3.12; Sch12 Corollary 6.7(iii); KL II Theorem 3.3.16;
AWS Theorem 2.5.1). Its naturality is `spaTilt_comp_spaComap`. -/
def spaTiltHomeomorph : spa P.plus ≃ₜ spa (Perfectoid.Pair.tilt p P).plus := sorry

/-- The forward map is `spaTilt`. -/
@[simp] theorem coe_spaTiltHomeomorph : ⇑(spaTiltHomeomorph p P) = spaTilt p P := sorry

/-- `U ⊆ X` is rational iff `τ_R(U) ⊆ X♭` is
rational (ECD Theorem 3.12). The explicit image formula is
`Perfectoid.rationalLocalization.image_spaTilt`. -/
theorem isRational_image_spaTilt_iff (U : Set (spa P.plus)) :
    U ∈ spaRationalFamily P.plus ↔
      spaTilt p P '' U ∈ spaRationalFamily (Perfectoid.Pair.tilt p P).plus := sorry

open scoped Classical in
/-- Every rational `U ⊆ X` is `U(T♯/s♯)` for some
`T ⊆ R♭⁺` containing `(ϖ♭)^N` and `s ∈ R♭⁺` (Sch12 Corollary 6.7(iii)). -/
theorem exists_sharp_presentation (ϖ : PseudoUniformizerRoots p R) {U : Set (spa P.plus)}
    (hU : U ∈ spaRationalFamily P.plus) :
    ∃ (T : Finset (tilt p R)) (s : tilt p R) (N : ℕ),
      (∀ t ∈ T, t ∈ (Perfectoid.Pair.tilt p P).plus) ∧ s ∈ (Perfectoid.Pair.tilt p P).plus ∧
      ϖ.toTilt ^ N ∈ T ∧
      U = Subtype.val ⁻¹' rationalSubset P.plus (T.image (tilt.sharp : tilt p R → R))
        (tilt.sharp s) := sorry

/-- `τ_R` preserves and reflects specialisation
(ECD Theorem 3.12). -/
theorem specializes_spaTilt_iff (x y : spa P.plus) :
    spaTilt p P x ⤳ spaTilt p P y ↔ x ⤳ y := sorry

/-- `τ_R` restricts, for every `U ⊆ X` (in
particular every rational `U`), to a homeomorphism `U ≃ₜ τ_R(U)`; with
`isRational_image_spaTilt_iff` it identifies the rational subsets of `U` and of `τ_R(U)`
(Sch12 Corollary 6.7(iii)). -/
theorem exists_homeomorph_image_spaTilt (U : Set (spa P.plus)) :
    ∃ e : U ≃ₜ (spaTilt p P '' U), ∀ x : U,
      (e x : spa (Perfectoid.Pair.tilt p P).plus) = spaTilt p P x := sorry

end Homeomorph

end PerfectoidSpace

namespace Perfectoid

section RationalLocalization

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) {D : PairOfDefinition R} (𝔭 : D.Presentation) {E : PairOfDefinition (tilt p R)}

/-- The presentation `𝔮`
of a rational subset of `X♭` presents the image `τ_R(U)` of the rational subset `U` presented by
`𝔭`, both numerator sets generating the unit ideal (ECD Theorem 3.12). -/
structure IsTiltPresentation (𝔮 : E.Presentation) : Prop where
  /-- The numerators of `𝔭` generate the unit ideal of `R`. -/
  span_num : Ideal.span (𝔭.num : Set R) = ⊤
  /-- The numerators of `𝔮` generate the unit ideal of `R♭`. -/
  span_num_tilt : Ideal.span (𝔮.num : Set (tilt p R)) = ⊤
  /-- `τ_R(U(𝔭)) = U(𝔮)`. -/
  image_eq : PerfectoidSpace.spaTilt p P '' (Subtype.val ⁻¹' rationalSubset P.plus 𝔭.num 𝔭.den) =
    Subtype.val ⁻¹' rationalSubset (Pair.tilt p P).plus 𝔮.num 𝔮.den

/-- The Huber pair `(O_X(U), O_X⁺(U)) = (R⟨T/s⟩, R⟨T/s⟩⁺)` of a
presentation `U = U(T/s)`, bundled with its structure morphism from `(R, R⁺)` (ECD Theorem 3.18;
HK Proposition 3.8). -/
def rationalLocalization_affinoid : Pair.Hom P (RationalLoc.pair 𝔭 P) :=
  RationalLoc.structureMap 𝔭 P

/-- `R⟨T/s⟩` is a perfectoid Tate
ring for every presentation with `T` generating the unit ideal; no base field (ECD Theorem 3.18;
Berkeley Theorem 6.2.6; KL II Theorem 3.3.18). -/
theorem rationalLocalization.isPerfectoidTateRing_affinoid
    (hT : Ideal.span (𝔭.num : Set R) = ⊤) : IsPerfectoidTateRing p (RationalLoc 𝔭) := sorry

/-- For a presentation `𝔭` of
`U ⊆ X` and a presentation `𝔮` of `τ_R(U) ⊆ X♭`, the isomorphism `O_X(U)♭ ≃+* O_{X♭}(τU)` (ECD
Theorem 3.18; AWS Theorem 2.5.3(b)); `rationalLocalization.tiltEquiv_affinoid_spec` states that it
is a homeomorphism matching the plus rings. -/
def rationalLocalization.tiltEquiv_affinoid (𝔮 : E.Presentation)
    [IsPerfectoidTateRing p (RationalLoc 𝔭)]
    (h : IsTiltPresentation p P 𝔭 𝔮) :
    tilt p (RationalLoc 𝔭) ≃+* RationalLoc 𝔮 := sorry

open scoped Classical in
/-- `τ_R(U(T♯/s♯)) = U(T/s)`
for `T ⊆ R♭⁺` containing `(ϖ♭)^N` and `s ∈ R♭⁺`; every rational `U` has such a presentation
(`PerfectoidSpace.exists_sharp_presentation`) (Sch12 Corollary 6.7(iii); ECD Theorem 3.12). -/
theorem rationalLocalization.image_spaTilt (ϖ : PseudoUniformizerRoots p R)
    (T : Finset (tilt p R)) (s : tilt p R) (N : ℕ) (hT : ∀ t ∈ T, t ∈ (Pair.tilt p P).plus)
    (hs : s ∈ (Pair.tilt p P).plus) (hN : ϖ.toTilt ^ N ∈ T) :
    PerfectoidSpace.spaTilt p P ''
        (Subtype.val ⁻¹' rationalSubset P.plus (T.image (tilt.sharp : tilt p R → R))
          (tilt.sharp s)) =
      Subtype.val ⁻¹' rationalSubset (Pair.tilt p P).plus T s := sorry

/-- If `pR = 0`, `tiltEquiv_affinoid`
is the identity under `R♭ ≃+* R` and `O_X(U)♭ ≃+* O_X(U)` (Layer 1, `tilt.equivOfCharP`): it sends
the image of `a ∈ R♭` to the image of `a` (ECD Proposition 3.5). -/
@[simp] theorem rationalLocalization.tiltEquiv_of_charP_affinoid [CharP R p]
    [CharP (RationalLoc 𝔭) p] [IsPerfectoidTateRing p (RationalLoc 𝔭)] (𝔮 : E.Presentation)
    (h : IsTiltPresentation p P 𝔭 𝔮) (a : tilt p R) :
    rationalLocalization.tiltEquiv_affinoid p P 𝔭 𝔮 h
        ((tilt.equivOfCharP : tilt p (RationalLoc 𝔭) ≃+* RationalLoc 𝔭).symm
          (RationalLoc.toLoc 𝔭 (tilt.equivOfCharP a))) =
      RationalLoc.toLoc 𝔮 a := sorry

end RationalLocalization

section RationalLocalizationTests

variable (p : ℕ) [Fact p.Prime]


open scoped Classical in
/- For `U = {|T| ≤ |ϖ|} = U({T, ϖ}/ϖ)` on the disc, `O_X(U) ≅ ℚ_p^cycl⟨(T/ϖ)^{1/p^∞}⟩`,
`T ↦ ϖ · T'`. -/
open scoped Classical in
/- ECD Example 3.4(iv) is not stated in Layer 1; the product `ℂ_p × ℂ_p♭` (Layer 1),
in which `p` is a nonzero nonunit, likewise contains no nonarchimedean field. For
`U = U({ϖ, p}/p)`, `O_X(U)` is perfectoid and `p` is a unit there; no base field is used. -/
example {D : PairOfDefinition (ℂ_[p] × tilt p ℂ_[p])} (𝔭 : D.Presentation)
    (ϖ : ℂ_[p] × tilt p ℂ_[p]) (hϖ : IsPseudoUniformizer ϖ)
    (hnum : 𝔭.num = {ϖ, (p : ℂ_[p] × tilt p ℂ_[p])}) (hden : 𝔭.den = p) :
    IsPerfectoidTateRing p (RationalLoc 𝔭) ∧
      IsUnit (RationalLoc.toLoc 𝔭 (p : ℂ_[p] × tilt p ℂ_[p])) := sorry

example (P : Pair (tilt p (padicCyclotomic p))) {D : PairOfDefinition (tilt p (padicCyclotomic p))}
    (𝔭 : D.Presentation) {E : PairOfDefinition (tilt p (tilt p (padicCyclotomic p)))}
    (𝔮 : E.Presentation) [CharP (RationalLoc 𝔭) p] [IsPerfectoidTateRing p (RationalLoc 𝔭)]
    (h : IsTiltPresentation p P 𝔭 𝔮)
    (a : tilt p (tilt p (padicCyclotomic p))) :
    rationalLocalization.tiltEquiv_affinoid p P 𝔭 𝔮 h
        ((tilt.equivOfCharP : tilt p (RationalLoc 𝔭) ≃+* RationalLoc 𝔭).symm
          (RationalLoc.toLoc 𝔭 (tilt.equivOfCharP a))) =
      RationalLoc.toLoc 𝔮 a := sorry

end RationalLocalizationTests

end Perfectoid

/- The naive model `R°⟨T/ϖ⟩` (no `p`-power roots, `root m = id`) is not almost equal to
`O_X(U)°` for `U = {|T| ≤ |ϖ|}`: some `x ∈ O_X(U)°` (namely `(T/ϖ)^{1/p}`) has
`ϖ^{1/p} x ∉ R°⟨T/ϖ⟩`. -/

namespace PerfectoidSpace

open Perfectoid

section RationalRestriction

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) {D : PairOfDefinition R} (𝔭 : D.Presentation) {E : PairOfDefinition (tilt p R)}


end RationalRestriction

end PerfectoidSpace

namespace Perfectoid

/-- Per-presentation core of stable uniformity: a perfectoid Tate ring is
stably uniform, every `R⟨T/s⟩` being uniform; by construction this does not involve `R⁺`, as
clause (d) asserts (KL I Theorem 3.6.15; KL II Corollary 3.3.19; Berkeley Theorem 6.1.10; HK
Corollary 3.15). -/
theorem isStablyUniform_core (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    [IsPerfectoidTateRing p R] : IsStablyUniformPres R := sorry

end Perfectoid

namespace Perfectoid

section PFinite

variable (p : ℕ) [Fact p.Prime]

variable (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [CharP K p] [IsPerfectoidField p K]
  {S : Type u} [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
  [IsTateRing S] [CompleteSpace S] [T2Space S] [Algebra K S] [IsReduced S]
  {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  {Q : Pair S} {P : Pair R} (φ : Pair.Hom Q P)

end PFinite

end Perfectoid

end TauCetiRoadmap.PerfectoidSpaces

end

noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits TensorProduct
open Huber ValuationSpectrum

namespace Perfectoid

section CompletedTensorPerfectoid

variable (p : ℕ) [Fact p.Prime] {A B C : Type*}
  [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A]
  [CompleteSpace A] [T2Space A] [IsPerfectoidTateRing p A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B]
  [CompleteSpace B] [T2Space B] [IsPerfectoidTateRing p B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C]
  [CompleteSpace C] [T2Space C] [IsPerfectoidTateRing p C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]

/-- For perfectoid Tate rings `A`,
`B`, `C` (any characteristic, no base field) the completed tensor product `B ⊗̂_A C` is a
perfectoid Tate ring (KL II Theorem 3.3.13; AWS Theorem 2.4.1; Sch12 Proposition 6.18 over a
perfectoid field). The base `A` must be perfectoid: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not uniform. -/
instance isPerfectoidTateRing_completedTensor : IsPerfectoidTateRing p (CompletedTensor A B C) :=
  sorry

variable (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

end CompletedTensorPerfectoid

end Perfectoid

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 3: Almost purity and the étale site -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits TensorProduct
open Huber

section HenselianColimit

variable {ι : Type u} [Preorder ι] (G : ι → Type u) [∀ i, CommRing (G i)]
  (f : ∀ i j, i ≤ j → G i →+* G j)

/-- For ideals `I i ⊆ G i` of a directed
system of rings, the ideal `colim I_i` of `colim G_i` generated by the images of the `I i`
(Stacks Tag 0FWT). -/
def Ring.DirectLimit.ideal (I : ∀ i, Ideal (G i)) :
    Ideal (_root_.Ring.DirectLimit G fun i j h ↦ f i j h) :=
  Ideal.span (⋃ i, _root_.Ring.DirectLimit.of G (fun i j h ↦ f i j h) i '' (I i : Set (G i)))

variable [IsDirectedOrder ι] [Nonempty ι] [DirectedSystem G fun i j h ↦ f i j h]

/-- A filtered colimit of henselian pairs, along
ring maps carrying `I i` into `I j`, is a henselian pair (Stacks Tag 0FWT). Part (a), that an
`I`-adically complete ring is henselian along `I`, is Mathlib's instance
`IsAdicComplete.henselianRing` (Stacks Tag 0ALJ). -/
theorem Ring.DirectLimit.henselianRing (I : ∀ i, Ideal (G i))
    (hI : ∀ i j h, (I i).map (f i j h) ≤ I j) [∀ i, HenselianRing (G i) (I i)] :
    HenselianRing (_root_.Ring.DirectLimit G fun i j h ↦ f i j h) (Ring.DirectLimit.ideal G f I) :=
  sorry

end HenselianColimit

section Approximation

variable {R : Type u} [CommRing R] {ι σ : Type*} [Fintype ι] [Fintype σ]

open scoped Classical in
/-- Elkik's Jacobian ideal
`H = Σ_α Δ_α · ((f_α) : J)` of the presentation `R[X_ι] ⧸ J`, `J = (f_s)_{s ∈ σ}`: for a finite
set `α` of equations, `Δ_α` is generated by the `|α| × |α|` minors of the Jacobian matrix
`(∂f_s/∂X_i)_{s ∈ α}` and `(f_α) : J` is the colon ideal (Elkik §0; GR 5.4.5; it lies in
`H_R(F, J) = Ann Ext¹(L_{S/R}, J/J²)` by GR Lemma 5.4.6). -/
def jacobianIdeal (f : σ → MvPolynomial ι R) : Ideal (MvPolynomial ι R) :=
  ⨆ α : Finset σ,
    Ideal.span (Set.range fun g : α ↪ ι ↦
        (Matrix.of fun s t : α ↦ MvPolynomial.pderiv (g t) (f s)).det) *
      Submodule.colon (Ideal.span (f '' (α : Set σ))) (Set.range f)

end Approximation

section FiniteEtaleUniform

variable {A B : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsTateRing A] [CompleteSpace A] [T2Space A] [CommRing B] [Algebra A B] [Module.Finite A B]
  [Algebra.Etale A B] [TopologicalSpace B] [IsModuleTopology A B] [IsTopologicalRing B]
  [IsTateRing B]

/-- AWS Lemma 1.10.1: a finite étale algebra with
its natural topology over a complete uniform Tate ring is uniform. -/
theorem Huber.isBounded_powerBoundedSubring_of_finiteEtale
    (hA : IsBounded (powerBoundedSubring A : Set A)) :
    IsBounded (powerBoundedSubring B : Set B) := sorry

end FiniteEtaleUniform

namespace Perfectoid

namespace FiniteEtale

/-- For `A` uniform Tate and `B`
finite étale over `A` with its natural topology, the `A°`-algebra structure on `B°` restricting
`A → B` (`B` is uniform by `Huber.isBounded_powerBoundedSubring_of_finiteEtale`, and `A → B` is
continuous). -/
@[instance_reducible]
def powerBoundedAlgebra (A B : Type u) [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] [CommRing B]
    [_root_.Algebra A B] [Module.Finite A B] [_root_.Algebra.Etale A B] [TopologicalSpace B]
    [IsModuleTopology A B] [IsTopologicalRing B] [IsTateRing B]
    (hA : IsBounded (powerBoundedSubring A : Set A)) :
    _root_.Algebra (powerBoundedSubring A) (powerBoundedSubring B) :=
  ((algebraMap A B).restrict _ _ fun _ hx ↦
    map_mem_powerBoundedSubring (Huber.isBounded_powerBoundedSubring_of_finiteEtale hA) _
      (continuous_algebraMap A B) hx).toAlgebra

section Predicates

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [UniformSpace R]

/-- The `R`-algebra `S`,
with its natural topology as a finite `R`-module (Mathlib `IsModuleTopology`, with the uniformity
of the additive group), is a complete Hausdorff perfectoid Tate ring. -/
def IsNaturallyPerfectoid (S : Type u) [CommRing S] [_root_.Algebra R S] : Prop :=
  ∀ [UniformSpace S] [IsUniformAddGroup S] [IsModuleTopology R S] [IsTopologicalRing S],
    ∃ (_ : IsTateRing S) (_ : CompleteSpace S) (_ : T2Space S), IsPerfectoidTateRing p S

variable [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
  [IsPerfectoidTateRing p R]

end Predicates

end FiniteEtale

section Untilt

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- The untilting functor for the choice of
`ϖ♭` with `ϖ = (ϖ♭)♯`, `ϖ ^ p ∣ p`: the composite `FÉt(R♭) ≃ (R♭°ᵃ)_afet → (R♭°ᵃ/ϖ♭)_afet =
(R°ᵃ/ϖ)_afet ≃ (R°ᵃ)_afet → FÉt(R)`, `T ↦ A_*[ϖ⁻¹]` with `A` the unique flat deformation of
`T°ᵃ/ϖ♭` (Sch12 Proposition 5.22 and the diagram after it; Bhatt §6.2). -/
def FiniteEtale.untiltOf (ϖ : PseudoUniformizerRoots p R) :
    CommAlgCat.FiniteEtale.{u} (tilt p R) ⥤ CommAlgCat.FiniteEtale.{u} R := sorry

/-- The untilting functor
`FÉt(R♭) ⥤ FÉt(R)`, `T ↦ T♯` (Sch12 Proposition 5.22; AWS Lemma 2.8.10; KL Lemma 3.6.20), for an
arbitrary choice of `ϖ♭` (`FiniteEtale.untilt_independent`). -/
def FiniteEtale.untilt :
    CommAlgCat.FiniteEtale.{u} (tilt p R) ⥤ CommAlgCat.FiniteEtale.{u} R :=
  FiniteEtale.untiltOf p R (Classical.arbitrary _)

end Untilt

section FullyFaithful

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- The untilting functor is
full. -/
instance FiniteEtale.untilt_full : (FiniteEtale.untilt p R).Full := sorry

/-- The untilting functor is
faithful. -/
instance FiniteEtale.untilt_faithful : (FiniteEtale.untilt p R).Faithful := sorry

end FullyFaithful

section FiniteExtensions

variable (p : ℕ) [Fact p.Prime] (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K]
  [CompleteSpace K] [IsPerfectoidField p K]

/-- Sch12 Theorem 3.7(ii), Berkeley Theorem 7.3.2: untilting is an equivalence `FÉt(K♭) ≃ FÉt(K)`. -/
instance FiniteEtale.untilt_isEquivalence_field : (FiniteEtale.untilt p K).IsEquivalence := sorry

end FiniteExtensions

section TiltingEquivalence

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]

/-- ECD Theorem 6.1(ii), KL Theorem 3.6.21: over any
perfectoid Tate ring the untilting functor `FÉt(R♭) ⥤ FÉt(R)` is an equivalence. -/
instance FiniteEtale.untilt_isEquivalence : (FiniteEtale.untilt p R).IsEquivalence := sorry

/-- The tilting equivalence `FÉt(R) ≌ FÉt(R♭)`, `S ↦ S♭`,
the inverse of the untilting functor. -/
def finiteEtaleTiltEquiv :
    CommAlgCat.FiniteEtale.{u} R ≌ CommAlgCat.FiniteEtale.{u} (tilt p R) :=
  (FiniteEtale.untilt p R).asEquivalence.symm

end TiltingEquivalence

end Perfectoid

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 4: Injections, immersions and separatedness -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits
open Huber ValuationSpectrum

namespace PerfectoidSpace

open Perfectoid


section InjectionCore

variable (p : ℕ) [Fact p.Prime] {R S : Type u} [CommRing R] [UniformSpace R]
  [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
  [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S] [IsTateRing S]
  [CompleteSpace S] [T2Space S]

/-- The map
`Spa(Q) → Spa(P)` of a morphism `φ : P → Q` of complete Tate Huber pairs is an injection when
tested on affinoid perfectoid sources `Spa(W, W⁺)` (ECD Definition 5.1 and the sentence after it:
affinoid test objects suffice): `φ` is an epimorphism towards perfectoid Huber pairs. -/
def IsInjection_affinoid {P : Pair R} {Q : Pair S} (φ : Pair.Hom P Q) : Prop :=
  ∀ (W : Type u) [CommRing W] [UniformSpace W] [IsUniformAddGroup W] [IsTopologicalRing W]
    [IsTateRing W] [CompleteSpace W] [T2Space W] [IsPerfectoidTateRing p W] (T : Pair W)
    (a b : Pair.Hom Q T), a.comp φ = b.comp φ → a = b

end InjectionCore

section InjectionTests

variable (p : ℕ) [Fact p.Prime]

example {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] (P : Pair R)
    {D : PairOfDefinition R} (𝔭 : D.Presentation) (hT : Ideal.span (𝔭.num : Set R) = ⊤) :
    IsInjection_affinoid p (RationalLoc.structureMap 𝔭 P) := sorry

example (K L C : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NontriviallyNormedField L] [IsUltrametricDist L] [CompleteSpace L]
    [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C] [IsPerfectoidField p K]
    [IsPerfectoidField p L] [IsPerfectoidField p C] [IsAlgClosed C] [Algebra K L]
    [Algebra.IsSeparable K L] (h2 : Module.finrank K L = 2) (ι : K →+* C) (hι : Continuous ι) :
    ∃ σ τ : L →+* C, Continuous σ ∧ Continuous τ ∧ σ ≠ τ ∧
      σ.comp (algebraMap K L) = ι ∧ τ.comp (algebraMap K L) = ι := sorry

end InjectionTests

end PerfectoidSpace


namespace PerfectoidSpace

open Perfectoid

section StronglyZariskiClosedDef

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B] {P : Pair A}
  {Q : Pair B}

/-- The affinoid core of a strongly Zariski closed immersion (ECD Definition 5.7 (ii)):
`Spa(B, B⁺) → Spa(A, A⁺)` induced by `φ` with `A → B` surjective and `B⁺` the integral closure
of the image of `A⁺`. The plus-ring clause is part of the definition (Torsion Definition II.2.6,
which omits it, is strictly weaker). For perfectoid `A`, `B` this is the notion of the README. -/
structure IsStronglyZariskiClosed_affinoid (φ : Pair.Hom P Q) : Prop where
  /-- `A → B` is surjective. -/
  surjective : Function.Surjective φ.toRingHom
  /-- `B⁺` is the integral closure of the image of `A⁺`. -/
  plus_eq : Q.plus = (integralClosure (P.plus.map φ.toRingHom) B).toSubring

end StronglyZariskiClosedDef

section StronglyZariskiClosedBaseChange

variable (p : ℕ) [Fact p.Prime] {A B C : Type u}
  [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A]
  [CompleteSpace A] [T2Space A] [IsPerfectoidTateRing p A]
  [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B]
  [CompleteSpace B] [T2Space B] [IsPerfectoidTateRing p B]
  [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C]
  [CompleteSpace C] [T2Space C] [IsPerfectoidTateRing p C]
  [Algebra A B] [Algebra A C] [IsAdicHom (algebraMap A B)] [IsAdicHom (algebraMap A C)]
  (S : Pair A) (T : Pair B) (U : Pair C) (hT : ∀ a ∈ S.plus, algebraMap A B a ∈ T.plus)
  (hU : ∀ a ∈ S.plus, algebraMap A C a ∈ U.plus)

/-- If
`Spa(B, B⁺) → Spa(A, A⁺)` is strongly Zariski closed, so is its base change along any
`Spa(C, C⁺) → Spa(A, A⁺)`, `(C, C⁺) → (B ⊗̂_A C)` (Tor Lemma II.2.9 (ii); fibre products via the
prelude's completed tensor product). -/
theorem IsStronglyZariskiClosed_affinoid.baseChange
    (h : IsStronglyZariskiClosed_affinoid
      (⟨algebraMap A B, IsAdicHom.continuous _, hT⟩ : Pair.Hom S T)) :
    IsStronglyZariskiClosed_affinoid (Pair.completedTensor.inr S T U hT hU) := sorry

end StronglyZariskiClosedBaseChange

end PerfectoidSpace

namespace PerfectoidSpace

open Perfectoid

section ZariskiClosedSubspace

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R]
  (P : Pair R) (D : PairOfDefinition R) (I : Ideal R) (ϖ : PseudoUniformizerRoots p R)

namespace zariskiClosedSubspace

open scoped Classical in
/-- The presentation `({1} ∪ F)/1` of
the rational subset `U_F = {|g| ≤ 1, g ∈ F}` over the pair of definition `D`. -/
def presentation_affinoid (F : Finset R) : D.Presentation where
  num := insert 1 F
  den := 1
  hasDenominatorPower := sorry

end zariskiClosedSubspace

end ZariskiClosedSubspace

end PerfectoidSpace

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 5: Cofiltered limits and finite-stage étale descent -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits Opposite
open Huber ValuationSpectrum

namespace CategoryTheory

open _root_.CategoryTheory

universe v₁ u₁ v₂ u₂ v₃ u₃

section TwoColimit

variable {J : Type u₁} [Category.{v₁} J] (F : Pseudofunctor (LocallyDiscrete J) Cat.{v₂, u₂})

namespace FilteredTwoColimit

variable {F}

variable (F)

variable (J) in
/-- The constant pseudofunctor at a category `C`
(identity transition functors; Mathlib `Functor.toPseudofunctor'`). -/
def const (C : Type u₂) [Category.{v₂} C] : Pseudofunctor (LocallyDiscrete J) Cat.{v₂, u₂} :=
  ((Functor.const J).obj (Cat.of C)).toPseudofunctor'

end FilteredTwoColimit

end TwoColimit

end CategoryTheory

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 6: κ-small perfectoid spaces and pro-étale morphisms -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open Topology Filter _root_.CategoryTheory _root_.CategoryTheory.Limits
open scoped Cardinal
open Huber ValuationSpectrum

namespace PerfectoidSpace

open Perfectoid

section KappaSmall

variable {R : Type u} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [IsHuberRing R]

/-- The clauses of ECD Definition 4.2 for `X = Spa(R, R⁺)`: (i) `#|X| < κ`, and (ii) `#O_X(U) < κ`,
here for `U = X` (`#R < κ`) and for the rational subsets `U = U(T/s)` (`T` generating the unit
ideal), whose rings are the completed rational localisations `RationalLoc 𝔭` of stage P2a, one per
presentation. The plus ring carries no condition. Intended for κ an uncountable strong limit (ECD
§4: "it is actually enough to assume that κ is an uncountable strong limit cardinal"), which the
theorems below assume. -/
structure IsKappaSmall_affinoid (κ : Cardinal.{u}) (P : Pair R) : Prop where
  /-- Clause (i): `#|Spa(R, R⁺)| < κ`. -/
  card_spa_lt : #(spa P.plus) < κ
  /-- Clause (ii) for `U = X`: `#R < κ`. -/
  card_lt : #R < κ
  /-- Clause (ii) for the rational subsets: `#R⟨T/s⟩ < κ`. -/
  card_rationalLoc_lt : ∀ (D : PairOfDefinition R) (𝔭 : D.Presentation),
    Ideal.span (𝔭.num : Set R) = ⊤ → #(RationalLoc 𝔭) < κ

/-- κ-smallness
is monotone in κ (ECD Definition 4.2). -/
theorem IsKappaSmall.mono_affinoid {κ κ' : Cardinal.{u}} (hκκ' : κ ≤ κ') {P : Pair R}
    (h : IsKappaSmall_affinoid κ P) : IsKappaSmall_affinoid κ' P := sorry

end KappaSmall

section KappaSmallTests

variable (p : ℕ) [Fact p.Prime]

example {κ : Cardinal.{0}} (hκ : κ.IsStrongLimit) (hκ₀ : ℵ₀ < κ) :
    #(spa (Pair.powerBounded ℂ_[p]).plus) = 1 ∧ #ℂ_[p] = 𝔠 ∧
      IsKappaSmall_affinoid κ (Pair.powerBounded ℂ_[p]) := sorry

example {R : Type u} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [IsHuberRing R]
    [Subsingleton R] (P : Pair R) {κ : Cardinal.{u}} (hκ₀ : ℵ₀ < κ) :
    IsKappaSmall_affinoid κ P := sorry

example {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
    [IsTateRing A] [CompleteSpace A] [T2Space A] [IsPerfectoidTateRing p A] (P : Pair A)
    {κ : Cardinal.{u}} (hκ : κ.IsStrongLimit) (hκ₀ : ℵ₀ < κ) :
    IsKappaSmall_affinoid κ P ↔ #A < κ := sorry

end KappaSmallTests

end PerfectoidSpace

end TauCetiRoadmap.PerfectoidSpaces

end

/-! ## Layer 7: Tilde-limits and Frobenius-controlled towers -/
noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti

open _root_.Topology _root_.Filter _root_.CategoryTheory _root_.CategoryTheory.Limits
open Huber ValuationSpectrum

namespace PerfectoidSpace

section TildeLimitAffinoid

variable {J : Type*} [Category J] {A : J → Type*} [∀ j, CommRing (A j)]
  [∀ j, TopologicalSpace (A j)] [∀ j, IsTopologicalRing (A j)] [∀ j, IsHuberRing (A j)]
  (P : ∀ j, Pair (A j)) (f : ∀ {i j : J}, (i ⟶ j) → Pair.Hom (P i) (P j))
  {R : Type*} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [IsHuberRing R]
  (Q : Pair R) (g : ∀ j, Pair.Hom (P j) Q)

/-- For a filtered
system of Huber pairs `(A_j, A_j⁺)` (the coordinate rings of a cofiltered system of affinoids
`X_j = Spa(A_j, A_j⁺)`) and a compatible cone `g_j : (A_j, A_j⁺) → (R, R⁺)`, the two clauses of
Scholze–Weinstein Definition 2.4.1 for `X = Spa(R, R⁺)` and the cover `U = X`: (a) the map
`|X| → lim_j |X_j|`, `x ↦ (g_j^* x)_j`, is a homeomorphism, i.e. an embedding into `∏_j |X_j|`
with image the compatible families; (b) `⋃_j im(A_j → R)` is dense in `R`. -/
structure IsTildeLimit_affinoid [IsFiltered J] : Prop where
  /-- The cone is compatible: `g_j ∘ f_a = g_i` for `a : i ⟶ j`. -/
  comm : ∀ {i j : J} (a : i ⟶ j), (g j).toRingHom.comp (f a).toRingHom = (g i).toRingHom
  /-- (a) `|X| → ∏_j |X_j|` is an embedding. -/
  isEmbedding : IsEmbedding fun (x : spa Q.plus) (j : J) ↦ (g j).spaComap x
  /-- (a) its image is `lim_j |X_j|`, the compatible families. -/
  range_eq : Set.range (fun (x : spa Q.plus) (j : J) ↦ (g j).spaComap x) =
    {y | ∀ (i j : J) (a : i ⟶ j), (f a).spaComap (y j) = y i}
  /-- (b) the union of the images of the `A_j` is dense in `R`. -/
  dense : Dense (⋃ j, Set.range (g j).toRingHom)

/-- If the
`Spa(A_j, A_j⁺)` are spectral, so is `Spa(R, R⁺)`, and the projections are spectral maps
(Sch12 Remark 7.15; Stacks Tag 0A2Z; DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces). -/
theorem IsTildeLimit.spectralSpace_affinoid [IsFiltered J] (h : IsTildeLimit_affinoid P f Q g)
    [∀ j, SpectralSpace (spa (P j).plus)] :
    SpectralSpace (spa Q.plus) ∧ ∀ j, IsSpectralMap (g j).spaComap := sorry

/-- `(R, R⁺)` with the cone `g_j` is
the *completed direct limit* of the filtered system `(A_j, A_j⁺)` in the Tate case of
Scholze–Weinstein Proposition 2.4.2: the rings of definition `A_{j,0}` are mapped into one
another, `ϖ ∈ R` is a pseudouniformiser coming from some `A_{j,0}`, the closure `R₀` of the subring
generated by the `g_j(A_{j,0})` is an open ring of definition of `R` with the `ϖ`-adic topology
(`R₀` is the `ϖ`-adic completion of `colim_j A_{j,0}`), `⋃_j g_j(A_j)` is dense in `R`, and `R⁺`
is the closure of the integral closure of the subring generated by the `g_j(A_j⁺)`. Also used by
`FrobeniusTower.isCompletedDirectLimit`. -/
structure IsCompletedColimitOfTower [IsFiltered J] (A₀ : ∀ j, Subring (A j)) (ϖ : R) :
    Prop where
  /-- The cone is compatible. -/
  comm : ∀ {i j : J} (a : i ⟶ j), (g j).toRingHom.comp (f a).toRingHom = (g i).toRingHom
  /-- The rings of definition are mapped into one another. -/
  map_le : ∀ {i j : J} (a : i ⟶ j), (A₀ i).map (f a).toRingHom ≤ A₀ j
  /-- `ϖ` is a pseudouniformiser of `R`. -/
  isPseudoUniformizer : IsPseudoUniformizer ϖ
  /-- `ϖ` comes from a ring of definition at a finite level. -/
  exists_mem : ∃ j, ∃ x ∈ A₀ j, (g j).toRingHom x = ϖ
  /-- `R₀ = closure of ⟨⋃_j g_j(A_{j,0})⟩` is an open ring of definition with ideal `(ϖ)`. -/
  exists_pairOfDefinition : ∃ (D : PairOfDefinition R) (h : ϖ ∈ D.ringOfDefinition),
    D.ringOfDefinition = (Subring.closure (⋃ j, (g j).toRingHom '' (A₀ j))).topologicalClosure ∧
      D.idealOfDefinition = Ideal.span {⟨ϖ, h⟩}
  /-- `⋃_j g_j(A_j)` is dense in `R`. -/
  dense : Dense (⋃ j, Set.range (g j).toRingHom)
  /-- `R⁺` is the closure of the integral closure of `⟨⋃_j g_j(A_j⁺)⟩`. -/
  plus_eq : Q.plus = (integralClosure (Subring.closure (⋃ j, (g j).toRingHom '' (P j).plus))
    R).toSubring.topologicalClosure

end TildeLimitAffinoid

section TildeLimitTests

open Perfectoid

variable (p : ℕ) [Fact p.Prime]

example {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] (Q : Pair R) :
    IsTildeLimit_affinoid (J := Discrete PUnit) (fun _ ↦ Q) (fun _ ↦ Pair.Hom.id Q) Q
      fun _ ↦ Pair.Hom.id Q := sorry

example : ∃ (Q : Pair (DualNumber ℂ_[p])) (φ : Pair.Hom Q (Pair.powerBounded ℂ_[p])),
    (∀ x, x ∈ Q.plus ↔ TrivSqZeroExt.fst x ∈ powerBoundedSubring ℂ_[p]) ∧
      (∀ x, φ.toRingHom x = TrivSqZeroExt.fst x) ∧
      IsTildeLimit_affinoid (J := Discrete PUnit) (fun _ ↦ Q) (fun _ ↦ Pair.Hom.id Q)
        (Pair.powerBounded ℂ_[p]) (fun _ ↦ φ) ∧ ¬ Function.Injective φ.toRingHom := sorry

example (φ : Pair.Hom (Pair.powerBounded ℚ_[p]) (Pair.powerBounded ℂ_[p])) :
    Function.Bijective φ.spaComap ∧
      ¬ IsTildeLimit_affinoid (J := Discrete PUnit) (fun _ ↦ Pair.powerBounded ℚ_[p])
        (fun _ ↦ Pair.Hom.id _) (Pair.powerBounded ℂ_[p]) fun _ ↦ φ := sorry

end TildeLimitTests

end PerfectoidSpace

namespace PerfectoidSpace

section StrongCompletionPair

variable {A : Type u} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]
  (P : Pair A) (ϖ : P.plus)

/-- `Â⁺`, the `ϖ`-adic completion of `A⁺` (Mathlib
`AdicCompletion`; SW Definition 2.3.4). -/
abbrev strongCompletionPair.integral : Type u := AdicCompletion (Ideal.span {ϖ}) P.plus

end StrongCompletionPair

end PerfectoidSpace

end TauCetiRoadmap.PerfectoidSpaces

end

noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces.Perfectoid

open TauCeti

open TauCeti.Huber TauCeti.ValuationSpectrum Topology Pointwise _root_.CategoryTheory
  CategoryTheory.Limits

/-! ## Layer 8: Finite quotients and closed perfectoid loci in towers -/
section InvariantPair

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  (G : Type*) [Group G] [MulSemiringAction G A]

/-- For a finite group acting by continuous ring
automorphisms on a Tate ring, `A^G` with the subspace topology is a Tate ring, with the invariant
pseudouniformizer `Huber.Pair.normPseudoUniformizer` and the ring of definition of
`Huber.Pair.exists_stable_ringOfDefinition`. -/
instance instIsTateRingFixedPointsSubring [IsTateRing A] [Finite G] [ContinuousConstSMul G A] :
    IsTateRing (FixedPoints.subring A G) := sorry

/-- The norm `N(ϖ) = ∏_{g ∈ G} g • ϖ`, an
element of `A^G`. Its value is `Huber.Pair.coe_normPseudoUniformizer`. -/
def Huber.Pair.normPseudoUniformizer [Fintype G] (ϖ : A) : FixedPoints.subring A G := sorry

/-- The value of the norm. -/
theorem Huber.Pair.coe_normPseudoUniformizer [Fintype G] (ϖ : A) :
    (Huber.Pair.normPseudoUniformizer G ϖ : A) = ∏ g : G, g • ϖ := sorry

variable [IsTateRing A] [Finite G] [ContinuousConstSMul G A]

/-- The invariant Huber pair `(A^G, A^{+G})`,
with `A^{+G} = A⁺ ∩ A^G` (`Huber.Pair.invariants_toSubring`), for a finite group acting by
continuous ring automorphisms preserving `A⁺`. There is no hypothesis on `|G|`. -/
def Huber.Pair.invariants (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    TauCeti.Huber.Pair (FixedPoints.subring A G) := sorry

example [Subsingleton G] (P : TauCeti.Huber.Pair A)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    FixedPoints.subring A G = ⊤ ∧
      (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype = P.plus :=
  sorry

example (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) :
    Algebra.IsInvariant (FixedPoints.subring A G) A G ∧
      (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring A G).subtype =
        P.plus ⊓ FixedPoints.subring A G := sorry

end InvariantPair

example {K : Type*} [CommRing K] [TopologicalSpace K] [IsTopologicalRing K] [IsTateRing (K × K)]
    {G : Type*} [Group G] [Fintype G] [MulSemiringAction G (K × K)]
    [ContinuousConstSMul G (K × K)] (σ : G) (hσ : ∀ x : K × K, σ • x = x.swap)
    (hG : ∀ g : G, g = 1 ∨ g = σ) (hσ1 : σ ≠ 1) (Kplus : Subring K)
    (P : TauCeti.Huber.Pair (K × K)) (hPplus : P.plus = Kplus.prod Kplus)
    (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus) (ϖ : K) :
    (∀ x : K × K, x ∈ FixedPoints.subring (K × K) G ↔ x.1 = x.2) ∧
      (∀ x : K × K,
        x ∈ (Huber.Pair.invariants G P hP).plus.map (FixedPoints.subring (K × K) G).subtype ↔
          x.1 = x.2 ∧ x.1 ∈ Kplus) ∧
      (Huber.Pair.normPseudoUniformizer G ((ϖ, ϖ) : K × K) : K × K) = (ϖ ^ 2, ϖ ^ 2) := sorry

section Spectrum

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [T2Space A]
  (G : Type*) [Group G] [MulSemiringAction G A] [IsTateRing A] [Finite G]
  [ContinuousConstSMul G A]

variable (hA : @CompleteSpace A (IsTopologicalAddGroup.rightUniformSpace A))
  (P : TauCeti.Huber.Pair A) (hP : ∀ g : G, ∀ a ∈ P.plus, g • a ∈ P.plus)

open scoped Classical in
include hA in
/-- Invariant rational subsets: if `T ∪ {s} ⊆ A^G`
generates an open ideal of `A^G`, it generates an open ideal of `A`, and the rational subset
`U(T/s)` of `Spa(A, A⁺)` is `G`-stable. That `q⁻¹ U(T/s) = U(T/s)` is Tau Ceti's
`spaComap_preimage_rationalSubset`. -/
theorem invariant_spectrum_homeomorphism_rationalSubset (T : Finset (FixedPoints.subring A G))
    (s : FixedPoints.subring A G)
    (hT : IsOpen (Ideal.span (↑(insert s T) : Set (FixedPoints.subring A G)) :
      Set (FixedPoints.subring A G))) :
    IsOpen (Ideal.span (↑((insert s T).image (FixedPoints.subring A G).subtype) : Set A) :
      Set A) ∧
      ∀ g : G, ∀ v ∈ rationalSubset P.plus (T.image (FixedPoints.subring A G).subtype) (s : A),
        ValuationSpectrum.comap (MulSemiringAction.toRingHom G A g) v ∈
          rationalSubset P.plus (T.image (FixedPoints.subring A G).subtype) (s : A) := sorry

end Spectrum

/-! ## Layer 9: Continuous torsor descent with coefficients -/
namespace TorsorDescent

section GaloisDescent

open TensorProduct

variable (A B H : Type*) [CommRing A] [CommRing B] [Algebra A B] [Group H] [Fintype H]
  [MulSemiringAction H B] [SMulCommClass H A B]

/-- The Galois condition of the map
`B ⊗_A B → ∏_{h ∈ H} B`, `b ⊗ b' ↦ (b * h • b')_h`, is bijective. -/
def IsGaloisExtension : Prop :=
  Function.Bijective
    (Algebra.TensorProduct.lift (Pi.constAlgHom A H B)
      (AlgHom.pi fun h : H ↦ MulSemiringAction.toAlgHom A B h) fun _ _ ↦ Commute.all _ _)

variable [IsGaloisGroup H A B] [FaithfulSMul A B] [Algebra.Etale A B] [Module.Finite A B]

/-- Along a finite étale Galois extension,
`M → (B ⊗_A M)^H` is an isomorphism for every `A`-module `M`. -/
theorem finite_galois_descent_of_modules_invariants (hGal : IsGaloisExtension A B H)
    (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective (fun m : M ↦ (1 : B) ⊗ₜ[A] m) ∧
      ∀ x : B ⊗[A] M,
        (∀ h : H, (MulSemiringAction.toAlgHom A B h).toLinearMap.rTensor M x = x) ↔
          ∃ m : M, x = (1 : B) ⊗ₜ[A] m := sorry

/-- Every `B`-module `N` with a semilinear
`H`-action descends: `B ⊗_A N^H ≅ N`. With the previous theorem, `M ↦ B ⊗_A M` is an
equivalence onto semilinear `H`-modules, with inverse `N ↦ N^H`. -/
theorem finite_galois_descent_of_modules_effective (hGal : IsGaloisExtension A B H)
    (N : Type*) [AddCommGroup N] [Module A N] [Module B N] [IsScalarTower A B N]
    (ρ : Representation A H N) (hρ : ∀ (h : H) (b : B) (n : N), ρ h (b • n) = (h • b) • ρ h n) :
    Function.Bijective (LinearMap.liftBaseChange B ρ.invariants.subtype) := sorry

/-- Base change preserves and reflects
finite projectivity. When `|H|` is invertible, `N^H` is the image of the idempotent
`|H|⁻¹ ∑ h`, which is Mathlib's `Representation.isProj_averageMap`. -/
theorem finite_galois_descent_of_modules_projective (hGal : IsGaloisExtension A B H)
    (M : Type*) [AddCommGroup M] [Module A M] :
    (Module.Projective A M ∧ Module.Finite A M) ↔
      (Module.Projective B (B ⊗[A] M) ∧ Module.Finite B (B ⊗[A] M)) := sorry

/-- Base change preserves and reflects
constant rank. Preservation is Mathlib's `Module.rankAtStalk_baseChange`; reflection uses that
`Spec B → Spec A` is surjective. -/
theorem finite_galois_descent_of_modules_rank (hGal : IsGaloisExtension A B H) (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Projective A M] [Module.Finite A M] (n : ℕ) :
    (∀ P : PrimeSpectrum A, Module.rankAtStalk M P = n) ↔
      ∀ Q : PrimeSpectrum B, Module.rankAtStalk (B ⊗[A] M) Q = n := sorry

end GaloisDescent

section TwistedInvariants

variable {G R : Type*} [Group G] [CommRing R] [MulSemiringAction G R]

/-- The pinned cocycle law `c (γ * δ) = c γ * γ • c δ` for `c : G → Rˣ`, with `G` acting on `R`
on the left (`γ • f = γ^* f`). It is Mathlib's `groupCohomology.IsMulCocycle₁` once `Rˣ`
carries the induced action, which it does not at the pinned commit. -/
def IsTwistCocycle (c : G → Rˣ) : Prop :=
  ∀ γ δ : G, (c (γ * δ) : R) = c γ * γ • (c δ : R)

/-- The `c`-twisted invariants `{f | ∀ γ, γ • f = (c γ)⁻¹ * f}`, an `R^G`-submodule of `R`: the
sections `ω_c(U)` of the twisted character sheaf, for one ring. -/
def twistedInvariants (c : G → Rˣ) : Submodule (FixedPoints.subring R G) R := sorry

/-- Membership in the twisted invariants. -/
theorem mem_twistedInvariants (c : G → Rˣ) (f : R) :
    f ∈ twistedInvariants c ↔ ∀ γ : G, γ • f = ((c γ)⁻¹ : Rˣ) * f := sorry

end TwistedInvariants

end TorsorDescent

end TauCetiRoadmap.PerfectoidSpaces.Perfectoid

end

/-!
## Not stated here

The following README targets are not stated in this file, because they need carriers that the
pinned libraries do not have (adic spaces as a category, Huber's tilde-limits, the pro-étale
site) or because they are long tails of the kept constructions: the perfected Tate algebra and
the cyclotomic perfectoid field, marked untilts, the comparison of `θ` with
`WittVector.fontaineTheta`, completed colimits of perfectoid pairs and cofiltered limits of
affinoid perfectoid spaces, fibre products of perfectoid spaces, finite étale and étale morphisms
and the étale site, Zariski closed and strongly Zariski closed immersions, separated maps and the
valuative criterion, the pro-category equivalence for pro-étale maps, Frobenius-controlled towers
and preperfectoid spaces, categorical quotients and `G`-clean neighbourhoods, and Čech descent
data for profinite Galois towers.
-/
