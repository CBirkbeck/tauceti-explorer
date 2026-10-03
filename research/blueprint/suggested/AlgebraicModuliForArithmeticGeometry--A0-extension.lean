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

/- OBJECT DESCENT RECEIPT 67
{
  "sourceArchive": "71d9add6aa2d1030d54c4eb51178ec75116c1972",
  "fullCanonical": "028dc34fec4d95db4a1708e02cbe9f42928c8b409ab6d9732764dcc72bd9a143",
  "mathlibCanonical": "9a9522ee22742f31711fdc2a2f45b12e51f7ce2771b005a4ee7d259fe18d12e5",
  "elaboration": "Admitted Mathlib-only extraction passed; full canonical and inherited native draft not compiled."
}
-/

namespace TauCeti.AlgebraicGeometry.GerbeBandEquivalence

open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)

lemma fibreNatIso_map_band (U : C)
    (P Q : F.obj (.mk (op U)) ⥤ G.obj (.mk (op U))) (e : P ≅ Q)
    (hP : ∀ (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))),
      P.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (P.obj x) a)
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Q.mapAut x (bF.autEquiv U x a) = bG.autEquiv U (Q.obj x) a := by
  sorry

lemma of_fibreNatIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (e : ∀ U : C, (η.app (.mk (op U))).toFunctor ≅
      (θ.app (.mk (op U))).toFunctor) : BandPreserving bF bG θ := by
  sorry

lemma of_modificationIso (η θ : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (e : η ≅ θ) : BandPreserving bF bG θ := by
  sorry

lemma modificationIso_iff (η θ : Pseudofunctor.StrongTrans F G)
    (e : η ≅ θ) : BandPreserving bF bG η ↔ BandPreserving bF bG θ := by
  sorry

lemma inverse_map_band (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η] (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

omit [IsGerbe G J] in
lemma unit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

omit [IsGerbe F J] in
lemma counit_band (η : Pseudofunctor.StrongTrans F G) (U : C)
    [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

lemma inverse_preserving (η : Pseudofunctor.StrongTrans F G)
    [BandPreserving bF bG η]
    (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeBandEquivalence

namespace TauCeti.AlgebraicGeometry.GerbeBandEquivalenceTests
open scoped Pseudofunctor.StrongTrans
variable {C : Type u} [Category.{v} C]
    {J : GrothendieckTopology C}
    {F G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{v', u'}}
    {A : Sheaf J AddCommGrpCat.{w}} [IsGerbe F J] [IsGerbe G J]
local instance : Category (Pseudofunctor.StrongTrans F G) :=
  Pseudofunctor.StrongTrans.homCategory (F := F) (G := G)
variable (bF : AbelianBanding F J A) (bG : AbelianBanding G J A)
    (η : Pseudofunctor.StrongTrans F G) [BandPreserving bF bG η]

-- test: GerbeBandEquivalenceTests.fibre_refl
example (U : C) (x : F.obj (.mk (op U)))
    (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.mapAut x (bF.autEquiv U x a) =
      bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj x) a := by
  sorry

-- test: GerbeBandEquivalenceTests.fibre_family_refl
example : BandPreserving bF bG η := by
  sorry

-- test: GerbeBandEquivalenceTests.modification_refl
example : BandPreserving bF bG η := by
  sorry

-- test: GerbeBandEquivalenceTests.modification_symm
example (θ : Pseudofunctor.StrongTrans F G) (e : η ≅ θ) :
    BandPreserving bF bG θ ↔ BandPreserving bF bG η := by
  sorry

-- test: GerbeBandEquivalenceTests.inverse_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    (η.app (.mk (op U))).toFunctor.inv.mapAut y (bG.autEquiv U y a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj y) a := by
  sorry

-- test: GerbeBandEquivalenceTests.unit_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (x : F.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.unitIso.app x)
      (bF.autEquiv U x a) =
      bF.autEquiv U ((η.app (.mk (op U))).toFunctor.inv.obj
        ((η.app (.mk (op U))).toFunctor.obj x)) a := by
  sorry

-- test: GerbeBandEquivalenceTests.counit_coefficient
example (U : C) [(η.app (.mk (op U))).toFunctor.IsEquivalence]
    (y : G.obj (.mk (op U))) (a : Multiplicative (A.obj.obj (op U))) :
    Aut.autMulEquivOfIso ((η.app (.mk (op U))).toFunctor.asEquivalence.counitIso.app y)
      (bG.autEquiv U ((η.app (.mk (op U))).toFunctor.obj
        ((η.app (.mk (op U))).toFunctor.inv.obj y)) a) =
      bG.autEquiv U y a := by
  sorry

-- test: GerbeBandEquivalenceTests.chosen_inverse
example (hη : ∀ U : C, (η.app (.mk (op U))).toFunctor.IsEquivalence)
    (σ : Pseudofunctor.StrongTrans G F)
    (e : ∀ U : C, letI := hη U
      (σ.app (.mk (op U))).toFunctor ≅ (η.app (.mk (op U))).toFunctor.inv) :
    BandPreserving bG bF σ := by
  sorry

end TauCeti.AlgebraicGeometry.GerbeBandEquivalenceTests

/- BEGIN INVERSE BAND ARCHIVE N20
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
END INVERSE BAND ARCHIVE N20 -/
