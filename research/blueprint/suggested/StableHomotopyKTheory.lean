import Mathlib.AlgebraicTopology.SingularSet
import Mathlib.AlgebraicTopology.SimplicialSet.Nerve
import Mathlib.AlgebraicTopology.SimplicialSet.StdSimplex
import Mathlib.AlgebraicTopology.SimplicialSet.KanComplex
import Mathlib.AlgebraicTopology.SimplicialSet.Degenerate
import Mathlib.AlgebraicTopology.SingularHomology.Basic
import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup
import Mathlib.AlgebraicTopology.DoldKan.Equivalence
import Mathlib.AlgebraicTopology.ModelCategory.Basic
import Mathlib.Topology.Homotopy.HomotopyGroup
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Topology.Homotopy.HSpaces
import Mathlib.Analysis.Complex.Circle
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.Topology.CWComplex.Classical.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.CategoryTheory.Core
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.CategoryTheory.Action
import Mathlib.CategoryTheory.ConnectedComponents
import Mathlib.CategoryTheory.Groupoid.FreeGroupoidOfCategory
import Mathlib.CategoryTheory.Grothendieck
import Mathlib.CategoryTheory.FiberedCategory.Fibered
import Mathlib.CategoryTheory.FiberedCategory.Fiber
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Localization.Construction
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.CategoryTheory.Triangulated.Triangulated
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import Mathlib.CategoryTheory.Triangulated.SpectralObject
import Mathlib.Algebra.Homology.SpectralObject.Basic
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Module.Torsion.Basic


/-!
# Suggested Lean signatures: homotopy foundations for algebraic K-theory

Roadmap `StableHomotopyKTheory` ("Algebraic topology of spaces and manifolds, Part II: homotopy
foundations for algebraic K-theory", RS-33), layers H.1–H.6.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/StableHomotopyKTheory.md` and its packet are definitive; the
statements below only suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every definition, construction, API item and unit test of the packet appears
below under the packet's name (unit tests as `example`s whose docstring carries the test name),
and every lemma and theorem node appears as a `theorem` whose docstring carries the node id.
Everything is proved by `sorry`; nothing here is an implementation. Where a statement needs
infrastructure that neither pin has (functoriality of homotopy groups on based maps, smash
products of maps of simplicial sets, homotopy colimits, and similar), its intended signature is
written as a comment headed `signature (not yet statable at the pins)` together with the reason,
instead of a placeholder proposition.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Build note: the shared build available to this job compiles Mathlib at the pin but only the
adic-space part of Tau Ceti, so this file imports Mathlib only. The four Tau Ceti declarations it
needs (`HomotopyGroup.map`, `TauCeti.homotopyGroupMulEquivOfPath`,
`TauCeti.IsEilenbergMacLaneSpaceOne`, `TauCeti.LocalCoefficientSystem`) appear in the section
`Stub` below as `sorry`-bodied stand-ins with the same shape; they are to be replaced by the
Tau Ceti imports, not developed further. Conditions that cannot be stated without missing
infrastructure (for instance the equivariance axiom of symmetric spectra, which needs smash
products of maps) are left out and say so; no proposition is replaced by `sorry`.
-/

set_option autoImplicit false
noncomputable section

open CategoryTheory CategoryTheory.Limits Simplicial

universe u v

namespace StableHomotopyKTheory.Stub

/-- Stand-in for Tau Ceti's `HomotopyGroup.map` (`TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`):
the map on `π_ n` induced by a based continuous map. Replace by the Tau Ceti import. -/
def piMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (n : ℕ) (f : C(X, Y)) (x : X) :
    HomotopyGroup.Pi n X x → HomotopyGroup.Pi n Y (f x) := sorry

/-- Stand-in for Tau Ceti's `TauCeti.homotopyGroupMulEquivOfPath` (change of basepoint along a path),
here only as a function. Replace by the Tau Ceti import. -/
def piOfPath {X : Type u} [TopologicalSpace X] (n : ℕ) {x y : X} (γ : Path x y) :
    HomotopyGroup.Pi n X x → HomotopyGroup.Pi n X y := sorry

/-- Stand-in for Tau Ceti's `TauCeti.fundamentalGroupMulAut` (the action of `π₁` on `π_n`), here only as a
function. Replace by the Tau Ceti import. -/
def pi1Act {X : Type u} [TopologicalSpace X] (n : ℕ) (x : X) :
    FundamentalGroup X x → HomotopyGroup.Pi n X x → HomotopyGroup.Pi n X x := sorry

/-- Tau Ceti's `TauCeti.LocalCoefficientSystem R X` is by definition this functor category. -/
abbrev LocalCoefficientSystem (R : Type u) [Ring R] (X : TopCat.{u}) :=
  FundamentalGroupoid X ⥤ ModuleCat.{u} R

/-- Shape of Tau Ceti's `TauCeti.IsEilenbergMacLaneSpaceOne G X x`: path-connected, `π₁ ≃* G`, and
vanishing higher homotopy groups. Stated with Mathlib notions so that it is a genuine condition. -/
def IsKOne (G : Type u) [Group G] (X : Type u) [TopologicalSpace X] (x : X) : Prop :=
  PathConnectedSpace X ∧ Nonempty (FundamentalGroup X x ≃* G) ∧
    ∀ n : ℕ, Subsingleton (HomotopyGroup.Pi (n + 2) X x)

/-- Singular homology with coefficients in a ring `R`, in degree `n` (Mathlib). -/
abbrev singH (R : Type u) [CommRing R] (n : ℕ) (X : TopCat.{u}) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).obj X

end StableHomotopyKTheory.Stub

open StableHomotopyKTheory

/-! ## H.1 — Nerves, classifying spaces and basepoints -/

namespace CategoryTheory

variable {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]

/-- `H.1/nerve-and-classifying-space`: the classifying space `BC = |NC|`. -/
def classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} := SSet.toTop.obj (nerve C)

/-- The map `BF = |NF|` induced by a functor. -/
def classifyingSpaceMap (F : C ⥤ D) : classifyingSpace C ⟶ classifyingSpace D :=
  SSet.toTop.map (nerveMap F)

theorem classifyingSpaceMap_id : classifyingSpaceMap (𝟭 C) = 𝟙 (classifyingSpace C) := sorry

theorem classifyingSpaceMap_comp (F : C ⥤ D) (G : D ⥤ E) :
    classifyingSpaceMap (F ⋙ G) = classifyingSpaceMap F ≫ classifyingSpaceMap G := sorry

/-- `B` as a functor `Cat ⥤ TopCat`. -/
def classifyingSpaceFunctor : Cat.{v, u} ⥤ TopCat.{max u v} := nerveFunctor ⋙ SSet.toTop

/-- The vertex `[X]` of `BC` given by an object. -/
def classifyingSpace_vertex (X : C) : classifyingSpace C := sorry

/-- The edge path from `[X]` to `[Y]` given by a morphism. -/
def classifyingSpace_edge {X Y : C} (f : X ⟶ Y) :
    Path (classifyingSpace_vertex X) (classifyingSpace_vertex Y) := sorry

theorem classifyingSpace_eq_toTop_nerve : classifyingSpace C = SSet.toTop.obj (nerve C) := rfl

/-- `classifyingSpace_fin_two_homeomorph_unitInterval` (computation). -/
example : Nonempty (classifyingSpace (Fin 2) ≃ₜ unitInterval) := sorry

/-- `classifyingSpace_empty` (degenerate). -/
example : IsEmpty (classifyingSpace (Discrete PEmpty.{1})) ∧
    Subsingleton (classifyingSpace (Discrete PUnit.{1})) := sorry

/-- `classifyingSpace_discrete` (computation): for a set `S`, `B(Discrete S) ≃ S` (discrete). -/
example (S : Type) [TopologicalSpace S] [DiscreteTopology S] :
    Nonempty (classifyingSpace (Discrete S) ≃ₜ S) := sorry

/-- `classifyingSpaceMap_not_full` (non-example). -/
example : ∃ g : classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2),
    ∀ F : Fin 2 ⥤ Fin 2, classifyingSpaceMap F ≠ g := sorry

/-- `H.1/classifying-space-cw-structure`: the CW structure on a realisation. -/
@[instance_reducible] def _root_.SSet.toTopCWComplex (X : SSet.{u}) :
    Topology.CWComplex (Set.univ : Set (SSet.toTop.obj X)) := sorry

/-- The `n`-cells of the CW structure are the nondegenerate `n`-simplices. -/
def _root_.SSet.toTopCWComplex_cell_equiv (X : SSet.{u}) (n : ℕ) :
    letI := SSet.toTopCWComplex X
    Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj X)) n ≃ X.nonDegenerate n := sorry

/-- Realisations of simplicial maps are cellular. -/
theorem _root_.SSet.toTop_map_cellular {X Y : SSet.{u}} (f : X ⟶ Y) (n : ℕ) :
    letI := SSet.toTopCWComplex X
    letI := SSet.toTopCWComplex Y
    ∀ i : Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj X)) n,
      (SSet.toTop.map f).hom ''
          Topology.RelCWComplex.closedCell (C := (Set.univ : Set (SSet.toTop.obj X))) n i ⊆
        ⋃ (k : ℕ) (_ : k ≤ n) (j : Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj Y)) k),
          Topology.RelCWComplex.closedCell (C := (Set.univ : Set (SSet.toTop.obj Y))) k j := sorry

/-- A subcategory gives a subcomplex: the inclusion of classifying spaces is a closed embedding. -/
theorem classifyingSpace_subcomplex (F : C ⥤ D) [F.Faithful] (hF : Function.Injective F.obj) :
    Topology.IsClosedEmbedding (classifyingSpaceMap F) := sorry

/-- `toTopCWComplex_stdSimplex_cells` (computation). -/
example (n k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk n))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk n)))) k) = Nat.choose (n + 1) (k + 1) := sorry

/-- `toTopCWComplex_point` (degenerate). -/
example (k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk 0))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk 0)))) k) = if k = 0 then 1 else 0 := sorry

/- `toTopCWComplex_compat_skeleton` (compatibility). -/
-- signature (not yet statable at the pins): example (X : SSet.{u}) (n : ℕ) : the realisation of the
-- simplicial `n`-skeleton `X.skeleton n` is the CW `n`-skeleton of `SSet.toTop.obj X`; stating it needs
-- the realisation of a simplicial subcomplex as a CW subcomplex, which neither pin provides.

/-- `toTopCWComplex_not_all_simplices` (non-example): the 1-cells of `BG` are the non-identity elements. -/
example (G : Type u) [Group G] [Finite G] :
    letI := SSet.toTopCWComplex (nerve (SingleObj G))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (nerve (SingleObj G)))) 1) =
      Nat.card G - 1 := sorry

/-- `H.1/classifying-space-op-homeomorph`: `B(Cᵒᵖ) ≃ₜ BC`, not induced by a functor. -/
theorem classifyingSpaceOpHomeomorph (C : Type u) [Category.{v} C] :
    Nonempty (classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C) := sorry

/-- `H.1/classifying-space-prod`: `B(C × D) → BC × BD` is a homeomorphism when `BC` is finite. -/
theorem classifyingSpaceProdHomeomorph (C D : Type u) [Category.{v} C] [Category.{v} D]
    [Finite (Σ n, (nerve C).nonDegenerate n)] :
    Nonempty (classifyingSpace (C × D) ≃ₜ (classifyingSpace C × classifyingSpace D)) := sorry

/-- `H.1/natural-transformations-adjoints-contractibility`: a natural transformation gives a homotopy. -/
theorem NatTrans.classifyingSpaceHomotopic {F G : C ⥤ D} (η : F ⟶ G) :
    ContinuousMap.Homotopic (classifyingSpaceMap F).hom (classifyingSpaceMap G).hom := sorry

/-- `H.1/adjunction-homotopy-equivalence`. -/
theorem Adjunction.classifyingSpaceHomotopyEquiv {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap L).hom := sorry

/-- `H.1/contractible-of-initial-or-terminal`. -/
theorem classifyingSpace_contractible_of_hasInitial [HasInitial C] :
    ContractibleSpace (classifyingSpace C) := sorry

theorem classifyingSpace_contractible_of_hasTerminal [HasTerminal C] :
    ContractibleSpace (classifyingSpace C) := sorry

/- `H.1/filtered-colimits-of-categories`: homotopy groups commute with filtered colimits. -/
-- signature (not yet statable at the pins): theorem classifyingSpace_pi_filtered_colimit {I : Type u} [SmallCategory I] [IsFiltered I]
--       (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c) (n : ℕ) (X : ∀ i, F.obj i)
-- The precise form (an isomorphism `colim_i π_n(BC_i, [X_i]) ≅ π_n(BC, [X])`) needs the functoriality
-- of `π_n` on based maps (Tau Ceti `HomotopyGroup.map`, stubbed above) and a filtered colimit of sets.

/-- `H.1/filtered-colimit-homotopy-equivalence`. -/
theorem classifyingSpace_filtered_homotopyEquivalence {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (h : ∀ ⦃i j : I⦄ (f : i ⟶ j), ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i))
      (classifyingSpace (F.obj j)),
      e.toFun = (classifyingSpaceMap (F.map f).toFunctor).hom) (i : I) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i)) (classifyingSpace c.pt),
      e.toFun = (classifyingSpaceMap (c.ι.app i).toFunctor).hom := sorry

/-- `H.1/filtered-category-contractible`. -/
theorem classifyingSpace_contractible_of_isFiltered [IsFiltered C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- `H.1/filtered-colimit-homology`: integral homology commutes with filtered colimits of categories. -/
theorem classifyingSpace_homology_filtered_colimit {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c) (n : ℕ) :
    Nonempty (IsColimit ((classifyingSpaceFunctor ⋙
      (AlgebraicTopology.singularHomologyFunctor (ModuleCat.{max u v} (ULift.{max u v} ℤ)) n).obj
        (ModuleCat.of (ULift.{max u v} ℤ) (ULift.{max u v} ℤ))).mapCocone c)) := sorry

/-- `H.1/pi0-classifying-space`: `π₀(BC)` is the set of components of `C`. -/
theorem classifyingSpace_zerothHomotopy :
    Nonempty (ZerothHomotopy (classifyingSpace C) ≃ CategoryTheory.ConnectedComponents C) := sorry

/-- `H.1/coverings-fundamental-group-local-coefficients`: coverings of `BC` are morphism-inverting
functors `C ⥤ Type`; equivalently functors out of the free groupoid `FreeGroupoid C`. -/
theorem classifyingSpace_coverings_equiv :
    Nonempty ((FreeGroupoid C ⥤ Type (max u v)) ≌
      (FundamentalGroupoid (classifyingSpace C) ⥤ Type (max u v))) := sorry

/-- `H.1/fundamental-groupoid-localization`: `π₁(BC, [X]) ≅ Aut_{C[C⁻¹]}(X)`. -/
theorem classifyingSpace_fundamentalGroup (X : C) :
    Nonempty (FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex X) ≃*
      Aut ((FreeGroupoid.of C).obj X)) := sorry

/-- `H.1/maximal-tree-presentation` (stated for one-object categories: `π₁(BM)` is the group
completion of the monoid `M`; the general maximal-tree presentation is the node statement). -/
theorem classifyingSpace_fundamentalGroup_singleObj (G : Type u) [Group G] :
    Nonempty (FundamentalGroup (classifyingSpace (SingleObj G))
      (classifyingSpace_vertex (SingleObj.star G)) ≃* G) := sorry

/-- `H.1/local-systems-as-functors`: local systems on `BC` are morphism-inverting functors. -/
theorem classifyingSpace_localSystems_equiv (R : Type (max u v)) [Ring R] :
    Nonempty ((FreeGroupoid C ⥤ ModuleCat.{max u v} R) ≌
      Stub.LocalCoefficientSystem R (classifyingSpace C)) := sorry

/-- `H.1/category-homology`: the chain complex `⊕_{X₀ → ⋯ → X_n} M(X₀)`. -/
def categoryChainComplex (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    ChainComplex (ModuleCat.{max u v} R) ℕ := sorry

/-- The homology `H_n(C; M)`. -/
def categoryHomology (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) (n : ℕ) : ModuleCat.{max u v} R :=
  (categoryChainComplex R M).homology n

def categoryHomology.map (R : Type (max u v)) [Ring R] {M M' : C ⥤ ModuleCat.{max u v} R} (φ : M ⟶ M') (n : ℕ) :
    categoryHomology R M n ⟶ categoryHomology R M' n := sorry

def categoryHomology.mapOfFunctor (R : Type (max u v)) [Ring R] (F : C ⥤ D) (M : D ⥤ ModuleCat.{max u v} R)
    (n : ℕ) : categoryHomology R (F ⋙ M) n ⟶ categoryHomology R M n := sorry

/-- Connecting maps of the long exact sequence for a short exact sequence of coefficients. -/
def categoryHomology.longExactSequence (R : Type (max u v)) [Ring R]
    (S : ShortComplex (C ⥤ ModuleCat.{max u v} R)) (hS : S.ShortExact) (n : ℕ) :
    categoryHomology R S.X₃ (n + 1) ⟶ categoryHomology R S.X₁ n := sorry

def categoryHomologyZeroIsoColimit (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    categoryHomology R M 0 ≅ colimit M := sorry

-- signature (not yet statable at the pins): def categoryHomology.normalizedIso (R : Type (max u v)) [Ring R]
--     (M : C ⥤ ModuleCat.{max u v} R) (n : ℕ) :
--     ((AlgebraicTopology.normalizedMooreComplex _).obj (categorySimplicialModule R M)).homology n ≅
--       categoryHomology R M n
-- It needs `categorySimplicialModule R M : SimplicialObject (ModuleCat R)`, the simplicial module
-- `n ↦ ⊕_{σ ∈ (nerve C) _[n]} M (σ.obj 0)` whose alternating face complex is `categoryChainComplex`.

/-- `categoryHomology_zero_eq_colimit_const` (computation). -/
example (R : Type (max u v)) [Ring R] [IsConnected C] (A : ModuleCat.{max u v} R) :
    Nonempty (categoryHomology R ((Functor.const C).obj A) 0 ≅ A) := sorry

/-- `categoryHomology_of_terminal` (degenerate). -/
example (R : Type (max u v)) [Ring R] [HasTerminal C] (M : C ⥤ ModuleCat.{max u v} R) (n : ℕ) :
    IsZero (categoryHomology R M (n + 1)) ∧ Nonempty (categoryHomology R M 0 ≅ M.obj (⊤_ C)) := sorry

/-- `categoryHomology_singleObj_compat` (compatibility). -/
example (k G : Type u) [CommRing k] [Group G] (A : Rep k G) (n : ℕ) :
    Nonempty (categoryHomology k ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) n ≅ groupHomology A n) := sorry

/-- `categoryHomology_not_cohomology` (non-example): `H₂(ℤ/2; ℤ) = 0`. -/
example : ∀ M : SingleObj (Multiplicative (ZMod 2)) ⥤ ModuleCat.{0} ℤ,
    (∀ g : SingleObj.star (Multiplicative (ZMod 2)) ⟶ SingleObj.star _, M.map g = 𝟙 _) →
    (M.obj (SingleObj.star _) = ModuleCat.of ℤ ℤ) → IsZero (categoryHomology ℤ M 2) := sorry

/-- `H.1/category-homology-derived-colimit`: `H_n(C; −)` are the left derived functors of `colim`
(stated as vanishing on representable projectives together with `H₀ = colim`). -/
theorem categoryHomology_isDerivedColimit (R : Type (max u v)) [Ring R] (X : C) (n : ℕ) :
    IsZero (categoryHomology R (coyoneda.obj (Opposite.op X) ⋙ uliftFunctor.{u} ⋙
      (ModuleCat.free R)) (n + 1)) := sorry

/-- `H.1/homology-of-small-categories`: `H_n(BC; L) ≅ H_n(C; L)` (constant coefficients shown). -/
theorem categoryHomology_iso_singular (R : Type (max u v)) [CommRing R] (n : ℕ) :
    Nonempty (categoryHomology R ((Functor.const C).obj (ModuleCat.of R R)) n ≅
      Stub.singH R n (classifyingSpace C)) := sorry

end CategoryTheory

/-- `H.1/classifying-space-of-group`: `BG = B(SingleObj G)`. -/
def Group.classifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  CategoryTheory.classifyingSpace (SingleObj G)

namespace Group.classifyingSpace

variable {G H : Type u} [Group G] [Group H]

def map (φ : G →* H) : Group.classifyingSpace G ⟶ Group.classifyingSpace H :=
  CategoryTheory.classifyingSpaceMap (SingleObj.mapHom G H φ)

def basepoint (G : Type u) [Group G] : Group.classifyingSpace G :=
  CategoryTheory.classifyingSpace_vertex (SingleObj.star G)

def loop (g : G) : Path (basepoint G) (basepoint G) := CategoryTheory.classifyingSpace_edge (C := SingleObj G) g

instance pathConnected (G : Type u) [Group G] : PathConnectedSpace (Group.classifyingSpace G) := sorry

def fundamentalGroupMulEquiv (G : Type u) [Group G] :
    FundamentalGroup (Group.classifyingSpace G) (basepoint G) ≃* G := sorry

def homologyIso (G : Type u) [Group G] (n : ℕ) :
    Stub.singH (ULift ℤ) n (Group.classifyingSpace G) ≅
      groupHomology (Rep.trivial (ULift ℤ) G (ULift ℤ)) n := sorry

end Group.classifyingSpace

/-- `classifyingSpace_trivial_contractible` (degenerate). -/
example : ContractibleSpace (Group.classifyingSpace (Unit : Type)) := sorry

/-- `classifyingSpace_H1_abelianization` (computation). -/
example (G : Type) [Group G] :
    Nonempty (Stub.singH ℤ 1 (Group.classifyingSpace G) ≃+ Additive (Abelianization G)) := sorry

/-- `classifyingSpace_zmod2_cells` (computation). -/
example (k : ℕ) : letI := SSet.toTopCWComplex (nerve (SingleObj (Multiplicative (ZMod 2))))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj
      (nerve (SingleObj (Multiplicative (ZMod 2)))))) k) = 1 := sorry

/-- `classifyingSpace_conj_freely_homotopic` (characterisation). -/
example {G H : Type} [Group G] [Group H] (φ : G →* H) (h : H) :
    ContinuousMap.Homotopic (Group.classifyingSpace.map φ).hom
      (Group.classifyingSpace.map ((MulAut.conj h).toMonoidHom.comp φ)).hom := sorry

/-- `classifyingSpace_not_contractible_Z` (non-example). -/
example : ¬ ContractibleSpace (Group.classifyingSpace (Multiplicative ℤ)) := sorry

/-- `H.1/translation-category-classifying-space`: `B(∫_G G)` is contractible. -/
theorem Group.classifyingSpace_translation_contractible (G : Type u) [Group G] :
    ContractibleSpace (CategoryTheory.classifyingSpace (CategoryTheory.ActionCategory G G)) := sorry

/-- `H.1/classifying-space-of-group-is-KG1`. -/
theorem Group.classifyingSpace_isKOne (G : Type u) [Group G] :
    Stub.IsKOne G (Group.classifyingSpace G) (Group.classifyingSpace.basepoint G) := sorry

/-- `H.1/conjugate-homomorphisms-freely-homotopic`. -/
theorem Group.classifyingSpace_map_conj_homotopic {G H : Type u} [Group G] [Group H]
    (φ : G →* H) (h : H) :
    ContinuousMap.Homotopic (Group.classifyingSpace.map φ).hom
      (Group.classifyingSpace.map ((MulAut.conj h).toMonoidHom.comp φ)).hom := sorry

/-- `H.1/bar-complex-comparison`: `H_n(BG; M) ≅ H_n(G; M)` via the bar construction. -/
theorem Group.categoryHomology_singleObj_iso (k G : Type u) [CommRing k] [Group G] (A : Rep k G)
    (n : ℕ) : Nonempty (CategoryTheory.categoryHomology k
      ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) n ≅ groupHomology A n) := sorry

/-- `H.1/groupoid-nerve-one-type`. -/
theorem CategoryTheory.Groupoid.nerve_kanComplex (C : Type u) [Groupoid.{u} C] :
    SSet.KanComplex (nerve C) := sorry

/-! ## H.2 — Homotopy fibres and Quillen's theorems -/

namespace TauCeti

open Topology

/-- `H.2/weak-homotopy-equivalence`: bijective on every `π_n`, `n ≥ 0`, at every basepoint
(`π_0` at all basepoints is the bijection on path components); the first clause makes `π_0`
surjective when `X` is empty. -/
def IsWeakHomotopyEquivalence {X Y : TopCat.{u}} (f : X ⟶ Y) : Prop :=
  (IsEmpty X → IsEmpty Y) ∧ ∀ (n : ℕ) (x : X), Function.Bijective (Stub.piMap n f.hom x)

theorem IsWeakHomotopyEquivalence.comp {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsWeakHomotopyEquivalence f) (hg : IsWeakHomotopyEquivalence g) :
    IsWeakHomotopyEquivalence (f ≫ g) := sorry

theorem _root_.ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence {X Y : TopCat.{u}}
    (e : ContinuousMap.HomotopyEquiv X Y) : IsWeakHomotopyEquivalence (TopCat.ofHom e.toFun) := sorry

theorem IsWeakHomotopyEquivalence.of_homotopic {X Y : TopCat.{u}} {f g : X ⟶ Y}
    (h : ContinuousMap.Homotopic f.hom g.hom) (hf : IsWeakHomotopyEquivalence f) :
    IsWeakHomotopyEquivalence g := sorry

theorem IsWeakHomotopyEquivalence.homotopyEquiv_of_cw {X Y : TopCat.{u}}
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] {f : X ⟶ Y}
    (hf : IsWeakHomotopyEquivalence f) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `isWeakHomotopyEquivalence_id` (degenerate). -/
example (X : TopCat.{u}) : IsWeakHomotopyEquivalence (𝟙 X) := sorry

/-- `isWeakHomotopyEquivalence_contractible` (computation). -/
example {X Y : TopCat.{u}} [ContractibleSpace X] [ContractibleSpace Y] (f : X ⟶ Y) :
    IsWeakHomotopyEquivalence f := sorry

/-- `isWeakHomotopyEquivalence_not_pi0` (non-example). -/
example : ¬ IsWeakHomotopyEquivalence
    (TopCat.ofHom (ContinuousMap.const PUnit.{1} (ULift.up true : ULift.{0} Bool)) :
      TopCat.of PUnit.{1} ⟶ TopCat.of (ULift.{0} Bool)) := sorry

/-- `isWeakHomotopyEquivalence_iff_homotopyEquiv_cw` (compatibility). -/
example {X Y : TopCat.{u}} [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] (f : X ⟶ Y) :
    IsWeakHomotopyEquivalence f ↔ ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

variable {A B : TopCat.{u}}

/-- `H.2/homotopy-fibre-and-long-exact-sequence`: pairs `(a, γ)` with `γ 0 = f a`, `γ 1 = b`. -/
def homotopyFiber (f : A ⟶ B) (b : B) : TopCat.{u} :=
  TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1 ∧ p.2 1 = b}

namespace homotopyFiber

def proj (f : A ⟶ B) (b : B) : homotopyFiber f b ⟶ A :=
  TopCat.ofHom ⟨fun p => p.1.1, sorry⟩

def basepoint (f : A ⟶ B) (a₀ : A) : homotopyFiber f (f.hom a₀) :=
  ⟨(a₀, ContinuousMap.const _ (f.hom a₀)), rfl, rfl⟩

def ofFiber (f : A ⟶ B) (b : B) : {a : A // f.hom a = b} → homotopyFiber f b :=
  fun a => ⟨(a.1, ContinuousMap.const _ b), a.2.symm, rfl⟩

/-- A commutative square induces a map of homotopy fibres. -/
def map {A' B' : TopCat.{u}} {f' : A' ⟶ B'} {f : A ⟶ B} (α : A' ⟶ A) (β : B' ⟶ B)
    (w : f' ≫ β = α ≫ f) (b' : B') : homotopyFiber f' b' ⟶ homotopyFiber f (β.hom b') := sorry

def loopSpaceInclusion (f : A ⟶ B) (a₀ : A) : LoopSpace B (f.hom a₀) → homotopyFiber f (f.hom a₀) :=
  fun ω => ⟨(a₀, ⟨ω, ω.continuous⟩), ω.source, ω.target⟩

def ofHomotopy {f g : A ⟶ B} (H : ContinuousMap.Homotopy f.hom g.hom) (b : B) :
    ContinuousMap.HomotopyEquiv (homotopyFiber f b) (homotopyFiber g b) := sorry

/-- Weibel's convention: paths from `b` to `f a`. -/
def reverseHomeomorph (f : A ⟶ B) (b : B) :
    homotopyFiber f b ≃ₜ {p : A × C(unitInterval, B) // p.2 0 = b ∧ p.2 1 = f.hom p.1} := sorry

end homotopyFiber

/-- The comparison map from `F` to the homotopy fibre, given a strict null-composite. -/
def fiberSequenceMap {F : TopCat.{u}} (i : F ⟶ A) (f : A ⟶ B) (b : B)
    (h : ∀ x, f.hom (i.hom x) = b) : F ⟶ homotopyFiber f b :=
  TopCat.ofHom ⟨fun x => ⟨(i.hom x, ContinuousMap.const _ b), (h x).symm, rfl⟩, sorry⟩

/-- `TauCeti.IsHomotopyFiberSequence`. -/
def IsHomotopyFiberSequence {F : TopCat.{u}} (i : F ⟶ A) (f : A ⟶ B) (b : B) : Prop :=
  ∃ h : ∀ x, f.hom (i.hom x) = b, IsWeakHomotopyEquivalence (fiberSequenceMap i f b h)

/-- `homotopyFiber_id_contractible` (degenerate). -/
example (b : B) : ContractibleSpace (homotopyFiber (𝟙 B) b) := sorry

/-- `homotopyFiber_point_eq_loopSpace` (computation). -/
example (b : B) : Nonempty (homotopyFiber
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit.{u + 1} ⟶ B) b ≃ₜ
      LoopSpace B b) := sorry

/-- `homotopyFiber_toPoint` (computation). -/
example : Nonempty (homotopyFiber
    (TopCat.ofHom (ContinuousMap.const A PUnit.unit) : A ⟶ TopCat.of PUnit.{u + 1}) PUnit.unit ≃ₜ
      A) := sorry

/-- `homotopyFiber_ofFiber_not_weakEquiv` (non-example): for `H ⊂ G`, `π₀` of the homotopy fibre of
`BH → BG` is `G ⧸ H`, while the strict fibre over the vertex is a point. -/
example (G : Type u) [Group G] (H : Subgroup G) :
    Nonempty (ZerothHomotopy (homotopyFiber (Group.classifyingSpace.map H.subtype)
      (Group.classifyingSpace.basepoint G)) ≃ G ⧸ H) := sorry

/-- `H.2/mapping-path-space-fibration`: `A` is homotopy equivalent to the mapping path space `E_f`,
over `B`. -/
theorem mappingPathSpace_homotopyEquiv (f : A ⟶ B) :
    Nonempty (ContinuousMap.HomotopyEquiv A
      (TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1})) := sorry

/-- `H.2/fibre-to-homotopy-fibre` (stated for maps with the homotopy lifting property for all spaces). -/
theorem homotopyFiber.ofFiber_homotopyEquiv (p : A ⟶ B)
    (hp : ∀ (Y : TopCat.{u}) (H : C(Y × unitInterval, B)) (g₀ : C(Y, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C(Y × unitInterval, A), ∀ y t, p.hom (G (y, t)) = H (y, t) ∧
        G (y, 0) = g₀ y) (b : B) :
    ∃ e : ContinuousMap.HomotopyEquiv (TopCat.of {a : A // p.hom a = b}) (homotopyFiber p b),
      ∀ a, e.toFun a = homotopyFiber.ofFiber p b a := sorry

/-- `H.2/connecting-map`. -/
def homotopyFiber.connecting (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    HomotopyGroup.Pi (n + 1) B (f.hom a₀) →
      HomotopyGroup.Pi n (homotopyFiber f (f.hom a₀)) (homotopyFiber.basepoint f a₀) := sorry

def homotopyFiber.connectingHom (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    HomotopyGroup.Pi (n + 2) B (f.hom a₀) →*
      HomotopyGroup.Pi (n + 1) (homotopyFiber f (f.hom a₀)) (homotopyFiber.basepoint f a₀) := sorry

-- signature (not yet statable at the pins): theorem homotopyFiber.connecting_naturality {A' B' : TopCat.{u}} {f' : A' ⟶ B'} (f : A ⟶ B)
--       (α : A' ⟶ A) (β : B' ⟶ B) (w : f' ≫ β = α ≫ f) (a₀ : A') (n : ℕ)
-- The commuting square of `connecting` with `Stub.piMap` needs the basepoint identification
-- `β (f' a₀) = f (α a₀)` transported along `w`; it is the node statement.

-- signature (not yet statable at the pins): theorem homotopyFiber.connecting_eq_loopShift (f : A ⟶ B) (a₀ : A) (n : ℕ)
-- `connecting = (loopSpaceInclusion)_* ∘ (loop-space shift)`: the shift is Tau Ceti's
-- `HomotopyGroup.pathLoopSpaceMulEquiv`, not imported here.

/-- `connecting_id_eq_zero` (degenerate). -/
example (a₀ : B) (n : ℕ) (x : HomotopyGroup.Pi (n + 2) B ((𝟙 B : B ⟶ B).hom a₀)) :
    homotopyFiber.connectingHom (𝟙 B) a₀ n x = 1 := sorry

/-- `connecting_point_bijective` (computation). -/
example (b : B) (n : ℕ) : Function.Bijective (homotopyFiber.connecting
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit.{u + 1} ⟶ B) PUnit.unit n) := sorry

/- `connecting_basepointChange` (compatibility). -/
-- signature (not yet statable at the pins): example (f : A ⟶ B) {a₀ a₁ : A} (γ : Path a₀ a₁) (n : ℕ)
-- The conjugation by `Stub.piOfPath` (Tau Ceti `homotopyGroupMulEquivOfPath`) on both sides.

/- `connecting_not_hom_degree_zero` (non-example): `π₀` of the fibre is only a pointed set; for
`BH → BG` the connecting map `G → G ⧸ H` is the orbit map, a homomorphism for no group structure on
`G ⧸ H` when `H` is not normal. -/
-- signature (not yet statable at the pins): example (G : Type u) [Group G] (H : Subgroup G) (hH : ¬ H.Normal)

/-- `H.2/long-exact-sequence`: exactness at `π_{n+1}(A)` (the other spots are analogous). -/
theorem homotopyFiber.exact_at_total (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (Stub.piMap (n + 1) (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀)) =
      {y | Stub.piMap (n + 1) f.hom a₀ y = 1} := sorry

/-- `H.2/fibre-sequence-low-degree`: `π₁(B)` acts on `π₀` of the fibre with orbits the fibres of
`π₀(F) → π₀(A)`. -/
@[instance_reducible]
def homotopyFiber.fundamentalGroupAction (f : A ⟶ B) (a₀ : A) :
    MulAction (FundamentalGroup B (f.hom a₀)) (ZerothHomotopy (homotopyFiber f (f.hom a₀))) := sorry

theorem homotopyFiber.pi_zero_orbits (f : A ⟶ B) (a₀ : A) :
    letI := homotopyFiber.fundamentalGroupAction f a₀
    ∀ p q : homotopyFiber f (f.hom a₀),
      Joined ((homotopyFiber.proj f (f.hom a₀)).hom p) ((homotopyFiber.proj f (f.hom a₀)).hom q) ↔
        ∃ g : FundamentalGroup B (f.hom a₀),
          g • (show ZerothHomotopy (homotopyFiber f (f.hom a₀)) from _root_.Quotient.mk _ p) =
            (show ZerothHomotopy (homotopyFiber f (f.hom a₀)) from _root_.Quotient.mk _ q) := sorry

/-- `H.2/homotopy-fibre-transport`. -/
def homotopyFiber.transport (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    homotopyFiber f b ⟶ homotopyFiber f b' := sorry

def homotopyFiber.transportHomotopyEquiv (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    ContinuousMap.HomotopyEquiv (homotopyFiber f b) (homotopyFiber f b') := sorry

theorem homotopyFiber.transport_homotopic (f : A ⟶ B) {b b' : B} {ω ω' : Path b b'}
    (h : ω.Homotopic ω') :
    ContinuousMap.Homotopic (homotopyFiber.transport f ω).hom (homotopyFiber.transport f ω').hom := sorry

theorem homotopyFiber.transport_trans (f : A ⟶ B) {b b' b'' : B} (ω : Path b b') (ω' : Path b' b'') :
    ContinuousMap.Homotopic (homotopyFiber.transport f (ω.trans ω')).hom
      ((homotopyFiber.transport f ω').hom.comp (homotopyFiber.transport f ω).hom) := sorry

-- signature (not yet statable at the pins): theorem homotopyFiber.connecting_transport (f : A ⟶ B) {a₀ : A} (n : ℕ)
-- `connecting` intertwines basepoint change on `π_{n+1} B` (`Stub.piOfPath`) with `transport`.

/-- `transport_refl_homotopic_id` (degenerate). -/
example (f : A ⟶ B) (b : B) :
    ContinuousMap.Homotopic (homotopyFiber.transport f (Path.refl b)).hom (ContinuousMap.id _) := sorry

/- `transport_loopSpace` (computation). -/
-- signature (not yet statable at the pins): example (b : B) (ω : Path b b)
-- For `f` the inclusion of `b`, `transport f ω` is right concatenation `γ ↦ γ.trans ω` on `Ω B b`.

/-- `transport_comm_proj` (characterisation). -/
example (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    homotopyFiber.transport f ω ≫ homotopyFiber.proj f b' = homotopyFiber.proj f b := sorry

/- `transport_not_identity_onPi0` (non-example). -/
-- signature (not yet statable at the pins): example (G : Type u) [Group G] (H : Subgroup G) (g : G) (hg : g ∉ H)
-- Transport along the loop of `g` permutes `π₀ = G ⧸ H` by left multiplication, moving the coset `H`.

/-- `H.2/homotopy-pullback`. -/
def homotopyPullback {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) : TopCat.{u} :=
  TopCat.of {p : A × C(unitInterval, B) × C' // p.2.1 0 = f.hom p.1 ∧ p.2.1 1 = g.hom p.2.2}

def homotopyPullback.fst {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) : homotopyPullback f g ⟶ A :=
  TopCat.ofHom ⟨fun p => p.1.1, sorry⟩

def homotopyPullback.symm {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) :
    homotopyPullback f g ≅ homotopyPullback g f := sorry

/-- The comparison map of a commutative square into the homotopy pullback. -/
def homotopyPullback.comparison {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E)
    (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) : E' ⟶ homotopyPullback h p := sorry

/-- `TauCeti.IsHomotopyCartesian`. -/
def IsHomotopyCartesian {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B)
    (w : p' ≫ h = α ≫ p) : Prop :=
  IsWeakHomotopyEquivalence (homotopyPullback.comparison p' p α h w)

def homotopyPullback.point_eq_homotopyFiber (f : A ⟶ B) (b : B) :
    homotopyPullback f (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B) ≅
      homotopyFiber f b := sorry

theorem IsHomotopyCartesian.of_serreFibration {E E' B' : TopCat.{u}} (p : E ⟶ B) (h : B' ⟶ B)
    (hp : ∀ n : ℕ, ∀ (H : C((Fin n → unitInterval) × unitInterval, B)) (g₀ : C(Fin n → unitInterval, E)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C((Fin n → unitInterval) × unitInterval, E),
        ∀ y t, p.hom (G (y, t)) = H (y, t) ∧ G (y, 0) = g₀ y)
    (p' : E' ⟶ B') (α : E' ⟶ E) (w : p' ≫ h = α ≫ p) (hpb : IsLimit (PullbackCone.mk p' α w)) :
    IsHomotopyCartesian p' p α h w := sorry

/-- `homotopyPullback_point_point` (computation). -/
example (b : B) : Nonempty (homotopyPullback
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B)
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B) ≃ₜ LoopSpace B b) := sorry

/-- `isHomotopyCartesian_id` (degenerate). -/
example : IsHomotopyCartesian (𝟙 A) (𝟙 A) (𝟙 A) (𝟙 A) rfl := sorry

/-- `isHomotopyCartesian_iff_fiber` (characterisation). -/
example {E' E B' : TopCat.{u}} [ContractibleSpace B'] (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E)
    (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B') (hp' : ∀ e', p'.hom e' = b')
    (hb : ∀ e, p.hom (α.hom e) = h.hom b') :
    IsHomotopyCartesian p' p α h w ↔ IsWeakHomotopyEquivalence (fiberSequenceMap α p (h.hom b') hb) := sorry

/- `not_isHomotopyCartesian_strictFiber` (non-example). -/
-- signature (not yet statable at the pins): example (G : Type u) [Group G] (H : Subgroup G) (hH : H ≠ ⊤)
-- The square (point → BH over point → BG) fails: `π₀` of the homotopy pullback is `G ⧸ H ≠ *`.

/-- `H.2/homotopy-cartesian-contractible-base`. -/
theorem IsHomotopyCartesian.iff_of_contractible {E' E B' : TopCat.{u}} [ContractibleSpace B']
    (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B')
    (hp' : ∀ e', p'.hom e' = b') (hb : ∀ e, p.hom (α.hom e) = h.hom b') :
    IsHomotopyCartesian p' p α h w ↔ IsWeakHomotopyEquivalence (fiberSequenceMap α p (h.hom b') hb) := sorry

/-- `H.2/homotopy-cartesian-pasting`. -/
theorem IsHomotopyCartesian.paste {X₁ X₂ X₃ Y₁ Y₂ Y₃ : TopCat.{u}} (a₁ : X₁ ⟶ X₂) (a₂ : X₂ ⟶ X₃)
    (b₁ : Y₁ ⟶ Y₂) (b₂ : Y₂ ⟶ Y₃) (v₁ : X₁ ⟶ Y₁) (v₂ : X₂ ⟶ Y₂) (v₃ : X₃ ⟶ Y₃)
    (w₁ : v₁ ≫ b₁ = a₁ ≫ v₂) (w₂ : v₂ ≫ b₂ = a₂ ≫ v₃)
    (h₂ : IsHomotopyCartesian v₂ v₃ a₂ b₂ w₂) :
    IsHomotopyCartesian v₁ v₂ a₁ b₁ w₁ ↔
      IsHomotopyCartesian v₁ v₃ (a₁ ≫ a₂) (b₁ ≫ b₂) (by rw [← Category.assoc, w₁, Category.assoc, w₂, ← Category.assoc]) := sorry

/-- `H.2/quasi-fibration`. -/
def IsQuasiFibration (p : A ⟶ B) : Prop :=
  ∀ b : B, IsWeakHomotopyEquivalence (TopCat.ofHom ⟨homotopyFiber.ofFiber p b, sorry⟩ :
    TopCat.of {a : A // p.hom a = b} ⟶ homotopyFiber p b)

theorem IsQuasiFibration.of_serreFibration (p : A ⟶ B)
    (hp : ∀ n : ℕ, ∀ (H : C((Fin n → unitInterval) × unitInterval, B)) (g₀ : C(Fin n → unitInterval, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C((Fin n → unitInterval) × unitInterval, A),
        ∀ y t, p.hom (G (y, t)) = H (y, t) ∧ G (y, 0) = g₀ y) : IsQuasiFibration p := sorry

theorem IsQuasiFibration.longExactSequence {p : A ⟶ B} (hp : IsQuasiFibration p) (a₀ : A) (n : ℕ) :
    IsWeakHomotopyEquivalence (TopCat.ofHom ⟨homotopyFiber.ofFiber p (p.hom a₀), sorry⟩ :
      TopCat.of {a : A // p.hom a = p.hom a₀} ⟶ homotopyFiber p (p.hom a₀)) := hp _

-- signature (not yet statable at the pins): theorem IsQuasiFibration.iff_relative [PathConnectedSpace B] (p : A ⟶ B)
-- Relative homotopy groups `π_i(E, p⁻¹ b, x₀)` are Tau Ceti AlgebraicTopology stage 8 objects.

/-- `isQuasiFibration_prod_fst` (computation). -/
example (F : TopCat.{u}) : IsQuasiFibration (TopCat.ofHom ⟨Prod.fst, continuous_fst⟩ :
    TopCat.of (B × F) ⟶ B) := sorry

/- `isQuasiFibration_mappingCylinder_iff` (characterisation). -/
-- signature (not yet statable at the pins): example {X Y : TopCat.{u}} (f : X ⟶ Y)
-- Mapping cylinders of spaces are not in Mathlib (Tau Ceti AlgebraicTopology stage 4 constructs them).

/-- `isQuasiFibration_id` (degenerate). -/
example : IsQuasiFibration (𝟙 A) := sorry

/-- `not_isQuasiFibration_two_intervals` (non-example). -/
example : ¬ IsQuasiFibration (TopCat.ofHom ⟨fun (x : Set.Icc (0 : ℝ) (1/2) ⊕ Set.Icc (1/2 : ℝ) 1) =>
    (Sum.elim (fun y : Set.Icc (0 : ℝ) (1/2) => (y : ℝ)) (fun y : Set.Icc (1/2 : ℝ) 1 => (y : ℝ)) x : ℝ),
      sorry⟩ :
      TopCat.of (Set.Icc (0 : ℝ) (1/2) ⊕ Set.Icc (1/2 : ℝ) 1) ⟶ TopCat.of ℝ) := sorry

/-- `H.2/dold-lashof-criteria` (criterion (a): open covers). -/
theorem IsQuasiFibration.of_openCover (p : A ⟶ B) (V₁ V₂ : Set B) (h₁ : IsOpen V₁) (h₂ : IsOpen V₂)
    (hcov : V₁ ∪ V₂ = Set.univ)
    (q : ∀ V : Set B, IsQuasiFibration (TopCat.ofHom ⟨fun (a : p.hom ⁻¹' V) => (⟨p.hom a, a.2⟩ : V), sorry⟩ :
      TopCat.of (p.hom ⁻¹' V) ⟶ TopCat.of V) ∨ (V ≠ V₁ ∧ V ≠ V₂ ∧ V ≠ V₁ ∩ V₂)) :
    IsQuasiFibration p := sorry

/-- `H.2/simplicial-space-realisation`. -/
def SimplicialSpace.realization : SimplicialObject TopCat.{u} ⥤ TopCat.{u} := sorry

def SimplicialSpace.singular : TopCat.{u} ⥤ SimplicialObject TopCat.{u} := sorry

def SimplicialSpace.realizationAdj : SimplicialSpace.realization.{u} ⊣ SimplicialSpace.singular := sorry

def SimplicialSpace.realization_discrete (X : SSet.{u}) :
    SimplicialSpace.realization.obj (X ⋙ TopCat.discrete) ≅ SSet.toTop.obj X := sorry

/-- Bisimplicial sets as simplicial objects in simplicial sets. -/
abbrev BisimplicialSet := SimplicialObject SSet.{u}

def BisimplicialSet.realization (T : BisimplicialSet.{u}) : TopCat.{u} :=
  SimplicialSpace.realization.obj (T ⋙ SSet.toTop)

def BisimplicialSet.diagonal (T : BisimplicialSet.{u}) : SSet.{u} := sorry

/-- The external product `X ⊠ Y` of simplicial sets as a bisimplicial set. -/
def BisimplicialSet.box (X Y : SSet.{u}) : BisimplicialSet.{u} := sorry

theorem SimplicialSpace.realization_preservesColimits :
    PreservesColimits SimplicialSpace.realization.{u} := sorry

/-- `realization_const` (degenerate). -/
example (Y : TopCat.{u}) :
    Nonempty (SimplicialSpace.realization.obj ((Functor.const _).obj Y) ≅ Y) := sorry

/-- `realization_box_stdSimplex` (computation). -/
example (r s : ℕ) : Nonempty (BisimplicialSet.realization
    (BisimplicialSet.box (SSet.stdSimplex.obj (SimplexCategory.mk r))
      (SSet.stdSimplex.obj (SimplexCategory.mk s))) ≃ₜ
    (SSet.toTop.obj (SSet.stdSimplex.obj (SimplexCategory.mk r)) ×
      SSet.toTop.obj (SSet.stdSimplex.obj (SimplexCategory.mk s)))) := sorry

/-- `realization_discrete_compat` (compatibility). -/
example (X : SSet.{u}) :
    Nonempty (SimplicialSpace.realization.obj (X ⋙ TopCat.discrete) ≅ SSet.toTop.obj X) :=
  ⟨SimplicialSpace.realization_discrete X⟩

/-- `bisimplicial_diagonal_not_mathlib_diagonal` (non-example). -/
example : Nonempty (BisimplicialSet.diagonal (BisimplicialSet.box
    (SSet.stdSimplex.obj (SimplexCategory.mk 1)) (SSet.stdSimplex.obj (SimplexCategory.mk 1))) ≅
      nerve (ULift.{0} (Fin 2 × Fin 2))) := sorry

/-- `H.2/bisimplicial-realization-lemma`. -/
theorem BisimplicialSet.realization_iso_diagonal (T : BisimplicialSet.{u}) :
    Nonempty (BisimplicialSet.realization T ≅ SSet.toTop.obj (BisimplicialSet.diagonal T)) := sorry

/-- Hurewicz cofibrations: the homotopy extension property for all targets. -/
def IsHCofibration {X : TopCat.{u}} (S : Set X) : Prop :=
  ∀ (Y : TopCat.{u}) (f : C(X, Y)) (H : C(S × unitInterval, Y)), (∀ s, H (s, 0) = f s) →
    ∃ G : C(X × unitInterval, Y), (∀ x, G (x, 0) = f x) ∧ ∀ (s : S) t, G ((s : X), t) = H (s, t)

/-- `H.2/proper-simplicial-space`. -/
def SimplicialSpace.latching (X : SimplicialObject TopCat.{u}) (n : ℕ) : Set (X _⦋n⦌) :=
  ⋃ (m : ℕ) (_ : m < n) (s : SimplexCategory.mk n ⟶ SimplexCategory.mk m), Set.range (X.map s.op).hom

def SimplicialSpace.IsProper (X : SimplicialObject TopCat.{u}) : Prop :=
  ∀ n, IsHCofibration (SimplicialSpace.latching X n)

theorem SimplicialSpace.isProper_discrete (X : SSet.{u}) :
    SimplicialSpace.IsProper (X ⋙ TopCat.discrete) := sorry

theorem SimplicialSpace.isProper_realization_bisimplicial (T : BisimplicialSet.{u}) :
    SimplicialSpace.IsProper (T ⋙ SSet.toTop) := sorry

/-- `isProper_const` (degenerate). -/
example (Y : TopCat.{u}) : SimplicialSpace.IsProper ((Functor.const _).obj Y) := sorry

/-- `isProper_nerve_discrete_category` (computation). -/
example (C : Type u) [SmallCategory C] : SimplicialSpace.IsProper (nerve C ⋙ TopCat.discrete) := sorry

/-- `isProper_compat_bisimplicial` (compatibility). -/
example (T : BisimplicialSet.{u}) : SimplicialSpace.IsProper (T ⋙ SSet.toTop) ∧
    Nonempty (BisimplicialSet.realization T ≅ SSet.toTop.obj (BisimplicialSet.diagonal T)) := sorry

/-- `not_isProper_bad_degeneracy` (non-example). -/
example : ∃ X : SimplicialObject TopCat.{0}, ¬ SimplicialSpace.IsProper X := sorry

/- `H.2/realisation-preserves-finite-limits` (binary products shown). -/
-- signature (not yet statable at the pins): theorem SimplicialSpace.realization_prod (X Y : SimplicialObject TopCat.{u})
-- In compactly generated weak Hausdorff spaces; Mathlib's `TopCat` product is not k-ified.

/-- `H.2/gluing-lemma`. -/
theorem gluingLemma {X₀ X₁ X₂ Y₀ Y₁ Y₂ : TopCat.{u}} (i : X₀ ⟶ X₁) (j : X₀ ⟶ X₂) (i' : Y₀ ⟶ Y₁)
    (j' : Y₀ ⟶ Y₂) (f₀ : X₀ ⟶ Y₀) (f₁ : X₁ ⟶ Y₁) (f₂ : X₂ ⟶ Y₂)
    (w₁ : i ≫ f₁ = f₀ ≫ i') (w₂ : j ≫ f₂ = f₀ ≫ j')
    (hi : IsHCofibration (Set.range i.hom)) (hi' : IsHCofibration (Set.range i'.hom))
    (h₀ : IsWeakHomotopyEquivalence f₀) (h₁ : IsWeakHomotopyEquivalence f₁)
    (h₂ : IsWeakHomotopyEquivalence f₂) :
    IsWeakHomotopyEquivalence (pushout.map i j i' j' f₁ f₂ f₀ w₁ w₂) := sorry

/-- `H.2/levelwise-equivalence-theorem`. -/
theorem SimplicialSpace.realization_weakEquivalence {X Y : SimplicialObject TopCat.{u}} (f : X ⟶ Y)
    (hX : SimplicialSpace.IsProper X) (hY : SimplicialSpace.IsProper Y)
    (hf : ∀ n, IsWeakHomotopyEquivalence (f.app n)) :
    IsWeakHomotopyEquivalence (SimplicialSpace.realization.map f) := sorry

/-- `H.2/levelwise-fibration-realisation`. -/
theorem SimplicialSpace.realization_fiberSequence {V W X : SimplicialObject TopCat.{u}} (i : V ⟶ W)
    (p : W ⟶ X) (x : ∀ n, X.obj n) (hX : ∀ n, PathConnectedSpace (X.obj n))
    (hV : SimplicialSpace.IsProper V) (hW : SimplicialSpace.IsProper W)
    (hX' : SimplicialSpace.IsProper X)
    (hx : ∀ ⦃m n⦄ (φ : m ⟶ n), (X.map φ).hom (x m) = x n)
    (hlev : ∀ n, IsHomotopyFiberSequence (i.app n) (p.app n) (x n)) (xr : SimplicialSpace.realization.obj X)
    (hxr : ∀ v, (SimplicialSpace.realization.map p).hom ((SimplicialSpace.realization.map i).hom v) = xr) :
    IsHomotopyFiberSequence (SimplicialSpace.realization.map i) (SimplicialSpace.realization.map p) xr := sorry

/-- `H.2/bousfield-kan-homotopy-colimit`. -/
def hocolimSimplicial (I : Type u) [SmallCategory I] (X : I ⥤ TopCat.{u}) :
    SimplicialObject TopCat.{u} := sorry

def hocolim (I : Type u) [SmallCategory I] (X : I ⥤ TopCat.{u}) : TopCat.{u} :=
  SimplicialSpace.realization.obj (hocolimSimplicial I X)

namespace hocolim

variable {I : Type u} [SmallCategory I]

def toNerve (X : I ⥤ TopCat.{u}) : hocolim I X ⟶ CategoryTheory.classifyingSpace I := sorry

def map {X X' : I ⥤ TopCat.{u}} (φ : X ⟶ X') : hocolim I X ⟶ hocolim I X' := sorry

theorem isWeakHomotopyEquivalence_map {X X' : I ⥤ TopCat.{u}} (φ : X ⟶ X')
    (h : ∀ i, IsWeakHomotopyEquivalence (φ.app i)) : IsWeakHomotopyEquivalence (map φ) := sorry

def const_point : hocolim I ((Functor.const I).obj (TopCat.of PUnit.{u + 1})) ≅
    CategoryTheory.classifyingSpace I := sorry

def toColimit (X : I ⥤ TopCat.{u}) : hocolim I X ⟶ colimit X := sorry

end hocolim

/-- `hocolim_const_point` (computation). -/
example (I : Type u) [SmallCategory I] :
    Nonempty (hocolim I ((Functor.const I).obj (TopCat.of PUnit.{u + 1})) ≅
      CategoryTheory.classifyingSpace I) := ⟨hocolim.const_point⟩

/-- `hocolim_terminal` (degenerate). -/
example (I : Type u) [SmallCategory I] [HasTerminal I] (X : I ⥤ TopCat.{u}) :
    Nonempty (ContinuousMap.HomotopyEquiv (hocolim I X) (X.obj (⊤_ I))) := sorry

/-- `hocolim_discrete_grothendieck` (compatibility). -/
example (I : Type u) [SmallCategory I] (X : I ⥤ Type u) :
    Nonempty (hocolim I (X ⋙ TopCat.discrete) ≅ CategoryTheory.classifyingSpace (X.Elements)) := sorry

/- `hocolim_ne_colim_span` (non-example). -/
-- signature (not yet statable at the pins): example
-- For the span `* ← S⁰ → *`, `colim = *` but `hocolim ≃ S¹`.

/-- `H.2/realisation-is-homotopy-colimit`: for a proper simplicial space the Bousfield–Kan
homotopy colimit over `Δᵒᵖ` maps to the realisation by a weak homotopy equivalence
(Nikolaus–Scholze Lemma B.7). Stated in universe `0`, where `SimplexCategory` lives. -/
theorem SimplicialSpace.hocolim_weakEquivalence_realization (X : SimplicialObject TopCat.{0})
    (hX : SimplicialSpace.IsProper X) :
    ∃ g : hocolim SimplexCategoryᵒᵖ X ⟶ SimplicialSpace.realization.obj X,
      IsWeakHomotopyEquivalence g := sorry

/-- `H.2/quasi-fibration-lemma`. -/
theorem hocolim.toNerve_isQuasiFibration {I : Type u} [SmallCategory I] (X : I ⥤ TopCat.{u})
    (h : ∀ ⦃i j : I⦄ (f : i ⟶ j), ∃ e : ContinuousMap.HomotopyEquiv (X.obj i) (X.obj j),
      e.toFun = (X.map f).hom) : IsQuasiFibration (hocolim.toNerve X) := sorry

/-- `H.2/thomason-homotopy-colimit-theorem`. -/
theorem thomason_hocolim (D : Type u) [SmallCategory D] (F : D ⥤ Cat.{u, u}) :
    ∃ g : hocolim D (F ⋙ CategoryTheory.classifyingSpaceFunctor) ⟶
      CategoryTheory.classifyingSpace (CategoryTheory.Grothendieck F), IsWeakHomotopyEquivalence g := sorry

end TauCeti

namespace CategoryTheory

open TauCeti

variable {C D : Type u} [SmallCategory C] [SmallCategory D]

/-- The coefficient functor `d ↦ H_q(B(T/d); ℤ)` on `D` (comma categories `CostructuredArrow T d`). -/
def commaHomologyCoeff (T : C ⥤ D) (q : ℕ) : D ⥤ ModuleCat.{u} (ULift.{u} ℤ) := sorry

/-- `H.2/functor-homology-spectral-sequence`: a first-quadrant spectral sequence with
`E²_{p,q} = H_p(D; d ↦ H_q(B(T/d)))`; its convergence to `H_{p+q}(BC)` needs the abutment
API of Mathlib's spectral sequences, which the pin does not have, and is left out here. -/
theorem functorHomologySpectralSequence (T : C ⥤ D) :
    ∃ E : SpectralSequence (ModuleCat.{u} (ULift.{u} ℤ))
      (fun r => ComplexShape.spectralSequenceNat ⟨-r, r - 1⟩) 2,
      ∀ p q : ℕ, Nonempty ((E.page 2).X (p, q) ≅
        categoryHomology (ULift.{u} ℤ) (commaHomologyCoeff T q) p) := sorry

/-- `H.2/comma-category-to-homotopy-fibre`. -/
def commaToHomotopyFiber (F : C ⥤ D) (d : D) :
    classifyingSpace (StructuredArrow d F) ⟶
      homotopyFiber (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

theorem commaToHomotopyFiber_proj (F : C ⥤ D) (d : D) :
    commaToHomotopyFiber F d ≫ homotopyFiber.proj (classifyingSpaceMap F) (classifyingSpace_vertex d) =
      classifyingSpaceMap (StructuredArrow.proj d F) := sorry

theorem commaToHomotopyFiber_naturality (F : C ⥤ D) {d d' : D} (u : d ⟶ d') :
    ContinuousMap.Homotopic
      ((classifyingSpaceMap (StructuredArrow.map (T := F) u)) ≫ commaToHomotopyFiber F d).hom
      ((commaToHomotopyFiber F d' ≫ homotopyFiber.transport _ (classifyingSpace_edge u).symm)).hom := sorry

def costructuredArrowToHomotopyFiber (F : C ⥤ D) (d : D) :
    classifyingSpace (CostructuredArrow F d) ⟶
      homotopyFiber (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

/-- `commaToHomotopyFiber_id` (degenerate). -/
example (d : D) : IsWeakHomotopyEquivalence (commaToHomotopyFiber (𝟭 D) d) := sorry

/- `commaToHomotopyFiber_subgroup` (computation). -/
-- signature (not yet statable at the pins): example (G : Type u) [Group G] (H : Subgroup G)
-- For `SingleObj.mapHom H G H.subtype` the comma category is the translation category of `G ⧸ H`.

/- `commaToHomotopyFiber_fiber_compat` (compatibility). -/
-- signature (not yet statable at the pins): example (F : C ⥤ D) (d : D)
-- On objects `(X, 𝟙)` of the strict fibre, `commaToHomotopyFiber` agrees with `homotopyFiber.ofFiber`.

/-- `commaToHomotopyFiber_not_equiv` (non-example). -/
example : ¬ IsWeakHomotopyEquivalence
    (commaToHomotopyFiber (Functor.const (Discrete PUnit.{1}) |>.obj (0 : Fin 2) : Discrete PUnit ⥤ Fin 2) 1) := sorry

/-- `H.2/quillen-theorem-a`. -/
theorem quillenTheoremA (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- The inclusion of the strict fibre into the comma category `d \ F`, `X ↦ (X, 𝟙)`. -/
def fiberToComma (F : C ⥤ D) (d : D) : F.Fiber d ⥤ StructuredArrow d F := sorry

/-- `H.2/prefibred-iff-fibre-adjoint`. -/
theorem isPreFibered_iff_fibre_adjoint (F : C ⥤ D) :
    F.IsPreFibered ↔ ∀ d : D, ∃ R : StructuredArrow d F ⥤ F.Fiber d, Nonempty (fiberToComma F d ⊣ R) := sorry

/-- `H.2/quillen-theorem-a-prefibred`. -/
theorem quillenTheoremA_prefibered (F : C ⥤ D) [F.IsPreFibered]
    (h : ∀ d : D, ContractibleSpace (classifyingSpace (F.Fiber d))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- `H.2/quillen-theorem-b`. -/
theorem quillenTheoremB (F : C ⥤ D)
    (h : ∀ ⦃d d' : D⦄ (u : d ⟶ d'), ∃ e : ContinuousMap.HomotopyEquiv
      (classifyingSpace (StructuredArrow d' F)) (classifyingSpace (StructuredArrow d F)),
        e.toFun = (classifyingSpaceMap (StructuredArrow.map (T := F) u)).hom) (d : D) :
    IsWeakHomotopyEquivalence (commaToHomotopyFiber F d) := sorry

/- `H.2/quillen-theorem-b-prefibred`. -/
-- signature (not yet statable at the pins): theorem quillenTheoremB_prefibered (F : C ⥤ D) [F.IsPreFibered] (d : D)
-- With base changes homotopy equivalences, `B(F⁻¹ d) → BC → BD` is a homotopy fibre sequence.

/-- `H.2/group-extension-fibration`. -/
theorem groupExtension_fiberSequence (G : Type u) [Group G] (N : Subgroup G) [N.Normal] :
    IsHomotopyFiberSequence (Group.classifyingSpace.map N.subtype)
      (Group.classifyingSpace.map (QuotientGroup.mk' N)) (Group.classifyingSpace.basepoint _) := sorry

end CategoryTheory

/-! ## H.3 — The plus construction -/

namespace TauCeti

variable {X Y Z : TopCat.{u}}

/-- `H.3/acyclic-spaces-and-maps`: path-connected with vanishing integral homology in positive degrees
(equivalently, vanishing reduced integral homology). -/
def IsAcyclicSpace (F : TopCat.{u}) : Prop :=
  PathConnectedSpace F ∧ ∀ n : ℕ, IsZero (Stub.singH (ULift.{u} ℤ) (n + 1) F)

theorem IsAcyclicSpace.pathConnected {F : TopCat.{u}} (h : IsAcyclicSpace F) : PathConnectedSpace F := h.1

theorem IsAcyclicSpace.of_contractible (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := sorry

theorem IsAcyclicSpace.of_homotopyEquiv {F F' : TopCat.{u}} (e : ContinuousMap.HomotopyEquiv F F')
    (h : IsAcyclicSpace F) : IsAcyclicSpace F' := sorry

theorem IsAcyclicSpace.perfect_fundamentalGroup {F : TopCat.{u}} (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) := sorry

/-- `isAcyclicSpace_point` (degenerate). -/
example : IsAcyclicSpace (TopCat.of PUnit.{u + 1}) := sorry

/-- `not_isAcyclicSpace_empty` (non-example). -/
example : ¬ IsAcyclicSpace (TopCat.of PEmpty.{u + 1}) := sorry

/-- `not_isAcyclicSpace_circle` (non-example). -/
example : ¬ IsAcyclicSpace (TopCat.of (Circle)) := sorry

/-- `isAcyclicSpace_poincare_sphere_minus_point` (computation). -/
example : ∃ F : TopCat.{0}, IsAcyclicSpace F ∧ ∃ x : F, Nontrivial (FundamentalGroup F x) := sorry

/-- `isAcyclicSpace_contractible_compat` (compatibility). -/
example (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := IsAcyclicSpace.of_contractible F

/-- `H.3/acyclic-space-perfect-fundamental-group`. -/
theorem IsAcyclicSpace.perfect_and_H2 {F : TopCat.{u}} (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) ∧
      IsZero (groupHomology (Rep.trivial (ULift.{u} ℤ) (FundamentalGroup F x) (ULift.{u} ℤ)) 2) := sorry

/-- `H.3/acyclic-map`: every homotopy fibre is acyclic. -/
def IsAcyclicMap (f : X ⟶ Y) : Prop := ∀ y : Y, IsAcyclicSpace (homotopyFiber f y)

theorem IsAcyclicMap.surjective_pi1 {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) := sorry

theorem IsAcyclicMap.ker_isPerfect {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Group.IsPerfect (FundamentalGroup.map f.hom x).ker ∧ (FundamentalGroup.map f.hom x).ker.Normal := sorry

theorem IsAcyclicMap.comp {f : X ⟶ Y} {g : Y ⟶ Z} (hf : IsAcyclicMap f) (hg : IsAcyclicMap g) :
    IsAcyclicMap (f ≫ g) := sorry

-- signature (not yet statable at the pins): theorem IsAcyclicMap.iff_homology (f : X ⟶ Y)
-- `IsAcyclicMap f ↔ f` induces isomorphisms on homology with every local coefficient system pulled back
-- from `π₁(Y)`; local-coefficient homology is Tau Ceti AlgebraicTopology stage 2 item 6 (not yet built).

/-- `isAcyclicMap_id` (degenerate). -/
example : IsAcyclicMap (𝟙 X) := sorry

/-- `isAcyclicMap_toPoint_iff` (characterisation). -/
example : IsAcyclicMap (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) ↔
    IsAcyclicSpace X := sorry

/-- `isAcyclicMap_homotopyEquiv` (compatibility). -/
example (e : ContinuousMap.HomotopyEquiv X Y) : IsAcyclicMap (TopCat.ofHom e.toFun) := sorry

/-- `not_isAcyclicMap_point_into_acyclic` (non-example). -/
example (F : TopCat.{u}) (hF : IsAcyclicSpace F) (x : F) (hx : Nontrivial (FundamentalGroup F x)) :
    ¬ IsAcyclicMap (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} x) : TopCat.of PUnit ⟶ F) := sorry

/-- `H.3/acyclic-map-fundamental-group`. -/
theorem IsAcyclicMap.pi1_surjective_perfect_kernel {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) ∧ Group.IsPerfect (FundamentalGroup.map f.hom x).ker :=
  ⟨hf.surjective_pi1 x, (hf.ker_isPerfect x).1⟩

/-- `H.3/acyclic-map-homology-criterion` (constant-coefficient shadow; see `IsAcyclicMap.iff_homology`). -/
theorem IsAcyclicMap.homology_criterion (f : X ⟶ Y) (hf : IsAcyclicMap f) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- `H.3/plus-construction-predicate`. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- The perfect radical: the largest perfect subgroup. -/
def perfectRadical (G : Type u) [Group G] : Subgroup G :=
  ⨆ (H : Subgroup G) (_ : Group.IsPerfect H), H

theorem IsPlusConstruction.pi1_quotient {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)} [P.Normal]
    (h : IsPlusConstruction f x P) : Nonempty (FundamentalGroup Y (f.hom x) ≃* FundamentalGroup X x ⧸ P) := sorry

theorem IsPlusConstruction.homology_iso {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (h : IsPlusConstruction f x P) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- `isPlusConstruction_trivial_iff` (degenerate). -/
example (f : X ⟶ Y) (x : X) [PathConnectedSpace X] :
    IsPlusConstruction f x ⊥ ↔ IsWeakHomotopyEquivalence f := sorry

/-- `isPlusConstruction_acyclic_toPoint` (computation). -/
example (hX : IsAcyclicSpace X) (x : X) :
    IsPlusConstruction (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) x ⊤ := sorry

/-- `perfectRadical_perfect_group` (computation). -/
example (G : Type u) [Group G] [Group.IsPerfect G] : perfectRadical G = ⊤ := sorry

/-- `not_isPlusConstruction_nonperfect` (non-example). -/
example (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) (hP : ¬ Group.IsPerfect P) :
    ¬ IsPlusConstruction f x P := sorry

/-- `H.3/plus-construction-by-cell-attachment`. -/
def plusConstruction (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) : TopCat.{u} := sorry

namespace plusConstruction

def incl (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) : X ⟶ plusConstruction X x P := sorry

theorem isPlusConstruction (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] :
    IsPlusConstruction (incl X x P) x P := sorry

@[instance_reducible]
def relCW (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) :
    Topology.RelCWComplex (Set.univ : Set (plusConstruction X x P)) (Set.range (incl X x P).hom) := sorry

def pi1Equiv (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] :
    FundamentalGroup (plusConstruction X x P) ((incl X x P).hom x) ≃* FundamentalGroup X x ⧸ P := sorry

end plusConstruction

/-- `plusConstruction_bot` (degenerate). -/
example (x : X) : ∃ e : ContinuousMap.HomotopyEquiv X (plusConstruction X x ⊥),
    e.toFun = (plusConstruction.incl X x ⊥).hom := sorry

/-- `plusConstruction_acyclic_contractible` (computation). -/
example [Topology.CWComplex (Set.univ : Set X)] (hX : IsAcyclicSpace X) (x : X) :
    ContractibleSpace (plusConstruction X x ⊤) := sorry

/-- `plusConstruction_perfect_group_simplyConnected` (computation). -/
example (G : Type u) [Group G] [Group.IsPerfect G] :
    SimplyConnectedSpace (plusConstruction (Group.classifyingSpace G)
      (Group.classifyingSpace.basepoint G) ⊤) := sorry

/- `plusConstruction_not_unique_on_nose` (non-example): only the homotopy type under `X` is canonical. -/
-- signature (not yet statable at the pins): example
-- Two constructions with different generating sets are homotopy equivalent under `X`, not equal.

/-- `H.3/plus-fundamental-group`. -/
theorem plusConstruction.ker_pi1 (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) : (FundamentalGroup.map (plusConstruction.incl X x P).hom x).ker = P ∧
      Function.Surjective (FundamentalGroup.map (plusConstruction.incl X x P).hom x) := sorry

/-- `H.3/plus-integral-homology`. -/
theorem plusConstruction.homology_iso (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map (plusConstruction.incl X x P)) := sorry

/-- `H.3/plus-is-acyclic`. -/
theorem plusConstruction.isAcyclicMap [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) : IsAcyclicMap (plusConstruction.incl X x P) := sorry

/-- `H.3/abelian-space`: `π₁` acts trivially on every `π_n`, `n ≥ 1`. -/
def IsAbelianSpace (X : TopCat.{u}) (x : X) : Prop :=
  PathConnectedSpace X ∧ ∀ (n : ℕ) (g : FundamentalGroup X x) (a : HomotopyGroup.Pi (n + 1) X x),
    Stub.pi1Act (n + 1) x g a = a

theorem IsAbelianSpace.of_basepoint {x y : X} [PathConnectedSpace X] :
    IsAbelianSpace X x ↔ IsAbelianSpace X y := sorry

theorem IsAbelianSpace.of_simplyConnected [SimplyConnectedSpace X] (x : X) : IsAbelianSpace X x := sorry

theorem IsAbelianSpace.of_hSpace [HSpace X] [PathConnectedSpace X] (x : X) : IsAbelianSpace X x := sorry

theorem IsAbelianSpace.commGroup_pi1 {x : X} (h : IsAbelianSpace X x) (g g' : FundamentalGroup X x) :
    g * g' = g' * g := sorry

/-- `isAbelianSpace_point` (degenerate). -/
example : IsAbelianSpace (TopCat.of PUnit.{u + 1}) PUnit.unit := sorry

/-- `isAbelianSpace_circle` (computation). -/
example : IsAbelianSpace (TopCat.of Circle) 1 := sorry

/-- `not_isAbelianSpace_rp2` (non-example). -/
example : ∃ (X : TopCat.{0}) (x : X), Nonempty (FundamentalGroup X x ≃* Multiplicative (ZMod 2)) ∧
    ¬ IsAbelianSpace X x := sorry

/-- `isAbelianSpace_topologicalGroup` (compatibility). -/
example (G : Type u) [TopologicalSpace G] [Group G] [IsTopologicalGroup G] [PathConnectedSpace G] :
    IsAbelianSpace (TopCat.of G) 1 := sorry

/-- `H.3/hspace-is-abelian`. -/
theorem hSpace_isAbelianSpace (X : TopCat.{u}) [HSpace X] [PathConnectedSpace X] :
    IsAbelianSpace X HSpace.e := IsAbelianSpace.of_hSpace _

/-- `H.3/eilenberg-maclane-space`. -/
def EilenbergMacLaneSpace (A : Type u) [AddCommGroup A] (n : ℕ) : TopCat.{u} := sorry

namespace EilenbergMacLaneSpace

def basepoint (A : Type u) [AddCommGroup A] (n : ℕ) : EilenbergMacLaneSpace A n := sorry

def homotopyGroupEquiv (A : Type u) [AddCommGroup A] (n : ℕ) :
    HomotopyGroup.Pi (n + 1) (EilenbergMacLaneSpace A (n + 1)) (basepoint A (n + 1)) ≃*
      Multiplicative A := sorry

theorem homotopyEquivOfPi (A : Type u) [AddCommGroup A] (n : ℕ) (Y : TopCat.{u}) (y : Y)
    [Topology.CWComplex (Set.univ : Set Y)] [PathConnectedSpace Y]
    (h₁ : Nonempty (HomotopyGroup.Pi (n + 1) Y y ≃* Multiplicative A))
    (h₂ : ∀ i, i ≠ n + 1 → i ≠ 0 → Subsingleton (HomotopyGroup.Pi i Y y)) :
    Nonempty (ContinuousMap.HomotopyEquiv Y (EilenbergMacLaneSpace A (n + 1))) := sorry

/-- Realisation of homomorphisms; it induces a bijection from `A →+ B` onto based homotopy classes. -/
def mapEquiv (A B : Type u) [AddCommGroup A] [AddCommGroup B] (n : ℕ) :
    (A →+ B) → C(EilenbergMacLaneSpace A (n + 1), EilenbergMacLaneSpace B (n + 1)) := sorry

theorem isEilenbergMacLaneSpaceOne (A : Type u) [AddCommGroup A] :
    Stub.IsKOne (Multiplicative A) (EilenbergMacLaneSpace A 1) (basepoint A 1) := sorry

end EilenbergMacLaneSpace

/-- `eilenbergMacLaneSpace_trivial` (degenerate). -/
example (n : ℕ) : ContractibleSpace (EilenbergMacLaneSpace (PUnit.{u + 1}) n) := sorry

/-- `eilenbergMacLaneSpace_Z_one` (computation). -/
example : Nonempty (ContinuousMap.HomotopyEquiv (EilenbergMacLaneSpace ℤ 1) Circle) := sorry

/-- `eilenbergMacLaneSpace_one_compat` (compatibility). -/
example (A : Type u) [AddCommGroup A] :
    Nonempty (ContinuousMap.HomotopyEquiv (EilenbergMacLaneSpace A 1)
      (Group.classifyingSpace (Multiplicative A))) := sorry

/-- `eilenbergMacLaneSpace_not_moore` (non-example): `K(ℤ/2, 1)` has `H₂ = 0`, unlike `RP²`-type Moore
spaces with nonzero `π₂`. -/
example : IsZero (Stub.singH ℤ 2 (EilenbergMacLaneSpace (ZMod 2) 1)) := sorry

/- `H.3/cohomology-representability`: for a CW complex `X`, based homotopy classes `X → K(G, n)` are
in natural bijection with `Hⁿ(X; G)`. Singular cohomology is Tau Ceti AlgebraicTopology stage 6 and not
in the pinned libraries, so the signature is recorded as a comment:
`theorem cohomologyRepresentability (X : TopCat) [CWComplex X] (G) (n) :
  (based homotopy classes X → EilenbergMacLaneSpace G n) ≃ singularCohomology X G n`. -/
-- signature (not yet statable at the pins): theorem cohomologyRepresentability_signature

/-- `H.3/postnikov-principal-fibrations` (existence of a Postnikov tower: maps `X → X_n` inducing
isomorphisms on `π_i`, `i ≤ n`, with `π_i(X_n) = 0` for `i > n`; principal when `X` is abelian). -/
theorem postnikovTower [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) (n : ℕ) :
    ∃ (Xn : TopCat.{u}) (p : X ⟶ Xn), (∀ i ≤ n, Function.Bijective (Stub.piMap i p.hom x)) ∧
      ∀ i > n, Subsingleton (HomotopyGroup.Pi i Xn (p.hom x)) := sorry

/- `H.3/obstruction-lifting`: a lift through the principal fibration `X_n → X_{n-1}` extending a lift
on `A` exists iff the obstruction class in `H^{n+1}(W, A; π_n X)` vanishes; relative singular cohomology
is Tau Ceti AlgebraicTopology stage 6, so the signature is recorded as a comment. -/
-- signature (not yet statable at the pins): theorem obstructionLifting

/-- `H.3/abelian-extension-corollary` (Hatcher 4.73), with the cohomological hypothesis replaced by
the sufficient hypothesis that the pair is acyclic, as used in `abelianHomologyWhitehead`. -/
theorem abelianExtension [Topology.CWComplex (Set.univ : Set X)] (x : X) (hX : IsAbelianSpace X x)
    (W : TopCat.{u}) (i : X ⟶ W) [Topology.RelCWComplex (Set.univ : Set W) (Set.range i.hom)]
    (hi : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map i)) :
    ∃ r : W ⟶ X, i ≫ r = 𝟙 X := sorry

/-- `H.3/abelian-homology-whitehead` (Hatcher 4.74). -/
theorem abelianHomologyWhitehead [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] (x : X) (hX : IsAbelianSpace X x) (f : X ⟶ Y)
    (hY : IsAbelianSpace Y (f.hom x))
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `H.3/hspace-homology-whitehead` (Weibel IV Exercise 1.3). -/
theorem hSpaceHomologyWhitehead [HSpace X] [HSpace Y] [PathConnectedSpace X] [PathConnectedSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] (f : X ⟶ Y)
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `H.3/plus-construction-universal-property` (abelian targets). -/
theorem IsPlusConstruction.lift [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (g : X ⟶ Z) (hZ : IsAbelianSpace Z (g.hom x))
    (hg : P ≤ (FundamentalGroup.map g.hom x).ker) :
    ∃ h : Y ⟶ Z, ContinuousMap.Homotopic (f ≫ h).hom g.hom ∧
      ∀ h' : Y ⟶ Z, ContinuousMap.Homotopic (f ≫ h').hom g.hom → ContinuousMap.Homotopic h.hom h'.hom := sorry

/-- `H.3/plus-construction-uniqueness`. -/
theorem IsPlusConstruction.unique [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] {f : X ⟶ Y} {f' : X ⟶ Z} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' x P) (hZ : IsAbelianSpace Z (f'.hom x)) :
    ∃ e : ContinuousMap.HomotopyEquiv Y Z, ContinuousMap.Homotopic (e.toFun.comp f.hom) f'.hom := sorry

/-- `H.3/plus-construction-functoriality`. -/
theorem IsPlusConstruction.map {X' Y' : TopCat.{u}} (φ : X ⟶ X') {f : X ⟶ Y} {f' : X' ⟶ Y'} {x : X}
    {P : Subgroup (FundamentalGroup X x)} {P' : Subgroup (FundamentalGroup X' (φ.hom x))}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' (φ.hom x) P')
    (hφ : P.map (FundamentalGroup.map φ.hom x) ≤ P') (hY' : IsAbelianSpace Y' (f'.hom (φ.hom x))) :
    ∃ φp : Y ⟶ Y', ContinuousMap.Homotopic (f ≫ φp).hom (φ ≫ f').hom := sorry

/-- `H.3/plus-hspace-recognition` (Weibel IV Theorem 1.8 and Remark 1.8.1). -/
theorem IsPlusConstruction.recognition_hSpace {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (H : TopCat.{u}) [HSpace H] [PathConnectedSpace H] [HSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set H)] (g : X ⟶ H)
    (hg : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map g)) :
    IsAcyclicMap g ∧ ∃ e : ContinuousMap.HomotopyEquiv Y H, ContinuousMap.Homotopic (e.toFun.comp f.hom) g.hom := sorry

/-- `H.3/plus-pi2-universal-central-extension`: `π₂(BG⁺) ≅ H₂(P; ℤ)` for `P = G` perfect. -/
theorem plusConstruction.pi2_eq_H2 (G : Type u) [Group G] [Group.IsPerfect G] :
    Nonempty (HomotopyGroup.Pi 2 (plusConstruction (Group.classifyingSpace G)
      (Group.classifyingSpace.basepoint G) ⊤)
      ((plusConstruction.incl _ _ ⊤).hom (Group.classifyingSpace.basepoint G)) ≃*
        Multiplicative (groupHomology (Rep.trivial (ULift.{u} ℤ) G (ULift.{u} ℤ)) 2)) := sorry

/- `H.3/plus-universal-cover`: `π_n(BP⁺) ≅ π_n(BG⁺)` for `n ≥ 2`. -/
-- signature (not yet statable at the pins): theorem plusConstruction.universalCover (G : Type u) [Group G] (P : Subgroup G) [P.Normal]
--       [Group.IsPerfect P] (n : ℕ)
-- `B P⁺` is the universal cover of `BG⁺` (relative to `P`); the identification of `P` with a subgroup of
-- `π₁(BG)` uses `Group.classifyingSpace.fundamentalGroupMulEquiv`.

/- `H.3/plus-uce-fibration`: `BA → BS⁺ → BP⁺` for a universal central extension. -/
-- signature (not yet statable at the pins): theorem plusConstruction.uceFibration (S P : Type u) [Group S] [Group P] (π : S →* P)
--       (hπ : Function.Surjective π) (hcent : π.ker ≤ Subgroup.center S) [Group.IsPerfect S]
--       (hS : IsZero (groupHomology (Rep.trivial (ULift.{u} ℤ) S (ULift.{u} ℤ)) 2))
-- The fibre sequence `B(ker π) → (BS)⁺ → (BP)⁺`, `π₃((BP)⁺) ≅ H₃(S; ℤ)`.

/- `H.3/plus-relative-fibre-comparison`. -/
-- signature (not yet statable at the pins): theorem plusConstruction.relativeFibre {F E B : TopCat.{u}} (i : F ⟶ E) (p : E ⟶ B) (b : B)
--       (h : IsHomotopyFiberSequence i p b)
-- Under trivial `π₁(B)`-action on `H_*(F)`, `F⁺ → E⁺ → B` is a homotopy fibre sequence.

/-- `H.3/serre-class-theorem` (class of finitely generated groups). -/
theorem serreClass_finitelyGenerated (x : X) (hX : IsAbelianSpace X x) :
    (∀ n, Group.FG (HomotopyGroup.Pi (n + 1) X x)) ↔
      ∀ n, Module.Finite (ULift.{u} ℤ) (Stub.singH (ULift.{u} ℤ) (n + 1) X) := sorry

/- `H.3/rational-hurewicz-hspace`. -/
-- signature (not yet statable at the pins): theorem rationalHurewicz_hSpace [HSpace X] [PathConnectedSpace X] (n : ℕ)
-- `π_n(X) ⊗ ℚ → H_n(X; ℚ)` is injective onto the primitives, for finite-type rational homology.

end TauCeti

/-! ## H.4 — Homotopy group completion -/

namespace CategoryTheory

open MonoidalCategory

variable (S : Type u) [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]

/-- `H.4/symmetric-monoidal-groupoid-core`. -/
@[instance_reducible]
def Core.monoidalCategory (T : Type u) [Category.{u} T] [MonoidalCategory T] :
    MonoidalCategory (Core T) := sorry

@[instance_reducible]
def Core.symmetricCategory (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    letI := Core.monoidalCategory T; SymmetricCategory (Core T) := sorry

theorem Core.inclusion_monoidal (T : Type u) [Category.{u} T] [MonoidalCategory T] :
    letI := Core.monoidalCategory T
    Nonempty (Core.inclusion T).Monoidal := sorry

def Core.mapMonoidal {T T' : Type u} [Category.{u} T] [Category.{u} T'] [MonoidalCategory T]
    [MonoidalCategory T'] (F : T ⥤ T') [F.Monoidal] : Core T ⥤ Core T' := sorry

/-- The commutative monoid of isomorphism classes under `⊗`. -/
def Core.isoClassesMonoid (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    Type u := _root_.Quotient (isIsomorphicSetoid T)

instance (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    CommMonoid (Core.isoClassesMonoid T) := sorry

/- `core_finset_pi0` (computation): finite sets under disjoint union have iso-class monoid `ℕ`. -/
-- signature (not yet statable at the pins): example
-- `Core.isoClassesMonoid FintypeCat ≃* Multiplicative ℕ` once `FintypeCat` carries the cocartesian
-- monoidal structure; stated as a comment because that instance is not chosen here.

/-- `core_of_groupoid` (degenerate). -/
example : Nonempty (Core S ≌ S) := sorry

/- `core_projective_symmetry_not_id` (non-example). -/
-- signature (not yet statable at the pins): example
-- In `Core` of f.g. projective `ℤ`-modules under `⊕`, the braiding on `ℤ ⊕ ℤ` is the swap `≠ 𝟙`.

/- `core_isoClasses_splitK0` (compatibility): the Grothendieck group of iso classes of an additive
category under `⊞` is Tau Ceti's `TauCeti.SplitK0` (`TauCeti.SplitK0.grothendieckAddGroupEquiv`); the
Tau Ceti module is not compiled in the available build, so the comparison is recorded here. -/
-- signature (not yet statable at the pins): example

/-- `H.4/symmetric-monoidal-S-inverse-S`: objects are pairs `(m, n)`. -/
def SInvS : Type u := S × S

instance : Category.{u} (SInvS S) := sorry

namespace SInvS

def incl : S ⥤ SInvS S := sorry

@[instance_reducible]
def monoidal : MonoidalCategory (SInvS S) := sorry

def map {T : Type u} [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T)
    [F.Monoidal] : SInvS S ⥤ SInvS T := sorry

/-- The K-theory space `K(S) = B(S⁻¹S)`. -/
def kSpace : TopCat.{u} := classifyingSpace (SInvS S)

def pi0Equiv : ZerothHomotopy (kSpace S) ≃ Algebra.GrothendieckGroup (Core.isoClassesMonoid S) := sorry

def swap : SInvS S ⥤ SInvS S := sorry

end SInvS

/-- `SInvS_pic_K0` (computation): for a Picard groupoid (π₀ already a group), `K(S) ≃ π₀ × B Aut(1)`. -/
example [∀ X : S, Nonempty (Σ Y : S, X ⊗ Y ≅ 𝟙_ S)] :
    Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃ Core.isoClassesMonoid S) := sorry

/-- `SInvS_trivial` (degenerate). -/
example [Subsingleton S] [∀ X Y : S, Subsingleton (X ⟶ Y)] : ContractibleSpace (SInvS.kSpace S) := sorry

/-- `SInvS_pi0_compat` (compatibility). -/
example : Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃
    Algebra.GrothendieckGroup (Core.isoClassesMonoid S)) := ⟨SInvS.pi0Equiv S⟩

/- `SInvS_no_natural_inverse` (non-example): there is no natural transformation `𝟭 ⟶ swap` making
`swap` a strict inverse (Weibel IV Exercise 4.3); recorded as a comment for `S = F(ℤ)`. -/
-- signature (not yet statable at the pins): example

/-- `SInvS_not_all_maps` (non-example): the category of all maps of an additive category with initial
`0` has contractible classifying space. -/
example (A : Type u) [Category.{u} A] [HasInitial A] : ContractibleSpace (classifyingSpace A) :=
  classifyingSpace_contractible_of_hasInitial

/-- `H.4/monoidal-action-category`. -/
structure MonoidalAction (X : Type u) [Category.{u} X] where
  act : S × X ⥤ X
  assoc : ∀ (s t : S) (x : X), act.obj (s, act.obj (t, x)) ≅ act.obj (s ⊗ t, x)
  unit : ∀ x : X, act.obj (𝟙_ S, x) ≅ x

def MonoidalActionCategory {X : Type u} [Category.{u} X] (_a : MonoidalAction S X) : Type u := X

instance {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    Category.{u} (MonoidalActionCategory S a) := sorry

namespace MonoidalActionCategory

def regular : MonoidalAction S S := sorry

def loc {X : Type u} [Category.{u} X] (_a : MonoidalAction S X) : Type u :=
  MonoidalActionCategory S (X := S × X) sorry

instance {X : Type u} [Category.{u} X] (a : MonoidalAction S X) : Category.{u} (loc S a) := sorry

def proj {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    loc S a ⥤ MonoidalActionCategory S (regular S) := sorry

def incl {X : Type u} [Category.{u} X] (a : MonoidalAction S X) (s : S) : X ⥤ loc S a := sorry

theorem contractible_self : ContractibleSpace (classifyingSpace (MonoidalActionCategory S (regular S))) := sorry

end MonoidalActionCategory

/-- `actionCategory_trivial_action` (degenerate). -/
example (X : Type u) [Category.{u} X] [Subsingleton S] [∀ X Y : S, Subsingleton (X ⟶ Y)]
    (a : MonoidalAction S X) : Nonempty (MonoidalActionCategory S a ≌ X) := sorry

/- `actionCategory_nat_telescope` (computation): recorded as a comment (ℕ acting through a sequence
of functors gives the mapping telescope, Weibel IV Exercise 4.2). -/
-- signature (not yet statable at the pins): example

/- `actionCategory_monoid_set` (compatibility): for a discrete category acted on through `π₀ S`, the
category agrees with Mathlib's `ActionCategory` of the induced monoid action (Weibel IV 4.7). -/
-- signature (not yet statable at the pins): example

/-- `actionCategory_not_X` (non-example): `⟨S, S⟩` is not `S`: it is contractible. -/
example : ContractibleSpace (classifyingSpace (MonoidalActionCategory S (MonoidalActionCategory.regular S))) :=
  MonoidalActionCategory.contractible_self S

/-- `H.4/S-inverse-S-pi0`. -/
theorem SInvS.pi0_grothendieck : Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃
    Algebra.GrothendieckGroup (Core.isoClassesMonoid S)) := ⟨SInvS.pi0Equiv S⟩

/-- `H.4/classifying-space-hspace` (countable case; in general compactly generated products). -/
theorem classifyingSpace_hSpace [Countable S] [∀ X Y : S, Countable (X ⟶ Y)] :
    Nonempty (HSpace (classifyingSpace S)) := sorry

/-- `H.4/action-projection-cofibred`. -/
theorem MonoidalActionCategory.proj_isCofibred {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    (MonoidalActionCategory.proj S a).op.IsFibered := sorry

/-- `H.4/invertible-action-equivalence`. -/
theorem MonoidalActionCategory.incl_homotopyEquiv {X : Type u} [Category.{u} X] (a : MonoidalAction S X)
    (hinv : ∀ t : S, ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace X) (classifyingSpace X),
      e.toFun = (classifyingSpaceMap (Prod.sectR t X ⋙ a.act)).hom)
    (s : S) : ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace X) (classifyingSpace (MonoidalActionCategory.loc S a)),
      e.toFun = (classifyingSpaceMap (MonoidalActionCategory.incl S a s)).hom := sorry

/- `H.4/quillen-localization-of-homology`. -/
-- signature (not yet statable at the pins): theorem quillenGroupCompletion :
--   IsGroupCompletion (classifyingSpaceMap (SInvS.incl S ...))
-- `B S → B(S⁻¹S)` is a group completion; stating it needs the H-space structures of
-- `H.4/classifying-space-hspace` as instances (that node gives them only as `Nonempty`). Its
-- degree-zero shadow is `SInvS.pi0Equiv`.

/- `H.4/S-inverse-S-fibration`. -/
-- signature (not yet statable at the pins): theorem SInvS.fibration {X : Type u} [Category.{u} X] (a : MonoidalAction S X) (x : X)
-- `S⁻¹S → S⁻¹X → ⟨S, X⟩` is a homotopy fibre sequence when every map of `X` is monic.

/-- `H.4/strictification-independence`. -/
theorem SInvS.map_homotopyEquiv {T : Type u} [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T]
    (F : S ⥤ T) [F.Monoidal] [F.IsEquivalence] :
    ∃ e : ContinuousMap.HomotopyEquiv (SInvS.kSpace S) (SInvS.kSpace T),
      e.toFun = (classifyingSpaceMap (SInvS.map S F)).hom := sorry

end CategoryTheory

namespace TauCeti

open CategoryTheory MonoidalCategory

/-- The degree-`n` part `(π₀ X)⁻¹ H_n(X; k)` of the localisation of the Pontryagin ring `H_*(X; k)`
at the image of `π₀ X` (a construction of this node). -/
def pontryaginLocalization (X : TopCat.{u}) [HSpace X] (k : Type u) [CommRing k] (n : ℕ) : Type u :=
  sorry

/-- The map `(π₀ X)⁻¹ H_n(X; k) → H_n(Y; k)` induced by an H-map `f`. -/
def pontryaginLocalizationMap {X Y : TopCat.{u}} [HSpace X] [HSpace Y] (f : X ⟶ Y) (k : Type u)
    [CommRing k] (n : ℕ) : pontryaginLocalization X k n → Stub.singH k n Y := sorry

/-- `H.4/group-completion`: an `H`-map inducing the group completion on `π₀` (stated through
`Joined`: `π₀ Y` is a group, every class is a difference of classes from `X`, and two classes of
`X` become equal iff they agree after adding a third) and the localisation of the Pontryagin ring
on homology. -/
def IsGroupCompletion {X Y : TopCat.{u}} [HSpace X] [HSpace Y] (f : X ⟶ Y) : Prop :=
  ContinuousMap.Homotopic (f.hom.comp HSpace.hmul)
      (HSpace.hmul.comp ((f.hom.prodMap f.hom))) ∧
    (∀ y : Y, ∃ y' : Y, Joined (HSpace.hmul (y, y')) HSpace.e) ∧
    (∀ y : Y, ∃ a b : X, Joined (HSpace.hmul (y, f.hom b)) (f.hom a)) ∧
    (∀ a b : X, Joined (f.hom a) (f.hom b) ↔
      ∃ c : X, Joined (HSpace.hmul (a, c)) (HSpace.hmul (b, c))) ∧
    ∀ (k : Type u) [CommRing k] (n : ℕ), Function.Bijective (pontryaginLocalizationMap f k n)

-- signature (not yet statable at the pins): theorem IsGroupCompletion.pi0Equiv {X Y : TopCat.{u}} [HSpace X] [HSpace Y] {f : X ⟶ Y}
--       (hf : IsGroupCompletion f)
-- `π₀ Y ≃ Algebra.GrothendieckGroup (π₀ X)` for the commutative monoid `π₀ X` of the H-space.

theorem IsGroupCompletion.homologyLocalization {X Y : TopCat.{u}} [HSpace X] [HSpace Y] {f : X ⟶ Y}
    (hf : IsGroupCompletion f) (k : Type u) [CommRing k] (n : ℕ) :
    Function.Bijective (pontryaginLocalizationMap f k n) := hf.2.2.2.2 k n

theorem IsGroupCompletion.of_groupLike (X : TopCat.{u}) [HSpace X]
    (hX : ∀ x : X, ∃ x' : X, Joined (HSpace.hmul (x, x')) HSpace.e)
    (hassoc : ∀ a b c : X, Joined (HSpace.hmul (HSpace.hmul (a, b), c))
      (HSpace.hmul (a, HSpace.hmul (b, c)))) : IsGroupCompletion (𝟙 X) := sorry

theorem IsGroupCompletion.basepointComponent {X Y : TopCat.{u}} [HSpace X] [HSpace Y] {f : X ⟶ Y}
    (hf : IsGroupCompletion f) (y : Y) (g g' : FundamentalGroup Y y) : g * g' = g' * g := sorry

/-- `isGroupCompletion_id_groupLike` (degenerate). -/
example (G : Type u) [TopologicalSpace G] [CommGroup G] [IsTopologicalGroup G] :
    letI : HSpace (TopCat.of G) := IsTopologicalGroup.toHSpace G
    IsGroupCompletion (𝟙 (TopCat.of G)) := sorry

/- `isGroupCompletion_N_to_Z` (computation): recorded for discrete monoids. -/
-- signature (not yet statable at the pins): example

/- `isGroupCompletion_pi0_compat` (compatibility). -/
-- signature (not yet statable at the pins): example

/- `not_isGroupCompletion_pi0_only` (non-example). -/
-- signature (not yet statable at the pins): example

/-- `H.4/group-completion-uniqueness`. -/
theorem IsGroupCompletion.homotopyEquiv_of_groupLike {X Y : TopCat.{u}} [HSpace X] [HSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] {f : X ⟶ Y}
    (hf : IsGroupCompletion f) (hX : IsGroupCompletion (𝟙 X)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `H.4/group-completion-uniqueness-countable`. -/
theorem IsGroupCompletion.unique_of_countable {X Y Y' : TopCat.{u}} [HSpace X] [HSpace Y] [HSpace Y']
    [Countable (ZerothHomotopy X)] {f : X ⟶ Y} {f' : X ⟶ Y'} (hf : IsGroupCompletion f)
    (hf' : IsGroupCompletion f') : Nonempty (ContinuousMap.HomotopyEquiv Y Y') := sorry

/- `H.4/plus-hspace-block-sum`. -/
-- signature (not yet statable at the pins): theorem blockSum_hSpace (R : Type u) [Ring R]
-- `BGL(R)⁺` is a homotopy-commutative H-space under block sum and `ℤ × BGL(R)⁺` is a group completion of
-- `⊔ BGL_n(R)`; `GL(R) = colim GL_n(R)` is not in Mathlib (KTheoryLowDegrees:U.1 plans it).

/- `H.4/gl-telescope-plus-comparison`. -/
-- signature (not yet statable at the pins): theorem kSpace_basedFree_plus (R : Type u) [Ring R]
-- `B(F(R)⁻¹F(R)) ≃ ℤ × BGL(R)⁺`, with `F(R) = ⊔ₙ GLₙ(R)` (`Matrix.GeneralLinearGroup`).

/- `H.4/cofinal-sequence-plus-comparison`. -/
-- signature (not yet statable at the pins): theorem kSpace_cofinal_plus
-- `B(S⁻¹S) ≃ K₀(S) × B Aut(S)⁺` for a cofinal sequence `s_{n+1} = s_n □ a_n`.

/-- `H.4/cofinality-theorem`. -/
theorem cofinality {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Monoidal]
    (hcof : ∀ t : T, ∃ (t' : T) (s : S), Nonempty (t ⊗ t' ≅ F.obj s))
    (haut : ∀ s : S, Function.Bijective (fun g : Aut s => F.mapIso g)) (n : ℕ) (x : SInvS.kSpace S) :
    Function.Bijective (Stub.piMap (n + 1) (classifyingSpaceMap (SInvS.map S F)).hom x) := sorry

/- `H.4/cofinality-projective-modules`. -/
-- signature (not yet statable at the pins): theorem kSpace_projective_plus (R : Type u) [Ring R]
-- `B((iso P(R))⁻¹ iso P(R)) ≃ K₀(R) × BGL(R)⁺`, component-preserving, natural up to homotopy.

/-- `H.4/gamma-space`: the skeleton of finite pointed sets `[n] = {0, …, n}` pointed at `0`. -/
structure FinPointed : Type where
  /-- `[n] = {0, …, n}` pointed at `0`. -/
  n : ℕ

instance : Category FinPointed where
  Hom X Y := {f : Fin (X.n + 1) → Fin (Y.n + 1) // f 0 = 0}
  id X := ⟨id, rfl⟩
  comp f g := ⟨g.1 ∘ f.1, show g.1 (f.1 0) = 0 by rw [f.2, g.2]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

def FinPointed.mk' (n : ℕ) : FinPointed := ⟨n⟩

/-- The Segal projection `[n] → [1]` collapsing everything but `i + 1`. -/
def FinPointed.segalProj (n : ℕ) (i : Fin n) : FinPointed.mk' n ⟶ FinPointed.mk' 1 := sorry

abbrev GammaSpace := FinPointed ⥤ SSet.{u}

namespace GammaSpace

def underlying (X : GammaSpace.{u}) : TopCat.{u} := SSet.toTop.obj (X.obj (FinPointed.mk' 1))

def IsSpecial (X : GammaSpace.{u}) : Prop :=
  ContractibleSpace (SSet.toTop.obj (X.obj (FinPointed.mk' 0))) ∧
    ∀ n : ℕ, IsWeakHomotopyEquivalence (SSet.toTop.map
      (Pi.lift fun i : Fin n => X.map (FinPointed.segalProj n i)))

def pi0Monoid (X : GammaSpace.{u}) : Type u := ZerothHomotopy (underlying X)

instance (X : GammaSpace.{u}) : CommMonoid (pi0Monoid X) := sorry

def IsGrouplike (X : GammaSpace.{u}) : Prop := ∀ a : pi0Monoid X, IsUnit a

/-- The discrete Γ-space `[n] ↦ Mⁿ` of a commutative monoid `M` (sums over the fibres of
pointed maps). -/
def ofCommMonoid (M : Type u) [AddCommMonoid M] : GammaSpace.{u} := sorry

end GammaSpace

/-- `gammaSpace_const_point_special` (degenerate). -/
example : GammaSpace.IsSpecial ((Functor.const FinPointed).obj (SSet.stdSimplex.obj (SimplexCategory.mk 0))) ∧
    GammaSpace.IsGrouplike ((Functor.const FinPointed).obj (SSet.stdSimplex.obj (SimplexCategory.mk 0))) := sorry

/-- `gammaSpace_discrete_abelian` (computation). -/
example (A : Type u) [AddCommGroup A] : GammaSpace.IsSpecial (GammaSpace.ofCommMonoid A) ∧
    GammaSpace.IsGrouplike (GammaSpace.ofCommMonoid A) ∧
    Nonempty (GammaSpace.pi0Monoid (GammaSpace.ofCommMonoid A) ≃* Multiplicative A) := sorry

/-- `gammaSpace_pi0_compat` (compatibility). -/
example (M : Type u) [AddCommMonoid M] :
    Nonempty (GammaSpace.pi0Monoid (GammaSpace.ofCommMonoid M) ≃* Multiplicative M) := sorry

/-- `gammaSpace_not_special_two_points` (non-example). -/
example : ¬ GammaSpace.IsSpecial ((Functor.const FinPointed).obj
    (SSet.stdSimplex.obj (SimplexCategory.mk 0) ⨿ SSet.stdSimplex.obj (SimplexCategory.mk 0))) := sorry

/-- `H.4/segal-gamma-space-delooping`. -/
def summingFunctors (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    (X : FinPointed) : Type u := sorry

instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] (X : FinPointed) :
    Category.{u} (summingFunctors C X) := sorry

def segalGammaSpace (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    GammaSpace.{u} := sorry

theorem segalGammaSpace.isSpecial (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : (segalGammaSpace C).IsSpecial := sorry

def segalGammaSpace.map {C D : Type u} [Category.{u} C] [Category.{u} D] [HasZeroObject C]
    [HasBinaryCoproducts C] [HasZeroObject D] [HasBinaryCoproducts D] (F : C ⥤ D)
    [PreservesColimitsOfShape (Discrete WalkingPair) F] : segalGammaSpace C ⟶ segalGammaSpace D := sorry

/-- The connective Ω-spectrum of a special Γ-space, as the sequence of its levels `Sp_n(C)`. -/
def segalSpectrum (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    ℕ → TopCat.{u} := sorry

/- `segalGammaSpace_finset_sphere` (computation): quoted Barratt–Priddy–Quillen–Segal; comment only. -/
-- signature (not yet statable at the pins): example

/-- `segalGammaSpace_zero_category` (degenerate). -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    [∀ X Y : C, Subsingleton (X ⟶ Y)] : ∀ n, ContractibleSpace (SSet.toTop.obj ((segalGammaSpace C).obj n)) := sorry

/-- `segalGammaSpace_pi0_K0` (compatibility). -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    Nonempty (GammaSpace.pi0Monoid (segalGammaSpace C) ≃ Quotient (isIsomorphicSetoid C)) := sorry

/- `segalGammaSpace_not_without_sums` (non-example): a groupoid with a monoidal structure has no
binary coproducts in general, so `segalGammaSpace` does not apply to `Core` (instance check). -/
-- signature (not yet statable at the pins): example

/-- `H.4/coherent-subset-construction`. -/
def coherentSubsetGammaSpace (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    GammaSpace.{u} := sorry

namespace coherentSubsetGammaSpace

variable (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C]

theorem isSpecial : (coherentSubsetGammaSpace C).IsSpecial := sorry

def pi0Equiv : GammaSpace.pi0Monoid (coherentSubsetGammaSpace C) ≃ Core.isoClassesMonoid C := sorry

def map {D : Type u} [Groupoid.{u} D] [MonoidalCategory D] [SymmetricCategory D] (F : C ⥤ D)
    [F.Monoidal] : coherentSubsetGammaSpace C ⟶ coherentSubsetGammaSpace D := sorry

def level_one : (coherentSubsetGammaSpace C).obj (FinPointed.mk' 1) ≅ nerve C := sorry

end coherentSubsetGammaSpace

/-- `coherentSubset_level_zero` (degenerate). -/
example (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    ContractibleSpace (SSet.toTop.obj ((coherentSubsetGammaSpace C).obj (FinPointed.mk' 0))) := sorry

/- `coherentSubset_vect_pi0` (computation): comment only (ranks of free modules). -/
-- signature (not yet statable at the pins): example

/-- `coherentSubset_pic_grouplike` (characterisation). -/
example (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C]
    (hC : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)) : (coherentSubsetGammaSpace C).IsGrouplike := sorry

/- `coherentSubset_naive_not_functor` (non-example): comment only (Bhatt–Scholze Remark 12.6). -/
-- signature (not yet statable at the pins): example

/- `H.4/segal-delooping-theorem` (group completion `X → ΩBX` is an equivalence iff grouplike). -/
-- signature (not yet statable at the pins): theorem segalDelooping (X : GammaSpace.{u}) (hX : X.IsSpecial)

/- `H.4/group-completion-adjunction`. -/
-- signature (not yet statable at the pins): theorem groupCompletion_adjunction

/-- `H.4/picard-groupoid-grouplike`. -/
theorem picard_iff_grouplike (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    (coherentSubsetGammaSpace C).IsGrouplike ↔ ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C) := sorry

/- `H.4/hermitian-group-completion-integers`: comment-level application of
`kSpace_cofinal_plus` to forms over `ℤ` (Calmès et al. §3.2). -/
-- signature (not yet statable at the pins): theorem hermitianGroupCompletion_integers

/-- `H.4/simplicial-ring-topological-realisation`. -/
def simplicialRingOfContinuous (A : Type u) [TopologicalSpace A] [Ring A] [IsTopologicalRing A] :
    SimplicialObject RingCat.{u} := sorry

def topologicalVariant (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A]
    [IsTopologicalRing A] : TopCat.{u} :=
  SimplicialSpace.realization.obj (simplicialRingOfContinuous A ⋙ F)

def topologicalVariant.unit (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A]
    [IsTopologicalRing A] : F.obj (RingCat.of A) ⟶ topologicalVariant F A := sorry

def topologicalVariant.map {F G : RingCat.{u} ⥤ TopCat.{u}} (φ : F ⟶ G) (A : Type u) [TopologicalSpace A]
    [Ring A] [IsTopologicalRing A] : topologicalVariant F A ⟶ topologicalVariant G A := sorry

/-- `topologicalVariant_const` (degenerate). -/
example (Y : TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A] [IsTopologicalRing A] :
    Nonempty (topologicalVariant ((Functor.const _).obj Y) A ≅ Y) := sorry

/-- `topologicalVariant_discrete_ring` (computation). -/
example (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [DiscreteTopology A] [Ring A]
    [IsTopologicalRing A] : ∃ e : ContinuousMap.HomotopyEquiv (F.obj (RingCat.of A)) (topologicalVariant F A),
      e.toFun = (topologicalVariant.unit F A).hom := sorry

/- `topologicalVariant_pi0_K` and `topologicalVariant_not_discrete_K1`: comment only (they need the
K-theory functor of GeneralAlgebraicKTheory). -/
-- signature (not yet statable at the pins): example

end TauCeti

/-! ## H.5:spectra — symmetric spectra of simplicial sets; H.5:S-delooping — the K-theory spectrum -/

/-- `H.5:spectra/simplicial-spheres-and-smash`: pointed simplicial sets. -/
abbrev SSet.Pointed := Under (⊤_ SSet.{u})

namespace SSet.Pointed

/-- The symmetric monoidal structure with tensor `K ∧ L = (K × L) ⧸ (K ∨ L)` and unit `S⁰`. -/
@[instance_reducible]
def smashMonoidal : MonoidalCategory SSet.Pointed.{u} := sorry

/-- `K ∧ L = (K × L) ⧸ (K ∨ L)`, the tensor product of `smashMonoidal`. -/
abbrev smash (K L : SSet.Pointed.{u}) : SSet.Pointed.{u} :=
  letI := smashMonoidal.{u}
  MonoidalCategoryStruct.tensorObj K L

/-- The smash product of two maps. -/
def smashMap {K K' L L' : SSet.Pointed.{u}} (f : K ⟶ K') (g : L ⟶ L') : smash K L ⟶ smash K' L' :=
  letI := smashMonoidal.{u}
  MonoidalCategoryStruct.tensorHom f g

/-- `S¹ = Δ[1] ⧸ ∂Δ[1]`. -/
def circle : SSet.Pointed.{u} := sorry

/-- `Sⁿ = (S¹)^{∧ n}` with the permutation action of `Σ_n`. -/
def sphere (n : ℕ) : SSet.Pointed.{u} := sorry

def sphereAction (n : ℕ) : Equiv.Perm (Fin n) →* Aut (sphere.{u} n) := sorry

def loop (K : SSet.Pointed.{u}) : SSet.Pointed.{u} := sorry

-- signature (not yet statable at the pins): theorem toTop_smash (K L : SSet.Pointed.{u})
-- `|K ∧ L| ≅ |K| ∧ |L|` with the smash product of realisations formed in compactly generated spaces.

end SSet.Pointed

/-- `sphere_zero` (degenerate). -/
example (K : SSet.Pointed.{u}) : Nonempty (SSet.Pointed.smash (SSet.Pointed.sphere 0) K ≅ K) := sorry

/-- `circle_cells` (computation). -/
example : Nonempty (SSet.toTop.obj SSet.Pointed.circle.{0}.right ≃ₜ Circle) := sorry

/-- `sphere_toTop` (compatibility). -/
example (n : ℕ) : Nonempty (SSet.toTop.obj (SSet.Pointed.sphere.{0} n).right ≃ₜ
    Metric.sphere (0 : Fin (n + 1) → ℝ) 1) := sorry

/-- `smash_not_product` (non-example): `S¹ ∧ S¹` realises to `S²`, `S¹ × S¹` to the torus. -/
example : ¬ Nonempty (SSet.toTop.obj (SSet.Pointed.smash SSet.Pointed.circle.{0} SSet.Pointed.circle).right ≃ₜ
    (Circle × Circle)) := sorry

namespace TauCeti

open SSet.Pointed

/-- `H.5:spectra/symmetric-spectrum`. The equivariance axiom on the iterated structure maps
`X_n ∧ S^m → X_{n+m}` needs the iterated maps, built with the associativity isomorphisms of the
smash product, and is left out here (see the packet). -/
structure SymmSpectrum : Type (u + 1) where
  level : ℕ → SSet.Pointed.{u}
  action : ∀ n, Equiv.Perm (Fin n) →* Aut (level n)
  σ : ∀ n, smash (level n) circle ⟶ level (n + 1)

namespace SymmSpectrum

/-- Morphisms: `Σ_n`-equivariant level maps compatible with the structure maps. -/
structure Hom (X Y : SymmSpectrum.{u}) where
  app : ∀ n, X.level n ⟶ Y.level n
  equivariant : ∀ n (g : Equiv.Perm (Fin n)), (X.action n g).hom ≫ app n = app n ≫ (Y.action n g).hom
  comm : ∀ n, X.σ n ≫ app (n + 1) = smashMap (app n) (𝟙 circle) ≫ Y.σ n

instance : Category SymmSpectrum.{u} where
  Hom := Hom
  id X := ⟨fun n => 𝟙 (X.level n), sorry, sorry⟩
  comp f g := ⟨fun n => f.app n ≫ g.app n, sorry, sorry⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- Sequential spectra: forget the symmetric group actions. -/
structure Sequential : Type (u + 1) where
  level : ℕ → SSet.Pointed.{u}
  σ : ∀ n, smash (level n) circle ⟶ level (n + 1)

def toSequential (X : SymmSpectrum.{u}) : Sequential.{u} := ⟨X.level, X.σ⟩

def level' (n : ℕ) : SymmSpectrum.{u} ⥤ SSet.Pointed.{u} where
  obj X := X.level n
  map f := f.app n

def sphere : SymmSpectrum.{u} := sorry

def realization (X : SymmSpectrum.{u}) : ℕ → TopCat.{u} := fun n => SSet.toTop.obj (X.level n).right

/-- `symmSpectrum_zero` (degenerate). -/
example : ∃ Z : SymmSpectrum.{u}, IsZero Z := sorry

/-- `symmSpectrum_sphere_level` (computation). -/
example : Nonempty ((sphere.{u}).level 2 ≅ SSet.Pointed.sphere 2) := sorry

/-- `symmSpectrum_colimit_levelwise` (characterisation). -/
example : HasColimits SymmSpectrum.{u} := sorry

/- `symmSpectrum_not_sequential` (non-example): comment only (the `Σ₂`-equivariance on `X₀ ∧ S² → X₂`). -/
-- signature (not yet statable at the pins): example

/-- `H.5:spectra/naive-homotopy-groups`: `π̂_k X = colim_n π_{k+n} |X_n|`. -/
def naivePi (X : SymmSpectrum.{u}) (k : ℤ) : Type u := sorry

instance (X : SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (naivePi X k) := sorry

def naivePi.map {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) : naivePi X k →+ naivePi Y k := sorry

def IsNaivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : Prop :=
  ∀ k, Function.Bijective (naivePi.map f k)

/-- The basepoint of the realisation `|X_n|`: the image of the base vertex. -/
def basepoint (X : SymmSpectrum.{u}) (n : ℕ) : SSet.toTop.obj (X.level n).right := sorry

/-- The canonical map `π_{k+n} |X_n| → π̂_k X` (meaningful for `k + n ≥ 0`). -/
def naivePi_of_level (X : SymmSpectrum.{u}) (k : ℤ) (n : ℕ) :
    HomotopyGroup.Pi (k + n).toNat (SSet.toTop.obj (X.level n).right) (X.basepoint n) →
      naivePi X k := sorry

/-- `H.5:spectra/loop-shift-suspension`. -/
def loop : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
def susp : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
def suspLoopAdj : susp.{u} ⊣ loop := sorry
def shift : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
def lambda : susp.{u} ⟶ shift := sorry

def naivePi_loop (X : SymmSpectrum.{u}) (k : ℤ) : naivePi (loop.obj X) k ≃+ naivePi X (k + 1) := sorry

def naivePi_susp (X : SymmSpectrum.{u}) (k : ℤ) : naivePi X k ≃+ naivePi (susp.obj X) (k + 1) := sorry

/-- `naivePi_sphere_zero` (computation). -/
example : Nonempty (naivePi sphere.{0} 0 ≃+ ℤ) := sorry

/-- `naivePi_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (k : ℤ) : Subsingleton (naivePi Z k) := sorry

/-- `naivePi_sphere_negative` (computation). -/
example (k : ℤ) (hk : k < 0) : Subsingleton (naivePi sphere.{u} k) := sorry

/- `naivePi_not_true_pi` (non-example): comment only (`F₁S¹`, Schwede I §6). -/
-- signature (not yet statable at the pins): example

/- `naivePi_omegaSpectrum_compat` (compatibility): see `IsOmegaSpectrum.naivePi_eq`. -/
-- signature (not yet statable at the pins): example

/-- `H.5:spectra/omega-spectra-and-eilenberg-maclane`: the adjoint `|X_n| → Ω|X_{n+1}|` of the
realised structure map `|X_n| ∧ S¹ → |X_{n+1}|`, into the topological loop space at the basepoint
(so that no Kan condition is needed on the levels). -/
def adjointStructureMap (X : SymmSpectrum.{u}) (n : ℕ) :
    SSet.toTop.obj (X.level n).right ⟶
      TopCat.of (LoopSpace (SSet.toTop.obj (X.level (n + 1)).right) (X.basepoint (n + 1))) := sorry

def IsOmegaSpectrum (X : SymmSpectrum.{u}) : Prop :=
  ∀ n, IsWeakHomotopyEquivalence (adjointStructureMap X n)

def IsConnective (X : SymmSpectrum.{u}) : Prop := ∀ k : ℤ, k < 0 → Subsingleton (naivePi X k)

-- signature (not yet statable at the pins): theorem IsOmegaSpectrum.naivePi_eq {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) (k : ℤ)
-- `π̂_k X ≅ π_{k+n}|X_n|` for `k + n ≥ 0`.

/-- `H.5:spectra/semistable`: `λ_X : S¹ ∧ X → sh X` is a `π̂_*`-isomorphism (Schwede I.3.14). -/
def IsSemistable (X : SymmSpectrum.{u}) : Prop := IsNaivePiIso (lambda.app X)

theorem IsOmegaSpectrum.semistable {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) : IsSemistable X := sorry

/-- `isOmegaSpectrum_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsOmegaSpectrum Z := sorry

/-- `not_isOmegaSpectrum_sphere` (non-example). -/
example : ¬ IsOmegaSpectrum sphere.{u} := sorry

/-- `isConnective_sphere` (computation). -/
example : IsConnective sphere.{u} := sorry

/-- `H.5:spectra/suspension-spectrum`. -/
def suspensionSpectrum : SSet.Pointed.{u} ⥤ SymmSpectrum.{u} := sorry
def suspensionAdj : suspensionSpectrum.{u} ⊣ level' 0 := sorry
def free (m : ℕ) : SSet.Pointed.{u} ⥤ SymmSpectrum.{u} := sorry
def freeAdj (m : ℕ) : free.{u} m ⊣ level' m := sorry

theorem sphereSpectrum_eq : Nonempty (sphere.{u} ≅ suspensionSpectrum.obj (SSet.Pointed.sphere 0)) := sorry

-- signature (not yet statable at the pins): theorem naivePi_suspension (K : SSet.Pointed.{u}) (k : ℤ)
-- `π̂_k Σ^∞ K` is the `k`-th stable homotopy group `colim_n π_{k+n}|K ∧ Sⁿ|`.

/-- `suspensionSpectrum_point` (degenerate). -/
example : IsZero (suspensionSpectrum.{u}.obj (Under.mk (𝟙 (⊤_ SSet.{u})))) := sorry

/-- `suspensionSpectrum_naivePi_zero_S0` (computation). -/
example : Nonempty (naivePi (suspensionSpectrum.{0}.obj (SSet.Pointed.sphere 0)) 0 ≃+ ℤ) := sorry

/-- `suspensionSpectrum_connective` (characterisation). -/
example (K : SSet.Pointed.{u}) : IsConnective (suspensionSpectrum.obj K) := sorry

/-- `free_one_not_piIso` (non-example). -/
example : ¬ IsNaivePiIso ((freeAdj.{u} 1).counit.app sphere) := sorry

/-- `loop_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsZero (loop.obj Z) := sorry

/-- `naivePi_shift` (computation). -/
example (X : SymmSpectrum.{u}) (k : ℤ) : Nonempty (naivePi (shift.obj X) k ≃+ naivePi X (k + 1)) := sorry

/-- `loop_susp_sphere` (compatibility). -/
example : Nonempty (naivePi (susp.{0}.obj sphere) 1 ≃+ ℤ) := sorry

/-- `shift_not_susp` (non-example). -/
example : ¬ IsNaivePiIso (lambda.{u}.app ((free 1).obj (SSet.Pointed.sphere 1))) := sorry

theorem IsSemistable.of_omega {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) : IsSemistable X := hX.semistable
theorem IsSemistable.of_suspension (K : SSet.Pointed.{u}) : IsSemistable (suspensionSpectrum.obj K) := sorry
theorem IsSemistable.of_naivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (hf : IsNaivePiIso f) :
    IsSemistable X ↔ IsSemistable Y := sorry

/-- `isSemistable_sphere` (computation). -/
example : IsSemistable sphere.{u} := sorry
/-- `isSemistable_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsSemistable Z := sorry
/-- `not_isSemistable_free_one` (non-example). -/
example : ¬ IsSemistable ((free 1).obj (SSet.Pointed.sphere.{u} 1)) := sorry
/- `isSemistable_HA` (compatibility): see `eilenbergMacLane.isOmegaSpectrum`. -/
-- signature (not yet statable at the pins): example

/-- `H.5:spectra/true-homotopy-groups`. -/
def pi (X : SymmSpectrum.{u}) (k : ℤ) : Type u := sorry
instance (X : SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (pi X k) := sorry
def pi.map {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) : pi X k →+ pi Y k := sorry
def naivePiToPi (X : SymmSpectrum.{u}) (k : ℤ) : naivePi X k →+ pi X k := sorry
theorem naivePiToPi_iso_of_semistable {X : SymmSpectrum.{u}} (hX : IsSemistable X) (k : ℤ) :
    Function.Bijective (naivePiToPi X k) := sorry

/-- `H.5:spectra/stable-equivalence` (via true homotopy groups, equivalent to the injective
Ω-spectrum definition by Schwede I Theorem 6.2). -/
def stableEquivalences : MorphismProperty SymmSpectrum.{u} :=
  fun _ _ f => ∀ k, Function.Bijective (pi.map f k)

theorem stableEquivalence_of_naivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (hf : IsNaivePiIso f) :
    stableEquivalences f := sorry
theorem stableEquivalence_iff_truePi {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    stableEquivalences f ↔ ∀ k, Function.Bijective (pi.map f k) := Iff.rfl
theorem stableEquivalence_iff_naivePi_of_semistable {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : IsSemistable X) (hY : IsSemistable Y) : stableEquivalences f ↔ IsNaivePiIso f := sorry
theorem stableEquivalences.twoOutOfThree : (stableEquivalences.{u}).HasTwoOutOfThreeProperty := sorry

/-- `stableEquivalence_id` (degenerate). -/
example (X : SymmSpectrum.{u}) : stableEquivalences (𝟙 X) := sorry
/-- `stableEquivalence_free_one_sphere` (computation). -/
example : stableEquivalences ((freeAdj.{u} 1).counit.app sphere) := sorry
/-- `stableEquivalence_levelwise` (compatibility). -/
example {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (h : ∀ n, IsWeakHomotopyEquivalence
    (SSet.toTop.map (f.app n).right)) : stableEquivalences f := sorry
/-- `not_stableEquivalence_zero_sphere` (non-example). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : Z ⟶ sphere) : ¬ stableEquivalences f := sorry

/-- `pi_sphere_zero` (computation). -/
example : Nonempty (pi sphere.{0} 0 ≃+ ℤ) := sorry
/-- `pi_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (k : ℤ) : Subsingleton (pi Z k) := sorry
/-- `pi_free_one` (compatibility). -/
example (k : ℤ) : Nonempty (pi ((free 1).obj (SSet.Pointed.sphere.{u} 1)) k ≃+ pi sphere k) := sorry
/-- `pi_ne_naivePi_free_one` (non-example). -/
example : ¬ Function.Injective (naivePiToPi ((free 1).obj (SSet.Pointed.sphere.{u} 1)) 0) := sorry

/-- `H.5:spectra/stable-model-structure`. -/
@[instance_reducible]
def stableModelCategory : HomotopicalAlgebra.ModelCategory SymmSpectrum.{u} := sorry

theorem stableModelCategory_weakEquivalences :
    letI := stableModelCategory.{u}
    HomotopicalAlgebra.weakEquivalences SymmSpectrum.{u} = stableEquivalences := sorry

end SymmSpectrum

/-- `H.5:spectra/stable-homotopy-category`. -/
def SHC : Type (u + 1) := (SymmSpectrum.stableEquivalences.{u}).Localization

instance : Category.{u + 1} SHC.{u} := by unfold SHC; infer_instance

namespace SHC

def γ : SymmSpectrum.{u} ⥤ SHC.{u} := (SymmSpectrum.stableEquivalences.{u}).Q

theorem isIso_γ_iff {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    IsIso (γ.map f) ↔ SymmSpectrum.stableEquivalences f := sorry

instance preadditive : Preadditive SHC.{u} := sorry
instance : HasZeroObject SHC.{u} := sorry
instance shiftFunctor : HasShift SHC.{u} ℤ := sorry
instance (n : ℤ) : (CategoryTheory.shiftFunctor SHC.{u} n).Additive := sorry

/-- The spheres `S^k`, `k ∈ ℤ`. -/
def sphere (k : ℤ) : SHC.{u} := (CategoryTheory.shiftFunctor SHC k).obj (γ.obj SymmSpectrum.sphere)

def homSphereEquiv (X : SymmSpectrum.{u}) (k : ℤ) : (sphere k ⟶ γ.obj X) ≃ SymmSpectrum.pi X k := sorry

end SHC

namespace SymmSpectrum

theorem pi_eq_SHC_hom (X : SymmSpectrum.{u}) (k : ℤ) :
    Nonempty ((SHC.sphere k ⟶ SHC.γ.obj X) ≃ pi X k) := ⟨SHC.homSphereEquiv X k⟩

end SymmSpectrum

/-- `SHC_zero_object` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsZero (SHC.γ.obj Z) := sorry
/- `SHC_hom_sphere_HA` (computation): see `eilenbergMacLane.piZeroEquiv`. -/
-- signature (not yet statable at the pins): example
/-- `SHC_localization_compat` (compatibility). -/
example : SHC.γ.{u}.IsLocalization SymmSpectrum.stableEquivalences := sorry
/-- `SHC_not_levelwise` (non-example). -/
example : ∃ (X Y : SymmSpectrum.{u}) (f : X ⟶ Y), SymmSpectrum.stableEquivalences f ∧
    ¬ ∀ n, IsWeakHomotopyEquivalence (SSet.toTop.map (f.app n).right) := sorry

namespace SymmSpectrum

/-- `H.5:spectra/mapping-cone-and-homotopy-fibre`. -/
def mappingCone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : SymmSpectrum.{u} := sorry
def mappingCone.inr {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : Y ⟶ mappingCone f := sorry
def mappingCone.δ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : mappingCone f ⟶ susp.obj X := sorry
def homotopyFiber {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : SymmSpectrum.{u} := sorry
def mappingCone.map {X Y X' Y' : SymmSpectrum.{u}} {f : X ⟶ Y} {f' : X' ⟶ Y'} (a : X ⟶ X') (b : Y ⟶ Y')
    (w : f ≫ b = a ≫ f') : mappingCone f ⟶ mappingCone f' := sorry
theorem mappingCone_stableEquivalence {X Y X' Y' : SymmSpectrum.{u}} {f : X ⟶ Y} {f' : X' ⟶ Y'}
    (a : X ⟶ X') (b : Y ⟶ Y') (w : f ≫ b = a ≫ f') (ha : stableEquivalences a)
    (hb : stableEquivalences b) : stableEquivalences (mappingCone.map a b w) := sorry

/-- `mappingCone_id_trivial` (degenerate). -/
example (X : SymmSpectrum.{u}) : IsZero (SHC.γ.obj (mappingCone (𝟙 X))) := sorry
/-- `mappingCone_toZero` (computation). -/
example (X Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : X ⟶ Z) :
    Nonempty (SHC.γ.obj (mappingCone f) ≅ SHC.γ.obj (susp.obj X)) := sorry
/-- `homotopyFiber_fromZero` (computation). -/
example (Y Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : Z ⟶ Y) :
    Nonempty (SHC.γ.obj (homotopyFiber f) ≅ SHC.γ.obj (loop.obj Y)) := sorry
/-- `mappingCone_not_quotient` (non-example). -/
example (X Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : X ⟶ Z) (hX : ¬ IsZero (SHC.γ.obj X)) :
    ¬ IsZero (SHC.γ.obj (mappingCone f)) := sorry

/-- `H.5:spectra/cofibre-long-exact-sequence` (exactness at `π_k Y`). -/
theorem cofibre_exact {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (pi.map f k) (pi.map (mappingCone.inr f) k) := sorry

/-- `H.5:spectra/fibre-cofibre-shift`. -/
theorem fibre_cofibre_shift {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    Nonempty (SHC.γ.obj (homotopyFiber f) ≅ SHC.γ.obj (loop.obj (mappingCone f))) := sorry

/-- `H.5:spectra/finite-biproducts`. -/
theorem coprod_to_prod_stableEquivalence (X Y : SymmSpectrum.{u}) [HasBinaryCoproduct X Y]
    [HasBinaryProduct X Y] : ∃ f : X ⨿ Y ⟶ X ⨯ Y, stableEquivalences f ∧
      coprod.inl ≫ f ≫ prod.fst = 𝟙 X ∧ coprod.inr ≫ f ≫ prod.snd = 𝟙 Y := sorry

end SymmSpectrum

namespace SHC

/-- `H.5:spectra/triangulated-structure`. -/
instance pretriangulated : Pretriangulated SHC.{u} := sorry
instance isTriangulated : IsTriangulated SHC.{u} := sorry

end SHC

namespace SymmSpectrum

/-- `H.5:spectra/smash-product`. -/
def smash (X Y : SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

/-- A bimorphism `(X, Y) → Z`: compatible equivariant maps `X_p ∧ Y_q → Z_{p+q}`. -/
structure Bimorphism (X Y Z : SymmSpectrum.{u}) where
  app : ∀ p q, SSet.Pointed.smash (X.level p) (Y.level q) ⟶ Z.level (p + q)

def smash.desc {X Y Z : SymmSpectrum.{u}} : (smash X Y ⟶ Z) ≃ Bimorphism X Y Z := sorry

def smash.map {X X' Y Y' : SymmSpectrum.{u}} (f : X ⟶ X') (g : Y ⟶ Y') : smash X Y ⟶ smash X' Y' := sorry
def smash.assoc (X Y Z : SymmSpectrum.{u}) : smash (smash X Y) Z ≅ smash X (smash Y Z) := sorry
def smash.leftUnitor (X : SymmSpectrum.{u}) : smash sphere X ≅ X := sorry
def smash.rightUnitor (X : SymmSpectrum.{u}) : smash X sphere ≅ X := sorry
/-- The symmetry isomorphism of the smash product. -/
def smash.twist (X Y : SymmSpectrum.{u}) : smash X Y ≅ smash Y X := sorry

@[instance_reducible]
def monoidal : MonoidalCategory SymmSpectrum.{u} := sorry

def internalHom (Y Z : SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

def smash_suspensionSpectrum (K L : SSet.Pointed.{u}) :
    smash (suspensionSpectrum.obj K) (suspensionSpectrum.obj L) ≅
      suspensionSpectrum.obj (SSet.Pointed.smash K L) := sorry

def mapSpace (X Y : SymmSpectrum.{u}) : SSet.{u} := sorry

/-- `smash_sphere_left` (degenerate). -/
example (X : SymmSpectrum.{u}) : Nonempty (smash sphere X ≅ X) := sorry
/-- `smash_level_zero` (computation). -/
example (X Y : SymmSpectrum.{u}) : Nonempty ((smash X Y).level 0 ≅ SSet.Pointed.smash (X.level 0) (Y.level 0)) := sorry
/-- `smash_suspension_compat` (compatibility). -/
example (X : SymmSpectrum.{u}) : Nonempty (smash (suspensionSpectrum.obj (SSet.Pointed.sphere 0)) X ≅ X) := sorry
/- `smash_twist_sphere_sign` (non-example): see `twistSign`. -/
-- signature (not yet statable at the pins): example

/-- `H.5:spectra/derived-smash-product`. -/
@[instance_reducible]
def _root_.TauCeti.SHC.derivedSmash : MonoidalCategory SHC.{u} := sorry

/- `H.5:spectra/twist-sign`: the twist on `S^p ∧ S^q` is `(-1)^{pq}` (stated on `π_{p+q}`). -/
-- signature (not yet statable at the pins): theorem twistSign (p q : ℕ)

/-- The derived smash product `γ X ∧ᴸ γ Y` in the stable homotopy category. -/
abbrev smashL (X Y : SymmSpectrum.{u}) : SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategoryStruct.tensorObj (SHC.γ.obj X) (SHC.γ.obj Y)

/-- `H.5:spectra/homotopy-group-pairing`: the pairing into
`π_{p+q}(X ∧ᴸ Y) = [S^{p+q}, γ X ∧ᴸ γ Y]`. -/
def piPairing (X Y : SymmSpectrum.{u}) (p q : ℤ) :
    pi X p →+ pi Y q →+ (SHC.sphere (p + q) ⟶ smashL X Y) := sorry

-- signature (not yet statable at the pins): theorem piPairing_assoc (X Y Z : SymmSpectrum.{u}) (p q r : ℤ)
-- signature (not yet statable at the pins): theorem piPairing_comm (X Y : SymmSpectrum.{u}) (p q : ℤ)
-- `τ_*(x · y) = (-1)^{pq} y · x` under the symmetry `smash X Y ≅ smash Y X`.
-- signature (not yet statable at the pins): theorem piPairing_unit (X : SymmSpectrum.{u}) (p : ℤ)
-- signature (not yet statable at the pins): theorem piPairing_naturality {X Y X' Y' : SymmSpectrum.{u}} (f : X ⟶ X') (g : Y ⟶ Y') (p q : ℤ)
theorem piPairing_bottom_iso (X Y : SymmSpectrum.{u}) (k l : ℤ)
    (hX : ∀ i < k, Subsingleton (pi X i)) (hY : ∀ i < l, Subsingleton (pi Y i)) :
    ∃ φ : TensorProduct ℤ (pi X k) (pi Y l) ≃+ (SHC.sphere (k + l) ⟶ smashL X Y),
      ∀ x y, φ (TensorProduct.tmul ℤ x y) = piPairing X Y k l x y := sorry

/- `piPairing_sphere_ring` (computation): comment (graded-commutative ring `π_* S`). -/
-- signature (not yet statable at the pins): example
/-- `piPairing_zero_spectrum` (degenerate). -/
example (X Z : SymmSpectrum.{u}) (hZ : IsZero Z) (p q : ℤ) (x : pi X p) (z : pi Z q) :
    piPairing X Z p q x z = 0 := sorry
/- `piPairing_HA_HB` (compatibility): see `eilenbergMacLane`. -/
-- signature (not yet statable at the pins): example
/- `piPairing_not_commutative` (non-example): comment (sign on `ι · ι`). -/
-- signature (not yet statable at the pins): example

end SymmSpectrum

/-- `H.5:spectra/ring-spectrum`. -/
structure SymmRingSpectrum : Type (u + 1) where
  carrier : SymmSpectrum.{u}
  mul : SymmSpectrum.smash carrier carrier ⟶ carrier
  unit : SymmSpectrum.sphere ⟶ carrier
  mul_assoc : SymmSpectrum.smash.map mul (𝟙 carrier) ≫ mul =
    (SymmSpectrum.smash.assoc carrier carrier carrier).hom ≫ SymmSpectrum.smash.map (𝟙 carrier) mul ≫ mul
  one_mul : SymmSpectrum.smash.map unit (𝟙 carrier) ≫ mul = (SymmSpectrum.smash.leftUnitor carrier).hom
  mul_one : SymmSpectrum.smash.map (𝟙 carrier) unit ≫ mul = (SymmSpectrum.smash.rightUnitor carrier).hom

namespace SymmRingSpectrum

def IsCommutative (R : SymmRingSpectrum.{u}) : Prop :=
  (SymmSpectrum.smash.twist R.carrier R.carrier).hom ≫ R.mul = R.mul

/-- Maps of ring spectra. -/
structure Hom (R S : SymmRingSpectrum.{u}) where
  f : R.carrier ⟶ S.carrier
  unit_comm : R.unit ≫ f = S.unit
  mul_comm : R.mul ≫ f = SymmSpectrum.smash.map f f ≫ S.mul

structure Module (R : SymmRingSpectrum.{u}) where
  carrier : SymmSpectrum.{u}
  act : SymmSpectrum.smash carrier R.carrier ⟶ carrier

def levelMul (R : SymmRingSpectrum.{u}) (n m : ℕ) :
    SSet.Pointed.smash (R.carrier.level n) (R.carrier.level m) ⟶ R.carrier.level (n + m) :=
  (SymmSpectrum.smash.desc R.mul).app n m

def piRing (R : SymmRingSpectrum.{u}) (p q : ℤ) :
    SymmSpectrum.pi R.carrier p →+ SymmSpectrum.pi R.carrier q →+ SymmSpectrum.pi R.carrier (p + q) := sorry

end SymmRingSpectrum

/-- `sphere_initial_ring` (characterisation). -/
example : ∃ S : SymmRingSpectrum.{u}, S.carrier = SymmSpectrum.sphere ∧
    ∀ R : SymmRingSpectrum.{u}, Nonempty (Unique (SymmRingSpectrum.Hom S R)) := sorry
/-- `ringSpectrum_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : ∃ R : SymmRingSpectrum.{u}, R.carrier = Z ∧
    ∀ S : SymmRingSpectrum.{u}, Nonempty (Unique (SymmRingSpectrum.Hom S R)) := sorry
/- `ringSpectrum_HZ_pi` (compatibility): see `eilenbergMacLaneRing.piRingEquiv`. -/
-- signature (not yet statable at the pins): example
/- `ringSpectrum_moore_two_not_ring` (non-example): see `H.6`'s `moore_two_not_ring`. -/
-- signature (not yet statable at the pins): example

namespace SymmSpectrum

/-- `H.5:spectra/operadic-algebras`. -/
structure Operad : Type (u + 1) where
  obj : ℕ → SymmSpectrum.{u}
  unit : sphere ⟶ obj 1

structure Operad.Algebra (O : Operad.{u}) where
  carrier : SymmSpectrum.{u}
  act : ∀ n, smash (O.obj n) carrier ⟶ carrier
-- (The `Σ_n`-coinvariants of `O(n) ∧ A^{∧ n}` need the smash powers; recorded schematically.)

def Operad.ofSSet (O : ℕ → SSet.{u}) : Operad.{u} := sorry
-- `TauCeti.SymmSpectrum.Operad.comAlgebraEquiv`: algebras over the commutative operad are exactly the
-- commutative symmetric ring spectra (needs the operad `Com` in symmetric spectra).
/-- E∞: contractible terms with free `Σ_n`-actions. -/
def Operad.IsEInfty (O : ℕ → SSet.{u}) (act : ∀ n, Equiv.Perm (Fin n) →* Aut (O n)) : Prop :=
  ∀ n, ContractibleSpace (SSet.toTop.obj (O n)) ∧
    ∀ g : Equiv.Perm (Fin n), g ≠ 1 → ∀ (k : ℕ) (x : (O n) _⦋k⦌), (act n g).hom.app _ x ≠ x

/- `operad_com_algebra_HR` / `operad_trivial_algebra` / `operad_ass_ring_compat` / `operad_moore_two_not_A2`:
comment-level tests (they need the commutative and associative operads in symmetric spectra). -/
-- signature (not yet statable at the pins): example

/-- `H.5:spectra/eilenberg-maclane-spectrum`. -/
def eilenbergMacLane (A : Type u) [AddCommGroup A] : SymmSpectrum.{u} := sorry

namespace eilenbergMacLane

def map {A B : Type u} [AddCommGroup A] [AddCommGroup B] (φ : A →+ B) :
    eilenbergMacLane A ⟶ eilenbergMacLane B := sorry

theorem isOmegaSpectrum (A : Type u) [AddCommGroup A] : IsOmegaSpectrum (eilenbergMacLane A) := sorry

def piZeroEquiv (A : Type u) [AddCommGroup A] : pi (eilenbergMacLane A) 0 ≃+ A := sorry

theorem level_kpi (A : Type u) [AddCommGroup A] (n : ℕ) :
    Nonempty (ContinuousMap.HomotopyEquiv (SSet.toTop.obj ((eilenbergMacLane A).level (n + 1)).right)
      (EilenbergMacLaneSpace A (n + 1))) := sorry

theorem uniqueness (A : Type u) [AddCommGroup A] (X : SymmSpectrum.{u}) (hX : IsConnective X) :
    Nonempty ((SHC.γ.obj X ⟶ SHC.γ.obj (eilenbergMacLane A)) ≃ (pi X 0 →+ A)) := sorry

end eilenbergMacLane

/-- `isOmegaSpectrum_HA` (computation). -/
example (A : Type u) [AddCommGroup A] : IsOmegaSpectrum (eilenbergMacLane A) :=
  eilenbergMacLane.isOmegaSpectrum A

/-- `eilenbergMacLane_zero` (degenerate). -/
example : IsZero (SHC.γ.obj (eilenbergMacLane (PUnit.{u + 1}))) := sorry
/-- `eilenbergMacLane_pi_Z` (computation). -/
example : Nonempty (pi (eilenbergMacLane ℤ) 0 ≃+ ℤ) ∧ Subsingleton (pi (eilenbergMacLane ℤ) 1) := sorry
/-- `eilenbergMacLane_level_one` (compatibility). -/
example (A : Type u) [AddCommGroup A] :
    Nonempty (ContinuousMap.HomotopyEquiv (SSet.toTop.obj ((eilenbergMacLane A).level 1).right)
      (Group.classifyingSpace (Multiplicative A))) := sorry
/-- `eilenbergMacLane_not_sphere` (non-example). -/
example : ¬ Nonempty (SHC.γ.obj (eilenbergMacLane ℤ) ≅ SHC.γ.obj (sphere.{0})) := sorry

/-- `H.5:spectra/eilenberg-maclane-ring`. -/
def eilenbergMacLaneRing (R : Type u) [Ring R] : SymmRingSpectrum.{u} := sorry

theorem eilenbergMacLaneRing.isCommutative (R : Type u) [CommRing R] :
    (eilenbergMacLaneRing R).IsCommutative := sorry

def eilenbergMacLaneModule (R : Type u) [Ring R] (M : Type u) [AddCommGroup M] [_root_.Module R M] :
    (eilenbergMacLaneRing R).Module := sorry

def eilenbergMacLaneRing.piRingEquiv (R : Type u) [Ring R] : pi (eilenbergMacLaneRing R).carrier 0 ≃+ R := sorry

-- `TauCeti.SymmSpectrum.HRModDerivedEquiv`: `Ho(HR-Mod) ≃ DerivedCategory (ModuleCat R)` as triangulated
-- categories for commutative `R` (Shipley); the homotopy category of module spectra is not built here.

/-- `eilenbergMacLaneRing_Z_pi` (computation). -/
example : Nonempty (pi (eilenbergMacLaneRing ℤ).carrier 0 ≃+ ℤ) := ⟨eilenbergMacLaneRing.piRingEquiv ℤ⟩
/-- `eilenbergMacLaneRing_zero` (degenerate). -/
example : IsZero (SHC.γ.obj (eilenbergMacLaneRing (PUnit.{u + 1})).carrier) := sorry
/- `eilenbergMacLaneRing_unit_compat` (compatibility). -/
-- signature (not yet statable at the pins): example
/-- `eilenbergMacLaneRing_smash_not_self` (non-example). -/
example : ¬ Subsingleton (SHC.sphere 1 ⟶ smashL (eilenbergMacLane (ZMod 2)) (eilenbergMacLane (ZMod 2))) := sorry

/-- `H.5:spectra/eilenberg-maclane-of-chain-complex`. -/
def eilenbergMacLaneComplex : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ ⥤ SymmSpectrum.{u} := sorry

namespace eilenbergMacLaneComplex

def piIso (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) (k : ℤ) :
    pi (eilenbergMacLaneComplex.obj C) k ≃+ C.homology (-k) := sorry

theorem quasiIso {C D : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ} (f : C ⟶ D) [QuasiIso f] :
    stableEquivalences (eilenbergMacLaneComplex.map f) := sorry

theorem shift (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((CategoryTheory.shiftFunctor _ (1 : ℤ)).obj C)) ≅
      SHC.γ.obj (susp.obj (eilenbergMacLaneComplex.obj C))) := sorry

theorem single (A : Type u) [AddCommGroup A] [_root_.Module (ULift ℤ) A] :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((HomologicalComplex.single _ _ 0).obj
      (ModuleCat.of (ULift ℤ) A))) ≅ SHC.γ.obj (eilenbergMacLane A)) := sorry

end eilenbergMacLaneComplex

/-- `eilenbergMacLaneComplex_zero` (degenerate). -/
example (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) (hC : IsZero C) :
    IsZero (SHC.γ.obj (eilenbergMacLaneComplex.obj C)) := sorry
/- `eilenbergMacLaneComplex_single` (compatibility). -/
-- signature (not yet statable at the pins): example (A : Type u) [AddCommGroup A] [_root_.Module (ULift ℤ) A] :
--       Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((HomologicalComplex.single _ _ 0).obj
--         (ModuleCat.of (ULift ℤ) A))) ≅ SHC.γ.obj (eilenbergMacLane A)) := eilenbergMacLaneComplex.single A
--   /-- `eilenbergMacLaneComplex_negative` (computation). -/
--   example
/- `eilenbergMacLaneComplex_not_formal_over_Z4` (non-example). -/
-- signature (not yet statable at the pins): example

/- `H.5:spectra/eilenberg-maclane-cohomology`: comment-level (singular cohomology is Tau Ceti stage 6):
`[Σ^∞_+ X, Σ^k HA] ≃ H^k(X; A)`. -/
-- signature (not yet statable at the pins): theorem eilenbergMacLane_cohomology

end SymmSpectrum

namespace SHC

/-- `H.5:spectra/postnikov-sections`. -/
def connectiveCover (n : ℤ) : SHC.{u} ⥤ SHC.{u} := sorry
def connectiveCover.counit (n : ℤ) : connectiveCover.{u} n ⟶ 𝟭 _ := sorry
def postnikovSection (n : ℤ) : SHC.{u} ⥤ SHC.{u} := sorry
def postnikovSection.unit (n : ℤ) : 𝟭 _ ⟶ postnikovSection.{u} n := sorry

def postnikovTriangle (n : ℤ) (X : SHC.{u}) : Pretriangulated.Triangle SHC.{u} :=
  Pretriangulated.Triangle.mk ((connectiveCover.counit (n + 1)).app X) ((postnikovSection.unit n).app X) sorry

theorem postnikovTriangle_distinguished (n : ℤ) (X : SHC.{u}) :
    postnikovTriangle n X ∈ distTriang SHC := sorry

/-- True homotopy groups of an object of `SHC`. -/
abbrev piObj (X : SHC.{u}) (k : ℤ) : Type (u + 1) := sphere k ⟶ X

theorem pi_connectiveCover (n k : ℤ) (X : SHC.{u}) (hk : n ≤ k) :
    Nonempty (piObj ((connectiveCover n).obj X) k ≃+ piObj X k) := sorry
theorem pi_postnikovSection (n k : ℤ) (X : SHC.{u}) (hk : k ≤ n) :
    Nonempty (piObj ((postnikovSection n).obj X) k ≃+ piObj X k) := sorry

def postnikovTStructure : Triangulated.TStructure SHC.{u} := sorry

-- signature (not yet statable at the pins): theorem connectiveCover_adj (n : ℤ)
-- `connectiveCover n` is right adjoint to the inclusion of `(n-1)`-connected spectra.

end SHC

/-- `connectiveCover_connective` (degenerate). -/
example (X : SymmSpectrum.{u}) (hX : X.IsConnective) :
    IsIso ((SHC.connectiveCover.counit 0).app (SHC.γ.obj X)) := sorry
/-- `postnikovSection_zero_HA` (computation). -/
example (A : Type u) [AddCommGroup A] :
    IsIso ((SHC.postnikovSection.unit 0).app (SHC.γ.obj (SymmSpectrum.eilenbergMacLane A))) := sorry
/- `connectiveCover_KU_ku` (compatibility): comment (`KU` and `ku` are RefinedTraceMethods:RT.4 objects). -/
-- signature (not yet statable at the pins): example
/-- `connectiveCover_not_identity_negative` (non-example). -/
example : IsZero ((SHC.connectiveCover 0).obj ((CategoryTheory.shiftFunctor SHC.{0} (-1 : ℤ)).obj
    (SHC.γ.obj (SymmSpectrum.eilenbergMacLane ℤ)))) := sorry

namespace SHC

/-- `H.5:spectra/sequential-homotopy-colimit`. -/
def hocolimSeq (X : ℕ ⥤ SHC.{u}) : SHC.{u} := sorry
def hocolimSeq.ι (X : ℕ ⥤ SHC.{u}) (n : ℕ) : X.obj n ⟶ hocolimSeq X := sorry
-- signature (not yet statable at the pins): theorem hocolimSeq_pi (X : ℕ ⥤ SHC.{u}) (k : ℤ)
-- `colim_n π_k(X n) ≅ π_k(hocolimSeq X)`.
-- signature (not yet statable at the pins): theorem hocolimSeq_milnor (X : ℕ ⥤ SHC.{u})

end SHC

def SymmSpectrum.telescope (X : ℕ ⥤ SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

/-- `hocolimSeq_const` (degenerate). -/
example (X : SHC.{u}) : Nonempty (SHC.hocolimSeq ((Functor.const ℕ).obj X) ≅ X) := sorry
/- `hocolimSeq_mul_rational` (computation): comment (`π₀ = ℚ` for `S →1 S →2 S → ⋯`). -/
-- signature (not yet statable at the pins): example
/-- `hocolimSeq_pi_compat` (compatibility). -/
example (X : ℕ ⥤ SymmSpectrum.{u}) : Nonempty (SHC.hocolimSeq (X ⋙ SHC.γ) ≅ SHC.γ.obj (SymmSpectrum.telescope X)) := sorry
/- `hocolimSeq_not_sum` (non-example). -/
-- signature (not yet statable at the pins): example

/- `H.5:spectra/connective-spectra-via-deloopings`, `H.5:spectra/grouplike-einfty-connective-spectra`,
`H.5:spectra/picard-one-truncated-spectra`: equivalences of homotopy theories, recorded as comments
(they compare with the ∞-categorical statements of Bhatt–Scholze §12). -/
-- signature (not yet statable at the pins): theorem connectiveSpectra_comparisons

/-- Stand-in for the Waldhausen-category structure owned by GeneralAlgebraicKTheory:K.4:construction. -/
structure Stub.WaldhausenData (C : Type u) [Category.{u} C] where
  cof : MorphismProperty C
  we : MorphismProperty C

namespace WaldhausenCategory

/-- `H.5:S-delooping/k-theory-symmetric-spectrum`. -/
def kSpectrum (C : Type u) [Category.{u} C] [HasZeroObject C] (W : Stub.WaldhausenData C) :
    SymmSpectrum.{u} := sorry

variable (C : Type u) [Category.{u} C] [HasZeroObject C] (W : Stub.WaldhausenData C)

/-- Functoriality in exact functors: `F` preserves cofibrations and weak equivalences. -/
def kSpectrum.map {D : Type u} [Category.{u} D] [HasZeroObject D] (W' : Stub.WaldhausenData D) (F : C ⥤ D)
    (hcof : W.cof ≤ W'.cof.inverseImage F) (hwe : W.we ≤ W'.we.inverseImage F) :
    kSpectrum C W ⟶ kSpectrum D W' := sorry

/-- Level zero is the nerve of the weak equivalences (not group-completed). -/
theorem kSpectrum.level_zero : ∃ (D : Type u) (_ : Category.{u} D),
    Nonempty (((kSpectrum C W).level 0).right ≅ nerve D) := sorry

theorem kSpectrum.isPositiveOmega (n : ℕ) :
    IsWeakHomotopyEquivalence (SymmSpectrum.adjointStructureMap (kSpectrum C W) (n + 1)) := sorry

theorem kSpectrum.isSemistable : (kSpectrum C W).IsSemistable := sorry

-- signature (not yet statable at the pins): theorem kSpectrum.sequentialComparison
-- The underlying sequential spectrum agrees with Weibel's `Ω|wS.C|, |wS.C|, |wS.S.C|, …`.

/-- `H.5:S-delooping/iterated-S-construction-omega-spectrum`: `π_i K(C) = π_{i+1}|wS.C|`, `i ≥ 0`, and
`π_i K(C) = 0` for `i < 0`. -/
theorem kSpectrum_connective : (kSpectrum C W).IsConnective := sorry

/-- `H.5:S-delooping/k-theory-spectrum-functoriality`. -/
theorem kSpectrum.map_stableEquivalence {D : Type u} [Category.{u} D] [HasZeroObject D]
    (W' : Stub.WaldhausenData D) (F : C ⥤ D) [F.IsEquivalence]
    (hcof : W.cof = W'.cof.inverseImage F) (hwe : W.we = W'.we.inverseImage F) :
    SymmSpectrum.stableEquivalences (kSpectrum.map C W W' F hcof.le hwe.le) := sorry

end WaldhausenCategory

/-- `kSpectrum_zero_category` (degenerate). -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [∀ X Y : C, Subsingleton (X ⟶ Y)]
    (W : Stub.WaldhausenData C) : IsZero (SHC.γ.obj (WaldhausenCategory.kSpectrum C W)) := sorry
/- `kSpectrum_finiteSets_sphere` (computation): comment (quoted Barratt–Priddy–Quillen–Segal). -/
-- signature (not yet statable at the pins): example
/- `kSpectrum_pi0_K0` (compatibility): comment (`K₀(C)` is GeneralAlgebraicKTheory's). -/
-- signature (not yet statable at the pins): example
/- `kSpectrum_level_zero_not_groupCompleted` (non-example): comment. -/
-- signature (not yet statable at the pins): example

end TauCeti

/-! ## H.6 — Coefficients, completion and spectral sequences -/

namespace TauCeti.SHC

open CategoryTheory.Pretriangulated

/-- `H.6/moore-spectrum`: `S/m`, the cofibre of `m : S → S`. -/
def moore (m : ℕ) : SHC.{u} := sorry

namespace moore

/-- The defining distinguished triangle `S →m S → S/m →δ ΣS`. -/
def triangle (m : ℕ) : Triangle SHC.{u} :=
  Triangle.mk ((m : ℤ) • 𝟙 (sphere.{u} 0)) (sorry : sphere 0 ⟶ moore m) sorry

theorem triangle_distinguished (m : ℕ) : triangle.{u} m ∈ distTriang SHC := sorry

def bockstein (m : ℕ) : moore.{u} m ⟶ (CategoryTheory.shiftFunctor SHC (1 : ℤ)).obj (sphere 0) :=
  (triangle m).mor₃

-- signature (not yet statable at the pins): theorem homologyZero (m : ℕ)
-- `H₀(S/m; ℤ) = π₀(HZ ∧ S/m) ≅ ZMod m`, `H_k = 0` for `k ≠ 0`.

def piZero (m : ℕ) : piObj (moore.{u} m) 0 ≃+ ZMod m := sorry

def liftHom {m m' : ℕ} (φ : ZMod m →+ ZMod m') : moore.{u} m ⟶ moore m' := sorry

end moore

/-- `moore_one_trivial` (degenerate). -/
example : IsZero (moore.{u} 1) := sorry
/-- `moore_two_pi_two` (computation). -/
example : Nonempty (piObj (moore.{u} 2) 2 ≃+ ZMod 4) := sorry
/- `moore_homology_compat` (compatibility): comment (agreement with Weibel's Moore spaces `P^m(ℤ/m)`). -/
-- signature (not yet statable at the pins): example
/-- `moore_two_not_ring` (non-example). -/
example : (2 : ℤ) • 𝟙 (moore.{u} 2) ≠ 0 := sorry

/-- `H.6/coefficient-spectrum`: `E/m` as a cofibre of `m • 𝟙 E`. -/
def modM (E : SHC.{u}) (m : ℕ) : SHC.{u} := sorry

namespace modM

def triangle (E : SHC.{u}) (m : ℕ) : Triangle SHC.{u} :=
  Triangle.mk ((m : ℤ) • 𝟙 E) (sorry : E ⟶ modM E m) sorry

theorem triangle_distinguished (E : SHC.{u}) (m : ℕ) : triangle E m ∈ distTriang SHC := sorry

def smashIso (E : SHC.{u}) (m : ℕ) : letI := SHC.derivedSmash.{u}
    modM E m ≅ MonoidalCategory.tensorObj E (moore m) := sorry

def functor (m : ℕ) : SHC.{u} ⥤ SHC.{u} := sorry

-- signature (not yet statable at the pins): theorem HA (A : Type u) [AddCommGroup A] (m : ℕ)
-- `π₀((HA)/m) ≅ A ⧸ mA` and `π₁((HA)/m) ≅ A[m]`.

end modM

abbrev piMod (E : SHC.{u}) (m : ℕ) (n : ℤ) : Type (u + 1) := piObj (modM E m) n

/-- `modM_one` (degenerate). -/
example (E : SHC.{u}) : IsZero (modM E 1) := sorry
/-- `modM_HZ` (computation). -/
example (m : ℕ) [NeZero m] : Nonempty (modM (γ.obj (SymmSpectrum.eilenbergMacLane.{0} ℤ)) m ≅
    γ.obj (SymmSpectrum.eilenbergMacLane (ZMod m))) := sorry
/-- `modM_smash_compat` (compatibility). -/
example (m : ℕ) : Nonempty (piMod (sphere.{u} 0) m 0 ≃+ ZMod m) := sorry
/- `modM_not_tensor` (non-example): comment (for `E = Σ H(ℤ/2)`, `π₂(E/2) = ℤ/2 ≠ π₂(E) ⊗ ℤ/2 = 0`). -/
-- signature (not yet statable at the pins): example

/-- `H.6/bockstein-long-exact-sequence`: the triangle `E →m E → E/m → ΣE` is distinguished, so `π_*`
gives a long exact sequence (Mathlib's homological functor long exact sequences). -/
theorem bockstein_distinguished (E : SHC.{u}) (m : ℕ) : modM.triangle E m ∈ distTriang SHC :=
  modM.triangle_distinguished E m

/-- `H.6/mod-l-homotopy-and-bockstein-sequence`: the universal coefficient sequence, stated for
`E = γ X` through the true homotopy groups of `X`. -/
theorem universalCoefficient (X : SymmSpectrum.{u}) (m : ℕ) (n : ℤ) :
    ∃ (i : TensorProduct ℤ (SymmSpectrum.pi X n) (ZMod m) →+ piMod (γ.obj X) m n)
      (j : piMod (γ.obj X) m n →+ AddSubgroup.torsionBy (SymmSpectrum.pi X (n - 1)) m),
      (∀ x : SymmSpectrum.pi X n, i (TensorProduct.tmul ℤ x 1) =
        (homSphereEquiv X n).symm x ≫ (modM.triangle (γ.obj X) m).mor₂) ∧
      Function.Injective i ∧ Function.Surjective j ∧ ∀ y, (∃ x, i x = y) ↔ j y = 0 := sorry

/-- `H.6/moore-spectrum-change-of-coefficients`. -/
def moore.incl (p r : ℕ) : moore.{u} (p ^ r) ⟶ moore (p ^ (r + 1)) := sorry
def moore.reduce (p r : ℕ) : moore.{u} (p ^ (r + 1)) ⟶ moore (p ^ r) := sorry
-- signature (not yet statable at the pins): theorem moore.incl_bockstein (p r : ℕ)
-- `incl` is a map of defining triangles with components `1` and `p` on the sphere terms.
def modTower (E : SHC.{u}) (p : ℕ) : ℕᵒᵖ ⥤ SHC.{u} := sorry
-- signature (not yet statable at the pins): theorem modTower.uct (E : SHC.{u}) (p : ℕ)

/- `moore_incl_H0` (computation) / `moore_reduce_H0` (computation): comment (on `H₀` they are
multiplication by `p` and reduction). -/
-- signature (not yet statable at the pins): example
/- `modTower_HZ` (compatibility): comment (the tower of `H(ℤ/pʳ)` with reductions). -/
-- signature (not yet statable at the pins): example
/- `moore_incl_not_unique_p2` (non-example): comment (two lifts `S/2 → S/4` differ by `η`). -/
-- signature (not yet statable at the pins): example

/- `H.6/qp-zp-coefficients`. -/
-- signature (not yet statable at the pins): theorem qpzpCoefficients (E : SHC.{u}) (p : ℕ)
-- `E ∧ S/p^∞ = hocolim E/pʳ` with `0 → π_n E ⊗ ℚ_p/ℤ_p → π_n(E; ℚ_p/ℤ_p) → π_{n-1}(E){p} → 0`.

/-- `H.6/homotopy-limit-of-tower`. -/
def holimTower (X : ℕᵒᵖ ⥤ SHC.{u}) : SHC.{u} := sorry
def holimTower.π (X : ℕᵒᵖ ⥤ SHC.{u}) (n : ℕ) : holimTower X ⟶ X.obj (Opposite.op n) := sorry
def holimTower.map {X Y : ℕᵒᵖ ⥤ SHC.{u}} (φ : X ⟶ Y) : holimTower X ⟶ holimTower Y := sorry
def holimTower.const (E : SHC.{u}) : holimTower ((Functor.const _).obj E) ≅ E := sorry

end TauCeti.SHC

def TauCeti.SymmSpectrum.towerLimit (X : ℕᵒᵖ ⥤ TauCeti.SymmSpectrum.{u}) : TauCeti.SymmSpectrum.{u} := sorry

namespace TauCeti.SHC

/- `holimTower_const` (degenerate). -/
-- signature (not yet statable at the pins): example (E : SHC.{u}) : Nonempty (holimTower ((Functor.const _).obj E) ≅ E) := ⟨holimTower.const E⟩
--   /-- `holimTower_zero_maps` (computation): comment (zero transition maps give `holim = 0`). -/
--   example
/- `holimTower_point_set_compat` (compatibility). -/
-- signature (not yet statable at the pins): example (X : ℕᵒᵖ ⥤ SymmSpectrum.{u})
/- `holimTower_not_lim_pi` (non-example): see `nonzeroLimOne`. -/
-- signature (not yet statable at the pins): example

/-- `H.6/milnor-sequence`: `0 → lim¹ π_{k+1} X_r → π_k holim → lim π_k X_r → 0` (lim¹ of towers is
ArithmeticGaloisDuality:R02.1's). Stated here as surjectivity onto compatible families. -/
theorem milnor_surjective (X : ℕᵒᵖ ⥤ SHC.{u}) (k : ℤ)
    (x : ∀ n, piObj (X.obj (Opposite.op n)) k)
    (hx : ∀ n, x (n + 1) ≫ X.map (homOfLE (Nat.le_succ n)).op = x n) :
    ∃ y : piObj (holimTower X) k, ∀ n, y ≫ holimTower.π X n = x n := sorry

/-- `H.6/nonzero-lim-one-example`: the tower `⋯ →p S →p S` has `π_{-1}(holim) ≅ ℤ_p ⧸ ℤ ≠ 0`. -/
theorem nonzeroLimOne (p : ℕ) [Fact p.Prime] : ∃ X : ℕᵒᵖ ⥤ SHC.{u},
    (∀ n, Subsingleton (piObj (X.obj (Opposite.op n)) (-1))) ∧ ¬ Subsingleton (piObj (holimTower X) (-1)) := sorry

/-- `H.6/p-completion`. -/
def pCompletion (p : ℕ) (E : SHC.{u}) : SHC.{u} := holimTower (modTower E p)

namespace pCompletion

def unit (p : ℕ) (E : SHC.{u}) : E ⟶ pCompletion p E := sorry
def functor (p : ℕ) : SHC.{u} ⥤ SHC.{u} := sorry
-- signature (not yet statable at the pins): theorem isoFunction (p : ℕ) (E : SHC.{u})
-- `pCompletion p E ≅ F(S/p^∞, ΣE)` (internal Hom of the derived smash product).

end pCompletion

def IsPComplete (p : ℕ) (E : SHC.{u}) : Prop := IsIso (pCompletion.unit p E)

theorem pCompletion.isPComplete (p : ℕ) (E : SHC.{u}) : IsPComplete p (pCompletion p E) := sorry

/-- `pCompletion_zero` (degenerate). -/
example (p : ℕ) (Z : SHC.{u}) (hZ : IsZero Z) : IsZero (pCompletion p Z) := sorry
/-- `pCompletion_sphere_pi0` (computation). -/
example (p : ℕ) [Fact p.Prime] : Nonempty (piObj (pCompletion p (sphere.{0} 0)) 0 ≃+ ℤ_[p]) := sorry
/-- `pCompletion_HQ` (compatibility). -/
example (p : ℕ) [Fact p.Prime] : IsZero (pCompletion p (γ.obj (SymmSpectrum.eilenbergMacLane.{0} ℚ))) := sorry
/-- `pCompletion_not_tensor` (non-example). -/
example (p : ℕ) [Fact p.Prime] : ¬ Subsingleton (piObj (pCompletion p
    (γ.obj (SymmSpectrum.eilenbergMacLane.{0} (ULift ℚ ⧸ (AddSubgroup.zmultiples (1 : ULift ℚ)))))) 1) := sorry

/- `H.6/l-adic-completion-milnor-sequence`, `H.6/completion-ext-hom-sequence`: comment-level
(Ext and Tate-module terms; `Ext(ℤ/p^∞, A)` of abelian groups is not in Mathlib). -/
-- signature (not yet statable at the pins): theorem completion_ext_hom (p : ℕ) (E : SHC.{u})

/-- `H.6/completion-finite-type`: for finitely generated homotopy groups, `π_k(E^∧_p) ≅ π_k E ⊗ ℤ_p`. -/
theorem completion_finiteType (p : ℕ) [Fact p.Prime] (X : SymmSpectrum.{u}) (k : ℤ)
    (hX : AddGroup.FG (SymmSpectrum.pi X k)) (hX' : AddGroup.FG (SymmSpectrum.pi X (k - 1))) :
    Nonempty (piObj (pCompletion p (γ.obj X)) k ≃+ TensorProduct ℤ (SymmSpectrum.pi X k) ℤ_[p]) := sorry

/-- `H.6/p-complete-criteria` (criterion (a): bounded exponent). -/
theorem isPComplete_of_bounded (p N : ℕ) (X : SymmSpectrum.{u})
    (h : ∀ k (x : SymmSpectrum.pi X k), (p ^ N : ℕ) • x = 0) : IsPComplete p (γ.obj X) := sorry

/-- `H.6/rationalisation`. -/
def rationalization (E : SHC.{u}) : SHC.{u} := sorry
def rationalization.unit (E : SHC.{u}) : E ⟶ rationalization E := sorry
theorem rationalization.pi (X : SymmSpectrum.{u}) (k : ℤ) :
    Nonempty (piObj (rationalization (γ.obj X)) k ≃+ TensorProduct ℤ (SymmSpectrum.pi X k) ℚ) := sorry
theorem rationalization.smashHQ (E : SHC.{u}) : letI := SHC.derivedSmash.{u}
    Nonempty (rationalization E ≅ MonoidalCategory.tensorObj (γ.obj (SymmSpectrum.eilenbergMacLane (ULift ℚ))) E) := sorry
def IsRational (E : SHC.{u}) : Prop := IsIso (rationalization.unit E)
-- signature (not yet statable at the pins): theorem rational_generalizedEM (E : SHC.{u}) (hE : IsRational E)
-- A rational spectrum is `∏_k Σ^k H(π_k E)`.

/-- `rationalization_zero` (degenerate). -/
example (Z : SHC.{u}) (hZ : IsZero Z) : IsZero (rationalization Z) := sorry
/-- `rationalization_sphere` (computation). -/
example : Nonempty (rationalization (sphere.{0} 0) ≅ γ.obj (SymmSpectrum.eilenbergMacLane ℚ)) := sorry
/-- `rationalization_HZp` (compatibility). -/
example (p : ℕ) [Fact p.Prime] : IsZero (rationalization (γ.obj (SymmSpectrum.eilenbergMacLane.{0} (ZMod p)))) := sorry
/-- `rationalization_moore_zero` (non-example). -/
example (p : ℕ) [Fact p.Prime] : IsZero (rationalization (moore.{u} p)) ∧ ¬ IsZero (moore.{u} p) := sorry

/- `H.6/arithmetic-fracture-square`. -/
-- signature (not yet statable at the pins): theorem arithmeticFracture (E : SHC.{u})
-- `E → ∏_p E^∧_p` over `E_ℚ → (∏_p E^∧_p)_ℚ` is homotopy cartesian (a distinguished triangle
-- `E → E_ℚ ⊕ ∏_p E^∧_p → (∏_p E^∧_p)_ℚ → ΣE`).

/-- `H.6/filtered-spectrum`. -/
structure FilteredSpectrum : Type (u + 1) where
  X : ℤ ⥤ SHC.{u}

namespace FilteredSpectrum

def gr (F : FilteredSpectrum.{u}) (s : ℤ) : SHC.{u} := sorry

/-- `colim_s π_*(F_s) → π_*(E)` is an isomorphism, for a cocone `c` on the filtration. -/
def IsExhaustive (F : FilteredSpectrum.{u}) (E : SHC.{u}) (c : ∀ s, F.X.obj s ⟶ E) : Prop :=
  (∀ s s' : ℤ, ∀ h : s ≤ s', F.X.map (homOfLE h) ≫ c s' = c s) ∧
  (∀ k : ℤ, ∀ y : piObj E k, ∃ s, ∃ x : piObj (F.X.obj s) k, x ≫ c s = y) ∧
  ∀ (k s : ℤ) (x : piObj (F.X.obj s) k), x ≫ c s = 0 →
    ∃ (s' : ℤ) (h : s ≤ s'), x ≫ F.X.map (homOfLE h) = 0

def IsBoundedBelow (F : FilteredSpectrum.{u}) : Prop := ∃ s₀ : ℤ, ∀ s ≤ s₀, IsZero (F.X.obj s)

/-- The tower `n ↦ X_{-n}` along the filtration maps. -/
def negTower (F : FilteredSpectrum.{u}) : ℕᵒᵖ ⥤ SHC.{u} := sorry

def IsComplete (F : FilteredSpectrum.{u}) : Prop := IsZero (holimTower (negTower F))

def toSpectralObject (F : FilteredSpectrum.{u}) : Triangulated.SpectralObject SHC.{u} ℤ := sorry

/-- `filteredSpectrum_const` (degenerate). -/
example (E : SHC.{u}) (s : ℤ) : IsZero (gr ⟨(Functor.const ℤ).obj E⟩ s) := sorry
/- `filteredSpectrum_postnikov_gr` (computation): comment (`gr_n` of the Postnikov tower is `Σⁿ H(π_n X)`). -/
-- signature (not yet statable at the pins): example
/- `filteredSpectrum_spectralObject_compat` (compatibility): comment (π₀ of `toSpectralObject` via
Mathlib's `Triangulated.SpectralObject.mapHomologicalFunctor` has `E₁ = π_*(gr)`). -/
-- signature (not yet statable at the pins): example
/-- `filteredSpectrum_complete_not_exhaustive` (non-example). -/
example (E : SHC.{u}) (hE : ¬ IsZero E) : ¬ IsComplete ⟨(Functor.const ℤ).obj E⟩ := sorry

end FilteredSpectrum

end TauCeti.SHC

namespace TauCeti

/-- `H.6/exact-couple`: `D →i D →j E →k D` exact at each vertex (the bigrading is carried by the
modules, for example `D = ⊕_{s,t} π_{s+t} X_s`). -/
structure ExactCouple : Type (u + 1) where
  D : ModuleCat.{u} ℤ
  E : ModuleCat.{u} ℤ
  i : D ⟶ D
  j : D ⟶ E
  k : E ⟶ D
  w_ij : i ≫ j = 0
  w_jk : j ≫ k = 0
  w_ki : k ≫ i = 0
  exact_D : (ShortComplex.mk i j w_ij).Exact
  exact_E : (ShortComplex.mk j k w_jk).Exact
  exact_D' : (ShortComplex.mk k i w_ki).Exact

namespace ExactCouple

def derived (C : ExactCouple.{u}) : ExactCouple.{u} := sorry

/-- The page `E^r`, `r ≥ 1`: the `(r - 1)`-fold derived couple (`E¹ = C.E`). -/
def page (C : ExactCouple.{u}) (r : ℕ) : ModuleCat.{u} ℤ := (Nat.iterate derived (r - 1) C).E

def toSpectralSequence (C : ExactCouple.{u}) :
    SpectralSequence (ModuleCat.{u} ℤ) (fun r => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

end ExactCouple

namespace SHC.FilteredSpectrum

def exactCouple (F : FilteredSpectrum.{u}) : ExactCouple.{u + 1} := sorry

/-- `H.6/filtered-spectrum-spectral-sequence`. -/
def spectralSequence (F : FilteredSpectrum.{u}) :
    SpectralSequence (ModuleCat.{u + 1} (ULift ℤ)) (fun r => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

-- signature (not yet statable at the pins): theorem spectralSequence.E1 (F : FilteredSpectrum.{u}) (s t : ℤ)
-- `E¹_{s,t} ≅ π_{s+t}(gr_s F)`.

def spectralSequence.map {F G : FilteredSpectrum.{u}} (φ : F.X ⟶ G.X) :
    (spectralSequence F).Hom (spectralSequence G) := sorry

def abutmentFiltration (F : FilteredSpectrum.{u}) (E : SHC.{u}) (c : ∀ s, F.X.obj s ⟶ E) (s k : ℤ) :
    AddSubgroup (SHC.piObj E k) := AddMonoidHom.range (Preadditive.rightComp (SHC.sphere k) (c s))

end SHC.FilteredSpectrum

/- `exactCouple_zero_E` / `exactCouple_two_stage` / `exactCouple_spectralObject_compat` /
`exactCouple_not_complex`: comment-level tests of `ExactCouple` (see the packet). -/
-- signature (not yet statable at the pins): example

/- `spectralSequence_trivial` / `spectralSequence_single_step` / `spectralSequence_compat_exactCouple` /
`spectralSequence_E2_not_abutment`: comment-level tests (see the packet). -/
-- signature (not yet statable at the pins): example

/- `H.6/spectral-sequence-convergence-exhaustive` (Lurie HA 1.2.2.14). -/
-- signature (not yet statable at the pins): theorem SHC.FilteredSpectrum.converges_of_boundedBelow (F : SHC.FilteredSpectrum.{u})
--       (hF : F.IsBoundedBelow)
-- Strong convergence to `π_*(colim F)` with `E^∞_{s,t} ≅ F_s π_{s+t} / F_{s-1} π_{s+t}`.

/- `H.6/spectral-sequence-convergence-complete`. -/
-- signature (not yet statable at the pins): theorem SHC.FilteredSpectrum.converges_of_complete (F : SHC.FilteredSpectrum.{u}) (hF : F.IsComplete)
-- Conditional convergence (Boardman); strong under uniform connectivity of the fibres.

/- `H.6/atiyah-hirzebruch-spectral-sequence`. -/
-- signature (not yet statable at the pins): theorem atiyahHirzebruch (E : SHC.{u}) (X : TopCat.{u}) [Topology.CWComplex (Set.univ : Set X)]
-- `E²_{p,q} = H_p(X; π_q E) ⇒ E_{p+q}(X)`, from the skeletal filtration of `Σ^∞_+ X`.

/- `H.6/moore-spectrum-multiplication` (Araki–Toda): for `ℓ^ν ∉ {2, 3, 4, 8}`, `S/ℓ^ν` has a homotopy
associative and commutative unital multiplication; the unit and associativity diagrams in `SHC` need the
derived smash product's coherence isomorphisms, so the signature is a comment. -/
-- signature (not yet statable at the pins): theorem moore_multiplication

/- `H.6/burklund-moore-multiplicative`: `S/8` admits an `E₁`-algebra structure (and more; comment). -/
-- signature (not yet statable at the pins): theorem burklund_moore
-- `S/2^q` is `E_n` for `q ≥ (3/2)(n+1)`; `S/p^q` is `E_n` for `q ≥ n + 1`, `p` odd (Burklund 1.1–1.2).

end TauCeti
