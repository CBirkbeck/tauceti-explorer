/-
Suggested interfaces for EtaleDualityAndPerverseSheaves EDC.4 (weak Lefschetz, projective bundles
and blow-ups), with the EDC.6 nodes that this packet keeps for their importers. Revision four
(BP-EtaleDualityAndPerverseSheaves--EDC.4~4).

This file is not the roadmap and is not exhaustive. The reader document
(research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.4.md) is definitive; the
statements here suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is admitted.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
This file imports only Mathlib. The étale carriers below (Dbc, cohomology, the six operations,
twists, Gysin maps, projective bundles, blow-ups, perverse sheaves) are stand-ins for what other
roadmaps own: the six operations, duality, purity, Gysin and cycle classes, the projective-bundle
and blow-up decompositions, weak Lefschetz for smooth ample sections and normalized adic
realization are stated by EtaleCohomologyFoundations (TauCetiRoadmap pull request #938); the
enhanced tensor, internal Hom, derived limits and completion by EnhancedDerivedSheaves (#908);
the projective-bundle, blow-up and normal-bundle geometry by SchemeAndStackFoundations
(TauCetiRoadmap main) with the requests recorded in the packet; the perverse t-structure,
perverse sheaves, intermediate extension and intersection complexes by the accepted EDC.5 packet.
The theorems below state only what those owners do not. Elaboration checks types, not mathematics.
-/
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.CategoryTheory.Triangulated.Opposite.Triangulated
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Triangulated.TStructure.TruncLEGT
import Mathlib.CategoryTheory.Triangulated.TStructure.AbelianSubcategory
import Mathlib.CategoryTheory.Triangulated.HomologicalFunctor
import Mathlib.CategoryTheory.Triangulated.Subcategory
import Mathlib.CategoryTheory.Triangulated.Functor
import Mathlib.CategoryTheory.Simple
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.Topology.Sheaves.Sheaf
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.CategoryTheory.Sites.Point.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Field.ULift
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Topology.KrullDimension
import Mathlib.CategoryTheory.Subobject.ArtinianObject
import Mathlib.CategoryTheory.Subobject.NoetherianObject
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Trace
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.FiniteType
import Mathlib.Algebra.CharP.Defs
import Mathlib.Basic.Complex.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.CategoryTheory.Subobject.Lattice
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.AlgebraicGeometry.Geometrically.Connected

import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.Perfect
import Mathlib.Data.ZMod.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Biproducts
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic

noncomputable section
open CategoryTheory CategoryTheory.Limits CategoryTheory.Triangulated AlgebraicGeometry
open TopologicalSpace
open scoped TensorProduct
universe u
attribute [local instance] HasDerivedCategory.standard
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false
set_option linter.overlappingInstances false
namespace TauCeti.EtaleDuality

/-! t-exactness predicates, imported from EDC.5 (EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors). -/
section TExact
variable {C₁ C₂ : Type*} [Category C₁] [Preadditive C₁] [HasZeroObject C₁] [HasShift C₁ ℤ]
  [∀ n : ℤ, (shiftFunctor C₁ n).Additive] [Pretriangulated C₁]
  [Category C₂] [Preadditive C₂] [HasZeroObject C₂] [HasShift C₂ ℤ]
  [∀ n : ℤ, (shiftFunctor C₂ n).Additive] [Pretriangulated C₂]
/-- `T` is right t-exact: `T(C₁^{≤0}) ⊆ C₂^{≤0}`. -/
def Functor.IsRightTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  ∀ X : C₁, t₁.IsLE X 0 → t₂.IsLE (T.obj X) 0
/-- `T` is left t-exact: `T(C₁^{≥0}) ⊆ C₂^{≥0}`. -/
def Functor.IsLeftTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  ∀ X : C₁, t₁.IsGE X 0 → t₂.IsGE (T.obj X) 0
/-- `T` is t-exact. -/
def Functor.IsTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  Functor.IsRightTExact T t₁ t₂ ∧ Functor.IsLeftTExact T t₁ t₂
end TExact


/-! Heart-valued t-cohomology, imported from EDC.5 (EDC.5/t-structure-cohomology). -/
section THomology
variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] [IsTriangulated C] (t : TStructure C)
def TStructure.homologyZero : C ⥤ t.heart.FullSubcategory := sorry
/-- `H^n_t := H⁰_t ∘ [n]`. -/
def TStructure.homology (n : ℤ) : C ⥤ t.heart.FullSubcategory :=
  shiftFunctor C n ⋙ TStructure.homologyZero t
end THomology

/-! Common field and coefficient contexts. -/
variable (k : Type u) [Field k]
def finiteTypeSeparated : ObjectProperty (Over (Spec (CommRingCat.of k))) :=
  fun X => LocallyOfFiniteType X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom
abbrev Geo := (finiteTypeSeparated k).FullSubcategory
abbrev Geo.space (X : Geo k) := X.obj.left
abbrev Geo.structural (X : Geo k) : X.space ⟶ Spec (CommRingCat.of k) := X.obj.hom
abbrev Geo.map {X Y : Geo k} (f : X ⟶ Y) : X.space ⟶ Y.space := f.hom.left
instance (X : Geo k) : LocallyOfFiniteType X.structural := X.property.1
instance (X : Geo k) : QuasiCompact X.structural := X.property.2.1
instance (X : Geo k) : IsSeparated X.structural := X.property.2.2
variable {k}
class IntegralDatum (O : Type u) [CommRing O] where
  [domain : IsDomain O]
  [dvr : IsDiscreteValuationRing O]
  ell : ℕ
  [prime : Fact ell.Prime]
  [residueChar : CharP (IsLocalRing.ResidueField O) ell]
  invertible : IsUnit (ell : k)
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  uniformizer : O
  generates : Ideal.span {uniformizer} = IsLocalRing.maximalIdeal O
  [padicAlgebra : Algebra (Padic ell) (FractionRing O)]
  [finiteExtension : FiniteDimensional (Padic ell) (FractionRing O)]
  [integerAlgebra : Algebra (PadicInt ell) O]
  [integerFinite : Module.Finite (PadicInt ell) O]
  [integerFractionAlgebra : Algebra (PadicInt ell) (FractionRing O)]
  [integralTower : IsScalarTower (PadicInt ell) O (FractionRing O)]
  [rationalTower : IsScalarTower (PadicInt ell) (Padic ell) (FractionRing O)]
attribute [instance_reducible] IntegralDatum.padicAlgebra IntegralDatum.integerAlgebra
  IntegralDatum.integerFractionAlgebra
attribute [instance] IntegralDatum.domain IntegralDatum.dvr IntegralDatum.prime
  IntegralDatum.residueChar IntegralDatum.complete IntegralDatum.padicAlgebra IntegralDatum.finiteExtension
  IntegralDatum.integerAlgebra IntegralDatum.integerFinite IntegralDatum.integerFractionAlgebra
  IntegralDatum.integralTower IntegralDatum.rationalTower
class RationalDatum (E : Type u) [CommRing E] where
  O : Type u
  [ring : CommRing O]
  [integral : IntegralDatum (k := k) O]
  identify : FractionRing O ≃+* E
attribute [instance_reducible] RationalDatum.ring RationalDatum.integral
attribute [instance] RationalDatum.ring RationalDatum.integral
-- Finite-level noetherian coefficients, complete integral coefficients, or their fraction field.
def ValidCoefficients (Λ : Type u) [CommRing Λ] : Prop :=
  (∃ n : ℕ, 0 < n ∧ (n : Λ) = 0 ∧ IsUnit (n : k) ∧ IsNoetherianRing Λ) ∨
  Nonempty (IntegralDatum (k := k) Λ) ∨ Nonempty (RationalDatum (k := k) Λ)
class Coefficients (Λ : Type u) [CommRing Λ] : Prop where
  valid : ValidCoefficients (k := k) Λ
-- Imported from the arithmetic constructible-category supplier: continuous group cohomology.
def continuousGaloisCohomology (ell : ℕ) (k' : Type u) [Field k'] (i : ℕ) :
    ModuleCat.{u} (ZMod ell) := sorry
class BBDBase (ell : ℕ) : Prop where
  [perfect : PerfectField k]
  finiteCohomology : ∀ (k' : Type u) [Field k'] [Algebra k k'] [FiniteDimensional k k']
    (i : ℕ), Finite (continuousGaloisCohomology ell k' i)
attribute [instance] BBDBase.perfect

/-- BBD §§2.2.14–17, pp. 69–73: finite residue coefficients, DVR quotients,
integral coefficients, or a finite extension of Q_ell, over the specified perfect base. -/
class PerverseContext (Λ : Type u) [CommRing Λ] : Prop where
  [perfect : PerfectField k]
  existsRegime : ∃ ell : ℕ, ell.Prime ∧ IsUnit (ell : k) ∧
    ((Finite Λ ∧ IsField Λ ∧ ∃ n : ℕ, 0 < n ∧ (ell ^ n : Λ) = 0) ∨
     (∃ O : Type u, ∃ _ : CommRing O, ∃ D : IntegralDatum (k := k) O,
       D.ell = ell ∧ ∃ n : ℕ, 0 < n ∧ Nonempty (O ⧸ Ideal.span {D.uniformizer ^ n} ≃+* Λ)) ∨
     (BBDBase (k := k) ell ∧ ∃ D : IntegralDatum (k := k) Λ, D.ell = ell) ∨
     (BBDBase (k := k) ell ∧ ∃ D : RationalDatum (k := k) Λ, D.integral.ell = ell))
attribute [instance] PerverseContext.perfect

/-- Bounded duality (EtaleCohomologyFoundations §F.5) is supplied only for the stated Gorenstein coefficient regimes.
This condition places no finite-Tor restriction on the objects of Dbc. -/
class BoundedDualityCoefficients (Λ : Type u) [CommRing Λ] : Prop where
  regime :
    (IsField Λ ∧ ∃ ell : ℕ, ell.Prime ∧ IsUnit (ell : k) ∧
      ∃ n : ℕ, 0 < n ∧ (ell ^ n : Λ) = 0) ∨
    (∃ D : IntegralDatum (k := k) Λ, True) ∨
    (∃ D : RationalDatum (k := k) Λ, True) ∨
    (∃ O : Type u, ∃ _ : CommRing O, ∃ D : IntegralDatum (k := k) O,
      ∃ n : ℕ, 0 < n ∧ Nonempty (O ⧸ Ideal.span {D.uniformizer ^ n} ≃+* Λ))
instance {Λ : Type u} [CommRing Λ] [PerverseContext (k := k) Λ] : BoundedDualityCoefficients (k := k) Λ := sorry
instance {Λ : Type u} [CommRing Λ] [IntegralDatum (k := k) Λ] : BoundedDualityCoefficients (k := k) Λ := sorry

/-- The base point belongs to the finite-type separated category. -/
def basePoint (k : Type u) [Field k] : Geo k := sorry
lemma basePoint_space : (basePoint k).space = Spec (CommRingCat.of k) := sorry
abbrev geoIdentity (X : Geo k) : X ⟶ X := 𝟙 X
instance geoIdentityProper (X : Geo k) : IsProper (geoIdentity X).hom.left := sorry
def toBasePoint (X : Geo k) : X ⟶ basePoint k := sorry
lemma toBasePoint_native (X : Geo k) : (toBasePoint X).hom.left ≫ (basePoint k).structural = X.structural := sorry
/-- Imported fibre product (SchemeAndStackFoundations), with its maps over k. -/
def fiberProduct {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : Geo k := sorry
def fiberProductFst {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : fiberProduct f g ⟶ X := sorry
def fiberProductSnd {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : fiberProduct f g ⟶ Y := sorry
lemma fiberProduct_square {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) :
    fiberProductFst f g ≫ f = fiberProductSnd f g ≫ g := sorry
/-- Native universal-property identification, fixing the meaning of the imported carrier. -/
lemma fiberProduct_native {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) :
    Nonempty ((fiberProduct f g).space ≅ pullback f.hom.left g.hom.left) := sorry
/-- The chosen projections themselves satisfy the native universal property. -/
lemma fiberProduct_isPullback {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) :
    IsPullback (fiberProductFst f g).hom.left (fiberProductSnd f g).hom.left
      f.hom.left g.hom.left := sorry

/-- Existing unbounded carrier (EnhancedDerivedSheaves §0.1, `ClassicalDerived.enhancedCategory`); no new derived category is planned here. -/
abbrev SchemeEtaleDerived (Λ : Type u) [CommRing Λ] (X : Geo k) :=
  DerivedCategory (Sheaf X.space.smallEtaleTopology (ModuleCat.{u} Λ))

/-- Coefficient-module sheaves (EnhancedDerivedSheaves §0.1; EtaleCohomologyFoundations §§F.1, F.4.3): ordinary small-étale module sheaves for
finite torsion coefficients, and modules over the completed coefficient sheaf O_X or E_X
on the pro-etale site for integral/rational coefficients (Bhatt–Scholze 6.8.15, p.62).
The category is unbounded before constructibility or derived-completeness is imposed. -/
def CoefficientModuleSheaves (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := sorry
instance (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Category.{u} (CoefficientModuleSheaves Λ X) := sorry
instance (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Abelian (CoefficientModuleSheaves Λ X) := sorry
abbrev CoefficientDerived (Λ : Type u) [CommRing Λ] (X : Geo k) :=
  DerivedCategory (CoefficientModuleSheaves Λ X.space)

section Imported
variable {Λ : Type u} [CommRing Λ]
/-- EtaleCohomologyFoundations §F.1 (`VanishingCycles.constructibleDerivedCategory`) and EDC.6: bounded constructible complexes,
finite ordinary amplitude and, where explicitly required, finite Tor amplitude. -/
def Dbc (Λ : Type u) [CommRing Λ] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Dbc Λ X) := sorry
instance (X : Geo k) : Preadditive (Dbc Λ X) := sorry
instance (X : Geo k) : HasZeroObject (Dbc Λ X) := sorry
instance (X : Geo k) : Linear Λ (Dbc Λ X) := sorry
instance (X : Geo k) : HasShift (Dbc Λ X) ℤ := sorry
instance (X : Geo k) (n : ℤ) : (shiftFunctor (Dbc Λ X) n).Additive := sorry
instance (X : Geo k) : Pretriangulated (Dbc Λ X) := sorry
instance (X : Geo k) : IsTriangulated (Dbc Λ X) := sorry
/-- Fully faithful constructible realization (EtaleCohomologyFoundations §§F.1, F.4.3) in the correct coefficient category. -/
def coefficientRealization (X : Geo k) : Dbc Λ X ⥤ CoefficientDerived Λ X := sorry
instance (X : Geo k) : (coefficientRealization (Λ := Λ) X).Full := sorry
instance (X : Geo k) : (coefficientRealization (Λ := Λ) X).Faithful := sorry
/-- Finite torsion étale realization (EtaleCohomologyFoundations §F.1), used below only with annihilator invertible in k. -/
def etaleRealization (X : Geo k) : Dbc Λ X ⥤ SchemeEtaleDerived Λ X := sorry
/-- The finite-coefficient identification with the native small étale derived category. -/
def finiteCoefficientEquivalence (n : ℕ) (hn : 0 < n) (hkill : (n : Λ) = 0)
    (hunit : IsUnit (n : k)) (X : Geo k) : CoefficientDerived Λ X ≌ SchemeEtaleDerived Λ X := sorry
lemma finiteCoefficientEquivalence_tExact (n : ℕ) (hn : 0 < n) (hkill : (n : Λ) = 0)
    (hunit : IsUnit (n : k)) (X : Geo k) :
    Functor.IsTExact (finiteCoefficientEquivalence n hn hkill hunit X).functor
      (DerivedCategory.TStructure.t (C := CoefficientModuleSheaves Λ X.space))
      (DerivedCategory.TStructure.t (C := Sheaf X.space.smallEtaleTopology (ModuleCat.{u} Λ))) := sorry
lemma finiteCoefficientEquivalence_realization (n : ℕ) (hn : 0 < n) (hkill : (n : Λ) = 0)
    (hunit : IsUnit (n : k)) (X : Geo k) :
    Nonempty (coefficientRealization (Λ := Λ) X ⋙
      (finiteCoefficientEquivalence n hn hkill hunit X).functor ≅ etaleRealization X) := sorry
/-- Six operations, twists and cohomology over the common base (EtaleCohomologyFoundations §§0.7–0.8, F.0.3, F.1–F.2, F.5). -/
def pullback {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ Y ⥤ Dbc Λ X := sorry
def pushforward {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ X ⥤ Dbc Λ Y := sorry
def lowerShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ X ⥤ Dbc Λ Y := sorry
def upperShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ Y ⥤ Dbc Λ X := sorry
def verdierDual [BoundedDualityCoefficients (k := k) Λ] (X : Geo k) : (Dbc Λ X)ᵒᵖ ⥤ Dbc Λ X := sorry
def twist (X : Geo k) (m : ℤ) : Dbc Λ X ⥤ Dbc Λ X := sorry
def constant (X : Geo k) : Dbc Λ X := sorry
def standardTStructure (Λ : Type u) [CommRing Λ] (X : Geo k) : TStructure (Dbc Λ X) := sorry
def cohomology {X : Geo k} (q : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
def compactCohomology {X : Geo k} (q : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
def restriction {X Y : Geo k} (f : X ⟶ Y) (q : ℤ) (K : Dbc Λ Y) :
    cohomology q K ⟶ cohomology q ((pullback f).obj K) := sorry
abbrev H (Λ : Type u) [CommRing Λ] (X : Geo k) (q m : ℤ) := cohomology (Λ := Λ) q ((twist X m).obj (constant (Λ := Λ) X))
def gysin {Z X : Geo k} (i : Z ⟶ X) (c : ℕ) (q m : ℤ) :
    H Λ Z q m ⟶ H Λ X (q + 2 * c) (m + c) := sorry
/-- Stalks may use arbitrary separably closed field extensions; the space itself remains over k. -/
structure GeomPoint (X : Geo k) where
  Ω : Type u
  [field : Field Ω]
  [sepClosed : IsSepClosed Ω]
  pt : Spec (CommRingCat.of Ω) ⟶ X.space
attribute [instance] GeomPoint.field GeomPoint.sepClosed
def GeomPoint.map {X Y : Geo k} (f : X ⟶ Y) (x : GeomPoint X) : GeomPoint Y where
  Ω := x.Ω
  pt := x.pt ≫ f.hom.left
def GeomPoint.dim {X : Geo k} (x : GeomPoint X) : WithBot ℕ∞ :=
  topologicalKrullDim (closure ({x.pt.base (IsLocalRing.closedPoint x.Ω)} : Set X.space))
def stalkCohomology {X : Geo k} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
def costalkCohomology {X : Geo k} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
/-- Internal Hom (EnhancedDerivedSheaves §0.3, `ClassicalDerived.tensorHom`), before any bounded restriction. -/
def derivedInternalHom {X : Geo k} : CoefficientDerived Λ X → CoefficientDerived Λ X → CoefficientDerived Λ X := sorry
def schemeEtaleRHom {X : Geo k} : SchemeEtaleDerived Λ X → SchemeEtaleDerived Λ X → SchemeEtaleDerived Λ X := sorry
/-- Finite locally constant coefficient modules (EtaleCohomologyFoundations §F.0.1), realized in ordinary degree zero. -/
def Lisse (Λ : Type u) [CommRing Λ] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Lisse Λ X) := sorry
def lisseComplex {X : Geo k} : Lisse Λ X ⥤ Dbc Λ X := sorry
def constantLisse (X : Geo k) : Lisse Λ X := sorry
def restrictLisse {U X : Geo k} (j : U ⟶ X) [Etale j.hom.left] : Lisse Λ X ⥤ Lisse Λ U := sorry
/-- Ambient derived tensor (EnhancedDerivedSheaves §0.3). The native standard t-structure tests its actual amplitude. -/
def derivedTensor {X : Geo k} : CoefficientDerived Λ X → CoefficientDerived Λ X → CoefficientDerived Λ X := sorry
abbrev ambientStandardT (Λ : Type u) [CommRing Λ] (X : Geo k) :=
  DerivedCategory.TStructure.t (C := CoefficientModuleSheaves Λ X.space)
lemma coefficientRealization_bounds {X : Geo k} (K : Dbc Λ X) (a b : ℤ) :
    ((standardTStructure Λ X).IsGE K a ∧ (standardTStructure Λ X).IsLE K b) ↔
      ((ambientStandardT Λ X).IsGE ((coefficientRealization X).obj K) a ∧
       (ambientStandardT Λ X).IsLE ((coefficientRealization X).obj K) b) := sorry
def HasFiniteTorAmplitude {X : Geo k} (K : Dbc Λ X) : Prop :=
  ∃ a b : ℤ, ∀ M : CoefficientDerived Λ X, (ambientStandardT Λ X).heart M →
    (ambientStandardT Λ X).IsGE (derivedTensor ((coefficientRealization X).obj K) M) a ∧
    (ambientStandardT Λ X).IsLE (derivedTensor ((coefficientRealization X).obj K) M) b
/-- Essential-image witness, obtained only after ambient boundedness and constructibility. -/
def BoundedConstructible {X : Geo k} (K : CoefficientDerived Λ X) : Prop :=
  ∃ L : Dbc Λ X, Nonempty ((coefficientRealization X).obj L ≅ K)
def boundedRestriction {X : Geo k} (K : CoefficientDerived Λ X)
    (h : BoundedConstructible K) : Dbc Λ X := h.choose
def boundedRestrictionIso {X : Geo k} (K : CoefficientDerived Λ X)
    (h : BoundedConstructible K) : (coefficientRealization X).obj (boundedRestriction K h) ≅ K :=
  h.choose_spec.some
/-- Bounded restriction receipts (EtaleCohomologyFoundations §F.1); finite Tor is a hypothesis, not built into Dbc. -/
lemma tensor_boundedConstructible [Coefficients (k := k) Λ] {X : Geo k} (K L : Dbc Λ X)
    (hK : HasFiniteTorAmplitude K) :
    BoundedConstructible (derivedTensor ((coefficientRealization X).obj K) ((coefficientRealization X).obj L)) := sorry
lemma RHom_boundedConstructible [Coefficients (k := k) Λ] {X : Geo k} (K L : Dbc Λ X)
    (hK : HasFiniteTorAmplitude K) :
    BoundedConstructible (derivedInternalHom ((coefficientRealization X).obj K) ((coefficientRealization X).obj L)) := sorry
/-- SF.0 finite locally closed stratification, with an actual partition of the underlying space. -/
structure AlgebraicStratification (X : Geo k) where
  size : ℕ
  strata : Fin size → Geo k
  closures : Fin size → Geo k
  openPart : ∀ s, strata s ⟶ closures s
  closedPart : ∀ s, closures s ⟶ X
  openImmersion : ∀ s, IsOpenImmersion (openPart s).hom.left
  closedImmersion : ∀ s, IsClosedImmersion (closedPart s).hom.left
  disjoint : ∀ s t, s ≠ t → Disjoint
    (Set.range ((openPart s ≫ closedPart s).hom.left.base))
    (Set.range ((openPart t ≫ closedPart t).hom.left.base))
  cover : ⋃ s, Set.range ((openPart s ≫ closedPart s).hom.left.base) = Set.univ
abbrev AlgebraicStratification.inclusion {X : Geo k} (T : AlgebraicStratification X) (s : Fin T.size) :=
  T.openPart s ≫ T.closedPart s
/-- Ordinary cohomology, included back into the derived category. -/
def ordinaryCohomologyObject {Λ : Type u} [CommRing Λ] {X : Geo k} (i : ℤ) (K : Dbc Λ X) : Dbc Λ X :=
  (TStructure.homology (standardTStructure Λ X) i).obj K |>.obj
def pullbackCompIso {X Y Z : Geo k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    pullback (Λ := Λ) g ⋙ pullback f ≅ pullback (f ≫ g) := sorry
def pullbackPushforwardAdjunction {X Y : Geo k} (f : X ⟶ Y) :
    pullback (Λ := Λ) f ⊣ pushforward f := sorry
end Imported

/-! Imported from the accepted EDC.5 packet (EDC.5/middle-perverse-t-structure,
EDC.5/perverse-sheaf-category, EDC.5/shifted-local-systems-perverse,
EDC.5/perverse-intermediate-extension, EDC.5/intersection-complex-of-local-system), stated upstream
as `VanishingCycles.fieldPerverseTStructure` and `VanishingCycles.intermediateExtension`
(EtaleCohomologyFoundations §F.8). Stand-ins only; their API and tests live with their owners. -/
section ImportedPerverse
variable {Λ : Type u} [CommRing Λ] [PerverseContext (k := k) Λ]
def perverseTStructure (Λ : Type u) [CommRing Λ] [PerverseContext (k := k) Λ]
    (X : Geo k) : TStructure (Dbc Λ X) := sorry
abbrev PerverseSheaf (Λ : Type u) [CommRing Λ] [PerverseContext (k := k) Λ] (X : Geo k) :=
  (perverseTStructure Λ X).heart.FullSubcategory
instance PerverseSheaf.abelian (X : Geo k) : Abelian (PerverseSheaf Λ X) := sorry
lemma lisse_shift_isPerverse {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (L : Lisse Λ X) : (perverseTStructure Λ X).heart ((lisseComplex.obj L)⟦(d : ℤ)⟧) := sorry
def lissePerverse {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (L : Lisse Λ X) : PerverseSheaf Λ X := ⟨_, lisse_shift_isPerverse d L⟩
/-- Finite modules, as a full subcategory of Mathlib's ModuleCat. -/
abbrev FiniteModules (Λ : Type u) [CommRing Λ] :=
  ObjectProperty.FullSubcategory (fun M : ModuleCat.{u} Λ => Module.Finite Λ M)
def perversePointEquiv [IsSepClosed k] : PerverseSheaf Λ (basePoint k) ≌ FiniteModules Λ := sorry
def intermediateExtension {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    PerverseSheaf Λ U ⥤ PerverseSheaf Λ X := sorry
def intersectionComplex {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hdense : DenseRange j.hom.left.base) (d : ℕ) [SmoothOfRelativeDimension d U.structural]
    (L : Lisse Λ U) : PerverseSheaf Λ X := (intermediateExtension j).obj (lissePerverse d L)
end ImportedPerverse

/-! Derived extension of coefficients along a ring map (coherent coefficient change of
EnhancedDerivedSheaves §0.4, `ClassicalDerived.functorCoherence.coefficientComparison`). -/
def extendCoefficients {O E : Type u} [CommRing O] [CommRing E] (a : O →+* E) (X : Geo k) :
    Dbc O X ⥤ Dbc E X := sorry

/-! EDC.4. Geometry data: SchemeAndStackFoundations on TauCetiRoadmap main, with the SF.0/SF.3 requests of the
packet; cohomological operations: EtaleCohomologyFoundations (TauCetiRoadmap pull request #938).
P(V) parametrizes lines in V. Consequently the Chern relation has plus signs. -/
section GeometryData
/-- Algebraic vector bundles and line bundles (SchemeAndStackFoundations §5.4, AlgebraicVectorBundles), not coefficient local systems. -/
def VectorBundle (X : Geo k) : Type (u + 1) := sorry
def bundleRank {X : Geo k} (V : VectorBundle X) : ℕ := sorry
def LineBundle (X : Geo k) : Type (u + 1) := sorry
def tensorPower {X : Geo k} (L : LineBundle X) (r : ℕ) : LineBundle X := sorry
def GlobalSection {X : Geo k} (L : LineBundle X) : Type u := sorry
def projectiveSpace (k : Type u) [Field k] (N : ℕ) : Geo k := sorry
def hyperplaneBundle (N : ℕ) : LineBundle (projectiveSpace k N) := sorry
def pullbackLine {X Y : Geo k} (f : X ⟶ Y) (L : LineBundle Y) : LineBundle X := sorry
/-- Actual ampleness criterion: some positive tensor power comes from a projective embedding. -/
def IsAmple {X : Geo k} (L : LineBundle X) : Prop :=
  ∃ r : ℕ, 0 < r ∧ ∃ N : ℕ, ∃ e : X ⟶ projectiveSpace k N,
    IsClosedImmersion e.hom.left ∧ tensorPower L r = pullbackLine e (hyperplaneBundle N)
def zeroScheme {X : Geo k} {L : LineBundle X} (s : GlobalSection L) : Geo k := sorry
def zeroSchemeInclusion {X : Geo k} {L : LineBundle X} (s : GlobalSection L) : zeroScheme s ⟶ X := sorry
/-- Scheme-theoretic ample divisor, including its chosen section and positive power. -/
structure AmpleDivisor (X : Geo k) where
  L : LineBundle X
  ample : IsAmple L
  r : ℕ
  positive : 0 < r
  section_ : GlobalSection (tensorPower L r)
abbrev AmpleDivisor.Y {X : Geo k} (D : AmpleDivisor X) := zeroScheme D.section_
abbrev AmpleDivisor.i {X : Geo k} (D : AmpleDivisor X) : D.Y ⟶ X := zeroSchemeInclusion D.section_
/-- Projective bundles in the lines convention with tautological O(1) (SchemeAndStackFoundations §5.4, `projectiveBundle_dual_convention`). -/
def projectiveBundle {X : Geo k} (V : VectorBundle X) : Geo k := sorry
def bundleProjection {X : Geo k} (V : VectorBundle X) : projectiveBundle V ⟶ X := sorry
def tautologicalLine {X : Geo k} (V : VectorBundle X) : LineBundle (projectiveBundle V) := sorry
/-- Blow-up (SchemeAndStackFoundations §4.11, StableReduction Layer 4); the exceptional divisor as P(N) with its tautological line is the SF.0 request. -/
def blowup {Z X : Geo k} (i : Z ⟶ X) : Geo k := sorry
def blowupProjection {Z X : Geo k} (i : Z ⟶ X) : blowup i ⟶ X := sorry
def exceptionalDivisor {Z X : Geo k} (i : Z ⟶ X) : Geo k := sorry
def exceptionalInclusion {Z X : Geo k} (i : Z ⟶ X) : exceptionalDivisor i ⟶ blowup i := sorry
def exceptionalProjection {Z X : Geo k} (i : Z ⟶ X) : exceptionalDivisor i ⟶ Z := sorry
def normalBundle {Z X : Geo k} (i : Z ⟶ X) : VectorBundle Z := sorry
/-- Kummer first Chern class (EtaleCohomologyFoundations §0.9); higher étale Chern classes are EDC.3/chern-classes. -/
def chernClass {Λ : Type u} [CommRing Λ] {X : Geo k} (L : LineBundle X) : H Λ X 2 1 := sorry
def bundleChern {Λ : Type u} [CommRing Λ] {X : Geo k} (V : VectorBundle X) (r : ℕ) :
    H Λ X (2 * r) r := sorry
def cupPower {Λ : Type u} [CommRing Λ] {X : Geo k} (h : H Λ X 2 1) (r : ℕ) :
    H Λ X (2 * r) r := sorry
/-- The Chern action includes its cohomological and Tate degrees. -/
def cupChernPower {Λ : Type u} [CommRing Λ] {X : Geo k} (h : H Λ X 2 1)
    (r : ℕ) (q m : ℤ) : H Λ X q m →ₗ[Λ] H Λ X (q + 2 * r) (m + r) := sorry
def cohomologicalPullback {Λ : Type u} [CommRing Λ] {X Y : Geo k} (f : X ⟶ Y) (q m : ℤ) :
    H Λ Y q m →ₗ[Λ] H Λ X q m := sorry
def traceMap {Λ : Type u} [CommRing Λ] {X : Geo k} (d : ℕ) : H Λ X (2 * d) d →ₗ[Λ] Λ := sorry
def poincareForm {Λ : Type u} [CommRing Λ] (X : Geo k) (d : ℕ) :
    LinearMap.BilinForm Λ (H Λ X d 0) := sorry
end GeometryData

section WeakLefschetz
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ] [IsSepClosed k]
/-- Stalk-defined support of each ordinary cohomology sheaf. -/
def cohomologySupport {X : Geo k} (K : Dbc Λ X) (q : ℤ) : Set X.space :=
  {y | ∃ x : GeomPoint X, x.pt.base (IsLocalRing.closedPoint x.Ω) = y ∧
    ¬ IsZero (stalkCohomology x q K)}
/-- EDC.4/affine-vanishing-hypercohomology: the support-sensitive bound for complexes. The sheaf case is
`VanishingCycles.affineArtinVanishing` (EtaleCohomologyFoundations §F.3). -/
theorem affine_vanishing_hypercohomology {U : Geo k} [IsAffine U.space]
    (K : Dbc Λ U) (b : ℤ)
    (h : ∀ q : ℤ, ∀ d : ℕ, topologicalKrullDim (closure (cohomologySupport K q)) = d → q + d ≤ b)
    (m : ℤ) (hm : b < m) : IsZero (cohomology m K) := sorry
/-- Self-injective finite regimes, or a genuine integral/rational adic regime. -/
def DualityCoefficients : Prop :=
  (∃ O : Type u, ∃ _ : CommRing O, ∃ D : IntegralDatum (k := k) O,
    ∃ n : ℕ, 0 < n ∧ Nonempty (O ⧸ Ideal.span {D.uniformizer ^ n} ≃+* Λ)) ∨
  Nonempty (IntegralDatum (k := k) Λ) ∨ Nonempty (RationalDatum (k := k) Λ)
/-- EDC.4/compact-support-vanishing-smooth-affine. -/
theorem compact_support_vanishing_smooth_affine {U : Geo k} [IsAffine U.space]
    (d : ℕ) [SmoothOfRelativeDimension d U.structural]
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (L : Lisse Λ U) (i : ℤ) (hi : i < d) :
    IsZero (compactCohomology i (lisseComplex.obj L)) := sorry
/-- EDC.4/ample-divisor-weak-lefschetz: this also covers hyperplane sections. -/
theorem ample_divisor_weak_lefschetz {X : Geo k} (D : AmpleDivisor X)
    [IsProper X.structural] (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    (hproper : Set.range D.i.hom.left.base ≠ Set.univ)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (L : Lisse Λ X) (q : ℤ) :
    (q < n → IsIso (restriction D.i q (lisseComplex.obj L))) ∧
    (q = n → Mono (restriction D.i q (lisseComplex.obj L))) := sorry
/-- Hyperplane data explicitly identifies O(1) and its section. -/
structure HyperplaneSection (X : Geo k) extends AmpleDivisor X where
  N : ℕ
  embedding : X ⟶ projectiveSpace k N
  closed : IsClosedImmersion embedding.hom.left
  line : L = pullbackLine embedding (hyperplaneBundle N)
  power_one : r = 1
/-- EDC.4/weak-lefschetz; no smoothness of the section is assumed. For a smooth section and constant
coefficients this is `VanishingCycles.etaleWeakLefschetz` (EtaleCohomologyFoundations §F.7). -/
theorem weak_lefschetz {X : Geo k} (D : HyperplaneSection (k := k) X)
    [IsProper X.structural] (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    (hproper : Set.range D.toAmpleDivisor.i.hom.left.base ≠ Set.univ)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (L : Lisse Λ X) (q : ℤ) :
    (q < n → IsIso (restriction D.toAmpleDivisor.i q (lisseComplex.obj L))) ∧
    (q = n → Mono (restriction D.toAmpleDivisor.i q (lisseComplex.obj L))) := sorry
/-- Gysin map with lisse coefficients (EtaleCohomologyFoundations §§0.10, F.6); the Tate twist is essential. -/
def gysinLisse {X : Geo k} (D : AmpleDivisor X) (L : Lisse Λ X) (q : ℤ) :
    cohomology q ((pullback D.i).obj (lisseComplex.obj L)) ⟶
      cohomology (q + 2) ((twist X 1).obj (lisseComplex.obj L)) := sorry
/-- EDC.4/weak-lefschetz-gysin, now with smooth section. -/
theorem weak_lefschetz_gysin {X : Geo k} (D : AmpleDivisor X) [IsProper X.structural]
    (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    [SmoothOfRelativeDimension n D.Y.structural]
    (hproper : Set.range D.i.hom.left.base ≠ Set.univ)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (L : Lisse Λ X) (q : ℤ) :
    (n < q → IsIso (gysinLisse D L q)) ∧ (q = n → Epi (gysinLisse D L q)) := sorry
end WeakLefschetz

section IntegralWeakLefschetz
variable {O : Type u} [CommRing O] [IntegralDatum (k := k) O] [IsSepClosed k]
/-- EDC.4/weak-lefschetz-integral: both the compact group and the saturated cokernel. -/
theorem weak_lefschetz_integral {X U : Geo k} (D : AmpleDivisor X) [IsProper X.structural]
    (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hcomp : Set.range j.hom.left.base = (Set.range D.i.hom.left.base)ᶜ) :
    NoZeroSMulDivisors O (compactCohomology (n + 1) (constant (Λ := O) U)) ∧
    NoZeroSMulDivisors O ((cokernel (restriction D.i n (constant (Λ := O) X))) : ModuleCat.{u} O) := sorry
end IntegralWeakLefschetz

section BundleBlowup
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ] [PerfectField k]
/-- EtaleCohomologyFoundations §0.9: the Kummer first Chern class and cup product, represented as a derived
morphism. The source is Lambda(-j)[-2j], so the Tate and shift conventions are fixed. -/
def derivedChernColumn {X : Geo k} (L : LineBundle X) (j : ℕ) :
    ((twist X (-(j : ℤ))).obj (constant (Λ := Λ) X))⟦(-2 * (j : ℤ))⟧ ⟶ constant X := sorry
/-- Canonical pullback/constant/Tate/shift compatibility (EtaleCohomologyFoundations §§F.0.3, F.1). -/
def pullbackTwistedConstant {X Y : Geo k} (f : X ⟶ Y) (a b : ℤ) :
    (pullback (Λ := Λ) f).obj (((twist Y a).obj (constant Y))⟦b⟧) ≅
      ((twist X a).obj (constant X))⟦b⟧ := sorry
/-- Action of the same class on arbitrary K, via the tensor product of EnhancedDerivedSheaves §0.3. -/
def derivedChernAction {X : Geo k} (L : LineBundle X) (K : Dbc Λ X) :
    K ⟶ ((twist X 1).obj K)⟦(2 : ℤ)⟧ := sorry
/-- The Chern column of the projective bundle formula, imported from EtaleCohomologyFoundations §0.9. -/
def bundleColumn {X : Geo k} (V : VectorBundle X) (j : ℕ) :
    ((twist X (-(j : ℤ))).obj (constant (Λ := Λ) X))⟦(-2 * (j : ℤ))⟧ ⟶
      (pushforward (bundleProjection V)).obj (constant (projectiveBundle V)) :=
  (pullbackPushforwardAdjunction (bundleProjection V)).homEquiv _ _
    ((pullbackTwistedConstant (bundleProjection V) (-(j : ℤ)) (-2 * (j : ℤ))).hom ≫
      derivedChernColumn (tautologicalLine V) j)
instance (X : Geo k) : HasFiniteBiproducts (Dbc Λ X) := sorry
instance : HasFiniteBiproducts (ModuleCat.{u} Λ) := sorry
/-- EDC.4/projective-bundle-decomposition (a): all Chern columns, not an unspecified equivalence. Stated upstream
(EtaleCohomologyFoundations §0.9 and §F.7); restated only to fix the columns that (b)–(e) use. -/
theorem projective_bundle_decomposition {X : Geo k} (V : VectorBundle X) (m : ℕ)
    (hrank : bundleRank V = m + 1) :
    IsIso (biproduct.desc (fun j : Fin (m + 1) => bundleColumn (Λ := Λ) V j)) := sorry
/-- The projection formula gives the entire cohomological split with arbitrary coefficients K. -/
lemma projective_bundle_cohomology {X : Geo k} (V : VectorBundle X) (m : ℕ)
    (hrank : bundleRank V = m + 1) (K : Dbc Λ X) (q : ℤ) :
    Nonempty (cohomology q ((pullback (bundleProjection V)).obj K) ≅
      ⨁ (fun j : Fin (m + 1) => cohomology (q - 2 * j)
        ((twist X (-(j : ℤ))).obj K))) := sorry
/-- Each term of the Chern relation is transported to the same degree and Tate twist. -/
def chernRelationTerm {X : Geo k} (V : VectorBundle X) (r m : ℕ) :
    H Λ (projectiveBundle V) (2 * (m + 1)) (m + 1) :=
  if hr : r ≤ m + 1 then
    cast (by congr 1)
      (cupChernPower (chernClass (tautologicalLine V)) (m + 1 - r) (2 * r) r
        (cohomologicalPullback (bundleProjection V) (2 * r) r (bundleChern V r)))
  else 0
lemma projective_bundle_chern_relation {X : Geo k} (V : VectorBundle X) (m : ℕ)
    (hrank : bundleRank V = m + 1) : ∑ r ∈ Finset.range (m + 2), chernRelationTerm (Λ := Λ) V r m = 0 := sorry
/-- Gysin pushforward for a smooth proper map of relative dimension m (EtaleCohomologyFoundations §§0.11, F.6). -/
def smoothPushforward {P X : Geo k} (π : P ⟶ X) (m : ℕ) (q t : ℤ) :
    H Λ P (q + 2 * m) (t + m) →ₗ[Λ] H Λ X q t := sorry
lemma projective_bundle_pushforward {X : Geo k} (V : VectorBundle X) (m : ℕ)
    (hrank : bundleRank V = m + 1) (q t : ℤ) (a : H Λ X q t) :
    smoothPushforward (bundleProjection V) m q t
      (cupChernPower (chernClass (tautologicalLine V)) m q t
        (cohomologicalPullback (bundleProjection V) q t a)) = a := sorry
lemma projective_bundle_pushforward_lower {X : Geo k} (V : VectorBundle X) (m j : ℕ)
    (hrank : bundleRank V = m + 1) (hj : j < m) (q t : ℤ) (a : H Λ X q t) :
    smoothPushforward (Λ := Λ) (bundleProjection V) m (q + 2 * j - 2 * m) (t + j - m)
      (by exact cast (by sorry) (cupChernPower (chernClass (tautologicalLine V)) j q t
        (cohomologicalPullback (bundleProjection V) q t a))) = 0 := sorry
/-- Derived unit and exceptional Gysin columns, with powers zeta^(a-1). -/
def blowupUnit {Z X : Geo k} (i : Z ⟶ X) : constant (Λ := Λ) X ⟶
    (pushforward (blowupProjection i)).obj (constant (blowup i)) := sorry
def blowupColumn {Z X : Geo k} (i : Z ⟶ X) (a : ℕ) :
    (pushforward i).obj (((twist Z (-(a + 1 : ℤ))).obj (constant (Λ := Λ) Z))⟦(-2 * (a + 1 : ℤ))⟧) ⟶
      (pushforward (blowupProjection i)).obj (constant (blowup i)) := sorry
/-- The source identifies its first summand with Lambda_X and the remaining summands with
 i_*Lambda_Z(-a)[-2a], 1 <= a < c. -/
def blowupSplitMap {Z X : Geo k} (i : Z ⟶ X) (c : ℕ) :
    constant (Λ := Λ) X ⊞
      ⨁ (fun a : Fin (c - 1) => (pushforward i).obj
        (((twist Z (-(a + 1 : ℤ))).obj (constant (Λ := Λ) Z))⟦(-2 * (a + 1 : ℤ))⟧)) ⟶
      (pushforward (blowupProjection i)).obj (constant (blowup i)) :=
  biprod.desc (blowupUnit i) (biproduct.desc (fun a => blowupColumn i a))
/-- EDC.4/blowup-direct-images: the specified unit/Gysin map is invertible. -/
theorem blowup_direct_images {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] : IsIso (blowupSplitMap (Λ := Λ) i c) := sorry
/-- All cohomological columns use the exceptional Gysin of zeta^(a-1) p^*(-). -/
def exceptionalTautological {Z X : Geo k} (i : Z ⟶ X) : LineBundle (exceptionalDivisor i) := sorry
def blowupCohomologyColumn {Z X : Geo k} (i : Z ⟶ X) (a : ℕ) (q : ℤ) :
    H Λ Z (q - 2 * (a + 1)) (-(a + 1 : ℤ)) ⟶ H Λ (blowup i) q 0 :=
  ModuleCat.ofHom ((cupChernPower (chernClass (exceptionalTautological i)) a
    (q - 2 * (a + 1)) (-(a + 1 : ℤ))).comp
      (cohomologicalPullback (exceptionalProjection i) (q - 2 * (a + 1)) (-(a + 1 : ℤ)))) ≫
      gysin (exceptionalInclusion i) 1 (q - 2 * (a + 1) + 2 * a) (-(a + 1 : ℤ) + a) ≫
      eqToHom (by congr 1 <;> omega)
def blowupCohomologyMap {Z X : Geo k} (i : Z ⟶ X) (c : ℕ) (q : ℤ) :
    H Λ X q 0 ⊞ ⨁ (fun a : Fin (c - 1) => H Λ Z (q - 2 * (a + 1)) (-(a + 1 : ℤ))) ⟶
      H Λ (blowup i) q 0 :=
  biprod.desc (ModuleCat.ofHom (cohomologicalPullback (blowupProjection i) q 0))
    (biproduct.desc (fun a => blowupCohomologyColumn i a q))
/-- EDC.4/blowup-formula: the split in every degree. The decomposition is `VanishingCycles.etaleBlowup`
(EtaleCohomologyFoundations §F.7); this fixes the explicit columns Φ whose retraction and weights are planned here. -/
theorem blowup_formula {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (q : ℤ) :
    IsIso (blowupCohomologyMap (Λ := Λ) i c q) := sorry
/-- Degree-zero proper pushforward (EtaleCohomologyFoundations §F.6); the first inverse component. -/
def properPushforward {X' X : Geo k} (π : X' ⟶ X) (q : ℤ) : H Λ X' q 0 ⟶ H Λ X q 0 := sorry
lemma blowup_first_inverse {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (q : ℤ) :
    blowupCohomologyMap (Λ := Λ) i c q ≫ properPushforward (blowupProjection i) q = biprod.fst := sorry
/-- EDC.4/pencil-axis-blowup: codimension two gives exactly two summands. -/
theorem pencil_axis_blowup {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d : ℕ) (hd : 2 ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - 2) Z.structural] (q : ℤ) :
    IsIso (biprod.desc (ModuleCat.ofHom (cohomologicalPullback (Λ := Λ) (blowupProjection i) q 0))
      (blowupCohomologyColumn i 0 q)) := sorry
/-- Global derived sections followed by ordinary module cohomology (EtaleCohomologyFoundations §F.1). -/
def globalCohomologyFunctor (X : Geo k) (q : ℤ) : Dbc Λ X ⥤ ModuleCat.{u} Λ where
  obj := cohomology q
  map := by sorry
  map_id := by sorry
  map_comp := by sorry
/-- Proper direct-image, twist and shift identifications (EtaleCohomologyFoundations §§0.8, F.0.3). -/
def blowupColumnSource {Z X : Geo k} (i : Z ⟶ X) (a : ℕ) (q : ℤ) :
    cohomology q ((pushforward i).obj
      (((twist Z (-(a + 1 : ℤ))).obj (constant (Λ := Λ) Z))⟦(-2 * (a + 1 : ℤ))⟧)) ≅
      H Λ Z (q - 2 * (a + 1)) (-(a + 1 : ℤ)) := sorry
def blowupColumnTarget {Z X : Geo k} (i : Z ⟶ X) (q : ℤ) :
    cohomology q ((pushforward (blowupProjection i)).obj (constant (Λ := Λ) (blowup i))) ≅
      H Λ (blowup i) q 0 := sorry
lemma blowupColumn_cohomology {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (a : ℕ) (ha : a + 1 < c) (q : ℤ) :
    (globalCohomologyFunctor X q).map (blowupColumn (Λ := Λ) i a) ≫ (blowupColumnTarget i q).hom =
      (blowupColumnSource i a q).hom ≫ blowupCohomologyColumn i a q := sorry
/-- Self-intersection is multiplication by c1(O_E(-1)) = -zeta. -/
lemma blowup_exceptional_restriction {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (a : ℕ) (ha : a + 1 < c) (q : ℤ)
    (x : H Λ Z (q - 2 * (a + 1)) (-(a + 1 : ℤ))) :
    cohomologicalPullback (exceptionalInclusion i) q 0 (blowupCohomologyColumn (Λ := Λ) i a q x) =
      -cast (by sorry) (cupChernPower (chernClass (exceptionalTautological i)) (a + 1)
        (q - 2 * (a + 1)) (-(a + 1 : ℤ))
        (cohomologicalPullback (exceptionalProjection i) (q - 2 * (a + 1)) (-(a + 1 : ℤ)) x)) := sorry
end BundleBlowup

section CompleteIntersections
/-- Projective zero scheme of the homogeneous equations (SF.0 request). -/
def projectiveZeroScheme (N : ℕ) (F : List (MvPolynomial (Fin (N + 1)) k)) : Geo k := sorry
def projectiveZeroInclusion (N : ℕ) (F : List (MvPolynomial (Fin (N + 1)) k)) :
    projectiveZeroScheme N F ⟶ projectiveSpace k N := sorry
/-- The actual complete intersection, degree and hyperplane polarization. The intermediate
smoothness hypothesis in the packet is recorded by the chosen chain below. -/
structure CompleteIntersectionData (X : Geo k) (m : ℕ) where
  N : ℕ
  hmN : m ≤ N
  F : Fin (N - m) → MvPolynomial (Fin (N + 1)) k
  degrees : Fin (N - m) → ℕ
  positive : ∀ a, 0 < degrees a
  homogeneous : ∀ a, (F a).IsHomogeneous (degrees a)
  regular : RingTheory.Sequence.IsRegular (MvPolynomial (Fin (N + 1)) k) (List.ofFn F)
  identify : X ≅ projectiveZeroScheme N (List.ofFn F)
  polarization : LineBundle X
  hyperplane : polarization = pullbackLine (identify.hom ≫ projectiveZeroInclusion N (List.ofFn F))
    (hyperplaneBundle N)
  chain : Fin (N - m + 1) → Geo k
  smooth : ∀ a : Fin (N - m + 1), SmoothOfRelativeDimension (N - a) (chain a).structural
  start : chain 0 ≅ projectiveSpace k N
  finish : chain ⟨N - m, by omega⟩ ≅ X
  sections : ∀ a : Fin (N - m), AmpleDivisor (chain ⟨a, by omega⟩)
  next : ∀ a : Fin (N - m), (sections a).Y ≅ chain ⟨a + 1, by omega⟩
  multidegree : ∀ a : Fin (N - m), (sections a).r = degrees a
abbrev CompleteIntersectionData.degree {X : Geo k} {m : ℕ} (D : CompleteIntersectionData X m) : ℕ :=
  ∏ a, D.degrees a
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ] [IsSepClosed k]
def complementaryPairing {X : Geo k} (m j : ℕ) :
    H Λ X (2 * (m - j)) (m - j) →ₗ[Λ] H Λ X (2 * j) j →ₗ[Λ] Λ := sorry
/-- EDC.4/complete-intersection-cohomology, all degrees outside the middle. -/
theorem complete_intersection_cohomology {X : Geo k} (m : ℕ) (hm : 1 ≤ m)
    [SmoothOfRelativeDimension m X.structural] (D : CompleteIntersectionData X m)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) :
    (∀ q : ℤ, (q < 0 ∨ 2 * (m : ℤ) < q) → IsZero (H Λ X q 0)) ∧
    (∀ q : ℕ, q ≤ 2 * m → q ≠ m → Odd q → IsZero (H Λ X q 0)) ∧
    (∀ j : ℕ, 2 * j ≤ 2 * m → 2 * j ≠ m → Module.Free Λ (H Λ X (2 * j) j) ∧
      Module.Finite Λ (H Λ X (2 * j) j)) ∧
    (∀ j : ℕ, 2 * j < m → ∃ e : H Λ X (2 * j) j ≃ₗ[Λ] Λ,
      e (cupPower (chernClass D.polarization) j) = 1) ∧
    (∀ j : ℕ, m < 2 * j → j ≤ m → ∃ e : H Λ X (2 * j) j ≃ₗ[Λ] Λ,
      complementaryPairing m j (cupPower (chernClass D.polarization) (m - j)) (e.symm 1) = 1 ∧
      e (cupPower (chernClass D.polarization) j) = (D.degree : Λ)) := sorry
/-- All integral groups, including the middle, are finite free; freeness is not confined to q<m. -/
theorem complete_intersection_integral_free {O : Type u} [CommRing O] [IntegralDatum (k := k) O]
    {X : Geo k} (m : ℕ) (hm : 1 ≤ m) [SmoothOfRelativeDimension m X.structural]
    (D : CompleteIntersectionData X m) (q : ℤ) :
    Module.Free O (H O X q 0) ∧ Module.Finite O (H O X q 0) := sorry
/-- The primitive part is the specified cup-product kernel. -/
def completeIntersectionPrimitive {X : Geo k} (m t : ℤ) (h : H Λ X 2 1) :
    Submodule Λ (H Λ X m t) := LinearMap.ker (cupChernPower h 1 m t)
def middleHyperplaneClass {X : Geo k} (m : ℕ) (heven : Even m) (h : H Λ X 2 1) :
    H Λ X m (m / 2) := cast (by sorry) (cupPower h (m / 2))
def completeIntersectionMiddleMap {X : Geo k} (m : ℕ) (heven : Even m) (h : H Λ X 2 1) :
    Λ × completeIntersectionPrimitive m (m / 2) h →ₗ[Λ] H Λ X m (m / 2) :=
  { toFun := fun a => a.1 • middleHyperplaneClass m heven h + a.2.val
    map_add' := by sorry
    map_smul' := by sorry }
lemma complete_intersection_primitive_split {X : Geo k} (m : ℕ) (hm : 1 ≤ m)
    [SmoothOfRelativeDimension m X.structural] (D : CompleteIntersectionData X m)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (heven : Even m) (hdegree : IsUnit (D.degree : Λ)) :
    Function.Bijective (completeIntersectionMiddleMap m heven (chernClass (Λ := Λ) D.polarization)) := sorry
lemma complete_intersection_odd_primitive {X : Geo k} (m : ℕ) (hm : 1 ≤ m)
    [SmoothOfRelativeDimension m X.structural] (D : CompleteIntersectionData X m)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (hodd : Odd m) :
    completeIntersectionPrimitive (Λ := Λ) m 0 (chernClass D.polarization) = ⊤ := sorry
/-- Test `TauCeti.EtaleDuality.completeIntersection_conic_generator`: the hyperplane square class has degree two. -/
example [Nontrivial Λ] {X : Geo k} [SmoothOfRelativeDimension 1 X.structural]
    (D : CompleteIntersectionData X 1) (hdegree : D.degree = 2)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (htwo : ¬ IsUnit (2 : Λ)) :
    ∃ e : H Λ X 2 1 ≃ₗ[Λ] Λ, e (chernClass D.polarization) = 2 ∧
      ¬ Function.Surjective (fun r : Λ => r • chernClass (Λ := Λ) D.polarization) := sorry
end CompleteIntersections


section BundlePairing
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ] [IsSepClosed k] [PerfectField k]
/-- Cup-product trace pairing (EtaleCohomologyFoundations §§0.11, F.6) in complementary cohomological
and Tate degrees, without choosing a Tate generator. -/
def complementaryCohomologyPairing (X : Geo k) (d : ℕ) (q t : ℤ) :
    H Λ X q t →ₗ[Λ] H Λ X (2 * d - q) (d - t) →ₗ[Λ] Λ := sorry
/-- The projective-bundle basis has the trace pairing fixed by its actual Chern
columns. Below the fibre top degree the pairing vanishes; at that degree it
is exactly the base pairing. -/
lemma projective_bundle_pairing {X : Geo k} [IsProper X.structural]
    (d : ℕ) [SmoothOfRelativeDimension d X.structural] (V : VectorBundle X)
    (m j j' : ℕ) (hrank : bundleRank V = m + 1) (hj : j + j' ≤ m)
    (q t : ℤ) (a : H Λ X q t)
    (b : H Λ X (2 * (d + m) - (q + 2 * j) - 2 * j') ((d + m) - (t + j) - j')) :
    complementaryCohomologyPairing (projectiveBundle V) (d + m) (q + 2 * j) (t + j)
      (cupChernPower (chernClass (tautologicalLine V)) j q t
        (cohomologicalPullback (bundleProjection V) q t a))
      (cast (by sorry)
        (cupChernPower (chernClass (tautologicalLine V)) j'
          (2 * (d + m) - (q + 2 * j) - 2 * j') ((d + m) - (t + j) - j')
          (cohomologicalPullback (bundleProjection V) _ _ b))) =
      if h : j + j' = m then
        complementaryCohomologyPairing X d q t a (cast (by sorry) b)
      else 0 := sorry
end BundlePairing

section Vanishing
variable {E : Type u} [Field E] [Coefficients (k := k) E] [IsSepClosed k]
/-- EDC.4/vanishing-and-restriction-subspaces. -/
def vanishingSubspace {Y X : Geo k} (i : Y ⟶ X) (n : ℕ) : Submodule E (H E Y n 0) :=
  LinearMap.ker (gysin (Λ := E) i 1 n 0).hom
def restrictedSubspace {Y X : Geo k} (i : Y ⟶ X) (n : ℕ) : Submodule E (H E Y n 0) :=
  LinearMap.range (cohomologicalPullback (Λ := E) i n 0)
lemma restrictedSubspace_eq_orthogonal {X : Geo k} (D : AmpleDivisor X)
    [IsProper X.structural] (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    [SmoothOfRelativeDimension n D.Y.structural] :
    restrictedSubspace (E := E) D.i n =
      (poincareForm D.Y n).orthogonal (vanishingSubspace (E := E) D.i n) := sorry
lemma vanishingSubspace_eq_orthogonal {X : Geo k} (D : AmpleDivisor X)
    [IsProper X.structural] (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    [SmoothOfRelativeDimension n D.Y.structural] :
    vanishingSubspace (E := E) D.i n =
      (poincareForm D.Y n).orthogonal (restrictedSubspace (E := E) D.i n) := sorry
lemma finrank_restricted_add_vanishing {X : Geo k} (D : AmpleDivisor X) [IsProper X.structural]
    (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural] [SmoothOfRelativeDimension n D.Y.structural] :
    Module.finrank E (restrictedSubspace (E := E) D.i n) + Module.finrank E (vanishingSubspace (E := E) D.i n) =
      Module.finrank E (H E D.Y n 0) := sorry
lemma gysin_comp_restriction {X : Geo k} (D : AmpleDivisor X) [IsProper X.structural]
    (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural] [SmoothOfRelativeDimension n D.Y.structural]
    (q : ℤ) : (gysin (Λ := E) D.i 1 q 0).hom.comp (cohomologicalPullback (Λ := E) D.i q 0) =
      cupChernPower (chernClass (tensorPower D.L D.r)) 1 q 0 := sorry
/-- Primitive kernels are defined without assuming hard Lefschetz or a direct-sum splitting. -/
def primitiveSubspace {X : Geo k} (n q : ℕ) (h : H E X 2 1) : Submodule E (H E X q 0) :=
  LinearMap.ker (cupChernPower h (n + 2 - q) q 0)
/-- Galois descent data (EtaleCohomologyFoundations §F.4.6) include equivariance of restriction, Gysin and twists. -/
def geometricGaloisAction {Y X : Geo k} (i : Y ⟶ X) (n : ℕ) (G : Type u) [Group G] :
    G →* (H E Y n 0 ≃ₗ[E] H E Y n 0) := sorry
lemma vanishingSubspace_galois {Y X : Geo k} (i : Y ⟶ X) (n : ℕ) (G : Type u) [Group G]
    (ρ : G →* (H E Y n 0 ≃ₗ[E] H E Y n 0))
    (ρX : G →* (H E X n 0 ≃ₗ[E] H E X n 0))
    (ρX' : G →* (H E X (n + 2) 1 ≃ₗ[E] H E X (n + 2) 1))
    (hres : ∀ g, (ρ g).toLinearMap.comp (cohomologicalPullback (Λ := E) i n 0) =
      (cohomologicalPullback (Λ := E) i n 0).comp (ρX g).toLinearMap)
    (hgys : ∀ g, (ρX' g).toLinearMap.comp (gysin (Λ := E) i 1 n 0).hom =
      (gysin (Λ := E) i 1 n 0).hom.comp (ρ g).toLinearMap) (g : G) :
    (vanishingSubspace (E := E) i n).map (ρ g).toLinearMap = vanishingSubspace i n ∧
    (restrictedSubspace (E := E) i n).map (ρ g).toLinearMap = restrictedSubspace i n := sorry
/-- Test `TauCeti.EtaleDuality.vanishingSubspace_projectiveSpace`. -/
example {X : Geo k} (D : HyperplaneSection (k := k) X) (n : ℕ)
    (hX : Nonempty (X ≅ projectiveSpace k (n + 1)))
    (hY : Nonempty (D.toAmpleDivisor.Y ≅ projectiveSpace k n)) :
    vanishingSubspace (E := E) D.toAmpleDivisor.i n = ⊥ ∧
      restrictedSubspace (E := E) D.toAmpleDivisor.i n = ⊤ := sorry
/-- Test `TauCeti.EtaleDuality.restrictedSubspace_planeCubic`: a smooth cubic in the O(3) embedding has genus one. -/
example {X : Geo k} (D : AmpleDivisor X) (eX : X ≅ projectiveSpace k 2)
    [SmoothOfRelativeDimension 1 D.Y.structural]
    (hL : D.L = pullbackLine eX.hom (hyperplaneBundle 2)) (hr : D.r = 3) :
    restrictedSubspace (E := E) D.i 1 = ⊥ ∧ vanishingSubspace (E := E) D.i 1 = ⊤ ∧
      Module.finrank E (H E D.Y 1 0) = 2 := sorry
/-- Test `TauCeti.EtaleDuality.vanishingSubspace_zero_of_curve_point`: for d reduced points the kernel has dimension d-1. -/
example {X : Geo k} [SmoothOfRelativeDimension 1 X.structural] [ConnectedSpace X.space]
    [IsProper X.structural] (D : AmpleDivisor X) [SmoothOfRelativeDimension 0 D.Y.structural]
    (d : ℕ) (hd : 0 < d) (e : H E D.Y 0 0 ≃ₗ[E] (Fin d → E))
    (hGysin : ∀ y, traceMap (Λ := E) 1 ((gysin D.i 1 0 0).hom y) = ∑ a, e y a) :
    Module.finrank E (vanishingSubspace (E := E) D.i 0) = d - 1 := sorry
/-- Test `TauCeti.EtaleDuality.not_vanishing_inf_restricted_eq_bot`: coefficients are F_2; the base has characteristic
 different from 2. The smooth quadric surface in a quadric threefold has Res=Van=< (1,1) >. -/
example [CharP E 2] (hbase : IsUnit (2 : k)) {X : Geo k}
    [SmoothOfRelativeDimension 3 X.structural] (Q : CompleteIntersectionData X 3)
    (hambient : Q.N = 4) (hdegree : Q.degree = 2) (D : AmpleDivisor X)
    (hL : D.L = Q.polarization) (hr : D.r = 1)
    [SmoothOfRelativeDimension 2 D.Y.structural] :
    ∃ e : H E D.Y 2 0 ≃ₗ[E] (Fin 2 → E),
      (restrictedSubspace (E := E) D.i 2).map e.toLinearMap =
        Submodule.span E {fun _ : Fin 2 => (1 : E)} ∧
      (vanishingSubspace (E := E) D.i 2).map e.toLinearMap =
        Submodule.span E {fun _ : Fin 2 => (1 : E)} ∧
      restrictedSubspace (E := E) D.i 2 = vanishingSubspace D.i 2 ∧
      restrictedSubspace (E := E) D.i 2 ⊓ vanishingSubspace D.i 2 ≠ ⊥ := sorry
end Vanishing

section SupportedSplittings
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ] [PerfectField k]
/-- Cohomology with supports in a closed subset (EtaleCohomologyFoundations §0.7). -/
def supportedCohomology {X : Geo k} (T : Set X.space) (q : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
inductive CohomologyFlavor (X : Geo k)
  | ordinary | compact | closedSupport (T : Set X.space) (closed : IsClosed T)
def flavorCohomology {X : Geo k} (s : CohomologyFlavor X) (q : ℤ) : ModuleCat.{u} Λ :=
  match s with
  | .ordinary => H Λ X q 0
  | .compact => compactCohomology q (constant X)
  | .closedSupport T _ => supportedCohomology T q (constant X)
def pullbackFlavor {X' X : Geo k} (σ : X' ⟶ X) (s : CohomologyFlavor X) : CohomologyFlavor X' :=
  match s with
  | .ordinary => .ordinary
  | .compact => .compact
  | .closedSupport T h => .closedSupport (σ.hom.left.base ⁻¹' T) (by sorry)
def flavorRestriction {X' X : Geo k} (σ : X' ⟶ X) [IsProper σ.hom.left]
    (s : CohomologyFlavor X) (q : ℤ) :
    flavorCohomology (Λ := Λ) s q ⟶ flavorCohomology (pullbackFlavor σ s) q := sorry
/-- Explicit alternatives: a projective bundle or a blow-up of a smooth pair. -/
def IsSupportedModification {X' X : Geo k} (σ : X' ⟶ X) : Prop :=
  (∃ (V : VectorBundle X) (r : ℕ), 1 ≤ r ∧ bundleRank V = r + 1 ∧
    ∃ e : X' ≅ projectiveBundle V, σ = e.hom ≫ bundleProjection V) ∨
  (∃ (Z : Geo k) (i : Z ⟶ X) (d c : ℕ), IsClosedImmersion i.hom.left ∧ 2 ≤ c ∧ c ≤ d ∧
    SmoothOfRelativeDimension d X.structural ∧ SmoothOfRelativeDimension (d - c) Z.structural ∧
    ∃ e : X' ≅ blowup i, σ = e.hom ≫ blowupProjection i)
/-- EDC.4/pullback-injective-blowup-bundle, in all three support theories. -/
theorem pullback_injective_blowup_bundle {X' X : Geo k} (σ : X' ⟶ X)
    [IsProper σ.hom.left] (hσ : IsSupportedModification σ) (s : CohomologyFlavor X) (q : ℤ) :
    ∃ r : flavorCohomology (Λ := Λ) (pullbackFlavor σ s) q ⟶ flavorCohomology s q,
      flavorRestriction σ s q ≫ r = 𝟙 _ := sorry
lemma bundle_rank_two_cokernel {X : Geo k} (V : VectorBundle X) (hr : bundleRank V = 2)
    [IsProper (bundleProjection V).hom.left] (q : ℤ) :
    Nonempty ((cokernel (flavorRestriction (Λ := Λ) (bundleProjection V) .ordinary q)) ≅ H Λ X (q - 2) (-1)) := sorry
def flavorTwistedCohomology {X : Geo k} (s : CohomologyFlavor X) (q t : ℤ) : ModuleCat.{u} Λ :=
  match s with
  | .ordinary => H Λ X q t
  | .compact => compactCohomology q ((twist X t).obj (constant X))
  | .closedSupport T _ => supportedCohomology T q ((twist X t).obj (constant X))
/-- The projective retraction is pi_*(xi^r cup -), in the chosen support theory. -/
def flavorBundleRetraction {X : Geo k} (V : VectorBundle X) (r : ℕ)
    (s : CohomologyFlavor X) (q : ℤ) :
    flavorCohomology (Λ := Λ) (pullbackFlavor (bundleProjection V) s) q ⟶ flavorCohomology s q := sorry
/-- The blow-up retraction is the degree-one proper trace pi_*. -/
def flavorBlowupRetraction {Z X : Geo k} (i : Z ⟶ X) (s : CohomologyFlavor X) (q : ℤ) :
    flavorCohomology (Λ := Λ) (pullbackFlavor (blowupProjection i) s) q ⟶ flavorCohomology s q := sorry
lemma bundle_supported_retraction {X : Geo k} (V : VectorBundle X) (r : ℕ) (hr : bundleRank V = r + 1)
    [IsProper (bundleProjection V).hom.left] (s : CohomologyFlavor X) (q : ℤ) :
    flavorRestriction (Λ := Λ) (bundleProjection V) s q ≫ flavorBundleRetraction V r s q = 𝟙 _ := sorry
lemma blowup_supported_retraction {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    [IsProper (blowupProjection i).hom.left] (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d)
    [SmoothOfRelativeDimension d X.structural] [SmoothOfRelativeDimension (d - c) Z.structural]
    (s : CohomologyFlavor X) (q : ℤ) :
    flavorRestriction (Λ := Λ) (blowupProjection i) s q ≫ flavorBlowupRetraction i s q = 𝟙 _ := sorry
lemma bundle_supported_cokernel {X : Geo k} (V : VectorBundle X) (r : ℕ) (hr : bundleRank V = r + 1)
    [IsProper (bundleProjection V).hom.left] (s : CohomologyFlavor X) (q : ℤ) :
    Nonempty ((cokernel (flavorRestriction (Λ := Λ) (bundleProjection V) s q)) ≅
      ⨁ (fun a : Fin r => flavorTwistedCohomology s (q - 2 * (a + 1)) (-(a + 1 : ℤ)))) := sorry
lemma blowup_supported_cokernel {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    [IsProper (blowupProjection i).hom.left] (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d)
    [SmoothOfRelativeDimension d X.structural] [SmoothOfRelativeDimension (d - c) Z.structural]
    (s : CohomologyFlavor X) (q : ℤ) :
    Nonempty ((cokernel (flavorRestriction (Λ := Λ) (blowupProjection i) s q)) ≅
      ⨁ (fun a : Fin (c - 1) => flavorTwistedCohomology (pullbackFlavor i s)
        (q - 2 * (a + 1)) (-(a + 1 : ℤ)))) := sorry
lemma supported_modification_low_degrees {X' X : Geo k} (σ : X' ⟶ X)
    [IsProper σ.hom.left] (hσ : IsSupportedModification σ) (s : CohomologyFlavor X)
    (q : ℤ) (hq : q < 2) : IsIso (flavorRestriction (Λ := Λ) σ s q) := sorry
end SupportedSplittings

/-! EDC.6: bounded, stratified integral systems and qualified comparison functors. -/
section AdicComparison
variable {O : Type u} [CommRing O] [D : IntegralDatum (k := k) O]
abbrev levelRing (n : ℕ) := O ⧸ Ideal.span {D.uniformizer ^ (n + 1)}
instance levelRing_boundedDuality (n : ℕ) :
    BoundedDualityCoefficients (k := k) (levelRing (k := k) (O := O) n) := sorry
/-- BBD 4.3.1 with the finite uniformizer filtration also gives finite length for
DVR-quotient coefficients; the free integral category is deliberately excluded. -/
lemma perverseSheaf_quotient_finite_length (n : ℕ)
    [PerverseContext (k := k) (levelRing (k := k) (O := O) n)]
    {X : Geo k} (P : PerverseSheaf (levelRing (k := k) (O := O) n) X) :
    IsArtinianObject P ∧ IsNoetherianObject P := sorry
/-- Finite-level derived coefficient reduction (EnhancedDerivedSheaves §0.4), including its canonical associator. -/
def levelReduction (X : Geo k) (n m : ℕ) (h : m ≤ n) :
    CoefficientDerived (levelRing (k := k) (O := O) n) X ⥤
      CoefficientDerived (levelRing (k := k) (O := O) m) X := sorry
def levelReductionComp (X : Geo k) (n m l : ℕ) (h : m ≤ n) (h' : l ≤ m) :
    levelReduction (O := O) X n m h ⋙ levelReduction X m l h' ≅
    levelReduction X n l (h'.trans h) := sorry
def levelReductionSelf (X : Geo k) (n : ℕ) : levelReduction (O := O) X n n le_rfl ≅ 𝟭 _ := sorry
structure AdicSystem (X : Geo k) where
  obj : (n : ℕ) → Dbc (levelRing (k := k) (O := O) n) X
  reduce : ∀ n m (h : m ≤ n), (levelReduction X n m h).obj ((coefficientRealization X).obj (obj n)) ≅
    (coefficientRealization X).obj (obj m)
  identity : ∀ n, (reduce n n le_rfl).hom = (levelReductionSelf X n).hom.app ((coefficientRealization X).obj (obj n))
  coherence : ∀ n m l (h : m ≤ n) (h' : l ≤ m),
    (levelReduction X m l h').map (reduce n m h).hom ≫ (reduce m l h').hom =
      (levelReductionComp X n m l h h').hom.app ((coefficientRealization X).obj (obj n)) ≫ (reduce n l (h'.trans h)).hom
/-- The same finite stratification and both ordinary and Tor bounds work at every level. -/
def AdicSystem.IsNormalized {X : Geo k} (K : AdicSystem (O := O) X) : Prop :=
  ∃ (a b c d : ℤ) (T : AlgebraicStratification X),
    (∀ n, (standardTStructure _ X).IsGE (K.obj n) a ∧
      (standardTStructure _ X).IsLE (K.obj n) b) ∧
    (∀ n (M : CoefficientDerived (levelRing (k := k) (O := O) n) X),
      (ambientStandardT _ X).heart M →
      (ambientStandardT _ X).IsGE (derivedTensor ((coefficientRealization X).obj (K.obj n)) M) c ∧
      (ambientStandardT _ X).IsLE (derivedTensor ((coefficientRealization X).obj (K.obj n)) M) d) ∧
    ∀ n i s, ∃ L : Lisse (levelRing (k := k) (O := O) n) (T.strata s),
      Nonempty ((pullback (T.inclusion s)).obj (ordinaryCohomologyObject i (K.obj n)) ≅ lisseComplex.obj L)
/-- Morphisms are coherent levelwise maps; EtaleCohomologyFoundations §F.4.1 supplies their category structure for O = ℤ_ℓ. -/
instance (X : Geo k) : Category.{u} (AdicSystem (O := O) X) := sorry
abbrev NormalizedSystem (X : Geo k) := ObjectProperty.FullSubcategory
  (AdicSystem.IsNormalized (k := k) (O := O) (X := X))
/-- Bhatt–Scholze's constructible pro-étale carrier, compared with the classical realization in EtaleCohomologyFoundations §F.4.3. -/
def ProetaleCons (O : Type u) [CommRing O] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (ProetaleCons O X) := sorry
def classical_proetale_equivalence (X : Geo k) : Dbc O X ≌ ProetaleCons O X := sorry
def normalized_system_equivalence (X : Geo k) : Dbc O X ≌ NormalizedSystem (O := O) X := sorry
def ambientIntegralReduction (X : Geo k) (n : ℕ) :
    CoefficientDerived O X ⥤ CoefficientDerived (levelRing (k := k) (O := O) n) X := sorry
/-- O has global dimension one: this restriction is bounded, unlike quotient-to-quotient reduction. -/
def integralReduction (X : Geo k) (n : ℕ) : Dbc O X ⥤ Dbc (levelRing (k := k) (O := O) n) X := sorry
lemma integralReduction_realization (X : Geo k) (n : ℕ) :
    Nonempty (integralReduction (O := O) X n ⋙ coefficientRealization X ≅
      coefficientRealization X ⋙ ambientIntegralReduction X n) := sorry
lemma normalized_system_reduction (X : Geo k) (K : Dbc O X) (n : ℕ) :
    Nonempty ((((normalized_system_equivalence (O := O) X).functor.obj K).obj.obj n) ≅
      (integralReduction X n).obj K) := sorry
lemma normalized_system_uniform_bounds {X : Geo k} (K : NormalizedSystem (O := O) X) :
    ∃ a b : ℤ, ∀ n, (standardTStructure _ X).IsGE (K.obj.obj n) a ∧
      (standardTStructure _ X).IsLE (K.obj.obj n) b := sorry
lemma normalized_system_finiteTor {X : Geo k} (K : NormalizedSystem (O := O) X) (n : ℕ) :
    HasFiniteTorAmplitude (K.obj.obj n) := sorry
lemma normalized_system_common_strata {X : Geo k} (K : NormalizedSystem (O := O) X) :
    ∃ T : AlgebraicStratification X, ∀ n i s,
      ∃ L : Lisse (levelRing (k := k) (O := O) n) (T.strata s),
      Nonempty ((pullback (T.inclusion s)).obj (ordinaryCohomologyObject i (K.obj.obj n)) ≅ lisseComplex.obj L) := sorry
/-- Test `TauCeti.EtaleDuality.adic_constant_normalized`: the constant system has uniform ordinary and Tor bounds. -/
example (X : Geo k) :
    (((normalized_system_equivalence (O := O) X).functor.obj (constant X)).obj).IsNormalized := sorry
/-- Test `TauCeti.EtaleDuality.adic_reduction_coherence`: transition identifications compose canonically. -/
example {X : Geo k} (K : NormalizedSystem (O := O) X) (n m l : ℕ) (h : m ≤ n) (h' : l ≤ m) :
    (levelReduction X m l h').map (K.obj.reduce n m h).hom ≫ (K.obj.reduce m l h').hom =
      (levelReductionComp X n m l h h').hom.app ((coefficientRealization X).obj (K.obj.obj n)) ≫
        (K.obj.reduce n l (h'.trans h)).hom := sorry
/-- Test `TauCeti.EtaleDuality.adic_unbounded_shifts_excluded`: coherent reductions alone do not assert boundedness. -/
example {X : Geo k} (K : AdicSystem (O := O) X)
    (h : ∀ a b : ℤ, ∃ n, ¬ ((standardTStructure _ X).IsGE (K.obj n) a ∧
      (standardTStructure _ X).IsLE (K.obj n) b)) : ¬ K.IsNormalized := sorry
/-- Geometric finiteness; no assertion of finite cohomology over an arbitrary arithmetic base. -/
theorem adic_cohomology_finite [IsSepClosed k] {X : Geo k} (K : Dbc O X) (q : ℤ) :
    Module.Finite O (cohomology q K) := sorry
/-- Full integral universal-coefficient sequence, including torsion in the next degree. -/
def reductionTensor {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    ModuleCat.{u} (levelRing (k := k) (O := O) n) := sorry
def reductionTorsion {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    ModuleCat.{u} (levelRing (k := k) (O := O) n) := sorry
lemma reductionTensor_underlying {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    Nonempty (reductionTensor K q n ≅ ModuleCat.of _
      ((cohomology q K) ⧸ (Ideal.span {D.uniformizer ^ (n + 1)} • (⊤ : Submodule O (cohomology q K))))) := sorry
lemma reductionTorsion_underlying {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    Nonempty ((reductionTorsion K q n : Type u) ≃
      {x : cohomology (q + 1) K // D.uniformizer ^ (n + 1) • x = 0}) := sorry
/-- The maps are the reduction and connecting morphisms supplied by the coefficient triangle. -/
def integralUniversalCoefficient {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    ShortComplex (ModuleCat.{u} (levelRing (k := k) (O := O) n)) := sorry
lemma integralUniversalCoefficient_exact [IsSepClosed k] {X : Geo k} (K : Dbc O X) (q : ℤ) (n : ℕ) :
    (integralUniversalCoefficient K q n).ShortExact ∧
    Nonempty ((integralUniversalCoefficient K q n).X₁ ≅ reductionTensor K q n) ∧
    Nonempty ((integralUniversalCoefficient K q n).X₂ ≅
      cohomology q ((integralReduction X n).obj K)) ∧
    Nonempty ((integralUniversalCoefficient K q n).X₃ ≅ reductionTorsion K q n) := sorry
lemma integral_duality_reduction {X : Geo k} (K : Dbc O X) (n : ℕ) :
    Nonempty ((integralReduction X n).obj ((verdierDual X).obj (Opposite.op K)) ≅
      (verdierDual X).obj (Opposite.op ((integralReduction X n).obj K))) := sorry
lemma integral_biduality {X : Geo k} (K : Dbc O X) :
    Nonempty (K ≅ (verdierDual X).obj (Opposite.op ((verdierDual X).obj (Opposite.op K)))) := sorry
end AdicComparison

section CoefficientCompatibility
variable {O : Type u} [CommRing O] [IntegralDatum (k := k) O]
/-- Coefficient-triangle map (EtaleCohomologyFoundations §F.4.4) on twisted constant cohomology, using O → O/λ^(n+1). -/
def integralClassReduction {X : Geo k} (n : ℕ) (q t : ℤ) :
    H O X q t → H (levelRing (k := k) (O := O) n) X q t := sorry
lemma integral_chern_reduction {X : Geo k} (L : LineBundle X) (n : ℕ) :
    integralClassReduction n 2 1 (chernClass (Λ := O) L) =
      chernClass (Λ := levelRing (k := k) (O := O) n) L := sorry
lemma integral_gysin_reduction {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    [PerfectField k] (d c : ℕ) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (hc : c ≤ d)
    (n : ℕ) (q t : ℤ) (a : H O Z q t) :
    integralClassReduction n (q + 2 * c) (t + c) (gysin (Λ := O) i c q t a) =
      gysin (Λ := levelRing (k := k) (O := O) n) i c q t (integralClassReduction n q t a) := sorry
lemma integral_trace_reduction [IsSepClosed k] {X : Geo k} [IsProper X.structural]
    (d : ℕ) [SmoothOfRelativeDimension d X.structural] (n : ℕ) (a : H O X (2 * d) d) :
    Ideal.Quotient.mk _ (traceMap (Λ := O) d a) =
      traceMap (Λ := levelRing (k := k) (O := O) n) d (integralClassReduction n (2 * d) d a) := sorry
end CoefficientCompatibility

section CoefficientExtension
variable {E E' : Type u} [Field E] [Field E'] [Algebra E E'] [FiniteDimensional E E']
  [RationalDatum (k := k) E] [RationalDatum (k := k) E']
  [PerverseContext (k := k) E] [PerverseContext (k := k) E']
/-- Derived extension of scalars (EnhancedDerivedSheaves §0.4), with its usual tensor product realization. -/
abbrev rationalExtend (X : Geo k) := extendCoefficients (algebraMap E E') X
lemma extendCoefficients_tExact (X : Geo k) :
    Functor.IsTExact (rationalExtend (E := E) (E' := E') X) (perverseTStructure E X) (perverseTStructure E' X) := sorry
def extendPerverse (X : Geo k) : PerverseSheaf E X ⥤ PerverseSheaf E' X := sorry
lemma extendCoefficients_intermediateExtension {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (P : PerverseSheaf E U) :
    Nonempty ((extendPerverse (E := E) (E' := E') X).obj ((intermediateExtension j).obj P) ≅
      (intermediateExtension j).obj ((extendPerverse (E := E) (E' := E') U).obj P)) := sorry
lemma extendCoefficients_hom {X : Geo k} (P Q : PerverseSheaf E X) :
    Nonempty (E' ⊗[E] (P ⟶ Q) ≃ₗ[E']
      ((extendPerverse (E := E) (E' := E') X).obj P ⟶ (extendPerverse (E := E) (E' := E') X).obj Q)) := sorry
instance extendPerverse_faithful (X : Geo k) :
    (extendPerverse (E := E) (E' := E') X).Faithful := sorry
def extendLisse {X : Geo k} : Lisse E X ⥤ Lisse E' X := sorry
lemma extendCoefficients_intersectionComplex {U X : Geo k} (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base) (d : ℕ)
    [SmoothOfRelativeDimension d U.structural] (L : Lisse E U) :
    Nonempty ((extendPerverse (E := E) (E' := E') X).obj (intersectionComplex j hj d L) ≅
      intersectionComplex j hj d ((extendLisse (E' := E')).obj L)) := sorry
/-- Test `TauCeti.EtaleDuality.coefficient_extension_reflects_zero_morphism`. -/
example {X : Geo k} (P Q : PerverseSheaf E X) (f : P ⟶ Q)
    (h : (extendPerverse (E := E) (E' := E') X).map f = 0) : f = 0 := sorry
/-- Test `TauCeti.EtaleDuality.coefficient_extension_point_rank`: rank is preserved, including a quadratic extension. -/
example [IsSepClosed k] (P : PerverseSheaf E (basePoint k)) :
    Module.finrank E (((perversePointEquiv (Λ := E)).functor.obj P).obj) =
      Module.finrank E' (((perversePointEquiv (Λ := E')).functor.obj
        ((extendPerverse (E := E) (E' := E') _).obj P)).obj) := sorry
/-- Test `TauCeti.EtaleDuality.coefficient_extension_zero_object`. -/
example {X : Geo k} (P : PerverseSheaf E X) (h : IsZero P) :
    IsZero ((extendPerverse (E := E) (E' := E') X).obj P) := sorry
end CoefficientExtension

/-! Analytic constructibility is for algebraic stratifications. It is a separate category;
complex coefficients are not misrepresented as a finite extension of Q_ell. -/
abbrev ComplexBase := ULift.{u} ℂ
/-- Classical analytification, supplied by the analytic comparison owner. -/
def analytification (X : Geo ComplexBase) : TopCat.{u} := sorry
abbrev AnalyticDerived (Λ : Type u) [CommRing Λ] (X : Geo ComplexBase) :=
  DerivedCategory (Sheaf (Opens.grothendieckTopology (analytification X)) (ModuleCat.{u} Λ))
section AnalyticComparison
variable {Λ : Type u} [CommRing Λ]
def AnalyticDbc (Λ : Type u) [CommRing Λ] (X : Geo ComplexBase) : Type (u + 1) := sorry
instance (X : Geo ComplexBase) : Category.{u} (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : Preadditive (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : HasZeroObject (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : Linear Λ (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : HasFiniteBiproducts (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : HasShift (AnalyticDbc Λ X) ℤ := sorry
instance (X : Geo ComplexBase) (n : ℤ) : (shiftFunctor (AnalyticDbc Λ X) n).Additive := sorry
instance (X : Geo ComplexBase) : Pretriangulated (AnalyticDbc Λ X) := sorry
instance (X : Geo ComplexBase) : IsTriangulated (AnalyticDbc Λ X) := sorry
def analyticPerverseT (Λ : Type u) [CommRing Λ] (X : Geo ComplexBase) : TStructure (AnalyticDbc Λ X) := sorry
abbrev AnalyticPerv (Λ : Type u) [CommRing Λ] (X : Geo ComplexBase) :=
  (analyticPerverseT Λ X).heart.FullSubcategory
def analyticConstant (X : Geo ComplexBase) : AnalyticDbc Λ X := sorry
def analyticPullback {X Y : Geo ComplexBase} (f : X ⟶ Y) : AnalyticDbc Λ Y ⥤ AnalyticDbc Λ X := sorry
def analyticPushforward {X Y : Geo ComplexBase} (f : X ⟶ Y) : AnalyticDbc Λ X ⥤ AnalyticDbc Λ Y := sorry
def analyticLowerShriek {X Y : Geo ComplexBase} (f : X ⟶ Y) : AnalyticDbc Λ X ⥤ AnalyticDbc Λ Y := sorry
def analyticUpperShriek {X Y : Geo ComplexBase} (f : X ⟶ Y) : AnalyticDbc Λ Y ⥤ AnalyticDbc Λ X := sorry
def analyticRealization (X : Geo ComplexBase) : AnalyticDbc Λ X ⥤ AnalyticDerived Λ X := sorry
def analyticTensor {X : Geo ComplexBase} : AnalyticDerived Λ X → AnalyticDerived Λ X → AnalyticDerived Λ X := sorry
def analyticRHom {X : Geo ComplexBase} : AnalyticDerived Λ X → AnalyticDerived Λ X → AnalyticDerived Λ X := sorry
def AnalyticBoundedConstructible {X : Geo ComplexBase} (K : AnalyticDerived Λ X) : Prop :=
  ∃ L : AnalyticDbc Λ X, Nonempty ((analyticRealization X).obj L ≅ K)
def analyticBoundedRestriction {X : Geo ComplexBase} (K : AnalyticDerived Λ X)
    (h : AnalyticBoundedConstructible K) : AnalyticDbc Λ X := h.choose
def analyticBoundedRestrictionIso {X : Geo ComplexBase} (K : AnalyticDerived Λ X)
    (h : AnalyticBoundedConstructible K) :
    (analyticRealization X).obj (analyticBoundedRestriction K h) ≅ K := h.choose_spec.some
lemma analytic_tensor_field_bounded [Field Λ] {X : Geo ComplexBase} (K L : AnalyticDbc Λ X) :
    AnalyticBoundedConstructible (analyticTensor ((analyticRealization X).obj K) ((analyticRealization X).obj L)) := sorry
lemma analytic_RHom_field_bounded [Field Λ] {X : Geo ComplexBase} (K L : AnalyticDbc Λ X) :
    AnalyticBoundedConstructible (analyticRHom ((analyticRealization X).obj K) ((analyticRealization X).obj L)) := sorry
def analyticBoundedTensor [Field Λ] {X : Geo ComplexBase} (K L : AnalyticDbc Λ X) : AnalyticDbc Λ X :=
  analyticBoundedRestriction _ (analytic_tensor_field_bounded K L)
def analyticBoundedRHom [Field Λ] {X : Geo ComplexBase} (K L : AnalyticDbc Λ X) : AnalyticDbc Λ X :=
  analyticBoundedRestriction _ (analytic_RHom_field_bounded K L)
def analyticCohomology {X : Geo ComplexBase} (q : ℤ) (K : AnalyticDbc Λ X) : ModuleCat.{u} Λ := sorry
def analyticCompactCohomology {X : Geo ComplexBase} (q : ℤ) (K : AnalyticDbc Λ X) : ModuleCat.{u} Λ := sorry
def analyticComparison (X : Geo ComplexBase) : Dbc Λ X ⥤ AnalyticDbc Λ X := sorry
def ambientAnalyticComparison (X : Geo ComplexBase) : CoefficientDerived Λ X ⥤ AnalyticDerived Λ X := sorry
lemma analyticComparison_realization (X : Geo ComplexBase) :
    Nonempty (analyticComparison (Λ := Λ) X ⋙ analyticRealization X ≅
      coefficientRealization X ⋙ ambientAnalyticComparison X) := sorry
/-- SGA 4 XVI 4.1 / BBD 6.1.2(A'),(B'): finite coefficients. -/
def finite_analytic_equivalence [Finite Λ] (X : Geo ComplexBase) : Dbc Λ X ≌ AnalyticDbc Λ X := sorry
lemma finite_analytic_equivalence_functor [Finite Λ] (X : Geo ComplexBase) :
    Nonempty ((finite_analytic_equivalence (Λ := Λ) X).functor ≅ analyticComparison X) := sorry
lemma analytic_comparison_tExact [PerverseContext (k := ComplexBase) Λ] (X : Geo ComplexBase) :
    Functor.IsTExact (analyticComparison X) (perverseTStructure Λ X) (analyticPerverseT Λ X) := sorry
lemma analytic_pushforward_comparison [Coefficients (k := ComplexBase) Λ] {X Y : Geo ComplexBase} (f : X ⟶ Y) :
    Nonempty (pushforward (Λ := Λ) f ⋙ analyticComparison Y ≅ analyticComparison X ⋙ analyticPushforward f) := sorry
lemma analytic_pullback_comparison [Coefficients (k := ComplexBase) Λ] {X Y : Geo ComplexBase} (f : X ⟶ Y) :
    Nonempty (pullback (Λ := Λ) f ⋙ analyticComparison X ≅ analyticComparison Y ⋙ analyticPullback f) := sorry
def integral_analytic_equivalence [IntegralDatum (k := ComplexBase) Λ]
    (X : Geo ComplexBase) : Dbc Λ X ≌ AnalyticDbc Λ X := sorry
lemma integral_analytic_equivalence_functor [IntegralDatum (k := ComplexBase) Λ]
    (X : Geo ComplexBase) :
    Nonempty ((integral_analytic_equivalence (Λ := Λ) X).functor ≅ analyticComparison X) := sorry
lemma analytic_lowerShriek_comparison [Coefficients (k := ComplexBase) Λ]
    {X Y : Geo ComplexBase} (f : X ⟶ Y) :
    Nonempty (lowerShriek (Λ := Λ) f ⋙ analyticComparison Y ≅ analyticComparison X ⋙ analyticLowerShriek f) := sorry
lemma analytic_upperShriek_comparison [Coefficients (k := ComplexBase) Λ]
    {X Y : Geo ComplexBase} (f : X ⟶ Y) :
    Nonempty (upperShriek (Λ := Λ) f ⋙ analyticComparison X ≅ analyticComparison Y ⋙ analyticUpperShriek f) := sorry
lemma analytic_tensor_comparison [Coefficients (k := ComplexBase) Λ]
    {X : Geo ComplexBase} (K L : Dbc Λ X) (hK : HasFiniteTorAmplitude K) :
    Nonempty ((ambientAnalyticComparison X).obj
      (derivedTensor ((coefficientRealization X).obj K) ((coefficientRealization X).obj L)) ≅
      analyticTensor ((analyticRealization X).obj ((analyticComparison X).obj K))
        ((analyticRealization X).obj ((analyticComparison X).obj L))) := sorry
lemma analytic_RHom_comparison [Coefficients (k := ComplexBase) Λ]
    {X : Geo ComplexBase} (K L : Dbc Λ X) (hK : HasFiniteTorAmplitude K) :
    Nonempty ((ambientAnalyticComparison X).obj
      (derivedInternalHom ((coefficientRealization X).obj K) ((coefficientRealization X).obj L)) ≅
      analyticRHom ((analyticRealization X).obj ((analyticComparison X).obj K))
        ((analyticRealization X).obj ((analyticComparison X).obj L))) := sorry
/-- A rational analytic local system is algebraic étale only when its monodromy preserves a lattice. -/
def analyticFundamentalGroup (X : Geo ComplexBase) : Type u := sorry
instance (X : Geo ComplexBase) : Group (analyticFundamentalGroup X) := sorry
def analyticCohomologyFiber {E : Type u} [Field E] {X : Geo ComplexBase}
    (K : AnalyticDbc E X) (q : ℤ) : ModuleCat.{u} E := sorry
def analyticMonodromy {E : Type u} [Field E] {X : Geo ComplexBase}
    (K : AnalyticDbc E X) (q : ℤ) :
    analyticFundamentalGroup.{u, u} X →* (analyticCohomologyFiber K q ≃ₗ[E] analyticCohomologyFiber K q) := sorry
def HasStableLattice {O E : Type u} [CommRing O] [Field E] [Algebra O E]
    {X : Geo ComplexBase} (K : AnalyticDbc E X) (q : ℤ) : Prop :=
  letI : Module O (analyticCohomologyFiber K q) := Module.compHom _ (algebraMap O E)
  ∃ M : Submodule O (analyticCohomologyFiber K q), Module.Finite O M ∧
    Submodule.span E (M : Set (analyticCohomologyFiber K q)) = ⊤ ∧
    ∀ (g : analyticFundamentalGroup.{u, u} X) v, v ∈ M → analyticMonodromy K q g v ∈ M
def analyticOrdinarySheaf {E : Type u} [Field E] {X : Geo ComplexBase}
    (K : AnalyticDbc E X) (q : ℤ) : Sheaf (Opens.grothendieckTopology (analytification X)) (ModuleCat.{u} E) := sorry
/-- Local constancy uses the actual analytic sheaf, not pointwise equal fibre dimensions. -/
def analyticSheafRestriction {E : Type u} [Field E] {X : TopCat.{u}}
    (F : Sheaf (Opens.grothendieckTopology X) (ModuleCat.{u} E)) (U : Opens X) :
    Sheaf (Opens.grothendieckTopology (TopCat.of U)) (ModuleCat.{u} E) := sorry
def analyticConstantSheaf (E : Type u) [Field E] (U : TopCat.{u}) (M : ModuleCat.{u} E) :
    Sheaf (Opens.grothendieckTopology U) (ModuleCat.{u} E) := sorry
def AnalyticallyLisse {E : Type u} [Field E] {X : Geo ComplexBase}
    (K : AnalyticDbc E X) (q : ℤ) : Prop :=
  ∀ x : analytification X, ∃ (U : Opens (analytification X)) (M : ModuleCat.{u} E),
    x ∈ U ∧ Module.Finite E M ∧ Nonempty (analyticSheafRestriction (analyticOrdinarySheaf K q) U ≅
      analyticConstantSheaf E (TopCat.of U) M)
def HasAlgebraicStableLattices {O E : Type u} [CommRing O] [Field E] [Algebra O E]
    {X : Geo ComplexBase} (K : AnalyticDbc E X) : Prop :=
  ∃ T : AlgebraicStratification X, ∀ s q,
    AnalyticallyLisse ((analyticPullback (T.inclusion s)).obj K) q ∧
      HasStableLattice (O := O) ((analyticPullback (T.inclusion s)).obj K) q
lemma rational_analytic_fullyFaithful {E : Type u} [Field E]
    [RationalDatum (k := ComplexBase) E] (X : Geo ComplexBase) : (analyticComparison (Λ := E) X).Full ∧
      (analyticComparison (Λ := E) X).Faithful := sorry
lemma rational_analytic_essentialImage {O : Type u} [CommRing O]
    [IntegralDatum (k := ComplexBase) O] {X : Geo ComplexBase}
    (K : AnalyticDbc (FractionRing O) X) :
    (∃ L : Dbc (FractionRing O) X, Nonempty ((analyticComparison X).obj L ≅ K)) ↔
      HasAlgebraicStableLattices (O := O) K := sorry
/-- Test `TauCeti.EtaleDuality.analytic_monodromy_nonunit`: multiplication by λ on a rank-one system on C× has no lattice. -/
example {O : Type u} [CommRing O] [D : IntegralDatum (k := ComplexBase) O]
    {X : Geo ComplexBase} (K : AnalyticDbc (FractionRing O) X)
    (g : analyticFundamentalGroup X) (e : analyticCohomologyFiber K 0 ≃ₗ[FractionRing O] FractionRing O)
    (h : ∀ v, e (analyticMonodromy K 0 g v) = algebraMap O (FractionRing O) D.uniformizer * e v) :
    ¬ HasStableLattice (O := O) K 0 := sorry
/-- Orientation data are supplied by algebraic topology: exp(2πi/n) maps to +1. -/
def analyticIntegration {X : Geo ComplexBase} (d : ℕ) :
    analyticCompactCohomology (2 * d) (analyticConstant (Λ := Λ) X) ⟶ ModuleCat.of Λ Λ := sorry
def comparisonCompactTwisted {X : Geo ComplexBase} (d : ℕ) :
    compactCohomology (2 * d) ((twist X d).obj (constant (Λ := Λ) X)) ⟶
      analyticCompactCohomology (2 * d) (analyticConstant (Λ := Λ) X) := sorry
def etaleIntegration {X : Geo ComplexBase} (d : ℕ) :
    compactCohomology (2 * d) ((twist X d).obj (constant (Λ := Λ) X)) ⟶ ModuleCat.of Λ Λ := sorry
theorem trace_orientation_comparison [Coefficients (k := ComplexBase) Λ]
    {X : Geo ComplexBase} (d : ℕ) [SmoothOfRelativeDimension d X.structural] :
    comparisonCompactTwisted (Λ := Λ) (X := X) d ≫ analyticIntegration (X := X) d = etaleIntegration (Λ := Λ) (X := X) d := sorry
/-- AlgebraicTopology/SF.2 use exp(2πi/n) ↦ +1 to trivialize all Tate factors. -/
def classComparison {X : Geo ComplexBase} (q t : ℤ) :
    H Λ X q t ⟶ analyticCohomology q (analyticConstant (Λ := Λ) X) := sorry
def analyticFirstChern {X : Geo ComplexBase} (L : LineBundle X) :
    analyticCohomology 2 (analyticConstant (Λ := Λ) X) := sorry
def analyticGysin {Z X : Geo ComplexBase} (i : Z ⟶ X) (c : ℕ) (q : ℤ) :
    analyticCohomology q (analyticConstant (Λ := Λ) Z) ⟶
      analyticCohomology (q + 2 * c) (analyticConstant (Λ := Λ) X) := sorry
lemma chern_orientation_comparison [Coefficients (k := ComplexBase) Λ]
    {X : Geo ComplexBase} (L : LineBundle X) :
    classComparison 2 1 (chernClass (Λ := Λ) L) = analyticFirstChern L := sorry
lemma gysin_orientation_comparison [Coefficients (k := ComplexBase) Λ]
    {Z X : Geo ComplexBase} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (hc : c ≤ d) (q t : ℤ)
    (a : H Λ Z q t) :
    classComparison (q + 2 * c) (t + c) (gysin (Λ := Λ) i c q t a) =
      analyticGysin i c q (classComparison q t a) := sorry
def properAnalyticCohomology {X : Geo ComplexBase} [IsProper X.structural]
    (q : ℤ) (K : AnalyticDbc Λ X) : analyticCohomology q K ≅ analyticCompactCohomology q K := sorry
/-- Test `TauCeti.EtaleDuality.orientation_projective_line_positive`: c1(O(1)) integrates to +1. -/
example [Coefficients (k := ComplexBase) Λ]
    [IsProper (projectiveSpace ComplexBase 1).structural] :
    analyticIntegration 1 ((properAnalyticCohomology 2 _).hom
      (analyticFirstChern (Λ := Λ) (hyperplaneBundle (k := ComplexBase) 1))) = 1 := sorry
end AnalyticComparison

/-! The scheme/diamond categories and c* are imported from AdicCoefficients L2–L6.
The right adjoint lands in the unbounded scheme category, not Dbc. The L4/L6
DVR comparisons and H5 scheme/adic comparisons remain imports in their own
different base categories. The following characteristic-p forms are imported
specializations of the L3 nodes, not a second construction of those comparisons. -/
section DiamondComparison
variable {Λ : Type u} [CommRing Λ]
def DiamondDerived (Λ : Type u) [CommRing Λ] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (DiamondDerived Λ X) := sorry
def diamondPullback (X : Geo k) : SchemeEtaleDerived Λ X ⥤ DiamondDerived Λ X := sorry
def diamondRightAdjoint (X : Geo k) : DiamondDerived Λ X ⥤ SchemeEtaleDerived Λ X := sorry
def diamondAdjunction (X : Geo k) : diamondPullback (Λ := Λ) X ⊣ diamondRightAdjoint X := sorry
def diamondUpperShriek {X Y : Geo k} (f : X ⟶ Y) : DiamondDerived Λ Y ⥤ DiamondDerived Λ X := sorry
def diamondLowerShriek {X Y : Geo k} (f : X ⟶ Y) : DiamondDerived Λ X ⥤ DiamondDerived Λ Y := sorry
/-- Unbounded étale six-operation interfaces (EtaleCohomologyFoundations §§0.8, F.5). -/
def schemeEtaleUpperShriek {X Y : Geo k} (f : X ⟶ Y) : SchemeEtaleDerived Λ Y ⥤ SchemeEtaleDerived Λ X := sorry
/-- Imported L3/27.2 full faithfulness in the unbounded category. -/
lemma scheme_diamond_fullyFaithful (p n : ℕ) [CharP k p] (hp : p.Prime)
    (hn : 0 < n) (hkill : (n : Λ) = 0) (hunit : IsUnit (n : k)) (X : Geo k) :
    (diamondPullback (Λ := Λ) X).Full ∧ (diamondPullback (Λ := Λ) X).Faithful := sorry
/-- Imported L3/27.4 lower-shriek comparison on actual bounded constructible inputs. -/
lemma scheme_diamond_lowerShriek (p n : ℕ) [CharP k p] (hp : p.Prime)
    (hn : 0 < n) (hkill : (n : Λ) = 0) (hunit : IsUnit (n : k))
    {X Y : Geo k} (f : X ⟶ Y) [IsSeparated f.hom.left] [LocallyOfFiniteType f.hom.left] :
    Nonempty (etaleRealization X ⋙ diamondPullback X ⋙ diamondLowerShriek f ≅
      lowerShriek f ⋙ etaleRealization Y ⋙ diamondPullback (Λ := Λ) Y) := sorry
/-- Imported L3/27.4 exceptional-pullback identity with the right adjoints. -/
lemma scheme_diamond_upperShriek_rightAdjoint (p n : ℕ) [CharP k p] (hp : p.Prime)
    (hn : 0 < n) (hkill : (n : Λ) = 0) (hunit : IsUnit (n : k))
    {X Y : Geo k} (f : X ⟶ Y) [IsSeparated f.hom.left] [LocallyOfFiniteType f.hom.left] :
    Nonempty (diamondRightAdjoint Y ⋙ schemeEtaleUpperShriek f ≅
      diamondUpperShriek f ⋙ diamondRightAdjoint (Λ := Λ) X) := sorry
/-- Relative dualizing object a^{diamond !} c_base* Λ; the base is (Spec k)^diamond. -/
def diamondRelativeDualizing (X : Geo k) : DiamondDerived Λ X :=
  (diamondUpperShriek (toBasePoint X)).obj
    ((diamondPullback (basePoint k)).obj ((etaleRealization _).obj (constant _)))
def diamondRelativeRHom {X : Geo k} : DiamondDerived Λ X → DiamondDerived Λ X → DiamondDerived Λ X := sorry
/-- Imported L3/27.3: RHom is recovered through Rc_*, rather than transported by c*. -/
lemma scheme_diamond_RHom_rightAdjoint (p n : ℕ) [CharP k p] (hp : p.Prime)
    (hn : 0 < n) (hkill : (n : Λ) = 0) (hunit : IsUnit (n : k))
    {X : Geo k} (A : SchemeEtaleDerived Λ X) (B : DiamondDerived Λ X) :
    Nonempty ((diamondRightAdjoint X).obj
      (diamondRelativeRHom ((diamondPullback X).obj A) B) ≅
        schemeEtaleRHom A ((diamondRightAdjoint X).obj B)) := sorry
/-- The same relative construction in the native unbounded scheme category. -/
def schemeEtaleDualizing (X : Geo k) : SchemeEtaleDerived Λ X :=
  (schemeEtaleUpperShriek (toBasePoint X)).obj ((etaleRealization _).obj (constant _))
/-- Derived global sections followed by ordinary cohomology (EtaleCohomologyFoundations §F.1). -/
def etaleHypercohomology {X : Geo k} (q : ℤ) (K : SchemeEtaleDerived Λ X) : ModuleCat.{u} Λ := sorry
/-- Global cohomology in the correct finite or adic ambient coefficient category. -/
def coefficientHypercohomology {X : Geo k} (q : ℤ) (K : CoefficientDerived Λ X) : ModuleCat.{u} Λ := sorry
/-- Test `TauCeti.EtaleDuality.nonperfect_point_unbounded_operations`.
The periodic multiplication-by-ell resolution over Z/ell² has residue cohomology
in every Tor and Ext degree. This is an object of Dbc, but it is not finite-Tor. -/
example [IsSepClosed k] (ell : ℕ) (hp : ell.Prime) (hunit : IsUnit (ell : k)) :
    let R := ULift.{u} (ZMod (ell ^ 2))
    let M := R ⧸ Ideal.span {(ell : R)}
    ∃ K : Dbc R (basePoint k),
      Nonempty (cohomology 0 K ≅ ModuleCat.of R M) ∧
      (∀ q : ℤ, q ≠ 0 → IsZero (cohomology q K)) ∧ ¬ HasFiniteTorAmplitude K ∧
      (∀ q : ℕ, Nonempty (coefficientHypercohomology (-(q : ℤ))
        (derivedTensor ((coefficientRealization _).obj K) ((coefficientRealization _).obj K)) ≅ ModuleCat.of R M)) ∧
      (∀ q : ℕ, Nonempty (coefficientHypercohomology (q : ℤ)
        (derivedInternalHom ((coefficientRealization _).obj K) ((coefficientRealization _).obj K)) ≅ ModuleCat.of R M)) := sorry
/-- ECD 27.2–27.4 with n killed in Λ and n prime to p. -/
theorem diamond_transport_of_duality (p n : ℕ) [CharP k p] (hp : p.Prime)
    (hn : 0 < n) (hkill : (n : Λ) = 0) (hunit : IsUnit (n : k))
    {X : Geo k} (K : SchemeEtaleDerived Λ X) :
    Nonempty ((diamondRightAdjoint X).obj (diamondRelativeDualizing (Λ := Λ) X) ≅
      schemeEtaleDualizing X) ∧
    Nonempty ((diamondRightAdjoint X).obj
      (diamondRelativeRHom ((diamondPullback X).obj K)
        (diamondRelativeDualizing X)) ≅
        schemeEtaleRHom K (schemeEtaleDualizing X)) := sorry
end DiamondComparison

section BettiComparison
variable [IsSepClosed k] {E : Type u} [Field E] [RationalDatum (k := k) E]
/-- Ranks are compared through the connected universal smooth complete-intersection family;
this does not choose an identification of cohomology of two unrelated fibres. -/
theorem complete_intersection_betti_comparison {X : Geo k} {XC : Geo ComplexBase}
    (m : ℕ) (hm : 1 ≤ m) [SmoothOfRelativeDimension m X.structural]
    [SmoothOfRelativeDimension m XC.structural] (D : CompleteIntersectionData X m)
    (DC : CompleteIntersectionData XC m) (hN : D.N = DC.N)
    (hdegrees : HEq D.degrees DC.degrees) :
    Module.finrank E (H E X m 0) = Module.finrank ComplexBase
      (analyticCohomology m (analyticConstant (Λ := ComplexBase) XC)) := sorry

/-- The same multidegree fixes every Betti number, without choosing an isomorphism
between unrelated geometric fibres. -/
theorem complete_intersection_betti_all_degrees {X : Geo k} {XC : Geo ComplexBase}
    (m : ℕ) (hm : 1 ≤ m) [SmoothOfRelativeDimension m X.structural]
    [SmoothOfRelativeDimension m XC.structural] (D : CompleteIntersectionData X m)
    (DC : CompleteIntersectionData XC m) (hN : D.N = DC.N)
    (hdegrees : HEq D.degrees DC.degrees) (q : ℤ) :
    Module.finrank E (H E X q 0) = Module.finrank ComplexBase
      (analyticCohomology q (analyticConstant (Λ := ComplexBase) XC)) := sorry
/-- AlgebraicTopology cup product with the topological c1(O(1)), using the positive
Kummer/exponential orientation; no unchosen Lefschetz operator occurs. -/
def analyticChernCup {XC : Geo ComplexBase} (L : LineBundle XC) (q : ℤ) :
    analyticCohomology q (analyticConstant (Λ := ComplexBase) XC) →ₗ[ComplexBase]
      analyticCohomology (q + 2) (analyticConstant (Λ := ComplexBase) XC) := sorry
lemma complete_intersection_primitive_rank {X : Geo k} {XC : Geo ComplexBase}
    (m : ℕ) (hm : 1 ≤ m) [SmoothOfRelativeDimension m X.structural]
    [SmoothOfRelativeDimension m XC.structural] (D : CompleteIntersectionData X m)
    (DC : CompleteIntersectionData XC m) (hN : D.N = DC.N)
    (hdegrees : HEq D.degrees DC.degrees) :
    Module.finrank E (completeIntersectionPrimitive m 0 (chernClass (Λ := E) D.polarization)) =
      Module.finrank ComplexBase (LinearMap.ker (analyticChernCup DC.polarization m)) := sorry


/-- The hypersurface rank target is kept visible; its Euler-characteristic proof input
is the explicit Gauss–Bonnet/topological computation gap in the packet. -/
theorem hypersurface_primitive_rank {X : Geo k} (m d : ℕ) (hm : 1 ≤ m) (hd : 1 ≤ d)
    [SmoothOfRelativeDimension m X.structural] (D : CompleteIntersectionData X m)
    (hN : D.N = m + 1) (hdegree : ∀ a, D.degrees a = d) :
    (Module.finrank E (completeIntersectionPrimitive m 0 (chernClass (Λ := E) D.polarization)) : ℤ) * d =
      ((d : ℤ) - 1) ^ (m + 2) + (-1 : ℤ) ^ m * ((d : ℤ) - 1) := sorry

end BettiComparison

/-! EDC.4 Frobenius weights on the projective-bundle, blow-up and complete-intersection summands. -/
section FrobeniusWeights
variable [Finite k] {E : Type u} [Field E] [CharZero E] [RationalDatum (k := k) E]
/-- Geometric base change along Spec(kbar) → Spec(k) (stand-in, SchemeAndStackFoundations). -/
def geometricBaseChange (X : Geo k) : Geo (AlgebraicClosure k) := sorry
/-- Geometric Frobenius on the actual base change X_0 ×_k kbar (EtaleCohomologyFoundations §§F.10.2–F.10.2b,
`VanishingCycles.frobeniusCohomology`). -/
def geometricFrobenius (X0 : Geo k) (i : ℤ) : H E (geometricBaseChange X0) i 0 ≃ₗ[E]
    H E (geometricBaseChange X0) i 0 := sorry
instance (X0 : Geo k) (i : ℤ) : FiniteDimensional E (H E (geometricBaseChange X0) i 0) := sorry
/-- Off the middle degree, low Chern powers and their high-degree Poincaré duals
give the same q^j scalar, without requiring integral high-degree Chern generators. -/
lemma complete_intersection_frobenius {X0 : Geo k} (m : ℕ) (hm : 1 ≤ m)
    [SmoothOfRelativeDimension m X0.structural] (D : CompleteIntersectionData X0 m)
    (j : ℕ) (hj : j ≤ m) (hmid : 2 * j ≠ m)
    (x : H E (geometricBaseChange X0) (2 * j) 0) :
    geometricFrobenius (E := E) X0 (2 * j) x = (Nat.card k : E) ^ j • x := sorry
/-- Cup/Gysin columns (EtaleCohomologyFoundations §§0.9, F.6) after geometric base change and the chosen Tate trivialization. -/
def untwistedBundleColumn {X0 : Geo k} (V : VectorBundle X0) (j : ℕ) (q : ℤ)
    (eTate : H E (basePoint (AlgebraicClosure k)) 0 j ≃ₗ[E] E) :
    H E (geometricBaseChange X0) (q - 2 * j) 0 →ₗ[E]
      H E (geometricBaseChange (projectiveBundle V)) q 0 := sorry
lemma projective_bundle_frobenius {X0 : Geo k} (V : VectorBundle X0) (j : ℕ) (q : ℤ)
    (eTate : H E (basePoint (AlgebraicClosure k)) 0 j ≃ₗ[E] E)
    (x : H E (geometricBaseChange X0) (q - 2 * j) 0) :
    geometricFrobenius (E := E) (projectiveBundle V) q (untwistedBundleColumn V j q eTate x) =
      (Nat.card k : E) ^ j • untwistedBundleColumn V j q eTate
        (geometricFrobenius X0 (q - 2 * j) x) := sorry
def untwistedBlowupColumn {Z0 X0 : Geo k} (i : Z0 ⟶ X0) (a : ℕ) (q : ℤ)
    (eTate : H E (basePoint (AlgebraicClosure k)) 0 (a + 1) ≃ₗ[E] E) :
    H E (geometricBaseChange Z0) (q - 2 * (a + 1)) 0 →ₗ[E]
      H E (geometricBaseChange (blowup i)) q 0 := sorry
lemma blowup_frobenius {Z0 X0 : Geo k} (i : Z0 ⟶ X0) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X0.structural]
    [SmoothOfRelativeDimension (d - c) Z0.structural] (a : ℕ) (ha : a + 1 < c) (q : ℤ)
    (eTate : H E (basePoint (AlgebraicClosure k)) 0 (a + 1) ≃ₗ[E] E)
    (x : H E (geometricBaseChange Z0) (q - 2 * (a + 1)) 0) :
    geometricFrobenius (E := E) (blowup i) q (untwistedBlowupColumn i a q eTate x) =
      (Nat.card k : E) ^ (a + 1) • untwistedBlowupColumn i a q eTate
        (geometricFrobenius Z0 (q - 2 * (a + 1)) x) := sorry
end FrobeniusWeights

end TauCeti.EtaleDuality
