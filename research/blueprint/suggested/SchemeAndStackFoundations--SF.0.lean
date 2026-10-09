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

/-- Functoriality for graded maps whose image generates up to radical. -/
def map {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg)
    (_ : ∀ U d x, x ∈ A.grading U d → ψ.hom.right.app (.op U) x ∈ B.grading U d) :
    relativeProj B ⟶ relativeProj A := sorry

theorem map_isClosedImmersion {A B : GradedQCohAlg S} (ψ : A.toQCohAlg ⟶ B.toQCohAlg)
    (hψ : ∀ U d x, x ∈ A.grading U d → ψ.hom.right.app (.op U) x ∈ B.grading U d)
    (hsurj : ∀ U, Function.Surjective (ψ.hom.right.app (.op U))) :
    IsClosedImmersion (map ψ hψ) := sorry

/-- The degree-zero localization at a global homogeneous section of positive degree. -/
def awayAlg (A : GradedQCohAlg S) (d : ℕ) (f : Γ(S, ⊤)) : QCohAlg S := sorry

/-- The basic open `D₊(f)` is the relative spectrum of the degree-zero localization. -/
def basicOpenIso (A : GradedQCohAlg S) (d : ℕ) (hd : 0 < d) (f : Γ(S, ⊤)) :
    relativeSpec (awayAlg A d f) ⟶ relativeProj A := sorry

/-- Veronese invariance. -/
def veroneseIso (A : GradedQCohAlg S) (d : ℕ) (hd : 0 < d) :
    relativeProj (A.veronese d hd) ≅ relativeProj A := sorry

theorem empty_of_degreeZero : IsEmpty (relativeProj (GradedQCohAlg.trivial S)) := sorry

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
