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
