import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.CategoryTheory.Exact.Frobenius
import TauCeti.CategoryTheory.Exact.Conflation

/-!
# GeneralAlgebraicKTheory: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. The declarations specify actual Q-spans,
based path fibres, finite-projective functors, Waldhausen pushout conditions, Nil objects,
and finite chain domination. The chosen directions of spans, relative differences,
projective-line twists and Euler signs are explicit. Proofs and new constructions use
`sorry`; elaboration does not establish their mathematical correctness. Definitions whose
full interfaces cannot yet be typed are named in the closing comment.
-/

noncomputable section

universe u v w

namespace TauCetiRoadmap.GeneralAlgebraicKTheory

open CategoryTheory CategoryTheory.Limits TauCeti
open scoped ZeroObject ContinuousMap

/-! ## Layer 1: Categorical homotopy tools -/

/-- A point of an existing topological-space carrier. -/
structure BasedSpace where
  space : TopCat.{u}
  point : space

instance : CoeSort BasedSpace (Type u) := ⟨fun X => X.space⟩
instance (X : BasedSpace) : TopologicalSpace X := X.space.str

/-- A continuous map with the specified basepoint equation. -/
structure BasedMap (X Y : BasedSpace.{u}) where
  map : C(X, Y)
  map_point : map X.point = Y.point

/-- The identity and composite retain their basepoint equations. -/
def BasedMap.id (X : BasedSpace) : BasedMap X X := ⟨ContinuousMap.id X, rfl⟩
def BasedMap.comp {X Y Z : BasedSpace} (g : BasedMap Y Z) (f : BasedMap X Y) :
    BasedMap X Z := ⟨g.map.comp f.map, by simp [f.map_point, g.map_point]⟩

/-- The fibre uses paths from the target basepoint to the image point. -/
def HomotopyFibre {X Y : BasedSpace} (f : BasedMap X Y) : Type u :=
  Σ x : X, Path Y.point (f.map x)

instance {X Y : BasedSpace} (f : BasedMap X Y) : TopologicalSpace (HomotopyFibre f) :=
  TopologicalSpace.induced
    (fun z => (z.1, (z.2 : C(unitInterval, Y)))) inferInstance

/-- The based path-pair model, with the constant path at the basepoint. -/
def HomotopyFibre.based {X Y : BasedSpace} (f : BasedMap X Y) : BasedSpace :=
  ⟨TopCat.of (HomotopyFibre f), ⟨X.point, f.map_point ▸ Path.refl Y.point⟩⟩

/-- Strict commuting squares act by mapping paths; a homotopy square requires its homotopy. -/
def HomotopyFibre.map {X Y X' Y' : BasedSpace}
    (f : BasedMap X Y) (f' : BasedMap X' Y')
    (a : BasedMap X X') (b : BasedMap Y Y')
    (h : b.map.comp f.map = f'.map.comp a.map) :
    BasedMap (HomotopyFibre.based f) (HomotopyFibre.based f') := sorry

example (X : BasedSpace) :
    Nonempty ((HomotopyFibre.based (BasedMap.id X)) ≃ₕ PUnit) := sorry
example (Y : BasedSpace) :
    Nonempty (HomotopyFibre.based
      (⟨ContinuousMap.const PUnit Y.point, rfl⟩ : BasedMap ⟨TopCat.of PUnit, PUnit.unit⟩ Y)
      ≃ₕ LoopSpace Y Y.point) := sorry
example (X : BasedSpace) :
    Nonempty (HomotopyFibre.based
      (⟨ContinuousMap.const X PUnit.unit, rfl⟩ :
        BasedMap X ⟨TopCat.of PUnit, PUnit.unit⟩) ≃ₕ X) := sorry

/-- Classifying spaces use Mathlib's existing nerve and realization. -/
abbrev classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} :=
  SSet.toTop.obj (CategoryTheory.nerve C)

/-- Realize the existing nerve map of a functor. -/
abbrev classifyingSpaceMap {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) : C(classifyingSpace C, classifyingSpace D) :=
  (SSet.toTop.map (CategoryTheory.nerveMap F)).hom

/-- The vertex inclusion of the chosen object supplies a point. -/
def classifyingSpacePoint {C : Type u} [Category.{v} C] (x : C) : classifyingSpace C :=
  (SSet.toTop.map
    (SSet.yonedaEquiv.symm (CategoryTheory.ComposableArrows.mk₀ x))).hom default

/-- A natural transformation realizes to the cylinder homotopy of its two functors. -/
def classifyingSpace_natTrans {C D : Type u} [Category.{u} C] [Category.{u} D]
    {F G : C ⥤ D} (α : F ⟶ G) :
    ContinuousMap.Homotopy (classifyingSpaceMap F) (classifyingSpaceMap G) := sorry

/-- An equivalence gives an actual homotopy equivalence, rather than equality of carriers. -/
def classifyingSpace_equivalence {C D : Type u} [Category.{u} C] [Category.{u} D]
    (e : C ≌ D) : classifyingSpace C ≃ₕ classifyingSpace D := sorry

example : Nonempty (classifyingSpace (Discrete PUnit) ≃ₕ PUnit) := sorry
example : ¬ Nonempty (classifyingSpace (Discrete Bool) ≃ₕ PUnit) := sorry
example {C : Type u} [Category.{u} C] [HasZeroObject C] :
    Nonempty (classifyingSpace C ≃ₕ PUnit) := sorry

/-- The based loop space uses the constant loop as point. -/
def BasedSpace.loop (X : BasedSpace.{u}) : BasedSpace.{u} :=
  ⟨TopCat.of (LoopSpace X X.point), Path.refl X.point⟩

/-- Based maps act continuously on based loops. -/
def BasedMap.loop {X Y : BasedSpace.{u}} (f : BasedMap X Y) :
    BasedMap X.loop Y.loop := sorry

/-- Adjoint structure maps specify a sequential prespectrum. -/
structure Prespectrum where
  level : ℕ → BasedSpace.{u}
  structureMap : ∀ n, BasedMap (level n) (level (n+1)).loop

/-- Strict maps commute with the adjoint structure squares. -/
structure PrespectrumMap (E F : Prespectrum.{u}) where
  levelMap : ∀ n, BasedMap (E.level n) (F.level n)
  commute : ∀ n, BasedMap.comp (BasedMap.loop (levelMap (n+1))) (E.structureMap n) =
    BasedMap.comp (F.structureMap n) (levelMap n)

/-- The zero prespectrum has a one-point space at every level. -/
def Prespectrum.zero : Prespectrum.{u} := sorry

example (n : ℕ) : Subsingleton (Prespectrum.zero.{u}.level n) := sorry
example (X : BasedSpace.{u}) : BasedMap.loop (BasedMap.id X) = BasedMap.id X.loop := sorry
example {X Y Z : BasedSpace.{u}} (f : BasedMap X Y) (g : BasedMap Y Z) :
    BasedMap.loop (BasedMap.comp g f) = BasedMap.comp g.loop f.loop := sorry

/-- The sphere interchange exponent retains the integer grading. -/
def sphereInterchangeSign (i j : ℤ) : ℤˣ := (-1) ^ (i * j)

example : sphereInterchangeSign 1 1 = -1 := by decide
example : sphereInterchangeSign 1 2 = 1 := by decide
example : sphereInterchangeSign (-1) 1 = -1 := by decide
example {A : Type*} [AddCommGroup A] (x : A) (h : x = -x) : 2 • x = 0 := by
  have : x + x = 0 := (congrArg (fun y => y + x) h).trans (neg_add_cancel x)
  simpa [two_nsmul] using this

/-! ## Layer 2: Quillen categories and connective groups -/

section Quillen

variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C]

/-- A Q-span has a deflation to its source and an inflation to its target. -/
structure QSpan (E : ExactStructure C) (X Y : C) where
  middle : C
  left : middle ⟶ X
  right : middle ⟶ Y
  deflation : E.IsDeflation left
  inflation : E.IsInflation right

/-- Representatives agree by an isomorphism fixing both endpoint maps. -/
def qSpanSetoid (E : ExactStructure C) (X Y : C) : Setoid (QSpan E X Y) where
  r a b := ∃ e : a.middle ≅ b.middle,
    e.hom ≫ b.left = a.left ∧ e.hom ≫ b.right = a.right
  iseqv := sorry

/-- Q has the same objects as the chosen exact category. -/
structure QCat (E : ExactStructure C) where
  obj : C

/-- Category laws are proved using pullback composition of span representatives. -/
instance qCategory (E : ExactStructure C) : Category (QCat E) where
  Hom X Y := Quotient (qSpanSetoid E X.obj Y.obj)
  id X := Quotient.mk _ ⟨X.obj, 𝟙 _, 𝟙 _, E.isDeflation_id X.obj,
    E.isInflation_id X.obj⟩
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

namespace QCat

/-- The ordinary inflation gives the identity-left span. -/
def inflation (E : ExactStructure C) {X Y : C} (i : X ⟶ Y) (hi : E.IsInflation i) :
    QCat.mk X ⟶ (QCat.mk Y : QCat E) :=
  Quotient.mk _ ⟨X, 𝟙 _, i, E.isDeflation_id X, hi⟩

/-- A deflation Y→X becomes a Q-arrow X→Y. -/
def deflation (E : ExactStructure C) {X Y : C} (p : Y ⟶ X) (hp : E.IsDeflation p) :
    QCat.mk X ⟶ (QCat.mk Y : QCat E) :=
  Quotient.mk _ ⟨Y, p, 𝟙 _, hp, E.isInflation_id Y⟩

/-- An admissible subobject remembers the inflation and its domain. -/
structure AdmissibleSubobject (E : ExactStructure C) (Y : C) where
  obj : C
  arrow : obj ⟶ Y
  inflation : E.IsInflation arrow

/-- Subobjects are quotiented by endpoint-preserving isomorphisms. -/
def subobjectSetoid (E : ExactStructure C) (Y : C) : Setoid (AdmissibleSubobject E Y) where
  r a b := ∃ e : a.obj ≅ b.obj, e.hom ≫ b.arrow = a.arrow
  iseqv := sorry

/-- Arrows out of zero classify all admissible subobjects, including the whole object. -/
def hom_zero (E : ExactStructure C) (Y : C) :
    (QCat.mk (0 : C) ⟶ (QCat.mk Y : QCat E)) ≃ Quotient (subobjectSetoid E Y) := sorry

/-- The normal form is a reversed deflation followed by an inflation. -/
theorem factor (E : ExactStructure C) (X Y : C)
    (f : QCat.mk X ⟶ (QCat.mk Y : QCat E)) :
    ∃ (M : C) (p : M ⟶ X) (i : M ⟶ Y)
      (hp : E.IsDeflation p) (hi : E.IsInflation i),
      f = deflation E p hp ≫ inflation E i hi := sorry

/-- Q-isomorphisms are exactly ordinary isomorphisms. -/
def isoQ_equiv_iso (E : ExactStructure C) (X Y : C) :
    (QCat.mk X ≅ (QCat.mk Y : QCat E)) ≃ (X ≅ Y) := sorry

variable {D : Type u} [Category.{u} D] [Preadditive D]
  [HasZeroObject D] [HasBinaryBiproducts D]

/-- A supplied conflation-exact additive functor acts on Q-spans. -/
def map (E : ExactStructure C) (E' : ExactStructure D) (F : C ⥤ D) [F.Additive]
    (hF : E.IsConflationExact E' F) : QCat E ⥤ QCat E' := sorry

/-- Object values are the original exact functor values. -/
theorem map_obj (E : ExactStructure C) (E' : ExactStructure D) (F : C ⥤ D) [F.Additive]
    (hF : E.IsConflationExact E' F) (X : C) :
    (map E E' F hF).obj (QCat.mk X) = QCat.mk (F.obj X) := sorry

example (E : ExactStructure C) (X : C) :
    inflation E (𝟙 X) (E.isInflation_id X) = 𝟙 (QCat.mk X) := sorry
example (E : ExactStructure C) (X : C) :
    deflation E (𝟙 X) (E.isDeflation_id X) = 𝟙 (QCat.mk X) := sorry
example (E : ExactStructure C) (Y : C) :
    Function.Bijective (hom_zero E Y) := (hom_zero E Y).bijective

/-- The two special subobjects give the two edges out of zero. -/
def zeroTo (E : ExactStructure C) (X : C) : QCat.mk (0 : C) ⟶ (QCat.mk X : QCat E) := sorry

def wholeTo (E : ExactStructure C) (X : C) : QCat.mk (0 : C) ⟶ (QCat.mk X : QCat E) := sorry

example (E : ExactStructure C) (X : C) (h : ¬ IsZero X) : zeroTo E X ≠ wholeTo E X := sorry
example (E : ExactStructure C) : zeroTo E (0 : C) = wholeTo E (0 : C) := sorry
example (E : ExactStructure C) (X Y : C) (e : X ≅ Y) :
    Nonempty (QCat.mk X ≅ (QCat.mk Y : QCat E)) := sorry

end QCat

/-- The zero object supplies the vertex basepoint in BQ. -/
def QBasedSpace (E : ExactStructure C) : BasedSpace.{max u v} :=
  ⟨classifyingSpace (QCat E), classifyingSpacePoint (QCat.mk (0 : C))⟩

/-- The shift n+1 belongs to the definition of connective exact K-groups. -/
abbrev KGroup (E : ExactStructure C) (n : ℕ) :=
  Additive (HomotopyGroup.Pi (n + 1) (QBasedSpace E) (QBasedSpace E).point)

/-- Commutativity in degree zero uses the Q/K₀ calculation; in higher degrees it is homotopy commutativity. -/
instance kGroupAddCommGroup (E : ExactStructure C) (n : ℕ) : AddCommGroup (KGroup E n) :=
  sorry

/-- The corresponding space is the based loop space of BQ. -/
def KSpace (E : ExactStructure C) : BasedSpace :=
  ⟨TopCat.of (LoopSpace (QBasedSpace E) (QBasedSpace E).point), Path.refl _⟩

/-- The two Q-edges out of zero give the class of an object. -/
def twoEdgeLoop (E : ExactStructure C) (X : C) : KGroup E 0 := sorry

variable [EssentiallySmall.{w} C]

/-- The degree-zero comparison lands in the supplied exact K₀, with the same universe. -/
def pi1QEquivExactK0 (E : ExactStructure C) : KGroup E 0 ≃+ ExactK0 E := sorry

/-- The two-edge generator has the positive exact K₀ class. -/
theorem pi1QEquivExactK0_of (E : ExactStructure C) (X : C) :
    pi1QEquivExactK0 E (twoEdgeLoop E X) = ExactK0.of X := sorry

/-- A chosen conflation fixes addition of the three object classes. -/
example (E : ExactStructure C) (S : ShortComplex C) (hS : E.Conflation S) :
    pi1QEquivExactK0 E (twoEdgeLoop E S.X₂) =
      pi1QEquivExactK0 E (twoEdgeLoop E S.X₁) +
      pi1QEquivExactK0 E (twoEdgeLoop E S.X₃) := sorry
example (E : ExactStructure C) : pi1QEquivExactK0 E (twoEdgeLoop E (0 : C)) = 0 := sorry
example (E : ExactStructure C) (X : C) :
    pi1QEquivExactK0 E (-twoEdgeLoop E X) = -ExactK0.of X := sorry

end Quillen

section SmallModels
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasBinaryBiproducts C] [EssentiallySmall.{w} C]

/-- The small model inherits addition through its inverse equivalence. -/
instance smallModel_preadditive : Preadditive (SmallModel.{w} C) :=
  Preadditive.ofFullyFaithful (equivSmallModel.{w} C).fullyFaithfulInverse

instance smallModel_hasZero : HasZeroObject (SmallModel.{w} C) := sorry
instance smallModel_hasBinaryBiproducts : HasBinaryBiproducts (SmallModel.{w} C) := sorry
instance smallModel_equivalence_additive : (equivSmallModel.{w} C).functor.Additive := sorry

/-- Transport uses the additive equivalence, so the distinguished sequences agree. -/
def smallExactStructure (E : ExactStructure C) : ExactStructure (SmallModel.{w} C) :=
  E.transport (equivSmallModel.{w} C)

/-- Higher groups use the chosen small universe, rather than the large object universe. -/
abbrev SmallKGroup (E : ExactStructure C) (n : ℕ) := KGroup (smallExactStructure E) n

end SmallModels

/-! ## Layer 3: Rings and the plus comparison -/

/-- This carrier and exact structure are supplied by Tau Ceti. -/
abbrev Projectives (R : Type u) [Ring R] := (finiteProjectiveModules R).FullSubcategory

/-- Scalar extension is constructed in the associative-ring scope, preserving split conflations. -/
def projBaseChange {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    Projectives R ⥤ Projectives S := sorry

instance projBaseChange_additive {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    (projBaseChange f).Additive := sorry

/-- No flatness is needed on finite projectives. -/
theorem projBaseChange_exact {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    (finiteProjectiveModulesExactStructure R).IsConflationExact
      (finiteProjectiveModulesExactStructure S) (projBaseChange f) := sorry

def projBaseChange_id (R : Type u) [Ring R] : projBaseChange (RingHom.id R) ≅ 𝟭 _ := sorry

def projBaseChange_comp {R S T : Type u} [Ring R] [Ring S] [Ring T]
    (f : R →+* S) (g : S →+* T) :
    projBaseChange (g.comp f) ≅ projBaseChange f ⋙ projBaseChange g := sorry

example : (finiteProjectiveModulesExactStructure ℤ).IsConflationExact
    (finiteProjectiveModulesExactStructure (ZMod 2))
    (projBaseChange (Int.castRingHom (ZMod 2))) := sorry
example (R : Type u) [Ring R] (P : Projectives R) :
    Nonempty ((projBaseChange (RingHom.id R)).obj P ≅ P) := sorry
example {R S T : Type u} [Ring R] [Ring S] [Ring T]
    (f : R →+* S) (g : S →+* T) (P : Projectives R) :
    Nonempty ((projBaseChange (g.comp f)).obj P ≅
      (projBaseChange g).obj ((projBaseChange f).obj P)) := sorry

/-- Ring projectives are replaced by a model small in the ring's universe. -/
def ringSmallExactStructure (R : Type u) [Ring R] :
    ExactStructure (SmallModel.{u} (Projectives R)) :=
  smallExactStructure (finiteProjectiveModulesExactStructure R)

/-- The ring groups use the essentially small finite-projective Q model. -/
abbrev RingKGroup (R : Type u) [Ring R] (n : ℕ) :=
  KGroup (ringSmallExactStructure R) n

abbrev RingKSpace (R : Type u) [Ring R] :=
  KSpace (ringSmallExactStructure R)

/-- Degree zero is the existing projective exact K₀. -/
def ringK0Equiv (R : Type u) [Ring R] :
    RingKGroup R 0 ≃+ ExactK0 (finiteProjectiveModulesExactStructure R) := sorry

/-- The stable general linear group is formed from finite groups by diagonal stabilization. -/
structure StableMatrixRep (R : Type u) [Ring R] where
  rank : ℕ
  matrix : Matrix.GeneralLinearGroup (Fin rank) R

/-- Pad a finite matrix by an identity block, after specifying the size inequality. -/
def stabilizeMatrix {R : Type u} [Ring R] (n m : ℕ) (h : n ≤ m) :
    Matrix.GeneralLinearGroup (Fin n) R →* Matrix.GeneralLinearGroup (Fin m) R := sorry

/-- Two finite matrices represent the same stable matrix after a common stabilization. -/
def stableMatrixSetoid (R : Type u) [Ring R] : Setoid (StableMatrixRep R) where
  r a b := ∃ (k : ℕ) (ha : a.rank ≤ k) (hb : b.rank ≤ k),
    stabilizeMatrix a.rank k ha a.matrix = stabilizeMatrix b.rank k hb b.matrix
  iseqv := sorry

/-- The stable group carrier is the stabilization quotient, not a fixed finite rank. -/
def StableGL (R : Type u) [Ring R] := Quotient (stableMatrixSetoid R)

instance (R : Type u) [Ring R] : Group (StableGL R) := sorry

/-- Elementary generators retain distinct indices and their ring coefficient. -/
def stableElementaryMatrix {R : Type u} [Ring R] (n : ℕ) (i j : Fin n)
    (hij : i ≠ j) (a : R) : StableGL R := sorry

/-- Stable elementary matrices generate the subgroup to be killed by plus. -/
def stableElementary (R : Type u) [Ring R] : Subgroup (StableGL R) :=
  Subgroup.closure {g | ∃ (n : ℕ) (i j : Fin n) (hij : i ≠ j) (a : R),
    g = stableElementaryMatrix n i j hij a}

/-- A third distinct index supplies the elementary commutator identity. -/
theorem stableElementary_commutator {R : Type u} [Ring R] (n : ℕ)
    (i j k : Fin n) (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (a b : R) :
    stableElementaryMatrix n i j hij a * stableElementaryMatrix n j k hjk b *
      (stableElementaryMatrix n i j hij a)⁻¹ * (stableElementaryMatrix n j k hjk b)⁻¹ =
      stableElementaryMatrix n i k hik (a * b) := sorry

example {R : Type u} [Ring R] (n : ℕ) (i j : Fin n) (hij : i ≠ j) (a : R) :
    stableElementaryMatrix n i j hij a * stableElementaryMatrix n i j hij (-a) = 1 := sorry
example {R : Type u} [Ring R] (n : ℕ) (i j : Fin n) (hij : i ≠ j) :
    stableElementaryMatrix n i j hij (0 : R) = 1 := sorry
example : ¬ ∃ i j k : Fin 2, i ≠ j ∧ j ≠ k ∧ i ≠ k := by decide

/-- Whitehead normality and perfection concern the stabilized subgroup. -/
instance stableElementary_normal (R : Type u) [Ring R] : (stableElementary R).Normal := sorry

/-- Whitehead's theorem identifies the stable commutator subgroup. -/
theorem stableElementary_eq_commutator (R : Type u) [Ring R] :
    stableElementary R = commutator (StableGL R) := sorry

/-- Perfection uses stabilization, not an assertion about every finite elementary group. -/
theorem stableElementary_perfect (R : Type u) [Ring R] :
    commutator (stableElementary R) = ⊤ := sorry

/-- The quotient's additive form is the classical ring K₁. -/
def classicalK1 (R : Type u) [Ring R] := Additive (StableGL R ⧸ stableElementary R)

instance (R : Type u) [Ring R] : AddCommGroup (classicalK1 R) := sorry

/-- Unit classes are stabilized one-by-one matrices. -/
def classicalK1_unit {R : Type u} [Ring R] : Rˣ →* Multiplicative (classicalK1 R) := sorry

/-- The plus/Q comparison identifies the actual stable quotient with π₁K. -/
def ringK1Equiv (R : Type u) [Ring R] : RingKGroup R 1 ≃+ classicalK1 R := sorry

example {R : Type u} [Ring R] : classicalK1_unit (1 : Rˣ) = 1 := by simp
example {R : Type u} [Ring R] (a : Rˣ) :
    classicalK1_unit a⁻¹ = (classicalK1_unit a)⁻¹ := by simp
example : (-1 : ℤˣ) ^ 2 = 1 := by decide

example (n : ℕ) : Subsingleton (RingKGroup PUnit n) := sorry

/-! ## Layer 4: Exact additivity, resolution and abelian localization -/

section Conflations
variable {C : Type u} [Category.{u} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C]

instance conflationZero (E : ExactStructure C) : HasZeroObject E.ConflationCategory := sorry
instance conflationBiproducts (E : ExactStructure C) :
    HasBinaryBiproducts E.ConflationCategory := sorry

/-- Distinguished sequences of conflations are exactly the componentwise ones. -/
def conflationExactStructure (E : ExactStructure C) : ExactStructure E.ConflationCategory := sorry

theorem conflationExactStructure_iff (E : ExactStructure C)
    (S : ShortComplex E.ConflationCategory) : (conflationExactStructure E).Conflation S ↔
    E.Conflation (S.map (ConflationClass.ConflationCategory.π₁ E.toConflationClass)) ∧
    E.Conflation (S.map (ConflationClass.ConflationCategory.π₂ E.toConflationClass)) ∧
    E.Conflation (S.map (ConflationClass.ConflationCategory.π₃ E.toConflationClass)) := sorry

example (E : ExactStructure C) (S : ShortComplex E.ConflationCategory)
    (h : (conflationExactStructure E).Conflation S) :
    E.Conflation (S.map (ConflationClass.ConflationCategory.π₂ E.toConflationClass)) := sorry
example (E : ExactStructure C) (S : ShortComplex E.ConflationCategory)
    (h : ¬ E.Conflation (S.map (ConflationClass.ConflationCategory.π₁ E.toConflationClass))) :
    ¬ (conflationExactStructure E).Conflation S := sorry
example (E : ExactStructure C) (S : ShortComplex E.ConflationCategory)
    (h₁ : E.Conflation (S.map (ConflationClass.ConflationCategory.π₁ E.toConflationClass)))
    (h₂ : E.Conflation (S.map (ConflationClass.ConflationCategory.π₂ E.toConflationClass)))
    (h₃ : E.Conflation (S.map (ConflationClass.ConflationCategory.π₃ E.toConflationClass))) :
    (conflationExactStructure E).Conflation S := sorry

end Conflations

section RelativeTriples

variable {C D : Type u} [Category.{u} C] [Category.{u} D]
  [Preadditive C] [Preadditive D] [HasZeroObject C] [HasZeroObject D]
  [HasBinaryBiproducts C] [HasBinaryBiproducts D]

/-- A relative triple has an isomorphism after the specified additive functor. -/
structure RelativeAdditiveTriple (T : C ⥤ D) where
  first : C
  second : C
  iso : T.obj first ≅ T.obj second

variable (T : C ⥤ D) [T.Additive]

attribute [local instance] preservesBinaryBiproducts_of_preservesBinaryProducts

/-- Sum triples using the additive functor's actual biproduct comparison. -/
def RelativeAdditiveTriple.sum (x y : RelativeAdditiveTriple T) : RelativeAdditiveTriple T :=
  ⟨x.first ⊞ y.first, x.second ⊞ y.second,
    T.mapBiprod x.first y.first ≪≫ biprod.mapIso x.iso y.iso ≪≫
      (T.mapBiprod x.second y.second).symm⟩

/-- Presentation relations include invariance under isomorphisms of both endpoints. -/
inductive relativeTripleRelation : FreeAbelianGroup (RelativeAdditiveTriple T) → Prop
  | composition (P Q V : C) (α : T.obj P ≅ T.obj Q) (β : T.obj Q ≅ T.obj V) :
      relativeTripleRelation (FreeAbelianGroup.of ⟨P,V,α ≪≫ β⟩ -
        FreeAbelianGroup.of ⟨P,Q,α⟩ - FreeAbelianGroup.of ⟨Q,V,β⟩)
  | directSum (x y : RelativeAdditiveTriple T) :
      relativeTripleRelation (FreeAbelianGroup.of (x.sum T y) -
        FreeAbelianGroup.of x - FreeAbelianGroup.of y)
  | isomorphism (P Q P' Q' : C) (α : T.obj P ≅ T.obj Q) (e : P ≅ P') (d : Q ≅ Q') :
      relativeTripleRelation (FreeAbelianGroup.of
        ⟨P',Q',T.mapIso e.symm ≪≫ α ≪≫ T.mapIso d⟩ - FreeAbelianGroup.of ⟨P,Q,α⟩)

/-- Present the group by direct-sum and composable-isomorphism relations. -/
def relativeTripleRelations : AddSubgroup (FreeAbelianGroup (RelativeAdditiveTriple T)) :=
  AddSubgroup.closure {x | relativeTripleRelation T x}

abbrev ClassicalRelativeK0 :=
  FreeAbelianGroup (RelativeAdditiveTriple T) ⧸ relativeTripleRelations T

/-- The triple class retains its orientation. -/
def relativeTripleClass (x : RelativeAdditiveTriple T) : ClassicalRelativeK0 T :=
  QuotientAddGroup.mk (FreeAbelianGroup.of x)

/-- Composition is additive, which forces identity triples to be zero. -/
theorem relativeTriple_comp (P Q V : C) (α : T.obj P ≅ T.obj Q) (β : T.obj Q ≅ T.obj V) :
    relativeTripleClass T ⟨P,V,α ≪≫ β⟩ =
      relativeTripleClass T ⟨P,Q,α⟩ + relativeTripleClass T ⟨Q,V,β⟩ := sorry

example (P : C) : relativeTripleClass T ⟨P,P,Iso.refl _⟩ = 0 := sorry
example (P Q : C) (α : T.obj P ≅ T.obj Q) :
    relativeTripleClass T ⟨P,Q,α⟩ = -relativeTripleClass T ⟨Q,P,α.symm⟩ := sorry

variable [EssentiallySmall.{u} C]

/-- The difference is positive on the first object. -/
def ClassicalRelativeK0.difference :
    ClassicalRelativeK0 T →+ ExactK0 (ExactStructure.split C) := sorry

theorem ClassicalRelativeK0.difference_class (x : RelativeAdditiveTriple T) :
    ClassicalRelativeK0.difference T (relativeTripleClass T x) =
      (ExactK0.of x.first : ExactK0 (ExactStructure.split C)) - ExactK0.of x.second := sorry

example (P Q : C) (α : T.obj P ≅ T.obj Q) :
    ClassicalRelativeK0.difference T (relativeTripleClass T ⟨Q,P,α.symm⟩) =
      -((ExactK0.of P : ExactK0 (ExactStructure.split C)) - ExactK0.of Q) := sorry

end RelativeTriples

section AdditiveAutomorphisms
variable (C : Type u) [Category.{u} C] [Preadditive C] [HasBinaryBiproducts C]

/-- The generators remember the object and its automorphism. -/
structure AutomorphismObject where
  object : C
  automorphism : object ≅ object

/-- The presentation explicitly imposes composition, sum and conjugacy. -/
inductive additiveK1Relation : FreeAbelianGroup (AutomorphismObject C) → Prop
  | composition (X : C) (α β : X ≅ X) : additiveK1Relation
      (FreeAbelianGroup.of ⟨X, α ≪≫ β⟩ - FreeAbelianGroup.of ⟨X, α⟩ -
        FreeAbelianGroup.of ⟨X, β⟩)
  | directSum (X Y : C) (α : X ≅ X) (β : Y ≅ Y) : additiveK1Relation
      (FreeAbelianGroup.of ⟨X ⊞ Y, biprod.mapIso α β⟩ -
        FreeAbelianGroup.of ⟨X, α⟩ - FreeAbelianGroup.of ⟨Y, β⟩)
  | conjugacy (X Y : C) (e : X ≅ Y) (α : X ≅ X) : additiveK1Relation
      (FreeAbelianGroup.of ⟨Y, e.symm ≪≫ α ≪≫ e⟩ - FreeAbelianGroup.of ⟨X, α⟩)

/-- Split additive K₁ uses the subgroup generated by these concrete relations. -/
abbrev ClassicalAdditiveK1 := FreeAbelianGroup (AutomorphismObject C) ⧸
  AddSubgroup.closure {x | additiveK1Relation C x}

variable {C}

/-- The automorphism class maps a generator into the quotient. -/
def ClassicalAdditiveK1.class (X : C) (α : X ≅ X) : ClassicalAdditiveK1 C :=
  QuotientAddGroup.mk (FreeAbelianGroup.of ⟨X, α⟩)

/-- Composition becomes addition in the abelian presentation. -/
theorem ClassicalAdditiveK1.composition (X : C) (α β : X ≅ X) :
    ClassicalAdditiveK1.class X (α ≪≫ β) =
      ClassicalAdditiveK1.class X α + ClassicalAdditiveK1.class X β := sorry

/-- Direct sum becomes addition, retaining the actual biproduct isomorphism. -/
theorem ClassicalAdditiveK1.directSum (X Y : C) (α : X ≅ X) (β : Y ≅ Y) :
    ClassicalAdditiveK1.class (X ⊞ Y) (biprod.mapIso α β) =
      ClassicalAdditiveK1.class X α + ClassicalAdditiveK1.class Y β := sorry

example (X : C) : ClassicalAdditiveK1.class X (Iso.refl X) = 0 := sorry
example (X : C) (α : X ≅ X) :
    ClassicalAdditiveK1.class X α.symm = -ClassicalAdditiveK1.class X α := sorry
example (X Y : C) (e : X ≅ Y) (α : X ≅ X) :
    ClassicalAdditiveK1.class Y (e.symm ≪≫ α ≪≫ e) =
      ClassicalAdditiveK1.class X α := sorry

/-- Additive functors preserve all presentation relations. -/
def ClassicalAdditiveK1.map {D : Type u} [Category.{u} D] [Preadditive D]
    [HasBinaryBiproducts D] (T : C ⥤ D) [T.Additive] :
    ClassicalAdditiveK1 C →+ ClassicalAdditiveK1 D := sorry

variable [HasZeroObject C]

/-- The comparison concerns the split exact structure, not every exact structure on C. -/
def ClassicalAdditiveK1.quillenEquiv :
    ClassicalAdditiveK1 C ≃+ KGroup (ExactStructure.split C) 1 := sorry

end AdditiveAutomorphisms

/-- Cokernel minus kernel is the degree-one index convention. -/
def indexClass {A : Type*} [AddCommGroup A] (ker coker : A) := coker - ker

example : indexClass (0 : ℤ) 1 = 1 := by decide
example : indexClass (1 : ℤ) 1 = 0 := by decide
example : indexClass (1 : ℤ) 0 = -1 := by decide

/-! ## Layer 5: Waldhausen filtrations and deloopings -/

section Waldhausen

variable (C : Type u) [Category.{v} C] [HasZeroObject C]

/-- A cofibration category specifies actual pushouts and their outgoing cofibrations. -/
structure CategoryWithCofibrations where
  cof : MorphismProperty C
  identity : ∀ X, cof (𝟙 X)
  compose : ∀ {X Y Z} (i : X ⟶ Y) (j : Y ⟶ Z), cof i → cof j → cof (i ≫ j)
  iso : ∀ {X Y} (f : X ⟶ Y), IsIso f → cof f
  from_zero : ∀ X, cof ((isZero_zero C).to_ X)
  pushout_exists : ∀ {X Y Z} (i : X ⟶ Y) (f : X ⟶ Z), cof i → HasPushout i f
  pushout_cof : ∀ {X Y Z V} (i : X ⟶ Y) (f : X ⟶ Z)
    (g : Y ⟶ V) (j : Z ⟶ V), cof i → IsPushout i f g j → cof j

/-- Weak equivalences are closed under composition and satisfy pushout gluing. -/
structure WaldhausenCategory extends CategoryWithCofibrations C where
  weak : MorphismProperty C
  weak_identity : ∀ X, weak (𝟙 X)
  weak_compose : ∀ {X Y Z} (f : X ⟶ Y) (g : Y ⟶ Z), weak f → weak g → weak (f ≫ g)
  weak_iso : ∀ {X Y} (f : X ⟶ Y), IsIso f → weak f
  gluing : ∀ {A B D P A' B' D' P'}
    (i : A ⟶ B) (f : A ⟶ D) (g : B ⟶ P) (j : D ⟶ P)
    (i' : A' ⟶ B') (f' : A' ⟶ D') (g' : B' ⟶ P') (j' : D' ⟶ P')
    (a : A ⟶ A') (b : B ⟶ B') (d : D ⟶ D') (p : P ⟶ P'),
    cof i → cof i' → IsPushout i f g j → IsPushout i' f' g' j' →
    i ≫ b = a ≫ i' → f ≫ d = a ≫ f' → g ≫ p = b ≫ g' → j ≫ p = d ≫ j' →
    weak a → weak b → weak d → weak p

variable {C}

/-- An exact functor preserves the selected pushout squares as well as both map classes. -/
structure WaldhausenExactFunctor {D : Type u} [Category.{v} D] [HasZeroObject D]
    (W : WaldhausenCategory C) (V : WaldhausenCategory D) where
  functor : C ⥤ D
  zero : IsZero (functor.obj (0 : C))
  cof : ∀ {X Y} (f : X ⟶ Y), W.cof f → V.cof (functor.map f)
  weak : ∀ {X Y} (f : X ⟶ Y), W.weak f → V.weak (functor.map f)
  pushout : ∀ {A B D P} (i : A ⟶ B) (f : A ⟶ D) (g : B ⟶ P) (j : D ⟶ P),
    W.cof i → IsPushout i f g j →
    IsPushout (functor.map i) (functor.map f) (functor.map g) (functor.map j)

/-- The extension axiom applies to actual maps of cofibration pushout squares. -/
def WaldhausenCategory.HasExtensionAxiom (W : WaldhausenCategory C) : Prop :=
  ∀ {A B Q A' B' Q'} (i : A ⟶ B) (q : B ⟶ Q) (i' : A' ⟶ B') (q' : B' ⟶ Q')
    (a : A ⟶ A') (b : B ⟶ B') (c : Q ⟶ Q'),
    W.cof i → W.cof i' →
    IsPushout i ((isZero_zero C).from_ A) q ((isZero_zero C).to_ Q) →
    IsPushout i' ((isZero_zero C).from_ A') q' ((isZero_zero C).to_ Q') →
    i ≫ b = a ≫ i' → q ≫ c = b ≫ q' → W.weak a → W.weak c → W.weak b

/-- Exact categories supply inflations and isomorphisms as the two Waldhausen map classes. -/
def WaldhausenCategory.ofExact [Preadditive C] [HasBinaryBiproducts C]
    (E : ExactStructure C) : WaldhausenCategory C := sorry

example [Preadditive C] [HasBinaryBiproducts C] (E : ExactStructure C) {X Y : C}
    (f : X ⟶ Y) : (WaldhausenCategory.ofExact E).cof f ↔ E.IsInflation f := sorry
example [Preadditive C] [HasBinaryBiproducts C] (E : ExactStructure C) {X Y : C}
    (f : X ⟶ Y) : (WaldhausenCategory.ofExact E).weak f ↔ IsIso f := sorry
example (W : WaldhausenCategory C) : W.cof ((isZero_zero C).to_ (0 : C)) := sorry

/-- Saturation remains an extra hypothesis on the chosen weak equivalences. -/
structure WaldhausenCategory.IsSaturated (W : WaldhausenCategory C) : Prop where
  two_of_three : ∀ {X Y Z} (f : X ⟶ Y) (g : Y ⟶ Z),
    (W.weak f ∧ W.weak g → W.weak (f ≫ g)) ∧
    (W.weak f ∧ W.weak (f ≫ g) → W.weak g) ∧
    (W.weak g ∧ W.weak (f ≫ g) → W.weak f)

/-- Factorization asserts existence, without selecting a cylinder functor. -/
structure WaldhausenCategory.HasFactorization (W : WaldhausenCategory C) : Prop where
  factor : ∀ {X Y} (f : X ⟶ Y), ∃ (Z : C) (i : X ⟶ Z) (p : Z ⟶ Y),
    W.cof i ∧ W.weak p ∧ i ≫ p = f

/-- Actual generators record the weak maps and witnessed quotient squares. -/
inductive waldhausenRelation (W : WaldhausenCategory C) : FreeAbelianGroup C → Prop
  | zero : waldhausenRelation W (FreeAbelianGroup.of (0 : C))
  | weak {X Y : C} (f : X ⟶ Y) (h : W.weak f) :
      waldhausenRelation W (FreeAbelianGroup.of X - FreeAbelianGroup.of Y)
  | quotient {X Y Q : C} (i : X ⟶ Y) (q : Y ⟶ Q) (h : W.cof i)
      (sq : IsPushout i ((isZero_zero C).from_ X) q ((isZero_zero C).to_ Q)) :
      waldhausenRelation W (FreeAbelianGroup.of Y - FreeAbelianGroup.of X -
        FreeAbelianGroup.of Q)

/-- Relations are generated by weak maps and cofibration quotients. -/
def waldhausenRelations (W : WaldhausenCategory C) : AddSubgroup (FreeAbelianGroup C) :=
  AddSubgroup.closure {x | waldhausenRelation W x}

abbrev WaldhausenCategory.K0 (W : WaldhausenCategory C) :=
  FreeAbelianGroup C ⧸ waldhausenRelations W

def WaldhausenCategory.class (W : WaldhausenCategory C) (X : C) : W.K0 :=
  QuotientAddGroup.mk (FreeAbelianGroup.of X)

/-- A weak equivalence identifies the object classes. -/
theorem WaldhausenCategory.class_weak (W : WaldhausenCategory C) {X Y : C}
    (f : X ⟶ Y) (hf : W.weak f) : W.class X = W.class Y := sorry

example (W : WaldhausenCategory C) : W.class (0 : C) = 0 := sorry
example (W : WaldhausenCategory C) {X Y : C} (f : X ⟶ Y) (hf : W.weak f) :
    W.class X - W.class Y = 0 := sorry
example (W : WaldhausenCategory C) (hw : ∀ {X Y} (f : X ⟶ Y), W.weak f) (X : C) :
    W.class X = 0 := sorry


/-- Intervals are arrows of the finite ordinal. -/
def ordinalInterval (n : ℕ) (i j : Fin (n+1)) (h : i ≤ j) : Arrow (Fin (n+1)) :=
  Arrow.mk (homOfLE h)

/-- Endpoint inclusions induce the functorial maps between interval objects. -/
def ordinalIntervalMap (n : ℕ) {i j k l : Fin (n+1)} (hij : i ≤ j) (hkl : k ≤ l)
    (hik : i ≤ k) (hjl : j ≤ l) : ordinalInterval n i j hij ⟶ ordinalInterval n k l hkl :=
  Arrow.homMk (homOfLE hik) (homOfLE hjl) (by apply Subsingleton.elim)

/-- S-objects satisfy diagonal-zero and all cofibration quotient-square conditions. -/
def sObjectProperty (W : WaldhausenCategory C) (n : ℕ) :
    ObjectProperty (Arrow (Fin (n+1)) ⥤ C) := fun F =>
  (∀ i, IsZero (F.obj (ordinalInterval n i i le_rfl))) ∧
  (∀ (i j k : Fin (n+1)) (hij : i ≤ j) (hjk : j ≤ k),
    W.cof (F.map (ordinalIntervalMap n hij (hij.trans hjk) le_rfl hjk)) ∧
    IsPushout
      (F.map (ordinalIntervalMap n hij (hij.trans hjk) le_rfl hjk))
      (F.map (ordinalIntervalMap n hij le_rfl hij le_rfl))
      (F.map (ordinalIntervalMap n (hij.trans hjk) hjk hij le_rfl))
      (F.map (ordinalIntervalMap n le_rfl hjk le_rfl hjk)))

/-- Natural transformations are the S-category morphisms. -/
abbrev SConstruction (W : WaldhausenCategory C) (n : ℕ) :=
  (sObjectProperty W n).FullSubcategory

/-- Relative latching squares, including quotient intervals, define S-cofibrations. -/
def SConstruction.cof (W : WaldhausenCategory C) (n : ℕ) :
    MorphismProperty (SConstruction W n) := fun F G f =>
  ∀ (i j k : Fin (n+1)) (hij : i ≤ j) (hjk : j ≤ k),
    ∃ (P : C)
      (a : G.obj.obj (ordinalInterval n i j hij) ⟶ P)
      (b : F.obj.obj (ordinalInterval n i k (hij.trans hjk)) ⟶ P)
      (c : P ⟶ G.obj.obj (ordinalInterval n i k (hij.trans hjk))),
      IsPushout (F.obj.map (ordinalIntervalMap n hij (hij.trans hjk) le_rfl hjk))
        (f.hom.app (ordinalInterval n i j hij)) b a ∧
      b ≫ c = f.hom.app (ordinalInterval n i k (hij.trans hjk)) ∧
      a ≫ c = G.obj.map (ordinalIntervalMap n hij (hij.trans hjk) le_rfl hjk) ∧ W.cof c

/-- Monotone ordinal maps restrict S-diagrams, including faces and degeneracies. -/
def SConstruction.restrict (W : WaldhausenCategory C) (m n : ℕ)
    (φ : Fin (m+1) →o Fin (n+1)) : SConstruction W n ⥤ SConstruction W m := sorry

example (W : WaldhausenCategory C) (F : SConstruction W 0) :
    IsZero (F.obj.obj (ordinalInterval 0 0 0 le_rfl)) := F.property.1 0
example (W : WaldhausenCategory C) (F : SConstruction W 1) :
    W.cof (F.obj.map (ordinalIntervalMap 1 (show (0 : Fin 2) ≤ 0 by decide)
      (show (0 : Fin 2) ≤ 1 by decide) le_rfl (by decide))) := sorry
example (W : WaldhausenCategory C) (F : SConstruction W 2) :
    IsZero (F.obj.obj (ordinalInterval 2 1 1 le_rfl)) := F.property.1 1

/-- The coordinate inclusion k→k² and its second-coordinate quotient form the standard S₂ flag. -/
def standardTwoStepFlag (k : Type u) [Field k] :
    SConstruction (WaldhausenCategory.ofExact (ExactStructure.abelian (ModuleCat k))) 2 := sorry

example (k : Type u) [Field k] :
    Module.finrank k ((standardTwoStepFlag k).obj.obj
      (ordinalInterval 2 0 1 (by decide))) = 1 := sorry
example (k : Type u) [Field k] :
    Module.finrank k ((standardTwoStepFlag k).obj.obj
      (ordinalInterval 2 0 2 (by decide))) = 2 := sorry
example (k : Type u) [Field k] :
    Module.finrank k ((standardTwoStepFlag k).obj.obj
      (ordinalInterval 2 1 2 (by decide))) = 1 := sorry

/-- Injections and isomorphisms alone cannot factor every vector-space map. -/
example (k : Type u) [Field k] : ¬ (∀ {V U : ModuleCat k} (f : V ⟶ U),
    ∃ (Z : ModuleCat k) (i : V ⟶ Z) (p : Z ⟶ U), Mono i ∧ IsIso p ∧ i ≫ p = f) := sorry

end Waldhausen

/-! ## Layer 6: Fibration, approximation and cofinality -/

section ClassWeak
variable {C : Type u} [Category.{u} C] [HasZeroObject C]
  (W : WaldhausenCategory C) {G : Type v} [AddCommGroup G] (p : W.K0 →+ G)

/-- Class weak equivalences compare the actual source and target Grothendieck classes. -/
def classWeakEquivalences : MorphismProperty C := fun X Y _ => p (W.class X) = p (W.class Y)

/-- These acyclic objects have zero image class. -/
def classAcyclic (X : C) : Prop := p (W.class X) = 0

example {X Y : C} (f : X ⟶ Y) : classWeakEquivalences W (0 : W.K0 →+ G) f := by
  simp [classWeakEquivalences]
example (X : C) : classAcyclic W (0 : W.K0 →+ G) X := by simp [classAcyclic]
example {X Y : C} (f : X ⟶ Y) (hf : W.weak f) : classWeakEquivalences W p f := sorry

end ClassWeak

/-! ## Layer 7: Products and transfers -/

/-- Transfer of a finite-dimensional field vector space multiplies dimension by the extension degree. -/
theorem transfer_dimension (k L : Type u) [Field k] [Field L] [Algebra k L]
    [FiniteDimensional k L] (V : Type u) [AddCommGroup V] [Module L V]
    [Module k V] [IsScalarTower k L V] [FiniteDimensional L V] :
    Module.finrank k V = Module.finrank k L * Module.finrank L V := sorry

example (a b : ℕ) : a * b = b * a := Nat.mul_comm _ _
example : 2 * 3 = (6 : ℕ) := rfl
example {A : Type*} [AddCommGroup A] (x : A) : (0 : ℤ) • x = 0 := by simp

/-! ## Layer 8: Relative theory and low-degree excision -/

/-- A ring relative space is the actual fibre of the induced based K-map. -/
def ringKMap {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    BasedMap (RingKSpace R) (RingKSpace S) := sorry

def relativeK {R S : Type u} [Ring R] [Ring S] (f : R →+* S) : BasedSpace :=
  HomotopyFibre.based (ringKMap f)

example (R : Type u) [Ring R] : Nonempty (relativeK (RingHom.id R) ≃ₕ PUnit) := sorry
example {R S : Type u} [Ring R] [Ring S] [Subsingleton S] (f : R →+* S) :
    Nonempty (relativeK f ≃ₕ RingKSpace R) := sorry
example (R : Type u) [Ring R] :
    Nonempty (HomotopyFibre.based (BasedMap.id (RingKSpace R)) ≃ₕ PUnit) := sorry

/-- Universe-zero specialization: nonunital connective theory is the integer augmentation fibre. -/
def nonunitalK (I : Type) [NonUnitalRing I] : BasedSpace :=
  relativeK (R := Unitization ℤ I) (S := ℤ) (show Unitization ℤ I →+* ℤ from
    { toFun := fun x => x.fst
      map_one' := rfl
      map_mul' := fun _ _ => rfl
      map_zero' := rfl
      map_add' := fun _ _ => rfl })

example : Nonempty (nonunitalK PUnit ≃ₕ PUnit) := sorry
example : Nonempty (nonunitalK ℤ ≃ₕ RingKSpace ℤ) := sorry
example (I : Type) [Ring I] :
    Nonempty (nonunitalK I ≃ₕ RingKSpace I) := sorry

/-- Compatible pairs use the second-to-first Milnor clutching orientation. -/
def MilnorPatch {R₁ R₂ S : Type u} [Ring R₁] [Ring R₂] [Ring S]
    (f : R₁ →+* S) (g : R₂ →+* S) (n : ℕ) (α : Matrix.GeneralLinearGroup (Fin n) S) :=
  {xy : (Fin n → R₁) × (Fin n → R₂) |
    (fun i => f (xy.1 i)) = α.val.mulVec (fun i => g (xy.2 i))}

/-- Rank-one identity patching is the ring pullback equation. -/
example {R₁ R₂ S : Type u} [Ring R₁] [Ring R₂] [Ring S]
    (f : R₁ →+* S) (g : R₂ →+* S) (x : R₁) (y : R₂) :
    ((fun _ : Fin 1 => x), (fun _ : Fin 1 => y)) ∈
      {xy : (Fin 1 → R₁) × (Fin 1 → R₂) |
        (fun i => f (xy.1 i)) = (1 : Matrix (Fin 1) (Fin 1) S).mulVec
          (fun i => g (xy.2 i))} ↔ f x = g y := sorry
example : indexClass (0 : ℤ) 1 = 1 := by decide
example : indexClass (1 : ℤ) 1 = 0 := by decide

/-- A shear fixes the direction of the second-to-first patch equation. -/
example : (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).mulVec ![0,1] = ![1,1] := by
  ext i
  fin_cases i <;> simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two]
example : (!![1,-1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).mulVec ![0,1] = ![-1,1] := by
  ext i
  fin_cases i <;> simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

/-- Putting the uniformizer last interchanges it with n−1 sphere coordinates. -/
def uniformizerLastSign (n : ℕ) : ℤˣ := (-1) ^ (n - 1)

example : uniformizerLastSign 1 = 1 := by simp [uniformizerLastSign]
example : uniformizerLastSign 2 = -1 := by simp [uniformizerLastSign]
example : uniformizerLastSign 3 = 1 := by decide

/-! ## Layer 9: The ring projective line and Nil terms -/

/-- Nil objects use the supplied finite-projective module and an actually nilpotent endomorphism. -/
structure NilCat (R : Type u) [Ring R] where
  projective : Projectives R
  endomorphism : projective.obj →ₗ[R] projective.obj
  nilpotent : IsNilpotent endomorphism

/-- Morphisms commute with the chosen endomorphisms. -/
structure NilHom {R : Type u} [Ring R] (X Y : NilCat R) where
  map : X.projective.obj →ₗ[R] Y.projective.obj
  commute : map.comp X.endomorphism = Y.endomorphism.comp map

instance nilCategory (R : Type u) [Ring R] : Category (NilCat R) where
  Hom X Y := NilHom X Y
  id X := ⟨LinearMap.id, by simp⟩
  comp f g := ⟨g.map.comp f.map, sorry⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- Forget the endomorphism, retaining the supplied projective module carrier. -/
def NilCat.forget (R : Type u) [Ring R] : NilCat R ⥤ Projectives R := sorry

/-- The zero section is defined by the zero nilpotent endomorphism. -/
def NilCat.zero (R : Type u) [Ring R] : Projectives R ⥤ NilCat R := sorry

example (R : Type u) [Ring R] (P : Projectives R) :
    ((NilCat.zero R).obj P).endomorphism = 0 := sorry
example (R : Type u) [Ring R] : NilCat.zero R ⋙ NilCat.forget R ≅ 𝟭 _ := sorry
example : ¬ IsNilpotent (2 : ℤ) := by norm_num [IsNilpotent]

/-- Twist n changes the chart exponent i to i−n. -/
def twistExponent (i n : ℤ) : ℤ := i - n

example : twistExponent 0 1 = -1 := rfl
example : twistExponent 1 1 = 0 := rfl
example : twistExponent 2 (-1) = 3 := rfl

/-- The plus-chart Koszul maps are (t,−1) and (1,t). -/
def koszulLeft {R : Type*} [Ring R] (t x : R) : R × R := (t * x, -x)
def koszulRight {R : Type*} [Ring R] (t : R) (xy : R × R) : R := xy.1 + t * xy.2

example {R : Type*} [Ring R] (t x : R) : koszulRight t (koszulLeft t x) = 0 := by
  simp [koszulRight, koszulLeft]
example : koszulRight (2 : ℤ) (2,1) = 4 := rfl
example : koszulRight (2 : ℤ) (koszulLeft 2 1) = 0 := rfl

/-! ## Layer 10: Bass contraction and the nonconnective ring spectrum -/

/-- Difference of the two chart maps follows the diagonal. -/
def chartDifference {A : Type*} [AddCommGroup A] : (A × A) →+ A where
  toFun ab := ab.1 - ab.2
  map_zero' := by simp
  map_add' := by intros; simp; abel

example : chartDifference ((1,1) : ℤ × ℤ) = 0 := rfl
example : chartDifference ((1,0) : ℤ × ℤ) = 1 := rfl
example : chartDifference ((0,1) : ℤ × ℤ) = -1 := rfl

/-- Countable cone matrices are row finite and column finite. -/
def ConeMatrix (R : Type u) [Ring R] :=
  {a : Matrix ℕ ℕ R | (∀ i, Set.Finite {j | a i j ≠ 0}) ∧
    (∀ j, Set.Finite {i | a i j ≠ 0})}

/-- Finite support has both cone finiteness properties. -/
theorem coneMatrix_of_finiteSupport {R : Type u} [Ring R] (a : Matrix ℕ ℕ R)
    (ha : Set.Finite {ij : ℕ × ℕ | a ij.1 ij.2 ≠ 0}) :
    (∀ i, Set.Finite {j | a i j ≠ 0}) ∧ (∀ j, Set.Finite {i | a i j ≠ 0}) := sorry

example {R : Type u} [Ring R] :
    (∀ i : ℕ, Set.Finite {j : ℕ | (0 : Matrix ℕ ℕ R) i j ≠ 0}) ∧
    (∀ j : ℕ, Set.Finite {i : ℕ | (0 : Matrix ℕ ℕ R) i j ≠ 0}) := by simp
example : ¬ Set.Finite {j : ℕ | (1 : ℤ) ≠ 0} := sorry
example (R : Type u) [Ring R] :
    ∃ a : ConeMatrix R, (a.1 : Matrix ℕ ℕ R) = 0 := sorry

/-! ## Layer 11: Frobenius pairs and negative localization -/

section Frobenius
variable (A B : Type u) [Category.{u} A] [Category.{u} B]
  [Preadditive A] [Preadditive B] [HasZeroObject A] [HasZeroObject B]
  [HasBinaryBiproducts A] [HasBinaryBiproducts B]

/-- A pair consists of Frobenius structures and a fully faithful exact inclusion. -/
structure FrobeniusPair where
  source : ExactStructure A
  target : ExactStructure B
  source_frobenius : source.IsFrobenius
  target_frobenius : target.IsFrobenius
  inclusion : A ⥤ B
  additive : inclusion.Additive
  full : inclusion.Full
  faithful : inclusion.Faithful
  exact : @ExactStructure.IsConflationExact _ _ _ _ _ _ _ _ _ _ source target inclusion additive
  preserves_projectives : ∀ X, source.isProjective X → target.isProjective (inclusion.obj X)

end Frobenius

/-- Even Euler characteristic is closed under triangles but does not contain the rank-one object. -/
example : (2 : ℤ) % 2 = 0 ∧ (1 : ℤ) % 2 ≠ 0 := by decide
example : ((1 : ℤ) + 1) % 2 = 0 := by decide
example : (0 : ℤ) % 2 = 0 := rfl

/-! ## Layer 12: Karoubi filtrations, finite domination and comparison -/

section Domination
variable {A : Type u} [Category.{u} A] [Preadditive A]

/-- A finite dominator has finite support, maps in both directions and the stated chain homotopy. -/
structure FiniteChainDomination (V : ChainComplex A ℤ) where
  finite : ChainComplex A ℤ
  support : Finset ℤ
  outside_zero : ∀ i, i ∉ support → IsZero (finite.X i)
  into : V ⟶ finite
  out : finite ⟶ V
  retract : Homotopy (into ≫ out) (𝟙 V)

/-- The induced projector is idempotent up to homotopy, which is weaker than an actual idempotent. -/
def FiniteChainDomination.fg (V : ChainComplex A ℤ) (d : FiniteChainDomination V) :
    Homotopy ((d.out ≫ d.into) ≫ (d.out ≫ d.into)) (d.out ≫ d.into) := sorry

end Domination

/-- The free rank image in the completed projectives over k×k is diagonal. -/
def diagonalRank : ℤ →+ ℤ × ℤ where
  toFun n := (n,n)
  map_zero' := rfl
  map_add' _ _ := rfl

example : diagonalRank 0 = (0,0) := rfl
example : diagonalRank 1 = (1,1) := rfl
example : (1,0) ∉ Set.range diagonalRank := by
  rintro ⟨n, h⟩
  have h₁ := congrArg Prod.fst h
  have h₂ := congrArg Prod.snd h
  change n = 1 at h₁
  change n = 0 at h₂
  omega

/-- The odd top degree uses the complementary projector. -/
def topProjector {R : Type*} [Ring R] (n : ℕ) (p : R) : R :=
  if Even n then p else 1 - p

example : topProjector 0 (1 : ℤ) = 1 := by simp [topProjector]
example : topProjector 1 (1 : ℤ) = 0 := by simp [topProjector]
example : topProjector 2 (0 : ℤ) = 0 := by simp [topProjector]

/-- Degree zero is positive in a two-term Euler class. -/
def twoTermEuler {A : Type*} [AddCommGroup A] (degreeZero degreeOne : A) : A :=
  degreeZero - degreeOne

example : twoTermEuler (2 : ℤ) 3 = -1 := rfl
example : twoTermEuler (0 : ℤ) 1 = -1 := rfl
example : twoTermEuler (1 : ℤ) 0 = 1 := rfl

/-! ## Layer 13: Continuity and the limits of derived invariance -/

/-- Under the unitization product decomposition, a corner sends (z,c) to diag(c,z). -/
def cornerUnitizationSecond (z c : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![c,0;0,z]

example : cornerUnitizationSecond 1 1 = (1 : Matrix (Fin 2) (Fin 2) ℤ) := by decide
example : cornerUnitizationSecond 1 0 = !![0,0;0,1] := rfl
example : cornerUnitizationSecond 0 1 = !![1,0;0,0] := rfl

/-- Order nine does not determine the p-primary group: exponent detects the difference. -/
example : ∃ x : ZMod 9, 3 • x ≠ 0 := by exact ⟨1, by decide⟩
example : ∀ x : ZMod 3 × ZMod 3, 3 • x = 0 := by decide

/-
The following full interfaces depend on the new coherent realization, group-completion,
and stable-model constructions: bisimplicialRealization, edgewiseSubdivision,
isomorphismDoubleNerve, PlusConstruction, MonoidalLocalization and its actions;
Prespectrum.stableGroup, spectrify, fibre/cofibre/telescope and PrespectrumPairing;
QCat.lift/op, the higher KGroup functor API, StableGL.blockSum/map,
idempotentBaseChange; ConflationCategory.coprod/exactFunctorEquiv and the
ClassicalRelativeK0 naturality API;
ExtCat, ExtFibre.tensor and cartesian lifts; LocalizationModel;
ClassicalAdditiveK1.boundary; WaldhausenCategory.CylinderFunctor, KSpace/KGroup,
iteratedS, SConstruction.simplicial, AdditivityFibre, edgewiseQ, relative S,
CofibrantPosetDiagram,
IteratedCylinder and BiexactSGrid; stable biexact pairings, transfers and relative
spectrum-module products; relativeK.group/les/ofPair/waldhausen; nonunitalK in
arbitrary universes and its map/compare; the projective MilnorPatch
base-change and clutching interfaces beyond its displayed free-pair carrier;
ProjectiveLine.Module/VectorBundle/KSpace, twist/u/koszul/map/directImage, P1.T0/Z0/T1,
canonicalResolution and localisationModels; the exact Nil structure, nilGroup and
torsion comparison; IsFlasqueRing, IsInfiniteSumRing, coneRing, contraction,
IsAcyclic, IsContracted, negativeK, NegativeKTheory, bassTheory, deloop and bassSpectrum;
FrobeniusPair.derived/map/ofExact/waldhausen, DenseClasses, countableEnvelope,
enlarge/suspension/setup/IK, IsExactSequence, NegativeKSetup, IK0/negativeIK and
FrobeniusReplacement; KaroubiFiltration, KaroubiCone/Suspension/Negative;
FiniteChainDomination for a general fully faithful A→U and its corrected
FiniteDomination.idempotent/finiteModel/modelEquivalence/euler; NonunitalBass;
ArtinStableModel. Their complete definition checks are stated with these interfaces
in README.md; the examples above cover the statable carriers and conventions.
-/

end TauCetiRoadmap.GeneralAlgebraicKTheory
