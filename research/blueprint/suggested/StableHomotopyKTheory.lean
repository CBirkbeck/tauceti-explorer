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
import Mathlib.Topology.Homotopy.LocallyContractible
import Mathlib.Analysis.Complex.Circle
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.Topology.CWComplex.Classical.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Monoidal.Skeleton
import Mathlib.CategoryTheory.Monoidal.Action.Basic
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.CategoryTheory.Action
import Mathlib.CategoryTheory.ConnectedComponents
import Mathlib.CategoryTheory.Groupoid.FreeGroupoidOfCategory
import Mathlib.GroupTheory.FreeGroup.NielsenSchreier
import Mathlib.CategoryTheory.Abelian.LeftDerived
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
import Mathlib.Algebra.Homology.SpectralObject.HasSpectralSequence
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Topology.Compactness.CompactlyGeneratedSpace
import Mathlib.Topology.Covering.Basic


/-!
# Suggested Lean signatures: homotopy foundations for algebraic K-theory

Roadmap `StableHomotopyKTheory` ("Algebraic topology of spaces and manifolds, Part II: homotopy
foundations for algebraic K-theory", RS-33), layers H.1–H.6.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/StableHomotopyKTheory.md` and its packet are definitive; the
statements below only suggest Lean forms so that contributors and reviewers converge on names
and signatures. The file includes proposed signatures and comments for packet items.
Commented signatures record prospective interfaces whose carriers or hypotheses
cannot yet be stated. The review distinguishes these permitted omissions from narrower
typed contracts and tests whose statements can already be expressed. Elaboration alone
does not establish agreement with the packet.
Everything is proved by `sorry`; nothing here is an implementation. Where a statement needs
infrastructure that neither pin has (functoriality of homotopy groups on based maps, smash
products of maps of simplicial sets, homotopy colimits, and similar), its intended signature is
written as a comment headed `signature (not yet statable at the pins)` together with the reason,
instead of a placeholder proposition.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Build note: the shared build compiles Mathlib at the pin and only the adic-space part of
Tau Ceti, so this file imports Mathlib only. The section `Stub` supplies compatibility forms
for Tau Ceti's homotopy-group map, basepoint transport, fundamental-group action, K(G,1)
predicate and local coefficient systems. Replace these by the pinned Tau Ceti imports when
that part of the library is available; do not develop a second implementation. The map and
transport forms here retain only their underlying functions, as their docstrings specify.
Symmetric-spectrum equivariance and compatibility of spectrum morphisms are stated explicitly.
Signatures requiring further infrastructure remain comments with their reasons.
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

/-- `classifyingSpace_fin_two_homeomorph_unitInterval` (computation). -/
example : Nonempty (classifyingSpace (Fin 2) ≃ₜ unitInterval) := sorry

/-- `classifyingSpace_empty` (degenerate). -/
example : IsEmpty (classifyingSpace (Discrete PEmpty.{1})) ∧
    Nonempty (Unique (classifyingSpace (Discrete PUnit.{1}))) := sorry

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

/-- `SSet.toTop_t2Space`: realisations are Hausdorff. -/
theorem _root_.SSet.toTop_t2Space (X : SSet.{u}) : T2Space (SSet.toTop.obj X) := sorry

/-- `H.1/realisation-compact-finite-subcomplex`; `SSet.toTop_isCompact_subset_finite_subcomplex`: a compact subset of `|X|` lies in the realisation
of a simplicial subset with finitely many nondegenerate simplices. -/
theorem _root_.SSet.toTop_isCompact_subset_finite_subcomplex (X : SSet.{u})
    (K : Set (SSet.toTop.obj X)) (hK : IsCompact K) :
    ∃ A : X.Subcomplex, SSet.Finite A ∧ K ⊆ Set.range (SSet.toTop.map A.ι).hom := sorry

/-- `H.1/realisation-monomorphism-closed-embedding`; `SSet.toTop_map_isClosedEmbedding_of_mono`: realisations of monomorphisms are closed embeddings
(onto subcomplexes). -/
theorem _root_.SSet.toTop_map_isClosedEmbedding_of_mono {A X : SSet.{u}} (i : A ⟶ X) [Mono i] :
    Topology.IsClosedEmbedding (SSet.toTop.map i).hom := sorry

/-- `H.1/realisation-strong-local-contractibility`; `SSet.toTop_stronglyLocallyContractibleSpace`: a basis of contractible open neighbourhoods.
The classical CW local-contractibility theorem supplies this class; the weaker
`LocallyContractibleSpace` predicate alone does not supply a local-path-connectedness instance. -/
theorem _root_.SSet.toTop_stronglyLocallyContractibleSpace (X : SSet.{u}) :
    StronglyLocallyContractibleSpace (SSet.toTop.obj X) := sorry

/-- `CategoryTheory.classifyingSpace_sigma`: `B` of a disjoint union of categories is the disjoint union
of their classifying spaces. -/
theorem classifyingSpace_sigma {ι : Type u} (C : ι → Type u) [∀ i, Category.{u} (C i)] :
    IsHomeomorph (fun p : Σ i, classifyingSpace (C i) =>
      (classifyingSpaceMap (CategoryTheory.Sigma.incl (C := C) p.1)).hom p.2) := sorry

-- `H.1/realisation-boundary-inclusion-disk`, signature (not yet statable at the pins in this file):
-- `theorem SSet.toTop_boundary_arrowIso_diskBoundaryInclusion (n : ℕ) :
--   Nonempty (Arrow.mk (SSet.toTop.{u}.map (SSet.boundary.{u} n).ι) ≅ Arrow.mk (TopCat.diskBoundaryInclusion.{u} n))`;
-- statable after `import Mathlib.Topology.Category.TopCat.Sphere` and `import Mathlib.AlgebraicTopology.SimplicialSet.Boundary`
-- (both exist at the pin); state it as a `theorem … := sorry`. The closed-embedding half is `SSet.toTop_map_isClosedEmbedding_of_mono` applied to `(SSet.boundary n).ι`.

/-- `toTopCWComplex_stdSimplex_cells` (computation). -/
example (n k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk n))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk n)))) k) = Nat.choose (n + 1) (k + 1) := sorry

/-- `toTopCWComplex_point` (degenerate). -/
example (k : ℕ) : letI := SSet.toTopCWComplex (SSet.stdSimplex.obj (SimplexCategory.mk 0))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (SSet.stdSimplex.obj
      (SimplexCategory.mk 0)))) k) = if k = 0 then 1 else 0 := sorry

/-- `toTopCWComplex_compat_skeleton` (compatibility): the CW `n`-skeleton of `|X|` is the image of the
realisation of the simplicial skeleton `X.skeleton (n + 1)` (simplices of dimension `≤ n`). -/
example (X : SSet.{u}) [T2Space (SSet.toTop.obj X)] (n : ℕ) :
    letI := SSet.toTopCWComplex X
    Set.range (SSet.toTop.map (X.skeleton (n + 1)).ι).hom =
      ((Topology.CWComplex.skeleton (Set.univ : Set (SSet.toTop.obj X)) n :
        Topology.RelCWComplex.Subcomplex (Set.univ : Set (SSet.toTop.obj X))) : Set (SSet.toTop.obj X)) :=
  sorry

/-- `toTopCWComplex_not_all_simplices` (non-example): the 1-cells of `BG` are the non-identity elements. -/
example (G : Type u) [Group G] [Finite G] :
    letI := SSet.toTopCWComplex (nerve (SingleObj G))
    Nat.card (Topology.CWComplex.cell (Set.univ : Set (SSet.toTop.obj (nerve (SingleObj G)))) 1) =
      Nat.card G - 1 := sorry

/-- `H.1/classifying-space-op-homeomorph`: the canonical cellular homeomorphism `B(Cᵒᵖ) ≃ₜ BC`
(not induced by a functor), fixing vertices and natural in functors. -/
def classifyingSpaceOpHomeomorph (C : Type u) [Category.{v} C] :
    classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C := sorry

theorem classifyingSpaceOpHomeomorph_vertex (X : C) :
    classifyingSpaceOpHomeomorph C (classifyingSpace_vertex (Opposite.op X)) =
      classifyingSpace_vertex X := sorry

theorem classifyingSpaceOpHomeomorph_naturality (F : C ⥤ D) (x : classifyingSpace Cᵒᵖ) :
    classifyingSpaceOpHomeomorph D ((classifyingSpaceMap F.op).hom x) =
      (classifyingSpaceMap F).hom (classifyingSpaceOpHomeomorph C x) := sorry

/-- `H.1/classifying-space-prod`: the canonical map `B(C × D) → BC × BD` is a homeomorphism when
`BD` is a finite complex. -/
theorem classifyingSpaceProdHomeomorph (C D : Type u) [Category.{v} C] [Category.{v} D]
    [(nerve D).Finite] :
    IsHomeomorph (fun x : classifyingSpace (C × D) =>
      ((classifyingSpaceMap (CategoryTheory.Prod.fst C D)).hom x,
        (classifyingSpaceMap (CategoryTheory.Prod.snd C D)).hom x)) := sorry

-- `H.1/classifying-space-prod-compactly-generated`: signature (not yet statable at the pins): the same map is a
-- homeomorphism onto the product in compactly generated spaces, for arbitrary `C`, `D`:
-- `theorem classifyingSpaceProd_isHomeomorph_compactlyGenerated (C D : Type u) [Category.{v} C] [Category.{v} D] :
--   @IsHomeomorph _ _ _ (TopologicalSpace.compactlyGenerated.{max u v} (classifyingSpace C × classifyingSpace D))
--     (fun x : classifyingSpace (C × D) => ((classifyingSpaceMap (CategoryTheory.Prod.fst C D)).hom x,
--       (classifyingSpaceMap (CategoryTheory.Prod.snd C D)).hom x))` (state it as a theorem; the k-ified product is
-- Mathlib's `TopologicalSpace.compactlyGenerated`).

/-- `H.1/natural-transformations-adjoints-contractibility`: a natural transformation gives a homotopy. -/
theorem NatTrans.classifyingSpaceHomotopic {F G : C ⥤ D} (η : F ⟶ G) :
    ∃ H : ContinuousMap.Homotopy (classifyingSpaceMap F).hom (classifyingSpaceMap G).hom,
      ∀ (X : C) (t : unitInterval), H (t, classifyingSpace_vertex X) = classifyingSpace_edge (η.app X) t := sorry

/-- `H.1/adjunction-homotopy-equivalence`. -/
theorem Adjunction.classifyingSpaceHomotopyEquiv {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap L).hom ∧ e.invFun = (classifyingSpaceMap R).hom := sorry

/-- `H.1/contractible-of-initial-or-terminal`. -/
theorem classifyingSpace_contractible_of_hasInitial [HasInitial C] :
    ContractibleSpace (classifyingSpace C) := sorry

theorem classifyingSpace_contractible_of_hasTerminal [HasTerminal C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- `H.1/nerve-filtered-colimit`: the nerve commutes with filtered colimits of categories. -/
theorem nerve_isColimit_of_isFiltered {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c) :
    Nonempty (IsColimit (nerveFunctor.mapCocone c)) := sorry

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

/-- `H.1/filtered-colimit-homology`: homology with arbitrary constant module coefficients commutes with filtered colimits of categories. -/
theorem classifyingSpace_homology_filtered_colimit {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (R : Type (max u v)) [Ring R] (A : ModuleCat.{max u v} R) (n : ℕ) :
    Nonempty (IsColimit ((classifyingSpaceFunctor ⋙
      (AlgebraicTopology.singularHomologyFunctor (ModuleCat.{max u v} R) n).obj A).mapCocone c)) := sorry

/-- `H.1/pi0-classifying-space`: `π₀(BC)` is the set of components of `C`. -/
theorem classifyingSpace_zerothHomotopy :
    ∃ e : ZerothHomotopy (classifyingSpace C) ≃ CategoryTheory.ConnectedComponents C,
      ∀ X : C, e (ZerothHomotopy.mk (classifyingSpace_vertex X)) = CategoryTheory.ConnectedComponents.mk X := sorry

/-- `H.1/simplicial-covering-realisation`: unique lifting through any vertex of a simplex. -/
theorem _root_.SSet.toTop_map_isCoveringMap {E X : SSet.{u}} (p : E ⟶ X)
    (hp : ∀ (n : ℕ) (σ : X _⦋n⦌) (k : Fin (n + 1)) (e : E _⦋0⦌),
      p.app _ e = X.map (SimplexCategory.const ⦋0⦌ ⦋n⦌ k).op σ →
      ∃! τ : E _⦋n⦌, p.app _ τ = σ ∧
        E.map (SimplexCategory.const ⦋0⦌ ⦋n⦌ k).op τ = e) :
    IsCoveringMap (SSet.toTop.map p).hom := sorry

/-- `H.1/coverings-fundamental-group-local-coefficients`: for a morphism-inverting functor
`F : C ⥤ Type u`, `B` of the projection from the category of elements is a covering map (fibre
`F X` over `[X]`); with the fibre functor of a covering this gives Quillen's Proposition 1. -/
theorem classifyingSpace_elements_isCoveringMap (F : C ⥤ Type u)
    (hF : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), Function.Bijective (F.map f)) :
    IsCoveringMap (classifyingSpaceMap (Functor.Elements.π F)).hom := sorry

/-- `H.1/coverings-fundamental-group-local-coefficients`, essential surjectivity: every covering of `BC` is
`B` of the category of elements of a morphism-inverting functor. -/
theorem classifyingSpace_covering_exists_elements {C : Type u} [SmallCategory C] {E : Type u}
    [TopologicalSpace E] (p : C(E, classifyingSpace C)) (hp : IsCoveringMap p) :
    ∃ (F : C ⥤ Type u) (_ : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), Function.Bijective (F.map f))
      (h : E ≃ₜ classifyingSpace F.Elements),
      ∀ e, (classifyingSpaceMap (Functor.Elements.π F)).hom (h e) = p e := sorry

/-- The functor `C ⥤ Π(BC)`: `X ↦ [X]`, `f ↦ [classifyingSpace_edge f]`. -/
def classifyingSpace_edgeFunctor (C : Type u) [Category.{v} C] :
    C ⥤ FundamentalGroupoid (classifyingSpace C) := sorry

/-- `H.1/fundamental-groupoid-localization`: the induced functor `C[C⁻¹] ⥤ Π(BC)` is an equivalence. -/
theorem classifyingSpace_fundamentalGroupoid_isEquivalence (C : Type u) [Category.{v} C] :
    (FreeGroupoid.lift (classifyingSpace_edgeFunctor C)).IsEquivalence := sorry

/-- Corollary of `H.1/fundamental-groupoid-localization`: `π₁(BC, [X]) ≅ Aut_{C[C⁻¹]}(X)`. -/
theorem classifyingSpace_fundamentalGroup (X : C) :
    Nonempty (FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex X) ≃*
      Aut ((FreeGroupoid.of C).obj X)) := sorry

/-- Realise the unique rooted path in the wide tree; reverse tree edges are traversed backwards. -/
def classifyingSpace_treePath (T : WideSubquiver (Quiver.Symmetrify C))
    [Quiver.Arborescence T] (X : C) :
    Path (classifyingSpace_vertex (show C from Quiver.root T)) (classifyingSpace_vertex X) := sorry

def classifyingSpace_treeLoop (T : WideSubquiver (Quiver.Symmetrify C))
    [Quiver.Arborescence T] {X Y : C} (f : X ⟶ Y) :
    FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex (show C from Quiver.root T)) :=
  FundamentalGroup.fromPath ⟦((classifyingSpace_treePath T X).trans
    (classifyingSpace_edge f)).trans (classifyingSpace_treePath T Y).symm⟧

/-- `H.1/maximal-tree-presentation`: the quotient universal property for any connected category.
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

/-- `H.1/maximal-tree-presentation`, the one-object group example. The empty tree has its single
vertex; E11 does not remove that vertex when there are no tree edges. -/
theorem classifyingSpace_fundamentalGroup_singleObj (G : Type u) [Group G] :
    Nonempty (FundamentalGroup (classifyingSpace (SingleObj G))
      (classifyingSpace_vertex (SingleObj.star G)) ≃* G) := sorry

/-- `H.1/local-systems-as-functors`: local systems on `BC` are morphism-inverting functors. -/
theorem classifyingSpace_localSystems_equiv (R : Type (max u v)) [Ring R] :
    ((Functor.whiskeringLeft (FreeGroupoid C) (FundamentalGroupoid (classifyingSpace C))
      (ModuleCat.{max u v} R)).obj
        (FreeGroupoid.lift (classifyingSpace_edgeFunctor C))).IsEquivalence := sorry

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

theorem categoryHomology.longExactSequence_exact (R : Type (max u v)) [Ring R]
    (S : ShortComplex (C ⥤ ModuleCat.{max u v} R)) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (categoryHomology.map R S.f n).hom (categoryHomology.map R S.g n).hom ∧
    Function.Exact (categoryHomology.map R S.g (n + 1)).hom (categoryHomology.longExactSequence R S hS n).hom ∧
    Function.Exact (categoryHomology.longExactSequence R S hS n).hom (categoryHomology.map R S.f n).hom := sorry

def categoryHomologyZeroIsoColimit (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    categoryHomology R M 0 ≅ colimit M := sorry

/-- The simplicial module `n ↦ ⊕_{σ ∈ (nerve C) _[n]} M (σ.obj 0)`; its alternating face map complex is
`categoryChainComplex R M`. -/
def categorySimplicialModule (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R) :
    SimplicialObject (ModuleCat.{max u v} R) := sorry

def categoryHomology.normalizedIso (R : Type (max u v)) [Ring R] (M : C ⥤ ModuleCat.{max u v} R)
    (n : ℕ) : ((AlgebraicTopology.normalizedMooreComplex _).obj
      (categorySimplicialModule R M)).homology n ≅ categoryHomology R M n := sorry

/-- Constant coefficients: `H_n(C; A)` is Mathlib's simplicial homology of the nerve. -/
def categoryHomology.constIso (R : Type (max u v)) [Ring R] (A : ModuleCat.{max u v} R) (n : ℕ) :
    categoryHomology R ((Functor.const C).obj A) n ≅ (nerve C).homology A n := sorry

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

/-- The representable contraction used in `H.1/category-homology-derived-colimit`.
This is a helper, not the derived-functor comparison itself. -/
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

/-- Colimits of module-valued diagrams are additive. This elementary structural fact is
separate from the missing construction of projective resolutions in the diagram category. -/
instance categoryColim_additive (R : Type (max u v)) [Ring R] :
    (colim : (C ⥤ ModuleCat.{max u v} R) ⥤ ModuleCat.{max u v} R).Additive := sorry

/-- `H.1/category-homology-derived-colimit`: a natural comparison with Mathlib's generic
left derived functor, in every degree. The explicit resolution assumption is the provisional
Lean input: constructing it from representable projectives and proving the comparison remain
in the Gabriel–Zisman gap. The mathematical theorem does not assume it as an extra condition. -/
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

-- `H.1/cellular-chains-local-coefficients`, signature (not yet statable at the pins): for a morphism-inverting
-- `L : C ⥤ ModuleCat R`, the twisted relative homology `H_q(BC⁽ⁿ⁾, BC⁽ⁿ⁻¹⁾; L)` is `⊕ L(X₀)` over the
-- nondegenerate `n`-simplices in degree `q = n` and zero otherwise, and the connecting maps form a complex
-- isomorphic to `(AlgebraicTopology.normalizedMooreComplex _).obj (categorySimplicialModule R L)`; it needs
-- singular homology with local coefficients (Tau Ceti AlgebraicTopology stage 2 item 6).
-- `H.1/homology-of-small-categories`, signature (not yet statable at the pins): for a morphism-inverting
-- `L : C ⥤ ModuleCat R`, viewed as a local system on `BC` through `classifyingSpace_localSystems_equiv`,
-- `H_n(BC; L) ≅ categoryHomology R L n`, natural in `(C, L)`; it needs singular homology with local
-- coefficients (Tau Ceti AlgebraicTopology stage 2 item 6), which neither pin has.
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

theorem loop_one : (loop (1 : G)).Homotopic (Path.refl (basepoint G)) := sorry

theorem loop_mul (g h : G) : (loop (g * h)).Homotopic ((loop h).trans (loop g)) := sorry

theorem map_basepoint (φ : G →* H) : (map φ).hom (basepoint G) = basepoint H := sorry

theorem map_id : map (MonoidHom.id G) = 𝟙 (Group.classifyingSpace G) := sorry

theorem map_comp {K : Type u} [Group K] (φ : G →* H) (ψ : H →* K) : map (ψ.comp φ) = map φ ≫ map ψ := sorry

instance pathConnected (G : Type u) [Group G] : PathConnectedSpace (Group.classifyingSpace G) := sorry

def fundamentalGroupMulEquiv (G : Type u) [Group G] :
    FundamentalGroup (Group.classifyingSpace G) (basepoint G) ≃* G := sorry

def homologyIso (G : Type u) [Group G] (n : ℕ) :
    Stub.singH (ULift ℤ) n (Group.classifyingSpace G) ≅
      groupHomology (Rep.trivial (ULift ℤ) G (ULift ℤ)) n := sorry

/-- `Group.classifyingSpace.fundamentalGroupMulEquiv_loop`: the class of `loop g` goes to `g`. -/
theorem fundamentalGroupMulEquiv_loop (g : G) :
    fundamentalGroupMulEquiv G (FundamentalGroup.fromPath ⟦loop g⟧) = g := sorry

/-- `Group.classifyingSpace.H1AddEquiv`: `H₁(BG; ℤ) ≃+ Gᵃᵇ` (natural in `G`; see the test
`classifyingSpace_H1_abelianization`). -/
def H1AddEquiv (G : Type) [Group G] :
    Stub.singH ℤ 1 (Group.classifyingSpace G) ≃+ Additive (Abelianization G) := sorry

end Group.classifyingSpace

/-- `classifyingSpace_trivial_contractible` (degenerate). -/
example : ContractibleSpace (Group.classifyingSpace (Unit : Type)) := sorry

/-- `classifyingSpace_H1_abelianization` (computation). -/
example : ∃ e : ∀ (G : Type) [Group G],
      Stub.singH ℤ 1 (Group.classifyingSpace G) ≃+ Additive (Abelianization G),
    ∀ (G H : Type) [Group G] [Group H] (φ : G →* H) (x : Stub.singH ℤ 1 (Group.classifyingSpace G)),
      e H ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) 1).obj
        (ModuleCat.of ℤ ℤ)).map (Group.classifyingSpace.map φ)).hom x) =
        Additive.ofMul (Abelianization.map φ (Additive.toMul (e G x))) := sorry

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

/-- `classifyingSpace_conj_freely_homotopic`, second half: not homotopic relative to the basepoint in general. -/
example : ¬ ContinuousMap.HomotopicRel (Group.classifyingSpace.map (MonoidHom.id (Equiv.Perm (Fin 3)))).hom
    (Group.classifyingSpace.map (MulAut.conj (Equiv.swap (0 : Fin 3) 1)).toMonoidHom).hom
    {Group.classifyingSpace.basepoint (Equiv.Perm (Fin 3))} := sorry

/-- `H.1/translation-category-classifying-space`: `B(∫_G G)` is contractible. -/
theorem Group.classifyingSpace_translation_contractible (G : Type u) [Group G] :
    ContractibleSpace (CategoryTheory.classifyingSpace (CategoryTheory.ActionCategory G G)) := sorry

theorem Group.classifyingSpace_translation_isCoveringMap (G : Type) [Group G] :
    IsCoveringMap (CategoryTheory.classifyingSpaceMap (CategoryTheory.ActionCategory.π G G)).hom := sorry

theorem Group.classifyingSpace_actionCategory_homotopyEquiv (G X : Type u) [Group G] [MulAction G X]
    [MulAction.IsPretransitive G X] (x : X) :
    Nonempty (ContinuousMap.HomotopyEquiv (CategoryTheory.classifyingSpace (CategoryTheory.ActionCategory G X))
      (Group.classifyingSpace (MulAction.stabilizer G x))) := sorry

/-- `H.1/classifying-space-of-group-is-KG1`. -/
theorem Group.classifyingSpace_isKOne (G : Type u) [Group G] :
    Stub.IsKOne G (Group.classifyingSpace G) (Group.classifyingSpace.basepoint G) := sorry

/-- `H.1/conjugate-homomorphisms-freely-homotopic`. -/
theorem Group.classifyingSpace_map_conj_homotopic {G H : Type u} [Group G] [Group H]
    (φ : G →* H) (h : H) :
    ContinuousMap.Homotopic (Group.classifyingSpace.map φ).hom
      (Group.classifyingSpace.map ((MulAut.conj h).toMonoidHom.comp φ)).hom := sorry

/-- `H.1/bar-complex-comparison`, chain level: entrywise inversion `(g₁, …, g_n) ↦ (g₁⁻¹, …, g_n⁻¹)`
identifies the category chains of `SingleObj G` with Mathlib's inhomogeneous chains. -/
theorem Group.categoryChainComplex_singleObj_iso (k G : Type u) [CommRing k] [Group G] (A : Rep k G) :
    Nonempty (CategoryTheory.categoryChainComplex k
      ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) ≅
        groupHomology.inhomogeneousChains A) := sorry

/-- `H.1/bar-complex-comparison`: `H_n(BG; M) ≅ H_n(G; M)` via the bar construction. -/
theorem Group.categoryHomology_singleObj_iso (k G : Type u) [CommRing k] [Group G] (A : Rep k G)
    (n : ℕ) : Nonempty (CategoryTheory.categoryHomology k
      ((Action.functorCategoryEquivalence (ModuleCat.{u} k) G).functor.obj ((Rep.RepToAction k G).obj A)) n ≅ groupHomology A n) := sorry

/-- `H.1/groupoid-nerve-kan`: the nerve of a groupoid is a Kan complex. -/
theorem CategoryTheory.Groupoid.nerve_kanComplex (C : Type u) [Groupoid.{u} C] :
    SSet.KanComplex (nerve C) := sorry

/-- `H.1/groupoid-nerve-one-type`: `π₁(BC, [X]) ≅ Aut X` and `π_n(BC, [X]) = 0` for `n ≥ 2`. -/
theorem CategoryTheory.Groupoid.classifyingSpace_oneType (C : Type u) [Groupoid.{u} C] (X : C) :
    Nonempty (FundamentalGroup (classifyingSpace C) (classifyingSpace_vertex X) ≃* Aut X) ∧
      ∀ n : ℕ, Subsingleton (HomotopyGroup.Pi (n + 2) (classifyingSpace C)
        (classifyingSpace_vertex X)) := sorry

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

theorem IsWeakHomotopyEquivalence.of_comp_left {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hg : IsWeakHomotopyEquivalence g) (hfg : IsWeakHomotopyEquivalence (f ≫ g)) :
    IsWeakHomotopyEquivalence f := sorry

theorem IsWeakHomotopyEquivalence.of_comp_right {X Y Z : TopCat.{u}} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsWeakHomotopyEquivalence f) (hfg : IsWeakHomotopyEquivalence (f ≫ g)) :
    IsWeakHomotopyEquivalence g := sorry

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

/-- `isWeakHomotopyEquivalence_not_all_basepoints` (non-example): `S¹ ⊔ {*} → {a, b}` is bijective on `π₀`
and an isomorphism on every `π_n` at `*`, but not on `π₁` at a point of the circle. -/
example : ¬ IsWeakHomotopyEquivalence
    (TopCat.ofHom ⟨Sum.elim (fun _ : Circle => (ULift.up true : ULift.{0} Bool))
        (fun _ : PUnit.{1} => (ULift.up false : ULift.{0} Bool)), by fun_prop⟩ :
      TopCat.of (Circle ⊕ PUnit.{1}) ⟶ TopCat.of (ULift.{0} Bool)) := sorry

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

/-- `H.2/mapping-path-space-homotopy-equivalence`: `A` is homotopy equivalent to the mapping path space `E_f`,
over `B`. -/
theorem mappingPathSpace_homotopyEquiv (f : A ⟶ B) :
    ∃ e : ContinuousMap.HomotopyEquiv A
      (TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}),
      ∀ a : A, e.toFun a = ⟨(a, ContinuousMap.const unitInterval (f.hom a)), rfl⟩ := sorry

/-- `H.2/mapping-path-space-fibration`: `(a, γ) ↦ γ 1` has the homotopy lifting property for all spaces. -/
theorem mappingPathSpace_hasHomotopyLifting (f : A ⟶ B) (Y : TopCat.{u})
    (H : C(Y × unitInterval, B)) (g₀ : C(Y, {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}))
    (h₀ : ∀ y, (g₀ y).1.2 1 = H (y, 0)) :
    ∃ G : C(Y × unitInterval, {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1}),
      ∀ y t, (G (y, t)).1.2 1 = H (y, t) ∧ G (y, 0) = g₀ y := sorry

/-- `H.2/fibre-to-homotopy-fibre` (stated for maps with the homotopy lifting property for all spaces). -/
theorem homotopyFiber.ofFiber_homotopyEquiv (p : A ⟶ B)
    (hp : ∀ (Y : TopCat.{u}) (H : C(Y × unitInterval, B)) (g₀ : C(Y, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C(Y × unitInterval, A), ∀ y t, p.hom (G (y, t)) = H (y, t) ∧
        G (y, 0) = g₀ y) (b : B) :
    ∃ e : ContinuousMap.HomotopyEquiv (TopCat.of {a : A // p.hom a = b}) (homotopyFiber p b),
      ∀ a, e.toFun a = homotopyFiber.ofFiber p b a := sorry

-- signature (not yet statable at the pins): theorem serreFibration_relativeHomotopy_bijective
-- `H.2/fibration-relative-homotopy-iso`: for `p` with disc lifting, `p_* : π_n(E, p⁻¹ b, x₀) → π_n(B, b)`
-- is bijective for `n ≥ 1`; relative homotopy groups are Tau Ceti AlgebraicTopology stage 8 objects.

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

/-- `H.2/long-exact-sequence`: exactness at `π_n(F)` (`n = 0`: pointed sets). -/
theorem homotopyFiber.exact_at_fiber (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (homotopyFiber.connecting f a₀ n) =
      {y | Stub.piMap n (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀) y = default} :=
  sorry

/-- `H.2/long-exact-sequence`: exactness at `π_{n+1}(B)`. -/
theorem homotopyFiber.exact_at_base (f : A ⟶ B) (a₀ : A) (n : ℕ) :
    Set.range (Stub.piMap (n + 1) f.hom a₀) = {y | homotopyFiber.connecting f a₀ n y = default} := sorry

/-- `H.2/long-exact-sequence`: exactness at `π₀(A)` (pointed sets). -/
theorem homotopyFiber.exact_at_total_zero (f : A ⟶ B) (a₀ : A) :
    Set.range (Stub.piMap 0 (homotopyFiber.proj f (f.hom a₀)).hom (homotopyFiber.basepoint f a₀)) =
      {y | Stub.piMap 0 f.hom a₀ y = default} := sorry

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

-- signature (not yet statable at the pins): theorem homotopyFiber.connecting_transport (f : A ⟶ B) {a₀ a₁ : A}
--     (σ : Path a₀ a₁) (n : ℕ)
-- With `ω = σ.map f.hom.continuous`: `connecting f a₁ n ∘ Stub.piOfPath (n + 1) ω` equals
-- `Stub.piOfPath n τ ∘ Stub.piMap n (transport f ω).hom _ ∘ connecting f a₀ n`, where `τ` is the path
-- `t ↦ (σ t, ω|[t,1])` in `homotopyFiber f (f a₁)` from `transport f ω (basepoint f a₀)` to
-- `basepoint f a₁`; the restricted paths `ω|[t,1]` need path-restriction API absent at the pins.

/-- `transport_refl_homotopic_id` (degenerate). -/
example (f : A ⟶ B) (b : B) :
    ContinuousMap.Homotopic (homotopyFiber.transport f (Path.refl b)).hom (ContinuousMap.id _) := sorry

/- `transport_loopSpace` (computation). -/
-- signature (not yet statable at the pins): example (b : B) (ω : Path b b)
-- For `f` the inclusion of `b`, `transport f ω` is `γ ↦ γ.trans ω` on `Ω B b`; on `π₀(Ω B b) ≅ π₁(B, b)` this is
-- left multiplication by `[ω]` in Mathlib's group structure (`p * q = q.trans p`).

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
example {E : TopCat.{u}} (p : E ⟶ A) : IsHomotopyCartesian p p (𝟙 E) (𝟙 A) (by simp) := sorry

/-- The map `E' → F(p, h b')`, `e' ↦ (α e', t ↦ h (K (p' e', t)))`, given by a contraction `K` of `B'`. -/
def homotopyFiber.ofContraction {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E)
    (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B')
    (K : ContinuousMap.Homotopy (ContinuousMap.id B') (ContinuousMap.const B' b')) :
    E' ⟶ homotopyFiber p (h.hom b') := sorry

/-- `isHomotopyCartesian_iff_fiber` (characterisation): over a point, homotopy-cartesian means
homotopy fibre sequence. -/
example {E' E : TopCat.{u}} (p' : E' ⟶ TopCat.of PUnit.{u + 1}) (p : E ⟶ B) (α : E' ⟶ E)
    (h : TopCat.of PUnit.{u + 1} ⟶ B) (w : p' ≫ h = α ≫ p) :
    IsHomotopyCartesian p' p α h w ↔ IsHomotopyFiberSequence α p (h.hom PUnit.unit) := sorry

/- `not_isHomotopyCartesian_strictFiber` (non-example). -/
-- signature (not yet statable at the pins): example (G : Type u) [Group G] (H : Subgroup G) (hH : H ≠ ⊤)
-- The square (point → BH over point → BG) fails: `π₀` of the homotopy pullback is `G ⧸ H ≠ *`.

/-- `H.2/homotopy-cartesian-contractible-base`. -/
theorem IsHomotopyCartesian.iff_of_contraction {E' E B' : TopCat.{u}}
    (p' : E' ⟶ B') (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) (b' : B')
    (K : ContinuousMap.Homotopy (ContinuousMap.id B') (ContinuousMap.const B' b')) :
    IsHomotopyCartesian p' p α h w ↔
      IsWeakHomotopyEquivalence (homotopyFiber.ofContraction p' p α h w b' K) := sorry

/-- `H.2/homotopy-cartesian-pasting`. -/
theorem IsHomotopyCartesian.paste {X₁ X₂ X₃ Y₁ Y₂ Y₃ : TopCat.{u}} (a₁ : X₁ ⟶ X₂) (a₂ : X₂ ⟶ X₃)
    (b₁ : Y₁ ⟶ Y₂) (b₂ : Y₂ ⟶ Y₃) (v₁ : X₁ ⟶ Y₁) (v₂ : X₂ ⟶ Y₂) (v₃ : X₃ ⟶ Y₃)
    (w₁ : v₁ ≫ b₁ = a₁ ≫ v₂) (w₂ : v₂ ≫ b₂ = a₂ ≫ v₃)
    (h₂ : IsHomotopyCartesian v₂ v₃ a₂ b₂ w₂) :
    IsHomotopyCartesian v₁ v₂ a₁ b₁ w₁ ↔
      IsHomotopyCartesian v₁ v₃ (a₁ ≫ a₂) (b₁ ≫ b₂) (by rw [← Category.assoc, w₁, Category.assoc, w₂, ← Category.assoc]) := sorry

/-- `H.2/homotopy-cartesian-pasting`: a square is homotopy-cartesian iff its transpose is. -/
theorem IsHomotopyCartesian.transpose {E' E B' : TopCat.{u}} (p' : E' ⟶ B') (p : E ⟶ B)
    (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p) :
    IsHomotopyCartesian p' p α h w ↔ IsHomotopyCartesian α h p' p w.symm := sorry

/-- `H.2/homotopy-cartesian-pasting`: horizontal weak equivalences give a homotopy-cartesian square. -/
theorem IsHomotopyCartesian.of_isWeakHomotopyEquivalence {E' E B' : TopCat.{u}} (p' : E' ⟶ B')
    (p : E ⟶ B) (α : E' ⟶ E) (h : B' ⟶ B) (w : p' ≫ h = α ≫ p)
    (hα : IsWeakHomotopyEquivalence α) (hh : IsWeakHomotopyEquivalence h) :
    IsHomotopyCartesian p' p α h w := sorry

/-- `H.2/quasi-fibration`. -/
def IsQuasiFibration (p : A ⟶ B) : Prop :=
  ∀ b : B, IsWeakHomotopyEquivalence (TopCat.ofHom ⟨homotopyFiber.ofFiber p b, sorry⟩ :
    TopCat.of {a : A // p.hom a = b} ⟶ homotopyFiber p b)

theorem IsQuasiFibration.of_serreFibration (p : A ⟶ B)
    (hp : ∀ n : ℕ, ∀ (H : C((Fin n → unitInterval) × unitInterval, B)) (g₀ : C(Fin n → unitInterval, A)),
      (∀ y, p.hom (g₀ y) = H (y, 0)) → ∃ G : C((Fin n → unitInterval) × unitInterval, A),
        ∀ y t, p.hom (G (y, t)) = H (y, t) ∧ G (y, 0) = g₀ y) : IsQuasiFibration p := sorry

/-- `IsQuasiFibration.longExactSequence`: exactness at `π_{n+1}(E)` with the strict fibre. -/
theorem IsQuasiFibration.exact_at_total {p : A ⟶ B} (hp : IsQuasiFibration p) (a₀ : A) (n : ℕ) :
    Set.range (Stub.piMap (n + 1)
        (ContinuousMap.mk Subtype.val continuous_subtype_val : C({a : A // p.hom a = p.hom a₀}, A))
        (⟨a₀, rfl⟩ : {a : A // p.hom a = p.hom a₀})) =
      {y | Stub.piMap (n + 1) p.hom a₀ y = 1} := sorry

-- signature (not yet statable at the pins): theorem IsQuasiFibration.iff_relative [PathConnectedSpace B] (p : A ⟶ B) (hp : Function.Surjective p.hom)
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

/-- `H.2/dold-lashof-exhaustion` (criterion (b)). -/
theorem IsQuasiFibration.of_exhaustion (p : A ⟶ B) (Bn : ℕ → Set B) (hmono : Monotone Bn)
    (hcpt : ∀ K : Set B, IsCompact K → ∃ n, K ⊆ Bn n)
    (q : ∀ n, IsQuasiFibration (TopCat.ofHom ⟨fun (a : p.hom ⁻¹' Bn n) => (⟨p.hom a, a.2⟩ : Bn n), sorry⟩ :
      TopCat.of (p.hom ⁻¹' Bn n) ⟶ TopCat.of (Bn n))) :
    IsQuasiFibration p := sorry

/-- `H.2/dold-lashof-deformation` (criterion (c)); deformations in the weak sense. -/
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

-- signature (not yet statable at the pins): theorem excisiveTriad_relativeHomotopy_comparison
-- `H.2/excisive-triad-homotopy-comparison` (Hatcher Prop. 4K.1): relative homotopy groups of pairs
-- are Tau Ceti AlgebraicTopology stage 8 objects, not imported here.

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

/-- The transpose `(p, q) ↦ T_{q,p}` of a bisimplicial set. -/
def BisimplicialSet.transpose (T : BisimplicialSet.{u}) : BisimplicialSet.{u} := sorry

/-- `H.2/bisimplicial-realization-lemma`: realising in either order gives the same space. -/
theorem BisimplicialSet.realization_transpose (T : BisimplicialSet.{u}) :
    Nonempty (BisimplicialSet.realization T.transpose ≅ BisimplicialSet.realization T) := sorry

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
-- `|X × Y| ≅ |X| × |Y|` and `|X ×_Y Z| ≅ |X| ×_{|Y|} |Z|` for compactly generated weak Hausdorff levels
-- (Nikolaus–Scholze Prop. C.1); Mathlib's `TopCat` product is not k-ified, so the statement needs
-- compactly generated products, which neither pin provides.

/-- `H.2/gluing-lemma`. -/
theorem gluingLemma {X₀ X₁ X₂ Y₀ Y₁ Y₂ : TopCat.{u}} (i : X₀ ⟶ X₁) (j : X₀ ⟶ X₂) (i' : Y₀ ⟶ Y₁)
    (j' : Y₀ ⟶ Y₂) (f₀ : X₀ ⟶ Y₀) (f₁ : X₁ ⟶ Y₁) (f₂ : X₂ ⟶ Y₂)
    (w₁ : i ≫ f₁ = f₀ ≫ i') (w₂ : j ≫ f₂ = f₀ ≫ j')
    (hi_emb : Topology.IsEmbedding i.hom) (hi'_emb : Topology.IsEmbedding i'.hom)
    (hi : IsHCofibration (Set.range i.hom)) (hi' : IsHCofibration (Set.range i'.hom))
    (h₀ : IsWeakHomotopyEquivalence f₀) (h₁ : IsWeakHomotopyEquivalence f₁)
    (h₂ : IsWeakHomotopyEquivalence f₂) :
    IsWeakHomotopyEquivalence (pushout.map i j i' j' f₁ f₂ f₀ w₁ w₂) := sorry

/-- `H.2/h-cofibration-pushout-product` (Strøm's product theorem). -/
theorem IsHCofibration.pushoutProduct {X Y : TopCat.{u}} {S : Set X} {T : Set Y}
    (hS : IsHCofibration S) (hT : IsHCofibration T) (hTc : IsClosed T) :
    IsHCofibration (X := TopCat.of (X × Y)) (S ×ˢ Set.univ ∪ Set.univ ×ˢ T) := sorry

/-- `H.2/levelwise-equivalence-theorem`. -/
theorem SimplicialSpace.realization_weakEquivalence {X Y : SimplicialObject TopCat.{u}} (f : X ⟶ Y)
    (hX : SimplicialSpace.IsProper X) (hY : SimplicialSpace.IsProper Y)
    (hXk : ∀ n, CompactlyGeneratedSpace (X.obj n)) (hYk : ∀ n, CompactlyGeneratedSpace (Y.obj n))
    (hX₂ : ∀ n, T2Space (X.obj n)) (hY₂ : ∀ n, T2Space (Y.obj n))
    (hf : ∀ n, IsWeakHomotopyEquivalence (f.app n)) :
    IsWeakHomotopyEquivalence (SimplicialSpace.realization.map f) := sorry

/-- `H.2/levelwise-fibration-realisation` (levelwise realisations of bisimplicial sets). -/
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

-- signature (not yet statable at the pins): theorem BisimplicialSet.realization_fiberSequence_piKan
-- `H.2/bisimplicial-fibration-pi-kan` (Bousfield–Friedlander B.4): the π_*-Kan condition is phrased
-- with homotopy groups of Kan complexes (Tau Ceti AlgebraicTopology stage 8), not imported here.

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
    (hk : ∀ i, CompactlyGeneratedSpace (X.obj i) ∧ CompactlyGeneratedSpace (X'.obj i))
    (h₂ : ∀ i, T2Space (X.obj i) ∧ T2Space (X'.obj i))
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
def SimplicialSpace.hocolimToRealization (X : SimplicialObject TopCat.{0}) :
    hocolim SimplexCategoryᵒᵖ X ⟶ SimplicialSpace.realization.obj X := sorry

theorem SimplicialSpace.hocolim_weakEquivalence_realization (X : SimplicialObject TopCat.{0})
    (hX : SimplicialSpace.IsProper X) (hk : ∀ n, CompactlyGeneratedSpace (X.obj n))
    (h₂ : ∀ n, T2Space (X.obj n)) :
    IsWeakHomotopyEquivalence (SimplicialSpace.hocolimToRealization X) := sorry

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

/- `H.2/functor-homology-spectral-sequence`: a first-quadrant spectral sequence with
`E²_{p,q} = H_p(D; d ↦ H_q(B(T/d)))`; its convergence to `H_{p+q}(BC)` needs the abutment
API of Mathlib's spectral sequences, which the pin does not have, and is left out here. -/
-- signature (not yet statable at the pins): theorem functorHomologySpectralSequence (T : C ⥤ D)
-- The row-filtration spectral sequence of the double complex with generators
-- `(c₀ → ⋯ → c_q, T c_q → d₀ → ⋯ → d_p)` has `E²_{p,q} ≅ categoryHomology (ULift ℤ)
-- (commaHomologyCoeff T q) p` and converges to `H_{p+q}` of `C`; without Mathlib's abutment API an
-- existence statement for the `E²` page alone would be vacuous.

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

/-- `commaToHomotopyFiber_fiberToComma`: on the strict fibre the comparison map is the fibre inclusion. -/
theorem commaToHomotopyFiber_fiberToComma (F : C ⥤ D) (d : D) :
    ∃ h : ∀ x, (classifyingSpaceMap F).hom
        ((classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C)).hom x) = classifyingSpace_vertex d,
      ContinuousMap.Homotopic (classifyingSpaceMap (fiberToComma F d) ≫ commaToHomotopyFiber F d).hom
        (fiberSequenceMap (classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C))
          (classifyingSpaceMap F) (classifyingSpace_vertex d) h).hom := sorry

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
theorem quillenTheoremB_prefibered (F : C ⥤ D) (R : ∀ d : D, StructuredArrow d F ⥤ F.Fiber d)
    (adj : ∀ d : D, fiberToComma F d ⊣ R d)
    (h : ∀ ⦃d d' : D⦄ (u : d ⟶ d'), ∃ e : ContinuousMap.HomotopyEquiv
      (classifyingSpace (F.Fiber d')) (classifyingSpace (F.Fiber d)),
        e.toFun = (classifyingSpaceMap (fiberToComma F d' ⋙ StructuredArrow.map (T := F) u ⋙ R d)).hom)
    (d : D) :
    IsHomotopyFiberSequence (classifyingSpaceMap (Functor.Fiber.fiberInclusion : F.Fiber d ⥤ C))
      (classifyingSpaceMap F) (classifyingSpace_vertex d) := sorry

/-- `H.2/group-extension-fibration`. -/
theorem groupExtension_fiberSequence (G : Type u) [Group G] (N : Subgroup G) [N.Normal] :
    IsHomotopyFiberSequence (Group.classifyingSpace.map N.subtype)
      (Group.classifyingSpace.map (QuotientGroup.mk' N)) (Group.classifyingSpace.basepoint _) := sorry

end CategoryTheory

/-! ## H.3 — The plus construction -/

namespace TauCeti

variable {X Y Z : TopCat.{u}}

/-- `H.3/acyclic-spaces-and-maps`: path-connected with vanishing integral homology in positive degrees
(equivalently, nonempty with vanishing reduced integral homology). -/
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

/-- `H.3/hurewicz-degree-one` (Hatcher Theorem 2A.1). -/
theorem hurewicz_one (X : TopCat.{u}) [PathConnectedSpace X] (x : X) :
    Nonempty (Additive (Abelianization (FundamentalGroup X x)) ≃+ Stub.singH (ULift.{u} ℤ) 1 X) := sorry

/-- `H.3/acyclic-space-perfect-fundamental-group`. -/
theorem IsAcyclicSpace.perfect_and_H2 {F : TopCat.{u}} [Topology.CWComplex (Set.univ : Set F)]
    (h : IsAcyclicSpace F) (x : F) :
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

/- `H.3/twisted-homology-via-cover`: for a path-connected `X` with universal cover, a normal subgroup
`N` of `π = π₁(X, x)`, the regular cover `X_N` and a `ℤ[π/N]`-module `M`, the twisted singular chains
satisfy `C_*(X; M) ≅ C_*(X_N) ⊗_{ℤ[π/N]} M`, so `H_*(X; ℤ[π/N]) ≅ H_*(X_N; ℤ)`. -/
-- signature (not yet statable at the pins): theorem twistedHomology_iso_cover (X : TopCat) (x : X) (N) (M)
-- Twisted singular homology with local coefficients is Tau Ceti AlgebraicTopology stage 2 item 6, not built.

/-- `H.3/acyclic-map-homology-criterion` (constant-coefficient shadow; see `IsAcyclicMap.iff_homology`). -/
theorem IsAcyclicMap.homology_criterion (f : X ⟶ Y) (hf : IsAcyclicMap f) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- `TauCeti.IsAcyclicMap.of_comp` (API of `H.3/acyclic-map-homology-criterion`): for connected CW
complexes, if `g ∘ f` and `f` are acyclic then so is `g`. -/
theorem IsAcyclicMap.of_comp [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] [PathConnectedSpace X] {f : X ⟶ Y} {g : Y ⟶ Z}
    (hgf : IsAcyclicMap (f ≫ g)) (hf : IsAcyclicMap f) : IsAcyclicMap g := sorry

/-- `H.3/serre-comparison-fibre`, simply connected special case (used for the converse of
`H.3/acyclic-map-homology-criterion`): an integral homology isomorphism of CW complexes onto a simply
connected space has acyclic homotopy fibres. -/
theorem IsAcyclicMap.of_homology_iso_of_simplyConnected [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] [SimplyConnectedSpace Y] (f : X ⟶ Y)
    (hf : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f)) :
    IsAcyclicMap f := sorry

/- `H.3/serre-comparison-fibre`, general form: for a map of Serre fibrations with trivial monodromy on the
integral homology of both fibres, integral homology isomorphisms on bases and total spaces give one on
fibres. -/
-- signature (not yet statable at the pins): theorem serreComparison_fibre
-- Serre fibrations and the monodromy action on fibre homology are Tau Ceti AlgebraicTopology stage 5, not built.

/-- `H.3/plus-construction-predicate`. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- The perfect radical: the largest perfect subgroup. -/
def perfectRadical (G : Type u) [Group G] : Subgroup G :=
  ⨆ (H : Subgroup G) (_ : Group.IsPerfect H), H

theorem IsPlusConstruction.pi1_quotient {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)} [P.Normal]
    (h : IsPlusConstruction f x P) :
    ∃ e : FundamentalGroup X x ⧸ P ≃* FundamentalGroup Y (f.hom x),
      ∀ g : FundamentalGroup X x, e (QuotientGroup.mk g) = FundamentalGroup.map f.hom x g := sorry

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

/-- `H.3/acyclic-pi1-iso-weak-equivalence` (Weibel IV Exercise 1.2(b)). -/
theorem IsAcyclicMap.isWeakHomotopyEquivalence_of_bijective_pi1 [PathConnectedSpace X] {f : X ⟶ Y}
    (hf : IsAcyclicMap f) (x : X) (h1 : Function.Bijective (FundamentalGroup.map f.hom x)) :
    IsWeakHomotopyEquivalence f := sorry

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

/-- `eilenbergMacLaneSpace_not_moore` (non-example): `H₃(K(ℤ/2, 1); ℤ) = H₃(RP^∞; ℤ) ≅ ℤ/2 ≠ 0`, whereas
the Moore space `RP² = M(ℤ/2, 1)` has `H₃ = 0`. -/
example : ¬ IsZero (Stub.singH ℤ 3 (EilenbergMacLaneSpace (ZMod 2) 1)) := sorry

/- `H.3/cohomology-representability`: for a CW complex `X`, based homotopy classes `X → K(G, n)` are
in natural bijection with `Hⁿ(X; G)`. Singular cohomology is Tau Ceti AlgebraicTopology stage 6 and not
in the pinned libraries, so the signature is recorded as a comment:
`theorem cohomologyRepresentability (X : TopCat) [CWComplex X] (G) (n) :
  (based homotopy classes X → EilenbergMacLaneSpace G n) ≃ singularCohomology X G n`. -/
-- signature (not yet statable at the pins): theorem cohomologyRepresentability_signature

/-- `H.3/postnikov-principal-fibrations`, existence part only (Hatcher Example 4.16): maps `X → X_n`
inducing isomorphisms on `π_i`, `i ≤ n`, with `π_i(X_n) = 0` for `i > n`. Principality is not stated here:
the k-invariant needs `EilenbergMacLaneSpace` of `π_n X` with its group structure. -/
theorem postnikovTower [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X] (x : X) (n : ℕ) :
    ∃ (Xn : TopCat.{u}) (p : X ⟶ Xn), (∀ i ≤ n, Function.Bijective (Stub.piMap i p.hom x)) ∧
      ∀ i > n, Subsingleton (HomotopyGroup.Pi i Xn (p.hom x)) := sorry

/- `H.3/relative-hurewicz-trivial-action`: for an `(n-1)`-connected based pair `(X, A, a₀)` of
path-connected spaces, `n ≥ 2`, on which `π₁(A, a₀)` acts trivially on `π_n(X, A, a₀)`, the Hurewicz map
`π_n(X, A) → H_n(X, A; ℤ)` is an isomorphism and `H_i(X, A; ℤ) = 0` for `i < n`. -/
-- signature (not yet statable at the pins): theorem relativeHurewicz_of_trivialAction
-- Relative homotopy groups with their π₁-action and relative singular homology are Tau Ceti
-- AlgebraicTopology stages 8 (item 1) and 2, not built.

/- `H.3/principal-fibration-criterion` (Hatcher Lemma 4.70): for a CW pair `(X, A)` of connected
spaces whose inclusion has homotopy fibre a `K(π, n)`, `A` is weakly equivalent, compatibly with `A ⊆ X`,
to the homotopy fibre of a map `X → K(π, n+1)` iff `π₁(A)` acts trivially on `π_{n+1}(X, A)`. -/
-- signature (not yet statable at the pins): theorem principalFibration_iff_trivialAction
-- The hypothesis needs relative homotopy groups and their π₁(A)-action (Tau Ceti AlgebraicTopology stage 8).

/- `H.3/postnikov-limit-weak-equivalence` (Hatcher Prop. 4.67 and Cor. 4.68): for a tower of fibrations
`⋯ → X₂ → X₁`, `π_i(lim X_n) → lim π_i(X_n)` is onto, and injective when the maps on `π_{i+1}` are
eventually onto; for a Postnikov tower of a connected CW complex `X`, `X → lim X_n` is a weak homotopy
equivalence. -/
-- signature (not yet statable at the pins): theorem postnikovTower_limit_isWeakHomotopyEquivalence
-- Fibrations of spaces (homotopy lifting for all spaces) are not defined in Mathlib or Tau Ceti at the pins.

/- `H.3/obstruction-lifting`: a lift through the principal fibration `X_n → X_{n-1}` extending a lift
on `A` exists iff the obstruction class in `H^{n+1}(W, A; π_n X)` vanishes; relative singular cohomology
is Tau Ceti AlgebraicTopology stage 6, so the signature is recorded as a comment. -/
-- signature (not yet statable at the pins): theorem obstructionLifting

/-- `H.3/abelian-extension-corollary` (Hatcher 4.73), with the cohomological hypothesis replaced by
the sufficient hypothesis that the pair is acyclic (`H_*(W, A; ℤ) = 0`, so all obstruction groups vanish
by universal coefficients); this covers the retraction in `abelianHomologyWhitehead` and the extensions
in `IsPlusConstruction.lift`. -/
theorem abelianExtension [Topology.CWComplex (Set.univ : Set X)] (x : X) (hX : IsAbelianSpace X x)
    {A W : TopCat.{u}} [Topology.CWComplex (Set.univ : Set A)] (i : A ⟶ W)
    (hi_emb : Topology.IsClosedEmbedding i.hom)
    [Topology.RelCWComplex (Set.univ : Set W) (Set.range i.hom)]
    (hi : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map i))
    (g : A ⟶ X) : ∃ G : W ⟶ X, i ≫ G = g := sorry

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
theorem IsPlusConstruction.unique [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set Z)] {f : X ⟶ Y} {f' : X ⟶ Z} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' x P) (hZ : IsAbelianSpace Z (f'.hom x)) :
    ∃ e : ContinuousMap.HomotopyEquiv Y Z, ContinuousMap.Homotopic (e.toFun.comp f.hom) f'.hom := sorry

/-- `H.3/plus-construction-functoriality`. -/
theorem IsPlusConstruction.map {X' Y' : TopCat.{u}} [Topology.CWComplex (Set.univ : Set X)]
    [Topology.CWComplex (Set.univ : Set Y)] [Topology.CWComplex (Set.univ : Set Y')]
    (φ : X ⟶ X') {f : X ⟶ Y} {f' : X' ⟶ Y'} {x : X}
    {P : Subgroup (FundamentalGroup X x)} {P' : Subgroup (FundamentalGroup X' (φ.hom x))}
    (hf : IsPlusConstruction f x P) (hf' : IsPlusConstruction f' (φ.hom x) P')
    (hφ : P.map (FundamentalGroup.map φ.hom x) ≤ P') (hY' : IsAbelianSpace Y' (f'.hom (φ.hom x))) :
    ∃ φp : Y ⟶ Y', ContinuousMap.Homotopic (f ≫ φp).hom (φ ≫ f').hom := sorry

/-- `H.3/plus-hspace-recognition` (Weibel IV Theorem 1.8 and Remark 1.8.1). -/
theorem IsPlusConstruction.recognition_hSpace {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)}
    (hf : IsPlusConstruction f x P) (H : TopCat.{u}) [HSpace H] [PathConnectedSpace H] (hY : IsAbelianSpace Y (f.hom x))
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [Topology.CWComplex (Set.univ : Set H)] (g : X ⟶ H)
    (hg : ∀ n, IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map g)) :
    IsAcyclicMap g ∧ ∃ e : ContinuousMap.HomotopyEquiv Y H, ContinuousMap.Homotopic (e.toFun.comp f.hom) g.hom := sorry

/-- The perfect normal subgroup of `G` is transported along the actual `π₁(BG) ≃* G`.
The induced quotient identification is part of `H.3/plus-pi2-universal-central-extension`.
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

/-- `H.3/plus-pi2-universal-central-extension`: `π₂(BG⁺_P) ≃* H₂(P; ℤ)` for every perfect
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

/- `H.3/plus-pi2-natural`: for `φ : G →* G'` with `φ(P) ≤ P'` and `φ⁺` with `φ⁺ ∘ f ≃ f' ∘ Bφ`
(based, or with trivial `π₁`-action on `π₂(BG'⁺)`), the isomorphisms `π₂(BG⁺) ≅ H₂(P; ℤ)` and
`π₂(BG'⁺) ≅ H₂(P'; ℤ)` carry `φ⁺_*` to `H₂(φ|_P; ℤ)`. -/
-- signature (not yet statable at the pins): theorem plusConstruction.pi2_eq_H2_natural
-- Use the specific `plusConstruction.pi2Equiv G P` above. The based plus map and the
-- universal-central-extension lift of K2SymbolsBrauer T.1 remain prospective inputs.

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

/-- `H.3/serre-class-fibration` (class of finitely generated groups, simply connected base; Hatcher
SSAT Lemma 1.9, case 1). -/
theorem serreClass_fibration_finite {F E B : TopCat.{u}} (i : F ⟶ E) (p : E ⟶ B) (b : B)
    (h : IsHomotopyFiberSequence i p b) [PathConnectedSpace F] [PathConnectedSpace E]
    [SimplyConnectedSpace B]
    (hF : ∀ n, Module.Finite (ULift.{u} ℤ) (Stub.singH (ULift.{u} ℤ) (n + 1) F))
    (hB : ∀ n, Module.Finite (ULift.{u} ℤ) (Stub.singH (ULift.{u} ℤ) (n + 1) B)) :
    ∀ n, Module.Finite (ULift.{u} ℤ) (Stub.singH (ULift.{u} ℤ) (n + 1) E) := sorry

/-- `H.3/serre-class-eilenberg-maclane` (class of finitely generated groups; Hatcher SSAT Lemma 1.10). -/
theorem serreClass_eilenbergMacLane_finite (A : Type u) [AddCommGroup A] [AddGroup.FG A] (n k : ℕ) :
    Module.Finite (ULift.{u} ℤ) (Stub.singH (ULift.{u} ℤ) (k + 1) (EilenbergMacLaneSpace A (n + 1))) := sorry

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

/-- Translations are faithful (Weibel IV 4.2.1): `Aut s → Aut (s ⊗ t)`, `g ↦ g ▷ t`, is injective. -/
def FaithfulTranslations : Prop :=
  ∀ s t : S, Function.Injective (fun g : s ≅ s => whiskerRightIso g t)

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

/-- Mathlib's `F.core` (`CategoryTheory.Functor.core`) is strong monoidal. -/
@[instance_reducible]
def Core.mapMonoidal {T T' : Type u} [Category.{u} T] [Category.{u} T'] [MonoidalCategory T]
    [MonoidalCategory T'] (F : T ⥤ T') [F.Monoidal] :
    letI := Core.monoidalCategory T; letI := Core.monoidalCategory T'; F.core.Monoidal := sorry

/-- The commutative monoid of isomorphism classes under `⊗`: Mathlib's `Skeleton T` with
`Skeleton.instCommMonoid` (isomorphism classes of `Core T` are those of `T`). -/
abbrev Core.isoClassesMonoid (T : Type u) [Category.{u} T] [MonoidalCategory T] [SymmetricCategory T] :
    Type u := Skeleton T

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

/-- `pi0Equiv` is the canonical map: the component of `(m, n)` goes to `[m] - [n]` (Weibel IV 4.3.1). -/
theorem pi0Equiv_vertex (m n : S) :
    pi0Equiv S (ZerothHomotopy.mk (classifyingSpace_vertex (C := SInvS S) (m, n))) =
      Algebra.GrothendieckGroup.of (toSkeleton m) / Algebra.GrothendieckGroup.of (toSkeleton n) := sorry

def swap : SInvS S ⥤ SInvS S := sorry

end SInvS

/-- `SInvS_pic_K0` (computation): for a Picard groupoid (π₀ already a group), `K(S) ≃ π₀ × B Aut(1)`. -/
example [∀ X : S, Nonempty (Σ Y : S, X ⊗ Y ≅ 𝟙_ S)] :
    Nonempty (ZerothHomotopy (SInvS.kSpace S) ≃ Core.isoClassesMonoid S) ∧
      ∀ (n : ℕ) (x : SInvS.kSpace S), 2 ≤ n → Subsingleton (HomotopyGroup.Pi n (SInvS.kSpace S) x) := sorry

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
  /-- Mathlib's coherent left action: natural associativity and unit isomorphisms with their
  coherence conditions (Weibel IV Definition 4.7). -/
  toLeftAction : MonoidalLeftAction S X

/-- The diagonal action `s ⊙ (t, x) = (s ⊗ t, s ⊙ x)` of `S` on `S × X` (uses the symmetry). -/
def MonoidalAction.diag {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    MonoidalAction S (S × X) := sorry

def MonoidalActionCategory {X : Type u} [Category.{u} X] (_a : MonoidalAction S X) : Type u := X

instance {X : Type u} [Category.{u} X] (a : MonoidalAction S X) :
    Category.{u} (MonoidalActionCategory S a) := sorry

namespace MonoidalActionCategory

def regular : MonoidalAction S S := sorry

def loc {X : Type u} [Category.{u} X] (a : MonoidalAction S X) : Type u :=
  MonoidalActionCategory S a.diag

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

/-- `H.4/classifying-space-hspace`: the H-space structure on `BS` with multiplication homotopic to
`B(⊗)` (strictly unital at the vertex of `𝟙_ S` after the homotopy-extension modification); countable
case, in general compactly generated products. -/
@[instance_reducible]
def classifyingSpace.hSpace [Countable S] [∀ X Y : S, Countable (X ⟶ Y)] :
    HSpace (classifyingSpace S) :=
  let _tensor : S → S → S := fun X Y => X ⊗ Y
  sorry

/-- `H.4/classifying-space-hspace` (existence form). -/
theorem classifyingSpace_hSpace [Countable S] [∀ X Y : S, Countable (X ⟶ Y)] :
    Nonempty (HSpace (classifyingSpace S)) := sorry

/-- `H.4/action-projection-cofibred`. -/
theorem MonoidalActionCategory.proj_isCofibred {X : Type u} [Category.{u} X] (a : MonoidalAction S X)
    (hS : FaithfulTranslations S) : (MonoidalActionCategory.proj S a).op.IsFibered := sorry

/-- `H.4/invertible-action-equivalence`. -/
theorem MonoidalActionCategory.incl_homotopyEquiv {X : Type u} [Category.{u} X] (a : MonoidalAction S X)
    (hS : FaithfulTranslations S)
    (hinv : ∀ t : S, ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace X) (classifyingSpace X),
      e.toFun = (classifyingSpaceMap (letI := a.toLeftAction; MonoidalLeftAction.actionLeft X t)).hom)
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
    (hf : IsGroupCompletion f) (g g' : FundamentalGroup Y (HSpace.e : Y)) : g * g' = g' * g := sorry

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

/-- Homotopy associativity of an H-space multiplication. -/
def IsHomotopyAssocHSpace (X : TopCat.{u}) [HSpace X] : Prop :=
  ContinuousMap.Homotopic ((HSpace.hmul (X := X)).comp ((HSpace.hmul (X := X)).prodMap (ContinuousMap.id X)))
    (((HSpace.hmul (X := X)).comp ((ContinuousMap.id X).prodMap (HSpace.hmul (X := X)))).comp
      (⟨Homeomorph.prodAssoc X X X, (Homeomorph.prodAssoc X X X).continuous⟩ : C((X × X) × X, X × X × X)))

/-- `H.4/group-completion-uniqueness`. -/
theorem IsGroupCompletion.homotopyEquiv_of_groupLike {X Y : TopCat.{u}} [HSpace X] [HSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)] {f : X ⟶ Y}
    (hassocX : IsHomotopyAssocHSpace X) (hassocY : IsHomotopyAssocHSpace Y)
    (hf : IsGroupCompletion f) (hX : IsGroupCompletion (𝟙 X)) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f.hom := sorry

/-- `H.4/group-completion-uniqueness-countable`. -/
theorem IsGroupCompletion.unique_of_countable {X Y Y' : TopCat.{u}} [HSpace X] [HSpace Y] [HSpace Y']
    [Topology.CWComplex (Set.univ : Set Y)] [Topology.CWComplex (Set.univ : Set Y')]
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
    (hS : FaithfulTranslations S) (hT : FaithfulTranslations T)
    (hcof : ∀ t : T, ∃ (t' : T) (s : S), Nonempty (t ⊗ t' ≅ F.obj s))
    (haut : ∀ s : S, Function.Bijective (fun g : Aut s => F.mapIso g)) (n : ℕ) (x : SInvS.kSpace S) :
    Function.Bijective (Stub.piMap (n + 1) (classifyingSpaceMap (SInvS.map S F)).hom x) := sorry

/- `H.4/cofinality-projective-modules`. -/
-- signature (not yet statable at the pins): theorem kSpace_projective_plus (R : Type u) [Ring R]
-- `B((iso P(R))⁻¹ iso P(R)) ≃ K₀(R) × BGL(R)⁺`, component-preserving, natural up to homotopy.

/-- `H.4/based-free-module-groupoid`: the groupoid `F(R)` of based free modules `Rⁿ` (objects `ℕ`,
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

/-- `TauCeti.BasedFree.toProj`: `n ↦ Fin n → R`, `g ↦ vecMulLinear g`, landing in the finitely generated
projective modules; strong symmetric monoidal for `⊕` (not stated: `ModuleCat` carries `⊗` as its
monoidal instance). -/
def BasedFree.toProj (R : Type u) [Ring R] : BasedFree R ⥤ Core (ModuleCat.{u} R) := sorry

/-- `TauCeti.BasedFree.map`: a ring hom induces a strict symmetric monoidal functor (entrywise). -/
def BasedFree.map {R R' : Type u} [Ring R] [Ring R'] (φ : R →+* R') : BasedFree R ⥤ BasedFree R' := sorry

/-- `TauCeti.BasedFree.faithfulTranslations`: `g ↦ g ⊕ 1` is injective. -/
theorem BasedFree.faithfulTranslations (R : Type u) [Ring R] : FaithfulTranslations (BasedFree R) := sorry

/-- `TauCeti.BasedFree.cofinal`: every finitely generated projective module is a summand of some `Rⁿ`. -/
theorem BasedFree.cofinal (R : Type u) [Ring R] (P : ModuleCat.{u} R) [Module.Finite R P]
    [Module.Projective R P] : ∃ (Q : ModuleCat.{u} R) (n : ℕ), Nonempty (P ⊞ Q ≅ ModuleCat.of R (Fin n → R)) :=
  sorry

/-- `faithfulTranslations_basedFree` (computation). -/
example (R : Type u) [Ring R] : FaithfulTranslations (BasedFree R) := BasedFree.faithfulTranslations R

/-- `basedFree_isoClasses` (computation): isomorphism classes of `F(R)` are `ℕ`, for every ring. -/
example (R : Type u) [Ring R] : Nonempty (Skeleton (BasedFree R) ≃* Multiplicative ℕ) := sorry

/-- `basedFree_braiding_swap` (computation): the symmetry on `ℤ¹ ⊕ ℤ¹` is not the identity. -/
example : (β_ (⟨1⟩ : BasedFree ℤ) ⟨1⟩).hom ≠ 𝟙 _ := sorry

/-- `basedFree_toProj_not_injective` (non-example): if `R ≅ R²` then `toProj` identifies `R¹` and `R²`,
which are not isomorphic in `F(R)`. -/
example (R : Type u) [Ring R] (e : (Fin 1 → R) ≃ₗ[R] (Fin 2 → R)) :
    Nonempty ((BasedFree.toProj R).obj ⟨1⟩ ≅ (BasedFree.toProj R).obj ⟨2⟩) ∧
      IsEmpty ((⟨1⟩ : BasedFree R) ≅ ⟨2⟩) := sorry

/-- `basedFree_aut_bijective` (compatibility). -/
example (R : Type u) [Ring R] (n : ℕ) :
    Function.Bijective (fun g : Aut (⟨n⟩ : BasedFree R) => (BasedFree.toProj R).mapIso g) := sorry

/-- `H.4/plus-of-product` (acyclicity part): a product of acyclic maps is acyclic; the kernel on `π₁`
of `f × g` is `P × Q`, so a product of plus constructions is a plus construction. -/
theorem IsAcyclicMap.prod {X Y X' Y' : TopCat.{u}} {f : X ⟶ X'} {g : Y ⟶ Y'} (hf : IsAcyclicMap f)
    (hg : IsAcyclicMap g) :
    IsAcyclicMap (TopCat.ofHom (f.hom.prodMap g.hom) : TopCat.of (X × Y) ⟶ TopCat.of (X' × Y')) := sorry

/- `H.4/group-completion-acyclic`. -/
-- signature (not yet statable at the pins): theorem telescope_isAcyclicMap
-- For `S` with a cofinal sequence, the telescope map `B Aut(S) → Y_S` into the basepoint component of
-- `B(S⁻¹S)` is acyclic; `Aut(S) = colim Aut(s_n)` and the telescope map are not defined in this file.

/-- Restriction of an action along a strong monoidal functor (used by `H.4/cofinality-action`). -/
def restrictAction {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Monoidal]
    {X : Type u} [Category.{u} X] (a : MonoidalAction T X) : MonoidalAction S X := sorry

/-- `H.4/cofinality-action`: for `F` cofinal, `S⁻¹X ≃ T⁻¹X`. -/
theorem cofinality_action {S T : Type u} [Groupoid.{u} S] [MonoidalCategory S] [SymmetricCategory S]
    [Groupoid.{u} T] [MonoidalCategory T] [SymmetricCategory T] (F : S ⥤ T) [F.Monoidal]
    (hS : FaithfulTranslations S) (hT : FaithfulTranslations T)
    (hcof : ∀ t : T, ∃ (t' : T) (s : S), Nonempty (t ⊗ t' ≅ F.obj s))
    {X : Type u} [Category.{u} X] (a : MonoidalAction T X) :
    Nonempty (ContinuousMap.HomotopyEquiv (classifyingSpace (MonoidalActionCategory.loc S (restrictAction F a)))
      (classifyingSpace (MonoidalActionCategory.loc T a))) := sorry

/- `H.4/gl-plus-comparison-naturality`. -/
-- signature (not yet statable at the pins): theorem kSpace_basedFree_plus_natural (φ : R →+* R')
-- The equivalence `BGL(R)⁺ ≃ Y_{F(R)}` commutes up to homotopy with `φ⁺` and `B(F(φ)⁻¹F(φ))`, and is an
-- H-map for block sum; `GL(R) = colim GLₙ(R)` and its plus construction are not defined in this file.

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

instance (X : GammaSpace.{u}) [Fact X.IsSpecial] : CommMonoid (pi0Monoid X) := sorry

def IsGrouplike (X : GammaSpace.{u}) : Prop :=
  ∃ hX : X.IsSpecial, letI : Fact X.IsSpecial := ⟨hX⟩; ∀ a : pi0Monoid X, IsUnit a

/-- The discrete Γ-space `[n] ↦ Mⁿ` of a commutative monoid `M` (sums over the fibres of
pointed maps). -/
def ofCommMonoid (M : Type u) [AddCommMonoid M] : GammaSpace.{u} := sorry

instance ofCommMonoid_special (M : Type u) [AddCommMonoid M] :
    Fact (IsSpecial (ofCommMonoid M)) := ⟨sorry⟩

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

instance segalGammaSpace_special (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : Fact (segalGammaSpace C).IsSpecial :=
  ⟨segalGammaSpace.isSpecial C⟩

def segalGammaSpace.map {C D : Type u} [Category.{u} C] [Category.{u} D] [HasZeroObject C]
    [HasBinaryCoproducts C] [HasZeroObject D] [HasBinaryCoproducts D] (F : C ⥤ D)
    [PreservesColimitsOfShape (Discrete WalkingPair) F] [PreservesColimitsOfShape (Discrete.{0} PEmpty) F] :
    segalGammaSpace C ⟶ segalGammaSpace D := sorry

/-- The connective Ω-model built by Γ-space delooping, with group-completed zeroth space.
Its current return type is only the sequence of spaces: spectrum structure remains a review gap. -/
def segalSpectrum (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    ℕ → TopCat.{u} := sorry

/-- Isomorphism classes with the commutative monoid operation induced by categorical sums.
This chooses the sum operation, rather than an unrelated monoidal instance (for modules, tensor
product would give the wrong K₀). -/
abbrev segalIsoClasses (C : Type u) [Category.{u} C] := Quotient (isIsomorphicSetoid C)

instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    CommMonoid (segalIsoClasses C) := sorry

open scoped ZeroObject in
theorem segalIsoClasses.mk_zero (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] :
    (Quotient.mk (isIsomorphicSetoid C) (0 : C) : segalIsoClasses C) = 1 := sorry

theorem segalIsoClasses.mk_coprod (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] (X Y : C) :
    (Quotient.mk (isIsomorphicSetoid C) (X ⨿ Y) : segalIsoClasses C) =
      Quotient.mk (isIsomorphicSetoid C) X * Quotient.mk (isIsomorphicSetoid C) Y := sorry

/-- Before completion: components are the monoid of isomorphism classes under sums. -/
def segalGammaSpace.pi0IsoClasses (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : GammaSpace.pi0Monoid (segalGammaSpace C) ≃* segalIsoClasses C := sorry

/-- Components of the actual group-completed zeroth space, not of `A_C([1])`. -/
abbrev segalSpectrum.pi0 (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] := ZerothHomotopy (segalSpectrum C 0)

instance (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C] :
    CommGroup (segalSpectrum.pi0 C) := sorry

/-- The component map of the Γ-space group completion, expressed on isomorphism classes. -/
def segalSpectrum.toPi0 (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] : segalIsoClasses C →* segalSpectrum.pi0 C := sorry

def segalSpectrum.pi0GrothendieckEquiv (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C] :
    segalSpectrum.pi0 C ≃* Algebra.GrothendieckGroup (segalIsoClasses C) := sorry

/-- The comparison identifies the completion map with the algebraic map on generators. -/
theorem segalSpectrum.pi0GrothendieckEquiv_toPi0 (C : Type u) [Category.{u} C]
    [HasZeroObject C] [HasBinaryCoproducts C] (x : segalIsoClasses C) :
    segalSpectrum.pi0GrothendieckEquiv C (segalSpectrum.toPi0 C x) =
      Algebra.GrothendieckGroup.of x := sorry

/- `segalGammaSpace_finset_sphere` (computation): quoted Barratt–Priddy–Quillen–Segal; comment only. -/
-- signature (not yet statable at the pins): example

/-- `segalGammaSpace_zero_category` (degenerate). -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    [∀ X Y : C, Subsingleton (X ⟶ Y)] : ∀ n, ContractibleSpace (SSet.toTop.obj ((segalGammaSpace C).obj n)) := sorry

/-- `segalGammaSpace_pi0_K0` (compatibility): take a small model of the category of finitely
generated projective modules. The group uses direct sums, and its domain is the zeroth space
after completion. The full-subcategory equivalence records the projective-module application. -/
example (R : Type u) [Ring R] (C : Type u) [Category.{u} C] [HasZeroObject C]
    [HasBinaryCoproducts C]
    (e : C ≌ ObjectProperty.FullSubcategory (fun M : ModuleCat.{u} R =>
      Module.Finite R M ∧ Module.Projective R M)) :
    Nonempty (segalSpectrum.pi0 C ≃* Algebra.GrothendieckGroup (segalIsoClasses C)) := sorry

/-- `segalGammaSpace_rank_group_completion` (computation): the rank monoid of projectives over
a field is ℕ; completion produces ℤ, including negative ranks. This detects the old test's
replacement of K₀ by the pre-completion component set. -/
example (C : Type u) [Category.{u} C] [HasZeroObject C] [HasBinaryCoproducts C]
    (rank : segalIsoClasses C ≃* Multiplicative ℕ) :
    ∃ e : segalSpectrum.pi0 C ≃* Multiplicative ℤ,
      ∀ x : segalIsoClasses C,
        e (segalSpectrum.toPi0 C x) = Multiplicative.ofAdd ((rank x).toAdd : ℤ) := sorry

/- `segalGammaSpace_not_without_sums` (non-example): a groupoid with a monoidal structure has no
binary coproducts in general, so `segalGammaSpace` does not apply to `Core` (instance check). -/
-- signature (not yet statable at the pins): example

/-- `H.4/coherent-subset-construction`. -/
def coherentSubsetGammaSpace (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C] :
    GammaSpace.{u} := sorry

namespace coherentSubsetGammaSpace

variable (C : Type u) [Groupoid.{u} C] [MonoidalCategory C] [SymmetricCategory C]

theorem isSpecial : (coherentSubsetGammaSpace C).IsSpecial := sorry

instance : Fact (coherentSubsetGammaSpace C).IsSpecial := ⟨isSpecial C⟩

def pi0Equiv : GammaSpace.pi0Monoid (coherentSubsetGammaSpace C) ≃* Core.isoClassesMonoid C := sorry

def map {D : Type u} [Groupoid.{u} D] [MonoidalCategory D] [SymmetricCategory D] (F : C ⥤ D)
    [F.Monoidal] : coherentSubsetGammaSpace C ⟶ coherentSubsetGammaSpace D := sorry

theorem level_one : ∃ g : (coherentSubsetGammaSpace C).obj (FinPointed.mk' 1) ⟶ nerve C,
    IsWeakHomotopyEquivalence (SSet.toTop.map g) := sorry

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

/- `H.4/segal-group-completion-homology`. -/
-- signature (not yet statable at the pins): theorem segalGroupCompletion (X : GammaSpace.{u}) (hX : X.IsSpecial)
-- `|X([1])| → Ω|BX([1])|` is a group completion (`IsGroupCompletion`); the classifying space `BX` of a
-- Γ-space, its loop space and the H-space structure on `|X([1])|` are not defined in this file.

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

/-- `S^{m+n} ≅ S^m ∧ S^n` (associativity of `smashMonoidal`), equivariant for the block sum `Σ_m × Σ_n → Σ_{m+n}`. -/
def sphereAddIso (m n : ℕ) : sphere.{u} (m + n) ≅ smash (sphere m) (sphere n) := sorry

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

/-- The data of a symmetric spectrum before the equivariance axiom. -/
structure SymmSpectrum.Data : Type (u + 1) where
  level : ℕ → SSet.Pointed.{u}
  action : ∀ n, Equiv.Perm (Fin n) →* Aut (level n)
  σ : ∀ n, smash (level n) circle ⟶ level (n + 1)

/-- The iterated structure map `σ^m : X_n ∧ S^m → X_{n+m}` (Schwede I (1.2)), built from `σ` and the
associativity isomorphisms of `smashMonoidal`; `σ^0` is the unit isomorphism. -/
def SymmSpectrum.Data.iterσ (X : SymmSpectrum.Data.{u}) (n m : ℕ) :
    smash (X.level n) (SSet.Pointed.sphere m) ⟶ X.level (n + m) := sorry

/-- `H.5:spectra/symmetric-spectrum` (Schwede I Definition 3.1). -/
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

/-- `symmSpectrum_colimit_levelwise` (characterisation): evaluation at each level preserves colimits. -/
example (n : ℕ) : PreservesColimits (level'.{u} n) := sorry

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

def naivePi_loop (X : SymmSpectrum.{u})
    (hX : ∀ n : ℕ, SSet.KanComplex (X.level n).right) (k : ℤ) : naivePi (loop.obj X) k ≃+ naivePi X (k + 1) := sorry

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

/-- Naive homotopy groups vanish in negative degrees; implies `IsConnective` (Schwede I Example 8.50). -/
def IsNaivelyConnective (X : SymmSpectrum.{u}) : Prop := ∀ k : ℤ, k < 0 → Subsingleton (naivePi X k)

theorem IsOmegaSpectrum.naivePi_eq {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) (k : ℤ) (n : ℕ)
    (hkn : 0 ≤ k + n) : Function.Bijective (naivePi_of_level X k n) := sorry

/-- `H.5:spectra/semistable`: `λ_X : S¹ ∧ X → sh X` is a `π̂_*`-isomorphism (Schwede I.3.14). -/
def IsSemistable (X : SymmSpectrum.{u}) : Prop := IsNaivePiIso (lambda.app X)

theorem IsOmegaSpectrum.semistable {X : SymmSpectrum.{u}} (hX : IsOmegaSpectrum X) : IsSemistable X := sorry

/-- `isOmegaSpectrum_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsOmegaSpectrum Z := sorry

/-- `not_isOmegaSpectrum_sphere` (non-example). -/
example : ¬ IsOmegaSpectrum sphere.{u} := sorry

/-- `isConnective_sphere` (computation). -/
example : IsNaivelyConnective sphere.{u} := sorry

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
example (K : SSet.Pointed.{u}) : IsNaivelyConnective (suspensionSpectrum.obj K) := sorry

/-- `free_one_not_piIso` (non-example). -/
example : ¬ IsNaivePiIso ((freeAdj.{u} 1).counit.app sphere) := sorry

/-- `loop_trivial` (degenerate). -/
example (Z : SymmSpectrum.{u}) (hZ : IsZero Z) : IsZero (loop.obj Z) := sorry

/-- `naivePi_shift` (computation). -/
example (X : SymmSpectrum.{u}) (k : ℤ) : Nonempty (naivePi (shift.obj X) (k + 1) ≃+ naivePi X k) := sorry

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

/-- Connective: the true homotopy groups vanish in negative degrees. -/
def IsConnective (X : SymmSpectrum.{u}) : Prop := ∀ k : ℤ, k < 0 → Subsingleton (pi X k)

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

def homotopyClasses.precomp {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (E : SymmSpectrum.{u}) :
    homotopyClasses Y E → homotopyClasses X E := sorry

/-- `H.5:spectra/stable-equivalence` (Hovey–Shipley–Smith Definition 3.1.3, Schwede I Definition 4.11). -/
def stableEquivalences : MorphismProperty SymmSpectrum.{u} :=
  fun _ _ f => ∀ E : SymmSpectrum.{u}, IsInjective E → IsOmegaSpectrum E →
    Function.Bijective (homotopyClasses.precomp f E)

/-- `H.5:spectra/naive-isomorphism-is-stable-equivalence` (Schwede I Theorem 4.23). -/
theorem stableEquivalence_of_naivePiIso {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (hf : IsNaivePiIso f) :
    stableEquivalences f := sorry
/-- Schwede I Theorem 6.2. -/
theorem stableEquivalence_iff_truePi {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    stableEquivalences f ↔ ∀ k, Function.Bijective (pi.map f k) := sorry

/-- A functorial stable equivalence `p_Y : Y ⟶ ωY` to an injective Ω-spectrum (Schwede I Props. 4.10, 4.39). -/
def injectiveOmegaReplacement : SymmSpectrum.{u} ⥤ SymmSpectrum.{u} := sorry

def injectiveOmegaReplacement.ι : 𝟭 SymmSpectrum.{u} ⟶ injectiveOmegaReplacement := sorry

theorem injectiveOmegaReplacement.spec (Y : SymmSpectrum.{u}) :
    IsInjective (injectiveOmegaReplacement.obj Y) ∧ IsOmegaSpectrum (injectiveOmegaReplacement.obj Y) ∧
      stableEquivalences (injectiveOmegaReplacement.ι.app Y) := sorry
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
/-- `H.5:spectra/shc-products` (Schwede II Proposition 1.10(ii)). -/
instance hasProducts : HasProducts.{u} SHC.{u} := sorry
instance : HasZeroObject SHC.{u} := sorry
instance shiftFunctor : HasShift SHC.{u} ℤ := sorry
instance (n : ℤ) : (CategoryTheory.shiftFunctor SHC.{u} n).Additive := sorry

/-- The spheres `S^k`, `k ∈ ℤ`. -/
def sphere (k : ℤ) : SHC.{u} := (CategoryTheory.shiftFunctor SHC k).obj (γ.obj SymmSpectrum.sphere)

def homSphereEquiv (X : SymmSpectrum.{u}) (k : ℤ) : (sphere k ⟶ γ.obj X) ≃ SymmSpectrum.pi X k := sorry

-- signature (not yet statable at the pins): def homSuspensionSpectrumEquiv (K : SSet.Pointed.{u}) (X : SymmSpectrum.{u})
-- (hX : SymmSpectrum.IsOmegaSpectrum X) : pointed homotopy classes `[K, X₀]` ≃ `(γ.obj (suspensionSpectrum.obj K) ⟶ γ.obj X)`
-- (Schwede II Example 1.17); pointed simplicial homotopy classes into a Kan complex are not in Mathlib.

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

/-- The connecting homomorphism `π_k C(f) → π_{k-1} X` (Schwede I (2.11), Prop. 6.11). -/
def mappingCone.piδ {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    pi (mappingCone f) k →+ pi X (k - 1) := sorry

theorem cofibre_exact_cone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (pi.map (mappingCone.inr f) k) (mappingCone.piδ f k) := sorry

theorem cofibre_exact_source {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) (k : ℤ) :
    Function.Exact (mappingCone.piδ f k) (pi.map f (k - 1)) := sorry

/-- The natural comparison `h : S¹ ∧ F(f) → C(f)` (Schwede I (2.16)). -/
def homotopyFiber.toMappingCone {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    susp.obj (homotopyFiber f) ⟶ mappingCone f := sorry

/-- `H.5:spectra/fibre-cofibre-shift` (Schwede I Proposition 2.17). -/
theorem fibre_cofibre_shift {X Y : SymmSpectrum.{u}} (f : X ⟶ Y) :
    stableEquivalences (homotopyFiber.toMappingCone f) := sorry

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

/-- The universal bimorphism `i_{p,q} : X_p ∧ Y_q → (X ∧ Y)_{p+q}` (Schwede I Construction 5.6). -/
def smash.ι (X Y : SymmSpectrum.{u}) (p q : ℕ) :
    SSet.Pointed.smash (X.level p) (Y.level q) ⟶ (smash X Y).level (p + q) := sorry

/-- A bimorphism `(X, Y) → Z` (Schwede I (5.1)): `Σ_p × Σ_q`-equivariant maps `X_p ∧ Y_q → Z_{p+q}`;
the bilinearity diagram (5.1) needs the symmetry isomorphism of `smashMonoidal` and is stated in the packet. -/
structure Bimorphism (X Y Z : SymmSpectrum.{u}) where
  app : ∀ p q, SSet.Pointed.smash (X.level p) (Y.level q) ⟶ Z.level (p + q)
  equivariant : ∀ p q (g : Equiv.Perm (Fin p)) (h : Equiv.Perm (Fin q)),
    SSet.Pointed.smashMap (X.action p g).hom (Y.action q h).hom ≫ app p q =
      app p q ≫ (Z.action (p + q) (finSumFinEquiv.permCongr (Equiv.sumCongr g h))).hom

/-- Restriction along the universal bimorphism (Schwede I (5.2)); injective, with image the bimorphisms
satisfying (5.1). -/
def smash.desc {X Y Z : SymmSpectrum.{u}} (f : smash X Y ⟶ Z) : Bimorphism X Y Z := sorry

theorem smash.desc_injective {X Y Z : SymmSpectrum.{u}} :
    Function.Injective (smash.desc (X := X) (Y := Y) (Z := Z)) := sorry

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

/-- `H.5:spectra/true-homotopy-pairing` (Schwede I Theorem 6.16): `π_k X × π_l Y → π_{k+l}(X ∧ Y)`. -/
def piSmashPairing (X Y : SymmSpectrum.{u}) (k l : ℤ) : pi X k →+ pi Y l →+ pi (smash X Y) (k + l) := sorry

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

/-- The symmetry of the derived smash product (Schwede II Theorem 3.1). -/
@[instance_reducible]
def _root_.TauCeti.SHC.derivedSmashSymmetric :
    letI := SHC.derivedSmash.{u}
    SymmetricCategory SHC.{u} := sorry

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
-- signature (not yet statable at the pins): theorem piPairing_comp_psi (Y Y' : SymmSpectrum.{u}) (p q : ℤ)
-- `ψ_*(x · y)` is the point-set product of `x` and `y` (H.5:spectra/true-homotopy-pairing), for the natural
-- map `ψ : Y ∧ᴸ Y' → Y ∧ Y'`, which is not declared in this file.
-- signature (not yet statable at the pins): theorem piPairing_naturality {X Y X' Y' : SymmSpectrum.{u}} (f : X ⟶ X') (g : Y ⟶ Y') (p q : ℤ)
/-- `H.5:spectra/smash-connectivity` (Schwede II Proposition 5.22). -/
theorem piPairing_bottom_iso (X Y : SymmSpectrum.{u}) (k l : ℤ)
    (hX : ∀ i < k, Subsingleton (pi X i)) (hY : ∀ i < l, Subsingleton (pi Y i)) :
    ∃ φ : TensorProduct ℤ (pi X k) (pi Y l) ≃+ (SHC.sphere (k + l) ⟶ smashL X Y),
      ∀ x y, φ (TensorProduct.tmul ℤ x y) = piPairing X Y k l x y := sorry

/- `piPairing_sphere_ring` (computation): comment (graded-commutative ring `π_* S`). -/
-- signature (not yet statable at the pins): example
/- `piPairing_sphere_unit` (degenerate): for `Y = S` and `1 ∈ π₀ S`, `x · 1` corresponds to `x` under the
unit isomorphism `X ∧ᴸ S ≅ X`. -/
-- signature (not yet statable at the pins): example — the unit isomorphism of `SHC.derivedSmash` and the
-- unit `1 ∈ π₀ S` are not declared in this file.
/- `piPairing_iota_iota` (compatibility): for the fundamental class `ι₁ ∈ π₁(S¹)`, `ι₁ · ι₁` generates
`π₂(S¹ ∧ᴸ S¹) ≅ ℤ` (because `α_{1,1}` is an isomorphism). -/
-- signature (not yet statable at the pins): example — the fundamental class `ι₁` is not declared in this file.
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
  act_assoc : SymmSpectrum.smash.map act (𝟙 R.carrier) ≫ act =
    (SymmSpectrum.smash.assoc carrier R.carrier R.carrier).hom ≫ SymmSpectrum.smash.map (𝟙 carrier) R.mul ≫ act
  act_one : SymmSpectrum.smash.map (𝟙 carrier) R.unit ≫ act = (SymmSpectrum.smash.rightUnitor carrier).hom

/- `H.5:spectra/module-spectra-model-structure` (Schwede IV Theorem 1.3): `TauCeti.SymmRingSpectrum.Module.stableModelCategory`,
`TauCeti.SymmRingSpectrum.Module.HomotopyCategory`, `TauCeti.SymmRingSpectrum.Module.freeAdj` and the tests `moduleSpectra_sphere`, `moduleSpectra_free_hom`,
`moduleSpectra_forget_compat`, `moduleSpectra_not_level` need the category of `R`-modules, not built here. -/
-- signature (not yet statable at the pins): instance Module.stableModelCategory (R : SymmRingSpectrum.{u})

def levelMul (R : SymmRingSpectrum.{u}) (n m : ℕ) :
    SSet.Pointed.smash (R.carrier.level n) (R.carrier.level m) ⟶ R.carrier.level (n + m) :=
  (SymmSpectrum.smash.desc R.mul).app n m

def piRing (R : SymmRingSpectrum.{u}) (p q : ℤ) :
    SymmSpectrum.pi R.carrier p →+ SymmSpectrum.pi R.carrier q →+ SymmSpectrum.pi R.carrier (p + q) := sorry

/-- Degree-zero multiplication and unit from the graded homotopy ring. -/
instance pi0Ring (R : SymmRingSpectrum.{u}) : Ring (SymmSpectrum.pi R.carrier 0) := sorry

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

/-- `H.5:spectra/operadic-algebras` (Schwede III Definition 5.3); the composition maps
`O(n) ∧ O(i₁) ∧ ⋯ ∧ O(iₙ) → O(i₁ + ⋯ + iₙ)` and the axioms are stated in the packet. -/
structure Operad : Type (u + 1) where
  obj : ℕ → SymmSpectrum.{u}
  action : ∀ n, (Equiv.Perm (Fin n))ᵐᵒᵖ →* Aut (obj n)
  unit : sphere ⟶ obj 1

/-- The smash power `A^{∧ n}`, with `A^{∧ 0} = S`. -/
def smashPow (A : SymmSpectrum.{u}) (n : ℕ) : SymmSpectrum.{u} :=
  Nat.iterate (fun B => smash B A) n sphere

/-- Algebras (Schwede III Definition 5.4): `α_n : O(n) ∧ A^{∧ n} → A`; associativity, unit and
`Σ_n`-equivariance are stated in the packet. -/
structure Operad.Algebra (O : Operad.{u}) where
  carrier : SymmSpectrum.{u}
  act : ∀ n, smash (O.obj n) (smashPow carrier n) ⟶ carrier

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

/-- `H.5:spectra/eilenberg-maclane-uniqueness` (Schwede II Theorem 5.25). -/
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

def eilenbergMacLaneRing.piRingEquiv (R : Type u) [Ring R] : pi (eilenbergMacLaneRing R).carrier 0 ≃+* R := sorry

-- `TauCeti.SymmSpectrum.HRModDerivedEquiv`: `Ho(HR-Mod) ≃ DerivedCategory (ModuleCat R)` as triangulated
-- categories for commutative `R` (Shipley); the homotopy category of module spectra is not built here.

/-- `eilenbergMacLaneRing_Z_pi` (computation). -/
example : Nonempty (pi (eilenbergMacLaneRing ℤ).carrier 0 ≃+* ℤ) := ⟨eilenbergMacLaneRing.piRingEquiv ℤ⟩
/-- `eilenbergMacLaneRing_zero` (degenerate). -/
example : IsZero (SHC.γ.obj (eilenbergMacLaneRing (PUnit.{u + 1})).carrier) := sorry
/- `eilenbergMacLaneRing_unit_compat` (compatibility). -/
-- signature (not yet statable at the pins): example
/-- `eilenbergMacLaneRing_smash_not_self` (non-example). -/
example : ¬ Subsingleton (SHC.sphere 1 ⟶ smashL (eilenbergMacLane (ZMod 2)) (eilenbergMacLane (ZMod 2))) := sorry

/-- `H.5:spectra/eilenberg-maclane-of-chain-complex`. -/
def eilenbergMacLaneComplex : CochainComplex (ModuleCat.{u} (ULift ℤ)) ℤ ⥤ SymmSpectrum.{u} := sorry

namespace eilenbergMacLaneComplex

/-- `H.5:spectra/eilenberg-maclane-of-chain-complex-homotopy`: `π_k(HC) ≅ H_k(C) = H^{-k}(C)`. -/
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
/-- `eilenbergMacLaneComplex_single` (compatibility). -/
example (A : Type u) [AddCommGroup A] [_root_.Module (ULift ℤ) A] :
    Nonempty (SHC.γ.obj (eilenbergMacLaneComplex.obj ((HomologicalComplex.single _ _ 0).obj
      (ModuleCat.of (ULift ℤ) A))) ≅ SHC.γ.obj (eilenbergMacLane A)) := eilenbergMacLaneComplex.single A

/-- `eilenbergMacLaneComplex_negative` (computation): `ℤ` in homological degree `-2` (cochain degree `2`). -/
example : Nonempty (pi (eilenbergMacLaneComplex.{0}.obj ((HomologicalComplex.single _ _ 2).obj
    (ModuleCat.of (ULift ℤ) (ULift ℤ)))) (-2) ≃+ ULift ℤ) := sorry
/- `eilenbergMacLaneComplex_sees_differential` (non-example): `H(ℤ →·2 ℤ)` has `π₀ = ℤ/2`, so it is not
`HZ ∨ ΣHZ`; stating it needs chosen coproducts in `SHC`. -/
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

/-- `H.5:spectra/connective-generation` (Schwede II Proposition 5.21): every `(n-1)`-connected spectrum lies in
the smallest class containing `Sⁿ` and closed under sums and extensions to the right. -/
theorem connective_generation (n : ℤ) (P : SHC.{u} → Prop) (hS : P (sphere n))
    (hsum : ∀ (ι : Type u) (f : ι → SHC.{u}) [HasCoproduct f], (∀ i, P (f i)) → P (∐ f))
    (hext : ∀ T ∈ distTriang SHC.{u}, P T.obj₁ → P T.obj₂ → P T.obj₃)
    (X : SHC.{u}) (hX : ∀ k < n, Subsingleton (piObj X k)) : P X := sorry

/- `H.5:spectra/cellular-approximation` (Schwede II Proposition 5.14), for a set of compact objects of a
triangulated category with sums and a cohomological functor: comment only. -/
-- signature (not yet statable at the pins): theorem cellularApproximation

/-- `H.5:spectra/shc-products`: `π_k` commutes with products. -/
def piProdEquiv {J : Type u} (Y : J → SHC.{u}) (k : ℤ) : piObj (∏ᶜ Y) k ≃+ ∀ j, piObj (Y j) k := sorry

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
/-- `postnikovSection_zero_HA` (computation): `P₀(X⟨0⟩) ≅ H(π₀ X)`. -/
example (X : SymmSpectrum.{u}) :
    Nonempty ((SHC.postnikovSection 0).obj ((SHC.connectiveCover 0).obj (SHC.γ.obj X)) ≅
      SHC.γ.obj (SymmSpectrum.eilenbergMacLane (SymmSpectrum.pi X 0))) := sorry
/- `connectiveCover_wedge_example` (compatibility): for `X = HZ ∨ Σ²HZ ∨ Σ⁻²HZ`, `connectiveCover 0 X ≅ HZ ∨ Σ²HZ`
and `postnikovSection (-1) X ≅ Σ⁻²HZ`; stating it needs chosen coproducts in `SHC`. -/
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

/-- `H.5:S-delooping/iterated-S-construction-omega-spectrum`: positive Ω-spectrum (levels `n + 1 ≥ 1`). -/
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

theorem liftHom_piZero {m m' : ℕ} (φ : ZMod m →+ ZMod m') (x : piObj (moore.{u} m) 0) :
    piZero m' (x ≫ liftHom φ) = φ (piZero m x) := sorry

end moore

/-- `moore_one_trivial` (degenerate). -/
example : IsZero (moore.{u} 1) := sorry
/-- `moore_two_pi_two` (computation). -/
example : Nonempty (piObj (moore.{u} 2) 2 ≃+ ZMod 4) := sorry
/- `moore_homology_compat` (compatibility): comment (agreement with Weibel's Moore spaces `P^m(ℤ/m)`). -/
-- signature (not yet statable at the pins): example
/-- `moore_two_not_ring` (non-example). -/
example : (2 : ℤ) • 𝟙 (moore.{u} 2) ≠ 0 := sorry

/-- `H.6/coefficient-spectrum`: `E/m := E ∧ᴸ S/m`, functorial in `E`; it is a cofibre of `m • 𝟙 E`
(`modM.triangle_distinguished`). -/
def modM (E : SHC.{u}) (m : ℕ) : SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorObj E (moore m)

namespace modM

def triangle (E : SHC.{u}) (m : ℕ) : Triangle SHC.{u} :=
  Triangle.mk ((m : ℤ) • 𝟙 E) (sorry : E ⟶ modM E m) sorry

theorem triangle_distinguished (E : SHC.{u}) (m : ℕ) : triangle E m ∈ distTriang SHC := sorry

def smashIso (E : SHC.{u}) (m : ℕ) : letI := SHC.derivedSmash.{u}
    modM E m ≅ MonoidalCategory.tensorObj E (moore m) := sorry

def functor (m : ℕ) : SHC.{u} ⥤ SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorRight (moore m)

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

/-- The Bockstein `π_n(E; ℤ/m) → π_{n-1}(E)`: composition with `(modM.triangle E m).mor₃ : E/m → ΣE`
followed by the shift identification `[S^n, ΣE] ≅ [S^{n-1}, E]`. -/
def piMod.bockstein (E : SHC.{u}) (m : ℕ) (n : ℤ) : piMod E m n →+ piObj E (n - 1) := sorry

/-- `H.6/mod-l-homotopy-and-bockstein-sequence`: the universal coefficient sequence, stated for
`E = γ X` through the true homotopy groups of `X`. -/
theorem universalCoefficient (X : SymmSpectrum.{u}) (m : ℕ) (n : ℤ) :
    ∃ (i : TensorProduct ℤ (SymmSpectrum.pi X n) (ZMod m) →+ piMod (γ.obj X) m n)
      (j : piMod (γ.obj X) m n →+ AddSubgroup.torsionBy (SymmSpectrum.pi X (n - 1)) m),
      (∀ x : SymmSpectrum.pi X n, i (TensorProduct.tmul ℤ x 1) =
        (homSphereEquiv X n).symm x ≫ (modM.triangle (γ.obj X) m).mor₂) ∧
      (∀ y, (j y : SymmSpectrum.pi X (n - 1)) =
        homSphereEquiv X (n - 1) (piMod.bockstein (γ.obj X) m n y)) ∧
      Function.Injective i ∧ Function.Surjective j ∧ ∀ y, (∃ x, i x = y) ↔ j y = 0 := sorry

/-- `H.6/uct-splitting`: for `m` odd or `4 ∣ m` the universal coefficient sequence splits (not naturally),
so `π_n(E; ℤ/m)` is abstractly the sum of its two outer terms. -/
theorem universalCoefficient_split (X : SymmSpectrum.{u}) (m : ℕ) (n : ℤ) (hm : Odd m ∨ 4 ∣ m) :
    Nonempty (piMod (γ.obj X) m n ≃+
      (TensorProduct ℤ (SymmSpectrum.pi X n) (ZMod m) × AddSubgroup.torsionBy (SymmSpectrum.pi X (n - 1)) m)) :=
  sorry

/-- `H.6/coprime-coefficient-decomposition`: `S/q₁q₂ ≅ S/q₁ ∨ S/q₂` for coprime `q₁, q₂`, stated on
mod-`q₁q₂` homotopy groups. -/
def moore.coprimeIso (q₁ q₂ : ℕ) (h : Nat.Coprime q₁ q₂) :
    (moore.{u} q₁ ⨿ moore q₂) ≅ moore (q₁ * q₂) := sorry

theorem piMod_coprime (E : SHC.{u}) (q₁ q₂ : ℕ) (h : Nat.Coprime q₁ q₂) (n : ℤ) :
    Nonempty (piMod E (q₁ * q₂) n ≃+ piMod E q₁ n × piMod E q₂ n) := sorry

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

/-- `holimTower_const` (degenerate). -/
example (E : SHC.{u}) : Nonempty (holimTower ((Functor.const _).obj E) ≅ E) := ⟨holimTower.const E⟩
/-- `holimTower_zero_maps` (computation). -/
example (X : ℕᵒᵖ ⥤ SHC.{u}) (hX : ∀ n : ℕ, X.map (homOfLE (Nat.le_succ n)).op = 0) :
    IsZero (holimTower X) := sorry
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

/-- `H.6/milnor-sequence`, Mittag-Leffler case: if the tower `π_{k+1} X_n` is Mittag-Leffler then
`lim¹ π_{k+1} X_n = 0`, so `π_k holim → lim π_k X_n` is injective. -/
theorem milnor_injective_of_isMittagLeffler (X : ℕᵒᵖ ⥤ SHC.{u}) (k : ℤ)
    (hML : (X ⋙ coyoneda.obj (Opposite.op (sphere.{u} (k + 1)))).IsMittagLeffler)
    (y y' : piObj (holimTower X) k) (h : ∀ n, y ≫ holimTower.π X n = y' ≫ holimTower.π X n) :
    y = y' := sorry

/-- `H.6/nonzero-lim-one-example`: the tower `⋯ →p S →p S` has `π_{-1}(holim) ≅ ℤ_p ⧸ ℤ ≠ 0`. -/
theorem nonzeroLimOne (p : ℕ) [Fact p.Prime] : ∃ X : ℕᵒᵖ ⥤ SHC.{u},
    (∀ n, Subsingleton (piObj (X.obj (Opposite.op n)) (-1))) ∧ ¬ Subsingleton (piObj (holimTower X) (-1)) := sorry

/-- `H.6/p-completion`: `E^∧_p := F(S/p^∞, ΣE)` (internal Hom of the derived smash product, not a
declaration of this file); `pCompletion.isoHolim` identifies it with the homotopy limit of `E/pʳ`. -/
def pCompletion (p : ℕ) (E : SHC.{u}) : SHC.{u} := sorry

namespace pCompletion

/-- The canonical map, adjoint to `Id ∧ δ : E ∧ S/p^∞ → ΣE`. -/
def unit (p : ℕ) (E : SHC.{u}) : E ⟶ pCompletion p E := sorry
def functor (p : ℕ) : SHC.{u} ⥤ SHC.{u} := sorry
def functorObjIso (p : ℕ) (E : SHC.{u}) : (functor p).obj E ≅ pCompletion p E := sorry
theorem unit_naturality (p : ℕ) {E F : SHC.{u}} (f : E ⟶ F) :
    f ≫ unit p F ≫ (functorObjIso p F).inv = unit p E ≫ (functorObjIso p E).inv ≫ (functor p).map f := sorry
/-- Schwede II Theorem 9.9(iii) and Remark 9.11. -/
def isoHolim (p : ℕ) (E : SHC.{u}) : pCompletion p E ≅ holimTower (modTower E p) := sorry

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

/-- `H.6/p-complete-bounded-exponent`: bounded exponent. -/
theorem isPComplete_of_bounded (p N : ℕ) (X : SymmSpectrum.{u})
    (h : ∀ k (x : SymmSpectrum.pi X k), (p ^ N : ℕ) • x = 0) : IsPComplete p (γ.obj X) := sorry

/-- `H.6/p-complete-mod-prime-power`. -/
theorem isPComplete_modPrimePower (p : ℕ) [Fact p.Prime] (r : ℕ) (E : SHC.{u}) :
    IsPComplete p (modM E (p ^ (r + 1))) := sorry

/-- `H.6/p-complete-closure`: cofibres (the other closure forms remain to be typed). -/
theorem isPComplete_triangle (p : ℕ) [Fact p.Prime] (T : Pretriangulated.Triangle SHC.{u})
    (hT : T ∈ distTriang SHC) (h₁ : IsPComplete p T.obj₁) (h₂ : IsPComplete p T.obj₂) :
    IsPComplete p T.obj₃ := sorry

theorem isPComplete_holimTower (p : ℕ) [Fact p.Prime] (X : ℕᵒᵖ ⥤ SHC.{u})
    (h : ∀ n : ℕ, IsPComplete p (X.obj (Opposite.op n))) :
    IsPComplete p (holimTower X) := sorry

/-- `H.6/p-complete-mod-p-detection`. -/
theorem isPComplete_modP_iff_isIso (p : ℕ) [Fact p.Prime] {E E' : SHC.{u}}
    (hE : IsPComplete p E) (hE' : IsPComplete p E') (f : E ⟶ E') :
    IsIso ((modM.functor p).map f) ↔ IsIso f := sorry

/-- The diagram `S →1 S →2 S →3 ⋯`; its telescope is the rational sphere. -/
def rationalSphereDiagram : ℕ ⥤ SHC.{u} := sorry

def rationalSphere : SHC.{u} := hocolimSeq rationalSphereDiagram

/-- `H.6/rationalisation`: smash with the fixed rational-sphere telescope. -/
def rationalizationFunctor : SHC.{u} ⥤ SHC.{u} :=
  letI := SHC.derivedSmash.{u}
  MonoidalCategory.tensorLeft rationalSphere
def rationalization (E : SHC.{u}) : SHC.{u} := rationalizationFunctor.obj E
def rationalization.unit (E : SHC.{u}) : E ⟶ rationalization E := sorry
theorem rationalization.unit_natural {E E' : SHC.{u}} (f : E ⟶ E') :
    rationalization.unit E ≫ rationalizationFunctor.map f = f ≫ rationalization.unit E' := sorry
theorem rationalization.pi (X : SymmSpectrum.{u}) (k : ℤ) :
    Nonempty (piObj (rationalization (γ.obj X)) k ≃+ TensorProduct ℤ (SymmSpectrum.pi X k) ℚ) := sorry
theorem rationalization.smashHQ (E : SHC.{u}) : letI := SHC.derivedSmash.{u}
    Nonempty (rationalization E ≅ MonoidalCategory.tensorObj (γ.obj (SymmSpectrum.eilenbergMacLane (ULift ℚ))) E) := sorry
def IsRational (E : SHC.{u}) : Prop := IsIso (rationalization.unit E)
def rationalization.homEquiv (E T : SHC.{u}) (hT : IsRational T) :
    (rationalization E ⟶ T) ≃ (E ⟶ T) := sorry
theorem rationalization.homEquiv_apply (E T : SHC.{u}) (hT : IsRational T)
    (f : rationalization E ⟶ T) :
    rationalization.homEquiv E T hT f = rationalization.unit E ≫ f := sorry
/-- `H.6/rational-spectra-generalized-eilenberg-maclane`: a spectrum with uniquely divisible homotopy
groups is the product `∏_k Σ^k H(π_k X)` (Schwede II Theorem 9.6; uses Serre finiteness, a packet gap). -/
theorem rational_generalizedEM (X : SymmSpectrum.{u})
    (hX : ∀ (k : ℤ) (n : ℕ), n ≠ 0 → Function.Bijective (fun x : SymmSpectrum.pi X k => n • x)) :
    Nonempty (γ.obj X ≅ ∏ᶜ (fun k : ULift.{u} ℤ =>
      (CategoryTheory.shiftFunctor SHC.{u} k.down).obj
        (γ.obj (SymmSpectrum.eilenbergMacLane (SymmSpectrum.pi X k.down))))) := sorry

/-- `rationalization_zero` (degenerate). -/
example (Z : SHC.{u}) (hZ : IsZero Z) : IsZero (rationalization Z) := sorry
/-- `rationalization_sphere` (computation). -/
example : Nonempty (rationalization (sphere.{0} 0) ≅ γ.obj (SymmSpectrum.eilenbergMacLane ℚ)) := sorry
/-- `rationalization_pi_zero_sphere` (computation). -/
example : Nonempty (piObj (rationalization (sphere.{0} 0)) 0 ≃+ ℚ) := sorry
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
  model : ℤ ⥤ SymmSpectrum.{u}

namespace FilteredSpectrum

/-- The SHC shadow; model-level maps retain the coherence needed for natural cofibres. -/
abbrev X (F : FilteredSpectrum.{u}) : ℤ ⥤ SHC.{u} := F.model ⋙ γ

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
example (E : SymmSpectrum.{u}) (s : ℤ) : IsZero (gr ⟨(Functor.const ℤ).obj E⟩ s) := sorry
/- `filteredSpectrum_postnikov_gr` (computation): comment (`gr_s` of the Whitehead filtration is `Σ⁻ˢ H(π_{−s} X)`). -/
-- signature (not yet statable at the pins): example
/- `filteredSpectrum_spectralObject_compat` (compatibility): comment (π₀ of `toSpectralObject` via
Mathlib's `Triangulated.SpectralObject.mapHomologicalFunctor` has `E₁ = π_*(gr)`). -/
-- signature (not yet statable at the pins): example
/-- `filteredSpectrum_complete_not_exhaustive` (non-example). -/
example (E : SymmSpectrum.{u}) (hE : ¬ IsZero (γ.obj E)) :
    ¬ IsComplete ⟨(Functor.const ℤ).obj E⟩ := sorry

/-- The other half of `filteredSpectrum_complete_not_exhaustive`: the zero filtration of a
nonzero target is complete but does not exhaust the target's homotopy groups. -/
example (Z E : SymmSpectrum.{u}) (hZ : IsZero (γ.obj Z)) (hE : ¬ IsZero (γ.obj E)) :
    let F : FilteredSpectrum.{u} := ⟨(Functor.const ℤ).obj Z⟩
    F.IsComplete ∧ ¬ F.IsExhaustive (γ.obj E) (fun _ => 0) := sorry

end FilteredSpectrum

end TauCeti.SHC

namespace TauCeti

/-- `H.6/exact-couple`: a bigraded exact couple with `i : D_{pq} → D_{pq+a}`, `j : D_{pq} → E_{pq+b}`,
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

/-- `exactCouple_zero_E` (degenerate): zero `E` makes every `i` invertible and every page zero. -/
example (C : ExactCouple.{u} a b c) (hE : ∀ pq, IsZero (C.E pq)) :
    (∀ pq, IsIso (C.i pq)) ∧ ∀ (r : ℕ) (pq : ℤ × ℤ), IsZero (C.page r pq) := sorry

/-- `exactCouple_two_stage` (computation): the couple of `0 → X₀ → X₁ = X` has no
negative `D` columns and only two `E` columns. All pages from E² are isomorphic, and
`0 → coker(d₁ : π_(n+1) gr₁ → π_n X₀) → π_n X →
ker(d₁ : π_n gr₁ → π_(n−1) X₀) → 0` is exact. -/
example (C : ExactCouple.{u} (1, -1) (0, 0) (-1, 0))
    (hD : ∀ (p q : ℤ), p < 0 → IsZero (C.D (p, q)))
    (hE : ∀ (p q : ℤ), p ≠ 0 → p ≠ 1 → IsZero (C.E (p, q))) (n : ℤ) :
    (∀ r : ℕ, 2 ≤ r → ∀ pq, Nonempty (C.page r pq ≅ C.page 2 pq)) ∧
      (C.twoStageExtension hD n).ShortExact := sorry

/-- `exactCouple_not_complex` (non-example): an exact couple may have `i² ≠ 0`.
Take constant D = E = ℤ² and i(x,y)=(x,0), j(x,y)=(y,0), k(x,y)=(0,y).
The three vertices are exact, and j ∘ k squares to zero, but i is a nonzero idempotent.
This rules out treating the D row as a chain complex differential. -/
example : ∃ C : ExactCouple.{0} (0, 0) (0, 0) (0, 0),
    C.i (0, 0) ≫ C.i ((0, 0) + (0, 0)) ≠ 0 := sorry

end ExactCouple

namespace SHC.FilteredSpectrum

def exactCouple (F : FilteredSpectrum.{u}) : ExactCouple.{u + 1} (1, -1) (0, 0) (-1, 0) := sorry

/-- `H.6/filtered-spectrum-spectral-sequence`. -/
def spectralSequence (F : FilteredSpectrum.{u}) :
    SpectralSequence (ModuleCat.{u + 1} ℤ) (fun r => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

/-- The `E¹` homological data core with `d_r` of bidegree `(-r, r - 1)` for spectral objects indexed by
`EInt` (Mathlib at the pin provides only `E₂` data cores). -/
def coreE₁Homological : CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore EInt
    (fun r : ℤ => ComplexShape.up' ((-r, r - 1) : ℤ × ℤ)) 1 := sorry

-- signature (not yet statable at the pins): theorem spectralSequence.E1 (F : FilteredSpectrum.{u}) (s t : ℤ)
-- `E¹_{s,t} ≅ π_{s+t}(gr_s F)`.

def spectralSequence.map {F G : FilteredSpectrum.{u}} (φ : F.model ⟶ G.model) :
    (spectralSequence F).Hom (spectralSequence G) := sorry

def abutmentFiltration (F : FilteredSpectrum.{u}) (E : SHC.{u}) (c : ∀ s, F.X.obj s ⟶ E) (s k : ℤ) :
    AddSubgroup (SHC.piObj E k) := AddMonoidHom.range (Preadditive.rightComp (SHC.sphere k) (c s))

end SHC.FilteredSpectrum

/- `spectralSequence_trivial` / `spectralSequence_single_step` / `spectralSequence_compat_exactCouple` /
`spectralSequence_E2_not_abutment`: comment-level tests (see the packet). -/
-- signature (not yet statable at the pins): example

/- `H.6/spectral-sequence-convergence-exhaustive` (Lurie HA 1.2.2.14). -/
-- signature (not yet statable at the pins): theorem SHC.FilteredSpectrum.converges_of_boundedBelow (F : SHC.FilteredSpectrum.{u})
--       (hF : F.IsBoundedBelow)
-- Strong convergence to `π_*(colim F)` with `E^∞_{s,t} ≅ F_s π_{s+t} / F_{s-1} π_{s+t}`.

/- `H.6/spectral-sequence-convergence-complete`. -/
-- signature (not yet statable at the pins): theorem SHC.tower_converges_of_connectivity (Y : ℕᵒᵖ ⥤ SHC.{u})
-- Put L = holim Y, F_s = fib(Y_s → Y_(s-1)), with Y_s = 0 for s < 0.
-- If for every n, all π_k(F_s) with k ≤ n vanish uniformly for sufficiently large s, the tower page
-- E¹_(s,t) = π_(t-s)(F_s), d_r : (s,t) → (s+r,t+r-1), converges strongly to π_* L.
-- Use the coherent complete filtration X_i = fib(L → Y_(-i-1)); then gr_(-s) X ≃ F_s.
-- A bare reversal Z_i = Y_(-i) has colimit zero and gr_(1-s) Z ≃ ΣF_s; its colimit abutment is unsuitable.
-- The general complete case is the next node; the convergence and coherent tower-fibre carriers remain prospective.

/- `H.6/spectral-sequence-conditional-convergence` (Boardman 1999, Theorems 7.1 and 8.2, quoted): a complete
tower converges conditionally to `π_*(Y)`, and strongly when `RE_∞ = lim¹_r Z^r_{s,t} = 0`. -/
-- signature (not yet statable at the pins): theorem SHC.FilteredSpectrum.converges_conditionally (F : SHC.FilteredSpectrum.{u}) (hF : F.IsComplete)
-- The r-cycles `Z^r`, the derived term `RE_∞` and conditional convergence have no declarations in this file
-- or in Mathlib (only pages and their homology isomorphisms).

/- `H.6/atiyah-hirzebruch-spectral-sequence`. -/
-- signature (not yet statable at the pins): theorem atiyahHirzebruch (E : SHC.{u}) (X : TopCat.{u}) [Topology.CWComplex (Set.univ : Set X)]
-- `E²_{p,q} = H_p(X; π_q E) ⇒ E_{p+q}(X)`, from the skeletal filtration of `Σ^∞_+ X`.

/- `H.6/moore-spectrum-multiplication` (Araki–Toda): for `ℓ^ν ∉ {2, 3, 4, 8}`, `S/ℓ^ν` has a homotopy
associative and commutative unital multiplication; the unit and associativity diagrams in `SHC` need the
derived smash product's coherence isomorphisms, so the signature is a comment. -/
-- signature (not yet statable at the pins): theorem moore_multiplication

/- `H.6/browder-scholium-mod-products` (Browder, quoted by Weibel IV Scholium 2.8.1): if `π_m E = 0` for even
`m > 0` and for `m < 0`, then `E ∧ S/ℓ^ν` is a homotopy associative and commutative ring spectrum for every
`ℓ^ν`; as for `moore_multiplication`, homotopy ring structures need the coherence isomorphisms of the derived
smash product, so the signature is a comment. -/
-- signature (not yet statable at the pins): theorem browder_mod_products

/- `H.6/burklund-quotient-tower` (Burklund Theorems 1.5 and 5.2): in a stably `E_m`-monoidal stable
∞-category (`m ≥ 2`) with `v : I → 𝟙` such that `𝟙/v` has a right unital multiplication, there is a tower of
`E_n`-algebras `⋯ → 𝟙/v^{n+2} → 𝟙/v^{n+1}` (`n ≤ m`), unique up to equivalence for each `q > n`; applies to
`v = 4` and `v = p` odd in spectra. `E_n`-algebras in stable ∞-categories are not in Mathlib. -/
-- signature (not yet statable at the pins): theorem burklund_quotient_tower

/- `H.6/burklund-moore-multiplicative`: `S/8` admits an `E₁`-algebra structure (and more; comment). -/
-- signature (not yet statable at the pins): theorem burklund_moore
-- `S/2^q` is `E_n` for `q ≥ (3/2)(n+1)`; `S/p^q` is `E_n` for `q ≥ n + 1`, `p` odd (Burklund 1.1–1.2).

end TauCeti
