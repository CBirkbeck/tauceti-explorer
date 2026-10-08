/-
Suggested interfaces for EtaleDualityAndPerverseSheaves EDC.4–8, revision #6958.
Every mathematical proof is admitted. Carrier-valued stand-ins have named suppliers;
no mathematical predicate is replaced by an admitted Prop. Geometric objects are finite-type
separated schemes over a common field and maps are maps over that field. Coefficient regimes
and the BBD base hypotheses are part of the signatures, not an informal convention.
Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. This file imports only Mathlib.
This file is not the roadmap and is not exhaustive. The reader document is definitive;
the signatures are provisional and converge with the roadmap.
The independent needs_changes review is preserved in the packet. The handoff records each repair.
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
/-! ## EDC.5 — t-structures, recollement and intermediate extension (BBD chapter 1) -/

section Abstract

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- Named theorem `EDC.5/t-structure-heart-abelian` (BBD 1.3.6): the heart is abelian. -/
instance TStructure.heartAbelian [IsTriangulated C] (t : TStructure C) :
    Abelian t.heart.FullSubcategory := sorry

variable [IsTriangulated C] (t : TStructure C)

/-- `H⁰_t : C ⥤ heart(t)` (node `EDC.5/t-cohomology-functor`). -/
def TStructure.homologyZero : C ⥤ t.heart.FullSubcategory := sorry

/-- `H^n_t := H⁰_t ∘ [n]`. -/
def TStructure.homology (n : ℤ) : C ⥤ t.heart.FullSubcategory :=
  shiftFunctor C n ⋙ TStructure.homologyZero t

instance TStructure.homologyZero_isHomological : (TStructure.homologyZero t).IsHomological := sorry

lemma TStructure.homologyZero_obj_heart (X : t.heart.FullSubcategory) :
    Nonempty ((TStructure.homologyZero t).obj X.obj ≅ X) := sorry

lemma TStructure.isZero_of_homology_isZero (X : C) (a b : ℤ) (ha : t.IsGE X a) (hb : t.IsLE X b)
    (h : ∀ n : ℤ, IsZero ((TStructure.homology t n).obj X)) : IsZero X := sorry

lemma TStructure.isLE_iff_homology (X : C) (a b : ℤ) (ha : t.IsGE X a) (hb : t.IsLE X b) :
    t.IsLE X 0 ↔ ∀ n : ℤ, 0 < n → IsZero ((TStructure.homology t n).obj X) := sorry

/-- Test `TauCeti.EtaleDuality.homologyZero_zero`. -/
example (X : C) (hX : IsZero X) : IsZero ((TStructure.homologyZero t).obj X) := sorry

/-- Test `TauCeti.EtaleDuality.homologyZero_shift_ne`: for the canonical t-structure on `D(A)` and `A ≠ 0` in `A`,
`H⁰_t(A[1]) = 0` while `H⁰_t(A) ≅ A`. -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (M : A) (hM : ¬ IsZero M) :
    IsZero ((TStructure.homologyZero (DerivedCategory.TStructure.t (C := A))).obj
      (((DerivedCategory.singleFunctor A 0).obj M)⟦(1 : ℤ)⟧)) ∧
    ¬ IsZero ((TStructure.homologyZero (DerivedCategory.TStructure.t (C := A))).obj
      ((DerivedCategory.singleFunctor A 0).obj M)) := sorry

/-- The canonical heart is naturally equivalent to the original abelian category. -/
def canonicalHeartEquiv {A : Type u} [Category.{u} A] [Abelian A]
    [HasDerivedCategory.{u} A] : (DerivedCategory.TStructure.t (C := A)).heart.FullSubcategory ≌ A := sorry

/-- Test `TauCeti.EtaleDuality.homologyZero_canonical`: identification of functors, in every degree. -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (n : ℤ) :
    Nonempty (TStructure.homology (DerivedCategory.TStructure.t (C := A)) n ⋙
      (canonicalHeartEquiv (A := A)).functor ≅ DerivedCategory.homologyFunctor A n) := sorry

/-- The degenerate t-structure has lower aisle zero and upper aisle all of C. -/
def zeroLowerTStructure : TStructure C := sorry
lemma zeroLowerTStructure_le (X : C) (n : ℤ) :
    (zeroLowerTStructure (C := C)).IsLE X n ↔ IsZero X := sorry
lemma zeroLowerTStructure_ge (X : C) (n : ℤ) :
    (zeroLowerTStructure (C := C)).IsGE X n := sorry
/-- Test `TauCeti.EtaleDuality.not_isLE_iff_homology_of_bounded_below`. -/
example (X : C) (hX : ¬ IsZero X) :
    (zeroLowerTStructure (C := C)).IsGE X 0 ∧
    (∀ n : ℤ, IsZero ((TStructure.homology (zeroLowerTStructure (C := C)) n).obj X)) ∧
    ¬ (zeroLowerTStructure (C := C)).IsLE X 0 := sorry

end Abstract

section TExact

variable {C₁ C₂ C₃ : Type*} [Category C₁] [Preadditive C₁] [HasZeroObject C₁] [HasShift C₁ ℤ]
  [∀ n : ℤ, (shiftFunctor C₁ n).Additive] [Pretriangulated C₁]
  [Category C₂] [Preadditive C₂] [HasZeroObject C₂] [HasShift C₂ ℤ]
  [∀ n : ℤ, (shiftFunctor C₂ n).Additive] [Pretriangulated C₂]
  [Category C₃] [Preadditive C₃] [HasZeroObject C₃] [HasShift C₃ ℤ]
  [∀ n : ℤ, (shiftFunctor C₃ n).Additive] [Pretriangulated C₃]

/-- `T` is right t-exact: `T(C₁^{≤0}) ⊆ C₂^{≤0}` (node `EDC.5/t-exact-functor`). -/
def Functor.IsRightTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  ∀ X : C₁, t₁.IsLE X 0 → t₂.IsLE (T.obj X) 0

/-- `T` is left t-exact: `T(C₁^{≥0}) ⊆ C₂^{≥0}`. -/
def Functor.IsLeftTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  ∀ X : C₁, t₁.IsGE X 0 → t₂.IsGE (T.obj X) 0

/-- `T` is t-exact. -/
def Functor.IsTExact (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) : Prop :=
  Functor.IsRightTExact T t₁ t₂ ∧ Functor.IsLeftTExact T t₁ t₂

lemma Functor.IsRightTExact.comp {T : C₁ ⥤ C₂} {S : C₂ ⥤ C₃} {t₁ : TStructure C₁}
    {t₂ : TStructure C₂} {t₃ : TStructure C₃} (hT : Functor.IsRightTExact T t₁ t₂)
    (hS : Functor.IsRightTExact S t₂ t₃) : Functor.IsRightTExact (T ⋙ S) t₁ t₃ := sorry

lemma Functor.IsLeftTExact.comp {T : C₁ ⥤ C₂} {S : C₂ ⥤ C₃} {t₁ : TStructure C₁}
    {t₂ : TStructure C₂} {t₃ : TStructure C₃} (hT : Functor.IsLeftTExact T t₁ t₂)
    (hS : Functor.IsLeftTExact S t₂ t₃) : Functor.IsLeftTExact (T ⋙ S) t₁ t₃ := sorry

lemma Functor.isRightTExact_iff_isLeftTExact_of_adjunction {F : C₂ ⥤ C₁} {G : C₁ ⥤ C₂}
    (adj : F ⊣ G) [F.CommShift ℤ] [G.CommShift ℤ] (t₁ : TStructure C₁) (t₂ : TStructure C₂) :
    Functor.IsRightTExact F t₂ t₁ ↔ Functor.IsLeftTExact G t₁ t₂ := sorry

variable [IsTriangulated C₁] [IsTriangulated C₂]

/-- `pT := H⁰_{t₂} ∘ T ∘ ι : heart(t₁) ⥤ heart(t₂)`. -/
def Functor.heartFunctor (T : C₁ ⥤ C₂) (t₁ : TStructure C₁) (t₂ : TStructure C₂) :
    t₁.heart.FullSubcategory ⥤ t₂.heart.FullSubcategory :=
  t₁.heart.ι ⋙ T ⋙ TStructure.homologyZero t₂

lemma Functor.heartFunctor_preservesFiniteColimits (T : C₁ ⥤ C₂) [T.CommShift ℤ] [T.IsTriangulated]
    (t₁ : TStructure C₁) (t₂ : TStructure C₂) (hT : Functor.IsRightTExact T t₁ t₂) :
    PreservesFiniteColimits (Functor.heartFunctor T t₁ t₂) := sorry

lemma Functor.heartFunctor_preservesFiniteLimits (T : C₁ ⥤ C₂) [T.CommShift ℤ] [T.IsTriangulated]
    (t₁ : TStructure C₁) (t₂ : TStructure C₂) (hT : Functor.IsLeftTExact T t₁ t₂) :
    PreservesFiniteLimits (Functor.heartFunctor T t₁ t₂) := sorry

/-- Test `TauCeti.EtaleDuality.isTExact_id`. -/
example (t : TStructure C₁) : Functor.IsTExact (𝟭 C₁) t t := sorry

/-- Test `TauCeti.EtaleDuality.isRightTExact_shift_one`. -/
example (t : TStructure C₁) : Functor.IsRightTExact (shiftFunctor C₁ (1 : ℤ)) t t := sorry

/-- Test `TauCeti.EtaleDuality.not_isLeftTExact_shift_one`. -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (M : A) (hM : ¬ IsZero M) :
    ¬ Functor.IsLeftTExact (shiftFunctor (DerivedCategory A) (1 : ℤ))
      (DerivedCategory.TStructure.t (C := A)) (DerivedCategory.TStructure.t (C := A)) := sorry

/-- Test `TauCeti.EtaleDuality.isTExact_canonical_exactFunctor`. -/
example {A B : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A]
    [Category.{u} B] [Abelian B] [HasDerivedCategory.{u} B] (F : A ⥤ B) [F.Additive]
    [PreservesFiniteLimits F] [PreservesFiniteColimits F] :
    Functor.IsTExact (F.mapDerivedCategory) (DerivedCategory.TStructure.t (C := A))
      (DerivedCategory.TStructure.t (C := B)) := sorry

end TExact

section Recollement

variable (D_F D D_U : Type*) [Category D_F] [Category D] [Category D_U]
  [Preadditive D_F] [HasZeroObject D_F] [HasShift D_F ℤ] [∀ n : ℤ, (shiftFunctor D_F n).Additive]
  [Pretriangulated D_F]
  [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive]
  [Pretriangulated D]
  [Preadditive D_U] [HasZeroObject D_U] [HasShift D_U ℤ] [∀ n : ℤ, (shiftFunctor D_U n).Additive]
  [Pretriangulated D_U]

/-- A recollement `D_F ⟶ D ⟶ D_U` (BBD 1.4.3; node `EDC.5/recollement-data`). -/
structure Recollement where
  /-- `i_*` -/
  iLowerStar : D_F ⥤ D
  /-- `j^*` -/
  jUpperStar : D ⥤ D_U
  /-- `i^*` -/
  iUpperStar : D ⥤ D_F
  /-- `i^!` -/
  iUpperShriek : D ⥤ D_F
  /-- `j_!` -/
  jLowerShriek : D_U ⥤ D
  /-- `j_*` -/
  jLowerStar : D_U ⥤ D
  adj₁ : iUpperStar ⊣ iLowerStar
  adj₂ : iLowerStar ⊣ iUpperShriek
  adj₃ : jLowerShriek ⊣ jUpperStar
  adj₄ : jUpperStar ⊣ jLowerStar
  fullyFaithful_iLowerStar : iLowerStar.FullyFaithful
  fullyFaithful_jLowerShriek : jLowerShriek.FullyFaithful
  fullyFaithful_jLowerStar : jLowerStar.FullyFaithful
  jUpperStar_iLowerStar : IsZero (iLowerStar ⋙ jUpperStar)
  [commShift_iLowerStar : iLowerStar.CommShift ℤ]
  [commShift_jUpperStar : jUpperStar.CommShift ℤ]
  [triangulated_iLowerStar : iLowerStar.IsTriangulated]
  [triangulated_jUpperStar : jUpperStar.IsTriangulated]
  /-- the triangle `j_!j^*K → K → i_*i^*K → (j_!j^*K)[1]` is distinguished -/
  triangle₁ (K : D) : ∃ δ : (iUpperStar ⋙ iLowerStar).obj K ⟶ ((jUpperStar ⋙ jLowerShriek).obj K)⟦(1 : ℤ)⟧,
    Pretriangulated.Triangle.mk (adj₃.counit.app K) (adj₁.unit.app K) δ ∈ distTriang D
  /-- the triangle `i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]` is distinguished -/
  triangle₂ (K : D) : ∃ δ : (jUpperStar ⋙ jLowerStar).obj K ⟶ ((iUpperShriek ⋙ iLowerStar).obj K)⟦(1 : ℤ)⟧,
    Pretriangulated.Triangle.mk (adj₂.counit.app K) (adj₄.unit.app K) δ ∈ distTriang D

variable {D_F D D_U}

/-- The functorial triangle `j_!j^*K → K → i_*i^*K →`. -/
def Recollement.triangleLowerShriek (R : Recollement D_F D D_U) (K : D) :
    Pretriangulated.Triangle D :=
  Pretriangulated.Triangle.mk (R.adj₃.counit.app K) (R.adj₁.unit.app K) (R.triangle₁ K).choose
lemma Recollement.triangleLowerShriek_distinguished (R : Recollement D_F D D_U) (K : D) :
    R.triangleLowerShriek K ∈ distTriang D := (R.triangle₁ K).choose_spec

/-- The functorial triangle `i_*i^!K → K → j_*j^*K →`. -/
def Recollement.triangleUpperShriek (R : Recollement D_F D D_U) (K : D) :
    Pretriangulated.Triangle D :=
  Pretriangulated.Triangle.mk (R.adj₂.counit.app K) (R.adj₄.unit.app K) (R.triangle₂ K).choose
lemma Recollement.triangleUpperShriek_distinguished (R : Recollement D_F D D_U) (K : D) :
    R.triangleUpperShriek K ∈ distTriang D := (R.triangle₂ K).choose_spec

lemma Recollement.upperStar_lowerShriek_eq_zero (R : Recollement D_F D D_U) :
    IsZero (R.jLowerShriek ⋙ R.iUpperStar) ∧ IsZero (R.jLowerStar ⋙ R.iUpperShriek) := sorry

open CategoryTheory.Pretriangulated.Opposite in
/-- The opposite recollement exchanges `j_!` with `j_*` and `i^*` with `i^!`. -/
def Recollement.op [IsTriangulated D_F] [IsTriangulated D] [IsTriangulated D_U]
    (R : Recollement D_F D D_U) : Recollement D_Fᵒᵖ Dᵒᵖ D_Uᵒᵖ := sorry

/-- Test `TauCeti.EtaleDuality.not_recollement_without_adjoints`: even a full inclusion need not have
both adjoints. Finite-dimensional vector spaces do not have a coreflector in all vector spaces;
applying a proposed adjunction to the one-dimensional vector space detects the obstruction. -/
example (F : Type u) [Field F] :
    ¬ ∃ R : ModuleCat.{u} F ⥤
      ObjectProperty.FullSubcategory (fun V : ModuleCat.{u} F => FiniteDimensional F V),
      Nonempty (ObjectProperty.ι (fun V : ModuleCat.{u} F => FiniteDimensional F V) ⊣ R) := sorry

variable [IsTriangulated D_F] [IsTriangulated D] [IsTriangulated D_U]

/-- Named theorem `EDC.5/glued-t-structure` (BBD 1.4.10): the glued t-structure. -/
def Recollement.glue (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U) :
    TStructure D := sorry

lemma Recollement.glue_le_iff (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U) (K : D) :
    (R.glue tF tU).IsLE K 0 ↔ tU.IsLE (R.jUpperStar.obj K) 0 ∧ tF.IsLE (R.iUpperStar.obj K) 0 := sorry

lemma Recollement.glue_ge_iff (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U) (K : D) :
    (R.glue tF tU).IsGE K 0 ↔ tU.IsGE (R.jUpperStar.obj K) 0 ∧
      tF.IsGE (R.iUpperShriek.obj K) 0 := sorry
lemma Recollement.glue_bounded (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U)
    (hF : ∀ K : D_F, ∃ a b : ℤ, tF.IsGE K a ∧ tF.IsLE K b)
    (hU : ∀ K : D_U, ∃ a b : ℤ, tU.IsGE K a ∧ tU.IsLE K b) (K : D) :
    ∃ a b : ℤ, (R.glue tF tU).IsGE K a ∧ (R.glue tF tU).IsLE K b := sorry

lemma Recollement.glue_exactness (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U) :
    Functor.IsRightTExact R.jLowerShriek tU (R.glue tF tU) ∧
    Functor.IsRightTExact R.iUpperStar (R.glue tF tU) tF ∧
    Functor.IsLeftTExact R.jLowerStar tU (R.glue tF tU) ∧
    Functor.IsLeftTExact R.iUpperShriek (R.glue tF tU) tF ∧
    Functor.IsTExact R.iLowerStar tF (R.glue tF tU) ∧
    Functor.IsTExact R.jUpperStar (R.glue tF tU) tU := sorry

/-- `j_!* B := image(pj_!B → pj_*B)` (node `EDC.5/abstract-intermediate-extension`). -/
def Recollement.intermediateExtension (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U) : tU.heart.FullSubcategory ⥤ (R.glue tF tU).heart.FullSubcategory := sorry

lemma Recollement.upperStar_intermediateExtension (R : Recollement D_F D D_U)
    (tF : TStructure D_F) (tU : TStructure D_U) (B : tU.heart.FullSubcategory) :
    Nonempty (R.jUpperStar.obj ((R.intermediateExtension tF tU).obj B).obj ≅ B.obj) := sorry

lemma Recollement.intermediateExtension_no_sub_quotient (R : Recollement D_F D D_U)
    (tF : TStructure D_F) (tU : TStructure D_U) (B : tU.heart.FullSubcategory)
    (S : (R.glue tF tU).heart.FullSubcategory) (hS : IsZero (R.jUpperStar.obj S.obj)) :
    (∀ f : S ⟶ (R.intermediateExtension tF tU).obj B, Mono f → IsZero S) ∧
      (∀ g : (R.intermediateExtension tF tU).obj B ⟶ S, Epi g → IsZero S) := sorry

lemma Recollement.intermediateExtension_unique (R : Recollement D_F D D_U)
    (tF : TStructure D_F) (tU : TStructure D_U) (B : tU.heart.FullSubcategory)
    (A : (R.glue tF tU).heart.FullSubcategory) (e : R.jUpperStar.obj A.obj ≅ B.obj)
    (h : ∀ (S : (R.glue tF tU).heart.FullSubcategory), IsZero (R.jUpperStar.obj S.obj) →
      (∀ f : S ⟶ A, Mono f → IsZero S) ∧ (∀ g : A ⟶ S, Epi g → IsZero S)) :
    Nonempty (A ≅ (R.intermediateExtension tF tU).obj B) := sorry

lemma Recollement.intermediateExtension_fullyFaithful (R : Recollement D_F D D_U)
    (tF : TStructure D_F) (tU : TStructure D_U) :
    Nonempty (R.intermediateExtension tF tU).FullyFaithful := sorry

lemma Recollement.simple_classification (R : Recollement D_F D D_U)
    (tF : TStructure D_F) (tU : TStructure D_U) (A : (R.glue tF tU).heart.FullSubcategory)
    [Simple A] :
    (∃ S : tU.heart.FullSubcategory, Simple S ∧ Nonempty (A ≅ (R.intermediateExtension tF tU).obj S)) ∨
    (∃ T : tF.heart.FullSubcategory, Simple T ∧
      Nonempty (A.obj ≅ R.iLowerStar.obj T.obj)) := sorry

/-- Test `TauCeti.EtaleDuality.intermediateExtension_simple`. -/
example (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U)
    (S : tU.heart.FullSubcategory) [Simple S] : Simple ((R.intermediateExtension tF tU).obj S) :=
  sorry

/-- Test `TauCeti.EtaleDuality.intermediateExtension_empty_closed`: if `D_F = 0`, `j^*` is an equivalence on hearts
and `j_!*` is its inverse. -/
example (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U)
    (h : ∀ X : D_F, IsZero X) : (R.intermediateExtension tF tU).IsEquivalence := sorry

end Recollement


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
    ((Finite Λ ∧ ∃ n : ℕ, 0 < n ∧ (ell ^ n : Λ) = 0) ∨
     (∃ O : Type u, ∃ _ : CommRing O, ∃ D : IntegralDatum (k := k) O,
       D.ell = ell ∧ ∃ n : ℕ, 0 < n ∧ Nonempty (O ⧸ Ideal.span {D.uniformizer ^ n} ≃+* Λ)) ∨
     (BBDBase (k := k) ell ∧ ∃ D : IntegralDatum (k := k) Λ, D.ell = ell) ∨
     (BBDBase (k := k) ell ∧ ∃ D : RationalDatum (k := k) Λ, D.integral.ell = ell))
attribute [instance] PerverseContext.perfect

/-- The base point belongs to the finite-type separated category. -/
def basePoint (k : Type u) [Field k] : Geo k := sorry
lemma basePoint_space : (basePoint k).space = Spec (CommRingCat.of k) := sorry
abbrev geoIdentity (X : Geo k) : X ⟶ X := 𝟙 X
instance geoIdentityProper (X : Geo k) : IsProper (geoIdentity X).hom.left := sorry
def toBasePoint (X : Geo k) : X ⟶ basePoint k := sorry
lemma toBasePoint_native (X : Geo k) : (toBasePoint X).hom.left ≫ (basePoint k).structural = X.structural := sorry
/-- Imported SF.0/SF.2 fibre product, with its maps over k. -/
def fiberProduct {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : Geo k := sorry
def fiberProductFst {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : fiberProduct f g ⟶ X := sorry
def fiberProductSnd {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) : fiberProduct f g ⟶ Y := sorry
lemma fiberProduct_square {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) :
    fiberProductFst f g ≫ f = fiberProductSnd f g ≫ g := sorry
/-- Native universal-property identification, fixing the meaning of the imported carrier. -/
lemma fiberProduct_native {X Y Z : Geo k} (f : X ⟶ Z) (g : Y ⟶ Z) :
    Nonempty ((fiberProduct f g).space ≅ pullback f.hom.left g.hom.left) := sorry

section Imported
variable {Λ : Type u} [CommRing Λ]
/-- EDC.0/constructible-ctf-complexes and EDC.6: bounded constructible complexes,
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
/-- EDC.0/etale-derived-category: the faithful realization is actual étale derived data. -/
def etaleRealization (X : Geo k) :
    Dbc Λ X ⥤ DerivedCategory (Sheaf X.space.smallEtaleTopology (ModuleCat.{u} Λ)) := sorry
/-- EDC.0–3 six operations, twists and cohomology, all over the common base. -/
def pullback {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ Y ⥤ Dbc Λ X := sorry
def pushforward {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ X ⥤ Dbc Λ Y := sorry
def lowerShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ X ⥤ Dbc Λ Y := sorry
def upperShriek {X Y : Geo k} (f : X ⟶ Y) : Dbc Λ Y ⥤ Dbc Λ X := sorry
def verdierDual (X : Geo k) : (Dbc Λ X)ᵒᵖ ⥤ Dbc Λ X := sorry
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
def GeomPoint.dim {X : Geo k} (x : GeomPoint X) : WithBot ℕ∞ :=
  topologicalKrullDim (closure ({x.pt.base (IsLocalRing.closedPoint x.Ω)} : Set X.space))
def stalkCohomology {X : Geo k} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
def costalkCohomology {X : Geo k} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
/-- SF.2 internal derived Hom. -/
def derivedInternalHom {X : Geo k} : Dbc Λ X → Dbc Λ X → Dbc Λ X := sorry
/-- SF.2/EDC.0: finite locally constant coefficient modules, realized in ordinary degree zero. -/
def Lisse (Λ : Type u) [CommRing Λ] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (Lisse Λ X) := sorry
def lisseComplex {X : Geo k} : Lisse Λ X ⥤ Dbc Λ X := sorry
def constantLisse (X : Geo k) : Lisse Λ X := sorry
def restrictLisse {U X : Geo k} (j : U ⟶ X) [Etale j.hom.left] : Lisse Λ X ⥤ Lisse Λ U := sorry
/-- EDC.0: finite Tor amplitude, stated through the actual derived tensor products. -/
def derivedTensor {X : Geo k} : Dbc Λ X → Dbc Λ X → Dbc Λ X := sorry
def HasFiniteTorAmplitude {X : Geo k} (K : Dbc Λ X) : Prop :=
  ∃ a b : ℤ, ∀ M : Dbc Λ X, (standardTStructure Λ X).heart M →
    (standardTStructure Λ X).IsGE (derivedTensor K M) a ∧
    (standardTStructure Λ X).IsLE (derivedTensor K M) b
end Imported

/-! EDC.5: BBD base/coefficient hypotheses are explicit in every geometric perverse signature. -/
section Perverse
variable {Λ : Type u} [CommRing Λ] [PerverseContext (k := k) Λ]

def Recollement.ofClosedOpen {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (h : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) :
    Recollement (Dbc Λ Z) (Dbc Λ X) (Dbc Λ U) := sorry
/-- Test `TauCeti.EtaleDuality.recollement_ofClosedOpen_empty`. -/
example {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left] (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (h : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) [IsEmpty Z.space] :
    (Recollement.ofClosedOpen (Λ := Λ) i j h).jUpperStar.IsEquivalence := sorry
/-- Test `TauCeti.EtaleDuality.recollement_ofClosedOpen_upperStar`. -/
example {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left] (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (h : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) :
    Nonempty ((Recollement.ofClosedOpen (Λ := Λ) i j h).jUpperStar ≅ pullback j) := sorry
/-- Test `TauCeti.EtaleDuality.recollement_triangle_point`. -/
example {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left] (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (h : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) :
    (Recollement.ofClosedOpen (Λ := Λ) i j h).triangleLowerShriek (constant X) ∈ distTriang _ := sorry

/-- EDC.5/perverse-t-structure. -/
def perverseTStructure (Λ : Type u) [CommRing Λ] [PerverseContext (k := k) Λ]
    (X : Geo k) : TStructure (Dbc Λ X) := sorry
lemma perverseTStructure_le_iff {X : Geo k} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsLE K 0 ↔ ∀ (x : GeomPoint X) (j : ℤ) (d : ℕ),
      x.dim = d → 0 < j + d → IsZero (stalkCohomology x j K) := sorry
lemma perverseTStructure_ge_iff {X : Geo k} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsGE K 0 ↔ ∀ (x : GeomPoint X) (j : ℤ) (d : ℕ),
      x.dim = d → j + d < 0 → IsZero (costalkCohomology x j K) := sorry
lemma perverseTStructure_ge_iff_verdierDual [Field Λ] {X : Geo k} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsGE K 0 ↔
      (perverseTStructure Λ X).IsLE ((verdierDual X).obj (Opposite.op K)) 0 := sorry
lemma perverseTStructure_bounded {X : Geo k} (K : Dbc Λ X) :
    ∃ a b : ℤ, a ≤ b ∧ (perverseTStructure Λ X).IsGE K a ∧ (perverseTStructure Λ X).IsLE K b := sorry
lemma perverseTStructure_restrict_etale {V X : Geo k} (f : V ⟶ X) [Etale f.hom.left] :
    Functor.IsTExact (pullback (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ V) := sorry
lemma perverseTStructure_glue {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] (h : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) :
    perverseTStructure Λ X = (Recollement.ofClosedOpen i j h).glue
      (perverseTStructure Λ Z) (perverseTStructure Λ U) := sorry

/-- EDC.5/perverse-sheaves. -/
abbrev PerverseSheaf (Λ : Type u) [CommRing Λ] [PerverseContext (k := k) Λ] (X : Geo k) :=
  (perverseTStructure Λ X).heart.FullSubcategory
instance PerverseSheaf.abelian (X : Geo k) : Abelian (PerverseSheaf Λ X) := sorry
def perverseCohomology {X : Geo k} (n : ℤ) : Dbc Λ X ⥤ PerverseSheaf Λ X :=
  TStructure.homology _ n
instance perverseCohomology_isHomological {X : Geo k} :
    (perverseCohomology (Λ := Λ) (X := X) 0).IsHomological := sorry
def PerverseSheaf.restrictEtale {V X : Geo k} (f : V ⟶ X) [Etale f.hom.left] :
    PerverseSheaf Λ X ⥤ PerverseSheaf Λ V := sorry
lemma PerverseSheaf.hom_isSheaf {V X : Geo k} (f : V ⟶ X) [Etale f.hom.left] [Surjective f.hom.left]
    {K L : PerverseSheaf Λ X} (g g' : K ⟶ L)
    (h : (PerverseSheaf.restrictEtale f).map g = (PerverseSheaf.restrictEtale f).map g') : g = g' := sorry
lemma PerverseSheaf.isIso_of_restrictEtale {V X : Geo k} (f : V ⟶ X) [Etale f.hom.left] [Surjective f.hom.left]
    {K L : PerverseSheaf Λ X} (g : K ⟶ L) [IsIso ((PerverseSheaf.restrictEtale f).map g)] : IsIso g := sorry
/-- SF.2 derived restriction to an arbitrary object of the small étale site. -/
def etaleDerivedRestriction {X : Geo k} (V : X.space.Etale) :
    DerivedCategory (Sheaf X.space.smallEtaleTopology (ModuleCat.{u} Λ)) ⥤
      DerivedCategory (Sheaf V.left.smallEtaleTopology (ModuleCat.{u} Λ)) := sorry
/-- The full sheaf assertion includes gluing, beyond the preceding faithfulness corollary. -/
def perverseHomPresheaf {X : Geo k} (K L : PerverseSheaf Λ X) : X.space.Etaleᵒᵖ ⥤ Type u := sorry
lemma perverseHomPresheaf_value {X : Geo k} (K L : PerverseSheaf Λ X) (V : X.space.Etale) :
    Nonempty ((perverseHomPresheaf K L).obj (Opposite.op V) ≃
      ((etaleDerivedRestriction V).obj ((etaleRealization X).obj K.obj) ⟶
        (etaleDerivedRestriction V).obj ((etaleRealization X).obj L.obj))) := sorry
lemma PerverseSheaf.hom_presheaf_isSheaf {X : Geo k} (K L : PerverseSheaf Λ X) :
    Presheaf.IsSheaf X.space.smallEtaleTopology (perverseHomPresheaf K L) := sorry

/-- EDC.5/lisse-shift-is-perverse: the input is an arbitrary lisse coefficient module. -/
theorem lisse_shift_isPerverse {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (L : Lisse Λ X) : (perverseTStructure Λ X).heart ((lisseComplex.obj L)⟦(d : ℤ)⟧) := sorry
def lissePerverse {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (L : Lisse Λ X) : PerverseSheaf Λ X := ⟨_, lisse_shift_isPerverse d L⟩
def constantPerverse {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural] :
    PerverseSheaf Λ X := lissePerverse d (constantLisse X)
/-- Test `TauCeti.EtaleDuality.perverse_curve_constant_shift`. -/
example {X : Geo k} [SmoothOfRelativeDimension 1 X.structural] :
    (perverseTStructure Λ X).heart ((constant (Λ := Λ) X)⟦(1 : ℤ)⟧) := sorry
/-- Test `TauCeti.EtaleDuality.perverse_empty`. -/
example {X : Geo k} [IsEmpty X.space] (K : Dbc Λ X) : IsZero K := sorry
/-- Test `TauCeti.EtaleDuality.not_perverse_curve_constant`. -/
example {X : Geo k} [SmoothOfRelativeDimension 1 X.structural] [Nonempty X.space] [Nontrivial Λ] :
    (perverseTStructure Λ X).IsGE (constant X) 1 ∧
      ¬ (perverseTStructure Λ X).IsLE (constant X) 0 := sorry
/-- Test `TauCeti.EtaleDuality.not_perverse_constant_surface`. -/
example {X : Geo k} [SmoothOfRelativeDimension 2 X.structural] [Nonempty X.space] [Nontrivial Λ] :
    (perverseTStructure Λ X).IsGE ((constant X)⟦(1 : ℤ)⟧) 1 ∧
      ¬ (perverseTStructure Λ X).IsLE ((constant X)⟦(1 : ℤ)⟧) 0 := sorry
/-- Finite modules, as an actual full subcategory of Mathlib's ModuleCat. -/
abbrev FiniteModules (Λ : Type u) [CommRing Λ] :=
  ObjectProperty.FullSubcategory (fun M : ModuleCat.{u} Λ => Module.Finite Λ M)
/-- The point calculation is an equivalence with finite modules, not just a vanishing assertion. -/
def perversePointEquiv [IsSepClosed k] : PerverseSheaf Λ (basePoint k) ≌ FiniteModules Λ := sorry
lemma perverseTStructure_point [IsSepClosed k] (K : Dbc Λ (basePoint k)) :
    (perverseTStructure Λ _).IsLE K 0 ↔ (standardTStructure Λ _).IsLE K 0 := sorry
/-- Test `TauCeti.EtaleDuality.perverse_point_eq_canonical`. -/
example [IsSepClosed k] (K : Dbc Λ (basePoint k)) :
    (perverseTStructure Λ _).IsGE K 0 ↔ (standardTStructure Λ _).IsGE K 0 := sorry
/-- Test `TauCeti.EtaleDuality.perverseSheaf_point`. -/
example [IsSepClosed k] : Nonempty (PerverseSheaf Λ (basePoint k) ≌ FiniteModules Λ) := sorry
/-- Test `TauCeti.EtaleDuality.perverseSheaf_skyscraper`: every finite module is allowed. -/
example [IsSepClosed k] {X : Geo k} (i : basePoint k ⟶ X) [IsClosedImmersion i.hom.left]
    (M : FiniteModules Λ) :
    ∃ P : PerverseSheaf Λ X, Nonempty (P.obj ≅
      (pushforward i).obj ((perversePointEquiv (Λ := Λ)).inverse.obj M).obj) := sorry
/-- Test `TauCeti.EtaleDuality.perverseSheaf_empty`. -/
example {X : Geo k} [IsEmpty X.space] (P : PerverseSheaf Λ X) : IsZero P := sorry



/-- SF.2 effective derived etale descent data: local derived objects, isomorphisms
on the native relative double intersections, and identity/triple cocycle laws.
This is the existing derived-sheaf descent carrier, not a perverse-specific axiom. -/
def EtaleDescentData (Λ : Type u) [CommRing Λ] {I : Type u} {X : Geo k} (U : I → Geo k) (f : ∀ i, U i ⟶ X) :
    Type (u + 1) := sorry
def EtaleDescentData.component {I : Type u} {X : Geo k} {U : I → Geo k}
    {f : ∀ i, U i ⟶ X} (D : EtaleDescentData (Λ := Λ) U f) (i : I) : Dbc Λ (U i) := sorry
/-- The perverse heart inherits effective object descent from the derived carrier,
because both stalk/costalk inequalities are etale-local. -/
lemma perverse_effective_descent {I : Type u} {X : Geo k} (U : I → Geo k)
    (f : ∀ i, U i ⟶ X) (hf : ∀ i, Etale (f i).hom.left)
    (hcover : ⋃ i, Set.range (f i).hom.left.base = Set.univ)
    (D : EtaleDescentData (Λ := Λ) U f)
    (hD : ∀ i, (perverseTStructure Λ (U i)).heart (D.component i)) :
    ∃ P : PerverseSheaf Λ X, ∀ i, Nonempty ((pullback (f i)).obj P.obj ≅ D.component i) := sorry

/-- EDC.5/perverse-recollement: all six directional assertions. -/
theorem perverse_recollement {Z X U : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    Functor.IsRightTExact (lowerShriek (Λ := Λ) j) (perverseTStructure Λ U) (perverseTStructure Λ X) ∧
    Functor.IsRightTExact (pullback (Λ := Λ) i) (perverseTStructure Λ X) (perverseTStructure Λ Z) ∧
    Functor.IsLeftTExact (pushforward (Λ := Λ) j) (perverseTStructure Λ U) (perverseTStructure Λ X) ∧
    Functor.IsLeftTExact (upperShriek (Λ := Λ) i) (perverseTStructure Λ X) (perverseTStructure Λ Z) ∧
    Functor.IsTExact (pushforward (Λ := Λ) i) (perverseTStructure Λ Z) (perverseTStructure Λ X) ∧
    Functor.IsTExact (pullback (Λ := Λ) j) (perverseTStructure Λ X) (perverseTStructure Λ U) := sorry

def pLowerShriek {U X : Geo k} (j : U ⟶ X) : PerverseSheaf Λ U ⥤ PerverseSheaf Λ X :=
  ObjectProperty.ι _ ⋙ lowerShriek j ⋙ perverseCohomology 0
def pLowerStar {U X : Geo k} (j : U ⟶ X) : PerverseSheaf Λ U ⥤ PerverseSheaf Λ X :=
  ObjectProperty.ι _ ⋙ pushforward j ⋙ perverseCohomology 0
def pLowerShriekToLowerStar {U X : Geo k} (j : U ⟶ X) :
    pLowerShriek (Λ := Λ) j ⟶ pLowerStar j := sorry
/-- EDC.5/intermediate-extension. -/
def intermediateExtension {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    PerverseSheaf Λ U ⥤ PerverseSheaf Λ X := sorry
lemma intermediateExtension_eq_image {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (A : PerverseSheaf Λ U) :
    Nonempty ((intermediateExtension j).obj A ≅ image ((pLowerShriekToLowerStar j).app A)) := sorry
lemma restrict_intermediateExtension {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    [Etale j.hom.left] (A : PerverseSheaf Λ U) :
    Nonempty ((PerverseSheaf.restrictEtale j).obj ((intermediateExtension j).obj A) ≅ A) := sorry
lemma intermediateExtension_stalk_bound {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (A : PerverseSheaf Λ U) (x : GeomPoint X)
    (hx : x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.hom.left.base)
    (d : ℕ) (hd : x.dim = d) (i : ℤ) (hi : -(d : ℤ) ≤ i) :
    IsZero (stalkCohomology x i ((intermediateExtension j).obj A).obj) := sorry
lemma intermediateExtension_costalk_bound {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (A : PerverseSheaf Λ U) (x : GeomPoint X)
    (hx : x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.hom.left.base)
    (d : ℕ) (hd : x.dim = d) (i : ℤ) (hi : i ≤ -(d : ℤ)) :
    IsZero (costalkCohomology x i ((intermediateExtension j).obj A).obj) := sorry
lemma intermediateExtension_fullyFaithful {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    Nonempty (intermediateExtension (Λ := Λ) j).FullyFaithful := sorry
lemma intermediateExtension_comp {U V X : Geo k} (j₁ : U ⟶ V) (j₂ : V ⟶ X)
    [IsOpenImmersion j₁.hom.left] [IsOpenImmersion j₂.hom.left]
    [IsOpenImmersion (j₁ ≫ j₂).hom.left] :
    Nonempty (intermediateExtension (Λ := Λ) (j₁ ≫ j₂) ≅
      intermediateExtension j₁ ⋙ intermediateExtension j₂) := sorry
/-- Locally closed extension uses a chosen open-then-closed factorization. -/
def intermediateExtensionLocallyClosed {U Z X : Geo k} (j : U ⟶ Z) [IsOpenImmersion j.hom.left]
    (i : Z ⟶ X) [IsClosedImmersion i.hom.left] : PerverseSheaf Λ U ⥤ PerverseSheaf Λ X :=
  intermediateExtension j ⋙ Functor.heartFunctor (pushforward i)
    (perverseTStructure Λ Z) (perverseTStructure Λ X)
lemma intermediateExtension_truncation_formula {Z U X : Geo k} (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (e : ℕ) [SmoothOfRelativeDimension e Z.structural]
    (hcomp : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ)
    (A : PerverseSheaf Λ U) (hA : (standardTStructure Λ U).IsLE A.obj (-(e : ℤ) - 1)) :
    Nonempty (((intermediateExtension j).obj A).obj ≅
      ((standardTStructure Λ X).truncLE (-(e : ℤ) - 1)).obj ((pushforward j).obj A.obj)) := sorry
/-- Exact four nonzero terms, including the endpoint monomorphism and epimorphism. -/
structure ExactFour {X : Geo k} {A B C D : PerverseSheaf Λ X} (f : A ⟶ B) (g : B ⟶ C) (h : C ⟶ D) : Prop where
  fg : f ≫ g = 0
  gh : g ≫ h = 0
  mono : Mono f
  epi : Epi h
  exact₁ : (ShortComplex.mk f g fg).Exact
  exact₂ : (ShortComplex.mk g h gh).Exact
/-- BBD 4.1.11, p. 106. Amplitude one is asserted under the affine-open hypothesis. -/
lemma perverse_recollement_five_term {Z U X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] [IsAffineHom j.hom.left]
    (hcomp : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ) (A : PerverseSheaf Λ U) :
    ∃ (B D : PerverseSheaf Λ X)
      (eB : B.obj ≅ (pushforward i).obj
        ((perverseCohomology (-1)).obj ((pullback i).obj ((pushforward j).obj A.obj))).obj)
      (eD : D.obj ≅ (pushforward i).obj
        ((perverseCohomology 0).obj ((pullback i).obj ((pushforward j).obj A.obj))).obj)
      (f : B ⟶ (pLowerShriek j).obj A) (h : (pLowerStar j).obj A ⟶ D),
      ExactFour f ((pLowerShriekToLowerStar j).app A) h := sorry
/-- Test `TauCeti.EtaleDuality.intermediateExtension_iso`. -/
example {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] [IsIso j] :
    (intermediateExtension (Λ := Λ) j).IsEquivalence := sorry
/-- Test `TauCeti.EtaleDuality.intermediateExtension_curve_constant`. -/
example {U X : Geo k} [SmoothOfRelativeDimension 1 X.structural]
    [SmoothOfRelativeDimension 1 U.structural] (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hdense : DenseRange j.hom.left.base) :
    Nonempty ((intermediateExtension j).obj (constantPerverse (Λ := Λ) (X := U) 1) ≅
      constantPerverse (X := X) 1) := sorry
/-- Test `TauCeti.EtaleDuality.intermediateExtension_kummer`: clean extension, including both identifications. -/
example {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] (A : PerverseSheaf Λ U)
    (h : ∀ x : GeomPoint X, x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.hom.left.base →
      ∀ i : ℤ, IsZero (stalkCohomology x i ((pushforward j).obj A.obj))) :
    Nonempty (((intermediateExtension j).obj A).obj ≅ (lowerShriek j).obj A.obj) ∧
    Nonempty (((intermediateExtension j).obj A).obj ≅ (pushforward j).obj A.obj) := sorry
/-- Test `TauCeti.EtaleDuality.not_intermediateExtension_eq_lowerShriek`. -/
example [Field Λ] [IsSepClosed k] {U X : Geo k} [SmoothOfRelativeDimension 1 X.structural]
    [SmoothOfRelativeDimension 1 U.structural] (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hdense : DenseRange j.hom.left.base) (hZ : (Set.range j.hom.left.base)ᶜ.Nonempty) :
    ¬ Nonempty (((intermediateExtension j).obj (constantPerverse (Λ := Λ) (X := U) 1)).obj ≅
      (lowerShriek j).obj (constantPerverse (Λ := Λ) (X := U) 1).obj) := sorry
/-- Test `TauCeti.EtaleDuality.intermediateExtension_ne_lowerShriek`: the nonzero boundary term is a subobject. -/
example [Field Λ] [IsSepClosed k] {U X : Geo k} [SmoothOfRelativeDimension 1 X.structural]
    [SmoothOfRelativeDimension 1 U.structural] (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    [IsAffineHom j.hom.left] (hdense : DenseRange j.hom.left.base)
    (s : basePoint k ⟶ X) [IsClosedImmersion s.hom.left]
    (hZ : Set.range s.hom.left.base = (Set.range j.hom.left.base)ᶜ) :
    ∃ (B : PerverseSheaf Λ X) (eB : B.obj ≅ (pushforward s).obj (constant _))
      (f : B ⟶ (pLowerShriek j).obj (constantPerverse (Λ := Λ) (X := U) 1))
      (g : (pLowerShriek j).obj (constantPerverse (Λ := Λ) (X := U) 1) ⟶ constantPerverse (X := X) 1)
      (hfg : f ≫ g = 0), Mono f ∧ Epi g ∧ (ShortComplex.mk f g hfg).Exact ∧ ¬ IsZero B := sorry
/-- Test `TauCeti.EtaleDuality.not_unrestricted_standard_truncation`: a skyscraper in U survives intermediate
extension; ordinary truncation at -1 kills it. -/
example [IsSepClosed k] {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (A : PerverseSheaf Λ U) (hA : ¬ IsZero A) (hdegree : (standardTStructure Λ U).heart A.obj)
    (hpush : (standardTStructure Λ X).heart ((pushforward j).obj A.obj)) :
    ¬ IsZero ((intermediateExtension j).obj A) ∧
    IsZero (((standardTStructure Λ X).truncLE (-1)).obj ((pushforward j).obj A.obj)) := sorry

/-- EDC.5/intersection-complex: lisse input, dimension shift, and dense smooth open. -/
def intersectionComplex {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hdense : DenseRange j.hom.left.base) (d : ℕ) [SmoothOfRelativeDimension d U.structural]
    (L : Lisse Λ U) : PerverseSheaf Λ X := (intermediateExtension j).obj (lissePerverse d L)
lemma intersectionComplex_restrict {U' U X : Geo k} (j : U ⟶ X) (j' : U' ⟶ U)
    [IsOpenImmersion j.hom.left] [IsOpenImmersion j'.hom.left] [Etale j'.hom.left]
    [IsOpenImmersion (j' ≫ j).hom.left]
    (hj : DenseRange j.hom.left.base) (hj' : DenseRange j'.hom.left.base)
    (hcomp : DenseRange (j' ≫ j).hom.left.base) (d : ℕ)
    [SmoothOfRelativeDimension d U.structural] [SmoothOfRelativeDimension d U'.structural]
    (L : Lisse Λ U) : Nonempty (intersectionComplex (j' ≫ j) hcomp d ((restrictLisse j').obj L) ≅
      intersectionComplex j hj d L) := sorry
lemma intersectionComplex_of_smooth {X : Geo k} (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (L : Lisse Λ X) (h : DenseRange (geoIdentity X).hom.left.base) [IsOpenImmersion (geoIdentity X).hom.left] :
    Nonempty (intersectionComplex (𝟙 X) h d L ≅ lissePerverse d L) := sorry
/-- SF.2 underived direct image of lisse sheaves, realized in ordinary degree zero. -/
def underivedPushforward {U X : Geo k} (j : U ⟶ X) : Lisse Λ U ⥤ Dbc Λ X := sorry
lemma intersectionComplex_curve {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hj : DenseRange j.hom.left.base) [SmoothOfRelativeDimension 1 U.structural]
    (hX : topologicalKrullDim X.space = 1) (L : Lisse Λ U) :
    Nonempty ((intersectionComplex j hj 1 L).obj ≅ ((underivedPushforward j).obj L)⟦(1 : ℤ)⟧) := sorry
instance {X : Geo k} : Preadditive (Lisse Λ X) := sorry
instance {X : Geo k} : HasZeroObject (Lisse Λ X) := sorry
lemma intersectionComplex_simple [Field Λ] {U X : Geo k} [IrreducibleSpace U.space]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base)
    (d : ℕ) [SmoothOfRelativeDimension d U.structural] (L : Lisse Λ U) [Simple L] :
    Simple (intersectionComplex j hj d L) := sorry
lemma intersectionComplex_finite_birational {X' X U : Geo k} (ν : X' ⟶ X)
    [IsFinite ν.hom.left] [Surjective ν.hom.left] (d : ℕ)
    [SmoothOfRelativeDimension d X'.structural] [SmoothOfRelativeDimension d U.structural]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base)
    (j' : U ⟶ X') [IsOpenImmersion j'.hom.left] [Etale j'.hom.left]
    (hj' : DenseRange j'.hom.left.base) (hcomm : j' ≫ ν = j) (L' : Lisse Λ X') :
    Nonempty ((intersectionComplex j hj d ((restrictLisse j').obj L')).obj ≅
      (pushforward ν).obj (lissePerverse d L').obj) := sorry
/-- Test `TauCeti.EtaleDuality.intersectionComplex_smoothCurve`. -/
example {X : Geo k} [SmoothOfRelativeDimension 1 X.structural]
    [IsOpenImmersion (geoIdentity X).hom.left] (h : DenseRange (geoIdentity X).hom.left.base) :
    Nonempty (intersectionComplex (𝟙 X) h 1 (constantLisse (Λ := Λ) X) ≅ constantPerverse 1) := sorry
/-- Test `TauCeti.EtaleDuality.intersectionComplex_nodalCurve`: the two geometric branches give two stalk generators. -/
example [IsSepClosed k] {X' X U : Geo k} (ν : X' ⟶ X) [IsFinite ν.hom.left] [Surjective ν.hom.left]
    [SmoothOfRelativeDimension 1 X'.structural] [SmoothOfRelativeDimension 1 U.structural]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base)
    (j' : U ⟶ X') [IsOpenImmersion j'.hom.left] [Etale j'.hom.left]
    (hj' : DenseRange j'.hom.left.base) (hcomm : j' ≫ ν = j) (s : basePoint k ⟶ X)
    [IsClosedImmersion s.hom.left] (x : GeomPoint X)
    (hx : x.pt.base (IsLocalRing.closedPoint x.Ω) ∈ Set.range s.hom.left.base)
    [Fintype (fiberProduct ν s).space] (hbranches : Fintype.card (fiberProduct ν s).space = 2) :
    Nonempty (stalkCohomology x (-1) (intersectionComplex j hj 1 (constantLisse (Λ := Λ) U)).obj ≅
      ModuleCat.of Λ (Fin 2 → Λ)) := sorry
/-- Test `TauCeti.EtaleDuality.intersectionComplex_cuspidalCurve`: the finite universal homeomorphism has one branch. -/
example {X' X U : Geo k} (ν : X' ⟶ X) [IsFinite ν.hom.left] [Surjective ν.hom.left]
    [UniversallyInjective ν.hom.left] [SmoothOfRelativeDimension 1 X'.structural]
    [SmoothOfRelativeDimension 1 U.structural] (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hj : DenseRange j.hom.left.base) (j' : U ⟶ X') [IsOpenImmersion j'.hom.left]
    [Etale j'.hom.left] (hj' : DenseRange j'.hom.left.base) (hcomm : j' ≫ ν = j) :
    Nonempty ((intersectionComplex j hj 1 (constantLisse (Λ := Λ) U)).obj ≅
      (constant X)⟦(1 : ℤ)⟧) := sorry
/-- Test `TauCeti.EtaleDuality.not_intersectionComplex_nodal_constant`: the rank-two stalk precludes a constant IC. -/
example {X U : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hj : DenseRange j.hom.left.base) [SmoothOfRelativeDimension 1 U.structural]
    (x : GeomPoint X) (hnode : Nonempty (stalkCohomology x (-1)
      (intersectionComplex j hj 1 (constantLisse (Λ := Λ) U)).obj ≅ ModuleCat.of Λ (Fin 2 → Λ)))
    (hconstant : Nonempty (stalkCohomology x (-1) ((constant (Λ := Λ) X)⟦(1 : ℤ)⟧) ≅ ModuleCat.of Λ Λ))
    [IsNoetherianRing Λ] [Nontrivial Λ] :
    ¬ Nonempty ((intersectionComplex j hj 1 (constantLisse (Λ := Λ) U)).obj ≅
      (constant X)⟦(1 : ℤ)⟧) := sorry
/-- EDC.5/simple-perverse-sheaves, including rational fields, without assuming finite cardinality. -/
theorem perverseSheaf_finite_length [Field Λ] {X : Geo k} (P : PerverseSheaf Λ X) :
    IsArtinianObject P ∧ IsNoetherianObject P := sorry
/-- Full simple IC classification includes a closed support followed by its dense smooth open. -/
theorem simplePerverse_ic [Field Λ] {X : Geo k} (P : PerverseSheaf Λ X) [Simple P] :
    ∃ (Z U : Geo k) (i : Z ⟶ X) (_ : IsClosedImmersion i.hom.left)
      (j : U ⟶ Z) (_ : IsOpenImmersion j.hom.left) (hj : DenseRange j.hom.left.base)
      (d : ℕ) (_ : SmoothOfRelativeDimension d U.structural) (L : Lisse Λ U),
      Simple L ∧ Nonempty (P.obj ≅ (pushforward i).obj (intersectionComplex j hj d L).obj) := sorry
/-- EDC.5/verdier-duality-perverse. -/
theorem verdierDual_perverse [Field Λ] {X : Geo k} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsLE K 0 ↔
      (perverseTStructure Λ X).IsGE ((verdierDual X).obj (Opposite.op K)) 0 := sorry
/-- Lisse dual and Tate twist are coefficient data, not a dual of an arbitrary perverse input. -/
def lisseDual {X : Geo k} (L : Lisse Λ X) : Lisse Λ X := sorry
def lisseTwist {X : Geo k} (L : Lisse Λ X) (n : ℤ) : Lisse Λ X := sorry
lemma verdierDual_intersectionComplex [Field Λ] {U X : Geo k} (j : U ⟶ X)
    [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base)
    (d : ℕ) [SmoothOfRelativeDimension d U.structural] (L : Lisse Λ U) :
    Nonempty ((verdierDual X).obj (Opposite.op (intersectionComplex j hj d L).obj) ≅
      (intersectionComplex j hj d (lisseTwist (lisseDual L) d)).obj) := sorry

/-- EDC.5/affine-perverse-artin-vanishing, BBD 4.1.1–2, pp. 102–103. -/
theorem affine_perverse_artin_vanishing {X Y : Geo k} (f : X ⟶ Y) [IsAffineHom f.hom.left] :
    Functor.IsRightTExact (pushforward (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) := sorry
theorem affine_perverse_artin_vanishing_shriek {X Y : Geo k} (f : X ⟶ Y) [IsAffineHom f.hom.left] :
    Functor.IsLeftTExact (lowerShriek (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) := sorry
lemma affine_perverse_cohomology [IsSepClosed k] {X : Geo k} [IsAffine X.space]
    (P : PerverseSheaf Λ X) (i : ℤ) :
    (0 < i → IsZero (cohomology i P.obj)) ∧ (i < 0 → IsZero (compactCohomology i P.obj)) := sorry
abbrev geometricFiber {X Y : Geo k} (f : X ⟶ Y) (x : GeomPoint Y) : Scheme.{u} :=
  Limits.pullback f.hom.left x.pt
/-- Actual geometric fibre dimensions, not the dimension of the source alone. -/
def FibresDimLE {X Y : Geo k} (f : X ⟶ Y) (d : ℕ) : Prop :=
  ∀ x : GeomPoint Y, topologicalKrullDim (geometricFiber f x) ≤ d
/-- EDC.5/perverse-amplitude-estimates: the four one-sided bounds. -/
theorem perverse_amplitude_estimates {X Y : Geo k} (f : X ⟶ Y) (d : ℕ) (h : FibresDimLE f d)
    (K : Dbc Λ Y) (L : Dbc Λ X) :
    ((perverseTStructure Λ Y).IsLE K 0 → (perverseTStructure Λ X).IsLE ((pullback f).obj K) d) ∧
    ((perverseTStructure Λ Y).IsGE K 0 → (perverseTStructure Λ X).IsGE ((upperShriek f).obj K) (-(d : ℤ))) ∧
    ((perverseTStructure Λ X).IsLE L 0 → (perverseTStructure Λ Y).IsLE ((lowerShriek f).obj L) d) ∧
    ((perverseTStructure Λ X).IsGE L 0 → (perverseTStructure Λ Y).IsGE ((pushforward f).obj L) (-(d : ℤ))) := sorry
theorem smooth_pullback_shift_tExact {X Y : Geo k} (f : X ⟶ Y) (d : ℕ)
    [SmoothOfRelativeDimension d f.hom.left] :
    Functor.IsTExact (pullback (Λ := Λ) f ⋙ shiftFunctor (Dbc Λ X) (d : ℤ))
      (perverseTStructure Λ Y) (perverseTStructure Λ X) := sorry
lemma smooth_shriek_shift {X Y : Geo k} (f : X ⟶ Y) (d : ℕ)
    [SmoothOfRelativeDimension d f.hom.left] :
    Nonempty (pullback (Λ := Λ) f ⋙ shiftFunctor (Dbc Λ X) (d : ℤ) ≅
      upperShriek f ⋙ shiftFunctor (Dbc Λ X) (-(d : ℤ)) ⋙ twist X (-(d : ℤ))) := sorry
lemma smooth_connected_fullyFaithful {X Y : Geo k} (f : X ⟶ Y) (d : ℕ)
    [SmoothOfRelativeDimension d f.hom.left] [Surjective f.hom.left]
    (hc : ∀ x : GeomPoint Y, ConnectedSpace (geometricFiber f x)) :
    Nonempty (Functor.heartFunctor (pullback (Λ := Λ) f ⋙ shiftFunctor (Dbc Λ X) (d : ℤ))
      (perverseTStructure Λ Y) (perverseTStructure Λ X)).FullyFaithful := sorry
lemma finite_perverse_tExact {X Y : Geo k} (f : X ⟶ Y) [IsFinite f.hom.left] :
    Functor.IsTExact (pushforward (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) ∧
    Functor.IsTExact (lowerShriek (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) := sorry
/-- EDC.5/generic-degree-concentration. -/
theorem generic_degree_concentration {X : Geo k} (P : PerverseSheaf Λ X) (e : ℕ)
    (hsupp : ∀ (x : GeomPoint X) (i : ℤ), ¬ IsZero (stalkCohomology x i P.obj) →
      ∀ d : ℕ, x.dim = d → d ≤ e) (x : GeomPoint X) (hx : x.dim = e) (i : ℤ) (hi : i ≠ -(e : ℤ)) :
    IsZero (stalkCohomology x i P.obj) := sorry
/-- Fibre-dimension locus and the standard semismall/small numerical inequalities. -/
def fiberDimensionLocus {X Y : Geo k} (f : X ⟶ Y) (r : ℕ) : Set Y.space :=
  { y | ∃ x : GeomPoint Y, x.pt.base (IsLocalRing.closedPoint x.Ω) = y ∧
    (r : WithBot ℕ∞) ≤ topologicalKrullDim (geometricFiber f x) }
def IsSemismall {X Y : Geo k} (f : X ⟶ Y) (n : ℕ) : Prop :=
  ∀ r : ℕ, topologicalKrullDim (closure (fiberDimensionLocus f r)) + 2 * r ≤ n
def IsSmall {X Y : Geo k} (f : X ⟶ Y) (n : ℕ) : Prop :=
  IsSemismall f n ∧ ∀ r : ℕ, 0 < r →
    topologicalKrullDim (closure (fiberDimensionLocus f r)) + 2 * r < n
/-- EDC.5/semismall-pushforward-perverse, for a smooth source and a field. -/
theorem semismall_pushforward_perverse [Field Λ] {X Y : Geo k} (f : X ⟶ Y)
    [IsProper f.hom.left] (n : ℕ) [SmoothOfRelativeDimension n X.structural] (h : IsSemismall f n) :
    (perverseTStructure Λ Y).heart ((pushforward f).obj ((constant X)⟦(n : ℤ)⟧)) := sorry
/-- EDC.5/small-map-intersection-complex, with its actual smooth finite-etale open. -/
theorem small_map_intersectionComplex [Field Λ] {X Y V U : Geo k} (f : X ⟶ Y)
    [IsProper f.hom.left] (n : ℕ) [SmoothOfRelativeDimension n X.structural] (h : IsSmall f n)
    (j : U ⟶ Y) [IsOpenImmersion j.hom.left] (hj : DenseRange j.hom.left.base)
    [SmoothOfRelativeDimension n U.structural] (j' : V ⟶ X) [IsOpenImmersion j'.hom.left]
    (g : V ⟶ U) [IsFinite g.hom.left] [Etale g.hom.left] (hsq : j' ≫ f = g ≫ j)
    (hcart : IsPullback j' g f j) (L : Lisse Λ U)
    (hL : Nonempty (lisseComplex.obj L ≅ (pushforward g).obj (constant V))) :
    Nonempty ((pushforward f).obj ((constant X)⟦(n : ℤ)⟧) ≅ (intersectionComplex j hj n L).obj) := sorry
end Perverse

section IntegralPerverse
variable {O : Type u} [CommRing O] [D : IntegralDatum (k := k) O]
  [PerverseContext (k := k) O]
/-- The coefficient action is the scalar action on the actual linear heart. -/
instance perverseIntegralLinear (X : Geo k) : Linear O (PerverseSheaf O X) := sorry
def perverseScalar {X : Geo k} (r : O) (P : PerverseSheaf O X) : P ⟶ P := r • 𝟙 P
lemma perverseScalar_one {X : Geo k} (P : PerverseSheaf O X) : perverseScalar 1 P = 𝟙 P := sorry
lemma perverseScalar_mul {X : Geo k} (r s : O) (P : PerverseSheaf O X) :
    perverseScalar (r * s) P = perverseScalar r P ≫ perverseScalar s P := sorry
def IsPerverseTorsion {X : Geo k} (P : PerverseSheaf O X) : Prop :=
  ∃ n : ℕ, 0 < n ∧ perverseScalar (D.uniformizer ^ n) P = 0
def IsPerverseTorsionFree {X : Geo k} (P : PerverseSheaf O X) : Prop :=
  Mono (perverseScalar D.uniformizer P)
def perverseIntegral (X : Geo k) : TStructure (Dbc O X) := perverseTStructure O X
/-- EDC.5/integral-perverse-torsion-pair: the actual tilt, BBD §3.3, pp. 98–100. -/
def perversePlus (X : Geo k) : TStructure (Dbc O X) := sorry
lemma perverse_torsion_pair {X : Geo k} (P : PerverseSheaf O X) :
    (∃ (T F : PerverseSheaf O X) (f : T ⟶ P) (g : P ⟶ F) (hfg : f ≫ g = 0),
      IsPerverseTorsion T ∧ IsPerverseTorsionFree F ∧ Mono f ∧ Epi g ∧ (ShortComplex.mk f g hfg).Exact) ∧
    (∀ (T F : PerverseSheaf O X), IsPerverseTorsion T → IsPerverseTorsionFree F →
      ∀ a : T ⟶ F, a = 0) := sorry
lemma perversePlus_le_iff {X : Geo k} (K : Dbc O X) :
    (perversePlus X).IsLE K 0 ↔ (perverseIntegral X).IsLE K 1 ∧
      IsPerverseTorsion ((perverseCohomology 1).obj K) := sorry
lemma perversePlus_ge_iff {X : Geo k} (K : Dbc O X) :
    (perversePlus X).IsGE K 0 ↔ (perverseIntegral X).IsGE K 0 ∧
      IsPerverseTorsionFree ((perverseCohomology 0).obj K) := sorry
lemma verdierDual_perverse_le_iff {X : Geo k} (K : Dbc O X) :
    (perverseIntegral X).IsLE K 0 ↔ (perversePlus X).IsGE ((verdierDual X).obj (Opposite.op K)) 0 := sorry
lemma verdierDual_perversePlus_le_iff {X : Geo k} (K : Dbc O X) :
    (perversePlus X).IsLE K 0 ↔ (perverseIntegral X).IsGE ((verdierDual X).obj (Opposite.op K)) 0 := sorry
lemma perverse_le_perversePlus_le {X : Geo k} (K : Dbc O X) :
    ((perverseIntegral X).IsLE K 0 → (perversePlus X).IsLE K 0) ∧
    ((perversePlus X).IsLE K 0 → (perverseIntegral X).IsLE K 1) := sorry
/-- EDC.6 coefficient extension, derived rather than underived. -/
def extendCoefficients {E : Type u} [CommRing E] (a : O →+* E) (X : Geo k) : Dbc O X ⥤ Dbc E X := sorry
lemma rationalize_tExact [PerverseContext (k := k) (FractionRing O)] (X : Geo k) :
    Functor.IsTExact (extendCoefficients (algebraMap O (FractionRing O)) X)
      (perverseIntegral X) (perverseTStructure (FractionRing O) X) ∧
    Functor.IsTExact (extendCoefficients (algebraMap O (FractionRing O)) X)
      (perversePlus X) (perverseTStructure (FractionRing O) X) := sorry
/-- Point modules realized in ordinary degree zero. -/
def pointModule (M : FiniteModules O) : Dbc O (basePoint k) := sorry
def residuePoint : Dbc O (basePoint k) :=
  pointModule ⟨ModuleCat.of O (O ⧸ IsLocalRing.maximalIdeal O), by sorry⟩
/-- Test `TauCeti.EtaleDuality.perversePlus_point_torsion`. -/
example [IsSepClosed k] : (perversePlus (basePoint k)).heart ((residuePoint (O := O))⟦(-1 : ℤ)⟧) ∧
    ¬ (perversePlus (basePoint k)).heart (residuePoint (O := O)) := sorry
/-- Test `TauCeti.EtaleDuality.perversePlus_point_free`. -/
example [IsSepClosed k] : (perverseIntegral (O := O) (basePoint k)).heart (constant _) ∧
    (perversePlus (O := O) (basePoint k)).heart (constant _) := sorry
/-- Test `TauCeti.EtaleDuality.perversePlus_empty`. -/
example {X : Geo k} [IsEmpty X.space] : perverseIntegral (O := O) X = perversePlus X := sorry
/-- Test `TauCeti.EtaleDuality.not_perverse_eq_perversePlus`. -/
example [IsSepClosed k] : perverseIntegral (O := O) (basePoint k) ≠ perversePlus (basePoint k) := sorry
end IntegralPerverse

/-! EDC.4. Geometry data are supplied by SF.0/SF.5; cohomological operations by EDC.0–3.
P(V) parametrizes lines in V. Consequently the Chern relation has plus signs. -/
section GeometryData
/-- SF.5 algebraic vector bundles and line bundles, not coefficient local systems. -/
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
/-- SF.0 projective bundles with the lines convention and tautological O(1). -/
def projectiveBundle {X : Geo k} (V : VectorBundle X) : Geo k := sorry
def bundleProjection {X : Geo k} (V : VectorBundle X) : projectiveBundle V ⟶ X := sorry
def tautologicalLine {X : Geo k} (V : VectorBundle X) : LineBundle (projectiveBundle V) := sorry
/-- SF.0 blow-up, exceptional divisor, and the tautological line on P(N). -/
def blowup {Z X : Geo k} (i : Z ⟶ X) : Geo k := sorry
def blowupProjection {Z X : Geo k} (i : Z ⟶ X) : blowup i ⟶ X := sorry
def exceptionalDivisor {Z X : Geo k} (i : Z ⟶ X) : Geo k := sorry
def exceptionalInclusion {Z X : Geo k} (i : Z ⟶ X) : exceptionalDivisor i ⟶ blowup i := sorry
def exceptionalProjection {Z X : Geo k} (i : Z ⟶ X) : exceptionalDivisor i ⟶ Z := sorry
def normalBundle {Z X : Geo k} (i : Z ⟶ X) : VectorBundle Z := sorry
/-- EDC.3/cycle-class-map. -/
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
/-- EDC.4/affine-vanishing-hypercohomology: the full support-sensitive bound. -/
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
/-- EDC.4/weak-lefschetz; no smoothness of the section is assumed. -/
theorem weak_lefschetz {X : Geo k} (D : HyperplaneSection (k := k) X)
    [IsProper X.structural] (n : ℕ) [SmoothOfRelativeDimension (n + 1) X.structural]
    (hproper : Set.range D.toAmpleDivisor.i.hom.left.base ≠ Set.univ)
    (hcoeff : DualityCoefficients (k := k) (Λ := Λ)) (L : Lisse Λ X) (q : ℤ) :
    (q < n → IsIso (restriction D.toAmpleDivisor.i q (lisseComplex.obj L))) ∧
    (q = n → Mono (restriction D.toAmpleDivisor.i q (lisseComplex.obj L))) := sorry
/-- EDC.3 Gysin with lisse coefficients; the Tate twist is essential. -/
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
/-- EDC.3: the Kummer first Chern class and cup product, represented as a derived
morphism. The source is Lambda(-j)[-2j], so the Tate and shift conventions are fixed. -/
def derivedChernColumn {X : Geo k} (L : LineBundle X) (j : ℕ) :
    ((twist X (-(j : ℤ))).obj (constant (Λ := Λ) X))⟦(-2 * (j : ℤ))⟧ ⟶ constant X := sorry
/-- SF.2 canonical pullback/constant/Tate/shift compatibility. -/
def pullbackTwistedConstant {X Y : Geo k} (f : X ⟶ Y) (a b : ℤ) :
    (pullback (Λ := Λ) f).obj (((twist Y a).obj (constant Y))⟦b⟧) ≅
      ((twist X a).obj (constant X))⟦b⟧ := sorry
def pullbackPushforwardAdjunction {X Y : Geo k} (f : X ⟶ Y) :
    pullback (Λ := Λ) f ⊣ pushforward f := sorry
/-- EDC.3 action of the same class on arbitrary K, via tensor product. -/
def derivedChernAction {X : Geo k} (L : LineBundle X) (K : Dbc Λ X) :
    K ⟶ ((twist X 1).obj K)⟦(2 : ℤ)⟧ := sorry
/-- The Chern morphism, imported from EDC.3/projective-bundle-freeness. -/
def bundleColumn {X : Geo k} (V : VectorBundle X) (j : ℕ) :
    ((twist X (-(j : ℤ))).obj (constant (Λ := Λ) X))⟦(-2 * (j : ℤ))⟧ ⟶
      (pushforward (bundleProjection V)).obj (constant (projectiveBundle V)) :=
  (pullbackPushforwardAdjunction (bundleProjection V)).homEquiv _ _
    ((pullbackTwistedConstant (bundleProjection V) (-(j : ℤ)) (-2 * (j : ℤ))).hom ≫
      derivedChernColumn (tautologicalLine V) j)
instance (X : Geo k) : HasFiniteBiproducts (Dbc Λ X) := sorry
instance : HasFiniteBiproducts (ModuleCat.{u} Λ) := sorry
/-- EDC.4/projective-bundle-decomposition: all Chern columns, not an unspecified equivalence. -/
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
/-- EDC.3 Gysin for a smooth proper map of relative dimension m. -/
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
/-- EDC.4/blowup-formula: the complete split in every degree. -/
theorem blowup_formula {Z X : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (d c : ℕ) (hc : 2 ≤ c) (hcd : c ≤ d) [SmoothOfRelativeDimension d X.structural]
    [SmoothOfRelativeDimension (d - c) Z.structural] (q : ℤ) :
    IsIso (blowupCohomologyMap (Λ := Λ) i c q) := sorry
/-- EDC.3 degree-zero proper pushforward; the first inverse component. -/
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
/-- SF.2 global derived sections followed by ordinary module cohomology. -/
def globalCohomologyFunctor (X : Geo k) (q : ℤ) : Dbc Λ X ⥤ ModuleCat.{u} Λ where
  obj := cohomology q
  map := by sorry
  map_id := by sorry
  map_comp := by sorry
/-- SF.2 proper direct-image, twist and shift identifications. -/
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
/-- SF.0/SF.5: projective zero scheme of the homogeneous equations. -/
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
/-- EDC.2/EDC.3 actual cup-product trace pairing in complementary cohomological
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
/-- Galois descent data from EDC.0/EDC.3 include equivariance of restriction, Gysin and twists. -/
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
/-- EDC.0/EDC.3 cohomology with supports in a closed subset. -/
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
/-- BBD 4.3.1 with the finite uniformizer filtration also gives finite length for
DVR-quotient coefficients; the free integral category is deliberately excluded. -/
lemma perverseSheaf_quotient_finite_length (n : ℕ)
    [PerverseContext (k := k) (levelRing (k := k) (O := O) n)]
    {X : Geo k} (P : PerverseSheaf (levelRing (k := k) (O := O) n) X) :
    IsArtinianObject P ∧ IsNoetherianObject P := sorry
/-- SF.2 finite-level derived coefficient reduction, including its canonical associator. -/
def levelReduction (X : Geo k) (n m : ℕ) (h : m ≤ n) :
    Dbc (levelRing (k := k) (O := O) n) X ⥤ Dbc (levelRing (k := k) (O := O) m) X := sorry
def levelReductionComp (X : Geo k) (n m l : ℕ) (h : m ≤ n) (h' : l ≤ m) :
    levelReduction (O := O) X n m h ⋙ levelReduction X m l h' ≅
    levelReduction X n l (h'.trans h) := sorry
def levelReductionSelf (X : Geo k) (n : ℕ) : levelReduction (O := O) X n n le_rfl ≅ 𝟭 _ := sorry
structure AdicSystem (X : Geo k) where
  obj : (n : ℕ) → Dbc (levelRing (k := k) (O := O) n) X
  reduce : ∀ n m (h : m ≤ n), (levelReduction X n m h).obj (obj n) ≅ obj m
  identity : ∀ n, (reduce n n le_rfl).hom = (levelReductionSelf X n).hom.app (obj n)
  coherence : ∀ n m l (h : m ≤ n) (h' : l ≤ m),
    (levelReduction X m l h').map (reduce n m h).hom ≫ (reduce m l h').hom =
      (levelReductionComp X n m l h h').hom.app (obj n) ≫ (reduce n l (h'.trans h)).hom
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
/-- The same finite stratification and both ordinary and Tor bounds work at every level. -/
def AdicSystem.IsNormalized {X : Geo k} (K : AdicSystem (O := O) X) : Prop :=
  ∃ (a b c d : ℤ) (T : AlgebraicStratification X),
    (∀ n, (standardTStructure _ X).IsGE (K.obj n) a ∧
      (standardTStructure _ X).IsLE (K.obj n) b) ∧
    (∀ n (M : Dbc (levelRing (k := k) (O := O) n) X), (standardTStructure _ X).heart M →
      (standardTStructure _ X).IsGE (derivedTensor (K.obj n) M) c ∧
      (standardTStructure _ X).IsLE (derivedTensor (K.obj n) M) d) ∧
    ∀ n i s, ∃ L : Lisse (levelRing (k := k) (O := O) n) (T.strata s),
      Nonempty ((pullback (T.inclusion s)).obj (ordinaryCohomologyObject i (K.obj n)) ≅ lisseComplex.obj L)
/-- Morphisms are coherent levelwise maps; SF.2 supplies their category structure. -/
instance (X : Geo k) : Category.{u} (AdicSystem (O := O) X) := sorry
abbrev NormalizedSystem (X : Geo k) := ObjectProperty.FullSubcategory
  (AdicSystem.IsNormalized (k := k) (O := O) (X := X))
/-- Bhatt–Scholze's constructible pro-étale carrier, supplied by SF.2/EllAdicRealization. -/
def ProetaleCons (O : Type u) [CommRing O] (X : Geo k) : Type (u + 1) := sorry
instance (X : Geo k) : Category.{u} (ProetaleCons O X) := sorry
def classical_proetale_equivalence (X : Geo k) : Dbc O X ≌ ProetaleCons O X := sorry
def normalized_system_equivalence (X : Geo k) : Dbc O X ≌ NormalizedSystem (O := O) X := sorry
def integralReduction (X : Geo k) (n : ℕ) : Dbc O X ⥤ Dbc (levelRing (k := k) (O := O) n) X := sorry
lemma normalized_system_reduction (X : Geo k) (K : Dbc O X) (n : ℕ) :
    Nonempty ((((normalized_system_equivalence (O := O) X).functor.obj K).obj.obj n) ≅
      (integralReduction X n).obj K) := sorry
lemma normalized_system_uniform_bounds {X : Geo k} (K : NormalizedSystem (O := O) X) :
    ∃ a b : ℤ, ∀ n, (standardTStructure _ X).IsGE (K.obj.obj n) a ∧
      (standardTStructure _ X).IsLE (K.obj.obj n) b := sorry
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
      (levelReductionComp X n m l h h').hom.app (K.obj.obj n) ≫
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
/-- SF.2 coefficient-triangle map on twisted constant cohomology, using O → O/λ^(n+1). -/
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
/-- SF.2 derived extension of scalars, with its usual tensor product realization. -/
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
def analyticTensor {X : Geo ComplexBase} : AnalyticDbc Λ X → AnalyticDbc Λ X → AnalyticDbc Λ X := sorry
def analyticRHom {X : Geo ComplexBase} : AnalyticDbc Λ X → AnalyticDbc Λ X → AnalyticDbc Λ X := sorry
def analyticCohomology {X : Geo ComplexBase} (q : ℤ) (K : AnalyticDbc Λ X) : ModuleCat.{u} Λ := sorry
def analyticCompactCohomology {X : Geo ComplexBase} (q : ℤ) (K : AnalyticDbc Λ X) : ModuleCat.{u} Λ := sorry
def analyticComparison (X : Geo ComplexBase) : Dbc Λ X ⥤ AnalyticDbc Λ X := sorry
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
    {X : Geo ComplexBase} (K L : Dbc Λ X) :
    Nonempty ((analyticComparison X).obj (derivedTensor K L) ≅
      analyticTensor ((analyticComparison X).obj K) ((analyticComparison X).obj L)) := sorry
lemma analytic_RHom_comparison [Coefficients (k := ComplexBase) Λ]
    {X : Geo ComplexBase} (K L : Dbc Λ X) :
    Nonempty ((analyticComparison X).obj (derivedInternalHom K L) ≅
      analyticRHom ((analyticComparison X).obj K) ((analyticComparison X).obj L)) := sorry
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
/-- Classical analytification and its ordinary cohomology sheaves are supplied by the analytic comparison owner. -/
def analytification (X : Geo ComplexBase) : TopCat.{u} := sorry
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
abbrev SchemeEtaleDerived (Λ : Type u) [CommRing Λ] (X : Geo k) :=
  DerivedCategory (Sheaf X.space.smallEtaleTopology (ModuleCat.{u} Λ))
def diamondPullback (X : Geo k) : SchemeEtaleDerived Λ X ⥤ DiamondDerived Λ X := sorry
def diamondRightAdjoint (X : Geo k) : DiamondDerived Λ X ⥤ SchemeEtaleDerived Λ X := sorry
def diamondAdjunction (X : Geo k) : diamondPullback (Λ := Λ) X ⊣ diamondRightAdjoint X := sorry
def diamondUpperShriek {X Y : Geo k} (f : X ⟶ Y) : DiamondDerived Λ Y ⥤ DiamondDerived Λ X := sorry
def diamondLowerShriek {X Y : Geo k} (f : X ⟶ Y) : DiamondDerived Λ X ⥤ DiamondDerived Λ Y := sorry
/-- EDC.0/EDC.1 unbounded étale six-operation interfaces. -/
def schemeEtaleUpperShriek {X Y : Geo k} (f : X ⟶ Y) : SchemeEtaleDerived Λ Y ⥤ SchemeEtaleDerived Λ X := sorry
def schemeEtaleRHom {X : Geo k} : SchemeEtaleDerived Λ X → SchemeEtaleDerived Λ X → SchemeEtaleDerived Λ X := sorry
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
/-- EDC.0/SF.2 derived global sections followed by ordinary cohomology. -/
def etaleHypercohomology {X : Geo k} (q : ℤ) (K : SchemeEtaleDerived Λ X) : ModuleCat.{u} Λ := sorry
/-- EDC.1 dualizing H0; its input need not be placed in Dbc. -/
def dualizingCohomology (X : Geo k) : ModuleCat.{u} Λ :=
  etaleHypercohomology 0 (schemeEtaleDualizing X)
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

/-! EDC.7: imported DWP.8 weight predicates are unpacked on actual closed-point
Frobenius modules. This scaffolding is an imported interface, not a second weight roadmap. -/
section Weights
variable [Finite k] {E : Type u} [Field E] [CharZero E] [RationalDatum (k := k) E]
  [PerverseContext (k := k) E]
abbrev ClosedPoint (X : Geo k) := {x : X.space // IsClosed ({x} : Set X.space)}
instance perverseFiniteBiproducts (X : Geo k) : HasFiniteBiproducts (PerverseSheaf E X) := sorry
abbrev OrdinarySheaf (X : Geo k) := (standardTStructure E X).heart.FullSubcategory
/-- DWP.8/SF.2 supply the actual geometric stalk and its geometric Frobenius. -/
def weightStalk {X : Geo k} (K : Dbc E X) (x : ClosedPoint X) (i : ℤ) :
    ModuleCat.{u} (AlgebraicClosure E) := sorry
def weightStalkFrobenius {X : Geo k} (K : Dbc E X) (x : ClosedPoint X) (i : ℤ) :
    weightStalk K x i ≃ₗ[AlgebraicClosure E] weightStalk K x i := sorry
/-- DWP.8's chosen coefficient identification, fixed for the iota-weight convention. -/
def coefficientIota (E : Type u) [Field E] [RationalDatum (k := k) E] :
    AlgebraicClosure E ≃+* ℂ := sorry
/-- Eigenvalue absolute values use the fixed iota, as in the packet's BBD convention. -/
def IsPunctuallyPure {X : Geo k} (K : Dbc E X) (w : ℤ) : Prop :=
  ∀ (x : ClosedPoint X) (α : AlgebraicClosure E),
    Module.End.HasEigenvalue (weightStalkFrobenius K x 0).toLinearMap α →
    ‖coefficientIota (k := k) E α‖ =
      Real.rpow (Nat.card (X.space.residueField x.val)) ((w : ℝ) / 2)
/-- A finite filtration in the ordinary heart; its successive quotients are actual cokernels. -/
structure OrdinaryMixedFiltration {X : Geo k} (M : OrdinarySheaf (E := E) X) where
  size : ℕ
  flag : Fin (size + 1) → Subobject M
  initial : flag 0 = ⊥
  final : flag ⟨size, by omega⟩ = ⊤
  increasing : Monotone flag
  weights : Fin size → ℤ
  pure : ∀ a : Fin size, IsPunctuallyPure
    (cokernel (Subobject.ofLE (flag ⟨a, by omega⟩) (flag ⟨a + 1, by omega⟩)
      (increasing (by sorry))) : OrdinarySheaf (E := E) X).obj (weights a)
def IsMixed {X : Geo k} (K : Dbc E X) : Prop :=
  ∀ i : ℤ, Nonempty (OrdinaryMixedFiltration ((TStructure.homology (standardTStructure E X) i).obj K))
def WeightLE {X : Geo k} (K : Dbc E X) (w : ℤ) : Prop :=
  IsMixed K ∧ ∀ (x : ClosedPoint X) (i : ℤ) (α : AlgebraicClosure E),
    Module.End.HasEigenvalue (weightStalkFrobenius K x i).toLinearMap α →
    ‖coefficientIota (k := k) E α‖ ≤
      Real.rpow (Nat.card (X.space.residueField x.val)) (((w + i : ℤ) : ℝ) / 2)
def WeightGE {X : Geo k} (K : Dbc E X) (w : ℤ) : Prop :=
  WeightLE ((verdierDual X).obj (Opposite.op K)) (-w)
def PureWeight {X : Geo k} (K : Dbc E X) (w : ℤ) : Prop := WeightLE K w ∧ WeightGE K w
/-- SF.0 base change along Spec(kbar) → Spec(k), not an arbitrary geometric scheme. -/
def geometricBaseChange (X : Geo k) : Geo (AlgebraicClosure k) := sorry
lemma geometricBaseChange_native (X : Geo k) : Nonempty ((geometricBaseChange X).space ≅
    Limits.pullback X.structural (Spec.map (CommRingCat.ofHom (algebraMap k (AlgebraicClosure k))))) := sorry
def geometricPullback (X : Geo k) : Dbc E X ⥤ Dbc E (geometricBaseChange X) := sorry
variable [PerverseContext (k := AlgebraicClosure k) E]
def geometricPerverse (X : Geo k) : PerverseSheaf E X ⥤ PerverseSheaf E (geometricBaseChange X) := sorry
/-- BBD 5.4.1: both inequalities, in every perverse degree. -/
theorem weights_perverse_criterion {X : Geo k} (K : Dbc E X) (w : ℤ) :
    (WeightLE K w ↔ ∀ i : ℤ, WeightLE ((perverseCohomology (Λ := E) (X := X) i).obj K).obj (w + i)) ∧
    (WeightGE K w ↔ ∀ i : ℤ, WeightGE ((perverseCohomology (Λ := E) (X := X) i).obj K).obj (w + i)) := sorry
lemma perverseCohom_mixed {X : Geo k} (K : Dbc E X) (h : IsMixed K) (i : ℤ) :
    IsMixed ((perverseCohomology (Λ := E) (X := X) i).obj K).obj := sorry
lemma weights_shift {X : Geo k} (K : Dbc E X) (w n : ℤ) :
    PureWeight K w → PureWeight (K⟦n⟧) (w + n) := sorry
lemma weights_twist {X : Geo k} (K : Dbc E X) (w n : ℤ) :
    PureWeight K w → PureWeight ((twist X n).obj K) (w - 2 * n) := sorry
lemma weight_lowerShriek {X Y : Geo k} (f : X ⟶ Y) (K : Dbc E X) (w : ℤ) :
    WeightLE K w → WeightLE ((lowerShriek f).obj K) w := sorry
lemma weight_pushforward {X Y : Geo k} (f : X ⟶ Y) (K : Dbc E X) (w : ℤ) :
    WeightGE K w → WeightGE ((pushforward f).obj K) w := sorry
lemma weight_pullback {X Y : Geo k} (f : X ⟶ Y) (K : Dbc E Y) (w : ℤ) :
    WeightLE K w → WeightLE ((pullback f).obj K) w := sorry
lemma weight_upperShriek {X Y : Geo k} (f : X ⟶ Y) (K : Dbc E Y) (w : ℤ) :
    WeightGE K w → WeightGE ((upperShriek f).obj K) w := sorry
/-- Derived Exts are the actual morphisms into shifts. -/
abbrev DerivedExt {X : Geo k} (K L : Dbc E X) (i : ℤ) := K ⟶ L⟦i⟧
def geometricExtFrobenius {X : Geo k} (K L : Dbc E X) (i : ℤ) :
    (((geometricPullback X).obj K) ⟶ ((geometricPullback X).obj L)⟦i⟧) ≃ₗ[E]
      (((geometricPullback X).obj K) ⟶ ((geometricPullback X).obj L)⟦i⟧) := sorry
lemma ext_strict_weights {X : Geo k} (P Q : PerverseSheaf E X) (w : ℤ)
    (hP : WeightLE P.obj w) (hQ : WeightGE Q.obj (w + 1)) :
    (∀ f : P ⟶ Q, f = 0) ∧ (∀ f : DerivedExt P.obj Q.obj 1, f = 0) := sorry
lemma arithmetic_ext_ge_two {X : Geo k} (K L : Dbc E X) (w i : ℤ)
    (hK : WeightLE K w) (hL : WeightGE L w) (hi : 2 ≤ i) :
    ∀ f : DerivedExt K L i, f = 0 := sorry
/-- BBD 5.1.15(iii) kills only Frobenius invariants of geometric positive Ext. -/
lemma geometric_ext_invariants_zero {X : Geo k} (K L : Dbc E X) (w i : ℤ)
    (hK : WeightLE K w) (hL : WeightGE L w) (hi : 0 < i)
    (f : (geometricPullback X).obj K ⟶ ((geometricPullback X).obj L)⟦i⟧)
    (hf : geometricExtFrobenius K L i f = f) : f = 0 := sorry
/-- Unique finite increasing weight filtration with strict functoriality. -/
structure PerverseWeightFiltration {X : Geo k} (P : PerverseSheaf E X) where
  flag : ℤ → Subobject P
  increasing : Monotone flag
  finite : ∃ a b : ℤ, (∀ i, i < a → flag i = ⊥) ∧ (∀ i, b ≤ i → flag i = ⊤)
  pure : ∀ i : ℤ, PureWeight
    (cokernel (Subobject.ofLE (flag (i - 1)) (flag i) (increasing (by omega))) : PerverseSheaf E X).obj i
instance perverseBinaryBiproducts (X : Geo k) : HasBinaryBiproducts (PerverseSheaf E X) :=
  hasBinaryBiproducts_of_finite_biproducts (PerverseSheaf E X)
def weightFiltration {X : Geo k} (P : PerverseSheaf E X) (hP : IsMixed P.obj) :
    PerverseWeightFiltration P := sorry
lemma weightFiltration_unique {X : Geo k} (P : PerverseSheaf E X) (W W' : PerverseWeightFiltration P) :
    W.flag = W'.flag := sorry
/-- Image(f on W_i P) = image(f) intersect W_i Q, as subobjects of Q. -/
lemma weightFiltration_strict {X : Geo k} (P Q : PerverseSheaf E X)
    (hP : IsMixed P.obj) (hQ : IsMixed Q.obj) (f : P ⟶ Q) (i : ℤ) :
    Subobject.mk (image.ι (((weightFiltration P hP).flag i).arrow ≫ f)) =
      Subobject.mk (image.ι f) ⊓ (weightFiltration Q hQ).flag i := sorry
lemma weightFiltration_pure {X : Geo k} (P : PerverseSheaf E X) (w : ℤ) (hP : PureWeight P.obj w) :
    ∃ W : PerverseWeightFiltration P, (∀ i, i < w → W.flag i = ⊥) ∧
      (∀ i, w ≤ i → W.flag i = ⊤) := sorry
/-- Test `TauCeti.EtaleDuality.weight_filtration_zero`. -/
example {X : Geo k} (P : PerverseSheaf E X) (h : IsZero P) (W : PerverseWeightFiltration P) :
    ∀ i, W.flag i = ⊥ := sorry
/-- Test `TauCeti.EtaleDuality.weight_filtration_two_weights`: both actual graded pieces are retained. -/
example {X : Geo k} (P Q : PerverseSheaf E X) (a b : ℤ) (hab : a < b)
    (hP : PureWeight P.obj a) (hQ : PureWeight Q.obj b) :
    ∃ W : PerverseWeightFiltration (P ⊞ Q), W.flag a = Subobject.mk (biprod.inl : P ⟶ P ⊞ Q) := sorry
/-- Test `TauCeti.EtaleDuality.pure_arithmetic_unipotent_not_semisimple`: the rank-two point representation
with geometric Frobenius [1 1; 0 1] is pure but its arithmetic invariant line has no complement. -/
example (φ : (Fin 2 → E) ≃ₗ[E] (Fin 2 → E))
    (hφ : ∀ v, φ v = ![v 0 + v 1, v 1]) :
    ¬ ∃ W : Submodule E (Fin 2 → E),
      IsCompl (Submodule.span E {![1, 0]}) W ∧ ∀ v ∈ W, φ v ∈ W := sorry
lemma intermediateExtension_pure {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (P : PerverseSheaf E U) (w : ℤ) (hP : PureWeight P.obj w) :
    PureWeight ((intermediateExtension j).obj P).obj w := sorry
lemma IC_pure {U X : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hdense : DenseRange j.hom.left.base) (d : ℕ) [SmoothOfRelativeDimension d U.structural]
    (L : Lisse E U) (w : ℤ) (hL : IsPunctuallyPure (lisseComplex.obj L) w) :
    PureWeight (intersectionComplex j hdense d L).obj (w + d) := sorry
/-- Semisimplicity is a simultaneous finite direct-sum statement. -/
def PerverseSemisimple {X : Geo (AlgebraicClosure k)} (P : PerverseSheaf E X) : Prop :=
  ∃ (n : ℕ) (S : Fin n → PerverseSheaf E X), (∀ a, Simple (S a)) ∧ Nonempty (P ≅ ⨁ S)
lemma geometric_semisimplicity {X : Geo k} (P : PerverseSheaf E X) (w : ℤ) (h : PureWeight P.obj w) :
    PerverseSemisimple ((geometricPerverse X).obj P) := sorry
/-- One finite sum for the entire complex, with all degrees outside the sum zero. -/
def PerverseDecomposition {X : Geo (AlgebraicClosure k)} (K : Dbc E X) : Prop :=
  ∃ S : Finset ℤ, (∀ i : ℤ, i ∉ S → IsZero ((perverseCohomology (Λ := E) (X := X) i).obj K)) ∧
    Nonempty (K ≅ ⨁ (fun i : S => ((perverseCohomology (Λ := E) (X := X) i).obj K).obj⟦(-i.val : ℤ)⟧)) ∧
    ∀ i : ℤ, PerverseSemisimple ((perverseCohomology (Λ := E) (X := X) i).obj K)
theorem pure_complex_decomposition {X : Geo k} (K : Dbc E X) (w : ℤ) (h : PureWeight K w) :
    PerverseDecomposition ((geometricPullback X).obj K) := sorry
lemma proper_image_pure {X Y : Geo k} (f : X ⟶ Y) [IsProper f.hom.left]
    (K : Dbc E X) (w : ℤ) (h : PureWeight K w) : PureWeight ((pushforward f).obj K) w := sorry
theorem proper_direct_image_decomposition {X Y : Geo k} (f : X ⟶ Y) [IsProper f.hom.left]
    (K : Dbc E X) (w : ℤ) (h : PureWeight K w) :
    PerverseDecomposition ((geometricPullback Y).obj ((pushforward f).obj K)) := sorry
end Weights

/-! Categorical Lefschetz decomposition is in the abelian perverse heart.
DWP.9 supplies vector-space Lefschetz algebra, not this categorical construction. -/
section CategoricalLefschetz
variable {E : Type u} [Field E] [PerverseContext (k := k) E]
instance perverseAllFiniteBiproducts (X : Geo k) : HasFiniteBiproducts (PerverseSheaf E X) := sorry
def perverseTwist (X : Geo k) (n : ℤ) : PerverseSheaf E X ⥤ PerverseSheaf E X := sorry
def perverseTwistZero (X : Geo k) : perverseTwist (E := E) X 0 ≅ 𝟭 _ := sorry
def perverseTwistAdd (X : Geo k) (a b : ℤ) :
    perverseTwist (E := E) X a ⋙ perverseTwist X b ≅ perverseTwist X (a + b) := sorry
structure GradedTateLefschetz (X : Geo k) where
  degree : ℤ → PerverseSheaf E X
  bounded : ∃ a b : ℤ, ∀ i, i < a ∨ b < i → IsZero (degree i)
  eta : ∀ i : ℤ, degree i ⟶ (perverseTwist X 1).obj (degree (i + 2))
/-- η^r, formed from eta and the canonical composition isomorphisms of Tate twists. -/
def GradedTateLefschetz.etaPower {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (r : ℕ) (i : ℤ) : L.degree i ⟶ (perverseTwist X r).obj (L.degree (i + 2 * r)) := sorry
lemma GradedTateLefschetz.etaPower_zero {X : Geo k} (L : GradedTateLefschetz (E := E) X) (i : ℤ) :
    L.etaPower 0 i = (perverseTwistZero X).inv.app (L.degree i) ≫
      (perverseTwist X 0).map (eqToHom (by congr 1; omega)) := sorry
lemma GradedTateLefschetz.etaPower_succ {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (r : ℕ) (i : ℤ) :
    L.etaPower (r + 1) i = L.eta i ≫ (perverseTwist X 1).map (L.etaPower r (i + 2)) ≫
      (perverseTwistAdd X r 1).hom.app (L.degree (i + 2 + 2 * r)) ≫
      (perverseTwist X (r + 1)).map (eqToHom (by congr 1; omega)) := sorry
/-- Hard Lefschetz is a condition on these actual iterates. -/
def GradedTateLefschetz.IsHardLefschetz {X : Geo k} (L : GradedTateLefschetz (E := E) X) : Prop :=
  ∀ r : ℕ, IsIso (L.etaPower r (-r))
def GradedTateLefschetz.primitive {X : Geo k} (L : GradedTateLefschetz (E := E) X) (r : ℕ) :
    PerverseSheaf E X := kernel (L.etaPower (r + 1) (-r))
def GradedTateLefschetz.primitiveColumn {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (r a : ℕ) : (perverseTwist X (-a)).obj (L.primitive r) ⟶ L.degree (-r + 2 * a) := sorry
/-- The column is η^a after inclusion of the primitive kernel and cancellation of twists. -/
lemma GradedTateLefschetz.primitiveColumn_formula {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (r a : ℕ) : L.primitiveColumn r a =
      (perverseTwist X (-a)).map (kernel.ι (L.etaPower (r + 1) (-r)) ≫ L.etaPower a (-r)) ≫
      (perverseTwistAdd X a (-a)).hom.app (L.degree (-r + 2 * a)) ≫
      eqToHom (by simp) ≫
      (perverseTwistZero X).hom.app (L.degree (-r + 2 * a)) := sorry
/-- All primitive strings in one degree, with a fixed finite support bound. -/
def primitiveDegreePairs (B : ℕ) (n : ℤ) : Finset (ℕ × ℕ) :=
  ((Finset.range (B + 1)).product (Finset.range (B + 1))).filter
    (fun s => s.2 ≤ s.1 ∧ -(s.1 : ℤ) + 2 * s.2 = n)
lemma primitiveDegreePairs_spec (B : ℕ) (n : ℤ) (s : ℕ × ℕ)
    (h : s ∈ primitiveDegreePairs B n) :
    s.2 ≤ s.1 ∧ s.1 ≤ B ∧ -(s.1 : ℤ) + 2 * s.2 = n := sorry
/-- All primitive pieces assemble simultaneously in each degree. The support is
all pairs 0 ≤ a ≤ r ≤ B in that degree, not an arbitrary subset of strings. -/
theorem categorical_primitive_decomposition {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (hL : L.IsHardLefschetz) : ∃ B : ℕ, ∀ n : ℤ,
      IsIso (biproduct.desc (fun s : primitiveDegreePairs B n =>
        L.primitiveColumn s.val.1 s.val.2 ≫
          eqToHom (by rw [(primitiveDegreePairs_spec B n s.val s.property).2.2]))) := sorry
lemma GradedTateLefschetz.primitive_kernel {X : Geo k} (L : GradedTateLefschetz (E := E) X) (r : ℕ) :
    kernel.ι (L.etaPower (r + 1) (-r)) ≫ L.etaPower (r + 1) (-r) = 0 := sorry
/-- Test `TauCeti.EtaleDuality.lefschetz_concentrated_zero`: degree zero is all primitive. -/
example {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (h : ∀ i : ℤ, i ≠ 0 → IsZero (L.degree i)) :
    L.IsHardLefschetz ∧ Nonempty (L.primitive 0 ≅ L.degree 0) := sorry
/-- Test `TauCeti.EtaleDuality.lefschetz_two_term_string`: an isomorphism between degrees −1 and +1. -/
example {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (h : ∀ i : ℤ, i ≠ -1 → i ≠ 1 → IsZero (L.degree i)) [IsIso (L.eta (-1))] :
    L.IsHardLefschetz ∧ Nonempty (L.primitive 1 ≅ L.degree (-1)) := sorry
/-- Test `TauCeti.EtaleDuality.lefschetz_zero_operator_fails`: the pairing symmetry alone does not supply η. -/
example {X : Geo k} (L : GradedTateLefschetz (E := E) X)
    (h : ¬ IsZero (L.degree (-1))) (hη : L.eta (-1) = 0) : ¬ L.IsHardLefschetz := sorry
/-- A chosen f-ample line bundle, with a closed embedding of a positive power into P(V). -/
structure RelativePolarization {X Y : Geo k} (f : X ⟶ Y) where
  line : LineBundle X
  power : ℕ
  positive : 0 < power
  bundle : VectorBundle Y
  embedding : X ⟶ projectiveBundle bundle
  closed : IsClosedImmersion embedding.hom.left
  over : embedding ≫ bundleProjection bundle = f
  ample : tensorPower line power = pullbackLine embedding (tautologicalLine bundle)
/-- SF.2 projection formula and shift commutation, used on the specified Chern morphism. -/
def relativeChernTarget {X Y : Geo k} (f : X ⟶ Y) (K : Dbc E X) :
    (pushforward f).obj (((twist X 1).obj K)⟦(2 : ℤ)⟧) ≅
      ((twist Y 1).obj ((pushforward f).obj K))⟦(2 : ℤ)⟧ := sorry
def perverseChernTarget {Y : Geo k} (K : Dbc E Y) (i : ℤ) :
    (perverseCohomology (Λ := E) (X := Y) i).obj (((twist Y 1).obj K)⟦(2 : ℤ)⟧) ≅
      (perverseTwist Y 1).obj ((perverseCohomology (Λ := E) (X := Y) (i + 2)).obj K) := sorry
/-- Rf_* of the actual cup-c1(L) morphism, followed by pH and the canonical twisted-shift identification. -/
def relativeChernPerverseMap {X Y : Geo k} (f : X ⟶ Y) (P : PerverseSheaf E X)
    (L : LineBundle X) (i : ℤ) :
    (perverseCohomology (Λ := E) (X := Y) i).obj ((pushforward f).obj P.obj) ⟶
      (perverseTwist Y 1).obj ((perverseCohomology (Λ := E) (X := Y) (i + 2)).obj ((pushforward f).obj P.obj)) :=
  (perverseCohomology i).map
    ((pushforward f).map (derivedChernAction L P.obj) ≫ (relativeChernTarget f P.obj).hom) ≫
      (perverseChernTarget ((pushforward f).obj P.obj) i).hom
def relativeLefschetzObject {X Y : Geo k} (f : X ⟶ Y) (P : PerverseSheaf E X)
    (η : RelativePolarization f) : GradedTateLefschetz (E := E) Y where
  degree i := (perverseCohomology (Λ := E) (X := Y) i).obj ((pushforward f).obj P.obj)
  bounded := by sorry
  eta i := relativeChernPerverseMap f P η.line i
variable [Finite k] [CharZero E] [RationalDatum (k := k) E]
  [PerverseContext (k := AlgebraicClosure k) E]
theorem relative_hard_lefschetz {X Y : Geo k} (f : X ⟶ Y) (η : RelativePolarization f)
    (P : PerverseSheaf E X) (w : ℤ) (hP : PureWeight P.obj w) :
    (relativeLefschetzObject f P η).IsHardLefschetz := sorry
lemma relative_hard_lefschetz_weights {X Y : Geo k} (f : X ⟶ Y) (η : RelativePolarization f)
    (P : PerverseSheaf E X) (w : ℤ) (hP : PureWeight P.obj w) (i : ℕ) :
    PureWeight ((perverseCohomology (Λ := E) (X := Y) (-i)).obj ((pushforward f).obj P.obj)).obj (w - i) ∧
    PureWeight ((twist Y i).obj ((perverseCohomology (Λ := E) (X := Y) i).obj ((pushforward f).obj P.obj)).obj) (w - i) := sorry
def primitivePairs (B : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range (B + 1)).product (Finset.range (B + 1))).filter (fun p => p.2 ≤ p.1)
/-- A single finite direct-sum isomorphism for all primitive strings after geometric base change. -/
theorem relative_primitive_decomposition {X Y : Geo k} (f : X ⟶ Y) (η : RelativePolarization f)
    (P : PerverseSheaf E X) (w : ℤ) (hP : PureWeight P.obj w) :
    ∃ B : ℕ, Nonempty ((geometricPullback Y).obj ((pushforward f).obj P.obj) ≅
      ⨁ (fun s : primitivePairs B =>
        ((perverseTwist (geometricBaseChange Y) (-(s.val.2 : ℤ))).obj
          ((geometricPerverse Y).obj ((relativeLefschetzObject f P η).primitive s.val.1))).obj⟦
            (s.val.1 : ℤ) - 2 * s.val.2⟧)) := sorry
/-- Test `TauCeti.EtaleDuality.geometric_ext_elliptic_nonzero`: ordinary geometric Ext^1 is allowed.
The two-dimensional H^1 of a genus-one curve detects a nonzero class, with no Frobenius invariance asserted. -/
example {X : Geo k} [IsProper X.structural] [SmoothOfRelativeDimension 1 X.structural]
    (hgenus : Module.finrank E (H E (geometricBaseChange X) 1 0) = 2) :
    ∃ f : (geometricPullback X).obj (constantPerverse (Λ := E) 1).obj ⟶
      ((geometricPullback X).obj (constantPerverse (Λ := E) 1).obj)⟦(1 : ℤ)⟧, f ≠ 0 := sorry
end CategoricalLefschetz

/-! BBD 6.2.4 geometric origin uses complex coefficients and simple constituents. -/
section GeometricOrigin
abbrev AnalyticComplexPerv (X : Geo ComplexBase) := AnalyticPerv ComplexBase X
instance (X : Geo ComplexBase) : HasFiniteBiproducts (AnalyticComplexPerv X) := sorry
abbrev analyticPCohom (X : Geo ComplexBase) (i : ℤ) := TStructure.homology (analyticPerverseT ComplexBase X) i
/-- A simple subquotient is obtained from a subobject by an actual epimorphism. -/
def SimpleConstituent {X : Geo ComplexBase} (S P : AnalyticComplexPerv X) : Prop :=
  Simple S ∧ ∃ (Q : AnalyticComplexPerv X) (a : Q ⟶ P) (b : Q ⟶ S), Mono a ∧ Epi b
inductive GeometricOrigin : ∀ (X : Geo ComplexBase), AnalyticComplexPerv X → Prop
  | point (P : AnalyticComplexPerv (basePoint ComplexBase))
      (hP : Simple P) (e : P.obj ≅ analyticConstant (basePoint ComplexBase)) : GeometricOrigin _ P
  | iso {X} {P Q : AnalyticComplexPerv X} (h : GeometricOrigin X P) (e : P ≅ Q) : GeometricOrigin X Q
  | pullback {X Y} (f : X ⟶ Y) {P : AnalyticComplexPerv Y} (hP : GeometricOrigin Y P)
      (i : ℤ) (S : AnalyticComplexPerv X)
      (hS : SimpleConstituent S ((analyticPCohom X i).obj ((analyticPullback f).obj P.obj))) : GeometricOrigin X S
  | upperShriek {X Y} (f : X ⟶ Y) {P : AnalyticComplexPerv Y} (hP : GeometricOrigin Y P)
      (i : ℤ) (S : AnalyticComplexPerv X)
      (hS : SimpleConstituent S ((analyticPCohom X i).obj ((analyticUpperShriek f).obj P.obj))) : GeometricOrigin X S
  | pushforward {X Y} (f : X ⟶ Y) {P : AnalyticComplexPerv X} (hP : GeometricOrigin X P)
      (i : ℤ) (S : AnalyticComplexPerv Y)
      (hS : SimpleConstituent S ((analyticPCohom Y i).obj ((analyticPushforward f).obj P.obj))) : GeometricOrigin Y S
  | lowerShriek {X Y} (f : X ⟶ Y) {P : AnalyticComplexPerv X} (hP : GeometricOrigin X P)
      (i : ℤ) (S : AnalyticComplexPerv Y)
      (hS : SimpleConstituent S ((analyticPCohom Y i).obj ((analyticLowerShriek f).obj P.obj))) : GeometricOrigin Y S
  | tensor {X} {P Q : AnalyticComplexPerv X} (hP : GeometricOrigin X P) (hQ : GeometricOrigin X Q)
      (i : ℤ) (S : AnalyticComplexPerv X)
      (hS : SimpleConstituent S ((analyticPCohom X i).obj (analyticTensor P.obj Q.obj))) : GeometricOrigin X S
  | hom {X} {P Q : AnalyticComplexPerv X} (hP : GeometricOrigin X P) (hQ : GeometricOrigin X Q)
      (i : ℤ) (S : AnalyticComplexPerv X)
      (hS : SimpleConstituent S ((analyticPCohom X i).obj (analyticRHom P.obj Q.obj))) : GeometricOrigin X S
/-- Finite direct sums of simple objects in the smallest family just defined. -/
def SemisimpleGeometricOrigin {X : Geo ComplexBase} (P : AnalyticComplexPerv X) : Prop :=
  ∃ (n : ℕ) (S : Fin n → AnalyticComplexPerv X),
    (∀ a, GeometricOrigin X (S a)) ∧ Nonempty (P ≅ ⨁ S)
def SemisimpleOriginComplex {X : Geo ComplexBase} (K : AnalyticDbc ComplexBase X) : Prop :=
  ∃ S : Finset ℤ, (∀ i : ℤ, i ∉ S → IsZero ((analyticPCohom X i).obj K)) ∧
    Nonempty (K ≅ ⨁ (fun i : S => ((analyticPCohom X i).obj K).obj⟦(-i.val : ℤ)⟧)) ∧
    ∀ i : ℤ, SemisimpleGeometricOrigin ((analyticPCohom X i).obj K)
lemma GeometricOrigin.simple {X : Geo ComplexBase} (P : AnalyticComplexPerv X)
    (h : GeometricOrigin X P) : Simple P := sorry
lemma GeometricOrigin.constituent {X : Geo ComplexBase} (P S : AnalyticComplexPerv X)
    (hP : SemisimpleGeometricOrigin P) (hS : SimpleConstituent S P) : GeometricOrigin X S := sorry
lemma SemisimpleOriginComplex.iso {X : Geo ComplexBase} {K L : AnalyticDbc ComplexBase X}
    (h : SemisimpleOriginComplex K) (e : K ≅ L) : SemisimpleOriginComplex L := sorry
/-- Test `TauCeti.EtaleDuality.geometric_origin_point`. -/
example (P : AnalyticComplexPerv (basePoint ComplexBase)) [Simple P]
    (e : P.obj ≅ analyticConstant (basePoint ComplexBase)) : GeometricOrigin _ P := sorry
/-- Test `TauCeti.EtaleDuality.geometric_origin_zero_complex`. -/
example {X : Geo ComplexBase} (K : AnalyticDbc ComplexBase X) (h : IsZero K) : SemisimpleOriginComplex K := sorry
/-- Test `TauCeti.EtaleDuality.geometric_origin_finite_cover`: simple constituents of a finite étale pushforward
of the smooth constant perverse sheaf are generated by the prescribed operations. -/
example {X Y : Geo ComplexBase} (f : X ⟶ Y) [IsFinite f.hom.left] [Etale f.hom.left]
    (d : ℕ) [SmoothOfRelativeDimension d X.structural]
    (S : AnalyticComplexPerv Y)
    (hS : SimpleConstituent S ((analyticPCohom Y 0).obj
      ((analyticPushforward f).obj ((analyticConstant (Λ := ComplexBase) X)⟦(d : ℤ)⟧)))) :
    GeometricOrigin Y S := sorry
/-- BBD 6.2.5: proper direct image of a semisimple complex of geometric origin. -/
theorem characteristic_zero_decomposition {X Y : Geo ComplexBase} (f : X ⟶ Y)
    [IsProper f.hom.left] (K : AnalyticDbc ComplexBase X) (hK : SemisimpleOriginComplex K) :
    SemisimpleOriginComplex ((analyticPushforward f).obj K) := sorry
/-- The analytic Chern operator uses the same relatively ample algebraic line bundle,
with the Tate factor trivialized by the positive complex orientation. -/
def analyticRelativeChernPower {X Y : Geo ComplexBase} (f : X ⟶ Y)
    (P : AnalyticComplexPerv X) (L : LineBundle X) (i : ℕ) :
    (analyticPCohom Y (-(i : ℤ))).obj ((analyticPushforward f).obj P.obj) ⟶
      (analyticPCohom Y i).obj ((analyticPushforward f).obj P.obj) := sorry
/-- BBD 6.2.10, p. 165; complex coefficients and semisimple geometric origin are explicit. -/
theorem characteristic_zero_relative_hard_lefschetz {X Y : Geo ComplexBase} (f : X ⟶ Y)
    (η : RelativePolarization f) (P : AnalyticComplexPerv X)
    (hP : SemisimpleGeometricOrigin P) (i : ℕ) :
    IsIso (analyticRelativeChernPower f P η.line i) := sorry
end GeometricOrigin

/-! BBD 6.1.8–6.1.10 concerns a chosen finite set of residual constituents.
The trait categories and their pullback realizations are requested from SF.2; these
are not equivalences of unrestricted constructible categories. -/
section RestrictedSpecialization
local instance (α : Type*) : DecidableEq α := Classical.decEq α
variable {O : Type u} [CommRing O] [D : IntegralDatum (k := ComplexBase) O]
/-- Finite extension closure in the ordinary heart, expressed by actual triangles. -/
inductive ExtensionGenerated {k' : Type u} [Field k'] {Λ' : Type u} [CommRing Λ']
    {X : Geo k'} (G : Finset (Dbc Λ' X)) : Dbc Λ' X → Prop
  | zero (K) (h : IsZero K) : ExtensionGenerated G K
  | generator (K) (h : K ∈ G) : ExtensionGenerated G K
  | iso {K L} (h : ExtensionGenerated G K) (e : K ≅ L) : ExtensionGenerated G L
  | extension (T : Pretriangulated.Triangle (Dbc Λ' X)) (hT : T ∈ distTriang _)
      (h₁ : ExtensionGenerated G T.obj₁) (h₃ : ExtensionGenerated G T.obj₃) :
      ExtensionGenerated G T.obj₂
structure ResidualConstituents {k' : Type u} [Field k'] (X : Geo k') where
  strata : AlgebraicStratification X
  dimension : Fin strata.size → ℕ
  smooth : ∀ s, SmoothOfRelativeDimension (dimension s) (strata.strata s).structural
  connected : ∀ s, GeometricallyConnected (strata.strata s).structural
  generators : ∀ s, Finset (Lisse (IsLocalRing.ResidueField O) (strata.strata s))
  simple : ∀ s L, L ∈ generators s → Simple ((TStructure.homology
    (standardTStructure (IsLocalRing.ResidueField O) (strata.strata s)) 0).obj (lisseComplex.obj L))
/-- Reduction followed by ordinary cohomology, not a condition on a chosen rational lattice. -/
def RestrictedBy {k' : Type u} [Field k'] {X : Geo k'}
    (R : ResidualConstituents (O := O) X) (K : Dbc O X) : Prop :=
  ∀ (i : ℤ) (s : Fin R.strata.size),
    ExtensionGenerated (R.generators s |>.image (fun L => lisseComplex.obj L))
      ((pullback (R.strata.inclusion s)).obj
        (ordinaryCohomologyObject i ((extendCoefficients (algebraMap O (IsLocalRing.ResidueField O)) X).obj K)))
abbrev RestrictedCategory {k' : Type u} [Field k'] {X : Geo k'}
    (R : ResidualConstituents (O := O) X) := ObjectProperty.FullSubcategory (RestrictedBy R)
/-- An actual spread model and strict Henselian trait with the prescribed complex fibre. -/
structure TraitModel (X : Geo ComplexBase) where
  A : Type u
  [ringA : CommRing A]
  [finiteA : Algebra.FiniteType ℤ A]
  V : Type u
  [ringV : CommRing V]
  [domainV : IsDomain V]
  [dvr : IsDiscreteValuationRing V]
  [henselian : HenselianLocalRing V]
  [closedResidue : IsSepClosed (IsLocalRing.ResidueField V)]
  finiteField : Type u
  [field : Field finiteField]
  [finite : Finite finiteField]
  residue : AlgebraicClosure finiteField ≃+* IsLocalRing.ResidueField V
  toTrait : A →+* V
  toComplex : V →+* ComplexBase
  traitInjective : Function.Injective toTrait
  complexInjective : Function.Injective toComplex
  ellInvertible : IsUnit (D.ell : V)
  model : Scheme.{u}
  structural : model ⟶ Spec (CommRingCat.of A)
  finiteType : LocallyOfFiniteType structural
  separated : IsSeparated structural
  traitSpace : Scheme.{u}
  traitStructural : traitSpace ⟶ Spec (CommRingCat.of V)
  traitToModel : traitSpace ⟶ model
  traitSquare : IsPullback traitToModel traitStructural structural (Spec.map (CommRingCat.ofHom toTrait))
  complexToTrait : X.space ⟶ traitSpace
  complexSquare : IsPullback complexToTrait X.structural traitStructural (Spec.map (CommRingCat.ofHom toComplex))
  special : Geo (IsLocalRing.ResidueField V)
  specialToTrait : special.space ⟶ traitSpace
  specialSquare : IsPullback specialToTrait special.structural traitStructural
    (Spec.map (CommRingCat.ofHom (algebraMap V (IsLocalRing.ResidueField V))))
attribute [instance] TraitModel.ringA TraitModel.finiteA TraitModel.ringV TraitModel.domainV TraitModel.dvr
  TraitModel.henselian TraitModel.closedResidue TraitModel.field TraitModel.finite
/-- SF.2 supplier: bounded normalized O-complexes on the trait, restricted by the
spread strata and residual generators. Its objects have actual small-étale pullback
realizations; the BBD good-model Ext and base-change conditions are part of that request. -/
def RestrictedTrait {X : Geo ComplexBase} (M : TraitModel (O := O) X)
    (R : ResidualConstituents (O := O) X)
    (Rs : ResidualConstituents (O := O) M.special) : Type (u + 1) := sorry
instance {X : Geo ComplexBase} (M : TraitModel (O := O) X)
    (R : ResidualConstituents (O := O) X) (Rs : ResidualConstituents (O := O) M.special) :
    Category.{u} (RestrictedTrait M R Rs) := sorry
/-- The functors are the actual fibre restrictions of the imported trait category. -/
def traitComplexRestriction {X : Geo ComplexBase} (M : TraitModel (O := O) X)
    (R : ResidualConstituents (O := O) X) (Rs : ResidualConstituents (O := O) M.special) :
    RestrictedTrait M R Rs ⥤ RestrictedCategory R := sorry
def traitSpecialRestriction {X : Geo ComplexBase} (M : TraitModel (O := O) X)
    (R : ResidualConstituents (O := O) X) (Rs : ResidualConstituents (O := O) M.special) :
    RestrictedTrait M R Rs ⥤ RestrictedCategory Rs := sorry
/-- BBD 6.1.9–6.1.10: after shrinking a good model, both chosen restrictions are
fully faithful and essentially surjective. The two fibre categories are consequently equivalent. -/
theorem spreading_out_to_finite_fields (X : Geo ComplexBase) (R : ResidualConstituents (O := O) X) :
    ∃ (M : TraitModel (O := O) X) (Rs : ResidualConstituents (O := O) M.special),
      (traitComplexRestriction M R Rs).Full ∧ (traitComplexRestriction M R Rs).Faithful ∧
      (traitComplexRestriction M R Rs).EssSurj ∧
      (traitSpecialRestriction M R Rs).Full ∧ (traitSpecialRestriction M R Rs).Faithful ∧
      (traitSpecialRestriction M R Rs).EssSurj := sorry

/-- BBD 6.1.10's additional closure condition: ordinary direct images of the chosen
residual generators, restricted to every stratum, remain in their extension closure. -/
def ResidualStarClosed {k' : Type u} [Field k'] {X : Geo k'}
    (R : ResidualConstituents (O := O) X) : Prop :=
  ∀ (s t : Fin R.strata.size) (L : Lisse (IsLocalRing.ResidueField O) (R.strata.strata s)),
    L ∈ R.generators s → ∀ q : ℤ,
    ExtensionGenerated (R.generators t |>.image (fun L => lisseComplex.obj L))
      ((pullback (R.strata.inclusion t)).obj
        (ordinaryCohomologyObject q ((pushforward (R.strata.inclusion s)).obj (lisseComplex.obj L))))
/-- With this closure on both fibres, the selected specialization equivalence preserves
both perverse halves. The contexts are explicit and the equivalence remains restricted. -/
lemma restricted_specialization_perverse [PerverseContext (k := ComplexBase) O]
    {X : Geo ComplexBase} (M : TraitModel (O := O) X)
    [PerverseContext (k := IsLocalRing.ResidueField M.V) O]
    (R : ResidualConstituents (O := O) X) (Rs : ResidualConstituents (O := O) M.special)
    (hR : ResidualStarClosed R) (hRs : ResidualStarClosed Rs)
    (hCF : (traitComplexRestriction M R Rs).Full)
    (hCf : (traitComplexRestriction M R Rs).Faithful)
    (hCE : (traitComplexRestriction M R Rs).EssSurj)
    (hSF : (traitSpecialRestriction M R Rs).Full)
    (hSf : (traitSpecialRestriction M R Rs).Faithful)
    (hSE : (traitSpecialRestriction M R Rs).EssSurj) :
    ∃ e : RestrictedCategory R ≌ RestrictedCategory Rs, ∀ K,
      ((perverseTStructure O X).IsLE K.obj 0 ↔
        (perverseTStructure O M.special).IsLE (e.functor.obj K).obj 0) ∧
      ((perverseTStructure O X).IsGE K.obj 0 ↔
        (perverseTStructure O M.special).IsGE (e.functor.obj K).obj 0) := sorry

lemma RestrictedBy.zero {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X)
    (K : Dbc O X) (h : IsZero K) : RestrictedBy R K := sorry
lemma RestrictedBy.iso {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X)
    {K L : Dbc O X} (h : RestrictedBy R K) (e : K ≅ L) : RestrictedBy R L := sorry
lemma RestrictedBy.constituents {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X)
    (K : Dbc O X) (h : RestrictedBy R K) (i : ℤ) (s : Fin R.strata.size) :
    ExtensionGenerated (R.generators s |>.image (fun L => lisseComplex.obj L))
      ((pullback (R.strata.inclusion s)).obj
        (ordinaryCohomologyObject i ((extendCoefficients (algebraMap O (IsLocalRing.ResidueField O)) X).obj K))) := sorry
/-- Test `TauCeti.EtaleDuality.restricted_specialization_zero`. -/
example {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X) (K : Dbc O X)
    (h : IsZero K) : RestrictedBy R K := sorry
/-- Test `TauCeti.EtaleDuality.restricted_specialization_empty_generators`: derived Nakayama prevents a
nonzero integral complex from having zero reduction on every covering stratum. -/
example {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X)
    (hR : ∀ s, R.generators s = ∅) (K : Dbc O X) (h : RestrictedBy R K) : IsZero K := sorry
/-- Test `TauCeti.EtaleDuality.restricted_specialization_excluded_constituent`: a chosen category has a real boundary. -/
example {X : Geo ComplexBase} (R : ResidualConstituents (O := O) X) (K : Dbc O X)
    (i : ℤ) (s : Fin R.strata.size)
    (h : ¬ ExtensionGenerated (R.generators s |>.image (fun L => lisseComplex.obj L))
      ((pullback (R.strata.inclusion s)).obj
        (ordinaryCohomologyObject i ((extendCoefficients (algebraMap O (IsLocalRing.ResidueField O)) X).obj K)))) :
    ¬ RestrictedBy R K := sorry

/-! SF.2 requested import: a good spread model with restricted fibre equivalences,
a coefficient field isomorphism C ≃ Qbar_ell, finite coefficient descent, and the
identification of the given analytic perverse object with the geometric fibre.
This data type records those identifications; purity is the separate EDC.7 theorem. -/
def OriginSpreadWitness {X : Geo ComplexBase} (P : AnalyticComplexPerv X)
    (k0 : Type u) [Field k0] [Finite k0] (E : Type u) [Field E] [CharZero E]
    [RationalDatum (k := k0) E] [PerverseContext (k := k0) E]
    (X0 : Geo k0) (P0 : PerverseSheaf E X0) : Type (u + 1) := sorry
structure FiniteOriginSpecialization {X : Geo ComplexBase} (P : AnalyticComplexPerv X) where
  k0 : Type u
  [field : Field k0]
  [finite : Finite k0]
  E : Type u
  [coeffField : Field E]
  [charZero : CharZero E]
  [rational : RationalDatum (k := k0) E]
  [perverse : PerverseContext (k := k0) E]
  [geometricPerverseContext : PerverseContext (k := AlgebraicClosure k0) E]
  X0 : Geo k0
  P0 : PerverseSheaf E X0
  identifies : Nonempty (OriginSpreadWitness P k0 E X0 P0)
attribute [instance] FiniteOriginSpecialization.field FiniteOriginSpecialization.finite
  FiniteOriginSpecialization.coeffField FiniteOriginSpecialization.charZero
  FiniteOriginSpecialization.rational FiniteOriginSpecialization.perverse
  FiniteOriginSpecialization.geometricPerverseContext
/-- BBD 6.2.6 property (P), separated from both the origin definition and an
unrestricted constructible-category equivalence. The finite descent witness is required. -/
lemma geometric_origin_pure_specialization {X : Geo ComplexBase}
    (P : AnalyticComplexPerv X) (h : GeometricOrigin X P) :
    ∃ M : FiniteOriginSpecialization P, ∃ w : ℤ,
      PureWeight (E := M.E) M.P0.obj w ∧ Simple ((geometricPerverse (E := M.E) M.X0).obj M.P0) := sorry

end RestrictedSpecialization

/-! EDC.8: all correspondences and products are over the common base k. -/
section Correspondences
variable {Λ : Type u} [CommRing Λ] [Coefficients (k := k) Λ]
def sixAdjunction {X Y : Geo k} (f : X ⟶ Y) : lowerShriek (Λ := Λ) f ⊣ upperShriek f := sorry
def lowerShriekCompIso {X Y Z : Geo k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    lowerShriek (Λ := Λ) f ⋙ lowerShriek g ≅ lowerShriek (f ≫ g) := sorry
def pullbackIdIso (X : Geo k) : pullback (Λ := Λ) (geoIdentity X) ≅ 𝟭 _ := sorry
def upperShriekIdIso (X : Geo k) : upperShriek (Λ := Λ) (geoIdentity X) ≅ 𝟭 _ := sorry
structure CohCorr {X Y : Geo k} (L : Dbc Λ X) (M : Dbc Λ Y) where
  support : Geo k
  left : support ⟶ X
  right : support ⟶ Y
  u : (pullback left).obj L ⟶ (upperShriek right).obj M
/-- Adjunction convention: left* L → right! M, or right_! left* L → M. -/
def CohCorr.ofAdjoint {X Y C : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (l : C ⟶ X) (r : C ⟶ Y) (v : (lowerShriek r).obj ((pullback l).obj L) ⟶ M) : CohCorr L M :=
  ⟨C, l, r, (sixAdjunction r).homEquiv _ _ v⟩
def CohCorr.adjoint {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    (lowerShriek c.right).obj ((pullback c.left).obj L) ⟶ M :=
  ((sixAdjunction c.right).homEquiv _ _).symm c.u
def CohCorr.id {X : Geo k} (L : Dbc Λ X) : CohCorr L L where
  support := X
  left := geoIdentity X
  right := geoIdentity X
  u := (pullbackIdIso X).hom.app L ≫ (upperShriekIdIso X).inv.app L
def CohCorr.graph {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (f : Y ⟶ X) (v : (pullback f).obj L ⟶ M) : CohCorr L M where
  support := Y
  left := f
  right := geoIdentity Y
  u := v ≫ (upperShriekIdIso Y).inv.app M
/-- Native transport along a support isomorphism whose legs commute. -/
def corrLeftTransport {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c d : CohCorr L M)
    (e : c.support ≅ d.support) (hl : e.hom ≫ d.left = c.left) :
    pullback (Λ := Λ) c.left ≅ pullback d.left ⋙ pullback e.hom := sorry
def corrRightTransport {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c d : CohCorr L M)
    (e : c.support ≅ d.support) (hr : e.hom ≫ d.right = c.right) :
    upperShriek (Λ := Λ) c.right ≅ upperShriek d.right ⋙ pullback e.hom := sorry
/-- This comparison includes equality of the actual cohomological morphisms. -/
structure CohCorr.SupportEquiv {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c d : CohCorr L M) where
  supportIso : c.support ≅ d.support
  left : supportIso.hom ≫ d.left = c.left
  right : supportIso.hom ≫ d.right = c.right
  morphism : c.u = (corrLeftTransport c d supportIso left).hom.app L ≫
    (pullback supportIso.hom).map d.u ≫ (corrRightTransport c d supportIso right).inv.app M
def CohCorr.changeCoefficients {X Y : Geo k} {L L' : Dbc Λ X} {M M' : Dbc Λ Y}
    (c : CohCorr L M) (a : L ≅ L') (b : M ≅ M') : CohCorr L' M' where
  support := c.support
  left := c.left
  right := c.right
  u := (pullback c.left).map a.inv ≫ c.u ≫ (upperShriek c.right).map b.hom
/-- The base-change mate is not presumed to be an isomorphism. -/
def compositionMate {Y C D : Geo k} (r : C ⟶ Y) (l : D ⟶ Y) :
    upperShriek (Λ := Λ) r ⋙ pullback (fiberProductFst r l) ⟶
      pullback l ⋙ upperShriek (fiberProductSnd r l) := sorry
def pullbackCompIso {X Y Z : Geo k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    pullback (Λ := Λ) g ⋙ pullback f ≅ pullback (f ≫ g) := sorry
def upperShriekCompIso {X Y Z : Geo k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    upperShriek (Λ := Λ) g ⋙ upperShriek f ≅ upperShriek (f ≫ g) := sorry
def compUMorphism {X Y Z : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} {N : Dbc Λ Z}
    (c : CohCorr L M) (d : CohCorr M N) :
    (pullback (fiberProductFst c.right d.left ≫ c.left)).obj L ⟶
      (upperShriek (fiberProductSnd c.right d.left ≫ d.right)).obj N :=
  (pullbackCompIso (fiberProductFst c.right d.left) c.left).inv.app L ≫
    (pullback (fiberProductFst c.right d.left)).map c.u ≫
    (compositionMate c.right d.left).app M ≫
    (upperShriek (fiberProductSnd c.right d.left)).map d.u ≫
    (upperShriekCompIso (fiberProductSnd c.right d.left) d.right).hom.app N
def CohCorr.comp {X Y Z : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} {N : Dbc Λ Z}
    (c : CohCorr L M) (d : CohCorr M N) : CohCorr L N where
  support := fiberProduct c.right d.left
  left := fiberProductFst c.right d.left ≫ c.left
  right := fiberProductSnd c.right d.left ≫ d.right
  u := compUMorphism c d
/-- The canonical left/right identity support isomorphisms transport u as well. -/
lemma CohCorr.id_comp {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty (((CohCorr.id L).comp c).SupportEquiv c) := sorry
lemma CohCorr.comp_id {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty ((c.comp (CohCorr.id M)).SupportEquiv c) := sorry
lemma CohCorr.comp_assoc {X Y Z W : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    {N : Dbc Λ Z} {P : Dbc Λ W} (c : CohCorr L M) (d : CohCorr M N) (e : CohCorr N P) :
    Nonempty (((c.comp d).comp e).SupportEquiv (c.comp (d.comp e))) := sorry
structure CohCorr.PushforwardData {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {X' Y' : Geo k} (f : X ⟶ X') (g : Y ⟶ Y') where
  targetSupport : Geo k
  supportMap : c.support ⟶ targetSupport
  targetLeft : targetSupport ⟶ X'
  targetRight : targetSupport ⟶ Y'
  left : c.left ≫ f = supportMap ≫ targetLeft
  right : c.right ≫ g = supportMap ≫ targetRight
/-- Exactly Varshavsky 1.1.6(a)(i),(ii),(iii); a square is not replaced by an arbitrary iso. -/
def CohCorr.PushforwardData.IsAdmissible {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    {c : CohCorr L M} {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) : Prop :=
  IsPullback c.left D.supportMap f D.targetLeft ∨
    (IsProper f.hom.left ∧ IsProper D.supportMap.hom.left) ∨
    (IsProper c.left.hom.left ∧ IsProper D.targetLeft.hom.left)
/-- SF.2 base-change map with the three source conditions above. -/
def corrPushforwardLeftBC {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g)
    (h : D.IsAdmissible) :
    lowerShriek (Λ := Λ) f ⋙ pullback D.targetLeft ⟶ pullback c.left ⋙ lowerShriek D.supportMap := sorry
/-- The exchange mate for ! and !_ is obtained from adjunction and the commuting right square. -/
def corrPushforwardRightBC {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) :
    upperShriek (Λ := Λ) c.right ⋙ lowerShriek D.supportMap ⟶ lowerShriek g ⋙ upperShriek D.targetRight := sorry
def CohCorr.pushforward {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M)
    {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) (h : D.IsAdmissible) :
    CohCorr ((lowerShriek f).obj L) ((lowerShriek g).obj M) where
  support := D.targetSupport
  left := D.targetLeft
  right := D.targetRight
  u := (corrPushforwardLeftBC c D h).app L ≫ (lowerShriek D.supportMap).map c.u ≫
    (corrPushforwardRightBC c D).app M
lemma CohCorr.pushforward_support {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) (h : D.IsAdmissible) :
    (c.pushforward D h).support = D.targetSupport := rfl
lemma CohCorr.pushforward_morphism {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) (h : D.IsAdmissible) :
    (c.pushforward D h).u = (corrPushforwardLeftBC c D h).app L ≫
      (lowerShriek D.supportMap).map c.u ≫ (corrPushforwardRightBC c D).app M := rfl
/-- Composition of the two commuting support squares. -/
def CohCorr.PushforwardData.comp {X Y X' Y' X'' Y'' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    {c : CohCorr L M} {f : X ⟶ X'} {g : Y ⟶ Y'}
    (D : c.PushforwardData f g) (h : D.IsAdmissible) {f' : X' ⟶ X''} {g' : Y' ⟶ Y''}
    (D' : (c.pushforward D h).PushforwardData f' g') : c.PushforwardData (f ≫ f') (g ≫ g') where
  targetSupport := D'.targetSupport
  supportMap := D.supportMap ≫ eqToHom (c.pushforward_support D h).symm ≫ D'.supportMap
  targetLeft := D'.targetLeft
  targetRight := D'.targetRight
  left := by sorry
  right := by sorry
lemma CohCorr.pushforward_comp {X Y X' Y' X'' Y'' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {f : X ⟶ X'} {g : Y ⟶ Y'} (D : c.PushforwardData f g) (h : D.IsAdmissible)
    {f' : X' ⟶ X''} {g' : Y' ⟶ Y''} (D' : (c.pushforward D h).PushforwardData f' g')
    (h' : D'.IsAdmissible) (hcomp : (D.comp h D').IsAdmissible) :
    Nonempty ((((c.pushforward D h).pushforward D' h').changeCoefficients
      ((lowerShriekCompIso f f').app L) ((lowerShriekCompIso g g').app M)).SupportEquiv
        (c.pushforward (D.comp h D') hcomp)) := sorry
/-- Proper outer maps, retaining the support and the canonical base-change morphism. -/
def CohCorr.properMapData {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (f : X ⟶ X') (g : Y ⟶ Y') : c.PushforwardData f g where
  targetSupport := c.support
  supportMap := geoIdentity c.support
  targetLeft := c.left ≫ f
  targetRight := c.right ≫ g
  left := by simp [geoIdentity]
  right := by simp [geoIdentity]
lemma CohCorr.properMapData_admissible {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (f : X ⟶ X') (g : Y ⟶ Y') [IsProper f.hom.left] :
    (c.properMapData f g).IsAdmissible := sorry
def CohCorr.properMap {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (f : X ⟶ X') (g : Y ⟶ Y') [IsProper f.hom.left] [IsProper g.hom.left] :
    CohCorr ((lowerShriek f).obj L) ((lowerShriek g).obj M) :=
  c.pushforward (c.properMapData f g) (c.properMapData_admissible f g)
lemma CohCorr.properMap_comp {X Y X' Y' X'' Y'' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (f : X ⟶ X') (g : Y ⟶ Y') (f' : X' ⟶ X'') (g' : Y' ⟶ Y'')
    [IsProper f.hom.left] [IsProper g.hom.left] [IsProper f'.hom.left] [IsProper g'.hom.left]
    [IsProper (f ≫ f').hom.left] [IsProper (g ≫ g').hom.left] :
    Nonempty (((c.properMap f g).properMap f' g').changeCoefficients
      ((lowerShriekCompIso f f').app L) ((lowerShriekCompIso g g').app M) |>.SupportEquiv
        (c.properMap (f ≫ f') (g ≫ g'))) := sorry
/-- Arbitrary u on a point is tested, not just the identity of the constant sheaf. -/
example {L M N : Dbc Λ (basePoint k)} (u : L ⟶ M) (v : M ⟶ N) :
    Nonempty (((CohCorr.graph (geoIdentity _) ((pullbackIdIso _).hom.app L ≫ u)).comp
      (CohCorr.graph (geoIdentity _) ((pullbackIdIso _).hom.app M ≫ v))).SupportEquiv
        (CohCorr.graph (geoIdentity _) ((pullbackIdIso _).hom.app L ≫ u ≫ v))) := sorry
/-- Adjunction conversion is invertible for every morphism, including zero. -/
example {X Y C : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (l : C ⟶ X) (r : C ⟶ Y)
    (v : (lowerShriek r).obj ((pullback l).obj L) ⟶ M) : (CohCorr.ofAdjoint l r v).adjoint = v := sorry
/-- Degenerate empty support has a zero cohomological morphism. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M)
    [IsEmpty c.support.space] : c.u = 0 := sorry
/-- Pushforward along a proper map of support schemes, with unchanged outer schemes. -/
def CohCorr.properSupportData {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (D : Geo k) (l : D ⟶ X) (r : D ⟶ Y)
    (p : c.support ⟶ D) (hl : p ≫ l = c.left) (hr : p ≫ r = c.right) :
    c.PushforwardData (geoIdentity X) (geoIdentity Y) where
  targetSupport := D
  supportMap := p
  targetLeft := l
  targetRight := r
  left := by simpa [geoIdentity] using hl.symm
  right := by simpa [geoIdentity] using hr.symm
lemma CohCorr.properSupportData_admissible {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (D : Geo k) (l : D ⟶ X) (r : D ⟶ Y)
    (p : c.support ⟶ D) [IsProper p.hom.left] (hl : p ≫ l = c.left) (hr : p ≫ r = c.right) :
    (c.properSupportData D l r p hl hr).IsAdmissible := sorry
def lowerShriekIdIso (X : Geo k) : lowerShriek (Λ := Λ) (geoIdentity X) ≅ 𝟭 _ := sorry
def CohCorr.properSupportMap {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (D : Geo k) (l : D ⟶ X) (r : D ⟶ Y)
    (p : c.support ⟶ D) (hp : IsProper p.hom.left) (hl : p ≫ l = c.left) (hr : p ≫ r = c.right) :
    CohCorr L M := by
  letI := hp
  exact (c.pushforward (c.properSupportData D l r p hl hr)
    (c.properSupportData_admissible D l r p hl hr)).changeCoefficients
      ((lowerShriekIdIso X).app L) ((lowerShriekIdIso Y).app M)
lemma CohCorr.properSupportMap_id {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty ((c.properSupportMap c.support c.left c.right (geoIdentity c.support) (by infer_instance)
      (by simp [geoIdentity]) (by simp [geoIdentity])).SupportEquiv c) := sorry
lemma CohCorr.properSupportMap_comp {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) {D D' : Geo k} (l : D ⟶ X) (r : D ⟶ Y) (l' : D' ⟶ X) (r' : D' ⟶ Y)
    (p : c.support ⟶ D) (q : D ⟶ D') [IsProper p.hom.left] [hq : IsProper q.hom.left]
    [IsProper (p ≫ q).hom.left] (hl : p ≫ l = c.left) (hr : p ≫ r = c.right)
    (hl' : q ≫ l' = l) (hr' : q ≫ r' = r) :
    Nonempty (((c.properSupportMap D l r p (by infer_instance) hl hr).properSupportMap D' l' r' q hq hl' hr').SupportEquiv
      (c.properSupportMap D' l' r' (p ≫ q) (by infer_instance) (by rw [Category.assoc, hl', hl])
        (by rw [Category.assoc, hr', hr]))) := sorry
/-- Test `TauCeti.EtaleDuality.pushforward_identity_morphism`: the identity support map preserves arbitrary u. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty ((c.properSupportMap c.support c.left c.right (geoIdentity c.support) (by infer_instance)
      (by simp [geoIdentity]) (by simp [geoIdentity])).SupportEquiv c) := sorry
/-- Test `TauCeti.EtaleDuality.pushforward_zero_morphism`: base change and adjunction maps are additive. -/
example {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    (c : CohCorr L M) (hu : c.u = 0) {f : X ⟶ X'} {g : Y ⟶ Y'}
    (D : c.PushforwardData f g) (h : D.IsAdmissible) : (c.pushforward D h).u = 0 := sorry
/-- Test `TauCeti.EtaleDuality.pushforward_point_endomorphism`: a nontrivial point endomorphism is retained. -/
example {L M : Dbc Λ (basePoint k)} (v : L ⟶ M) :
    Nonempty ((CohCorr.graph (geoIdentity _) ((pullbackIdIso _).hom.app L ≫ v)).SupportEquiv
      (CohCorr.ofAdjoint (geoIdentity _) (geoIdentity _)
        ((lowerShriekIdIso _).hom.app ((pullback (geoIdentity _)).obj L) ≫
          (pullbackIdIso _).hom.app L ≫ v))) := sorry
lemma CohCorr.pushforward_id {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty (((c.properMap (geoIdentity X) (geoIdentity Y)).changeCoefficients
      ((lowerShriekIdIso X).app L) ((lowerShriekIdIso Y).app M)).SupportEquiv c) := sorry
/-- Invariant closed sets use the convention right^{-1}(Z) ⊆ left^{-1}(Z). -/
def CohCorr.Invariant {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) (Z : Set X.space) : Prop :=
  c.right.hom.left.base ⁻¹' Z ⊆ c.left.hom.left.base ⁻¹' Z
/-- The invariant open complement has the reverse preimage inclusion. -/
lemma CohCorr.invariant_complement {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (Z : Set X.space) (h : c.Invariant Z) :
    c.left.hom.left.base ⁻¹' Zᶜ ⊆ c.right.hom.left.base ⁻¹' Zᶜ := sorry
def CohCorr.restrictOpen {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    {U : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    CohCorr ((pullback j).obj L) ((pullback j).obj L) := sorry
def CohCorr.restrictClosed {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    {Z : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (hi : c.Invariant (Set.range i.hom.left.base)) :
    CohCorr ((pullback i).obj L) ((pullback i).obj L) := sorry
/-- SF.0 reduction, carrying the actual nilpotent thickening map. -/
def schemeReduction (X : Geo k) : Geo k := sorry
def schemeReductionMap (X : Geo k) : schemeReduction X ⟶ X := sorry
lemma CohCorr.restrictOpen_support {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    {U : Geo k} (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    Nonempty ((c.restrictOpen j).support ≅
      fiberProduct (fiberProductFst c.left j ≫ c.right) j) := sorry
/-- Varshavsky 1.5.6(a): the support is the reduction of right^{-1}(Z). -/
lemma CohCorr.restrictClosed_support {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    {Z : Geo k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (hi : c.Invariant (Set.range i.hom.left.base)) :
    Nonempty ((c.restrictClosed i hi).support ≅ schemeReduction (fiberProduct c.right i)) := sorry
/-- Test `TauCeti.EtaleDuality.restrictClosed_self`: restriction to the entire scheme retains u. -/
example {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    [IsClosedImmersion (geoIdentity X).hom.left] [IsReduced c.support.space]
    (hi : c.Invariant (Set.range (geoIdentity X).hom.left.base)) :
    Nonempty (((c.restrictClosed (geoIdentity X) hi).changeCoefficients
      ((pullbackIdIso X).app L) ((pullbackIdIso X).app L)).SupportEquiv c) := sorry
/-- Test `TauCeti.EtaleDuality.restrictClosed_empty`: empty closed support has zero morphism. -/
example {X Z : Geo k} {L : Dbc Λ X} (c : CohCorr L L) (i : Z ⟶ X)
    [IsClosedImmersion i.hom.left] [IsEmpty Z.space]
    (hi : c.Invariant (Set.range i.hom.left.base)) : (c.restrictClosed i hi).u = 0 := sorry
/-- Test `TauCeti.EtaleDuality.not_invariant_translation`: translation away from a rational point violates invariance. -/
example {X : Geo k} {L : Dbc Λ X} (g : X ⟶ X) (v : (pullback g).obj L ⟶ L)
    (x : X.space) (h : g.hom.left.base x ≠ x) :
    ¬ (CohCorr.graph g v).Invariant {x} := sorry
/-- SF.2 coherence identifies pullback at a fixed point with pullback after g. -/
def fixedPointPullback {X : Geo k} (g : X ⟶ X) (i : basePoint k ⟶ X)
    (hx : i ≫ g = i) : pullback (Λ := Λ) i ≅ pullback g ⋙ pullback i :=
  (eqToIso (congrArg (fun f => pullback (Λ := Λ) f) hx)).symm ≪≫ (pullbackCompIso i g).symm
def fixedPointEndomorphism {X : Geo k} {L : Dbc Λ X} (g : X ⟶ X)
    (v : (pullback g).obj L ⟶ L) (i : basePoint k ⟶ X) (hx : i ≫ g = i) :
    (pullback i).obj L ⟶ (pullback i).obj L :=
  (fixedPointPullback g i hx).hom.app L ≫ (pullback i).map v
/-- Test `TauCeti.EtaleDuality.restriction_fixed_point_endomorphism`: the arbitrary induced stalk map is
retained; replacing every restricted correspondence by zero fails this statement. -/
example {X : Geo k} {L : Dbc Λ X} (g : X ⟶ X) (v : (pullback g).obj L ⟶ L)
    (i : basePoint k ⟶ X) [IsClosedImmersion i.hom.left] (hx : i ≫ g = i)
    (hi : (CohCorr.graph g v).Invariant (Set.range i.hom.left.base)) :
    Nonempty (((CohCorr.graph g v).restrictClosed i hi).SupportEquiv
      (CohCorr.graph (geoIdentity _) ((pullbackIdIso _).hom.app _ ≫ fixedPointEndomorphism g v i hx))) := sorry
lemma CohCorr.restrictOpen_self {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    [IsOpenImmersion (geoIdentity X).hom.left] :
    Nonempty (((c.restrictOpen (geoIdentity X)).changeCoefficients
      ((pullbackIdIso X).app L) ((pullbackIdIso X).app L)).SupportEquiv c) := sorry
/-- The relative product and fixed-point fibre product retain the k-structure. -/
def relativeProduct (X Y : Geo k) : Geo k := fiberProduct (toBasePoint X) (toBasePoint Y)
def relativeDiagonal (X : Geo k) : X ⟶ relativeProduct X X := sorry
def relativePair {C X Y : Geo k} (l : C ⟶ X) (r : C ⟶ Y) : C ⟶ relativeProduct X Y := sorry
lemma relativePair_fst {C X Y : Geo k} (l : C ⟶ X) (r : C ⟶ Y) :
    relativePair l r ≫ fiberProductFst (toBasePoint X) (toBasePoint Y) = l := sorry
lemma relativePair_snd {C X Y : Geo k} (l : C ⟶ X) (r : C ⟶ Y) :
    relativePair l r ≫ fiberProductSnd (toBasePoint X) (toBasePoint Y) = r := sorry
/-- EDC.1/SF.2 external derived tensor product, used only with finite Tor amplitude. -/
def externalProductObject {X Y : Geo k} (L : Dbc Λ X) (M : Dbc Λ Y)
    (hL : HasFiniteTorAmplitude L) (hM : HasFiniteTorAmplitude M) : Dbc Λ (relativeProduct X Y) := sorry
/-- The exterior morphism is u box-times v, transported by the Künneth pullback
and exceptional-pullback exchange maps; those maps are supplied by EDC.1/SF.2. -/
def externalCorrespondenceMorphism {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    {L' : Dbc Λ X'} {M' : Dbc Λ Y'} (c : CohCorr L M) (d : CohCorr L' M')
    (hL : HasFiniteTorAmplitude L) (hM : HasFiniteTorAmplitude M)
    (hL' : HasFiniteTorAmplitude L') (hM' : HasFiniteTorAmplitude M') :
    (pullback (relativePair
      (fiberProductFst (toBasePoint c.support) (toBasePoint d.support) ≫ c.left)
      (fiberProductSnd (toBasePoint c.support) (toBasePoint d.support) ≫ d.left))).obj
        (externalProductObject L L' hL hL') ⟶
    (upperShriek (relativePair
      (fiberProductFst (toBasePoint c.support) (toBasePoint d.support) ≫ c.right)
      (fiberProductSnd (toBasePoint c.support) (toBasePoint d.support) ≫ d.right))).obj
        (externalProductObject M M' hM hM') := sorry
def CohCorr.externalProduct {X Y X' Y' : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y}
    {L' : Dbc Λ X'} {M' : Dbc Λ Y'} (c : CohCorr L M) (d : CohCorr L' M')
    (hL : HasFiniteTorAmplitude L) (hM : HasFiniteTorAmplitude M)
    (hL' : HasFiniteTorAmplitude L') (hM' : HasFiniteTorAmplitude M') :
    CohCorr (externalProductObject L L' hL hL') (externalProductObject M M' hM hM') where
  support := relativeProduct c.support d.support
  left := relativePair
    (fiberProductFst (toBasePoint c.support) (toBasePoint d.support) ≫ c.left)
    (fiberProductSnd (toBasePoint c.support) (toBasePoint d.support) ≫ d.left)
  right := relativePair
    (fiberProductFst (toBasePoint c.support) (toBasePoint d.support) ≫ c.right)
    (fiberProductSnd (toBasePoint c.support) (toBasePoint d.support) ≫ d.right)
  u := externalCorrespondenceMorphism c d hL hM hL' hM'
lemma CohCorr.externalProduct_id {X Y : Geo k} (L : Dbc Λ X) (M : Dbc Λ Y)
    (hL : HasFiniteTorAmplitude L) (hM : HasFiniteTorAmplitude M) :
    Nonempty (((CohCorr.id L).externalProduct (CohCorr.id M) hL hL hM hM).SupportEquiv
      (CohCorr.id (externalProductObject L M hL hM))) := sorry
def CohCorr.pair {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) : c.support ⟶ relativeProduct X X :=
  relativePair c.left c.right
def CohCorr.withMorphism {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M)
    (v : (pullback c.left).obj L ⟶ (upperShriek c.right).obj M) : CohCorr L M := {c with u := v}
def CohCorr.fixedLocus {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) : Geo k :=
  fiberProduct c.pair (relativeDiagonal X)
structure CohCorr.ProperComponent {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) where
  space : Geo k
  inclusion : space ⟶ c.fixedLocus
  isOpen : IsOpenImmersion inclusion.hom.left
  closed : IsClosedImmersion inclusion.hom.left
  proper : IsProper space.structural
variable [IsSepClosed k]
/-- Numerical integration is defined only for an actual proper component. -/
def dualizingIntegration (X : Geo k) [IsProper X.structural] :
    dualizingCohomology (Λ := Λ) X ⟶ ModuleCat.of Λ Λ := sorry
/-- EDC.1 evaluation, diagonal base change and dualizing counit give this linear trace map. -/
def CohCorr.traceMap {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) :
    ModuleCat.of Λ ((pullback c.left).obj L ⟶ (upperShriek c.right).obj L) ⟶
      dualizingCohomology (Λ := Λ) c.fixedLocus := sorry
def CohCorr.trace {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) : dualizingCohomology (Λ := Λ) c.fixedLocus :=
  c.traceMap hL c.u
/-- Open restriction of the dualizing trace class, supplied by EDC.1 base change. -/
def CohCorr.openTraceRestriction {X U : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] :
    dualizingCohomology (Λ := Λ) c.fixedLocus ⟶
      dualizingCohomology (Λ := Λ) (c.restrictOpen j).fixedLocus := sorry
lemma CohCorr.trace_restrictOpen {X U : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) (j : U ⟶ X) [IsOpenImmersion j.hom.left]
    (hU : HasFiniteTorAmplitude ((pullback j).obj L)) :
    c.openTraceRestriction j (c.trace hL) = (c.restrictOpen j).trace hU := sorry
def CohCorr.componentTraceRestriction {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (β : c.ProperComponent) : dualizingCohomology (Λ := Λ) c.fixedLocus ⟶
      dualizingCohomology (Λ := Λ) β.space := sorry
def CohCorr.componentTrace {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) (β : c.ProperComponent) :
    dualizingCohomology (Λ := Λ) β.space := c.componentTraceRestriction β (c.trace hL)
def CohCorr.localTerm {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) (β : c.ProperComponent) : Λ :=
  letI := β.proper
  dualizingIntegration β.space (c.componentTrace hL β)
lemma CohCorr.trace_withMorphism {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) (v : (pullback c.left).obj L ⟶ (upperShriek c.right).obj L) :
    (c.withMorphism v).trace hL = c.traceMap hL v := sorry
lemma CohCorr.trace_add {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) (u v : (pullback c.left).obj L ⟶ (upperShriek c.right).obj L) :
    (c.withMorphism (u + v)).trace hL = c.traceMap hL u + c.traceMap hL v := sorry
/-- Test `TauCeti.EtaleDuality.trace_zero_correspondence`. -/
example {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) (hL : HasFiniteTorAmplitude L) :
    (c.withMorphism 0).trace hL = 0 := sorry
/-- Test `TauCeti.EtaleDuality.trace_additive_endomorphisms`. -/
example {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) (hL : HasFiniteTorAmplitude L)
    (u v : (pullback c.left).obj L ⟶ (upperShriek c.right).obj L) :
    (c.withMorphism (u + v)).trace hL = c.traceMap hL u + c.traceMap hL v := sorry
/-- A finite partition into proper clopen components, with a literal sum. -/
structure CohCorr.ComponentPartition {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L) where
  size : ℕ
  component : Fin size → c.ProperComponent
  disjoint : ∀ a b, a ≠ b → Disjoint (Set.range (component a).inclusion.hom.left.base)
    (Set.range (component b).inclusion.hom.left.base)
  cover : ⋃ a, Set.range (component a).inclusion.hom.left.base = Set.univ
lemma CohCorr.localTerm_sum {X : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (hL : HasFiniteTorAmplitude L) [IsProper c.fixedLocus.structural] (B : c.ComponentPartition) :
    (∑ a, c.localTerm hL (B.component a)) = dualizingIntegration c.fixedLocus (c.trace hL) := sorry

/-- Test `TauCeti.EtaleDuality.cohCorr_adjoint_roundtrip`: the adjunction retains an arbitrary morphism. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    (CohCorr.ofAdjoint c.left c.right c.adjoint).u = c.u := sorry
/-- Test `TauCeti.EtaleDuality.cohCorr_zero_source`: a zero pullback has only the zero correspondence morphism. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M)
    (h : IsZero ((pullback c.left).obj L)) : c.u = 0 := sorry
/-- Test `TauCeti.EtaleDuality.cohCorr_graph_arbitrary`: the graph construction retains the supplied map
through the canonical identity-upper-shriek identification. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (f : X ⟶ Y)
    (v : (pullback f).obj M ⟶ L) :
    (CohCorr.graph f v).u = v ≫ (upperShriekIdIso X).inv.app L := sorry
/-- Test `TauCeti.EtaleDuality.comp_arbitrary_unit`: identity composition retains every u, after support transport. -/
example {X Y : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} (c : CohCorr L M) :
    Nonempty ((c.comp (CohCorr.id M)).SupportEquiv c) := sorry
/-- Test `TauCeti.EtaleDuality.comp_zero_morphism`: the actual mate composite is zero when one factor is zero. -/
example {X Y Z : Geo k} {L : Dbc Λ X} {M : Dbc Λ Y} {N : Dbc Λ Z}
    (c : CohCorr L M) (d : CohCorr M N) (h : c.u = 0) : (c.comp d).u = 0 := sorry
/-- Test `TauCeti.EtaleDuality.comp_two_identity_graphs`: the full correspondence, including u, is identified. -/
example {X : Geo k} (L : Dbc Λ X) :
    Nonempty (((CohCorr.id L).comp (CohCorr.id L)).SupportEquiv (CohCorr.id L)) := sorry


/-- SF.0 map on the diagonal fibre products induced by a self-correspondence map. -/
def CohCorr.fixedPushforwardMap {X Y : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (f : X ⟶ Y) (D : c.PushforwardData f f) (hD : D.IsAdmissible) :
    c.fixedLocus ⟶ (c.pushforward D hD).fixedLocus := sorry
lemma CohCorr.fixedPushforwardMap_proper {X Y : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (f : X ⟶ Y) (D : c.PushforwardData f f) (hD : D.IsAdmissible)
    [IsProper f.hom.left] [IsProper D.supportMap.hom.left] :
    IsProper (c.fixedPushforwardMap f D hD).hom.left := sorry
/-- EDC.1 proper dualizing pushforward on H0, for the induced proper map of fixed loci. -/
def CohCorr.fixedTracePushforward {X Y : Geo k} {L : Dbc Λ X} (c : CohCorr L L)
    (f : X ⟶ Y) (D : c.PushforwardData f f) (hD : D.IsAdmissible)
    [IsProper f.hom.left] [IsProper D.supportMap.hom.left] :
    dualizingCohomology (Λ := Λ) c.fixedLocus ⟶
      dualizingCohomology (Λ := Λ) (c.pushforward D hD).fixedLocus := sorry
/-- Varshavsky 1.2.5: full trace classes commute with a proper map of correspondences. -/
lemma CohCorr.trace_pushforward [IsSepClosed k] {X Y : Geo k} {L : Dbc Λ X}
    (c : CohCorr L L) (hL : HasFiniteTorAmplitude L) (f : X ⟶ Y)
    (D : c.PushforwardData f f) (hD : D.IsAdmissible)
    [IsProper f.hom.left] [IsProper D.supportMap.hom.left]
    (hfL : HasFiniteTorAmplitude ((lowerShriek f).obj L)) :
    c.fixedTracePushforward f D hD (c.trace hL) = (c.pushforward D hD).trace hfL := sorry

end Correspondences

section NumericalTraces
variable [IsSepClosed k] {E : Type u} [Field E] [Coefficients (k := k) E]
def CohCorr.actionOnCompactCohomology {X Y : Geo k} {L : Dbc E X} {M : Dbc E Y}
    (c : CohCorr L M) [IsProper c.left.hom.left] (q : ℤ) : compactCohomology q L ⟶ compactCohomology q M := sorry
lemma CohCorr.actionOnCompactCohomology_comp {X Y Z : Geo k} {L : Dbc E X} {M : Dbc E Y}
    {N : Dbc E Z} (c : CohCorr L M) (d : CohCorr M N) [IsProper c.left.hom.left]
    [IsProper d.left.hom.left] [IsProper (c.comp d).left.hom.left] (q : ℤ) :
    (c.comp d).actionOnCompactCohomology q = c.actionOnCompactCohomology q ≫ d.actionOnCompactCohomology q := sorry
instance CohCorr.id_leftProper {X : Geo k} (L : Dbc E X) : IsProper (CohCorr.id L).left.hom.left := by
  change IsProper (geoIdentity X).hom.left
  infer_instance
lemma CohCorr.actionOnCompactCohomology_id {X : Geo k} (L : Dbc E X) (q : ℤ) :
    (CohCorr.id L).actionOnCompactCohomology q = 𝟙 _ := sorry
/-- Bounded signed trace on all integer degrees, including negatively shifted complexes. -/
def alternatingCompactTrace {X : Geo k} {L : Dbc E X} (c : CohCorr L L)
    [IsProper c.left.hom.left] (S : Finset ℤ)
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q L)] : E :=
  ∑ q ∈ S, (-1 : E) ^ q * LinearMap.trace E _ (c.actionOnCompactCohomology q).hom
theorem lefschetz_verdier_formula {X : Geo k} {L : Dbc E X} [IsProper X.structural]
    (c : CohCorr L L) [IsProper c.left.hom.left] (hL : HasFiniteTorAmplitude L)
    (S : Finset ℤ) (hS : ∀ q, q ∉ S → IsZero (compactCohomology q L))
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q L)] (B : c.ComponentPartition) :
    alternatingCompactTrace c S = ∑ a, c.localTerm hL (B.component a) := sorry
/-- Existence of a finite proper component partition follows from the properness hypotheses. -/
lemma proper_correspondence_components {X : Geo k} {L : Dbc E X} [IsProper X.structural]
    (c : CohCorr L L) [IsProper c.left.hom.left] : Nonempty c.ComponentPartition := sorry
/-- Localization is compatible with the actual correspondence actions; the signed
trace of the exact triangle is additive, including negative shifts. -/
lemma correspondence_trace_localization {X U Z : Geo k} {L : Dbc E X}
    (c : CohCorr L L) [IsProper c.left.hom.left]
    (j : U ⟶ X) [IsOpenImmersion j.hom.left] (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (hcomp : Set.range j.hom.left.base = (Set.range i.hom.left.base)ᶜ)
    (hi : c.Invariant (Set.range i.hom.left.base))
    [IsProper (c.restrictOpen j).left.hom.left] [IsProper (c.restrictClosed i hi).left.hom.left]
    (S : Finset ℤ)
    (hX : ∀ q, q ∉ S → IsZero (compactCohomology q L))
    (hU : ∀ q, q ∉ S → IsZero (compactCohomology q ((pullback j).obj L)))
    (hZ : ∀ q, q ∉ S → IsZero (compactCohomology q ((pullback i).obj L)))
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q L)]
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q ((pullback j).obj L))]
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q ((pullback i).obj L))] :
    alternatingCompactTrace c S = alternatingCompactTrace (c.restrictOpen j) S +
      alternatingCompactTrace (c.restrictClosed i hi) S := sorry
/-- Arbitrary stalk endomorphism at the point, with the actual induced maps in every degree. -/
def pointStalkEnd {X : Geo k} {L : Dbc E X} (g : X ⟶ X) (v : (pullback g).obj L ⟶ L)
    (x : basePoint k ⟶ X) (hfixed : x ≫ g = x) (q : ℤ) :
    cohomology q ((pullback x).obj L) ⟶ cohomology q ((pullback x).obj L) :=
  (globalCohomologyFunctor _ q).map (fixedPointEndomorphism g v x hfixed)
def naiveLocalTerm {X : Geo k} {L : Dbc E X} (g : X ⟶ X) (v : (pullback g).obj L ⟶ L)
    (x : basePoint k ⟶ X) (hfixed : x ≫ g = x) (S : Finset ℤ)
    [∀ q : ℤ, FiniteDimensional E (cohomology q ((pullback x).obj L))] : E :=
  ∑ q ∈ S, (-1 : E) ^ q * LinearMap.trace E _ (pointStalkEnd g v x hfixed q).hom
/-- Scheme automorphism order is equality of scheme morphisms. The isolated component
is an actual rational reduced point, not merely a scheme with one underlying point. -/
theorem local_terms_finite_order [IsAlgClosed k] {X : Geo k} {L : Dbc E X}
    (g : X ≅ X) (n : ℕ) (hn : 0 < n) (hunit : IsUnit (n : k))
    (hg : (CategoryTheory.End.of g.hom) ^ n = (1 : CategoryTheory.End X))
    (v : (pullback g.hom).obj L ⟶ L) (hL : HasFiniteTorAmplitude L)
    (β : (CohCorr.graph g.hom v).ProperComponent) (e : basePoint k ≅ β.space)
    (x : basePoint k ⟶ X) (hfixed : x ≫ g.hom = x)
    (hx : e.hom ≫ β.inclusion ≫ fiberProductFst (CohCorr.graph g.hom v).pair
      (relativeDiagonal X) ≫ (CohCorr.graph g.hom v).right = x)
    (S : Finset ℤ) (hS : ∀ q, q ∉ S → IsZero (cohomology q ((pullback x).obj L)))
    [∀ q : ℤ, FiniteDimensional E (cohomology q ((pullback x).obj L))] :
    (CohCorr.graph g.hom v).localTerm hL β = naiveLocalTerm g.hom v x hfixed S := sorry
/-- Test `TauCeti.EtaleDuality.trace_negative_shift_sign`: odd negative degrees contribute a minus sign. -/
example : (-1 : E) ^ (-1 : ℤ) = -1 := sorry
/-- Test `TauCeti.EtaleDuality.trace_empty_fixedLocus`: the trace class is zero on the empty fixed scheme. -/
example {X : Geo k} {L : Dbc E X} (c : CohCorr L L) (hL : HasFiniteTorAmplitude L)
    [IsEmpty c.fixedLocus.space] : c.trace hL = 0 := sorry
/-- Test `TauCeti.EtaleDuality.localTerm_isolated_identity`: arbitrary endomorphism of a point complex. -/
example (L : Dbc E (basePoint k)) (v : (pullback (geoIdentity _)).obj L ⟶ L)
    (hL : HasFiniteTorAmplitude L) (β : (CohCorr.graph (geoIdentity _) v).ProperComponent)
    (e : β.space ≅ basePoint k)
    [IsProper (CohCorr.graph (geoIdentity (basePoint k)) v).left.hom.left] (S : Finset ℤ)
    (hS : ∀ q, q ∉ S → IsZero (compactCohomology q L))
    [∀ q : ℤ, FiniteDimensional E (compactCohomology q L)] :
    (CohCorr.graph (geoIdentity _) v).localTerm hL β = alternatingCompactTrace (CohCorr.graph (geoIdentity _) v) S := sorry
end NumericalTraces

section ReciprocalPolynomials
variable {F V W : Type*} [Field F] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W] [FiniteDimensional F V] [FiniteDimensional F W]
/-- P_phi(t) = det(1 − t phi), expressed as the reverse of the characteristic polynomial. -/
def determinantPolynomial (φ : V ≃ₗ[F] V) : Polynomial F := φ.toLinearMap.charpoly.reverse
lemma determinantPolynomial_eval (φ : V ≃ₗ[F] V) (t : F) :
    (determinantPolynomial φ).eval t = LinearMap.det (LinearMap.id - t • φ.toLinearMap) := sorry
/-- The full reciprocal identity and determinant identity, without diagonalizability. -/
theorem similitude_reciprocal_charpoly (B : V →ₗ[F] W →ₗ[F] F) [B.IsPerfPair]
    (φ : V ≃ₗ[F] V) (ψ : W ≃ₗ[F] W) (c : F) (hc : c ≠ 0)
    (h : ∀ v w, B (φ v) (ψ w) = c * B v w) :
    LinearMap.det φ.toLinearMap * LinearMap.det ψ.toLinearMap = c ^ Module.finrank F V ∧
    ∀ t : F, t ≠ 0 → (determinantPolynomial ψ).eval t =
      (-c * t) ^ Module.finrank F V / LinearMap.det φ.toLinearMap *
        (determinantPolynomial φ).eval (1 / (c * t)) := sorry
/-- Algebraic multiplicities are dimensions of generalized eigenspaces, not eigenspaces. -/
def generalizedMultiplicity (φ : V ≃ₗ[F] V) (α : F) : ℕ :=
  Module.finrank F (Module.End.genEigenspace φ.toLinearMap α ⊤)
lemma similitude_generalized_multiplicity [IsAlgClosed F]
    (B : V →ₗ[F] W →ₗ[F] F) [B.IsPerfPair] (φ : V ≃ₗ[F] V) (ψ : W ≃ₗ[F] W)
    (c α : F) (hc : c ≠ 0) (hα : α ≠ 0) (h : ∀ v w, B (φ v) (ψ w) = c * B v w) :
    generalizedMultiplicity φ α = generalizedMultiplicity ψ (c / α) := sorry
theorem middle_degree_determinant [CharZero F] (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (φ : V ≃ₗ[F] V) (c : F) (hc : c ≠ 0)
    (h : ∀ v w, B (φ v) (φ w) = c * B v w) :
    (LinearMap.det φ.toLinearMap) ^ 2 = c ^ Module.finrank F V ∧
    (B.IsAlt → ∃ m : ℕ, Module.finrank F V = 2 * m ∧ LinearMap.det φ.toLinearMap = c ^ m) := sorry
lemma middle_symmetric_determinant_sign [CharZero F] [IsAlgClosed F]
    (B : LinearMap.BilinForm F V) (hB : B.Nondegenerate) (hsym : B.IsSymm)
    (φ : V ≃ₗ[F] V) (c μ : F) (hc : c ≠ 0) (hμ : μ ^ 2 = c)
    (h : ∀ v w, B (φ v) (φ w) = c * B v w) :
    LinearMap.det φ.toLinearMap = (-1 : F) ^ generalizedMultiplicity φ (-μ) *
      μ ^ Module.finrank F V := sorry
lemma middle_alternating_multiplicities [CharZero F] [IsAlgClosed F]
    (B : LinearMap.BilinForm F V) (hB : B.Nondegenerate) (halt : B.IsAlt)
    (φ : V ≃ₗ[F] V) (c μ : F) (hc : c ≠ 0) (hμ : μ ^ 2 = c)
    (h : ∀ v w, B (φ v) (φ w) = c * B v w) :
    Even (generalizedMultiplicity φ μ) ∧ Even (generalizedMultiplicity φ (-μ)) := sorry
/-- Test `TauCeti.EtaleDuality.reciprocity_rank_one`. -/
example (a c t : F) (ha : a ≠ 0) (hc : c ≠ 0) (ht : t ≠ 0) :
    1 - t * (c / a) = (-c * t) / a * (1 - a / (c * t)) := by sorry
/-- Test `TauCeti.EtaleDuality.middle_nonsplit_quadric_sign`: the two ruling eigenvalues q and −q. -/
example (q : F) : q * (-q) = -(q ^ 2) := sorry
/-- Test `TauCeti.EtaleDuality.reciprocity_nonsemisimple`: a Jordan block is allowed. -/
example (a t : F) :
    Matrix.det (1 - t • (!![a, 1; 0, a] : Matrix (Fin 2) (Fin 2) F)) = (1 - t * a) ^ 2 := sorry
end ReciprocalPolynomials

section FrobeniusExport
variable [Finite k] {E : Type u} [Field E] [CharZero E] [RationalDatum (k := k) E]
/-- Geometric Frobenius on the actual base change X_0 ×_k kbar, supplied by EDC.2 pairings. -/
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
abbrev frobeniusPolynomial (X0 : Geo k) (i : ℤ) := determinantPolynomial (geometricFrobenius (E := E) X0 i)
abbrev bettiNumber (X0 : Geo k) (i : ℤ) := Module.finrank E (H E (geometricBaseChange X0) i 0)
def eulerCharacteristic (X0 : Geo k) (d : ℕ) : ℤ :=
  ∑ i ∈ Finset.range (2 * d + 1), (-1 : ℤ) ^ i * (bettiNumber (E := E) X0 i : ℤ)
def frobeniusDelta (X0 : Geo k) (d : ℕ) : E :=
  ∏ i ∈ Finset.range (2 * d + 1), LinearMap.det (geometricFrobenius (E := E) X0 i).toLinearMap ^
    ((-1 : ℤ) ^ (i + 1))
theorem poincare_pairing_reciprocity {X0 : Geo k} (d : ℕ) [IsProper X0.structural]
    [SmoothOfRelativeDimension d X0.structural] (i : ℕ) (hi : i ≤ 2 * d) :
    LinearMap.det (geometricFrobenius (E := E) X0 i).toLinearMap *
      LinearMap.det (geometricFrobenius (E := E) X0 (2 * d - i)).toLinearMap =
      (Nat.card k : E) ^ (d * bettiNumber (E := E) X0 i) ∧
    ∀ t : E, t ≠ 0 → (frobeniusPolynomial (E := E) X0 (2 * d - i)).eval t =
      (-(Nat.card k : E) ^ d * t) ^ bettiNumber (E := E) X0 i /
        LinearMap.det (geometricFrobenius (E := E) X0 i).toLinearMap *
          (frobeniusPolynomial (E := E) X0 i).eval (1 / ((Nat.card k : E) ^ d * t)) := sorry
lemma frobenius_delta_squared {X0 : Geo k} (d : ℕ) [IsProper X0.structural]
    [SmoothOfRelativeDimension d X0.structural] :
    frobeniusDelta (E := E) X0 d ^ 2 = (Nat.card k : E) ^ (-(d : ℤ) * eulerCharacteristic (E := E) X0 d) := sorry
/-- Test `TauCeti.EtaleDuality.delta_projective_line`: Δ=q^{-1}, so its square has exponent −2. -/
example {X0 : Geo k} (e : X0 ≅ projectiveSpace k 1) :
    frobeniusDelta (E := E) X0 1 = (Nat.card k : E)⁻¹ := sorry
/-- EDC.3 cup/Gysin columns after geometric base change and the chosen Tate trivialization. -/
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
end FrobeniusExport
end TauCeti.EtaleDuality
