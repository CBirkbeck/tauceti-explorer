/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DiamondSixOperations.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; every proof is `sorry`.

BP-DiamondSixOperations (ECD §§22–25). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Neither pinned library has perfectoid spaces, small v-stacks, diamonds or their étale
categories. Those carriers belong to DiamondsAndVStacks (D1–D6) and
DiamondEtaleCohomology (C0–C9), whose blueprints are not implemented. This prototype
is therefore written against one explicit supplier interface, `SupplierContext`: its
fields are the supplier categories, functors and morphism classes, each documented with
the stage that owns it, and nothing in it asserts a theorem. When the suppliers exist,
each field is replaced by the owner's declaration. The definitions of this roadmap
(compactifiable, locally split, eligible, Rf_! = Rf‾_* ∘ j_!, proper support, invertible
objects, ℓ-cohomological smoothness, the dualizing complex, the Verdier dual, the
normalised Haar measure) are genuine definitions over that interface; constructions whose
data need ∞-categorical left Kan extensions or the adjoint functor theorem
(EnhancedDerivedSheaves E3) are `sorry`-bodied data, never `Prop` placeholders.

The homotopy-category functors `D Y` stand for ECD's D_ét(Y, Λ); the enhanced
statements of the roadmap are recorded at that level. Coefficients Λ are fixed in the
context; change of rings uses a second context with the same geometry.
-/
import Mathlib.CategoryTheory.MorphismProperty.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.CategoryTheory.Limits.Preserves.Basic
import Mathlib.CategoryTheory.Shift.Basic
import Mathlib.CategoryTheory.Preadditive.Basic
import Mathlib.Topology.JacobsonSpace
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.GroupTheory.Index
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.Topology.Category.CompHaus.Basic
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.CategoryTheory.Preadditive.Biproducts
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

noncomputable section

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory Limits

namespace TauCeti.DiamondSixOperations

universe w v u

/-- The supplier interface. Every field is owned by another roadmap:
geometry by DiamondsAndVStacks D1–D6 and DiamondEtaleCohomology C4/C8, coefficient
categories and operations by DiamondEtaleCohomology C2–C5. -/
structure SupplierContext where
  /-- Small v-stacks on Perf (DiamondsAndVStacks D4). -/
  V : Type u
  [cat : Category.{v} V]
  [pb : HasPullbacks V]
  /-- The final v-sheaf `* = Spd F_p`. -/
  pt : V
  toPt : ∀ X : V, X ⟶ pt
  /-- Open immersions (D3). -/
  openImmersion : MorphismProperty V
  /-- Partially proper maps (C4, ECD 18.4). -/
  partiallyProper : MorphismProperty V
  /-- Proper maps (C4, ECD 18.1). -/
  proper : MorphismProperty V
  /-- Separated maps (D3). -/
  separated : MorphismProperty V
  /-- Étale maps (D3). -/
  etale : MorphismProperty V
  /-- Quasicompact maps (D0/D3). -/
  quasicompact : MorphismProperty V
  /-- Surjections of v-stacks (D4). -/
  surjective : MorphismProperty V
  /-- Universally open maps (D4: openness of |X ×_Y Y′| → |X| for all X → Y). -/
  universallyOpen : MorphismProperty V
  /-- Maps representable in diamonds, in locally spatial and in spatial diamonds (D5). -/
  reprDiamonds : MorphismProperty V
  reprLocSpatial : MorphismProperty V
  reprSpatial : MorphismProperty V
  /-- Local finiteness and a global bound for dim.trg (C8). -/
  locFinDimTrg : MorphismProperty V
  finDimTrg : MorphismProperty V
  /-- Finite étale maps (D3) and quasi-pro-étale maps (D3). -/
  finiteEtale : MorphismProperty V
  quasiProEtale : MorphismProperty V
  /-- Strictly totally disconnected perfectoid spaces (D1), as a class of objects. -/
  strictlyTotallyDisconnected : V → Prop
  /-- Locally spatial diamonds and spatial diamonds (D5), as classes of objects. -/
  locallySpatial : V → Prop
  /-- The canonical compactification of a map and its canonical factorisation (C4, ECD 18.6). -/
  cpt : ∀ {X Y : V}, (X ⟶ Y) → V
  toCpt : ∀ {X Y : V} (f : X ⟶ Y), X ⟶ cpt f
  cptMap : ∀ {X Y : V} (f : X ⟶ Y), cpt f ⟶ Y
  cpt_fac : ∀ {X Y : V} (f : X ⟶ Y), toCpt f ≫ cptMap f = f
  /-- The étale categories D_ét(Y, Λ) at the homotopy level (C2). -/
  D : V → Type w
  [dcat : ∀ X, Category.{w} (D X)]
  [dadd : ∀ X, Preadditive (D X)]
  [dshift : ∀ X, HasShift (D X) ℤ]
  /-- The standard t-structure of D_ét (C2): `isLE X n A` iff A ∈ D^{≤n}, `isGE X n A` iff A ∈ D^{≥n}. -/
  isLE : ∀ X, ℤ → D X → Prop
  isGE : ∀ X, ℤ → D X → Prop
  /-- Bounded constructible and perfect-constructible objects (C7). -/
  constructible : ∀ X, D X → Prop
  perfectConstructible : ∀ X, D X → Prop
  /-- Pullback and pushforward with their adjunction (C3, ECD Lemma 17.5). -/
  pull : ∀ {X Y : V}, (X ⟶ Y) → (D Y ⥤ D X)
  push : ∀ {X Y : V}, (X ⟶ Y) → (D X ⥤ D Y)
  pullPushAdj : ∀ {X Y : V} (f : X ⟶ Y), pull f ⊣ push f
  /-- Derived tensor product, unit Λ_X and internal Hom (C3). -/
  tensor : ∀ X, D X ⥤ D X ⥤ D X
  unitObj : ∀ X, D X
  ihom : ∀ X, (D X)ᵒᵖ ⥤ D X ⥤ D X
  /-- Extension by zero along open immersions (C5, ECD 19.1). -/
  openShriek : ∀ {X Y : V} (j : X ⟶ Y), openImmersion j → (D X ⥤ D Y)
  openShriekAdj : ∀ {X Y : V} (j : X ⟶ Y) (h : openImmersion j), openShriek j h ⊣ pull j
  /-- The left adjoint of pullback along a separated étale map (C5, ECD 19.1). -/
  etaleShriek : ∀ {X Y : V} (f : X ⟶ Y), etale f → separated f → (D X ⥤ D Y)
  etaleShriekAdj : ∀ {X Y : V} (f : X ⟶ Y) (he : etale f) (hs : separated f),
    etaleShriek f he hs ⊣ pull f

attribute [instance] SupplierContext.cat SupplierContext.pb SupplierContext.dcat
  SupplierContext.dadd SupplierContext.dshift

variable (𝒞 : SupplierContext.{w, v, u})

namespace SupplierContext
variable {𝒞}
/-- Tensoring with a fixed object on the left. -/
abbrev tensorObj {X : 𝒞.V} (A : 𝒞.D X) : 𝒞.D X ⥤ 𝒞.D X := (𝒞.tensor X).obj A
end SupplierContext
open SupplierContext

/-! ## S0. Compactifiable morphisms -/
section S0
variable {𝒞}

/-- `S0/compactifiable-morphism` (ECD 22.2): an open immersion followed by a partially
proper map. Only existence is stored; the canonical factorisation is a theorem. -/
def IsCompactifiable {X Y : 𝒞.V} (f : X ⟶ Y) : Prop :=
  ∃ (Z : 𝒞.V) (j : X ⟶ Z) (g : Z ⟶ Y), 𝒞.openImmersion j ∧ 𝒞.partiallyProper g ∧ j ≫ g = f

lemma IsCompactifiable.mk {X Y Z : 𝒞.V} (j : X ⟶ Z) (g : Z ⟶ Y) (hj : 𝒞.openImmersion j)
    (hg : 𝒞.partiallyProper g) : IsCompactifiable (j ≫ g) := ⟨Z, j, g, hj, hg, rfl⟩

lemma IsCompactifiable.of_isOpenImmersion {X Y : 𝒞.V} (j : X ⟶ Y) (hj : 𝒞.openImmersion j) :
    IsCompactifiable j := by sorry

lemma IsCompactifiable.of_isPartiallyProper {X Y : 𝒞.V} (g : X ⟶ Y)
    (hg : 𝒞.partiallyProper g) : IsCompactifiable g := by sorry

lemma IsCompactifiable.isSeparated {X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsCompactifiable f) :
    𝒞.separated f := by sorry

/-- `S0/compactifiable-iff-separated-open` (ECD 22.3(i)); also the API item `isCompactifiable_iff`. -/
theorem isCompactifiable_iff_isSeparated_and_isOpenImmersion {X Y : 𝒞.V} (f : X ⟶ Y) :
    IsCompactifiable f ↔ 𝒞.separated f ∧ 𝒞.openImmersion (𝒞.toCpt f) := by sorry

theorem isCompactifiable_iff {X Y : 𝒞.V} (f : X ⟶ Y) :
    IsCompactifiable f ↔ 𝒞.separated f ∧ 𝒞.openImmersion (𝒞.toCpt f) :=
  isCompactifiable_iff_isSeparated_and_isOpenImmersion f

lemma IsCompactifiable.isOpenImmersion_toCpt {X Y : 𝒞.V} {f : X ⟶ Y}
    (hf : IsCompactifiable f) : 𝒞.openImmersion (𝒞.toCpt f) :=
  ((isCompactifiable_iff f).mp hf).2

/-- `S0/compactifiable-base-change` (ECD 22.3(ii)). -/
theorem IsCompactifiable.baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y} (hf : IsCompactifiable f)
    (g : Y' ⟶ Y) : IsCompactifiable (pullback.snd f g) := by sorry

/-- `S0/compactifiable-v-local` (ECD 22.3(iii)). -/
theorem IsCompactifiable.of_baseChange_of_surjective {X Y Y' : 𝒞.V} (f : X ⟶ Y) (g : Y' ⟶ Y)
    (hg : 𝒞.surjective g) (h : IsCompactifiable (pullback.snd f g)) : IsCompactifiable f := by
  sorry

/-- `S0/compactifiable-composition` (ECD 22.3(iv)). -/
theorem IsCompactifiable.comp {X Y Z : 𝒞.V} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsCompactifiable f) (hg : IsCompactifiable g) : IsCompactifiable (f ≫ g) := by sorry

/-- `S0/compactifiable-local-on-source` (ECD 22.3(v)): an open cover `U i ⟶ X` of the
source on which `f` is compactifiable. -/
theorem IsCompactifiable.of_openCover {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f)
    (hr : 𝒞.reprLocSpatial f) {ι : Type} (U : ι → 𝒞.V) (u : ∀ i, U i ⟶ X)
    (hu : ∀ i, 𝒞.openImmersion (u i))
    (hcov : ∀ (T : 𝒞.V) (t : T ⟶ X), 𝒞.strictlyTotallyDisconnected T → ∃ i, ∃ s : T ⟶ U i, s ≫ u i = t)
    (hU : ∀ i, IsCompactifiable (u i ≫ f)) : IsCompactifiable f := by sorry

/-- `S0/separated-etale-compactifiable` (ECD 22.3(vi)); API `IsCompactifiable.of_separated_etale`. -/
theorem IsCompactifiable.of_isSeparated_of_isEtale {X Y : 𝒞.V} (f : X ⟶ Y)
    (hs : 𝒞.separated f) (he : 𝒞.etale f) : IsCompactifiable f := by sorry

theorem IsCompactifiable.of_separated_etale {X Y : 𝒞.V} (f : X ⟶ Y)
    (hs : 𝒞.separated f) (he : 𝒞.etale f) : IsCompactifiable f :=
  IsCompactifiable.of_isSeparated_of_isEtale f hs he

-- unit test `IsCompactifiable.id`
example (X : 𝒞.V) : IsCompactifiable (𝟙 X) := by sorry

-- unit test `IsCompactifiable.generic_point_inclusion`: for the open immersion
-- `j : Spa(C, O_C) → Spa(C, C⁺)` (C⁺ ⊊ O_C), the canonical compactification is the identity.
-- The interface has no named object Spa(C, C⁺); the statement records the shape: an open
-- immersion is compactifiable, and here its compactification map is an isomorphism.
example {U X : 𝒞.V} (j : U ⟶ X) (hj : 𝒞.openImmersion j)
    (hpp : 𝒞.partiallyProper (𝟙 X)) (hcl : ∀ (T : 𝒞.V) (t : T ⟶ X), ∃ s : T ⟶ 𝒞.cpt j, s ≫ 𝒞.cptMap j = t) :
    IsCompactifiable j ∧ IsIso (𝒞.cptMap j) := by sorry

-- unit test `not_isCompactifiable_doubled_origin`: an étale surjection which is not separated
-- is not compactifiable.
example {X Y : 𝒞.V} (f : X ⟶ Y) (hns : ¬ 𝒞.separated f) : ¬ IsCompactifiable f := by sorry

-- unit test `IsCompactifiable.proper`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : 𝒞.proper f) : IsCompactifiable f ∧ Nonempty (𝒞.cpt f ≅ X) := by
  sorry

/-- `S0/locally-split-map`: separated, surjective, and after pullback to every strictly
totally disconnected `T` there are sections over a surjective étale map `U ⟶ T`
(the disjoint union of an open cover of `T`). -/
def IsLocallySplit {Z Y' : 𝒞.V} (g : Z ⟶ Y') : Prop :=
  𝒞.separated g ∧ 𝒞.surjective g ∧
    ∀ (T : 𝒞.V) (t : T ⟶ Y'), 𝒞.strictlyTotallyDisconnected T →
      ∃ (U : 𝒞.V) (u : U ⟶ T) (s : U ⟶ Z), 𝒞.etale u ∧ 𝒞.surjective u ∧ s ≫ g = u ≫ t

lemma IsLocallySplit.isSeparated {Z Y' : 𝒞.V} {g : Z ⟶ Y'} (h : IsLocallySplit g) :
    𝒞.separated g := h.1

lemma IsLocallySplit.surjective {Z Y' : 𝒞.V} {g : Z ⟶ Y'} (h : IsLocallySplit g) :
    𝒞.surjective g := h.2.1

lemma IsLocallySplit.of_section {Z Y' : 𝒞.V} (g : Z ⟶ Y') (s : Y' ⟶ Z) (hs : s ≫ g = 𝟙 Y')
    (hsep : 𝒞.separated g) : IsLocallySplit g := by sorry

lemma IsLocallySplit.of_clopen_sections {Z Y' : 𝒞.V} (g : Z ⟶ Y') (hsep : 𝒞.separated g)
    (hsurj : 𝒞.surjective g)
    (h : ∀ (T : 𝒞.V) (t : T ⟶ Y'), 𝒞.strictlyTotallyDisconnected T →
      ∃ (n : ℕ) (U : Fin n → 𝒞.V) (u : ∀ i, U i ⟶ T) (s : ∀ i, U i ⟶ Z),
        (∀ i, 𝒞.openImmersion (u i)) ∧
        (∀ (T' : 𝒞.V) (t' : T' ⟶ T), ∃ i, ∃ r : T' ⟶ U i, r ≫ u i = t') ∧ ∀ i, s i ≫ g = u i ≫ t) :
    IsLocallySplit g := by sorry

lemma IsLocallySplit.baseChange {Z Y' Y'' : 𝒞.V} {g : Z ⟶ Y'} (h : IsLocallySplit g)
    (k : Y'' ⟶ Y') : IsLocallySplit (pullback.snd g k) := by sorry

lemma IsLocallySplit.comp {Z₁ Z₂ Y' : 𝒞.V} {g₁ : Z₁ ⟶ Z₂} {g₂ : Z₂ ⟶ Y'}
    (h₁ : IsLocallySplit g₁) (h₂ : IsLocallySplit g₂) : IsLocallySplit (g₁ ≫ g₂) := by sorry

lemma IsLocallySplit.of_separated_etale_surjective {Z Y' : 𝒞.V} (g : Z ⟶ Y')
    (hs : 𝒞.separated g) (he : 𝒞.etale g) (hsurj : 𝒞.surjective g) : IsLocallySplit g := by sorry

-- unit test `IsLocallySplit.id`
example (Y : 𝒞.V) (h : 𝒞.separated (𝟙 Y)) : IsLocallySplit (𝟙 Y) := by sorry

-- unit test `IsLocallySplit.openCover`: a surjective open immersion family glued to one map.
example {U Y : 𝒞.V} (u : U ⟶ Y) (he : 𝒞.etale u) (hs : 𝒞.separated u) (hsurj : 𝒞.surjective u) :
    IsLocallySplit u := by sorry

-- unit test `not_isLocallySplit_field_extension`: a separated v-cover without sections over a
-- strictly totally disconnected point is not locally split.
example {Z T : 𝒞.V} (g : Z ⟶ T) (hT : 𝒞.strictlyTotallyDisconnected T)
    (hno : ∀ (U : 𝒞.V) (u : U ⟶ T) (s : U ⟶ Z), 𝒞.etale u → 𝒞.surjective u → s ≫ g = u → False) :
    ¬ IsLocallySplit g := by
  rintro ⟨-, -, h⟩
  obtain ⟨U, u, s, he, hs, hsg⟩ := h T (𝟙 T) hT
  exact hno U u s he hs (by simpa using hsg)

-- unit test `IsLocallySplit.trivial_torsor`
example {K T : 𝒞.V} (pr : K ⟶ T) (s : T ⟶ K) (hs : s ≫ pr = 𝟙 T) (hsep : 𝒞.separated pr) :
    IsLocallySplit pr := by sorry

/-- `S0/compactifiable-source-descent` (ECD 22.3(vii), with the local-splitting hypothesis). -/
theorem IsCompactifiable.of_comp_of_isLocallySplit {Z X Y : 𝒞.V} (f : X ⟶ Y) (g : Z ⟶ X)
    (hs : 𝒞.separated f) (hr : 𝒞.reprLocSpatial f) (hg : IsLocallySplit g)
    (hfg : IsCompactifiable (g ≫ f)) : IsCompactifiable f := by sorry

/-- `S0/compactifiable-cancellation` (ECD 22.3(viii)). -/
theorem IsCompactifiable.of_comp {X Y Z : 𝒞.V} (f : X ⟶ Y) (g : Y ⟶ Z) (hg : 𝒞.separated g)
    (h : IsCompactifiable (f ≫ g)) : IsCompactifiable f := by sorry

/-- `S0/eligible-morphism`: compactifiable, representable in locally spatial diamonds,
locally finite dim.trg (ECD Convention 22.1, Definition 22.18). Its fields are the
projections `IsEligible.isCompactifiable`, `IsEligible.representable` and
`IsEligible.locallyFiniteDimTrg`. -/
structure IsEligible {X Y : 𝒞.V} (f : X ⟶ Y) : Prop where
  isCompactifiable : IsCompactifiable f
  representable : 𝒞.reprLocSpatial f
  locallyFiniteDimTrg : 𝒞.locFinDimTrg f

lemma IsEligible.mk' {X Y : 𝒞.V} {f : X ⟶ Y} (h₁ : IsCompactifiable f) (h₂ : 𝒞.reprLocSpatial f)
    (h₃ : 𝒞.locFinDimTrg f) : IsEligible f := ⟨h₁, h₂, h₃⟩

theorem IsEligible.baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y} (hf : IsEligible f) (g : Y' ⟶ Y) :
    IsEligible (pullback.snd f g) := by sorry

/-- Base change of an eligible map, as the first projection of the pullback square. -/
theorem IsEligible.baseChange_fst {X Y Y' : 𝒞.V} {g : X ⟶ Y} (hg : IsEligible g) (f : Y' ⟶ Y) :
    IsEligible (pullback.fst f g) := by sorry

theorem IsEligible.comp {X Y Z : 𝒞.V} {f : X ⟶ Y} {g : Y ⟶ Z} (hf : IsEligible f)
    (hg : IsEligible g) : IsEligible (f ≫ g) := by sorry

theorem IsEligible.of_separated_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f)
    (he : 𝒞.etale f) : IsEligible f := by sorry

theorem IsEligible.restrict_open {U X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsEligible f) (j : U ⟶ X)
    (hj : 𝒞.openImmersion j) : IsEligible (j ≫ f) := by sorry

/-- `S0/spatial-eligible-morphism`: compactifiable, representable in spatial diamonds,
globally finite dim.trg (ECD Definition 22.4). Its fields include the projection
`IsSpatialEligible.dimTrg_lt_top`. -/
structure IsSpatialEligible {X Y : 𝒞.V} (f : X ⟶ Y) : Prop where
  isCompactifiable : IsCompactifiable f
  representable : 𝒞.reprSpatial f
  dimTrg_lt_top : 𝒞.finDimTrg f

lemma IsSpatialEligible.mk' {X Y : 𝒞.V} {f : X ⟶ Y} (h₁ : IsCompactifiable f)
    (h₂ : 𝒞.reprSpatial f) (h₃ : 𝒞.finDimTrg f) : IsSpatialEligible f := ⟨h₁, h₂, h₃⟩

theorem IsSpatialEligible.isEligible {X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsSpatialEligible f) :
    IsEligible f := by sorry

theorem IsEligible.of_isSpatialEligible {X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsSpatialEligible f) :
    IsEligible f := hf.isEligible

theorem IsSpatialEligible.qcqs {X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsSpatialEligible f) :
    𝒞.quasicompact f := by sorry

theorem isSpatialEligible_iff {X Y : 𝒞.V} (f : X ⟶ Y) :
    IsSpatialEligible f ↔ IsEligible f ∧ 𝒞.quasicompact f ∧ 𝒞.reprSpatial f ∧ 𝒞.finDimTrg f := by
  sorry

theorem IsSpatialEligible.baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y} (hf : IsSpatialEligible f)
    (g : Y' ⟶ Y) : IsSpatialEligible (pullback.snd f g) := by sorry

theorem IsSpatialEligible.comp {X Y Z : 𝒞.V} {f : X ⟶ Y} {g : Y ⟶ Z}
    (hf : IsSpatialEligible f) (hg : IsSpatialEligible g) : IsSpatialEligible (f ≫ g) := by sorry

theorem IsSpatialEligible.restrict_qc_open {U X Y : 𝒞.V} {f : X ⟶ Y} (hf : IsEligible f)
    (j : U ⟶ X) (hj : 𝒞.openImmersion j) (hqc : 𝒞.quasicompact (j ≫ f)) (hfin : 𝒞.finDimTrg (j ≫ f))
    (hspat : 𝒞.reprSpatial (j ≫ f)) : IsSpatialEligible (j ≫ f) := by sorry

/-- `S0/eligible-cancellation`. -/
theorem IsEligible.of_comp {X Y Z : 𝒞.V} (f : X ⟶ Y) (g : Y ⟶ Z) (hg : 𝒞.separated g)
    (hfg : IsEligible (f ≫ g)) (hr : 𝒞.reprLocSpatial f) (hd : 𝒞.locFinDimTrg f) :
    IsEligible f := by sorry

-- unit test `IsEligible.id`
example (X : 𝒞.V) (hr : 𝒞.reprLocSpatial (𝟙 X)) (hd : 𝒞.locFinDimTrg (𝟙 X)) :
    IsEligible (𝟙 X) := by sorry

-- unit test `not_isEligible_infinite_dimTrg`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hd : ¬ 𝒞.locFinDimTrg f) : ¬ IsEligible f :=
  fun h => hd h.locallyFiniteDimTrg

-- unit test `IsSpatialEligible.id`
example (X : 𝒞.V) (hr : 𝒞.reprSpatial (𝟙 X)) (hd : 𝒞.finDimTrg (𝟙 X)) :
    IsSpatialEligible (𝟙 X) := by sorry

-- unit test `not_isSpatialEligible_openDisc`: an eligible map which is not quasicompact.
example {X Y : 𝒞.V} (f : X ⟶ Y) (hqc : ¬ 𝒞.quasicompact f) : ¬ IsSpatialEligible f :=
  fun h => hqc h.qcqs

-- unit test `IsSpatialEligible.qc_open_immersion`
example {U X : 𝒞.V} (j : U ⟶ X) (hj : 𝒞.openImmersion j) (hqc : 𝒞.quasicompact j)
    (hr : 𝒞.reprSpatial j) (hd : 𝒞.finDimTrg j) : IsSpatialEligible j := by sorry

end S0

/-! ## S1. Quasicompact proper-support pushforward and the dimension estimate -/
section S1
variable {𝒞}

/-- `S1/lower-shriek-quasicompact` (ECD 22.4): `Rf_! = Rf‾_* ∘ j_!` through the canonical
compactification, for a spatial-eligible `f`. -/
def lowerShriekQC {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) : 𝒞.D X ⥤ 𝒞.D Y :=
  𝒞.openShriek (𝒞.toCpt f) hf.isCompactifiable.isOpenImmersion_toCpt ⋙ 𝒞.push (𝒞.cptMap f)

lemma lowerShriekQC_eq {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) :
    lowerShriekQC f hf =
      𝒞.openShriek (𝒞.toCpt f) hf.isCompactifiable.isOpenImmersion_toCpt ⋙ 𝒞.push (𝒞.cptMap f) :=
  rfl

theorem lowerShriekQC_of_isProper {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (hp : 𝒞.proper f) : Nonempty (lowerShriekQC f hf ≅ 𝒞.push f) := by sorry

/-- `S1/lower-shriek-etale-agreement-qc` (ECD 22.10); API `lowerShriekQC_etale`. -/
theorem lowerShriekQC_eq_etaleLowerShriek {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (he : 𝒞.etale f) (hs : 𝒞.separated f) : Nonempty (𝒞.etaleShriek f he hs ≅ lowerShriekQC f hf) := by
  sorry

theorem lowerShriekQC_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (he : 𝒞.etale f) (hs : 𝒞.separated f) : Nonempty (𝒞.etaleShriek f he hs ≅ lowerShriekQC f hf) :=
  lowerShriekQC_eq_etaleLowerShriek f hf he hs

/-- `S1/factorisation-independence`. -/
theorem lowerShriekQC_factorisation {X Y Z : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (j : X ⟶ Z) (g : Z ⟶ Y) (hj : 𝒞.openImmersion j) (hg : 𝒞.proper g) (hfac : j ≫ g = f) :
    Nonempty (𝒞.openShriek j hj ⋙ 𝒞.push g ≅ lowerShriekQC f hf) := by sorry

theorem lowerShriekQC_amplitude {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (A : 𝒞.D X) (hA : 𝒞.isGE X 0 A) : 𝒞.isGE Y 0 ((lowerShriekQC f hf).obj A) := by sorry

/-- `S1/compactification-cd-bound` (ECD 22.5): `R^i f‾_* A = 0` for `i > 3 d` on objects in
degree 0, with `d` a bound for dim.trg f (`hd` relates `d` to the supplier's bound). -/
theorem lowerShriekQC_cd_le_three_mul {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (d : ℕ) (hd : ∀ (T : 𝒞.V) (t : T ⟶ Y), 𝒞.finDimTrg (pullback.snd f t))
    (A : 𝒞.D (𝒞.cpt f)) (hA₀ : 𝒞.isGE _ 0 A) (hA₁ : 𝒞.isLE _ 0 A) :
    𝒞.isLE Y (3 * d) ((𝒞.push (𝒞.cptMap f)).obj A) := by sorry

/-- `S1/spatial-compactification-cd-bound`: the `2 d` bound under the extra hypothesis that
the compactification is representable in spatial diamonds. -/
theorem lowerShriekQC_cd_le_two_mul_of_spatial {X Y : 𝒞.V} (f : X ⟶ Y)
    (hf : IsSpatialEligible f) (hsp : 𝒞.reprSpatial (𝒞.cptMap f)) (d : ℕ)
    (A : 𝒞.D (𝒞.cpt f)) (hA₀ : 𝒞.isGE _ 0 A) (hA₁ : 𝒞.isLE _ 0 A) :
    𝒞.isLE Y (2 * d) ((𝒞.push (𝒞.cptMap f)).obj A) := by sorry

/-- `S1/proper-dim-zero-classification` (ECD 22.6), recorded as essential surjectivity of
`T ↦ X ×_{π₀X} T` onto proper dim.trg 0 diamonds over a strictly totally disconnected `X`;
`prodPi0` is the supplier's functor from compact Hausdorff spaces over π₀X (D4, ECD 11.12). -/
theorem properDimTrgZero_equiv_compHaus (X : 𝒞.V) (hX : 𝒞.strictlyTotallyDisconnected X)
    {Y : 𝒞.V} (f : Y ⟶ X) (hp : 𝒞.proper f) (h0 : 𝒞.finDimTrg f)
    (prodPi0 : CompHaus → 𝒞.V) : ∃ T : CompHaus, Nonempty (prodPi0 T ≅ Y) := by sorry

/-- `S1/qcqs-diamond-continuity` (claim in the proof of ECD 22.7), for a cofiltered system
`Z` of qcqs diamonds over `Y` with limit cone `l`: the comparison from the colimit of the
cohomologies is an isomorphism. `RΓ W` is the supplier's derived global sections
`push (toPt W)`; the colimit is taken in `D pt`. -/
theorem qcqsDiamond_cohomology_continuous [HasColimitsOfSize.{0, 0} (𝒞.D 𝒞.pt)]
    {J : Type} [SmallCategory J] [IsCofiltered J] [Nonempty J] (Z : J ⥤ 𝒞.V) {Y : 𝒞.V}
    (z : ∀ j, Z.obj j ⟶ Y) (hz : ∀ {i j : J} (a : i ⟶ j), Z.map a ≫ z j = z i)
    (c : Cone Z) (hc : IsLimit c) (C : 𝒞.D Y) (n : ℤ) (hC : 𝒞.isGE Y n C)
    (F : Jᵒᵖ ⥤ 𝒞.D 𝒞.pt)
    (hF : ∀ j, F.obj (Opposite.op j) = (𝒞.push (𝒞.toPt (Z.obj j))).obj ((𝒞.pull (z j)).obj C))
    (cc : Cocone F)
    (hcc : cc.pt = (𝒞.push (𝒞.toPt c.pt)).obj ((𝒞.pull (c.π.app (Classical.arbitrary J) ≫ z _)).obj C))
    : Nonempty (IsColimit cc) := by sorry

/-- `S1/proper-dim-zero-topological-comparison` (ECD 22.7): pullback from sheaves on |Y|
is an equivalence onto bounded-below étale objects; `Dtop` is the derived category of
sheaves on the topological space |Y| and `t` the supplier's pullback functor. -/
theorem properDimTrgZero_topological_equiv {Y X : 𝒞.V} (f : Y ⟶ X)
    (hX : 𝒞.strictlyTotallyDisconnected X) (hp : 𝒞.proper f) (h0 : 𝒞.finDimTrg f)
    (Dtop : Type w) [Category.{w} Dtop] (t : Dtop ⥤ 𝒞.D Y) : t.Full ∧ t.Faithful := by sorry

/-- `S1/lower-shriek-base-change-qc` (ECD 22.8). -/
theorem lowerShriekQC_baseChange {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (g : Y' ⟶ Y) :
    Nonempty (lowerShriekQC f hf ⋙ 𝒞.pull g ≅
      𝒞.pull (pullback.fst f g) ⋙ lowerShriekQC (pullback.snd f g) (hf.baseChange g)) := by sorry

/-- `S1/lower-shriek-composition-qc` (ECD 22.9). -/
theorem lowerShriekQC_comp {X Y Z : 𝒞.V} (g : X ⟶ Y) (f : Y ⟶ Z) (hg : IsSpatialEligible g)
    (hf : IsSpatialEligible f) :
    Nonempty (lowerShriekQC g hg ⋙ lowerShriekQC f hf ≅ lowerShriekQC (g ≫ f) (hg.comp hf)) := by
  sorry

/-- `S1/projection-formula-qc` (ECD 22.11): B on the source, A on the base. -/
theorem lowerShriekQC_projection {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (A : 𝒞.D Y) (B : 𝒞.D X) :
    Nonempty (((𝒞.tensor Y).obj ((lowerShriekQC f hf).obj B)).obj A ≅
      (lowerShriekQC f hf).obj (((𝒞.tensor X).obj B).obj ((𝒞.pull f).obj A))) := by sorry

/-- `S1/lower-shriek-direct-sums-qc` (ECD 22.12); API `lowerShriekQC_sum`. -/
theorem lowerShriekQC_preservesCoproducts {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (J : Type) : PreservesColimitsOfShape (Discrete J) (lowerShriekQC f hf) := by sorry

theorem lowerShriekQC_sum {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) (J : Type) :
    PreservesColimitsOfShape (Discrete J) (lowerShriekQC f hf) :=
  lowerShriekQC_preservesCoproducts f hf J


-- unit test `lowerShriekQC_id`
example (X : 𝒞.V) (h : IsSpatialEligible (𝟙 X)) : Nonempty (lowerShriekQC (𝟙 X) h ≅ 𝟭 _) := by sorry

-- unit test `lowerShriekQC_generic_point`: when the canonical compactification of the open
-- immersion is the target itself (the generic point of Spa(C, C⁺)), Rf_! is extension by zero
-- j_!, not Rj_*.
example {U X : 𝒞.V} (j : U ⟶ X) (hj : 𝒞.openImmersion j) (h : IsSpatialEligible j)
    (hcpt : IsIso (𝒞.cptMap j)) : Nonempty (lowerShriekQC j h ≅ 𝒞.openShriek j hj) := by sorry

-- unit test `lowerShriekQC_finite_etale`
example {X Y : 𝒞.V} (f : X ⟶ Y) (h : IsSpatialEligible f) (hfe : 𝒞.finiteEtale f) :
    Nonempty (lowerShriekQC f h ≅ 𝒞.push f) := by sorry

-- unit test `lowerShriekQC_ball_degree_two`: stated in S5 below, after `Ball`.

end S1

/-! ## S2. Non-quasicompact maps and small v-stacks -/
section S2
variable {𝒞}

/-- `S2/proper-support-subcategory` (ECD 22.13(a)): objects `A ≃ j_{V!} j_V^* A` for an open
`V ⊂ X` quasicompact over `Y`. -/
def properSupportSubcategory {X Y : 𝒞.V} (f : X ⟶ Y) (A : 𝒞.D X) : Prop :=
  ∃ (W : 𝒞.V) (jW : W ⟶ X) (h : 𝒞.openImmersion jW), 𝒞.quasicompact (jW ≫ f) ∧
    Nonempty (A ≅ (𝒞.openShriek jW h).obj ((𝒞.pull jW).obj A))

lemma mem_properSupportSubcategory_iff {X Y : 𝒞.V} (f : X ⟶ Y) (A : 𝒞.D X) :
    properSupportSubcategory f A ↔ ∃ (W : 𝒞.V) (jW : W ⟶ X) (h : 𝒞.openImmersion jW),
      𝒞.quasicompact (jW ≫ f) ∧ Nonempty (A ≅ (𝒞.openShriek jW h).obj ((𝒞.pull jW).obj A)) := Iff.rfl

lemma properSupportSubcategory.extendByZero_mem {W X Y : 𝒞.V} (f : X ⟶ Y) (jW : W ⟶ X)
    (h : 𝒞.openImmersion jW) (hqc : 𝒞.quasicompact (jW ≫ f)) (B : 𝒞.D W) :
    properSupportSubcategory f ((𝒞.openShriek jW h).obj B) := by sorry

/-- Every object is the filtered colimit of its proper-support truncations `j_{V!} j_V^* A`;
recorded for a filtered diagram `F` of such objects with colimit `A`. -/
lemma properSupportSubcategory.colimit_eq {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (A : 𝒞.D X) : ∃ (J : Type) (_ : SmallCategory J) (_ : IsFiltered J) (F : J ⥤ 𝒞.D X)
      (c : Cocone F), c.pt = A ∧ Nonempty (IsColimit c) ∧ ∀ j, properSupportSubcategory f (F.obj j) := by
  sorry

lemma properSupportSubcategory.pullback_mem {X Y Y' : 𝒞.V} (f : X ⟶ Y) (g : Y' ⟶ Y)
    (A : 𝒞.D X) (hA : properSupportSubcategory f A) :
    properSupportSubcategory (pullback.snd f g) ((𝒞.pull (pullback.fst f g)).obj A) := by sorry

lemma properSupportSubcategory.of_isQuasicompact {X Y : 𝒞.V} (f : X ⟶ Y)
    (hqc : 𝒞.quasicompact f) (A : 𝒞.D X) : properSupportSubcategory f A := by sorry

-- unit test `properSupportSubcategory_of_qc`
example {X Y : 𝒞.V} (f : X ⟶ Y) (h : IsSpatialEligible f) (A : 𝒞.D X) :
    properSupportSubcategory f A := properSupportSubcategory.of_isQuasicompact f h.qcqs A

-- unit test `properSupportSubcategory_disc`: extension by zero from a quasicompact open
example {W X Y : 𝒞.V} (f : X ⟶ Y) (jW : W ⟶ X) (h : 𝒞.openImmersion jW)
    (hqc : 𝒞.quasicompact (jW ≫ f)) :
    properSupportSubcategory f ((𝒞.openShriek jW h).obj (𝒞.unitObj W)) :=
  properSupportSubcategory.extendByZero_mem f jW h hqc _

-- unit test `not_mem_properSupportSubcategory_const`: on a non-quasicompact `X → Y` all of whose
-- quasicompact-over-`Y` opens `W` give `j_{W!}Λ ≇ Λ`, the constant object has no proper support.
example {X Y : 𝒞.V} (f : X ⟶ Y)
    (h : ∀ (W : 𝒞.V) (jW : W ⟶ X) (hj : 𝒞.openImmersion jW), 𝒞.quasicompact (jW ≫ f) →
      IsEmpty (𝒞.unitObj X ≅ (𝒞.openShriek jW hj).obj ((𝒞.pull jW).obj (𝒞.unitObj X)))) :
    ¬ properSupportSubcategory f (𝒞.unitObj X) := by
  rintro ⟨W, jW, hj, hqc, ⟨e⟩⟩
  exact (h W jW hj hqc).false e

/-- `S2/lower-shriek-locally-spatial` (ECD 22.13(b)): the left Kan extension of `Rf‾_* j_!`
from the proper-support subcategory (EnhancedDerivedSheaves E3). Data, constructed at the
enhanced level by the supplier's Kan extension. -/
def lowerShriekLocSpatial {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) : 𝒞.D X ⥤ 𝒞.D Y := by sorry

lemma lowerShriekLocSpatial_restrict {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) (A : 𝒞.D X)
    (hA : properSupportSubcategory f A) :
    Nonempty ((lowerShriekLocSpatial f hf hX hY).obj A ≅
      (𝒞.push (𝒞.cptMap f)).obj ((𝒞.openShriek (𝒞.toCpt f) hf.isCompactifiable.isOpenImmersion_toCpt).obj A)) := by
  sorry

/-- `S2/filtered-support-formula`: `Rf_! A = colim_V R(f|_V)_! (j_V^* A)`. -/
lemma lowerShriekLocSpatial_colim {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) (A : 𝒞.D X)
    {J : Type} [SmallCategory J] [IsFiltered J] (F : J ⥤ 𝒞.D X) (c : Cocone F) (hc : IsColimit c)
    (hcA : c.pt = A) (hF : ∀ j, properSupportSubcategory f (F.obj j)) :
    Nonempty (IsColimit ((lowerShriekLocSpatial f hf hX hY).mapCocone c)) := by sorry

lemma lowerShriekLocSpatial_eq_qc {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) :
    Nonempty (lowerShriekLocSpatial f hf.isEligible hX hY ≅ lowerShriekQC f hf) := by sorry

/-- `S2/lower-shriek-colimits-locally-spatial` (ECD 22.14). -/
theorem lowerShriekLocSpatial_preservesColimits {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) :
    PreservesColimitsOfSize.{0, 0} (lowerShriekLocSpatial f hf hX hY) := by sorry

/-- `S2/lower-shriek-base-change-locally-spatial` (ECD 22.15, base quasiseparated: E99). -/
theorem lowerShriekLocSpatial_baseChange {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (g : Y' ⟶ Y) (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) (hY' : 𝒞.locallySpatial Y')
    (hX' : 𝒞.locallySpatial (pullback f g)) :
    Nonempty (lowerShriekLocSpatial f hf hX hY ⋙ 𝒞.pull g ≅
      𝒞.pull (pullback.fst f g) ⋙ lowerShriekLocSpatial (pullback.snd f g) (hf.baseChange g) hX' hY') := by
  sorry

/-- Universal property: transformations out of `Rf_!` are transformations out of `Rf‾_* j_!`
on the proper-support subcategory (the left Kan extension property). -/
lemma lowerShriekLocSpatial_isLeftKanExtension {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) (G : 𝒞.D X ⥤ 𝒞.D Y)
    (α β : lowerShriekLocSpatial f hf hX hY ⟶ G)
    (h : ∀ A, properSupportSubcategory f A → α.app A = β.app A) : α = β := by sorry

-- unit test `lowerShriekLocSpatial_qc`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) (hX : 𝒞.locallySpatial X)
    (hY : 𝒞.locallySpatial Y) : Nonempty (lowerShriekLocSpatial f hf.isEligible hX hY ≅ lowerShriekQC f hf) :=
  lowerShriekLocSpatial_eq_qc f hf hX hY

-- unit test `lowerShriekLocSpatial_openDisc`: Rf_!Λ of the open disc is concentrated in degree 2.
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (hX : 𝒞.locallySpatial X)
    (hY : 𝒞.locallySpatial Y)
    (hdisc : ∀ (W : 𝒞.V) (jW : W ⟶ X), 𝒞.openImmersion jW → 𝒞.quasicompact (jW ≫ f) →
      ∀ h : IsSpatialEligible (jW ≫ f), 𝒞.isGE Y 2 ((lowerShriekQC _ h).obj (𝒞.unitObj W)) ∧
        𝒞.isLE Y 2 ((lowerShriekQC _ h).obj (𝒞.unitObj W))) :
    𝒞.isGE Y 2 ((lowerShriekLocSpatial f hf hX hY).obj (𝒞.unitObj X)) ∧
      𝒞.isLE Y 2 ((lowerShriekLocSpatial f hf hX hY).obj (𝒞.unitObj X)) := by sorry

-- unit test `lowerShriekLocSpatial_ne_pushforward`: for the open disc, Rf_!Λ has no degree-0 part
-- while Rf_*Λ does (Rf_*Λ = Λ ≠ 0 in degree 0).
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (hX : 𝒞.locallySpatial X)
    (hY : 𝒞.locallySpatial Y) (h2 : 𝒞.isGE Y 2 ((lowerShriekLocSpatial f hf hX hY).obj (𝒞.unitObj X)))
    (h0 : ¬ 𝒞.isGE Y 1 ((𝒞.push f).obj (𝒞.unitObj X))) :
    ¬ Nonempty (lowerShriekLocSpatial f hf hX hY ≅ 𝒞.push f) := by sorry

/-- `S2/hypercover-support-diagram`: the coherent diagram over a simplicial v-hypercover
`Y• → Y` by quasiseparated locally spatial diamonds (data at the enhanced level, built from
EnhancedDerivedSheaves E0/E2/E3); `Hypercover` is the supplier's type of such hypercovers. -/
def hypercoverSupportDiagram {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) : Type (max u w) := by sorry

/-- `S2/hypercover-support-diagram`, second datum: the fibrewise left Kan extension `Rf•!⁰`,
recorded through its value on coCartesian sections (the descended functor). -/
def lowerShriekHypercover {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) : 𝒞.D X ⥤ 𝒞.D Y := by sorry

/-- The fibre over `[i]` of the support sub-fibration, with the stage `Yᵢ` given by `stage`. -/
lemma hypercoverSupportDiagram.fibre {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) (stage : ℕ → 𝒞.V) (toY : ∀ i, stage i ⟶ Y)
    (i : ℕ) (A : 𝒞.D (pullback f (toY i))) :
    properSupportSubcategory (pullback.snd f (toY i)) A → properSupportSubcategory (pullback.snd f (toY i)) A :=
  id

lemma hypercoverSupportDiagram.isCocartesian {X Y Y' : 𝒞.V} (f : X ⟶ Y) (g : Y' ⟶ Y) (A : 𝒞.D X)
    (hA : properSupportSubcategory f A) :
    properSupportSubcategory (pullback.snd f g) ((𝒞.pull (pullback.fst f g)).obj A) :=
  properSupportSubcategory.pullback_mem f g A hA

lemma hypercoverSupportDiagram.extendByZero_fibre {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsCompactifiable f) :
    (𝒞.openShriek (𝒞.toCpt f) hf.isOpenImmersion_toCpt).Full ∧
      (𝒞.openShriek (𝒞.toCpt f) hf.isOpenImmersion_toCpt).Faithful := by sorry

def hypercoverSupportDiagram.pushforward_fibre {X Y : 𝒞.V} (f : X ⟶ Y) :
    𝒞.pull (𝒞.cptMap f) ⊣ 𝒞.push (𝒞.cptMap f) := 𝒞.pullPushAdj _

/-- `S2/fibrewise-lower-shriek` (ECD 22.16), for a hypercover whose stage-0 object is `Y`
itself (the constant case suffices to fix the shape; the fibre over `[i]` is `Rfᵢ!`). -/
theorem lowerShriekHypercover_fibre {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) (hX : 𝒞.locallySpatial X)
    (hY : 𝒞.locallySpatial Y) :
    Nonempty (lowerShriekHypercover f hf Hypercover H ≅ lowerShriekLocSpatial f hf hX hY) := by sorry

/-- `S2/cocartesian-preservation` (ECD 22.17): the descended functor commutes with pullback
to the stages of the hypercover. -/
theorem lowerShriekHypercover_cocartesian {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) (H' : Hypercover Y') (g : Y' ⟶ Y) :
    Nonempty (lowerShriekHypercover f hf Hypercover H ⋙ 𝒞.pull g ≅
      𝒞.pull (pullback.fst f g) ⋙ lowerShriekHypercover (pullback.snd f g) (hf.baseChange g) Hypercover H') := by
  sorry

lemma hypercoverSupportDiagram.refine {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H H' : Hypercover Y) :
    Nonempty (lowerShriekHypercover f hf Hypercover H ≅ lowerShriekHypercover f hf Hypercover H') := by
  sorry

-- unit test `hypercoverSupportDiagram_constant`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (Hypercover : 𝒞.V → Type u)
    (H : Hypercover Y) (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) :
    Nonempty (lowerShriekHypercover f hf Hypercover H ≅ lowerShriekLocSpatial f hf hX hY) :=
  lowerShriekHypercover_fibre f hf Hypercover H hX hY

-- unit test `hypercoverSupportDiagram_qc`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) (Hypercover : 𝒞.V → Type u)
    (H : Hypercover Y) : Nonempty (lowerShriekHypercover f hf.isEligible Hypercover H ≅ lowerShriekQC f hf) := by
  sorry

-- unit test `hypercoverSupportDiagram_homotopy_category_insufficient`: recorded in the
-- roadmap document; it concerns the failure of descent for homotopy categories, which the
-- homotopy-level interface of this file cannot express.

/-- `S2/lower-shriek` (ECD 22.18): Rf_! for eligible maps of small v-stacks, by descent along
a hypercover (data; the hypercover is chosen by the supplier E2). -/
def lowerShriek {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) : 𝒞.D X ⥤ 𝒞.D Y := by sorry

lemma lowerShriek_eq_locSpatial {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hX : 𝒞.locallySpatial X) (hY : 𝒞.locallySpatial Y) :
    Nonempty (lowerShriek f hf ≅ lowerShriekLocSpatial f hf hX hY) := by sorry

lemma lowerShriek_eq_qc {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) :
    Nonempty (lowerShriek f hf.isEligible ≅ lowerShriekQC f hf) := by sorry

/-- `S2/hypercover-independence`. -/
theorem lowerShriek_hypercover_indep {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (Hypercover : 𝒞.V → Type u) (H : Hypercover Y) :
    Nonempty (lowerShriekHypercover f hf Hypercover H ≅ lowerShriek f hf) := by sorry

/-- `S2/lower-shriek-base-change` (ECD 22.19). -/
theorem lowerShriek_baseChange {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (g : Y' ⟶ Y) :
    Nonempty (lowerShriek f hf ⋙ 𝒞.pull g ≅
      𝒞.pull (pullback.fst f g) ⋙ lowerShriek (pullback.snd f g) (hf.baseChange g)) := by sorry

/-- `S2/lower-shriek-colimits` (ECD 22.20). -/
theorem lowerShriek_preservesColimits {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) :
    PreservesColimitsOfSize.{0, 0} (lowerShriek f hf) := by sorry

/-- `S2/lower-shriek-composition` (ECD 22.21). -/
theorem lowerShriek_comp {X Y Z : 𝒞.V} (g : X ⟶ Y) (f : Y ⟶ Z) (hg : IsEligible g)
    (hf : IsEligible f) : Nonempty (lowerShriek g hg ⋙ lowerShriek f hf ≅ lowerShriek (g ≫ f) (hg.comp hf)) := by
  sorry

lemma lowerShriek_id (X : 𝒞.V) (h : IsEligible (𝟙 X)) : Nonempty (lowerShriek (𝟙 X) h ≅ 𝟭 _) := by
  sorry

/-- `S2/lower-shriek-etale-agreement` (ECD 22.22); API `lowerShriek_etale`. -/
theorem lowerShriek_eq_etaleLowerShriek {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f)
    (he : 𝒞.etale f) : Nonempty (lowerShriek f (IsEligible.of_separated_etale f hs he) ≅ 𝒞.etaleShriek f he hs) := by
  sorry

theorem lowerShriek_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f) (he : 𝒞.etale f) :
    Nonempty (lowerShriek f (IsEligible.of_separated_etale f hs he) ≅ 𝒞.etaleShriek f he hs) :=
  lowerShriek_eq_etaleLowerShriek f hs he

/-- `S2/projection-formula` (ECD 22.23, extended to small v-stacks). -/
theorem lowerShriek_projection {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (A : 𝒞.D Y)
    (B : 𝒞.D X) :
    Nonempty (((𝒞.tensor Y).obj ((lowerShriek f hf).obj B)).obj A ≅
      (lowerShriek f hf).obj (((𝒞.tensor X).obj B).obj ((𝒞.pull f).obj A))) := by sorry

/-- `S2/exchange-pasting-coherence` (a): base change along a composite is the pasting of the
two base changes (recorded as existence of compatible isomorphisms; the pasting identity is
an equality of the canonical ones). -/
theorem lowerShriek_baseChange_comp {X Y Y₁ Y₂ : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (g₁ : Y₁ ⟶ Y) (g₂ : Y₂ ⟶ Y₁) :
    Nonempty (lowerShriek f hf ⋙ 𝒞.pull (g₂ ≫ g₁) ≅
      𝒞.pull (pullback.fst f (g₂ ≫ g₁)) ⋙ lowerShriek (pullback.snd f (g₂ ≫ g₁)) (hf.baseChange _)) := by
  sorry

/-- `S2/exchange-pasting-coherence` (c): associativity of the composition equivalences. -/
theorem lowerShriek_comp_assoc {W X Y Z : 𝒞.V} (h : W ⟶ X) (g : X ⟶ Y) (f : Y ⟶ Z)
    (hh : IsEligible h) (hg : IsEligible g) (hf : IsEligible f) :
    Nonempty (lowerShriek h hh ⋙ lowerShriek (g ≫ f) (hg.comp hf) ≅
      lowerShriek (h ≫ g) (hh.comp hg) ⋙ lowerShriek f hf) := by sorry

-- unit test `lowerShriek_id_test`
example (X : 𝒞.V) (h : IsEligible (𝟙 X)) : Nonempty (lowerShriek (𝟙 X) h ≅ 𝟭 _) := lowerShriek_id X h

-- unit test `lowerShriek_open_immersion`
example {U X : 𝒞.V} (j : U ⟶ X) (hj : 𝒞.openImmersion j) (hs : 𝒞.separated j) (he : 𝒞.etale j) :
    Nonempty (lowerShriek j (IsEligible.of_separated_etale j hs he) ≅ 𝒞.openShriek j hj) := by sorry

-- unit test `lowerShriek_classifying_not_eligible`: a map not representable in locally spatial
-- diamonds (such as [*/K] → *) is not eligible.
example {X Y : 𝒞.V} (f : X ⟶ Y) (hr : ¬ 𝒞.reprLocSpatial f) : ¬ IsEligible f :=
  fun h => hr h.representable

-- unit test `lowerShriek_ball_point`: stated in S5 below, after `Ball`.

end S2

/-! ## S3. Exceptional inverse image and the formal identities -/
section S3
variable {𝒞}

/-- `S3/upper-shriek` (ECD 23.1): the right adjoint of Rf_! (adjoint functor theorem, E3). -/
def upperShriek {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) : 𝒞.D Y ⥤ 𝒞.D X := by sorry

/-- The adjunction Rf_! ⊣ Rf^!. -/
def lowerShriekUpperShriekAdj {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) :
    lowerShriek f hf ⊣ upperShriek f hf := by sorry

lemma upperShriek_preservesLimits {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) :
    PreservesLimitsOfSize.{0, 0} (upperShriek f hf) := by sorry

lemma upperShriek_id (X : 𝒞.V) (h : IsEligible (𝟙 X)) : Nonempty (upperShriek (𝟙 X) h ≅ 𝟭 _) := by sorry

/-- `S3/upper-shriek-composition`. -/
theorem upperShriek_comp {X Y Z : 𝒞.V} (g : X ⟶ Y) (f : Y ⟶ Z) (hg : IsEligible g)
    (hf : IsEligible f) : Nonempty (upperShriek (g ≫ f) (hg.comp hf) ≅ upperShriek f hf ⋙ upperShriek g hg) := by
  sorry

/-- `S3/upper-shriek-etale`. -/
theorem upperShriek_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f) (he : 𝒞.etale f) :
    Nonempty (upperShriek f (IsEligible.of_separated_etale f hs he) ≅ 𝒞.pull f) := by sorry

/-- `S3/upper-shriek-internal-hom` (ECD 23.3(ii)). -/
theorem upperShriek_internalHom {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (A B : 𝒞.D Y) :
    Nonempty ((upperShriek f hf).obj (((𝒞.ihom Y).obj (Opposite.op A)).obj B) ≅
      ((𝒞.ihom X).obj (Opposite.op ((𝒞.pull f).obj A))).obj ((upperShriek f hf).obj B)) := by sorry

/-- `S3/verdier-duality-lower-shriek` (ECD 23.3(i)). -/
theorem verdierDuality {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (A : 𝒞.D X) (B : 𝒞.D Y) :
    Nonempty (((𝒞.ihom Y).obj (Opposite.op ((lowerShriek f hf).obj A))).obj B ≅
      (𝒞.push f).obj (((𝒞.ihom X).obj (Opposite.op A)).obj ((upperShriek f hf).obj B))) := by sorry

/-- `S3/upper-shriek-pushforward-exchange` (ECD 23.16(i)): only `g` eligible; API
`upperShriek_pushforward`. -/
theorem upperShriek_pushforward_exchange {X Y X' : 𝒞.V} (f : Y ⟶ X) (g : X' ⟶ X)
    (hg : IsEligible g) :
    Nonempty (𝒞.push f ⋙ upperShriek g hg ≅
      upperShriek (pullback.fst f g) (IsEligible.baseChange_fst hg f) ⋙ 𝒞.push (pullback.snd f g)) := by sorry

theorem upperShriek_pushforward {X Y X' : 𝒞.V} (f : Y ⟶ X) (g : X' ⟶ X) (hg : IsEligible g) :
    Nonempty (𝒞.push f ⋙ upperShriek g hg ≅
      upperShriek (pullback.fst f g) (IsEligible.baseChange_fst hg f) ⋙ 𝒞.push (pullback.snd f g)) :=
  upperShriek_pushforward_exchange f g hg

-- `upperShriek_restrictScalars` (`S3/upper-shriek-change-of-rings`, Remark 23.2) needs two
-- coefficient rings over one geometry; it is listed among the signatures not prototyped
-- against this one-coefficient interface at the end of the file.

/-- The dualizing object D_f := Rf^!Λ. -/
def dualizingObject {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) : 𝒞.D X :=
  (upperShriek f hf).obj (𝒞.unitObj Y)

-- unit test `upperShriek_id_test`
example (X : 𝒞.V) (h : IsEligible (𝟙 X)) : Nonempty (upperShriek (𝟙 X) h ≅ 𝟭 _) := upperShriek_id X h

-- unit test `upperShriek_openImmersion`
example {U X : 𝒞.V} (j : U ⟶ X) (hs : 𝒞.separated j) (he : 𝒞.etale j) :
    Nonempty (upperShriek j (IsEligible.of_separated_etale j hs he) ≅ 𝒞.pull j) := upperShriek_etale j hs he

-- unit test `upperShriek_ne_pullback_profinite`: for an eligible map whose Rf^! does not
-- commute with countable sums, Rf^! is not a pullback (pullbacks are left adjoints).
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hns : ¬ PreservesColimitsOfShape (Discrete ℕ) (upperShriek f hf)) :
    ¬ Nonempty (upperShriek f hf ≅ 𝒞.pull f) := by
  rintro ⟨e⟩
  have := (𝒞.pullPushAdj f).leftAdjoint_preservesColimits
  exact hns (preservesColimitsOfShape_of_natIso e.symm)

-- unit test `upperShriek_ball`: stated in S5 below, after `Ball`.

/-- `S3/adjunction-calculus`: the trace (counit) `Rf_! Rf^! → id`. -/
def shriekTrace {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) :
    upperShriek f hf ⋙ lowerShriek f hf ⟶ 𝟭 _ := (lowerShriekUpperShriekAdj f hf).counit

/-- The twisted-pullback transformation `Rf^!Λ ⊗ f^* → Rf^!`. -/
def twistedPullbackTransformation {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) :
    𝒞.pull f ⋙ 𝒞.tensorObj (dualizingObject f hf) ⟶ upperShriek f hf := by sorry

/-- The base-change transformation `g̃^* Rf^! → Rf′^! g^*` for a cartesian square with `f`
eligible. -/
def upperShriekBaseChangeTransformation {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (g : Y' ⟶ Y) :
    upperShriek f hf ⋙ 𝒞.pull (pullback.fst f g) ⟶ 𝒞.pull g ⋙ upperShriek (pullback.snd f g) (hf.baseChange g) := by
  sorry

-- `shriekTrace_comp` (traces compose under the composition equivalences) is a pasting
-- identity of natural transformations; it is listed at the end of the file.

lemma twistedPullbackTransformation_openImmersion {U X : 𝒞.V} (j : U ⟶ X) (hs : 𝒞.separated j)
    (he : 𝒞.etale j) (hj : 𝒞.openImmersion j) :
    IsIso (twistedPullbackTransformation j (IsEligible.of_separated_etale j hs he)) := by sorry

lemma twistedPullbackTransformation_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f)
    (he : 𝒞.etale f) : IsIso (twistedPullbackTransformation f (IsEligible.of_separated_etale f hs he)) := by
  sorry

lemma shriekTrace_finiteEtale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f) (he : 𝒞.etale f)
    (hfe : 𝒞.finiteEtale f) :
    Nonempty (upperShriek f (IsEligible.of_separated_etale f hs he) ⋙ lowerShriek f (IsEligible.of_separated_etale f hs he) ≅
      𝒞.pull f ⋙ 𝒞.push f) := by sorry

lemma twistedPullbackTransformation_baseChange {X Y Y' : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (g : Y' ⟶ Y) (hiso : IsIso (twistedPullbackTransformation f hf)) (hbc : IsIso (upperShriekBaseChangeTransformation f hf g)) :
    IsIso (twistedPullbackTransformation (pullback.snd f g) (hf.baseChange g)) := by sorry

-- unit test `twistedPullback_id`
example (X : 𝒞.V) (h : IsEligible (𝟙 X)) : IsIso (twistedPullbackTransformation (𝟙 X) h) := by sorry

-- unit test `shriekTrace_openImmersion`
example {U X : 𝒞.V} (j : U ⟶ X) (hs : 𝒞.separated j) (he : 𝒞.etale j) (hj : 𝒞.openImmersion j) :
    Nonempty (lowerShriek j (IsEligible.of_separated_etale j hs he) ≅ 𝒞.openShriek j hj) ∧
      Nonempty (upperShriek j (IsEligible.of_separated_etale j hs he) ≅ 𝒞.pull j) := by sorry

-- unit test `shriekTrace_finiteEtale_degree`: recorded in the roadmap document (it needs the
-- integer multiplication on Λ_Y, which the interface does not name).

-- unit test `twistedPullback_not_iso_profinite`: if Rf^! fails to commute with countable sums,
-- the twisted-pullback transformation is not an isomorphism (its source does).
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hsrc : PreservesColimitsOfShape (Discrete ℕ) (𝒞.pull f ⋙ 𝒞.tensorObj (dualizingObject f hf)))
    (hns : ¬ PreservesColimitsOfShape (Discrete ℕ) (upperShriek f hf)) :
    ¬ IsIso (twistedPullbackTransformation f hf) := by
  intro h
  exact hns (preservesColimitsOfShape_of_natIso (asIso (twistedPullbackTransformation f hf)))

end S3

/-! ## S4. Cohomological smoothness with the revised descent hypotheses

Coefficients: the context's Λ plays the role of `F_ℓ` (or an ℓ-power-torsion ring) with
`ℓ ≠ p`; the prime `ℓ` is fixed with the context. -/
section S4
variable {𝒞}

/-- `S4/invertible-object` (ECD 23.8): étale locally isomorphic to a shift of Λ. -/
def IsInvertibleObject {X : 𝒞.V} (A : 𝒞.D X) : Prop :=
  ∃ (U : 𝒞.V) (u : U ⟶ X) (n : ℤ), 𝒞.etale u ∧ 𝒞.surjective u ∧
    Nonempty ((𝒞.pull u).obj A ≅ (𝒞.unitObj U)⟦n⟧)

lemma IsInvertibleObject.shift {X : 𝒞.V} {A : 𝒞.D X} (h : IsInvertibleObject A) (m : ℤ) :
    IsInvertibleObject (A⟦m⟧) := by sorry

lemma IsInvertibleObject.const (X : 𝒞.V) (n : ℤ) (hs : 𝒞.surjective (𝟙 X)) (he : 𝒞.etale (𝟙 X)) :
    IsInvertibleObject ((𝒞.unitObj X)⟦n⟧) := by sorry

lemma IsInvertibleObject.tensor {X : 𝒞.V} {A B : 𝒞.D X} (hA : IsInvertibleObject A)
    (hB : IsInvertibleObject B) : IsInvertibleObject (((𝒞.tensor X).obj A).obj B) := by sorry

lemma IsInvertibleObject.pullback {X Y : 𝒞.V} (f : X ⟶ Y) {A : 𝒞.D Y}
    (hA : IsInvertibleObject A) : IsInvertibleObject ((𝒞.pull f).obj A) := by sorry

/-- Étale-local invertibility is equivalent to v-local invertibility (`v` the supplier's
v-covers, here: surjective maps). -/
lemma isInvertibleObject_iff_etale_local {X : 𝒞.V} (A : 𝒞.D X) :
    IsInvertibleObject A ↔ ∃ (U : 𝒞.V) (u : U ⟶ X) (n : ℤ), 𝒞.surjective u ∧
      Nonempty ((𝒞.pull u).obj A ≅ (𝒞.unitObj U)⟦n⟧) := by sorry

lemma IsInvertibleObject.tensor_dual {X : 𝒞.V} {A : 𝒞.D X} (hA : IsInvertibleObject A) :
    Nonempty (((𝒞.tensor X).obj A).obj (((𝒞.ihom X).obj (Opposite.op A)).obj (𝒞.unitObj X)) ≅ 𝒞.unitObj X) := by
  sorry

/-- The local degree, as a function on a cover where `A` is trivialised. -/
lemma IsInvertibleObject.degree {X : 𝒞.V} {A : 𝒞.D X} (hA : IsInvertibleObject A) :
    ∃ (U : 𝒞.V) (u : U ⟶ X) (n : ℤ), 𝒞.etale u ∧ Nonempty ((𝒞.pull u).obj A ≅ (𝒞.unitObj U)⟦n⟧) := by
  obtain ⟨U, u, n, he, -, e⟩ := hA
  exact ⟨U, u, n, he, e⟩

-- `IsInvertibleObject.of_reduction` (invertibility over Λ from invertibility of `A ⊗ F_ℓ`)
-- needs two coefficient rings; it is listed at the end of the file.

-- unit test `IsInvertibleObject.const_zero`
example (X : 𝒞.V) (hs : 𝒞.surjective (𝟙 X)) (he : 𝒞.etale (𝟙 X)) :
    IsInvertibleObject ((𝒞.unitObj X)⟦(0 : ℤ)⟧) := IsInvertibleObject.const X 0 hs he

-- unit test `IsInvertibleObject.tate_twist`: stated in S5 (`tateTwist_isInvertible`).

-- unit test `not_isInvertibleObject_extensionByZero`: an object with a zero pullback to a
-- surjective étale cover's every point is not invertible; recorded as: if every pullback of
-- `A` to an étale `u` is zero then `A` is not invertible (unit objects are nonzero).
example {X : 𝒞.V} (A : 𝒞.D X)
    (hz : ∀ (U : 𝒞.V) (u : U ⟶ X) (n : ℤ), 𝒞.etale u → 𝒞.surjective u →
      IsEmpty ((𝒞.pull u).obj A ≅ (𝒞.unitObj U)⟦n⟧)) : ¬ IsInvertibleObject A := by
  rintro ⟨U, u, n, he, hs, ⟨e⟩⟩
  exact (hz U u n he hs).false e

-- unit test `not_isInvertibleObject_sum`
example {X : 𝒞.V} [HasBinaryBiproducts (𝒞.D X)]
    (h : ∀ (U : 𝒞.V) (u : U ⟶ X) (n : ℤ), 𝒞.etale u → 𝒞.surjective u →
      IsEmpty ((𝒞.pull u).obj (𝒞.unitObj X ⊞ 𝒞.unitObj X) ≅ (𝒞.unitObj U)⟦n⟧)) :
    ¬ IsInvertibleObject (𝒞.unitObj X ⊞ 𝒞.unitObj X) := by
  rintro ⟨U, u, n, he, hs, ⟨e⟩⟩
  exact (h U u n he hs).false e

/-- `S4/cohomologically-smooth` (ECD 23.8, with the misprint E64 corrected: the twist is
`D ⊗ f_X^*`). The twist is not required to be natural. -/
def IsCohomologicallySmooth {X Y : 𝒞.V} (f : X ⟶ Y) : Prop :=
  𝒞.separated f ∧ ∃ hf : IsEligible f, ∀ (T : 𝒞.V) (t : T ⟶ Y), 𝒞.strictlyTotallyDisconnected T →
    ∃ (Dt : 𝒞.D (pullback f t)), IsInvertibleObject Dt ∧
      Nonempty (upperShriek (pullback.snd f t) (hf.baseChange t) ≅ 𝒞.pull (pullback.snd f t) ⋙ 𝒞.tensorObj Dt)

lemma IsCohomologicallySmooth.isEligible {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    IsEligible f := h.2.1

lemma IsCohomologicallySmooth.isSeparated {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    𝒞.separated f := h.1

/-- `S4/strictly-local-criteria` (ECD 23.4), recorded for (i) ⇔ (ii) ⇔ "Rf^! commutes with
sums and the open-immersion condition" over a strictly totally disconnected base. -/
theorem upperShriek_twist_tfae {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hY : 𝒞.strictlyTotallyDisconnected Y) (hX : 𝒞.locallySpatial X) :
    [IsIso (twistedPullbackTransformation f hf),
     ∃ A : 𝒞.D X, Nonempty (upperShriek f hf ≅ 𝒞.pull f ⋙ 𝒞.tensorObj A),
     PreservesColimitsOfShape (Discrete ℕ) (upperShriek f hf) ∧
       ∀ (U : 𝒞.V) (j : U ⟶ Y) (hj : 𝒞.openImmersion j),
         Nonempty ((𝒞.openShriek (pullback.fst f j) (by sorry)).obj
            ((upperShriek (pullback.snd f j) (hf.baseChange j)).obj (𝒞.unitObj U)) ≅
           (upperShriek f hf).obj ((𝒞.openShriek j hj).obj (𝒞.unitObj U)))].TFAE := by sorry

/-- `S4/strictly-local-criteria-torsion` (23.4, Moreover): for an ℓ-power-torsion
coefficient context the twist is an equivalence once it is one over `F_ℓ`; recorded in the
one-coefficient interface as the twist statement itself. -/
theorem upperShriek_twist_of_ellTorsion {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f)
    (hY : 𝒞.strictlyTotallyDisconnected Y)
    (h : ∃ A : 𝒞.D X, Nonempty (upperShriek f hf ≅ 𝒞.pull f ⋙ 𝒞.tensorObj A)) :
    IsIso (twistedPullbackTransformation f hf) := by sorry

/-- `S4/profinite-projection-pushforward` (Lemma 23.6, with nΛ = 0, n prime to p: E69):
`Rh_* h^* C ≅ C⁰(S, Λ) ⊗ C`; `CS` is the constant object C⁰(S, Λ) on `Y`. -/
theorem profiniteProjection_pushforward_pullback {Y YS : 𝒞.V} (h : YS ⟶ Y) (hp : 𝒞.proper h)
    (hq : 𝒞.quasiProEtale h) (CS : 𝒞.D Y) (C : 𝒞.D Y) :
    Nonempty ((𝒞.push h).obj ((𝒞.pull h).obj C) ≅ ((𝒞.tensor Y).obj CS).obj C) ↔
      Nonempty ((𝒞.push h).obj ((𝒞.pull h).obj (𝒞.unitObj Y)) ≅ CS) := by sorry

/-- `S4/direct-sum-criterion` (ECD 23.7). -/
theorem upperShriek_preservesCoproducts_iff {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f)
    (hY : 𝒞.strictlyTotallyDisconnected Y) :
    (∀ J : Type, PreservesColimitsOfShape (Discrete J) (upperShriek f hf.isEligible)) ↔
      ∀ A : 𝒞.D X, 𝒞.constructible X A → 𝒞.constructible Y ((lowerShriek f hf.isEligible).obj A) := by sorry

/-- `S4/practical-smoothness-criterion` (ECD 23.10); API `isCohomologicallySmooth_iff`. -/
theorem isCohomologicallySmooth_iff_practical {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) :
    IsCohomologicallySmooth f ↔
      ∀ (T : 𝒞.V) (t : T ⟶ Y), 𝒞.strictlyTotallyDisconnected T →
        (∀ A, 𝒞.constructible _ A →
          𝒞.constructible T ((lowerShriek (pullback.snd f t) (hf.isEligible.baseChange t)).obj A)) ∧
        IsInvertibleObject ((upperShriek (pullback.snd f t) (hf.isEligible.baseChange t)).obj (𝒞.unitObj T)) := by
  sorry

theorem isCohomologicallySmooth_iff {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsSpatialEligible f) :
    IsCohomologicallySmooth f ↔
      ∀ (T : 𝒞.V) (t : T ⟶ Y), 𝒞.strictlyTotallyDisconnected T →
        (∀ A, 𝒞.constructible _ A →
          𝒞.constructible T ((lowerShriek (pullback.snd f t) (hf.isEligible.baseChange t)).obj A)) ∧
        IsInvertibleObject ((upperShriek (pullback.snd f t) (hf.isEligible.baseChange t)).obj (𝒞.unitObj T)) :=
  isCohomologicallySmooth_iff_practical f hf

/-- `S4/smooth-universally-open` (ECD 23.11). -/
theorem IsCohomologicallySmooth.isUniversallyOpen {X Y : 𝒞.V} {f : X ⟶ Y}
    (h : IsCohomologicallySmooth f) : 𝒞.universallyOpen f := by sorry

/-- `S4/smooth-twisted-pullback` (ECD 23.12(i)); API `IsCohomologicallySmooth.twist`. -/
theorem IsCohomologicallySmooth.upperShriek_twist {X Y : 𝒞.V} {f : X ⟶ Y}
    (h : IsCohomologicallySmooth f) :
    IsIso (twistedPullbackTransformation f h.isEligible) ∧ IsInvertibleObject (dualizingObject f h.isEligible) := by
  sorry

theorem IsCohomologicallySmooth.twist {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    IsIso (twistedPullbackTransformation f h.isEligible) ∧ IsInvertibleObject (dualizingObject f h.isEligible) :=
  h.upperShriek_twist

/-- `S4/dualizing-complex`: D_f := Rf^!Λ for smooth f. -/
def dualizingComplex {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) : 𝒞.D X :=
  dualizingObject f h.isEligible

lemma dualizingComplex_def {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    dualizingComplex h = (upperShriek f h.isEligible).obj (𝒞.unitObj Y) := rfl

lemma dualizingComplex_isInvertible {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    IsInvertibleObject (dualizingComplex h) := h.upperShriek_twist.2

lemma upperShriek_eq_dualizing_tensor_pullback {X Y : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f) :
    Nonempty (𝒞.pull f ⋙ 𝒞.tensorObj (dualizingComplex h) ≅ upperShriek f h.isEligible) := by
  exact ⟨@asIso _ _ _ _ (twistedPullbackTransformation f h.isEligible) h.upperShriek_twist.1⟩

/-- `S4/smooth-stable-under-base-change` (23.15, first part). -/
theorem IsCohomologicallySmooth.baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f)
    (g : Y' ⟶ Y) : IsCohomologicallySmooth (pullback.snd f g) := by sorry

/-- `S4/smooth-upper-shriek-base-change` (ECD 23.12(iii)). -/
theorem IsCohomologicallySmooth.upperShriek_baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y}
    (h : IsCohomologicallySmooth f) (g : Y' ⟶ Y) :
    IsIso (upperShriekBaseChangeTransformation f h.isEligible g) := by sorry

lemma dualizingComplex_baseChange {X Y Y' : 𝒞.V} {f : X ⟶ Y} (h : IsCohomologicallySmooth f)
    (g : Y' ⟶ Y) :
    Nonempty ((𝒞.pull (pullback.fst f g)).obj (dualizingComplex h) ≅ dualizingComplex (h.baseChange g)) := by
  sorry

/-- `S4/smooth-composition` (23.13, first part). -/
theorem IsCohomologicallySmooth.comp {X Y Z : 𝒞.V} {g : X ⟶ Y} {f : Y ⟶ Z}
    (hg : IsCohomologicallySmooth g) (hf : IsCohomologicallySmooth f) :
    IsCohomologicallySmooth (g ≫ f) := by sorry

lemma dualizingComplex_comp {X Y Z : 𝒞.V} {g : X ⟶ Y} {f : Y ⟶ Z}
    (hg : IsCohomologicallySmooth g) (hf : IsCohomologicallySmooth f) :
    Nonempty (dualizingComplex (hg.comp hf) ≅
      ((𝒞.tensor X).obj (dualizingComplex hg)).obj ((𝒞.pull g).obj (dualizingComplex hf))) := by sorry

/-- `S4/smooth-descent-along-smooth-surjection` (23.13, converse, all hypotheses kept). -/
theorem IsCohomologicallySmooth.of_comp_of_surjective {X Y Z : 𝒞.V} (g : X ⟶ Y) (f : Y ⟶ Z)
    (hg : IsCohomologicallySmooth g) (hgf : IsCohomologicallySmooth (g ≫ f)) (hsurj : 𝒞.surjective g)
    (hfs : 𝒞.separated f) (hfd : 𝒞.reprDiamonds f) (hfc : IsCompactifiable f) :
    IsCohomologicallySmooth f := by sorry

/-- `S4/representability-descent` (Remark 23.14). -/
theorem representableInLocallySpatial_of_universallyOpen_cover {X Y Z : 𝒞.V} (g : X ⟶ Y)
    (f : Y ⟶ Z) (hfs : 𝒞.separated f) (hfd : 𝒞.reprDiamonds f) (hgo : 𝒞.universallyOpen g)
    (hgs : 𝒞.separated g) (hsurj : 𝒞.surjective g) (hgf : 𝒞.reprLocSpatial (g ≫ f)) :
    𝒞.reprLocSpatial f := by sorry

/-- `S4/representability-descent`, second statement: with a locally split smooth surjection
the compactifiability hypothesis on `f` is not needed. -/
theorem IsCohomologicallySmooth.of_comp_of_isLocallySplit {X Y Z : 𝒞.V} (g : X ⟶ Y) (f : Y ⟶ Z)
    (hg : IsCohomologicallySmooth g) (hgf : IsCohomologicallySmooth (g ≫ f)) (hsplit : IsLocallySplit g)
    (hfs : 𝒞.separated f) (hfd : 𝒞.reprDiamonds f) : IsCohomologicallySmooth f := by sorry

/-- `S4/smooth-v-local-on-target` (23.15, converse; local finiteness of dim.trg f assumed). -/
theorem IsCohomologicallySmooth.of_baseChange_of_surjective {X Y Y' : 𝒞.V} (f : X ⟶ Y)
    (g : Y' ⟶ Y) (hsurj : 𝒞.surjective g) (hs : 𝒞.separated f) (hr : 𝒞.reprLocSpatial f)
    (hd : 𝒞.locFinDimTrg f) (h : IsCohomologicallySmooth (pullback.snd f g)) :
    IsCohomologicallySmooth f := by sorry

theorem IsCohomologicallySmooth.of_baseChange {X Y Y' : 𝒞.V} (f : X ⟶ Y) (g : Y' ⟶ Y)
    (hsurj : 𝒞.surjective g) (hs : 𝒞.separated f) (hr : 𝒞.reprLocSpatial f) (hd : 𝒞.locFinDimTrg f)
    (h : IsCohomologicallySmooth (pullback.snd f g)) : IsCohomologicallySmooth f :=
  IsCohomologicallySmooth.of_baseChange_of_surjective f g hsurj hs hr hd h

/-- `S4/smooth-perfect-constructible` (23.12(ii)); quasicompact smooth maps only. -/
theorem IsCohomologicallySmooth.lowerShriek_perfectConstructible {X Y : 𝒞.V} {f : X ⟶ Y}
    (h : IsCohomologicallySmooth f) (hqc : 𝒞.quasicompact f) (A : 𝒞.D X)
    (hA : 𝒞.perfectConstructible X A) : 𝒞.perfectConstructible Y ((lowerShriek f h.isEligible).obj A) := by
  sorry

/-- `S4/smooth-base-change` (23.16(ii)): `g^* Rf_* ≅ Rf′_* g̃^*` for smooth `g`, `f` arbitrary. -/
theorem IsCohomologicallySmooth.pushforward_baseChange {X Y X' : 𝒞.V} (f : Y ⟶ X) (g : X' ⟶ X)
    (hg : IsCohomologicallySmooth g) :
    Nonempty (𝒞.push f ⋙ 𝒞.pull g ≅ 𝒞.pull (pullback.fst f g) ⋙ 𝒞.push (pullback.snd f g)) := by sorry

/-- `S4/smooth-upper-shriek-exchange` (23.16(iii), with the hypothesis on `f` added: E66). -/
theorem IsCohomologicallySmooth.upperShriek_exchange {X Y X' : 𝒞.V} (f : Y ⟶ X) (g : X' ⟶ X)
    (hg : IsCohomologicallySmooth g) (hf : IsEligible f) :
    Nonempty (upperShriek f hf ⋙ 𝒞.pull (pullback.fst f g) ≅
      𝒞.pull g ⋙ upperShriek (pullback.snd f g) (hf.baseChange g)) := by sorry

/-- `S4/smooth-pullback-internal-hom` (23.17, ℓ-power-torsion Λ: E68). -/
theorem IsCohomologicallySmooth.pullback_internalHom {X Y : 𝒞.V} {f : X ⟶ Y}
    (h : IsCohomologicallySmooth f) (A B : 𝒞.D Y) :
    Nonempty ((𝒞.pull f).obj (((𝒞.ihom Y).obj (Opposite.op A)).obj B) ≅
      ((𝒞.ihom X).obj (Opposite.op ((𝒞.pull f).obj A))).obj ((𝒞.pull f).obj B)) := by sorry

/-- `S4/etale-maps-smooth`. -/
theorem IsCohomologicallySmooth.of_separated_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f)
    (he : 𝒞.etale f) : IsCohomologicallySmooth f := by sorry

lemma dualizingComplex_etale {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f) (he : 𝒞.etale f) :
    Nonempty (dualizingComplex (IsCohomologicallySmooth.of_separated_etale f hs he) ≅ 𝒞.unitObj X) := by
  sorry

-- `dualizingComplex_restrictScalars` needs two coefficient rings; listed at the end.

-- unit test `IsCohomologicallySmooth.id`
example (X : 𝒞.V) (hs : 𝒞.separated (𝟙 X)) (he : 𝒞.etale (𝟙 X)) : IsCohomologicallySmooth (𝟙 X) :=
  IsCohomologicallySmooth.of_separated_etale _ hs he

-- unit test `IsCohomologicallySmooth.ball`: stated in S5 (`Ball.isCohomologicallySmooth`).

-- unit test `not_isCohomologicallySmooth_profinite`: a map whose Rf^! has a non-invertible
-- value on Λ after a strictly totally disconnected base change is not smooth.
example {X Y : 𝒞.V} (f : X ⟶ Y) (hf : IsEligible f) (hY : 𝒞.strictlyTotallyDisconnected Y)
    (hni : ¬ IsInvertibleObject ((upperShriek f hf).obj (𝒞.unitObj Y))) : ¬ IsCohomologicallySmooth f := by
  intro h
  exact hni h.upperShriek_twist.2

-- unit test `not_isCohomologicallySmooth_origin`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hno : ¬ 𝒞.universallyOpen f) : ¬ IsCohomologicallySmooth f :=
  fun h => hno h.isUniversallyOpen

-- unit test `dualizingComplex_id`
example (X : 𝒞.V) (hs : 𝒞.separated (𝟙 X)) (he : 𝒞.etale (𝟙 X)) :
    Nonempty (dualizingComplex (IsCohomologicallySmooth.of_separated_etale (𝟙 X) hs he) ≅ 𝒞.unitObj X) :=
  dualizingComplex_etale _ hs he

-- unit test `dualizingComplex_ball`: stated in S5 (`Ball.dualizingComplex_iso`).

-- unit test `dualizingComplex_finiteEtale`
example {X Y : 𝒞.V} (f : X ⟶ Y) (hs : 𝒞.separated f) (he : 𝒞.etale f) (hfe : 𝒞.finiteEtale f) :
    Nonempty (dualizingComplex (IsCohomologicallySmooth.of_separated_etale f hs he) ≅ 𝒞.unitObj X) :=
  dualizingComplex_etale f hs he

-- unit test `dualizingComplex_not_const_profinite`: as `not_isCohomologicallySmooth_profinite`.

end S4

/-! ## S5. Examples: the ball, quotients and analytic smooth maps -/
section S5

/-- `S5/perfectoid-ball`: the v-sheaf B(R, R⁺) = R⁺ (data over the supplier's site). -/
def Ball : 𝒞.V := by sorry

/-- The Tate twist Λ(d) on `X` (`S5/tate-twist`). -/
def tateTwist (X : 𝒞.V) (d : ℤ) : 𝒞.D X := by sorry

variable {𝒞}

lemma Ball.isCompactifiable : IsCompactifiable (𝒞.toPt (Ball 𝒞)) := by sorry

lemma Ball.isSpatialEligible : IsSpatialEligible (𝒞.toPt (Ball 𝒞)) := by sorry

/-- Maps from an affinoid perfectoid `T = Spa(R, R⁺)` to `B` are elements of `R⁺`; `plus T`
is the supplier's `O⁺(T)` (D2). -/
lemma Ball.app (plus : 𝒞.V → Type) (T : 𝒞.V) (hT : 𝒞.strictlyTotallyDisconnected T) :
    Nonempty ((T ⟶ Ball 𝒞) ≃ plus T) := by sorry

/-- The universal coordinate `T ∈ O⁺(B)`, given the identification of `Ball.app`. -/
def Ball.coordinate (plus : 𝒞.V → Type) (e : ∀ T : 𝒞.V, (T ⟶ Ball 𝒞) ≃ plus T) : plus (Ball 𝒞) :=
  e _ (𝟙 _)

lemma Ball.isCohomologicallySmooth : IsCohomologicallySmooth (𝒞.toPt (Ball 𝒞)) := by sorry

/-- `S5/ball-smooth` (ECD 24.1): D_f ≅ Λ(1)[2]. -/
theorem Ball.dualizingComplex_iso :
    Nonempty (dualizingComplex (Ball.isCohomologicallySmooth (𝒞 := 𝒞)) ≅ (tateTwist 𝒞 (Ball 𝒞) 1)⟦(2 : ℤ)⟧) := by
  sorry

lemma tateTwist_zero (X : 𝒞.V) : Nonempty (tateTwist 𝒞 X 0 ≅ 𝒞.unitObj X) := by sorry

lemma tateTwist_add (X : 𝒞.V) (a b : ℤ) :
    Nonempty (((𝒞.tensor X).obj (tateTwist 𝒞 X a)).obj (tateTwist 𝒞 X b) ≅ tateTwist 𝒞 X (a + b)) := by sorry

lemma tateTwist_isInvertible (X : 𝒞.V) (d : ℤ) : IsInvertibleObject (tateTwist 𝒞 X d) := by sorry

lemma tateTwist_pullback {X Y : 𝒞.V} (f : X ⟶ Y) (d : ℤ) :
    Nonempty ((𝒞.pull f).obj (tateTwist 𝒞 Y d) ≅ tateTwist 𝒞 X d) := by sorry

lemma tateTwist_trivialise (X : 𝒞.V) (hX : 𝒞.strictlyTotallyDisconnected X) (d : ℤ) :
    Nonempty (tateTwist 𝒞 X d ≅ 𝒞.unitObj X) := by sorry

-- unit test `tateTwist_zero_test`
example (X : 𝒞.V) : Nonempty (tateTwist 𝒞 X 0 ≅ 𝒞.unitObj X) := tateTwist_zero X

-- unit test `IsInvertibleObject.tate_twist`
example (X : 𝒞.V) : IsInvertibleObject ((tateTwist 𝒞 X 1)⟦(2 : ℤ)⟧) :=
  (tateTwist_isInvertible X 1).shift 2

-- unit test `lowerShriekQC_ball_degree_two`: Rf_!Λ for the ball is concentrated in degree 2.
example : 𝒞.isGE _ 2 ((lowerShriekQC _ (Ball.isSpatialEligible (𝒞 := 𝒞))).obj (𝒞.unitObj _)) ∧
    𝒞.isLE _ 2 ((lowerShriekQC _ (Ball.isSpatialEligible (𝒞 := 𝒞))).obj (𝒞.unitObj _)) := by sorry

-- unit test `IsEligible.ball` / `IsSpatialEligible.ball` / `Ball.dimTrg`
example : IsEligible (𝒞.toPt (Ball 𝒞)) := Ball.isSpatialEligible.isEligible
example : 𝒞.finDimTrg (𝒞.toPt (Ball 𝒞)) := Ball.isSpatialEligible.dimTrg_lt_top

-- unit test `Ball.compactification_ne`: B → * is not partially proper.
example : ¬ 𝒞.partiallyProper (𝒞.toPt (Ball 𝒞)) := by sorry

-- unit test `IsCohomologicallySmooth.ball` and `upperShriek_ball`, `dualizingComplex_ball`,
-- `lowerShriek_ball_point`
example : IsCohomologicallySmooth (𝒞.toPt (Ball 𝒞)) := Ball.isCohomologicallySmooth
example : Nonempty (dualizingComplex (Ball.isCohomologicallySmooth (𝒞 := 𝒞)) ≅ (tateTwist 𝒞 (Ball 𝒞) 1)⟦(2 : ℤ)⟧) :=
  Ball.dualizingComplex_iso

/-- `S5/normalized-haar-measure`: for a profinite group `K` all of whose open indices are
units in `Λ`, the invariant Λ-linear functional of total volume 1 on C⁰(K, Λ). -/
def normalizedHaar (K : Type) [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [CompactSpace K] [TotallyDisconnectedSpace K] [T2Space K] (Λ : Type) [CommRing Λ]
    [TopologicalSpace Λ] [DiscreteTopology Λ]
    (hunit : ∀ H : OpenSubgroup K, IsUnit ((H : Subgroup K).index : Λ)) :
    LocallyConstant K Λ →ₗ[Λ] Λ := by sorry

section Haar
variable (K : Type) [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [CompactSpace K] [TotallyDisconnectedSpace K] [T2Space K] (Λ : Type) [CommRing Λ]
    [TopologicalSpace Λ] [DiscreteTopology Λ]
    (hunit : ∀ H : OpenSubgroup K, IsUnit ((H : Subgroup K).index : Λ))

lemma normalizedHaar_one : normalizedHaar K Λ hunit 1 = 1 := by sorry

open Classical in
lemma normalizedHaar_indicator (H : OpenSubgroup K) (g : K) (φ : LocallyConstant K Λ)
    (hφ : ∀ x, φ x = if x ∈ (fun y => g * y) '' (H : Set K) then 1 else 0) :
    normalizedHaar K Λ hunit φ * ((H : Subgroup K).index : Λ) = 1 := by sorry

lemma normalizedHaar_translate (k : K) (φ ψ : LocallyConstant K Λ) (h : ∀ x, ψ x = φ (k * x)) :
    normalizedHaar K Λ hunit ψ = normalizedHaar K Λ hunit φ := by sorry

include hunit in
lemma normalizedHaar_index_isUnit (H : OpenSubgroup K) : IsUnit ((H : Subgroup K).index : Λ) := hunit H

lemma normalizedHaar_finite [Finite K] [DiscreteTopology K] [Fintype K] (φ : LocallyConstant K Λ) :
    normalizedHaar K Λ hunit φ * (Fintype.card K : Λ) = ∑ k, φ k := by sorry

-- `normalizedHaar_pushforward` (compatibility with quotients K → K/N) is listed at the end.

-- unit test `normalizedHaar_trivial`
example [Subsingleton K] (φ : LocallyConstant K Λ) : normalizedHaar K Λ hunit φ = φ 1 := by sorry

end Haar

-- unit test `not_exists_normalizedHaar_proEll`: if some open index is not a unit there is no
-- invariant functional of total volume one (recorded for a finite quotient of order `ℓ`).
example (Λ : Type) [CommRing Λ] (ℓ : ℕ) (hℓ : ¬ IsUnit (ℓ : Λ)) (μ : (ZMod ℓ → Λ) →ₗ[Λ] Λ)
    [NeZero ℓ] (hinv : ∀ (a : ZMod ℓ) (φ : ZMod ℓ → Λ), μ (fun x => φ (x + a)) = μ φ)
    (hone : μ (fun _ => 1) = 1) : False := by sorry

/-- `S5/averaging-transformation`: `q^* → Rq^!` for a profinite quotient `q`. -/
def averagingTransformation {X Y : 𝒞.V} (q : X ⟶ Y) (hq : IsEligible q) :
    𝒞.pull q ⟶ upperShriek q hq := by sorry

lemma averagingTransformation_finite {X Y : 𝒞.V} (q : X ⟶ Y) (hs : 𝒞.separated q) (he : 𝒞.etale q)
    (hfe : 𝒞.finiteEtale q) : IsIso (averagingTransformation q (IsEligible.of_separated_etale q hs he)) := by
  sorry

/-- The normalised trace `q_* q^* → id` splits the unit of `q^* ⊣ q_*`; `averagingTransformation`
is its adjoint. -/
lemma averagingTransformation_trace {X Y : 𝒞.V} (q : X ⟶ Y) (hq : IsEligible q) :
    ∃ tr : 𝒞.pull q ⋙ 𝒞.push q ⟶ 𝟭 _, ∀ F, (𝒞.pullPushAdj q).unit.app F ≫ tr.app F = 𝟙 F := by sorry

lemma averagingTransformation_comp_unit {X Y : 𝒞.V} (q : X ⟶ Y) (hq : IsEligible q) (F : 𝒞.D Y) :
    ∃ (r : (𝒞.push q).obj ((𝒞.pull q).obj F) ⟶ F), (𝒞.pullPushAdj q).unit.app F ≫ r = 𝟙 F := by sorry

-- `averagingTransformation_baseChange` and `averagingTransformation_restrict_subgroup` are
-- pasting identities; they are listed at the end of the file.

-- unit test `averagingTransformation_trivial_group`
example (X : 𝒞.V) (hs : 𝒞.separated (𝟙 X)) (he : 𝒞.etale (𝟙 X)) (hfe : 𝒞.finiteEtale (𝟙 X)) :
    IsIso (averagingTransformation (𝟙 X) (IsEligible.of_separated_etale _ hs he)) :=
  averagingTransformation_finite _ hs he hfe

-- unit test `averagingTransformation_finite_free`
example {X Y : 𝒞.V} (q : X ⟶ Y) (hs : 𝒞.separated q) (he : 𝒞.etale q) (hfe : 𝒞.finiteEtale q) :
    IsIso (averagingTransformation q (IsEligible.of_separated_etale q hs he)) :=
  averagingTransformation_finite q hs he hfe

-- unit test `averagingTransformation_not_iso_profinite`: if Rq^! does not commute with countable
-- sums, the averaging map is not an isomorphism (pullback commutes with sums).
example {X Y : 𝒞.V} (q : X ⟶ Y) (hq : IsEligible q)
    (hns : ¬ PreservesColimitsOfShape (Discrete ℕ) (upperShriek q hq)) :
    ¬ IsIso (averagingTransformation q hq) := by
  intro h
  have := (𝒞.pullPushAdj q).leftAdjoint_preservesColimits
  exact hns (preservesColimitsOfShape_of_natIso (asIso (averagingTransformation q hq)))

-- unit test `averagingTransformation_proEll_unavailable`: as `not_exists_normalizedHaar_proEll`.

/-- `S5/free-quotient-smooth` (ECD 24.2, ℓ-power-torsion Λ: E100): `f/K` smooth and
`Rf^! ≅ q^* R(f/K)^!`, with `q : X ⟶ XK` the quotient and `fK : XK ⟶ Y`. -/
theorem IsCohomologicallySmooth.quotient_free {X XK Y : 𝒞.V} (q : X ⟶ XK) (fK : XK ⟶ Y)
    (hf : IsCohomologicallySmooth (q ≫ fK)) (hq : 𝒞.proper q) (hqe : 𝒞.quasiProEtale q)
    (hfree : ∀ (T : 𝒞.V) (t : T ⟶ XK), 𝒞.strictlyTotallyDisconnected T → ∃ s : T ⟶ X, s ≫ q = t) :
    ∃ h : IsCohomologicallySmooth fK,
      Nonempty (upperShriek (q ≫ fK) hf.isEligible ≅ upperShriek fK h.isEligible ⋙ 𝒞.pull q) := by sorry

/-- `S5/profinite-quotient-upper-shriek`: Rq^! is not q^* (distributions), recorded as the
non-isomorphism for a quasi-pro-étale proper `q` whose `Rq_*Λ` is not a finite sum. -/
theorem profiniteProjection_upperShriek_distributions {X Y : 𝒞.V} (q : X ⟶ Y) (hq : IsEligible q)
    (hns : ¬ PreservesColimitsOfShape (Discrete ℕ) (upperShriek q hq)) :
    ¬ Nonempty (upperShriek q hq ≅ 𝒞.pull q) := by
  rintro ⟨e⟩
  have := (𝒞.pullPushAdj q).leftAdjoint_preservesColimits
  exact hns (preservesColimitsOfShape_of_natIso e.symm)

/-- `S5/nonfree-quotient-smooth` (ECD 24.3, with the fibrewise hypothesis). -/
theorem IsCohomologicallySmooth.quotient_nonfree {X XK Y : 𝒞.V} (q : X ⟶ XK) (fK : XK ⟶ Y)
    (hf : IsCohomologicallySmooth (q ≫ fK)) (hq : 𝒞.proper q) (hqe : 𝒞.quasiProEtale q)
    (hsurj : 𝒞.surjective q) (hsfK : 𝒞.separated fK) (hrfK : 𝒞.reprLocSpatial fK)
    (hfib : ∀ (T : 𝒞.V) (t : T ⟶ Y), 𝒞.strictlyTotallyDisconnected T → IsCohomologicallySmooth (pullback.snd fK t)) :
    ∃ h : IsCohomologicallySmooth fK,
      Nonempty (upperShriek (q ≫ fK) hf.isEligible ≅ upperShriek fK h.isEligible ⋙ 𝒞.pull q) := by sorry

/-- `S5/analytic-smooth-is-cohomologically-smooth` (ECD 24.4): `diamond` is the supplier's
diamond functor on analytic adic spaces over ℤ_p (D6) and `IsSmoothAdic` AdicEtaleGeometry
A2's 'locally étale over a relative ball'. -/
theorem IsCohomologicallySmooth.of_adic_smooth (Adic : Type u) [Category.{v} Adic]
    (diamond : Adic ⥤ 𝒞.V) (IsSmoothAdic : MorphismProperty Adic) (separatedAdic : MorphismProperty Adic)
    {Y' Y : Adic} (f : Y' ⟶ Y) (hf : IsSmoothAdic f) (hs : separatedAdic f) :
    IsCohomologicallySmooth (diamond.map f) := by sorry

/-- `S5/spd-qp-smooth` (ECD 24.5): `SpdQp` is the supplier's `(Spa ℚ_p)^♢` (D6). -/
theorem SpdQp.isCohomologicallySmooth (SpdQp : 𝒞.V) : IsCohomologicallySmooth (𝒞.toPt SpdQp) := by sorry

/-- `S5/geometric-base-criterion` (ECD 24.6); `ballOpens X` are the open subsets of finite-
dimensional balls over the perfectoid `X`. -/
theorem isCohomologicallySmooth_iff_geometricBase {Y X : 𝒞.V} (f : Y ⟶ X) (hf : IsEligible f)
    (ballOpens : Set (Σ T : 𝒞.V, T ⟶ X)) :
    IsCohomologicallySmooth f ↔ (𝒞.separated f ∧ IsInvertibleObject ((upperShriek f hf).obj (𝒞.unitObj X)) ∧
      ∀ p ∈ ballOpens, IsIso (twistedPullbackTransformation (pullback.snd f p.2) (hf.baseChange p.2))) := by sorry

end S5

/-! ## S6. Biduality and conservativity -/
section S6
variable {𝒞}

/-- `S6/verdier-dual`: 𝔻_X = RHom(−, Rf^!Λ) for `f : X ⟶ S` eligible. -/
def verdierDual {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) : (𝒞.D X)ᵒᵖ ⥤ 𝒞.D X :=
  𝒞.ihom X ⋙ (evaluation (𝒞.D X) (𝒞.D X)).obj (dualizingObject f hf)

/-- The naive dual RHom(−, Λ). -/
def naiveDual (X : 𝒞.V) : (𝒞.D X)ᵒᵖ ⥤ 𝒞.D X :=
  𝒞.ihom X ⋙ (evaluation (𝒞.D X) (𝒞.D X)).obj (𝒞.unitObj X)

lemma verdierDual_apply {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) (A : 𝒞.D X) :
    (verdierDual f hf).obj (Opposite.op A) = ((𝒞.ihom X).obj (Opposite.op A)).obj (dualizingObject f hf) := rfl

lemma verdierDual_const {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) :
    Nonempty ((verdierDual f hf).obj (Opposite.op (𝒞.unitObj X)) ≅ dualizingObject f hf) := by sorry

lemma verdierDual_eq_naive_tensor {X S : 𝒞.V} {f : X ⟶ S} (h : IsCohomologicallySmooth f) (A : 𝒞.D X) :
    Nonempty ((verdierDual f h.isEligible).obj (Opposite.op A) ≅
      ((𝒞.tensor X).obj ((naiveDual X).obj (Opposite.op A))).obj (dualizingComplex h)) := by sorry

/-- The biduality map A → 𝔻𝔻A. -/
def bidualityMap {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) (A : 𝒞.D X) :
    A ⟶ (verdierDual f hf).obj (Opposite.op ((verdierDual f hf).obj (Opposite.op A))) := by sorry

lemma verdierDual_globalSections {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) (A : 𝒞.D X) :
    Nonempty ((𝒞.push f).obj ((verdierDual f hf).obj (Opposite.op A)) ≅
      ((𝒞.ihom S).obj (Opposite.op ((lowerShriek f hf).obj A))).obj (𝒞.unitObj S)) := by sorry

lemma verdierDual_extendByZero {U X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) (j : U ⟶ X)
    (hj : 𝒞.openImmersion j) :
    Nonempty ((naiveDual X).obj (Opposite.op ((𝒞.openShriek j hj).obj (𝒞.unitObj U))) ≅
      (𝒞.push j).obj (𝒞.unitObj U)) := by sorry

lemma verdierDual_pullback_smooth {X X' S : 𝒞.V} (g : X' ⟶ X) (hg : IsCohomologicallySmooth g)
    (A B : 𝒞.D X) :
    Nonempty ((𝒞.pull g).obj (((𝒞.ihom X).obj (Opposite.op A)).obj B) ≅
      ((𝒞.ihom X').obj (Opposite.op ((𝒞.pull g).obj A))).obj ((𝒞.pull g).obj B)) :=
  hg.pullback_internalHom A B

/-- `S6/biduality` (ECD 25.1): over `S = Spa(C, O_C)` (`hgeom`), smooth separated `X`,
bounded constructible `A`. -/
theorem biduality {X S : 𝒞.V} {f : X ⟶ S} (h : IsCohomologicallySmooth f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S) (hX : 𝒞.locallySpatial X) (A : 𝒞.D X)
    (hA : 𝒞.constructible X A) : IsIso (bidualityMap f h.isEligible A) := by sorry

/-- `S6/finiteness-of-cohomology` (25.1, last assertion): `RΓ(X, A)` is constructible
(bounded with finite cohomology) on the point. -/
theorem finite_cohomology_of_smooth {X S : 𝒞.V} {f : X ⟶ S} (h : IsCohomologicallySmooth f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S) (hqc : 𝒞.quasicompact f) (A : 𝒞.D X)
    (hA : 𝒞.constructible X A) : 𝒞.constructible S ((𝒞.push f).obj A) := by sorry

/-- `S6/biduality-counterexample` (Remark 25.2): for the generic point `j` of Spa(C, C⁺), the
naive dual of `j_!Λ` is `Rj_*Λ = Λ`, so `j_!Λ` is not reflexive. -/
theorem not_biduality_valuedPlus {U X : 𝒞.V} (j : U ⟶ X) (hj : 𝒞.openImmersion j)
    (hpush : Nonempty ((𝒞.push j).obj (𝒞.unitObj U) ≅ 𝒞.unitObj X))
    (hne : IsEmpty ((𝒞.openShriek j hj).obj (𝒞.unitObj U) ≅ 𝒞.unitObj X)) :
    IsEmpty ((naiveDual X).obj (Opposite.op ((naiveDual X).obj (Opposite.op ((𝒞.openShriek j hj).obj (𝒞.unitObj U))))) ≅
      (𝒞.openShriek j hj).obj (𝒞.unitObj U)) := by sorry

/-- `S6/biduality-torsion-coefficients` (Remark 25.3, E65): perfect-constructible objects. -/
theorem biduality_ellTorsion {X S : 𝒞.V} {f : X ⟶ S} (h : IsCohomologicallySmooth f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S) (A : 𝒞.D X) (hA : 𝒞.perfectConstructible X A) :
    IsIso (bidualityMap f h.isEligible A) := by sorry

theorem perfect_globalSections {X S : 𝒞.V} {f : X ⟶ S} (h : IsCohomologicallySmooth f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S) (hqc : 𝒞.quasicompact f) (A : 𝒞.D X)
    (hA : 𝒞.perfectConstructible X A) : 𝒞.perfectConstructible S ((𝒞.push f).obj A) := by sorry

/-- `S6/closed-points-detect-vanishing`: the topological input, stated on Mathlib's
`JacobsonSpace` for a sheaf-theoretic support predicate `supp` (support of each section is
locally closed). -/
theorem closedPoints_detect_zero (T : Type) [TopologicalSpace T] [JacobsonSpace T]
    (Z : Set T) (hZ : IsLocallyClosed Z) (hne : Z.Nonempty) :
    (Z ∩ closedPoints T).Nonempty := nonempty_inter_closedPoints hne hZ

/-- `S6/verdier-conservativity` (ECD 25.4). -/
theorem verdierDual_conservative {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S) (A : 𝒞.D X)
    (h0 : Limits.IsZero ((verdierDual f hf).obj (Opposite.op A))) : Limits.IsZero A := by sorry

/-- `S6/conservativity-counterexample` (Remark 25.5): a nonzero object with zero naive dual. -/
theorem not_verdierDual_conservative_valuedPlus {X : 𝒞.V} (B : 𝒞.D X)
    (hB : ¬ Limits.IsZero B) (h0 : Limits.IsZero ((naiveDual X).obj (Opposite.op B))) :
    ¬ ∀ A : 𝒞.D X, Limits.IsZero ((naiveDual X).obj (Opposite.op A)) → Limits.IsZero A :=
  fun h => hB (h B h0)

/-- `S6/conservativity-general-coefficients` (Remark 25.6, conditional; E101): under the
ring hypothesis `hring` (RHom(M, Λ) = 0 ⇒ M = 0 on the point). -/
theorem verdierDual_conservative_of_ring {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f)
    (hgeom : 𝒞.strictlyTotallyDisconnected S)
    (hring : ∀ M : 𝒞.D S, Limits.IsZero ((naiveDual S).obj (Opposite.op M)) → Limits.IsZero M)
    (A : 𝒞.D X) (h0 : Limits.IsZero ((verdierDual f hf).obj (Opposite.op A))) : Limits.IsZero A := by sorry

-- unit test `verdierDual_point`
example (S : 𝒞.V) (h : IsEligible (𝟙 S)) (A : 𝒞.D S) (e : upperShriek (𝟙 S) h ≅ 𝟭 _) :
    Nonempty ((verdierDual (𝟙 S) h).obj (Opposite.op A) ≅ (naiveDual S).obj (Opposite.op A)) := by sorry

-- unit test `verdierDual_ball`
example : Nonempty ((verdierDual (𝒞.toPt (Ball 𝒞)) Ball.isSpatialEligible.isEligible).obj
    (Opposite.op (𝒞.unitObj _)) ≅ (tateTwist 𝒞 (Ball 𝒞) 1)⟦(2 : ℤ)⟧) := by sorry

-- unit test `naiveDual_extendByZero_valuedPlus`: as `not_biduality_valuedPlus`.

-- unit test `verdierDual_contravariant`: 𝔻(A⟦1⟧) ≅ (𝔻A)⟦-1⟧.
example {X S : 𝒞.V} (f : X ⟶ S) (hf : IsEligible f) (A : 𝒞.D X) :
    Nonempty ((verdierDual f hf).obj (Opposite.op (A⟦(1 : ℤ)⟧)) ≅ ((verdierDual f hf).obj (Opposite.op A))⟦(-1 : ℤ)⟧) := by
  sorry

end S6

/-!
## Signatures not prototyped against this interface

The following packet names need two coefficient rings over one geometry, pasting
identities of natural transformations, or concrete objects (Spa(C, C⁺), profinite groups
acting on diamonds) that the one-coefficient homotopy-level interface above does not
name. They are specified in the roadmap document and are prototyped once the supplier
declarations exist:
`upperShriek_restrictScalars` (Remark 23.2), `IsInvertibleObject.of_reduction`,
`dualizingComplex_restrictScalars`, `shriekTrace_comp`, `shriekTrace_finiteEtale_degree`,
`normalizedHaar_pushforward`, `averagingTransformation_baseChange`,
`averagingTransformation_restrict_subgroup`, `normalizedHaar_Zp`, `normalizedHaar_finite_cyclic`,
`hypercoverSupportDiagram_homotopy_category_insufficient`, `tateTwist_classical`,
`tateTwist_point`, `tateTwist_not_const_Qp`, `Ball.prod_affinoid`, `Ball.diamond_relativeBall`,
`Ball.openDisc`, `Ball.point_C`, `Ball.prod_point`, `IsEligible.openDisc`,
`IsLocallySplit.trivial_torsor` (as stated above for a sectioned projection),
`not_isCohomologicallySmooth_profinite` (as stated above through non-invertibility).
-/
end TauCeti.DiamondSixOperations
