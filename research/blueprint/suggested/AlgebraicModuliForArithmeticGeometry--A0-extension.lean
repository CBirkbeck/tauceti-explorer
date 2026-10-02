/-
This file is not the roadmap and is not exhaustive. The roadmap reader is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Nothing here claims an implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.
The final omission ledger names every interface requiring an unavailable
supplier. No desired theorem is encoded as an unspecified Prop-valued field.
-/

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
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.RingTheory.Finiteness.Descent
import Mathlib.Algebra.Module.FinitePresentation

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
For every commutative ring map R→A, the usual tensor-overlap module descent category is equivalent to the existing coalgebras of (extendRestrictScalarsAdj(R→A)).toComonad, preserving the underlying A-module and all its morphisms. The forward coaction is d(n)=θ(n⊗1); the reverse transition is θ(n⊗a)=Σai⊗a ni if d(n)=Σai⊗ni, with inverse ψ(a⊗n)=Σa ni⊗ai. The tensor-overlap category must additionally be compared with the pinned all-test-object Pseudofunctor.DescentData, through the pushout property of A⊗R A and the actual pseudofunctor constraints; that final comparison remains an explicit gap.

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
For a faithfully flat commutative ring map R→A, the functor M↦(A⊗R M,canonical datum) is an equivalence from ModuleCat R to module descent data. An inverse is the equalizer M={n∈N | 1⊗n=θ(n⊗1)}, and the comparison A⊗R M→N is an isomorphism.

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

The owned tensor-overlap/action/extension carrier and its scalar-extension coherence have not been implemented; the all-test-object DescentData equivalence is an explicit gap. Native coalgebras exist and are not being replaced. No placeholder type or unspecified proposition is introduced.

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

