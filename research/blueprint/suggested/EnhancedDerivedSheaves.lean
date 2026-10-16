/-
This file is not the roadmap and is not exhaustive. The roadmap document,
research/blueprint/readmes/EnhancedDerivedSheaves.md, is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures;
they are not an implementation, and every proof is `sorry`.

Enhanced derived categories of sheaves: the E0–E4 prototype (concrete enhancement,
derived sheaves, descent, coherent adjoints, completion) and the E5 prototype (monoidal,
presentable and animated structures), joined into one file with one namespace, followed by
the signatures of the targets added by the whole-roadmap plan (section `WholeRoadmapOrdinary`
and `WholeRoadmapMonoidal`, at the end).
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Conditions that cannot yet be stated at the pinned interfaces are omitted, never replaced
by proposition-valued fields or by an assumed conclusion. The E0–E4 packet's
`suggestedCoverage` matrix records, for every declaration, API item and unit test, whether
its signature is included, partial or omitted; the E5 packet's `signatureOmissions` records
the same for the E5 section. In the E5 section `HEquiv` is only the homotopy-category
consequence of an infinity-categorical equivalence, and its data structures do not impose
cocartesian, operadic, accessibility or coherence axioms. The two sections still use
different quasicategory carriers (Mathlib's `SSet.QCat` in E0–E4, the fixed-universe
subtype `QCat` in E5); the roadmap document records this for the packaging step.
-/
import Mathlib.AlgebraicTopology.Quasicategory.StrictBicategory
import Mathlib.AlgebraicTopology.Quasicategory.Nerve
import Mathlib.AlgebraicTopology.Quasicategory.InnerFibration
import Mathlib.AlgebraicTopology.SimplicialSet.Finite
import Mathlib.AlgebraicTopology.SimplicialSet.Homotopy
import Mathlib.AlgebraicTopology.SimplicialNerve
import Mathlib.CategoryTheory.Bicategory.Adjunction.Mate
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.CategoryTheory.Category.Preorder
import TauCeti.Algebra.Homology.LinearHomComplex.Enrichment
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.HomotopyCategory.KInjective
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.Basic
import Mathlib.CategoryTheory.Limits.Types.Limits
import Mathlib.CategoryTheory.Limits.FunctorCategory.Basic
import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Category.ULift
import Mathlib.CategoryTheory.Abelian.GrothendieckAxioms.SheafOfModules
import Mathlib.Algebra.Category.ModuleCat.AB
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Closed
import Mathlib.Algebra.Homology.Monoidal
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.CategoryTheory.Abelian.Projective.Dimension
import Mathlib.CategoryTheory.Abelian.Projective.Resolution
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.FieldTheory.Perfect
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Algebra.Homology.Embedding.CochainComplex
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.Normed.Group.Bounded
import Mathlib.Data.Set.Countable
import Mathlib.SetTheory.Cardinal.Regular
import Mathlib.Data.Finsupp.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.AlgebraicTopology.Quasicategory.Basic
import Mathlib.AlgebraicTopology.SimplicialSet.HomotopyCat
import Mathlib.CategoryTheory.IsomorphismClasses
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Comma.Arrow
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Functor.ReflectsIso.Basic
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Algebra.Category.ModuleCat.Presheaf.Sheafification
import Mathlib.Algebra.Category.ModuleCat.Presheaf.Free
import Mathlib.Algebra.Category.ModuleCat.Presheaf.Generator
import Mathlib.CategoryTheory.Generator.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Extension.Cotangent.Basic
import Mathlib.RingTheory.Localization.Defs
import Mathlib.Algebra.Category.Grp.Basic

namespace TauCeti.EnhancedDerivedSheaves

/-! ## Layers E0–E4: concrete enhancement, derived sheaves, descent, adjoints and completion -/

section Sheaves

universe u v w z
open CategoryTheory CategoryTheory.Limits Opposite
open scoped Simplicial ZeroObject
attribute [local instance] CategoryTheory.uliftCategory

def IsCategoricalEquivalence {C D : SSet.QCat.{u}} (f : C ⟶ D) : Prop :=
  ∃ g : D ⟶ C, Nonempty (f ≫ g ≅ 𝟙 C) ∧ Nonempty (g ≫ f ≅ 𝟙 D)

def qcat (C : SSet.{u}) [h : SSet.Quasicategory C] : SSet.QCat.{u} := ⟨C, h⟩

def IsSpaceEquivalence {K L : SSet.{u}} [SSet.KanComplex K] [SSet.KanComplex L]
    (f : K ⟶ L) : Prop := IsCategoricalEquivalence (ObjectProperty.homMk f : qcat K ⟶ qcat L)

def IsContractibleSpace (K : SSet.{u}) : Prop :=
  SSet.KanComplex K ∧ ∃ (a : K ⟶ Δ[0]) (b : Δ[0] ⟶ K),
    Nonempty (SSet.Homotopy (𝟙 K) (a ≫ b))

noncomputable def rightMappingSpace (C : SSet.{u}) (x y : C _⦋0⦌) : SSet.{u} := by sorry

theorem rightMappingSpace_kan (C : SSet.{u}) [SSet.Quasicategory C] (x y : C _⦋0⦌) :
    SSet.KanComplex (rightMappingSpace C x y) := by sorry

def IsInitialVertex (C : SSet.{u}) (x : C _⦋0⦌) : Prop :=
  ∀ y : C _⦋0⦌, IsContractibleSpace (rightMappingSpace C x y)

def IsTerminalVertex (C : SSet.{u}) (x : C _⦋0⦌) : Prop :=
  ∀ y : C _⦋0⦌, IsContractibleSpace (rightMappingSpace C y x)

noncomputable def join (K L : SSet.{u}) : SSet.{u} := by sorry
noncomputable def joinLeft (K L : SSet.{u}) : K ⟶ join K L := by sorry
noncomputable def joinRight (K L : SSet.{u}) : L ⟶ join K L := by sorry

noncomputable def overDiagram (C : SSet.{u}) {K : SSet.{u}} (p : K ⟶ C) : SSet.{u} := by sorry
noncomputable def underDiagram (C : SSet.{u}) {K : SSet.{u}} (p : K ⟶ C) : SSet.{u} := by sorry
noncomputable def slice_vertex (C : SSet.{u}) {K : SSet.{u}} (p : K ⟶ C) :
    overDiagram C p ⟶ C := by sorry
noncomputable def coslice_vertex (C : SSet.{u}) {K : SSet.{u}} (p : K ⟶ C) :
    underDiagram C p ⟶ C := by sorry

def IsZeroVertex (C : SSet.{u}) (x : C _⦋0⦌) : Prop :=
  IsInitialVertex C x ∧ IsTerminalVertex C x

def IsEnhancedLimit {C K : SSet.{u}} (p : K ⟶ C) (c : (overDiagram C p) _⦋0⦌) : Prop :=
  IsTerminalVertex (overDiagram C p) c

def IsEnhancedColimit {C K : SSet.{u}} (p : K ⟶ C) (c : (underDiagram C p) _⦋0⦌) : Prop :=
  IsInitialVertex (underDiagram C p) c

def HasEnhancedLimits (C : SSet.{u}) : Prop :=
  ∀ (K : SSet.{u}) (p : K ⟶ C), ∃ c, IsEnhancedLimit p c

def HasFiniteEnhancedLimits (C : SSet.{u}) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C), ∃ c, IsEnhancedLimit p c

def HasFiniteEnhancedColimits (C : SSet.{u}) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C), ∃ c, IsEnhancedColimit p c

abbrev coherentFun (K C : SSet.{u}) : SSet.{u} := SimplicialCategory.sHom K C
abbrev coherentNatTrans {K C : SSet.{u}} (f g : K ⟶ C) :=
  SSet.Edge ((SimplicialCategory.homEquiv' K C) f) ((SimplicialCategory.homEquiv' K C) g)

-- HTT 1.1.5.10 and 2.2.2.13: a general input to Cat∞ and Spaces.
noncomputable def coherentNerveVertex (C : Type u) [Category.{u} C]
    [SimplicialCategory C] (x : C) : (SimplicialNerve C) _⦋0⦌ := by sorry

instance locallyKan_coherentNerve_quasicategory (C : Type u) [Category.{u} C]
    [SimplicialCategory C] [∀ x y : C, SSet.KanComplex (SimplicialCategory.sHom x y)] :
    SSet.Quasicategory (SimplicialNerve C) := by sorry

noncomputable def locallyKan_coherentNerve_mappingComparison
    (C : Type u) [Category.{u} C] [SimplicialCategory C]
    [∀ x y : C, SSet.KanComplex (SimplicialCategory.sHom x y)] (x y : C) :
    SimplicialCategory.sHom x y ⟶ rightMappingSpace (SimplicialNerve C)
      (coherentNerveVertex C x) (coherentNerveVertex C y) := by sorry

theorem locallyKan_coherentNerve_mappingEquiv
    (C : Type u) [Category.{u} C] [SimplicialCategory C]
    [∀ x y : C, SSet.KanComplex (SimplicialCategory.sHom x y)] (x y : C) :
    letI := rightMappingSpace_kan (SimplicialNerve C)
      (coherentNerveVertex C x) (coherentNerveVertex C y)
    IsSpaceEquivalence (locallyKan_coherentNerve_mappingComparison C x y) := by sorry

noncomputable def dgNerve (R : Type v) [CommRing R] (C : Type u)
    [EnrichedCategory (CochainComplex (ModuleCat.{v} R) ℤ) C] : SSet.{max u v} := by sorry

theorem dgNerve_quasicategory (R : Type v) [CommRing R] (C : Type u)
    [EnrichedCategory (CochainComplex (ModuleCat.{v} R) ℤ) C] :
    SSet.Quasicategory (dgNerve R C) := by sorry

noncomputable def dgNerve_vertices (R : Type v) [CommRing R] (C : Type u)
    [EnrichedCategory (CochainComplex (ModuleCat.{v} R) ℤ) C] :
    (dgNerve R C) _⦋0⦌ ≃ C := by sorry

noncomputable def enhancedDerived (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] : SSet.{max u v} := by sorry

noncomputable def enhancedDerived.homotopyCategory (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] [HasDerivedCategory.{w} A] : (enhancedDerived A).HomotopyCategory ≌ DerivedCategory A := by sorry

/- E0. Data carriers use the existing simplicial-set and QCat bicategory interfaces.
The DG enrichment is cohomological; DGAInfinity owns the signed homological bridge. -/
noncomputable def dgVertex (R : Type u) [CommRing R] (C : Type u)
    [EnrichedCategory (CochainComplex (ModuleCat.{u} R) ℤ) C] (x : C) :
    (dgNerve R C) _⦋0⦌ := (dgNerve_vertices R C).symm x

noncomputable def dgNerve_edges (R : Type u) [CommRing R] (C : Type u)
    [EnrichedCategory (CochainComplex (ModuleCat.{u} R) ℤ) C] (x y : C) :
    SSet.Edge (dgVertex R C x) (dgVertex R C y) ≃
    { f : (x ⟶[CochainComplex (ModuleCat.{u} R) ℤ] y).X 0 //
      (x ⟶[CochainComplex (ModuleCat.{u} R) ℤ] y).d 0 1 f = 0 } := by sorry

noncomputable def join_map {K L K' L' : SSet.{u}} (f : K ⟶ K') (g : L ⟶ L') :
    join K L ⟶ join K' L' := by sorry

-- join_empty
example (K : SSet.{u}) : Nonempty (join (⊥_ SSet.{u}) K ≅ K) := by sorry
-- join_points
example : Nonempty (join (Δ[0] : SSet.{u}) Δ[0] ≅ Δ[1]) := by sorry
-- join_simplices
example (a b : ℕ) : Nonempty (join (Δ[a] : SSet.{u}) Δ[b] ≅ Δ[a+b+1]) := by sorry

noncomputable def slice_joinEquiv {C K Y : SSet.{u}} (p : K ⟶ C) :
    (Y ⟶ overDiagram C p) ≃ {q : join Y K ⟶ C // joinRight Y K ≫ q = p} := by sorry

-- slice_empty
example (C : SSet.{u}) (p : (⊥_ SSet.{u}) ⟶ C) :
    Nonempty (overDiagram C p ≅ C) := by sorry

noncomputable def rightMappingSpace_vertices (C : SSet.{u}) (x y : C _⦋0⦌) :
    (rightMappingSpace C x y) _⦋0⦌ ≃ SSet.Edge x y := by sorry

noncomputable def rightMappingSpace_map {C D : SSet.{u}} (F : C ⟶ D)
    (x y : C _⦋0⦌) : rightMappingSpace C x y ⟶
    rightMappingSpace D (F.app _ x) (F.app _ y) := by sorry

-- rightMappingSpace_ordinary
example (A : Type u) [Category.{u} A] (x y : A) :
    Nonempty (rightMappingSpace (nerve A) (nerveEquiv.symm x) (nerveEquiv.symm y) ≅
      nerve (Discrete (x ⟶ y))) := by sorry

-- rightMappingSpace_point
example (x y : (Δ[0] : SSet.{u}) _⦋0⦌) :
    IsContractibleSpace (rightMappingSpace Δ[0] x y) := by sorry

-- categoricalEquivalence_identity
example (C : SSet.QCat.{u}) : IsCategoricalEquivalence (𝟙 C) := by sorry

theorem categoricalEquivalence_comp {C D E : SSet.QCat.{u}}
    (f : C ⟶ D) (g : D ⟶ E) (hf : IsCategoricalEquivalence f)
    (hg : IsCategoricalEquivalence g) : IsCategoricalEquivalence (f ≫ g) := by sorry

theorem categoricalEquivalence_nerve {A B : Type u} [Category.{u} A] [Category.{u} B]
    (F : A ⥤ B) : IsCategoricalEquivalence
      (ObjectProperty.homMk (nerveMap F) : qcat (nerve A) ⟶ qcat (nerve B)) ↔
      F.IsEquivalence := by sorry

noncomputable def coherentFun_eval {K C : SSet.{u}} (x : K _⦋0⦌) :
    coherentFun K C ⟶ C := by sorry

-- coherentFun_point
example (C : SSet.{u}) : Nonempty (coherentFun Δ[0] C ≅ C) := by sorry
-- coherentFun_ordinary
example (A B : Type u) [Category.{u} A] [Category.{u} B] :
    Nonempty (coherentFun (nerve A) (nerve B) ≅ nerve (A ⥤ B)) := by sorry

/- E1. Genuine unbounded complex predicates and localization carriers. -/
noncomputable def enhancedLocalization (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] : nerve (CochainComplex A ℤ) ⟶ enhancedDerived A := by sorry

noncomputable def derivedVertex (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (K : CochainComplex A ℤ) :
    (enhancedDerived A) _⦋0⦌ := enhancedLocalization A |>.app _ (nerveEquiv.symm K)

theorem enhancedDerived_quasicategory (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] : SSet.Quasicategory (enhancedDerived A) := by sorry

theorem kInjective_replacement (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (K : CochainComplex A ℤ) :
    ∃ (L : CochainComplex A ℤ) (f : K ⟶ L), L.IsKInjective ∧ QuasiIso f := by sorry

open MonoidalCategory

def IsKFlat (R : Type u) [CommRing R] (K : CochainComplex (ModuleCat.{u} R) ℤ) : Prop :=
  ∀ L : CochainComplex (ModuleCat.{u} R) ℤ, L.Acyclic → (L ⊗ K).Acyclic

-- Generic Koszul carrier moves down from DD.1 for the tier-4 completion inputs.
-- The complete contraction, multiplication and functoriality APIs remain in the matrix.
noncomputable def koszulComplex (R : Type u) [CommRing R]
    (E : Type u) [AddCommGroup E] [Module R E] (φ : E →ₗ[R] R) :
    CochainComplex (ModuleCat.{u} R) ℤ := by sorry

noncomputable def koszulComplex_degree (R : Type u) [CommRing R]
    (E : Type u) [AddCommGroup E] [Module R E] (φ : E →ₗ[R] R) (n : ℕ) :
    (koszulComplex R E φ).X (-(n : ℤ)) ≅
      ModuleCat.of R (ExteriorAlgebra.exteriorPower R n E) := by sorry

noncomputable def finiteKoszulComplex (R : Type u) [CommRing R] (fs : List R) :
    CochainComplex (ModuleCat.{u} R) ℤ := by sorry

noncomputable def koszulComplex_augmentation (R : Type u) [CommRing R] (fs : List R) :
    finiteKoszulComplex R fs ⟶
      (HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).obj
        (ModuleCat.of R (R ⧸ Ideal.ofList fs)) := by sorry

theorem koszulComplex_regular (R : Type u) [CommRing R] (fs : List R)
    (hfs : RingTheory.Sequence.IsRegular R fs) :
    QuasiIso (koszulComplex_augmentation R fs) := by sorry

-- koszul_empty
example (R : Type u) [CommRing R] : Nonempty
    (finiteKoszulComplex R [] ≅
      (HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).obj
        (ModuleCat.of R R)) := by sorry

-- koszul_prime
example (p : ℕ) (hp : p.Prime) :
    QuasiIso (koszulComplex_augmentation ℤ [(p : ℤ)]) := by sorry

-- koszul_zero: retains the negative cohomology that the ordinary quotient loses.
example (R : Type u) [CommRing R] : Nonempty
    ((finiteKoszulComplex R [0]).homology (-1) ≅ ModuleCat.of R R) := by sorry

theorem kFlat_replacement (R : Type u) [CommRing R]
    (K : CochainComplex (ModuleCat.{u} R) ℤ) :
    ∃ (L : CochainComplex (ModuleCat.{u} R) ℤ) (f : L ⟶ K), IsKFlat R L ∧ QuasiIso f := by sorry

-- kFlat_zero: point-site instance of the sheaf predicate
example (R : Type u) [CommRing R] : IsKFlat R (0 : CochainComplex (ModuleCat.{u} R) ℤ) := by sorry

noncomputable abbrev moduleDerived (R : Type u) [CommRing R] := enhancedDerived (ModuleCat.{u} R)

noncomputable def derivedTensor (R : Type u) [CommRing R] :
    moduleDerived R ⊗ moduleDerived R ⟶ moduleDerived R := by sorry

noncomputable def tensorVertex (R : Type u) [CommRing R]
    (K L : (moduleDerived R) _⦋0⦌) : (moduleDerived R) _⦋0⦌ :=
    (derivedTensor R).app _ (K,L)

noncomputable def derivedInternalHom (R : Type u) [CommRing R]
    (K L : (moduleDerived R) _⦋0⦌) : (moduleDerived R) _⦋0⦌ := by sorry

noncomputable def derivedInternalHom_comparison (R : Type u) [CommRing R]
    (M K L : (moduleDerived R) _⦋0⦌) :
    rightMappingSpace (moduleDerived R) (tensorVertex R M K) L ⟶
      rightMappingSpace (moduleDerived R) M (derivedInternalHom R K L) := by sorry

theorem derivedInternalHom_mapEquiv (R : Type u) [CommRing R]
    (M K L : (moduleDerived R) _⦋0⦌) :
    letI := enhancedDerived_quasicategory (ModuleCat.{u} R)
    letI := rightMappingSpace_kan (moduleDerived R) (tensorVertex R M K) L
    letI := rightMappingSpace_kan (moduleDerived R) M (derivedInternalHom R K L)
    IsSpaceEquivalence (derivedInternalHom_comparison R M K L) := by sorry

-- enhancedDerived_zero, point-site specialization
example (R : Type u) [CommRing R] : IsContractibleSpace (rightMappingSpace (moduleDerived R)
    (derivedVertex (ModuleCat.{u} R) 0) (derivedVertex (ModuleCat.{u} R) 0)) := by sorry

-- derivedHom_zero, point-site specialization, testing both variables
example (R : Type u) [CommRing R] (K : (moduleDerived R) _⦋0⦌) :
    IsZeroVertex (moduleDerived R)
      (derivedInternalHom R (derivedVertex (ModuleCat.{u} R) 0) K) ∧
    IsZeroVertex (moduleDerived R)
      (derivedInternalHom R K (derivedVertex (ModuleCat.{u} R) 0)) := by sorry

/- Perfectness and Frobenius are baseline, rather than a private algebra definition. -/
noncomputable def frobeniusRootIdeal (R : Type u) [CommRing R] (f : R) : Ideal R :=
  (Ideal.span {f}).radical

theorem frobeniusRootIdeal_radical (R : Type u) [CommRing R] (f : R) :
    frobeniusRootIdeal R f = (Ideal.span {f}).radical := by sorry

theorem rootIdeal_root_mem (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [PerfectRing R p] (f : R) (n : ℕ) :
    (iterateFrobeniusEquiv R p n).symm f ∈ frobeniusRootIdeal R f := by sorry

-- rootIdeal_zero
example (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] : frobeniusRootIdeal R 0 = ⊥ := by sorry
-- rootIdeal_unit
example (R : Type u) [CommRing R] : frobeniusRootIdeal R 1 = ⊤ := by sorry

-- The Tor conclusion uses the existing second-variable derived tensor functor.
theorem perfect_ring_tor (A B C : Type u) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : ℕ) [Fact p.Prime]
    [CharP A p] [CharP B p] [CharP C p]
    [PerfectRing A p] [PerfectRing B p] [PerfectRing C p] (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) (i+1)).obj (ModuleCat.of A B)).obj
      (ModuleCat.of A C)) := by sorry

/- The saturation predicate itself is ordinary algebra; the normed valuation
fixtures and spherical-completeness theorem need their existing owner interfaces. -/
noncomputable def valuationSaturationMap (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : M →ₗ[V] (m →ₗ[V] M) where
  toFun x := { toFun := fun a => (a : V) • x, map_add' := by sorry, map_smul' := by sorry }
  map_add' := by sorry
  map_smul' := by sorry

def IsValuationSaturated (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : Prop :=
    Function.Bijective (valuationSaturationMap V m M)

/- E2. Sequential repleteness is different from exactness of all cofiltered limits. -/
/-- E2/replete-topoi. For a topos this is BS 3.1.1. All limit cones are used,
so no choice of a limiting object enters the property. -/
def IsReplete (C : Type u) [Category.{v} C] : Prop :=
  ∀ (F : ℕᵒᵖ ⥤ C) (c : Cone F), IsLimit c →
    (∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op)) →
    ∀ n : ℕ, Epi (c.π.app (op n))

theorem IsReplete.projection {C : Type u} [Category.{v} C]
    (hC : IsReplete C) (F : ℕᵒᵖ ⥤ C) (c : Cone F) (hc : IsLimit c)
    (hF : ∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op)) (n : ℕ) :
    Epi (c.π.app (op n)) := by sorry

theorem IsReplete.of_equivalence {C : Type u} [Category.{v} C]
    {D : Type w} [Category.{z} D] (e : C ≌ D) (hC : IsReplete C) :
    IsReplete D := by sorry

theorem IsReplete.types : IsReplete (Type u) := by sorry

-- replete_sets
example : IsReplete (Type u) := by sorry

-- replete_presheaves: epi and limit computations are pointwise.
example (A : Type u) [Category.{v} A] : IsReplete (Aᵒᵖ ⥤ Type w) := by sorry

/- Test fixtures for replete_not_all_cofiltered. Finite subsets are ordered by
inclusion, and restriction reverses that order. The values are finite injections
into the integers. The two examples state surjective transitions and no compatible
global family when T is uncountable. -/
def finiteRestriction {T : Type u} [DecidableEq T] (S U : Finset T) (h : S ⊆ U) :
    ({x : T // x ∈ U} ↪ ℤ) → ({x : T // x ∈ S} ↪ ℤ) :=
  fun f => { toFun := fun x => f ⟨x.val, h x.property⟩, inj' := by sorry }

example {T : Type u} [DecidableEq T] (S U : Finset T) (h : S ⊆ U) :
    Function.Surjective (finiteRestriction S U h) := by sorry

example {T : Type u} [DecidableEq T] (hT : ¬ Countable T) :
    ¬ ∃ (f : ∀ S : Finset T, {x : T // x ∈ S} ↪ ℤ),
      ∀ (S U : Finset T) (h : S ⊆ U), finiteRestriction S U h (f U) = f S := by sorry

/-- E2/weakly-contractible-object. General categorical predicate; the roadmap
uses it for objects of a topos. -/
def IsWeaklyContractible {C : Type u} [Category.{v} C] (U : C) : Prop :=
  ∀ (V : C) (f : V ⟶ U), Epi f → ∃ s : U ⟶ V, s ≫ f = 𝟙 U

theorem IsWeaklyContractible.section {C : Type u} [Category.{v} C]
    {U : C} (hU : IsWeaklyContractible U) (V : C) (f : V ⟶ U) (hf : Epi f) :
    ∃ s : U ⟶ V, s ≫ f = 𝟙 U := by sorry

-- weaklyContractible_singleton
example : IsWeaklyContractible (C := Type u) PUnit.{u+1} := by sorry

-- weaklyContractible_sets
example (U : Type u) : IsWeaklyContractible (C := Type u) U := by sorry

/- Ordinary pro-zero is a property of actual transition maps. -/
def IsProZero {A : Type u} [Category.{v} A] [HasZeroMorphisms A] (F : ℕᵒᵖ ⥤ A) : Prop :=
    ∀ n : ℕ, ∃ m : ℕ, ∃ h : n ≤ m, F.map (homOfLE h).op = 0

def IsProIsomorphism {A : Type u} [Category.{v} A] [Abelian A]
    (F G : ℕᵒᵖ ⥤ A) (f : F ⟶ G) : Prop :=
    IsProZero (kernel f) ∧ IsProZero (cokernel f)

theorem proIso_comp {A : Type u} [Category.{v} A] [Abelian A]
    {F G H : ℕᵒᵖ ⥤ A} (f : F ⟶ G) (g : G ⟶ H)
    (hf : IsProIsomorphism F G f) (hg : IsProIsomorphism G H g) :
    IsProIsomorphism F H (f ≫ g) := by sorry

-- proZero_zero
example (A : Type u) [Category.{v} A] [Abelian A] :
    IsProZero (0 : ℕᵒᵖ ⥤ A) := by sorry

/-- A concrete non-example: repeated multiplication has zero ordinary limit
but its transitions never become zero. -/
noncomputable def pMultiplicationTower (p : ℕ) : ℕᵒᵖ ⥤ ModuleCat ℤ where
  obj _ := ModuleCat.of ℤ ℤ
  map {a b} f := ModuleCat.ofHom
    { toFun := fun x => (p : ℤ) ^ (unop a - unop b) * x
      map_add' := by sorry
      map_smul' := by sorry }
  map_id _ := by sorry
  map_comp _ _ := by sorry

-- proZero_not_p_multiplication
example (p : ℕ) (hp : p.Prime) : ¬ IsProZero (pMultiplicationTower p) := by sorry

abbrev towerShape : SSet.{u} := nerve (ULift.{u} ℕᵒᵖ)
abbrev coherentTower (C : SSet.{u}) := coherentFun towerShape.{u} C
abbrev CoherentTower (C : SSet.{u}) := towerShape.{u} ⟶ C

noncomputable def coherentTower_eval {C : SSet.{u}} (F : CoherentTower C) (n : ℕ) : C _⦋0⦌ :=
    F.app _ (nerveEquiv.symm (ULift.up (op n)))

noncomputable def derivedTowerLimit (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (F : CoherentTower (enhancedDerived A)) :
    (enhancedDerived A) _⦋0⦌ := by sorry

/- E4. A constant commutative coefficient ring on a small site. The genuine
predicate uses slice-free localized generators; its DD.1 orthogonality comparison
is a proof target. Variable ring-sheaf signatures remain separate from this constant-ring prototype. -/
noncomputable def constantCoefficientSheaf (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] : Sheaf J RingCat.{u} := by sorry

noncomputable abbrev sheafDerived (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] := enhancedDerived
      (SheafOfModules.{u} (constantCoefficientSheaf C J R))

noncomputable def sheafShift (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (n : ℤ) :
    sheafDerived C J R ⟶ sheafDerived C J R := by sorry

noncomputable def sheafLocalizationGenerator (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (U : C) (f : R) :
    (sheafDerived C J R) _⦋0⦌ := by sorry

def IsDerivedCompleteSheaf (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R)
    (K : (sheafDerived C J R) _⦋0⦌) : Prop :=
    ∀ (U : C) (f : R) (n : ℤ), f ∈ I → IsContractibleSpace
      (rightMappingSpace (sheafDerived C J R)
        ((sheafShift C J R n).app _ (sheafLocalizationGenerator C J R U f)) K)

noncomputable def DerivedCompleteSheaves (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) : SSet.{u+1} := by sorry

noncomputable def DerivedCompleteSheaves_inclusion (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    DerivedCompleteSheaves C J R I ⟶ sheafDerived C J R := by sorry

noncomputable def DerivedCompleteSheaves_vertices (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    (DerivedCompleteSheaves C J R I) _⦋0⦌ ≃
      {K : (sheafDerived C J R) _⦋0⦌ // IsDerivedCompleteSheaf C J R I K} := by sorry

-- derivedCompleteSheaf_zeroIdeal: the ambient full subcategory at I=0
example (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] :
    Nonempty (DerivedCompleteSheaves C J R (⊥ : Ideal R) ≅ sheafDerived C J R) := by sorry

-- complete_unit_ideal: completion along the unit ideal contains only zero objects
example (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] (K : (sheafDerived C J R) _⦋0⦌)
    (hK : IsDerivedCompleteSheaf C J R (⊤ : Ideal R) K) :
    IsZeroVertex (sheafDerived C J R) K := by sorry

/- Additional point-site K-flat APIs use the pinned signed complex tensor. -/
theorem isKFlat_boundedAbove (R : Type u) [CommRing R]
    (K : CochainComplex (ModuleCat.{u} R) ℤ) (n : ℤ) [K.IsStrictlyLE n]
    (hK : ∀ i : ℤ, Module.Flat R (K.X i)) : IsKFlat R K := by sorry

theorem isKFlat_tensor (R : Type u) [CommRing R]
    (K L : CochainComplex (ModuleCat.{u} R) ℤ) (hK : IsKFlat R K) (hL : IsKFlat R L) :
    IsKFlat R (K ⊗ L) := by sorry

theorem isKFlat_quasiIso_tensor (R : Type u) [CommRing R]
    {K L : CochainComplex (ModuleCat.{u} R) ℤ} (f : K ⟶ L) [QuasiIso f]
    (hK : IsKFlat R K) (hL : IsKFlat R L) (M : CochainComplex (ModuleCat.{u} R) ℤ) :
    QuasiIso (HomologicalComplex.tensorHom (𝟙 M) f) := by sorry

-- kFlat_unit: constant module coefficient, point-site fixture
example (R : Type u) [CommRing R] : IsKFlat R
    ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).obj
      (ModuleCat.of R R)) := by sorry
-- kFlat_flat_shift: point-site fixture
example (R : Type u) [CommRing R] (M : ModuleCat.{u} R) [Module.Flat R M] (n : ℤ) :
    IsKFlat R ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) n).obj M) := by sorry
-- kFlat_not_Zmodp
example (p : ℕ) [Fact p.Prime] : ¬ IsKFlat ℤ
    ((HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 0).obj
      (ModuleCat.of ℤ (ZMod p))) := by sorry

/- A common coordinate norm bound is the actual boundedness condition. -/
theorem valuationModule_isBounded_iff (V K : Type u) [CommRing V] [NormedField K] [Algebra V K]
    (r : ℕ) (M : Submodule V (Fin r → K)) :
    Bornology.IsBounded (M : Set (Fin r → K)) ↔
    ∃ c : ℝ, ∀ x : Fin r → K, x ∈ M → ∀ i : Fin r, ‖x i‖ ≤ c := by sorry

-- valuationModule_zero
example (V K : Type u) [CommRing V] [NormedField K] [Algebra V K]
    (m : Ideal V) (r : ℕ) :
    Bornology.IsBounded ((⊥ : Submodule V (Fin r → K)) : Set (Fin r → K)) ∧
    IsValuationSaturated V m (⊥ : Submodule V (Fin r → K)) := by sorry

noncomputable def zeroTransitionTower (A : Type u) [Category.{v} A] [HasZeroMorphisms A]
    (M : ℕ → A) : ℕᵒᵖ ⥤ A where
  obj n := M (unop n)
  map {a b} _ := by
    classical
    exact if h : a = b then eqToHom (congrArg (fun n => M (unop n)) h) else 0
  map_id _ := by sorry
  map_comp _ _ := by sorry

-- proZero_zero_maps
example (A : Type u) [Category.{v} A] [HasZeroMorphisms A] (M : ℕ → A) :
    IsProZero (zeroTransitionTower A M) := by sorry

theorem proZero_cofinal (A : Type u) [Category.{v} A] [HasZeroMorphisms A]
    (F : ℕᵒᵖ ⥤ A) (g : ℕᵒᵖ ⥤ ℕᵒᵖ)
    (hg : ∀ n : ℕ, ∃ m : ℕ, n ≤ unop (g.obj (op m))) :
    IsProZero (g ⋙ F) ↔ IsProZero F := by sorry

/- E3. The adjunction carrier already exists in the QCat bicategory. The omitted
adjoint-functor theorems below use the explicit presentability/size interfaces in E0. -/
abbrev EnhancedAdjunction {C D : SSet.QCat.{u}} (F : C ⟶ D) (G : D ⟶ C) :=
  CategoryTheory.Bicategory.Adjunction F G

/- E0: horn and square conditions are formulas, never assumed proof fields. -/

def IsEquivalenceEdge {C : SSet.{u}} {x y : C _⦋0⦌} (e : SSet.Edge x y) : Prop :=
  IsIso (SSet.HomotopyCategory.homMk e)

noncomputable def edgeMap {C : SSet.{u}} {x y : C _⦋0⦌}
    (e : SSet.Edge x y) : Δ[1] ⟶ C := by sorry

-- This is the 0→1 edge of the zeroth horn, for dimension at least two.
noncomputable def coCartesianHornEdge (n : ℕ) :
    (Δ[1] : SSet.{u}) ⟶ Λ[n+2, (0 : Fin (n+3))] := by sorry

def IsCoCartesianEdge {E B : SSet.{u}} (p : E ⟶ B)
    {x y : E _⦋0⦌} (e : SSet.Edge x y) : Prop :=
  ∀ (n : ℕ) (a : (Λ[n+2, (0 : Fin (n+3))] : SSet.{u}) ⟶ E)
    (b : (Δ[n+2] : SSet.{u}) ⟶ B),
    coCartesianHornEdge n ≫ a = edgeMap e →
    a ≫ p = Λ[n+2, (0 : Fin (n+3))].ι ≫ b →
    ∃ lift : Δ[n+2] ⟶ E, Λ[n+2, (0 : Fin (n+3))].ι ≫ lift = a ∧ lift ≫ p = b

def IsCoCartesianFibration {E B : SSet.{u}} (p : E ⟶ B) : Prop :=
  SSet.InnerFibration p ∧
  ∀ (x : E _⦋0⦌) (b : B _⦋0⦌) (a : SSet.Edge (p.app _ x) b),
    ∃ (y : E _⦋0⦌) (e : SSet.Edge x y),
      (e.map p).edge = a.edge ∧ IsCoCartesianEdge p e

def PreservesCoCartesianEdges {E E' B : SSet.{u}} (p : E ⟶ B) (p' : E' ⟶ B)
    (F : E ⟶ E') : Prop :=
  F ≫ p' = p ∧ ∀ (x y : E _⦋0⦌) (e : SSet.Edge x y),
    IsCoCartesianEdge p e → IsCoCartesianEdge p' (e.map F)

theorem coCartesian_identity {E B : SSet.{u}} (p : E ⟶ B) [SSet.InnerFibration p]
    (x : E _⦋0⦌) : IsCoCartesianEdge p (SSet.Edge.id x) := by sorry

theorem coCartesian_over_identity {E : SSet.{u}} [SSet.Quasicategory E]
    {x y : E _⦋0⦌} (e : SSet.Edge x y) :
    IsCoCartesianEdge (𝟙 E) e := by sorry

theorem coCartesian_over_point {E : SSet.{u}} [SSet.Quasicategory E]
    {x y : E _⦋0⦌} (e : SSet.Edge x y) :
    IsCoCartesianEdge (terminal.from E) e ↔ IsEquivalenceEdge e := by sorry

-- cocartesian_identity: every edge is a coCartesian lift over the identity base.
example (B : SSet.{u}) [SSet.Quasicategory B] : IsCoCartesianFibration (𝟙 B) := by sorry

-- cocartesian_constant: over a point only equivalence edges are coCartesian.
example (C : SSet.{u}) [SSet.Quasicategory C] {x y : C _⦋0⦌} (e : SSet.Edge x y) :
    IsCoCartesianEdge (terminal.from C) e ↔ IsEquivalenceEdge e := by sorry

-- cocartesian_noninvertible: the unique nonidentity arrow of [1] is not a lift over a point.
example (x y : (Δ[1] : SSet.{u}) _⦋0⦌) (e : SSet.Edge x y)
    (h : ¬ IsEquivalenceEdge e) : ¬ IsCoCartesianEdge (terminal.from (Δ[1] : SSet.{u})) e := by sorry

abbrev CoherentSquare (C : SSet.{u}) := (Δ[1] ⊗ Δ[1]) ⟶ C

noncomputable def squareCospan {C : SSet.{u}} (q : CoherentSquare C) :
    (Λ[2, (2 : Fin 3)] : SSet.{u}) ⟶ C := by sorry
noncomputable def squareSpan {C : SSet.{u}} (q : CoherentSquare C) :
    (Λ[2, (0 : Fin 3)] : SSet.{u}) ⟶ C := by sorry
noncomputable def squareLimitCone {C : SSet.{u}} (q : CoherentSquare C) :
    (overDiagram C (squareCospan q)) _⦋0⦌ := by sorry
noncomputable def squareColimitCone {C : SSet.{u}} (q : CoherentSquare C) :
    (underDiagram C (squareSpan q)) _⦋0⦌ := by sorry

def IsPullbackSquare {C : SSet.{u}} (q : CoherentSquare C) : Prop :=
  IsEnhancedLimit (squareCospan q) (squareLimitCone q)
def IsPushoutSquare {C : SSet.{u}} (q : CoherentSquare C) : Prop :=
  IsEnhancedColimit (squareSpan q) (squareColimitCone q)

def IsStable (C : SSet.{u}) : Prop :=
  SSet.Quasicategory C ∧ (∃ z, IsZeroVertex C z) ∧
  HasFiniteEnhancedLimits C ∧ HasFiniteEnhancedColimits C ∧
  ∀ q : CoherentSquare C, IsPullbackSquare q ↔ IsPushoutSquare q

noncomputable def overDiagram_map {C D K : SSet.{u}} (F : C ⟶ D) (p : K ⟶ C) :
    overDiagram C p ⟶ overDiagram D (p ≫ F) := by sorry
noncomputable def underDiagram_map {C D K : SSet.{u}} (F : C ⟶ D) (p : K ⟶ C) :
    underDiagram C p ⟶ underDiagram D (p ≫ F) := by sorry

def IsExactEnhancedFunctor {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C)
    (c : (overDiagram C p) _⦋0⦌), IsEnhancedLimit p c →
    IsEnhancedLimit (p ≫ F) ((overDiagram_map F p).app _ c)

noncomputable def fullEnhancedSubcategory (C : SSet.{u}) (P : C _⦋0⦌ → Prop) :
    SSet.{u} := by sorry
noncomputable def fullEnhancedSubcategory_inclusion (C : SSet.{u}) (P : C _⦋0⦌ → Prop) :
    fullEnhancedSubcategory C P ⟶ C := by sorry
noncomputable def fullEnhancedSubcategory_vertices (C : SSet.{u}) (P : C _⦋0⦌ → Prop) :
    (fullEnhancedSubcategory C P) _⦋0⦌ ≃ {x : C _⦋0⦌ // P x} := by sorry

def IsCoCartesianSection {E B : SSet.{u}} (p : E ⟶ B) (s : B ⟶ E) : Prop :=
  s ≫ p = 𝟙 B ∧ ∀ (x y : B _⦋0⦌) (e : SSet.Edge x y), IsCoCartesianEdge p (e.map s)

-- Relative sections fix the map to B on every simplex, including transformations.
noncomputable def coherentSections {E B : SSet.{u}} (p : E ⟶ B) : SSet.{u} := by sorry
noncomputable def coherentSections_simplices {E B : SSet.{u}} (p : E ⟶ B) (n : ℕ) :
    (coherentSections p) _⦋n⦌ ≃
      {s : Δ[n] ⊗ B ⟶ E // s ≫ p = CartesianMonoidalCategory.snd Δ[n] B} := by sorry
noncomputable def coherentSections_inclusion {E B : SSet.{u}} (p : E ⟶ B) :
    coherentSections p ⟶ coherentFun B E := by sorry

noncomputable def coCartesianSections {E B : SSet.{u}} (p : E ⟶ B) : SSet.{u} :=
  fullEnhancedSubcategory (coherentSections p)
    (fun s ↦ IsCoCartesianSection p ((SimplicialCategory.homEquiv' B E).symm
      ((coherentSections_inclusion p).app _ s)))

-- cocartesian_sections_identity: also detects spurious transformations over the base.
example (B : SSet.{u}) [SSet.Quasicategory B] :
    Nonempty (coCartesianSections (𝟙 B) ≅ Δ[0]) := by sorry

theorem coCartesianEdge_comp {E B : SSet.{u}} (p : E ⟶ B) [SSet.InnerFibration p]
    {x y z : E _⦋0⦌} (e : SSet.Edge x y) (f : SSet.Edge y z) (g : SSet.Edge x z)
    (h : SSet.Edge.CompStruct e f g) (he : IsCoCartesianEdge p e)
    (hf : IsCoCartesianEdge p f) : IsCoCartesianEdge p g := by sorry

-- cocartesian_product
example (B C : SSet.{u}) [SSet.Quasicategory B] [SSet.Quasicategory C]
    {x y : (B ⊗ C) _⦋0⦌} (e : SSet.Edge x y) :
    IsCoCartesianFibration (CartesianMonoidalCategory.fst B C) ∧
    (IsCoCartesianEdge (CartesianMonoidalCategory.fst B C) e ↔
      IsEquivalenceEdge (e.map (CartesianMonoidalCategory.snd B C))) := by sorry

-- stable_zero
example : IsStable (Δ[0] : SSet.{u}) := by sorry
-- stable_not_modules
example : ¬ IsStable (nerve (ModuleCat.{u} ℤ)) := by sorry

noncomputable def stable_suspension (C : SSet.{u}) (h : IsStable C) : C ⟶ C := by sorry
noncomputable def stable_loop (C : SSet.{u}) (h : IsStable C) : C ⟶ C := by sorry

noncomputable def stable_suspension_loop_unit (C : SSet.{u}) (h : IsStable C) :
    coherentNatTrans (𝟙 C) (stable_suspension C h ≫ stable_loop C h) := by sorry
noncomputable def stable_suspension_loop_counit (C : SSet.{u}) (h : IsStable C) :
    coherentNatTrans (stable_loop C h ≫ stable_suspension C h) (𝟙 C) := by sorry

theorem stable_suspension_loop (C : SSet.{u}) (h : IsStable C) :
    IsEquivalenceEdge (stable_suspension_loop_unit C h) ∧
    IsEquivalenceEdge (stable_suspension_loop_counit C h) := by sorry

def PreservesFiniteEnhancedColimits {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [Finite K.N] (p : K ⟶ C)
    (c : (underDiagram C p) _⦋0⦌), IsEnhancedColimit p c →
    IsEnhancedColimit (p ≫ F) ((underDiagram_map F p).app _ c)

theorem stable_exact_iff {C D : SSet.{u}} (hC : IsStable C) (hD : IsStable D) (F : C ⟶ D) :
    IsExactEnhancedFunctor F ↔ PreservesFiniteEnhancedColimits F := by sorry

/- E0: the space category and explicit sizes used by compactness. -/
noncomputable def spaceInfinity : SSet.{u+1} := by sorry
instance spaceInfinity_quasicategory : SSet.Quasicategory spaceInfinity.{u} := by sorry
noncomputable def spaceInfinity_vertices :
    spaceInfinity.{u} _⦋0⦌ ≃ {K : SSet.{u} // SSet.KanComplex K} := by sorry
noncomputable def spaceVertex (K : SSet.{u}) [SSet.KanComplex K] :
    spaceInfinity.{u} _⦋0⦌ := spaceInfinity_vertices.symm ⟨K, inferInstance⟩

abbrev raiseShape (K : SSet.{u}) : SSet.{u+1} := SSet.uliftFunctor.{u+1,u}.obj K
noncomputable def raiseVertex (K : SSet.{u}) : K _⦋0⦌ ≃ raiseShape K _⦋0⦌ := by sorry

def HasSmallSpaceModel (K : SSet.{u+1}) : Prop :=
  SSet.KanComplex K ∧ ∃ L : SSet.{u}, SSet.KanComplex L ∧
    ∃ (f : raiseShape L ⟶ K) (g : K ⟶ raiseShape L),
      Nonempty (SSet.Homotopy (f ≫ g) (𝟙 (raiseShape L))) ∧
      Nonempty (SSet.Homotopy (g ≫ f) (𝟙 K))

def IsLocallySmall (C : SSet.{u+1}) : Prop :=
  SSet.Quasicategory C ∧ ∀ x y : C _⦋0⦌, HasSmallSpaceModel (rightMappingSpace C x y)

noncomputable def smallMappingSpace (C : SSet.{u+1}) (h : IsLocallySmall C)
    (x y : C _⦋0⦌) : SSet.{u} := by sorry
instance smallMappingSpace_kan (C : SSet.{u+1}) [SSet.Quasicategory C]
    (h : IsLocallySmall C) (x y : C _⦋0⦌) :
    SSet.KanComplex (smallMappingSpace C h x y) := by sorry
noncomputable def smallMappingSpace_compare (C : SSet.{u+1}) (h : IsLocallySmall C)
    (x y : C _⦋0⦌) : raiseShape (smallMappingSpace C h x y) ⟶ rightMappingSpace C x y := by sorry

noncomputable def representableSpaceFunctor (C : SSet.{u+1})
    (h : IsLocallySmall C) (x : C _⦋0⦌) : C ⟶ spaceInfinity.{u} := by sorry

noncomputable def representableSpaceFunctor_vertexComparison
    (C : SSet.{u+1}) [SSet.Quasicategory C]
    (h : IsLocallySmall C) (x y : C _⦋0⦌) :
    SSet.Edge ((representableSpaceFunctor C h x).app _ y)
      (spaceVertex (smallMappingSpace C h x y)) := by sorry

theorem representableSpaceFunctor_vertex (C : SSet.{u+1}) [SSet.Quasicategory C]
    (h : IsLocallySmall C) (x y : C _⦋0⦌) :
    IsEquivalenceEdge (representableSpaceFunctor_vertexComparison C h x y) := by sorry

def IsKappaFiltered (κ : Cardinal.{u}) (K : SSet.{u}) : Prop :=
  SSet.Quasicategory K ∧ ∀ (Y : SSet.{u}) (_hY : Cardinal.mk Y.N < κ) (f : Y ⟶ K),
    ∃ g : join Y Δ[0] ⟶ K, joinLeft Y Δ[0] ≫ g = f

def HasSmallEnhancedColimits (C : SSet.{u+1}) : Prop :=
  ∀ (K : SSet.{u}) (p : raiseShape K ⟶ C), ∃ c, IsEnhancedColimit p c

def HasKappaFilteredColimits (κ : Cardinal.{u}) (C : SSet.{u+1}) : Prop :=
  ∀ (K : SSet.{u}) (_hK : IsKappaFiltered κ K) (p : raiseShape K ⟶ C),
    ∃ c, IsEnhancedColimit p c

def IsKappaCompact (κ : Cardinal.{u}) (C : SSet.{u+1})
    (h : IsLocallySmall C) (x : C _⦋0⦌) : Prop :=
  HasKappaFilteredColimits κ C ∧ ∀ (K : SSet.{u}) (_hK : IsKappaFiltered κ K) (p : raiseShape K ⟶ C)
    (c : (underDiagram C p) _⦋0⦌), IsEnhancedColimit p c →
    IsEnhancedColimit (p ≫ representableSpaceFunctor C h x)
      ((underDiagram_map (representableSpaceFunctor C h x) p).app _ c)

def IsKappaAccessible (κ : Cardinal.{u}) (C : SSet.{u+1})
    (h : IsLocallySmall C) : Prop :=
  SSet.Quasicategory C ∧ HasKappaFilteredColimits κ C ∧ ∃ G : Set (C _⦋0⦌), Small.{u} G ∧
    (∀ x ∈ G, IsKappaCompact κ C h x) ∧
    ∀ x : C _⦋0⦌, ∃ (K : SSet.{u}) (_hK : IsKappaFiltered κ K)
      (p : raiseShape K ⟶ C) (c : (underDiagram C p) _⦋0⦌),
      IsEnhancedColimit p c ∧ (coslice_vertex C p).app _ c = x ∧
      ∀ k : K _⦋0⦌, p.app _ (raiseVertex K k) ∈ G

def IsAccessible (C : SSet.{u+1}) : Prop :=
  ∃ h : IsLocallySmall C, ∃ κ : Cardinal.{u}, κ.IsRegular ∧ IsKappaAccessible κ C h

def IsPresentable (C : SSet.{u+1}) : Prop :=
  SSet.Quasicategory C ∧ IsAccessible C ∧ HasSmallEnhancedColimits C

def PreservesKappaFilteredColimits {C D : SSet.{u+1}}
    (κ : Cardinal.{u}) (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) (_hK : IsKappaFiltered κ K) (p : raiseShape K ⟶ C)
    (c : (underDiagram C p) _⦋0⦌), IsEnhancedColimit p c →
    IsEnhancedColimit (p ≫ F) ((underDiagram_map F p).app _ c)

def IsAccessibleFunctor {C D : SSet.{u+1}} (F : C ⟶ D) : Prop :=
  ∃ κ : Cardinal.{u}, κ.IsRegular ∧ PreservesKappaFilteredColimits κ F

theorem presentable_universe (C : SSet.{u+1}) (h : IsPresentable C) :
    HasSmallEnhancedColimits C ∧ ∃ hS : IsLocallySmall C,
      ∃ κ : Cardinal.{u}, κ.IsRegular ∧ IsKappaAccessible κ C hS := by sorry

theorem moduleDerived_locallySmall (R : Type u) [CommRing R] :
    IsLocallySmall (moduleDerived R) := by sorry

-- compact_finite_free
example (R : Type u) [CommRing R] (r : ℕ) :
    IsKappaCompact Cardinal.aleph0 (moduleDerived R) (moduleDerived_locallySmall R)
      (derivedVertex (ModuleCat.{u} R)
        ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).obj
          (ModuleCat.of R (Fin r → R)))) := by sorry

-- compact_infinite_free
example : ¬ IsKappaCompact Cardinal.aleph0 (moduleDerived ℤ) (moduleDerived_locallySmall ℤ)
    (derivedVertex (ModuleCat ℤ)
      ((HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 0).obj
        (ModuleCat.of ℤ (ℕ →₀ ℤ)))) := by sorry

-- presentable_zero
example : IsPresentable (Δ[0] : SSet.{u+1}) ∧
    ∀ (h : IsLocallySmall (Δ[0] : SSet.{u+1})) (x : (Δ[0] : SSet.{u+1}) _⦋0⦌),
      IsKappaCompact Cardinal.aleph0 Δ[0] h x := by sorry

/- E3: adjoint and localization conditions on the genuine mapping spaces. -/
attribute [instance] rightMappingSpace_kan

instance coherentFun_quasicategory (K C : SSet.{u}) [SSet.Quasicategory C] :
    SSet.Quasicategory (coherentFun K C) := by sorry

noncomputable def precomposeMappingEdge {C : SSet.{u}} {x y : C _⦋0⦌}
    (e : SSet.Edge x y) (z : C _⦋0⦌) :
    rightMappingSpace C y z ⟶ rightMappingSpace C x z := by sorry

noncomputable def postcomposeMappingEdge {C : SSet.{u}} {x y : C _⦋0⦌}
    (e : SSet.Edge x y) (z : C _⦋0⦌) :
    rightMappingSpace C z x ⟶ rightMappingSpace C z y := by sorry

abbrev EnhancedArrow (C : SSet.{u}) := Σ x y : C _⦋0⦌, SSet.Edge x y

def IsLocalObject (C : SSet.{u}) [SSet.Quasicategory C]
    (S : Set (EnhancedArrow C)) (z : C _⦋0⦌) : Prop :=
  ∀ e ∈ S, IsSpaceEquivalence (precomposeMappingEdge e.2.2 z)

noncomputable def localCategory (C : SSet.{u}) [SSet.Quasicategory C]
    (S : Set (EnhancedArrow C)) : SSet.{u} := fullEnhancedSubcategory C (IsLocalObject C S)

noncomputable def localCategory_inclusion (C : SSet.{u}) [SSet.Quasicategory C]
    (S : Set (EnhancedArrow C)) : localCategory C S ⟶ C :=
  fullEnhancedSubcategory_inclusion C (IsLocalObject C S)

instance fullEnhancedSubcategory_quasicategory (C : SSet.{u}) [SSet.Quasicategory C]
    (P : C _⦋0⦌ → Prop) : SSet.Quasicategory (fullEnhancedSubcategory C P) := by sorry

instance localCategory_quasicategory (C : SSet.{u}) [SSet.Quasicategory C]
    (S : Set (EnhancedArrow C)) : SSet.Quasicategory (localCategory C S) := by sorry

def HasEnhancedRightAdjoint {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∃ hC : SSet.Quasicategory C, ∃ hD : SSet.Quasicategory D,
    letI := hC
    letI := hD
    ∃ G : D ⟶ C, Nonempty (EnhancedAdjunction
      (ObjectProperty.homMk F : qcat C ⟶ qcat D) (ObjectProperty.homMk G : qcat D ⟶ qcat C))

def HasEnhancedLeftAdjoint {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∃ hC : SSet.Quasicategory C, ∃ hD : SSet.Quasicategory D,
    letI := hC
    letI := hD
    ∃ G : D ⟶ C, Nonempty (EnhancedAdjunction
      (ObjectProperty.homMk G : qcat D ⟶ qcat C) (ObjectProperty.homMk F : qcat C ⟶ qcat D))

def PreservesSmallEnhancedColimits {C D : SSet.{u+1}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) (p : raiseShape K ⟶ C) (c : (underDiagram C p) _⦋0⦌),
    IsEnhancedColimit p c → IsEnhancedColimit (p ≫ F) ((underDiagram_map F p).app _ c)

def HasSmallEnhancedLimits (C : SSet.{u+1}) : Prop :=
  ∀ (K : SSet.{u}) (p : raiseShape K ⟶ C), ∃ c, IsEnhancedLimit p c

def PreservesSmallEnhancedLimits {C D : SSet.{u+1}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) (p : raiseShape K ⟶ C) (c : (overDiagram C p) _⦋0⦌),
    IsEnhancedLimit p c → IsEnhancedLimit (p ≫ F) ((overDiagram_map F p).app _ c)

theorem adjointFunctor_right_iff {C D : SSet.{u+1}} (hC : IsPresentable C)
    (hD : IsPresentable D) (F : C ⟶ D) :
    HasEnhancedRightAdjoint F ↔ PreservesSmallEnhancedColimits F := by sorry

theorem adjointFunctor_left_iff {C D : SSet.{u+1}} (hC : IsPresentable C)
    (hD : IsPresentable D) (F : C ⟶ D) :
    HasEnhancedLeftAdjoint F ↔ IsAccessibleFunctor F ∧ PreservesSmallEnhancedLimits F := by sorry

theorem presentable_hasLimits (C : SSet.{u+1}) (h : IsPresentable C) :
    HasSmallEnhancedLimits C := by sorry

noncomputable def accessibleLocalization (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S) :
    C ⟶ localCategory C S := by sorry

noncomputable def localization_unit (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S) :
    coherentNatTrans (𝟙 C) (accessibleLocalization C hC S hS ≫ localCategory_inclusion C S) := by sorry

noncomputable def localization_mappingComparison (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S)
    (x : C _⦋0⦌) (y : (localCategory C S) _⦋0⦌) :
    rightMappingSpace (localCategory C S) ((accessibleLocalization C hC S hS).app _ x) y ⟶
    rightMappingSpace C x ((localCategory_inclusion C S).app _ y) := by sorry

theorem localization_mapEquiv (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S)
    (x : C _⦋0⦌) (y : (localCategory C S) _⦋0⦌) :
    IsSpaceEquivalence (localization_mappingComparison C hC S hS x y) := by sorry

theorem localization_presentable (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S) :
    IsPresentable (localCategory C S) ∧ IsAccessibleFunctor (accessibleLocalization C hC S hS) := by sorry

noncomputable def presentableCoreflector (C : SSet.{u+1}) [SSet.Quasicategory C]
    (P : C _⦋0⦌ → Prop) (hC : IsPresentable C)
    (hA : IsPresentable (fullEnhancedSubcategory C P))
    (hcolim : PreservesSmallEnhancedColimits (fullEnhancedSubcategory_inclusion C P)) :
    C ⟶ fullEnhancedSubcategory C P := by sorry

theorem presentableCoreflector_adjunction (C : SSet.{u+1}) [SSet.Quasicategory C]
    (P : C _⦋0⦌ → Prop) (hC : IsPresentable C)
    (hA : IsPresentable (fullEnhancedSubcategory C P))
    (hcolim : PreservesSmallEnhancedColimits (fullEnhancedSubcategory_inclusion C P)) :
    Nonempty (EnhancedAdjunction
      (ObjectProperty.homMk (fullEnhancedSubcategory_inclusion C P) :
        qcat (fullEnhancedSubcategory C P) ⟶ qcat C)
      (ObjectProperty.homMk (presentableCoreflector C P hC hA hcolim) :
        qcat C ⟶ qcat (fullEnhancedSubcategory C P))) := by sorry

noncomputable def localization_idempotent (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S) :
    let T := accessibleLocalization C hC S hS ≫ localCategory_inclusion C S
    coherentNatTrans (T ≫ T) T := by sorry

theorem localization_idempotent_equiv (C : SSet.{u+1}) [SSet.Quasicategory C]
    (hC : IsPresentable C) (S : Set (EnhancedArrow C)) (hS : Small.{u} S) :
    IsEquivalenceEdge (localization_idempotent C hC S hS) := by sorry

-- localization_empty
example (C : SSet.{u}) [SSet.Quasicategory C] :
    Nonempty (localCategory C ∅ ≅ C) := by sorry

-- coreflection_direction: the inclusion is the left member of the adjunction.
example (C : SSet.{u+1}) [SSet.Quasicategory C]
    (P : C _⦋0⦌ → Prop) (hC : IsPresentable C)
    (hA : IsPresentable (fullEnhancedSubcategory C P))
    (hcolim : PreservesSmallEnhancedColimits (fullEnhancedSubcategory_inclusion C P)) :
    HasEnhancedRightAdjoint (fullEnhancedSubcategory_inclusion C P) := by sorry

instance standardSimplex_quasicategory (n : ℕ) :
    SSet.Quasicategory (Δ[n] : SSet.{u}) := by sorry
instance standardPoint_kan : SSet.KanComplex (Δ[0] : SSet.{u}) := by sorry
instance emptySpace_kan : SSet.KanComplex (⊥_ SSet.{u}) := by sorry
instance discreteNerve_kan (T : Type u) : SSet.KanComplex (nerve (Discrete T)) := by sorry
instance qcatObj_quasicategory (C : SSet.QCat.{u}) : SSet.Quasicategory C.obj := C.property

/- The core retains every vertex and exactly the equivalence edges. Cat∞ is
obtained from its Kan-valued functor enrichment, rather than from its h-category. -/
noncomputable def enhancedCore (C : SSet.{u}) : SSet.{u} := by sorry
noncomputable def enhancedCore_inclusion (C : SSet.{u}) : enhancedCore C ⟶ C := by sorry
instance enhancedCore_kan (C : SSet.{u}) [SSet.Quasicategory C] :
    SSet.KanComplex (enhancedCore C) := by sorry
noncomputable def enhancedCore_vertices (C : SSet.{u}) :
    (enhancedCore C) _⦋0⦌ ≃ C _⦋0⦌ := by sorry

noncomputable def catInfinity : SSet.{u+1} := by sorry
instance catInfinity_quasicategory : SSet.Quasicategory catInfinity.{u} := by sorry
noncomputable def catInfinity_vertices : catInfinity.{u} _⦋0⦌ ≃ SSet.QCat.{u} := by sorry
noncomputable def catVertex (C : SSet.QCat.{u}) : catInfinity.{u} _⦋0⦌ :=
  catInfinity_vertices.symm C

instance raiseShape_quasicategory (K : SSet.{u}) [SSet.Quasicategory K] :
    SSet.Quasicategory (raiseShape K) := by sorry
instance raiseShape_kan (K : SSet.{u}) [SSet.KanComplex K] :
    SSet.KanComplex (raiseShape K) := by sorry
instance coherentFun_kan (K C : SSet.{u}) [SSet.KanComplex C] :
    SSet.KanComplex (coherentFun K C) := by sorry

noncomputable def catInfinity_mappingComparison (C D : SSet.QCat.{u}) :
    rightMappingSpace catInfinity (catVertex C) (catVertex D) ⟶
    raiseShape (enhancedCore (coherentFun C.obj D.obj)) := by sorry

theorem catInfinity_mappingEquiv (C D : SSet.QCat.{u}) :
    IsSpaceEquivalence (catInfinity_mappingComparison C D) := by sorry

noncomputable def spaceInfinity_mappingComparison (K L : SSet.{u})
    [SSet.KanComplex K] [SSet.KanComplex L] :
    rightMappingSpace spaceInfinity (spaceVertex K) (spaceVertex L) ⟶
    raiseShape (coherentFun K L) := by sorry

theorem spaceInfinity_mappingEquiv (K L : SSet.{u}) [SSet.KanComplex K] [SSet.KanComplex L] :
    IsSpaceEquivalence (spaceInfinity_mappingComparison K L) := by sorry

-- higherCategory_point: terminal-category-valued mapping functors have contractible cores.
example (C : SSet.QCat.{u}) :
    IsContractibleSpace (rightMappingSpace catInfinity (catVertex C) (catVertex (qcat Δ[0]))) := by sorry

-- higherCategory_interval: both ordinary arrows and coherent squares survive as objects/morphisms.
example (C : SSet.{u}) [SSet.Quasicategory C] :
    IsSpaceEquivalence (catInfinity_mappingComparison (qcat Δ[1]) (qcat C)) := by sorry

-- higherCategory_not_homotopy_category: the core of the interval has two components.
example : ¬ IsContractibleSpace
    (rightMappingSpace catInfinity (catVertex (qcat (Δ[0] : SSet.{u})))
      (catVertex (qcat Δ[1]))) := by sorry

-- spaceCategory_point
noncomputable def spacePointMappingComparison (K : SSet.{u}) [SSet.KanComplex K] :
    rightMappingSpace spaceInfinity (spaceVertex Δ[0]) (spaceVertex K) ⟶
    raiseShape K := by sorry
example (K : SSet.{u}) [SSet.KanComplex K] :
    IsSpaceEquivalence (spacePointMappingComparison K) := by sorry

-- spaceCategory_empty: no map from a nonempty space to the empty space.
example (K : SSet.{u}) [SSet.KanComplex K] (x : K _⦋0⦌) :
    IsEmpty ((rightMappingSpace spaceInfinity (spaceVertex K)
      (spaceVertex (⊥_ SSet.{u}))) _⦋0⦌) := by sorry

-- spaceCategory_discrete_two
noncomputable def spaceTwoMappingComparison :
    rightMappingSpace spaceInfinity (spaceVertex (nerve (Discrete (ULift.{u} (Fin 2)))))
      (spaceVertex (nerve (Discrete (ULift.{u} (Fin 2))))) ⟶
    raiseShape (nerve (Discrete (ULift.{u} (Fin 2 → Fin 2)))) := by sorry
example : IsSpaceEquivalence spaceTwoMappingComparison.{u} := by sorry

-- coherentFun_pointwiseEquiv
 theorem coherentFun_pointwiseEquiv {K C : SSet.{u}} [SSet.Quasicategory C]
    {F G : K ⟶ C} (η : coherentNatTrans F G) :
    IsEquivalenceEdge η ↔ ∀ x : K _⦋0⦌, IsEquivalenceEdge (η.map (coherentFun_eval x)) := by sorry

-- coherentFun_interval
example (C : SSet.{u}) :
    (coherentFun Δ[1] C) _⦋0⦌ ≃ EnhancedArrow C := by sorry

-- localization_zero: the declared generating family detects zero objects by mapping spaces.
example (C : SSet.{u}) [SSet.Quasicategory C] (hC : IsStable C) (G : Set (C _⦋0⦌))
    (hG : ∀ x : C _⦋0⦌,
      (∀ g ∈ G, IsContractibleSpace (rightMappingSpace C g x)) → IsZeroVertex C x)
    (z : C _⦋0⦌) :
    IsLocalObject C {e : EnhancedArrow C | e.1 ∈ G ∧ IsZeroVertex C e.2.1} z ↔
      IsZeroVertex C z := by sorry

/- Relative Kan extensions use a categorical fibration, including equivalence
lifting. Inner horn lifting alone is not the hypothesis of HTT 4.3.2.15. -/
def IsCategoricalFibration {E B : SSet.{u}} (p : E ⟶ B) : Prop :=
  SSet.InnerFibration p ∧ ∀ (x : E _⦋0⦌) (b : B _⦋0⦌)
    (a : SSet.Edge (p.app _ x) b), IsEquivalenceEdge a →
    ∃ (y : E _⦋0⦌) (e : SSet.Edge x y), (e.map p).edge = a.edge ∧ IsEquivalenceEdge e

noncomputable def coherentRestrict {I K C : SSet.{u}} (i : I ⟶ K) :
    coherentFun K C ⟶ coherentFun I C := by sorry

noncomputable def kanMappingComparison {I K C : SSet.{u}} (i : I ⟶ K)
    (F : I ⟶ C) (G H : K ⟶ C) (η : coherentNatTrans F (i ≫ G)) :
    rightMappingSpace (coherentFun K C)
      ((SimplicialCategory.homEquiv' K C) G) ((SimplicialCategory.homEquiv' K C) H) ⟶
    rightMappingSpace (coherentFun I C)
      ((SimplicialCategory.homEquiv' I C) F) ((SimplicialCategory.homEquiv' I C) (i ≫ H)) := by sorry

def IsLeftKanExtension {I K C : SSet.{u}} [SSet.Quasicategory C] (i : I ⟶ K)
    (F : I ⟶ C) (G : K ⟶ C) (η : coherentNatTrans F (i ≫ G)) : Prop :=
  ∀ H : K ⟶ C, IsSpaceEquivalence (kanMappingComparison i F G H η)

noncomputable def enhancedCore_edges (C : SSet.{u}) [SSet.Quasicategory C]
    (x y : (enhancedCore C) _⦋0⦌) :
    (SSet.Edge x y) ≃ {e : SSet.Edge ((enhancedCore_inclusion C).app _ x)
      ((enhancedCore_inclusion C).app _ y) // IsEquivalenceEdge e} := by sorry

-- core_point
example : Nonempty (enhancedCore (Δ[0] : SSet.{u}) ≅ Δ[0]) := by sorry
-- core_interval
example : Nonempty (enhancedCore (Δ[1] : SSet.{u}) ≅
    nerve (Discrete (ULift.{u} (Fin 2)))) := by sorry
-- core_groupoid
example (K : SSet.{u}) [SSet.KanComplex K] :
    Nonempty (enhancedCore K ≅ K) := by sorry

/- E2: Postnikov conditions on the actual enhancement and integer cohomology. -/
noncomputable def enhancedCohomology (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (m : ℤ) : (enhancedDerived A) _⦋0⦌ → A := by sorry

noncomputable def enhancedTruncGE (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (m : ℤ) : enhancedDerived A ⟶ enhancedDerived A := by sorry

noncomputable def truncGEUnit (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (m : ℤ) : coherentNatTrans (𝟙 (enhancedDerived A))
      (enhancedTruncGE A m) := by sorry

noncomputable def truncGETransition (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (n : ℕ) : coherentNatTrans
      (enhancedTruncGE A (-(n+1 : ℤ))) (enhancedTruncGE A (-(n : ℤ))) := by sorry

noncomputable def postnikovFunctor (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] : enhancedDerived A ⟶ coherentTower (enhancedDerived A) := by sorry

noncomputable def postnikovFunctor_eval (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (n : ℕ) : coherentNatTrans
      (postnikovFunctor A ≫ coherentFun_eval (nerveEquiv.symm (ULift.up (op n))))
      (enhancedTruncGE A (-(n : ℤ))) := by sorry

theorem postnikovFunctor_eval_equiv (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (n : ℕ) :
    IsEquivalenceEdge (postnikovFunctor_eval A n) := by sorry

noncomputable def towerStep {D : SSet.{u}} (F : CoherentTower D) (n : ℕ) :
    SSet.Edge (coherentTower_eval F (n+1)) (coherentTower_eval F n) := by sorry

def IsPostnikovTower (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (F : CoherentTower (enhancedDerived A)) : Prop :=
  (∀ n : ℕ, ∀ m : ℤ, m < -(n : ℤ) → IsZero (enhancedCohomology A m (coherentTower_eval F n))) ∧
  ∀ n : ℕ, IsEquivalenceEdge ((towerStep F n).map (enhancedTruncGE A (-(n : ℤ))))

noncomputable def postnikovCompletion (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] : SSet.{max u v} :=
  fullEnhancedSubcategory (coherentTower (enhancedDerived A))
    (fun s ↦ IsPostnikovTower A ((SimplicialCategory.homEquiv' _ _).symm s))

noncomputable def postnikovCompletion_eval (A : Type u) [Category.{v} A] [Abelian A]
    [IsGrothendieckAbelian A] (n : ℕ) : postnikovCompletion A ⟶ enhancedDerived A := by sorry

-- postnikov_zero
example (A : Type u) [Category.{v} A] [Abelian A] [IsGrothendieckAbelian A] :
    IsPostnikovTower A ((SimplicialCategory.homEquiv' _ _).symm
      ((postnikovFunctor A).app _ (derivedVertex A (0 : CochainComplex A ℤ)))) := by sorry

-- postnikov_heart
example (A : Type u) [Category.{v} A] [Abelian A] [IsGrothendieckAbelian A]
    (M : A) (n : ℕ) :
    IsEquivalenceEdge ((truncGEUnit A (-(n : ℤ))).map
      (coherentFun_eval (derivedVertex A
        ((HomologicalComplex.single A (ComplexShape.up ℤ) 0).obj M)))) := by sorry

-- postnikov_negative_shift: the degree -1 group appears only from the first truncation onward.
example (A : Type u) [Category.{v} A] [Abelian A] [IsGrothendieckAbelian A]
    (M : A) (hM : ¬ IsZero M) :
    IsZeroVertex (enhancedDerived A) ((enhancedTruncGE A 0).app _
      (derivedVertex A ((HomologicalComplex.single A (ComplexShape.up ℤ) (-1)).obj M))) ∧
    ¬ IsZeroVertex (enhancedDerived A) ((enhancedTruncGE A (-1)).app _
      (derivedVertex A ((HomologicalComplex.single A (ComplexShape.up ℤ) (-1)).obj M))) := by sorry

/- E4: coherent quotient-ring systems, with no proposition-valued replacement for coherence. -/
noncomputable def coefficientSystemTotal (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) : SSet.{u+1} := by sorry
noncomputable def coefficientSystemProjection (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    coefficientSystemTotal C J R I ⟶ towerShape.{u+1} := by sorry
instance coefficientSystemTotal_quasicategory (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    SSet.Quasicategory (coefficientSystemTotal C J R I) := by sorry

theorem coefficientSystemProjection_coCartesian (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    IsCoCartesianFibration (coefficientSystemProjection C J R I) := by sorry

noncomputable def CompatibleCoefficientSystems (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) : SSet.{u+1} :=
    coCartesianSections (coefficientSystemProjection C J R I)

instance CompatibleCoefficientSystems_quasicategory (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    SSet.Quasicategory (CompatibleCoefficientSystems C J R I) := by sorry

noncomputable def coefficientSystem_eval (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) (n : ℕ) :
    CompatibleCoefficientSystems C J R I ⟶ sheafDerived C J (R ⧸ I^(n+1)) := by sorry

noncomputable def quotientScalarChange (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) (n : ℕ) :
    sheafDerived C J (R ⧸ I^(n+2)) ⟶ sheafDerived C J (R ⧸ I^(n+1)) := by sorry

noncomputable def coefficientSystem_transition (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) (n : ℕ) :
    coherentNatTrans (coefficientSystem_eval C J R I (n+1) ≫ quotientScalarChange C J R I n)
      (coefficientSystem_eval C J R I n) := by sorry

theorem coefficientSystem_transition_equiv (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) (n : ℕ) :
    IsEquivalenceEdge (coefficientSystem_transition C J R I n) := by sorry

noncomputable def coefficientReduction (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    DerivedCompleteSheaves C J R I ⟶ CompatibleCoefficientSystems C J R I := by sorry

noncomputable def reconstructCoefficientSystem (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    CompatibleCoefficientSystems C J R I ⟶ DerivedCompleteSheaves C J R I := by sorry

noncomputable def reconstructionUnit (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    coherentNatTrans (𝟙 (DerivedCompleteSheaves C J R I))
      (coefficientReduction C J R I ≫ reconstructCoefficientSystem C J R I) := by sorry

noncomputable def reconstructionCounit (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    coherentNatTrans (reconstructCoefficientSystem C J R I ≫ coefficientReduction C J R I)
      (𝟙 (CompatibleCoefficientSystems C J R I)) := by sorry

theorem coefficient_system_reconstruction (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R)
    (hX : IsReplete (Sheaf J (Type u))) (fs : List R)
    (hfs : RingTheory.Sequence.IsRegular R fs) (hI : I = Ideal.ofList fs) :
    IsEquivalenceEdge (reconstructionUnit C J R I) ∧
    IsEquivalenceEdge (reconstructionCounit C J R I) := by sorry

noncomputable def coefficientSystem_zeroIdeal_eval (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] :
    CompatibleCoefficientSystems C J R (⊥ : Ideal R) ⟶ sheafDerived C J R := by sorry

-- coefficientSystem_zeroIdeal: evaluation is a categorical equivalence.
example (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] :
    letI := enhancedDerived_quasicategory
      (SheafOfModules.{u} (constantCoefficientSheaf C J R))
    IsCategoricalEquivalence
      (ObjectProperty.homMk (coefficientSystem_zeroIdeal_eval C J R) :
        qcat (CompatibleCoefficientSystems C J R (⊥ : Ideal R)) ⟶
          qcat (sheafDerived C J R)) := by sorry

-- fullSubcategory_all
example (C : SSet.{u}) :
    Nonempty (fullEnhancedSubcategory C (fun _ ↦ True) ≅ C) := by sorry
-- fullSubcategory_none
example (C : SSet.{u}) :
    Nonempty (fullEnhancedSubcategory C (fun _ ↦ False) ≅ (⊥_ SSet.{u})) := by sorry
-- fullSubcategory_ordinary
example (A : Type u) [Category.{u} A] (P : A → Prop) :
    Nonempty (fullEnhancedSubcategory (nerve A) (fun x ↦ P (nerveEquiv x)) ≅
      nerve (ObjectProperty.FullSubcategory P)) := by sorry

-- localSmall_raise
example (C : SSet.{u}) [SSet.Quasicategory C] : IsLocallySmall (raiseShape C) := by sorry
-- localSmall_sets
example : IsLocallySmall (nerve (Type u)) := by sorry
-- localSmall_large_hom
example (A : Type (u+1)) [Category.{u+1} A] (x y : A) (h : ¬ Small.{u} (x ⟶ y)) :
    ¬ IsLocallySmall (nerve A) := by sorry

-- localSmall_contractible_large_model: raw simplex size is not homotopy size.
example (K : SSet.{u+1}) (hK : IsContractibleSpace K) : HasSmallSpaceModel K := by sorry

-- filtered_point
example (κ : Cardinal.{u}) (hκ : κ.IsRegular) : IsKappaFiltered κ Δ[0] := by sorry
-- filtered_empty
example (κ : Cardinal.{u}) (hκ : κ.IsRegular) :
    ¬ IsKappaFiltered κ (⊥_ SSet.{u}) := by sorry
-- filtered_discrete_two
example : ¬ IsKappaFiltered Cardinal.aleph0 (nerve (Discrete (ULift.{u} (Fin 2)))) := by sorry

-- categoricalFibration_identity
example (C : SSet.{u}) : IsCategoricalFibration (𝟙 C) := by sorry
-- categoricalFibration_point
example (C : SSet.{u}) [SSet.Quasicategory C] :
    IsCategoricalFibration (terminal.from C) := by sorry
-- categoricalFibration_product
example (B C : SSet.{u}) [SSet.Quasicategory B] [SSet.Quasicategory C] :
    IsCategoricalFibration (CartesianMonoidalCategory.fst B C) := by sorry

theorem smallMappingSpace_compare_equiv (C : SSet.{u+1}) [SSet.Quasicategory C]
    (h : IsLocallySmall C) (x y : C _⦋0⦌) :
    IsSpaceEquivalence (smallMappingSpace_compare C h x y) := by sorry

-- derivedCompleteSheaf_shift_detection
example (p : ℕ) (hp : p.Prime) :
    let C := Discrete Unit
    let J : GrothendieckTopology C := ⊥
    let g := sheafLocalizationGenerator C J ℤ ⟨()⟩ (p : ℤ)
    let K := (sheafShift C J ℤ (-1)).app _ g
    IsContractibleSpace (rightMappingSpace (sheafDerived C J ℤ) g K) ∧
      ¬ IsDerivedCompleteSheaf C J ℤ (Ideal.span {(p : ℤ)}) K := by sorry

instance DerivedCompleteSheaves_quasicategory (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R) :
    SSet.Quasicategory (DerivedCompleteSheaves C J R I) := by sorry

theorem coefficientSystem_mapEquiv (C : Type u) [SmallCategory C]
    (J : GrothendieckTopology C) (R : Type u) [CommRing R] (I : Ideal R)
    {x y : (CompatibleCoefficientSystems C J R I) _⦋0⦌} (e : SSet.Edge x y) :
    IsEquivalenceEdge e ↔ ∀ n, IsEquivalenceEdge (e.map (coefficientSystem_eval C J R I n)) := by sorry

-- coefficientSystem_zero
example (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] (I : Ideal R)
    (s : (CompatibleCoefficientSystems C J R I) _⦋0⦌)
    (hs : ∀ n, IsZeroVertex (sheafDerived C J (R ⧸ I^(n+1)))
      ((coefficientSystem_eval C J R I n).app _ s)) :
    IsZeroVertex (CompatibleCoefficientSystems C J R I) s := by sorry

-- reconstructCoefficientSystem_zero
example (C : Type u) [SmallCategory C] (J : GrothendieckTopology C)
    (R : Type u) [CommRing R] (I : Ideal R)
    (s : (CompatibleCoefficientSystems C J R I) _⦋0⦌)
    (hs : IsZeroVertex (CompatibleCoefficientSystems C J R I) s) :
    IsZeroVertex (DerivedCompleteSheaves C J R I)
      ((reconstructCoefficientSystem C J R I).app _ s) := by sorry

end Sheaves

/-! ## Layer E5: monoidal, presentable and animated structures -/

section Monoidal

open CategoryTheory
set_option autoImplicit false

abbrev QCat := { C : SSet.{1} // SSet.Quasicategory C }
abbrev QFun (C D : QCat) := C.val ⟶ D.val
-- Reuse the pinned homotopy-category carrier and its category instance.
abbrev HCat (C : QCat) : Type 1 := C.val.HomotopyCategory
abbrev Obj := HCat
abbrev HEquiv (C D : QCat) := HCat C ≌ HCat D
def onHCat {C D : QCat} (F : QFun C D) : HCat C ⥤ HCat D := SSet.mapHomotopyCategory F
-- Fixed-universe lifting of the existing ordinary nerve remains a placeholder.
noncomputable def nerveQ (C : Type) [Category C] : QCat := by sorry
noncomputable def discreteQ (A : Type) : QCat := by sorry
noncomputable def terminalQ : QCat := by sorry
noncomputable def emptyQ : QCat := by sorry
noncomputable def spacesQ : QCat := by sorry
noncomputable def abstractSp : QCat := by sorry
noncomputable def finStar : QCat := by sorry
noncomputable def simplexQ : QCat := by sorry
noncomputable def simplexOp : QCat := by sorry
noncomputable def powerQ (C : QCat) (n : ℕ) : QCat := by sorry
noncomputable def productQ (C D : QCat) : QCat := by sorry
noncomputable def opQ (C : QCat) : QCat := by sorry
noncomputable def funQ (C D : QCat) : QCat := by sorry
noncomputable def exactFunQ (C D : QCat) : QCat := by sorry
noncomputable def filteredFunQ (C D : QCat) : QCat := by sorry
noncomputable def colimitFunQ (C D : QCat) : QCat := by sorry
noncomputable def siftedFunQ (C D : QCat) : QCat := by sorry
noncomputable def zeroObj (C : QCat) : Obj C := by sorry
noncomputable def zeroHom {C : QCat} (x y : Obj C) : x ⟶ y := by sorry
noncomputable def suspension (C : QCat) (x : Obj C) : Obj C := by sorry
noncomputable def mappingQ (C : QCat) (x y : Obj C) : QCat := by sorry
noncomputable def colimitObj {I C : QCat} (F : QFun I C) : Obj C := by sorry
noncomputable def coproductObj (C : QCat) (x y : Obj C) : Obj C := by sorry
noncomputable def countableSum (C : QCat) (s : ℕ → Obj C) : Obj C := by sorry
-- The full condition is a coherent mapping-space lifting condition. These data
-- record its h-category shadow, with small ordinary filtered indexing shapes.
structure MappingSquareData where
  sourceTop : QCat
  targetTop : QCat
  sourceBottom : QCat
  targetBottom : QCat
  top : QFun sourceTop targetTop
  left : QFun sourceTop sourceBottom
  right : QFun targetTop targetBottom
  bottom : QFun sourceBottom targetBottom
  commutes : onHCat top ⋙ onHCat right ≅ onHCat left ⋙ onHCat bottom
structure MappingDiagonalData (S : MappingSquareData) where
  diagonal : QFun S.targetTop S.sourceBottom
  upper : onHCat S.top ⋙ onHCat diagonal ≅ onHCat S.left
  lower : onHCat diagonal ⋙ onHCat S.bottom ≅ onHCat S.right
noncomputable def compactMappingSquare (C : QCat) (a : Arrow (HCat C))
    (I : Type) [Category.{0} I] [IsFiltered I] (F : QFun (nerveQ I) C) : MappingSquareData := by sorry
def compactMaps (C : QCat) : Set (Arrow (HCat C)) :=
  {a | ∀ (I : Type) [Category.{0} I] [IsFiltered I] (F : QFun (nerveQ I) C),
    Nonempty (MappingDiagonalData (compactMappingSquare C a I F))}
noncomputable def colimitProductQ (I : QCat) (F G : QFun I spacesQ) : QCat := by sorry
noncomputable def colimitSpaceQ (I : QCat) (F : QFun I spacesQ) : QCat := by sorry
-- E0's full n-truncated-space predicate is unavailable. This named carrier
-- records the intended subcategory; its inclusion and truncation laws are omitted.
noncomputable def truncatedSpacesQ (n : ℕ) : QCat := by sorry
noncomputable def filteredTotQ (I : Type) [Category.{0} I] [IsFiltered I] (n : ℕ)
    (F : QFun (nerveQ I) (funQ simplexQ (truncatedSpacesQ n))) : QCat := by sorry
noncomputable def totFilteredQ (I : Type) [Category.{0} I] [IsFiltered I] (n : ℕ)
    (F : QFun (nerveQ I) (funQ simplexQ (truncatedSpacesQ n))) : QCat := by sorry

/- EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category
A symmetric monoidal infinity-category is a cocartesian fibration C⊗ → N(Fin_*) whose fibre over ⟨n⟩ maps equivalently to C^n through the n inert projections; C is the fibre at ⟨1⟩. The fibre at ⟨0⟩ is terminal. Active fold maps give tensor products and the nullary fold gives the unit. -/
structure SymMonData where
  total : QCat
  projection : QFun total finStar
  fibre : ℕ → QCat
  -- The full Segal equivalence is higher; this field records its h-category shadow.
  segal : ∀ n, HEquiv (fibre n) (powerQ (fibre 1) n)
  -- Generated projections: SymMonData.tensor and SymMonData.unit.
  tensor : Obj (fibre 1) → Obj (fibre 1) → Obj (fibre 1)
  unit : Obj (fibre 1)
noncomputable def SymMonData.ofOrdinary (C : Type) [Category C]
    [MonoidalCategory C] [SymmetricCategory C] : SymMonData := by sorry
noncomputable def SymMonData.test_zero (C : SymMonData) : HEquiv (C.fibre 0) terminalQ := by sorry
example (C : SymMonData) : HEquiv (C.fibre 0) terminalQ := by sorry
noncomputable def SymMonData.test_one (C : SymMonData) : HEquiv (C.fibre 1) (powerQ (C.fibre 1) 1) := by sorry
example (C : SymMonData) : HEquiv (C.fibre 1) (powerQ (C.fibre 1) 1) := by sorry
noncomputable def SymMonData.test_ordinary (C : Type) [Category C]
    [MonoidalCategory C] [SymmetricCategory C] : HCat ((SymMonData.ofOrdinary C).fibre 1) ≌ C := by sorry
example (C : Type) [Category C] [MonoidalCategory C] [SymmetricCategory C] :
    HCat ((SymMonData.ofOrdinary C).fibre 1) ≌ C := by sorry

noncomputable def invertingLaxFunctors (C D : SymMonData) (W : Set (Arrow (HCat (C.fibre 1)))) : QCat := by sorry

/- EnhancedDerivedSheaves:E5:abstract/infinity-operad
An infinity-operad O⊗ → N(Fin_*) is an inner fibration with cocartesian inert lifts. For each map f:⟨m⟩→⟨n⟩, its mapping space over f is the product of the mapping spaces over ρ_i f to the n output colours. Its fibre at ⟨n⟩ is equivalent, via inert projections, to the n-fold product of its colour fibre. The mapping-space condition includes nullary operations. -/
structure OperadData where
  total : QCat
  projection : QFun total finStar
  colours : QCat
noncomputable def commOperad : OperadData := by sorry
noncomputable def assOperad : OperadData := by sorry
noncomputable def operationSpace (O : OperadData) (n : ℕ) : QCat := by sorry
noncomputable def OperadData.test_comm : HEquiv commOperad.colours terminalQ := by sorry
example : HEquiv commOperad.colours terminalQ := by sorry
noncomputable def OperadData.test_assoc (n : ℕ) : HEquiv (operationSpace assOperad n) (discreteQ (Equiv.Perm (Fin n))) := by sorry
example (n : ℕ) : HEquiv (operationSpace assOperad n) (discreteQ (Equiv.Perm (Fin n))) := by sorry
noncomputable def OperadData.test_nullary : HEquiv (operationSpace assOperad 0) terminalQ := by sorry
example : HEquiv (operationSpace assOperad 0) terminalQ := by sorry

/- EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad
An O-monoidal infinity-category is a cocartesian fibration C⊗ → O⊗ such that, for T with inert components T_i, C_T → ∏_i C_(T_i) is an equivalence. The composite to N(Fin_*) is then an infinity-operad. A map is O-monoidal if it preserves cocartesian edges; it is lax O-monoidal if it is an operad map and only preserves the inert edges. -/
structure OMonoidalData where
  operad : OperadData
  total : QCat
  projection : QFun total operad.total
noncomputable def strongMonoidalFunctors (C D : SymMonData) : QCat := by sorry
noncomputable def laxMonoidalFunctors (C D : SymMonData) : QCat := by sorry
noncomputable def OMonoidalData.test_comm (C : SymMonData) : { O : OMonoidalData // O.operad = commOperad ∧ O.total = C.total } := by sorry
example (C : SymMonData) : { O : OMonoidalData // O.operad = commOperad ∧ O.total = C.total } := by sorry
noncomputable def strongUnderlying (C D : SymMonData) (F : Obj (strongMonoidalFunctors C D)) : QFun (C.fibre 1) (D.fibre 1) := by sorry
noncomputable def OMonoidalData.test_identity (C : SymMonData) : { F : Obj (strongMonoidalFunctors C C) // strongUnderlying C C F = 𝟙 (C.fibre 1).val } := by sorry
example (C : SymMonData) : { F : Obj (strongMonoidalFunctors C C) // strongUnderlying C C F = 𝟙 (C.fibre 1).val } := by sorry
noncomputable def laxUnderlying (C D : SymMonData) (F : Obj (laxMonoidalFunctors C D)) : QFun (C.fibre 1) (D.fibre 1) := by sorry
noncomputable def OMonoidalData.test_unit (C D : SymMonData) (F : Obj (laxMonoidalFunctors C D)) : D.unit ⟶ (onHCat (laxUnderlying C D F)).obj C.unit := by sorry
example (C D : SymMonData) (F : Obj (laxMonoidalFunctors C D)) : D.unit ⟶ (onHCat (laxUnderlying C D F)).obj C.unit := by sorry

/- EnhancedDerivedSheaves:E5:abstract/algebra-objects
Alg_O(C) is the full infinity-category of sections O⊗ → C⊗ over O⊗ that preserve inert edges. For O=Comm write CAlg(C); for O=Ass use associative algebra objects. Algebra maps are coherent transformations over the operad. In a cartesian monoidal ordinary category, the construction agrees with ordinary commutative or associative monoid objects after passing to nerves. -/
-- Pull back C.total along O.projection before taking operadic sections.
noncomputable def operadicAlgebras (O : OperadData) (C : SymMonData) : QCat := by sorry
noncomputable def relativeOperadicAlgebras (C : OMonoidalData) : QCat := by sorry
noncomputable def operadicColourFibre (C : OMonoidalData) (colour : Obj C.operad.colours) : QCat := by sorry
noncomputable def algebraAtColour (C : OMonoidalData) (colour : Obj C.operad.colours) :
    QFun (relativeOperadicAlgebras C) (operadicColourFibre C colour) := by sorry
noncomputable def commutativeAlgebras (C : SymMonData) : QCat := by sorry
noncomputable def algebraForget (C : SymMonData) : QFun (commutativeAlgebras C) (C.fibre 1) := by sorry
noncomputable def assCuts : QFun simplexOp assOperad.total := by sorry
noncomputable def terminalMonoidal : SymMonData := by sorry
noncomputable def setsMonoidal : SymMonData := by sorry
noncomputable def commutativeMonoidsQ : QCat := by sorry
-- Product-valued Segal levels are used only for cartesian sets.
noncomputable def algebraSegalLevel (A : Obj (operadicAlgebras assOperad setsMonoidal)) (n : ℕ) : QCat := by sorry
noncomputable def operadicAlgebras.test_terminal : HEquiv (commutativeAlgebras terminalMonoidal) terminalQ := by sorry
example : HEquiv (commutativeAlgebras terminalMonoidal) terminalQ := by sorry
noncomputable def operadicAlgebras.test_sets : HEquiv (commutativeAlgebras setsMonoidal) commutativeMonoidsQ := by sorry
example : HEquiv (commutativeAlgebras setsMonoidal) commutativeMonoidsQ := by sorry
noncomputable def operadicAlgebras.test_segal (A : Obj (operadicAlgebras assOperad setsMonoidal)) :
    HEquiv (algebraSegalLevel A 2) (powerQ (algebraSegalLevel A 1) 2) ×
      HEquiv (algebraSegalLevel A 0) terminalQ := by sorry
example (A : Obj (operadicAlgebras assOperad setsMonoidal)) :
    HEquiv (algebraSegalLevel A 2) (powerQ (algebraSegalLevel A 1) 2) ×
      HEquiv (algebraSegalLevel A 0) terminalQ := by sorry

/- EnhancedDerivedSheaves:E5:abstract/module-objects
For an associative algebra A in C and a left C-tensored infinity-category M, LMod_A(M) is the fibre of the category of LM-algebras at A. Its objects have a coherently unital associative action A⊗M→M. If C and M admit geometric realizations, and both the tensor in C and its action on M preserve them separately in each variable, f:A→B has an extension-of-scalars left adjoint B⊗_A− to restriction. Compute it by the two-sided bar realization. -/
structure LeftTensoredData (C : SymMonData) where
  category : QCat
  action : QFun (productQ (C.fibre 1) category) category
  -- Coherent LM-action axioms are supplied by the definitive packet.
noncomputable def leftModuleObjects (C : SymMonData) (M : LeftTensoredData C)
    (A : Obj (operadicAlgebras assOperad C)) : QCat := by sorry
noncomputable def moduleObjects (C : SymMonData) (A : Obj (commutativeAlgebras C)) : QCat := by sorry
noncomputable def extensionScalars (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) : QFun (moduleObjects C A) (moduleObjects C B) := by sorry
noncomputable def moduleUnit (C : SymMonData) (A : Obj (commutativeAlgebras C)) : Obj (moduleObjects C A) := by sorry
noncomputable def unitAlgebra (C : SymMonData) : Obj (commutativeAlgebras C) := by sorry
noncomputable def moduleObjects.test_unit (C : SymMonData) : HEquiv (moduleObjects C (unitAlgebra C)) (C.fibre 1) := by sorry
example (C : SymMonData) : HEquiv (moduleObjects C (unitAlgebra C)) (C.fibre 1) := by sorry
noncomputable def moduleObjects.test_identity (C : SymMonData) (A : Obj (commutativeAlgebras C)) : onHCat (extensionScalars C (𝟙 A)) ≅ 𝟭 (HCat (moduleObjects C A)) := by sorry
example (C : SymMonData) (A : Obj (commutativeAlgebras C)) : onHCat (extensionScalars C (𝟙 A)) ≅ 𝟭 (HCat (moduleObjects C A)) := by sorry
noncomputable def moduleObjects.test_composition (C : SymMonData) {A B D : Obj (commutativeAlgebras C)} (f : A ⟶ B) (g : B ⟶ D) : onHCat (extensionScalars C f) ⋙ onHCat (extensionScalars C g) ≅ onHCat (extensionScalars C (f ≫ g)) := by sorry
example (C : SymMonData) {A B D : Obj (commutativeAlgebras C)} (f : A ⟶ B) (g : B ⟶ D) : onHCat (extensionScalars C f) ⋙ onHCat (extensionScalars C g) ≅ onHCat (extensionScalars C (f ≫ g)) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/stable-infinity-category
Import E0’s stable infinity-category and its exact/triangulated API. If C is also symmetric monoidal and its tensor is exact separately, the tensor descends to a symmetric monoidal structure on hC compatible with suspension and distinguished cofiber triangles. For derived modules it agrees with Mathlib’s ordinary derived category through E1’s enhancement; constructing the tensor uses K-flat replacements, not closure of K-injectives under tensor. -/
@[instance_reducible]
noncomputable def stableMonoidalComparison (C : SymMonData) : MonoidalCategory (HCat (C.fibre 1)) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/exact-functors
For stable C,D, import E0’s equivalence of finite-limit and finite-colimit preservation. An exact strong or lax monoidal functor then induces the corresponding ordinary monoidal functor on homotopy categories and carries the cofiber triangle of f to that of Ff, with the suspension comparison inherited from E0. Coherent functors are retained before passing to homotopy categories. -/
noncomputable def exactMonoidalFunctors (C D : SymMonData) : QCat := by sorry
noncomputable def exactMonoidalUnderlying (C D : SymMonData)
    (F : Obj (exactMonoidalFunctors C D)) : QFun (C.fibre 1) (D.fibre 1) := by sorry
noncomputable def exactMonoidalTriangle (C D : SymMonData)
    (F : Obj (exactMonoidalFunctors C D)) (x : Obj (C.fibre 1)) :
    (onHCat (exactMonoidalUnderlying C D F)).obj (suspension (C.fibre 1) x) ≅
    suspension (D.fibre 1) ((onHCat (exactMonoidalUnderlying C D F)).obj x) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/idempotent-completion
Idem(C) is the full subcategory of P(C) spanned by retracts of representables. C→Idem(C) is fully faithful; restriction Fun(Idem(C),D)→Fun(C,D) is an equivalence for idempotent-complete D. For small stable C it is stable. A separately exact tensor extends to retracts, giving a symmetric monoidal completion and the corresponding monoidal universal property. For an ordinary category C this agrees with the nerve of its Mathlib Karoubi envelope. -/
noncomputable def idemCompletion (C : QCat) : QCat := by sorry
noncomputable def idemInclusion (C : QCat) : QFun C (idemCompletion C) := by sorry
-- Specialize the universal property to a completed target; do not assert it for any D.
noncomputable def idemRestriction (C D : QCat) :
    HEquiv (funQ (idemCompletion C) (idemCompletion D)) (funQ C (idemCompletion D)) := by sorry
noncomputable def idemCompletion.test_idempotent (C : QCat) : HEquiv (idemCompletion (idemCompletion C)) (idemCompletion C) := by sorry
example (C : QCat) : HEquiv (idemCompletion (idemCompletion C)) (idemCompletion C) := by sorry
noncomputable def idemCompletion.test_ordinary (C : Type) [Category C] : HCat (idemCompletion (nerveQ C)) ≌ CategoryTheory.Idempotents.Karoubi C := by sorry
example (C : Type) [Category C] : HCat (idemCompletion (nerveQ C)) ≌ CategoryTheory.Idempotents.Karoubi C := by sorry
noncomputable def idemCompletion.test_terminal : HEquiv (idemCompletion terminalQ) terminalQ := by sorry
example : HEquiv (idemCompletion terminalQ) terminalQ := by sorry

/- EnhancedDerivedSheaves:E5:abstract/monoidal-envelope
Env(C⊗) has objects finite lists of colours of C; maps are active operadic maps, tensor concatenates lists. Inclusion of C as singleton lists extends lax maps: restriction Fun⊗(Env(C⊗),D) ≃ Fun_lax(C,D). Thus lax functors can be handled by strong functors out of a universal envelope. The envelope of the unit category has one isomorphism class per arity. -/
noncomputable def monoidalEnvelope (C : SymMonData) : SymMonData := by sorry
noncomputable def envelopeSingleton (C : SymMonData) : QFun (C.fibre 1) ((monoidalEnvelope C).fibre 1) := by sorry
noncomputable def envelopeRestriction (C D : SymMonData) : HEquiv (strongMonoidalFunctors (monoidalEnvelope C) D) (laxMonoidalFunctors C D) := by sorry
noncomputable def envelopeArity (C : SymMonData) : Obj ((monoidalEnvelope C).fibre 1) → ℕ := by sorry
noncomputable def monoidalEnvelope.test_arity : Quotient (isIsomorphicSetoid (Obj ((monoidalEnvelope terminalMonoidal).fibre 1))) ≃ ℕ := by sorry
example : Quotient (isIsomorphicSetoid (Obj ((monoidalEnvelope terminalMonoidal).fibre 1))) ≃ ℕ := by sorry
 theorem monoidalEnvelope.test_concat (C : SymMonData) (x y : Obj ((monoidalEnvelope C).fibre 1)) : envelopeArity C ((monoidalEnvelope C).tensor x y) = envelopeArity C x + envelopeArity C y := by sorry
example (C : SymMonData) (x y : Obj ((monoidalEnvelope C).fibre 1)) : envelopeArity C ((monoidalEnvelope C).tensor x y) = envelopeArity C x + envelopeArity C y := by sorry
 theorem monoidalEnvelope.test_empty (C : SymMonData) : envelopeArity C (monoidalEnvelope C).unit = 0 := by sorry
example (C : SymMonData) : envelopeArity C (monoidalEnvelope C).unit = 0 := by sorry

/- EnhancedDerivedSheaves:E5:abstract/monoidal-dwyer-kan-localization
If C⊗ is symmetric monoidal and a class W of underlying morphisms is stable under tensoring with any object in either variable, C[W⁻¹] carries a symmetric monoidal structure. The localization is strong monoidal. Restriction is fully faithful on strong and on lax monoidal functor categories with essential image the functors inverting W. For every base change K→N(Fin_*), the total operadic localization is the corresponding Dwyer–Kan localization. -/
noncomputable def monoidalLocalization (C : SymMonData) (W : Set (Arrow (HCat (C.fibre 1)))) : SymMonData := by sorry
noncomputable def monoidalLocalizationUniversal (C D : SymMonData) (W : Set (Arrow (HCat (C.fibre 1)))) : HEquiv (laxMonoidalFunctors (monoidalLocalization C W) D) (invertingLaxFunctors C D W) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/monoidal-model-category-localization
A symmetric monoidal model category satisfying the pushout-product and unit axioms has a symmetric monoidal infinity-localization. The localization of cofibrant objects computes the derived tensor and is strongly monoidally equivalent to the underlying Dwyer–Kan localization with this derived structure. The map from the category of all objects is lax monoidal and initial among lax monoidal functors inverting weak equivalences. This operadic localization is compatible with base change over Fin_*. If the original unit is not cofibrant, the derived unit is represented by its cofibrant replacement; no strong all-object localization map is asserted. -/
noncomputable def modelMonoidalLocalization (C : SymMonData) : SymMonData := by sorry
noncomputable def modelMonoidalComparison (C : SymMonData) : Obj (laxMonoidalFunctors C (modelMonoidalLocalization C)) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/left-derivable-cocartesian-families
For a cocartesian fibration X→S over a small infinity-category, with vertical marked weak equivalences, call it left derivable when every transition has an absolute left derived functor, described as an absolute right Kan extension along the source localization, and the derived-composition comparisons are equivalences for all 2-simplices. Localizing X fibrewise gives a cocartesian fibration over S, with those derived transitions, compatible with base change by any small infinity-category K→S. The localization preserves original cocartesian lifts over a transition that preserves the marked weak equivalences; this is a sufficient condition, not a necessity assertion. -/
structure DerivedFamilyData where
  base : QCat
  total : QCat
  projection : QFun total base
  localizedFibre : Obj base → QCat
noncomputable def derivedFamily (X : DerivedFamilyData) : QCat := by sorry
noncomputable def pullbackFamily (X : DerivedFamilyData) (T : QCat) (f : QFun T X.base) : DerivedFamilyData := by sorry
noncomputable def pullbackQ {T S X : QCat} (f : QFun T S) (p : QFun X S) : QCat := by sorry
noncomputable def derivedProjection (X : DerivedFamilyData) : QFun (derivedFamily X) X.base := by sorry
noncomputable def derivedFamilyBaseChange (X : DerivedFamilyData) (T : QCat) (f : QFun T X.base) : HEquiv (derivedFamily (pullbackFamily X T f)) (pullbackQ f (derivedProjection X)) := by sorry
noncomputable def pointFamily (C : QCat) : DerivedFamilyData := by sorry
noncomputable def localizedQ (C : QCat) : QCat := by sorry
noncomputable def DerivedFamilyData.test_point (C : QCat) : HEquiv (derivedFamily (pointFamily C)) (localizedQ C) := by sorry
example (C : QCat) : HEquiv (derivedFamily (pointFamily C)) (localizedQ C) := by sorry
noncomputable def intervalDerivedTransition (X : DerivedFamilyData) {x y : Obj X.base} (f : x ⟶ y) : QFun (X.localizedFibre x) (X.localizedFibre y) := by sorry
noncomputable def localizedFamilyTransition (X : DerivedFamilyData) {x y : Obj X.base} (f : x ⟶ y) : QFun (X.localizedFibre x) (X.localizedFibre y) := by sorry
noncomputable def DerivedFamilyData.test_interval (X : DerivedFamilyData) {x y : Obj X.base} (f : x ⟶ y) : onHCat (localizedFamilyTransition X f) ≅ onHCat (intervalDerivedTransition X f) := by sorry
example (X : DerivedFamilyData) {x y : Obj X.base} (f : x ⟶ y) : onHCat (localizedFamilyTransition X f) ≅ onHCat (intervalDerivedTransition X f) := by sorry
noncomputable def identityMarkedFamily (C : QCat) : DerivedFamilyData := by sorry
noncomputable def DerivedFamilyData.test_identity (C : QCat) : HEquiv (derivedFamily (identityMarkedFamily C)) C := by sorry
example (C : QCat) : HEquiv (derivedFamily (identityMarkedFamily C)) C := by sorry

/- EnhancedDerivedSheaves:E5:abstract/stable-tensor-ideals
A stable subcategory D⊆C is a full subcategory closed under zero objects, fibers and cofibers; it need not be closed under retracts. In a stable monoidal C with separately exact tensor, it is a tensor ideal if X⊗Y lies in D whenever X lies in C and Y lies in D. The thick tensor ideal adds closure under retracts. For commutative A→B, the thick tensor ideal generated by B is taken in Mod_A(C), not in C unless A is the unit. -/
-- E0 supplies these stable operations; their universal properties are omitted.
noncomputable def loopObj (C : QCat) (x : Obj C) : Obj C := by sorry
noncomputable def cofiberObj (C : QCat) {x y : Obj C} (f : x ⟶ y) : Obj C := by sorry
inductive StableMember (C : QCat) (s : Set (Obj C)) : Obj C → Prop
  | generator {x} : x ∈ s → StableMember C s x
  | zero : StableMember C s (zeroObj C)
  | iso {x y} : StableMember C s x → (x ≅ y) → StableMember C s y
  | suspend {x} : StableMember C s x → StableMember C s (suspension C x)
  | loop {x} : StableMember C s x → StableMember C s (loopObj C x)
  | cofiber {x y} (f : x ⟶ y) : StableMember C s x → StableMember C s y →
      StableMember C s (cofiberObj C f)
def stableClosure (C : QCat) (s : Set (Obj C)) : Set (Obj C) := {x | StableMember C s x}
inductive ThickTensorMember (C : SymMonData) (s : Set (Obj (C.fibre 1))) : Obj (C.fibre 1) → Prop
  | generator {x} : x ∈ s → ThickTensorMember C s x
  | zero : ThickTensorMember C s (zeroObj (C.fibre 1))
  | iso {x y} : ThickTensorMember C s x → (x ≅ y) → ThickTensorMember C s y
  | suspend {x} : ThickTensorMember C s x → ThickTensorMember C s (suspension (C.fibre 1) x)
  | loop {x} : ThickTensorMember C s x → ThickTensorMember C s (loopObj (C.fibre 1) x)
  | cofiber {x y} (f : x ⟶ y) : ThickTensorMember C s x → ThickTensorMember C s y →
      ThickTensorMember C s (cofiberObj (C.fibre 1) f)
  | retract {x y} (i : x ⟶ y) (r : y ⟶ x) : i ≫ r = 𝟙 x →
      ThickTensorMember C s y → ThickTensorMember C s x
  | tensorLeft (x) {y} : ThickTensorMember C s y → ThickTensorMember C s (C.tensor x y)
  | tensorRight {x} (y) : ThickTensorMember C s x → ThickTensorMember C s (C.tensor x y)
def thickTensorClosure (C : SymMonData) (s : Set (Obj (C.fibre 1))) : Set (Obj (C.fibre 1)) :=
  {x | ThickTensorMember C s x}
def ThickTensorClosed (C : SymMonData) (t : Set (Obj (C.fibre 1))) : Prop :=
  zeroObj (C.fibre 1) ∈ t ∧
  (∀ x y, x ∈ t → Nonempty (x ≅ y) → y ∈ t) ∧
  (∀ x, x ∈ t → suspension (C.fibre 1) x ∈ t) ∧
  (∀ x, x ∈ t → loopObj (C.fibre 1) x ∈ t) ∧
  (∀ x y (f : x ⟶ y), x ∈ t → y ∈ t → cofiberObj (C.fibre 1) f ∈ t) ∧
  (∀ x y (i : x ⟶ y) (r : y ⟶ x), i ≫ r = 𝟙 x → y ∈ t → x ∈ t) ∧
  (∀ x y, y ∈ t → C.tensor x y ∈ t) ∧
  (∀ x y, x ∈ t → C.tensor x y ∈ t)
theorem tensorIdealInduction (C : SymMonData) (s t : Set (Obj (C.fibre 1)))
    (h : s ⊆ t) (closed : ThickTensorClosed C t) : thickTensorClosure C s ⊆ t := by sorry
 theorem stableClosure.test_zero (C : SymMonData) : thickTensorClosure C {zeroObj (C.fibre 1)} = {x | Nonempty (x ≅ zeroObj (C.fibre 1))} := by sorry
example (C : SymMonData) : thickTensorClosure C {zeroObj (C.fibre 1)} = {x | Nonempty (x ≅ zeroObj (C.fibre 1))} := by sorry
 theorem stableClosure.test_unit (C : SymMonData) : thickTensorClosure C {C.unit} = Set.univ := by sorry
example (C : SymMonData) : thickTensorClosure C {C.unit} = Set.univ := by sorry
 theorem stableClosure.test_retract (C : SymMonData) (x y : Obj (C.fibre 1)) (i : x ⟶ y) (r : y ⟶ x) (h : i ≫ r = 𝟙 x) : x ∈ thickTensorClosure C {y} := by sorry
example (C : SymMonData) (x y : Obj (C.fibre 1)) (i : x ⟶ y) (r : y ⟶ x) (h : i ≫ r = 𝟙 x) : x ∈ thickTensorClosure C {y} := by sorry

/- EnhancedDerivedSheaves:E5:abstract/verdier-quotient
For small stable C and full stable D⊆C, C/D is the Dwyer–Kan localization at maps with cofiber in D. It is stable and universal for exact functors C→E annihilating D. For X,Y∈C its mapping space is the filtered colimit over maps Z→Y with Z∈D of Map_C(X,cofib(Z→Y)). The kernel on objects is the retract closure of D, rather than D itself when D is not thick. If D is a tensor ideal and tensor is separately exact, the quotient is symmetric monoidal with the analogous universal property for exact lax monoidal functors. -/
noncomputable def verdierQuotient (C : QCat) (D : Set (Obj C)) : QCat := by sorry
noncomputable def verdierProjection (C : QCat) (D : Set (Obj C)) : QFun C (verdierQuotient C D) := by sorry
noncomputable def annihilatingFunctors (C E : QCat) (D : Set (Obj C)) : QCat := by sorry
noncomputable def verdierRestriction (C E : QCat) (D : Set (Obj C)) : HEquiv (exactFunQ (verdierQuotient C D) E) (annihilatingFunctors C E D) := by sorry
noncomputable def cofiberMappingApproximation (C : QCat) (D : Set (Obj C)) (x y : Obj C) : QCat := by sorry
noncomputable def verdierMapping (C : QCat) (D : Set (Obj C)) (x y : Obj C) : HEquiv (mappingQ (verdierQuotient C D) ((onHCat (verdierProjection C D)).obj x) ((onHCat (verdierProjection C D)).obj y)) (cofiberMappingApproximation C D x y) := by sorry
noncomputable def verdierQuotient.test_zero (C : QCat) : HEquiv (verdierQuotient C {zeroObj C}) C := by sorry
example (C : QCat) : HEquiv (verdierQuotient C {zeroObj C}) C := by sorry
noncomputable def verdierQuotient.test_all (C : QCat) : HEquiv (verdierQuotient C Set.univ) terminalQ := by sorry
example (C : QCat) : HEquiv (verdierQuotient C Set.univ) terminalQ := by sorry
noncomputable def verdierQuotient.test_suspension (C : QCat) (D : Set (Obj C)) (x : Obj C) : (onHCat (verdierProjection C D)).obj (suspension C x) ≅ suspension (verdierQuotient C D) ((onHCat (verdierProjection C D)).obj x) := by sorry
example (C : QCat) (D : Set (Obj C)) (x : Obj C) : (onHCat (verdierProjection C D)).obj (suspension C x) ≅ suspension (verdierQuotient C D) ((onHCat (verdierProjection C D)).obj x) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie
For F:C⇄D:G with unit and counit, let T=GF be the coherent monad on C. The comparison D→LMod_T(C) is an equivalence precisely when G is conservative and D admits geometric realizations of G-split simplicial objects which G preserves. Split refers to the augmented simplicial diagram after applying G. The algebra comparison preserves the forgetful functor to C. -/
noncomputable def monadModules (C : QCat) (T : QFun C C) : QCat := by sorry
-- Coherent monad multiplication/unit and preservation of G-split realizations
-- are unavailable and explicitly omitted. The ordinary adjunction and
-- conservativity shadow can already be stated against Mathlib.
noncomputable def barrBeckLurie (C D : QCat) (F : QFun C D) (G : QFun D C)
    (adj : onHCat F ⊣ onHCat G) [(onHCat G).ReflectsIsomorphisms] :
    HEquiv D (monadModules C (F ≫ G)) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/descendable-algebras
In a presentable stable symmetric monoidal C whose tensor preserves colimits separately, A→B is descendable when A belongs to the thick tensor ideal generated by B in Mod_A(C). Write I=fib(A→B). It has index at most m when the natural map I^⊗_A m→A is nullhomotopic. Descendability is equivalent to such a finite m and to the augmented Amitsur totalization tower being pro-isomorphic to the constant A tower. Its definition uses finite thick generation, not merely recovery of the completed unit by the infinite totalization. -/
noncomputable def relativeMonoidal (C : SymMonData) (A : Obj (commutativeAlgebras C)) : SymMonData := by sorry
noncomputable def underlyingModule (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) : Obj ((relativeMonoidal C A).fibre 1) := by sorry
 def descendable (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) : Prop :=
  (relativeMonoidal C A).unit ∈ thickTensorClosure (relativeMonoidal C A) {underlyingModule C f}
noncomputable def augmentationPower (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (m : ℕ) : Arrow (HCat ((relativeMonoidal C A).fibre 1)) := by sorry
 def descendabilityIndex (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (m : ℕ) : Prop :=
  (augmentationPower C f m).hom = zeroHom _ _
noncomputable def amitsurTower (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) : ℕᵒᵖ ⥤ HCat ((relativeMonoidal C A).fibre 1) := by sorry
 theorem descendable.test_identity (C : SymMonData) (A : Obj (commutativeAlgebras C)) : descendabilityIndex C (𝟙 A) 1 := by sorry
example (C : SymMonData) (A : Obj (commutativeAlgebras C)) : descendabilityIndex C (𝟙 A) 1 := by sorry
noncomputable def descendable.test_zero_index (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (h : descendabilityIndex C f 0) : (relativeMonoidal C A).unit ≅ zeroObj ((relativeMonoidal C A).fibre 1) := by sorry
example (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (h : descendabilityIndex C f 0) : (relativeMonoidal C A).unit ≅ zeroObj ((relativeMonoidal C A).fibre 1) := by sorry
noncomputable def pAdicMod (p : ℕ) : SymMonData := by sorry
noncomputable def pAdicReduction (p : ℕ) : Arrow (HCat (commutativeAlgebras (pAdicMod p))) := by sorry
 theorem descendable.test_completion (p : ℕ) [Fact p.Prime] : ¬ descendable (pAdicMod p) (pAdicReduction p).hom := by sorry
example (p : ℕ) [Fact p.Prime] : ¬ descendable (pAdicMod p) (pAdicReduction p).hom := by sorry

/- EnhancedDerivedSheaves:E5:abstract/module-descent-and-functoriality
For descendable A→B, Mod_A(C) → lim_[n] Mod_(B^⊗_A(n+1))(C) is a symmetric monoidal equivalence along extension-of-scalars transitions. Descendability is preserved by composition, by passage to an intermediate algebra, and by exact strong monoidal functors. Cocontinuous lax monoidal functors preserve a specified finite index after applying their algebra and module structure maps. For a finite simplicial diagram of presentably stable symmetric monoidal categories, a commutative algebra in its limit is descendable if and only if its evaluations at every vertex are descendable. Extension of scalars along a descendable map is conservative. -/
noncomputable def amitsurModuleLimit (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) : QCat := by sorry
noncomputable def moduleDescent (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (h : descendable C f) : HEquiv (moduleObjects C A) (amitsurModuleLimit C f) := by sorry
 theorem descendableComposition (C : SymMonData) {A B D : Obj (commutativeAlgebras C)} (f : A ⟶ B) (g : B ⟶ D) (hf : descendable C f) (hg : descendable C g) : descendable C (f ≫ g) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/uniform-index-colimits
Fix a presentably stable symmetric monoidal category C and A∈CAlg(C), with tensor preserving colimits separately. Let I be a small filtered ordinary category such that derived inverse limits of Iᵒᵖ-diagrams of spectra have finite cohomological dimension. A coherent diagram of A-algebras B_i with every A→B_i of descendability index at most the same m has descendable colimit map A→colim_i B_i. For I=ℕ, index at most 2m suffices. Without a uniform bound this can fail. For ordinary rings, nilpotent ideal quotients are descendable, while a locally nilpotent ideal quotient need not be. A faithfully flat map with countably presented target algebra is descendable. If its source is Noetherian Gorenstein of Krull dimension d, a faithfully flat target has index at most d+1. -/
noncomputable def colimitAlgebraArrow (C : SymMonData) (A : Obj (commutativeAlgebras C))
    (F : ℕ ⥤ Under A) : Under A := by sorry
theorem uniformIndexSequential (C : SymMonData) (A : Obj (commutativeAlgebras C))
    (m : ℕ) (F : ℕ ⥤ Under A) (h : ∀ n, descendabilityIndex C (F.obj n).hom m) :
    descendabilityIndex C (colimitAlgebraArrow C A F).hom (2 * m) := by sorry

/- EnhancedDerivedSheaves:E5:abstract/formal-tensor-inversion
For presentably symmetric monoidal C and X∈C, C[X⁻¹] is initial among presentably symmetric monoidal categories receiving a colimit-preserving strong monoidal functor from C in which X becomes tensor invertible. For a presentable C-module M its base change M⊗_C C[X⁻¹] is the universal inversion of X on M. If the cyclic permutation of X⊗X⊗X is homotopic to the identity, its underlying presentable category is the colimit in PrL of the telescope M→M→⋯ with transition X⊗−. Without this symmetric-object hypothesis the telescope formula is not asserted. -/
noncomputable def tensorInversion (C : SymMonData) (x : Obj (C.fibre 1)) : SymMonData := by sorry
noncomputable def tensorInversionMap (C : SymMonData) (x : Obj (C.fibre 1)) : QFun (C.fibre 1) ((tensorInversion C x).fibre 1) := by sorry
noncomputable def invertingStrongFunctors (C D : SymMonData) (x : Obj (C.fibre 1)) : QCat := by sorry
noncomputable def strongColimitMonoidalFunctors (C D : SymMonData) : QCat := by sorry
-- invertingStrongFunctors imposes both inversion and colimit preservation.
noncomputable def tensorInversionUniversal (C D : SymMonData) (x : Obj (C.fibre 1)) :
    HEquiv (strongColimitMonoidalFunctors (tensorInversion C x) D) (invertingStrongFunctors C D x) := by sorry
noncomputable def tensorInversion.test_unit (C : SymMonData) : HEquiv ((tensorInversion C C.unit).fibre 1) (C.fibre 1) := by sorry
example (C : SymMonData) : HEquiv ((tensorInversion C C.unit).fibre 1) (C.fibre 1) := by sorry
noncomputable def tensorInversion.test_zero (C : SymMonData) : HEquiv ((tensorInversion C (zeroObj (C.fibre 1))).fibre 1) terminalQ := by sorry
example (C : SymMonData) : HEquiv ((tensorInversion C (zeroObj (C.fibre 1))).fibre 1) terminalQ := by sorry
noncomputable def tensorInversion.test_idempotent (C : SymMonData) (x : Obj (C.fibre 1)) : HEquiv ((tensorInversion (tensorInversion C x) ((onHCat (tensorInversionMap C x)).obj x)).fibre 1) ((tensorInversion C x).fibre 1) := by sorry
example (C : SymMonData) (x : Obj (C.fibre 1)) : HEquiv ((tensorInversion (tensorInversion C x) ((onHCat (tensorInversionMap C x)).obj x)).fibre 1) ((tensorInversion C x).fibre 1) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/compact-objects
For regular κ, an object x of C is κ-compact if Map_C(x,−) preserves κ-filtered colimits. Compact means ω-compact. Write C^κ for the full subcategory. In a presentable stable C, compact generation means a small set of compact objects whose shifts detect zero. Finite colimits and retracts of compact objects are compact. Compactness is a mapping-space condition, not merely finite generation of the cohomology groups. -/
noncomputable def compactObjects (C : QCat) : QCat := by sorry
noncomputable def compactInclusion (C : QCat) : QFun (compactObjects C) C := by sorry
noncomputable def colimitMappingQ (C : QCat) (x : Obj (compactObjects C))
    (I : Type) [Category.{0} I] [IsFiltered I] (F : QFun (nerveQ I) C) : QCat := by sorry
noncomputable def compactMappingComparison (C : QCat) (x : Obj (compactObjects C))
    (I : Type) [Category.{0} I] [IsFiltered I] (F : QFun (nerveQ I) C) :
    HEquiv (mappingQ C ((onHCat (compactInclusion C)).obj x) (colimitObj F))
      (colimitMappingQ C x I F) := by sorry
noncomputable def compactRetract (C : QCat) (x : Obj (compactObjects C)) (y : Obj C)
    (i : y ⟶ (onHCat (compactInclusion C)).obj x) (r : (onHCat (compactInclusion C)).obj x ⟶ y)
    (h : i ≫ r = 𝟙 y) : { z : Obj (compactObjects C) // Nonempty ((onHCat (compactInclusion C)).obj z ≅ y) } := by sorry
noncomputable def compactObjects.test_zero (C : QCat) : { x : Obj (compactObjects C) // Nonempty ((onHCat (compactInclusion C)).obj x ≅ zeroObj C) } := by sorry
example (C : QCat) : { x : Obj (compactObjects C) // Nonempty ((onHCat (compactInclusion C)).obj x ≅ zeroObj C) } := by sorry
noncomputable def ordinaryDerivedModules (R : CommRingCat) : QCat := by sorry
noncomputable def freeModule (R : CommRingCat) : Obj (ordinaryDerivedModules R) := by sorry
noncomputable def compactObjects.test_ring (R : CommRingCat) : { x : Obj (compactObjects (ordinaryDerivedModules R)) // Nonempty ((onHCat (compactInclusion _)).obj x ≅ freeModule R) } := by sorry
example (R : CommRingCat) : { x : Obj (compactObjects (ordinaryDerivedModules R)) // Nonempty ((onHCat (compactInclusion _)).obj x ≅ freeModule R) } := by sorry
noncomputable def rationalCountableSum : Obj (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry
 theorem compactObjects.test_infinite_sum : ¬ ∃ x : Obj (compactObjects (ordinaryDerivedModules (CommRingCat.of ℚ))), Nonempty ((onHCat (compactInclusion _)).obj x ≅ rationalCountableSum) := by sorry
example : ¬ ∃ x : Obj (compactObjects (ordinaryDerivedModules (CommRingCat.of ℚ))), Nonempty ((onHCat (compactInclusion _)).obj x ≅ rationalCountableSum) := by sorry

noncomputable def rationalFiniteFree (n : ℕ) : Obj (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/ind-completion
Ind_κ(C) is the full subcategory of P(C)=Fun(Cop,Spaces) spanned by κ-filtered colimits of representables. Yoneda lands in it and is fully faithful; the representables are κ-compact, and every object has a κ-filtered presentation. For a small idempotent-complete C with finite colimits, Ind(C) is compactly generated and its compact objects recover C. On ordinary C the 0-truncated presheaf part compares with Mathlib’s set-valued Ind(C); it is not an unconditional equivalence with the full space-valued completion. -/
noncomputable def indCompletion (C : QCat) : QCat := by sorry
noncomputable def indYoneda (C : QCat) : QFun C (indCompletion C) := by sorry
noncomputable def indCompactComparison (C : QCat) : HEquiv (compactObjects (indCompletion C)) (idemCompletion C) := by sorry
noncomputable def indCompletion.test_terminal : HEquiv (indCompletion terminalQ) terminalQ := by sorry
example : HEquiv (indCompletion terminalQ) terminalQ := by sorry
noncomputable def indCompletion.test_compacts (C : QCat) : HEquiv (compactObjects (indCompletion (idemCompletion C))) (idemCompletion C) := by sorry
example (C : QCat) : HEquiv (compactObjects (indCompletion (idemCompletion C))) (idemCompletion C) := by sorry
noncomputable def indCompletion.test_discrete (A : Type) : HEquiv (indCompletion (discreteQ A)) (discreteQ A) := by sorry
example (A : Type) : HEquiv (indCompletion (discreteQ A)) (discreteQ A) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind
For small C and D admitting κ-filtered colimits, restriction along Yoneda gives Fun_κ(Ind_κ(C),D) ≃ Fun(C,D). The extension sends a filtered presentation colim_i y(c_i) to colim_i F(c_i), independently of the presentation. For κ=ω, if C has finite colimits, D is presentable and F preserves finite colimits, its Ind extension preserves all small colimits. For larger κ, the corresponding criterion requires κ-small colimits and their preservation, rather than finite colimits alone. The extension is an equivalence exactly when the input is fully faithful, its objects are κ-compact in D, and they κ-filtered-generate D. -/
noncomputable def indRestriction (C D : QCat) : HEquiv (filteredFunQ (indCompletion C) D) (funQ C D) := by sorry
noncomputable def indExtend {C D : QCat} (F : QFun C D) : QFun (indCompletion C) D := by sorry

/- EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable
For small stable C, Ind_κ(C) is stable and Yoneda is exact. For small symmetric monoidal C, Ind(C) has a symmetric monoidal structure whose tensor preserves filtered colimits separately and extends C’s tensor. If C is stable and tensor exact separately, this tensor preserves all colimits separately. Exact strong monoidal functors on C extend to colimit-preserving strong monoidal functors on Ind(C); uniqueness includes their coherent monoidal structure. -/
noncomputable def indMonoidal (C : SymMonData) : SymMonData := by sorry
noncomputable def indMonoidalUnderlying (C : SymMonData) : HEquiv ((indMonoidal C).fibre 1) (indCompletion (C.fibre 1)) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/presentable-categories
C is presentable when it is accessible and admits all small colimits. Equivalently it is an accessible reflective localization of a presheaf infinity-category. PrL has these objects and colimit-preserving functors; PrR uses accessible right adjoints. Accessibility entails a regular cardinal and an essentially small subcategory of compact objects generating by that cardinal’s filtered colimits. Presentability alone does not assert compact generation at ω. -/
structure PresentableData where
  category : QCat
  accessibilityCardinal : Cardinal.{1}
  generators : QCat
  inclusion : QFun generators category
noncomputable def presentableLeftFunctors (C D : PresentableData) : QCat := by sorry
noncomputable def presentableRightFunctors (C D : PresentableData) : QCat := by sorry
noncomputable def PresentableData.test_modules (R : CommRingCat) : { C : PresentableData // C.category = ordinaryDerivedModules R } := by sorry
example (R : CommRingCat) : { C : PresentableData // C.category = ordinaryDerivedModules R } := by sorry
noncomputable def PresentableData.test_terminal : { C : PresentableData // C.category = terminalQ } := by sorry
example : { C : PresentableData // C.category = terminalQ } := by sorry
noncomputable def continuousPresheafQ (C : QCat) : QCat := by sorry
noncomputable def representedPresheaf (C : QCat) (x : Obj C) : Obj (continuousPresheafQ C) := by sorry
noncomputable def PresentableData.test_representability (C : PresentableData) (P : Obj (continuousPresheafQ C.category)) : { x : Obj C.category // Nonempty (representedPresheaf C.category x ≅ P) } := by sorry
example (C : PresentableData) (P : Obj (continuousPresheafQ C.category)) : { x : Obj C.category // Nonempty (representedPresheaf C.category x ≅ P) } := by sorry

/- EnhancedDerivedSheaves:E5:presentability/limits-of-presentable-categories
Every small diagram of presentable categories and colimit-preserving functors has a limit in PrL, and its underlying category is the limit in Cat∞. Colimits in that limit are detected and computed by the projections. In particular pullbacks of presentable colimit-preserving functors are presentable. The limit remains stable when the diagram categories are stable. This does not imply that an unrelated forgetful functor from a completed subcategory preserves colimits. -/
structure CategoryDiagramData (I : QCat) where
  fibre : Obj I → QCat
  transition : ∀ {i j : Obj I}, (i ⟶ j) → QFun (fibre i) (fibre j)
-- Coherent composition, preservation of colimits and presentability hypotheses are omitted.
noncomputable def presentableLimit (I : QCat) (F : CategoryDiagramData I) : QCat := by sorry
noncomputable def presentableLimitProjection (I : QCat) (F : CategoryDiagramData I) (i : Obj I) : QFun (presentableLimit I F) (F.fibre i) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change
For presentable C,D, C⊗D represents functors C×D→E preserving colimits separately: FunL(C⊗D,E) ≃ FunL,L(C×D,E). PrL is symmetric monoidal with unit Spaces; its stable subcategory has unit the abstract stabilization Sp, with no concrete spectral model required. For presentably monoidal C, a presentable right C-module M and algebra A∈C, M⊗_C RMod_A(C) ≃ RMod_A(M). Extension of scalars and these comparisons are coherent for compositions and units. -/
noncomputable def presentableTensor (C D : QCat) : QCat := by sorry
noncomputable def bifunLQ (C D E : QCat) : QCat := by sorry
noncomputable def presentableTensorUniversal (C D E : QCat) : HEquiv (colimitFunQ (presentableTensor C D) E) (bifunLQ C D E) := by sorry
structure RightTensoredData (C : SymMonData) where
  category : QCat
  action : QFun (productQ category (C.fibre 1)) category
  -- Coherent right-action and colimit-preservation axioms are omitted.
noncomputable def relativeCategoryTensor (C : SymMonData) (M : RightTensoredData C)
    (A : Obj (operadicAlgebras assOperad C)) : QCat := by sorry
noncomputable def modulesInTensored (C : SymMonData) (M : RightTensoredData C)
    (A : Obj (operadicAlgebras assOperad C)) : QCat := by sorry
noncomputable def categoricalModuleBaseChange (C : SymMonData) (M : RightTensoredData C)
    (A : Obj (operadicAlgebras assOperad C)) :
    HEquiv (relativeCategoryTensor C M A) (modulesInTensored C M A) := by sorry
noncomputable def presentableTensor.test_spaces (C : QCat) : HEquiv (presentableTensor spacesQ C) C := by sorry
example (C : QCat) : HEquiv (presentableTensor spacesQ C) C := by sorry
noncomputable def presentableTensor.test_stable_unit (C : QCat) : HEquiv (presentableTensor abstractSp C) C := by sorry
example (C : QCat) : HEquiv (presentableTensor abstractSp C) C := by sorry
noncomputable def presentableTensor.test_zero (C : QCat) : HEquiv (presentableTensor terminalQ C) terminalQ := by sorry
example (C : QCat) : HEquiv (presentableTensor terminalQ C) terminalQ := by sorry

/- EnhancedDerivedSheaves:E5:presentability/ind-verdier-localization
For small stable C and full stable D, Ind(C)→Ind(C/D) is a localization with kernel Ind(D), interpreted by its fully faithful extension. Its right adjoint is fully faithful and preserves colimits; the right adjoint extends the quotient-Yoneda approximation C/D→Ind(C). The monoidal version exists for separately exact tensors and tensor ideals. Compact objects of the target are Idem(C/D), not C/D without an idempotent-completeness hypothesis. -/
noncomputable def indVerdierLocalization (C : QCat) (D : Set (Obj C)) : QFun (indCompletion C) (indCompletion (verdierQuotient C D)) := by sorry
noncomputable def indVerdierRightAdjoint (C : QCat) (D : Set (Obj C)) : QFun (indCompletion (verdierQuotient C D)) (indCompletion C) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/neeman-compactness-criterion
For F:C⇄D:G between presentable stable categories, if C is compactly generated then F preserves compact objects if and only if G preserves coproducts, equivalently all colimits. The forward direction tests the coproduct comparison against compact generators of C; the reverse uses the mapping-space adjunction. The general κ-accessible version replaces compact/coproduct preservation by κ-compact/κ-filtered preservation with the accessibility hypotheses of HTT 5.5.7.2. -/
noncomputable def compactFunctorRestriction (C D : QCat) (F : QFun C D) : QFun (compactObjects C) (compactObjects D) := by sorry
noncomputable def rightAdjointCoproductComparison (C D : QCat) (G : QFun D C) (s : ℕ → Obj D) : (onHCat G).obj (countableSum D s) ≅ countableSum C (fun n => (onHCat G).obj (s n)) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/coherent-group-actions
For a finite group G, an action on C is a coherent functor BG→Cat∞, equivalently a cocartesian fibration over BG. Its homotopy fixed point category is its limit; for two actions, equivariant functors are the homotopy fixed points of Fun(C,D) under conjugation. Presentable stable actions by equivalences have presentable stable fixed point categories. For a profinite G, categorical actions factoring through a specified finite quotient are pulled back coherently from that quotient. The continuous coefficient specialization uses the E1 enhancement of discrete continuous G-modules: derived invariants agree with the canonical continuous-cochain object and, in degree n, the ProfiniteCohomology finite-quotient system colim_U Hⁿ(G/U,M^U). No filtered-colimit formula for arbitrary categorical homotopy fixed points is asserted. -/
structure CoherentActionData where
  base : QCat
  family : DerivedFamilyData
noncomputable def homotopyFixedPoints (A : CoherentActionData) : QCat := by sorry
noncomputable def equivariantFunctors (A B : CoherentActionData) : QCat := by sorry
noncomputable def continuousModuleComplexes (G : Type) [Group G] [TopologicalSpace G] (R : CommRingCat) : QCat := by sorry
noncomputable def continuousDerivedInvariants (G : Type) [Group G] [TopologicalSpace G]
    (R : CommRingCat) (M : Obj (continuousModuleComplexes G R)) : Obj (ordinaryDerivedModules R) := by sorry
noncomputable def trivialAction (G C : QCat) : CoherentActionData := by sorry
noncomputable def CoherentActionData.test_trivial_group (C : QCat) : HEquiv (homotopyFixedPoints (trivialAction terminalQ C)) C := by sorry
example (C : QCat) : HEquiv (homotopyFixedPoints (trivialAction terminalQ C)) C := by sorry
noncomputable def CoherentActionData.test_trivial_action (BG C : QCat) : HEquiv (homotopyFixedPoints (trivialAction BG C)) (funQ BG C) := by sorry
example (BG C : QCat) : HEquiv (homotopyFixedPoints (trivialAction BG C)) (funQ BG C) := by sorry
noncomputable def finiteGroupDerivedInvariants (G : Type) [Group G] [Fintype G]
    [TopologicalSpace G] [DiscreteTopology G] (R : CommRingCat)
    (M : Obj (continuousModuleComplexes G R)) : Obj (ordinaryDerivedModules R) := by sorry
noncomputable def CoherentActionData.test_finite_coefficients (G : Type) [Group G] [Fintype G]
    [TopologicalSpace G] [DiscreteTopology G] (R : CommRingCat) (M : Obj (continuousModuleComplexes G R)) :
    continuousDerivedInvariants G R M ≅ finiteGroupDerivedInvariants G R M := by sorry
example (G : Type) [Group G] [Fintype G] [TopologicalSpace G] [DiscreteTopology G]
    (R : CommRingCat) (M : Obj (continuousModuleComplexes G R)) :
    continuousDerivedInvariants G R M ≅ finiteGroupDerivedInvariants G R M := by sorry

/- EnhancedDerivedSheaves:E5:presentability/compact-morphisms
A weakly compact map f:x→y factors through some stage whenever y maps into a filtered colimit. A compact map has the coherent lifting property for the square obtained by precomposition with f between colim_i Map(y,z_i)→Map(y,colim z_i) and colim_i Map(x,z_i)→Map(x,colim z_i). A strongly compact map has its representable transformation factoring through a filtered-colimit-preserving functor. A compact exhaustion is a sequential presentation x≃colim x_n with compact transition maps. In compactly assembled categories these three notions agree; outside this hypothesis they are kept distinct. -/
noncomputable def compactMorphismSquare (C : QCat) {x y : Obj C} (f : x ⟶ y) (I : QCat) (F : QFun I C) : MappingSquareData := by sorry
noncomputable def compactExhaustion (C : QCat) (x : Obj C) : ℕ ⥤ HCat C := by sorry
 theorem compactIdentityComparison (C : QCat) (x : Obj C) : Arrow.mk (𝟙 x) ∈ compactMaps C ↔ ∃ y : Obj (compactObjects C), Nonempty ((onHCat (compactInclusion C)).obj y ≅ x) := by sorry
 theorem compactMorphismSquare.test_zero (C : QCat) (x y : Obj C) : Arrow.mk (zeroHom x y) ∈ compactMaps C := by sorry
example (C : QCat) (x y : Obj C) : Arrow.mk (zeroHom x y) ∈ compactMaps C := by sorry
 theorem compactMorphismSquare.test_identity : Arrow.mk (𝟙 rationalCountableSum) ∉ compactMaps (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry
example : Arrow.mk (𝟙 rationalCountableSum) ∉ compactMaps (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry
 theorem compactMorphismSquare.test_finite_rank (x y : Obj (ordinaryDerivedModules (CommRingCat.of ℚ))) (n : ℕ) (i : x ⟶ rationalFiniteFree n) (r : rationalFiniteFree n ⟶ y) : Arrow.mk (i ≫ r) ∈ compactMaps (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry
example (x y : Obj (ordinaryDerivedModules (CommRingCat.of ℚ))) (n : ℕ) (i : x ⟶ rationalFiniteFree n) (r : rationalFiniteFree n ⟶ y) : Arrow.mk (i ≫ r) ∈ compactMaps (ordinaryDerivedModules (CommRingCat.of ℚ)) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories
A presentable stable C is dualizable in PrL_st if it admits a dual, evaluation and coevaluation with triangle homotopies. Equivalently C is a retract, through colimit-preserving functors, of a compactly generated stable category. Equivalently its large-universe colimit functor Ind(C)→C has a left adjoint. In the compactly assembled description filtered colimits commute with finite limits, and objects admitting compact exhaustions generate under filtered colimits. No compact-generation assumption on C is imposed. -/
structure DualPairData where
  category : QCat
  dual : QCat
  evaluation : QFun (presentableTensor dual category) abstractSp
  coevaluation : QFun abstractSp (presentableTensor category dual)
noncomputable def dualizableRetractComparison (C : DualPairData) : QCat := by sorry
noncomputable def assemblyLeftAdjoint (C : DualPairData) : QFun C.category (indCompletion C.category) := by sorry
noncomputable def DualPairData.test_modules (R : CommRingCat) : { D : DualPairData // D.category = ordinaryDerivedModules R } := by sorry
example (R : CommRingCat) : { D : DualPairData // D.category = ordinaryDerivedModules R } := by sorry
noncomputable def DualPairData.test_zero : { D : DualPairData // D.category = terminalQ } := by sorry
example : { D : DualPairData // D.category = terminalQ } := by sorry
-- Specialize retract closure to an already dualizable target. Coherent
-- colimit-preserving retraction, rather than only this h-category equation,
-- is still required by the definitive packet.
noncomputable def DualPairData.test_retract (C : QCat) (D : DualPairData)
    (i : QFun C D.category) (r : QFun D.category C)
    (h : onHCat (i ≫ r) ≅ 𝟭 (HCat C)) : { d : DualPairData // d.category = C } := by sorry
example (C : QCat) (D : DualPairData) (i : QFun C D.category) (r : QFun D.category C)
    (h : onHCat (i ≫ r) ≅ 𝟭 (HCat C)) : { d : DualPairData // d.category = C } := by sorry

/- EnhancedDerivedSheaves:E5:presentability/strongly-continuous-filtered-colimits
A left adjoint is strongly continuous when its right adjoint also preserves colimits. A filtered diagram of dualizable stable presentable categories with strongly continuous transitions has dualizable colimit in PrL_st. The canonical comparison from the colimit of their compact subcategories to the compact subcategory of the result is an equivalence, with colimits of small stable categories taken in the idempotent-complete convention. The result does not assert that any input or the colimit is compactly generated. -/
-- The name of this data structure records the intended transition subcategory;
-- coherent right adjoints and their colimit preservation remain omitted.
structure StronglyContinuousDiagramData (I : Type) [Category.{0} I] [IsFiltered I] where
  diagram : CategoryDiagramData (nerveQ I)
  dualPairs : Obj (nerveQ I) → DualPairData
  fibre_eq : ∀ i, (dualPairs i).category = diagram.fibre i
noncomputable def stronglyContinuousColimitDual (I : Type) [Category.{0} I] [IsFiltered I]
    (F : StronglyContinuousDiagramData I) : DualPairData := by sorry
noncomputable def filteredCompactColimitQ (I : Type) [Category.{0} I] [IsFiltered I]
    (F : StronglyContinuousDiagramData I) : QCat := by sorry
noncomputable def filteredCompactComparison (I : Type) [Category.{0} I] [IsFiltered I]
    (F : StronglyContinuousDiagramData I) :
    HEquiv (filteredCompactColimitQ I F)
      (compactObjects (stronglyContinuousColimitDual I F).category) := by sorry

/- EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories
In a presentable closed symmetric monoidal C, f:x→y is trace-class if there are d, a pairing d⊗x→1 and a map 1→y⊗d whose contraction is f. Equivalently its class in Hom(x,y) lifts through Hom(x,1)⊗y. C is locally rigid over V when it is dualizable as a V-module and multiplication C⊗_V C→C is an internal left adjoint over C⊗_V C: its right adjoint preserves colimits and is bilinear. It is rigid when additionally its unit is V-atomic; absolutely over Sp this means compact. In the absolute stable case local rigidity is equivalent to dualizability plus every compact morphism being trace-class. Compact unit together with trace-class compact exhaustions generating under colimits implies rigidity. -/
noncomputable def traceContraction (C : SymMonData) (x y d : Obj (C.fibre 1))
    (e : C.tensor d x ⟶ C.unit) (c : C.unit ⟶ C.tensor y d) : x ⟶ y := by sorry
structure TraceClassData (C : SymMonData) (x y : Obj (C.fibre 1)) (f : x ⟶ y) where
  auxiliary : Obj (C.fibre 1)
  evaluation : C.tensor auxiliary x ⟶ C.unit
  coevaluation : C.unit ⟶ C.tensor y auxiliary
  contraction_eq : traceContraction C x y auxiliary evaluation coevaluation = f
structure RigidData where
  monoidal : SymMonData
  dualPair : DualPairData
  category_eq : dualPair.category = monoidal.fibre 1
  multiplicationRightAdjoint : QFun (monoidal.fibre 1) (presentableTensor (monoidal.fibre 1) (monoidal.fibre 1))
-- F belongs to the colimit-preserving strong monoidal functor category.
-- The full API proves that its right adjoint is C-linear and preserves colimits.
noncomputable def rigidRightAdjointLinearity (C D : RigidData)
    (F : Obj (strongColimitMonoidalFunctors C.monoidal D.monoidal)) :
    QFun (D.monoidal.fibre 1) (C.monoidal.fibre 1) := by sorry
noncomputable def RigidData.test_modules (R : CommRingCat) : { C : RigidData // C.monoidal.fibre 1 = ordinaryDerivedModules R } := by sorry
example (R : CommRingCat) : { C : RigidData // C.monoidal.fibre 1 = ordinaryDerivedModules R } := by sorry
noncomputable def braidHom (C : SymMonData) (x y : Obj (C.fibre 1)) : C.tensor x y ⟶ C.tensor y x := by sorry
structure ObjectDualData (C : SymMonData) (x : Obj (C.fibre 1)) where
  dual : Obj (C.fibre 1)
  evaluation : C.tensor dual x ⟶ C.unit
  coevaluation : C.unit ⟶ C.tensor x dual
  triangle : traceContraction C x x dual evaluation coevaluation = 𝟙 x
  dual_triangle : traceContraction C dual dual x (braidHom C x dual ≫ evaluation)
    (coevaluation ≫ braidHom C x dual) = 𝟙 dual
noncomputable def TraceClassData.test_dualizable (C : SymMonData) (x : Obj (C.fibre 1)) (d : ObjectDualData C x) : TraceClassData C x x (𝟙 x) := by sorry
example (C : SymMonData) (x : Obj (C.fibre 1)) (d : ObjectDualData C x) : TraceClassData C x x (𝟙 x) := by sorry
noncomputable def rationalMonoidal : SymMonData := by sorry
noncomputable def rationalInfiniteObject : Obj (rationalMonoidal.fibre 1) := by sorry
 theorem TraceClassData.test_infinite : ¬ Nonempty (TraceClassData rationalMonoidal rationalInfiniteObject rationalInfiniteObject (𝟙 rationalInfiniteObject)) := by sorry
example : ¬ Nonempty (TraceClassData rationalMonoidal rationalInfiniteObject rationalInfiniteObject (𝟙 rationalInfiniteObject)) := by sorry

/- EnhancedDerivedSheaves:E5:animation/sifted-colimits
A small infinity-category I is sifted if it is nonempty and the diagonal I→I×I is cofinal; equivalently its colimits in spaces commute with finite products. Filtered categories and Δop are sifted. Empty is not sifted: its colimit does not preserve the empty product. Nerves of ordinary sifted categories compare with Mathlib’s IsSifted where the diagonal is homotopy cofinal; ordinary connectedness of comma categories alone does not establish homotopy cofinality. -/
-- The cofinal-diagonal predicate requires E0/E3 and is omitted. The
-- following signatures give its diagonal data and product-test consequences.
noncomputable def siftedDiagonal (I : QCat) : QFun I (productQ I I) := by sorry
noncomputable def siftedProductComparison (I : QCat) (F G : QFun I spacesQ) : HEquiv (colimitProductQ I F G) (productQ (colimitSpaceQ I F) (colimitSpaceQ I G)) := by sorry
noncomputable def siftedRealization (F : QFun simplexOp spacesQ) : QCat := by sorry
noncomputable def constantPointDiagram (I : QCat) : QFun I spacesQ := by sorry
theorem siftedDiagonal.test_empty :
    ¬ Nonempty (HEquiv (colimitSpaceQ emptyQ (constantPointDiagram emptyQ)) terminalQ) := by sorry
example : ¬ Nonempty (HEquiv (colimitSpaceQ emptyQ (constantPointDiagram emptyQ)) terminalQ) := by sorry
noncomputable def siftedDiagonal.test_simplex (F G : QFun simplexOp spacesQ) :
    HEquiv (colimitProductQ simplexOp F G)
      (productQ (colimitSpaceQ simplexOp F) (colimitSpaceQ simplexOp G)) := by sorry
example (F G : QFun simplexOp spacesQ) : HEquiv (colimitProductQ simplexOp F G)
    (productQ (colimitSpaceQ simplexOp F) (colimitSpaceQ simplexOp G)) := by sorry
noncomputable def twoPointColimit : QCat := colimitSpaceQ (discreteQ (Fin 2)) (constantPointDiagram _)
theorem siftedDiagonal.test_two_points :
    ¬ Nonempty (HEquiv (colimitProductQ (discreteQ (Fin 2)) (constantPointDiagram _) (constantPointDiagram _))
      (productQ twoPointColimit twoPointColimit)) := by sorry
example : ¬ Nonempty (HEquiv (colimitProductQ (discreteQ (Fin 2)) (constantPointDiagram _) (constantPointDiagram _))
    (productQ twoPointColimit twoPointColimit)) := by sorry

/- EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category
For a small category C with finite coproducts, PΣ(C) is the full subcategory of Fun(Cop,Spaces) sending finite coproducts to products, including the empty coproduct. It is presentable. Yoneda is fully faithful, preserves finite coproducts and its image consists of compact projective objects. Every object is a sifted colimit of representables, more precisely a geometric realization of coproducts of representables. Compact-projective means Map(x,−) preserves sifted colimits, a stronger property than ordinary compactness. -/
noncomputable def nonabelianDerived (C : QCat) : QCat := by sorry
noncomputable def animationYoneda (C : QCat) : QFun C (nonabelianDerived C) := by sorry
noncomputable def animationResolution (C : QCat) (x : Obj (nonabelianDerived C)) : QFun simplexOp (nonabelianDerived C) := by sorry
noncomputable def finiteSetsQ : QCat := by sorry
noncomputable def nonabelianDerived.test_initial : HEquiv (nonabelianDerived terminalQ) terminalQ := by sorry
example : HEquiv (nonabelianDerived terminalQ) terminalQ := by sorry
noncomputable def nonabelianDerived.test_finite_sets : HEquiv (nonabelianDerived finiteSetsQ) spacesQ := by sorry
example : HEquiv (nonabelianDerived finiteSetsQ) spacesQ := by sorry
noncomputable def nonabelianDerived.test_coproduct (C : QCat) (x y : Obj C) : (onHCat (animationYoneda C)).obj (coproductObj C x y) ≅ coproductObj (nonabelianDerived C) ((onHCat (animationYoneda C)).obj x) ((onHCat (animationYoneda C)).obj y) := by sorry
example (C : QCat) (x y : Obj C) : (onHCat (animationYoneda C)).obj (coproductObj C x y) ≅ coproductObj (nonabelianDerived C) ((onHCat (animationYoneda C)).obj x) ((onHCat (animationYoneda C)).obj y) := by sorry

/- EnhancedDerivedSheaves:E5:animation/universal-property-of-animation
If C is small with finite coproducts and D admits filtered colimits and geometric realizations, restriction gives Fun_sifted(PΣ(C),D) ≃ Fun(C,D). The inverse is sifted left Kan extension. It preserves all colimits exactly when its input preserves finite coproducts, provided D admits those coproducts. Evaluation on a simplicial polynomial resolution is realization of the values. HTT’s strict simplicial algebra model presents PΣ(C) by objectwise weak equivalences; rectification is part of the comparison, not a definition by assertion. -/
noncomputable def animationRestriction (C D : QCat) : HEquiv (siftedFunQ (nonabelianDerived C) D) (funQ C D) := by sorry
noncomputable def animateFunctor {C D : QCat} (F : QFun C D) : QFun (nonabelianDerived C) D := by sorry

/- EnhancedDerivedSheaves:E5:animation/animated-commutative-rings
For an ordinary commutative R, let Poly_R be the category of polynomial R-algebras in finitely many variables and all R-algebra maps. AnimAlg_R=PΣ(Poly_R) is equivalent to the infinity-localization of simplicial commutative R-algebras at maps inducing isomorphisms on all homotopy groups. Its discrete subcategory is ordinary R-algebras; inclusion has π₀ as left adjoint. Pushouts B⊗^L_A C are computed by simplicial polynomial resolutions. Their additive homotopy groups are Tor when the bases are ordinary; an underived pushout is correct only under suitable Tor vanishing. -/
noncomputable def animatedAlgebras (R : CommRingCat) : QCat := by sorry
noncomputable def animatedDiscrete (R : CommRingCat) : Obj (animatedAlgebras (CommRingCat.of ℤ)) := by sorry
noncomputable def animatedPiZero (A : Obj (animatedAlgebras (CommRingCat.of ℤ))) : CommRingCat := by sorry
noncomputable def animatedPushout (A B C : Obj (animatedAlgebras (CommRingCat.of ℤ))) (f : A ⟶ B) (g : A ⟶ C) : Obj (animatedAlgebras (CommRingCat.of ℤ)) := by sorry
noncomputable def animatedPi (A : Obj (animatedAlgebras (CommRingCat.of ℤ))) (n : ℕ) : Type := by sorry
noncomputable def animatedAlgebras.test_polynomial (R : CommRingCat) (n : ℕ) : animatedPiZero (animatedDiscrete (CommRingCat.of (MvPolynomial (Fin n) R))) ≅ CommRingCat.of (MvPolynomial (Fin n) R) := by sorry
example (R : CommRingCat) (n : ℕ) : animatedPiZero (animatedDiscrete (CommRingCat.of (MvPolynomial (Fin n) R))) ≅ CommRingCat.of (MvPolynomial (Fin n) R) := by sorry
noncomputable def animatedDiscreteMap {R T : CommRingCat} (f : R ⟶ T) : animatedDiscrete R ⟶ animatedDiscrete T := by sorry
noncomputable def torEval : CommRingCat.of (MvPolynomial (Fin 1) (ZMod 2)) ⟶ CommRingCat.of (ZMod 2) :=
  CommRingCat.ofHom (MvPolynomial.eval (fun _ : Fin 1 => (0 : ZMod 2)))
noncomputable def torExample : Obj (animatedAlgebras (CommRingCat.of ℤ)) :=
  animatedPushout (animatedDiscrete (CommRingCat.of (MvPolynomial (Fin 1) (ZMod 2))))
    (animatedDiscrete (CommRingCat.of (ZMod 2))) (animatedDiscrete (CommRingCat.of (ZMod 2)))
    (animatedDiscreteMap torEval) (animatedDiscreteMap torEval)
noncomputable def animatedAlgebras.test_tor : animatedPi torExample 1 ≃ ZMod 2 := by sorry
example : animatedPi torExample 1 ≃ ZMod 2 := by sorry
noncomputable def animatedAlgebras.test_identity (A B : Obj (animatedAlgebras (CommRingCat.of ℤ))) (f : A ⟶ B) : animatedPushout A A B (𝟙 A) f ≅ B := by sorry
example (A B : Obj (animatedAlgebras (CommRingCat.of ℤ))) (f : A ⟶ B) : animatedPushout A A B (𝟙 A) f ≅ B := by sorry

/- EnhancedDerivedSheaves:E5:animation/frobenius-and-perfection
For a simplicial commutative 𝔽_p-algebra A, Frobenius acts by zero on π_i(A) for i>0. Thus perfection, the sequential Frobenius colimit, is discrete and equals the perfection of π₀A. Perfect discrete 𝔽_p-algebras are closed under ordinary and derived colimits. In particular a derived tensor of perfect B←A→C is discrete, perfect and equals its ordinary tensor. The perfection of a derived affine scheme is the perfection of its classical truncation; global scheme glueing is imported from E1/E2. The multiplication map A×A→A, based at (0,0), induces zero on positive homotopy because its restrictions to both axes are zero. This does not say multiplication as a bilinear graded ring operation vanishes. An imperfect base cannot be dropped: for A=𝔽_p(t), A_perf⊗_A A_perf has the nonzero nilpotent t^(1/p)⊗1−1⊗t^(1/p). Cosimplicial perfection need not be discrete, as the perfected elliptic-cohomology example in Remark 11.7 shows. -/
noncomputable def animatedPerfection (p : ℕ) (A : Obj (animatedAlgebras (CommRingCat.of (ZMod p)))) : Obj (animatedAlgebras (CommRingCat.of (ZMod p))) := by sorry
noncomputable def animatedFpPi (p : ℕ) (A : Obj (animatedAlgebras (CommRingCat.of (ZMod p)))) (n : ℕ) : Type := by sorry
 theorem perfectionDiscrete (p : ℕ) [Fact p.Prime] (A : Obj (animatedAlgebras (CommRingCat.of (ZMod p)))) (n : ℕ) (hn : 0 < n) : Subsingleton (animatedFpPi p (animatedPerfection p A) n) := by sorry

/- EnhancedDerivedSheaves:E5:animation/derived-witt-adapter
Apply the existing p-typical Witt vector functor degreewise to a simplicial commutative 𝔽_p-algebra A. This preserves weak equivalences since its underlying simplicial set is A^ℕ, with π_i W(A)≅∏_ℕ π_i A as pointed homotopy sets. For i>0 this is an additive-group identification by Eckmann–Hilton; at i=0 the ring is W(π₀A), whose addition is the Witt addition rather than coordinatewise addition. Witt Frobenius induces zero on positive homotopy; its sequential localization is discrete and the map to W(π₀A) becomes an equivalence after Frobenius localization. The fibre of W(A)→W(π₀A) is killed by p in the derived sense, using the coherent Witt identity VF=p and the Frobenius nullhomotopy, rather than inferring a null map just from p-torsion cohomology. -/
noncomputable def simplicialWitt (p : ℕ) (A : CategoryTheory.SimplicialObject CommRingCat) : CategoryTheory.SimplicialObject CommRingCat := by sorry
noncomputable def simplicialPi (A : CategoryTheory.SimplicialObject CommRingCat) (n : ℕ) : Type := by sorry
-- This equivalence is on underlying types; its additive refinement applies only for n > 0.
noncomputable def simplicialWittPi (p : ℕ) [Fact p.Prime]
    (A : CategoryTheory.SimplicialObject CommRingCat) (n : ℕ) :
    simplicialPi (simplicialWitt p A) n ≃ (ℕ → simplicialPi A n) := by sorry
noncomputable def wittFrobeniusLocalization (p : ℕ) [Fact p.Prime]
    (A : CategoryTheory.SimplicialObject CommRingCat)
    (hchar : ∀ n : SimplexCategoryᵒᵖ, CharP (A.obj n) p) :
    CategoryTheory.SimplicialObject CommRingCat := by sorry
noncomputable def constantSimplicialRing (R : CommRingCat) : CategoryTheory.SimplicialObject CommRingCat := by sorry
noncomputable def simplicialWitt.test_constant (p : ℕ) [Fact p.Prime] (R : CommRingCat) : simplicialWitt p (constantSimplicialRing R) ≅ constantSimplicialRing (CommRingCat.of (WittVector p R)) := by sorry
example (p : ℕ) [Fact p.Prime] (R : CommRingCat) : simplicialWitt p (constantSimplicialRing R) ≅ constantSimplicialRing (CommRingCat.of (WittVector p R)) := by sorry
 theorem simplicialWitt.test_coordinates (p : ℕ) (R : CommRingCat) (a : ℕ → R) (n : ℕ) : (WittVector.mk p a).coeff n = a n := by sorry
example (p : ℕ) (R : CommRingCat) (a : ℕ → R) (n : ℕ) : (WittVector.mk p a).coeff n = a n := by sorry
-- A simplicial polynomial-resolution model of F_p ⊗^L_{F_p[x]} F_p,
-- with x sent to zero on both sides. This is not its discrete pi_0 ring.
noncomputable def torSimplicialRing (p : ℕ) [Fact p.Prime] :
    CategoryTheory.SimplicialObject CommRingCat := by sorry
theorem torSimplicialRing_charP (p : ℕ) [Fact p.Prime] (n : SimplexCategoryᵒᵖ) :
    CharP ((torSimplicialRing p).obj n) p := by sorry
noncomputable def simplicialWitt.test_positive (p : ℕ) [Fact p.Prime] :
    simplicialPi (simplicialWitt p (torSimplicialRing p)) 1 ≃ (ℕ → ZMod p) := by sorry
example (p : ℕ) [Fact p.Prime] :
    simplicialPi (simplicialWitt p (torSimplicialRing p)) 1 ≃ (ℕ → ZMod p) := by sorry

/- EnhancedDerivedSheaves:E5:animation/bounded-totalization-colimits
For a cosimplicial diagram of n-truncated spaces, n≥0 fixed, totalization equals partial totalization through degree n+1. Consequently totalization commutes with filtered colimits when the truncation bound is uniform in both indices. For cosimplicial spectra whose terms all lie in Sp≤b for one integer b, π_k of totalization is computed by a finite partial stage r≥max(0,b−k+1). This gives filtered-colimit commutation degree by degree; coconnective terms are the case b=0. The analogous cohomological comparison for complexes uses a uniform lower cohomological bound. Without a uniform bound, arbitrary totalization need not commute with filtered colimits. Unbounded Postnikov convergence and hypercompleteness are supplied by E2. -/
noncomputable def boundedTotalization (n : ℕ) (F : QFun simplexQ (truncatedSpacesQ n)) : QCat := by sorry
noncomputable def filteredTotalizationComparison (I : Type) [Category.{0} I] [IsFiltered I]
    (n : ℕ) (F : QFun (nerveQ I) (funQ simplexQ (truncatedSpacesQ n))) :
    HEquiv (filteredTotQ I n F) (totFilteredQ I n F) := by sorry

/- EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface
Import L_(B/A) from DD.0 with Map_B(L_(B/A),M) ≃ Der_A(B,M), its transitivity cofiber sequence B⊗^L_A L_(A/R)→L_(B/R)→L_(B/A), and derived base change for a homotopy pushout. E5 identifies these maps with its animated and monoidal module structures, without defining a second cotangent complex. The low-degree comparison with Mathlib’s naive cotangent construction covers H⁰=Ω and H⁻¹, not the entire complex. Re-export derived exterior powers and the DD.0 amplitude tests through the same interface. -/
noncomputable def importedCotangent (A B : CommRingCat) (f : A ⟶ B) : Obj (ordinaryDerivedModules B) := by sorry
noncomputable def polynomialRingMap (R : CommRingCat) (n : ℕ) : R ⟶ CommRingCat.of (MvPolynomial (Fin n) R) := by sorry
noncomputable def polynomialDifferentials (R : CommRingCat) (n : ℕ) : Obj (ordinaryDerivedModules (CommRingCat.of (MvPolynomial (Fin n) R))) := by sorry
noncomputable def sequenceQuotient (R : CommRingCat) (rs : List R) : CommRingCat :=
  CommRingCat.of (R ⧸ Ideal.ofList rs)
noncomputable def sequenceQuotientMap (R : CommRingCat) (rs : List R) :
    R ⟶ sequenceQuotient R rs := CommRingCat.ofHom (Ideal.Quotient.mk (Ideal.ofList rs))
noncomputable def regularConormalShift (R : CommRingCat) (rs : List R) :
    Obj (ordinaryDerivedModules (sequenceQuotient R rs)) := by sorry
noncomputable def polynomialCotangentTest (R : CommRingCat) (n : ℕ) : importedCotangent R (CommRingCat.of (MvPolynomial (Fin n) R)) (polynomialRingMap R n) ≅ polynomialDifferentials R n := by sorry
noncomputable def regularQuotientCotangentTest (R : CommRingCat) (rs : List R)
    (hreg : RingTheory.Sequence.IsRegular R rs) :
    importedCotangent R (sequenceQuotient R rs) (sequenceQuotientMap R rs) ≅
      regularConormalShift R rs := by sorry
example (R : CommRingCat) (rs : List R) (hreg : RingTheory.Sequence.IsRegular R rs) :
    importedCotangent R (sequenceQuotient R rs) (sequenceQuotientMap R rs) ≅
      regularConormalShift R rs := by sorry
-- The full cotangent object has more information than its naive truncation.
noncomputable def dualNumbers (k : Type) [Field k] : CommRingCat :=
  CommRingCat.of (TrivSqZeroExt k k)
noncomputable def dualNumbersAugmentation (k : Type) [Field k] :
    dualNumbers k ⟶ CommRingCat.of k :=
  CommRingCat.ofHom (TrivSqZeroExt.fstHom k k k).toRingHom
noncomputable def cotangentCohomology (B : CommRingCat)
    (K : Obj (ordinaryDerivedModules B)) (n : ℤ) : Type := by sorry
noncomputable def nonregularQuotientCotangentTest (k : Type) [Field k] :
    cotangentCohomology (CommRingCat.of k)
      (importedCotangent (dualNumbers k) (CommRingCat.of k) (dualNumbersAugmentation k)) (-2) ≃ k := by sorry
example (k : Type) [Field k] :
    cotangentCohomology (CommRingCat.of k)
      (importedCotangent (dualNumbers k) (CommRingCat.of k) (dualNumbersAugmentation k)) (-2) ≃ k := by sorry

/- EnhancedDerivedSheaves:E5:cotangent-export/e-infinity-comparison-in-proved-ranges
There is a sifted-colimit-preserving comparison from animated commutative R-algebras to connective E∞ HR-algebras, determined on polynomial generators. It is an equivalence for R a ℚ-algebra. For any commutative R, simplicial associative R-algebras compare equivalently with connective E₁ HR-algebras. In positive characteristic the commutative comparison is not an equivalence in general: spectral free algebras retain the homology of symmetric groups, absent from a polynomial animated algebra on a degree-zero generator. Strictly commutative dg algebras are a general model only in characteristic zero. Cotangent comparisons are asserted only after the relevant equivalence or separately verified hypotheses. -/
noncomputable def connectiveSpectralAlgebras (R : CommRingCat) : QCat := by sorry
noncomputable def animationToSpectral (R : CommRingCat) : QFun (animatedAlgebras R) (connectiveSpectralAlgebras R) := by sorry
noncomputable def rationalAnimationComparison : HEquiv (animatedAlgebras (CommRingCat.of ℚ)) (connectiveSpectralAlgebras (CommRingCat.of ℚ)) := by sorry

/- EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation
Import the H.5 symmetric-spectrum stable model, derived smash, Eilenberg–Mac Lane object and module model. Apply the E5 monoidal model-localization interface to compare its infinity-localization with the abstract stable monoidal category Sp. For each ordinary commutative R, Mod_HR is symmetric monoidally equivalent to the E1 enhanced D(R), carrying HR to R and derived smash over HR to derived tensor over R. On homotopy categories it recovers Mathlib’s DerivedCategory of R-modules, with the same cochain shifts and exact triangles. -/
noncomputable def spectralModules (R : CommRingCat) : QCat := by sorry
noncomputable def spectralDerivedComparison (R : CommRingCat) : HEquiv (spectralModules R) (ordinaryDerivedModules R) := by sorry
attribute [local instance] HasDerivedCategory.standard in
noncomputable def derivedHomotopyComparison (R : CommRingCat) : HCat (ordinaryDerivedModules R) ≌ DerivedCategory (ModuleCat.{1} R) := by sorry

/- EnhancedDerivedSheaves:E5/single-enhancement-supplier
The shared interface commutes with passage from ordinary rings to animated rings and from algebra objects to modules. For the unit R, the enhanced module category, its tensor unit and ordinary derived-category comparison agree across E1, abstract E5 and the spectral return. For polynomial R[x₁,…,x_n], the imported cotangent complex is the free rank-n B-module in degree zero. For a quotient by a regular sequence of length c, the imported relative cotangent complex is (I/I²)[1], free rank c in cohomological degree −1. These computations, the homotopy pushout Tor example and preservation of exact triangles are the parent layer’s acceptance diagram. The nonregular quotient k[ε]/(ε²)→k retains a nonzero H⁻² term, checking that the full cotangent object was not replaced by its naive truncation. -/
noncomputable def enhancementCompatibility (R : CommRingCat) : HEquiv (spectralModules R) (ordinaryDerivedModules R) := by sorry

end Monoidal

/-! ## Whole-roadmap additions (BP-EnhancedDerivedSheaves)

Signatures for the targets the whole-roadmap pass adds. Ordinary statements use Mathlib and
Tau Ceti carriers; ∞-categorical statements reuse the fixed-universe carriers of the E5
section (`QCat`, `Obj`, `HEquiv`, `SymMonData`, algebra and module objects, animated algebras).
As elsewhere in this file, a statement with no carrier at the pins is not stated here; a
comment names it, and the roadmap document states it in full. -/

section WholeRoadmapOrdinary

open CategoryTheory CategoryTheory.Limits Opposite

universe u v

/-! ### E1/enhanced-versus-triangulated-colimits -/

/-- In a pretriangulated category every epimorphism is split. A categorical colimit in the
triangulated derived category therefore receives a split epimorphism from the direct sum, which
fails for `ℤ/p → ℤ/p² → ⋯` and its enhanced colimit `ℚ_p/ℤ_p`. -/
theorem pretriangulated_epi_isSplitEpi {C : Type u} [Category.{v} C] [Preadditive C]
    [HasZeroObject C] [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
    [Pretriangulated C] {X Y : C} (f : X ⟶ Y) [Epi f] : IsSplitEpi f := by sorry

/-! ### E1/slice-free-module-sheaves -/

section SliceFree

variable {C : Type u} [SmallCategory C] {J : GrothendieckTopology C} (R : Sheaf J RingCat.{u})
  [J.WEqualsLocallyBijective AddCommGrpCat.{u}] [HasWeakSheafify J AddCommGrpCat.{u}]

/-- `O_U = j_{U!}(O|_U)`: the sheafification of the free presheaf of modules on the
representable presheaf of `U`. -/
noncomputable def SheafOfModules.sliceFree (U : C) : SheafOfModules.{u} R :=
  (PresheafOfModules.sheafification (𝟙 R.obj)).obj
    ((PresheafOfModules.free R.obj).obj (yoneda.obj U))

theorem SheafOfModules.sliceFree_presheaf (U : C) :
    SheafOfModules.sliceFree R U =
      (PresheafOfModules.sheafification (𝟙 R.obj)).obj
        ((PresheafOfModules.free R.obj).obj (yoneda.obj U)) := rfl

/-- Maps out of `O_U` are the sections over `U`. -/
noncomputable def SheafOfModules.sliceFree_homEquiv (U : C) (F : SheafOfModules.{u} R) :
    (SheafOfModules.sliceFree R U ⟶ F) ≃ F.val.obj (op U) := by sorry

noncomputable def SheafOfModules.sliceFree_map {U V : C} (g : V ⟶ U) :
    SheafOfModules.sliceFree R V ⟶ SheafOfModules.sliceFree R U :=
  (PresheafOfModules.sheafification (𝟙 R.obj)).map
    ((PresheafOfModules.free R.obj).map (yoneda.map g))

theorem SheafOfModules.sliceFree_isSeparating :
    ObjectProperty.IsSeparating (.ofObj (SheafOfModules.sliceFree R)) := by sorry

theorem SheafOfModules.sliceFree_final (X : C) (hX : IsTerminal X) :
    Nonempty (SheafOfModules.sliceFree R X ≅ SheafOfModules.unit R) := by sorry

theorem SheafOfModules.sliceFree_hom_unit (U : C) :
    Nonempty ((SheafOfModules.sliceFree R U ⟶ SheafOfModules.unit R) ≃ R.obj.obj (op U)) := by sorry

end SliceFree

-- Not stated here: SheafOfModules.sliceFree_flat (no flatness predicate for module sheaves at the
-- pins) and the tests SheafOfModules.sliceFree_point and SheafOfModules.sliceFree_not_free
-- (concrete one- and two-point sites); the roadmap document states them.

/-! ### E1/localization-and-reduction-detect-zero -/

/-- The module step: a `g`-power torsion module on which `g` acts bijectively is zero. Applied to
the cohomology of `C` with `C[1/g] = 0` and `C ⊗ᴸ R/g = 0` it gives `C = 0`. -/
theorem localization_reduction_detect_zero {R : Type u} [CommRing R] (g : R)
    (M : Type u) [AddCommGroup M] [Module R M]
    (htors : ∀ m : M, ∃ n : ℕ, g ^ n • m = 0)
    (hbij : Function.Bijective (fun m : M => g • m)) : Subsingleton M := by sorry

-- Not stated here: the perfect valuation counterexample K/m, and E1/valuation-decomposition-triangle
-- and E1/projection-formula, which need quasicoherent derived categories of perfect schemes and of
-- ringed topoi as carriers.

end WholeRoadmapOrdinary

section WholeRoadmapMonoidal

open CategoryTheory
set_option autoImplicit false

/-! ### E2/lim1-products-vanish and E2/multiplicative-derived-limit-filtration -/

/-- `1 − shift` on the product of a tower of abelian groups; its kernel is `lim` and its
cokernel `lim¹`. -/
def towerShiftDiff (A : ℕᵒᵖ ⥤ AddCommGrpCat.{0}) :
    (∀ n : ℕ, A.obj (Opposite.op n)) →+ (∀ n : ℕ, A.obj (Opposite.op n)) where
  toFun x n := x n - (A.map (homOfLE (Nat.le_succ n)).op).hom (x (n + 1))
  map_zero' := by funext n; simp
  map_add' x y := by funext n; simp only [Pi.add_apply, map_add]; abel

/-- `lim¹` of a tower of abelian groups, as the cokernel of `1 − shift`. -/
abbrev towerLimOne (A : ℕᵒᵖ ⥤ AddCommGrpCat.{0}) :=
  (∀ n : ℕ, A.obj (Opposite.op n)) ⧸ (towerShiftDiff A).range

/-- Test `derivedLimitFiltration_surjective`: a tower of surjections has no `lim¹`. -/
theorem derivedLimitFiltration_surjective (A : ℕᵒᵖ ⥤ AddCommGrpCat.{0})
    (hsurj : ∀ n : ℕ, Function.Surjective (A.map (homOfLE (Nat.le_succ n)).op).hom) :
    Subsingleton (towerLimOne A) := by sorry

-- Not stated here: the product vanishing of E2/lim1-products-vanish and the filtration
-- derivedLimitFiltration with its API (gr, eq_bot, mul, naturality, nat_eq_milnor) and tests
-- (final, ptower, not_lim), which need limits and pairings of mapping spectra.

/-! ### E2: geometric descent

Not stated here: properSurjective_inductiveLevel with its API and tests, abstract blowup squares,
descendable maps from geometry, noetherian h-cover descendability and h-descent, the converse
characterization, perfect abstract-blowup patching and truncated maps to hypercomplete objects.
Their carriers (fppf covers, nil-immersions and blowups as properties of finite presentation,
Dqc of schemes as an ∞-category, ∞-topoi) are not at the pins. -/

/-! ### E3/kan-extensions-along-functors -/

noncomputable def leftKanAlong {C₀ C₁ D : QCat} (δ : QFun C₀ C₁) : QFun (funQ C₀ D) (funQ C₁ D) := by sorry
noncomputable def rightKanAlong {C₀ C₁ D : QCat} (δ : QFun C₀ C₁) : QFun (funQ C₀ D) (funQ C₁ D) := by sorry
noncomputable def restrictAlong {C₀ C₁ D : QCat} (δ : QFun C₀ C₁) : QFun (funQ C₁ D) (funQ C₀ D) := by sorry

/-- Left and right Kan extension are left and right adjoint to restriction (homotopy-category
shadow of the ∞-categorical adjunctions). -/
theorem kanExtension_adjunctions {C₀ C₁ D : QCat} (δ : QFun C₀ C₁) :
    Nonempty (onHCat (leftKanAlong (D := D) δ) ⊣ onHCat (restrictAlong δ)) ∧
      Nonempty (onHCat (restrictAlong (D := D) δ) ⊣ onHCat (rightKanAlong δ)) := by sorry

/-! ### E4/completed-base-change -/

/-- The derived `J`-complete objects of `D(S)` (point topos). -/
noncomputable def completeModules (S : CommRingCat) (J : Ideal S) : QCat := by sorry
noncomputable def completedBaseChange {R S : CommRingCat} (φ : R ⟶ S) (I : Ideal R) (J : Ideal S) :
    QFun (completeModules R I) (completeModules S J) := by sorry
noncomputable def completeRestriction {R S : CommRingCat} (φ : R ⟶ S) (I : Ideal R) (J : Ideal S) :
    QFun (completeModules S J) (completeModules R I) := by sorry
theorem completedBaseChange_adjunction {R S : CommRingCat} (φ : R ⟶ S) (I : Ideal R) (J : Ideal S)
    (hI : I.map φ.hom ≤ J.radical) :
    Nonempty (onHCat (completedBaseChange φ I J) ⊣ onHCat (completeRestriction φ I J)) := by sorry
theorem completedBaseChange_comp {R S T : CommRingCat} (φ : R ⟶ S) (ψ : S ⟶ T)
    (I : Ideal R) (J : Ideal S) (L : Ideal T) :
    Nonempty (onHCat (completedBaseChange φ I J) ⋙ onHCat (completedBaseChange ψ J L) ≅
      onHCat (completedBaseChange (φ ≫ ψ) I L)) := by sorry
theorem completedBaseChange_id (R : CommRingCat) (I : Ideal R) :
    Nonempty (onHCat (completedBaseChange (𝟙 R) I I) ≅ 𝟭 _) := by sorry
-- Not stated here: completedBaseChange_monoidal, _reduction and _flat_equiv, and the tests
-- completedBaseChange_zp, _zero_ideal and _polynomial, which need the completed tensor and
-- reduction functors on these carriers. E4/amitsur-completion-of-finite-modules needs the
-- Amitsur totalization of D(A) and is not stated here either.

/-! ### E5:abstract/symmetric-monoidal-derived-sheaves -/

noncomputable def derivedTensor_symmetricMonoidal (R : CommRingCat) : SymMonData := by sorry
/-- The underlying category of the symmetric monoidal structure is `D(R)`. -/
theorem derivedTensor_symmetricMonoidal_tensor (R : CommRingCat) :
    Nonempty (HEquiv ((derivedTensor_symmetricMonoidal R).fibre 1) (ordinaryDerivedModules R)) := by sorry
-- Not stated here: derivedTensor_symmetricMonoidal_colim, derivedPullback_symmetricMonoidal,
-- derivedPushforward_laxMonoidal and derivedSections_cup (ringed sites in the fixed-universe
-- carrier), and the tests derivedTensor_symmetricMonoidal_point, _unit, _homotopy and
-- derivedTensor_termwise_not_invariant.

/-! ### E5:abstract/amitsur-tower-fibres -/

/-- The `k`-th stage of the Amitsur tower is the cofibre of `F^{⊗(k+1)} → A`. -/
theorem amitsurTower_fibres (C : SymMonData) {A B : Obj (commutativeAlgebras C)} (f : A ⟶ B) (k : ℕ) :
    Nonempty ((amitsurTower C f).obj (Opposite.op k) ≅
      cofiberObj ((relativeMonoidal C A).fibre 1) (augmentationPower C f (k + 1)).hom) := by sorry

/-! ### E5:presentability/spectra -/

noncomputable def stabilization (C : QCat) : QCat := by sorry
noncomputable def omegaInfinity (C : QCat) : QFun (stabilization C) C := by sorry
noncomputable def sigmaInfinity (C : QCat) : QFun C (stabilization C) := by sorry
noncomputable abbrev spectra : QCat := abstractSp
noncomputable def mappingSpectrum (C : QCat) (x : Obj C) : QFun C spectra := by sorry
theorem stabilization_stable (C : QCat) : IsStable (stabilization C).val := by sorry
theorem stabilization_of_stable (C : QCat) (h : IsStable C.val) :
    Nonempty (HEquiv (stabilization C) C) := by sorry
theorem spectra_stable : IsStable spectra.val := by sorry
-- Not stated here: omegaInfinity_equiv_iff_stable (its converse needs ∞-equivalences, not the
-- homotopy-category shadow HEquiv), spectra_compactlyGenerated, spectra_idempotent, and the tests
-- spectra_not_spaces, mappingSpectrum_derived and spectra_unit.

/-! ### E5:presentability/filtered-objects -/

noncomputable def integersOp : QCat := by sorry
noncomputable def filteredObjects (C : QCat) : QCat := funQ integersOp C
noncomputable def filteredObjects.underlying (C : QCat) : QFun (filteredObjects C) C := by sorry
noncomputable def filteredObjects.gr (C : QCat) (i : ℤ) : QFun (filteredObjects C) C := by sorry
noncomputable def filteredObjects.completion (C : QCat) : QFun (filteredObjects C) (filteredObjects C) := by sorry
noncomputable def filteredObjects.dayConvolution (C : SymMonData) : SymMonData := by sorry
-- Not stated here: filteredObjects.IsComplete (a limit-vanishing predicate with no carrier for
-- limits in this fixed-universe model), and with it gr_conservative, gr_tensor and the tests
-- gr_single, constant_not_complete, zero and unit.

/-! ### E5:spectra-comparison/perfect-modules

Not stated here: perfect, compact and dualizable objects of D(R) agree, and Perf commutes with
filtered colimits of rings; the pins have no perfect-complex predicate on DerivedCategory. -/

/-! ### E5:cotangent-export -/

noncomputable def animatedModules {R : CommRingCat} (B : Obj (animatedAlgebras R)) : QCat := by sorry
noncomputable def animatedModules_unit {R : CommRingCat} (B : Obj (animatedAlgebras R)) :
    Obj (animatedModules B) := by sorry
noncomputable def animatedModules_baseChange {R : CommRingCat} {A B : Obj (animatedAlgebras R)}
    (f : A ⟶ B) : QFun (animatedModules A) (animatedModules B) := by sorry
noncomputable def animatedModules_discrete (R : CommRingCat) :
    HEquiv (animatedModules (animatedDiscrete R)) (ordinaryDerivedModules R) := by sorry
-- Not stated here: animatedModules_connective_generated and the tests animatedModules_base,
-- _discrete_unit, _tor and _zero.

noncomputable def squareZeroExtension {R : CommRingCat} (B : Obj (animatedAlgebras R))
    (M : Obj (animatedModules B)) : Obj (animatedAlgebras R) := by sorry
noncomputable def derivedDerivations {R : CommRingCat} (B : Obj (animatedAlgebras R))
    (M : Obj (animatedModules B)) : QCat := by sorry
noncomputable def derivationZero {R : CommRingCat} (B : Obj (animatedAlgebras R))
    (M : Obj (animatedModules B)) : Obj (derivedDerivations B M) := by sorry
noncomputable def derivationPostcompose {R : CommRingCat} (B : Obj (animatedAlgebras R))
    {M N : Obj (animatedModules B)} (g : M ⟶ N) :
    QFun (derivedDerivations B M) (derivedDerivations B N) := by sorry
-- Not stated here: squareZeroExtension_discrete, derivationDiscrete (whose ordinary shadow is
-- Mathlib's derivationToSquareZeroEquivLift) and the tests derivedDerivations_base, _polynomial,
-- _leibniz and _discrete.

noncomputable def cotangentComplex {R : CommRingCat} {A B : Obj (animatedAlgebras R)} (f : A ⟶ B) :
    Obj (animatedModules B) := by sorry
noncomputable def cotangentMap {R : CommRingCat} {A B A' B' : Obj (animatedAlgebras R)}
    (f : A ⟶ B) (f' : A' ⟶ B') (a : A ⟶ A') (b : B ⟶ B') (h : f ≫ b = a ≫ f') :
    (onHCat (animatedModules_baseChange b)).obj (cotangentComplex f) ⟶ cotangentComplex f' := by sorry
/-- `H⁰` of the cotangent complex of a ring map is the module of Kähler differentials. -/
theorem cotangentH0 (A B : CommRingCat) (f : A ⟶ B) :
    letI := f.hom.toAlgebra
    Nonempty (cotangentCohomology B (importedCotangent A B f) 0 ≃ KaehlerDifferential A B) := by sorry
/-- Test `cotangentComplex_line`. -/
theorem cotangentComplex_line (R : CommRingCat) :
    Nonempty (importedCotangent R (CommRingCat.of (MvPolynomial (Fin 1) R)) (polynomialRingMap R 1) ≅
      polynomialDifferentials R 1) := by sorry
-- Not stated here: cotangentResolutionEquiv, cotangent_polynomial and the tests
-- cotangentComplex_self, cotangentComplex_dualNumbers and cotangentComplex_h0.

theorem cotangentComplex_corepresents {R : CommRingCat} {A B : Obj (animatedAlgebras R)} (f : A ⟶ B)
    (M : Obj (animatedModules B)) :
    Nonempty (HEquiv (mappingQ (animatedModules B) (cotangentComplex f) M) (derivedDerivations B M)) := by sorry

/-- `H⁻¹` of the cotangent complex of a ring map is Mathlib's `H1Cotangent`. -/
theorem cotangentComplex_naive (A B : CommRingCat) (f : A ⟶ B) :
    letI := f.hom.toAlgebra
    Nonempty (cotangentCohomology B (importedCotangent A B f) (-1) ≃ Algebra.H1Cotangent A B) := by sorry

noncomputable def cotangentComplex_transitivity {R : CommRingCat} {A B C : Obj (animatedAlgebras R)}
    (f : A ⟶ B) (g : B ⟶ C) :
    (onHCat (animatedModules_baseChange g)).obj (cotangentComplex f) ⟶ cotangentComplex (f ≫ g) := by sorry
-- Not stated here: the cofibre identification of transitivity and cotangentComplex_baseChange,
-- which need animated pushouts over an arbitrary base.

theorem cotangentComplex_localization (R : CommRingCat) (S : Submonoid R) (n : ℤ) :
    Subsingleton (cotangentCohomology (CommRingCat.of (Localization S))
      (importedCotangent R (CommRingCat.of (Localization S))
        (CommRingCat.ofHom (algebraMap R (Localization S)))) n) := by sorry

theorem cotangentComplex_smooth (R : CommRingCat) (n : ℕ) :
    Nonempty (importedCotangent R (CommRingCat.of (MvPolynomial (Fin n) R)) (polynomialRingMap R n) ≅
      polynomialDifferentials R n) := by sorry

theorem cotangentComplex_regularQuotient (R : CommRingCat) (rs : List R)
    (hreg : RingTheory.Sequence.IsRegular R rs) :
    Nonempty (importedCotangent R (sequenceQuotient R rs) (sequenceQuotientMap R rs) ≅
      regularConormalShift R rs) := by sorry

theorem cotangentComplex_lci (R : CommRingCat) (rs : List R)
    (hreg : RingTheory.Sequence.IsRegular R rs) (n : ℤ) (hn : n < -1 ∨ 0 < n) :
    Subsingleton (cotangentCohomology (sequenceQuotient R rs)
      (importedCotangent R (sequenceQuotient R rs) (sequenceQuotientMap R rs)) n) := by sorry

noncomputable def derivedExteriorPower {R : CommRingCat} (B : Obj (animatedAlgebras R)) (n : ℕ) :
    QFun (animatedModules B) (animatedModules B) := by sorry
theorem exteriorPowerZero {R : CommRingCat} (B : Obj (animatedAlgebras R)) (M : Obj (animatedModules B)) :
    Nonempty ((onHCat (derivedExteriorPower B 0)).obj M ≅ animatedModules_unit B) := by sorry
theorem exteriorPowerOne {R : CommRingCat} (B : Obj (animatedAlgebras R)) (M : Obj (animatedModules B)) :
    Nonempty ((onHCat (derivedExteriorPower B 1)).obj M ≅ M) := by sorry
theorem exteriorPowerBaseChange {R : CommRingCat} {B B' : Obj (animatedAlgebras R)} (g : B ⟶ B') (n : ℕ)
    (M : Obj (animatedModules B)) :
    Nonempty ((onHCat (animatedModules_baseChange g)).obj ((onHCat (derivedExteriorPower B n)).obj M) ≅
      (onHCat (derivedExteriorPower B' n)).obj ((onHCat (animatedModules_baseChange g)).obj M)) := by sorry
/-- Test `derivedExteriorPower_rank_one`, ordinary shadow: in Mathlib's exterior power the square
of a vector vanishes, also over `𝔽₂`. -/
theorem derivedExteriorPower_rank_one (k : Type) [Field k] (x : k) :
    exteriorPower.ιMulti k 2 (fun _ : Fin 2 => x) = 0 := by sorry
-- Not stated here: exteriorPowerFlat, exteriorPowerMul and the tests
-- derivedExteriorPower_zero_module, _free and _smooth.

end WholeRoadmapMonoidal

end TauCeti.EnhancedDerivedSheaves
