import Mathlib.CategoryTheory.Bicategory.Functor.LocallyDiscrete
import Mathlib.CategoryTheory.Bicategory.Modification.Pseudo
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Quotient
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.RingTheory.Invariant.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.LinearlyReductive
import TauCeti.Algebra.Coalgebra.Comodule.Fixed

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures; they claim no implementation.

The pinned libraries provide pseudofunctors, actual stack descent and schemes.
They have no algebraic-stack, algebraic-space, inertia or coarse-space carrier.
Consequently the site-level prototypes below omit algebraicity and the closed,
flat, finitely presented representability conditions on the inertia subgroup.
The finite-span section is the scheme specialization. The image and relative
normalization sections use the native scheme constructions, not copies of them.
The omission ledger at the end gives exact missing geometric signatures and
fixtures. No missing condition is replaced by an arbitrary proposition field.
All admitted results are proposed signatures, not checked mathematical proofs.
-/

open CategoryTheory CategoryTheory.Limits Opposite AlgebraicGeometry
open scoped CategoryTheory.Bicategory CategoryTheory.Pseudofunctor.StrongTrans

universe u v w
namespace TauCeti.ArithmeticModuli

section Site
variable {C : Type u} [Category.{u} C]
  (J : GrothendieckTopology C)
  (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u})

/-- The normal inertia subsheaf interface. Geometry is omitted as described above. -/
structure NormalInertiaSubgroup where
  subgroup (U : C) (x : F.obj (.mk (op U))) : Subgroup (Aut x)
  normal (U : C) (x : F.obj (.mk (op U))) : (subgroup U x).Normal
  conjugation {U : C} {x y : F.obj (.mk (op U))} (e : x ≅ y) :
    Subgroup.map (Aut.autMulEquivOfIso e).toMonoidHom (subgroup U x) = subgroup U y
  restrict_mem {U V : C} (f : V ⟶ U) (x : F.obj (.mk (op U))) (a : Aut x) :
    a ∈ subgroup U x →
      (F.map (.toLoc f.op)).toFunctor.mapAut x a ∈
        subgroup V ((F.map (.toLoc f.op)).toFunctor.obj x)
  cover_mem {U : C} (x : F.obj (.mk (op U))) (a : Aut x)
      (R : Sieve U) (hR : R ∈ J U) :
    (∀ (V : C) (f : V ⟶ U), R f →
      (F.map (.toLoc f.op)).toFunctor.mapAut x a ∈
        subgroup V ((F.map (.toLoc f.op)).toFunctor.obj x)) → a ∈ subgroup U x

namespace NormalInertiaSubgroup
variable {J F}

lemma local_mem (G : NormalInertiaSubgroup J F) {U : C}
    (x : F.obj (.mk (op U))) (a : Aut x) (R : Sieve U) (hR : R ∈ J U) :
    a ∈ G.subgroup U x ↔ ∀ (V : C) (f : V ⟶ U), R f →
      (F.map (.toLoc f.op)).toFunctor.mapAut x a ∈
        G.subgroup V ((F.map (.toLoc f.op)).toFunctor.obj x) := by sorry

/-- Identity subgroup; the Hom-sheaf hypothesis is needed for local membership. -/
noncomputable def bottom [F.IsStack J] : NormalInertiaSubgroup J F := by sorry

/-- Full inertia as a subsheaf. Geometric flatness and finite presentation are omitted. -/
noncomputable def top : NormalInertiaSubgroup J F := by sorry

-- NormalInertiaSubgroup.test_bottom
example [F.IsStack J] (U : C) (x : F.obj (.mk (op U))) (a : Aut x) :
    a ∈ (bottom : NormalInertiaSubgroup J F).subgroup U x ↔ a = 1 := by sorry

-- NormalInertiaSubgroup.test_noncentral: the group fixture for B(S₃).
example : Equiv.swap (0 : Fin 3) 1 ∈ (⊤ : Subgroup (Equiv.Perm (Fin 3))) ∧
    Equiv.swap (0 : Fin 3) 1 ∉ Subgroup.center (Equiv.Perm (Fin 3)) := by sorry

-- NormalInertiaSubgroup.test_not_normal
example : ¬ (Subgroup.closure {Equiv.swap (0 : Fin 3) 1}).Normal := by sorry

-- NormalInertiaSubgroup.test_base_change: the native restriction part of the μ_p test.
-- The algebraic Bμ_p/nonreduced-scheme fixture still needs the SF.1 carriers.
example (G : NormalInertiaSubgroup J F) {U V : C} (f : V ⟶ U)
    (x : F.obj (.mk (op U))) (a : Aut x) (ha : a ∈ G.subgroup U x) :
    (F.map (.toLoc f.op)).toFunctor.mapAut x a ∈
      G.subgroup V ((F.map (.toLoc f.op)).toFunctor.obj x) := by sorry

end NormalInertiaSubgroup

namespace Rigidification
variable {J F} (G : NormalInertiaSubgroup J F)

/-- The actual normal Hom relation; it precedes sheafification and stackification. -/
def relation (U : C) : HomRel (F.obj (.mk (op U))) :=
  fun {x} {_y} f g ↦ ∃ a : Aut x, a ∈ G.subgroup U x ∧ a.hom ≫ f = g

/-- Sheaf quotient followed by object descent, not the sectionwise category quotient. -/
noncomputable def stack (G : NormalInertiaSubgroup J F) [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))] :
    LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

noncomputable def map [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))] : F ⟶ stack G := by sorry

instance isGroupoid [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))] (U : C) :
    IsGroupoid ((stack G).obj (.mk (op U))) := by sorry

instance isStack [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))] : (stack G).IsStack J := by sorry

/-- The quotient of the actual slice Hom presheaf, sheafified for J.over U. -/
noncomputable def quotientHom (G : NormalInertiaSubgroup J F) (U : C) (x y : F.obj (.mk (op U))) :
    Sheaf (J.over U) (Type u) := by sorry

noncomputable def homSheaf [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (U : C) (x y : F.obj (.mk (op U))) :
    (stack G).sheafHom J
      (((map G).app (.mk (op U))).toFunctor.obj x)
      (((map G).app (.mk (op U))).toFunctor.obj y) ≅ quotientHom G U x y := by sorry

/-- Essential surjectivity is local on the base, not on all global objects. -/
theorem locallyObjects [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (U : C) (y : (stack G).obj (.mk (op U))) :
    ∃ R : Sieve U, R ∈ J U ∧ ∀ (V : C) (f : V ⟶ U), R f →
      ∃ x : F.obj (.mk (op V)), Nonempty
        (((map G).app (.mk (op V))).toFunctor.obj x ≅
          ((stack G).map (.toLoc f.op)).toFunctor.obj y) := by sorry

/-- A real predicate on the actual automorphism maps, not an assumed factorization. -/
def Kills {H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}} (φ : F ⟶ H) : Prop :=
  ∀ (U : C) (x : F.obj (.mk (op U))) (a : Aut x), a ∈ G.subgroup U x →
    ((φ.app (.mk (op U))).toFunctor.mapAut x) a = 1

/-- Full Hom-category equivalence, retaining compatible modifications. -/
noncomputable def universal [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}) [H.IsStack J]
    [∀ U : C, IsGroupoid (H.obj (.mk (op U)))] :
    (stack G ⟶ H) ≌ (ObjectProperty.FullSubcategory (Kills G (H := H))) := by sorry

theorem stabilizer_kernel [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (U : C) (x : F.obj (.mk (op U))) (a : Aut x) :
    ((map G).app (.mk (op U))).toFunctor.mapAut x a = 1 ↔ a ∈ G.subgroup U x :=
  by sorry

/-- Actual automorphism-sheaf map, not a surjection of global section sets. -/
noncomputable def autSheafMap [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (U : C) (x : F.obj (.mk (op U))) :
    F.sheafHom J x x ⟶ (stack G).sheafHom J
      (((map G).app (.mk (op U))).toFunctor.obj x)
      (((map G).app (.mk (op U))).toFunctor.obj x) := by sorry

theorem stabilizer_epi [F.IsStack J]
    [∀ U : C, IsGroupoid (F.obj (.mk (op U)))]
    (U : C) (x : F.obj (.mk (op U))) : Epi (autSheafMap G U x) := by sorry

-- Rigidification.test_trivial: comparison as an equivalence of native fibre categories.
example [F.IsStack J] [∀ U : C, IsGroupoid (F.obj (.mk (op U)))] (U : C) :
    Nonempty ((stack (NormalInertiaSubgroup.bottom (J := J) (F := F))).obj
      (.mk (op U)) ≌ F.obj (.mk (op U))) := by sorry

-- Rigidification.test_cyclic_four: the residual-stabilizer algebra fixture.
example : Nat.card
    (Multiplicative (ZMod 4) ⧸ Subgroup.closure {Multiplicative.ofAdd (2 : ZMod 4)}) = 2 :=
  by sorry

-- Rigidification.test_sheaf_quotient: global sections cannot lift -1 under squaring.
-- The fppf quotient-sheaf comparison itself is in the omission ledger.
example : ¬ ∃ x : ℝ, x * x = -1 := by sorry

end Rigidification
end Site

section Schemes
variable {S X Y V : Scheme.{u}}

/-- Scheme specialization retaining both legs and their common base map. -/
structure FiniteCorrespondence (x : X ⟶ S) (y : Y ⟶ S) where
  apex : Scheme.{u}
  left : apex ⟶ X
  right : apex ⟶ Y
  over_eq : left ≫ x = right ≫ y
  finite_left : IsFinite left
  finite_right : IsFinite right

namespace FiniteCorrespondence
variable {x : X ⟶ S} {y : Y ⟶ S} {v : V ⟶ S}

noncomputable def identity (x : X ⟶ S) : FiniteCorrespondence x x := by sorry

noncomputable def transpose (a : FiniteCorrespondence x y) :
    FiniteCorrespondence y x := by sorry

noncomputable def compose (a : FiniteCorrespondence x y)
    (b : FiniteCorrespondence y v) : FiniteCorrespondence x v := by sorry

noncomputable def baseChange {S' : Scheme.{u}} (s : S' ⟶ S)
    (a : FiniteCorrespondence x y) :
    FiniteCorrespondence (pullback.snd x s) (pullback.snd y s) := by sorry

/-- Scheme joint-map finiteness; DM stacks additionally use the finite separated diagonal. -/
theorem jointFinite (a : FiniteCorrespondence x y) [IsSeparated y] :
    IsFinite (pullback.lift a.left a.right a.over_eq) := by sorry

/-- The double-cover fixture does not replace its apex by its image. -/
noncomputable def empty (x : X ⟶ S) (y : Y ⟶ S) :
    FiniteCorrespondence x y := by sorry

noncomputable def diagonal {Z : Scheme.{u}} (f : Z ⟶ X) [IsFinite f]
    (x : X ⟶ S) : FiniteCorrespondence x x := by sorry

-- FiniteCorrespondence.test_identity
example (x : X ⟶ S) :
    (identity x).apex = X ∧ HEq (identity x).left (𝟙 X) ∧
      HEq (identity x).right (𝟙 X) := by sorry

-- FiniteCorrespondence.test_double_point: specializes to Spec(k×k)→Spec(k).
-- This signature deliberately admits a nonmonomorphic finite f and retains its apex.
example {Z : Scheme.{u}} (f : Z ⟶ X) [IsFinite f] (hf : ¬ Mono f)
    (x : X ⟶ S) : (diagonal f x).apex = Z ∧
      HEq (diagonal f x).left f ∧ HEq (diagonal f x).right f ∧ ¬ Mono f := by sorry

-- FiniteCorrespondence.test_two_legs: specializes to A¹_k→Spec(k).
example {Z : Scheme.{u}} (g : Z ⟶ Y) (y : Y ⟶ S) (hg : ¬ IsFinite g) :
    ¬ ∃ a : FiniteCorrespondence (g ≫ y) y,
      a.apex = Z ∧ HEq a.left (𝟙 Z) ∧ HEq a.right g := by sorry

-- FiniteCorrespondence.test_empty
example (b : FiniteCorrespondence y v) : (empty x y).apex = (∅ : Scheme.{u}) ∧
    IsEmpty (compose (empty x y) b).apex := by sorry

-- The actual middle object, both projection equations and finiteness are tested together.
theorem composition (a : FiniteCorrespondence x y) (b : FiniteCorrespondence y v) :
    (compose a b).apex = pullback a.right b.left ∧
      HEq (compose a b).left (pullback.fst a.right b.left ≫ a.left) ∧
      HEq (compose a b).right (pullback.snd a.right b.left ≫ b.right) := by sorry

/-- The actual two-point map used to instantiate the parameterized span test. -/
noncomputable def doublePointMap (k : Type u) [Field k] :
    Spec (CommRingCat.of (k × k)) ⟶ Spec (CommRingCat.of k) :=
  Spec.map (CommRingCat.ofHom ((RingHom.id k).prod (RingHom.id k)))

example (k : Type u) [Field k] : IsFinite (doublePointMap k) ∧
    ¬ Mono (doublePointMap k) ∧ Nat.card (PrimeSpectrum (k × k)) = 2 := by sorry

end FiniteCorrespondence

/- Native scheme schematic images. These wrappers name the scheme specialization
   of the new stack interface; the existing Mathlib construction is imported. -/
namespace DMSchematicClosure
variable {X Y : Scheme.{u}} (f : X ⟶ Y)

noncomputable abbrev stack : Scheme.{u} := f.image
noncomputable abbrev factor : X ⟶ stack f := f.toImage

lemma factor_eq : factor f ≫ f.imageι = f := by sorry

lemma minimal (I : Y.IdealSheafData) (h : I ≤ f.ker) :
    ∃ g : stack f ⟶ I.subscheme, g ≫ I.subschemeι = f.imageι := by sorry

lemma flatBaseChange {Y' : Scheme.{u}} (g : Y' ⟶ Y) [Flat g] [QuasiCompact f] :
    ∃ e : (pullback.snd f g).image ≅ pullback f.imageι g,
      e.hom ≫ pullback.snd f.imageι g = (pullback.snd f g).imageι := by sorry

lemma schemeComparison : stack f = f.image := by sorry

-- DMSchematicClosure.test_scheme_comparison
example : stack f = f.image ∧ factor f ≫ f.imageι = f := by sorry

end DMSchematicClosure

/- Native relative normalization, supplying the scheme chart interface.
   Ordinary normalization requires SF.0's generic-point source; this section
   does not normalize the identity map or claim the result is ordinarily normal. -/
namespace DMNormalization
variable {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f]

noncomputable abbrev stack : Scheme.{u} := f.normalization
noncomputable abbrev map : stack f ⟶ Y := f.fromNormalization

/-- Native relative-normalization smooth comparison, an input to the ordinary adapter. -/
lemma smoothChart {Y' : Scheme.{u}} (g : Y' ⟶ Y) [Smooth g] :
    IsIso (f.normalizationPullback g) := by sorry

lemma schemeComparison : stack f = f.normalization := by sorry

lemma factor : f.toNormalization ≫ map f = f := by sorry

-- DMNormalization.test_scheme_comparison: generic-point adapter is still required.
example : stack f = f.normalization ∧ f.toNormalization ≫ map f = f := by sorry

end DMNormalization
end Schemes

/-!
Geometric omission ledger

Each entry gives the exact packet name and full intended contract. A comment
is not a Lean declaration or an elaborated test. The typed forms above have
the reduced scope specified here; all other signatures await the SF.1 carriers.
Bind the geometric conditions rather than adding fields for desired theorems.

AlgebraicModuliForArithmeticGeometry:R09.5/normal-inertia-subgroup
TauCeti.ArithmeticModuli.NormalInertiaSubgroup
Typed: native subgroup/conjugation/restriction/locality signatures and four reduced fixtures. Missing: representable closed subgroup of I_X, flatness, finite presentation, and all-test-scheme Cartesian subgroup equality. The noncentral fixture checks S3 algebra; the restriction fixture does not construct Bμ_p.
Full contract: For an algebraic stack X locally of finite presentation over S, a rigidifiable inertia subgroup is a closed subgroup G⊂I_X that is flat and finitely presented over X. For every T→X represented by x, it yields G_x⊂Aut_T(x); every base change identifies the pulled-back subgroup, and every isomorphism x≅y conjugates G_x onto G_y. In particular G_x is normal; centrality is not required. The site-level carrier records normal subgroups of native Aut groups, conjugation, restriction and fppf local membership, with the closed/flat/finitely-presented representability conditions imposed at the algebraic-stack interface.
Hypotheses: X is algebraic and locally of finite presentation over S. G is a representable closed subgroup of inertia, flat and finitely presented over X.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.subgroup: Evaluate G at a test object to obtain the subgroup of its native automorphism group.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.conjugation: For e:x≅y, transport by Aut.autMulEquivOfIso e maps G_x exactly onto G_y.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.restrict_mem: Restriction of an automorphism in G_x belongs to the subgroup at the restricted object.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.local_mem: Membership in G_x is equivalent to membership after every arrow of a covering sieve.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.bottom: The identity subgroup gives a rigidifiable subgroup of every algebraic stack.
API TauCeti.ArithmeticModuli.NormalInertiaSubgroup.top: The entire inertia is rigidifiable when the inertia itself is flat and finitely presented.
TEST TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_bottom [degenerate]: In the bottom subgroup, a∈G_x iff a=1.
TEST TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_noncentral [characterisation]: On B(S_3) over a field, the full inertia is allowed although a transposition is not central.
TEST TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_not_normal [non-example]: The subgroup generated by (0 1) in S_3 is not normal and cannot define a conjugation-compatible inertia subgroup of B(S_3).
TEST TauCeti.ArithmeticModuli.NormalInertiaSubgroup.test_base_change [compatibility]: For Bμ_p in characteristic p, the entire finite flat inertia satisfies arbitrary test-scheme restriction, including nonreduced test schemes.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification
TauCeti.ArithmeticModuli.Rigidification.stack
Typed: native stack pseudofunctor, strong transformation, quotient-Hom sheaf, Hom comparison, local lifts and groupoid/stack instances. Missing: algebraicity, geometric finite presentation, and a geometric identification of the quotient sheaf. The C4 fixture checks its quotient group only; the real-square fixture checks absence of a global root only. No Bμ_p fixture is typed.
Full contract: Given X and a rigidifiable G⊂I_X, construct X▹G by replacing the Isom sheaf between x and y over T by its fppf quotient Isom_X(x,y)/G_x, where G_x acts by precomposition, and then stackifying the resulting prestack. Normality identifies the right and left actions and makes composition well defined. The map ρ:X→X▹G has the same locally presented objects and kills precisely G. X▹G is an algebraic stack locally of finite presentation over S. The sheaf quotient is essential: its T-sections need not equal the quotient of the T-section sets.
Hypotheses: The hypotheses of normal-inertia-subgroup. All Hom quotients are taken as fppf sheaves before object descent.
API TauCeti.ArithmeticModuli.Rigidification.stack: Construct the groupoid-valued stack X▹G.
API TauCeti.ArithmeticModuli.Rigidification.map: The restriction-compatible morphism ρ:X→X▹G.
API TauCeti.ArithmeticModuli.Rigidification.quotientHom: The fppf quotient sheaf Isom_X(x,y)/G_x on the slice over the test object.
API TauCeti.ArithmeticModuli.Rigidification.homSheaf: For lifted x,y, Isom_{X▹G}(ρx,ρy) is isomorphic to Rigidification.quotientHom x y.
API TauCeti.ArithmeticModuli.Rigidification.locallyObjects: Every object of X▹G lifts to X on a covering sieve.
API TauCeti.ArithmeticModuli.Rigidification.isStack: The constructed pseudofunctor has effective object descent and Hom sheaves; its fibres are groupoids.
TEST TauCeti.ArithmeticModuli.Rigidification.test_trivial [degenerate]: Rigidifying by the identity inertia subgroup is equivalent to X.
TEST TauCeti.ArithmeticModuli.Rigidification.test_cyclic_four [computation]: For the constant cyclic group C4 and its order-two subgroup, BC4▹C2≃BC2; one residual order-two automorphism remains.
TEST TauCeti.ArithmeticModuli.Rigidification.test_mu_p [computation]: In characteristic p, Bμ_p▹μ_p≃Spec(k), although μ_p is not smooth.
TEST TauCeti.ArithmeticModuli.Rigidification.test_sheaf_quotient [non-example]: For the squaring quotient G_m/μ_2 over R, the fppf quotient is G_m and -1 is a quotient section although it has no square root in R. Sectionwise cosets do not give the quotient sheaf.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal
TauCeti.ArithmeticModuli.Rigidification.universal
Typed: full native Hom-category equivalence with the actual Kills predicate and compatible modifications. Missing: specialization to the geometric site over S.
Full contract: For every stack Y in groupoids over S, precomposition with ρ induces an equivalence of Hom groupoids Hom_S(X▹G,Y) ≃ Hom_S(X,Y)_{G=1}, where the right side is the full subgroupoid of morphisms whose induced automorphism maps kill G on every test object. Thus such a morphism has a factorization together with a comparison 2-isomorphism; the groupoid of factorizations with that fixed comparison is contractible. This is a statement about morphisms and compatible 2-morphisms, not equality of chosen factors.
Hypotheses: X,G,ρ as in rigidification. Y satisfies stack descent; algebraicity of Y is unnecessary.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers
TauCeti.ArithmeticModuli.Rigidification.stabilizer_kernel
Typed: the native kernel equivalence and an epimorphism of actual sheaves of endomorphisms; groupoid fibres identify these with automorphism sheaves. Missing: geometric quotient-group-algebraic-space identification. This does not assert surjectivity on global sections.
Full contract: For x∈X(T), the map Aut_T(x)→Aut_T(ρx) is an epimorphism of fppf group sheaves with kernel G_x; consequently Aut_T(ρx)≅Aut_T(x)/G_x as fppf sheaves. This need not be a surjection on T-valued automorphisms.
Hypotheses: X,G,ρ as in rigidification.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-geometry
TauCeti.ArithmeticModuli.Rigidification.geometry
Omitted: SF.1 must supply algebraic stack morphisms, gerbes, and their smooth/proper/étale properties. In particular the smooth stack morphism BG→T does not require a smooth group G.
Full contract: ρ is an fppf gerbe, smooth and of finite presentation as a morphism of algebraic stacks. It is proper when G→X is finite, and étale when G→X is étale. If X is Deligne–Mumford, then X▹G is Deligne–Mumford and ρ is étale. Smoothness of ρ does not say that G is smooth or that ρ is representable. When G is nontrivial, ρ is not representable.
Hypotheses: X,G,ρ as in rigidification. The proper and étale assertions have the extra subgroup hypotheses stated.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change
TauCeti.ArithmeticModuli.Rigidification.base_change
Omitted: geometric base and target-gerbe two-pullback comparison, including the pulled-back subgroup and the compatibility two-isomorphism.
Full contract: For any morphism S′→S, (X×_S S′)▹(G×_S S′)≃(X▹G)×_S S′, compatibly with ρ and quotient Hom sheaves. More generally, pulling the gerbe ρ back along T→X▹G gives the rigidification by the pulled-back subgroup. No flatness or tameness assumption on S′→S is needed.
Hypotheses: X,G,ρ as in rigidification. The subgroup is pulled back with the stack, not held fixed as a group of global sections.

AlgebraicModuliForArithmeticGeometry:R09.5/nested-rigidification
TauCeti.ArithmeticModuli.Rigidification.nested
Omitted: geometric descended subgroup G/H, its closed/flat/finitely-presented conditions, and the comparison equivalence over S.
Full contract: Suppose H⊂G⊂I_X are compatible closed normal subgroup stacks flat and finitely presented over X, and the descended quotient G/H on X▹H is also closed, flat and finitely presented. Then (X▹H)▹(G/H)≃X▹G, compatibly with the maps from X. On stabilizers the composite removes exactly G; the order of removal is governed by H⊂G and cannot be interchanged for arbitrary unrelated subgroups.
Hypotheses: Both rigidifications are defined with the listed geometric subgroup conditions.

AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse
TauCeti.ArithmeticModuli.Rigidification.coarse
Omitted: algebraic-space coarse universal property and geometric-point condition. SF.1 owns that coarse definition.
Full contract: X admits a coarse moduli space π:X→M iff X▹G does; the same M works, and π factors through ρ. The two coarse morphisms have the same universal algebraic-space targets and geometric isomorphism classes. This does not make X▹G fine: it can retain stabilizers and nontrivial forms.
Hypotheses: X,G,ρ as in rigidification. Coarse moduli space means the SF.1 definition, universal among all algebraic spaces.

AlgebraicModuliForArithmeticGeometry:R09.5/vertical-kernel-rigidification
TauCeti.ArithmeticModuli.Rigidification.vertical_kernel
Omitted: relative inertia, the geometric factorization two-isomorphism, and representability by algebraic spaces. Normality alone cannot replace flatness of the kernel.
Full contract: For a morphism f:X→Y of algebraic stacks, let G=I_{X/Y}=ker(I_X→f*I_Y). If this kernel is a closed subgroup flat and finitely presented over X, there is a factorization X→X▹G→Y with a comparison 2-isomorphism, and the final map is representable by algebraic spaces. The rigidification has the universal property of killing the vertical inertia. No such factorization by this construction is asserted when the relative inertia is not flat.
Hypotheses: X is locally of finite presentation over S. G=I_{X/Y} has the stated closedness, flatness and finite-presentation conditions. Y is algebraic.

AlgebraicModuliForArithmeticGeometry:R09.5/affine-gerbe-recovery
TauCeti.ArithmeticModuli.Rigidification.affine_gerbe
Omitted: geometric comparison to the existing affine-gerbe node; that node is imported, not reconstructed.
Full contract: For a morphism of affine fpqc gerbes over a field, when its stabilizer kernel is flat and finitely presented so that the general construction applies, the intermediate affine gerbe of R09.5/affine-kernel-rigidification is equivalent to X▹G, with the same factorization and quotient Isom sheaves. The comparison imports the prior affine construction and its field-extension descent. It does not assert that every representable final gerbe morphism is full on Isom sheaves.
Hypotheses: The hypotheses of the imported affine-kernel node. The kernel additionally meets the general rigidification subgroup hypotheses.

AlgebraicModuliForArithmeticGeometry:R09.5/auxiliary-level-comparison
TauCeti.ArithmeticModuli.auxiliary_level_comparison
Omitted: representable level morphism, sheaf-valued stabilizer inclusion, trivial-inertia algebraic-space criterion and concrete elliptic charts.
Full contract: A representable auxiliary-level morphism p:L→X identifies Aut(ℓ) with the stabilizer subgroup of Aut(pℓ) preserving the chosen level. It removes automorphisms by taking a subgroup and changes the objects; rigidification X→X▹G keeps locally lifted objects and takes the quotient Aut(x)/G_x. These operations coincide only after an additional comparison is proved. A rigidifier with trivial level-preserving automorphisms gives an algebraic-space moduli object if its full sheaf-valued inertia is trivial, but a coarse space merely records geometric isomorphism classes. Concrete elliptic rigidifiers are imported from ModularCurves4C; abelian and PEL levels remain downstream consumers.
Hypotheses: p is representable; all automorphism assertions are about sheaves. To infer an algebraic space, trivial inertia is proved on all test schemes.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence
TauCeti.ArithmeticModuli.FiniteCorrespondence
Typed: native scheme spans with both IsFinite legs, identity, transpose, composition, base change and joint-map finiteness. Missing: DM-stack endpoints, finite inertia, representability by algebraic spaces and compatible two-isomorphisms. The double-point map Spec(k×k)→Spec(k) is also typed; the two-leg non-example is parameterized by a nonfinite map, with its A1 realization untyped.
Full contract: For separated Deligne–Mumford stacks X,Y of finite type over a locally Noetherian S and with finite inertia, a finite correspondence is a span X←p Z→q Y over S, with both p and q representable by algebraic spaces and finite. Morphisms are equivalences of the middle stacks with compatible 2-isomorphisms on both legs. The correspondence is not defined as its image in X×_S Y: the middle stack and its multiplicities are retained. Since Y is separated over S, the joint map Z→X×_S Y is finite: factor through the graph over X and use the proper quasi-finite diagonal of Y. This supplies a finite-algebra presentation for descent.
Hypotheses: X,Y are separated finite-type DM stacks over locally Noetherian S, with finite inertia. Both legs, not just one, are representable and finite.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.apex: The middle stack, with both legs and their common S-map.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.identity: The identity span X←X→X.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.transpose: Exchange the two legs, retaining the same middle stack.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.compose: Compose X←Z→Y and Y←W→V using Z×_Y W.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.baseChange: Pull back the whole span along S′→S, including both legs.
API TauCeti.ArithmeticModuli.FiniteCorrespondence.jointFinite: Under the separated DM endpoint hypotheses the map to X×_S Y is finite.
TEST TauCeti.ArithmeticModuli.FiniteCorrespondence.test_identity [degenerate]: The identity span has middle X and both legs equal to the identity.
TEST TauCeti.ArithmeticModuli.FiniteCorrespondence.test_double_point [computation]: Over Spec(k), the span with middle Spec(k×k) and both structure maps has degree two on each leg although its image is the single point.
TEST TauCeti.ArithmeticModuli.FiniteCorrespondence.test_two_legs [non-example]: The span A1_k←id A1_k→Spec(k) is not a finite correspondence: the right leg is not finite.
TEST TauCeti.ArithmeticModuli.FiniteCorrespondence.test_empty [degenerate]: The empty middle scheme defines a finite correspondence between any two endpoint schemes; its composition is empty.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-composition
TauCeti.ArithmeticModuli.FiniteCorrespondence.composition
Typed: scheme middle pullback and both leg equations. Missing: stack associator/unit equivalences, arbitrary stack base-change comparison, and the finite locally free assertion.
Full contract: Composition of finite correspondences by the two-fibre product has representable finite legs. It is associative up to the canonical associator equivalence, has identity spans as units, and commutes with arbitrary change of base. If all legs are finite locally free, the composite legs are finite locally free as well. These are stack-level statements; a coarse-space operation is not asserted to preserve the middle fibre product.
Hypotheses: Correspondences have the endpoint and leg hypotheses of finite-correspondence.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-fpqc
TauCeti.ArithmeticModuli.FiniteCorrespondence.fpqc_descent
Omitted: correspondence groupoid, the genuine fpqc descent category with two-leg compatibility and triple-overlap cocycle, and its equivalence.
Full contract: For an fpqc cover S′→S, finite correspondences between the fixed endpoints X,Y over S form a groupoid equivalent to finite correspondences between X_{S′},Y_{S′} supplied with an isomorphism over S′×_S S′ satisfying the identity and triple-overlap cocycle, including the 2-isomorphisms on both legs. A descended span is unique up to unique isomorphism compatible with the specified descent identification. Finite locally free legs descend too.
Hypotheses: The endpoint hypotheses of finite-correspondence. An actual fpqc descent datum is supplied on the middle stack and both legs, not merely matching geometric isomorphism classes.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse
TauCeti.ArithmeticModuli.FiniteCorrespondence.coarse_finite
Omitted: the induced coarse legs, their finiteness and the stated base-change comparisons. In particular no preservation of middle pullbacks or degrees is typed.
Full contract: A finite correspondence X←Z→Y as above induces M_X←M_Z→M_Y between the Keel–Mori coarse spaces, and both induced maps are finite. Formation of these maps commutes with flat change of the common base. Arbitrary base change is valid when each of X,Y,Z is tame. Neither preservation of degree nor preservation of middle fibre products follows in general.
Hypotheses: X,Y are separated finite-type DM stacks over locally Noetherian S, with finite inertia. The middle Z and both legs satisfy finite-correspondence; Z is then separated, finite type and has finite inertia. The arbitrary-base assertion requires tameness of all three stacks.

AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent
TauCeti.ArithmeticModuli.tame_finite_flat_descent
Omitted: general-base tame stack, locally free algebra sheaf with stabilizer action, and the cartesian relative-Spec descent comparison.
Full contract: Let π:X→M be the coarse space of a locally Noetherian tame algebraic stack with finite inertia. For a representable finite locally free p:Z→X, let A=p_*O_Z. If every stabilizer at a closed geometric point of X acts trivially on the fibre of A, then B=π_*A is a finite locally free commutative O_M-algebra, the adjunction π*B→A is an isomorphism of algebras, and Z≃X×_M Spec_M(B). The descended finite locally free morphism has the same rank. The condition is on the entire finite algebra, including its stabilizer action; a coarse geometric point bijection is insufficient.
Hypotheses: X is locally Noetherian, tame, and has finite inertia. p is representable finite locally free. All closed geometric stabilizers act trivially on A fibres.

AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization
TauCeti.ArithmeticModuli.DMNormalization.stack
Typed only: wrappers for Mathlib relative scheme normalization and its smooth comparison. Missing: SF.0 generic-point adapter giving ordinary normalization; normalized étale groupoid and stack quotient; mapOfGeneric and normalIso. The displayed scheme example checks relative factorization, not the integral-closure test. The node, BH and dual-number fixtures are untyped.
Full contract: Let X be a locally Noetherian DM stack. Choose an étale scheme atlas U→X, set R=U×_X U, and normalize U and R in the total rings of fractions of their reductions. Smooth normalization compatibility gives R^ν≅R×_U U^ν≅U^ν×_U R and the normalized étale groupoid. Its quotient X^ν has a representable integral map ν_X:X^ν→X, and for every smooth scheme chart V→X its pullback is the ordinary normalization V^ν. This characterizes the construction up to unique comparison isomorphism. On scheme charts use the imported SF.0 ordinary-normalization adapter to Mathlib’s relative normalization of the disjoint generic points; normalizing the identity map would be incorrect.
Hypotheses: X is locally Noetherian and DM; more generally require the locally finite-component condition of Stacks Lemma 101.46.1. Ordinary normalization removes nilpotents before integral closure.
API TauCeti.ArithmeticModuli.DMNormalization.stack: The normal DM stack X^ν with its map ν_X to X.
API TauCeti.ArithmeticModuli.DMNormalization.map: The representable integral normalization morphism ν_X.
API TauCeti.ArithmeticModuli.DMNormalization.smoothChart: For a smooth V→X, the pullback of ν_X is ordinary V^ν→V.
API TauCeti.ArithmeticModuli.DMNormalization.mapOfGeneric: Maps preserving generic points of components lift uniquely to normalizations.
API TauCeti.ArithmeticModuli.DMNormalization.normalIso: If X is normal, ν_X is an isomorphism.
API TauCeti.ArithmeticModuli.DMNormalization.schemeComparison: For scheme X, the construction agrees with SF.0’s generic-point adapter to Scheme.Hom.normalization.
TEST TauCeti.ArithmeticModuli.DMNormalization.test_node [computation]: For Spec(k[x,y]/(xy)), the normalization is Spec(k[x]) ⨿ Spec(k[y]); the node has two points above it.
TEST TauCeti.ArithmeticModuli.DMNormalization.test_normal_stack [characterisation]: For a finite constant group H over a field, BH is normal and its normalization morphism is an equivalence; inertia is retained.
TEST TauCeti.ArithmeticModuli.DMNormalization.test_nilpotents [non-example]: The normalization of Spec(k[ε]/ε²) is Spec(k), unlike relative normalization of its identity map.
TEST TauCeti.ArithmeticModuli.DMNormalization.test_scheme_comparison [compatibility]: For an integral affine scheme Spec(A), the atlas construction agrees with Spec of the integral closure of A in Frac(A).

AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite
TauCeti.ArithmeticModuli.DMNormalization.finite
Omitted: DM ordinary-normalization morphism with the locally Noetherian Nagata base hypothesis. Ordinary scheme normalization is imported from SF.0, not newly planned.
Full contract: If X is a finite-type DM stack over a locally Noetherian Nagata scheme S, then ν_X is finite. In particular this holds over a locally Noetherian excellent base. The statement includes purely inseparable finite generic field extensions in the imported finite-normalization adapter; separability is not needed for finiteness. A generic finite field extension requires its own integral-closure normalization rather than ordinary normalization of X.
Hypotheses: X is finite type and DM over locally Noetherian Nagata S.

AlgebraicModuliForArithmeticGeometry:R09.5/dm-schematic-closure
TauCeti.ArithmeticModuli.DMSchematicClosure.stack
Typed: native scheme image, factor, minimality, flat comparison and scheme comparison. Missing: quasi-coherent ideal descent on the DM stack and geometric image identification. The three nilpotent/nonflat fixtures below are untyped.
Full contract: For a quasi-compact morphism f:Z→X of locally Noetherian DM stacks, define its schematic image C⊂X to be the smallest closed substack through which f factors. For a smooth chart U→X the corresponding closed subscheme is cut out by ker(O_U→(f_U)_*O_{Z_U}); these ideal sheaves descend to X. For a quasi-compact immersion of an object over a dense open base this is its schematic closure. The construction retains scheme structure and commutes with flat base change. No nonflat comparison is asserted.
Hypotheses: f is quasi-compact; X,Z are locally Noetherian DM stacks. The closure use requires a specified immersion into the ambient stack.
API TauCeti.ArithmeticModuli.DMSchematicClosure.stack: The schematic image C with its closed immersion into X.
API TauCeti.ArithmeticModuli.DMSchematicClosure.factor: The canonical factor Z→C and its composite equality with f.
API TauCeti.ArithmeticModuli.DMSchematicClosure.minimal: Every closed substack D⊂X containing f also contains C.
API TauCeti.ArithmeticModuli.DMSchematicClosure.flatBaseChange: The image of f after flat base change is the pullback of C.
API TauCeti.ArithmeticModuli.DMSchematicClosure.schemeComparison: For a scheme morphism the construction is exactly Scheme.Hom.image.
TEST TauCeti.ArithmeticModuli.DMSchematicClosure.test_nilpotents [non-example]: The schematic image of id on Spec(k[ε]/ε²) is the entire nonreduced scheme.
TEST TauCeti.ArithmeticModuli.DMSchematicClosure.test_closed_point [computation]: The image of Spec(k)→Spec(k[ε]/ε²) given by ε↦0 is the reduced closed point, with ideal (ε).
TEST TauCeti.ArithmeticModuli.DMSchematicClosure.test_nonflat [non-example]: Spec(Z[1/p])→Spec(Z) has schematic image Spec(Z); after reduction mod p the source is empty and its image is empty.
TEST TauCeti.ArithmeticModuli.DMSchematicClosure.test_scheme_comparison [compatibility]: For a scheme morphism f, the defining immersion and factor agree with f.imageι and f.toImage.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure
TauCeti.ArithmeticModuli.finite_schematic_closure
Omitted: DM joint immersion over the dense open U, schematic closure, representable proper quasi-finite projections and their finiteness.
Full contract: Let S be integral locally Noetherian excellent, let U⊂S be dense open, and let X,Y be separated finite-type DM stacks over S with finite inertia. Suppose a finite correspondence C_U between X_U and Y_U has a quasi-compact joint immersion C_U→X_U×_U Y_U. Let C be its schematic closure in X×_S Y. If both projections C→X and C→Y are representable, proper and quasi-finite, then they are finite, so C is a finite correspondence extending C_U. Properness follows, for example, if both endpoint stacks are proper over S; quasi-finiteness is an additional condition. This procedure is for immersed spans and cannot replace finite-algebra extension for a general multiple-cover span.
Hypotheses: All conditions in the statement, including the joint immersion and quasi-finiteness of both projections. U is used rather than an unqualified generic fibre so that C_U embeds as the open-base restriction of C.

AlgebraicModuliForArithmeticGeometry:R09.5/normalized-correspondence
TauCeti.ArithmeticModuli.normalized_finite_correspondence
Omitted: the DM finite normalization and the open-base comparison; retaining the original open-base middle requires it to be normal.
Full contract: Under finite-closure, the middle C has finite normalization C^ν because it is finite type over excellent S. Composing C^ν→C with the two finite legs gives a normal finite correspondence. If C_U is normal, its restriction to U is the original C_U; otherwise the restriction is its normalization. No preservation of rank on special fibres or commutation with arbitrary base change is asserted.
Hypotheses: The finite-closure hypotheses, including proper quasi-finite representable projections. C_U normal is required to retain the original open-base middle.

AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery
TauCeti.ArithmeticModuli.elliptic_coarse_recovery
Omitted: concrete upstream moduli/quotient-stack and SF.1 coarse comparison bindings. All four imported base-change cases remain in the contract.
Full contract: For the affine elliptic moduli problems P covered by ModularCurves9D, stackify the problem over the elliptic moduli stack and use the level-3 and level-4 Galois rigidifier charts of ModularCurves4C/9D. Their quotient-stack presentations identify the imported coarse scheme M(P), regarded as an algebraic space, with the SF.1 coarse space. The comparison is compatible with the imported M(P)/H≅M(P/H) theorem. Import all four Katz–Mazur 8.1.6 cases for M(P_{R′})→M(P)×_R R′: P representable; R→R′ flat; 6 invertible in R; or P=P′/G for representable P′ and finite G whose order is invertible in R′. The final condition is on the target ring and must not be replaced by tameness over R.
Hypotheses: P satisfies the affine-moduli and Galois-rigidifier hypotheses in the imported ModularCurves9D statement. All concrete moduli objects, representing schemes and quotient constructions remain owned by ModularCurves.

AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery
TauCeti.ArithmeticModuli.coarse_j_line_recovery
Omitted: integral elliptic-stack/j-line coarse binding, including the explicit characteristic 2 and 3 results owned by ModularCurves9E.
Full contract: The coarse space of the elliptic moduli stack is the imported j-line of ModularCurves9E over Z, and its imported arbitrary-ring version over R agrees with the stack coarse space. The cases in characteristics 2 and 3 use the explicit integral invariant/coarse-point results already owned by 9E; they do not follow from the tame base-change theorem. The coarse j-line is not a fine moduli scheme and carries no universal elliptic curve representing all families.
Hypotheses: Use the elliptic-stack carrier and exact integral j-invariant/coarse-space hypotheses of ModularCurves9E.

AlgebraicModuliForArithmeticGeometry:R09.5/finite-curve-quotient-recovery
TauCeti.ArithmeticModuli.finite_curve_quotient_recovery
Omitted: [C/H] coarse identification. The smooth relative-curve quotient theorem already belongs to ModularCurves9D; no new smoothness theorem is declared here.
Full contract: For a smooth affine relative curve C over a regular locally Noetherian base S with the finite group action and categorical quotient hypotheses of ModularCurves9D, identify the coarse space of [C/H] with the imported C/H. Import the 9D smooth-relative-dimension-one quotient theorem without adding an order-invertibility hypothesis. Its wild cases are not justified by tameness or exactness of arbitrary invariants, and no arbitrary-base-change strengthening is added here.
Hypotheses: All hypotheses of the imported smooth affine relative-curve finite-quotient theorem in ModularCurves9D. The finite group quotient exists with the imported categorical and orbit hypotheses.

-/

-- Baseline name probes: declarations were read at the pinned commits.
#check CategoryTheory.Pseudofunctor
#check CategoryTheory.IsGroupoid
#check CategoryTheory.Pseudofunctor.StrongTrans
#check CategoryTheory.Pseudofunctor.StrongTrans.Modification
#check CategoryTheory.Pseudofunctor.IsStack
#check CategoryTheory.Pseudofunctor.sheafHom
#check CategoryTheory.Aut
#check CategoryTheory.Functor.mapAut
#check CategoryTheory.Aut.autMulEquivOfIso
#check CategoryTheory.Quotient
#check CategoryTheory.Quotient.lift
#check CategoryTheory.Quotient.functor_map_eq_iff
#check CategoryTheory.Limits.pullback
#check AlgebraicGeometry.IsFinite
#check AlgebraicGeometry.IsFinite.SpecMap_iff
#check AlgebraicGeometry.IsFinite.iff_isProper_and_isAffineHom
#check AlgebraicGeometry.Scheme.Hom.normalization
#check AlgebraicGeometry.Scheme.Hom.toNormalization
#check AlgebraicGeometry.Scheme.Hom.fromNormalization
#check AlgebraicGeometry.Scheme.Hom.normalizationDesc
#check AlgebraicGeometry.Scheme.Hom.normalizationPullback
#check AlgebraicGeometry.Scheme.Hom.image
#check AlgebraicGeometry.Scheme.Hom.imageι
#check AlgebraicGeometry.Scheme.Hom.toImage
#check AlgebraicGeometry.Scheme.Hom.toImage_imageι
#check Algebra.IsInvariant.isIntegral
#check Algebra.IsInvariant.exists_smul_of_under_eq
#check TauCeti.linearlyReductiveAffineGroupSchemeProperty
#check TauCeti.Comodule.fixedSubcomodule

end TauCeti.ArithmeticModuli
