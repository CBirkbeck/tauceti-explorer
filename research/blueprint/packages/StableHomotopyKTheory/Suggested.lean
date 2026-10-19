import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map

/-!
# StableHomotopyKTheory: representative target signatures

README.md is the roadmap and the full mathematical specification. This file is
not exhaustive: it records light definitions and milestones statable against
the pinned Mathlib and Tau Ceti APIs. New theorem proofs use `sorry`.

The signatures specify realised nerves, endpoint-based homotopy fibres,
acyclic maps and plus recognition. Spectra, their localisations, coefficient
objects and filtered constructions are specified in the README. The examples
also fix the coefficient-transition and exact-couple conventions on existing
abelian groups, without presupposing any spectral carrier.
-/

namespace TauCetiRoadmap.StableHomotopyKTheory

set_option autoImplicit false
noncomputable section

open CategoryTheory CategoryTheory.Limits Simplicial

universe u v

namespace Existing

/-- Notation for the existing singular-homology functor with regular coefficients. -/
abbrev singH (R : Type u) [CommRing R] (n : ℕ) (X : TopCat.{u}) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).obj X

end Existing

/-! ## Layer 1: Classifying spaces and category homology -/

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

/-- The vertex is the adjunction unit evaluated on the object zero-simplex. -/
def classifyingSpace_vertex (X : C) : classifyingSpace C :=
  TopCat.toSSetObjEquiv (classifyingSpace C) (Opposite.op ⦋0⦌)
    (((sSetTopAdj.unit.app (nerve C)).app (Opposite.op ⦋0⦌))
      (ComposableArrows.mk₀ X)) default

/-- Realisation of a functor carries the selected vertex to the image vertex. -/
theorem classifyingSpaceMap_vertex (F : C ⥤ D) (X : C) :
    (classifyingSpaceMap F).hom (classifyingSpace_vertex X) = classifyingSpace_vertex (F.obj X) := sorry

/-- Realisation has no components besides those represented by objects. -/
theorem classifyingSpace_zerothHomotopy :
    ∃ e : ZerothHomotopy (classifyingSpace C) ≃ CategoryTheory.ConnectedComponents C,
      ∀ X : C, e (ZerothHomotopy.mk (classifyingSpace_vertex X)) =
        CategoryTheory.ConnectedComponents.mk X := sorry

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

/-- Realisation admits the CW structure specified in §1.3. -/
theorem realisation_has_cw (X : SSet.{u}) :
    Nonempty (Topology.CWComplex (Set.univ : Set (SSet.toTop.obj X))) := sorry

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

/-- Reversal of nerve simplices gives an opposite-space homeomorphism (§1.7). -/
theorem classifyingSpace_op_homeomorph :
    Nonempty (classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C) := sorry

/-- the canonical map `B(C × D) → BC × BD` is a homeomorphism when
`BD` is a finite complex. -/
theorem classifyingSpaceProdHomeomorph (C D : Type u) [Category.{v} C] [Category.{v} D]
    [(nerve D).Finite] :
    IsHomeomorph (fun x : classifyingSpace (C × D) =>
      ((classifyingSpaceMap (CategoryTheory.Prod.fst C D)).hom x,
        (classifyingSpaceMap (CategoryTheory.Prod.snd C D)).hom x)) := sorry


/-- A natural transformation gives a homotopy of the realised maps (§1.10). -/
theorem NatTrans.classifyingSpaceHomotopic {F G : C ⥤ D} (η : F ⟶ G) :
    ContinuousMap.Homotopic (classifyingSpaceMap F).hom (classifyingSpaceMap G).hom := sorry

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

/-- Quillen's Theorem A: the given map has a homotopy inverse (§2.34). -/
theorem quillenTheoremA (F : C ⥤ D)
    (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- The selected vertex of the unique object represents the sole component of a point. -/
example : ∀ x : classifyingSpace (Discrete PUnit.{1}),
    x = classifyingSpace_vertex (Discrete.mk PUnit.unit) := sorry

/-- Distinct objects of a discrete category give distinct vertices. -/
example : classifyingSpace_vertex (Discrete.mk false) ≠
    classifyingSpace_vertex (Discrete.mk true) := sorry

/-- The two ordinal vertices are distinct even though their space is contractible. -/
example : classifyingSpace_vertex (0 : Fin 2) ≠ classifyingSpace_vertex (1 : Fin 2) := sorry

/-- The pinned bar differentials fix inverse action and the order of the middle face (§1.32). -/
example {k G : Type} [CommRing k] [Group G] (A : Rep k G) (g h : G) (a : A) :
    groupHomology.d₁₀ A (Finsupp.single g a) = A.ρ g⁻¹ a - a ∧
    groupHomology.d₂₁ A (Finsupp.single (g, h) a) =
      Finsupp.single h (A.ρ g⁻¹ a) - Finsupp.single (g * h) a + Finsupp.single g a := by
  exact ⟨groupHomology.d₁₀_single A g a, groupHomology.d₂₁_single (g, h) a⟩

/-- Noncommuting permutations distinguish the two possible composition orders (§1.32). -/
example : let g := Equiv.swap (0 : Fin 3) 1; let h := Equiv.swap (1 : Fin 3) 2
    (g * h) (2 : Fin 3) = 0 ∧ (h * g) (2 : Fin 3) = 1 := by decide

/-- The forward Grothendieck edge underlying Thomason's comparison (§2.32). -/
example (F : C ⥤ Cat.{v, u}) {c d : C} (f : c ⟶ d) (x : F.obj c) :
    let a : (⟨c, x⟩ : CategoryTheory.Grothendieck F) ⟶
      ⟨d, (F.map f).toFunctor.obj x⟩ := ⟨f, 𝟙 _⟩
    a.base = f ∧ a.fiber = 𝟙 _ := by
  exact ⟨rfl, rfl⟩

end CategoryTheory

/-! ## Layer 2: Homotopy fibres and Quillen's theorems -/

namespace TauCeti

variable {A B : TopCat.{u}}

/-- pairs `(a, γ)` with `γ 0 = f a`, `γ 1 = b`. -/
def homotopyFiber (f : A ⟶ B) (b : B) : TopCat.{u} :=
  TopCat.of {p : A × C(unitInterval, B) // p.2 0 = f.hom p.1 ∧ p.2 1 = b}

namespace homotopyFiber

/-- The projection uses the existing subtype and product topologies. -/
def proj (f : A ⟶ B) (b : B) : homotopyFiber f b ⟶ A :=
  TopCat.ofHom ⟨fun p => p.1.1, by fun_prop⟩

/-- If f(a₀)=b, choose (a₀,const). -/
def basepoint (f : A ⟶ B) (a₀ : A) : homotopyFiber f (f.hom a₀) :=
  ⟨(a₀, ContinuousMap.const _ (f.hom a₀)), rfl, rfl⟩

end homotopyFiber

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

/-- An empty source has an empty homotopy fibre, including over a nonempty target. -/
example (b : B) (f : TopCat.of PEmpty.{u + 1} ⟶ B) : IsEmpty (homotopyFiber f b) := sorry

/-- Projection of the selected constant path returns its starting point. -/
example (f : A ⟶ B) (a : A) :
    (homotopyFiber.proj f (f.hom a)).hom (homotopyFiber.basepoint f a) = a := rfl

/-- The selected fibre point has a constant path with both endpoints at the image. -/
example (f : A ⟶ B) (a : A) (t : unitInterval) :
    (homotopyFiber.basepoint f a).val.2 t = f.hom a := rfl

/-- Constant-path inclusion makes `A` homotopy equivalent to the mapping path space `E_f`.
The contracting homotopy need not be over `B`. -/
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

/-! ## Layer 3: The plus construction -/

variable {X Y Z : TopCat.{u}}

/-- path-connected with vanishing integral homology in positive degrees
(equivalently, nonempty with vanishing reduced integral homology). -/
def IsAcyclicSpace (F : TopCat.{u}) : Prop :=
  PathConnectedSpace F ∧ ∀ n : ℕ, IsZero (Existing.singH (ULift.{u} ℤ) (n + 1) F)

/-- Contractible spaces are acyclic. -/
theorem IsAcyclicSpace.of_contractible (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := sorry

/-- Homotopy equivalence preserves acyclicity. -/
theorem IsAcyclicSpace.of_homotopyEquiv {F F' : TopCat.{u}} (e : ContinuousMap.HomotopyEquiv F F')
    (h : IsAcyclicSpace F) : IsAcyclicSpace F' := sorry

/-- `isAcyclicSpace_point`: A one-point space is acyclic. -/
example : IsAcyclicSpace (TopCat.of PUnit.{u + 1}) := sorry

/-- `not_isAcyclicSpace_empty`: The empty space is not acyclic: the nonempty path-connectedness condition fails. -/
example : ¬ IsAcyclicSpace (TopCat.of PEmpty.{u + 1}) := sorry

/-- `not_isAcyclicSpace_circle`: The circle is not acyclic: H₁(S¹; ℤ) = ℤ. -/
example : ¬ IsAcyclicSpace (TopCat.of (Circle)) := sorry

/-- `isAcyclicSpace_poincare_sphere_minus_point`: The Poincaré homology 3-sphere minus a point is acyclic but has nontrivial perfect π₁ ≅ the binary icosahedral group SL₂(F₅). -/
example : ∃ F : TopCat.{0}, IsAcyclicSpace F ∧ ∃ x : F, Nontrivial (FundamentalGroup F x) := sorry

/-- An acyclic CW space has superperfect fundamental group. -/
theorem IsAcyclicSpace.perfect_and_H2 {F : TopCat.{u}} [Topology.CWComplex (Set.univ : Set F)]
    (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) ∧
      IsZero (groupHomology (Rep.trivial (ULift.{u} ℤ) (FundamentalGroup F x) (ULift.{u} ℤ)) 2) := sorry

/-- every homotopy fibre is acyclic. -/
def IsAcyclicMap (f : X ⟶ Y) : Prop := ∀ y : Y, IsAcyclicSpace (homotopyFiber f y)

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

/-- On connected CW complexes, acyclic maps surject on π₁ with perfect kernel (§3.4). -/
theorem IsAcyclicMap.pi1_surjective_perfect_kernel
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [PathConnectedSpace X] [PathConnectedSpace Y] {f : X ⟶ Y}
    (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) ∧
      Group.IsPerfect (FundamentalGroup.map f.hom x).ker := sorry

/-- Constant-coefficient consequence of the full local-system criterion (§3.7). -/
theorem IsAcyclicMap.homology_criterion
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [PathConnectedSpace X] [PathConnectedSpace Y] (f : X ⟶ Y)
    (hf : IsAcyclicMap f) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- Acyclic f with ker(π₁f)=P. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- The induced quotient isomorphism π₁X/P≅π₁Y. -/
theorem IsPlusConstruction.pi1_quotient {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)} [P.Normal]
    (h : IsPlusConstruction f x P) :
    ∃ e : FundamentalGroup X x ⧸ P ≃* FundamentalGroup Y (f.hom x),
      ∀ g : FundamentalGroup X x, e (QuotientGroup.mk g) = FundamentalGroup.map f.hom x g := sorry

/-- `isPlusConstruction_acyclic_toPoint`: For X acyclic, X → point is a plus construction relative to π₁(X). -/
example (hX : IsAcyclicSpace X) (x : X) :
    IsPlusConstruction (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) x ⊤ := sorry

/-- `not_isPlusConstruction_nonperfect`: No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect. -/
example (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) (hP : ¬ Group.IsPerfect P) :
    ¬ IsPlusConstruction f x P := sorry

/-- The identity is plus relative to the trivial subgroup. -/
example (x : X) : IsPlusConstruction (𝟙 X) x ⊥ := sorry

/-- Plus existence at every perfect normal subgroup of a connected CW space (§3.10). -/
theorem plus_exists [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] [Group.IsPerfect P] :
    ∃ (Y : TopCat.{u}) (_ : Topology.CWComplex (Set.univ : Set Y))
      (_ : PathConnectedSpace Y) (f : X ⟶ Y), IsPlusConstruction f x P := sorry

end TauCeti

/-! ## Layer 4: Group completion

The monoidal group-completion spaces and their comparisons are specified in
README §§4.1–4.32; their carriers require constructions beyond the pinned API.
-/

/-- The component difference convention sends (2,1) to +1 and (1,2) to −1 (§4.5). -/
example : (2 : ℤ) - 1 = 1 ∧ (1 : ℤ) - 2 = -1 ∧ (0 : ℤ) - 0 = 0 := by decide

/-- The rank-one automorphism obstructs a natural unit-to-id-times-swap map (§4.3). -/
example : (!![(-1 : ℤ), 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠
    !![(1 : ℤ), 0; 0, -1] := by decide

/-! ## Layer 5: Symmetric spectra

README §§5.1–5.42 specifies the pointed smash, spectra, stable localisation,
monoidal structures and coefficient objects together with their full APIs.
-/

/-- Two odd degrees contribute a Koszul minus sign, and a degree-zero factor contributes plus (§5.25). -/
example : (-1 : ℤ) ^ (1 * 1 : ℕ) = -1 ∧ (-1 : ℤ) ^ (0 * 1 : ℕ) = 1 := by decide

/-- The integral minus sign becomes plus in characteristic two (§5.25). -/
example : (-1 : ZMod 2) = 1 := by decide

/-- Matrix units fix the regular right-module multiplication order (§5.32). -/
example :
    (!![(0 : ℤ), 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ) * !![0, 0; 1, 0] = !![1, 0; 0, 0] ∧
    (!![(0 : ℤ), 0; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) * !![0, 1; 0, 0] = !![0, 0; 0, 1] := by decide

/-- The actual cochain shift puts a degree-two object in degree one (§5.34). -/
example : Nonempty (((CategoryTheory.shiftFunctor (CochainComplex (ModuleCat ℤ) ℤ) (1 : ℤ)).obj
    ((HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 2).obj (ModuleCat.of ℤ ℤ))).X 1 ≅
      ModuleCat.of ℤ ℤ) := sorry

/-- A degree-two object has zero degree-minus-two component; the two cochain conventions differ (§5.33). -/
example : IsZero (((HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 2).obj
    (ModuleCat.of ℤ ℤ)).X (-2)) := by
  exact HomologicalComplex.isZero_single_obj_X _ _ _ _ (by decide)

attribute [local instance] HasDerivedCategory.standard in
open scoped ZeroObject in
/-- The existing derived-category rotation has minus the suspended identity (§5.21). -/
example (A : DerivedCategory (ModuleCat ℤ)) :
    (Pretriangulated.Triangle.mk (𝟙 A) (0 : A ⟶ (0 : DerivedCategory (ModuleCat ℤ)))
      (0 : (0 : DerivedCategory (ModuleCat ℤ)) ⟶
        (CategoryTheory.shiftFunctor _ (1 : ℤ)).obj A)).rotate.mor₃ =
      -(𝟙 ((CategoryTheory.shiftFunctor _ (1 : ℤ)).obj A)) := by
  change -(CategoryTheory.shiftFunctor _ (1 : ℤ)).map (𝟙 A) = _
  rw [CategoryTheory.Functor.map_id]

/-! ## Layer 6: K-theory spectrum assembly

The Waldhausen and iterated S-construction targets are in README §§6.1–6.3.
-/

/-! ## Layer 7: Coefficients, completion and filtered convergence -/

/-- The Moore inclusion at p=2,r=1 sends 1 mod 2 to 2 mod 4 (§7.7). -/
example : (2 : ZMod 4) + 2 = 0 ∧ (2 : ZMod 4) ≠ 0 := by decide

/-- The reduction in the same square sends 1 mod 4 to 1 mod 2 (§7.7). -/
example : ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2) (1 : ZMod 4) = 1 := by decide

/-- The CRT inclusions for 2 and 3 have images 3 and 2 in Z/6 (§7.6). -/
example : (2 : ℕ) * (3 : ZMod 6) = 0 ∧ (3 : ℕ) * (2 : ZMod 6) = 0 ∧
    (3 : ZMod 6) + 2 = 5 := by decide

/-- In the exact-couple witness, i²=i≠0; these are not complex differentials (§7.25). -/
example : let i : ℤ × ℤ → ℤ × ℤ := fun p => (p.1, 0)
    i (i (1, 0)) = (1, 0) ∧ i (1, 0) ≠ (0, 0) := by decide

/-- The same couple has jk(0,1)=(1,0)≠0, but (jk)²=0 (§7.25). -/
example : let j : ℤ × ℤ → ℤ × ℤ := fun p => (p.2, 0)
    let k : ℤ × ℤ → ℤ × ℤ := fun p => (0, p.2)
    j (k (0, 1)) = (1, 0) ∧ j (k (j (k (0, 1)))) = (0, 0) := by decide

/-- The exact-couple homological differential lowers total degree (§7.26). -/
example (r s t : ℤ) : (s - r) + (t + r - 1) = s + t - 1 := by omega

/-- Tower differentials also lower total degree by one (§7.28). -/
example (r s t : ℤ) : (t + r - 1) - (s + r) = t - s - 1 := by omega

/-- The arithmetic-fracture difference kills the diagonal and fixes its order (§7.23). -/
example : (1 : ℚ) - 1 = 0 ∧ (2 : ℚ) - 1 = 1 ∧ (1 : ℚ) - 2 = -1 := by norm_num

/-- The sign local system on a circle has T-1=-2 (§1.26). -/
example (x : ℤ) : -x - x = -2 * x := by ring

/-- The first rational-telescope arrows multiply by one and two (§7.21). -/
example (x : ℤ) : (1 : ℤ) * x = x ∧ (2 : ℤ) * x = x + x := by omega

/-
Further definitions and their full APIs are specified in README.md:
Layer 1: toTopCWComplex, CGWH and its categorical closures, categorySimplicialModule,
categoryChainComplex, categoryHomology, categoryHomologyFunctor, twisted cellular
comparisons, Group.classifyingSpace and the edge/bar comparisons.
Layer 2: IsWeakHomotopyEquivalence, IsHomotopyFiberSequence,
IsHomotopyFiberSequenceOfHomotopy, IsHurewiczFibration, homotopyPullback,
IsHomotopyCartesian, IsHomotopyCartesianOfHomotopy, IsQuasiFibration,
SimplicialSpace.realization, BisimplicialSet.realization, IsProper,
PiStarKanCondition, SpaceDiagram.hocolim and the comma/fibre comparisons.
Layer 3: perfectRadical, plusConstruction, IsAbelianSpace, EilenbergMacLaneSpace,
SpaceTower.holim, postnikovTower, abelianExtension, UniversalCentralExtension,
SerreClass, multiplicativeSerreSequence and rationalEMCohomology.
Layer 4: core_pi0_isoClasses, SInvS, FaithfulTranslations, MonoidalActionCategory,
MonoidalAction.diag, IsHomotopyAssocHSpace, IsHomotopyCommHSpace,
pontryaginLocalization, IsGroupCompletion, stableGeneralLinearGroup,
stableElementaryGroup, BasedFree, projectiveFreeComplement, GammaSpace,
summingFunctors, segalGammaSpace, segalSpectrum, coherentSubsetGammaSpace,
symmetricTensorCoherence, topologicalVariant and simplicialRingOfContinuous.
Layer 5: SSet.Pointed and its smash, spheres and loops; SymmSpectrum with its
iterated structure maps, naivePi, IsOmegaSpectrum, IsNaivelyConnective,
suspensionSpectrum, free, loop, susp, shift, IsSemistable, stableEquivalences,
IsInjective, homotopyClasses, pi and IsConnective; SHC, mappingCone,
homotopyFiber, smash, derivedSmash, piPairing, SymmRingSpectrum and Module,
Operad and its algebra models, eilenbergMacLane, eilenbergMacLaneComplex,
connectiveCover, postnikovSection, postnikovTStructure, hocolimSeq, telescope,
sequentialStableModel and spectraInfinityCategory.
Layer 6: WaldhausenCategory, ExactFunctor, S, K0 and kSpectrum.
Layer 7: moore, modM, piMod, modTower, holimTower, towerLimit,
abelianTower.difference and its kernel/cokernel, multiplicationTower,
pCompletion, IsPComplete, generalMoore, completionZEquiv, rationalization,
IsRational, FilteredSpectrum and ExactCouple with their spectral sequences.
-/

end

end TauCetiRoadmap.StableHomotopyKTheory
