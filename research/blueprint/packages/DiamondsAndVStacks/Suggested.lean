import Mathlib

/-!
# Diamonds and v-stacks: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib API. It is not an exhaustive list of the results in
any layer.

Three design choices are made explicit. First, the spectral-topology layer extends Mathlib's
`SpectralSpace`, `IsSpectralMap` and `constructibleTopology` rather than introducing competing
predicates; locally spectral spaces and the relative spectral-map condition are new predicates on top
of them. Second, the geometric layers are stated relative to a supplied category `C` with an
underlying-space functor `sp : C ⥤ TopCat` and supplied morphism properties (pro-étale, étale,
finite étale, open and closed immersions); these parameters are to be instantiated with the
perfectoid category and its morphism classes once PerfectoidSpaces supplies them, and nothing below
is a definition of perfectoid spaces. Third, the pro-category is carried by `(Ind Cᵒᵖ)ᵒᵖ`, so that
it agrees with Mathlib's `Ind` and no separate Hom formula has to be postulated.

Statements without the required geometric carriers or comparison interfaces are absent from this
file; the closing comment names them.
-/

noncomputable section

open CategoryTheory CategoryTheory.Bicategory CategoryTheory.Limits Opposite Topology

universe u

namespace TauCetiRoadmap.DiamondsAndVStacks

/-! ## Layer 0: spectral topology and its dual -/

/-- A topological space is locally spectral if it has an open cover by spectral subspaces
(ECD Definition 2.1). -/
def IsLocallySpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ Nonempty (SpectralSpace U)

/-- A spectral space is locally spectral. -/
theorem IsLocallySpectralSpace.of_spectralSpace (X : Type u)
    [TopologicalSpace X] [SpectralSpace X] : IsLocallySpectralSpace X := by sorry

/-- A continuous map of locally spectral spaces is spectral if its restriction to every pair of
spectral opens `U ⊆ X`, `V ⊆ Y` with `f U ⊆ V` is a spectral map in Mathlib's sense. The
quantification is over all such pairs, not over a chosen cover. -/
def IsSpectralMap.locally {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop := Continuous f ∧
  ∀ (U : Set X) (V : Set Y), IsOpen U → IsOpen V →
    Nonempty (SpectralSpace U) → Nonempty (SpectralSpace V) →
    (∀ x ∈ U, f x ∈ V) → IsSpectralMap (fun x : U => (⟨f x, by sorry⟩ : V))

/-- Between spectral spaces the relative condition agrees with Mathlib's `IsSpectralMap`. -/
theorem IsSpectralMap.locally_iff_isSpectralMap {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) : IsSpectralMap.locally f ↔ IsSpectralMap f := by sorry

/-- Composites of spectral maps of locally spectral spaces are spectral. -/
theorem IsSpectralMap.locally_comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : IsSpectralMap.locally f) (hg : IsSpectralMap.locally g)
    (hY : IsLocallySpectralSpace Y) : IsSpectralMap.locally (g ∘ f) := by sorry

/-- The relative condition may be tested on one cover of the source by spectral opens mapping
into spectral opens of the target. -/
theorem IsSpectralMap.locally_iff_of_cover {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (f : X → Y) (hf : Continuous f)
    (hX : IsLocallySpectralSpace X) (hY : IsLocallySpectralSpace Y)
    {ι : Type u} (U : ι → Set X) (V : ι → Set Y)
    (ho : ∀ i, IsOpen (U i) ∧ IsOpen (V i))
    (hs : ∀ i, Nonempty (SpectralSpace (U i)) ∧ Nonempty (SpectralSpace (V i)))
    (hcover : ⋃ i, U i = Set.univ) (hm : ∀ i x, x ∈ U i → f x ∈ V i) :
    IsSpectralMap.locally f ↔
      ∀ i, IsSpectralMap (fun x : U i => (⟨f x, hm i x x.2⟩ : V i)) := by sorry

/-- An open subspace of a locally spectral space is locally spectral. -/
theorem IsLocallySpectralSpace.isOpen {X : Type u} [TopologicalSpace X]
    (hX : IsLocallySpectralSpace X) {U : Set X} (hU : IsOpen U) :
    IsLocallySpectralSpace U := by sorry

/-- A locally spectral space has a basis of quasi-compact opens and is sober and `T0`. -/
theorem IsLocallySpectralSpace.isOpen_isCompact_basis {X : Type u}
    [TopologicalSpace X] (hX : IsLocallySpectralSpace X) :
    TopologicalSpace.IsTopologicalBasis {U : Set X | IsOpen U ∧ IsCompact U} ∧
      QuasiSober X ∧ T0Space X := by sorry

/-- An infinite discrete space is locally spectral but not quasi-compact, so the locally spectral
and spectral predicates differ. -/
example : IsLocallySpectralSpace ℕ ∧ ¬ CompactSpace ℕ := by sorry

/-- The inclusion of an open subset of a spectral space is a spectral map exactly when the subset is
quasi-compact. -/
example (X : Type u) [TopologicalSpace X] [SpectralSpace X] (U : Set X)
    (ho : IsOpen U) : IsSpectralMap (Subtype.val : U → X) ↔ IsCompact U := by sorry

/-- On spectral spaces the relative predicate is Mathlib's. -/
example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] (f : X → Y) :
    IsSpectralMap.locally f ↔ IsSpectralMap f := by sorry

/-- The constructible topology of a spectral space is Hausdorff and totally disconnected, hence
profinite together with Mathlib's compactness (ECD Theorem 2.2 and the paragraph after it). -/
theorem ConstructibleTopologyProfinite (X : Type u) [TopologicalSpace X]
    [SpectralSpace X] : T2Space (WithConstructibleTopology X) ∧
      TotallyDisconnectedSpace (WithConstructibleTopology X) := by sorry

/-- The image of a pro-constructible subset under a spectral map of spectral spaces is
pro-constructible (ECD Lemma 2.3). Pro-constructibility is closedness in the constructible
topology, as in Tau Ceti's `IsProConstructible`. -/
theorem ProConstructibleSubsets {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (S : Set X) (hS : IsClosed[constructibleTopology X] S) :
    IsClosed[constructibleTopology Y] (f '' S) := by sorry

/-- The closure of a pro-constructible subset of a spectral space is its set of specializations
(ECD Lemma 2.4). -/
theorem ClosureOfProConstructible {X : Type u} [TopologicalSpace X] [SpectralSpace X]
    (S : Set X) (hS : IsClosed[constructibleTopology X] S) :
    closure S = {y | ∃ x ∈ S, x ⤳ y} := by sorry

/-- A surjective generalizing spectral map of spectral spaces is a quotient map
(ECD Lemma 2.5). -/
theorem GeneralizingSurjectionIsQuotient {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (hg : GeneralizingMap f)
    (hs : Function.Surjective f) : IsQuotientMap f := by sorry

namespace Spectral

/-- The Hochster dual topology: generated by the complements of the quasi-compact opens
(KL15 Definition 8.1.4). -/
@[instance_reducible]
def inverseTopology (X : Type u) [TopologicalSpace X] : TopologicalSpace X :=
  TopologicalSpace.generateFrom {U | ∃ V : Set X, IsOpen V ∧ IsCompact V ∧ U = Vᶜ}

/-- The inverse topology of a spectral space is spectral. -/
theorem inverseTopology_spectral (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    @SpectralSpace X (inverseTopology X) := by sorry

/-- Taking the inverse topology twice returns the original topology. -/
theorem inverseTopology_inverse (X : Type u) [t : TopologicalSpace X] [SpectralSpace X] :
    @inverseTopology X (inverseTopology X) = t := by sorry

/-- The inverse topology reverses specialization. -/
theorem inverseTopology_specializes (X : Type u) [t : TopologicalSpace X]
    [SpectralSpace X] (x y : X) :
    @Specializes X (inverseTopology X) x y ↔ @Specializes X t y x := by sorry

/-- A finite discrete space is unchanged. -/
example (X : Type u) [Finite X] : @inverseTopology X ⊥ = ⊥ := by sorry

/-- The constructible topology is unchanged by passing to the inverse topology. -/
example (X : Type u) [t : TopologicalSpace X] [SpectralSpace X] :
    @constructibleTopology X (inverseTopology X) = @constructibleTopology X t := by sorry

/-- The Sierpiński topology on `Bool`, with `{true}` open. -/
@[instance_reducible]
def sierpinskiTopology : TopologicalSpace Bool := TopologicalSpace.generateFrom {{true}}

/-- On the Sierpiński space the inverse topology makes the other point open. -/
example : @IsOpen Bool (@inverseTopology Bool sierpinskiTopology) {false} ∧
    ¬ @IsOpen Bool sierpinskiTopology {false} := by sorry

end Spectral

/-- The connected-component space of a spectral space is profinite (ECD, proof of Lemma 7.2). -/
theorem SpectralComponentsProfinite (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    CompactSpace (ConnectedComponents X) ∧ T2Space (ConnectedComponents X) ∧
      TotallyDisconnectedSpace (ConnectedComponents X) := by sorry

/-! ## Layer 0: quotients, limits and spectral submersions -/

/-- Quotients by pro-constructible equivalence relations (ECD Lemma 2.7). For a quasi-separated
locally spectral `X` and an equivalence relation `r` whose graph is closed in the constructible
topology of `X × X` and whose two projections are quasi-compact, spectral in the relative sense
and generalizing, the quotient is `T0`, and every quasi-compact open `W` lies in an open
`r`-invariant `U` contained in an `r`-invariant intersection `E'` of a nonempty family of
quasi-compact opens. -/
theorem ProConstructibleEquivalenceRelation {X : Type u} [TopologicalSpace X]
    [QuasiSeparatedSpace X] (hX : IsLocallySpectralSpace X) (r : Setoid X)
    (hR : IsClosed[constructibleTopology (X × X)] {p : X × X | r p.1 p.2})
    (hs : IsSpectralMap.locally (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (ht : IsSpectralMap.locally (fun p : {p : X × X // r p.1 p.2} => p.1.2))
    (hqs : ∀ V : Set X, IsOpen V → IsCompact V →
      IsCompact ((fun p : {p : X × X // r p.1 p.2} => p.1.1) ⁻¹' V))
    (hqt : ∀ V : Set X, IsOpen V → IsCompact V →
      IsCompact ((fun p : {p : X × X // r p.1 p.2} => p.1.2) ⁻¹' V))
    (hgs : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (hgt : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.2)) :
    T0Space (Quotient r) ∧
    ∀ W : Set X, IsOpen W → IsCompact W →
      ∃ U E' : Set X, IsOpen U ∧ (∀ x y, r x y → (x ∈ U ↔ y ∈ U)) ∧ W ⊆ U ∧ U ⊆ E' ∧
        (∀ x y, r x y → (x ∈ E' ↔ y ∈ E')) ∧
        ∃ S : Set (Set X), S.Nonempty ∧ (∀ V ∈ S, IsOpen V ∧ IsCompact V) ∧ E' = ⋂₀ S := by
  sorry

/-- The spectral quotient criterion (ECD Lemma 2.9). For spectral `X` and a pro-constructible
equivalence relation with generalizing projections, if the quotient topology has a basis whose
preimages are quasi-compact then the quotient is spectral and the projection is spectral and
generalizing. The basis hypothesis is not automatic (ECD Remark 2.8). -/
theorem SpectralQuotientCriterion {X : Type u} [TopologicalSpace X] [SpectralSpace X]
    (r : Setoid X) (hR : IsClosed[constructibleTopology (X × X)] {p : X × X | r p.1 p.2})
    (hgs : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (hgt : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.2))
    (hbasis : ∃ B : Set (Set (Quotient r)), TopologicalSpace.IsTopologicalBasis B ∧
      ∀ V ∈ B, IsCompact (Quotient.mk r ⁻¹' V)) :
    SpectralSpace (Quotient r) ∧ IsSpectralMap (Quotient.mk r) ∧
      GeneralizingMap (Quotient.mk r) := by sorry

/-- The open case of the quotient criterion (ECD Lemma 2.10): under the hypotheses of
`ProConstructibleEquivalenceRelation`, if the projections are open then the quotient is locally
spectral and quasi-separated and the projection is open, spectral and quasi-compact. -/
theorem SpectralQuotientCriterion.of_isOpenMap {X : Type u} [TopologicalSpace X]
    [QuasiSeparatedSpace X] (hX : IsLocallySpectralSpace X) (r : Setoid X)
    (hR : IsClosed[constructibleTopology (X × X)] {p : X × X | r p.1 p.2})
    (hs : IsSpectralMap.locally (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (ht : IsSpectralMap.locally (fun p : {p : X × X // r p.1 p.2} => p.1.2))
    (hqs : ∀ V : Set X, IsOpen V → IsCompact V →
      IsCompact ((fun p : {p : X × X // r p.1 p.2} => p.1.1) ⁻¹' V))
    (hqt : ∀ V : Set X, IsOpen V → IsCompact V →
      IsCompact ((fun p : {p : X × X // r p.1 p.2} => p.1.2) ⁻¹' V))
    (hgs : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (hgt : GeneralizingMap (fun p : {p : X × X // r p.1 p.2} => p.1.2))
    (hos : IsOpenMap (fun p : {p : X × X // r p.1 p.2} => p.1.1))
    (hot : IsOpenMap (fun p : {p : X × X // r p.1 p.2} => p.1.2)) :
    IsLocallySpectralSpace (Quotient r) ∧ QuasiSeparatedSpace (Quotient r) ∧
      IsOpenMap (Quotient.mk r) ∧ IsSpectralMap.locally (Quotient.mk r) ∧
      ∀ V : Set (Quotient r), IsOpen V → IsCompact V → IsCompact (Quotient.mk r ⁻¹' V) := by
  sorry

/-- Local spectrality of a relation projection does not imply quasi-compactness: the universal
relation on the infinite discrete space has an infinite fibre over a compact singleton. -/
example : IsSpectralMap.locally (fun p : ℕ × ℕ => p.1) ∧
    ¬ IsCompact ((fun p : ℕ × ℕ => p.1) ⁻¹' ({0} : Set ℕ)) := by sorry

/-- A spectral submersion: a surjective spectral map of spectral spaces along which quasi-compact
openness of preimages descends to openness (Arc Definition 2.14, stated topologically). -/
def IsSpectralSubmersion {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop := IsSpectralMap f ∧ Function.Surjective f ∧
      ∀ U : Set Y, IsOpen (f ⁻¹' U) → IsCompact (f ⁻¹' U) → IsOpen U

/-- Descent of openness may be tested on constructible subsets of the target. -/
theorem IsSpectralSubmersion.iff_constructible {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y]
    (f : X → Y) (hf : IsSpectralMap f) (hs : Function.Surjective f) :
    IsSpectralSubmersion f ↔
      ∀ U : Set Y, IsConstructible U → IsOpen (f ⁻¹' U) → IsOpen U := by sorry

/-- A spectral quotient map is a spectral submersion. -/
theorem IsSpectralSubmersion.of_quotient {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] (f : X → Y) (hf : IsSpectralMap f) (hq : IsQuotientMap f) :
    IsSpectralSubmersion f := by sorry

/-- Spectral submersions compose. -/
theorem IsSpectralSubmersion.comp {X Y Z : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] (f : X → Y) (g : Y → Z)
    (hf : IsSpectralSubmersion f) (hg : IsSpectralSubmersion g) :
    IsSpectralSubmersion (g ∘ f) := by sorry

/-- The identity is a spectral submersion. -/
example (X : Type u) [TopologicalSpace X] : IsSpectralSubmersion (@id X) := by sorry

/-- A surjective generalizing spectral map is a spectral submersion. -/
example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] (f : X → Y) (hf : IsSpectralMap f)
    (hg : GeneralizingMap f) (hs : Function.Surjective f) :
    IsSpectralSubmersion f := by sorry

/-- Arc Remark 2.18: spectral submersions need not be ordinary quotient maps. -/
example : ∃ (X Y : TopCat.{0}) (_ : SpectralSpace X) (_ : SpectralSpace Y)
    (f : X ⟶ Y), IsSpectralSubmersion f ∧ ¬ IsQuotientMap f := by sorry

/-- A spectral map which misses a point fails the surjectivity requirement. -/
example : ¬ IsSpectralSubmersion (fun _ : PUnit => false) := by sorry

section Limits

variable {I : Type u} [Category.{u} I] [IsCofiltered I]
    (F : I ⥤ TopCat.{u}) [∀ i, SpectralSpace (F.obj i)]

/-- A cofiltered limit of spectral spaces along spectral transition maps is spectral
(ECD Lemma 2.11). -/
theorem CofilteredLimitsOfSpectralSpaces
    (hs : ∀ {i j} (f : i ⟶ j), IsSpectralMap (F.map f)) :
    SpectralSpace (limit F : TopCat.{u}) := by sorry

/-- A cofiltered limit of spectral submersions is a spectral submersion (Arc Lemma 2.17). -/
theorem SpectralSubmersionsUnderLimits (G : I ⥤ TopCat.{u})
    [∀ i, SpectralSpace (G.obj i)] (f : F ⟶ G)
    (hF : ∀ {i j} (a : i ⟶ j), IsSpectralMap (F.map a))
    (hG : ∀ {i j} (a : i ⟶ j), IsSpectralMap (G.map a))
    (hf : ∀ i, IsSpectralSubmersion (f.app i)) :
    IsSpectralSubmersion (limMap f).hom := by sorry

end Limits

/-! ## Layer 0: pro-categories, Hochster realization and profinite presentations -/

/-- The pro-category of `C`, carried by the opposite of Mathlib's Ind-completion of `Cᵒᵖ`. -/
abbrev Pro (C : Type*) [Category.{u} C] := (Ind Cᵒᵖ)ᵒᵖ

namespace Pro

variable {C : Type u} [Category.{u} C]

/-- A cofiltered diagram in `C` determines a pro-object. -/
def mk {I : Type u} [Category.{u} I] [IsCofiltered I] (F : I ⥤ C) : Pro C := by sorry

/-- The carrier agrees with Mathlib's `Ind` by construction. -/
def equivProOp : Pro C ≌ (Ind Cᵒᵖ)ᵒᵖ := CategoryTheory.Equivalence.refl

/-- Flattening a cofiltered system of pro-objects to a pro-object. No equivalence
`Pro (Pro C) ≌ Pro C` is asserted. -/
def flatten : Pro (Pro C) ⥤ Pro C := by sorry

variable {I J : Type u} [Category.{u} I] [Category.{u} J] [IsCofiltered I] [IsCofiltered J]

/-- The stage `i ↦ Hom (Y i, Z j)` of the double-limit Hom formula. -/
def homStage (Y : I ⥤ C) (Z : J ⥤ C) (j : J) : Iᵒᵖ ⥤ Type u where
  obj i := Y.obj (unop i) ⟶ Z.obj j
  map f := TypeCat.ofHom fun h => Y.map f.unop ≫ h
  map_id := by sorry
  map_comp := by sorry

/-- The diagram `j ↦ colim_i Hom (Y i, Z j)`. -/
def homDiagram (Y : I ⥤ C) (Z : J ⥤ C) : J ⥤ Type u where
  obj j := colimit (homStage Y Z j)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- `Hom (lim Y, lim Z) ≃ lim_j colim_i Hom (Y i, Z j)`. -/
def homEquiv (Y : I ⥤ C) (Z : J ⥤ C) :
    (mk Y ⟶ mk Z) ≃ limit (homDiagram Y Z) := by sorry

/-- `Pro C` has cofiltered limits when `C` has finite limits. -/
theorem hasCofilteredLimits [HasFiniteLimits C] : HasCofilteredLimits (Pro C) := by sorry

/-- The pro-category of the terminal category is the terminal category. -/
example : Pro (Discrete PUnit.{u + 1}) ≌ Discrete PUnit.{u + 1} := by sorry

/-- The pro-category of finite sets is the category of profinite sets. -/
example : Pro FintypeCat.{u} ≌ Profinite.{u} := by sorry

end Pro

/-- Spectral spaces with spectral maps, as a category. -/
structure SpectralCat where
  /-- The underlying space. -/
  toTop : TopCat.{u}
  /-- The space is spectral. -/
  spectral : SpectralSpace toTop

attribute [instance] SpectralCat.spectral

namespace SpectralCat

/-- A spectral map between spectral spaces. -/
structure Hom (X Y : SpectralCat.{u}) where
  /-- The continuous map. -/
  map : C(X.toTop, Y.toTop)
  /-- It is spectral. -/
  spectral : IsSpectralMap map

instance : Category.{u} SpectralCat.{u} where
  Hom := Hom
  id X := ⟨ContinuousMap.id X.toTop, by sorry⟩
  comp f g := ⟨g.map.comp f.map, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

end SpectralCat

/-- The finite `T0` spaces, as a full subcategory of `TopCat`. -/
abbrev FiniteTZero := ObjectProperty.FullSubcategory
  (fun X : TopCat.{u} => Finite X ∧ T0Space X)

/-- The inclusion of finite `T0` spaces into `TopCat`. -/
def finiteTZeroToTopCat : FiniteTZero.{u} ⥤ TopCat.{u} := ObjectProperty.ι _

namespace SpectralSpace

/-- Spectral spaces are the pro-category of finite `T0` spaces (ECD Theorem 2.2). -/
def equivProFiniteTZero : SpectralCat.{u} ≌ Pro FiniteTZero.{u} := by sorry

/-- A presentation of a space as a cofiltered limit of finite `T0` spaces. -/
structure FiniteTZeroPresentation (X : TopCat.{u}) where
  /-- The index category. -/
  Index : Type u
  [indexCategory : Category.{u} Index]
  [cofiltered : IsCofiltered Index]
  /-- The diagram of finite `T0` spaces. -/
  diagram : Index ⥤ FiniteTZero.{u}
  /-- The identification of `X` with the limit. -/
  isoLimit : X ≃ₜ (limit (diagram ⋙ finiteTZeroToTopCat) : TopCat.{u})

/-- Every spectral space is the limit of its finite `T0` quotients. -/
def asProLimit (X : TopCat.{u}) [SpectralSpace X] : FiniteTZeroPresentation X := by sorry

/-- The prime spectrum of a ring has such a presentation. -/
example (R : CommRingCat.{u}) : FiniteTZeroPresentation (TopCat.of (PrimeSpectrum R)) := by sorry

end SpectralSpace

/-- A Hochster realization of a spectral space: a ring whose prime spectrum is homeomorphic to it
(ECD Theorem 2.2, the ring direction). -/
def HochsterRealization (X : Type u) [TopologicalSpace X] [SpectralSpace X] :=
  Σ (R : CommRingCat.{u}), (X ≃ₜ PrimeSpectrum R)

/-- Every spectral space is the prime spectrum of a ring. -/
def hochsterRealization (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    HochsterRealization X := by sorry

/-- A profinite presentation of a compact Hausdorff space: a profinite set with a continuous
surjection onto it (ECD Remark 2.8). -/
structure ProfinitePresentation (T : CompHaus.{u}) where
  /-- The covering profinite set. -/
  cover : Profinite.{u}
  /-- The structure map. -/
  map : C(cover, T)
  /-- It is surjective. -/
  surjective : Function.Surjective map

/-- The presentation by the Stone–Čech compactification of the underlying discrete set. -/
def profinitePresentation (T : CompHaus.{u}) : ProfinitePresentation T := by sorry

/-- The structure map of the presentation is surjective. -/
theorem profinitePresentation_surjective (T : CompHaus.{u}) :
    Function.Surjective (profinitePresentation T).map := by sorry

/-- The induced equivalence relation is closed in the product, hence profinite. -/
theorem profinitePresentation_rel (T : CompHaus.{u}) :
    IsClosed {p : (profinitePresentation T).cover × (profinitePresentation T).cover |
      (profinitePresentation T).map p.1 = (profinitePresentation T).map p.2} ∧
    TotallyDisconnectedSpace {p : (profinitePresentation T).cover ×
      (profinitePresentation T).cover |
      (profinitePresentation T).map p.1 = (profinitePresentation T).map p.2} := by sorry

/-- The structure map is a quotient map. -/
theorem profinitePresentation_isQuotientMap (T : CompHaus.{u}) :
    IsQuotientMap (profinitePresentation T).map := by sorry

/-- The cover agrees with Mathlib's projective (Stonean) presentation. -/
def profinitePresentation_of_stonean (T : CompHaus.{u}) :
    (profinitePresentation T).cover ≃ₜ (CompHaus.projectivePresentation T).p := by sorry

/-- A quotient of a profinite set by a closed equivalence relation is compact Hausdorff. -/
theorem Profinite.quotient_compHaus (S : Profinite.{u}) (r : Setoid S)
    (hr : IsClosed {p : S × S | r p.1 p.2}) :
    CompactSpace (Quotient r) ∧ T2Space (Quotient r) := by sorry

/-- A profinite set is its own presentation, with the diagonal as relation. -/
example (T : Profinite.{u}) :
    ∃ P : ProfinitePresentation (profiniteToCompHaus.obj T),
      Nonempty (P.cover ≃ₜ T) ∧
      ∀ x y : P.cover, P.map x = P.map y ↔ x = y := by sorry

/-- The unit interval has a profinite presentation. -/
example : Nonempty (ProfinitePresentation (CompHaus.of (Set.Icc (0 : ℝ) 1))) := by sorry

/-- A quotient of a profinite set by a closed relation need not be profinite. -/
example : ∃ (S : Profinite.{0}) (r : Setoid S),
    IsClosed {p : S × S | r p.1 p.2} ∧
    Nonempty (Quotient r ≃ₜ Set.Icc (0 : ℝ) 1) ∧
    ¬ TotallyDisconnectedSpace (Quotient r) := by sorry

/-- The extremally disconnected presentation agrees with `CompHaus.projectivePresentation`. -/
example (T : CompHaus.{u}) :
    Nonempty ((profinitePresentation T).cover ≃ₜ (CompHaus.projectivePresentation T).p) := by
  sorry

/-! ## Layer 0: quasi-compact objects of a topos, ordinary cohomology -/

namespace Topos

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)

/-- A sheaf is quasi-compact if every effective-epimorphic family onto it has a finite
effective-epimorphic subfamily (SGA 4 VI 1.1). -/
def IsQuasicompact (F : Sheaf J (Type u)) : Prop :=
  ∀ (ι : Type u) (G : ι → Sheaf J (Type u)) (f : ∀ i, G i ⟶ F),
    EffectiveEpiFamily G f → ∃ s : Finset ι,
      EffectiveEpiFamily (fun i : s => G i) (fun i : s => f i)

/-- A sheaf is quasi-separated if fibre products of quasi-compact sheaves over it are
quasi-compact (SGA 4 VI 1.13). -/
def IsQuasiseparated (F : Sheaf J (Type u)) : Prop :=
  ∀ (G H : Sheaf J (Type u)), IsQuasicompact J G → IsQuasicompact J H →
    ∀ (g : G ⟶ F) (h : H ⟶ F), IsQuasicompact J (pullback g h)

namespace Hom

/-- A morphism is quasi-compact if its base change to every quasi-compact sheaf is
quasi-compact. -/
def IsQuasicompact {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Topos.IsQuasicompact J H →
    ∀ g : H ⟶ G, Topos.IsQuasicompact J (pullback f g)

/-- A morphism is quasi-separated if its diagonal is quasi-compact. -/
def IsQuasiseparated {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  IsQuasicompact J (pullback.lift (𝟙 F) (𝟙 F)
    (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl))

/-- Quasi-compact morphisms compose. -/
theorem isQuasicompact_comp {F G H : Sheaf J (Type u)} (f : F ⟶ G) (g : G ⟶ H)
    (hf : IsQuasicompact J f) (hg : IsQuasicompact J g) :
    IsQuasicompact J (f ≫ g) := by sorry

/-- Quasi-separatedness is quasi-compactness of the diagonal, by definition. -/
theorem isQuasiseparated_iff_diagonal {F G : Sheaf J (Type u)} (f : F ⟶ G) :
    IsQuasiseparated J f ↔
      IsQuasicompact J (pullback.lift (𝟙 F) (𝟙 F) (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl)) := by
  sorry

end Hom

/-- The sheaf category is algebraic if every sheaf has an effective-epimorphic family of qcqs
generators whose maps to the terminal object are quasi-separated (SGA 4 VI 2.3). -/
def IsAlgebraic : Prop :=
  ∀ F : Sheaf J (Type u), ∃ (ι : Type u) (G : ι → Sheaf J (Type u))
    (f : ∀ i, G i ⟶ F), EffectiveEpiFamily G f ∧
      ∀ i, IsQuasicompact J (G i) ∧ IsQuasiseparated J (G i) ∧
        Hom.IsQuasiseparated J (terminal.from (G i))

/-- If the terminal object is quasi-compact and `F → *` is a quasi-compact morphism then `F` is
quasi-compact. The hypothesis on the terminal object is needed: the identity of a non-quasi-compact
terminal object is a quasi-compact morphism. -/
theorem isQuasicompact_of_isQuasicompact_terminal (F : Sheaf J (Type u))
    (hterminal : IsQuasicompact J (terminal (Sheaf J (Type u))))
    (h : Hom.IsQuasicompact J (terminal.from F)) : IsQuasicompact J F := by sorry

/-- In an algebraic sheaf category, quasi-separatedness may be tested on one cover by qcqs
objects (SGA 4 VI 2.6, 2.8). -/
theorem isQuasiseparated_iff_of_cover (F : Sheaf J (Type u))
    (hJ : IsAlgebraic J) (ι : Type u) (G : ι → Sheaf J (Type u))
    (f : ∀ i, G i ⟶ F) (hf : EffectiveEpiFamily G f)
    (hG : ∀ i, IsQuasicompact J (G i) ∧ IsQuasiseparated J (G i)) :
    IsQuasiseparated J F ↔ ∀ i j, IsQuasicompact J (pullback (f i) (f j)) := by sorry

/-- A finite coproduct of quasi-compact sheaves is quasi-compact. -/
example {ι : Type u} [Finite ι] (F : ι → Sheaf J (Type u)) [HasCoproduct F]
    (hF : ∀ i, IsQuasicompact J (F i)) : IsQuasicompact J (∐ F) := by sorry

/-- On an algebraic site, the cohomology `H^n (X, -)` of a qcqs object `X` commutes with
filtered colimits of abelian sheaves (ECD Proposition 8.2, SGA 4 VI 5.2). The sheaf cohomology is
Mathlib's Ext-based `Sheaf.cohomologyPresheaf`, evaluated at `X`. -/
theorem preservesFilteredColimits_cohomology [HasSheafify J AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] (hJ : IsAlgebraic J) (X : C)
    (hX : IsQuasicompact J ((presheafToSheaf J (Type u)).obj (yoneda.obj X)) ∧
      IsQuasiseparated J ((presheafToSheaf J (Type u)).obj (yoneda.obj X))) (n : ℕ) :
    PreservesFilteredColimits
      (Sheaf.cohomologyPresheafFunctor J n ⋙ (evaluation Cᵒᵖ AddCommGrpCat.{u}).obj (op X)) := by
  sorry

end Topos

/-- On an irreducible space the constant sheaf is flasque and acyclic in positive degrees
(Stacks 02UW): all restriction maps are surjective and `H^{n+1} (X, A_X) = 0`. -/
theorem ConstantSheafOnIrreducibleSpace (X : Type u) [TopologicalSpace X] [IrreducibleSpace X]
    [HasSheafify (Opens.grothendieckTopology X) AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u})]
    (A : AddCommGrpCat.{u}) :
    (∀ (U V : TopologicalSpace.Opens X) (h : V ≤ U),
      Function.Surjective
        (((constantSheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}).obj A).obj.map
          (homOfLE h).op).hom) ∧
    ∀ n : ℕ, Subsingleton
      (Sheaf.H ((constantSheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}).obj A)
        (n + 1)) := by
  sorry

/-! ## Layer 0: size bounds -/

/-- A cutoff cardinal in the three-clause form of ECD Lemma 4.1: uncountable strong limit of
uncountable cofinality, with strong limits of large cofinality below it. -/
def IsCutoffCardinal (κ : Cardinal.{u}) : Prop :=
  Cardinal.aleph0 < κ ∧ Cardinal.IsStrongLimit κ ∧ Cardinal.aleph0 < κ.ord.cof ∧
  ∀ lam < κ, ∃ μ < κ, Cardinal.IsStrongLimit μ ∧ lam < μ.ord.cof

/-- Cutoff cardinals are cofinal among all cardinals (ECD Lemma 4.1). -/
theorem CutoffCardinal (lam : Cardinal.{u}) : ∃ κ, lam < κ ∧ IsCutoffCardinal κ := by sorry

/-- A Hausdorff first-countable topological group with a dense subset of infinite cardinality
`λ < κ` has completion of cardinality at most `λ^ℵ₀ ≤ 2^λ < κ` (ECD Remark 4.3). -/
theorem CompletionCardinalityBound (G : Type u) [AddGroup G] [UniformSpace G]
    [IsUniformAddGroup G] [T2Space G] [FirstCountableTopology G]
    (A : Set G) (hA : Dense A) (lam κ : Cardinal.{u})
    (hlam : Cardinal.aleph0 ≤ lam) (hAcard : Cardinal.mk A ≤ lam)
    (hlt : lam < κ) (hκ : IsCutoffCardinal κ) :
    Cardinal.mk (UniformSpace.Completion G) ≤ lam ^ Cardinal.aleph0 ∧
    lam ^ Cardinal.aleph0 ≤ 2 ^ lam ∧ 2 ^ lam < κ := by sorry

/-! ## Layer 0: groupoid-valued stacks -/

namespace Stack

open scoped Pseudofunctor.StrongTrans

variable {C : Type u} [Category.{u} C]
    (J : GrothendieckTopology C)
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u})

/-- The stackification of a prestack, on Mathlib's pseudofunctor carrier (ECD Definition 9.1,
Stacks 02ZM). -/
def stackification (J : GrothendieckTopology C)
    (F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

/-- The unit of stackification. -/
def toStackification : F ⟶ stackification J F := by sorry

/-- The stackification is a stack. -/
theorem isStack_stackification : (stackification J F).IsStack J := by sorry

/-- The universal property: composition with the unit is an equivalence of the categories of maps
into any stack. -/
def stackificationUniversal (G : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}) [G.IsStack J] :
    ((stackification J F) ⟶ G) ≌ (F ⟶ G) := by sorry

/-- The unit is objectwise an equivalence when the prestack is already a stack. -/
theorem stackification_of_isStack [F.IsStack J] (X : LocallyDiscrete Cᵒᵖ) :
    ((toStackification J F).app X).toFunctor.IsEquivalence := by sorry

/-- The prestack with discrete fibres attached to a presheaf of sets. -/
def discretePrestack (P : Cᵒᵖ ⥤ Type u) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

/-- On a discrete prestack, stackification is sheafification. -/
def stackification_discrete (P : Cᵒᵖ ⥤ Type u) (X : Cᵒᵖ) :
    (stackification J (discretePrestack P)).obj ⟨X⟩ ≌
      Discrete (((presheafToSheaf J (Type u)).obj P).obj.obj X) := by sorry

/-- A stack is its own stackification. -/
example [F.IsStack J] (X : LocallyDiscrete Cᵒᵖ) :
    ((toStackification J F).app X).toFunctor.IsEquivalence := by sorry

/-- The discrete case recovers sheafification. -/
example (P : Cᵒᵖ ⥤ Type u) (X : Cᵒᵖ) :
    Nonempty ((stackification J (discretePrestack P)).obj ⟨X⟩ ≌
      Discrete (((presheafToSheaf J (Type u)).obj P).obj.obj X)) := by sorry

variable {A B D : Type u} [Category.{u} A] [Category.{u} B] [Category.{u} D]

/-- An object of the 2-fibre product of two functors: a pair of objects and an isomorphism
between their images. The isomorphism is data; equality would give the strict pullback. -/
structure TwoFibreObject (f : A ⥤ D) (g : B ⥤ D) where
  /-- The object of `A`. -/
  left : A
  /-- The object of `B`. -/
  right : B
  /-- The comparison isomorphism. -/
  iso : f.obj left ≅ g.obj right

/-- A morphism of the 2-fibre product respects the comparison isomorphisms. -/
structure TwoFibreHom {f : A ⥤ D} {g : B ⥤ D} (x y : TwoFibreObject f g) where
  /-- The component in `A`. -/
  left : x.left ⟶ y.left
  /-- The component in `B`. -/
  right : x.right ⟶ y.right
  /-- Compatibility with the comparison isomorphisms. -/
  comm : f.map left ≫ y.iso.hom = x.iso.hom ≫ g.map right

instance (f : A ⥤ D) (g : B ⥤ D) : Category (TwoFibreObject f g) where
  Hom := TwoFibreHom
  id := by sorry
  comp := by sorry
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

variable {F G H : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}}

/-- The 2-fibre product of two maps of prestacks. -/
def twoFibreProduct (f : F ⟶ H) (g : G ⟶ H) : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u} := by sorry

/-- Objectwise, the 2-fibre product is the category of triples. -/
def twoFibreProduct_obj (f : F ⟶ H) (g : G ⟶ H) (X : LocallyDiscrete Cᵒᵖ) :
    (twoFibreProduct f g).obj X ≌ TwoFibreObject (f.app X).toFunctor (g.app X).toFunctor := by
  sorry

/-- A 2-fibre product of stacks is a stack. -/
theorem twoFibreProduct_isStack (J : GrothendieckTopology C)
    [F.IsStack J] [G.IsStack J] [H.IsStack J] (f : F ⟶ H) (g : G ⟶ H) :
    (twoFibreProduct f g).IsStack J := by sorry

/-- The 2-fibre product of two points of `BG` over the same object is the discrete category on
`G`; the strict pullback would be a single point. -/
example (G : Type) [Group G] :
    Nonempty (TwoFibreObject
      ((Functor.const (Discrete PUnit)).obj (SingleObj.star G))
      ((Functor.const (Discrete PUnit)).obj (SingleObj.star G)) ≌ Discrete G) := by sorry

/-- The automorphisms of the unique object of `BG` are `G`. -/
example (G : Type u) [Group G] :
    Nonempty ((SingleObj.star G ≅ SingleObj.star G) ≃ G) := by sorry

end Stack

/-! ## Layer 1: disconnected spaces, relative to a supplied geometric category -/

section Relative

variable {C : Type u} [Category.{u} C] (sp : C ⥤ TopCat.{u})

/-- An object is qcqs when its underlying space is quasi-compact and quasi-separated. -/
def qcqs (X : C) : Prop :=
  CompactSpace (sp.obj X) ∧ QuasiSeparatedSpace (sp.obj X)

/-- Every covering family of `X` for the topology `J` admits a section of the map from the
coproduct of its members. -/
def coverSplits [HasCoproducts.{u} C] (J : GrothendieckTopology C) (X : C) : Prop :=
  ∀ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    Sieve.ofArrows U f ∈ J X → ∃ s : X ⟶ ∐ U, s ≫ Sigma.desc f = 𝟙 X

/-- Totally disconnected: qcqs and every open cover splits (ECD Definition 7.1). `Jopen` is the
supplied topology of open covers. -/
def IsTotallyDisconnectedPerfectoid [HasCoproducts.{u} C]
    (Jopen : GrothendieckTopology C) (X : C) : Prop :=
  qcqs sp X ∧ coverSplits Jopen X

/-- Strictly totally disconnected: qcqs and every étale cover splits (ECD Definition 7.15).
`Jet` is the supplied étale topology. -/
def IsStrictlyTotallyDisconnected [HasCoproducts.{u} C]
    (Jet : GrothendieckTopology C) (X : C) : Prop := qcqs sp X ∧ coverSplits Jet X

/-- A w-local spectral space: every connected component has a unique closed point and the set of
closed points is closed (BS15 Definition 2.1.1). -/
def IsWLocalSpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  Nonempty (SpectralSpace X) ∧
    (∀ c : ConnectedComponents X, ∃! x : X, ConnectedComponents.mk x = c ∧ IsClosed ({x} : Set X)) ∧
    IsClosed {x : X | IsClosed ({x} : Set X)}

/-- An object is w-local when its underlying space is (ECD Definition 7.4). -/
def IsWLocalPerfectoid (X : C) : Prop := IsWLocalSpectralSpace (sp.obj X)

/-- W-strictly local: w-local with algebraically closed residue fields, for a supplied residue-field
assignment (ECD Definition 7.17). -/
def IsWStrictlyLocalPerfectoid (residue : ∀ X : C, sp.obj X → Type u)
    [∀ X x, Field (residue X x)] (X : C) : Prop :=
  IsWLocalPerfectoid sp X ∧ ∀ x, IsAlgClosed (residue X x)

variable [HasCoproducts.{u} C]

/-- A totally disconnected object is qcqs. -/
theorem IsTotallyDisconnectedPerfectoid.qcqs (Jo : GrothendieckTopology C) (X : C)
    (h : IsTotallyDisconnectedPerfectoid sp Jo X) : qcqs sp X := by sorry

/-- Open covers of a totally disconnected object split. -/
theorem IsTotallyDisconnectedPerfectoid.splitting (Jo : GrothendieckTopology C) (X : C)
    (h : IsTotallyDisconnectedPerfectoid sp Jo X) : coverSplits Jo X := by sorry

/-- Étale covers of a strictly totally disconnected object split. -/
theorem IsStrictlyTotallyDisconnected.splitting_etale (Jet : GrothendieckTopology C) (X : C)
    (h : IsStrictlyTotallyDisconnected sp Jet X) : coverSplits Jet X := by sorry

end Relative

/-- Every open cover of `X` splits: there is a choice of a member containing each point whose
fibres are open, equivalently a continuous section of the map from the disjoint union. -/
def OpenCoversSplit (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (ι : Type u) (U : ι → Set X), (∀ i, IsOpen (U i)) → (⋃ i, U i) = Set.univ →
    ∃ c : X → ι, (∀ x, x ∈ U (c x)) ∧ ∀ i, IsOpen (c ⁻¹' {i})

/-- Fargues' characterisation of spectral spaces whose open covers split (ECD Lemma 7.2): this
holds exactly when every connected component has a unique closed point; exactly when global sections
of set-valued sheaves sends epimorphisms to surjections; exactly when every abelian sheaf is acyclic
in positive degrees; and exactly when every abelian sheaf has vanishing `H^1`. -/
theorem SplitCoverCharacterisation (X : Type u) [TopologicalSpace X] [SpectralSpace X]
    [HasSheafify (Opens.grothendieckTopology X) AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u})] :
    (OpenCoversSplit X ↔
      ∀ c : ConnectedComponents X, ∃! x : X, ConnectedComponents.mk x = c ∧
        IsClosed ({x} : Set X)) ∧
    (OpenCoversSplit X ↔
      ∀ (F G : Sheaf (Opens.grothendieckTopology X) (Type u)) (f : F ⟶ G), Epi f →
        Function.Surjective (ConcreteCategory.hom (f.hom.app (op ⊤)))) ∧
    (OpenCoversSplit X ↔
      ∀ (F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}) (n : ℕ),
        Subsingleton (Sheaf.H F (n + 1))) ∧
    (OpenCoversSplit X ↔
      ∀ F : Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u},
        Subsingleton (Sheaf.H F 1)) := by
  sorry

/-! ## Layer 2: the pro-étale and v-precoverages -/

section Sites

variable {C : Type u} [Category.{u} C] (sp : C ⥤ TopCat.{u})

/-- The finite quasi-compact image condition on a family: every quasi-compact open of the target is
covered by the images of quasi-compact opens of finitely many members (ECD Definition 8.1). -/
def finiteQCcover {X : C} {ι : Type u} (U : ι → C) (f : ∀ i, U i ⟶ X) : Prop :=
  ∀ V : Set (sp.obj X), IsOpen V → IsCompact V →
    ∃ s : Finset ι, ∃ W : ∀ i, Set (sp.obj (U i)),
      (∀ i ∈ s, IsOpen (W i) ∧ IsCompact (W i)) ∧
      V ⊆ ⋃ i ∈ s, (sp.map (f i)) '' (W i)

namespace Perfd

variable (proet : MorphismProperty C)

/-- The v-precoverage: families satisfying the finite quasi-compact image condition, with no
condition on the maps (ECD Definition 8.1(iii)). -/
def vPrecoverage : Precoverage C where
  coverings X := {R | ∃ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    R = Presieve.ofArrows U f ∧ finiteQCcover sp U f}

/-- The pro-étale precoverage: families of pro-étale maps satisfying the finite quasi-compact image
condition (ECD Definition 8.1(i)); `proet` is the supplied class of pro-étale maps. -/
def proEtalePrecoverage : Precoverage C where
  coverings X := {R | ∃ (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
    R = Presieve.ofArrows U f ∧ finiteQCcover sp U f ∧ ∀ i, proet (f i)}

/-- The v-topology generated by the v-precoverage. -/
def vTopology (sp : C ⥤ TopCat.{u}) : GrothendieckTopology C :=
  (vPrecoverage sp).toGrothendieck

/-- The big pro-étale topology generated by the pro-étale precoverage. -/
def proEtaleTopology (sp : C ⥤ TopCat.{u}) (proet : MorphismProperty C) :
    GrothendieckTopology C := (proEtalePrecoverage sp proet).toGrothendieck

/-- Every pro-étale cover is a v-cover. -/
theorem proEtaleTopology_le_vTopology :
    proEtaleTopology sp proet ≤ vTopology sp := by sorry

/-- The presheaf `X ↦ C(|X|, T)` of continuous maps to a topological space `T`
(ECD Definition 10.12). -/
def underlineSheaf (T : TopCat.{u}) : Cᵒᵖ ⥤ Type u where
  obj X := C(sp.obj (unop X), T)
  map f := TypeCat.ofHom fun g => g.comp (sp.map f.unop).hom
  map_id := by sorry
  map_comp := by sorry

/-- `T ↦ C(|·|, T)` is functorial in `T`. -/
def underlineSheaf.functorial {S T : TopCat.{u}} (f : S ⟶ T) :
    underlineSheaf sp S ⟶ underlineSheaf sp T := by sorry

/-- `C(|·|, T)` is a v-sheaf as soon as v-covers induce quotient maps of underlying spaces and
points of fibre products lift pairs of points. -/
theorem underlineSheaf.isVSheaf [HasPullbacks C] (T : TopCat.{u})
    (hquot : ∀ (X : C) (ι : Type u) (U : ι → C) (f : ∀ i, U i ⟶ X),
      Sieve.ofArrows U f ∈ vTopology sp X →
        IsQuotientMap (fun p : Σ i, sp.obj (U i) => (sp.map (f p.1)) p.2))
    (hpb : ∀ (X U V : C) (f : U ⟶ X) (g : V ⟶ X)
      (x : sp.obj U) (y : sp.obj V), (sp.map f) x = (sp.map g) y →
      ∃ z : sp.obj (pullback f g),
        (sp.map (pullback.fst f g)) z = x ∧ (sp.map (pullback.snd f g)) z = y) :
    Presieve.IsSheaf (vTopology sp) (underlineSheaf sp T) := by sorry

end Perfd

namespace Perfectoid

/-- The small pro-étale site of `X`: objects pro-étale over `X`. -/
def proEtaleSite (proet : MorphismProperty C) (X : C) :=
  ObjectProperty.FullSubcategory (fun U : Over X => proet U.hom)

end Perfectoid

end Sites

/-! ## Layer 3: morphism classes of sheaves, tested on representable base changes -/

section Morphisms

variable {C : Type u} [Category.{u} C] [HasCoproducts.{u} C] (sp : C ⥤ TopCat.{u})

/-- A presheaf is representable if it is isomorphic to a Yoneda presheaf. -/
def representable (F : Cᵒᵖ ⥤ Type u) : Prop := ∃ X : C, Nonempty (F ≅ yoneda.obj X)

/-- A morphism of sheaves has the property `Q` relatively if every base change to a representable is
representable by a morphism in `Q`. -/
def relatively (J : GrothendieckTopology C) (Q : MorphismProperty C)
    {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (X : C) (g : yoneda.obj X ⟶ G.obj),
    ∃ (Y : C) (h : Y ⟶ X), Q h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

namespace Perfd.Stack

variable (J : GrothendieckTopology C) (openImm closedImm etale finiteEtale proet :
    MorphismProperty C)

/-- Open immersions of sheaves: representable open-immersion base changes (ECD Definition 10.7). -/
def IsOpenImmersion {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop := relatively J openImm f

/-- Closed immersions, tested on totally disconnected bases only (ECD Definition 10.7). -/
def IsClosedImmersion (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  ∀ (X : C), IsTotallyDisconnectedPerfectoid sp Jo X →
    ∀ g : yoneda.obj X ⟶ G.obj,
    ∃ (Y : C) (h : Y ⟶ X), closedImm h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

/-- Separated: the diagonal is a closed immersion. -/
def IsSeparated (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  IsClosedImmersion sp J closedImm Jo
    (pullback.lift (𝟙 F) (𝟙 F) (show (𝟙 F) ≫ f = (𝟙 F) ≫ f from rfl))

/-- Locally separated: separated on an open cover of the source (ECD Convention 10.2). -/
def IsLocallySeparated (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  ∃ (ι : Type u) (U : ι → Sheaf J (Type u)) (i : ∀ k, U k ⟶ F),
    EffectiveEpiFamily U i ∧ ∀ k, IsOpenImmersion J openImm (i k) ∧
      IsSeparated sp J closedImm Jo (i k ≫ f)

/-- Quasi-pro-étale: locally separated, with representable pro-étale base changes to strictly
totally disconnected objects (ECD Definition 10.1). -/
def IsQuasiProEtale (Jo Jet : GrothendieckTopology C) {F G : Sheaf J (Type u)}
    (f : F ⟶ G) : Prop :=
  IsLocallySeparated sp J openImm closedImm Jo f ∧
  ∀ (X : C), IsStrictlyTotallyDisconnected sp Jet X →
    ∀ g : yoneda.obj X ⟶ G.obj,
    ∃ (Y : C) (h : Y ⟶ X), proet h ∧
      Nonempty (Over.mk (pullback.snd f.hom g) ≅ Over.mk (yoneda.map h))

/-- Étale: locally separated with representable étale base changes. -/
def IsEtale (Jo : GrothendieckTopology C) {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  IsLocallySeparated sp J openImm closedImm Jo f ∧ relatively J etale f

/-- Finite étale: representable finite étale base changes; separatedness is automatic. -/
def IsFiniteEtale {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop := relatively J finiteEtale f

end Perfd.Stack

end Morphisms

/-! ## Layer 4: diamonds and small v-sheaves -/

section Diamonds

variable {C : Type u} [Category.{u} C] [HasCoproducts.{u} C] (sp : C ⥤ TopCat.{u})

namespace Perf

/-- A pro-étale equivalence relation: two pro-étale maps `s t : R → X` that are jointly monic and
induce an equivalence relation on every `Hom (T, X)` (ECD Definition 11.1). -/
def IsProEtaleEquivRel (proet : MorphismProperty C) (X R : C)
    (s t : R ⟶ X) : Prop :=
  proet s ∧ proet t ∧
  (∀ T : C, Function.Injective (fun r : T ⟶ R => (r ≫ s, r ≫ t))) ∧
  ∀ T : C, Equivalence (fun a b : T ⟶ X => ∃ r : T ⟶ R, r ≫ s = a ∧ r ≫ t = b)

/-- A sheaf is a diamond if it is the sheaf quotient of a representable by a pro-étale equivalence
relation (ECD Definition 11.2). -/
def Diamond (J : GrothendieckTopology C) (proet : MorphismProperty C)
    (F : Sheaf J (Type u)) : Prop :=
  ∃ (X R : C) (s t : R ⟶ X), IsProEtaleEquivRel proet X R s t ∧
    Nonempty (F ≅ (presheafToSheaf J (Type u)).obj
      (coequalizer (yoneda.map s) (yoneda.map t)))

/-- A small v-sheaf: a sheaf with an epimorphism from a representable (ECD Definition 12.1). -/
def IsSmallVSheaf (J : GrothendieckTopology C) (F : Sheaf J (Type u)) : Prop :=
  ∃ (X : C) (hX : Presheaf.IsSheaf J (yoneda.obj X))
    (f : (⟨yoneda.obj X, hX⟩ : Sheaf J (Type u)) ⟶ F), Epi f

namespace Diamond

variable (J : GrothendieckTopology C) (proet : MorphismProperty C)

/-- A representable sheaf, for a subcanonical topology. -/
def ofPerfectoid [J.Subcanonical] (X : C) : Sheaf J (Type u) := ⟨yoneda.obj X, by sorry⟩

/-- The morphism of representable sheaves induced by a morphism of `C`. -/
def ofPerfectoidMap [J.Subcanonical] {X Y : C} (f : X ⟶ Y) :
    ofPerfectoid J X ⟶ ofPerfectoid J Y where
  hom := yoneda.map f

/-- For a presentation, the relation is the fibre product of the atlas with itself
(ECD Proposition 11.3(ii)). -/
theorem relation_eq [J.Subcanonical] (F : Sheaf J (Type u)) (X R : C) (s t : R ⟶ X)
    (hrel : IsProEtaleEquivRel proet X R s t)
    (q : (ofPerfectoid J X) ⟶ F)
    (hs : (ofPerfectoid J R) ⟶ (ofPerfectoid J X))
    (ht : (ofPerfectoid J R) ⟶ (ofPerfectoid J X))
    (hs' : hs.hom = yoneda.map s) (ht' : ht.hom = yoneda.map t)
    (hq : hs ≫ q = ht ≫ q)
    (hpres : IsColimit (Cofork.ofπ q hq)) :
    Nonempty ((ofPerfectoid J R) ≅ pullback q q) := by sorry

/-- A chosen presentation of a diamond: atlas, relation and the quotient isomorphism. -/
structure Presentation (F : Sheaf J (Type u)) where
  /-- The atlas. -/
  X : C
  /-- The relation. -/
  R : C
  /-- Source map. -/
  s : R ⟶ X
  /-- Target map. -/
  t : R ⟶ X
  /-- It is a pro-étale equivalence relation. -/
  relation : IsProEtaleEquivRel proet X R s t
  /-- The quotient identification. -/
  quotientIso : F ≅ (presheafToSheaf J (Type u)).obj (coequalizer (yoneda.map s) (yoneda.map t))

/-- A diamond has a presentation. -/
def presentation (F : Sheaf J (Type u)) (hF : Diamond J proet F) : Presentation J proet F := by
  sorry

/-- The point relation on the atlas generated by the two maps of a presentation. -/
def pointSetoid {F : Sheaf J (Type u)} (P : Presentation J proet F) : Setoid (sp.obj P.X) :=
  Relation.EqvGen.setoid (fun x y => ∃ r : sp.obj P.R, (sp.map P.s) r = x ∧ (sp.map P.t) r = y)

/-- The underlying space of a diamond, from a chosen presentation (ECD Definition 11.14).
Independence of the presentation is a geometric statement about the supplier instance. -/
def space (F : Sheaf J (Type u)) (hF : Diamond J proet F) : TopCat.{u} :=
  TopCat.of (Quotient (pointSetoid sp J proet (presentation J proet F hF)))

end Diamond

end Perf

end Diamonds

/-! ## Layer 5: spatial geometry -/

section Spatial

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)
    (proet : MorphismProperty C) (sp : Sheaf J (Type u) ⥤ TopCat.{u})
    (openImm : MorphismProperty (Sheaf J (Type u)))

namespace Perf

namespace VSheaf

/-- A spatial v-sheaf: qcqs, with a basis of the underlying space by images of quasi-compact open
subsheaves (ECD Definition 12.12). -/
def IsSpatial (F : Sheaf J (Type u)) : Prop :=
  Topos.IsQuasicompact J F ∧ Topos.IsQuasiseparated J F ∧
  TopologicalSpace.IsTopologicalBasis {V : Set (sp.obj F) |
    ∃ (U : Sheaf J (Type u)) (i : U ⟶ F),
      openImm i ∧ Topos.IsQuasicompact J U ∧ V = Set.range (sp.map i)}

end VSheaf

namespace Diamond

/-- A spatial diamond (ECD Definition 11.17). -/
def IsSpatial (F : Sheaf J (Type u)) : Prop := Diamond J proet F ∧ VSheaf.IsSpatial J sp openImm F

/-- A locally spatial diamond: covered by spatial open subdiamonds. -/
def IsLocallySpatial (F : Sheaf J (Type u)) : Prop :=
  ∃ (ι : Type u) (U : ι → Sheaf J (Type u)) (i : ∀ k, U k ⟶ F),
    EffectiveEpiFamily U i ∧ ∀ k, openImm (i k) ∧ IsSpatial J proet sp openImm (U k)

end Diamond

namespace Stack

/-- Representable in diamonds: all base changes to diamonds are diamonds (ECD Definition 13.1). -/
def RepresentableInDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond J proet H → ∀ g : H ⟶ G, Diamond J proet (pullback f g)

/-- Representable in locally spatial diamonds (ECD Definition 13.3). -/
def RepresentableInLocallySpatialDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond.IsLocallySpatial J proet sp openImm H →
    ∀ g : H ⟶ G, Diamond.IsLocallySpatial J proet sp openImm (pullback f g)

/-- Representable in spatial diamonds. -/
def RepresentableInSpatialDiamonds {F G : Sheaf J (Type u)} (f : F ⟶ G) : Prop :=
  ∀ (H : Sheaf J (Type u)), Diamond.IsSpatial J proet sp openImm H →
    ∀ g : H ⟶ G, Diamond.IsSpatial J proet sp openImm (pullback f g)

end Stack

end Perf

end Spatial

section Subdiamonds

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C) [J.Subcanonical]
    (sp : Sheaf J (Type u) ⥤ TopCat.{u})

namespace Perf.Diamond

/-- The presheaf of maps from representables whose underlying image lies in `D`. -/
def imagePresheaf (F : Sheaf J (Type u)) (D : Set (sp.obj F)) : Cᵒᵖ ⥤ Type u where
  obj X := {f : ofPerfectoid J (unop X) ⟶ F | Set.range (sp.map f) ⊆ D}
  map f := TypeCat.ofHom fun x => ⟨ofPerfectoidMap J f.unop ≫ x.1, by sorry⟩
  map_id := by sorry
  map_comp := by sorry

/-- The sub-v-sheaf of maps with image in a generalizing locally closed subset
(HK §2.1). -/
def generalizingSubdiamond (F : Sheaf J (Type u)) (D : Set (sp.obj F)) :
    Sheaf J (Type u) := (presheafToSheaf J (Type u)).obj (imagePresheaf J sp F D)

/-- The set of generalizations of a point. -/
def generalizationSet (F : Sheaf J (Type u)) (y : sp.obj F) : Set (sp.obj F) := {x | x ⤳ y}

/-- The localization of a diamond at a point: the subdiamond of generalizations
(ECD, proof of Lemma 11.31). -/
def localization (F : Sheaf J (Type u)) (y : sp.obj F) : Sheaf J (Type u) :=
  generalizingSubdiamond J sp F (generalizationSet J sp F y)

/-- The whole space gives back the sheaf. -/
def generalizingSubdiamond_whole (F : Sheaf J (Type u)) :
    generalizingSubdiamond J sp F Set.univ ≅ F := by sorry

/-- `D = |F|` returns `F`. -/
example (F : Sheaf J (Type u)) :
    Nonempty (generalizingSubdiamond J sp F Set.univ ≅ F) := by sorry

/-- A closed point with a proper generalization is not a generalizing subset. -/
example (X : Type u) [TopologicalSpace X] [T0Space X] (x y : X)
    (h : x ⤳ y) (hne : x ≠ y) : ¬ StableUnderGeneralization ({y} : Set X) := by sorry

end Perf.Diamond

end Subdiamonds

/-- The Berkovich spectrum of a topological ring, normalized at a chosen element: the continuous
multiplicative seminorms `φ` with `φ ϖ = 1/2`, topologized by pointwise convergence
(ECD Definition 13.7). -/
structure BerkovichSpectrum (R : Type u) [CommRing R] [TopologicalSpace R] (ϖ : R) where
  /-- The seminorm. -/
  seminorm : MulRingSeminorm R
  /-- The nonarchimedean triangle inequality. -/
  nonarchimedean : ∀ x y, seminorm (x + y) ≤ max (seminorm x) (seminorm y)
  /-- It is continuous. -/
  continuous : Continuous seminorm
  /-- The normalization. -/
  norm_eq : seminorm ϖ = 1 / 2

namespace BerkovichSpectrum

variable {R : Type u} [CommRing R] [TopologicalSpace R] (ϖ : R)

instance : TopologicalSpace (BerkovichSpectrum R ϖ) :=
  TopologicalSpace.induced (fun φ => (φ.seminorm : R → ℝ)) inferInstance

/-- For a complete Tate ring, presented by an open subring `A₀` containing the topologically
nilpotent unit `ϖ` with the `ϖ`-adic topology, the Berkovich spectrum is compact Hausdorff
(KL15 §2.3; ECD Proposition 13.9 for the perfectoid case). -/
theorem compactSpace_t2Space {R : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [CompleteSpace R] [IsTopologicalRing R] [T2Space R] (ϖ : R)
    (A₀ : Subring R) (hopen : IsOpen (A₀ : Set R)) (hmem : ϖ ∈ A₀)
    (hadic : IsAdic (Ideal.span {(⟨ϖ, hmem⟩ : A₀)})) (hunit : IsUnit ϖ) :
    CompactSpace (BerkovichSpectrum R ϖ) ∧ T2Space (BerkovichSpectrum R ϖ) := by sorry

/-- Changing the normalizing unit gives a canonical homeomorphism, by rescaling the exponent
(ECD Remark 13.8). -/
def changeNormalization [IsTopologicalRing R] (ϖ' : R)
    (hϖ : IsTopologicallyNilpotent ϖ) (hϖ' : IsTopologicallyNilpotent ϖ')
    (hu : IsUnit ϖ) (hu' : IsUnit ϖ') :
    BerkovichSpectrum R ϖ ≃ₜ BerkovichSpectrum R ϖ' := by sorry

/-- The point of the spectrum of a nonarchimedean field, with its norm rescaled to send the
chosen topologically nilpotent element to `1/2`. -/
def fieldPoint (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1) :
    BerkovichSpectrum K ϖ := by sorry

/-- The normalization exponent is defined: `0 < ‖ϖ‖ < 1` makes its logarithm nonzero. -/
theorem fieldPoint_apply (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1) (x : K) :
    (fieldPoint K ϖ hϖ).seminorm x = ‖x‖ ^ (Real.log (1 / 2) / Real.log ‖ϖ‖) := by sorry

/-- A complete nonarchimedean field has exactly one normalized point; uniqueness is a conclusion. -/
example (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1) :
    Nonempty (BerkovichSpectrum K ϖ) ∧ Subsingleton (BerkovichSpectrum K ϖ) := by sorry

/-- Squaring the normalizing unit requires taking the square root of every seminorm value. -/
example (φ : BerkovichSpectrum R ϖ) : ∃ ψ : BerkovichSpectrum R (ϖ ^ 2),
    ∀ x, ψ.seminorm x = Real.sqrt (φ.seminorm x) := by sorry

/-- Normalization at `1` is impossible, since every multiplicative ring seminorm sends it to `1`. -/
example : IsEmpty (BerkovichSpectrum R (1 : R)) := by sorry

end BerkovichSpectrum

section QuotientComponents

variable {G X : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace X]
    [MulAction G X] [ContinuousSMul G X]

/-- Two connected components are related if some group element carries a point of one to a point
of the other. -/
def componentOrbitRel (c d : ConnectedComponents X) : Prop :=
  ∃ g : G, ∃ x y : X, ConnectedComponents.mk x = c ∧
    ConnectedComponents.mk y = d ∧ g • x = y

/-- The orbit relation on components, as a setoid. -/
def ComponentOrbitSetoid : Setoid (ConnectedComponents X) where
  r := componentOrbitRel (G := G)
  iseqv := by sorry

/-- The orbit relation on points. -/
def PointOrbitSetoid : Setoid X where
  r x y := ∃ g : G, g • x = y
  iseqv := by sorry

/-- The space of orbits of components, with the quotient topology. -/
def componentOrbitSpace (G X : Type u) [Group G] [TopologicalSpace G]
    [TopologicalSpace X] [MulAction G X] [ContinuousSMul G X] :=
  Quotient (ComponentOrbitSetoid (G := G) (X := X))

instance : TopologicalSpace (componentOrbitSpace G X) :=
  inferInstanceAs (TopologicalSpace (Quotient (ComponentOrbitSetoid (G := G) (X := X))))

/-- The orbit space, with the quotient topology. -/
def pointOrbitSpace (G X : Type u) [Group G] [TopologicalSpace G]
    [TopologicalSpace X] [MulAction G X] := Quotient (PointOrbitSetoid (G := G) (X := X))

instance : TopologicalSpace (pointOrbitSpace G X) :=
  inferInstanceAs (TopologicalSpace (Quotient (PointOrbitSetoid (G := G) (X := X))))

/-- When the space of component orbits is totally disconnected, it is in bijection with the
components of the orbit space (GLX Lemma 3.2, with the hypothesis that makes it true). -/
def ComponentsOfRestrictedQuotients
    [TotallyDisconnectedSpace (componentOrbitSpace G X)] :
    componentOrbitSpace G X ≃
      ConnectedComponents (pointOrbitSpace G X) := by sorry

end QuotientComponents

/-! ## Layer 6: marked untilts and pre-adic diamondification -/

section PreAdic

variable {C P A : Type u} [Category.{u} C] [Category.{u} P] [Category.{u} A]
    (tilt : P ⥤ C) (incl : P ⥤ A)

namespace PreAdic

/-- A marked map from `S` to `X`: an object `U` of the supplied perfectoid category `P`, an
identification of its tilt with `S`, and a map from `U` to `X` in the supplied pre-adic category
`A` (Berkeley Lemma 18.1.1). -/
def MarkedMap (S : C) (X : A) :=
  Σ U : P, (tilt.obj U ≅ S) × (incl.obj U ⟶ X)

/-- Two marked maps are isomorphic if an isomorphism of the untilts identifies the markings and
the maps. -/
def markedMapRel (S : C) (X : A) (a b : MarkedMap tilt incl S X) : Prop :=
  ∃ e : a.1 ≅ b.1, tilt.mapIso e ≪≫ b.2.1 = a.2.1 ∧
    incl.map e.hom ≫ b.2.2 = a.2.2

/-- Isomorphism of marked maps, as a setoid. -/
def markedMapSetoid (S : C) (X : A) : Setoid (MarkedMap tilt incl S X) where
  r := markedMapRel tilt incl S X
  iseqv := by sorry

variable [tilt.IsFibered]

/-- The pre-adic diamondification: isomorphism classes of marked maps, with pullback of marked
untilts along the fibered tilting functor. -/
def diamond (X : A) : Cᵒᵖ ⥤ Type u where
  obj S := Quotient (markedMapSetoid tilt incl (unop S) X)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- Functoriality in the pre-adic space. -/
def diamond_map {X Y : A} (f : X ⟶ Y) :
    diamond tilt incl X ⟶ diamond tilt incl Y := by sorry

/-- Identities go to identities. -/
theorem diamond_map_id (X : A) : diamond_map tilt incl (𝟙 X) = 𝟙 _ := by sorry

/-- Composition is respected. -/
theorem diamond_map_comp {X Y Z : A} (f : X ⟶ Y) (g : Y ⟶ Z) :
    diamond_map tilt incl (f ≫ g) = diamond_map tilt incl f ≫ diamond_map tilt incl g := by
  sorry

end PreAdic

end PreAdic

/-!
## Statements not typed here

Their hypotheses and conclusions are fixed in `README.md`. The ordinary foundation comparisons
listed first are not represented by signatures here. The geometric statements require the
perfectoid category with its affinoid rings, residue fields, rational localizations, tilting and
pro-étale limits, or the pre-adic and rigid-analytic interfaces:

* D0.14 ordinal assembly, D0.19 Čech-to-derived and Leray comparisons, D0.21 limits of coherent
  topoi, D0.22 sheaves on profinite sets;
* D1.3, D1.5, D1.6, D1.8–D1.11 (components, valuative subspaces, flatness, w-localization, the
  universally open cover, pro-étale maps over a strictly totally disconnected base);
* D2.3–D2.9 (cutoff independence, algebraicity, structure sheaves, subcanonicity, v-descent and
  acyclicity, vector bundles);
* D3.1–D3.5, D3.7, D3.9 (effective descent and v-local nature) and the torsor theory of D3.10;
* D4.2–D4.4, D4.6, D4.8–D4.10 (quotient presentations, atlases, v-sheaf property, compact
  Hausdorff diamonds, small v-stacks and their quotients);
* D5.2–D5.7, D5.10–D5.12, D5.14, D5.15 (permanence, limits, universally open presentations,
  local structure, relative representability, the Berkovich functor on v-sheaves and Hausdorff
  reduction, including `Perf.minimalPlusExtension` and `Perf.berkovich_stalkComparison`), and
  the map from `Spa (R, R⁺)` in D5.13;
* D6.1–D6.9 beyond the generic marked-map presheaf (Spd, untilt descent, gluing, étale-site
  comparison, integral Galois quotient, topological comparison, seminormal full faithfulness).
-/

end TauCetiRoadmap.DiamondsAndVStacks
