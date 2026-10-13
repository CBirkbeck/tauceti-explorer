import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Triangulated.TStructure.AbelianSubcategory
import Mathlib.CategoryTheory.Triangulated.TStructure.TruncLEGT
import Mathlib.CategoryTheory.Triangulated.TStructure.TruncLTGE
import Mathlib.CategoryTheory.Triangulated.Functor
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Simple
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Topology.KrullDimension
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType

/-!
# Étale duality, cycle classes and perverse sheaves — EDC.5: representative target signatures

This file is not the roadmap and is not exhaustive. The reader document
`EtaleDualityAndPerverseSheaves--EDC.5.md` is definitive; these statements suggest Lean forms so
that contributors and reviewers converge on names and signatures.

Only what the pinned Mathlib can type is stated. Mathlib has t-structures, their truncations and
the heart as an object property, and the `AbelianSubcategory` criterion. The t-exactness
predicates, the recollement structure, the glued t-structure, the heart's abelian structure, the
tilt along a torsion theory, the dimension of a point and the pointwise stalk condition below have
real bodies; proofs of propositions are left open. Costalks `i_x^!`, constructible complexes,
`Rf_!`, the perverse t-structure itself, intermediate extension, intersection complexes and the
ℓ-adic categories need carriers that the pins do not have; they are targets of the reader only and
are listed at the end of the file.

Design choices: aisles are Mathlib's `ObjectProperty`s; a recollement carries its six functors and
four adjunctions as data, with triangulated structure on the two given functors and the two
localization triangles as propositions; the middle perversity is measured by the dimension of the
closure of a point, never by its codimension.
-/

noncomputable section

open CategoryTheory Limits Pretriangulated Triangulated

namespace TauCeti.EtaleDuality

universe u v

/-! ## Layer EDC.5a: t-exactness, the heart, recollement, gluing and tilting -/

section TExact

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]
  {D : Type*} [Category D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- `T` is right t-exact: it maps `t₁.le 0` into `t₂.le 0` (BBD 1.3.16). -/
def Functor.IsRightTExact (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) : Prop :=
  ∀ X : C, t₁.le 0 X → t₂.le 0 (T.obj X)

/-- `T` is left t-exact: it maps `t₁.ge 0` into `t₂.ge 0` (BBD 1.3.16). -/
def Functor.IsLeftTExact (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) : Prop :=
  ∀ X : C, t₁.ge 0 X → t₂.ge 0 (T.obj X)

/-- `T` is t-exact: left and right t-exact. -/
def Functor.IsTExact (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) : Prop :=
  Functor.IsRightTExact t₁ t₂ T ∧ Functor.IsLeftTExact t₁ t₂ T

/-- A triangulated right t-exact functor maps `t₁.le n` into `t₂.le n` for every `n`. -/
theorem Functor.IsRightTExact.le {t₁ : TStructure C} {t₂ : TStructure D} {T : C ⥤ D}
    [T.CommShift ℤ] [T.IsTriangulated] (hT : Functor.IsRightTExact t₁ t₂ T) (n : ℤ) (X : C)
    (hX : t₁.le n X) : t₂.le n (T.obj X) := by
  sorry

/-- Composites of right t-exact functors are right t-exact. -/
theorem Functor.IsRightTExact.comp {E : Type*} [Category E] [Preadditive E] [HasZeroObject E]
    [HasShift E ℤ] [∀ n : ℤ, (shiftFunctor E n).Additive] [Pretriangulated E]
    {t₁ : TStructure C} {t₂ : TStructure D} {t₃ : TStructure E} {T : C ⥤ D} {U : D ⥤ E}
    (hT : Functor.IsRightTExact t₁ t₂ T) (hU : Functor.IsRightTExact t₂ t₃ U) :
    Functor.IsRightTExact t₁ t₃ (T ⋙ U) :=
  fun X hX ↦ hU _ (hT X hX)

/-- Composites of left t-exact functors are left t-exact. -/
theorem Functor.IsLeftTExact.comp {E : Type*} [Category E] [Preadditive E] [HasZeroObject E]
    [HasShift E ℤ] [∀ n : ℤ, (shiftFunctor E n).Additive] [Pretriangulated E]
    {t₁ : TStructure C} {t₂ : TStructure D} {t₃ : TStructure E} {T : C ⥤ D} {U : D ⥤ E}
    (hT : Functor.IsLeftTExact t₁ t₂ T) (hU : Functor.IsLeftTExact t₂ t₃ U) :
    Functor.IsLeftTExact t₁ t₃ (T ⋙ U) :=
  fun X hX ↦ hU _ (hT X hX)

/-- The adjoint criterion (BBD 1.3.17 (iii)): for triangulated `L ⊣ R`, `L` is right t-exact
iff `R` is left t-exact. -/
theorem Functor.isRightTExact_iff_isLeftTExact_of_adjunction {t₁ : TStructure C}
    {t₂ : TStructure D} {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) [L.CommShift ℤ] [R.CommShift ℤ]
    [L.IsTriangulated] [R.IsTriangulated] :
    Functor.IsRightTExact t₁ t₂ L ↔ Functor.IsLeftTExact t₂ t₁ R := by
  sorry

/-- Unit test `isTExact_id`: the identity is t-exact. -/
example (t : TStructure C) : Functor.IsTExact t t (𝟭 C) :=
  ⟨fun _ h ↦ h, fun _ h ↦ h⟩

/-- Unit test `isRightTExact_shift_one`: the shift `[1]` is right t-exact. -/
example (t : TStructure C) : Functor.IsRightTExact t t (shiftFunctor C (1 : ℤ)) := by
  sorry

end TExact

section Heart

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- Negative-shift morphisms between objects of the heart vanish (BBD 1.3.6). -/
theorem heart_hom_neg_eq_zero (t : TStructure C) ⦃X Y : t.heart.FullSubcategory⦄ ⦃n : ℤ⦄
    (f : t.heart.ι.obj X ⟶ (t.heart.ι.obj Y)⟦n⟧) (hn : n < 0) : f = 0 := by
  sorry

/-- Every morphism of the heart is admissible in the sense of Mathlib's criterion (BBD 1.3.6). -/
theorem heart_admissible (t : TStructure C) :
    AbelianSubcategory.admissibleMorphism t.heart.ι = ⊤ := by
  sorry

/-- The heart is closed under finite direct sums (BBD 1.3.4). -/
theorem heart_hasFiniteProducts (t : TStructure C) :
    HasFiniteProducts t.heart.FullSubcategory := by
  sorry

/-- The abelian structure on the heart, from Mathlib's admissible-subcategory criterion. -/
@[instance_reducible]
noncomputable def heartAbelian [IsTriangulated C] (t : TStructure C) :
    Abelian t.heart.FullSubcategory :=
  haveI := heart_hasFiniteProducts t
  AbelianSubcategory.abelian t.heart.ι (heart_hom_neg_eq_zero t) (heart_admissible t)

end Heart

section Recollement

variable (DF D DU : Type*) [Category DF] [Category D] [Category DU]
  [Preadditive DF] [Preadditive D] [Preadditive DU]
  [HasZeroObject DF] [HasZeroObject D] [HasZeroObject DU]
  [HasShift DF ℤ] [HasShift D ℤ] [HasShift DU ℤ]
  [∀ n : ℤ, (shiftFunctor DF n).Additive] [∀ n : ℤ, (shiftFunctor D n).Additive]
  [∀ n : ℤ, (shiftFunctor DU n).Additive]
  [Pretriangulated DF] [Pretriangulated D] [Pretriangulated DU]

/-- A recollement `DF → D → DU` (BBD 1.4.3): the functors `i_*`, `j^*` with adjoints
`i^* ⊣ i_* ⊣ i^!` and `j_! ⊣ j^* ⊣ j_*`, the vanishing `j^* i_* = 0`, the two localization
triangles built from the adjunction maps, and full faithfulness of `i_*`, `j_!`, `j_*`. -/
structure Recollement where
  /-- `i_*`. -/
  iLowerStar : DF ⥤ D
  /-- `j^*`. -/
  jUpperStar : D ⥤ DU
  /-- `i^*`. -/
  iUpperStar : D ⥤ DF
  /-- `i^!`. -/
  iUpperShriek : D ⥤ DF
  /-- `j_!`. -/
  jLowerShriek : DU ⥤ D
  /-- `j_*`. -/
  jLowerStar : DU ⥤ D
  /-- `i^* ⊣ i_*`. -/
  adjI : iUpperStar ⊣ iLowerStar
  /-- `i_* ⊣ i^!`. -/
  adjI' : iLowerStar ⊣ iUpperShriek
  /-- `j_! ⊣ j^*`. -/
  adjJ : jLowerShriek ⊣ jUpperStar
  /-- `j^* ⊣ j_*`. -/
  adjJ' : jUpperStar ⊣ jLowerStar
  [iLowerStar_commShift : iLowerStar.CommShift ℤ]
  [jUpperStar_commShift : jUpperStar.CommShift ℤ]
  iLowerStar_isTriangulated : iLowerStar.IsTriangulated
  jUpperStar_isTriangulated : jUpperStar.IsTriangulated
  jUpperStar_iLowerStar (X : DF) : IsZero (jUpperStar.obj (iLowerStar.obj X))
  triangle_lowerShriek (K : D) :
    ∃ δ : iLowerStar.obj (iUpperStar.obj K) ⟶ (jLowerShriek.obj (jUpperStar.obj K))⟦(1 : ℤ)⟧,
      Triangle.mk (adjJ.counit.app K) (adjI.unit.app K) δ ∈ distTriang D
  triangle_upperShriek (K : D) :
    ∃ δ : jLowerStar.obj (jUpperStar.obj K) ⟶ (iLowerStar.obj (iUpperShriek.obj K))⟦(1 : ℤ)⟧,
      Triangle.mk (adjI'.counit.app K) (adjJ'.unit.app K) δ ∈ distTriang D
  isIso_adjI_counit : IsIso adjI.counit
  isIso_adjJ_unit : IsIso adjJ.unit
  isIso_adjJ'_counit : IsIso adjJ'.counit

variable {DF D DU}

namespace Recollement

variable (r : Recollement DF D DU) (tF : TStructure DF) (tU : TStructure DU)

/-- The glued upper aisle (BBD 1.4.9): `j^*K ∈ DU^{≤n}` and `i^*K ∈ DF^{≤n}`. -/
def gluedLE (n : ℤ) : ObjectProperty D :=
  fun K ↦ tU.le n (r.jUpperStar.obj K) ∧ tF.le n (r.iUpperStar.obj K)

/-- The glued lower aisle (BBD 1.4.9): `j^*K ∈ DU^{≥n}` and `i^!K ∈ DF^{≥n}`. -/
def gluedGE (n : ℤ) : ObjectProperty D :=
  fun K ↦ tU.ge n (r.jUpperStar.obj K) ∧ tF.ge n (r.iUpperShriek.obj K)

/-- The glued t-structure (BBD 1.4.10): its aisles are `gluedLE` and `gluedGE`; the axioms are
the content of the theorem. -/
def gluedTStructure [IsTriangulated D] : TStructure D where
  le := r.gluedLE tF tU
  ge := r.gluedGE tF tU
  le_isClosedUnderIsomorphisms _ := sorry
  ge_isClosedUnderIsomorphisms _ := sorry
  le_shift := sorry
  ge_shift := sorry
  zero' := sorry
  le_zero_le := sorry
  ge_one_le := sorry
  exists_triangle_zero_one := sorry

/-- In the glued t-structure `j^*` is t-exact (BBD 1.4.16). -/
theorem gluedTStructure_jUpperStar_isTExact [IsTriangulated D] :
    Functor.IsTExact (r.gluedTStructure tF tU) tU r.jUpperStar :=
  ⟨fun _ h ↦ h.1, fun _ h ↦ h.1⟩

/-- In the glued t-structure `i_*` is t-exact (BBD 1.4.16). -/
theorem gluedTStructure_iLowerStar_isTExact [IsTriangulated D] :
    Functor.IsTExact tF (r.gluedTStructure tF tU) r.iLowerStar := by
  sorry

/-- In the glued t-structure `j_!` and `i^*` are right t-exact (BBD 1.4.16). -/
theorem gluedTStructure_rightTExact [IsTriangulated D] :
    Functor.IsRightTExact tU (r.gluedTStructure tF tU) r.jLowerShriek ∧
      Functor.IsRightTExact (r.gluedTStructure tF tU) tF r.iUpperStar := by
  sorry

/-- In the glued t-structure `j_*` and `i^!` are left t-exact (BBD 1.4.16). -/
theorem gluedTStructure_leftTExact [IsTriangulated D] :
    Functor.IsLeftTExact tU (r.gluedTStructure tF tU) r.jLowerStar ∧
      Functor.IsLeftTExact (r.gluedTStructure tF tU) tF r.iUpperShriek := by
  sorry

/-- The converse (BBD 1.4.12): a t-structure on `D` is glued exactly when `j_! j^*` is right
t-exact; then it is glued from `j^*`-images and `i^*`-images of its aisles. -/
theorem isGlued_iff [IsTriangulated D] (t : TStructure D) :
    Functor.IsRightTExact t t (r.jUpperStar ⋙ r.jLowerShriek) ↔
      ∃ (tF' : TStructure DF) (tU' : TStructure DU), t.le 0 = r.gluedLE tF' tU' 0 ∧
        t.ge 0 = r.gluedGE tF' tU' 0 := by
  sorry

end Recollement

end Recollement

section Tilt

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- A torsion theory on the heart of `t`, recorded on objects of `C` lying in the heart:
`Hom(T, F) = 0`, and every object of the heart sits in a triangle `T → A → F → T[1]`. Both classes
are closed under isomorphism, so that the tilted aisles are. -/
structure TStructure.TorsionTheory (t : TStructure C) where
  /-- The torsion objects. -/
  torsion : ObjectProperty C
  /-- The torsion-free objects. -/
  free : ObjectProperty C
  torsion_le_heart : torsion ≤ t.heart
  free_le_heart : free ≤ t.heart
  torsion_isClosedUnderIsomorphisms : torsion.IsClosedUnderIsomorphisms
  free_isClosedUnderIsomorphisms : free.IsClosedUnderIsomorphisms
  hom_eq_zero ⦃T F : C⦄ (hT : torsion T) (hF : free F) (f : T ⟶ F) : f = 0
  exists_triangle (A : C) (hA : t.heart A) :
    ∃ (T F : C) (_ : torsion T) (_ : free F) (a : T ⟶ A) (b : A ⟶ F) (c : F ⟶ T⟦(1 : ℤ)⟧),
      Triangle.mk a b c ∈ distTriang C

/-- The upper aisle of the tilt: `X ∈ t.le 1` with `H¹_t X` torsion (Juteau 1.3.6). -/
def TStructure.tiltLE (t : TStructure C) (τ : TStructure.TorsionTheory t) : ObjectProperty C :=
  fun X ↦ t.le 1 X ∧ τ.torsion (((t.truncGE 1).obj X)⟦(1 : ℤ)⟧)

/-- The lower aisle of the tilt: `X ∈ t.ge 0` with `H⁰_t X` torsion-free (Juteau 1.3.6). -/
def TStructure.tiltGE (t : TStructure C) (τ : TStructure.TorsionTheory t) : ObjectProperty C :=
  fun X ↦ t.ge 0 X ∧ τ.free ((t.truncLE 0).obj X)

/-- The tilted t-structure `t⁺` (BBD 3.3.4, Juteau Proposition 1.3.6). -/
def TStructure.tilt [IsTriangulated C] (t : TStructure C) (τ : TStructure.TorsionTheory t) :
    TStructure C where
  le n := fun X ↦ TStructure.tiltLE t τ (X⟦n⟧)
  ge n := fun X ↦ TStructure.tiltGE t τ (X⟦n⟧)
  le_isClosedUnderIsomorphisms _ := sorry
  ge_isClosedUnderIsomorphisms _ := sorry
  le_shift := sorry
  ge_shift := sorry
  zero' := sorry
  le_zero_le := sorry
  ge_one_le := sorry
  exists_triangle_zero_one := sorry

/-- `t.le 0 ⊆ t⁺.le 0 ⊆ t.le 1`. -/
theorem TStructure.le_le_tilt [IsTriangulated C] (t : TStructure C) (τ : TStructure.TorsionTheory t) :
    t.le 0 ≤ (TStructure.tilt t τ).le 0 ∧ (TStructure.tilt t τ).le 0 ≤ t.le 1 := by
  sorry

/-- `X ∈ t⁺.le 0` iff `X ∈ t.le 1` and `H¹_t X` is torsion. -/
theorem TStructure.tilt_le_iff [IsTriangulated C] (t : TStructure C) (τ : TStructure.TorsionTheory t)
    (X : C) : (TStructure.tilt t τ).le 0 X ↔ TStructure.tiltLE t τ X := by
  sorry

/-- `X ∈ t⁺.ge 0` iff `X ∈ t.ge 0` and `H⁰_t X` is torsion-free. -/
theorem TStructure.tilt_ge_iff [IsTriangulated C] (t : TStructure C) (τ : TStructure.TorsionTheory t)
    (X : C) : (TStructure.tilt t τ).ge 0 X ↔ TStructure.tiltGE t τ X := by
  sorry

/-- `t.ge 1 ⊆ t⁺.ge 0 ⊆ t.ge 0`. -/
theorem TStructure.ge_tilt_ge [IsTriangulated C] (t : TStructure C) (τ : TStructure.TorsionTheory t) :
    t.ge 1 ≤ (TStructure.tilt t τ).ge 0 ∧ (TStructure.tilt t τ).ge 0 ≤ t.ge 0 := by
  sorry

end Tilt

/-! ## Layer EDC.5b: the dimension of a point and the pointwise stalk condition -/

section Dimension

/-- `dim(x)`: the Krull dimension of the closure of `x` (BBD 4.0). The middle perversity is
`−dim(x)`; it is measured by dimension, never by codimension. -/
def pointDim {X : Type*} [TopologicalSpace X] (x : X) : WithBot ℕ∞ :=
  topologicalKrullDim (closure ({x} : Set X))

/-- The middle cutoff for stalks: `ℋ^m` must vanish at `x` when `m > −dim(x)`. -/
def AboveMiddleCutoff {X : Type*} [TopologicalSpace X] (x : X) (m : ℤ) : Prop :=
  0 < m ∨ ((((-m).toNat : ℕ) : ℕ∞) : WithBot ℕ∞) < pointDim x

/-- A closed point has dimension zero. -/
theorem pointDim_closedPoint {X : Type*} [TopologicalSpace X] {x : X}
    (hx : IsClosed ({x} : Set X)) : pointDim x = 0 := by
  sorry

/-- On a scheme locally of finite type over a field, `dim` drops strictly under proper
specialization. -/
theorem pointDim_lt_of_specializes {k : Type u} [Field k] {X : AlgebraicGeometry.Scheme.{u}}
    (f : X ⟶ AlgebraicGeometry.Spec (.of k)) [AlgebraicGeometry.LocallyOfFiniteType f]
    {x y : X} (h : x ⤳ y) (hne : x ≠ y) : pointDim y < pointDim x := by
  sorry

/-- A point is above the cutoff in every positive degree. -/
example {X : Type*} [TopologicalSpace X] (x : X) : AboveMiddleCutoff x 1 :=
  Or.inl one_pos

end Dimension

section Stalk

open AlgebraicGeometry

attribute [local instance] HasDerivedCategory.standard

variable {X : Scheme.{u}} (Λ : Type u) [CommRing Λ]

/-- The upper perverse aisle on Mathlib's étale derived category, by geometric stalks of the
cohomology sheaves (BBD (4.0.1)): `ℋ^m(K)_x̄ = 0` whenever `m > −dim(x)`. The lower aisle needs
the costalks `i_x^!`, which the pins do not have. -/
def perverseLE (K : DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ))) : Prop :=
  ∀ (Ω : Type u) [Field Ω] [IsSepClosed Ω] (s : Spec (.of Ω) ⟶ X) (m : ℤ),
    AboveMiddleCutoff (s default) m →
      IsZero ((Scheme.pointSmallEtale s).sheafFiber.obj
        ((DerivedCategory.homologyFunctor _ m).obj K))

/-- `pD^{≤0} ⊆ D^{≤0}` (BBD (2.1.2.1)). -/
theorem perverseLE_le (K : DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)))
    (hK : perverseLE Λ K) : (DerivedCategory.TStructure.t).le 0 K := by
  sorry

/-- `D^{≤ −d} ⊆ pD^{≤0}` when `X` has dimension at most `d` (BBD (2.1.2.1)). -/
theorem perverseLE_of_le {d : ℕ} (hX : topologicalKrullDim X ≤ d)
    (K : DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)))
    (hK : (DerivedCategory.TStructure.t).le (-(d : ℤ)) K) : perverseLE Λ K := by
  sorry

end Stalk

section DimensionExamples

/-- Unit test `pointDim_spec_field`: the unique point of `Spec k` has dimension zero. -/
example (k : Type u) [Field k] (x : AlgebraicGeometry.Spec (.of k)) : pointDim x = 0 := by
  sorry

open AlgebraicGeometry in
attribute [local instance] HasDerivedCategory.standard in
/-- Unit test `perverse_empty`: on the empty scheme every complex satisfies the stalk condition. -/
example {X : Scheme.{u}} (Λ : Type u) [CommRing Λ] [IsEmpty X]
    (K : DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ))) : perverseLE Λ K := by
  sorry

end DimensionExamples

/-! ## Layer EDC.5a, continued: t-cohomology, canonical examples and intermediate extension -/

section Cohomology

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- `τ_{≥0} τ_{≤0} X` lies in the heart (BBD 1.3.5). -/
theorem truncGE_truncLE_mem_heart (t : TStructure C) (X : C) :
    t.heart ((t.truncLE 0 ⋙ t.truncGE 0).obj X) := by
  sorry

/-- `H⁰_t := τ_{≥0} τ_{≤0}`, lifted to the heart (BBD 1.3.6). -/
def TStructure.homologyZero (t : TStructure C) : C ⥤ t.heart.FullSubcategory :=
  t.heart.lift (t.truncLE 0 ⋙ t.truncGE 0) (truncGE_truncLE_mem_heart t)

/-- `H^m_t := H⁰_t ∘ [m]`. -/
def TStructure.homology (t : TStructure C) (m : ℤ) : C ⥤ t.heart.FullSubcategory :=
  shiftFunctor C m ⋙ TStructure.homologyZero t

/-- `H⁰_t` is a homological functor to the abelian heart (BBD 1.3.6). -/
theorem TStructure.homologyZero_isHomological [IsTriangulated C] (t : TStructure C) :
    letI := heartAbelian t
    (TStructure.homologyZero t).IsHomological := by
  sorry

/-- Detection on t-bounded objects (BBD 1.3.7). -/
theorem TStructure.isZero_of_homology_isZero (t : TStructure C) (X : C) (hX : t.bounded X)
    (h : ∀ m : ℤ, IsZero ((TStructure.homology t m).obj X)) : IsZero X := by
  sorry

/-- Unit test `not_isZero_of_homology_unbounded`: the bounded hypothesis cannot be dropped; if
every object lies in every `t.le n` (a degenerate t-structure), then all t-cohomology vanishes,
also on nonzero objects. -/
example (t : TStructure C) (ht : ∀ (n : ℤ) (X : C), t.le n X) (X : C) (m : ℤ) :
    IsZero ((TStructure.homology t m).obj X) := by
  sorry

open ZeroObject in
/-- Unit test `homologyZero_zero`: `H⁰_t 0 ≅ 0`. -/
example (t : TStructure C) : IsZero ((TStructure.homologyZero t).obj 0) := by
  sorry

end Cohomology

section Canonical

variable {A : Type*} [Category A] [Abelian A] [HasDerivedCategory A]
  {B : Type*} [Category B] [Abelian B] [HasDerivedCategory B]

/-- An exact functor of abelian categories induces a t-exact functor on derived categories for
the canonical t-structures. -/
theorem isTExact_mapDerivedCategory (F : A ⥤ B) [F.Additive] [PreservesFiniteLimits F]
    [PreservesFiniteColimits F] :
    Functor.IsTExact DerivedCategory.TStructure.t DerivedCategory.TStructure.t
      F.mapDerivedCategory := by
  sorry

/-- For the canonical t-structure the shift `[1]` is not left t-exact as soon as `A ≠ 0`. -/
theorem not_isLeftTExact_shift_one (X : A) (hX : ¬ IsZero X) :
    ¬ Functor.IsLeftTExact (DerivedCategory.TStructure.t : TStructure (DerivedCategory A))
      DerivedCategory.TStructure.t (shiftFunctor (DerivedCategory A) (1 : ℤ)) := by
  sorry

/-- An object of `A` placed in degree `0` lies in the canonical heart (BBD 1.3.6, Exemple). -/
example (X : A) :
    (DerivedCategory.TStructure.t : TStructure (DerivedCategory A)).heart
      ((DerivedCategory.singleFunctor A 0).obj X) := by
  sorry

end Canonical

section IntermediateExtension

variable {DF D DU : Type*} [Category DF] [Category D] [Category DU]
  [Preadditive DF] [Preadditive D] [Preadditive DU]
  [HasZeroObject DF] [HasZeroObject D] [HasZeroObject DU]
  [HasShift DF ℤ] [HasShift D ℤ] [HasShift DU ℤ]
  [∀ n : ℤ, (shiftFunctor DF n).Additive] [∀ n : ℤ, (shiftFunctor D n).Additive]
  [∀ n : ℤ, (shiftFunctor DU n).Additive]
  [Pretriangulated DF] [Pretriangulated D] [Pretriangulated DU] [IsTriangulated D]
  (r : Recollement DF D DU) (tF : TStructure DF) (tU : TStructure DU)

namespace Recollement

/-- The canonical map `j_! B → j_* B`, adjoint to the inverse of the unit `B ≅ j^* j_! B`. -/
def lowerShriekToLowerStar (B : DU) : r.jLowerShriek.obj B ⟶ r.jLowerStar.obj B :=
  haveI := r.isIso_adjJ_unit
  (r.adjJ'.homEquiv _ _) (inv (r.adjJ.unit.app B))

/-- The intermediate extension `j_!* B`: the image of `pj_! B → pj_* B` in the abelian heart
of the glued t-structure (BBD 1.4.22). -/
def intermediateExtension (B : tU.heart.FullSubcategory) :
    (r.gluedTStructure tF tU).heart.FullSubcategory :=
  letI := heartAbelian (r.gluedTStructure tF tU)
  Abelian.image ((TStructure.homologyZero (r.gluedTStructure tF tU)).map
    (r.lowerShriekToLowerStar B.obj))

/-- `j^* j_!* B ≅ B` (BBD 1.4.23). -/
theorem upperStar_intermediateExtension (B : tU.heart.FullSubcategory) :
    Nonempty (r.jUpperStar.obj (r.intermediateExtension tF tU B).obj ≅ B.obj) := by
  sorry

/-- `j_!* B` is the unique extension `X` of `B` with `i^* X ∈ DF^{≤ −1}` and `i^! X ∈ DF^{≥ 1}`
(BBD 1.4.24). -/
theorem intermediateExtension_unique (B : tU.heart.FullSubcategory) (X : D)
    (e : r.jUpperStar.obj X ≅ B.obj) (h₁ : tF.le (-1) (r.iUpperStar.obj X))
    (h₂ : tF.ge 1 (r.iUpperShriek.obj X)) :
    Nonempty (X ≅ (r.intermediateExtension tF tU B).obj) := by
  sorry

end Recollement

end IntermediateExtension

/-! ## Layer EDC.5a, continued: heart functors, recollement identities and simple objects -/

section HeartFunctors

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]
  {D : Type*} [Category D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- `H⁰_t X ≅ X` for `X` in the heart. -/
theorem TStructure.homologyZeroIsoOfMemHeart (t : TStructure C) (X : t.heart.FullSubcategory) :
    Nonempty ((TStructure.homologyZero t).obj X.obj ≅ X) := by
  sorry

/-- `H^m_t(X[a]) ≅ H^{m+a}_t(X)`. -/
theorem TStructure.homology_shift (t : TStructure C) (m a : ℤ) (X : C) :
    Nonempty ((TStructure.homology t m).obj (X⟦a⟧) ≅ (TStructure.homology t (m + a)).obj X) := by
  sorry

/-- For t-bounded `X`: `X ∈ t.le n` iff `H^m_t X = 0` for all `m > n` (BBD 1.3.7). -/
theorem TStructure.isLE_iff_homology (t : TStructure C) (X : C) (hX : t.bounded X) (n : ℤ) :
    t.le n X ↔ ∀ m : ℤ, n < m → IsZero ((TStructure.homology t m).obj X) := by
  sorry

/-- The induced functor on hearts `pT := H⁰_{t₂} ∘ T ∘ ι` (BBD 1.3.17). -/
def Functor.heartFunctor (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) :
    t₁.heart.FullSubcategory ⥤ t₂.heart.FullSubcategory :=
  t₁.heart.ι ⋙ T ⋙ TStructure.homologyZero t₂

/-- A right t-exact functor induces a right exact functor on hearts (BBD 1.3.17 (i)). -/
theorem Functor.heartFunctor_preservesFiniteColimits [IsTriangulated C] [IsTriangulated D]
    (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) [T.CommShift ℤ] [T.IsTriangulated]
    (hT : Functor.IsRightTExact t₁ t₂ T) :
    letI := heartAbelian t₁
    letI := heartAbelian t₂
    PreservesFiniteColimits (Functor.heartFunctor t₁ t₂ T) := by
  sorry

/-- A left t-exact functor induces a left exact functor on hearts (BBD 1.3.17 (i)). -/
theorem Functor.heartFunctor_preservesFiniteLimits [IsTriangulated C] [IsTriangulated D]
    (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D) [T.CommShift ℤ] [T.IsTriangulated]
    (hT : Functor.IsLeftTExact t₁ t₂ T) :
    letI := heartAbelian t₁
    letI := heartAbelian t₂
    PreservesFiniteLimits (Functor.heartFunctor t₁ t₂ T) := by
  sorry

/-- For `L ⊣ R` triangulated with `L` right t-exact, `pL ⊣ pR` on hearts (BBD 1.3.17 (iii)). -/
theorem Functor.heartAdjunction (t₁ : TStructure C) (t₂ : TStructure D) {L : C ⥤ D}
    {R : D ⥤ C} (adj : L ⊣ R) [L.CommShift ℤ] [R.CommShift ℤ] [L.IsTriangulated]
    [R.IsTriangulated] (hL : Functor.IsRightTExact t₁ t₂ L) :
    Nonempty (Functor.heartFunctor t₁ t₂ L ⊣ Functor.heartFunctor t₂ t₁ R) := by
  sorry

end HeartFunctors

section RecollementIdentities

variable {DF D DU : Type*} [Category DF] [Category D] [Category DU]
  [Preadditive DF] [Preadditive D] [Preadditive DU]
  [HasZeroObject DF] [HasZeroObject D] [HasZeroObject DU]
  [HasShift DF ℤ] [HasShift D ℤ] [HasShift DU ℤ]
  [∀ n : ℤ, (shiftFunctor DF n).Additive] [∀ n : ℤ, (shiftFunctor D n).Additive]
  [∀ n : ℤ, (shiftFunctor DU n).Additive]
  [Pretriangulated DF] [Pretriangulated D] [Pretriangulated DU]
  (r : Recollement DF D DU)

namespace Recollement

/-- `i^* j_! = 0` and `i^! j_* = 0` (BBD 1.4.3.3). -/
theorem upperStar_lowerShriek_isZero (B : DU) :
    IsZero (r.iUpperStar.obj (r.jLowerShriek.obj B)) ∧
      IsZero (r.iUpperShriek.obj (r.jLowerStar.obj B)) := by
  sorry

/-- The essential image of `i_*` is the kernel of `j^*`. -/
theorem essImage_lowerStar (K : D) :
    r.iLowerStar.essImage K ↔ IsZero (r.jUpperStar.obj K) := by
  sorry

variable (tF : TStructure DF) (tU : TStructure DU)

/-- The glued upper aisle, by definition (BBD 1.4.9). -/
theorem gluedTStructure_le_iff [IsTriangulated D] (n : ℤ) (K : D) :
    (r.gluedTStructure tF tU).le n K ↔
      tU.le n (r.jUpperStar.obj K) ∧ tF.le n (r.iUpperStar.obj K) :=
  Iff.rfl

/-- The glued lower aisle, by definition (BBD 1.4.9). -/
theorem gluedTStructure_ge_iff [IsTriangulated D] (n : ℤ) (K : D) :
    (r.gluedTStructure tF tU).ge n K ↔
      tU.ge n (r.jUpperStar.obj K) ∧ tF.ge n (r.iUpperShriek.obj K) :=
  Iff.rfl

/-- `i_*` maps the heart of `tF` into the heart of the glued t-structure (BBD 1.4.16). -/
theorem lowerStar_mem_heart [IsTriangulated D] (A : tF.heart.FullSubcategory) :
    (r.gluedTStructure tF tU).heart (r.iLowerStar.obj A.obj) := by
  sorry

/-- `pi_*` on hearts. -/
def heartLowerStar [IsTriangulated D] :
    tF.heart.FullSubcategory ⥤ (r.gluedTStructure tF tU).heart.FullSubcategory :=
  (r.gluedTStructure tF tU).heart.lift (tF.heart.ι ⋙ r.iLowerStar)
    (fun A ↦ r.lowerStar_mem_heart tF tU A)

/-- `j_!* B` has no nonzero subobject from the closed part (BBD 1.4.25). -/
theorem intermediateExtension_no_sub_quotient [IsTriangulated D] (B : tU.heart.FullSubcategory)
    (A : tF.heart.FullSubcategory) :
    (∀ (f : (r.heartLowerStar tF tU).obj A ⟶ r.intermediateExtension tF tU B), Mono f → f = 0) ∧
      (∀ (g : r.intermediateExtension tF tU B ⟶ (r.heartLowerStar tF tU).obj A), Epi g → g = 0) := by
  sorry

/-- The simple objects of the glued heart (BBD 1.4.26). -/
theorem simple_classification [IsTriangulated D] [IsTriangulated DF] [IsTriangulated DU]
    (S : (r.gluedTStructure tF tU).heart.FullSubcategory) [Simple S] :
    (∃ (T : tF.heart.FullSubcategory) (_ : Simple T),
        Nonempty (S ≅ (r.heartLowerStar tF tU).obj T)) ∨
      (∃ (B : tU.heart.FullSubcategory) (_ : Simple B),
        Nonempty (S ≅ r.intermediateExtension tF tU B)) := by
  sorry

end Recollement

end RecollementIdentities

section MoreTests

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] [IsTriangulated C]

/-- Unit test `tilt_torsion_zero`: with no nonzero torsion objects the tilt is `t`. -/
example (t : TStructure C) (τ : TStructure.TorsionTheory t)
    (h : ∀ X, τ.torsion X → IsZero X) : (TStructure.tilt t τ).le 0 = t.le 0 := by
  sorry

/-- Unit test `tilt_free_zero`: with no nonzero torsion-free objects the tilt is `t` shifted by
one. -/
example (t : TStructure C) (τ : TStructure.TorsionTheory t)
    (h : ∀ X, τ.free X → IsZero X) : (TStructure.tilt t τ).le 0 = t.le 1 := by
  sorry

end MoreTests

section MoreRecollement

variable {DF D DU : Type*} [Category DF] [Category D] [Category DU]
  [Preadditive DF] [Preadditive D] [Preadditive DU]
  [HasZeroObject DF] [HasZeroObject D] [HasZeroObject DU]
  [HasShift DF ℤ] [HasShift D ℤ] [HasShift DU ℤ]
  [∀ n : ℤ, (shiftFunctor DF n).Additive] [∀ n : ℤ, (shiftFunctor D n).Additive]
  [∀ n : ℤ, (shiftFunctor DU n).Additive]
  [Pretriangulated DF] [Pretriangulated D] [Pretriangulated DU] [IsTriangulated D]
  (r : Recollement DF D DU) (tF : TStructure DF) (tU : TStructure DU)

namespace Recollement

/-- `j_!*` sends simple objects to simple objects (BBD 1.4.26). -/
theorem intermediateExtension_simple (B : tU.heart.FullSubcategory) [Simple B] :
    Simple (r.intermediateExtension tF tU B) := by
  sorry

/-- Unit test `intermediateExtension_closed_zero`: if `DF` is zero, `j_!* B` restricts to `B`
and is all of the glued heart's object over `B`. -/
example (hF : ∀ X : DF, IsZero X) (B : tU.heart.FullSubcategory) (X : D)
    (e : r.jUpperStar.obj X ≅ B.obj) : Nonempty (X ≅ (r.intermediateExtension tF tU B).obj) := by
  sorry

end Recollement

end MoreRecollement

section HeartComp

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]
  {D : Type*} [Category D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]
  {E : Type*} [Category E] [Preadditive E] [HasZeroObject E] [HasShift E ℤ]
  [∀ n : ℤ, (shiftFunctor E n).Additive] [Pretriangulated E]

/-- `p(U ∘ T) ≅ pU ∘ pT` for left t-exact triangulated `T`, `U` (BBD 1.3.17 (iv)). -/
theorem Functor.heartFunctorComp {t₁ : TStructure C} {t₂ : TStructure D} {t₃ : TStructure E}
    {T : C ⥤ D} {U : D ⥤ E} [T.CommShift ℤ] [T.IsTriangulated] [U.CommShift ℤ]
    [U.IsTriangulated] (hT : Functor.IsLeftTExact t₁ t₂ T)
    (hU : Functor.IsLeftTExact t₂ t₃ U) :
    Nonempty (Functor.heartFunctor t₁ t₃ (T ⋙ U) ≅
      Functor.heartFunctor t₁ t₂ T ⋙ Functor.heartFunctor t₂ t₃ U) := by
  sorry

end HeartComp

/-!
## Targets of the reader that need carriers absent at the pins

Constructible complexes, costalks `i_x^!`, `Rf_!`, `f^!`, Verdier duality, the ℓ-adic categories
and the perverse heart on schemes are not in the pinned libraries, so the following reader
targets are not typed here; the reader gives their statements and tests.

The cohomology functors of a t-structure: TStructure.homologyCanonicalIso,
  homology_canonical_shift, homology_canonical_compat, homologyZero_not_triangulated.
Left and right t-exact functors: not_isRightTExact_globalSections_projectiveLine.
Recollement of triangulated categories: Recollement.triangleLowerShriek,
  Recollement.triangleUpperShriek, Recollement.op, Recollement.ofClosedOpen,
  Recollement.ofClosedOpen_upperStar, recollement_ofClosedOpen_empty,
  recollement_triangle_affineLine, recollement_ofClosedOpen_upperStar_eq,
  not_recollement_without_adjoints.
Intermediate extension in a recollement: Recollement.intermediateExtension_eq_image,
  Recollement.intermediateExtension_iso_truncation,
  Recollement.intermediateExtension_fullyFaithful, intermediateExtension_affineLine,
  not_lowerShriek_eq_intermediateExtension, intermediateExtension_simple_test.
Tilting a t-structure along a torsion theory: TStructure.TorsionTheory.ofNoetherianLinear,
  TStructure.tilt_tilt, tilt_point_integral, tilt_dual_compat, not_torsionTheory_divisible_free.
The dimension of a point and the middle perversity: pointDim_eq_trdeg, pointDim_open,
  pointDim_le_add_fibreDim, pointDim_quasiFinite, pointDim_affineSpace_closed,
  pointDim_affineSpace_generic, pointDim_eq_coheight_compat, not_pointDim_eq_codim.
The middle perverse t-structure on constructible complexes: perverseGE, perverseTStructure,
  perverseTStructure_le_iff_support, perverseTStructure_le_iff_strata,
  perverseTStructure_bounded, perverseTStructure_glue, perverseTStructure_etale_local,
  perverseTStructure_restrictScalars, perverseTStructure_baseField, perverseTStructure_point,
  perverseTStructure_perfectClosure, perverse_point_eq_canonical, perverse_curve_constant_shift,
  perverse_skyscraper, not_perverse_curve_constant, not_perverse_codimension_convention.
Perverse sheaves: PerverseSheaf, PerverseSheaf.abelian, perverseCohomology,
  perverseCohomology_isHomological, PerverseSheaf.ext_neg_eq_zero, PerverseSheaf.hom_isSheaf,
  PerverseSheaf.descent, PerverseSheaf.restrictEtale, PerverseSheaf.pointEquiv,
  PerverseSheaf.stalk_generic_concentration, perverseSheaf_point, perverseSheaf_skyscraper,
  perverseSheaf_empty, perverseSheaf_surface_shift, not_perverse_constant_surface.
Shifted local systems on smooth schemes are perverse: perverse_shift_lisse.
Open–closed recollement of perverse sheaves: perverse_recollement_glue.
Verdier duality preserves perverse sheaves: verdierDual_perverseLE_iff.
Quasi-finite, finite and étale morphisms and the perverse t-structure:
  quasiFinite_lowerShriek_isRightTExact, finite_pushforward_isTExact, etale_pullback_isTExact.
Perverse amplitude of the operations for a morphism with bounded fibre dimension:
  perverse_pullback_amplitude, perverse_proper_pushforward_amplitude.
Smooth pullback with its dimension shift: smooth_pullback_shift_isTExact,
  smooth_pullback_fullyFaithful.
Perverse Artin vanishing for affine morphisms: affine_pushforward_isRightTExact,
  affine_lowerShriek_isLeftTExact, perverse_artin_vanishing.
Affine open immersions: exactness and the four-term sequences: affine_open_lowerShriek_perverse,
  affine_open_restriction_amplitude.
External tensor product is t-exact: externalProduct_isTExact.
Intermediate extension of perverse sheaves: intermediateExtension,
  intermediateExtension_eq_image, restrict_intermediateExtension,
  intermediateExtension_stalk_bound, intermediateExtension_costalk_bound,
  intermediateExtension_unique, intermediateExtension_no_sub_quotient,
  intermediateExtension_fullyFaithful, intermediateExtension_comp, intermediateExtension_simple,
  intermediateExtension_etale, intermediateExtension_iso,
  intermediateExtension_affineLine_constant, intermediateExtension_kummer,
  intermediateExtension_closed_compat, not_intermediateExtension_eq_lowerShriek,
  not_unrestricted_standard_truncation.
Deligne's truncation formula for the intermediate extension:
  intermediateExtension_eq_truncation.
Low-degree cohomology of an intermediate extension across a boundary of high codimension:
  intermediateExtension_cohomology_iso.
The intersection complex of a local system: intersectionComplex, intersectionComplex_restrict,
  intersectionComplex_independent, intersectionComplex_of_smooth, intersectionComplex_curve,
  intersectionComplex_finite_birational, intersectionComplex_simple,
  intersectionComplex_verdierDual, intersectionComplex_smoothCurve,
  intersectionComplex_nodalCurve, intersectionComplex_cuspidalCurve, intersectionComplex_point,
  intersectionComplex_restrict_compat, not_intersectionComplex_nodal_constant.
Finite length and the simple perverse sheaves: perverseSheaf_finiteLength,
  perverseSheaf_simple_iff.
Perverse t-structures with ℓ-adic coefficients: adicPerverseTStructure,
  adicPerverse_le_iff_reduction, adicPerverse_rationalize_equiv,
  adicPerverse_rationalize_tExact, adicPerverse_reduction_rightTExact, adicPerverse_point,
  adicPerverse_algebraicClosure, adicPerverse_point_integral, adicPerverse_empty,
  adicPerverse_reduction_compat, not_adicPerverse_reduction_tExact.
The dual integral perversity p⁺ and its exchange with p: perversePlusTStructure,
  perversePlus_le_iff, perversePlus_ge_iff, perverse_le_perversePlus_le,
  verdierDual_perverse_le_iff, perversePlus_rationalize_tExact,
  perverse_isRightTExact_iff_perversePlus, perverse_and_perversePlus_iff_torsionFree,
  perversePlus_point_torsion, perversePlus_point_free, perversePlus_empty,
  perversePlus_rationalize_compat, not_perverse_eq_perversePlus.
Perversity conditions on nonconstructible complexes: perverseLEExt, perverseGEExt,
  perverseLEExt_iff_of_constructible, perverseLEExt_colimit, perverseGEExt_isGE,
  perverseGEExt_colimit, costalk_colimit_iso, perverseGEExt_pushforward_open,
  perverseExt_finite_pushforward, perverseExt_etale_local, perverseExt_skyscraper_sum,
  perverseExt_empty, perverseExt_constructible_compat, not_perverseGEExt_lowerShriek_open.
Proper semismall pushforward preserves perversity: semismall_pushforward_perverse.
Small maps push intersection complexes to intersection complexes:
  small_pushforward_intersectionComplex.
-/

end TauCeti.EtaleDuality
