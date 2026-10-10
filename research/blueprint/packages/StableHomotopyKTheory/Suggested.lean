import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map
import TauCeti.Topology.Homotopy.HomotopyGroup.BasepointChange
import TauCeti.Topology.Homotopy.HomotopyGroup.FundamentalGroupAction
import TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic

/-!
# StableHomotopyKTheory: representative target signatures

This file is not the roadmap and is not exhaustive. README.md is the definitive
mathematical specification. The declarations suggest definitions, theorem signatures
and tests expressible against the pinned APIs, so contributors can agree on names,
hypotheses and conventions. New proofs use `sorry`.

The choices made explicit are Mathlib's direction of category and path composition,
endpoint-based homotopy fibres, equivariant symmetric-spectrum levels, the distinction
between naive and true stable homotopy groups, integer suspension shifts, Bockstein
transition maps and homological spectral-sequence bidegrees. Existing homotopy maps,
local systems and asphericity predicates are imported from Tau Ceti.
-/

namespace TauCetiRoadmap.StableHomotopyKTheory

set_option autoImplicit false
noncomputable section

open CategoryTheory CategoryTheory.Limits Simplicial
open scoped MonoidalCategory

universe u v

namespace Existing

/-- Ordinary singular homology, using Mathlib's coefficient functor. -/
abbrev singH (R : Type u) [CommRing R] (n : ℕ) (X : TopCat.{u}) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).obj X

/-- The singular-homology map induced by a continuous categorical morphism. -/
def singHMap (R : Type u) [CommRing R] (n : ℕ) {X Y : TopCat.{u}} (f : X ⟶ Y) :
    singH R n X ⟶ singH R n Y :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).map f

/-- Notation for Tau Ceti's induced map with an explicit natural-number dimension. -/
abbrev piMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (n : ℕ) (f : C(X, Y)) (x : X) :=
  _root_.HomotopyGroup.map (N := Fin n) (x := x) f rfl

/-- Local systems retain Tau Ceti's functor-category carrier. -/
abbrev LocalCoefficientSystem (R : Type u) [Ring R] (X : TopCat.{u}) :=
  _root_.TauCeti.LocalCoefficientSystem.{u, u, u} R X

/-- Recognition of K(G,1) uses Tau Ceti's asphericity predicate. -/
abbrev IsKOne (G : Type u) [Group G] (X : Type u) [TopologicalSpace X] (x : X) :=
  _root_.TauCeti.IsEilenbergMacLaneSpaceOne G X x

end Existing

/-! ## Layer 1: Nerves, classifying spaces and basepoints -/

namespace CategoryTheory

variable {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]

/-- the classifying space `BC = |NC|`. -/
def classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} := SSet.toTop.obj (nerve C)

/-- The map `BF = |NF|` induced by a functor. -/
def classifyingSpaceMap (F : C ⥤ D) : classifyingSpace C ⟶ classifyingSpace D :=
  SSet.toTop.map (nerveMap F)

/-- B(id)=id. -/
theorem classifyingSpaceMap_id : classifyingSpaceMap (𝟭 C) = 𝟙 (classifyingSpace C) := sorry

/-- B(F⋙G)=BF≫BG. -/
theorem classifyingSpaceMap_comp (F : C ⥤ D) (G : D ⥤ E) :
    classifyingSpaceMap (F ⋙ G) = classifyingSpaceMap F ≫ classifyingSpaceMap G := sorry

/-- `B` as a functor `Cat ⥤ TopCat`. -/
def classifyingSpaceFunctor : Cat.{v, u} ⥤ TopCat.{max u v} := nerveFunctor ⋙ SSet.toTop

/-- The vertex `[X]` of `BC` given by an object. -/
def classifyingSpace_vertex (X : C) : classifyingSpace C := sorry

/-- The edge path from `[X]` to `[Y]` given by a morphism. -/
def classifyingSpace_edge {X Y : C} (f : X ⟶ Y) :
    Path (classifyingSpace_vertex X) (classifyingSpace_vertex Y) := sorry

/-- Unfold BC to the nerve realisation. -/
theorem classifyingSpace_eq_toTop_nerve : classifyingSpace C = SSet.toTop.obj (nerve C) := rfl

/-- `CategoryTheory.classifyingSpaceMap_vertex`: `BF [X] = [F X]`. -/
theorem classifyingSpaceMap_vertex (F : C ⥤ D) (X : C) :
    (classifyingSpaceMap F).hom (classifyingSpace_vertex X) = classifyingSpace_vertex (F.obj X) := sorry

/-- `CategoryTheory.classifyingSpaceMap_edge`: `BF` sends the edge of `f` to the edge of `F.map f`. -/
theorem classifyingSpaceMap_edge (F : C ⥤ D) {X Y : C} (f : X ⟶ Y) :
    ((classifyingSpace_edge f).map (classifyingSpaceMap F).hom.continuous).cast
        (classifyingSpaceMap_vertex F X).symm (classifyingSpaceMap_vertex F Y).symm =
      classifyingSpace_edge (F.map f) := sorry

/-- `CategoryTheory.classifyingSpace_edge_comp`: `edge (f ≫ g) ≃ edge f · edge g` and `edge (𝟙 X) ≃ const`. -/
theorem classifyingSpace_edge_comp {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    (classifyingSpace_edge (f ≫ g)).Homotopic
        ((classifyingSpace_edge f).trans (classifyingSpace_edge g)) ∧
      (classifyingSpace_edge (𝟙 X)).Homotopic (Path.refl _) := sorry

/-- `CategoryTheory.classifyingSpace_joined_vertex`: every point of `BC` is joined to a vertex. -/
theorem classifyingSpace_joined_vertex (x : classifyingSpace C) :
    ∃ X : C, Joined x (classifyingSpace_vertex X) := sorry

/-- `CategoryTheory.classifyingSpaceMap_universes` (other): `classifyingSpaceMap`, like Mathlib's `nerveMap`,
needs both categories in one object universe and one morphism universe; for the projection of the
translation category `ActionCategory G X ⥤ SingleObj G` this forces the acted-on type `X : Type` (or a `ULift`), since the
objects of `SingleObj G` form `Unit : Type`. -/
example (G : Type) [Group G] :
    classifyingSpace (ActionCategory G G) ⟶ classifyingSpace (SingleObj G) :=
  classifyingSpaceMap (ActionCategory.π G G)

/-- `classifyingSpace_fin_two_homeomorph_unitInterval`: classifyingSpace (Fin 2) (the ordered set 0 < 1) is homeomorphic to the unit interval, with vertices 0 and 1 the endpoints. -/
example : Nonempty (classifyingSpace (Fin 2) ≃ₜ unitInterval) := sorry

/-- `classifyingSpace_empty`: classifyingSpace of the empty category is the empty space, and of the one-object one-morphism category is a single point. -/
example : IsEmpty (classifyingSpace (Discrete PEmpty.{1})) ∧
    Nonempty (Unique (classifyingSpace (Discrete PUnit.{1}))) := sorry

/-- `classifyingSpace_discrete`: For a set S viewed as a discrete category, classifyingSpace S is homeomorphic to S with the discrete topology. -/
example (S : Type) [TopologicalSpace S] [DiscreteTopology S] :
    Nonempty (classifyingSpace (Discrete S) ≃ₜ S) := sorry

/-- `classifyingSpaceMap_not_full`: There is a continuous map classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2) (the reflection of the interval) that is not classifyingSpaceMap of any functor: B is faithful but not full. -/
example : ∃ g : classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2),
    ∀ F : Fin 2 ⥤ Fin 2, classifyingSpaceMap F ≠ g := sorry

/-- the CW structure on a realisation. -/
@[instance_reducible] def _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTopCWComplex (X : SSet.{u}) :
    Topology.CWComplex (Set.univ : Set (SSet.toTop.obj X)) := sorry

/-- The `n`-cells of the CW structure are the nondegenerate `n`-simplices. -/
def _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTopCWComplex_cell_equiv (X : SSet.{u}) (n : ℕ) :
    letI := SSet.toTopCWComplex X
    Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj X)) n ≃ X.nonDegenerate n := sorry

/-- Realisations of simplicial maps are cellular. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_map_cellular {X Y : SSet.{u}} (f : X ⟶ Y) (n : ℕ) :
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

/-- `SSet.toTop_t2Space`: realisations are Hausdorff. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_t2Space (X : SSet.{u}) : T2Space (SSet.toTop.obj X) := sorry

/-- `SSet.toTop_isCompact_subset_finite_subcomplex`: a compact subset of `|X|` lies in the realisation
of a simplicial subset with finitely many nondegenerate simplices. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_isCompact_subset_finite_subcomplex (X : SSet.{u})
    (K : Set (SSet.toTop.obj X)) (hK : IsCompact K) :
    ∃ A : X.Subcomplex, SSet.Finite A ∧ K ⊆ Set.range (SSet.toTop.map A.ι).hom := sorry

/-- `SSet.toTop_map_isClosedEmbedding_of_mono`: realisations of monomorphisms are closed embeddings
(onto subcomplexes). -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_map_isClosedEmbedding_of_mono {A X : SSet.{u}} (i : A ⟶ X) [Mono i] :
    Topology.IsClosedEmbedding (SSet.toTop.map i).hom := sorry

/-- `SSet.toTop_stronglyLocallyContractibleSpace`: a basis of contractible open neighbourhoods.
The classical CW local-contractibility theorem supplies this class; the weaker
`LocallyContractibleSpace` predicate alone does not supply a local-path-connectedness instance. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_stronglyLocallyContractibleSpace (X : SSet.{u}) :
    StronglyLocallyContractibleSpace (SSet.toTop.obj X) := sorry

/-- `CategoryTheory.classifyingSpace_sigma`: `B` of a disjoint union of categories is the disjoint union
of their classifying spaces. -/
theorem classifyingSpace_sigma {ι : Type u} (C : ι → Type u) [∀ i, Category.{u} (C i)] :
    IsHomeomorph (fun p : Σ i, classifyingSpace (C i) =>
      (classifyingSpaceMap (CategoryTheory.Sigma.incl (C := C) p.1)).hom p.2) := sorry


/-- `toTopCWComplex_stdSimplex_cells`: The CW structure on |Δ[n]| has exactly C(n+1, k+1) cells of dimension k. -/
example (n k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk n))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk n)))) k) = Nat.choose (n + 1) (k + 1) := sorry

/-- `toTopCWComplex_point`: |Δ[0]| has exactly one cell, of dimension 0, although Δ[0] has a simplex in every degree. -/
example (k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk 0))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk 0)))) k) = if k = 0 then 1 else 0 := sorry

/-- `toTopCWComplex_compat_skeleton`: With T2Space (SSet.toTop.obj X), the range of SSet.toTop.map (X.skeleton (n + 1)).ι equals the CW n-skeleton Topology.CWComplex.skeleton univ n. -/
example (X : SSet.{u}) [T2Space (SSet.toTop.obj X)] (n : ℕ) :
    letI := SSet.toTopCWComplex X
    Set.range (SSet.toTop.map (X.skeleton (n + 1)).ι).hom =
      ((Topology.CWComplex.skeleton (Set.univ : Set (SSet.toTop.obj X)) n :
        Topology.RelCWComplex.Subcomplex (Set.univ : Set (SSet.toTop.obj X))) : Set (SSet.toTop.obj X)) :=
  sorry

/-- `toTopCWComplex_not_all_simplices`: For C the one-object category of a nontrivial group G, the 1-cells of BC are the non-identity elements of G, not all elements of G. -/
example (G : Type u) [Group G] [Finite G] :
    letI := SSet.toTopCWComplex (nerve (SingleObj G))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (nerve (SingleObj G)))) 1) =
      Nat.card G - 1 := sorry

/-- the canonical cellular homeomorphism `B(Cᵒᵖ) ≃ₜ BC`
(not induced by a functor), fixing vertices and natural in functors. -/
def classifyingSpaceOpHomeomorph (C : Type u) [Category.{v} C] :
    classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C := sorry

/-- Reversing a nerve simplex preserves its object vertex. -/
theorem classifyingSpaceOpHomeomorph_vertex (X : C) :
    classifyingSpaceOpHomeomorph C (classifyingSpace_vertex (Opposite.op X)) =
      classifyingSpace_vertex X := sorry

/-- The opposite-space homeomorphism commutes with every induced functor map. -/
theorem classifyingSpaceOpHomeomorph_naturality (F : C ⥤ D) (x : classifyingSpace Cᵒᵖ) :
    classifyingSpaceOpHomeomorph D ((classifyingSpaceMap F.op).hom x) =
      (classifyingSpaceMap F).hom (classifyingSpaceOpHomeomorph C x) := sorry

/-- the canonical map `B(C × D) → BC × BD` is a homeomorphism when
`BD` is a finite complex. -/
theorem classifyingSpaceProdHomeomorph (C D : Type u) [Category.{v} C] [Category.{v} D]
    [(nerve D).Finite] :
    IsHomeomorph (fun x : classifyingSpace (C × D) =>
      ((classifyingSpaceMap (CategoryTheory.Prod.fst C D)).hom x,
        (classifyingSpaceMap (CategoryTheory.Prod.snd C D)).hom x)) := sorry


/-- a natural transformation gives a homotopy. -/
theorem NatTrans.classifyingSpaceHomotopic {F G : C ⥤ D} (η : F ⟶ G) :
    ∃ H : ContinuousMap.Homotopy (classifyingSpaceMap F).hom (classifyingSpaceMap G).hom,
      ∀ (X : C) (t : unitInterval), H (t, classifyingSpace_vertex X) = classifyingSpace_edge (η.app X) t := sorry

/-- An adjunction induces a homotopy equivalence of classifying spaces, using its unit and counit. -/
theorem Adjunction.classifyingSpaceHomotopyEquiv {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap L).hom ∧ e.invFun = (classifyingSpaceMap R).hom := sorry

/-- An initial object contracts the classifying space to its vertex. -/
theorem classifyingSpace_contractible_of_hasInitial [HasInitial C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- A terminal object contracts the classifying space to its vertex. -/
theorem classifyingSpace_contractible_of_hasTerminal [HasTerminal C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- the nerve commutes with filtered colimits of categories. -/
theorem nerve_isColimit_of_isFiltered {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c) :
    Nonempty (IsColimit (nerveFunctor.mapCocone c)) := sorry


/-- If every transition induces a homotopy equivalence of classifying spaces, each stage maps by a homotopy equivalence to the filtered-colimit classifying space. -/
theorem classifyingSpace_filtered_homotopyEquivalence {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (h : ∀ ⦃i j : I⦄ (f : i ⟶ j), ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i))
      (classifyingSpace (F.obj j)),
      e.toFun = (classifyingSpaceMap (F.map f).toFunctor).hom) (i : I) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i)) (classifyingSpace c.pt),
      e.toFun = (classifyingSpaceMap (c.ι.app i).toFunctor).hom := sorry

/-- The classifying space of a filtered small category is contractible. -/
theorem classifyingSpace_contractible_of_isFiltered [IsFiltered C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- homology with arbitrary constant module coefficients commutes with filtered colimits of categories. -/
theorem classifyingSpace_homology_filtered_colimit {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (R : Type (max u v)) [Ring R] (A : ModuleCat.{max u v} R) (n : ℕ) :
    Nonempty (IsColimit ((classifyingSpaceFunctor ⋙
      (AlgebraicTopology.singularHomologyFunctor (ModuleCat.{max u v} R) n).obj A).mapCocone c)) := sorry

/-- `π₀(BC)` is the set of components of `C`. -/
theorem classifyingSpace_zerothHomotopy :
    ∃ e : ZerothHomotopy (classifyingSpace C) ≃ CategoryTheory.ConnectedComponents C,
      ∀ X : C, e (ZerothHomotopy.mk (classifyingSpace_vertex X)) = CategoryTheory.ConnectedComponents.mk X := sorry

/-- unique lifting through any vertex of a simplex. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.SSet.toTop_map_isCoveringMap {E X : SSet.{u}} (p : E ⟶ X)
    (hp : ∀ (n : ℕ) (σ : X _⦋n⦌) (k : Fin (n + 1)) (e : E _⦋0⦌),
      p.app _ e = X.map (SimplexCategory.const ⦋0⦌ ⦋n⦌ k).op σ →
      ∃! τ : E _⦋n⦌, p.app _ τ = σ ∧
        E.map (SimplexCategory.const ⦋0⦌ ⦋n⦌ k).op τ = e) :
    IsCoveringMap (SSet.toTop.map p).hom := sorry

/-- for a morphism-inverting functor
`F : C ⥤ Type u`, `B` of the projection from the category of elements is a covering map (fibre
`F X` over `[X]`); with the fibre functor of a covering this gives Quillen's Proposition 1. -/
theorem classifyingSpace_elements_isCoveringMap (F : C ⥤ Type u)
    (hF : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), Function.Bijective (F.map f)) :
    IsCoveringMap (classifyingSpaceMap (Functor.Elements.π F)).hom := sorry

/-- , essential surjectivity: every covering of `BC` is
`B` of the category of elements of a morphism-inverting functor. -/
theorem classifyingSpace_covering_exists_elements {C : Type u} [SmallCategory C] {E : Type u}
    [TopologicalSpace E] (p : C(E, classifyingSpace C)) (hp : IsCoveringMap p) :
    ∃ (F : C ⥤ Type u) (_ : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), Function.Bijective (F.map f))
      (h : E ≃ₜ classifyingSpace F.Elements),
      ∀ e, (classifyingSpaceMap (Functor.Elements.π F)).hom (h e) = p e := sorry

/-- The functor `C ⥤ Π(BC)`: `X ↦ [X]`, `f ↦ [classifyingSpace_edge f]`. -/
def classifyingSpace_edgeFunctor (C : Type u) [Category.{v} C] :
    C ⥤ FundamentalGroupoid (classifyingSpace C) := sorry

/-- the induced functor `C[C⁻¹] ⥤ Π(BC)` is an equivalence. -/
theorem classifyingSpace_fundamentalGroupoid_isEquivalence (C : Type u) [Category.{v} C] :
    (FreeGroupoid.lift (classifyingSpace_edgeFunctor C)).IsEquivalence := sorry

/-- Corollary of `π₁(BC, [X]) ≅ Aut_{C[C⁻¹]}(X)`. -/
theorem classifyingSpace_fundamentalGroup (X : C) :
    Nonempty (FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex X) ≃*
      Aut ((FreeGroupoid.of C).obj X)) := sorry

/-- Realise the unique rooted path in the wide tree; reverse tree edges are traversed backwards. -/
def classifyingSpace_treePath (T : WideSubquiver (Quiver.Symmetrify C))
    [Quiver.Arborescence T] (X : C) :
    Path (classifyingSpace_vertex (show C from Quiver.root T)) (classifyingSpace_vertex X) := sorry

/-- treePath(X)⋅edge(f)⋅treePath(Y)⁻¹. -/
def classifyingSpace_treeLoop (T : WideSubquiver (Quiver.Symmetrify C))
    [Quiver.Arborescence T] {X Y : C} (f : X ⟶ Y) :
    FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex (show C from Quiver.root T)) :=
  FundamentalGroup.fromPath ⟦((classifyingSpace_treePath T X).trans
    (classifyingSpace_edge f)).trans (classifyingSpace_treePath T Y).symm⟧

/-- the quotient universal property for any connected category.
`T` is a wide rooted tree in the symmetrified underlying quiver: even an edgeless tree retains
every vertex. Its root supplies the basepoint. Labels are the loops obtained by following the
tree to the source, traversing the arrow, and returning along the tree. With Mathlib's
endomorphism multiplication, `f ≫ g` is labelled by `label g * label f`.

The proof first uses the free groupoid on the *quiver*, then imposes the identity/composition
relations to obtain `CategoryTheory.FreeGroupoid C`; the latter is generally not a free groupoid.
The equivalence is natural in the target group. -/
def classifyingSpace_maximalTreePresentation [IsConnected C]
    (T : WideSubquiver (Quiver.Symmetrify C)) [Quiver.Arborescence T]
    (H : Type (max u v)) [Group H] :
    (FundamentalGroup (classifyingSpace C)
      (classifyingSpace_vertex (show C from Quiver.root T)) →* H) ≃
      { label : ∀ (X Y : C), (X ⟶ Y) → H //
        (∀ X, label X X (𝟙 X) = 1) ∧
        (∀ (X Y Z : C) (f : X ⟶ Y) (g : Y ⟶ Z),
          label X Z (f ≫ g) = label Y Z g * label X Y f) ∧
        (∀ (X Y : C) (f : X ⟶ Y),
          f ∈ Quiver.wideSubquiverSymmetrify T X Y → label X Y f = 1) } := sorry

/-- The universal-property equivalence evaluates a homomorphism on the specified tree loops. -/
theorem classifyingSpace_maximalTreePresentation_apply [IsConnected C]
    (T : WideSubquiver (Quiver.Symmetrify C)) [Quiver.Arborescence T]
    (H : Type (max u v)) [Group H]
    (φ : FundamentalGroup (classifyingSpace C)
      (classifyingSpace_vertex (show C from Quiver.root T)) →* H)
    {X Y : C} (f : X ⟶ Y) :
    (classifyingSpace_maximalTreePresentation T H φ).val X Y f =
      φ (classifyingSpace_treeLoop T f) := sorry

/-- , the one-object group example. The empty tree has its single
vertex; E11 does not remove that vertex when there are no tree edges. -/
theorem classifyingSpace_fundamentalGroup_singleObj (G : Type u) [Group G] :
    Nonempty (FundamentalGroup (classifyingSpace (SingleObj G))
      (classifyingSpace_vertex (SingleObj.star G)) ≃* G) := sorry

/-- local systems on `BC` are morphism-inverting functors. -/
theorem classifyingSpace_localSystems_equiv (R : Type (max u v)) [Ring R] :
    ((Functor.whiskeringLeft (FreeGroupoid C) (FundamentalGroupoid (classifyingSpace C))
      (ModuleCat.{max u v} R)).obj
        (FreeGroupoid.lift (classifyingSpace_edgeFunctor C))).IsEquivalence := sorry

/-- the chain complex `⊕_{X₀ → ⋯ → X_n} M(X₀)`. -/
def categoryChainComplex (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    ChainComplex (ModuleCat.{max u v} R) ℕ := sorry

/-- The homology `H_n(C; M)`. -/
def categoryHomology (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) (n : ℕ) : ModuleCat.{max u v} R :=
  (categoryChainComplex R M).homology n

/-- A coefficient transformation induces Hₙ maps, preserving id/composition. -/
def categoryHomology.map (R : Type (max u v)) [Ring R] {M M' : C ⥤ ModuleCat.{max u v} R} (φ : M ⟶ M') (n : ℕ) :
    categoryHomology R M n ⟶ categoryHomology R M' n := sorry

/-- F:C→D gives Hₙ(C,F*M)→Hₙ(D,M), functorially. -/
def categoryHomology.mapOfFunctor (R : Type (max u v)) [Ring R] (F : C ⥤ D) (M : D ⥤ ModuleCat.{max u v} R)
    (n : ℕ) : categoryHomology R (F ⋙ M) n ⟶ categoryHomology R M n := sorry

/-- Connecting maps of the long exact sequence for a short exact sequence of coefficients. -/
def categoryHomology.longExactSequence (R : Type (max u v)) [Ring R]
    (S : ShortComplex (C ⥤ ModuleCat.{max u v} R)) (hS : S.ShortExact) (n : ℕ) :
    categoryHomology R S.X₃ (n + 1) ⟶ categoryHomology R S.X₁ n := sorry

/-- The homology sequence of an objectwise short exact coefficient sequence is exact at every degree. -/
theorem categoryHomology.longExactSequence_exact (R : Type (max u v)) [Ring R]
    (S : ShortComplex (C ⥤ ModuleCat.{max u v} R)) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (categoryHomology.map R S.f n).hom (categoryHomology.map R S.g n).hom ∧
    Function.Exact (categoryHomology.map R S.g (n + 1)).hom (categoryHomology.longExactSequence R S hS n).hom ∧
    Function.Exact (categoryHomology.longExactSequence R S hS n).hom (categoryHomology.map R S.f n).hom := sorry

/-- H₀(C,M)≅colim M naturally. -/
def categoryHomologyZeroIsoColimit (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    categoryHomology R M 0 ≅ colimit M := sorry

/-- The simplicial module `n ↦ ⊕_{σ ∈ (nerve C) _[n]} M (σ.obj 0)`; its alternating face map complex is
`categoryChainComplex R M`. -/
def categorySimplicialModule (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    SimplicialObject (ModuleCat.{max u v} R) := sorry

/-- Normalisation preserves this homology. -/
def categoryHomology.normalizedIso (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R)
    (n : ℕ) : ((AlgebraicTopology.normalizedMooreComplex _).obj
      (categorySimplicialModule R M)).homology n ≅ categoryHomology R M n := sorry

/-- Constant coefficients: `H_n(C; A)` is Mathlib's simplicial homology of the nerve. -/
def categoryHomology.constIso (R : Type (max u v)) [Ring R] (A : ModuleCat.{max u v} R) (n : ℕ) :
    categoryHomology R ((Functor.const C).obj A) n ≅ (nerve C).homology A n := sorry

/-- `categoryHomology_zero_eq_colimit_const`: For C connected and M the constant functor at A, categoryHomology C M 0 ≅ A. -/
example (R : Type (max u v)) [Ring R] [IsConnected C] (A : ModuleCat.{max u v} R) :
    Nonempty (categoryHomology R ((Functor.const C).obj A) 0 ≅ A) := sorry

/-- `categoryHomology_of_terminal`: If C has a terminal object t then categoryHomology C M n = 0 for n > 0 and categoryHomology C M 0 ≅ M t. -/
example (R : Type (max u v)) [Ring R] [HasTerminal C] (M : C ⥤ ModuleCat.{max u v} R) (n : ℕ) :
    IsZero (categoryHomology R M (n + 1)) ∧ Nonempty (categoryHomology R M 0 ≅ M.obj (⊤_ C)) := sorry

/-- `categoryHomology_singleObj_compat`: For C = SingleObj G and M a G-representation, categoryHomology C M n ≅ groupHomology M n. -/
example (k G : Type u) [CommRing k] [Group G] (A : Rep k G) (n : ℕ) :
    Nonempty (categoryHomology k ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) n ≅ groupHomology A n) := sorry

/-- `categoryHomology_not_cohomology`: For G = ℤ/2 and trivial coefficients ℤ, categoryHomology (SingleObj G) ℤ 2 = 0 while group cohomology H²(G; ℤ) = ℤ/2: homology cannot be replaced by trivial-coefficient cohomology. -/
example : ∀ M : SingleObj (Multiplicative (ZMod 2)) ⥤ ModuleCat.{0} ℤ,
    (∀ g : SingleObj.star (Multiplicative (ZMod 2)) ⟶ SingleObj.star _, M.map g = 𝟙 _) →
    (M.obj (SingleObj.star _) = ModuleCat.of ℤ ℤ) → IsZero (categoryHomology ℤ M 2) := sorry

/-- A free representable coefficient diagram has zero positive category homology, by its extra-degeneracy contraction. -/
theorem categoryHomology_representable_isZero (R : Type (max u v)) [Ring R] (X : C) (n : ℕ) :
    IsZero (categoryHomology R (coyoneda.obj (Opposite.op X) ⋙ uliftFunctor.{u} ⋙
      (ModuleCat.free R)) (n + 1)) := sorry

/-- Homology in fixed degree as a functor of coefficient diagrams, using `categoryHomology.map`. -/
def categoryHomologyFunctor (R : Type (max u v)) [Ring R] (n : ℕ) :
    (C ⥤ ModuleCat.{max u v} R) ⥤ ModuleCat.{max u v} R where
  obj M := categoryHomology R M n
  map φ := categoryHomology.map R φ n
  map_id := sorry
  map_comp := sorry

/-- The colimit functor on module-valued diagrams is additive. -/
instance categoryColim_additive (R : Type (max u v)) [Ring R] :
    (colim : (C ⥤ ModuleCat.{max u v} R) ⥤ ModuleCat.{max u v} R).Additive := sorry

/-- The natural comparison of category homology with the left derived colimit, given projective resolutions of the coefficient diagram category. -/
def categoryHomology_isDerivedColimit (R : Type (max u v)) [Ring R]
    [HasProjectiveResolutions (C ⥤ ModuleCat.{max u v} R)] (n : ℕ) :
    categoryHomologyFunctor (C := C) R n ≅
      (colim : (C ⥤ ModuleCat.{max u v} R) ⥤ ModuleCat.{max u v} R).leftDerived n := sorry

/-- The comparison's naturality square, rather than unrelated objectwise isomorphisms. -/
theorem categoryHomology_isDerivedColimit_naturality (R : Type (max u v)) [Ring R]
    [HasProjectiveResolutions (C ⥤ ModuleCat.{max u v} R)] (n : ℕ)
    {M N : C ⥤ ModuleCat.{max u v} R} (φ : M ⟶ N) :
    categoryHomology.map R φ n ≫ (categoryHomology_isDerivedColimit R n).hom.app N =
      (categoryHomology_isDerivedColimit R n).hom.app M ≫
        ((colim : (C ⥤ ModuleCat.{max u v} R) ⥤ ModuleCat.{max u v} R).leftDerived n).map φ := sorry


/-- `H_n(BC; L) ≅ H_n(C; L)` (constant coefficients shown). -/
theorem categoryHomology_iso_singular (R : Type (max u v)) [CommRing R] (n : ℕ) :
    Nonempty (categoryHomology R ((Functor.const C).obj (ModuleCat.of R R)) n ≅
      Existing.singH R n (classifyingSpace C)) := sorry

end CategoryTheory

/-- `BG = B(SingleObj G)`. -/
def Group.classifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  CategoryTheory.classifyingSpace (SingleObj G)

namespace Group.classifyingSpace

variable {G H : Type u} [Group G] [Group H]

/-- Bφ= B(SingleObj.mapHom φ), preserving id/composition. -/
def map (φ : G →* H) : Group.classifyingSpace G ⟶ Group.classifyingSpace H :=
  CategoryTheory.classifyingSpaceMap (SingleObj.mapHom G H φ)

/-- The unique vertex, preserved by Bφ. -/
def basepoint (G : Type u) [Group G] : Group.classifyingSpace G :=
  CategoryTheory.classifyingSpace_vertex (SingleObj.star G)

/-- loop(gh)≃loop(h)⋅loop(g) rel endpoints; loop(1)≃constant, matching π₁ multiplication. -/
def loop (g : G) : Path (basepoint G) (basepoint G) := CategoryTheory.classifyingSpace_edge (C := SingleObj G) g

/-- The edge labelled by the group identity represents the constant based loop. -/
theorem loop_one : (loop (1 : G)).Homotopic (Path.refl (basepoint G)) := sorry

/-- The loop identification respects multiplication, with the reversed path-composition convention. -/
theorem loop_mul (g h : G) : (loop (g * h)).Homotopic ((loop h).trans (loop g)) := sorry

/-- A group homomorphism preserves the distinguished vertex of its classifying space. -/
theorem map_basepoint (φ : G →* H) : (map φ).hom (basepoint G) = basepoint H := sorry

/-- The identity group homomorphism induces the identity classifying-space map. -/
theorem map_id : map (MonoidHom.id G) = 𝟙 (Group.classifyingSpace G) := sorry

/-- The classifying-space map of a composite homomorphism is the composite of its maps. -/
theorem map_comp {K : Type u} [Group K] (φ : G →* H) (ψ : H →* K) : map (ψ.comp φ) = map φ ≫ map ψ := sorry

/-- BG is path-connected. -/
instance pathConnected (G : Type u) [Group G] : PathConnectedSpace (Group.classifyingSpace G) := sorry

/-- π₁(BG)≅G naturally, with loop(g)↦g. -/
def fundamentalGroupMulEquiv (G : Type u) [Group G] :
    FundamentalGroup (Group.classifyingSpace G) (basepoint G) ≃* G := sorry

/-- Hₙ(BG;M)≅groupHomology(M,n); trivial ℤ coefficients give integral homology. -/
def homologyIso (G : Type u) [Group G] (n : ℕ) :
    Existing.singH (ULift ℤ) n (Group.classifyingSpace G) ≅
      groupHomology (Rep.trivial (ULift ℤ) G (ULift ℤ)) n := sorry

/-- `Group.classifyingSpace.fundamentalGroupMulEquiv_loop`: the class of `loop g` goes to `g`. -/
theorem fundamentalGroupMulEquiv_loop (g : G) :
    fundamentalGroupMulEquiv G (FundamentalGroup.fromPath ⟦loop g⟧) = g := sorry

/-- `Group.classifyingSpace.H1AddEquiv`: `H₁(BG; ℤ) ≃+ Gᵃᵇ` (natural in `G`; see the test
`classifyingSpace_H1_abelianization`). -/
def H1AddEquiv (G : Type) [Group G] :
    Existing.singH ℤ 1 (Group.classifyingSpace G) ≃+ Additive (Abelianization G) := sorry

end Group.classifyingSpace

/-- `classifyingSpace_trivial_contractible`: Group.classifyingSpace (trivial group) is contractible (indeed a point). -/
example : ContractibleSpace (Group.classifyingSpace (Unit : Type)) := sorry

/-- `classifyingSpace_H1_abelianization`: H₁(BG;ℤ)=G_ab naturally: Bφ induces φ_ab under this identification. -/
example : ∃ e : ∀ (G : Type) [Group G],
      Existing.singH ℤ 1 (Group.classifyingSpace G) ≃+ Additive (Abelianization G),
    ∀ (G H : Type) [Group G] [Group H] (φ : G →* H) (x : Existing.singH ℤ 1 (Group.classifyingSpace G)),
      e H ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) 1).obj
        (ModuleCat.of ℤ ℤ)).map (Group.classifyingSpace.map φ)).hom x) =
        Additive.ofMul (Abelianization.map φ (Additive.toMul (e G x))) := sorry

/-- `classifyingSpace_zmod2_cells`: Group.classifyingSpace (Multiplicative (ZMod 2)) has exactly one cell in each dimension (it is RP^∞). -/
example (k : ℕ) : letI := SSet.toTopCWComplex (nerve (SingleObj (Multiplicative (ZMod 2))))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj
      (nerve (SingleObj (Multiplicative (ZMod 2)))))) k) = 1 := sorry

/-- `classifyingSpace_conj_freely_homotopic`: Conjugate G→H homomorphisms give freely homotopic BG→BH maps; relative-basepoint homotopy need not exist. -/
example {G H : Type} [Group G] [Group H] (φ : G →* H) (h : H) :
    ContinuousMap.Homotopic (Group.classifyingSpace.map φ).hom
      (Group.classifyingSpace.map ((MulAut.conj h).toMonoidHom.comp φ)).hom := sorry

/-- `classifyingSpace_not_contractible_Z`: Group.classifyingSpace (Multiplicative ℤ) has π₁ ≅ ℤ and is not contractible, although ℤ is torsion-free and acyclic in positive degrees ≥ 2. -/
example : ¬ ContractibleSpace (Group.classifyingSpace (Multiplicative ℤ)) := sorry

/-- `classifyingSpace_conj_freely_homotopic`: Conjugate G→H homomorphisms give freely homotopic BG→BH maps; relative-basepoint homotopy need not exist. -/
example : ¬ ContinuousMap.HomotopicRel (Group.classifyingSpace.map (MonoidHom.id (Equiv.Perm (Fin 3)))).hom
    (Group.classifyingSpace.map (MulAut.conj (Equiv.swap (0 : Fin 3) 1)).toMonoidHom).hom
    {Group.classifyingSpace.basepoint (Equiv.Perm (Fin 3))} := sorry

/-- `bar_boundary_low_degree`: d₁[g,a]=g⁻¹a−a and d₂[g,h,a]=[h,g⁻¹a]−[gh,a]+[g,a]. -/
example {k G : Type} [CommRing k] [Group G] (A : Rep k G) (g h : G) (a : A) :
    groupHomology.d₁₀ A (Finsupp.single g a) = A.ρ g⁻¹ a - a ∧
    groupHomology.d₂₁ A (Finsupp.single (g, h) a) =
      Finsupp.single h (A.ρ g⁻¹ a) - Finsupp.single (g * h) a + Finsupp.single g a := by
  exact ⟨groupHomology.d₁₀_single A g a, groupHomology.d₂₁_single (g, h) a⟩

/-- `bar_composition_noncommuting`: for g=(01), h=(12), (gh)(2)=0 and (hg)(2)=1. -/
example : let g := Equiv.swap (0 : Fin 3) 1; let h := Equiv.swap (1 : Fin 3) 2
    (g * h) (2 : Fin 3) = 0 ∧ (h * g) (2 : Fin 3) = 1 := by decide

/-- `B(∫_G G)` is contractible. -/
theorem Group.classifyingSpace_translation_contractible (G : Type u) [Group G] :
    ContractibleSpace (CategoryTheory.classifyingSpace (CategoryTheory.ActionCategory G G)) := sorry

/-- The translation action category realises to a covering of the one-object group category. -/
theorem Group.classifyingSpace_translation_isCoveringMap (G : Type) [Group G] :
    IsCoveringMap (CategoryTheory.classifyingSpaceMap (CategoryTheory.ActionCategory.π G G)).hom := sorry

/-- A free transitive group action has contractible action-category classifying space. -/
theorem Group.classifyingSpace_actionCategory_homotopyEquiv (G X : Type u) [Group G] [MulAction G X]
    [MulAction.IsPretransitive G X] (x : X) :
    Nonempty (ContinuousMap.HomotopyEquiv (CategoryTheory.classifyingSpace (CategoryTheory.ActionCategory G X))
      (Group.classifyingSpace (MulAction.stabilizer G x))) := sorry

/-- The classifying space of G is aspherical and has fundamental group G at its distinguished vertex. -/
theorem Group.classifyingSpace_isKOne (G : Type u) [Group G] :
    Existing.IsKOne G (Group.classifyingSpace G) (Group.classifyingSpace.basepoint G) := sorry

/-- Conjugate homomorphisms induce freely homotopic maps of classifying spaces. -/
theorem Group.classifyingSpace_map_conj_homotopic {G H : Type u} [Group G] [Group H]
    (φ : G →* H) (h : H) :
    ContinuousMap.Homotopic (Group.classifyingSpace.map φ).hom
      (Group.classifyingSpace.map ((MulAut.conj h).toMonoidHom.comp φ)).hom := sorry

/-- , chain level: entrywise inversion `(g₁, …, g_n) ↦ (g₁⁻¹, …, g_n⁻¹)`
identifies the category chains of `SingleObj G` with Mathlib's inhomogeneous chains. -/
theorem Group.categoryChainComplex_singleObj_iso (k G : Type u) [CommRing k] [Group G] (A : Rep k G) :
    Nonempty (CategoryTheory.categoryChainComplex k
      ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) ≅
        groupHomology.inhomogeneousChains A) := sorry

/-- `H_n(BG; M) ≅ H_n(G; M)` via the bar construction. -/
theorem Group.categoryHomology_singleObj_iso (k G : Type u) [CommRing k] [Group G] (A : Rep k G)
    (n : ℕ) : Nonempty (CategoryTheory.categoryHomology k
      ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) n ≅ groupHomology A n) := sorry

/-- the nerve of a groupoid is a Kan complex. -/
theorem CategoryTheory.Groupoid.nerve_kanComplex (C : Type u) [Groupoid.{u} C] :
    SSet.KanComplex (nerve C) := sorry

/-- `π₁(BC, [X]) ≅ Aut X` and `π_n(BC, [X]) = 0` for `n ≥ 2`. -/
theorem CategoryTheory.Groupoid.classifyingSpace_oneType (C : Type u) [Groupoid.{u} C] (X : C) :
    Nonempty (FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex X) ≃* Aut X) ∧
      ∀ n : ℕ, Subsingleton (HomotopyGroup.Pi (n + 2) (classifyingSpace C)
        (classifyingSpace_vertex X)) := sorry

/-! ## Layer 2: Homotopy fibres and Quillen's theorems -/

namespace TauCeti

open Topology

/-- bijective on every `π_n`, `n ≥ 0`, at every basepoint
(`π_0` at all basepoints is the bijection on path components); the first clause makes `π_0`
surjective when `X` is empty. -/
def IsWeakHomotopyEquivalence {X Y : TopCat.{u}} (f : X ⟶ Y) : Prop :=
  (IsEmpty X → IsEmpty Y) ∧ ∀ (n : ℕ) (x : X), Function.Bijective (Existing.piMap n f.hom x)

/-- Weak equivalences satisfy two-out-of-three. -/
theorem IsWeakHomotopyEquivalence.comp {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsWeakHomotopyEquivalence f) (hg : IsWeakHomotopyEquivalence g) :
    IsWeakHomotopyEquivalence (f ≫ g) := sorry

/-- Cancel a weak equivalence on the right of a composite weak equivalence. -/
theorem IsWeakHomotopyEquivalence.of_comp_left {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hg : IsWeakHomotopyEquivalence g) (hfg : IsWeakHomotopyEquivalence (f ≫ g)) :
    IsWeakHomotopyEquivalence f := sorry

/-- Cancel a weak equivalence on the left of a composite weak equivalence. -/
theorem IsWeakHomotopyEquivalence.of_comp_right {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsWeakHomotopyEquivalence f) (hfg : IsWeakHomotopyEquivalence (f ≫ g)) :
    IsWeakHomotopyEquivalence g := sorry

/-- A homotopy equivalence is weak. -/
theorem _root_.TauCetiRoadmap.StableHomotopyKTheory.ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence {X Y : TopCat.{u}}
    (e : ContinuousMap.HomotopyEquiv X Y) : IsWeakHomotopyEquivalence (TopCat.ofHom e.toFun) := sorry

/-- Homotopic maps have the same weak-equivalence property. -/
theorem IsWeakHomotopyEquivalence.of_homotopic {X Y : TopCat.{u}} {f g : X ⟶ Y}
    (h : ContinuousMap.Homotopic f.hom g.hom) (hf : IsWeakHomotopyEquivalence f) :
    IsWeakHomotopyEquivalence g := sorry

/-- Between CW spaces, a weak equivalence admits a homotopy inverse. -/
theorem IsWeakHomotopyEquivalence.homotopyEquiv_of_cw {X Y : TopCat.{u}}
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] {f : X ⟶ Y}
    (hf : IsWeakHomotopyEquivalence f) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `isWeakHomotopyEquivalence_id`: The identity of any space is a weak homotopy equivalence. -/
example (X : TopCat.{u}) : IsWeakHomotopyEquivalence (𝟙 X) := sorry

/-- `isWeakHomotopyEquivalence_contractible`: Any map between contractible spaces is a weak homotopy equivalence. -/
example {X Y : TopCat.{u}} [ContractibleSpace X] [ContractibleSpace Y] (f : X ⟶ Y) :
    IsWeakHomotopyEquivalence f := sorry

/-- `isWeakHomotopyEquivalence_not_pi0`: The inclusion of one point into a two-point discrete space is not a weak homotopy equivalence (π₀ fails), although it is an isomorphism on all π_n at its basepoint. -/
example : ¬ IsWeakHomotopyEquivalence
    (TopCat.ofHom (ContinuousMap.const PUnit.{1} (ULift.up true : ULift.{0} Bool)) :
      TopCat.of PUnit.{1} ⟶ TopCat.of (ULift.{0} Bool)) := sorry

/-- `isWeakHomotopyEquivalence_not_all_basepoints`: S¹⊔*→{a,b} is bijective on components and correct on all π at *. It fails at a circle point: π₁=ℤ maps to zero. -/
example : ¬ IsWeakHomotopyEquivalence
    (TopCat.ofHom ⟨Sum.elim (fun _ : Circle => (ULift.up true : ULift.{0} Bool))
        (fun _ : PUnit.{1} => (ULift.up false : ULift.{0} Bool)), by fun_prop⟩ :
      TopCat.of (Circle ⊕ PUnit.{1}) ⟶ TopCat.of (ULift.{0} Bool)) := sorry

/-- `isWeakHomotopyEquivalence_iff_homotopyEquiv_cw`: For CW complexes X, Y, f is a weak homotopy equivalence iff it is the forward map of a homotopy equivalence. -/
example {X Y : TopCat.{u}} [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] (f : X ⟶ Y) :
    IsWeakHomotopyEquivalence f ↔ ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

variable {A B : TopCat.{u}}

/-- pairs `(a, γ)` with `γ 0 = f a`, `γ 1 = b`. -/
def homotopyFiber (f : A ⟶ B) (b : B) : TopCat.{u} :=
  TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1 ∧ p.2 1 = b}

namespace homotopyFiber

/-- (a,γ)↦a. -/
def proj (f : A ⟶ B) (b : B) : homotopyFiber f b ⟶ A :=
  TopCat.ofHom ⟨fun p => p.1.1, sorry⟩

/-- If f(a₀)=b, choose (a₀,const). -/
def basepoint (f : A ⟶ B) (a₀ : A) : homotopyFiber f (f.hom a₀) :=
  ⟨(a₀, ContinuousMap.const _ (f.hom a₀)), rfl, rfl⟩

/-- The strict fibre maps by a↦(a,const). -/
def ofFiber (f : A ⟶ B) (b : B) : {a : A // f.hom a = b} → homotopyFiber f b :=
  fun a => ⟨(a.1, ContinuousMap.const _ b), a.2.symm, rfl⟩

/-- A commutative square induces a map of homotopy fibres. -/
def map {A' B' : TopCat.{u}} {f' : A' ⟶ B'} {f : A ⟶ B} (α : A' ⟶ A) (β : B' ⟶ B)
    (w : f' ≫ β = α ≫ f) (b' : B') : homotopyFiber f' b' ⟶ homotopyFiber f (β.hom b') := sorry

/-- ω↦(a₀,ω) from Ω(B,b). -/
def loopSpaceInclusion (f : A ⟶ B) (a₀ : A) : LoopSpace B (f.hom a₀) → homotopyFiber f (f.hom a₀) :=
  fun ω => ⟨(a₀, ⟨ω, ω.continuous⟩), ω.source, ω.target⟩

/-- A homotopy f≃g compares fibres by concatenating its tracks. -/
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

/-- A specified nullhomotopy gives the comparison with the endpoint homotopy fibre. -/
def fiberSequenceMapOfHomotopy {F : TopCat.{u}} (i : F ⟶ A) (f : A ⟶ B) (b : B)
    (H : ContinuousMap.Homotopy (f.hom.comp i.hom) (ContinuousMap.const F b)) :
    F ⟶ homotopyFiber f b :=
  TopCat.ofHom ⟨fun x => ⟨(i.hom x, ⟨fun t => H (t, x), sorry⟩), sorry, sorry⟩, sorry⟩

/-- A homotopy fibre sequence retains its chosen nullhomotopy. -/
def IsHomotopyFiberSequenceOfHomotopy {F : TopCat.{u}} (i : F ⟶ A) (f : A ⟶ B) (b : B)
    (H : ContinuousMap.Homotopy (f.hom.comp i.hom) (ContinuousMap.const F b)) : Prop :=
  IsWeakHomotopyEquivalence (fiberSequenceMapOfHomotopy i f b H)

/-- Projection from a product has the full homotopy lifting property. -/
example (X Y : TopCat.{u}) (Z : TopCat.{u}) (H : C(Z × unitInterval, Y))
    (g : C(Z, X × Y)) (hg : ∀ z, (g z).2 = H (z, 0)) :
    ∃ G : C(Z × unitInterval, X × Y),
      (∀ z t, (G (z, t)).2 = H (z, t)) ∧ ∀ z, G (z, 0) = g z := sorry

/-- `homotopyFiber_id_contractible`: homotopyFiber (𝟙 B) b is contractible for every b. -/
example (b : B) : ContractibleSpace (homotopyFiber (𝟙 B) b) := sorry

/-- `homotopyFiber_point_eq_loopSpace`: For the inclusion of the point b into B, homotopyFiber is homeomorphic to Ω B b = LoopSpace B b. -/
example (b : B) : Nonempty (homotopyFiber
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit.{u + 1} ⟶ B) b ≃ₜ
      LoopSpace B b) := sorry

/-- `homotopyFiber_toPoint`: For the constant map A → point, homotopyFiber is homeomorphic to A. -/
example : Nonempty (homotopyFiber
    (TopCat.ofHom (ContinuousMap.const A PUnit.unit) : A ⟶ TopCat.of PUnit.{u + 1}) PUnit.unit ≃ₜ
      A) := sorry

/-- `homotopyFiber_ofFiber_not_weakEquiv`: For proper H⊂G, BH→BG has a point strict fibre but homotopy-fibre components G/H. The comparison misses components. -/
example (G : Type u) [Group G] (H : Subgroup G) :
    Nonempty (ZerothHomotopy (homotopyFiber (Group.classifyingSpace.map H.subtype)
      (Group.classifyingSpace.basepoint G)) ≃ G ⧸ H) := sorry

/-- `A` is homotopy equivalent to the mapping path space `E_f`,
over `B`. -/
theorem mappingPathSpace_homotopyEquiv (f : A ⟶ B) :
    ∃ e : ContinuousMap.HomotopyEquiv A
      (TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}),
      ∀ a : A, e.toFun a = ⟨(a, ContinuousMap.const unitInterval (f.hom a)), rfl⟩ := sorry

/-- `(a, γ) ↦ γ 1` has the homotopy lifting property for all spaces. -/
theorem mappingPathSpace_hasHomotopyLifting (f : A ⟶ B) (Y : TopCat.{u})
    (H : C(Y × unitInterval, B)) (g₀ : C(Y, {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}))
    (h₀ : ∀ y, (g₀ y).1.2 1 = H (y, 0)) :
    ∃ G : C(Y × unitInterval, {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}),
      ∀ y t, (G (y, t)).1.2 1 = H (y, t) ∧ G (y, 0) = g₀ y := sorry

/-- (stated for maps with the homotopy lifting property for all spaces). -/
theorem homotopyFiber.ofFiber_homotopyEquiv (p : A ⟶ B)
    (hp : ∀ (Y : TopCat.{u}) (H : C(Y × unitInterval, B)) (g₀ : C(Y, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C(Y × unitInterval, A), ∀ y t, p.hom (G (y, t)) = H (y, t) ∧
        G (y, 0) = g₀ y) (b : B) :
    ∃ e : ContinuousMap.HomotopyEquiv (TopCat.of {a : A // p.hom a = b}) (homotopyFiber p b),
      ∀ a, e.toFun a = homotopyFiber.ofFiber p b a := sorry


/-- δ:πₙ₊₁B→πₙhofib(f). -/
def homotopyFiber.connecting (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    HomotopyGroup.Pi (n + 1) B (f.hom a₀) →
      HomotopyGroup.Pi n (homotopyFiber f (f.hom a₀)) (homotopyFiber.basepoint f a₀) := sorry

/-- For n≥1, δ is a group homomorphism. -/
def homotopyFiber.connectingHom (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    HomotopyGroup.Pi (n + 2) B (f.hom a₀) →*
      HomotopyGroup.Pi (n + 1) (homotopyFiber f (f.hom a₀)) (homotopyFiber.basepoint f a₀) := sorry


/-- `connecting_id_eq_zero`: For f = 𝟙 B, connecting is the trivial map. -/
example (a₀ : B) (n : ℕ) (x : HomotopyGroup.Pi (n + 2) B ((𝟙 B : B ⟶ B).hom a₀)) :
    homotopyFiber.connectingHom (𝟙 B) a₀ n x = 1 := sorry

/-- `connecting_point_bijective`: For the inclusion of the point b into B, connecting is bijective in every degree (it is the loop-space shift). -/
example (b : B) (n : ℕ) : Function.Bijective (homotopyFiber.connecting
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit.{u + 1} ⟶ B) PUnit.unit n) := sorry


/-- exactness at `π_{n+1}(A)` (the other spots are analogous). -/
theorem homotopyFiber.exact_at_total (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (Existing.piMap (n + 1) (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀)) =
      {y | Existing.piMap (n + 1) f.hom a₀ y = 1} := sorry

/-- exactness at `π_n(F)` (`n = 0`: pointed sets). -/
theorem homotopyFiber.exact_at_fiber (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (homotopyFiber.connecting f a₀ n) =
      {y | Existing.piMap n (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀) y = default} :=
  sorry

/-- exactness at `π_{n+1}(B)`. -/
theorem homotopyFiber.exact_at_base (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (Existing.piMap (n + 1) f.hom a₀) = {y | homotopyFiber.connecting f a₀ n y = default} := sorry

/-- exactness at `π₀(A)` (pointed sets). -/
theorem homotopyFiber.exact_at_total_zero (f : A ⟶ B) (a₀ : A) :
    Set.range (Existing.piMap 0 (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀)) =
      {y | Existing.piMap 0 f.hom a₀ y = default} := sorry

/-- Based loops act on fibre components by concatenating the endpoint path. -/
@[instance_reducible]
def homotopyFiber.fundamentalGroupAction (f : A ⟶ B) (a₀ : A) :
    MulAction (FundamentalGroup B (f.hom a₀)) (ZerothHomotopy (homotopyFiber f (f.hom a₀))) := sorry

/-- Fibre-component orbits under the base fundamental group identify with components of the source. -/
theorem homotopyFiber.pi_zero_orbits (f : A ⟶ B) (a₀ : A) :
    letI := homotopyFiber.fundamentalGroupAction f a₀
    ∀ p q : homotopyFiber f (f.hom a₀),
      Joined ((homotopyFiber.proj f (f.hom a₀)).hom p) ((homotopyFiber.proj f (f.hom a₀)).hom q) ↔
        ∃ g : FundamentalGroup B (f.hom a₀),
          g • (show ZerothHomotopy (homotopyFiber f (f.hom a₀)) from _root_.Quotient.mk _ p) =
            (show ZerothHomotopy (homotopyFiber f (f.hom a₀)) from _root_.Quotient.mk _ q) := sorry

/-- Along ω:b→b′, send (a,γ) to (a,γ⋅ω). -/
def homotopyFiber.transport (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    homotopyFiber f b ⟶ homotopyFiber f b' := sorry

/-- The inverse up to homotopy is transport along ω⁻¹. -/
def homotopyFiber.transportHomotopyEquiv (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    ContinuousMap.HomotopyEquiv (homotopyFiber f b) (homotopyFiber f b') := sorry

/-- The selected transport equivalence has the path-concatenation transport as forward map. -/
theorem homotopyFiber.transportHomotopyEquiv_toFun (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    (homotopyFiber.transportHomotopyEquiv f ω).toFun = (homotopyFiber.transport f ω).hom := sorry

/-- Endpoint-fixed path homotopies give homotopic transports. -/
theorem homotopyFiber.transport_homotopic (f : A ⟶ B) {b b' : B} {ω ω' : Path b b'}
    (h : ω.Homotopic ω') :
    ContinuousMap.Homotopic (homotopyFiber.transport f ω).hom (homotopyFiber.transport f ω').hom := sorry

/-- Transport(ω⋅ω′)≃transport(ω′)∘transport(ω); constant transport≃id. -/
theorem homotopyFiber.transport_trans (f : A ⟶ B) {b b' b'' : B} (ω : Path b b') (ω' : Path b' b'') :
    ContinuousMap.Homotopic (homotopyFiber.transport f (ω.trans ω')).hom
      ((homotopyFiber.transport f ω').hom.comp (homotopyFiber.transport f ω).hom) := sorry


/-- `transport_refl_homotopic_id`: transport f (Path.refl b) is homotopic to the identity. -/
example (f : A ⟶ B) (b : B) :
    ContinuousMap.Homotopic (homotopyFiber.transport f (Path.refl b)).hom (ContinuousMap.id _) := sorry


/-- `transport_comm_proj`: proj ∘ transport f ω = proj. -/
example (f : A ⟶ B) {b b' : B} (ω : Path b b') :
    homotopyFiber.transport f ω ≫ homotopyFiber.proj f b' = homotopyFiber.proj f b := sorry


/-- Triples (a,γ,c), γ:f(a)→g(c). -/
def homotopyPullback {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) : TopCat.{u} :=
  TopCat.of {p : A × C(unitInterval, B) × C' // p.2.1 0 = f.hom p.1 ∧ p.2.1 1 = g.hom p.2.2}

/-- The projections carry the track γ between their composites. -/
def homotopyPullback.fst {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) : homotopyPullback f g ⟶ A :=
  TopCat.ofHom ⟨fun p => p.1.1, sorry⟩

/-- Swap a,c and reverse γ. -/
def homotopyPullback.symm {C' : TopCat.{u}} (f : A ⟶ B) (g : C' ⟶ B) :
    homotopyPullback f g ≅ homotopyPullback g f := sorry

/-- The comparison map of a commutative square into the homotopy pullback. -/
def homotopyPullback.comparison {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E)
    (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) : E' ⟶ homotopyPullback h p := sorry

/-- `TauCeti.IsHomotopyCartesian`. -/
def IsHomotopyCartesian {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B)
    (w : p' ≫ h = α ≫ p) : Prop :=
  IsWeakHomotopyEquivalence (homotopyPullback.comparison p' p α h w)

/-- Pullback against a point b is hofib(f,b). -/
def homotopyPullback.point_eq_homotopyFiber (f : A ⟶ B) (b : B) :
    homotopyPullback f (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B) ≅
      homotopyFiber f b := sorry

/-- A strict pullback of a Serre fibration is homotopy-cartesian. -/
theorem IsHomotopyCartesian.of_serreFibration {E E' B' : TopCat.{u}} (p : E ⟶ B) (h : B' ⟶ B)
    (hp : ∀ n : ℕ, ∀ (H : C((Fin n → unitInterval) × unitInterval, B)) (g₀ : C(Fin n → unitInterval, E)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C((Fin n → unitInterval) × unitInterval, E),
        ∀ y t, p.hom (G (y, t)) = H (y, t) ∧ G (y, 0) = g₀ y)
    (p' : E' ⟶ B') (α : E' ⟶ E) (w : p' ≫ h = α ≫ p) (hpb : IsLimit (PullbackCone.mk p' α w)) :
    IsHomotopyCartesian p' p α h w := sorry

/-- `homotopyPullback_point_point`: homotopyPullback (point b) (point b) is the loop space Ω B b. -/
example (b : B) : Nonempty (homotopyPullback
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B)
    (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} b) : TopCat.of PUnit ⟶ B) ≃ₜ LoopSpace B b) := sorry

/-- `isHomotopyCartesian_id`: For any map p : E → B, the square with E′ = E, B′ = B, α = id, h = id and p′ = p is homotopy-cartesian (the comparison is the inclusion of E into the mapping path space of p). -/
example {E : TopCat.{u}} (p : E ⟶ A) : IsHomotopyCartesian p p (𝟙 E) (𝟙 A) (by simp) := sorry

/-- The map `E' → F(p, h b')`, `e' ↦ (α e', t ↦ h (K (p' e', t)))`, given by a contraction `K` of `B'`. -/
def homotopyFiber.ofContraction {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E)
    (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B')
    (K : ContinuousMap.Homotopy (ContinuousMap.id B') (ContinuousMap.const B' b')) :
    E' ⟶ homotopyFiber p (h.hom b') := sorry

/-- `isHomotopyCartesian_iff_fiber`: For B′ contractible, the square is homotopy-cartesian iff E′ → homotopyFiber p (h b′) is a weak homotopy equivalence. -/
example {E' E : TopCat.{u}} (p' : E' ⟶ TopCat.of PUnit.{u + 1}) (p : E ⟶ B) (α : E' ⟶ E)
    (h : TopCat.of PUnit.{u + 1} ⟶ B) (w : p' ≫ h = α ≫ p) :
    IsHomotopyCartesian p' p α h w ↔ IsHomotopyFiberSequence α p (h.hom PUnit.unit) := sorry


/-- Over a contractible base, a square is homotopy-cartesian exactly when its comparison to the product is weakly invertible. -/
theorem IsHomotopyCartesian.iff_of_contraction {E' E B' : TopCat.{u}}
    (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B')
    (K : ContinuousMap.Homotopy (ContinuousMap.id B') (ContinuousMap.const B' b')) :
    IsHomotopyCartesian p' p α h w ↔
      IsWeakHomotopyEquivalence (homotopyFiber.ofContraction p' p α h w b' K) := sorry

/-- Homotopy-cartesian squares compose, and the stated inner-square hypothesis permits cancellation. -/
theorem IsHomotopyCartesian.paste {X₁ X₂ X₃ Y₁ Y₂ Y₃ : TopCat.{u}} (a₁ : X₁ ⟶ X₂) (a₂ : X₂ ⟶ X₃)
    (b₁ : Y₁ ⟶ Y₂) (b₂ : Y₂ ⟶ Y₃) (v₁ : X₁ ⟶ Y₁) (v₂ : X₂ ⟶ Y₂) (v₃ : X₃ ⟶ Y₃)
    (w₁ : v₁ ≫ b₁ = a₁ ≫ v₂) (w₂ : v₂ ≫ b₂ = a₂ ≫ v₃)
    (h₂ : IsHomotopyCartesian v₂ v₃ a₂ b₂ w₂) :
    IsHomotopyCartesian v₁ v₂ a₁ b₁ w₁ ↔
      IsHomotopyCartesian v₁ v₃ (a₁ ≫ a₂) (b₁ ≫ b₂) (by rw [← Category.assoc, w₁, Category.assoc, w₂, ← Category.assoc]) := sorry

/-- a square is homotopy-cartesian iff its transpose is. -/
theorem IsHomotopyCartesian.transpose {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B)
    (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) :
    IsHomotopyCartesian p' p α h w ↔ IsHomotopyCartesian α h p' p w.symm := sorry

/-- horizontal weak equivalences give a homotopy-cartesian square. -/
theorem IsHomotopyCartesian.of_isWeakHomotopyEquivalence {E' E B' : TopCat.{u}} (p' : E' ⟶ B')
    (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p)
    (hα : IsWeakHomotopyEquivalence α) (hh : IsWeakHomotopyEquivalence h) :
    IsHomotopyCartesian p' p α h w := sorry

/-- Every strict-fibre comparison is weak. -/
def IsQuasiFibration (p : A ⟶ B) : Prop :=
  ∀ b : B, IsWeakHomotopyEquivalence (TopCat.ofHom ⟨homotopyFiber.ofFiber p b, sorry⟩ :
    TopCat.of {a : A // p.hom a = b} ⟶ homotopyFiber p b)

/-- Serre fibrations are quasifibrations. -/
theorem IsQuasiFibration.of_serreFibration (p : A ⟶ B)
    (hp : ∀ n : ℕ, ∀ (H : C((Fin n → unitInterval) × unitInterval, B)) (g₀ : C(Fin n → unitInterval, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C((Fin n → unitInterval) × unitInterval, A),
        ∀ y t, p.hom (G (y, t)) = H (y, t) ∧ G (y, 0) = g₀ y) : IsQuasiFibration p := sorry

/-- `IsQuasiFibration.longExactSequence`: exactness at `π_{n+1}(E)` with the strict fibre. -/
theorem IsQuasiFibration.exact_at_total {p : A ⟶ B} (hp : IsQuasiFibration p) (a₀ : A) (n : ℕ) :
    Set.range (Existing.piMap (n + 1)
        (ContinuousMap.mk Subtype.val continuous_subtype_val : C({a : A // p.hom a = p.hom a₀}, A))
        (⟨a₀, rfl⟩ : {a : A // p.hom a = p.hom a₀})) =
      {y | Existing.piMap (n + 1) p.hom a₀ y = 1} := sorry


/-- `isQuasiFibration_prod_fst`: The projection B × F → B is a quasi-fibration. -/
example (F : TopCat.{u}) : IsQuasiFibration (TopCat.ofHom ⟨Prod.fst, continuous_fst⟩ :
    TopCat.of (B × F) ⟶ B) := sorry


/-- `isQuasiFibration_id`: The identity of any space is a quasi-fibration. -/
example : IsQuasiFibration (𝟙 A) := sorry

/-- `not_isQuasiFibration_two_intervals`: The map [0, 1/2] ⊔ [1/2, 1] → [0, 1] given by the two inclusions is not a quasi-fibration: its homotopy fibres are all two points, but its fibre over 0 is one point. -/
example : ¬ IsQuasiFibration (TopCat.ofHom ⟨fun (x : Set.Icc (0 : ℝ) (1/2) ⊕ Set.Icc (1/2 : ℝ) 1) =>
    (Sum.elim (fun y : Set.Icc (0 : ℝ) (1/2) => (y : ℝ)) (fun y : Set.Icc (1/2 : ℝ) 1 => (y : ℝ)) x : ℝ),
      sorry⟩ :
      TopCat.of (Set.Icc (0 : ℝ) (1/2) ⊕ Set.Icc (1/2 : ℝ) 1) ⟶ TopCat.of ℝ) := sorry

/-- (criterion (a): open covers). -/
theorem IsQuasiFibration.of_openCover (p : A ⟶ B) (V₁ V₂ : Set B) (h₁ : IsOpen V₁) (h₂ : IsOpen V₂)
    (hcov : V₁ ∪ V₂ = Set.univ)
    (q : ∀ V : Set B, IsQuasiFibration (TopCat.ofHom ⟨fun (a : p.hom ⁻¹' V) => (⟨p.hom a, a.2⟩ : V), sorry⟩ :
      TopCat.of (p.hom ⁻¹' V) ⟶ TopCat.of V) ∨ (V ≠ V₁ ∧ V ≠ V₂ ∧ V ≠ V₁ ∩ V₂)) :
    IsQuasiFibration p := sorry

/-- (criterion (b)). -/
theorem IsQuasiFibration.of_exhaustion (p : A ⟶ B) (Bn : ℕ → Set B) (hmono : Monotone Bn)
    (hcpt : ∀ K : Set B, IsCompact K → ∃ n, K ⊆ Bn n)
    (q : ∀ n, IsQuasiFibration (TopCat.ofHom ⟨fun (a : p.hom ⁻¹' Bn n) => (⟨p.hom a, a.2⟩ : Bn n), sorry⟩ :
      TopCat.of (p.hom ⁻¹' Bn n) ⟶ TopCat.of (Bn n))) :
    IsQuasiFibration p := sorry

/-- (criterion (c)); deformations in the weak sense. -/
theorem IsQuasiFibration.of_deformation (p : A ⟶ B) (E' : Set A) (B' : Set B)
    (hE' : ∀ a ∈ E', p.hom a ∈ B') (D : C(A × unitInterval, A)) (Db : C(B × unitInterval, B))
    (hD₀ : ∀ a, D (a, 0) = a) (hD₁ : ∀ a, D (a, 1) ∈ E') (hDE : ∀ a ∈ E', ∀ t, D (a, t) ∈ E')
    (hDb₀ : ∀ b, Db (b, 0) = b) (hDb₁ : ∀ b, Db (b, 1) ∈ B') (hDbB : ∀ b ∈ B', ∀ t, Db (b, t) ∈ B')
    (hcov : ∀ a t, p.hom (D (a, t)) = Db (p.hom a, t))
    (q : IsQuasiFibration (TopCat.ofHom ⟨fun (a : E') => (⟨p.hom a, hE' a a.2⟩ : B'), sorry⟩ :
      TopCat.of E' ⟶ TopCat.of B'))
    (hfib : ∀ b : B, IsWeakHomotopyEquivalence (TopCat.ofHom
      ⟨fun (a : {a : A // p.hom a = b}) => (⟨D (a.1, 1), sorry⟩ : {a : A // p.hom a = Db (b, 1)}), sorry⟩ :
        TopCat.of {a : A // p.hom a = b} ⟶ TopCat.of {a : A // p.hom a = Db (b, 1)})) :
    IsQuasiFibration p := sorry


/-- The coend ∫ⁿ Xₙ×Δⁿ. -/
def SimplicialSpace.realization : SimplicialObject TopCat.{u} ⥤ TopCat.{u} := sorry

/-- The topological singular simplicial object is right adjoint to simplicial-space realisation. -/
def SimplicialSpace.singular : TopCat.{u} ⥤ SimplicialObject TopCat.{u} := sorry

/-- Realisation is left adjoint to Y↦C(Δⁿ,Y). -/
def SimplicialSpace.realizationAdj : SimplicialSpace.realization.{u} ⊣ SimplicialSpace.singular := sorry

/-- Levelwise discrete realisation agrees with |X|. -/
def SimplicialSpace.realization_discrete (X : SSet.{u}) :
    SimplicialSpace.realization.obj (X ⋙ TopCat.discrete) ≅ SSet.toTop.obj X := sorry

/-- Bisimplicial sets as simplicial objects in simplicial sets. -/
abbrev BisimplicialSet := SimplicialObject SSet.{u}

/-- Iterated realisation of p↦|Tₚ|. -/
def BisimplicialSet.realization (T : BisimplicialSet.{u}) : TopCat.{u} :=
  SimplicialSpace.realization.obj (T ⋙ SSet.toTop)

/-- The diagonal n↦Tₙ,ₙ. -/
def BisimplicialSet.diagonal (T : BisimplicialSet.{u}) : SSet.{u} := sorry

/-- The external product `X ⊠ Y` of simplicial sets as a bisimplicial set. -/
def BisimplicialSet.box (X Y : SSet.{u}) : BisimplicialSet.{u} := sorry

/-- Realisation preserves colimits. -/
theorem SimplicialSpace.realization_preservesColimits :
    PreservesColimits SimplicialSpace.realization.{u} := sorry

/-- `realization_const`: The realisation of the constant simplicial space at Y is homeomorphic to Y. -/
example (Y : TopCat.{u}) :
    Nonempty (SimplicialSpace.realization.obj ((Functor.const _).obj Y) ≅ Y) := sorry

/-- `realization_box_stdSimplex`: For the bisimplicial set Δ[r] ⊠ Δ[s], the realisation is homeomorphic to Δ^r × Δ^s. -/
example (r s : ℕ) : Nonempty (BisimplicialSet.realization
    (BisimplicialSet.box (SSet.stdSimplex.obj (SimplexCategory.mk r))
      (SSet.stdSimplex.obj (SimplexCategory.mk s))) ≃ₜ
    (SSet.toTop.obj (SSet.stdSimplex.obj (SimplexCategory.mk r)) ×
      SSet.toTop.obj (SSet.stdSimplex.obj (SimplexCategory.mk s)))) := sorry

/-- `realization_discrete_compat`: For a simplicial set X, the realisation of the discrete simplicial space is SSet.toTop.obj X. -/
example (X : SSet.{u}) :
    Nonempty (SimplicialSpace.realization.obj (X ⋙ TopCat.discrete) ≅ SSet.toTop.obj X) :=
  ⟨SimplicialSpace.realization_discrete X⟩

/-- `bisimplicial_diagonal_not_mathlib_diagonal`: The diagonal of Δ[1]⊠Δ[1] has four vertices. Mathlib’s single-object long-edge map Xₙ→X₁ is a different operation. -/
example : Nonempty (BisimplicialSet.diagonal (BisimplicialSet.box
    (SSet.stdSimplex.obj (SimplexCategory.mk 1)) (SSet.stdSimplex.obj (SimplexCategory.mk 1))) ≅
      nerve (ULift.{0} (Fin 2 × Fin 2))) := sorry

/-- Iterated realisation is naturally isomorphic to realisation of the diagonal. -/
theorem BisimplicialSet.realization_iso_diagonal (T : BisimplicialSet.{u}) :
    Nonempty (BisimplicialSet.realization T ≅ SSet.toTop.obj (BisimplicialSet.diagonal T)) := sorry

/-- The transpose `(p, q) ↦ T_{q,p}` of a bisimplicial set. -/
def BisimplicialSet.transpose (T : BisimplicialSet.{u}) : BisimplicialSet.{u} := sorry

/-- realising in either order gives the same space. -/
theorem BisimplicialSet.realization_transpose (T : BisimplicialSet.{u}) :
    Nonempty (BisimplicialSet.realization T.transpose ≅ BisimplicialSet.realization T) := sorry

/-- The degeneracy-image union in Xₙ and its inclusion. -/
def SimplicialSpace.latching (X : SimplicialObject TopCat.{u}) (n : ℕ) : Set (X _⦋n⦌) :=
  ⋃ (m : ℕ) (_ : m < n) (s : SimplexCategory.mk n ⟶ SimplexCategory.mk m), Set.range (X.map s.op).hom

/-- All latching inclusions are closed Hurewicz cofibrations. -/
def SimplicialSpace.IsProper (X : SimplicialObject TopCat.{u}) : Prop :=
  ∀ n, IsClosed (SimplicialSpace.latching X n) ∧
    ∀ (Y : TopCat.{u}) (f : C(X _⦋n⦌, Y))
      (H : C((SimplicialSpace.latching X n) × unitInterval, Y)),
      (∀ a, H (a, 0) = f a) →
      ∃ G : C((X _⦋n⦌) × unitInterval, Y),
        (∀ x, G (x, 0) = f x) ∧
          ∀ (a : SimplicialSpace.latching X n) t, G (a, t) = H (a, t)

/-- Levelwise discrete objects are proper. -/
theorem SimplicialSpace.isProper_discrete (X : SSet.{u}) :
    SimplicialSpace.IsProper (X ⋙ TopCat.discrete) := sorry

/-- Realising one direction of a bisimplicial set gives a proper simplicial space. -/
theorem SimplicialSpace.isProper_realization_bisimplicial (T : BisimplicialSet.{u}) :
    SimplicialSpace.IsProper (T ⋙ SSet.toTop) := sorry

/-- `isProper_const`: A constant simplicial space at Y is proper: in degree 0 its latching inclusion is ∅ → Y, and in positive degrees it is the identity of Y; both have the homotopy extension property. -/
example (Y : TopCat.{u}) : SimplicialSpace.IsProper ((Functor.const _).obj Y) := sorry

/-- `isProper_nerve_discrete_category`: The nerve of a category viewed as a discrete simplicial space is proper. -/
example (C : Type u) [SmallCategory C] : SimplicialSpace.IsProper (nerve C ⋙ TopCat.discrete) := sorry

/-- `isProper_compat_bisimplicial`: For a bisimplicial set T, the latching subspace of p ↦ |T_{p,•}| in degree n is the realisation of the simplicial subset of degenerate (n, •)-simplices, a subcomplex. -/
example (T : BisimplicialSet.{u}) : SimplicialSpace.IsProper (T ⋙ SSet.toTop) ∧
    Nonempty (BisimplicialSet.realization T ≅ SSet.toTop.obj (BisimplicialSet.diagonal T)) := sorry

/-- `not_isProper_bad_degeneracy`: Take X₀=* and X₁={0}∪{1/k:k≥1}, with s₀(*)=0. The point inclusion has no neighbourhood deformation: each 1/k is its own path component. This 1-skeletal simplicial space is not proper. -/
example : ∃ X : SimplicialObject TopCat.{0}, ¬ SimplicialSpace.IsProper X := sorry


/-- A levelwise weak equivalence of proper simplicial spaces realises to a weak equivalence. -/
theorem SimplicialSpace.realization_weakEquivalence {X Y : SimplicialObject TopCat.{u}} (f : X ⟶ Y)
    (hX : SimplicialSpace.IsProper X) (hY : SimplicialSpace.IsProper Y)
    (hXk : ∀ n, CompactlyGeneratedSpace (X.obj n)) (hYk : ∀ n, CompactlyGeneratedSpace (Y.obj n))
    (hX₂ : ∀ n, T2Space (X.obj n)) (hY₂ : ∀ n, T2Space (Y.obj n))
    (hf : ∀ n, IsWeakHomotopyEquivalence (f.app n)) :
    IsWeakHomotopyEquivalence (SimplicialSpace.realization.map f) := sorry

/-- (levelwise realisations of bisimplicial sets). -/
theorem BisimplicialSet.realization_fiberSequence {V W X : BisimplicialSet.{u}} (i : V ⟶ W)
    (p : W ⟶ X) (x : ∀ n, SSet.toTop.obj (X.obj n))
    (hX : ∀ n, PathConnectedSpace (SSet.toTop.obj (X.obj n)))
    (hx : ∀ ⦃m n⦄ (φ : m ⟶ n), (SSet.toTop.map (X.map φ)).hom (x m) = x n)
    (hlev : ∀ n, IsHomotopyFiberSequence (SSet.toTop.map (i.app n)) (SSet.toTop.map (p.app n)) (x n))
    (xr : SimplicialSpace.realization.obj (X ⋙ SSet.toTop))
    (hxr : ∀ v, (SimplicialSpace.realization.map (Functor.whiskerRight p SSet.toTop)).hom
      ((SimplicialSpace.realization.map (Functor.whiskerRight i SSet.toTop)).hom v) = xr) :
    IsHomotopyFiberSequence (SimplicialSpace.realization.map (Functor.whiskerRight i SSet.toTop))
      (SimplicialSpace.realization.map (Functor.whiskerRight p SSet.toTop)) xr := sorry


/-- The simplicial replacement has a summand X(c₀) for each composable string c₀→⋯→cₙ. -/
def hocolimSimplicial (I : Type u) [SmallCategory I] (X : I ⥤ TopCat.{u}) :
    SimplicialObject TopCat.{u} := sorry

/-- Realise strings i₀→⋯→iₙ weighted by X(i₀). -/
def hocolim (I : Type u) [SmallCategory I] (X : I ⥤ TopCat.{u}) : TopCat.{u} :=
  SimplicialSpace.realization.obj (hocolimSimplicial I X)

namespace hocolim

variable {I : Type u} [SmallCategory I]

/-- Forget the coefficient point to map to BI. -/
def toNerve (X : I ⥤ TopCat.{u}) : hocolim I X ⟶ CategoryTheory.classifyingSpace I := sorry

/-- Transformations induce hocolim maps, preserving id/composition. -/
def map {X X' : I ⥤ TopCat.{u}} (φ : X ⟶ X') : hocolim I X ⟶ hocolim I X' := sorry

/-- Objectwise weak equivalences induce weak hocolim maps for compactly generated Hausdorff values. -/
theorem isWeakHomotopyEquivalence_map {X X' : I ⥤ TopCat.{u}} (φ : X ⟶ X')
    (hk : ∀ i, CompactlyGeneratedSpace (X.obj i) ∧ CompactlyGeneratedSpace (X'.obj i))
    (h₂ : ∀ i, T2Space (X.obj i) ∧ T2Space (X'.obj i))
    (h : ∀ i, IsWeakHomotopyEquivalence (φ.app i)) : IsWeakHomotopyEquivalence (map φ) := sorry

/-- The constant-point hocolim is BI. -/
def const_point : hocolim I ((Functor.const I).obj (TopCat.of PUnit.{u + 1})) ≅
    CategoryTheory.classifyingSpace I := sorry

/-- The augmentation to colim X. -/
def toColimit (X : I ⥤ TopCat.{u}) : hocolim I X ⟶ colimit X := sorry

end hocolim

/-- `hocolim_const_point`: hocolim I (const point) is homeomorphic to classifyingSpace I. -/
example (I : Type u) [SmallCategory I] :
    Nonempty (hocolim I ((Functor.const I).obj (TopCat.of PUnit.{u + 1})) ≅
      CategoryTheory.classifyingSpace I) := ⟨hocolim.const_point⟩

/-- `hocolim_terminal`: If I has a terminal object t, hocolim I X → X t is a homotopy equivalence. -/
example (I : Type u) [SmallCategory I] [HasTerminal I] (X : I ⥤ TopCat.{u}) :
    Nonempty (ContinuousMap.HomotopyEquiv (hocolim I X) (X.obj (⊤_ I))) := sorry

/-- `hocolim_discrete_grothendieck`: For X : I ⥤ Type viewed as discrete spaces, hocolim I X ≅ classifyingSpace (Grothendieck X). -/
example (I : Type u) [SmallCategory I] (X : I ⥤ Type u) :
    Nonempty (hocolim I (X ⋙ TopCat.discrete) ≅ CategoryTheory.classifyingSpace (X.Elements)) := sorry


/-- for a proper simplicial space the Bousfield–Kan
homotopy colimit over `Δᵒᵖ` maps to the realisation by a weak homotopy equivalence
(Nikolaus–Scholze Lemma B.7). Stated in universe `0`, where `SimplexCategory` lives. -/
def SimplicialSpace.hocolimToRealization (X : SimplicialObject TopCat.{0}) :
    hocolim SimplexCategoryᵒᵖ X ⟶ SimplicialSpace.realization.obj X := sorry

/-- For a proper simplicial space, ordinary realisation computes its homotopy colimit. -/
theorem SimplicialSpace.hocolim_weakEquivalence_realization (X : SimplicialObject TopCat.{0})
    (hX : SimplicialSpace.IsProper X) (hk : ∀ n, CompactlyGeneratedSpace (X.obj n))
    (h₂ : ∀ n, T2Space (X.obj n)) :
    IsWeakHomotopyEquivalence (SimplicialSpace.hocolimToRealization X) := sorry

/-- Weakly invertible diagram arrows make the projection of the homotopy colimit to the nerve a quasifibration. -/
theorem hocolim.toNerve_isQuasiFibration {I : Type u} [SmallCategory I] (X : I ⥤ TopCat.{u})
    (h : ∀ ⦃i j : I⦄ (f : i ⟶ j), ∃ e : ContinuousMap.HomotopyEquiv (X.obj i) (X.obj j),
      e.toFun = (X.map f).hom) : IsQuasiFibration (hocolim.toNerve X) := sorry

/-- The classifying space of a Grothendieck construction is weakly equivalent to the homotopy colimit of its classifying spaces. -/
theorem thomason_hocolim (D : Type u) [SmallCategory D] (F : D ⥤ Cat.{u, u}) :
    ∃ g : hocolim D (F ⋙ CategoryTheory.classifyingSpaceFunctor) ⟶
      CategoryTheory.classifyingSpace (CategoryTheory.Grothendieck F), IsWeakHomotopyEquivalence g := sorry

end TauCeti

namespace CategoryTheory

open TauCetiRoadmap.StableHomotopyKTheory.TauCeti

variable {C D : Type u} [SmallCategory C] [SmallCategory D]

/-- The coefficient functor `d ↦ H_q(B(T/d); ℤ)` on `D` (comma categories `CostructuredArrow T d`). -/
def commaHomologyCoeff (T : C ⥤ D) (q : ℕ) : D ⥤ ModuleCat.{u} (ULift.{u} ℤ) := sorry


/-- B(Y\\f)→hofib(Bf,[Y]), reversing the arrow track. -/
def commaToHomotopyFiber (F : C ⥤ D) (d : D) :
    classifyingSpace (StructuredArrow d F) ⟶
      homotopyFiber (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

/-- Its projection is B(StructuredArrow.proj). -/
theorem commaToHomotopyFiber_proj (F : C ⥤ D) (d : D) :
    commaToHomotopyFiber F d ≫ homotopyFiber.proj (classifyingSpaceMap F) (classifyingSpace_vertex d) =
      classifyingSpaceMap (StructuredArrow.proj d F) := sorry

/-- For u:Y→Y′, comma change and transport along edge(u)⁻¹ give homotopic comparisons. -/
theorem commaToHomotopyFiber_naturality (F : C ⥤ D) {d d' : D} (u : d ⟶ d') :
    ContinuousMap.Homotopic
      ((classifyingSpaceMap (StructuredArrow.map (T := F) u)) ≫ commaToHomotopyFiber F d).hom
      ((commaToHomotopyFiber F d' ≫ homotopyFiber.transport _ (classifyingSpace_edge u).symm)).hom := sorry

/-- B(f/Y)→hofib(Bf,[Y]) uses the forward arrow track. -/
def costructuredArrowToHomotopyFiber (F : C ⥤ D) (d : D) :
    classifyingSpace (CostructuredArrow F d) ⟶
      homotopyFiber (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

/-- `commaToHomotopyFiber_id`: For f = 𝟭 C′ both source and target are contractible, so commaToHomotopyFiber is a weak homotopy equivalence. -/
example (d : D) : IsWeakHomotopyEquivalence (commaToHomotopyFiber (𝟭 D) d) := sorry


/-- `commaToHomotopyFiber_not_equiv`: For {0}→(0<1), 1\f is empty but the fibre at 1 is contractible. Theorem B’s hypothesis is essential. -/
example : ¬ IsWeakHomotopyEquivalence
    (commaToHomotopyFiber (Functor.const (Discrete PUnit.{1}) |>.obj (0 : Fin 2) : Discrete PUnit ⥤ Fin 2) 1) := sorry

/-- Contractibility of every structured-arrow category makes the classifying-space map a homotopy equivalence. -/
theorem quillenTheoremA (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- The inclusion of the strict fibre into the comma category `d \ F`, `X ↦ (X, 𝟙)`. -/
def fiberToComma (F : C ⥤ D) (d : D) : F.Fiber d ⥤ StructuredArrow d F := sorry

/-- `commaToHomotopyFiber_fiberToComma`: on the strict fibre the comparison map is the fibre inclusion. -/
theorem commaToHomotopyFiber_fiberToComma (F : C ⥤ D) (d : D) :
    ∃ h : ∀ x, (classifyingSpaceMap F).hom
        ((classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C)).hom x) = classifyingSpace_vertex d,
      ContinuousMap.Homotopic (classifyingSpaceMap (fiberToComma F d) ≫ commaToHomotopyFiber F d).hom
        (fiberSequenceMap (classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C))
          (classifyingSpaceMap F) (classifyingSpace_vertex d) h).hom := sorry

/-- Prefibredness is equivalent to the fibre-to-comma inclusions having right adjoints. -/
theorem isPreFibered_iff_fibre_adjoint (F : C ⥤ D) :
    F.IsPreFibered ↔ ∀ d : D, ∃ R : StructuredArrow d F ⥤ F.Fiber d, Nonempty (fiberToComma F d ⊣ R) := sorry

/-- A prefibred functor with contractible fibre classifying spaces induces a homotopy equivalence. -/
theorem quillenTheoremA_prefibered (F : C ⥤ D) [F.IsPreFibered]
    (h : ∀ d : D, ContractibleSpace (classifyingSpace (F.Fiber d))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- Weak equivalences on comma-category base changes identify each comma classifying space with the corresponding homotopy fibre. -/
theorem quillenTheoremB (F : C ⥤ D)
    (h : ∀ ⦃d d' : D⦄ (u : d ⟶ d'), ∃ e : ContinuousMap.HomotopyEquiv
      (classifyingSpace (StructuredArrow d' F)) (classifyingSpace (StructuredArrow d F)),
        e.toFun = (classifyingSpaceMap (StructuredArrow.map (T := F) u)).hom) (d : D) :
    IsWeakHomotopyEquivalence (commaToHomotopyFiber F d) := sorry


/-- For a prefibred functor, weak equivalences on fibre base changes identify fibres with homotopy fibres. -/
theorem quillenTheoremB_prefibered (F : C ⥤ D) (R : ∀ d : D, StructuredArrow d F ⥤ F.Fiber d)
    (adj : ∀ d : D, fiberToComma F d ⊣ R d)
    (h : ∀ ⦃d d' : D⦄ (u : d ⟶ d'), ∃ e : ContinuousMap.HomotopyEquiv
      (classifyingSpace (F.Fiber d')) (classifyingSpace (F.Fiber d)),
        e.toFun = (classifyingSpaceMap (fiberToComma F d' ⋙ StructuredArrow.map (T := F) u ⋙ R d)).hom)
    (d : D) :
    IsHomotopyFiberSequence (classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C))
      (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

/-- A normal subgroup gives the fibre sequence BN→BG→B(G/N). -/
theorem groupExtension_fiberSequence (G : Type u) [Group G] (N : Subgroup G) [N.Normal] :
    IsHomotopyFiberSequence (Group.classifyingSpace.map N.subtype)
      (Group.classifyingSpace.map (QuotientGroup.mk' N)) (Group.classifyingSpace.basepoint _) := sorry

end CategoryTheory

/-! ## Layer 3: The plus construction -/

namespace TauCeti

variable {X Y Z : TopCat.{u}}

/-- path-connected with vanishing integral homology in positive degrees
(equivalently, nonempty with vanishing reduced integral homology). -/
def IsAcyclicSpace (F : TopCat.{u}) : Prop :=
  PathConnectedSpace F ∧ ∀ n : ℕ, IsZero (Existing.singH (ULift.{u} ℤ) (n + 1) F)

/-- An acyclic space is path-connected. -/
theorem IsAcyclicSpace.pathConnected {F : TopCat.{u}} (h : IsAcyclicSpace F) : PathConnectedSpace F := h.1

/-- Contractible spaces are acyclic. -/
theorem IsAcyclicSpace.of_contractible (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := sorry

/-- Homotopy equivalence preserves acyclicity. -/
theorem IsAcyclicSpace.of_homotopyEquiv {F F' : TopCat.{u}} (e : ContinuousMap.HomotopyEquiv F F')
    (h : IsAcyclicSpace F) : IsAcyclicSpace F' := sorry

/-- π₁ of an acyclic space is superperfect. -/
theorem IsAcyclicSpace.perfect_fundamentalGroup {F : TopCat.{u}} (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) := sorry

/-- `isAcyclicSpace_point`: A one-point space is acyclic. -/
example : IsAcyclicSpace (TopCat.of PUnit.{u + 1}) := sorry

/-- `not_isAcyclicSpace_empty`: The empty space is not acyclic (H₀ = 0 ≠ ℤ in reduced homology convention: reduced H₋₁ ≠ 0). -/
example : ¬ IsAcyclicSpace (TopCat.of PEmpty.{u + 1}) := sorry

/-- `not_isAcyclicSpace_circle`: The circle is not acyclic: H₁(S¹; ℤ) = ℤ. -/
example : ¬ IsAcyclicSpace (TopCat.of (Circle)) := sorry

/-- `isAcyclicSpace_poincare_sphere_minus_point`: The Poincaré homology 3-sphere minus a point is acyclic but has nontrivial perfect π₁ ≅ the binary icosahedral group SL₂(F₅). -/
example : ∃ F : TopCat.{0}, IsAcyclicSpace F ∧ ∃ x : F, Nontrivial (FundamentalGroup F x) := sorry

/-- `isAcyclicSpace_contractible_compat`: IsAcyclicSpace F holds whenever ContractibleSpace F (Mathlib). -/
example (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := IsAcyclicSpace.of_contractible F

/-- A connected CW space is acyclic exactly under the stated perfectness and positive-homology conditions. -/
theorem IsAcyclicSpace.perfect_and_H2 {F : TopCat.{u}} [Topology.CWComplex (Set.univ : Set F)]
    (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) ∧
      IsZero (groupHomology (Rep.trivial (ULift.{u} ℤ) (FundamentalGroup F x) (ULift.{u} ℤ)) 2) := sorry

/-- every homotopy fibre is acyclic. -/
def IsAcyclicMap (f : X ⟶ Y) : Prop := ∀ y : Y, IsAcyclicSpace (homotopyFiber f y)

/-- π₁f is surjective for connected spaces. -/
theorem IsAcyclicMap.surjective_pi1 {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) := sorry

/-- Its kernel is perfect normal. -/
theorem IsAcyclicMap.ker_isPerfect {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Group.IsPerfect (FundamentalGroup.map f.hom x).ker ∧ (FundamentalGroup.map f.hom x).ker.Normal := sorry

/-- Composites remain acyclic. -/
theorem IsAcyclicMap.comp {f : X ⟶ Y} {g : Y ⟶ Z} (hf : IsAcyclicMap f) (hg : IsAcyclicMap g) :
    IsAcyclicMap (f ≫ g) := sorry


/-- `isAcyclicMap_id`: The identity map is acyclic. -/
example : IsAcyclicMap (𝟙 X) := sorry

/-- `isAcyclicMap_toPoint_iff`: X → point is acyclic iff X is acyclic. -/
example : IsAcyclicMap (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) ↔
    IsAcyclicSpace X := sorry

/-- `isAcyclicMap_homotopyEquiv`: The forward map of a homotopy equivalence is acyclic. -/
example (e : ContinuousMap.HomotopyEquiv X Y) : IsAcyclicMap (TopCat.ofHom e.toFun) := sorry

/-- `not_isAcyclicMap_point_into_acyclic`: A point→(Poincaré sphere minus a point) is an integral homology isomorphism, but fails π₁ surjectivity and its loop-space fibre is not acyclic. -/
example (F : TopCat.{u}) (hF : IsAcyclicSpace F) (x : F) (hx : Nontrivial (FundamentalGroup F x)) :
    ¬ IsAcyclicMap (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} x) : TopCat.of PUnit ⟶ F) := sorry

/-- An acyclic map induces a surjection on fundamental groups whose kernel is perfect. -/
theorem IsAcyclicMap.pi1_surjective_perfect_kernel {f : X ⟶ Y} (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) ∧ Group.IsPerfect (FundamentalGroup.map f.hom x).ker :=
  ⟨hf.surjective_pi1 x, (hf.ker_isPerfect x).1⟩


/-- (constant-coefficient shadow; see `IsAcyclicMap.iff_homology`). -/
theorem IsAcyclicMap.homology_criterion (f : X ⟶ Y) (hf : IsAcyclicMap f) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- Acyclic cancellation: for connected CW
complexes, if `g ∘ f` and `f` are acyclic then so is `g`. -/
theorem IsAcyclicMap.of_comp [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] [PathConnectedSpace X] {f : X ⟶ Y} {g : Y ⟶ Z}
    (hgf : IsAcyclicMap (f ≫ g)) (hf : IsAcyclicMap f) : IsAcyclicMap g := sorry

/-- An integral homology isomorphism of CW complexes onto a simply
connected space has acyclic homotopy fibres. -/
theorem IsAcyclicMap.of_homology_iso_of_simplyConnected [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] [SimplyConnectedSpace Y] (f : X ⟶ Y)
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    IsAcyclicMap f := sorry


/-- Acyclic f with ker(π₁f)=P. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- The perfect radical: the largest perfect subgroup. -/
def perfectRadical (G : Type u) [Group G] : Subgroup G :=
  ⨆ (H : Subgroup G) (_ : Group.IsPerfect H), H

/-- The induced quotient isomorphism π₁X/P≅π₁Y. -/
theorem IsPlusConstruction.pi1_quotient {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)} [P.Normal]
    (h : IsPlusConstruction f x P) :
    ∃ e : FundamentalGroup X x ⧸ P ≃* FundamentalGroup Y (f.hom x),
      ∀ g : FundamentalGroup X x, e (QuotientGroup.mk g) = FundamentalGroup.map f.hom x g := sorry

/-- Homology is preserved for every quotient local system. -/
theorem IsPlusConstruction.homology_iso {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (h : IsPlusConstruction f x P) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- `isPlusConstruction_trivial_iff`: f is a plus construction relative to the trivial subgroup iff f is a weak homotopy equivalence. -/
example (f : X ⟶ Y) (x : X) [PathConnectedSpace X] :
    IsPlusConstruction f x ⊥ ↔ IsWeakHomotopyEquivalence f := sorry

/-- `isPlusConstruction_acyclic_toPoint`: For X acyclic, X → point is a plus construction relative to π₁(X). -/
example (hX : IsAcyclicSpace X) (x : X) :
    IsPlusConstruction (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) x ⊤ := sorry

/-- `perfectRadical_perfect_group`: For a perfect group G, perfectRadical G = ⊤; for an abelian group it is ⊥. -/
example (G : Type u) [Group G] [Group.IsPerfect G] : perfectRadical G = ⊤ := sorry

/-- `not_isPlusConstruction_nonperfect`: No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect. -/
example (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) (hP : ¬ Group.IsPerfect P) :
    ¬ IsPlusConstruction f x P := sorry

/-- (Weibel IV Exercise 1.2(b)). -/
theorem IsAcyclicMap.isWeakHomotopyEquivalence_of_bijective_pi1 [PathConnectedSpace X] {f : X ⟶ Y}
    (hf : IsAcyclicMap f) (x : X) (h1 : Function.Bijective (FundamentalGroup.map f.hom x)) :
    IsWeakHomotopyEquivalence f := sorry

/-- Attach only 2- and 3-cells to kill P with acyclic inclusion. -/
def plusConstruction (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) : TopCat.{u} := sorry

namespace plusConstruction

/-- The subcomplex inclusion X→X⁺ₚ. -/
def incl (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) : X ⟶ plusConstruction X x P := sorry

/-- The inclusion satisfies IsPlusConstruction. -/
theorem isPlusConstruction (X : TopCat.{u}) (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] :
    IsPlusConstruction (incl X x P) x P := sorry

/-- The relative CW cells have dimensions 2 and 3. -/
@[instance_reducible]
def relCW (X : TopCat.{u}) [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] [Group.IsPerfect P] :
    Topology.RelCWComplex (Set.univ : Set (plusConstruction X x P)) (Set.range (incl X x P).hom) := sorry

/-- π₁X⁺ₚ≅π₁X/P. -/
def pi1Equiv (X : TopCat.{u}) [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] [Group.IsPerfect P] :
    FundamentalGroup (plusConstruction X x P) ((incl X x P).hom x) ≃* FundamentalGroup X x ⧸ P := sorry

end plusConstruction

/-- `plusConstruction_bot`: For P = ⊥, plusConstruction.incl X ⊥ is a homotopy equivalence. -/
example [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) :
    ∃ e : ContinuousMap.HomotopyEquiv X (plusConstruction X x ⊥),
    e.toFun = (plusConstruction.incl X x ⊥).hom := sorry

/-- `plusConstruction_acyclic_contractible`: If X is acyclic, plusConstruction X π₁(X) is contractible (Weibel IV Exercise 1.2(a)). -/
example [Topology.CWComplex (Set.univ : Set X)] (hX : IsAcyclicSpace X) (x : X) :
    ContractibleSpace (plusConstruction X x ⊤) := sorry

/-- `plusConstruction_perfect_group_simplyConnected`: For a perfect group G, plusConstruction (BG) ⊤ is simply connected with the same integral homology as BG, and π₂ ≅ H₂(G; ℤ) by Hurewicz (Tau Ceti AlgebraicTopology stage 8). -/
example (G : Type u) [Group G] [Group.IsPerfect G] :
    SimplyConnectedSpace (plusConstruction (Group.classifyingSpace G)
      (Group.classifyingSpace.basepoint G) ⊤) := sorry


/-- The kernel of the fundamental-group map of the plus inclusion is the chosen perfect normal subgroup. -/
theorem plusConstruction.ker_pi1 [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) : (FundamentalGroup.map (plusConstruction.incl X x P).hom x).ker = P ∧
      Function.Surjective (FundamentalGroup.map (plusConstruction.incl X x P).hom x) := sorry

/-- The plus inclusion is an isomorphism on homology for every local system from the quotient fundamental group. -/
theorem plusConstruction.homology_iso [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map (plusConstruction.incl X x P)) := sorry

/-- Every homotopy fibre of the plus inclusion is acyclic. -/
theorem plusConstruction.isAcyclicMap [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal]
    (hP : Group.IsPerfect P) : IsAcyclicMap (plusConstruction.incl X x P) := sorry

/-- `π₁` acts trivially on every `π_n`, `n ≥ 1`. -/
def IsAbelianSpace (X : TopCat.{u}) (x : X) : Prop :=
  PathConnectedSpace X ∧ ∀ (n : ℕ) (g : FundamentalGroup X x) (a : HomotopyGroup.Pi (n + 1) X x),
    (g • a) = a

/-- The condition is independent of basepoint. -/
theorem IsAbelianSpace.of_basepoint {x y : X} [PathConnectedSpace X] :
    IsAbelianSpace X x ↔ IsAbelianSpace X y := sorry

/-- Simply connected spaces are abelian. -/
theorem IsAbelianSpace.of_simplyConnected [SimplyConnectedSpace X] (x : X) : IsAbelianSpace X x := sorry

/-- Connected H-spaces are abelian. -/
theorem IsAbelianSpace.of_hSpace [HSpace X] [PathConnectedSpace X] (x : X) : IsAbelianSpace X x := sorry

/-- An abelian space has commutative π₁. -/
theorem IsAbelianSpace.commGroup_pi1 {x : X} (h : IsAbelianSpace X x) (g g' : FundamentalGroup X x) :
    g * g' = g' * g := sorry

/-- `isAbelianSpace_point`: A point is abelian. -/
example : IsAbelianSpace (TopCat.of PUnit.{u + 1}) PUnit.unit := sorry

/-- `isAbelianSpace_circle`: S¹ is abelian (π₁ = ℤ abelian, higher π vanish). -/
example : IsAbelianSpace (TopCat.of Circle) 1 := sorry

/-- `not_isAbelianSpace_rp2`: RP² is not abelian: π₁ = ℤ/2 acts by −1 on π₂ ≅ ℤ. -/
example : ∃ (X : TopCat.{0}) (x : X), Nonempty (FundamentalGroup X x ≃* Multiplicative (ZMod 2)) ∧
    ¬ IsAbelianSpace X x := sorry

/-- `isAbelianSpace_topologicalGroup`: A path-connected topological group, with Mathlib's IsTopologicalGroup.toHSpace, is abelian. -/
example (G : Type u) [TopologicalSpace G] [Group G] [IsTopologicalGroup G] [PathConnectedSpace G] :
    IsAbelianSpace (TopCat.of G) 1 := sorry

/-- A path-connected H-space has trivial fundamental-group action on every homotopy group. -/
theorem hSpace_isAbelianSpace (X : TopCat.{u}) [HSpace X] [PathConnectedSpace X] :
    IsAbelianSpace X HSpace.e := IsAbelianSpace.of_hSpace _

/-- The CW model K(A,n), n≥1. -/
def EilenbergMacLaneSpace (A : Type u) [AddCommGroup A] (n : ℕ) : TopCat.{u} := sorry

namespace EilenbergMacLaneSpace

/-- The constructed K(A,n) has a distinguished basepoint. -/
def basepoint (A : Type u) [AddCommGroup A] (n : ℕ) : EilenbergMacLaneSpace A n := sorry

/-- πₙ≅A; other positive π-groups vanish. -/
def homotopyGroupEquiv (A : Type u) [AddCommGroup A] (n : ℕ) :
    HomotopyGroup.Pi (n + 1) (EilenbergMacLaneSpace A (n + 1)) (basepoint A (n + 1)) ≃*
      Multiplicative A := sorry

/-- A CW space with these groups is homotopy equivalent to this model. -/
theorem homotopyEquivOfPi (A : Type u) [AddCommGroup A] (n : ℕ) (Y : TopCat.{u}) (y : Y)
    [Topology.CWComplex (Set.univ : Set Y)] [PathConnectedSpace Y]
    (h₁ : Nonempty (HomotopyGroup.Pi (n + 1) Y y ≃* Multiplicative A))
    (h₂ : ∀ i, i ≠ n + 1 → i ≠ 0 → Subsingleton (HomotopyGroup.Pi i Y y)) :
    Nonempty (ContinuousMap.HomotopyEquiv Y (EilenbergMacLaneSpace A (n + 1))) := sorry

/-- A selected representative map inducing the given homomorphism in degree n+1. -/
def map (A B : Type u) [AddCommGroup A] [AddCommGroup B] (n : ℕ) :
    (A →+ B) → C(EilenbergMacLaneSpace A (n + 1), EilenbergMacLaneSpace B (n + 1)) := sorry

/-- For n=1, identify the existing Tau Ceti K(A,1) predicate. -/
theorem isEilenbergMacLaneSpaceOne (A : Type u) [AddCommGroup A] :
    Existing.IsKOne (Multiplicative A) (EilenbergMacLaneSpace A 1) (basepoint A 1) := sorry

end EilenbergMacLaneSpace

/-- `eilenbergMacLaneSpace_trivial`: EilenbergMacLaneSpace 0 n is contractible. -/
example (n : ℕ) : ContractibleSpace (EilenbergMacLaneSpace (PUnit.{u + 1}) n) := sorry

/-- `eilenbergMacLaneSpace_Z_one`: EilenbergMacLaneSpace ℤ 1 is homotopy equivalent to the circle. -/
example : Nonempty (ContinuousMap.HomotopyEquiv (EilenbergMacLaneSpace ℤ 1) Circle) := sorry

/-- `eilenbergMacLaneSpace_one_compat`: EilenbergMacLaneSpace A 1 is homotopy equivalent to Group.classifyingSpace A. -/
example (A : Type u) [AddCommGroup A] :
    Nonempty (ContinuousMap.HomotopyEquiv (EilenbergMacLaneSpace A 1)
      (Group.classifyingSpace (Multiplicative A))) := sorry

/-- `eilenbergMacLaneSpace_not_moore`: H₃(EilenbergMacLaneSpace (ℤ/2) 1; ℤ) ≅ H₃(RP^∞; ℤ) ≅ ℤ/2 ≠ 0, whereas the Moore space RP² = M(ℤ/2, 1) has H₃ = 0, so K(ℤ/2, 1) is not the Moore space. -/
example : ¬ IsZero (Existing.singH ℤ 3 (EilenbergMacLaneSpace (ZMod 2) 1)) := sorry


/-- , existence part only (Hatcher Example 4.16): maps `X → X_n`
inducing isomorphisms on `π_i`, `i ≤ n`, with `π_i(X_n) = 0` for `i > n`. Principality is not stated here:
the k-invariant needs `EilenbergMacLaneSpace` of `π_n X` with its group structure. -/
theorem postnikovSectionExists [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) (n : ℕ) :
    ∃ (Xn : TopCat.{u}) (p : X ⟶ Xn), (∀ i ≤ n, Function.Bijective (Existing.piMap i p.hom x)) ∧
      ∀ i > n, Subsingleton (HomotopyGroup.Pi i Xn (p.hom x)) := sorry


/-- (Hatcher 4.73), with the cohomological hypothesis replaced by
the sufficient hypothesis that the pair is acyclic (`H_*(W, A; ℤ) = 0`, so all obstruction groups vanish
by universal coefficients); this covers the retraction in `abelianHomologyWhitehead` and the extensions
in `IsPlusConstruction.lift`. -/
theorem abelianExtension_of_homologyIso [Topology.CWComplex (Set.univ : Set X)] (x : X) (hX : IsAbelianSpace X x)
    {A W : TopCat.{u}} [Topology.CWComplex (Set.univ : Set A)] (i : A ⟶ W)
    (hi_emb : Topology.IsClosedEmbedding i.hom)
    [Topology.RelCWComplex (Set.univ : Set W) (Set.range i.hom)]
    (hi : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map i))
    (g : A ⟶ X) : ∃ G : W ⟶ X, i ≫ G = g := sorry

/-- (Hatcher 4.74). -/
theorem abelianHomologyWhitehead [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] (x : X) (hX : IsAbelianSpace X x) (f : X ⟶ Y)
    (hY : IsAbelianSpace Y (f.hom x))
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- (Weibel IV Exercise 1.3). -/
theorem hSpaceHomologyWhitehead [HSpace X] [HSpace Y] [PathConnectedSpace X] [PathConnectedSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] (f : X ⟶ Y)
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- (abelian targets). -/
theorem IsPlusConstruction.lift_to_abelian [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (g : X ⟶ Z) (hZ : IsAbelianSpace Z (g.hom x))
    (hg : P ≤ (FundamentalGroup.map g.hom x).ker) :
    ∃ h : Y ⟶ Z, ContinuousMap.Homotopic (f ≫ h).hom g.hom ∧
      ∀ h' : Y ⟶ Z, ContinuousMap.Homotopic (f ≫ h').hom g.hom → ContinuousMap.Homotopic h.hom h'.hom := sorry

/-- For an abelian CW target, two lifts through a plus map agreeing on the source are homotopic. -/
theorem IsPlusConstruction.unique_of_abelian [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] {f : X ⟶ Y} {f' : X ⟶ Z} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' x P) (hZ : IsAbelianSpace Z (f'.hom x)) :
    ∃ e : ContinuousMap.HomotopyEquiv Y Z, ContinuousMap.Homotopic (e.toFun.comp f.hom) f'.hom := sorry

/-- A map preserving the perfect subgroups induces a map between plus spaces when the target plus space is abelian. -/
theorem IsPlusConstruction.map_to_abelian {X' Y' : TopCat.{u}} [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] [Topology.CWComplex (Set.univ : Set Y')]
    (φ : X ⟶ X') {f : X ⟶ Y} {f' : X' ⟶ Y'} {x : X}
    {P : Subgroup (FundamentalGroup X x)} {P' : Subgroup (FundamentalGroup X' (φ.hom x))}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' (φ.hom x) P')
    (hφ : P.map (FundamentalGroup.map φ.hom x) ≤ P') (hY' : IsAbelianSpace Y' (f'.hom (φ.hom x))) :
    ∃ φp : Y ⟶ Y', ContinuousMap.Homotopic (f ≫ φp).hom (φ ≫ f').hom := sorry

/-- (Weibel IV Theorem 1.8 and Remark 1.8.1). -/
theorem IsPlusConstruction.recognition_hSpace {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (H : TopCat.{u}) [HSpace H] [PathConnectedSpace H] (hY : IsAbelianSpace Y (f.hom x))
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set H)] (g : X ⟶ H)
    (hg : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map g)) :
    IsAcyclicMap g ∧ ∃ e : ContinuousMap.HomotopyEquiv Y H, ContinuousMap.Homotopic (e.toFun.comp f.hom) g.hom := sorry

/-- The perfect normal subgroup of `G` is transported along the actual `π₁(BG) ≃* G`.
The induced quotient identification is part of .
It retains `G/P` when `P` is proper; it does not assert that every such plus space is simply connected. -/
def plusConstruction.groupPi1Equiv (G : Type u) [Group G] (P : Subgroup G)
    [P.Normal] [Group.IsPerfect P] :
    let x := Group.classifyingSpace.basepoint G
    let Q := P.comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    FundamentalGroup (plusConstruction (Group.classifyingSpace G) x Q)
      ((plusConstruction.incl _ x Q).hom x) ≃* G ⧸ P := sorry

/-- The quotient map on fundamental groups is the map induced by the plus inclusion. -/
theorem plusConstruction.groupPi1Equiv_incl (G : Type u) [Group G] (P : Subgroup G)
    [P.Normal] [Group.IsPerfect P]
    (g : FundamentalGroup (Group.classifyingSpace G) (Group.classifyingSpace.basepoint G)) :
    let x := Group.classifyingSpace.basepoint G
    let Q := P.comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    plusConstruction.groupPi1Equiv G P
      (FundamentalGroup.map (plusConstruction.incl _ x Q).hom x g) =
        QuotientGroup.mk ((Group.classifyingSpace.fundamentalGroupMulEquiv G) g) := sorry

/-- `π₂(BG⁺_P) ≃* H₂(P; ℤ)` for every perfect
normal subgroup `P` of `G`. The lifted integral coefficient ring matches the universe of `P`.
Recognition and the kernel comparison come from the classical UCE supplier; this signature
does not assume the unresolved unrestricted-target plus uniqueness theorem. -/
def plusConstruction.pi2Equiv (G : Type u) [Group G] (P : Subgroup G)
    [P.Normal] [Group.IsPerfect P] :
    let x := Group.classifyingSpace.basepoint G
    let Q := P.comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    HomotopyGroup.Pi 2 (plusConstruction (Group.classifyingSpace G) x Q)
      ((plusConstruction.incl _ x Q).hom x) ≃*
        Multiplicative (groupHomology (Rep.trivial (ULift.{u} ℤ) P (ULift.{u} ℤ)) 2) := sorry

/-- Killing the entire perfect fundamental group identifies π₂ of the simply connected plus space with H₂ of the source. -/
theorem plusConstruction.pi2_eq_H2 (G : Type u) [Group G] (P : Subgroup G)
    [P.Normal] [Group.IsPerfect P] :
    let x := Group.classifyingSpace.basepoint G
    let Q := P.comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    Nonempty (HomotopyGroup.Pi 2 (plusConstruction (Group.classifyingSpace G) x Q)
      ((plusConstruction.incl _ x Q).hom x) ≃*
        Multiplicative (groupHomology (Rep.trivial (ULift.{u} ℤ) P (ULift.{u} ℤ)) 2)) :=
  ⟨plusConstruction.pi2Equiv G P⟩

/-- The fibre's projection is a universal central extension of the specified subgroup.
The explicit universal property is the conclusion imported from K2SymbolsBrauer T.1;
it is not a second definition of central extensions. The supplier's requested universe
extension remains necessary to prove this for arbitrary `u`. -/
theorem plusConstruction.fiber_universalCentralExtension (G : Type u) [Group G]
    (P : Subgroup G) [P.Normal] [Group.IsPerfect P] :
    let x := Group.classifyingSpace.basepoint G
    let Q := P.comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    let f := plusConstruction.incl (Group.classifyingSpace G) x Q
    let F := homotopyFiber f (f.hom x)
    let z := homotopyFiber.basepoint f x
    let π : FundamentalGroup F z →* G :=
      (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom.comp
        (FundamentalGroup.map (homotopyFiber.proj f (f.hom x)).hom z)
    ∃ p : FundamentalGroup F z →* P,
      P.subtype.comp p = π ∧ Function.Surjective p ∧
      p.ker ≤ Subgroup.center (FundamentalGroup F z) ∧
      ∀ (Y : Type u) [Group Y] (q : Y →* P),
        Function.Surjective q → q.ker ≤ Subgroup.center Y →
          ∃! h : FundamentalGroup F z →* Y, q.comp h = p := sorry

/-- Proper-subgroup check: killing the trivial perfect subgroup does not kill `G`.
In particular this applies to nonperfect groups such as ℤ/2, whose π₁ is retained. -/
example (G : Type u) [Group G] :
    let x := Group.classifyingSpace.basepoint G
    let Q := (⊥ : Subgroup G).comap (Group.classifyingSpace.fundamentalGroupMulEquiv G).toMonoidHom
    Nonempty (FundamentalGroup (plusConstruction (Group.classifyingSpace G) x Q)
      ((plusConstruction.incl _ x Q).hom x) ≃* G) ∧
      Subsingleton (HomotopyGroup.Pi 2 (plusConstruction (Group.classifyingSpace G) x Q)
        ((plusConstruction.incl _ x Q).hom x)) := sorry

/-- The original perfect-group case remains a useful special case. -/
theorem plusConstruction.pi2_eq_H2_perfect (G : Type u) [Group G] [Group.IsPerfect G] :
    Nonempty (HomotopyGroup.Pi 2 (plusConstruction (Group.classifyingSpace G)
      (Group.classifyingSpace.basepoint G) ⊤)
      ((plusConstruction.incl _ _ ⊤).hom (Group.classifyingSpace.basepoint G)) ≃*
        Multiplicative (groupHomology (Rep.trivial (ULift.{u} ℤ) G (ULift.{u} ℤ)) 2)) := sorry


/-- (class of finitely generated groups, simply connected base; Hatcher
SSAT Lemma 1.9, case 1). -/
theorem serreClass_fibration_finite {F E B : TopCat.{u}} (i : F ⟶ E) (p : E ⟶ B) (b : B)
    (h : IsHomotopyFiberSequence i p b) [PathConnectedSpace F] [PathConnectedSpace E]
    [SimplyConnectedSpace B]
    (hF : ∀ n, Module.Finite (ULift.{u} ℤ) (Existing.singH (ULift.{u} ℤ) (n + 1) F))
    (hB : ∀ n, Module.Finite (ULift.{u} ℤ) (Existing.singH (ULift.{u} ℤ) (n + 1) B)) :
    ∀ n, Module.Finite (ULift.{u} ℤ) (Existing.singH (ULift.{u} ℤ) (n + 1) E) := sorry

/-- (class of finitely generated groups; Hatcher SSAT Lemma 1.10). -/
theorem serreClass_eilenbergMacLane_finite (A : Type u) [AddCommGroup A] [AddGroup.FG A] (n k : ℕ) :
    Module.Finite (ULift.{u} ℤ) (Existing.singH (ULift.{u} ℤ) (k + 1) (EilenbergMacLaneSpace A (n + 1))) := sorry

/-- (class of finitely generated groups). -/
theorem serreClass_finitelyGenerated (x : X) (hX : IsAbelianSpace X x) :
    (∀ n, Group.FG (HomotopyGroup.Pi (n + 1) X x)) ↔
      ∀ n, Module.Finite (ULift.{u} ℤ) (Existing.singH (ULift.{u} ℤ) (n + 1) X) := sorry


end TauCeti

/-! ## Layer 4: Homotopy group completion -/

namespace CategoryTheory

open MonoidalCategory

variable (S : Type u) [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]

/-- Translations are faithful (Weibel IV 4.2.1): `Aut s → Aut (s ⊗ t)`, `g ↦ g ▷ t`, is injective. -/
def FaithfulTranslations : Prop :=
  ∀ s t : S, Function.Injective (fun g : s ≅ s => whiskerRightIso g t)

/-- Transport the full tensor coherence to Core S. -/
@[instance_reducible]
def Core.monoidalCategory (T : Type u) [Category.{u} T] [MonoidalCategory T] :
    MonoidalCategory (Core T) := sorry

/-- Transport the symmetry to Core S. -/
@[instance_reducible]
def Core.symmetricCategory (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    letI := Core.monoidalCategory T; SymmetricCategory (Core T) := sorry

/-- Core S→S is strict braided monoidal. -/
theorem Core.inclusion_monoidal (T : Type u) [Category.{u} T] [MonoidalCategory T] :
    letI := Core.monoidalCategory T
    Nonempty (Core.inclusion T).Monoidal := sorry

/-- F.core is strong braided monoidal; inclusion and core-composition comparisons are monoidal. -/
@[instance_reducible]
def Core.mapMonoidal {T T' : Type u} [Category.{u} T] [Category.{u} T'] [MonoidalCategory T]
    [MonoidalCategory T'] (F : T ⥤ T') [F.Monoidal] :
    letI := Core.monoidalCategory T; letI := Core.monoidalCategory T'; F.core.Monoidal := sorry

/-- The commutative monoid of isomorphism classes under `⊗`: Mathlib's `Skeleton T` with
`Skeleton.instCommMonoid` (isomorphism classes of `Core T` are those of `T`). -/
abbrev Core.isoClassesMonoid (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    Type u := Skeleton T


/-- `core_of_groupoid`: If S is already a groupoid, Core S ≌ S as symmetric monoidal categories. -/
example : Nonempty (Core S ≌ S) := sorry


/-- objects are pairs `(m, n)`. -/
def SInvS : Type u := S × S

/-- The categorical or algebraic structure specified by `Category.{u} (SInvS S)`. -/
instance : Category.{u} (SInvS S) := sorry

namespace SInvS

/-- The strong braided monoidal inclusion s↦(s,1). -/
def incl : S ⥤ SInvS S := sorry

/-- The inclusion uses the positive coordinate and the unit in the negative coordinate. -/
theorem incl_obj (x : S) : (incl S).obj x = (x, MonoidalCategoryStruct.tensorUnit (C := S)) := sorry

/-- The componentwise tensor and its symmetry. -/
@[instance_reducible]
def monoidal : MonoidalCategory (SInvS S) := sorry

/-- A strong braided monoidal F induces S⁻¹F, preserving id/composition up to coherent isomorphism. -/
def map {T : Type u} [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T)
    [F.Braided] : SInvS S ⥤ SInvS T := sorry

/-- The K-theory space `K(S) = B(S⁻¹S)`. -/
def kSpace : TopCat.{u} := classifyingSpace (SInvS S)

/-- π₀K(S)≅GrothendieckGroup(Skeleton S), with (a,b)↦[a]−[b]. -/
def pi0Equiv : ZerothHomotopy (kSpace S) ≃ Algebra.GrothendieckGroup (Core.isoClassesMonoid S) := sorry

/-- `pi0Equiv` is the canonical map: the component of `(m, n)` goes to `[m] - [n]` (Weibel IV 4.3.1). -/
theorem pi0Equiv_vertex (m n : S) :
    pi0Equiv S (ZerothHomotopy.mk (classifyingSpace_vertex (C := SInvS S) (m, n))) =
      Algebra.GrothendieckGroup.of (toSkeleton m) / Algebra.GrothendieckGroup.of (toSkeleton n) := sorry

/-- Swapping coordinates induces the homotopy inverse. -/
def swap : SInvS S ⥤ SInvS S := sorry

end SInvS

/-- `SInvS_pic_K0`: For S = Pic(R) (R commutative), π₀ kSpace S ≅ Pic(R), π₁ ≅ Rˣ and π_n = 0 for n ≥ 2. -/
example [∀ X : S, Nonempty (Σ Y : S, X ⊗ Y ≅ 𝟙_ S)] :
    Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃ Core.isoClassesMonoid S) ∧
      ∀ (n : ℕ) (x : SInvS.kSpace S), 2 ≤ n → Subsingleton (HomotopyGroup.Pi n (SInvS.kSpace S) x) := sorry

/-- `SInvS_trivial`: For the trivial symmetric monoidal groupoid (one object, one morphism), kSpace is contractible. -/
example [Subsingleton S] [∀ X Y : S, Subsingleton (X ⟶ Y)] : ContractibleSpace (SInvS.kSpace S) := sorry

/-- `SInvS_pi0_compat`: For S = Core of an additive category A with ⊞, π₀ kSpace S ≅ TauCeti.SplitK0 A, compatibly with the classes of objects. -/
example : Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃
    Algebra.GrothendieckGroup (Core.isoClassesMonoid S)) := ⟨SInvS.pi0Equiv S⟩


/-- `SInvS_not_all_maps`: Using the category P(R) of all maps instead of iso P(R) gives a contractible classifying space (0 is initial), not K(R). -/
example (A : Type u) [Category.{u} A] [HasInitial A] : ContractibleSpace (classifyingSpace A) :=
  classifyingSpace_contractible_of_hasInitial

/-- A monoidal category acts through a functor with associativity and unit isomorphisms satisfying the action coherence equations. -/
structure MonoidalAction (X : Type u) [Category.{u} X] where
  /-- Mathlib's coherent left action: natural associativity and unit isomorphisms with their
  coherence conditions (Weibel IV Definition 4.7). -/
  toLeftAction : MonoidalLeftAction S X

/-- The diagonal action `s ⊙ (t, x) = (s ⊗ t, s ⊙ x)` of `S` on `S × X` (uses the symmetry). -/
def MonoidalAction.diag {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    MonoidalAction S (S × X) := sorry

/-- Objects x; translation morphisms represented by s⊙x→y. -/
def MonoidalActionCategory {X : Type u} [Category.{u} X] (_a : MonoidalAction S X) : Type u := X

/-- The categorical or algebraic structure specified by `Type u} [Category.{u} X] (a : MonoidalAction S X) : Category.{u} (MonoidalActionCategory S a)`. -/
instance {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    Category.{u} (MonoidalActionCategory S a) := sorry

namespace MonoidalActionCategory

/-- Tensor product defines the regular action of S on itself. -/
def regular : MonoidalAction S S := sorry

/-- S⁻¹X=⟨S,S×X⟩ for the diagonal action. -/
def loc {X : Type u} [Category.{u} X] (a : MonoidalAction S X) : Type u :=
  MonoidalActionCategory S a.diag

/-- The categorical or algebraic structure specified by `Type u} [Category.{u} X] (a : MonoidalAction S X) : Category.{u} (loc S a)`. -/
instance {X : Type u} [Category.{u} X] (a : MonoidalAction S X) : Category.{u} (loc S a) := sorry

/-- The projection (s,x)↦s into ⟨S,S⟩. -/
def proj {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    loc S a ⥤ MonoidalActionCategory S (regular S) := sorry

/-- Translations x↦(s,x), with the unit case as inclusion. -/
def incl {X : Type u} [Category.{u} X] (a : MonoidalAction S X) (s : S) : X ⥤ loc S a := sorry

/-- For a groupoid S, the unit is initial in ⟨S,S⟩, so its classifying space is contractible. -/
theorem contractible_self : ContractibleSpace (classifyingSpace (MonoidalActionCategory S (regular S))) := sorry

end MonoidalActionCategory

/-- `actionCategory_trivial_action`: For the trivial monoidal category acting on X, ⟨S, X⟩ ≌ X. -/
example (X : Type u) [Category.{u} X] [Subsingleton S] [∀ X Y : S, Subsingleton (X ⟶ Y)]
    (a : MonoidalAction S X) : Nonempty (MonoidalActionCategory S a ≌ X) := sorry


/-- `actionCategory_not_X`: For S = ℕ acting on itself by addition, ⟨S, S⟩ is the poset ℕ (contractible), not the discrete category ℕ. -/
example : ContractibleSpace (classifyingSpace (MonoidalActionCategory S (MonoidalActionCategory.regular S))) :=
  MonoidalActionCategory.contractible_self S

/-- Components of the localisation classifying space identify with the Grothendieck group of tensor isomorphism classes. -/
theorem SInvS.pi0_grothendieck : Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃
    Algebra.GrothendieckGroup (Core.isoClassesMonoid S)) := ⟨SInvS.pi0Equiv S⟩

/-- The multiplication on BS comes from B(⊗) and the product comparison, with associative/commutative/unit homotopies. -/
@[instance_reducible]
def classifyingSpace.hSpace [Countable S] [∀ X Y : S, Countable (X ⟶ Y)] :
    HSpace (classifyingSpace S) :=
  let _tensor : S → S → S := fun X Y => X ⊗ Y
  sorry

/-- (existence form). -/
theorem classifyingSpace_hSpace [Countable S] [∀ X Y : S, Countable (X ⟶ Y)] :
    Nonempty (HSpace (classifyingSpace S)) := sorry

/-- The action-category projection is cofibred, with tensor translations as cobase-change functors. -/
theorem MonoidalActionCategory.proj_isCofibred {X : Type u} [Category.{u} X] (a : MonoidalAction S X)
    (hS : FaithfulTranslations S) : (MonoidalActionCategory.proj S a).op.IsFibered := sorry

/-- Tensor translations becoming weakly invertible make the action-category inclusion a homotopy equivalence. -/
theorem MonoidalActionCategory.incl_homotopyEquiv {X : Type u} [Category.{u} X] (a : MonoidalAction S X)
    (hS : FaithfulTranslations S)
    (hinv : ∀ t : S, ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace X) (classifyingSpace X),
      e.toFun = (classifyingSpaceMap (letI := a.toLeftAction; MonoidalLeftAction.actionLeft X t)).hom)
    (s : S) : ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace X) (classifyingSpace (MonoidalActionCategory.loc S a)),
      e.toFun = (classifyingSpaceMap (MonoidalActionCategory.incl S a s)).hom := sorry


/-- The induced localisation map is a homotopy equivalence under the stated homotopy-cofinality hypothesis. -/
theorem SInvS.map_homotopyEquiv {T : Type u} [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T]
    (F : S ⥤ T) [F.Braided] [F.IsEquivalence] :
    ∃ e : ContinuousMap.HomotopyEquiv (SInvS.kSpace S) (SInvS.kSpace T),
      e.toFun = (classifyingSpaceMap (SInvS.map S F)).hom := sorry

end CategoryTheory

namespace TauCeti

open CategoryTheory MonoidalCategory

/-- Homotopy associativity of an H-space multiplication. -/
def IsHomotopyAssocHSpace (X : TopCat.{u}) [HSpace X] : Prop :=
  ContinuousMap.Homotopic ((HSpace.hmul (X := X)).comp ((HSpace.hmul (X := X)).prodMap (ContinuousMap.id X)))
    (((HSpace.hmul (X := X)).comp ((ContinuousMap.id X).prodMap (HSpace.hmul (X := X)))).comp
      (⟨Homeomorph.prodAssoc X X X, (Homeomorph.prodAssoc X X X).continuous⟩ : C((X × X) × X, X × X × X)))

/-- Homotopy commutativity of the H-space multiplication. -/
def IsHomotopyCommHSpace (X : TopCat.{u}) [HSpace X] : Prop :=
  ContinuousMap.Homotopic (HSpace.hmul (X := X))
    ((HSpace.hmul (X := X)).comp
      (⟨Homeomorph.prodComm X X, (Homeomorph.prodComm X X).continuous⟩ : C(X × X, X × X)))

/-- The degree-`n` part `(π₀ X)⁻¹ H_n(X; k)` of the localisation of the Pontryagin ring `H_*(X; k)`
at the image of `π₀ X` (a construction of this node). -/
def pontryaginLocalization (X : TopCat.{u}) [HSpace X] (k : Type u) [CommRing k] (n : ℕ) : Type u :=
  sorry

/-- The map `(π₀ X)⁻¹ H_n(X; k) → H_n(Y; k)` induced by an H-map `f`. -/
def pontryaginLocalizationMap {X Y : TopCat.{u}} [HSpace X] [HSpace Y] (f : X ⟶ Y) (k : Type u)
    [CommRing k] (n : ℕ) : pontryaginLocalization X k n → Existing.singH k n Y := sorry

/-- The canonical map to the component localisation of Pontryagin homology. -/
def pontryaginLocalization.of (X : TopCat.{u}) [HSpace X] (k : Type u) [CommRing k]
    (n : ℕ) : Existing.singH k n X → pontryaginLocalization X k n := sorry

/-- The localisation comparison extends the actual induced homology map. -/
theorem pontryaginLocalizationMap_of {X Y : TopCat.{u}} [HSpace X] [HSpace Y]
    (f : X ⟶ Y) (k : Type u) [CommRing k] (n : ℕ) (x : Existing.singH k n X) :
    pontryaginLocalizationMap f k n (pontryaginLocalization.of X k n x) =
      (Existing.singHMap k n f).hom x := sorry

/-- an `H`-map inducing the group completion on `π₀` (stated through
`Joined`: `π₀ Y` is a group, every class is a difference of classes from `X`, and two classes of
`X` become equal iff they agree after adding a third) and the localisation of the Pontryagin ring
on homology. -/
def IsGroupCompletion {X Y : TopCat.{u}} [HSpace X] [HSpace Y] (f : X ⟶ Y) : Prop :=
  IsHomotopyAssocHSpace X ∧ IsHomotopyCommHSpace X ∧
  IsHomotopyAssocHSpace Y ∧ IsHomotopyCommHSpace Y ∧
  ContinuousMap.Homotopic (f.hom.comp HSpace.hmul)
      (HSpace.hmul.comp ((f.hom.prodMap f.hom))) ∧
    (∀ y : Y, ∃ y' : Y, Joined (HSpace.hmul (y, y')) HSpace.e) ∧
    (∀ y : Y, ∃ a b : X, Joined (HSpace.hmul (y, f.hom b)) (f.hom a)) ∧
    (∀ a b : X, Joined (f.hom a) (f.hom b) ↔
      ∃ c : X, Joined (HSpace.hmul (a, c)) (HSpace.hmul (b, c))) ∧
    ∀ (k : Type u) [CommRing k] (n : ℕ), Function.Bijective (pontryaginLocalizationMap f k n)


/-- In each degree, the induced homology map identifies the target with localisation by source components. -/
theorem IsGroupCompletion.homologyLocalization_degreewise {X Y : TopCat.{u}} [HSpace X] [HSpace Y] {f : X ⟶ Y}
    (hf : IsGroupCompletion f) (k : Type u) [CommRing k] (n : ℕ) :
    Function.Bijective (pontryaginLocalizationMap f k n) := hf.2.2.2.2.2.2.2.2 k n

/-- For grouplike X, id is a group completion. -/
theorem IsGroupCompletion.of_groupLike (X : TopCat.{u}) [HSpace X]
    (hX : ∀ x : X, ∃ x' : X, Joined (HSpace.hmul (x, x')) HSpace.e)
    (hassoc : IsHomotopyAssocHSpace X) (hcomm : IsHomotopyCommHSpace X) : IsGroupCompletion (𝟙 X) := sorry

/-- The fundamental group of the target unit component of a group completion is commutative. -/
theorem IsGroupCompletion.basepointComponent_pi1_comm {X Y : TopCat.{u}} [HSpace X] [HSpace Y] {f : X ⟶ Y}
    (hf : IsGroupCompletion f) (g g' : FundamentalGroup Y (HSpace.e : Y)) : g * g' = g' * g := sorry

/-- `isGroupCompletion_id_groupLike`: For a homotopy-commutative group-like H-space G (for example an abelian topological group), the identity of G is a group completion. -/
example (G : Type u) [TopologicalSpace G] [CommGroup G] [IsTopologicalGroup G] :
    letI : HSpace (TopCat.of G) := IsTopologicalGroup.toHSpace G
    IsGroupCompletion (𝟙 (TopCat.of G)) := sorry


/-- A group completion between CW H-spaces is a homotopy equivalence if the source is already group-like. -/
theorem IsGroupCompletion.homotopyEquiv_of_groupLike {X Y : TopCat.{u}} [HSpace X] [HSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] {f : X ⟶ Y}
    (hassocX : IsHomotopyAssocHSpace X) (hassocY : IsHomotopyAssocHSpace Y)
    (hf : IsGroupCompletion f) (hX : IsGroupCompletion (𝟙 X)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- Countable CW group-completion targets are homotopy equivalent compatibly with their completion maps. -/
theorem IsGroupCompletion.unique_of_countable {X Y Y' : TopCat.{u}} [HSpace X] [HSpace Y] [HSpace Y']
    [Topology.CWComplex (Set.univ : Set Y)] [Topology.CWComplex (Set.univ : Set Y')]
    [Countable (ZerothHomotopy X)] {f : X ⟶ Y} {f' : X ⟶ Y'} (hf : IsGroupCompletion f)
    (hf' : IsGroupCompletion f') : Nonempty (ContinuousMap.HomotopyEquiv Y Y') := sorry


/-- A homotopy-cofinal symmetric monoidal inclusion induces a homotopy equivalence of K-spaces. -/
theorem cofinality {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Braided]
    (hS : FaithfulTranslations S) (hT : FaithfulTranslations T)
    (hcof : ∀ t : T, ∃ (t' : T) (s : S), Nonempty (t ⊗ t' ≅ F.obj s))
    (haut : ∀ s : S, Function.Bijective (fun g : Aut s => F.mapIso g)) (n : ℕ) (x : SInvS.kSpace S) :
    Function.Bijective (Existing.piMap (n + 1) (classifyingSpaceMap (SInvS.map S F)).hom x) := sorry


/-- the groupoid `F(R)` of based free modules `Rⁿ` (objects `ℕ`,
automorphisms `GLₙ(R)`, no maps between different ranks), strict symmetric monoidal under block sum. -/
structure BasedFree (R : Type u) : Type u where
  /-- The rank `n` of the based free module `Rⁿ`. -/
  n : ℕ

/-- The groupoid structure of `F(R)`: `Hom(m, n)` is `GLₙ(R)` if `m = n`, empty otherwise. -/
instance (R : Type u) [Ring R] : Groupoid.{u} (BasedFree R) := sorry

/-- Block sum `m □ n = m + n`, `g □ h = fromBlocks g 0 0 h` (reindexed by `finSumFinEquiv`). -/
instance (R : Type u) [Ring R] : MonoidalCategory (BasedFree R) := sorry

/-- The symmetry is the block-exchange permutation matrix. -/
instance (R : Type u) [Ring R] : SymmetricCategory (BasedFree R) := sorry

/-- `TauCeti.BasedFree.autEquiv`: `Aut(Rⁿ) ≃* GLₙ(R)ᵐᵒᵖ` (Mathlib's `Aut` multiplies in the
composition-reversed order). -/
def BasedFree.autEquiv (R : Type u) [Ring R] (n : ℕ) :
    Aut (⟨n⟩ : BasedFree R) ≃* (Matrix.GeneralLinearGroup (Fin n) R)ᵐᵒᵖ := sorry

/-- `TauCeti.BasedFree.toModuleCore`: `n ↦ Fin n → R`, `g ↦ vecMulLinear g`, landing in the finitely generated
projective modules; strong symmetric monoidal for `⊕` (not stated: `ModuleCat` carries `⊗` as its
monoidal instance). -/
def BasedFree.toModuleCore (R : Type u) [Ring R] : BasedFree R ⥤ Core (ModuleCat.{u} R) := sorry

/-- `TauCeti.BasedFree.map`: a ring hom induces a strict symmetric monoidal functor (entrywise). -/
def BasedFree.map {R R' : Type u} [Ring R] [Ring R'] (φ : R →+* R') : BasedFree R ⥤ BasedFree R' := sorry

/-- `TauCeti.BasedFree.faithfulTranslations`: `g ↦ g ⊕ 1` is injective. -/
theorem BasedFree.faithfulTranslations (R : Type u) [Ring R] : FaithfulTranslations (BasedFree R) := sorry

/-- `TauCeti.BasedFree.cofinal`: every finitely generated projective module is a summand of some `Rⁿ`. -/
theorem BasedFree.cofinal (R : Type u) [Ring R] (P : ModuleCat.{u} R) [Module.Finite R P]
    [Module.Projective R P] : ∃ (Q : ModuleCat.{u} R) (n : ℕ), Nonempty (P ⊞ Q ≅ ModuleCat.of R (Fin n → R)) :=
  sorry

/-- `faithfulTranslations_basedFree`: F(R) has faithful translations: g ↦ g ⊕ 1 is injective on GL_n(R). -/
example (R : Type u) [Ring R] : FaithfulTranslations (BasedFree R) := BasedFree.faithfulTranslations R

/-- `basedFree_isoClasses`: Skeleton (BasedFree R) ≃* Multiplicative ℕ for every ring R, including the zero ring. -/
example (R : Type u) [Ring R] : Nonempty (Skeleton (BasedFree R) ≃* Multiplicative ℕ) := sorry

/-- `basedFree_braiding_swap`: For R = ℤ the symmetry c_{1,1} is the matrix !![0, 1; 1, 0] ≠ 1. -/
example : (β_ (⟨1⟩ : BasedFree ℤ) ⟨1⟩).hom ≠ 𝟙 _ := sorry

/-- `basedFree_toProj_not_injective`: For R with R ≅ R² (e.g. End of a countably infinite-dimensional vector space) toProj.obj 1 ≅ toProj.obj 2 although 1 and 2 are not isomorphic in BasedFree R. -/
example (R : Type u) [Ring R] (e : (Fin 1 → R) ≃ₗ[R] (Fin 2 → R)) :
    Nonempty ((BasedFree.toModuleCore R).obj ⟨1⟩ ≅ (BasedFree.toModuleCore R).obj ⟨2⟩) ∧
      IsEmpty ((⟨1⟩ : BasedFree R) ≅ ⟨2⟩) := sorry

/-- `basedFree_aut_bijective`: For every n, toProj induces a bijection Aut n → Aut (toProj.obj n). -/
example (R : Type u) [Ring R] (n : ℕ) :
    Function.Bijective (fun g : Aut (⟨n⟩ : BasedFree R) => (BasedFree.toModuleCore R).mapIso g) := sorry

/-- (acyclicity part): a product of acyclic maps is acyclic; the kernel on `π₁`
of `f × g` is `P × Q`, so a product of plus constructions is a plus construction. -/
theorem IsAcyclicMap.prod {X Y X' Y' : TopCat.{u}} {f : X ⟶ X'} {g : Y ⟶ Y'} (hf : IsAcyclicMap f)
    (hg : IsAcyclicMap g) :
    IsAcyclicMap (TopCat.ofHom (f.hom.prodMap g.hom) : TopCat.of (X × Y) ⟶ TopCat.of (X' × Y')) := sorry


/-- Restriction of a coherent monoidal action along a strong braided monoidal functor. -/
def restrictAction {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Braided]
    {X : Type u} [Category.{u} X] (a : MonoidalAction T X) : MonoidalAction S X := sorry

/-- for `F` cofinal, `S⁻¹X ≃ T⁻¹X`. -/
theorem cofinality_action {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Braided]
    (hS : FaithfulTranslations S) (hT : FaithfulTranslations T)
    (hcof : ∀ t : T, ∃ (t' : T) (s : S), Nonempty (t ⊗ t' ≅ F.obj s))
    {X : Type u} [Category.{u} X] (a : MonoidalAction T X) :
    Nonempty (ContinuousMap.HomotopyEquiv (classifyingSpace (MonoidalActionCategory.loc S (restrictAction F a)))
      (classifyingSpace (MonoidalActionCategory.loc T a))) := sorry


/-- the skeleton of finite pointed sets `[n] = {0, …, n}` pointed at `0`. -/
structure FinPointed : Type where
  /-- `[n] = {0, …, n}` pointed at `0`. -/
  n : ℕ

/-- Finite pointed sets and point-preserving maps form a category. -/
instance : Category FinPointed where
  Hom X Y := {f : Fin (X.n + 1) → Fin (Y.n + 1) // f 0 = 0}
  id X := ⟨id, rfl⟩
  comp f g := ⟨g.1 ∘ f.1, show g.1 (f.1 0) = 0 by rw [f.2, g.2]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The standard finite pointed set has n nonbasepoint elements and distinguished element zero. -/
def FinPointed.mk' (n : ℕ) : FinPointed := ⟨n⟩

/-- The Segal projection `[n] → [1]` collapsing everything but `i + 1`. -/
def FinPointed.segalProj (n : ℕ) (i : Fin n) : FinPointed.mk' n ⟶ FinPointed.mk' 1 := sorry

/-- A functor Fin_*→SSet. -/
abbrev GammaSpace := FinPointed ⥤ SSet.{u}

namespace GammaSpace

/-- |X(1)|, pointed by X(0). -/
def underlying (X : GammaSpace.{u}) : TopCat.{u} := SSet.toTop.obj (X.obj (FinPointed.mk' 1))

/-- X(0) is weakly contractible and the Segal maps are weak equivalences. -/
def IsSpecial (X : GammaSpace.{u}) : Prop :=
  ContractibleSpace (SSet.toTop.obj (X.obj (FinPointed.mk' 0))) ∧
    ∀ n : ℕ, IsWeakHomotopyEquivalence (SSet.toTop.map
      (Pi.lift fun i : Fin n => X.map (FinPointed.segalProj n i)))

/-- For special X, the Segal comparison and fold induce a commutative monoid on π₀|X(1)|. -/
def pi0Monoid (X : GammaSpace.{u}) : Type u := ZerothHomotopy (underlying X)

/-- The categorical or algebraic structure specified by `GammaSpace.{u}) [Fact X.IsSpecial] : CommMonoid (pi0Monoid X)`. -/
instance (X : GammaSpace.{u}) [Fact X.IsSpecial] : CommMonoid (pi0Monoid X) := sorry

/-- Special X with grouplike component monoid. -/
def IsGrouplike (X : GammaSpace.{u}) : Prop :=
  ∃ hX : X.IsSpecial, letI : Fact X.IsSpecial := ⟨hX⟩; ∀ a : pi0Monoid X, IsUnit a

/-- The discrete Γ-space `[n] ↦ Mⁿ` of a commutative monoid `M` (sums over the fibres of
pointed maps). -/
def ofCommMonoid (M : Type u) [AddCommMonoid M] : GammaSpace.{u} := sorry

/-- The Γ-space of a commutative monoid satisfies the Segal product comparisons. -/
instance ofCommMonoid_special (M : Type u) [AddCommMonoid M] :
    Fact (IsSpecial (ofCommMonoid M)) := ⟨sorry⟩

end GammaSpace

/-- `gammaSpace_const_point_special`: The constant Γ-space at a point is special and grouplike. -/
example : GammaSpace.IsSpecial ((Functor.const FinPointed).obj (SSet.stdSimplex.obj (SimplexCategory.mk 0))) ∧
    GammaSpace.IsGrouplike ((Functor.const FinPointed).obj (SSet.stdSimplex.obj (SimplexCategory.mk 0))) := sorry

/-- `gammaSpace_discrete_abelian`: For an abelian group A, the discrete Γ-space [n] ↦ Aⁿ is special with π₀ = A. -/
example (A : Type u) [AddCommGroup A] : GammaSpace.IsSpecial (GammaSpace.ofCommMonoid A) ∧
    GammaSpace.IsGrouplike (GammaSpace.ofCommMonoid A) ∧
    Nonempty (GammaSpace.pi0Monoid (GammaSpace.ofCommMonoid A) ≃* Multiplicative A) := sorry

/-- `gammaSpace_pi0_compat`: For the Γ-space of a commutative monoid M ([n] ↦ Mⁿ, discrete), pi0Monoid is M with its own addition. -/
example (M : Type u) [AddCommMonoid M] :
    Nonempty (GammaSpace.pi0Monoid (GammaSpace.ofCommMonoid M) ≃* Multiplicative M) := sorry

/-- `gammaSpace_not_special_two_points`: The constant Γ-space at a two-point discrete simplicial set is not special: X([0]) is not contractible and the Segal map X([2]) → X([1])² is not a bijection on π₀. -/
example : ¬ GammaSpace.IsSpecial ((Functor.const FinPointed).obj
    (SSet.stdSimplex.obj (SimplexCategory.mk 0) ⨿ SSet.stdSimplex.obj (SimplexCategory.mk 0))) := sorry

/-- Summing diagrams and natural isomorphisms form a groupoid. -/
def summingFunctors (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    (X : FinPointed) : Type u := sorry

/-- The categorical or algebraic structure specified by `Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] (X : FinPointed) : Groupoid.{u} (summingFunctors C X)`. -/
instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] (X : FinPointed) :
    Groupoid.{u} (summingFunctors C X) := sorry

/-- A_C(n)=nerve(summingFunctors(C,n)). -/
def segalGammaSpace (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    GammaSpace.{u} := sorry

/-- A_C is special. -/
theorem segalGammaSpace.isSpecial (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : (segalGammaSpace C).IsSpecial := sorry

/-- Coherent summing functors satisfy all Segal product equivalences. -/
instance segalGammaSpace_special (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : Fact (segalGammaSpace C).IsSpecial :=
  ⟨segalGammaSpace.isSpecial C⟩

/-- Zero/sum-preserving functors give functorial Γ-space maps. -/
def segalGammaSpace.map {C D : Type u} [Category.{u} C] [Category.{u} D] [HasZeroObject C]
    [HasBinaryCoproducts C] [HasZeroObject D] [HasBinaryCoproducts D] (F : C ⥤ D)
    [PreservesColimitsOfShape (Discrete WalkingPair) F] [PreservesColimitsOfShape (Discrete.{0} PEmpty) F] :
    segalGammaSpace C ⟶ segalGammaSpace D := sorry

/-- The connective Ω-model built by Γ-space delooping, with group-completed zeroth space.
This declaration records the underlying sequence of spaces. -/
def segalSpaces (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    ℕ → TopCat.{u} := sorry

/-- Isomorphism classes with the commutative monoid operation induced by categorical sums.
This chooses the sum operation, rather than an unrelated monoidal instance (for modules, tensor
product would give the wrong K₀). -/
abbrev segalIsoClasses (C : Type u) [Category.{u} C] := Quotient (isIsomorphicSetoid C)

/-- The categorical or algebraic structure specified by `Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] : CommMonoid (segalIsoClasses C)`. -/
instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    CommMonoid (segalIsoClasses C) := sorry

open scoped ZeroObject in
/-- The zero class is the unit. -/
theorem segalIsoClasses.mk_zero (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] :
    (Quotient.mk (isIsomorphicSetoid C) (0 : C) : segalIsoClasses C) = 1 := sorry

/-- [X⊔Y]=[X][Y]. -/
theorem segalIsoClasses.mk_coprod (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] (X Y : C) :
    (Quotient.mk (isIsomorphicSetoid C) (X ⨿ Y) : segalIsoClasses C) =
      Quotient.mk (isIsomorphicSetoid C) X * Quotient.mk (isIsomorphicSetoid C) Y := sorry

/-- Before completion: components are the monoid of isomorphism classes under sums. -/
def segalGammaSpace.pi0IsoClasses (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : GammaSpace.pi0Monoid (segalGammaSpace C) ≃* segalIsoClasses C := sorry

/-- Components of the actual group-completed zeroth space, not of `A_C([1])`. -/
abbrev segalSpaces.pi0 (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] := ZerothHomotopy (segalSpaces C 0)

/-- The categorical or algebraic structure specified by `Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] : CommGroup (segalSpaces.pi0 C)`. -/
instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    CommGroup (segalSpaces.pi0 C) := sorry

/-- The component map of the Γ-space group completion, expressed on isomorphism classes. -/
def segalSpaces.toPi0 (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : segalIsoClasses C →* segalSpaces.pi0 C := sorry

/-- The completed zeroth Segal space has components equal to the group completion of the object monoid. -/
def segalSpaces.pi0GrothendieckEquiv (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] :
    segalSpaces.pi0 C ≃* Algebra.GrothendieckGroup (segalIsoClasses C) := sorry

/-- The comparison identifies the completion map with the algebraic map on generators. -/
theorem segalSpaces.pi0GrothendieckEquiv_toPi0 (C : Type u) [Category.{u} C]
    [HasZeroObject C] [HasBinaryCoproducts C] (x : segalIsoClasses C) :
    segalSpaces.pi0GrothendieckEquiv C (segalSpaces.toPi0 C x) =
      Algebra.GrothendieckGroup.of x := sorry


/-- `segalGammaSpace_zero_category`: For C the category with one object (a zero object), segalGammaSpace C is the constant point. -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    [∀ X Y : C, Subsingleton (X ⟶ Y)] : ∀ n, ContractibleSpace (SSet.toTop.obj ((segalGammaSpace C).obj n)) := sorry

/-- `segalGammaSpace_pi0_K0`: For finite projectives, π₀ of the completed space Ω|BA_C(1)| is split K₀(R). Using π₀A_C(1) instead leaves the direct-sum monoid. -/
example (R : Type u) [Ring R] (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C]
    (e : C ≌ ObjectProperty.FullSubcategory (fun M : ModuleCat.{u} R =>
      Module.Finite R M ∧ Module.Projective R M)) :
    Nonempty (segalSpaces.pi0 C ≃* Algebra.GrothendieckGroup (segalIsoClasses C)) := sorry

/-- `segalGammaSpace_rank_group_completion`: Finite-dimensional vector spaces have direct-sum monoid ℕ and completed component group ℤ; rank n maps to +n and negative ranks detect failure to complete. -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    (rank : segalIsoClasses C ≃* Multiplicative ℕ) :
    ∃ e : segalSpaces.pi0 C ≃* Multiplicative ℤ,
      ∀ x : segalIsoClasses C,
        e (segalSpaces.toPi0 C x) = Multiplicative.ofAdd ((rank x).toAdd : ℤ) := sorry


/-- The coherent-subset Γ-model N(C). -/
def coherentSubsetGammaSpace (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    GammaSpace.{u} := sorry

namespace coherentSubsetGammaSpace

variable (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C]

/-- N(C) is special. -/
theorem isSpecial : (coherentSubsetGammaSpace C).IsSpecial := sorry

/-- The categorical or algebraic structure specified by `Fact (coherentSubsetGammaSpace C).IsSpecial`. -/
instance : Fact (coherentSubsetGammaSpace C).IsSpecial := ⟨isSpecial C⟩

/-- π₀N(C)(1)≅Skeleton C as monoids. -/
def pi0Equiv : GammaSpace.pi0Monoid (coherentSubsetGammaSpace C) ≃* Core.isoClassesMonoid C := sorry

/-- Strong braided monoidal functors give Γ-maps with coherent composition comparisons. -/
def map {D : Type u} [Groupoid.{u} D] [MonoidalCategory D] [SymmetricCategory D] (F : C ⥤ D)
    [F.Braided] : coherentSubsetGammaSpace C ⟶ coherentSubsetGammaSpace D := sorry

/-- Forget unit data to compare N(C)(1) with nerve C weakly. -/
theorem level_one : ∃ g : (coherentSubsetGammaSpace C).obj (FinPointed.mk' 1) ⟶ nerve C,
    IsWeakHomotopyEquivalence (SSet.toTop.map g) := sorry

end coherentSubsetGammaSpace

/-- `coherentSubset_level_zero`: Unit coherence makes N(C)(0) contractible. If it is omitted, the discrete monoid {1,e}, e²=e, gives two idempotent empty-subset choices and two components. -/
example (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    ContractibleSpace (SSet.toTop.obj ((coherentSubsetGammaSpace C).obj (FinPointed.mk' 0))) := sorry


/-- `coherentSubset_pic_grouplike`: For C = Pic(R), N(C) is grouplike with π₀ = Pic(R). -/
example (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C]
    (hC : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)) : (coherentSubsetGammaSpace C).IsGrouplike := sorry


/-- A symmetric monoidal groupoid is Picard exactly when its object-component monoid is a group. -/
theorem picard_iff_grouplike (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    (coherentSubsetGammaSpace C).IsGrouplike ↔ ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C) := sorry


/-- n↦C(Δⁿ,A), with pointwise ring operations. -/
def simplicialRingOfContinuous (A : Type u) [TopologicalSpace A] [Ring A] [IsTopologicalRing A] :
    SimplicialObject RingCat.{u} := sorry

/-- Realise n↦F(C(Δⁿ,A)), when F is simplicial-compatible with the specified variance. -/
def topologicalVariant (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A]
    [IsTopologicalRing A] : TopCat.{u} :=
  SimplicialSpace.realization.obj (simplicialRingOfContinuous A ⋙ F)

/-- The map induced by constant functions. -/
def topologicalVariant.unit (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A]
    [IsTopologicalRing A] : F.obj (RingCat.of A) ⟶ topologicalVariant F A := sorry

/-- Natural in F and continuous ring maps. -/
def topologicalVariant.map {F G : RingCat.{u} ⥤ TopCat.{u}} (φ : F ⟶ G) (A : Type u) [TopologicalSpace A]
    [Ring A] [IsTopologicalRing A] : topologicalVariant F A ⟶ topologicalVariant G A := sorry

/-- `topologicalVariant_const`: For a constant functor F, topologicalVariant F A ≃ F A. -/
example (Y : TopCat.{u}) (A : Type u) [TopologicalSpace A] [Ring A] [IsTopologicalRing A] :
    Nonempty (topologicalVariant ((Functor.const _).obj Y) A ≅ Y) := sorry

/-- `topologicalVariant_discrete_ring`: For A with the discrete topology, C(Δⁿ, A) = A and topologicalVariant F A ≃ F A. -/
example (F : RingCat.{u} ⥤ TopCat.{u}) (A : Type u) [TopologicalSpace A] [DiscreteTopology A] [Ring A]
    [IsTopologicalRing A] : ∃ e : ContinuousMap.HomotopyEquiv (F.obj (RingCat.of A)) (topologicalVariant F A),
      e.toFun = (topologicalVariant.unit F A).hom := sorry


end TauCeti

/-! ## Layer 5: Concrete symmetric spectra -/

/-- pointed simplicial sets. -/
abbrev SSet.Pointed := Under (⊤_ SSet.{u})

namespace SSet.Pointed

/-- The full symmetric monoidal structure, with unit S⁰. -/
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

/-- Permuting the n circle factors gives the symmetric-group action on the simplicial sphere Sⁿ. -/
def sphereAction (n : ℕ) : Equiv.Perm (Fin n) →* Aut (sphere.{u} n) := sorry

/-- `S^{m+n} ≅ S^m ∧ S^n` (associativity of `smashMonoidal`), equivariant for the block sum `Σ_m × Σ_n → Σ_{m+n}`. -/
def sphereAddIso (m n : ℕ) : sphere.{u} (m + n) ≅ smash (sphere m) (sphere n) := sorry

/-- Zero sphere is the smash unit, including both pointed vertices. -/
def sphereZeroIso : letI := smashMonoidal.{u};
    sphere 0 ≅ MonoidalCategoryStruct.tensorUnit (C := SSet.Pointed.{u}) := sorry

/-- The one-fold smash sphere is the chosen simplicial circle. -/
def sphereOneIso : sphere.{u} 1 ≅ circle := sorry

/-- map_*(S¹,K), right adjoint to S¹∧−. -/
def loop (K : SSet.Pointed.{u}) : SSet.Pointed.{u} := sorry


end SSet.Pointed

/-- `sphere_zero`: sphere 0 = S⁰ = Δ[0]₊ and smash S⁰ K ≅ K. -/
example (K : SSet.Pointed.{u}) : Nonempty (SSet.Pointed.smash (SSet.Pointed.sphere 0) K ≅ K) := sorry

/-- `circle_cells`: circle has exactly one nondegenerate 0-simplex and one nondegenerate 1-simplex, and its realisation is homeomorphic to the circle. -/
example : Nonempty (SSet.toTop.obj SSet.Pointed.circle.{0}.right ≃ₜ Circle) := sorry

/-- `sphere_toTop`: The realisation of Sⁿ is a topological sphere. S¹∧S¹ has one nondegenerate vertex, one edge and two 2-simplices, so its cells are not the minimal sphere CW structure. -/
example (n : ℕ) : Nonempty (SSet.toTop.obj (SSet.Pointed.sphere.{0} n).right ≃ₜ
    Metric.sphere (0 : Fin (n + 1) → ℝ) 1) := sorry

/-- `smash_not_product`: smash circle circle is not circle ⊗ circle: the latter realises to the torus, the former to S². -/
example : ¬ Nonempty (SSet.toTop.obj (SSet.Pointed.smash SSet.Pointed.circle.{0} SSet.Pointed.circle).right ≃ₜ
    (Circle × Circle)) := sorry

namespace TauCeti

open SSet.Pointed

/-- The data of a symmetric spectrum before the equivariance axiom. -/
structure SymmSpectrum.Data : Type (u + 1) where
  level : ℕ → SSet.Pointed.{u}
  action : ∀ n, Equiv.Perm (Fin n) →* Aut (level n)
  σ : ∀ n, smash (level n) circle ⟶ level (n + 1)

/-- The iterated structure map `σ^m : X_n ∧ S^m → X_{n+m}` (Schwede I (1.2)), built from `σ` and the
associativity isomorphisms of `smashMonoidal`; `σ^0` is the unit isomorphism. -/
def SymmSpectrum.Data.iterσ (X : SymmSpectrum.Data.{u}) (n m : ℕ) :
    smash (X.level n) (SSet.Pointed.sphere m) ⟶ X.level (n + m) := sorry

/-- Zero-fold iteration is the right unit map. -/
theorem SymmSpectrum.Data.iterσ_zero (X : SymmSpectrum.Data.{u}) (n : ℕ) :
    letI := SSet.Pointed.smashMonoidal.{u}
    X.iterσ n 0 = smashMap (𝟙 (X.level n)) SSet.Pointed.sphereZeroIso.hom ≫
      (ρ_ (X.level n)).hom := sorry

/-- One-fold iteration is exactly the given structure map after the circle identification. -/
theorem SymmSpectrum.Data.iterσ_one (X : SymmSpectrum.Data.{u}) (n : ℕ) :
    X.iterσ n 1 = smashMap (𝟙 (X.level n)) SSet.Pointed.sphereOneIso.hom ≫ X.σ n := sorry

/-- Iteration appends the final circle and then applies the next structure map. -/
theorem SymmSpectrum.Data.iterσ_succ (X : SymmSpectrum.Data.{u}) (n m : ℕ) :
    letI := SSet.Pointed.smashMonoidal.{u}
    X.iterσ n (m + 1) =
      smashMap (𝟙 (X.level n)) (SSet.Pointed.sphereAddIso m 1).hom ≫
      (α_ (X.level n) (SSet.Pointed.sphere m) (SSet.Pointed.sphere 1)).inv ≫
      smashMap (X.iterσ n m) SSet.Pointed.sphereOneIso.hom ≫ X.σ (n + m) ≫
      eqToHom (congrArg X.level (Nat.add_assoc n m 1)) := sorry

/-- (Schwede I Definition 3.1). -/
structure SymmSpectrum extends SymmSpectrum.Data.{u} where
  /-- `σ^m` is `Σ_n × Σ_m`-equivariant, `Σ_n × Σ_m ⊆ Σ_{n+m}` by block sum. -/
  equivariant : ∀ (n m : ℕ) (g : Equiv.Perm (Fin n)) (h : Equiv.Perm (Fin m)),
    smashMap (action n g).hom (SSet.Pointed.sphereAction m h).hom ≫
        SymmSpectrum.Data.iterσ ⟨level, action, σ⟩ n m =
      SymmSpectrum.Data.iterσ ⟨level, action, σ⟩ n m ≫
        (action (n + m) (finSumFinEquiv.permCongr (Equiv.sumCongr g h))).hom

namespace SymmSpectrum

/-- Morphisms: `Σ_n`-equivariant level maps compatible with the structure maps. -/
structure Hom (X Y : SymmSpectrum.{u}) where
  app : ∀ n, X.level n ⟶ Y.level n
  equivariant : ∀ n (g : Equiv.Perm (Fin n)), (X.action n g).hom ≫ app n = app n ≫ (Y.action n g).hom
  comm : ∀ n, X.σ n ≫ app (n + 1) = smashMap (app n) (𝟙 circle) ≫ Y.σ n

/-- The categorical or algebraic structure specified by `Category SymmSpectrum.{u}`. -/
instance : Category SymmSpectrum.{u} where
  Hom := Hom
  id X := ⟨fun n => 𝟙 (X.level n), sorry, sorry⟩
  comp f g := ⟨fun n => f.app n ≫ g.app n, sorry, sorry⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- Pointed level maps give the zero morphisms of spectra. -/
instance : HasZeroMorphisms SymmSpectrum.{u} := sorry

/-- Sequential spectra: forget the symmetric group actions. -/
structure Sequential : Type (u + 1) where
  level : ℕ → SSet.Pointed.{u}
  σ : ∀ n, smash (level n) circle ⟶ level (n + 1)

/-- Forget actions to obtain the sequential spectrum. -/
def toSequential (X : SymmSpectrum.{u}) : Sequential.{u} := ⟨X.level, X.σ⟩

/-- Evaluation at spectrum level n is a functor to pointed simplicial sets. -/
def level' (n : ℕ) : SymmSpectrum.{u} ⥤ SSet.Pointed.{u} where
  obj X := X.level n
  map f := f.app n

/-- Sₙ=Sⁿ with the canonical actions and σ. -/
def sphere : SymmSpectrum.{u} := sorry

/-- Levelwise compactly generated realisation respects colimits and smash; finite-limit comparisons use §2.21, without an infinite-product/internal-Hom assertion. -/
def realization (X : SymmSpectrum.{u}) : ℕ → TopCat.{u} := fun n => SSet.toTop.obj (X.level n).right

/-- `symmSpectrum_zero`: The trivial spectrum (a point in each level) is a zero object of the category of symmetric spectra. -/
example : ∃ Z : SymmSpectrum.{u}, IsZero Z := sorry

/-- `symmSpectrum_sphere_level`: sphere.level 2 = S² with Σ₂ acting by swapping the two circle factors (a map of degree −1 on |S²|). -/
example : Nonempty ((sphere.{u}).level 2 ≅ SSet.Pointed.sphere 2) := sorry

/-- `symmSpectrum_colimit_levelwise`: Colimits of symmetric spectra are computed levelwise: (colim X^i)_n = colim (X^i)_n. -/
example (n : ℕ) : PreservesColimits (level'.{u} n) := sorry


/-- `π̂_k X = colim_n π_{k+n} |X_n|`. -/
def naivePi (X : SymmSpectrum.{u}) (k : ℤ) : Type u := sorry

/-- The categorical or algebraic structure specified by `SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (naivePi X k)`. -/
instance (X : SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (naivePi X k) := sorry

/-- Functorial additive maps on π̂ₖ. -/
def naivePi.map {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) : naivePi X k →+ naivePi Y k := sorry

/-- All π̂ₖ maps are bijective. -/
def IsNaivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : Prop :=
  ∀ k, Function.Bijective (naivePi.map f k)

/-- The basepoint of the realisation `|X_n|`: the image of the base vertex. -/
def basepoint (X : SymmSpectrum.{u}) (n : ℕ) : SSet.toTop.obj (X.level n).right := sorry

/-- The canonical map `π_{k+n} |X_n| → π̂_k X` (meaningful for `k + n ≥ 0`). -/
def naivePi_of_level (X : SymmSpectrum.{u}) (k : ℤ) (n : ℕ) (hkn : 0 ≤ k + n) :
    HomotopyGroup.Pi (k + n).toNat (SSet.toTop.obj (X.level n).right) (X.basepoint n) →
      naivePi X k := sorry

/-- Levelwise pointed S¹-mapping object; use Kan replacement for derived loops. -/
def loop : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
/-- Levelwise S¹∧X. -/
def susp : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
/-- susp⊣loop. -/
def suspLoopAdj : susp.{u} ⊣ loop := sorry
/-- (sh X)ₙ=X₁₊ₙ with restricted actions. -/
def shift : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry
/-- The natural σ-derived map λ:S¹∧X→sh X. -/
def lambda : susp.{u} ⟶ shift := sorry

/-- For Kan levels, π̂ₖΩX≅π̂ₖ₊₁X. -/
def naivePi_loop (X : SymmSpectrum.{u})
    (hX : ∀ n : ℕ, SSet.KanComplex (X.level n).right) (k : ℤ) : naivePi (loop.obj X) k ≃+ naivePi X (k + 1) := sorry

/-- π̂ₖX≅π̂ₖ₊₁(S¹∧X). -/
def naivePi_susp (X : SymmSpectrum.{u}) (k : ℤ) : naivePi X k ≃+ naivePi (susp.obj X) (k + 1) := sorry

/-- `naivePi_sphere_zero`: naivePi sphere 0 ≅ ℤ, generated by the identity of S⁰. -/
example : Nonempty (naivePi sphere.{0} 0 ≃+ ℤ) := sorry

/-- `naivePi_trivial`: naivePi of the trivial spectrum is 0 in every degree. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (k : ℤ) : Subsingleton (naivePi Z k) := sorry

/-- `naivePi_sphere_negative`: naivePi sphere k = 0 for k < 0. -/
example (k : ℤ) (hk : k < 0) : Subsingleton (naivePi sphere.{u} k) := sorry


/-- the adjoint `|X_n| → Ω|X_{n+1}|` of the
realised structure map `|X_n| ∧ S¹ → |X_{n+1}|`, into the topological loop space at the basepoint
(so that no Kan condition is needed on the levels). -/
def adjointStructureMap (X : SymmSpectrum.{u}) (n : ℕ) :
    SSet.toTop.obj (X.level n).right ⟶
      TopCat.of (LoopSpace (SSet.toTop.obj (X.level (n + 1)).right) (X.basepoint (n + 1))) := sorry

/-- Every realised adjoint structure map |Xₙ|→Ω|Xₙ₊₁| is weak. -/
def IsOmegaSpectrum (X : SymmSpectrum.{u}) : Prop :=
  ∀ n, IsWeakHomotopyEquivalence (adjointStructureMap X n)

/-- Naive homotopy groups vanish in negative degrees; implies `IsConnective` (Schwede I Example 8.50). -/
def IsNaivelyConnective (X : SymmSpectrum.{u}) : Prop := ∀ k : ℤ, k < 0 → Subsingleton (naivePi X k)

/-- For Ω-spectra, each level map to π̂ is bijective when k+n≥0. -/
theorem IsOmegaSpectrum.naivePi_eq {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) (k : ℤ) (n : ℕ)
    (hkn : 0 ≤ k + n) : Function.Bijective (naivePi_of_level X k n hkn) := sorry

/-- `λ_X : S¹ ∧ X → sh X` is a `π̂_*`-isomorphism (Schwede I.3.14). -/
def IsSemistable (X : SymmSpectrum.{u}) : Prop := IsNaivePiIso (lambda.app X)

/-- A Kan Ω-spectrum has bijective naive-to-true homotopy comparison. -/
theorem IsOmegaSpectrum.semistable {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) : IsSemistable X := sorry

/-- `isOmegaSpectrum_trivial`: The trivial spectrum is an Ω-spectrum. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsOmegaSpectrum Z := sorry

/-- `not_isOmegaSpectrum_sphere`: The sphere spectrum is not an Ω-spectrum: S¹ → ΩS² is not a weak equivalence, since π₂(ΩS²) = π₃(S²) = ℤ while π₂(S¹) = 0. -/
example : ¬ IsOmegaSpectrum sphere.{u} := sorry

/-- `isConnective_sphere`: The sphere spectrum is naively connective. -/
example : IsNaivelyConnective sphere.{u} := sorry

/-- (Σ∞K)ₙ=K∧Sⁿ. -/
def suspensionSpectrum : SSet.Pointed.{u} ⥤ SymmSpectrum.{u} := sorry
/-- Σ∞ is left adjoint to evaluation at zero. -/
def suspensionAdj : suspensionSpectrum.{u} ⊣ level' 0 := sorry
/-- Fₘ is left adjoint to evaluation at m after forgetting its action. -/
def free (m : ℕ) : SSet.Pointed.{u} ⥤ SymmSpectrum.{u} := sorry
/-- The free symmetric spectrum at level n is left adjoint to level-n evaluation. -/
def freeAdj (m : ℕ) : free.{u} m ⊣ level' m := sorry

/-- S≅Σ∞S⁰. -/
theorem sphereSpectrum_eq : Nonempty (sphere.{u} ≅ suspensionSpectrum.obj (SSet.Pointed.sphere 0)) := sorry


/-- `suspensionSpectrum_point`: suspensionSpectrum of the one-point pointed simplicial set is the trivial spectrum. -/
example : IsZero (suspensionSpectrum.{u}.obj (Under.mk (𝟙 (⊤_ SSet.{u})))) := sorry

/-- `suspensionSpectrum_naivePi_zero_S0`: naivePi (suspensionSpectrum S⁰) 0 ≅ ℤ. -/
example : Nonempty (naivePi (suspensionSpectrum.{0}.obj (SSet.Pointed.sphere 0)) 0 ≃+ ℤ) := sorry

/-- `suspensionSpectrum_connective`: suspensionSpectrum K is connective for every K. -/
example (K : SSet.Pointed.{u}) : IsNaivelyConnective (suspensionSpectrum.obj K) := sorry

/-- `free_one_not_piIso`: The map free 1 S¹ → sphere adjoint to the identity is a stable equivalence but not a π̂_*-isomorphism. -/
example : ¬ IsNaivePiIso ((freeAdj.{u} 1).counit.app sphere) := sorry

/-- `loop_trivial`: loop of the trivial spectrum is trivial. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsZero (loop.obj Z) := sorry

/-- `naivePi_shift`: naivePi (shift X) (k + 1) ≅ naivePi X k. -/
example (X : SymmSpectrum.{u}) (hX : IsSemistable X) (k : ℤ) : Nonempty (naivePi (shift.obj X) (k + 1) ≃+ naivePi X k) := sorry

/-- `loop_susp_sphere`: susp sphere ≅ shift sphere ≅ suspensionSpectrum S¹ (Schwede I Example 3.9) and naivePi (susp sphere) 1 ≅ ℤ. -/
example : Nonempty (naivePi (susp.{0}.obj sphere) 1 ≃+ ℤ) := sorry

/-- `shift_not_susp`: λ_{F₁S¹} : S¹ ∧ F₁S¹ → sh(F₁S¹) is not a π̂_*-isomorphism (it is the inclusion of a wedge summand with non-zero complement, Schwede I Example 8.30), so F₁S¹ is not semistable. -/
example : ¬ IsNaivePiIso (lambda.{u}.app ((free 1).obj (SSet.Pointed.sphere 1))) := sorry

/-- Ω-spectra are semistable. -/
theorem IsSemistable.of_omega {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) : IsSemistable X := hX.semistable
/-- Suspension spectra are semistable. -/
theorem IsSemistable.of_suspension (K : SSet.Pointed.{u}) : IsSemistable (suspensionSpectrum.obj K) := sorry
/-- A π̂-isomorphism f:X→Y gives semistability(X)↔semistability(Y). -/
theorem IsSemistable.of_naivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (hf : IsNaivePiIso f) :
    IsSemistable X ↔ IsSemistable Y := sorry

/-- `isSemistable_sphere`: The sphere spectrum is semistable. -/
example : IsSemistable sphere.{u} := sorry
/-- `isSemistable_trivial`: The trivial spectrum is semistable. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsSemistable Z := sorry
/-- `not_isSemistable_free_one`: free 1 S¹ is not semistable. -/
example : ¬ IsSemistable ((free 1).obj (SSet.Pointed.sphere.{u} 1)) := sorry


/-- πₖX=π̂ₖ of a stable fibrant replacement. -/
def pi (X : SymmSpectrum.{u}) (k : ℤ) : Type u := sorry
/-- The categorical or algebraic structure specified by `SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (pi X k)`. -/
instance (X : SymmSpectrum.{u}) (k : ℤ) : AddCommGroup (pi X k) := sorry
/-- A spectrum morphism induces an additive map on each true stable homotopy group. -/
def pi.map {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) : pi X k →+ pi Y k := sorry
/-- The replacement-induced map π̂ₖX→πₖX. -/
def naivePiToPi (X : SymmSpectrum.{u}) (k : ℤ) : naivePi X k →+ pi X k := sorry
/-- It is bijective for semistable X. -/
theorem naivePiToPi_iso_of_semistable {X : SymmSpectrum.{u}} (hX : IsSemistable X) (k : ℤ) :
    Function.Bijective (naivePiToPi X k) := sorry

/-- Connective: the true homotopy groups vanish in negative degrees. -/
def IsConnective (X : SymmSpectrum.{u}) : Prop := ∀ k : ℤ, k < 0 → Subsingleton (pi X k)

/-- Naive connectivity implies true connectivity under the displayed semistability hypothesis. -/
theorem IsNaivelyConnective.isConnective {X : SymmSpectrum.{u}} (hX : IsNaivelyConnective X) :
    IsConnective X := sorry

/-- Level equivalences: levelwise weak equivalences after realisation. -/
def levelEquivalences : MorphismProperty SymmSpectrum.{u} :=
  fun _ _ f => ∀ n, IsWeakHomotopyEquivalence (SSet.toTop.map (f.app n).right)

/-- Injective spectra (Hovey–Shipley–Smith Definition 3.1.1). -/
def IsInjective (E : SymmSpectrum.{u}) : Prop :=
  ∀ ⦃A B : SymmSpectrum.{u}⦄ (i : A ⟶ B), Mono i → levelEquivalences i →
    ∀ g : A ⟶ E, ∃ h : B ⟶ E, i ≫ h = g

/-- Simplicial homotopy classes `[A, E]` of morphisms (homotopies `Δ[1]₊ ∧ A → E`). -/
def homotopyClasses (A E : SymmSpectrum.{u}) : Type u := sorry

/-- Precomposition acts contravariantly on classes of spectrum maps modulo spectrum homotopy. -/
def homotopyClasses.precomp {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (E : SymmSpectrum.{u}) :
    homotopyClasses Y E → homotopyClasses X E := sorry

/-- (Hovey–Shipley–Smith Definition 3.1.3, Schwede I Definition 4.11). -/
def stableEquivalences : MorphismProperty SymmSpectrum.{u} :=
  fun _ _ f => ∀ E : SymmSpectrum.{u}, IsInjective E → IsOmegaSpectrum E →
    Function.Bijective (homotopyClasses.precomp f E)

/-- (Schwede I Theorem 4.23). -/
theorem stableEquivalence_of_naivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (hf : IsNaivePiIso f) :
    stableEquivalences f := sorry
/-- Schwede I Theorem 6.2. -/
theorem stableEquivalence_iff_truePi {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    stableEquivalences f ↔ ∀ k, Function.Bijective (pi.map f k) := sorry

/-- A functorial stable equivalence `p_Y : Y ⟶ ωY` to an injective Ω-spectrum (Schwede I Props. 4.10, 4.39). -/
def injectiveOmegaReplacement : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry

/-- The replacement unit is the stable map into a selected injective Ω-spectrum. -/
def injectiveOmegaReplacement.ι : 𝟭 SymmSpectrum.{u} ⟶ injectiveOmegaReplacement := sorry

/-- The selected injective Ω replacement is stably equivalent to the input spectrum. -/
theorem injectiveOmegaReplacement.spec (Y : SymmSpectrum.{u}) :
    IsInjective (injectiveOmegaReplacement.obj Y) ∧ IsOmegaSpectrum (injectiveOmegaReplacement.obj Y) ∧
      stableEquivalences (injectiveOmegaReplacement.ι.app Y) := sorry
/-- For semistable X,Y, stable equivalence↔π̂-isomorphism. -/
theorem stableEquivalence_iff_naivePi_of_semistable {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : IsSemistable X) (hY : IsSemistable Y) : stableEquivalences f ↔ IsNaivePiIso f := sorry
/-- Two-out-of-three; includes level equivalences. -/
theorem stableEquivalences.twoOutOfThree : (stableEquivalences.{u}).HasTwoOutOfThreeProperty := sorry

/-- `stableEquivalence_id`: The identity is a stable equivalence. -/
example (X : SymmSpectrum.{u}) : stableEquivalences (𝟙 X) := sorry
/-- `stableEquivalence_free_one_sphere`: free 1 S¹ → sphere is a stable equivalence. -/
example : stableEquivalences ((freeAdj.{u} 1).counit.app sphere) := sorry
/-- `stableEquivalence_levelwise`: A levelwise weak homotopy equivalence of symmetric spectra is a stable equivalence. -/
example {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (h : ∀ n, IsWeakHomotopyEquivalence
    (SSet.toTop.map (f.app n).right)) : stableEquivalences f := sorry
/-- `not_stableEquivalence_zero_sphere`: The map from the trivial spectrum to the sphere spectrum is not a stable equivalence: π₀ differs. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : Z ⟶ sphere) : ¬ stableEquivalences f := sorry

/-- `pi_sphere_zero`: pi sphere 0 ≅ ℤ. -/
example : Nonempty (pi sphere.{0} 0 ≃+ ℤ) := sorry
/-- `pi_trivial`: pi of the trivial spectrum vanishes. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) (k : ℤ) : Subsingleton (pi Z k) := sorry
/-- `pi_free_one`: pi (free 1 S¹) k ≅ pi sphere k for all k. -/
example (k : ℤ) : Nonempty (pi ((free 1).obj (SSet.Pointed.sphere.{u} 1)) k ≃+ pi sphere k) := sorry
/-- `pi_ne_naivePi_free_one`: naivePiToPi (free 1 S¹) 0 is not injective. -/
example : ¬ Function.Injective (naivePiToPi ((free 1).obj (SSet.Pointed.sphere.{u} 1)) 0) := sorry

/-- The stable model structure has stable equivalences as weak equivalences and the prescribed projective cofibrations. -/
@[instance_reducible]
def stableModelCategory : HomotopicalAlgebra.ModelCategory SymmSpectrum.{u} := sorry

/-- Weak equivalences of the stable model agree with the true-homotopy equivalence predicate. -/
theorem stableModelCategory_weakEquivalences :
    letI := stableModelCategory.{u}
    HomotopicalAlgebra.weakEquivalences SymmSpectrum.{u} = stableEquivalences := sorry

end SymmSpectrum

/-- Localise symmetric spectra at stable equivalences. -/
def SHC : Type (u + 1) := (SymmSpectrum.stableEquivalences.{u}).Localization

/-- The categorical or algebraic structure specified by `Category.{u + 1} SHC.{u}`. -/
instance : Category.{u + 1} SHC.{u} := by unfold SHC; infer_instance

namespace SHC

/-- The localisation functor γ. -/
def γ : SymmSpectrum.{u} ⥤ SHC.{u} := (SymmSpectrum.stableEquivalences.{u}).Q

/-- γ(f) invertible↔f stable. -/
theorem isIso_γ_iff {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    IsIso (γ.map f) ↔ SymmSpectrum.stableEquivalences f := sorry

/-- The preadditive/additive structure. -/
instance preadditive : Preadditive SHC.{u} := sorry
/-- (Schwede II Proposition 1.10(ii)). -/
instance hasProducts : HasProducts.{u} SHC.{u} := sorry

/-- Arbitrary coproducts in the stable homotopy category. -/
instance hasCoproducts : HasCoproducts.{u} SHC.{u} := sorry
/-- The categorical or algebraic structure specified by `HasZeroObject SHC.{u}`. -/
instance : HasZeroObject SHC.{u} := sorry
/-- Integer shifts with [1]=Σ. -/
instance shiftFunctor : HasShift SHC.{u} ℤ := sorry
/-- The categorical or algebraic structure specified by `ℤ) : (CategoryTheory.shiftFunctor SHC.{u} n).Additive`. -/
instance (n : ℤ) : (CategoryTheory.shiftFunctor SHC.{u} n).Additive := sorry

/-- The spheres `S^k`, `k ∈ ℤ`. -/
def sphere (k : ℤ) : SHC.{u} := (CategoryTheory.shiftFunctor SHC k).obj (γ.obj SymmSpectrum.sphere)

/-- Additive comparison SHC(Sᵏ,γX)≅πₖX. -/
def homSphereEquiv (X : SymmSpectrum.{u}) (k : ℤ) : (sphere k ⟶ γ.obj X) ≃+ SymmSpectrum.pi X k := sorry


end SHC

namespace SymmSpectrum

/-- True πₖX is additively isomorphic to maps from Sᵏ to X in the stable homotopy category. -/
theorem pi_eq_SHC_hom (X : SymmSpectrum.{u}) (k : ℤ) :
    Nonempty ((SHC.sphere k ⟶ SHC.γ.obj X) ≃+ pi X k) := ⟨SHC.homSphereEquiv X k⟩

end SymmSpectrum

/-- `SHC_zero_object`: The trivial spectrum is a zero object of SHC. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsZero (SHC.γ.obj Z) := sorry


/-- `SHC_localization_compat`: SHC is equivalent to (stableEquivalences).Localization (Mathlib) compatibly with γ. -/
example : SHC.γ.{u}.IsLocalization SymmSpectrum.stableEquivalences := sorry
/-- `SHC_not_levelwise`: The localisation at levelwise weak equivalences only is not SHC: F₁S¹ → S is not inverted there. -/
example : ∃ (X Y : SymmSpectrum.{u}) (f : X ⟶ Y), SymmSpectrum.stableEquivalences f ∧
    ¬ ∀ n, IsWeakHomotopyEquivalence (SSet.toTop.map (f.app n).right) := sorry

namespace SymmSpectrum

/-- The cone with Y→C(f)→S¹∧X. -/
def mappingCone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : SymmSpectrum.{u} := sorry
/-- The target includes into the mapping cone of a spectrum map. -/
def mappingCone.inr {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : Y ⟶ mappingCone f := sorry
/-- The mapping-cone boundary maps to the suspension of the source. -/
def mappingCone.δ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : mappingCone f ⟶ susp.obj X := sorry
/-- The path fibre with ΩY→F(f)→X; replace non-Kan levels first. -/
def homotopyFiber {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : SymmSpectrum.{u} := sorry
/-- The path-space spectrum fibre projects to the source spectrum. -/
def homotopyFiber.proj {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) : homotopyFiber f ⟶ X := sorry
/-- Strict squares give functorial cone and fibre maps. -/
def mappingCone.map {X Y X' Y' : SymmSpectrum.{u}} {f : X ⟶ Y} {f' : X' ⟶ Y'} (a : X ⟶ X') (b : Y ⟶ Y')
    (w : f ≫ b = a ≫ f') : mappingCone f ⟶ mappingCone f' := sorry
/-- A commuting square with stable equivalences on source and target induces a stable equivalence on mapping cones. -/
theorem mappingCone_stableEquivalence {X Y X' Y' : SymmSpectrum.{u}} {f : X ⟶ Y} {f' : X' ⟶ Y'}
    (a : X ⟶ X') (b : Y ⟶ Y') (w : f ≫ b = a ≫ f') (ha : stableEquivalences a)
    (hb : stableEquivalences b) : stableEquivalences (mappingCone.map a b w) := sorry

/-- `mappingCone_id_trivial`: mappingCone (𝟙 X) is stably contractible. -/
example (X : SymmSpectrum.{u}) : IsZero (SHC.γ.obj (mappingCone (𝟙 X))) := sorry
/-- `mappingCone_toZero`: mappingCone (X ⟶ 0) ≅ susp X. -/
example (X Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : X ⟶ Z) :
    Nonempty (SHC.γ.obj (mappingCone f) ≅ SHC.γ.obj (susp.obj X)) := sorry
/-- `homotopyFiber_fromZero`: homotopyFiber (0 ⟶ Y) ≅ loop Y. -/
example (Y Z : SymmSpectrum.{u}) (hZ : IsZero Z)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (f : Z ⟶ Y) :
    Nonempty (SHC.γ.obj (homotopyFiber f) ≅ SHC.γ.obj (loop.obj Y)) := sorry
/-- `mappingCone_not_quotient`: For a non-injective map, the strict cofibre (quotient) differs from the mapping cone: for X ⟶ 0 the quotient is 0 but the mapping cone is susp X. -/
example (X Z : SymmSpectrum.{u}) (hZ : IsZero Z) (f : X ⟶ Z) (hX : ¬ IsZero (SHC.γ.obj X)) :
    ¬ IsZero (SHC.γ.obj (mappingCone f)) := sorry

/-- the boundary uses the
mapping-cone projection and inverse naive suspension isomorphism, without true groups. -/
def mappingCone.naivePiδ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    naivePi (mappingCone f) k →+ naivePi X (k - 1) := sorry

/-- The naive cofibre sequence is exact at the target homotopy group. -/
theorem naive_cofibre_exact {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (naivePi.map f k) (naivePi.map (mappingCone.inr f) k) := sorry

/-- The naive cofibre sequence is exact at the cone homotopy group. -/
theorem naive_cofibre_exact_cone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (naivePi.map (mappingCone.inr f) k) (mappingCone.naivePiδ f k) := sorry

/-- The naive cofibre sequence is exact at the shifted source homotopy group. -/
theorem naive_cofibre_exact_source {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (mappingCone.naivePiδ f k) (naivePi.map f (k - 1)) := sorry

/-- . Strict simplicial looping and
fibres use Kan levels; the general contract first replaces levels functorially. -/
def homotopyFiber.naivePiδ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (k : ℤ) :
    naivePi Y k →+ naivePi (homotopyFiber f) (k - 1) := sorry

/-- For Kan levels, the naive fibre sequence is exact at the source homotopy group. -/
theorem naive_fibre_exact_source {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : ∀ n, SSet.KanComplex (X.level n).right)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (k : ℤ) :
    Function.Exact (naivePi.map (homotopyFiber.proj f) k) (naivePi.map f k) := sorry

/-- For Kan levels, the naive fibre sequence is exact at the target homotopy group. -/
theorem naive_fibre_exact_target {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : ∀ n, SSet.KanComplex (X.level n).right)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (k : ℤ) :
    Function.Exact (naivePi.map f k) (homotopyFiber.naivePiδ f hY k) := sorry

/-- For Kan levels, the naive fibre sequence is exact at the fibre homotopy group. -/
theorem naive_fibre_exact_fibre {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : ∀ n, SSet.KanComplex (X.level n).right)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (k : ℤ) :
    Function.Exact (homotopyFiber.naivePiδ f hY k)
      (naivePi.map (homotopyFiber.proj f) (k - 1)) := sorry

/-- for true groups (exactness at `π_k Y`). -/
theorem cofibre_exact {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (pi.map f k) (pi.map (mappingCone.inr f) k) := sorry

/-- The connecting homomorphism `π_k C(f) → π_{k-1} X` (Schwede I (2.11), Prop. 6.11). -/
def mappingCone.piδ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    pi (mappingCone f) k →+ pi X (k - 1) := sorry

/-- The true stable cofibre sequence is exact at the cone homotopy group. -/
theorem cofibre_exact_cone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (pi.map (mappingCone.inr f) k) (mappingCone.piδ f k) := sorry

/-- The true stable cofibre sequence is exact at the shifted source homotopy group. -/
theorem cofibre_exact_source {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (mappingCone.piδ f k) (pi.map f (k - 1)) := sorry

/-- The natural comparison `h : S¹ ∧ F(f) → C(f)` (Schwede I (2.16)). -/
def homotopyFiber.toMappingCone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    susp.obj (homotopyFiber f) ⟶ mappingCone f := sorry

/-- (Schwede I Proposition 2.17). -/
theorem fibre_cofibre_shift {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : ∀ n, SSet.KanComplex (X.level n).right)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) :
    stableEquivalences (homotopyFiber.toMappingCone f) := sorry

/-- `fibre_cone_boundary_sign`: For a Kan-level spectrum fibre, the cone boundary of the suspended fibre boundary is minus the target inclusion. -/
example {X Y : SymmSpectrum.{u}} (f : X ⟶ Y)
    (hX : ∀ n, SSet.KanComplex (X.level n).right)
    (hY : ∀ n, SSet.KanComplex (Y.level n).right) (y : naivePi Y 1) :
    naivePi.map (homotopyFiber.toMappingCone f) 1
      (naivePi_susp (homotopyFiber f) 0 (homotopyFiber.naivePiδ f hY 1 y)) =
        -naivePi.map (mappingCone.inr f) 1 y := sorry

/-- The canonical map from a finite spectrum coproduct to its product is a stable equivalence. -/
theorem coprod_to_prod_stableEquivalence (X Y : SymmSpectrum.{u}) [HasBinaryCoproduct X Y]
    [HasBinaryProduct X Y] : ∃ f : X ⨿ Y ⟶ X ⨯ Y, stableEquivalences f ∧
      coprod.inl ≫ f ≫ prod.fst = 𝟙 X ∧ coprod.inr ≫ f ≫ prod.snd = 𝟙 Y ∧
      coprod.inl ≫ f ≫ prod.snd = 0 ∧ coprod.inr ≫ f ≫ prod.fst = 0 := sorry

end SymmSpectrum

namespace SHC

/-- Stable mapping-cone triangles give the pretriangulated structure on the stable homotopy category. -/
instance pretriangulated : Pretriangulated SHC.{u} := sorry
/-- Stable mapping-cone triangles satisfy the octahedral axiom. -/
instance isTriangulated : IsTriangulated SHC.{u} := sorry

end SHC

namespace SymmSpectrum

/-- The spectrum representing compatible equivariant bimorphisms. -/
def smash (X Y : SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

/-- The universal bimorphism `i_{p,q} : X_p ∧ Y_q → (X ∧ Y)_{p+q}` (Schwede I Construction 5.6). -/
def smash.ι (X Y : SymmSpectrum.{u}) (p q : ℕ) :
    SSet.Pointed.smash (X.level p) (Y.level q) ⟶ (smash X Y).level (p + q) := sorry

/-- Smash product is functorial covariantly in both spectrum maps. -/
def smash.map {X X' Y Y' : SymmSpectrum.{u}} (f : X ⟶ X') (g : Y ⟶ Y') : smash X Y ⟶ smash X' Y' := sorry
/-- The spectrum smash associator compares (X∧Y)∧Z with X∧(Y∧Z). -/
def smash.assoc (X Y Z : SymmSpectrum.{u}) : smash (smash X Y) Z ≅ smash X (smash Y Z) := sorry
/-- Smashing the sphere spectrum on the left is naturally isomorphic to the identity. -/
def smash.leftUnitor (X : SymmSpectrum.{u}) : smash sphere X ≅ X := sorry
/-- Smashing the sphere spectrum on the right is naturally isomorphic to the identity. -/
def smash.rightUnitor (X : SymmSpectrum.{u}) : smash X sphere ≅ X := sorry
/-- The symmetry isomorphism of the smash product. -/
def smash.twist (X Y : SymmSpectrum.{u}) : smash X Y ≅ smash Y X := sorry

/-- The full symmetric tensor coherence with unit S. -/
@[instance_reducible]
def monoidal : MonoidalCategory SymmSpectrum.{u} := sorry

/-- The closed right adjoint to −∧Y. -/
def internalHom (Y Z : SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

/-- Σ∞K∧Σ∞L≅Σ∞(K∧L). -/
def smash_suspensionSpectrum (K L : SSet.Pointed.{u}) :
    smash (suspensionSpectrum.obj K) (suspensionSpectrum.obj L) ≅
      suspensionSpectrum.obj (SSet.Pointed.smash K L) := sorry

/-- The simplicial mapping space, with composition and unit enrichment. -/
def mapSpace (X Y : SymmSpectrum.{u}) : SSet.{u} := sorry

/-- (Schwede I Theorem 6.16): `π_k X × π_l Y → π_{k+l}(X ∧ Y)`. -/
def piSmashPairing (X Y : SymmSpectrum.{u}) (k l : ℤ) : pi X k →+ pi Y l →+ pi (smash X Y) (k + l) := sorry

/-- `smash_sphere_left`: smash sphere X ≅ X (strict unit). -/
example (X : SymmSpectrum.{u}) : Nonempty (smash sphere X ≅ X) := sorry
/-- `smash_level_zero`: (smash X Y)_0 = X_0 ∧ Y_0. -/
example (X Y : SymmSpectrum.{u}) : Nonempty ((smash X Y).level 0 ≅ SSet.Pointed.smash (X.level 0) (Y.level 0)) := sorry
/-- `smash_suspension_compat`: smash (suspensionSpectrum S⁰) X ≅ X compatibly with the unit isomorphism. -/
example (X : SymmSpectrum.{u}) : Nonempty (smash (suspensionSpectrum.obj (SSet.Pointed.sphere 0)) X ≅ X) := sorry


/-- Flat replacements define the monoidal derived smash product on the stable homotopy category. -/
@[instance_reducible]
def _root_.TauCetiRoadmap.StableHomotopyKTheory.TauCeti.SHC.derivedSmash : MonoidalCategory SHC.{u} := sorry

/-- Derived smash has the symmetry induced by permuting spectrum smash factors. -/
@[instance_reducible]
def _root_.TauCetiRoadmap.StableHomotopyKTheory.TauCeti.SHC.derivedSmashSymmetric :
    letI := SHC.derivedSmash.{u}
    SymmetricCategory SHC.{u} := sorry

/-- The block-sphere identification in the derived tensor category. -/
def _root_.TauCetiRoadmap.StableHomotopyKTheory.TauCeti.SHC.sphereSmashIso (p q : ℤ) :
    letI := SHC.derivedSmash.{u}
    SHC.sphere (p + q) ≅ (SHC.sphere p ⊗ SHC.sphere q) := sorry

/-- `koszul_two_ones`: two degree-one factors have twist degree minus one. -/
example : letI := SHC.derivedSmash.{u}; letI := SHC.derivedSmashSymmetric.{u}
    (SHC.sphereSmashIso 1 1).hom ≫ (β_ (SHC.sphere 1) (SHC.sphere 1)).hom ≫
      (SHC.sphereSmashIso 1 1).inv = -(𝟙 (SHC.sphere (1 + 1))) := sorry

/-- A degree-zero factor contributes no twist sign. -/
example : letI := SHC.derivedSmash.{u}; letI := SHC.derivedSmashSymmetric.{u}
    (SHC.sphereSmashIso 0 1).hom ≫ (β_ (SHC.sphere 0) (SHC.sphere 1)).hom ≫
      (SHC.sphereSmashIso 1 0).inv = 𝟙 (SHC.sphere (0 + 1)) := sorry


/-- The derived smash product `γ X ∧ᴸ γ Y` in the stable homotopy category. -/
abbrev smashL (X Y : SymmSpectrum.{u}) : SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategoryStruct.tensorObj (SHC.γ.obj X) (SHC.γ.obj Y)

/-- the pairing into
`π_{p+q}(X ∧ᴸ Y) = [S^{p+q}, γ X ∧ᴸ γ Y]`. -/
def piPairing (X Y : SymmSpectrum.{u}) (p q : ℤ) :
    pi X p →+ pi Y q →+ (SHC.sphere (p + q) ⟶ smashL X Y) := sorry


/-- (Schwede II Proposition 5.22). -/
theorem piPairing_bottom_iso (X Y : SymmSpectrum.{u}) (k l : ℤ)
    (hX : ∀ i < k, Subsingleton (pi X i)) (hY : ∀ i < l, Subsingleton (pi Y i)) :
    ∃ φ : TensorProduct ℤ (pi X k) (pi Y l) ≃+ (SHC.sphere (k + l) ⟶ smashL X Y),
      ∀ x y, φ (TensorProduct.tmul ℤ x y) = piPairing X Y k l x y := sorry


end SymmSpectrum

/-- A monoid object for smash, with full unit/associativity laws. -/
structure SymmRingSpectrum : Type (u + 1) where
  carrier : SymmSpectrum.{u}
  mul : SymmSpectrum.smash carrier carrier ⟶ carrier
  unit : SymmSpectrum.sphere ⟶ carrier
  mul_assoc : SymmSpectrum.smash.map mul (𝟙 carrier) ≫ mul =
    (SymmSpectrum.smash.assoc carrier carrier carrier).hom ≫ SymmSpectrum.smash.map (𝟙 carrier) mul ≫ mul
  one_mul : SymmSpectrum.smash.map unit (𝟙 carrier) ≫ mul = (SymmSpectrum.smash.leftUnitor carrier).hom
  mul_one : SymmSpectrum.smash.map (𝟙 carrier) unit ≫ mul = (SymmSpectrum.smash.rightUnitor carrier).hom

namespace SymmRingSpectrum

/-- μ∘τ=μ. -/
def IsCommutative (R : SymmRingSpectrum.{u}) : Prop :=
  (SymmSpectrum.smash.twist R.carrier R.carrier).hom ≫ R.mul = R.mul

/-- Maps of ring spectra. -/
structure Hom (R S : SymmRingSpectrum.{u}) where
  f : R.carrier ⟶ S.carrier
  unit_comm : R.unit ≫ f = S.unit
  mul_comm : R.mul ≫ f = SymmSpectrum.smash.map f f ≫ S.mul

/-- Right modules: the action has order `M ∧ R → M`. -/
structure Module (R : SymmRingSpectrum.{u}) where
  carrier : SymmSpectrum.{u}
  act : SymmSpectrum.smash carrier R.carrier ⟶ carrier
  act_assoc : SymmSpectrum.smash.map act (𝟙 R.carrier) ≫ act =
    (SymmSpectrum.smash.assoc carrier R.carrier R.carrier).hom ≫ SymmSpectrum.smash.map (𝟙 carrier) R.mul ≫ act
  act_one : SymmSpectrum.smash.map (𝟙 carrier) R.unit ≫ act = (SymmSpectrum.smash.rightUnitor carrier).hom


/-- Equivalent coherent equivariant level multiplications and sphere-unit maps. -/
def levelMul (R : SymmRingSpectrum.{u}) (n m : ℕ) :
    SSet.Pointed.smash (R.carrier.level n) (R.carrier.level m) ⟶ R.carrier.level (n + m) :=
  SymmSpectrum.smash.ι R.carrier R.carrier n m ≫ R.mul.app (n + m)

/-- The graded ring π_*R from μ and the derived pairing; graded commutative for commutative R. -/
def piRing (R : SymmRingSpectrum.{u}) (p q : ℤ) :
    SymmSpectrum.pi R.carrier p →+ SymmSpectrum.pi R.carrier q →+ SymmSpectrum.pi R.carrier (p + q) := sorry

/-- The graded product is induced by the spectrum multiplication, not an independent bilinear map. -/
theorem piRing_apply (R : SymmRingSpectrum.{u}) (p q : ℤ)
    (x : SymmSpectrum.pi R.carrier p) (y : SymmSpectrum.pi R.carrier q) :
    R.piRing p q x y = SymmSpectrum.pi.map R.mul (p + q)
      (SymmSpectrum.piSmashPairing R.carrier R.carrier p q x y) := sorry

/-- The shifted zero sphere is identified with the original sphere spectrum. -/
def _root_.TauCetiRoadmap.StableHomotopyKTheory.TauCeti.SHC.sphereZeroIso :
    SHC.sphere.{u} 0 ≅ SHC.γ.obj SymmSpectrum.sphere := sorry

/-- The degree-zero sphere unit is the identity sphere map. -/
def _root_.TauCetiRoadmap.StableHomotopyKTheory.TauCeti.SymmSpectrum.sphereUnitClass :
    SymmSpectrum.pi SymmSpectrum.sphere.{u} 0 :=
  SHC.homSphereEquiv _ 0 SHC.sphereZeroIso.hom

/-- The additive group underlying π₀ of a ring spectrum is the existing stable homotopy group. -/
@[instance_reducible]
def pi0AddGroup (R : SymmRingSpectrum.{u}) : AddCommGroup (SymmSpectrum.pi R.carrier 0) :=
  inferInstance

/-- Degree-zero multiplication and unit from the graded homotopy ring. -/
instance pi0Ring (R : SymmRingSpectrum.{u}) : Ring (SymmSpectrum.pi R.carrier 0) := sorry

/-- Degree-zero ring addition is the homotopy-group addition. -/
theorem pi0Ring_toAddCommGroup (R : SymmRingSpectrum.{u}) :
    (pi0Ring R).toAddCommGroup = pi0AddGroup R := sorry

/-- The ring product in degree zero comes from the graded homotopy pairing. -/
theorem pi0Ring_mul (R : SymmRingSpectrum.{u}) (x y : SymmSpectrum.pi R.carrier 0) :
    x * y = R.piRing 0 0 x y := sorry

/-- The degree-zero ring unit is induced by the spectrum unit. -/
theorem pi0Ring_one (R : SymmRingSpectrum.{u}) :
    (1 : SymmSpectrum.pi R.carrier 0) = SymmSpectrum.pi.map R.unit 0 SymmSpectrum.sphereUnitClass := sorry

/-- The right degree-zero action comes from the spectrum's actual action map. -/
def Module.piZeroAction {R : SymmRingSpectrum.{u}} (M : R.Module)
    (x : SymmSpectrum.pi M.carrier 0) (r : SymmSpectrum.pi R.carrier 0) :
    SymmSpectrum.pi M.carrier 0 :=
  SymmSpectrum.pi.map M.act 0 (SymmSpectrum.piSmashPairing M.carrier R.carrier 0 0 x r)

end SymmRingSpectrum

/-- `sphere_initial_ring`: sphere is the initial symmetric ring spectrum. -/
example : ∃ S : SymmRingSpectrum.{u}, S.carrier = SymmSpectrum.sphere ∧
    ∀ R : SymmRingSpectrum.{u}, Nonempty (Unique (SymmRingSpectrum.Hom S R)) := sorry
/-- `ringSpectrum_trivial`: The trivial spectrum is a (zero) ring spectrum, terminal among ring spectra. -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : ∃ R : SymmRingSpectrum.{u}, R.carrier = Z ∧
    ∀ S : SymmRingSpectrum.{u}, Nonempty (Unique (SymmRingSpectrum.Hom S R)) := sorry


namespace SymmSpectrum

/-- HA has reduced-linearisation levels A[Sⁿ]. -/
def eilenbergMacLane (A : Type u) [AddCommGroup A] : SymmSpectrum.{u} := sorry

namespace eilenbergMacLane

/-- Homomorphisms give functorial additive HA→HB maps. -/
def map {A B : Type u} [AddCommGroup A] [AddCommGroup B] (φ : A →+ B) :
    eilenbergMacLane A ⟶ eilenbergMacLane B := sorry

/-- HA is Ω. -/
theorem isOmegaSpectrum (A : Type u) [AddCommGroup A] : IsOmegaSpectrum (eilenbergMacLane A) := sorry

/-- π₀HA≅A; πₖHA=0 for k≠0. -/
def piZeroEquiv (A : Type u) [AddCommGroup A] : pi (eilenbergMacLane A) 0 ≃+ A := sorry

/-- Positive level n realises to K(A,n); level zero is discrete A. -/
theorem level_kpi (A : Type u) [AddCommGroup A] (n : ℕ) :
    Nonempty (ContinuousMap.HomotopyEquiv (SSet.toTop.obj ((eilenbergMacLane A).level (n + 1)).right)
      (EilenbergMacLaneSpace A (n + 1))) := sorry

/-- (Schwede II Theorem 5.25). -/
theorem uniqueness (A : Type u) [AddCommGroup A] (X : SymmSpectrum.{u}) (hX : IsConnective X) :
    Nonempty ((SHC.γ.obj X ⟶ SHC.γ.obj (eilenbergMacLane A)) ≃ (pi X 0 →+ A)) := sorry

end eilenbergMacLane

/-- `isOmegaSpectrum_HA`: HA is an Ω-spectrum with naivePi (HA) 0 ≅ A. -/
example (A : Type u) [AddCommGroup A] : IsOmegaSpectrum (eilenbergMacLane A) :=
  eilenbergMacLane.isOmegaSpectrum A

/-- `eilenbergMacLane_zero`: eilenbergMacLane 0 is the trivial spectrum. -/
example : IsZero (SHC.γ.obj (eilenbergMacLane (PUnit.{u + 1}))) := sorry
/-- `eilenbergMacLane_pi_Z`: pi (eilenbergMacLane ℤ) 0 ≅ ℤ and pi (eilenbergMacLane ℤ) 1 = 0. -/
example : Nonempty (pi (eilenbergMacLane ℤ) 0 ≃+ ℤ) ∧ Subsingleton (pi (eilenbergMacLane ℤ) 1) := sorry
/-- `eilenbergMacLane_level_one`: |level 1 of eilenbergMacLane A| is homotopy equivalent to Group.classifyingSpace A (both K(A, 1)). -/
example (A : Type u) [AddCommGroup A] :
    Nonempty (ContinuousMap.HomotopyEquiv (SSet.toTop.obj ((eilenbergMacLane A).level 1).right)
      (Group.classifyingSpace (Multiplicative A))) := sorry
/-- `eilenbergMacLane_not_sphere`: eilenbergMacLane ℤ is not stably equivalent to the sphere spectrum: pi S 3 = ℤ/24 ≠ 0. -/
example : ¬ Nonempty (SHC.γ.obj (eilenbergMacLane ℤ) ≅ SHC.γ.obj (sphere.{0})) := sorry

/-- HR with its ring structure, underlying H(R,+). -/
def eilenbergMacLaneRing (R : Type u) [Ring R] : SymmRingSpectrum.{u} := sorry

/-- HR is commutative when R is. -/
theorem eilenbergMacLaneRing.isCommutative (R : Type u) [CommRing R] :
    (eilenbergMacLaneRing R).IsCommutative := sorry

/-- For Module Rᵐᵒᵖ M, HM is a right HR-module. -/
def eilenbergMacLaneModule (R : Type u) [Ring R] (M : Type u) [AddCommGroup M]
    [_root_.Module Rᵐᵒᵖ M] :
    (eilenbergMacLaneRing R).Module := sorry

/-- `eilenbergMacLaneModule_carrier` (compatibility). -/
def eilenbergMacLaneModule.carrierIso (R : Type u) [Ring R] (M : Type u)
    [AddCommGroup M] [_root_.Module Rᵐᵒᵖ M] :
    (eilenbergMacLaneModule R M).carrier ≅ eilenbergMacLane M := sorry

/-- π₀HR≅R as rings. -/
def eilenbergMacLaneRing.piRingEquiv (R : Type u) [Ring R] : pi (eilenbergMacLaneRing R).carrier 0 ≃+* R := sorry

/-- Degree-zero module homotopy identifies with its underlying additive module. -/
def eilenbergMacLaneModule.piZeroEquiv (R : Type u) [Ring R] (M : Type u)
    [AddCommGroup M] [_root_.Module Rᵐᵒᵖ M] :
    pi (eilenbergMacLaneModule R M).carrier 0 ≃+ M := sorry

/-- The degree-zero action follows the right-module order. -/
theorem eilenbergMacLaneModule.piZeroAction_eq (R : Type u) [Ring R] (M : Type u)
    [AddCommGroup M] [_root_.Module Rᵐᵒᵖ M]
    (x : pi (eilenbergMacLaneModule R M).carrier 0)
    (r : pi (eilenbergMacLaneRing R).carrier 0) :
    eilenbergMacLaneModule.piZeroEquiv R M
      ((eilenbergMacLaneModule R M).piZeroAction x r) =
      (MulOpposite.op (eilenbergMacLaneRing.piRingEquiv R r)) •
        eilenbergMacLaneModule.piZeroEquiv R M x := sorry

/-- `matrix_unit_order` and `eilenbergMacLaneModule_right_order`: e₁₂e₂₁=e₁₁ and e₂₁e₁₂=e₂₂ fix the regular right action. -/
example :
    (!![(0 : ℤ), 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ) * !![0, 0; 1, 0] = !![1, 0; 0, 0] ∧
    (!![(0 : ℤ), 0; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) * !![0, 1; 0, 0] = !![0, 0; 0, 1] := by decide

/-- `eilenbergMacLaneModule_zero`: The zero right R-module gives a stably zero HR-module spectrum. -/
example (R : Type u) [Ring R] (M : Type u) [AddCommGroup M]
    [_root_.Module Rᵐᵒᵖ M] [Subsingleton M] :
    IsZero (SHC.γ.obj (eilenbergMacLaneModule R M).carrier) := sorry


/-- `eilenbergMacLaneRing_Z_pi`: pi (eilenbergMacLaneRing ℤ) 0 ≃+* ℤ. -/
example : Nonempty (pi (eilenbergMacLaneRing ℤ).carrier 0 ≃+* ℤ) := ⟨eilenbergMacLaneRing.piRingEquiv ℤ⟩
/-- `eilenbergMacLaneRing_zero`: eilenbergMacLaneRing of the zero ring is the trivial ring spectrum. -/
example : IsZero (SHC.γ.obj (eilenbergMacLaneRing (PUnit.{u + 1})).carrier) := sorry


/-- `eilenbergMacLaneRing_smash_not_self`: HF₂ ∧ᴸ HF₂ is not HF₂: its π₁ is nonzero (the dual Steenrod algebra has ξ₁ in degree 1), so HR ∧ᴸ HR ≠ HR in general. -/
example : ¬ Subsingleton (SHC.sphere 1 ⟶ smashL (eilenbergMacLane (ZMod 2)) (eilenbergMacLane (ZMod 2))) := sorry

/-- The full complex-to-Hℤ-module functor; the Lean declaration records its underlying spectrum functor on cochains. -/
def eilenbergMacLaneComplex : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ ⥤ SymmSpectrum.{u} := sorry

namespace eilenbergMacLaneComplex

/-- `π_k(HC) ≅ H_k(C) = H^{-k}(C)`. -/
def piIso (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) (k : ℤ) :
    pi (eilenbergMacLaneComplex.obj C) k ≃+ C.homology (-k) := sorry

/-- Quasi-isomorphisms induce stable equivalences. -/
theorem quasiIso {C D : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ} (f : C ⟶ D) [QuasiIso f] :
    stableEquivalences (eilenbergMacLaneComplex.map f) := sorry

/-- Cochain shift [n] corresponds to stable suspension by n, with the stated integer-degree convention. -/
theorem shift (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((CategoryTheory.shiftFunctor _ (1 : ℤ)).obj C)) ≅
      SHC.γ.obj (susp.obj (eilenbergMacLaneComplex.obj C))) := sorry

/-- The spectrum of a complex concentrated in degree zero agrees with its Eilenberg–Mac Lane spectrum. -/
theorem single (A : Type u) [AddCommGroup A] [_root_.Module (ULift ℤ) A] :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((HomologicalComplex.single _ _ 0).obj
      (ModuleCat.of (ULift ℤ) A))) ≅ SHC.γ.obj (eilenbergMacLane A)) := sorry

end eilenbergMacLaneComplex

/-- `eilenbergMacLaneComplex_zero`: The zero complex goes to a stably trivial spectrum. -/
example (C : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ) (hC : IsZero C) :
    IsZero (SHC.γ.obj (eilenbergMacLaneComplex.obj C)) := sorry
/-- `eilenbergMacLaneComplex_single`: eilenbergMacLaneComplex (A concentrated in degree 0) is stably equivalent to eilenbergMacLane A. -/
example (A : Type u) [AddCommGroup A] [_root_.Module (ULift ℤ) A] :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((HomologicalComplex.single _ _ 0).obj
      (ModuleCat.of (ULift ℤ) A))) ≅ SHC.γ.obj (eilenbergMacLane A)) := eilenbergMacLaneComplex.single A

/-- `cochain_shift_witness`: Cochain shift [1] moves the nonzero group from cochain degree 2 to degree 1, hence from π₋₂ to π₋₁. -/
example : Nonempty (pi (eilenbergMacLaneComplex.{0}.obj
    ((CategoryTheory.shiftFunctor _ (1 : ℤ)).obj
      ((HomologicalComplex.single _ _ 2).obj (ModuleCat.of (ULift ℤ) (ULift ℤ)))))
    (-1) ≃+ ULift ℤ) := sorry

/-- `eilenbergMacLaneComplex_negative`: For C = ℤ concentrated in degree −2, pi (H C) (−2) ≅ ℤ: negative homotopy is retained. -/
example : Nonempty (pi (eilenbergMacLaneComplex.{0}.obj ((HomologicalComplex.single _ _ 2).obj
    (ModuleCat.of (ULift ℤ) (ULift ℤ)))) (-2) ≃+ ULift ℤ) := sorry


end SymmSpectrum

namespace SHC

/-- The n-connective-cover functor with counit X⟨n⟩→X. -/
def connectiveCover (n : ℤ) : SHC.{u} ⥤ SHC.{u} := sorry
/-- The n-connective cover has its natural map to the original spectrum. -/
def connectiveCover.counit (n : ℤ) : connectiveCover.{u} n ⟶ 𝟭 _ := sorry
/-- The n-Postnikov-section functor with unit X→PₙX. -/
def postnikovSection (n : ℤ) : SHC.{u} ⥤ SHC.{u} := sorry
/-- The original spectrum maps naturally to its degree-n Postnikov section. -/
def postnikovSection.unit (n : ℤ) : 𝟭 _ ⟶ postnikovSection.{u} n := sorry

/-- The distinguished triangle X⟨n+1⟩→X→PₙX→ΣX⟨n+1⟩. -/
def postnikovTriangle (n : ℤ) (X : SHC.{u}) : Pretriangulated.Triangle SHC.{u} :=
  Pretriangulated.Triangle.mk ((connectiveCover.counit (n + 1)).app X) ((postnikovSection.unit n).app X) sorry

/-- The connective cover, original spectrum and Postnikov section form a distinguished triangle. -/
theorem postnikovTriangle_distinguished (n : ℤ) (X : SHC.{u}) :
    postnikovTriangle n X ∈ distTriang SHC := sorry

open scoped ZeroObject in
/-- `triangle_rotation_identity`: Rotating the identity sphere triangle gives minus the suspended identity. -/
example : (Pretriangulated.Triangle.mk (𝟙 (sphere.{u} 0))
    (0 : sphere.{u} 0 ⟶ (0 : SHC.{u}))
    (0 : (0 : SHC.{u}) ⟶ (CategoryTheory.shiftFunctor SHC.{u} (1 : ℤ)).obj (sphere.{u} 0))).rotate.mor₃ =
    -(𝟙 ((CategoryTheory.shiftFunctor SHC.{u} (1 : ℤ)).obj (sphere.{u} 0))) := by
  change -(CategoryTheory.shiftFunctor SHC.{u} (1 : ℤ)).map (𝟙 (sphere.{u} 0)) = _
  rw [CategoryTheory.Functor.map_id]

/-- True homotopy groups of an object of `SHC`. -/
abbrev piObj (X : SHC.{u}) (k : ℤ) : Type (u + 1) := sphere k ⟶ X

/-- (Schwede II Proposition 5.21): every `(n-1)`-connected spectrum lies in
the smallest class containing `Sⁿ` and closed under sums and extensions to the right. -/
theorem connective_generation (n : ℤ) (P : SHC.{u} → Prop)
    (hiso : ∀ {X Y : SHC.{u}}, (X ≅ Y) → P X → P Y) (hS : P (sphere n))
    (hsum : ∀ (ι : Type u) (f : ι → SHC.{u}) [HasCoproduct f], (∀ i, P (f i)) → P (∐ f))
    (hext : ∀ T ∈ distTriang SHC.{u}, P T.obj₁ → P T.obj₂ → P T.obj₃)
    (X : SHC.{u}) (hX : ∀ k < n, Subsingleton (piObj X k)) : P X := sorry


/-- `π_k` commutes with products. -/
def piProdEquiv {J : Type u} (Y : J → SHC.{u}) (k : ℤ) : piObj (∏ᶜ Y) k ≃+ ∀ j, piObj (Y j) k := sorry

/-- πₖX⟨n⟩≅πₖX for k≥n; zero otherwise. -/
theorem pi_connectiveCover (n k : ℤ) (X : SHC.{u}) (hk : n ≤ k) :
    Nonempty (piObj ((connectiveCover n).obj X) k ≃+ piObj X k) := sorry
/-- πₖPₙX≅πₖX for k≤n; zero otherwise. -/
theorem pi_postnikovSection (n k : ℤ) (X : SHC.{u}) (hk : k ≤ n) :
    Nonempty (piObj ((postnikovSection n).obj X) k ≃+ piObj X k) := sorry

/-- The n-connective cover has no homotopy below n. -/
theorem pi_connectiveCover_vanishing (n k : ℤ) (X : SHC.{u}) (hk : k < n) :
    Subsingleton (piObj ((connectiveCover n).obj X) k) := sorry

/-- The nth Postnikov section has no homotopy above n. -/
theorem pi_postnikovSection_vanishing (n k : ℤ) (X : SHC.{u}) (hk : n < k) :
    Subsingleton (piObj ((postnikovSection n).obj X) k) := sorry

/-- The Postnikov t-structure, with heart equivalent to abelian groups. -/
def postnikovTStructure : Triangulated.TStructure SHC.{u} := sorry


end SHC

/-- `connectiveCover_connective`: For connective X, connectiveCover 0 X ≅ X. -/
example (X : SymmSpectrum.{u}) (hX : X.IsConnective) :
    IsIso ((SHC.connectiveCover.counit 0).app (SHC.γ.obj X)) := sorry
/-- `postnikovSection_zero_HA`: postnikovSection 0 (connectiveCover 0 X) ≅ eilenbergMacLane (pi X 0). -/
example (X : SymmSpectrum.{u}) :
    Nonempty ((SHC.postnikovSection 0).obj ((SHC.connectiveCover 0).obj (SHC.γ.obj X)) ≅
      SHC.γ.obj (SymmSpectrum.eilenbergMacLane (SymmSpectrum.pi X 0))) := sorry


/-- `connectiveCover_not_identity_negative`: For X = Σ^{−1} HZ, connectiveCover 0 X = 0 although X ≠ 0: covers erase negative homotopy. -/
example : IsZero ((SHC.connectiveCover 0).obj ((CategoryTheory.shiftFunctor SHC.{0} (-1 : ℤ)).obj
    (SHC.γ.obj (SymmSpectrum.eilenbergMacLane ℤ)))) := sorry

namespace SHC

/-- The telescope triangle for 1−shift on ⊕Xₙ, with the stage maps. -/
def hocolimSeq (X : ℕ ⥤ SHC.{u}) : SHC.{u} := sorry
/-- Each stage maps to the selected sequential homotopy colimit, compatibly with its transition. -/
def hocolimSeq.ι (X : ℕ ⥤ SHC.{u}) (n : ℕ) : X.obj n ⟶ hocolimSeq X := sorry


end SHC

namespace SHC

/-- Shift along the sequence on the direct sum of its stages. -/
def hocolimSeq.shift (X : ℕ ⥤ SHC.{u}) : (∐ fun n => X.obj n) ⟶ (∐ fun n => X.obj n) :=
  Sigma.desc fun n => X.map (homOfLE (Nat.le_succ n)) ≫ Sigma.ι (fun n => X.obj n) (n + 1)

/-- The telescope boundary to the suspension of the direct sum. -/
def hocolimSeq.δ (X : ℕ ⥤ SHC.{u}) :
    hocolimSeq X ⟶ (CategoryTheory.shiftFunctor SHC (1 : ℤ)).obj (∐ fun n => X.obj n) := sorry

/-- The telescope is a cofibre of identity minus shift, with the specified inclusions. -/
theorem hocolimSeq.triangle_distinguished (X : ℕ ⥤ SHC.{u}) :
    Pretriangulated.Triangle.mk (𝟙 _ - hocolimSeq.shift X)
      (Sigma.desc fun n => hocolimSeq.ι X n) (hocolimSeq.δ X) ∈ distTriang SHC := sorry

end SHC

/-- The model telescope represents this triangle. -/
def SymmSpectrum.telescope (X : ℕ ⥤ SymmSpectrum.{u}) : SymmSpectrum.{u} := sorry

/-- `hocolimSeq_const`: For the constant sequence with identity maps, hocolimSeq X ≅ X 0. -/
example (X : SHC.{u}) : Nonempty (SHC.hocolimSeq ((Functor.const ℕ).obj X) ≅ X) := sorry


/-- `hocolimSeq_pi_compat`: The colimit of pi agrees with pi of the point-set telescope. -/
example (X : ℕ ⥤ SymmSpectrum.{u}) : Nonempty (SHC.hocolimSeq (X ⋙ SHC.γ) ≅ SHC.γ.obj (SymmSpectrum.telescope X)) := sorry


/-! ## Layer 6: Assembly of the K-theory spectrum -/

end TauCeti

/-! ## Layer 7: Coefficients, completion and spectral sequences -/

namespace TauCeti.SHC

open CategoryTheory.Pretriangulated

/-- `S/m`, the cofibre of `m : S → S`. -/
def moore (m : ℕ) : SHC.{u} := sorry

namespace moore

/-- The defining distinguished triangle `S →m S → S/m →δ ΣS`. -/
def triangle (m : ℕ) : Triangle SHC.{u} :=
  Triangle.mk ((m : ℤ) • 𝟙 (sphere.{u} 0)) (sorry : sphere 0 ⟶ moore m) sorry

/-- The mod-m Moore spectrum belongs to the cone triangle of multiplication by m on the sphere. -/
theorem triangle_distinguished (m : ℕ) : triangle.{u} m ∈ distTriang SHC := sorry

/-- The triangle boundary S/m→ΣS. -/
def bockstein (m : ℕ) : moore.{u} m ⟶ (CategoryTheory.shiftFunctor SHC (1 : ℤ)).obj (sphere 0) :=
  (triangle m).mor₃


/-- π₀(S/m)≅ℤ/m and negative π vanish. -/
def piZero (m : ℕ) : piObj (moore.{u} m) 0 ≃+ ZMod m := sorry

/-- Every ℤ/m→ℤ/m′ lifts, without functorial choice; for m,m′>0 and odd m′ the lift is unique. -/
def liftHom {m m' : ℕ} (φ : ZMod m →+ ZMod m') : moore.{u} m ⟶ moore m' := sorry

/-- The lift induces the prescribed homomorphism under the π₀ comparisons. -/
theorem liftHom_piZero {m m' : ℕ} (φ : ZMod m →+ ZMod m') (x : piObj (moore.{u} m) 0) :
    piZero m' (x ≫ liftHom φ) = φ (piZero m x) := sorry

end moore

/-- `moore_one_trivial`: moore 1 is a zero object of SHC. -/
example : IsZero (moore.{u} 1) := sorry
/-- `moore_two_pi_two`: pi (moore 2) 2 ≅ ZMod 4, generated by a lift of η. -/
example : Nonempty (piObj (moore.{u} 2) 2 ≃+ ZMod 4) := sorry


/-- `moore_two_not_ring`: 2 • 𝟙 (moore 2) ≠ 0 in SHC, so S/2 admits no unital multiplication. -/
example : (2 : ℤ) • 𝟙 (moore.{u} 2) ≠ 0 := sorry

/-- `E/m := E ∧ᴸ S/m`, functorial in `E`; it is a cofibre of `m • 𝟙 E`
(`modM.triangle_distinguished`). -/
def modM (E : SHC.{u}) (m : ℕ) : SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorObj E (moore m)

namespace modM

/-- The coefficient triangle is E→ᵐE→E/m→ΣE. -/
def triangle (E : SHC.{u}) (m : ℕ) : Triangle SHC.{u} :=
  Triangle.mk ((m : ℤ) • 𝟙 E) (sorry : E ⟶ modM E m) sorry

/-- The coefficient triangle is distinguished for every integer modulus. -/
theorem triangle_distinguished (E : SHC.{u}) (m : ℕ) : triangle E m ∈ distTriang SHC := sorry

/-- The natural identification with derived smash. -/
def smashIso (E : SHC.{u}) (m : ℕ) : letI := SHC.derivedSmash.{u}
    modM E m ≅ MonoidalCategory.tensorObj E (moore m) := sorry

/-- For fixed m, an exact functor in E. -/
def functor (m : ℕ) : SHC.{u} ⥤ SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorRight (moore m)


end modM

/-- πₙ(E;ℤ/m)=πₙ(E/m). -/
abbrev piMod (E : SHC.{u}) (m : ℕ) (n : ℤ) : Type (u + 1) := piObj (modM E m) n

/-- `modM_one`: modM E 1 is a zero object. -/
example (E : SHC.{u}) : IsZero (modM E 1) := sorry
/-- `modM_HZ`: modM (eilenbergMacLane ℤ) m ≅ eilenbergMacLane (ZMod m). -/
example (m : ℕ) [NeZero m] : Nonempty (modM (γ.obj (SymmSpectrum.eilenbergMacLane.{0} ℤ)) m ≅
    γ.obj (SymmSpectrum.eilenbergMacLane (ZMod m))) := sorry
/-- `modM_smash_compat`: modM E m ≅ E ∧ᴸ moore m, so piMod (sphere) m 0 ≅ ZMod m. -/
example (m : ℕ) : Nonempty (piMod (sphere.{u} 0) m 0 ≃+ ZMod m) := sorry


/-- the triangle `E →m E → E/m → ΣE` is distinguished, so `π_*`
gives a long exact sequence (Mathlib's homological functor long exact sequences). -/
theorem bockstein_distinguished (E : SHC.{u}) (m : ℕ) : modM.triangle E m ∈ distTriang SHC :=
  modM.triangle_distinguished E m

/-- The Bockstein `π_n(E; ℤ/m) → π_{n-1}(E)`: composition with `(modM.triangle E m).mor₃ : E/m → ΣE`
followed by the shift identification `[S^n, ΣE] ≅ [S^{n-1}, E]`. -/
def piMod.bockstein (E : SHC.{u}) (m : ℕ) (n : ℤ) : piMod E m n →+ piObj E (n - 1) := sorry

/-- the universal coefficient sequence, stated for
`E = γ X` through the true homotopy groups of `X`. -/
theorem universalCoefficient (X : SymmSpectrum.{u}) (m : ℕ) (n : ℤ) :
    ∃ (i : TensorProduct ℤ (SymmSpectrum.pi X n) (ZMod m) →+ piMod (γ.obj X) m n)
      (j : piMod (γ.obj X) m n →+ AddSubgroup.torsionBy (SymmSpectrum.pi X (n - 1)) m),
      (∀ x : SymmSpectrum.pi X n, i (TensorProduct.tmul ℤ x 1) =
        (homSphereEquiv X n).symm x ≫ (modM.triangle (γ.obj X) m).mor₂) ∧
      (∀ y, (j y : SymmSpectrum.pi X (n - 1)) =
        homSphereEquiv X (n - 1) (piMod.bockstein (γ.obj X) m n y)) ∧
      Function.Injective i ∧ Function.Surjective j ∧ ∀ y, (∃ x, i x = y) ↔ j y = 0 := sorry

/-- for `m` odd or `4 ∣ m` the universal coefficient sequence splits (not naturally),
so `π_n(E; ℤ/m)` is abstractly the sum of its two outer terms. -/
theorem universalCoefficient_split (X : SymmSpectrum.{u}) (m : ℕ) (n : ℤ) (hm : Odd m ∨ 4 ∣ m) :
    Nonempty (piMod (γ.obj X) m n ≃+
      (TensorProduct ℤ (SymmSpectrum.pi X n) (ZMod m) × AddSubgroup.torsionBy (SymmSpectrum.pi X (n - 1)) m)) :=
  sorry

/-- `S/q₁q₂ ≅ S/q₁ ∨ S/q₂` for coprime `q₁, q₂`, stated on
mod-`q₁q₂` homotopy groups. -/
def moore.coprimeIso (q₁ q₂ : ℕ) (h : Nat.Coprime q₁ q₂) :
    (moore.{u} q₁ ⨿ moore q₂) ≅ moore (q₁ * q₂) := sorry

/-- `chinese_remainder_generators`: For coprime moduli 2 and 3, the two Chinese-remainder inclusions send 1 to 3 and 2 modulo 6. -/
example (x : piObj (moore.{0} 2) 0) (y : piObj (moore.{0} 3) 0)
    (hx : moore.piZero 2 x = 1) (hy : moore.piZero 3 y = 1) :
    moore.piZero 6 (x ≫ coprod.inl ≫ (moore.coprimeIso 2 3 (by decide)).hom) = 3 ∧
      moore.piZero 6 (y ≫ coprod.inr ≫ (moore.coprimeIso 2 3 (by decide)).hom) = 2 := sorry

/-- Coprime coefficient groups split as the product of the two prime-to-each-other coefficient groups. -/
theorem piMod_coprime (E : SHC.{u}) (q₁ q₂ : ℕ) (h : Nat.Coprime q₁ q₂) (n : ℤ) :
    Nonempty (piMod E (q₁ * q₂) n ≃+ piMod E q₁ n × piMod E q₂ n) := sorry

/-- S/pʳ→S/pʳ⁺¹ induces multiplication by p. -/
def moore.incl (p r : ℕ) : moore.{u} (p ^ r) ⟶ moore (p ^ (r + 1)) := sorry
/-- S/pʳ⁺¹→S/pʳ induces reduction. -/
def moore.reduce (p r : ℕ) : moore.{u} (p ^ (r + 1)) ⟶ moore (p ^ r) := sorry


/-- `transition_two`: the two coefficient maps induce their stated maps under the π₀ identifications. -/
example (x : piObj (moore.{0} 2) 0) (y : piObj (moore.{0} 4) 0)
    (hx : moore.piZero 2 x = 1) (hy : moore.piZero 4 y = 1) :
    moore.piZero 4 (x ≫ moore.incl 2 1) = 2 ∧
      moore.piZero 2 (y ≫ moore.reduce 2 1) = 1 := sorry

/-- The inclusion commutes with the connecting map with coefficient one. -/
theorem moore.incl_bockstein (p r : ℕ) :
    moore.incl p r ≫ moore.bockstein (p ^ (r + 1)) = moore.bockstein (p ^ r) := sorry

/-- Reduction multiplies the sphere boundary by p. -/
theorem moore.reduce_bockstein (p r : ℕ) :
    moore.reduce p r ≫ moore.bockstein (p ^ r) =
      moore.bockstein (p ^ (r + 1)) ≫ ((p : ℤ) • 𝟙 _) := sorry

/-- The inverse tower E/pʳ with reduction transitions. -/
def modTower (E : SHC.{u}) (p : ℕ) : ℕᵒᵖ ⥤ SHC.{u} := sorry


/-- The fibre triangle of 1−shift on ∏Xₙ and its projections. -/
def holimTower (X : ℕᵒᵖ ⥤ SHC.{u}) : SHC.{u} := sorry
/-- The selected homotopy limit projects compatibly to each tower stage. -/
def holimTower.π (X : ℕᵒᵖ ⥤ SHC.{u}) (n : ℕ) : holimTower X ⟶ X.obj (Opposite.op n) := sorry
/-- Choose a triangle-completion map compatible with projections; uniqueness/functoriality is asserted only for coherent models. -/
def holimTower.map {X Y : ℕᵒᵖ ⥤ SHC.{u}} (φ : X ⟶ Y) : holimTower X ⟶ holimTower Y := sorry
/-- Shift along a tower on the product of its terms. -/
def holimTower.shift (X : ℕᵒᵖ ⥤ SHC.{u}) :
    (∏ᶜ fun n => X.obj (Opposite.op n)) ⟶ (∏ᶜ fun n => X.obj (Opposite.op n)) :=
  Pi.lift fun n => Pi.π (fun n => X.obj (Opposite.op n)) (n + 1) ≫
    X.map (homOfLE (Nat.le_succ n)).op

/-- The product-fibre boundary of the homotopy limit. -/
def holimTower.δ (X : ℕᵒᵖ ⥤ SHC.{u}) :
    (∏ᶜ fun n => X.obj (Opposite.op n)) ⟶
      (CategoryTheory.shiftFunctor SHC (1 : ℤ)).obj (holimTower X) := sorry

/-- The limit and its projections form the fibre triangle of identity minus shift. -/
theorem holimTower.triangle_distinguished (X : ℕᵒᵖ ⥤ SHC.{u}) :
    Pretriangulated.Triangle.mk (Pi.lift fun n => holimTower.π X n)
      (𝟙 _ - holimTower.shift X) (holimTower.δ X) ∈ distTriang SHC := sorry

/-- A chosen comparison map commutes with each tower projection. -/
theorem holimTower.map_π {X Y : ℕᵒᵖ ⥤ SHC.{u}} (φ : X ⟶ Y) (n : ℕ) :
    holimTower.map φ ≫ holimTower.π Y n = holimTower.π X n ≫ φ.app (Opposite.op n) := sorry

/-- The identity-transition constant tower has holim≅X. -/
def holimTower.const (E : SHC.{u}) : holimTower ((Functor.const _).obj E) ≅ E := sorry

end TauCeti.SHC

/-- A stable-fibration tower of stably fibrant spectra has point-set limit representing holim. -/
def TauCeti.SymmSpectrum.towerLimit (X : ℕᵒᵖ ⥤ TauCeti.SymmSpectrum.{u}) : TauCeti.SymmSpectrum.{u} := sorry

namespace TauCeti.SHC

/-- `holimTower_const`: holimTower (constant tower at X, identity maps) ≅ X. -/
example (E : SHC.{u}) : Nonempty (holimTower ((Functor.const _).obj E) ≅ E) := ⟨holimTower.const E⟩
/-- `holimTower_zero_maps`: For a tower with all transition maps zero, lim and lim¹ of every tower π_k X_r vanish, so π_k(holimTower X) = 0 for all k and holimTower X ≅ 0 (via the Milnor exact sequence). -/
example (X : ℕᵒᵖ ⥤ SHC.{u}) (hX : ∀ n : ℕ, X.map (homOfLE (Nat.le_succ n)).op = 0) :
    IsZero (holimTower X) := sorry


/-- `0 → lim¹ π_{k+1} X_r → π_k holim → lim π_k X_r → 0` (lim¹ of towers is
ArithmeticGaloisDuality:R02.1's). Stated here as surjectivity onto compatible families. -/
theorem milnor_surjective (X : ℕᵒᵖ ⥤ SHC.{u}) (k : ℤ)
    (x : ∀ n, piObj (X.obj (Opposite.op n)) k)
    (hx : ∀ n, x (n + 1) ≫ X.map (homOfLE (Nat.le_succ n)).op = x n) :
    ∃ y : piObj (holimTower X) k, ∀ n, y ≫ holimTower.π X n = x n := sorry

/-- , Mittag-Leffler case: if the tower `π_{k+1} X_n` is Mittag-Leffler then
`lim¹ π_{k+1} X_n = 0`, so `π_k holim → lim π_k X_n` is injective. -/
theorem milnor_injective_of_isMittagLeffler (X : ℕᵒᵖ ⥤ SHC.{u}) (k : ℤ)
    (hML : (X ⋙ coyoneda.obj (Opposite.op (sphere.{u} (k + 1)))).IsMittagLeffler)
    (y y' : piObj (holimTower X) k) (h : ∀ n, y ≫ holimTower.π X n = y' ≫ holimTower.π X n) :
    y = y' := sorry

/-- The sphere tower with all transition maps given by multiplication by p. -/
def multiplicationTower (p : ℕ) : ℕᵒᵖ ⥤ SHC.{u} := sorry

/-- Every term of the multiplication tower is the zero sphere. -/
def multiplicationTower.objIso (p n : ℕ) :
    (multiplicationTower p).obj (Opposite.op n) ≅ sphere.{u} 0 := sorry

/-- The adjacent map is multiplication by p under the specified identifications. -/
theorem multiplicationTower.map_succ (p n : ℕ) :
    (multiplicationTower p).map (homOfLE (Nat.le_succ n)).op =
      (multiplicationTower.objIso p (n + 1)).hom ≫ ((p : ℤ) • 𝟙 _) ≫
        (multiplicationTower.objIso p n).inv := sorry

/-- The negative group of the multiplication tower is the p-adic quotient by the embedded integers. -/
def multiplicationTower.piNegativeEquiv (p : ℕ) [Fact p.Prime] :
    piObj (holimTower (multiplicationTower p)) (-1) ≃+
      PadicInt p ⧸ (Int.castAddHom (PadicInt p)).range := sorry

/-- The actual multiplication tower has nonzero negative homotopy in its limit. -/
example : (∀ n, Subsingleton (piObj ((multiplicationTower 2).obj (Opposite.op n)) (-1))) ∧
    ¬ Subsingleton (piObj (holimTower (multiplicationTower 2)) (-1)) := sorry

/-- the tower `⋯ →p S →p S` has `π_{-1}(holim) ≅ ℤ_p ⧸ ℤ ≠ 0`. -/
theorem nonzeroLimOne (p : ℕ) [Fact p.Prime] : ∃ X : ℕᵒᵖ ⥤ SHC.{u},
    (∀ n, Subsingleton (piObj (X.obj (Opposite.op n)) (-1))) ∧ ¬ Subsingleton (piObj (holimTower X) (-1)) := sorry

/-- `E^∧_p := F(S/p^∞, ΣE)` (internal Hom of the derived smash product, not a
declaration of this file); `pCompletion.isoHolim` identifies it with the homotopy limit of `E/pʳ`. -/
def pCompletion (p : ℕ) (E : SHC.{u}) : SHC.{u} := sorry

namespace pCompletion

/-- The canonical map, adjoint to `Id ∧ δ : E ∧ S/p^∞ → ΣE`. -/
def unit (p : ℕ) (E : SHC.{u}) : E ⟶ pCompletion p E := sorry
/-- The exact completion functor with its object comparison. -/
def functor (p : ℕ) : SHC.{u} ⥤ SHC.{u} := sorry
/-- The functorial coherent completion model agrees with the selected SHC homotopy-limit object. -/
def functorObjIso (p : ℕ) (E : SHC.{u}) : (functor p).obj E ≅ pCompletion p E := sorry
/-- The p-completion unit commutes with every map of spectra. -/
theorem unit_naturality (p : ℕ) {E F : SHC.{u}} (f : E ⟶ F) :
    f ≫ unit p F ≫ (functorObjIso p F).inv = unit p E ≫ (functorObjIso p E).inv ≫ (functor p).map f := sorry
/-- Schwede II Theorem 9.9(iii) and Remark 9.11. -/
def isoHolim (p : ℕ) (E : SHC.{u}) : pCompletion p E ≅ holimTower (modTower E p) := sorry

end pCompletion

/-- Its unit is invertible. -/
def IsPComplete (p : ℕ) (E : SHC.{u}) : Prop := IsIso (pCompletion.unit p E)

/-- For prime p, E^∧ₚ is complete. -/
theorem pCompletion.isPComplete (p : ℕ) [Fact p.Prime] (E : SHC.{u}) : IsPComplete p (pCompletion p E) := sorry

/-- `pCompletion_zero`: pCompletion p 0 = 0. -/
example (p : ℕ) (Z : SHC.{u}) (hZ : IsZero Z) : IsZero (pCompletion p Z) := sorry
/-- `pCompletion_sphere_pi0`: pi (pCompletion p sphere) 0 ≅ ℤ_p (PadicInt p). -/
example (p : ℕ) [Fact p.Prime] : Nonempty (piObj (pCompletion p (sphere.{0} 0)) 0 ≃+ ℤ_[p]) := sorry
/-- `pCompletion_HQ`: pCompletion p (eilenbergMacLane ℚ) = 0, since Ext(ℤ/p^∞, ℚ) = Hom(ℤ/p^∞, ℚ) = 0. -/
example (p : ℕ) [Fact p.Prime] : IsZero (pCompletion p (γ.obj (SymmSpectrum.eilenbergMacLane.{0} ℚ))) := sorry
/-- `pCompletion_not_tensor`: pi (pCompletion p (eilenbergMacLane (ℚ/ℤ))) 1 ≅ Hom(ℤ/p^∞, ℚ/ℤ) = ℤ_p (the Tate module), not π₁ ⊗ ℤ_p = 0: completion of homotopy groups is not tensoring with ℤ_p. -/
example (p : ℕ) [Fact p.Prime] : ¬ Subsingleton (piObj (pCompletion p
    (γ.obj (SymmSpectrum.eilenbergMacLane.{0} (ULift ℚ ⧸ (AddSubgroup.zmultiples (1 : ULift ℚ)))))) 1) := sorry


/-- for finitely generated homotopy groups, `π_k(E^∧_p) ≅ π_k E ⊗ ℤ_p`. -/
theorem completion_finiteType (p : ℕ) [Fact p.Prime] (X : SymmSpectrum.{u}) (k : ℤ)
    (hX : AddGroup.FG (SymmSpectrum.pi X k)) (hX' : AddGroup.FG (SymmSpectrum.pi X (k - 1))) :
    Nonempty (piObj (pCompletion p (γ.obj X)) k ≃+ TensorProduct ℤ (SymmSpectrum.pi X k) ℤ_[p]) := sorry

/-- bounded exponent. -/
theorem isPComplete_of_bounded (p N : ℕ) [Fact p.Prime] (X : SymmSpectrum.{u})
    (h : ∀ k (x : SymmSpectrum.pi X k), (p ^ N : ℕ) • x = 0) : IsPComplete p (γ.obj X) := sorry

/-- A quotient by a prime power is derived p-complete, including the trivial exponent-zero quotient. -/
theorem isPComplete_modPrimePower (p : ℕ) [Fact p.Prime] (r : ℕ) (E : SHC.{u}) :
    IsPComplete p (modM E (p ^ (r + 1))) := sorry

/-- cofibres (the other closure forms remain to be typed). -/
theorem isPComplete_triangle (p : ℕ) [Fact p.Prime] (T : Pretriangulated.Triangle SHC.{u})
    (hT : T ∈ distTriang SHC) (h₁ : IsPComplete p T.obj₁) (h₂ : IsPComplete p T.obj₂) :
    IsPComplete p T.obj₃ := sorry

/-- Homotopy limits of p-complete spectra are p-complete. -/
theorem isPComplete_holimTower (p : ℕ) [Fact p.Prime] (X : ℕᵒᵖ ⥤ SHC.{u})
    (h : ∀ n : ℕ, IsPComplete p (X.obj (Opposite.op n))) :
    IsPComplete p (holimTower X) := sorry

/-- A map between p-complete spectra is invertible exactly when its mod-p map is invertible. -/
theorem isPComplete_modP_iff_isIso (p : ℕ) [Fact p.Prime] {E E' : SHC.{u}}
    (hE : IsPComplete p E) (hE' : IsPComplete p E') (f : E ⟶ E') :
    IsIso ((modM.functor p).map f) ↔ IsIso f := sorry

/-- The diagram `S →1 S →2 S →3 ⋯`; its telescope is the rational sphere. -/
def rationalSphereDiagram : ℕ ⥤ SHC.{u} := sorry

/-- Every stage of the rational telescope is the sphere spectrum. -/
def rationalSphereDiagram.objIso (n : ℕ) : rationalSphereDiagram.obj n ≅ sphere.{u} 0 := sorry

/-- The map from stage n to stage n+1 is multiplication by n+1. -/
theorem rationalSphereDiagram.map_succ (n : ℕ) :
    (rationalSphereDiagram.objIso n).inv ≫ rationalSphereDiagram.map (homOfLE (Nat.le_succ n)) ≫
      (rationalSphereDiagram.objIso (n + 1)).hom = ((n + 1 : ℕ) : ℤ) • 𝟙 (sphere.{u} 0) := sorry

/-- The first rational telescope transition is identity, and the next is multiplication by two. -/
example : rationalSphereDiagram.map (homOfLE (Nat.le_succ 0)) =
    (rationalSphereDiagram.objIso 0).hom ≫ 𝟙 _ ≫ (rationalSphereDiagram.objIso 1).inv ∧
    rationalSphereDiagram.map (homOfLE (Nat.le_succ 1)) =
    (rationalSphereDiagram.objIso 1).hom ≫ ((2 : ℤ) • 𝟙 _) ≫ (rationalSphereDiagram.objIso 2).inv := sorry

/-- The rational sphere is the telescope with adjacent multipliers n+1 on the sphere. -/
def rationalSphere : SHC.{u} := hocolimSeq rationalSphereDiagram

/-- smash with the fixed rational-sphere telescope. -/
def rationalizationFunctor : SHC.{u} ⥤ SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorLeft rationalSphere
/-- Sℚ∧ᴸE with its natural unit. -/
def rationalization (E : SHC.{u}) : SHC.{u} := rationalizationFunctor.obj E
/-- The stage-zero inclusion defines the unit E→Eℚ of rationalisation. -/
def rationalization.unit (E : SHC.{u}) : E ⟶ rationalization E := sorry
/-- The unit square commutes for every f. -/
theorem rationalization.unit_natural {E E' : SHC.{u}} (f : E ⟶ E') :
    rationalization.unit E ≫ rationalizationFunctor.map f = f ≫ rationalization.unit E' := sorry
/-- πₖ(Eℚ)≅πₖE⊗ℚ. -/
theorem rationalization.pi (X : SymmSpectrum.{u}) (k : ℤ) :
    Nonempty (piObj (rationalization (γ.obj X)) k ≃+ TensorProduct ℤ (SymmSpectrum.pi X k) ℚ) := sorry
/-- Eℚ≅Hℚ∧ᴸE. -/
theorem rationalization.smashHQ (E : SHC.{u}) : letI := SHC.derivedSmash.{u}
    Nonempty (rationalization E ≅ MonoidalCategory.tensorObj (γ.obj (SymmSpectrum.eilenbergMacLane (ULift ℚ))) E) := sorry
/-- All πₖ are uniquely divisible↔the rationalisation unit is invertible. -/
def IsRational (E : SHC.{u}) : Prop := IsIso (rationalization.unit E)
/-- For rational T, precomposition by E→Eℚ gives SHC(Eℚ,T)≅SHC(E,T). -/
def rationalization.homEquiv (E T : SHC.{u}) (hT : IsRational T) :
    (rationalization E ⟶ T) ≃ (E ⟶ T) := sorry
/-- Precomposition with the rationalisation unit is the stated hom-set comparison for a rational target. -/
theorem rationalization.homEquiv_apply (E T : SHC.{u}) (hT : IsRational T)
    (f : rationalization E ⟶ T) :
    rationalization.homEquiv E T hT f = rationalization.unit E ≫ f := sorry
/-- a spectrum with uniquely divisible homotopy
groups is the product `∏_k Σ^k H(π_k X)` (Schwede II Theorem 9.6; using Serre stable-stem finiteness). -/
theorem rational_generalizedEM (X : SymmSpectrum.{u})
    (hX : ∀ (k : ℤ) (n : ℕ), n ≠ 0 → Function.Bijective (fun x : SymmSpectrum.pi X k => n • x)) :
    Nonempty (γ.obj X ≅ ∏ᶜ (fun k : ULift.{u} ℤ =>
      (CategoryTheory.shiftFunctor SHC.{u} k.down).obj
        (γ.obj (SymmSpectrum.eilenbergMacLane (SymmSpectrum.pi X k.down))))) := sorry

/-- `rationalization_zero`: rationalization 0 = 0. -/
example (Z : SHC.{u}) (hZ : IsZero Z) : IsZero (rationalization Z) := sorry
/-- `rationalization_sphere`: rationalization sphere ≅ eilenbergMacLane ℚ. -/
example : Nonempty (rationalization (sphere.{0} 0) ≅ γ.obj (SymmSpectrum.eilenbergMacLane ℚ)) := sorry
/-- `rationalization_pi_zero_sphere`: pi (rationalization sphere) 0 ≅ ℚ (colim of ℤ →1 ℤ →2 ℤ →3 ⋯). -/
example : Nonempty (piObj (rationalization (sphere.{0} 0)) 0 ≃+ ℚ) := sorry
/-- `rationalization_HZp`: rationalization (eilenbergMacLane (ZMod p)) = 0, matching (ℤ/p) ⊗ ℚ = 0. -/
example (p : ℕ) [Fact p.Prime] : IsZero (rationalization (γ.obj (SymmSpectrum.eilenbergMacLane.{0} (ZMod p)))) := sorry
/-- `rationalization_moore_zero`: rationalization (moore p) = 0 although moore p ≠ 0: rationalisation is not faithful on finite spectra. -/
example (p : ℕ) [Fact p.Prime] : IsZero (rationalization (moore.{u} p)) ∧ ¬ IsZero (moore.{u} p) := sorry


/-- A coherent integer filtration, represented by ℤ→SymmSpectrum. -/
structure FilteredSpectrum : Type (u + 1) where
  model : ℤ ⥤ SymmSpectrum.{u}

namespace FilteredSpectrum

/-- The SHC shadow; model-level maps retain the coherence needed for natural cofibres. -/
abbrev X (F : FilteredSpectrum.{u}) : ℤ ⥤ SHC.{u} := F.model ⋙ γ

/-- gr_s=cofib(X_s₋₁→X_s), with its triangle. -/
def gr (F : FilteredSpectrum.{u}) (s : ℤ) : SHC.{u} := sorry

/-- `colim_s π_*(F_s) → π_*(E)` is an isomorphism, for a cocone `c` on the filtration. -/
def IsExhaustive (F : FilteredSpectrum.{u}) (E : SHC.{u}) (c : ∀ s, F.X.obj s ⟶ E) : Prop :=
  (∀ s s' : ℤ, ∀ h : s ≤ s', F.X.map (homOfLE h) ≫ c s' = c s) ∧
  (∀ k : ℤ, ∀ y : piObj E k, ∃ s, ∃ x : piObj (F.X.obj s) k, x ≫ c s = y) ∧
  ∀ (k s : ℤ) (x : piObj (F.X.obj s) k), x ≫ c s = 0 →
    ∃ (s' : ℤ) (h : s ≤ s'), x ≫ F.X.map (homOfLE h) = 0

/-- X_s=0 for all sufficiently negative s. -/
def IsBoundedBelow (F : FilteredSpectrum.{u}) : Prop := ∃ s₀ : ℤ, ∀ s ≤ s₀, IsZero (F.X.obj s)

/-- The tower `n ↦ X_{-n}` along the filtration maps. -/
def negTower (F : FilteredSpectrum.{u}) : ℕᵒᵖ ⥤ SHC.{u} := sorry

/-- The negative-direction holim is zero. -/
def IsComplete (F : FilteredSpectrum.{u}) : Prop := IsZero (holimTower (negTower F))

/-- Coherent relative cofibres form a spectral object, satisfying all identities and invariant under replacement. -/
def toSpectralObject (F : FilteredSpectrum.{u}) : Triangulated.SpectralObject SHC.{u} ℤ := sorry

/-- `filteredSpectrum_const`: The constant filtration X s = X has gr = 0 and is exhaustive but not complete (unless X = 0). -/
example (E : SymmSpectrum.{u}) (s : ℤ) : IsZero (gr ⟨(Functor.const ℤ).obj E⟩ s) := sorry


/-- `filteredSpectrum_complete_not_exhaustive`: The zero filtration of nonzero E is complete but not exhaustive. The constant E filtration is exhaustive but not complete. -/
example (E : SymmSpectrum.{u}) (hE : ¬ IsZero (γ.obj E)) :
    ¬ IsComplete ⟨(Functor.const ℤ).obj E⟩ := sorry

/-- `filteredSpectrum_complete_not_exhaustive`: The zero filtration of nonzero E is complete but not exhaustive. The constant E filtration is exhaustive but not complete. -/
example (Z E : SymmSpectrum.{u}) (hZ : IsZero (γ.obj Z)) (hE : ¬ IsZero (γ.obj E)) :
    let F : FilteredSpectrum.{u} := ⟨(Functor.const ℤ).obj Z⟩
    F.IsComplete ∧ ¬ F.IsExhaustive (γ.obj E) (fun _ => 0) := sorry

end FilteredSpectrum

end TauCeti.SHC

namespace TauCeti

/-- a bigraded exact couple with `i : D_{pq} → D_{pq+a}`, `j : D_{pq} → E_{pq+b}`,
`k : E_{pq} → D_{pq+c}`, exact at each vertex. The couple of a filtered spectrum has
`a = (1, -1)`, `b = (0, 0)`, `c = (-1, 0)`. -/
structure ExactCouple (a b c : ℤ × ℤ) : Type (u + 1) where
  D : ℤ × ℤ → ModuleCat.{u} ℤ
  E : ℤ × ℤ → ModuleCat.{u} ℤ
  i : ∀ pq : ℤ × ℤ, D pq ⟶ D (pq + a)
  j : ∀ pq : ℤ × ℤ, D pq ⟶ E (pq + b)
  k : ∀ pq : ℤ × ℤ, E pq ⟶ D (pq + c)
  exact_D : ∀ (pq : ℤ × ℤ) (x : D (pq + a)), (j (pq + a)).hom x = 0 ↔ ∃ y, (i pq).hom y = x
  exact_E : ∀ (pq : ℤ × ℤ) (x : E (pq + b)), (k (pq + b)).hom x = 0 ↔ ∃ y, (j pq).hom y = x
  exact_D' : ∀ (pq : ℤ × ℤ) (x : D (pq + c)), (i (pq + c)).hom x = 0 ↔ ∃ y, (k pq).hom y = x

namespace ExactCouple

variable {a b c : ℤ × ℤ}

/-- The derived couple: `D' = im i`, `E' = ker (j ∘ k) / im (j ∘ k)`; the bidegree of `j` drops by `a`. -/
def derived (C : ExactCouple.{u} a b c) : ExactCouple.{u} a (b - a) c := sorry

/-- The `n`-fold derived couple. -/
def derivedN (C : ExactCouple.{u} a b c) (n : ℕ) : ExactCouple.{u} a (b - (n : ℤ) • a) c := sorry

/-- The page `E^r_{pq}`, `r ≥ 1` (`E¹ = C.E`). -/
def page (C : ExactCouple.{u} a b c) (r : ℕ) (pq : ℤ × ℤ) : ModuleCat.{u} ℤ :=
  (C.derivedN (r - 1)).E pq

/-- For the standard bidegrees, `d_r = j ∘ k` on page `r` has bidegree `(-r, r - 1)`. -/
def toSpectralSequence (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0)) :
    SpectralSequence (ModuleCat.{u} ℤ) (fun r => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

/-- For a two-stage filtration, `D_(p,q) = π_(p+q) X_p` and
`E_(p,q) = π_(p+q) gr_p`. Thus `d₁ : E_(1,n) → E_(0,n)` is the connecting map
`π_(n+1) gr₁ → π_n X₀`, with the sign of the defining distinguished triangle. -/
def twoStageBoundary (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0)) (n : ℤ) :
    C.E (1, n) ⟶ C.E (0, n) := by
  simpa using C.k (1, n) ≫ C.j ((1, n) + (-1, 0))

/-- The map induced by `i_(0,n)` after identifying `D_(0,n)` with `E_(0,n)` via `j`;
the lower-column vanishing supplies that identification. -/
def twoStageCokernelIncl (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0))
    (hD : ∀ (p q : ℤ), p < 0 → IsZero (C.D (p, q))) (n : ℤ) :
    cokernel (C.twoStageBoundary n) ⟶ C.D (1, n - 1) := sorry

/-- The map induced by `j_(1,n−1)`, factored through the kernel of the next boundary. -/
def twoStageKernelProj (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0))
    (hD : ∀ (p q : ℤ), p < 0 → IsZero (C.D (p, q))) (n : ℤ) :
    C.D (1, n - 1) ⟶ kernel (C.twoStageBoundary (n - 1)) := sorry

/-- The two-stage extension has specified kernel/cokernel terms and the actual `D` abutment.
No splitting is chosen or asserted. -/
def twoStageExtension (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0))
    (hD : ∀ (p q : ℤ), p < 0 → IsZero (C.D (p, q))) (n : ℤ) :
    ShortComplex (ModuleCat.{u} ℤ) :=
  ShortComplex.mk (C.twoStageCokernelIncl hD n) (C.twoStageKernelProj hD n) (by sorry)

/-- `exactCouple_zero_E`: For any bidegrees and an exact couple with every E(p,q) zero, every i(p,q) is an isomorphism and every page at every bidegree is zero. -/
example (C : ExactCouple.{u} a b c) (hE : ∀ pq, IsZero (C.E pq)) :
    (∀ pq, IsIso (C.i pq)) ∧ ∀ (r : ℕ) (pq : ℤ × ℤ), IsZero (C.page r pq) := sorry

/-- `exactCouple_two_stage`: With D=0 for p<0 and E supported in columns 0,1, pages r≥2 equal E². The abutment is the unsplit extension 0→coker δₙ→D(1,n−1)→ker δₙ₋₁→0; for X₀→X₁=X use δ:πₙ₊₁gr₁→πₙX₀. -/
example (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0))
    (hD : ∀ (p q : ℤ), p < 0 → IsZero (C.D (p, q)))
    (hE : ∀ (p q : ℤ), p ≠ 0 → p ≠ 1 → IsZero (C.E (p, q))) (n : ℤ) :
    (∀ r : ℕ, 2 ≤ r → ∀ pq, Nonempty (C.page r pq ≅ C.page 2 pq)) ∧
      (C.twoStageExtension hD n).ShortExact := sorry

/-- A constant ℤ² couple with projection, coordinate transfer, and complementary projection. -/
def tupleCouple : ExactCouple.{0} (0, 0) (0, 0) (0, 0) where
  D _ := ModuleCat.of ℤ (ℤ × ℤ)
  E _ := ModuleCat.of ℤ (ℤ × ℤ)
  i _ := ModuleCat.ofHom ((LinearMap.fst ℤ ℤ ℤ).prod (0 : (ℤ × ℤ) →ₗ[ℤ] ℤ))
  j _ := ModuleCat.ofHom ((LinearMap.snd ℤ ℤ ℤ).prod (0 : (ℤ × ℤ) →ₗ[ℤ] ℤ))
  k _ := ModuleCat.ofHom ((0 : (ℤ × ℤ) →ₗ[ℤ] ℤ).prod (LinearMap.snd ℤ ℤ ℤ))
  exact_D := by sorry
  exact_E := by sorry
  exact_D' := by sorry

/-- `exact_idempotent`: on (1,0), i and i² are both (1,0), so exactness does not imply i²=0. -/
example : (tupleCouple.i (0, 0)).hom (1, 0) = (1, 0) ∧
    (tupleCouple.i (0, 0) ≫ tupleCouple.i (0, 0)).hom (1, 0) = (1, 0) ∧
    (tupleCouple.i (0, 0) ≫ tupleCouple.i (0, 0)).hom (1, 0) ≠ 0 := by
  change ((1 : ℤ), 0) = (1, 0) ∧ ((1 : ℤ), 0) = (1, 0) ∧ ((1 : ℤ), 0) ≠ (0, 0)
  norm_num

/-- `exactCouple_not_complex`: The constant tuple couple i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y) is exact. j∘k=0, but i²=i and i²(1,0)=(1,0). -/
example : ∃ C : ExactCouple.{0} (0, 0) (0, 0) (0, 0),
    C.i (0, 0) ≫ C.i ((0, 0) + (0, 0)) ≠ 0 := sorry

end ExactCouple

namespace SHC.FilteredSpectrum

/-- D_s,t=π_s₊tX_s; E_s,t=π_s₊tgr_s, with degrees (1,−1),(0,0),(−1,0). -/
def exactCouple (F : FilteredSpectrum.{u}) : ExactCouple.{u + 1} (1, -1) (0, 0) (-1, 0) := sorry

/-- The spectral sequence with E¹_s,t=π_s₊t(gr_s). -/
def spectralSequence (F : FilteredSpectrum.{u}) :
    SpectralSequence (ModuleCat.{u + 1} ℤ) (fun r => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

/-- The `E¹` homological data core with `d_r` of bidegree `(-r, r - 1)` for spectral objects indexed by
`EInt`. -/
def coreE₁Homological : CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore EInt
    (fun r : ℤ => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry


/-- A strict filtered-model transformation gives a spectral-sequence map, invariant under stable replacement. -/
def spectralSequence.map {F G : FilteredSpectrum.{u}} (φ : F.model ⟶ G.model) :
    (spectralSequence F).Hom (spectralSequence G) := sorry

/-- The image filtration F_sπₙE=im(πₙX_s→πₙE) for an exhaustive target cocone. -/
def abutmentFiltration (F : FilteredSpectrum.{u}) (E : SHC.{u}) (c : ∀ s, F.X.obj s ⟶ E) (s k : ℤ) :
    AddSubgroup (SHC.piObj E k) := AddMonoidHom.range (Preadditive.rightComp (SHC.sphere k) (c s))

end SHC.FilteredSpectrum


end TauCeti

end

end TauCetiRoadmap.StableHomotopyKTheory

/-
Full reader interfaces and checks without declarations under these names:

Layer 1:
`toTop_boundary_arrowIso_diskBoundaryInclusion`, `classifyingSpace_opHomeomorph`,
`classifyingSpace_prodMap`, `classifyingSpace_prodHomeomorph_k`, `CGWH`, `CGWH.cartesianClosed`,
`CGWH.limits`, `CGWH.closedPushout`, `cgwh_compact_factor`, `cgwh_mapping_point`, `cgwh_closed_pushout`,
`classifyingSpace_homotopyEquiv_of_adjunction`, `nerve_filteredColimitIso`,
`classifyingSpace_filteredColimit_pi`, `classifyingSpace_filteredColimit_homotopyEquiv`,
`classifyingSpace_contractible_of_filtered`, `classifyingSpace_filteredColimit_homology`,
`classifyingSpace_pi0Equiv`, `toTop_isCoveringMap`, `classifyingSpace_coveringEquivalence`,
`classifyingSpace_fundamentalGroupoidEquivalence`, `classifyingSpace_pi1Presentation`,
`classifyingSpace_localSystemEquivalence`, `categoryHomology_derivedColimit`,
`categoryModule_projectiveResolutions`, `classifyingSpace_twistedCellularChainIso`, `twistedExcision`,
`twistedCellularSingularComparison`, `twisted_circle`, `twisted_point`, `twisted_constant`,
`classifyingSpace_homologyIso_categoryHomology`, `translationCategory_covering`,
`translationCategory_subgroupComparison`, `groupNerve_barChainIso`, `nerve_groupoid_isKan`,
`classifyingSpace_groupoid_oneType`, `realisation_boundary_inclusion_disk`,
`classifyingSpace_covering_classification`.

Layer 2:
`IsHurewiczFibration.comp`, `pullback`, `isSerreFibration`, `hurewicz_identity`, `hurewicz_projection`,
`hurewicz_endpoint`, `serreFibration_relativeHomotopy_bijective`, `relativeDiskLift`,
`homotopyFiber.connecting_naturality`, `homotopyFiber.connecting_eq_loopShift`,
`connecting_basepointChange`, `connecting_not_hom_degree_zero`, `homotopyFiber.connecting_transport`,
`transport_loopSpace`, `transport_not_identity_onPi0`, `IsHomotopyCartesianOfHomotopy`,
`not_isHomotopyCartesian_strictFiber`, `commaToHomotopyFiber_subgroup`, `commaToHomotopyFiber_fiber_compat`,
`IsQuasiFibration.longExactSequence`, `IsQuasiFibration.iff_relative`,
`isQuasiFibration_mappingCylinder_iff`, `open_cover_intersection`, `BisimplicialSet.diagonalRealizationIso`,
`SimplicialSpace.realization_finiteLimits`, `closedHEP.gluingLemma`, `closedHEP.pushoutProduct`,
`SimplicialSpace.realization_weakEquiv`, `realization_fibreSequence_connected`,
`bisimplicialFibreSequence_piStarKan`, `PiStarKan`, `hocolim_ne_colim_span`,
`SimplicialSpace.realization_hocolimEquiv`, `replacementAugmentation`,
`SpaceDiagram.hocolim_to_classifyingSpace`, `thomasonMap`, `functorHomologySpectralSequence`,
`prefibred_comma_adjunction`, `quillenTheoremA_prefibred`, `quillenTheoremB_prefibred`, `gluingLemma`,
`IsHCofibration.pushoutProduct`.

Layer 3:
`IsAcyclicMap.iff_homology`, `perfect_ker`, `regularCover_twistedChainIso`, `serreComparison_fibre`,
`plusConstruction_not_unique_on_nose`, `plusConstruction.localHomology_iso`, `mapClassesEquiv`,
`relativeHurewicz_of_trivialAction`, `covering_relativeHomotopyEquiv`, `relative_cover_identity`,
`relative_cover_disconnected_preimage`, `relative_cover_boundary`, `principalFibrationCriterion`,
`postnikovTower_limit_isWeakHomotopyEquivalence`, `cohomologyRepresentability`, `postnikovTower`,
`principalFibration_extensionObstruction`, `twistedExtensionObstruction`, `twisted_obstruction_trivial`,
`twisted_obstruction_circle`, `twisted_obstruction_identity_pair`, `abelianExtension`, `obstruction_shift`,
`IsPlusConstruction.lift`, `plusExtensionObstructionVanish`, `IsPlusConstruction.unique`,
`IsPlusConstruction.map`, `plusFunctorialModel`, `plusGroup_piTwo`, `plusGroup_fibreUCE`,
`UniversalCentralExtension`, `uce.lift`, `uce.lift_unique`, `uce.kernelH2`, `uce.source_superperfect`,
`uce.map_kernelH2`, `uce_trivial`, `uce_nonperfect`, `uce_superperfect`, `plusGroup_piTwo_naturality`,
`plusFibreSequence`, `SerreClass`, `serreClass_abelianSpace`, `rationalHurewicz_hSpace`,
`multiplicativeSerreSequence`, `rationalEMCohomology`, `rational_em_one`, `rational_em_two`,
`serre_product_point`, `relative_hurewicz_trivial_action`, `principal_fibration_criterion`,
`plus_pi2_natural`, `EilenbergMacLaneSpace.mapClassesEquiv`.

Layer 4:
`core_finset_pi0`, `core_projective_symmetry_not_id`, `core_isoClasses_splitK0`, `SInvS_no_natural_inverse`,
`actionCategory_nat_telescope`, `actionCategory_monoid_set`, `rank_difference`,
`IsGroupCompletion.pi0Equiv`, `IsGroupCompletion.homologyLocalization`,
`IsGroupCompletion.basepointComponent`, `isGroupCompletion_N_to_Z`, `isGroupCompletion_pi0_compat`,
`not_isGroupCompletion_pi0_only`, `quillenGroupCompletion`, `SInvS.fibration`,
`stableGeneralLinearGroup.of`, `stableGeneralLinearGroup.of_stabilise`, `stableGeneralLinearGroup.blockSum`,
`stableElementaryGroup.perfect`, `stableElementaryGroup.eq_commutator`, `stable_gl_rank_zero`,
`stable_gl_field`, `elementary_two_not_perfect`, `kSpace_basedFree_plus`, `telescope_isAcyclicMap`,
`kSpace_cofinal_plus`, `stableAutomorphism_commutatorPerfect`, `kSpace_projective_plus`, `IsVerySpecial`,
`segalSpectrum`, `segalGammaSpace_finset_sphere`, `segalGammaSpace_not_without_sums`,
`symmetricTensorCoherence`, `coherentSubset_vect_pi0`, `coherentSubset_naive_not_functor`,
`symmetric_coherence_three`, `symmetric_coherence_inverse`, `symmetric_coherence_unit`,
`GammaSpace.delooping`, `GammaSpace.groupCompletion`, `groupCompletionAdjunction`,
`coherentSubsetGammaSpace.isVerySpecial_iff_picard`, `classicalGrothendieckWittComparison`,
`topologicalKComparison`, `topologicalVariant_pi0_K`, `topologicalVariant_not_discrete_K1`, `bottComplex`,
`bottReal`, `bott_complex_coefficients`, `bott_real_coefficients`, `bott_connective`, `BasedFree.toProj`,
`IsGroupCompletion.abelianUnitComponent`.

Layer 5:
`SSet.Pointed.toTop_smash`, `level`, `symmSpectrum_not_sequential`, `naivePi_not_true_pi`,
`naivePi_omegaSpectrum_compat`, `naivePi_suspension`, `kan_quillen_point`, `homSuspensionSpectrumEquiv`,
`SHC_hom_sphere_HA`, `smash.desc`, `smash_twist_sphere_sign`, `flat_sphere`, `flat_truncated_sphere`,
`flat_zero`, `piPairing_assoc`, `piPairing_comm`, `piPairing_unit`, `piPairing_naturality`,
`piPairing_comp_psi`, `piPairing_sphere_ring`, `piPairing_sphere_unit`, `piPairing_iota_iota`,
`piPairing_not_commutative`, `ringSpectrum_HZ_pi`, `ringSpectrum_moore_two_not_ring`,
`SymmRingSpectrum.Module.stableModelCategory`, `SymmRingSpectrum.Module.HomotopyCategory`,
`SymmRingSpectrum.Module.freeAdj`, `moduleSpectra_sphere`, `moduleSpectra_free_hom`,
`moduleSpectra_forget_compat`, `moduleSpectra_not_level`, `operadPositiveModel`, `operadRectification`,
`Operad`, `Operad.Algebra`, `Operad.ofSSet`, `Operad.comAlgebraEquiv`, `Operad.IsEInfty`,
`operad_com_algebra_HR`, `operad_trivial_algebra`, `operad_ass_ring_compat`, `operad_moore_two_not_A2`,
`operad_unit`, `operad_comm`, `operad_rectification`, `isSemistable_HA`, `simplicialAbelian_isKan`,
`simplicialAbelian_piNormalized`, `reducedFree_normalizedSphere`, `simplicial_abelian_constant`,
`simplicial_abelian_shift`, `normalized_smash_sphere`, `eilenbergMacLaneRing_unit_compat`,
`eilenbergMacLaneModule_carrier`, `complexProjectiveModel`, `simplicialModuleStableModel`,
`HRModDerivedEquiv`, `eilenbergMacLaneComplex_sees_differential`, `complex_model_zero`,
`complex_model_acyclic`, `complex_model_unbounded`, `eilenbergMacLaneSmashHomology`, `connectiveCover_adj`,
`connectiveCover_wedge_example`, `hocolimSeq_pi`, `hocolimSeq_milnor`, `hocolimSeq_mul_rational`,
`hocolimSeq_not_sum`, `sequentialStableModel`, `symmetrisationQuillenEquivalence`,
`spectraInfinityCategory`, `spectra_infinity_zero`, `spectra_infinity_cofibre`, `spectra_infinity_unit`,
`picard_discrete_group`, `picard_one_object`, `picard_self_braiding`, `SymmSpectrum.Operad`,
`SymmSpectrum.Bimorphism`, `toTop_smash`, `HA`.

Layer 6:
`WaldhausenCategory.kSpectrum`, `WaldhausenCategory.kSpectrum.map`,
`WaldhausenCategory.kSpectrum.level_zero`, `WaldhausenCategory.kSpectrum.sequentialComparison`,
`kSpectrum_zero_category`, `kSpectrum_finiteSets_sphere`, `kSpectrum_pi0_K0`,
`kSpectrum_level_zero_not_groupCompleted`, `WaldhausenCategory.zero`, `cof_pushout`, `weak_gluing`,
`ExactFunctor.comp`, `S.obj`, `S.face`, `S.degeneracy`, `S.oneEquiv`, `S.twoEquiv`, `waldhausen_zero`,
`s_zero_one`, `s_two_quotient`, `exact_composition`, `exact_not_cofibrations`,
`WaldhausenCategory.kSpectrum.isPositiveOmega`, `WaldhausenCategory.kSpectrum.isSemistable`, `kSpectrum`,
`kSpectrum.isPositiveOmega`, `kSpectrum.map_stableEquivalence`, `WaldhausenCategory`,
`WaldhausenCategory.sConstruction`, `WaldhausenCategory.additivity`,
`WaldhausenCategory.relativeSDelooping`.

Layer 7:
`moore.homologyZero`, `moore_homology_compat`, `moore_zero_extended`, `freudenthalSuspension`,
`sphere_firstStems`, `modTwoSquares`, `mooreTwo_piTwo`, `hopf_order_two`, `moore_two_order_four`,
`square_cp_two`, `modM.HA`, `modM_not_tensor`, `modTower.uct`, `moore_incl_H0`, `moore_reduce_H0`,
`modTower_HZ`, `moore_incl_not_unique_p2`, `holimTower_point_set_compat`, `holimTower_not_lim_pi`,
`abelianTower.difference`, `abelianTower.limitKernel`, `abelianTower.limOneCokernel`,
`abelianTower.sixTermExact`, `abelianTower.limOne_eq_zero_of_ML`, `tower_identity`, `tower_zero_maps`,
`tower_surjective`, `multiplicationTower.limOneEquiv`, `generalMoore.mappingUCT`, `general_moore_zero`,
`general_moore_free`, `general_moore_two`, `completionZEquiv`, `completion_integer_one`, `completion_mod_p`,
`completion_other_prime`, `torsion_bound_two`, `telescope_first_map`, `FilteredSpectrum.replace`,
`relativeCofibreSpectralObject`, `filteredSpectrum_postnikov_gr`, `filteredSpectrum_spectralObject_compat`,
`FilteredSpectrum.spectralSequence.E1`, `spectralSequence_trivial`, `spectralSequence_single_step`,
`spectralSequence_compat_exactCouple`, `spectralSequence_E2_not_abutment`, `p_complete_criteria`,
`spectral_sequence_convergence_exhaustive`, `spectral_sequence_convergence_complete`,
`spectral_sequence_conditional_convergence`, `atiyah_hirzebruch_spectral_sequence`,
`moore_spectrum_multiplication`, `burklund_quotient_tower`, `browder_scholium_mod_products`,
`burklund_moore_multiplicative`, `homologyZero`, `spectralSequence.E1`.
-/
