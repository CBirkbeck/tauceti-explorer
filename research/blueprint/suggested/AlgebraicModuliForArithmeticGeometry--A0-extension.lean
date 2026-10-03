import Mathlib.CategoryTheory.Sites.LocallyBijective
import Mathlib.CategoryTheory.Bicategory.NaturalTransformation.Pseudo
import Mathlib.Algebra.Torsor.Defs
import Mathlib.CategoryTheory.Sites.CartesianMonoidal
import Mathlib.CategoryTheory.Monoidal.Types.Basic
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.CategoryTheory.ComposableArrows.Basic
import Mathlib.CategoryTheory.Sums.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.Algebra.Category.Grp.EquivalenceGroupAddGroup
import Mathlib.CategoryTheory.CodiscreteCategory
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Data.Fintype.Perm
/-
This file is not the roadmap and is not exhaustive. The roadmap reader is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Nothing here claims an implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Full file not compiled.
The Mathlib-only intrinsic-band extraction elaborates; its validation boundary
is recorded in the reader and handoff.
The final omission ledger names every interface requiring an unavailable
supplier. No desired theorem is encoded as an unspecified Prop-valued field.
-/

import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Bicategory.Functor.LocallyDiscrete
import Mathlib.Data.ZMod.Basic
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Data.Fintype.Pi
import Mathlib.Algebra.Group.TypeTags.Finite
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Bicategory.Modification.Pseudo
import Mathlib.CategoryTheory.Groupoid.Discrete
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Ext.EnoughInjectives
import TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence
import Mathlib.Algebra.Category.ModuleCat.Descent
import Mathlib.Algebra.Category.ModuleCat.Pseudofunctor
import Mathlib.CategoryTheory.Sites.Descent.DescentDataPrime
import Mathlib.Algebra.Category.Ring.Constructions
import Mathlib.Algebra.Category.ModuleCat.Kernels
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.RingTheory.Finiteness.Descent
import Mathlib.Algebra.Module.FinitePresentation

import Mathlib.CategoryTheory.Center.Basic
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.TypeTags.Hom
import Mathlib.Data.ZMod.Basic

open CategoryTheory Opposite Bicategory

universe u v u' v' w h

namespace TauCeti.AlgebraicGeometry

variable {C : Type u} [Category.{v} C]

/-- Packet: AlgebraicModuliForArithmeticGeometry:key/gerbes.
Mathlib's IsStack alone does not impose groupoid fibres. -/
class IsGerbe (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) : Prop extends F.IsStack J where
  isIso_hom : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f
  locallyNonempty : ∀ U : C, ∃ R : Sieve U, R ∈ J U ∧
    ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty (F.obj (.mk (op V)))
  locallyIsomorphic : ∀ (U : C) (x y : F.obj (.mk (op U))),
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ≅
        (F.map f.op.toLoc).toFunctor.obj y)

variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {J : GrothendieckTopology C}

-- IsGerbe.toIsStack, locallyNonempty and locallyIsomorphic are projections.
theorem IsGerbe.equivalence_iff (η : Pseudofunctor.StrongTrans F G)
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence) :
    IsGerbe F J ↔ IsGerbe G J := by
  sorry

-- GerbeTests.twoComponents: the one-point-site connectedness obstruction.
example : ¬ (∀ x y : Discrete Bool, Nonempty (x ≅ y)) := by
  sorry

/-- Packet: R09.4/abelian-banding. The two compatibility equations are
actual equations on the existing restriction and automorphism maps. -/
structure AbelianBanding (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) (A : Sheaf J AddCommGrpCat.{w})
    [IsGerbe F J] where
  autEquiv : ∀ (U : C) (x : F.obj (.mk (op U))),
    Multiplicative (A.obj.obj (op U)) ≃* Aut x
  pullback : ∀ {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (F.map f.op.toLoc).toFunctor.mapAut x (autEquiv U x a) =
      autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd ((A.obj.map f.op) (Multiplicative.toAdd a)))
  conjugation : ∀ (U : C) {x y : F.obj (.mk (op U))} (e : x ≅ y)
      (a : Multiplicative (A.obj.obj (op U))),
    Aut.autMulEquivOfIso e (autEquiv U x a) = autEquiv U y a

variable {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J]

@[ext]
theorem AbelianBanding.ext (b b' : AbelianBanding F J A)
    (h : ∀ U x a, b.autEquiv U x a = b'.autEquiv U x a) : b = b' := by
  sorry

theorem banded_aut_commute (b : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a a' : Aut x) : a * a' = a' * a := by
  sorry

-- BandingTests.zero.
example (b : AbelianBanding F J A) (U : C)
    [Subsingleton (A.obj.obj (op U))] (x : F.obj (.mk (op U))) :
    ∀ a : Aut x, a = 1 := by
  sorry

-- BandingTests.conjugation: a chosen object isomorphism preserves the band.
example (b : AbelianBanding F J A) (U : C)
    {x y : F.obj (.mk (op U))} (e : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso e (b.autEquiv U x a) = b.autEquiv U y a := by
  sorry

-- BandingTests.nonabelian: S3 cannot satisfy this abelian-banding definition.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    ¬ Nonempty (AbelianBanding F J A) := by
  sorry

theorem banding_iso_independent (U : C) {x y : F.obj (.mk (op U))}
    (hcomm : ∀ a a' : Aut x, a * a' = a' * a) (e e' : x ≅ y) :
    Aut.autMulEquivOfIso e = Aut.autMulEquivOfIso e' := by
  sorry

/-- Packet: R09.4/neutralization. Terminality is a hypothesis, and an
object is retained as data rather than encoded by a neutrality axiom. -/
structure Neutralization (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) where
  obj : F.obj (.mk (op S))

def IsNeutral (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}) (S : C) : Prop :=
  Nonempty (Neutralization F S)

theorem Neutralization.isNeutral (S : C) :
    IsNeutral F S ↔ Nonempty (F.obj (.mk (op S))) := by
  sorry

def Neutralization.pullback {S V : C} (f : V ⟶ S)
    (x : Neutralization F S) : Neutralization F V :=
  ⟨(F.map f.op.toLoc).toFunctor.obj x.obj⟩

-- NeutralizationTests.automorphisms: choosing an object retains inertia.
example (b : AbelianBanding F J A) (S : C) (x : Neutralization F S) :
    Nonempty (Multiplicative (A.obj.obj (op S)) ≃* Aut x.obj) := by
  sorry

variable [IsGerbe G J]

/-- Packet: R09.4/band-preserving-morphism. Use the pinned StrongTrans. -/
class BandPreserving (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) : Prop where
  map_band : ∀ (U : C) (x : F.obj (.mk (op U)))
      (a : Multiplicative (A.obj.obj (op U))),
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a

theorem BandPreserving.id (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

theorem BandPreserving.comp
    {H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}} [IsGerbe H J]
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (bH : AbelianBanding H J A)
    (η : Pseudofunctor.StrongTrans F G) (θ : Pseudofunctor.StrongTrans G H)
    [BandPreserving bF bG η] [BandPreserving bG bH θ] :
    BandPreserving bF bH (Pseudofunctor.StrongTrans.vcomp η θ) := by
  sorry

-- BandMorphismTests.identity.
example (b : AbelianBanding F J A) :
    BandPreserving b b (Pseudofunctor.StrongTrans.id F) := by
  sorry

theorem band_morphism_full_faithful
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full ∧
      (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

theorem band_morphism_essential_surjective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by
  sorry

theorem band_morphism_equivalence
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by
  sorry

end TauCeti.AlgebraicGeometry

namespace TauCeti.AlgebraicGeometry.GerbeCohomology

open CategoryTheory.Abelian

variable {C : Type u} [Category.{v} C] {J : GrothendieckTopology C}
    [HasSheafify J AddCommGrpCat.{v}]
    [HasExt.{h} (Sheaf J AddCommGrpCat.{v})]
    {E : ShortComplex (Sheaf J AddCommGrpCat.{v})}

-- Packet: R09.4/injective-boundary-bijection. δ itself is already in Tau Ceti.
theorem injective_boundary_bijective (hE : E.ShortExact)
    [Injective E.X₂] :
    Function.Bijective (TauCeti.CategoryTheory.Sheaf.H.δ hE 1 2 rfl) := by
  sorry

-- The two vanishings needed for this statement are actual baseline facts.
example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 1) : a = 0 := by
  sorry

example (I : Sheaf J AddCommGrpCat.{v}) [Injective I]
    (a : CategoryTheory.Sheaf.H I 2) : a = 0 := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeCohomology

namespace TauCeti.AlgebraicGeometry

universe uI vI

variable {I : Type uI} [Category.{vI} I]

/-- Packet R09.4/compatible-limit-family, evaluated at one test object T.
The pseudo-diagram here is its diagram of fibre categories. In applications
I is a cofiltered poset and every fibre is a groupoid. This data construction
also makes sense for more general Cat-valued pseudo-diagrams. -/
structure GerbeLimitFamily (Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}) where
  component : ∀ i : I, Φ.obj (.mk i)
  transition : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.obj (component i) ≅ component j
  transition_id : ∀ i : I,
    (transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (component i)
  transition_comp : ∀ {i j k : I} (f : i ⟶ j) (g : j ⟶ k),
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (component i) ≫
      (Φ.map g.toLoc).toFunctor.map (transition f).hom ≫
      (transition g).hom = (transition (f ≫ g)).hom

namespace GerbeLimitFamily

variable {Φ : LocallyDiscrete I ⥤ᵖ Cat.{v', u'}}

/-- Compatible component arrows; they are invertible when the fibres are
groupoids. This is the arrow data, before installing its category instance. -/
structure Hom (x y : GerbeLimitFamily Φ) where
  component : ∀ i : I, x.component i ⟶ y.component i
  naturality : ∀ {i j : I} (f : i ⟶ j),
    (Φ.map f.toLoc).toFunctor.map (component i) ≫ (y.transition f).hom =
      (x.transition f).hom ≫ component j

theorem hom_ext {x y : GerbeLimitFamily Φ} (f g : Hom x y)
    (h : ∀ i, f.component i = g.component i) : f = g := by
  sorry

-- Unit and composition coherence are equations, not uninstantiated flags.
example (x : GerbeLimitFamily Φ) (i : I) :
    (x.transition (𝟙 i)).hom =
      (Φ.mapId (.mk i)).hom.toNatTrans.app (x.component i) := by
  sorry

example (x : GerbeLimitFamily Φ) {i j k : I} (f : i ⟶ j) (g : j ⟶ k) :
    (Φ.mapComp f.toLoc g.toLoc).hom.toNatTrans.app (x.component i) ≫
      (Φ.map g.toLoc).toFunctor.map (x.transition f).hom ≫
      (x.transition g).hom = (x.transition (f ≫ g)).hom := by
  sorry

end GerbeLimitFamily

end TauCeti.AlgebraicGeometry

/-
Signature omissions are generated alongside the packet by build_reader.py.
They specify the unavailable types and exact mathematical statements; they
are not declarations with truth-valued placeholders. See the appended ledger.
-/

namespace TauCeti.AlgebraicGeometry

open _root_.AlgebraicGeometry

-- Packet: R09.3/quasicoherent-pullback. Reuses the existing object predicate.
theorem quasicoherent_pullback {X Y : Scheme.{u}} (f : X ⟶ Y)
    (M : Y.Modules) [M.IsQuasicoherent] :
    ((Scheme.Modules.pullback f).obj M).IsQuasicoherent := by
  sorry

-- Packet: R09.3/affine-pullback-tensor.
noncomputable def affine_pullback_tensor {R B : CommRingCat.{u}}
    (f : R ⟶ B) (M : ModuleCat.{u} R) :
    (Scheme.Modules.pullback (Spec.map f)).obj (tilde M) ≅
      tilde ((ModuleCat.extendScalars f.hom).obj M) := by
  sorry

namespace QCohPseudofunctor

-- The exact full-subcategory restriction of the existing module pullback.
noncomputable def map {X Y : Scheme.{u}} (f : X ⟶ Y) :
    (SheafOfModules.isQuasicoherent Y.ringCatSheaf).FullSubcategory ⥤
      (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory := by
  sorry

noncomputable def map_forget {X Y : Scheme.{u}} (f : X ⟶ Y) :
    map f ⋙ ObjectProperty.ι (SheafOfModules.isQuasicoherent X.ringCatSheaf) ≅
      ObjectProperty.ι (SheafOfModules.isQuasicoherent Y.ringCatSheaf) ⋙
        Scheme.Modules.pullback f := by
  sorry

end QCohPseudofunctor

/-- Packet: R09.3/quasicoherent-pseudofunctor. The fibres are the existing
full categories of quasi-coherent modules, with all module morphisms. -/
noncomputable def QCohPseudofunctor : LocallyDiscrete Scheme.{u}ᵒᵖ ⥤ᵖ Cat := by
  refine LocallyDiscrete.mkPseudofunctor
    (fun X ↦ Cat.of
      (SheafOfModules.isQuasicoherent X.unop.ringCatSheaf).FullSubcategory)
    (fun f ↦ (QCohPseudofunctor.map f.unop).toCatHom)
    (fun X ↦ ?_) (fun f g ↦ ?_) ?_ ?_ ?_
  all_goals sorry

theorem QCohPseudofunctor.fibre (X : Scheme.{u}) :
    QCohPseudofunctor.obj (.mk (op X)) =
      Cat.of (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory := by
  sorry

-- All modules are admitted; this example imposes no finite-generation bound.
example (R : CommRingCat.{u}) (M : ModuleCat.{u} R) :
    (tilde M).IsQuasicoherent := by
  sorry

-- QCohPseudoTests.nonInvertibleArrow: the fibres retain noninvertible maps.
example : ¬ IsIso (ModuleCat.ofHom (2 • LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := by
  sorry

end TauCeti.AlgebraicGeometry

namespace TauCeti.AlgebraicGeometry

open TensorProduct

-- Packet: R09.3/finite-presentation-module-descent.
theorem finite_presentation_of_faithfully_flat
    {R S M : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.FaithfullyFlat R S]
    [Module.FinitePresentation S (S ⊗[R] M)] :
    Module.FinitePresentation R M := by
  sorry

end TauCeti.AlgebraicGeometry

/- BEGIN GENERATED SIGNATURE OMISSIONS

Omitted GerbeTests.classifying
The imported classifying stack BA of any sheaf of groups is a gerbe.

Omitted GerbeTests.rootNotNeutral
For algebraically closed k and n>1 invertible in k, the nth-root gerbe of O(1) on P1 is a gerbe with no global object.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/relative-gerbe
For a morphism F:X→Y of stacks in groupoids, IsRelativeGerbe(F) means objects of Y lift locally up to isomorphism and, for x,x′ over U, every isomorphism F(x)→F(x′) locally lifts to x→x′. Equivalently, after replacing X by the equivalent iso-comma stack over Y, its projection is a gerbe on the site of Y. Mere local essential surjectivity is insufficient.

Omitted IsRelativeGerbe.localLift
Every target object admits local lifts up to isomorphism.

Omitted IsRelativeGerbe.isom_epi
Every induced map of Isom sheaves is locally surjective.

Omitted IsRelativeGerbe.rectification_iff
The iso-comma projection is a gerbe iff the two local lifting conditions hold.

Omitted RelativeGerbeTests.identity
The identity of any stack is a relative gerbe.

Omitted RelativeGerbeTests.classifying
For the trivial action, [S/G]→S is a relative gerbe for a sheaf of groups G.

Omitted RelativeGerbeTests.subgroup
On an algebraically closed field, BH→BG for a proper subgroup H<G of finite constant groups is locally essentially surjective but not a relative gerbe.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/relative-pullback
In a 2-cartesian square X′→X over Y′→Y, if X→Y is a relative gerbe, so is X′→Y′.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/relative-composition
The composite of two relative gerbe morphisms is a relative gerbe.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/relative-descent
If Y′→Y is locally essentially surjective and X×Y Y′→Y′ is a relative gerbe, then X→Y is a relative gerbe.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/intrinsic-abelian-band
If every automorphism sheaf of a gerbe is abelian, glue these sheaves through their choice-independent local conjugation maps to an abelian sheaf A on C with an A-banding of the gerbe. The intrinsic sheaf is canonical up to unique compatible sheaf isomorphism; an identification with a preselected A remains additional data.

Omitted IntrinsicBand.autIso
The intrinsic band restricted to U is Aut(x) for every x over U.

Omitted IntrinsicBand.pullback
Restricting the intrinsic band to V gives the intrinsic band of the restricted gerbe.

Omitted IntrinsicBand.unique
Compatible automorphism-sheaf identifications determine the intrinsic band up to unique isomorphism.

Omitted IntrinsicBandTests.BA
The intrinsic band of BA for abelian A is A.

Omitted IntrinsicBandTests.trivial
The intrinsic band of a terminal groupoid-valued stack is the zero abelian sheaf.

Omitted IntrinsicBandTests.unfixed
An isomorphism of the intrinsic band with A does not identify two A-bandings differing by a nontrivial automorphism of A as band-preserving objects.

Omitted BandPreserving.modificationGroupoid
Compatible modifications are morphisms of a groupoid, with componentwise inverse.

Omitted BandMorphismTests.inversion
For the constant band Z/3Z, the self-equivalence induced by a↦−a preserves the underlying gerbe but does not preserve the fixed band.

Omitted BandMorphismTests.modifications
For BA over an algebraically closed point and A constant Z/3Z, the identity band-preserving equivalence has three automorphisms as a transformation, not one.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor
For x,y over U in an A-banded gerbe, the existing sheafHom(x,y) is the sheaf Isom(x,y), since every arrow is invertible. It is an A|U-torsor with p·a=b_y(a)∘p. In the abelian setting this also equals p∘b_x(a). It is locally nonempty and the torsor comparison Isom(x,y)×A|U→Isom(x,y)×Isom(x,y), (p,a)↦(p,p·a), is an isomorphism of sheaves.

Omitted Gerbe.isomTorsor
The Hom sheaf of x,y carries the indicated A|U-torsor structure.

Omitted Gerbe.isomTorsor_action
p·a is postcomposition with b_y(a), also precomposition with b_x(a).

Omitted Gerbe.isomTorsor_pullback
Restriction to V identifies this torsor with Isom(x|V,y|V), respecting the action.

Omitted IsomTorsorTests.self
Isom(x,x) is the trivial A|U-torsor through the band, with identity corresponding to zero.

Omitted IsomTorsorTests.emptySections
A nontrivial A-torsor P in BA need not have Isom(A,P)(U) nonempty, although the Isom sheaf is a torsor.

Omitted IsomTorsorTests.composition
Composing p·a with an isomorphism y→z gives the transported isomorphism acted on by the same a.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe
For an abelian sheaf A, specialize the imported groupoid quotient to BA, the stack of A-torsors with equivariant isomorphisms. Identify Aut(P) with A|U through translations, which is independent of a local trivialization since A is commutative. This supplies its canonical band. The trivial torsor provides a global object over a terminal site object S.

Omitted ClassifyingGerbe.band
BA carries the canonical A-banding.

Omitted ClassifyingGerbe.trivial
The trivial A-torsor is a global object of BA.

Omitted ClassifyingGerbe.autIso
Aut(P)≅A|U as sheaves, compatible with pullbacks and conjugation.

Omitted ClassifyingGerbeTests.zero
B0 is equivalent to the terminal groupoid-valued stack.

Omitted ClassifyingGerbeTests.point
For algebraically closed k and A constant Z/3Z, BA(k) has one isomorphism class with automorphism group Z/3Z.

Omitted ClassifyingGerbeTests.inertia
BA for nonzero A is not equivalent to the sheaf of its isomorphism classes.

Omitted NeutralizationTests.BA
The trivial A-torsor neutralizes BA.

Omitted NeutralizationTests.root
The nth-root gerbe of O(1) on P1 has no neutralization for n>1 invertible in the algebraically closed ground field.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence
For x∈F(S), the functor y↦Isom(x|U,y) is a band-preserving equivalence F≃BA; its quasi-inverse twists x by the A-torsor, with descent.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/neutral-self-equivalences
For an A-gerbe with a neutralization x, its groupoid of band-preserving self-equivalences is equivalent to the groupoid of A-torsors on the base. A torsor P acts on BA by Q↦Q⊗A P. An equivariant isomorphism P≅P′ corresponds to an invertible modification. Composition corresponds to contracted product, and the identity to the trivial torsor.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/change-band
For a homomorphism u:A→B and an A-gerbe F, extend each Isom(x,y) by the contracted product with B; glue composition using the abelian band equation, then apply the imported stackification. The resulting u_*F is a B-gerbe with a u-compatible morphism F→u_*F. It is universal for u-compatible morphisms from F to B-gerbes, at the level of morphism groupoids.

Omitted Gerbe.changeBand
Produces the B-gerbe u_*F and its u-compatible map.

Omitted Gerbe.changeBand_lift
Composition with F→u_*F is an equivalence on groupoids of band-compatible morphisms.

Omitted Gerbe.changeBand_comp
v_*(u_*F)≃(v∘u)_*F coherently, and id_*F≃F.

Omitted ChangeBandTests.identity
Extension along id_A recovers F preserving its band.

Omitted ChangeBandTests.BA
Extension sends BA to BB with the induced map on torsors.

Omitted ChangeBandTests.zero
Extension to the zero band gives a gerbe equivalent to the terminal stack.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/lifting-gerbe
For a short exact sequence 0→A→B→D→0 of abelian sheaves and a D-torsor P, Lift(P)(U) is the groupoid of pairs (Q,α), where Q is a B|U-torsor and α:Q×B D≅P|U is an equivariant isomorphism. Arrows are B-torsor isomorphisms commuting with α. This is an A-gerbe: the stack is a 2-fibre product of the imported torsor stacks; local triviality of P gives local objects; the kernel A gives its band. The sheaf epimorphism B→D, not surjectivity on all section groups, supplies local isomorphisms.

Omitted LiftingGerbe.obj
A B-torsor Q and an isomorphism Q×B D≅P give an object.

Omitted LiftingGerbe.autIso
Automorphisms of (Q,α) form the sheaf A, through the kernel inclusion.

Omitted LiftingGerbe.neutral_iff
Lift(P) is neutral iff P is the pushforward of a B-torsor.

Omitted LiftingGerbe.pullback
Restriction of Lift(P) is equivalent to the lifting gerbe of the restricted exact sequence and torsor.

Omitted LiftingGerbeTests.trivial
Lift of the trivial D-torsor is a neutral A-gerbe.

Omitted LiftingGerbeTests.surjectiveSheaf
The Kummer sequence with n invertible is locally exact even when units are not all nth powers in the global section ring.

Omitted LiftingGerbeTests.zeroKernel
If A=0, a lifting gerbe of P is equivalent to the terminal stack because B→D is an isomorphism.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/torsor-representative-of-class
Choose a monomorphism A→I into an injective abelian sheaf and let D be its cokernel. For α∈H2(A), take the inverse dimension-shift class in H1(D), choose a D-torsor representing it, and construct Lift(P). This constructs an A-gerbe for α, with the choice of P irrelevant up to band-preserving equivalence. Enough injectives, cokernel exactness and the derived-H1 torsor comparison are inputs, not assumptions that every section of D lifts globally.

Omitted Gerbe.ofH2
A derived H2 class produces an A-gerbe through an injective embedding and a lifting torsor.

Omitted Gerbe.ofH2_equiv
Isomorphic representative D-torsors give equivalent A-gerbes.

Omitted Gerbe.ofH2_zero
The zero class produces a gerbe equivalent to BA.

Omitted H2RepresentativeTests.zero
Choose P the trivial D-torsor for α=0; its trivial B-lift neutralizes Lift(P).

Omitted H2RepresentativeTests.changeTorsor
An isomorphism P≅P′ induces an equivalence of lifting gerbes, respecting the chosen band.

Omitted H2RepresentativeTests.nonzero
A nonzero Kummer boundary δ(O(1)) on P1 cannot be represented by a neutral root gerbe.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/injective-gerbe-neutral
On a site with terminal object S and the slice-site injective restriction and Čech-acyclicity inputs below, every gerbe banded by an injective abelian sheaf I has an object over S.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/class-of-gerbe
For an A-gerbe F, choose an injective embedding A→I and neutralize the I-gerbe obtained by extension of band. For a neutralizing object z, let Pz be the sheaf of isomorphism classes of pairs (x,φ) with x∈F(U) and φ:u_*x≅z|U; quotient arrows are isomorphisms in F commuting with φ. This is a D=I/A-torsor. Define class(F)=δ([Pz])∈H2(A), with δ the pinned connecting map and the contraction convention fixed above.

Omitted Gerbe.class
The class is an element of the pinned derived H2(A).

Omitted Gerbe.class_equivalence
A band-preserving gerbe equivalence leaves the class unchanged.

Omitted Gerbe.class_changeNeutralization
Changing z changes Pz by an I-torsor pushforward, whose δ-image is zero.

Omitted GerbeClassTests.BA
The canonical neutral object gives class(BA)=0.

Omitted GerbeClassTests.lift
The class of Lift(P) is δ([P]) for the fixed short exact sequence.

Omitted GerbeClassTests.banding
Changing a chosen band by a coefficient automorphism applies that automorphism to the H2 class; band choices are not silently forgotten.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/class-choice-independent
The derived class of an A-gerbe is independent of the injective embedding A→I and the chosen neutralization of u_*F.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/h2-classification
For a fixed abelian sheaf A on the chosen site with terminal object, band-preserving equivalence classes of A-gerbes are naturally in bijection with the pinned derived H2(A). The class and lifting-gerbe constructions are inverse. The zero class is precisely the neutral class. Equivalence fixes the A-banding; the domain is not unbanded gerbes modulo arbitrary band automorphisms.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/root-gerbe
For a scheme X, an invertible sheaf L and n>0 invertible on X, RootGerbe_n(L)(T) consists of line bundles M on T and isomorphisms φ:M⊗n≅L|T, with arrows ρ satisfying φ=ψ∘ρ⊗n. It is the lifting gerbe for 1→μn→Gm→Gm→1 and the Gm-torsor of L, hence a μn-gerbe. No section of L is part of the data. The root stack of a line bundle with a section is a different construction owned by FunctionFieldArithmeticPartII:key/root-stacks.

Omitted RootGerbe.obj
A pair (M,φ:M⊗n≅L) gives an object.

Omitted RootGerbe.band
An automorphism is scalar multiplication by a μn section.

Omitted RootGerbe.pullback
RootGerbe_n(L)×X T≃RootGerbe_n(L|T), respecting its band.

Omitted RootGerbeTests.one
For n=1 the root gerbe is equivalent to X.

Omitted RootGerbeTests.trivialLine
The root gerbe of O_X is equivalent to B_Xμn using its trivial nth root.

Omitted RootGerbeTests.noSection
For n>1 the root gerbe has μn inertia at every geometric point, whereas a divisor root stack has trivial inertia outside the divisor.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/root-gerbe-class
class(RootGerbe_n(L))=δ([L]) in derived H2(Xét,μn), with δ the connecting map of the Kummer sequence and with the same sign convention as the lifting-gerbe construction.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/root-o1-nonneutral
Let k be algebraically closed and n>1 invertible in k. RootGerbe_n(O(1)) on P1_k is locally nonempty, but has no global object and its derived Kummer class is nonzero.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/class-coefficient-map
For u:A→B, class(u_*F)=H2(u)(class(F)), where H2(u) is the pinned same-site coefficient map.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/class-site-pullback
For a geometric morphism of the chosen sheaf topoi induced by base change T→S, with exact inverse-image functor on abelian sheaves and the derived global-cohomology comparison, pullback carries an A-banding to an f* A-banding and class(f*F)=f*(class(F)). The map on H2 is the change-of-site map furnished by that geometric morphism, not Sheaf.H.map on coefficients alone.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/finite-etale-gerbe
A finite étale gerbe over k is an fpqc gerbe admitting a flat presentation R⇒U with both U and R finite étale k-schemes. Equivalently it is a finite gerbe whose base change to a separable splitting extension is BG for a finite étale group scheme G. Finite geometric automorphism groups alone are not the definition: retain the finite algebraic presentation and gerbe condition.

Omitted FiniteEtaleGerbe.presentation
There is a presentation by a finite étale groupoid R⇒U.

Omitted FiniteEtaleGerbe.baseChange
Any field extension preserves finite étale gerbes.

Omitted FiniteEtaleGerbe.autFiniteEtale
Every object over a field extension has finite étale automorphism group scheme.

Omitted FiniteGerbeTests.trivial
Spec(k), with the trivial group, is a finite étale gerbe.

Omitted FiniteGerbeTests.constant
BG for a finite constant group G is a finite étale gerbe, including nonabelian G.

Omitted FiniteGerbeTests.muP
In characteristic p, Bμp is a finite fppf gerbe but is not a finite étale gerbe.

Omitted GerbeLimitFamily.pullback
Restriction along T′→T applies to objects, transitions and arrows with inherited coherence.

Omitted LimitFamilyTests.singleton
For a singleton index, the groupoid of compatible families is equivalent to the sole stack fibre.

Omitted LimitFamilyTests.identityTower
For the constant identity system BA, its compatible-family groupoid is equivalent to BA(T), retaining A(T) automorphisms.

Omitted LimitFamilyTests.classesInsufficient
For the constant identity system B(Z/3Z) over an algebraically closed point, the inverse system of singleton isomorphism-class sets has no record of the three automorphisms of a compatible object.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/limit-stack-descent
The compatible-family construction for a small diagram of fpqc stacks is an fpqc stack in groupoids.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/nonempty-affine-limit-gerbe
For a cofiltered system of affine fpqc gerbes over a field, if its compatible-family stack has an object over some nonempty k-scheme X, then the 2-limit is an affine fpqc gerbe. This assumption is not a k-rational neutralization and is not suppressed.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/profinite-etale-gerbe
A profinite étale gerbe over k is an fpqc gerbe with a specified presentation, up to coherent equivalence, as the compatible-family 2-limit of a small cofiltered system of finite étale gerbes. Its data include the transition functors, coherence and comparison equivalence. It is not defined by a sequence of isomorphism classes and is not asserted algebraic or of finite presentation.

Omitted ProfiniteEtaleGerbe.projection
There is a morphism to each finite stage, with transition 2-isomorphisms.

Omitted ProfiniteEtaleGerbe.objectEquiv
The fibre over T is the groupoid of compatible finite-stage objects and arrows.

Omitted ProfiniteEtaleGerbe.cofinal
A cofinal reindexing of the presentation yields an equivalent compatible-family gerbe; all coherence is transported.

Omitted ProfiniteGerbeTests.finite
A finite étale gerbe is a profinite étale gerbe via a singleton presentation.

Omitted ProfiniteGerbeTests.identity
The constant identity presentation recovers the original finite gerbe and its automorphism groupoid.

Omitted ProfiniteGerbeTests.zHat
The fpqc classifying gerbe B(Z_hat) is profinite étale but is not an algebraic stack of finite presentation.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/locally-full
For affine fpqc gerbes Γ,Δ over a field k, a morphism f:Γ→Δ is locally full if for every extension ℓ/k and every x∈Γ(ℓ), Autℓ(x)→Autℓ(f(x)) is faithfully flat as a morphism of group schemes. This is not surjectivity of ℓ-valued points. For finite étale groups after separable splitting it becomes surjectivity of the finite geometric group homomorphism.

Omitted LocallyFull.autFaithfullyFlat
Every induced automorphism-group map has faithful flatness.

Omitted LocallyFull.classifying_iff
BG→BH is locally full iff G→H is faithfully flat.

Omitted LocallyFull.baseChange
The property is preserved by every field extension.

Omitted LocallyFullTests.identity
The identity of an affine gerbe is locally full.

Omitted LocallyFullTests.square
Over R, the square map Gm→Gm is faithfully flat but its map R×→R× misses every negative element; point surjectivity is not the definition.

Omitted LocallyFullTests.subgroup
For a proper subgroup H of a finite constant G, BH→BG is faithful but not locally full.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-isom-epi
For affine fpqc gerbes over a field, f is locally full iff every IsomΓ(x,y)→IsomΔ(fx,fy) is an epimorphism of fpqc sheaves.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-relative
A morphism of affine fpqc gerbes is locally full iff it is a relative gerbe. A faithful locally full map is an equivalence.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-limit
Let Γ→lim_iΔi be a morphism of affine fpqc gerbes. If each Γ→Δi is locally full, then Γ→lim_iΔi is locally full.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-gerbe
Over a field k, let G=lim_m (Z/m!Z)_k as affine group schemes, with the quotient transition maps. Its fpqc torsor stack BG is an fpqc gerbe and is presented as the 2-limit of B(Z/m!Z)_k. A compatible family of finite torsors yields a G-torsor by affine inverse limit with its action; the torsor comparison and local triviality must be verified in the fpqc topology.

Omitted ProfiniteIntegersGerbe.finiteProjection
Each quotient G→Z/m!Z induces BG→B(Z/m!Z).

Omitted ProfiniteIntegersGerbe.trivial
The trivial G-torsor neutralizes BG over k.

Omitted ProfiniteIntegersGerbe.aut
The automorphism group scheme of the trivial object is G.

Omitted ZHatGerbeTests.finiteLevel
At each finite level the stabilizer is the finite étale group Z/m!Z.

Omitted ZHatGerbeTests.compatibleArrows
An automorphism of the compatible trivial object is a compatible family of finite residues, that is G.

Omitted ZHatGerbeTests.notFinitePresentation
BG is not an algebraic stack of finite presentation because G is not of finite type.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-not-finite-type
The affine k-group G=lim_m (Z/m!Z)_k is not of finite type over k.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-not-algebraic-fp
The fpqc gerbe B(Z_hat)_k is not an algebraic stack of finite presentation. In fact its affine-gerbe stabilizer criterion excludes algebraicity.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/self-equivalence-isom-transport
Let η be a band-preserving self-equivalence of an A-gerbe F. For an isomorphism φ:x→y, the map Isom(x,ηx)→Isom(y,ηy), p↦η(φ)∘p∘φ⁻¹, is an A-torsor isomorphism independent of φ. These maps compose and commute with restrictions.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/self-equivalence-torsor
For a band-preserving self-equivalence η of any A-gerbe F, choose local objects x and glue the A-torsors Isom(x,ηx) using their choice-independent transport maps. The resulting A-torsor Pη is defined globally without a neutralization of F. Invertible modifications η⇒η′ induce equivariant isomorphisms Pη≅Pη′.

Omitted GerbeSelfEquivalence.torsor
Associates a global A-torsor Pη to η.

Omitted GerbeSelfEquivalence.torsor_local
For any local object x, Pη restricts to Isom(x,ηx).

Omitted GerbeSelfEquivalence.torsor_map
A modification induces a torsor isomorphism, with identity and composition laws.

Omitted SelfEquivalenceTorsorTests.identity
For η=id, Pη is the trivial A-torsor, even if F has no global object.

Omitted SelfEquivalenceTorsorTests.neutral
For a chosen neutralization this agrees with evaluating the induced equivalence of BA on its trivial torsor.

Omitted SelfEquivalenceTorsorTests.nonNeutralRoot
The identity of the nonneutral μn-root gerbe of O(1) still gives the trivial μn-torsor; this construction cannot require a global root.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/all-self-equivalences
For any A-gerbe F, the groupoid of band-preserving self-equivalences is equivalent to the groupoid of A-torsors. The functor is η↦Pη; its inverse twists local objects by a torsor and descends them. Modifications correspond to equivariant isomorphisms. The assertion holds without a chosen neutralization.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/quotient-gerbe-transgression
Let a finite constant group Γ act on Y, let A be a commutative band on the chosen site, and let α be an A-gerbe with Γ-equivariant structure ηγ and its unit/composition modifications. On each fixed locus Yγ, ηγ becomes a self-equivalence, hence determines an A-torsor Pγ. The centralizer CΓ(γ) acts coherently on Pγ; descend it to [Yγ/CΓ(γ)]. The sum over conjugacy representatives gives the torsor on I[Y/Γ].

Omitted GerbeTransgression.component
The restriction to [Yγ/CΓ(γ)] is the descended Pγ.

Omitted GerbeTransgression.conjugation
Conjugate γ give canonically equivalent torsors through equivariant coherence.

Omitted GerbeTransgression.pullback
Equivariant base changes preserving the band commute with the construction.

Omitted TransgressionTests.identity
The identity inertia component gets the trivial A-torsor through ηe and its unit modification.

Omitted TransgressionTests.trivialEquivariance
A neutral gerbe with trivial Γ-equivariant structure gives trivial component torsors.

Omitted TransgressionTests.modification
An isomorphism of coherent equivariant gerbes induces an isomorphism of the descended inertia torsors, not merely equality of H1 classes.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/inertia-stack
For a stack X in groupoids on (C,J), IX(U) is the groupoid of pairs (x,a) with x∈X(U) and a∈Aut(x); an arrow φ:(x,a)→(y,b) is an isomorphism φ:x→y such that b∘φ=φ∘a. It is equivalent to the 2-fibre product of the diagonal X→X×X with itself. Its projection to X has fibre Aut(x), with its group law.

Omitted InertiaStack.obj
An object x and an automorphism a determine an inertia object.

Omitted InertiaStack.hom_iff
An isomorphism φ is an inertia arrow exactly when b∘φ=φ∘a.

Omitted InertiaStack.fibre
The fibre of IX→X at x identifies with the Aut(x) sheaf and its group law.

Omitted InertiaTests.space
For a sheaf regarded as a stack with trivial automorphisms, inertia is that sheaf.

Omitted InertiaTests.abelianClassifying
For commutative A, IBA≃BA×A as stacks.

Omitted InertiaTests.S3
The inertia fibre of BS3 at its trivial torsor is S3; the inertia stack is not a stack with one discrete point for each conjugacy class.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/quotient-inertia-components
For a finite constant group Γ acting on Y, I[Y/Γ]≃⊔_[γ] [Yγ/CΓ(γ)], where one representative is chosen from each conjugacy class and Yγ is the fixed-point sheaf (with representability whenever supplied). Changing representatives gives the canonical equivalent description. No tameness or invertibility of |Γ| is required for this groupoid formula.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/canonical-affine-factorization
For f:Γ→Δ between affine fpqc gerbes over k, a canonical factorization consists of an affine fpqc gerbe E, maps g:Γ→E and h:E→Δ, an invertible modification h∘g≅f, proof that g is locally full, and proof that h is faithful on all fibre groupoids. Equivalence of such data includes the compatible modification over Δ.

Omitted AffineGerbeFactorization.sourceMap
The first map g is locally full.

Omitted AffineGerbeFactorization.targetMap
The second map h is faithful.

Omitted AffineGerbeFactorization.factorIso
The composite h∘g is identified with f by an invertible modification.

Omitted CanonicalFactorTests.identity
The identity has E=Γ and both maps identity.

Omitted CanonicalFactorTests.kernel
For a group morphism G→H the neutral factor is B(G/ker f)→BH.

Omitted CanonicalFactorTests.notTarget
The inclusion B1→B(Z/2Z) cannot have E=B(Z/2Z), because its first map is not locally full.

Omitted AlgebraicModuliForArithmeticGeometry:R09.5/affine-kernel-rigidification
For f:Γ→Δ between affine fpqc gerbes, there is a canonical factorization Γ→E→Δ. Choose an affine fpqc cover U→Γ, put R=U×ΓU, and let K be the normal stabilizer-kernel sheaf. The quotient sheaf R/K carries an induced groupoid structure over U; its torsor stack E is an affine fpqc gerbe. Affineness of R/K follows after a faithfully flat field extension by identifying it with the quotient of an affine group scheme by a normal subgroup and then descending affineness. No general fpqc stackification in unrestricted universes is presumed.

Omitted AffineKernelRigidification.factor
Produces the displayed canonical factorization of f.

Omitted AffineKernelRigidification.homSheaf
For source objects x,y the target Isom sheaf is IsomΓ(x,y)/Kx.

Omitted AffineKernelRigidification.neutral
For BG→BH the construction identifies with B(G/ker f)→BH.

Omitted KernelRigidificationTests.zeroKernel
A faithful f has a trivial kernel and E≃Γ.

Omitted KernelRigidificationTests.allKernel
For BG→Spec k, the quotient gerbe is Spec k.

Omitted KernelRigidificationTests.notOrbitSet
The quotient B(Z/4Z)→B(Z/2Z) retains Z/2Z as inertia; its middle gerbe is not an orbit-set sheaf.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/canonical-factorization-unique
Two canonical factorizations of the same f:Γ→Δ have equivalent middle affine gerbes over Δ, compatibly with the maps from Γ.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/finite-etale-image
For a profinite étale fpqc gerbe Γ over k and a morphism Γ→Δ to a finite étale gerbe, its canonical affine factor E is finite étale, and Γ→E is locally full. The faithful map E→Δ is representable.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-finite-presentation
Every profinite étale fpqc gerbe Γ has a cofinal finite étale presentation Γ≃lim E_i with each projection Γ→E_i locally full. The presentation and comparison include the transition isomorphisms and their coherence.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/relative-profinite-gerbe-finite-stages
Let f:Γ→Δ be a locally full map of profinite étale fpqc gerbes over k. Choose synchronized cofinal finite presentations Γ≃lim E_i and Δ≃lim D_i with locally full projections and maps E_i→D_i. Each E_i→D_i is a proper étale relative gerbe. For any scheme C→Δ the pullback Γ×Δ C→C is the compatible two-limit of E_i×D_i C→C, each a proper étale relative gerbe.

Omitted affine_pullback_tensor.naturality
For every module map the square between the two displayed pullback comparisons commutes.

Omitted affine_pullback_tensor.comp
For R→A→B the two successive comparisons agree with the composite comparison through the baseline tensor and pullback associators.

Omitted AffinePullbackTests.identity
For R→R the comparison agrees with the baseline pullback and scalar-extension unit isomorphisms.

Omitted AffinePullbackTests.localization
For R→R[f⁻¹], the comparison recovers restriction of tilde M to the basic open D(f).

Omitted AffinePullbackTests.nonflat
The comparison also holds for Z→Z/2Z without a flatness hypothesis; it identifies pullback with right-exact tensor extension, not an exact functor.

Omitted QCohPseudofunctor.affine
The affine comparison through tildeEquiv identifies arrow maps with extendScalars.

Omitted QCohPseudoTests.identity
The unit map is the baseline pullbackId restricted to the full subcategory.

Omitted QCohPseudoTests.infiniteModule
The direct sum of countably many copies of R on Spec R is admitted even though it is not finitely generated when R is a field.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/module-descent-coaction
For every commutative ring map R→A, tensor-overlap module descent is equivalent to the existing scalar-extension comonad coalgebras, preserving the underlying A-module and every morphism. The native all-test-object DescentData category is identified with this presentation through Mathlib’s existing chosen-pullback descent equivalence and the module-specific coordinate comparison. The coaction is d(n)=θ(n⊗1); the reverse transition and its inverse are the inherited coaction-transition maps. No flatness is required for these presentation comparisons.

Omitted ModuleDescentCoalgebra.equivalence
An equivalence preserving the underlying A-module and its maps.

Omitted ModuleDescentCoalgebra.coaction
The coaction sends n to θ(n⊗1).

Omitted ModuleDescentCoalgebra.canonical
The canonical datum on A⊗R M becomes the comparison coalgebra of M.

Omitted ModuleCoalgebraTests.identity
For R=A, descent and coalgebras are equivalent to ModuleCat R.

Omitted ModuleCoalgebraTests.product
For the diagonal R→R×R the transition identifies the two component modules and recovers one R-module.

Omitted ModuleCoalgebraTests.cocycle
Arbitrary pairwise invertible maps that fail the triple-overlap equation do not define a coalgebra.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/affine-module-descent-equivalence
For a faithfully flat commutative ring map R→A, the native canonical functor ModuleCat R→affine ModuleCat DescentData for the singleton f.op is an equivalence. Under the tensor-overlap comparison its inverse is M={n∈N | 1⊗n=θ(n⊗1)}. The comparison A⊗R M→N is a↦(m↦a m) and is an isomorphism of the actual descent data, not merely of modules.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/affine-fpqc-quasicoherent-descent
For a finite standard fpqc covering {Ui→S} of an affine scheme S, the canonical functor from QCoh(S) to baseline descent data for the cover is an equivalence.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent-faithful
For an arbitrary fpqc cover {Ui→S} and maps a,b:M→N between quasi-coherent modules on S, equality of all pullbacks implies a=b.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent-full
For an arbitrary fpqc cover {Ui→S}, every compatible family of maps f_i:M|Ui→N|Ui is the pullback of a unique map M→N.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent-effective
Every quasi-coherent module descent datum on an arbitrary fpqc covering {Ui→S} is effective, with a specified isomorphism from the canonical datum of the glued sheaf to the original datum.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent
For every scheme S and every fpqc covering {Ui→S}, the canonical functor QCoh(S)→QCohPseudofunctor.DescentData(Ui→S) is an equivalence. There is no Noetherian, coherence, finite-generation, finite-presentation, separatedness or smoothness condition.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/finite-quotient-presentation
For a Deligne–Mumford stack X, a finite quotient presentation is an algebraic space Y, an action of a finite constant group Γ which is generically fixed-point free, and an equivalence X≃[Y/Γ]. A finite abelian quotient presentation additionally requires Γ abelian. These are properties witnessed by presentations, not a claim that every Deligne–Mumford stack is a finite quotient.

Omitted FiniteQuotientPresentation.equivalence
The specified stack equivalence to the action quotient.

Omitted FiniteQuotientPresentation.genericFree
The Γ action is free on the specified dense open.

Omitted FiniteAbelianQuotientPresentation.toFinite
An abelian presentation forgets to a finite quotient presentation.

Omitted FiniteQuotientTests.trivial
An algebraic space has a presentation by the trivial group.

Omitted FiniteQuotientTests.sign
The sign action of Z/2Z on A1 in characteristic different from2 is generically free, though inertia at0 is nontrivial.

Omitted FiniteQuotientTests.trivialAction
The displayed trivial nontrivial-group action on a nonempty Y is not generically free and does not give a presentation of this prescribed kind.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/commuting-quotient-exchange
If fppf group schemes G1,G2 over S act on the S-scheme N through commuting actions, then [[N/G1]/G2]≃[N/(G1×G2)]≃[[N/G2]/G1] as S-stacks. These are equivalences of groupoids over every test scheme T, natural in T.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/torsor-twist-space
For a commutative étale S-group scheme Γ, an S-scheme N with Γ-action and a Γ-torsor T, the anti-diagonal action on N×S T is free and its quotient N_T=(N×S T)/Γ is an algebraic space. The action through T descends to a Γ-action on N_T. This construction depends on the torsor and its arrows, not on a bare symbol representing its H1 class.

Omitted TorsorTwist.quotient
The quotient is an algebraic space with its descended Γ-action.

Omitted TorsorTwist.trivial
A chosen trivialization of T identifies N_T with N equivariantly.

Omitted TorsorTwist.mapTorsor
A Γ-torsor isomorphism T≅T′ induces a Γ-equivariant space isomorphism N_T≅N_T′.

Omitted TwistTests.trivial
For Γ=1 the twist is N.

Omitted TwistTests.freeTorsor
For N=Γ with its regular action, the twist is equivariantly the torsor T.

Omitted TwistTests.arrows
An automorphism of T can act nontrivially on N_T; quotienting the construction to a set of H1 classes loses these arrows.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/torsor-twist-quotient-equivalence
Under the torsor-twist hypotheses, [N/Γ]≃[N_T/Γ] over S, retaining the groupoids of objects and their arrows.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/twisted-group-action-quotient
Let A,B be smooth group algebraic spaces over S, with A acting on B by automorphisms and compatible A and B actions on an algebraic space X. For an A-torsor ρ, let Xρ=X×Aρ and Bρ=B×Aρ. Then [(X×Sρ)/(B⋊A)]≃[Xρ/Bρ] naturally in the torsor and equivariant maps.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/prime-to-p-twisted-inertia
For a stack X over a perfect field k of characteristic p, let μ̂=lim_(n,p)=1 μn with transition μmn→μn given by the mth power. Define Iμ̂X as the two-colimit, with stackification on the chosen site, of the mapping stacks Hom(Bμn,X), indexed by positive n prime to p. The transition functor is precomposition with Bμmn→Bμn. These are all maps of stacks, not only representable maps, and the evaluation at the trivial torsor gives the projection to X. No algebraic finite-presentation assertion for this colimit is included.

Omitted TwistedInertia.project
The projection forgets the homomorphism and retains its object in X.

Omitted TwistedInertia.finiteStage
Every map Bμn→X with n prime to p supplies an object.

Omitted TwistedInertia.fibre
The fibre at x is the filtered system of Hom(μn,Aut(x)), with conjugation on arrows.

Omitted TwistedInertiaTests.space
For an algebraic space regarded as a stack, Iμ̂X≃X.

Omitted TwistedInertiaTests.zeroHom
The trivial homomorphism is retained; the definition is not the representable cyclotomic inertia substack.

Omitted TwistedInertiaTests.pGroup
For the constant group Z/pZ in characteristic p, all homomorphisms from μ̂ are trivial, but Iμ̂B(Z/pZ) still retains the classifying-stack automorphisms Z/pZ.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/twisted-inertia-finite-field
For X/Fq with diagonal of finite presentation, Iμ̂X(Fq) is equivalent to the groupoid of pairs (x,α), with x∈X(Fq), a continuous homomorphism α:μ̂(Fqbar)→Aut(x_Fqbar) for the discrete topology, and Frobenius equivariance φα=αφ. An arrow is an Fq-isomorphism of objects intertwining α. The domain Frobenius acts by qth power.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/twisted-inertia-generator
For a chosen profinite generator ξ of μ̂(Fqbar), the preceding groupoid is equivalent to pairs (x,a) in ordinary inertia with x defined over Fq and φ(a)=a^q. The finite-presentation hypothesis makes a finite-order geometric automorphism; the displayed equation forces its order prime to p, so it uniquely determines the continuous homomorphism α with α(ξ)=a.

Omitted AlgebraicModuliForArithmeticGeometry:R09.4/twisted-inertia-automorphisms
For a rational twisted-inertia object (x,a), its automorphism group is {β∈Aut_X(Fq)(x) | aβ=βa}. The rationality condition on β cannot be dropped.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/finite-locally-free-descent
For a quasi-coherent module M and an fpqc cover, if the pulled modules are finite locally free, then M is finite locally free. If their rank is the same fixed finite r, the descended module has rank r. In particular invertibility descends. This is not a descent theorem for arbitrary infinite-rank locally free modules.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/space-quasicoherent-modules
For an algebraic space X, QCoh(X) is the full category of sheaves of modules on its small étale ringed site satisfying the pinned sheaf-of-modules quasi-coherence predicate. The category is equivalent to compatible quasi-coherent modules on its scheme étale charts, with specified pullback isomorphisms and composition equations. On a scheme this must agree with its ordinary Zariski quasi-coherent category.

Omitted SpaceQCoh.chart
Restriction to a scheme étale chart is quasi-coherent.

Omitted SpaceQCoh.transition
A chart morphism gives a specified pullback isomorphism with unit/composition coherence.

Omitted SpaceQCoh.schemeEquivalence
For a scheme X the category agrees with the pinned ordinary quasi-coherent category.

Omitted SpaceQCohTests.affine
For Spec R, composition with the existing tildeEquiv identifies this category with ModuleCat R.

Omitted SpaceQCohTests.identity
The identity atlas of a scheme recovers its existing quasi-coherent modules.

Omitted SpaceQCohTests.infiniteModule
Infinite free modules are allowed on every chart; this is not a coherent-only category.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/space-fpqc-quasicoherent-descent
For any fpqc covering {Xi→X} of algebraic spaces, the canonical functor QCoh(X)→descent data is an equivalence, retaining all module maps and allowing arbitrary quasi-coherent modules.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf
For f:X→B, define PicX/B as the fppf sheafification on Sch/B of T↦Pic(XT), where Pic denotes invertible modules up to isomorphism. Equivalently sheafify the quotient presheaf Pic(XT)/fT*Pic(T), since every line bundle on T is locally trivial. Tensor product supplies the abelian group law. This does not identify its T-points with actual line bundles modulo pullback without a separate descent theorem.

Omitted RelativePicard.ofLineBundle
An invertible sheaf on XT gives a point of PicX/B(T).

Omitted RelativePicard.pullback
Base morphisms pull classes back, respecting identity and composition.

Omitted RelativePicard.baseLineBundle
A line bundle pulled back from T maps to zero.

Omitted RelativePicard.quotientSheaf
Sheafifying Pic(XT)/Pic(T) gives the same fppf sheaf.

Omitted PicardSheafTests.identity
For X=B and f=id, the relative Picard sheaf is zero, even when Pic(B) is nonzero.

Omitted PicardSheafTests.baseChange
Restricting to Sch/T gives PicXT/T.

Omitted PicardSheafTests.needSheafification
Without a section or a separate obstruction-vanishing hypothesis, a point of the sheaf need not have a representative invertible sheaf on XT.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change
For a scheme T→B, the restriction of PicX/B to Sch/T is naturally PicXT/T. Equivalently it is the fibre product of the relative Picard sheaf over B with T.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel
If OT→fT*OXT is an isomorphism for every scheme T→B, then 0→Pic(T)→Pic(XT)→PicX/B(T) is exact. No surjectivity at the last arrow is asserted.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard
For a section σ:B→X, a rigidified Picard object over T is an invertible sheaf L on XT and an isomorphism α:OT≅σT*L. An arrow is an isomorphism of line bundles preserving α. Under universal OT≅fT*OXT every such object has only the identity automorphism, and its isomorphism class lies in ker(σT*:Pic(XT)→Pic(T)). The trivialization is retained in the object, not discarded before descent.

Omitted RigidifiedPicard.lineBundle
The underlying invertible sheaf on XT.

Omitted RigidifiedPicard.trivialization
The specified isomorphism OT≅σT*L.

Omitted RigidifiedPicard.pullback
Pullback of rigidified objects retains its unit and composition constraints.

Omitted RigidifiedPicardTests.identity
For X=B the unique class is the trivial line bundle with its rigidification.

Omitted RigidifiedPicardTests.automorphisms
An arbitrary scalar automorphism of L is not a rigidified arrow unless it restricts to1 along σ.

Omitted RigidifiedPicardTests.P1
For P1 with its section, the classes of O(d) retain all integer degrees; rigidification does not force d=0 on X.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/rigidified-picard-setoid
Under universal OT≅fT*OXT, an automorphism of (L,α) is identity. Any two choices of α for the same L give isomorphic rigidified objects, because their ratio is a base unit.

Omitted AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split
If σ:B→X is a section and OT→fT*OXT is an isomorphism for all T→B, then 0→Pic(T)→Pic(XT)→PicX/B(T)→0 is split exact, with retraction σT*. Equivalently PicX/B(T)≅ker σT*, naturally in T.

END GENERATED SIGNATURE OMISSIONS -/

namespace TauCeti.AlgebraicGeometry.ModuleDescentBridge

open CategoryTheory
universe uB

variable {R S : Type uB} [CommRing R] [CommRing S] (f : R →+* S)

-- Partial native prototype for tensor-comonad-coordinates.
-- Tensor instance transport and the full overlap-action signatures remain omitted.
theorem tensor_comonad_coordinates (N : ModuleCat.{uB} S) :
    (((ModuleCat.extendRestrictScalarsAdj f).toComonad : ModuleCat S ⥤ ModuleCat S) =
      ModuleCat.restrictScalars f ⋙ ModuleCat.extendScalars f) ∧
    ((ModuleCat.extendRestrictScalarsAdj f).toComonad.ε.app N =
      (ModuleCat.extendRestrictScalarsAdj f).counit.app N) ∧
    ((ModuleCat.extendRestrictScalarsAdj f).toComonad.δ.app N =
      (ModuleCat.extendScalars f).map
        ((ModuleCat.extendRestrictScalarsAdj f).unit.app
          ((ModuleCat.restrictScalars f).obj N))) := by
  sorry

-- Partial native prototype for overlap-comparison-canonical.
-- This identifies the actual comparison fields, not a constructed overlap equivalence.
theorem overlap_comparison_canonical {M M' : ModuleCat.{uB} R} (h : M ⟶ M') :
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).A =
      (ModuleCat.extendScalars f).obj M) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M).a =
      (ModuleCat.extendScalars f).map
        ((ModuleCat.extendRestrictScalarsAdj f).unit.app M)) ∧
    (((Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).map h).f =
      (ModuleCat.extendScalars f).map h) := by
  sorry

-- Four native smoke examples; none substitutes for the omitted overlap tests.
example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.ε.app K.A = 𝟙 K.A := by
  sorry

example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.δ.app K.A =
      K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map K.a := by
  sorry

example {K K' : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra}
    (h : K ⟶ K') :
    K.a ≫ (ModuleCat.extendRestrictScalarsAdj f).toComonad.map h.f =
      h.f ≫ K'.a := by
  sorry

example (K : (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra) :
    (𝟙 K : K ⟶ K).f = 𝟙 K.A := by
  sorry

end TauCeti.AlgebraicGeometry.ModuleDescentBridge

/- BEGIN CONTINUATION SIGNATURE OMISSIONS

The owned tensor-overlap/action/extension carrier and its scalar-extension coherence have not been implemented. The generic chosen/all-test DescentData equivalence is a baseline import; the new module-specific adapters remain unelaborated. Native coalgebras exist and are not being replaced. No placeholder type or unspecified proposition is introduced.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/module-overlap-datum
ModuleOverlapDatum(f) has an S-module N and an S⊗R S-linear isomorphism θ:N⊗R S→S⊗R N satisfying θ12∘θ01=θ02 on the triple tensor product. On N⊗R S the two scalar factors act on N and S respectively; on S⊗R N they act on S and N respectively. θij is extension along the insertion map p_ij:S⊗R S→S⊗R S⊗R S, using the tensor associators. Morphisms are all S-linear h:N→N′ satisfying (idS⊗h)∘θ=θ′∘(h⊗idS); componentwise identity and composition make a category. This is a tensor presentation to be compared with the existing DescentData carrier, not a replacement for generic descent or a core of the module category.

Omitted ModuleOverlapDatum.module
The underlying object is N:ModuleCat S.

Omitted ModuleOverlapDatum.transition
The S⊗R S-linear overlap isomorphism θ, with the first/second-factor actions fixed above.

Omitted ModuleOverlapDatum.cocycle
The extended maps obey θ12∘θ01=θ02, with the scalar-extension associators inserted.

Omitted ModuleOverlapDatum.hom_ext
Two datum morphisms are equal iff their underlying S-linear maps are equal.

Omitted ModuleOverlapTests.identity
For f=idR, diagonal normalization forces θ to be identity under the tensor unitors.

Omitted ModuleOverlapTests.noninvertibleMap
Multiplication by2 on the canonical datum for Z→Z is a datum morphism but not an isomorphism.

Omitted ModuleOverlapTests.infiniteFree
The canonical datum on S⊗R(⊕n∈ℕ R) is admitted; no finite presentation is imposed.

Omitted ModuleOverlapTests.scalarTwo
For Q→Q and N=Q, multiplication by2 is an invertible overlap map but fails the cocycle since 4≠2.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/tensor-comonad-coordinates
Let L=extendScalars f, U=restrictScalars f and G=(extendRestrictScalarsAdj f).toComonad. Its endofunctor is U⋙L, so G(N)=S⊗R N with S acting on the first factor. Its counit is εN(s⊗n)=s·n; its comultiplication is ΔN(s⊗n)=s⊗1⊗n, with G²(N)=S⊗R(S⊗R N). Thus an existing Comonad.Coalgebra G is exactly an S-linear d:N→S⊗R N with εN∘d=id and (idS⊗d)∘d=ΔN∘d; its existing morphisms are S-linear h with (idS⊗h)∘d=d′∘h. No new coalgebra or comonad carrier is constructed.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-diagonal
For a ModuleOverlapDatum(f), let p:N→N be the pullback of θ along multiplication μ:S⊗R S→S, using the two tensor unit identifications. Equivalently p(n)=εN(θ(n⊗1)). Then p=idN. This holds for any f, even if f is not faithfully flat.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-to-coalgebra
For an arbitrary f and overlap datum (N,θ), dθ(n)=θ(n⊗1) is S-linear for the first-factor action and defines an object of the existing Comonad.Coalgebra G. The counit law is overlap diagonal normalization; the coassociativity law is the triple cocycle evaluated at n⊗1⊗1.

Omitted ModuleOverlapDatum.toCoalgebra
Constructs the native coalgebra on the same S-module N.

Omitted ModuleOverlapDatum.toCoalgebra_coaction
The native coaction at n is θ(n⊗1).

Omitted ModuleOverlapDatum.toCoalgebra_module
Forgetting the native coalgebra returns the datum's underlying ModuleCat S object.

Omitted OverlapCoactionTests.identity
The identity overlap datum gives d(n)=1⊗n under the tensor unitors.

Omitted OverlapCoactionTests.canonical
On N=S⊗R M the coaction is s⊗m↦s⊗1⊗m.

Omitted OverlapCoactionTests.noFlatness
For Z→Z/2Z the forward presentation-to-coalgebra construction is still defined; it does not assert effective descent to Z.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/coaction-transition-maps
For a native coalgebra (N,d), tensor universal properties give two S⊗R S-linear maps θd:N⊗R S→S⊗R N and ψd:S⊗R N→N⊗R S. If d(n)=Σai⊗ni, their formulas are θd(n⊗b)=Σai⊗b ni and ψd(s⊗n)=Σs ni⊗ai. These formulas are induced linear maps, independent of every finite tensor decomposition. The two scalar factors act as in ModuleOverlapDatum.

Omitted ModuleCoaction.transition
The R-balanced formula produces the overlap map θd.

Omitted ModuleCoaction.reverseTransition
The R-balanced formula produces the reverse map ψd.

Omitted ModuleCoaction.transition_tmul
For d(n)=Σai⊗ni, θd(n⊗b)=Σai⊗b ni.

Omitted ModuleCoaction.reverseTransition_tmul
For d(n)=Σai⊗ni, ψd(s⊗n)=Σs ni⊗ai.

Omitted CoactionTransitionTests.canonical
For d(s⊗m)=s⊗1⊗m, θ((s⊗m)⊗t)=s⊗(t⊗m) and ψ(s⊗(t⊗m))=(s⊗m)⊗t.

Omitted CoactionTransitionTests.zeroModule
On N=0 both transition maps are the unique maps between zero overlap modules.

Omitted CoactionTransitionTests.decomposition
Replacing a tensor expression by a balanced relation or a sum leaves both maps unchanged.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/coaction-transition-inverses
For a native coalgebra (N,d), the maps above satisfy ψd∘θd=id_(N⊗R S) and θd∘ψd=id_(S⊗R N). They are inverse S⊗R S-linear isomorphisms for arbitrary f.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/coaction-transition-cocycle
The transition θd of a native coalgebra satisfies θ12∘θ01=θ02 on N⊗R S⊗R S, with all three maps extended along their insertion ring maps and compared using tensor associators.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/coalgebra-to-overlap
Every existing Comonad.Coalgebra G produces a ModuleOverlapDatum(f) on the same S-module by taking θd with inverse ψd and the preceding cocycle proof. Denote it ModuleCoaction.toOverlap. This construction needs no faithful flatness.

Omitted ModuleCoaction.toOverlap
Packages θd and ψd as a tensor-overlap datum.

Omitted ModuleCoaction.toOverlap_module
Forgetting the overlap datum returns the native coalgebra's underlying ModuleCat S object.

Omitted ModuleCoaction.toOverlap_transition
The transition and its inverse are exactly θd and ψd above.

Omitted CoalgebraOverlapTests.zero
The zero coalgebra produces the zero overlap datum.

Omitted CoalgebraOverlapTests.nonflat
For Z→Z/2Z the construction exists but the comparison ModuleCat Z→overlap data is not an equivalence.

Omitted CoalgebraOverlapTests.factors
For canonical d, θ((s⊗m)⊗t)=s⊗(t⊗m), not t⊗(s⊗m).

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-coaction-roundtrips
For every overlap datum θ, reconstructing θ from dθ yields the original transition; for every native coalgebra d, evaluating θd on n⊗1 yields d(n). These equalities preserve the underlying S-module and all proof fields by proof irrelevance, after the specified tensor identifications.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-coalgebra-morphisms
For overlap data (N,θ),(N′,θ′) and an S-linear h:N→N′, the overlap commuting square (idS⊗h)∘θ=θ′∘(h⊗idS) holds iff (idS⊗h)∘dθ=dθ′∘h. Thus datum morphisms are exactly the existing native coalgebra morphisms on h, with the same identities and compositions.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-coalgebra-equivalence
For every commutative ring map f:R→S, ModuleOverlapDatum(f) is equivalent as a category over ModuleCat S to the existing Comonad.Coalgebra ((extendRestrictScalarsAdj f).toComonad). The forward and inverse functors are the two object constructions with the same underlying S-linear morphisms. Unit and counit have identity underlying module maps and obey the triangle identity. This compares two presentations, not ModuleCat R with either category; effective descent needs faithful flatness later.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-comparison-canonical
For every f and R-module M, the canonical overlap on N=S⊗R M is sent to the existing (Comonad.comparison (extendRestrictScalarsAdj f)).obj M. Its coaction is L.map(unit.app M), or s⊗m↦s⊗(1⊗m). For an R-linear h:M→M′, the canonical arrow is L.map h, or s⊗m↦s⊗h(m). These identifications are compatible with the existing comparison's forgetful functor, before imposing faithful flatness.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/canonical-overlap-functor
For any f:R→S, scalar extension with its canonical transition defines a functor ModuleCat R→ModuleOverlapDatum(f). At M its module is N=S⊗R M and its transition is θ((s⊗m)⊗t)=s⊗(t⊗m), with inverse ψ(s⊗(t⊗m))=(s⊗m)⊗t. At an R-linear h it is s⊗m↦s⊗h(m). The tensor unit/associator comparisons are specified, and forgetting the datum yields the existing extendScalars f functor.

Omitted ModuleOverlapDatum.canonical
An R-module M gives N=S⊗R M with θ((s⊗m)⊗t)=s⊗(t⊗m).

Omitted ModuleOverlapCanonical.map
The arrow associated to h is the existing extendScalars f map h, with identity and composition laws.

Omitted ModuleOverlapCanonical.forget
The canonical overlap functor followed by its underlying-module functor agrees with the existing extendScalars f.

Omitted CanonicalOverlapTests.identity
For f=idR, the canonical transition becomes identity through the unitors.

Omitted CanonicalOverlapTests.scalarFactors
The formula sends (s⊗m)⊗t to s⊗(t⊗m); it does not exchange s and t.

Omitted CanonicalOverlapTests.nonfaithful
For Z→Z/2Z the canonical functor identifies the maps multiplication by2 and0 on Z, so it is not faithful.

Omitted ModuleDescentBridge.tensor_comonad_coordinates.tensorFormula
The full pure-tensor counit/comultiplication evaluation with explicitly transported restricted-module instances is not included; the intrinsic native fields are given above.

Omitted ModuleDescentBridge.overlap_comparison_canonical.overlapIso
The actual natural isomorphism from the unimplemented tensor-overlap functor to Mathlib's comparison is not included; only the native comparison field equations are given above.

END CONTINUATION SIGNATURE OMISSIONS -/


namespace TauCeti.AlgebraicGeometry.ModuleDescentAllTests

open CategoryTheory Opposite

universe uD

noncomputable section

-- Transport the existing pseudofunctor; this is not a second module category.
abbrev affineModulePullback :
    Pseudofunctor (LocallyDiscrete CommRingCat.{uD}ᵒᵖᵒᵖ) Cat :=
  (CategoryTheory.unopUnop CommRingCat.{uD}).toPseudofunctor.comp
    CommRingCat.moduleCatExtendScalarsPseudofunctor

variable {R A : Type uD} [CommRing R] [CommRing A]

abbrev NativeData (f : R →+* A) :=
  affineModulePullback.DescentData
    (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)

-- The existing native coalgebra carrier is retained.
abbrev NativeCoalgebra (f : R →+* A) :=
  (ModuleCat.extendRestrictScalarsAdj f).toComonad.Coalgebra

-- Projection helper to state the comparison's underlying-module compatibility.
def forgetNativeData (f : R →+* A) : NativeData f ⥤ ModuleCat.{uD} A := by
  sorry

-- AlgebraicModuliForArithmeticGeometry:R09.3/native-module-descent-coalgebra
-- Construct via existing DescentData'.descentDataEquivalence and the
-- module-specific chosen-overlap adapter; no arbitrary coherence assumption.
def nativeCoalgebraEquivalence (f : R →+* A) :
    NativeData f ≌ NativeCoalgebra f := by
  sorry

def nativeCoalgebraEquivalenceForget (f : R →+* A) :
    (nativeCoalgebraEquivalence f).functor ⋙
      Comonad.forget (ModuleCat.extendRestrictScalarsAdj f).toComonad ≅
    forgetNativeData f := by
  sorry

-- AlgebraicModuliForArithmeticGeometry:R09.3/native-module-canonical-comparison
def nativeCanonicalComparison (f : R →+* A) :
    affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op) ⋙
      (nativeCoalgebraEquivalence f).functor ≅
    Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f) := by
  sorry

-- AlgebraicModuliForArithmeticGeometry:R09.3/affine-module-descent-equivalence
-- This is the exact native canonical-functor equivalence signature.
-- Its explicit inverse/counit element comparison remains a fine-adapter omission.
theorem nativeFaithfullyFlatDescent (f : R →+* A) (hf : f.FaithfullyFlat) :
    (affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).IsEquivalence := by
  sorry

-- Smoke examples use actual native objects and keep all module morphisms.
example (f : R →+* A) (M : ModuleCat.{uD} R) :
    Nonempty (((nativeCoalgebraEquivalence f).functor.obj
      ((affineModulePullback.toDescentData
        (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).obj M)) ≅
      (Comonad.comparison (ModuleCat.extendRestrictScalarsAdj f)).obj M) := by
  sorry

example (f : R →+* A) (D : NativeData f) :
    Nonempty ((nativeCoalgebraEquivalence f).inverse.obj
      ((nativeCoalgebraEquivalence f).functor.obj D) ≅ D) := by
  sorry

example (f : R →+* A) {M N : ModuleCat.{uD} R} (h : M ⟶ N) :
    ((affineModulePullback.toDescentData
      (fun (_ : PUnit) ↦ (CommRingCat.ofHom f).op)).map h).hom PUnit.unit =
      (ModuleCat.extendScalars f).map h := by
  sorry

end TauCeti.AlgebraicGeometry.ModuleDescentAllTests

/- Exact fine-adapter signature omissions for this continuation.
Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-pullback-coordinates
Put B=A⊗R A, with i0(a)=a⊗1 and i1(a)=1⊗a. For an A-module N, define B-linear isomorphisms c0:B⊗_(A,i0)N→N⊗R A and c1:B⊗_(A,i1)N→A⊗R N. Their formulas are c0((a⊗b)⊗n)=a n⊗b and c1((a⊗b)⊗n)=a⊗b n; inverses send n⊗b to (1⊗b)⊗n and a⊗n to (a⊗1)⊗n. Retain the two different B-actions and naturality for every A-linear map.

Omitted OverlapPullbackCoordinates.left
The first extension module has the displayed c0 and inverse.

Omitted OverlapPullbackCoordinates.right
The second extension module has the displayed c1 and inverse.

Omitted OverlapPullbackCoordinates.map
Both isomorphisms commute with every A-linear map N→N′.

Omitted OverlapPullbackTests.identity
For f=idR, both coordinates reduce to native scalar-extension unitors.

Omitted OverlapPullbackTests.factors
For R=F3,A=F3×F3,N=A, the left coordinate puts the first idempotent action on N and the right coordinate puts the second there; swapping the actions fails.

Omitted OverlapPullbackTests.zeroRing
For the zero coefficient ring, both maps are the unique maps of zero modules; no Nontrivial premise is added.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-pullback-diagonal
Transport θ:N⊗R A≅A⊗R N to H=c1^−1 θ c0 between the native pair-overlap extensions. The native DescentData′ pullHom′ of H along the diagonal of f.op is identity on N. Its tensor mediator is multiplication μ:B→A, and this identity is exactly the existing overlap-diagonal lemma after inserting the native unit and composition isomorphisms.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-pullback-triple
Choose the native triple overlap by the pullback of the two pair overlaps over their shared middle A-factor. Its coordinate ring identifies with (A⊗R A)⊗R A. Under the displayed extension coordinates and native scalar-extension associators, native pullHom′ along p01,p12,p02 gives θ01,θ12,θ02 respectively. Thus its relation H01≫H12=H02 is exactly θ12∘θ01=θ02, with categorical and function-composition orders distinguished.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/overlap-to-chosen-descent
An existing ModuleOverlapDatum(f) defines an object of the existing affine module pseudofunctor DescentData′ for the singleton f.op and the chosen tensor pair/triple pullbacks. Its sole object is N, its native overlap map is c1^−1 θ c0, and its two equation fields are the preceding diagonal and triple comparisons. On arrows it retains every A-linear overlap morphism.

Omitted ModuleOverlapDatum.toChosen
Construct the native DescentData′ object on N.

Omitted ModuleOverlapDatum.toChosen_hom
The native overlap morphism is c1^−1 θ c0.

Omitted ModuleOverlapDatum.toChosen_map
Every overlap morphism gives the same underlying A-linear native arrow.

Omitted OverlapChosenTests.identity
For f=idR and the canonical overlap, the native datum is identity through the existing unitors.

Omitted OverlapChosenTests.nonflat
The conversion exists for Z→Z/2Z; it makes no claim that ModuleCat Z is equivalent to these data.

Omitted OverlapChosenTests.zeroMap
The zero module map between canonical data remains a morphism; no groupoid core or invertibility premise is imposed.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/chosen-descent-to-overlap
From a singleton native DescentData′ object D recover ModuleOverlapDatum(f) on D.obj(*) by θ=c1 D.hom(*,*) c0^−1. The native IsIso instance supplies its inverse. Native diagonal and triple fields, transported by the preceding comparisons, give the exact old overlap cocycle. The construction retains the underlying module and all its morphisms.

Omitted ChosenModuleDescent.toOverlap
Recover the tensor overlap on the same module.

Omitted ChosenModuleDescent.toOverlap_transition
The transition is c1 D.hom c0^−1, with its transported inverse.

Omitted ChosenModuleDescent.toOverlap_map
A native datum arrow gives the same A-linear overlap arrow.

Omitted ChosenOverlapTests.canonical
A canonical native datum recovers θ((a⊗m)⊗b)=a⊗(b⊗m).

Omitted ChosenOverlapTests.zero
The zero native datum recovers the zero overlap datum.

Omitted ChosenOverlapTests.noninvertible
The zero map between nonzero canonical data remains an overlap map and is not made invertible.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/chosen-overlap-roundtrips
Converting an overlap datum to chosen descent and back returns its original θ; converting a native chosen datum to overlap and back returns its original hom. The underlying modules stay identical; proof fields agree by proof irrelevance and the specified coordinate isomorphisms.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/chosen-overlap-morphisms
For an A-linear h:N→N′, the tensor overlap commuting square holds if and only if the native chosen DescentData′ Hom.comm equation holds after c0,c1 transport. Both conversions retain h and its identity/composition laws, including noninvertible h.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/chosen-overlap-equivalence
ModuleOverlapDatum(f) is equivalent over ModuleCat A to the native singleton DescentData′ category for the chosen tensor overlaps. The unit and counit are identities on the underlying module, using the proved object round trips. No new generic descent carrier, test-object coherence or quotient of morphisms is defined.

Omitted AlgebraicModuliForArithmeticGeometry:R09.3/descent-equalizer-module-coordinates
For a native descent datum D with associated coalgebra (N,d), the existing comparison inverse equalizer of U(d) and η_(U N) is the R-submodule M={n∈N | d(n)=1⊗n}. Its inclusion is the ordinary submodule inclusion, its arrow map is the restriction of the underlying module map, and the native comparison counit has element formula a⊗m↦a m. When f is faithfully flat this counit is an isomorphism and agrees with the original datum transitions.

END NATIVE CHOSEN-OVERLAP OMISSIONS -/

/-! Intrinsic-band continuation, Codex codex-rtOQ9t, Refs #672.
Twenty-six packet leaves use existing CatCenter, units, Aut and slice-Hom
descent. Codex codex-rtOQ9t continues codex-J6LwjP's native checkpoint with
the actual coefficient-center hom, compatible comparison and presheaf map.
The Mathlib-only extraction has zero errors, 11 admitted-proof warnings and
no other warnings. Foundational and chosen-band comparison proofs are
supplied; general sheafness, locality and global band uniqueness remain
admitted. This does not validate the full file.
The old intrinsic-band omission ledger is historical: the concrete section
model below supplies a new route, while the old slice-glued carrier comparison
still requires the imported SF1 interface. No proof or stage is closed.
-/

namespace TauCeti.AlgebraicGeometry

open CategoryTheory Opposite Bicategory

variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

/-- R09.4/band-center-sections: actual compatible units of existing centers. -/
noncomputable def intrinsicBandSectionSubgroup (U : C) :
    Subgroup (∀ (V : C), (V ⟶ U) → (CatCenter (F.obj (.mk (op V))))ˣ) where
  carrier := {z | ∀ (V W : C) (f : V ⟶ U) (g : W ⟶ V)
      (x : F.obj (.mk (op V))),
    (F.map g.op.toLoc).toFunctor.map ((z V f).val.app x) =
      (z W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x)}
  one_mem' := by
    intro V W f g x
    exact (F.map g.op.toLoc).toFunctor.map_id x
  mul_mem' := by
    intro s t hs ht V W f g x
    change (F.map g.op.toLoc).toFunctor.map
      ((t V f).val.app x ≫ (s V f).val.app x) =
      (t W (g ≫ f)).val.app _ ≫ (s W (g ≫ f)).val.app _
    rw [Functor.map_comp, hs V W f g x, ht V W f g x]
  inv_mem' := by
    intro s hs V W f g x
    let e := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (s V f)).app x
    let e' := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op W)))) (s W (g ≫ f))).app
      ((F.map g.op.toLoc).toFunctor.obj x)
    have h : (F.map g.op.toLoc).toFunctor.mapIso e = e' := by
      apply Iso.ext
      exact hs V W f g x
    exact congrArg Iso.inv h

abbrev IntrinsicBandSection (U : C) := ↥(intrinsicBandSectionSubgroup F U)

namespace IntrinsicBandSections

def val {U : C} (s : IntrinsicBandSection F U) (V : C) (f : V ⟶ U) :
    (CatCenter (F.obj (.mk (op V))))ˣ := s.val V f

theorem compatible {U : C} (s : IntrinsicBandSection F U)
    (V W : C) (f : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((val F s V f).val.app x) =
      (val F s W (g ≫ f)).val.app ((F.map g.op.toLoc).toFunctor.obj x) := by
  exact s.property V W f g x

/-- R09.4/band-center-ext. -/
@[ext] theorem ext {U : C} (s t : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      (val F s V f).val.app x = (val F t V f).val.app x) : s = t := by
  apply Subtype.ext
  funext V f
  apply Units.ext
  exact CatCenter.ext _ _ (h V f)

/-- R09.4/band-center-commute; subgroup operations come from existing groups. -/
noncomputable instance commGroup (U : C) : CommGroup (IntrinsicBandSection F U) :=
  { (inferInstance : Group (IntrinsicBandSection F U)) with
    mul_comm := by
      intro s t
      apply Subtype.ext
      funext V f
      change s.val V f * t.val V f = t.val V f * s.val V f
      apply Units.ext
      apply CatCenter.ext
      intro x
      change ((s.val V f).val * (t.val V f).val).app x =
        ((t.val V f).val * (s.val V f).val).app x
      rw [CatCenter.mul_app', CatCenter.mul_app] }

/-- R09.4/band-center-restrict: reindex the family, not the fibre functor. -/
noncomputable def restrict {U V : C} (f : V ⟶ U) :
    IntrinsicBandSection F U →* IntrinsicBandSection F V where
  toFun s := ⟨fun W a ↦ s.val W (a ≫ f), by
    intro W X a g x
    simpa only [Category.assoc] using s.property W X (a ≫ f) g x⟩
  map_one' := by rfl
  map_mul' := by intros; rfl

theorem restrict_apply {U V W : C} (f : V ⟶ U)
    (s : IntrinsicBandSection F U) (a : W ⟶ V) :
    val F (restrict F f s) W a = val F s W (a ≫ f) := rfl

/-- R09.4/band-center-restrict-id. -/
theorem restrict_id {U : C} (s : IntrinsicBandSection F U) :
    restrict F (𝟙 U) s = s := by
  apply ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

/-- R09.4/band-center-restrict-comp. -/
theorem restrict_comp {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

/-- R09.4/band-center-evaluation. -/
noncomputable def eval {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V))) :
    IntrinsicBandSection F U →* Aut x where
  toFun s := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op V)))) (val F s V a)).app x
  map_one' := by apply Iso.ext; rfl
  map_mul' := by intros; apply Iso.ext; rfl

theorem eval_mul {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s t : IntrinsicBandSection F U) :
    eval F a x (s * t) = eval F a x s * eval F a x t := (eval F a x).map_mul s t

theorem eval_conjugation {U V : C} (a : V ⟶ U)
    {x y : F.obj (.mk (op V))} (e : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F a x s) = eval F a y s := by
  apply Iso.ext
  change e.inv ≫ (val F s V a).val.app x ≫ e.hom = (val F s V a).val.app y
  rw [← CatCenter.naturality, e.inv_hom_id_assoc]

theorem eval_restrict {U V W : C} (a : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op V))) (s : IntrinsicBandSection F U) :
    (F.map g.op.toLoc).toFunctor.mapAut x (eval F a x s) =
      eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) s := by
  apply Iso.ext
  exact compatible F s V W a g x

/-- R09.4/band-center-evaluation-central. No gerbe or abelian-inertia assumption. -/
theorem eval_central {U V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F a x s * b = b * eval F a x s := by
  apply Iso.ext
  exact (val F s V a).val.naturality b.hom

/-- R09.4/band-center-evaluation-reindex: the same arrow in two slice presentations. -/
theorem eval_reindex {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := rfl

/-- Packaging used by R09.4/band-center-sheaf. -/
noncomputable def presheaf : Cᵒᵖ ⥤ AddCommGrpCat.{max u v u' v'} where
  obj U := AddCommGrpCat.of (Additive (IntrinsicBandSection F U.unop))
  map f := AddCommGrpCat.ofHom (MonoidHom.toAdditive (restrict F f.unop))
  map_id := by
    intro U
    apply AddCommGrpCat.ext
    intro s
    exact restrict_id F s
  map_comp := by
    intro U V W f g
    apply AddCommGrpCat.ext
    intro s
    exact (restrict_comp F f.unop g.unop s).symm

/-- Local central families commute with the native descent transitions. -/
theorem coverTransition {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U)))
    {Y : C} (q : Y ⟶ U) {i j : R.arrows.category}
    (f : Y ⟶ i.obj.left) (g : Y ⟶ j.obj.left)
    (hf : f ≫ i.obj.hom = q) (hg : g ≫ j.obj.hom = q) :
    (F.map f.op.toLoc).toFunctor.map
        (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom ≫
        ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x).hom q f g hf hg =
      ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x).hom q f g hf hg ≫
        (F.map g.op.toLoc).toFunctor.map
          (eval F (𝟙 j.obj.left) ((F.map j.obj.hom.op.toLoc).toFunctor.obj x) (z j)).hom := by sorry

/-- An actual native descent isomorphism, without effectivity assumptions. -/
noncomputable def coverIso {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    Aut ((F.toDescentData (fun k : R.arrows.category => k.obj.hom)).obj x) := by sorry

lemma coverIso_hom_apply {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).hom.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

lemma coverIso_one {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

lemma coverIso_inv {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    coverIso F R (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) x = (coverIso F R z hz x)⁻¹ := by sorry

/-- Descend both arrows and inverse using the existing fully faithful functor. -/
noncomputable def coverAut (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) : Aut x := by sorry

lemma coverAut_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (coverAut F J R hR z hz x).hom =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom := by sorry

lemma coverAut_unique (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (a : Aut x)
    (ha : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.map a.hom =
        (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).hom) :
    a = coverAut F J R hR z hz x := by sorry

lemma coverAut_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_one
example {U : C} (R : Sieve U) (x : F.obj (.mk (op U))) :
    coverIso F R (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.iso_inverse_component
example {U : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (coverIso F R z hz x).inv.hom i =
      (eval F (𝟙 i.obj.left) ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) (z i)).inv := by sorry

-- BandCoverTests.iso_empty
example {U : C} (R : Sieve U) [IsEmpty R.arrows.category]
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) : coverIso F R z hz x = 1 := by sorry

-- BandCoverTests.aut_one
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun _ => 1) (fun _ _ _ => map_one _) x = 1 := by sorry

-- BandCoverTests.aut_existing
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) x = eval F (𝟙 U) x s := by sorry

-- BandCoverTests.aut_trivial_inertia
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) [Subsingleton (Aut x)] :
    coverAut F J R hR z hz x = 1 := by sorry

/-- R09.4/band-center-cover-naturality: compare every fibre morphism on the cover. -/
lemma coverAut_naturality (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {x y : F.obj (.mk (op U))} (f : x ⟶ y) :
    f ≫ (coverAut F J R hR z hz y).hom =
      (coverAut F J R hR z hz x).hom ≫ f := by sorry

/-- R09.4/band-center-cover-inverse: descend the inverse family with its matching proof. -/
lemma coverAut_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    coverAut F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) x = (coverAut F J R hR z hz x)⁻¹ := by sorry

/-- R09.4/band-center-cover-center: the actual unit of the centre of F(U). -/
noncomputable def coverCenter (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    (CatCenter (F.obj (.mk (op U))))ˣ := by sorry

lemma coverCenter_app_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).val.app x =
      (coverAut F J R hR z hz x).hom := by sorry

lemma coverCenter_app_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) :
    (coverCenter F J R hR z hz).inv.app x =
      (coverAut F J R hR z hz x).inv := by sorry

lemma coverCenter_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (x : F.obj (.mk (op U))) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map ((coverCenter F J R hR z hz).val.app x) =
      (val F (z i) i.obj.left (𝟙 i.obj.left)).val.app
        ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) := by sorry

lemma coverCenter_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

lemma coverCenter_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    coverCenter F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) = (coverCenter F J R hR z hz)⁻¹ := by sorry

/-- Uniqueness requires local component agreement at every x, not one chosen object. -/
lemma coverCenter_unique (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (a : (CatCenter (F.obj (.mk (op U))))ˣ)
    (ha : ∀ (x : F.obj (.mk (op U))) (i : R.arrows.category),
      (F.map i.obj.hom.op.toLoc).toFunctor.map (a.val.app x) =
        (val F (z i) i.obj.left (𝟙 i.obj.left)).val.app
          ((F.map i.obj.hom.op.toLoc).toFunctor.obj x)) :
    a = coverCenter F J R hR z hz := by sorry

lemma coverCenter_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_one
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    coverCenter F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry

-- BandCenterCoverTests.center_inverse
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    coverCenter F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) = (coverCenter F J R hR z hz)⁻¹ := by sorry

-- BandCenterCoverTests.center_existing
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U) :
    coverCenter F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = val F s U (𝟙 U) := by sorry

-- BandCenterCoverTests.center_empty_fibre
example (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) [IsEmpty (F.obj (.mk (op U)))]
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) : coverCenter F J R hR z hz = 1 := by sorry

/-! Arbitrary-base cover descent continuation, Codex codex-a71f92. -/
/-- Base-change index into the original sieve's native arrow category. -/
abbrev pullbackArrow {U V : C} (R : Sieve U) (a : V ⟶ U)
    (i : (R.pullback a).arrows.category) : R.arrows.category :=
  ⟨Over.mk (i.obj.hom ≫ a), i.property⟩

/-- Compose fibre restrictions through the actual native pseudofunctor constraint. -/
lemma center_map_comp {V W X : C} (g : W ⟶ V) (h : X ⟶ W)
    (x : F.obj (.mk (op V))) (c : x ⟶ x)
    (z : CatCenter (F.obj (.mk (op X))))
    (hc : (F.map (h ≫ g).op.toLoc).toFunctor.map c =
      z.app ((F.map (h ≫ g).op.toLoc).toFunctor.obj x)) :
    (F.map h.op.toLoc).toFunctor.map ((F.map g.op.toLoc).toFunctor.map c) =
      z.app ((F.map h.op.toLoc).toFunctor.obj ((F.map g.op.toLoc).toFunctor.obj x)) := by sorry
/-- Fibre-centre component over every arrow a into the covered object. -/
noncomputable def coverCenterAt (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) : (CatCenter (F.obj (.mk (op V))))ˣ := by sorry
lemma coverCenterAt_map_hom (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) (x : F.obj (.mk (op V)))
    (i : (R.pullback a).arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map ((coverCenterAt F J R hR z hz a).val.app x) =
      (val F (z (pullbackArrow R a i)) i.obj.left (𝟙 i.obj.left)).val.app
        ((F.map i.obj.hom.op.toLoc).toFunctor.obj x) := by sorry
/-- Arbitrary base restriction is detected on the pulled-back covering sieve. -/
lemma centerFamily_congr {U X : C} (R : Sieve U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (q q' : X ⟶ U) (hq : R q) (hq' : R q') (e : q = q') :
    z ⟨Over.mk q, hq⟩ = z ⟨Over.mk q', hq'⟩ := by sorry
lemma coverCenterAt_compatible (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V W : C} (a : V ⟶ U) (g : W ⟶ V) (x : F.obj (.mk (op V))) :
    (F.map g.op.toLoc).toFunctor.map ((coverCenterAt F J R hR z hz a).val.app x) =
      (coverCenterAt F J R hR z hz (g ≫ a)).val.app
        ((F.map g.op.toLoc).toFunctor.obj x) := by sorry
lemma coverCenterAt_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
lemma coverCenterAt_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => (z i)⁻¹)
      (fun i j g => by rw [map_inv, hz]) a = (coverCenterAt F J R hR z hz a)⁻¹ := by sorry
/-- Compare the pulled-back fibre-centre unit to an already covered local section. -/
lemma coverCenterAt_of_mem (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (i : R.arrows.category) {V : C} (a : V ⟶ i.obj.left) :
    coverCenterAt F J R hR z hz (a ≫ i.obj.hom) = val F (z i) V a := by sorry
/-- The simultaneous family is now an actual section of the inherited subgroup. -/
noncomputable def glue (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) : IntrinsicBandSection F U := by sorry
lemma glue_val (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) {V : C} (a : V ⟶ U) :
    val F (glue F J R hR z hz) V a = coverCenterAt F J R hR z hz a := by sorry
lemma glue_restrict (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) (i : R.arrows.category) :
    restrict F i.obj.hom (glue F J R hR z hz) = z i := by sorry
lemma glue_one (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
lemma glue_inv (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
lemma coverCenterAt_existing (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U) (s : IntrinsicBandSection F U)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry

/-- R09.4/band-center-sheaf: glue hom AND inverse via existing Hom sheaves. -/
theorem isSheaf (J : GrothendieckTopology C) [F.IsPrestack J]
    (hIso : ∀ (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y), IsIso f) :
    Presheaf.IsSheaf J (presheaf F) := by sorry

variable (J : GrothendieckTopology C)

/-- Specific descent of evaluations, using the existing fully faithful descent functor. -/
theorem eval_eq_of_cover [F.IsPrestack J] {U V : C} (a : V ⟶ U)
    (x : F.obj (.mk (op V))) (s t : IntrinsicBandSection F U)
    (R : Sieve V) (hR : R ∈ J V)
    (h : ∀ (W : C) (g : W ⟶ V), R g →
      eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) s =
        eval F (g ≫ a) ((F.map g.op.toLoc).toFunctor.obj x) t) :
    eval F a x s = eval F a x t := by
  apply Iso.ext
  apply (F.isPrestackFor' R hR).fullyFaithful.map_injective
  apply Pseudofunctor.DescentData.hom_ext
  intro i
  change (F.map i.obj.hom.op.toLoc).toFunctor.map (eval F a x s).hom =
    (F.map i.obj.hom.op.toLoc).toFunctor.map (eval F a x t).hom
  have he := h i.obj.left i.obj.hom i.property
  rw [← eval_restrict, ← eval_restrict] at he
  exact congrArg Iso.hom he

/-- Joint injectivity on an actual covering sieve, not on one arbitrary arrow. -/
theorem ext_of_cover [F.IsPrestack J] {U : C} (s t : IntrinsicBandSection F U)
    (R : Sieve U) (hR : R ∈ J U)
    (h : ∀ (V : C) (f : V ⟶ U), R f → restrict F f s = restrict F f t) :
    s = t := by
  apply ext
  intro V a x
  have he := eval_eq_of_cover F J a x s t (Sieve.pullback a R)
    (J.pullback_stable a hR) (by
      intro W g hg
      have he := congrArg (eval F (𝟙 W) ((F.map g.op.toLoc).toFunctor.obj x))
        (h W (g ≫ a) hg)
      simpa only [eval_reindex, Category.id_comp] using he)
  exact congrArg Iso.hom he

/-! Unique gluing and prestack sheaf descent continuation. -/
lemma glue_unique [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j),
      restrict F g.hom.left (z j) = z i)
    (s : IntrinsicBandSection F U)
    (hs : ∀ i : R.arrows.category, restrict F i.obj.hom s = z i) :
    s = glue F J R hR z hz := by sorry
lemma glue_existing [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) :
    glue F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = s := by sorry
-- BandCenterPullbackTests.one
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun _ => 1) (fun _ _ _ => map_one _) a = 1 := by sorry
-- BandCenterPullbackTests.inverse
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i)
    {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) a =
      (coverCenterAt F J R hR z hz a)⁻¹ := by sorry
-- BandCenterPullbackTests.existing
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) {V : C} (a : V ⟶ U) :
    coverCenterAt F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) a = val F s V a := by sorry
-- BandCenterGlueTests.one
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U) :
    glue F J R hR (fun _ => 1) (fun _ _ _ => map_one _) = 1 := by sorry
-- BandCenterGlueTests.inverse
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (z : ∀ i : R.arrows.category, IntrinsicBandSection F i.obj.left)
    (hz : ∀ (i j : R.arrows.category) (g : i ⟶ j), restrict F g.hom.left (z j) = z i) :
    glue F J R hR (fun i => (z i)⁻¹) (fun i j g => by rw [map_inv, hz]) =
      (glue F J R hR z hz)⁻¹ := by sorry
-- BandCenterGlueTests.existing
example [F.IsPrestack J] {U : C} (R : Sieve U) (hR : R ∈ J U)
    (s : IntrinsicBandSection F U) :
    glue F J R hR (fun i => restrict F i.obj.hom s)
      (fun i j g => by rw [restrict_comp, Over.w g.hom]) = s := by sorry
/-- Sheaf descent for all prestacks; no groupoid assumption is necessary. -/
theorem isSheaf_of_prestack [F.IsPrestack J] :
    Presheaf.IsSheaf J (presheaf F) := by sorry

variable [hGerbe : IsGerbe F J]

include hGerbe in
/-- Concrete sheaf packaging; proof source is the preceding Hom-descent leaf. -/
noncomputable def sheaf : Sheaf J AddCommGrpCat.{max u v u' v'} where
  obj := presheaf F
  property := isSheaf F J (IsGerbe.isIso_hom (F := F) (J := J))

include hGerbe in
/-- R09.4/band-center-evaluation-injective. -/
theorem eval_injective (U : C) (x : F.obj (.mk (op U))) :
    Function.Injective (eval F (𝟙 U) x) := by
  intro s t h
  apply ext
  intro V a y
  have hp : eval F a ((F.map a.op.toLoc).toFunctor.obj x) s =
      eval F a ((F.map a.op.toLoc).toFunctor.obj x) t := by
    have he := congrArg ((F.map a.op.toLoc).toFunctor.mapAut x) h
    simpa only [eval_restrict, Category.comp_id] using he
  obtain ⟨R, hR, hloc⟩ := IsGerbe.locallyIsomorphic (F := F) (J := J)
    V ((F.map a.op.toLoc).toFunctor.obj x) y
  have hy := eval_eq_of_cover F J a y s t R hR (by
    intro W g hg
    obtain ⟨e⟩ := hloc g hg
    have he := congrArg ((F.map g.op.toLoc).toFunctor.mapAut
      ((F.map a.op.toLoc).toFunctor.obj x)) hp
    rw [eval_restrict, eval_restrict] at he
    rw [← eval_conjugation F (g ≫ a) e s, ← eval_conjugation F (g ≫ a) e t]
    exact congrArg (Aut.autMulEquivOfIso e) he)
  exact congrArg Iso.hom hy

variable (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)

include hGerbe hComm in
/-- R09.4/band-center-evaluation-surjective: local conjugation and refinements. -/
theorem eval_surjective (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (eval F (𝟙 U) x) := by sorry

include hGerbe hComm in
/-- R09.4/band-center-evaluation-equivalence. -/
noncomputable def evalEquiv (U : C) (x : F.obj (.mk (op U))) :
    IntrinsicBandSection F U ≃* Aut x :=
  MulEquiv.ofBijective (eval F (𝟙 U) x)
    ⟨eval_injective F J U x, eval_surjective F J hComm U x⟩

theorem evalEquiv_apply (U : C) (x : F.obj (.mk (op U)))
    (s : IntrinsicBandSection F U) :
    evalEquiv F J hComm U x s = eval F (𝟙 U) x s := rfl

include hComm in
/-- R09.4/band-center-banding: reuse the inherited actual banding structure. -/
noncomputable def banding : AbelianBanding F J (sheaf F J) where
  autEquiv U x :=
    { toFun a := evalEquiv F J hComm U x a.toAdd.toMul
      invFun a := Multiplicative.ofAdd (Additive.ofMul ((evalEquiv F J hComm U x).symm a))
      left_inv a := (evalEquiv F J hComm U x).left_inv a.toAdd.toMul
      right_inv a := (evalEquiv F J hComm U x).right_inv a
      map_mul' a b := (evalEquiv F J hComm U x).map_mul a.toAdd.toMul b.toAdd.toMul }
  pullback := by
    intro U V f x a
    let s : IntrinsicBandSection F U := a.toAdd.toMul
    change (F.map f.op.toLoc).toFunctor.mapAut x (eval F (𝟙 U) x s) =
      eval F (𝟙 V) ((F.map f.op.toLoc).toFunctor.obj x) (restrict F f s)
    apply Iso.ext
    change (F.map f.op.toLoc).toFunctor.map ((val F s U (𝟙 U)).val.app x) =
      (val F (restrict F f s) V (𝟙 V)).val.app _
    rw [restrict_apply, Category.id_comp]
    simpa only [Category.comp_id] using compatible F s U V (𝟙 U) f x
  conjugation := by
    intro U x y e a
    exact eval_conjugation F (𝟙 U) e a.toAdd.toMul

theorem banding_apply (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative ((sheaf F J).obj.obj (op U))) :
    (banding F J hComm).autEquiv U x a = eval F (𝟙 U) x a.toAdd.toMul := rfl

variable {hComm}
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

/-- R09.4/band-coefficient-naturality: conjugation covers every fibre arrow. -/
theorem coefficient_naturality (U : C) {x y : F.obj (.mk (op U))}
    (f : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f := by
  let : IsIso f := IsGerbe.isIso_hom (F := F) (J := J) U f
  have h := congrArg Iso.hom (b.conjugation U (asIso f) a)
  change inv f ≫ (b.autEquiv U x a).hom ≫ f = (b.autEquiv U y a).hom at h
  rw [← h]
  simp only [← Category.assoc, IsIso.hom_inv_id, Category.id_comp]

/-- R09.4/band-coefficient-center: a hom into existing units of CatCenter. -/
noncomputable def coefficientCenter (U : C) :
    Multiplicative (A.obj.obj (op U)) →* (CatCenter (F.obj (.mk (op U))))ˣ where
  toFun a := (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))).symm
    (NatIso.ofComponents (fun x ↦ b.autEquiv U x a)
      (fun f ↦ coefficient_naturality F J A b U f a))
  map_one' := by
    apply Units.ext
    apply CatCenter.ext
    intro x
    change (b.autEquiv U x 1).hom = (1 : Aut x).hom
    rw [map_one]
  map_mul' := by
    intro a a'
    apply Units.ext
    apply CatCenter.ext
    intro x
    change (b.autEquiv U x (a * a')).hom = (b.autEquiv U x a').hom ≫
      (b.autEquiv U x a).hom
    rw [map_mul]
    rfl

/-- R09.4/band-coefficient-center-evaluation. -/
theorem coefficientCenter_app (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a)).app x = b.autEquiv U x a := by
  apply Iso.ext
  rfl

theorem coefficientCenter_inv (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    coefficientCenter F J A b U a⁻¹ = (coefficientCenter F J A b U a)⁻¹ :=
  map_inv (coefficientCenter F J A b U) a

/-- R09.4/band-coefficient-restriction: the actual band pullback equation. -/
theorem coefficientCenter_restrict {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.map ((coefficientCenter F J A b U a).val.app x) =
      (coefficientCenter F J A b V
        (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))).val.app
          ((F.map f.op.toLoc).toFunctor.obj x) := by
  exact congrArg Iso.hom (b.pullback f x a)

/-- R09.4/band-center-from-banding: its values are actual band automorphisms. -/
noncomputable def fromBanding (b : AbelianBanding F J A) (U : C) :
    Multiplicative (A.obj.obj (op U)) →* IntrinsicBandSection F U where
  toFun a := ⟨fun V f ↦ coefficientCenter F J A b V
    (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)), by
      intro V W f g x
      rw [coefficientCenter_restrict]
      congr 3
      exact (congrArg (fun h ↦ h a.toAdd) (A.obj.map_comp f.op g.op)).symm⟩
  map_one' := by
    apply ext
    intro V f x
    change (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op 0))).hom =
      (1 : Aut x).hom
    rw [map_zero]
    exact congrArg Iso.hom (b.autEquiv V x).map_one
  map_mul' := by
    intro a a'
    apply ext
    intro V f x
    change (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op
      (a.toAdd + a'.toAdd)))).hom =
      (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a'.toAdd))).hom ≫
      (b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))).hom
    rw [map_add]
    exact congrArg Iso.hom ((b.autEquiv V x).map_mul
      (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))
      (Multiplicative.ofAdd (A.obj.map f.op a'.toAdd)))

/-- R09.4/band-center-from-banding-evaluation. -/
theorem fromBanding_eval {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (a : Multiplicative (A.obj.obj (op U))) :
    eval F f x (fromBanding F J A b U a) =
      b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) :=
  coefficientCenter_app F J A b V x _

/-- R09.4/band-center-from-banding-restriction. -/
theorem fromBanding_restrict {U V : C} (f : V ⟶ U)
    (a : Multiplicative (A.obj.obj (op U))) :
    restrict F f (fromBanding F J A b U a) =
      fromBanding F J A b V (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) := by
  apply ext
  intro W g x
  change (b.autEquiv W x (Multiplicative.ofAdd (A.obj.map (g ≫ f).op a.toAdd))).hom =
    (b.autEquiv W x (Multiplicative.ofAdd (A.obj.map g.op (A.obj.map f.op a.toAdd)))).hom
  exact congrArg (fun z ↦ (b.autEquiv W x (Multiplicative.ofAdd z)).hom)
    (congrArg (fun h ↦ h a.toAdd) (A.obj.map_comp f.op g.op))

/-- Local nonemptiness detects the fixed-band coefficient, even if F(U) is empty. -/
theorem fromBanding_injective (U : C) :
    Function.Injective (fromBanding F J A b U) := by
  intro a a' he
  change a.toAdd = a'.toAdd
  have hs := (isSheaf_iff_isSheaf_of_type J _).1
    (Presheaf.isSheaf_comp_of_isSheaf J A.obj
      (forget AddCommGrpCat.{max u v u' v'}) A.property)
  obtain ⟨R, hR, hloc⟩ := IsGerbe.locallyNonempty (F := F) (J := J) U
  apply (hs.isSeparated R hR).ext
  intro V f hf
  obtain ⟨x⟩ := hloc f hf
  have hh := congrArg (eval F f x) he
  rw [fromBanding_eval, fromBanding_eval] at hh
  exact congrArg Multiplicative.toAdd ((b.autEquiv V x).injective hh)

/-- R09.4/band-center-from-banding-ext: determine the actual comparison section. -/
theorem fromBanding_ext (U : C) (a : Multiplicative (A.obj.obj (op U)))
    (s : IntrinsicBandSection F U)
    (h : ∀ (V : C) (f : V ⟶ U) (x : F.obj (.mk (op V))),
      eval F f x s = b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a.toAdd))) :
    s = fromBanding F J A b U a := by
  apply ext
  intro V f x
  exact congrArg Iso.hom ((h V f x).trans (fromBanding_eval F J A b f x a).symm)

/-- R09.4/band-center-from-banding-presheaf: an actual natural transformation. -/
noncomputable def fromBandingPresheaf : A.obj ⟶ presheaf F where
  app U := AddCommGrpCat.ofHom
    { toFun a := Additive.ofMul (fromBanding F J A b U.unop (Multiplicative.ofAdd a))
      map_zero' := (fromBanding F J A b U.unop).map_one
      map_add' a a' := (fromBanding F J A b U.unop).map_mul
        (Multiplicative.ofAdd a) (Multiplicative.ofAdd a') }
  naturality U V f := by
    apply AddCommGrpCat.ext
    intro a
    exact (fromBanding_restrict F J A b f.unop (Multiplicative.ofAdd a)).symm

theorem fromBandingPresheaf_app (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := rfl

theorem fromBandingPresheaf_naturality {U V : C} (f : V ⟶ U) :
    A.obj.map f.op ≫ (fromBandingPresheaf F J A b).app (op V) =
      (fromBandingPresheaf F J A b).app (op U) ≫ (presheaf F).map f.op :=
  (fromBandingPresheaf F J A b).naturality f.op

/-- R09.4/band-center-fixed-band-distinction: no quotient by coefficient symmetry. -/
theorem fromBanding_ne_of_aut_ne (b' : AbelianBanding F J A) (U : C)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U)))
    (h : b.autEquiv U x a ≠ b'.autEquiv U x a) :
    fromBanding F J A b U a ≠ fromBanding F J A b' U a := by
  intro hs
  apply h
  have he := congrArg (eval F (𝟙 U) x) hs
  rw [fromBanding_eval, fromBanding_eval] at he
  rw [op_id, A.obj.map_id] at he
  exact he

/-- R09.4/band-center-band-unique. Local gerbe objects prove local bijectivity;
the coefficient sheaf glues the inverse even when F(U) is empty. -/
theorem band_unique : ∃! e : A ≅ sheaf F J,
    ∀ (U : C) (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      eval F (𝟙 U) x (((Sheaf.homEquiv e.hom).app (op U)) a.toAdd).toMul =
        b.autEquiv U x a := by sorry

-- BandCenterTests.centralImage: also applies to nonabelian fibre groups.
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op V)))
    (s : IntrinsicBandSection F U) (b : Aut x) :
    eval F f x s * b = b * eval F f x s := eval_central F f x s b

-- BandEvaluationTests.reindexedArrow: restrictions use the actual composite arrow.
example {U V W : C} (f : V ⟶ U) (a : W ⟶ V)
    (x : F.obj (.mk (op W))) (s : IntrinsicBandSection F U) :
    eval F a x (restrict F f s) = eval F (a ≫ f) x s := eval_reindex F f a x s

end IntrinsicBandSections

/- Native tests of the new carrier. The group coordinate is fixed, so these
test nonzero recovery and noncentral exclusion instead of assuming the band
comparison they are intended to check. -/
namespace IntrinsicBandTestsRT
open IntrinsicBandSections
variable (J : GrothendieckTopology C) [hGerbe : IsGerbe F J]
include hGerbe

-- BandEvaluationTests.generator, in fixed C3 coordinates.
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ∃ s : IntrinsicBandSection F U,
      e (eval F (𝟙 U) x s) = Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandCenterTests.identity, conditional on the displayed trivial inertia.
example (U : C) (x : F.obj (.mk (op U))) (h : Subsingleton (Aut x)) :
    Subsingleton (IntrinsicBandSection F U) := by
  let := h
  exact (eval_injective F J U x).subsingleton

-- BandEvaluationTests.noncentral, with the actual transposition coordinate.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) (s : IntrinsicBandSection F U) :
    e (eval F (𝟙 U) x s) ≠ Equiv.swap (0 : Fin 3) 1 := by
  intro h
  have hc := congrArg e (eval_central F (𝟙 U) x s
    (e.symm (Equiv.swap (1 : Fin 3) 2)))
  simp only [map_mul, MulEquiv.apply_symm_apply, h] at hc
  have hn : Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2 ≠
      Equiv.swap (1 : Fin 3) 2 * Equiv.swap (0 : Fin 3) 1 := by decide
  exact hn hc

example {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (s : IntrinsicBandSection F U) :
    restrict F g (restrict F f s) = restrict F (g ≫ f) s := by
  apply ext
  intro X a x
  simp only [restrict_apply, Category.assoc]

example {U V : C} (f : V ⟶ U) {x y : F.obj (.mk (op V))}
    (e e' : x ≅ y) (s : IntrinsicBandSection F U) :
    Aut.autMulEquivOfIso e (eval F f x s) =
      Aut.autMulEquivOfIso e' (eval F f x s) := by
  rw [eval_conjugation, eval_conjugation]

example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    ¬ Subsingleton (IntrinsicBandSection F U) := by sorry

-- BandCenterTests.C3, in the chosen automorphism coordinate.
example (hComm : ∀ (U : C) (x : F.obj (.mk (op U))) (a b : Aut x), a * b = b * a)
    (U : C) (x : F.obj (.mk (op U))) (e : Aut x ≃* Multiplicative (ZMod 3)) :
    Nat.card (IntrinsicBandSection F U) = 3 := by sorry

-- BandCenterTests.S3: evaluation lands in the actual trivial center.
example (U : C) (x : F.obj (.mk (op U)))
    (e : Aut x ≃* Equiv.Perm (Fin 3)) :
    Nat.card (IntrinsicBandSection F U) = 1 := by sorry

-- BandRestrictionTests.id applies, in particular, to the nonzero C3 section.
example (U : C) (s : IntrinsicBandSection F U) : restrict F (𝟙 U) s = s := by
  apply ext
  intro V f x
  simp only [restrict_apply, Category.comp_id]

-- BandComparisonTests.inversion: distinct fixed-band coordinates stay distinct.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b b' : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (e : Multiplicative (A.obj.obj (op U)) ≃* Multiplicative (ZMod 3))
    (h : b'.autEquiv U x (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) =
      b.autEquiv U x (e.symm (Multiplicative.ofAdd (2 : ZMod 3)))) :
    fromBanding F J A b U (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) ≠
      fromBanding F J A b' U (e.symm (Multiplicative.ofAdd (1 : ZMod 3))) := by
  apply fromBanding_ne_of_aut_ne
  rw [h]
  intro he
  have hc := congrArg e ((b.autEquiv U x).injective he)
  simp only [MulEquiv.apply_symm_apply] at hc
  exact (by decide : Multiplicative.ofAdd (1 : ZMod 3) ≠
    Multiplicative.ofAdd (2 : ZMod 3)) hc

-- BandCoefficientTests.generator: chosen C3 coordinate, retaining the band.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U)))
    (e : Aut x ≃* Multiplicative (ZMod 3))
    (h : e (b.autEquiv U x a) = Multiplicative.ofAdd (1 : ZMod 3)) :
    e ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a)).app x) = Multiplicative.ofAdd (1 : ZMod 3) := by
  rw [coefficientCenter_app]
  exact h

-- BandCoefficientTests.zero: zero coefficient is the identity at every object.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : coefficientCenter F J A b U (Multiplicative.ofAdd 0) = 1 :=
  (coefficientCenter F J A b U).map_one

-- BandCoefficientTests.inversion: inverse is 2, rather than 1, in C3.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U)))
    (e : Aut x ≃* Multiplicative (ZMod 3))
    (h : e (b.autEquiv U x a) = Multiplicative.ofAdd (1 : ZMod 3)) :
    e ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
      (coefficientCenter F J A b U a⁻¹)).app x) = Multiplicative.ofAdd (2 : ZMod 3) := by
  rw [coefficientCenter_app, map_inv, map_inv, h]
  rfl

-- BandNaturalityTests.allArrows: no representative object or chosen arrow is used.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) {x y : F.obj (.mk (op U))} (f : x ⟶ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    f ≫ (b.autEquiv U y a).hom = (b.autEquiv U x a).hom ≫ f :=
  coefficient_naturality F J A b U f a

-- BandCoefficientRestrictionTests.mappedObject: evaluate at the actual pullback.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapAut x
      ((Aut.unitsEndEquivAut (𝟭 (F.obj (.mk (op U))))
        (coefficientCenter F J A b U a)).app x) =
      b.autEquiv V ((F.map f.op.toLoc).toFunctor.obj x)
        (Multiplicative.ofAdd (A.obj.map f.op a.toAdd)) := by
  rw [coefficientCenter_app]
  exact b.pullback f x a

-- BandComparisonPresheafTests.zero: the actual natural-transformation component.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) : (fromBandingPresheaf F J A b).app (op U) 0 = 0 := by
  change fromBanding F J A b U 1 = 1
  exact (fromBanding F J A b U).map_one

-- BandComparisonPresheafTests.add: coefficient addition is section multiplication.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : A.obj.obj (op U)) :
    ((fromBandingPresheaf F J A b).app (op U) (a + a')).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) *
        fromBanding F J A b U (Multiplicative.ofAdd a') := by
  exact (fromBanding F J A b U).map_mul (Multiplicative.ofAdd a)
    (Multiplicative.ofAdd a')

-- BandComparisonPresheafTests.restriction: preserves the chosen base arrow.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    {U V : C} (f : V ⟶ U) (a : A.obj.obj (op U)) :
    restrict F f (((fromBandingPresheaf F J A b).app (op U) a).toMul) =
      ((fromBandingPresheaf F J A b).app (op V) (A.obj.map f.op a)).toMul :=
  fromBanding_restrict F J A b f (Multiplicative.ofAdd a)

-- BandLocalityTests.cover: true covering-sieve joint injectivity.
example {U : C} (s t : IntrinsicBandSection F U)
    (R : Sieve U) (hR : R ∈ J U)
    (h : ∀ (V : C) (f : V ⟶ U), R f → restrict F f s = restrict F f t) :
    s = t := ext_of_cover F J s t R hR h

-- BandLocalityTests.nonabelian: no commutativity assumption occurs.
example (U : C) (x : F.obj (.mk (op U))) (s t : IntrinsicBandSection F U)
    (h : eval F (𝟙 U) x s = eval F (𝟙 U) x t) : s = t :=
  eval_injective F J U x h

-- BandCoefficientDetectionTests.noGlobalChoice: no x over U is supplied.
example (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (U : C) (a a' : Multiplicative (A.obj.obj (op U)))
    (h : fromBanding F J A b U a = fromBanding F J A b U a') : a = a' :=
  fromBanding_injective F J A b U h

-- BandLocalityTests.disconnected: only the finite coordinate consequence.
-- This is not an elaborated classifying-stack or point-site fixture.
example : ¬ Function.Injective (fun z : ZMod 3 × ZMod 3 ↦ z.1) := by
  intro h
  have he : ((0, 0) : ZMod 3 × ZMod 3) = (0, 1) := h rfl
  have hn : (0 : ZMod 3) ≠ 1 := by decide
  exact hn (congrArg Prod.snd he)

-- BandLocalityTests.singleReduction: actual ring reduction is not injective.
-- This does not assert that this one arrow is a covering sieve.
example : ¬ Function.Injective
    (ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2)) := by
  intro h
  have he := h (by decide :
    ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (0 : ZMod 4) =
      ZMod.castHom (show 2 ∣ 4 from ⟨2, rfl⟩) (ZMod 2) (2 : ZMod 4))
  exact (by decide : (0 : ZMod 4) ≠ 2) he

end IntrinsicBandTestsRT
end TauCeti.AlgebraicGeometry

/- Exact remaining native omissions for this continuation:
R09.4/band-center-glued-comparison needs the SF1 object of descended slice
group sheaves, its effective-descent evaluation isomorphisms and Over.map
restriction coherence. Its proposed signature compares that actual object on
C/U with restriction of IntrinsicBandSections.sheaf, agrees on every local
Aut(x) chart, and commutes with every V→U. It must not be replaced by an
arbitrary Prop or a structure storing the desired comparison as data.

The named point-site B(C3), terminal-gerbe, two-object groupoid and B(S3)
cardinality tests still need the D0 classifying-stack/point-site carrier;
their coordinate-specialized native examples above do not claim to construct
those site fixtures. The C4→C2→C2 chain count and the two disjoint chain
no-terminal test need those explicit site pseudofunctors. The root-gerbe
empty-fibre μn test needs the inherited RootGerbe carrier. The changed-band
C3 inversion test needs that explicit banding fixture. These omissions are
mathematical tests in the packet and reader, not completed Lean tests.
-/

/- Named test fixture/statement ledger for all15 new mathematical tests.
The coordinate-specialized examples above cover some consequences. Where a
named site fixture is unavailable its full signature is omitted, as described
in the preceding interface ledger; none is a completed Lean test.
BandCenterTests.C3: On the one-object point-site gerbe B(C3), there are three central sections, with evaluation recovering all of C3.
BandCenterTests.identity: For the terminal fibre groupoid, the group of compatible central sections is trivial.
BandCenterTests.S3: For B(S3) on a point, sections form the trivial center of S3, rather than all six automorphisms. Thus evaluation onto inertia fails without abelian inertia.
BandRestrictionTests.id: Restriction along identity fixes the nonzero generator of the C3 point band.
BandRestrictionTests.chain: For the three-object chain with fibre groups C4→C2→C2 and restrictions reduction mod2 then identity, the generator1 restricts to1 by either the composite or the two successive maps.
BandRestrictionTests.independentFamilies: Dropping vertical compatibility on this chain permits16 independent tuples instead of4 compatible sections over the top object; this wrong product must be rejected.
BandEvaluationTests.generator: For B(C3) evaluation sends its generator section to the nonidentity automorphism1.
BandEvaluationTests.changeObject: For a connected two-object C3 groupoid, changing the object through any isomorphism gives the same labelled C3 element.
BandEvaluationTests.noncentral: The transposition(01) of S3 fails the naturality equation with(12), so it cannot occur as the evaluation of a central section of B(S3).
BandSheafTests.BC3: For B(C3) on a point the coefficient group is C3 and its banding sends generator to generator.
BandSheafTests.noTerminal: On two disjoint three-object chains, whose site has no terminal object, the construction gives the specified abelian coefficient groups and restrictions on both components.
BandSheafTests.rootNonneutral: For the gerbe of nth roots of O(1) on P1, the coefficient sheaf is μn even though the fibre over P1 is empty; assigning the zero band whenever F(U) is empty is incorrect.
BandComparisonTests.identity: For the canonical C3 band, c_b sends the labelled generator to the generator section.
BandComparisonTests.inversion: If the C3 banding is changed by a↦-a, c_b sends1 to2; these two coefficient identifications are distinct. They cannot be quotiented by Aut(C3).
BandComparisonTests.trivial: The zero coefficient on the terminal gerbe gives the unique section homomorphism.
-/

/- New fixture omissions, distinct from their checked finite coordinates:
OMITTED BandLocalityTests.disconnected: On the one-object point site, the
stack with two disconnected one-object C3 fibre groupoids is not a gerbe;
its central-section group is C3 x C3, of order 9, and evaluation at the first
object is the noninjective first projection. The actual point-site/classifying
stack fixture and its comparison with ZF still require the inherited D0 carrier.
OMITTED BandLocalityTests.singleReduction: Instantiate the inherited
three-object C4 -> C2 -> C2 site pseudofunctor with its actual topology,
identify its compatible section groups, and compare the first restriction
with ZMod.castHom. The finite reduction example alone does not instantiate
that site and does not declare its first arrow covering.
The nonneutral root-gerbe instance of
BandCoefficientDetectionTests.noGlobalChoice still requires RootGerbe;
the general injectivity theorem is proved without any object over U.
-/


/-! Local conjugation descent continuation, Codex codex-5ebb6f. -/
namespace TauCeti.AlgebraicGeometry
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})

namespace GerbeAutTransport

set_option backward.isDefEq.respectTransparency false

open Pseudofunctor.LocallyDiscreteOpToCat

variable {D : Type*} [Category D]

/-- Abelian inertia makes conjugation independent of the chosen object isomorphism. -/
theorem conjugation_independent {x y : D}
    (hcomm : ∀ a b : Aut x, a * b = b * a) (e e' : x ≅ y) :
    Aut.autMulEquivOfIso e = Aut.autMulEquivOfIso e' := by
  sorry

/-- The overlap equation uses arbitrary comparison isomorphisms, not a coherent choice. -/
theorem conjugates_commute {x₁ x₂ y₁ y₂ : D}
    (hcomm : ∀ a b : Aut x₁, a * b = b * a)
    (e₁ : x₁ ≅ y₁) (e₂ : x₂ ≅ y₂) (c : x₁ ≅ x₂) (d : y₁ ≅ y₂)
    (a₁ : Aut x₁) (a₂ : Aut x₂)
    (ha : a₁.hom ≫ c.hom = c.hom ≫ a₂.hom) :
    (Aut.autMulEquivOfIso e₁ a₁).hom ≫ d.hom =
      d.hom ≫ (Aut.autMulEquivOfIso e₂ a₂).hom := by
  sorry

variable {E : Type*} [Category E]

theorem map_conjugation (K : D ⥤ E) {x y : D} (e : x ≅ y) (a : Aut x) :
    K.mapAut y (Aut.autMulEquivOfIso e a) =
      Aut.autMulEquivOfIso (K.mapIso e) (K.mapAut x a) := by
  sorry

theorem map_conjugation_hom (K : D ⥤ E) {x y : D} (e : x ≅ y) (a : Aut x) :
    (Aut.autMulEquivOfIso (K.mapIso e) (K.mapAut x a)).hom =
      K.map (Aut.autMulEquivOfIso e a).hom := by
  sorry

variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))),
  ∀ a b : Aut z, a * b = b * a)

include hComm

set_option backward.isDefEq.respectTransparency.types false in
/-- Conjugation on an arbitrary covering family is a native descent automorphism. -/
noncomputable def conjugateDescentIso
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    {U : C} (R : Sieve U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    Aut ((F.toDescentData (fun i : R.arrows.category => i.obj.hom)).obj y) := by
  sorry

/-- Lift the specific local conjugates, using native full faithfulness of morphism descent. -/
noncomputable def conjugateCoverAut
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) : Aut y := by
  sorry

variable (J : GrothendieckTopology C) [F.IsPrestack J]

theorem conjugateCoverAut_map {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.map (conjugateCoverAut F hComm J R hR x y e a).hom =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

theorem conjugateCoverAut_mapIso {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
        (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

theorem conjugateCoverAut_unique {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (b : Aut y)
    (hb : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y b =
        Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)) :
    b = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverAut_independent {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e e' : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J R hR x y e' a := by
  sorry

/-- The descended conjugation is a group homomorphism, with its actual multiplication law. -/
noncomputable def conjugateCoverHom
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) : Aut x →* Aut y := by
  sorry

theorem conjugateCoverAut_of_iso {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) (d : x ≅ y) :
    conjugateCoverAut F hComm J R hR x y e a = Aut.autMulEquivOfIso d a := by
  sorry

variable {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)

theorem conjugateDescentIso_hom_apply (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

theorem conjugateDescentIso_one : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

theorem conjugateDescentIso_inv (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

theorem conjugateCoverHom_apply (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverHom_one : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

theorem conjugateCoverHom_mul (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

theorem conjugateCoverHom_inv (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateDescentTests.local: the prescribed component is recovered.
example (a : Aut x) (i : R.arrows.category) :
    (conjugateDescentIso F hComm R x y e a).hom.hom i =
      (Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)).hom := by
  sorry

-- GerbeConjugateDescentTests.identity: no spurious local arrow appears at the unit.
example : conjugateDescentIso F hComm R x y e 1 = 1 := by
  sorry

-- GerbeConjugateDescentTests.inverse: the actual inverse descent arrow is retained.
example (a : Aut x) :
    conjugateDescentIso F hComm R x y e a⁻¹ = (conjugateDescentIso F hComm R x y e a)⁻¹ := by
  sorry

-- GerbeConjugateCoverTests.local: full faithfulness recovers the actual local automorphism.
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y (conjugateCoverAut F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeConjugateCoverTests.unique: descent must reflect all components.
example (a : Aut x) (b : Aut y)
    (hb : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y b =
        Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a)) :
    b = conjugateCoverAut F hComm J R hR x y e a := by
  sorry

-- GerbeConjugateCoverTests.changeChoice: arbitrary local choices give the same result.
example (a : Aut x)
    (e' : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverAut F hComm J R hR x y e a = conjugateCoverAut F hComm J R hR x y e' a := by
  sorry

-- GerbeConjugateCoverTests.globalIso: compare with the existing Mathlib conjugation.
example (a : Aut x) (d : x ≅ y) :
    conjugateCoverAut F hComm J R hR x y e a = Aut.autMulEquivOfIso d a := by
  sorry

-- GerbeConjugateHomTests.identity: the group homomorphism preserves the unit.
example : conjugateCoverHom F hComm J R hR x y e 1 = 1 := by
  sorry

-- GerbeConjugateHomTests.product: multiplication order agrees with native Aut.
example (a b : Aut x) :
    conjugateCoverHom F hComm J R hR x y e (a * b) =
      conjugateCoverHom F hComm J R hR x y e a * conjugateCoverHom F hComm J R hR x y e b := by
  sorry

-- GerbeConjugateHomTests.inverse: the inverse law belongs to the actual group homomorphism.
example (a : Aut x) :
    conjugateCoverHom F hComm J R hR x y e a⁻¹ = (conjugateCoverHom F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeConjugateHomTests.equalObject: every choice of local x-to-x isomorphism fixes a.
example (a : Aut x)
    (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverHom F hComm J R hR x x e₀ a = a := by
  sorry

end GerbeAutTransport

end TauCeti.AlgebraicGeometry

/-! Cover-refinement continuation: fixed-base transport only.
The complete checked proof is archived in the handoff's immutable commit;
all suggested bodies below are admitted under PROTOCOL section13. -/
namespace TauCeti.AlgebraicGeometry.GerbeAutTransport
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))),
  ∀ a b : Aut z, a * b = b * a)
variable (J : GrothendieckTopology C) [F.IsPrestack J]
include hComm
theorem conjugateCoverAut_refinement {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U) (hRS : R ≤ S)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J S hS x y d a := by
  sorry

theorem conjugateCoverAut_cover_independent {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR x y e a =
      conjugateCoverAut F hComm J S hS x y d a := by
  sorry

theorem conjugateCoverAut_reverse {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) (a : Aut x) :
    conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm)
      (conjugateCoverAut F hComm J R hR x y e a) = a := by
  sorry

noncomputable def conjugateCoverEquiv
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    (J : GrothendieckTopology C) [F.IsPrestack J]
    {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) : Aut x ≃* Aut y := by
  sorry

theorem conjugateCoverEquiv_cover_independent {U : C} (R S : Sieve U)
    (hR : R ∈ J U) (hS : S ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverEquiv F hComm J R hR x y e =
      conjugateCoverEquiv F hComm J S hS x y d := by
  sorry

theorem conjugateCoverAut_comp {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y z : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj y ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj z)
    (c : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj z) (a : Aut x) :
    conjugateCoverAut F hComm J R hR y z d
      (conjugateCoverAut F hComm J R hR x y e a) =
    conjugateCoverAut F hComm J R hR x z c a := by
  sorry

variable {U : C} (R : Sieve U) (hR : R ∈ J U)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)

theorem conjugateCoverEquiv_apply (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a =
      conjugateCoverAut F hComm J R hR x y e a := by
  sorry

theorem conjugateCoverEquiv_symm_apply (b : Aut y) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm b =
      conjugateCoverAut F hComm J R hR y x (fun i => (e i).symm) b := by
  sorry

theorem conjugateCoverEquiv_mapIso (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

theorem conjugateCoverEquiv_of_iso (d : x ≅ y) :
    conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

theorem conjugateCoverEquiv_one : conjugateCoverEquiv F hComm J R hR x y e 1 = 1 := by
  sorry

theorem conjugateCoverEquiv_mul (a b : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e (a * b) =
      conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

theorem conjugateCoverEquiv_inv (a : Aut x) :
    conjugateCoverEquiv F hComm J R hR x y e a⁻¹ =
      (conjugateCoverEquiv F hComm J R hR x y e a)⁻¹ := by
  sorry

-- GerbeCoverEquivTests.equalObject: arbitrary local automorphisms induce the identity equivalence.
example (e₀ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj x) :
    conjugateCoverEquiv F hComm J R hR x x e₀ = MulEquiv.refl (Aut x) := by
  sorry

-- GerbeCoverEquivTests.roundTrip: the inverse must recover arbitrary source automorphisms.
example (a : Aut x) :
    (conjugateCoverEquiv F hComm J R hR x y e).symm
      (conjugateCoverEquiv F hComm J R hR x y e a) = a := by
  sorry

-- GerbeCoverEquivTests.targetRoundTrip: no target automorphism may be lost.
example (b : Aut y) :
    conjugateCoverEquiv F hComm J R hR x y e
      ((conjugateCoverEquiv F hComm J R hR x y e).symm b) = b := by
  sorry

-- GerbeCoverEquivTests.local: actual restrictions identify the equivalence with conjugation.
example (a : Aut x) (i : R.arrows.category) :
    (F.map i.obj.hom.op.toLoc).toFunctor.mapAut y
      (conjugateCoverEquiv F hComm J R hR x y e a) =
      Aut.autMulEquivOfIso (e i) ((F.map i.obj.hom.op.toLoc).toFunctor.mapAut x a) := by
  sorry

-- GerbeCoverEquivTests.globalIso: retain the labelled native Mathlib conjugation map.
example (d : x ≅ y) : conjugateCoverEquiv F hComm J R hR x y e = Aut.autMulEquivOfIso d := by
  sorry

-- GerbeCoverEquivTests.changeCover: compare whole maps on unrelated actual covering sieves.
example (S : Sieve U) (hS : S ∈ J U)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    conjugateCoverEquiv F hComm J R hR x y e = conjugateCoverEquiv F hComm J S hS x y d := by
  sorry

-- GerbeCoverEquivTests.product: multiplication is the existing native Aut multiplication.
example (a b : Aut x) : conjugateCoverEquiv F hComm J R hR x y e (a * b) =
    conjugateCoverEquiv F hComm J R hR x y e a * conjugateCoverEquiv F hComm J R hR x y e b := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeAutTransport

/-! Arbitrary-base conjugation and intrinsic-band lifting. All new public bodies are planning admissions. -/
namespace TauCeti.AlgebraicGeometry.GerbeAutTransport
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
variable (J : GrothendieckTopology C) [F.IsPrestack J]
set_option backward.isDefEq.respectTransparency false

/-- Native conjugation transport is compatible with every base arrow and unrelated covers. -/
theorem conjugateCoverAut_baseChange {U V : C} (f : V ⟶ U)
    (R : Sieve U) (hR : R ∈ J U) (S : Sieve V) (hS : S ∈ J V)
    (x y : F.obj (.mk (op U)))
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y)
    (d : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj y))
    (a : Aut x) :
    (F.map f.op.toLoc).toFunctor.mapAut y (conjugateCoverAut F hComm J R hR x y e a) =
      conjugateCoverAut F hComm J S hS
        ((F.map f.op.toLoc).toFunctor.obj x) ((F.map f.op.toLoc).toFunctor.obj y) d
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
/-- Descent respects independent source and target isomorphisms and independent covers. -/
theorem conjugateCoverAut_naturality
    {U : C} (R : Sieve U) (hR : R ∈ J U) (S : Sieve U) (hS : S ∈ J U)
    (x₁ x₂ y₁ y₂ : F.obj (.mk (op U)))
    (e₁ : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x₁ ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y₁)
    (e₂ : ∀ i : S.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj x₂ ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y₂)
    (c : x₁ ≅ x₂) (d : y₁ ≅ y₂) (a₁ : Aut x₁) (a₂ : Aut x₂)
    (ha : a₁.hom ≫ c.hom = c.hom ≫ a₂.hom) :
    (conjugateCoverAut F hComm J R hR x₁ y₁ e₁ a₁).hom ≫ d.hom =
      d.hom ≫ (conjugateCoverAut F hComm J S hS x₂ y₂ e₂ a₂).hom := by sorry

end TauCeti.AlgebraicGeometry.GerbeAutTransport

namespace TauCeti.AlgebraicGeometry.IntrinsicBandSections
open GerbeAutTransport Pseudofunctor.LocallyDiscreteOpToCat
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
set_option backward.isDefEq.respectTransparency false

/-- Extend one automorphism to the simultaneous compatible-centre section. -/
noncomputable def lift (J : GrothendieckTopology C) [IsGerbe F J]
    (hComm : ∀ (V : C) (z : F.obj (.mk (op V))), ∀ a b : Aut z, a * b = b * a)
    {U : C} (x : F.obj (.mk (op U))) :
    Aut x →* IntrinsicBandSection F U := by sorry
/-- Evaluation at the identity recovers the chosen automorphism via the native unit constraint. -/
theorem eval_lift {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    eval F (𝟙 U) x (lift F J hComm x a) = a := by sorry
theorem lift_one {U : C} (x : F.obj (.mk (op U))) :
    lift F J hComm x 1 = 1 := by sorry
theorem lift_mul {U : C} (x : F.obj (.mk (op U))) (a b : Aut x) :
    lift F J hComm x (a * b) = lift F J hComm x a * lift F J hComm x b := by sorry
theorem lift_inv {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    lift F J hComm x a⁻¹ = (lift F J hComm x a)⁻¹ := by sorry
/-- Recovery on any local isomorphism cover, independently of the construction's choices. -/
theorem lift_app {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Aut x) (y : F.obj (.mk (op V)))
    (R : Sieve V) (hR : R ∈ J V)
    (e : ∀ i : R.arrows.category,
      (F.map i.obj.hom.op.toLoc).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (F.map i.obj.hom.op.toLoc).toFunctor.obj y) :
    eval F f y (lift F J hComm x a) =
      conjugateCoverAut F hComm J R hR ((F.map f.op.toLoc).toFunctor.obj x) y e
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
theorem lift_globalIso {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U)))
    (a : Aut x) (y : F.obj (.mk (op V)))
    (d : (F.map f.op.toLoc).toFunctor.obj x ≅ y) :
    eval F f y (lift F J hComm x a) =
      Aut.autMulEquivOfIso d ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
/-- Restriction agrees with lifting the pulled automorphism, as whole sections. -/
theorem lift_restrict {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x) :
    restrict F f (lift F J hComm x a) =
      lift F J hComm ((F.map f.op.toLoc).toFunctor.obj x)
        ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
theorem lift_injective {U : C} (x : F.obj (.mk (op U))) :
    Function.Injective (lift F J hComm x) := by sorry
-- GerbeBandLiftTests.identity
example {U : C} (x : F.obj (.mk (op U))) : lift F J hComm x 1 = 1 := by sorry
-- GerbeBandLiftTests.nontrivial
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) (ha : a ≠ 1) :
    lift F J hComm x a ≠ 1 := by sorry
-- GerbeBandLiftTests.globalIso
example {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x)
    (y : F.obj (.mk (op V))) (d : (F.map f.op.toLoc).toFunctor.obj x ≅ y) :
    eval F f y (lift F J hComm x a) =
      Aut.autMulEquivOfIso d ((F.map f.op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.restrictionChain
example {U V W : C} (f : V ⟶ U) (g : W ⟶ V)
    (x : F.obj (.mk (op U))) (a : Aut x) :
    restrict F g (restrict F f (lift F J hComm x a)) =
      lift F J hComm ((F.map (g ≫ f).op.toLoc).toFunctor.obj x)
        ((F.map (g ≫ f).op.toLoc).toFunctor.mapAut x a) := by sorry
-- GerbeBandLiftTests.recovery
example {U : C} (x : F.obj (.mk (op U))) (a : Aut x) :
    eval F (𝟙 U) x (lift F J hComm x a) = a := by sorry
end TauCeti.AlgebraicGeometry.IntrinsicBandSections

/-! Chosen-band inverse continuation, Codex codex-J6LwjP. -/

namespace TauCeti.AlgebraicGeometry
variable {C : Type u} [Category.{v} C]
namespace IntrinsicBandSections
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

-- Recover a coefficient on any base carrying an actual gerbe object.
lemma fromBanding_surjective_of_object (U : C) (x : F.obj (.mk (op U))) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

-- Local nonemptiness supplies these coefficients; no global object is chosen.
noncomputable def localBandCoefficient (b : AbelianBanding F J A) {U : C} (R : Sieve U)
    (objects : ∀ ⦃V : C⦄ (f : V ⟶ U), R f → F.obj (.mk (op V)))
    (z : IntrinsicBandSection F U) :
    Presieve.FamilyOfElements (A.obj ⋙ forget AddCommGrpCat.{max u v u' v'}) R.arrows := by
  sorry

lemma localBandCoefficient_recovery {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    fromBanding F J A b V (Multiplicative.ofAdd
      (localBandCoefficient F J A b R objects z f hf)) = restrict F f z := by
  sorry

lemma localBandCoefficient_compatible {U : C} (R : Sieve U)
    (objects : ∀ ⦃V : C⦄ (f : V ⟶ U), R f → F.obj (.mk (op V)))
    (z : IntrinsicBandSection F U) :
    (localBandCoefficient F J A b R objects z).Compatible := by
  sorry

lemma fromBanding_surjective (U : C) :
    Function.Surjective (fromBanding F J A b U) := by
  sorry

end IntrinsicBandSections
end TauCeti.AlgebraicGeometry

namespace TauCeti.AlgebraicGeometry.IntrinsicBandSections
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

noncomputable def fromBandingEquiv (b : AbelianBanding F J A) (U : C) :
    Multiplicative (A.obj.obj (op U)) ≃* IntrinsicBandSection F U := by
  sorry

lemma fromBandingEquiv_apply (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    fromBandingEquiv F J A b U a = fromBanding F J A b U a := by
  sorry

lemma fromBandingEquiv_symm_restrict {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- All original choices of local objects give the same glued inverse.
lemma fromBandingEquiv_symm_local {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd =
      localBandCoefficient F J A b R objects z f hf := by
  sorry

-- LocalCoefficientTests.unit
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects 1 f hf = 0 := by
  sorry

-- LocalCoefficientTests.existing
example {U V : C} (R : Sieve U)
    (objects : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (a : Multiplicative (A.obj.obj (op U))) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects (fromBanding F J A b U a) f hf =
      A.obj.map f.op a.toAdd := by
  sorry

-- LocalCoefficientTests.choiceIndependent
example {U V : C} (R : Sieve U)
    (objects objects' : ∀ ⦃W : C⦄ (f : W ⟶ U), R f → F.obj (.mk (op W)))
    (z : IntrinsicBandSection F U) (f : V ⟶ U) (hf : R f) :
    localBandCoefficient F J A b R objects z f hf =
      localBandCoefficient F J A b R objects' z f hf := by
  sorry

-- BandInverseTests.unit
example (U : C) : (fromBandingEquiv F J A b U).symm 1 = 1 := by
  sorry

-- BandInverseTests.coefficientRoundTrip
example (U : C) (a : Multiplicative (A.obj.obj (op U))) :
    (fromBandingEquiv F J A b U).symm (fromBanding F J A b U a) = a := by
  sorry

-- BandInverseTests.sectionRoundTrip
example (U : C) (z : IntrinsicBandSection F U) :
    fromBanding F J A b U ((fromBandingEquiv F J A b U).symm z) = z := by
  sorry

-- BandInverseTests.inverse
example (U : C) (z : IntrinsicBandSection F U) :
    (fromBandingEquiv F J A b U).symm z⁻¹ = ((fromBandingEquiv F J A b U).symm z)⁻¹ := by
  sorry

-- BandInverseTests.restriction
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    Multiplicative.ofAdd (A.obj.map f.op ((fromBandingEquiv F J A b U).symm z).toAdd) =
      (fromBandingEquiv F J A b V).symm (restrict F f z) := by
  sorry

-- BandInverseTests.nontrivial
example (U : C) (z : IntrinsicBandSection F U) (hz : z ≠ 1) :
    (fromBandingEquiv F J A b U).symm z ≠ 1 := by
  sorry

end TauCeti.AlgebraicGeometry.IntrinsicBandSections

/-! Chosen-band sheaf comparison continuation, Codex codex-a71f92. -/
namespace TauCeti.AlgebraicGeometry.IntrinsicBandSections
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)

noncomputable def fromBandingPresheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A) :
    A.obj ≅ presheaf F := by sorry

lemma fromBandingPresheafIso_hom :
    (fromBandingPresheafIso F J A b).hom = fromBandingPresheaf F J A b := by sorry

lemma fromBandingPresheafIso_hom_app (U : C) (a : A.obj.obj (op U)) :
    (((fromBandingPresheafIso F J A b).hom.app (op U)) a).toMul =
      fromBanding F J A b U (Multiplicative.ofAdd a) := by sorry

lemma fromBandingPresheafIso_inv_app (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z) =
      ((fromBandingEquiv F J A b U).symm z).toAdd := by sorry

lemma fromBandingPresheafIso_inv_naturality {U V : C} (f : V ⟶ U)
    (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

variable (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F)

noncomputable def fromBandingSheafIso
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
    (J : GrothendieckTopology C) [IsGerbe F J]
    (A : Sheaf J AddCommGrpCat.{max u v u' v'}) (b : AbelianBanding F J A)
    (S : Sheaf J AddCommGrpCat.{max u v u' v'}) (hS : S.obj = presheaf F) :
    A ≅ S := by sorry

lemma fromBandingSheafIso_hom :
    (fromBandingSheafIso F J A b S hS).hom.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).hom := by sorry

lemma fromBandingSheafIso_inv :
    (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b ≪≫ eqToIso hS.symm).inv := by sorry

lemma fromBandingSheafIso_hom_transport :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

lemma fromBandingSheafIso_inv_transport :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

lemma fromBandingSheafIso_unique (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

-- BandPresheafIsoTests.zero
example (U : C) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) 0 = 0 := by sorry

-- BandPresheafIsoTests.coefficientRoundTrip
example (U : C) (a : A.obj.obj (op U)) :
    ((fromBandingPresheafIso F J A b).inv.app (op U))
      (((fromBandingPresheafIso F J A b).hom.app (op U)) a) = a := by sorry

-- BandPresheafIsoTests.sectionRoundTrip
example (U : C) (z : IntrinsicBandSection F U) :
    ((fromBandingPresheafIso F J A b).hom.app (op U))
      (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      Additive.ofMul z := by sorry

-- BandPresheafIsoTests.restriction
example {U V : C} (f : V ⟶ U) (z : IntrinsicBandSection F U) :
    A.obj.map f.op (((fromBandingPresheafIso F J A b).inv.app (op U)) (Additive.ofMul z)) =
      ((fromBandingPresheafIso F J A b).inv.app (op V)) (Additive.ofMul (restrict F f z)) := by sorry

-- BandPresheafIsoTests.nonzero
example (U : C) (a : A.obj.obj (op U)) (ha : a ≠ 0) :
    ((fromBandingPresheafIso F J A b).hom.app (op U)) a ≠ 0 := by sorry

-- BandSheafIsoTests.forward
example :
    (fromBandingSheafIso F J A b S hS).hom.hom ≫ eqToHom hS =
      fromBandingPresheaf F J A b := by sorry

-- BandSheafIsoTests.backward
example :
    eqToHom hS.symm ≫ (fromBandingSheafIso F J A b S hS).inv.hom =
      (fromBandingPresheafIso F J A b).inv := by sorry

-- BandSheafIsoTests.coefficientRoundTrip
example :
    (fromBandingSheafIso F J A b S hS).hom ≫ (fromBandingSheafIso F J A b S hS).inv = 𝟙 A := by sorry

-- BandSheafIsoTests.sectionRoundTrip
example :
    (fromBandingSheafIso F J A b S hS).inv ≫ (fromBandingSheafIso F J A b S hS).hom = 𝟙 S := by sorry

-- BandSheafIsoTests.bandDeterminesComparison
example (e : A ≅ S)
    (he : ∀ (U V : C) (f : V ⟶ U) (x : F.obj (.mk (op V)))
      (a : A.obj.obj (op U)),
      eval F f x (((e.hom.hom ≫ eqToHom hS).app (op U)) a).toMul =
        b.autEquiv V x (Multiplicative.ofAdd (A.obj.map f.op a))) :
    e = fromBandingSheafIso F J A b S hS := by sorry

end TauCeti.AlgebraicGeometry.IntrinsicBandSections

/-! Constant point-site intrinsic-band fixtures. Native carrier aliases only; all new mathematical bodies are admissions under PROTOCOL section 13. -/

namespace TauCeti.AlgebraicGeometry.BandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
universe fixture_u fixture_v
variable (C : Type u) [Category.{v} C]
variable (D : Type fixture_u) [Category.{fixture_v} D]

abbrev constantDiagram : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{fixture_v, fixture_u} :=
  ((Functor.const Cᵒᵖ).obj (Cat.of D)).toPseudofunctor'

noncomputable def constantSection (U : C) (z : (CatCenter D)ˣ) :
    IntrinsicBandSection (constantDiagram C D) U := by sorry

lemma constantSection_val (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

noncomputable def constantSectionsEquiv (U : C) :
    (CatCenter D)ˣ ≃* IntrinsicBandSection (constantDiagram C D) U := by sorry

lemma constantSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

variable (I : Type fixture_u) (G : Type fixture_v) [CommGroup G]

abbrev Fibre := Discrete I × SingleObj G

def componentCenter (a : I → G) : CatCenter (Fibre I G) := by sorry

def componentCenterUnit (a : I → G) : (CatCenter (Fibre I G))ˣ := by sorry

def componentCenterEquiv : (I → G) ≃* (CatCenter (Fibre I G))ˣ := by sorry

noncomputable def componentSectionsEquiv (U : C) :
    (I → G) ≃* IntrinsicBandSection (constantDiagram C (Fibre I G)) U := by sorry

lemma componentSectionsEquiv_eval {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

lemma componentSectionsEquiv_restrict {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

lemma component_eval_bijective [Subsingleton I] (U : C) (i : I) :
    Function.Bijective (eval (constantDiagram C (Fibre I G)) (𝟙 U)
      (Discrete.mk i, SingleObj.star G)) := by sorry

lemma component_eval_not_injective (U : C) (g : G) (hg : g ≠ 1) :
    ¬ Function.Injective (eval (constantDiagram C (Fibre Bool G)) (𝟙 U)
      (Discrete.mk false, SingleObj.star G)) := by sorry

lemma fibre_no_cross_iso :
    ¬ Nonempty (((Discrete.mk false, SingleObj.star G) : Fibre Bool G) ≅
      (Discrete.mk true, SingleObj.star G)) := by sorry

lemma constant_two_components_not_gerbe (U : C) :
    ¬ IsGerbe (constantDiagram C (Fibre Bool G)) (⊥ : GrothendieckTopology C) := by sorry

set_option backward.isDefEq.respectTransparency false in
lemma point_isStack :
    (constantDiagram (Discrete PUnit) (Fibre I G)).IsStack ⊥ := by sorry

lemma point_connected_gerbe :
    IsGerbe (constantDiagram (Discrete PUnit) (Fibre PUnit G)) ⊥ := by sorry

-- BandPointTests.stack
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))).IsStack ⊥ := by sorry

-- BandPointTests.gerbe
example : IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3)))) ⊥ := by sorry

lemma constantSection_restrict {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSection C D U z) =
      constantSection C D V z := by sorry

lemma constantSectionsEquiv_apply (U : C) (z : (CatCenter D)ˣ) :
    constantSectionsEquiv C D U z = constantSection C D U z := by sorry

lemma constantSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C D) U) :
    (constantSectionsEquiv C D U).symm s = val (constantDiagram C D) s U (𝟙 U) := by sorry

lemma componentCenter_app (a : I → G) (x : Fibre I G) :
    (componentCenter I G a).app x = (𝟙 x.1, a x.1.as) := by sorry

lemma componentCenter_naturality (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

lemma componentCenterUnit_val (a : I → G) :
    (componentCenterUnit I G a).val = componentCenter I G a := by sorry

lemma componentCenterUnit_inv (a : I → G) :
    (componentCenterUnit I G a).inv = componentCenter I G (fun i => (a i)⁻¹) := by sorry

lemma componentCenterEquiv_apply (a : I → G) :
    componentCenterEquiv I G a = componentCenterUnit I G a := by sorry

lemma componentCenterEquiv_symm_apply (z : (CatCenter (Fibre I G))ˣ) (i : I) :
    (componentCenterEquiv I G).symm z i =
      (z.val.app (Discrete.mk i, SingleObj.star G)).2 := by sorry

lemma componentSectionsEquiv_symm_apply (U : C)
    (s : IntrinsicBandSection (constantDiagram C (Fibre I G)) U) (i : I) :
    (componentSectionsEquiv C I G U).symm s i =
      ((val (constantDiagram C (Fibre I G)) s U (𝟙 U)).val.app
        (Discrete.mk i, SingleObj.star G)).2 := by sorry

-- BandPointTests.generator
example : (eval
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
    (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)
    (componentSectionsEquiv (Discrete PUnit) PUnit (Multiplicative (ZMod 3))
      (Discrete.mk PUnit.unit) (fun _ => Multiplicative.ofAdd (1 : ZMod 3)))).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- BandPointTests.trivialDiscreteTwoObjects
example : (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))).IsStack ⊥ ∧
    ¬ IsGerbe (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 1)))) ⊥ := by sorry

-- BandPointTests.disconnectedWitness
example : ∃ s : IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit), s ≠ 1 ∧
    eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _) s =
        Iso.refl ((Discrete.mk false, SingleObj.star _) : Fibre Bool (Multiplicative (ZMod 3))) := by sorry

-- ConstantCentreTests.one
example (U : C) : constantSection C D U 1 = 1 := by sorry

-- ConstantCentreTests.multiply
example (U : C) (z t : (CatCenter D)ˣ) :
    constantSection C D U (z * t) = constantSection C D U z * constantSection C D U t := by sorry

-- ConstantCentreTests.allArrows
example (U V : C) (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    val (constantDiagram C D) (constantSection C D U z) V f = z := by sorry

-- ConstantEquivTests.centreRoundTrip
example (U : C) (z : (CatCenter D)ˣ) :
    (constantSectionsEquiv C D U).symm (constantSectionsEquiv C D U z) = z := by sorry

-- ConstantEquivTests.sectionRoundTrip
example (U : C) (s : IntrinsicBandSection (constantDiagram C D) U) :
    constantSectionsEquiv C D U ((constantSectionsEquiv C D U).symm s) = s := by sorry

-- ConstantEquivTests.restriction
example {U V : C} (f : V ⟶ U) (z : (CatCenter D)ˣ) :
    restrict (constantDiagram C D) f (constantSectionsEquiv C D U z) =
      constantSectionsEquiv C D V z := by sorry

-- ComponentCentreTests.component
example (a : I → G) (i : I) :
    (componentCenter I G a).app (Discrete.mk i, SingleObj.star G) = (𝟙 _, a i) := by sorry

-- ComponentCentreTests.unit
example (i : I) : (componentCenter I G 1).app (Discrete.mk i, SingleObj.star G) = 𝟙 _ := by sorry

-- ComponentCentreTests.naturality
example (a : I → G) {x y : Fibre I G} (f : x ⟶ y) :
    f ≫ (componentCenter I G a).app y = (componentCenter I G a).app x ≫ f := by sorry

-- ComponentUnitTests.value
example (a : I → G) : (componentCenterUnit I G a).val = componentCenter I G a := by sorry

-- ComponentUnitTests.inverse
example (a : I → G) : (componentCenterUnit I G a).inv =
    componentCenter I G (fun i => (a i)⁻¹) := by sorry

-- ComponentUnitTests.roundTrip
example (a : I → G) : (componentCenterUnit I G a).val *
    (componentCenterUnit I G a).inv = 1 := by sorry

-- ComponentEquivTests.coefficientRoundTrip
example (a : I → G) : (componentCenterEquiv I G).symm (componentCenterEquiv I G a) = a := by sorry

-- ComponentEquivTests.centreRoundTrip
example (z : (CatCenter (Fibre I G))ˣ) :
    componentCenterEquiv I G ((componentCenterEquiv I G).symm z) = z := by sorry

-- ComponentEquivTests.inertiaCoordinates
example (a : I → G) (i : I) :
    ((componentCenterEquiv I G a).val.app (Discrete.mk i, SingleObj.star G)).2 = a i := by sorry

-- ComponentSectionTests.evaluation
example {U V : C} (f : V ⟶ U) (a : I → G) (i : I) :
    (eval (constantDiagram C (Fibre I G)) f (Discrete.mk i, SingleObj.star G)
      (componentSectionsEquiv C I G U a)).hom.2 = a i := by sorry

-- ComponentSectionTests.restriction
example {U V : C} (f : V ⟶ U) (a : I → G) :
    restrict (constantDiagram C (Fibre I G)) f (componentSectionsEquiv C I G U a) =
      componentSectionsEquiv C I G V a := by sorry

-- ComponentSectionTests.roundTrip
example (U : C) (a : I → G) :
    (componentSectionsEquiv C I G U).symm (componentSectionsEquiv C I G U a) = a := by sorry

-- BandPointTests.connected
example : Function.Bijective
    (eval (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- BandPointTests.disconnected
example : ¬ Function.Injective
    (eval (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Discrete.mk false, SingleObj.star _)) := by sorry

-- BandPointTests.notGerbe
example : ¬ IsGerbe
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- BandPointTests.connectedCardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- BandPointTests.disconnectedCardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 9 := by sorry

-- BandPointTests.terminalFibre
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (Fibre PUnit (Multiplicative (ZMod 1))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

end TauCeti.AlgebraicGeometry.BandFixtures

/-! Connected groupoid and nonabelian inertia acceptance fixtures. -/

namespace TauCeti.AlgebraicGeometry.ConnectedBandFixtures

open CategoryTheory Opposite Bicategory BandFixtures IntrinsicBandSections

set_option backward.isDefEq.respectTransparency false

universe conn_u conn_v
variable (C : Type u) [Category.{v} C]
variable (I : Type conn_u) (G : Type conn_v) [Group G]

abbrev ConnectedFibre := Codiscrete I × SingleObj G

def connectedCenter (a : Subgroup.center G) : CatCenter (ConnectedFibre I G) := by sorry

def connectedCenterUnit (a : Subgroup.center G) : (CatCenter (ConnectedFibre I G))ˣ := by sorry

def connectedCenterEquiv (i : I) :
    Subgroup.center G ≃* (CatCenter (ConnectedFibre I G))ˣ := by sorry

noncomputable def connectedSectionsEquiv (i : I) (U : C) :
    Subgroup.center G ≃* IntrinsicBandSection
      (constantDiagram C (ConnectedFibre I G)) U := by sorry

lemma connectedSectionsEquiv_eval (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (eval (constantDiagram C (ConnectedFibre I G)) f x
      (connectedSectionsEquiv C I G i U a)).hom.2 = a.val := by sorry

lemma connectedSectionsEquiv_restrict (i : I) {U V : C} (f : V ⟶ U)
    (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
      connectedSectionsEquiv C I G i V a := by sorry

lemma connected_eval_injective (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Injective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) := by sorry

lemma connected_eval_image (i : I) (U : C) (x : ConnectedFibre I G) (e : Aut x) :
    (∃ s, eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x s = e) ↔
      e.hom.2 ∈ Subgroup.center G := by sorry

def connectedAut (x : ConnectedFibre I G) (g : G) : Aut x := by sorry

lemma connected_eval_surjective_iff (i : I) (U : C) (x : ConnectedFibre I G) :
    Function.Surjective (eval (constantDiagram C (ConnectedFibre I G)) (𝟙 U) x) ↔
      Subgroup.center G = ⊤ := by sorry

def connectedIso (x y : ConnectedFibre I G) : x ≅ y := by sorry

set_option backward.isDefEq.respectTransparency false in
lemma point_stack (D : Type*) [Category D] :
    (constantDiagram (Discrete PUnit) D).IsStack ⊥ := by sorry

lemma connected_point_gerbe (i : I) :
    IsGerbe (constantDiagram (Discrete PUnit) (ConnectedFibre I G)) ⊥ := by sorry

-- ConnectedBandTests.twoObjectGerbe
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre Bool (Multiplicative (ZMod 3)))) ⊥ := by sorry

-- ConnectedBandTests.distinctIsomorphic
example : let x : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk false, SingleObj.star _)
    let y : ConnectedFibre Bool (Multiplicative (ZMod 3)) :=
      (Codiscrete.mk true, SingleObj.star _)
    x ≠ y ∧ Nonempty (x ≅ y) := by sorry

-- ConnectedBandTests.cardinality
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (Discrete.mk PUnit.unit)) = 3 := by sorry

-- ConnectedBandTests.bijectiveEvaluation
example (x : ConnectedFibre Bool (Multiplicative (ZMod 3))) :
    Function.Bijective (eval
      (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
        (𝟙 (Discrete.mk PUnit.unit)) x) := by sorry

-- NonabelianBandTests.gerbe
example : IsGerbe (constantDiagram (Discrete PUnit)
    (ConnectedFibre PUnit (Equiv.Perm (Fin 3)))) ⊥ := by sorry

-- NonabelianBandTests.oneSection
example : Nat.card (IntrinsicBandSection
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (Discrete.mk PUnit.unit)) = 1 := by sorry

-- NonabelianBandTests.notSurjective
example : ¬ Function.Surjective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

lemma connectedCenter_app (a : Subgroup.center G) (x : ConnectedFibre I G) :
    (connectedCenter I G a).app x = (𝟙 x.1, a.val) := by sorry

lemma connectedCenter_naturality (a : Subgroup.center G)
    {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

lemma connectedCenterUnit_val (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

lemma connectedCenterUnit_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

lemma connectedCenterEquiv_apply (i : I) (a : Subgroup.center G) :
    connectedCenterEquiv I G i a = connectedCenterUnit I G a := by sorry

lemma connectedCenterEquiv_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    ((connectedCenterEquiv I G i).symm z).val =
      (z.val.app (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

lemma connectedSectionsEquiv_symm_apply (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    ((connectedSectionsEquiv C I G i U).symm s).val =
      ((val (constantDiagram C (ConnectedFibre I G)) s U (𝟙 U)).val.app
        (Codiscrete.mk i, SingleObj.star G)).2 := by sorry

lemma connectedAut_hom (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).hom = (𝟙 x.1, g) := by sorry

lemma connectedAut_inv (x : ConnectedFibre I G) (g : G) :
    (connectedAut I G x g).inv = (𝟙 x.1, g⁻¹) := by sorry

lemma connectedIso_fst (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom := by sorry

lemma connectedIso_snd (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedCenterTests.value
example (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenter I G a).app x).2 = a.val := by sorry

-- ConnectedCenterTests.naturality
example (a : Subgroup.center G) {x y : ConnectedFibre I G} (f : x ⟶ y) :
    f ≫ (connectedCenter I G a).app y = (connectedCenter I G a).app x ≫ f := by sorry

-- ConnectedCenterTests.identity
example (x : ConnectedFibre I G) : (connectedCenter I G 1).app x = 𝟙 x := by sorry

-- ConnectedUnitTests.value
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val = connectedCenter I G a := by sorry

-- ConnectedUnitTests.inverse
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).inv = connectedCenter I G a⁻¹ := by sorry

-- ConnectedUnitTests.roundTrip
example (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

-- ConnectedEquivTests.coefficientRoundTrip
example (i : I) (a : Subgroup.center G) :
    (connectedCenterEquiv I G i).symm (connectedCenterEquiv I G i a) = a := by sorry

-- ConnectedEquivTests.centreRoundTrip
example (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

-- ConnectedEquivTests.everyObject
example (i : I) (a : Subgroup.center G) (x : ConnectedFibre I G) :
    ((connectedCenterEquiv I G i a).val.app x).2 = a.val := by sorry

-- ConnectedSectionTests.roundTrip
example (i : I) (U : C)
    (s : IntrinsicBandSection (constantDiagram C (ConnectedFibre I G)) U) :
    connectedSectionsEquiv C I G i U ((connectedSectionsEquiv C I G i U).symm s) = s := by sorry

-- ConnectedSectionTests.restriction
example (i : I) {U V : C} (f : V ⟶ U) (a : Subgroup.center G) :
    restrict (constantDiagram C (ConnectedFibre I G)) f
      (connectedSectionsEquiv C I G i U a) =
        connectedSectionsEquiv C I G i V a := by sorry

-- ConnectedSectionTests.generatorBothObjects
example : let a : Subgroup.center (Multiplicative (ZMod 3)) :=
      ⟨Multiplicative.ofAdd 1, by rw [CommGroup.center_eq_top]; trivial⟩
    let s := connectedSectionsEquiv (Discrete PUnit) Bool (Multiplicative (ZMod 3))
      false (Discrete.mk PUnit.unit) a
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk false, SingleObj.star _) s).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) ∧
    (eval (constantDiagram (Discrete PUnit) (ConnectedFibre Bool (Multiplicative (ZMod 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk true, SingleObj.star _) s).hom.2 =
        Multiplicative.ofAdd (1 : ZMod 3) := by sorry

-- ConnectedAutTests.hom
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).hom.2 = g := by sorry

-- ConnectedAutTests.inverse
example (x : ConnectedFibre I G) (g : G) : (connectedAut I G x g).inv.2 = g⁻¹ := by sorry

-- ConnectedAutTests.multiplication
example (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

-- ConnectedIsoTests.projections
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom.1 = (Codiscrete.iso x.1 y.1).hom ∧
    (connectedIso I G x y).hom.2 = (eqToIso (Subsingleton.elim x.2 y.2)).hom := by sorry

-- ConnectedIsoTests.roundTrip
example (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

-- NonabelianBandTests.injective
example : Function.Injective (eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _)) := by sorry

-- NonabelianBandTests.transpositionNotAttained
example : ¬ ∃ s, eval
    (constantDiagram (Discrete PUnit) (ConnectedFibre PUnit (Equiv.Perm (Fin 3))))
      (𝟙 (Discrete.mk PUnit.unit)) (Codiscrete.mk PUnit.unit, SingleObj.star _) s =
        connectedAut PUnit (Equiv.Perm (Fin 3))
          (Codiscrete.mk PUnit.unit, SingleObj.star _) (Equiv.swap 0 1) := by sorry

-- NonabelianBandTests.oneObject
example : Subsingleton (ConnectedFibre PUnit (Equiv.Perm (Fin 3))) := by sorry

-- ConnectedBandTests.emptyFibreStack
example : (constantDiagram (Discrete PUnit) (Discrete Empty)).IsStack ⊥ := by sorry

lemma connectedCenter_one : connectedCenter I G 1 = 1 := by sorry

lemma connectedCenterUnit_val_inv (a : Subgroup.center G) :
    (connectedCenterUnit I G a).val * (connectedCenterUnit I G a).inv = 1 := by sorry

lemma connectedCenterEquiv_apply_symm_apply (i : I) (z : (CatCenter (ConnectedFibre I G))ˣ) :
    connectedCenterEquiv I G i ((connectedCenterEquiv I G i).symm z) = z := by sorry

lemma connectedAut_mul (x : ConnectedFibre I G) (g h : G) :
    connectedAut I G x (g * h) = connectedAut I G x g * connectedAut I G x h := by sorry

lemma connectedIso_hom_inv_id (x y : ConnectedFibre I G) :
    (connectedIso I G x y).hom ≫ (connectedIso I G x y).inv = 𝟙 x := by sorry

end TauCeti.AlgebraicGeometry.ConnectedBandFixtures

/-! Nonconstant restriction-band continuation. The actual diagram and bottom-topology sheaf wrappers use built primitives; all other new mathematical declarations remain planning admissions. The checked proof archive is recorded in the handoff. No stage or general gerbe key closes. -/

namespace TauCeti.AlgebraicGeometry.RestrictionBandFixtures
open CategoryTheory Opposite Bicategory
open IntrinsicBandSections
universe chain_u chain_v chain_w
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]

abbrev groupDiagram (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{chain_w, 0} :=
  (P ⋙ forget₂ CommGrpCat GrpCat ⋙ forget₂ GrpCat MonCat ⋙ MonCat.toCat).toPseudofunctor'

lemma groupMapId_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapId (.mk (op U))).hom.toNatTrans.app x =
      (1 : P.obj (op U)) := by sorry

lemma groupMapComp_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp f.op.toLoc g.op.toLoc).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

lemma groupMapComp'_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).hom.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

lemma groupMapComp'_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (fg : W ⟶ U) (h : g ≫ f = fg)
    (x : SingleObj (P.obj (op U))) :
    ((groupDiagram P).mapComp' f.op.toLoc g.op.toLoc fg.op.toLoc (by rw [← h]; rfl)).inv.toNatTrans.app x =
      (1 : P.obj (op W)) := by sorry

lemma groupOfObj_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {ι : Type*} {U : C} {X : ι → C} (f : ∀ i, X i ⟶ U)
    (x : (groupDiagram P).obj (.mk (op U))) {Y : C} (q : Y ⟶ U) {i j : ι}
    (f₁ : Y ⟶ X i) (f₂ : Y ⟶ X j) (h₁ : f₁ ≫ f i = q) (h₂ : f₂ ≫ f j = q) :
    (Pseudofunctor.DescentData.ofObj (F := groupDiagram P) (f := f) x).hom q f₁ f₂ h₁ h₂ =
      (1 : P.obj (op Y)) := by sorry

lemma groupPullHom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V W Y : C} {x : (groupDiagram P).obj (.mk (op U))}
    {y : (groupDiagram P).obj (.mk (op V))}
    (f : Y ⟶ U) (g : Y ⟶ V)
    (a : ((groupDiagram P).map f.op.toLoc).toFunctor.obj x ⟶
      ((groupDiagram P).map g.op.toLoc).toFunctor.obj y)
    (h : W ⟶ Y) (hf : W ⟶ U) (hg : W ⟶ V)
    (whf : h ≫ f = hf) (whg : h ≫ g = hg) :
    Pseudofunctor.LocallyDiscreteOpToCat.pullHom a h hf hg = (P.map h.op) a := by sorry

def groupIso (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) : x ≅ y := by sorry

lemma groupDiagram_stack (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupDiagram P).IsStack (⊥ : GrothendieckTopology C) := by sorry

lemma groupDiagram_gerbe (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    IsGerbe (groupDiagram P) (⊥ : GrothendieckTopology C) := by sorry

variable {G : Type chain_w} [CommGroup G]

def singleCenter (g : G) : CatCenter (SingleObj G) := by sorry

def singleCenterUnit (g : G) : (CatCenter (SingleObj G))ˣ := by sorry

lemma singleCenterUnit_app (g : G) (x : SingleObj G) :
    (singleCenterUnit g).val.app x = g := by sorry

noncomputable def groupSection (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    (U : C) (g : P.obj (op U)) : IntrinsicBandSection (groupDiagram P) U := by sorry

lemma groupSection_eval (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    (eval (groupDiagram P) f (SingleObj.star (P.obj (op V)))
      (groupSection P U g)).hom = (P.map f.op) g := by sorry

noncomputable def groupSectionsEquiv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    P.obj (op U) ≃* IntrinsicBandSection (groupDiagram P) U := by sorry

lemma groupSectionsEquiv_restrict (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w})
    {U V : C} (f : V ⟶ U) (g : P.obj (op U)) :
    restrict (groupDiagram P) f (groupSectionsEquiv P U g) =
      groupSectionsEquiv P V ((P.map f.op) g) := by sorry

variable {B : Type} [SmallCategory B]

noncomputable def groupSectionsPresheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    P ⋙ CommGrpCat.toAddCommGrp ≅ IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

noncomputable def groupBandSheaf (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w} :=
  ⟨IntrinsicBandSections.presheaf (groupDiagram P), Presheaf.isSheaf_bot _⟩

lemma groupBandSheaf_obj (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheaf P).obj = IntrinsicBandSections.presheaf (groupDiagram P) := by sorry

noncomputable def groupBandSheafIso (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (⟨P ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology B) AddCommGrpCat.{chain_w}) ≅ groupBandSheaf P := by sorry

abbrev reduction : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAddMonoidHom.toMultiplicative

abbrev chainGroups : Fin 3 ⥤ CommGrpCat :=
  ComposableArrows.mk₂ (CommGrpCat.ofHom reduction)
    (𝟙 (CommGrpCat.of (Multiplicative (ZMod 2))))

abbrev ChainSite := (Fin 3)ᵒᵖ
abbrev chainPresheaf : ChainSiteᵒᵖ ⥤ CommGrpCat := unopUnop (Fin 3) ⋙ chainGroups
abbrev chainF := groupDiagram chainPresheaf
abbrev U₀ : ChainSite := op (0 : Fin 3)
abbrev U₁ : ChainSite := op (1 : Fin 3)
abbrev U₂ : ChainSite := op (2 : Fin 3)
abbrev f₀₁ : U₁ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 1 by decide)).op
abbrev f₁₂ : U₂ ⟶ U₁ := (homOfLE (show (1 : Fin 3) ≤ 2 by decide)).op
abbrev f₀₂ : U₂ ⟶ U₀ := (homOfLE (show (0 : Fin 3) ≤ 2 by decide)).op

lemma chain_generator_restrict :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4))) =
      groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2)) := by sorry

lemma chain_generator_comp :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

lemma chain_two_killed :
    restrict chainF f₀₁ (groupSectionsEquiv chainPresheaf U₀
      (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

lemma chain_restrict_not_injective : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

abbrev TwoChainSite := (Fin 3 ⊕ Fin 3)ᵒᵖ
abbrev twoChainPresheaf : TwoChainSiteᵒᵖ ⥤ CommGrpCat :=
  unopUnop (Fin 3 ⊕ Fin 3) ⋙ chainGroups.sum' chainGroups
abbrev twoChainF := groupDiagram twoChainPresheaf

lemma twoChains_no_terminal (U : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal U) := by sorry

lemma twoChains_sections_equiv (U : TwoChainSite) :
    Nonempty (twoChainPresheaf.obj (op U) ≃* IntrinsicBandSection twoChainF U) := by sorry

lemma groupIso_hom (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).hom = g := by sorry

lemma groupIso_inv (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (x y : (groupDiagram P).obj (.mk (op U))) (g : P.obj (op U)) :
    (groupIso P U x y g).inv = g⁻¹ := by sorry

lemma singleCenter_app (g : G) (x : SingleObj G) : (singleCenter g).app x = g := by sorry

lemma singleCenter_mul (g h : G) : singleCenter (g * h) = singleCenter g * singleCenter h := by sorry

lemma singleCenterUnit_mul (g h : G) :
    singleCenterUnit (g * h) = singleCenterUnit g * singleCenterUnit h := by sorry

lemma groupSection_one (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C) :
    groupSection P U 1 = 1 := by sorry

lemma groupSection_mul (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (g h : P.obj (op U)) : groupSection P U (g * h) = groupSection P U g * groupSection P U h := by sorry

lemma groupSectionsEquiv_symm_apply (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)
    (s : IntrinsicBandSection (groupDiagram P) U) :
    (groupSectionsEquiv P U).symm s =
      (val (groupDiagram P) s U (𝟙 U)).val.app (SingleObj.star (P.obj (op U))) := by sorry

lemma groupSectionsPresheafIso_hom_app (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : Bᵒᵖ)
    (g : Additive (P.obj U)) :
    (groupSectionsPresheafIso P).hom.app U g = Additive.ofMul
      (groupSectionsEquiv P U.unop g.toMul) := by sorry

lemma groupBandSheafIso_hom (P : Bᵒᵖ ⥤ CommGrpCat.{chain_w}) :
    (groupBandSheafIso P).hom.hom = (groupSectionsPresheafIso P).hom := by sorry

lemma chain_stack : chainF.IsStack (⊥ : GrothendieckTopology ChainSite) := by sorry

lemma chain_gerbe : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

lemma twoChains_stack : twoChainF.IsStack (⊥ : GrothendieckTopology TwoChainSite) := by sorry

lemma twoChains_gerbe : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

lemma chain_source_card : Nat.card (IntrinsicBandSection chainF U₀) = 4 := by sorry

lemma chain_target_card : Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

end TauCeti.AlgebraicGeometry.RestrictionBandFixtures

namespace TauCeti.AlgebraicGeometry.RestrictionBandFixtures.RestrictionBandTests
open CategoryTheory Opposite Bicategory IntrinsicBandSections
universe chain_u chain_v chain_w
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type chain_u} [Category.{chain_v} C]
variable (P : Cᵒᵖ ⥤ CommGrpCat.{chain_w}) (U : C)

-- RestrictionBandTests.isoUnit
example (x y : (groupDiagram P).obj (.mk (op U))) :
    (groupIso P U x y 1).hom ≫ (groupIso P U x y 1).inv = 𝟙 x := by sorry

-- RestrictionBandTests.isoInverseQuarter
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).inv = Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.isoQuarterRoundTrip
example :
    (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
      (Multiplicative.ofAdd (1 : ZMod 4))).hom ≫
      (groupIso chainPresheaf U₀ (SingleObj.star (Multiplicative (ZMod 4))) (SingleObj.star (Multiplicative (ZMod 4)))
        (Multiplicative.ofAdd (1 : ZMod 4))).inv = 𝟙 (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerNaturality
example (a : Multiplicative (ZMod 4)) :
    (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) ≫
        (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) =
      (a : SingleObj.star (Multiplicative (ZMod 4)) ⟶ SingleObj.star (Multiplicative (ZMod 4))) ≫
        (singleCenter (Multiplicative.ofAdd (1 : ZMod 4))).app (SingleObj.star (Multiplicative (ZMod 4))) := by sorry

-- RestrictionBandTests.centerDoubleGenerator
example :
    singleCenter (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenter (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.centerUnitOrderFour
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))) ^ 4 = 1 := by sorry

-- RestrictionBandTests.unitInverseCoefficient
example :
    (singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4))).inv.app (SingleObj.star (Multiplicative (ZMod 4))) =
      Multiplicative.ofAdd (3 : ZMod 4) := by sorry

-- RestrictionBandTests.unitDoubleGenerator
example :
    singleCenterUnit (Multiplicative.ofAdd (2 : ZMod 4)) =
      singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) *
        singleCenterUnit (Multiplicative.ofAdd (1 : ZMod 4)) := by sorry

-- RestrictionBandTests.sectionEvaluation
example :
    (eval chainF f₀₁ (SingleObj.star (Multiplicative (ZMod 2))) (groupSection chainPresheaf U₀
      (Multiplicative.ofAdd (1 : ZMod 4)))).hom = Multiplicative.ofAdd (1 : ZMod 2) := by sorry

-- RestrictionBandTests.sectionKilled
example : restrict chainF f₀₁ (groupSection chainPresheaf U₀
    (Multiplicative.ofAdd (2 : ZMod 4))) = 1 := by sorry

-- RestrictionBandTests.sectionComposition
example :
    restrict chainF f₁₂ (restrict chainF f₀₁
      (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      restrict chainF f₀₂
        (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.equivalenceLeftRoundTrip
example (g : P.obj (op U)) :
    (groupSectionsEquiv P U).symm (groupSectionsEquiv P U g) = g := by sorry

-- RestrictionBandTests.equivalenceRightRoundTrip
example (s : IntrinsicBandSection (groupDiagram P) U) :
    groupSectionsEquiv P U ((groupSectionsEquiv P U).symm s) = s := by sorry

-- RestrictionBandTests.equivalenceDifferentCardinalities
example :
    Nat.card (IntrinsicBandSection chainF U₀) = 4 ∧
      Nat.card (IntrinsicBandSection chainF U₁) = 2 := by sorry

variable {B : Type} [SmallCategory B] (Q : Bᵒᵖ ⥤ CommGrpCat.{chain_w})

-- RestrictionBandTests.presheafForward
example (V : Bᵒᵖ) (g : Additive (Q.obj V)) :
    (groupSectionsPresheafIso Q).hom.app V g =
      Additive.ofMul (groupSectionsEquiv Q V.unop g.toMul) := by sorry

-- RestrictionBandTests.presheafInverse
example (V : Bᵒᵖ) :
    (groupSectionsPresheafIso Q).hom.app V ≫ (groupSectionsPresheafIso Q).inv.app V = 𝟙 _ := by sorry

-- RestrictionBandTests.presheafNaturality
example {V W : Bᵒᵖ} (f : V ⟶ W) :
    (Q ⋙ CommGrpCat.toAddCommGrp).map f ≫ (groupSectionsPresheafIso Q).hom.app W =
      (groupSectionsPresheafIso Q).hom.app V ≫
        (IntrinsicBandSections.presheaf (groupDiagram Q)).map f := by sorry

-- RestrictionBandTests.sheafNative
example : Presheaf.IsSheaf (⊥ : GrothendieckTopology B)
    (groupBandSheaf Q).obj := by sorry

-- RestrictionBandTests.sheafObject
example : (groupBandSheaf Q).obj =
    IntrinsicBandSections.presheaf (groupDiagram Q) := by sorry

-- RestrictionBandTests.sheafRestrictionGenerator
example :
    (groupBandSheaf chainPresheaf).obj.map f₀₁.op
      (Additive.ofMul (groupSectionsEquiv chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4)))) =
      Additive.ofMul (groupSectionsEquiv chainPresheaf U₁ (Multiplicative.ofAdd (1 : ZMod 2))) := by sorry

-- RestrictionBandTests.sheafIsoForwardInverse
example :
    (groupBandSheafIso Q).hom ≫ (groupBandSheafIso Q).inv = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoInverseForward
example :
    (groupBandSheafIso Q).inv ≫ (groupBandSheafIso Q).hom = 𝟙 _ := by sorry

-- RestrictionBandTests.sheafIsoGenerator
example :
    (groupBandSheafIso chainPresheaf).hom.hom.app (op U₀)
      (Additive.ofMul (Multiplicative.ofAdd (1 : ZMod 4))) =
      Additive.ofMul (groupSection chainPresheaf U₀ (Multiplicative.ofAdd (1 : ZMod 4))) := by sorry

-- RestrictionBandTests.chainGerbe
example : IsGerbe chainF (⊥ : GrothendieckTopology ChainSite) := by sorry

-- RestrictionBandTests.restrictionNotInjective
example : ¬ Function.Injective (restrict chainF f₀₁) := by sorry

-- RestrictionBandTests.noTerminal
example (V : TwoChainSite) : ¬ Nonempty (Limits.IsTerminal V) := by sorry

-- RestrictionBandTests.terminalFreeGerbe
example : IsGerbe twoChainF (⊥ : GrothendieckTopology TwoChainSite) := by sorry

-- RestrictionBandTests.leftChainSourceCard
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inl (0 : Fin 3)))) = 4 := by sorry

-- RestrictionBandTests.rightChainTargetCard
example :
    Nat.card (IntrinsicBandSection twoChainF (op (Sum.inr (1 : Fin 3)))) = 2 := by sorry

-- RestrictionBandTests.terminalFreeSheafIso
example :
    Nonempty ((⟨twoChainPresheaf ⋙ CommGrpCat.toAddCommGrp, Presheaf.isSheaf_bot _⟩ :
      Sheaf (⊥ : GrothendieckTopology TwoChainSite) AddCommGrpCat) ≅
      groupBandSheaf twoChainPresheaf) := by sorry

end TauCeti.AlgebraicGeometry.RestrictionBandFixtures.RestrictionBandTests

/-! Isom sheaves and their principal band action; proposed signatures only. -/

namespace TauCeti.AlgebraicGeometry.BandedIsom
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{v'}) (b : AbelianBanding F J A)
variable {U : C} {x y z : F.obj (.mk (op U))}

/-- The action is defined without a global isomorphism or chosen neutralization. -/
def act (b : AbelianBanding F J A) (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) : x ≅ y := by
  sorry

lemma act_one (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

lemma act_mul (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b p (a * c) = act F J A b (act F J A b p c) a := by
  sorry

/-- The unique coefficient carrying p to q, computed using the actual inverse of p. -/
def difference (b : AbelianBanding F J A) (p q : x ≅ y) : Multiplicative (A.obj.obj (op U)) := by
  sorry

lemma act_difference (p q : x ≅ y) : act F J A b p (difference F J A b p q) = q := by
  sorry

lemma difference_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    difference F J A b p (act F J A b p a) = a := by
  sorry

lemma difference_self (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

lemma act_precompose (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

lemma act_postcompose (p : x ≅ y) (q : y ≅ z)
    (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

/-- Principal comparison exists even when the global section type is empty. -/
def principalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y)) := by
  sorry

/-- Native torsor instance is offered only under explicit nonemptiness. -/
@[instance_reducible]
def isomTorsor (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) (h : Nonempty (x ≅ y)) :
    Torsor (Multiplicative (A.obj.obj (op U))) (x ≅ y) := by
  sorry

/-- An actual anchor trivializes the section torsor. -/
def coordinateEquiv (b : AbelianBanding F J A) (p : x ≅ y) :
    Multiplicative (A.obj.obj (op U)) ≃ (x ≅ y) := by
  sorry

lemma coordinate_one (p : x ≅ y) : coordinateEquiv F J A b p 1 = p := by
  sorry

lemma coordinate_change (p q : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b q a =
      coordinateEquiv F J A b p (a * difference F J A b p q) := by
  sorry

lemma difference_cocycle (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

lemma restrict_act {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

lemma restrict_difference {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

/-- Isomorphism to the already built Hom type: the groupoid condition is essential. -/
noncomputable def homEquiv (J : GrothendieckTopology C) [IsGerbe F J] (x y : F.obj (.mk (op U))) : (x ≅ y) ≃ (x ⟶ y) := by
  sorry

def homAct (b : AbelianBanding F J A) (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) : x ⟶ y := by
  sorry

noncomputable def homPrincipalEquiv (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    ((x ⟶ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ⟶ y) × (x ⟶ y)) := by
  sorry

lemma homPrincipalEquiv_apply (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    homPrincipalEquiv F J A b x y (p,a) = (p, homAct F J A b p a) := by
  sorry

/-- Actual Hom restriction includes the pseudofunctor comparison isomorphisms. -/
lemma pullHom_act {V W : C} (f : V ⟶ U) (h : W ⟶ V) (hf : W ⟶ U)
    (hh : h ≫ f = hf)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y)
    (a : Multiplicative (A.obj.obj (op V))) :
    pullHom (homAct F J A b p a) h hf hf hh hh =
      homAct F J A b (pullHom p h hf hf hh hh)
        (Multiplicative.ofAdd ((A.obj.map h.op) a.toAdd)) := by
  sorry

/-- Pair presheaf underlying the existing Hom sheaf on C/U. -/
def pairPresheaf (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- Product of the same Hom presheaf with the restricted coefficient presheaf. -/
def actionPresheaf (A : Sheaf J AddCommGrpCat.{v'}) (x y : F.obj (.mk (op U))) : (Over U)ᵒᵖ ⥤ Type v' := by
  sorry

/-- Native natural principal comparison, retaining all slice-arrow coherence. -/
noncomputable def principalPresheafIso (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    actionPresheaf F J A x y ≅ pairPresheaf F x y := by
  sorry

lemma pair_isSheaf (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

lemma action_isSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

noncomputable def pairSheaf (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

noncomputable def actionSheaf (b : AbelianBanding F J A) (x y : F.obj (.mk (op U))) : Sheaf (J.over U) (Type v') := by
  sorry

/-- Actual sheaf principal comparison, on the already built native sheaf carrier. -/
noncomputable def principalSheafIso (x y : F.obj (.mk (op U))) :
    actionSheaf F J A b x y ≅ pairSheaf F J x y := by
  sorry

lemma hom_localNonempty (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
      Nonempty ((F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) := by
  sorry

lemma principalEquiv_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    principalEquiv F J A b x y (p,a) = (p, act F J A b p a) := by
  sorry

lemma principalEquiv_symm_apply (p q : x ≅ y) :
    (principalEquiv F J A b x y).symm (p,q) = (p, difference F J A b p q) := by
  sorry

lemma coordinate_apply (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b p a = act F J A b p a := by
  sorry

lemma coordinate_symm_apply (p q : x ≅ y) :
    (coordinateEquiv F J A b p).symm q = difference F J A b p q := by
  sorry

lemma principalSheafIso_hom (x y : F.obj (.mk (op U))) :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end TauCeti.AlgebraicGeometry.BandedIsom

namespace TauCeti.AlgebraicGeometry.BandedIsom.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'})
variable (J : GrothendieckTopology C) [IsGerbe F J]
variable (A : Sheaf J AddCommGrpCat.{v'}) (b : AbelianBanding F J A)
variable {U : C} {x y z : F.obj (.mk (op U))}

-- BandedIsom.Tests.zeroAction
example (p : x ≅ y) : act F J A b p 1 = p := by
  sorry

-- BandedIsom.Tests.actionOrder
example (p : x ≅ y) (a c : Multiplicative (A.obj.obj (op U))) :
    act F J A b (act F J A b p c) a = act F J A b p (a*c) := by
  sorry

-- BandedIsom.Tests.precomposition
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a = b.autEquiv U x a ≪≫ p := by
  sorry

-- BandedIsom.Tests.composition
example (p : x ≅ y) (q : y ≅ z) (a : Multiplicative (A.obj.obj (op U))) :
    act F J A b p a ≪≫ q = act F J A b (p ≪≫ q) a := by
  sorry

-- BandedIsom.Tests.uniqueCoefficient
example (p q : x ≅ y) :
    ∃! a : Multiplicative (A.obj.obj (op U)), act F J A b p a = q := by
  sorry

-- BandedIsom.Tests.differenceZero
example (p : x ≅ y) : difference F J A b p p = 1 := by
  sorry

-- BandedIsom.Tests.differenceRecovery
example (p q : x ≅ y) :
    act F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.differenceCocycle
example (p q r : x ≅ y) :
    difference F J A b p r = difference F J A b q r * difference F J A b p q := by
  sorry

-- BandedIsom.Tests.principalLeft
example (t : (x ≅ y) × Multiplicative (A.obj.obj (op U))) :
    (principalEquiv F J A b x y).symm (principalEquiv F J A b x y t) = t := by
  sorry

-- BandedIsom.Tests.principalRight
example (t : (x ≅ y) × (x ≅ y)) :
    principalEquiv F J A b x y ((principalEquiv F J A b x y).symm t) = t := by
  sorry

-- BandedIsom.Tests.principalWithoutAnchor
example (b : AbelianBanding F J A) :
    Nonempty (((x ≅ y) × Multiplicative (A.obj.obj (op U))) ≃ ((x ≅ y) × (x ≅ y))) := by
  sorry

omit [IsGerbe F J] in
-- BandedIsom.Tests.noPointCreated
example [IsEmpty (x ≅ y)] :
    IsEmpty ((x ≅ y) × Multiplicative (A.obj.obj (op U))) := by
  sorry

-- BandedIsom.Tests.torsorDivision
example (p q : x ≅ y) :
    (letI := isomTorsor F J A b x y ⟨p⟩
     (p /ₛ q : Multiplicative (A.obj.obj (op U))) • q = p) := by
  sorry

-- BandedIsom.Tests.selfCoefficient
example (a : Multiplicative (A.obj.obj (op U))) :
    coordinateEquiv F J A b (Iso.refl x) a = b.autEquiv U x a := by
  sorry

-- BandedIsom.Tests.selfZero
example : coordinateEquiv F J A b (Iso.refl x) 1 = Iso.refl x := by
  sorry

-- BandedIsom.Tests.nonzeroMoves
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    act F J A b p a ≠ p := by
  sorry

-- BandedIsom.Tests.zeroBandUnique
example (b : AbelianBanding F J A) [Subsingleton (A.obj.obj (op U))] (p q : x ≅ y) : p = q := by
  sorry

-- BandedIsom.Tests.changedAnchor
example (p q : x ≅ y) :
    coordinateEquiv F J A b p (difference F J A b p q) = q := by
  sorry

-- BandedIsom.Tests.homUsesActualArrow
example (p : x ≅ y) : homEquiv F J x y p = p.hom := by
  sorry

-- BandedIsom.Tests.homComparison
example (p : x ⟶ y) (a : Multiplicative (A.obj.obj (op U))) :
    homPrincipalEquiv F J A b x y (p,a) = (p,p ≫ (b.autEquiv U y a).hom) := by
  sorry

-- BandedIsom.Tests.restrictionAction
example {V : C} (f : V ⟶ U) (p : x ≅ y)
    (a : Multiplicative (A.obj.obj (op U))) :
    (F.map f.op.toLoc).toFunctor.mapIso (act F J A b p a) =
      act F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
        (Multiplicative.ofAdd ((A.obj.map f.op) a.toAdd)) := by
  sorry

-- BandedIsom.Tests.restrictionDifference
example {V : C} (f : V ⟶ U) (p q : x ≅ y) :
    difference F J A b ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((F.map f.op.toLoc).toFunctor.mapIso q) =
        Multiplicative.ofAdd ((A.obj.map f.op) (difference F J A b p q).toAdd) := by
  sorry

-- BandedIsom.Tests.pairSheafNative
example : Presheaf.IsSheaf (J.over U) (pairPresheaf F x y) := by
  sorry

-- BandedIsom.Tests.actionSheafNative
example (b : AbelianBanding F J A) :
    Presheaf.IsSheaf (J.over U) (actionPresheaf F J A x y) := by
  sorry

-- BandedIsom.Tests.sheafLeft
example :
    (principalSheafIso F J A b x y).hom ≫ (principalSheafIso F J A b x y).inv =
      𝟙 (actionSheaf F J A b x y) := by
  sorry

-- BandedIsom.Tests.sheafRight
example :
    (principalSheafIso F J A b x y).inv ≫ (principalSheafIso F J A b x y).hom =
      𝟙 (pairSheaf F J x y) := by
  sorry

-- BandedIsom.Tests.sheafUnderlying
example :
    HEq (principalSheafIso F J A b x y).hom.hom (principalPresheafIso F J A b x y).hom := by
  sorry

end TauCeti.AlgebraicGeometry.BandedIsom.Tests

namespace TauCeti.AlgebraicGeometry
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J] [IsGerbe H J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
namespace BandedMorphism
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
variable {U : C} {x y : F.obj (.mk (op U))}
include bF bG

lemma map_act (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

lemma map_difference (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) = BandedIsom.difference F J A bF p q := by
  sorry

lemma mapIso_injective : Function.Injective
    ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

lemma faithful (U : C) : (η.app (.mk (op U))).toFunctor.Faithful := by
  sorry

/-- An actual source anchor supplies a preimage; no global anchor is inferred. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) : x ≅ y := by
  sorry

lemma map_preimageIso (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

lemma preimageIso_map (p q : x ≅ y) :
    preimageIso bF bG η p ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

lemma preimageIso_anchor (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (p : x ≅ y) : (x ≅ y) ≃
    ((η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

lemma isomEquiv_apply (p q : x ≅ y) :
    isomEquiv bF bG η p q = (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

lemma isomEquiv_symm_apply (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (isomEquiv bF bG η p).symm q = preimageIso bF bG η p q := by
  sorry

lemma isomEquiv_anchor (p p' : x ≅ y) : isomEquiv bF bG η p = isomEquiv bF bG η p' := by
  sorry

lemma preimageIso_act (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y)
    (a : Multiplicative (A.obj.obj (op U))) :
    preimageIso bF bG η p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso bF bG η p q) a := by
  sorry

lemma hom_surjective_of_anchor (p : x ≅ y) : Function.Surjective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

/-- The actual automorphism map, expressed through the fixed band's equivalences. -/
def autEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) (x : F.obj (.mk (op U))) : Aut x ≃*
    Aut ((η.app (.mk (op U))).toFunctor.obj x) := by
  sorry

lemma autEquiv_apply (x : F.obj (.mk (op U))) (a : Aut x) :
    autEquiv bF bG η x a = (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

omit [BandPreserving bF bG η] in
lemma autEquiv_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    autEquiv bF bG η x (bF.autEquiv U x a) = bG.autEquiv U _ a := by
  sorry

omit [BandPreserving bF bG η] in
lemma autEquiv_symm_band (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (autEquiv bF bG η x).symm (bG.autEquiv U _ a) = bF.autEquiv U x a := by
  sorry

omit bG [IsGerbe G J] [BandPreserving bF bG η] in
lemma preimageIso_id (p q : x ≅ y) :
    preimageIso bF bF (Pseudofunctor.StrongTrans.id F) p q = q := by
  sorry

lemma preimageIso_comp (bH : AbelianBanding H J A)
    (θ : Pseudofunctor.StrongTrans G H) [BandPreserving bG bH θ] (p : x ≅ y)
    (q : (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (θ.app (.mk (op U))).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso bF bH (Pseudofunctor.StrongTrans.vcomp η θ) p q =
      preimageIso bF bG η p
        (preimageIso bG bH θ ((η.app (.mk (op U))).toFunctor.mapIso p) q) := by
  sorry

lemma locallyIsomEquiv (x y : F.obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f → Nonempty
      (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
       ((η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
        (η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj y))) := by
  sorry

namespace Tests
-- BandedMorphism.Tests.inverseLeft
example (p q : x ≅ y) : preimageIso bF bG η p
    ((η.app (.mk (op U))).toFunctor.mapIso q) = q := by
  sorry

-- BandedMorphism.Tests.inverseRight
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.mapIso (preimageIso bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.independentAnchor
example (p p' : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso bF bG η p q = preimageIso bF bG η p' q := by
  sorry

-- BandedMorphism.Tests.equivLeft
example (p q : x ≅ y) :
    (isomEquiv bF bG η p).symm (isomEquiv bF bG η p q) = q := by
  sorry

-- BandedMorphism.Tests.equivRight
example (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    isomEquiv bF bG η p ((isomEquiv bF bG η p).symm q) = q := by
  sorry

-- BandedMorphism.Tests.equivUsesMap
example (p q : x ≅ y) : isomEquiv bF bG η p q =
    (η.app (.mk (op U))).toFunctor.mapIso q := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autLeft
example (x : F.obj (.mk (op U))) (a : Aut x) :
    (autEquiv bF bG η x).symm (autEquiv bF bG η x a) = a := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.autRight
example (x : F.obj (.mk (op U))) (a : Aut ((η.app (.mk (op U))).toFunctor.obj x)) :
    autEquiv bF bG η x ((autEquiv bF bG η x).symm a) = a := by
  sorry

-- BandedMorphism.Tests.autUsesMap
example (x : F.obj (.mk (op U))) (a : Aut x) : autEquiv bF bG η x a =
    (η.app (.mk (op U))).toFunctor.mapAut x a := by
  sorry

-- BandedMorphism.Tests.nonzeroRetained
example (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) (ha : a ≠ 1) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) ≠ 1 := by
  sorry

-- BandedMorphism.Tests.preservesAction
example (p : x ≅ y) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapIso (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p) a := by
  sorry

-- BandedMorphism.Tests.preservesDifference
example (p q : x ≅ y) :
    BandedIsom.difference G J A bG ((η.app (.mk (op U))).toFunctor.mapIso p)
      ((η.app (.mk (op U))).toFunctor.mapIso q) =
      BandedIsom.difference F J A bF p q := by
  sorry

-- BandedMorphism.Tests.separatesArrows
example (p q : x ⟶ y) (h : (η.app (.mk (op U))).toFunctor.map p =
    (η.app (.mk (op U))).toFunctor.map q) : p = q := by
  sorry

omit bF bG [IsGerbe F J] [IsGerbe G J] [BandPreserving bF bG η] in
-- BandedMorphism.Tests.emptySourceNotFilled
example (h : IsEmpty (x ≅ y)) :
    ¬ ∃ _p : x ≅ y, Function.Surjective
      ((η.app (.mk (op U))).toFunctor.mapIso : (x ≅ y) → _) := by
  sorry

omit [BandPreserving bF bG η] in
-- BandedMorphism.Tests.changedCoefficientRejected
example (x : F.obj (.mk (op U)))
    (a a' : Multiplicative (A.obj.obj (op U))) (h : a ≠ a')
    (bad : (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) = bG.autEquiv U _ a') :
    ¬ BandPreserving bF bG η := by
  sorry

end Tests

end BandedMorphism
end TauCeti.AlgebraicGeometry

namespace TauCeti.AlgebraicGeometry.GerbeMorphismPullback
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V : C} (f : V ⟶ U) (x y : F.obj (.mk (op U)))

/-- The actual component of the native strong-naturality isomorphism. -/
def comparison :
    (η.app (.mk (op V))).toFunctor.obj ((F.map f.op.toLoc).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) := by sorry

lemma comparison_native : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

lemma comparison_inv_hom_id :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

/-- Use the existing Iso.isoCongr, retaining both comparison components. -/
def mapIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

/-- Objectwise map on the actual native Hom-presheaf carriers. -/
def homMap (p : (F.map f.op.toLoc).toFunctor.obj x ⟶
    (F.map f.op.toLoc).toFunctor.obj y) :
    (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ⟶
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) := by sorry

lemma mapIso_hom (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

lemma homMap_restrict (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

lemma mapIso_restrict (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

lemma comparison_band (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

include bF bG

lemma mapIso_injective : Function.Injective (mapIso η f x y) := by sorry

lemma homMap_injective : Function.Injective (homMap η f x y) := by sorry

lemma mapIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    mapIso η f x y (BandedIsom.act F J A bF p a) =
      BandedIsom.act G J A bG (mapIso η f x y p) a := by sorry

lemma mapIso_difference (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    BandedIsom.difference G J A bG (mapIso η f x y p) (mapIso η f x y q) =
      BandedIsom.difference F J A bF p q := by sorry

/-- An actual local source anchor is retained as explicit data. -/
def preimageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y := by sorry

lemma map_preimageIso (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

lemma preimageIso_map (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y q) = q := by sorry

lemma preimageIso_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

lemma preimageIso_act (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))
    (a : Multiplicative (A.obj.obj (op V))) :
    preimageIso η f x y bF bG p (BandedIsom.act G J A bG q a) =
      BandedIsom.act F J A bF (preimageIso η f x y bF bG p q) a := by sorry

lemma preimageIso_restrict (p : x ≅ y)
    (q : (η.app (.mk (op U))).toFunctor.obj x ≅ (η.app (.mk (op U))).toFunctor.obj y) :
    preimageIso η f x y bF bG ((F.map f.op.toLoc).toFunctor.mapIso p)
      ((G.map f.op.toLoc).toFunctor.mapIso q) =
      (F.map f.op.toLoc).toFunctor.mapIso (BandedMorphism.preimageIso bF bG η p q) := by sorry

def isomEquiv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    ((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) := by sorry

lemma isomEquiv_apply (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = mapIso η f x y q := by sorry

lemma isomEquiv_symm_apply (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q = preimageIso η f x y bF bG p q := by sorry

lemma isomEquiv_anchor (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p = isomEquiv η f x y bF bG p' := by sorry

lemma homMap_surjective_of_anchor (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) : Function.Surjective (homMap η f x y) := by sorry

/-- The covering sieve comes from the gerbe, with no global anchor chosen. -/
lemma locallyIsomEquiv : ∃ R : Sieve U, R ∈ J U ∧ ∀ ⦃V : C⦄ (f : V ⟶ U), R f →
    Nonempty (((F.map f.op.toLoc).toFunctor.obj x ≅ (F.map f.op.toLoc).toFunctor.obj y) ≃
      ((G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
        (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y))) := by sorry

end TauCeti.AlgebraicGeometry.GerbeMorphismPullback

namespace TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V : C} (f : V ⟶ U) (x y : F.obj (.mk (op U)))

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.nativeComparison
example : comparison η f x =
    (Cat.Hom.toNatIso (η.naturality f.op.toLoc)).app x := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.zeroComparison
example :
    (comparison η f x).inv ≫ (comparison η f x).hom = 𝟙 _ := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.reflexiveImage
example : mapIso η f x x (Iso.refl _) = Iso.refl _ := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.actualHomImage
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    (mapIso η f x y p).hom = homMap η f x y p.hom := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.globalIsoRestriction
example (p : x ≅ y) :
    mapIso η f x y ((F.map f.op.toLoc).toFunctor.mapIso p) =
      (G.map f.op.toLoc).toFunctor.mapIso ((η.app (.mk (op U))).toFunctor.mapIso p) := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.sliceHomCarrier
example (T : (Over U)ᵒᵖ) (p : (F.presheafHom x y).obj T) :
    homMap η T.unop.hom x y p =
      (show (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
        ((η.app (.mk (op U))).toFunctor.obj y)).obj T from
        homMap η T.unop.hom x y p) := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.identityHomImage
example : homMap η f x x (𝟙 _) = 𝟙 _ := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.globalHomRestriction
example (p : x ⟶ y) :
    homMap η f x y ((F.map f.op.toLoc).toFunctor.map p) =
      (G.map f.op.toLoc).toFunctor.map ((η.app (.mk (op U))).toFunctor.map p) := by sorry

variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.comparisonBand
example (a : Multiplicative (A.obj.obj (op V))) :
    Aut.autMulEquivOfIso (comparison η f x)
      (bG.autEquiv V ((η.app (.mk (op V))).toFunctor.obj
        ((F.map f.op.toLoc).toFunctor.obj x)) a) =
      bG.autEquiv V ((G.map f.op.toLoc).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.targetRoundTrip
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    mapIso η f x y (preimageIso η f x y bF bG p q) = q := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.anchorRecovered
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    preimageIso η f x y bF bG p (mapIso η f x y p) = p := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.differentAnchors
example (p p' : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    preimageIso η f x y bF bG p q = preimageIso η f x y bF bG p' q := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.forwardOrientation
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) :
    isomEquiv η f x y bF bG p q = (comparison η f x).symm ≪≫
      ((η.app (.mk (op V))).toFunctor.mapIso q ≪≫ comparison η f y) := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.reverseOrientation
example (p : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y)
    (q : (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map f.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (isomEquiv η f x y bF bG p).symm q =
      BandedMorphism.preimageIso bF bG η p
        (comparison η f x ≪≫ (q ≪≫ (comparison η f y).symm)) := by sorry

-- TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.actedImage
example (p q : (F.map f.op.toLoc).toFunctor.obj x ≅
    (F.map f.op.toLoc).toFunctor.obj y) (a : Multiplicative (A.obj.obj (op V))) :
    isomEquiv η f x y bF bG p (BandedIsom.act F J A bF q a) =
      BandedIsom.act G J A bG (isomEquiv η f x y bF bG p q) a := by sorry

end TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests

/- BEGIN GERBE HOM SHEAF ASSEMBLY -/
namespace TauCeti.AlgebraicGeometry.GerbeMorphismPullback
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (f : V ⟶ U) (g : W ⟶ V) (x y : F.obj (.mk (op U)))

lemma comparison_comp : comparison η (g ≫ f) x =
    (η.app (.mk (op W))).toFunctor.mapIso
      ((Cat.Hom.toNatIso (F.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app x) ≪≫
    comparison η g ((F.map f.op.toLoc).toFunctor.obj x) ≪≫
    (G.map g.op.toLoc).toFunctor.mapIso (comparison η f x) ≪≫
    ((Cat.Hom.toNatIso (G.mapComp' f.op.toLoc g.op.toLoc (g ≫ f).op.toLoc)).app
      ((η.app (.mk (op U))).toFunctor.obj x)).symm := by
  sorry

lemma homMap_pullHom (h : W ⟶ U) (hh : g ≫ f = h)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η h x y (pullHom p g h h hh hh) =
      pullHom (homMap η f x y p) g h h hh hh := by
  sorry

def homPresheafMap : F.presheafHom x y ⟶
    G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

lemma homPresheafMap_app (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homPresheafMap η x y).app (op T) p = homMap η T.hom x y p := by
  sorry

lemma homPresheafMap_naturality {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (p : (F.presheafHom x y).obj (op T₁)) :
    (homPresheafMap η x y).app (op T₂) ((F.presheafHom x y).map a.op p) =
      (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
        ((η.app (.mk (op U))).toFunctor.obj y)).map a.op
          ((homPresheafMap η x y).app (op T₁) p) := by
  sorry

lemma homPresheafMap_identity (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U)))
      (F.presheafHomObjHomEquiv p) =
        G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

variable (J : GrothendieckTopology C)

def homSheafMap [F.IsPrestack J] [G.IsPrestack J] :
    F.sheafHom J x y ⟶ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

lemma homSheafMap_hom [F.IsPrestack J] [G.IsPrestack J] :
    (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

variable [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]
include bF bG

lemma homPresheafMap_injective (T : Over U) :
    Function.Injective ((homPresheafMap η x y).app (op T)) := by
  sorry

lemma homPresheafMap_imageSieve (T : Over U)
    (s : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    Presheaf.imageSieve (homPresheafMap η x y) s ∈ (J.over U) T := by
  sorry

lemma homSheafMap_locallySurjective : Sheaf.IsLocallySurjective (homSheafMap η x y J) := by
  sorry

lemma homSheafMap_locallyInjective : Sheaf.IsLocallyInjective (homSheafMap η x y J) := by
  sorry

lemma homSheafMap_isIso : IsIso (homSheafMap η x y J) := by
  sorry

def homSheafIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    [BandPreserving bF bG η] :
    F.sheafHom J x y ≅ G.sheafHom J
      ((η.app (.mk (op U))).toFunctor.obj x) ((η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

lemma homSheafIso_hom : (homSheafIso η x y J bF bG).hom = homSheafMap η x y J := by
  sorry

lemma homSheafIso_inverse_anchor (T : Over U)
    (p : (F.map T.hom.op.toLoc).toFunctor.obj x ≅ (F.map T.hom.op.toLoc).toFunctor.obj y)
    (q : (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj x) ≅
      (G.map T.hom.op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T) q.hom =
      (preimageIso η T.hom x y bF bG p q).hom := by
  sorry

lemma homSheafIso_inverse_restrict {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

lemma fibreHom_bijective : Function.Bijective
    ((η.app (.mk (op U))).toFunctor.map : (x ⟶ y) → _) := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeMorphismPullback

namespace TauCeti.AlgebraicGeometry.BandedMorphism
open CategoryTheory Opposite Bicategory
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
lemma full (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.Full := by
  sorry
end TauCeti.AlgebraicGeometry.BandedMorphism

namespace TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable (η : Pseudofunctor.StrongTrans F G)
variable {U V W : C} (x y : F.obj (.mk (op U)))

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.presheafIdentity
example : homPresheafMap (Pseudofunctor.StrongTrans.id F) x y = 𝟙 (F.presheafHom x y) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.deeperArrow
example (f : V ⟶ U) (g : W ⟶ V)
    (p : (F.map f.op.toLoc).toFunctor.obj x ⟶ (F.map f.op.toLoc).toFunctor.obj y) :
    homMap η (g ≫ f) x y (pullHom p g (g ≫ f) (g ≫ f)) =
      pullHom (homMap η f x y p) g (g ≫ f) (g ≫ f) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.identitySlice
example (p : x ⟶ y) :
    (homPresheafMap η x y).app (op (Over.mk (𝟙 U))) (F.presheafHomObjHomEquiv p) =
      G.presheafHomObjHomEquiv ((η.app (.mk (op U))).toFunctor.map p) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.pointNonzero
example :
    let F := BandFixtures.constantDiagram (Discrete PUnit) (SingleObj (Multiplicative (ZMod 2)))
    let U : Discrete PUnit := Discrete.mk PUnit.unit
    let x : F.obj (.mk (op U)) := SingleObj.star (Multiplicative (ZMod 2))
    let a : (F.presheafHom x x).obj (op (Over.mk (𝟙 U))) := Multiplicative.ofAdd (1 : ZMod 2)
    (homPresheafMap (Pseudofunctor.StrongTrans.id F) x x).app (op (Over.mk (𝟙 U))) a = a := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.bandHypothesisNeeded
example : ¬ (1 : Multiplicative (ZMod 2) →* Multiplicative (ZMod 2)).toFunctor.Full := by
  sorry

variable (J : GrothendieckTopology C) [IsGerbe F J] [IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
variable [BandPreserving bF bG η]

include bF bG

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.nativeSheafMap
example : (homSheafMap η x y J).hom = homPresheafMap η x y := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.separatesLocalArrows
example (T : Over U) (p q : (F.presheafHom x y).obj (op T))
    (h : (homSheafMap η x y J).hom.app (op T) p =
      (homSheafMap η x y J).hom.app (op T) q) : p = q := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.noGlobalAnchor
example (h : IsEmpty (x ⟶ y)) :
    IsEmpty ((η.app (.mk (op U))).toFunctor.obj x ⟶ (η.app (.mk (op U))).toFunctor.obj y) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.inverseRoundtrip
example (T : Over U) (p : (F.presheafHom x y).obj (op T)) :
    (homSheafIso η x y J bF bG).inv.hom.app (op T)
      ((homSheafMap η x y J).hom.app (op T) p) = p := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.forwardRoundtrip
example (T : Over U)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T)) :
    (homSheafMap η x y J).hom.app (op T)
      ((homSheafIso η x y J bF bG).inv.hom.app (op T) q) = q := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.arbitraryInverseRestriction
example {T₁ T₂ : Over U} (a : T₂ ⟶ T₁)
    (q : (G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
      ((η.app (.mk (op U))).toFunctor.obj y)).obj (op T₁)) :
    (F.presheafHom x y).map a.op ((homSheafIso η x y J bF bG).inv.hom.app (op T₁) q) =
      (homSheafIso η x y J bF bG).inv.hom.app (op T₂)
        ((G.presheafHom ((η.app (.mk (op U))).toFunctor.obj x)
          ((η.app (.mk (op U))).toFunctor.obj y)).map a.op q) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests.inverseBandCoordinate
example (a : Multiplicative (A.obj.obj (op U))) :
    (homSheafIso η x x J bF bG).inv.hom.app (op (Over.mk (𝟙 U)))
      (G.presheafHomObjHomEquiv (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a).hom) =
        F.presheafHomObjHomEquiv (bF.autEquiv U x a).hom := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeMorphismPullback.Tests
/- END GERBE HOM SHEAF ASSEMBLY -/

/- BEGIN BANDED GERBE OBJECT DESCENT
Only the native descent-data carrier is used. The component adapters retain
the incoming coefficient universe v'. No inverse StrongTrans is constructed.
All new mathematical proof obligations below are admitted design statements.
-/
namespace TauCeti.AlgebraicGeometry.GerbeMorphismDescent
open CategoryTheory Opposite Bicategory
open Pseudofunctor.LocallyDiscreteOpToCat
open GerbeMorphismPullback
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
universe t
variable {C : Type u} [Category.{v} C]
variable {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
variable {J : GrothendieckTopology C} [hF : IsGerbe F J] [hG : IsGerbe G J]
variable {A : Sheaf J AddCommGrpCat.{v'}}

def componentFullyFaithful (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.FullyFaithful := by sorry

lemma componentFullyFaithful_map_preimage (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

def localImageSieve (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : Sieve U := by sorry

lemma localImageSieve_mem (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

lemma localImageSieve_covering (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z ∈ J U := by sorry

lemma localImageSieve_identity (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

variable {ι : Type t} {U : C} {X : ι → C}

def targetOverlapIso (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.obj ((F.map a.op.toLoc).toFunctor.obj (x i)) ≅
      (η.app (.mk (op Y))).toFunctor.obj ((F.map b.op.toLoc).toFunctor.obj (x j)) := by sorry

lemma targetOverlapIso_formula (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    targetOverlapIso η f x z e q a b ha hb =
      comparison η a (x i) ≪≫ (G.map a.op.toLoc).toFunctor.mapIso (e i) ≪≫
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).iso q a b ha hb ≪≫
      ((G.map b.op.toLoc).toFunctor.mapIso (e j)).symm ≪≫
      (comparison η b (x j)).symm := by sorry

lemma targetOverlapIso_self (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

lemma targetOverlapIso_comp (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    targetOverlapIso η f x z e q a b ha hb ≪≫
      targetOverlapIso η f x z e q b c hb hc =
        targetOverlapIso η f x z e q a c ha hc := by sorry

def liftedOverlapIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (F.map a.op.toLoc).toFunctor.obj (x i) ≅
      (F.map b.op.toLoc).toFunctor.obj (x j) := by sorry

lemma liftedOverlapIso_map (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.mapIso
      (liftedOverlapIso bF bG η f x z e q a b ha hb) =
        targetOverlapIso η f x z e q a b ha hb := by sorry

lemma liftedOverlapIso_self (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    liftedOverlapIso bF bG η f x z e q a a ha ha = Iso.refl _ := by sorry

lemma liftedOverlapIso_comp (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    liftedOverlapIso bF bG η f x z e q a b ha hb ≪≫
      liftedOverlapIso bF bG η f x z e q b c hb hc =
        liftedOverlapIso bF bG η f x z e q a c ha hc := by sorry

lemma liftedOverlapIso_pullHom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom (liftedOverlapIso bF bG η f x z e q a b ha hb).hom g ga gb hga hgb =
      (liftedOverlapIso bF bG η f x z e q' ga gb haa hbb).hom := by sorry

/-- The objects and overlap maps are specified data. Coherence is admitted. -/
def liftedDescentData (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) : F.DescentData f where
  obj := x
  hom Y q i j a b ha hb := (liftedOverlapIso bF bG η f x z e q a b ha hb).hom
  pullHom_hom := by sorry
  hom_self := by sorry
  hom_comp := by sorry

lemma liftedDescentData_obj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

lemma liftedDescentData_hom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (liftedDescentData bF bG η f x z e).hom q a b ha hb =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).hom := by sorry

def imageLocalIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.obj ((η.app (.mk (op U))).toFunctor.obj y) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z := by sorry

lemma imageLocalIso_hom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).hom =
      (comparison η (f i) y).inv ≫
      (η.app (.mk (op (X i)))).toFunctor.map (r.hom.hom i) ≫ (e i).hom := by sorry

lemma imageLocalIso_comm (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (G.map a.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r i).hom ≫
        (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).hom q a b ha hb =
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f)
        ((η.app (.mk (op U))).toFunctor.obj y)).hom q a b ha hb ≫
        (G.map b.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r j).hom := by sorry

def globalImageIso (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) :
    (η.app (.mk (op U))).toFunctor.obj y ≅ z := by sorry

lemma globalImageIso_restrict (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).hom =
      (imageLocalIso bF bG η f x z e y r i).hom := by sorry

lemma globalImageIso_unique (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    (p : (η.app (.mk (op U))).toFunctor.obj y ≅ z)
    (hp : ∀ i, (G.map (f i).op.toLoc).toFunctor.map p.hom =
      (imageLocalIso bF bG η f x z e y r i).hom) :
    p = globalImageIso bF bG η f hf x z e y r := by sorry

lemma global_preimage (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (z : G.obj (.mk (op U))) :
    ∃ y : F.obj (.mk (op U)),
      Nonempty ((η.app (.mk (op U))).toFunctor.obj y ≅ z) := by sorry

lemma componentEssSurj (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.EssSurj := by sorry

lemma componentIsEquivalence (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η] (U : C) :
    (η.app (.mk (op U))).toFunctor.IsEquivalence := by sorry

/- BEGIN OBJECT DESCENT API -/
lemma componentFullyFaithful_preimage_map (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

lemma imageLocalIso_inv (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).inv =
      (e i).inv ≫ (η.app (.mk (op (X i)))).toFunctor.map (r.inv.hom i) ≫
        (comparison η (f i) y).hom := by sorry

lemma componentFullyFaithful_map_injective
    (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p q : x ⟶ y)
    (hpq : (η.app (.mk (op U))).toFunctor.map p =
      (η.app (.mk (op U))).toFunctor.map q) : p = q := by sorry

lemma liftedDescentData_pullHom (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom ((liftedDescentData bF bG η f x z e).hom q a b ha hb) g ga gb hga hgb =
      (liftedDescentData bF bG η f x z e).hom q' ga gb haa hbb := by sorry
lemma globalImageIso_inv_restrict (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).inv =
      (imageLocalIso bF bG η f x z e y r i).inv := by sorry
/- END OBJECT DESCENT API -/

namespace Tests

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.arrowRoundTrip
example (bF : AbelianBanding F J A)
    (bG : AbelianBanding G J A) (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C) {x y : F.obj (.mk (op U))}
    (p : (η.app (.mk (op U))).toFunctor.obj x ⟶
      (η.app (.mk (op U))).toFunctor.obj y) :
    (η.app (.mk (op U))).toFunctor.map
      ((componentFullyFaithful bF bG η U).preimage p) = p := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.sourceRoundTrip
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) {x y : F.obj (.mk (op U))} (p : x ⟶ y) :
    (componentFullyFaithful bF bG η U).preimage
      ((η.app (.mk (op U))).toFunctor.map p) = p := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.nonidentityAutomorphism
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (U : C) (x : F.obj (.mk (op U))) (p : x ⟶ x) (hp : p ≠ 𝟙 x) :
    (η.app (.mk (op U))).toFunctor.map p ≠ 𝟙 _ := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.membershipData
example (η : Pseudofunctor.StrongTrans F G) {U V : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) :
    localImageSieve η z f ↔ ∃ x : F.obj (.mk (op V)),
      Nonempty ((η.app (.mk (op V))).toFunctor.obj x ≅
        (G.map f.op.toLoc).toFunctor.obj z) := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.deeperImage
example (η : Pseudofunctor.StrongTrans F G) {U V W : C}
    (z : G.obj (.mk (op U))) (f : V ⟶ U) (g : W ⟶ V)
    (hf : localImageSieve η z f) : localImageSieve η z (g ≫ f) := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.identityImage
example (η : Pseudofunctor.StrongTrans F G) {U : C}
    (z : G.obj (.mk (op U))) : localImageSieve η z (𝟙 U) ↔
      ∃ x : F.obj (.mk (op U)),
        Nonempty ((η.app (.mk (op U))).toFunctor.obj x ≅ z) := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.selfOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i : ι} (a : Y ⟶ X i) (ha : a ≫ f i = q) :
    targetOverlapIso η f x z e q a a ha ha = Iso.refl _ := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.tripleOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    targetOverlapIso η f x z e q a b ha hb ≪≫
      targetOverlapIso η f x z e q b c hb hc =
        targetOverlapIso η f x z e q a c ha hc := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reverseTargetOverlap
example (η : Pseudofunctor.StrongTrans F G)
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    targetOverlapIso η f x z e q b a hb ha =
      (targetOverlapIso η f x z e q a b ha hb).symm := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.liftedImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (η.app (.mk (op Y))).toFunctor.mapIso
      (liftedOverlapIso bF bG η f x z e q a b ha hb) =
        targetOverlapIso η f x z e q a b ha hb := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reflectedCocycle
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j k : ι}
    (a : Y ⟶ X i) (b : Y ⟶ X j) (c : Y ⟶ X k)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) (hc : c ≫ f k = q) :
    liftedOverlapIso bF bG η f x z e q a b ha hb ≪≫
      liftedOverlapIso bF bG η f x z e q b c hb hc =
        liftedOverlapIso bF bG η f x z e q a c ha hc := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.reverseLiftedOverlap
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    liftedOverlapIso bF bG η f x z e q b a hb ha =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).symm := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.retainedLocalObject
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z) (i : ι) :
    (liftedDescentData bF bG η f x z e).obj i = x i := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.retainedLocalArrow
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (liftedDescentData bF bG η f x z e).hom q a b ha hb =
      (liftedOverlapIso bF bG η f x z e q a b ha hb).hom := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.varyingBaseDescent
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    {Y Y' : C} (q : Y ⟶ U) (q' : Y' ⟶ U) (g : Y' ⟶ Y) (hq : g ≫ q = q')
    {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q)
    (ga : Y' ⟶ X i) (gb : Y' ⟶ X j)
    (hga : g ≫ a = ga) (hgb : g ≫ b = gb)
    (haa : ga ≫ f i = q') (hbb : gb ≫ f j = q') :
    pullHom ((liftedDescentData bF bG η f x z e).hom q a b ha hb) g ga gb hga hgb =
      (liftedDescentData bF bG η f x z e).hom q' ga gb haa hbb := by sorry
-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.forwardGluingImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).hom =
      (comparison η (f i) y).inv ≫
      (η.app (.mk (op (X i)))).toFunctor.map (r.hom.hom i) ≫ (e i).hom := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.inverseGluingImage
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (imageLocalIso bF bG η f x z e y r i).inv =
      (e i).inv ≫ (η.app (.mk (op (X i)))).toFunctor.map (r.inv.hom i) ≫
        (comparison η (f i) y).hom := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.nativeImageComm
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    {Y : C} (q : Y ⟶ U) {i j : ι} (a : Y ⟶ X i) (b : Y ⟶ X j)
    (ha : a ≫ f i = q) (hb : b ≫ f j = q) :
    (G.map a.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r i).hom ≫
        (Pseudofunctor.DescentData.ofObj (F := G) (f := f) z).hom q a b ha hb =
      (Pseudofunctor.DescentData.ofObj (F := G) (f := f)
        ((η.app (.mk (op U))).toFunctor.obj y)).hom q a b ha hb ≫
        (G.map b.op.toLoc).toFunctor.map (imageLocalIso bF bG η f x z e y r j).hom := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.globalRestriction
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) (i : ι) :
    (G.map (f i).op.toLoc).toFunctor.map (globalImageIso bF bG η f hf x z e y r).hom =
      (imageLocalIso bF bG η f x z e y r i).hom := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.uniquenessForLocalData
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    (f : ∀ i, X i ⟶ U) (hf : Sieve.ofArrows X f ∈ J U)
    (x : ∀ i, F.obj (.mk (op (X i)))) (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e)
    (p : (η.app (.mk (op U))).toFunctor.obj y ≅ z)
    (hp : ∀ i, (G.map (f i).op.toLoc).toFunctor.map p.hom =
      (imageLocalIso bF bG η f x z e y r i).hom) :
    p = globalImageIso bF bG η f hf x z e y r := by sorry

-- test: TauCeti.AlgebraicGeometry.GerbeMorphismDescent.Tests.emptyCoverEffectivity
example (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]
    [IsEmpty ι]
    (f : ∀ i, X i ⟶ U) (x : ∀ i, F.obj (.mk (op (X i))))
    (z : G.obj (.mk (op U)))
    (e : ∀ i, (η.app (.mk (op (X i)))).toFunctor.obj (x i) ≅
      (G.map (f i).op.toLoc).toFunctor.obj z)
    (hf : Sieve.ofArrows X f ∈ J U)
    (y : F.obj (.mk (op U)))
    (r : Pseudofunctor.DescentData.ofObj (F := F) (f := f) y ≅
      liftedDescentData bF bG η f x z e) :
    Nonempty ((η.app (.mk (op U))).toFunctor.obj y ≅ z) := by sorry

end Tests

end TauCeti.AlgebraicGeometry.GerbeMorphismDescent
/- END BANDED GERBE OBJECT DESCENT -/

/- BEGIN OBJECT DESCENT ARCHIVE 67
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
END OBJECT DESCENT ARCHIVE 67 -/
