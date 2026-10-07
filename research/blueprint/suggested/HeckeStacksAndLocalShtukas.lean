/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HeckeStacksAndLocalShtukas.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. No implementation is claimed: implementationStatus is
unchecked. Proofs are deliberately left to contributors.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The ordinary categorical and algebraic interfaces below are prototypes against
the actual baseline. Supplied categories/functors are parameters, not an asserted
construction of a relative curve, a v-stack, a solid category or a shtuka.
The omission catalogue at the end records exactly which geometric hypotheses
and theorem statements cannot yet be typed. Nothing replaces them by an arbitrary
Prop field. Equation fields, such as commuting partial Frobenii, specify actual
equations. The categorical tests elaborate; they do not verify the geometric
acceptance tests in the definitive reader.
-/

import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.End
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.GroupTheory.Coset.Basic
import Mathlib.Condensed.Module
import Mathlib.RingTheory.WittVector.Isocrystal
import TauCeti.RingTheory.Huber.Pair

noncomputable section
open CategoryTheory CategoryTheory.MonoidalCategory CategoryTheory.Limits

universe u v w
namespace TauCetiBlueprint.HeckeStacksAndLocalShtukas

variable {C D A B : Type u} [Category.{v} C] [Category.{v} D]
  [Category.{v} A] [Category.{v} B]

/- HS0: restriction-isomorphism data. RF4 supplies meromorphy, gluing and
   torsor descent; RF2 supplies the Cartier leg family. The restriction functor
   here is supplied for a fixed complement. Varying that complement coherently
   is a geometric condition omitted here, not assumed to follow from a tuple. -/
structure HckI (R : C ⥤ D) (I : Type w) (Leg : Type*) where
  source : C
  target : C
  legs : I → Leg
  modification : R.obj source ≅ R.obj target

namespace HckI
def p1 {R : C ⥤ D} {I : Type w} {Leg : Type*} (x : HckI R I Leg) : C := x.source
def p2 {R : C ⥤ D} {I : Type w} {Leg : Type*} (x : HckI R I Leg) : C × (I → Leg) :=
  (x.target, x.legs)
def «repeat» {R : C ⥤ D} {I J : Type w} {Leg : Type*} (a : I → J)
    (x : HckI R J Leg) : HckI R I Leg :=
  ⟨x.source, x.target, x.legs ∘ a, x.modification⟩

-- HckI.identity_test
example (R : C ⥤ D) (X : C) {I Leg : Type w} (legs : I → Leg) :
    p1 (⟨X, X, legs, Iso.refl _⟩ : HckI R I Leg) = X ∧
    (p2 (⟨X, X, legs, Iso.refl _⟩ : HckI R I Leg)).1 = X := by sorry
-- HckI.empty_test: with no removed divisor the supplied restriction is identity.
example {Leg : Type w} (x : HckI (𝟭 C) PEmpty Leg) :
    x.source ≅ x.target := by sorry
-- HckI.repeat_test
example {R : C ⥤ D} {Leg : Type w} (x : HckI R (Fin 1) Leg) :
    («repeat» (fun _ : Fin 2 => (0 : Fin 1)) x).legs 0 = x.legs 0 ∧
    («repeat» (fun _ : Fin 2 => (0 : Fin 1)) x).legs 1 = x.legs 0 := by sorry
end HckI

/- Intermediate objects are retained, including at collisions. -/
inductive ModificationChain : C → C → Type (max u v) where
  | nil (X : C) : ModificationChain X X
  | cons {X Y Z : C} (first : X ≅ Y) (rest : ModificationChain Y Z) :
      ModificationChain X Z

namespace ModificationChain
def compose {X Y : C} (c : ModificationChain X Y) : X ≅ Y := by sorry
lemma assoc {X Y Z W : C} (α : X ≅ Y) (β : Y ≅ Z) (γ : Z ≅ W) :
    (α.trans β).trans γ = α.trans (β.trans γ) := by sorry
-- ModificationChain.identity_test
example (X : C) : compose (nil X) = Iso.refl X := by sorry
-- ModificationChain.two_test
example {X Y Z : C} (α : X ≅ Y) (β : Y ≅ Z) :
    compose (cons α (cons β (nil Z))) = α.trans β := by sorry
-- ModificationChain.three_test
example {X Y Z W : C} (α : X ≅ Y) (β : Y ≅ Z) (γ : Z ≅ W) :
    compose (cons α (cons β (cons γ (nil W)))) = α.trans (β.trans γ) := by sorry
end ModificationChain

/- The collision chain is extra data, not replaced by its endpoint composite.
   Bounds, the infinity framing germ and Frobenius-translate patches are omitted. -/
structure TwistedPeriodData (R : C ⥤ D) (Frob : C ⥤ C) where
  bundle : C
  frobenius : R.obj (Frob.obj bundle) ≅ R.obj bundle
  collision : ModificationChain (R.obj (Frob.obj bundle)) (R.obj bundle)

namespace TwistedPeriodData
-- TwistedPeriodData.one_test
example {X Y : D} (α : X ≅ Y) :
    ModificationChain.compose (.cons α (.nil Y)) = α := by sorry
-- TwistedPeriodData.zero_test
example (X : D) : ModificationChain.compose (.nil X) = Iso.refl X := by sorry
-- TwistedPeriodData.collision_test
example {X Y Z : D} (α : X ≅ Y) (β : Y ≅ Z) :
    ModificationChain.compose (.cons α (.cons β (.nil Z))) = α.trans β := by sorry
end TwistedPeriodData

/- HS1: globalize an imported kernel; the full convolution monoidal structure
   and relative Verdier/solid dual are GS4/VS2 inputs. -/
def globalKernel (localKernel : C ⥤ D) (pull : D ⥤ A) : C ⥤ A :=
  localKernel ⋙ pull

namespace globalKernel
def map (localKernel : C ⥤ D) (pull : D ⥤ A) {X Y : C} (f : X ⟶ Y) :
    (globalKernel localKernel pull).obj X ⟶ (globalKernel localKernel pull).obj Y :=
  (globalKernel localKernel pull).map f
def tensor [MonoidalCategory C] [MonoidalCategory A]
    (localKernel : C ⥤ D) (pull : D ⥤ A)
    [(globalKernel localKernel pull).Monoidal] (X Y : C) :
    (globalKernel localKernel pull).obj X ⊗ (globalKernel localKernel pull).obj Y ≅
      (globalKernel localKernel pull).obj (X ⊗ Y) := by sorry
-- globalKernel.identity_test: the imported monoidal structure preserves its actual unit.
example [MonoidalCategory C] [MonoidalCategory A] (K : C ⥤ D) (P : D ⥤ A)
    [(globalKernel K P).Monoidal] :
    (globalKernel K P).obj (𝟙_ C) ≅ 𝟙_ A := by sorry
-- globalKernel.map_id_test
example (K : C ⥤ D) (P : D ⥤ A) (X : C) :
    map K P (𝟙 X) = 𝟙 ((globalKernel K P).obj X) := by sorry
-- globalKernel.map_comp_test
example (K : C ⥤ D) (P : D ⥤ A) {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    map K P (f ≫ g) = map K P f ≫ map K P g := by sorry
end globalKernel

def heckeOperator [MonoidalCategory D] (pull : C ⥤ D) (kernel : D)
    (homology : D ⥤ A) : C ⥤ A := pull ⋙ tensorRight kernel ⋙ homology

namespace heckeOperator
lemma obj [MonoidalCategory D] (P : C ⥤ D) (S : D) (H : D ⥤ A) (X : C) :
    (heckeOperator P S H).obj X = H.obj (P.obj X ⊗ S) := by sorry
def map [MonoidalCategory D] (P : C ⥤ D) (S : D) (H : D ⥤ A)
    {X Y : C} (f : X ⟶ Y) : (heckeOperator P S H).obj X ⟶
      (heckeOperator P S H).obj Y := (heckeOperator P S H).map f
-- heckeOperator.obj_test
example [MonoidalCategory D] (P : C ⥤ D) (S : D) (H : D ⥤ A) (X : C) :
    (heckeOperator P S H).obj X = H.obj (P.obj X ⊗ S) := by sorry
-- heckeOperator.map_id_test
example [MonoidalCategory D] (P : C ⥤ D) (S : D) (H : D ⥤ A) (X : C) :
    map P S H (𝟙 X) = 𝟙 ((heckeOperator P S H).obj X) := by sorry
-- heckeOperator.map_comp_test
example [MonoidalCategory D] (P : C ⥤ D) (S : D) (H : D ⥤ A)
    {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    map P S H (f ≫ g) = map P S H f ≫ map P S H g := by sorry
-- heckeOperator.unit_test
example [MonoidalCategory D] :
    heckeOperator (𝟭 D) (𝟙_ D) (𝟭 D) ≅ 𝟭 D := by sorry
end heckeOperator

def condensedStructure (evaluation : CompHausᵒᵖ ⥤ C) : CompHausᵒᵖ ⥤ C := evaluation
namespace condensedStructure
def pullback (P : CompHausᵒᵖ ⥤ C) {S T : CompHaus} (f : S ⟶ T) :
    P.obj (Opposite.op T) ⟶ P.obj (Opposite.op S) := P.map f.op
def coefficients {Λ : Type (u + 1)} [Ring Λ] (M : CondensedMod.{u} Λ) :
    CondensedMod.{u} Λ := M
-- condensedStructure.identity_test
example (P : CompHausᵒᵖ ⥤ C) (S : CompHaus) :
    pullback P (𝟙 S) = 𝟙 (P.obj (Opposite.op S)) := by sorry
-- condensedStructure.composition_test
example (P : CompHausᵒᵖ ⥤ C) {S T U : CompHaus} (f : S ⟶ T) (g : T ⟶ U) :
    pullback P (f ≫ g) = pullback P g ≫ pullback P f := by sorry
-- condensedStructure.point_test
example (P : CompHausᵒᵖ ⥤ C) :
    (condensedStructure P).obj (Opposite.op (CompHaus.of PUnit)) =
      P.obj (Opposite.op (CompHaus.of PUnit)) := by sorry
end condensedStructure

/- HS2: Frobenius restriction isomorphism and the algebraic framing matrix.
   The identification with b near infinity, integral lattice and Schubert bound
   cannot yet be typed. They are not arbitrary additional proposition fields. -/
structure ShtukaDatum (R : C ⥤ D) (Frob : C ⥤ C) (G : Type w) where
  bundle : C
  frobenius : R.obj (Frob.obj bundle) ≅ R.obj bundle
  framingMatrix : G

namespace ShtukaDatum
def changeFrame {G : Type w} [Group G] (σ : G →* G) (b y : G) : G :=
  σ y * b * y⁻¹
-- ShtukaDatum.identity_frame_test
example {G : Type w} [Group G] (σ : G →* G) (b : G) :
    changeFrame σ b 1 = b := by sorry
-- ShtukaDatum.scalar_frame_test
example {G : Type w} [CommGroup G] (b y : G) :
    changeFrame (MonoidHom.id G) b y = b := by sorry
-- ShtukaDatum.composite_frame_test
example {G : Type w} [Group G] (σ : G →* G) (b y z : G) :
    changeFrame σ (changeFrame σ b y) z = changeFrame σ b (z * y) := by sorry
end ShtukaDatum

abbrev FramedModification (R : C ⥤ D) (X Y : C) := R.obj X ≅ R.obj Y
namespace FramedModification
def sourceAction {R : C ⥤ D} {X Y : C} (a : R.obj X ≅ R.obj X)
    (α : FramedModification R X Y) : FramedModification R X Y := a.symm.trans α
def targetAction {R : C ⥤ D} {X Y : C} (c : R.obj Y ≅ R.obj Y)
    (α : FramedModification R X Y) : FramedModification R X Y := α.trans c
-- FramedModification.identity_test
example {R : C ⥤ D} {X Y : C} (α : FramedModification R X Y) :
    sourceAction (Iso.refl _) α = α ∧ targetAction (Iso.refl _) α = α := by sorry
-- FramedModification.commute_test
example {R : C ⥤ D} {X Y : C} (α : FramedModification R X Y)
    (a : R.obj X ≅ R.obj X) (c : R.obj Y ≅ R.obj Y) :
    sourceAction a (targetAction c α) = targetAction c (sourceAction a α) := by sorry
-- FramedModification.inverse_test
example {R : C ⥤ D} {X Y : C} (α : FramedModification R X Y)
    (a : R.obj X ≅ R.obj X) : sourceAction a.symm (sourceAction a α) = α := by sorry
end FramedModification

/- These are the locally trivialized coset fibres. Compact/open/pro-p topology,
   v-sheaf quotient, finite étale representability and limit descent are omitted. -/
abbrev LatticeSpace {G : Type u} [Group G] (K : Subgroup G) := G ⧸ K
namespace LatticeSpace
def coset {G : Type u} [Group G] (K : Subgroup G) (g : G) : LatticeSpace K :=
  QuotientGroup.mk g
def restrict {G : Type u} [Group G] {K L : Subgroup G} (h : K ≤ L) :
    LatticeSpace K → LatticeSpace L := Subgroup.quotientMapOfLE h
-- LatticeSpace.top_test
example {G : Type u} [Group G] : Subsingleton (LatticeSpace (⊤ : Subgroup G)) := by sorry
-- LatticeSpace.bottom_test
example {G : Type u} [Group G] (g h : G) :
    coset (⊥ : Subgroup G) g = coset (⊥ : Subgroup G) h ↔ g = h := by sorry
-- LatticeSpace.equal_level_test
example {G : Type u} [Group G] (K : Subgroup G) (x : LatticeSpace K) :
    restrict (le_refl K) x = x := by sorry
end LatticeSpace

def LevelTower (G : Type u) [Group G] : Subgroup G ⥤ Type u := by sorry
namespace LevelTower
def transition {G : Type u} [Group G] {K L : Subgroup G} (h : K ≤ L) :
    LatticeSpace K → LatticeSpace L := LatticeSpace.restrict h
lemma transition_comp {G : Type u} [Group G] {K L M : Subgroup G}
    (h : K ≤ L) (j : L ≤ M) (x : LatticeSpace K) :
    transition j (transition h x) = transition (h.trans j) x := by sorry
-- LevelTower.identity_test
example {G : Type u} [Group G] (K : Subgroup G) (x : LatticeSpace K) :
    transition (le_refl K) x = x := by sorry
-- LevelTower.compose_test
example {G : Type u} [Group G] {K L M : Subgroup G}
    (h : K ≤ L) (j : L ≤ M) (x : LatticeSpace K) :
    transition j (transition h x) = transition (h.trans j) x := by sorry
-- LevelTower.representative_test
example {G : Type u} [Group G] {K L : Subgroup G} (h : K ≤ L) (g : G) :
    transition h (LatticeSpace.coset K g) = LatticeSpace.coset L g := by sorry
end LevelTower

structure Rigidification (diamond : C ⥤ D) (X : D) where
  space : C
  comparison : diamond.obj space ≅ X
namespace Rigidification
-- Rigidification.image_test
example {F : C ⥤ D} {X : D} (r : Rigidification F X) : F.obj r.space ≅ X := by sorry
-- Rigidification.identity_test
example (F : C ⥤ D) (M : C) : Rigidification F (F.obj M) := by sorry
-- Rigidification.inverse_test
example {F : C ⥤ D} {X : D} (r : Rigidification F X) :
    r.comparison.hom ≫ r.comparison.inv = 𝟙 (F.obj r.space) := by sorry
end Rigidification

/- A chosen coordinate on a geometric fibre, not a global trivialization of L_b. -/
structure admissiblePeriodTorsor (G X : Type u) where
  coordinate : G ≃ X
namespace admissiblePeriodTorsor
def point {G X : Type u} (t : admissiblePeriodTorsor G X) (g : G) : X := t.coordinate g
def translate {G X : Type u} [Group G] (t : admissiblePeriodTorsor G X)
    (g : G) (x : X) : X := t.coordinate (g * t.coordinate.symm x)
-- admissiblePeriodTorsor.unit_test
example {G X : Type u} [Group G] (t : admissiblePeriodTorsor G X) (x : X) :
    translate t 1 x = x := by sorry
-- admissiblePeriodTorsor.transitive_test
example {G X : Type u} [Group G] (t : admissiblePeriodTorsor G X) (x y : X) :
    ∃! g : G, translate t g x = y := by sorry
-- admissiblePeriodTorsor.compose_test
example {G X : Type u} [Group G] (t : admissiblePeriodTorsor G X) (g h : G) (x : X) :
    translate t g (translate t h x) = translate t (g * h) x := by sorry
end admissiblePeriodTorsor

/- HS3: coefficients have already been relatively dualized and completed on
   each qc support. A supplied colimit diagram uses the finite-étale pullbacks. -/
def compactSupportAtLevel (homology : D ⥤ C) (coefficient : D) : C :=
  homology.obj coefficient
namespace compactSupportAtLevel
def coefficientMap (H : D ⥤ C) {S T : D} (f : S ⟶ T) :
    compactSupportAtLevel H S ⟶ compactSupportAtLevel H T := H.map f
-- compactSupportAtLevel.obj_test
example (H : D ⥤ C) (S : D) : compactSupportAtLevel H S = H.obj S := by sorry
-- compactSupportAtLevel.map_id_test
example (H : D ⥤ C) (S : D) : coefficientMap H (𝟙 S) = 𝟙 (H.obj S) := by sorry
-- compactSupportAtLevel.map_comp_test
example (H : D ⥤ C) {S T U : D} (f : S ⟶ T) (g : T ⟶ U) :
    coefficientMap H (f ≫ g) = coefficientMap H f ≫ coefficientMap H g := by sorry
end compactSupportAtLevel

def towerCompactSupport {J : Type w} [Category J] (diagram : J ⥤ C)
    [HasColimit diagram] : C := colimit diagram

def shtukaKernel (pull : D ⥤ C) (extendedKernel : D) : C := pull.obj extendedKernel
namespace shtukaKernel
def map (P : D ⥤ C) {S T : D} (f : S ⟶ T) : shtukaKernel P S ⟶ shtukaKernel P T := P.map f
-- shtukaKernel.identity_test
example (P : D ⥤ C) (S : D) : map P (𝟙 S) = 𝟙 (P.obj S) := by sorry
end shtukaKernel

structure PartialFrobenius (I : Type w) (X : C) where
  operator : I → (X ≅ X)
  commute : ∀ i j, (operator i).hom ≫ (operator j).hom =
    (operator j).hom ≫ (operator i).hom
namespace PartialFrobenius
-- PartialFrobenius.commute_test
example {I : Type w} {X : C} (F : PartialFrobenius I X) (i j : I) :
    (F.operator i).hom ≫ (F.operator j).hom =
      (F.operator j).hom ≫ (F.operator i).hom := by sorry
-- PartialFrobenius.one_test
example {X : C} (α : X ≅ X) : PartialFrobenius PUnit X := by sorry
end PartialFrobenius

/- HS4: both snake identities, transported through a strong monoidal functor.
   For the actual action D is the endofunctor category; collisions/Weil continuity
   are separate imported conditions, not asserted for arbitrary independent legs. -/
section DualLegs
variable [MonoidalCategory C] [MonoidalCategory D]
  (F : C ⥤ D) [F.Monoidal] (V W : C) [ExactPairing V W]
def createDualLegs : 𝟙_ D ⟶ F.obj V ⊗ F.obj W :=
  (Functor.Monoidal.εIso F).hom ≫ F.map (η_ V W) ≫ (Functor.Monoidal.μIso F V W).inv
def annihilateDualLegs : F.obj W ⊗ F.obj V ⟶ 𝟙_ D :=
  (Functor.Monoidal.μIso F W V).hom ≫ F.map (ε_ V W) ≫ (Functor.Monoidal.εIso F).inv
namespace dualLegs
lemma leftTriangle : createDualLegs F V W ▷ F.obj V ≫
    (α_ (F.obj V) (F.obj W) (F.obj V)).hom ≫
    F.obj V ◁ annihilateDualLegs F V W =
    (λ_ (F.obj V)).hom ≫ (ρ_ (F.obj V)).inv := by sorry
lemma rightTriangle : F.obj W ◁ createDualLegs F V W ≫
    (α_ (F.obj W) (F.obj V) (F.obj W)).inv ≫
    annihilateDualLegs F V W ▷ F.obj W =
    (ρ_ (F.obj W)).hom ≫ (λ_ (F.obj W)).inv := by sorry
-- dualLegs.coevaluation_test
example : createDualLegs F V W =
    (Functor.Monoidal.εIso F).hom ≫ F.map (η_ V W) ≫
      (Functor.Monoidal.μIso F V W).inv := by sorry
-- dualLegs.evaluation_test
example : annihilateDualLegs F V W =
    (Functor.Monoidal.μIso F W V).hom ≫ F.map (ε_ V W) ≫
      (Functor.Monoidal.εIso F).inv := by sorry
-- dualLegs.triangle_test
example : F.map ((λ_ V).inv ≫ η_ V W ▷ V ≫ (α_ V W V).hom ≫
    V ◁ ε_ V W ≫ (ρ_ V).hom) = 𝟙 (F.obj V) := by sorry
end dualLegs
end DualLegs

/- Ordinary categorical forms of two central named results. The first is the
   formal rigidity argument in IX.2.2, not a reconstruction of its geometric
   lisse-preservation or compactness hypotheses. -/
section FormalAction
variable [MonoidalCategory C]
attribute [local instance] CategoryTheory.endofunctorMonoidalCategory

def heckeBiadjoint (action : C ⥤ (D ⥤ D)) [action.Monoidal]
    (V W : C) [ExactPairing V W] [ExactPairing W V] :
    (action.obj V ⊣ action.obj W) × (action.obj W ⊣ action.obj V) := by sorry

def coherentHeckeTensor (action : C ⥤ (D ⥤ D)) [action.Monoidal] (V W : C) :
    action.obj V ⋙ action.obj W ≅ action.obj (V ⊗ W) := by sorry

def coherentHeckeUnit (action : C ⥤ (D ⥤ D)) [action.Monoidal] :
    action.obj (𝟙_ C) ≅ 𝟭 D := by sorry
end FormalAction

/- Named geometric theorem omission catalogue (the packet's final gap).

HS0/descent-and-bounded-fibres: v-descent, bounded relative Gr comparison,
  proper/spatial/finite dim.trg. Missing typed RF2/RF4/GS0/D5 geometry.
HS0/structure-group-and-inner-form: basic inner-form equivalence and κ difference;
  the ordinary isomorphisms above do not construct the geometric equivalence.
HS0/demazure-generators-of-ULA-kernels (parent HS1): affine-FLAG ULA generation
  and preservation of D_lis. Missing GS1 and VII.4.3/VS3 predicates.
HS1/properties-and-weil-equivariance: heckeBiadjoint is its formal rigidity form;
  enhanced limit/colimit/compact preservation awaits E5/VS4, not ordinary modules.
HS1/ula-preservation: perfect RHom against every compact and lisse VII.7.9.
HS1/duality-exchange: compact lisse BZ and sw* exchange; missing VII.7.6–.10.
HS1/continuous-weil-descent: condensed animated W_E^I→Aut(A), Drinfeld full
  faithfulness and lisse image. An ordinary evaluation presheaf is insufficient.
HS1/coefficient-base-change: derived solid tensor and enhanced comparisons.
HS2/local-shtuka-moduli: integral meromorphy, infinity framing germ, pointwise
  Schubert bounds (including repeated untilts); framingMatrix alone is not b-data.
HS2/one-leg-period-map and admissible-period-torsor: étale/quasi-pro-étale period
  maps and the universal crystalline torsor; coordinates only model a geometric fibre.
HS2/multi-leg-period-and-representability: Frobenius collisions, generic extension,
  lattice descent and locally spatial diamonds; no properness of shtuka levels.
HS2/no-legs-and-basic-duality: no legs is empty unless [b]=1, then G(Q_p)/K;
  basic tower duality interchanges G and J_b with inverse μ. Not a classifying stack.
HS2/general-local-field: RF4 general-O_E integral equivalence remains requested;
  equal characteristic cannot be obtained by renaming Q_p and Witt vectors.
HS2/minuscule-rigidification: Rigidification is only the fibre of a supplied
  diamond functor; smoothness, minuscule μ, b∈B(G,μ⁻¹), and étaleness are omitted.
HS2/nonemptiness-and-period-connectedness: B(G,μ⁻¹), rigid points, open/closed
  Schubert admissibility, geometric connectedness and density. Missing BG/GS geometry.
HS2/component-transitivity-source-gate: intentionally no purported proof of GLX3.12.
  E01/T21 refutes the unrestricted noncompact-torsor lemma; a restricted proof is needed.
HS2/classical-period-points: finite-F BB/weak-admissibility comparison only;
  do not assert an isomorphism of all nonminuscule diamonds.
HS2/adjoint-period-and-tower-comparison and torus-products-and-determinant:
  contracted products, fixed κ and actual image levels are geometric conditions.
HS3/hecke-cohomology-comparison: i_b^* T_W(j_!c-Ind_K Λ), relative dual kernel,
  fusion across twisted diagonals and continuous group/Weil actions.
HS3/huber-cohomology-comparison: higher-dimensional partially proper analytic
  shriek/dualizing/trace comparison, with completion inside the qc support colimit.
HS3/compactness-of-shtuka-cohomology: pro-p compactness in the enhanced derived
  smooth category, not finite total Λ-rank or arbitrary-level compactness.
HS3/general-bound-compactness: Satake coefficients and IX.3.2 pro-p range;
  all-level scope requires resolution of the packet's explicit gap.
HS3/admissibility-duality-and-adjunction: perfect pro-p invariants, i_1^* and
  lisse BZ, with rational finite-length hypotheses kept separate.
HS3/level-trace-and-pullback: degree/deck-sum identities and normalization only
  at unit index; no arbitrary finite-group averaging over Λ.
HS3/classical-comparison: independent ET.6a O_E-linear LT/Drinfeld construction;
  SW24.2.5 and24.3.5 require actual Dieudonné/BKF, chain, tensor/polarization data.
HS4/monoidal-and-finite-set-functoriality: coherentHeckeTensor and coherentHeckeUnit
  give ordinary tensor/unit forms; all finite-set enhanced/Weil coherences remain GS/E5 inputs.
HS4/creation-annihilation-and-triangles: both actual equations are stated above;
  diagonal collision/continuous Weil conditions are omitted, not independent-leg invariance.
HS4/isogeny-product-and-weil-restriction-diagrams: π♮Λ correction and exact kernel;
  not a blanket pullback-commutation theorem. Product and Weil-restriction diagrams
  retain external tensors and induction/half-Tate normalizations respectively.
HS4/levi-compatibility: the source proves a supported torsion calculation; the
  eligible enhanced correspondence is still a supplier refinement.
HS4/continuous-tensor-generator-export: IX.5.1 is downstream ES1 work; its uniform
  wild subgroup is never assumed to construct this action. No ES1 prerequisite.
-/

end TauCetiBlueprint.HeckeStacksAndLocalShtukas
