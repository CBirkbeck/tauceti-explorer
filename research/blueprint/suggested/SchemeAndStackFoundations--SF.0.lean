import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.Data.Nat.Choose.Factorization
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Topology.Compactification.StoneCech
import Mathlib.Algebra.Category.MonCat.Limits
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.PurelyInseparable.Basic
import Mathlib.SetTheory.Cardinal.ENat
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Morphisms.FormallyUnramified
import Mathlib.CategoryTheory.Sites.Equivalence
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.PowerSeries.NoZeroDivisors
import Mathlib.RingTheory.Depth.Rees
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.FieldTheory.PerfectClosure
import Mathlib.RingTheory.Perfection
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.AlgebraicGeometry.Morphisms.UniversallyInjective
import Mathlib.AlgebraicGeometry.Morphisms.UniversallyClosed
import Mathlib.AlgebraicGeometry.Morphisms.FlatRank
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.RingTheory.Etale.Finite
import Mathlib.CategoryTheory.Skeletal
import Mathlib.RingTheory.Ideal.Prod
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Etale.Weakly
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Algebra.Category.Ring.FilteredColimits
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Order.RelSeries
import Mathlib.RingTheory.Localization.Module
import Mathlib.RingTheory.Ideal.AssociatedPrime.Basic
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.RingTheory.KrullDimension.Module
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.RingTheory.Flat.Basic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import Mathlib.AlgebraicGeometry.Sites.SmallAffineZariski
import Mathlib.AlgebraicGeometry.RelativeGluing
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.QuasiSeparated
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.Group.Affine
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Proper
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Functor
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.LinearAlgebra.Projectivization.Basic

/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/SchemeAndStackFoundations--SF.0.md) is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every `sorry` marks planned work; nothing here is implemented, and every declaration of the plan
keeps the status "unchecked". Conditions whose Mathlib vocabulary does not exist yet are left out
and named in comments rather than replaced by placeholder propositions.
Layer: SchemeAndStackFoundations SF.0 (schemes and morphisms), pinned to Tau Ceti f790474 and
Mathlib 082e2d3.
-/

set_option linter.unusedVariables false

/-! ===== Group A ===== -/
open CategoryTheory Limits

universe u

noncomputable section
open scoped TensorProduct

instance : Fact (Nat.Prime 5) := ⟨by decide⟩
instance : Fact (Nat.Prime 3) := ⟨by decide⟩

namespace AlgebraicGeometry.Scheme

/-! ## Quasi-coherent algebras and the relative spectrum -/

variable (S : Scheme.{u})

/-- The structure presheaf restricted to the small affine Zariski site. -/
abbrev affineStructurePresheaf : S.AffineZariskiSiteᵒᵖ ⥤ CommRingCat.{u} :=
  (AffineZariskiSite.toOpensFunctor S).op ⋙ S.presheaf

-- node: SchemeAndStackFoundations:SF.0/qcoh-algebra
/-- Quasi-coherent `𝒪_S`-algebras, presented on the small affine Zariski site as coequifibered
presheaves of rings under the structure presheaf (the input of Mathlib's relative gluing). -/
abbrev QCohAlg : Type (u + 1) :=
  ObjectProperty.FullSubcategory
    (fun A : Under S.affineStructurePresheaf => NatTrans.Coequifibered A.hom)

namespace QCohAlg

variable {S}

/-- The underlying presheaf of rings on the affine site. -/
abbrev presheaf (A : QCohAlg S) : S.AffineZariskiSiteᵒᵖ ⥤ CommRingCat.{u} := A.obj.right

/-- The structure map `𝒪_S → A`. -/
abbrev structureMap (A : QCohAlg S) : S.affineStructurePresheaf ⟶ A.presheaf := A.obj.hom

variable (S) in
/-- The structure presheaf itself, the initial quasi-coherent algebra. -/
def unit : QCohAlg S := sorry

variable (S) in
/-- The zero algebra, the terminal quasi-coherent algebra. -/
def zero : QCohAlg S := sorry

theorem isLocalization_basicOpen (A : QCohAlg S) (U : S.AffineZariskiSite) (f : Γ(S, U.1)) :
    letI := (A.presheaf.map (homOfLE (U.basicOpen_le f)).op).hom.toAlgebra
    IsLocalization.Away (A.structureMap.app (.op U) f)
      (A.presheaf.obj (.op (U.basicOpen f))) := by
  sorry

/-- The quotient of `𝒪_S` by an ideal sheaf datum. -/
def ofIdealSheaf (I : S.IdealSheafData) : QCohAlg S := sorry

/-- The product of two quasi-coherent algebras. -/
def prod (A B : QCohAlg S) : QCohAlg S := sorry

variable (S) in
/-- The polynomial algebra over `𝒪_S` in the variables `n`. -/
def polynomial (n : Type u) : QCohAlg S := sorry

/-- Over an affine base, quasi-coherent algebras are algebras over the global sections. -/
def equivCommAlgCat (R : CommRingCat.{u}) : QCohAlg (Spec R) ≌ CommAlgCat.{u} R := sorry

/-- Restriction to an open subscheme. -/
def restrict (A : QCohAlg S) (U : S.Opens) : QCohAlg U := sorry

/-- The underlying quasi-coherent module. -/
def toModules (A : QCohAlg S) : S.Modules := sorry

theorem toModules_isQuasicoherent (A : QCohAlg S) : A.toModules.IsQuasicoherent := by
  sorry

/-- The unit algebra is initial. -/
def isInitialUnit : Limits.IsInitial (unit S) := sorry

-- test: AlgebraicGeometry.Scheme.QCohAlg.test_zero
example : Limits.IsTerminal (zero S) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.test_polynomial_basicOpen
example (U : (Spec (CommRingCat.of ℤ)).AffineZariskiSite)
    (hU : U.1 = (Spec (CommRingCat.of ℤ)).basicOpen (2 : Γ(Spec (CommRingCat.of ℤ), ⊤))) :
    Nonempty ((polynomial (Spec (CommRingCat.of ℤ)) PUnit).presheaf.obj (.op U) ≃+*
      Polynomial (Localization.Away (2 : ℤ))) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.test_affine_equiv
example (R : CommRingCat.{u}) (B : CommAlgCat.{u} R) :
    Nonempty (((equivCommAlgCat R).inverse.obj B).presheaf.obj (.op ⟨⊤, isAffineOpen_top _⟩) ≅
      CommRingCat.of B) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.test_not_coequifibered
example : ∃ A : Under (Spec (CommRingCat.of ℤ)).affineStructurePresheaf,
    ¬ NatTrans.Coequifibered A.hom := by sorry

end QCohAlg

-- node: SchemeAndStackFoundations:SF.0/qcoh-algebra-sheaf-comparison
/-- Extension of a quasi-coherent algebra to a sheaf of rings under `𝒪_S` on all opens. -/
def QCohAlg.toSheaf : QCohAlg S ⥤ Under S.sheaf := sorry

/-- The underlying quasi-coherent module, as a functor. -/
def QCohAlg.forgetToModules : QCohAlg S ⥤ S.Modules := sorry

instance QCohAlg.toSheaf_full : (QCohAlg.toSheaf S).Full := sorry
instance QCohAlg.toSheaf_faithful : (QCohAlg.toSheaf S).Faithful := sorry
instance QCohAlg.forgetToModules_faithful : (QCohAlg.forgetToModules S).Faithful := sorry

theorem QCohAlg.forgetToModules_isQuasicoherent (A : QCohAlg S) :
    ((QCohAlg.forgetToModules S).obj A).IsQuasicoherent := sorry

-- node: SchemeAndStackFoundations:SF.0/pushforward-algebra
/-- The direct image of the structure sheaf along a quasi-compact quasi-separated morphism. -/
def Hom.pushforwardAlg {S X : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f] [QuasiSeparated f] :
    QCohAlg S := sorry

section Pushforward

variable {S} {X X' Y : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f] [QuasiSeparated f]

theorem Hom.pushforwardAlg_obj (U : S.AffineZariskiSite) :
    f.pushforwardAlg.presheaf.obj (.op U) = Γ(X, f ⁻¹ᵁ U.1) := sorry

/-- An `S`-morphism induces a map of direct images. -/
def Hom.pushforwardAlg_map (f' : X' ⟶ S) [QuasiCompact f'] [QuasiSeparated f']
    (g : X ⟶ X') (_ : g ≫ f' = f) : f'.pushforwardAlg ⟶ f.pushforwardAlg := sorry

/-- The identity pushes forward to the unit algebra. -/
def Hom.pushforwardAlg_id : Hom.pushforwardAlg (𝟙 S) ≅ QCohAlg.unit S := sorry

theorem Hom.pushforwardAlg_comp (f₁ : X ⟶ Y) (g : Y ⟶ S) [QuasiCompact f₁] [QuasiSeparated f₁]
    [IsAffineHom g] (U : S.AffineZariskiSite) :
    (f₁ ≫ g).pushforwardAlg.presheaf.obj (.op U) =
      f₁.pushforwardAlg.presheaf.obj (.op ⟨g ⁻¹ᵁ U.1, U.2.preimage g⟩) := sorry

/-- The integral-closure subalgebra of `f_* 𝒪_X`, from Mathlib's normalization diagram. -/
def Hom.normalizationAlg : QCohAlg S :=
  ⟨Under.mk ((AffineZariskiSite.toOpensFunctor S).op.whiskerLeft f.normalizationDiagramMap),
    f.coequifibered_normalizationDiagramMap⟩

end Pushforward

-- test: AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_id
example : Nonempty (Hom.pushforwardAlg (𝟙 S) ≅ QCohAlg.unit S) := by sorry
-- test: AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_spec
example (R : CommRingCat.{u}) (B : CommAlgCat.{u} R) :
    Nonempty ((Spec.map (CommRingCat.ofHom (algebraMap R B))).pushforwardAlg ≅
      (QCohAlg.equivCommAlgCat R).inverse.obj B) := by sorry
-- test: AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_punctured_plane
example (k : Type u) [Field k] :
    let P := 𝔸(ULift.{u} (Fin 2); Spec (CommRingCat.of k))
    let U : P.Opens := P.basicOpen (AffineSpace.coord _ ⟨0⟩) ⊔ P.basicOpen (AffineSpace.coord _ ⟨1⟩)
    Nonempty (Γ(P, U) ≃+* MvPolynomial (ULift.{u} (Fin 2)) k) ∧ ¬ IsAffineOpen U := by sorry

/-- The relative gluing datum attached to a quasi-coherent algebra. -/
abbrev QCohAlg.gluingData {S : Scheme.{u}} (A : QCohAlg S) :
    (AffineZariskiSite.directedCover S).RelativeGluingData :=
  AffineZariskiSite.relativeGluingData A.property

instance {S : Scheme.{u}} (A : QCohAlg S) : (A.gluingData.functor ⋙ Scheme.forget).IsLocallyDirected :=
  Cover.RelativeGluingData.instIsLocallyDirectedI₀CompFunctorForgetOfIsThin ..

-- node: SchemeAndStackFoundations:SF.0/relative-spec
/-- The relative spectrum `Spec_S(A)`. -/
def relativeSpec {S : Scheme.{u}} (A : QCohAlg S) : Scheme.{u} := A.gluingData.glued

namespace relativeSpec

variable {S}

/-- The structure morphism `π_A : Spec_S(A) → S`. -/
def toBase (A : QCohAlg S) : S.relativeSpec A ⟶ S := A.gluingData.toBase

instance isAffineHom (A : QCohAlg S) : IsAffineHom (toBase A) := sorry

/-- Over an affine open the relative spectrum is the spectrum of the sections. -/
def preimageIso (A : QCohAlg S) (U : S.AffineZariskiSite) :
    (toBase A ⁻¹ᵁ U.1).toScheme ≅ Spec (A.presheaf.obj (.op U)) := sorry

/-- Sections over the preimage of an affine open. -/
def ΓIso (A : QCohAlg S) (U : S.AffineZariskiSite) :
    Γ(S.relativeSpec A, toBase A ⁻¹ᵁ U.1) ≅ A.presheaf.obj (.op U) := sorry

/-- Functoriality of the relative spectrum. -/
def map {A B : QCohAlg S} (φ : A ⟶ B) : S.relativeSpec B ⟶ S.relativeSpec A := sorry

theorem map_toBase {A B : QCohAlg S} (φ : A ⟶ B) : map φ ≫ toBase A = toBase B := sorry

theorem map_id (A : QCohAlg S) : map (𝟙 A) = 𝟙 _ := sorry

theorem map_comp {A B C : QCohAlg S} (φ : A ⟶ B) (ψ : B ⟶ C) :
    map (φ ≫ ψ) = map ψ ≫ map φ := sorry

instance unitIso : IsIso (toBase (QCohAlg.unit S)) := sorry

/-- Over `Spec R` the relative spectrum is Mathlib's `algSpec`. -/
def isoAlgSpec (R : CommRingCat.{u}) (B : CommAlgCat.{u} R) :
    (Spec R).relativeSpec ((QCohAlg.equivCommAlgCat R).inverse.obj B) ≅
      ((algSpec R).obj (Opposite.op B)).left := sorry

/-- The relative spectrum of a product is the disjoint union. -/
def prodIso (A B : QCohAlg S) :
    S.relativeSpec (A.prod B) ≅ S.relativeSpec A ⨿ S.relativeSpec B := sorry

end relativeSpec

/-- Mathlib's relative normalization is a relative spectrum. -/
def Hom.normalization_eq_relativeSpec {X : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f]
    [QuasiSeparated f] : f.normalization ≅ relativeSpec f.normalizationAlg := sorry

-- test: AlgebraicGeometry.Scheme.relativeSpec_test_unit
example : IsIso (relativeSpec.toBase (QCohAlg.unit S)) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeSpec_test_zero
example : IsEmpty (S.relativeSpec (QCohAlg.zero S)) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeSpec_test_affine_line
example : Nonempty (S.relativeSpec (QCohAlg.polynomial S PUnit) ≅ 𝔸(PUnit; S)) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeSpec_test_two_copies
example : Nonempty (S.relativeSpec ((QCohAlg.unit S).prod (QCohAlg.unit S)) ≅ S ⨿ S) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeSpec_test_algSpec
example (R : CommRingCat.{u}) :
    Nonempty ((Spec R).relativeSpec ((QCohAlg.equivCommAlgCat R).inverse.obj
      (CommAlgCat.of R (Polynomial R))) ≅
      ((algSpec R).obj (Opposite.op (CommAlgCat.of R (Polynomial R)))).left) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeSpec_test_flat_not_inherited
example : Flat (relativeSpec.toBase (QCohAlg.unit (Spec (CommRingCat.of (ZMod 2))))) ∧
    ¬ Flat (Spec.map (CommRingCat.ofHom (algebraMap ℤ (ZMod 2)))) := by sorry

/-- The direct image of `𝒪_T` along `h : T → S`, restricted to the affine site, under `𝒪_S`. -/
def directImagePresheaf {T : Scheme.{u}} (h : T ⟶ S) : Under S.affineStructurePresheaf :=
  Under.mk ((AffineZariskiSite.toOpensFunctor S).op.whiskerLeft h.c)

-- node: SchemeAndStackFoundations:SF.0/relative-spec-universal-property
/-- `S`-morphisms into `Spec_S(A)` are algebra maps from `A` to the direct image presheaf. -/
def relativeSpec.homEquiv {T : Scheme.{u}} (h : T ⟶ S) (A : QCohAlg S) :
    {g : T ⟶ S.relativeSpec A // g ≫ relativeSpec.toBase A = h} ≃
      (A.obj ⟶ S.directImagePresheaf h) := sorry

-- node: SchemeAndStackFoundations:SF.0/relative-spec-affine-antiequivalence
/-- Affine morphisms over `S` are exactly relative spectra. -/
theorem relativeSpecEquivAffine {X : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f] [QuasiSeparated f] :
    IsAffineHom f ↔ Nonempty (X ≅ S.relativeSpec f.pushforwardAlg) := by sorry

-- node: SchemeAndStackFoundations:SF.0/qcoh-algebra-pullback
/-- Pullback of a quasi-coherent algebra along a morphism of schemes. -/
def QCohAlg.pullback {S S' : Scheme.{u}} (g : S' ⟶ S) (A : QCohAlg S) : QCohAlg S' := sorry

section Pullback

variable {S} {S' S'' : Scheme.{u}}

/-- Pullback along the identity. -/
def QCohAlg.pullbackId (A : QCohAlg S) : A.pullback (𝟙 S) ≅ A := sorry

/-- Pullback along a composite. -/
def QCohAlg.pullbackComp (h : S'' ⟶ S') (g : S' ⟶ S) (A : QCohAlg S) :
    A.pullback (h ≫ g) ≅ (A.pullback g).pullback h := sorry

/-- Pullback of the unit. -/
def QCohAlg.pullback_unit (g : S' ⟶ S) : (QCohAlg.unit S).pullback g ≅ QCohAlg.unit S' := sorry

/-- The value of a pullback on affines is a tensor product. -/
def QCohAlg.pullback_obj (g : S' ⟶ S) (A : QCohAlg S) (V : S'.AffineZariskiSite)
    (U : S.AffineZariskiSite) (_ : V.1 ≤ g ⁻¹ᵁ U.1) :
    letI : Algebra Γ(S, U.1) (A.presheaf.obj (.op U)) := (A.structureMap.app (.op U)).hom.toAlgebra
    letI : Algebra Γ(S, U.1) Γ(S', V.1) := (g.appLE U.1 V.1 ‹_›).hom.toAlgebra
    (A.pullback g).presheaf.obj (.op V) ≅
      CommRingCat.of (TensorProduct Γ(S, U.1) Γ(S', V.1) (A.presheaf.obj (.op U))) := sorry

theorem QCohAlg.pullback_ofIdealSheaf (g : S' ⟶ S) (I : S.IdealSheafData) :
    Nonempty ((QCohAlg.ofIdealSheaf I).pullback g ≅ QCohAlg.ofIdealSheaf (I.comap g)) := sorry

theorem QCohAlg.pullback_toModules (g : S' ⟶ S) (A : QCohAlg S) :
    Nonempty ((A.pullback g).toModules ≅ (Modules.pullback g).obj A.toModules) := sorry

end Pullback

-- test: AlgebraicGeometry.Scheme.QCohAlg.pullback_test_id
example (A : QCohAlg S) : Nonempty (A.pullback (𝟙 S) ≅ A) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.pullback_test_spec
example (R R' : CommRingCat.{u}) (φ : R ⟶ R') (B : CommAlgCat.{u} R) :
    letI := φ.hom.toAlgebra
    Nonempty (((QCohAlg.equivCommAlgCat R).inverse.obj B).pullback (Spec.map φ) ≅
      (QCohAlg.equivCommAlgCat R').inverse.obj
        (CommAlgCat.of R' (TensorProduct R R' B))) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.pullback_test_residue
example : Nonempty
    (((QCohAlg.equivCommAlgCat (CommRingCat.of ℤ)).inverse.obj
        (CommAlgCat.of ℤ (AdjoinRoot (Polynomial.X ^ 2 - 2 : Polynomial ℤ)))).pullback
        (Spec.map (CommRingCat.ofHom (algebraMap ℤ (ZMod 2)))) ≅
      (QCohAlg.equivCommAlgCat (CommRingCat.of (ZMod 2))).inverse.obj
        (CommAlgCat.of (ZMod 2) (AdjoinRoot (Polynomial.X ^ 2 : Polynomial (ZMod 2))))) := by
  sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.pullback_test_open
example (A : QCohAlg S) (U : S.Opens) : Nonempty (A.pullback U.ι ≅ A.restrict U) := by sorry

-- node: SchemeAndStackFoundations:SF.0/relative-spec-base-change
/-- The relative spectrum commutes with base change. -/
theorem relativeSpec.isPullback_baseChange {S' : Scheme.{u}} (g : S' ⟶ S) (A : QCohAlg S) :
    ∃ g' : S'.relativeSpec (A.pullback g) ⟶ S.relativeSpec A,
      IsPullback g' (relativeSpec.toBase (A.pullback g)) (relativeSpec.toBase A) g := by sorry

-- node: SchemeAndStackFoundations:SF.0/relative-spec-morphism-properties
theorem relativeSpec.isFinite_iff (A : QCohAlg S) :
    IsFinite (relativeSpec.toBase A) ↔ ∀ U : S.AffineZariskiSite,
      (A.structureMap.app (.op U)).hom.Finite := by sorry

theorem relativeSpec.locallyOfFiniteType_iff (A : QCohAlg S) :
    LocallyOfFiniteType (relativeSpec.toBase A) ↔ ∀ U : S.AffineZariskiSite,
      (A.structureMap.app (.op U)).hom.FiniteType := by sorry

theorem relativeSpec.isClosedImmersion_iff (A : QCohAlg S) :
    IsClosedImmersion (relativeSpec.toBase A) ↔ ∀ U : S.AffineZariskiSite,
      Function.Surjective (A.structureMap.app (.op U)) := by sorry

theorem relativeSpec.flat_iff (A : QCohAlg S) :
    Flat (relativeSpec.toBase A) ↔ ∀ U : S.AffineZariskiSite,
      (A.structureMap.app (.op U)).hom.Flat := by sorry

-- node: SchemeAndStackFoundations:SF.0/affine-pushforward-qcoh-equivalence
/-- The presheaf of rings underlying a quasi-coherent algebra. -/
abbrev QCohAlg.ringPresheaf {S : Scheme.{u}} (A : QCohAlg S) : S.AffineZariskiSiteᵒᵖ ⥤ RingCat.{u} :=
  A.presheaf ⋙ forget₂ CommRingCat RingCat

/-- A presheaf of `A`-modules on the affine site is quasi-coherent when restriction to each basic
open `D(f) ⊆ U` is the localization away from the image of `f`. -/
def QCohAlg.IsQCohModule {S : Scheme.{u}} (A : QCohAlg S) (M : _root_.PresheafOfModules.{u} A.ringPresheaf) : Prop :=
  ∀ (U : S.AffineZariskiSite) (f : Γ(S, U.1)),
    IsLocalizedModule (Submonoid.powers (A.structureMap.app (.op U) f))
      (M.map (homOfLE (U.basicOpen_le f)).op).hom

/-- Quasi-coherent modules on `Spec_S(A)` are quasi-coherent `A`-modules on the affine site. -/
def relativeSpec.qcohModulesEquiv {S : Scheme.{u}} (A : QCohAlg S) :
    (SheafOfModules.isQuasicoherent (relativeSpec A).ringCatSheaf).FullSubcategory ≌
      ObjectProperty.FullSubcategory A.IsQCohModule := sorry

/-- The relative spectrum of a quotient by an ideal sheaf is Mathlib's closed subscheme. -/
def relativeSpec.ofIdealSheafIso (I : S.IdealSheafData) :
    S.relativeSpec (QCohAlg.ofIdealSheaf I) ≅ I.subscheme := sorry

end AlgebraicGeometry.Scheme

/-! ## Symmetric algebras, graded algebras and the relative Proj -/

namespace AlgebraicGeometry.Scheme

variable {S : Scheme.{u}}

-- node: SchemeAndStackFoundations:SF.0/symmetric-algebra-sheaf
/-- The symmetric algebra of a quasi-coherent module (given here on the affine site by its values,
which form a module over the restricted structure presheaf). -/
def QCohAlg.sym (E : S.Modules) (_ : E.IsQuasicoherent) : QCohAlg S := sorry

section Sym

variable (E : S.Modules) (hE : E.IsQuasicoherent)

/-- On an affine open, the value of `Sym(E)` is Mathlib's symmetric algebra of the sections. -/
def QCohAlg.sym_obj (U : S.AffineZariskiSite) :
    letI : Algebra Γ(S, U.1) ((QCohAlg.sym E hE).presheaf.obj (.op U)) :=
      ((QCohAlg.sym E hE).structureMap.app (.op U)).hom.toAlgebra
    (QCohAlg.sym E hE).presheaf.obj (.op U) ≅
      letI : Module Γ(S, U.1) (E.val.obj (.op U.1)) :=
        inferInstanceAs (Module (S.ringCatSheaf.obj.obj (.op U.1)) _)
      CommRingCat.of (SymmetricAlgebra Γ(S, U.1) (E.val.obj (.op U.1))) := sorry

/-- The universal property of `Sym(E)`: module maps to the underlying module of `B` extend. -/
def QCohAlg.sym.lift (B : QCohAlg S) (φ : E ⟶ B.toModules) : QCohAlg.sym E hE ⟶ B := sorry

/-- Functoriality of `Sym`. -/
def QCohAlg.sym_map {F : S.Modules} (hF : F.IsQuasicoherent) (φ : E ⟶ F) :
    QCohAlg.sym E hE ⟶ QCohAlg.sym F hF := sorry

theorem QCohAlg.sym_pullback {S' : Scheme.{u}} (g : S' ⟶ S) (hE' : ((Modules.pullback g).obj E).IsQuasicoherent) :
    Nonempty ((QCohAlg.sym E hE).pullback g ≅ QCohAlg.sym ((Modules.pullback g).obj E) hE') := sorry

theorem QCohAlg.sym_free (n : Type u) (hfree : (SheafOfModules.free (R := S.ringCatSheaf) n).IsQuasicoherent) :
    Nonempty (QCohAlg.sym (SheafOfModules.free n) hfree ≅ QCohAlg.polynomial S n) := sorry

end Sym

-- node: SchemeAndStackFoundations:SF.0/graded-qcoh-algebra
/-- An `ℕ`-graded quasi-coherent algebra: gradings of the values on affine opens, preserved by
restriction, with the structure map landing in degree zero. -/
structure GradedQCohAlg (S : Scheme.{u}) where
  /-- The underlying quasi-coherent algebra. -/
  toQCohAlg : QCohAlg S
  /-- The degree pieces on each affine open. -/
  grading : ∀ U : S.AffineZariskiSite, ℕ → AddSubgroup (toQCohAlg.presheaf.obj (.op U))
  /-- Each value is an internally graded ring. -/
  gradedRing : ∀ U, GradedRing (grading U)
  /-- Restrictions preserve degrees. -/
  map_mem : ∀ {U V : S.AffineZariskiSite} (i : U ⟶ V) (d : ℕ) (x),
    x ∈ grading V d → toQCohAlg.presheaf.map i.op x ∈ grading U d
  /-- The structure map lands in degree zero. -/
  structureMap_mem : ∀ U (r : Γ(S, U.1)), toQCohAlg.structureMap.app (.op U) r ∈ grading U 0

attribute [instance] GradedQCohAlg.gradedRing

namespace GradedQCohAlg

/-- The degree-`d` piece as a quasi-coherent module. -/
def piece (A : GradedQCohAlg S) (d : ℕ) : S.Modules := sorry

theorem piece_isQuasicoherent (A : GradedQCohAlg S) (d : ℕ) : (A.piece d).IsQuasicoherent := sorry

/-- The degree-zero part as a quasi-coherent algebra. -/
def degreeZero (A : GradedQCohAlg S) : QCohAlg S := sorry

/-- `Sym(E)` with its symmetric-power grading. -/
def ofSym (E : S.Modules) (hE : E.IsQuasicoherent) : GradedQCohAlg S := sorry

/-- The Rees algebra of an ideal sheaf. -/
def rees (I : S.IdealSheafData) : GradedQCohAlg S := sorry

/-- Pullback of a graded quasi-coherent algebra. -/
def pullback {S' : Scheme.{u}} (g : S' ⟶ S) (A : GradedQCohAlg S) : GradedQCohAlg S' := sorry

/-- The Veronese subalgebra `⊕ₙ A_{nd}`. -/
def veronese (A : GradedQCohAlg S) (d : ℕ) (_ : 0 < d) : GradedQCohAlg S := sorry

/-- Over an affine base, graded quasi-coherent algebras are graded algebras over the ring. -/
def ofGradedAlgebra {R A : Type u} [CommRing R] [CommRing A] [Algebra R A]
    (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜] : GradedQCohAlg (Spec (CommRingCat.of R)) := sorry

variable (S) in
/-- `𝒪_S` concentrated in degree zero. -/
def trivial : GradedQCohAlg S := sorry

variable (S) in
/-- The polynomial algebra `𝒪_S[x_i]` graded by total degree. -/
def polynomial (n : Type u) : GradedQCohAlg S := sorry

-- test: AlgebraicGeometry.Scheme.GradedQCohAlg.test_degree_zero_only
example (U : S.AffineZariskiSite) (d : ℕ) (hd : 0 < d) : (trivial S).grading U d = ⊥ := by sorry
-- test: AlgebraicGeometry.Scheme.GradedQCohAlg.test_polynomial_piece
example : Nonempty (((polynomial S (ULift.{u} (Fin 2))).piece 2) ≅
    SheafOfModules.free (ULift.{u} (Fin 3))) := by sorry
-- test: AlgebraicGeometry.Scheme.GradedQCohAlg.test_affine
example {R A : Type u} [CommRing R] [CommRing A] [Algebra R A] (𝒜 : ℕ → Submodule R A)
    [GradedAlgebra 𝒜] : Nonempty ((ofGradedAlgebra 𝒜).toQCohAlg.presheaf.obj
      (.op ⟨⊤, isAffineOpen_top _⟩) ≅ CommRingCat.of A) := by sorry
-- test: AlgebraicGeometry.Scheme.GradedQCohAlg.test_incompatible
example : ∃ (A : QCohAlg (Spec (CommRingCat.of ℤ)))
    (g : ∀ U : (Spec (CommRingCat.of ℤ)).AffineZariskiSite, ℕ → AddSubgroup (A.presheaf.obj (.op U)))
    (_ : ∀ U, GradedRing (g U)),
    ¬ ∀ {U V} (i : U ⟶ V) d x, x ∈ g V d → A.presheaf.map i.op x ∈ g U d := by
  sorry

end GradedQCohAlg

theorem QCohAlg.sym_grading (E : S.Modules) (hE : E.IsQuasicoherent) :
    Nonempty ((GradedQCohAlg.ofSym E hE).toQCohAlg ≅ QCohAlg.sym E hE) := sorry

-- test: AlgebraicGeometry.Scheme.QCohAlg.sym_test_zero
example (h : (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u+1}).IsQuasicoherent) :
    Nonempty (QCohAlg.sym (SheafOfModules.free (R := S.ringCatSheaf) PEmpty.{u+1}) h ≅ QCohAlg.unit S) := by
  sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.sym_test_rank_one
example (h : (SheafOfModules.unit S.ringCatSheaf).IsQuasicoherent) :
    Nonempty (relativeSpec (QCohAlg.sym (SheafOfModules.unit S.ringCatSheaf) h) ≅ 𝔸(PUnit; S)) := by
  sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.sym_test_torsion
example (h : (tilde (ModuleCat.of (CommRingCat.of ℤ) (ZMod 2))).IsQuasicoherent) :
    Nonempty ((QCohAlg.sym (tilde (ModuleCat.of (CommRingCat.of ℤ) (ZMod 2))) h).presheaf.obj
      (.op ⟨⊤, isAffineOpen_top _⟩) ≃+*
        (Polynomial ℤ ⧸ Ideal.span {(2 : Polynomial ℤ) * Polynomial.X})) := by sorry
-- test: AlgebraicGeometry.Scheme.QCohAlg.sym_test_mathlib
example (R : CommRingCat.{u}) (M : ModuleCat.{u} R) (h : (tilde M).IsQuasicoherent) :
    Nonempty ((QCohAlg.sym (tilde M) h).presheaf.obj (.op ⟨⊤, isAffineOpen_top _⟩) ≃+*
      SymmetricAlgebra R M) := by sorry

end AlgebraicGeometry.Scheme

namespace AlgebraicGeometry.Proj

-- node: SchemeAndStackFoundations:SF.0/proj-base-change
/-- `Proj` of a graded `R`-algebra commutes with base change along `R → R'`. -/
theorem isPullback_baseChange {R R' A : Type u} [CommRing R] [CommRing R'] [CommRing A]
    [Algebra R A] [Algebra R R'] (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜]
    [GradedAlgebra (fun d => (𝒜 d).baseChange R')] :
    ∃ (f : Proj (fun d => (𝒜 d).baseChange R') ⟶ Proj 𝒜)
      (g : Proj (fun d => (𝒜 d).baseChange R') ⟶ Spec (CommRingCat.of R')),
      IsPullback f g (Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap R (𝒜 0))))
        (Spec.map (CommRingCat.ofHom (algebraMap R R'))) := by
  sorry

end AlgebraicGeometry.Proj

namespace AlgebraicGeometry.Scheme

variable {S : Scheme.{u}}

-- node: SchemeAndStackFoundations:SF.0/relative-proj
/-- The relative homogeneous spectrum `Proj_S(A)`. -/
def relativeProj (A : GradedQCohAlg S) : Scheme.{u} := sorry

namespace relativeProj

/-- The structure morphism. -/
def toBase (A : GradedQCohAlg S) : relativeProj A ⟶ S := sorry

/-- Over an affine open, the relative Proj is Mathlib's `Proj` of the sections. -/
def preimageIso (A : GradedQCohAlg S) (U : S.AffineZariskiSite) :
    (toBase A ⁻¹ᵁ U.1).toScheme ≅ Proj (A.grading U) := sorry

instance isSeparated (A : GradedQCohAlg S) : IsSeparated (toBase A) := sorry

/-- The positive-degree ideal in the actual affine graded ring. -/
def irrelevant (A : GradedQCohAlg S) (U : S.AffineZariskiSite) :
    Ideal (A.toQCohAlg.presheaf.obj (.op U)) :=
  Ideal.span {x | ∃ d : ℕ, 0 < d ∧ x ∈ A.grading U d}

/-- A graded map defines an everywhere-defined Proj map only with this condition. -/
def CoversProj {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg) : Prop :=
  ∀ U, irrelevant B U ≤ ((irrelevant A U).map (ψ.hom.right.app (.op U)).hom).radical

def map {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg)
    (hgraded : ∀ U d x, x ∈ A.grading U d → ψ.hom.right.app (.op U) x ∈ B.grading U d)
    (hcover : CoversProj ψ) : relativeProj B ⟶ relativeProj A := sorry

theorem map_isIso {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg)
    (hgraded : ∀ U d x, x ∈ A.grading U d → ψ.hom.right.app (.op U) x ∈ B.grading U d)
    (hcover : CoversProj ψ)
    (heventual : ∀ U, ∃ N : ℕ, ∀ d ≥ N,
      Function.Bijective (fun a : A.grading U d =>
        (⟨ψ.hom.right.app (.op U) a, hgraded U d a a.property⟩ : B.grading U d))) :
    IsIso (map ψ hgraded hcover) := sorry

theorem map_isClosedImmersion {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg)
    (hgraded : ∀ U d x, x ∈ A.grading U d → ψ.hom.right.app (.op U) x ∈ B.grading U d)
    (hcover : CoversProj ψ)
    (hsurj : ∀ U, ∃ N : ℕ, ∀ d ≥ N, ∀ b ∈ B.grading U d,
      ∃ a ∈ A.grading U d, ψ.hom.right.app (.op U) a = b) :
    IsClosedImmersion (map ψ hgraded hcover) := sorry

/-- A homogeneous global section lies in the degree piece of A, not in O_S. -/
def awayAlg (A : GradedQCohAlg S) (d : ℕ) (f : Γ(A.piece d, ⊤)) : QCohAlg S := sorry

def basicOpen (A : GradedQCohAlg S) (d : ℕ) (f : Γ(A.piece d, ⊤)) :
    (relativeProj A).Opens := sorry

/-- The basic open D₊(f) is the relative spectrum of its degree-zero localization. -/
def basicOpenIso (A : GradedQCohAlg S) (d : ℕ) (hd : 0 < d) (f : Γ(A.piece d, ⊤)) :
    relativeSpec (awayAlg A d f) ≅ (basicOpen A d f).toScheme := sorry

/-- Veronese invariance. -/
def veroneseIso (A : GradedQCohAlg S) (d : ℕ) (hd : 0 < d) :
    relativeProj (A.veronese d hd) ≅ relativeProj A := sorry

theorem empty_of_degreeZero (A : GradedQCohAlg S)
    (h : ∀ U d, 0 < d → A.grading U d = ⊥) : IsEmpty (relativeProj A) := sorry

end relativeProj

-- test: AlgebraicGeometry.Scheme.relativeProj_test_degree_zero
example : IsEmpty (relativeProj (GradedQCohAlg.trivial S)) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeProj_test_projective_line_points
example (K : Type u) [Field K] :
    Nonempty ({x : Spec (CommRingCat.of K) ⟶
        relativeProj (GradedQCohAlg.polynomial (Spec (CommRingCat.of K)) (ULift.{u} (Fin 2))) //
        x ≫ relativeProj.toBase _ = 𝟙 _} ≃ Projectivization K (ULift.{u} (Fin 2) → K)) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeProj_test_affine_base
example {R A : Type u} [CommRing R] [CommRing A] [Algebra R A] (𝒜 : ℕ → Submodule R A)
    [GradedAlgebra 𝒜] : Nonempty (relativeProj (GradedQCohAlg.ofGradedAlgebra 𝒜) ≅ Proj 𝒜) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeProj_test_not_affine
example (k : Type u) [Field k] :
    ¬ IsAffine (relativeProj (GradedQCohAlg.polynomial (Spec (CommRingCat.of k)) (ULift.{u} (Fin 2)))) := by
  sorry
-- test: AlgebraicGeometry.Scheme.relativeProj_test_veronese
example : Nonempty (relativeProj ((GradedQCohAlg.polynomial S (ULift.{u} (Fin 2))).veronese 2 two_pos) ≅
    relativeProj (GradedQCohAlg.polynomial S (ULift.{u} (Fin 2)))) := by sorry

-- node: SchemeAndStackFoundations:SF.0/relative-proj-base-change
theorem relativeProj.isPullback_baseChange {S' : Scheme.{u}} (g : S' ⟶ S) (A : GradedQCohAlg S) :
    ∃ g' : relativeProj (A.pullback g) ⟶ relativeProj A,
      IsPullback g' (relativeProj.toBase (A.pullback g)) (relativeProj.toBase A) g := by sorry

-- node: SchemeAndStackFoundations:SF.0/relative-proj-affine-comparison
/-- Over an affine base the relative Proj is Mathlib's `Proj`. -/
def relativeProjIsoProj {R A : Type u} [CommRing R] [CommRing A] [Algebra R A]
    (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜] :
    relativeProj (GradedQCohAlg.ofGradedAlgebra 𝒜) ≅ Proj 𝒜 := sorry

-- node: SchemeAndStackFoundations:SF.0/relative-proj-stable-reduction-compatibility
-- The comparison with Stable reduction Layer 2's finitely generated relative Proj cannot be stated
-- here: that construction is a Tau Ceti roadmap target with no Lean carrier at the pin.

end AlgebraicGeometry.Scheme

namespace AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.0/noetherian-normal-components
/-- A connected locally Noetherian scheme whose local rings are integrally closed domains is
integral. -/
theorem isIntegral_of_isNormal_of_connected (X : Scheme.{u}) [IsLocallyNoetherian X]
    [ConnectedSpace X]
    (h : ∀ x : X, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x)) :
    IsIntegral X := by
  sorry

/-- The irreducible components of a locally Noetherian normal scheme are open. -/
theorem isOpen_of_mem_irreducibleComponents_of_isNormal (X : Scheme.{u}) [IsLocallyNoetherian X]
    (h : ∀ x : X, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x))
    (T : Set X) (hT : T ∈ irreducibleComponents X) : IsOpen T := by
  sorry

end AlgebraicGeometry

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite

variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- restated from the base plan for elaboration (SF.0 image-ideal strand)
lemma extendedIdeal_restrict (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    ((I.ideal V).map (f.app V).hom).map
      (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom =
        (I.ideal U).map (f.app U).hom := by
  sorry

-- restated from the base plan for elaboration
def quotientRestriction (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    (Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  Ideal.quotientMap _
    (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom
    (Ideal.map_le_iff_le_comap.mp (extendedIdeal_restrict I f h).le)

-- restated from the base plan for elaboration
def quotientPresheaf (I : Y.IdealSheafData) (f : X ⟶ Y) :
    Y.affineOpensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := CommRingCat.of (Γ(X, f ⁻¹ᵁ U.unop) ⧸ (I.ideal U.unop).map (f.app U.unop).hom)
  map h := CommRingCat.ofHom (quotientRestriction I f h.unop.le)
  map_id U := by sorry
  map_comp h k := by sorry

-- restated from the base plan for elaboration
lemma extendedIdeal_comp (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (I.ideal U).map ((f ≫ g).app U).hom =
      ((I.comap g).ideal ⟨g ⁻¹ᵁ U, H⟩).map (f.app (g ⁻¹ᵁ U)).hom := by
  sorry

/-- The affine inverse-image functor on affine opens along an affine morphism. -/
abbrev preimageFunctor (g : Y ⟶ Z) [IsAffineHom g] : Z.affineOpens ⥤ Y.affineOpens :=
  (show Monotone (fun U : Z.affineOpens => (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
    from fun _ _ h => g.preimage_mono h).functor

-- restated from the base plan for elaboration
def quotientCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g] :
    quotientPresheaf I (f ≫ g) ≅ (preimageFunctor g).op ⋙ quotientPresheaf (I.comap g) f :=
  NatIso.ofComponents (fun U =>
    (Ideal.quotEquivOfEq (extendedIdeal_comp I f g U.unop (U.unop.2.preimage g))).toCommRingCatIso)
    (fun _ => by sorry)

-- node: SchemeAndStackFoundations:SF.0/quotient-tower/left-unit
/-- Left identity coherence: for `f = 𝟙 Y` the comparison is the transport along `𝟙 ≫ g = g`
followed by the componentwise identification of the two (equal) extended ideals. -/
theorem quotientCompNatIso_id_left (I : Z.IdealSheafData) (g : Y ⟶ Z) [IsAffineHom g] :
    quotientCompNatIso I (𝟙 Y) g =
      eqToIso (congrArg (quotientPresheaf I) (Category.id_comp g)) ≪≫
        (NatIso.ofComponents (fun U =>
          (Ideal.quotEquivOfEq (I := (I.ideal U.unop).map (g.app U.unop).hom)
            (J := ((I.comap g).ideal ((preimageFunctor g).obj U.unop)).map
              ((𝟙 Y : Y ⟶ Y).app ((preimageFunctor g).obj U.unop).1).hom)
            (by sorry)).toCommRingCatIso)
          (fun _ => by sorry) :
          quotientPresheaf I g ≅ (preimageFunctor g).op ⋙ quotientPresheaf (I.comap g) (𝟙 Y)) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

/-! Coherent extension, internal Hom and Hartogs. The coherent carrier is the pinned
quasi-coherent finite-type sheaf on a locally Noetherian scheme. -/

/-! ## Depth, catenarity and support -/
namespace Ring
variable (R : Type u) [CommRing R]
-- node: SchemeAndStackFoundations:SF.0/catenary-ring
/-- Bounded intervals of prime chains, with equal lengths for saturated chains. -/
def IsCatenary : Prop := ∀ p q : PrimeSpectrum R, p ≤ q →
  (∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum R), s.head = p → s.last = q → s.length ≤ n) ∧
  ∀ s t : LTSeries (PrimeSpectrum R),
    s.head = p → s.last = q → t.head = p → t.last = q →
    (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
    (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length

-- node: SchemeAndStackFoundations:SF.0/universally-catenary
/-- The finite-polynomial criterion avoids quantifying over larger universes. -/
def IsUniversallyCatenary : Prop := IsNoetherianRing R ∧
  ∀ n : ℕ, IsCatenary (MvPolynomial (Fin n) R)
end Ring

namespace Module
variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
-- node: SchemeAndStackFoundations:SF.0/depth
/-- Weakly regular sequences also give the required infinite depth for the zero module. -/
def depth (I : Ideal R) : ℕ∞ :=
  ⨆ (s : List R) (_ : ∀ a ∈ s, a ∈ I) (_ : RingTheory.Sequence.IsWeaklyRegular M s),
    (s.length : ℕ∞)
end Module

namespace IsLocalRing
variable (R : Type u) [CommRing R] [IsLocalRing R]
    (M : Type u) [AddCommGroup M] [Module R M]
def depth : ℕ∞ := Module.depth R M (maximalIdeal R)
end IsLocalRing

namespace Module
variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
/-- Localization of a module at a prime, including its natural localized-ring action. -/
abbrev primeLocalization (p : PrimeSpectrum R) := LocalizedModule p.asIdeal.primeCompl M
-- node: SchemeAndStackFoundations:SF.0/cohen-macaulay
/-- Zero modules are Cohen–Macaulay, without equating infinity to the empty-support dimension. -/
def IsCohenMacaulay : Prop := IsNoetherianRing R ∧ Module.Finite R M ∧
  ∀ p : PrimeSpectrum R, Subsingleton (primeLocalization R M p) ∨
    (IsLocalRing.depth (Localization.AtPrime p.asIdeal) (primeLocalization R M p) : WithBot ℕ∞) =
      Module.supportDim (Localization.AtPrime p.asIdeal) (primeLocalization R M p)

def IsMaximalCohenMacaulay [IsLocalRing R] : Prop :=
  Module.Finite R M ∧ IsLocalRing.depth R M = ringKrullDim R
-- node: SchemeAndStackFoundations:SF.0/serre-condition-sn
/-- The inequality is imposed only on nonzero localized modules. -/
def SatisfiesSerreS (n : ℕ) : Prop := IsNoetherianRing R ∧ Module.Finite R M ∧
  ∀ p : PrimeSpectrum R,
    (min (n : WithBot ℕ∞)
      (Module.supportDim (Localization.AtPrime p.asIdeal) (primeLocalization R M p))) ≤
      (IsLocalRing.depth (Localization.AtPrime p.asIdeal) (primeLocalization R M p) : WithBot ℕ∞)
end Module

namespace Ring
variable (R : Type u) [CommRing R]
abbrev IsCohenMacaulay := Module.IsCohenMacaulay R R
abbrev SatisfiesSerreS (n : ℕ) := Module.SatisfiesSerreS R R n

def SatisfiesSerreR (n : ℕ) : Prop := IsNoetherianRing R ∧
  ∀ p : PrimeSpectrum R, p.asIdeal.height ≤ n →
    IsRegularLocalRing (Localization.AtPrime p.asIdeal)
-- node: SchemeAndStackFoundations:SF.0/japanese-ring
/-- N-1 and N-2 impose no Noetherian hypothesis. -/
def IsN1 [IsDomain R] : Prop := Module.Finite R (integralClosure R (FractionRing R))
def IsJapanese [IsDomain R] : Prop := ∀ (L : Type u) [Field L] [Algebra (FractionRing R) L],
  Module.Finite (FractionRing R) L →
    letI : Algebra R L := (algebraMap (FractionRing R) L).comp (algebraMap R (FractionRing R)) |>.toAlgebra
    Module.Finite R (integralClosure R L)
-- node: SchemeAndStackFoundations:SF.0/nagata-ring
/-- Every prime quotient must be Japanese, with a separate Noetherian clause. -/
def IsNagata : Prop := IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
  letI : p.asIdeal.IsPrime := p.isPrime
  IsJapanese (R ⧸ p.asIdeal)

def IsUniversallyJapanese : Prop := ∀ (B : Type u) [CommRing B] [Algebra R B] [IsDomain B],
  Algebra.FiniteType R B → IsJapanese B
end Ring

namespace AlgebraicGeometry.Scheme.Modules
variable {X : Scheme.{u}}
/-- The O_{X,x}-module underlying the ordinary sheaf stalk, with its induced scalar action. -/
def stalkModule (F : X.Modules) (x : X) : ModuleCat.{u} (X.presheaf.stalk x) := sorry

-- node: SchemeAndStackFoundations:SF.0/coherent-scheme-support
def annihilator (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] : X.IdealSheafData := sorry

def schemeSupport (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] : Scheme.{u} :=
  (annihilator F).subscheme

def SatisfiesSerreS (F : X.Modules) (n : ℕ) : Prop :=
  F.IsQuasicoherent ∧ F.IsFiniteType ∧
    ∀ x, (min (n : WithBot ℕ∞) (Module.supportDim (X.presheaf.stalk x) (stalkModule F x))) ≤
      (IsLocalRing.depth (X.presheaf.stalk x) (stalkModule F x) : WithBot ℕ∞)

/-- Associated points use the genuine associated primes of the stalk modules. -/
def associatedPoints (F : X.Modules) : Set X :=
  {x | IsLocalRing.maximalIdeal (X.presheaf.stalk x) ∈
    associatedPrimes (X.presheaf.stalk x) (stalkModule F x)}
end AlgebraicGeometry.Scheme.Modules

namespace AlgebraicGeometry
variable (X : Scheme.{u})
-- node: SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme
def IsCohenMacaulay : Prop := IsLocallyNoetherian X ∧
  ∀ x, Ring.IsCohenMacaulay (X.presheaf.stalk x)

def SatisfiesSerreS (n : ℕ) : Prop := IsLocallyNoetherian X ∧
  ∀ x, Ring.SatisfiesSerreS (X.presheaf.stalk x) n

def IsUniversallyCatenary : Prop := IsLocallyNoetherian X ∧
  ∀ x, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ Ring.IsUniversallyCatenary Γ(X, U)

def IsNagata : Prop := ∀ x, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ Ring.IsNagata Γ(X, U)
end AlgebraicGeometry

namespace Module
variable (R M : Type u) [CommRing R] [AddCommGroup M] [Module R M]

/-- A resolution by finite free modules, unbounded to the left. -/
def IsPseudoCoherent : Prop :=
  ∃ (r : ℕ → ℕ) (d : ∀ n, (Fin (r (n+1)) → R) →ₗ[R] (Fin (r n) → R))
    (ε : (Fin (r 0) → R) →ₗ[R] M),
    Function.Surjective ε ∧ LinearMap.range (d 0) = LinearMap.ker ε ∧
      ∀ n, LinearMap.range (d (n+1)) = LinearMap.ker (d n)

lemma IsPseudoCoherent.finitePresentation (h : IsPseudoCoherent R M) :
    Module.FinitePresentation R M := by sorry
lemma isPseudoCoherent_iff_finite [IsNoetherianRing R] :
    IsPseudoCoherent R M ↔ Module.Finite R M := by sorry
lemma IsPseudoCoherent.baseChange_of_flat {B : Type u} [CommRing B] [Algebra R B]
    [Module.Flat R B] (h : IsPseudoCoherent R M) :
    IsPseudoCoherent B (B ⊗[R] M) := by sorry
end Module

namespace AlgebraicGeometry.Scheme.Modules
variable {X Y : Scheme.{u}}

-- node: SchemeAndStackFoundations:SF.0/qcoh-pushforward
lemma isQuasicoherent_pushforward (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f]
    (F : X.Modules) [F.IsQuasicoherent] : ((pushforward f).obj F).IsQuasicoherent := by sorry

-- node: SchemeAndStackFoundations:SF.0/qcoh-extension
-- The extension is a finite-type submodule of the specified ambient sheaf, not merely a sheaf
-- isomorphic on U. Here monomorphisms record those submodules without a second carrier.
lemma exists_finiteType_submodule_extension {U : X.Opens} (F : X.Modules)
    [F.IsQuasicoherent] (G : U.toScheme.Modules) [G.IsQuasicoherent] [G.IsFiniteType]
    (i : G ⟶ (restrictFunctor U.ι).obj F) [Mono i] :
    ∃ (E : X.Modules) (_ : E.IsQuasicoherent) (_ : E.IsFiniteType)
      (e : E ⟶ F) (_ : Mono e) (α : (restrictFunctor U.ι).obj E ≅ G),
      (restrictFunctor U.ι).map e = α.hom ≫ i := by sorry

-- node: SchemeAndStackFoundations:SF.0/coherent-extension
lemma exists_coherent_extension [IsLocallyNoetherian X] (U : X.Opens)
    (F : U.toScheme.Modules) [F.IsQuasicoherent] [F.IsFiniteType] :
    ∃ (E : X.Modules) (_ : E.IsQuasicoherent) (_ : E.IsFiniteType),
      Nonempty ((restrictFunctor U.ι).obj E ≅ F) := by sorry

-- node: SchemeAndStackFoundations:SF.0/pseudo-coherent-module
/-- Affine-local infinite finite-free resolvability. -/
def IsPseudoCoherent (F : X.Modules) : Prop :=
  F.IsQuasicoherent ∧ ∀ U : X.AffineZariskiSite,
    Module.IsPseudoCoherent Γ(X, U.1) Γ(F, U.1)

lemma IsPseudoCoherent.of_affineOpenCover (F : X.Modules) [F.IsQuasicoherent]
    (h : ∀ x : X, ∃ (U : X.AffineZariskiSite), x ∈ U.1 ∧
      Module.IsPseudoCoherent Γ(X, U.1) Γ(F, U.1)) : F.IsPseudoCoherent := by sorry
lemma isPseudoCoherent_iff_isFinitePresentation [IsLocallyNoetherian X]
    (F : X.Modules) [F.IsQuasicoherent] :
    F.IsPseudoCoherent ↔ F.IsFinitePresentation := by sorry
lemma IsPseudoCoherent.restrict (f : Y ⟶ X) [IsOpenImmersion f]
    {F : X.Modules} (h : F.IsPseudoCoherent) : ((restrictFunctor f).obj F).IsPseudoCoherent := by sorry

-- test: AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_free
example (n : ℕ) : IsPseudoCoherent (SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n))) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_dual_numbers
example (k : Type u) [Field k] :
    let A := Polynomial k ⧸ Ideal.span {(Polynomial.X ^ 2 : Polynomial k)}
    let e : A := Ideal.Quotient.mk _ Polynomial.X
    let M := A ⧸ Ideal.span {e}
    Module.IsPseudoCoherent A M := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_not_finitely_presented
example (k : Type u) [Field k] :
    let A := MvPolynomial ℕ k
    let I : Ideal A := Ideal.span (Set.range MvPolynomial.X)
    ¬ Module.IsPseudoCoherent A (A ⧸ I) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_noetherian
example (R : CommRingCat.{u}) [IsNoetherianRing R] (M : ModuleCat.{u} R) :
    (tilde M).IsPseudoCoherent ↔ Module.Finite R M := by sorry

-- node: SchemeAndStackFoundations:SF.0/locally-free-coherent-extension
lemma exists_coherent_extension_of_isLocallyFree [IsLocallyNoetherian X] (U : X.Opens)
    (F : U.toScheme.Modules) [F.IsLocallyFree] [F.IsFiniteType] :
    ∃ (E : X.Modules) (_ : E.IsQuasicoherent) (_ : E.IsFiniteType),
      Nonempty ((restrictFunctor U.ι).obj E ≅ F) := by sorry

-- node: SchemeAndStackFoundations:SF.0/sheaf-hom-dual
/-- The internal Hom sheaf; sections on V are morphisms of the restrictions to V. -/
def sheafHom (F G : X.Modules) : X.Modules := sorry

def sheafHomFunctor : X.Modulesᵒᵖ × X.Modules ⥤ X.Modules := sorry

def dual (F : X.Modules) : X.Modules := sheafHom F (SheafOfModules.unit X.ringCatSheaf)

def evalDual (F : X.Modules) : F ⟶ dual (dual F) := sorry

instance homModule (F G : X.Modules) : Module Γ(X, ⊤) (F ⟶ G) := sorry

-- Scalar multiplication is pointwise multiplication by restrictions of global functions.
 theorem homModule_app (F G : X.Modules) (a : Γ(X, ⊤)) (f : F ⟶ G) (U : X.Opens) (x : Γ(F,U)) :
    (a • f).app U x = (X.presheaf.map (homOfLE (show U ≤ ⊤ from le_top)).op a) • f.app U x := sorry

def globalSectionsSheafHomEquiv (F G : X.Modules) :
    Γ(sheafHom F G, ⊤) ≃ₗ[Γ(X, ⊤)] (F ⟶ G) := sorry

/-- On affines the global Hom module agrees even without finite presentation. -/
def sheafHomAffineIso (R : CommRingCat.{u}) (M N : ModuleCat.{u} R) :
    Γ(sheafHom (tilde M) (tilde N), ⊤) ≃ₗ[Γ(Spec R, ⊤)]
      (Γ(tilde M, ⊤) →ₗ[Γ(Spec R, ⊤)] Γ(tilde N, ⊤)) := sorry

lemma sheafHom_isQuasicoherent (F G : X.Modules) [F.IsFinitePresentation] [G.IsQuasicoherent] :
    (sheafHom F G).IsQuasicoherent := by sorry

def sheafHomRestrictIso (f : Y ⟶ X) [IsOpenImmersion f] (F G : X.Modules) :
    (restrictFunctor f).obj (sheafHom F G) ≅
      sheafHom ((restrictFunctor f).obj F) ((restrictFunctor f).obj G) := sorry

/-- The tensor-Hom adjunction is a natural bijection on hom sets. -/
def tensorSheafHomAdjunction (E F G : X.Modules) :
    (tensorProduct X E F ⟶ G) ≃ (E ⟶ sheafHom F G) := sorry

lemma isIso_evalDual_of_isLocallyFree (F : X.Modules) [F.IsLocallyFree] [F.IsFiniteType] :
    IsIso (evalDual F) := by sorry

-- test: AlgebraicGeometry.Scheme.Modules.dual_test_unit
example : Nonempty (dual (SheafOfModules.unit X.ringCatSheaf) ≅
    SheafOfModules.unit X.ringCatSheaf) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.dual_test_torsion
example : IsZero (dual (tilde (R := CommRingCat.of ℤ) (ModuleCat.of ℤ (ZMod 2)))) ∧
    ¬ Mono (evalDual (tilde (R := CommRingCat.of ℤ) (ModuleCat.of ℤ (ZMod 2)))) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.dual_test_affine
example (R : CommRingCat.{u}) (M : ModuleCat.{u} R) [Module.FinitePresentation R M] :
    Nonempty (dual (tilde M) ≅ tilde (ModuleCat.of R (Module.Dual R M))) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.dual_test_not_qcoh
example : ¬ (dual (SheafOfModules.free (R := (Spec (CommRingCat.of ℤ)).ringCatSheaf) ℕ)).IsQuasicoherent := by sorry

-- node: SchemeAndStackFoundations:SF.0/reflexive-sheaf
/-- The actual evaluation map is an isomorphism; coherence is an ambient hypothesis. -/
def IsReflexive (F : X.Modules) : Prop := IsIso (evalDual F)

lemma isReflexive_iff_forall_affine [IsLocallyNoetherian X] (F : X.Modules)
    [F.IsQuasicoherent] [F.IsFiniteType] :
    F.IsReflexive ↔ ∀ U : X.AffineZariskiSite, Module.IsReflexive Γ(X, U.1) Γ(F, U.1) := by sorry

def reflexiveHull (F : X.Modules) : X.Modules := dual (dual F)

lemma reflexiveHull_isReflexive [IsLocallyNoetherian X] [IsIntegral X] (F : X.Modules)
    [F.IsQuasicoherent] [F.IsFiniteType] : (reflexiveHull F).IsReflexive := by sorry

lemma reflexiveHull.lift [IsLocallyNoetherian X] [IsIntegral X]
    (F G : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] [G.IsQuasicoherent] [G.IsFiniteType]
    (hG : G.IsReflexive) (φ : F ⟶ G) :
    ∃! ψ : reflexiveHull F ⟶ G, evalDual F ≫ ψ = φ := by sorry

lemma IsReflexive.of_isLocallyFree (F : X.Modules) [F.IsLocallyFree] [F.IsFiniteType] :
    F.IsReflexive := by sorry

-- Torsion-freeness is stated on affine charts, using the existing module predicate.
lemma IsReflexive.torsionFree [IsLocallyNoetherian X] [IsIntegral X]
    (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] (h : F.IsReflexive)
    (U : X.AffineZariskiSite) : Module.IsTorsionFree Γ(X, U.1) Γ(F, U.1) := by sorry

lemma IsReflexive.sheafHom [IsLocallyNoetherian X] [IsIntegral X]
    (F G : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] [G.IsQuasicoherent] [G.IsFiniteType]
    (hG : G.IsReflexive) : (sheafHom F G).IsReflexive := by sorry

lemma IsReflexive.of_exact [IsLocallyNoetherian X] [IsIntegral X]
    (F G H : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] [G.IsQuasicoherent] [G.IsFiniteType]
    [H.IsQuasicoherent] [H.IsFiniteType] (i : F ⟶ G) (p : G ⟶ H) [Mono i]
    (hexact : (ShortComplex.mk i p (by sorry)).Exact) (hG : G.IsReflexive)
    (hH : ∀ U : X.AffineZariskiSite, Module.IsTorsionFree Γ(X, U.1) Γ(H, U.1)) :
    F.IsReflexive := by sorry

-- test: AlgebraicGeometry.Scheme.Modules.IsReflexive.test_unit
example : IsReflexive (SheafOfModules.unit X.ringCatSheaf) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsReflexive.test_torsion
example : ¬ (tilde (R := CommRingCat.of ℤ) (ModuleCat.of ℤ (ZMod 2))).IsReflexive ∧
    IsZero (reflexiveHull (tilde (R := CommRingCat.of ℤ) (ModuleCat.of ℤ (ZMod 2)))) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsReflexive.test_maximal_ideal
example (k : Type u) [Field k] :
    let A := MvPolynomial (Fin 2) k
    let I : Ideal A := Ideal.span (Set.range MvPolynomial.X)
    ¬ (tilde (R := CommRingCat.of A) (ModuleCat.of A I)).IsReflexive := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsReflexive.test_affine
example (R : CommRingCat.{u}) [IsNoetherianRing R] [IsDomain R]
    (M : ModuleCat.{u} R) [Module.Finite R M] :
    (tilde M).IsReflexive ↔ Module.IsReflexive R M := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.IsReflexive.test_nonintegral_hull
example (k : Type u) [Field k] :
    let A := MvPolynomial (Fin 2) k
    let I : Ideal A := Ideal.span (Set.range MvPolynomial.X)
    let R := A ⧸ I^2
    let J := I.map (Ideal.Quotient.mk (I^2))
    ¬ (reflexiveHull (tilde (R := CommRingCat.of R) (ModuleCat.of R (R ⧸ J)))).IsReflexive := by sorry

-- node: SchemeAndStackFoundations:SF.0/coherent-hartogs
-- The canonical unit and the omitted-stalk depth condition use the native adjunction and
-- the planned depth of the actual stalk module.
lemma isIso_unit_restrict_of_depth [IsLocallyNoetherian X] (U : X.Opens)
    (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType]
    (hdepth : ∀ x : X, x ∉ U → 2 ≤ IsLocalRing.depth (X.presheaf.stalk x) (stalkModule F x)) :
    IsIso ((restrictAdjunction U.ι).unit.app F) := by sorry

-- node: SchemeAndStackFoundations:SF.0/hartogs-affine-sections
-- hO is the actual structure-sheaf restriction map, rather than a freely supplied proposition.
def _root_.AlgebraicGeometry.Scheme.hartogsSectionEquiv (U : X.Opens)
    (hO : IsIso ((restrictAdjunction U.ι).unit.app (SheafOfModules.unit X.ringCatSheaf)))
    {Y : Scheme.{u}} (a : Y ⟶ X) [IsAffineHom a] :
    {s : X ⟶ Y // s ≫ a = 𝟙 X} ≃ {s : U.toScheme ⟶ Y // s ≫ a = U.ι} := sorry

-- node: SchemeAndStackFoundations:SF.0/hartogs-vector-bundle-pushforward
-- The complement has structure-ring depth at least two.
lemma coherent_reflexive_pushforward_of_locallyFree [IsNoetherian X] (U : X.Opens)
    (F : U.toScheme.Modules) [F.IsLocallyFree] [F.IsFiniteType]
    (hdepth : ∀ x : X, x ∉ U → 2 ≤ IsLocalRing.depth (X.presheaf.stalk x) (X.presheaf.stalk x)) :
    ((pushforward U.ι).obj F).IsQuasicoherent ∧ ((pushforward U.ι).obj F).IsFiniteType ∧
      ((pushforward U.ι).obj F).IsReflexive := by sorry

-- node: SchemeAndStackFoundations:SF.0/vector-bundle-hartogs-equivalence
-- Finite rank may vary locally; local dimensions are dimensions of the actual local rings.
abbrev VectorBundle (X : Scheme.{u}) :=
  ObjectProperty.FullSubcategory (fun F : X.Modules => F.IsLocallyFree ∧ F.IsFiniteType)

def vectorBundleRestrictEquivalence [IsNoetherian X] (U : X.Opens)
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x))
    (hdim : ∀ x : X, ringKrullDim (X.presheaf.stalk x) ≤ 2)
    (hU : ∀ x : X, x ∉ U → 2 ≤ ringKrullDim (X.presheaf.stalk x)) :
    VectorBundle X ≌ VectorBundle U.toScheme := sorry
end AlgebraicGeometry.Scheme.Modules

namespace AlgebraicGeometry
variable (R : CommRingCat.{u})

-- node: SchemeAndStackFoundations:SF.0/sections-open-affine
/-- Sections retain their R-module structure through Mathlib's affine equivalence. -/
def sectionsOnOpen (U : (Spec R).Opens) (M : ModuleCat.{u} R) : ModuleCat.{u} R :=
  (modulesSpecToSheaf.obj (tilde M)).presheaf.obj (.op U)

namespace sectionsOnOpen
variable {R}
def unit (U : (Spec R).Opens) (M : ModuleCat.{u} R) : M ⟶ sectionsOnOpen R U M :=
  tilde.toOpen M U

def map (U : (Spec R).Opens) {M N : ModuleCat.{u} R} (f : M ⟶ N) :
    sectionsOnOpen R U M ⟶ sectionsOnOpen R U N :=
  (modulesSpecToSheaf.map (tilde.map f)).hom.app (.op U)

/-- The equalizer of the two restriction maps for a finite open cover. -/
def cechTuples {ι : Type u} [Fintype ι] (V : ι → (Spec R).Opens)
    (M : ModuleCat.{u} R) : Submodule R (∀ i, sectionsOnOpen R (V i) M) where
  carrier := {s | ∀ i j,
    ((modulesSpecToSheaf.obj (tilde M)).presheaf.map
      (homOfLE inf_le_left : V i ⊓ V j ⟶ V i).op) (s i) =
    ((modulesSpecToSheaf.obj (tilde M)).presheaf.map
      (homOfLE inf_le_right : V i ⊓ V j ⟶ V j).op) (s j)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

def cechEquiv {ι : Type u} [Fintype ι] (V : ι → (Spec R).Opens)
    (U : (Spec R).Opens) (h : U = ⨆ i, V i) (M : ModuleCat.{u} R) :
    sectionsOnOpen R U M ≃ₗ[R] cechTuples V M := sorry

def pushforwardIso (U : (Spec R).Opens) (M : ModuleCat.{u} R)
    (hU : IsCompact (U : Set (Spec R))) :
    tilde (sectionsOnOpen R U M) ≅
      (Scheme.Modules.pushforward U.ι).obj ((Scheme.Modules.restrictFunctor U.ι).obj (tilde M)) := sorry

-- The open on Spec B is the actual inverse image; tensor respects the R-module structure.
def flatBaseChange {B : CommRingCat.{u}} (f : R ⟶ B) (U : (Spec R).Opens)
    (M : ModuleCat.{u} R) (hU : IsCompact (U : Set (Spec R))) (hf : f.hom.Flat) :
    letI := f.hom.toAlgebra
    B ⊗[R] sectionsOnOpen R U M ≃ₗ[B]
      sectionsOnOpen B ((Spec.map f) ⁻¹ᵁ U) (ModuleCat.of B (B ⊗[R] M)) := sorry

-- test: AlgebraicGeometry.sectionsOnOpen.test_top
example (M : ModuleCat.{u} R) : IsIso (unit ⊤ M) := by sorry
-- test: AlgebraicGeometry.sectionsOnOpen.test_empty
example (M : ModuleCat.{u} R) : Subsingleton (sectionsOnOpen R ⊥ M) := by sorry
-- test: AlgebraicGeometry.sectionsOnOpen.test_principal
example (k : Type u) [Field k] :
    let A := Polynomial k
    let U := PrimeSpectrum.basicOpen (Polynomial.X : A)
    Nonempty (sectionsOnOpen (CommRingCat.of A) U (ModuleCat.of A A) ≃ₗ[A]
      Localization.Away (Polynomial.X : A)) := by sorry
-- test: AlgebraicGeometry.sectionsOnOpen.test_punctured_plane
example (k : Type u) [Field k] :
    let A := MvPolynomial (Fin 2) k
    let X := Spec (CommRingCat.of A)
    let U := PrimeSpectrum.basicOpen (MvPolynomial.X 0 : A) ⊔ PrimeSpectrum.basicOpen (MvPolynomial.X 1 : A)
    IsIso (unit (R := CommRingCat.of A) U (ModuleCat.of A A)) := by sorry
end sectionsOnOpen

-- node: SchemeAndStackFoundations:SF.0/hartogs-ideal-closure
/-- Saturation by restriction, computed as an actual submodule preimage. Under the Hartogs
hypothesis on R this agrees with transporting Γ(U,J~) into R. -/
def hartogsIdealClosure (U : (Spec R).Opens) (J : Ideal R) : Ideal R :=
  (LinearMap.range (sectionsOnOpen.map U (ModuleCat.ofHom J.subtype)).hom).comap
    (sectionsOnOpen.unit U (ModuleCat.of R R)).hom

namespace hartogsIdealClosure
variable {R}
lemma le (U : (Spec R).Opens) (J : Ideal R) : J ≤ hartogsIdealClosure R U J := by sorry
lemma mono (U : (Spec R).Opens) {J K : Ideal R} (h : J ≤ K) :
    hartogsIdealClosure R U J ≤ hartogsIdealClosure R U K := by sorry
lemma idempotent (U : (Spec R).Opens) (J : Ideal R) :
    hartogsIdealClosure R U (hartogsIdealClosure R U J) = hartogsIdealClosure R U J := by sorry

def sheafIso [IsNoetherianRing R] (U : (Spec R).Opens) (J : Ideal R)
    (hU : IsIso (sectionsOnOpen.unit U (ModuleCat.of R R))) :
    tilde (ModuleCat.of R (hartogsIdealClosure R U J)) ≅
      (Scheme.Modules.pushforward U.ι).obj
        ((Scheme.Modules.restrictFunctor U.ι).obj (tilde (ModuleCat.of R J))) := sorry

-- Depth is tested on the actual ideal sheaf stalk at each omitted point.
lemma eq_of_depth [IsNoetherianRing R] (U : (Spec R).Opens) (J : Ideal R)
    (hdepth : ∀ x : Spec R, x ∉ U →
      2 ≤ IsLocalRing.depth ((Spec R).presheaf.stalk x)
        (Scheme.Modules.stalkModule (tilde (ModuleCat.of R J)) x)) :
    hartogsIdealClosure R U J = J := by sorry

-- The finite-free module product adapter is stated using the actual image of J⊗L → L.
lemma mul_free [IsNoetherianRing R] (U : (Spec R).Opens) (J : Ideal R) (n : ℕ) :
    ∀ a : Fin n → R, (∀ i, a i ∈ hartogsIdealClosure R U J) ↔
      (sectionsOnOpen.unit U (ModuleCat.of R (Fin n → R))).hom a ∈
        LinearMap.range ((sectionsOnOpen.map U (ModuleCat.ofHom
          (Submodule.subtype (J • (⊤ : Submodule R (Fin n → R)))))).hom) := by sorry

lemma flatBaseChange {B : CommRingCat.{u}} (f : R ⟶ B) [IsNoetherianRing R] [IsNoetherianRing B]
    (U : (Spec R).Opens) (J : Ideal R) (hU : IsCompact (U : Set (Spec R))) (hf : f.hom.Flat) :
    (hartogsIdealClosure R U J).map f.hom =
      hartogsIdealClosure B ((Spec.map f) ⁻¹ᵁ U) (J.map f.hom) := by sorry

-- test: AlgebraicGeometry.hartogsIdealClosure.test_top
example (J : Ideal R) : hartogsIdealClosure R ⊤ J = J := by sorry
-- test: AlgebraicGeometry.hartogsIdealClosure.test_zero_and_unit
example (U : (Spec R).Opens) (h : IsIso (sectionsOnOpen.unit U (ModuleCat.of R R))) :
    hartogsIdealClosure R U ⊥ = ⊥ ∧ hartogsIdealClosure R U ⊤ = ⊤ := by sorry
-- test: AlgebraicGeometry.hartogsIdealClosure.test_origin_ideal
example (k : Type u) [Field k] :
    let A := MvPolynomial (Fin 2) k
    let X := Spec (CommRingCat.of A)
    let U := PrimeSpectrum.basicOpen (MvPolynomial.X 0 : A) ⊔ PrimeSpectrum.basicOpen (MvPolynomial.X 1 : A)
    hartogsIdealClosure (CommRingCat.of A) U (Ideal.span (Set.range MvPolynomial.X)) = ⊤ := by sorry
-- test: AlgebraicGeometry.hartogsIdealClosure.test_principal
example (k : Type u) [Field k] :
    let A := MvPolynomial (Fin 2) k
    let X := Spec (CommRingCat.of A)
    let U := PrimeSpectrum.basicOpen (MvPolynomial.X 0 : A) ⊔ PrimeSpectrum.basicOpen (MvPolynomial.X 1 : A)
    hartogsIdealClosure (CommRingCat.of A) U (Ideal.span {MvPolynomial.X 0}) =
      Ideal.span {MvPolynomial.X 0} := by sorry
end hartogsIdealClosure
end AlgebraicGeometry
namespace Module
-- node: SchemeAndStackFoundations:SF.0/free-maximal-depth-regular-local
lemma free_of_maximal_depth_regular_local (R M : Type u) [CommRing R]
    [IsRegularLocalRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    (h : Subsingleton M ∨ IsLocalRing.depth R M = ringKrullDim R) : Module.Free R M := by sorry
-- node: SchemeAndStackFoundations:SF.0/reflexive-free-small-dimension
lemma free_of_isReflexive_of_dimension_le_two (R M : Type u) [CommRing R]
    [IsRegularLocalRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.IsReflexive R M] (hdim : ringKrullDim R ≤ 2) : Module.Free R M := by sorry
end Module

namespace AlgebraicGeometry.Scheme.Modules
variable {X : Scheme.{u}}
-- node: SchemeAndStackFoundations:SF.0/reflexive-extension-normal
abbrev CoherentReflexive (X : Scheme.{u}) := ObjectProperty.FullSubcategory
  (fun F : X.Modules => F.IsQuasicoherent ∧ F.IsFiniteType ∧ F.IsReflexive)

def reflexiveRestrictEquivalence [IsLocallyNoetherian X] [IsIntegral X] (U : X.Opens)
    (hdepth : ∀ x : X, x ∉ U →
      2 ≤ IsLocalRing.depth (X.presheaf.stalk x) (X.presheaf.stalk x)) :
    CoherentReflexive X ≌ CoherentReflexive U.toScheme := sorry

-- node: SchemeAndStackFoundations:SF.0/maximal-cm-hartogs
lemma hartogs_of_maximalCohenMacaulay [IsLocallyNoetherian X] (U : X.Opens)
    (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType]
    (hfull : ∀ x, ¬ Subsingleton (stalkModule F x))
    (hCM : ∀ x, Module.IsCohenMacaulay (X.presheaf.stalk x) (stalkModule F x))
    (hdim : ∀ x : X, x ∉ U → 2 ≤ ringKrullDim (X.presheaf.stalk x)) :
    IsIso ((restrictAdjunction U.ι).unit.app F) := by sorry
end AlgebraicGeometry.Scheme.Modules

namespace AlgebraicGeometry.Scheme
-- node: SchemeAndStackFoundations:SF.0/hartogs-regular-sequence
lemma hartogs_of_regular_pair (R : CommRingCat.{u}) (M : ModuleCat.{u} R) (a b : R)
    (h : RingTheory.Sequence.IsWeaklyRegular M [a,b]) :
    IsIso (sectionsOnOpen.unit (PrimeSpectrum.basicOpen a ⊔ PrimeSpectrum.basicOpen b) M) := by sorry

variable {S T : Scheme.{u}}
-- node: SchemeAndStackFoundations:SF.0/vector-schemes
/-- V(E) represents linear functionals; it is contravariant in E. -/
def vectorScheme (E : S.Modules) [E.IsQuasicoherent] : Scheme.{u} :=
  relativeSpec (QCohAlg.sym E inferInstance)

def vectorScheme.toBase (E : S.Modules) [E.IsQuasicoherent] : vectorScheme E ⟶ S :=
  relativeSpec.toBase (QCohAlg.sym E inferInstance)

def vectorScheme.homEquiv (E : S.Modules) [E.IsQuasicoherent] (g : T ⟶ S) :
    {f : T ⟶ vectorScheme E // f ≫ vectorScheme.toBase E = g} ≃
      ((Modules.pullback g).obj E ⟶ SheafOfModules.unit T.ringCatSheaf) := sorry

def vectorScheme.map {E F : S.Modules} [E.IsQuasicoherent] [F.IsQuasicoherent]
    (f : E ⟶ F) : vectorScheme F ⟶ vectorScheme E := sorry

def vectorScheme.pullbackIso (E : S.Modules) [E.IsQuasicoherent] (g : T ⟶ S)
    [((Modules.pullback g).obj E).IsQuasicoherent] :
    pullback (vectorScheme.toBase E) g ≅ vectorScheme ((Modules.pullback g).obj E) := sorry

/-- W(E) uses the dual; the sections comparison requires finite local freeness. -/
def sectionScheme (E : S.Modules) [E.IsLocallyFree] [E.IsFiniteType]
    [(Modules.dual E).IsQuasicoherent] : Scheme.{u} := vectorScheme (Modules.dual E)

def sectionScheme.toBase (E : S.Modules) [E.IsLocallyFree] [E.IsFiniteType]
    [(Modules.dual E).IsQuasicoherent] : sectionScheme E ⟶ S := vectorScheme.toBase (Modules.dual E)

def sectionScheme.pointsEquiv (E : S.Modules) [E.IsLocallyFree] [E.IsFiniteType]
    [(Modules.dual E).IsQuasicoherent] (g : T ⟶ S) :
    {f : T ⟶ sectionScheme E // f ≫ sectionScheme.toBase E = g} ≃
      Γ((Modules.pullback g).obj E, ⊤) := sorry

def vectorScheme.add (E : S.Modules) [E.IsQuasicoherent] :
    pullback (vectorScheme.toBase E) (vectorScheme.toBase E) ⟶ vectorScheme E := sorry

def sectionScheme.pullbackIso (E : S.Modules) [E.IsLocallyFree] [E.IsFiniteType]
    [(Modules.dual E).IsQuasicoherent] (g : T ⟶ S)
    [((Modules.pullback g).obj E).IsLocallyFree] [((Modules.pullback g).obj E).IsFiniteType]
    [(Modules.dual ((Modules.pullback g).obj E)).IsQuasicoherent] :
    pullback (sectionScheme.toBase E) g ≅ sectionScheme ((Modules.pullback g).obj E) := sorry

-- test: AlgebraicGeometry.Scheme.vectorScheme.test_free
example (n : Type u) [(SheafOfModules.free (R := S.ringCatSheaf) n).IsQuasicoherent] :
    Nonempty (vectorScheme (SheafOfModules.free (R := S.ringCatSheaf) n) ≅ AffineSpace n S) := by sorry
-- test: AlgebraicGeometry.Scheme.vectorScheme.test_zero
example [(SheafOfModules.free (R := S.ringCatSheaf) PEmpty).IsQuasicoherent] :
    Nonempty (vectorScheme (SheafOfModules.free (R := S.ringCatSheaf) PEmpty) ≅ S) := by sorry
-- test: AlgebraicGeometry.Scheme.sectionScheme.test_line
-- O(1) on P¹ is owned by StableReduction Layer 2. The line-bundle test uses the general
-- points equivalence here; its two-dimensional global-section calculation is that layer's test.
example (E : S.Modules) [E.IsLocallyFree] [E.IsFiniteType]
    [(Modules.dual E).IsQuasicoherent] :
    Nonempty ({f : S ⟶ sectionScheme E // f ≫ sectionScheme.toBase E = 𝟙 S} ≃ Γ(E, ⊤)) := by sorry
-- test: AlgebraicGeometry.Scheme.vectorScheme.test_nonfree
example : Subsingleton (Module.Dual ℤ (ZMod 2)) ∧ ¬ Subsingleton (ZMod 2) := by sorry
end AlgebraicGeometry.Scheme

namespace AlgebraicGeometry
-- node: SchemeAndStackFoundations:SF.0/tor-independent
/-- Every positive Tor vanishes for the actual two stalk maps over a common base point. -/
def TorIndependent {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S) : Prop :=
  ∀ (x : X) (y : Y) (h : f x = g y),
    let R := S.presheaf.stalk (f x)
    letI := (f.stalkMap x).hom.toAlgebra
    letI := ((eqToHom (congrArg S.presheaf.stalk h)) ≫ g.stalkMap y).hom.toAlgebra
    ∀ n : ℕ, IsZero (((CategoryTheory.Tor (ModuleCat.{u} R) (n+1)).obj
      (ModuleCat.of R (X.presheaf.stalk x))).obj (ModuleCat.of R (Y.presheaf.stalk y)))

lemma TorIndependent.symm {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S) :
    TorIndependent f g ↔ TorIndependent g f := by sorry
lemma TorIndependent.of_flat_left {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S)
    [Flat f] : TorIndependent f g := by sorry
lemma TorIndependent.of_flat_right {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S)
    [Flat g] : TorIndependent f g := by sorry
lemma torIndependent_affine_iff (A B C : CommRingCat.{u}) (f : A ⟶ B) (g : A ⟶ C) :
    letI := f.hom.toAlgebra
    letI := g.hom.toAlgebra
    TorIndependent (Spec.map f) (Spec.map g) ↔ ∀ n : ℕ,
      IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) (n+1)).obj (ModuleCat.of A B)).obj
        (ModuleCat.of A C)) := by sorry

lemma TorIndependent.restrict {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S)
    (h : TorIndependent f g) (U : X.Opens) (V : Y.Opens) :
    TorIndependent (U.ι ≫ f) (V.ι ≫ g) := by sorry
-- Pasting is expressed with the two actual component base-change maps.
lemma TorIndependent.paste {X S T T' : Scheme.{u}} (f : X ⟶ S) (g : T ⟶ S) (h : T' ⟶ T)
    (h₁ : TorIndependent f g) (h₂ : TorIndependent (pullback.snd f g) h) :
    TorIndependent f (h ≫ g) := by sorry

-- test: AlgebraicGeometry.TorIndependent.test_identity
example (S X : Scheme.{u}) (f : X ⟶ S) : TorIndependent (𝟙 S) f := by sorry
-- test: AlgebraicGeometry.TorIndependent.test_self_closed_point
example (k : Type u) [Field k] :
    ¬ TorIndependent (Spec.map (CommRingCat.ofHom (Polynomial.constantCoeff : Polynomial k →+* k)))
      (Spec.map (CommRingCat.ofHom (Polynomial.constantCoeff : Polynomial k →+* k))) := by sorry
-- test: AlgebraicGeometry.TorIndependent.test_disjoint_points
example (k : Type u) [Field k] :
    TorIndependent (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))))
      (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (1 : k)))) := by sorry
-- test: AlgebraicGeometry.TorIndependent.test_correspondence
example (k : Type u) [Field k] :
    let A := Polynomial k
    let B := A ⧸ Ideal.span {(Polynomial.X^2 : A)}
    let q := Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (Ideal.span {(Polynomial.X^2 : A)})))
    TorIndependent (𝟙 (Spec (CommRingCat.of A))) q ∧
      ¬ TorIndependent (Spec.map (CommRingCat.ofHom (Polynomial.constantCoeff : A →+* k))) q := by sorry
end AlgebraicGeometry

-- The following data signatures use the already planned base-packet henselization carrier.
-- They are included for elaboration; the base packet remains its sole definition owner.
namespace TauCeti.Henselization
variable {R : Type u} [CommRing R]
def algebra (I : Ideal R) : CommAlgCat.{u} R := sorry
abbrev extended (I : Ideal R) : Ideal (algebra I) := I.map (algebraMap R (algebra I))
def reducedMap (I : Ideal R) (B : CommAlgCat.{u} R) : R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap _ (algebraMap R B) Ideal.le_comap_map
def reduction (I : Ideal R) : algebra I →ₐ[R] R ⧸ I := sorry
def map {S : Type u} [CommRing S] (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (h : I ≤ J.comap f) : algebra I →+* algebra J := sorry
end TauCeti.Henselization

namespace TauCeti
-- node: SchemeAndStackFoundations:SF.0/ind-etale-algebra
/-- A genuine filtered étale-colimit predicate, for the specified algebra structure. -/
def IndEtale (R S : Type u) [CommRing R] [CommRing S] [Algebra R S] : Prop :=
  ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ CommAlgCat.{u} R),
    (∀ j, Algebra.Etale R (D.obj j)) ∧ Nonempty (colimit D ≅ CommAlgCat.of R S)
namespace IndEtale
variable {R S T A : Type u} [CommRing R] [CommRing S] [CommRing T] [CommRing A]
variable [Algebra R S] [Algebra R T] [Algebra R A]
theorem of_etale [Algebra.Etale R S] : IndEtale R S := sorry
theorem of_algEquiv (e : S ≃ₐ[R] T) (h : IndEtale R S) : IndEtale R T := sorry
theorem flat (h : IndEtale R S) : Module.Flat R S := sorry
theorem weaklyEtale (h : IndEtale R S) : Algebra.WeaklyEtale R S := sorry
theorem baseChange (h : IndEtale R S) : IndEtale A (A ⊗[R] S) := sorry
theorem algHom_bijective_of_henselianRing (h : IndEtale R S) (I : Ideal A)
    [HenselianRing A I] :
    Function.Bijective (fun f : S →ₐ[R] A => (Ideal.Quotient.mkₐ R I).comp f) := sorry
-- test: TauCeti.IndEtale.test_localization_atPrime
example (p : Ideal ℤ) [p.IsPrime] : IndEtale ℤ (Localization.AtPrime p) := by sorry
-- test: TauCeti.IndEtale.test_zmod_two
example : ¬ IndEtale ℤ (ZMod 2) := by sorry
-- test: TauCeti.IndEtale.test_polynomial_not_indEtale
example : ¬ IndEtale ℚ (Polynomial ℚ) := by sorry
-- test: TauCeti.IndEtale.test_lift_sqrt_neg_one
-- Apply algHom_bijective_of_henselianRing to the standard étale localization of
-- Z[T]/(T²+1) at 2T; the two residue maps send T to 2 and 3.
example (S : Type u) [CommRing S] [Algebra ℤ S] [Algebra.Etale ℤ S]
    [HenselianRing (PadicInt 5) (Ideal.span {(5 : PadicInt 5)})] :
    Function.Bijective (fun f : S →ₐ[ℤ] PadicInt 5 =>
      (Ideal.Quotient.mkₐ ℤ (Ideal.span {(5 : PadicInt 5)})).comp f) := by sorry
-- test: TauCeti.IndEtale.test_self
example : IndEtale R R ∧ IndEtale R (R ⧸ (⊤ : Ideal R)) := by sorry
end IndEtale
namespace Module.Flat
 theorem of_isColimit_of_isFiltered {R : Type u} [CommRing R]
    {J : Type u} [SmallCategory J] [IsFiltered J] (D : J ⥤ ModuleCat.{u} R)
    (c : Cocone D) (hc : IsColimit c) (h : ∀ j, _root_.Module.Flat R (D.obj j)) :
    _root_.Module.Flat R c.pt := sorry
-- The fully varying-ring/module diagram is deferred to the dependent-module category.
-- This is its consumer-used special case: a fixed R-module flat over every stage.
 theorem of_flat_over_colimit_stages {J : Type u} [SmallCategory J] [IsFiltered J]
    (D : J ⥤ CommRingCat.{u}) (c : Cocone D) (hc : IsColimit c)
    (M : ModuleCat.{u} c.pt)
    (h : ∀ j, letI := (c.ι.app j).hom.toAlgebra; letI := Module.compHom M (c.ι.app j).hom; _root_.Module.Flat (D.obj j) M) :
    _root_.Module.Flat c.pt M := sorry
end Module.Flat
end TauCeti

namespace TauCeti.Henselization
variable {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
-- node: SchemeAndStackFoundations:SF.0/henselization-flat
theorem indEtale (I : Ideal R) : TauCeti.IndEtale R (algebra I) := sorry
theorem flat (I : Ideal R) : Module.Flat R (algebra I) := sorry
theorem weaklyEtale (I : Ideal R) : Algebra.WeaklyEtale R (algebra I) := sorry
def tensorExtendedIdealEquiv (I : Ideal R) :
    (algebra I ⊗[R] I) ≃ₗ[algebra I] extended I := sorry
theorem faithfullyFlat_iff_le_jacobson (I : Ideal R) :
    Module.FaithfullyFlat R (algebra I) ↔ I ≤ Ideal.jacobson ⊥ := sorry
-- test: TauCeti.Henselization.test_not_faithfullyFlat_five
example : IsUnit (algebraMap ℤ (algebra (Ideal.span {(5 : ℤ)})) 2) ∧
    ¬ Module.FaithfullyFlat ℤ (algebra (Ideal.span {(5 : ℤ)})) := by sorry
-- test: TauCeti.Henselization.test_faithfullyFlat_local
example [IsLocalRing R] : Module.FaithfullyFlat R (algebra (IsLocalRing.maximalIdeal R)) := by sorry
-- test: TauCeti.Henselization.test_top
example : Subsingleton (algebra (⊤ : Ideal R)) ∧ Module.Flat R (algebra (⊤ : Ideal R)) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-quotient-pow
def quotientPowEquiv (I : Ideal R) (n : ℕ) :
    (R ⧸ I ^ n) ≃ₐ[R] (algebra I ⧸ extended I ^ n) := sorry
theorem quotientPowEquiv_mk (I : Ideal R) (n : ℕ) (r : R) :
    quotientPowEquiv I n (Ideal.Quotient.mk (I ^ n) r) =
      Ideal.Quotient.mk (extended I ^ n) (algebraMap R (algebra I) r) := sorry
theorem extendedIdeal_pow (I : Ideal R) (n : ℕ) :
    extended I ^ n = (I ^ n).map (algebraMap R (algebra I)) := sorry
def quotientEquivOfPowLe (I J : Ideal R) (n : ℕ) (h : I ^ n ≤ J) :
    (R ⧸ J) ≃ₐ[R] (algebra I ⧸ J.map (algebraMap R (algebra I))) := sorry
def adicCompletionEquiv (I : Ideal R) :
    AdicCompletion I R ≃+* AdicCompletion (extended I) (algebra I) := sorry
theorem neighbourhood_quotientPow_bijective (I : Ideal R) (B : CommAlgCat.{u} R)
    [Algebra.Etale R B] (h : Function.Bijective (reducedMap I B)) (n : ℕ) :
    Function.Bijective (Ideal.quotientMap ((I ^ n).map (algebraMap R B))
      (algebraMap R B) Ideal.le_comap_map) := sorry
-- test: TauCeti.Henselization.test_quotientPow_sqrt_neg_one
example (a : algebra (Ideal.span {(5 : ℤ)})) (ha : a ^ 2 = -1)
    (hmod : a - 2 ∈ extended (Ideal.span {(5 : ℤ)})) :
    Ideal.Quotient.mk (extended (Ideal.span {(5 : ℤ)}) ^ 2) a =
      quotientPowEquiv (Ideal.span {(5 : ℤ)}) 2 (Ideal.Quotient.mk _ 7) := by sorry
-- test: TauCeti.Henselization.test_quotientPow_zero
example (I : Ideal R) : Subsingleton (R ⧸ I ^ 0) ∧
    Subsingleton (algebra I ⧸ extended I ^ 0) := by sorry
-- test: TauCeti.Henselization.test_not_neighbourhood_gaussian
-- Concrete Gaussian presentation is included in the finite-algebra tests below.
example : ¬ Function.Bijective (reducedMap (Ideal.span {(5 : ℤ)}) (CommAlgCat.of ℤ (ℤ × ℤ))) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-noetherian
theorem isNoetherianRing (I : Ideal R) [IsNoetherianRing R] : IsNoetherianRing (algebra I) := sorry
def toCompletion (I : Ideal R) : algebra I →+* AdicCompletion I R := sorry
 theorem faithfullyFlat_toCompletion (I : Ideal R) [IsNoetherianRing R] :
    letI := (toCompletion I).toAlgebra; Module.FaithfullyFlat (algebra I) (AdicCompletion I R) := sorry
 theorem faithfullyFlat_completion_iff (I : Ideal R) [IsNoetherianRing R] :
    Module.FaithfullyFlat R (AdicCompletion I R) ↔ I ≤ Ideal.jacobson ⊥ := sorry
-- test: TauCeti.Henselization.test_isNoetherian_five
example : IsNoetherianRing (algebra (Ideal.span {(5 : ℤ)})) := by sorry
-- test: TauCeti.Henselization.test_completion_not_faithfullyFlat
example : Module.Flat ℤ (AdicCompletion (Ideal.span {(5 : ℤ)}) ℤ) ∧
    ¬ Module.FaithfullyFlat ℤ (AdicCompletion (Ideal.span {(5 : ℤ)}) ℤ) := by sorry
-- test: TauCeti.Henselization.test_noetherian_zero_ideal
example [IsNoetherianRing R] : Function.Bijective (toCompletion (⊥ : Ideal R)) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-recognition
def IsHenselization (I : Ideal R) (π : S →ₐ[R] R ⧸ I) : Prop :=
    Function.Surjective π ∧ TauCeti.IndEtale R S ∧ HenselianRing S (RingHom.ker π.toRingHom)
def equivOfIndEtale (I : Ideal R) (π : S →ₐ[R] R ⧸ I) (h : IsHenselization I π) :
    algebra I ≃ₐ[R] S := sorry
theorem equivOfIndEtale_reduction (I : Ideal R) (π : S →ₐ[R] R ⧸ I) (h : IsHenselization I π) :
    π.comp (equivOfIndEtale I π h).toAlgHom = reduction I := sorry
theorem IsHenselization.ker_eq (I : Ideal R) (π : S →ₐ[R] R ⧸ I) (h : IsHenselization I π) :
    RingHom.ker π.toRingHom = I.map (algebraMap R S) := sorry
 theorem IsHenselization.unique {T : Type u} [CommRing T] [Algebra R T]
    (I : Ideal R) (π : S →ₐ[R] R ⧸ I) (π' : T →ₐ[R] R ⧸ I)
    (h : IsHenselization I π) (h' : IsHenselization I π') :
    ∃! e : S ≃ₐ[R] T, π'.comp e.toAlgHom = π := sorry
-- test: TauCeti.Henselization.test_recognition_padic_fails
example : ¬ TauCeti.IndEtale ℤ (PadicInt 5) := by sorry
-- test: TauCeti.Henselization.test_recognition_quotient_fails
example : ¬ TauCeti.IndEtale ℤ (ZMod 5) := by sorry
-- test: TauCeti.Henselization.test_recognition_self
example (I : Ideal R) : IsHenselization I (reduction I) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-integral-base-change
def equivOfRadicalEq (I J : Ideal R) (h : I.radical = J.radical) : algebra I ≃ₐ[R] algebra J := sorry
def tensorEquivOfIsIntegral [Algebra.IsIntegral R S] (I : Ideal R) (J : Ideal S)
    (h : J.radical = (I.map (algebraMap R S)).radical) :
    S ⊗[R] algebra I ≃ₐ[S] algebra J := sorry
def quotientEquiv (I J : Ideal R) :
    letI := ((algebraMap (R ⧸ J) (algebra (I.map (Ideal.Quotient.mk J)))).comp (Ideal.Quotient.mk J)).toAlgebra;
    (algebra I ⧸ J.map (algebraMap R (algebra I))) ≃ₐ[R]
      algebra (I.map (Ideal.Quotient.mk J)) := sorry
def piEquivOfPairwiseCoprime {ι : Type u} [Fintype ι] (I : ι → Ideal R)
    (h : Pairwise (fun i j => I i ⊔ I j = ⊤)) :
    algebra (⨅ i, I i) ≃ₐ[R] (∀ i, algebra (I i)) := sorry
-- test: TauCeti.Henselization.test_nonintegral_base_change
example : ¬ IsUnit (1 + 5 * Polynomial.X : Polynomial (algebra (Ideal.span {(5 : ℤ)}))) ∧
    IsUnit (1 + 5 * algebraMap (Polynomial ℤ)
      (algebra (Ideal.span {(5 : Polynomial ℤ)})) Polynomial.X) := by sorry
-- test: TauCeti.Henselization.test_quotient_twentyfive
example : Nonempty (algebra (Ideal.span {(5 : ℤ)}) ⧸
    (Ideal.span {(25 : ℤ)}).map (algebraMap ℤ (algebra (Ideal.span {(5 : ℤ)}))) ≃+* ZMod 25) := by sorry
-- test: TauCeti.Henselization.test_radical_twentyfive
example : Nonempty (algebra (Ideal.span {(25 : ℤ)}) ≃ₐ[ℤ] algebra (Ideal.span {(5 : ℤ)})) := by sorry
-- test: TauCeti.Henselization.test_coprime_six
example : Nonempty (algebra (Ideal.span {(6 : ℤ)}) ≃ₐ[ℤ]
    (algebra (Ideal.span {(2 : ℤ)}) × algebra (Ideal.span {(3 : ℤ)}))) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-local-ring
instance isLocalRing [IsLocalRing R] : IsLocalRing (algebra (IsLocalRing.maximalIdeal R)) := sorry
instance henselianLocalRing [IsLocalRing R] : HenselianLocalRing (algebra (IsLocalRing.maximalIdeal R)) := sorry
def residueFieldEquiv [IsLocalRing R] : IsLocalRing.ResidueField R ≃+*
    IsLocalRing.ResidueField (algebra (IsLocalRing.maximalIdeal R)) := sorry
def liftLocal [IsLocalRing R] [HenselianLocalRing S] (f : R →+* S) [IsLocalHom f] :
    algebra (IsLocalRing.maximalIdeal R) →+* S := sorry
-- A DVR is geometrically unibranch; an arbitrary local domain need not stay a domain.
instance domain_of_dvr [IsDomain R] [IsDiscreteValuationRing R] :
    IsDomain (algebra (IsLocalRing.maximalIdeal R)) := sorry
instance isDiscreteValuationRing [IsDomain R] [IsDiscreteValuationRing R]
    :
    IsDiscreteValuationRing (algebra (IsLocalRing.maximalIdeal R)) := sorry
-- test: TauCeti.Henselization.test_local_no_sqrt_two
example : ¬ ∃ x : algebra (Ideal.span {(5 : ℤ)}), x ^ 2 = 2 := by sorry
-- test: TauCeti.Henselization.test_local_field
example (K : Type u) [Field K] : Function.Bijective (algebraMap K (algebra (⊥ : Ideal K))) := by sorry
-- test: TauCeti.Henselization.test_local_complete
example [HenselianLocalRing R] :
    Function.Bijective (algebraMap R (algebra (IsLocalRing.maximalIdeal R))) := by sorry
-- test: TauCeti.Henselization.test_local_dvr
example [IsDomain R] [IsDiscreteValuationRing R]
    :
    IsDiscreteValuationRing (algebra (IsLocalRing.maximalIdeal R)) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselization-at-prime
def atPrime (p : Ideal R) [p.IsPrime] := algebra (IsLocalRing.maximalIdeal (Localization.AtPrime p))
namespace atPrime
instance henselianLocalRing (p : Ideal R) [p.IsPrime] : HenselianLocalRing (atPrime p) := sorry
def residueFieldEquiv (p : Ideal R) [p.IsPrime] :
    p.ResidueField ≃+* IsLocalRing.ResidueField (atPrime p) := sorry
-- The composite R→R_p→R_p^h determines these scalar structures.
instance algebra (p : Ideal R) [p.IsPrime] : Algebra R (atPrime p) := sorry
 theorem indEtale (p : Ideal R) [p.IsPrime] : TauCeti.IndEtale R (atPrime p) := sorry
def map {S : Type u} [CommRing S] (f : R →+* S) (p : Ideal R) [p.IsPrime]
    (q : Ideal S) [q.IsPrime] (h : q.comap f = p) : atPrime p →+* atPrime q := sorry
end atPrime
def equivAtPrimeOfIsMaximal (p : Ideal R) [p.IsMaximal] : algebra p ≃ₐ[R] atPrime p := sorry
-- test: TauCeti.Henselization.test_atPrime_five
example (p : Ideal ℤ) [p.IsMaximal] (hp : p = Ideal.span {(5 : ℤ)}) :
    Nonempty (algebra p ≃ₐ[ℤ] atPrime p) := by sorry
-- test: TauCeti.Henselization.test_pair_vs_prime
example : ¬ IsLocalRing (algebra (Ideal.span {(5 : Polynomial ℤ)})) := by sorry
-- test: TauCeti.Henselization.test_atPrime_field
example (K : Type u) [Field K] :
    Function.Bijective (algebraMap K (atPrime (⊥ : Ideal K))) := by sorry
-- test: TauCeti.Henselization.test_atPrime_residue
example (p : Ideal ℤ) [p.IsPrime] (hp : p = Ideal.span {(5 : ℤ)}) :
    Nonempty (IsLocalRing.ResidueField (atPrime p) ≃+* ZMod 5) := by sorry
end TauCeti.Henselization
namespace TauCeti.AdicCompletion
 theorem isNoetherianRing {R : Type u} [CommRing R] [IsNoetherianRing R] (I : Ideal R) :
    IsNoetherianRing (_root_.AdicCompletion I R) := sorry
end TauCeti.AdicCompletion
namespace AlgebraicGeometry.Scheme
 def henselization (X : Scheme.{u}) (x : X) : CommRingCat.{u} :=
    .of (TauCeti.Henselization.algebra (IsLocalRing.maximalIdeal (X.presheaf.stalk x)))
-- test: AlgebraicGeometry.Scheme.test_henselization_spec
example (R : CommRingCat.{u}) (x : Spec R) :
    letI := x.isPrime; Nonempty (henselization (Spec R) x ≅
      .of (TauCeti.Henselization.atPrime x.asIdeal)) := by sorry
end AlgebraicGeometry.Scheme

namespace TauCeti
/-- Pair carrier for filtered diagrams; morphisms preserve the distinguished ideal. -/
structure RingPair where
  ring : CommRingCat.{u}
  ideal : Ideal ring
namespace RingPair
structure Hom (A B : RingPair.{u}) where
  ringHom : A.ring →+* B.ring
  ideal_le : A.ideal ≤ B.ideal.comap ringHom
instance : Category RingPair.{u} where
  Hom := Hom
  id A := ⟨RingHom.id A.ring, by sorry⟩
  comp f g := ⟨g.ringHom.comp f.ringHom, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
def forget : RingPair.{u} ⥤ CommRingCat.{u} where
  obj A := A.ring
  map f := CommRingCat.ofHom f.ringHom
  map_id := by sorry
  map_comp := by sorry
def hensel : RingPair.{u} ⥤ CommRingCat.{u} where
  obj A := .of (Henselization.algebra A.ideal)
  map f := CommRingCat.ofHom (Henselization.map _ _ f.ringHom f.ideal_le)
  map_id := by sorry
  map_comp := by sorry
def colimitIdeal {J : Type u} [SmallCategory J] [IsFiltered J]
    (D : J ⥤ RingPair.{u}) (c : Cocone (D ⋙ forget)) : Ideal c.pt :=
  ⨆ j, (D.obj j).ideal.map (c.ι.app j).hom
end RingPair
end TauCeti
namespace TauCeti.Henselization
-- node: SchemeAndStackFoundations:SF.0/henselization-filtered-colimit
variable {J : Type u} [SmallCategory J] [IsFiltered J]
variable (D : J ⥤ TauCeti.RingPair.{u}) (c : Cocone (D ⋙ TauCeti.RingPair.forget))
def mapCocone : Cocone (D ⋙ TauCeti.RingPair.hensel) where
  pt := .of (algebra (TauCeti.RingPair.colimitIdeal D c))
  ι := { app := fun j => CommRingCat.ofHom
          (map (D.obj j).ideal (TauCeti.RingPair.colimitIdeal D c) (c.ι.app j).hom (by sorry))
         naturality := by sorry }
def colimitIso (hc : IsColimit c) : colimit (D ⋙ TauCeti.RingPair.hensel) ≅
    CommRingCat.of (algebra (TauCeti.RingPair.colimitIdeal D c)) := sorry
 theorem colimitIso_comp_map (hc : IsColimit c) (j : J) :
    colimit.ι (D ⋙ TauCeti.RingPair.hensel) j ≫ (colimitIso D c hc).hom =
      (mapCocone D c).ι.app j := sorry
 def isColimit_mapCocone (hc : IsColimit c) : IsColimit (mapCocone D c) := sorry
 theorem colimitIso_extendedIdeal (hc : IsColimit c) :
    (⨆ j, (extended (D.obj j).ideal).map ((mapCocone D c).ι.app j).hom) =
      extended (TauCeti.RingPair.colimitIdeal D c) := sorry
-- test: TauCeti.Henselization.test_colimit_localization
-- The diagram of Z[1/n], (n,5)=1, supplies D, c and hc here.
example (hc : IsColimit c) : Nonempty (colimit (D ⋙ TauCeti.RingPair.hensel) ≅
    CommRingCat.of (algebra (TauCeti.RingPair.colimitIdeal D c))) := by sorry
-- test: TauCeti.Henselization.test_moret_bailly
example : ¬ HenselianRing (PadicInt 3 ⊗[ℤ] PadicInt 3)
    (Ideal.span {(3 : PadicInt 3 ⊗[ℤ] PadicInt 3)}) := by sorry
-- test: TauCeti.Henselization.test_colimit_constant
-- The constant one-object diagram is the identity case of colimitIso.
example {R : Type u} [CommRing R] (I : Ideal R) :
    Nonempty (algebra I ≃ₐ[R] algebra I) := by sorry
end TauCeti.Henselization

namespace TauCeti.HenselianRing
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
-- node: SchemeAndStackFoundations:SF.0/henselian-pair-characterisations
 theorem exists_isRoot_of_isUnit_derivative (I : Ideal A) [HenselianRing A I]
    (f : Polynomial A) (a₀ : A) (hroot : f.eval a₀ ∈ I)
    (hderiv : IsUnit (Ideal.Quotient.mk I (f.derivative.eval a₀))) :
    ∃! a : A, f.IsRoot a ∧ a - a₀ ∈ I := sorry
 theorem exists_algHom_lift_of_etale [Algebra A B] [Algebra.Etale A B]
    (I : Ideal A) [HenselianRing A I] (σ : B →ₐ[A] A ⧸ I) :
    ∃! s : B →ₐ[A] A, (Ideal.Quotient.mkₐ A I).comp s = σ := sorry
 theorem exists_monic_factorization (I : Ideal A) [HenselianRing A I]
    (f : Polynomial A) (hf : f.Monic) (g₀ h₀ : Polynomial (A ⧸ I))
    (hg : g₀.Monic) (hh : h₀.Monic) (hc : IsCoprime g₀ h₀)
    (heq : f.map (Ideal.Quotient.mk I) = g₀ * h₀) :
    ∃ g h : Polynomial A, g.Monic ∧ h.Monic ∧ f = g * h ∧
      g.map (Ideal.Quotient.mk I) = g₀ ∧ h.map (Ideal.Quotient.mk I) = h₀ := sorry
abbrev Idempotents (A : Type u) [CommRing A] := {e : A // e * e = e}
def reduceIdempotents [Algebra A B] (I : Ideal A) : Idempotents B →
    Idempotents (B ⧸ I.map (algebraMap A B)) := sorry
 theorem idempotent_bijective_of_isIntegral [Algebra A B] [Algebra.IsIntegral A B]
    (I : Ideal A) [HenselianRing A I] : Function.Bijective (reduceIdempotents (B := B) I) := sorry
def gabberPolynomial (n : ℕ) (a : Fin (n + 1) → A) : Polynomial A :=
  Polynomial.X ^ n * (Polynomial.X - 1) +
    ∑ i : Fin (n + 1), Polynomial.C (a i) * Polynomial.X ^ (i : ℕ)
 theorem exists_gabber_root (I : Ideal A) [HenselianRing A I] (n : ℕ) (hn : 1 ≤ n)
    (a : Fin (n + 1) → A) (ha : ∀ i, a i ∈ I) :
    ∃! x : A, (gabberPolynomial n a).IsRoot x ∧ x - 1 ∈ I := sorry
/-- All six conditions, retaining the Jacobson condition where it is essential. -/
def Characterisations (I : Ideal A) : List Prop :=
  [HenselianRing A I,
   (I ≤ Ideal.jacobson ⊥ ∧ ∀ f : Polynomial A, ∀ a : A,
      f.eval a ∈ I → IsUnit (Ideal.Quotient.mk I (f.derivative.eval a)) →
      ∃ x : A, f.IsRoot x ∧ x - a ∈ I),
   (I ≤ Ideal.jacobson ⊥ ∧ ∀ B : CommAlgCat.{u} A, Algebra.Etale A B →
      ∀ σ : B →ₐ[A] A ⧸ I, ∃ s : B →ₐ[A] A, (Ideal.Quotient.mkₐ A I).comp s = σ),
   (I ≤ Ideal.jacobson ⊥ ∧ ∀ f : Polynomial A, f.Monic →
      ∀ g₀ h₀ : Polynomial (A ⧸ I), g₀.Monic → h₀.Monic → IsCoprime g₀ h₀ →
      f.map (Ideal.Quotient.mk I) = g₀ * h₀ →
      ∃ g h : Polynomial A, g.Monic ∧ h.Monic ∧ f = g * h ∧
        g.map (Ideal.Quotient.mk I) = g₀ ∧ h.map (Ideal.Quotient.mk I) = h₀),
   (∀ B : CommAlgCat.{u} A, Module.Finite A B → Function.Bijective (reduceIdempotents (B := B) I)),
   (I ≤ Ideal.jacobson ⊥ ∧ ∀ n : ℕ, 1 ≤ n → ∀ a : Fin (n + 1) → A,
     (∀ i, a i ∈ I) → ∃ x : A, (gabberPolynomial n a).IsRoot x ∧ x - 1 ∈ I)]
 theorem tfae (I : Ideal A) : (Characterisations I).TFAE := sorry
-- test: TauCeti.HenselianRing.test_nonmonic_padic
example : ∃ x : PadicInt 5, 6 * x = 1 ∧ x - 1 ∈ Ideal.span {(5 : PadicInt 5)} := by sorry
-- test: TauCeti.HenselianRing.test_localization_not_henselian
example (p : Ideal ℤ) [p.IsPrime] (hp : p = Ideal.span {(5 : ℤ)}) :
    ¬ HenselianLocalRing (Localization.AtPrime p) := by sorry
-- test: TauCeti.HenselianRing.test_integers_not_henselian
example : ¬ HenselianRing ℤ (Ideal.span {(5 : ℤ)}) := by sorry
-- test: TauCeti.HenselianRing.test_local_iff
example [IsLocalRing A] : HenselianLocalRing A ↔ HenselianRing A (IsLocalRing.maximalIdeal A) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselian-pair-permanence
 theorem of_isNil (I : Ideal A) (h : ∀ x ∈ I, IsNilpotent x) : HenselianRing A I := sorry
 theorem of_le (I J : Ideal A) [HenselianRing A I] (h : J ≤ I) : HenselianRing A J := sorry
 theorem of_isIntegral [Algebra A B] [Algebra.IsIntegral A B] (I : Ideal A)
    [HenselianRing A I] : HenselianRing B (I.map (algebraMap A B)) := sorry
 theorem iff_of_radical_eq (I J : Ideal A) (h : I.radical = J.radical) :
    HenselianRing A I ↔ HenselianRing A J := sorry
 theorem of_isColimit {J : Type u} [SmallCategory J] [IsFiltered J]
    (D : J ⥤ TauCeti.RingPair.{u}) (c : Cocone (D ⋙ TauCeti.RingPair.forget))
    (hc : IsColimit c) (h : ∀ j, HenselianRing (D.obj j).ring (D.obj j).ideal) :
    HenselianRing c.pt (TauCeti.RingPair.colimitIdeal D c) := sorry
def productIdeal {ι : Type u} (R : ι → Type u) [∀ i, CommRing (R i)]
    (I : ∀ i, Ideal (R i)) : Ideal (∀ i, R i) := sorry
 theorem pi_iff {ι : Type u} (R : ι → Type u) [∀ i, CommRing (R i)]
    (I : ∀ i, Ideal (R i)) : HenselianRing (∀ i, R i) (productIdeal R I) ↔
    ∀ i, HenselianRing (R i) (I i) := sorry
-- test: TauCeti.HenselianRing.test_zmod_eight
example : HenselianRing (ZMod 8) (Ideal.span {(2 : ZMod 8)}) ∧
    ∃ x : ZMod 8, x ^ 2 - x + 2 = 0 ∧ x ∈ Ideal.span {(2 : ZMod 8)} := by sorry
-- test: TauCeti.HenselianRing.test_product
example : HenselianRing (ZMod 4 × PadicInt 5)
    ((Ideal.span {(2 : ZMod 4)}).prod (Ideal.span {(5 : PadicInt 5)})) := by sorry
-- test: TauCeti.HenselianRing.test_subideal
example : HenselianRing (PadicInt 5) (Ideal.span {(25 : PadicInt 5)}) := by sorry
-- test: TauCeti.HenselianRing.test_not_henselian_integers
example : ¬ HenselianRing ℤ (Ideal.span {(5 : ℤ)}) := by sorry
-- test: TauCeti.HenselianRing.test_zero_ideal
example : HenselianRing A (⊥ : Ideal A) := by sorry
end TauCeti.HenselianRing
namespace TauCeti.IsAdicComplete
 theorem of_isNilpotent {A : Type u} [CommRing A] (I : Ideal A) (h : IsNilpotent I) :
    _root_.IsAdicComplete I A := sorry
end TauCeti.IsAdicComplete
namespace TauCeti.HenselianLocalRing
variable {A : Type u} [CommRing A] [IsLocalRing A]
 theorem of_henselianRing_maximalIdeal [HenselianRing A (IsLocalRing.maximalIdeal A)] :
    HenselianLocalRing A := sorry
 theorem iff_henselianRing_maximalIdeal : HenselianLocalRing A ↔
    HenselianRing A (IsLocalRing.maximalIdeal A) := sorry
end TauCeti.HenselianLocalRing

namespace TauCeti.HenselianRing
variable {A : Type u} [CommRing A] (I : Ideal A)
-- node: SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence
def finiteEtaleEquivalence [HenselianRing A I] :
    CommAlgCat.FiniteEtale.{u} A ≌ CommAlgCat.FiniteEtale.{u} (A ⧸ I) := sorry
 theorem finiteEtale_hom_bijective [HenselianRing A I] (B C : CommAlgCat.FiniteEtale.{u} A) :
    Function.Bijective (fun f : B ⟶ C => (CommAlgCat.FiniteEtale.baseChange A (A ⧸ I)).map f) := sorry
 theorem exists_finiteEtale_lift [HenselianRing A I] (C : CommAlgCat.FiniteEtale.{u} (A ⧸ I)) :
    ∃ B : CommAlgCat.FiniteEtale.{u} A,
      Nonempty ((CommAlgCat.FiniteEtale.baseChange A (A ⧸ I)).obj B ≅ C) := sorry
abbrev FiniteProjective (A : Type u) [CommRing A] :=
  ObjectProperty.FullSubcategory (fun M : ModuleCat.{u} A => Module.Finite A M ∧ Module.Projective A M)
def projectiveReduction : Skeleton (FiniteProjective A) → Skeleton (FiniteProjective (A ⧸ I)) := sorry
 theorem projective_lift_bijective [HenselianRing A I] : Function.Bijective (projectiveReduction I) := sorry
-- Tests use explicit polynomial quotient presentations rather than the equivalence itself.
abbrev quadratic (A : Type u) [CommRing A] (a : A) :=
  Polynomial A ⧸ Ideal.span {Polynomial.X ^ 2 - Polynomial.C a}
-- test: TauCeti.HenselianRing.test_finiteEtale_fp25
example : IsDomain (quadratic (ZMod 5) 2) ∧ Nat.card (quadratic (ZMod 5) 2) = 25 := by sorry
-- test: TauCeti.HenselianRing.test_finiteEtale_not_full
example : ¬ ∃ x : Localization.Away (2 : ℤ), x ^ 2 = -1 := by sorry
-- test: TauCeti.HenselianRing.test_finiteEtale_zero_ideal
example : Function.Bijective (projectiveReduction (⊥ : Ideal A)) := by sorry
-- node: SchemeAndStackFoundations:SF.0/henselian-smooth-lifting
 theorem exists_lift_of_smooth {R S : Type u} [CommRing R] [CommRing S]
    [Algebra R S] [Algebra R A] [Algebra.Smooth R S] [HenselianRing A I]
    (σ : S →ₐ[R] A ⧸ I) : ∃ s : S →ₐ[R] A, (Ideal.Quotient.mkₐ R I).comp s = σ := sorry
-- test: TauCeti.HenselianRing.test_smooth_conic
example : ∃ a : TauCeti.Henselization.algebra (Ideal.span {(5 : ℤ)}),
    a ^ 2 + 0 ^ 2 + 1 = 0 ∧ a - 2 ∈ TauCeti.Henselization.extended (Ideal.span {(5 : ℤ)}) := by sorry
-- test: TauCeti.HenselianRing.test_smooth_nonunique
example : (0 : PadicInt 5) ≠ 5 ∧ Ideal.Quotient.mk (Ideal.span {(5 : PadicInt 5)}) 0 =
    Ideal.Quotient.mk (Ideal.span {(5 : PadicInt 5)}) 5 := by sorry
-- test: TauCeti.HenselianRing.test_smooth_needs_henselian
example : ¬ ∃ x : ℤ, x ^ 2 + 1 = 0 ∧ x - 2 ∈ Ideal.span {(5 : ℤ)} := by sorry
-- test: TauCeti.HenselianRing.test_smooth_complete
example {S : Type u} [CommRing S] [Algebra ℤ S] [Algebra.Smooth ℤ S]
    (σ : S →ₐ[ℤ] PadicInt 5 ⧸ Ideal.span {(5 : PadicInt 5)}) :
    ∃ s : S →ₐ[ℤ] PadicInt 5, (Ideal.Quotient.mkₐ ℤ _).comp s = σ := by sorry
-- test: TauCeti.HenselianRing.test_smooth_zero_ideal
example {S : Type u} [CommRing S] [Algebra A S] (σ : S →ₐ[A] A ⧸ (⊥ : Ideal A)) :
    ∃ s : S →ₐ[A] A, (Ideal.Quotient.mkₐ A (⊥ : Ideal A)).comp s = σ := by sorry
end TauCeti.HenselianRing

namespace TauCeti.HenselianLocalRing
variable {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
-- node: SchemeAndStackFoundations:SF.0/henselian-local-finite-algebras
abbrev MaximalIdeals (S : Type u) [CommRing S] := {q : Ideal S // q.IsMaximal}
instance (q : MaximalIdeals S) : q.val.IsPrime := q.property.isPrime
 def finite_algebra_equiv_pi [HenselianLocalRing R] [Module.Finite R S] :
    S ≃ₐ[R] (∀ q : MaximalIdeals S, Localization.AtPrime q.val) := sorry
 theorem of_finite_isLocalRing [HenselianLocalRing R] [Module.Finite R S] [IsLocalRing S] :
    HenselianLocalRing S := sorry
 theorem exists_quasiFinite_splitting [HenselianLocalRing R] [Algebra.FiniteType R S]
    (q : Ideal S) [q.IsPrime] (h : q.comap (algebraMap R S) = IsLocalRing.maximalIdeal R)
    [Algebra.QuasiFiniteAt R q] : ∃ T : CommAlgCat.{u} R,
      Module.Finite R (Localization.AtPrime q) ∧
      Nonempty (S ≃ₐ[R] (Localization.AtPrime q × T)) := sorry
 theorem of_forall_finite_pi_local [IsLocalRing R]
    (h : ∀ S : CommAlgCat.{u} R, Module.Finite R S →
      ∃ (ι : Type u) (_ : Fintype ι) (T : ι → CommAlgCat.{u} R),
        (∀ i, IsLocalRing (T i)) ∧ Nonempty (S ≃ₐ[R] (∀ i, T i))) : HenselianLocalRing R := sorry
 def finiteEtaleEquivResidueField [HenselianLocalRing R] : CommAlgCat.FiniteEtale.{u} R ≌
    ObjectProperty.FullSubcategory (fun B : CommAlgCat.{u} (IsLocalRing.ResidueField R) =>
      Algebra.Etale (IsLocalRing.ResidueField R) B) := sorry
-- test: TauCeti.HenselianLocalRing.test_gaussian_split
example : Nonempty (TauCeti.HenselianRing.quadratic
    (TauCeti.Henselization.algebra (Ideal.span {(5 : ℤ)})) (-1) ≃+*
    (TauCeti.Henselization.algebra (Ideal.span {(5 : ℤ)}) ×
      TauCeti.Henselization.algebra (Ideal.span {(5 : ℤ)}))) := by sorry
-- test: TauCeti.HenselianLocalRing.test_not_split_localization
example (p : Ideal ℤ) [p.IsPrime] (hp : p = Ideal.span {(5 : ℤ)}) :
    IsDomain (TauCeti.HenselianRing.quadratic (Localization.AtPrime p) (-1)) ∧
    Nat.card (MaximalIdeals (TauCeti.HenselianRing.quadratic (Localization.AtPrime p) (-1))) = 2 := by sorry
-- test: TauCeti.HenselianLocalRing.test_finite_trivial
example [HenselianLocalRing R] : Nat.card (MaximalIdeals R) = 1 := by sorry
-- test: TauCeti.HenselianLocalRing.test_affine_line_component
example [HenselianLocalRing R] : Nonempty
    ((Polynomial R ⧸ Ideal.span {(Polynomial.X : Polynomial R) ^ 2 - Polynomial.X}) ≃ₐ[R] (R × R)) := by sorry
 theorem exists_section_of_smooth [HenselianLocalRing R] (X : AlgebraicGeometry.Scheme.{u})
    (f : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of R)) [AlgebraicGeometry.Smooth f]
    (x : AlgebraicGeometry.Spec (CommRingCat.of (IsLocalRing.ResidueField R)) ⟶ X)
    (hx : x ≫ f = AlgebraicGeometry.Spec.map (CommRingCat.ofHom (IsLocalRing.residue R))) :
    ∃ s : AlgebraicGeometry.Spec (CommRingCat.of R) ⟶ X,
      s ≫ f = 𝟙 _ ∧ AlgebraicGeometry.Spec.map (CommRingCat.ofHom (IsLocalRing.residue R)) ≫ s = x := sorry
end TauCeti.HenselianLocalRing

namespace TauCeti.Algebra.Smooth
 theorem exists_etale_lift_mod {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [_root_.Algebra.Smooth A B] (I : Ideal A) (σ : B →ₐ[A] A ⧸ I) :
    ∃ C : CommAlgCat.{u} A, _root_.Algebra.Etale A C ∧
      Function.Bijective (TauCeti.Henselization.reducedMap I C) ∧
      ∃ s : B →ₐ[A] C, ∀ b, Ideal.Quotient.mk (I.map (algebraMap A C)) (s b) =
        TauCeti.Henselization.reducedMap I C (σ b) := sorry
end TauCeti.Algebra.Smooth
namespace TauCeti.Module.Projective
 theorem exists_etale_lift_mod {A : Type u} [CommRing A] (I : Ideal A)
    (M : ModuleCat.{u} (A ⧸ I)) [_root_.Module.Finite (A ⧸ I) M]
    [_root_.Module.Projective (A ⧸ I) M] :
    ∃ C : CommAlgCat.{u} A, Algebra.Etale A C ∧
      Function.Bijective (TauCeti.Henselization.reducedMap I C) ∧
      ∃ P : ModuleCat.{u} C, _root_.Module.Finite C P ∧ _root_.Module.Projective C P ∧
        ∃ ρ : C →+* A ⧸ I,
          (∀ c, (TauCeti.Henselization.reducedMap I C)
            (ρ c) = Ideal.Quotient.mk (I.map (algebraMap A C)) c) ∧
          (letI := ρ.toAlgebra; Nonempty ((A ⧸ I) ⊗[C] P ≃ₗ[A ⧸ I] M)) := sorry
end TauCeti.Module.Projective
namespace TauCeti.SymmetricAlgebra
 theorem smooth_of_projective {A M : Type u} [CommRing A] [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] : Algebra.Smooth A (_root_.SymmetricAlgebra A M) := sorry
end TauCeti.SymmetricAlgebra
namespace TauCeti.Henselization
-- node: SchemeAndStackFoundations:SF.0/henselization-padic-example
 def toPadicInt (p : ℕ) [Fact p.Prime] : algebra (Ideal.span {(p : ℤ)}) →+* PadicInt p := sorry
 theorem toPadicInt_injective (p : ℕ) [Fact p.Prime] : Function.Injective (toPadicInt p) := sorry
 theorem range_toPadicInt (p : ℕ) [Fact p.Prime] (x : PadicInt p) :
    x ∈ Set.range (toPadicInt p) ↔ IsAlgebraic ℚ (x : Padic p) := sorry
 theorem countable_padic (p : ℕ) [Fact p.Prime] : Countable (algebra (Ideal.span {(p : ℤ)})) := sorry
 def equivLocalizationAtPrime (p : Ideal ℤ) [p.IsMaximal] :
    algebra p ≃ₐ[ℤ] algebra (IsLocalRing.maximalIdeal (Localization.AtPrime p)) := sorry
-- test: TauCeti.Henselization.test_padic_sqrt_neg_one
example : ∃! a : algebra (Ideal.span {(5 : ℤ)}), a ^ 2 = -1 ∧ a - 2 ∈ extended (Ideal.span {(5 : ℤ)}) := by sorry
-- test: TauCeti.Henselization.test_padic_no_sqrt_two
example : ¬ ∃ a : algebra (Ideal.span {(5 : ℤ)}), a ^ 2 = 2 := by sorry
-- test: TauCeti.Henselization.test_padic_not_surjective
example : ¬ Function.Surjective (toPadicInt 5) := by sorry
-- test: TauCeti.Henselization.test_padic_range
example (x : PadicInt 5) : x ∈ Set.range (toPadicInt 5) ↔ IsAlgebraic ℚ (x : Padic 5) := by sorry
-- test: TauCeti.Henselization.test_field_zero_ideal
example : Function.Bijective (algebraMap (ZMod 5) (algebra (⊥ : Ideal (ZMod 5)))) := by sorry
end TauCeti.Henselization

namespace MonoidPowerPerfection
variable (A : Type u) [CommMonoid A] (p : ℕ)
/-- Eventual equality, not equality at a fixed stage. -/
def relation (x y : ℕ × A) : Prop :=
  ∃ k : ℕ, x.2 ^ (p ^ (y.1 + k)) = y.2 ^ (p ^ (x.1 + k))
def setoid : Setoid (ℕ × A) where
  r := relation A p
  iseqv := by sorry
end MonoidPowerPerfection
-- node: SchemeAndStackFoundations:SF.0/multiplicative-perfection
 def MonoidPowerPerfection (A : Type u) [CommMonoid A] (p : ℕ) : Type u :=
    Quotient (MonoidPowerPerfection.setoid A p)
namespace MonoidPowerPerfection
variable {A B C : Type u} [CommMonoid A] [CommMonoid B] [CommMonoid C] (p : ℕ)
instance : CommMonoid (MonoidPowerPerfection A p) := sorry
 def mk (n : ℕ) (a : A) : MonoidPowerPerfection A p := Quotient.mk _ (n,a)
 def of : A →* MonoidPowerPerfection A p := sorry
 theorem power_bijective : Function.Bijective (fun x : MonoidPowerPerfection A p => x ^ p) := sorry
 def lift (h : Function.Bijective (fun x : B => x ^ p)) (f : A →* B) :
    MonoidPowerPerfection A p →* B := sorry
 def map (f : A →* B) : MonoidPowerPerfection A p →* MonoidPowerPerfection B p := sorry
 theorem mk_eq_iff (n m : ℕ) (a b : A) : mk p n a = mk p m b ↔
    ∃ k, a ^ (p ^ (m + k)) = b ^ (p ^ (n + k)) := sorry
 def pullbackMonoid (f : A →* B) (g : C →* B) : Submonoid (A × C) where
  carrier := {x | f x.1 = g x.2}
  one_mem' := by simp
  mul_mem' := by sorry
 def pullbackEquiv (f : A →* B) (g : C →* B) :
    MonoidPowerPerfection (pullbackMonoid f g) p ≃*
      pullbackMonoid (map p f) (map p g) := sorry
-- test: MonoidPowerPerfection.test_nilpotent
example {R : Type u} [CommRing R] (p : ℕ) [Fact p.Prime] (e : R) (he : IsNilpotent e) :
    of p e = of p (0 : R) := by sorry
-- test: MonoidPowerPerfection.test_integer_two
example : of 2 (2 : ℤ) ≠ of 2 (0 : ℤ) ∧ (1 + 1 : ℤ) ^ 2 ≠ 1 ^ 2 + 1 ^ 2 := by sorry
-- test: MonoidPowerPerfection.test_perfect_monoid
example (h : Function.Bijective (fun a : A => a ^ p)) : Function.Bijective (of (A := A) p) := by sorry
-- test: MonoidPowerPerfection.test_pullback
example (f : A →* B) (g : C →* B) (a : MonoidPowerPerfection A p)
    (c : MonoidPowerPerfection C p) (h : map p f a = map p g c) :
    ∃ x : MonoidPowerPerfection (pullbackMonoid f g) p,
      pullbackEquiv p f g x = ⟨(a,c),h⟩ := by sorry
end MonoidPowerPerfection
namespace TauCeti
/-- Unlike `CharP`, this convention includes the zero ring. -/
class KilledBy (R : Type u) [CommRing R] (p : ℕ) : Prop where
  cast_eq_zero : (p : R) = 0
instance killedBy_of_charP (R : Type u) [CommRing R] (p : ℕ) [CharP R p] : KilledBy R p := sorry
end TauCeti
-- node: SchemeAndStackFoundations:SF.0/ring-perfection
abbrev DirectLimitPerfection (R : Type u) [CommRing R] (p : ℕ) := MonoidPowerPerfection R p
namespace DirectLimitPerfection
variable {R S B A : Type u} [CommRing R] [CommRing S] [CommRing B] [CommRing A]
variable (p : ℕ) [Fact p.Prime] [TauCeti.KilledBy R p] [TauCeti.KilledBy S p]
instance instCommRing : CommRing (DirectLimitPerfection R p) := sorry
instance instKilledBy : TauCeti.KilledBy (DirectLimitPerfection R p) p := sorry
instance instPerfectRing : PerfectRing (DirectLimitPerfection R p) p := sorry
 def of : R →+* DirectLimitPerfection R p := sorry
instance algebra : Algebra R (DirectLimitPerfection R p) := (of p).toAlgebra
 def mk (n : ℕ) (r : R) : DirectLimitPerfection R p := MonoidPowerPerfection.mk p n r
 def lift [PerfectRing S p] (f : R →+* S) : DirectLimitPerfection R p →+* S := sorry
 def map (f : R →+* S) : DirectLimitPerfection R p →+* DirectLimitPerfection S p := sorry
 theorem mk_eq_iff (n m : ℕ) (r s : R) : mk p n r = mk p m s ↔
    ∃ k, r ^ (p ^ (m + k)) = s ^ (p ^ (n + k)) := sorry
 def equivPerfectClosure [Nontrivial R] [CharP R p] : DirectLimitPerfection R p ≃+* PerfectClosure R p := sorry
-- Scalar extensions in these comparisons use the displayed canonical ring maps.
 def localizationMap (f : R) [TauCeti.KilledBy (Localization.Away f) p] :
    DirectLimitPerfection R p →+* DirectLimitPerfection (Localization.Away f) p := sorry
 theorem isLocalization_away (f : R) [TauCeti.KilledBy (Localization.Away f) p] :
    letI := (localizationMap p f).toAlgebra;
    IsLocalization.Away (of p f) (DirectLimitPerfection (Localization.Away f) p) := sorry
 def tensorEquiv [TauCeti.KilledBy A p] [TauCeti.KilledBy B p]
    [Algebra A R] [Algebra A B] [TauCeti.KilledBy (R ⊗[A] B) p] :
    letI := (map p (algebraMap A R)).toAlgebra
    letI := (map p (algebraMap A B)).toAlgebra
    DirectLimitPerfection (R ⊗[A] B) p ≃+*
      (DirectLimitPerfection R p ⊗[DirectLimitPerfection A p] DirectLimitPerfection B p) := sorry
-- test: DirectLimitPerfection.polynomial_has_pth_root
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    ∃ x : DirectLimitPerfection (Polynomial (ZMod p)) p,
      x ^ p = of p Polynomial.X := by sorry
-- test: DirectLimitPerfection.perfection_zero
example [Subsingleton R] : Subsingleton (DirectLimitPerfection R p) := by sorry
-- test: DirectLimitPerfection.not_inverse_limit
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    Infinite (DirectLimitPerfection (Polynomial (ZMod p)) p) ∧
    Nonempty (Perfection (Polynomial (ZMod p)) p ≃+* ZMod p) := by sorry
-- test: DirectLimitPerfection.dualNumbers
example [TauCeti.KilledBy (TauCeti.HenselianRing.quadratic (ZMod p) 0) p] :
    Nonempty (DirectLimitPerfection (TauCeti.HenselianRing.quadratic (ZMod p) 0) p ≃+* ZMod p) := by sorry
-- test: DirectLimitPerfection.equivPerfectClosure_field
example (K : Type u) [Field K] [CharP K p] :
    Nonempty (DirectLimitPerfection K p ≃+* PerfectClosure K p) := by sorry
end DirectLimitPerfection
namespace MonoidPowerPerfection
 def charPComparison (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p] :
    MonoidPowerPerfection R p ≃* DirectLimitPerfection R p := sorry
end MonoidPowerPerfection

namespace AlgebraicGeometry
-- node: SchemeAndStackFoundations:SF.0/universal-homeomorphism
class IsUniversalHomeomorphism {X Y : Scheme.{u}} (f : X ⟶ Y) : Prop where
  property : ((topologically IsHomeomorph).universally) f
 theorem isUniversalHomeomorphism_eq {X Y : Scheme.{u}} (f : X ⟶ Y) :
    IsUniversalHomeomorphism f ↔ ((topologically IsHomeomorph).universally) f := sorry
namespace IsUniversalHomeomorphism
 theorem of_isIso {X Y : Scheme.{u}} (f : X ⟶ Y) [IsIso f] : IsUniversalHomeomorphism f := sorry
 theorem isStableUnderBaseChange : MorphismProperty.IsStableUnderBaseChange
    (@IsUniversalHomeomorphism) := sorry
end IsUniversalHomeomorphism
namespace Scheme.Hom
 def homeomorphOfIsUniversalHomeomorphism {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsUniversalHomeomorphism f] : X ≃ₜ Y := sorry
end Scheme.Hom
-- node: SchemeAndStackFoundations:SF.0/universal-homeomorphism-criteria
 theorem isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective
    {X Y : Scheme.{u}} (f : X ⟶ Y) :
    IsUniversalHomeomorphism f ↔ IsIntegralHom f ∧ UniversallyInjective f ∧ Surjective f := sorry
-- test: AlgebraicGeometry.not_isUniversalHomeomorphism_Spec_F_p2
example : ¬ IsUniversalHomeomorphism
    (Spec.map (CommRingCat.ofHom (algebraMap (ZMod 5) (GaloisField 5 2)))) := by sorry
-- Cusp and node rings retain their specified embeddings in k[t].
def cuspSubalgebra (k : Type u) [Field k] : Subalgebra k (Polynomial k) :=
  Algebra.adjoin k {Polynomial.X ^ 2, Polynomial.X ^ 3}
def nodeSubalgebra (k : Type u) [Field k] : Subalgebra k (Polynomial k) :=
  Algebra.adjoin k {Polynomial.X ^ 2 - 1, Polynomial.X ^ 3 - Polynomial.X}
-- test: AlgebraicGeometry.isUniversalHomeomorphism_cusp_normalization
example (k : Type u) [Field k] : IsUniversalHomeomorphism
    (Spec.map (CommRingCat.ofHom (cuspSubalgebra k).val.toRingHom)) ∧
    ¬ IsIso (Spec.map (CommRingCat.ofHom (cuspSubalgebra k).val.toRingHom)) := by sorry
-- test: AlgebraicGeometry.not_isUniversalHomeomorphism_node_normalization
example (k : Type u) [Field k] (h : (2 : k) ≠ 0) : ¬ IsUniversalHomeomorphism
    (Spec.map (CommRingCat.ofHom (nodeSubalgebra k).val.toRingHom)) := by sorry
namespace Scheme
-- node: SchemeAndStackFoundations:SF.0/scheme-reduction
 def nilradicalIdeal (X : Scheme.{u}) : X.IdealSheafData := sorry
 def reduction (X : Scheme.{u}) : Scheme.{u} := (nilradicalIdeal X).subscheme
 def fromReduction (X : Scheme.{u}) : reduction X ⟶ X := (nilradicalIdeal X).subschemeι
end Scheme
-- test: AlgebraicGeometry.isUniversalHomeomorphism_reduced
example (X : Scheme.{u}) : IsUniversalHomeomorphism X.fromReduction := by sorry
-- test: AlgebraicGeometry.isUniversalHomeomorphism_Spec_purelyInseparable
example {k K : Type u} [Field k] [Field K] [Algebra k K] [IsPurelyInseparable k K] :
    IsUniversalHomeomorphism (Spec.map (CommRingCat.ofHom (algebraMap k K))) := by sorry
end AlgebraicGeometry

namespace AlgebraicGeometry.Scheme
/-- Iteration as a morphism, avoiding the reducible End coercion at pullbacks. -/
def iterateEnd {X : Scheme.{u}} (f : X ⟶ X) : ℕ → (X ⟶ X)
  | 0 => 𝟙 X
  | n + 1 => iterateEnd f n ≫ f
/-- Positive-characteristic scheme convention including empty schemes. -/
class HasCharP (X : Scheme.{u}) (p : ℕ) : Prop where
  cast_eq_zero : ∀ U : X.Opens, (p : Γ(X,U)) = 0
instance hasCharP_spec (R : Type u) [CommRing R] (p : ℕ) [TauCeti.KilledBy R p] :
    HasCharP (Spec (CommRingCat.of R)) p := sorry
-- node: SchemeAndStackFoundations:SF.0/absolute-frobenius
 def frobenius (K : Type u) [Field K] [Fintype K] (X : Scheme.{u})
    (a : X ⟶ Spec (CommRingCat.of K)) : X ⟶ X := sorry
 theorem frobenius_apply (K : Type u) [Field K] [Fintype K] (X : Scheme.{u})
    (a : X ⟶ Spec (CommRingCat.of K)) (x : X) : frobenius K X a x = x := sorry
 theorem frobenius_app (K : Type u) [Field K] [Fintype K] (X : Scheme.{u})
    (a : X ⟶ Spec (CommRingCat.of K)) (U : X.Opens) (s : Γ(X,U)) :
    (frobenius K X a).appLE U U (by sorry) s = s ^ Nat.card K := sorry
 theorem frobenius_over (K : Type u) [Field K] [Fintype K] (X : Scheme.{u})
    (a : X ⟶ Spec (CommRingCat.of K)) : frobenius K X a ≫ a = a := sorry
namespace Hom
 theorem frobenius_naturality (K : Type u) [Field K] [Fintype K] {X Y : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of K)) (b : Y ⟶ Spec (CommRingCat.of K))
    (f : X ⟶ Y) (hf : f ≫ b = a) : frobenius K X a ≫ f = f ≫ frobenius K Y b := sorry
end Hom
 theorem frobenius_Spec (K R : Type u) [Field K] [Fintype K] [CommRing R] [Algebra K R] :
    frobenius K (Spec (CommRingCat.of R)) (Spec.map (CommRingCat.ofHom (algebraMap K R))) =
    Spec.map (CommRingCat.ofHom (FiniteField.frobeniusAlgHom K R).toRingHom) := sorry
 theorem frobenius_pullback (K : Type u) [Field K] [Fintype K] {X Y S : Scheme.{u}}
    (a : S ⟶ Spec (CommRingCat.of K)) (f : X ⟶ S) (g : Y ⟶ S) :
    frobenius K (pullback f g) (pullback.fst f g ≫ f ≫ a) ≫ pullback.fst f g =
      pullback.fst f g ≫ frobenius K X (f ≫ a) := sorry
 theorem frobenius_pow_of_le (K L : Type u) [Field K] [Field L] [Fintype K] [Fintype L]
    [Algebra K L] (m : ℕ) (hm : Nat.card L = Nat.card K ^ m)
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of L)) :
    frobenius L X a = iterateEnd (frobenius K X (a ≫ Spec.map (CommRingCat.ofHom (algebraMap K L)))) m := sorry
 theorem isUniversalHomeomorphism_frobenius (K : Type u) [Field K] [Fintype K]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of K)) :
    IsUniversalHomeomorphism (frobenius K X a) ∧ IsIntegralHom (frobenius K X a) := sorry
 def toFp (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] :
    X ⟶ Spec (CommRingCat.of (ULift.{u} (ZMod p))) := sorry
 def absoluteFrobenius (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] : X ⟶ X := sorry
-- test: AlgebraicGeometry.Scheme.frobenius_affineLine
example (p : ℕ) [Fact p.Prime] :
    FiniteField.frobeniusAlgHom (ZMod p) (Polynomial (ZMod p)) Polynomial.X = Polynomial.X ^ p := by sorry
-- test: AlgebraicGeometry.Scheme.frobenius_SpecK
example (K : Type u) [Field K] [Fintype K] : frobenius K (Spec (CommRingCat.of K)) (𝟙 _) = 𝟙 _ := by sorry
-- test: AlgebraicGeometry.Scheme.frobenius_dualNumbers_not_isIso
example (p : ℕ) [Fact p.Prime] : ¬ IsIso
    (frobenius (ZMod p) (Spec (CommRingCat.of (TauCeti.HenselianRing.quadratic (ZMod p) 0)))
      (Spec.map (CommRingCat.ofHom (algebraMap (ZMod p) _)))) := by sorry
-- test: AlgebraicGeometry.Scheme.frobenius_eq_SpecMap_frobeniusAlgHom
example (K R : Type u) [Field K] [Fintype K] [CommRing R] [Algebra K R] :
    frobenius K (Spec (CommRingCat.of R)) (Spec.map (CommRingCat.ofHom (algebraMap K R))) =
      Spec.map (CommRingCat.ofHom (FiniteField.frobeniusAlgHom K R).toRingHom) := by sorry
-- node: SchemeAndStackFoundations:SF.0/relative-frobenius
variable {X Y S : Scheme.{u}} (p : ℕ) [Fact p.Prime] [HasCharP X p] [HasCharP Y p] [HasCharP S p]
 def frobeniusTwist (f : X ⟶ S) (n : ℕ) : Scheme.{u} :=
    pullback f (iterateEnd (absoluteFrobenius S p) n)
 def relativeFrobenius (f : X ⟶ S) (n : ℕ) : X ⟶ frobeniusTwist p f n := sorry
 theorem relativeFrobenius_fst (f : X ⟶ S) (n : ℕ) :
    relativeFrobenius p f n ≫ pullback.fst f (iterateEnd (absoluteFrobenius S p) n) =
      iterateEnd (absoluteFrobenius X p) n := sorry
 def frobeniusTwistMap (f : X ⟶ S) (g : Y ⟶ S) (h : X ⟶ Y) (hh : h ≫ g = f) (n : ℕ) :
    frobeniusTwist p f n ⟶ frobeniusTwist p g n := sorry
 theorem relativeFrobenius_naturality (f : X ⟶ S) (g : Y ⟶ S) (h : X ⟶ Y)
    (hh : h ≫ g = f) (n : ℕ) : relativeFrobenius p f n ≫ frobeniusTwistMap p f g h hh n =
    h ≫ relativeFrobenius p g n := sorry
 def frobeniusTwistPullbackIso (f : X ⟶ S) (g : Y ⟶ S) (n : ℕ)
    [HasCharP (pullback f g) p] :
    frobeniusTwist p (pullback.snd f g) n ≅
      pullback (pullback.snd f (iterateEnd (absoluteFrobenius S p) n)) g := sorry
 theorem isUniversalHomeomorphism_relativeFrobenius (f : X ⟶ S) (n : ℕ) :
    IsUniversalHomeomorphism (relativeFrobenius p f n) ∧ IsIntegralHom (relativeFrobenius p f n) := sorry
-- node: SchemeAndStackFoundations:SF.0/relative-frobenius-etale-and-smooth
 theorem finrank_relativeFrobenius_of_smoothOfRelativeDimension (f : X ⟶ S) (d n : ℕ)
    [SmoothOfRelativeDimension d f] (x : frobeniusTwist p f n) :
    (relativeFrobenius p f n).finrank x = p ^ (n * d) ∧
      IsFinite (relativeFrobenius p f n) ∧ Flat (relativeFrobenius p f n) ∧
      LocallyOfFinitePresentation (relativeFrobenius p f n) := sorry
-- test: AlgebraicGeometry.Scheme.relativeFrobenius_affineSpace
-- The precise coordinate chart identifies the target with A^d_S.
example (f : X ⟶ S) [Etale f] : IsIso (relativeFrobenius p f 1) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeFrobenius_self
example : IsIso (relativeFrobenius p (𝟙 S) 1) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeFrobenius_not_isIso_of_universalHomeomorphism
-- Applied to the specified F_p[t]/t^p test algebra, whose Frobenius is not injective.
example [TauCeti.KilledBy
    (Polynomial (ZMod p) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ p}) p] :
    ¬ IsIso (relativeFrobenius p
      (Spec.map (CommRingCat.ofHom (algebraMap (ZMod p)
        (Polynomial (ZMod p) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ p})))) 1) := by sorry
-- test: AlgebraicGeometry.Scheme.relativeFrobenius_finiteField
-- For q=p^a, the target twist comparison is frobeniusTwistIsoOfFiniteField below.
example (f : X ⟶ S) (n : ℕ) :
    relativeFrobenius p f n ≫ pullback.fst f (iterateEnd (absoluteFrobenius S p) n) =
      iterateEnd (absoluteFrobenius X p) n := by sorry
-- node: SchemeAndStackFoundations:SF.0/perfect-scheme
class IsPerfect (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] : Prop where
  frobenius_isIso : IsIso (absoluteFrobenius X p)
 def frobeniusIsoOfIsPerfect [IsPerfect X p] : X ≅ X := sorry
 def frobeniusTwistIsoOfIsPerfect (f : X ⟶ S) (n : ℕ) [IsPerfect S p] :
    frobeniusTwist p f n ≅ X := sorry
 def frobeniusTwistIsoOfFiniteField (K : Type u) [Field K] [Fintype K] (a : ℕ)
    [HasCharP (Spec (CommRingCat.of K)) p] (hc : Nat.card K = p ^ a)
    (f : X ⟶ Spec (CommRingCat.of K)) : frobeniusTwist p f a ≅ X := sorry
 theorem isPerfect_iff_perfectRing : IsPerfect X p ↔
    ∀ U : X.Opens, IsAffineOpen U → PerfectRing Γ(X,U) p := sorry
namespace IsPerfect
 theorem isReduced [IsPerfect X p] : IsReduced X := sorry
 theorem pullback (f : X ⟶ S) (g : Y ⟶ S) [IsPerfect X p] [IsPerfect Y p]
    [IsPerfect S p] [HasCharP (pullback f g) p] : IsPerfect (pullback f g) p := sorry
 theorem of_etale (f : X ⟶ Y) [Etale f] [IsPerfect Y p] : IsPerfect X p := sorry
end IsPerfect
-- node: SchemeAndStackFoundations:SF.0/scheme-perfection
 def perfection (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] : Scheme.{u} := sorry
 def perfectionι : perfection X p ⟶ X := sorry
instance hasCharP_perfection : HasCharP (perfection X p) p := sorry
 theorem isPerfect_perfection : IsPerfect (perfection X p) p := sorry
 def perfectionLiftEquiv [IsPerfect Y p] : (Y ⟶ perfection X p) ≃ (Y ⟶ X) := sorry
namespace Hom
 def perfection (f : X ⟶ Y) : Scheme.perfection X p ⟶ Scheme.perfection Y p := sorry
 theorem perfection_iff (f : X ⟶ Y) :
    (IsAffineHom f ↔ IsAffineHom (perfection p f)) ∧
    (IsSeparated f ↔ IsSeparated (perfection p f)) ∧
    (QuasiCompact f ↔ QuasiCompact (perfection p f)) ∧
    (QuasiSeparated f ↔ QuasiSeparated (perfection p f)) ∧
    (IsIntegralHom f ↔ IsIntegralHom (perfection p f)) ∧
    (UniversallyClosed f ↔ UniversallyClosed (perfection p f)) ∧
    (UniversallyInjective f ↔ UniversallyInjective (perfection p f)) ∧
    (Surjective f ↔ Surjective (perfection p f)) ∧
    (IsUniversalHomeomorphism f ↔ IsUniversalHomeomorphism (perfection p f)) ∧
    (IsHomeomorph f.base ↔ IsHomeomorph (perfection p f).base) ∧
    (IsClosedMap f.base ↔ IsClosedMap (perfection p f).base) := sorry
 def perfectionPullbackIsoOfEtale (f : X ⟶ Y) [Etale f] :
    Scheme.perfection X p ≅ pullback f (perfectionι (X := Y) p) := sorry
end Hom
 def perfectionAffineIso (R : Type u) [CommRing R] [TauCeti.KilledBy R p] :
    perfection (Spec (CommRingCat.of R)) p ≅ Spec (CommRingCat.of (DirectLimitPerfection R p)) := sorry
 def perfectionPullbackIso (f : X ⟶ S) (g : Y ⟶ S) [HasCharP (pullback f g) p] :
    perfection (pullback f g) p ≅ pullback (f.perfection p) (g.perfection p) := sorry
 def perfectionιIsoOfIsPerfect [IsPerfect X p] : perfection X p ≅ X := sorry
-- Frobenius tower indexing, cone maps and affine-transition-limit carrier are named
-- explicitly in the plan. The following is the resulting categorical limit signature.
 def frobeniusTower (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] : ℕᵒᵖ ⥤ Scheme.{u} where
  obj _ := X
  map {n m} _ := iterateEnd (absoluteFrobenius X p) (n.unop - m.unop)
  map_id _ := by sorry
  map_comp _ _ := by sorry
 def perfectionCone : Cone (frobeniusTower X p) := sorry
 def isLimitPerfectionCone : IsLimit (perfectionCone (X := X) p) := sorry
 def perfectedDiagram {J : Type u} [SmallCategory J] (D : J ⥤ Scheme.{u})
    (hchar : ∀ j, HasCharP (D.obj j) p) : J ⥤ Scheme.{u} := sorry
 def perfectionLimitIso {J : Type u} [SmallCategory J] [IsCofiltered J]
    (D : J ⥤ Scheme.{u}) (c : Cone D) (hc : IsLimit c)
    (hchar : ∀ j, HasCharP (D.obj j) p) [HasCharP c.pt p]
    (hAff : ∀ {i j} (f : i ⟶ j), IsAffineHom (D.map f))
    [HasLimit (perfectedDiagram p D hchar)] :
    perfection c.pt p ≅ limit (perfectedDiagram p D hchar) := sorry
-- node: SchemeAndStackFoundations:SF.0/perfection-universal-homeomorphism
 theorem isUniversalHomeomorphism_perfectionι : IsUniversalHomeomorphism (perfectionι (X := X) p) := sorry
-- test: AlgebraicGeometry.Scheme.isPerfect_Spec_perfection_polynomial
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    IsPerfect (Spec (CommRingCat.of (DirectLimitPerfection (Polynomial (ZMod p)) p))) p := by sorry
-- test: AlgebraicGeometry.Scheme.isPerfect_empty
example [HasCharP empty p] : IsPerfect empty p := by sorry
-- test: AlgebraicGeometry.Scheme.not_isPerfect_affineLine
example : ¬ IsPerfect (Spec (CommRingCat.of (Polynomial (ZMod p)))) p := by sorry
-- test: AlgebraicGeometry.Scheme.isPerfect_Spec_field_iff
example (K : Type u) [Field K] [CharP K p] :
    IsPerfect (Spec (CommRingCat.of K)) p ↔ PerfectRing K p := by sorry
-- test: AlgebraicGeometry.Scheme.perfection_affineLine
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    ∃ x : DirectLimitPerfection (Polynomial (ZMod p)) p,
      x ^ p = DirectLimitPerfection.of p Polynomial.X := by sorry
-- test: AlgebraicGeometry.Scheme.perfection_of_isPerfect
example [IsPerfect X p] : IsIso (perfectionι (X := X) p) := by sorry
-- test: AlgebraicGeometry.Scheme.perfection_dualNumbers
example [TauCeti.KilledBy (TauCeti.HenselianRing.quadratic (ZMod p) 0) p] :
    Nonempty (perfection (Spec (CommRingCat.of (TauCeti.HenselianRing.quadratic (ZMod p) 0))) p ≅
      Spec (CommRingCat.of (ZMod p))) := by sorry
-- test: AlgebraicGeometry.Scheme.perfection_prod
example (f : X ⟶ S) (g : Y ⟶ S) [HasCharP (pullback f g) p] :
    Nonempty (perfection (pullback f g) p ≅ pullback (f.perfection p) (g.perfection p)) := by sorry
end AlgebraicGeometry.Scheme

namespace RingHom
variable {A B : Type u} [CommRing A] [CommRing B]
-- node: SchemeAndStackFoundations:SF.0/perfectly-finitely-presented
 def PerfectlyFinitePresentation (g : A →+* B) (p : ℕ) [Fact p.Prime]
    [TauCeti.KilledBy A p] [TauCeti.KilledBy B p] : Prop :=
    PerfectRing A p ∧ PerfectRing B p ∧
    ∃ C : CommAlgCat.{u} A, ∃ h : TauCeti.KilledBy C p,
      letI := h;
      Algebra.FinitePresentation A C ∧ ∃ e : DirectLimitPerfection C p ≃+* B,
      e.toRingHom.comp ((DirectLimitPerfection.of p).comp (algebraMap A C)) = g
end RingHom
namespace AlgebraicGeometry
open Scheme
/-- Finite presentation is locally finite presentation, quasi-compact and quasi-separated.
Mathlib has these three predicates separately at the pinned commit. -/
class IsFinitePresentation {X Y : Scheme.{u}} (f : X ⟶ Y) : Prop extends
    LocallyOfFinitePresentation f, QuasiCompact f, QuasiSeparated f
variable {X Y S : Scheme.{u}} (p : ℕ) [Fact p.Prime]
variable [HasCharP X p] [HasCharP Y p] [HasCharP S p]
instance sectionsKilledBy (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] (U : X.Opens) :
    TauCeti.KilledBy Γ(X,U) p := sorry
 class PerfectlyFinitelyPresented (f : X ⟶ Y) : Prop where
  sourcePerfect : Scheme.IsPerfect X p
  targetPerfect : Scheme.IsPerfect Y p
  sourceQuasiCompact : CompactSpace X
  sourceQuasiSeparated : QuasiSeparatedSpace X
  targetQuasiCompact : CompactSpace Y
  targetQuasiSeparated : QuasiSeparatedSpace Y
  locally : ∀ x : X, ∃ (U : Y.Opens) (V : X.Opens) (_ : IsAffineOpen U) (_ : IsAffineOpen V)
    (h : V ≤ f ⁻¹ᵁ U), x ∈ V ∧ RingHom.PerfectlyFinitePresentation (f.appLE U V h).hom p
-- A finitely presented model includes its actual comparison map over the target.
 structure PerfectModel (f : X ⟶ Y) where
  scheme : Scheme.{u}
  char : HasCharP scheme p
  morphism : scheme ⟶ Y
  finitePresentation : IsFinitePresentation morphism
  comparison : @Scheme.perfection scheme p _ char ≅ X
  over : comparison.hom ≫ f = @Scheme.perfectionι scheme p _ char ≫ morphism
namespace PerfectlyFinitelyPresented
 theorem perfection {X₀ : Scheme.{u}} [HasCharP X₀ p] [Scheme.IsPerfect Y p]
    [CompactSpace Y] [QuasiSeparatedSpace Y] (f₀ : X₀ ⟶ Y) [IsFinitePresentation f₀] :
    PerfectlyFinitelyPresented p ((f₀.perfection p) ≫ (Scheme.perfectionιIsoOfIsPerfect (X := Y) p).hom) := sorry
 theorem comp (f : X ⟶ Y) (g : Y ⟶ S)
    [PerfectlyFinitelyPresented p f] [PerfectlyFinitelyPresented p g] :
    PerfectlyFinitelyPresented p (f ≫ g) := sorry
 theorem of_etale (f : X ⟶ Y) [Etale f] [Scheme.IsPerfect X p] [Scheme.IsPerfect Y p]
    [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y] :
    PerfectlyFinitelyPresented p f := sorry
 theorem closedImmersion_iff {A : Type u} [CommRing A] [TauCeti.KilledBy A p] [PerfectRing A p]
    (I : Ideal A) [TauCeti.KilledBy (A ⧸ I) p] (hI : I.IsRadical) :
    PerfectlyFinitelyPresented p (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk I))) ↔
      ∃ J : Ideal A, J.FG ∧ I = J.radical := sorry
 theorem exists_model (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] :
    Nonempty (PerfectModel p f) := sorry
-- node: SchemeAndStackFoundations:SF.0/pfp-characterisations
 theorem tfae (f : X ⟶ Y) [Scheme.IsPerfect X p] [Scheme.IsPerfect Y p]
    [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y] :
    PerfectlyFinitelyPresented p f ↔
    ∀ (U : Y.Opens) (V : X.Opens) (_ : IsAffineOpen U) (_ : IsAffineOpen V)
      (h : V ≤ f ⁻¹ᵁ U), RingHom.PerfectlyFinitePresentation (f.appLE U V h).hom p := sorry
-- The compactness-of-Hom and descent-over-affine-limits clauses require the explicit
-- colimit of Hom-sets over the perfect slice category; that carrier is omitted here.
-- test: AlgebraicGeometry.PerfectlyFinitelyPresented.perfection_polynomial
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    RingHom.PerfectlyFinitePresentation
      ((DirectLimitPerfection.of p).comp (algebraMap (ZMod p) (Polynomial (ZMod p)))) p ∧
    ¬ RingHom.FiniteType ((DirectLimitPerfection.of p).comp
      (algebraMap (ZMod p) (Polynomial (ZMod p)))) := by sorry
-- test: AlgebraicGeometry.PerfectlyFinitelyPresented.id
example [Scheme.IsPerfect X p] [CompactSpace X] [QuasiSeparatedSpace X] :
    PerfectlyFinitelyPresented p (𝟙 X) := by sorry
-- test: AlgebraicGeometry.not_perfectlyFinitelyPresented_infinite
example [TauCeti.KilledBy (MvPolynomial ℕ (ZMod p)) p] :
    ¬ RingHom.PerfectlyFinitePresentation ((DirectLimitPerfection.of p).comp
      (algebraMap (ZMod p) (MvPolynomial ℕ (ZMod p)))) p := by sorry
-- test: AlgebraicGeometry.PerfectlyFinitelyPresented.quotient_root
example {A : Type u} [CommRing A] [TauCeti.KilledBy A p] [PerfectRing A p]
    (a : A) [TauCeti.KilledBy (A ⧸ (Ideal.span {a}).radical) p] :
    RingHom.PerfectlyFinitePresentation (Ideal.Quotient.mk (Ideal.span {a}).radical) p := by sorry
end PerfectlyFinitelyPresented
abbrev PerfFp (Y : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP Y p] :=
  ObjectProperty.FullSubcategory (fun T : Over Y =>
    ∃ h : HasCharP T.left p, @PerfectlyFinitelyPresented T.left Y p _ h _ T.hom)
-- node: SchemeAndStackFoundations:SF.0/perfectly-proper
 class PerfectlyProper (f : X ⟶ Y) : Prop where
  pfp : PerfectlyFinitelyPresented p f
  separated : IsSeparated f
  universallyClosed : UniversallyClosed f
namespace PerfectlyProper
 theorem perfection {X₀ : Scheme.{u}} [HasCharP X₀ p] [Scheme.IsPerfect Y p]
    [CompactSpace Y] [QuasiSeparatedSpace Y] (f₀ : X₀ ⟶ Y)
    [IsProper f₀] [IsFinitePresentation f₀] :
    PerfectlyProper p (f₀.perfection p ≫ (Scheme.perfectionιIsoOfIsPerfect (X := Y) p).hom) := sorry
 theorem iff_model (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] (M : PerfectModel p f) :
    PerfectlyProper p f ↔ IsProper M.morphism := sorry
 theorem comp (f : X ⟶ Y) (g : Y ⟶ S) [PerfectlyProper p f] [PerfectlyProper p g] :
    PerfectlyProper p (f ≫ g) := sorry
 theorem iff_valuativeCriterion (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] :
    PerfectlyProper p f ↔ ValuativeCriterion f := sorry
-- node: SchemeAndStackFoundations:SF.0/perfect-valuative-criterion
 theorem iff_valuativeCriterion_perfect (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] :
    PerfectlyProper p f ↔
    ∀ (V K : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [Field K]
      [Algebra V K] [IsFractionRing V K] [TauCeti.KilledBy V p] [PerfectRing V p]
      (a : Spec (CommRingCat.of K) ⟶ X) (b : Spec (CommRingCat.of V) ⟶ Y),
      a ≫ f = Spec.map (CommRingCat.ofHom (algebraMap V K)) ≫ b →
      ∃! s : Spec (CommRingCat.of V) ⟶ X, s ≫ f = b ∧
        Spec.map (CommRingCat.ofHom (algebraMap V K)) ≫ s = a := sorry
-- test: AlgebraicGeometry.PerfectlyProper.id
example [Scheme.IsPerfect X p] [CompactSpace X] [QuasiSeparatedSpace X] : PerfectlyProper p (𝟙 X) := by sorry
-- test: AlgebraicGeometry.PerfectlyProper.projectiveSpace
-- The projective-line carrier is StableReduction Layer 2. Its exact comparison is
-- instantiated using a proper finite-presentation model and the non-finite-type chart.
example (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] (M : PerfectModel p f)
    [IsProper M.morphism] : PerfectlyProper p f := by sorry
-- test: AlgebraicGeometry.not_perfectlyProper_affineLine
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] :
    ¬ PerfectlyProper p
      (Spec.map (CommRingCat.ofHom ((DirectLimitPerfection.of p).comp
        (algebraMap (ZMod p) (Polynomial (ZMod p)))))) := by sorry
-- test: AlgebraicGeometry.PerfectlyProper.perfection_iff
example (f : X ⟶ Y) [PerfectlyFinitelyPresented p f] (M : PerfectModel p f) :
    PerfectlyProper p f ↔ IsProper M.morphism := by sorry
end PerfectlyProper
-- A bundle keeps the positive-characteristic and perfection conditions attached to its scheme.
 structure PerfectScheme (p : ℕ) [Fact p.Prime] where
  scheme : Scheme.{u}
  char : Scheme.HasCharP scheme p
  perfect : @Scheme.IsPerfect scheme p _ char
attribute [instance] PerfectScheme.char PerfectScheme.perfect
 def perfectAffineProjection (V : PerfectScheme.{u} p) (d : ℕ)
    [HasCharP (AffineSpace (ULift.{u} (Fin d)) V.scheme) p] :
    Scheme.perfection (AffineSpace (ULift.{u} (Fin d)) V.scheme) p ⟶ V.scheme := sorry
-- node: SchemeAndStackFoundations:SF.0/perfectly-smooth
 def PerfectlySmoothAt (d : ℕ) (f : X ⟶ Y) (x : X) : Prop :=
    ∃ U V : PerfectScheme.{u} p, ∃ hchar : HasCharP (AffineSpace (ULift.{u} (Fin d)) V.scheme) p,
      letI := hchar;
      ∃ (u : U.scheme ⟶ X) (v : V.scheme ⟶ Y)
        (h : U.scheme ⟶ Scheme.perfection (AffineSpace (ULift.{u} (Fin d)) V.scheme) p),
        Etale u ∧ Etale v ∧ Etale h ∧ x ∈ Set.range u ∧
        h ≫ perfectAffineProjection p V d ≫ v = u ≫ f
 class PerfectlySmoothOfRelativeDimension (d : ℕ) (f : X ⟶ Y) : Prop where
  sourcePerfect : Scheme.IsPerfect X p
  targetPerfect : Scheme.IsPerfect Y p
  locally : ∀ x : X, PerfectlySmoothAt p d f x
 class WeaklyPerfectlySmoothOfRelativeDimension (d : ℕ) (f : X ⟶ Y) : Prop where
  sourcePerfect : Scheme.IsPerfect X p
  targetPerfect : Scheme.IsPerfect Y p
  locally : ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (W : PerfectScheme.{u} p)
    (hchar : HasCharP U.toScheme p),
    letI := hchar;
    ∃ (g : W.scheme ⟶ U.toScheme) (e : ℕ), Surjective g ∧
      PerfectlySmoothOfRelativeDimension p e g ∧
      PerfectlySmoothOfRelativeDimension p (e + d) (g ≫ U.ι ≫ f)
namespace PerfectlySmoothOfRelativeDimension
 theorem perfection {X₀ Y₀ : Scheme.{u}} [HasCharP X₀ p] [HasCharP Y₀ p]
    (f₀ : X₀ ⟶ Y₀) (d : ℕ) [SmoothOfRelativeDimension d f₀] :
    PerfectlySmoothOfRelativeDimension p d (f₀.perfection p) := sorry
 theorem etale_iff (f : X ⟶ Y) [Scheme.IsPerfect X p] [Scheme.IsPerfect Y p] :
    PerfectlySmoothOfRelativeDimension p 0 f ↔ Etale f := sorry
 theorem weakly (f : X ⟶ Y) (d : ℕ) [PerfectlySmoothOfRelativeDimension p d f] :
    WeaklyPerfectlySmoothOfRelativeDimension p d f := sorry
 theorem comp (f : X ⟶ Y) (g : Y ⟶ S) (d e : ℕ)
    [PerfectlySmoothOfRelativeDimension p d f] [PerfectlySmoothOfRelativeDimension p e g] :
    PerfectlySmoothOfRelativeDimension p (d + e) (f ≫ g) := sorry
-- node: SchemeAndStackFoundations:SF.0/perfectly-smooth-properties
 theorem of_smoothOfRelativeDimension {X₀ Y₀ : Scheme.{u}} [HasCharP X₀ p] [HasCharP Y₀ p]
    (f₀ : X₀ ⟶ Y₀) (d : ℕ) [SmoothOfRelativeDimension d f₀] :
    PerfectlySmoothOfRelativeDimension p d (f₀.perfection p) := sorry
end PerfectlySmoothOfRelativeDimension
-- test: AlgebraicGeometry.perfectlySmooth_affineSpace
-- The coordinate projection A²→A¹ supplies f₀ in this statement.
example {X₀ Y₀ : Scheme.{u}} [HasCharP X₀ p] [HasCharP Y₀ p]
    (f₀ : X₀ ⟶ Y₀) [SmoothOfRelativeDimension 1 f₀] :
    PerfectlySmoothOfRelativeDimension p 1 (f₀.perfection p) := by sorry
-- test: AlgebraicGeometry.perfectlySmooth_id
example [Scheme.IsPerfect X p] : PerfectlySmoothOfRelativeDimension p 0 (𝟙 X) := by sorry
-- test: AlgebraicGeometry.not_perfectlySmooth_origin
example [TauCeti.KilledBy (Polynomial (ZMod p)) p] (d : ℕ) :
    ¬ PerfectlySmoothOfRelativeDimension p d
      (Spec.map (CommRingCat.ofHom ((DirectLimitPerfection.lift p
        (Polynomial.evalRingHom (0 : ZMod p)))))) := by sorry
-- test: AlgebraicGeometry.perfectlySmooth_iff_local_model
-- Omitted exact condition: the existential smooth model lies on étale charts on
-- both source and target, with the indicated relative dimension and comparison maps.
example (f : X ⟶ Y) (d : ℕ) [PerfectlySmoothOfRelativeDimension p d f] :
    Flat f := by sorry
end AlgebraicGeometry

namespace Ring
variable {R S : Type u} [CommRing R] [CommRing S]
 theorem IsCatenary.exists_length_le (h : IsCatenary R) (p q : PrimeSpectrum R) (hpq : p ≤ q) :
    ∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum R), s.head = p → s.last = q → s.length ≤ n := sorry
 theorem IsCatenary.length_eq_of_covBy (h : IsCatenary R) (s t : LTSeries (PrimeSpectrum R))
    (hh : s.head = t.head) (hl : s.last = t.last)
    (hs : ∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ)
    (ht : ∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) : s.length = t.length := sorry
 theorem isCatenary_iff_of_isNoetherianRing [IsNoetherianRing R] : IsCatenary R ↔
    ∀ s t : LTSeries (PrimeSpectrum R), s.head = t.head → s.last = t.last →
      (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
      (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length := sorry
 theorem IsCatenary.of_ringEquiv (e : R ≃+* S) (h : IsCatenary R) : IsCatenary S := sorry
 theorem isCatenary_of_krullDimLE_one (h : ringKrullDim R ≤ 1) : IsCatenary R := sorry
 theorem isCatenary_iff_forall_isMaximal : IsCatenary R ↔
    ∀ p : PrimeSpectrum R, p.asIdeal.IsMaximal → IsCatenary (Localization.AtPrime p.asIdeal) := sorry
 theorem isCatenary_iff_forall_minimalPrimes [IsNoetherianRing R] : IsCatenary R ↔
    ∀ p : PrimeSpectrum R, p.asIdeal ∈ minimalPrimes R → IsCatenary (R ⧸ p.asIdeal) := sorry
 theorem isCatenary_iff_ringKrullDim_quotient_add_one [IsNoetherianRing R] [IsLocalRing R] :
    IsCatenary R ↔ ∀ p q : PrimeSpectrum R, p ⋖ q →
      ringKrullDim (R ⧸ p.asIdeal) = ringKrullDim (R ⧸ q.asIdeal) + 1 := sorry
 theorem IsUniversallyCatenary.isCatenary_of_finiteType [Algebra R S] [Algebra.FiniteType R S]
    (h : IsUniversallyCatenary R) : IsCatenary S := sorry
 theorem isUniversallyCatenary_iff_mvPolynomial : IsUniversallyCatenary R ↔
    IsNoetherianRing R ∧ ∀ n, IsCatenary (MvPolynomial (Fin n) R) := sorry
 theorem IsUniversallyCatenary.of_essFiniteType [Algebra R S] [Algebra.EssFiniteType R S]
    (h : IsUniversallyCatenary R) : IsUniversallyCatenary S := sorry
 theorem isUniversallyCatenary_iff_forall_isMaximal [IsNoetherianRing R] : IsUniversallyCatenary R ↔
    ∀ p : PrimeSpectrum R, p.asIdeal.IsMaximal → IsUniversallyCatenary (Localization.AtPrime p.asIdeal) := sorry
-- test: Ring.IsCatenary.test_mvPolynomial_two
example (k : Type u) [Field k] : IsCatenary (MvPolynomial (Fin 2) k) := by sorry
-- test: Ring.IsUniversallyCatenary.test_dim_one_domain
example [IsNoetherianRing R] [IsDomain R] (h : ringKrullDim R ≤ 1) : IsUniversallyCatenary R := by sorry
-- test: Ring.IsUniversallyCatenary.test_not_noetherian
example (k : Type u) [Field k] : ¬ IsUniversallyCatenary (MvPolynomial ℕ k) := by sorry
-- Ring.IsCatenary.test_nagata and Ring.IsUniversallyCatenary.test_nagata use the
-- explicit Nagata local domains of non-catenary-local-domain; their subring and
-- prime-complement localization carriers are omitted from this file, not from the plan.
-- Ring.IsCatenary.test_dimension_function_needs_local uses localization at the
-- complement of (x,y)∪(x−1). Its two selected maximal-ideal carriers are omitted here.
end Ring

namespace IsLocalRing
variable (R M : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [AddCommGroup M] [Module R M] [Module.Finite R M]
 theorem depth_eq_top_iff : depth R M = ⊤ ↔ Subsingleton M := sorry
 theorem depth_le_supportDim [Nontrivial M] :
    (depth R M : WithBot ℕ∞) ≤ Module.supportDim R M := sorry
 theorem depth_eq_zero_iff [Nontrivial M] :
    depth R M = 0 ↔ maximalIdeal R ∈ associatedPrimes R M := sorry
 theorem depth_eq_iff_ext [Nontrivial M] (n : ℕ) : depth R M = n ↔
    (∀ i < n, Subsingleton (Abelian.Ext (ModuleCat.of R (ResidueField R)) (ModuleCat.of R M) i)) ∧
      Nontrivial (Abelian.Ext (ModuleCat.of R (ResidueField R)) (ModuleCat.of R M) n) := sorry
 theorem depth_quotSMulTop [Nontrivial M] (x : R) (hx : x ∈ maximalIdeal R)
    (hr : IsSMulRegular M x) : depth R (QuotSMulTop x M) + 1 = depth R M := sorry
 theorem depth_le_of_mem_associatedPrimes (p : Ideal R) (hp : p ∈ associatedPrimes R M) :
    (depth R M : WithBot ℕ∞) ≤ ringKrullDim (R ⧸ p) := sorry
 theorem depth_le_depth_localization_add (p : PrimeSpectrum R) :
    (depth R M : WithBot ℕ∞) ≤
      (depth (Localization.AtPrime p.asIdeal) (Module.primeLocalization R M p) : WithBot ℕ∞) +
        ringKrullDim (R ⧸ p.asIdeal) := sorry
 theorem depth_shortExact (N' N'' : Type u) [AddCommGroup N'] [AddCommGroup N'']
    [Module R N'] [Module R N''] [Module.Finite R N'] [Module.Finite R N'']
    (i : N' →ₗ[R] M) (q : M →ₗ[R] N'') (hi : Function.Injective i)
    (hq : Function.Surjective q) (he : LinearMap.range i = LinearMap.ker q) :
    min (depth R N') (depth R N'') ≤ depth R M ∧
    min (depth R M) (depth R N' - 1) ≤ depth R N'' ∧
    min (depth R M) (depth R N'' + 1) ≤ depth R N' := sorry
-- test: IsLocalRing.depth.test_residueField
example : depth R (ResidueField R) = 0 := by sorry
-- test: IsLocalRing.depth.test_dvr
example (D : Type u) [CommRing D] [IsDomain D] [IsDiscreteValuationRing D] : depth D D = 1 := by sorry
-- test: IsLocalRing.depth.test_rees
example [Nontrivial M] (n : ℕ) : (n : ℕ∞) ≤ depth R M ↔
    ∀ i < n, Subsingleton (Abelian.Ext (ModuleCat.of R (ResidueField R)) (ModuleCat.of R M) i) := by sorry
-- IsLocalRing.depth.test_embedded_point uses the origin localization of
-- k[x,y]/(x²,xy). The explicit maximal-ideal proof for that carrier is omitted here.
end IsLocalRing
namespace Module
variable {R M N : Type u} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N]
 theorem depth_congr (I : Ideal R) (e : M ≃ₗ[R] N) : depth R M I = depth R N I := sorry
 theorem isCohenMacaulay_iff_of_isLocalRing [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] :
    IsCohenMacaulay R M ↔ Subsingleton M ∨
      (IsLocalRing.depth R M : WithBot ℕ∞) = supportDim R M := sorry
 theorem isCohenMacaulay_iff_forall_isMaximal [IsNoetherianRing R] [Module.Finite R M] :
    IsCohenMacaulay R M ↔ ∀ p : PrimeSpectrum R, p.asIdeal.IsMaximal →
      IsCohenMacaulay (Localization.AtPrime p.asIdeal) (primeLocalization R M p) := sorry
 theorem isCohenMacaulay_quotSMulTop_iff [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M]
    (x : R) (hx : x ∈ IsLocalRing.maximalIdeal R) (hr : IsSMulRegular M x) :
    IsCohenMacaulay R M ↔ IsCohenMacaulay R (QuotSMulTop x M) := sorry
 theorem IsCohenMacaulay.length_eq_of_maximal_chain [IsNoetherianRing R] [IsLocalRing R]
    [Module.Finite R M] (h : IsCohenMacaulay R M) (hs : Module.support R M = Set.univ)
    (s : LTSeries (PrimeSpectrum R))
    (hm : s.head.asIdeal ∈ minimalPrimes R) (hl : s.last.asIdeal = IsLocalRing.maximalIdeal R)
    (hc : ∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) :
    (s.length : WithBot ℕ∞) = ringKrullDim R := sorry
 theorem IsCohenMacaulay.associatedPrimes_minimal [IsNoetherianRing R] [IsLocalRing R]
    [Module.Finite R M] (h : IsCohenMacaulay R M) (p : Ideal R) (hp : p ∈ associatedPrimes R M) :
    p ∈ (annihilator R M).minimalPrimes ∧ ringKrullDim (R ⧸ p) = supportDim R M := sorry
 theorem satisfiesSerreS_zero [IsNoetherianRing R] [Module.Finite R M] : SatisfiesSerreS R M 0 := sorry
 theorem isCohenMacaulay_iff_forall_satisfiesSerreS [IsNoetherianRing R] [Module.Finite R M] :
    IsCohenMacaulay R M ↔ ∀ n, SatisfiesSerreS R M n := sorry
 theorem satisfiesSerreS_one_iff [IsNoetherianRing R] [Module.Finite R M] :
    SatisfiesSerreS R M 1 ↔ associatedPrimes R M ⊆ (annihilator R M).minimalPrimes := sorry
-- test: Module.IsCohenMacaulay.test_proper_support
example (k : Type u) [Field k] : IsCohenMacaulay (Polynomial k)
    (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)}) := by sorry
end Module
namespace Ring
variable (R : Type u) [CommRing R]
 theorem IsCohenMacaulay.of_isRegularRing [IsRegularRing R] : IsCohenMacaulay R := sorry
 theorem IsCohenMacaulay.of_krullDimLE_one_isDomain [IsNoetherianRing R] [IsDomain R]
    (h : ringKrullDim R ≤ 1) : IsCohenMacaulay R := sorry
 theorem IsCohenMacaulay.mvPolynomial (h : IsCohenMacaulay R) (n : ℕ) :
    IsCohenMacaulay (MvPolynomial (Fin n) R) := sorry
 theorem isUniversallyCatenary_of_isCohenMacaulay_of_support_eq_univ
    (M : Type u) [AddCommGroup M] [Module R M] (h : Module.IsCohenMacaulay R M)
    (hs : Module.support R M = Set.univ) : IsUniversallyCatenary R := sorry
 theorem isReduced_iff_serre [IsNoetherianRing R] : IsReduced R ↔
    SatisfiesSerreR R 0 ∧ SatisfiesSerreS R 1 := sorry
 theorem isNormal_iff_serre [IsNoetherianRing R] :
    (∀ p : PrimeSpectrum R, IsDomain (Localization.AtPrime p.asIdeal) ∧
      IsIntegrallyClosed (Localization.AtPrime p.asIdeal)) ↔
    SatisfiesSerreR R 1 ∧ SatisfiesSerreS R 2 := sorry
-- test: Ring.IsCohenMacaulay.test_regular
example [IsRegularLocalRing R] : IsCohenMacaulay R := by sorry
-- The named tests Ring.IsCohenMacaulay.test_embedded_point, test_plane_and_line,
-- Ring.SatisfiesSerreS.test_plane_and_line and test_embedded_point require the
-- selected origin localization and multivariable formal-power-series carrier.
-- Those carriers are omitted; the README keeps their depth 0/1 and dimension 1/2 computations.
end Ring

namespace Ring
variable (R : Type u) [CommRing R]
 theorem IsJapanese.isN1 [IsDomain R] (h : IsJapanese R) : IsN1 R := sorry
 theorem isJapanese_iff_isN1_of_charZero [IsNoetherianRing R] [IsDomain R] [CharZero R] :
    IsJapanese R ↔ IsN1 R := sorry
 theorem isJapanese_iff_purelyInseparable [IsNoetherianRing R] [IsDomain R]
    (p : ℕ) [Fact p.Prime] [CharP R p] : IsJapanese R ↔
    ∀ (L : Type u) [Field L] [Algebra (FractionRing R) L] [IsPurelyInseparable (FractionRing R) L],
      Module.Finite (FractionRing R) L →
      letI : Algebra R L := ((algebraMap (FractionRing R) L).comp (algebraMap R (FractionRing R))).toAlgebra
      Module.Finite R (integralClosure R L) := sorry
 theorem IsJapanese.of_isIntegrallyClosed_charZero [IsNoetherianRing R] [IsDomain R]
    [IsIntegrallyClosed R] [CharZero R] : IsJapanese R := sorry
 theorem IsJapanese.mvPolynomial (k : Type u) [Field k] (n : ℕ) :
    IsJapanese (MvPolynomial (Fin n) k) := sorry
 theorem IsJapanese.powerSeries [IsNoetherianRing R] [IsDomain R] (h : IsJapanese R) :
    IsJapanese (PowerSeries R) := sorry
 theorem integralClosure_isNoetherianRing_of_krullDimLE_one [IsNoetherianRing R] [IsDomain R]
    (h : ringKrullDim R ≤ 1) (L : Type u) [Field L] [Algebra (FractionRing R) L]
    [Module.Finite (FractionRing R) L] :
    letI : Algebra R L := ((algebraMap (FractionRing R) L).comp (algebraMap R (FractionRing R))).toAlgebra
    IsNoetherianRing (integralClosure R L) := sorry
 theorem isNagata_iff_isUniversallyJapanese : IsNagata R ↔
    IsNoetherianRing R ∧ IsUniversallyJapanese R := sorry
 theorem IsNagata.of_finiteType (B : Type u) [CommRing B] [Algebra R B]
    [Algebra.FiniteType R B] (h : IsNagata R) : IsNagata B := sorry
 theorem IsNagata.finite_integralClosure (B : Type u) [CommRing B] [Algebra R B]
    [Algebra.EssFiniteType R B] [IsReduced B] (h : IsNagata R) : Module.Finite R (integralClosure R B) := sorry
 theorem IsNagata.of_isAdicComplete [IsNoetherianRing R] [IsLocalRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsNagata R := sorry
-- test: Ring.IsN1.test_isIntegrallyClosed
example [IsDomain R] [IsIntegrallyClosed R] : IsN1 R := by sorry
-- test: Ring.IsJapanese.test_infinite_polynomial
example (k : Type u) [Field k] : IsJapanese (MvPolynomial ℕ k) ∧
    ¬ IsNoetherianRing (MvPolynomial ℕ k) := by sorry
-- test: Ring.IsNagata.test_infinite_polynomial
example (k : Type u) [Field k] : ¬ IsNagata (MvPolynomial ℕ k) := by sorry
-- node: SchemeAndStackFoundations:SF.0/non-japanese-dvr
-- The explicit finite-coefficient-field subring of k[[x]] is omitted here.
-- This existential consequence retains the distinguishing N-1/N-2 failure.
 theorem finiteCoeffPowerSeries_not_isJapanese (p : ℕ) [Fact p.Prime] :
    ∃ A : CommRingCat.{u}, ∃ hd : IsDomain A,
      letI := hd;
      CharP A p ∧ IsDiscreteValuationRing A ∧ IsN1 A ∧ ¬ IsJapanese A := sorry
-- test: Ring.IsJapanese.test_non_japanese_dvr; Ring.IsNagata.test_non_japanese_dvr
-- The fixed finite-coefficient-field subring carrier, rather than a fresh arbitrary
-- Japanese predicate, is needed to instantiate these tests and is omitted here.
-- node: SchemeAndStackFoundations:SF.0/non-catenary-local-domain
-- Nagata's explicit semilocal subring construction is omitted; the existence
-- statement below is its three-dimensional local-domain consequence.
 theorem exists_isLocalRing_isNoetherianRing_isDomain_not_isCatenary :
    ∃ A : CommRingCat.{u}, IsLocalRing A ∧ IsNoetherianRing A ∧ IsDomain A ∧
      ringKrullDim A = 3 ∧ ¬ IsCatenary A := sorry
end Ring

namespace AlgebraicGeometry.Scheme.Modules
variable {X : Scheme.{u}}
 theorem annihilator_ideal (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType]
    (U : X.affineOpens) : (annihilator F).ideal U = Module.annihilator Γ(X,U) Γ(F,U) := sorry
 theorem support_annihilator (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] :
    (annihilator F).support = {x | Nontrivial (stalkModule F x)} := sorry
 theorem exists_pushforward_schemeSupport (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] :
    ∃ (G : (schemeSupport F).Modules) (_ : G.IsQuasicoherent) (_ : G.IsFiniteType),
      Nonempty (((pushforward (annihilator F).subschemeι).obj G) ≅ F) := sorry
 theorem annihilator_restrict (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType]
    (U : X.Opens) [((restrictFunctor U.ι).obj F).IsQuasicoherent]
    [((restrictFunctor U.ι).obj F).IsFiniteType] :
    annihilator ((restrictFunctor U.ι).obj F) = (annihilator F).comap U.ι := sorry
 theorem supportDim_stalk_eq (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] (x : X) :
    Module.supportDim (X.presheaf.stalk x) (stalkModule F x) =
      ringKrullDim ((X.presheaf.stalk x) ⧸ Module.annihilator (X.presheaf.stalk x) (stalkModule F x)) := sorry
 def IsCohenMacaulay (F : X.Modules) : Prop := F.IsQuasicoherent ∧ F.IsFiniteType ∧
    ∀ x, Subsingleton (stalkModule F x) ∨
      (IsLocalRing.depth (X.presheaf.stalk x) (stalkModule F x) : WithBot ℕ∞) =
        Module.supportDim (X.presheaf.stalk x) (stalkModule F x)
 theorem isCohenMacaulay_iff_forall_satisfiesSerreS [IsLocallyNoetherian X]
    (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] :
    IsCohenMacaulay F ↔ ∀ n, SatisfiesSerreS F n := sorry
 theorem satisfiesSerreS_iff_affineOpens [IsLocallyNoetherian X]
    (F : X.Modules) [F.IsQuasicoherent] [F.IsFiniteType] (n : ℕ) :
    SatisfiesSerreS F n ↔ ∀ U : X.affineOpens, Module.SatisfiesSerreS Γ(X,U) Γ(F,U) n := sorry
-- test: AlgebraicGeometry.Scheme.Modules.annihilator_structureSheaf
example [(SheafOfModules.unit X.ringCatSheaf).IsQuasicoherent] [(SheafOfModules.unit X.ringCatSheaf).IsFiniteType] : annihilator (SheafOfModules.unit X.ringCatSheaf) = ⊥ := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.annihilator_zero
example [((SheafOfModules.free (R := X.ringCatSheaf) PEmpty)).IsQuasicoherent] [((SheafOfModules.free (R := X.ringCatSheaf) PEmpty)).IsFiniteType] :
    annihilator (SheafOfModules.free (R := X.ringCatSheaf) PEmpty) = ⊤ := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.schemeSupport_Spec
example {A : CommRingCat.{u}} (M : ModuleCat.{u} A) [Module.Finite A M]
    [(AlgebraicGeometry.tilde M).IsFiniteType] :
    Nonempty (schemeSupport (AlgebraicGeometry.tilde M) ≅ Spec (CommRingCat.of (A ⧸ Module.annihilator A M))) := by sorry
-- test: AlgebraicGeometry.Scheme.Modules.schemeSupport_nonreduced
example (k : Type u) [Field k] (F : (Spec (CommRingCat.of (Polynomial k))).Modules)
    [F.IsQuasicoherent] [F.IsFiniteType]
    (hF : Nonempty (F ≅ AlgebraicGeometry.tilde (ModuleCat.of (Polynomial k)
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)^2})))) :
    Nonempty (schemeSupport F ≅ Spec (CommRingCat.of
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)^2}))) := by sorry
-- AlgebraicGeometry.Scheme.Modules.IsCohenMacaulay.test_point_on_plane and
-- AlgebraicGeometry.Scheme.Modules.SatisfiesSerreS.test_point_on_plane use the
-- tilde of the origin quotient of k[x,y]; the two-generator ideal carrier is omitted here.
end AlgebraicGeometry.Scheme.Modules

namespace AlgebraicGeometry
variable (X : Scheme.{u})
 theorem isCohenMacaulay_iff_stalks : IsCohenMacaulay X ↔
    IsLocallyNoetherian X ∧ ∀ x, Ring.IsCohenMacaulay (X.presheaf.stalk x) := sorry
 theorem isCohenMacaulay_iff_affineOpens [IsLocallyNoetherian X] : IsCohenMacaulay X ↔
    ∀ U : X.affineOpens, Ring.IsCohenMacaulay Γ(X,U) := sorry
 theorem isCohenMacaulay_Spec_iff (R : Type u) [CommRing R] :
    IsCohenMacaulay (Spec (CommRingCat.of R)) ↔ Ring.IsCohenMacaulay R := sorry
 theorem IsCohenMacaulay.isUniversallyCatenary (h : IsCohenMacaulay X) : IsUniversallyCatenary X := sorry
 theorem IsCohenMacaulay.of_isRegular [IsLocallyNoetherian X]
    (h : ∀ x, IsRegularLocalRing (X.presheaf.stalk x)) : IsCohenMacaulay X := sorry
 def IsQuasiCohenMacaulay : Prop := IsLocallyNoetherian X ∧
    ∃ F : X.Modules, Scheme.Modules.IsCohenMacaulay F ∧ ∀ x, Nontrivial (Scheme.Modules.stalkModule F x)
 theorem isUniversallyCatenary_iff_affineOpens [IsLocallyNoetherian X] : IsUniversallyCatenary X ↔
    ∀ U : X.affineOpens, Ring.IsUniversallyCatenary Γ(X,U) := sorry
 theorem isUniversallyCatenary_iff_stalks [IsLocallyNoetherian X] : IsUniversallyCatenary X ↔
    ∀ x, Ring.IsUniversallyCatenary (X.presheaf.stalk x) := sorry
 theorem isUniversallyCatenary_Spec_iff (R : Type u) [CommRing R] :
    IsUniversallyCatenary (Spec (CommRingCat.of R)) ↔ Ring.IsUniversallyCatenary R := sorry
 theorem IsUniversallyCatenary.of_locallyOfFiniteType {Y : Scheme.{u}}
    (f : X ⟶ Y) [LocallyOfFiniteType f] (h : IsUniversallyCatenary Y) : IsUniversallyCatenary X := sorry
 theorem satisfiesSerreS_Spec_iff (R : Type u) [CommRing R] (n : ℕ) :
    SatisfiesSerreS (Spec (CommRingCat.of R)) n ↔ Ring.SatisfiesSerreS R n := sorry
 theorem isNagata_iff_affineOpens : IsNagata X ↔ ∀ U : X.affineOpens, Ring.IsNagata Γ(X,U) := sorry
 theorem IsNagata.isLocallyNoetherian (h : IsNagata X) : IsLocallyNoetherian X := sorry
-- test: AlgebraicGeometry.IsNagata.test_Spec
example (R : Type u) [CommRing R] : IsNagata (Spec (CommRingCat.of R)) ↔ Ring.IsNagata R := by sorry
-- test: AlgebraicGeometry.IsCohenMacaulay.test_affinePlane
example (k : Type u) [Field k] : IsCohenMacaulay (Spec (CommRingCat.of (MvPolynomial (Fin 2) k))) := by sorry
-- AlgebraicGeometry.IsCohenMacaulay.test_embedded_point and test_plane_and_line
-- use the two specified multivariable quotient rings; their carriers are omitted here.
end AlgebraicGeometry

/-! Imported contracts owned by the base packet, not additional targets of this part.
The definitions are expanded here because their planned modules cannot yet be imported. -/
namespace TauCeti.SchemeFoundations.Excellence
open AlgebraicGeometry
 def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧ ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
    IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)
 def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)
 def IsGRing (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal)) (Localization.AtPrime p.asIdeal))
 def IsJ2 (R : Type u) [CommRing R] : Prop := IsNoetherianRing R ∧
    ∀ (B : Type u) [CommRing B] [Algebra R B], Algebra.FiniteType R B →
      IsOpen {p : PrimeSpectrum B | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}
 def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop := IsGRing R ∧ IsJ2 R
 def IsExcellentRing (R : Type u) [CommRing R] : Prop := IsQuasiExcellentRing R ∧ Ring.IsUniversallyCatenary R
 def IsQuasiExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsQuasiExcellentRing Γ(X,U)
end TauCeti.SchemeFoundations.Excellence

namespace AlgebraicGeometry
 def IsCMQuasiExcellent (X : Scheme.{u}) : Prop := IsLocallyNoetherian X ∧
  (∀ x : X, ∀ p : PrimeSpectrum (X.presheaf.stalk x),
    Ring.IsCohenMacaulay (p.asIdeal.Fiber
      (AdicCompletion (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) (X.presheaf.stalk x)))) ∧
  ∀ (Y : Scheme.{u}) (i : Y ⟶ X) [IsClosedImmersion i] [IsIntegral Y],
    ∃ U : Y.Opens, Nonempty U ∧ IsCohenMacaulay U.toScheme
 def IsSnQuasiExcellent (X : Scheme.{u}) (n : ℕ) : Prop := IsLocallyNoetherian X ∧
  (∀ x : X, ∀ p : PrimeSpectrum (X.presheaf.stalk x),
    Ring.SatisfiesSerreS (p.asIdeal.Fiber
      (AdicCompletion (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) (X.presheaf.stalk x))) n) ∧
  ∀ (Y : Scheme.{u}) (i : Y ⟶ X) [IsClosedImmersion i] [IsIntegral Y],
    ∃ U : Y.Opens, Nonempty U ∧ SatisfiesSerreS U.toScheme n
 def IsCMExcellent (X : Scheme.{u}) : Prop := IsCMQuasiExcellent X ∧ IsUniversallyCatenary X
 def IsSnExcellent (X : Scheme.{u}) (n : ℕ) : Prop := IsSnQuasiExcellent X n ∧ IsUniversallyCatenary X
 theorem IsCMQuasiExcellent.isLocallyNoetherian {X : Scheme.{u}} (h : IsCMQuasiExcellent X) : IsLocallyNoetherian X := sorry
 theorem IsCMQuasiExcellent.isCohenMacaulay_formalFibre {X : Scheme.{u}} (h : IsCMQuasiExcellent X)
    (x : X) (p : PrimeSpectrum (X.presheaf.stalk x)) :
    Ring.IsCohenMacaulay (p.asIdeal.Fiber
      (AdicCompletion (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) (X.presheaf.stalk x))) := sorry
 theorem IsCMQuasiExcellent.exists_isCohenMacaulay_open {X Y : Scheme.{u}} (h : IsCMQuasiExcellent X)
    (i : Y ⟶ X) [IsClosedImmersion i] [IsIntegral Y] :
    ∃ U : Y.Opens, Nonempty U ∧ IsCohenMacaulay U.toScheme := sorry
 theorem IsCMQuasiExcellent.isSnQuasiExcellent {X : Scheme.{u}} (h : IsCMQuasiExcellent X) (n : ℕ) : IsSnQuasiExcellent X n := sorry
 theorem isCMQuasiExcellent_iff_of_openCover (X : Scheme.{u}) (U : ι → X.Opens) (hU : ⨆ i, U i = ⊤) :
    IsCMQuasiExcellent X ↔ ∀ i, IsCMQuasiExcellent (U i).toScheme := sorry
-- test: AlgebraicGeometry.IsCMExcellent.test_field
example (k : Type u) [Field k] : IsCMExcellent (Spec (CommRingCat.of k)) := by sorry
-- test: AlgebraicGeometry.IsCMExcellent.test_empty
example : IsCMExcellent Scheme.empty := by sorry
-- test: AlgebraicGeometry.IsSnQuasiExcellent.test_zero
example (X : Scheme.{u}) : IsSnQuasiExcellent X 0 ↔ IsLocallyNoetherian X := by sorry
-- AlgebraicGeometry.IsCMExcellent.test_non_japanese_dvr uses the explicit
-- finite-coefficient-field DVR omitted above; its formal fibres, not regularity,
-- certify CM-excellence. AlgebraicGeometry.IsCMExcellent.test_nagata_domain uses
-- the non-universally-catenary two-dimensional Nagata local-domain carrier, also omitted.
end AlgebraicGeometry

namespace TauCeti.SchemeFoundations.Excellence
 theorem IsQuasiExcellentRing.isNagata {R : Type u} [CommRing R] (h : IsQuasiExcellentRing R) : Ring.IsNagata R := sorry
 theorem IsQuasiExcellentScheme.isCMQuasiExcellent {X : AlgebraicGeometry.Scheme.{u}}
    (h : IsQuasiExcellentScheme X) : AlgebraicGeometry.IsCMQuasiExcellent X := sorry
 theorem IsGRing.isReduced_adicCompletion {R : Type u} [CommRing R] [IsLocalRing R]
    [IsReduced R] (h : IsGRing R) :
    IsReduced (AdicCompletion (IsLocalRing.maximalIdeal R) R) := sorry
 theorem IsExcellentRing.standard_examples :
    IsExcellentRing ℤ ∧ (∀ k : Type u, ∀ (_ : Field k), IsExcellentRing k) := sorry
-- The Dedekind characteristic-zero and complete-local clauses of excellent-examples
-- are omitted from this joint prototype, but explicitly stated in the roadmap.
 theorem RegularAlgebraMap.exists_isColimit_smooth {R B : Type u} [CommRing R] [CommRing B]
    [Algebra R B] [IsNoetherianRing R] [IsNoetherianRing B] (h : RegularAlgebraMap R B) :
    ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (F : J ⥤ CommAlgCat.{u} R),
      (∀ j, Algebra.Smooth R (F.obj j)) ∧
      ∃ c : Cocone F, Nonempty (c.pt ≅ CommAlgCat.of R B) ∧ Nonempty (IsColimit c) := sorry
end TauCeti.SchemeFoundations.Excellence

namespace AlgebraicGeometry.Scheme.Hom
-- The general theorem also allows reduced sources with finitely many components
-- on quasi-compact opens and finitely generated generic residue-field extensions.
-- Those two predicates are omitted here; the finite-type instance below has them.
 theorem isFinite_fromNormalization_of_isNagata {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsReduced X] [LocallyOfFiniteType f] [QuasiCompact f] [QuasiSeparated f] (h : AlgebraicGeometry.IsNagata Y) : IsFinite f.fromNormalization := sorry
end AlgebraicGeometry.Scheme.Hom

namespace AlgebraicGeometry.Scheme
variable {X Y : Scheme.{u}}
-- node: SchemeAndStackFoundations:SF.0/universal-homeomorphism-etale-site
 def etalePullbackEquivalence (f : X ⟶ Y) [IsUniversalHomeomorphism f] : Y.Etale ≌ X.Etale := sorry
 def etalePullbackEquivalence_objIso (f : X ⟶ Y) [IsUniversalHomeomorphism f] (U : Y.Etale) :
    ((etalePullbackEquivalence f).functor.obj U).left ≅ pullback U.hom f := sorry
 def etaleSheafEquivalence (f : X ⟶ Y) [IsUniversalHomeomorphism f] :
    Sheaf (smallEtaleTopology Y) (Type u) ≌ Sheaf (smallEtaleTopology X) (Type u) := sorry
 theorem Etale.pullback_isDenseSubsite (f : X ⟶ Y) [IsUniversalHomeomorphism f] :
    (etalePullbackEquivalence f).functor.IsDenseSubsite (smallEtaleTopology Y) (smallEtaleTopology X) := sorry
-- node: SchemeAndStackFoundations:SF.0/witt-scheme
variable (p : ℕ) [Fact p.Prime] [HasCharP X p] [HasCharP Y p]
 def wittScheme (X : Scheme.{u}) (p : ℕ) [Fact p.Prime] [HasCharP X p] [IsPerfect X p]
    (n : ℕ) (hn : 0 < n) : Scheme.{u} := sorry
 def wittSchemeSpecIso (A : Type u) [CommRing A] [TauCeti.KilledBy A p] [PerfectRing A p]
    [IsPerfect (Spec (CommRingCat.of A)) p] (n : ℕ) (hn : 0 < n) :
    wittScheme (Spec (CommRingCat.of A)) p n hn ≅ Spec (CommRingCat.of (TruncatedWittVector p n A)) := sorry
 def wittSchemeOpenCover [IsPerfect X p] (n : ℕ) (hn : 0 < n) : (wittScheme X p n hn).OpenCover := sorry
 def wittSchemeTruncation [IsPerfect X p] (n : ℕ) (hn : 0 < n) :
    wittScheme X p n hn ⟶ wittScheme X p (n+1) (by omega) := sorry
 theorem wittSchemeTruncation_isClosedImmersion [IsPerfect X p] (n : ℕ) (hn : 0 < n) :
    IsClosedImmersion (wittSchemeTruncation (X := X) p n hn) := sorry
 def wittSchemeMap [IsPerfect X p] [IsPerfect Y p] (f : X ⟶ Y) (n : ℕ) (hn : 0 < n) :
    wittScheme X p n hn ⟶ wittScheme Y p n hn := sorry
 def wittSchemeToZModPow [IsPerfect X p] (n : ℕ) (hn : 0 < n) :
    wittScheme X p n hn ⟶ Spec (CommRingCat.of (ULift.{u} (ZMod (p^n)))) := sorry
 theorem wittSchemeToZModPow_flat [IsPerfect X p] (n : ℕ) (hn : 0 < n) :
    Flat (wittSchemeToZModPow (X := X) p n hn) := sorry
-- test: AlgebraicGeometry.Scheme.wittScheme_Spec_F_p
example [IsPerfect (Spec (CommRingCat.of (ZMod p))) p] (n : ℕ) (hn : 0 < n) :
    Nonempty (wittScheme (Spec (CommRingCat.of (ZMod p))) p n hn ≅
      Spec (CommRingCat.of (ZMod (p^n)))) := by sorry
-- test: AlgebraicGeometry.Scheme.wittScheme_one
example [IsPerfect X p] : Nonempty (wittScheme X p 1 (by decide) ≅ X) := by sorry
-- test: AlgebraicGeometry.Scheme.wittScheme_not_over_X
example [IsPerfect (Spec (CommRingCat.of (ZMod p))) p] :
    IsEmpty (wittScheme (Spec (CommRingCat.of (ZMod p))) p 2 (by decide) ⟶ Spec (CommRingCat.of (ZMod p))) := by sorry
-- test: AlgebraicGeometry.Scheme.wittScheme_basicOpen
example (A : Type u) [CommRing A] [TauCeti.KilledBy A p] [PerfectRing A p]
    (n : ℕ) (f : A) :
    Nonempty (Localization.Away
      (WittVector.truncate n (WittVector.teichmuller p f)) ≃+*
      TruncatedWittVector p n (Localization.Away f)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/weakly-normal-scheme
/-- Birationality retains the generic-point bijection and the actual generic stalk maps. -/
 def BirationalOnComponents (f : X ⟶ Y) : Prop :=
    Set.BijOn f (genericPoints X) (genericPoints Y) ∧
    ∀ x ∈ genericPoints X, Function.Bijective (f.stalkMap x)
 class IsWeaklyNormal (X : Scheme.{u}) : Prop where
  reduced : IsReduced X
  isIso : ∀ (Y : Scheme.{u}) (f : Y ⟶ X), IsReduced Y → IsFinite f →
    IsUniversalHomeomorphism f → BirationalOnComponents f → IsIso f
 def PClosedInTotalFractions (A : Type u) [CommRing A] (p : ℕ) : Prop :=
    ∀ b : FractionRing A,
      b^p ∈ Set.range (algebraMap A (FractionRing A)) →
      b ∈ Set.range (algebraMap A (FractionRing A))
 theorem isWeaklyNormal_iff_pClosed (k : Type u) [Field k] [PerfectField k]
    [CharP k p] [IsReduced X] (a : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType a] [QuasiCompact a] : IsWeaklyNormal X ↔
    ∀ U : X.affineOpens, PClosedInTotalFractions Γ(X,U) p := sorry
 theorem IsWeaklyNormal.of_normal (k : Type u) [Field k] [PerfectField k] [CharP k p]
    (a : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFiniteType a] [QuasiCompact a]
    (h : ∀ x, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x)) : IsWeaklyNormal X := sorry
 theorem IsWeaklyNormal.restrict [IsWeaklyNormal X] (U : X.Opens) : IsWeaklyNormal U.toScheme := sorry
-- test: AlgebraicGeometry.Scheme.not_isWeaklyNormal_cusp
example (k : Type u) [Field k] [PerfectField k] [CharP k p] :
    ¬ IsWeaklyNormal (Spec (CommRingCat.of (AlgebraicGeometry.cuspSubalgebra k))) := by sorry
-- test: AlgebraicGeometry.Scheme.isWeaklyNormal_node
example (k : Type u) [Field k] [PerfectField k] [CharP k p] (hp : p ≠ 2) :
    IsWeaklyNormal (Spec (CommRingCat.of (AlgebraicGeometry.nodeSubalgebra k))) := by sorry
-- test: AlgebraicGeometry.Scheme.isWeaklyNormal_affineSpace
example (k : Type u) [Field k] [PerfectField k] [CharP k p] (n : ℕ) :
    IsWeaklyNormal (Spec (CommRingCat.of (MvPolynomial (Fin n) k))) := by sorry
-- test: AlgebraicGeometry.Scheme.isWeaklyNormal_needs_reduced_source
-- The embedded square-zero origin is the concrete quotient k[t,e]/(e²,te).
def embeddedOriginIdeal (k : Type u) [Field k] : Ideal (MvPolynomial (Fin 2) k) :=
  Ideal.span {MvPolynomial.X 1 ^ 2, MvPolynomial.X 0 * MvPolynomial.X 1}
abbrev embeddedOriginRing (k : Type u) [Field k] :=
  MvPolynomial (Fin 2) k ⧸ embeddedOriginIdeal k
example (k : Type u) [Field k] :
    ∃ f : Spec (CommRingCat.of (embeddedOriginRing k)) ⟶ Spec (CommRingCat.of (Polynomial k)),
      IsFinite f ∧ IsUniversalHomeomorphism f ∧ BirationalOnComponents f ∧ ¬ IsIso f := by sorry
-- node: SchemeAndStackFoundations:SF.0/weakly-normal-model
-- The prescribed finitely generated generic subfields K_i and the resulting
-- unique pushout model are omitted here; this is their existence consequence.
 theorem weaklyNormalModel (k : Type u) [Field k] [PerfectField k] [CharP k p]
    (a : X ⟶ Spec (CommRingCat.of k)) [PerfectlyFinitelyPresented p a] :
    ∃ (X₀ : Scheme.{u}) (hc : HasCharP X₀ p) (a₀ : X₀ ⟶ Spec (CommRingCat.of k)),
      letI := hc;
      IsWeaklyNormal X₀ ∧ LocallyOfFiniteType a₀ ∧ QuasiCompact a₀ ∧
        ∃ e : perfection X₀ p ≅ X, e.hom ≫ a = perfectionι (X := X₀) p ≫ a₀ := sorry
end AlgebraicGeometry.Scheme
namespace AlgebraicGeometry
-- node: SchemeAndStackFoundations:SF.0/frobenius-factors-through-universal-homeomorphism
 theorem exists_frobenius_factorization_of_isUniversalHomeomorphism
    {X Y : Scheme.{u}} (p : ℕ) [Fact p.Prime] [Scheme.HasCharP X p] [Scheme.HasCharP Y p]
    (f : X ⟶ Y) [IsFinite f] [LocallyOfFinitePresentation f] [IsUniversalHomeomorphism f]
    [CompactSpace Y] [QuasiSeparatedSpace Y] :
    ∃ n : ℕ, ∃ g : Y ⟶ X,
      f ≫ g = Scheme.iterateEnd (Scheme.absoluteFrobenius X p) n ∧
      g ≫ f = Scheme.iterateEnd (Scheme.absoluteFrobenius Y p) n := sorry
end AlgebraicGeometry

namespace TauCeti
-- node: SchemeAndStackFoundations:SF.0/local-dimension
/-- The dimension of the smallest-dimensional open neighbourhood, expressed as an infimum. -/
def topologicalKrullDimAt {T : Type u} [TopologicalSpace T] (x : T) : WithBot ℕ∞ :=
  ⨅ U : TopologicalSpace.Opens T, ⨅ (_ : x ∈ U), topologicalKrullDim U
 theorem topologicalKrullDimAt_le {T : Type u} [TopologicalSpace T] (x : T) :
    topologicalKrullDimAt x ≤ topologicalKrullDim T := sorry
 theorem iSup_topologicalKrullDimAt (T : Type u) [TopologicalSpace T] :
    (⨆ x : T, topologicalKrullDimAt x) = topologicalKrullDim T := sorry
 theorem topologicalKrullDimAt_of_isOpenEmbedding {T V : Type u}
    [TopologicalSpace T] [TopologicalSpace V] (j : T → V) (h : Topology.IsOpenEmbedding j) (x : T) :
    topologicalKrullDimAt x = topologicalKrullDimAt (j x) := sorry
 theorem topologicalKrullDimAt_of_isHomeomorph {T V : Type u}
    [TopologicalSpace T] [TopologicalSpace V] (e : T ≃ₜ V) (x : T) :
    topologicalKrullDimAt x = topologicalKrullDimAt (e x) := sorry
 theorem upperSemicontinuous_topologicalKrullDimAt (T : Type u) [TopologicalSpace T] (n : ℕ) :
    IsOpen {x : T | topologicalKrullDimAt x ≤ n} := sorry
-- test: TauCeti.topologicalKrullDimAt_of_isOpen_singleton
example {T : Type u} [TopologicalSpace T] (x : T) (h : IsOpen ({x} : Set T)) :
    topologicalKrullDimAt x = 0 := by sorry
-- test: TauCeti.topologicalKrullDimAt_sum_affineSpace
example (k : Type u) [Field k] (q : PrimeSpectrum (Polynomial k)) :
    let T := PrimeSpectrum (MvPolynomial (Fin 2) k) ⊕ PrimeSpectrum (Polynomial k);
    topologicalKrullDim T = 2 ∧ topologicalKrullDimAt (Sum.inr q : T) = 1 := by sorry
-- test: TauCeti.topologicalKrullDimAt_primeSpectrum_le
example (R : Type u) [CommRing R] (q : PrimeSpectrum R) :
    topologicalKrullDimAt q ≤ ringKrullDim R := by sorry
end TauCeti
namespace AlgebraicGeometry
open TauCeti
variable {X Y S : Scheme.{u}}
namespace Scheme.Hom
/-- The subspace fibre gives the point over x without choosing a pullback carrier. -/
def fiberDimAt (f : X ⟶ Y) (x : X) : WithBot ℕ∞ :=
  topologicalKrullDimAt (⟨x, rfl⟩ : {z : X | f z = f x})
-- node: SchemeAndStackFoundations:SF.0/fibre-dimension-semicontinuity
 theorem isOpen_setOf_fiberDimAt_le (f : X ⟶ Y) [LocallyOfFiniteType f] (n : ℕ) :
    IsOpen {x : X | fiberDimAt f x ≤ n} := sorry
 theorem isClosed_setOf_fiberDim_ge (f : X ⟶ Y) [LocallyOfFiniteType f]
    (hc : IsClosedMap f) (n : ℕ) : IsClosed {y : Y | n ≤ topologicalKrullDim (f.fiber y)} := sorry
 theorem fiberDimAt_baseChange (f : X ⟶ S) (g : Y ⟶ S) (x : ↥(pullback f g : Scheme.{u})) :
    fiberDimAt (pullback.snd f g) x = fiberDimAt f ((pullback.fst f g) x) := sorry
end Scheme.Hom
-- node: SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension
-- The structure map induces the k-algebra on X.functionField; it is explicitly supplied here.
 theorem topologicalKrullDim_eq_trdeg_functionField (k : Type u) [Field k]
    (a : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X]
    [LocallyOfFiniteType a] [QuasiCompact a] [Algebra k X.functionField]
    (ha : ∀ r : k, algebraMap k X.functionField r =
      X.presheaf.germ (⊤ : X.Opens) (genericPoint X) (by trivial)
        (a.appTop.hom ((Scheme.ΓSpecIso (CommRingCat.of k)).inv r))) :
    topologicalKrullDim X = (Algebra.trdeg k X.functionField).toENat := sorry
-- node: SchemeAndStackFoundations:SF.0/fibre-dimension-formula
 theorem dim_genericFiber_eq_sub (k : Type u) [Field k]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    (f : X ⟶ Y) (h : f ≫ b = a) [IsIntegral X] [IsIntegral Y]
    [LocallyOfFiniteType a] [QuasiCompact a] [LocallyOfFiniteType b] [QuasiCompact b]
    (hd : DenseRange f) :
    topologicalKrullDim X = topologicalKrullDim Y + topologicalKrullDim (f.fiber (genericPoint Y)) := sorry
-- node: SchemeAndStackFoundations:SF.0/geometric-irreducible-components
-- The component subschemes, the Galois action and finite-separable descent field
-- are named omissions from this prototype. It records dimension invariance below.
 theorem dim_baseChange_field (k K : Type u) [Field k] [Field K] [Algebra k K]
    (a : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFiniteType a] :
    topologicalKrullDim (pullback a (Spec.map (CommRingCat.ofHom (algebraMap k K))) : Scheme.{u}) =
      topologicalKrullDim X := sorry
-- node: SchemeAndStackFoundations:SF.0/generic-fibre-spreading
 theorem exists_isOpen_forall_geometricallyIrreducible_fiber (f : X ⟶ Y)
    [LocallyOfFiniteType f] [QuasiCompact f] [IrreducibleSpace Y]
    (h : GeometricallyIrreducible (f.fiberToSpecResidueField (genericPoint Y))) :
    ∃ U : Y.Opens, Nonempty U ∧ ∀ y ∈ U, GeometricallyIrreducible (f.fiberToSpecResidueField y) := sorry
-- node: SchemeAndStackFoundations:SF.0/flat-proper-fibre-loci
 theorem isOpen_setOf_geometricallyIntegral_fiber (f : X ⟶ Y)
    [IsProper f] [Flat f] [IsFinitePresentation f] :
    IsOpen {y : Y | GeometricallyIntegral (f.fiberToSpecResidueField y)} := sorry
-- node: SchemeAndStackFoundations:SF.0/fibre-power-irreducible
-- The m-fold iteration is a named omitted carrier; this is the two-fold induction step.
 theorem irreducibleSpace_fiberPower_of_geometricallyIrreducible (f : X ⟶ S)
    [Flat f] [LocallyOfFinitePresentation f] [GeometricallyIrreducible f] [IrreducibleSpace S] :
    IrreducibleSpace (pullback f f : Scheme.{u}) := sorry
-- node: SchemeAndStackFoundations:SF.0/rational-point-component
 theorem geometricallyIntegral_of_smooth_of_connectedSpace_of_section (k : Type u) [Field k]
    (a : X ⟶ Spec (CommRingCat.of k)) [Smooth a] [ConnectedSpace X]
    (s : Spec (CommRingCat.of k) ⟶ X) (hs : s ≫ a = 𝟙 _) : GeometricallyIntegral a := sorry
-- node: SchemeAndStackFoundations:SF.0/quasi-sections
 theorem Smooth.exists_etale_surjective_quasiSection (f : X ⟶ S) [Smooth f] [Surjective f] :
    ∃ (S' : Scheme.{u}) (g : S' ⟶ S) (h : S' ⟶ X), Etale g ∧ Surjective g ∧ h ≫ f = g := sorry
-- node: SchemeAndStackFoundations:SF.0/flat-over-dedekind
-- DedekindScheme is stated by its local field-or-DVR condition; the imported
-- regular-scheme carrier is not reconstructed here.
 theorem flat_of_isDominant_of_isDedekindScheme (f : X ⟶ S) [IsIntegral X] [IsIntegral S]
    [IsLocallyNoetherian S] [CompactSpace S] (hl : ∀ s : S, IsField (S.presheaf.stalk s) ∨
      IsDiscreteValuationRing (S.presheaf.stalk s)) (hd : DenseRange f) : Flat f := sorry
-- node: SchemeAndStackFoundations:SF.0/jacobson-finite-type
 theorem finite_residueField_of_isClosed_of_locallyOfFiniteType_int
    (a : X ⟶ Spec (CommRingCat.of (ULift.{u} ℤ))) [LocallyOfFiniteType a]
    (x : X) (hx : IsClosed ({x} : Set X)) : Finite (X.residueField x) := sorry
-- node: SchemeAndStackFoundations:SF.0/field-extension-descent
 theorem isProper_of_isProper_baseChange_field (k K : Type u) [Field k] [Field K] [Algebra k K]
    (a : X ⟶ Spec (CommRingCat.of k))
    (h : IsProper (pullback.snd a (Spec.map (CommRingCat.ofHom (algebraMap k K))))) : IsProper a := sorry
-- node: SchemeAndStackFoundations:SF.0/unramified-criteria
 theorem locallyQuasiFinite_of_formallyUnramified (f : X ⟶ Y)
    [LocallyOfFiniteType f] [FormallyUnramified f] : LocallyQuasiFinite f := sorry
end AlgebraicGeometry

namespace AlgebraicGeometry.Scheme
variable {I : Type u} [SmallCategory I] [IsCofiltered I]
variable (D : I ⥤ Scheme.{u})
-- node: SchemeAndStackFoundations:SF.0/affine-transition-limits
 def affineTransitionLimitCone
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) : Cone D := sorry
 def affineTransitionLimitCone_isLimit
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) :
    IsLimit (affineTransitionLimitCone D h) := sorry
 theorem hasLimit_of_isAffineHom
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) : HasLimit D := sorry
 theorem isAffineHom_limit_π (c : Cone D) (hc : IsLimit c)
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) (i : I) : IsAffineHom (c.π.app i) := sorry
 def preimageRingDiagram (i : I) (U : (D.obj i).Opens) : (Over i)ᵒᵖ ⥤ CommRingCat.{u} := sorry
 theorem preimageRingDiagram_obj (i : I) (U : (D.obj i).Opens) (j : Over i) :
    (preimageRingDiagram D i U).obj (Opposite.op j) = Γ(D.obj j.left, D.map j.hom ⁻¹ᵁ U) := sorry
 def limit_preimage_affine_isoSpec (c : Cone D) (hc : IsLimit c)
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) (i : I)
    (U : (D.obj i).Opens) (hU : IsAffineOpen U) :
    (c.π.app i ⁻¹ᵁ U).toScheme ≅ Spec (colimit (preimageRingDiagram D i U)) := sorry
 def limit_carrier_homeomorph (c : Cone D) (hc : IsLimit c)
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) :
    c.pt ≃ₜ ↥(limit (D ⋙ Scheme.forgetToTop)) := sorry
 def limitResidueDiagram (c : Cone D) (s : c.pt) : Iᵒᵖ ⥤ CommRingCat.{u} := sorry
 theorem limitResidueDiagram_obj (c : Cone D) (s : c.pt) (i : I) :
    (limitResidueDiagram D c s).obj (Opposite.op i) = (D.obj i).residueField (c.π.app i s) := sorry
 def residueField_limit_iso (c : Cone D) (hc : IsLimit c)
    (h : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (D.map f)) (s : c.pt) :
    c.pt.residueField s ≅ colimit (limitResidueDiagram D c s) := sorry
-- pullback_limit_iso: the diagram over Over i has objects
-- T ×_(D_i) D_j, maps induced by D, and its limit is T ×_(D_i) c.pt.
-- This prepared pullback diagram is omitted from the prototype, not replaced by a Prop parameter.
-- test: AlgebraicGeometry.Scheme.limit_const
example (X : Scheme.{u}) (c : Cone ((Functor.const I).obj X))
    (hc : IsLimit c) (i : I) : IsIso (c.π.app i) := by sorry
-- test: AlgebraicGeometry.Scheme.limit_of_affine_eq_spec_colim
example (R : Iᵒᵖ ⥤ CommRingCat.{u}) (c : Cone (R.op ⋙ Scheme.Spec))
    (hc : IsLimit c) : Nonempty (c.pt ≅ Spec (colimit R)) := by sorry
-- test: AlgebraicGeometry.Scheme.limit_spec_localization_factorial
-- The diagram of Z[1/n!] and its maps are an omitted concrete carrier.
example (R : ℕ ⥤ CommRingCat) (hR : ∀ n, Nonempty
    (R.obj n ≃+* Localization.Away (n.factorial : ℤ)))
    (f : Cocone R) (hf : IsColimit f) [Algebra ℤ f.pt]
    (hcompat : ∀ n, ∃ e : R.obj n ≃+* Localization.Away (n.factorial : ℤ),
      ∀ z : ℤ, f.ι.app n (e.symm (algebraMap ℤ _ z)) = algebraMap ℤ f.pt z)
    : Nonempty (f.pt ≃+* ℚ) := by sorry
-- test: AlgebraicGeometry.Scheme.limit_genericPoint_affineLine
-- The enumerated finite-complement opens for a countable k are an omitted carrier;
-- the README specifies the maps and requires the resulting limit to be Spec k(t).
-- node: SchemeAndStackFoundations:SF.0/noetherian-approximation
 theorem exists_isLimit_finiteType_int (S : Scheme.{u}) [CompactSpace S] [QuasiSeparatedSpace S] :
    ∃ (J : Type u) (_ : SmallCategory J) (_ : IsCofiltered J) (F : J ⥤ Scheme.{u})
      (c : Cone F), Nonempty (IsLimit c) ∧ Nonempty (S ≅ c.pt) ∧
      (∀ i j (f : i ⟶ j), IsAffineHom (F.map f)) ∧
      ∀ i, ∃ a : F.obj i ⟶ Spec (CommRingCat.of (ULift.{u} ℤ)), LocallyOfFiniteType a ∧ QuasiCompact a := sorry
-- node: SchemeAndStackFoundations:SF.0/finite-presentation-limits
 theorem exists_finitePresentation_model_of_isLimit (c : Cone D) (hc : IsLimit c)
    (h : ∀ i j (f : i ⟶ j), IsAffineHom (D.map f))
    (hqc : ∀ i, CompactSpace (D.obj i)) (hqs : ∀ i, QuasiSeparatedSpace (D.obj i))
    (X : Scheme.{u}) (a : X ⟶ c.pt) [IsFinitePresentation a] :
    ∃ (i : I) (X₀ : Scheme.{u}) (a₀ : X₀ ⟶ D.obj i), IsFinitePresentation a₀ ∧
      ∃ e : X ≅ pullback a₀ (c.π.app i), e.hom ≫ pullback.snd _ _ = a := sorry
-- node: SchemeAndStackFoundations:SF.0/spreading-out-models
 theorem exists_model_over_localization_of_finitePresentation (A : Type u) [CommRing A]
    [IsDomain A] (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of (FractionRing A)))
    [IsFinitePresentation a] :
    ∃ (f : A) (_ : f ≠ 0) (X₀ : Scheme.{u}) (a₀ : X₀ ⟶ Spec (CommRingCat.of (Localization.Away f))),
      IsFinitePresentation a₀ ∧ ∃ (r : Localization.Away f →+* FractionRing A),
      (∀ x : A, r (algebraMap A _ x) = algebraMap A _ x) ∧
      ∃ e : X ≅ pullback a₀ (Spec.map (CommRingCat.ofHom r)), e.hom ≫ pullback.snd _ _ = a := sorry
end AlgebraicGeometry.Scheme

namespace IsLocalRing
open AlgebraicGeometry
variable (A : Type u) [CommRing A] [IsLocalRing A]
abbrev ReducedRing := A ⧸ nilradical A
abbrev NormalizedReducedRing := integralClosure (ReducedRing A) (FractionRing (ReducedRing A))
-- node: SchemeAndStackFoundations:SF.0/geometrically-unibranch
 class IsUnibranch : Prop where
  reducedDomain : IsDomain (ReducedRing A)
  normalizationLocal : IsLocalRing (NormalizedReducedRing A)
instance [IsUnibranch A] : IsDomain (ReducedRing A) := IsUnibranch.reducedDomain
instance [IsUnibranch A] : IsLocalRing (NormalizedReducedRing A) := IsUnibranch.normalizationLocal
 def unibranchResidueMap [IsUnibranch A] : ResidueField A →+* ResidueField (NormalizedReducedRing A) := sorry
-- The map is induced by A → A_red → normalization and the two residue quotient maps.
 class IsGeometricallyUnibranch : Prop extends IsUnibranch A where
  purelyInseparable :
    letI := (unibranchResidueMap A).toAlgebra
    IsPurelyInseparable (ResidueField A) (ResidueField (NormalizedReducedRing A))
 theorem IsGeometricallyUnibranch.of_isIntegrallyClosed [IsDomain A] [IsIntegrallyClosed A] :
    IsGeometricallyUnibranch A := sorry
-- isGeometricallyUnibranch_iff_strictHenselization: the strict henselization
-- carrier is imported from ModularCurves 4D and omitted; the exact target
-- is one minimal prime of A^sh, not locality or reducedness alone.
-- test: IsLocalRing.IsGeometricallyUnibranch.of_field
example (k : Type u) [Field k] : IsGeometricallyUnibranch k := by sorry
-- test: IsLocalRing.isGeometricallyUnibranch_of_isDiscreteValuationRing
example (D : Type u) [CommRing D] [IsDomain D] [IsDiscreteValuationRing D] : IsGeometricallyUnibranch D := by sorry
-- test: IsLocalRing.not_isUnibranch_node
-- The localizations at the displayed origins in the README are omitted;
-- the global normalization fibre still distinguishes the nodal case.
example (k : Type u) [Field k] (h : (2 : k) ≠ 0) :
    ∃ x : Spec (CommRingCat.of (AlgebraicGeometry.nodeSubalgebra k)),
      ¬ IsUnibranch ((Spec (CommRingCat.of (AlgebraicGeometry.nodeSubalgebra k))).presheaf.stalk x) := by sorry
-- test: IsLocalRing.isGeometricallyUnibranch_cusp
example (k : Type u) [Field k] (x : Spec (CommRingCat.of (AlgebraicGeometry.cuspSubalgebra k))) :
    IsGeometricallyUnibranch ((Spec (CommRingCat.of (AlgebraicGeometry.cuspSubalgebra k))).presheaf.stalk x) := by sorry
-- test: IsLocalRing.isUnibranch_not_isGeometricallyUnibranch_real
-- The real quadratic-cone origin and its C-residue normalization are an
-- omitted concrete quotient/localization carrier, specified in the README.
end IsLocalRing
namespace AlgebraicGeometry.Scheme
variable {X Y : Scheme.{u}}
 def IsGeometricallyUnibranchAt (X : Scheme.{u}) (x : X) : Prop :=
    IsLocalRing.IsGeometricallyUnibranch (X.presheaf.stalk x)
 def IsGeometricallyUnibranch (X : Scheme.{u}) : Prop := ∀ x, IsGeometricallyUnibranchAt X x
 theorem isGeometricallyUnibranchAt_of_isOpenImmersion (j : X ⟶ Y) [IsOpenImmersion j] (x : X) :
    IsGeometricallyUnibranchAt X x ↔ IsGeometricallyUnibranchAt Y (j x) := sorry
-- isGeometricallyUnibranchAt_iff_normalization and
-- IsGeometricallyUnibranch.isUniversallyHomeomorph_normalization use the
-- reduced normalization with locally finite components; that prepared
-- reduction/normalization composite is omitted here.
-- node: SchemeAndStackFoundations:SF.0/unibranch-finite-components
-- The connected-component scheme structure is a named omitted carrier.
-- The target concerns connected components of an etale-locally constant scheme
-- over a locally Noetherian geometrically unibranch base, with their finite
-- etale projections. It does not concern arbitrary locally finite type schemes.
variable (X : Scheme.{u}) [IsIntegral X]
variable (Kbar : Type u) [Field Kbar] [Algebra X.functionField Kbar] [IsAlgClosure X.functionField Kbar]
 def algebraicGenericPoint : Spec (CommRingCat.of Kbar) ⟶ X :=
    Spec.map (CommRingCat.ofHom (algebraMap X.functionField Kbar)) ≫ X.fromSpecStalk (genericPoint X)
instance algebraicGenericPoint_isAffineHom : IsAffineHom (algebraicGenericPoint X Kbar) := by sorry
-- node: SchemeAndStackFoundations:SF.0/absolute-integral-closure
 def absoluteIntegralClosure : Scheme.{u} := (algebraicGenericPoint X Kbar).normalization
 def absoluteIntegralClosure.π : absoluteIntegralClosure X Kbar ⟶ X :=
    (algebraicGenericPoint X Kbar).fromNormalization
 theorem absoluteIntegralClosure.integral : IsIntegralHom (absoluteIntegralClosure.π X Kbar) := sorry
 theorem absoluteIntegralClosure.isIntegral : IsIntegral (absoluteIntegralClosure X Kbar) := sorry
 def absoluteIntegralClosure.preimage_affine_iso (U : X.Opens) (hU : IsAffineOpen U) (hne : Nonempty U)
    [Algebra Γ(X,U) Kbar]
    (hcompat : ∀ r : Γ(X,U), algebraMap Γ(X,U) Kbar r =
      algebraMap X.functionField Kbar (X.presheaf.germ U (genericPoint X)
        ((genericPoint_spec X).mem_open_set_iff U.isOpen |>.mpr (by simpa using hne)) r)) :
    ((absoluteIntegralClosure.π X Kbar) ⁻¹ᵁ U).toScheme ≅
      Spec (CommRingCat.of (integralClosure Γ(X,U) Kbar)) := sorry
-- absoluteIntegralClosure.isLimit_normalizations: the finite-subextension
-- diagram uses IntermediateField and relative normalization. Its explicit
-- transition maps and cone, not its mathematical existence, are omitted.
 def absoluteIntegralClosure.lift (Y : Scheme.{u}) [IsIntegral Y] (f : Y ⟶ X) [IsFinite f]
    (g : Spec (CommRingCat.of Kbar) ⟶ Y) (hg : g ≫ f = algebraicGenericPoint X Kbar) :
    absoluteIntegralClosure X Kbar ⟶ Y := sorry
 theorem absoluteIntegralClosure.lift_comp (Y : Scheme.{u}) [IsIntegral Y] (f : Y ⟶ X) [IsFinite f]
    (g : Spec (CommRingCat.of Kbar) ⟶ Y) (hg : g ≫ f = algebraicGenericPoint X Kbar) :
    absoluteIntegralClosure.lift X Kbar Y f g hg ≫ f = absoluteIntegralClosure.π X Kbar := sorry
-- isFinite_normalization_of_nagata is normalization_isFinite applied to
-- each finite field extension, not a claim that X^+→X is finite.
 def absoluteIntegralClosure.galoisAction :
    (Kbar ≃ₐ[X.functionField] Kbar) →* Aut (absoluteIntegralClosure X Kbar) := sorry
-- test: AlgebraicGeometry.Scheme.absoluteIntegralClosure_spec_int
example (K : Type) [Field K] [Algebra ℚ K] [IsAlgClosure ℚ K]
    [Algebra (Spec (CommRingCat.of ℤ)).functionField K]
    [IsAlgClosure (Spec (CommRingCat.of ℤ)).functionField K] :
    Nonempty (absoluteIntegralClosure (Spec (CommRingCat.of ℤ)) K ≅
      Spec (CommRingCat.of (integralClosure ℤ K))) := by sorry
-- test: AlgebraicGeometry.Scheme.absoluteIntegralClosure_spec_field
example (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
    [Algebra (Spec (CommRingCat.of k)).functionField K]
    [IsAlgClosure (Spec (CommRingCat.of k)).functionField K] :
    Nonempty (absoluteIntegralClosure (Spec (CommRingCat.of k)) K ≅ Spec (CommRingCat.of K)) := by sorry
-- test: AlgebraicGeometry.Scheme.absoluteIntegralClosure_not_locallyOfFiniteType
example (K : Type) [Field K] [Algebra ℚ K] [IsAlgClosure ℚ K]
    [Algebra (Spec (CommRingCat.of ℤ)).functionField K]
    [IsAlgClosure (Spec (CommRingCat.of ℤ)).functionField K] :
    ¬ LocallyOfFiniteType (absoluteIntegralClosure.π (Spec (CommRingCat.of ℤ)) K) := by sorry
-- test: AlgebraicGeometry.Scheme.absoluteIntegralClosure_factors_normalization
-- The finite-subextension diagram named above is omitted; its cone legs
-- must compose with the respective normalization maps to π.
end AlgebraicGeometry.Scheme

namespace TauCeti
variable (p : ℕ) [Fact p.Prime]
 def primeIdealInt : Ideal ℤ := Ideal.span {(p : ℤ)}
instance primeIdealInt_isPrime : (primeIdealInt p).IsPrime := by sorry
abbrev IntegersAtPrime := Localization.AtPrime (primeIdealInt p)
 def intAtPrimeToPadic : IntegersAtPrime p →+* ℤ_[p] := sorry
 def intAtPrimeToRat : IntegersAtPrime p →+* ℚ := sorry
 theorem intAtPrimeToPadic_comp (z : ℤ) :
    intAtPrimeToPadic p (algebraMap ℤ _ z) = z := sorry
 theorem intAtPrimeToRat_comp (z : ℤ) : intAtPrimeToRat p (algebraMap ℤ _ z) = z := sorry
end TauCeti
namespace AlgebraicGeometry.Scheme
open TauCeti
variable (p : ℕ) [Fact p.Prime]
variable (A B : Type u) [CommRing A] [CommRing B] [Algebra ℚ A] [Algebra ℤ_[p] B] [Module.Flat ℤ_[p] B]
-- node: SchemeAndStackFoundations:SF.0/rational-affine-model
abbrev RationalPadicAmbient := A ⊗[ℚ] ℚ_[p]
abbrev PadicGenericRing := Localization.Away (algebraMap ℤ_[p] B (p : ℤ_[p]))
variable (α : PadicGenericRing p B ≃+* RationalPadicAmbient p A)
 def rationalAffineModelBMap : B →+* RationalPadicAmbient p A :=
    α.toRingHom.comp (algebraMap B (PadicGenericRing p B))
-- α must respect Q_p; the concrete compatibility on Z_p determines that structure.
 def RationalAffineModelCompatible : Prop := ∀ z : ℤ_[p],
    rationalAffineModelBMap p A B α (algebraMap ℤ_[p] B z) =
      TensorProduct.tmul ℚ (1 : A) (algebraMap ℤ_[p] ℚ_[p] z)
 def rationalAffineModel.ring : Subring (RationalPadicAmbient p A) :=
    (algebraMap A (RationalPadicAmbient p A)).range ⊓ (rationalAffineModelBMap p A B α).range
 def rationalAffineModel : Scheme.{u} := Spec (CommRingCat.of (rationalAffineModel.ring p A B α))
 @[instance_reducible] def rationalAffineModel.algebra (h : RationalAffineModelCompatible p A B α) :
    Algebra (IntegersAtPrime p) (rationalAffineModel.ring p A B α) := sorry
 def rationalAffineModel.genericIso (h : RationalAffineModelCompatible p A B α) :
    letI := rationalAffineModel.algebra p A B α h
    Localization.Away (algebraMap (IntegersAtPrime p) (rationalAffineModel.ring p A B α)
      (algebraMap ℤ (IntegersAtPrime p) (p : ℤ))) ≃+* A := sorry
 def rationalAffineModel.padicBaseChangeIso (h : RationalAffineModelCompatible p A B α) :
    letI := (intAtPrimeToPadic p).toAlgebra
    letI := rationalAffineModel.algebra p A B α h
    ℤ_[p] ⊗[IntegersAtPrime p] rationalAffineModel.ring p A B α ≃+* B := sorry
 theorem rationalAffineModel.flat (h : RationalAffineModelCompatible p A B α) :
    letI := rationalAffineModel.algebra p A B α h
    Module.Flat (IntegersAtPrime p) (rationalAffineModel.ring p A B α) := sorry
 def rationalAffineModel.map (A' B' : Type u) [CommRing A'] [CommRing B']
    [Algebra ℚ A'] [Algebra ℤ_[p] B'] [Module.Flat ℤ_[p] B']
    (α' : PadicGenericRing p B' ≃+* RationalPadicAmbient p A')
    (f : A →ₐ[ℚ] A') (g : B →ₐ[ℤ_[p]] B')
    (hc : ∀ b : B, (Algebra.TensorProduct.map f (AlgHom.id ℚ ℚ_[p]))
       (rationalAffineModelBMap p A B α b) = rationalAffineModelBMap p A' B' α' (g b)) :
    rationalAffineModel.ring p A B α →+* rationalAffineModel.ring p A' B' α' := sorry
-- test: AlgebraicGeometry.Scheme.rationalAffineModel.test_point
example (α : PadicGenericRing p ℤ_[p] ≃+* RationalPadicAmbient p ℚ)
    (h : RationalAffineModelCompatible p ℚ ℤ_[p] α) :
    Nonempty (rationalAffineModel.ring p ℚ ℤ_[p] α ≃+* IntegersAtPrime p) := by sorry
-- test: AlgebraicGeometry.Scheme.rationalAffineModel.test_zero
example (hA : Subsingleton A) (hB : Subsingleton B) :
    Subsingleton (rationalAffineModel.ring p A B α) := by sorry
-- test: AlgebraicGeometry.Scheme.rationalAffineModel.test_affineLine
example (α : PadicGenericRing p (Polynomial ℤ_[p]) ≃+* RationalPadicAmbient p (Polynomial ℚ))
    (h : RationalAffineModelCompatible p (Polynomial ℚ) (Polynomial ℤ_[p]) α)
    (hX : rationalAffineModelBMap p (Polynomial ℚ) (Polynomial ℤ_[p]) α Polynomial.X =
      TensorProduct.tmul ℚ Polynomial.X (1 : ℚ_[p])) :
    Nonempty (rationalAffineModel.ring p (Polynomial ℚ) (Polynomial ℤ_[p]) α ≃+*
      Polynomial (IntegersAtPrime p)) := by sorry
-- test: AlgebraicGeometry.Scheme.rationalAffineModel.test_generic_compatibility
-- α and its inverses occur in the actual embeddings, so changing α can change D.
example (h : RationalAffineModelCompatible p A B α) :
    Function.Injective (rationalAffineModelBMap p A B α) := by sorry
end AlgebraicGeometry.Scheme

namespace TauCeti
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
/-- The actual fibre-product subring with its two embedded coordinates. -/
def RingPullback (f : A →+* C) (g : B →+* C) : Subring (A × B) where
  carrier := {x | f x.1 = g x.2}
  zero_mem' := by simp
  one_mem' := by simp
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry
end TauCeti
namespace AlgebraicGeometry.Scheme
variable {X Y Z : Scheme.{u}}
-- node: SchemeAndStackFoundations:SF.0/ferrand-pushout
 def HasFerrandAffineNeighbourhoods (i : Z ⟶ X) (j : Z ⟶ Y) : Prop :=
    ∀ y : Y, ∃ V : X.Opens, IsAffineOpen V ∧ ∀ z : Z, j z = y → i z ∈ V
 def ferrandCocone (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : PushoutCocone i j := sorry
 def ferrandPushout (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : Scheme.{u} := (ferrandCocone i j h).pt
 def ferrandPushout.inl (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : X ⟶ ferrandPushout i j h := (ferrandCocone i j h).inl
 def ferrandPushout.inr (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : Y ⟶ ferrandPushout i j h := (ferrandCocone i j h).inr
 theorem ferrandPushout.isPushout (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) :
    IsPushout i j (ferrandPushout.inl i j h) (ferrandPushout.inr i j h) := sorry
 theorem ferrandPushout.isPullback (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) :
    IsPullback i j (ferrandPushout.inl i j h) (ferrandPushout.inr i j h) := sorry
 theorem ferrandPushout.inl_integral (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : IsIntegralHom (ferrandPushout.inl i j h) := sorry
 theorem ferrandPushout.inr_closed (i : Z ⟶ X) (j : Z ⟶ Y) [IsClosedImmersion i] [IsIntegralHom j]
    (h : HasFerrandAffineNeighbourhoods i j) : IsClosedImmersion (ferrandPushout.inr i j h) := sorry
 def ferrandPushout.affineIso (A B C : Type u) [CommRing A] [CommRing B] [CommRing C]
    (f : A →+* C) (g : B →+* C) (hf : Function.Surjective f) (hg : g.IsIntegral)
    (hi : IsClosedImmersion (Spec.map (CommRingCat.ofHom f)))
    (hj : IsIntegralHom (Spec.map (CommRingCat.ofHom g)))
    (h : HasFerrandAffineNeighbourhoods (Spec.map (CommRingCat.ofHom f)) (Spec.map (CommRingCat.ofHom g))) :
    letI := hi; letI := hj;
    ferrandPushout (Spec.map (CommRingCat.ofHom f)) (Spec.map (CommRingCat.ofHom g)) h ≅
      Spec (CommRingCat.of (TauCeti.RingPullback f g)) := sorry
-- The flat base-change square and the map to a locally Noetherian base
-- are stated below with their actual arrows and commutativity conditions.
-- test: AlgebraicGeometry.Scheme.ferrandPushout.test_identity
example (j : Z ⟶ Y) [IsIntegralHom j] (h : HasFerrandAffineNeighbourhoods (𝟙 Z) j) :
    IsIso (ferrandPushout.inr (𝟙 Z) j h) := by sorry
-- test: AlgebraicGeometry.Scheme.ferrandPushout.test_empty
-- The empty scheme and its two arrows are omitted; the exact comparison is X⊔Y.
-- test: AlgebraicGeometry.Scheme.ferrandPushout.test_node
example (k : Type u) [Field k] :
    let f := Polynomial.eval₂RingHom (RingHom.id k) 0
    Nonempty (TauCeti.RingPullback f f ≃+*
      (MvPolynomial (Fin 2) k ⧸ Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) k) * MvPolynomial.X 1})) := by sorry
-- test: AlgebraicGeometry.Scheme.ferrandPushout.test_nonflat
example :
    let f := Int.castRingHom (ZMod 2)
    let R := TauCeti.RingPullback f f
    ∃ r : R ⧸ Ideal.span {(2 : R)}, r ≠ 0 ∧ r^2 = 0 := by sorry

-- node: SchemeAndStackFoundations:SF.0/arithmetic-uh-pushout
-- Work in universe zero so that the rational fibre has its native Q-algebra.
 def rationalSchemeMap : Spec (CommRingCat.of ℚ) ⟶ Spec (CommRingCat.of ℤ) :=
    Spec.map (CommRingCat.ofHom (Int.castRingHom ℚ))
 def arithmeticCocone {X YQ : Scheme} (a : X ⟶ Spec (CommRingCat.of ℤ))
    (b : YQ ⟶ Spec (CommRingCat.of ℚ)) (h : pullback a rationalSchemeMap ⟶ YQ)
    (hh : h ≫ b = pullback.snd a rationalSchemeMap) [IsUniversalHomeomorphism h] :
    PushoutCocone (pullback.fst a rationalSchemeMap) h := sorry
 def arithmeticUniversalHomeomorphismPushout {X YQ : Scheme} (a : X ⟶ Spec (CommRingCat.of ℤ))
    (b : YQ ⟶ Spec (CommRingCat.of ℚ)) (h : pullback a rationalSchemeMap ⟶ YQ)
    (hh : h ≫ b = pullback.snd a rationalSchemeMap) [IsUniversalHomeomorphism h] : Scheme :=
    (arithmeticCocone a b h hh).pt
 def arithmeticUniversalHomeomorphismPushout.ι {X YQ : Scheme} (a : X ⟶ Spec (CommRingCat.of ℤ))
    (b : YQ ⟶ Spec (CommRingCat.of ℚ)) (h : pullback a rationalSchemeMap ⟶ YQ)
    (hh : h ≫ b = pullback.snd a rationalSchemeMap) [IsUniversalHomeomorphism h] :
    X ⟶ arithmeticUniversalHomeomorphismPushout a b h hh := (arithmeticCocone a b h hh).inl
 theorem arithmeticUniversalHomeomorphismPushout.ι_uh {X YQ : Scheme}
    (a : X ⟶ Spec (CommRingCat.of ℤ)) (b : YQ ⟶ Spec (CommRingCat.of ℚ))
    (h : pullback a rationalSchemeMap ⟶ YQ) (hh : h ≫ b = pullback.snd a rationalSchemeMap)
    [IsUniversalHomeomorphism h] : IsUniversalHomeomorphism (arithmeticUniversalHomeomorphismPushout.ι a b h hh) := sorry
 theorem arithmeticUniversalHomeomorphismPushout.homEquiv {X YQ : Scheme}
    (a : X ⟶ Spec (CommRingCat.of ℤ)) (b : YQ ⟶ Spec (CommRingCat.of ℚ))
    (h : pullback a rationalSchemeMap ⟶ YQ) (hh : h ≫ b = pullback.snd a rationalSchemeMap)
    [IsUniversalHomeomorphism h] :
    IsPushout (pullback.fst a rationalSchemeMap) h
      (arithmeticCocone a b h hh).inl (arithmeticCocone a b h hh).inr := sorry
-- rationalIso, affineIso and map: the structure map P→Spec Z and the
-- base-changed rational comparison are omitted from this prototype.
-- AffineIso is Spec of B×_(B⊗Q)A', with BOTH projections retained.
-- test: AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_identity
example {X : Scheme} (a : X ⟶ Spec (CommRingCat.of ℤ))
    (h : IsUniversalHomeomorphism (𝟙 (pullback a rationalSchemeMap))) :
    letI := h;
    IsIso (arithmeticUniversalHomeomorphismPushout.ι a (pullback.snd _ _) (𝟙 _) (by simp)) := by sorry
-- test: AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_rational_scheme
-- For X over Q the left leg is an isomorphism and the pushout is YQ.
-- test: AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_cusp
-- Spec Z[t]→Spec Z[t²,t³] rational normalization tests the actual ring pullback.
-- test: AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_dual_numbers
-- The rational reduction of Z[e]/e² gives Z, retaining its integral quotient map.
end AlgebraicGeometry.Scheme

namespace TauCeti.Module
-- node: SchemeAndStackFoundations:SF.0/perfect-flatness-descent
 theorem flat_of_perfected_finite_injective (p : ℕ) [Fact p.Prime]
    (R S R₀ S₀ : Type u) [CommRing R] [CommRing S] [CommRing R₀] [CommRing S₀]
    [TauCeti.KilledBy R₀ p] [TauCeti.KilledBy S₀ p] [TauCeti.KilledBy R p] [TauCeti.KilledBy S p]
    [PerfectRing R p] [PerfectRing S p] [Algebra R₀ S₀] [Module.Finite R₀ S₀]
    (eR : DirectLimitPerfection R₀ p ≃+* R) (eS : DirectLimitPerfection S₀ p ≃+* S)
    (f : R →+* S) (hinj : Function.Injective f)
    (hmodel : ∀ r, f (eR (DirectLimitPerfection.of p r)) = eS (DirectLimitPerfection.of p (algebraMap R₀ S₀ r)))
    (M : Type u) [AddCommGroup M] [Module R M] :
    letI := f.toAlgebra
    _root_.Module.Flat S (S ⊗[R] M) → _root_.Module.Flat R M := sorry
end TauCeti.Module
namespace AlgebraicGeometry.Scheme
variable {X Y S : Scheme.{u}}
-- node: SchemeAndStackFoundations:SF.0/schematic-density
 def IsSchematicallyDenseOpen (U : X.Opens) : Prop := ∀ V : X.Opens,
    Function.Injective ((X.presheaf.map (homOfLE (show V ⊓ U ≤ V from inf_le_left)).op).hom)
 theorem IsSchematicallyDenseOpen.iff_mono (U : X.Opens) :
    IsSchematicallyDenseOpen U ↔
      Mono ((Modules.restrictAdjunction U.ι).unit.app (SheafOfModules.unit X.ringCatSheaf)) := sorry
 theorem IsSchematicallyDenseOpen.basicOpen_iff (A : Type u) [CommRing A] (f : A) :
    IsSchematicallyDenseOpen ((Spec (CommRingCat.of A)).basicOpen ((ΓSpecIso (CommRingCat.of A)).inv f)) ↔
      Function.Injective (algebraMap A (Localization.Away f)) := sorry
 theorem IsSchematicallyDenseOpen.of_dense_reduced [IsReduced X] (U : X.Opens)
    (h : Dense (U : Set X)) : IsSchematicallyDenseOpen U := sorry
 theorem IsSchematicallyDenseOpen.flatBaseChange (f : X ⟶ Y) [Flat f]
    (U : Y.Opens) (hU : IsCompact (U : Set Y)) (h : IsSchematicallyDenseOpen U) :
    IsSchematicallyDenseOpen (f ⁻¹ᵁ U) := sorry
-- test: AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_top
example : IsSchematicallyDenseOpen (⊤ : X.Opens) := by sorry
example : IsSchematicallyDenseOpen (⊥ : X.Opens) ↔ IsEmpty X := by sorry
-- test: AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_domain
example (k : Type u) [Field k] :
    IsSchematicallyDenseOpen ((Spec (CommRingCat.of (Polynomial k))).basicOpen ((ΓSpecIso _).inv Polynomial.X)) := by sorry
-- test: AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_embedded
example (k : Type u) [Field k] :
    let A := embeddedOriginRing k
    let t := Ideal.Quotient.mk (embeddedOriginIdeal k) (MvPolynomial.X 0)
    Dense (((Spec (CommRingCat.of A)).basicOpen ((ΓSpecIso _).inv t)) : Set (Spec (CommRingCat.of A))) ∧
      ¬ IsSchematicallyDenseOpen ((Spec (CommRingCat.of A)).basicOpen ((ΓSpecIso _).inv t)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/refined-valuative-criterion
 theorem _root_.AlgebraicGeometry.isProper_iff_generic_dvr_extensions (f : X ⟶ S)
    [IsLocallyNoetherian S] [LocallyOfFiniteType f] [QuasiCompact f] : IsProper f ↔
    ∀ η ∈ genericPoints X, ∀ A : Subring (X.residueField η),
      IsDiscreteValuationRing A →
      (letI := A.subtype.toAlgebra; IsFractionRing A (X.residueField η)) →
      ∀ b : Spec (CommRingCat.of A) ⟶ S,
        Spec.map (CommRingCat.ofHom A.subtype) ≫ b = X.fromSpecResidueField η ≫ f →
        ∃! a : Spec (CommRingCat.of A) ⟶ X,
          a ≫ f = b ∧ Spec.map (CommRingCat.ofHom A.subtype) ≫ a = X.fromSpecResidueField η := sorry

-- node: SchemeAndStackFoundations:SF.0/finite-locally-free-trace
 def finiteLocallyFreeTrace (f : X ⟶ Y) [IsFinite f] [Flat f] [LocallyOfFinitePresentation f] :
    (Modules.pushforward f).obj (SheafOfModules.unit X.ringCatSheaf) ⟶
      SheafOfModules.unit Y.ringCatSheaf := sorry
 def finitePushforwardUnitAffineIso (R S : Type u) [CommRing R] [CommRing S]
    [Algebra R S] [Module.Finite R S] :
    (Modules.pushforward (Spec.map (CommRingCat.ofHom (algebraMap R S)))).obj
       (SheafOfModules.unit (Spec (CommRingCat.of S)).ringCatSheaf) ≅
      tilde (R := CommRingCat.of R) (ModuleCat.of R S) := sorry
 theorem finiteLocallyFreeTrace.affine (R S : Type u) [CommRing R] [CommRing S]
    [Algebra R S] [Module.Finite R S] [Module.Free R S]
    (hfin : IsFinite (Spec.map (CommRingCat.ofHom (algebraMap R S))))
    (hflat : Flat (Spec.map (CommRingCat.ofHom (algebraMap R S))))
    (hfp : LocallyOfFinitePresentation (Spec.map (CommRingCat.ofHom (algebraMap R S)))) :
    letI := hfin; letI := hflat; letI := hfp;
    finiteLocallyFreeTrace (Spec.map (CommRingCat.ofHom (algebraMap R S))) =
      (finitePushforwardUnitAffineIso R S).hom ≫
        tilde.map (ModuleCat.ofHom (Algebra.trace R S)) ≫
          (tildeSelf (R := CommRingCat.of R)).hom := sorry
 def finiteLocallyFreeTrace.coefficients (f : X ⟶ Y) [IsFinite f] [Flat f]
    [LocallyOfFinitePresentation f] (F : Y.Modules) [F.IsQuasicoherent] :
    (Modules.pushforward f).obj ((Modules.pullback f).obj F) ⟶ F := sorry
 theorem Modules.finiteLocallyFree_pushforward (f : X ⟶ Y) [IsFinite f] [Flat f]
    [LocallyOfFinitePresentation f] (E : X.Modules) [E.IsLocallyFree] [E.IsFiniteType] :
    ((Modules.pushforward f).obj E).IsLocallyFree ∧ ((Modules.pushforward f).obj E).IsFiniteType := sorry
-- one: on an affine free chart, Tr(1) is the module rank. The sheaf rank
-- section, rather than a globally constant rank, is a named omitted carrier.
-- baseChange/trans/coefficientsBaseChange use the actual finite-affine
-- pushforward comparison and projection-formula isomorphisms. The prepared
-- comparison morphisms are omitted here and are specified in the README.
-- test: AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_identity
example (R : Type u) [CommRing R] (r : R) : Algebra.trace R R r = r := by sorry
-- test: AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_product
example (k : Type u) [Field k] (a b : k) : Algebra.trace k (k × k) (a,b) = a+b := by sorry
-- test: AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_dualNumbers
example (k : Type u) [Field k] (a b : k) :
    Algebra.trace k (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)^2})
      (Ideal.Quotient.mk (Ideal.span {Polynomial.X^2}) (Polynomial.C a + Polynomial.C b * Polynomial.X)) = 2*a := by sorry
-- test: AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_not_ring_hom
example : Algebra.trace ℚ (ℚ × ℚ) 1 ≠ 1 := by sorry
-- test: AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_ramifiedBaseChange
example (k : Type u) [Field k] (c a b : k) :
    Algebra.trace k (Polynomial k ⧸ Ideal.span {Polynomial.X^2 - Polynomial.C c})
      (Ideal.Quotient.mk (Ideal.span {Polynomial.X^2 - Polynomial.C c}) (Polynomial.C a + Polynomial.C b * Polynomial.X)) = 2*a := by sorry
end AlgebraicGeometry.Scheme

namespace AlgebraicGeometry.Scheme
variable {X : Scheme.{u}}
-- The ideal is the prime of x on charts containing x, and the unit ideal
-- on charts disjoint from its closure, with the corresponding radical restriction.
 def reducedPointClosureIdeal (X : Scheme.{u}) (x : X) : X.IdealSheafData := sorry
 def reducedPointClosure (X : Scheme.{u}) (x : X) : Scheme.{u} :=
    (reducedPointClosureIdeal X x).subscheme
 def reducedPointClosureι (X : Scheme.{u}) (x : X) : reducedPointClosure X x ⟶ X :=
    (reducedPointClosureIdeal X x).subschemeι
 theorem reducedPointClosure_support (X : Scheme.{u}) (x : X) :
    Set.range (reducedPointClosureι X x) = closure ({x} : Set X) := sorry
-- node: SchemeAndStackFoundations:SF.0/kollar-coherent-extension-criterion
 theorem Modules.coherent_pushforward_iff_completed_branches [IsLocallyNoetherian X]
    (U : X.Opens) (F : U.toScheme.Modules) [F.IsQuasicoherent] [F.IsFiniteType] :
    ((Modules.pushforward U.ι).obj F).IsQuasicoherent ∧ ((Modules.pushforward U.ι).obj F).IsFiniteType ↔
    ∀ x ∈ Modules.associatedPoints F,
      ∀ z : reducedPointClosure X (U.ι x), reducedPointClosureι X (U.ι x) z ∉ U →
        let R := (reducedPointClosure X (U.ι x)).presheaf.stalk z
        let C := AdicCompletion (IsLocalRing.maximalIdeal R) R
        ∀ q : PrimeSpectrum C, q.asIdeal ∈ associatedPrimes C C → 2 ≤ ringKrullDim (C ⧸ q.asIdeal) := sorry

variable (X : Scheme.{u}) (p : ℕ) [Fact p.Prime]
-- node: SchemeAndStackFoundations:SF.0/structure-multiplicative-perfection
 def structureMonoidPerfectionPresheaf : X.Opensᵒᵖ ⥤ CommMonCat.{u} where
  obj U := CommMonCat.of (MonoidPowerPerfection Γ(X,U.unop) p)
  map f := CommMonCat.ofHom (MonoidPowerPerfection.map p (X.presheaf.map f).hom.toMonoidHom)
  map_id U := by sorry
  map_comp f g := by sorry
 def structureMonoidPerfection (p : ℕ) [Fact p.Prime] : TopCat.Sheaf CommMonCat.{u} X.carrier := sorry
-- The defining comparison with the sheafification is part of the target.
-- HasSheafify for commutative monoids is not imported as an unproved global instance.
 def structureMonoidPerfection.affineEquiv (U : X.Opens) (hU : IsAffineOpen U) :
    (structureMonoidPerfection X p).obj.obj (.op U) ≃* MonoidPowerPerfection Γ(X,U) p := sorry
 def structureMonoidPerfection.map {Y : Scheme.{u}} (f : X ⟶ Y) :
    (structureMonoidPerfection Y p).obj ⟶
      (TopologicalSpace.Opens.map f.base).op ⋙ (structureMonoidPerfection X p).obj := sorry
-- isIso_structureMonoidPerfection_iff: the rational base-change map over
-- Z_(p) and its compatibility with f are omitted; the exact hypothesis is
-- that f_Q is an isomorphism, in addition to f affine.
-- structureMonoidPerfection_rational_square: the four direct-image monoid
-- sheaves lie on Y. Their canonical square is cartesian for UH f over Z_(p).
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_affine
example (A : Type u) [CommRing A] : Nonempty
    ((structureMonoidPerfection (Spec (CommRingCat.of A)) p).obj.obj (.op ⊤) ≃*
      MonoidPowerPerfection A p) := by sorry
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_empty
example (h : IsEmpty X) : Subsingleton ((structureMonoidPerfection X p).obj.obj (.op ⊤)) := by sorry
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_charP
example (A : Type u) [CommRing A] [TauCeti.KilledBy A p] : Nonempty
    ((structureMonoidPerfection (Spec (CommRingCat.of A)) p).obj.obj (.op ⊤) ≃*
      DirectLimitPerfection A p) := by sorry
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_mixed_char
example : MonoidPowerPerfection.of 2 (2 : ℤ) ≠ MonoidPowerPerfection.of 2 (0 : ℤ) := by sorry
end AlgebraicGeometry.Scheme

namespace AlgebraicGeometry.Scheme
variable (X : Scheme.{u})
theorem nilradicalIdeal_affine (U : X.affineOpens) :
    (nilradicalIdeal X).ideal U = _root_.nilradical Γ(X,U) := sorry
namespace reduction
 def affineIso (A : Type u) [CommRing A] :
    reduction (Spec (CommRingCat.of A)) ≅ Spec (CommRingCat.of (A ⧸ _root_.nilradical A)) := sorry
 def liftEquiv (Y : Scheme.{u}) [IsReduced Y] : (Y ⟶ reduction X) ≃ (Y ⟶ X) := sorry
 theorem liftEquiv_apply (Y : Scheme.{u}) [IsReduced Y] (f : Y ⟶ reduction X) :
    liftEquiv X Y f = f ≫ fromReduction X := sorry
 theorem isReduced : IsReduced (reduction X) := sorry
 def map {Y : Scheme.{u}} (f : X ⟶ Y) : reduction X ⟶ reduction Y := sorry
 theorem map_comp {Y : Scheme.{u}} (f : X ⟶ Y) :
    map X f ≫ fromReduction Y = fromReduction X ≫ f := sorry
 theorem isIso_of_isReduced [IsReduced X] : IsIso (fromReduction X) := sorry
-- test: AlgebraicGeometry.Scheme.reduction.test_dualNumbers
example (k : Type u) [Field k] :
    Nonempty (reduction (Spec (CommRingCat.of (TrivSqZeroExt k k))) ≅ Spec (CommRingCat.of k)) ∧
      ¬ IsIso (fromReduction (Spec (CommRingCat.of (TrivSqZeroExt k k)))) := by sorry
-- test: AlgebraicGeometry.Scheme.reduction.test_reduced
example [IsReduced X] : IsIso (fromReduction X) := by sorry
-- test: AlgebraicGeometry.Scheme.reduction.test_baseChange
example (k K : Type u) [Field k] [Field K] [Algebra k K] [Module.Finite k K]
    [IsPurelyInseparable k K] (hne : ¬ Function.Surjective (algebraMap k K)) :
    ¬ IsReduced (Spec (CommRingCat.of (K ⊗[k] K))) := by sorry
end reduction
end AlgebraicGeometry.Scheme

namespace PrimeSpectrum
variable {I : Type u} (F : I → Type u) [∀ i, Field (F i)]
-- node: SchemeAndStackFoundations:SF.0/spectrum-product-fields
 def piFieldIdeal (v : Ultrafilter I) : Ideal (∀ i, F i) where
  carrier := {a | {i | a i = 0} ∈ v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
 theorem piFieldIdeal_isPrime (v : Ultrafilter I) : (piFieldIdeal F v).IsPrime := sorry
 def piFieldHomeomorphUltrafilter : PrimeSpectrum (∀ i, F i) ≃ₜ Ultrafilter I := sorry
 theorem piFieldHomeomorphUltrafilter_ideal (x : PrimeSpectrum (∀ i, F i)) :
    piFieldIdeal F (piFieldHomeomorphUltrafilter F x) = x.asIdeal := sorry
 theorem piFieldHomeomorphUltrafilter.basicOpen (a : ∀ i, F i) :
    (piFieldHomeomorphUltrafilter F) '' (basicOpen a : Set (PrimeSpectrum (∀ i, F i))) =
      {v | {i | a i ≠ 0} ∈ v} := sorry
 theorem piFieldHomeomorphUltrafilter.principal (i : I) :
    piFieldIdeal F (pure i) = RingHom.ker (Pi.evalRingHom F i) := sorry
 theorem piField_isMaximal (x : PrimeSpectrum (∀ i, F i)) : x.asIdeal.IsMaximal := sorry
-- test: PrimeSpectrum.piFieldHomeomorphUltrafilter.test_empty
example (h : IsEmpty I) : IsEmpty (PrimeSpectrum (∀ i, F i)) := by sorry
-- test: PrimeSpectrum.piFieldHomeomorphUltrafilter.test_two
example (k l : Type u) [Field k] [Field l] : Nat.card (PrimeSpectrum (k × l)) = 2 := by sorry
-- test: PrimeSpectrum.piFieldHomeomorphUltrafilter.test_infinite
example : ∃ x : PrimeSpectrum (ℕ → ZMod 2),
    (∀ a : ℕ → ZMod 2, Set.Finite {i | a i ≠ 0} → a ∈ x.asIdeal) ∧
    ∀ i : ℕ, x.asIdeal ≠ RingHom.ker (Pi.evalRingHom (fun _ : ℕ => ZMod 2) i) := by sorry
end PrimeSpectrum
namespace Module
 theorem flat_piField {I : Type u} (F : I → Type u) [∀ i, Field (F i)]
    (M : Type u) [AddCommGroup M] [Module (∀ i, F i) M] : Flat (∀ i, F i) M := sorry
end Module

namespace Algebra
-- node: SchemeAndStackFoundations:SF.0/length-two-algebra
 theorem exists_quadratic_quotient_of_finrank_two (k A : Type u) [Field k] [CommRing A]
    [Algebra k A] [Module.Finite k A] (h : Module.finrank k A = 2) :
    ∃ b c : k, Nonempty ((Polynomial k ⧸
      Ideal.span {(Polynomial.X : Polynomial k)^2 + Polynomial.C b * Polynomial.X + Polynomial.C c}) ≃ₐ[k] A) := sorry
 theorem lengthTwo_split_or_dual (k A : Type u) [Field k] [IsAlgClosed k] [CommRing A]
    [Algebra k A] [Module.Finite k A] (h : Module.finrank k A = 2) :
    Nonempty (A ≃ₐ[k] k × k) ∨ Nonempty (A ≃ₐ[k] TrivSqZeroExt k k) := sorry
-- test: Algebra.lengthTwo.test_split
example (k : Type u) [Field k] : Module.finrank k (k × k) = 2 ∧ IsReduced (k × k) := by sorry
-- test: Algebra.lengthTwo.test_dual
example (k : Type u) [Field k] : Module.finrank k (TrivSqZeroExt k k) = 2 ∧
    ¬ IsReduced (TrivSqZeroExt k k) := by sorry
-- test: Algebra.lengthTwo.test_quadratic_field
example : Nonempty ((Polynomial (ZMod 2) ⧸
    Ideal.span {(Polynomial.X : Polynomial (ZMod 2))^2 + Polynomial.X + 1}) ≃+* GaloisField 2 2) := by sorry
end Algebra

namespace AlgebraicGeometry.BinaryForms
variable (k : Type u) [Field k]
attribute [local instance] MvPolynomial.gradedAlgebra
-- The native Proj expression is the chart model of StableReduction Layer 2's
-- projective line. It introduces no second projective-line target.
abbrev ProjectiveLine := Proj (MvPolynomial.homogeneousSubmodule (Fin 2) k)
 def BasepointFree (F : Fin 2 → MvPolynomial (Fin 2) k) : Prop :=
  ∀ (K : Type u) [Field K] [Algebra k K] (v : Fin 2 → K), v ≠ 0 →
    ∃ i, MvPolynomial.aeval v (F i) ≠ 0
-- node: SchemeAndStackFoundations:SF.0/binary-form-scheme-map
 def toSchemeHom (d : ℕ) (F : Fin 2 → MvPolynomial (Fin 2) k)
    (hdeg : ∀ i, (F i).IsHomogeneous d) (hbp : BasepointFree k F) :
    ProjectiveLine k ⟶ ProjectiveLine k := sorry
-- points uses StableReduction Layer 2's equivalence between field-valued
-- scheme points and Projectivization; that unimplemented carrier is omitted.
 theorem scale (d : ℕ) (F : Fin 2 → MvPolynomial (Fin 2) k)
    (hdeg : ∀ i, (F i).IsHomogeneous d) (hbp : BasepointFree k F)
    (a : k) (ha : a ≠ 0)
    (hdeg' : ∀ i, (MvPolynomial.C a * F i).IsHomogeneous d)
    (hbp' : BasepointFree k (fun i => MvPolynomial.C a * F i)) :
    toSchemeHom k d (fun i => MvPolynomial.C a * F i) hdeg' hbp' = toSchemeHom k d F hdeg hbp := sorry
 theorem comp (d e : ℕ) (F G : Fin 2 → MvPolynomial (Fin 2) k)
    (hF : ∀ i, (F i).IsHomogeneous d) (hG : ∀ i, (G i).IsHomogeneous e)
    (hFb : BasepointFree k F) (hGb : BasepointFree k G)
    (hFG : ∀ i, (MvPolynomial.aeval G (F i)).IsHomogeneous (d*e))
    (hFGb : BasepointFree k (fun i => MvPolynomial.aeval G (F i))) :
    toSchemeHom k e G hG hGb ≫ toSchemeHom k d F hF hFb =
      toSchemeHom k (d*e) (fun i => MvPolynomial.aeval G (F i)) hFG hFGb := sorry
 def toBase : ProjectiveLine k ⟶ Spec (CommRingCat.of k) :=
    Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin 2) k) ≫
      Spec.map (CommRingCat.ofHom (algebraMap k (MvPolynomial.homogeneousSubmodule (Fin 2) k 0)))
 theorem over (d : ℕ) (F : Fin 2 → MvPolynomial (Fin 2) k)
    (hdeg : ∀ i, (F i).IsHomogeneous d) (hbp : BasepointFree k F) :
    toSchemeHom k d F hdeg hbp ≫ toBase k = toBase k := sorry
 theorem exists_pair (f : ProjectiveLine k ⟶ ProjectiveLine k)
    (hf : f ≫ toBase k = toBase k) :
    ∃ (d : ℕ) (F : Fin 2 → MvPolynomial (Fin 2) k)
      (hdeg : ∀ i, (F i).IsHomogeneous d) (hbp : BasepointFree k F),
      toSchemeHom k d F hdeg hbp = f := sorry
-- The O(1)-pullback degree and field-valued-point comparisons use the precise
-- StableReduction Layer 2 and SF.3 contracts listed in the packet.
-- test: AlgebraicGeometry.BinaryForms.test_identity
example (hd : ∀ i : Fin 2, (MvPolynomial.X i : MvPolynomial (Fin 2) k).IsHomogeneous 1)
    (hb : BasepointFree k (MvPolynomial.X : Fin 2 → MvPolynomial (Fin 2) k)) :
    toSchemeHom k 1 MvPolynomial.X hd hb = 𝟙 (ProjectiveLine k) := by sorry
-- test: AlgebraicGeometry.BinaryForms.test_power
example (d : ℕ) (hd : 0 < d) :
    BasepointFree k (fun i : Fin 2 => (MvPolynomial.X i : MvPolynomial (Fin 2) k)^d) := by sorry
-- test: AlgebraicGeometry.BinaryForms.test_basepoint
example : ¬ BasepointFree k (fun i : Fin 2 =>
    if i = 0 then (MvPolynomial.X 0 : MvPolynomial (Fin 2) k)^2 else
      MvPolynomial.X 0 * MvPolynomial.X 1) := by sorry
-- test: AlgebraicGeometry.BinaryForms.test_constant
example : BasepointFree k (fun i : Fin 2 => if i = 0 then 1 else 0) := by sorry
end AlgebraicGeometry.BinaryForms

namespace Algebra
variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
-- node: SchemeAndStackFoundations:SF.0/elementary-universal-homeomorphisms
 def IsElementarySubintegral : Prop :=
    Function.Injective (algebraMap A B) ∧ ∃ b : B,
      Algebra.adjoin A {b} = ⊤ ∧ b^2 ∈ Set.range (algebraMap A B) ∧ b^3 ∈ Set.range (algebraMap A B)
 theorem IsElementarySubintegral.universalHomeomorphism (h : IsElementarySubintegral A B) :
    AlgebraicGeometry.IsUniversalHomeomorphism
      (AlgebraicGeometry.Spec.map (CommRingCat.ofHom (algebraMap A B))) := sorry
-- One tower step has either the square/cube relation or a prime-power relation.
 def HasFiniteElementaryTowers : Prop :=
    ∀ T : Set B, T.Finite → ∃ (n : ℕ) (C : ℕ → Subalgebra A B),
      C 0 = ⊥ ∧ T ⊆ C n ∧ ∀ i < n, ∃ b : B,
        C (i+1) = Algebra.adjoin A ((C i : Set B) ∪ {b}) ∧
        ((b^2 ∈ C i ∧ b^3 ∈ C i) ∨ ∃ p : ℕ, p.Prime ∧ (p : B)*b ∈ C i ∧ b^p ∈ C i)
 theorem universalHomeomorphism_iff_finite_towers
    (h : Function.Injective (algebraMap A B)) :
    AlgebraicGeometry.IsUniversalHomeomorphism
      (AlgebraicGeometry.Spec.map (CommRingCat.ofHom (algebraMap A B))) ↔
      HasFiniteElementaryTowers A B := sorry
-- test: Algebra.IsElementarySubintegral.test_identity
example : IsElementarySubintegral A A := by sorry
-- test: Algebra.IsElementarySubintegral.test_cusp
example (k : Type u) [Field k] :
    IsElementarySubintegral
      (Algebra.adjoin k { (Polynomial.X : Polynomial k)^2, Polynomial.X^3 }) (Polynomial k) := by sorry
-- test: Algebra.IsElementarySubintegral.test_frobenius
example : ¬ IsElementarySubintegral
    (Algebra.adjoin (ZMod 2) {(Polynomial.X : Polynomial (ZMod 2))^2}) (Polynomial (ZMod 2)) := by sorry
end Algebra
namespace AlgebraicGeometry.IsUniversalHomeomorphism
open AlgebraicGeometry
 theorem of_comp_guarded {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsUniversalHomeomorphism (f ≫ g)] (h : Surjective f ∨ (IsDominant f ∧ IsSeparated g)) :
    IsUniversalHomeomorphism f ∧ IsUniversalHomeomorphism g := sorry
 def integerPrimeIdeal (p : ℕ) (hp : p.Prime) : PrimeSpectrum (ULift.{u} ℤ) :=
    ⟨Ideal.span {(p : ULift.{u} ℤ)}, by sorry⟩
 def primeLocalMap (p : ℕ) (hp : p.Prime) :
    Spec (CommRingCat.of (Localization.AtPrime (integerPrimeIdeal p hp).asIdeal)) ⟶ Spec (CommRingCat.of (ULift.{u} ℤ)) :=
    Spec.map (CommRingCat.ofHom (algebraMap (ULift.{u} ℤ) (Localization.AtPrime (integerPrimeIdeal p hp).asIdeal)))
 theorem iff_prime_local {X Y : Scheme.{u}} (f : X ⟶ Y) [IsAffineHom f]
    (a : Y ⟶ Spec (CommRingCat.of (ULift.{u} ℤ))) : IsUniversalHomeomorphism f ↔
    ∀ (p : ℕ) (hp : p.Prime),
      IsUniversalHomeomorphism (pullback.snd f (pullback.fst a (primeLocalMap p hp))) := sorry
end AlgebraicGeometry.IsUniversalHomeomorphism

namespace Nat.Prime
-- node: SchemeAndStackFoundations:SF.0/uniform-binomial-divisibility
 theorem pow_dvd_pow_mul_choose {p n k i : ℕ} (hp : p.Prime)
    (hn : 1 ≤ n) (hk : n-1 ≤ k) (hi : 1 ≤ i) (hik : i ≤ p^k) :
    p^n ∣ p^i * Nat.choose (p^k) i := sorry
 theorem pow_dvd_choose_bounded {p n N m i : ℕ} (hp : p.Prime)
    (hn : 1 ≤ n) (hN : 1 ≤ N) (hm : n + Nat.log p N ≤ m)
    (hi : 1 ≤ i) (hiN : i ≤ N) : p^n ∣ Nat.choose (p^m) i := sorry
-- test: Nat.Prime.pow_dvd_pow_mul_choose.test_zero
example {p n k : ℕ} (hp : p.Prime) (hn : 1 ≤ n) :
    ¬ p^n ∣ p^0 * Nat.choose (p^k) 0 := by sorry
-- test: Nat.Prime.pow_dvd_pow_mul_choose.test_endpoint
example (p k : ℕ) : Nat.choose (p^k) (p^k) = 1 := by sorry
end Nat.Prime
namespace AlgebraicGeometry.Scheme.Hom
variable {X Y : Scheme.{u}} (p : ℕ) [Fact p.Prime] [Scheme.HasCharP X p] [Scheme.HasCharP Y p]
 theorem perfection_isClosedImmersion (f : X ⟶ Y) [IsClosedImmersion f] :
    IsClosedImmersion (f.perfection p) := sorry
 theorem perfection_isOpenImmersion (f : X ⟶ Y) [IsOpenImmersion f] :
    IsOpenImmersion (f.perfection p) := sorry
 theorem perfection_isImmersion (f : X ⟶ Y) [IsImmersion f] :
    IsImmersion (f.perfection p) := sorry
 theorem perfection_flat (f : X ⟶ Y) [Flat f] : Flat (f.perfection p) := sorry
 theorem perfection_etale (f : X ⟶ Y) [Etale f] : Etale (f.perfection p) := sorry
 theorem perfection_faithfullyFlat (f : X ⟶ Y) [Flat f] [Surjective f] :
    Flat (f.perfection p) ∧ Surjective (f.perfection p) := sorry
 theorem isIso_of_universalHomeomorphism (f : X ⟶ Y)
    [Scheme.IsPerfect X p] [Scheme.IsPerfect Y p] [IsUniversalHomeomorphism f] : IsIso f := sorry
end AlgebraicGeometry.Scheme.Hom
namespace AlgebraicGeometry.PerfectlyProper
variable {X Y : Scheme.{u}} (p : ℕ) [Fact p.Prime] [Scheme.HasCharP X p] [Scheme.HasCharP Y p]
 theorem isIso_of_geometricPoint_bijective (f : X ⟶ Y) [PerfectlyProper p f]
    (hf : ∀ (K : Type u) [Field K] [IsAlgClosed K],
      Function.Bijective (fun x : Spec (CommRingCat.of K) ⟶ X => x ≫ f)) : IsIso f := sorry
 theorem isClosedImmersion_of_geometricPoint_injective (f : X ⟶ Y) [PerfectlyProper p f]
    (hf : ∀ (K : Type u) [Field K] [IsAlgClosed K],
      Function.Injective (fun x : Spec (CommRingCat.of K) ⟶ X => x ≫ f)) : IsClosedImmersion f := sorry
end AlgebraicGeometry.PerfectlyProper
namespace AlgebraicGeometry
open Scheme
variable {X Y S : Scheme.{u}} (p : ℕ) [Fact p.Prime]
variable [HasCharP X p] [HasCharP Y p] [HasCharP S p]
namespace PerfectlySmoothOfRelativeDimension
 theorem flat (f : X ⟶ Y) (d : ℕ) [PerfectlySmoothOfRelativeDimension p d f] : Flat f := sorry
 theorem pullback (f : X ⟶ S) (g : Y ⟶ S) (d : ℕ)
    [Scheme.IsPerfect Y p] [PerfectlySmoothOfRelativeDimension p d f]
    [HasCharP (Limits.pullback f g) p] :
    PerfectlySmoothOfRelativeDimension p d (Limits.pullback.snd f g) := sorry
 theorem isNormal_source (k : Type u) [Field k] [PerfectField k] [HasCharP (Spec (CommRingCat.of k)) p]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [PerfectlyFinitelyPresented p a] [PerfectlyFinitelyPresented p b]
    (f : X ⟶ Y) (d : ℕ) (hover : f ≫ b = a)
    [PerfectlyFinitelyPresented p f] [PerfectlySmoothOfRelativeDimension p d f] (hY : ∀ y, IsDomain (Y.presheaf.stalk y) ∧ IsIntegrallyClosed (Y.presheaf.stalk y)) :
    ∀ x, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x) := sorry
 theorem isNormal_target (k : Type u) [Field k] [PerfectField k] [HasCharP (Spec (CommRingCat.of k)) p]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [PerfectlyFinitelyPresented p a] [PerfectlyFinitelyPresented p b]
    (f : X ⟶ Y) (d : ℕ) (hover : f ≫ b = a) [Surjective f]
    [PerfectlyFinitelyPresented p f] [PerfectlySmoothOfRelativeDimension p d f] (hX : ∀ x, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x)) :
    ∀ y, IsDomain (Y.presheaf.stalk y) ∧ IsIntegrallyClosed (Y.presheaf.stalk y) := sorry
end PerfectlySmoothOfRelativeDimension
namespace WeaklyPerfectlySmoothOfRelativeDimension
 theorem pullback (f : X ⟶ S) (g : Y ⟶ S) (d : ℕ)
    [Scheme.IsPerfect Y p] [WeaklyPerfectlySmoothOfRelativeDimension p d f]
    [HasCharP (Limits.pullback f g) p] :
    WeaklyPerfectlySmoothOfRelativeDimension p d (Limits.pullback.snd f g) := sorry
 theorem comp (f : X ⟶ Y) (g : Y ⟶ S) (d e : ℕ)
    [WeaklyPerfectlySmoothOfRelativeDimension p d f] [WeaklyPerfectlySmoothOfRelativeDimension p e g] :
    WeaklyPerfectlySmoothOfRelativeDimension p (d+e) (f ≫ g) := sorry
 theorem isNormal_source (k : Type u) [Field k] [PerfectField k] [HasCharP (Spec (CommRingCat.of k)) p]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [PerfectlyFinitelyPresented p a] [PerfectlyFinitelyPresented p b]
    (f : X ⟶ Y) (d : ℕ) (hover : f ≫ b = a)
    [PerfectlyFinitelyPresented p f] [WeaklyPerfectlySmoothOfRelativeDimension p d f] (hY : ∀ y, IsDomain (Y.presheaf.stalk y) ∧ IsIntegrallyClosed (Y.presheaf.stalk y)) :
    ∀ x, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x) := sorry
 theorem isNormal_target (k : Type u) [Field k] [PerfectField k] [HasCharP (Spec (CommRingCat.of k)) p]
    (a : X ⟶ Spec (CommRingCat.of k)) (b : Y ⟶ Spec (CommRingCat.of k))
    [PerfectlyFinitelyPresented p a] [PerfectlyFinitelyPresented p b]
    (f : X ⟶ Y) (d : ℕ) (hover : f ≫ b = a) [Surjective f]
    [PerfectlyFinitelyPresented p f] [WeaklyPerfectlySmoothOfRelativeDimension p d f] (hX : ∀ x, IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x)) :
    ∀ y, IsDomain (Y.presheaf.stalk y) ∧ IsIntegrallyClosed (Y.presheaf.stalk y) := sorry
end WeaklyPerfectlySmoothOfRelativeDimension
end AlgebraicGeometry

namespace AlgebraicGeometry.Scheme
variable {X Y : Scheme.{u}} (p : ℕ) [Fact p.Prime]
 def structureMonoidPerfectionUnit (X : Scheme.{u}) :
    structureMonoidPerfectionPresheaf X p ⟶ (structureMonoidPerfection X p).obj := sorry
 def structureMonoidPerfection.sheafificationHomEquiv (X : Scheme.{u})
    (F : TopCat.Sheaf CommMonCat.{u} X.carrier) :
    ((structureMonoidPerfection X p).obj ⟶ F.obj) ≃
      (structureMonoidPerfectionPresheaf X p ⟶ F.obj) := sorry
 theorem structureMonoidPerfection.sheafificationHomEquiv_apply (X : Scheme.{u})
    (F : TopCat.Sheaf CommMonCat.{u} X.carrier)
    (f : (structureMonoidPerfection X p).obj ⟶ F.obj) :
    structureMonoidPerfection.sheafificationHomEquiv p X F f =
      structureMonoidPerfectionUnit p X ≫ f := sorry
 theorem structureMonoidPerfection.affineEquiv_unit (X : Scheme.{u}) (U : X.Opens)
    (hU : IsAffineOpen U) (a : Γ(X,U)) :
    structureMonoidPerfection.affineEquiv X p U hU
      ((structureMonoidPerfectionUnit p X).app (.op U) (MonoidPowerPerfection.of p a)) =
        MonoidPowerPerfection.of p a := sorry
-- O_Y^perf → f_*O_X^perf is the map above, with actual naturality on opens.
-- The rational-square/isIso statements name their omitted over-Z_(p) data
-- explicitly; they are not supplied with arbitrary proposition hypotheses.
end AlgebraicGeometry.Scheme

namespace Ring
variable (C : Type u) [CommRing C] [IsLocalRing C] (p : ℕ) [Fact p.Prime]
-- node: SchemeAndStackFoundations:SF.0/cohen-ring
 class IsCohenRing : Prop where
  prime : p.Prime
  domain : IsDomain C
  dvr : letI := domain; IsDiscreteValuationRing C
  charZero : CharZero C
  complete : IsAdicComplete (IsLocalRing.maximalIdeal C) C
  maximal_eq : IsLocalRing.maximalIdeal C = Ideal.span {(p : C)}
 theorem IsCohenRing.residue_char [IsCohenRing C p] : CharP (IsLocalRing.ResidueField C) p := sorry
 theorem IsCohenRing.exists_with_residue (k : Type u) [Field k] [CharP k p] :
    ∃ (C : CommRingCat.{u}) (hlocal : IsLocalRing C),
      letI := hlocal;
      IsCohenRing C p ∧ Nonempty ((C ⧸ Ideal.span {(p : C)}) ≃+* k) := sorry
 theorem IsCohenRing.witt (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    [IsLocalRing (WittVector p k)] : IsCohenRing (WittVector p k) p := sorry
-- test: Ring.IsCohenRing.test_padic
example [IsLocalRing (PadicInt p)] : IsCohenRing (PadicInt p) p := by sorry
-- test: Ring.IsCohenRing.test_truncated
example [IsLocalRing (ZMod (p^2))] : ¬ IsCohenRing (ZMod (p^2)) p := by sorry
-- test: Ring.IsCohenRing.test_ramified
example (D : Type u) [CommRing D] [IsDomain D] [IsDiscreteValuationRing D]
    (π : D) (hπ : IsLocalRing.maximalIdeal D = Ideal.span {π})
    (h : Ideal.span {(p : D)} < Ideal.span {π}) : ¬ IsCohenRing D p := by sorry
-- node: SchemeAndStackFoundations:SF.0/cohen-structure
 theorem exists_cohen_presentation (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R] :
    ∃ (Λ : CommRingCat.{u}) (hlocal : IsLocalRing Λ),
      letI := hlocal;
      (IsField Λ ∨ ∃ p : ℕ, ∃ hp : Fact p.Prime, @IsCohenRing Λ _ hlocal p) ∧
      ∃ (n : ℕ) (f : MvPowerSeries (Fin n) Λ →+* R), Function.Surjective f ∧
        ∃ (hc : IsLocalHom (f.comp (MvPowerSeries.C (σ := Fin n)))),
          letI := hc;
          Function.Bijective (IsLocalRing.ResidueField.map (f.comp (MvPowerSeries.C (σ := Fin n)))) := sorry
 theorem exists_regular_complete_surjection (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R] :
    ∃ (S : CommRingCat.{u}) (hlocal : IsLocalRing S),
      letI := hlocal;
      IsRegularLocalRing S ∧ IsAdicComplete (IsLocalRing.maximalIdeal S) S ∧
      ∃ f : S →+* R, IsLocalHom f ∧ Function.Surjective f := sorry
 theorem exists_finite_regular_complete_subring (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [IsDomain R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R] :
    ∃ (S : Subring R) (hlocal : IsLocalRing S),
      letI := hlocal;
      IsRegularLocalRing S ∧ IsAdicComplete (IsLocalRing.maximalIdeal S) S ∧
      Module.Finite S R ∧ IsLocalHom S.subtype ∧
      ∃ (hmap : IsLocalHom S.subtype),
        letI := hmap;
        Function.Bijective (IsLocalRing.ResidueField.map S.subtype) := sorry
end Ring

namespace Ring
variable {R S : Type u} [CommRing R] [CommRing S]
 theorem IsCatenary.localization [Algebra R S] (T : Submonoid R) [IsLocalization T S]
    (h : IsCatenary R) : IsCatenary S := sorry
 theorem IsCatenary.quotient (I : Ideal R) (h : IsCatenary R) : IsCatenary (R ⧸ I) := sorry
 theorem IsUniversallyCatenary.isNoetherianRing (h : IsUniversallyCatenary R) : IsNoetherianRing R := sorry
 theorem IsUniversallyCatenary.quotient (I : Ideal R) (h : IsUniversallyCatenary R) :
    IsUniversallyCatenary (R ⧸ I) := sorry
 theorem IsJapanese.localization [IsDomain R] [IsDomain S] [Algebra R S]
    (T : Submonoid R) [IsLocalization T S] (h : IsJapanese R) : IsJapanese S := sorry
 theorem IsJapanese.of_finite [IsDomain R] [IsDomain S] [Algebra R S]
    [IsNoetherianRing R] [Module.Finite R S] (hinj : Function.Injective (algebraMap R S))
    (h : IsJapanese R) : IsJapanese S := sorry
 theorem IsNagata.isNoetherianRing (h : IsNagata R) : IsNoetherianRing R := sorry
 theorem IsNagata.localization [Algebra R S] (T : Submonoid R) [IsLocalization T S]
    (h : IsNagata R) : IsNagata S := sorry
 theorem IsNagata.of_finite [Algebra R S] [Module.Finite R S] (h : IsNagata R) : IsNagata S := sorry
 theorem SatisfiesSerreS.of_flat [IsNoetherianRing R] [IsNoetherianRing S]
    [Algebra R S] [Module.Flat R S] (n : ℕ) (hR : SatisfiesSerreS R n)
    (hf : ∀ p : PrimeSpectrum R, SatisfiesSerreS (p.asIdeal.Fiber S) n) :
    SatisfiesSerreS S n := sorry
end Ring
namespace Module
variable {R M : Type u} [CommRing R] [AddCommGroup M] [Module R M]
 theorem IsCohenMacaulay.localization (p : PrimeSpectrum R) (h : IsCohenMacaulay R M) :
    IsCohenMacaulay (Localization.AtPrime p.asIdeal) (primeLocalization R M p) := sorry
 theorem SatisfiesSerreS.mono (m n : ℕ) (hmn : m ≤ n) (h : SatisfiesSerreS R M n) :
    SatisfiesSerreS R M m := sorry
end Module
namespace Ring
variable (C : Type u) [CommRing C] [IsLocalRing C] (p : ℕ) [Fact p.Prime]
 def cohenTruncationScalarMap (n : ℕ) : ZMod (p^n) →+* C ⧸ Ideal.span {(p^n : C)} := sorry
 theorem cohenTruncationScalarMap_intCast (n : ℕ) (z : ℤ) :
    cohenTruncationScalarMap C p n z = Ideal.Quotient.mk (Ideal.span {(p^n : C)}) (z : C) := sorry
 theorem IsCohenRing.truncation_formallySmooth [IsCohenRing C p] (n : ℕ) (hn : 1 ≤ n) :
    letI := (cohenTruncationScalarMap C p n).toAlgebra
    Algebra.FormallySmooth (ZMod (p^n)) (C ⧸ Ideal.span {(p^n : C)}) := sorry
end Ring
namespace AlgebraicGeometry
variable {X Y : Scheme.{u}}
 theorem Smooth.exists_etale_affineSpace (f : X ⟶ Y) (d : ℕ) [SmoothOfRelativeDimension d f]
    (x : X) : ∃ (U : X.Opens) (_ : x ∈ U) (e : U.toScheme ⟶ AffineSpace (ULift.{u} (Fin d)) Y),
      Etale e ∧ e ≫ (AffineSpace (ULift.{u} (Fin d)) Y ↘ Y) = U.ι ≫ f := sorry
-- AlgebraicGeometry.exists_finite_separable_geometricallyIrreducible_components:
-- the descended component subschemes and common finite-separable field, specified
-- in the reader, require the prepared Galois descent diagram omitted above.
-- AlgebraicGeometry.points_eq_inter_points_integralClosure:
-- keep a separated finite-type model over the Dedekind ring, its generic-fibre
-- identification and all integral-closure point maps. That entire diagram is omitted.
-- AlgebraicGeometry.ProjectiveLine.hom_affine_factors_through_base:
-- the projective-line carrier, projection and Γ(P1,O)=R comparison are imported
-- from Stable reduction Layer 2 and omitted; the conclusion is unique factorization.
-- AlgebraicGeometry.isFinite_connectedComponent_of_isGeometricallyUnibranch:
-- the connected-component open subscheme of an etale-locally constant scheme,
-- not an arbitrary component of a finite-type scheme, is the omitted carrier.
-- Algebra.etale_localization_jacobian:
-- the quotient k[x1,...,xn]/(f1,...,fn), determinant and chosen localization are
-- omitted; the exact invertible determinant hypothesis stays in the reader.
end AlgebraicGeometry

namespace AlgebraicGeometry
 theorem isClopen_range_fromSpecStalk_of_quasiFiniteAt
    (R : Type u) [CommRing R] [HenselianLocalRing R]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSeparated f] [LocallyOfFiniteType f] (x : X) (hx : f.QuasiFiniteAt x)
    (hclosed : IsClosed ({f x} : Set (Spec (CommRingCat.of R)))) :
    IsClopen (Set.range (X.fromSpecStalk x)) ∧
    IsOpenImmersion (X.fromSpecStalk x) ∧ IsFinite (X.fromSpecStalk x ≫ f) := sorry
end AlgebraicGeometry

namespace AlgebraicGeometry.Scheme
variable (p : ℕ) [Fact p.Prime]
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_identity
example (X : Scheme.{u}) : structureMonoidPerfection.map X p (𝟙 X) = 𝟙 _ := by sorry
-- test: AlgebraicGeometry.Scheme.structureMonoidPerfection.test_rational_nilpotent
example : MonoidPowerPerfection.of p (1 + TrivSqZeroExt.inr (1 : ℚ) : TrivSqZeroExt ℚ ℚ) ≠
    MonoidPowerPerfection.of p (1 : TrivSqZeroExt ℚ ℚ) := by sorry
-- AlgebraicGeometry.Scheme.structureMonoidPerfection.test_nilthickening:
-- the specified Z_(p)-scheme nil immersion, its rational pullback and direct-image
-- monoid-sheaf comparison are the prepared diagram omitted here. The test requires
-- that rational pullback to be invertible, as in isIso_structureMonoidPerfection_iff.
-- AlgebraicGeometry.Scheme.rationalAffineModel.test_scaled_coordinate:
-- use Polynomial Z_p with its generator embedded as p^{-1}t, not t. The supplied
-- Q_p-algebra identification and the corresponding evaluation map are omitted.
-- AlgebraicGeometry.Scheme.rationalAffineModel.test_flat_needed:
-- Z_p/(p) has nonzero p-torsion and zero generic fibre; the comparison from this
-- quotient to its localization is not injective. The PadicInt quotient carrier is omitted.
-- AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_affine_pullback:
-- use B×_(B⊗Q)A' with its two projections, as in affineIso; the prepared rational
-- localization diagram is omitted, and this is not a tensor-product test.
end AlgebraicGeometry.Scheme

/-!
The following proposed interfaces require the specified prepared diagrams.
Their mathematical contracts remain in the reader; no arbitrary proposition
argument stands in for these missing carriers.

* `AlgebraicGeometry.Scheme.pullback_limit_iso`: the functor of pullbacks in
  Over S and its limiting cone, with the actual structure maps.
* `AlgebraicGeometry.Scheme.isGeometricallyUnibranchAt_iff_normalization` and
  `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch.isUniversallyHomeomorph_normalization`:
  the normalization in the total quotient algebra and its point-fibre residue extensions.
* `IsLocalRing.isGeometricallyUnibranch_iff_strictHenselization`: the imported
  strict henselization, at a specified separable closure of the residue field.
* `AlgebraicGeometry.Scheme.absoluteIntegralClosure.isLimit_normalizations`:
  the diagram indexed by finite subextensions of the chosen algebraic closure.
* `AlgebraicGeometry.Scheme.absoluteIntegralClosure.isFinite_normalization_of_nagata`:
  each finite subextension's normalization map is finite; the infinite absolute
  integral closure is not claimed finite.
* `AlgebraicGeometry.isIso_structureMonoidPerfection_iff`: affine morphism over
  Z_(p), with its rational pullback and direct-image monoid-sheaf map.
* `AlgebraicGeometry.structureMonoidPerfection_rational_square`: the rational
  restriction square of four direct-image monoid sheaves on the same base site.
* `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.rationalIso`,
  `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.affineIso` and
  `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.map`: the
  structure map to Spec Z, its rational pullback and the compatible affine ring diagram.
* `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.baseChange` and
  `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.coefficientsBaseChange`:
  the finite affine pushforward/base-change comparison, also for coefficients.
* `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.trans`: composition of
  pushforward functors in the actual finite locally free tower.
* `AlgebraicGeometry.BinaryForms.points`: the projective-line point coordinates
  imported from Stable reduction Layer 2, with both affine chart identifications.
-/

namespace AlgebraicGeometry.Scheme
variable {X Y Z P X' Y' Z' T S : Scheme.{u}}
 theorem ferrandPushout.flatBaseChange
    (i : Z ⟶ X) (j : Z ⟶ Y) (a : X ⟶ P) (b : Y ⟶ P)
    [IsClosedImmersion i] [IsIntegralHom j] (hp : IsPushout i j a b)
    (q : T ⟶ P) [Flat q]
    (i' : Z' ⟶ X') (j' : Z' ⟶ Y') (a' : X' ⟶ T) (b' : Y' ⟶ T)
    (uZ : Z' ⟶ Z) (uX : X' ⟶ X) (uY : Y' ⟶ Y)
    (hX : IsPullback a' uX q a) (hY : IsPullback b' uY q b)
    (hZ : IsPullback (i' ≫ a') uZ q (i ≫ a))
    (hi : uZ ≫ i = i' ≫ uX) (hj : uZ ≫ j = j' ≫ uY)
    (hc : i' ≫ a' = j' ≫ b') : IsPushout i' j' a' b' := sorry
 def ferrandPushout.toBase (i : Z ⟶ X) (j : Z ⟶ Y)
    [IsClosedImmersion i] [IsIntegralHom j] (h : HasFerrandAffineNeighbourhoods i j)
    (a : X ⟶ S) (b : Y ⟶ S) (hc : i ≫ a = j ≫ b) : ferrandPushout i j h ⟶ S := sorry
 theorem ferrandPushout.toBase_inl (i : Z ⟶ X) (j : Z ⟶ Y)
    [IsClosedImmersion i] [IsIntegralHom j] (h : HasFerrandAffineNeighbourhoods i j)
    (a : X ⟶ S) (b : Y ⟶ S) (hc : i ≫ a = j ≫ b) :
    ferrandPushout.inl i j h ≫ ferrandPushout.toBase i j h a b hc = a := sorry
 theorem ferrandPushout.toBase_inr (i : Z ⟶ X) (j : Z ⟶ Y)
    [IsClosedImmersion i] [IsIntegralHom j] (h : HasFerrandAffineNeighbourhoods i j)
    (a : X ⟶ S) (b : Y ⟶ S) (hc : i ≫ a = j ≫ b) :
    ferrandPushout.inr i j h ≫ ferrandPushout.toBase i j h a b hc = b := sorry
 theorem ferrandPushout.finiteType (i : Z ⟶ X) (j : Z ⟶ Y)
    [IsClosedImmersion i] [IsIntegralHom j] (h : HasFerrandAffineNeighbourhoods i j)
    [IsLocallyNoetherian S] (a : X ⟶ S) (b : Y ⟶ S) (hc : i ≫ a = j ≫ b)
    [LocallyOfFiniteType a] [LocallyOfFiniteType b] [LocallyOfFiniteType (i ≫ a)] :
    LocallyOfFiniteType (ferrandPushout.toBase i j h a b hc) := sorry
-- On each finite-free affine chart this is the rank section's defining value.
 theorem finiteLocallyFreeTrace.one (R A : Type u) [CommRing R] [CommRing A]
    [Algebra R A] [Module.Free R A] [Module.Finite R A] :
    Algebra.trace R A 1 = (Module.finrank R A : R) := sorry
-- The normalization in EACH finite subextension, not in the algebraic closure.
 theorem absoluteIntegralClosure.isFinite_normalization_of_nagata
    (X : Scheme.{u}) [IsIntegral X] (L : Type u) [Field L]
    [Algebra X.functionField L] [Module.Finite X.functionField L] (hX : IsNagata X)
    (ha : IsAffineHom (Spec.map (CommRingCat.ofHom (algebraMap X.functionField L)) ≫
      X.fromSpecStalk (genericPoint X))) :
    letI := ha;
    IsFinite (Spec.map (CommRingCat.ofHom (algebraMap X.functionField L)) ≫
      X.fromSpecStalk (genericPoint X)).fromNormalization := sorry
end AlgebraicGeometry.Scheme

namespace Ring
-- test: Ring.IsCatenary.test_field
example (k : Type u) [Field k] : IsCatenary k := by sorry
-- test: Ring.IsCatenary.test_int
example : IsCatenary ℤ := by sorry
-- test: Ring.IsCatenary.test_zero
example : IsCatenary (ZMod 1) := by sorry
-- test: Ring.IsUniversallyCatenary.test_field
example (k : Type u) [Field k] : IsUniversallyCatenary k := by sorry
-- test: Ring.IsUniversallyCatenary.test_int
example : IsUniversallyCatenary ℤ := by sorry
-- test: Ring.IsUniversallyCatenary.test_zero
example : IsUniversallyCatenary (ZMod 1) := by sorry
-- test: Ring.IsCohenMacaulay.test_field
example (k : Type u) [Field k] : IsCohenMacaulay k := by sorry
-- test: Ring.SatisfiesSerreS.test_polynomial
example (k : Type u) [Field k] (d n : ℕ) : SatisfiesSerreS (MvPolynomial (Fin d) k) n := by sorry
-- test: Ring.IsJapanese.test_field
example (k : Type u) [Field k] : IsJapanese k := by sorry
-- test: Ring.IsJapanese.test_int
example : IsJapanese ℤ := by sorry
-- test: Ring.IsNagata.test_field
example (k : Type u) [Field k] : IsNagata k := by sorry
-- test: Ring.IsNagata.test_int
example : IsNagata ℤ := by sorry
-- test: Ring.IsNagata.test_zero
example : IsNagata (ZMod 1) := by sorry
-- Ring.IsCohenMacaulay.test_plane_and_line: use k[[x,y,z]]/(xz,yz),
-- localized at the displayed maximal ideal: depth 1 and dimension 2. The
-- multi-variable power-series quotient and its local-ring instance are omitted.
-- Ring.SatisfiesSerreS.test_embedded_point: the same omitted origin localization
-- of k[x,y]/(x²,xy) has depth 0 and dimension 1, so it fails S_1.
end Ring
namespace IsLocalRing
-- test: IsLocalRing.depth.test_zero
example (R M : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [AddCommGroup M] [Module R M] [Subsingleton M] : depth R M = ⊤ := by sorry
end IsLocalRing
namespace Module
-- test: Module.IsCohenMacaulay.test_zero
example (R M : Type u) [CommRing R] [IsNoetherianRing R]
    [AddCommGroup M] [Module R M] [Subsingleton M] : IsCohenMacaulay R M := by sorry
-- test: Module.SatisfiesSerreS.test_zero
example (R M : Type u) [CommRing R] [IsNoetherianRing R]
    [AddCommGroup M] [Module R M] [Subsingleton M] (n : ℕ) : SatisfiesSerreS R M n := by sorry
end Module
namespace AlgebraicGeometry
-- test: AlgebraicGeometry.IsCohenMacaulay.test_field
example (k : Type u) [Field k] : IsCohenMacaulay (Spec (CommRingCat.of k)) := by sorry
-- test: AlgebraicGeometry.IsCohenMacaulay.test_empty
example : IsCohenMacaulay Scheme.empty := by sorry
-- AlgebraicGeometry.IsCohenMacaulay.test_plane_and_line: the origin stalk
-- of Spec k[x,y,z]/(xz,yz) has depth 1 and dimension 2; its prepared origin
-- localization, rather than arbitrary non-CM data, is omitted here.
-- test: AlgebraicGeometry.fiberDimAt_affineLine_projection
example (k : Type u) [Field k]
    (x : Spec (CommRingCat.of (MvPolynomial (Fin 2) k))) :
    Scheme.Hom.fiberDimAt (Spec.map (CommRingCat.ofHom
      (Polynomial.eval₂RingHom MvPolynomial.C (MvPolynomial.X (0 : Fin 2))))) x = 1 := by sorry
end AlgebraicGeometry
-- TauCeti.Henselization.atPrime.colimitIso: the pointed etale-neighbourhood
-- category, its forgetful ring diagram and canonical stalk henselization cone
-- are omitted prepared carriers, as specified in the reader.
