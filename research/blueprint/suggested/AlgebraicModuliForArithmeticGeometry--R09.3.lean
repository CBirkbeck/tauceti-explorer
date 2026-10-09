/-
Suggested Lean forms for R09.3 of Algebraic moduli and representability for arithmetic geometry.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AlgebraicModuliForArithmeticGeometry--R09.3.md` is definitive.
The statements suggest Lean forms for the declarations the roadmap names, so contributors and
reviewers converge on names and signatures. Proofs and the data of constructions to implement
are `sorry`. They make no claim that the mathematical targets have been formalized.

The two new definitions have all their API items and unit tests below. Geometric algebraicity
uses SF.1's actual sheaf/representable-diagonal/atlas conditions, spelled directly in native
Mathlib APIs without another space predicate. Finite locally free means finite, flat and locally
of finite presentation. The source morphism is scheme-representable, as every finite locally free
space morphism is. Points store sections of B, using native Yoneda equivalence, to keep the same
value universe as the common space carrier.

Three supplier-dependent theorem specializations are explicitly recorded as signature gaps in
comments under their proposed names. They are not replaced by opaque Prop fields or untyped
objects. Elaboration checks the signatures present; it does not certify these missing interfaces
or any proof. The native adjunction fixtures are already in Mathlib and are not planned again.
-/
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.CategoryTheory.MorphismProperty.Representable
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.CategoryTheory.Sites.LocallySurjective
import Mathlib.CategoryTheory.Adjunction.Unique
import Mathlib.Algebra.Category.ModuleCat.Descent

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite
universe u
set_option linter.unusedVariables false
noncomputable section
namespace TauCeti.AlgebraicGeometry.ModuliDescent
abbrev P := Scheme.{u}ᵒᵖ ⥤ Type u

variable {B Z X : P.{u}} (f : Z ⟶ B) (x : X ⟶ B)
    (hf : yoneda.relativelyRepresentable f)

/-- Relative morphisms, with the test scheme and its map to the base retained. -/
def relativeHom : P.{u} where
  obj T := Σ a : B.obj T,
    { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
      x.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f) }
  map := sorry
  map_id := sorry
  map_comp := sorry

def relativeHomToBase : relativeHom f x hf ⟶ B where
  app T := TypeCat.ofHom fun s => s.1
  naturality := sorry

lemma relativeHom_points (T : Scheme.{u}) :
    Nonempty ((relativeHom f x hf).obj (op T) ≃
      Σ a : B.obj (op T),
        { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
          x.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f) }) := sorry

lemma relativeHom_map_points {T T' : Scheme.{u}} (g : T' ⟶ T)
    (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f))
    (h : hf.pullback (yonedaEquiv.symm (B.map g.op a)) ⟶ hf.pullback (yonedaEquiv.symm a))
    (hh : yoneda.map h ≫ hf.fst (yonedaEquiv.symm a) = hf.fst (yonedaEquiv.symm (B.map g.op a)))
    (hs : h ≫ hf.snd (yonedaEquiv.symm a) = hf.snd (yonedaEquiv.symm (B.map g.op a)) ≫ g) :
    (relativeHom f x hf).map g.op ⟨a, ⟨b, hb⟩⟩ =
      ⟨B.map g.op a, ⟨X.map h.op b, by sorry⟩⟩ := sorry

lemma relativeHom_ext (T : Scheme.{u})
    (s t : (relativeHom f x hf).obj (op T)) (ha : s.1 = t.1)
    (hb : HEq s.2.1 t.2.1) : s = t := sorry

def relativeHomHomEquiv {V : P.{u}} (v : V ⟶ B) :
    { c : V ⟶ relativeHom f x hf // c ≫ relativeHomToBase f x hf = v } ≃
      { b : pullback v f ⟶ X // b ≫ x = pullback.fst v f ≫ v } := sorry

/-- The universal-property equivalence evaluates to the morphism stored by a point. -/
lemma relativeHomHomEquiv_points (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)) :
    let v := yonedaEquiv.symm a
    let c := yonedaEquiv.symm
      (⟨a, ⟨b, hb⟩⟩ : (relativeHom f x hf).obj (op T))
    pullback.lift (yoneda.map (hf.snd v)) (hf.fst v) (hf.isPullback v).w.symm ≫
      ((relativeHomHomEquiv f x hf v) ⟨c, by sorry⟩).val =
        yonedaEquiv.symm b := sorry

def relativeHomMap {X' : P.{u}} (x' : X' ⟶ B) (m : X ⟶ X') (hm : m ≫ x' = x) :
    relativeHom f x hf ⟶ relativeHom f x' hf := sorry

lemma relativeHomMap_points {X' : P.{u}} (x' : X' ⟶ B) (m : X ⟶ X') (hm : m ≫ x' = x)
    (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : x.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)) :
    (relativeHomMap f x hf x' m hm).app (op T) ⟨a, ⟨b, hb⟩⟩ =
      ⟨a, ⟨m.app _ b, by sorry⟩⟩ := sorry

lemma relativeHomMap_id : relativeHomMap f x hf x (𝟙 X) (by simp) = 𝟙 _ := sorry

lemma relativeHomMap_comp {X' X'' : P.{u}} (x' : X' ⟶ B) (x'' : X'' ⟶ B)
    (m : X ⟶ X') (m' : X' ⟶ X'') (hm : m ≫ x' = x) (hm' : m' ≫ x'' = x') :
    relativeHomMap f x hf x'' (m ≫ m') (by rw [Category.assoc, hm', hm]) =
      relativeHomMap f x hf x' m hm ≫ relativeHomMap f x' hf x'' m' hm' := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_identity
example (x : X ⟶ B) (hf : yoneda.relativelyRepresentable (𝟙 B)) :
    ∃ e : relativeHom (𝟙 B) x hf ≅ X,
      e.hom ≫ x = relativeHomToBase (𝟙 B) x hf := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_empty
example (B X : P.{u}) (f : yoneda.obj Scheme.empty.{u} ⟶ B) (x : X ⟶ B)
    (hf : yoneda.relativelyRepresentable f)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    ∃ e : relativeHom f x hf ≅ B, e.hom = relativeHomToBase f x hf := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.relativeHom_split_two
example (S : Scheme.{u}) (x : X ⟶ yoneda.obj S)
    (hf : yoneda.relativelyRepresentable
      (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))))
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    ∃ e : relativeHom (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) x hf ≅ pullback x x,
      e.hom ≫ pullback.fst x x ≫ x =
        relativeHomToBase (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) x hf := sorry

variable (z : X ⟶ Z)

def weilRestriction : P.{u} where
  obj T := Σ a : B.obj T,
    { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
      z.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)) }
  map := sorry
  map_id := sorry
  map_comp := sorry

def weilRestrictionToBase : weilRestriction f hf z ⟶ B where
  app T := TypeCat.ofHom fun s => s.1
  naturality := sorry

lemma weilRestriction_points (T : Scheme.{u}) :
    Nonempty ((weilRestriction f hf z).obj (op T) ≃
      Σ a : B.obj (op T),
        { b : X.obj (op (hf.pullback (yonedaEquiv.symm a))) //
          z.app (op (hf.pullback (yonedaEquiv.symm a))) b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)) }) := sorry

lemma weilRestriction_map_points {T T' : Scheme.{u}} (g : T' ⟶ T)
    (a : B.obj (op T)) (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a)))
    (h : hf.pullback (yonedaEquiv.symm (B.map g.op a)) ⟶ hf.pullback (yonedaEquiv.symm a))
    (hh : yoneda.map h ≫ hf.fst (yonedaEquiv.symm a) = hf.fst (yonedaEquiv.symm (B.map g.op a)))
    (hs : h ≫ hf.snd (yonedaEquiv.symm a) = hf.snd (yonedaEquiv.symm (B.map g.op a)) ≫ g) :
    (weilRestriction f hf z).map g.op ⟨a, ⟨b, hb⟩⟩ =
      ⟨B.map g.op a, ⟨X.map h.op b, by sorry⟩⟩ := sorry

lemma weilRestriction_ext (T : Scheme.{u})
    (s t : (weilRestriction f hf z).obj (op T)) (ha : s.1 = t.1)
    (hb : HEq s.2.1 t.2.1) : s = t := sorry

def weilRestrictionHomEquiv {V : P.{u}} (v : V ⟶ B) :
    { c : V ⟶ weilRestriction f hf z // c ≫ weilRestrictionToBase f hf z = v } ≃
      { b : pullback v f ⟶ X // b ≫ z = pullback.snd v f } := sorry

/-- The universal-property equivalence evaluates to the actual Z-section stored by a point. -/
lemma weilRestrictionHomEquiv_points (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))) :
    let v := yonedaEquiv.symm a
    let c := yonedaEquiv.symm
      (⟨a, ⟨b, hb⟩⟩ : (weilRestriction f hf z).obj (op T))
    pullback.lift (yoneda.map (hf.snd v)) (hf.fst v) (hf.isPullback v).w.symm ≫
      ((weilRestrictionHomEquiv f hf z v) ⟨c, by sorry⟩).val =
        yonedaEquiv.symm b := sorry

def weilRestrictionMap {X' : P.{u}} (z' : X' ⟶ Z) (m : X ⟶ X') (hm : m ≫ z' = z) :
    weilRestriction f hf z ⟶ weilRestriction f hf z' := sorry

lemma weilRestrictionMap_points {X' : P.{u}} (z' : X' ⟶ Z) (m : X ⟶ X') (hm : m ≫ z' = z)
    (T : Scheme.{u}) (a : B.obj (op T))
    (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
    (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))) :
    (weilRestrictionMap f hf z z' m hm).app (op T) ⟨a, ⟨b, hb⟩⟩ =
      ⟨a, ⟨m.app _ b, by sorry⟩⟩ := sorry

lemma weilRestrictionMap_id : weilRestrictionMap f hf z z (𝟙 X) (by simp) = 𝟙 _ := sorry

lemma weilRestrictionMap_comp {X' X'' : P.{u}} (z' : X' ⟶ Z) (z'' : X'' ⟶ Z)
    (m : X ⟶ X') (m' : X' ⟶ X'') (hm : m ≫ z' = z) (hm' : m' ≫ z'' = z') :
    weilRestrictionMap f hf z z'' (m ≫ m') (by rw [Category.assoc, hm', hm]) =
      weilRestrictionMap f hf z z' m hm ≫ weilRestrictionMap f hf z' z'' m' hm' := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_identity
example (z : X ⟶ B) (hf : yoneda.relativelyRepresentable (𝟙 B)) :
    ∃ e : weilRestriction (𝟙 B) hf z ≅ X,
      e.hom ≫ z = weilRestrictionToBase (𝟙 B) hf z := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_terminal
example : ∃ e : weilRestriction f hf (𝟙 Z) ≅ B,
    e.hom = weilRestrictionToBase f hf (𝟙 Z) := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_empty
example (B : P.{u}) (f : yoneda.obj Scheme.empty.{u} ⟶ B)
    (hf : yoneda.relativelyRepresentable f) :
    ∃ e : weilRestriction f hf (𝟙 (yoneda.obj Scheme.empty.{u})) ≅ B,
      e.hom = weilRestrictionToBase f hf (𝟙 (yoneda.obj Scheme.empty.{u})) := sorry

-- test: TauCeti.AlgebraicGeometry.ModuliDescent.weilRestriction_split_two
example {S X₁ X₂ : Scheme.{u}} (x₁ : X₁ ⟶ S) (x₂ : X₂ ⟶ S)
    (hf : yoneda.relativelyRepresentable
      (yoneda.map (coprod.desc (𝟙 S) (𝟙 S)))) :
    ∃ e : weilRestriction (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) hf
        (yoneda.map (coprod.map x₁ x₂)) ≅ yoneda.obj (pullback x₁ x₂),
      e.hom ≫ yoneda.map (pullback.fst x₁ x₂ ≫ x₁) =
        weilRestrictionToBase (yoneda.map (coprod.desc (𝟙 S) (𝟙 S))) hf
          (yoneda.map (coprod.map x₁ x₂)) := sorry



/- The following conjunctions spell the single SF.1 algebraic-space predicate directly in native
presheaf APIs. They introduce no second predicate, atlas carrier or category. -/
theorem relativeHom_algebraicity
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 B) (𝟙 B)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ B),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 Z) (𝟙 Z)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ Z),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 X) (𝟙 X)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ X),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hfin : ∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B),
      IsFinite (hf.snd a) ∧ Flat (hf.snd a) ∧ LocallyOfFinitePresentation (hf.snd a)) :
    let R := relativeHom f x hf
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := sorry

theorem weilRestriction_algebraicity
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 B) (𝟙 B)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ B),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 Z) (𝟙 Z)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ Z),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 X) (𝟙 X)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ X),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hfin : ∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B),
      IsFinite (hf.snd a) ∧ Flat (hf.snd a) ∧ LocallyOfFinitePresentation (hf.snd a)) (z : X ⟶ Z) :
    let R := weilRestriction f hf z
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := sorry

theorem weilRestriction_isSheaf
    (hB : Presheaf.IsSheaf Scheme.fppfTopology B)
    (hZ : Presheaf.IsSheaf Scheme.fppfTopology Z)
    (hX : Presheaf.IsSheaf Scheme.fppfTopology X) :
    Presheaf.IsSheaf Scheme.fppfTopology (weilRestriction f hf z) := sorry

theorem weilRestriction_baseChange {B' : P.{u}} (v : B' ⟶ B)
    (hf' : yoneda.relativelyRepresentable (pullback.fst v f)) :
    ∃ e : weilRestriction (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z) ≅
        pullback v (weilRestrictionToBase f hf z),
      e.hom ≫ pullback.fst v (weilRestrictionToBase f hf z) =
        weilRestrictionToBase (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z) ∧
      (∀ (T : Scheme.{u}) (a : yoneda.obj T ⟶ B')
        (c : yoneda.obj T ⟶
          weilRestriction (pullback.fst v f) hf' (pullback.fst (pullback.snd v f) z))
        (hc : c ≫ weilRestrictionToBase (pullback.fst v f) hf'
          (pullback.fst (pullback.snd v f) z) = a)
        (k : pullback (a ≫ v) f ⟶ pullback a (pullback.fst v f))
        (hk₁ : k ≫ pullback.fst a (pullback.fst v f) = pullback.fst (a ≫ v) f)
        (hk₂ : k ≫ pullback.snd a (pullback.fst v f) ≫ pullback.snd v f =
          pullback.snd (a ≫ v) f),
        ((weilRestrictionHomEquiv f hf z (a ≫ v))
          ⟨c ≫ e.hom ≫ pullback.snd v (weilRestrictionToBase f hf z), by sorry⟩).val =
          k ≫ ((weilRestrictionHomEquiv (pullback.fst v f) hf'
            (pullback.fst (pullback.snd v f) z) a) ⟨c, hc⟩).val ≫
              pullback.snd (pullback.snd v f) z) := sorry

/-- The cartesian comparison includes the exact point formulas, so no arbitrary maps can satisfy
this target in place of postcomposition, the identity section and the inclusion. -/
theorem weilRestriction_cartesian :
    ∃ (q : relativeHom f (z ≫ f) hf ⟶ relativeHom f f hf)
      (e : B ⟶ relativeHom f f hf)
      (j : weilRestriction f hf z ⟶ relativeHom f (z ≫ f) hf),
      IsPullback j (weilRestrictionToBase f hf z) q e ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T))
        (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
        (hb : (z ≫ f).app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a) ≫ f)),
        q.app (op T) ⟨a, ⟨b, hb⟩⟩ =
          ⟨a, ⟨z.app _ b, by sorry⟩⟩) ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T)),
        e.app (op T) a = ⟨a, ⟨yonedaEquiv (hf.fst (yonedaEquiv.symm a)), by sorry⟩⟩) ∧
      (∀ (T : Scheme.{u}) (a : B.obj (op T))
        (b : X.obj (op (hf.pullback (yonedaEquiv.symm a))))
        (hb : z.app _ b = yonedaEquiv (hf.fst (yonedaEquiv.symm a))),
        j.app (op T) ⟨a, ⟨b, hb⟩⟩ = ⟨a, ⟨b, by sorry⟩⟩) := sorry

theorem finiteSourceEtaleSections {U Z₀ : Scheme.{u}} (p : Z₀ ⟶ U)
    (hfin : IsFinite p) (hflat : Flat p) (hfp : LocallyOfFinitePresentation p)
    (hp : yoneda.relativelyRepresentable (yoneda.map p))
    (W : P.{u}) (w : W ⟶ yoneda.obj Z₀)
    (hW : Presheaf.IsSheaf Scheme.fppfTopology W ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 W) (𝟙 W)) ∧
      ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ W),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a)
    (hw : ∃ (V : Scheme.{u}) (a : yoneda.obj V ⟶ W),
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
      MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a ∧
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) (a ≫ w)) :
    let R := weilRestriction (yoneda.map p) hp w
    Presheaf.IsSheaf Scheme.fppfTopology R ∧
      yoneda.relativelyRepresentable (prod.lift (𝟙 R) (𝟙 R)) ∧
      (∃ (V : Scheme.{u}) (a : yoneda.obj V ⟶ R),
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a ∧
        MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u})
          (a ≫ weilRestrictionToBase (yoneda.map p) hp w)) ∧
      (Presheaf.IsLocallySurjective Scheme.etaleTopology w →
        Presheaf.IsLocallySurjective Scheme.etaleTopology
          (weilRestrictionToBase (yoneda.map p) hp w)) := sorry

/- Native library fixtures for the inherited adapter frontier: these are imports, not new
roadmap targets. The first fixture alone is NOT a transport of a comonad or its coalgebras. -/
section NativeAdjunctionFixtures
universe v
variable {C D : Type v} [Category C] [Category D]
    {F : C ⥤ D} {G G' : D ⥤ C} (a₁ : F ⊣ G) (a₂ : F ⊣ G')
example : G ≅ G' := Adjunction.rightAdjointUniq a₁ a₂
example (M : C) : a₁.unit.app M ≫ (Adjunction.rightAdjointUniq a₁ a₂).hom.app (F.obj M) =
    a₂.unit.app M := Adjunction.unit_rightAdjointUniq_hom_app a₁ a₂ M
example (M : D) : F.map ((Adjunction.rightAdjointUniq a₁ a₂).hom.app M) ≫ a₂.counit.app M =
    a₁.counit.app M := Adjunction.rightAdjointUniq_hom_app_counit a₁ a₂ M
example {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B) (hf : f.FaithfullyFlat) :
    ComonadicLeftAdjoint (ModuleCat.extendScalars f) := comonadicExtendScalars hf
end NativeAdjunctionFixtures



/- The comparison inputs below are concrete native evaluation and quotient universal properties.
They can be instantiated with the existing roadmap suppliers without inventing a local affine
restriction algebra, quotient definition or algebraic-space carrier. -/
theorem affineRestrictionComparison (Q : Scheme.{u}) (q : yoneda.obj Q ⟶ B)
    (evaluation : pullback q f ⟶ X) (hevaluation : evaluation ≫ z = pullback.snd q f)
    (hrepresenting : ∀ (T : Scheme.{u}) (v : yoneda.obj T ⟶ B)
      (b : pullback v f ⟶ X) (hb : b ≫ z = pullback.snd v f),
      ∃! c : { c : yoneda.obj T ⟶ yoneda.obj Q // c ≫ q = v },
        pullback.lift (pullback.fst v f ≫ c.val) (pullback.snd v f)
          (by rw [Category.assoc, c.property, pullback.condition]) ≫ evaluation = b) :
    IsIso ((weilRestrictionHomEquiv f hf z q).symm ⟨evaluation, hevaluation⟩).val := sorry

theorem finiteQuotientComparison {R U Q : Scheme.{u}} (s t : R ⟶ U) (q : U ⟶ Q)
    (hkernel : IsPullback (yoneda.map s) (yoneda.map t) (yoneda.map q) (yoneda.map q))
    (hcover : Presheaf.IsLocallySurjective Scheme.fppfTopology (yoneda.map q))
    (F : P.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (qF : yoneda.obj U ⟶ F) (hrelation : yoneda.map s ≫ qF = yoneda.map t ≫ qF)
    (hquotient : ∀ (Y : P.{u}) (hY : Presheaf.IsSheaf Scheme.fppfTopology Y)
      (b : yoneda.obj U ⟶ Y) (hb : yoneda.map s ≫ b = yoneda.map t ≫ b),
      ∃! c : F ⟶ Y, qF ≫ c = b) :
    ∃! e : yoneda.obj Q ≅ F, yoneda.map q ≫ e.hom = qF := sorry

/- TauCeti.AlgebraicGeometry.ModuliDescent.coherentPresentationDescent
Full geometric signature still requires SF.1's small-etale ringed-site and module carriers.
For locally Noetherian space X and etale scheme atlas U→X with R=U×_X U, restriction is an
exact equivalence from coherent O_X-modules to coherent modules on U with an isomorphism of the
two R-pullbacks satisfying identity and triple-overlap equations. All module maps are arrows.
The equivalence agrees with the scheme Zariski carrier, is independent of the presentation, and
commutes with base change to locally Noetherian spaces. Finite presentation is the replacement
condition for general non-Noetherian base changes. Invertible modules give the rank-one part.
No private module-on-a-space or opaque coherence predicate is introduced to type this statement.
Owner inputs: SF.1/space-quasi-coherent, small-etale-site and the inherited R09.3
space-fpqc-quasicoherent-descent and finite-presentation-module-descent. This is a recorded
signature gap, not a theorem present below under weaker hypotheses. -/

/- TauCeti.AlgebraicGeometry.ModuliDescent.polarizedDescentComparison
Full geometric signature still requires the requested SF.1 polarized-pair and relative-ampleness
interface. An fppf base cover S'→S carries a proper finitely presented Y'/S', relatively ample
invertible L', a cocycle on Y' and a specified compatible cocycle on L'. The general descended
pair is uniquely isomorphic, through its specified local identity, to the MC0E curve descent
where that supplier applies and to the SR Layer 2 etale polarized descent on that supplier's
domain. The isomorphism preserves the actual polarization lift, polarized morphisms and
sections, and obeys refinement and arbitrary-base-change coherence. Descent of L' alone neither
defines the descended object nor provides its object cocycle. No Prop-valued stand-in for relative
ampleness, a polarized scheme or its descent theorem appears in this file. -/

/- TauCeti.AlgebraicGeometry.ModuliDescent.finiteModuliDescentComparison
Full supplier specialization still requires MC0E's native descent functors and SF.1's space
embedding/descent interfaces. For finite locally free group G' over an fppf base cover with group
cocycle, compatible finite locally free closed subgroup, compatible torsor, and compatible finite
lists of sections and structure morphisms satisfying specified equations, compare simultaneous
MC0E descent with space/module descent. The unique isomorphism preserving the specified local
identifications preserves multiplication, identity, inverse, subgroup immersion, torsor action,
sections and every equation. It commutes with forgetting data and arbitrary base change. The
trivial group, identity subgroup, trivial torsor and split-cover nontrivial marking are acceptance
instances. Neither a second finite-group definition nor a private torsor carrier is introduced.
This does not assert a polarizing isogeny or abelian duality interface. -/

end TauCeti.AlgebraicGeometry.ModuliDescent
