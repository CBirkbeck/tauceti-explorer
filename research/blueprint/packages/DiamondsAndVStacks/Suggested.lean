/-
This file is not the roadmap and is not exhaustive. The roadmap document
`README.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

The category C, its underlying-space functor, and the geometric morphism
properties in the relative sections are supplier parameters, not definitions of
perfectoid spaces. Instantiate them with PerfectoidSpaces P2/P4/P6. Likewise A
and tilt in D6 are the supplied pre-adic category and tilting functor. All topology
and sheaf predicates below have explicit mathematical bodies. A signature whose
required supplier interface is unavailable is listed in the omission ledger at
the end, with its mathematical statement; it is never replaced by True or an
opaque Prop. The geometric interfaces are suggested forms, not implementations.
-/
import Mathlib.CategoryTheory.SingleObj
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.CategoryTheory.Bicategory.Modification.Pseudo
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.CategoryTheory.FiberedCategory.Fibered
import Mathlib.CategoryTheory.EffectiveEpi.Basic
import Mathlib.CategoryTheory.Sites.Limits
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Pretopology
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Sites.Coherent.Basic
import Mathlib.Topology.Category.Profinite.AsLimit
import Mathlib.Topology.Category.Profinite.Basic
import Mathlib.Topology.Category.CompHaus.Projective
import Mathlib.Topology.Bases
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.CategoryTheory.Sites.Precoverage.Generates
import Mathlib.Topology.Connected.Clopen
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Spectral.Hom
import Mathlib.Topology.UniformSpace.Completion
import Mathlib.Topology.Category.TopCat.Limits.Basic
import Mathlib.SetTheory.Cardinal.Cofinality.Ordinal
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.SetTheory.Cardinal.Aleph
import Mathlib.SetTheory.Cardinal.Order

noncomputable section
open CategoryTheory CategoryTheory.Bicategory CategoryTheory.Limits Opposite Topology
universe u
namespace TauCeti.Diamonds

/-! D0: actual extensions of pinned spectral topology. -/
def IsLocallySpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ Nonempty (SpectralSpace U)

theorem IsLocallySpectralSpace.of_spectralSpace (X : Type u)
    [TopologicalSpace X] [SpectralSpace X] : IsLocallySpectralSpace X := by sorry

def IsSpectralMap.locally {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop := Continuous f ∧
  ∀ (U : Set X) (V : Set Y), IsOpen U → IsOpen V →
    Nonempty (SpectralSpace U) → Nonempty (SpectralSpace V) →
    (∀ x ∈ U, f x ∈ V) → IsSpectralMap (fun x : U => (⟨f x, by sorry⟩ : V))

theorem IsSpectralMap.locally_iff_isSpectralMap {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) : IsSpectralMap.locally f ↔ IsSpectralMap f := by sorry

theorem IsSpectralMap.locally_comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : IsSpectralMap.locally f) (hg : IsSpectralMap.locally g)
    (hY : IsLocallySpectralSpace Y) : IsSpectralMap.locally (g ∘ f) := by sorry

theorem IsLocallySpectralSpace.isOpen {X : Type u} [TopologicalSpace X]
    (hX : IsLocallySpectralSpace X) {U : Set X} (hU : IsOpen U) :
    IsLocallySpectralSpace U := by sorry

theorem IsLocallySpectralSpace.isOpen_isCompact_basis {X : Type u}
    [TopologicalSpace X] (hX : IsLocallySpectralSpace X) :
    TopologicalSpace.IsTopologicalBasis {U : Set X | IsOpen U ∧ IsCompact U} ∧
    QuasiSober X ∧ T0Space X := by sorry

theorem ConstructibleTopologyProfinite (X : Type u) [TopologicalSpace X]
    [SpectralSpace X] : T2Space (WithConstructibleTopology X) ∧
      TotallyDisconnectedSpace (WithConstructibleTopology X) := by sorry

theorem ProConstructibleSubsets {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (S : Set X) (hS : IsClosed[constructibleTopology X] S) :
    IsClosed[constructibleTopology Y] (f '' S) := by sorry

theorem ClosureOfProConstructible {X : Type u} [TopologicalSpace X] [SpectralSpace X]
    (S : Set X) (hS : IsClosed[constructibleTopology X] S) :
    closure S = {y | ∃ x ∈ S, x ⤳ y} := by sorry

theorem GeneralizingSurjectionIsQuotient {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (hg : GeneralizingMap f)
    (hs : Function.Surjective f) : IsQuotientMap f := by sorry

namespace Spectral
@[instance_reducible]
def inverseTopology (X : Type u) [TopologicalSpace X] : TopologicalSpace X :=
  TopologicalSpace.generateFrom {U | ∃ V : Set X, IsOpen V ∧ IsCompact V ∧ U = Vᶜ}

theorem inverseTopology_spectral (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    @SpectralSpace X (inverseTopology X) := by sorry

theorem inverseTopology_inverse (X : Type u) [t : TopologicalSpace X] [SpectralSpace X] :
    @inverseTopology X (inverseTopology X) = t := by sorry

theorem inverseTopology_specializes (X : Type u) [t : TopologicalSpace X]
    [SpectralSpace X] (x y : X) :
    @Specializes X (inverseTopology X) x y ↔ @Specializes X t y x := by sorry
end Spectral

theorem SpectralComponentsProfinite (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    CompactSpace (ConnectedComponents X) ∧ T2Space (ConnectedComponents X) ∧
      TotallyDisconnectedSpace (ConnectedComponents X) := by sorry

def IsSpectralSubmersion {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop := IsSpectralMap f ∧ Function.Surjective f ∧
      ∀ U : Set Y, IsOpen (f ⁻¹' U) → IsCompact (f ⁻¹' U) → IsOpen U

theorem IsSpectralSubmersion.iff_constructible {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (hs : Function.Surjective f) :
    IsSpectralSubmersion f ↔
      ∀ U : Set Y, IsConstructible U → IsOpen (f ⁻¹' U) → IsOpen U := by sorry

theorem IsSpectralSubmersion.of_quotient {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (f : X → Y) (hf : IsSpectralMap f) (hq : IsQuotientMap f) :
    IsSpectralSubmersion f := by sorry

theorem IsSpectralSubmersion.comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : IsSpectralSubmersion f) (hg : IsSpectralSubmersion g) :
    IsSpectralSubmersion (g ∘ f) := by sorry

-- `spectral_submersion_identity`
example (X : Type u) [TopologicalSpace X] : IsSpectralSubmersion (@id X) := by sorry
-- `spectral_submersion_generalizing`
example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] (f : X → Y) (hf : IsSpectralMap f)
    (hg : GeneralizingMap f) (hs : Function.Surjective f) :
    IsSpectralSubmersion f := by sorry
-- `inverse_discrete_finite`
example (X : Type u) [Finite X] : @Spectral.inverseTopology X ⊥ = ⊥ := by sorry
-- `inverse_patch_unchanged`
example (X : Type u) [t : TopologicalSpace X] [SpectralSpace X] :
    @constructibleTopology X (Spectral.inverseTopology X) = @constructibleTopology X t := by sorry

end TauCeti.Diamonds
namespace CategoryTheory
abbrev Pro (C : Type*) [Category.{u} C] := (Ind Cᵒᵖ)ᵒᵖ
namespace Pro
variable {C : Type*} [Category.{u} C]
def mk {I : Type u} [Category.{u} I] [IsCofiltered I] (F : I ⥤ C) : Pro C := by sorry

def equivProOp : Pro C ≌ (Ind Cᵒᵖ)ᵒᵖ := Equivalence.refl

def flatten : Pro (Pro C) ⥤ Pro C := by sorry
end Pro
end CategoryTheory
namespace TauCeti.Diamonds

/-! D1–D5: relative forms on a supplied geometric category and sites. -/
section Relative
variable {C : Type u} [Category.{u} C] (sp : C ⥤ TopCat.{u})

-- qcqs is an underlying-space condition for perfectoid objects, not for arbitrary sheaves.
def qcqs (X : C) : Prop :=
  CompactSpace (sp.obj X) ∧ QuasiSeparatedSpace (sp.obj X)

def coverSplits [HasCoproducts.{u} C] (J : GrothendieckTopology C) (X : C) : Prop :=
  ∀ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    Sieve.ofArrows U f ∈ J X → ∃ s : X ⟶ ∐ U, s ≫ Sigma.desc f = 𝟙 X

def IsTotallyDisconnectedPerfectoid [HasCoproducts.{u} C]
    (Jopen : GrothendieckTopology C) (X : C) : Prop :=
  qcqs sp X ∧ coverSplits Jopen X

def IsStrictlyTotallyDisconnected [HasCoproducts.{u} C]
    (Jet : GrothendieckTopology C) (X : C) : Prop := qcqs sp X ∧ coverSplits Jet X

def IsWLocalSpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  Nonempty (SpectralSpace X) ∧
    (∀ c : ConnectedComponents X, ∃! x : X, ConnectedComponents.mk x = c ∧ IsClosed ({x} : Set X)) ∧
    IsClosed {x : X | IsClosed ({x} : Set X)}

def IsWLocalPerfectoid (X : C) : Prop := IsWLocalSpectralSpace (sp.obj X)

-- W-strictness uses the supplied residue-field rings and their actual algebraic closure predicate.
def IsWStrictlyLocalPerfectoid (residue : ∀ X : C, sp.obj X → Type u)
    [∀ X x, Field (residue X x)] (X : C) : Prop :=
  IsWLocalPerfectoid sp X ∧ ∀ x, IsAlgClosed (residue X x)

variable [HasCoproducts.{u} C]
theorem IsTotallyDisconnectedPerfectoid.qcqs (Jo : GrothendieckTopology C) (X : C)
    (h : IsTotallyDisconnectedPerfectoid sp Jo X) : qcqs sp X := by sorry

theorem IsTotallyDisconnectedPerfectoid.splitting (Jo : GrothendieckTopology C) (X : C)
    (h : IsTotallyDisconnectedPerfectoid sp Jo X) : coverSplits Jo X := by sorry

theorem IsStrictlyTotallyDisconnected.splitting_etale (Jet : GrothendieckTopology C) (X : C)
    (h : IsStrictlyTotallyDisconnected sp Jet X) : coverSplits Jet X := by sorry

-- The coverage finiteness clause used by both sites is fully explicit.
def finiteQCcover {X : C} {ι : Type u} (U : ι → C) (f : ∀ i, U i ⟶ X) : Prop :=
  ∀ V : Set (sp.obj X), IsOpen V → IsCompact V →
    ∃ s : Finset ι, ∃ W : ∀ i, Set (sp.obj (U i)),
      (∀ i ∈ s, IsOpen (W i) ∧ IsCompact (W i)) ∧
      V = ⋃ i ∈ s, (sp.map (f i)) '' (W i)

namespace Perfd
variable (proet : MorphismProperty C)
def vPrecoverage : Precoverage C where
  coverings X := {R | ∃ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    R = Presieve.ofArrows U f ∧ finiteQCcover sp U f}

def proEtalePrecoverage : Precoverage C where
  coverings X := {R | ∃ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    R = Presieve.ofArrows U f ∧ finiteQCcover sp U f ∧ ∀ i, proet (f i)}

-- The geometric base-change and composition hypotheses are supplied by P2/P6.
def vTopology (sp : C ⥤ TopCat.{u}) : GrothendieckTopology C :=
  (vPrecoverage sp).toGrothendieck

def proEtaleTopology (sp : C ⥤ TopCat.{u}) (proet : MorphismProperty C) :
    GrothendieckTopology C := (proEtalePrecoverage sp proet).toGrothendieck

theorem proEtaleTopology_le_vTopology :
    proEtaleTopology sp proet ≤ vTopology sp := by sorry

def underlineSheaf (T : TopCat.{u}) : Cᵒᵖ ⥤ Type u where
  obj X := C(sp.obj (unop X), T)
  map f := TypeCat.ofHom fun g => g.comp (sp.map f.unop).hom
  map_id := by sorry
  map_comp := by sorry

theorem underlineSheaf.isVSheaf [HasPullbacks C] (T : TopCat.{u})
    (hquot : ∀ (X : C) (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
      Sieve.ofArrows U f ∈ vTopology sp X →
        IsQuotientMap (fun p : Σ i, sp.obj (U i) => (sp.map (f p.1)) p.2))
    (hpb : ∀ (X U V : C) (f : U ⟶ X) (g : V ⟶ X)
      (x : sp.obj U) (y : sp.obj V), (sp.map f) x = (sp.map g) y →
      ∃ z : sp.obj (pullback f g),
        (sp.map (pullback.fst f g)) z = x ∧ (sp.map (pullback.snd f g)) z = y) :
    Presieve.IsSheaf (vTopology sp) (underlineSheaf sp T) := by sorry
end Perfd

namespace Perfectoid
def proEtaleSite (proet : MorphismProperty C) (X : C) :=
  ObjectProperty.FullSubcategory (fun U : Over X => proet U.hom)
end Perfectoid

-- Representability is literal presheaf representability against the supplied category.
def representable (F : Cᵒᵖ ⥤ Type u) : Prop := ∃ X : C, Nonempty (F ≅ yoneda.obj X)

-- Testing a geometric morphism property on all representable base changes.
def relatively (J : GrothendieckTopology C) (Q : MorphismProperty C)
    {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (X : C) (g : yoneda.obj X ⟶ G.obj),
    ∃ (Y : C) (h : Y ⟶ X), Q h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

namespace Perf
-- Perf is a supplied characteristic-p perfectoid category, not redefined here.
def IsProEtaleEquivRel (proet : MorphismProperty C) (X R : C)
    (s t : R ⟶ X) : Prop :=
  proet s ∧ proet t ∧
  (∀ T : C, Function.Injective (fun r : T ⟶ R => (r ≫ s, r ≫ t))) ∧
  ∀ T : C, Equivalence (fun a b : T ⟶ X => ∃ r : T ⟶ R, r ≫ s = a ∧ r ≫ t = b)

def Diamond (J : GrothendieckTopology C) (proet : MorphismProperty C)
    (F : Sheaf J (Type u)) : Prop :=
  ∃ (X R : C) (s t : R ⟶ X), IsProEtaleEquivRel proet X R s t ∧
    Nonempty (F ≅ (presheafToSheaf J (Type u)).obj
      (coequalizer (yoneda.map s) (yoneda.map t)))

def IsSmallVSheaf (J : GrothendieckTopology C) (F : Sheaf J (Type u)) : Prop :=
  ∃ (X : C) (hX : Presheaf.IsSheaf J (yoneda.obj X))
    (f : (⟨yoneda.obj X, hX⟩ : Sheaf J (Type u)) ⟶ F), Epi f

namespace Diamond
def ofPerfectoid (J : GrothendieckTopology C) [J.Subcanonical] (X : C) :
    Sheaf J (Type u) := ⟨yoneda.obj X, by sorry⟩

theorem relation_eq (J : GrothendieckTopology C) [J.Subcanonical]
    (proet : MorphismProperty C) (F : Sheaf J (Type u)) (X R : C) (s t : R ⟶ X)
    (hrel : IsProEtaleEquivRel proet X R s t)
    (q : (ofPerfectoid J X) ⟶ F)
    (hs : (ofPerfectoid J R) ⟶ (ofPerfectoid J X))
    (ht : (ofPerfectoid J R) ⟶ (ofPerfectoid J X))
    (hs' : hs.hom = yoneda.map s) (ht' : ht.hom = yoneda.map t)
    (hq : hs ≫ q = ht ≫ q)
    (hpres : IsColimit (Cofork.ofπ q hq)) :
    Nonempty ((ofPerfectoid J R) ≅ pullback q q) := by sorry
end Diamond
end Perf

end Relative
end TauCeti.Diamonds

namespace CategoryTheory.Sheaf
variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)
def IsQuasicompact (F : Sheaf J (Type u)) : Prop :=
  ∀ (ι : Type u) (G : ι → Sheaf J (Type u)) (f : ∀ i, G i ⟶ F),
    EffectiveEpiFamily G f → ∃ s : Finset ι,
      EffectiveEpiFamily (fun i : s => G i) (fun i : s => f i)

def IsQuasiseparated (F : Sheaf J (Type u)) : Prop :=
  ∀ (G H : Sheaf J (Type u)), IsQuasicompact J G → IsQuasicompact J H →
    ∀ (g : G ⟶ F) (h : H ⟶ F), IsQuasicompact J (pullback g h)

namespace Hom
def IsQuasicompact {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Sheaf.IsQuasicompact J H →
    ∀ g : H ⟶ G, Sheaf.IsQuasicompact J (pullback f g)

def IsQuasiseparated {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  IsQuasicompact J (pullback.lift (𝟙 F) (𝟙 F)
    (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl))

theorem isQuasicompact_comp {F G H : Sheaf J (Type u)} (f : F ⟶ G) (g : G ⟶ H)
    (hf : IsQuasicompact J f) (hg : IsQuasicompact J g) :
    IsQuasicompact J (f ≫ g) := by sorry
end Hom

def IsAlgebraic : Prop :=
  ∀ F : Sheaf J (Type u), ∃ (ι : Type u) (G : ι → Sheaf J (Type u))
    (f : ∀ i, G i ⟶ F), EffectiveEpiFamily G f ∧
      ∀ i, IsQuasicompact J (G i) ∧ IsQuasiseparated J (G i) ∧
        Hom.IsQuasiseparated J (terminal.from (G i))
-- SGA VI 2.2: this terminal-map condition makes coherent objects stable under fibre products.
end CategoryTheory.Sheaf

namespace TauCeti.Diamonds
section Limits
variable {I : Type u} [Category.{u} I] [IsCofiltered I]
    (F : I ⥤ TopCat.{u}) [∀ i, SpectralSpace (F.obj i)]

theorem CofilteredLimitsOfSpectralSpaces
    (hs : ∀ {i j} (f : i ⟶ j), IsSpectralMap (F.map f)) :
    SpectralSpace (limit F : TopCat.{u}) := by sorry

theorem SpectralSubmersionsUnderLimits (G : I ⥤ TopCat.{u})
    [∀ i, SpectralSpace (G.obj i)] (f : F ⟶ G)
    (hF : ∀ {i j} (a : i ⟶ j), IsSpectralMap (F.map a))
    (hG : ∀ {i j} (a : i ⟶ j), IsSpectralMap (G.map a))
    (hf : ∀ i, IsSpectralSubmersion (f.app i)) :
    IsSpectralSubmersion (limMap f).hom := by sorry
end Limits

/-! Corrected component-quotient criterion. The extra condition is mathematical,
not an unnamed Prop standing for the disputed lemma. -/
section QuotientComponents
variable {G X : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace X]
    [MulAction G X] [ContinuousSMul G X]

def componentOrbitRel (c d : ConnectedComponents X) : Prop :=
  ∃ g : G, ∃ x y : X, ConnectedComponents.mk x = c ∧
    ConnectedComponents.mk y = d ∧ g • x = y

def ComponentOrbitSetoid : Setoid (ConnectedComponents X) where
  r := componentOrbitRel (G := G)
  iseqv := by sorry

def PointOrbitSetoid : Setoid X where
  r x y := ∃ g : G, g • x = y
  iseqv := by sorry

-- Both quotient topologies, including that on component orbits, are explicit.
def componentOrbitSpace (G X : Type u) [Group G] [TopologicalSpace G]
    [TopologicalSpace X] [MulAction G X] [ContinuousSMul G X] := Quotient (ComponentOrbitSetoid (G := G) (X := X))
instance : TopologicalSpace (componentOrbitSpace G X) :=
  inferInstanceAs (TopologicalSpace (Quotient (ComponentOrbitSetoid (G := G) (X := X))))

def pointOrbitSpace (G X : Type u) [Group G] [TopologicalSpace G]
    [TopologicalSpace X] [MulAction G X] := Quotient (PointOrbitSetoid (G := G) (X := X))
instance : TopologicalSpace (pointOrbitSpace G X) :=
  inferInstanceAs (TopologicalSpace (Quotient (PointOrbitSetoid (G := G) (X := X))))

def ComponentsOfRestrictedQuotients
    [TotallyDisconnectedSpace (componentOrbitSpace G X)] :
    componentOrbitSpace G X ≃
      ConnectedComponents (pointOrbitSpace G X) := by sorry
end QuotientComponents

/-! D6: marked-untilt mapping data, with explicit isomorphism relation.
P is Perfd, C is Perf, A is the supplied category of pre-adic spaces over Z_p.
This is the nonanalytic construction; the v-sheaf theorem does not say diamond. -/
section PreAdic
variable {C P A : Type u} [Category.{u} C] [Category.{u} P] [Category.{u} A]
    (tilt : P ⥤ C) (incl : P ⥤ A)
namespace PreAdic

def MarkedMap (S : C) (X : A) :=
  Σ U : P, (tilt.obj U ≅ S) × (incl.obj U ⟶ X)

def markedMapRel (S : C) (X : A) (a b : MarkedMap tilt incl S X) : Prop :=
  ∃ e : a.1 ≅ b.1, tilt.mapIso e ≪≫ b.2.1 = a.2.1 ∧
    incl.map e.hom ≫ b.2.2 = a.2.2

def markedMapSetoid (S : C) (X : A) : Setoid (MarkedMap tilt incl S X) where
  r := markedMapRel tilt incl S X
  iseqv := by sorry

variable [tilt.IsFibered]

-- Pullback of marked untilts is the cartesian tilting slice functor supplied by P2.
def diamond (X : A) : Cᵒᵖ ⥤ Type u where
  obj S := Quotient (markedMapSetoid tilt incl (unop S) X)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

def diamond_map {X Y : A} (f : X ⟶ Y) :
    diamond tilt incl X ⟶ diamond tilt incl Y := by sorry

theorem diamond_map_id (X : A) : diamond_map tilt incl (𝟙 X) = 𝟙 _ := by sorry

theorem diamond_map_comp {X Y Z : A} (f : X ⟶ Y) (g : Y ⟶ Z) :
    diamond_map tilt incl (f ≫ g) = diamond_map tilt incl f ≫ diamond_map tilt incl g := by sorry

-- This theorem applies to the geometric supplier instance of A/P/C.
-- Its unavailable continuity/gluing contract is deliberately not asserted for every category.
-- PreAdic.diamond_isVSheaf is listed with that exact contract in the omission ledger.
end PreAdic
end PreAdic
end TauCeti.Diamonds

/-! Additional ordinary interfaces. These use actual pinned types; the physical
perfectoid examples whose supplier carriers do not exist have a named ledger below. -/
namespace TauCeti.Diamonds

theorem IsSpectralMap.locally_iff_of_cover {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (f : X → Y) (hf : Continuous f)
    (hX : IsLocallySpectralSpace X) (hY : IsLocallySpectralSpace Y)
    {ι : Type u} (U : ι → Set X) (V : ι → Set Y)
    (ho : ∀ i, IsOpen (U i) ∧ IsOpen (V i))
    (hs : ∀ i, Nonempty (SpectralSpace (U i)) ∧ Nonempty (SpectralSpace (V i)))
    (hcover : ⋃ i, U i = Set.univ) (hm : ∀ i x, x ∈ U i → f x ∈ V i) :
    IsSpectralMap.locally f ↔
      ∀ i, IsSpectralMap (fun x : U i => (⟨f x, hm i x x.2⟩ : V i)) := by sorry

-- `disjoint_union_of_spectral_is_locally_spectral_not_spectral`
example : IsLocallySpectralSpace ℕ ∧ ¬ CompactSpace ℕ := by sorry
-- `open_immersion_is_spectral`
example (X : Type u) [TopologicalSpace X] [SpectralSpace X] (U : Set X)
    (ho : IsOpen U) : IsSpectralMap (Subtype.val : U → X) ↔ IsCompact U := by sorry
-- `agrees_with_mathlib_on_spectral_spaces`
example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] (f : X → Y) :
    IsSpectralMap.locally f ↔ IsSpectralMap f := by sorry

-- Two-point specialization chain, with {true} open.
@[instance_reducible]
def sierpinskiTopology : TopologicalSpace Bool := TopologicalSpace.generateFrom {{true}}
-- `inverse_sierpinski`
example : @IsOpen Bool (@Spectral.inverseTopology Bool sierpinskiTopology) {false} ∧
    ¬ @IsOpen Bool sierpinskiTopology {false} := by sorry

def HochsterRealization (X : Type u) [TopologicalSpace X] [SpectralSpace X] :=
  Σ (R : CommRingCat.{u}), (X ≃ₜ PrimeSpectrum R)

-- The ring construction is the explicitly recorded source gap, not a representation axiom.
def hochsterRealization (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    HochsterRealization X := by sorry
end TauCeti.Diamonds

namespace CategoryTheory.Pro
variable {C : Type u} [Category.{u} C]
    {I J : Type u} [Category.{u} I] [Category.{u} J] [IsCofiltered I] [IsCofiltered J]

def homStage (Y : I ⥤ C) (Z : J ⥤ C) (j : J) : Iᵒᵖ ⥤ Type u where
  obj i := Y.obj (unop i) ⟶ Z.obj j
  map f := TypeCat.ofHom fun h => Y.map f.unop ≫ h
  map_id := by sorry
  map_comp := by sorry

def homDiagram (Y : I ⥤ C) (Z : J ⥤ C) : J ⥤ Type u where
  obj j := colimit (homStage Y Z j)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

def homEquiv (Y : I ⥤ C) (Z : J ⥤ C) :
    (mk Y ⟶ mk Z) ≃ limit (homDiagram Y Z) := by sorry

theorem hasCofilteredLimits [HasFiniteLimits C] : HasCofilteredLimits (Pro C) := by sorry
-- `constant_diagram`: PUnit as the terminal category, not a one-object monoid category.
example : Pro (Discrete PUnit.{u + 1}) ≌ Discrete PUnit.{u + 1} := by sorry
end CategoryTheory.Pro

namespace CompHaus
structure ProfinitePresentation (T : CompHaus.{u}) where
  cover : Profinite.{u}
  map : C(cover, T)
  surjective : Function.Surjective map

def profinitePresentation (T : CompHaus.{u}) : ProfinitePresentation T := by sorry

theorem profinitePresentation_surjective (T : CompHaus.{u}) :
    Function.Surjective (profinitePresentation T).map := by sorry

theorem profinitePresentation_rel (T : CompHaus.{u}) :
    IsClosed {p : (profinitePresentation T).cover × (profinitePresentation T).cover |
      (profinitePresentation T).map p.1 = (profinitePresentation T).map p.2} ∧
    TotallyDisconnectedSpace {p : (profinitePresentation T).cover ×
      (profinitePresentation T).cover |
      (profinitePresentation T).map p.1 = (profinitePresentation T).map p.2} := by sorry

theorem profinitePresentation_isQuotientMap (T : CompHaus.{u}) :
    IsQuotientMap (profinitePresentation T).map := by sorry

def profinitePresentation_of_stonean (T : CompHaus.{u}) :
    (profinitePresentation T).cover ≃ₜ (projectivePresentation T).p := by sorry

namespace PresentationTests
-- `profinite_case`
example (T : Profinite.{u}) :
    ∃ P : ProfinitePresentation (profiniteToCompHaus.obj T),
      Nonempty (P.cover ≃ₜ T) ∧
      ∀ x y : P.cover, P.map x = P.map y ↔ x = y := by sorry
-- `agrees_with_mathlib_projective_presentation`
example (T : CompHaus.{u}) :
    Nonempty ((profinitePresentation T).cover ≃ₜ (projectivePresentation T).p) := by sorry
end PresentationTests
end CompHaus

namespace Profinite
-- Closedness of the relation, not profiniteness of the quotient, is the hypothesis.
theorem quotient_compHaus (S : Profinite.{u}) (r : Setoid S)
    (hr : IsClosed {p : S × S | r p.1 p.2}) :
    CompactSpace (Quotient r) ∧ T2Space (Quotient r) := by sorry
end Profinite

namespace CategoryTheory.Sheaf
variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)
namespace Hom

theorem isQuasiseparated_iff_diagonal {F G : Sheaf J (Type u)} (f : F ⟶ G) :
    IsQuasiseparated J f ↔ IsQuasicompact J (pullback.lift (𝟙 F) (𝟙 F) (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl)) := by sorry
end Hom

-- The terminal-object hypothesis corrects the false unconditional assertion in ECD p. 41.
theorem isQuasicompact_of_isQuasicompact_terminal (F : Sheaf J (Type u))
    (hterminal : IsQuasicompact J (CategoryTheory.Limits.terminal (Sheaf J (Type u))))
    (h : Hom.IsQuasicompact J (terminal.from F)) : IsQuasicompact J F := by sorry

theorem isQuasiseparated_iff_of_cover (F : Sheaf J (Type u))
    (hJ : IsAlgebraic J) (ι : Type u) (G : ι → Sheaf J (Type u))
    (f : ∀ i, G i ⟶ F) (hf : EffectiveEpiFamily G f)
    (hG : ∀ i, IsQuasicompact J (G i) ∧ IsQuasiseparated J (G i)) :
    IsQuasiseparated J F ↔ ∀ i j, IsQuasicompact J (pullback (f i) (f j)) := by sorry

namespace ObjectTests
-- `finite_coproduct` (finite clause; the nonempty infinite clause needs noninitiality).
example {ι : Type u} [Finite ι] (F : ι → Sheaf J (Type u))
    (hF : ∀ i, IsQuasicompact J (F i)) : IsQuasicompact J (∐ F) := by sorry
end ObjectTests
end CategoryTheory.Sheaf

/-! Ordinary stackification, against Mathlib's actual pseudofunctor and modification APIs. -/
namespace CategoryTheory.Functor
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{u} C]
    (J : GrothendieckTopology C)
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u})

def stackification (J : GrothendieckTopology C)
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

def toStackification : F ⟶ stackification J F := by sorry

theorem isStack_stackification : (stackification J F).IsStack J := by sorry

def stackificationUniversal (G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}) [G.IsStack J] :
    ((stackification J F) ⟶ G) ≌ (F ⟶ G) := by sorry

theorem stackification_of_isStack [F.IsStack J] (X : LocallyDiscrete Cᵒᵖ) :
    ((toStackification J F).app X).toFunctor.IsEquivalence := by sorry

-- Helper assigning a presheaf its genuinely discrete categories.
def discretePrestack (P : Cᵒᵖ ⥤ Type u) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

def stackification_discrete (P : Cᵒᵖ ⥤ Type u) (X : Cᵒᵖ) :
    (stackification J (discretePrestack P)).obj ⟨X⟩ ≌
      Discrete (((presheafToSheaf J (Type u)).obj P).obj.obj X) := by sorry

namespace StackificationTests
-- `already_a_stack`
example [F.IsStack J] (X : LocallyDiscrete Cᵒᵖ) :
    ((toStackification J F).app X).toFunctor.IsEquivalence := by sorry
-- `sheafification_agreement`
example (P : Cᵒᵖ ⥤ Type u) (X : Cᵒᵖ) :
    Nonempty ((stackification J (discretePrestack P)).obj ⟨X⟩ ≌
      Discrete (((presheafToSheaf J (Type u)).obj P).obj.obj X)) := by sorry
end StackificationTests
end CategoryTheory.Functor

namespace TauCeti.Diamonds
section FurtherRelative
variable {C : Type u} [Category.{u} C] [HasCoproducts.{u} C]
    (sp : C ⥤ TopCat.{u})

namespace Perfd
-- Functoriality in the topological target is postcomposition of continuous maps.
def underlineSheaf.functorial {S T : TopCat.{u}} (f : S ⟶ T) :
    underlineSheaf sp S ⟶ underlineSheaf sp T := by sorry

-- Absolute classes from P4/P5/P6 are explicit supplier morphism properties.
namespace Stack
variable (J : GrothendieckTopology C) (openImm closedImm etale finiteEtale proet :
    MorphismProperty C)

def IsOpenImmersion {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop := relatively J openImm f

def IsClosedImmersion (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  ∀ (X : C), IsTotallyDisconnectedPerfectoid sp Jo X →
    ∀ g : yoneda.obj X ⟶ G.obj,
    ∃ (Y : C) (h : Y ⟶ X), closedImm h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

def IsSeparated (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  IsClosedImmersion sp J closedImm Jo (pullback.lift (𝟙 F) (𝟙 F) (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl))

def IsLocallySeparated (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  ∃ (ι : Type u) (U : ι → Sheaf J (Type u)) (i : ∀ k, U k ⟶ F),
    EffectiveEpiFamily U i ∧ ∀ k, IsOpenImmersion J openImm (i k) ∧
      IsSeparated sp J closedImm Jo (i k ≫ f)

def IsQuasiProEtale (Jo Jet : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  IsLocallySeparated sp J openImm closedImm Jo f ∧
  ∀ (X : C), IsStrictlyTotallyDisconnected sp Jet X →
    ∀ g : yoneda.obj X ⟶ G.obj,
    ∃ (Y : C) (h : Y ⟶ X), proet h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

def IsEtale (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  IsLocallySeparated sp J openImm closedImm Jo f ∧ relatively J etale f

def IsFiniteEtale {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop := relatively J finiteEtale f

-- The sheaf case of zero truncation; the genuinely stack-valued faithful-fibre condition
-- appears by name in the supplier ledger rather than being collapsed to a sheaf predicate.
end Stack
end Perfd

namespace Perf
variable (J : GrothendieckTopology C) (proet : MorphismProperty C)
namespace Diamond
structure Presentation (F : Sheaf J (Type u)) where
  X : C
  R : C
  s : R ⟶ X
  t : R ⟶ X
  relation : IsProEtaleEquivRel proet X R s t
  quotientIso : F ≅ (presheafToSheaf J (Type u)).obj (coequalizer (yoneda.map s) (yoneda.map t))

def presentation (F : Sheaf J (Type u)) (hF : Diamond J proet F) : Presentation J proet F := by sorry

-- The point relation is generated by the two maps of the geometric presentation.
def pointSetoid {F : Sheaf J (Type u)} (P : Presentation J proet F) : Setoid (sp.obj P.X) :=
  Relation.EqvGen.setoid (fun x y => ∃ r : sp.obj P.R, (sp.map P.s) r = x ∧ (sp.map P.t) r = y)

def space (F : Sheaf J (Type u)) (hF : Diamond J proet F) : TopCat.{u} :=
  TopCat.of (Quotient (pointSetoid sp J proet (presentation J proet F hF)))

-- Independence of presentation is geometric, hence not asserted for arbitrary C and sp.
-- The underlying-space functor below is a D4 output parameter for D5's signatures.
end Diamond
end Perf
end FurtherRelative

section SpatialRelative
variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)
    (proet : MorphismProperty C) (sp : Sheaf J (Type u) ⥤ TopCat.{u})
    (openImm : MorphismProperty (Sheaf J (Type u)))
namespace Perf
namespace VSheaf

def IsSpatial (F : Sheaf J (Type u)) : Prop :=
  Sheaf.IsQuasicompact J F ∧ Sheaf.IsQuasiseparated J F ∧
  TopologicalSpace.IsTopologicalBasis {V : Set (sp.obj F) |
    ∃ (U : Sheaf J (Type u)) (i : U ⟶ F),
      openImm i ∧ Sheaf.IsQuasicompact J U ∧ V = Set.range (sp.map i)}
end VSheaf
namespace Diamond

def IsSpatial (F : Sheaf J (Type u)) : Prop := Diamond J proet F ∧ VSheaf.IsSpatial J sp openImm F

def IsLocallySpatial (F : Sheaf J (Type u)) : Prop :=
  ∃ (ι : Type u) (U : ι → Sheaf J (Type u)) (i : ∀ k, U k ⟶ F),
    EffectiveEpiFamily U i ∧ ∀ k, openImm (i k) ∧ IsSpatial J proet sp openImm (U k)
end Diamond
namespace Stack

def RepresentableInDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond J proet H → ∀ g : H ⟶ G, Diamond J proet (pullback f g)

def RepresentableInLocallySpatialDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond.IsLocallySpatial J proet sp openImm H →
    ∀ g : H ⟶ G, Diamond.IsLocallySpatial J proet sp openImm (pullback f g)

def RepresentableInSpatialDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond.IsSpatial J proet sp openImm H →
    ∀ g : H ⟶ G, Diamond.IsSpatial J proet sp openImm (pullback f g)
end Stack
end Perf
end SpatialRelative
end TauCeti.Diamonds

namespace CategoryTheory.Stack
open scoped Pseudofunctor.StrongTrans
variable {A B D : Type u} [Category.{u} A] [Category.{u} B] [Category.{u} D]

-- The isomorphism is data. Equality of the two images would be a strict pullback.
structure TwoFibreObject (f : A ⥤ D) (g : B ⥤ D) where
  left : A
  right : B
  iso : f.obj left ≅ g.obj right

structure TwoFibreHom {f : A ⥤ D} {g : B ⥤ D} (x y : TwoFibreObject f g) where
  left : x.left ⟶ y.left
  right : x.right ⟶ y.right
  comm : f.map left ≫ y.iso.hom = x.iso.hom ≫ g.map right

instance (f : A ⥤ D) (g : B ⥤ D) : Category (TwoFibreObject f g) where
  Hom := TwoFibreHom
  id := by sorry
  comp := by sorry
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

variable {C : Type u} [Category.{u} C]
    {F G H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}}

def twoFibreProduct (f : F ⟶ H) (g : G ⟶ H) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

def twoFibreProduct_obj (f : F ⟶ H) (g : G ⟶ H) (X : LocallyDiscrete Cᵒᵖ) :
    (twoFibreProduct f g).obj X ≌ TwoFibreObject (f.app X).toFunctor (g.app X).toFunctor := by sorry

theorem twoFibreProduct_isStack (J : GrothendieckTopology C)
    [F.IsStack J] [G.IsStack J] [H.IsStack J] (f : F ⟶ H) (g : G ⟶ H) :
    (twoFibreProduct f g).IsStack J := by sorry
end CategoryTheory.Stack

namespace TauCeti.Diamonds
section ImageSubfunctors
variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C) [J.Subcanonical]
    (sp : Sheaf J (Type u) ⥤ TopCat.{u})
namespace Perf.Diamond

def ofPerfectoidMap {X Y : C} (f : X ⟶ Y) : ofPerfectoid J X ⟶ ofPerfectoid J Y where
  hom := yoneda.map f

-- Values are literal maps with image in D, rather than a predicate placeholder.
def imagePresheaf (F : Sheaf J (Type u)) (D : Set (sp.obj F)) : Cᵒᵖ ⥤ Type u where
  obj X := {f : ofPerfectoid J (unop X) ⟶ F | Set.range (sp.map f) ⊆ D}
  map f := TypeCat.ofHom fun x => ⟨ofPerfectoidMap J f.unop ≫ x.1, by sorry⟩
  map_id := by sorry
  map_comp := by sorry

def generalizingSubdiamond (F : Sheaf J (Type u)) (D : Set (sp.obj F)) :
    Sheaf J (Type u) := (presheafToSheaf J (Type u)).obj (imagePresheaf J sp F D)

-- Sheafification here is harmless in the supplier geometric instance: the image condition
-- already satisfies v-descent. The equivalence and spatiality need that geometric instance.
def generalizationSet (F : Sheaf J (Type u)) (y : sp.obj F) : Set (sp.obj F) := {x | x ⤳ y}

def localization (F : Sheaf J (Type u)) (y : sp.obj F) : Sheaf J (Type u) :=
  generalizingSubdiamond J sp F (generalizationSet J sp F y)

-- The whole-space case is a purely sheaf-theoretic Yoneda calculation.
def generalizingSubdiamond_whole (F : Sheaf J (Type u)) :
    generalizingSubdiamond J sp F Set.univ ≅ F := by sorry

namespace SubdiamondTests
-- `generalizing_subdiamond_whole`
example (F : Sheaf J (Type u)) :
    Nonempty (generalizingSubdiamond J sp F Set.univ ≅ F) := by sorry
-- `generalizing_subdiamond_empty`
-- A base category containing an empty perfectoid object requires geometric empty-image descent;
-- without it, the arbitrary functor sp need not detect empty sheaves. See the ledger.
-- `generalizing_subdiamond_direction`
example (X : Type u) [TopologicalSpace X] [T0Space X] (x y : X)
    (h : x ⤳ y) (hne : x ≠ y) : ¬ StableUnderGeneralization ({y} : Set X) := by sorry
end SubdiamondTests
end Perf.Diamond
end ImageSubfunctors
end TauCeti.Diamonds

namespace TauCeti.Diamonds
structure SpectralCat where
  toTop : TopCat.{u}
  spectral : SpectralSpace toTop
attribute [instance] SpectralCat.spectral

namespace SpectralCat
structure Hom (X Y : SpectralCat.{u}) where
  map : C(X.toTop, Y.toTop)
  spectral : IsSpectralMap map

instance : Category.{u} SpectralCat.{u} where
  Hom := Hom
  id X := ⟨ContinuousMap.id X.toTop, by sorry⟩
  comp f g := ⟨g.map.comp f.map, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
end SpectralCat

abbrev FiniteTZero := ObjectProperty.FullSubcategory
  (fun X : TopCat.{u} => Finite X ∧ T0Space X)

def finiteTZeroToTopCat : FiniteTZero.{u} ⥤ TopCat.{u} := ObjectProperty.ι _

namespace SpectralSpace
-- Uses finite T0 spaces, not finite Hausdorff spaces.
def equivProFiniteTZero : SpectralCat.{u} ≌ CategoryTheory.Pro FiniteTZero.{u} := by sorry

structure FiniteTZeroPresentation (X : TopCat.{u}) where
  Index : Type u
  [indexCategory : Category.{u} Index]
  [cofiltered : IsCofiltered Index]
  diagram : Index ⥤ FiniteTZero.{u}
  isoLimit : X ≃ₜ (limit (diagram ⋙ finiteTZeroToTopCat) : TopCat.{u})

def asProLimit (X : TopCat.{u}) [SpectralSpace X] : FiniteTZeroPresentation X := by sorry

namespace PresentationTests
-- `spec_is_spectral`
example (R : CommRingCat.{u}) : FiniteTZeroPresentation (TopCat.of (PrimeSpectrum R)) := by sorry
end PresentationTests
end SpectralSpace
end TauCeti.Diamonds

namespace CategoryTheory.Pro
-- `profinite_case` of the pro-category node.
example : Pro FintypeCat.{u} ≌ Profinite.{u} := by sorry
end CategoryTheory.Pro

namespace TauCeti.Diamonds
-- ECD 4.1 in the three-clause form actually used by bounded constructions.
def IsCutoffCardinal (κ : Cardinal.{u}) : Prop :=
  Cardinal.aleph0 < κ ∧ Cardinal.IsStrongLimit κ ∧ Cardinal.aleph0 < κ.ord.cof ∧
  ∀ lam < κ, ∃ μ < κ, Cardinal.IsStrongLimit μ ∧ lam < μ.ord.cof

theorem CutoffCardinal (lam : Cardinal.{u}) : ∃ κ, lam < κ ∧ IsCutoffCardinal κ := by sorry

theorem CompletionCardinalityBound (G : Type u) [AddGroup G] [UniformSpace G]
    [IsUniformAddGroup G] [T2Space G] [FirstCountableTopology G]
    (A : Set G) (hA : Dense A) (lam κ : Cardinal.{u})
    (hlam : Cardinal.aleph0 ≤ lam) (hAcard : Cardinal.mk A ≤ lam)
    (hlt : lam < κ) (hκ : IsCutoffCardinal κ) :
    Cardinal.mk (UniformSpace.Completion G) ≤ lam ^ Cardinal.aleph0 ∧
    lam ^ Cardinal.aleph0 ≤ 2 ^ lam ∧ 2 ^ lam < κ := by sorry
end TauCeti.Diamonds

namespace CompHaus.PresentationTests
-- `interval`
example : Nonempty (CompHaus.ProfinitePresentation (CompHaus.of (Set.Icc (0 : ℝ) 1))) := by sorry
-- `not_every_quotient_is_profinite`
example : ∃ (S : Profinite.{0}) (r : Setoid S),
    IsClosed {p : S × S | r p.1 p.2} ∧
    Nonempty (Quotient r ≃ₜ Set.Icc (0 : ℝ) 1) ∧
    ¬ TotallyDisconnectedSpace (Quotient r) := by sorry
end CompHaus.PresentationTests

namespace CategoryTheory.Stack.QuotientTests
-- `strict_pullback_is_wrong`: the two-fibre product contains all automorphisms.
example (G : Type) [Group G] :
    Nonempty (CategoryTheory.Stack.TwoFibreObject
      ((Functor.const (Discrete PUnit)).obj (SingleObj.star G))
      ((Functor.const (Discrete PUnit)).obj (SingleObj.star G)) ≌ Discrete G) := by sorry
-- `classifying_stack_has_automorphisms`, `classifying_stack` (objectwise test).
example (G : Type u) [Group G] :
    Nonempty ((SingleObj.star G ≅ SingleObj.star G) ≃ G) := by sorry
end CategoryTheory.Stack.QuotientTests




/-! Interfaces still requiring precise signatures.
This file is not exhaustive; README.md gives the definitive mathematical scope.
The following comments name omitted signatures and the interfaces needed to state
them. They are not declarations and were not elaborated. No missing carrier is
replaced by True or a Prop-valued placeholder. Geometric specializations of the
supplier-parameter prototypes require the stated perfectoid or adic interfaces.

DiamondsAndVStacks:D0/locally-spectral-space
Required interface: The affinoid test uses the pinned Tau Ceti Spa carrier and spectralSpace_spa_of_pairOfDefinition; its dependency module is not elaborated in the shared build. The Mathlib-relative predicates and the other topological tests are stated.
tests qcqs_affinoid_is_spectral: Spa(A, A^+) of a Huber pair with a pair of definition is spectral, hence locally spectral; a definition that does not accept it is wrong.

DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces
Required interface: Instantiate the typed Pro.homEquiv with the inverse systems Z/p^n and connect their limit with the p-adic integer carrier. The limit-colimit order is already literal in the prototype; this arithmetic discrimination test is not instantiated.
tests hom_is_not_the_naive_limit: For source and target the system of finite quotients ℤ/pⁿℤ representing ℤ_p, lim_j colim_i Hom contains the identity. An element of colim_i lim_j Hom factors through one finite source quotient and has finite image, so cannot represent that identity.

DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos
Required interface: Connect the typed sheaf-object qc/qs predicates to the geometric perfectoid Yoneda objects and to opens in a topological sheaf topos. The big-site final-object warning needs the size-bounded sheaf model. The typed finite-coproduct test states only the finite clause; the noninitial infinite clause is not yet typed.
tests perfectoid_space: A perfectoid space is quasicompact, respectively quasiseparated, as a v-sheaf exactly when its underlying topological space is (ECD Proposition 8.3).
tests final_object_not_quasiseparated: For sheaves on Perfd the final object is not quasiseparated, so 'X quasicompact' and 'X -> * quasicompact' must not be defined by the same predicate (a non-example).
tests finite_coproduct: A finite coproduct of quasicompact sheaves is quasicompact; an infinite coproduct of noninitial sheaves is not quasicompact.
tests agrees_with_topological_qcqs: For sheaves on a topological space, the notions agree with quasicompactness and quasiseparatedness of the corresponding open set.

DiamondsAndVStacks:D0/stackification
Required interface: State local essential surjectivity and Hom sheafification for the actual strong-transformation unit, then connect the groupoid-object and torsor examples. The universal equivalence and discrete-presheaf agreement are typed. The SingleObj group calculation is only the objectwise automorphism calculation, not a constructed classifying stack.
api CategoryTheory.Functor.stackification_isLocallyBijective: The canonical map is locally essentially surjective and locally fully faithful.
tests classifying_stack_has_automorphisms: Stackification of the one-object groupoid prestack with automorphism sheaf a nontrivial G is BG. It retains G as automorphisms of the trivial torsor; the sheaf of isomorphism classes would erase them.
tests torsor_isomorphism_classes: For the prestack of G-torsors the sheaf of isomorphism classes of the stackification is the sheafification of the presheaf of isomorphism classes; equality before sheafification is a non-example.

DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products
Required interface: The actual TwoFibreObject and pseudofunctor product are typed. Still define the groupoid object in sheaves, its quotient pseudofunctor and atlas transformations, and the category of maps with invertible modifications needed for the universal property. The SingleObj example computes the product objectwise; it does not construct the sheaf quotient or BG.
api CategoryTheory.Stack.twoFibreProductUniversal: Its 2-universal property: maps into it are triples consisting of two maps and a 2-isomorphism between their composites.
api CategoryTheory.Stack.quotient: The quotient stack of a groupoid object in sheaves: stackify the objectwise groupoid of X(T) and R(T); the result classifies locally trivial R-torsors.
api CategoryTheory.Stack.quotient_pullback: R is the 2-fibre product of X with itself over the quotient stack.
api CategoryTheory.Stack.quotient_isoClasses: The sheaf of isomorphism classes of the quotient stack is the sheafification of the naive quotient presheaf.
api CategoryTheory.Stack.quotient_isSheaf_iff: The quotient stack is a sheaf exactly when all stabilizers are trivial.
api CategoryTheory.Stack.quotient_descent: Objects and morphisms over the quotient stack are objects and morphisms over X with descent data along R.
tests free_discrete_quotient: For a free action of a discrete group the quotient stack is the sheaf quotient.
tests classifying_stack: For X the final object and R a sheaf of nontrivial groups G, the quotient is BG, which is not a sheaf and has automorphism sheaf G.
tests iso_classes_needs_sheafification: For a G-torsor P with no global section, stackification of the action groupoid P/G has a global object, while the objectwise quotient has no global section. Its sheafification supplies the missing section.

DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
api IsTotallyDisconnectedPerfectoid.isClosed: The condition passes to closed subspaces.
api IsTotallyDisconnectedPerfectoid.isAffinoid: A totally disconnected perfectoid space is affinoid (ECD 7.5).
api IsTotallyDisconnectedPerfectoid.pi0: The projection to the profinite set of connected components.
api IsTotallyDisconnectedPerfectoid.fibre_eq_spa: Each fibre of that projection is Spa(K, K^+) for a perfectoid field K and an open bounded valuation subring.
api IsTotallyDisconnectedPerfectoid.of_components: Conversely a qcqs perfectoid space all of whose connected components have that form is totally disconnected.
tests point: Spa(K, K^+) with K perfectoid and K^+ an open bounded valuation subring is totally disconnected.
tests finite_disjoint_union: A finite disjoint union of totally disconnected perfectoid spaces is totally disconnected; an infinite one is not (the degenerate case and a non-example).
tests perfectoid_ball_is_not: The perfectoid closed unit disc over an algebraically closed C is qcqs but not totally disconnected, since it is connected with more than one closed point.
tests agrees_with_profinite: For X = S x Spa(C, O_C) with S profinite, X is totally disconnected and pi_0(X) = S; a definition that does not recover S is wrong.

DiamondsAndVStacks:D1/w-local-and-w-strictly-local
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
api IsWLocalPerfectoid.isTotallyDisconnected: A w-local perfectoid space is totally disconnected.
api IsWLocalPerfectoid.isClosed_closedPoints: The set of closed points is closed.
api IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected: A w-strictly local space is strictly totally disconnected.
tests w_local_implies_totally_disconnected: Every w-local perfectoid space is totally disconnected.
tests totally_disconnected_not_w_local: A totally disconnected perfectoid space whose set of closed points is not closed is a non-example, so the two predicates must not be defeq.
tests w_localization_is_w_local: X^wl is w-local for every qcqs perfectoid X (the construction test).
tests w_strictly_local_of_algebraically_closed: For C algebraically closed, Spa(C, C^+) is w-strictly local (the degenerate one-component case).

DiamondsAndVStacks:D1/w-localization
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
api Perfectoid.wLocalization: The w-localization X^wl of a qcqs perfectoid space.
api Perfectoid.wLocalization.toBase: The adjunction map X^wl -> X.
api Perfectoid.wLocalization.isWLocal: X^wl is w-local.
api Perfectoid.wLocalization.adjunction: Hom_wlocal(W, X^wl) ≅ Hom_qcqs(W, X), naturally, with counit X^wl → X; the left functor forgets the restriction to w-local maps.
api Perfectoid.wLocalization.isProEtale: The adjunction map is pro-etale, and affinoid pro-etale when X is affinoid.
api Perfectoid.wLocalization.pi0: pi_0(X^wl) is |X| with the constructible topology, and the component over x is the localization of |X| at x.
api Perfectoid.wLocalization.isOpenEmbedding: For U a quasicompact open subset of X, U^wl -> X^wl is a quasicompact open embedding, and quasicompact open covers induce open covers.
api Perfectoid.wLocalization.surjective: The adjunction map is surjective, hence a v-cover.
tests already_w_local: For a one-point Spa(C,O_C), the counit is an isomorphism. Already-w-local spaces with more than one specialization point need not have this property.
tests point_with_valuation_ring: For the one-point space Spa(C,O_C), w-localization is the same point. For w-local spaces with several specialization points, π₀(X^wl) = |X|_cons and the counit need not be an isomorphism.
tests pi0_is_constructible_topology: pi_0(X^wl) is |X| with its constructible topology; a construction that returns |X| with its own topology is wrong.
tests not_universally_open: X^wl -> X is not universally open in general, so it must not be confused with the cover of ECD 7.18 (a non-example).

DiamondsAndVStacks:D1/strictly-totally-disconnected
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
api IsStrictlyTotallyDisconnected.isTotallyDisconnected: A strictly totally disconnected space is totally disconnected.
api IsStrictlyTotallyDisconnected.component_eq: Every connected component is Spa(C, C^+) with C algebraically closed.
api IsStrictlyTotallyDisconnected.of_components: Conversely this condition on components implies strict total disconnectedness.
api IsStrictlyTotallyDisconnected.isClosed: The condition passes to closed subspaces, and to pro-constructible generalizing subsets.
tests algebraically_closed_point: Spa(C, C^+) with C algebraically closed is strictly totally disconnected.
tests cyclotomic_field_is_not: Spa(K, K^+) with K perfectoid but not algebraically closed is totally disconnected and not strictly totally disconnected (a non-example separating the two classes).
tests finite_disjoint_union: A finite disjoint union of strictly totally disconnected spaces is strictly totally disconnected (the degenerate case).
tests profinite_times_point: S x Spa(C, O_C) for S profinite is strictly totally disconnected, which is the shape produced by Lemma 7.19.

DiamondsAndVStacks:D1/universally-open-std-cover
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.
api Perfectoid.stdCover: For an affinoid perfectoid X, a strictly totally disconnected affinoid perfectoid X tilde over X.
api Perfectoid.stdCover.isProEtale: The structure map is affinoid pro-etale.
api Perfectoid.stdCover.surjective: The structure map is surjective, hence a v-cover.
api Perfectoid.stdCover.universallyOpen: The structure map is universally open.
api Perfectoid.stdCover.isStrictlyTotallyDisconnected: X tilde is strictly totally disconnected.
api Perfectoid.stdCover.small: If X is kappa-small then X tilde may be chosen kappa-small, for kappa a cutoff cardinal.
api Perfectoid.stdCover.oneStep: The single step X_infinity, the limit over finite products of all affinoid etale surjections, which is already universally open.
tests already_std: If X is already strictly totally disconnected the identity is such a cover (the degenerate case).
tests universally_open: The cover is universally open, unlike the w-localization; a construction that produces X^wl is wrong.
tests point: For X=Spa(C,C⁺) with C algebraically closed, the identity is an admissible universally open strictly totally disconnected cover.
tests smallness: For X kappa-small the cover is kappa-small, so the construction stays inside the kappa-small site.

DiamondsAndVStacks:D2/big-pro-etale-site
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
api Perfd.proEtalePrecoverage.isStableUnderBaseChange: Coverings are stable under base change.
api Perfd.proEtalePrecoverage.isStableUnderComposition: Coverings are stable under composition.
api Perfd.proEtaleTopology_le_of_analytic: Analytic and etale covers are pro-etale covers, so the analytic and etale topologies are coarser.
api Perfd.proEtaleCover.refineAffinoid: Every pro-etale covering is refined by one all of whose members are affinoid perfectoid.
api Perfd.proEtaleTopology.small: The topology restricts to Perfd_kappa and the inclusion is a continuous functor of sites.
api Perfd.mem_proEtaleCover_iff: Membership is the conjunction of pro-etaleness and the quasicompact image condition.
tests single_surjective_pro_etale: A surjective pro-etale map of qcqs perfectoid spaces is a covering.
tests analytic_cover: A jointly surjective family of open immersions is a covering (the degenerate case).
tests point_surjective_is_not_enough: A pro-etale family that is surjective on points but where no finite subfamily covers a given quasicompact open by images of quasicompact opens is not a covering (the required non-example).
tests matches_scheme_condition: The image condition is literally Mathlib's quasi-compact cover condition for schemes, transported along the analogy; a definition that is not equivalent to it is wrong.

DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.
api Perfd.isVCover_iff_surjective: A map of qcqs perfectoid spaces is a v-cover exactly when it is surjective on points.
api Perfd.vPrecoverage.isStableUnderBaseChange: v-coverings are stable under base change and composition.
api Perfectoid.proEtaleSite.hasFiniteLimits: The small pro-etale site has fibre products, supplied by the stability of pro-etale maps.
api Perfd.vTopology.small: The v-topology restricts to Perfd_kappa compatibly with the inclusion.
tests surjection_is_v_cover: A surjective map of affinoid perfectoid spaces is a v-cover.
tests pro_etale_is_v: Every pro-etale cover is a v-cover; the converse fails, for instance for the disjoint union of all Spa(K(x), K(x)^+) over the points of X (a non-example).
tests no_small_v_site: The category of perfectoid spaces over X with v-covers is not essentially small, so no small v-site is constructed (the degenerate case that must be refused).
tests empty_cover: The empty family covers the empty perfectoid space and nothing else.

DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
api Perfd.Stack.isQuasiProEtale_comp: Composites of quasi-pro-etale maps are quasi-pro-etale, and likewise in the etale and finite etale cases.
api Perfd.Stack.isQuasiProEtale_of_comp: If g and g composed with f are in the class then so is f.
api Perfd.Stack.isQuasiProEtale_pullback: The classes are stable under base change.
api Perfd.Stack.isQuasiProEtale_iff_isProEtale: For a map of perfectoid spaces over a strictly totally disconnected base, quasi-pro-etale is equivalent to pro-etale.
api Perfd.Stack.isEtale_iff_of_perfectoid: For a map of perfectoid spaces the etale and finite etale predicates agree with the absolute ones.
tests pro_etale_of_perfectoid_spaces: A pro-etale map of perfectoid spaces is quasi-pro-etale; the converse fails for a general base (a non-example).
tests open_immersion: An open immersion is etale, and a finite disjoint union of isomorphisms is finite etale (the degenerate cases).
tests locally_separated_is_needed: For a morphism failing local separatedness, both the étale and quasi-pro-étale predicates are false even when their other pullback conditions are postulated. This checks that Convention 10.2 is present in each predicate; it asserts no unsupported geometric quotient example.
tests agrees_with_absolute_notion: For a map of perfectoid spaces the predicates agree with the usual etale and finite etale notions of ECD section 6.

DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
api Perfd.Stack.IsZeroTruncated: The predicate that the map is faithful on groupoids of points.
api Perfd.Stack.isZeroTruncated_iff_diagonal_injection: 0-truncatedness is equivalent to the diagonal being an injection, and to the fibres being sheaves.
api Perfd.Stack.isSeparated_iff_valuative: The valuative criterion for separatedness of ECD 10.9.
api Perfd.Stack.isSeparated_uniqueness_general_pair: The variant for a general perfectoid Tate pair, ECD 10.10.
api Perfd.Stack.isSeparated_comp: The four classes are stable under composition and base change.
api Perfd.Stack.isSeparated_of_perfectoid: For a map of perfectoid spaces the notions agree with those of PerfectoidSpaces:P4.
tests open_immersion_of_perfectoid_spaces: An open immersion of perfectoid spaces is an open immersion of v-sheaves and conversely.
tests separated_not_quasiseparated: There exists a characteristic-p perfectoid X for which X/φ^ℤ is separated and not quasiseparated, as in ECD Remark 10.8. Instantiate a suitable nonempty X when typing this test; do not quantify universally over X.
tests classifying_stack_not_zero_truncated: The classifying stack of a nontrivial locally profinite group is not 0-truncated (the degenerate stack case).
tests valuative_criterion: A map of perfectoid spaces is separated exactly when the valuative criterion holds, matching PerfectoidSpaces:P4.

DiamondsAndVStacks:D3/locally-profinite-torsors
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.
api Perfd.IsTorsor: The predicate that f is a G underline-torsor, defined by v-local triviality.
api Perfd.Torsor.representable: A G underline-torsor over a perfectoid space is representable by a perfectoid space.
api Perfd.Torsor.isProEtale: It is pro-etale, universally open and a v-cover.
api Perfd.Torsor.levelSpace: For K an open subgroup, the pushout X tilde_K along G/K, which is separated etale over X.
api Perfd.Torsor.levelSpace_finiteEtale: For K' of finite index in K the transition map is finite etale.
api Perfd.Torsor.asLimit: X tilde is the inverse limit of the X tilde_K over open subgroups K.
tests split_torsor: G underline times X is a G underline-torsor over X and its level spaces are disjoint unions of copies of X (the degenerate case).
tests finite_group: For G finite, a G underline-torsor is a finite etale Galois cover with group G; a definition that does not recover this is wrong.
tests profinite_over_geometric_point: For X = Spa(C, O_C) and G profinite, a torsor is X times S for S a profinite set with a free transitive G-action.
tests not_etale: For G infinite profinite the torsor X tilde -> X is pro-etale and not etale (a non-example separating the two classes).

DiamondsAndVStacks:D4/diamond
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
api Perf: The full subcategory of perfectoid spaces of characteristic p, with its pro-etale and v-topologies.
api Perf.Diamond.isSmall: Every diamond is a small sheaf.
api Perf.Diamond.quasiProEtale_atlas: The map X -> Y from a presentation is surjective and quasi-pro-etale.
tests representable: A characteristic p perfectoid space is a diamond, with R the diagonal (the degenerate case).
tests profinite_quotient: For S profinite with a free action of a finite group G, S underline times Spa(C, O_C) modulo G is a diamond which is a perfectoid space.
tests compact_hausdorff: For T compact Hausdorff, T underline times Spa(K, O_K) is a diamond whose underlying space is T, which is not spectral in general (a required test of this layer).
tests not_every_v_sheaf: Not every v-sheaf is a diamond; the definition must not be weakened to 'v-sheaf with a surjection from a perfectoid space' (a non-example, since that is the definition of a small v-sheaf).

DiamondsAndVStacks:D4/underlying-topological-space
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
api Perf.Diamond.space_eq_quotient: For any presentation Y = X/R, |Y| is the quotient |X|/|R| with the quotient topology.
api Perf.Diamond.space_eq_points: |Y| is in canonical bijection with the equivalence classes of maps Spa(K, K^+) -> Y.
api Perf.Diamond.space_functorial: Y mapsto |Y| is a functor to topological spaces.
api Perf.Diamond.openSubfunctorEquiv: Open immersions into Y correspond bijectively to open subsets of |Y|.
api Perf.Diamond.isQuotientMap_of_surjective: A surjection of diamonds induces a quotient map of underlying spaces.
api Perf.Diamond.space_of_perfectoid: For a perfectoid space the construction returns the usual underlying topological space.
api Perf.Diamond.isOpenImmersion_iff: A map of diamonds is an open immersion exactly when it is an isomorphism onto the open subfunctor attached to an open subset of |Y|.
tests perfectoid_space: For Y a perfectoid space, |Y| is the underlying space of Y.
tests compact_hausdorff: For Y = T underline times Spa(K, O_K), |Y| = T; in particular |Y| need not be spectral (the required non-example).
tests independent_of_presentation: Two presentations of the same diamond give the same topology; a construction depending on the atlas is wrong.
tests open_subfunctors: Open subfunctors of a perfectoid space correspond to open subsets, matching the classical statement (the degenerate case).

DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.
api Perf.IsSmallVStack: The predicate that a v-stack admits a surjection from a perfectoid space with small diagonal fibre product.
api Perf.IsSmallVSheaf.ofDiamond: Every diamond is a small v-sheaf.
api Perf.IsSmallVSheaf.ofSurjectionFromDiamond: A v-sheaf with a surjection from a diamond is small.
api Perf.IsSmallVStack.ofQuasicompact: Every quasicompact v-sheaf, and every qcqs v-stack, is small.
api Perf.IsSmallVSheaf.relation_isDiamond: For a surjection from a diamond, the relation is a diamond and the quotient is the given sheaf.
api Perf.IsSmallVSheaf.relation_locallySpatial: If the sheaf is quasiseparated and the atlas locally spatial then the relation is locally spatial; if the sheaf is qcqs and the atlas spatial then the relation is spatial.
api Perf.IsSmallVStack.fibreProduct: Small v-stacks are stable under 2-fibre products.
tests diamond: Every diamond is a small v-sheaf (the degenerate case).
tests classifying_stack: The classifying stack of a locally profinite nontrivial group G over a geometric point is a small v-stack that is not a v-sheaf.
tests quasicompact_is_small: A quasicompact v-sheaf is small without any further hypothesis.

DiamondsAndVStacks:D5/spatial-diamond
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
api Perf.Diamond.IsSpatial.spectralSpace: |Y| is a spectral space, and locally spectral in the locally spatial case.
api Perf.Diamond.IsSpatial.quasicompactOpen: A quasicompact open subfunctor of a spatial diamond is spatial.
api Perf.Diamond.IsLocallySpatial.isSpectralMap: For Y' locally spatial over Y, the induced map |Y'| -> |Y| is spectral and generalizing.
api Perf.Diamond.IsLocallySpatial.qcqs_iff: Y is quasicompact, respectively quasiseparated, exactly when |Y| is.
api Perf.Diamond.isSpatial_of_perfectoid: A perfectoid space is locally spatial, and spatial exactly when qcqs.
api Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered: The set of generalizations of a point of |Y| is totally ordered.
tests qcqs_perfectoid: A qcqs perfectoid space is a spatial diamond; a non-quasicompact one is locally spatial and not spatial (the degenerate cases).
tests compact_hausdorff_not_spatial: T underline times Spa(K, O_K) for T compact Hausdorff and not profinite is qcqs and not spatial (the required non-example).
tests space_is_spectral: Spatiality implies spectrality of |Y|; the required basis consists of qc open subfunctors, not merely arbitrary topological opens.
tests open_subfunctor: Quasicompact open subfunctors of a spatial diamond are spatial, and the |U| form a basis.

DiamondsAndVStacks:D5/relative-representability
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
api Perf.Stack.representableInSpatial_iff: Representability in spatial diamonds is representability in locally spatial diamonds together with qcqs.
api Perf.Stack.representable_pullback: The three classes are stable under base change.
api Perf.Stack.representable_of_pullback: The three descent statements, with their different surjectivity and quasiseparatedness hypotheses.
api Perf.Stack.isQuasiProEtale_iff_fibres: A separated map is quasi-pro-etale exactly when it is representable in locally spatial diamonds with pro-etale geometric fibres.
api Perf.Stack.representable_isZeroTruncated: All three classes consist of 0-truncated maps.
tests diamond_base: For Y a diamond, f is representable in diamonds exactly when Y' is a diamond (the degenerate case).
tests quasi_pro_etale: A quasi-pro-etale map of locally spatial diamonds is representable in locally spatial diamonds.
tests not_representable_in_perfectoid_spaces: A morphism of diamonds need not be representable in perfectoid spaces; the definition must not impose that (the required non-example).
tests classifying_stack: The map from a geometric point to the classifying stack of a locally profinite group is representable in locally spatial diamonds and quasi-pro-etale.

DiamondsAndVStacks:D5/berkovich-quotient
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
api Perf.berkovich: The functor Y mapsto |Y|_B from small v-sheaves to topological spaces.
api Perf.berkovich_affinoid: For a complete perfectoid Tate pair (R,R⁺), B(Spd(R,R⁺)) is the supplied TB.0 spectrum M(R).
api Perf.berkovich_indep_varpi: The extension uses the intrinsic TB.0 spectrum, hence does not depend on a chosen pseudouniformizer.
api Perf.berkovich_compactHausdorff: For Y qcqs, |Y|_B is compact Hausdorff.
api Perf.berkovich_isQuotientMap: |Y| -> |Y|_B is a continuous quotient map.
api Perf.berkovich_section: The set-theoretic section |Y|_B → |Y| satisfies q∘s=id; it need not be continuous (it is continuous in the profinite and single-point cases).
api Perf.berkovich_universal: Any continuous map from |Y| to a Hausdorff space factors uniquely through |Y|_B.
api Perf.berkovich_preservesColimits: The functor preserves colimits, which is how it is extended from affinoids.
tests point: For X = Spa(C, C^+), |X|_B is a point (the degenerate case).
tests disc: For an affinoid perfectoid disc with ring R, B(X)=M(R) from TB.0; no identification with the spectrum of the ordinary rigid disc is asserted.
tests section_not_continuous: The maximal-generalization section is a set section q∘s=id; continuity is not part of its specification.
tests compact_hausdorff_diamond: For Y = T underline times Spa(K, O_K) with T compact Hausdorff, |Y|_B = T.

DiamondsAndVStacks:D6/spd-of-a-tate-pair
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
api Perf.SpdZp: The functor on Perf of marked untilts.
api Perf.SpdZp.isVSheaf: Spd Z_p is a v-sheaf.
api Perf.SpdZp.noAutomorphisms: A marked untilt has no nontrivial automorphisms, so the functor is set-valued.
api Perf.Spd: Spd(A, A^+) for a Tate Z_p-pair, as marked untilts together with a continuous map of pairs.
api Perf.Spd.isVSheaf: Spd(A, A^+) is a v-sheaf.
api Perf.Spd.functorial: (A, A^+) mapsto Spd(A, A^+) is a contravariant functor on Tate Z_p-pairs.
api Perf.Spd.ofPerfectoid: For a perfectoid pair, Spd(A, A^+) is represented by Spa of the tilt.
api Perf.Spd.rationalSubset: For U a rational subset of Spa(A, A^+), Spd(O(U), O^+(U)) -> Spd(A, A^+) is the open subfunctor attached to U.
tests perfectoid_pair: For (A, A^+) perfectoid, Spd(A, A^+) is Spa of the tilt (the degenerate case).
tests spd_qp: Spd Q_p is a v-sheaf that is not representable by a perfectoid space, which is the required test of this layer.
tests no_automorphisms: The groupoid of marked untilts of a fixed X is discrete; a construction producing a nontrivial automorphism group is wrong.
tests formal_base_excluded: (Z_p, Z_p) is not a Tate pair, so Spd(Z_p, Z_p) is not defined by this construction (a required non-example).

DiamondsAndVStacks:D6/gluing-and-the-diamond-functor
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
api Adic.diamond: The v-sheaf Y diamond attached to an analytic adic space Y over Z_p.
api Adic.diamond_affinoid: For Y = Spa(A, A^+) affinoid, Y diamond is Spd(A, A^+).
api Adic.diamond_openImmersion: An open immersion of analytic adic spaces induces an open immersion of diamonds, and rational subsets give the corresponding open subfunctors.
api Adic.diamond_functorial: Y mapsto Y diamond is a functor from analytic adic spaces over Z_p to locally spatial diamonds.
api Adic.diamond_perfectoid: For Y perfectoid, Y diamond is the tilt of Y; the construction extends the tilting equivalence.
api Adic.diamond_fibreProduct: The construction is compatible with the fibre products of analytic adic spaces over Z_p that exist.
api Adic.diamond_space: |Y diamond| = |Y| as topological spaces.
api Adic.diamond_isLocallySpatial: Y diamond is a locally spatial diamond.
tests spd_qp: Spd Q_p is the diamond of Spa(Q_p, Z_p).
tests rigid_disc: The diamond of the rigid analytic closed unit disc over Q_p is a locally spatial diamond with the same underlying space.
tests perfectoid_disc: For the perfectoid closed unit disc the construction returns its tilt (the degenerate case).
tests finite_etale_cover_and_rational_open: A finite etale cover and a rational open of an affinoid go to a finite etale map and an open immersion of diamonds; a construction that does not is wrong.

DiamondsAndVStacks:D0/spectral-submersion
Required interface: Instantiate the valuation-ring tower of Arc Remark 2.18 as a spectral TopCat diagram and prove the non-open saturated subset has open inverse image. The spectral-submersion predicate and the identity/generalizing cases are typed.
tests spectral_submersion_not_arbitrary_quotient: The inverse-limit map of Arc Remark 2.18 is a spectral submersion and fails to be an ordinary quotient map.

DiamondsAndVStacks:D0/ordinal-assembly-of-cofiltered-diagrams
Required interface: Package subcategories allowing restricted arrow sets (not full subcategories), their increasing ordinal chain, exhaustive union of objects and arrows, and the cardinal bounds. A bare ordinal cofinal replacement of every small cofiltered category would be false.
api Cofiltered.ordinalAssembly: An enumerated increasing family of small cofiltered subcategories covering all objects and arrows.
api Cofiltered.ordinalAssembly_cardinal: Each proper initial stage has the stated smaller cardinal bound.
api Cofiltered.limit_ordinalAssembly: The limit over I is the ordinal limit of the subdiagram limits.
tests ordinal_countable_sequence: For I=ℕᵒᵖ, the countable construction can be the identity sequence.
tests ordinal_terminal_diagram: A terminal indexing category has its one-stage limit.
tests ordinal_union_cones: A compatible family of cones on the subcategories determines a unique cone on their union.

DiamondsAndVStacks:D5/localization-at-a-point
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
api Perf.Diamond.localization_toBase: Canonical qc injection into Y.
api Perf.Diamond.localization_space: Underlying space is the generalizations of y.
api Perf.Diamond.localization_lift: Unique factorization for morphisms with image in that generalization set.
tests localization_closed_point_chain: In a valuation-field diamond with one closed point, localization at that closed point is the whole diamond.
tests localization_generic_point_chain: Localization at a maximal generalization has only its generalizations, not all its specializations.
tests localization_open_compatibility: Localizing an open neighbourhood U of y gives the same Y_y.

DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.
api Perf.Diamond.generalizingSubdiamond_space: Its underlying space is D with its induced topology.
api Perf.Diamond.generalizingSubdiamond_lift: A map factors uniquely precisely when its underlying image lies in D.
tests generalizing_subdiamond_open: For open D it is the existing open subdiamond.
tests generalizing_subdiamond_empty: D=∅ gives the empty diamond.

DiamondsAndVStacks:D6/pre-adic-diamondification
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
api PreAdic.Spd: The v-sheaf for an arbitrary complete Huber pair over ℤ_p.
api PreAdic.diamond_isVSheaf: The mapping presheaf satisfies v-descent.
api PreAdic.diamond_analytic: On analytic X it equals the existing analytic diamondification.
api PreAdic.diamond_formal: For Spf A, the integral v-sheaf is Spd(A,A); its analytic generic-fibre locus agrees with analytic diamondification.
api PreAdic.diamond_integralScheme: For an integral scheme and its associated pre-adic mapping functor, agree with AdicCoefficientsAndComparisons:L1 on continuous integral maps, with the same valuation subrings.
tests integral_spd_oe: For a finite extension E/ℚ_p, Spd O_E is Spd(O_E,O_E), retaining the special-fibre locus.
tests integral_spd_oc: For a complete algebraically closed extension C/ℚ_p, Spd O_C is Spd(O_C,O_C), not Spd(C,O_C).
tests integral_pair_variants: Spd(R,R) and Spd(R⁺,R⁺) use the two different complete integral rings and their own continuous maps; neither is silently replaced by Spd(R[1/ϖ],R⁺).
tests integral_formal_affine: The integral v-sheaf of Spf A is Spd(A,A).
tests integral_symmetric_power: Products (Spd O_E)^d exist as small v-sheaves and their Σ_d quotient uses D4’s small quotient construction; divisor geometry belongs to RF2.

Named targets beyond the prototype:

DiamondsAndVStacks:D0/pro-constructible-equivalence-relation — TauCeti.Diamonds.ProConstructibleEquivalenceRelation
Let X be a quasiseparated locally spectral space and R inside X x X a pro-constructible equivalence relation whose two projections s, t : R → X are quasicompact and generalizing. Then the quotient space X/R is T0. Moreover for every quasicompact open W inside X there is an open R-invariant subset U containing W with U contained in E', where E' is an R-invariant intersection of a nonempty family of quasicompact open subsets.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D0/spectral-quotient-criterion — TauCeti.Diamonds.SpectralQuotientCriterion
For spectral X, consider a pro-constructible equivalence relation R ⊂ X × X with generalizing projections. Suppose the quotient topology on X/R has an open basis whose inverse images under q:X→X/R are qc. Under this extra condition, X/R is spectral, and q is both spectral and generalizing. There is also a local version: under the qs, locally spectral and qc-projection hypotheses of D0.8, openness of the projections makes X/R locally spectral and qs, with q open, spectral and qcqs. Keep the basis or openness hypothesis; pro-constructibility and generalizing projections alone do not ensure spectrality of the quotient.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites — TauCeti.Diamonds.FilteredColimitsAndCohomologyOnCoherentSites
Let (C, J) be a site with a generating full subcategory of qcqs objects stable under fibre products, so that the category of sheaves is algebraic. Then for a filtered diagram of abelian sheaves F_j the colimit is computed sectionwise on qcqs objects, and for every qcqs object X and every i the natural map colim_j H^i(X, F_j) → H^i(X, colim_j F_j) is an isomorphism. The same holds for sheaves of sets and of groups in degrees 0, respectively 0 and 1.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D0/cech-to-derived-comparison — TauCeti.Diamonds.CechToDerivedComparison
For a site (C, J), a cover of an object X and an abelian sheaf F there is a spectral sequence from the Čech cohomology of the cover with coefficients in the presheaves H^q(F) converging to H^{p+q}(X, F). For a morphism of topoi f:Y→X, whose inverse image on abelian sheaves is exact, there is a Leray spectral sequence H^p(X, R^q f_* F) converging to H^{p+q}(Y, F). If B is a basis of the site consisting of objects on which F is acyclic and on which the covers of the site can be refined by covers by objects of B, then Čech cohomology computed on B agrees with sheaf cohomology. Mathlib has the Čech complex functor and Ext-theoretic sheaf cohomology, but none of these three comparisons.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D1/split-cover-characterisation — TauCeti.Diamonds.SplitCoverCharacterisation
Let X be spectral. The following are equivalent: every open cover splits; every connected component has a unique closed point; global sections on ordinary set-valued sheaves sends epimorphisms to surjections; global sections on abelian sheaves is exact; every abelian sheaf has vanishing H^i for i>0; every abelian sheaf has vanishing H^1. This is the Fargues characterization with the epimorphism condition on set-valued sections: ECD 7.2(iii) overstates the set-valued condition as preservation of all finite colimits. For the two-point discrete X, global sections is the product functor Set×Set→Set and does not preserve binary coproducts. No finite-colimit-preservation claim for set-valued global sections is made.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D1/components-of-totally-disconnected — TauCeti.Diamonds.ComponentsOfTotallyDisconnected
For a totally disconnected perfectoid X, construct the continuous component projection X→π₀(X) and prove that π₀(X) is profinite. Describe its fibres as valuation spectra Spa(K,K⁺), where K is perfectoid and K⁺ is a valuation subring that is open and bounded. The description also characterizes total disconnectedness among qcqs perfectoid spaces: having all components of this form is sufficient. Prove additionally that every totally disconnected perfectoid X is affinoid.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid — TauCeti.Diamonds.ProConstructibleGeneralizingSubsetsAreAffinoid
Let X be a totally disconnected perfectoid space and U a pro-constructible generalizing subset of |X|. Then U is an intersection of subsets of the form {|f| at most 1} for f in H^0(X, O_X). In particular U carries a natural structure of affinoid perfectoid space, which is again totally disconnected. In particular every quasicompact open subset of X is affinoid.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D1/pro-etale-maps-over-std-base — TauCeti.Diamonds.ProEtaleMapsOverStdBase
Fix a strictly totally disconnected perfectoid base X and a qc separated morphism f : Y → X. The pro-étale condition on f is equivalent to the following fibre condition: at each rank-one point x = Spa(C, O_C), some profinite S_x identifies Y_x with x × S_x. Either condition also makes Y strictly totally disconnected and f affinoid pro-étale. Affinoid Y automatically supplies the separatedness hypothesis, since morphisms between affinoid perfectoid spaces are separated.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps — TauCeti.Diamonds.TopologicalClassificationOfProEtaleMaps
Let T be spectral with every connected component a totally ordered chain of specializations. A spectral map S→T with S spectral is affinoid pro-étale if S→T×_{π₀(T)}π₀(S) is a pro-constructible generalizing embedding. A spectral map from a locally spectral S is pro-étale if S has an open cover by spectral subspaces on which the map is affinoid pro-étale. Here spectral for locally spectral spaces means the restriction between any spectral open subspaces is quasicompact, as in ECD 2.1; it does not require S itself to be quasicompact. For strictly totally disconnected perfectoid X, Y↦|Y| gives equivalences between affinoid pro-étale spaces over X and affinoid pro-étale spectral maps to |X|, and between arbitrary pro-étale spaces over X and pro-étale locally spectral maps to |X|. The κ-small restrictions use the same cutoff cardinal on spaces and topological sources. The inverse uses the varpi-adic completion of the pullback of O^+_X and valuations pulled back from X, and glues on spectral opens.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D1/automatic-flatness — TauCeti.Diamonds.AutomaticFlatness
Choose a totally disconnected affinoid perfectoid base X=Spa(R,R⁺), an affinoid perfectoid Y=Spa(S,S⁺), and a morphism f:Y→X. For any pseudouniformizer varpi in R, reduction of the integral-ring map gives a flat R⁺/varpi-algebra S⁺/varpi. Surjectivity of the underlying map |f| strengthens this to faithful flatness. The conclusion concerns these reduced integral rings over this particular base; it does not assert flatness for arbitrary perfectoid-ring morphisms.
Required interface: Requires the supplied category of perfectoid spaces with affinoid rings, residue valuation fields, rational localization and pro-étale limits (PerfectoidSpaces P2/P4/P5/P6). The prototype only states the literal underlying-space or cover-splitting predicate; it cannot instantiate this geometric statement before those interfaces exist.

DiamondsAndVStacks:D2/cutoff-independence — TauCeti.Diamonds.CutoffIndependence
For cutoff cardinals kappa and kappa' as in ECD 4.1 and a kappa-small perfectoid space X, the pullback functor from sheaves on X_proet,kappa to sheaves on X_proet,kappa' is fully faithful and preserves cohomology: for every sheaf of sets, respectively of groups, respectively of abelian groups F, the unit is an isomorphism and the higher direct images vanish in the relevant degrees. The same holds for pro-étale or v-cohomology on Perfd_kappa and their slices. Consequently one defines the category of small sheaves as the filtered colimit over all kappa, and a sheaf commuting with omega_1-filtered colimits of affinoid perfectoid rings is small.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D2/perfectoid-sheaf-topoi-are-algebraic — TauCeti.Diamonds.PerfectoidSheafTopoiAreAlgebraic
The categories of small sheaves on Perfd for either the big pro-étale or the v-topology, and the category of small sheaves on X_proet for a perfectoid space X, are algebraic in the sense of SGA 4 VI: a basis of qcqs objects stable under fibre products is given in all cases by the affinoid perfectoid spaces. Moreover a perfectoid space X is quasicompact, respectively quasiseparated, in any of these settings if and only if |X| is quasicompact, respectively quasiseparated. For a map of stacks on such a site, quasiseparatedness is required to mean that the diagonal is quasicompact and quasiseparated, which for stacks is not automatic since the diagonal need not be injective.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves — TauCeti.Diamonds.ProEtaleEtaleComparisonAndStructureSheaves
Let X be a perfectoid space and nu : X_proet → X_et the natural map of sites. For every sheaf F on X_et the adjunction F → nu_* nu^* F is an equivalence, and for F abelian R^i nu_* nu^* F = 0 for i at least 1. For an affinoid pro-étale Y = lim Y_i over an affinoid open X_0 of X the natural map colim_i F(Y_i) → (nu^* F)(Y) is an isomorphism. The presheaves O and O^+ on X_proet are small sheaves, and for X affinoid perfectoid H^i(X_proet, O) = 0 for i > 0 and H^i(X_proet, O^+) is almost zero for i > 0.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D2/subcanonicity-of-the-pro-etale-topology — TauCeti.Diamonds.SubcanonicityOfTheProEtaleTopology
On the big pro-étale site, both assignments X ↦ O_X(X) and X ↦ O⁺_X(X) satisfy the small-sheaf condition. Representable presheaves also satisfy it: for a perfectoid X, the assignment Y ↦ Hom(Y, X) is a small pro-étale sheaf. Thus this topology is subcanonical.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D2/v-descent-of-functions — TauCeti.Diamonds.VDescentOfFunctions
The presheaves O and O^+ on the v-site are small sheaves, and the v-site is subcanonical: for every perfectoid space X the functor Y mapsto Hom(Y, X) is a small v-sheaf.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D2/higher-v-acyclicity — TauCeti.Diamonds.HigherVAcyclicity
Let X be an affinoid perfectoid space. Then H^i_v(X, O) = 0 for i > 0, and H^i_v(X, O^+) is almost zero for i > 0. Together with the v-sheaf property this is Theorem 1.2 of the introduction: v-cohomology of O on an affinoid perfectoid space is concentrated in degree zero, where it is R, and v-cohomology of O^+ is almost concentrated in degree zero, where it is R^+.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D3/descent-prestacks-of-perfectoid-spaces — TauCeti.Diamonds.DescentPrestacksOfPerfectoidSpaces
Assign to each perfectoid base X the groupoid F(X) of perfectoid spaces over X. Restriction to a v-cover Y→X induces a fully faithful functor from F(X) to the descent-data category F(Y/X) of ECD 9.1: compatible morphisms on the cover descend uniquely. Establish the same full-faithfulness statement after restricting the objects to each of four classes: affinoid perfectoid, separated pro-étale perfectoid, separated étale perfectoid, and finite étale perfectoid. The subsequent effectivity statements concern these four restrictions.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/effective-descent-affinoid-over-totally-disconnected — TauCeti.Diamonds.EffectiveDescentAffinoidOverTotallyDisconnected
For affinoid perfectoid X, write F(X) for the groupoid of affinoid perfectoid spaces over X. If X is totally disconnected and Y→X is a v-cover with affinoid perfectoid Y, restriction gives an equivalence F(X)≃F(Y/X). Effectivity requires reconstruction of the Tate ring together with its integral subring; a descent theorem for functions alone does not establish this equivalence.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions — TauCeti.Diamonds.DescendedSubsetsAreCutOutByFunctions
Work over a totally disconnected affinoid perfectoid X=Spa(R,R⁺). Let X tilde=Spa(R tilde,R tilde⁺) be affinoid perfectoid over X, with A ⊂ |X tilde|. Suppose an affinoid perfectoid surjection Y=Spa(S,S⁺)→X makes the inverse image of A in |Y tilde|, for Y tilde=X tilde×_X Y, an intersection of inequalities |g|≤1 with g∈S tilde. Then A itself is an intersection of inequalities |f|≤1 for f∈R tilde. Include the auxiliary point-lifting result: a rational subset of a perfectoid ball over (C,C⁺) has a (C,C⁺)-point if it maps onto Spa(C,C⁺).
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/effective-descent-separated-pro-etale — TauCeti.Diamonds.EffectiveDescentSeparatedProEtale
For each perfectoid X, let F(X) classify separated pro-étale perfectoid spaces over X. Once X is strictly totally disconnected, any v-cover Y→X gives an equivalence between F(X) and the category F(Y/X) of descent data. Thus the restriction functor is essentially surjective as well as fully faithful under this base hypothesis.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks — TauCeti.Diamonds.EtaleAndFiniteEtaleAreVStacks
Effective v-descent holds for the groupoid of separated étale objects over each perfectoid base, and for the groupoid of finite étale objects. These stack assertions give local criteria for morphisms. Given f : Y → X and a v-cover X̃ → X, write f̃ for the pullback. Étaleness or finite étaleness of f̃ implies the corresponding property of f. If X is strictly totally disconnected, pro-étaleness of f̃ likewise implies pro-étaleness of f.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces — TauCeti.Diamonds.SubVSheavesOfTotallyDisconnectedSpaces
Let X be a totally disconnected perfectoid space and Y a sub-v-sheaf of X. Then Y is ind-representable: it is the filtered colimit of the Y_i inside Y inside X that are pro-constructible generalizing subsets of X, each of which is affinoid pro-étale over X. Consequently a quasicompact injection f : Y' → Y of v-stacks is quasi-pro-étale, and for every totally disconnected perfectoid space X over Y the fibre product Y' x_Y X is represented by a pro-constructible generalizing subset of X.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes — TauCeti.Diamonds.VLocalNatureOfMorphismClasses
Let f : Y' → Y be a map of v-stacks, g : Y tilde → Y a surjective map of v-stacks and f tilde the pullback of f. If f tilde is quasicompact, respectively quasiseparated, then so is f; if f tilde is an open, respectively closed, immersion then so is f; if f tilde is separated then so is f; if f tilde is finite étale then so is f; if f tilde is separated and étale then f is separated and étale; if f tilde is separated and quasi-pro-étale then f is separated and quasi-pro-étale.
Required interface: Requires the stack-valued slice and representability/2-fibre-product interface from D0 together with perfectoid descent from D2. Sheaf-valued specializations in the prototype do not supply the full stack statement or geometric torsor/valuative example.

DiamondsAndVStacks:D4/quotient-presentations-of-diamonds — TauCeti.Diamonds.QuotientPresentationsOfDiamonds
Let X be in Perf and R inside X x X a pro-étale equivalence relation. Then the quotient sheaf Y = X/R is a diamond; the natural map R → X x_Y X of sheaves on Perf is an isomorphism; for any pro-étale cover X tilde → X by a perfectoid space the induced R tilde on X tilde is again a pro-étale equivalence relation and X tilde/R tilde → Y is an isomorphism; and the map X → Y is quasi-pro-étale.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds — TauCeti.Diamonds.AtlasCharacterisationOfDiamonds
A pro-étale sheaf Y on Perf admits a diamond presentation exactly when it has a quasi-pro-étale atlas q:X→Y with perfectoid X and q surjective as a sheaf map. When X is a coproduct of strictly totally disconnected spaces, its kernel relation R=X×_Y X is pro-étale and the sheaf quotient X/R recovers Y. Deduce three closure statements: a sheaf covered quasi-pro-étale by a diamond is a diamond; a quasi-pro-étale source over a diamond is a diamond; and the sheaf quotient of a diamond by an equivalence relation with quasi-pro-étale projections is a diamond.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D4/diamonds-are-v-sheaves — TauCeti.Diamonds.DiamondsAreVSheaves
Let Y be a diamond. Then Y is a sheaf for the v-topology. Moreover, if f : Y' → Y is an injection of v-sheaves and Y is a diamond, then Y' is a diamond; and a qcqs map f : Y → X of diamonds is an isomorphism if and only if f(K, K^+) is a bijection for every algebraically closed perfectoid field K with an open and bounded valuation subring K^+.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D4/compact-hausdorff-diamonds — TauCeti.Diamonds.CompactHausdorffDiamonds
Fix a perfectoid field K of characteristic p. The functor sending a compact Hausdorff space T to T underline times Spa(K, O_K) is a fully faithful functor from compact Hausdorff spaces to diamonds over Spa(K, O_K). For S profinite, S underline times Spa(K, O_K) is the affinoid perfectoid space Spa(C^0(S, K), C^0(S, O_K)). The underlying topological space of T underline times Spa(K, O_K) is T, so it can be far from spectral.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks — TauCeti.Diamonds.SpacesAndSurjectivityForSmallVStacks
Let Y be a small v-stack with a presentation Y = X/R, X a diamond, R a small v-sheaf and R tilde → R a surjection from a diamond. There is a canonical bijection between |X|/|R tilde| and the set of maps Spa(K, K^+) → Y modulo the domination relation, and the quotient topology is independent of the presentation; this defines |Y|. Open sub-v-stacks of Y correspond bijectively to open subsets of |Y|, and a surjection of small v-stacks induces a quotient map of spaces. Fibre products of small v-stacks are small v-stacks and the map from the space of the fibre product to the fibre product of the spaces is surjective. Finally, if f is a surjection of v-stacks then |f| is surjective; conversely if f is quasicompact and |f| is surjective then f is a surjection of v-stacks. Without the quasicompactness hypothesis the converse fails.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks — TauCeti.Diamonds.IsomorphismCriteriaForVSheavesAndStacks
For a qcqs morphism f:Y′→Y of v-stacks, geometric-point evaluation characterizes isomorphisms: f is an isomorphism exactly when Y′(K,K⁺)→Y(K,K⁺) is an equivalence of groupoids for every algebraically closed perfectoid K and every open bounded valuation subring K⁺. There is a separate injectivity criterion for small v-sheaves. Assume f is qcqs or that both objects are locally spatial. Then sheaf injectivity is equivalent to injectivity of all evaluations on perfectoid fields with open bounded valuation subrings. A third equivalent condition requires both injectivity of |f| and finality of f among maps from small v-sheaves whose underlying spaces factor continuously through |Y′|; equivalently, Y′≅Y×_{underline(|Y|)}underline(|Y′|).
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D5/injection-and-finite-etale-permanence — TauCeti.Diamonds.InjectionAndFiniteEtalePermanence
Let Y be a locally spatial diamond and f : Y' → Y a quasicompact injection of v-sheaves. Then Y' is a locally spatial diamond, |Y'| inside |Y| is pro-constructible and generalizing with the subspace topology, and Y' is the fibre product of Y with |Y'| underline over |Y| underline. If instead Y is a (locally) spatial diamond and Y' → Y is a finite étale map of pro-étale sheaves then Y' is a (locally) spatial diamond; the same holds with 'diamond' replaced by 'v-sheaf' and Y spatial.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence — TauCeti.Diamonds.QuasiProEtaleAndFibreProductPermanence
Local spatiality passes from a diamond Y to any pro-étale sheaf Y′ with a quasi-pro-étale morphism Y′ → Y; the morphism includes local separatedness under Convention 10.2. Fibre products preserve spatiality and local spatiality. For a qcqs diamond Y, a universally open surjective quasi-pro-étale cover by a (locally) spatial diamond already forces Y to be spatial.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons — TauCeti.Diamonds.LimitsAndFiniteStageComparisons
Let Y_i be a cofiltered inverse system of diamonds with qcqs transition maps and Y its limit. Then Y is a diamond, |Y| → lim |Y_i| is a continuous bijection, and the maps Y → Y_i are qcqs; if all Y_i are (locally) spatial then so is Y and |Y| → lim |Y_i| is a homeomorphism. If kappa is a cutoff cardinal, the index category is kappa-small and all Y_i are kappa'-small for some kappa' < kappa, then Y is kappa-small. For a cofiltered system of qcqs diamonds, base change gives equivalences from the 2-colimit of the categories of finite étale, of qcqs étale, and of quasicompact separated étale objects over the Y_i to the corresponding categories over Y. The same statements hold for small v-sheaves.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/universally-open-presentation — TauCeti.Diamonds.UniversallyOpenPresentation
Use E for the class of étale maps obtained by composing qc open immersions and finite étale maps. Every spatial diamond Y has a strictly totally disconnected perfectoid presentation X → Y which is universally open, surjective and quasi-pro-étale, with a cofiltered E-presentation. When Y is κ-small for a cutoff cardinal κ, choose X κ-small as well. In the other direction, a qcqs diamond is spatial if it has a universally open surjective quasi-pro-étale cover by a perfectoid space; a (locally) spatial diamond may replace that covering space. The key splitting criterion constructs a strictly totally disconnected perfectoid space from a spatial diamond on which every surjective E-cover has a section.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/two-out-of-three-for-quasi-pro-etale — TauCeti.Diamonds.TwoOutOfThreeForQuasiProEtale
Consider f : Y₁ → Y₂ and g : Y₂ → Y₃ in locally spatial diamonds, with h=g∘f. Suppose f is a surjective quasi-pro-étale map, h is quasi-pro-étale, and g is separated. These hypotheses force g to be quasi-pro-étale. Requiring f and h both étale forces g to be étale; requiring both finite étale forces g to be finite étale.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/local-structure-of-etale-maps — TauCeti.Diamonds.LocalStructureOfEtaleMaps
Let f : Y' → Y be an étale map of locally spatial diamonds. Then for every point y' of |Y'| with image y, there are open neighbourhoods V' of y' in Y' and V of y in Y containing f(V') such that the restriction of f to V' factors as a quasicompact open immersion of V' into some W followed by a finite étale map W → V. This generalizes the corresponding local structure theorem for étale maps of perfectoid spaces, and by Convention 10.2 f is required to be locally separated, which is necessary since the restriction is separated.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/spatial-v-sheaf-criterion — TauCeti.Diamonds.SpatialVSheafCriterion
A spatial v-sheaf Y is a spatial diamond if some perfectoid X admits a quasi-pro-étale map f:X→Y that is surjective on underlying points. Sheaf surjectivity of f is not required. Equivalently, each y∈|Y| must occur in the image of a quasi-pro-étale map Spa(C,C⁺)→Y with C algebraically closed. This is a criterion expressed through the points of Y.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology — TauCeti.Diamonds.ReductionToSpatialAndHausdorffCohomology
Let Y be a quasicompact separated diamond. Then the map Y → |Y|_B underline is representable in locally spatial diamonds; equivalently a general quasicompact separated diamond differs from a locally spatial one only through a map to a compact Hausdorff space. Moreover, for f : |Y| → |Y|_B the pullback f^* induces a fully faithful functor from D^+(|Y|_B, Z) to D^+(|Y|, Z), so that H^i(|Y|_B, F) is isomorphic to H^i(|Y|, f^* F) for every abelian sheaf F on |Y|_B. This cohomological assertion is proved with ordinary sheaf cohomology, not with the later diamond coefficient category.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D6/spd-is-a-spatial-diamond — TauCeti.Diamonds.SpdIsASpatialDiamond
Let A be a Tate Z_p-algebra with an open and integrally closed subring A^+ inside A. Choose a cofiltered inverse system of finite groups G_i with surjective transition maps and a compatible filtered direct system of finite étale G_i-torsors A → A_i such that A_infinity has no nonsplit finite étale covers, with A_i^+ the integral closure of A^+ and A_infinity^+ the closure of the colimit inside the uniform completion. Then Spd(A_i, A_i^+) → Spd(A, A^+) is a G_i-torsor of v-sheaves, Spd of the completion of A_infinity is the inverse limit and is a G underline-torsor over Spd(A, A^+) for G the limit of the G_i, and it is an affinoid perfectoid space. Hence Spd(A, A^+) is a spatial diamond with |Spd(A, A^+)| = |Spa(A, A^+)|.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

DiamondsAndVStacks:D6/etale-site-comparison — TauCeti.Diamonds.EtaleSiteComparison
Let Y be an analytic adic space over Z_p. Then Y diamond is a locally spatial diamond with |Y diamond| = |Y|. Moreover there are equivalences of sites between the étale site of Y diamond and the étale site of Y, and between their finite étale sites. Prove full faithfulness and essential surjectivity on the étale categories separately. This is an equivalence of étale categories on the already constructed diamond; it is not full faithfulness of the diamond functor on all analytic adic spaces, and it is not the later derived left-completion comparison.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

DiamondsAndVStacks:D6/untilt-descent-along-v-covers — TauCeti.Diamonds.UntiltDescentAlongVCovers
Let X = Spa(R, R^+) be an affinoid perfectoid space of characteristic p, Y = Spa(S, S^+) → X a v-cover, and Y sharp = Spa(S sharp, S sharp+) an untilt of Y such that the two induced untilts of Z = Y x_X Y = Spa(T, T^+) agree. Then there is a unique untilt X sharp = Spa(R sharp, R sharp+) of X whose pullback to Y is Y sharp. Concretely R sharp = W(R^+)/xi with varpi sharp inverted, for a primitive element xi of W(R^+), and R sharp+ is determined by R^+.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

DiamondsAndVStacks:D0/constant-sheaf-on-irreducible-space — TauCeti.Diamonds.ConstantSheafOnIrreducibleSpace
For an irreducible topological space X and an abelian group A, the constant sheaf has sections A on every nonempty open and the zero group on the empty open. All restriction maps are surjective, so it is flasque and H^i(X,A_X)=0 for i>0. A spectral space with a generic point is such an X.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D0/coherent-topos-limit-cohomology — TauCeti.Diamonds.CoherentToposLimitCohomology
Let (E_i) be a small cofiltered diagram of coherent topoi with coherent transition morphisms, E its topos limit and p_i:E→E_i. Fix i and an abelian sheaf F_i, and put F=p_i^*F_i. For every n≥0 the canonical colim_{j→i} H^n(E_j,p_{ji}^*F_i) → H^n(E,F) is an isomorphism. More generally allow compatible filtered systems of sheaves as in SGA VI 8.7.7. Coherence supplies the filtered-colimit compatibility of derived direct images required by VI 8.7.1.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D0/ordinary-sheaves-on-profinite-sets — TauCeti.Diamonds.OrdinarySheavesOnProfiniteSets
For a profinite set S, ordinary Set- or Ab-valued sheaves are equivalent to contravariant functors on the Boolean algebra of clopens sending the empty set to the terminal object and finite disjoint unions to products. For S=βI (I discrete), clopens identify with subsets of I. For a family of sets or abelian groups A_i, the sheaf J↦∏_{i∈J} A_i has stalk at an ultrafilter U equal to colim_{J∈U}∏_{i∈J}A_i, the ordinary ultraproduct; stalk isomorphisms detect sheaf isomorphisms. No infinity-categorical extension or hypercompletion theorem is asserted here.
Required interface: The ordinary categorical/topological carrier for this precise statement is not yet connected to the prototype (bounded ordinal subcategory assembly, coherent topoi/derived comparisons, or the groupoid-object and isomorphism-class stack interfaces). Build it from this node’s pinned categorical APIs and proof steps; there is no geometry assumed as an opaque predicate.

DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites — TauCeti.Diamonds.VectorBundlesAcrossProEtaleAndVSites
For a perfectoid space X, pullback gives equivalences between finite locally free O_X-modules on its analytic site, its étale site, its small pro-étale site (completed structural sheaf), the corresponding big pro-étale site and Perf/X with the v-topology. On an affinoid perfectoid Spa(R,R⁺), these are finite projective R-modules. For a rigid variety X/K, the comparison among the pro-étale versions and the v-site Perf_K/X with completed O also holds, by descent on perfectoid covers. It does not assert that every v-vector bundle on a general rigid X comes from an analytic O_X-vector bundle.
Required interface: Requires the actual perfectoid category, rational-affinoid cover refinements, size-bounded slices and completed structural sheaves. The generic finite-quasicompact precoverage is typed; its geometric stability and concrete cases must use the P2/P4/P6 supplier APIs.

DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces — TauCeti.Diamonds.SmallQuotientsAndUnderlyingSpaces
For a small v-sheaf F with an action of a locally profinite group G, the v-sheaf quotient Q=F/underline(G) is small and |Q| is homeomorphic to |F|/G with the quotient topology. A quotient diamond is obtained when the relation is pro-étale and representable by a perfectoid presentation. No formula for set-valued π₀ is asserted without additional hypotheses.
Required interface: Requires the geometric atlas-independence and topological quotient functor, the stack-valued diagonal, and geometric perfectoid test objects. The prototype has the literal sheaf quotient and chosen-presentation carrier, which alone do not justify this statement.

DiamondsAndVStacks:D5/profinite-products-of-locally-spatial-diamonds — TauCeti.Diamonds.ProfiniteProductsOfLocallySpatialDiamonds
For a profinite set P and a locally spatial diamond S, underline(P)×S is locally spatial and |underline(P)×S|≅P×|S|. The projection to S is qc, separated and universally closed; hence it sends closed subsets to closed subsets after any locally spatial base change. Compactness of P is essential for closedness of the projection.
Required interface: Requires the geometric underlying-space functor and spatial/open-subdiamond comparison from D4/D5, or the TB.0 complete-Tate maximal-Hausdorff supplier. Arbitrary topology functor parameters do not imply these geometric consequences.

DiamondsAndVStacks:D6/integral-galois-quotient — TauCeti.Diamonds.IntegralGaloisQuotient
Let K be a complete nonarchimedean field in which p is topologically nilpotent, C a completed algebraic closure and G_K=Gal(K^sep/K). Then Spd O_C→Spd O_K is a proper v-cover and (Spd O_C)/underline(G_K)≅Spd O_K. This is a sheaf quotient, not a G_K-torsor assertion on the integral special fibre.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

DiamondsAndVStacks:D6/pre-adic-topological-comparison — TauCeti.Diamonds.PreAdicTopologicalComparison
For a pre-adic space X over Spa ℤ_p, the point map |X^diamond|→|X| is a continuous surjection. If X is analytic it is a homeomorphism. For general nonanalytic X it need not be a homeomorphism: Berkeley Example 18.2.1 gives extra opens detected by topological nilpotence on the diamondification.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.

DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness — TauCeti.Diamonds.SeminormalRigidFullFaithfulness
Fix a complete nonarchimedean field K over ℚ_p. If X is a seminormal rigid K-variety and Y any rigid K-variety, then Hom_K(X,Y)→Hom_{Spd K}(X^diamond,Y^diamond) is bijective. Diamondification factors through seminormalization, so its restriction to seminormal rigid K-varieties is fully faithful. All maps are over the fixed base Spd K. No full faithfulness on all analytic adic spaces is asserted.
Required interface: Requires the P1/P2 tilting slice equivalence, actual adic/Huber-pair and formal-scheme mapping interfaces, and the requested R2 pre-adic or R0 seminormal rigid extensions. The generic marked-map presheaf is typed; its geometric comparisons cannot be asserted for arbitrary fibered functors.
-/
