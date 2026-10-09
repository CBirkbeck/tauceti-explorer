/-
Suggested Lean forms for layer SF.1 (descent, algebraic spaces and algebraic stacks) of the
roadmap "Scheme, stack, cohomology and intersection foundations".

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/SchemeAndStackFoundations--SF.1.md` is definitive. The statements
below suggest Lean forms for the declarations the roadmap names, so that contributors and
reviewers converge on names and signatures. Every proof, and every construction whose data is a
milestone of the roadmap, is `sorry`. Where a statement needs an object that neither Mathlib nor
this file can name yet, it is recorded as a comment naming the declaration and its owner, never
as a `Prop`-valued placeholder.

Conventions: schemes are Mathlib's `Scheme.{u}`; the big sites are Mathlib's `Scheme.fppfTopology`,
`Scheme.fpqcTopology` and `Scheme.etaleTopology`; presheaves of sets are functors
`Scheme.{u}ᵒᵖ ⥤ Type u`; stacks are Mathlib `Pseudofunctor`s with `IsStack`; group actions are left
actions. The algebraic-space predicate of the whole-roadmap SF.1 nodes is restated below so that the
file elaborates on its own.

Independent review REV-SchemeAndStackFoundations--SF.1: this is an incomplete suggested file.
Several packet APIs still have only comment entries, and some existing signatures only express
a weaker comparison. The gaps in the packet identify them. Elaboration checks the signatures
that are present; it does not prove the planned mathematics or certify the omitted interfaces.
-/
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.Morphisms.FormallyUnramified
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Group.Affine
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Descent.Precoverage
import Mathlib.CategoryTheory.Sites.Descent.DescentDataAsCoalgebra
import Mathlib.CategoryTheory.Sites.PseudofunctorSheafOver
import Mathlib.CategoryTheory.Sites.NonabelianCohomology.H1
import Mathlib.CategoryTheory.Sites.LocallySurjective
import Mathlib.CategoryTheory.MorphismProperty.Representable
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.Categorical.Basic
import Mathlib.CategoryTheory.Monoidal.Mod
import Mathlib.CategoryTheory.Monoidal.Grp
import Mathlib.CategoryTheory.Monoidal.Cartesian.Over
import Mathlib.CategoryTheory.Bicategory.NaturalTransformation.Pseudo
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Skeletal
import Mathlib.CategoryTheory.Comma.Presheaf.Basic
import Mathlib.Algebra.Category.ModuleCat.Descent
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.FieldTheory.KrullTopology
import Mathlib.GroupTheory.GroupExtension.Defs
import Mathlib.RingTheory.Invariant.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.Algebra.TensorProduct.BaseChange

universe u v w

open _root_.CategoryTheory _root_.CategoryTheory.Limits Opposite _root_.AlgebraicGeometry

set_option linter.unusedVariables false

noncomputable section

namespace TauCeti.SchemeFoundations

/-- Presheaves of sets on the big category of schemes. -/
abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- `Cat`-valued pseudofunctors on schemes, the carriers of stacks. -/
abbrev SchPseudofunctor := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}

/-! ## SF.1a Descent -/

namespace Descent

/-- `QCoh(X)`: the full subcategory of quasi-coherent `𝒪_X`-modules. -/
abbrev QCohCat (X : Scheme.{u}) : Type (u + 1) :=
  (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory

/-- The quasi-coherent pullback pseudofunctor (`SF.1/qcoh-pseudofunctor`): the restriction of
`Scheme.Modules.pseudofunctor` (left adjoints) to quasi-coherent modules. -/
def qcohPseudofunctor : SchPseudofunctor.{u} := sorry

lemma qcohPseudofunctor_obj (X : Scheme.{u}) :
    Nonempty ((qcohPseudofunctor.obj ⟨op X⟩ : Cat.{u, u + 1}) ≌ QCohCat X) := sorry

/-- Pullback preserves quasi-coherence, so the functors of `qcohPseudofunctor` are restrictions of
`Scheme.Modules.pullback`. -/
lemma qcohPseudofunctor_map {X Y : Scheme.{u}} (f : X ⟶ Y) (M : QCohCat Y) :
    SheafOfModules.isQuasicoherent X.ringCatSheaf ((Scheme.Modules.pullback f).obj M.obj) := sorry

lemma qcohPseudofunctor_mapComp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    Nonempty (Scheme.Modules.pullback g ⋙ Scheme.Modules.pullback f ≅
      Scheme.Modules.pullback (f ≫ g)) := sorry

/-- The fibrewise inclusion `QCoh(X) ⥤ X.Modules`; these functors form a strong transformation to
the left-adjoint part of `Scheme.Modules.pseudofunctor`. -/
def qcohPseudofunctor_forget (X : Scheme.{u}) : QCohCat X ⥤ X.Modules := ObjectProperty.ι _

/-- `QCoh(Spec R) ≌ ModuleCat R` by global sections and `tilde`. -/
def qcohSpecEquiv (R : CommRingCat.{u}) : QCohCat (Spec R) ≌ ModuleCat.{u} R := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_empty
example (M : QCohCat Scheme.empty.{u}) : IsZero M := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_spec
example (R : CommRingCat.{u}) : Nonempty (QCohCat (Spec R) ≌ ModuleCat.{u} R) := ⟨qcohSpecEquiv R⟩

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_extension_by_zero
-- (witness: the extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ`)
example : ∃ M : (Spec (CommRingCat.of ℤ)).Modules,
    ¬ SheafOfModules.isQuasicoherent (Spec (CommRingCat.of ℤ)).ringCatSheaf M := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_pullback_rational
example : IsZero ((Scheme.Modules.pullback
    (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj
      (tilde (ModuleCat.of ℤ (ZMod 2)))) := sorry

/-- Fpqc descent for quasi-coherent sheaves (`SF.1/qcoh-fpqc-descent`). -/
theorem qcohFpqcDescent : (qcohPseudofunctor.{u}).IsStack Scheme.fpqcTopology := sorry

/-- The pseudofunctor of affine `S`-schemes (the full subcategory of `Over S` on affine morphisms). -/
def affinePseudofunctor : SchPseudofunctor.{u} := sorry

lemma affinePseudofunctor_obj (S : Scheme.{u}) :
    Nonempty ((affinePseudofunctor.obj ⟨op S⟩ : Cat.{u, u + 1}) ≌
      ObjectProperty.FullSubcategory (fun X : Over S => IsAffineHom X.hom)) := sorry

/-- Fpqc descent of affine morphisms (`SF.1/affine-fpqc-descent`); the single faithfully flat
morphism case is the ModularCurves 0E import. -/
theorem affineFpqcDescent : (affinePseudofunctor.{u}).IsStack Scheme.fpqcTopology := sorry

/- `SF.1/galois-descent-quasi-projective`. For a surjective finite locally free `p : Y' ⟶ Y` and
`V ⟶ Y'` quasi-projective (or with an ample invertible sheaf), every descent datum on `V` relative
to `p` is effective. Not typed here: Mathlib has no quasi-projective morphisms or ample invertible
sheaves at the pinned commit; owner `SchemeAndStackFoundations:SF.0` for those notions. -/

/-- Sheaves on a site form a stack (`SF.1/sheaf-stack`). -/
theorem sheafIsStack {C : Type u} [Category.{v} C] (J : GrothendieckTopology C) :
    (J.pseudofunctorOver (Type w)).IsStack J := sorry

end Descent

/-! ## SF.1b Algebraic spaces -/

namespace Spaces

/-- Restated from the whole-roadmap node `SF.1/representable-diagonal`. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

/-- Restated from the whole-roadmap node `SF.1/etale-atlas`. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

/-- Restated from the whole-roadmap node `SF.1/algebraic-space`. -/
def IsAlgebraicSpace (F : SchemePresheaf.{u}) : Prop :=
  Presheaf.IsSheaf Scheme.fppfTopology F ∧ RepresentableDiagonal F ∧
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a

lemma IsAlgebraicSpace.of_scheme (X : Scheme.{u}) : IsAlgebraicSpace (yoneda.obj X) := sorry

/-- The object property of being an algebraic space. -/
def isAlgebraicSpace : ObjectProperty SchemePresheaf.{u} := fun F => IsAlgebraicSpace F

/-- The category of algebraic spaces (`SF.1/algebraic-space-category`). -/
abbrev AlgSpace : Type (u + 1) := (isAlgebraicSpace.{u}).FullSubcategory

def AlgSpace.toPresheaf : AlgSpace.{u} ⥤ SchemePresheaf.{u} := ObjectProperty.ι _

def AlgSpace.ofScheme : Scheme.{u} ⥤ AlgSpace.{u} :=
  ObjectProperty.lift _ yoneda (fun X => IsAlgebraicSpace.of_scheme X)

def AlgSpace.ofScheme_fullyFaithful : (AlgSpace.ofScheme.{u}).FullyFaithful := sorry

/-- Algebraic spaces over `S` in the sense of the Stacks Project, on the induced fppf site of
`Over S`. -/
def IsAlgebraicSpaceOver (S : Scheme.{u}) (F : (Over S)ᵒᵖ ⥤ Type u) : Prop :=
  Presheaf.IsSheaf (Scheme.fppfTopology.over S) F ∧
    (yoneda : Over S ⥤ _).relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F)) ∧
    ∃ (U : Over S) (a : yoneda.obj U ⟶ F),
      MorphismProperty.presheaf (MorphismProperty.inverseImage (@Etale : MorphismProperty Scheme.{u}) (Over.forget S)) a ∧
      MorphismProperty.presheaf
        (MorphismProperty.inverseImage (@Surjective : MorphismProperty Scheme.{u}) (Over.forget S)) a

lemma AlgSpace.overEquiv (S : Scheme.{u}) :
    Nonempty (Over (AlgSpace.ofScheme.obj S) ≌
      ObjectProperty.FullSubcategory (IsAlgebraicSpaceOver S)) := sorry

def AlgSpace.isTerminal_ofScheme_specZ :
    IsTerminal (AlgSpace.ofScheme.{u}.obj (Spec (CommRingCat.of (ULift.{u} ℤ)))) := sorry

def AlgSpace.isInitial_ofScheme_empty : IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_galois_endomorphisms
-- (a quadratic Galois extension `K / ℚ`, e.g. `ℚ(i)`: identity and conjugation)
example (K : Type) [Field K] [Algebra ℚ K] [IsGalois ℚ K] (hK : Module.finrank ℚ K = 2) :
    Nat.card {f : AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) ⟶
        AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) //
      f ≫ AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K))) =
        AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)))} = 2 := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_empty_initial
example : Nonempty (IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty)) :=
  ⟨AlgSpace.isInitial_ofScheme_empty⟩

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_yoneda
example (X Y : Scheme.{u}) :
    Function.Bijective (fun f : X ⟶ Y => AlgSpace.ofScheme.map f) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_constant_not_space
example : ¬ IsAlgebraicSpace ((Functor.const Scheme.{u}ᵒᵖ).obj (ULift.{u} Bool)) := sorry

/-- An equivalence relation of schemes, `(t, s) : R ⟶ U × U` a monomorphism inducing equivalence
relations on `T`-points. -/
structure IsEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop where
  mono : Mono (prod.lift t s)
  equivalence : ∀ T : Scheme.{u},
    _root_.Equivalence (fun a b : T ⟶ U => ∃ r : T ⟶ R, r ≫ t = a ∧ r ≫ s = b)

/-- Etale equivalence relations (`SF.1/etale-equivalence-relation`). -/
structure EtaleEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop extends IsEquivRel s t where
  etale_s : Etale s
  etale_t : Etale t

namespace EtaleEquivRel

variable {U R : Scheme.{u}} {s t : R ⟶ U}

lemma refl (h : EtaleEquivRel s t) : ∃ e : U ⟶ R, e ≫ s = 𝟙 U ∧ e ≫ t = 𝟙 U := sorry

lemma symm (h : EtaleEquivRel s t) : ∃ i : R ⟶ R, i ≫ s = t ∧ i ≫ t = s := sorry

lemma trans (h : EtaleEquivRel s t) :
    ∃ c : pullback s t ⟶ R, c ≫ s = pullback.snd s t ≫ s ∧ c ≫ t = pullback.fst s t ≫ t := sorry

lemma restrict (h : EtaleEquivRel s t) {U' : Scheme.{u}} (g : U' ⟶ U) [Etale g] :
    EtaleEquivRel (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst) := sorry

lemma ofAtlas (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ yoneda.map s ≫ a = yoneda.map t ≫ a :=
  sorry

end EtaleEquivRel

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_diagonal
example (U : Scheme.{u}) : EtaleEquivRel (𝟙 U) (𝟙 U) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_fold
example (U : Scheme.{u}) :
    EtaleEquivRel (pullback.fst (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)))
      (pullback.snd (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_folded_line
-- (R = Δ ⊔ Γ with Γ = {(x, -x) : x ≠ 0}, char k ≠ 2)
example (k : Type u) [Field k] (hk : (2 : k) ≠ 0) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ Spec (CommRingCat.of (Polynomial k))),
      EtaleEquivRel s t ∧ ¬ IsIso s := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_full_relation_not_etale
example (k : Type u) [Field k] :
    let p := Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))
    ¬ EtaleEquivRel (pullback.fst p p) (pullback.snd p p) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_double_diagonal
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k)
    ¬ EtaleEquivRel (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)) := sorry

/-- The fppf quotient sheaf of a pre-relation (`SF.1/quotient-sheaf`). -/
def quotientSheaf {U R : Scheme.{u}} (s t : R ⟶ U) : Sheaf Scheme.fppfTopology.{u} (Type u) := sorry

namespace quotientSheaf

variable {U R : Scheme.{u}} (s t : R ⟶ U)

def π : yoneda.obj U ⟶ (quotientSheaf s t).obj := sorry

lemma desc (F : Sheaf Scheme.fppfTopology.{u} (Type u)) (f : yoneda.obj U ⟶ F.obj)
    (hf : yoneda.map s ≫ f = yoneda.map t ≫ f) :
    ∃! g : (quotientSheaf s t).obj ⟶ F.obj, π s t ≫ g = f := sorry

lemma kernelPair (h : IsEquivRel s t) :
    IsPullback (yoneda.map s) (yoneda.map t) (π s t) (π s t) := sorry

lemma restrict {U' : Scheme.{u}} (g : U' ⟶ U) [Flat g] [LocallyOfFinitePresentation g]
    [Surjective g] :
    Nonempty ((quotientSheaf (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst)).obj ≅ (quotientSheaf s t).obj) :=
  sorry

lemma represented_of {M : Scheme.{u}} (q : U ⟶ M) (hq : s ≫ q = t ≫ q)
    (h₁ : Presheaf.IsLocallySurjective Scheme.fppfTopology (yoneda.map q))
    (h₂ : Presheaf.IsLocallySurjective Scheme.fppfTopology
      (yoneda.map (pullback.lift t s hq.symm))) :
    Nonempty ((quotientSheaf s t).obj ≅ yoneda.obj M) := sorry

end quotientSheaf

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_diagonal
example (U : Scheme.{u}) : Nonempty ((quotientSheaf (𝟙 U) (𝟙 U)).obj ≅ yoneda.obj U) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_swap
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k) ⨿ Spec (CommRingCat.of k)
    let sw : U ⟶ U := coprod.desc coprod.inr coprod.inl
    Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) sw)).obj ≅
      yoneda.obj (Spec (CommRingCat.of k))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_sheafification_needed
-- (a quadratic Galois extension `L / K`, e.g. `ℂ / ℝ`, with `σ` the nontrivial automorphism of
-- `Spec L` over `Spec K`: `Spec L` has no `Spec K`-point over `K`, the quotient sheaf has one)
example (K L : Type u) [Field K] [Field L] [Algebra K L] [IsGalois K L]
    (hL : Module.finrank K L = 2) (σ : Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of L))
    (hσ : σ ≠ 𝟙 _)
    (hσK : σ ≫ Spec.map (CommRingCat.ofHom (algebraMap K L)) =
      Spec.map (CommRingCat.ofHom (algebraMap K L))) :
    let U := Spec (CommRingCat.of L)
    let p := Spec.map (CommRingCat.ofHom (algebraMap K L))
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ U // f ≫ p = 𝟙 _} ∧
      Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) σ)).obj.obj
        (op (Spec (CommRingCat.of K)))) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_hopf_compat — restricted to affine
`R`-schemes, the quotient sheaf of an affine group by a normal closed subgroup `V(I)` is Tau Ceti's
`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`. Not typed: the restriction from the big fppf site of
schemes to Tau Ceti's site `CommAlgCat.fppfTopology R` is not a named functor at the pins. -/

/-- Quotients of schemes by etale equivalence relations (`SF.1/etale-quotient-theorem`). -/
theorem etaleQuotientTheorem {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    IsAlgebraicSpace (quotientSheaf s t).obj ∧ EtaleAtlas (quotientSheaf s t).obj U (quotientSheaf.π s t) :=
  sorry

/-- Fppf descent of separated locally quasi-finite morphisms (`SF.1/quasi-finite-descent`). -/
theorem quasiFiniteDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u})
      (pullback.snd p (yoneda.map (f i)))) :
    MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u}) p := sorry

/-- Presentations of algebraic spaces (`SF.1/space-presentation`). -/
theorem spacePresentation (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ Nonempty ((quotientSheaf s t).obj ≅ F) :=
  sorry

/-- The topological space `|X|` of an algebraic space (`SF.1/space-points`). -/
def points (F : AlgSpace.{u}) : TopCat.{u} := sorry

def points_map {F G : AlgSpace.{u}} (f : F ⟶ G) : points F ⟶ points G := sorry

lemma points_ofScheme (X : Scheme.{u}) :
    Nonempty (points (AlgSpace.ofScheme.obj X) ≅ (X.carrier : TopCat.{u})) := sorry

lemma points_atlas_surjective (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : EtaleAtlas F.obj U a) :
    Function.Surjective (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) ∧
      IsOpenMap (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) := sorry

/- api: TauCeti.SchemeFoundations.Spaces.opensEquiv — open subspaces of `X` correspond to the opens of
`|X|`. Not typed: open subspaces (representable open immersions into `X`) are not yet a named
object property; owner `SF.1/space-points`. -/

-- test: TauCeti.SchemeFoundations.Spaces.points.test_field
example (k : Type u) [Field k] : Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) ∧
    Nonempty (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.points.test_galois
-- (for a quadratic extension `L / K`, e.g. `ℂ / ℝ`, `|Spec L|` is one point although `Spec L` has two
-- `K`-automorphisms)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of L)))) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.points.test_folded_line — the closed points of the folded
line over an algebraically closed field are the origin and the pairs `{x, -x}`; and
test: TauCeti.SchemeFoundations.Spaces.points.test_no_residue_field — the generic point of `𝔸¹/ℤ`
(characteristic zero) is represented by no monomorphism from the spectrum of a field. Both concern
the explicit quotients of `SF.1/folded-line-space` and `SF.1/translation-quotient-space`, whose
equivalence relations are not constructed in this file. -/

/-- Properties of morphisms of algebraic spaces defined etale locally (`SF.1/etale-local-properties`). -/
def EtaleLocal (P : MorphismProperty Scheme.{u}) {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∃ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj) (h : U ⟶ V),
    EtaleAtlas F.obj U a ∧ MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b ∧
      a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b ∧ P h

namespace EtaleLocal

variable (P : MorphismProperty Scheme.{u}) [P.IsLocalAtSource Scheme.etalePrecoverage]
  [P.IsLocalAtTarget Scheme.etalePrecoverage]
  (hpost : ∀ {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z),
    IsOpenImmersion g → P f → P (f ≫ g))

-- Stacks 35.32.6 needs postcomposition with open immersions in addition to the two locality
-- instances. Include it in every comparison theorem, rather than silently dropping it.
include hpost

lemma iff_forall_square {F G : AlgSpace.{u}} (f : F ⟶ G) :
    EtaleLocal P f ↔ ∀ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj)
      (h : U ⟶ V), EtaleAtlas F.obj U a → MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b →
        a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b → P h := sorry

lemma ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) : EtaleLocal P (AlgSpace.ofScheme.map f) ↔ P f :=
  sorry

lemma iff_presheaf [P.IsStableUnderBaseChange] [P.IsLocalAtTarget Scheme.fppfPrecoverage] {F G : AlgSpace.{u}} (f : F ⟶ G)
    (hf : yoneda.relativelyRepresentable (isAlgebraicSpace.ι.map f)) :
    EtaleLocal P f ↔ MorphismProperty.presheaf P (isAlgebraicSpace.ι.map f) := sorry

lemma comp [P.IsStableUnderComposition] {F G H : AlgSpace.{u}} (f : F ⟶ G) (g : G ⟶ H)
    (hf : EtaleLocal P f) (hg : EtaleLocal P g) : EtaleLocal P (f ≫ g) := sorry

/- api: TauCeti.SchemeFoundations.Spaces.EtaleLocal.baseChange — stability under base change, stated
with the fibre products of `SF.1/space-fibre-products` (`AlgSpace.pullbackObj` below). -/
lemma baseChange [P.IsStableUnderBaseChange] {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hf : EtaleLocal P f) :
    ∃ (W : AlgSpace.{u}) (q : W ⟶ G), Nonempty (W.obj ≅ pullback (isAlgebraicSpace.ι.map f)
      (isAlgebraicSpace.ι.map g)) ∧ EtaleLocal P q := sorry

end EtaleLocal

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_identity
example (F : AlgSpace.{u}) : EtaleLocal (@Etale : MorphismProperty Scheme.{u}) (𝟙 F) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_scheme
example {X Y : Scheme.{u}} (f : X ⟶ Y) :
    EtaleLocal (@Smooth : MorphismProperty Scheme.{u}) (AlgSpace.ofScheme.map f) ↔ Smooth f := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_atlas
example {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    EtaleLocal (@Etale : MorphismProperty Scheme.{u})
      (ObjectProperty.homMk (quotientSheaf.π s t) :
        AlgSpace.ofScheme.obj U ⟶ (⟨(quotientSheaf s t).obj, (etaleQuotientTheorem h).1⟩ : AlgSpace.{u})) :=
  sorry

/- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_closed_immersion_not_local — for the
identity of `𝔸¹`, the chart square with top arrow the identity has a closed immersion while the
chart square with top arrow the fold map `𝔸¹ ⊔ 𝔸¹ ⟶ 𝔸¹` does not; closed immersion is not etale
local on the source, so `EtaleLocal @IsClosedImmersion` is not square-independent. -/
example (k : Type u) [Field k] :
    let A := Spec (CommRingCat.of (Polynomial k))
    IsClosedImmersion (𝟙 A) ∧ ¬ IsClosedImmersion (coprod.desc (𝟙 A) (𝟙 A)) := sorry

/-- Fibre products of algebraic spaces (`SF.1/space-fibre-products`). -/
theorem isAlgebraicSpace_pullback {F G H : SchemePresheaf.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hF : IsAlgebraicSpace F) (hG : IsAlgebraicSpace G) (hH : IsAlgebraicSpace H) :
    IsAlgebraicSpace (pullback f g) := sorry

/-- The fibre product in `AlgSpace`. -/
def AlgSpace.pullbackObj {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) : AlgSpace.{u} :=
  ⟨pullback (isAlgebraicSpace.ι.map f) (isAlgebraicSpace.ι.map g),
    isAlgebraicSpace_pullback _ _ F.property G.property H.property⟩

def AlgSpace.pullbackFst {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) :
    AlgSpace.pullbackObj f g ⟶ F := ObjectProperty.homMk (pullback.fst _ _)

def AlgSpace.pullbackSnd {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) :
    AlgSpace.pullbackObj f g ⟶ G := ObjectProperty.homMk (pullback.snd _ _)

theorem ofScheme_relativelyRepresentable (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) :
    yoneda.relativelyRepresentable a := sorry

theorem ofScheme_preservesPullback {X Y Z : Scheme.{u}} (f : X ⟶ Z) (g : Y ⟶ Z) :
    Nonempty ((AlgSpace.pullbackObj (AlgSpace.ofScheme.map f) (AlgSpace.ofScheme.map g)).obj ≅
      yoneda.obj (pullback f g)) := sorry

/-- Separation axioms and properness (`SF.1/separation-properness-spaces`). -/
def IsSeparatedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  MorphismProperty.presheaf (@IsClosedImmersion : MorphismProperty Scheme.{u})
    (pullback.diagonal (isAlgebraicSpace.ι.map f))

def QuasiSeparatedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  MorphismProperty.presheaf (@QuasiCompact : MorphismProperty Scheme.{u})
    (pullback.diagonal (isAlgebraicSpace.ι.map f))

def QuasiCompactSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∀ (V : Scheme.{u}) [IsAffine V] (v : AlgSpace.ofScheme.obj V ⟶ G),
    CompactSpace (points (AlgSpace.pullbackObj v f))

def UniversallyClosedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∀ (Z : AlgSpace.{u}) (g : Z ⟶ G), IsClosedMap (points_map (AlgSpace.pullbackFst g f))

def IsProperSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  IsSeparatedSpace f ∧ EtaleLocal (@LocallyOfFiniteType : MorphismProperty Scheme.{u}) f ∧
    QuasiCompactSpace f ∧ UniversallyClosedSpace f

lemma diagonal_representable {F G : AlgSpace.{u}} (f : F ⟶ G) :
    yoneda.relativelyRepresentable (pullback.diagonal (isAlgebraicSpace.ι.map f)) := sorry

lemma IsSeparated.ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) :
    IsSeparatedSpace (AlgSpace.ofScheme.map f) ↔ IsSeparated f := sorry

lemma QuasiSeparated.iff_affine_charts (F : AlgSpace.{u}) :
    MorphismProperty.presheaf (@QuasiCompact : MorphismProperty Scheme.{u})
        (pullback.diagonal (terminal.from F.obj)) ↔
      ∀ (U V : Scheme.{u}) [IsAffine U] [IsAffine V] (a : yoneda.obj U ⟶ F.obj)
        (b : yoneda.obj V ⟶ F.obj),
        ∃ W : Scheme.{u}, Nonempty (pullback a b ≅ yoneda.obj W) ∧ CompactSpace W := sorry

/- api: TauCeti.SchemeFoundations.Spaces.IsSeparated.iff_affine_charts — `X` is separated iff for
affine `U, V ⟶ X` the scheme `U ×_X V` is affine and `𝒪(U) ⊗ 𝒪(V) ⟶ 𝒪(U ×_X V)` is surjective
(Stacks 0AHS). Not typed here: it needs the chart fibre product as a chosen scheme with its global
sections map, which `ofScheme_relativelyRepresentable` provides only up to choice. -/

lemma IsProper.baseChange {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) (hf : IsProperSpace f) :
    IsProperSpace (AlgSpace.pullbackSnd f g) := sorry


/-- The small etale site `X_ét` of an algebraic space (`SF.1/small-etale-site`): etale morphisms from
schemes to `X`, as a full subcategory of presheaves over `X`. -/
def smallEtale (F : AlgSpace.{u}) : Type (u + 1) :=
  ObjectProperty.FullSubcategory (fun (X : Over F.obj) =>
    ∃ U : Scheme.{u}, Nonempty (X.left ≅ yoneda.obj U) ∧
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) X.hom)

instance (F : AlgSpace.{u}) : Category.{u + 1} (smallEtale F) := by
  unfold smallEtale; infer_instance

/-- The etale topology on `X_ét`. -/
def smallEtaleTopology (F : AlgSpace.{u}) : GrothendieckTopology (smallEtale F) := sorry

/-- The structure sheaf `𝒪_X : U ↦ Γ(U, 𝒪_U)` on `X_ét`. -/
def structureSheaf (F : AlgSpace.{u}) : Sheaf (smallEtaleTopology F) CommRingCat.{u} := sorry

lemma smallEtale_ofScheme (X : Scheme.{u}) :
    Nonempty (smallEtale (AlgSpace.ofScheme.obj X) ≌ X.Etale) := sorry

/-- Inverse image on small-etale sheaves. Base change of a scheme chart need not be a scheme;
construct the site map on etale algebraic spaces and transport through the comparison equivalence.
The adjunction and structural ring map are still missing APIs of `SF.1/small-etale-site`. -/
def smallEtale_map {F G : AlgSpace.{u}} (f : F ⟶ G) :
    Sheaf (smallEtaleTopology G) (Type u) ⥤ Sheaf (smallEtaleTopology F) (Type u) := sorry

lemma smallEtale_localize (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a) :
    Nonempty (Over (⟨Over.mk a, ⟨U, ⟨Iso.refl _⟩, ha⟩⟩ : smallEtale F) ≌ U.Etale) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_spec_global_sections
example (R : CommRingCat.{u}) :
    Nonempty ((structureSheaf (AlgSpace.ofScheme.obj (Spec R))).obj.obj
      (op ⟨Over.mk (𝟙 (yoneda.obj (Spec R))), ⟨Spec R, ⟨Iso.refl _⟩, sorry⟩⟩) ≅ R) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_folded_line_functions — for the folded line
(char k ≠ 2) the global sections of `𝒪_X` are `k[x²]`; it concerns the explicit quotient of
`SF.1/folded-line-space`, not constructed in this file. -/

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_separably_closed
example (k : Type u) [Field k] [IsSepClosed k] (U : Scheme.{u}) (f : U ⟶ Spec (CommRingCat.of k))
    [Etale f] [Surjective f] : ∃ s : Spec (CommRingCat.of k) ⟶ U, s ≫ f = 𝟙 _ := sorry

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_not_big_site
example (k : Type u) [Field k] :
    ¬ Etale (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) := sorry

/-- Quasi-coherent modules on an algebraic space (`SF.1/space-quasi-coherent`): quasi-coherent
modules on the ringed site `(X_ét, 𝒪_X)`. The carrier is `sorry` because the sheaf-of-modules
instances of Mathlib's `IsQuasicoherent` are not available for the large site `X_ét`. -/
def QCoh (F : AlgSpace.{u}) : Type (u + 1) := sorry

instance (F : AlgSpace.{u}) : Category.{u} (QCoh F) := sorry

def QCoh.pullback {F G : AlgSpace.{u}} (f : F ⟶ G) : QCoh G ⥤ QCoh F := sorry

def QCoh.ofSchemeEquiv (X : Scheme.{u}) : QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X := sorry

/- api: TauCeti.SchemeFoundations.Spaces.QCoh.presentationEquiv — for a presentation `(U, R)` of `X`,
`QCoh(X)` is equivalent to quasi-coherent modules on the groupoid `(U, R)` (Stacks 03M3); and
api: TauCeti.SchemeFoundations.Spaces.QCoh.invertible_aut — automorphisms of an invertible module are
`Γ(X, 𝒪_X)ˣ`. Not typed: quasi-coherent modules on groupoids and invertible modules on `X_ét` are not
named objects at the pins; owner `SF.1/space-quasi-coherent`. -/

-- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_scheme
example (X : Scheme.{u}) : Nonempty (QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X) :=
  ⟨QCoh.ofSchemeEquiv X⟩

-- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_empty
example (M : QCoh (AlgSpace.ofScheme.{u}.obj Scheme.empty)) : IsZero M := sorry

/- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_folded_line_structure_sheaf — `Γ(X, 𝒪_X) = k[x²]`
for the folded line; test: TauCeti.SchemeFoundations.Spaces.QCoh.test_extension_by_zero — the
extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ` is not quasi-coherent (the scheme case is
`Descent.QCoh.test_extension_by_zero`). -/

/- `SF.1/folded-line-space` (theorem): for char k ≠ 2, `𝔸¹_k/(Δ ⊔ Γ)` is a quasi-separated
algebraic space, not locally separated, hence not a scheme, with `Γ(X, 𝒪_X) = k[x²]`.
`SF.1/translation-quotient-space` (theorem): in characteristic zero `𝔸¹_k/ℤ` is an algebraic space
that is not quasi-separated and has a point without residue field. Not typed: the explicit etale
equivalence relations `Δ ⊔ Γ` and `ℤ × 𝔸¹` are not constructed in this file; the existence form of
the first is `EtaleEquivRel.test_folded_line`. -/

end Spaces

/-! ## SF.1c Group spaces, torsors and quotients -/

namespace Groups

open Spaces _root_.CategoryTheory.MonoidalCategory _root_.CategoryTheory.CartesianMonoidalCategory

/-- Fibre products make presheaves over `h_S` cartesian monoidal. -/
noncomputable instance (A : SchemePresheaf.{u}) : CartesianMonoidalCategory (Over A) :=
  Over.cartesianMonoidalCategory A

/-- A group algebraic space over a scheme `S` (`SF.1/group-action`). -/
structure GroupSpace (S : Scheme.{u}) where
  obj : Over (yoneda.obj S)
  isSpace : IsAlgebraicSpace obj.left
  [grp : GrpObj obj]

attribute [instance] GroupSpace.grp

/-- An action of a group space on an object over `h_S`: Mathlib's `ModObj` for the self-action of
the cartesian monoidal category. -/
abbrev Action {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) : Type _ := ModObj G.obj X

/-- The action morphism `G × X ⟶ X` of a `ModObj` structure. -/
def act {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    G.obj ⊗ X ⟶ X := ModObj.smul (M := G.obj) (X := X)

/-- Freeness on `T`-points: an element acting trivially on a point is the identity. -/
def Action.IsFree {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    Prop :=
  ∀ (T : Over (yoneda.obj S)) (g : T ⟶ G.obj) (x : T ⟶ X),
    lift g x ≫ act G X = x → g = toUnit T ≫ MonObj.one

lemma Action.free_iff_mono {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    Action.IsFree G X ↔ Mono (lift (act G X) (snd G.obj X)) := sorry

/- api: TauCeti.SchemeFoundations.Groups.Action.baseChange — actions pull back along `S' ⟶ S`.
Not typed: transporting `GrpObj`/`ModObj` along `Over.pullback` needs the monoidal structure of
the pullback functor, which is not packaged at the pins. -/

lemma Action.constantEquiv (R : Type u) [CommRing R] (Γ : Type u) [Group Γ] [Finite Γ]
    (X : Over (Spec (CommRingCat.of R))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme R Γ).X X ≃ (Γ →* Aut X)) := sorry

-- test: TauCeti.SchemeFoundations.Groups.Action.test_translation_free
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Action.IsFree G G.obj := sorry

-- test: TauCeti.SchemeFoundations.Groups.Action.test_scaling_not_free
-- (`𝔾_m` acting on `𝔸¹` by scaling, over `Spec k`; stated as non-injectivity of `(a, pr₂)` on points)
example (k : Type u) [Field k] (c : kˣ) (hc : c ≠ 1) : (c : k) * 0 = ((1 : kˣ) : k) * 0 := by simp

-- test: TauCeti.SchemeFoundations.Groups.Action.test_constant_group
example (k : Type u) [Field k] (Γ : Type u) [Group Γ] [Finite Γ] (hΓ : Nat.card Γ = 2)
    (X : Over (Spec (CommRingCat.of k))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme k Γ).X X ≃ (Γ →* Aut X)) :=
  Action.constantEquiv k Γ X

-- test: TauCeti.SchemeFoundations.Groups.Action.test_trivial_group
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) : Subsingleton (ModObj (𝟙_ (Over (yoneda.obj S))) X) :=
  sorry

/-- A groupoid in algebraic spaces (`SF.1/groupoid-space`): `(U, R, s, t, c)` inducing groupoids on
`T`-points. -/
structure Groupoid where
  U : SchemePresheaf.{u}
  R : SchemePresheaf.{u}
  hU : IsAlgebraicSpace U
  hR : IsAlgebraicSpace R
  s : R ⟶ U
  t : R ⟶ U
  c : pullback s t ⟶ R
  c_s : c ≫ s = pullback.snd s t ≫ s
  c_t : c ≫ t = pullback.fst s t ≫ t
  assoc : ∀ (T : Scheme.{u}) (a b d : yoneda.obj T ⟶ R) (hab : a ≫ s = b ≫ t) (hbd : b ≫ s = d ≫ t),
    pullback.lift (pullback.lift a b hab ≫ c) d (by sorry) ≫ c =
      pullback.lift a (pullback.lift b d hbd ≫ c) (by sorry) ≫ c
  identity : U ⟶ R
  identity_s : identity ≫ s = 𝟙 U
  identity_t : identity ≫ t = 𝟙 U
  inverse : R ⟶ R
  inverse_s : inverse ≫ s = t
  inverse_t : inverse ≫ t = s
  left_unit : ∀ (T : Scheme.{u}) (r : yoneda.obj T ⟶ R),
    pullback.lift (r ≫ t ≫ identity) r (by sorry) ≫ c = r
  right_unit : ∀ (T : Scheme.{u}) (r : yoneda.obj T ⟶ R),
    pullback.lift r (r ≫ s ≫ identity) (by sorry) ≫ c = r
  left_inverse : ∀ (T : Scheme.{u}) (r : yoneda.obj T ⟶ R),
    pullback.lift (r ≫ inverse) r (by sorry) ≫ c = r ≫ s ≫ identity
  right_inverse : ∀ (T : Scheme.{u}) (r : yoneda.obj T ⟶ R),
    pullback.lift r (r ≫ inverse) (by sorry) ≫ c = r ≫ t ≫ identity

namespace Groupoid

lemma e (G : Groupoid.{u}) : ∃ e : G.U ⟶ G.R, e ≫ G.s = 𝟙 _ ∧ e ≫ G.t = 𝟙 _ :=
  ⟨G.identity, G.identity_s, G.identity_t⟩

lemma i (G : Groupoid.{u}) : ∃ i : G.R ⟶ G.R, i ≫ G.s = G.t ∧ i ≫ G.t = G.s :=
  ⟨G.inverse, G.inverse_s, G.inverse_t⟩

/- API `Groupoid.Hom` and `Groupoid.Hom.ext`: pairs of maps on objects and arrows commuting
with source, target and composition, with identities and composition. Still not typed here;
owner `SF.1/groupoid-space`. The unit/inverse equations above are actual axioms. -/

/-- The action groupoid `(X, G × X, pr₂, a, c)` of an action, viewed as absolute presheaves on schemes. -/
def ofAction {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
    (hX : IsAlgebraicSpace X.left) : Groupoid.{u} := sorry

lemma ofAction_U {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
    (hX : IsAlgebraicSpace X.left) : (ofAction G X hX).U = X.left := sorry

/-- The groupoid of an equivalence relation of schemes. -/
def ofEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) (h : IsEquivRel s t) : Groupoid.{u} := sorry

/-- Restriction of a groupoid along `g : U' ⟶ U`. -/
def restrict (G : Groupoid.{u}) (U' : SchemePresheaf.{u}) (hU' : IsAlgebraicSpace U') (g : U' ⟶ G.U) :
    Groupoid.{u} := sorry

/-- The presheaf of groupoids `T ↦ (U(T), R(T))`, recorded as the prestack fed to
`Stacks.stackification`. -/
def toPresheafOfGroupoids (G : Groupoid.{u}) : SchPseudofunctor.{u} := sorry

end Groupoid

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_trivial
example (U : Scheme.{u}) :
    ∃ G : Groupoid.{u}, G.U = yoneda.obj U ∧ IsIso G.s ∧ IsIso G.t := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_action_trivial_group
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    (G : GroupSpace S) (hG : IsTerminal G.obj) [ModObj G.obj X] :
    IsIso (Groupoid.ofAction G X hX).s := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_indiscrete
example (U : Scheme.{u}) (h : IsEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst) :
    (Groupoid.ofEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst h).U = yoneda.obj U := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_monoid_not_groupoid
-- (the additive monoid `ℕ` acting on `𝔸¹` by translation: no inverses on points)
example : ¬ ∃ m : ℕ, 1 + m = 0 := by omega

-- A one-object category with Bool arrows and composition AND has an identity (true), but its
-- false arrow has no inverse. Existence of an arbitrary map named inverse must not admit it.
example : ¬ ∃ b : Bool, (false && b) = true := by simp

/-- The stabilizer group space of a groupoid (`SF.1/stabilizer`): `j⁻¹(Δ_U)`. -/
def stabilizer (G : Groupoid.{u}) : Over G.U :=
  Over.mk (pullback.fst (prod.lift G.t G.s) (prod.lift (𝟙 G.U) (𝟙 G.U)) ≫ G.s)

lemma stabilizer_points (G : Groupoid.{u}) (T : Scheme.{u}) (r : yoneda.obj T ⟶ G.R) :
    (∃ x : yoneda.obj T ⟶ (stabilizer G).left, x ≫ pullback.fst _ _ = r) ↔ r ≫ G.t = r ≫ G.s := sorry

/- api: TauCeti.SchemeFoundations.Groups.stabilizer_baseChange — formation of the stabilizer commutes
with base change along `B' ⟶ B` and with restriction along `U' ⟶ U`. Not typed: `Groupoid.restrict`
is a `sorry`-construction whose underlying object is not exposed, so the comparison cannot be
stated against it. -/

lemma free_iff_stabilizer_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] (hX : IsAlgebraicSpace X.left) :
    Action.IsFree G X ↔ IsIso (stabilizer (Groupoid.ofAction G X hX)).hom := sorry

/-- The stabilizer of a field-valued point. -/
def stabilizerAt (G : Groupoid.{u}) (K : Type u) [Field K] (x : yoneda.obj (Spec (CommRingCat.of K)) ⟶ G.U) :
    SchemePresheaf.{u} :=
  pullback (stabilizer G).hom x

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_trivial_action
-- (trivial action: the stabilizer is all of `G × X`)
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    [ModObj G.obj X] (htriv : act G X = snd G.obj X) :
    IsIso (pullback.fst (prod.lift (Groupoid.ofAction G X hX).t (Groupoid.ofAction G X hX).s)
      (prod.lift (𝟙 _) (𝟙 _))) := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_translation
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsIso (stabilizer (Groupoid.ofAction G G.obj G.isSpace)).hom := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_scaling
-- (`𝔾_m` on `𝔸¹`: the stabilizer is `Spec k[x, λ, λ⁻¹]/((λ - 1) x)`; its fibre over `x = 0` is `𝔾_m`)
example (k : Type u) [Field k] (x : k) (c : kˣ) : (c : k) * x = x ↔ (c = 1 ∨ x = 0) := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_mu_p_nonreduced
-- (`μ_p` at the origin in characteristic `p`: one point, nonreduced coordinate ring `k[λ]/(λᵖ - 1)`)
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    (Polynomial.X - 1 : Polynomial k) ^ p = Polynomial.X ^ p - 1 := sorry

/-- Sheaf torsors, without algebraic-space representability (`SF.1/torsor`). -/
structure IsSheafTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P] :
    Prop where
  isSheaf : Presheaf.IsSheaf Scheme.fppfTopology P.left
  pseudo : IsIso (lift (act G P) (snd G.obj P))
  locallyTrivial : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
    Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
      ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)

/-- Algebraic-space torsors: sheaf torsors whose underlying sheaf is an algebraic space. -/
structure IsTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    : Prop extends IsSheafTorsor G P where
  isSpace : IsAlgebraicSpace P.left

namespace Torsor

lemma trivial {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := sorry

lemma trivial_iff_section {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (h : IsTorsor G P) :
    (letI : ModObj G.obj G.obj := ModObj.regular G.obj
     ∃ e : G.obj ≅ P, (G.obj ◁ e.hom) ≫ act G P = act G G.obj ≫ e.hom) ↔
      ∃ σ : yoneda.obj S ⟶ P.left, σ ≫ P.hom = 𝟙 _ := sorry

lemma hom_isIso {S : Scheme.{u}} (G : GroupSpace S) (P Q : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj Q] (hP : IsTorsor G P) (hQ : IsTorsor G Q) (φ : P ⟶ Q)
    (hφ : (G.obj ◁ φ) ≫ act G Q = act G P ≫ φ) : IsIso φ := sorry

/- api: TauCeti.SchemeFoundations.Groups.Torsor.baseChange — torsors pull back along `S' ⟶ S`
(needs the transport of `ModObj` along `Over.pullback`, not packaged at the pins). -/

/- api: TauCeti.SchemeFoundations.Groups.Torsor.cechEquiv — classes of torsors trivialized on a fixed
covering `U` are Mathlib's `PresheafOfGroups.H1 G U`. Typed in `Groups.H1.cechColimit` below for the
colimit. -/

lemma flat_of_flat {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (h : IsTorsor G P) (hG : MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) G.obj.hom) :
    MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) P.hom := sorry

end Torsor

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_trivial
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := Torsor.trivial G

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_mu_p
-- This polynomial computation only detects nonreducedness of the fibre over 1, which DOES
-- have the section 1. The packet's diagnostic etale-triviality test uses s^p = u over F_p(u);
-- its inseparability assertion still needs a typed torsor test in this file.
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    ¬ IsReduced (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ p - 1 : Polynomial k)}) := sorry

/- test: TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_twisted_action — `x · g = x F(g)` on a
positive-dimensional smooth group over `𝔽_p` makes `X(𝔽̄_p)` a `G(𝔽̄_p)`-torsor but `X` is not a
`G`-torsor (Poonen, Warning 5.12.6): `pseudo` fails since `(a, pr₂)` has inseparable degree. -/

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_empty
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (hP : IsInitial P) (hS : Nonempty S) : ¬ IsTorsor G P := sorry

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_galois
-- (for a quadratic Galois extension `L / K`, `Spec L` has no `K`-point over `K`)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ Spec (CommRingCat.of L) //
      f ≫ Spec.map (CommRingCat.ofHom (algebraMap K L)) = 𝟙 _} := sorry

/-- `H¹(S, G)`: isomorphism classes of fppf `G`-torsors (`SF.1/torsor-cohomology`). -/
def H1 {S : Scheme.{u}} (G : GroupSpace S) : Type (u + 1) := sorry

def H1.base {S : Scheme.{u}} (G : GroupSpace S) : H1 G := sorry

/- API `H1.pullback`: H1(G) -> H1(G_B′), or comparison with a supplied G′ through an
isomorphism of group objects over B′. An isomorphism of underlying presheaves is insufficient.
Not typed until group-space base change is exposed; owner `SF.1/torsor-cohomology`. -/

def H1.pushforward {S : Scheme.{u}} {G G' : GroupSpace S} (φ : G.obj ⟶ G'.obj) [IsMonHom φ] :
    H1 G → H1 G' := sorry

/- API `H1.cechColimit`: for a specified fppf covering of S and the presheaf of sections of G,
compare Mathlib Cech H1 with the classes of torsors trivialized by that covering, and take the
colimit over refinements. Neither an arbitrary Grp-valued functor nor an arbitrary family is the
required datum. API `H1.picEquiv` requires the actual multiplicative group space G_m, not an
arbitrary group-space parameter. These comparisons, `H1.ofTorsor` and the abelian group structure
for commutative G are not typed; owner `SF.1/torsor-cohomology`. -/

-- test: TauCeti.SchemeFoundations.Groups.H1.test_trivial_group
example {S : Scheme.{u}} (G : GroupSpace S) (hG : IsTerminal G.obj) : Subsingleton (H1 G) := sorry

-- test: TauCeti.SchemeFoundations.Groups.H1.test_separably_closed
example (k : Type u) [Field k] [IsSepClosed k] (G : GroupSpace (Spec (CommRingCat.of k)))
    (hG : MorphismProperty.presheaf (@Smooth : MorphismProperty Scheme.{u}) G.obj.hom) :
    Subsingleton (H1 G) := sorry

/- test: TauCeti.SchemeFoundations.Groups.H1.test_kummer — `H¹_fppf(Spec ℚ, μ₂) ≅ ℚˣ/(ℚˣ)²`;
test: TauCeti.SchemeFoundations.Groups.H1.test_pic_projective_line — `H¹(ℙ¹_k, 𝔾_m) ≅ ℤ`;
test: TauCeti.SchemeFoundations.Groups.H1.test_not_cech_one_cover — the Čech set of the trivial
covering of `ℙ¹` is a point while `H¹` is `ℤ`. Not typed: `μ₂`, `𝔾_m` and `ℙ¹` as group spaces and
schemes over the given bases are not named in this file. -/

/-- Contracted products `P ×ᴳ X` (`SF.1/contracted-product`). -/
def contractedProduct {S : Scheme.{u}} (G : GroupSpace S) (P X : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj X] : Over (yoneda.obj S) := sorry

lemma contractedProduct_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := sorry

/- api: TauCeti.SchemeFoundations.Groups.contractedProduct_baseChange — compatibility with base change
(needs `ModObj` transport along `Over.pullback`). -/

/-- The inner form `G_P = P ×ᴳ G` for the conjugation action. -/
def innerForm {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (hP : IsTorsor G P) : GroupSpace S := sorry

/-- Pushforward of torsors along a homomorphism `G ⟶ H`. -/
def pushforwardTorsor {S : Scheme.{u}} {G H : GroupSpace S} (φ : G.obj ⟶ H.obj) [IsMonHom φ]
    (P : Over (yoneda.obj S)) [ModObj G.obj P] (hP : IsTorsor G P) : Over (yoneda.obj S) := sorry

-- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_trivial
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := contractedProduct_trivial G X

-- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_point
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj (𝟙_ (Over (yoneda.obj S)))] (h : IsTorsor G P) :
    Nonempty (contractedProduct G P (𝟙_ _) ≅ 𝟙_ _) := sorry

/- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_line_bundle — the frame torsor of a
line bundle with left action λ.p = p λ⁻¹, contracted with the scaling action on `𝔸¹`, is the
total space of that line bundle;
test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_needs_sheafification — for `Spec L`
over `Spec K` (`L / K` quadratic Galois) twisted by itself, the contracted product is
`Spec K ⊔ Spec K`, with `K`-points, while the presheaf quotient has none. -/

/-- Twisting torsors (`SF.1/twisting-bijection`). -/
theorem twistingBijection {S : Scheme.{u}} (G : GroupSpace S) (E : Over (yoneda.obj S)) [ModObj G.obj E]
    (hE : IsTorsor G E) : Nonempty (H1 (innerForm G E hE) ≃ H1 G) := sorry

/-- Representability of torsors and their descent (`SF.1/torsor-representability`). -/
theorem torsorRepresentability {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (h : IsSheafTorsor G P) : IsAlgebraicSpace P.left := sorry

/-- Invariant morphisms, categorical and geometric quotients (`SF.1/categorical-geometric-quotient`),
for a pre-relation `s, t : R ⟶ U` of presheaves. -/
def IsInvariant {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop := s ≫ φ = t ≫ φ

def IsCategoricalQuotient {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  IsAlgebraicSpace X ∧ IsInvariant s t φ ∧
    ∀ (Y : SchemePresheaf.{u}), IsAlgebraicSpace Y → ∀ ψ : U ⟶ Y, IsInvariant s t ψ →
      ∃! χ : X ⟶ Y, φ ≫ χ = ψ

lemma IsCategoricalQuotient.unique {U R X X' : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X)
    (φ' : U ⟶ X') (h : IsCategoricalQuotient s t φ) (h' : IsCategoricalQuotient s t φ') :
    ∃ e : X ≅ X', φ ≫ e.hom = φ' := sorry

/- API `IsGeometricQuotient` has ALL of the geometric-orbit, universal-submersivity and
invariant-functions clauses. It is not replaced by a topological-only predicate here. The
ringed-site equalizer (φ_* O_U)^R and its comparisons must be exposed before typing the carrier;
owner `SF.1/categorical-geometric-quotient`.

API `IsStronglyGeometricQuotient` adds universal submersivity of R -> U ×_X U.
API `IsStronglyGeometricQuotient.isCategoricalQuotient` requires universal openness of φ;
then it gives categoricality among algebraic spaces (Rydh, Theorem 3.16). Geometric quotients
alone do not give that conclusion (Rydh, Remark 2.8). These are still missing typed interfaces. -/

-- test: TauCeti.SchemeFoundations.Groups.Quotient.test_finite_affine
example (A : Type u) [CommRing A] (Γ : Type u) [Group Γ] [Finite Γ] [MulSemiringAction Γ A]
    (Q Q' : Ideal A) [Q.IsPrime] [Q'.IsPrime]
    (h : Q.comap (FixedPoints.subring A Γ).subtype = Q'.comap (FixedPoints.subring A Γ).subtype) :
    ∃ g : Γ, Q.map (MulSemiringAction.toRingHom Γ A g) = Q' := sorry

/- test: TauCeti.SchemeFoundations.Groups.Quotient.test_scaling_plane — `𝔸² ⟶ Spec k` is a
categorical but not geometric quotient for scaling; test: ...test_punctured_plane — `𝔸² ∖ 0 ⟶ ℙ¹`
is a geometric quotient; test: ...test_line_no_geometric — scaling on `𝔸¹` has no geometric
quotient. Not typed: `𝔾_m` actions on `𝔸²` and `ℙ¹` are not constructed in this file. -/

/-- Quotients by finite groups (`SF.1/finite-group-quotient`), affine case on points. -/
theorem finiteGroupQuotient_affine (A : Type u) [CommRing A] (Γ : Type u) [Group Γ] [Finite Γ]
    [MulSemiringAction Γ A] : ((FixedPoints.subring A Γ).subtype).IsIntegral := sorry

/-- Artin's theorem on fppf quotients (`SF.1/artin-bootstrap`), sheaf-with-cover form. -/
theorem artinBootstrap (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (U : SchemePresheaf.{u}) (hU : IsAlgebraicSpace U) (a : U ⟶ F)
    (ha : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F), IsAlgebraicSpace (pullback a y))
    (hflat : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F) (V : Scheme.{u}) (b : yoneda.obj V ⟶ pullback a y),
      EtaleAtlas (pullback a y) V b →
        ∃ h : V ⟶ T, yoneda.map h = b ≫ pullback.snd a y ∧ Flat h ∧ LocallyOfFinitePresentation h)
    (hsurj : Presheaf.IsLocallySurjective Scheme.fppfTopology a) :
    IsAlgebraicSpace F := sorry

/-- Fppf descent of algebraic spaces (`SF.1/space-fppf-descent`), in the fppf-local form. -/
theorem spaceFppfDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, IsAlgebraicSpace (pullback p (yoneda.map (f i)))) : IsAlgebraicSpace F := sorry

end Groups


/-! ## SF.1d Algebraic stacks (carrier) -/

namespace Stacks

open Spaces

/-- A stack in groupoids over the big fppf site of schemes (`SF.1/stack-in-groupoids`). -/
structure StackInGroupoids where
  toPseudofunctor : SchPseudofunctor.{u}
  isGroupoid : ∀ T : Scheme.{u}, IsGroupoid (toPseudofunctor.obj ⟨op T⟩)
  isStack : toPseudofunctor.IsStack Scheme.fppfTopology

/-- 1-morphisms of stacks are strong transformations. -/
abbrev StackInGroupoids.Hom (X Y : StackInGroupoids.{u}) : Type _ :=
  Pseudofunctor.StrongTrans X.toPseudofunctor Y.toPseudofunctor

/-- A 1-morphism of stacks is an equivalence iff it is a fibrewise equivalence. -/
def IsFibrewiseEquiv {P Q : SchPseudofunctor.{u}} (f : Pseudofunctor.StrongTrans P Q) : Prop :=
  ∀ T : Scheme.{u}, ((Pseudofunctor.StrongTrans.app f ⟨op T⟩).toFunctor).IsEquivalence

/-- The stack in setoids of an fppf sheaf. -/
def StackInGroupoids.ofSheaf (F : Sheaf Scheme.fppfTopology.{u} (Type u)) : StackInGroupoids.{u} := sorry

-- test: TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_qcoh_not_groupoid
example : ¬ ∀ T : Scheme.{u}, IsGroupoid (Descent.qcohPseudofunctor.obj ⟨op T⟩) := sorry

end Stacks

/-! ## SF.1f Crossed modules -/

namespace GaloisGerbs

/-- A crossed module `∂ : H̃ ⟶ H` with an action of `H` on `H̃` (`SF.1/crossed-module-category`). -/
structure CrossedModule (Ht H : Type u) [Group Ht] [Group H] where
  bd : Ht →* H
  act : H →* MulAut Ht
  peiffer₁ : ∀ (h : H) (x : Ht), bd (act h x) = h * bd x * h⁻¹
  peiffer₂ : ∀ x y : Ht, act (bd x) y = x * y * x⁻¹

-- test: TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_peiffer_needed
example : ¬ ∃ C : CrossedModule (Equiv.Perm (Fin 3)) (Equiv.Perm (Fin 3)),
    C.bd = MonoidHom.id _ ∧ ∀ h, C.act h = 1 := sorry

end GaloisGerbs

/- ## Declarations of SF.1d-SF.1f not yet typed in this file

The corrected packet specifies each of the following. These entries are names, not Lean signatures
or executable tests, and do not discharge the packet's API/test requirements. The reader document
still needs regeneration to agree with the review's corrections. The remaining work is explicit
in the packet's gaps and partial coverage record.

* `SF.1/stack-in-groupoids`: API `TauCeti.SchemeFoundations.Stacks.StackInGroupoids`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.ofSheaf`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.yonedaEquiv`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.isFiberedInGroupoids`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.limit`; tests `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_scheme`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_torsors`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_qcoh_not_groupoid`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_trivial_torsor_prestack`.
* `SF.1/stackification`: API `TauCeti.SchemeFoundations.Stacks.stackification`, `TauCeti.SchemeFoundations.Stacks.stackification.η`, `TauCeti.SchemeFoundations.Stacks.stackification.lift`, `TauCeti.SchemeFoundations.Stacks.stackification.isom_sheafify`, `TauCeti.SchemeFoundations.Stacks.stackification.locally_essSurj`; tests `TauCeti.SchemeFoundations.Stacks.stackification.test_stack`, `TauCeti.SchemeFoundations.Stacks.stackification.test_sheafification`, `TauCeti.SchemeFoundations.Stacks.stackification.test_real_torsors`.
* `SF.1/two-fibre-product`: API `TauCeti.SchemeFoundations.Stacks.twoFiberProduct`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.fst`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.snd`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.iso`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.lift`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.ofSheaf`; tests `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_identity`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_schemes`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_classifying`.
* `SF.1/representable-stack-morphism`: API `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces`, `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.baseChange`, `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.comp`, `TauCeti.SchemeFoundations.Stacks.diag_representable_iff`, `TauCeti.SchemeFoundations.Stacks.RepresentableProperty`; tests `TauCeti.SchemeFoundations.Stacks.Representable.test_identity`, `TauCeti.SchemeFoundations.Stacks.Representable.test_spaces`, `TauCeti.SchemeFoundations.Stacks.Representable.test_point_to_BG`, `TauCeti.SchemeFoundations.Stacks.Representable.test_BG_to_point`.
* `SF.1/algebraic-stack`: API `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.diagonal`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.atlas`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.ofSpace`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.twoFiberProduct`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.of_equiv`; tests `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_scheme`, `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_BGm`, `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_qcoh`.
* `SF.1/deligne-mumford-stack`: API `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.iff_unramified_diagonal`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.isAlgebraic`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.ofSpace`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.twoFiberProduct`; tests `TauCeti.SchemeFoundations.Stacks.DM.test_space`, `TauCeti.SchemeFoundations.Stacks.DM.test_finite_etale`, `TauCeti.SchemeFoundations.Stacks.DM.test_mu_p`, `TauCeti.SchemeFoundations.Stacks.DM.test_BGm`.
* `SF.1/inertia`: API `TauCeti.SchemeFoundations.Stacks.inertia`, `TauCeti.SchemeFoundations.Stacks.inertia.equivDiagonal`, `TauCeti.SchemeFoundations.Stacks.inertia.representable`, `TauCeti.SchemeFoundations.Stacks.relativeInertia`, `TauCeti.SchemeFoundations.Stacks.automorphismGroup`; tests `TauCeti.SchemeFoundations.Stacks.inertia.test_space`, `TauCeti.SchemeFoundations.Stacks.inertia.test_BG`, `TauCeti.SchemeFoundations.Stacks.inertia.test_S3`.
* `SF.1/stack-morphism-properties`: API `TauCeti.SchemeFoundations.Stacks.SmoothLocal`, `TauCeti.SchemeFoundations.Stacks.SmoothLocal.atlas_independent`, `TauCeti.SchemeFoundations.Stacks.IsSeparatedStack`, `TauCeti.SchemeFoundations.Stacks.IsProperStack`, `TauCeti.SchemeFoundations.Stacks.IsProperStack.of_representable`, `TauCeti.SchemeFoundations.Stacks.IsProperStack.baseChange`; tests `TauCeti.SchemeFoundations.Stacks.Properties.test_BG_finite`, `TauCeti.SchemeFoundations.Stacks.Properties.test_BGm`, `TauCeti.SchemeFoundations.Stacks.Properties.test_doubled_origin`, `TauCeti.SchemeFoundations.Stacks.Properties.test_projective_line`.
* `SF.1/quotient-stack`: API `TauCeti.SchemeFoundations.Stacks.quotientStack`, `TauCeti.SchemeFoundations.Stacks.actionQuotient`, `TauCeti.SchemeFoundations.Stacks.actionQuotient.torsorEquiv`, `TauCeti.SchemeFoundations.Stacks.quotientStack.π`, `TauCeti.SchemeFoundations.Stacks.quotientStack.isCartesian`, `TauCeti.SchemeFoundations.Stacks.quotientStack.desc`, `TauCeti.SchemeFoundations.Stacks.quotientStack.torsor`; tests `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_trivial_group`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_BG_points`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_real_points`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_torsor`.
* `SF.1/root-stack`: API `TauCeti.SchemeFoundations.Stacks.rootStack`, `TauCeti.SchemeFoundations.Stacks.rootStack.baseChange`, `TauCeti.SchemeFoundations.Stacks.rootStack.one`, `TauCeti.SchemeFoundations.Stacks.rootStack.isIso_away`, `TauCeti.SchemeFoundations.Stacks.rootStack.affineChart`, `TauCeti.SchemeFoundations.Stacks.rootStack.isDeligneMumford_iff`, `TauCeti.SchemeFoundations.Stacks.rootStack.transition`; tests `TauCeti.SchemeFoundations.Stacks.rootStack.test_n_one`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_dvr_chart`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_fibre_nonreduced`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_char_p`.
* `SF.1/stack-quasi-coherent`: API `TauCeti.SchemeFoundations.Stacks.QCoh`, `TauCeti.SchemeFoundations.Stacks.QCoh.pullback`, `TauCeti.SchemeFoundations.Stacks.QCoh.presentationEquiv`, `TauCeti.SchemeFoundations.Stacks.QCoh.pushforward`, `TauCeti.SchemeFoundations.Stacks.QCoh.ofSpaceEquiv`; tests `TauCeti.SchemeFoundations.Stacks.QCoh.test_scheme`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_representations`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_pushforward_invariants`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_not_exact`.
* `SF.1/moduli-functor`: API `TauCeti.SchemeFoundations.Moduli.moduliFunctor`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.map`, `TauCeti.SchemeFoundations.Moduli.toModuliSheaf`, `TauCeti.SchemeFoundations.Moduli.isSetoid_iff_moduliFunctor`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor_classifying`; tests `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_space`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_classifying`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_not_sheaf`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_empty`.
* `SF.1/fine-moduli-space`: API `TauCeti.SchemeFoundations.Moduli.FineModuliSpace`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.universal`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.unique`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.inertia_trivial`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.toCoarse`; tests `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_space`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_BG`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_torsor_quotient`.
* `SF.1/coarse-moduli-space`: API `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.unique`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.ofFine`, `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace.quotient_iff`, `TauCeti.SchemeFoundations.Moduli.IsUniform`; tests `TauCeti.SchemeFoundations.Moduli.Coarse.test_space`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_BG`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_finite_quotient`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_base_change_fails`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_A1_Gm`.
* `SF.1/tame-stack`: API `TauCeti.SchemeFoundations.Moduli.IsTame`, `TauCeti.SchemeFoundations.Moduli.IsTame.classifying_iff`, `TauCeti.SchemeFoundations.Moduli.IsTame.baseChange`, `TauCeti.SchemeFoundations.Moduli.IsTame.geometric_fibres`; tests `TauCeti.SchemeFoundations.Moduli.Tame.test_space`, `TauCeti.SchemeFoundations.Moduli.Tame.test_invertible_order`, `TauCeti.SchemeFoundations.Moduli.Tame.test_Z_mod_p`, `TauCeti.SchemeFoundations.Moduli.Tame.test_mu_p`.
* `SF.1/semilinear-automorphism`: API `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.toPointsAut`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.comp`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.standard`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.linear_iff`; tests `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_gm_conjugation`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_identity_not_semilinear`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_trivial_extension`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_standard_points`.
* `SF.1/stack-points`: API `Stacks.points`, `Stacks.points_map`, `Stacks.points_ofSpace`,
  `Stacks.points_atlas`, `Stacks.opensEquiv`; tests scheme comparison, a one-point `BG` with
  nontrivial automorphisms, and disjoint unions/empty stack. The algebraic-stack carrier and its
  smooth-atlas comparison must be typed first; owner `SF.1/stack-points`.
* `SF.1/crossed-module-category`: still missing the quotient groupoid's category structure,
  `CrossedModule.tensorHom`, `CrossedModule.conjugationFunctor` and `CrossedModule.mapFunctor`,
  including the interchange law and monoidal comparison. Naming tensor on objects alone is
  insufficient; owner `SF.1/crossed-module-category`.
* Corrections to the still untyped declarations: rootStack DM criterion requires a DM base;
  stack QCoh pushforward is the quasi-coherent right adjoint (Stacks 103.11), not arbitrary
  big-site pushforward; the empty moduli functor is h_empty (singleton at the empty scheme);
  the universal object over a space is a stack morphism h_M -> X; tame local charts use the
  2014 AOV corrigendum's cotangent-complex obstruction; conjugators descend the kernel
  transporter by a lift-independent semilinear action, with no additional lift equations on
  the base-changed transporter; semilinear automorphisms do not depend on Galois gerbs.
* Theorems `SF.1/setoid-criterion`, `SF.1/stack-presentation`, `SF.1/quotient-stack-algebraic`, `SF.1/line-bundle-section-stack`, `SF.1/keel-mori`, `SF.1/finite-quotient-coarse`, `SF.1/tame-local-structure`, `SF.1/galois-descent-affine`, `SF.1/conjugator-representability`.
-/

end TauCeti.SchemeFoundations
