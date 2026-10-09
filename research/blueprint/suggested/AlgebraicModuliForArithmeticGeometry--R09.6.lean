import Mathlib.CategoryTheory.Comma.StructuredArrow.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Skeletal
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Groupoid.Discrete
import Mathlib.CategoryTheory.Yoneda
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.RingTheory.AdicCompletion.LocalRing
import TauCeti.AlgebraicGeometry.TangentSpace.Basic
import TauCeti.RingTheory.Derivation.DualNumber

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures.

The framed fibre, automorphism kernel and coherent-tower prototypes use native
categories. Their geometric specializations require the supplier interfaces
listed in the omission ledger. The completed stalk is native adic completion;
its prorepresentability theorem is not supplied by that abbreviation. No stack,
versal family, or representability theorem is replaced by an opaque Prop field.
All declarations are unchecked signature proposals.
-/

noncomputable section
open CategoryTheory
open Opposite

namespace TauCeti.AlgebraicGeometry.ModuliFormal
universe u v w

section Framing
variable {C D : Type u} [Groupoid.{v} C] [Groupoid.{v} D]
  (reduction : C ⥤ D) (x₀ : D)

/-- Specialize with C = X(A), D = X(k), reduction = residue pullback. -/
abbrev FramedDeformation := StructuredArrow x₀ reduction

/-- Changing the special-fibre identification retains the object and every arrow. -/
def FramedDeformation.reframe (g : Aut x₀) :
    FramedDeformation reduction x₀ ⥤ FramedDeformation reduction x₀ where
  obj x := StructuredArrow.mk (g.hom ≫ x.hom)
  map f := StructuredArrow.homMk f.right (by sorry)
  map_id := by sorry
  map_comp := by sorry

theorem FramedDeformation.reframe_object (g : Aut x₀)
    (x : FramedDeformation reduction x₀) :
    ((FramedDeformation.reframe reduction x₀ g).obj x).right = x.right := by sorry

theorem FramedDeformation.reframe_frame (g : Aut x₀)
    (x : FramedDeformation reduction x₀) :
    ((FramedDeformation.reframe reduction x₀ g).obj x).hom = g.hom ≫ x.hom := by sorry

theorem FramedDeformation.arrow_criterion (x y : FramedDeformation reduction x₀)
    (f : x.right ⟶ y.right) :
    (∃! a : x ⟶ y, a.right = f) ↔ x.hom ≫ reduction.map f = y.hom := by sorry

-- FramedTests.residueIdentity: the framed fibre over k is contractible.
example (x y : FramedDeformation (𝟭 D) x₀) : Unique (x ⟶ y) := by sorry

-- FramedTests.discrete: no unframed automorphisms appear for a set-valued fibre.
example {α : Type u} (x : α)
    (a : FramedDeformation (𝟭 (Discrete α)) (Discrete.mk x)) :
    a.right = Discrete.mk x := by sorry

-- FramedTests.nontrivialFrame: a change of frame is not discarded.
example (g : Aut x₀) (hg : g ≠ 1) :
    ((FramedDeformation.reframe (𝟭 D) x₀ g).obj
      (StructuredArrow.mk (𝟙 x₀))).hom ≠ 𝟙 x₀ := by sorry

/-- For a reduction functor, automorphisms trivial after reduction. -/
abbrev InfinitesimalStabilizer (y : C) : Subgroup (Aut y) :=
  (reduction.mapAut y).ker

theorem InfinitesimalStabilizer.mem_iff (y : C) (g : Aut y) :
    g ∈ InfinitesimalStabilizer reduction y ↔ reduction.mapIso g = Iso.refl _ := by sorry

def InfinitesimalStabilizer.framedAut (x : FramedDeformation reduction x₀) :
    Aut x ≃* InfinitesimalStabilizer reduction x.right := by sorry

theorem InfinitesimalStabilizer.faithful [reduction.Faithful] (y : C) :
    InfinitesimalStabilizer reduction y = ⊥ := by sorry

-- StabilizerTests.identity
example (y : D) : InfinitesimalStabilizer (𝟭 D) y = ⊥ := by sorry

-- StabilizerTests.allKilled: unlike the identity, a zero reduction retains all autos.
example (G : Type u) [Group G] :
    InfinitesimalStabilizer
      ((1 : G →* G).toFunctor) (SingleObj.star G) = ⊤ := by sorry

-- StabilizerTests.frameKernel: framing removes residual autos, not infinitesimal autos.
example (y : C) (a : x₀ ≅ reduction.obj y) (g : Aut y) :
    g ∈ InfinitesimalStabilizer reduction y ↔
      a.hom ≫ reduction.map g.hom = a.hom := by sorry
end Framing

section Towers
variable (C : ℕ → Type u) [∀ n, Groupoid.{v} (C n)]
  (reduction : ∀ n, C (n + 1) ⥤ C n)

/-- For a fixed complete ring, C n is X(R/m^(n+1)). Adjacent isos compose
into the comparisons at all pairs of indices. They must not be erased. -/
structure FormalObject where
  value : ∀ n, C n
  glue : ∀ n, (reduction n).obj (value (n + 1)) ≅ value n

namespace FormalObject
variable {C reduction}
structure Hom (x y : FormalObject C reduction) where
  app : ∀ n, x.value n ⟶ y.value n
  comm : ∀ n, (reduction n).map (app (n + 1)) ≫ (y.glue n).hom =
    (x.glue n).hom ≫ app n

instance : Category (FormalObject C reduction) where
  Hom := Hom
  id x := ⟨fun _ => 𝟙 _, by sorry⟩
  comp f g := ⟨fun n => f.app n ≫ g.app n, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

instance : Groupoid (FormalObject C reduction) where
  inv f := ⟨fun n => CategoryTheory.inv (f.app n), by sorry⟩
  inv_comp := by sorry
  comp_inv := by sorry

variable (C reduction)
-- FormalObject.evaluation
def evaluation (n : ℕ) : FormalObject C reduction ⥤ C n where
  obj x := x.value n
  map f := f.app n
  map_id := by sorry
  map_comp := by sorry

-- FormalObject.hom_ext
theorem hom_ext {x y : FormalObject C reduction} (f g : x ⟶ y)
    (h : ∀ n, f.app n = g.app n) : f = g := by sorry

-- FormalObject.isomorphism_iff
theorem isomorphism_iff (x y : FormalObject C reduction) :
    Nonempty (x ≅ y) ↔
      ∃ a : ∀ n, x.value n ≅ y.value n,
        ∀ n, (reduction n).map (a (n + 1)).hom ≫ (y.glue n).hom =
          (x.glue n).hom ≫ (a n).hom := by sorry
end FormalObject

-- FormalTests.point: the constant point tower has exactly one object up to iso.
example (x y : FormalObject (fun _ => Discrete PUnit) (fun _ => 𝟭 _)) :
    Nonempty (x ≅ y) := by sorry

-- FormalTests.compatibleArrows: a claimed comparison must commute with glue.
example (x y : FormalObject C reduction) (f : x ⟶ y) (n : ℕ) :
    (reduction n).map (f.app (n + 1)) ≫ (y.glue n).hom =
      (x.glue n).hom ≫ f.app n := by sorry

-- FormalTests.automorphisms: even a constant tower can have nontrivial autos.
example (G : Type u) [Group G]
    (x : FormalObject (fun _ => SingleObj G) (fun _ => 𝟭 _)) :
    ∃ e : Aut x ≃* Aut (x.value 0),
      ∀ a, e a = (FormalObject.evaluation
        (fun _ => SingleObj G) (fun _ => 𝟭 _) 0).mapIso a := by sorry

variable {E : Type w} [Groupoid.{v} E]
  (restriction : E ⥤ FormalObject C reduction)

/-- Essential image on groupoids, stronger than an unframed set-valued image. -/
def IsEffective (x : FormalObject C reduction) : Prop :=
  ∃ y : E, Nonempty (restriction.obj y ≅ x)

theorem IsEffective.ofRestriction (y : E) :
    IsEffective C reduction restriction (restriction.obj y) := by sorry

theorem IsEffective.iso_iff {x y : FormalObject C reduction} (e : x ≅ y) :
    IsEffective C reduction restriction x ↔ IsEffective C reduction restriction y := by sorry

theorem IsEffective.all_iff :
    (∀ x, IsEffective C reduction restriction x) ↔ restriction.EssSurj := by sorry

-- EffectiveTests.identity
example (x : FormalObject C reduction) :
    IsEffective C reduction (𝟭 _) x := by sorry

-- EffectiveTests.empty: an empty source cannot effect a nonempty target.
example (f : Discrete PEmpty ⥤ FormalObject C reduction) (x : FormalObject C reduction) :
    ¬ IsEffective C reduction f x := by sorry

-- EffectiveTests.notFullyFaithful: existence of objects does not imply faithfulness.
example :
    let point : FormalObject (fun _ => Discrete PUnit) (fun _ => 𝟭 _) :=
      ⟨fun _ => Discrete.mk PUnit.unit, fun _ => Iso.refl _⟩
    let f := (Functor.const (SingleObj (Multiplicative ℤ))).obj point
    (∀ x, IsEffective (fun _ => Discrete PUnit) (fun _ => 𝟭 _) f x) ∧
      ¬ f.Faithful := by sorry
end Towers

section Completion
open _root_.AlgebraicGeometry
variable (X : Scheme.{u}) (x : X)

abbrev CompletedLocalRing := AdicCompletion
  (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) (X.presheaf.stalk x)

abbrev CompletedLocalRing.ofStalk : X.presheaf.stalk x →+* CompletedLocalRing X x :=
  algebraMap (X.presheaf.stalk x) (CompletedLocalRing X x)

def CompletedLocalRing.jet (n : ℕ) : CompletedLocalRing X x →+*
    (X.presheaf.stalk x ⧸ IsLocalRing.maximalIdeal (X.presheaf.stalk x) ^ (n + 1)) :=
  (AdicCompletion.evalₐ _ (n + 1)).toRingHom

theorem CompletedLocalRing.jet_ofStalk (n : ℕ) (a : X.presheaf.stalk x) :
    CompletedLocalRing.jet X x n (CompletedLocalRing.ofStalk X x a) =
      Ideal.Quotient.mk _ a := by sorry

theorem CompletedLocalRing.ext {a b : CompletedLocalRing X x}
    (h : ∀ n, CompletedLocalRing.jet X x n a = CompletedLocalRing.jet X x n b) :
    a = b := by sorry

/-- Native maximal-ideal completeness, specialized to the actual stalk. -/
theorem CompletedLocalRing.isAdicComplete [IsNoetherianRing (X.presheaf.stalk x)] :
    IsAdicComplete (IsLocalRing.maximalIdeal (CompletedLocalRing X x))
      (CompletedLocalRing X x) := by infer_instance

/-- SF.4's Noetherian-completion theorem, specialized to the actual stalk. -/
theorem CompletedLocalRing.isNoetherianRing [IsNoetherianRing (X.presheaf.stalk x)] :
    IsNoetherianRing (CompletedLocalRing X x) := by sorry

-- CompletionTests.residueJet: index zero means reduction modulo m, not the zero ring.
example (a : X.presheaf.stalk x) :
    Ideal.Quotient.factor
      (show IsLocalRing.maximalIdeal (X.presheaf.stalk x) ^ (0 + 1) ≤
        IsLocalRing.maximalIdeal (X.presheaf.stalk x) by simp)
      (CompletedLocalRing.jet X x 0 (CompletedLocalRing.ofStalk X x a)) =
        Ideal.Quotient.mk (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) a := by sorry

-- CompletionTests.multiplication
example (n : ℕ) (a b : CompletedLocalRing X x) :
    CompletedLocalRing.jet X x n (a * b) =
      CompletedLocalRing.jet X x n a * CompletedLocalRing.jet X x n b := by sorry

-- CompletionTests.localResidue: completion preserves the residue field.
example [IsNoetherianRing (X.presheaf.stalk x)] :
    Function.Bijective (IsLocalRing.ResidueField.map
      (CompletedLocalRing.ofStalk X x)) := by sorry
end Completion

section ParameterComponents
variable {C : Type u} [Category.{v} C] {P : C} {F : Cᵒᵖ ⥤ Type v}
  (representation : yoneda.obj P ≅ F)

/-- Native component transport of an already supplied representation.
The geometric formal-completion extension is in the omission ledger. -/
def ParameterFormalExports.classify (T : C) : (T ⟶ P) ≃ F.obj (op T) where
  toFun := representation.hom.app (op T)
  invFun := representation.inv.app (op T)
  left_inv := by sorry
  right_inv := by sorry

def ParameterFormalExports.universal : F.obj (op P) :=
  ParameterFormalExports.classify representation P (𝟙 P)

theorem ParameterFormalExports.classify_natural {T U : C} (g : T ⟶ U) (f : U ⟶ P) :
    ParameterFormalExports.classify representation T (g ≫ f) =
      F.map g.op (ParameterFormalExports.classify representation U f) := by sorry

-- ParameterTests.identityRepresentation
example (T : C) (f : T ⟶ P) :
    ParameterFormalExports.classify (Iso.refl (yoneda.obj P)) T f = f := by sorry

-- ParameterTests.universalElement
example : ParameterFormalExports.classify representation P (𝟙 P) =
    ParameterFormalExports.universal representation := by sorry

-- ParameterTests.pullback
example {T U : C} (g : T ⟶ U) (f : U ⟶ P) :
    F.map g.op (ParameterFormalExports.classify representation U f) =
      ParameterFormalExports.classify representation T (g ≫ f) := by sorry
end ParameterComponents

/-!
Geometric omission ledger. The packet and reader give the precise coefficient,
residue-field and supplier hypotheses. These names have no native geometric
signatures yet. Fixed-fibre generic prototypes above do not claim them.

framedDeformation_twoFibre: A morphism X→Y and a chosen identification of its special-fibre object induce Def_X,x₀→Def_Y,y₀. These assignments preserve 2-fibre products: for W=X×_Y Z and w₀=(x₀,z₀,γ₀), Def_W,w₀≃Def_X,x₀×_(Def_Y,y₀)Def_Z,z₀. A representable formally smooth morphism induces a smooth morphism of predeformation categories.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation, DiamondsAndVStacks:D0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4/hull

infinitesimalStabilizer_linearization: If X satisfies the Rim–Schlessinger condition, Inf_x₀(X) has a natural k-vector-space structure and its addition agrees with composition. For a surjection A′→A of kernel I killed by m_A′ (in particular a small extension), Inf(y/z) is canonically the corresponding additive group Inf_x₀(X)⊗_k I, with identity as its origin. If Inf_x₀(X)=0, every framed Artinian fibre is a setoid and Def_X,x₀ is equivalent to its isomorphism-class functor.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/infinitesimal-stabilizer, AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing, SchemeAndStackFoundations:SF.4/deformation-functor, DiamondsAndVStacks:D0

framedTangent_exactSequence: For X→Y←Z satisfying RS and a point w₀ of W=X×_Y Z, there is a natural exact sequence of k-vector spaces 0→Inf_W→Inf_X⊕Inf_Z→Inf_Y→T_W→T_X⊕T_Z→T_Y. Here T means isomorphism classes of framed dual-number deformations; the map Inf_Y→T_W changes the gluing isomorphism by an infinitesimal automorphism.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality, AlgebraicModuliForArithmeticGeometry:R09.6/stabilizer-linearization, SchemeAndStackFoundations:SF.4/deformation-functor

schemeFramedCompletionEquiv: Let X be locally of finite type over a locally Noetherian S and x a finite-type point with k=κ(x). On C_Λ, the framed deformation functor of X at x is naturally isomorphic to h_R, where R=Ô_X,x and h_R(A) consists of continuous local Λ-algebra maps R→A inducing the specified identity on k. Thus the identity formal family prorepresents this scheme-point deformation functor.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation, AlgebraicModuliForArithmeticGeometry:R09.6/completed-local-ring, SchemeAndStackFoundations:SF.4/hull, SchemeAndStackFoundations:SF.4/formal-scheme

spaceFramedEtaleCompletionEquiv: For an algebraic space X locally of finite type over S, a pointed étale chart (U,u)→(X,x) with κ(u)=κ(x)=k induces an equivalence of framed Artinian deformation functors. Consequently Ô_U,u prorepresents the point-deformation functor, and another such chart gives a unique compatible isomorphism of prorepresenting pairs. Do not use an arbitrary smooth chart for this conclusion.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison, AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality, SchemeAndStackFoundations:SF.1

schemeRelativeTangentEquiv: For X/S as in the scheme comparison, the tangent space of its framed point functor is Der_Λ(O_X,x,k) at the specified residue point. For a k-rational point of a k-scheme this is naturally Hom_k(m_x/m_x²,k), hence the existing ZariskiTangentSpace(X,x). For a general relative base retain relative differentials or derivations; the absolute stalk cotangent dual is not asserted to equal the relative tangent.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison, tauceti:TauCeti.derivationToDualNumberEquivLift, tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace, tauceti:TauCeti.AlgHom.kernelCotangentLinearEquivZariski, SchemeAndStackFoundations:SF.4/deformation-functor, SchemeAndStackFoundations:SF.1

completeLocalSpaceRestriction_bijective: For any algebraic space X over S and a complete Noetherian local S-algebra R, restriction gives a bijection Mor_S(Spec R,X)→lim_(n≥0) Mor_S(Spec(R/m^(n+1)),X). No properness, separatedness or finite-presentation condition on X is required for this statement.
Required interfaces: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4/formal-scheme, AlgebraicModuliForArithmeticGeometry:R09.6/formal-object

algebraicStackRestriction_equivalence: Let S be locally Noetherian and X an algebraic stack over S. Restriction from objects over complete Noetherian local S-algebras with residue field finite type over S to formal objects is an equivalence, compatible with change of such bases. In particular each res_R is fully faithful and essentially surjective.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/space-restriction, AlgebraicModuliForArithmeticGeometry:R09.6/effectivity, AlgebraicModuliForArithmeticGeometry:R09.4, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0

restriction_twoFibre_equivalence: If complete-local restriction is an equivalence for X, Y and Z, it is an equivalence for X×_Y Z. Compatible objects and the comparison isomorphism are all algebraized; uniqueness of the isomorphism follows from full faithfulness for Y.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/effectivity, AlgebraicModuliForArithmeticGeometry:R09.6/formal-object, DiamondsAndVStacks:D0

FamilyVersalAt: Let U be locally of finite type over S, y∈X(U), u a finite-type point and x₀=y|κ(u). The family is versal at u if the induced map Def_U,u→Def_X,x₀ is smooth: for each Artinian surjection B→A the comparison Def_U,u(B)→Def_U,u(A)×_(Def_X,x₀(A))Def_X,x₀(B) is essentially surjective. The 2-product retains its comparison arrow. A formal object ξ over R is versal if h_R→Def_X,x₀ has the same lifting property.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/framed-deformation, AlgebraicModuliForArithmeticGeometry:R09.6/formal-object, SchemeAndStackFoundations:SF.4/hull, DiamondsAndVStacks:D0

API FamilyVersalAt.smallExtension_iff: It suffices to test small extensions: surjections with nonzero principal kernel killed by the source maximal ideal. Equivalently one may test all surjections with kernel killed by that ideal.
API FamilyVersalAt.completion_iff: The family is versal at u iff its completed-local formal object is versal.
API FamilyVersalAt.finiteResidueExtension: Under RS, finite residue extensions preserve the smooth pointed deformation morphism.
Example VersalTests.identity: The identity family of a locally finite-type scheme is versal at every finite-type point.
Example VersalTests.excessParameter: A¹_k→Spec k is smooth and versal at zero; its tangent map k→0 is not bijective, so it is not a hull.
Example VersalTests.closedPoint: Spec k→A¹_k at zero is not versal: the dual-number point t↦ε cannot lift through the closed point.
familyVersalAt_completion_iff: For y over U locally of finite type over locally Noetherian S and a finite-type u, let ξ be its formal restriction over R=Ô_U,u. Then y is versal at u iff ξ is versal. For a morphism U→V of schemes locally of finite type over S, this is also equivalent to the morphism being smooth at u.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/family-versality, AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison, SchemeAndStackFoundations:SF.1

smoothChart_versalHullComparison: A smooth representable chart U→X at a specified lift u of x₀ induces a smooth h_(Ô_U,u)→Def_X,x₀, hence a versal formal family. In the classical equal-residue coefficient setting, its isomorphism-class transformation is a hull exactly when its tangent map is bijective. Under RS and Inf_X,x₀=0 the framed category is setoid-valued; if the chart map is also tangent-bijective, the SF.4 prorepresentability criterion makes this pair prorepresent the framed functor. Inf=0 alone does not make an arbitrary smooth-chart ring prorepresent it.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality, AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality, AlgebraicModuliForArithmeticGeometry:R09.6/stabilizer-linearization, SchemeAndStackFoundations:SF.4/hull, SchemeAndStackFoundations:SF.4/schlessinger-theorem, SchemeAndStackFoundations:SF.4/deformation-functor

completedAtlasPresentation_equivalence: For a smooth pointed atlas U→X of an algebraic stack, the framed deformation category at x₀ is equivalent to the groupoid quotient of Def_U,u by Def_(U×_X U),r, where r is the identity relation point (u,u,id). The object functor is represented by Ô_U,u; the relation functor is represented through a pointed étale chart of the algebraic space U×_X U at r. Source, target, identity, inverse and composition are the induced formal maps, and their coherence is retained. This is a presentation, not a choice-independent ring attached to X.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/space-formal-comparison, AlgebraicModuliForArithmeticGeometry:R09.6/atlas-versality, AlgebraicModuliForArithmeticGeometry:R09.6/framed-functoriality, AlgebraicModuliForArithmeticGeometry:R09.6/tangent-exact-sequence, AlgebraicModuliForArithmeticGeometry:R09.4, DiamondsAndVStacks:D0, SchemeAndStackFoundations:SF.1

effectiveVersal_algebraization: Let S be locally Noetherian, X fibred in groupoids and limit preserving on objects, and ξ a formal object over a complete Noetherian local S-algebra R with residue k finite type over S, image s∈S. If ξ is effective and versal and O_S,s is a G-ring, there are U→S of finite type, a finite-type u∈U with κ(u)=k, and y∈X(U), versal at u, with an isomorphism R≅Ô_U,u and a compatible identification of all the ξ_n with the formal restrictions of y. The isomorphism and family need not be unique.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/effectivity, AlgebraicModuliForArithmeticGeometry:R09.6/family-versality, AlgebraicModuliForArithmeticGeometry:R09.6/completion-versality, AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation, AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4

ParameterFormalExports: Over a locally Noetherian S, given a locally finite-type parameter scheme P→S and a parameter functor F on S-schemes with a supplied natural representation θ:Hom_S(-,P)≅F and a finite-type p∈P, let ξ₀=θ(p). Transport schemeFramedCompletionEquiv through θ to obtain h_(Ô_P,p)≅Def_F,ξ₀. Export the representation, universal object, pullback naturality and this formal comparison under named projective-bundle, Grassmannian, flag, Hilbert, Quot, Hom, Isom and Picard-space interfaces. Space-valued parameters use the pointed étale chart comparison instead. Their original representability and geometric hypotheses remain with R09.1/R09.2/SF.1; this node proves only the uniform point/completion transport.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison, AlgebraicModuliForArithmeticGeometry:R09.6/space-formal-comparison, mathlib:CategoryTheory.yoneda, AlgebraicModuliForArithmeticGeometry:R09.1, AlgebraicModuliForArithmeticGeometry:R09.2, AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability, SchemeAndStackFoundations:SF.1

API projectiveParameter_formalEquiv: A quotient line of E at p has the deformation functor represented by Ô_(P(E)),p, under the supplier quotient convention.
API grassmannParameter_formalEquiv: Rank-r locally free quotient deformations are represented by the completed stalk of the supplied Grassmannian.
API flagParameter_formalEquiv: Compatible quotient flags at p have the completed-stalk formal universal property of the supplied flag scheme.
API hilbertParameter_formalEquiv: Deformations of the specified flat closed subscheme with fixed Hilbert polynomial are classified by the supplied Hilbert completion, with universal family pulled back.
API quotParameter_formalEquiv: Deformations of the specified flat quotient of E, modulo compatible quotient isomorphism, are classified by the supplied Quot completion.
API homParameter_formalEquiv: Deformations of a specified morphism in the supplied representable Hom functor are classified by its completed parameter stalk.
API isomParameter_formalEquiv: Deformations of a specified isomorphism are classified by the supplied Isom completion and retain the invertibility requirement.
API picardParameter_formalEquiv: The framed deformation of a class in the supplied relative Picard sheaf is represented by a pointed étale-chart completion of its Picard space; this does not classify arrows of the Picard stack.
Example ParameterTests.grassmannEndpoints: For E of rank n, rank-zero and rank-n quotient functors are terminal over S; over a rational field-base point their framed tangent is zero.
Example ParameterTests.hilbertNonflatBase: For S=Spec k[ε] and X=Spec k closed in S, the degree-one Hilbert parameter is X. Its universal family over itself is flat although X→S is not flat; only Artinian S-maps satisfying ε=0 are classified.
Example ParameterTests.quotLengthOne: For E=O on P¹_k, a length-one quotient at a rational origin has point-deformation completion k[[t]], since it is the length-one Hilbert functor of P¹.
Example ParameterTests.isomUnit: For endomorphisms of the trivial line over A, Hom gives A and Isom gives A×; an Artinian endomorphism reducing to 1 is invertible, while zero is excluded.
Example ParameterTests.picardAutomorphisms: For X=Spec A over itself the relative Picard sheaf is terminal, while its line-bundle groupoid has the units A× as automorphisms of the trivial object. The Picard-space completion must not be substituted for the Picard-stack groupoid.
arithmeticFormalComparison_transfer: Given a supplied algebraic moduli stack M of the required elliptic/abelian objects, an equivalence between its framed fibre and the arithmetic deformation groupoid transports the completed-atlas presentation, infinitesimal stabilizers, tangent comparison and complete-local effectivity to that problem. If the formal object is effective and versal, the G-ring and limit-preservation inputs give a finite-type versal family via effectiveVersal_algebraization. A rigidifying level yields a represented local functor only after the supplied level theorem removes the required automorphisms. Coarse moduli alone does not supply this equivalence.
Required interfaces: AlgebraicModuliForArithmeticGeometry:R09.6/completed-atlas-presentation, AlgebraicModuliForArithmeticGeometry:R09.6/stack-restriction, AlgebraicModuliForArithmeticGeometry:R09.6/versal-algebraization, AlgebraicModuliForArithmeticGeometry:R09.6/parameter-formal-exports, AlgebraicModuliForArithmeticGeometry:R09.5, SchemeAndStackFoundations:SF.4/grothendieck-existence, SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves, AlgebraicModuliForArithmeticGeometry:A0-extension/artin-stack-criterion, AlgebraicModuliForArithmeticGeometry:A0-extension/artin-space-criterion, tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes, tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves


No omitted name is implemented as a placeholder Prop or replacement axiom.
-/
end TauCeti.AlgebraicGeometry.ModuliFormal

/-! Independent review: formal-defos 90.19.11, p. 58, contains the tensor-factor
misprint recorded as AlgebraicModuliForArithmeticGeometry/E6001 in the packet.
The intended tangent identification is untensored; its lifting action tensors once.
For the arithmetic elliptic instance use ModularCurves 7B/7D's existing marked
comparison, including W(k)[[T]], under the supplier's algebraically closed
characteristic-p and rigidification hypotheses. -/
