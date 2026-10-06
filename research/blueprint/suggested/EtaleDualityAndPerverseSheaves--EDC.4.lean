/-
Suggested Lean forms for EtaleDualityAndPerverseSheaves, part EDC.4
(stages EDC.4, EDC.5, EDC.6, EDC.7, EDC.8).

Independent review REV-EtaleDualityAndPerverseSheaves--EDC.4: NEEDS CHANGES.
The review report records the remaining mathematical and signature blockers. Elaboration
checks the types of admitted declarations; it does not certify their source agreement.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.4.md` and the blueprint packet
`research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json` require the corrections
and reconciliation recorded in the independent review; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised (every packet node has
implementationStatus "unchecked"). Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names. API items and unit tests are proposed below under the names of the original packet
(namespace `TauCeti.EtaleDuality`); unit tests are `example`s whose docstring reads "Test `<name>`".
Named theorems carry the packet node slug in their docstring. Some statements are typed in a
simplified form. The review identifies forms that are weaker than the packet, omit essential
hypotheses, or need replacement; these must not be treated as faithful target signatures.

Carriers. As in part EDC.0, the étale derived category is Mathlib's `DerivedCategory` of
`Sheaf X.smallEtaleTopology (ModuleCat Λ)`, and t-structures are Mathlib's `TStructure`. The
operations owned by part EDC.0 and by CohomologicalPointCounting (f^*, Rf_*, Rf_!, f^!, Verdier
duality, Tate twists, cohomology groups, Gysin maps), the bounded constructible category D^b_c, the
ℓ-adic categories and the Weil II weights (DeligneWeightsAndPurity DWP.8) are not in the pinned
libraries. Section `Imported` gives them as data stand-ins with `sorry` bodies, so that the
signatures typecheck; they are replaced by the definitions of their owners. No missing condition is
replaced by a `Prop`-valued stand-in: the weight conditions are defined from the imported
pointwise-weight data exactly as in BBD 5.1.8.
-/

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
import Mathlib.CategoryTheory.Sites.Point.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
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
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.DiscreteValuationRing.Basic

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Triangulated AlgebraicGeometry

universe u

attribute [local instance] HasDerivedCategory.standard

set_option linter.unusedVariables false
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

/-- Test `homologyZero_zero`. -/
example (X : C) (hX : IsZero X) : IsZero ((TStructure.homologyZero t).obj X) := sorry

/-- Test `homologyZero_shift_ne`: for the canonical t-structure on `D(A)` and `A ≠ 0` in `A`,
`H⁰_t(A[1]) = 0` while `H⁰_t(A) ≅ A`. -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (M : A) (hM : ¬ IsZero M) :
    IsZero ((TStructure.homologyZero (DerivedCategory.TStructure.t (C := A))).obj
      (((DerivedCategory.singleFunctor A 0).obj M)⟦(1 : ℤ)⟧)) ∧
    ¬ IsZero ((TStructure.homologyZero (DerivedCategory.TStructure.t (C := A))).obj
      ((DerivedCategory.singleFunctor A 0).obj M)) := sorry

/-- Test `homologyZero_canonical`: for the canonical t-structure on `D(A)`, `H⁰_t` composed with
the inclusion of the heart computes the usual homology in degree 0 (up to the identification of
the heart with `A`). -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (K : DerivedCategory A) :
    IsZero ((TStructure.homologyZero (DerivedCategory.TStructure.t (C := A))).obj K) ↔
      IsZero ((DerivedCategory.homologyFunctor A 0).obj K) := sorry

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
    (hS : Functor.IsRightTExact S t₂ t₃) : Functor.IsRightTExact (T ⋙ S) t₁ t₃ :=
  fun X hX => hS _ (hT X hX)

lemma Functor.IsLeftTExact.comp {T : C₁ ⥤ C₂} {S : C₂ ⥤ C₃} {t₁ : TStructure C₁}
    {t₂ : TStructure C₂} {t₃ : TStructure C₃} (hT : Functor.IsLeftTExact T t₁ t₂)
    (hS : Functor.IsLeftTExact S t₂ t₃) : Functor.IsLeftTExact (T ⋙ S) t₁ t₃ :=
  fun X hX => hS _ (hT X hX)

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

/-- Test `isTExact_id`. -/
example (t : TStructure C₁) : Functor.IsTExact (𝟭 C₁) t t := sorry

/-- Test `isRightTExact_shift_one`. -/
example (t : TStructure C₁) : Functor.IsRightTExact (shiftFunctor C₁ (1 : ℤ)) t t := sorry

/-- Test `not_isLeftTExact_shift_one`. -/
example {A : Type u} [Category.{u} A] [Abelian A] [HasDerivedCategory.{u} A] (M : A) (hM : ¬ IsZero M) :
    ¬ Functor.IsLeftTExact (shiftFunctor (DerivedCategory A) (1 : ℤ))
      (DerivedCategory.TStructure.t (C := A)) (DerivedCategory.TStructure.t (C := A)) := sorry

/-- Test `isTExact_canonical_exactFunctor`. -/
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
    Pretriangulated.Triangle D := sorry

/-- The functorial triangle `i_*i^!K → K → j_*j^*K →`. -/
def Recollement.triangleUpperShriek (R : Recollement D_F D D_U) (K : D) :
    Pretriangulated.Triangle D := sorry

lemma Recollement.upperStar_lowerShriek_eq_zero (R : Recollement D_F D D_U) :
    IsZero (R.jLowerShriek ⋙ R.iUpperStar) ∧ IsZero (R.jLowerStar ⋙ R.iUpperShriek) := sorry

open CategoryTheory.Pretriangulated.Opposite in
/-- The opposite recollement exchanges `j_!` with `j_*` and `i^*` with `i^!`. -/
def Recollement.op [IsTriangulated D_F] [IsTriangulated D] [IsTriangulated D_U]
    (R : Recollement D_F D D_U) : Recollement D_Fᵒᵖ Dᵒᵖ D_Uᵒᵖ := sorry

/-- Test `not_recollement_without_adjoints`: the left adjoint `i^*` alone does not determine a
recollement — a recollement structure carries both adjoints of `i_*` and of `j^*`, and two
recollements with the same `i_*`, `j^*` have isomorphic `i^!`. -/
example (R R' : Recollement D_F D D_U) (h₁ : R.iLowerStar = R'.iLowerStar) :
    Nonempty (R.iUpperShriek ≅ R'.iUpperShriek) := sorry

variable [IsTriangulated D_F] [IsTriangulated D] [IsTriangulated D_U]

/-- Named theorem `EDC.5/glued-t-structure` (BBD 1.4.10): the glued t-structure. -/
def Recollement.glue (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U) :
    TStructure D := sorry

lemma Recollement.glue_le_iff (R : Recollement D_F D D_U) (tF : TStructure D_F)
    (tU : TStructure D_U) (K : D) :
    (R.glue tF tU).IsLE K 0 ↔ tU.IsLE (R.jUpperStar.obj K) 0 ∧ tF.IsLE (R.iUpperStar.obj K) 0 := sorry

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
    IsZero (R.jUpperStar.obj A.obj) := sorry

/-- Test `intermediateExtension_simple`. -/
example (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U)
    (S : tU.heart.FullSubcategory) [Simple S] : Simple ((R.intermediateExtension tF tU).obj S) :=
  sorry

/-- Test `intermediateExtension_empty_closed`: if `D_F = 0`, `j^*` is an equivalence on hearts
and `j_!*` is its inverse. -/
example (R : Recollement D_F D D_U) (tF : TStructure D_F) (tU : TStructure D_U)
    (h : ∀ X : D_F, IsZero X) : (R.intermediateExtension tF tU).IsEquivalence := sorry

end Recollement

/-! ## Imported carriers and operations (owners: part EDC.0, CohomologicalPointCounting through
SchemeAndStackFoundations SF.2, DeligneWeightsAndPurity DWP.8). Data stand-ins with `sorry`. -/

section Imported

variable (Λ : Type u) [CommRing Λ]

/-- Étale sheaves of `Λ`-modules (as in part EDC.0). -/
abbrev EtaleSheaf (X : Scheme.{u}) : Type (u + 1) :=
  Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)

/-- `D(X_ét, Λ)` (as in part EDC.0). -/
abbrev EtaleDerived (X : Scheme.{u}) := DerivedCategory (EtaleSheaf Λ X)

/-- Stand-in for the bounded constructible category `D^b_c(X, Λ)` (EDC.0/constructible-ctf-complexes;
for `Λ = O_E` or `E` the ℓ-adic category of EDC.6/classical-and-proetale-adic-categories). -/
def Dbc (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := sorry

instance (X : Scheme.{u}) : Category.{u} (Dbc Λ X) := sorry
instance (X : Scheme.{u}) : Preadditive (Dbc Λ X) := sorry
instance (X : Scheme.{u}) : HasZeroObject (Dbc Λ X) := sorry
instance (X : Scheme.{u}) : HasShift (Dbc Λ X) ℤ := sorry
instance (X : Scheme.{u}) (n : ℤ) : (shiftFunctor (Dbc Λ X) n).Additive := sorry
instance (X : Scheme.{u}) : Pretriangulated (Dbc Λ X) := sorry
instance (X : Scheme.{u}) : IsTriangulated (Dbc Λ X) := sorry

variable {Λ}

/-- Stand-in: `f^*` on constructible complexes. -/
def pullback {X Y : Scheme.{u}} (f : X ⟶ Y) : Dbc Λ Y ⥤ Dbc Λ X := sorry
/-- Stand-in: `Rf_*`. -/
def pushforward {X Y : Scheme.{u}} (f : X ⟶ Y) : Dbc Λ X ⥤ Dbc Λ Y := sorry
/-- Stand-in: `Rf_!`. -/
def lowerShriek {X Y : Scheme.{u}} (f : X ⟶ Y) [IsSeparated f] [LocallyOfFiniteType f] :
    Dbc Λ X ⥤ Dbc Λ Y := sorry
/-- Stand-in: `f^!` (EDC.1:adjoint/exceptional-inverse-image). -/
def upperShriek {X Y : Scheme.{u}} (f : X ⟶ Y) [IsSeparated f] [LocallyOfFiniteType f] :
    Dbc Λ Y ⥤ Dbc Λ X := sorry
/-- Stand-in: Verdier duality `D_X` (EDC.1:adjoint/verdier-dual). -/
def verdierDual (X : Scheme.{u}) : (Dbc Λ X)ᵒᵖ ⥤ Dbc Λ X := sorry
/-- Stand-in: the Tate twist `K ↦ K(m)` (EDC.0/tate-twist). -/
def twist (X : Scheme.{u}) (m : ℤ) : Dbc Λ X ⥤ Dbc Λ X := sorry
/-- Stand-in: the constant sheaf `Λ_X` in degree 0. -/
def constant (X : Scheme.{u}) : Dbc Λ X := sorry
/-- Stand-in: `H^q(X, K)`. -/
def cohomology {X : Scheme.{u}} (q : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
/-- Stand-in: `H^q_c(X, K)`. -/
def compactCohomology {X : Scheme.{u}} (q : ℤ) (K : Dbc Λ X) : ModuleCat.{u} Λ := sorry
/-- Stand-in: restriction `f^* : H^q(Y, K) → H^q(X, f^*K)`. -/
def restriction {X Y : Scheme.{u}} (f : X ⟶ Y) (q : ℤ) (K : Dbc Λ Y) :
    cohomology q K ⟶ cohomology q ((pullback f).obj K) := sorry
/-- Stand-in: the Gysin map `i_* : H^q(Z, Λ(m)) → H^{q+2c}(X, Λ(m+c))` of a closed immersion of
codimension `c` between smooth schemes (EDC.3/gysin-map). -/
def gysin {Z X : Scheme.{u}} (i : Z ⟶ X) (c : ℕ) (q m : ℤ) :
    cohomology q ((twist Z m).obj (constant (Λ := Λ) Z)) ⟶
      cohomology (q + 2 * c) ((twist X (m + c)).obj (constant (Λ := Λ) X)) := sorry
/-- Stand-in: the proper pushforward (trace) `π_* : H^q(X', Λ) → H^q(X, Λ)` for a proper map
between smooth schemes of the same dimension (EDC.3/gysin-map). -/
def properPushforward {X' X : Scheme.{u}} (π : X' ⟶ X) (q : ℤ) :
    cohomology q (constant (Λ := Λ) X') ⟶ cohomology q (constant (Λ := Λ) X) := sorry

/-- The perverse t-structure is introduced below; the geometric point and dimension data it uses: -/
structure GeomPoint (X : Scheme.{u}) where
  /-- separably closed field -/
  Ω : Type u
  [field : Field Ω]
  [sepClosed : IsSepClosed Ω]
  /-- the geometric point -/
  pt : Spec (CommRingCat.of Ω) ⟶ X

attribute [instance] GeomPoint.field GeomPoint.sepClosed

/-- Stand-in: the stalk `ℋ^j(K)_x̄` at a geometric point. -/
def stalkCohomology {X : Scheme.{u}} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) :
    ModuleCat.{u} Λ := sorry

/-- `dim(x)`: the Krull dimension of the closure of the image point of `x̄`. -/
def GeomPoint.dim {X : Scheme.{u}} (x : GeomPoint X) : WithBot ℕ∞ :=
  topologicalKrullDim (closure ({x.pt.base (IsLocalRing.closedPoint x.Ω)} : Set X))

end Imported

/-! ## EDC.5 — the perverse t-structure, perverse sheaves and intersection complexes -/

section Perverse

variable {Λ : Type u} [CommRing Λ]

/-- The étale recollement for `Z ⊂ X` closed with open complement `U`. -/
def Recollement.ofClosedOpen {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X)
    [IsOpenImmersion j] (h : Set.range j.base = (Set.range i.base)ᶜ) :
    Recollement (Dbc Λ Z) (Dbc Λ X) (Dbc Λ U) := sorry

/-- Test `recollement_ofClosedOpen_empty`. -/
example {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j]
    (h : Set.range j.base = (Set.range i.base)ᶜ) [IsEmpty Z] :
    (Recollement.ofClosedOpen (Λ := Λ) i j h).jUpperStar.IsEquivalence := sorry

/-- Test `recollement_ofClosedOpen_upperStar`. -/
example {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j]
    (h : Set.range j.base = (Set.range i.base)ᶜ) :
    Nonempty ((Recollement.ofClosedOpen (Λ := Λ) i j h).jUpperStar ≅ pullback j) := sorry

/-- Test `recollement_triangle_point`: the triangle `j_!Λ_U → Λ_X → i_*Λ_Z →` is distinguished. -/
example {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j]
    (h : Set.range j.base = (Set.range i.base)ᶜ) :
    (Recollement.ofClosedOpen (Λ := Λ) i j h).triangleLowerShriek (constant X) ∈ distTriang _ :=
  sorry

variable (Λ) in
/-- The middle perverse t-structure on `D^b_c(X, Λ)` (node `EDC.5/perverse-t-structure`). -/
def perverseTStructure (X : Scheme.{u}) : TStructure (Dbc Λ X) := sorry

lemma perverseTStructure_le_iff {X : Scheme.{u}} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsLE K 0 ↔ ∀ (x : GeomPoint X) (j : ℤ) (d : ℕ),
      x.dim = d → 0 < j + d → IsZero (stalkCohomology x j K) := sorry

lemma perverseTStructure_ge_iff_verdierDual {Λ : Type u} [Field Λ] {X : Scheme.{u}} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsGE K 0 ↔
      (perverseTStructure Λ X).IsLE ((verdierDual X).obj (Opposite.op K)) 0 := sorry

lemma perverseTStructure_bounded {X : Scheme.{u}} (K : Dbc Λ X) :
    ∃ a b : ℤ, (perverseTStructure Λ X).IsGE K a ∧ (perverseTStructure Λ X).IsLE K b := sorry

lemma perverseTStructure_restrict_etale {V X : Scheme.{u}} (f : V ⟶ X) [Etale f] :
    Functor.IsTExact (pullback (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ V) := sorry

lemma perverseTStructure_glue {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X)
    [IsOpenImmersion j] (h : Set.range j.base = (Set.range i.base)ᶜ) :
    perverseTStructure Λ X =
      (Recollement.ofClosedOpen i j h).glue (perverseTStructure Λ Z) (perverseTStructure Λ U) := sorry

/-- The geometric point `Spec Ω → Spec Ω`. -/
def GeomPoint.self (Ω : Type u) [Field Ω] [IsSepClosed Ω] : GeomPoint (Spec (CommRingCat.of Ω)) :=
  { Ω := Ω, pt := 𝟙 _ }

lemma perverseTStructure_point (Ω : Type u) [Field Ω] [IsSepClosed Ω]
    (K : Dbc Λ (Spec (CommRingCat.of Ω))) :
    (perverseTStructure Λ _).IsLE K 0 ↔
      ∀ j : ℤ, 0 < j → IsZero (stalkCohomology (GeomPoint.self Ω) j K) := sorry

/-- Test `perverse_point_eq_canonical` (the `≥ 0` half). -/
example (Ω : Type u) [Field Ω] [IsSepClosed Ω] (K : Dbc Λ (Spec (CommRingCat.of Ω))) :
    (perverseTStructure Λ _).IsGE K 0 ↔
      ∀ j : ℤ, j < 0 → IsZero (stalkCohomology (GeomPoint.self Ω) j K) := sorry

/-- Named theorem `EDC.5/lisse-shift-is-perverse`, for the constant sheaf: `Λ_X[d]` is perverse
on `X` smooth of relative dimension `d` over a field. -/
theorem lisse_shift_isPerverse {k : Type u} [Field k] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (d : ℕ) [SmoothOfRelativeDimension d a] :
    (perverseTStructure Λ X).heart ((shiftFunctor (Dbc Λ X) (d : ℤ)).obj (constant X)) := sorry

/-- Test `perverse_curve_constant_shift`. -/
example {k : Type u} [Field k] [IsSepClosed k] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] :
    (perverseTStructure Λ X).heart ((shiftFunctor (Dbc Λ X) (1 : ℤ)).obj (constant X)) := sorry

/-- Test `perverse_empty`. -/
example {X : Scheme.{u}} [IsEmpty X] (K : Dbc Λ X) : IsZero K := sorry

/-- Test `not_perverse_curve_constant`. -/
example {k : Type u} [Field k] [IsSepClosed k] [Nontrivial Λ] {X : Scheme.{u}} [Nonempty X]
    (a : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 a] :
    ¬ (perverseTStructure Λ X).IsLE (constant X) 0 := sorry

variable (Λ) in
/-- Perverse sheaves (node `EDC.5/perverse-sheaves`). -/
abbrev PerverseSheaf (X : Scheme.{u}) := (perverseTStructure Λ X).heart.FullSubcategory

instance PerverseSheaf.abelian (X : Scheme.{u}) : Abelian (PerverseSheaf Λ X) :=
  TStructure.heartAbelian _

/-- Perverse cohomology `pH^n`. -/
def perverseCohomology {X : Scheme.{u}} (n : ℤ) : Dbc Λ X ⥤ PerverseSheaf Λ X :=
  TStructure.homology _ n

instance perverseCohomology_isHomological {X : Scheme.{u}} :
    (perverseCohomology (Λ := Λ) (X := X) 0).IsHomological := sorry

/-- Étale pullback of perverse sheaves (exact). -/
def PerverseSheaf.restrictEtale {V X : Scheme.{u}} (f : V ⟶ X) [Etale f] :
    PerverseSheaf Λ X ⥤ PerverseSheaf Λ V := sorry

/-- Separatedness half of the stack property: morphisms are determined étale-locally. -/
lemma PerverseSheaf.hom_isSheaf {V X : Scheme.{u}} (f : V ⟶ X) [Etale f] [Surjective f]
    {K L : PerverseSheaf Λ X} (g g' : K ⟶ L)
    (h : (PerverseSheaf.restrictEtale f).map g = (PerverseSheaf.restrictEtale f).map g') : g = g' :=
  sorry

/-- Conservativity of étale-surjective pullback on perverse sheaves (used to glue objects). -/
lemma PerverseSheaf.isIso_of_restrictEtale {V X : Scheme.{u}} (f : V ⟶ X) [Etale f] [Surjective f]
    {K L : PerverseSheaf Λ X} (g : K ⟶ L) [IsIso ((PerverseSheaf.restrictEtale f).map g)] :
    IsIso g := sorry

/-- Test `perverseSheaf_skyscraper`: the skyscraper at a closed point, `i_*Λ`, is perverse. -/
example {X : Scheme.{u}} {k : Type u} [Field k] (i : Spec (CommRingCat.of k) ⟶ X) [IsClosedImmersion i] :
    (perverseTStructure Λ X).heart ((pushforward i).obj (constant _)) := sorry

/-- Test `perverseSheaf_empty`. -/
example {X : Scheme.{u}} [IsEmpty X] (P : PerverseSheaf Λ X) : IsZero P := sorry

/-- Test `perverseSheaf_point`: over `Spec Ω` a perverse sheaf has cohomology in degree 0 only. -/
example (Ω : Type u) [Field Ω] [IsSepClosed Ω] (P : PerverseSheaf Λ (Spec (CommRingCat.of Ω)))
    (j : ℤ) (hj : j ≠ 0) : IsZero (stalkCohomology (GeomPoint.self Ω) j P.obj) := sorry

/-- Test `not_perverse_constant_surface`. -/
example {k : Type u} [Field k] [IsSepClosed k] [Nontrivial Λ] {X : Scheme.{u}} [Nonempty X]
    (a : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 2 a] :
    ¬ (perverseTStructure Λ X).heart ((shiftFunctor (Dbc Λ X) (1 : ℤ)).obj (constant X)) := sorry

/-- The perverse sheaf `Λ_X[d]` on `X` smooth of relative dimension `d` over a field. -/
def constantPerverse {k : Type u} [Field k] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k))
    (d : ℕ) [SmoothOfRelativeDimension d a] : PerverseSheaf Λ X :=
  ⟨(shiftFunctor (Dbc Λ X) (d : ℤ)).obj (constant X), lisse_shift_isPerverse a d⟩

/-- Named theorem `EDC.5/perverse-recollement` (exactness part). -/
theorem perverse_recollement {Z X U : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (j : U ⟶ X)
    [IsOpenImmersion j] [IsSeparated j] [LocallyOfFiniteType j]
    (h : Set.range j.base = (Set.range i.base)ᶜ) :
    Functor.IsRightTExact (lowerShriek (Λ := Λ) j) (perverseTStructure Λ U) (perverseTStructure Λ X) ∧
    Functor.IsLeftTExact (pushforward (Λ := Λ) j) (perverseTStructure Λ U) (perverseTStructure Λ X) ∧
    Functor.IsTExact (pushforward (Λ := Λ) i) (perverseTStructure Λ Z) (perverseTStructure Λ X) := sorry

/-- `pH⁰ ∘ j_!` on perverse sheaves. -/
def pLowerShriek {U X : Scheme.{u}} (j : U ⟶ X) [IsSeparated j] [LocallyOfFiniteType j] :
    PerverseSheaf Λ U ⥤ PerverseSheaf Λ X :=
  ObjectProperty.ι _ ⋙ lowerShriek j ⋙ perverseCohomology 0

/-- `pH⁰ ∘ Rj_*` on perverse sheaves. -/
def pLowerStar {U X : Scheme.{u}} (j : U ⟶ X) : PerverseSheaf Λ U ⥤ PerverseSheaf Λ X :=
  ObjectProperty.ι _ ⋙ pushforward j ⋙ perverseCohomology 0

/-- The forget-supports map `pj_! ⟶ pj_*`. -/
def pLowerShriekToLowerStar {U X : Scheme.{u}} (j : U ⟶ X) [IsSeparated j] [LocallyOfFiniteType j] :
    pLowerShriek (Λ := Λ) j ⟶ pLowerStar j := sorry

/-- Intermediate extension along an open immersion (node `EDC.5/intermediate-extension`). -/
def intermediateExtension {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] :
    PerverseSheaf Λ U ⥤ PerverseSheaf Λ X := sorry

lemma intermediateExtension_eq_image {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    [IsSeparated j] [LocallyOfFiniteType j] (A : PerverseSheaf Λ U) :
    Nonempty ((intermediateExtension j).obj A ≅ Limits.image ((pLowerShriekToLowerStar j).app A)) := sorry

lemma restrict_intermediateExtension {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] [Etale j]
    (A : PerverseSheaf Λ U) :
    Nonempty ((PerverseSheaf.restrictEtale j).obj ((intermediateExtension j).obj A) ≅ A) := sorry

lemma intermediateExtension_stalk_bound {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (A : PerverseSheaf Λ U) (x : GeomPoint X)
    (hx : x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.base) (i : ℤ) (d : ℕ)
    (hd : x.dim = d) (hi : -(d : ℤ) ≤ i) :
    IsZero (stalkCohomology x i ((intermediateExtension j).obj A).obj) := sorry

/-- Stand-in: geometric point costalk cohomology, including the generic-point limit. -/
def costalkCohomology {X : Scheme.{u}} (x : GeomPoint X) (j : ℤ) (K : Dbc Λ X) :
    ModuleCat.{u} Λ := sorry

lemma intermediateExtension_costalk_bound {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (A : PerverseSheaf Λ U) (x : GeomPoint X)
    (hx : x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.base) (d : ℕ) (i : ℤ)
    (hd : x.dim = d) (hi : i ≤ -(d : ℤ)) :
    IsZero (costalkCohomology x i ((intermediateExtension j).obj A).obj) := sorry

lemma intermediateExtension_fullyFaithful {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] :
    Nonempty (intermediateExtension (Λ := Λ) j).FullyFaithful := sorry

lemma intermediateExtension_comp {U V X : Scheme.{u}} (j₁ : U ⟶ V) (j₂ : V ⟶ X) [IsOpenImmersion j₁]
    [IsOpenImmersion j₂] :
    Nonempty (intermediateExtension (Λ := Λ) (j₁ ≫ j₂) ≅
      intermediateExtension j₁ ⋙ intermediateExtension j₂) := sorry

variable (Λ) in
/-- Stand-in: the standard t-structure on `D^b_c(X, Λ)` (restriction of Mathlib's canonical one). -/
def standardTStructure (X : Scheme.{u}) : TStructure (Dbc Λ X) := sorry

/-- One standard-truncation step requires a smooth closed stratum and an ordinary input bound. -/
lemma intermediateExtension_truncation_formula {k : Type u} [Field k] {Z U X : Scheme.{u}}
    (j : U ⟶ X) [IsOpenImmersion j] (i : Z ⟶ X) [IsClosedImmersion i]
    (e : ℕ) (aZ : Z ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension e aZ]
    (hcomp : Set.range j.base = (Set.range i.base)ᶜ) (A : PerverseSheaf Λ U)
    (hA : (standardTStructure Λ U).IsLE A.obj (-(e : ℤ) - 1)) :
    Nonempty (((intermediateExtension j).obj A).obj ≅
      ((standardTStructure Λ X).truncLE (-(e : ℤ) - 1)).obj ((pushforward j).obj A.obj)) := sorry

/-- Test `intermediateExtension_iso`. -/
example {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] [IsIso j] :
    (intermediateExtension (Λ := Λ) j).IsEquivalence := sorry

/-- Test `intermediateExtension_curve_constant`. -/
example {k : Type u} [Field k] [IsSepClosed k] {U X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] (j : U ⟶ X) [IsOpenImmersion j] [SmoothOfRelativeDimension 1 (j ≫ a)] :
    Nonempty ((intermediateExtension j).obj (constantPerverse (Λ := Λ) (j ≫ a) 1) ≅
      constantPerverse a 1) := sorry

/-- Test `intermediateExtension_kummer`: if `Rj_*A` has vanishing stalks on the complement (as for
a nontrivial Kummer local system on `𝔾_m ⊂ 𝔸¹`), then `j_!*A ≅ j_!A`. -/
example {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] [IsSeparated j] [LocallyOfFiniteType j]
    (A : PerverseSheaf Λ U)
    (h : ∀ (x : GeomPoint X), x.pt.base (IsLocalRing.closedPoint x.Ω) ∉ Set.range j.base →
      ∀ i : ℤ, IsZero (stalkCohomology x i ((pushforward j).obj A.obj))) :
    Nonempty (((intermediateExtension j).obj A).obj ≅ (lowerShriek j).obj A.obj) := sorry

/-- Test `not_intermediateExtension_eq_lowerShriek`. -/
example {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k] {U X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 a] (j : U ⟶ X) [IsOpenImmersion j]
    [IsSeparated j] [LocallyOfFiniteType j] [SmoothOfRelativeDimension 1 (j ≫ a)]
    (hZ : (Set.range j.base)ᶜ.Nonempty) :
    ¬ Nonempty (((intermediateExtension j).obj (constantPerverse (Λ := Λ) (j ≫ a) 1)).obj ≅
      (lowerShriek j).obj (constantPerverse (Λ := Λ) (j ≫ a) 1).obj) := sorry

/-- Test `intermediateExtension_ne_lowerShriek` (the étale instance of the abstract statement):
`pj_!(Λ[1]) ≇ j_!*(Λ[1])` for the complement of a point in a smooth curve. -/
example {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k] {U X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 a] (j : U ⟶ X) [IsOpenImmersion j]
    [IsSeparated j] [LocallyOfFiniteType j] [SmoothOfRelativeDimension 1 (j ≫ a)]
    (hZ : (Set.range j.base)ᶜ.Nonempty) :
    ¬ Nonempty ((intermediateExtension j).obj (constantPerverse (Λ := Λ) (j ≫ a) 1) ≅
      (pLowerShriek j).obj (constantPerverse (Λ := Λ) (j ≫ a) 1)) := sorry

/-- The intersection complex `IC_X(L) := j_!*(L[d])` (node `EDC.5/intersection-complex`), here for
`L` a perverse sheaf `L[d]` on the dense open smooth `U`. -/
/- Review blocker: the input must be a lisse sheaf shifted by the dimension, not an arbitrary perverse object. -/
def intersectionComplex {U X : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (L : PerverseSheaf Λ U) : PerverseSheaf Λ X :=
  (intermediateExtension j).obj L

lemma intersectionComplex_restrict {U' U X : Scheme.{u}} (j : U ⟶ X) (j' : U' ⟶ U) [IsOpenImmersion j]
    [IsOpenImmersion j'] [Etale j'] (L : PerverseSheaf Λ U) (hL : (Set.range j'.base).Nonempty) :
    Nonempty (intersectionComplex (j' ≫ j) ((PerverseSheaf.restrictEtale j').obj L) ≅
      intersectionComplex j L) := sorry

lemma intersectionComplex_of_smooth {k : Type u} [Field k] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (d : ℕ) [SmoothOfRelativeDimension d a] :
    Nonempty (intersectionComplex (𝟙 X) (constantPerverse (Λ := Λ) a d) ≅ constantPerverse a d) := sorry

/-- Stand-in: the underived direct image `j_*` of a sheaf, as a complex in degree 0. -/
def underivedPushforward {U X : Scheme.{u}} (j : U ⟶ X) : Dbc Λ U ⥤ Dbc Λ X := sorry

lemma intersectionComplex_curve {k : Type u} [Field k] {U X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 (𝟙 X ≫ a)] (j : U ⟶ X)
    [IsOpenImmersion j] [SmoothOfRelativeDimension 1 (j ≫ a)] :
    Nonempty ((intersectionComplex j (constantPerverse (Λ := Λ) (j ≫ a) 1)).obj ≅
      (shiftFunctor (Dbc Λ X) (1 : ℤ)).obj ((underivedPushforward j).obj (constant U))) := sorry

lemma intersectionComplex_simple {Λ : Type u} [Field Λ] {U X : Scheme.{u}} (j : U ⟶ X)
    [IsOpenImmersion j] (L : PerverseSheaf Λ U) [Simple L] : Simple (intersectionComplex j L) := sorry

lemma intersectionComplex_finite_birational {k : Type u} [Field k] {X' X U : Scheme.{u}}
    (ν : X' ⟶ X) [IsFinite ν] (a : X' ⟶ Spec (CommRingCat.of k)) (d : ℕ) [SmoothOfRelativeDimension d a]
    (j : U ⟶ X) [IsOpenImmersion j] (j' : U ⟶ X') [IsOpenImmersion j'] (hj : j' ≫ ν = j)
    [SmoothOfRelativeDimension d (j' ≫ a)] :
    Nonempty ((intersectionComplex j (constantPerverse (Λ := Λ) (j' ≫ a) d)).obj ≅
      (pushforward ν).obj (constantPerverse (Λ := Λ) a d).obj) := sorry

/-- Test `intersectionComplex_smoothCurve`. -/
example {k : Type u} [Field k] [IsSepClosed k] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] :
    Nonempty (intersectionComplex (𝟙 X) (constantPerverse (Λ := Λ) a 1) ≅ constantPerverse a 1) := sorry

/-- Test `intersectionComplex_nodalCurve` (stated for a finite birational map from a smooth curve;
for the nodal cubic, `ν : P¹ → X`). -/
example {k : Type u} [Field k] [IsSepClosed k] {X' X U : Scheme.{u}} (ν : X' ⟶ X) [IsFinite ν]
    (a : X' ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 a] (j : U ⟶ X)
    [IsOpenImmersion j] (j' : U ⟶ X') [IsOpenImmersion j'] (hj : j' ≫ ν = j)
    [SmoothOfRelativeDimension 1 (j' ≫ a)] :
    Nonempty ((intersectionComplex j (constantPerverse (Λ := Λ) (j' ≫ a) 1)).obj ≅
      (pushforward ν).obj (constantPerverse (Λ := Λ) a 1).obj) := sorry

/-- Test `intersectionComplex_cuspidalCurve`: if the normalization is a universal homeomorphism,
`IC_X ≅ Λ_X[1]`. -/
example {k : Type u} [Field k] [IsSepClosed k] {X' X U : Scheme.{u}} (ν : X' ⟶ X) [IsFinite ν]
    [UniversallyInjective ν] [Surjective ν] (a : X' ⟶ Spec (CommRingCat.of k))
    [SmoothOfRelativeDimension 1 a] (j : U ⟶ X) [IsOpenImmersion j] (j' : U ⟶ X') [IsOpenImmersion j']
    (hj : j' ≫ ν = j) [SmoothOfRelativeDimension 1 (j' ≫ a)] :
    Nonempty ((intersectionComplex j (constantPerverse (Λ := Λ) (j' ≫ a) 1)).obj ≅
      (shiftFunctor (Dbc Λ X) (1 : ℤ)).obj (constant X)) := sorry

/-- Test `not_intersectionComplex_nodal_constant`: when a closed point has two preimages under the
normalization, `Λ_X[1]` is not `IC_X`. -/
example {k : Type u} [Field k] [IsSepClosed k] [Nontrivial Λ] {X' X U : Scheme.{u}} (ν : X' ⟶ X)
    [IsFinite ν] (a : X' ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 a] (j : U ⟶ X)
    [IsOpenImmersion j] (j' : U ⟶ X') [IsOpenImmersion j'] (hj : j' ≫ ν = j)
    [SmoothOfRelativeDimension 1 (j' ≫ a)] (p q : X') (hpq : p ≠ q) (hν : ν.base p = ν.base q) :
    ¬ Nonempty ((intersectionComplex j (constantPerverse (Λ := Λ) (j' ≫ a) 1)).obj ≅
      (shiftFunctor (Dbc Λ X) (1 : ℤ)).obj (constant X)) := sorry

/-- Named theorem `EDC.5/simple-perverse-sheaves`: perverse sheaves have finite length. -/
theorem perverseSheaf_finite_length {Λ : Type u} [Field Λ] [Finite Λ] {X : Scheme.{u}}
    (P : PerverseSheaf Λ X) : IsArtinianObject P ∧ IsNoetherianObject P := sorry

/-- Named theorem `EDC.5/verdier-duality-perverse`. -/
theorem verdierDual_perverse {Λ : Type u} [Field Λ] {X : Scheme.{u}} (K : Dbc Λ X) :
    (perverseTStructure Λ X).IsLE K 0 ↔
      (perverseTStructure Λ X).IsGE ((verdierDual X).obj (Opposite.op K)) 0 := sorry

/-- Named theorem `EDC.5/affine-perverse-artin-vanishing`. -/
theorem affine_perverse_artin_vanishing {X Y : Scheme.{u}} (f : X ⟶ Y) [IsAffineHom f] :
    Functor.IsRightTExact (pushforward (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) :=
  sorry

/-- Named theorem `EDC.5/affine-perverse-artin-vanishing` (dual form). -/
theorem affine_perverse_artin_vanishing_shriek {X Y : Scheme.{u}} (f : X ⟶ Y) [IsAffineHom f]
    [IsSeparated f] [LocallyOfFiniteType f] :
    Functor.IsLeftTExact (lowerShriek (Λ := Λ) f) (perverseTStructure Λ X) (perverseTStructure Λ Y) :=
  sorry

/-- Named theorem `EDC.5/perverse-amplitude-estimates`, smooth case: `f^*[d]` is t-exact. -/
theorem smooth_pullback_shift_tExact {X Y : Scheme.{u}} (f : X ⟶ Y) (d : ℕ)
    [SmoothOfRelativeDimension d f] :
    Functor.IsTExact (pullback (Λ := Λ) f ⋙ shiftFunctor (Dbc Λ X) (d : ℤ))
      (perverseTStructure Λ Y) (perverseTStructure Λ X) := sorry

/-- Named theorem `EDC.5/generic-degree-concentration`. -/
theorem generic_degree_concentration {X : Scheme.{u}} (P : PerverseSheaf Λ X) (e : ℕ)
    (hsupp : ∀ (x : GeomPoint X) (i : ℤ), ¬ IsZero (stalkCohomology x i P.obj) → ∀ d : ℕ, x.dim = d → d ≤ e)
    (x : GeomPoint X) (hx : x.dim = e) (i : ℤ) (hi : i ≠ -(e : ℤ)) :
    IsZero (stalkCohomology x i P.obj) := sorry

/-- Named theorem `EDC.5/semismall-pushforward-perverse` (smooth source form): if every geometric
point `y` of `Y` with `dim(y) = b` has fibre dimension `d` with `b + 2d ≤ n`, then `Rf_*Λ_X[n]` is
perverse. -/
theorem semismall_pushforward_perverse {k : Type u} [Field k] {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsProper f] (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [SmoothOfRelativeDimension n a]
    (hsemi : ∀ (y : GeomPoint Y) (b d : ℕ), y.dim = b →
      topologicalKrullDim ↥(Limits.pullback f y.pt : Scheme.{u}) = d → b + 2 * d ≤ n) :
    (perverseTStructure Λ Y).heart ((pushforward f).obj (constantPerverse (Λ := Λ) a n).obj) := sorry

/-- Named theorem `EDC.5/small-map-intersection-complex`: if moreover the inequality is strict for
positive-dimensional fibres (`f` small), `Rf_*Λ_X[n]` is the intersection complex of its
restriction to a dense open `V`. -/
theorem small_map_intersectionComplex {k : Type u} [Field k] {X Y V : Scheme.{u}} (f : X ⟶ Y)
    [IsProper f] (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [SmoothOfRelativeDimension n a]
    (hsmall : ∀ (y : GeomPoint Y) (b d : ℕ), y.dim = b →
      topologicalKrullDim ↥(Limits.pullback f y.pt : Scheme.{u}) = d → 0 < d → b + 2 * d < n)
    (j : V ⟶ Y) [IsOpenImmersion j] (L : PerverseSheaf Λ V)
    (hL : Nonempty (L.obj ≅ (pullback j).obj ((pushforward f).obj (constantPerverse (Λ := Λ) a n).obj))) :
    Nonempty ((pushforward f).obj (constantPerverse (Λ := Λ) a n).obj ≅ (intersectionComplex j L).obj) :=
  sorry

/-- The integral middle perverse t-structure `p` on `D^b_c(X, O)` (node
`EDC.5/integral-perverse-torsion-pair`); `O` a discrete valuation ring. -/
def perverseIntegral (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (X : Scheme.{u}) : TStructure (Dbc O X) := perverseTStructure O X

/-- The dual t-structure `p⁺`. -/
def perversePlus (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (X : Scheme.{u}) : TStructure (Dbc O X) := sorry

section Integral

variable {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] {X : Scheme.{u}}

/-- `pH^n` for the integral perverse t-structure, landing in the heart of `p`. -/
abbrev perverseIntegralCohomology (n : ℤ) : Dbc O X ⥤ (perverseIntegral O X).heart.FullSubcategory :=
  TStructure.homology _ n

/-- Stand-in: multiplication by the uniformizer on a perverse sheaf. -/
def uniformizerEnd (P : (perverseIntegral O X).heart.FullSubcategory) : P ⟶ P := sorry

lemma perversePlus_le_iff (K : Dbc O X) :
    (perversePlus O X).IsLE K 0 ↔ (perverseIntegral O X).IsLE K 1 ∧
      IsNilpotent (show End ((perverseIntegralCohomology 1).obj K) from uniformizerEnd ((perverseIntegralCohomology 1).obj K)) := sorry

lemma perversePlus_ge_iff (K : Dbc O X) :
    (perversePlus O X).IsGE K 0 ↔ (perverseIntegral O X).IsGE K 0 ∧
      Mono (uniformizerEnd ((perverseIntegralCohomology 0).obj K)) := sorry

lemma verdierDual_perverse_le_iff (K : Dbc O X) :
    (perverseIntegral O X).IsLE K 0 ↔
      (perversePlus O X).IsGE ((verdierDual X).obj (Opposite.op K)) 0 := sorry

lemma perverse_le_perversePlus_le (K : Dbc O X) (h : (perverseIntegral O X).IsLE K 0) :
    (perversePlus O X).IsLE K 0 ∧ (perverseIntegral O X).IsLE K 1 := sorry

/-- Stand-in: rationalization `K ↦ K ⊗_O Frac(O)`. -/
def rationalize : Dbc O X ⥤ Dbc (FractionRing O) X := sorry

lemma rationalize_tExact :
    Functor.IsTExact (rationalize (O := O) (X := X)) (perverseIntegral O X)
      (perverseTStructure (FractionRing O) X) := sorry

/-- Test `perversePlus_empty`. -/
example [IsEmpty X] : perversePlus O X = perverseIntegral O X := sorry

end Integral

/-- Test `perversePlus_point_torsion` and `not_perverse_eq_perversePlus`: over `Spec Ω`, a torsion
object in the heart of `p` (such as `O/λ` in degree 0) is not in the heart of `p⁺`. -/
example {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (Ω : Type u) [Field Ω]
    [IsSepClosed Ω] (P : (perverseIntegral O (Spec (CommRingCat.of Ω))).heart.FullSubcategory)
    (hP : ¬ IsZero P) (htors : IsNilpotent (show End P from uniformizerEnd P)) :
    ¬ (perversePlus O _).heart P.obj := sorry

/-- Test `perversePlus_point_free`: the constant sheaf `O` is in both hearts over `Spec Ω`. -/
example {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (Ω : Type u) [Field Ω]
    [IsSepClosed Ω] : (perverseIntegral O (Spec (CommRingCat.of Ω))).heart (constant _) ∧
      (perversePlus O (Spec (CommRingCat.of Ω))).heart (constant _) := sorry

/-- Test `not_perverse_eq_perversePlus`. -/
example {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (Ω : Type u) [Field Ω]
    [IsSepClosed Ω] : perverseIntegral O (Spec (CommRingCat.of Ω)) ≠ perversePlus O _ := sorry

end Perverse

/-! ## EDC.4 — weak Lefschetz, projective bundles and blow-ups -/

section Lefschetz

variable {Λ : Type u} [CommRing Λ]

/-- Named theorem `EDC.4/affine-vanishing-hypercohomology`, part (b). -/
theorem affine_vanishing_hypercohomology {k : Type u} [Field k] [IsSepClosed k] {U : Scheme.{u}}
    (a : U ⟶ Spec (CommRingCat.of k)) [LocallyOfFiniteType a] [IsAffine U] (K : Dbc Λ U)
    (dq : ℤ → ℕ) (hK : ∀ (x : GeomPoint U) (q : ℤ) (d : ℕ), x.dim = d →
      ¬ IsZero (stalkCohomology x q K) → d ≤ dq q) (m : ℤ) (hm : ∀ q : ℤ, (∃ x : GeomPoint U, ¬ IsZero (stalkCohomology x q K)) →
      q + dq q < m) :
    IsZero (cohomology m K) := sorry

/-- Named theorem `EDC.4/compact-support-vanishing-smooth-affine`. -/
theorem compact_support_vanishing_smooth_affine {k : Type u} [Field k] [IsSepClosed k]
    {U : Scheme.{u}} (a : U ⟶ Spec (CommRingCat.of k)) (d : ℕ) [SmoothOfRelativeDimension d a]
    [IsAffine U] (i : ℤ) (hi : i < d) : IsZero (compactCohomology i (constant (Λ := Λ) U)) := sorry

/-- Named theorem `EDC.4/weak-lefschetz`: `Y ⊂ X` closed with affine complement `U` (for a
hyperplane section, `U` is affine by `isAffine_of_isAffineHom` and `Proj.basicOpenIsoSpec`). -/
theorem weak_lefschetz {k : Type u} [Field k] [IsSepClosed k] {X Y U : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [IsProper a] [SmoothOfRelativeDimension (n + 1) a]
    (i : Y ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j] [IsAffine U]
    (h : Set.range j.base = (Set.range i.base)ᶜ) (q : ℤ) :
    (q < n → Function.Bijective (restriction (Λ := Λ) i q (constant X)).hom) ∧
    (q = n → Function.Injective (restriction (Λ := Λ) i q (constant X)).hom) := sorry

/-- Named theorem `EDC.4/weak-lefschetz-gysin`. -/
theorem weak_lefschetz_gysin {k : Type u} [Field k] [IsSepClosed k] {X Y U : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [IsProper a] [SmoothOfRelativeDimension (n + 1) a]
    (i : Y ⟶ X) [IsClosedImmersion i] [SmoothOfRelativeDimension n (i ≫ a)] (j : U ⟶ X)
    [IsOpenImmersion j] [IsAffine U] (h : Set.range j.base = (Set.range i.base)ᶜ) (q : ℤ) :
    ((n : ℤ) < q → Function.Bijective (gysin (Λ := Λ) i 1 q 0).hom) ∧
    (q = n → Function.Surjective (gysin (Λ := Λ) i 1 q 0).hom) := sorry

/-- Named theorem `EDC.4/weak-lefschetz-integral`: `H^{n+1}_c(U, O)` is torsion-free. -/
theorem weak_lefschetz_integral {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {k : Type u} [Field k] [IsSepClosed k] {X Y U : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [IsProper a] [SmoothOfRelativeDimension (n + 1) a]
    (i : Y ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j] [IsAffine U]
    (h : Set.range j.base = (Set.range i.base)ᶜ) :
    NoZeroSMulDivisors O (compactCohomology (n + 1 : ℤ) (constant (Λ := O) U)) := sorry

/-- Named theorem `EDC.4/ample-divisor-weak-lefschetz`: only the affineness of the complement of
the ample divisor (Stacks 0EKE, requested from SF.0) enters, so the statement is that of
`weak_lefschetz` for any closed `Y` with affine complement. -/
theorem ample_divisor_weak_lefschetz {k : Type u} [Field k] [IsSepClosed k] {X Y U : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) (n : ℕ) [IsProper a] [SmoothOfRelativeDimension (n + 1) a]
    (i : Y ⟶ X) [IsClosedImmersion i] (j : U ⟶ X) [IsOpenImmersion j] [IsAffineHom j]
    [IsAffine U] (h : Set.range j.base = (Set.range i.base)ᶜ) (q : ℤ) (hq : q < n) :
    Function.Bijective (restriction (Λ := Λ) i q (constant X)).hom := sorry

/-- Named theorem `EDC.4/complete-intersection-cohomology`, inductive step: if `X ⊂ P` is a smooth
ample divisor (affine complement) in a smooth projective `P` of dimension `m + 1` whose odd
cohomology vanishes, then `H^q(X) = 0` for odd `q < m`. -/
theorem complete_intersection_cohomology {k : Type u} [Field k] [IsSepClosed k] {X P U : Scheme.{u}}
    (a : P ⟶ Spec (CommRingCat.of k)) (m : ℕ) [IsProper a] [SmoothOfRelativeDimension (m + 1) a]
    (i : X ⟶ P) [IsClosedImmersion i] [SmoothOfRelativeDimension m (i ≫ a)] (j : U ⟶ P)
    [IsOpenImmersion j] [IsAffine U] (h : Set.range j.base = (Set.range i.base)ᶜ)
    (hP : ∀ q : ℤ, Odd q → IsZero (cohomology q (constant (Λ := Λ) P))) (q : ℤ) (hq : Odd q)
    (hqm : q < m) : IsZero (cohomology q (constant (Λ := Λ) X)) := sorry

/-- Stand-in: the untwisted restriction `H^q(X, Λ) → H^q(Y, Λ)`. -/
def restriction₀ {Y X : Scheme.{u}} (i : Y ⟶ X) (q : ℤ) :
    cohomology q (constant (Λ := Λ) X) ⟶ cohomology q (constant (Λ := Λ) Y) := sorry
/-- Stand-in: the untwisted Gysin map `H^q(Y, Λ) → H^{q+2}(X, Λ)` of a divisor (twists trivialized
over the separably closed base). -/
def gysin₀ {Y X : Scheme.{u}} (i : Y ⟶ X) (q : ℤ) :
    cohomology q (constant (Λ := Λ) Y) ⟶ cohomology (q + 2) (constant (Λ := Λ) X) := sorry
/-- Stand-in: cup product with the hyperplane class, `L : H^q(X) → H^{q+2}(X)`. -/
def lefschetzOperator (X : Scheme.{u}) (q : ℤ) :
    cohomology q (constant (Λ := Λ) X) ⟶ cohomology (q + 2) (constant (Λ := Λ) X) := sorry
/-- Stand-in: `L^r : H^q(X) → H^{q+2r}(X)`. -/
def lefschetzPower (X : Scheme.{u}) (r : ℕ) (q : ℤ) :
    cohomology q (constant (Λ := Λ) X) ⟶ cohomology (q + 2 * r) (constant (Λ := Λ) X) := sorry
/-- Stand-in: the Poincaré pairing on the middle cohomology `H^n(Y)` of a smooth proper `Y`. -/
def poincarePairing (Y : Scheme.{u}) (n : ℤ) :
    LinearMap.BilinForm Λ (cohomology n (constant (Λ := Λ) Y)) := sorry

/-- Stand-in: a locally free sheaf of rank `r` on `X` (owner: SchemeAndStackFoundations SF.0). -/
def LocallyFree (X : Scheme.{u}) (r : ℕ) : Type (u + 1) := sorry
/-- Stand-in: the projective bundle `P(E) → X`. -/
def projBundle {X : Scheme.{u}} {r : ℕ} (E : LocallyFree X (r + 1)) : Scheme.{u} := sorry
/-- Stand-in: its structure map. -/
def projBundle.π {X : Scheme.{u}} {r : ℕ} (E : LocallyFree X (r + 1)) : projBundle E ⟶ X := sorry
/-- Stand-in: cup product with `ξ^j`, `ξ = c₁(O(1))`, composed with `π^*`. -/
def projBundle.xiPow {X : Scheme.{u}} {r : ℕ} (E : LocallyFree X (r + 1)) (q : ℤ) (j : ℕ) :
    cohomology (q - 2 * j) (constant (Λ := Λ) X) ⟶ cohomology q (constant (Λ := Λ) (projBundle E)) :=
  sorry

/-- Named theorem `EDC.4/projective-bundle-decomposition` (untwisted form over a separably
closed field): `⊕_j H^{q−2j}(X) → H^q(P(E))`, `(a_j) ↦ Σ π^*a_j ∪ ξ^j`, is bijective. -/
theorem projective_bundle_decomposition {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} (aX : X ⟶ Spec (CommRingCat.of k)) {r : ℕ}
    (E : LocallyFree X (r + 1)) (q : ℤ) :
    Function.Bijective (fun a : (Π j : Fin (r + 1), cohomology (q - 2 * (j : ℕ)) (constant (Λ := Λ) X)) =>
      ∑ j : Fin (r + 1), (projBundle.xiPow E q j).hom (a j)) := sorry

/-- Stand-in: the blow-up `Bl_Z X` (owner: SchemeAndStackFoundations SF.0). -/
def blowUp {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.{u} := sorry
/-- Stand-in: the blow-down map. -/
def blowUp.π {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] : blowUp i ⟶ X := sorry
/-- Stand-in: the exceptional summand maps `z ↦ j_*(ζ^{a−1} ∪ p^*z)`. -/
def blowUp.excMap {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (q : ℤ) (a : ℕ) :
    cohomology (q - 2 * a) (constant (Λ := Λ) Z) ⟶ cohomology q (constant (Λ := Λ) (blowUp i)) := sorry

/-- Named theorem `EDC.4/blowup-direct-images`: `π_*Λ = Λ`, i.e. `Λ_X → Rπ_*Λ` is split injective. -/
theorem blowup_direct_images {k : Type u} [Field k] {Z X : Scheme.{u}} (aX : X ⟶ Spec (CommRingCat.of k))
    (i : Z ⟶ X) [IsClosedImmersion i] (d c : ℕ) [SmoothOfRelativeDimension d aX]
    [SmoothOfRelativeDimension (d - c) (i ≫ aX)] (hc : 2 ≤ c) (hcd : c ≤ d) :
    ∃ r : (pushforward (Λ := Λ) (blowUp.π i)).obj (constant _) ⟶ constant X,
      ∃ s : constant X ⟶ (pushforward (Λ := Λ) (blowUp.π i)).obj (constant _), s ≫ r = 𝟙 _ := sorry

/-- Named theorem `EDC.4/blowup-formula`: `(x, (z_a)) ↦ π^*x + Σ_a j_*(ζ^{a−1} ∪ p^*z_a)` is bijective. -/
theorem blowup_formula {k : Type u} [Field k] [IsSepClosed k] {Z X : Scheme.{u}} (aX : X ⟶ Spec (CommRingCat.of k))
    (i : Z ⟶ X) [IsClosedImmersion i] (d c : ℕ) [SmoothOfRelativeDimension d aX]
    [SmoothOfRelativeDimension (d - c) (i ≫ aX)] (hc : 2 ≤ c) (hcd : c ≤ d) (q : ℤ) :
    Function.Bijective (fun x : cohomology q (constant (Λ := Λ) X) ×
        (Π a : Fin (c - 1), cohomology (q - 2 * (((a : ℕ) + 1 : ℕ) : ℤ)) (constant (Λ := Λ) Z)) =>
      (restriction₀ (Λ := Λ) (blowUp.π i) q).hom x.1 +
        ∑ a : Fin (c - 1), (blowUp.excMap (Λ := Λ) i q ((a : ℕ) + 1)).hom (x.2 a)) := sorry

/-- Named theorem `EDC.4/pencil-axis-blowup` (codimension two). -/
theorem pencil_axis_blowup {k : Type u} [Field k] [IsSepClosed k] {Z X : Scheme.{u}}
    (aX : X ⟶ Spec (CommRingCat.of k)) (i : Z ⟶ X) [IsClosedImmersion i] (n : ℕ)
    [SmoothOfRelativeDimension (n + 1) aX] [SmoothOfRelativeDimension (n - 1) (i ≫ aX)]
    (hn : 1 ≤ n) (q : ℤ) :
    Function.Injective (restriction (Λ := Λ) (blowUp.π i) q (constant X)).hom := sorry

/-- Named theorem `EDC.4/pullback-injective-blowup-bundle` (projective-bundle case). -/
theorem pullback_injective_projBundle {X : Scheme.{u}} {r : ℕ} (E : LocallyFree X (r + 1)) (q : ℤ) :
    Function.Injective (restriction (Λ := Λ) (projBundle.π E) q (constant X)).hom := sorry

variable {Y X : Scheme.{u}} (i : Y ⟶ X) (n : ℤ)

/-- `Van(Y) := ker(i_* : H^n(Y) → H^{n+2}(X))` (node `EDC.4/vanishing-and-restriction-subspaces`). -/
def vanishingSubspace : Submodule Λ (cohomology n (constant (Λ := Λ) Y)) :=
  LinearMap.ker (gysin₀ (Λ := Λ) i n).hom

/-- `Res(Y) := im(i^* : H^n(X) → H^n(Y))`. -/
def restrictedSubspace : Submodule Λ (cohomology n (constant (Λ := Λ) Y)) :=
  LinearMap.range (restriction₀ (Λ := Λ) i n).hom

/-- `P^q(X) := ker(L^r : H^q(X) → H^{q+2r}(X))` with `r = n + 2 − q`. -/
def primitiveSubspace (X : Scheme.{u}) (r : ℕ) (q : ℤ) : Submodule Λ (cohomology q (constant (Λ := Λ) X)) :=
  LinearMap.ker (lefschetzPower (Λ := Λ) X r q).hom

end Lefschetz

section LefschetzField

variable {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k] {Y X : Scheme.{u}}
  (i : Y ⟶ X) (n : ℤ)

lemma restrictedSubspace_eq_orthogonal (a : X ⟶ Spec (CommRingCat.of k)) (m : ℕ) [IsProper a]
    [SmoothOfRelativeDimension (m + 1) a] [IsClosedImmersion i] [SmoothOfRelativeDimension m (i ≫ a)] :
    restrictedSubspace (Λ := Λ) i m = (poincarePairing Y m).orthogonal (vanishingSubspace i m) := sorry

lemma vanishingSubspace_eq_orthogonal (a : X ⟶ Spec (CommRingCat.of k)) (m : ℕ) [IsProper a]
    [SmoothOfRelativeDimension (m + 1) a] [IsClosedImmersion i] [SmoothOfRelativeDimension m (i ≫ a)] :
    vanishingSubspace (Λ := Λ) i m = (poincarePairing Y m).orthogonal (restrictedSubspace i m) := sorry

lemma finrank_restricted_add_vanishing (a : X ⟶ Spec (CommRingCat.of k)) (m : ℕ) [IsProper a]
    [SmoothOfRelativeDimension (m + 1) a] [IsClosedImmersion i] [SmoothOfRelativeDimension m (i ≫ a)] :
    Module.finrank Λ (restrictedSubspace (Λ := Λ) i m) + Module.finrank Λ (vanishingSubspace (Λ := Λ) i m) =
      Module.finrank Λ (cohomology (m : ℤ) (constant (Λ := Λ) Y)) := sorry

lemma gysin_comp_restriction [IsClosedImmersion i] (q : ℤ) :
    restriction₀ (Λ := Λ) i q ≫ gysin₀ i q = lefschetzOperator X q := sorry

lemma vanishingSubspace_galois (gY : Y ≅ Y) (gX : X ≅ X) (hg : gY.hom ≫ i = i ≫ gX.hom) :
    (vanishingSubspace (Λ := Λ) i n).map (restriction₀ gY.hom n).hom ≤ vanishingSubspace i n := sorry

/-- Test `vanishingSubspace_projectiveSpace`: when the Gysin map is injective (as for `P^n ⊂ P^{n+1}`),
`Van(Y) = 0`. -/
example (hg : Function.Injective (gysin₀ (Λ := Λ) i n).hom) : vanishingSubspace (Λ := Λ) i n = ⊥ :=
  sorry

/-- Test `restrictedSubspace_planeCubic`: if `H^1(X) = 0 = H^3(X)` (as for `X = P²`), then
`Res(Y) = 0` and `Van(Y) = H^1(Y)`. -/
example (h1 : Subsingleton (cohomology (1 : ℤ) (constant (Λ := Λ) X)))
    (h3 : Subsingleton (cohomology (1 + 2 : ℤ) (constant (Λ := Λ) X))) :
    restrictedSubspace (Λ := Λ) i 1 = ⊥ ∧ vanishingSubspace (Λ := Λ) i 1 = ⊤ := sorry

/-- Test `vanishingSubspace_zero_of_curve_point`: for `n = 0`, if the Gysin map onto the
one-dimensional `H²(X)` is surjective, `dim Van(Y) + 1 = dim H⁰(Y)`. -/
example [FiniteDimensional Λ (cohomology (0 : ℤ) (constant (Λ := Λ) Y))]
    (h2 : Module.finrank Λ (cohomology (0 + 2 : ℤ) (constant (Λ := Λ) X)) = 1)
    (hs : Function.Surjective (gysin₀ (Λ := Λ) i 0).hom) :
    Module.finrank Λ (vanishingSubspace (Λ := Λ) i 0) + 1 =
      Module.finrank Λ (cohomology (0 : ℤ) (constant (Λ := Λ) Y)) := sorry

/-- Test `not_vanishing_inf_restricted_eq_bot`: `Res ⊓ Van = 0` is equivalent to nondegeneracy of
the pairing on `Van` (hard Lefschetz's input), not a consequence of the definitions. -/
example (a : X ⟶ Spec (CommRingCat.of k)) (m : ℕ) [IsProper a] [SmoothOfRelativeDimension (m + 1) a]
    [IsClosedImmersion i] [SmoothOfRelativeDimension m (i ≫ a)] :
    restrictedSubspace (Λ := Λ) i m ⊓ vanishingSubspace i m = ⊥ ↔
      ((poincarePairing Y m).restrict (vanishingSubspace (Λ := Λ) i m)).Nondegenerate := sorry

end LefschetzField

/-! ## EDC.6 — integral, analytic and diamond comparisons -/

section Comparison

/-- Stand-in: Ekedahl's category of normalized `λ`-adic systems (EllAdicRealization). -/
def EkedahlCategory (O : Type u) [CommRing O] (X : Scheme.{u}) : Type (u + 1) := sorry
instance (O : Type u) [CommRing O] (X : Scheme.{u}) : Category.{u} (EkedahlCategory O X) := sorry

/-- Named comparison `EDC.6/classical-and-proetale-adic-categories`. -/
theorem classical_proetale_adic_equiv {O : Type u} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (X : Scheme.{u}) : Nonempty (Dbc O X ≌ EkedahlCategory O X) := sorry

/-- Stand-in: the biduality map `K → D_X D_X K`. -/
def bidualityMap {O : Type u} [CommRing O] {X : Scheme.{u}} (K : Dbc O X) :
    K ⟶ (verdierDual X).obj (Opposite.op ((verdierDual X).obj (Opposite.op K))) := sorry

/-- Named theorem `EDC.6/adic-transport-of-duality-and-classes`: integral biduality. -/
theorem adic_biduality {O : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {k : Type u} [Field k] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a]
    [LocallyOfFiniteType a] (K : Dbc O X) : IsIso (bidualityMap K) := sorry

/-- Stand-in: extension of scalars `K ↦ K ⊗_E E'`. -/
def extendScalars {E E' : Type u} [Field E] [Field E'] (f : E →+* E') (X : Scheme.{u}) :
    Dbc E X ⥤ Dbc E' X := sorry

/-- Named theorem `EDC.6/rational-perverse-coefficient-extension`. -/
theorem extendScalars_tExact {E E' : Type u} [Field E] [Field E'] (f : E →+* E') (X : Scheme.{u}) :
    Functor.IsTExact (extendScalars f X) (perverseTStructure E X) (perverseTStructure E' X) := sorry

/-- Stand-in: algebraically constructible complexes on `X(ℂ)`. -/
def AnalyticDbc (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := sorry
instance (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Category.{u} (AnalyticDbc Λ X) := sorry
/-- Stand-in: the comparison functor `ε^*`. -/
def analytification {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) : Dbc Λ X ⥤ AnalyticDbc Λ X := sorry

/-- Named theorem `EDC.6/complex-analytic-comparison` (BBD 6.1.2 (B′)). -/
theorem complex_analytic_comparison {Λ : Type u} [CommRing Λ] [Finite Λ] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of (ULift.{u} ℂ))) [IsSeparated a] [LocallyOfFiniteType a] :
    (analytification (Λ := Λ) X).IsEquivalence := sorry

/-- Stand-ins: the étale trace and topological integration on top-degree compact cohomology. -/
def etaleTrace {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) (d : ℕ) :
    compactCohomology (2 * d : ℤ) (constant (Λ := Λ) X) ⟶ ModuleCat.of Λ Λ := sorry
/-- Stand-in. -/
def topologicalIntegral {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) (d : ℕ) :
    compactCohomology (2 * d : ℤ) (constant (Λ := Λ) X) ⟶ ModuleCat.of Λ Λ := sorry

/-- Named theorem `EDC.6/trace-orientation-comparison` (with `Λ(1) ≅ Λ` via `e^{2πi/n}`). -/
theorem trace_orientation_comparison {Λ : Type u} [CommRing Λ] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of (ULift.{u} ℂ))) (d : ℕ) [SmoothOfRelativeDimension d a] :
    etaleTrace (Λ := Λ) X d = topologicalIntegral X d := sorry

/-- Named theorem `EDC.6/complete-intersection-betti-comparison` (smooth proper base change form). -/
theorem complete_intersection_betti_comparison {Λ : Type u} [Field Λ] {𝒳 S : Scheme.{u}}
    (f : 𝒳 ⟶ S) [IsProper f] [Smooth f] [ConnectedSpace S] (s₁ s₂ : GeomPoint S) (m : ℤ) :
    Module.finrank Λ (cohomology m (constant (Λ := Λ) (Limits.pullback f s₁.pt))) =
      Module.finrank Λ (cohomology m (constant (Λ := Λ) (Limits.pullback f s₂.pt))) := sorry

/-- Stand-in: constructible complexes on the diamond `X^◇`. -/
def DiamondDbc (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := sorry
instance (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Category.{u} (DiamondDbc Λ X) := sorry
/-- Stand-in: `c_X^*`. -/
def toDiamond {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) : Dbc Λ X ⥤ DiamondDbc Λ X := sorry
/-- Stand-in: Verdier duality on `X^◇`. -/
def diamondDual {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) : (DiamondDbc Λ X)ᵒᵖ ⥤ DiamondDbc Λ X := sorry
/-- Stand-in: `Rf^◇_!`. -/
def diamondLowerShriek {Λ : Type u} [CommRing Λ] {X Y : Scheme.{u}} (f : X ⟶ Y) :
    DiamondDbc Λ X ⥤ DiamondDbc Λ Y := sorry

/-- Named comparison `EDC.6/scheme-adic-diamond-operation-comparisons-index` (ECD 27.4). -/
theorem diamond_lowerShriek_comparison {Λ : Type u} [CommRing Λ] {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] (p : ℕ) [Fact p.Prime]
    (hp : CharP Γ(Y, ⊤) p) (n : ℕ) (hn : 0 < n) (hΛ : (n : Λ) = 0)
    (hnp : Nat.Coprime n p) :
    Nonempty (toDiamond (Λ := Λ) X ⋙ diamondLowerShriek f ≅ lowerShriek f ⋙ toDiamond Y) := sorry

/-- Stand-in: the right adjoint `Rc_{X*}` to scheme-to-diamond pullback. -/
def fromDiamond {Λ : Type u} [CommRing Λ] (X : Scheme.{u}) : DiamondDbc Λ X ⥤ Dbc Λ X := sorry

/-- Named theorem `EDC.6/diamond-transport-of-duality`: right-adjoint recovery.
Here `diamondDual` must denote duality relative to `(Spec k)^◇`.
The stronger `c^* D_X ≅ D_{X^◇} c^*` target requires the comparison gap in the packet. -/
theorem diamond_transport_of_duality {Λ : Type u} [CommRing Λ] {k : Type u} [Field k] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [IsSeparated a] [LocallyOfFiniteType a] (p : ℕ) [Fact p.Prime]
    [CharP k p] [QuasiCompact a] (n : ℕ) (hn : 0 < n) (hΛ : (n : Λ) = 0)
    (hnp : Nat.Coprime n p) (K : Dbc Λ X) :
    Nonempty ((fromDiamond X).obj
      ((diamondDual X).obj (Opposite.op ((toDiamond X).obj K))) ≅
        (verdierDual X).obj (Opposite.op K)) := sorry

end Comparison

/-! ## EDC.7 — weights, purity and the decomposition theorem -/

section Weights

/-- Stand-in: mixed complexes `D^b_m(X₀, ℚ̄_ℓ)` on `X₀` over `𝔽_q` (owner: DWP.8). -/
def MixedDbc (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : Type (u + 1) := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : Category.{u} (MixedDbc Λ X₀) := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : Preadditive (MixedDbc Λ X₀) := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : HasZeroObject (MixedDbc Λ X₀) := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : HasShift (MixedDbc Λ X₀) ℤ := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) (n : ℤ) : (shiftFunctor (MixedDbc Λ X₀) n).Additive :=
  sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : Pretriangulated (MixedDbc Λ X₀) := sorry
instance (Λ : Type u) [Field Λ] (X₀ : Scheme.{u}) : IsTriangulated (MixedDbc Λ X₀) := sorry

variable {Λ : Type u} [Field Λ] {X₀ : Scheme.{u}}

/-- Stand-in (DWP.8): the ι-weights of `ℋ^i(K)` at the closed points of `X₀`. -/
def pointwiseWeights (K : MixedDbc Λ X₀) (i : ℤ) : Finset ℤ := sorry
/-- Stand-in: Verdier duality on mixed complexes. -/
def mixedDual (X₀ : Scheme.{u}) : (MixedDbc Λ X₀)ᵒᵖ ⥤ MixedDbc Λ X₀ := sorry

/-- `K` has weights `≤ w` (BBD 5.1.8): the pointwise weights of `ℋ^i K` are `≤ w + i`. -/
def HasWeightsLE (K : MixedDbc Λ X₀) (w : ℤ) : Prop :=
  ∀ i : ℤ, ∀ a ∈ pointwiseWeights K i, a ≤ w + i

/-- `K` has weights `≥ w` (BBD 5.1.8): `D K` has weights `≤ −w`. -/
def HasWeightsGE (K : MixedDbc Λ X₀) (w : ℤ) : Prop :=
  HasWeightsLE ((mixedDual X₀).obj (Opposite.op K)) (-w)

/-- `K` is pure of weight `w`. -/
def IsPure (K : MixedDbc Λ X₀) (w : ℤ) : Prop := HasWeightsLE K w ∧ HasWeightsGE K w

variable (Λ X₀) in
/-- Stand-in: the perverse t-structure on mixed complexes. -/
def mixedPerverse : TStructure (MixedDbc Λ X₀) := sorry

/-- Mixed perverse cohomology. -/
abbrev mixedPerverseCohomology (n : ℤ) : MixedDbc Λ X₀ ⥤ (mixedPerverse Λ X₀).heart.FullSubcategory :=
  TStructure.homology _ n

/-- Stand-in: base change to `𝔽̄_q`. -/
def toGeometric (X₀ X : Scheme.{u}) : MixedDbc Λ X₀ ⥤ Dbc Λ X := sorry

/-- Named theorem `EDC.7/weights-and-perverse-truncation` (BBD 5.4.1). -/
theorem weights_perverse_truncation (K : MixedDbc Λ X₀) (w : ℤ) :
    HasWeightsLE K w ↔ ∀ i : ℤ, HasWeightsLE ((mixedPerverseCohomology i).obj K).obj (w + i) := sorry

/-- Named theorem `EDC.7/ext-vanishing-weights` (BBD 5.1.15, perverse case). -/
theorem ext_vanishing_weights (P Q : (mixedPerverse Λ X₀).heart.FullSubcategory) (w : ℤ)
    (hP : HasWeightsLE P.obj w) (hQ : HasWeightsGE Q.obj (w + 1)) :
    (∀ f : P ⟶ Q, f = 0) ∧ ∀ g : P.obj ⟶ Q.obj⟦(1 : ℤ)⟧, g = 0 := sorry

/-- Named theorem `EDC.7/mixed-perverse-weight-filtration` (one step of the filtration). -/
theorem mixed_perverse_weight_filtration (P : (mixedPerverse Λ X₀).heart.FullSubcategory) (w : ℤ) :
    ∃ (W Q : (mixedPerverse Λ X₀).heart.FullSubcategory) (ι : W ⟶ P) (π : P ⟶ Q)
      (h : ι ≫ π = 0), Mono ι ∧ Epi π ∧ (ShortComplex.mk ι π h).Exact ∧
        HasWeightsLE W.obj w ∧ HasWeightsGE Q.obj (w + 1) := sorry

/-- Stand-in: intermediate extension of mixed perverse sheaves along `j : U₀ → X₀`. -/
def mixedIntermediateExtension {U₀ : Scheme.{u}} (j : U₀ ⟶ X₀) [IsOpenImmersion j] :
    (mixedPerverse Λ U₀).heart.FullSubcategory ⥤ (mixedPerverse Λ X₀).heart.FullSubcategory := sorry

/-- Named theorem `EDC.7/ic-purity` (BBD 5.3.2). -/
theorem ic_purity {U₀ : Scheme.{u}} (j : U₀ ⟶ X₀) [IsOpenImmersion j] [IsAffineHom j]
    (F : (mixedPerverse Λ U₀).heart.FullSubcategory) (w : ℤ) (hF : IsPure F.obj w) :
    IsPure ((mixedIntermediateExtension j).obj F).obj w := sorry

/-- Named theorem `EDC.7/geometric-semisimplicity` (BBD 5.3.8): every monomorphism into the
geometric perverse sheaf `F` splits. -/
theorem geometric_semisimplicity {X : Scheme.{u}} (F : (mixedPerverse Λ X₀).heart.FullSubcategory)
    (w : ℤ) (hF : IsPure F.obj w) (hFX : (perverseTStructure Λ X).heart ((toGeometric X₀ X).obj F.obj))
    (S : PerverseSheaf Λ X) (f : S ⟶ ⟨_, hFX⟩) [Mono f] : ∃ r, f ≫ r = 𝟙 S := sorry

/-- Named theorem `EDC.7/pure-complex-decomposition` (BBD 5.4.5): each `pH^i(K)[−i]` is a direct
summand of `K` over `𝔽̄_q`. -/
theorem pure_complex_decomposition {X : Scheme.{u}} (K : MixedDbc Λ X₀) (w : ℤ) (hK : IsPure K w)
    (i : ℤ) : ∃ (s : (toGeometric X₀ X).obj (((mixedPerverseCohomology i).obj K).obj⟦-i⟧) ⟶
      (toGeometric X₀ X).obj K) (r : (toGeometric X₀ X).obj K ⟶
        (toGeometric X₀ X).obj (((mixedPerverseCohomology i).obj K).obj⟦-i⟧)), s ≫ r = 𝟙 _ := sorry

/-- Stand-in: `Rf_*` on mixed complexes. -/
def mixedPushforward {Y₀ : Scheme.{u}} (f : X₀ ⟶ Y₀) : MixedDbc Λ X₀ ⥤ MixedDbc Λ Y₀ := sorry

/-- Named theorem `EDC.7/proper-direct-image-decomposition`. -/
/- Review blocker: purity preservation alone does not state a decomposition isomorphism or semisimplicity. -/
theorem proper_direct_image_decomposition {Y₀ : Scheme.{u}} (f : X₀ ⟶ Y₀) [IsProper f]
    (K : MixedDbc Λ X₀) (w : ℤ) (hK : IsPure K w) : IsPure ((mixedPushforward f).obj K) w := sorry

/-- Stand-in: the relative Lefschetz map `η^i : pH^{−i}(Rf_*F) → pH^i(Rf_*F)(i)`. -/
def lefschetzMap {Y₀ : Scheme.{u}} (f : X₀ ⟶ Y₀) (F : MixedDbc Λ X₀) (i : ℕ) :
    (mixedPerverseCohomology (-(i : ℤ))).obj ((mixedPushforward f).obj F) ⟶
      (mixedPerverseCohomology (i : ℤ)).obj ((mixedPushforward f).obj F) := sorry

/-- Named theorem `EDC.7/relative-hard-lefschetz` (BBD 5.4.10; `f` projective with an `f`-ample
class, whose Chern class defines `lefschetzMap`). -/
/- Review blocker: introduce the projective morphism, chosen relatively ample line bundle, its Chern-class action and Tate-twisted target. -/
theorem relative_hard_lefschetz {Y₀ : Scheme.{u}} (f : X₀ ⟶ Y₀) [IsProper f]
    (F : (mixedPerverse Λ X₀).heart.FullSubcategory) (w : ℤ) (hF : IsPure F.obj w) (i : ℕ) :
    IsIso (lefschetzMap f F.obj i) := sorry

/-- Named theorem `EDC.7/relative-primitive-decomposition`: the primitive part `P^{−i}` is a direct
summand of `pH^{−i}(Rf_*F)` (its complement being `η · pH^{−i−2}(Rf_*F)(−1)`). -/
/- Review blocker: P must be the specified primitive kernel; an arbitrary retract can be zero. -/
theorem relative_primitive_decomposition {Y₀ : Scheme.{u}} (f : X₀ ⟶ Y₀) [IsProper f]
    (F : (mixedPerverse Λ X₀).heart.FullSubcategory) (w : ℤ) (hF : IsPure F.obj w) (i : ℕ) :
    ∃ (P : (mixedPerverse Λ Y₀).heart.FullSubcategory)
      (ι : P ⟶ (mixedPerverseCohomology (-(i : ℤ))).obj ((mixedPushforward f).obj F.obj))
      (ρ : (mixedPerverseCohomology (-(i : ℤ))).obj ((mixedPushforward f).obj F.obj) ⟶ P),
      ι ≫ ρ = 𝟙 P := sorry

/-- Named theorem `EDC.7/spreading-out-to-finite-fields` (scheme part): `X` over `ℂ` has a model
over a finitely generated `ℤ`-algebra. -/
theorem spreading_out_to_finite_fields {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of (ULift.{u} ℂ)))
    [LocallyOfFiniteType a] [QuasiCompact a] :
    ∃ (A : Type u) (_ : CommRing A) (_ : Algebra.FiniteType ℤ A) (XA : Scheme.{u})
      (aA : XA ⟶ Spec (CommRingCat.of A)) (φ : A →+* ULift.{u} ℂ),
      LocallyOfFiniteType aA ∧ Nonempty (Limits.pullback aA (Spec.map (CommRingCat.ofHom φ)) ≅ X) := sorry

/-- Named theorem `EDC.7/characteristic-zero-decomposition` (for `Λ_X[n]`, `X` smooth over `ℂ`, or any algebraically closed field of characteristic 0):
each `pH^i(Rf_*Λ_X[n])[−i]` is a direct summand of `Rf_*Λ_X[n]`. -/
theorem characteristic_zero_decomposition {Λ' : Type u} [Field Λ'] [CharZero Λ'] {K : Type u} [Field K]
    [CharZero K] [IsAlgClosed K] {X Y : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of K)) (n : ℕ) [SmoothOfRelativeDimension n a] (f : X ⟶ Y) [IsProper f]
    (i : ℤ) :
    ∃ (s : ((perverseCohomology i).obj ((pushforward f).obj (constantPerverse (Λ := Λ') a n).obj)).obj⟦-i⟧ ⟶
        (pushforward f).obj (constantPerverse (Λ := Λ') a n).obj)
      (r : (pushforward f).obj (constantPerverse (Λ := Λ') a n).obj ⟶
        ((perverseCohomology i).obj ((pushforward f).obj (constantPerverse (Λ := Λ') a n).obj)).obj⟦-i⟧),
      s ≫ r = 𝟙 _ := sorry

end Weights

/-! ## EDC.8 — cohomological correspondences and the functional-equation interface -/

section Correspondences

variable {Λ : Type u} [CommRing Λ]

/-- A cohomological correspondence from `(X, L)` to `(Y, M)` (node
`EDC.8/cohomological-correspondence`): `u : ←c^*L ⟶ →c^!M` on `C`. -/
structure CohCorr {X Y : Scheme.{u}} (L : Dbc Λ X) (M : Dbc Λ Y) where
  /-- the support -/
  C : Scheme.{u}
  /-- the left leg -/
  left : C ⟶ X
  /-- the right leg -/
  right : C ⟶ Y
  [sep : IsSeparated right]
  [lft : LocallyOfFiniteType right]
  /-- the cohomological correspondence -/
  u : (pullback left).obj L ⟶ (upperShriek right).obj M

attribute [instance] CohCorr.sep CohCorr.lft

variable {X Y Z : Scheme.{u}} {L : Dbc Λ X} {M : Dbc Λ Y} {N : Dbc Λ Z}

/-- The adjoint form `→c_!←c^*L ⟶ M`. -/
def CohCorr.ofAdjoint {C : Scheme.{u}} (l : C ⟶ X) (r : C ⟶ Y) [IsSeparated r] [LocallyOfFiniteType r] :
    ((pullback l).obj L ⟶ (upperShriek r).obj M) ≃ ((lowerShriek r).obj ((pullback l).obj L) ⟶ M) := sorry

/-- The identity correspondence. -/
def CohCorr.id (L : Dbc Λ X) : CohCorr L L where
  C := X
  left := 𝟙 X
  right := 𝟙 X
  u := sorry

/-- The correspondence of `φ : f^*M ⟶ L`, supported on `X` with legs `f` and `𝟙`. -/
def CohCorr.ofMorphism (f : X ⟶ Y) (φ : (pullback f).obj M ⟶ L) : CohCorr M L where
  C := X
  left := f
  right := 𝟙 X
  u := φ ≫ sorry

/-- Pushforward of cohomological correspondences along a proper map `p : C ⟶ D` of supports. -/
def CohCorr.properMap {C D : Scheme.{u}} (p : C ⟶ D) [IsProper p] (l : D ⟶ X) (r : D ⟶ Y)
    [IsSeparated r] [LocallyOfFiniteType r] [IsSeparated (p ≫ r)] [LocallyOfFiniteType (p ≫ r)] :
    ((pullback (p ≫ l)).obj L ⟶ (upperShriek (p ≫ r)).obj M) → ((pullback l).obj L ⟶ (upperShriek r).obj M) :=
  sorry

lemma CohCorr.properMap_comp {C D E : Scheme.{u}} (p : C ⟶ D) (q : D ⟶ E) [IsProper p] [IsProper q]
    [IsProper (p ≫ q)] (l : E ⟶ X) (r : E ⟶ Y) [IsSeparated r] [LocallyOfFiniteType r]
    [IsSeparated (q ≫ r)] [LocallyOfFiniteType (q ≫ r)] [IsSeparated (p ≫ q ≫ r)]
    [LocallyOfFiniteType (p ≫ q ≫ r)] [IsSeparated ((p ≫ q) ≫ r)] [LocallyOfFiniteType ((p ≫ q) ≫ r)]
    (u : (pullback (p ≫ q ≫ l)).obj L ⟶ (upperShriek (p ≫ q ≫ r)).obj M) :
    ∃ u' : (pullback ((p ≫ q) ≫ l)).obj L ⟶ (upperShriek ((p ≫ q) ≫ r)).obj M,
      CohCorr.properMap q l r (CohCorr.properMap p (q ≫ l) (q ≫ r) u) = CohCorr.properMap (p ≫ q) l r u' :=
  sorry

/-- Test `cohCorr_id_ofAdjoint`. -/
example (L : Dbc Λ X) : IsIso ((CohCorr.ofAdjoint (L := L) (M := L) (𝟙 X) (𝟙 X)) (CohCorr.id L).u) :=
  sorry

/-- Test `cohCorr_empty`. -/
example (c : CohCorr L M) [IsEmpty c.C] : c.u = 0 := sorry

/-- Test `cohCorr_point`. -/
example (Ω : Type u) [Field Ω] [IsSepClosed Ω] (L M : Dbc Λ (Spec (CommRingCat.of Ω))) :
    Nonempty (((pullback (𝟙 _)).obj L ⟶ (upperShriek (𝟙 (Spec (CommRingCat.of Ω)))).obj M) ≃ (L ⟶ M)) :=
  sorry

/-- Test `not_cohCorr_pullback_pullback`: `→c^! ≠ →c^*` for `→c : 𝔸¹ → Spec Ω` (here any smooth
curve), since `→c^!Λ = Λ(1)[2]`. -/
example {k : Type u} [Field k] [IsSepClosed k] [Nontrivial Λ] {C : Scheme.{u}} [Nonempty C]
    (r : C ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 r] [IsSeparated r]
    [LocallyOfFiniteType r] :
    ¬ Nonempty ((upperShriek (Λ := Λ) r).obj (constant _) ≅ (pullback r).obj (constant _)) := sorry

/-- Pushforward of a cohomological correspondence along proper maps (node
`EDC.8/correspondence-pushforward`, case (iii): proper left legs). -/
def CohCorr.pushforward {S T : Scheme.{u}} (c : CohCorr L M) [IsProper c.left] (f : X ⟶ S)
    (g : Y ⟶ T) [IsSeparated f] [LocallyOfFiniteType f] [IsSeparated g] [LocallyOfFiniteType g] :
    CohCorr ((lowerShriek f).obj L) ((lowerShriek g).obj M) := sorry

lemma CohCorr.pushforward_comp {S T S' T' : Scheme.{u}} (c : CohCorr L M) [IsProper c.left]
    (f : X ⟶ S) (g : Y ⟶ T) (f' : S ⟶ S') (g' : T ⟶ T') [IsSeparated f] [LocallyOfFiniteType f]
    [IsSeparated g] [LocallyOfFiniteType g] [IsSeparated f'] [LocallyOfFiniteType f'] [IsSeparated g']
    [LocallyOfFiniteType g'] [IsProper (c.pushforward f g).left] :
    Nonempty (((c.pushforward f g).pushforward f' g').C ≅ (c.pushforward f g).C) := sorry

lemma CohCorr.pushforward_id (c : CohCorr L M) [IsProper c.left] :
    Nonempty ((c.pushforward (𝟙 X) (𝟙 Y)).C ≅ c.C) := sorry

/-- The action `RΓ_c(u)` of a self-correspondence with proper left leg. -/
def CohCorr.actionOnCompactCohomology (c : CohCorr L L) [IsProper c.left] (q : ℤ) :
    compactCohomology q L ⟶ compactCohomology q L := sorry

instance (L : Dbc Λ X) : IsProper (CohCorr.id L).left := inferInstanceAs (IsProper (𝟙 X))

lemma CohCorr.actionOnCompactCohomology_id (q : ℤ) :
    CohCorr.actionOnCompactCohomology (CohCorr.id L) q = 𝟙 _ := sorry

/-- Test `pushforward_identity_correspondence`. -/
example {k : Type u} [Field k] (a : X ⟶ Spec (CommRingCat.of k)) [IsProper a] (q : ℤ) :
    CohCorr.actionOnCompactCohomology (CohCorr.id L) q = 𝟙 _ := sorry

/-- Stand-in (TraceFormula): the endomorphism of `H^q_c(X, L)` induced by `F^*` and `φ`. -/
def compactPullbackAction (F : X ⟶ X) (φ : (pullback F).obj L ⟶ L) (q : ℤ) :
    compactCohomology q L ⟶ compactCohomology q L := sorry

/-- Test `pushforward_graph_frobenius`: the graph of a morphism `F : X ⟶ X` with the canonical
`u` acts on `RΓ_c` through `F^*` (TraceFormula's convention for the geometric Frobenius). -/
example (F : X ⟶ X) [IsProper F] (φ : (pullback F).obj L ⟶ L) (q : ℤ)
    [IsProper (CohCorr.ofMorphism F φ).left] :
    CohCorr.actionOnCompactCohomology (CohCorr.ofMorphism F φ) q = compactPullbackAction F φ q := sorry

/-- Test `pushforward_closed_immersion`. -/
example {S : Scheme.{u}} (c : CohCorr L L) [IsProper c.left] (i : X ⟶ S) [IsClosedImmersion i]
    [IsSeparated i] [LocallyOfFiniteType i] :
    Nonempty ((c.pushforward i i).C ≅ c.C) := sorry

/-- Test `not_pushforward_nonproper`: for an open immersion left leg (not proper) the action on
`RΓ_c` is not defined by this construction: `IsProper` fails for `𝔾_m → 𝔸¹`-type legs. -/
example {U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j] (hj : ¬ IsClosedMap j.base) :
    ¬ IsProper j := sorry

/-- `Z ⊂ X` closed is `c`-invariant: `→c^{-1}(Z) ⊆ ←c^{-1}(Z)` (node `EDC.8/correspondence-restriction`). -/
def CohCorr.IsInvariantClosed (c : CohCorr L L) {Zc : Scheme.{u}} (i : Zc ⟶ X) [IsClosedImmersion i] : Prop :=
  c.right.base ⁻¹' Set.range i.base ⊆ c.left.base ⁻¹' Set.range i.base

/-- Restriction to an invariant closed subscheme. -/
def CohCorr.restrictClosed (c : CohCorr L L) {Zc : Scheme.{u}} (i : Zc ⟶ X) [IsClosedImmersion i]
    (h : c.IsInvariantClosed i) : CohCorr ((pullback i).obj L) ((pullback i).obj L) := sorry

/-- Restriction to an open `U` with `←c^{-1}(U) ⊆ →c^{-1}(U)`. -/
def CohCorr.restrictOpen (c : CohCorr L L) {U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (h : c.left.base ⁻¹' Set.range j.base ⊆ c.right.base ⁻¹' Set.range j.base) :
    CohCorr ((pullback j).obj L) ((pullback j).obj L) := sorry

lemma CohCorr.trace_additive {Λ : Type u} [Field Λ] {X : Scheme.{u}} {L : Dbc Λ X} (c : CohCorr L L)
    [IsProper c.left] {Zc U : Scheme.{u}} (i : Zc ⟶ X) [IsClosedImmersion i] (j : U ⟶ X)
    [IsOpenImmersion j] (hZ : c.IsInvariantClosed i)
    (hU : c.left.base ⁻¹' Set.range j.base ⊆ c.right.base ⁻¹' Set.range j.base)
    [IsProper (c.restrictClosed i hZ).left] [IsProper (c.restrictOpen j hU).left]
    (hcomp : Set.range j.base = (Set.range i.base)ᶜ) (S : Finset ℤ)
    (hX : ∀ q ∉ S, IsZero (compactCohomology q L))
    (hU' : ∀ q ∉ S, IsZero (compactCohomology q ((pullback j).obj L)))
    (hZ' : ∀ q ∉ S, IsZero (compactCohomology q ((pullback i).obj L)))
    [∀ q : ℤ, FiniteDimensional Λ (compactCohomology q L)]
    [∀ q : ℤ, FiniteDimensional Λ (compactCohomology q ((pullback j).obj L))]
    [∀ q : ℤ, FiniteDimensional Λ (compactCohomology q ((pullback i).obj L))] :
    (∑ q ∈ S, (-1 : Λ) ^ q.natAbs * LinearMap.trace Λ _ (c.actionOnCompactCohomology q).hom) =
      (∑ q ∈ S, (-1 : Λ) ^ q.natAbs *
        LinearMap.trace Λ _ ((c.restrictOpen j hU).actionOnCompactCohomology q).hom) +
      (∑ q ∈ S, (-1 : Λ) ^ q.natAbs *
        LinearMap.trace Λ _ ((c.restrictClosed i hZ).actionOnCompactCohomology q).hom) := sorry

/-- Test `restrictClosed_self`. -/
example (c : CohCorr L L) : c.IsInvariantClosed (𝟙 X) := by
  intro x _; exact ⟨c.left.base x, rfl⟩

/-- Test `restrictClosed_empty`. -/
example (c : CohCorr L L) {E : Scheme.{u}} [IsEmpty E] (i : E ⟶ X) [IsClosedImmersion i] :
    c.IsInvariantClosed i := sorry

/-- Test `restrictClosed_fixedPoint`: a closed point fixed by both legs set-theoretically (as `0`
for `←c = id`, `→c = z²` on `𝔸¹`) gives an invariant closed subscheme. -/
example (c : CohCorr L L) {E : Scheme.{u}} (i : E ⟶ X) [IsClosedImmersion i]
    (h : ∀ y, c.right.base y ∈ Set.range i.base → c.left.base y ∈ Set.range i.base) :
    c.IsInvariantClosed i := h

/-- Test `not_invariant_translation`: if some point of `C` maps into `Z` by `→c` but not by `←c`,
`Z` is not invariant (as `{0}` for `→c = z + 1`). -/
example (c : CohCorr L L) {E : Scheme.{u}} (i : E ⟶ X) [IsClosedImmersion i] (y : c.C)
    (h₁ : c.right.base y ∈ Set.range i.base) (h₂ : c.left.base y ∉ Set.range i.base) :
    ¬ c.IsInvariantClosed i := fun h => h₂ (h h₁)

/-- Composition of cohomological correspondences (node `EDC.8/correspondence-composition`),
supported on `C ×_Y D`. -/
def CohCorr.comp (c : CohCorr L M) (d : CohCorr M N) : CohCorr L N := sorry

lemma CohCorr.comp_support (c : CohCorr L M) (d : CohCorr M N) :
    Nonempty ((c.comp d).C ≅ Limits.pullback c.right d.left) := sorry

lemma CohCorr.comp_id (c : CohCorr L M) : Nonempty ((c.comp (CohCorr.id M)).C ≅ c.C) := sorry

lemma CohCorr.comp_assoc {W : Scheme.{u}} {P : Dbc Λ W} (c : CohCorr L M) (d : CohCorr M N)
    (e : CohCorr N P) : Nonempty (((c.comp d).comp e).C ≅ (c.comp (d.comp e)).C) := sorry

lemma CohCorr.actionOnCompactCohomology_comp (c d : CohCorr L L) [IsProper c.left] [IsProper d.left]
    [IsProper (c.comp d).left] (q : ℤ) :
    (c.comp d).actionOnCompactCohomology q = c.actionOnCompactCohomology q ≫ d.actionOnCompactCohomology q :=
  sorry

/-- Stand-in: external product `L ⊠ L'` on `X × X'`. -/
def boxProduct {X X' : Scheme.{u}} (L : Dbc Λ X) (L' : Dbc Λ X') : Dbc Λ (X ⨯ X') := sorry

/-- The external product of correspondences. -/
def CohCorr.externalProduct {X' Y' : Scheme.{u}} {L' : Dbc Λ X'} {M' : Dbc Λ Y'} (c : CohCorr L M)
    (c' : CohCorr L' M') : CohCorr (boxProduct L L') (boxProduct M M') := sorry

/-- Test `comp_graphs`. -/
example (f : X ⟶ Y) (g : Y ⟶ Z) (φ : (pullback f).obj M ⟶ L) (ψ : (pullback g).obj N ⟶ M) :
    Nonempty (((CohCorr.ofMorphism g ψ).comp (CohCorr.ofMorphism f φ)).C ≅ X) := sorry

/-- Test `comp_empty`. -/
example (c : CohCorr L M) (d : CohCorr M N) [IsEmpty c.C] : IsEmpty (c.comp d).C := sorry

/-- Test `comp_point`. -/
example (c : CohCorr L M) (d : CohCorr M N) [IsIso c.right] [IsIso d.left] :
    Nonempty ((c.comp d).C ≅ c.C) := sorry

/-- Test `not_comp_support_product`: the composite of two identity correspondences is supported on
`X`, not on `X × X`. -/
example : Nonempty (((CohCorr.id L).comp (CohCorr.id L)).C ≅ X) := sorry

/-- The fixed-point scheme `Fix(c) = C ×_{X × X} X` (node `EDC.8/correspondence-trace`). -/
def CohCorr.fixedLocus (c : CohCorr L L) : Scheme.{u} :=
  Limits.pullback (Limits.prod.lift c.left c.right) (Limits.diag X)

/-- Stand-in: `H⁰(F, K_F)` for a separated scheme of finite type over the base field. -/
def dualizingH0 (Λ : Type u) [CommRing Λ] (F : Scheme.{u}) : ModuleCat.{u} Λ := sorry

/-- The trace class `Tr_c : Hom(←c^*L, →c^!L) → H⁰(Fix(c), K_{Fix(c)})`, additive in `u`. -/
def CohCorr.trace {C : Scheme.{u}} (l r : C ⟶ X) [IsSeparated r] [LocallyOfFiniteType r] :
    ((pullback l).obj L ⟶ (upperShriek r).obj L) →+
      dualizingH0 Λ (Limits.pullback (Limits.prod.lift l r) (Limits.diag X)) := sorry

/-- The local term of a proper clopen part `β` of the fixed locus. -/
/- Review blocker: add the base-field structure map and properness of the clopen component before integration. -/
def CohCorr.localTerm (c : CohCorr L L) {β : Scheme.{u}} (ι : β ⟶ c.fixedLocus) [IsOpenImmersion ι]
    [IsClosedImmersion ι] : Λ := sorry

lemma CohCorr.trace_add {C : Scheme.{u}} (l r : C ⟶ X) [IsSeparated r] [LocallyOfFiniteType r]
    (u u' : (pullback l).obj L ⟶ (upperShriek r).obj L) :
    CohCorr.trace l r (u + u') = CohCorr.trace l r u + CohCorr.trace l r u' := map_add _ _ _

/-- Stand-in: restriction of `u` to an open subscheme `o : C' ⟶ C` of the support. -/
def restrictU {C C' : Scheme.{u}} (l r : C ⟶ X) [IsSeparated r] [LocallyOfFiniteType r] (o : C' ⟶ C)
    [IsOpenImmersion o] [IsSeparated (o ≫ r)] [LocallyOfFiniteType (o ≫ r)]
    (u : (pullback l).obj L ⟶ (upperShriek r).obj L) :
    (pullback (o ≫ l)).obj L ⟶ (upperShriek (o ≫ r)).obj L := sorry

/-- Stand-in: restriction of `H⁰(−, K)` along the open immersion of fixed loci. -/
def restrictH0 {C C' : Scheme.{u}} (l r : C ⟶ X) (o : C' ⟶ C) [IsOpenImmersion o] :
    dualizingH0 Λ (Limits.pullback (Limits.prod.lift l r) (Limits.diag X)) ⟶
      dualizingH0 Λ (Limits.pullback (Limits.prod.lift (o ≫ l) (o ≫ r)) (Limits.diag X)) := sorry

lemma CohCorr.trace_restrictOpen {C C' : Scheme.{u}} (l r : C ⟶ X) [IsSeparated r]
    [LocallyOfFiniteType r] (o : C' ⟶ C) [IsOpenImmersion o] [IsSeparated (o ≫ r)]
    [LocallyOfFiniteType (o ≫ r)] (u : (pullback l).obj L ⟶ (upperShriek r).obj L) :
    (restrictH0 l r o).hom (CohCorr.trace l r u) = CohCorr.trace (o ≫ l) (o ≫ r) (restrictU l r o u) :=
  sorry

/-- Stand-in: integration `H⁰(F, K_F) → Λ` for `F` proper. -/
/- Review blocker: integration requires a structure map to the base and properness; this unscoped data carrier is pending replacement. -/
def integrate (Λ : Type u) [CommRing Λ] (F : Scheme.{u}) : dualizingH0 Λ F ⟶ ModuleCat.of Λ Λ := sorry

lemma CohCorr.localTerm_sum (c : CohCorr L L) {β₁ β₂ : Scheme.{u}} (ι₁ : β₁ ⟶ c.fixedLocus)
    (ι₂ : β₂ ⟶ c.fixedLocus) [IsOpenImmersion ι₁] [IsClosedImmersion ι₁] [IsOpenImmersion ι₂]
    [IsClosedImmersion ι₂] (h : Set.range ι₁.base = (Set.range ι₂.base)ᶜ) :
    c.localTerm ι₁ + c.localTerm ι₂ = (integrate Λ c.fixedLocus).hom (CohCorr.trace c.left c.right c.u) :=
  sorry

/-- Test `trace_empty_fixedLocus`. -/
example (c : CohCorr L L) [IsEmpty c.fixedLocus] : Subsingleton (dualizingH0 Λ c.fixedLocus) := sorry

/-- Stand-in: the naive local term `Tr(u_x | L_x)` at a point `x : β ⟶ X`. -/
def naiveLocalTerm {L : Dbc Λ X} (F : X ⟶ X) (φ : (pullback F).obj L ⟶ L) {β : Scheme.{u}} (x : β ⟶ X) : Λ :=
  sorry

/-- Test `trace_identity_euler`: for the identity correspondence of `Λ_X`, `X` proper over a
separably closed field, `∫ Tr(id) = χ(X, Λ)`. -/
example {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [IsProper a] (d : ℕ) [SmoothOfRelativeDimension d a] :
    (integrate Λ (CohCorr.id (constant (Λ := Λ) X)).fixedLocus).hom
        (CohCorr.trace (CohCorr.id (constant (Λ := Λ) X)).left (CohCorr.id (constant (Λ := Λ) X)).right
          (CohCorr.id (constant (Λ := Λ) X)).u) =
      ∑ q ∈ Finset.range (2 * d + 1), (-1 : Λ) ^ q *
        (Module.finrank Λ (compactCohomology (q : ℤ) (constant (Λ := Λ) X)) : Λ) := sorry

/-- Test `localTerm_isolated_identity`: over `Spec Ω`, the local term of `φ ∈ End(L)` on the
identity correspondence is the naive local term (alternating trace of `φ` on the stalk). -/
example {Λ : Type u} [Field Λ] (Ω : Type u) [Field Ω] [IsSepClosed Ω]
    (L : Dbc Λ (Spec (CommRingCat.of Ω))) (φ : (pullback (𝟙 (Spec (CommRingCat.of Ω)))).obj L ⟶ L) :
    (CohCorr.ofMorphism (𝟙 _) φ).localTerm (𝟙 _) =
      naiveLocalTerm (𝟙 _) φ (Limits.pullback.snd (Limits.prod.lift (CohCorr.ofMorphism (𝟙 _) φ).left
        (CohCorr.ofMorphism (𝟙 _) φ).right) (Limits.diag (Spec (CommRingCat.of Ω)))) := sorry

/-- Test `not_trace_naive_nonisolated`: for `c = Δ` on a curve with `H⁰ = Λ`, `H¹ = 0`, `H² = Λ`
(as `P¹`), the local term of the whole (non-isolated) fixed locus is the Euler characteristic `2`. -/
example {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k] {X : Scheme.{u}}
    (a : X ⟶ Spec (CommRingCat.of k)) [IsProper a] [SmoothOfRelativeDimension 1 a]
    (h0 : Module.finrank Λ (cohomology (0 : ℤ) (constant (Λ := Λ) X)) = 1)
    (h1 : Module.finrank Λ (cohomology (1 : ℤ) (constant (Λ := Λ) X)) = 0)
    (h2 : Module.finrank Λ (cohomology (2 : ℤ) (constant (Λ := Λ) X)) = 1) :
    (CohCorr.id (constant (Λ := Λ) X)).localTerm (𝟙 _) = 2 := sorry

/-- Named theorem `EDC.8/lefschetz-verdier-formula` (global form). -/
theorem lefschetz_verdier_formula {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} {L : Dbc Λ X} (a : X ⟶ Spec (CommRingCat.of k)) [IsProper a] (c : CohCorr L L)
    [IsProper c.left] [IsProper (Limits.pullback.snd (Limits.prod.lift c.left c.right) (Limits.diag X) ≫ a)]
    (S : Finset ℤ) (hS : ∀ q ∉ S, IsZero (compactCohomology q L))
    [∀ q : ℤ, FiniteDimensional Λ (compactCohomology q L)] :
    ∑ q ∈ S, (-1 : Λ) ^ q.natAbs *
        LinearMap.trace Λ _ (c.actionOnCompactCohomology q).hom =
      (integrate Λ c.fixedLocus).hom (CohCorr.trace c.left c.right c.u) := sorry

/-- Named theorem `EDC.8/local-terms-finite-order`: at an isolated fixed point `β` (a single point)
of an automorphism of finite order prime to the characteristic, true and naive local terms agree. -/
theorem local_terms_finite_order {Λ : Type u} [Field Λ] {k : Type u} [Field k] [IsAlgClosed k]
    {X : Scheme.{u}} {L : Dbc Λ X} (a : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFiniteType a]
    (g : X ≅ X) (n : ℕ) (hn : (n : k) ≠ 0) (hg : (g.hom.base)^[n] = id) (φ : (pullback g.hom).obj L ⟶ L)
    {β : Scheme.{u}} [Unique β] (ι : β ⟶ (CohCorr.ofMorphism g.hom φ).fixedLocus) [IsOpenImmersion ι]
    [IsClosedImmersion ι] :
    (CohCorr.ofMorphism g.hom φ).localTerm ι =
      naiveLocalTerm g.hom φ (ι ≫ Limits.pullback.snd _ _) := sorry

/-- Named theorem `EDC.8/similitude-reciprocal-charpoly`. -/
theorem similitude_reciprocal_charpoly {F V W : Type*} [Field F] [AddCommGroup V] [Module F V]
    [AddCommGroup W] [Module F W] [FiniteDimensional F V] [FiniteDimensional F W]
    (B : V →ₗ[F] W →ₗ[F] F) [B.IsPerfPair] (φ : V →ₗ[F] V) (ψ : W →ₗ[F] W) (c : F) (hc : c ≠ 0)
    (h : ∀ v w, B (φ v) (ψ w) = c * B v w) :
    LinearMap.det φ * LinearMap.det ψ = c ^ Module.finrank F V ∧
      ∀ α : F, Module.End.HasEigenvalue φ α → Module.End.HasEigenvalue ψ (c / α) := sorry

/-- Named theorem `EDC.8/middle-degree-determinant`. -/
theorem middle_degree_determinant {F V : Type*} [Field F] [CharZero F] [AddCommGroup V] [Module F V]
    [FiniteDimensional F V] (B : LinearMap.BilinForm F V) (hB : B.Nondegenerate) (φ : V →ₗ[F] V)
    (c : F) (h : ∀ v w, B (φ v) (φ w) = c * B v w) :
    (LinearMap.det φ) ^ 2 = c ^ Module.finrank F V ∧
      (B.IsAlt → ∃ m : ℕ, Module.finrank F V = 2 * m ∧ LinearMap.det φ = c ^ m) := sorry

/-- Stand-in: the geometric Frobenius on `H^q(X_{𝔽̄_q}, Λ)` for `X₀` over `𝔽_q`. -/
def geometricFrobenius {Λ : Type u} [Field Λ] (X : Scheme.{u}) (q : ℤ) :
    cohomology q (constant (Λ := Λ) X) ⟶ cohomology q (constant (Λ := Λ) X) := sorry

/-- Named theorem `EDC.8/poincare-pairing-reciprocity-export` (determinant relation):
`det(F | H^i) · det(F | H^{2d−i}) = q^{d·b_i}` for `X` smooth proper over a finite field `𝔽_q`. -/
theorem poincare_pairing_reciprocity {Λ : Type u} [Field Λ] [CharZero Λ] {Fq : Type u} [Field Fq]
    [Fintype Fq] {X : Scheme.{u}} (a : X ⟶ Spec (CommRingCat.of Fq)) (d : ℕ) [IsProper a]
    [SmoothOfRelativeDimension d a] (i : ℕ) (hi : i ≤ 2 * d) :
    LinearMap.det (geometricFrobenius (Λ := Λ) X i).hom *
      LinearMap.det (geometricFrobenius (Λ := Λ) X ((2 * d - i : ℕ) : ℤ)).hom =
      ((Fintype.card Fq : ℕ) : Λ) ^ (d * Module.finrank Λ (cohomology (i : ℤ) (constant (Λ := Λ) X))) :=
  sorry

end Correspondences


end TauCeti.EtaleDuality
