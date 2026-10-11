/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers can
converge on names and signatures; they are not an implementation.

Codex — codex-XRohZZ, issue #719, 2026-10-11.
Independent review: Codex — codex-KAgYbr, issue #396, 2026-10-11.
Continues the checkpoints and the unmerged codex-BCQSXl target proposal (#8010).
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Elaboration checks included signatures only; every proposed proof remains unimplemented.
The packet's suggestedCoverage specifies exact included and omitted APIs/tests and
partial carrier signatures. Unexpressed higher conditions are omitted as §13 requires.
No theorem here replaces its conclusion by an assumed field.
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

universe u v w z
open CategoryTheory CategoryTheory.Limits Opposite
open scoped Simplicial ZeroObject
namespace TauCeti.EnhancedSheaves
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

end TauCeti.EnhancedSheaves
